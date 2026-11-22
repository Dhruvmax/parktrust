import 'dart:typed_data';

import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import 'alert_helpers.dart';

/// Reporting a blocked car, alerting the owner live and answering the alert.
///
/// Every method requires a signed-in user, and an alert can only be read by
/// the person who reported it or the owner it was sent to.
class AlertEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  // A photo is sent as base64, which is a third bigger, and the request limit
  // is 512 kB, so keep the raw photo comfortably below that.
  static const _maxPhotoBytes = 300 * 1024;
  static const _maxReportsPerPlate = 3;

  /// Reports a car that is blocking the signed-in user. The photo and
  /// location are optional. If the plate belongs to a registered owner they
  /// are alerted live; if not, the alert waits for an hour in case the owner
  /// registers the plate.
  Future<BlockAlert> createAlert(
    Session session,
    String plate,
    double? latitude,
    double? longitude,
    ByteData? photo,
    String? note,
  ) async {
    final reporterId = requireUserId(session);
    final normalized = normalizePlate(plate);

    if (photo != null && photo.lengthInBytes > _maxPhotoBytes) {
      throw AlertException(message: 'The photo is too large. Try again.');
    }
    final cleanNote = note?.trim();
    if (cleanNote != null && cleanNote.length > 200) {
      throw AlertException(message: 'Keep the note under 200 characters.');
    }
    if (latitude != null && (latitude < -90 || latitude > 90)) {
      throw AlertException(message: 'That location is not valid.');
    }
    if (longitude != null && (longitude < -180 || longitude > 180)) {
      throw AlertException(message: 'That location is not valid.');
    }

    final vehicle = await Vehicle.db.findFirstRow(
      session,
      where: (t) => t.plate.equals(normalized),
    );
    if (vehicle != null && vehicle.ownerId == reporterId) {
      throw AlertException(message: 'That is your own car.');
    }

    // Stop one person from flooding an owner with alerts.
    final cutoff = DateTime.now().subtract(const Duration(minutes: 10));
    final recentReports = await BlockAlert.db.count(
      session,
      where: (t) =>
          t.reporterId.equals(reporterId) &
          t.plate.equals(normalized) &
          (t.createdAt > cutoff),
    );
    if (recentReports >= _maxReportsPerPlate) {
      throw AlertException(
        message: 'You already alerted this car a few times. Please wait a bit.',
      );
    }

    final alert = await BlockAlert.db.insertRow(
      session,
      BlockAlert(
        reporterId: reporterId,
        ownerId: vehicle?.ownerId,
        plate: normalized,
        latitude: latitude,
        longitude: longitude,
        photo: photo,
        note: (cleanNote == null || cleanNote.isEmpty) ? null : cleanNote,
        status: AlertStatus.open,
      ),
    );

    final event = AlertEvent(kind: 'new_alert', alert: alert);
    final ownerId = alert.ownerId;
    if (ownerId != null) {
      await session.messages.postMessage(ownerChannel(ownerId), event);
    }
    await session.messages.postMessage(reporterChannel(reporterId), event);
    return alert;
  }

  /// Alerts sent to the signed-in user's cars, newest first.
  Future<List<BlockAlert>> incomingAlerts(Session session) async {
    final userId = requireUserId(session);
    final alerts = await BlockAlert.db.find(
      session,
      where: (t) => t.ownerId.equals(userId),
      limit: 20,
    );
    alerts.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return alerts;
  }

  /// Alerts the signed-in user has reported, newest first.
  Future<List<BlockAlert>> sentAlerts(Session session) async {
    final userId = requireUserId(session);
    final alerts = await BlockAlert.db.find(
      session,
      where: (t) => t.reporterId.equals(userId),
      limit: 20,
    );
    alerts.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return alerts;
  }

  /// The owner's answer to an alert. Only the alert's owner can reply.
  Future<AlertReply> reply(
    Session session,
    int alertId,
    String message,
    int? etaMinutes,
  ) async {
    final userId = requireUserId(session);
    final alert = await _accessibleAlert(session, alertId, userId);
    if (alert.ownerId != userId) {
      throw AlertException(message: 'Only the car owner can reply.');
    }
    if (alert.status == AlertStatus.resolved) {
      throw AlertException(message: 'This alert is already resolved.');
    }
    final text = message.trim();
    if (text.isEmpty || text.length > 140) {
      throw AlertException(message: 'Write a short reply (up to 140 letters).');
    }
    if (etaMinutes != null && (etaMinutes < 0 || etaMinutes > 240)) {
      throw AlertException(message: 'Choose a time between 0 and 240 minutes.');
    }

    final saved = await AlertReply.db.insertRow(
      session,
      AlertReply(
        alertId: alertId,
        ownerId: userId,
        message: text,
        etaMinutes: etaMinutes,
      ),
    );
    final updated = alert.status == AlertStatus.open
        ? await BlockAlert.db.updateRow(
            session,
            alert.copyWith(status: AlertStatus.acknowledged),
          )
        : alert;

    await _publish(
      session,
      AlertEvent(kind: 'reply', alert: updated, reply: saved),
    );
    return saved;
  }

  /// Marks an alert as sorted out. Either side can do this.
  Future<BlockAlert> resolve(Session session, int alertId) async {
    final userId = requireUserId(session);
    final alert = await _accessibleAlert(session, alertId, userId);
    if (alert.status == AlertStatus.resolved) return alert;
    final updated = await BlockAlert.db.updateRow(
      session,
      alert.copyWith(status: AlertStatus.resolved),
    );
    await _publish(session, AlertEvent(kind: 'status', alert: updated));
    return updated;
  }

  /// Live updates for alerts sent to the signed-in user's cars.
  Stream<AlertEvent> watchIncoming(Session session) async* {
    final userId = requireUserId(session);
    final updates = session.messages.createStream<AlertEvent>(
      ownerChannel(userId),
    );
    await for (final event in updates) {
      yield event;
    }
  }

  /// Live updates for alerts the signed-in user has reported.
  Stream<AlertEvent> watchSent(Session session) async* {
    final userId = requireUserId(session);
    final updates = session.messages.createStream<AlertEvent>(
      reporterChannel(userId),
    );
    await for (final event in updates) {
      yield event;
    }
  }

  /// One alert with its replies. Sends the current state first, then a fresh
  /// copy every time the alert changes.
  Stream<AlertThread> watchThread(Session session, int alertId) async* {
    final userId = requireUserId(session);
    final updates = session.messages.createStream<AlertEvent>(
      threadChannel(alertId),
    );
    yield await _thread(session, alertId, userId);
    await for (final _ in updates) {
      yield await _thread(session, alertId, userId);
    }
  }

  Future<BlockAlert> _accessibleAlert(
    Session session,
    int alertId,
    UuidValue userId,
  ) async {
    final alert = await BlockAlert.db.findById(session, alertId);
    if (alert == null ||
        (alert.reporterId != userId && alert.ownerId != userId)) {
      // Same message for "missing" and "not yours", so ids cannot be probed.
      throw AlertException(message: 'That alert was not found.');
    }
    return alert;
  }

  Future<AlertThread> _thread(
    Session session,
    int alertId,
    UuidValue userId,
  ) async {
    final alert = await _accessibleAlert(session, alertId, userId);
    final replies = await AlertReply.db.find(
      session,
      where: (t) => t.alertId.equals(alertId),
    );
    replies.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    return AlertThread(
      alert: alert,
      replies: replies,
      viewerIsOwner: alert.ownerId == userId,
      viewerIsReporter: alert.reporterId == userId,
    );
  }

  Future<void> _publish(Session session, AlertEvent event) async {
    final alertId = event.alert.id;
    if (alertId != null) {
      await session.messages.postMessage(threadChannel(alertId), event);
    }
    final ownerId = event.alert.ownerId;
    if (ownerId != null) {
      await session.messages.postMessage(ownerChannel(ownerId), event);
    }
    await session.messages.postMessage(
      reporterChannel(event.alert.reporterId),
      event,
    );
  }
}
