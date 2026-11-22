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

/// A person's trust score and what it is made of.
abstract class TrustProfile
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  TrustProfile._({
    required this.score,
    required this.label,
    required this.completedBookings,
    required this.ratingCount,
    this.averageRating,
    required this.overstays,
    required this.reports,
  });

  factory TrustProfile({
    required int score,
    required String label,
    required int completedBookings,
    required int ratingCount,
    double? averageRating,
    required int overstays,
    required int reports,
  }) = _TrustProfileImpl;

  factory TrustProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return TrustProfile(
      score: jsonSerialization['score'] as int,
      label: jsonSerialization['label'] as String,
      completedBookings: jsonSerialization['completedBookings'] as int,
      ratingCount: jsonSerialization['ratingCount'] as int,
      averageRating: (jsonSerialization['averageRating'] as num?)?.toDouble(),
      overstays: jsonSerialization['overstays'] as int,
      reports: jsonSerialization['reports'] as int,
    );
  }

  int score;

  String label;

  int completedBookings;

  int ratingCount;

  double? averageRating;

  int overstays;

  int reports;

  /// Returns a shallow copy of this [TrustProfile]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  TrustProfile copyWith({
    int? score,
    String? label,
    int? completedBookings,
    int? ratingCount,
    double? averageRating,
    int? overstays,
    int? reports,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TrustProfile',
      'score': score,
      'label': label,
      'completedBookings': completedBookings,
      'ratingCount': ratingCount,
      if (averageRating != null) 'averageRating': averageRating,
      'overstays': overstays,
      'reports': reports,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TrustProfile',
      'score': score,
      'label': label,
      'completedBookings': completedBookings,
      'ratingCount': ratingCount,
      if (averageRating != null) 'averageRating': averageRating,
      'overstays': overstays,
      'reports': reports,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TrustProfileImpl extends TrustProfile {
  _TrustProfileImpl({
    required int score,
    required String label,
    required int completedBookings,
    required int ratingCount,
    double? averageRating,
    required int overstays,
    required int reports,
  }) : super._(
         score: score,
         label: label,
         completedBookings: completedBookings,
         ratingCount: ratingCount,
         averageRating: averageRating,
         overstays: overstays,
         reports: reports,
       );

  /// Returns a shallow copy of this [TrustProfile]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  TrustProfile copyWith({
    int? score,
    String? label,
    int? completedBookings,
    int? ratingCount,
    Object? averageRating = _Undefined,
    int? overstays,
    int? reports,
  }) {
    return TrustProfile(
      score: score ?? this.score,
      label: label ?? this.label,
      completedBookings: completedBookings ?? this.completedBookings,
      ratingCount: ratingCount ?? this.ratingCount,
      averageRating: averageRating is double?
          ? averageRating
          : this.averageRating,
      overstays: overstays ?? this.overstays,
      reports: reports ?? this.reports,
    );
  }
}
