BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "booking" (
    "id" bigserial PRIMARY KEY,
    "listingId" bigint NOT NULL,
    "driverId" uuid NOT NULL,
    "ownerId" uuid NOT NULL,
    "plate" text NOT NULL,
    "startTime" timestamp without time zone NOT NULL,
    "endTime" timestamp without time zone NOT NULL,
    "ratePerHour" bigint NOT NULL,
    "baseAmount" bigint NOT NULL,
    "commission" bigint NOT NULL,
    "status" text NOT NULL,
    "paymentStatus" text NOT NULL,
    "checkInTime" timestamp without time zone,
    "checkOutTime" timestamp without time zone,
    "overstayMinutes" bigint NOT NULL DEFAULT 0,
    "overstayAmount" bigint NOT NULL DEFAULT 0,
    "refundAmount" bigint NOT NULL DEFAULT 0,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "booking_listing_idx" ON "booking" USING btree ("listingId");
CREATE INDEX "booking_driver_idx" ON "booking" USING btree ("driverId");
CREATE INDEX "booking_owner_idx" ON "booking" USING btree ("ownerId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "listing" (
    "id" bigserial PRIMARY KEY,
    "ownerId" uuid NOT NULL,
    "title" text NOT NULL,
    "description" text,
    "area" text NOT NULL,
    "address" text NOT NULL,
    "latitude" double precision NOT NULL,
    "longitude" double precision NOT NULL,
    "ratePerHour" bigint NOT NULL,
    "capacity" bigint NOT NULL,
    "hasEv" boolean NOT NULL,
    "hasCctv" boolean NOT NULL,
    "covered" boolean NOT NULL,
    "gated" boolean NOT NULL,
    "active" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "listing_owner_idx" ON "listing" USING btree ("ownerId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "public_lot" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "category" text NOT NULL,
    "city" text NOT NULL,
    "area" text NOT NULL,
    "address" text NOT NULL,
    "latitude" double precision NOT NULL,
    "longitude" double precision NOT NULL,
    "ratePerHour" bigint,
    "capacity" bigint,
    "hasEv" boolean NOT NULL,
    "evNote" text,
    "hours" text,
    "priceNote" text,
    "bookable" boolean NOT NULL
);

-- Indexes
CREATE INDEX "public_lot_city_idx" ON "public_lot" USING btree ("city");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "review" (
    "id" bigserial PRIMARY KEY,
    "bookingId" bigint NOT NULL,
    "reviewerId" uuid NOT NULL,
    "revieweeId" uuid NOT NULL,
    "rating" bigint NOT NULL,
    "comment" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "review_booking_reviewer_idx" ON "review" USING btree ("bookingId", "reviewerId");
CREATE INDEX "review_reviewee_idx" ON "review" USING btree ("revieweeId");


--
-- MIGRATION VERSION FOR parktrust_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('parktrust_app', '20261122004122200', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261122004122200', "timestamp" = now();

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
