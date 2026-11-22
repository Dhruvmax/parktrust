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

/// A parking space a driver offers to others (home, society, office).
abstract class Listing
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Listing._({
    this.id,
    required this.ownerId,
    required this.title,
    this.description,
    required this.area,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.ratePerHour,
    required this.capacity,
    required this.hasEv,
    required this.hasCctv,
    required this.covered,
    required this.gated,
    required this.active,
    String? qrSecret,
    DateTime? createdAt,
  }) : qrSecret = qrSecret ?? '',
       createdAt = createdAt ?? DateTime.now();

  factory Listing({
    int? id,
    required _isc.UuidValue ownerId,
    required String title,
    String? description,
    required String area,
    required String address,
    required double latitude,
    required double longitude,
    required int ratePerHour,
    required int capacity,
    required bool hasEv,
    required bool hasCctv,
    required bool covered,
    required bool gated,
    required bool active,
    String? qrSecret,
    DateTime? createdAt,
  }) = _ListingImpl;

  factory Listing.fromJson(Map<String, dynamic> jsonSerialization) {
    return Listing(
      id: jsonSerialization['id'] as int?,
      ownerId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['ownerId'],
      ),
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String?,
      area: jsonSerialization['area'] as String,
      address: jsonSerialization['address'] as String,
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
      ratePerHour: jsonSerialization['ratePerHour'] as int,
      capacity: jsonSerialization['capacity'] as int,
      hasEv: _isc.BoolJsonExtension.fromJson(jsonSerialization['hasEv']),
      hasCctv: _isc.BoolJsonExtension.fromJson(jsonSerialization['hasCctv']),
      covered: _isc.BoolJsonExtension.fromJson(jsonSerialization['covered']),
      gated: _isc.BoolJsonExtension.fromJson(jsonSerialization['gated']),
      active: _isc.BoolJsonExtension.fromJson(jsonSerialization['active']),
      qrSecret: jsonSerialization['qrSecret'] as String?,
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

  String title;

  String? description;

  String area;

  String address;

  double latitude;

  double longitude;

  int ratePerHour;

  int capacity;

  bool hasEv;

  bool hasCctv;

  bool covered;

  bool gated;

  bool active;

  String qrSecret;

  DateTime createdAt;

  /// Returns a shallow copy of this [Listing]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Listing copyWith({
    int? id,
    _isc.UuidValue? ownerId,
    String? title,
    String? description,
    String? area,
    String? address,
    double? latitude,
    double? longitude,
    int? ratePerHour,
    int? capacity,
    bool? hasEv,
    bool? hasCctv,
    bool? covered,
    bool? gated,
    bool? active,
    String? qrSecret,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Listing',
      if (id != null) 'id': id,
      'ownerId': ownerId.toJson(),
      'title': title,
      if (description != null) 'description': description,
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
      'active': active,
      'qrSecret': qrSecret,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Listing',
      if (id != null) 'id': id,
      'ownerId': ownerId.toJson(),
      'title': title,
      if (description != null) 'description': description,
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
      'active': active,
      'qrSecret': qrSecret,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ListingImpl extends Listing {
  _ListingImpl({
    int? id,
    required _isc.UuidValue ownerId,
    required String title,
    String? description,
    required String area,
    required String address,
    required double latitude,
    required double longitude,
    required int ratePerHour,
    required int capacity,
    required bool hasEv,
    required bool hasCctv,
    required bool covered,
    required bool gated,
    required bool active,
    String? qrSecret,
    DateTime? createdAt,
  }) : super._(
         id: id,
         ownerId: ownerId,
         title: title,
         description: description,
         area: area,
         address: address,
         latitude: latitude,
         longitude: longitude,
         ratePerHour: ratePerHour,
         capacity: capacity,
         hasEv: hasEv,
         hasCctv: hasCctv,
         covered: covered,
         gated: gated,
         active: active,
         qrSecret: qrSecret,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Listing]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Listing copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? ownerId,
    String? title,
    Object? description = _Undefined,
    String? area,
    String? address,
    double? latitude,
    double? longitude,
    int? ratePerHour,
    int? capacity,
    bool? hasEv,
    bool? hasCctv,
    bool? covered,
    bool? gated,
    bool? active,
    String? qrSecret,
    DateTime? createdAt,
  }) {
    return Listing(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      title: title ?? this.title,
      description: description is String? ? description : this.description,
      area: area ?? this.area,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      ratePerHour: ratePerHour ?? this.ratePerHour,
      capacity: capacity ?? this.capacity,
      hasEv: hasEv ?? this.hasEv,
      hasCctv: hasCctv ?? this.hasCctv,
      covered: covered ?? this.covered,
      gated: gated ?? this.gated,
      active: active ?? this.active,
      qrSecret: qrSecret ?? this.qrSecret,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
