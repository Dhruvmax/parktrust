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
import 'package:serverpod_client/serverpod_client.dart' as _isc;

/// The owner's answer to an alert ("coming now", "5 min", ...).
abstract class AlertReply
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  AlertReply._({
    this.id,
    required this.alertId,
    required this.ownerId,
    required this.message,
    this.etaMinutes,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory AlertReply({
    int? id,
    required int alertId,
    required _isc.UuidValue ownerId,
    required String message,
    int? etaMinutes,
    DateTime? createdAt,
  }) = _AlertReplyImpl;

  factory AlertReply.fromJson(Map<String, dynamic> jsonSerialization) {
    return AlertReply(
      id: jsonSerialization['id'] as int?,
      alertId: jsonSerialization['alertId'] as int,
      ownerId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['ownerId'],
      ),
      message: jsonSerialization['message'] as String,
      etaMinutes: jsonSerialization['etaMinutes'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int alertId;

  _isc.UuidValue ownerId;

  String message;

  int? etaMinutes;

  DateTime createdAt;

  /// Returns a shallow copy of this [AlertReply]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  AlertReply copyWith({
    int? id,
    int? alertId,
    _isc.UuidValue? ownerId,
    String? message,
    int? etaMinutes,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AlertReply',
      if (id != null) 'id': id,
      'alertId': alertId,
      'ownerId': ownerId.toJson(),
      'message': message,
      if (etaMinutes != null) 'etaMinutes': etaMinutes,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AlertReply',
      if (id != null) 'id': id,
      'alertId': alertId,
      'ownerId': ownerId.toJson(),
      'message': message,
      if (etaMinutes != null) 'etaMinutes': etaMinutes,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AlertReplyImpl extends AlertReply {
  _AlertReplyImpl({
    int? id,
    required int alertId,
    required _isc.UuidValue ownerId,
    required String message,
    int? etaMinutes,
    DateTime? createdAt,
  }) : super._(
         id: id,
         alertId: alertId,
         ownerId: ownerId,
         message: message,
         etaMinutes: etaMinutes,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [AlertReply]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  AlertReply copyWith({
    Object? id = _Undefined,
    int? alertId,
    _isc.UuidValue? ownerId,
    String? message,
    Object? etaMinutes = _Undefined,
    DateTime? createdAt,
  }) {
    return AlertReply(
      id: id is int? ? id : this.id,
      alertId: alertId ?? this.alertId,
      ownerId: ownerId ?? this.ownerId,
      message: message ?? this.message,
      etaMinutes: etaMinutes is int? ? etaMinutes : this.etaMinutes,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
