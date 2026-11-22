// dart run bin/seed_users.dart
// Generates argon2id hashes using the EXACT same code path as the server,
// then inserts demo accounts into the production DB.

import 'dart:io';
import 'dart:convert';

import 'package:serverpod_auth_core_server/src/common/utils/argon2_hash_util.dart';
import 'package:postgres/postgres.dart';
import 'package:uuid/uuid.dart';

const pepper = '3ity674E7JWxxaIQDLzz_j99DqRLj5kQ';
const password = 'demo1234';

final users = [
  {'email': 'driver@demo.com', 'name': 'Demo Driver'},
  {'email': 'driver2@demo.com', 'name': 'Demo Driver 2'},
  {'email': 'driver3@demo.com', 'name': 'Demo Driver 3'},
  {'email': 'owner@demo.com', 'name': 'Demo Owner'},
  {'email': 'owner2@demo.com', 'name': 'Demo Owner 2'},
  {'email': 'owner3@demo.com', 'name': 'Demo Owner 3'},
  {'email': 'admin@demo.com', 'name': 'Demo Admin'},
];

void main() async {
  final hashUtil = Argon2HashUtil(
    hashPepper: pepper,
    hashSaltLength: 16,
  );

  print('Connecting to DB...');
  final conn = await Connection.open(
    Endpoint(
      host: 'ep-flat-pond-b9omf1x2-pooler.c-7.eu-central-1.aws.neon.tech',
      port: 5432,
      database: 'default',
      username: 'seeduser',
      password: 'npg_TGg8cMr0LauA',
    ),
    settings: ConnectionSettings(sslMode: SslMode.require),
  );

  print('Hashing password "$password" with pepper...');
  final hash = await hashUtil.createHashFromString(secret: password);
  print('Hash: $hash\n');

  final uuid = Uuid();

  for (final user in users) {
    final email = user['email']!;
    final name = user['name']!;

    // Check if core user linked to this email already exists
    final existing = await conn.execute(
      Sql.named('SELECT "authUserId" FROM serverpod_auth_idp_email_account WHERE email = @email'),
      parameters: {'email': email},
    );

    String authUserId;
    if (existing.isNotEmpty) {
      authUserId = existing.first[0].toString();
      print('Found existing account $email → authUserId: $authUserId');
    } else {
      authUserId = uuid.v4();
      await conn.execute(
        Sql.named('INSERT INTO serverpod_auth_core_user (id, "createdAt", "scopeNames", blocked) VALUES (@id, NOW(), \'[]\', false)'),
        parameters: {'id': authUserId},
      );
      print('Created core user $email → $authUserId');
    }

    // Update passwordHash only (row already exists from previous seed)
    final updated = await conn.execute(
      Sql.named('UPDATE serverpod_auth_idp_email_account SET "passwordHash" = @hash WHERE email = @email'),
      parameters: {'hash': hash, 'email': email},
    );
    print('  ✓ Updated hash for $email (rows affected: ${updated.affectedRows})');
  }

  await conn.close();
  print('\nDone! All users seeded. Try logging in with demo1234');
}
