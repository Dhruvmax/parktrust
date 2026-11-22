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

/// One alert with all its replies, from the point of view of the viewer.
abstract class AlertThread
    implements _is.SerializableModel, _is.ProtocolSerialization {
  AlertThread._({
    required this.alert,
    required this.replies,
    required this.viewerIsOwner,
    required this.viewerIsReporter,
  });

  factory AlertThread({
    required _i1j0wl8l.BlockAlert alert,
    required List<_iluytw28.AlertReply> replies,
    required bool viewerIsOwner,
    required bool viewerIsReporter,
  }) = _AlertThreadImpl;

  factory AlertThread.fromJson(Map<String, dynamic> jsonSerialization) {
    return AlertThread(
      alert: _idb6hsrp.Protocol().deserialize<_i1j0wl8l.BlockAlert>(
        jsonSerialization['alert'],
      ),
      replies: _idb6hsrp.Protocol().deserialize<List<_iluytw28.AlertReply>>(
        jsonSerialization['replies'],
      ),
      viewerIsOwner: _is.BoolJsonExtension.fromJson(
        jsonSerialization['viewerIsOwner'],
      ),
      viewerIsReporter: _is.BoolJsonExtension.fromJson(
        jsonSerialization['viewerIsReporter'],
      ),
    );
  }

  _i1j0wl8l.BlockAlert alert;

  List<_iluytw28.AlertReply> replies;

  bool viewerIsOwner;

  bool viewerIsReporter;

  /// Returns a shallow copy of this [AlertThread]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  AlertThread copyWith({
    _i1j0wl8l.BlockAlert? alert,
    List<_iluytw28.AlertReply>? replies,
    bool? viewerIsOwner,
    bool? viewerIsReporter,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AlertThread',
      'alert': alert.toJson(),
      'replies': replies.toJson(valueToJson: (v) => v.toJson()),
      'viewerIsOwner': viewerIsOwner,
      'viewerIsReporter': viewerIsReporter,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AlertThread',
      'alert': alert.toJsonForProtocol(),
      'replies': replies.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'viewerIsOwner': viewerIsOwner,
      'viewerIsReporter': viewerIsReporter,
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _AlertThreadImpl extends AlertThread {
  _AlertThreadImpl({
    required _i1j0wl8l.BlockAlert alert,
    required List<_iluytw28.AlertReply> replies,
    required bool viewerIsOwner,
    required bool viewerIsReporter,
  }) : super._(
         alert: alert,
         replies: replies,
         viewerIsOwner: viewerIsOwner,
         viewerIsReporter: viewerIsReporter,
       );

  /// Returns a shallow copy of this [AlertThread]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  AlertThread copyWith({
    _i1j0wl8l.BlockAlert? alert,
    List<_iluytw28.AlertReply>? replies,
    bool? viewerIsOwner,
    bool? viewerIsReporter,
  }) {
    return AlertThread(
      alert: alert ?? this.alert.copyWith(),
      replies: replies ?? this.replies.map((e0) => e0.copyWith()).toList(),
      viewerIsOwner: viewerIsOwner ?? this.viewerIsOwner,
      viewerIsReporter: viewerIsReporter ?? this.viewerIsReporter,
    );
  }
}
