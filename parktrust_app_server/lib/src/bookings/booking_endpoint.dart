import 'dart:typed_data';

import 'package:serverpod/serverpod.dart';

import '../alerts/alert_helpers.dart';
import '../generated/protocol.dart';
import '../listings/listing_endpoint.dart';
import '../subscriptions/membership_helpers.dart';

/// Booking a space, QR check-in and check-out, extending, overstay penalties,
/// cancelling and rating. Payment is simulated. The platform earns from
/// memberships, so there is no fee per booking.
class BookingEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  static const _graceMinutes = 5;
  static const _penaltyPerHour = 100; // rupees, charged per started hour
  static const _ownerPenaltyPercent = 50;
  static const _extendWindowHours = 2;
  static const _freeCancelHours = 2;
  static const _maxPhotoBytes = 300 * 1024;
  static const _payWithinMinutes = 10;

  Future<BookingView> book(
    Session session,
    int listingId,
    String plate,
    DateTime start,
    DateTime end,
    bool payNow,
  ) async {
    final driverId = requireUserId(session);
    await requireMembership(session, driverId);
    final normalized = normalizePlate(plate);
    final listing = await Listing.db.findById(session, listingId);
    if (listing == null || !listing.active) {
      throw AlertException(message: 'This space is not available.');
    }
    if (listing.ownerId == driverId) {
      throw AlertException(message: 'You cannot book your own space.');
    }
    final now = DateTime.now();
    if (!end.isAfter(start)) {
      throw AlertException(message: 'The end time must be after the start.');
    }
    if (start.isBefore(now.subtract(const Duration(minutes: 10)))) {
      throw AlertException(message: 'The start time is in the past.');
    }
    if (start.isAfter(now.add(const Duration(days: 30)))) {
      throw AlertException(message: 'You can book up to 30 days ahead.');
    }
    final minutes = end.difference(start).inMinutes;
    if (minutes > 24 * 60) {
      throw AlertException(message: 'One booking can be up to 24 hours.');
    }
    if (await _taken(session, listing, start, end, exceptBookingId: null)) {
      throw AlertException(message: 'Sorry, that time is already taken.');
    }

    final hours = (minutes / 60).ceil();
    final booking = await Booking.db.insertRow(
      session,
      Booking(
        listingId: listingId,
        driverId: driverId,
        ownerId: listing.ownerId,
        plate: normalized,
        startTime: start,
        endTime: end,
        ratePerHour: listing.ratePerHour,
        baseAmount: hours * listing.ratePerHour,
        commission: 0,
        status: BookingStatus.confirmed,
        // Paid now, or reserved and paid within 10 minutes (simulated payment).
        paymentStatus: payNow ? 'held' : 'unpaid',
      ),
    );
    return _view(session, booking, driverId, withPhoto: false);
  }

  /// One booking in full (with the overstay photo), for its driver or owner.
  Future<BookingView> getBooking(Session session, int bookingId) async {
    final userId = requireUserId(session);
    final b = await _visible(session, bookingId, userId);
    return _view(session, b, userId, withPhoto: true);
  }

  Future<List<BookingView>> myBookings(Session session) async {
    final userId = requireUserId(session);
    final list = await Booking.db.find(
      session,
      where: (t) => t.driverId.equals(userId),
    );
    return _views(session, list, userId);
  }

  Future<List<BookingView>> hostBookings(Session session) async {
    final userId = requireUserId(session);
    final list = await Booking.db.find(
      session,
      where: (t) => t.ownerId.equals(userId),
    );
    return _views(session, list, userId);
  }

  /// Driver arrives and scans the owner's QR. Allowed from 30 minutes before
  /// the start.
  Future<BookingView> checkIn(
    Session session,
    int bookingId,
    String qrPayload,
  ) async {
    final userId = requireUserId(session);
    var b = await _asDriver(session, bookingId, userId);
    b = await _settleExpiry(session, b);
    if (b.status != BookingStatus.confirmed) {
      throw AlertException(message: 'This booking cannot be checked in.');
    }
    if (b.paymentStatus != 'held') {
      throw AlertException(message: 'Pay for this booking first.');
    }
    await _checkQr(session, b, qrPayload);
    final now = DateTime.now();
    if (now.isBefore(b.startTime.subtract(const Duration(minutes: 30)))) {
      throw AlertException(
        message: 'Too early. Check in up to 30 minutes before the start.',
      );
    }
    if (now.isAfter(b.endTime)) {
      throw AlertException(message: 'This booking has ended.');
    }
    final saved = await Booking.db.updateRow(
      session,
      b.copyWith(status: BookingStatus.checkedIn, checkInTime: now),
    );
    return _view(session, saved, userId, withPhoto: false);
  }

  /// Driver leaves and scans the owner's QR again. If the owner reported an
  /// overstay with a photo, the driver pays Rs 100 for each started hour past
  /// the end time, and the owner gets half of it.
  Future<BookingView> checkOut(
    Session session,
    int bookingId,
    String qrPayload,
  ) async {
    final userId = requireUserId(session);
    final b = await _asDriver(session, bookingId, userId);
    if (b.status != BookingStatus.checkedIn) {
      throw AlertException(message: 'You need to check in first.');
    }
    await _checkQr(session, b, qrPayload);
    final now = DateTime.now();
    final lateMin = now.difference(b.endTime).inMinutes;
    var overMinutes = 0;
    var penalty = 0;
    var ownerShare = 0;
    if (b.overstayReportedAt != null && lateMin > _graceMinutes) {
      overMinutes = lateMin;
      penalty = (lateMin / 60).ceil() * _penaltyPerHour;
      ownerShare = (penalty * _ownerPenaltyPercent / 100).round();
    }
    final saved = await Booking.db.updateRow(
      session,
      b.copyWith(
        status: BookingStatus.completed,
        checkOutTime: now,
        overstayMinutes: overMinutes,
        overstayAmount: penalty,
        ownerPenaltyShare: ownerShare,
        paymentStatus: 'released',
      ),
    );
    if (penalty > 0) {
      // The driver's rating drops too: an automatic 1-star from the owner.
      final already = await Review.db.count(
        session,
        where: (t) =>
            t.bookingId.equals(bookingId) & t.reviewerId.equals(b.ownerId),
      );
      if (already == 0) {
        await Review.db.insertRow(
          session,
          Review(
            bookingId: bookingId,
            reviewerId: b.ownerId,
            revieweeId: b.driverId,
            rating: 1,
            comment: 'Overstay penalty',
          ),
        );
      }
    }
    return _view(session, saved, userId, withPhoto: false);
  }

  /// Owner: the car is still there after the end time. A photo is the proof.
  /// From then on Rs 100 per started hour is charged to the driver.
  Future<BookingView> reportOverstay(
    Session session,
    int bookingId,
    ByteData photo,
  ) async {
    final userId = requireUserId(session);
    final b = await Booking.db.findById(session, bookingId);
    if (b == null || b.ownerId != userId) {
      throw AlertException(message: 'That booking was not found.');
    }
    if (b.status != BookingStatus.checkedIn) {
      throw AlertException(message: 'The car is not checked in.');
    }
    if (b.overstayReportedAt != null) {
      throw AlertException(message: 'You already reported this overstay.');
    }
    final now = DateTime.now();
    if (now.isBefore(b.endTime.add(const Duration(minutes: _graceMinutes)))) {
      throw AlertException(
        message: 'You can report once the time is over by more than 5 minutes.',
      );
    }
    if (photo.lengthInBytes == 0 || photo.lengthInBytes > _maxPhotoBytes) {
      throw AlertException(message: 'Attach a clear photo of the car (under 300 KB).');
    }
    final saved = await Booking.db.updateRow(
      session,
      b.copyWith(overstayReportedAt: now, overstayPhoto: photo),
    );
    return _view(session, saved, userId, withPhoto: true);
  }

  /// The driver shares where they are while on the way. Only the owner of the
  /// space can see it, and only until the driver checks in.
  Future<void> updateLocation(
    Session session,
    int bookingId,
    double latitude,
    double longitude,
  ) async {
    final userId = requireUserId(session);
    final b = await _asDriver(session, bookingId, userId);
    if (b.status != BookingStatus.confirmed) return;
    if (latitude < -90 || latitude > 90 || longitude < -180 || longitude > 180) {
      throw AlertException(message: 'That location is not valid.');
    }
    final now = DateTime.now();
    if (now.isBefore(b.startTime.subtract(const Duration(hours: 2))) ||
        now.isAfter(b.endTime)) {
      return; // Sharing only runs close to the booking time.
    }
    await Booking.db.updateRow(
      session,
      b.copyWith(
        lastLatitude: latitude,
        lastLongitude: longitude,
        lastLocationAt: now,
      ),
    );
  }

  /// Driver adds time. Only in the last 2 hours of the booking, and only if
  /// nobody has booked the space right after.
  Future<BookingView> extend(
    Session session,
    int bookingId,
    int extraHours,
  ) async {
    final userId = requireUserId(session);
    final b = await _asDriver(session, bookingId, userId);
    if (b.status != BookingStatus.confirmed &&
        b.status != BookingStatus.checkedIn) {
      throw AlertException(message: 'This booking cannot be extended.');
    }
    if (extraHours < 1 || extraHours > 6) {
      throw AlertException(message: 'Choose 1 to 6 extra hours.');
    }
    final now = DateTime.now();
    if (now.isAfter(b.endTime)) {
      throw AlertException(message: 'The time is already over.');
    }
    if (now.isBefore(b.endTime.subtract(const Duration(hours: _extendWindowHours)))) {
      throw AlertException(
        message: 'You can extend in the last 2 hours of your booking.',
      );
    }
    final listing = await Listing.db.findById(session, b.listingId);
    if (listing == null) {
      throw AlertException(message: 'That space no longer exists.');
    }
    final newEnd = b.endTime.add(Duration(hours: extraHours));
    if (await _taken(session, listing, b.endTime, newEnd, exceptBookingId: b.id)) {
      throw AlertException(message: 'Someone has booked the space right after you.');
    }
    final saved = await Booking.db.updateRow(
      session,
      b.copyWith(
        endTime: newEnd,
        baseAmount: b.baseAmount + extraHours * b.ratePerHour,
        extensionCount: b.extensionCount + 1,
      ),
    );
    return _view(session, saved, userId, withPhoto: false);
  }

  /// Pay for a reserved slot (simulated). Must be done within 10 minutes.
  Future<BookingView> pay(Session session, int bookingId) async {
    final userId = requireUserId(session);
    var b = await _asDriver(session, bookingId, userId);
    b = await _settleExpiry(session, b);
    if (b.status != BookingStatus.confirmed || b.paymentStatus != 'unpaid') {
      throw AlertException(
        message: b.paymentStatus == 'expired'
            ? 'The 10 minutes ran out and the slot was released. Please book again.'
            : 'This booking does not need payment.',
      );
    }
    final saved = await Booking.db.updateRow(
      session,
      b.copyWith(paymentStatus: 'held'),
    );
    return _view(session, saved, userId, withPhoto: false);
  }

  /// Cancel before arriving. An unpaid reservation costs nothing. If it was
  /// paid, the money comes back only when cancelling more than 2 hours before
  /// the start. Later than that, the payment is kept.
  Future<BookingView> cancel(Session session, int bookingId) async {
    final userId = requireUserId(session);
    var b = await _asDriver(session, bookingId, userId);
    b = await _settleExpiry(session, b);
    if (b.status != BookingStatus.confirmed) {
      throw AlertException(message: 'This booking cannot be cancelled.');
    }
    var refund = 0;
    var payment = 'cancelled';
    if (b.paymentStatus == 'held') {
      final early =
          b.startTime.difference(DateTime.now()) >
          const Duration(hours: _freeCancelHours);
      refund = early ? b.baseAmount : 0;
      payment = early ? 'refunded' : 'not_refunded';
    }
    final saved = await Booking.db.updateRow(
      session,
      b.copyWith(
        status: BookingStatus.cancelled,
        refundAmount: refund,
        paymentStatus: payment,
      ),
    );
    return _view(session, saved, userId, withPhoto: false);
  }

  /// Rate the other side of a completed booking (1 to 5).
  Future<Review> review(
    Session session,
    int bookingId,
    int rating,
    String? comment,
  ) async {
    final userId = requireUserId(session);
    final b = await _visible(session, bookingId, userId);
    if (b.status != BookingStatus.completed) {
      throw AlertException(message: 'You can rate after the booking is complete.');
    }
    if (rating < 1 || rating > 5) {
      throw AlertException(message: 'Choose 1 to 5 stars.');
    }
    final already = await Review.db.count(
      session,
      where: (t) => t.bookingId.equals(bookingId) & t.reviewerId.equals(userId),
    );
    if (already > 0) {
      throw AlertException(message: 'You already rated this booking.');
    }
    final text = comment?.trim();
    if (text != null && text.length > 200) {
      throw AlertException(message: 'Keep the comment under 200 letters.');
    }
    return Review.db.insertRow(
      session,
      Review(
        bookingId: bookingId,
        reviewerId: userId,
        revieweeId: b.driverId == userId ? b.ownerId : b.driverId,
        rating: rating,
        comment: (text == null || text.isEmpty) ? null : text,
      ),
    );
  }

  static const _reportReasons = {
    'overstay',
    'damage',
    'rude',
    'not_as_described',
    'safety',
    'payment',
    'other',
  };

  /// Report a problem with the other side, after the booking is over.
  Future<void> report(
    Session session,
    int bookingId,
    String reason,
    String? details,
  ) async {
    final userId = requireUserId(session);
    final b = await _visible(session, bookingId, userId);
    if (b.status != BookingStatus.completed && b.status != BookingStatus.cancelled) {
      throw AlertException(message: 'You can report after the booking is over.');
    }
    if (!_reportReasons.contains(reason)) {
      throw AlertException(message: 'Choose what went wrong.');
    }
    final text = details?.trim();
    if (text != null && text.length > 300) {
      throw AlertException(message: 'Keep the details under 300 letters.');
    }
    final already = await Report.db.count(
      session,
      where: (t) => t.bookingId.equals(bookingId) & t.reporterId.equals(userId),
    );
    if (already > 0) {
      throw AlertException(message: 'You already reported this booking.');
    }
    await Report.db.insertRow(
      session,
      Report(
        bookingId: bookingId,
        reporterId: userId,
        reportedId: b.driverId == userId ? b.ownerId : b.driverId,
        reason: reason,
        details: (text == null || text.isEmpty) ? null : text,
      ),
    );
  }

  // ---- helpers ----

  /// A reservation nobody paid within 10 minutes no longer holds the slot.
  bool _expired(Booking b) =>
      b.status == BookingStatus.confirmed &&
      b.paymentStatus == 'unpaid' &&
      DateTime.now().difference(b.createdAt).inMinutes >= _payWithinMinutes;

  Future<Booking> _settleExpiry(Session session, Booking b) async {
    if (!_expired(b)) return b;
    return Booking.db.updateRow(
      session,
      b.copyWith(status: BookingStatus.cancelled, paymentStatus: 'expired'),
    );
  }

  Future<bool> _taken(
    Session session,
    Listing listing,
    DateTime start,
    DateTime end, {
    required int? exceptBookingId,
  }) async {
    final existing = await Booking.db.find(
      session,
      where: (t) => t.listingId.equals(listing.id!),
    );
    final busy = existing.where(
      (b) =>
          b.id != exceptBookingId &&
          !_expired(b) &&
          (b.status == BookingStatus.confirmed ||
              b.status == BookingStatus.checkedIn) &&
          b.startTime.isBefore(end) &&
          b.endTime.isAfter(start),
    );
    return busy.length >= listing.capacity;
  }

  /// The QR must be the one for this booking's space. Demo spaces (loaded
  /// from the old data, with no real owner) accept the code PT1:DEMO.
  Future<void> _checkQr(Session session, Booking b, String payload) async {
    final listing = await Listing.db.findById(session, b.listingId);
    if (listing == null) {
      throw AlertException(message: 'That space no longer exists.');
    }
    final code = payload.trim();
    final demoOk =
        listing.ownerId == ListingEndpoint.demoHost &&
        code.toUpperCase() == 'PT1:DEMO';
    final realOk =
        listing.qrSecret.isNotEmpty &&
        code == 'PT1:${listing.id}:${listing.qrSecret}';
    if (!demoOk && !realOk) {
      throw AlertException(
        message: 'That QR is not for this space. Scan the owner\'s QR at the gate.',
      );
    }
  }

  Future<Booking> _asDriver(Session session, int bookingId, UuidValue userId) async {
    final b = await Booking.db.findById(session, bookingId);
    if (b == null || b.driverId != userId) {
      throw AlertException(message: 'That booking was not found.');
    }
    return b;
  }

  Future<Booking> _visible(Session session, int bookingId, UuidValue userId) async {
    final b = await Booking.db.findById(session, bookingId);
    if (b == null || (b.driverId != userId && b.ownerId != userId)) {
      throw AlertException(message: 'That booking was not found.');
    }
    return b;
  }

  Future<BookingView> _view(
    Session session,
    Booking b0,
    UuidValue userId, {
    required bool withPhoto,
  }) async {
    final b = await _settleExpiry(session, b0);
    final listing = await Listing.db.findById(session, b.listingId);
    if (listing == null) {
      throw AlertException(message: 'That space no longer exists.');
    }
    final mine = await Review.db.count(
      session,
      where: (t) => t.bookingId.equals(b.id!) & t.reviewerId.equals(userId),
    );
    final reported = await Report.db.count(
      session,
      where: (t) => t.bookingId.equals(b.id!) & t.reporterId.equals(userId),
    );
    return BookingView(
      booking: withPhoto ? b : b.copyWith(overstayPhoto: null),
      listing: listing.copyWith(qrSecret: ''),
      reviewedByMe: mine > 0,
      reportedByMe: reported > 0,
    );
  }

  Future<List<BookingView>> _views(
    Session session,
    List<Booking> list,
    UuidValue userId,
  ) async {
    list.sort((a, b) => b.startTime.compareTo(a.startTime));
    final views = <BookingView>[];
    for (final b in list.take(30)) {
      views.add(await _view(session, b, userId, withPhoto: false));
    }
    return views;
  }
}
