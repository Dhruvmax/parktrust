import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parktrust_app_client/parktrust_app_client.dart';

import '../../core/plate_utils.dart';
import '../../providers/alerts_provider.dart';
import '../../widgets/common.dart';
import 'alert_detail_screen.dart';

class AlertsScreen extends ConsumerWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(tabs: [Tab(text: 'Incoming'), Tab(text: 'Sent')]),
          Expanded(
            child: TabBarView(
              children: [
                _AlertList(
                  alerts: ref.watch(incomingAlertsProvider),
                  onRetry: () => ref.invalidate(incomingAlertsProvider),
                  emptyTitle: 'No alerts for your cars',
                  emptyText: 'If someone blocks one of your cars, it shows up here live.',
                ),
                _AlertList(
                  alerts: ref.watch(sentAlertsProvider),
                  onRetry: () => ref.invalidate(sentAlertsProvider),
                  emptyTitle: 'Nothing sent yet',
                  emptyText: 'Snap a blocking car and your alert will be tracked here.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AlertList extends StatelessWidget {
  const _AlertList({
    required this.alerts,
    required this.onRetry,
    required this.emptyTitle,
    required this.emptyText,
  });
  final AsyncValue<List<BlockAlert>> alerts;
  final VoidCallback onRetry;
  final String emptyTitle;
  final String emptyText;

  @override
  Widget build(BuildContext context) {
    return alerts.when(
      loading: () => const LoadingView(),
      error: (e, _) => ErrorView(
        message: errorText(e),
        onRetry: onRetry,
      ),
      data: (list) => list.isEmpty
          ? EmptyView(icon: Icons.notifications_none, title: emptyTitle, text: emptyText)
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                for (final a in list)
                  Card(
                    child: ListTile(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => AlertDetailScreen(alertId: a.id!)),
                      ),
                      leading: PlateBadge(a.plate),
                      title: Text(timeText(a.createdAt)),
                      subtitle: a.note == null ? null : Text(a.note!),
                      trailing: StatusChip(a.status),
                    ),
                  ),
              ],
            ),
    );
  }
}
