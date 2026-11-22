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

/// A membership. Drivers and hosts pay a weekly, monthly or yearly fee instead of a fee per booking.
abstract class Subscription
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  Subscription._({
    this.id,
    required this.userId,
    required this.plan,
    required this.amount,
    required this.startsAt,
    required this.endsAt,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Subscription({
    int? id,
    required _is.UuidValue userId,
    required String plan,
    required int amount,
    required DateTime startsAt,
    required DateTime endsAt,
    DateTime? createdAt,
  }) = _SubscriptionImpl;

  factory Subscription.fromJson(Map<String, dynamic> jsonSerialization) {
    return Subscription(
      id: jsonSerialization['id'] as int?,
      userId: _is.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      plan: jsonSerialization['plan'] as String,
      amount: jsonSerialization['amount'] as int,
      startsAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['startsAt'],
      ),
      endsAt: _is.DateTimeJsonExtension.fromJson(jsonSerialization['endsAt']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = SubscriptionTable();

  static const db = SubscriptionRepository._();

  @override
  int? id;

  _is.UuidValue userId;

  String plan;

  int amount;

  DateTime startsAt;

  DateTime endsAt;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Subscription]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Subscription copyWith({
    int? id,
    _is.UuidValue? userId,
    String? plan,
    int? amount,
    DateTime? startsAt,
    DateTime? endsAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Subscription',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      'plan': plan,
      'amount': amount,
      'startsAt': startsAt.toJson(),
      'endsAt': endsAt.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Subscription',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      'plan': plan,
      'amount': amount,
      'startsAt': startsAt.toJson(),
      'endsAt': endsAt.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static SubscriptionInclude include() {
    return SubscriptionInclude._();
  }

  static SubscriptionIncludeList includeList({
    _is.WhereExpressionBuilder<SubscriptionTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SubscriptionTable>? orderBy,
    _is.OrderByListBuilder<SubscriptionTable>? orderByList,
    SubscriptionInclude? include,
  }) {
    return SubscriptionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Subscription.t),
      orderByList: orderByList?.call(Subscription.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SubscriptionImpl extends Subscription {
  _SubscriptionImpl({
    int? id,
    required _is.UuidValue userId,
    required String plan,
    required int amount,
    required DateTime startsAt,
    required DateTime endsAt,
    DateTime? createdAt,
  }) : super._(
         id: id,
         userId: userId,
         plan: plan,
         amount: amount,
         startsAt: startsAt,
         endsAt: endsAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Subscription]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Subscription copyWith({
    Object? id = _Undefined,
    _is.UuidValue? userId,
    String? plan,
    int? amount,
    DateTime? startsAt,
    DateTime? endsAt,
    DateTime? createdAt,
  }) {
    return Subscription(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      plan: plan ?? this.plan,
      amount: amount ?? this.amount,
      startsAt: startsAt ?? this.startsAt,
      endsAt: endsAt ?? this.endsAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class SubscriptionUpdateTable extends _is.UpdateTable<SubscriptionTable> {
  SubscriptionUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> userId(_is.UuidValue value) =>
      _is.ColumnValue(
        table.userId,
        value,
      );

  _is.ColumnValue<String, String> plan(String value) => _is.ColumnValue(
    table.plan,
    value,
  );

  _is.ColumnValue<int, int> amount(int value) => _is.ColumnValue(
    table.amount,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> startsAt(DateTime value) =>
      _is.ColumnValue(
        table.startsAt,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> endsAt(DateTime value) => _is.ColumnValue(
    table.endsAt,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class SubscriptionTable extends _is.Table<int?> {
  SubscriptionTable({super.tableRelation}) : super(tableName: 'subscription') {
    updateTable = SubscriptionUpdateTable(this);
    userId = _is.ColumnUuid(
      'userId',
      this,
    );
    plan = _is.ColumnString(
      'plan',
      this,
    );
    amount = _is.ColumnInt(
      'amount',
      this,
    );
    startsAt = _is.ColumnDateTime(
      'startsAt',
      this,
    );
    endsAt = _is.ColumnDateTime(
      'endsAt',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final SubscriptionUpdateTable updateTable;

  late final _is.ColumnUuid userId;

  late final _is.ColumnString plan;

  late final _is.ColumnInt amount;

  late final _is.ColumnDateTime startsAt;

  late final _is.ColumnDateTime endsAt;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    userId,
    plan,
    amount,
    startsAt,
    endsAt,
    createdAt,
  ];
}

class SubscriptionInclude extends _is.IncludeObject {
  SubscriptionInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Subscription.t;
}

class SubscriptionIncludeList extends _is.IncludeList {
  SubscriptionIncludeList._({
    _is.WhereExpressionBuilder<SubscriptionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Subscription.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Subscription.t;
}

class SubscriptionRepository {
  const SubscriptionRepository._();

  /// Returns a list of [Subscription]s matching the given query parameters.
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
  Future<List<Subscription>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SubscriptionTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SubscriptionTable>? orderBy,
    _is.OrderByListBuilder<SubscriptionTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Subscription>(
      where: where?.call(Subscription.t),
      orderBy: orderBy?.call(Subscription.t),
      orderByList: orderByList?.call(Subscription.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [Subscription]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `Subscription.t`.
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
  _ida.Stream<List<Subscription>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SubscriptionTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SubscriptionTable>? orderBy,
    _is.OrderByListBuilder<SubscriptionTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<Subscription>(
      where: where?.call(Subscription.t),
      orderBy: orderBy?.call(Subscription.t),
      orderByList: orderByList?.call(Subscription.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [Subscription] matching the given query parameters.
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
  Future<Subscription?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SubscriptionTable>? where,
    int? offset,
    _is.OrderByBuilder<SubscriptionTable>? orderBy,
    _is.OrderByListBuilder<SubscriptionTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Subscription>(
      where: where?.call(Subscription.t),
      orderBy: orderBy?.call(Subscription.t),
      orderByList: orderByList?.call(Subscription.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Subscription] by its [id] or null if no such row exists.
  Future<Subscription?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Subscription>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Subscription]s in the list and returns the inserted rows.
  ///
  /// The returned [Subscription]s will have their `id` fields set.
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
  Future<List<Subscription>> insert(
    _is.DatabaseSession session,
    List<Subscription> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Subscription>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Subscription] and returns the inserted row.
  ///
  /// The returned [Subscription] will have its `id` field set.
  Future<Subscription> insertRow(
    _is.DatabaseSession session,
    Subscription row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Subscription>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Subscription]s in the list and returns the resulting rows.
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
  /// The returned [Subscription]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Subscription>> upsert(
    _is.DatabaseSession session,
    List<Subscription> rows, {
    required _is.ColumnSelections<SubscriptionTable> conflictColumns,
    _is.ColumnSelections<SubscriptionTable>? updateColumns,
    _is.WhereExpressionBuilder<SubscriptionTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Subscription>(
      rows,
      conflictColumns: conflictColumns(Subscription.t),
      updateColumns: updateColumns?.call(Subscription.t),
      updateWhere: updateWhere?.call(Subscription.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Subscription] and returns the resulting row.
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
  /// The returned [Subscription] will have its `id` field set.
  Future<Subscription?> upsertRow(
    _is.DatabaseSession session,
    Subscription row, {
    required _is.ColumnSelections<SubscriptionTable> conflictColumns,
    _is.ColumnSelections<SubscriptionTable>? updateColumns,
    _is.WhereExpressionBuilder<SubscriptionTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Subscription>(
      row,
      conflictColumns: conflictColumns(Subscription.t),
      updateColumns: updateColumns?.call(Subscription.t),
      updateWhere: updateWhere?.call(Subscription.t),
      transaction: transaction,
    );
  }

  /// Updates all [Subscription]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Subscription>> update(
    _is.DatabaseSession session,
    List<Subscription> rows, {
    _is.ColumnSelections<SubscriptionTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Subscription>(
      rows,
      columns: columns?.call(Subscription.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Subscription]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Subscription> updateRow(
    _is.DatabaseSession session,
    Subscription row, {
    _is.ColumnSelections<SubscriptionTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Subscription>(
      row,
      columns: columns?.call(Subscription.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Subscription] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Subscription?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<SubscriptionUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Subscription>(
      id,
      columnValues: columnValues(Subscription.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Subscription]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Subscription>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<SubscriptionUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<SubscriptionTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SubscriptionTable>? orderBy,
    _is.OrderByListBuilder<SubscriptionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Subscription>(
      columnValues: columnValues(Subscription.t.updateTable),
      where: where(Subscription.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Subscription.t),
      orderByList: orderByList?.call(Subscription.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Subscription]s in the list and returns the deleted rows.
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
  Future<List<Subscription>> delete(
    _is.DatabaseSession session,
    List<Subscription> rows, {
    _is.OrderByBuilder<SubscriptionTable>? orderBy,
    _is.OrderByListBuilder<SubscriptionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Subscription>(
      rows,
      orderBy: orderBy?.call(Subscription.t),
      orderByList: orderByList?.call(Subscription.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Subscription].
  Future<Subscription> deleteRow(
    _is.DatabaseSession session,
    Subscription row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Subscription>(
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
  Future<List<Subscription>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SubscriptionTable> where,
    _is.OrderByBuilder<SubscriptionTable>? orderBy,
    _is.OrderByListBuilder<SubscriptionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Subscription>(
      where: where(Subscription.t),
      orderBy: orderBy?.call(Subscription.t),
      orderByList: orderByList?.call(Subscription.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SubscriptionTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Subscription>(
      where: where?.call(Subscription.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Subscription] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SubscriptionTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Subscription>(
      where: where(Subscription.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
