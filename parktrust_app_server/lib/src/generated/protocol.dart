/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:parktrust_app_server/src/generated/alerts/block_alert.dart'
    as _ioi3bn8h;
import 'package:parktrust_app_server/src/generated/bookings/booking_view.dart'
    as _ifj0dq3j;
import 'package:parktrust_app_server/src/generated/listings/listing.dart'
    as _inkqf7d0;
import 'package:parktrust_app_server/src/generated/lots/public_lot.dart'
    as _izqhrtfv;
import 'package:parktrust_app_server/src/generated/subscriptions/plan_option.dart'
    as _igsv3ox3;
import 'package:parktrust_app_server/src/generated/trust/review.dart'
    as _iv0wo0zn;
import 'package:parktrust_app_server/src/generated/vehicles/vehicle.dart'
    as _iisqs83m;
import 'package:serverpod/protocol.dart' as _isp;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
import 'alerts/alert_event.dart' as _iqdsqtc2;
import 'alerts/alert_exception.dart' as _i8yak2jt;
import 'alerts/alert_reply.dart' as _i7hjkq68;
import 'alerts/alert_status.dart' as _idrcyneb;
import 'alerts/alert_thread.dart' as _iidrxmri;
import 'alerts/block_alert.dart' as _idpq4py3;
import 'bookings/booking.dart' as _ir9ahijp;
import 'bookings/booking_status.dart' as _iqmkyysz;
import 'bookings/booking_view.dart' as _ixzn708v;
import 'greetings/greeting.dart' as _izw8z7ou;
import 'listings/listing.dart' as _iycp0oqx;
import 'lots/public_lot.dart' as _i3nxf39q;
import 'subscriptions/plan_option.dart' as _il9f3tn1;
import 'subscriptions/subscription.dart' as _imbfo1ol;
import 'trust/report.dart' as _i8kos0w0;
import 'trust/review.dart' as _ih4k1hlh;
import 'trust/trust_profile.dart' as _ih4fvmvz;
import 'vehicles/vehicle.dart' as _i7tlaewm;
export 'alerts/alert_event.dart';
export 'alerts/alert_exception.dart';
export 'alerts/alert_reply.dart';
export 'alerts/alert_status.dart';
export 'alerts/alert_thread.dart';
export 'alerts/block_alert.dart';
export 'bookings/booking.dart';
export 'bookings/booking_status.dart';
export 'bookings/booking_view.dart';
export 'greetings/greeting.dart';
export 'listings/listing.dart';
export 'lots/public_lot.dart';
export 'subscriptions/plan_option.dart';
export 'subscriptions/subscription.dart';
export 'trust/report.dart';
export 'trust/review.dart';
export 'trust/trust_profile.dart';
export 'vehicles/vehicle.dart';

