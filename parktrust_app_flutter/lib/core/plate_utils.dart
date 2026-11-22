import 'package:parktrust_app_client/parktrust_app_client.dart';

/// Upper-case letters and digits only: "mh 12 ab-1234" -> "MH12AB1234".
String normalizePlate(String raw) =>
    raw.toUpperCase().replaceAll(RegExp(r'[^A-Z0-9]'), '');

/// Finds the most plate-like text in whatever the camera read.
String? extractPlate(String text) {
  final upper = text.toUpperCase();
  // Indian format first, for example MH12AB1234 or DL1CAB1234.
  final indian = RegExp(r'[A-Z]{2}\s?-?\d{1,2}\s?-?[A-Z]{0,3}\s?-?\d{4}');
  final match = indian.firstMatch(upper);
  if (match != null) return normalizePlate(match.group(0)!);
  // Otherwise the longest letters-and-digits word that has both.
  String? best;
  for (final word in upper.split(RegExp(r'\s+'))) {
    final w = normalizePlate(word);
    if (w.length < 6 || w.length > 12) continue;
    if (!RegExp(r'[A-Z]').hasMatch(w) || !RegExp(r'\d').hasMatch(w)) continue;
    if (best == null || w.length > best.length) best = w;
  }
  return best;
}

/// A short message the user can understand for any error.
String errorText(Object error) {
  if (error is AlertException) return error.message;
  return 'Something went wrong. Check your connection and try again.';
}

String timeText(DateTime t) {
  final l = t.toLocal();
  final h = l.hour.toString().padLeft(2, '0');
  final m = l.minute.toString().padLeft(2, '0');
  return '$h:$m';
}

const _months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];

/// "22 Nov, 14:30" in the phone's time zone.
String dateTimeText(DateTime t) {
  final l = t.toLocal();
  return '${l.day} ${_months[l.month - 1]}, ${timeText(l)}';
}

String rupees(int amount) => '₹$amount';
