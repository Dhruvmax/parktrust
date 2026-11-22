import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parktrust_app_client/parktrust_app_client.dart';
import 'dart:typed_data';

import '../../app/theme.dart';
import '../../core/geo.dart';
import '../../core/map_tiles.dart';
import '../../core/plate_utils.dart';
import '../../providers/location_provider.dart';
import '../../widgets/map_widgets.dart';
import '../../providers/client_provider.dart';
import '../../providers/market_provider.dart';
import '../../widgets/common.dart';
import 'qr_screens.dart';

const _demoHostId = '00000000-0000-4000-8000-000000000001';

/// One booking: address, price, QR check in/out, extend, overstay report,
/// cancel and rating.
class BookingDetailScreen extends ConsumerStatefulWidget {
  const BookingDetailScreen({super.key, required this.view, required this.asHost});
  final BookingView view;
  final bool asHost;
  @override
  ConsumerState<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends ConsumerState<BookingDetailScreen> {
  late BookingView _view = widget.view;
  bool _busy = false;
  int _stars = 5;
  final _comment = TextEditingController();

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _reload();
    // Every 15 seconds: the driver shares their position with the owner until
    // check-in, and the owner's screen refreshes to see it.
    _timer = Timer.periodic(const Duration(seconds: 15), (_) => _tick());
  }

  Future<void> _tick() async {
    if (!mounted) return;
    final status = _view.booking.status;
    if (widget.asHost) {
      if (status == BookingStatus.confirmed || status == BookingStatus.checkedIn) {
        await _reload();
      }
    } else if (status == BookingStatus.confirmed) {
      final pos = ref.read(livePositionProvider).value;
      if (pos == null) return;
      try {
        await ref.read(clientProvider).booking.updateLocation(
          _view.booking.id!,
          pos.latitude,
          pos.longitude,
        );
      } catch (_) {
        // Sharing is best effort.
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _comment.dispose();
    super.dispose();
  }

  Future<void> _reload() async {
    try {
      final full = await ref.read(clientProvider).booking.getBooking(widget.view.booking.id!);
      if (mounted) setState(() => _view = full);
    } catch (_) {
      // Keep what we have.
    }
  }

  void _toast(String text) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  void _refreshLists() {
    ref.invalidate(myBookingsProvider);
    ref.invalidate(hostBookingsProvider);
    ref.invalidate(trustProvider);
  }

  Future<void> _run(Future<BookingView> Function() action) async {
    setState(() => _busy = true);
    try {
      final next = await action();
      _refreshLists();
      if (mounted) setState(() => _view = next);
    } catch (e) {
      _toast(errorText(e));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<String?> _scan() => Navigator.of(context).push<String>(
    MaterialPageRoute(
      builder: (_) => QrScanScreen(demoSpace: _view.listing.ownerId.uuid == _demoHostId),
    ),
  );

  Future<void> _gate(bool arriving) async {
    final code = await _scan();
    if (code == null) return;
    final api = ref.read(clientProvider).booking;
    final id = _view.booking.id!;
    await _run(() => arriving ? api.checkIn(id, code) : api.checkOut(id, code));
  }

  Future<void> _extend() async {
    final hours = await showModalBottomSheet<int>(
      context: context,
      backgroundColor: asphaltRaised,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Add how much time?'),
            ),
            for (final h in [1, 2, 3])
              ListTile(
                title: Text('$h hour${h == 1 ? '' : 's'}  ·  ${rupees(h * _view.booking.ratePerHour)}'),
                onTap: () => Navigator.of(context).pop(h),
              ),
          ],
        ),
      ),
    );
    if (hours == null) return;
    await _run(() => ref.read(clientProvider).booking.extend(_view.booking.id!, hours));
  }

  Future<void> _reportOverstay() async {
    final XFile? file;
    try {
      file = await ImagePicker().pickImage(source: ImageSource.camera, maxWidth: 900, imageQuality: 55);
    } catch (_) {
      _toast('Could not open the camera.');
      return;
    }
    if (file == null) return;
    final bytes = await file.readAsBytes();
    await _run(
      () => ref.read(clientProvider).booking.reportOverstay(
        _view.booking.id!,
        ByteData.view(bytes.buffer, bytes.offsetInBytes, bytes.length),
      ),
    );
  }

