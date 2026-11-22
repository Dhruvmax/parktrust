import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:parktrust_app_client/parktrust_app_client.dart';

import '../../app/theme.dart';
import '../../core/geo.dart';
import '../../core/map_tiles.dart';
import '../../core/plate_utils.dart';
import '../../providers/location_provider.dart';
import '../../providers/lots_provider.dart';
import '../../providers/market_provider.dart';
import '../../widgets/common.dart';
import '../../widgets/map_widgets.dart';
import '../../widgets/trust_badge.dart';
import '../lots/lots_screen.dart';
import 'listing_detail_screen.dart';

/// Search parking: spaces drivers list (green pins) and public lots (yellow
/// pins), on a map and as a list.
class FindSpotsScreen extends ConsumerStatefulWidget {
  const FindSpotsScreen({super.key});
  @override
  ConsumerState<FindSpotsScreen> createState() => _FindSpotsScreenState();
}

class _FindSpotsScreenState extends ConsumerState<FindSpotsScreen> {
  final _search = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  void _open(BuildContext context, Widget screen) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));

  @override
  Widget build(BuildContext context) {
    final spaces = ref.watch(listingSearchProvider(_query));
    final lots = ref.watch(lotSearchProvider(_query));
    final me = ref.watch(livePositionProvider).value;
    final q = _query.toLowerCase();
    final mine = (ref.watch(myListingsProvider).value ?? const <Listing>[])
        .where((l) =>
            q.isEmpty ||
            l.title.toLowerCase().contains(q) ||
            l.area.toLowerCase().contains(q) ||
            l.address.toLowerCase().contains(q))
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            controller: _search,
            textInputAction: TextInputAction.search,
            onSubmitted: (v) => setState(() => _query = v.trim()),
            decoration: InputDecoration(
              hintText: 'Search city, area or place, e.g. Delhi',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () => setState(() => _query = _search.text.trim()),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: spaces.when(
            loading: () => const LoadingView(),
            error: (e, _) => ErrorView(
              message: errorText(e),
              onRetry: () {
                ref.invalidate(listingSearchProvider(_query));
                ref.invalidate(lotSearchProvider(_query));
              },
            ),
            data: (spaceList) {
              final lotList = lots.value ?? const [];
              if (spaceList.isEmpty && lotList.isEmpty && mine.isEmpty) {
                return EmptyView(
                  icon: Icons.home_work,
                  title: 'Nothing found',
                  text: _query.isEmpty
                      ? 'No driver has listed a space yet. Search a city like Delhi, Mumbai or Pune.'
                      : 'No spaces or public lots match "$_query". Try another city or area.',
                );
              }
              final first = mine.isNotEmpty
                  ? LatLng(mine.first.latitude, mine.first.longitude)
                  : spaceList.isNotEmpty
                  ? LatLng(spaceList.first.latitude, spaceList.first.longitude)
                  : LatLng(lotList.first.latitude, lotList.first.longitude);
              return Column(
                children: [
                  SizedBox(
                    height: 210,
                    child: MapWithLocation(
                      key: ValueKey('$_query-${spaceList.length}-${lotList.length}-${mine.length}'),
                      options: MapOptions(initialCenter: first, initialZoom: 11.5),
                      children: [
                        parkTileLayer(),
                        MarkerLayer(
                          markers: [
                            for (final l in lotList)
                              Marker(
                                point: LatLng(l.latitude, l.longitude),
                                width: 34,
                                height: 34,
                                child: GestureDetector(
                                  onTap: () => showLotSheet(context, l),
                                  child: const Icon(Icons.location_on, color: safetyYellow, size: 34),
                                ),
                              ),
                            for (final l in mine)
                              Marker(
                                point: LatLng(l.latitude, l.longitude),
                                width: 36,
                                height: 36,
                                child: const Icon(Icons.location_on, color: Colors.lightBlueAccent, size: 36),
                              ),
                            for (final l in spaceList)
                              Marker(
                                point: LatLng(l.latitude, l.longitude),
                                width: 36,
                                height: 36,
                                child: GestureDetector(
                                  onTap: () => _open(context, ListingDetailScreen(listing: l)),
                                  child: const Icon(Icons.location_on, color: okGreen, size: 36),
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
                    child: ListView(
                      padding: const EdgeInsets.all(12),
                      children: [
                        if (mine.isNotEmpty)
                          Text('Your spaces (blue)', style: Theme.of(context).textTheme.titleSmall),
                        for (final l in mine)
                          Card(
                            child: ListTile(
                              title: Text(l.title),
                              subtitle: Text('${l.area} · ${l.address} · ${l.active ? 'Live' : 'Paused'}'),
                              trailing: Text(
                                '${rupees(l.ratePerHour)}/h',
                                style: const TextStyle(color: safetyYellow, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        if (spaceList.isNotEmpty)
                          Text('Spaces from drivers (green)', style: Theme.of(context).textTheme.titleSmall),
                        for (final l in spaceList)
                          Card(
                            child: ListTile(
                              onTap: () => _open(context, ListingDetailScreen(listing: l)),
                              title: Text(l.title),
                              subtitle: Wrap(
                                spacing: 8,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text(l.area),
                                  if (me != null)
                                    Text('~${distanceText(distanceKm(me.latitude, me.longitude, l.latitude, l.longitude))} away'),
                                  TrustBadge(userId: l.ownerId),
                                ],
                              ),
                              trailing: Text(
                                '${rupees(l.ratePerHour)}/h',
                                style: const TextStyle(color: safetyYellow, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        if (lotList.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text('Public lots (yellow)', style: Theme.of(context).textTheme.titleSmall),
                        ],
                        for (final l in lotList)
                          Card(
                            child: ListTile(
                              onTap: () => showLotSheet(context, l),
                              title: Text(l.name),
                              subtitle: Text(
                                '${categoryName(l.category)} · ${l.area}, ${l.city}'
                                '${me == null ? '' : ' · ~${distanceText(distanceKm(me.latitude, me.longitude, l.latitude, l.longitude))} away'}',
                              ),
                              trailing: Text(
                                l.ratePerHour == null ? '-' : '₹${l.ratePerHour}/h',
                                style: const TextStyle(color: safetyYellow, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
