import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parktrust_app_client/parktrust_app_client.dart';

import '../app/theme.dart';
import '../core/plate_utils.dart';
import '../providers/market_provider.dart';

/// Latest ratings and comments for one person.
class ReviewsList extends ConsumerWidget {
  const ReviewsList({super.key, required this.userId, this.title = 'What people say'});
  final UuidValue? userId;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviews = ref.watch(reviewsProvider(userId));
    return reviews.when(
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
      data: (list) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          if (list.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Text('No ratings yet.'),
            ),
          for (final r in list)
            ListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: safetyYellow, size: 18),
                  Text(' ${r.rating}'),
                ],
              ),
              title: Text(r.comment ?? 'No comment'),
              subtitle: Text(dateTimeText(r.createdAt)),
            ),
        ],
      ),
    );
  }
}
