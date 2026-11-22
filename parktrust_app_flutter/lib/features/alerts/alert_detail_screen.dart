import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parktrust_app_client/parktrust_app_client.dart';

import '../../core/plate_utils.dart';
import '../../providers/alerts_provider.dart';
import '../../providers/client_provider.dart';
import '../../widgets/common.dart';

/// Features 3 and 4: one alert, live. The owner answers with one tap and the
/// reporter sees the answer appear straight away.
class AlertDetailScreen extends ConsumerWidget {
  const AlertDetailScreen({super.key, required this.alertId});
  final int alertId;

  Future<void> _run(BuildContext context, Future<void> Function() action) async {
    try {
      await action();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorText(e))));
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thread = ref.watch(threadProvider(alertId));
    final api = ref.read(clientProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('ALERT')),
      body: thread.when(
        loading: () => const LoadingView(),
        error: (e, _) => ErrorView(
          message: errorText(e),
          onRetry: () => ref.invalidate(threadProvider(alertId)),
        ),
        data: (t) {
          final a = t.alert;
          final photo = a.photo;
          final resolved = a.status == AlertStatus.resolved;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Row(
                children: [
                  PlateBadge(a.plate, big: true),
                  const Spacer(),
                  StatusChip(a.status),
                ],
              ),
              const SizedBox(height: 12),
              if (photo != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.memory(
                    photo.buffer.asUint8List(photo.offsetInBytes, photo.lengthInBytes),
                    fit: BoxFit.cover,
                    height: 220,
                    width: double.infinity,
                  ),
                ),
              const SizedBox(height: 12),
              Text('Reported at ${timeText(a.createdAt)}'),
              if (a.note != null) Text('Note: ${a.note}'),
              if (a.latitude != null && a.longitude != null)
                Text('Location: ${a.latitude!.toStringAsFixed(5)}, ${a.longitude!.toStringAsFixed(5)}'),
              const SizedBox(height: 16),
              Text('Replies', style: Theme.of(context).textTheme.titleMedium),
              if (t.replies.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text('No reply yet. This screen updates live.'),
                ),
              for (final r in t.replies)
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.directions_car),
                    title: Text(r.message),
                    subtitle: Text(timeText(r.createdAt)),
                  ),
                ),
              const SizedBox(height: 16),
              if (t.viewerIsOwner && !resolved) ...[
                Text('Reply to the person waiting', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                FilledButton(
                  onPressed: () => _run(context, () async {
                    await api.alert.reply(alertId, 'Coming now', 0);
                  }),
                  child: const Text('Coming now'),
                ),
                const SizedBox(height: 8),
                FilledButton.tonal(
                  onPressed: () => _run(context, () async {
                    await api.alert.reply(alertId, 'Back in 5 minutes', 5);
                  }),
                  child: const Text('5 min'),
                ),
                const SizedBox(height: 8),
                FilledButton.tonal(
                  onPressed: () => _run(context, () async {
                    await api.alert.reply(alertId, 'Back in 15 minutes', 15);
                  }),
                  child: const Text('15 min'),
                ),
                const SizedBox(height: 16),
              ],
              if (!resolved)
                OutlinedButton(
                  onPressed: () => _run(context, () async {
                    await api.alert.resolve(alertId);
                  }),
                  child: const Text('Mark as resolved'),
                ),
            ],
          );
        },
      ),
    );
  }
}
