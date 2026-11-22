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
import 'dart:typed_data' as _idt;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
import '../alerts/alert_endpoint.dart' as _itgxyvy1;
import '../auth/email_idp_endpoint.dart' as _iuc1hd5t;
import '../auth/seed_endpoint.dart' as _iseedep;
import '../auth/jwt_refresh_endpoint.dart' as _inwq3ztq;
import '../bookings/booking_endpoint.dart' as _i7f5j1eo;
import '../greetings/greeting_endpoint.dart' as _il624ik7;
import '../listings/listing_endpoint.dart' as _i9qx1xff;
import '../lots/public_lot_endpoint.dart' as _ieg2utha;
import '../subscriptions/subscription_endpoint.dart' as _i0e927jq;
import '../trust/trust_endpoint.dart' as _i0yw7ltp;
import '../vehicles/vehicle_endpoint.dart' as _ivcjezzz;

class Endpoints extends _is.EndpointDispatch {
  @override
  void initializeEndpoints(_is.Server server) {
    initializeOwnEndpoints(server);
    modules['serverpod_auth_idp'] = _iais.Endpoints()
      ..initializeOwnEndpoints(server);
    modules['serverpod_auth_core'] = _iacs.Endpoints()
      ..initializeOwnEndpoints(server);
  }

  @override
  void initializeOwnEndpoints(_is.Server server) {
    var endpoints = <String, _is.Endpoint>{
      'alert': _itgxyvy1.AlertEndpoint()
        ..initialize(
          server,
          'alert',
          null,
        ),
      'emailIdp': _iuc1hd5t.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _inwq3ztq.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'booking': _i7f5j1eo.BookingEndpoint()
        ..initialize(
          server,
          'booking',
          null,
        ),
      'greeting': _il624ik7.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
      'listing': _i9qx1xff.ListingEndpoint()
        ..initialize(
          server,
          'listing',
          null,
        ),
      'publicLot': _ieg2utha.PublicLotEndpoint()
        ..initialize(
          server,
          'publicLot',
          null,
        ),
      'subscription': _i0e927jq.SubscriptionEndpoint()
        ..initialize(
          server,
          'subscription',
          null,
        ),
      'trust': _i0yw7ltp.TrustEndpoint()
        ..initialize(
          server,
          'trust',
          null,
        ),
      'vehicle': _ivcjezzz.VehicleEndpoint()
        ..initialize(
          server,
          'vehicle',
          null,
        ),
      'seed': _iseedep.SeedEndpoint()
        ..initialize(
          server,
          'seed',
          null,
        ),
    };
    connectors['seed'] = _is.EndpointConnector(
      name: 'seed',
      endpoint: endpoints['seed']!,
      methodConnectors: {
        'resetDemoPasswords': _is.MethodConnector(
          name: 'resetDemoPasswords',
          params: {
            'secret': _is.ParameterDescription(
              name: 'secret',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _is.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['seed'] as _iseedep.SeedEndpoint).resetDemoPasswords(
                session,
                params['secret'],
              ),
        ),
      },
    );
    connectors['alert'] = _is.EndpointConnector(
      name: 'alert',
      endpoint: endpoints['alert']!,
      methodConnectors: {
        'createAlert': _is.MethodConnector(
          name: 'createAlert',
          params: {
            'plate': _is.ParameterDescription(
              name: 'plate',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'latitude': _is.ParameterDescription(
              name: 'latitude',
              type: _is.getType<double?>(),
              nullable: true,
            ),
            'longitude': _is.ParameterDescription(
              name: 'longitude',
              type: _is.getType<double?>(),
              nullable: true,
            ),
            'photo': _is.ParameterDescription(
              name: 'photo',
              type: _is.getType<_idt.ByteData?>(),
              nullable: true,
            ),
            'note': _is.ParameterDescription(
              name: 'note',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['alert'] as _itgxyvy1.AlertEndpoint).createAlert(
                    session,
                    params['plate'],
                    params['latitude'],
                    params['longitude'],
                    params['photo'],
                    params['note'],
                  ),
        ),
        'incomingAlerts': _is.MethodConnector(
          name: 'incomingAlerts',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['alert'] as _itgxyvy1.AlertEndpoint)
                  .incomingAlerts(session),
        ),
        'sentAlerts': _is.MethodConnector(
          name: 'sentAlerts',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['alert'] as _itgxyvy1.AlertEndpoint)
                  .sentAlerts(session),
        ),
        'reply': _is.MethodConnector(
          name: 'reply',
          params: {
            'alertId': _is.ParameterDescription(
              name: 'alertId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'message': _is.ParameterDescription(
              name: 'message',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'etaMinutes': _is.ParameterDescription(
              name: 'etaMinutes',
              type: _is.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['alert'] as _itgxyvy1.AlertEndpoint).reply(
                session,
                params['alertId'],
                params['message'],
                params['etaMinutes'],
              ),
        ),
        'resolve': _is.MethodConnector(
          name: 'resolve',
          params: {
            'alertId': _is.ParameterDescription(
              name: 'alertId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['alert'] as _itgxyvy1.AlertEndpoint).resolve(
                    session,
                    params['alertId'],
                  ),
        ),
        'watchIncoming': _is.MethodStreamConnector(
          name: 'watchIncoming',
          params: {},
          streamParams: {},
          returnType: _is.MethodStreamReturnType.streamType,
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
                Map<String, Stream> streamParams,
              ) => (endpoints['alert'] as _itgxyvy1.AlertEndpoint)
                  .watchIncoming(session),
        ),
        'watchSent': _is.MethodStreamConnector(
          name: 'watchSent',
          params: {},
          streamParams: {},
          returnType: _is.MethodStreamReturnType.streamType,
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
                Map<String, Stream> streamParams,
              ) => (endpoints['alert'] as _itgxyvy1.AlertEndpoint).watchSent(
                session,
              ),
        ),
        'watchThread': _is.MethodStreamConnector(
          name: 'watchThread',
          params: {
            'alertId': _is.ParameterDescription(
              name: 'alertId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _is.MethodStreamReturnType.streamType,
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
                Map<String, Stream> streamParams,
              ) => (endpoints['alert'] as _itgxyvy1.AlertEndpoint).watchThread(
                session,
                params['alertId'],
              ),
        ),
      },
    );
    connectors['emailIdp'] = _is.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _is.MethodConnector(
          name: 'login',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint).login(
                    session,
                    email: params['email'],
                    password: params['password'],
                  ),
        ),
        'startRegistration': _is.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _is.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _is.ParameterDescription(
              name: 'accountRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _is.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _is.ParameterDescription(
              name: 'registrationToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _is.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _is.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _is.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _is.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _is.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'newPassword': _is.ParameterDescription(
              name: 'newPassword',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _is.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['jwtRefresh'] = _is.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _is.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _is.ParameterDescription(
              name: 'refreshToken',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['jwtRefresh'] as _inwq3ztq.JwtRefreshEndpoint)
                      .refreshAccessToken(
                        session,
                        refreshToken: params['refreshToken'],
                      ),
        ),
      },
    );
    connectors['booking'] = _is.EndpointConnector(
      name: 'booking',
      endpoint: endpoints['booking']!,
      methodConnectors: {
        'book': _is.MethodConnector(
          name: 'book',
          params: {
            'listingId': _is.ParameterDescription(
              name: 'listingId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'plate': _is.ParameterDescription(
              name: 'plate',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'start': _is.ParameterDescription(
              name: 'start',
              type: _is.getType<DateTime>(),
              nullable: false,
            ),
            'end': _is.ParameterDescription(
              name: 'end',
              type: _is.getType<DateTime>(),
              nullable: false,
            ),
            'payNow': _is.ParameterDescription(
              name: 'payNow',
              type: _is.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['booking'] as _i7f5j1eo.BookingEndpoint).book(
                    session,
                    params['listingId'],
                    params['plate'],
                    params['start'],
                    params['end'],
                    params['payNow'],
                  ),
        ),
        'getBooking': _is.MethodConnector(
          name: 'getBooking',
          params: {
            'bookingId': _is.ParameterDescription(
              name: 'bookingId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['booking'] as _i7f5j1eo.BookingEndpoint)
                  .getBooking(
                    session,
                    params['bookingId'],
                  ),
        ),
        'myBookings': _is.MethodConnector(
          name: 'myBookings',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['booking'] as _i7f5j1eo.BookingEndpoint)
                  .myBookings(session),
        ),
        'hostBookings': _is.MethodConnector(
          name: 'hostBookings',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['booking'] as _i7f5j1eo.BookingEndpoint)
                  .hostBookings(session),
        ),
        'checkIn': _is.MethodConnector(
          name: 'checkIn',
          params: {
            'bookingId': _is.ParameterDescription(
              name: 'bookingId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'qrPayload': _is.ParameterDescription(
              name: 'qrPayload',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['booking'] as _i7f5j1eo.BookingEndpoint).checkIn(
                    session,
                    params['bookingId'],
                    params['qrPayload'],
                  ),
        ),
        'checkOut': _is.MethodConnector(
          name: 'checkOut',
          params: {
            'bookingId': _is.ParameterDescription(
              name: 'bookingId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'qrPayload': _is.ParameterDescription(
              name: 'qrPayload',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['booking'] as _i7f5j1eo.BookingEndpoint).checkOut(
                    session,
                    params['bookingId'],
                    params['qrPayload'],
                  ),
        ),
        'reportOverstay': _is.MethodConnector(
          name: 'reportOverstay',
          params: {
            'bookingId': _is.ParameterDescription(
              name: 'bookingId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'photo': _is.ParameterDescription(
              name: 'photo',
              type: _is.getType<_idt.ByteData>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['booking'] as _i7f5j1eo.BookingEndpoint)
                  .reportOverstay(
                    session,
                    params['bookingId'],
                    params['photo'],
                  ),
        ),
        'updateLocation': _is.MethodConnector(
          name: 'updateLocation',
          params: {
            'bookingId': _is.ParameterDescription(
              name: 'bookingId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'latitude': _is.ParameterDescription(
              name: 'latitude',
              type: _is.getType<double>(),
              nullable: false,
            ),
            'longitude': _is.ParameterDescription(
              name: 'longitude',
              type: _is.getType<double>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['booking'] as _i7f5j1eo.BookingEndpoint)
                  .updateLocation(
                    session,
                    params['bookingId'],
                    params['latitude'],
                    params['longitude'],
                  ),
        ),
        'extend': _is.MethodConnector(
          name: 'extend',
          params: {
            'bookingId': _is.ParameterDescription(
              name: 'bookingId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'extraHours': _is.ParameterDescription(
              name: 'extraHours',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['booking'] as _i7f5j1eo.BookingEndpoint).extend(
                    session,
                    params['bookingId'],
                    params['extraHours'],
                  ),
        ),
        'pay': _is.MethodConnector(
          name: 'pay',
          params: {
            'bookingId': _is.ParameterDescription(
              name: 'bookingId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['booking'] as _i7f5j1eo.BookingEndpoint).pay(
                    session,
                    params['bookingId'],
                  ),
        ),
        'cancel': _is.MethodConnector(
          name: 'cancel',
          params: {
            'bookingId': _is.ParameterDescription(
              name: 'bookingId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['booking'] as _i7f5j1eo.BookingEndpoint).cancel(
                    session,
                    params['bookingId'],
                  ),
        ),
        'review': _is.MethodConnector(
          name: 'review',
          params: {
            'bookingId': _is.ParameterDescription(
              name: 'bookingId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'rating': _is.ParameterDescription(
              name: 'rating',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'comment': _is.ParameterDescription(
              name: 'comment',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['booking'] as _i7f5j1eo.BookingEndpoint).review(
                    session,
                    params['bookingId'],
                    params['rating'],
                    params['comment'],
                  ),
        ),
        'report': _is.MethodConnector(
          name: 'report',
          params: {
            'bookingId': _is.ParameterDescription(
              name: 'bookingId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'reason': _is.ParameterDescription(
              name: 'reason',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'details': _is.ParameterDescription(
              name: 'details',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['booking'] as _i7f5j1eo.BookingEndpoint).report(
                    session,
                    params['bookingId'],
                    params['reason'],
                    params['details'],
                  ),
        ),
      },
    );
    connectors['greeting'] = _is.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _is.MethodConnector(
          name: 'hello',
          params: {
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['greeting'] as _il624ik7.GreetingEndpoint).hello(
                    session,
                    params['name'],
                  ),
        ),
      },
    );
    connectors['listing'] = _is.EndpointConnector(
      name: 'listing',
      endpoint: endpoints['listing']!,
      methodConnectors: {
        'createListing': _is.MethodConnector(
          name: 'createListing',
          params: {
            'title': _is.ParameterDescription(
              name: 'title',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'description': _is.ParameterDescription(
              name: 'description',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'area': _is.ParameterDescription(
              name: 'area',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'address': _is.ParameterDescription(
              name: 'address',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'latitude': _is.ParameterDescription(
              name: 'latitude',
              type: _is.getType<double>(),
              nullable: false,
            ),
            'longitude': _is.ParameterDescription(
              name: 'longitude',
              type: _is.getType<double>(),
              nullable: false,
            ),
            'ratePerHour': _is.ParameterDescription(
              name: 'ratePerHour',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'capacity': _is.ParameterDescription(
              name: 'capacity',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'hasEv': _is.ParameterDescription(
              name: 'hasEv',
              type: _is.getType<bool>(),
              nullable: false,
            ),
            'hasCctv': _is.ParameterDescription(
              name: 'hasCctv',
              type: _is.getType<bool>(),
              nullable: false,
            ),
            'covered': _is.ParameterDescription(
              name: 'covered',
              type: _is.getType<bool>(),
              nullable: false,
            ),
            'gated': _is.ParameterDescription(
              name: 'gated',
              type: _is.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['listing'] as _i9qx1xff.ListingEndpoint)
                  .createListing(
                    session,
                    params['title'],
                    params['description'],
                    params['area'],
                    params['address'],
                    params['latitude'],
                    params['longitude'],
                    params['ratePerHour'],
                    params['capacity'],
                    params['hasEv'],
                    params['hasCctv'],
                    params['covered'],
                    params['gated'],
                  ),
        ),
        'myListings': _is.MethodConnector(
          name: 'myListings',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['listing'] as _i9qx1xff.ListingEndpoint)
                  .myListings(session),
        ),
        'ownerQr': _is.MethodConnector(
          name: 'ownerQr',
          params: {
            'listingId': _is.ParameterDescription(
              name: 'listingId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['listing'] as _i9qx1xff.ListingEndpoint).ownerQr(
                    session,
                    params['listingId'],
                  ),
        ),
        'setActive': _is.MethodConnector(
          name: 'setActive',
          params: {
            'listingId': _is.ParameterDescription(
              name: 'listingId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'active': _is.ParameterDescription(
              name: 'active',
              type: _is.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['listing'] as _i9qx1xff.ListingEndpoint).setActive(
                    session,
                    params['listingId'],
                    params['active'],
                  ),
        ),
        'search': _is.MethodConnector(
          name: 'search',
          params: {
            'query': _is.ParameterDescription(
              name: 'query',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['listing'] as _i9qx1xff.ListingEndpoint).search(
                    session,
                    params['query'],
                  ),
        ),
      },
    );
    connectors['publicLot'] = _is.EndpointConnector(
      name: 'publicLot',
      endpoint: endpoints['publicLot']!,
      methodConnectors: {
        'cities': _is.MethodConnector(
          name: 'cities',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['publicLot'] as _ieg2utha.PublicLotEndpoint)
                  .cities(session),
        ),
        'lots': _is.MethodConnector(
          name: 'lots',
          params: {
            'city': _is.ParameterDescription(
              name: 'city',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'category': _is.ParameterDescription(
              name: 'category',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['publicLot'] as _ieg2utha.PublicLotEndpoint).lots(
                    session,
                    params['city'],
                    params['category'],
                  ),
        ),
        'search': _is.MethodConnector(
          name: 'search',
          params: {
            'query': _is.ParameterDescription(
              name: 'query',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['publicLot'] as _ieg2utha.PublicLotEndpoint)
                  .search(
                    session,
                    params['query'],
                  ),
        ),
      },
    );
    connectors['subscription'] = _is.EndpointConnector(
      name: 'subscription',
      endpoint: endpoints['subscription']!,
      methodConnectors: {
        'plans': _is.MethodConnector(
          name: 'plans',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['subscription'] as _i0e927jq.SubscriptionEndpoint)
                      .plans(session),
        ),
        'mySubscription': _is.MethodConnector(
          name: 'mySubscription',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['subscription'] as _i0e927jq.SubscriptionEndpoint)
                      .mySubscription(session),
        ),
        'subscribe': _is.MethodConnector(
          name: 'subscribe',
          params: {
            'plan': _is.ParameterDescription(
              name: 'plan',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['subscription'] as _i0e927jq.SubscriptionEndpoint)
                      .subscribe(
                        session,
                        params['plan'],
                      ),
        ),
      },
    );
    connectors['trust'] = _is.EndpointConnector(
      name: 'trust',
      endpoint: endpoints['trust']!,
      methodConnectors: {
        'trust': _is.MethodConnector(
          name: 'trust',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<_is.UuidValue?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['trust'] as _i0yw7ltp.TrustEndpoint).trust(
                session,
                params['userId'],
              ),
        ),
        'reviews': _is.MethodConnector(
          name: 'reviews',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<_is.UuidValue?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['trust'] as _i0yw7ltp.TrustEndpoint).reviews(
                    session,
                    params['userId'],
                  ),
        ),
      },
    );
    connectors['vehicle'] = _is.EndpointConnector(
      name: 'vehicle',
      endpoint: endpoints['vehicle']!,
      methodConnectors: {
        'addVehicle': _is.MethodConnector(
          name: 'addVehicle',
          params: {
            'plate': _is.ParameterDescription(
              name: 'plate',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'label': _is.ParameterDescription(
              name: 'label',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['vehicle'] as _ivcjezzz.VehicleEndpoint)
                  .addVehicle(
                    session,
                    params['plate'],
                    params['label'],
                  ),
        ),
        'myVehicles': _is.MethodConnector(
          name: 'myVehicles',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['vehicle'] as _ivcjezzz.VehicleEndpoint)
                  .myVehicles(session),
        ),
        'removeVehicle': _is.MethodConnector(
          name: 'removeVehicle',
          params: {
            'vehicleId': _is.ParameterDescription(
              name: 'vehicleId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['vehicle'] as _ivcjezzz.VehicleEndpoint)
                  .removeVehicle(
                    session,
                    params['vehicleId'],
                  ),
        ),
      },
    );
  }
}
