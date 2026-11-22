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
import 'dart:async' as _ida;
import 'dart:typed_data' as _idt;
import 'package:serverpod/serverpod.dart' as _is;
import '../bookings/booking_status.dart' as _ilk1qg37;

/// One reservation of a listing by a driver. Amounts are in rupees.
abstract class Booking
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
    required _is.UuidValue driverId,
    required _is.UuidValue ownerId,
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
      driverId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['driverId'],
      ),
      ownerId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['ownerId'],
      ),
      plate: jsonSerialization['plate'] as String,
      startTime: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['startTime'],
      ),
      endTime: _is.DateTimeJsonExtension.fromJson(jsonSerialization['endTime']),
      ratePerHour: jsonSerialization['ratePerHour'] as int,
      baseAmount: jsonSerialization['baseAmount'] as int,
      commission: jsonSerialization['commission'] as int,
      status: _ilk1qg37.BookingStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      paymentStatus: jsonSerialization['paymentStatus'] as String,
      checkInTime: jsonSerialization['checkInTime'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(
              jsonSerialization['checkInTime'],
            ),
      checkOutTime: jsonSerialization['checkOutTime'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(
              jsonSerialization['checkOutTime'],
            ),
      overstayMinutes: jsonSerialization['overstayMinutes'] as int?,
      overstayAmount: jsonSerialization['overstayAmount'] as int?,
      refundAmount: jsonSerialization['refundAmount'] as int?,
      extensionCount: jsonSerialization['extensionCount'] as int?,
      ownerPenaltyShare: jsonSerialization['ownerPenaltyShare'] as int?,
      overstayReportedAt: jsonSerialization['overstayReportedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(
              jsonSerialization['overstayReportedAt'],
            ),
      overstayPhoto: jsonSerialization['overstayPhoto'] == null
          ? null
          : _is.ByteDataJsonExtension.fromJson(
              jsonSerialization['overstayPhoto'],
            ),
      lastLatitude: (jsonSerialization['lastLatitude'] as num?)?.toDouble(),
      lastLongitude: (jsonSerialization['lastLongitude'] as num?)?.toDouble(),
      lastLocationAt: jsonSerialization['lastLocationAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastLocationAt'],
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = BookingTable();

  static const db = BookingRepository._();

  @override
  int? id;

  int listingId;

  _is.UuidValue driverId;

  _is.UuidValue ownerId;

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

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Booking]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Booking copyWith({
    int? id,
    int? listingId,
    _is.UuidValue? driverId,
    _is.UuidValue? ownerId,
    String? plate,
    DateTime? startTime,
    DateTime? endTime,
    int? ratePerHour,
    int? baseAmount,
    int? commission,
    _ilk1qg37.BookingStatus? status,
    String? paymentStatus,
    DateTime? checkInTime = const _is.$UndefinedDateTime(),
    DateTime? checkOutTime = const _is.$UndefinedDateTime(),
    int? overstayMinutes,
    int? overstayAmount,
    int? refundAmount,
    int? extensionCount,
    int? ownerPenaltyShare,
    DateTime? overstayReportedAt = const _is.$UndefinedDateTime(),
    _idt.ByteData? overstayPhoto,
    double? lastLatitude,
    double? lastLongitude,
    DateTime? lastLocationAt = const _is.$UndefinedDateTime(),
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

  static BookingInclude include() {
    return BookingInclude._();
  }

  static BookingIncludeList includeList({
    _is.WhereExpressionBuilder<BookingTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BookingTable>? orderBy,
    _is.OrderByListBuilder<BookingTable>? orderByList,
    BookingInclude? include,
  }) {
    return BookingIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Booking.t),
      orderByList: orderByList?.call(Booking.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BookingImpl extends Booking {
  _BookingImpl({
    int? id,
    required int listingId,
    required _is.UuidValue driverId,
    required _is.UuidValue ownerId,
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
  @_is.useResult
  @override
  Booking copyWith({
    Object? id = _Undefined,
    int? listingId,
    _is.UuidValue? driverId,
    _is.UuidValue? ownerId,
    String? plate,
    DateTime? startTime,
    DateTime? endTime,
    int? ratePerHour,
    int? baseAmount,
    int? commission,
    _ilk1qg37.BookingStatus? status,
    String? paymentStatus,
    DateTime? checkInTime = const _is.$UndefinedDateTime(),
    DateTime? checkOutTime = const _is.$UndefinedDateTime(),
    int? overstayMinutes,
    int? overstayAmount,
    int? refundAmount,
    int? extensionCount,
    int? ownerPenaltyShare,
    DateTime? overstayReportedAt = const _is.$UndefinedDateTime(),
    Object? overstayPhoto = _Undefined,
    Object? lastLatitude = _Undefined,
    Object? lastLongitude = _Undefined,
    DateTime? lastLocationAt = const _is.$UndefinedDateTime(),
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
      checkInTime: checkInTime is _is.UndefinedSentinel
          ? this.checkInTime
          : checkInTime,
      checkOutTime: checkOutTime is _is.UndefinedSentinel
          ? this.checkOutTime
          : checkOutTime,
      overstayMinutes: overstayMinutes ?? this.overstayMinutes,
      overstayAmount: overstayAmount ?? this.overstayAmount,
      refundAmount: refundAmount ?? this.refundAmount,
      extensionCount: extensionCount ?? this.extensionCount,
      ownerPenaltyShare: ownerPenaltyShare ?? this.ownerPenaltyShare,
      overstayReportedAt: overstayReportedAt is _is.UndefinedSentinel
          ? this.overstayReportedAt
          : overstayReportedAt,
      overstayPhoto: overstayPhoto is _idt.ByteData?
          ? overstayPhoto
          : this.overstayPhoto?.clone(),
      lastLatitude: lastLatitude is double? ? lastLatitude : this.lastLatitude,
      lastLongitude: lastLongitude is double?
          ? lastLongitude
          : this.lastLongitude,
      lastLocationAt: lastLocationAt is _is.UndefinedSentinel
          ? this.lastLocationAt
          : lastLocationAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class BookingUpdateTable extends _is.UpdateTable<BookingTable> {
  BookingUpdateTable(super.table);

  _is.ColumnValue<int, int> listingId(int value) => _is.ColumnValue(
    table.listingId,
    value,
  );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> driverId(_is.UuidValue value) =>
      _is.ColumnValue(
        table.driverId,
        value,
      );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> ownerId(_is.UuidValue value) =>
      _is.ColumnValue(
        table.ownerId,
        value,
      );

  _is.ColumnValue<String, String> plate(String value) => _is.ColumnValue(
    table.plate,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> startTime(DateTime value) =>
      _is.ColumnValue(
        table.startTime,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> endTime(DateTime value) =>
      _is.ColumnValue(
        table.endTime,
        value,
      );

  _is.ColumnValue<int, int> ratePerHour(int value) => _is.ColumnValue(
    table.ratePerHour,
    value,
  );

  _is.ColumnValue<int, int> baseAmount(int value) => _is.ColumnValue(
    table.baseAmount,
    value,
  );

  _is.ColumnValue<int, int> commission(int value) => _is.ColumnValue(
    table.commission,
    value,
  );

  _is.ColumnValue<_ilk1qg37.BookingStatus, _ilk1qg37.BookingStatus> status(
    _ilk1qg37.BookingStatus value,
  ) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<String, String> paymentStatus(String value) =>
      _is.ColumnValue(
        table.paymentStatus,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> checkInTime(DateTime? value) =>
      _is.ColumnValue(
        table.checkInTime,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> checkOutTime(DateTime? value) =>
      _is.ColumnValue(
        table.checkOutTime,
        value,
      );

  _is.ColumnValue<int, int> overstayMinutes(int value) => _is.ColumnValue(
    table.overstayMinutes,
    value,
  );

  _is.ColumnValue<int, int> overstayAmount(int value) => _is.ColumnValue(
    table.overstayAmount,
    value,
  );

  _is.ColumnValue<int, int> refundAmount(int value) => _is.ColumnValue(
    table.refundAmount,
    value,
  );

  _is.ColumnValue<int, int> extensionCount(int value) => _is.ColumnValue(
    table.extensionCount,
    value,
  );

  _is.ColumnValue<int, int> ownerPenaltyShare(int value) => _is.ColumnValue(
    table.ownerPenaltyShare,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> overstayReportedAt(DateTime? value) =>
      _is.ColumnValue(
        table.overstayReportedAt,
        value,
      );

  _is.ColumnValue<_idt.ByteData, _idt.ByteData> overstayPhoto(
    _idt.ByteData? value,
  ) => _is.ColumnValue(
    table.overstayPhoto,
    value,
  );

  _is.ColumnValue<double, double> lastLatitude(double? value) =>
      _is.ColumnValue(
        table.lastLatitude,
        value,
      );

  _is.ColumnValue<double, double> lastLongitude(double? value) =>
      _is.ColumnValue(
        table.lastLongitude,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> lastLocationAt(DateTime? value) =>
      _is.ColumnValue(
        table.lastLocationAt,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class BookingTable extends _is.Table<int?> {
  BookingTable({super.tableRelation}) : super(tableName: 'booking') {
    updateTable = BookingUpdateTable(this);
    listingId = _is.ColumnInt(
      'listingId',
      this,
    );
    driverId = _is.ColumnUuid(
      'driverId',
      this,
    );
    ownerId = _is.ColumnUuid(
      'ownerId',
      this,
    );
    plate = _is.ColumnString(
      'plate',
      this,
    );
    startTime = _is.ColumnDateTime(
      'startTime',
      this,
    );
    endTime = _is.ColumnDateTime(
      'endTime',
      this,
    );
    ratePerHour = _is.ColumnInt(
      'ratePerHour',
      this,
    );
    baseAmount = _is.ColumnInt(
      'baseAmount',
      this,
    );
    commission = _is.ColumnInt(
      'commission',
      this,
    );
    status = _is.ColumnEnum(
      'status',
      this,
      _is.EnumSerialization.byName,
    );
    paymentStatus = _is.ColumnString(
      'paymentStatus',
      this,
    );
    checkInTime = _is.ColumnDateTime(
      'checkInTime',
      this,
    );
    checkOutTime = _is.ColumnDateTime(
      'checkOutTime',
      this,
    );
    overstayMinutes = _is.ColumnInt(
      'overstayMinutes',
      this,
      hasDefault: true,
    );
    overstayAmount = _is.ColumnInt(
      'overstayAmount',
      this,
      hasDefault: true,
    );
    refundAmount = _is.ColumnInt(
      'refundAmount',
      this,
      hasDefault: true,
    );
    extensionCount = _is.ColumnInt(
      'extensionCount',
      this,
      hasDefault: true,
    );
    ownerPenaltyShare = _is.ColumnInt(
      'ownerPenaltyShare',
      this,
      hasDefault: true,
    );
    overstayReportedAt = _is.ColumnDateTime(
      'overstayReportedAt',
      this,
    );
    overstayPhoto = _is.ColumnByteData(
      'overstayPhoto',
      this,
    );
    lastLatitude = _is.ColumnDouble(
      'lastLatitude',
      this,
    );
    lastLongitude = _is.ColumnDouble(
      'lastLongitude',
      this,
    );
    lastLocationAt = _is.ColumnDateTime(
      'lastLocationAt',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final BookingUpdateTable updateTable;

  late final _is.ColumnInt listingId;

  late final _is.ColumnUuid driverId;

  late final _is.ColumnUuid ownerId;

  late final _is.ColumnString plate;

  late final _is.ColumnDateTime startTime;

  late final _is.ColumnDateTime endTime;

  late final _is.ColumnInt ratePerHour;

  late final _is.ColumnInt baseAmount;

  late final _is.ColumnInt commission;

  late final _is.ColumnEnum<_ilk1qg37.BookingStatus> status;

  late final _is.ColumnString paymentStatus;

  late final _is.ColumnDateTime checkInTime;

  late final _is.ColumnDateTime checkOutTime;

  late final _is.ColumnInt overstayMinutes;

  late final _is.ColumnInt overstayAmount;

  late final _is.ColumnInt refundAmount;

  late final _is.ColumnInt extensionCount;

  late final _is.ColumnInt ownerPenaltyShare;

  late final _is.ColumnDateTime overstayReportedAt;

  late final _is.ColumnByteData overstayPhoto;

  late final _is.ColumnDouble lastLatitude;

  late final _is.ColumnDouble lastLongitude;

  late final _is.ColumnDateTime lastLocationAt;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    listingId,
    driverId,
    ownerId,
    plate,
    startTime,
    endTime,
    ratePerHour,
    baseAmount,
    commission,
    status,
    paymentStatus,
    checkInTime,
    checkOutTime,
    overstayMinutes,
    overstayAmount,
    refundAmount,
    extensionCount,
    ownerPenaltyShare,
    overstayReportedAt,
    overstayPhoto,
    lastLatitude,
    lastLongitude,
    lastLocationAt,
    createdAt,
  ];
}

class BookingInclude extends _is.IncludeObject {
  BookingInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Booking.t;
}

class BookingIncludeList extends _is.IncludeList {
  BookingIncludeList._({
    _is.WhereExpressionBuilder<BookingTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Booking.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Booking.t;
}

class BookingRepository {
  const BookingRepository._();

  /// Returns a list of [Booking]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Booking>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BookingTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BookingTable>? orderBy,
    _is.OrderByListBuilder<BookingTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Booking>(
      where: where?.call(Booking.t),
      orderBy: orderBy?.call(Booking.t),
      orderByList: orderByList?.call(Booking.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [Booking]s matching the given query parameters every time the
  /// source tables are modified.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// Use [throttle] to specify the minimum interval between queries. It can
  /// also be set to `null`, in which case the stream will only be throttled
  /// when its subscription is paused.
  ///
  /// Source tables are collected from the queried table, [where], [orderBy],
  /// [orderByList], and the [include] graph. [alsoTriggerOnTables] is added
  /// to that set. Pass [Table] instances such as `Booking.t`.
  ///
  /// Raw [Expression] SQL is not inspected. Tables referenced only in raw
  /// SQL must be passed via [alsoTriggerOnTables].
  ///
  /// The stream always reads committed state and never joins an ambient
  /// [Transaction]. Emissions for a write fire after that write commits.
  ///
  /// Currently only supported on SQLite. Calling this method on PostgreSQL
  /// throws an [UnsupportedError].
  ///
  /// ```dart
  /// var subscription = Persons.db.watch(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// ).listen((persons) {
  ///   // Handle the latest matching rows.
  /// });
  /// ```
  _ida.Stream<List<Booking>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BookingTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BookingTable>? orderBy,
    _is.OrderByListBuilder<BookingTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<Booking>(
      where: where?.call(Booking.t),
      orderBy: orderBy?.call(Booking.t),
      orderByList: orderByList?.call(Booking.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [Booking] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Booking?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BookingTable>? where,
    int? offset,
    _is.OrderByBuilder<BookingTable>? orderBy,
    _is.OrderByListBuilder<BookingTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Booking>(
      where: where?.call(Booking.t),
      orderBy: orderBy?.call(Booking.t),
      orderByList: orderByList?.call(Booking.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Booking] by its [id] or null if no such row exists.
  Future<Booking?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Booking>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Booking]s in the list and returns the inserted rows.
  ///
  /// The returned [Booking]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Booking>> insert(
    _is.DatabaseSession session,
    List<Booking> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Booking>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Booking] and returns the inserted row.
  ///
  /// The returned [Booking] will have its `id` field set.
  Future<Booking> insertRow(
    _is.DatabaseSession session,
    Booking row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Booking>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Booking]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [Booking]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Booking>> upsert(
    _is.DatabaseSession session,
    List<Booking> rows, {
    required _is.ColumnSelections<BookingTable> conflictColumns,
    _is.ColumnSelections<BookingTable>? updateColumns,
    _is.WhereExpressionBuilder<BookingTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Booking>(
      rows,
      conflictColumns: conflictColumns(Booking.t),
      updateColumns: updateColumns?.call(Booking.t),
      updateWhere: updateWhere?.call(Booking.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Booking] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [Booking] will have its `id` field set.
  Future<Booking?> upsertRow(
    _is.DatabaseSession session,
    Booking row, {
    required _is.ColumnSelections<BookingTable> conflictColumns,
    _is.ColumnSelections<BookingTable>? updateColumns,
    _is.WhereExpressionBuilder<BookingTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Booking>(
      row,
      conflictColumns: conflictColumns(Booking.t),
      updateColumns: updateColumns?.call(Booking.t),
      updateWhere: updateWhere?.call(Booking.t),
      transaction: transaction,
    );
  }

  /// Updates all [Booking]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Booking>> update(
    _is.DatabaseSession session,
    List<Booking> rows, {
    _is.ColumnSelections<BookingTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Booking>(
      rows,
      columns: columns?.call(Booking.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Booking]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Booking> updateRow(
    _is.DatabaseSession session,
    Booking row, {
    _is.ColumnSelections<BookingTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Booking>(
      row,
      columns: columns?.call(Booking.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Booking] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Booking?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<BookingUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Booking>(
      id,
      columnValues: columnValues(Booking.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Booking]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Booking>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<BookingUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<BookingTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BookingTable>? orderBy,
    _is.OrderByListBuilder<BookingTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Booking>(
      columnValues: columnValues(Booking.t.updateTable),
      where: where(Booking.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Booking.t),
      orderByList: orderByList?.call(Booking.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Booking]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Booking>> delete(
    _is.DatabaseSession session,
    List<Booking> rows, {
    _is.OrderByBuilder<BookingTable>? orderBy,
    _is.OrderByListBuilder<BookingTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Booking>(
      rows,
      orderBy: orderBy?.call(Booking.t),
      orderByList: orderByList?.call(Booking.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Booking].
  Future<Booking> deleteRow(
    _is.DatabaseSession session,
    Booking row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Booking>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Booking>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BookingTable> where,
    _is.OrderByBuilder<BookingTable>? orderBy,
    _is.OrderByListBuilder<BookingTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Booking>(
      where: where(Booking.t),
      orderBy: orderBy?.call(Booking.t),
      orderByList: orderByList?.call(Booking.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BookingTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Booking>(
      where: where?.call(Booking.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Booking] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BookingTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Booking>(
      where: where(Booking.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
