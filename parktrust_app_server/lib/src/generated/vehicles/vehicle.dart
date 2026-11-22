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

/// A number plate registered by a signed-in user, so alerts can reach them.
abstract class Vehicle
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  Vehicle._({
    this.id,
    required this.ownerId,
    required this.plate,
    this.label,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Vehicle({
    int? id,
    required _is.UuidValue ownerId,
    required String plate,
    String? label,
    DateTime? createdAt,
  }) = _VehicleImpl;

  factory Vehicle.fromJson(Map<String, dynamic> jsonSerialization) {
    return Vehicle(
      id: jsonSerialization['id'] as int?,
      ownerId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['ownerId'],
      ),
      plate: jsonSerialization['plate'] as String,
      label: jsonSerialization['label'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = VehicleTable();

  static const db = VehicleRepository._();

  @override
  int? id;

  _is.UuidValue ownerId;

  String plate;

  String? label;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Vehicle]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Vehicle copyWith({
    int? id,
    _is.UuidValue? ownerId,
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

  static VehicleInclude include() {
    return VehicleInclude._();
  }

  static VehicleIncludeList includeList({
    _is.WhereExpressionBuilder<VehicleTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<VehicleTable>? orderBy,
    _is.OrderByListBuilder<VehicleTable>? orderByList,
    VehicleInclude? include,
  }) {
    return VehicleIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Vehicle.t),
      orderByList: orderByList?.call(Vehicle.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VehicleImpl extends Vehicle {
  _VehicleImpl({
    int? id,
    required _is.UuidValue ownerId,
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
  @_is.useResult
  @override
  Vehicle copyWith({
    Object? id = _Undefined,
    _is.UuidValue? ownerId,
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

class VehicleUpdateTable extends _is.UpdateTable<VehicleTable> {
  VehicleUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> ownerId(_is.UuidValue value) =>
      _is.ColumnValue(
        table.ownerId,
        value,
      );

  _is.ColumnValue<String, String> plate(String value) => _is.ColumnValue(
    table.plate,
    value,
  );

  _is.ColumnValue<String, String> label(String? value) => _is.ColumnValue(
    table.label,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class VehicleTable extends _is.Table<int?> {
  VehicleTable({super.tableRelation}) : super(tableName: 'vehicle') {
    updateTable = VehicleUpdateTable(this);
    ownerId = _is.ColumnUuid(
      'ownerId',
      this,
    );
    plate = _is.ColumnString(
      'plate',
      this,
    );
    label = _is.ColumnString(
      'label',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final VehicleUpdateTable updateTable;

  late final _is.ColumnUuid ownerId;

  late final _is.ColumnString plate;

  late final _is.ColumnString label;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    ownerId,
    plate,
    label,
    createdAt,
  ];
}

class VehicleInclude extends _is.IncludeObject {
  VehicleInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Vehicle.t;
}

class VehicleIncludeList extends _is.IncludeList {
  VehicleIncludeList._({
    _is.WhereExpressionBuilder<VehicleTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Vehicle.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Vehicle.t;
}

class VehicleRepository {
  const VehicleRepository._();

  /// Returns a list of [Vehicle]s matching the given query parameters.
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
  Future<List<Vehicle>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<VehicleTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<VehicleTable>? orderBy,
    _is.OrderByListBuilder<VehicleTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Vehicle>(
      where: where?.call(Vehicle.t),
      orderBy: orderBy?.call(Vehicle.t),
      orderByList: orderByList?.call(Vehicle.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [Vehicle]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `Vehicle.t`.
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
  _ida.Stream<List<Vehicle>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<VehicleTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<VehicleTable>? orderBy,
    _is.OrderByListBuilder<VehicleTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<Vehicle>(
      where: where?.call(Vehicle.t),
      orderBy: orderBy?.call(Vehicle.t),
      orderByList: orderByList?.call(Vehicle.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [Vehicle] matching the given query parameters.
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
  Future<Vehicle?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<VehicleTable>? where,
    int? offset,
    _is.OrderByBuilder<VehicleTable>? orderBy,
    _is.OrderByListBuilder<VehicleTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Vehicle>(
      where: where?.call(Vehicle.t),
      orderBy: orderBy?.call(Vehicle.t),
      orderByList: orderByList?.call(Vehicle.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Vehicle] by its [id] or null if no such row exists.
  Future<Vehicle?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Vehicle>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Vehicle]s in the list and returns the inserted rows.
  ///
  /// The returned [Vehicle]s will have their `id` fields set.
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
  Future<List<Vehicle>> insert(
    _is.DatabaseSession session,
    List<Vehicle> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Vehicle>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Vehicle] and returns the inserted row.
  ///
  /// The returned [Vehicle] will have its `id` field set.
  Future<Vehicle> insertRow(
    _is.DatabaseSession session,
    Vehicle row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Vehicle>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Vehicle]s in the list and returns the resulting rows.
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
  /// The returned [Vehicle]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Vehicle>> upsert(
    _is.DatabaseSession session,
    List<Vehicle> rows, {
    required _is.ColumnSelections<VehicleTable> conflictColumns,
    _is.ColumnSelections<VehicleTable>? updateColumns,
    _is.WhereExpressionBuilder<VehicleTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Vehicle>(
      rows,
      conflictColumns: conflictColumns(Vehicle.t),
      updateColumns: updateColumns?.call(Vehicle.t),
      updateWhere: updateWhere?.call(Vehicle.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Vehicle] and returns the resulting row.
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
  /// The returned [Vehicle] will have its `id` field set.
  Future<Vehicle?> upsertRow(
    _is.DatabaseSession session,
    Vehicle row, {
    required _is.ColumnSelections<VehicleTable> conflictColumns,
    _is.ColumnSelections<VehicleTable>? updateColumns,
    _is.WhereExpressionBuilder<VehicleTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Vehicle>(
      row,
      conflictColumns: conflictColumns(Vehicle.t),
      updateColumns: updateColumns?.call(Vehicle.t),
      updateWhere: updateWhere?.call(Vehicle.t),
      transaction: transaction,
    );
  }

  /// Updates all [Vehicle]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Vehicle>> update(
    _is.DatabaseSession session,
    List<Vehicle> rows, {
    _is.ColumnSelections<VehicleTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Vehicle>(
      rows,
      columns: columns?.call(Vehicle.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Vehicle]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Vehicle> updateRow(
    _is.DatabaseSession session,
    Vehicle row, {
    _is.ColumnSelections<VehicleTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Vehicle>(
      row,
      columns: columns?.call(Vehicle.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Vehicle] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Vehicle?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<VehicleUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Vehicle>(
      id,
      columnValues: columnValues(Vehicle.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Vehicle]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Vehicle>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<VehicleUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<VehicleTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<VehicleTable>? orderBy,
    _is.OrderByListBuilder<VehicleTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Vehicle>(
      columnValues: columnValues(Vehicle.t.updateTable),
      where: where(Vehicle.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Vehicle.t),
      orderByList: orderByList?.call(Vehicle.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Vehicle]s in the list and returns the deleted rows.
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
  Future<List<Vehicle>> delete(
    _is.DatabaseSession session,
    List<Vehicle> rows, {
    _is.OrderByBuilder<VehicleTable>? orderBy,
    _is.OrderByListBuilder<VehicleTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Vehicle>(
      rows,
      orderBy: orderBy?.call(Vehicle.t),
      orderByList: orderByList?.call(Vehicle.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Vehicle].
  Future<Vehicle> deleteRow(
    _is.DatabaseSession session,
    Vehicle row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Vehicle>(
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
  Future<List<Vehicle>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<VehicleTable> where,
    _is.OrderByBuilder<VehicleTable>? orderBy,
    _is.OrderByListBuilder<VehicleTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Vehicle>(
      where: where(Vehicle.t),
      orderBy: orderBy?.call(Vehicle.t),
      orderByList: orderByList?.call(Vehicle.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<VehicleTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Vehicle>(
      where: where?.call(Vehicle.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Vehicle] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<VehicleTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Vehicle>(
      where: where(Vehicle.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
