import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    show AuthServices;
import 'package:serverpod_auth_idp_server/providers/email.dart';

import '../generated/protocol.dart';

const demoPassword = 'demo1234';

// Own spaces for the demo owners: title, description, area, address,
// lat, lng, rate (Rs/h), capacity, ev, cctv, covered, gated.
const _ownerSpaces = <String, List<List<Object?>>>{
  'owner@demo.com': [
    ['Covered bay, Koregaon Park Lane 7', 'Private covered bay, CCTV and gate.', 'Koregaon Park', 'Lane 7, Koregaon Park, Pune 411001', 18.5389, 73.8957, 70, 2, 1, 1, 1, 1],
    ['Driveway near Phoenix Mall', 'Wide driveway, easy in and out.', 'Viman Nagar', 'Off Nagar Road, Viman Nagar, Pune 411014', 18.5622, 73.9168, 45, 1, 0, 1, 0, 0],
    ['Basement slot, Baner', 'Basement parking with guard.', 'Baner', 'Baner Road, Pune 411045', 18.5642, 73.7769, 50, 4, 0, 1, 1, 1],
  ],
  'owner2@demo.com': [
    ['Society bay, Kothrud', 'Visitor bay inside a gated society.', 'Kothrud', 'Karve Road, Kothrud, Pune 411038', 18.5089, 73.8153, 35, 3, 0, 1, 0, 1],
    ['EV charging spot, Hinjewadi', '7 kW charger, covered.', 'Hinjewadi', 'Phase 2, Hinjewadi, Pune 411057', 18.5985, 73.7377, 80, 2, 1, 1, 1, 1],
  ],
};

const _drivers = <String, List<List<String>>>{
  'driver@demo.com': [['MH12AB1234', 'My Swift'], ['MH14CD5678', 'Creta']],
  'driver2@demo.com': [['MH12EF9012', 'City']],
};

/// Creates demo accounts, spaces and vehicles. Safe to run on every start.
Future<void> seedDemoData(Serverpod pod) async {
  final session = await pod.createSession(enableLogging: false);
  try {
    final admin = AuthServices.instance.emailIdp.admin;
    final ids = <String, UuidValue>{};
    final emails = [..._ownerSpaces.keys, ..._drivers.keys];
    for (final email in emails) {
      final existing = await admin.findAccount(session, email: email);
      if (existing != null) {
        ids[email] = existing.authUserId;
        continue;
      }
      final user = await AuthServices.instance.authUsers.create(session);
      await admin.createEmailAuthentication(
        session,
        authUserId: user.id,
        email: email,
        password: demoPassword,
      );
      ids[email] = user.id;
    }

    for (final e in _ownerSpaces.entries) {
      final owner = ids[e.key]!;
      final count = await Listing.db.count(
        session,
        where: (t) => t.ownerId.equals(owner),
      );
      if (count > 0) continue;
      await Listing.db.insert(
        session,
        e.value
            .map(
              (r) => Listing(
                ownerId: owner,
                title: r[0] as String,
                description: r[1] as String?,
                area: r[2] as String,
                address: r[3] as String,
                latitude: (r[4] as num).toDouble(),
                longitude: (r[5] as num).toDouble(),
                ratePerHour: (r[6] as num).toInt(),
                capacity: (r[7] as num).toInt(),
                hasEv: r[8] == 1,
                hasCctv: r[9] == 1,
                covered: r[10] == 1,
                gated: r[11] == 1,
                active: true,
              ),
            )
            .toList(),
      );
    }

    for (final e in _drivers.entries) {
      final driver = ids[e.key]!;
      final count = await Vehicle.db.count(
        session,
        where: (t) => t.ownerId.equals(driver),
      );
      if (count > 0) continue;
      await Vehicle.db.insert(
        session,
        e.value
            .map((v) => Vehicle(ownerId: driver, plate: v[0], label: v[1]))
            .toList(),
      );
    }
    // ignore: avoid_print
    print('Demo data ready.');
  } catch (e, st) {
    // ignore: avoid_print
    print('Demo seed skipped: $e\n$st');
  } finally {
    await session.close();
  }
}
