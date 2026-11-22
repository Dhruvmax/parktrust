import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parktrust_app_client/parktrust_app_client.dart';

import '../../app/theme.dart';
import '../../core/plate_utils.dart';
import '../../providers/client_provider.dart';
import '../../providers/market_provider.dart';
import '../../widgets/common.dart';
import 'add_listing_screen.dart';
import 'booking_detail_screen.dart';
import 'qr_screens.dart';

/// My trips as a driver, and hosting my own spaces.
class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(tabs: [Tab(text: 'My trips'), Tab(text: 'Hosting')]),
          Expanded(child: TabBarView(children: [_Trips(), _Hosting()])),
        ],
      ),
    );
  }
}

class _Trips extends ConsumerWidget {
  const _Trips();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trips = ref.watch(myBookingsProvider);
    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(myBookingsProvider),
      child: trips.when(
        loading: () => const LoadingView(),
        error: (e, _) => ErrorView(message: errorText(e), onRetry: () => ref.invalidate(myBookingsProvider)),
        data: (list) => list.isEmpty
            ? const EmptyView(
                icon: Icons.event_available,
                title: 'No trips yet',
                text: 'Book a space from the Parking tab and it shows up here.',
              )
            : ListView(
                padding: const EdgeInsets.all(16),
                children: [for (final v in list) _BookingTile(view: v, asHost: false)],
              ),
      ),
    );
  }
}

class _Hosting extends ConsumerWidget {
  const _Hosting();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spaces = ref.watch(myListingsProvider);
    final bookings = ref.watch(hostBookingsProvider);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        FilledButton.icon(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const AddListingScreen()),
          ),
          icon: const Icon(Icons.add_home_work),
          label: const Text('List my parking space'),
        ),
        const SizedBox(height: 16),
        Text('My spaces', style: Theme.of(context).textTheme.titleLarge),
        spaces.when(
          loading: () => const Padding(padding: EdgeInsets.all(24), child: LoadingView()),
          error: (e, _) => ErrorView(message: errorText(e), onRetry: () => ref.invalidate(myListingsProvider)),
          data: (list) => list.isEmpty
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('You have not listed a space yet. Earn from your empty parking.'),
                )
              : Column(
                  children: [
                    for (final l in list)
                      Card(
                        child: ListTile(
                          title: Text(l.title),
                          subtitle: Text('${l.area} · ${rupees(l.ratePerHour)}/h · ${l.active ? 'Live' : 'Paused'}'),
                          leading: IconButton(
                            tooltip: 'Gate QR',
                            icon: const Icon(Icons.qr_code_2),
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => OwnerQrScreen(listingId: l.id!, title: l.title)),
                            ),
                          ),
                          trailing: Switch(
                            value: l.active,
                            onChanged: (v) async {
                              try {
                                await ref.read(clientProvider).listing.setActive(l.id!, v);
                                ref.invalidate(myListingsProvider);
                              } catch (e) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorText(e))));
                                }
                              }
                            },
                          ),
                        ),
                      ),
                  ],
                ),
        ),
        const SizedBox(height: 16),
        Text('Bookings on my spaces', style: Theme.of(context).textTheme.titleLarge),
        bookings.when(
          loading: () => const Padding(padding: EdgeInsets.all(24), child: LoadingView()),
          error: (e, _) => ErrorView(message: errorText(e), onRetry: () => ref.invalidate(hostBookingsProvider)),
          data: (list) => list.isEmpty
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('No bookings yet.'),
                )
              : Column(children: [for (final v in list) _BookingTile(view: v, asHost: true)]),
        ),
      ],
    );
  }
}

class _BookingTile extends StatelessWidget {
  const _BookingTile({required this.view, required this.asHost});
  final BookingView view;
  final bool asHost;

  @override
  Widget build(BuildContext context) {
    final b = view.booking;
    final color = switch (b.status) {
      BookingStatus.confirmed => safetyYellow,
      BookingStatus.checkedIn => okGreen,
      BookingStatus.completed => okGreen,
      BookingStatus.cancelled => alertRed,
    };
    return Card(
      child: ListTile(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => BookingDetailScreen(view: view, asHost: asHost)),
        ),
        leading: PlateBadge(b.plate),
        title: Text(view.listing.title),
        subtitle: Text(dateTimeText(b.startTime)),
        trailing: Text(
          b.status.name.toUpperCase(),
          style: TextStyle(color: color, fontWeight: FontWeight.w700, fontSize: 12),
        ),
      ),
    );
  }
}
