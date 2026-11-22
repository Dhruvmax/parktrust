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
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import '../alerts/alert_status.dart' as _iq54p1ko;

/// A report that a car is blocking someone in.
abstract class BlockAlert
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  BlockAlert._({
    this.id,
    required this.reporterId,
    this.ownerId,
    required this.plate,
    this.latitude,
    this.longitude,
    this.photo,
    this.note,
    required this.status,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory BlockAlert({
    int? id,
    required _isc.UuidValue reporterId,
    _isc.UuidValue? ownerId,
    required String plate,
    double? latitude,
    double? longitude,
    _idt.ByteData? photo,
    String? note,
    required _iq54p1ko.AlertStatus status,
    DateTime? createdAt,
  }) = _BlockAlertImpl;

  factory BlockAlert.fromJson(Map<String, dynamic> jsonSerialization) {
    return BlockAlert(
      id: jsonSerialization['id'] as int?,
      reporterId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['reporterId'],
      ),
      ownerId: jsonSerialization['ownerId'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['ownerId']),
      plate: jsonSerialization['plate'] as String,
      latitude: (jsonSerialization['latitude'] as num?)?.toDouble(),
      longitude: (jsonSerialization['longitude'] as num?)?.toDouble(),
      photo: jsonSerialization['photo'] == null
          ? null
          : _isc.ByteDataJsonExtension.fromJson(jsonSerialization['photo']),
      note: jsonSerialization['note'] as String?,
      status: _iq54p1ko.AlertStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _isc.UuidValue reporterId;

  _isc.UuidValue? ownerId;

  String plate;

  double? latitude;

  double? longitude;

  _idt.ByteData? photo;

  String? note;

  _iq54p1ko.AlertStatus status;

  DateTime createdAt;

  /// Returns a shallow copy of this [BlockAlert]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  BlockAlert copyWith({
    int? id,
    _isc.UuidValue? reporterId,
    _isc.UuidValue? ownerId = const _isc.$UndefinedUuidValue(),
    String? plate,
    double? latitude,
    double? longitude,
    _idt.ByteData? photo,
    String? note,
    _iq54p1ko.AlertStatus? status,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BlockAlert',
      if (id != null) 'id': id,
      'reporterId': reporterId.toJson(),
      if (ownerId != null) 'ownerId': ownerId?.toJson(),
      'plate': plate,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (photo != null) 'photo': photo?.toJson(),
      if (note != null) 'note': note,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'BlockAlert',
      if (id != null) 'id': id,
      'reporterId': reporterId.toJson(),
      if (ownerId != null) 'ownerId': ownerId?.toJson(),
      'plate': plate,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (photo != null) 'photo': photo?.toJson(),
      if (note != null) 'note': note,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BlockAlertImpl extends BlockAlert {
  _BlockAlertImpl({
    int? id,
    required _isc.UuidValue reporterId,
    _isc.UuidValue? ownerId,
    required String plate,
    double? latitude,
    double? longitude,
    _idt.ByteData? photo,
    String? note,
    required _iq54p1ko.AlertStatus status,
    DateTime? createdAt,
  }) : super._(
         id: id,
         reporterId: reporterId,
         ownerId: ownerId,
         plate: plate,
         latitude: latitude,
         longitude: longitude,
         photo: photo,
         note: note,
         status: status,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [BlockAlert]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  BlockAlert copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? reporterId,
    _isc.UuidValue? ownerId = const _isc.$UndefinedUuidValue(),
    String? plate,
    Object? latitude = _Undefined,
    Object? longitude = _Undefined,
    Object? photo = _Undefined,
    Object? note = _Undefined,
    _iq54p1ko.AlertStatus? status,
    DateTime? createdAt,
  }) {
    return BlockAlert(
      id: id is int? ? id : this.id,
      reporterId: reporterId ?? this.reporterId,
      ownerId: ownerId is _isc.UndefinedSentinel ? this.ownerId : ownerId,
      plate: plate ?? this.plate,
      latitude: latitude is double? ? latitude : this.latitude,
      longitude: longitude is double? ? longitude : this.longitude,
      photo: photo is _idt.ByteData? ? photo : this.photo?.clone(),
      note: note is String? ? note : this.note,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
