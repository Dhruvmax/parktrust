/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _ida;
import 'dart:typed_data' as _idt;
import 'package:http/http.dart' as _i85jenna;
import 'package:parktrust_app_client/src/protocol/alerts/alert_event.dart'
    as _i12jn0me;
import 'package:parktrust_app_client/src/protocol/alerts/alert_reply.dart'
    as _iy0m6hpp;
import 'package:parktrust_app_client/src/protocol/alerts/alert_thread.dart'
    as _i7x33bzo;
import 'package:parktrust_app_client/src/protocol/alerts/block_alert.dart'
    as _intxy6ha;
import 'package:parktrust_app_client/src/protocol/bookings/booking_view.dart'
    as _iwkozv0o;
import 'package:parktrust_app_client/src/protocol/greetings/greeting.dart'
    as _i7aawryy;
import 'package:parktrust_app_client/src/protocol/listings/listing.dart'
    as _i46um1xd;
import 'package:parktrust_app_client/src/protocol/lots/public_lot.dart'
    as _iv5p066l;
import 'package:parktrust_app_client/src/protocol/subscriptions/plan_option.dart'
    as _ie3pj7tc;
import 'package:parktrust_app_client/src/protocol/subscriptions/subscription.dart'
    as _ij72k7zz;
import 'package:parktrust_app_client/src/protocol/trust/review.dart'
    as _igujjbs7;
import 'package:parktrust_app_client/src/protocol/trust/trust_profile.dart'
    as _i823o8ek;
import 'package:parktrust_app_client/src/protocol/vehicles/vehicle.dart'
    as _inqdx6w7;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'protocol.dart' as _il2as5qe;

