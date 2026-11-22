BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "alert_reply" (
    "id" bigserial PRIMARY KEY,
    "alertId" bigint NOT NULL,
    "ownerId" uuid NOT NULL,
    "message" text NOT NULL,
    "etaMinutes" bigint,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "alert_reply_alert_idx" ON "alert_reply" USING btree ("alertId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "block_alert" (
    "id" bigserial PRIMARY KEY,
    "reporterId" uuid NOT NULL,
    "ownerId" uuid,
    "plate" text NOT NULL,
    "latitude" double precision,
    "longitude" double precision,
    "photo" bytea,
    "note" text,
    "status" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "block_alert_reporter_idx" ON "block_alert" USING btree ("reporterId");
CREATE INDEX "block_alert_owner_idx" ON "block_alert" USING btree ("ownerId");
CREATE INDEX "block_alert_plate_idx" ON "block_alert" USING btree ("plate");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "vehicle" (
    "id" bigserial PRIMARY KEY,
    "ownerId" uuid NOT NULL,
    "plate" text NOT NULL,
    "label" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "vehicle_plate_idx" ON "vehicle" USING btree ("plate");
CREATE INDEX "vehicle_owner_idx" ON "vehicle" USING btree ("ownerId");


--
-- MIGRATION VERSION FOR parktrust_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('parktrust_app', '20261121234022781', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261121234022781', "timestamp" = now();

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
