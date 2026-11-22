import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

/// Straight-line distance in kilometres.
double distanceKm(double lat1, double lng1, double lat2, double lng2) =>
    Geolocator.distanceBetween(lat1, lng1, lat2, lng2) / 1000;

String distanceText(double km) =>
    km < 1 ? '${(km * 1000).round()} m' : '${km.toStringAsFixed(1)} km';

/// A rough drive time at city speed (about 25 km/h). It is an estimate only.
String etaText(double km) {
  final minutes = (km / 25 * 60).ceil();
  if (minutes < 2) return 'about 1 min';
  if (minutes < 60) return 'about $minutes min';
  return 'about ${(minutes / 60).toStringAsFixed(1)} h';
}

/// Opens turn-by-turn directions in the phone's maps app or the browser.
Future<bool> openDirections(double lat, double lng) {
  final uri = Uri.parse(
    'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng&travelmode=driving',
  );
  return launchUrl(uri, mode: LaunchMode.externalApplication);
}
