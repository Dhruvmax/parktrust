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
import '../bookings/booking_status.dart' as _ilk1qg37;

/// One reservation of a listing by a driver. Amounts are in rupees.
abstract class Booking
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Booking._({
    this.id,
    required this.listingId,
    required this.driverId,
    required this.ownerId,
    required this.plate,
    required this.startTime,
    required this.endTime,
    required this.ratePerHour,
    required this.baseAmount,
    required this.commission,
    required this.status,
    required this.paymentStatus,
    this.checkInTime,
    this.checkOutTime,
    int? overstayMinutes,
    int? overstayAmount,
    int? refundAmount,
    int? extensionCount,
    int? ownerPenaltyShare,
    this.overstayReportedAt,
    this.overstayPhoto,
    this.lastLatitude,
    this.lastLongitude,
    this.lastLocationAt,
    DateTime? createdAt,
  }) : overstayMinutes = overstayMinutes ?? 0,
       overstayAmount = overstayAmount ?? 0,
       refundAmount = refundAmount ?? 0,
       extensionCount = extensionCount ?? 0,
       ownerPenaltyShare = ownerPenaltyShare ?? 0,
       createdAt = createdAt ?? DateTime.now();

  factory Booking({
    int? id,
    required int listingId,
    required _isc.UuidValue driverId,
    required _isc.UuidValue ownerId,
    required String plate,
    required DateTime startTime,
    required DateTime endTime,
    required int ratePerHour,
    required int baseAmount,
    required int commission,
    required _ilk1qg37.BookingStatus status,
    required String paymentStatus,
    DateTime? checkInTime,
    DateTime? checkOutTime,
    int? overstayMinutes,
    int? overstayAmount,
    int? refundAmount,
    int? extensionCount,
    int? ownerPenaltyShare,
    DateTime? overstayReportedAt,
    _idt.ByteData? overstayPhoto,
    double? lastLatitude,
    double? lastLongitude,
    DateTime? lastLocationAt,
    DateTime? createdAt,
  }) = _BookingImpl;

  factory Booking.fromJson(Map<String, dynamic> jsonSerialization) {
    return Booking(
      id: jsonSerialization['id'] as int?,
      listingId: jsonSerialization['listingId'] as int,
      driverId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['driverId'],
      ),
      ownerId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['ownerId'],
      ),
      plate: jsonSerialization['plate'] as String,
      startTime: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['startTime'],
      ),
      endTime: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['endTime'],
      ),
      ratePerHour: jsonSerialization['ratePerHour'] as int,
      baseAmount: jsonSerialization['baseAmount'] as int,
      commission: jsonSerialization['commission'] as int,
      status: _ilk1qg37.BookingStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      paymentStatus: jsonSerialization['paymentStatus'] as String,
      checkInTime: jsonSerialization['checkInTime'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(
              jsonSerialization['checkInTime'],
            ),
      checkOutTime: jsonSerialization['checkOutTime'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(
              jsonSerialization['checkOutTime'],
            ),
      overstayMinutes: jsonSerialization['overstayMinutes'] as int?,
      overstayAmount: jsonSerialization['overstayAmount'] as int?,
      refundAmount: jsonSerialization['refundAmount'] as int?,
      extensionCount: jsonSerialization['extensionCount'] as int?,
      ownerPenaltyShare: jsonSerialization['ownerPenaltyShare'] as int?,
      overstayReportedAt: jsonSerialization['overstayReportedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(
              jsonSerialization['overstayReportedAt'],
            ),
      overstayPhoto: jsonSerialization['overstayPhoto'] == null
          ? null
          : _isc.ByteDataJsonExtension.fromJson(
              jsonSerialization['overstayPhoto'],
            ),
      lastLatitude: (jsonSerialization['lastLatitude'] as num?)?.toDouble(),
      lastLongitude: (jsonSerialization['lastLongitude'] as num?)?.toDouble(),
      lastLocationAt: jsonSerialization['lastLocationAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastLocationAt'],
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

  int listingId;

  _isc.UuidValue driverId;

  _isc.UuidValue ownerId;

  String plate;

  DateTime startTime;

  DateTime endTime;

  int ratePerHour;

  int baseAmount;

  int commission;

  _ilk1qg37.BookingStatus status;

  String paymentStatus;

  DateTime? checkInTime;

  DateTime? checkOutTime;

  int overstayMinutes;

  int overstayAmount;

  int refundAmount;

  int extensionCount;

  int ownerPenaltyShare;

  DateTime? overstayReportedAt;

  _idt.ByteData? overstayPhoto;

  double? lastLatitude;

  double? lastLongitude;

  DateTime? lastLocationAt;

  DateTime createdAt;

  /// Returns a shallow copy of this [Booking]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Booking copyWith({
    int? id,
    int? listingId,
    _isc.UuidValue? driverId,
    _isc.UuidValue? ownerId,
    String? plate,
    DateTime? startTime,
    DateTime? endTime,
    int? ratePerHour,
    int? baseAmount,
    int? commission,
    _ilk1qg37.BookingStatus? status,
    String? paymentStatus,
    DateTime? checkInTime = const _isc.$UndefinedDateTime(),
    DateTime? checkOutTime = const _isc.$UndefinedDateTime(),
    int? overstayMinutes,
    int? overstayAmount,
    int? refundAmount,
    int? extensionCount,
    int? ownerPenaltyShare,
    DateTime? overstayReportedAt = const _isc.$UndefinedDateTime(),
    _idt.ByteData? overstayPhoto,
    double? lastLatitude,
    double? lastLongitude,
    DateTime? lastLocationAt = const _isc.$UndefinedDateTime(),
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Booking',
      if (id != null) 'id': id,
      'listingId': listingId,
      'driverId': driverId.toJson(),
      'ownerId': ownerId.toJson(),
      'plate': plate,
      'startTime': startTime.toJson(),
      'endTime': endTime.toJson(),
      'ratePerHour': ratePerHour,
      'baseAmount': baseAmount,
      'commission': commission,
      'status': status.toJson(),
      'paymentStatus': paymentStatus,
      if (checkInTime != null) 'checkInTime': checkInTime?.toJson(),
      if (checkOutTime != null) 'checkOutTime': checkOutTime?.toJson(),
      'overstayMinutes': overstayMinutes,
      'overstayAmount': overstayAmount,
      'refundAmount': refundAmount,
      'extensionCount': extensionCount,
      'ownerPenaltyShare': ownerPenaltyShare,
      if (overstayReportedAt != null)
        'overstayReportedAt': overstayReportedAt?.toJson(),
      if (overstayPhoto != null) 'overstayPhoto': overstayPhoto?.toJson(),
      if (lastLatitude != null) 'lastLatitude': lastLatitude,
      if (lastLongitude != null) 'lastLongitude': lastLongitude,
      if (lastLocationAt != null) 'lastLocationAt': lastLocationAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Booking',
      if (id != null) 'id': id,
      'listingId': listingId,
      'driverId': driverId.toJson(),
      'ownerId': ownerId.toJson(),
      'plate': plate,
      'startTime': startTime.toJson(),
      'endTime': endTime.toJson(),
      'ratePerHour': ratePerHour,
      'baseAmount': baseAmount,
      'commission': commission,
      'status': status.toJson(),
      'paymentStatus': paymentStatus,
      if (checkInTime != null) 'checkInTime': checkInTime?.toJson(),
      if (checkOutTime != null) 'checkOutTime': checkOutTime?.toJson(),
      'overstayMinutes': overstayMinutes,
      'overstayAmount': overstayAmount,
      'refundAmount': refundAmount,
      'extensionCount': extensionCount,
      'ownerPenaltyShare': ownerPenaltyShare,
      if (overstayReportedAt != null)
        'overstayReportedAt': overstayReportedAt?.toJson(),
      if (overstayPhoto != null) 'overstayPhoto': overstayPhoto?.toJson(),
      if (lastLatitude != null) 'lastLatitude': lastLatitude,
      if (lastLongitude != null) 'lastLongitude': lastLongitude,
      if (lastLocationAt != null) 'lastLocationAt': lastLocationAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BookingImpl extends Booking {
  _BookingImpl({
    int? id,
    required int listingId,
    required _isc.UuidValue driverId,
    required _isc.UuidValue ownerId,
    required String plate,
    required DateTime startTime,
    required DateTime endTime,
    required int ratePerHour,
    required int baseAmount,
    required int commission,
    required _ilk1qg37.BookingStatus status,
    required String paymentStatus,
    DateTime? checkInTime,
    DateTime? checkOutTime,
    int? overstayMinutes,
    int? overstayAmount,
    int? refundAmount,
    int? extensionCount,
    int? ownerPenaltyShare,
    DateTime? overstayReportedAt,
    _idt.ByteData? overstayPhoto,
    double? lastLatitude,
    double? lastLongitude,
    DateTime? lastLocationAt,
    DateTime? createdAt,
  }) : super._(
         id: id,
         listingId: listingId,
         driverId: driverId,
         ownerId: ownerId,
         plate: plate,
         startTime: startTime,
         endTime: endTime,
         ratePerHour: ratePerHour,
         baseAmount: baseAmount,
         commission: commission,
         status: status,
         paymentStatus: paymentStatus,
         checkInTime: checkInTime,
         checkOutTime: checkOutTime,
         overstayMinutes: overstayMinutes,
         overstayAmount: overstayAmount,
         refundAmount: refundAmount,
         extensionCount: extensionCount,
         ownerPenaltyShare: ownerPenaltyShare,
         overstayReportedAt: overstayReportedAt,
         overstayPhoto: overstayPhoto,
         lastLatitude: lastLatitude,
         lastLongitude: lastLongitude,
         lastLocationAt: lastLocationAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Booking]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Booking copyWith({
    Object? id = _Undefined,
    int? listingId,
    _isc.UuidValue? driverId,
    _isc.UuidValue? ownerId,
    String? plate,
    DateTime? startTime,
    DateTime? endTime,
    int? ratePerHour,
    int? baseAmount,
    int? commission,
    _ilk1qg37.BookingStatus? status,
    String? paymentStatus,
    DateTime? checkInTime = const _isc.$UndefinedDateTime(),
    DateTime? checkOutTime = const _isc.$UndefinedDateTime(),
    int? overstayMinutes,
    int? overstayAmount,
    int? refundAmount,
    int? extensionCount,
    int? ownerPenaltyShare,
    DateTime? overstayReportedAt = const _isc.$UndefinedDateTime(),
    Object? overstayPhoto = _Undefined,
    Object? lastLatitude = _Undefined,
    Object? lastLongitude = _Undefined,
    DateTime? lastLocationAt = const _isc.$UndefinedDateTime(),
    DateTime? createdAt,
  }) {
    return Booking(
      id: id is int? ? id : this.id,
      listingId: listingId ?? this.listingId,
      driverId: driverId ?? this.driverId,
      ownerId: ownerId ?? this.ownerId,
      plate: plate ?? this.plate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      ratePerHour: ratePerHour ?? this.ratePerHour,
      baseAmount: baseAmount ?? this.baseAmount,
      commission: commission ?? this.commission,
      status: status ?? this.status,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      checkInTime: checkInTime is _isc.UndefinedSentinel
          ? this.checkInTime
          : checkInTime,
      checkOutTime: checkOutTime is _isc.UndefinedSentinel
          ? this.checkOutTime
          : checkOutTime,
      overstayMinutes: overstayMinutes ?? this.overstayMinutes,
      overstayAmount: overstayAmount ?? this.overstayAmount,
      refundAmount: refundAmount ?? this.refundAmount,
      extensionCount: extensionCount ?? this.extensionCount,
      ownerPenaltyShare: ownerPenaltyShare ?? this.ownerPenaltyShare,
      overstayReportedAt: overstayReportedAt is _isc.UndefinedSentinel
          ? this.overstayReportedAt
          : overstayReportedAt,
      overstayPhoto: overstayPhoto is _idt.ByteData?
          ? overstayPhoto
          : this.overstayPhoto?.clone(),
      lastLatitude: lastLatitude is double? ? lastLatitude : this.lastLatitude,
      lastLongitude: lastLongitude is double?
          ? lastLongitude
          : this.lastLongitude,
      lastLocationAt: lastLocationAt is _isc.UndefinedSentinel
          ? this.lastLocationAt
          : lastLocationAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
