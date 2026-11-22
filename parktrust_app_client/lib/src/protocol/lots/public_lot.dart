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

/// A public parking lot (mall, station, airport, hospital...). Sample data.
abstract class PublicLot
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  PublicLot._({
    this.id,
    required this.name,
    required this.category,
    required this.city,
    required this.area,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.ratePerHour,
    this.capacity,
    required this.hasEv,
    this.evNote,
    this.hours,
    this.priceNote,
    required this.bookable,
  });

  factory PublicLot({
    int? id,
    required String name,
    required String category,
    required String city,
    required String area,
    required String address,
    required double latitude,
    required double longitude,
    int? ratePerHour,
    int? capacity,
    required bool hasEv,
    String? evNote,
    String? hours,
    String? priceNote,
    required bool bookable,
  }) = _PublicLotImpl;

  factory PublicLot.fromJson(Map<String, dynamic> jsonSerialization) {
    return PublicLot(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      category: jsonSerialization['category'] as String,
      city: jsonSerialization['city'] as String,
      area: jsonSerialization['area'] as String,
      address: jsonSerialization['address'] as String,
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
      ratePerHour: jsonSerialization['ratePerHour'] as int?,
      capacity: jsonSerialization['capacity'] as int?,
      hasEv: _isc.BoolJsonExtension.fromJson(jsonSerialization['hasEv']),
      evNote: jsonSerialization['evNote'] as String?,
      hours: jsonSerialization['hours'] as String?,
      priceNote: jsonSerialization['priceNote'] as String?,
      bookable: _isc.BoolJsonExtension.fromJson(jsonSerialization['bookable']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String category;

  String city;

  String area;

  String address;

  double latitude;

  double longitude;

  int? ratePerHour;

  int? capacity;

  bool hasEv;

  String? evNote;

  String? hours;

  String? priceNote;

  bool bookable;

  /// Returns a shallow copy of this [PublicLot]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  PublicLot copyWith({
    int? id,
    String? name,
    String? category,
    String? city,
    String? area,
    String? address,
    double? latitude,
    double? longitude,
    int? ratePerHour,
    int? capacity,
    bool? hasEv,
    String? evNote,
    String? hours,
    String? priceNote,
    bool? bookable,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PublicLot',
      if (id != null) 'id': id,
      'name': name,
      'category': category,
      'city': city,
      'area': area,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      if (ratePerHour != null) 'ratePerHour': ratePerHour,
      if (capacity != null) 'capacity': capacity,
      'hasEv': hasEv,
      if (evNote != null) 'evNote': evNote,
      if (hours != null) 'hours': hours,
      if (priceNote != null) 'priceNote': priceNote,
      'bookable': bookable,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PublicLot',
      if (id != null) 'id': id,
      'name': name,
      'category': category,
      'city': city,
      'area': area,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      if (ratePerHour != null) 'ratePerHour': ratePerHour,
      if (capacity != null) 'capacity': capacity,
      'hasEv': hasEv,
      if (evNote != null) 'evNote': evNote,
      if (hours != null) 'hours': hours,
      if (priceNote != null) 'priceNote': priceNote,
      'bookable': bookable,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PublicLotImpl extends PublicLot {
  _PublicLotImpl({
    int? id,
    required String name,
    required String category,
    required String city,
    required String area,
    required String address,
    required double latitude,
    required double longitude,
    int? ratePerHour,
    int? capacity,
    required bool hasEv,
    String? evNote,
    String? hours,
    String? priceNote,
    required bool bookable,
  }) : super._(
         id: id,
         name: name,
         category: category,
         city: city,
         area: area,
         address: address,
         latitude: latitude,
         longitude: longitude,
         ratePerHour: ratePerHour,
         capacity: capacity,
         hasEv: hasEv,
         evNote: evNote,
         hours: hours,
         priceNote: priceNote,
         bookable: bookable,
       );

  /// Returns a shallow copy of this [PublicLot]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  PublicLot copyWith({
    Object? id = _Undefined,
    String? name,
    String? category,
    String? city,
    String? area,
    String? address,
    double? latitude,
    double? longitude,
    Object? ratePerHour = _Undefined,
    Object? capacity = _Undefined,
    bool? hasEv,
    Object? evNote = _Undefined,
    Object? hours = _Undefined,
    Object? priceNote = _Undefined,
    bool? bookable,
  }) {
    return PublicLot(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      city: city ?? this.city,
      area: area ?? this.area,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      ratePerHour: ratePerHour is int? ? ratePerHour : this.ratePerHour,
      capacity: capacity is int? ? capacity : this.capacity,
      hasEv: hasEv ?? this.hasEv,
      evNote: evNote is String? ? evNote : this.evNote,
      hours: hours is String? ? hours : this.hours,
      priceNote: priceNote is String? ? priceNote : this.priceNote,
      bookable: bookable ?? this.bookable,
    );
  }
}
