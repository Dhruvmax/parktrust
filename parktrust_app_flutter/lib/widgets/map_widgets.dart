import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
