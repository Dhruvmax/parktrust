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
import 'package:serverpod/serverpod.dart' as _is;

/// A public parking lot (mall, station, airport, hospital...). Sample data.
abstract class PublicLot
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
      hasEv: _is.BoolJsonExtension.fromJson(jsonSerialization['hasEv']),
      evNote: jsonSerialization['evNote'] as String?,
      hours: jsonSerialization['hours'] as String?,
      priceNote: jsonSerialization['priceNote'] as String?,
      bookable: _is.BoolJsonExtension.fromJson(jsonSerialization['bookable']),
    );
  }

  static final t = PublicLotTable();

  static const db = PublicLotRepository._();

  @override
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

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [PublicLot]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static PublicLotInclude include() {
    return PublicLotInclude._();
  }

  static PublicLotIncludeList includeList({
    _is.WhereExpressionBuilder<PublicLotTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<PublicLotTable>? orderBy,
    _is.OrderByListBuilder<PublicLotTable>? orderByList,
    PublicLotInclude? include,
  }) {
    return PublicLotIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PublicLot.t),
      orderByList: orderByList?.call(PublicLot.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class PublicLotUpdateTable extends _is.UpdateTable<PublicLotTable> {
  PublicLotUpdateTable(super.table);

  _is.ColumnValue<String, String> name(String value) => _is.ColumnValue(
    table.name,
    value,
  );

  _is.ColumnValue<String, String> category(String value) => _is.ColumnValue(
    table.category,
    value,
  );

  _is.ColumnValue<String, String> city(String value) => _is.ColumnValue(
    table.city,
    value,
  );

  _is.ColumnValue<String, String> area(String value) => _is.ColumnValue(
    table.area,
    value,
  );

  _is.ColumnValue<String, String> address(String value) => _is.ColumnValue(
    table.address,
    value,
  );

  _is.ColumnValue<double, double> latitude(double value) => _is.ColumnValue(
    table.latitude,
    value,
  );

  _is.ColumnValue<double, double> longitude(double value) => _is.ColumnValue(
    table.longitude,
    value,
  );

  _is.ColumnValue<int, int> ratePerHour(int? value) => _is.ColumnValue(
    table.ratePerHour,
    value,
  );

  _is.ColumnValue<int, int> capacity(int? value) => _is.ColumnValue(
    table.capacity,
    value,
  );

  _is.ColumnValue<bool, bool> hasEv(bool value) => _is.ColumnValue(
    table.hasEv,
    value,
  );

  _is.ColumnValue<String, String> evNote(String? value) => _is.ColumnValue(
    table.evNote,
    value,
  );

  _is.ColumnValue<String, String> hours(String? value) => _is.ColumnValue(
    table.hours,
    value,
  );

  _is.ColumnValue<String, String> priceNote(String? value) => _is.ColumnValue(
    table.priceNote,
    value,
  );

  _is.ColumnValue<bool, bool> bookable(bool value) => _is.ColumnValue(
    table.bookable,
    value,
  );
}

class PublicLotTable extends _is.Table<int?> {
  PublicLotTable({super.tableRelation}) : super(tableName: 'public_lot') {
    updateTable = PublicLotUpdateTable(this);
    name = _is.ColumnString(
      'name',
      this,
    );
    category = _is.ColumnString(
      'category',
      this,
    );
    city = _is.ColumnString(
      'city',
      this,
    );
    area = _is.ColumnString(
      'area',
      this,
    );
    address = _is.ColumnString(
      'address',
      this,
    );
    latitude = _is.ColumnDouble(
      'latitude',
      this,
    );
    longitude = _is.ColumnDouble(
      'longitude',
      this,
    );
    ratePerHour = _is.ColumnInt(
      'ratePerHour',
      this,
    );
    capacity = _is.ColumnInt(
      'capacity',
      this,
    );
    hasEv = _is.ColumnBool(
      'hasEv',
      this,
    );
    evNote = _is.ColumnString(
      'evNote',
      this,
    );
    hours = _is.ColumnString(
      'hours',
      this,
    );
    priceNote = _is.ColumnString(
      'priceNote',
      this,
    );
    bookable = _is.ColumnBool(
      'bookable',
      this,
    );
  }

  late final PublicLotUpdateTable updateTable;

  late final _is.ColumnString name;

  late final _is.ColumnString category;

  late final _is.ColumnString city;

  late final _is.ColumnString area;

  late final _is.ColumnString address;

  late final _is.ColumnDouble latitude;

  late final _is.ColumnDouble longitude;

  late final _is.ColumnInt ratePerHour;

  late final _is.ColumnInt capacity;

  late final _is.ColumnBool hasEv;

  late final _is.ColumnString evNote;

  late final _is.ColumnString hours;

  late final _is.ColumnString priceNote;

  late final _is.ColumnBool bookable;

  @override
  List<_is.Column> get columns => [
    id,
    name,
    category,
    city,
    area,
    address,
    latitude,
    longitude,
    ratePerHour,
    capacity,
    hasEv,
    evNote,
    hours,
    priceNote,
    bookable,
  ];
}

class PublicLotInclude extends _is.IncludeObject {
  PublicLotInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => PublicLot.t;
}

class PublicLotIncludeList extends _is.IncludeList {
  PublicLotIncludeList._({
    _is.WhereExpressionBuilder<PublicLotTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PublicLot.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => PublicLot.t;
}

class PublicLotRepository {
  const PublicLotRepository._();

  /// Returns a list of [PublicLot]s matching the given query parameters.
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
  Future<List<PublicLot>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<PublicLotTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<PublicLotTable>? orderBy,
    _is.OrderByListBuilder<PublicLotTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<PublicLot>(
      where: where?.call(PublicLot.t),
      orderBy: orderBy?.call(PublicLot.t),
      orderByList: orderByList?.call(PublicLot.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [PublicLot]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `PublicLot.t`.
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
  _ida.Stream<List<PublicLot>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<PublicLotTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<PublicLotTable>? orderBy,
    _is.OrderByListBuilder<PublicLotTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<PublicLot>(
      where: where?.call(PublicLot.t),
      orderBy: orderBy?.call(PublicLot.t),
      orderByList: orderByList?.call(PublicLot.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [PublicLot] matching the given query parameters.
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
  Future<PublicLot?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<PublicLotTable>? where,
    int? offset,
    _is.OrderByBuilder<PublicLotTable>? orderBy,
    _is.OrderByListBuilder<PublicLotTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<PublicLot>(
      where: where?.call(PublicLot.t),
      orderBy: orderBy?.call(PublicLot.t),
      orderByList: orderByList?.call(PublicLot.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [PublicLot] by its [id] or null if no such row exists.
  Future<PublicLot?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<PublicLot>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [PublicLot]s in the list and returns the inserted rows.
  ///
  /// The returned [PublicLot]s will have their `id` fields set.
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
  Future<List<PublicLot>> insert(
    _is.DatabaseSession session,
    List<PublicLot> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<PublicLot>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [PublicLot] and returns the inserted row.
  ///
  /// The returned [PublicLot] will have its `id` field set.
  Future<PublicLot> insertRow(
    _is.DatabaseSession session,
    PublicLot row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<PublicLot>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [PublicLot]s in the list and returns the resulting rows.
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
  /// The returned [PublicLot]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PublicLot>> upsert(
    _is.DatabaseSession session,
    List<PublicLot> rows, {
    required _is.ColumnSelections<PublicLotTable> conflictColumns,
    _is.ColumnSelections<PublicLotTable>? updateColumns,
    _is.WhereExpressionBuilder<PublicLotTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<PublicLot>(
      rows,
      conflictColumns: conflictColumns(PublicLot.t),
      updateColumns: updateColumns?.call(PublicLot.t),
      updateWhere: updateWhere?.call(PublicLot.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [PublicLot] and returns the resulting row.
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
  /// The returned [PublicLot] will have its `id` field set.
  Future<PublicLot?> upsertRow(
    _is.DatabaseSession session,
    PublicLot row, {
    required _is.ColumnSelections<PublicLotTable> conflictColumns,
    _is.ColumnSelections<PublicLotTable>? updateColumns,
    _is.WhereExpressionBuilder<PublicLotTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<PublicLot>(
      row,
      conflictColumns: conflictColumns(PublicLot.t),
      updateColumns: updateColumns?.call(PublicLot.t),
      updateWhere: updateWhere?.call(PublicLot.t),
      transaction: transaction,
    );
  }

  /// Updates all [PublicLot]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PublicLot>> update(
    _is.DatabaseSession session,
    List<PublicLot> rows, {
    _is.ColumnSelections<PublicLotTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<PublicLot>(
      rows,
      columns: columns?.call(PublicLot.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [PublicLot]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PublicLot> updateRow(
    _is.DatabaseSession session,
    PublicLot row, {
    _is.ColumnSelections<PublicLotTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<PublicLot>(
      row,
      columns: columns?.call(PublicLot.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PublicLot] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PublicLot?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<PublicLotUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<PublicLot>(
      id,
      columnValues: columnValues(PublicLot.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PublicLot]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PublicLot>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<PublicLotUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<PublicLotTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<PublicLotTable>? orderBy,
    _is.OrderByListBuilder<PublicLotTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<PublicLot>(
      columnValues: columnValues(PublicLot.t.updateTable),
      where: where(PublicLot.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PublicLot.t),
      orderByList: orderByList?.call(PublicLot.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [PublicLot]s in the list and returns the deleted rows.
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
  Future<List<PublicLot>> delete(
    _is.DatabaseSession session,
    List<PublicLot> rows, {
    _is.OrderByBuilder<PublicLotTable>? orderBy,
    _is.OrderByListBuilder<PublicLotTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<PublicLot>(
      rows,
      orderBy: orderBy?.call(PublicLot.t),
      orderByList: orderByList?.call(PublicLot.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [PublicLot].
  Future<PublicLot> deleteRow(
    _is.DatabaseSession session,
    PublicLot row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PublicLot>(
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
  Future<List<PublicLot>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<PublicLotTable> where,
    _is.OrderByBuilder<PublicLotTable>? orderBy,
    _is.OrderByListBuilder<PublicLotTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<PublicLot>(
      where: where(PublicLot.t),
      orderBy: orderBy?.call(PublicLot.t),
      orderByList: orderByList?.call(PublicLot.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<PublicLotTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<PublicLot>(
      where: where?.call(PublicLot.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [PublicLot] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<PublicLotTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<PublicLot>(
      where: where(PublicLot.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
