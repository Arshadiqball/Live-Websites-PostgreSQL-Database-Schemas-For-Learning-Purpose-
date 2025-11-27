-- -------------------------------------------------------------
-- TablePlus 6.3.2(586)
--
-- https://tableplus.com/
--
-- Database: classified
-- Generation Time: 2025-03-19 21:32:32.6360
-- -------------------------------------------------------------


-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS ad_fields_id_seq;

-- Table Definition
CREATE TABLE "public"."ad_fields" (
    "id" int8 NOT NULL DEFAULT nextval('ad_fields_id_seq'::regclass),
    "ad_id" int8 NOT NULL,
    "field_id" int8 NOT NULL,
    "field_label" varchar(255),
    "value" text NOT NULL,
    "field_label_ar" varchar(255),
    "value_ar" text NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS ad_plans_id_seq;

-- Table Definition
CREATE TABLE "public"."ad_plans" (
    "id" int8 NOT NULL DEFAULT nextval('ad_plans_id_seq'::regclass),
    "pricing_plan_id" int8 NOT NULL,
    "ad_id" int8 NOT NULL,
    "name" varchar(255) NOT NULL,
    "duration" varchar(255) NOT NULL,
    "price" varchar(255) NOT NULL,
    "currency" varchar(255) NOT NULL,
    "tax" varchar(255) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS ads_id_seq;

-- Table Definition
CREATE TABLE "public"."ads" (
    "id" int8 NOT NULL DEFAULT nextval('ads_id_seq'::regclass),
    "ad_number" varchar(255),
    "user_id" int8 NOT NULL,
    "category_id" int8 NOT NULL,
    "city_id" int8 NOT NULL,
    "status" varchar(255) NOT NULL CHECK ((status)::text = ANY ((ARRAY['Draft'::character varying, 'Payment Pending'::character varying, 'Rejected'::character varying, 'Expired'::character varying, 'Live'::character varying, 'Under Review'::character varying])::text[])),
    "total_amount" float8 NOT NULL DEFAULT '0'::double precision,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS bookings_id_seq;

-- Table Definition
CREATE TABLE "public"."bookings" (
    "id" int8 NOT NULL DEFAULT nextval('bookings_id_seq'::regclass),
    "booking_id" varchar(255) NOT NULL,
    "first_name" varchar(255) NOT NULL,
    "last_name" varchar(255) NOT NULL,
    "company_name" varchar(255),
    "country" varchar(255) NOT NULL,
    "street_address" varchar(255) NOT NULL,
    "apartment" varchar(255),
    "city" varchar(255) NOT NULL,
    "state" varchar(255),
    "phone" varchar(255) NOT NULL,
    "email" varchar(255) NOT NULL,
    "deliver_to_different_address" bool NOT NULL DEFAULT false,
    "order_notes" text,
    "total_price" numeric(10,2),
    "price_details" text,
    "words_count" int4,
    "translation_type_price" numeric(10,2),
    "service_id" int8,
    "recipient" varchar(255),
    "zipcode" varchar(255),
    "address" varchar(255),
    "appartment" varchar(255),
    "additional_info" varchar(255),
    "full_name" varchar(255),
    "full_email" varchar(255),
    "translation_from" varchar(255),
    "translation_to" varchar(255),
    "total_pagestranslation" int4,
    "word_counttranslation" int4,
    "file_names" text,
    "inlineRadioOptions" varchar(255),
    "addinfotextarea" text,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "delivery_type" varchar(255),
    "status" varchar(255) CHECK ((status)::text = ANY (ARRAY[('Pending'::character varying)::text, ('Under Process'::character varying)::text, ('Completed'::character varying)::text, ('Ready for Delivery'::character varying)::text])),
    "confirmfile_names" varchar(255),
    "translation_type" varchar(255),
    "delivery_method" varchar(255),
    "delivery_method_price" numeric(10,2) DEFAULT '0'::numeric,
    "delivery_type_price" numeric(10,2) DEFAULT '0'::numeric,
    "vat_amount" numeric(10,2),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."cache" (
    "key" varchar(255) NOT NULL,
    "value" text NOT NULL,
    "expiration" int4 NOT NULL,
    PRIMARY KEY ("key")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."cache_locks" (
    "key" varchar(255) NOT NULL,
    "owner" varchar(255) NOT NULL,
    "expiration" int4 NOT NULL,
    PRIMARY KEY ("key")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS categories_id_seq;

-- Table Definition
CREATE TABLE "public"."categories" (
    "id" int8 NOT NULL DEFAULT nextval('categories_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "name_ar" varchar(255) NOT NULL,
    "description" text,
    "description_ar" text,
    "status" varchar(255) NOT NULL DEFAULT '1'::character varying CHECK ((status)::text = ANY ((ARRAY['0'::character varying, '1'::character varying])::text[])),
    "parent_id" int8,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS category_atributes_id_seq;

-- Table Definition
CREATE TABLE "public"."category_atributes" (
    "id" int8 NOT NULL DEFAULT nextval('category_atributes_id_seq'::regclass),
    "category_id" int4 NOT NULL,
    "name" varchar(255) NOT NULL,
    "name_ar" varchar(255) NOT NULL,
    "status" int4 NOT NULL DEFAULT 0,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "deleted_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS category_atributes_value_id_seq;

-- Table Definition
CREATE TABLE "public"."category_atributes_value" (
    "id" int8 NOT NULL DEFAULT nextval('category_atributes_value_id_seq'::regclass),
    "category_id" int4 NOT NULL,
    "attribute_id" int4 NOT NULL,
    "name" varchar(255) NOT NULL,
    "name_ar" varchar(255) NOT NULL,
    "status" int4 NOT NULL DEFAULT 0,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "deleted_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS category_fields_id_seq;

-- Table Definition
CREATE TABLE "public"."category_fields" (
    "id" int8 NOT NULL DEFAULT nextval('category_fields_id_seq'::regclass),
    "category_id" int8 NOT NULL,
    "type" varchar(255) NOT NULL,
    "label" varchar(255) NOT NULL,
    "name" varchar(255) NOT NULL,
    "label_ar" varchar(255) NOT NULL,
    "name_ar" varchar(255) NOT NULL,
    "options" text,
    "attribute_id" int8,
    "file_types" varchar(255),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "order" int8,
    "field_id" int8,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS challenges_id_seq;

-- Table Definition
CREATE TABLE "public"."challenges" (
    "id" int8 NOT NULL DEFAULT nextval('challenges_id_seq'::regclass),
    "user_id" int8 NOT NULL,
    "name" varchar(255) NOT NULL,
    "challenge_type" int2 NOT NULL,
    "target_type" int4,
    "target_value" int4 NOT NULL,
    "start_date" date NOT NULL,
    "end_date" date NOT NULL,
    "status" int2 NOT NULL DEFAULT '0'::smallint,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "deleted_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- Column Comment
COMMENT ON COLUMN "public"."challenges"."user_id" IS 'to understand whom is created';
COMMENT ON COLUMN "public"."challenges"."challenge_type" IS '1 for all, 2 for company, 3 for individual';
COMMENT ON COLUMN "public"."challenges"."status" IS '1 for active, 0 for inactive';

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS challenges_companies_id_seq;

-- Table Definition
CREATE TABLE "public"."challenges_companies" (
    "id" int8 NOT NULL DEFAULT nextval('challenges_companies_id_seq'::regclass),
    "challenge_id" int8 NOT NULL,
    "company_id" int8 NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "deleted_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS cities_id_seq;

-- Table Definition
CREATE TABLE "public"."cities" (
    "id" int8 NOT NULL DEFAULT nextval('cities_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "name_ar" varchar(255) NOT NULL,
    "status" int4 NOT NULL DEFAULT 0,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "deleted_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS cms_pages_id_seq;

-- Table Definition
CREATE TABLE "public"."cms_pages" (
    "id" int8 NOT NULL DEFAULT nextval('cms_pages_id_seq'::regclass),
    "title" varchar(255) NOT NULL,
    "content" text,
    "status" varchar(255) NOT NULL DEFAULT 'Draft'::character varying CHECK ((status)::text = ANY (ARRAY[('Draft'::character varying)::text, ('Published'::character varying)::text, ('Scheduled'::character varying)::text])),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "banner_image" text,
    "sub_title_1" text,
    "sub_title_2" text,
    "flag_logo" text,
    "flag_title_1" text,
    "flag_title_2" text,
    "about_image" text,
    "about_video" text,
    "slogan" text,
    "our_business_title" text,
    "our_business_sub_title" text,
    "our_business_left_image" text,
    "our_business_right_image" text,
    "our_mission_title" text,
    "our_mission_logo" text,
    "our_mission_description" text,
    "our_vission_title" text,
    "our_vission_logo" text,
    "our_vission_description" text,
    "our_core_value_title" text,
    "our_core_value_logo" text,
    "our_core_value_description" text,
    "our_core_li_1" text,
    "our_core_li_2" text,
    "our_core_li_3" text,
    "our_core_li_4" text,
    "our_core_li_5" text,
    "evalution_title" text,
    "evalution_sub_title" text,
    "team_title" text,
    "team_sub_title" text,
    "team_description" text,
    "about_video_image" text,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS companies_id_seq;

-- Table Definition
CREATE TABLE "public"."companies" (
    "id" int8 NOT NULL DEFAULT nextval('companies_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "name_ar" varchar(255),
    "brand_logo" varchar(255),
    "description" text,
    "description_ar" text,
    "address" varchar(255),
    "trade_license" varchar(255),
    "trade_license_expiry" date,
    "user_id" int4 NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "deleted_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS contact_us_id_seq;

-- Table Definition
CREATE TABLE "public"."contact_us" (
    "id" int8 NOT NULL DEFAULT nextval('contact_us_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "email" varchar(255) NOT NULL,
    "subject" varchar(255),
    "message" text NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS delivery_types_id_seq;

-- Table Definition
CREATE TABLE "public"."delivery_types" (
    "id" int8 NOT NULL DEFAULT nextval('delivery_types_id_seq'::regclass),
    "translation_type_id" int8,
    "name" varchar(255) NOT NULL,
    "description" text,
    "price_type" varchar(255) NOT NULL DEFAULT 'fixed'::character varying CHECK ((price_type)::text = ANY (ARRAY[('free'::character varying)::text, ('fixed'::character varying)::text])),
    "price" numeric(10,2) DEFAULT '0'::numeric,
    "status" varchar(255) NOT NULL DEFAULT '1'::character varying CHECK ((status)::text = ANY (ARRAY[('0'::character varying)::text, ('1'::character varying)::text])),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS event_types_id_seq;

-- Table Definition
CREATE TABLE "public"."event_types" (
    "id" int8 NOT NULL DEFAULT nextval('event_types_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "status" int4 NOT NULL DEFAULT 0,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS events_id_seq;

-- Table Definition
CREATE TABLE "public"."events" (
    "id" int8 NOT NULL DEFAULT nextval('events_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "event_type_id" int8 NOT NULL,
    "start_date" date NOT NULL,
    "end_date" date NOT NULL,
    "status" varchar(255) NOT NULL DEFAULT '1'::character varying CHECK ((status)::text = ANY (ARRAY[('0'::character varying)::text, ('1'::character varying)::text])),
    "description" text NOT NULL,
    "images" json,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS failed_jobs_id_seq;

-- Table Definition
CREATE TABLE "public"."failed_jobs" (
    "id" int8 NOT NULL DEFAULT nextval('failed_jobs_id_seq'::regclass),
    "uuid" varchar(255) NOT NULL,
    "connection" text NOT NULL,
    "queue" text NOT NULL,
    "payload" text NOT NULL,
    "exception" text NOT NULL,
    "failed_at" timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS faqs_id_seq;

-- Table Definition
CREATE TABLE "public"."faqs" (
    "id" int8 NOT NULL DEFAULT nextval('faqs_id_seq'::regclass),
    "question" varchar(255) NOT NULL,
    "answer" text NOT NULL,
    "status" int4 NOT NULL DEFAULT 0,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS field_conditions_id_seq;

-- Table Definition
CREATE TABLE "public"."field_conditions" (
    "id" int8 NOT NULL DEFAULT nextval('field_conditions_id_seq'::regclass),
    "category_id" int8 NOT NULL,
    "attribute_id" int8,
    "operator" varchar(255) NOT NULL,
    "value" varchar(255) NOT NULL,
    "field_id" varchar(255) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "target_field_id" int8,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS home_logos_id_seq;

-- Table Definition
CREATE TABLE "public"."home_logos" (
    "id" int8 NOT NULL DEFAULT nextval('home_logos_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "status" bool NOT NULL DEFAULT true,
    "image" varchar(255) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS home_page_settings_id_seq;

-- Table Definition
CREATE TABLE "public"."home_page_settings" (
    "id" int8 NOT NULL DEFAULT nextval('home_page_settings_id_seq'::regclass),
    "key" varchar(255) NOT NULL,
    "value" text,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS insights_id_seq;

-- Table Definition
CREATE TABLE "public"."insights" (
    "id" int8 NOT NULL DEFAULT nextval('insights_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "title" varchar(255),
    "content" text NOT NULL,
    "image" varchar(255),
    "status" bool NOT NULL DEFAULT true,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."job_batches" (
    "id" varchar(255) NOT NULL,
    "name" varchar(255) NOT NULL,
    "total_jobs" int4 NOT NULL,
    "pending_jobs" int4 NOT NULL,
    "failed_jobs" int4 NOT NULL,
    "failed_job_ids" text NOT NULL,
    "options" text,
    "cancelled_at" int4,
    "created_at" int4 NOT NULL,
    "finished_at" int4,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS jobs_id_seq;

-- Table Definition
CREATE TABLE "public"."jobs" (
    "id" int8 NOT NULL DEFAULT nextval('jobs_id_seq'::regclass),
    "queue" varchar(255) NOT NULL,
    "payload" text NOT NULL,
    "attempts" int2 NOT NULL,
    "reserved_at" int4,
    "available_at" int4 NOT NULL,
    "created_at" int4 NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS languages_id_seq;

-- Table Definition
CREATE TABLE "public"."languages" (
    "id" int8 NOT NULL DEFAULT nextval('languages_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "code" varchar(255) NOT NULL,
    "status" int4 NOT NULL DEFAULT 0,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "translation_price" numeric(8,2),
    PRIMARY KEY ("id")
);

-- Column Comment
COMMENT ON COLUMN "public"."languages"."name" IS 'Language name';
COMMENT ON COLUMN "public"."languages"."code" IS 'Language code, e.g., en, fr';
COMMENT ON COLUMN "public"."languages"."status" IS '0: Inactive, 1: Active';
COMMENT ON COLUMN "public"."languages"."translation_price" IS 'Price per word for translation';

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS migrations_id_seq;

-- Table Definition
CREATE TABLE "public"."migrations" (
    "id" int4 NOT NULL DEFAULT nextval('migrations_id_seq'::regclass),
    "migration" varchar(255) NOT NULL,
    "batch" int4 NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."model_has_permissions" (
    "permission_id" int8 NOT NULL,
    "model_type" varchar(255) NOT NULL,
    "model_id" int8 NOT NULL,
    PRIMARY KEY ("permission_id","model_id","model_type")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."model_has_roles" (
    "role_id" int8 NOT NULL,
    "model_type" varchar(255) NOT NULL,
    "model_id" int8 NOT NULL,
    PRIMARY KEY ("role_id","model_id","model_type")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS packages_id_seq;

-- Table Definition
CREATE TABLE "public"."packages" (
    "id" int8 NOT NULL DEFAULT nextval('packages_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "price" float8 NOT NULL,
    "status" int2 NOT NULL DEFAULT '0'::smallint,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "deleted_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- Column Comment
COMMENT ON COLUMN "public"."packages"."status" IS '0 - Inactive, 1 - Active';

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS packages_addons_id_seq;

-- Table Definition
CREATE TABLE "public"."packages_addons" (
    "id" int8 NOT NULL DEFAULT nextval('packages_addons_id_seq'::regclass),
    "package_id" int8 NOT NULL,
    "title" varchar(255) NOT NULL,
    "deleted_at" timestamp(0),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."password_reset_tokens" (
    "email" varchar(255) NOT NULL,
    "token" varchar(255) NOT NULL,
    "created_at" timestamp(0),
    PRIMARY KEY ("email")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS permissions_id_seq;

-- Table Definition
CREATE TABLE "public"."permissions" (
    "id" int8 NOT NULL DEFAULT nextval('permissions_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "guard_name" varchar(255) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS plan_durations_id_seq;

-- Table Definition
CREATE TABLE "public"."plan_durations" (
    "id" int8 NOT NULL DEFAULT nextval('plan_durations_id_seq'::regclass),
    "pricing_plan_id" int8 NOT NULL,
    "duration" varchar(255) NOT NULL,
    "price" varchar(255) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS pricing_plans_id_seq;

-- Table Definition
CREATE TABLE "public"."pricing_plans" (
    "id" int8 NOT NULL DEFAULT nextval('pricing_plans_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "duration" varchar(255) NOT NULL,
    "price" varchar(255) NOT NULL,
    "currency" varchar(255) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS quotes_id_seq;

-- Table Definition
CREATE TABLE "public"."quotes" (
    "id" int8 NOT NULL DEFAULT nextval('quotes_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "email" varchar(255) NOT NULL,
    "from_lang" varchar(255) NOT NULL,
    "to_lang" text NOT NULL,
    "total_pages" int4 NOT NULL,
    "word_count" int4 NOT NULL,
    "service_id" int8 NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS reviews_id_seq;

-- Table Definition
CREATE TABLE "public"."reviews" (
    "id" int8 NOT NULL DEFAULT nextval('reviews_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "status" bool NOT NULL DEFAULT true,
    "review" text NOT NULL,
    "image" varchar(255),
    "designation" varchar(255),
    "rating" numeric(2,1) NOT NULL DEFAULT '0'::numeric,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."role_has_permissions" (
    "permission_id" int8 NOT NULL,
    "role_id" int8 NOT NULL,
    PRIMARY KEY ("permission_id","role_id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS roles_id_seq;

-- Table Definition
CREATE TABLE "public"."roles" (
    "id" int8 NOT NULL DEFAULT nextval('roles_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "guard_name" varchar(255) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS service_atributes_id_seq;

-- Table Definition
CREATE TABLE "public"."service_atributes" (
    "id" int8 NOT NULL DEFAULT nextval('service_atributes_id_seq'::regclass),
    "service_id" int4 NOT NULL,
    "name" varchar(255) NOT NULL,
    "status" int4 NOT NULL DEFAULT 0,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "deleted_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS service_atributes_value_id_seq;

-- Table Definition
CREATE TABLE "public"."service_atributes_value" (
    "id" int8 NOT NULL DEFAULT nextval('service_atributes_value_id_seq'::regclass),
    "service_id" int4 NOT NULL,
    "attribute_id" int4 NOT NULL,
    "name" varchar(255) NOT NULL,
    "status" int4 NOT NULL DEFAULT 0,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "deleted_at" timestamp(0),
    "price" numeric(10,2) NOT NULL DEFAULT '0'::numeric,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS service_booking_fields_id_seq;

-- Table Definition
CREATE TABLE "public"."service_booking_fields" (
    "id" int8 NOT NULL DEFAULT nextval('service_booking_fields_id_seq'::regclass),
    "service_id" int8 NOT NULL,
    "type" varchar(255) NOT NULL,
    "label" varchar(255) NOT NULL,
    "name" varchar(255) NOT NULL,
    "options" text,
    "attribute_id" int8,
    "file_types" varchar(255),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "field_id" int8,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS service_details_id_seq;

-- Table Definition
CREATE TABLE "public"."service_details" (
    "id" int8 NOT NULL DEFAULT nextval('service_details_id_seq'::regclass),
    "service_id" int8 NOT NULL,
    "title" varchar(255) NOT NULL,
    "content" text NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS service_faqs_id_seq;

-- Table Definition
CREATE TABLE "public"."service_faqs" (
    "id" int8 NOT NULL DEFAULT nextval('service_faqs_id_seq'::regclass),
    "service_id" int8 NOT NULL,
    "question" varchar(255) NOT NULL,
    "answer" text NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS service_pricing_id_seq;

-- Table Definition
CREATE TABLE "public"."service_pricing" (
    "id" int8 NOT NULL DEFAULT nextval('service_pricing_id_seq'::regclass),
    "service_id" int8 NOT NULL,
    "translation_from" int8,
    "translation_to" int8,
    "price" numeric(10,2),
    "status" varchar(255) NOT NULL DEFAULT '1'::character varying CHECK ((status)::text = ANY (ARRAY[('0'::character varying)::text, ('1'::character varying)::text])),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS services_id_seq;

-- Table Definition
CREATE TABLE "public"."services" (
    "id" int8 NOT NULL DEFAULT nextval('services_id_seq'::regclass),
    "title" varchar(255) NOT NULL,
    "service_type_id" int4 NOT NULL,
    "subtitle" varchar(255),
    "description" text,
    "status" varchar(255) NOT NULL DEFAULT '1'::character varying CHECK ((status)::text = ANY (ARRAY[('0'::character varying)::text, ('1'::character varying)::text])),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "background_image" varchar(255),
    "service_image" varchar(255),
    "other_image" varchar(255),
    "price_from" float4,
    "price_to" float4,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS services_bookings_id_seq;

-- Table Definition
CREATE TABLE "public"."services_bookings" (
    "id" int8 NOT NULL DEFAULT nextval('services_bookings_id_seq'::regclass),
    "service_id" int8 NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "booking_id" varchar(255),
    "first_name" varchar(255),
    "last_name" varchar(255),
    "company_name" varchar(255),
    "country" varchar(255),
    "street_address" varchar(255),
    "apartment" varchar(255),
    "city" varchar(255),
    "state" varchar(255),
    "phone" varchar(255),
    "email" varchar(255),
    "file_namesconfirm" varchar(255),
    "order_notes" text,
    "total" numeric(10,2) NOT NULL DEFAULT '0'::numeric,
    "status" varchar(255) NOT NULL DEFAULT 'Pending'::character varying CHECK ((status)::text = ANY (ARRAY[('Pending'::character varying)::text, ('Under Process'::character varying)::text, ('Completed'::character varying)::text, ('Ready for Delivery'::character varying)::text])),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS services_types_id_seq;

-- Table Definition
CREATE TABLE "public"."services_types" (
    "id" int8 NOT NULL DEFAULT nextval('services_types_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "status" varchar(255) NOT NULL DEFAULT '1'::character varying CHECK ((status)::text = ANY (ARRAY[('0'::character varying)::text, ('1'::character varying)::text])),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- Column Comment
COMMENT ON COLUMN "public"."services_types"."name" IS 'Service type name';
COMMENT ON COLUMN "public"."services_types"."status" IS 'Status of the service type';

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."sessions" (
    "id" varchar(255) NOT NULL,
    "user_id" int8,
    "ip_address" varchar(45),
    "user_agent" text,
    "payload" text NOT NULL,
    "last_activity" int4 NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS site_settings_id_seq;

-- Table Definition
CREATE TABLE "public"."site_settings" (
    "id" int8 NOT NULL DEFAULT nextval('site_settings_id_seq'::regclass),
    "key" varchar(255) NOT NULL,
    "value" text,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS slider_buttons_id_seq;

-- Table Definition
CREATE TABLE "public"."slider_buttons" (
    "id" int8 NOT NULL DEFAULT nextval('slider_buttons_id_seq'::regclass),
    "slider_id" int8 NOT NULL,
    "text" varchar(255) NOT NULL,
    "link" varchar(255) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS sliders_id_seq;

-- Table Definition
CREATE TABLE "public"."sliders" (
    "id" int8 NOT NULL DEFAULT nextval('sliders_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "image" varchar(255) NOT NULL,
    "content" text NOT NULL,
    "status" bool NOT NULL DEFAULT true,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS target_types_id_seq;

-- Table Definition
CREATE TABLE "public"."target_types" (
    "id" int8 NOT NULL DEFAULT nextval('target_types_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "status" int4 NOT NULL DEFAULT 0,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS target_types_company_id_seq;

-- Table Definition
CREATE TABLE "public"."target_types_company" (
    "id" int8 NOT NULL DEFAULT nextval('target_types_company_id_seq'::regclass),
    "company_id" int8 NOT NULL,
    "name" varchar(255) NOT NULL,
    "status" int4 NOT NULL DEFAULT 0,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS translation_types_id_seq;

-- Table Definition
CREATE TABLE "public"."translation_types" (
    "id" int8 NOT NULL DEFAULT nextval('translation_types_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "description" text,
    "price_type" varchar(255) NOT NULL DEFAULT 'free'::character varying CHECK ((price_type)::text = ANY (ARRAY[('free'::character varying)::text, ('rush_fee'::character varying)::text, ('fixed'::character varying)::text])),
    "price" numeric(10,2) DEFAULT '0'::numeric,
    "percentage" numeric(5,2) DEFAULT '0'::numeric,
    "category" varchar(255),
    "status" varchar(255) NOT NULL DEFAULT '1'::character varying CHECK ((status)::text = ANY (ARRAY[('0'::character varying)::text, ('1'::character varying)::text])),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- Column Comment
COMMENT ON COLUMN "public"."translation_types"."name" IS 'Translation Type Name';
COMMENT ON COLUMN "public"."translation_types"."description" IS 'Description of the Translation Type';
COMMENT ON COLUMN "public"."translation_types"."price_type" IS 'Price Type';
COMMENT ON COLUMN "public"."translation_types"."price" IS 'Price for the translation type';
COMMENT ON COLUMN "public"."translation_types"."percentage" IS 'Percentage for Rush Fee';
COMMENT ON COLUMN "public"."translation_types"."category" IS 'Category for the translation type';
COMMENT ON COLUMN "public"."translation_types"."status" IS 'Status of the translation type';

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS translation_types_categories_id_seq;

-- Table Definition
CREATE TABLE "public"."translation_types_categories" (
    "id" int8 NOT NULL DEFAULT nextval('translation_types_categories_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "slug" varchar(255) NOT NULL,
    "status" varchar(255) NOT NULL DEFAULT '1'::character varying CHECK ((status)::text = ANY (ARRAY[('0'::character varying)::text, ('1'::character varying)::text])),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "description" text,
    "price_type" varchar(255) NOT NULL DEFAULT 'free'::character varying CHECK ((price_type)::text = ANY (ARRAY[('free'::character varying)::text, ('rush_fee'::character varying)::text, ('fixed'::character varying)::text])),
    "price" numeric(10,2) DEFAULT '0'::numeric,
    "percentage" numeric(5,2) DEFAULT '0'::numeric,
    PRIMARY KEY ("id")
);

-- Column Comment
COMMENT ON COLUMN "public"."translation_types_categories"."description" IS 'Description of the Translation Type';
COMMENT ON COLUMN "public"."translation_types_categories"."price_type" IS 'Price Type';
COMMENT ON COLUMN "public"."translation_types_categories"."price" IS 'Price for the translation type';
COMMENT ON COLUMN "public"."translation_types_categories"."percentage" IS 'Percentage for Rush Fee';

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_id_seq;

-- Table Definition
CREATE TABLE "public"."users" (
    "id" int8 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "email" varchar(255) NOT NULL,
    "email_verified_at" timestamp(0),
    "password" varchar(255) NOT NULL,
    "remember_token" varchar(100),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "first_name" varchar(255),
    "last_name" varchar(255),
    "dial_code" varchar(255),
    "phone" varchar(255),
    "country_id" int4,
    "emirates_id" int4,
    "city_id" int4,
    "company_id" int4,
    "status" int4 DEFAULT 0,
    "deleted_at" timestamp(0),
    "role_id" int8,
    "gender" varchar(255),
    "country" varchar(255),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS why_choose_us_id_seq;

-- Table Definition
CREATE TABLE "public"."why_choose_us" (
    "id" int8 NOT NULL DEFAULT nextval('why_choose_us_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "content" text NOT NULL,
    "image" varchar(255),
    "status" bool NOT NULL DEFAULT true,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS work_process_id_seq;

-- Table Definition
CREATE TABLE "public"."work_process" (
    "id" int8 NOT NULL DEFAULT nextval('work_process_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "content" text,
    "image" varchar(255),
    "status" bool NOT NULL DEFAULT true,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

INSERT INTO "public"."ad_fields" ("id", "ad_id", "field_id", "field_label", "value", "field_label_ar", "value_ar", "created_at", "updated_at") VALUES
(1, 4, 61, 'Ads Title', 'Car for sale', 'عنوان الإعلانات', 'سيارة للبيع', NULL, NULL),
(5, 4, 62, 'Moke & Model', '13', 'الوضع والنموذج', '13', NULL, NULL),
(6, 4, 63, 'Regional Specs', '4', 'المواصفات الإقليمية', '4', NULL, NULL),
(7, 4, 64, 'Year', '5', 'سنة', '5', NULL, NULL),
(8, 4, 65, 'Kilometers', '20000', 'كيلومترات', '20000', NULL, NULL),
(9, 4, 66, 'Body Type', '7', 'نوع الجسم', '7', NULL, NULL),
(10, 4, 67, 'Is your car insured in Syria', '9', 'هل سيارتك مؤمنة في سوريا؟', '9', NULL, NULL),
(11, 4, 68, 'Price', '6000', 'سعر', '6000', NULL, NULL),
(12, 4, 69, 'Phone Number', '0511234567', 'رقم التليفون', '0511234567', NULL, NULL),
(13, 4, 70, 'images', 'uploads/images.jpeg,uploads/toyota-supra.webp', 'الصور', 'image.png', NULL, NULL);

INSERT INTO "public"."ad_plans" ("id", "pricing_plan_id", "ad_id", "name", "duration", "price", "currency", "tax", "created_at", "updated_at") VALUES
(1, 1, 4, 'Free', '30', '0', 'SYP', '0', NULL, NULL);

INSERT INTO "public"."ads" ("id", "ad_number", "user_id", "category_id", "city_id", "status", "total_amount", "created_at", "updated_at") VALUES
(4, '#AD-000001', 35, 5, 1, 'Draft', 0, '2025-03-19 17:18:40', NULL);

INSERT INTO "public"."bookings" ("id", "booking_id", "first_name", "last_name", "company_name", "country", "street_address", "apartment", "city", "state", "phone", "email", "deliver_to_different_address", "order_notes", "total_price", "price_details", "words_count", "translation_type_price", "service_id", "recipient", "zipcode", "address", "appartment", "additional_info", "full_name", "full_email", "translation_from", "translation_to", "total_pagestranslation", "word_counttranslation", "file_names", "inlineRadioOptions", "addinfotextarea", "created_at", "updated_at", "delivery_type", "status", "confirmfile_names", "translation_type", "delivery_method", "delivery_method_price", "delivery_type_price", "vat_amount") VALUES
(1, 'taslI36pNqHr1nRw', 'Mollie', 'Ramirez', 'Maynard and Townsend Inc', 'portuguese', 'Eligendi debitis nec', 'Laboris saepe sint b', 'Delectus officiis a', 'Eu dicta repellendus', '+1 (271) 497-6385', 'lozob@mailinator.com', 't', 'Harum ullamco error', 1440.00, '[{"from":"English","to":"Hindi","price":1440}]', 12, 0.00, 5, 'asdas', '2312', 'adas', 'dsaad', 'asdasdasd', 'test', 'test@gmail.com', '1', '["4"]', 12, 12, '1735331985676f109199e17.doc', 'yes', 'asdasdasd', '2024-12-27 22:08:21', '2024-12-27 22:08:21', NULL, 'Pending', NULL, NULL, NULL, 0.00, 0.00, NULL),
(2, 'tasl5qegPsdSlHCH', 'Wing', 'Whitaker', 'Webster and Livingston Co', 'spanish', 'Quia impedit conseq', 'Cupiditate nulla eni', 'Ab aliquam ad occaec', 'Quia cumque commodo', '+1 (913) 992-8828', 'vasysidyzo@mailinator.com', 'f', 'Et asperiores quia e', 1440.00, '[{"from":"English","to":"Hindi","price":1440}]', 12, 0.00, 5, 'asdas', '2312', 'adas', 'dsaad', 'asdasdasd', 'test', 'test@gmail.com', '1', '["4"]', 12, 12, '1735331985676f109199e17.doc', 'yes', 'asdasdasd', '2024-12-27 22:17:15', '2024-12-27 22:17:15', NULL, 'Pending', NULL, NULL, NULL, 0.00, 0.00, NULL),
(3, 'taslBlMRWtGsZKYb', 'Wing', 'Whitaker', 'Webster and Livingston Co', 'spanish', 'Quia impedit conseq', 'Cupiditate nulla eni', 'Ab aliquam ad occaec', 'Quia cumque commodo', '+1 (913) 992-8828', 'vasysidyzo@mailinator.com', 'f', 'Et asperiores quia e', 1440.00, '[{"from":"English","to":"Hindi","price":1440}]', 12, 0.00, 5, 'asdas', '2312', 'adas', 'dsaad', 'asdasdasd', 'test', 'test@gmail.com', '1', '["4"]', 12, 12, '1735331985676f109199e17.doc', 'yes', 'asdasdasd', '2024-12-27 22:17:58', '2024-12-30 12:01:33', NULL, 'Under Process', NULL, NULL, NULL, 0.00, 0.00, NULL),
(4, 'tasloFylx2unbomg', 'Wing', 'Whitaker', 'Webster and Livingston Co', 'spanish', 'Quia impedit conseq', 'Cupiditate nulla eni', 'Ab aliquam ad occaec', 'Quia cumque commodo', '+1 (913) 992-8828', 'vasysidyzo@mailinator.com', 'f', 'Et asperiores quia e', 1440.00, '[{"from":"English","to":"Hindi","price":1440}]', 12, 0.00, 5, 'asdas', '2312', 'adas', 'dsaad', 'asdasdasd', 'test', 'test@gmail.com', '1', '["4"]', 12, 12, '1735331985676f109199e17.doc', 'yes', 'asdasdasd', '2024-12-27 22:18:23', '2024-12-30 11:39:07', NULL, 'Ready for Delivery', NULL, NULL, NULL, 0.00, 0.00, NULL),
(5, 'tasltDqbHcpZWmdc', 'Reagan', 'Malone', 'Keith and Mendez Co', 'arabic', 'Dolor dolore neque e', 'Perspiciatis magna', 'Deserunt consequatur', 'Inventore molestias', '+1 (747) 437-9291', 'dihalemuve@mailinator.com', 'f', 'Tenetur omnis sint e', 1440.00, '[{"from":"English","to":"Hindi","price":1440}]', 12, 0.00, 5, 'asdas', '2312', 'adas', 'dsaad', 'asdasdasd', 'test', 'test@gmail.com', '1', '["4"]', 12, 12, '1735331985676f109199e17.doc', 'yes', 'asdasdasd', '2024-12-27 22:20:04', '2024-12-30 12:02:24', NULL, 'Ready for Delivery', NULL, NULL, NULL, 0.00, 0.00, NULL),
(6, '#TS590262215', 'Angela', 'Franco', 'Herman Vasquez Trading', 'UAE1', 'Dolor nobis voluptat', 'Enim quae ullamco pa', 'Nisi quidem autem to', 'Ut amet velit aut', '+1 (553) 184-1752', 'sopih@mailinator.com', 't', 'Nihil doloribus vel', 12000.00, '[{"from":"English","to":"Hindi","price":12000}]', 100, 0.00, 5, 'Sed id inventore dol', '83779', 'In sequi sit rem ven', 'Enim sunt et dolor s', 'sadasdas', 'test', 'test@gmail.com', '1', '["4"]', 12, 100, '1735373492676fb2b4bedb8.doc,1735373511676fb2c750ebd.pdf', 'yes', 'sadasdas', '2024-12-28 08:12:31', '2024-12-30 11:24:13', NULL, 'Ready for Delivery', NULL, NULL, NULL, 0.00, 0.00, NULL),
(7, '#TS887226235', 'Linda', 'Montgomery', 'Mullins and Davenport Co', 'UAE1', 'Soluta obcaecati eum', 'Dolores quae deserun', 'Magna ut ad enim nec', 'Iste eu labore lorem', '+1 (676) 936-3872', 'lesa@mailinator.com', 'f', 'Nulla ut vel quisqua', 12000.00, '[{"from":"English","to":"Hindi","price":12000}]', 100, 0.00, 5, 'Ut illum aliqua Do', '39770', 'Similique laborum et', 'Sunt incididunt accu', 'sadasda', 'test', 'test@gmail.com', '1', '["4"]', 12, 100, '1735374821676fb7e52fd21.doc', 'yes', 'sadasda', '2024-12-28 08:34:17', '2024-12-30 11:21:50', NULL, 'Under Process', NULL, NULL, NULL, 0.00, 0.00, NULL),
(8, '#TS765295191', 'Phoebe', 'Stewart', 'Clark Byers Traders', 'Cole Moon', 'Quibusdam accusantiu', 'Saepe omnis sapiente', 'Ex neque quia ration', 'Atque modi veniam f', '+1 (596) 621-6162', 'gose@mailinator.com', 't', 'Eligendi dolore odit', 132000.00, '[{"from":"English","to":"Hindi","price":120000},{"from":"English","to":"Arabic1","price":12000}]', 1000, 0.00, 5, 'Vitae non dicta aspe', '79313', 'Officiis alias qui f', 'Doloremque earum vol', 'asdadasdas', 'test', 'test@gmail.com', '1', '["4","5"]', 10, 1000, '1735376658676fbf12da90a.pdf,1735376663676fbf17c0ea2.doc', 'yes', 'asdadasdas', '2024-12-28 09:05:18', '2024-12-28 15:37:26', NULL, 'Under Process', NULL, NULL, NULL, 0.00, 0.00, NULL),
(9, '#TS252816621', 'Herman', 'Nash', 'Aguirre and Dixon Plc', 'Maskat', 'Tempora sed quia sin', 'Irure beatae aut dol', 'Ut dolor neque amet', 'Eos irure facilis e', '+1 (845) 326-6792', 'mawi@mailinator.com', 'f', 'Beatae nesciunt rep', 14400.00, '[{"from":"English","to":"Hindi","price":14400}]', 120, 0.00, 5, 'Mollit occaecat quo', '98420', 'Nobis vitae vel quis', 'Et et vel dolorum nu', 'sadasdas', 'test', 'test@gmail.com', '1', '["4"]', 12, 120, '173555264067726e808a2d4.pdf', 'yes', 'sadasdas', '2024-12-30 09:57:44', '2024-12-30 10:52:54', NULL, 'Ready for Delivery', NULL, NULL, NULL, 0.00, 0.00, NULL),
(10, '#TS791786095', 'Ivory', 'Patton', 'Obrien and Leon Co', 'Maskat', 'In quis ut ut ducimu', 'Nisi et id voluptate', 'Reprehenderit porro', 'Officia minus beatae', '+1 (675) 887-7292', 'metugid@mailinator.com', 'f', 'Ut quaerat voluptas', 12000.00, '[{"from":"English","to":"Hindi","price":12000}]', 100, 0.00, 5, 'Ducimus quo itaque', '15498', 'Maxime labore debiti', 'Dolorem aut excepteu', 'asdasdad', 'Uriel Willis', 'joqeja@mailinator.com', '1', '["4"]', 12, 100, '17356357786773b342831a0.pdf', 'yes', 'asdasdad', '2024-12-31 09:11:46', '2024-12-31 09:11:46', NULL, 'Pending', NULL, NULL, NULL, 0.00, 0.00, NULL),
(11, '#TS104832976', 'Yael', 'Hoover', 'Hyde and Townsend Plc', 'Canada', 'Dolor laboriosam au', 'Pariatur Totam id v', 'Necessitatibus debit', 'Culpa iste quibusda', '+1 (832) 836-6017', 'kenameh@mailinator.com', 'f', 'Ipsa incididunt nos', 12000.00, '[{"from":"English","to":"Hindi","price":12000}]', 100, 0.00, 5, 'Tempore esse ipsa', '80239', 'Tempor sint possimu', 'Sit voluptatum culp', 'sdasd', 'Wylie Kline', 'cijytif@mailinator.com', '1', '["4"]', 10, 100, '17356367136773b6e9cf8da.pdf', 'yes', 'sdasd', '2024-12-31 09:19:06', '2024-12-31 09:19:06', NULL, 'Pending', NULL, NULL, NULL, 0.00, 0.00, NULL),
(12, '#TS210980678', 'Driscoll', 'Collier', 'Collier and Velasquez Inc', 'UAE1', 'Quo quia veniam per', 'Labore et quas nulla', 'Incidunt hic suscip', 'Modi ipsum perferend', '+1 (467) 972-1346', 'firu@mailinator.com', 't', 'Commodi a exercitati', 14412.00, '[{"from":"English","to":"Hindi","price":14400}]', 120, 0.00, 5, 'asdad', '2323', 'adads', 'asdas', 'sdadads', 'Orlando Wade', 'nepejo@mailinator.com', '1', '["4"]', 12, 120, '17356680256774313910bf7.pdf', 'yes', 'sdadads', '2024-12-31 18:08:57', '2024-12-31 18:08:57', 'DIGITAL & PHYSICAL COPY', 'Pending', NULL, NULL, NULL, 0.00, 0.00, NULL),
(13, '#TS715256215', 'Ronan', 'Mcmahon', 'Gomez Boyer Inc', 'Maskat', 'Autem consequatur r', 'Tenetur quia tempor', 'Eum quas quaerat qui', 'Expedita suscipit cu', '+1 (828) 647-8394', 'jypokoceky@mailinator.com', 'f', 'Aliquid et sunt et o', 14412.00, '[{"from":"English","to":"Hindi","price":14400}]', 120, 0.00, 5, 'asdad', '2323', 'adads', 'asdas', 'sdadads', 'Orlando Wade', 'nepejo@mailinator.com', '1', '["4"]', 12, 120, '17356680256774313910bf7.pdf', 'yes', 'sdadads', '2024-12-31 18:09:03', '2024-12-31 18:09:03', 'DIGITAL & PHYSICAL COPY', 'Pending', NULL, NULL, NULL, 0.00, 0.00, NULL),
(14, '#TS576096700', 'Alea', 'Johnston', 'Rios Duke Plc', 'Canada', 'Totam voluptas dolor', 'Voluptatum sint quis', 'Et odio animi velit', 'In reprehenderit ess', '+1 (833) 268-8845', 'jopekap@mailinator.com', 'f', 'Qui nobis consequat', 14400.00, '[{"from":"English","to":"Hindi","price":14400}]', 120, 0.00, 5, 'Nesciunt nobis repr', '53949', 'Omnis minus vitae ma', 'Exercitation ex aliq', 'asdadas', 'Kiara Best', 'favokumigi@mailinator.com', '1', '["4"]', 12, 120, '173567040467743a8417a32.pdf', 'yes', 'asdadas', '2024-12-31 18:42:51', '2024-12-31 18:42:51', 'Karly Pennington', 'Pending', NULL, 'CERTIFIED', 'STANDARD', 0.00, 0.00, NULL),
(15, '#TS942903861', 'Otto', 'Frederick', 'Serrano and Wiggins Co', 'UAE1', 'Dolorum beatae incid', 'Sint fugit autem cu', 'Aut velit assumenda', 'Asperiores nulla qui', '+1 (869) 895-3478', 'qofemov@mailinator.com', 'f', 'Possimus ut dolore', 1440.00, '[{"from":"English","to":"Arabic1","price":1440}]', 120, 0.00, 5, 'Qui fugiat tenetur', '12939', 'Eos eaque aut tempor', 'Magnam consequatur d', 'sdasdas', 'Jameson Coffey', 'mibip@mailinator.com', '1', '["5"]', 12, 120, '173574229667755358bc49a.pdf', 'yes', 'sdasdas', '2025-01-01 14:38:45', '2025-01-01 14:38:45', 'Ciara Hull', 'Pending', '17357423216775537113fe6.pdf', 'CERTIFIED', 'STANDARD', 0.00, 0.00, NULL),
(16, '#TS914462411', 'Brody', 'Simpson', 'Pitts and Roy Associates', 'Canada', 'In rerum non duis re', 'Tempore qui dolorib', 'Tempore incidunt a', 'Ex nisi dolore elige', '+1 (944) 577-2294', 'jywik@mailinator.com', 'f', 'Consectetur ratione', 2412.00, '[{"from":"English","to":"Arabic1","price":2400}]', 200, 0.00, 5, 'Quis deleniti minima', '99099', 'Deserunt voluptas si', 'Sed voluptas accusam', 'asdasdasd', 'Cain Jacobs', 'bugu@mailinator.com', '1', '["5"]', 12, 200, '17357435336775582d4eb5e.pdf', 'yes', 'asdasdasd', '2025-01-01 15:00:13', '2025-01-01 15:00:13', 'DIGITAL & PHYSICAL COPY', 'Pending', '17357436106775587a0cc24.pdf', 'CERTIFIED', 'EXPEDITED', 0.00, 0.00, NULL),
(17, '#TS595444421', 'Keith', 'Sexton', 'Pearson Skinner Plc', 'Canada', 'Qui ut aperiam tempo', 'Praesentium eum vita', 'Do culpa totam liber', 'Autem atque nostrum', '+1 (918) 282-5262', 'xofemahuv@mailinator.com', 'f', 'Laborum Est delenit', 59.01, '[{"from":"English","to":"Arabic1","price":24}]', 2, 25.00, 5, 'Nostrud maxime liber', '55860', 'In ut aut sed fugiat', 'Enim id explicabo F', 'asdasd', 'Joshua Dyer', 'vuxis@mailinator.com', '1', '["5"]', 12, 2, '17357622996775a17bc0990.pdf', 'yes', 'asdasd', '2025-01-01 20:12:03', '2025-01-01 20:12:03', 'DIGITAL DELIVERY', 'Pending', NULL, 'NOTARIZED', 'EXPEDITED', 0.00, 0.00, NULL),
(18, '#TS639969622', 'Herman', 'Hunter', 'Simmons and Morales LLC', 'Canada', 'Culpa sunt voluptas', 'Est et et dolore ea', 'Eligendi magnam repr', 'Sed tempora amet ex', '+1 (998) 524-8918', 'buzisicoqi@mailinator.com', 'f', 'Nihil placeat nisi', 12.60, '[{"from":"English","to":"Arabic1","price":12}]', 1, 0.00, 5, 'Dolorem incididunt e', '43033', 'Pariatur Animi acc', 'Officia itaque commo', 'asdas', 'Alfreda David', 'kiki@mailinator.com', '1', '["5"]', 1, 1, '17357636816775a6e19de0e.pdf', 'yes', 'asdas', '2025-01-01 20:41:16', '2025-02-11 13:25:10', 'DIGITAL DELIVERY', 'Under Process', '17357637096775a6fd985ea.pdf', 'ONLY TRANSLATION', 'STANDARD', 0.00, 0.00, 0.60);

INSERT INTO "public"."categories" ("id", "name", "name_ar", "description", "description_ar", "status", "parent_id", "created_at", "updated_at") VALUES
(4, 'Motors', 'محركات', 'This is main category for motors.', 'هذا هو الخيار الفئة الرئيسية للمحركات', '1', NULL, '2025-03-18 05:28:40', '2025-03-18 05:30:57'),
(5, 'Cars', 'سيارات', 'This is category of cars.', 'هذه هي فئة السيارات.', '1', 4, '2025-03-18 05:38:01', '2025-03-18 05:38:01');

INSERT INTO "public"."category_atributes" ("id", "category_id", "name", "name_ar", "status", "created_at", "updated_at", "deleted_at") VALUES
(1, 5, 'Make & Model', 'يصنع', 1, '2025-03-18 05:44:13', '2025-03-18 11:17:07', NULL),
(2, 5, 'Regional Specs', 'المواصفات الإقليمية', 1, '2025-03-18 11:24:06', '2025-03-18 11:24:06', NULL),
(3, 5, 'Year', 'سنة', 1, '2025-03-18 11:24:45', '2025-03-18 11:24:45', NULL),
(4, 5, 'Body Type', 'نوع الجسم', 1, '2025-03-18 11:25:27', '2025-03-18 11:25:27', NULL),
(5, 5, 'Insurance', 'تأمين', 1, '2025-03-18 11:26:47', '2025-03-18 11:26:47', NULL),
(6, 5, 'Fuel Type', 'نوع الوقود', 1, '2025-03-18 11:28:06', '2025-03-18 11:28:06', NULL);

INSERT INTO "public"."category_atributes_value" ("id", "category_id", "attribute_id", "name", "name_ar", "status", "created_at", "updated_at", "deleted_at") VALUES
(1, 5, 1, 'Honda Civic X Turbo RS 1.5', 'هوندا سيفيك X توربو RS 1.5', 1, '2025-03-18 05:51:53', '2025-03-18 11:19:53', NULL),
(2, 5, 1, 'Toyota Corolla Altis 1.8 Grande', 'تويوتا كورولا ألتيس 1.8 غراندي', 1, '2025-03-18 11:18:57', '2025-03-18 11:18:57', NULL),
(3, 5, 2, 'GCC Specs', 'GCC Specs', 1, '2025-03-18 11:28:56', '2025-03-18 11:28:56', NULL),
(4, 5, 2, 'Tropical Specs', 'المواصفات الاستوائية', 1, '2025-03-18 11:29:32', '2025-03-18 11:29:32', NULL),
(5, 5, 3, '2025', '2025', 1, '2025-03-18 11:30:13', '2025-03-18 11:30:13', NULL),
(6, 5, 3, '2024', '2024', 1, '2025-03-18 11:30:36', '2025-03-18 11:30:36', NULL),
(7, 5, 4, 'Sedan', 'سيدان', 1, '2025-03-18 11:31:10', '2025-03-18 11:31:10', NULL),
(8, 5, 4, 'SUV', 'سيارات الدفع الرباعي', 1, '2025-03-18 11:31:37', '2025-03-18 11:31:37', NULL),
(9, 5, 5, 'Yes', 'نعم', 1, '2025-03-18 11:32:28', '2025-03-18 11:32:28', NULL),
(10, 5, 5, 'No', 'لا', 1, '2025-03-18 11:32:59', '2025-03-18 11:32:59', NULL),
(11, 5, 6, 'Petrol', 'بنزين', 1, '2025-03-18 11:34:39', '2025-03-18 11:34:39', NULL),
(12, 5, 6, 'Diesel', 'ديزل', 1, '2025-03-18 11:35:21', '2025-03-18 11:35:21', NULL),
(13, 5, 1, 'Toyota Supra', 'تويوتا سوبرا', 1, '2025-03-19 15:06:31', '2025-03-19 15:06:31', NULL);

INSERT INTO "public"."category_fields" ("id", "category_id", "type", "label", "name", "label_ar", "name_ar", "options", "attribute_id", "file_types", "created_at", "updated_at", "order", "field_id") VALUES
(61, 5, 'text', 'Ads Title', 'Ads Title', 'عنوان الإعلانات', 'عنوان الإعلانات', NULL, NULL, NULL, '2025-03-19 14:57:57', '2025-03-19 14:57:57', 0, 0),
(62, 5, 'select', 'Moke & Model', 'Moke & Model', 'الوضع والنموذج', 'الوضع والنموذج', NULL, 1, NULL, '2025-03-19 14:57:57', '2025-03-19 14:57:57', 1, 1),
(63, 5, 'select', 'Regional Specs', 'Regional Specs', 'المواصفات الإقليمية', 'المواصفات الإقليمية', NULL, 2, NULL, '2025-03-19 14:57:57', '2025-03-19 14:57:57', 2, 2),
(64, 5, 'select', 'Year', 'Year', 'سنة', 'سنة', NULL, 3, NULL, '2025-03-19 14:57:57', '2025-03-19 14:57:57', 3, 3),
(65, 5, 'text', 'Kilometers', 'Kilometers', 'كيلومترات', 'كيلومترات', NULL, NULL, NULL, '2025-03-19 14:57:57', '2025-03-19 14:57:57', 4, 4),
(66, 5, 'select', 'Body Type', 'Body Type', 'نوع الجسم', 'نوع الجسم', NULL, 4, NULL, '2025-03-19 14:57:57', '2025-03-19 14:57:57', 5, 5),
(67, 5, 'select', 'Is your car insured in Syria', 'Is your car insured in Syria', 'هل سيارتك مؤمنة في سوريا؟', 'هل سيارتك مؤمنة في سوريا؟', NULL, 5, NULL, '2025-03-19 14:57:57', '2025-03-19 14:57:57', 6, 6),
(68, 5, 'text', 'Price', 'Price', 'سعر', 'سعر', NULL, NULL, NULL, '2025-03-19 14:57:57', '2025-03-19 14:57:57', 7, 7),
(69, 5, 'text', 'Phone Number', 'Phone Number', 'رقم التليفون', 'رقم التليفون', NULL, NULL, NULL, '2025-03-19 14:57:57', '2025-03-19 14:57:57', 8, 8),
(70, 5, 'file', 'images', 'images', 'الصور', 'الصور', NULL, NULL, '.jpg,.png', '2025-03-19 14:57:57', '2025-03-19 14:57:57', 9, 9);

INSERT INTO "public"."challenges" ("id", "user_id", "name", "challenge_type", "target_type", "target_value", "start_date", "end_date", "status", "created_at", "updated_at", "deleted_at") VALUES
(13, 1, 'Melyssa Cooke', 1, 2, 34, '2024-12-20', '2024-12-26', 1, '2024-12-05 21:32:47', '2024-12-16 15:53:25', '2024-12-16 15:53:25'),
(14, 1, 'Noah Wise111', 2, 4, 45, '2024-12-26', '2024-12-27', 1, '2024-12-05 21:33:05', '2024-12-18 08:04:47', NULL),
(15, 1, 'Testing', 2, 1, 12, '2024-12-17', '2025-02-01', 1, '2024-12-05 21:43:13', '2024-12-15 22:48:49', NULL),
(17, 1, 'Macon Bradford', 2, 3, 2342, '2024-12-16', '2024-12-24', 1, '2024-12-16 00:15:33', '2024-12-16 15:47:51', '2024-12-16 15:47:51'),
(18, 1, 'Abigail Snider', 2, 3, 56, '2024-12-20', '2024-12-21', 1, '2024-12-16 15:53:48', '2024-12-16 15:54:26', '2024-12-16 15:54:26'),
(19, 1, 'Test', 2, 4, 12, '2024-12-27', '2024-12-31', 1, '2024-12-16 15:56:52', '2024-12-16 15:57:31', '2024-12-16 15:57:31'),
(20, 1, 'Test12', 2, 4, 1, '2024-12-21', '2024-12-26', 0, '2024-12-18 08:05:16', '2024-12-19 21:49:14', NULL);

INSERT INTO "public"."challenges_companies" ("id", "challenge_id", "company_id", "created_at", "updated_at", "deleted_at") VALUES
(16, 15, 23, '2024-12-15 22:48:49', '2024-12-15 22:48:49', NULL),
(17, 17, 10, '2024-12-16 00:15:33', '2024-12-16 14:22:13', '2024-12-16 14:22:13'),
(18, 17, 23, '2024-12-16 14:22:13', '2024-12-16 15:47:51', '2024-12-16 15:47:51'),
(19, 14, 23, '2024-12-16 14:22:54', '2024-12-16 14:22:54', NULL),
(20, 18, 23, '2024-12-16 15:54:05', '2024-12-16 15:54:26', '2024-12-16 15:54:26'),
(21, 19, 23, '2024-12-16 15:56:52', '2024-12-16 15:57:31', '2024-12-16 15:57:31'),
(22, 20, 23, '2024-12-18 08:05:16', '2024-12-18 08:05:16', NULL),
(23, 20, 32, '2024-12-19 18:03:51', '2024-12-19 18:03:51', NULL);

INSERT INTO "public"."cities" ("id", "name", "name_ar", "status", "created_at", "updated_at", "deleted_at") VALUES
(1, 'Abu Dubai', 'ابو دبي', 1, '2025-03-19 11:01:35', '2025-03-19 11:01:35', NULL);

INSERT INTO "public"."cms_pages" ("id", "title", "content", "status", "created_at", "updated_at", "banner_image", "sub_title_1", "sub_title_2", "flag_logo", "flag_title_1", "flag_title_2", "about_image", "about_video", "slogan", "our_business_title", "our_business_sub_title", "our_business_left_image", "our_business_right_image", "our_mission_title", "our_mission_logo", "our_mission_description", "our_vission_title", "our_vission_logo", "our_vission_description", "our_core_value_title", "our_core_value_logo", "our_core_value_description", "our_core_li_1", "our_core_li_2", "our_core_li_3", "our_core_li_4", "our_core_li_5", "evalution_title", "evalution_sub_title", "team_title", "team_sub_title", "team_description", "about_video_image") VALUES
(1, 'About us', '<p>asdasda123asdasd</p>', 'Published', '2024-12-10 18:35:10', '2024-12-17 20:15:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Terms and conditions', '<p>test</p>', 'Scheduled', '2024-12-10 18:43:49', '2024-12-17 20:15:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Privacy policy', '<p>testasdas</p>', 'Scheduled', '2024-12-10 18:43:54', '2024-12-17 20:15:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO "public"."companies" ("id", "name", "name_ar", "brand_logo", "description", "description_ar", "address", "trade_license", "trade_license_expiry", "user_id", "created_at", "updated_at", "deleted_at") VALUES
(13, 'Morton Ratliff LLC', 'Mcguire and Sandoval Associates', '1734645382676496867ec33.png', 'Quas odit proident', 'Similique illum qui', 'Qui pariatur Qui na', '1734645383676496873534e.pdf', '2024-12-26', 35, '2024-12-19 21:56:23', '2024-12-19 21:56:23', NULL);

INSERT INTO "public"."contact_us" ("id", "name", "email", "subject", "message", "created_at", "updated_at") VALUES
(1, 'Alexandra Baker', 'mativyli@mailinator.com', 'Sit do in sint ratio', 'Magni doloribus non', '2024-12-28 15:03:43', '2024-12-28 15:03:43');

INSERT INTO "public"."delivery_types" ("id", "translation_type_id", "name", "description", "price_type", "price", "status", "created_at", "updated_at") VALUES
(1, 9, 'Standard', 'Standard', 'free', 0.00, '1', '2024-12-30 15:01:54', '2024-12-30 15:08:33'),
(2, 8, 'DIGITAL DELIVERY', 'Arrives to your email immediately when completed.', 'free', 0.00, '1', '2024-12-31 09:44:51', '2024-12-31 14:48:17'),
(3, 7, 'Ciara Hull', 'Iure ipsam minima qu', 'free', 0.00, '1', '2024-12-31 09:45:06', '2024-12-31 09:45:26'),
(4, 7, 'Karly Pennington', 'Minus quis sunt dol', 'fixed', 0.00, '1', '2024-12-31 09:45:15', '2024-12-31 09:45:21'),
(5, 8, 'DIGITAL & PHYSICAL COPY', '2-day express shipping via USPS. This price is for domestic shipping only, international shipping may incur a small fee.', 'fixed', 12.00, '1', '2024-12-31 14:48:53', '2024-12-31 14:48:53'),
(6, 11, 'DIGITAL DELIVERY', 'Arrives to your email immediately when completed.', 'free', 0.00, '1', '2024-12-31 14:50:28', '2024-12-31 14:50:28'),
(7, 11, 'DIGITAL & PHYSICAL COPY', '2-day express shipping via USPS. This price is for domestic shipping only, international shipping may incur a small fee.', 'fixed', 12.00, '1', '2024-12-31 14:50:54', '2024-12-31 14:50:54'),
(8, 5, 'DIGITAL DELIVERY', 'Arrives to your email immediately when completed.', 'free', 0.00, '1', '2024-12-31 14:51:37', '2024-12-31 14:51:37'),
(9, 5, 'DIGITAL & PHYSICAL COPY', '2-day express shipping via USPS. This price is for domestic shipping only, international shipping may incur a small fee.', 'fixed', 12.00, '1', '2024-12-31 14:52:01', '2024-12-31 14:52:01'),
(10, 4, 'DIGITAL DELIVERY', 'Arrives to your email immediately when completed.', 'free', 0.00, '1', '2024-12-31 14:56:19', '2024-12-31 14:56:19'),
(11, 3, 'DIGITAL DELIVERY', 'Arrives to your email immediately when completed.', 'free', 0.00, '1', '2024-12-31 14:56:47', '2024-12-31 14:56:47');

INSERT INTO "public"."event_types" ("id", "name", "status", "created_at", "updated_at") VALUES
(2, 'Sports', 1, '2024-12-10 17:55:00', '2024-12-10 17:55:00'),
(3, 'Music', 1, '2024-12-17 19:03:21', '2024-12-17 19:03:21');

INSERT INTO "public"."events" ("id", "name", "event_type_id", "start_date", "end_date", "status", "description", "images", "created_at", "updated_at") VALUES
(2, 'testq', 2, '2024-04-20', '2024-12-27', '1', '<p>asdd</p>', '"[\"1734335755675fdd0b842a5.jpg\",\"1734335763675fdd13d0457.jpg\",\"1734335769675fdd19d037d.png\"]"', '2024-12-11 20:51:39', '2024-12-19 21:24:45'),
(5, 'test123', 2, '2024-12-18', '2024-12-20', '1', '<p>zxcssf</p>', '"[\"\"]"', '2024-12-17 20:43:55', '2024-12-17 20:43:55');

INSERT INTO "public"."faqs" ("id", "question", "answer", "status", "created_at", "updated_at") VALUES
(2, 'Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>', 1, '2024-12-11 10:52:14', '2024-12-11 10:52:14'),
(3, 'Test', '<h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.Where does it come from?</p><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.Where does it come from?</p><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.Where does it come from?</p><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.Where does it come from?</p><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.Where does it come from?</p><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.adas</p>', 1, '2024-12-17 19:09:41', '2024-12-17 19:25:53'),
(4, 'asdasdas', '<p>asdada</p>', 1, '2024-12-17 19:37:42', '2024-12-17 19:37:42'),
(5, 'Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>', 1, '2024-12-11 10:52:14', '2024-12-11 10:52:14'),
(6, 'Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>', 1, '2024-12-11 10:52:14', '2024-12-11 10:52:14'),
(7, 'Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>', 1, '2024-12-11 10:52:14', '2024-12-11 10:52:14'),
(8, 'Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>', 1, '2024-12-11 10:52:14', '2024-12-11 10:52:14'),
(9, 'Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>', 1, '2024-12-11 10:52:14', '2024-12-11 10:52:14'),
(10, 'Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>', 1, '2024-12-11 10:52:14', '2024-12-11 10:52:14'),
(11, 'Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>', 1, '2024-12-11 10:52:14', '2024-12-11 10:52:14'),
(12, 'Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>', 1, '2024-12-11 10:52:14', '2024-12-11 10:52:14'),
(13, 'Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>', 1, '2024-12-11 10:52:14', '2024-12-11 10:52:14'),
(14, 'Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>', 1, '2024-12-11 10:52:14', '2024-12-11 10:52:14'),
(15, 'Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>', 1, '2024-12-11 10:52:14', '2024-12-11 10:52:14'),
(16, 'Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>', 1, '2024-12-11 10:52:14', '2024-12-11 10:52:14'),
(17, 'Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>', 1, '2024-12-11 10:52:14', '2024-12-11 10:52:14'),
(18, 'Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>', 1, '2024-12-11 10:52:14', '2024-12-11 10:52:14');

INSERT INTO "public"."home_logos" ("id", "name", "status", "image", "created_at", "updated_at") VALUES
(1, 'travelers1', 't', '173568542567747531b2036.png', '2024-12-31 22:50:26', '2024-12-31 22:52:33');

INSERT INTO "public"."home_page_settings" ("id", "key", "value", "created_at", "updated_at") VALUES
(1, 'why_choose_us_title', 'Effective Solutions for Your Document Needs', '2025-01-01 00:05:20', '2025-01-01 00:05:20'),
(2, 'why_choose_us_content', 'At Tasheel, we provide tailored solutions for all your legal translation and documentation needs.Our team of experts ensures accuracy and compliance, guiding you through the complexities of legal processes. We prioritize efficiency and customer satisfaction, making the handling of your documents seamless and stress-free.', '2025-01-01 00:05:20', '2025-01-01 00:06:04'),
(3, 'work_process_title', 'How it Work', '2025-01-01 00:05:20', '2025-01-01 00:08:46'),
(4, 'work_process_content', 'Work Process', '2025-01-01 00:05:20', '2025-01-01 00:08:46'),
(5, 'customer_experience_title', 'Customers Experience', '2025-01-01 00:05:20', '2025-01-01 00:08:46'),
(6, 'insights_title', 'Find Out Our', '2025-01-01 00:05:20', '2025-01-01 00:08:46'),
(7, 'insights_content', 'Insights & Intelligence', '2025-01-01 00:05:20', '2025-01-01 00:08:46'),
(8, 'youtube_video_1', 'https://www.youtube.com/embed/-VK0axfge4A', '2025-01-01 00:05:20', '2025-01-01 00:31:06'),
(9, 'youtube_video_2', 'https://www.youtube.com/embed/-VK0axfge4A', '2025-01-01 00:05:20', '2025-01-01 00:31:06'),
(10, 'about_us_title', 'Your Tasks, Our Care', '2025-01-01 01:11:28', '2025-01-01 01:11:28'),
(11, 'about_us_description', 'Tasheel is a leading provider of expert documentation and attestation services, specializing in legal attestation, translation, document processing assistance, and more. With years of experience and a commitment to accuracy and reliability, we ensure that your documents are authenticated and accepted worldwide. Our team of experts works diligently to provide efficient and hassle-free services, meeting your deadlines and exceeding your expectations. We specialize in bridging the gap between individuals, businesses, and governmental entities, providing expert legal translation, certified and notarized services, and support for embassy, consulate, municipality, and ministry processes. At Tasheel, we empower you to confidently and easily navigate legal and administrative challenges.', '2025-01-01 01:11:28', '2025-01-01 01:11:28');

INSERT INTO "public"."insights" ("id", "name", "title", "content", "image", "status", "created_at", "updated_at") VALUES
(1, 'Evan Thomas', 'Workplace problems in your business?', 'Banter! Could “workplace banter” cause problems in your business? The short answer? Yes', '1735688410677480dace1da.jpg', 't', '2024-12-31 23:40:10', '2024-12-31 23:40:23');

INSERT INTO "public"."languages" ("id", "name", "code", "status", "created_at", "updated_at", "translation_price") VALUES
(1, 'English', 'en', 1, '2024-12-21 09:50:53', '2024-12-25 19:57:32', 10.00),
(3, 'Spanish', 'es', 1, '2024-12-25 21:49:07', '2024-12-25 21:49:07', 10.00),
(4, 'Hindi', 'hi', 1, '2024-12-25 21:49:24', '2024-12-25 21:49:24', 10.00),
(5, 'Arabic1', 'ar', 1, '2024-12-25 21:49:50', '2024-12-26 11:16:57', 20.00),
(6, 'Punjabi', 'pn', 1, '2024-12-26 11:17:12', '2024-12-26 11:17:12', NULL);

INSERT INTO "public"."migrations" ("id", "migration", "batch") VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_12_04_121725_create_companies_table', 1),
(5, '2024_12_04_174007_create_permission_tables', 1),
(6, '2024_12_05_125935_create_countries_table', 1),
(7, '2024_12_05_125953_create_emirates_table', 1),
(11, '2024_12_05_164934_create_packages_table', 2),
(12, '2024_12_05_164957_create_packages_addons_table', 2),
(19, '2024_12_05_231725_create_challenges_table', 3),
(20, '2024_12_05_232702_create_challenges_companies_table', 3),
(21, '2024_12_05_191748_add_fields_to_users_table', 4),
(22, '2024_12_10_063233_remove_columns_from_companies_table', 5),
(23, '2024_12_10_113225_add_status_to_countries_table', 6),
(24, '2024_12_10_144153_add_status_to_emirates_table', 7),
(25, '2024_12_10_155646_add_country_id_and_status_to_cities_table', 8),
(26, '2024_12_10_165027_create_target_types_table', 9),
(27, '2024_12_10_173815_create_event_types_table', 10),
(28, '2024_12_10_182826_create_pages_table', 11),
(29, '2024_12_10_094132_add_soft_deletes_to_users_table', 12),
(30, '2024_12_10_131649_add_soft_deletes_to_challenges_table', 12),
(31, '2024_12_11_102429_create_faqs_table', 13),
(32, '2024_12_11_104518_create_faqs_table', 14),
(33, '2024_12_11_190634_create_events_table', 15),
(34, '2024_12_12_171650_add_role_id_to_users_table', 16),
(35, '2024_12_16_031035_create_target_types_company_table', 17),
(36, '2024_12_16_143622_add_dial_code_to_countries_table', 18),
(37, '2024_12_21_090718_create_languages_table', 19),
(38, '2024_12_22_025151_create_site_settings_table', 20),
(39, '2024_12_22_202921_create_sliders_table', 21),
(40, '2024_12_22_202959_create_slider_buttons_table', 22),
(41, '2024_12_22_204258_create_sliders_table', 23),
(42, '2024_12_22_204302_create_slider_buttons_table', 23),
(43, '2024_12_24_110324_create_services_table', 24),
(44, '2024_12_24_110552_create_service_details_table', 25),
(45, '2024_12_24_110641_create_service_faqs_table', 26),
(46, '2024_12_25_144910_add_images_and_prices_to_services_table', 27),
(47, '2024_12_25_175336_create_quotes_table', 28),
(48, '2024_12_25_194520_add_translation_price_to_languages_table', 29),
(49, '2024_12_25_203316_create_services_types_table', 30),
(50, '2024_12_25_204612_create_services_types_table', 31),
(51, '2024_12_26_100307_recreate_services_types_table', 32),
(52, '2024_12_26_142627_create_service_pricing_table', 33),
(53, '2024_12_26_144059_create_service_pricing_table', 34),
(54, '2024_12_26_151334_create_service_pricing_table', 35),
(55, '2024_12_26_154043_recreate_services_types_table', 36),
(56, '2024_12_26_164628_create_translation_types_table', 37),
(57, '2024_12_27_213922_create_bookings_table', 38),
(58, '2024_12_28_091000_add_delivery_type_and_status_to_bookings_table', 39),
(59, '2024_12_28_145944_create_contact_us_table', 40),
(60, '2024_12_30_093601_create_translation_types_categories_table', 41),
(61, '2024_12_30_142149_create_delivery_types_table', 42),
(62, '2024_12_30_145032_create_delivery_types_table', 43),
(63, '2024_12_30_145523_create_delivery_types_table', 44),
(64, '2024_12_30_145932_create_delivery_types_table', 45),
(65, '2024_12_31_103127_add_columns_to_translation_types_categories_table', 46),
(66, '2024_12_31_173752_add_fields_to_bookings_table', 47),
(67, '2024_12_31_201549_create_why_choose_us_table', 48),
(68, '2024_12_31_204641_create_work_process_table', 49),
(69, '2024_12_31_224105_create_home_logos_table', 50),
(70, '2024_12_31_225708_create_reviews_table', 51),
(71, '2024_12_31_232951_create_insights_table', 52),
(72, '2024_12_31_235754_create_home_page_settings_table', 53),
(73, '2025_01_01_104657_alter_add_fileds_to_cms_pages', 54),
(74, '2025_01_01_115229_alter_add_fileds_to_cms_pages', 54),
(76, '2025_01_01_203806_add_delivery_method_price_and_vat_columns_to_bookings_table', 55),
(77, '2025_01_29_095444_create_service_atributes_table', 56),
(78, '2025_01_29_101737_create_service_atributes_table', 57),
(79, '2025_01_31_013415_create_service_atributes_value_table', 58),
(84, '2025_02_01_083459_add_bigint_field_id_to_service_booking_fields', 63),
(85, '2025_02_03_080934_add_target_field_id_to_field_conditions_table', 64),
(86, '2025_02_04_091806_create_services_bookings_table', 65),
(88, '2025_02_05_161345_modify_value_nullable_in_services_booking_fields', 66),
(89, '2025_02_05_162722_add_field_label_to_services_booking_fields', 67),
(90, '2025_02_05_163749_add_booking_id_to_services_bookings', 68),
(91, '2025_02_08_110950_add_billing_details_to_services_bookings', 69),
(92, '2025_02_08_145535_add_total_to_services_bookings_table', 70),
(93, '2025_02_11_144933_add_price_to_service_atributes_values', 71),
(94, '2025_02_11_153928_add_status_to_services_booking_table', 72),
(98, '2025_03_17_104054_create_categories_table', 76),
(99, '2025_01_29_101737_create_category_atributes_table', 77),
(100, '2025_01_31_013415_create_category_atributes_value_table', 78),
(101, '2025_01_31_031313_create_category_fields_table', 79),
(102, '2025_01_31_172442_create_field_conditions_table', 80),
(105, '2024_12_05_130018_create_cities_table', 81),
(106, '2025_03_19_110943_create_ads_table', 82),
(107, '2025_02_04_091921_create_ad_fields_table', 83),
(108, '2025_03_19_161432_create_pricing_plans_table', 84),
(109, '2025_03_19_161456_create_plan_durations_table', 85),
(110, '2025_03_19_161754_create_ad_plans_table', 86);

INSERT INTO "public"."model_has_roles" ("role_id", "model_type", "model_id") VALUES
(1, 'App\Models\User', 1),
(2, 'App\Models\User', 2),
(2, 'App\Models\User', 3),
(2, 'App\Models\User', 4),
(2, 'App\Models\User', 5),
(2, 'App\Models\User', 6),
(2, 'App\Models\User', 13),
(2, 'App\Models\User', 16),
(2, 'App\Models\User', 23),
(2, 'App\Models\User', 32),
(2, 'App\Models\User', 34),
(2, 'App\Models\User', 35);

INSERT INTO "public"."packages" ("id", "name", "price", "status", "created_at", "updated_at", "deleted_at") VALUES
(8, 'Susan Miranda', 12, 1, '2024-12-07 03:32:13', '2024-12-07 03:32:13', NULL),
(9, 'Quincy Nixon', 12, 0, '2024-12-07 03:32:39', '2024-12-07 03:32:39', NULL),
(10, 'Ariel Newton', 12, 1, '2024-12-07 03:35:15', '2024-12-07 03:35:15', NULL),
(11, 'Beatrice Delgado', 12, 1, '2024-12-07 03:35:30', '2024-12-07 03:35:30', NULL),
(12, 'Michael Benson', 123, 0, '2024-12-07 03:35:49', '2024-12-07 03:35:49', NULL),
(13, 'Amir Pittman', 67, 0, '2024-12-07 03:36:04', '2024-12-07 03:36:04', NULL),
(14, 'Test Package', 50, 0, '2024-12-07 15:55:36', '2024-12-07 17:56:39', NULL),
(15, 'Wing Tucker', 25, 0, '2024-12-07 17:57:28', '2024-12-07 20:45:17', NULL),
(16, 'Raju', 35, 1, '2024-12-07 21:25:17', '2024-12-07 21:10:03', NULL),
(17, 'Duncan Colon', 45, 1, '2024-12-07 17:25:54', '2024-12-07 17:25:54', NULL),
(18, 'Wynne Bishop', 11111, 1, '2024-12-07 17:26:17', '2024-12-07 17:26:17', NULL),
(19, 'Malik Stanley', 12, 0, '2024-12-07 18:24:56', '2024-12-07 20:45:30', NULL),
(20, 'Sade Cotton', 12, 1, '2024-12-07 18:25:50', '2024-12-07 22:25:50', NULL),
(21, 'Madonna Tyler', 12, 0, '2024-12-07 18:27:28', '2024-12-07 22:27:28', NULL),
(22, 'Christopher Rowland', 12, 1, '2024-12-07 18:28:41', '2024-12-07 20:30:00', NULL),
(23, 'Neville Kennedy', 122, 1, '2024-12-07 18:30:00', '2024-12-16 13:52:11', NULL),
(24, 'Drew Hoffman', 12, 1, '2024-12-07 18:33:52', '2024-12-07 22:33:52', NULL),
(25, 'April Foster', 12, 1, '2024-12-07 18:34:39', '2024-12-07 18:34:39', NULL),
(26, 'Craig Caldwell', 2, 1, '2024-12-07 19:35:53', '2024-12-12 06:49:19', NULL),
(27, 'Test1q', 20, 1, '2024-12-17 21:01:37', '2024-12-19 21:24:31', NULL);

INSERT INTO "public"."packages_addons" ("id", "package_id", "title", "deleted_at", "created_at", "updated_at") VALUES
(3, 3, 'Distinctio Ut qui q', NULL, '2024-12-05 21:31:38', '2024-12-05 21:31:38'),
(4, 3, 'Optio elit id et n', NULL, '2024-12-05 21:31:38', '2024-12-05 21:31:38'),
(5, 3, 'Possimus est amet', NULL, '2024-12-05 21:31:38', '2024-12-05 21:31:38'),
(6, 3, 'Omnis veniam enim a', NULL, '2024-12-05 21:31:38', '2024-12-05 21:31:38'),
(7, 3, 'Quo quia tempora quo', NULL, '2024-12-05 21:31:38', '2024-12-05 21:31:38'),
(8, 3, 'Illo sit nisi animi', NULL, '2024-12-05 21:31:38', '2024-12-05 21:31:38'),
(9, 4, 'Reprehenderit amet', NULL, '2024-12-05 21:35:25', '2024-12-05 21:35:25'),
(10, 5, 'Cumque libero sit v', NULL, '2024-12-05 21:58:52', '2024-12-05 21:58:52'),
(11, 6, 'Ex enim ducimus vol', NULL, '2024-12-05 22:09:23', '2024-12-05 22:09:23'),
(12, 7, 'Consequatur distinct', NULL, '2024-12-05 22:09:39', '2024-12-05 22:09:39'),
(13, 8, 'Aut officiis quos la', NULL, '2024-12-07 03:32:13', '2024-12-07 03:32:13'),
(14, 8, 'Ad enim nostrud even', NULL, '2024-12-07 03:32:13', '2024-12-07 03:32:13'),
(15, 9, 'Ratione aut labore o', NULL, '2024-12-07 03:32:39', '2024-12-07 03:32:39'),
(16, 10, 'Cupiditate perspicia', NULL, '2024-12-07 03:35:15', '2024-12-07 03:35:15'),
(17, 11, 'Labore doloribus inc', NULL, '2024-12-07 03:35:30', '2024-12-07 03:35:30'),
(18, 12, 'Non qui pariatur Eu', NULL, '2024-12-07 03:35:49', '2024-12-07 03:35:49'),
(19, 13, 'Accusamus repellendu', NULL, '2024-12-07 03:36:04', '2024-12-07 03:36:04'),
(21, 14, 'Addon Info 2', NULL, '2024-12-07 15:55:36', '2024-12-07 17:50:20'),
(22, 14, 'Addon Info 3', NULL, '2024-12-07 15:55:36', '2024-12-07 17:50:20'),
(23, 14, 'Addon Info 4', NULL, '2024-12-07 15:55:36', '2024-12-07 17:50:20'),
(25, 14, 'new 2', NULL, '2024-12-07 17:50:20', '2024-12-07 17:55:57'),
(26, 14, 'new 3', NULL, '2024-12-07 17:50:20', '2024-12-07 17:55:57'),
(27, 14, 'new 4', NULL, '2024-12-07 17:50:20', '2024-12-07 17:55:57'),
(34, 15, 'New 4', NULL, '2024-12-07 18:57:37', '2024-12-07 18:57:37'),
(35, 16, 'Omnis est nihil quo', NULL, '2024-12-07 21:25:17', '2024-12-07 21:25:17'),
(36, 17, 'gdfgdfgdf', NULL, '2024-12-07 17:25:54', '2024-12-07 21:04:29'),
(37, 18, 'Reiciendis suscipit', NULL, '2024-12-07 17:26:17', '2024-12-07 17:26:17'),
(38, 19, 'Velit earum quia aut', NULL, '2024-12-07 22:24:56', '2024-12-07 22:24:56'),
(39, 20, 'Dicta aut totam nisi', NULL, '2024-12-07 22:25:50', '2024-12-07 22:25:50'),
(40, 21, 'Aliquip necessitatib', NULL, '2024-12-07 22:27:28', '2024-12-07 22:27:28'),
(41, 22, 'In esse facere quae', NULL, '2024-12-07 18:28:41', '2024-12-07 18:28:41'),
(42, 23, 'Ad provident non en', NULL, '2024-12-07 18:30:00', '2024-12-07 18:30:00'),
(43, 24, 'Voluptas quaerat ut', NULL, '2024-12-07 22:33:52', '2024-12-07 22:33:52'),
(44, 25, 'Ad temporibus possim', NULL, '2024-12-07 18:34:39', '2024-12-07 18:34:39'),
(45, 26, 'Ullam aliquid beatae', NULL, '2024-12-07 19:35:53', '2024-12-07 19:35:53'),
(46, 16, 'newwwwwwwwwwww', NULL, '2024-12-07 21:09:35', '2024-12-07 21:09:35'),
(47, 16, 'Rajuuuuuuuuuuuu', NULL, '2024-12-07 21:10:03', '2024-12-07 21:10:03'),
(48, 16, 'bfd', NULL, '2024-12-07 21:10:59', '2024-12-07 21:10:59'),
(79, 27, 'test', NULL, '2024-12-17 21:01:37', '2024-12-17 21:01:37');

INSERT INTO "public"."plan_durations" ("id", "pricing_plan_id", "duration", "price", "created_at", "updated_at") VALUES
(1, 3, '30', '125', NULL, NULL),
(2, 4, '7', '50', NULL, NULL),
(3, 4, '15', '75', NULL, NULL),
(4, 4, '30', '100', NULL, NULL);

INSERT INTO "public"."pricing_plans" ("id", "name", "duration", "price", "currency", "created_at", "updated_at") VALUES
(1, 'Free', '30', '0', 'SYP', NULL, NULL),
(2, 'Standard', '90', '35', 'SYP', NULL, NULL),
(3, 'Premium', '30', '125', 'SYP', NULL, NULL),
(4, 'Featured', '7', '50', 'SYP', NULL, NULL);

INSERT INTO "public"."quotes" ("id", "name", "email", "from_lang", "to_lang", "total_pages", "word_count", "service_id", "created_at", "updated_at") VALUES
(1, 'John Doe', 'john@example.com', 'english', 'spanish', 10, 2000, 5, '2024-12-25 18:01:37', '2024-12-25 18:01:37'),
(2, 'tsttt', 'test@gmail.com', 'arabic', 'chinese', 12, 4, 5, '2024-12-25 18:05:07', '2024-12-25 18:05:07'),
(3, 'tsttt', 'test@gmail.com', 'arabic', 'chinese', 12, 4, 5, '2024-12-25 18:06:33', '2024-12-25 18:06:33'),
(4, 'asda', 'admin@hadify.com', 'arabic', 'chinese', 12, 12, 5, '2024-12-25 18:06:55', '2024-12-25 18:06:55'),
(7, 'asda', 'admin@tasheel.com', 'english', 'english', 12, 1234, 5, '2024-12-25 18:15:04', '2024-12-25 18:15:04'),
(8, 'asdad', 'admin@hadify.com', 'english', 'chinese', 12, 21, 5, '2024-12-25 18:15:55', '2024-12-25 18:15:55'),
(11, 'asdas', 'admin@admin.com', 'arabic', 'chinese', 21, 21, 5, '2024-12-25 18:21:56', '2024-12-25 18:21:56'),
(12, 'asdas', 'test@gmail.com', 'english', 'hindi', 12, 123, 5, '2024-12-25 18:24:26', '2024-12-25 18:24:26'),
(13, 'asdasd', 'admin@hadify.com', 'arabic', 'chinese', 21, 22, 5, '2024-12-25 18:26:24', '2024-12-25 18:26:24'),
(14, 'asda', 'admin@admin.com', 'english', 'chinese', 21, 22, 5, '2024-12-25 19:00:07', '2024-12-25 19:00:07'),
(15, 'testtttdesc', 'test@gmail.com', 'arabic', 'english,chinese', 11, 100, 5, '2024-12-25 21:05:10', '2024-12-25 21:05:10'),
(16, 'asdad', 'admin@admin.com', 'english', 'chinese,spanish', 120, 222222, 9, '2024-12-25 21:30:46', '2024-12-25 21:30:46'),
(17, 'testtstst', 'testing@gmail.com', 'Hindi', 'Spanish,Arabic', 11, 2222, 9, '2024-12-25 22:04:43', '2024-12-25 22:04:43');

INSERT INTO "public"."reviews" ("id", "name", "status", "review", "image", "designation", "rating", "created_at", "updated_at") VALUES
(1, 'Jacob Leonardo1', 't', 'While running an early-stage startup, everything feels hard; that''s why it''s been so nice to have our accounting feel easy. We recommend Qetus', '173568679567747a8b0bae6.png', 'CEO Founder', 4.0, '2024-12-31 23:12:17', '2024-12-31 23:14:54');

INSERT INTO "public"."roles" ("id", "name", "guard_name", "created_at", "updated_at") VALUES
(1, 'Admin', 'web', '2024-12-05 15:22:16', '2024-12-05 15:22:16'),
(2, 'Customer', 'web', '2024-12-05 15:22:16', '2024-12-05 15:22:16');

INSERT INTO "public"."service_atributes" ("id", "service_id", "name", "status", "created_at", "updated_at", "deleted_at") VALUES
(2, 10, 'test', 1, '2025-01-29 10:50:25', '2025-01-29 10:50:25', NULL),
(3, 10, 'test2', 1, '2025-01-31 01:59:15', '2025-01-31 01:59:15', NULL),
(4, 10, 'test3', 1, '2025-01-31 01:59:30', '2025-01-31 01:59:30', NULL),
(5, 9, 'test1', 1, '2025-01-31 02:00:22', '2025-01-31 02:00:22', NULL),
(6, 9, 'test2', 1, '2025-01-31 02:00:57', '2025-01-31 02:00:57', NULL),
(7, 11, 'Licence Type', 1, '2025-01-31 06:55:18', '2025-01-31 06:55:18', NULL),
(8, 11, 'Region', 1, '2025-01-31 06:56:43', '2025-01-31 06:56:43', NULL);

INSERT INTO "public"."service_atributes_value" ("id", "service_id", "attribute_id", "name", "status", "created_at", "updated_at", "deleted_at", "price") VALUES
(1, 10, 2, 'test', 1, '2025-01-31 01:52:54', '2025-01-31 01:52:54', NULL, 0.00),
(2, 9, 5, 'test', 1, '2025-01-31 02:01:49', '2025-01-31 02:02:11', NULL, 0.00),
(3, 11, 7, 'Local', 1, '2025-01-31 06:55:37', '2025-01-31 06:55:37', NULL, 0.00),
(4, 11, 7, 'International', 1, '2025-01-31 06:55:55', '2025-01-31 06:55:55', NULL, 0.00),
(5, 11, 8, 'West Branch', 1, '2025-01-31 06:57:31', '2025-01-31 06:57:31', NULL, 0.00),
(6, 11, 8, 'Gaza', 1, '2025-01-31 06:57:46', '2025-01-31 06:57:46', NULL, 0.00),
(7, 11, 7, 'Dubai', 1, '2025-02-11 14:55:07', '2025-02-11 14:55:34', NULL, 13.01);

INSERT INTO "public"."service_booking_fields" ("id", "service_id", "type", "label", "name", "options", "attribute_id", "file_types", "created_at", "updated_at", "field_id") VALUES
(37, 11, 'text', 'Full Name', 'Full Name', NULL, NULL, NULL, '2025-02-07 10:39:59', '2025-02-07 10:39:59', 0),
(38, 11, 'text', 'Email', 'Email', NULL, NULL, NULL, '2025-02-07 10:39:59', '2025-02-07 10:39:59', 1),
(39, 11, 'text', 'Phone', 'Phone', NULL, NULL, NULL, '2025-02-07 10:39:59', '2025-02-07 10:39:59', 2),
(40, 11, 'text', 'City', 'City', NULL, NULL, NULL, '2025-02-07 10:39:59', '2025-02-07 10:39:59', 3),
(41, 11, 'select', 'Region', 'Region', NULL, 8, NULL, '2025-02-07 10:39:59', '2025-02-07 10:39:59', 4),
(42, 11, 'select', 'Licence Type', 'Licence Type', NULL, 7, NULL, '2025-02-07 10:39:59', '2025-02-07 10:39:59', 5),
(43, 11, 'text', 'Year Validity', 'Year Validity', NULL, NULL, NULL, '2025-02-07 10:39:59', '2025-02-07 10:39:59', 6),
(44, 11, 'file', 'Upload Licence', 'Upload Licence', NULL, NULL, 'png,pdf', '2025-02-07 10:39:59', '2025-02-07 10:39:59', 7);

INSERT INTO "public"."service_details" ("id", "service_id", "title", "content", "created_at", "updated_at") VALUES
(35, 9, 'asdasda', 'asdasdas', '2024-12-26 18:03:14', '2024-12-26 18:03:14'),
(36, 9, 'asdada', 'asdadadas', '2024-12-26 18:03:14', '2024-12-26 18:03:14'),
(37, 9, 'asdasda', 'adasdas', '2024-12-26 18:03:14', '2024-12-26 18:03:14'),
(38, 9, 'adasdas', 'asdasdadsasd', '2024-12-26 18:03:14', '2024-12-26 18:03:14'),
(43, 5, 'Background Checks', 'These cases are perfectly simple and easy to distinguish. In a free hour when our power.', '2024-12-27 13:41:24', '2024-12-27 13:41:24'),
(44, 5, 'Profile Assessments', 'Indignation and men who are so beguiled and demoralized by the charms blinded.', '2024-12-27 13:41:24', '2024-12-27 13:41:24'),
(45, 5, 'Position Description', 'Trouble that are bound to ensue and equal blame belongs those who fail in their duty.', '2024-12-27 13:41:24', '2024-12-27 13:41:24'),
(46, 5, 'HR Functions', '<div class="description_box">
                       <p>Nothing prevents our being able to do what we like best every pleasure is to be welcomed &amp; every pain avoided certain circumstances.</p>
                    </div>
                           <!--===============spacing==============-->
                           <div class="pd_bottom_25"></div>
                           <!--===============spacing==============-->
                    <div class="content_box_cn style_one">
                       <div class="txt_content">
                          <h3>
                             <a href="#" target="_blank" rel="nofollow">Open Communication</a>
                          </h3>
                          <p>Equal blame belongs to those who fail in their duty through weakness same duty.</p>
                       </div>
                    </div>
                    
                    <div class="content_box_cn  style_one">
                       <div class="txt_content">
                          <h3>
                             <a href="#" target="_blank" rel="nofollow">Sharing a Vision</a>
                          </h3>
                          <p>Business it will frequently occur that pleasures have to be repudiated.</p>
                       </div>
                    </div>
                    
                    <div class="content_box_cn  style_one">
                       <div class="txt_content">
                          <h3>
                             <a href="#" target="_blank" rel="nofollow">Recognizing Employee</a>
                          </h3>
                          <p>Holds in these matter to this principle selection he rejects pleasures to secure.</p>
                       </div>
                    </div>', '2024-12-27 13:41:24', '2024-12-27 13:41:24'),
(47, 10, 'asdasdasd', 'asdasdasasdads', '2024-12-30 17:19:09', '2024-12-30 17:19:09'),
(48, 10, 'asdasdas', 'adadasd', '2024-12-30 17:19:09', '2024-12-30 17:19:09'),
(49, 10, 'asdasdasd', 'adasdasdssas', '2024-12-30 17:19:09', '2024-12-30 17:19:09'),
(50, 10, 'adada', 'asdasdasd', '2024-12-30 17:19:09', '2024-12-30 17:19:09'),
(51, 11, 'asdasd', 'asdas', '2025-01-31 06:54:00', '2025-01-31 06:54:00'),
(52, 11, 'sdasd', 'asdas', '2025-01-31 06:54:00', '2025-01-31 06:54:00'),
(53, 11, 'sdas', 'asdasd', '2025-01-31 06:54:00', '2025-01-31 06:54:00'),
(54, 11, 'asdas', 'asdasdad', '2025-01-31 06:54:00', '2025-01-31 06:54:00');

INSERT INTO "public"."service_faqs" ("id", "service_id", "question", "answer", "created_at", "updated_at") VALUES
(32, 9, 'adadas', 'adasdas', '2024-12-26 18:03:14', '2024-12-26 18:03:14'),
(33, 9, 'adasd', 'adasdsa', '2024-12-26 18:03:14', '2024-12-26 18:03:14'),
(36, 5, 'Who is Tasheel Legal Transilation?1', 'Nor again is there anyone who loves or pursues or desires to obtain
                                       pain itself because it is pains but because occasionally circumstances
                                       occurs great pleasure take a trivial of us.', '2024-12-27 13:41:24', '2024-12-27 13:41:24'),
(37, 5, 'What recruitment services do you offer?', 'Serenity Is Multi-Faceted Blockchain Based Ecosystem, Energy Retailer For The People, Focusing On The Promotion Of Sustainable Living, Renewable Energy Production And Smart Energy Grid Utility Services.', '2024-12-27 13:41:24', '2024-12-27 13:41:24'),
(38, 5, 'How can I register a job?', 'Serenity Is Multi-Faceted Blockchain Based Ecosystem, Energy Retailer For The People, Focusing On The Promotion Of Sustainable Living, Renewable Energy Production And Smart Energy Grid Utility Services.', '2024-12-27 13:41:24', '2024-12-27 13:41:24'),
(39, 10, 'asdas', 'adasda', '2024-12-30 17:19:09', '2024-12-30 17:19:09'),
(40, 10, 'adad', 'adasdasds', '2024-12-30 17:19:09', '2024-12-30 17:19:09'),
(41, 11, 'sdasdas', 'sdasda', '2025-01-31 06:54:00', '2025-01-31 06:54:00'),
(42, 11, 'sdasd', 'sdas', '2025-01-31 06:54:00', '2025-01-31 06:54:00');

INSERT INTO "public"."service_pricing" ("id", "service_id", "translation_from", "translation_to", "price", "status", "created_at", "updated_at") VALUES
(1, 2, 3, 5, 12.00, '1', '2024-12-26 15:20:56', '2024-12-26 17:46:05'),
(2, 2, 1, 4, 120.00, '1', '2024-12-27 13:40:43', '2024-12-27 13:40:43'),
(3, 2, 1, 5, 12.00, '1', '2024-12-27 13:41:04', '2024-12-27 13:41:04'),
(4, 5, 5, 4, 20.00, '1', '2025-01-31 07:30:06', '2025-01-31 07:30:06');

INSERT INTO "public"."services" ("id", "title", "service_type_id", "subtitle", "description", "status", "created_at", "updated_at", "background_image", "service_image", "other_image", "price_from", "price_to") VALUES
(5, 'Legal Translation', 2, 'Specialized translation of legal documents ensuring accuracy and compliance with legal standards.', '<p><span style="color: rgb(74, 78, 86); font-family: Inter, sans-serif; font-size: 16px;">Our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty.<br></span><span style="color: rgb(74, 78, 86); font-family: Inter, sans-serif; font-size: 16px;">Our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty.<br></span><span style="color: rgb(74, 78, 86); font-family: Inter, sans-serif; font-size: 16px;">Our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty.</span><span style="color: rgb(74, 78, 86); font-family: Inter, sans-serif; font-size: 16px;"></span><span style="color: rgb(74, 78, 86); font-family: Inter, sans-serif; font-size: 16px;"></span></p>', '1', '2024-12-24 11:56:22', '2024-12-27 13:41:24', '1735143740676c313cd5177.jpg', '1735143741676c313da2f92.jpg', '1735143741676c313da32d3.jpg', 20, 60),
(9, 'Certified Translation', 3, 'Specialized translation of legal documents ensuring accuracy and compliance with legal standards.', '<p><span style="color: rgb(74, 78, 86); font-family: Inter, sans-serif; font-size: 16px;">Our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty.</span></p>', '1', '2024-12-25 21:28:53', '2024-12-26 18:03:14', '1735162133676c79155404a.jpg', '1735166702676c8aeea206a.jpg', '1735162133676c791556ffc.jpg', 10, 1000),
(10, 'Police verification', 4, 'asdasdada', '<p>dsasdasdasdasdasdasdasdadads</p>', '1', '2024-12-26 17:58:48', '2024-12-30 17:19:09', '1735235927676d9957b92a2.jpg', '1735235928676d995883e55.jpg', '1735235928676d995884186.png', 12, 123),
(11, 'Driving License (Local/ International)', 5, 'Driving License (Local/ International)', '<p><span style="color: rgb(33, 37, 41); font-family: Poppins, sans-serif; text-wrap-mode: nowrap;">Driving License (Local/ International)</span></p>', '1', '2025-01-31 06:54:00', '2025-01-31 06:54:00', '1738306439679c7387490c7.jpg', '1738306440679c738802f0c.png', '1738306440679c7388032f5.jpg', 12, 120);

INSERT INTO "public"."services_bookings" ("id", "service_id", "created_at", "updated_at", "booking_id", "first_name", "last_name", "company_name", "country", "street_address", "apartment", "city", "state", "phone", "email", "file_namesconfirm", "order_notes", "total", "status") VALUES
(21, 11, '2025-02-05 16:33:15', '2025-02-05 16:33:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'Pending'),
(22, 11, '2025-02-05 16:39:55', '2025-02-05 16:39:55', '#TS437031098', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'Pending'),
(23, 11, '2025-02-07 06:56:19', '2025-02-07 06:56:19', '#TS630711806', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'Pending'),
(24, 11, '2025-02-07 06:57:08', '2025-02-07 06:57:08', '#TS773525448', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'Pending'),
(25, 11, '2025-02-08 11:26:14', '2025-02-08 11:26:14', '#TS562287691', 'Shay', 'Stanton', 'Hubbard Delaney Inc', 'UAE1', 'Eos do unde ut arch', 'Excepteur commodo ma', 'Est voluptas quia ac', 'Culpa eaque fuga B', '+1 (714) 523-4407', 'wypacyje@mailinator.com', NULL, 'Non ipsa dolore opt', 0.00, 'Pending'),
(26, 11, '2025-02-08 11:38:30', '2025-02-08 11:38:30', '#TS269568670', 'Simone', 'Wood', 'Lott Mckay Co', 'Maskat', 'Nihil est rerum dol', 'Odio sit inventore', 'Rerum est ad quam q', 'Dolore voluptate fug', '+1 (997) 255-9662', 'zupujugix@mailinator.com', NULL, 'Dolore ut et est cup', 0.00, 'Pending'),
(27, 11, '2025-02-08 11:39:36', '2025-02-08 11:39:36', '#TS285620534', 'Darrel', 'Todd', 'Burch Rocha Inc', 'Maskat', 'Aut veniam similiqu', 'Sed eum qui eos sunt', 'Ea sunt sunt aut et', 'Eos iure aliquam ass', '+1 (805) 183-6762', 'lupavub@mailinator.com', NULL, 'Ipsa sint voluptate', 0.00, 'Pending'),
(28, 11, '2025-02-08 11:41:42', '2025-02-08 11:41:42', '#TS498467896', 'Ivy', 'Barrera', 'Lewis Frederick LLC', 'UAE1', 'Qui nemo saepe offic', 'Esse ut omnis sunt e', 'Impedit odio eaque', 'Obcaecati possimus', '+1 (564) 226-3612', 'nypera@mailinator.com', NULL, 'Architecto deserunt', 0.00, 'Pending'),
(29, 11, '2025-02-08 11:44:18', '2025-02-08 11:44:18', '#TS260540127', 'Sopoline', 'Snyder', 'Emerson Snyder Plc', 'Camilla Benton', 'Doloremque nemo sint', 'Quidem ab exercitati', 'Neque ad sed consequ', 'Natus proident ipsu', '+1 (747) 326-3428', 'qypixuzym@mailinator.com', NULL, 'Tenetur sint cupidit', 0.00, 'Pending'),
(30, 11, '2025-02-08 11:47:21', '2025-02-08 11:47:21', '#TS809715464', 'Miranda', 'Gates', 'Holloway and Mcdowell Inc', 'Canada', 'Sed eu qui officiis', 'Eos in cupiditate pr', 'Lorem repellendus D', 'Pariatur A neque as', '+1 (212) 482-6149', 'cahily@mailinator.com', NULL, 'Quisquam et ipsa co', 0.00, 'Pending'),
(31, 11, '2025-02-11 15:41:54', '2025-02-11 15:41:54', '#TS448681406', 'Griffith', 'Duffy', 'Mann Simon LLC', 'Canada', 'Enim quibusdam occae', 'Laboris nihil conseq', 'A blanditiis quibusd', 'Aliquip ut fugit ip', '+1 (736) 859-3897', 'nymogujig@mailinator.com', NULL, 'Incididunt do quia a', 13.01, 'Pending'),
(32, 11, '2025-02-11 15:45:12', '2025-02-11 15:59:47', '#TS753416093', 'Kiona', 'Keith', 'Byers and Mueller LLC', 'Maskat', 'Qui ipsum qui eaque', 'Labore ut incidunt', 'Odio praesentium ips', 'Culpa reprehenderit', '+1 (102) 366-3044', 'guqelupek@mailinator.com', NULL, 'Dolorem sed culpa do', 13.01, 'Ready for Delivery');

INSERT INTO "public"."services_types" ("id", "name", "status", "created_at", "updated_at") VALUES
(2, 'Legal Translation', '1', '2024-12-26 15:48:42', '2024-12-26 17:43:28'),
(3, 'Certified Translation', '1', '2024-12-26 17:43:45', '2024-12-26 17:43:45'),
(4, 'Police verification', '1', '2024-12-30 17:18:41', '2024-12-30 17:18:41'),
(5, 'Driving License (Local/ International)', '1', '2025-01-31 06:52:08', '2025-01-31 06:52:08');

INSERT INTO "public"."sessions" ("id", "user_id", "ip_address", "user_agent", "payload", "last_activity") VALUES
('uzoO8wf7bhYvatAYRm3c2MckKkTiVivPZxXzISQj', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZFBXem53SzUzaUZHQVFlV2dva01TejJmN2dSd3kweVgyWFptdW5RZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMToiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluL2FkcyI7fX0=', 1742401924);

INSERT INTO "public"."site_settings" ("id", "key", "value", "created_at", "updated_at") VALUES
(1, 'email', 'info@tasheel.ps', '2024-12-22 03:16:13', '2024-12-22 03:19:21'),
(2, 'phone_number', '+972 56 220 0190', '2024-12-22 03:16:13', '2024-12-22 03:19:21'),
(3, 'landline_number', '0 229 1234', '2024-12-22 03:16:13', '2024-12-22 03:19:21'),
(4, 'whatsapp_number', '972562200190', '2024-12-22 03:16:13', '2024-12-22 03:19:21'),
(5, 'facebook_url', 'https://www.facebook.com/', '2024-12-22 03:16:13', '2024-12-22 03:19:21'),
(6, 'instagram_url', 'https://www.instagram.com/', '2024-12-22 03:16:13', '2024-12-22 03:19:21');

INSERT INTO "public"."slider_buttons" ("id", "slider_id", "text", "link", "created_at", "updated_at") VALUES
(18, 1, 'Gaza Strip Services', 'https://www.google.com/', '2024-12-22 21:30:10', '2024-12-22 21:30:10'),
(19, 1, 'Palestinian Non-Resident Services', 'https://www.google.com/', '2024-12-22 21:30:10', '2024-12-22 21:30:10'),
(20, 2, 'Palestinian Non-Resident Services', 'https://www.google.com/', '2024-12-25 20:06:43', '2024-12-25 20:06:43');

INSERT INTO "public"."sliders" ("id", "name", "image", "content", "status", "created_at", "updated_at") VALUES
(1, 'Your Partner for Legal Docs & Translations!', '1734903010676884e2bfe94.jpg', 'Our team of experts works diligently to provide efficient and hassle-free services, <br> 
                                       meeting your deadlines and exceeding your expectations.q', 'f', '2024-12-22 20:45:58', '2024-12-31 20:25:54'),
(2, 'Your Partner for Legal Docs & Translationss!', 'gjNzHd1ocGWXRp2VI5FT6VRV6A596Rl0jqhFTfQz.jpg', 'Our team of experts works diligently to provide efficient and hassle-free services, <br> 
                                       meeting your deadlines and exceeding your expectations.', 't', '2024-12-22 21:27:50', '2024-12-25 20:06:53');

INSERT INTO "public"."target_types" ("id", "name", "status", "created_at", "updated_at") VALUES
(3, 'KM1', 1, '2024-12-10 17:22:23', '2024-12-17 19:57:14'),
(4, 'Floor', 1, '2024-12-10 17:22:38', '2024-12-16 14:21:51');

INSERT INTO "public"."target_types_company" ("id", "company_id", "name", "status", "created_at", "updated_at") VALUES
(2, 23, 'test1', 1, '2024-12-16 03:21:20', '2024-12-16 03:21:20'),
(3, 23, 'test', 1, '2024-12-16 03:22:50', '2024-12-16 03:22:50');

INSERT INTO "public"."translation_types" ("id", "name", "description", "price_type", "price", "percentage", "category", "status", "created_at", "updated_at") VALUES
(1, 'test', 'testsada', 'rush_fee', NULL, 30.00, 'default-category', '1', '2024-12-26 16:53:41', '2024-12-26 16:53:41'),
(3, 'EXPEDITED', '15 - 24 hours Tomorrow at 7:52 PM (latest)', 'rush_fee', NULL, 30.00, 'only_translation', '1', '2024-12-26 17:12:44', '2024-12-27 19:07:15'),
(4, 'EXPEDITED', '15 - 24 hours Tomorrow at 7:52 PM (latest)', 'rush_fee', NULL, 30.00, 'notarized', '1', '2024-12-26 17:13:03', '2024-12-30 10:28:50'),
(5, 'STANDARD', '1 - 2 days Monday at 7:52 PM (latest)', 'free', 0.00, NULL, 'notarized', '1', '2024-12-26 17:31:22', '2024-12-27 19:23:44'),
(7, 'STANDARD', '1 - 2 days Monday at 7:52 PM (latest)', 'free', 0.00, NULL, 'certified', '1', '2024-12-26 17:33:22', '2024-12-27 19:00:22'),
(8, 'EXPEDITED', '15 - 24 hours Tomorrow at 7:52 PM (latest)', 'rush_fee', NULL, 30.00, 'certified', '1', '2024-12-27 19:00:53', '2024-12-27 20:02:30'),
(11, 'STANDARD', '1 - 2 days Monday at 7:52 PM (latest)', 'free', 0.00, NULL, 'only_translation', '1', '2024-12-27 19:02:53', '2024-12-27 19:02:53');

INSERT INTO "public"."translation_types_categories" ("id", "name", "slug", "status", "created_at", "updated_at", "description", "price_type", "price", "percentage") VALUES
(2, 'CERTIFIED', 'certified', '1', '2024-12-30 10:26:55', '2024-12-31 10:34:42', 'Includes an official coversheet with the company header, stamp, and signature from a Licensed Translator, accredited by the Palestinian Ministry of Justice.', 'free', 0.00, 0.00),
(3, 'ONLY TRANSLATION', 'only_translation', '1', '2024-12-30 10:27:33', '2024-12-31 10:35:30', 'For those who need only professional translation.', 'free', 0.00, 0.00),
(5, 'NOTARIZED', 'notarized', '1', '2024-12-30 10:31:48', '2024-12-31 10:35:55', 'Includes an official cover page with a red seal, stamped with the signature of the licensed Notary Public.', 'fixed', 25.00, 0.00);

INSERT INTO "public"."users" ("id", "name", "email", "email_verified_at", "password", "remember_token", "created_at", "updated_at", "first_name", "last_name", "dial_code", "phone", "country_id", "emirates_id", "city_id", "company_id", "status", "deleted_at", "role_id", "gender", "country") VALUES
(1, 'Admin User', 'admin@classifieds.com', NULL, '$2y$12$.yxPzTSPODYtVimFf4yPh.ldokb0K0nmvIKvCLR//AdrplJpBHebm', NULL, '2024-12-05 15:22:16', '2024-12-05 15:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(2, 'Woods and Haley Associates', 'gocajulevu@mailinator.com', NULL, '$2y$12$ov/2HliXhcRdXL3E2CrI9OdBlBPEhFtd.nT5rMccwXRqdj6x0HJkC', NULL, '2024-12-05 15:37:44', '2024-12-13 18:23:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-12-13 18:23:02', NULL, NULL, NULL),
(3, 'Chen Vang LLC', 'diqyr@mailinator.com', NULL, '$2y$12$IUmiLAObBLlYUs13D4aWsewKgC53Zb62XitDG/3L1Akbq51yi..wm', NULL, '2024-12-05 15:39:43', '2024-12-13 18:22:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-12-13 18:22:56', NULL, NULL, NULL),
(4, 'Mason Peters Trading', 'qysewabawo@mailinator.com', NULL, '$2y$12$ynPkuRcVNPxiF1g3dPk6pODyf/pavc6KF7Od0RP9DR7SNT5ETH6kW', NULL, '2024-12-05 15:41:43', '2024-12-13 18:22:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-12-13 18:22:47', NULL, NULL, NULL),
(5, 'Downs and Workman Trading', '43543436y3@gdfgdf.kiu', NULL, '$2y$12$V6HnBnydTqgiGypVb6xqXuQOxkgl1LDfT.G8nI1TeUkr7vUJ7EB7u', NULL, '2024-12-05 15:50:01', '2024-12-13 18:22:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-12-13 18:22:41', NULL, NULL, NULL),
(6, 'Rodriguez and Alford Trading', 'emirates@gmail.com', NULL, '$2y$12$Ki7Vd7xG6vQjkz3OzPClMOWnuv2n5p9ipCFmhw69tIh3v9Un2UaGy', NULL, '2024-12-05 18:24:50', '2024-12-13 18:22:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-12-13 18:22:30', NULL, NULL, NULL),
(7, 'Ahmed Hopper', 'zopeficyq@mailinator.com', NULL, '$2y$12$BBq4XgxNs2vj53P1g4byke8aklNVrAKAuGRzWEIVN.CGH0A3s5Oqa', NULL, '2024-12-05 20:21:59', '2024-12-05 20:21:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(8, 'Heather Schultz', 'pedalyzixa@mailinator.com', NULL, '$2y$12$lKQTDi4bGYpMtsUOOKH9YucUQwQqRo/.gjd.urDOFhL1A8CKZ8Yam', NULL, '2024-12-05 20:22:53', '2024-12-05 20:22:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(9, 'Yuli Everett', 'toxolo@mailinator.com', NULL, '$2y$12$hLDxEjynYgVwLLTAdSAcCuwX997wgoTYSzzrPNe/2tQnH1aMIQsh2', NULL, '2024-12-05 20:23:30', '2024-12-05 20:23:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(10, 'Dawn Acevedo', 'bavyxizawi@mailinator.com', NULL, '$2y$12$jA9v57p2MEOQP1u9Di6Sdeisut45QLZzUPN310316TyJ9tDVQqb8C', NULL, '2024-12-05 20:26:20', '2024-12-05 20:26:20', 'Dawn', 'Acevedo', '+91', '8358264038', 1, 2, 5, 6, 1, NULL, NULL, NULL, NULL),
(11, 'Joy Henderson', 'telagu@mailinator.com', NULL, '$2y$12$/FeLQPAjds6U1J0SB/ZKputaKZ5fkEKffiGLd4jLChBVxbZqMAjRK', NULL, '2024-12-05 20:28:51', '2024-12-05 20:28:51', 'Joy', 'Henderson', '+971', '1633481266', 1, 2, 5, 6, 1, NULL, NULL, NULL, NULL),
(12, 'Anthony Burke', 'hobafo@mailinator.com', NULL, '$2y$12$UOJ74BRwRcCXIIO5/X7wpu.gm2i4bbpq.zzrFc/U1eTRNz/fFP8/.', NULL, '2024-12-05 21:39:41', '2024-12-05 21:39:41', 'Anthony', 'Burke', '+91', '6368074711', 1, 1, 1, 6, 1, NULL, NULL, NULL, NULL),
(13, 'Baldwin and Boyd LLC', 'fokupi@mailinator.com', NULL, '$2y$12$elFejuY0j6j1N0o9PCM8AerytRSeMbkCEglkV7dlvMK5cgoFRgemK', NULL, '2024-12-08 05:34:29', '2024-12-13 18:20:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-12-13 18:20:46', NULL, NULL, NULL),
(15, 'Ray and Holland Co', 'toqowa@mailinator.com', NULL, '$2y$12$R09zCd8WFkr3KKT4mcoXZ.2VcjyGp56s045nO9CuTUIsa3MrGLVEi', NULL, '2024-12-10 05:32:01', '2024-12-10 05:32:01', NULL, NULL, '971', '4312345678', 1, 1, 1, NULL, 1, NULL, NULL, NULL, NULL),
(16, 'Asher Morton', 'mykoboqem@mailinator.com', NULL, '$2y$12$dsD4dbNnoH0Ohys4u6ftme3Jhkxm8zcPrTVyEc4.us9EWIPNc7CRG', NULL, '2024-12-10 06:20:04', '2024-12-12 17:00:15', 'Asher', 'Morton', '971', '12312123', 2, NULL, 1, 2, 0, '2024-12-12 17:00:15', NULL, NULL, NULL),
(17, 'Wade Hodge', 'xinozok@mailinator.com', NULL, '$2y$12$/1.ac8gQZZyULOdYr48KmOUQ45wnctU0UQA2sg3.1tnmaMxMLoCk.', NULL, '2024-12-12 17:24:24', '2024-12-12 17:24:24', 'Wade', 'Hodge', NULL, '2313123123', 2, 0, 0, 1, 1, NULL, NULL, NULL, NULL),
(18, 'Amy Palmer', 'beji@mailinator.com', NULL, '$2y$12$k9N7LgiLG/bAuDS9zNpbIe96E/F6kPiGWWOleqDNs8et1ekfS2aqK', NULL, '2024-12-12 17:27:02', '2024-12-12 17:27:02', 'Amy', 'Palmer', NULL, '213122312', 2, 0, 1, 1, 0, NULL, 3, NULL, NULL),
(22, 'Quynnasd11 Hardy', 'newilapyw@mailinator.com', NULL, '$2y$12$T0c0LMgv.XaibDUPog.jE.b69JnNe2f87BgpmsTS1lNehELrFGHqm', NULL, '2024-12-13 18:42:14', '2024-12-20 06:45:25', 'Quynnasd11', 'Hardy', '+9711', '23423423', 2, 4, 3, 35, 1, NULL, NULL, NULL, NULL),
(23, 'Farmer Dudley Traders', 'wujutavyj@mailinator.com', NULL, '$2y$12$a5khm/m.TuV35722ISKM7emuVe28Eq4WT7a0YI.4ipQmDy9BH3Zga', NULL, '2024-12-13 19:09:35', '2024-12-19 21:55:04', NULL, NULL, NULL, '3534243223', 2, 4, 7, NULL, 1, '2024-12-19 21:55:04', NULL, NULL, NULL),
(24, 'Medge Patrick', 'sosadok@mailinator.com', NULL, '$2y$12$OzWKe9t6YXlG5JhRUbN5p.eukjrb.7qvNlYiCVLPUNeqNaU0jsYYi', NULL, '2024-12-13 19:11:02', '2024-12-13 19:11:02', 'Medge', 'Patrick', '971', '23432433', 4, 4, 3, 9, 1, NULL, NULL, NULL, NULL),
(25, 'Aspen Mullins', 'qagolesaru@mailinator.com', NULL, '$2y$12$PB14akgquQND94Uy8P8tSOllgj5EtlCHI7gEH53g7mkKLs7RG7986', NULL, '2024-12-13 19:19:04', '2024-12-13 19:54:13', 'Aspen', 'Mullins', '971', '231231212', 8, 5, 3, 10, 1, NULL, NULL, 'Male', NULL),
(26, 'Finn Pugh', 'xoxeqadu@mailinatorsdasdas', NULL, '$2y$12$q.d.cIJkhT/yJrnUbnCkNu5a.pYAc7urB6ylsshc7yXZKKFJHlU0e', NULL, '2024-12-15 22:17:09', '2024-12-15 22:41:22', 'Finn', 'Pugh', '971', '34324234', 8, 3, 7, 10, 1, NULL, NULL, NULL, NULL),
(27, 'Quinn Walter', 'asddasdasdasd@sdasdasasdasdas', NULL, '$2y$12$2ZRsjmoitcldZCFHY2k78.feYhL2xaklIt0NyuwNpX.cycaoK0HVa', NULL, '2024-12-15 22:19:22', '2024-12-15 22:41:26', 'Quinn', 'Walter', '971', '144234324', 8, 1, 1, 9, 1, NULL, NULL, NULL, NULL),
(28, 'Hanna Sears', 'qyxavymano@mailinator.com', NULL, '$2y$12$J47Sq7zmbOXdeZZQ0d5KZONK4CwF8u5eY6IffDuWdT0dAKkq3hSW.', NULL, '2024-12-15 22:28:41', '2024-12-15 22:40:43', 'Hanna', 'Sears', '971', '32423434', 7, 5, 1, 23, 0, NULL, NULL, NULL, NULL),
(29, 'MacKensie Alford', 'xejufenuqo@mailinator.com', NULL, '$2y$12$RmnPDH4B5bahZ1Kktn59G.FX2dXrlyHYP7J6fxUEHAHWYBqpHxCDG', NULL, '2024-12-15 22:48:06', '2024-12-19 21:43:20', 'MacKensie', 'Alford', '91', '23423423', 5, 5, 1, 23, 1, NULL, NULL, NULL, NULL),
(30, 'Isaiah Frazier', 'xufykukut@mailinator.com', NULL, '$2y$12$w8AzzEGoiG/mo33RZbckouFhmaxSU6Zl3gTWa.lxJ8hrUBZv.qTN2', NULL, '2024-12-15 23:17:35', '2024-12-15 23:17:35', 'Isaiah', 'Frazier', '+91', '234234324234', 2, 1, 1, 23, 1, NULL, NULL, NULL, NULL),
(31, 'Lacey Cantu', 'sapezuda@mailinator.com', NULL, '$2y$12$SlXTaVRI5A9oFZ.7kkPfH.gWcsze7uqogeffKuRCOEaQmtEA8Sh0q', NULL, '2024-12-16 04:30:58', '2024-12-16 04:30:58', 'Lacey', 'Cantu', '91', '2423423234', 4, 4, 7, 23, 0, NULL, NULL, NULL, NULL),
(32, 'Olsen and Johnston Inc', 'xeto@mailinator.com', NULL, '$2y$12$Ib65KlCBDfPbPgq/G78sUO9ZeeKm7VM.mz85AsQ9seg6qT7kto.5G', NULL, '2024-12-16 05:05:22', '2024-12-19 21:54:10', NULL, NULL, '971', '143234234', 2, 4, 7, NULL, 1, '2024-12-19 21:54:10', NULL, NULL, NULL),
(33, 'Erich Lynn', 'tyte@mailinator.com', NULL, '$2y$12$B/Yqy3AKPs/pbBME.79Cre.YRT2PGS9JvRVHmlkCnBxLWEtdp5QWW', NULL, '2024-12-16 14:41:20', '2024-12-19 19:38:37', 'Erich', 'Lynn', '+971', '3231231123', 7, 1, 1, 32, 1, NULL, NULL, NULL, NULL),
(34, 'Price Sutton Inc12112', 'mifomil@mailinator.com', NULL, '$2y$12$GUzu7PWwynx7SbyFrS3KTu2iVj..9zRH5HHSURKVKS2tcS8ourPAq', NULL, '2024-12-16 15:46:05', '2024-12-19 21:50:46', NULL, NULL, '+971', '2312312312', 2, 1, 1, NULL, 1, '2024-12-19 21:50:46', NULL, NULL, 'United Arab Emirates'),
(35, 'Morton Ratliff LLC', 'sasul@mailinator.com', NULL, '$2y$12$3OqqwuXWLiuemfe4fhC4c.LuLUJ5I.2DM02.mI8qwmAIol6QAry4G', NULL, '2024-12-19 21:56:22', '2024-12-19 21:56:22', NULL, NULL, '+9711', '5434534334', 2, 4, 7, NULL, 1, NULL, 2, 'Male', 'United Arab Emirates');

INSERT INTO "public"."why_choose_us" ("id", "name", "content", "image", "status", "created_at", "updated_at") VALUES
(1, 'Comprehensive Services', 'We provide a wide range of services under one roof, addressing all aspects of your documentation needs. Our comprehensive approach streamlines processes, saving you time and effort.', '17356770326774546824d2a.png', 't', '2024-12-31 20:22:58', '2024-12-31 20:30:32'),
(2, 'Comprehensive Services 1', 'We provide a wide range of services under one roof, addressing all aspects of your documentation needs. Our comprehensive approach streamlines processes, saving you time and effort.', '17356772606774554c66883.png', 't', '2024-12-31 20:34:20', '2024-12-31 20:39:30');

INSERT INTO "public"."work_process" ("id", "name", "content", "image", "status", "created_at", "updated_at") VALUES
(1, 'Find Your Requested Service', 'Explore our diverse range of services to quickly identify the solution that meets your needs.', '173567910967745c859cd66.png', 't', '2024-12-31 21:05:09', '2024-12-31 21:05:25');



-- Indices
CREATE UNIQUE INDEX bookings_booking_id_unique ON public.bookings USING btree (booking_id);


-- Indices
CREATE INDEX delivery_types_translation_type_id_index ON public.delivery_types USING btree (translation_type_id);
ALTER TABLE "public"."events" ADD FOREIGN KEY ("event_type_id") REFERENCES "public"."event_types"("id") ON DELETE CASCADE;


-- Indices
CREATE UNIQUE INDEX failed_jobs_uuid_unique ON public.failed_jobs USING btree (uuid);


-- Indices
CREATE UNIQUE INDEX home_page_settings_key_unique ON public.home_page_settings USING btree (key);


-- Indices
CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


-- Indices
CREATE UNIQUE INDEX languages_code_unique ON public.languages USING btree (code);
ALTER TABLE "public"."model_has_permissions" ADD FOREIGN KEY ("permission_id") REFERENCES "public"."permissions"("id") ON DELETE CASCADE;


-- Indices
CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);
ALTER TABLE "public"."model_has_roles" ADD FOREIGN KEY ("role_id") REFERENCES "public"."roles"("id") ON DELETE CASCADE;


-- Indices
CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


-- Indices
CREATE UNIQUE INDEX permissions_name_guard_name_unique ON public.permissions USING btree (name, guard_name);
ALTER TABLE "public"."quotes" ADD FOREIGN KEY ("service_id") REFERENCES "public"."services"("id") ON DELETE CASCADE;
ALTER TABLE "public"."role_has_permissions" ADD FOREIGN KEY ("role_id") REFERENCES "public"."roles"("id") ON DELETE CASCADE;
ALTER TABLE "public"."role_has_permissions" ADD FOREIGN KEY ("permission_id") REFERENCES "public"."permissions"("id") ON DELETE CASCADE;


-- Indices
CREATE UNIQUE INDEX roles_name_guard_name_unique ON public.roles USING btree (name, guard_name);
ALTER TABLE "public"."service_details" ADD FOREIGN KEY ("service_id") REFERENCES "public"."services"("id") ON DELETE CASCADE;
ALTER TABLE "public"."service_faqs" ADD FOREIGN KEY ("service_id") REFERENCES "public"."services"("id") ON DELETE CASCADE;


-- Indices
CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);
CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


-- Indices
CREATE UNIQUE INDEX site_settings_key_unique ON public.site_settings USING btree (key);
ALTER TABLE "public"."slider_buttons" ADD FOREIGN KEY ("slider_id") REFERENCES "public"."sliders"("id") ON DELETE CASCADE;


-- Indices
CREATE UNIQUE INDEX translation_types_categories_slug_unique ON public.translation_types_categories USING btree (slug);


-- Indices
CREATE UNIQUE INDEX users_email_unique ON public.users USING btree (email);
