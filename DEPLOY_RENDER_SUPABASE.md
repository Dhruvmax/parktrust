# Deploy ParkTrust on Render (server) + Supabase (database)

Vercel and Firebase do not work with Serverpod. Render runs the server, Supabase is plain Postgres.
Never put passwords in code or Git. Everything secret goes into Render "Environment" fields.

## 1. Supabase (database) - ALREADY DONE
Project: "gauranshkun Project", ref xdatcoqvaayztbszeypt, region ap-northeast-2 (Seoul).
All ParkTrust tables already exist (Serverpod migration 20261122011431371) and Row Level Security is on for every table.
Still needed from you: the password (Supabase -> Project Settings -> Database -> reset/copy) and the exact Session pooler host
(Supabase -> Connect -> Session pooler). The user is postgres.xdatcoqvaayztbszeypt. The pooler host looks like
aws-0-ap-northeast-2.pooler.supabase.com (copy the real one from the Connect dialog; it may be aws-1-...).
Original steps for reference:
1. supabase.com -> New project. Save the database password somewhere private.
2. Project -> Connect -> **Session pooler**. Note: Host (aws-...pooler.supabase.com), Port 5432, User (postgres.<project-ref>), Database `postgres`.
   Use the pooler, not the direct host: the direct host is IPv6 only and Render cannot reach it.

## 2. Put the project on GitHub
Repo root = C:\src\parktrust_app (the folder holding parktrust_app_server, _client and _flutter).
config/passwords.yaml is already git-ignored. Do not remove that.

## 3. Render (server)
New -> Web Service -> connect the repo -> Runtime: Docker.
- Dockerfile path: parktrust_app_server/Dockerfile.render
- Docker build context: . (repo root)
Environment variables:
| Name | Value |
|---|---|
| PORT | 10000 |
| SERVERPOD_API_SERVER_PORT | 10000 |
| SERVERPOD_API_SERVER_PUBLIC_HOST | your-service.onrender.com |
| SERVERPOD_API_SERVER_PUBLIC_PORT | 443 |
| SERVERPOD_API_SERVER_PUBLIC_SCHEME | https |
| SERVERPOD_DATABASE_HOST | Supabase pooler host |
| SERVERPOD_DATABASE_PORT | 5432 |
| SERVERPOD_DATABASE_NAME | postgres |
| SERVERPOD_DATABASE_USER | postgres.xdatcoqvaayztbszeypt |
| SERVERPOD_DATABASE_REQUIRE_SSL | true |
| SERVERPOD_PASSWORD_database | Supabase database password |
| SERVERPOD_PASSWORD_serviceSecret | any random 30+ characters |
| SERVERPOD_PASSWORD_emailSecretHashPepper | any random 30+ characters |
| SERVERPOD_PASSWORD_jwtHmacSha512PrivateKey | any random 64+ characters |
| SERVERPOD_PASSWORD_jwtRefreshTokenHashPepper | any random 30+ characters |
On first start the server creates all tables (--apply-migrations). Check the Render logs.
Sign-up verification codes appear in the Render logs (same as the local server window).

## 4. Point the apps at it
Android / emulator:
  flutter run -d emulator-5554 --dart-define=SERVER_URL=https://your-service.onrender.com/
  flutter build apk --dart-define=SERVER_URL=https://your-service.onrender.com/

## Known limits (be honest in the demo)
- Render exposes ONE public port. This service serves the API. The Flutter web build is not served from here
  unless you create a second Render service with the web server port set to 10000
  (SERVERPOD_WEB_SERVER_PORT=10000, SERVERPOD_API_SERVER_PORT=8080) and a web build made with the Render API URL.
- Render free plan sleeps after idle time: first request is slow and live streams drop.
- The hackathon guide says Serverpod Cloud. Ask the organisers whether Render counts.
