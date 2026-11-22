import 'package:flutter_map/flutter_map.dart';

/// Optional CARTO map key. It is never stored in the code or in Git: pass it
/// when running, for example `--dart-define=CARTO_KEY=your_key`.
const _cartoKey = String.fromEnvironment('CARTO_KEY');

/// Dark CARTO basemap, with the key added when one was given.
TileLayer parkTileLayer() => TileLayer(
  urlTemplate:
      'https://{s}.basemaps.cartocdn.com/rastertiles/dark_all/{z}/{x}/{y}.png'
      '${_cartoKey.isEmpty ? '' : '?key=$_cartoKey'}',
  subdomains: const ['a', 'b', 'c', 'd'],
  maxZoom: 19,
  userAgentPackageName: 'space.serverpod.parktrust_app',
);