/// Reporting a blocked car, alerting the owner live and answering the alert.
///
/// Every method requires a signed-in user, and an alert can only be read by
/// the person who reported it or the owner it was sent to.
/// {@category Endpoint}
class EndpointAlert extends _isc.EndpointRef {
  EndpointAlert(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'alert';

  /// Reports a car that is blocking the signed-in user. The photo and
  /// location are optional. If the plate belongs to a registered owner they
  /// are alerted live; if not, the alert waits for an hour in case the owner
  /// registers the plate.
  _ida.Future<_intxy6ha.BlockAlert> createAlert(
    String plate,
    double? latitude,
    double? longitude,
    _idt.ByteData? photo,
    String? note,
  ) => caller.callServerEndpoint<_intxy6ha.BlockAlert>(
    'alert',
    'createAlert',
    {
      'plate': plate,
      'latitude': latitude,
      'longitude': longitude,
      'photo': photo,
      'note': note,
    },
  );

  /// Alerts sent to the signed-in user's cars, newest first.
  _ida.Future<List<_intxy6ha.BlockAlert>> incomingAlerts() =>
      caller.callServerEndpoint<List<_intxy6ha.BlockAlert>>(
        'alert',
        'incomingAlerts',
        {},
      );

  /// Alerts the signed-in user has reported, newest first.
  _ida.Future<List<_intxy6ha.BlockAlert>> sentAlerts() =>
      caller.callServerEndpoint<List<_intxy6ha.BlockAlert>>(
        'alert',
        'sentAlerts',
        {},
      );

  /// The owner's answer to an alert. Only the alert's owner can reply.
  _ida.Future<_iy0m6hpp.AlertReply> reply(
    int alertId,
    String message,
    int? etaMinutes,
  ) => caller.callServerEndpoint<_iy0m6hpp.AlertReply>(
    'alert',
    'reply',
    {
      'alertId': alertId,
      'message': message,
      'etaMinutes': etaMinutes,
    },
  );

  /// Marks an alert as sorted out. Either side can do this.
  _ida.Future<_intxy6ha.BlockAlert> resolve(int alertId) =>
      caller.callServerEndpoint<_intxy6ha.BlockAlert>(
        'alert',
        'resolve',
        {'alertId': alertId},
      );

  /// Live updates for alerts sent to the signed-in user's cars.
  _ida.Stream<_i12jn0me.AlertEvent> watchIncoming() =>
      caller.callStreamingServerEndpoint<
        _ida.Stream<_i12jn0me.AlertEvent>,
        _i12jn0me.AlertEvent
      >(
        'alert',
        'watchIncoming',
        {},
        {},
      );

  /// Live updates for alerts the signed-in user has reported.
  _ida.Stream<_i12jn0me.AlertEvent> watchSent() =>
      caller.callStreamingServerEndpoint<
        _ida.Stream<_i12jn0me.AlertEvent>,
        _i12jn0me.AlertEvent
      >(
        'alert',
        'watchSent',
        {},
        {},
      );

  /// One alert with its replies. Sends the current state first, then a fresh
  /// copy every time the alert changes.
  _ida.Stream<_i7x33bzo.AlertThread> watchThread(int alertId) =>
      caller.callStreamingServerEndpoint<
        _ida.Stream<_i7x33bzo.AlertThread>,
        _i7x33bzo.AlertThread
      >(
        'alert',
        'watchThread',
        {'alertId': alertId},
        {},
      );
}

/// By extending [EmailOtpIdpBaseEndpoint], the email identity provider
/// endpoints, including the passwordless sign-in with one-time passwords, are
/// made available on the server and enable the corresponding sign-in widget on
/// the client.
///
/// Extend [EmailIdpBaseEndpoint] instead for the password based sign-in only.
/// {@category Endpoint}
class EndpointEmailIdp extends _iaic.EndpointEmailIdpBase {
  EndpointEmailIdp(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _ida.Future<_iacc.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _ida.Future<_isc.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_isc.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _ida.Future<String> verifyRegistrationCode({
    required _isc.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _ida.Future<_iacc.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _ida.Future<_isc.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_isc.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _ida.Future<String> verifyPasswordResetCode({
    required _isc.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _ida.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );

  @override
  _ida.Future<bool> hasAccount() => caller.callServerEndpoint<bool>(
    'emailIdp',
    'hasAccount',
    {},
  );
}

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _iacc.EndpointRefreshJwtTokens {
  EndpointJwtRefresh(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jwtRefresh';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// If [refreshToken] is omitted, cookie-mode web clients fall back to the
  /// configured HttpOnly refresh cookie. When neither source is present this
  /// throws [RefreshTokenNotFoundException], the same public "no usable refresh
  /// credential" exception used for unknown refresh tokens.
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _ida.Future<_iacc.AuthSuccess> refreshAccessToken({String? refreshToken}) =>
      caller.callServerEndpoint<_iacc.AuthSuccess>(
        'jwtRefresh',
        'refreshAccessToken',
        {'refreshToken': refreshToken},
        authenticated: false,
      );
}

/// TEMPORARY seed endpoint — delete after seeding is done.
/// Call via: POST https://parktrust.api.serverpod.space/seed/resetDemoPasswords
/// Body: {"secret": "parktrust_seed_2024"}
/// {@category Endpoint}
class EndpointSeed extends _isc.EndpointRef {
  EndpointSeed(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'seed';

  /// Resets all demo account passwords to 'demo1234' using server-side hashing.
  _ida.Future<String> resetDemoPasswords(String secret) =>
      caller.callServerEndpoint<String>(
        'seed',
        'resetDemoPasswords',
        {'secret': secret},
      );
}

/// Creates an email + password account directly, with no verification code.
/// The app then signs in with the normal `emailIdp.login(email, password)`.
/// {@category Endpoint}
class EndpointSignup extends _isc.EndpointRef {
  EndpointSignup(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'signup';

  /// Returns 'ok' on success, otherwise a short message to show the user.
  _ida.Future<String> register(
    String email,
    String password,
  ) => caller.callServerEndpoint<String>(
    'signup',
    'register',
    {
      'email': email,
      'password': password,
    },
  );
}

/// Booking a space, QR check-in and check-out, extending, overstay penalties,
/// cancelling and rating. Payment is simulated. The platform earns from
/// memberships, so there is no fee per booking.
/// {@category Endpoint}
class EndpointBooking extends _isc.EndpointRef {
  EndpointBooking(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'booking';

  _ida.Future<_iwkozv0o.BookingView> book(
    int listingId,
    String plate,
    DateTime start,
    DateTime end,
    bool payNow,
  ) => caller.callServerEndpoint<_iwkozv0o.BookingView>(
    'booking',
    'book',
    {
      'listingId': listingId,
      'plate': plate,
      'start': start,
      'end': end,
      'payNow': payNow,
    },
  );

  /// One booking in full (with the overstay photo), for its driver or owner.
  _ida.Future<_iwkozv0o.BookingView> getBooking(int bookingId) =>
      caller.callServerEndpoint<_iwkozv0o.BookingView>(
        'booking',
        'getBooking',
        {'bookingId': bookingId},
      );

  _ida.Future<List<_iwkozv0o.BookingView>> myBookings() =>
      caller.callServerEndpoint<List<_iwkozv0o.BookingView>>(
        'booking',
        'myBookings',
        {},
      );

  _ida.Future<List<_iwkozv0o.BookingView>> hostBookings() =>
      caller.callServerEndpoint<List<_iwkozv0o.BookingView>>(
        'booking',
        'hostBookings',
        {},
      );

  /// Driver arrives and scans the owner's QR. Allowed from 30 minutes before
  /// the start.
  _ida.Future<_iwkozv0o.BookingView> checkIn(
    int bookingId,
    String qrPayload,
  ) => caller.callServerEndpoint<_iwkozv0o.BookingView>(
    'booking',
    'checkIn',
    {
      'bookingId': bookingId,
      'qrPayload': qrPayload,
    },
  );

  /// Driver leaves and scans the owner's QR again. If the owner reported an
  /// overstay with a photo, the driver pays Rs 100 for each started hour past
  /// the end time, and the owner gets half of it.
  _ida.Future<_iwkozv0o.BookingView> checkOut(
    int bookingId,
    String qrPayload,
  ) => caller.callServerEndpoint<_iwkozv0o.BookingView>(
    'booking',
    'checkOut',
    {
      'bookingId': bookingId,
      'qrPayload': qrPayload,
    },
  );

  /// Owner: the car is still there after the end time. A photo is the proof.
  /// From then on Rs 100 per started hour is charged to the driver.
  _ida.Future<_iwkozv0o.BookingView> reportOverstay(
    int bookingId,
    _idt.ByteData photo,
  ) => caller.callServerEndpoint<_iwkozv0o.BookingView>(
    'booking',
    'reportOverstay',
    {
      'bookingId': bookingId,
      'photo': photo,
    },
  );

  /// The driver shares where they are while on the way. Only the owner of the
  /// space can see it, and only until the driver checks in.
  _ida.Future<void> updateLocation(
    int bookingId,
    double latitude,
    double longitude,
  ) => caller.callServerEndpoint<void>(
    'booking',
    'updateLocation',
    {
      'bookingId': bookingId,
      'latitude': latitude,
      'longitude': longitude,
    },
  );

  /// Driver adds time. Only in the last 2 hours of the booking, and only if
  /// nobody has booked the space right after.
  _ida.Future<_iwkozv0o.BookingView> extend(
    int bookingId,
    int extraHours,
  ) => caller.callServerEndpoint<_iwkozv0o.BookingView>(
    'booking',
    'extend',
    {
      'bookingId': bookingId,
      'extraHours': extraHours,
    },
  );

  /// Pay for a reserved slot (simulated). Must be done within 10 minutes.
  _ida.Future<_iwkozv0o.BookingView> pay(int bookingId) =>
      caller.callServerEndpoint<_iwkozv0o.BookingView>(
        'booking',
        'pay',
        {'bookingId': bookingId},
      );

  /// Cancel before arriving. An unpaid reservation costs nothing. If it was
  /// paid, the money comes back only when cancelling more than 2 hours before
  /// the start. Later than that, the payment is kept.
  _ida.Future<_iwkozv0o.BookingView> cancel(int bookingId) =>
      caller.callServerEndpoint<_iwkozv0o.BookingView>(
        'booking',
        'cancel',
        {'bookingId': bookingId},
      );

  /// Rate the other side of a completed booking (1 to 5).
  _ida.Future<_igujjbs7.Review> review(
    int bookingId,
    int rating,
    String? comment,
  ) => caller.callServerEndpoint<_igujjbs7.Review>(
    'booking',
    'review',
    {
      'bookingId': bookingId,
      'rating': rating,
      'comment': comment,
    },
  );

  /// Report a problem with the other side, after the booking is over.
  _ida.Future<void> report(
    int bookingId,
    String reason,
    String? details,
  ) => caller.callServerEndpoint<void>(
    'booking',
    'report',
    {
      'bookingId': bookingId,
      'reason': reason,
      'details': details,
    },
  );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _isc.EndpointRef {
  EndpointGreeting(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _ida.Future<_i7aawryy.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i7aawryy.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

/// Drivers list their own parking space, and others search for one.
/// {@category Endpoint}
class EndpointListing extends _isc.EndpointRef {
  EndpointListing(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'listing';

  _ida.Future<_i46um1xd.Listing> createListing(
    String title,
    String? description,
    String area,
    String address,
    double latitude,
    double longitude,
    int ratePerHour,
    int capacity,
    bool hasEv,
    bool hasCctv,
    bool covered,
    bool gated,
  ) => caller.callServerEndpoint<_i46um1xd.Listing>(
    'listing',
    'createListing',
    {
      'title': title,
      'description': description,
      'area': area,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'ratePerHour': ratePerHour,
      'capacity': capacity,
      'hasEv': hasEv,
      'hasCctv': hasCctv,
      'covered': covered,
      'gated': gated,
    },
  );

  /// The signed-in user's own listings, with full addresses.
  _ida.Future<List<_i46um1xd.Listing>> myListings() =>
      caller.callServerEndpoint<List<_i46um1xd.Listing>>(
        'listing',
        'myListings',
        {},
      );

  /// The QR text for one of my spaces. The driver scans it at the gate to
  /// check in and out. Only the owner can ask for it.
  _ida.Future<String> ownerQr(int listingId) =>
      caller.callServerEndpoint<String>(
        'listing',
        'ownerQr',
        {'listingId': listingId},
      );

  /// Pause or resume a listing. Only its owner can do this.
  _ida.Future<_i46um1xd.Listing> setActive(
    int listingId,
    bool active,
  ) => caller.callServerEndpoint<_i46um1xd.Listing>(
    'listing',
    'setActive',
    {
      'listingId': listingId,
      'active': active,
    },
  );

  /// Active listings other people have posted. The exact address stays hidden
  /// until a booking exists.
  _ida.Future<List<_i46um1xd.Listing>> search(String? query) =>
      caller.callServerEndpoint<List<_i46um1xd.Listing>>(
        'listing',
        'search',
        {'query': query},
      );
}

/// Browse public parking lots. The sample list is loaded into the database
/// the first time anyone asks for it.
/// {@category Endpoint}
class EndpointPublicLot extends _isc.EndpointRef {
  EndpointPublicLot(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'publicLot';

  /// Cities that have lots, alphabetically.
  _ida.Future<List<String>> cities() => caller.callServerEndpoint<List<String>>(
    'publicLot',
    'cities',
    {},
  );

  /// Lots in one city, optionally one category (mall, airport, hospital...).
  _ida.Future<List<_iv5p066l.PublicLot>> lots(
    String city,
    String? category,
  ) => caller.callServerEndpoint<List<_iv5p066l.PublicLot>>(
    'publicLot',
    'lots',
    {
      'city': city,
      'category': category,
    },
  );

  /// Search lots by name, area, city, address or category (for example
  /// "delhi" or "airport").
  _ida.Future<List<_iv5p066l.PublicLot>> search(String query) =>
      caller.callServerEndpoint<List<_iv5p066l.PublicLot>>(
        'publicLot',
        'search',
        {'query': query},
      );
}

/// Membership plans. This is the platform's business model: a flat fee per
/// week, month or year, and no fee per booking. Payment is simulated.
/// {@category Endpoint}
class EndpointSubscription extends _isc.EndpointRef {
  EndpointSubscription(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'subscription';

  _ida.Future<List<_ie3pj7tc.PlanOption>> plans() =>
      caller.callServerEndpoint<List<_ie3pj7tc.PlanOption>>(
        'subscription',
        'plans',
        {},
      );

  /// My running membership, or null.
  _ida.Future<_ij72k7zz.Subscription?> mySubscription() =>
      caller.callServerEndpoint<_ij72k7zz.Subscription?>(
        'subscription',
        'mySubscription',
        {},
      );

  /// Join or renew. A renewal starts when the current plan ends.
  _ida.Future<_ij72k7zz.Subscription> subscribe(String plan) =>
      caller.callServerEndpoint<_ij72k7zz.Subscription>(
        'subscription',
        'subscribe',
        {'plan': plan},
      );
}

/// Trust score from real activity: finished bookings, ratings and overstays.
/// {@category Endpoint}
class EndpointTrust extends _isc.EndpointRef {
  EndpointTrust(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'trust';

  /// Trust profile for [userId], or for the signed-in user when null.
  _ida.Future<_i823o8ek.TrustProfile> trust(_isc.UuidValue? userId) =>
      caller.callServerEndpoint<_i823o8ek.TrustProfile>(
        'trust',
        'trust',
        {'userId': userId},
      );

  /// The latest ratings and comments people left for [userId] (null is me).
  _ida.Future<List<_igujjbs7.Review>> reviews(_isc.UuidValue? userId) =>
      caller.callServerEndpoint<List<_igujjbs7.Review>>(
        'trust',
        'reviews',
        {'userId': userId},
      );
}

/// Lets a signed-in user manage the number plates that alerts are sent to.
/// {@category Endpoint}
class EndpointVehicle extends _isc.EndpointRef {
  EndpointVehicle(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'vehicle';

  /// Registers a plate for the signed-in user. If someone had already
  /// reported this plate as blocking in the last hour, those alerts are
  /// handed to this user straight away.
  _ida.Future<_inqdx6w7.Vehicle> addVehicle(
    String plate,
    String? label,
  ) => caller.callServerEndpoint<_inqdx6w7.Vehicle>(
    'vehicle',
    'addVehicle',
    {
      'plate': plate,
      'label': label,
    },
  );

  /// The signed-in user's own plates, newest first.
  _ida.Future<List<_inqdx6w7.Vehicle>> myVehicles() =>
      caller.callServerEndpoint<List<_inqdx6w7.Vehicle>>(
        'vehicle',
        'myVehicles',
        {},
      );

  /// Removes one of the signed-in user's plates.
  _ida.Future<void> removeVehicle(int vehicleId) =>
      caller.callServerEndpoint<void>(
        'vehicle',
        'removeVehicle',
        {'vehicleId': vehicleId},
      );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _iaic.Caller(client);
    serverpod_auth_core = _iacc.Caller(client);
  }

  late final _iaic.Caller serverpod_auth_idp;

  late final _iacc.Caller serverpod_auth_core;
}

class Client extends _isc.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _isc.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_isc.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
    _i85jenna.Client? httpClientOverride,
  }) : super(
         host,
         _il2as5qe.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
         httpClientOverride: httpClientOverride,
       ) {
    alert = EndpointAlert(this);
    emailIdp = EndpointEmailIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    seed = EndpointSeed(this);
    signup = EndpointSignup(this);
    booking = EndpointBooking(this);
    greeting = EndpointGreeting(this);
    listing = EndpointListing(this);
    publicLot = EndpointPublicLot(this);
    subscription = EndpointSubscription(this);
    trust = EndpointTrust(this);
    vehicle = EndpointVehicle(this);
    modules = Modules(this);
  }

  late final EndpointAlert alert;

  late final EndpointEmailIdp emailIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final EndpointSeed seed;

  late final EndpointSignup signup;

  late final EndpointBooking booking;

  late final EndpointGreeting greeting;

  late final EndpointListing listing;

  late final EndpointPublicLot publicLot;

  late final EndpointSubscription subscription;

  late final EndpointTrust trust;

  late final EndpointVehicle vehicle;

  late final Modules modules;

  @override
  Map<String, _isc.EndpointRef> get endpointRefLookup => {
    'alert': alert,
    'emailIdp': emailIdp,
    'jwtRefresh': jwtRefresh,
    'seed': seed,
    'signup': signup,
    'booking': booking,
    'greeting': greeting,
    'listing': listing,
    'publicLot': publicLot,
    'subscription': subscription,
    'trust': trust,
    'vehicle': vehicle,
  };

  @override
  Map<String, _isc.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
