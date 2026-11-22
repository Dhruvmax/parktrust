import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parktrust_app_client/parktrust_app_client.dart' as api;

import '../client.dart' as app;

/// The one Serverpod client, handed out through Riverpod.
final clientProvider = Provider<api.Client>((ref) => app.client);
