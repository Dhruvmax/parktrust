import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../app/theme.dart';
import '../../core/map_tiles.dart';
import '../../core/plate_utils.dart';
import '../../providers/client_provider.dart';
import '../../providers/market_provider.dart';
import '../me/membership_card.dart';

/// List your own parking space. Tap the map to place it.
class AddListingScreen extends ConsumerStatefulWidget {
  const AddListingScreen({super.key});
  @override
  ConsumerState<AddListingScreen> createState() => _AddListingScreenState();
}

class _AddListingScreenState extends ConsumerState<AddListingScreen> {
  final _title = TextEditingController();
  final _desc = TextEditingController();
  final _area = TextEditingController();
  final _address = TextEditingController();
  final _rate = TextEditingController(text: '30');
  int _capacity = 1;
  bool _ev = false, _cctv = false, _covered = false, _gated = false;
  LatLng _point = const LatLng(18.5204, 73.8567);
  bool _busy = false;

  @override
  void dispose() {
    for (final c in [_title, _desc, _area, _address, _rate]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    setState(() => _busy = true);
    try {
      await ref.read(clientProvider).listing.createListing(
        _title.text,
        _desc.text,
        _area.text,
        _address.text,
        _point.latitude,
        _point.longitude,
        int.tryParse(_rate.text.trim()) ?? 0,
        _capacity,
        _ev,
        _cctv,
        _covered,
        _gated,
      );
      ref.invalidate(myListingsProvider);
      ref.invalidate(listingSearchProvider);
      if (mounted) Navigator.of(context).pop();
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
    return Scaffold(
      appBar: AppBar(title: const Text('LIST YOUR SPACE')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (ref.watch(membershipProvider).value == null && ref.watch(membershipProvider).hasValue) ...[
            const MembershipCard(),
            const SizedBox(height: 12),
          ],
          TextField(controller: _title, decoration: const InputDecoration(labelText: 'Title', hintText: 'Covered spot near Phoenix Mall')),
          const SizedBox(height: 8),
          TextField(controller: _area, decoration: const InputDecoration(labelText: 'Area (shown to everyone)', hintText: 'Viman Nagar')),
          const SizedBox(height: 8),
          TextField(controller: _address, decoration: const InputDecoration(labelText: 'Full address (shown only after booking)')),
          const SizedBox(height: 8),
          TextField(controller: _desc, maxLines: 2, decoration: const InputDecoration(labelText: 'Description (optional)')),
          const SizedBox(height: 12),
          Text('Tap the map to place your space', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 8),
          SizedBox(
            height: 220,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: _point,
                  initialZoom: 12,
                  onTap: (_, p) => setState(() => _point = p),
                ),
                children: [
                  parkTileLayer(),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: _point,
                        width: 40,
                        height: 40,
                        child: const Icon(Icons.location_on, color: safetyYellow, size: 40),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Text(
            'Selected: ${_point.latitude.toStringAsFixed(4)}, ${_point.longitude.toStringAsFixed(4)}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _rate,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Price per hour (rupees)'),
          ),
          Row(
            children: [
              const Text('Spaces available'),
              const Spacer(),
              IconButton(onPressed: _capacity > 1 ? () => setState(() => _capacity--) : null, icon: const Icon(Icons.remove_circle_outline)),
              Text('$_capacity'),
              IconButton(onPressed: _capacity < 50 ? () => setState(() => _capacity++) : null, icon: const Icon(Icons.add_circle_outline)),
            ],
          ),
          Wrap(
            spacing: 8,
            children: [
              FilterChip(label: const Text('Covered'), selected: _covered, onSelected: (v) => setState(() => _covered = v)),
              FilterChip(label: const Text('Gated'), selected: _gated, onSelected: (v) => setState(() => _gated = v)),
              FilterChip(label: const Text('CCTV'), selected: _cctv, onSelected: (v) => setState(() => _cctv = v)),
              FilterChip(label: const Text('EV charging'), selected: _ev, onSelected: (v) => setState(() => _ev = v)),
            ],
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: _busy ? null : _save,
            child: _busy
                ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))
                : const Text('Publish my space'),
          ),
        ],
      ),
    );
  }
}
