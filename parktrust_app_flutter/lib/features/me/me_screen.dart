import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/market_provider.dart';
import '../../widgets/common.dart';
import '../../widgets/trust_badge.dart';
import '../vehicles/my_cars_screen.dart';
import 'membership_card.dart';
import '../../widgets/reviews_list.dart';

/// My trust score and my cars.
class MeScreen extends ConsumerWidget {
  const MeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trust = ref.watch(trustProvider(null));
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: MembershipCard(),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: trust.when(
                loading: () => const LoadingView(),
                error: (e, _) => const Text('Could not load your trust score.'),
                data: (t) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('${t.score}', style: Theme.of(context).textTheme.displaySmall),
                        const SizedBox(width: 12),
                        const TrustBadge(userId: null),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${t.completedBookings} finished bookings · '
                      '${t.ratingCount == 0 ? 'no ratings yet' : '${t.averageRating!.toStringAsFixed(1)} stars from ${t.ratingCount}'}'
                      '${t.overstays > 0 ? ' · ${t.overstays} overstays' : ''}',
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Your score starts at 60. Finished bookings and good ratings raise it, overstays lower it.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: ReviewsList(userId: null, title: 'Ratings I received'),
        ),
        const MyCarsScreen(),
      ],
    );
  }
}
