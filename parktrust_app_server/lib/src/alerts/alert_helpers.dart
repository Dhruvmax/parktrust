import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';

import '../generated/protocol.dart';

/// The signed-in user's id, or a friendly error.
UuidValue requireUserId(Session session) {
  final id = session.authenticated?.authUserId;
  if (id == null) {
    throw AlertException(message: 'Please sign in first.');
  }
  return id;
}

/// Upper-case letters and digits only, for example "MH 12 ab-1234" becomes
/// "MH12AB1234". Rejects anything that cannot be a number plate.
String normalizePlate(String raw) {
  final plate = raw.toUpperCase().replaceAll(RegExp(r'[^A-Z0-9]'), '');
  if (plate.length < 6 || plate.length > 12) {
    throw AlertException(
      message: 'Enter a valid number plate, for example MH12AB1234.',
    );
  }
  return plate;
}

/// Live-update channels (server messages). One per owner, per reporter and
/// per alert, so each phone only hears about its own alerts.
String ownerChannel(UuidValue id) => 'owner-${id.uuid}';
String reporterChannel(UuidValue id) => 'reporter-${id.uuid}';
String threadChannel(int alertId) => 'alert-$alertId';
