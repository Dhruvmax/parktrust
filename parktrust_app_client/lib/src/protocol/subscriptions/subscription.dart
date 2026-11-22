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

/// A membership. Drivers and hosts pay a weekly, monthly or yearly fee instead of a fee per booking.
abstract class Subscription
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
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
    required _isc.UuidValue userId,
    required String plan,
    required int amount,
    required DateTime startsAt,
    required DateTime endsAt,
    DateTime? createdAt,
  }) = _SubscriptionImpl;

  factory Subscription.fromJson(Map<String, dynamic> jsonSerialization) {
    return Subscription(
      id: jsonSerialization['id'] as int?,
      userId: _isc.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      plan: jsonSerialization['plan'] as String,
      amount: jsonSerialization['amount'] as int,
      startsAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['startsAt'],
      ),
      endsAt: _isc.DateTimeJsonExtension.fromJson(jsonSerialization['endsAt']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _isc.UuidValue userId;

  String plan;

  int amount;

  DateTime startsAt;

  DateTime endsAt;

  DateTime createdAt;

  /// Returns a shallow copy of this [Subscription]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Subscription copyWith({
    int? id,
    _isc.UuidValue? userId,
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

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SubscriptionImpl extends Subscription {
  _SubscriptionImpl({
    int? id,
    required _isc.UuidValue userId,
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
  @_isc.useResult
  @override
  Subscription copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? userId,
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
