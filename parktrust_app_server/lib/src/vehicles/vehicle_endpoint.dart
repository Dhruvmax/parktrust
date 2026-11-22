import 'package:serverpod/serverpod.dart';

import '../alerts/alert_helpers.dart';
import '../generated/protocol.dart';

/// Lets a signed-in user manage the number plates that alerts are sent to.
class VehicleEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  static const _maxVehicles = 5;

  /// Registers a plate for the signed-in user. If someone had already
  /// reported this plate as blocking in the last hour, those alerts are
  /// handed to this user straight away.
  Future<Vehicle> addVehicle(
    Session session,
    String plate,
    String? label,
  ) async {
    final userId = requireUserId(session);
    final normalized = normalizePlate(plate);

    final existing = await Vehicle.db.findFirstRow(
      session,
      where: (t) => t.plate.equals(normalized),
    );
    if (existing != null) {
      if (existing.ownerId == userId) return existing;
      throw AlertException(
        message: 'That plate is already registered to another account.',
      );
    }

    final count = await Vehicle.db.count(
      session,
      where: (t) => t.ownerId.equals(userId),
    );
    if (count >= _maxVehicles) {
      throw AlertException(message: 'You can register up to $_maxVehicles cars.');
    }

    final cleanLabel = label?.trim();
    final vehicle = await Vehicle.db.insertRow(
      session,
      Vehicle(
        ownerId: userId,
        plate: normalized,
        label: (cleanLabel == null || cleanLabel.isEmpty) ? null : cleanLabel,
      ),
    );

    await _claimWaitingAlerts(session, userId, normalized);
    return vehicle;
  }

  /// The signed-in user's own plates, newest first.
  Future<List<Vehicle>> myVehicles(Session session) async {
    final userId = requireUserId(session);
    final vehicles = await Vehicle.db.find(
      session,
      where: (t) => t.ownerId.equals(userId),
    );
    vehicles.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return vehicles;
  }

  /// Removes one of the signed-in user's plates.
  Future<void> removeVehicle(Session session, int vehicleId) async {
    final userId = requireUserId(session);
    final vehicle = await Vehicle.db.findById(session, vehicleId);
    if (vehicle == null || vehicle.ownerId != userId) {
      throw AlertException(message: 'That car was not found.');
    }
    await Vehicle.db.deleteRow(session, vehicle);
  }

  /// Alerts raised in the last hour for a plate nobody had registered yet now
  /// belong to the user who registered it.
  Future<void> _claimWaitingAlerts(
    Session session,
    UuidValue userId,
    String plate,
  ) async {
    final cutoff = DateTime.now().subtract(const Duration(hours: 1));
    final recent = await BlockAlert.db.find(
      session,
      where: (t) => t.plate.equals(plate) & (t.createdAt > cutoff),
    );
    for (final alert in recent) {
      if (alert.ownerId != null) continue;
      if (alert.status == AlertStatus.resolved) continue;
      final claimed = await BlockAlert.db.updateRow(
        session,
        alert.copyWith(ownerId: userId),
      );
      final event = AlertEvent(kind: 'new_alert', alert: claimed);
      await session.messages.postMessage(ownerChannel(userId), event);
      await session.messages.postMessage(
        reporterChannel(claimed.reporterId),
        event,
      );
    }
  }
}
