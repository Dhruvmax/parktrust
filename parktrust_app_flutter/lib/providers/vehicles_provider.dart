import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parktrust_app_client/parktrust_app_client.dart';

import 'client_provider.dart';

/// The signed-in user's registered cars: loading, data or error.
class VehiclesNotifier extends AsyncNotifier<List<Vehicle>> {
  @override
  Future<List<Vehicle>> build() => ref.watch(clientProvider).vehicle.myVehicles();

  Future<void> add(String plate, String? label) async {
    await ref.read(clientProvider).vehicle.addVehicle(plate, label);
    state = await AsyncValue.guard(
      () => ref.read(clientProvider).vehicle.myVehicles(),
    );
  }

  Future<void> remove(int id) async {
    await ref.read(clientProvider).vehicle.removeVehicle(id);
    state = await AsyncValue.guard(
      () => ref.read(clientProvider).vehicle.myVehicles(),
    );
  }
}

final vehiclesProvider =
    AsyncNotifierProvider.autoDispose<VehiclesNotifier, List<Vehicle>>(
      VehiclesNotifier.new,
    );
