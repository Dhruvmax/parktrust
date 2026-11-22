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
import '../alerts/alert_status.dart' as _iq54p1ko;

/// A report that a car is blocking someone in.
abstract class BlockAlert
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
    required _is.UuidValue reporterId,
    _is.UuidValue? ownerId,
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
      reporterId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['reporterId'],
      ),
      ownerId: jsonSerialization['ownerId'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['ownerId']),
      plate: jsonSerialization['plate'] as String,
      latitude: (jsonSerialization['latitude'] as num?)?.toDouble(),
      longitude: (jsonSerialization['longitude'] as num?)?.toDouble(),
      photo: jsonSerialization['photo'] == null
          ? null
          : _is.ByteDataJsonExtension.fromJson(jsonSerialization['photo']),
      note: jsonSerialization['note'] as String?,
      status: _iq54p1ko.AlertStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = BlockAlertTable();

  static const db = BlockAlertRepository._();

  @override
  int? id;

  _is.UuidValue reporterId;

  _is.UuidValue? ownerId;

  String plate;

  double? latitude;

  double? longitude;

  _idt.ByteData? photo;

  String? note;

  _iq54p1ko.AlertStatus status;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [BlockAlert]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  BlockAlert copyWith({
    int? id,
    _is.UuidValue? reporterId,
    _is.UuidValue? ownerId = const _is.$UndefinedUuidValue(),
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

  static BlockAlertInclude include() {
    return BlockAlertInclude._();
  }

  static BlockAlertIncludeList includeList({
    _is.WhereExpressionBuilder<BlockAlertTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlockAlertTable>? orderBy,
    _is.OrderByListBuilder<BlockAlertTable>? orderByList,
    BlockAlertInclude? include,
  }) {
    return BlockAlertIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BlockAlert.t),
      orderByList: orderByList?.call(BlockAlert.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BlockAlertImpl extends BlockAlert {
  _BlockAlertImpl({
    int? id,
    required _is.UuidValue reporterId,
    _is.UuidValue? ownerId,
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
  @_is.useResult
  @override
  BlockAlert copyWith({
    Object? id = _Undefined,
    _is.UuidValue? reporterId,
    _is.UuidValue? ownerId = const _is.$UndefinedUuidValue(),
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
      ownerId: ownerId is _is.UndefinedSentinel ? this.ownerId : ownerId,
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

class BlockAlertUpdateTable extends _is.UpdateTable<BlockAlertTable> {
  BlockAlertUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> reporterId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.reporterId,
    value,
  );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> ownerId(_is.UuidValue? value) =>
      _is.ColumnValue(
        table.ownerId,
        value,
      );

  _is.ColumnValue<String, String> plate(String value) => _is.ColumnValue(
    table.plate,
    value,
  );

  _is.ColumnValue<double, double> latitude(double? value) => _is.ColumnValue(
    table.latitude,
    value,
  );

  _is.ColumnValue<double, double> longitude(double? value) => _is.ColumnValue(
    table.longitude,
    value,
  );

  _is.ColumnValue<_idt.ByteData, _idt.ByteData> photo(_idt.ByteData? value) =>
      _is.ColumnValue(
        table.photo,
        value,
      );

  _is.ColumnValue<String, String> note(String? value) => _is.ColumnValue(
    table.note,
    value,
  );

  _is.ColumnValue<_iq54p1ko.AlertStatus, _iq54p1ko.AlertStatus> status(
    _iq54p1ko.AlertStatus value,
  ) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class BlockAlertTable extends _is.Table<int?> {
  BlockAlertTable({super.tableRelation}) : super(tableName: 'block_alert') {
    updateTable = BlockAlertUpdateTable(this);
    reporterId = _is.ColumnUuid(
      'reporterId',
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
    latitude = _is.ColumnDouble(
      'latitude',
      this,
    );
    longitude = _is.ColumnDouble(
      'longitude',
      this,
    );
    photo = _is.ColumnByteData(
      'photo',
      this,
    );
    note = _is.ColumnString(
      'note',
      this,
    );
    status = _is.ColumnEnum(
      'status',
      this,
      _is.EnumSerialization.byName,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final BlockAlertUpdateTable updateTable;

  late final _is.ColumnUuid reporterId;

  late final _is.ColumnUuid ownerId;

  late final _is.ColumnString plate;

  late final _is.ColumnDouble latitude;

  late final _is.ColumnDouble longitude;

  late final _is.ColumnByteData photo;

  late final _is.ColumnString note;

  late final _is.ColumnEnum<_iq54p1ko.AlertStatus> status;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    reporterId,
    ownerId,
    plate,
    latitude,
    longitude,
    photo,
    note,
    status,
    createdAt,
  ];
}

class BlockAlertInclude extends _is.IncludeObject {
  BlockAlertInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => BlockAlert.t;
}

class BlockAlertIncludeList extends _is.IncludeList {
  BlockAlertIncludeList._({
    _is.WhereExpressionBuilder<BlockAlertTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BlockAlert.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => BlockAlert.t;
}

class BlockAlertRepository {
  const BlockAlertRepository._();

  /// Returns a list of [BlockAlert]s matching the given query parameters.
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
  Future<List<BlockAlert>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlockAlertTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlockAlertTable>? orderBy,
    _is.OrderByListBuilder<BlockAlertTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<BlockAlert>(
      where: where?.call(BlockAlert.t),
      orderBy: orderBy?.call(BlockAlert.t),
      orderByList: orderByList?.call(BlockAlert.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [BlockAlert]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `BlockAlert.t`.
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
  _ida.Stream<List<BlockAlert>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlockAlertTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlockAlertTable>? orderBy,
    _is.OrderByListBuilder<BlockAlertTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<BlockAlert>(
      where: where?.call(BlockAlert.t),
      orderBy: orderBy?.call(BlockAlert.t),
      orderByList: orderByList?.call(BlockAlert.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [BlockAlert] matching the given query parameters.
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
  Future<BlockAlert?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlockAlertTable>? where,
    int? offset,
    _is.OrderByBuilder<BlockAlertTable>? orderBy,
    _is.OrderByListBuilder<BlockAlertTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<BlockAlert>(
      where: where?.call(BlockAlert.t),
      orderBy: orderBy?.call(BlockAlert.t),
      orderByList: orderByList?.call(BlockAlert.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [BlockAlert] by its [id] or null if no such row exists.
  Future<BlockAlert?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<BlockAlert>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [BlockAlert]s in the list and returns the inserted rows.
  ///
  /// The returned [BlockAlert]s will have their `id` fields set.
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
  Future<List<BlockAlert>> insert(
    _is.DatabaseSession session,
    List<BlockAlert> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<BlockAlert>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [BlockAlert] and returns the inserted row.
  ///
  /// The returned [BlockAlert] will have its `id` field set.
  Future<BlockAlert> insertRow(
    _is.DatabaseSession session,
    BlockAlert row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<BlockAlert>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [BlockAlert]s in the list and returns the resulting rows.
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
  /// The returned [BlockAlert]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BlockAlert>> upsert(
    _is.DatabaseSession session,
    List<BlockAlert> rows, {
    required _is.ColumnSelections<BlockAlertTable> conflictColumns,
    _is.ColumnSelections<BlockAlertTable>? updateColumns,
    _is.WhereExpressionBuilder<BlockAlertTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<BlockAlert>(
      rows,
      conflictColumns: conflictColumns(BlockAlert.t),
      updateColumns: updateColumns?.call(BlockAlert.t),
      updateWhere: updateWhere?.call(BlockAlert.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [BlockAlert] and returns the resulting row.
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
  /// The returned [BlockAlert] will have its `id` field set.
  Future<BlockAlert?> upsertRow(
    _is.DatabaseSession session,
    BlockAlert row, {
    required _is.ColumnSelections<BlockAlertTable> conflictColumns,
    _is.ColumnSelections<BlockAlertTable>? updateColumns,
    _is.WhereExpressionBuilder<BlockAlertTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<BlockAlert>(
      row,
      conflictColumns: conflictColumns(BlockAlert.t),
      updateColumns: updateColumns?.call(BlockAlert.t),
      updateWhere: updateWhere?.call(BlockAlert.t),
      transaction: transaction,
    );
  }

  /// Updates all [BlockAlert]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BlockAlert>> update(
    _is.DatabaseSession session,
    List<BlockAlert> rows, {
    _is.ColumnSelections<BlockAlertTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<BlockAlert>(
      rows,
      columns: columns?.call(BlockAlert.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [BlockAlert]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BlockAlert> updateRow(
    _is.DatabaseSession session,
    BlockAlert row, {
    _is.ColumnSelections<BlockAlertTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<BlockAlert>(
      row,
      columns: columns?.call(BlockAlert.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BlockAlert] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<BlockAlert?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<BlockAlertUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<BlockAlert>(
      id,
      columnValues: columnValues(BlockAlert.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [BlockAlert]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BlockAlert>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<BlockAlertUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<BlockAlertTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlockAlertTable>? orderBy,
    _is.OrderByListBuilder<BlockAlertTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<BlockAlert>(
      columnValues: columnValues(BlockAlert.t.updateTable),
      where: where(BlockAlert.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BlockAlert.t),
      orderByList: orderByList?.call(BlockAlert.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [BlockAlert]s in the list and returns the deleted rows.
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
  Future<List<BlockAlert>> delete(
    _is.DatabaseSession session,
    List<BlockAlert> rows, {
    _is.OrderByBuilder<BlockAlertTable>? orderBy,
    _is.OrderByListBuilder<BlockAlertTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<BlockAlert>(
      rows,
      orderBy: orderBy?.call(BlockAlert.t),
      orderByList: orderByList?.call(BlockAlert.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [BlockAlert].
  Future<BlockAlert> deleteRow(
    _is.DatabaseSession session,
    BlockAlert row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BlockAlert>(
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
  Future<List<BlockAlert>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BlockAlertTable> where,
    _is.OrderByBuilder<BlockAlertTable>? orderBy,
    _is.OrderByListBuilder<BlockAlertTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<BlockAlert>(
      where: where(BlockAlert.t),
      orderBy: orderBy?.call(BlockAlert.t),
      orderByList: orderByList?.call(BlockAlert.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlockAlertTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<BlockAlert>(
      where: where?.call(BlockAlert.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [BlockAlert] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BlockAlertTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<BlockAlert>(
      where: where(BlockAlert.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
