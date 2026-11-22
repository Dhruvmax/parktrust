import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    show AuthServices;
import 'package:serverpod_auth_idp_server/providers/email.dart';

/// TEMPORARY seed endpoint — delete after seeding is done.
/// Call via: POST https://parktrust.api.serverpod.space/seed/resetDemoPasswords
/// Body: {"secret": "parktrust_seed_2024"}
class SeedEndpoint extends Endpoint {
  @override
  bool get requireLogin => false;

  static const _secret = 'parktrust_seed_2024';
  static const _password = 'demo1234';

  static const _emails = [
    'driver@demo.com',
    'driver2@demo.com',
    'driver3@demo.com',
    'owner@demo.com',
    'owner2@demo.com',
    'owner3@demo.com',
    'admin@demo.com',
  ];

  /// Resets all demo account passwords to 'demo1234' using server-side hashing.
  Future<String> resetDemoPasswords(Session session, String secret) async {
    if (secret != _secret) return 'Unauthorized';

    final admin = AuthServices.instance.emailIdp.admin;
    final results = <String>[];

    for (final email in _emails) {
      try {
        await admin.setPassword(session, email: email, password: _password);
        results.add('✓ $email');
      } catch (e) {
        results.add('✗ $email: $e');
      }
    }

    return results.join('\n');
  }
}
