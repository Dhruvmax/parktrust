import 'package:serverpod/serverpod.dart';

import '../alerts/alert_helpers.dart';
import '../generated/protocol.dart';

/// Trust score from real activity: finished bookings, ratings and overstays.
class TrustEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Trust profile for [userId], or for the signed-in user when null.
  Future<TrustProfile> trust(Session session, UuidValue? userId) async {
    final me = requireUserId(session);
    final id = userId ?? me;

    final asDriver = await Booking.db.find(
      session,
      where: (t) => t.driverId.equals(id),
    );
    final asOwner = await Booking.db.find(
      session,
      where: (t) => t.ownerId.equals(id),
    );
    final completed = [...asDriver, ...asOwner]
        .where((b) => b.status == BookingStatus.completed)
        .length;
    final overstays = asDriver.where((b) => b.overstayReportedAt != null).length;

    final reviews = await Review.db.find(
      session,
      where: (t) => t.revieweeId.equals(id),
    );
    final average = reviews.isEmpty
        ? null
        : reviews.map((r) => r.rating).reduce((a, b) => a + b) / reviews.length;

    final reports = await Report.db.count(
      session,
      where: (t) => t.reportedId.equals(id),
    );

    // 60 to start, +3 for each finished booking (up to 10), rating above or
    // below 3 stars moves it up or down, -10 for each penalised overstay.
    var score = 60 + (completed > 10 ? 10 : completed) * 3;
    if (average != null) score += ((average - 3) * 5).round();
    score -= overstays * 10;
    score -= (reports * 3 > 15 ? 15 : reports * 3);
    score = score.clamp(0, 100).toInt();

    return TrustProfile(
      score: score,
      label: score >= 85 ? 'Excellent' : (score >= 70 ? 'Good' : 'Building'),
      completedBookings: completed,
      ratingCount: reviews.length,
      averageRating: average,
      overstays: overstays,
      reports: reports,
    );
  }

  /// The latest ratings and comments people left for [userId] (null is me).
  Future<List<Review>> reviews(Session session, UuidValue? userId) async {
    final me = requireUserId(session);
    final id = userId ?? me;
    final list = await Review.db.find(
      session,
      where: (t) => t.revieweeId.equals(id),
    );
    list.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return list.length > 10 ? list.sublist(0, 10) : list;
  }
}