  Future<void> _report() async {
    const reasons = {
      'overstay': 'Stayed too long',
      'damage': 'Damage',
      'rude': 'Rude behaviour',
      'not_as_described': 'Not as described',
      'safety': 'Safety concern',
      'payment': 'Payment problem',
      'other': 'Other',
    };
    String? reason;
    final details = TextEditingController();
    final send = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setLocal) => AlertDialog(
          title: const Text('Report a problem'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  children: [
                    for (final e in reasons.entries)
                      ChoiceChip(
                        label: Text(e.value),
                        selected: reason == e.key,
                        onSelected: (_) => setLocal(() => reason = e.key),
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: details,
                  maxLength: 300,
                  maxLines: 3,
                  decoration: const InputDecoration(labelText: 'What happened? (optional)'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('Cancel')),
            FilledButton(
              onPressed: reason == null ? null : () => Navigator.of(ctx).pop(true),
              child: const Text('Send report'),
            ),
          ],
        ),
      ),
    );
    final text = details.text;
    details.dispose();
    if (send != true || reason == null) return;
    setState(() => _busy = true);
    try {
      await ref.read(clientProvider).booking.report(_view.booking.id!, reason!, text);
      _refreshLists();
      if (mounted) {
        setState(() => _view = _view.copyWith(reportedByMe: true));
        _toast("Report sent. It also lowers the other person's trust score.");
      }
    } catch (e) {
      _toast(errorText(e));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _rate() async {
    setState(() => _busy = true);
    try {
      await ref.read(clientProvider).booking.review(_view.booking.id!, _stars, _comment.text);
      _refreshLists();
      if (mounted) {
        setState(() => _view = _view.copyWith(reviewedByMe: true));
        _toast('Thanks, rating sent.');
      }
    } catch (e) {
      _toast(errorText(e));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Widget _routeCard(Listing l, Booking b) {
    final spot = LatLng(l.latitude, l.longitude);
    final me = ref.watch(livePositionProvider).value;
    final active = b.status == BookingStatus.confirmed || b.status == BookingStatus.checkedIn;
    final driverLat = b.lastLatitude;
    final driverLng = b.lastLongitude;
    final showDriver = widget.asHost &&
        b.status == BookingStatus.confirmed &&
        driverLat != null &&
        driverLng != null;

    String? info;
    if (!widget.asHost && me != null) {
      final km = distanceKm(me.latitude, me.longitude, l.latitude, l.longitude);
      info = 'You are ${distanceText(km)} away, ${etaText(km)} by car (estimate).';
    } else if (showDriver) {
      final km = distanceKm(driverLat, driverLng, l.latitude, l.longitude);
      final at = b.lastLocationAt;
      info = 'Driver is ${distanceText(km)} away, ${etaText(km)} by car'
          '${at == null ? '' : ' (updated ${timeText(at)})'}.';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 180,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: FlutterMap(
              options: MapOptions(initialCenter: spot, initialZoom: 14),
              children: [
                parkTileLayer(),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: spot,
                      width: 40,
                      height: 40,
                      child: const Icon(Icons.location_on, color: safetyYellow, size: 40),
                    ),
                    if (showDriver)
                      Marker(
                        point: LatLng(driverLat, driverLng),
                        width: 36,
                        height: 36,
                        child: const Icon(Icons.directions_car, color: Colors.lightBlueAccent, size: 30),
                      ),
                  ],
                ),
                if (!widget.asHost) const MyLocationLayer(),
                const RichAttributionWidget(
                  attributions: [TextSourceAttribution('© OpenStreetMap, © CARTO')],
                ),
              ],
            ),
          ),
        ),
        if (info != null) ...[
          const SizedBox(height: 6),
          Text(info),
        ],
        if (!widget.asHost && b.status == BookingStatus.confirmed)
          Text(
            'While you are on the way, your live location is shared with the owner. It stops when you check in.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        if (!widget.asHost && active) ...[
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () => openDirections(l.latitude, l.longitude),
            icon: const Icon(Icons.directions),
            label: const Text('Directions'),
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final b = _view.booking;
    final l = _view.listing;
    final api = ref.read(clientProvider).booking;
    final now = DateTime.now();
    final (statusText, statusColor) = switch (b.status) {
      BookingStatus.confirmed => ('CONFIRMED', safetyYellow),
      BookingStatus.checkedIn => ('PARKED', okGreen),
      BookingStatus.completed => ('COMPLETED', okGreen),
      BookingStatus.cancelled => ('CANCELLED', alertRed),
    };
    final reported = b.overstayReportedAt != null;
    final lateMin = now.difference(b.endTime.toLocal()).inMinutes;
    final runningPenalty = (reported && b.status == BookingStatus.checkedIn && lateMin > 5)
        ? (lateMin / 60).ceil() * 100
        : 0;
    final penalty = b.overstayAmount > 0 ? b.overstayAmount : runningPenalty;
    final active = b.status == BookingStatus.confirmed || b.status == BookingStatus.checkedIn;
    final extendFrom = b.endTime.toLocal().subtract(const Duration(hours: 2));
    final canExtend = !widget.asHost && active && now.isAfter(extendFrom) && now.isBefore(b.endTime.toLocal());
    final photo = b.overstayPhoto;

    return Scaffold(
      appBar: AppBar(title: const Text('BOOKING')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              PlateBadge(b.plate, big: true),
              const Spacer(),
              Text(statusText, style: TextStyle(color: statusColor, fontWeight: FontWeight.w800)),
            ],
          ),
          const SizedBox(height: 12),
          Text(l.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 4),
          Text('Address: ${l.address}'),
          Text('From ${dateTimeText(b.startTime)} to ${dateTimeText(b.endTime)}'),
          if (b.extensionCount > 0) Text('Extended ${b.extensionCount} time${b.extensionCount == 1 ? '' : 's'}'),
          const SizedBox(height: 12),
          _routeCard(l, b),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Parking price: ${rupees(b.baseAmount)}'),
                  if (penalty > 0)
                    Text(
                      'Overstay penalty: ${rupees(penalty)} (₹100 per hour'
                      '${b.status == BookingStatus.checkedIn ? ', still running' : ''})',
                      style: const TextStyle(color: alertRed),
                    ),
                  if (b.ownerPenaltyShare > 0)
                    Text('Owner receives ${rupees(b.ownerPenaltyShare)} of the penalty (50%)'),
                  Text('Total: ${rupees(b.baseAmount + b.overstayAmount)}', style: const TextStyle(fontWeight: FontWeight.w800)),
                  Text('Payment (simulated): ${b.paymentStatus}'),
                  if (b.status == BookingStatus.cancelled) Text('Refunded: ${rupees(b.refundAmount)}'),
                ],
              ),
            ),
          ),
          if (photo != null) ...[
            const SizedBox(height: 8),
            Text('Owner\'s photo of the car still on the property', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.memory(
                photo.buffer.asUint8List(photo.offsetInBytes, photo.lengthInBytes),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
          const SizedBox(height: 12),
          // ---- driver actions ----
          if (!widget.asHost && b.status == BookingStatus.confirmed) ...[
            if (b.paymentStatus == 'unpaid') ...[
              FilledButton(
                onPressed: _busy ? null : () => _run(() => api.pay(b.id!)),
                child: Text('Pay ${rupees(b.baseAmount)} now (reserved for 10 minutes)'),
              ),
              const SizedBox(height: 8),
            ] else
              FilledButton.icon(
                onPressed: _busy ? null : () => _gate(true),
                icon: const Icon(Icons.qr_code_scanner),
                label: const Text('Arrived: scan gate QR to check in'),
              ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: _busy ? null : () => _run(() => api.cancel(b.id!)),
              child: const Text('Cancel booking'),
            ),
            const SizedBox(height: 4),
            Text(
              b.paymentStatus == 'unpaid'
                  ? 'Not paid yet: cancelling is free. The slot is released if unpaid after 10 minutes.'
                  : 'Paid: full refund if you cancel more than 2 hours before the start. Later than that, the payment is not refunded.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
          if (!widget.asHost && b.status == BookingStatus.checkedIn) ...[
            FilledButton.icon(
              onPressed: _busy ? null : () => _gate(false),
              icon: const Icon(Icons.qr_code_scanner),
              label: const Text('Leaving: scan gate QR to check out'),
            ),
          ],
          if (!widget.asHost && active) ...[
            const SizedBox(height: 8),
            if (canExtend)
              OutlinedButton.icon(
                onPressed: _busy ? null : _extend,
                icon: const Icon(Icons.more_time),
                label: const Text('Extend time'),
              )
            else if (now.isBefore(b.endTime.toLocal()))
              Text(
                'You can extend your time from ${timeText(extendFrom)}, 2 hours before it ends.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
          ],
          // ---- owner actions ----
          if (widget.asHost && b.status == BookingStatus.checkedIn && !reported && lateMin > 5) ...[
            FilledButton.icon(
              style: FilledButton.styleFrom(backgroundColor: alertRed, foregroundColor: Colors.white),
              onPressed: _busy ? null : _reportOverstay,
              icon: const Icon(Icons.photo_camera),
              label: const Text('Car is still here: upload photo'),
            ),
            const SizedBox(height: 4),
            Text(
              'The driver is charged ₹100 per hour from the end time. You receive 50% of it.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
          // ---- rating ----
          if (b.status == BookingStatus.completed && !_view.reviewedByMe) ...[
            const SizedBox(height: 8),
            Text(widget.asHost ? 'Rate this driver' : 'Rate this space', style: Theme.of(context).textTheme.titleMedium),
            Row(
              children: [
                for (var i = 1; i <= 5; i++)
                  IconButton(
                    onPressed: () => setState(() => _stars = i),
                    icon: Icon(i <= _stars ? Icons.star : Icons.star_border, color: safetyYellow),
                  ),
              ],
            ),
            TextField(controller: _comment, maxLength: 200, decoration: const InputDecoration(labelText: 'Comment (optional)')),
            const SizedBox(height: 8),
            FilledButton(onPressed: _busy ? null : _rate, child: const Text('Send rating')),
          ],
          if (b.status == BookingStatus.completed && _view.reviewedByMe) const Text('You rated this booking. Thank you.'),
          if ((b.status == BookingStatus.completed || b.status == BookingStatus.cancelled)) ...[
            const SizedBox(height: 12),
            _view.reportedByMe
                ? const Text('You reported this booking. Our team can review it.')
                : TextButton.icon(
                    onPressed: _busy ? null : _report,
                    icon: const Icon(Icons.flag_outlined),
                    label: const Text('Report a problem'),
                  ),
          ],
        ],
      ),
    );
  }
}
