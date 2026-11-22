import 'package:serverpod/serverpod.dart';

import '../alerts/alert_helpers.dart';
import '../generated/protocol.dart';
import 'public_lots_data.dart';

/// Browse public parking lots. The sample list is loaded into the database
/// the first time anyone asks for it.
class PublicLotEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Cities that have lots, alphabetically.
  Future<List<String>> cities(Session session) async {
    requireUserId(session);
    await _seedIfEmpty(session);
    final lots = await PublicLot.db.find(session);
    final cities = lots.map((l) => l.city).toSet().toList()..sort();
    return cities;
  }

  /// Lots in one city, optionally one category (mall, airport, hospital...).
  Future<List<PublicLot>> lots(
    Session session,
    String city,
    String? category,
  ) async {
    requireUserId(session);
    await _seedIfEmpty(session);
    final lots = await PublicLot.db.find(
      session,
      where: (t) => t.city.equals(city),
    );
    final filtered = category == null || category.isEmpty
        ? lots
        : lots.where((l) => l.category == category).toList();
    filtered.sort((a, b) => a.name.compareTo(b.name));
    return filtered;
  }

  /// Search lots by name, area, city, address or category (for example
  /// "delhi" or "airport").
  Future<List<PublicLot>> search(Session session, String query) async {
    requireUserId(session);
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return [];
    await _seedIfEmpty(session);
    final all = await PublicLot.db.find(session);
    final hits = all
        .where(
          (l) =>
              l.name.toLowerCase().contains(q) ||
              l.city.toLowerCase().contains(q) ||
              l.area.toLowerCase().contains(q) ||
              l.address.toLowerCase().contains(q) ||
              l.category.toLowerCase().contains(q),
        )
        .toList()
      ..sort((a, b) => a.name.compareTo(b.name));
    return hits.length > 40 ? hits.sublist(0, 40) : hits;
  }

  Future<void> _seedIfEmpty(Session session) async {
    final count = await PublicLot.db.count(session);
    if (count > 0) return;
    final rows = publicLotRows.map(
      (r) => PublicLot(
        name: r[0] as String,
        category: r[1] as String,
        city: r[2] as String,
        area: r[3] as String,
        address: r[4] as String,
        latitude: (r[5] as num).toDouble(),
        longitude: (r[6] as num).toDouble(),
        ratePerHour: (r[7] as num?)?.toInt(),
        capacity: (r[8] as num?)?.toInt(),
        hasEv: r[9] == 1,
        evNote: r[10] as String?,
        hours: r[11] as String?,
        bookable: r[12] == 'parkplus',
        priceNote: r[13] as String?,
      ),
    );
    await PublicLot.db.insert(session, rows.toList());
  }
}
