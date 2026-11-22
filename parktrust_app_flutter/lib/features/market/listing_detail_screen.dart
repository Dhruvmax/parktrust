import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parktrust_app_client/parktrust_app_client.dart';

import '../../app/theme.dart';
import '../../core/plate_utils.dart';
import '../../providers/client_provider.dart';
import '../../providers/market_provider.dart';
import '../../providers/vehicles_provider.dart';
import '../../widgets/common.dart';
import '../../widgets/reviews_list.dart';
import '../me/membership_card.dart';
import '../../widgets/trust_badge.dart';
import 'booking_detail_screen.dart';

/// A space, its owner's trust score, and the booking form.
/// Payment is simulated: the amount is "held" now and released at checkout.
class ListingDetailScreen extends ConsumerStatefulWidget {
  const ListingDetailScreen({super.key, required this.listing});
  final Listing listing;
  @override
  ConsumerState<ListingDetailScreen> createState() => _ListingDetailScreenState();
}

class _ListingDetailScreenState extends ConsumerState<ListingDetailScreen> {
  final _plate = TextEditingController();
  DateTime _start = DateTime.now().add(const Duration(minutes: 15));
  int _hours = 2;
  bool _busy = false;

  @override
  void dispose() {
    _plate.dispose();
    super.dispose();
  }

  Future<void> _pickStart() async {
    final day = await showDatePicker(
      context: context,
      initialDate: _start,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (day == null || !mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_start),
    );
    if (time == null) return;
    setState(() => _start = DateTime(day.year, day.month, day.day, time.hour, time.minute));
  }

  Future<void> _book(bool payNow) async {
    setState(() => _busy = true);
    try {
      final view = await ref.read(clientProvider).booking.book(
        widget.listing.id!,
        _plate.text,
        _start,
        _start.add(Duration(hours: _hours)),
        payNow,
      );
      ref.invalidate(myBookingsProvider);
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => BookingDetailScreen(view: view, asHost: false)),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorText(e))));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = widget.listing;
    final cars = ref.watch(vehiclesProvider).value ?? const <Vehicle>[];
    final member = ref.watch(membershipProvider);
    final needsPlan = member.hasValue && member.value == null;
    final base = l.ratePerHour * _hours;

    return Scaffold(
      appBar: AppBar(title: const Text('SPACE')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(l.title, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 4),
          Text(l.area),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              TrustBadge(userId: l.ownerId),
              Chip(label: Text('${rupees(l.ratePerHour)}/hour')),
              Chip(label: Text('${l.capacity} space${l.capacity == 1 ? '' : 's'}')),
              if (l.covered) const Chip(label: Text('Covered')),
              if (l.gated) const Chip(label: Text('Gated')),
              if (l.hasCctv) const Chip(label: Text('CCTV')),
              if (l.hasEv) const Chip(label: Text('EV charging')),
            ],
          ),
          if (l.description != null) ...[
            const SizedBox(height: 12),
            Text(l.description!),
          ],
          const SizedBox(height: 8),
          Text(
            'The exact address is shown after you book.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 12),
          ReviewsList(userId: l.ownerId, title: 'What drivers say about this host'),
          const Divider(height: 32),
          Text('Book this space', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          if (needsPlan) ...[
            const MembershipCard(),
            const SizedBox(height: 8),
          ],
          TextField(
            controller: _plate,
            textCapitalization: TextCapitalization.characters,
            decoration: const InputDecoration(labelText: 'Your number plate', hintText: 'MH12AB1234'),
          ),
          if (cars.isNotEmpty)
            Wrap(
              spacing: 8,
              children: [
                for (final c in cars)
                  ActionChip(
                    label: Text(c.plate),
                    onPressed: () => setState(() => _plate.text = c.plate),
                  ),
              ],
            ),
          const SizedBox(height: 12),
          ListTile(
            tileColor: asphaltRaised,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            leading: const Icon(Icons.schedule),
            title: Text('Starts ${dateTimeText(_start)}'),
            subtitle: const Text('Tap to change'),
            onTap: _pickStart,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text('Duration'),
              const Spacer(),
              IconButton(
                onPressed: _hours > 1 ? () => setState(() => _hours--) : null,
                icon: const Icon(Icons.remove_circle_outline),
              ),
              Text('$_hours h', style: Theme.of(context).textTheme.titleMedium),
              IconButton(
                onPressed: _hours < 12 ? () => setState(() => _hours++) : null,
                icon: const Icon(Icons.add_circle_outline),
              ),
            ],
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: [
                  _row('${rupees(l.ratePerHour)} x $_hours h', rupees(base)),
                  _row('Booking fee', 'None (covered by your plan)'),
                  const Divider(),
                  _row('You pay (simulated)', rupees(base), bold: true),
                  const SizedBox(height: 6),
                  Text(
                    'Scan the gate QR to check in and out. If you stay past the end time and the owner reports it with a photo, '
                    '₹100 per started hour is charged. Cancel more than 2 hours before the start for a full refund of a paid booking. Later than that, a paid booking is not refunded. A reserved slot you have not paid for costs nothing, but is released after 10 minutes.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: (_busy || needsPlan) ? null : () => _book(true),
            child: _busy
                ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))
                : Text(needsPlan ? 'Choose a plan above to book' : 'Pay ${rupees(base)} now and book'),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: (_busy || needsPlan) ? null : () => _book(false),
            child: const Text('Reserve slot, pay within 10 minutes'),
          ),
        ],
      ),
    );
  }

  Widget _row(String a, String b, {bool bold = false}) {
    final style = TextStyle(fontWeight: bold ? FontWeight.w800 : FontWeight.w400);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(children: [Expanded(child: Text(a, style: style)), Text(b, style: style)]),
    );
  }
}
