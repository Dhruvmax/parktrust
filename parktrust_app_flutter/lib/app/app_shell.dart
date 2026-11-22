import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parktrust_app_client/parktrust_app_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../client.dart';
import '../features/alerts/alert_detail_screen.dart';
import '../features/alerts/alerts_screen.dart';
import '../features/me/me_screen.dart';
import '../features/market/bookings_screen.dart';
import '../features/parking/parking_screen.dart';
import '../features/snap/snap_screen.dart';
import '../providers/alerts_provider.dart';

/// Signed-in home: three tabs and a live banner for new alerts and replies.
class AppShell extends ConsumerStatefulWidget {
  const AppShell({super.key});
  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell> {
  int _tab = 0;

  void _banner(String text, int alertId) {
    if (!mounted) return;
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 6),
        action: SnackBarAction(
          label: 'OPEN',
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => AlertDetailScreen(alertId: alertId)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Live: a new alert for my car.
    ref.listen<AsyncValue<List<BlockAlert>>>(incomingAlertsProvider, (prev, next) {
      final before = prev?.value;
      final now = next.value;
      if (before == null || now == null || now.isEmpty) return;
      final known = before.map((a) => a.id).toSet();
      final fresh = now.where((a) => !known.contains(a.id)).toList();
      if (fresh.isNotEmpty) {
        _banner('Your car ${fresh.first.plate} is blocking someone!', fresh.first.id!);
      }
    });
    // Live: the owner answered something I reported.
    ref.listen<AsyncValue<List<BlockAlert>>>(sentAlertsProvider, (prev, next) {
      final before = prev?.value;
      final now = next.value;
      if (before == null || now == null) return;
      final old = {for (final a in before) a.id: a.status};
      for (final a in now) {
        if (old[a.id] == AlertStatus.open && a.status == AlertStatus.acknowledged) {
          _banner('The owner of ${a.plate} replied.', a.id!);
          break;
        }
      }
    });

    final incoming = ref.watch(incomingAlertsProvider).value ?? const <BlockAlert>[];
    ref.watch(sentAlertsProvider); // keeps the live stream open
    final waiting = incoming.where((a) => a.status == AlertStatus.open).length;

    const titles = ['SNAP & ALERT', 'ALERTS', 'PARKING', 'BOOKINGS', 'ME'];
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_tab]),
        actions: [
          IconButton(
            tooltip: 'Sign out',
            icon: const Icon(Icons.logout),
            onPressed: () async => client.auth.signOutDevice(),
          ),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _tab,
          children: const [SnapScreen(), AlertsScreen(), ParkingScreen(), BookingsScreen(), MeScreen()],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (i) => setState(() => _tab = i),
        destinations: [
          const NavigationDestination(icon: Icon(Icons.photo_camera), label: 'Snap'),
          NavigationDestination(
            icon: Badge(isLabelVisible: waiting > 0, label: Text('$waiting'), child: const Icon(Icons.notifications)),
            label: 'Alerts',
          ),
          const NavigationDestination(icon: Icon(Icons.local_parking), label: 'Parking'),
          const NavigationDestination(icon: Icon(Icons.event_available), label: 'Bookings'),
          const NavigationDestination(icon: Icon(Icons.person), label: 'Me'),
        ],
      ),
    );
  }
}
