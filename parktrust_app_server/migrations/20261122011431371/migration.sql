BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "booking" ADD COLUMN "extensionCount" bigint NOT NULL DEFAULT 0;
ALTER TABLE "booking" ADD COLUMN "ownerPenaltyShare" bigint NOT NULL DEFAULT 0;
ALTER TABLE "booking" ADD COLUMN "overstayReportedAt" timestamp without time zone;
ALTER TABLE "booking" ADD COLUMN "overstayPhoto" bytea;
ALTER TABLE "booking" ADD COLUMN "lastLatitude" double precision;
ALTER TABLE "booking" ADD COLUMN "lastLongitude" double precision;
ALTER TABLE "booking" ADD COLUMN "lastLocationAt" timestamp without time zone;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "listing" ADD COLUMN "qrSecret" text NOT NULL DEFAULT ''::text;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "report" (
    "id" bigserial PRIMARY KEY,
    "bookingId" bigint NOT NULL,
    "reporterId" uuid NOT NULL,
    "reportedId" uuid NOT NULL,
    "reason" text NOT NULL,
    "details" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "report_booking_reporter_idx" ON "report" USING btree ("bookingId", "reporterId");
CREATE INDEX "report_reported_idx" ON "report" USING btree ("reportedId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "subscription" (
    "id" bigserial PRIMARY KEY,
    "userId" uuid NOT NULL,
    "plan" text NOT NULL,
    "amount" bigint NOT NULL,
    "startsAt" timestamp without time zone NOT NULL,
    "endsAt" timestamp without time zone NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "subscription_user_idx" ON "subscription" USING btree ("userId");


--
-- MIGRATION VERSION FOR parktrust_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('parktrust_app', '20261122011431371', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261122011431371', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260824182259319', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260824182259319', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20261015164015382', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261015164015382', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260924105232991', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260924105232991', "timestamp" = now();


COMMIT;
