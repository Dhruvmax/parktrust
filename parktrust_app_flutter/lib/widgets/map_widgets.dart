import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../providers/location_provider.dart';

/// A blue dot for the person's live position. Put it inside a FlutterMap.
class MyLocationLayer extends ConsumerWidget {
  const MyLocationLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pos = ref.watch(livePositionProvider).value;
    if (pos == null) return const SizedBox.shrink();
    return MarkerLayer(
      markers: [
        Marker(
          point: LatLng(pos.latitude, pos.longitude),
          width: 22,
          height: 22,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
            ),
          ),
        ),
      ],
    );
  }
}

/// A map with a "my location" button that fetches the current position once
/// and moves the map there. Use it in place of FlutterMap.
class MapWithLocation extends StatefulWidget {
  final MapOptions options;
  final List<Widget> children;
  const MapWithLocation({super.key, required this.options, required this.children});

  @override
  State<MapWithLocation> createState() => _MapWithLocationState();
}

class _MapWithLocationState extends State<MapWithLocation> {
  final _controller = MapController();
  LatLng? _me;
  bool _busy = false;

  void _say(String text) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  Future<void> _locate() async {
    setState(() => _busy = true);
    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        _say('Turn on location on your device, then try again.');
        return;
      }
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        _say('Location permission is off. Allow it in your browser or phone settings.');
        return;
      }
      final pos = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
      ).timeout(const Duration(seconds: 20));
      final here = LatLng(pos.latitude, pos.longitude);
      if (!mounted) return;
      setState(() => _me = here);
      _controller.move(here, 14);
    } catch (_) {
      _say('Could not get your location. Try again.');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: _controller,
          options: widget.options,
          children: [
            ...widget.children,
            if (_me != null)
              MarkerLayer(
                markers: [
                  Marker(
                    point: _me!,
                    width: 24,
                    height: 24,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
        Positioned(
          right: 10,
          bottom: 28,
          child: FloatingActionButton.small(
            heroTag: null,
            tooltip: 'Use my current location',
            onPressed: _busy ? null : _locate,
            child: _busy
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.my_location),
          ),
        ),
      ],
    );
  }
}
