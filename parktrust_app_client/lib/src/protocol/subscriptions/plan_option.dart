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

/// A membership plan people can choose.
abstract class PlanOption
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  PlanOption._({
    required this.code,
    required this.name,
    required this.price,
    required this.days,
  });

  factory PlanOption({
    required String code,
    required String name,
    required int price,
    required int days,
  }) = _PlanOptionImpl;

  factory PlanOption.fromJson(Map<String, dynamic> jsonSerialization) {
    return PlanOption(
      code: jsonSerialization['code'] as String,
      name: jsonSerialization['name'] as String,
      price: jsonSerialization['price'] as int,
      days: jsonSerialization['days'] as int,
    );
  }

  String code;

  String name;

  int price;

  int days;

  /// Returns a shallow copy of this [PlanOption]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  PlanOption copyWith({
    String? code,
    String? name,
    int? price,
    int? days,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlanOption',
      'code': code,
      'name': name,
      'price': price,
      'days': days,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PlanOption',
      'code': code,
      'name': name,
      'price': price,
      'days': days,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _PlanOptionImpl extends PlanOption {
  _PlanOptionImpl({
    required String code,
    required String name,
    required int price,
    required int days,
  }) : super._(
         code: code,
         name: name,
         price: price,
         days: days,
       );

  /// Returns a shallow copy of this [PlanOption]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  PlanOption copyWith({
    String? code,
    String? name,
    int? price,
    int? days,
  }) {
    return PlanOption(
      code: code ?? this.code,
      name: name ?? this.name,
      price: price ?? this.price,
      days: days ?? this.days,
    );
  }
}
