/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:parktrust_app_client/src/protocol/alerts/block_alert.dart'
    as _intxy6ha;
import 'package:parktrust_app_client/src/protocol/bookings/booking_view.dart'
    as _iwkozv0o;
import 'package:parktrust_app_client/src/protocol/listings/listing.dart'
    as _i46um1xd;
import 'package:parktrust_app_client/src/protocol/lots/public_lot.dart'
    as _iv5p066l;
import 'package:parktrust_app_client/src/protocol/subscriptions/plan_option.dart'
    as _ie3pj7tc;
import 'package:parktrust_app_client/src/protocol/trust/review.dart'
    as _igujjbs7;
import 'package:parktrust_app_client/src/protocol/vehicles/vehicle.dart'
    as _inqdx6w7;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'alerts/alert_event.dart' as _iqdsqtc2;
import 'alerts/alert_exception.dart' as _i8yak2jt;
import 'alerts/alert_reply.dart' as _i7hjkq68;
import 'alerts/alert_status.dart' as _idrcyneb;
import 'alerts/alert_thread.dart' as _iidrxmri;
import 'alerts/block_alert.dart' as _idpq4py3;
import 'bookings/booking.dart' as _ir9ahijp;
import 'bookings/booking_status.dart' as _iqmkyysz;
import 'bookings/booking_view.dart' as _ixzn708v;
import 'greetings/greeting.dart' as _izw8z7ou;
import 'listings/listing.dart' as _iycp0oqx;
import 'lots/public_lot.dart' as _i3nxf39q;
import 'subscriptions/plan_option.dart' as _il9f3tn1;
import 'subscriptions/subscription.dart' as _imbfo1ol;
import 'trust/report.dart' as _i8kos0w0;
import 'trust/review.dart' as _ih4k1hlh;
import 'trust/trust_profile.dart' as _ih4fvmvz;
import 'vehicles/vehicle.dart' as _i7tlaewm;
export 'alerts/alert_event.dart';
export 'alerts/alert_exception.dart';
export 'alerts/alert_reply.dart';
export 'alerts/alert_status.dart';
export 'alerts/alert_thread.dart';
export 'alerts/block_alert.dart';
export 'bookings/booking.dart';
export 'bookings/booking_status.dart';
export 'bookings/booking_view.dart';
export 'greetings/greeting.dart';
export 'listings/listing.dart';
export 'lots/public_lot.dart';
export 'subscriptions/plan_option.dart';
export 'subscriptions/subscription.dart';
export 'trust/report.dart';
export 'trust/review.dart';
export 'trust/trust_profile.dart';
export 'vehicles/vehicle.dart';
export 'client.dart';

