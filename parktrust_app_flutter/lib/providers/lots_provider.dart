import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parktrust_app_client/parktrust_app_client.dart';

import 'client_provider.dart';

/// Cities that have public lots.
final lotCitiesProvider = FutureProvider.autoDispose<List<String>>(
  (ref) => ref.watch(clientProvider).publicLot.cities(),
);

/// Which city and category the person is looking at.
class LotFilter {
  const LotFilter({this.city, this.category});
  final String? city;
  final String? category;
  LotFilter copyWith({String? city, String? category, bool clearCategory = false}) =>
      LotFilter(
        city: city ?? this.city,
        category: clearCategory ? null : (category ?? this.category),
      );
}

class LotFilterNotifier extends Notifier<LotFilter> {
  @override
  LotFilter build() => const LotFilter();
  void set(LotFilter f) => state = f;
}

final lotFilterProvider = NotifierProvider<LotFilterNotifier, LotFilter>(
  LotFilterNotifier.new,
);

/// Lots for the chosen city (all categories, so the filter chips are instant).
final lotsProvider = FutureProvider.autoDispose.family<List<PublicLot>, String>(
  (ref, city) => ref.watch(clientProvider).publicLot.lots(city, null),
);

/// Public lots matching a search text (empty text gives an empty list).
final lotSearchProvider = FutureProvider.autoDispose.family<List<PublicLot>, String>(
  (ref, query) => query.isEmpty
      ? Future.value(const <PublicLot>[])
      : ref.watch(clientProvider).publicLot.search(query),
);
