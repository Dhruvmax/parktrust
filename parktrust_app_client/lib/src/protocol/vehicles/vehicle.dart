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

/// A number plate registered by a signed-in user, so alerts can reach them.
abstract class Vehicle
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Vehicle._({
    this.id,
    required this.ownerId,
    required this.plate,
    this.label,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Vehicle({
    int? id,
    required _isc.UuidValue ownerId,
    required String plate,
    String? label,
    DateTime? createdAt,
  }) = _VehicleImpl;

  factory Vehicle.fromJson(Map<String, dynamic> jsonSerialization) {
    return Vehicle(
      id: jsonSerialization['id'] as int?,
      ownerId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['ownerId'],
      ),
      plate: jsonSerialization['plate'] as String,
      label: jsonSerialization['label'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _isc.UuidValue ownerId;

  String plate;

  String? label;

  DateTime createdAt;

  /// Returns a shallow copy of this [Vehicle]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Vehicle copyWith({
    int? id,
    _isc.UuidValue? ownerId,
    String? plate,
    String? label,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Vehicle',
      if (id != null) 'id': id,
      'ownerId': ownerId.toJson(),
      'plate': plate,
      if (label != null) 'label': label,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Vehicle',
      if (id != null) 'id': id,
      'ownerId': ownerId.toJson(),
      'plate': plate,
      if (label != null) 'label': label,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VehicleImpl extends Vehicle {
  _VehicleImpl({
    int? id,
    required _isc.UuidValue ownerId,
    required String plate,
    String? label,
    DateTime? createdAt,
  }) : super._(
         id: id,
         ownerId: ownerId,
         plate: plate,
         label: label,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Vehicle]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Vehicle copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? ownerId,
    String? plate,
    Object? label = _Undefined,
    DateTime? createdAt,
  }) {
    return Vehicle(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      plate: plate ?? this.plate,
      label: label is String? ? label : this.label,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
