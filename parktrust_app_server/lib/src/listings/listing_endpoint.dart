import 'dart:math';

import 'package:serverpod/serverpod.dart';

import '../alerts/alert_helpers.dart';
import '../generated/protocol.dart';
import '../subscriptions/membership_helpers.dart';
import 'demo_listings_data.dart';

/// Drivers list their own parking space, and others search for one.
class ListingEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  static const _hiddenAddress = 'Shown after you book';

  // Demo spaces belong to this fixed, non-real host id.
  static final demoHost = UuidValue.fromString(
    '00000000-0000-4000-8000-000000000001',
  );

  /// Loads the demo spaces (from the old ParkTrust data) once.
  Future<void> _seedDemo(Session session) async {
    final count = await Listing.db.count(
      session,
      where: (t) => t.ownerId.equals(demoHost),
    );
    if (count > 0) return;
    await Listing.db.insert(
      session,
      demoListingRows
          .map(
            (r) => Listing(
              ownerId: demoHost,
              title: r[0] as String,
              description: r[1] as String?,
              area: r[2] as String,
              address: r[3] as String,
              latitude: (r[4] as num).toDouble(),
              longitude: (r[5] as num).toDouble(),
              ratePerHour: (r[6] as num).toInt(),
              capacity: (r[7] as num).toInt(),
              hasEv: r[8] == 1,
              hasCctv: r[9] == 1,
              covered: r[10] == 1,
              gated: r[11] == 1,
              active: true,
            ),
          )
          .toList(),
    );
  }

  Future<Listing> createListing(
    Session session,
    String title,
    String? description,
    String area,
    String address,
    double latitude,
    double longitude,
    int ratePerHour,
    int capacity,
    bool hasEv,
    bool hasCctv,
    bool covered,
    bool gated,
  ) async {
    final userId = requireUserId(session);
    await requireMembership(session, userId);
    final cleanTitle = title.trim();
    if (cleanTitle.length < 3 || cleanTitle.length > 60) {
      throw AlertException(message: 'Give the space a title (3 to 60 letters).');
    }
    if (area.trim().isEmpty || address.trim().isEmpty) {
      throw AlertException(message: 'Add the area and the full address.');
    }
    if (latitude < -90 || latitude > 90 || longitude < -180 || longitude > 180) {
      throw AlertException(message: 'Pick the location on the map.');
    }
    if (ratePerHour < 1 || ratePerHour > 5000) {
      throw AlertException(message: 'Price must be between 1 and 5000 rupees per hour.');
    }
    if (capacity < 1 || capacity > 50) {
      throw AlertException(message: 'Spaces must be between 1 and 50.');
    }
    final count = await Listing.db.count(
      session,
      where: (t) => t.ownerId.equals(userId),
    );
    if (count >= 10) {
      throw AlertException(message: 'You can list up to 10 spaces.');
    }
    final desc = description?.trim();
    return Listing.db.insertRow(
      session,
      Listing(
        ownerId: userId,
        title: cleanTitle,
        description: (desc == null || desc.isEmpty) ? null : desc,
        area: area.trim(),
        address: address.trim(),
        latitude: latitude,
        longitude: longitude,
        ratePerHour: ratePerHour,
        capacity: capacity,
        hasEv: hasEv,
        hasCctv: hasCctv,
        covered: covered,
        gated: gated,
        active: true,
        qrSecret: _newSecret(),
      ),
    );
  }

  /// The signed-in user's own listings, with full addresses.
  Future<List<Listing>> myListings(Session session) async {
    final userId = requireUserId(session);
    final list = await Listing.db.find(
      session,
      where: (t) => t.ownerId.equals(userId),
    );
    list.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return list;
  }

  static String _newSecret() {
    final r = Random.secure();
    return List.generate(16, (_) => r.nextInt(16).toRadixString(16)).join();
  }

  /// The QR text for one of my spaces. The driver scans it at the gate to
  /// check in and out. Only the owner can ask for it.
  Future<String> ownerQr(Session session, int listingId) async {
    final userId = requireUserId(session);
    final listing = await Listing.db.findById(session, listingId);
    if (listing == null || listing.ownerId != userId) {
      throw AlertException(message: 'That space was not found.');
    }
    var secret = listing.qrSecret;
    if (secret.isEmpty) {
      secret = _newSecret();
      await Listing.db.updateRow(session, listing.copyWith(qrSecret: secret));
    }
    return 'PT1:$listingId:$secret';
  }

  /// Pause or resume a listing. Only its owner can do this.
  Future<Listing> setActive(Session session, int listingId, bool active) async {
    final userId = requireUserId(session);
    final listing = await Listing.db.findById(session, listingId);
    if (listing == null || listing.ownerId != userId) {
      throw AlertException(message: 'That space was not found.');
    }
    return Listing.db.updateRow(session, listing.copyWith(active: active));
  }

  /// Active listings other people have posted. The exact address stays hidden
  /// until a booking exists.
  Future<List<Listing>> search(Session session, String? query) async {
    final userId = requireUserId(session);
    await _seedDemo(session);
    final all = await Listing.db.find(
      session,
      where: (t) => t.active.equals(true),
    );
    final q = query?.trim().toLowerCase() ?? '';
    final shown = all
        .where((l) => l.ownerId != userId)
        .where(
          (l) =>
              q.isEmpty ||
              l.title.toLowerCase().contains(q) ||
              l.area.toLowerCase().contains(q) ||
              l.address.toLowerCase().contains(q),
        )
        .map(
          (l) => l.copyWith(
            address: _hiddenAddress,
            qrSecret: '',
            // About 1 km accuracy until booked. The exact spot comes with the booking.
            latitude: double.parse(l.latitude.toStringAsFixed(2)),
            longitude: double.parse(l.longitude.toStringAsFixed(2)),
          ),
        )
        .toList();
    shown.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return shown.length > 60 ? shown.sublist(0, 60) : shown;
  }
}
