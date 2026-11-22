# Flutter & Serverpod project

This project is a Flutter app (frontend) backed by a Serverpod server (backend). Always build the app's backend with Serverpod.
Build for multiple users, use Serverpod's built-in authentication, which is already set up in `lib/server.dart`.

The server and Flutter app run under the Serverpod runner, a background process per server package. The user attaches to it with `serverpod start`. There is no need to check if the server is running: make the changes and call the `serverpod` MCP tools as needed. If the server is not running, an informative error message will be received from the MCP server. Then call `tail_runner_logs` to learn whether it is still starting or why it stopped. If nothing is running, start it with `serverpod runner start` in `parktrust_app_server`, which returns once the server is up and leaves it running for the user to attach to. If it fails, fix the cause it reports (a build error, a port held by another process, Docker) instead of retrying; only a `serverpod runner start` your shell killed on a timeout is run again, since the runner keeps starting. Flutter apps declared with `auto_launch` launch once the user attaches; launch any app before that with the MCP tool `spawn_flutter_app`. Leave the runner running, and run `serverpod runner stop` only when asked.

While running, the runner watches for file changes to run incremental code generation and hot reload both the server and the Flutter app. `serverpod runner status` prints its state and the server addresses, which are not always the configured ports when another Serverpod runner on the machine holds them.

Calling `serverpod generate` directly is not needed, but might be useful to troubleshoot when an incremental generation fails.

ALWAYS use the MCP server instead of the command line for the tasks below. The `serverpod runner` commands are the exception: they manage the stack itself. Use the MCP server to:

- `create_migration` and `apply_migrations` for database (after you change data models).
- `create_repair_migration` if the database has drifted out of sync with the migrations.
- `tail_server_logs` to read logs from the server.
- `tail_runner_logs` to read the output of the runner itself (code generation, compilation, Docker, raw server output). The only tool that also works while the server is starting or after it stopped.
- `tail_flutter_logs` to read the raw stdout/stderr of the Flutter app.
- `hot_reload` / `hot_restart` to reload or restart the server and the Flutter app. ALWAYS call `hot_restart` after doing changes in the Flutter app that may not work with normal hot reload (which is automatically applied).
- `spawn_flutter_app` to start a Flutter app declared under `serverpod: flutter_apps:` in the server `pubspec.yaml`.
- `get_flutter_app_dtd` (Dart tooling daemon) for connecting to the app through the `dart` MCP.

NEVER edit generated code. The server's `lib/src/generated/` directory and the whole `parktrust_app_client` package are rewritten by the code generator. Change the `.spy.yaml` models, the endpoints, or `lib/server.dart` instead.

Migrations are a narrow exception: the `migration.sql` of a generated migration MAY be edited by hand when the generated SQL would lose data — to add a data transformation, or to reach a destructive change through non-destructive steps. Never touch the other files in the migration directory, and keep the schema the SQL ends up with identical to `definition.sql` — new databases are created from that file and never run `migration.sql`.

Only when the MCP is not available or `serverpod runner start` cannot bring the server up, fall back to the CLI in the server package:

- `serverpod generate` to regenerate the client and the generated server code.
- `serverpod create-migration` after changing a model with a `table` (add `--force` for destructive changes). It only writes the migration; the runner applies pending migrations when it boots the server.

Tests need no Docker. `config/test.yaml` sets `database.dataPath`, so Serverpod starts and manages the test database (an embedded PostgreSQL) itself, and the project's `docker-compose.yaml` is not used for it. Just run `dart test` in the server package.

Checklist after doing changes, in this order:

- `dart analyze` (CLI)
- `dart format` (CLI)
- `create_migration` and `apply_migrations` (MCP - only if necessary)
- Do `serverpod` MCP `hot_restart` if required (hot reload is done automatically). Will also hot restart Flutter app
- Run tests, if applicable (`dart test` in the server package)
- Check `serverpod` MCP `tail_server_logs` and `tail_flutter_logs` for any issues.

If the user asks you to test the app:

1. Use `get_flutter_app_dtd` (`serverpod` MCP) to get the Flutter app's DTD
2. Pass the DTD to `connect_dart_tooling_daemon` (`dart` MCP) to connect to the app
3. Use `flutter_driver` (`dart` MCP) to navigate through the app

The app is launched from `parktrust_app_flutter/lib/driver.dart`, which starts the Flutter driver extension with text entry emulation turned off so the app stays usable by hand. To let the driver type, set `enableTextEntryEmulation: true` there and `hot_restart` the app.

## About this app: ParkTrust (Snap & Alert)

Hackathon entry for HackBriven x Serverpod, track "Superpowers in your pocket".
A person blocked in by another car snaps the plate; the owner gets a live alert and replies with one tap.

Features (build one at a time, in this order):
1. Register my car plate (VehicleEndpoint, My cars tab).
2. Snap the blocker: camera photo, plate read on the phone (editable), GPS (Snap tab).
3. Live alert to the owner (AlertEndpoint.createAlert + watchIncoming stream).
4. Owner replies Coming now / 5 min / 15 min, reporter sees it live (reply, watchThread, resolve).

Server (`parktrust_app_server/lib/src`):
- `vehicles/`: vehicle.spy.yaml, vehicle_endpoint.dart
- `alerts/`: block_alert, alert_reply, alert_event, alert_thread, alert_status, alert_exception (.spy.yaml), alert_endpoint.dart, alert_helpers.dart (auth id, plate normalising, channel names)
- Every endpoint requires login; an alert is readable only by its reporter or its owner.

Flutter (`parktrust_app_flutter/lib`): Riverpod providers in `providers/`, screens in `features/`, shell and theme in `app/`.
Plate reading uses a conditional import (`features/snap/plate_reader.dart`): ML Kit on Android/iOS, typed entry on web.

Rules: never put passwords, tokens or API keys in code, prompts or Git.

Marketplace stages added after Snap & Alert (old Node ParkTrust stays untouched as reference):
- Stage 1 Public lots: `lots/` (PublicLot, sample data in public_lots_data.dart), Flutter `features/lots`.
- Stage 2 Host listings and search: `listings/` (Listing, ListingEndpoint), Flutter `features/market`.
- Stage 3 Booking: `bookings/` (Booking, BookingView, BookingEndpoint). Mock payment: held at booking, released at checkout. Overstay 1.5x per started hour after 5 min grace. Free cancel more than 2 h before start, otherwise 30% kept. Commission 12%.
- Stage 4 Trust: `trust/` (Review, TrustProfile, TrustEndpoint). Score = 60 + 3 per finished booking (max 10) + rating adjustment - 5 per overstay.

Web and mobile share one codebase and one database: the Flutter app is built for web (`serverpod run flutter_build` in parktrust_app_server) and served by the Serverpod web server at / (port 8082 in development). Plate reading by ML Kit is mobile only; on web the plate is typed.
Business model: weekly / monthly / yearly membership (SubscriptionEndpoint). Booking and listing need an active plan. No fee per booking.
Gate QR: owner shows `PT1:<listingId>:<secret>` (ListingEndpoint.ownerQr); the driver scans it for check-in and check-out. Demo spaces accept `PT1:DEMO`.
Overstay: owner uploads a photo (BookingEndpoint.reportOverstay); driver pays Rs 100 per started hour after the 5 minute grace, owner gets 50%, driver gets an automatic 1-star review and -10 trust. Extension is allowed only in the last 2 hours of a booking.
