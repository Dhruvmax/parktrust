import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parktrust_app_client/parktrust_app_client.dart';

import 'client_provider.dart';


/// Keeps a live stream open and reloads on every event. If the stream drops
/// (common on emulators and phones when the network blinks) it reconnects after
/// a few seconds. A slow timer also reloads every 8 seconds as a safety net, so
/// the screen never stays stale.
void keepLive<T>(
  Ref ref,
  Stream<T> Function() open,
  void Function() onChange,
) {
  StreamSubscription<T>? sub;
  Timer? retry;
  var closed = false;

  // Both functions are referenced by each other, so we use late-initialized
  // variables to hold them, avoiding forward-reference compile errors.
  late final void Function() scheduleRetry;
  late final void Function() connect;

  scheduleRetry = () {
    if (closed) return;
    retry?.cancel();
    retry = Timer(const Duration(seconds: 4), () {
      sub?.cancel();
      connect();
    });
  };

  connect = () {
    if (closed) return;
    try {
      sub = open().listen(
        (_) => onChange(),
        onError: (_) => scheduleRetry(),
        onDone: scheduleRetry,
        cancelOnError: true,
      );
    } catch (_) {
      scheduleRetry();
    }
  };

  connect();
  final poll = Timer.periodic(const Duration(seconds: 8), (_) => onChange());
  ref.onDispose(() {
    closed = true;
    retry?.cancel();
    poll.cancel();
    sub?.cancel();
  });
}

/// Alerts sent to my cars. Listens to the live stream and reloads the list
/// every time the server says something changed.
class IncomingAlertsNotifier extends AsyncNotifier<List<BlockAlert>> {
  @override
  Future<List<BlockAlert>> build() {
    final api = ref.watch(clientProvider);
    keepLive(ref, () => api.alert.watchIncoming(), refresh);
    return api.alert.incomingAlerts();
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(
      () => ref.read(clientProvider).alert.incomingAlerts(),
    );
  }
}

/// Alerts I have reported, with the same live behaviour.
class SentAlertsNotifier extends AsyncNotifier<List<BlockAlert>> {
  @override
  Future<List<BlockAlert>> build() {
    final api = ref.watch(clientProvider);
    keepLive(ref, () => api.alert.watchSent(), refresh);
    return api.alert.sentAlerts();
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(
      () => ref.read(clientProvider).alert.sentAlerts(),
    );
  }
}

final incomingAlertsProvider =
    AsyncNotifierProvider.autoDispose<IncomingAlertsNotifier, List<BlockAlert>>(
      IncomingAlertsNotifier.new,
    );

final sentAlertsProvider =
    AsyncNotifierProvider.autoDispose<SentAlertsNotifier, List<BlockAlert>>(
      SentAlertsNotifier.new,
    );

/// One alert and its replies, live.
final threadProvider = StreamProvider.autoDispose.family<AlertThread, int>(
  (ref, alertId) => ref.watch(clientProvider).alert.watchThread(alertId),
);
