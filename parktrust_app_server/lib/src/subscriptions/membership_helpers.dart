import 'package:serverpod/serverpod.dart';

import '../alerts/alert_helpers.dart';
import '../generated/protocol.dart';

/// The membership that is running now, or null.
Future<Subscription?> activeSubscription(Session session, UuidValue userId) async {
  final all = await Subscription.db.find(
    session,
    where: (t) => t.userId.equals(userId),
  );
  final now = DateTime.now();
  final running = all.where((s) => s.endsAt.isAfter(now)).toList();
  if (running.isEmpty) return null;
  running.sort((a, b) => b.endsAt.compareTo(a.endsAt));
  return running.first;
}

/// Booking and listing need a running membership.
Future<void> requireMembership(Session session, UuidValue userId) async {
  if (await activeSubscription(session, userId) == null) {
    throw AlertException(
      message: 'Join a plan first: open the Me tab and choose Weekly, Monthly or Yearly.',
    );
  }
}
