import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/plate_utils.dart';
import '../../providers/client_provider.dart';
import '../../providers/market_provider.dart';
import '../../widgets/common.dart';

/// The business model: a weekly, monthly or yearly fee. No fee per booking.
class MembershipCard extends ConsumerWidget {
  const MembershipCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final member = ref.watch(membershipProvider);
    final plans = ref.watch(plansProvider);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: member.when(
          loading: () => const LoadingView(),
          error: (e, _) => Text(errorText(e)),
          data: (m) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Membership', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 4),
              Text(
                m == null
                    ? 'Join a plan to book spaces and list your own. One flat fee, no charge per booking.'
                    : '${m.plan[0].toUpperCase()}${m.plan.substring(1)} plan active until ${dateTimeText(m.endsAt)}.',
              ),
              const SizedBox(height: 12),
              plans.when(
                loading: () => const LinearProgressIndicator(),
                error: (e, _) => Text(errorText(e)),
                data: (list) => Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final p in list)
                      OutlinedButton(
                        onPressed: () async {
                          try {
                            await ref.read(clientProvider).subscription.subscribe(p.code);
                            ref.invalidate(membershipProvider);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('${p.name} plan added (simulated payment).')),
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorText(e))));
                            }
                          }
                        },
                        child: Text('${p.name} ${rupees(p.price)}'),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
