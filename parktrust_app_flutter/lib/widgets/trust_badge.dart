import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parktrust_app_client/parktrust_app_client.dart';

import '../app/theme.dart';
import '../providers/market_provider.dart';

/// Small trust score pill for any person. Pass null for the signed-in user.
class TrustBadge extends ConsumerWidget {
  const TrustBadge({super.key, required this.userId});
  final UuidValue? userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trust = ref.watch(trustProvider(userId));
    return trust.when(
      loading: () => const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2)),
      error: (_, _) => const SizedBox.shrink(),
      data: (t) {
        final color = t.score >= 85 ? okGreen : (t.score >= 70 ? safetyYellow : Colors.orangeAccent);
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.18),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.verified_user, size: 16, color: color),
              const SizedBox(width: 6),
              Text('Trust ${t.score} · ${t.label}',
                  style: TextStyle(color: color, fontWeight: FontWeight.w700, fontSize: 12)),
            ],
          ),
        );
      },
    );
  }
}