class Protocol extends _is.DatabaseSerializationManager
    implements _is.DatabaseProtocolDeserializationProvider {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  @override
  _is.ProtocolDeserialization get deserializationMetadata =>
      _is.ProtocolDeserialization.cached(
        this,
        types: const [
          _is.getType<_iqdsqtc2.AlertEvent>,
          _is.getType<_i8yak2jt.AlertException>,
          _is.getType<_i7hjkq68.AlertReply>,
          _is.getType<_idrcyneb.AlertStatus>,
          _is.getType<_iidrxmri.AlertThread>,
          _is.getType<_idpq4py3.BlockAlert>,
          _is.getType<_ir9ahijp.Booking>,
          _is.getType<_iqmkyysz.BookingStatus>,
          _is.getType<_ixzn708v.BookingView>,
          _is.getType<_izw8z7ou.Greeting>,
          _is.getType<_iycp0oqx.Listing>,
          _is.getType<_i3nxf39q.PublicLot>,
          _is.getType<_il9f3tn1.PlanOption>,
          _is.getType<_imbfo1ol.Subscription>,
          _is.getType<_i8kos0w0.Report>,
          _is.getType<_ih4k1hlh.Review>,
          _is.getType<_ih4fvmvz.TrustProfile>,
          _is.getType<_i7tlaewm.Vehicle>,
          _is.getType<_iqdsqtc2.AlertEvent?>,
          _is.getType<_i8yak2jt.AlertException?>,
          _is.getType<_i7hjkq68.AlertReply?>,
          _is.getType<_idrcyneb.AlertStatus?>,
          _is.getType<_iidrxmri.AlertThread?>,
          _is.getType<_idpq4py3.BlockAlert?>,
          _is.getType<_ir9ahijp.Booking?>,
          _is.getType<_iqmkyysz.BookingStatus?>,
          _is.getType<_ixzn708v.BookingView?>,
          _is.getType<_izw8z7ou.Greeting?>,
          _is.getType<_iycp0oqx.Listing?>,
          _is.getType<_i3nxf39q.PublicLot?>,
          _is.getType<_il9f3tn1.PlanOption?>,
          _is.getType<_imbfo1ol.Subscription?>,
          _is.getType<_i8kos0w0.Report?>,
          _is.getType<_ih4k1hlh.Review?>,
          _is.getType<_ih4fvmvz.TrustProfile?>,
          _is.getType<_i7tlaewm.Vehicle?>,
          _is.getType<List<_i7hjkq68.AlertReply>>,
          _is.getType<List<_ioi3bn8h.BlockAlert>>,
          _is.getType<List<_ifj0dq3j.BookingView>>,
          _is.getType<List<_inkqf7d0.Listing>>,
          _is.getType<List<String>>,
          _is.getType<List<_izqhrtfv.PublicLot>>,
          _is.getType<List<_igsv3ox3.PlanOption>>,
          _is.getType<List<_iv0wo0zn.Review>>,
          _is.getType<List<_iisqs83m.Vehicle>>,
        ],
        modules: const [
          _iais.Protocol.new,
          _iacs.Protocol.new,
          _isp.Protocol.new,
        ],
        classNames: const [
          'AlertEvent',
          'AlertException',
          'AlertReply',
          'AlertStatus',
          'AlertThread',
          'BlockAlert',
          'Booking',
          'BookingStatus',
          'BookingView',
          'Greeting',
          'Listing',
          'PublicLot',
          'PlanOption',
          'Subscription',
          'Report',
          'Review',
          'TrustProfile',
          'Vehicle',
        ],
      );

  static List<_isp.TableDefinition> get targetTableDefinitions => [
    ..._ownTableDefinitions,
    ..._iais.Protocol().getOwnTableDefinitions(),
    ..._iacs.Protocol().getOwnTableDefinitions(),
    ..._isp.Protocol.targetTableDefinitions,
  ];

  static List<_isp.TableDefinition> get _ownTableDefinitions => [
    _isp.TableDefinition(
      name: 'alert_reply',
      dartName: 'AlertReply',
      schema: 'public',
      module: 'parktrust_app',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'alertId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'ownerId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'message',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'etaMinutes',
          columnType: _isp.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'alert_reply_alert_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'alertId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'block_alert',
      dartName: 'BlockAlert',
      schema: 'public',
      module: 'parktrust_app',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'reporterId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'ownerId',
          columnType: _isp.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _isp.ColumnDefinition(
          name: 'plate',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'latitude',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _isp.ColumnDefinition(
          name: 'longitude',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _isp.ColumnDefinition(
          name: 'photo',
          columnType: _isp.ColumnType.bytea,
          isNullable: true,
          dartType: 'dart:typed_data:ByteData?',
        ),
        _isp.ColumnDefinition(
          name: 'note',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:AlertStatus',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'block_alert_reporter_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'reporterId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'block_alert_owner_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'ownerId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'block_alert_plate_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'plate',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'booking',
      dartName: 'Booking',
      schema: 'public',
      module: 'parktrust_app',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'listingId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'driverId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'ownerId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'plate',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'startTime',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'endTime',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'ratePerHour',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'baseAmount',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'commission',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:BookingStatus',
        ),
        _isp.ColumnDefinition(
          name: 'paymentStatus',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'checkInTime',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isp.ColumnDefinition(
          name: 'checkOutTime',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isp.ColumnDefinition(
          name: 'overstayMinutes',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _isp.ColumnDefinition(
          name: 'overstayAmount',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _isp.ColumnDefinition(
          name: 'refundAmount',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _isp.ColumnDefinition(
          name: 'extensionCount',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _isp.ColumnDefinition(
          name: 'ownerPenaltyShare',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _isp.ColumnDefinition(
          name: 'overstayReportedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isp.ColumnDefinition(
          name: 'overstayPhoto',
          columnType: _isp.ColumnType.bytea,
          isNullable: true,
          dartType: 'dart:typed_data:ByteData?',
        ),
        _isp.ColumnDefinition(
          name: 'lastLatitude',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _isp.ColumnDefinition(
          name: 'lastLongitude',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _isp.ColumnDefinition(
          name: 'lastLocationAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'booking_listing_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'listingId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'booking_driver_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'driverId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'booking_owner_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'ownerId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'listing',
      dartName: 'Listing',
      schema: 'public',
      module: 'parktrust_app',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'ownerId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'title',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'area',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'address',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'latitude',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'longitude',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'ratePerHour',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'capacity',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'hasEv',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isp.ColumnDefinition(
          name: 'hasCctv',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isp.ColumnDefinition(
          name: 'covered',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isp.ColumnDefinition(
          name: 'gated',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isp.ColumnDefinition(
          name: 'active',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isp.ColumnDefinition(
          name: 'qrSecret',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'\'',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'listing_owner_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'ownerId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'public_lot',
      dartName: 'PublicLot',
      schema: 'public',
      module: 'parktrust_app',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'name',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'category',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'city',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'area',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'address',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'latitude',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'longitude',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'ratePerHour',
          columnType: _isp.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _isp.ColumnDefinition(
          name: 'capacity',
          columnType: _isp.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _isp.ColumnDefinition(
          name: 'hasEv',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isp.ColumnDefinition(
          name: 'evNote',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'hours',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'priceNote',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'bookable',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'public_lot_city_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'city',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'report',
      dartName: 'Report',
      schema: 'public',
      module: 'parktrust_app',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'bookingId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'reporterId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'reportedId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'reason',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'details',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'report_booking_reporter_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'bookingId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'reporterId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'report_reported_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'reportedId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'review',
      dartName: 'Review',
      schema: 'public',
      module: 'parktrust_app',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'bookingId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'reviewerId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'revieweeId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'rating',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'comment',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'review_booking_reviewer_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'bookingId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'reviewerId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'review_reviewee_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'revieweeId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'subscription',
      dartName: 'Subscription',
      schema: 'public',
      module: 'parktrust_app',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'plan',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'amount',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'startsAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'endsAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'subscription_user_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'vehicle',
      dartName: 'Vehicle',
      schema: 'public',
      module: 'parktrust_app',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'ownerId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'plate',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'label',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'vehicle_plate_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'plate',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'vehicle_owner_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'ownerId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
  ];

  static String? getClassNameFromObjectJson(dynamic data) =>
      _is.ProtocolDeserialization.readClassName(data);

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    final rawDataClassName = _is.ProtocolDeserialization.readClassName(data);
    final dataClassName = rawDataClassName;
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on _is.DeserializationClassNameNotFoundException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _iqdsqtc2.AlertEvent) {
      return _iqdsqtc2.AlertEvent.fromJson(data) as T;
    }
    if (t == _i8yak2jt.AlertException) {
      return _i8yak2jt.AlertException.fromJson(data) as T;
    }
    if (t == _i7hjkq68.AlertReply) {
      return _i7hjkq68.AlertReply.fromJson(data) as T;
    }
    if (t == _idrcyneb.AlertStatus) {
      return _idrcyneb.AlertStatus.fromJson(data) as T;
    }
    if (t == _iidrxmri.AlertThread) {
      return _iidrxmri.AlertThread.fromJson(data) as T;
    }
    if (t == _idpq4py3.BlockAlert) {
      return _idpq4py3.BlockAlert.fromJson(data) as T;
    }
    if (t == _ir9ahijp.Booking) {
      return _ir9ahijp.Booking.fromJson(data) as T;
    }
    if (t == _iqmkyysz.BookingStatus) {
      return _iqmkyysz.BookingStatus.fromJson(data) as T;
    }
    if (t == _ixzn708v.BookingView) {
      return _ixzn708v.BookingView.fromJson(data) as T;
    }
    if (t == _izw8z7ou.Greeting) {
      return _izw8z7ou.Greeting.fromJson(data) as T;
    }
    if (t == _iycp0oqx.Listing) {
      return _iycp0oqx.Listing.fromJson(data) as T;
    }
    if (t == _i3nxf39q.PublicLot) {
      return _i3nxf39q.PublicLot.fromJson(data) as T;
    }
    if (t == _il9f3tn1.PlanOption) {
      return _il9f3tn1.PlanOption.fromJson(data) as T;
    }
    if (t == _imbfo1ol.Subscription) {
      return _imbfo1ol.Subscription.fromJson(data) as T;
    }
    if (t == _i8kos0w0.Report) {
      return _i8kos0w0.Report.fromJson(data) as T;
    }
    if (t == _ih4k1hlh.Review) {
      return _ih4k1hlh.Review.fromJson(data) as T;
    }
    if (t == _ih4fvmvz.TrustProfile) {
      return _ih4fvmvz.TrustProfile.fromJson(data) as T;
    }
    if (t == _i7tlaewm.Vehicle) {
      return _i7tlaewm.Vehicle.fromJson(data) as T;
    }
    if (t == _is.getType<_iqdsqtc2.AlertEvent?>()) {
      return (data != null ? _iqdsqtc2.AlertEvent.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i8yak2jt.AlertException?>()) {
      return (data != null ? _i8yak2jt.AlertException.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_i7hjkq68.AlertReply?>()) {
      return (data != null ? _i7hjkq68.AlertReply.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_idrcyneb.AlertStatus?>()) {
      return (data != null ? _idrcyneb.AlertStatus.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iidrxmri.AlertThread?>()) {
      return (data != null ? _iidrxmri.AlertThread.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_idpq4py3.BlockAlert?>()) {
      return (data != null ? _idpq4py3.BlockAlert.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ir9ahijp.Booking?>()) {
      return (data != null ? _ir9ahijp.Booking.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iqmkyysz.BookingStatus?>()) {
      return (data != null ? _iqmkyysz.BookingStatus.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ixzn708v.BookingView?>()) {
      return (data != null ? _ixzn708v.BookingView.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iycp0oqx.Listing?>()) {
      return (data != null ? _iycp0oqx.Listing.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i3nxf39q.PublicLot?>()) {
      return (data != null ? _i3nxf39q.PublicLot.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_il9f3tn1.PlanOption?>()) {
      return (data != null ? _il9f3tn1.PlanOption.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_imbfo1ol.Subscription?>()) {
      return (data != null ? _imbfo1ol.Subscription.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i8kos0w0.Report?>()) {
      return (data != null ? _i8kos0w0.Report.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ih4k1hlh.Review?>()) {
      return (data != null ? _ih4k1hlh.Review.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ih4fvmvz.TrustProfile?>()) {
      return (data != null ? _ih4fvmvz.TrustProfile.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i7tlaewm.Vehicle?>()) {
      return (data != null ? _i7tlaewm.Vehicle.fromJson(data) : null) as T;
    }
    if (t == List<_i7hjkq68.AlertReply>) {
      return (data as List)
              .map((e) => deserialize<_i7hjkq68.AlertReply>(e))
              .toList()
          as T;
    }
    if (t == List<_ioi3bn8h.BlockAlert>) {
      return (data as List)
              .map((e) => deserialize<_ioi3bn8h.BlockAlert>(e))
              .toList()
          as T;
    }
    if (t == List<_ifj0dq3j.BookingView>) {
      return (data as List)
              .map((e) => deserialize<_ifj0dq3j.BookingView>(e))
              .toList()
          as T;
    }
    if (t == List<_inkqf7d0.Listing>) {
      return (data as List)
              .map((e) => deserialize<_inkqf7d0.Listing>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_izqhrtfv.PublicLot>) {
      return (data as List)
              .map((e) => deserialize<_izqhrtfv.PublicLot>(e))
              .toList()
          as T;
    }
    if (t == List<_igsv3ox3.PlanOption>) {
      return (data as List)
              .map((e) => deserialize<_igsv3ox3.PlanOption>(e))
              .toList()
          as T;
    }
    if (t == List<_iv0wo0zn.Review>) {
      return (data as List)
              .map((e) => deserialize<_iv0wo0zn.Review>(e))
              .toList()
          as T;
    }
    if (t == List<_iisqs83m.Vehicle>) {
      return (data as List)
              .map((e) => deserialize<_iisqs83m.Vehicle>(e))
              .toList()
          as T;
    }
    final modules = deserializationMetadata.modulesForDeserialization(
      t,
      className: rawDataClassName,
    );
    for (final module in modules) {
      try {
        return module.deserialize<T>(data, t);
      } on _is.DeserializationTypeNotFoundException catch (_) {}
    }

    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _iqdsqtc2.AlertEvent => 'AlertEvent',
      _i8yak2jt.AlertException => 'AlertException',
      _i7hjkq68.AlertReply => 'AlertReply',
      _idrcyneb.AlertStatus => 'AlertStatus',
      _iidrxmri.AlertThread => 'AlertThread',
      _idpq4py3.BlockAlert => 'BlockAlert',
      _ir9ahijp.Booking => 'Booking',
      _iqmkyysz.BookingStatus => 'BookingStatus',
      _ixzn708v.BookingView => 'BookingView',
      _izw8z7ou.Greeting => 'Greeting',
      _iycp0oqx.Listing => 'Listing',
      _i3nxf39q.PublicLot => 'PublicLot',
      _il9f3tn1.PlanOption => 'PlanOption',
      _imbfo1ol.Subscription => 'Subscription',
      _i8kos0w0.Report => 'Report',
      _ih4k1hlh.Review => 'Review',
      _ih4fvmvz.TrustProfile => 'TrustProfile',
      _i7tlaewm.Vehicle => 'Vehicle',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst(
        'parktrust_app.',
        '',
      );
    }

    switch (data) {
      case _iqdsqtc2.AlertEvent():
        return 'AlertEvent';
      case _i8yak2jt.AlertException():
        return 'AlertException';
      case _i7hjkq68.AlertReply():
        return 'AlertReply';
      case _idrcyneb.AlertStatus():
        return 'AlertStatus';
      case _iidrxmri.AlertThread():
        return 'AlertThread';
      case _idpq4py3.BlockAlert():
        return 'BlockAlert';
      case _ir9ahijp.Booking():
        return 'Booking';
      case _iqmkyysz.BookingStatus():
        return 'BookingStatus';
      case _ixzn708v.BookingView():
        return 'BookingView';
      case _izw8z7ou.Greeting():
        return 'Greeting';
      case _iycp0oqx.Listing():
        return 'Listing';
      case _i3nxf39q.PublicLot():
        return 'PublicLot';
      case _il9f3tn1.PlanOption():
        return 'PlanOption';
      case _imbfo1ol.Subscription():
        return 'Subscription';
      case _i8kos0w0.Report():
        return 'Report';
      case _ih4k1hlh.Review():
        return 'Review';
      case _ih4fvmvz.TrustProfile():
        return 'TrustProfile';
      case _i7tlaewm.Vehicle():
        return 'Vehicle';
    }
    className = _iais.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacs.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    className = _isp.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.') ? className : 'serverpod.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'AlertEvent') {
      return deserialize<_iqdsqtc2.AlertEvent>(data['data']);
    }
    if (dataClassName == 'AlertException') {
      return deserialize<_i8yak2jt.AlertException>(data['data']);
    }
    if (dataClassName == 'AlertReply') {
      return deserialize<_i7hjkq68.AlertReply>(data['data']);
    }
    if (dataClassName == 'AlertStatus') {
      return deserialize<_idrcyneb.AlertStatus>(data['data']);
    }
    if (dataClassName == 'AlertThread') {
      return deserialize<_iidrxmri.AlertThread>(data['data']);
    }
    if (dataClassName == 'BlockAlert') {
      return deserialize<_idpq4py3.BlockAlert>(data['data']);
    }
    if (dataClassName == 'Booking') {
      return deserialize<_ir9ahijp.Booking>(data['data']);
    }
    if (dataClassName == 'BookingStatus') {
      return deserialize<_iqmkyysz.BookingStatus>(data['data']);
    }
    if (dataClassName == 'BookingView') {
      return deserialize<_ixzn708v.BookingView>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_izw8z7ou.Greeting>(data['data']);
    }
    if (dataClassName == 'Listing') {
      return deserialize<_iycp0oqx.Listing>(data['data']);
    }
    if (dataClassName == 'PublicLot') {
      return deserialize<_i3nxf39q.PublicLot>(data['data']);
    }
    if (dataClassName == 'PlanOption') {
      return deserialize<_il9f3tn1.PlanOption>(data['data']);
    }
    if (dataClassName == 'Subscription') {
      return deserialize<_imbfo1ol.Subscription>(data['data']);
    }
    if (dataClassName == 'Report') {
      return deserialize<_i8kos0w0.Report>(data['data']);
    }
    if (dataClassName == 'Review') {
      return deserialize<_ih4k1hlh.Review>(data['data']);
    }
    if (dataClassName == 'TrustProfile') {
      return deserialize<_ih4fvmvz.TrustProfile>(data['data']);
    }
    if (dataClassName == 'Vehicle') {
      return deserialize<_i7tlaewm.Vehicle>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      return _iais.Protocol().deserializeByClassName({
        ...data,
        'className': dataClassName.substring(19),
      });
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      return _iacs.Protocol().deserializeByClassName({
        ...data,
        'className': dataClassName.substring(20),
      });
    }
    if (dataClassName.startsWith('serverpod.')) {
      return _isp.Protocol().deserializeByClassName({
        ...data,
        'className': dataClassName.substring(10),
      });
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iais.Protocol().registerHostProtocol('parktrust_app', this);
    _iacs.Protocol().registerHostProtocol('parktrust_app', this);
  }

  @override
  _is.Table? getTableForType(Type t) {
    {
      var table = _iais.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _iacs.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _isp.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i7hjkq68.AlertReply:
        return _i7hjkq68.AlertReply.t;
      case _idpq4py3.BlockAlert:
        return _idpq4py3.BlockAlert.t;
      case _ir9ahijp.Booking:
        return _ir9ahijp.Booking.t;
      case _iycp0oqx.Listing:
        return _iycp0oqx.Listing.t;
      case _i3nxf39q.PublicLot:
        return _i3nxf39q.PublicLot.t;
      case _imbfo1ol.Subscription:
        return _imbfo1ol.Subscription.t;
      case _i8kos0w0.Report:
        return _i8kos0w0.Report.t;
      case _ih4k1hlh.Review:
        return _ih4k1hlh.Review.t;
      case _i7tlaewm.Vehicle:
        return _i7tlaewm.Vehicle.t;
    }
    return null;
  }

  @override
  List<_isp.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  List<_isp.TableDefinition> getOwnTableDefinitions() => _ownTableDefinitions;

  @override
  String getModuleName() => 'parktrust_app';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _iais.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacs.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
