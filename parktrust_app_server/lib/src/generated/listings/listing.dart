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

/// A parking space a driver offers to others (home, society, office).
abstract class Listing
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
    required _is.UuidValue ownerId,
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
      ownerId: _is.UuidValueJsonExtension.fromJson(
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
      hasEv: _is.BoolJsonExtension.fromJson(jsonSerialization['hasEv']),
      hasCctv: _is.BoolJsonExtension.fromJson(jsonSerialization['hasCctv']),
      covered: _is.BoolJsonExtension.fromJson(jsonSerialization['covered']),
      gated: _is.BoolJsonExtension.fromJson(jsonSerialization['gated']),
      active: _is.BoolJsonExtension.fromJson(jsonSerialization['active']),
      qrSecret: jsonSerialization['qrSecret'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = ListingTable();

  static const db = ListingRepository._();

  @override
  int? id;

  _is.UuidValue ownerId;

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

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Listing]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Listing copyWith({
    int? id,
    _is.UuidValue? ownerId,
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

  static ListingInclude include() {
    return ListingInclude._();
  }

  static ListingIncludeList includeList({
    _is.WhereExpressionBuilder<ListingTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ListingTable>? orderBy,
    _is.OrderByListBuilder<ListingTable>? orderByList,
    ListingInclude? include,
  }) {
    return ListingIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Listing.t),
      orderByList: orderByList?.call(Listing.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ListingImpl extends Listing {
  _ListingImpl({
    int? id,
    required _is.UuidValue ownerId,
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
  @_is.useResult
  @override
  Listing copyWith({
    Object? id = _Undefined,
    _is.UuidValue? ownerId,
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

class ListingUpdateTable extends _is.UpdateTable<ListingTable> {
  ListingUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> ownerId(_is.UuidValue value) =>
      _is.ColumnValue(
        table.ownerId,
        value,
      );

  _is.ColumnValue<String, String> title(String value) => _is.ColumnValue(
    table.title,
    value,
  );

  _is.ColumnValue<String, String> description(String? value) => _is.ColumnValue(
    table.description,
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

  _is.ColumnValue<int, int> ratePerHour(int value) => _is.ColumnValue(
    table.ratePerHour,
    value,
  );

  _is.ColumnValue<int, int> capacity(int value) => _is.ColumnValue(
    table.capacity,
    value,
  );

  _is.ColumnValue<bool, bool> hasEv(bool value) => _is.ColumnValue(
    table.hasEv,
    value,
  );

  _is.ColumnValue<bool, bool> hasCctv(bool value) => _is.ColumnValue(
    table.hasCctv,
    value,
  );

  _is.ColumnValue<bool, bool> covered(bool value) => _is.ColumnValue(
    table.covered,
    value,
  );

  _is.ColumnValue<bool, bool> gated(bool value) => _is.ColumnValue(
    table.gated,
    value,
  );

  _is.ColumnValue<bool, bool> active(bool value) => _is.ColumnValue(
    table.active,
    value,
  );

  _is.ColumnValue<String, String> qrSecret(String value) => _is.ColumnValue(
    table.qrSecret,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class ListingTable extends _is.Table<int?> {
  ListingTable({super.tableRelation}) : super(tableName: 'listing') {
    updateTable = ListingUpdateTable(this);
    ownerId = _is.ColumnUuid(
      'ownerId',
      this,
    );
    title = _is.ColumnString(
      'title',
      this,
    );
    description = _is.ColumnString(
      'description',
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
    hasCctv = _is.ColumnBool(
      'hasCctv',
      this,
    );
    covered = _is.ColumnBool(
      'covered',
      this,
    );
    gated = _is.ColumnBool(
      'gated',
      this,
    );
    active = _is.ColumnBool(
      'active',
      this,
    );
    qrSecret = _is.ColumnString(
      'qrSecret',
      this,
      hasDefault: true,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final ListingUpdateTable updateTable;

  late final _is.ColumnUuid ownerId;

  late final _is.ColumnString title;

  late final _is.ColumnString description;

  late final _is.ColumnString area;

  late final _is.ColumnString address;

  late final _is.ColumnDouble latitude;

  late final _is.ColumnDouble longitude;

  late final _is.ColumnInt ratePerHour;

  late final _is.ColumnInt capacity;

  late final _is.ColumnBool hasEv;

  late final _is.ColumnBool hasCctv;

  late final _is.ColumnBool covered;

  late final _is.ColumnBool gated;

  late final _is.ColumnBool active;

  late final _is.ColumnString qrSecret;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    ownerId,
    title,
    description,
    area,
    address,
    latitude,
    longitude,
    ratePerHour,
    capacity,
    hasEv,
    hasCctv,
    covered,
    gated,
    active,
    qrSecret,
    createdAt,
  ];
}

class ListingInclude extends _is.IncludeObject {
  ListingInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Listing.t;
}

class ListingIncludeList extends _is.IncludeList {
  ListingIncludeList._({
    _is.WhereExpressionBuilder<ListingTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Listing.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Listing.t;
}

class ListingRepository {
  const ListingRepository._();

  /// Returns a list of [Listing]s matching the given query parameters.
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
  Future<List<Listing>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ListingTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ListingTable>? orderBy,
    _is.OrderByListBuilder<ListingTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Listing>(
      where: where?.call(Listing.t),
      orderBy: orderBy?.call(Listing.t),
      orderByList: orderByList?.call(Listing.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [Listing]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `Listing.t`.
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
  _ida.Stream<List<Listing>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ListingTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ListingTable>? orderBy,
    _is.OrderByListBuilder<ListingTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<Listing>(
      where: where?.call(Listing.t),
      orderBy: orderBy?.call(Listing.t),
      orderByList: orderByList?.call(Listing.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [Listing] matching the given query parameters.
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
  Future<Listing?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ListingTable>? where,
    int? offset,
    _is.OrderByBuilder<ListingTable>? orderBy,
    _is.OrderByListBuilder<ListingTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Listing>(
      where: where?.call(Listing.t),
      orderBy: orderBy?.call(Listing.t),
      orderByList: orderByList?.call(Listing.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Listing] by its [id] or null if no such row exists.
  Future<Listing?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Listing>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Listing]s in the list and returns the inserted rows.
  ///
  /// The returned [Listing]s will have their `id` fields set.
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
  Future<List<Listing>> insert(
    _is.DatabaseSession session,
    List<Listing> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Listing>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Listing] and returns the inserted row.
  ///
  /// The returned [Listing] will have its `id` field set.
  Future<Listing> insertRow(
    _is.DatabaseSession session,
    Listing row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Listing>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Listing]s in the list and returns the resulting rows.
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
  /// The returned [Listing]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Listing>> upsert(
    _is.DatabaseSession session,
    List<Listing> rows, {
    required _is.ColumnSelections<ListingTable> conflictColumns,
    _is.ColumnSelections<ListingTable>? updateColumns,
    _is.WhereExpressionBuilder<ListingTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Listing>(
      rows,
      conflictColumns: conflictColumns(Listing.t),
      updateColumns: updateColumns?.call(Listing.t),
      updateWhere: updateWhere?.call(Listing.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Listing] and returns the resulting row.
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
  /// The returned [Listing] will have its `id` field set.
  Future<Listing?> upsertRow(
    _is.DatabaseSession session,
    Listing row, {
    required _is.ColumnSelections<ListingTable> conflictColumns,
    _is.ColumnSelections<ListingTable>? updateColumns,
    _is.WhereExpressionBuilder<ListingTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Listing>(
      row,
      conflictColumns: conflictColumns(Listing.t),
      updateColumns: updateColumns?.call(Listing.t),
      updateWhere: updateWhere?.call(Listing.t),
      transaction: transaction,
    );
  }

  /// Updates all [Listing]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Listing>> update(
    _is.DatabaseSession session,
    List<Listing> rows, {
    _is.ColumnSelections<ListingTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Listing>(
      rows,
      columns: columns?.call(Listing.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Listing]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Listing> updateRow(
    _is.DatabaseSession session,
    Listing row, {
    _is.ColumnSelections<ListingTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Listing>(
      row,
      columns: columns?.call(Listing.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Listing] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Listing?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<ListingUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Listing>(
      id,
      columnValues: columnValues(Listing.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Listing]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Listing>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<ListingUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<ListingTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ListingTable>? orderBy,
    _is.OrderByListBuilder<ListingTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Listing>(
      columnValues: columnValues(Listing.t.updateTable),
      where: where(Listing.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Listing.t),
      orderByList: orderByList?.call(Listing.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Listing]s in the list and returns the deleted rows.
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
  Future<List<Listing>> delete(
    _is.DatabaseSession session,
    List<Listing> rows, {
    _is.OrderByBuilder<ListingTable>? orderBy,
    _is.OrderByListBuilder<ListingTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Listing>(
      rows,
      orderBy: orderBy?.call(Listing.t),
      orderByList: orderByList?.call(Listing.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Listing].
  Future<Listing> deleteRow(
    _is.DatabaseSession session,
    Listing row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Listing>(
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
  Future<List<Listing>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ListingTable> where,
    _is.OrderByBuilder<ListingTable>? orderBy,
    _is.OrderByListBuilder<ListingTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Listing>(
      where: where(Listing.t),
      orderBy: orderBy?.call(Listing.t),
      orderByList: orderByList?.call(Listing.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ListingTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Listing>(
      where: where?.call(Listing.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Listing] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ListingTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Listing>(
      where: where(Listing.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
