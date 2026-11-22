import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    show AuthServices;
import 'package:serverpod_auth_idp_server/providers/email.dart';

/// Creates an email + password account directly, with no verification code.
/// The app then signs in with the normal `emailIdp.login(email, password)`.
class SignupEndpoint extends Endpoint {
  @override
  bool get requireLogin => false;

  /// Returns 'ok' on success, otherwise a short message to show the user.
  Future<String> register(Session session, String email, String password) async {
    final mail = email.trim().toLowerCase();
    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(mail)) {
      return 'Enter a valid email address.';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters.';
    }
    final admin = AuthServices.instance.emailIdp.admin;
    if (await admin.findAccount(session, email: mail) != null) {
      return 'An account with this email already exists. Sign in instead.';
    }
    final user = await AuthServices.instance.authUsers.create(session);
    await admin.createEmailAuthentication(
      session,
      authUserId: user.id,
      email: mail,
      password: password,
    );
    return 'ok';
  }
}
