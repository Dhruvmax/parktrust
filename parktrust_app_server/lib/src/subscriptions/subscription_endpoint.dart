import 'package:serverpod/serverpod.dart';

import '../alerts/alert_helpers.dart';
import '../generated/protocol.dart';
import 'membership_helpers.dart';

/// Membership plans. This is the platform's business model: a flat fee per
/// week, month or year, and no fee per booking. Payment is simulated.
class SubscriptionEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  // Placeholder prices in rupees. Change them here.
  static final _plans = [
    PlanOption(code: 'weekly', name: 'Weekly', price: 149, days: 7),
    PlanOption(code: 'monthly', name: 'Monthly', price: 399, days: 30),
    PlanOption(code: 'yearly', name: 'Yearly', price: 3499, days: 365),
  ];

  Future<List<PlanOption>> plans(Session session) async {
    requireUserId(session);
    return _plans;
  }

  /// My running membership, or null.
  Future<Subscription?> mySubscription(Session session) async {
    final userId = requireUserId(session);
    return activeSubscription(session, userId);
  }

  /// Join or renew. A renewal starts when the current plan ends.
  Future<Subscription> subscribe(Session session, String plan) async {
    final userId = requireUserId(session);
    final option = _plans.where((p) => p.code == plan).firstOrNull;
    if (option == null) {
      throw AlertException(message: 'That plan does not exist.');
    }
    final current = await activeSubscription(session, userId);
    final startsAt = current?.endsAt ?? DateTime.now();
    return Subscription.db.insertRow(
      session,
      Subscription(
        userId: userId,
        plan: option.code,
        amount: option.price,
        startsAt: startsAt,
        endsAt: startsAt.add(Duration(days: option.days)),
      ),
    );
  }
}