class Protocol extends _isc.SerializationManager
    implements _isc.ProtocolDeserializationProvider {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  @override
  _isc.ProtocolDeserialization get deserializationMetadata =>
      _isc.ProtocolDeserialization.cached(
        this,
        types: const [
          _isc.getType<_iqdsqtc2.AlertEvent>,
          _isc.getType<_i8yak2jt.AlertException>,
          _isc.getType<_i7hjkq68.AlertReply>,
          _isc.getType<_idrcyneb.AlertStatus>,
          _isc.getType<_iidrxmri.AlertThread>,
          _isc.getType<_idpq4py3.BlockAlert>,
          _isc.getType<_ir9ahijp.Booking>,
          _isc.getType<_iqmkyysz.BookingStatus>,
          _isc.getType<_ixzn708v.BookingView>,
          _isc.getType<_izw8z7ou.Greeting>,
          _isc.getType<_iycp0oqx.Listing>,
          _isc.getType<_i3nxf39q.PublicLot>,
          _isc.getType<_il9f3tn1.PlanOption>,
          _isc.getType<_imbfo1ol.Subscription>,
          _isc.getType<_i8kos0w0.Report>,
          _isc.getType<_ih4k1hlh.Review>,
          _isc.getType<_ih4fvmvz.TrustProfile>,
          _isc.getType<_i7tlaewm.Vehicle>,
          _isc.getType<_iqdsqtc2.AlertEvent?>,
          _isc.getType<_i8yak2jt.AlertException?>,
          _isc.getType<_i7hjkq68.AlertReply?>,
          _isc.getType<_idrcyneb.AlertStatus?>,
          _isc.getType<_iidrxmri.AlertThread?>,
          _isc.getType<_idpq4py3.BlockAlert?>,
          _isc.getType<_ir9ahijp.Booking?>,
          _isc.getType<_iqmkyysz.BookingStatus?>,
          _isc.getType<_ixzn708v.BookingView?>,
          _isc.getType<_izw8z7ou.Greeting?>,
          _isc.getType<_iycp0oqx.Listing?>,
          _isc.getType<_i3nxf39q.PublicLot?>,
          _isc.getType<_il9f3tn1.PlanOption?>,
          _isc.getType<_imbfo1ol.Subscription?>,
          _isc.getType<_i8kos0w0.Report?>,
          _isc.getType<_ih4k1hlh.Review?>,
          _isc.getType<_ih4fvmvz.TrustProfile?>,
          _isc.getType<_i7tlaewm.Vehicle?>,
          _isc.getType<List<_i7hjkq68.AlertReply>>,
          _isc.getType<List<_intxy6ha.BlockAlert>>,
          _isc.getType<List<_iwkozv0o.BookingView>>,
          _isc.getType<List<_i46um1xd.Listing>>,
          _isc.getType<List<String>>,
          _isc.getType<List<_iv5p066l.PublicLot>>,
          _isc.getType<List<_ie3pj7tc.PlanOption>>,
          _isc.getType<List<_igujjbs7.Review>>,
          _isc.getType<List<_inqdx6w7.Vehicle>>,
        ],
        modules: const [
          _iaic.Protocol.new,
          _iacc.Protocol.new,
        ],
        classNames: const [
          'AlertEvent',
          'AlertException',
          'AlertReply',
          'AlertStatus',
          'AlertThread',
          'BlockAlert',
          'Booking',
          'BookingStatus',
          'BookingView',
          'Greeting',
          'Listing',
          'PublicLot',
          'PlanOption',
          'Subscription',
          'Report',
          'Review',
          'TrustProfile',
          'Vehicle',
        ],
      );

  static String? getClassNameFromObjectJson(dynamic data) =>
      _isc.ProtocolDeserialization.readClassName(data);

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    final rawDataClassName = _isc.ProtocolDeserialization.readClassName(data);
    final dataClassName = rawDataClassName;
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on _isc.DeserializationClassNameNotFoundException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _iqdsqtc2.AlertEvent) {
      return _iqdsqtc2.AlertEvent.fromJson(data) as T;
    }
    if (t == _i8yak2jt.AlertException) {
      return _i8yak2jt.AlertException.fromJson(data) as T;
    }
    if (t == _i7hjkq68.AlertReply) {
      return _i7hjkq68.AlertReply.fromJson(data) as T;
    }
    if (t == _idrcyneb.AlertStatus) {
      return _idrcyneb.AlertStatus.fromJson(data) as T;
    }
    if (t == _iidrxmri.AlertThread) {
      return _iidrxmri.AlertThread.fromJson(data) as T;
    }
    if (t == _idpq4py3.BlockAlert) {
      return _idpq4py3.BlockAlert.fromJson(data) as T;
    }
    if (t == _ir9ahijp.Booking) {
      return _ir9ahijp.Booking.fromJson(data) as T;
    }
    if (t == _iqmkyysz.BookingStatus) {
      return _iqmkyysz.BookingStatus.fromJson(data) as T;
    }
    if (t == _ixzn708v.BookingView) {
      return _ixzn708v.BookingView.fromJson(data) as T;
    }
    if (t == _izw8z7ou.Greeting) {
      return _izw8z7ou.Greeting.fromJson(data) as T;
    }
    if (t == _iycp0oqx.Listing) {
      return _iycp0oqx.Listing.fromJson(data) as T;
    }
    if (t == _i3nxf39q.PublicLot) {
      return _i3nxf39q.PublicLot.fromJson(data) as T;
    }
    if (t == _il9f3tn1.PlanOption) {
      return _il9f3tn1.PlanOption.fromJson(data) as T;
    }
    if (t == _imbfo1ol.Subscription) {
      return _imbfo1ol.Subscription.fromJson(data) as T;
    }
    if (t == _i8kos0w0.Report) {
      return _i8kos0w0.Report.fromJson(data) as T;
    }
    if (t == _ih4k1hlh.Review) {
      return _ih4k1hlh.Review.fromJson(data) as T;
    }
    if (t == _ih4fvmvz.TrustProfile) {
      return _ih4fvmvz.TrustProfile.fromJson(data) as T;
    }
    if (t == _i7tlaewm.Vehicle) {
      return _i7tlaewm.Vehicle.fromJson(data) as T;
    }
    if (t == _isc.getType<_iqdsqtc2.AlertEvent?>()) {
      return (data != null ? _iqdsqtc2.AlertEvent.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i8yak2jt.AlertException?>()) {
      return (data != null ? _i8yak2jt.AlertException.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_i7hjkq68.AlertReply?>()) {
      return (data != null ? _i7hjkq68.AlertReply.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_idrcyneb.AlertStatus?>()) {
      return (data != null ? _idrcyneb.AlertStatus.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iidrxmri.AlertThread?>()) {
      return (data != null ? _iidrxmri.AlertThread.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_idpq4py3.BlockAlert?>()) {
      return (data != null ? _idpq4py3.BlockAlert.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ir9ahijp.Booking?>()) {
      return (data != null ? _ir9ahijp.Booking.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iqmkyysz.BookingStatus?>()) {
      return (data != null ? _iqmkyysz.BookingStatus.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ixzn708v.BookingView?>()) {
      return (data != null ? _ixzn708v.BookingView.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iycp0oqx.Listing?>()) {
      return (data != null ? _iycp0oqx.Listing.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i3nxf39q.PublicLot?>()) {
      return (data != null ? _i3nxf39q.PublicLot.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_il9f3tn1.PlanOption?>()) {
      return (data != null ? _il9f3tn1.PlanOption.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_imbfo1ol.Subscription?>()) {
      return (data != null ? _imbfo1ol.Subscription.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i8kos0w0.Report?>()) {
      return (data != null ? _i8kos0w0.Report.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ih4k1hlh.Review?>()) {
      return (data != null ? _ih4k1hlh.Review.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ih4fvmvz.TrustProfile?>()) {
      return (data != null ? _ih4fvmvz.TrustProfile.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i7tlaewm.Vehicle?>()) {
      return (data != null ? _i7tlaewm.Vehicle.fromJson(data) : null) as T;
    }
    if (t == List<_i7hjkq68.AlertReply>) {
      return (data as List)
              .map((e) => deserialize<_i7hjkq68.AlertReply>(e))
              .toList()
          as T;
    }
    if (t == List<_intxy6ha.BlockAlert>) {
      return (data as List)
              .map((e) => deserialize<_intxy6ha.BlockAlert>(e))
              .toList()
          as T;
    }
    if (t == List<_iwkozv0o.BookingView>) {
      return (data as List)
              .map((e) => deserialize<_iwkozv0o.BookingView>(e))
              .toList()
          as T;
    }
    if (t == List<_i46um1xd.Listing>) {
      return (data as List)
              .map((e) => deserialize<_i46um1xd.Listing>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_iv5p066l.PublicLot>) {
      return (data as List)
              .map((e) => deserialize<_iv5p066l.PublicLot>(e))
              .toList()
          as T;
    }
    if (t == List<_ie3pj7tc.PlanOption>) {
      return (data as List)
              .map((e) => deserialize<_ie3pj7tc.PlanOption>(e))
              .toList()
          as T;
    }
    if (t == List<_igujjbs7.Review>) {
      return (data as List)
              .map((e) => deserialize<_igujjbs7.Review>(e))
              .toList()
          as T;
    }
    if (t == List<_inqdx6w7.Vehicle>) {
      return (data as List)
              .map((e) => deserialize<_inqdx6w7.Vehicle>(e))
              .toList()
          as T;
    }
    final modules = deserializationMetadata.modulesForDeserialization(
      t,
      className: rawDataClassName,
    );
    for (final module in modules) {
      try {
        return module.deserialize<T>(data, t);
      } on _isc.DeserializationTypeNotFoundException catch (_) {}
    }

    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _iqdsqtc2.AlertEvent => 'AlertEvent',
      _i8yak2jt.AlertException => 'AlertException',
      _i7hjkq68.AlertReply => 'AlertReply',
      _idrcyneb.AlertStatus => 'AlertStatus',
      _iidrxmri.AlertThread => 'AlertThread',
      _idpq4py3.BlockAlert => 'BlockAlert',
      _ir9ahijp.Booking => 'Booking',
      _iqmkyysz.BookingStatus => 'BookingStatus',
      _ixzn708v.BookingView => 'BookingView',
      _izw8z7ou.Greeting => 'Greeting',
      _iycp0oqx.Listing => 'Listing',
      _i3nxf39q.PublicLot => 'PublicLot',
      _il9f3tn1.PlanOption => 'PlanOption',
      _imbfo1ol.Subscription => 'Subscription',
      _i8kos0w0.Report => 'Report',
      _ih4k1hlh.Review => 'Review',
      _ih4fvmvz.TrustProfile => 'TrustProfile',
      _i7tlaewm.Vehicle => 'Vehicle',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst(
        'parktrust_app.',
        '',
      );
    }

    switch (data) {
      case _iqdsqtc2.AlertEvent():
        return 'AlertEvent';
      case _i8yak2jt.AlertException():
        return 'AlertException';
      case _i7hjkq68.AlertReply():
        return 'AlertReply';
      case _idrcyneb.AlertStatus():
        return 'AlertStatus';
      case _iidrxmri.AlertThread():
        return 'AlertThread';
      case _idpq4py3.BlockAlert():
        return 'BlockAlert';
      case _ir9ahijp.Booking():
        return 'Booking';
      case _iqmkyysz.BookingStatus():
        return 'BookingStatus';
      case _ixzn708v.BookingView():
        return 'BookingView';
      case _izw8z7ou.Greeting():
        return 'Greeting';
      case _iycp0oqx.Listing():
        return 'Listing';
      case _i3nxf39q.PublicLot():
        return 'PublicLot';
      case _il9f3tn1.PlanOption():
        return 'PlanOption';
      case _imbfo1ol.Subscription():
        return 'Subscription';
      case _i8kos0w0.Report():
        return 'Report';
      case _ih4k1hlh.Review():
        return 'Review';
      case _ih4fvmvz.TrustProfile():
        return 'TrustProfile';
      case _i7tlaewm.Vehicle():
        return 'Vehicle';
    }
    className = _iaic.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacc.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'AlertEvent') {
      return deserialize<_iqdsqtc2.AlertEvent>(data['data']);
    }
    if (dataClassName == 'AlertException') {
      return deserialize<_i8yak2jt.AlertException>(data['data']);
    }
    if (dataClassName == 'AlertReply') {
      return deserialize<_i7hjkq68.AlertReply>(data['data']);
    }
    if (dataClassName == 'AlertStatus') {
      return deserialize<_idrcyneb.AlertStatus>(data['data']);
    }
    if (dataClassName == 'AlertThread') {
      return deserialize<_iidrxmri.AlertThread>(data['data']);
    }
    if (dataClassName == 'BlockAlert') {
      return deserialize<_idpq4py3.BlockAlert>(data['data']);
    }
    if (dataClassName == 'Booking') {
      return deserialize<_ir9ahijp.Booking>(data['data']);
    }
    if (dataClassName == 'BookingStatus') {
      return deserialize<_iqmkyysz.BookingStatus>(data['data']);
    }
    if (dataClassName == 'BookingView') {
      return deserialize<_ixzn708v.BookingView>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_izw8z7ou.Greeting>(data['data']);
    }
    if (dataClassName == 'Listing') {
      return deserialize<_iycp0oqx.Listing>(data['data']);
    }
    if (dataClassName == 'PublicLot') {
      return deserialize<_i3nxf39q.PublicLot>(data['data']);
    }
    if (dataClassName == 'PlanOption') {
      return deserialize<_il9f3tn1.PlanOption>(data['data']);
    }
    if (dataClassName == 'Subscription') {
      return deserialize<_imbfo1ol.Subscription>(data['data']);
    }
    if (dataClassName == 'Report') {
      return deserialize<_i8kos0w0.Report>(data['data']);
    }
    if (dataClassName == 'Review') {
      return deserialize<_ih4k1hlh.Review>(data['data']);
    }
    if (dataClassName == 'TrustProfile') {
      return deserialize<_ih4fvmvz.TrustProfile>(data['data']);
    }
    if (dataClassName == 'Vehicle') {
      return deserialize<_i7tlaewm.Vehicle>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      return _iaic.Protocol().deserializeByClassName({
        ...data,
        'className': dataClassName.substring(19),
      });
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      return _iacc.Protocol().deserializeByClassName({
        ...data,
        'className': dataClassName.substring(20),
      });
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iaic.Protocol().registerHostProtocol('parktrust_app', this);
    _iacc.Protocol().registerHostProtocol('parktrust_app', this);
  }

  @override
  String getModuleName() => 'parktrust_app';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _iaic.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacc.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
