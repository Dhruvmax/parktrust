import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parktrust_app_client/parktrust_app_client.dart';

import 'client_provider.dart';

/// Spaces other drivers have listed. The key is the search text.
final listingSearchProvider = FutureProvider.autoDispose.family<List<Listing>, String>(
  (ref, query) => ref.watch(clientProvider).listing.search(query.isEmpty ? null : query),
);

final myListingsProvider = FutureProvider.autoDispose<List<Listing>>(
  (ref) => ref.watch(clientProvider).listing.myListings(),
);

final myBookingsProvider = FutureProvider.autoDispose<List<BookingView>>(
  (ref) => ref.watch(clientProvider).booking.myBookings(),
);

final hostBookingsProvider = FutureProvider.autoDispose<List<BookingView>>(
  (ref) => ref.watch(clientProvider).booking.hostBookings(),
);

/// Trust profile of a person. Pass null for the signed-in user.
final trustProvider = FutureProvider.autoDispose.family<TrustProfile, UuidValue?>(
  (ref, userId) => ref.watch(clientProvider).trust.trust(userId),
);

/// QR text for one of my spaces (owner only).
final ownerQrProvider = FutureProvider.autoDispose.family<String, int>(
  (ref, listingId) => ref.watch(clientProvider).listing.ownerQr(listingId),
);

final plansProvider = FutureProvider.autoDispose<List<PlanOption>>(
  (ref) => ref.watch(clientProvider).subscription.plans(),
);

/// My running membership, or null.
final membershipProvider = FutureProvider.autoDispose<Subscription?>(
  (ref) => ref.watch(clientProvider).subscription.mySubscription(),
);

/// Ratings and comments people left for someone. Null means me.
final reviewsProvider = FutureProvider.autoDispose.family<List<Review>, UuidValue?>(
  (ref, userId) => ref.watch(clientProvider).trust.reviews(userId),
);
