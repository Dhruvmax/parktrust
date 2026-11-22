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
import 'package:parktrust_app_client/src/protocol/protocol.dart' as _iadas057;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import '../bookings/booking.dart' as _i4q9h4yj;
import '../listings/listing.dart' as _inllgr00;

/// A booking together with its listing, for screens.
abstract class BookingView
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  BookingView._({
    required this.booking,
    required this.listing,
    required this.reviewedByMe,
    required this.reportedByMe,
  });

  factory BookingView({
    required _i4q9h4yj.Booking booking,
    required _inllgr00.Listing listing,
    required bool reviewedByMe,
    required bool reportedByMe,
  }) = _BookingViewImpl;

  factory BookingView.fromJson(Map<String, dynamic> jsonSerialization) {
    return BookingView(
      booking: _iadas057.Protocol().deserialize<_i4q9h4yj.Booking>(
        jsonSerialization['booking'],
      ),
      listing: _iadas057.Protocol().deserialize<_inllgr00.Listing>(
        jsonSerialization['listing'],
      ),
      reviewedByMe: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['reviewedByMe'],
      ),
      reportedByMe: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['reportedByMe'],
      ),
    );
  }

  _i4q9h4yj.Booking booking;

  _inllgr00.Listing listing;

  bool reviewedByMe;

  bool reportedByMe;

  /// Returns a shallow copy of this [BookingView]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  BookingView copyWith({
    _i4q9h4yj.Booking? booking,
    _inllgr00.Listing? listing,
    bool? reviewedByMe,
    bool? reportedByMe,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BookingView',
      'booking': booking.toJson(),
      'listing': listing.toJson(),
      'reviewedByMe': reviewedByMe,
      'reportedByMe': reportedByMe,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'BookingView',
      'booking': booking.toJsonForProtocol(),
      'listing': listing.toJsonForProtocol(),
      'reviewedByMe': reviewedByMe,
      'reportedByMe': reportedByMe,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _BookingViewImpl extends BookingView {
  _BookingViewImpl({
    required _i4q9h4yj.Booking booking,
    required _inllgr00.Listing listing,
    required bool reviewedByMe,
    required bool reportedByMe,
  }) : super._(
         booking: booking,
         listing: listing,
         reviewedByMe: reviewedByMe,
         reportedByMe: reportedByMe,
       );

  /// Returns a shallow copy of this [BookingView]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  BookingView copyWith({
    _i4q9h4yj.Booking? booking,
    _inllgr00.Listing? listing,
    bool? reviewedByMe,
    bool? reportedByMe,
  }) {
    return BookingView(
      booking: booking ?? this.booking.copyWith(),
      listing: listing ?? this.listing.copyWith(),
      reviewedByMe: reviewedByMe ?? this.reviewedByMe,
      reportedByMe: reportedByMe ?? this.reportedByMe,
    );
  }
}
