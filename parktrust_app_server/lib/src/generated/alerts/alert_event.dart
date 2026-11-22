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
import 'package:parktrust_app_server/src/generated/protocol.dart' as _idb6hsrp;
import 'package:serverpod/serverpod.dart' as _is;
import '../alerts/alert_reply.dart' as _iluytw28;
import '../alerts/block_alert.dart' as _i1j0wl8l;

/// A live update pushed to the phones. kind is new_alert, reply or status.
abstract class AlertEvent
    implements _is.SerializableModel, _is.ProtocolSerialization {
  AlertEvent._({
    required this.kind,
    required this.alert,
    this.reply,
  });

  factory AlertEvent({
    required String kind,
    required _i1j0wl8l.BlockAlert alert,
    _iluytw28.AlertReply? reply,
  }) = _AlertEventImpl;

  factory AlertEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return AlertEvent(
      kind: jsonSerialization['kind'] as String,
      alert: _idb6hsrp.Protocol().deserialize<_i1j0wl8l.BlockAlert>(
        jsonSerialization['alert'],
      ),
      reply: jsonSerialization['reply'] == null
          ? null
          : _idb6hsrp.Protocol().deserialize<_iluytw28.AlertReply>(
              jsonSerialization['reply'],
            ),
    );
  }

  String kind;

  _i1j0wl8l.BlockAlert alert;

  _iluytw28.AlertReply? reply;

  /// Returns a shallow copy of this [AlertEvent]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  AlertEvent copyWith({
    String? kind,
    _i1j0wl8l.BlockAlert? alert,
    _iluytw28.AlertReply? reply = const _UndefinedAlertEvent$reply(),
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AlertEvent',
      'kind': kind,
      'alert': alert.toJson(),
      if (reply != null) 'reply': reply?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AlertEvent',
      'kind': kind,
      'alert': alert.toJsonForProtocol(),
      if (reply != null) 'reply': reply?.toJsonForProtocol(),
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _UndefinedAlertEvent$reply extends _is.UndefinedSentinel
    implements _iluytw28.AlertReply {
  const _UndefinedAlertEvent$reply();
}

class _AlertEventImpl extends AlertEvent {
  _AlertEventImpl({
    required String kind,
    required _i1j0wl8l.BlockAlert alert,
    _iluytw28.AlertReply? reply,
  }) : super._(
         kind: kind,
         alert: alert,
         reply: reply,
       );

  /// Returns a shallow copy of this [AlertEvent]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  AlertEvent copyWith({
    String? kind,
    _i1j0wl8l.BlockAlert? alert,
    _iluytw28.AlertReply? reply = const _UndefinedAlertEvent$reply(),
  }) {
    return AlertEvent(
      kind: kind ?? this.kind,
      alert: alert ?? this.alert.copyWith(),
      reply: reply is _is.UndefinedSentinel ? this.reply?.copyWith() : reply,
    );
  }
}
