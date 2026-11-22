import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:parktrust_app_client/parktrust_app_client.dart';

import '../../app/theme.dart';
import '../../core/map_tiles.dart';
import '../../core/geo.dart';
import '../../core/plate_utils.dart';
import '../../widgets/map_widgets.dart';
import '../../providers/lots_provider.dart';
import '../../widgets/common.dart';

const _categoryNames = {
  'mall': 'Malls',
  'railway': 'Railway',
  'airport': 'Airports',
  'hospital': 'Hospitals',
  'it_hub': 'IT hubs',
  'metro': 'Metro',
  'sector': 'Markets',
  'public': 'Public',
};

String categoryName(String c) => _categoryNames[c] ?? c;

/// Public parking lots on a map, with city and category filters.
class LotsScreen extends ConsumerWidget {
  const LotsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cities = ref.watch(lotCitiesProvider);
    return cities.when(
      loading: () => const LoadingView(),
      error: (e, _) => ErrorView(
        message: errorText(e),
        onRetry: () => ref.invalidate(lotCitiesProvider),
      ),
      data: (list) => list.isEmpty
          ? const EmptyView(
              icon: Icons.local_parking,
              title: 'No lots yet',
              text: 'Public lots will appear here.',
            )
          : _LotsBody(cities: list),
    );
  }
}

class _LotsBody extends ConsumerWidget {
  const _LotsBody({required this.cities});
  final List<String> cities;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(lotFilterProvider);
    final city = filter.city ?? (cities.contains('Pune') ? 'Pune' : cities.first);
    final lots = ref.watch(lotsProvider(city));

    return Column(
      children: [
        SizedBox(
          height: 52,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            children: [
              for (final c in cities)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(c),
                    selected: c == city,
                    onSelected: (_) => ref
                        .read(lotFilterProvider.notifier)
                        .set(LotFilter(city: c)),
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          child: lots.when(
            loading: () => const LoadingView(),
            error: (e, _) => ErrorView(
              message: errorText(e),
              onRetry: () => ref.invalidate(lotsProvider(city)),
            ),
            data: (all) => _CityLots(city: city, all: all, filter: filter),
          ),
        ),
      ],
    );
  }
}

class _CityLots extends ConsumerWidget {
  const _CityLots({required this.city, required this.all, required this.filter});
  final String city;
  final List<PublicLot> all;
  final LotFilter filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = all.map((l) => l.category).toSet().toList()..sort();
    final shown = filter.category == null
        ? all
        : all.where((l) => l.category == filter.category).toList();

    final center = shown.isEmpty
        ? const LatLng(20.5937, 78.9629)
        : LatLng(shown.first.latitude, shown.first.longitude);

    return Column(
      children: [
        SizedBox(
          height: 44,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: const Text('All'),
                  selected: filter.category == null,
                  onSelected: (_) => ref
                      .read(lotFilterProvider.notifier)
                      .set(LotFilter(city: city)),
                ),
              ),
              for (final c in categories)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(categoryName(c)),
                    selected: filter.category == c,
                    onSelected: (_) => ref
                        .read(lotFilterProvider.notifier)
                        .set(LotFilter(city: city, category: c)),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(
          height: 240,
          child: MapWithLocation(
            key: ValueKey('$city-${filter.category}'),
            options: MapOptions(initialCenter: center, initialZoom: 11.5),
            children: [
              parkTileLayer(),
              MarkerLayer(
                markers: [
                  for (final l in shown)
                    Marker(
                      point: LatLng(l.latitude, l.longitude),
                      width: 36,
                      height: 36,
                      child: GestureDetector(
                        onTap: () => showLotSheet(context, l),
                        child: const Icon(
                          Icons.location_on,
                          color: safetyYellow,
                          size: 36,
                        ),
                      ),
                    ),
                ],
              ),
              const MyLocationLayer(),
              const RichAttributionWidget(
                attributions: [TextSourceAttribution('© OpenStreetMap, © CARTO')],
              ),
            ],
          ),
        ),
        Expanded(
          child: shown.isEmpty
              ? const EmptyView(
                  icon: Icons.local_parking,
                  title: 'No lots here',
                  text: 'Try another category or city.',
                )
              : ListView(
                  padding: const EdgeInsets.all(12),
                  children: [
                    for (final l in shown)
                      Card(
                        child: ListTile(
                          onTap: () => showLotSheet(context, l),
                          title: Text(l.name),
                          subtitle: Text('${categoryName(l.category)} · ${l.area}'),
                          trailing: Text(
                            l.ratePerHour == null ? '-' : '₹${l.ratePerHour}/h',
                            style: const TextStyle(
                              color: safetyYellow,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
        ),
      ],
    );
  }
}

/// Details of one public lot, with the distance from me and Google Maps directions.
void showLotSheet(BuildContext context, PublicLot l) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: asphaltRaised,
    showDragHandle: true,
    isScrollControlled: true,
    builder: (_) => _LotSheet(lot: l),
  );
}

class _LotSheet extends StatefulWidget {
  const _LotSheet({required this.lot});
  final PublicLot lot;
  @override
  State<_LotSheet> createState() => _LotSheetState();
}

class _LotSheetState extends State<_LotSheet> {
  String? _distance;
  String? _problem;
  bool _locating = false;

  Future<void> _locate() async {
    setState(() {
      _locating = true;
      _problem = null;
    });
    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        throw 'Location is switched off on this device.';
      }
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        throw 'Location permission was not given.';
      }
      final pos = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );
      final km = distanceKm(pos.latitude, pos.longitude, widget.lot.latitude, widget.lot.longitude);
      if (mounted) setState(() => _distance = '${distanceText(km)} away, ${etaText(km)} by car (estimate)');
    } catch (e) {
      if (mounted) {
        setState(() => _problem = e is String ? e : 'Could not get your location. Try again.');
      }
    } finally {
      if (mounted) setState(() => _locating = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = widget.lot;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l.name, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(l.address),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Chip(label: Text(categoryName(l.category))),
                if (l.ratePerHour != null) Chip(label: Text('₹${l.ratePerHour}/hour')),
                if (l.capacity != null) Chip(label: Text('${l.capacity} spaces')),
                if (l.hours != null) Chip(label: Text(l.hours!)),
                if (l.hasEv) Chip(label: Text(l.evNote ?? 'EV charging')),
              ],
            ),
            if (l.priceNote != null) ...[
              const SizedBox(height: 8),
              Text(l.priceNote!),
            ],
            const SizedBox(height: 12),
            if (_distance != null)
              Text(_distance!, style: const TextStyle(fontWeight: FontWeight.w700, color: okGreen)),
            if (_problem != null) Text(_problem!, style: const TextStyle(color: alertRed)),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: _locating ? null : _locate,
              icon: _locating
                  ? const SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Icon(Icons.my_location),
              label: const Text('Use my live location: distance'),
            ),
            const SizedBox(height: 8),
            FilledButton.icon(
              onPressed: () => openDirections(l.latitude, l.longitude),
              icon: const Icon(Icons.directions),
              label: const Text('Open route in Google Maps'),
            ),
            const SizedBox(height: 12),
            Text(
              'Prices and spaces are indicative. Confirm on site.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
