-- Adminer 4.8.4 PostgreSQL 12.22 dump

\connect "lokafy";

DROP TABLE IF EXISTS "aboutus_page_settings";
DROP SEQUENCE IF EXISTS aboutus_page_settings_id_seq;
CREATE SEQUENCE aboutus_page_settings_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."aboutus_page_settings" (
    "id" bigint DEFAULT nextval('aboutus_page_settings_id_seq') NOT NULL,
    "meta_key" character varying(255) NOT NULL,
    "meta_value" text,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "aboutus_page_settings_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "account_type";
DROP SEQUENCE IF EXISTS account_type_id_seq;
CREATE SEQUENCE account_type_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."account_type" (
    "id" bigint DEFAULT nextval('account_type_id_seq') NOT NULL,
    "name" character varying(600),
    "description" character varying(600),
    "sort_order" integer DEFAULT '0' NOT NULL,
    "status" boolean DEFAULT true NOT NULL,
    "indvidual_name" character varying(255),
    "indvidual_image" text,
    "deleted" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "account_type_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "activity_type";
DROP SEQUENCE IF EXISTS activity_type_id_seq;
CREATE SEQUENCE activity_type_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."activity_type" (
    "id" bigint DEFAULT nextval('activity_type_id_seq') NOT NULL,
    "account_id" integer,
    "name" character varying(600),
    "description" character varying(600),
    "logo" character varying(255),
    "sort_order" integer DEFAULT '0' NOT NULL,
    "status" boolean DEFAULT true NOT NULL,
    "availbale_for" integer DEFAULT '3' NOT NULL,
    "indvidual_name" character varying(255),
    "indvidual_logo" text,
    "deleted" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "banner_image" character varying(600),
    CONSTRAINT "activity_type_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."activity_type"."availbale_for" IS '1-company,2-individual,3-both';


DROP TABLE IF EXISTS "admin_designation";
DROP SEQUENCE IF EXISTS admin_designation_id_seq;
CREATE SEQUENCE admin_designation_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."admin_designation" (
    "id" bigint DEFAULT nextval('admin_designation_id_seq') NOT NULL,
    "name" character varying(600) NOT NULL,
    "is_deletd" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "admin_designation_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "amount_type";
DROP SEQUENCE IF EXISTS amount_type_id_seq;
CREATE SEQUENCE amount_type_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."amount_type" (
    "id" bigint DEFAULT nextval('amount_type_id_seq') NOT NULL,
    "name" character varying(600) NOT NULL,
    CONSTRAINT "amount_type_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "amount_type" ("id", "name") VALUES
(1,	'%'),
(2,	'Amount');

DROP TABLE IF EXISTS "app_banners";
DROP SEQUENCE IF EXISTS app_banners_id_seq;
CREATE SEQUENCE app_banners_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."app_banners" (
    "id" bigint DEFAULT nextval('app_banners_id_seq') NOT NULL,
    "banner_title" character varying(600),
    "banner_image" character varying(600),
    "active" integer DEFAULT '1',
    "created_by" integer DEFAULT '0',
    "updated_by" integer DEFAULT '0',
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "type" integer DEFAULT '0' NOT NULL,
    "category" integer DEFAULT '0' NOT NULL,
    "product" integer DEFAULT '0' NOT NULL,
    "service" integer DEFAULT '0' NOT NULL,
    "banner_type" integer DEFAULT '0' NOT NULL,
    "activity" integer DEFAULT '0' NOT NULL,
    "store" integer DEFAULT '0' NOT NULL,
    "url" character varying(1600),
    "is_type_gift" character varying(255),
    CONSTRAINT "app_banners_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "app_banners" ("id", "banner_title", "banner_image", "active", "created_by", "updated_by", "created_at", "updated_at", "type", "category", "product", "service", "banner_type", "activity", "store", "url", "is_type_gift") VALUES
(2,	'Sam Banner',	'1736229753Frame 1171275012.png',	1,	1,	1,	'2024-12-02 10:17:12',	'2025-01-07 06:02:33',	1,	0,	0,	0,	1,	0,	0,	NULL,	NULL),
(3,	NULL,	'1736229728Frame 1171275008.png',	1,	1,	1,	'2024-12-02 10:53:54',	'2025-01-11 09:55:04',	1,	0,	0,	0,	1,	0,	0,	NULL,	'1');

DROP TABLE IF EXISTS "app_home_sections";
DROP SEQUENCE IF EXISTS app_home_sections_id_seq;
CREATE SEQUENCE app_home_sections_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."app_home_sections" (
    "id" bigint DEFAULT nextval('app_home_sections_id_seq') NOT NULL,
    "type" character varying(255) NOT NULL,
    "entity_id" integer DEFAULT '0' NOT NULL,
    "title" character varying(255),
    "status" integer DEFAULT '1' NOT NULL,
    "sort_order" integer DEFAULT '999' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "app_home_sections_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "area";
DROP SEQUENCE IF EXISTS area_id_seq;
CREATE SEQUENCE area_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."area" (
    "id" bigint DEFAULT nextval('area_id_seq') NOT NULL,
    "country_id" bigint DEFAULT '0' NOT NULL,
    "city_id" bigint DEFAULT '0' NOT NULL,
    "name" character varying(255),
    "status" integer DEFAULT '0' NOT NULL,
    "latitude" character varying(255),
    "longitude" character varying(255),
    "deleted_at" timestamp(0),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "area_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "area" ("id", "country_id", "city_id", "name", "status", "latitude", "longitude", "deleted_at", "created_at", "updated_at") VALUES
(1,	1,	1,	'International City',	1,	NULL,	NULL,	NULL,	'2024-12-20 11:34:47',	'2024-12-20 11:34:47');

DROP TABLE IF EXISTS "articles";
DROP SEQUENCE IF EXISTS articles_id_seq;
CREATE SEQUENCE articles_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."articles" (
    "id" bigint DEFAULT nextval('articles_id_seq') NOT NULL,
    "title_en" character varying(255),
    "title_ar" character varying(255),
    "status" integer DEFAULT '1' NOT NULL,
    "desc_en" text,
    "desc_ar" text,
    "meta_title" text,
    "meta_keyword" text,
    "meta_description" text,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "articles_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "attribute_type";
DROP SEQUENCE IF EXISTS attribute_type_id_seq;
CREATE SEQUENCE attribute_type_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."attribute_type" (
    "id" bigint DEFAULT nextval('attribute_type_id_seq') NOT NULL,
    "attribute_type_name" character varying(255) NOT NULL,
    "attribute_type_uid" character varying(50) NOT NULL,
    "attribute_type_status" integer DEFAULT '1' NOT NULL,
    CONSTRAINT "attribute_type_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "attribute_type" ("id", "attribute_type_name", "attribute_type_uid", "attribute_type_status") VALUES
(1,	'Dropdown',	'dropdown',	1),
(2,	'Button',	'radio',	1),
(3,	'Image Selection',	'radio_image',	1),
(4,	'Color Box',	'radio_button_group',	1);

DROP TABLE IF EXISTS "attribute_values";
DROP SEQUENCE IF EXISTS attribute_values_id_seq;
CREATE SEQUENCE attribute_values_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."attribute_values" (
    "id" bigint DEFAULT nextval('attribute_values_id_seq') NOT NULL,
    "attribute_id" integer NOT NULL,
    "attribute_values" character varying(255) NOT NULL,
    "attribute_value_in" integer DEFAULT '1' NOT NULL,
    "attribute_value_color" character varying(30),
    "deleted" integer DEFAULT '0' NOT NULL,
    "created_uid" integer NOT NULL,
    "updated_uid" integer,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "attribute_values_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "attribute_values_request";
DROP SEQUENCE IF EXISTS attribute_values_request_id_seq;
CREATE SEQUENCE attribute_values_request_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."attribute_values_request" (
    "id" bigint DEFAULT nextval('attribute_values_request_id_seq') NOT NULL,
    "request_id" integer DEFAULT '0' NOT NULL,
    "attribute" character varying(600) NOT NULL,
    "value" character varying(1600) NOT NULL,
    CONSTRAINT "attribute_values_request_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "attributes";
DROP SEQUENCE IF EXISTS attributes_id_seq;
CREATE SEQUENCE attributes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."attributes" (
    "id" bigint DEFAULT nextval('attributes_id_seq') NOT NULL,
    "attribute_name" character varying(255) NOT NULL,
    "active" integer DEFAULT '1' NOT NULL,
    "attribute_type" integer NOT NULL,
    "industry_type" integer NOT NULL,
    "company_id" integer DEFAULT '0' NOT NULL,
    "store_id" integer DEFAULT '0' NOT NULL,
    "is_common" integer DEFAULT '1' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "created_uid" integer NOT NULL,
    "updated_uid" integer,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "attributes_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "bank";
DROP SEQUENCE IF EXISTS bank_id_seq;
CREATE SEQUENCE bank_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."bank" (
    "id" bigint DEFAULT nextval('bank_id_seq') NOT NULL,
    "name" character varying(600) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "bank_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "bank" ("id", "name", "created_at", "updated_at") VALUES
(1,	'Test',	'2025-01-06 11:17:48',	NULL),
(2,	'RAK',	'2025-01-07 06:49:19',	NULL);

DROP TABLE IF EXISTS "bank_code_types";
DROP SEQUENCE IF EXISTS bank_code_types_id_seq;
CREATE SEQUENCE bank_code_types_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."bank_code_types" (
    "id" bigint DEFAULT nextval('bank_code_types_id_seq') NOT NULL,
    "name" character varying(500),
    "country_id" integer DEFAULT '0' NOT NULL,
    "active" integer DEFAULT '0' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "bank_code_types_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "bank_code_types" ("id", "name", "country_id", "active", "deleted", "created_at", "updated_at") VALUES
(1,	'IFSC (India)',	0,	0,	0,	NULL,	NULL),
(2,	'SORT CODE (UK)',	0,	0,	0,	NULL,	NULL),
(3,	'SWIFT CODE',	0,	0,	0,	NULL,	NULL);

DROP TABLE IF EXISTS "bank_details";
DROP SEQUENCE IF EXISTS bank_details_id_seq;
CREATE SEQUENCE bank_details_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."bank_details" (
    "id" bigint DEFAULT nextval('bank_details_id_seq') NOT NULL,
    "bank_name" character varying(600),
    "company_account" character varying(600),
    "code_type" integer DEFAULT '0' NOT NULL,
    "account_no" character varying(600),
    "branch_code" character varying(300),
    "branch_name" character varying(300),
    "bank_statement_doc" character varying(600),
    "credit_card_sta_doc" character varying(600),
    "country" integer DEFAULT '0' NOT NULL,
    "user_id" integer NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "iban" character varying(600),
    CONSTRAINT "bank_details_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "bank_details" ("id", "bank_name", "company_account", "code_type", "account_no", "branch_code", "branch_name", "bank_statement_doc", "credit_card_sta_doc", "country", "user_id", "created_at", "updated_at", "iban") VALUES
(1,	'1',	'test Beneficiary',	0,	'98765432223',	'54567',	'Test Branch Name',	NULL,	NULL,	1,	4,	'2025-01-06 11:18:49',	'2025-01-06 11:18:49',	'98764f6656'),
(2,	'2',	'TomPay',	0,	'101010101010',	'AABBCCDD',	'Ajman',	'/uploads/company/677cce581abc1_1736232536.jpg',	NULL,	1,	16,	'2025-01-07 06:48:56',	'2025-01-07 06:52:54',	'AABB1010101010'),
(3,	'1',	'test',	0,	'8764433',	'54567',	'test',	NULL,	NULL,	1,	5,	'2025-01-07 07:05:51',	'2025-01-07 07:05:51',	'te644474'),
(4,	'2',	'David',	0,	'101010101010',	'AABBCCDDEE',	'Ajman',	'/uploads/company/677cea4870442_1736239688.png',	NULL,	1,	17,	'2025-01-07 08:48:08',	'2025-01-07 08:48:08',	'AABB1212121212'),
(5,	'2',	'Steve',	0,	'101010101010',	'AABBCCDDEE',	'Ajman',	'/uploads/company/677cec5da2828_1736240221.jpg',	NULL,	1,	18,	'2025-01-07 08:57:01',	'2025-01-07 08:57:01',	'AABB1212121212'),
(6,	'2',	'Marthur',	0,	'101010101010',	'AABBCCDD',	'Ajman',	'/uploads/company/677e216c77291_1736319340.jpg',	NULL,	1,	30,	'2025-01-08 06:55:40',	'2025-01-08 06:55:40',	'AABB10101010'),
(7,	'India',	'111111111111111',	0,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	41,	'2025-01-08 16:23:12',	'2025-01-08 16:23:12',	'11111111111111111111111'),
(8,	'India',	'111111111111111',	0,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	41,	'2025-01-08 16:23:23',	'2025-01-08 16:23:23',	'11111111111111111111111'),
(9,	'India',	'111111111111111',	0,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	41,	'2025-01-08 16:24:37',	'2025-01-08 16:24:37',	'11111111111111111111111'),
(10,	'Aladdin',	'111111111111111',	0,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	42,	'2025-01-08 16:32:13',	'2025-01-08 16:32:13',	'11111111111111111111111'),
(11,	'Aladdin',	'111111111111111',	0,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	42,	'2025-01-08 16:32:30',	'2025-01-08 16:32:30',	'11111111111111111111111'),
(12,	'Aladdin',	'111111111111111',	0,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	42,	'2025-01-08 16:38:05',	'2025-01-08 16:38:05',	'11111111111111111111111'),
(13,	'Aladdin',	'111111111111111',	0,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	42,	'2025-01-08 16:41:15',	'2025-01-08 16:41:15',	'11111111111111111111111'),
(14,	'Aladdin',	'111111111111111',	0,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	42,	'2025-01-08 16:43:01',	'2025-01-08 16:43:01',	'11111111111111111111111'),
(15,	'Aladdin',	'111111111111111',	0,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	42,	'2025-01-08 16:43:22',	'2025-01-08 16:43:22',	'11111111111111111111111'),
(16,	'rak bank',	'111111111111111',	0,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	45,	'2025-01-09 15:02:08',	'2025-01-09 15:02:08',	'123rwrqwrwrrqw235255235'),
(17,	'adadadasda',	'231312313131231',	0,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	50,	'2025-01-10 09:12:23',	'2025-01-10 09:12:23',	'asdsasdadasdadasdasdada'),
(18,	'asdasdasdas',	'231231231231231',	0,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	51,	'2025-01-10 09:29:53',	'2025-01-10 09:29:53',	'asdadasdsadasdasdasdasd'),
(19,	'Rak Bank',	'110011001100110',	0,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	52,	'2025-01-10 09:45:17',	'2025-01-10 09:45:17',	'AABB1100110011001100110'),
(20,	'fdsfdsfds',	'3232323232',	0,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	59,	'2025-01-15 09:37:34',	'2025-01-15 09:37:34',	'32323232323232323232323'),
(21,	'aaasasasas',	'000000045464646',	0,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	62,	'2025-01-17 15:06:39',	'2025-01-17 15:06:39',	'00546546575756757457567'),
(22,	'Dubai',	'23423423423423',	0,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	65,	'2025-01-24 06:54:21',	'2025-01-24 06:54:21',	'11111111111111111111111');

DROP TABLE IF EXISTS "blogs";
DROP SEQUENCE IF EXISTS blogs_id_seq;
CREATE SEQUENCE blogs_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."blogs" (
    "id" bigint DEFAULT nextval('blogs_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "description" text,
    "blog_image" character varying(255),
    "active" boolean DEFAULT false NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "blogs_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "blogs" ("id", "name", "description", "blog_image", "active", "deleted", "created_at", "updated_at") VALUES
(1,	'Unique Designs, Unique You',	'<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or rand..</p>',	'1736344430post-1.jpg',	't',	0,	'2025-01-08 13:53:50',	'2025-01-08 13:53:50'),
(2,	'Intelligent beautiful HTML template',	'<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or rand...</p>',	'1736344473post-2.jpg',	't',	0,	'2025-01-08 13:54:33',	'2025-01-08 13:54:33'),
(3,	'Creative, flexible and affordable',	'<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or rand...</p>',	'1736344517post-3.jpg',	't',	0,	'2025-01-08 13:55:17',	'2025-01-08 13:55:17');

DROP TABLE IF EXISTS "brand";
DROP SEQUENCE IF EXISTS brand_id_seq;
CREATE SEQUENCE brand_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."brand" (
    "id" bigint DEFAULT nextval('brand_id_seq') NOT NULL,
    "name" character varying(600),
    "industry_type" integer DEFAULT '0' NOT NULL,
    "image" character varying(600),
    "active" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "deleted" integer DEFAULT '0' NOT NULL,
    "activity_id" bigint,
    CONSTRAINT "brand_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "brand" ("id", "name", "industry_type", "image", "active", "created_at", "updated_at", "deleted", "activity_id") VALUES
(1,	'Native',	0,	NULL,	1,	'2024-07-02 09:16:22',	'2024-07-02 11:09:20',	0,	7),
(2,	'Malabar',	0,	'/uploads/brand/677d09ef2e1fe_1736247791.jpg',	1,	'2025-01-07 11:03:11',	'2025-01-07 11:03:11',	0,	7),
(3,	'Joyalukkas',	0,	'/uploads/brand/677d0a0095ba8_1736247808.jpg',	1,	'2025-01-07 11:03:28',	'2025-01-07 11:03:28',	0,	7),
(4,	'Pan',	0,	'/uploads/brand/677d0a11cf261_1736247825.jpg',	1,	'2025-01-07 11:03:45',	'2025-01-07 11:03:45',	0,	7),
(5,	'Splash',	0,	'/uploads/brand/677d0a2007995_1736247840.jpg',	1,	'2025-01-07 11:04:00',	'2025-01-07 11:04:00',	0,	7),
(6,	'Max',	0,	'/uploads/brand/677d0a320a140_1736247858.jpg',	1,	'2025-01-07 11:04:18',	'2025-01-07 11:04:18',	0,	7);

DROP TABLE IF EXISTS "building_type";
DROP SEQUENCE IF EXISTS building_type_id_seq;
CREATE SEQUENCE building_type_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."building_type" (
    "id" bigint DEFAULT nextval('building_type_id_seq') NOT NULL,
    "name" character varying(255),
    "description" text,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "active" integer DEFAULT '1' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "building_type_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "cart";
DROP SEQUENCE IF EXISTS cart_id_seq;
CREATE SEQUENCE cart_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."cart" (
    "id" bigint DEFAULT nextval('cart_id_seq') NOT NULL,
    "product_id" integer NOT NULL,
    "product_attribute_id" integer NOT NULL,
    "quantity" integer NOT NULL,
    "user_id" integer NOT NULL,
    "store_id" integer NOT NULL,
    "device_cart_id" character varying(500),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "cart_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "cart" ("id", "product_id", "product_attribute_id", "quantity", "user_id", "store_id", "device_cart_id", "created_at", "updated_at") VALUES
(116,	38,	39,	1,	14,	30,	'0012e1f9e605c504',	'2025-01-15 15:35:18',	'2025-01-15 15:35:18'),
(111,	35,	36,	1,	9,	16,	'c948872a6eac9a75',	'2025-01-15 10:59:42',	'2025-01-16 06:52:07'),
(118,	8,	8,	1,	0,	0,	'711cbb6c0d6d83d44ba0195581e19d4a',	'2025-01-18 15:32:02',	'2025-01-18 15:32:02'),
(108,	32,	33,	1,	58,	0,	'e649a5953e585d1b09865573abeed82f',	'2025-01-15 09:45:02',	'2025-01-15 09:45:02'),
(109,	28,	29,	4,	59,	0,	'e311d18ec9c312840eaa531f0e18fb92',	'2025-01-15 10:28:09',	'2025-01-15 10:28:15'),
(119,	26,	27,	1,	1,	0,	'2933cf70263cc9e5daefe2aca1ce4ccb',	'2025-01-25 09:10:34',	'2025-01-25 09:10:34');

DROP TABLE IF EXISTS "cart_service";
DROP SEQUENCE IF EXISTS cart_service_id_seq;
CREATE SEQUENCE cart_service_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."cart_service" (
    "id" bigint DEFAULT nextval('cart_service_id_seq') NOT NULL,
    "service_id" integer DEFAULT '0' NOT NULL,
    "user_id" integer DEFAULT '0' NOT NULL,
    "device_cart_id" character varying(600),
    "booked_time" character varying(600),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "building_type_id" integer,
    "text" character varying(600),
    "hourly_rate" double precision DEFAULT '0' NOT NULL,
    "task_description" text,
    "doc" character varying(600),
    "qty" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "cart_service_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "category";
DROP SEQUENCE IF EXISTS category_id_seq;
CREATE SEQUENCE category_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."category" (
    "id" bigint DEFAULT nextval('category_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "image" character varying(1500),
    "banner_image" character varying(1500),
    "parent_id" integer DEFAULT '0' NOT NULL,
    "active" integer DEFAULT '1' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "sort_order" integer DEFAULT '0' NOT NULL,
    "created_uid" integer NOT NULL,
    "updated_uid" integer,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "activity_id" bigint,
    "home_page" boolean DEFAULT false NOT NULL,
    "sub_title" character varying(255),
    "is_gift" character varying(255),
    "show_gift_page" character varying(255),
    "is_handmade" boolean,
    CONSTRAINT "category_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "category" ("id", "name", "image", "banner_image", "parent_id", "active", "deleted", "sort_order", "created_uid", "updated_uid", "created_at", "updated_at", "activity_id", "home_page", "sub_title", "is_gift", "show_gift_page", "is_handmade") VALUES
(6,	'Baby Gift Sub',	NULL,	NULL,	5,	0,	1,	0,	1,	1,	'2024-07-02 10:55:29',	'2024-07-02 11:10:03',	0,	'f',	NULL,	NULL,	NULL,	'f'),
(2,	'ALL PRODUCTS',	'/uploads/category/677cc66ba1a4e_1736230507.png',	'/uploads/category/677cf04f3d67e_1736241231.jpg',	0,	0,	1,	0,	1,	1,	'2024-07-02 09:11:55',	'2025-01-15 05:05:04',	7,	't',	NULL,	NULL,	NULL,	NULL),
(5,	'NEW ARRIVAL',	'/uploads/category/677cc6bb17abf_1736230587.png',	'/uploads/category/677cf07492672_1736241268.jpg',	0,	0,	1,	0,	1,	1,	'2024-07-02 09:15:50',	'2025-01-15 05:05:12',	7,	't',	NULL,	NULL,	NULL,	NULL),
(3,	'Explore JEWELRY',	'/uploads/category/67875954a9abd_1736923476.jpg',	'/uploads/category/677cf037205ee_1736241207.jpg',	0,	1,	0,	0,	1,	1,	'2024-07-02 09:14:22',	'2025-01-15 06:44:36',	7,	't',	NULL,	NULL,	NULL,	NULL),
(7,	'Sama',	'/uploads/category/677ccbda3da34_1736231898.JPG',	'/uploads/category/677ccbda3e6d8_1736231898.png',	2,	0,	1,	0,	1,	1,	'2025-01-07 06:38:18',	'2025-01-07 09:11:58',	7,	'f',	NULL,	NULL,	NULL,	'f'),
(13,	'EXPLORE CLOTHES',	'/uploads/category/67875aa01f510_1736923808.jpg',	'/uploads/category/67875aa01fa97_1736923808.jpg',	0,	1,	0,	0,	1,	1,	'2025-01-13 07:23:24',	'2025-01-15 06:50:08',	7,	't',	NULL,	NULL,	NULL,	NULL),
(11,	'GIFTS FOR HIM',	'/uploads/category/67875b8ec13cf_1736924046.jpg',	'/uploads/category/67875b8ec170a_1736924046.jpg',	0,	1,	0,	0,	1,	1,	'2025-01-13 07:22:43',	'2025-01-15 06:54:18',	7,	'f',	NULL,	'1',	'1',	NULL),
(10,	'VALENTINE''S GIFT',	'/uploads/category/67875c1e4c866_1736924190.jpg',	'/uploads/category/67875c1e4cc2d_1736924190.jpg',	0,	1,	0,	0,	1,	1,	'2025-01-13 07:18:05',	'2025-01-15 06:56:30',	7,	'f',	NULL,	'1',	'1',	NULL),
(8,	'DECOR GIFTS',	'/uploads/category/67875c820761c_1736924290.jpg',	'/uploads/category/67875c8207a25_1736924290.jpg',	0,	1,	0,	0,	1,	1,	'2025-01-08 06:47:16',	'2025-01-15 06:58:10',	7,	'f',	NULL,	'1',	'1',	't'),
(14,	'BIRTHDAY GIFTS',	'/uploads/category/67875d1a43d44_1736924442.jpg',	'/uploads/category/67875d1a4412f_1736924442.jpg',	0,	1,	0,	0,	1,	1,	'2025-01-15 07:00:42',	'2025-01-15 07:00:42',	7,	'f',	NULL,	'1',	'1',	NULL),
(1,	'EXPLORE CLOTHES',	'/uploads/category/677e7860bb8f2_1736341600.jpg',	'/uploads/category/677e7860bba3e_1736341600.jpg',	0,	0,	1,	0,	1,	1,	'2024-07-02 09:11:24',	'2025-01-15 04:09:04',	7,	't',	NULL,	NULL,	NULL,	NULL),
(9,	'EXPLORE ACCESSORIES',	'/uploads/category/67875aebc2333_1736923883.jpg',	'/uploads/category/67875aebc2d66_1736923883.jpg',	0,	1,	0,	0,	1,	1,	'2025-01-13 07:17:30',	'2025-01-15 08:51:02',	7,	't',	NULL,	NULL,	NULL,	't'),
(4,	'EXPLORE DECOR',	'/uploads/category/678759210bcc2_1736923425.jpg',	'/uploads/category/677cf0296ad04_1736241193.jpg',	0,	1,	0,	0,	1,	1,	'2024-07-02 09:15:20',	'2025-01-15 08:51:51',	7,	't',	NULL,	NULL,	NULL,	't'),
(15,	'Christmas Gift',	'/uploads/category/6787951c6cb40_1736938780.jpg',	NULL,	0,	1,	0,	0,	1,	1,	'2025-01-15 10:59:40',	'2025-01-15 10:59:40',	7,	'f',	NULL,	'1',	'1',	NULL),
(16,	'Candle Treasures',	'/uploads/category/678795a9cc5e8_1736938921.jpg',	NULL,	0,	1,	0,	0,	1,	1,	'2025-01-15 11:02:01',	'2025-01-15 11:02:01',	7,	'f',	NULL,	'1',	'1',	NULL),
(17,	'EXPLORE BABY BLISS',	'/uploads/category/6787962417b9e_1736939044.jpg',	NULL,	0,	1,	0,	0,	1,	1,	'2025-01-15 11:04:04',	'2025-01-15 11:04:04',	7,	't',	NULL,	NULL,	NULL,	NULL),
(18,	'EXPLORE TOY ADVENTURE',	'/uploads/category/67879660658b0_1736939104.jpg',	NULL,	0,	1,	0,	0,	1,	1,	'2025-01-15 11:05:04',	'2025-01-15 11:05:04',	7,	't',	NULL,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS "cities";
DROP SEQUENCE IF EXISTS cities_id_seq;
CREATE SEQUENCE cities_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."cities" (
    "id" bigint DEFAULT nextval('cities_id_seq') NOT NULL,
    "name" character varying(100) NOT NULL,
    "active" smallint DEFAULT '1' NOT NULL,
    "country_id" integer NOT NULL,
    "state_id" integer NOT NULL,
    "created_uid" bigint,
    "updated_uid" bigint,
    "deleted" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "cities_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "cities" ("id", "name", "active", "country_id", "state_id", "created_uid", "updated_uid", "deleted", "created_at", "updated_at") VALUES
(1,	'Dubai',	1,	1,	0,	1,	NULL,	0,	'2024-06-28 06:21:35',	'2024-06-28 06:21:35'),
(2,	'Ajman',	1,	1,	0,	1,	NULL,	0,	'2025-01-07 06:49:38',	'2025-01-07 06:49:38'),
(3,	'Ras Al Khaimah',	1,	1,	0,	1,	NULL,	0,	'2025-01-07 06:49:50',	'2025-01-07 06:49:50');

DROP TABLE IF EXISTS "cleaning_services";
DROP SEQUENCE IF EXISTS cleaning_services_id_seq;
CREATE SEQUENCE cleaning_services_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."cleaning_services" (
    "id" bigint DEFAULT nextval('cleaning_services_id_seq') NOT NULL,
    "title" character varying(255) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "cleaning_services_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "comment_likes";
DROP SEQUENCE IF EXISTS comment_likes_id_seq;
CREATE SEQUENCE comment_likes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."comment_likes" (
    "id" bigint DEFAULT nextval('comment_likes_id_seq') NOT NULL,
    "comment_id" integer NOT NULL,
    "user_id" integer NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "comment_likes_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "comment_taged_users";
DROP SEQUENCE IF EXISTS comment_taged_users_id_seq;
CREATE SEQUENCE comment_taged_users_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."comment_taged_users" (
    "id" bigint DEFAULT nextval('comment_taged_users_id_seq') NOT NULL,
    "comment_id" integer NOT NULL,
    "user_id" integer NOT NULL,
    CONSTRAINT "comment_taged_users_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "contact_us";
DROP SEQUENCE IF EXISTS contact_us_id_seq;
CREATE SEQUENCE contact_us_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."contact_us" (
    "id" bigint DEFAULT nextval('contact_us_id_seq') NOT NULL,
    "name" character varying(600),
    "email" character varying(600),
    "dial_code" character varying(600),
    "mobile_number" character varying(600),
    "message" text,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "subject" character varying(255),
    CONSTRAINT "contact_us_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "contact_us_settings";
DROP SEQUENCE IF EXISTS contact_us_settings_id_seq;
CREATE SEQUENCE contact_us_settings_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."contact_us_settings" (
    "id" bigint DEFAULT nextval('contact_us_settings_id_seq') NOT NULL,
    "title_en" character varying(300),
    "title_ar" character varying(300),
    "email" character varying(300),
    "mobile" character varying(50),
    "desc_en" text,
    "desc_ar" text,
    "location" text,
    "latitude" text,
    "longitude" text,
    "twitter" character varying(600),
    "instagram" character varying(600),
    "facebook" character varying(600),
    "youtube" character varying(600),
    "linkedin" character varying(600),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "ref_discount" integer DEFAULT '0',
    "ref_discount_type" character varying(255) DEFAULT '1',
    "transport_website_link" character varying(255) DEFAULT '',
    "pinterest" character varying(255),
    "tiktok" character varying(255),
    "whatsapp" character varying(255),
    CONSTRAINT "contact_us_settings_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "contact_us_settings" ("id", "title_en", "title_ar", "email", "mobile", "desc_en", "desc_ar", "location", "latitude", "longitude", "twitter", "instagram", "facebook", "youtube", "linkedin", "created_at", "updated_at", "ref_discount", "ref_discount_type", "transport_website_link", "pinterest", "tiktok", "whatsapp") VALUES
(1,	'LC',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	'1',	'',	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS "contracting";
DROP SEQUENCE IF EXISTS contracting_id_seq;
CREATE SEQUENCE contracting_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."contracting" (
    "id" bigint DEFAULT nextval('contracting_id_seq') NOT NULL,
    "title" character varying(255),
    "description" character varying(255),
    "building_type" integer,
    "contract_type" integer,
    "file" character varying(255),
    "deleted" integer,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "user_id" integer,
    "status" integer,
    "price" double precision,
    "qoutation_file" character varying(255),
    "transaction_id" character varying(255),
    "payment_ref" character varying(255),
    CONSTRAINT "contracting_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "country";
DROP SEQUENCE IF EXISTS country_id_seq;
CREATE SEQUENCE country_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."country" (
    "id" bigint DEFAULT nextval('country_id_seq') NOT NULL,
    "name" character varying(1500) NOT NULL,
    "prefix" character varying(20) NOT NULL,
    "dial_code" character varying(100) NOT NULL,
    "active" character varying(255) DEFAULT '1' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "deleted" smallint DEFAULT '0' NOT NULL,
    CONSTRAINT "country_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "country" ("id", "name", "prefix", "dial_code", "active", "created_at", "updated_at", "deleted") VALUES
(1,	'United Arab Emirates',	'971',	'971',	'1',	'2024-06-27 10:47:37',	NULL,	0);

DROP TABLE IF EXISTS "coupon";
DROP SEQUENCE IF EXISTS coupon_id_seq;
CREATE SEQUENCE coupon_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."coupon" (
    "id" bigint DEFAULT nextval('coupon_id_seq') NOT NULL,
    "coupon_title" character varying(600),
    "coupon_description" text,
    "coupon_end_date" timestamp(0),
    "coupon_amount" double precision,
    "coupon_minimum_spend" double precision,
    "coupon_max_spend" double precision,
    "coupon_usage_percoupon" double precision,
    "coupon_usage_perx" double precision,
    "coupon_usage_peruser" double precision,
    "coupon_vender_id" integer DEFAULT '0' NOT NULL,
    "coupon_status" integer DEFAULT '0' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "coupon_code" character varying(100),
    "amount_type" integer DEFAULT '0' NOT NULL,
    "start_date" character varying(600),
    "applied_to" integer DEFAULT '0' NOT NULL,
    "minimum_amount" double precision,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "coupon_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "coupon" ("id", "coupon_title", "coupon_description", "coupon_end_date", "coupon_amount", "coupon_minimum_spend", "coupon_max_spend", "coupon_usage_percoupon", "coupon_usage_perx", "coupon_usage_peruser", "coupon_vender_id", "coupon_status", "deleted", "coupon_code", "amount_type", "start_date", "applied_to", "minimum_amount", "created_at", "updated_at") VALUES
(3,	'Test',	'Test Coupon Description',	'2025-02-20 00:00:00',	10,	NULL,	NULL,	0,	NULL,	10,	0,	1,	0,	'Test001',	1,	'2025-01-07',	3,	NULL,	'2025-01-07 08:35:56',	NULL),
(5,	'50%OFF',	'50% Discount',	'2025-03-31 00:00:00',	50,	NULL,	NULL,	10,	NULL,	10,	0,	1,	0,	'50%OFF',	2,	'2025-01-13',	1,	400,	'2025-01-13 08:33:29',	'2025-01-13 09:48:40');

DROP TABLE IF EXISTS "coupon_brand";
DROP SEQUENCE IF EXISTS coupon_brand_id_seq;
CREATE SEQUENCE coupon_brand_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."coupon_brand" (
    "id" bigint DEFAULT nextval('coupon_brand_id_seq') NOT NULL,
    "name" character varying(600),
    "image" character varying(600),
    "active" integer DEFAULT '0' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "coupon_brand_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "coupon_category";
DROP SEQUENCE IF EXISTS coupon_category_id_seq;
CREATE SEQUENCE coupon_category_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."coupon_category" (
    "id" bigint DEFAULT nextval('coupon_category_id_seq') NOT NULL,
    "coupon_id" integer DEFAULT '0' NOT NULL,
    "category_id" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "coupon_category_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "coupon_category" ("id", "coupon_id", "category_id") VALUES
(1,	4,	4),
(19,	5,	10),
(20,	5,	9),
(21,	5,	11),
(22,	5,	13);

DROP TABLE IF EXISTS "coupon_images";
DROP SEQUENCE IF EXISTS coupon_images_id_seq;
CREATE SEQUENCE coupon_images_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."coupon_images" (
    "id" bigint DEFAULT nextval('coupon_images_id_seq') NOT NULL,
    "coupon_id" integer DEFAULT '0' NOT NULL,
    "image" character varying(600),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "coupon_images_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "coupon_products";
DROP SEQUENCE IF EXISTS coupon_products_id_seq;
CREATE SEQUENCE coupon_products_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."coupon_products" (
    "id" bigint DEFAULT nextval('coupon_products_id_seq') NOT NULL,
    "coupon_id" integer DEFAULT '0' NOT NULL,
    "product_id" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "coupon_products_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "coupon_services";
DROP SEQUENCE IF EXISTS coupon_services_id_seq;
CREATE SEQUENCE coupon_services_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."coupon_services" (
    "id" bigint DEFAULT nextval('coupon_services_id_seq') NOT NULL,
    "coupon_id" integer DEFAULT '0' NOT NULL,
    "service_id" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "coupon_services_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "coupon_vendor";
DROP SEQUENCE IF EXISTS coupon_vendor_id_seq;
CREATE SEQUENCE coupon_vendor_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."coupon_vendor" (
    "id" bigint DEFAULT nextval('coupon_vendor_id_seq') NOT NULL,
    "vendor" integer DEFAULT '0' NOT NULL,
    "coupon_id" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "coupon_vendor_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "coupon_vendor" ("id", "vendor", "coupon_id", "created_at", "updated_at") VALUES
(2,	4,	2,	NULL,	NULL),
(3,	4,	3,	NULL,	NULL),
(4,	4,	1,	NULL,	NULL),
(5,	18,	4,	NULL,	NULL),
(11,	5,	5,	NULL,	NULL);

DROP TABLE IF EXISTS "coupon_vendor_service_order";
DROP SEQUENCE IF EXISTS coupon_vendor_service_order_id_seq;
CREATE SEQUENCE coupon_vendor_service_order_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."coupon_vendor_service_order" (
    "id" bigint DEFAULT nextval('coupon_vendor_service_order_id_seq') NOT NULL,
    "vendor_id" integer DEFAULT '0' NOT NULL,
    "coupon_id" integer DEFAULT '0' NOT NULL,
    "order_id" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "coupon_vendor_service_order_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "coupons";
DROP SEQUENCE IF EXISTS coupons_id_seq;
CREATE SEQUENCE coupons_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."coupons" (
    "id" bigint DEFAULT nextval('coupons_id_seq') NOT NULL,
    "title" character varying(600),
    "title_ar" character varying(600),
    "brand_id" integer DEFAULT '0' NOT NULL,
    "category_id" integer DEFAULT '0' NOT NULL,
    "coupon_code" character varying(600),
    "active" integer DEFAULT '0' NOT NULL,
    "sort_order" integer DEFAULT '0' NOT NULL,
    "trending" integer DEFAULT '0' NOT NULL,
    "hot_deal" integer DEFAULT '0' NOT NULL,
    "description" text,
    "description_ar" text,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "start_date" character varying(600),
    "coupon_end_date" character varying(600),
    CONSTRAINT "coupons_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "coupons_category";
DROP SEQUENCE IF EXISTS coupons_category_id_seq;
CREATE SEQUENCE coupons_category_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."coupons_category" (
    "id" bigint DEFAULT nextval('coupons_category_id_seq') NOT NULL,
    "name" character varying(600),
    "image" character varying(600),
    "banner_image" character varying(600),
    "parent_id" integer DEFAULT '0' NOT NULL,
    "active" integer DEFAULT '0' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "sort_order" integer DEFAULT '0' NOT NULL,
    "created_uid" integer DEFAULT '0' NOT NULL,
    "updated_uid" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "coupons_category_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "cuisines";
DROP SEQUENCE IF EXISTS cuisines_id_seq;
CREATE SEQUENCE cuisines_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."cuisines" (
    "id" bigint DEFAULT nextval('cuisines_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "status" integer DEFAULT '1' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "sort_order" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "cuisines_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "currencies";
DROP SEQUENCE IF EXISTS currencies_id_seq;
CREATE SEQUENCE currencies_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."currencies" (
    "id" bigint DEFAULT nextval('currencies_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "code" character varying(255) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "currencies_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "currencies" ("id", "name", "code", "created_at", "updated_at") VALUES
(1,	'AED',	'aed',	NULL,	NULL);

DROP TABLE IF EXISTS "custom_banners";
DROP SEQUENCE IF EXISTS custom_banners_id_seq;
CREATE SEQUENCE custom_banners_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."custom_banners" (
    "id" bigint DEFAULT nextval('custom_banners_id_seq') NOT NULL,
    "banner_title" character varying(255),
    "banner_image" text NOT NULL,
    "active" integer DEFAULT '1' NOT NULL,
    "created_by" integer DEFAULT '0' NOT NULL,
    "updated_by" integer DEFAULT '0' NOT NULL,
    "type" integer DEFAULT '1',
    "category" text,
    "product" text,
    "service" text,
    "banner_type" integer DEFAULT '1',
    "activity" integer DEFAULT '0' NOT NULL,
    "store" integer DEFAULT '0' NOT NULL,
    "url" text,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "custom_banners_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "designations";
DROP SEQUENCE IF EXISTS designations_id_seq;
CREATE SEQUENCE designations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."designations" (
    "id" bigint DEFAULT nextval('designations_id_seq') NOT NULL,
    "user_id" bigint,
    "user_type" integer DEFAULT '0' NOT NULL,
    "designation" character varying(255) NOT NULL,
    "status" smallint DEFAULT '1' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "deleted_at" timestamp(0),
    CONSTRAINT "designations_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "des_user_id" ON "public"."designations" USING btree ("user_id");


DROP TABLE IF EXISTS "event_features";
DROP SEQUENCE IF EXISTS event_features_id_seq;
CREATE SEQUENCE event_features_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."event_features" (
    "id" bigint DEFAULT nextval('event_features_id_seq') NOT NULL,
    "name" character varying(255),
    "image_path" character varying(255),
    "description" character varying(255),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "event_features_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "event_features" ("id", "name", "image_path", "description", "created_at", "updated_at") VALUES
(1,	'Test',	'1736271415677d6637b37c8.jpg',	'Small',	'2025-01-07 17:36:55',	'2025-01-07 17:36:55'),
(2,	'Location',	'1736271730677d6772a340a.png',	NULL,	'2025-01-07 17:42:10',	'2025-01-07 17:42:10'),
(3,	'Date',	'1736271812677d67c4a354b.png',	NULL,	'2025-01-07 17:43:32',	'2025-01-07 17:43:32'),
(4,	'Language',	'1736271827677d67d3d5adf.png',	NULL,	'2025-01-07 17:43:47',	'2025-01-07 17:43:47'),
(5,	'Level',	'1736271859677d67f3966b8.png',	NULL,	'2025-01-07 17:44:19',	'2025-01-07 17:44:19'),
(6,	'Includes',	'1736271888677d6810b9cca.png',	NULL,	'2025-01-07 17:44:48',	'2025-01-07 17:44:48'),
(7,	'Community',	'1736271930677d683a1998b.png',	NULL,	'2025-01-07 17:45:30',	'2025-01-07 17:45:30'),
(8,	'Certificate',	'1736271962677d685a5db15.png',	NULL,	'2025-01-07 17:46:02',	'2025-01-07 17:46:02');

DROP TABLE IF EXISTS "failed_jobs";
DROP SEQUENCE IF EXISTS failed_jobs_id_seq;
CREATE SEQUENCE failed_jobs_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."failed_jobs" (
    "id" bigint DEFAULT nextval('failed_jobs_id_seq') NOT NULL,
    "uuid" character varying(255) NOT NULL,
    "connection" text NOT NULL,
    "queue" text NOT NULL,
    "payload" text NOT NULL,
    "exception" text NOT NULL,
    "failed_at" timestamp(0) DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT "failed_jobs_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "failed_jobs_uuid_unique" UNIQUE ("uuid")
) WITH (oids = false);


DROP TABLE IF EXISTS "faq";
DROP SEQUENCE IF EXISTS faq_id_seq;
CREATE SEQUENCE faq_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."faq" (
    "id" bigint DEFAULT nextval('faq_id_seq') NOT NULL,
    "title" character varying(600),
    "description" text,
    "created_by" integer DEFAULT '0' NOT NULL,
    "updated_by" integer DEFAULT '0' NOT NULL,
    "active" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "faq_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "featured_products";
DROP SEQUENCE IF EXISTS featured_products_id_seq;
CREATE SEQUENCE featured_products_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."featured_products" (
    "id" bigint DEFAULT nextval('featured_products_id_seq') NOT NULL,
    "master_product" integer DEFAULT '0' NOT NULL,
    "description" character varying(600) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "featured_products_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "featured_products_img";
DROP SEQUENCE IF EXISTS featured_products_img_id_seq;
CREATE SEQUENCE featured_products_img_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."featured_products_img" (
    "id" bigint DEFAULT nextval('featured_products_img_id_seq') NOT NULL,
    "featured_product_id" integer DEFAULT '0' NOT NULL,
    "image" character varying(600) NOT NULL,
    CONSTRAINT "featured_products_img_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "hair_colors";
DROP SEQUENCE IF EXISTS hair_colors_id_seq;
CREATE SEQUENCE hair_colors_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hair_colors" (
    "id" bigint DEFAULT nextval('hair_colors_id_seq') NOT NULL,
    "name" character varying(255),
    "color" character varying(30) NOT NULL,
    "active" smallint DEFAULT '1' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "hair_colors_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "help";
DROP SEQUENCE IF EXISTS help_id_seq;
CREATE SEQUENCE help_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."help" (
    "id" bigint DEFAULT nextval('help_id_seq') NOT NULL,
    "title" character varying(600),
    "description" text,
    "created_by" integer DEFAULT '0' NOT NULL,
    "updated_by" integer DEFAULT '0' NOT NULL,
    "active" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "help_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "help_topics";
DROP SEQUENCE IF EXISTS help_topics_id_seq;
CREATE SEQUENCE help_topics_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."help_topics" (
    "id" bigint DEFAULT nextval('help_topics_id_seq') NOT NULL,
    "user_id" bigint NOT NULL,
    "topic" character varying(255) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "is_survey_topic" boolean DEFAULT false NOT NULL,
    CONSTRAINT "help_topics_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "help_topics" ("id", "user_id", "topic", "created_at", "updated_at", "is_survey_topic") VALUES
(1,	19,	'I''m mainly here to explore',	'2025-01-07 13:53:10',	'2025-01-07 13:53:10',	't'),
(2,	19,	'Deciding what to sell',	'2025-01-07 13:53:10',	'2025-01-07 13:53:10',	'f'),
(3,	19,	'Shop naming & branding',	'2025-01-07 13:53:10',	'2025-01-07 13:53:10',	'f'),
(4,	20,	'I want to expand my online business by selling on Handwi, too',	'2025-01-07 14:05:12',	'2025-01-07 14:05:12',	't'),
(5,	20,	'Selling online',	'2025-01-07 14:05:12',	'2025-01-07 14:05:12',	'f'),
(6,	20,	'Getting discovered in search',	'2025-01-07 14:05:12',	'2025-01-07 14:05:12',	'f'),
(7,	21,	'I want to expand my online business by selling on Handwi, too',	'2025-01-07 14:06:20',	'2025-01-07 14:06:20',	't'),
(8,	21,	'Selling online',	'2025-01-07 14:06:20',	'2025-01-07 14:06:20',	'f'),
(9,	21,	'Getting discovered in search',	'2025-01-07 14:06:20',	'2025-01-07 14:06:20',	'f'),
(10,	22,	'I''m mainly here to explore',	'2025-01-07 14:15:48',	'2025-01-07 14:15:48',	't'),
(11,	22,	'Deciding what to sell',	'2025-01-07 14:15:48',	'2025-01-07 14:15:48',	'f'),
(12,	22,	'Shop naming & branding',	'2025-01-07 14:15:48',	'2025-01-07 14:15:48',	'f'),
(13,	23,	'I''m just starting to sell for the first time ever',	'2025-01-07 15:59:19',	'2025-01-07 15:59:19',	't'),
(14,	23,	'Getting discovered in search',	'2025-01-07 15:59:19',	'2025-01-07 15:59:19',	'f'),
(15,	23,	'Packing and shipping',	'2025-01-07 15:59:19',	'2025-01-07 15:59:19',	'f'),
(16,	24,	'I''m mainly here to explore',	'2025-01-07 17:56:06',	'2025-01-07 17:56:06',	't'),
(17,	24,	'Getting discovered in search',	'2025-01-07 17:56:06',	'2025-01-07 17:56:06',	'f'),
(18,	24,	'Packing and shipping',	'2025-01-07 17:56:06',	'2025-01-07 17:56:06',	'f'),
(19,	25,	'I''m mainly here to explore',	'2025-01-07 18:03:25',	'2025-01-07 18:03:25',	't'),
(20,	25,	'Deciding what to sell',	'2025-01-07 18:03:25',	'2025-01-07 18:03:25',	'f'),
(21,	25,	'Shop naming & branding',	'2025-01-07 18:03:25',	'2025-01-07 18:03:25',	'f'),
(22,	26,	'I''m just starting to sell for the first time ever',	'2025-01-08 04:19:15',	'2025-01-08 04:19:15',	't'),
(23,	26,	'Getting discovered in search',	'2025-01-08 04:19:15',	'2025-01-08 04:19:15',	'f'),
(24,	26,	'Packing and shipping',	'2025-01-08 04:19:15',	'2025-01-08 04:19:15',	'f'),
(25,	27,	'I''m mainly here to explore',	'2025-01-08 04:42:31',	'2025-01-08 04:42:31',	't'),
(26,	27,	'Getting discovered in search',	'2025-01-08 04:42:31',	'2025-01-08 04:42:31',	'f'),
(27,	27,	'Packing and shipping',	'2025-01-08 04:42:31',	'2025-01-08 04:42:31',	'f'),
(28,	28,	'I''m just starting to sell for the first time ever',	'2025-01-08 04:45:57',	'2025-01-08 04:45:57',	't'),
(29,	28,	'Getting discovered in search',	'2025-01-08 04:45:57',	'2025-01-08 04:45:57',	'f'),
(30,	28,	'Packing and shipping',	'2025-01-08 04:45:57',	'2025-01-08 04:45:57',	'f'),
(31,	29,	'I have a business and want to sell online for the first time',	'2025-01-08 04:53:14',	'2025-01-08 04:53:14',	't'),
(32,	29,	'Deciding what to sell',	'2025-01-08 04:53:14',	'2025-01-08 04:53:14',	'f'),
(33,	29,	'Taking photos of items',	'2025-01-08 04:53:14',	'2025-01-08 04:53:14',	'f'),
(34,	29,	'Getting discovered in search',	'2025-01-08 04:53:14',	'2025-01-08 04:53:14',	'f'),
(35,	31,	'I''m just starting to sell for the first time ever',	'2025-01-08 07:21:34',	'2025-01-08 07:21:34',	't'),
(36,	32,	'I''m just starting to sell for the first time ever',	'2025-01-08 07:59:31',	'2025-01-08 07:59:31',	't'),
(37,	32,	'Deciding what to sell',	'2025-01-08 07:59:31',	'2025-01-08 07:59:31',	'f'),
(38,	32,	'Shop naming & branding',	'2025-01-08 07:59:31',	'2025-01-08 07:59:31',	'f'),
(39,	32,	'Selling online',	'2025-01-08 07:59:31',	'2025-01-08 07:59:31',	'f'),
(40,	32,	'Taking photos of items',	'2025-01-08 07:59:31',	'2025-01-08 07:59:31',	'f'),
(41,	34,	'I''m just starting to sell for the first time ever',	'2025-01-08 09:03:10',	'2025-01-08 09:03:10',	't'),
(42,	34,	'Packing and shipping',	'2025-01-08 09:03:10',	'2025-01-08 09:03:10',	'f'),
(43,	35,	'I''m just starting to sell for the first time ever',	'2025-01-08 09:22:37',	'2025-01-08 09:22:37',	't'),
(44,	36,	'I have a business and want to sell online for the first time',	'2025-01-08 09:23:10',	'2025-01-08 09:23:10',	't'),
(45,	36,	'Deciding what to sell',	'2025-01-08 09:23:10',	'2025-01-08 09:23:10',	'f'),
(46,	36,	'Taking photos of items',	'2025-01-08 09:23:10',	'2025-01-08 09:23:10',	'f'),
(47,	36,	'Getting discovered in search',	'2025-01-08 09:23:10',	'2025-01-08 09:23:10',	'f'),
(48,	37,	'I have a business and want to sell online for the first time',	'2025-01-08 10:34:31',	'2025-01-08 10:34:31',	't'),
(49,	37,	'Deciding what to sell',	'2025-01-08 10:34:31',	'2025-01-08 10:34:31',	'f'),
(50,	37,	'Shop naming & branding',	'2025-01-08 10:34:31',	'2025-01-08 10:34:31',	'f'),
(51,	39,	'I''m just starting to sell for the first time ever',	'2025-01-08 11:20:40',	'2025-01-08 11:20:40',	't'),
(52,	39,	'Selling online',	'2025-01-08 11:20:40',	'2025-01-08 11:20:40',	'f'),
(53,	39,	'Taking photos of items',	'2025-01-08 11:20:40',	'2025-01-08 11:20:40',	'f'),
(54,	40,	'I want to expand my online business by selling on Handwi, too',	'2025-01-08 14:11:19',	'2025-01-08 14:11:19',	't'),
(55,	40,	'Getting discovered in search',	'2025-01-08 14:11:19',	'2025-01-08 14:11:19',	'f'),
(56,	40,	'Packing and shipping',	'2025-01-08 14:11:19',	'2025-01-08 14:11:19',	'f'),
(57,	41,	'I have a business and want to sell online for the first time',	'2025-01-08 16:22:26',	'2025-01-08 16:22:26',	't'),
(58,	41,	'Selling online',	'2025-01-08 16:22:26',	'2025-01-08 16:22:26',	'f'),
(59,	41,	'Taking photos of items',	'2025-01-08 16:22:26',	'2025-01-08 16:22:26',	'f'),
(60,	42,	'I''m just starting to sell for the first time ever',	'2025-01-08 16:31:25',	'2025-01-08 16:31:25',	't'),
(61,	42,	'Selling online',	'2025-01-08 16:31:25',	'2025-01-08 16:31:25',	'f'),
(62,	42,	'Taking photos of items',	'2025-01-08 16:31:25',	'2025-01-08 16:31:25',	'f'),
(63,	43,	'I''m just starting to sell for the first time ever',	'2025-01-09 07:46:10',	'2025-01-09 07:46:10',	't'),
(64,	43,	'Deciding what to sell',	'2025-01-09 07:46:10',	'2025-01-09 07:46:10',	'f'),
(65,	43,	'Shop naming & branding',	'2025-01-09 07:46:10',	'2025-01-09 07:46:10',	'f'),
(66,	43,	'Selling online',	'2025-01-09 07:46:10',	'2025-01-09 07:46:10',	'f'),
(67,	44,	'I have a business and want to sell online for the first time',	'2025-01-09 14:36:44',	'2025-01-09 14:36:44',	't'),
(68,	44,	'Deciding what to sell',	'2025-01-09 14:36:44',	'2025-01-09 14:36:44',	'f'),
(69,	44,	'Shop naming & branding',	'2025-01-09 14:36:44',	'2025-01-09 14:36:44',	'f'),
(70,	44,	'Selling online',	'2025-01-09 14:36:44',	'2025-01-09 14:36:44',	'f'),
(71,	44,	'Taking photos of items',	'2025-01-09 14:36:44',	'2025-01-09 14:36:44',	'f'),
(72,	45,	'I want to expand my online business by selling on Handwi, too',	'2025-01-09 14:51:52',	'2025-01-09 14:51:52',	't'),
(73,	45,	'Deciding what to sell',	'2025-01-09 14:51:52',	'2025-01-09 14:51:52',	'f'),
(74,	45,	'Shop naming & branding',	'2025-01-09 14:51:52',	'2025-01-09 14:51:52',	'f'),
(75,	45,	'Selling online',	'2025-01-09 14:51:52',	'2025-01-09 14:51:52',	'f'),
(76,	45,	'Taking photos of items',	'2025-01-09 14:51:52',	'2025-01-09 14:51:52',	'f'),
(77,	46,	'I''m just starting to sell for the first time ever',	'2025-01-09 15:14:47',	'2025-01-09 15:14:47',	't'),
(78,	46,	'Deciding what to sell',	'2025-01-09 15:14:47',	'2025-01-09 15:14:47',	'f'),
(79,	46,	'Shop naming & branding',	'2025-01-09 15:14:47',	'2025-01-09 15:14:47',	'f'),
(80,	46,	'Selling online',	'2025-01-09 15:14:47',	'2025-01-09 15:14:47',	'f'),
(81,	46,	'Taking photos of items',	'2025-01-09 15:14:47',	'2025-01-09 15:14:47',	'f'),
(82,	47,	'I have a business and want to sell online for the first time',	'2025-01-10 06:17:33',	'2025-01-10 06:17:33',	't'),
(83,	47,	'Deciding what to sell',	'2025-01-10 06:17:33',	'2025-01-10 06:17:33',	'f'),
(84,	47,	'Shop naming & branding',	'2025-01-10 06:17:33',	'2025-01-10 06:17:33',	'f'),
(85,	47,	'Taking photos of items',	'2025-01-10 06:17:33',	'2025-01-10 06:17:33',	'f'),
(86,	48,	'I have a business and want to sell online for the first time',	'2025-01-10 06:50:05',	'2025-01-10 06:50:05',	't'),
(87,	48,	'Deciding what to sell',	'2025-01-10 06:50:05',	'2025-01-10 06:50:05',	'f'),
(88,	48,	'Shop naming & branding',	'2025-01-10 06:50:05',	'2025-01-10 06:50:05',	'f'),
(89,	48,	'Selling online',	'2025-01-10 06:50:05',	'2025-01-10 06:50:05',	'f'),
(90,	48,	'Taking photos of items',	'2025-01-10 06:50:05',	'2025-01-10 06:50:05',	'f'),
(91,	49,	'I have a business and want to sell online for the first time',	'2025-01-10 06:50:05',	'2025-01-10 06:50:05',	't'),
(92,	49,	'Deciding what to sell',	'2025-01-10 06:50:05',	'2025-01-10 06:50:05',	'f'),
(93,	49,	'Shop naming & branding',	'2025-01-10 06:50:05',	'2025-01-10 06:50:05',	'f'),
(94,	49,	'Selling online',	'2025-01-10 06:50:05',	'2025-01-10 06:50:05',	'f'),
(95,	49,	'Taking photos of items',	'2025-01-10 06:50:05',	'2025-01-10 06:50:05',	'f'),
(96,	50,	'I have a business and want to sell online for the first time',	'2025-01-10 09:10:30',	'2025-01-10 09:10:30',	't'),
(97,	50,	'Deciding what to sell',	'2025-01-10 09:10:30',	'2025-01-10 09:10:30',	'f'),
(98,	50,	'Selling online',	'2025-01-10 09:10:30',	'2025-01-10 09:10:30',	'f'),
(99,	50,	'Getting discovered in search',	'2025-01-10 09:10:30',	'2025-01-10 09:10:30',	'f'),
(100,	50,	'Pricing items',	'2025-01-10 09:10:30',	'2025-01-10 09:10:30',	'f'),
(101,	51,	'I want to expand my online business by selling on Handwi, too',	'2025-01-10 09:27:35',	'2025-01-10 09:27:35',	't'),
(102,	51,	'Deciding what to sell',	'2025-01-10 09:27:35',	'2025-01-10 09:27:35',	'f'),
(103,	51,	'Shop naming & branding',	'2025-01-10 09:27:35',	'2025-01-10 09:27:35',	'f'),
(104,	51,	'Selling online',	'2025-01-10 09:27:35',	'2025-01-10 09:27:35',	'f'),
(105,	51,	'Taking photos of items',	'2025-01-10 09:27:35',	'2025-01-10 09:27:35',	'f'),
(106,	51,	'Getting discovered in search',	'2025-01-10 09:27:35',	'2025-01-10 09:27:35',	'f'),
(107,	51,	'Packing and shipping',	'2025-01-10 09:27:35',	'2025-01-10 09:27:35',	'f'),
(108,	52,	'I want to expand my online business by selling on Handwi, too',	'2025-01-10 09:31:55',	'2025-01-10 09:31:55',	't'),
(109,	52,	'Selling online',	'2025-01-10 09:31:55',	'2025-01-10 09:31:55',	'f'),
(110,	52,	'Taking photos of items',	'2025-01-10 09:31:55',	'2025-01-10 09:31:55',	'f'),
(111,	52,	'Getting discovered in search',	'2025-01-10 09:31:55',	'2025-01-10 09:31:55',	'f'),
(112,	52,	'Packing and shipping',	'2025-01-10 09:31:55',	'2025-01-10 09:31:55',	'f'),
(113,	53,	'I have a business and want to sell online for the first time',	'2025-01-10 13:48:26',	'2025-01-10 13:48:26',	't'),
(114,	53,	'Deciding what to sell',	'2025-01-10 13:48:26',	'2025-01-10 13:48:26',	'f'),
(115,	53,	'Shop naming & branding',	'2025-01-10 13:48:26',	'2025-01-10 13:48:26',	'f'),
(116,	54,	'I''m just starting to sell for the first time ever',	'2025-01-10 15:09:05',	'2025-01-10 15:09:05',	't'),
(117,	54,	'Deciding what to sell',	'2025-01-10 15:09:05',	'2025-01-10 15:09:05',	'f'),
(118,	54,	'Selling online',	'2025-01-10 15:09:05',	'2025-01-10 15:09:05',	'f'),
(119,	56,	'I have a business and want to sell online for the first time',	'2025-01-15 05:06:00',	'2025-01-15 05:06:00',	't'),
(120,	56,	'Deciding what to sell',	'2025-01-15 05:06:00',	'2025-01-15 05:06:00',	'f'),
(121,	56,	'Taking photos of items',	'2025-01-15 05:06:00',	'2025-01-15 05:06:00',	'f'),
(122,	56,	'Getting discovered in search',	'2025-01-15 05:06:00',	'2025-01-15 05:06:00',	'f'),
(123,	56,	'Pricing items',	'2025-01-15 05:06:00',	'2025-01-15 05:06:00',	'f'),
(124,	59,	'I''m just starting to sell for the first time ever',	'2025-01-15 09:35:38',	'2025-01-15 09:35:38',	't'),
(125,	59,	'Deciding what to sell',	'2025-01-15 09:35:38',	'2025-01-15 09:35:38',	'f'),
(126,	62,	'I''m just starting to sell for the first time ever',	'2025-01-17 14:59:51',	'2025-01-17 14:59:51',	't'),
(127,	62,	'Deciding what to sell',	'2025-01-17 14:59:51',	'2025-01-17 14:59:51',	'f'),
(128,	63,	'I''m just starting to sell for the first time ever',	'2025-01-17 15:42:07',	'2025-01-17 15:42:07',	't'),
(129,	63,	'Shop naming & branding',	'2025-01-17 15:42:07',	'2025-01-17 15:42:07',	'f'),
(130,	64,	'I''m just starting to sell for the first time ever',	'2025-01-18 16:32:17',	'2025-01-18 16:32:17',	't'),
(131,	64,	'Selling online',	'2025-01-18 16:32:17',	'2025-01-18 16:32:17',	'f'),
(132,	65,	'I have a business and want to sell online for the first time',	'2025-01-24 06:50:42',	'2025-01-24 06:50:42',	't'),
(133,	65,	'Selling online',	'2025-01-24 06:50:42',	'2025-01-24 06:50:42',	'f'),
(134,	65,	'Taking photos of items',	'2025-01-24 06:50:42',	'2025-01-24 06:50:42',	'f'),
(135,	65,	'Getting discovered in search',	'2025-01-24 06:50:42',	'2025-01-24 06:50:42',	'f');

DROP TABLE IF EXISTS "home_logos";
DROP SEQUENCE IF EXISTS home_logos_id_seq;
CREATE SEQUENCE home_logos_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."home_logos" (
    "id" bigint DEFAULT nextval('home_logos_id_seq') NOT NULL,
    "image" character varying(255) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "deleted" integer DEFAULT '0' NOT NULL,
    "active" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "home_logos_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "home_logos" ("id", "image", "created_at", "updated_at", "deleted", "active") VALUES
(1,	'1736344208brandlogo1.png',	'2025-01-08 13:50:08',	NULL,	0,	1),
(2,	'1736344231brandlogo2.png',	'2025-01-08 13:50:31',	NULL,	0,	1),
(3,	'1736344244brandlogo3.png',	'2025-01-08 13:50:44',	NULL,	0,	1),
(4,	'1736344258brandlogo4.png',	'2025-01-08 13:50:58',	NULL,	0,	1),
(5,	'1736344272brandlogo5.png',	'2025-01-08 13:51:12',	NULL,	0,	1),
(6,	'1736344284brandlogo6.png',	'2025-01-08 13:51:24',	NULL,	0,	1),
(7,	'1736344297brandlogo7.png',	'2025-01-08 13:51:37',	NULL,	0,	1);

DROP TABLE IF EXISTS "hourly_rate";
DROP SEQUENCE IF EXISTS hourly_rate_id_seq;
CREATE SEQUENCE hourly_rate_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."hourly_rate" (
    "id" bigint DEFAULT nextval('hourly_rate_id_seq') NOT NULL,
    "text" character varying(600),
    "hourly_rate" double precision DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "service_id" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "hourly_rate_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "hourly_rate" ("id", "text", "hourly_rate", "created_at", "updated_at", "service_id") VALUES
(1,	'1',	10,	'2025-01-07 08:21:16',	'2025-01-07 08:21:16',	1);

DROP TABLE IF EXISTS "industry_types";
DROP SEQUENCE IF EXISTS industry_types_id_seq;
CREATE SEQUENCE industry_types_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."industry_types" (
    "id" bigint DEFAULT nextval('industry_types_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "active" integer DEFAULT '1' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "sort_order" integer DEFAULT '0' NOT NULL,
    "created_uid" integer NOT NULL,
    "updated_uid" integer,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "industry_types_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "landing_page_settings";
DROP SEQUENCE IF EXISTS landing_page_settings_id_seq;
CREATE SEQUENCE landing_page_settings_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."landing_page_settings" (
    "id" bigint DEFAULT nextval('landing_page_settings_id_seq') NOT NULL,
    "meta_key" character varying(255) NOT NULL,
    "meta_value" text,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "landing_page_settings_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "landing_page_settings" ("id", "meta_key", "meta_value", "created_at", "updated_at") VALUES
(1,	'banner_title',	'Handmade with Heart, <br> Delivered with Care.',	'2025-01-06 07:18:40',	'2025-01-06 07:18:40'),
(2,	'banner_description',	'<p>Crafting Connections, One Handmade <br />Treasure at a Time.</p>',	'2025-01-06 07:18:40',	'2025-01-06 07:18:40'),
(3,	'shipping_title',	'Free Shipping &amp; Return',	'2025-01-06 07:18:40',	'2025-01-06 07:18:40'),
(4,	'shipping_description',	'<p>Free shipping on all US orders</p>',	'2025-01-06 07:18:40',	'2025-01-06 07:18:40'),
(5,	'money_title',	'Money Guarantee',	'2025-01-06 07:18:40',	'2025-01-06 07:18:40'),
(6,	'money_description',	'<p>30 days money back guarantee</p>',	'2025-01-06 07:18:40',	'2025-01-06 07:18:40'),
(7,	'support_title',	'Online Support',	'2025-01-06 07:18:40',	'2025-01-06 07:18:40'),
(8,	'support_description',	'<p>We support online 24/7 on day</p>',	'2025-01-06 07:18:40',	'2025-01-06 07:18:40'),
(9,	'payment_title',	'Payment Security',	'2025-01-06 07:18:40',	'2025-01-06 07:18:40'),
(10,	'payment_description',	'<p>More than 8 different secure</p>',	'2025-01-06 07:18:40',	'2025-01-06 07:18:40'),
(11,	'sale_section_1_title',	'NEW COLLECTION',	'2025-01-06 07:18:40',	'2025-01-06 07:18:40'),
(12,	'sale_section_1_description',	'<p>STREETSTYLE</p>',	'2025-01-06 07:18:40',	'2025-01-06 07:18:40'),
(13,	'sale_section_1_button_text',	'Shop now',	'2025-01-06 07:18:40',	'2025-01-06 07:18:40'),
(14,	'sale_section_2_title',	'SUMMER SALE OFFERS',	'2025-01-06 07:18:40',	'2025-01-06 07:18:40'),
(15,	'sale_section_2_description',	'<p>70% OFF</p>',	'2025-01-06 07:18:40',	'2025-01-06 07:18:40'),
(16,	'sale_section_2_button_text',	'Shop the collection',	'2025-01-06 07:18:40',	'2025-01-06 07:18:40'),
(18,	'best_seller_subtitle',	'TOP SALE IN THIS WEEK',	'2025-01-06 07:18:41',	'2025-01-06 07:18:41'),
(21,	'banner_image',	'https://dxbitprojects.com/handwi/public/uploads/landing_page_images/1736147921_051504500003.jpg',	'2025-01-06 07:18:41',	'2025-01-06 07:18:41'),
(22,	'sale_section_1_image',	'https://dxbitprojects.com/handwi/public/uploads/landing_page_images/1736147921_demo1-banner4.webp',	'2025-01-06 07:18:41',	'2025-01-06 07:18:41'),
(23,	'sale_section_2_image',	'https://dxbitprojects.com/handwi/public/uploads/landing_page_images/1736147921_demo1-banner5.webp',	'2025-01-06 07:18:41',	'2025-01-06 07:18:41'),
(17,	'best_seller_title',	'TRENDING NOW',	'2025-01-06 07:18:40',	'2025-01-15 10:32:43'),
(19,	'latest_title',	'NEW ARRIVAL',	'2025-01-06 07:18:41',	'2025-01-15 10:32:43'),
(20,	'latest_subtitle',	'SHOP THE LATEST',	'2025-01-06 07:18:41',	'2025-01-15 10:32:43'),
(24,	'for_you_title',	'FOR YOU',	'2025-01-15 11:57:40',	'2025-01-15 11:57:40'),
(25,	'for_you_subtitle',	'SHOP THE LATEST',	'2025-01-15 11:57:40',	'2025-01-15 11:57:40');

DROP TABLE IF EXISTS "likes";
DROP SEQUENCE IF EXISTS likes_id_seq;
CREATE SEQUENCE likes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."likes" (
    "id" bigint DEFAULT nextval('likes_id_seq') NOT NULL,
    "user_id" integer DEFAULT '0' NOT NULL,
    "product_id" integer DEFAULT '0' NOT NULL,
    "vendor_id" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "likes_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "likes" ("id", "user_id", "product_id", "vendor_id", "created_at", "updated_at") VALUES
(12,	13,	21,	0,	'2025-01-10 18:16:30',	'2025-01-10 18:16:30'),
(19,	33,	31,	0,	'2025-01-10 20:59:49',	'2025-01-10 20:59:49'),
(21,	33,	30,	0,	'2025-01-10 21:13:34',	'2025-01-10 21:13:34'),
(23,	33,	25,	0,	'2025-01-10 21:18:14',	'2025-01-10 21:18:14'),
(26,	33,	15,	0,	'2025-01-10 21:24:34',	'2025-01-10 21:24:34'),
(28,	33,	14,	0,	'2025-01-10 21:35:41',	'2025-01-10 21:35:41'),
(30,	33,	29,	0,	'2025-01-10 21:36:40',	'2025-01-10 21:36:40'),
(31,	33,	16,	0,	'2025-01-10 21:36:42',	'2025-01-10 21:36:42'),
(32,	33,	28,	0,	'2025-01-10 21:46:25',	'2025-01-10 21:46:25'),
(39,	15,	2,	0,	'2025-01-11 10:19:04',	'2025-01-11 10:19:04'),
(40,	15,	16,	0,	'2025-01-11 10:19:15',	'2025-01-11 10:19:15'),
(41,	15,	0,	50,	'2025-01-13 12:33:53',	'2025-01-13 12:33:53'),
(44,	33,	0,	17,	'2025-01-13 22:01:57',	'2025-01-13 22:01:57'),
(46,	15,	0,	17,	'2025-01-14 10:40:57',	'2025-01-14 10:40:57'),
(47,	9,	0,	17,	'2025-01-14 10:50:38',	'2025-01-14 10:50:38'),
(48,	58,	28,	0,	'2025-01-15 09:25:41',	'2025-01-15 09:25:41'),
(49,	58,	29,	0,	'2025-01-15 09:25:43',	'2025-01-15 09:25:43'),
(50,	58,	0,	30,	'2025-01-15 09:28:48',	'2025-01-15 09:28:48'),
(51,	14,	0,	5,	'2025-01-15 13:02:49',	'2025-01-15 13:02:49'),
(52,	14,	0,	30,	'2025-01-15 15:29:46',	'2025-01-15 15:29:46'),
(53,	14,	38,	0,	'2025-01-15 15:35:07',	'2025-01-15 15:35:07'),
(54,	14,	33,	0,	'2025-01-15 15:35:32',	'2025-01-15 15:35:32'),
(55,	14,	32,	0,	'2025-01-15 15:35:36',	'2025-01-15 15:35:36');

DROP TABLE IF EXISTS "main_category";
DROP SEQUENCE IF EXISTS main_category_id_seq;
CREATE SEQUENCE main_category_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."main_category" (
    "id" bigint DEFAULT nextval('main_category_id_seq') NOT NULL,
    "name" character varying(255),
    "sub_title" character varying(255),
    "image" character varying(255),
    "button_link" character varying(255),
    "deleted" integer DEFAULT '0' NOT NULL,
    "active" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "banner_image" character varying(255),
    CONSTRAINT "main_category_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "main_category" ("id", "name", "sub_title", "image", "button_link", "deleted", "active", "created_at", "updated_at", "banner_image") VALUES
(2,	'Handmade',	'CHILL TO THE MAX',	'/uploads/category/67865637495f6_1736857143.jpg',	'https://dxbitprojects.com/handwi/public/handmade',	0,	1,	'2025-01-09 09:09:27',	'2025-01-14 13:29:45',	'/uploads/category/678666c936a16_1736861385.jpg'),
(3,	'Workshop',	'BE THE MOST YOU',	'/uploads/category/67865beb765f4_1736858603.jpg',	'https://dxbitprojects.com/handwi/public/workshops',	0,	1,	'2025-01-09 09:11:19',	'2025-01-14 13:37:59',	'/uploads/category/678668b78b34d_1736861879.jpg'),
(1,	'Gifts',	'AHEAD OF THE TREND',	'/uploads/category/67865c3b86989_1736858683.jpg',	'https://dxbitprojects.com/handwi/public/gifts',	0,	1,	'2025-01-09 09:07:43',	'2025-01-14 13:38:14',	'/uploads/category/678668c63a0c8_1736861894.jpg');

DROP TABLE IF EXISTS "maintainance";
DROP SEQUENCE IF EXISTS maintainance_id_seq;
CREATE SEQUENCE maintainance_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."maintainance" (
    "id" bigint DEFAULT nextval('maintainance_id_seq') NOT NULL,
    "title" character varying(255),
    "description" character varying(255),
    "building_type" integer,
    "file" character varying(255),
    "deleted" integer,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "user_id" integer,
    "status" integer,
    "price" double precision,
    "qoutation_file" character varying(255),
    "transaction_id" character varying(255),
    "payment_ref" character varying(255),
    CONSTRAINT "maintainance_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "migrations";
DROP SEQUENCE IF EXISTS migrations_id_seq;
CREATE SEQUENCE migrations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."migrations" (
    "id" integer DEFAULT nextval('migrations_id_seq') NOT NULL,
    "migration" character varying(255) NOT NULL,
    "batch" integer NOT NULL,
    CONSTRAINT "migrations_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "migrations" ("id", "migration", "batch") VALUES
(1,	'0000_00_00_000000_create_websockets_statistics_entries_table',	1),
(2,	'2014_10_12_000000_create_users_table',	1),
(3,	'2014_10_12_100000_create_password_resets_table',	1),
(4,	'2019_08_19_000000_create_failed_jobs_table',	1),
(5,	'2019_12_14_000001_create_personal_access_tokens_table',	1),
(6,	'2022_07_22_072324_create_country_models_table',	1),
(7,	'2022_07_28_095424_create_category_table',	1),
(8,	'2022_07_29_113349_create_products_table',	1),
(9,	'2022_07_29_115922_create_product_attributes_table',	1),
(10,	'2022_07_29_121226_create_product_images_table',	1),
(11,	'2022_08_01_044301_add_deleted_to_country_table',	1),
(12,	'2022_08_01_052546_create_industry_types_table',	1),
(13,	'2022_08_01_072954_create_attributes_table',	1),
(14,	'2022_08_01_081612_create_attribute_type_table',	1),
(15,	'2022_08_01_105755_create_attribute_values_table',	1),
(16,	'2022_08_03_162220_create_users_role_table',	1),
(17,	'2022_08_04_085250_create_states_table',	1),
(18,	'2022_08_04_085323_create_cities_table',	1),
(19,	'2022_08_04_102446_create_stores_table',	1),
(20,	'2022_08_04_153341_update_users_table',	1),
(21,	'2022_08_05_041320_create_vendor_details',	1),
(22,	'2022_08_05_044559_create_bank_details',	1),
(23,	'2022_08_05_055145_create_store_images_table',	1),
(24,	'2022_08_05_162828_add_active_to_users',	1),
(25,	'2022_08_05_165055_add_deleted_to_users',	1),
(26,	'2022_08_06_042655_add_industry_type_to_vendor_details',	1),
(27,	'2022_08_06_052804_update_vendor_details_table',	1),
(28,	'2022_08_06_053808_alter_table_vendor_details_change_chamber_of_commerce_doc',	1),
(29,	'2022_08_06_071210_alter_product_attribute_add_extra',	1),
(30,	'2022_08_06_072956_alter_product_images_add_attribute_id',	1),
(31,	'2022_08_06_155049_update_bank_details_table',	1),
(32,	'2022_08_10_034617_alter_table_vendor_details_change_homedelivery',	1),
(33,	'2022_08_10_153155_create_app_banners',	1),
(34,	'2022_08_11_065227_create_articles',	1),
(35,	'2022_08_11_071259_create_faq',	1),
(36,	'2022_08_11_162220_create_bank',	1),
(37,	'2022_08_14_152538_create_contact_us_settings',	1),
(38,	'2022_08_14_154810_create_settings',	1),
(39,	'2022_08_14_160604_create_notifications',	1),
(40,	'2022_08_16_151905_create_product',	1),
(41,	'2022_08_16_160300_add_display_name_to_users',	1),
(42,	'2022_08_16_160422_add_business_name_to_users',	1),
(43,	'2022_08_16_163007_create_product_attribute',	1),
(44,	'2022_08_16_163708_create_product_attribute_values',	1),
(45,	'2022_08_17_105931_create_product_category',	1),
(46,	'2022_08_17_111528_drop_product_attributes',	1),
(47,	'2022_08_17_113326_create_product_selected_attribute_list',	1),
(48,	'2022_08_17_114730_create_product_docs',	1),
(49,	'2022_08_17_143257_create_order_products',	1),
(50,	'2022_08_17_144802_create_product_specifications',	1),
(51,	'2022_08_17_145318_create_product_variations',	1),
(52,	'2022_08_19_041937_create_brand',	1),
(53,	'2022_08_19_042907_add_deleted_to_brand',	1),
(54,	'2022_08_19_103034_alter_table_product_attribute_change_attribute_type',	1),
(55,	'2022_08_19_103645_alter_table_product_attribute_change_is_deleted',	1),
(56,	'2022_08_19_121718_alter_table_product_attribute_values_change_attribute_value_color',	1),
(57,	'2022_08_19_121948_alter_table_product_attribute_values_change_attribute_value_label',	1),
(58,	'2022_08_19_124250_create_product_selected_attributes_table',	1),
(59,	'2022_08_20_050413_add_brand_to_product',	1),
(60,	'2022_08_23_124030_create_bank_code_types',	1),
(61,	'2022_08_24_035518_create_store_managers_types',	1),
(62,	'2022_08_24_081624_add_columns_to_users_table',	1),
(63,	'2022_08_25_093923_create_posts_table',	1),
(64,	'2022_08_25_102809_create_post_users_table',	1),
(65,	'2022_08_26_075605_create_post_likes_table',	1),
(66,	'2022_08_26_083919_create_post_comments_table',	1),
(67,	'2022_08_26_094609_create_comment_taged_users_table',	1),
(68,	'2022_08_26_120123_alter_post_commets_add_extra',	1),
(69,	'2022_08_26_131152_create_comment_likes_table',	1),
(70,	'2022_08_27_182018_add_store_id_to_product',	1),
(71,	'2022_08_29_020455_add_vendor_to_users',	1),
(72,	'2022_08_30_023652_add_commission_to_stores',	1),
(73,	'2022_08_30_035602_create_store_likes_table',	1),
(74,	'2022_08_30_035706_create_product_likes_table',	1),
(75,	'2022_08_30_053123_create_user_follows_table',	1),
(76,	'2022_08_30_083554_add_vendor_id_column_to_store_managers_types',	1),
(77,	'2022_08_30_110300_alter_user_add_about_me',	1),
(78,	'2022_08_30_113554_alter_post_add_post_status',	1),
(79,	'2022_08_31_175858_add_verified_to_users',	1),
(80,	'2022_09_02_042305_create_amount_type',	1),
(81,	'2022_09_02_070349_create_designation_table',	1),
(82,	'2022_09_02_105714_add_columns_to_user_table',	1),
(83,	'2022_09_02_151343_create_coupon_category',	1),
(84,	'2022_09_02_162532_create_user_privileges_table',	1),
(85,	'2022_09_03_060222_create_product_temp_image',	1),
(86,	'2022_09_03_093842_alter_product_attribute_change_attribute_type',	1),
(87,	'2022_09_04_035948_create_admin_designation',	1),
(88,	'2022_09_04_144626_create_cart_table',	1),
(89,	'2022_09_05_073828_add_tax_percentage_to_settings_table',	1),
(90,	'2022_09_05_094102_remove_unique_phone_from_users_table',	1),
(91,	'2022_09_06_011715_create_orders',	1),
(92,	'2022_09_08_010349_create_user_adresses_table',	1),
(93,	'2022_09_08_024755_create_temp_order_products_table',	1),
(94,	'2022_09_08_024821_create_temp_orders_table',	1),
(95,	'2022_09_08_035231_alter_order_products',	1),
(96,	'2022_09_08_042318_create_payment_report_table',	1),
(97,	'2022_09_12_124711_drop_amount_type',	1),
(98,	'2022_09_12_124846_amount_type',	1),
(99,	'2022_09_13_043222_create_moda_main_categories_table',	1),
(100,	'2022_09_13_043731_create_moda_sub_categories_table',	1),
(101,	'2022_09_13_063112_create_hair_colors_table',	1),
(102,	'2022_09_13_063148_create_skin_colors_table',	1),
(103,	'2022_09_13_094928_alter_product_add_moda_categories',	1),
(104,	'2022_09_13_100148_alter_users_add_extra',	1),
(105,	'2022_09_14_052904_create_store_type_table',	1),
(106,	'2022_09_14_072323_create_wallet_histories_table',	1),
(107,	'2022_09_14_072738_alter_users_add_wallet_amount',	1),
(108,	'2022_09_14_102301_create_my_moda_table',	1),
(109,	'2022_09_14_104738_create_my_moda_items_table',	1),
(110,	'2022_09_16_045220_create_post_saves_table',	1),
(111,	'2022_09_17_060127_alter_posts_add_visibity',	1),
(112,	'2022_09_19_041614_add_password_reset_code',	1),
(113,	'2022_09_19_132546_create_help_table',	1),
(114,	'2022_09_19_141934_add_land_mark',	1),
(115,	'2022_09_20_094958_add_size_chart',	1),
(116,	'2022_09_20_114010_add_store_type',	1),
(117,	'2022_09_21_044300_alter_table_user_privileges_change_user_privileges',	1),
(118,	'2022_09_21_063311_alter_post_add_extra_image_names',	1),
(119,	'2022_09_23_125130_alter_table_store_type_change_banner_image',	1),
(120,	'2022_09_23_135257_add_txt_location',	1),
(121,	'2022_09_24_034810_add_approve',	1),
(122,	'2022_10_10_144757_create_service_category',	1),
(123,	'2022_10_11_053449_create_service',	1),
(124,	'2022_10_22_112559_create_service_category_selected',	1),
(125,	'2022_10_22_122802_drop_category_from_service',	1),
(126,	'2022_10_25_030016_create_vendor_services_table',	1),
(127,	'2022_10_25_051258_drop_area_from_vendor_details',	1),
(128,	'2022_10_25_051355_add_area',	1),
(129,	'2022_10_27_061349_drop_coupon',	1),
(130,	'2022_10_27_062118_create_coupon',	1),
(131,	'2022_10_27_063447_create_coupon_products',	1),
(132,	'2022_10_27_071451_add_featured',	1),
(133,	'2022_10_27_102343_add_user_permissions_column',	1),
(134,	'2022_10_27_103447_add_password_reset_otp',	1),
(135,	'2022_10_28_054725_add_pharmacycommission',	1),
(136,	'2022_10_28_055919_add_featured_flag',	1),
(137,	'2022_10_29_165317_create_product_master',	1),
(138,	'2022_10_30_102118_add_master_product',	1),
(139,	'2022_10_31_070219_create_likes',	1),
(140,	'2022_10_31_072641_add_description',	1),
(141,	'2022_11_02_050059_add_location',	1),
(142,	'2022_11_02_052609_create_wallet_payment_report',	1),
(143,	'2022_11_03_064022_create_ratings',	1),
(144,	'2022_11_04_123322_create_featured_products',	1),
(145,	'2022_11_04_123438_create_featured_products_img',	1),
(146,	'2022_11_07_115737_create_cart_service',	1),
(147,	'2022_11_09_042245_add_iban',	1),
(148,	'2022_11_09_053111_create_contact_us',	1),
(149,	'2022_11_10_052857_create_temp_service_orders',	1),
(150,	'2022_11_10_053649_create_temp_service_order_items',	1),
(151,	'2022_11_10_065916_create_orders_services_items',	1),
(152,	'2022_11_10_071401_add_booking_date',	1),
(153,	'2022_11_10_072709_create_orders_services',	1),
(154,	'2022_11_10_074136_create_product_master_request',	1),
(155,	'2022_11_10_120556_add_product_type',	1),
(156,	'2022_11_10_121824_create_attribute_values_request',	1),
(157,	'2022_11_11_043038_create_coupon_services',	1),
(158,	'2022_11_11_100549_add_cover_image',	1),
(159,	'2022_11_14_045017_add_pay_method',	1),
(160,	'2022_11_17_040539_add_boxcount',	1),
(161,	'2022_11_18_122709_add_is_muted',	1),
(162,	'2022_11_19_070928_add_is_mute',	1),
(163,	'2022_11_19_090748_add_accepted_vendor',	1),
(164,	'2022_11_22_034939_add_user_type',	1),
(165,	'2022_11_22_055216_create_orders_services_rejected',	1),
(166,	'2022_11_23_044220_add_refund_method',	1),
(167,	'2022_11_25_085834_add_refund_requested',	1),
(168,	'2022_11_29_040327_add_order_no',	1),
(169,	'2022_11_29_040445_add_order_nos',	1),
(170,	'2022_12_23_113750_add_included_to_service_table',	1),
(171,	'2022_12_23_130421_add_service_user_id_to_service',	1),
(172,	'2022_12_26_091623_create_cleaning_services_table',	1),
(173,	'2022_12_27_081044_add_building_type_to_service',	1),
(174,	'2022_12_28_115650_add_service_type_to_service_table',	1),
(175,	'2022_12_28_122912_add_contract_type_to_service_table',	1),
(176,	'2023_01_04_000001_create_service_include_table',	1),
(177,	'2023_01_04_000002_create_service_type_table',	1),
(178,	'2023_01_05_000003_create_building_type_table',	1),
(179,	'2023_01_05_000004_add_active_building-type',	1),
(180,	'2023_01_05_000005_add_duration_service',	1),
(181,	'2023_01_05_000006_add_building_type_service',	1),
(182,	'2023_01_05_103804_add_time_to_service',	1),
(183,	'2023_01_06_070205_add_document_to_service',	1),
(184,	'2023_01_25_113910_create_contracting_table',	1),
(185,	'2023_01_25_113942_create_maintainance_table',	1),
(186,	'2023_01_26_071211_add_user_id_to_notification',	1),
(187,	'2023_02_02_080127_add_booking_date_to_temp_service_order',	1),
(188,	'2023_02_03_101419_change_city_id_to_building_type_id_to_cart_service',	1),
(189,	'2023_02_09_065114_create_columns_in_contracting',	1),
(190,	'2023_02_09_065153_create_columns_in_maintainance',	1),
(191,	'2023_02_15_104221_create_price_to_contracting',	1),
(192,	'2023_02_15_104241_create_price_to_maintainance',	1),
(193,	'2023_02_21_115000_add_payment_columns_to_contracting_table',	1),
(194,	'2023_02_21_131838_add_columns_to_maintainance_table',	1),
(195,	'2023_03_21_064807_add_order_id',	1),
(196,	'2023_03_23_035747_alter_service_change_description',	1),
(197,	'2023_11_24_144501_create_activity_type',	1),
(198,	'2023_11_24_150537_create_account_type',	1),
(199,	'2023_11_24_152800_add_category_activity_id_in_category',	1),
(200,	'2023_11_27_092900_add_activity_id_in_brand',	1),
(201,	'2023_11_29_084619_create_temp_users',	1),
(202,	'2023_12_05_052346_recommended',	1),
(203,	'2023_12_05_091212_add_activity_in_users',	1),
(204,	'2023_12_06_093940_hourly_rate',	1),
(205,	'2023_12_06_094342_service_id',	1),
(206,	'2023_12_06_121531_add_temp_col_in_users',	1),
(207,	'2023_12_11_052731_text',	1),
(208,	'2023_12_11_081103_add_area_id_in_user_address',	1),
(209,	'2023_12_11_083412_create_area',	1),
(210,	'2023_12_11_101852_vendor_service_timings',	1),
(211,	'2023_12_11_104030_add_street_in_user_address',	1),
(212,	'2023_12_11_135103_minimum_order_amount',	1),
(213,	'2023_12_12_094534_qty',	1),
(214,	'2023_12_13_064625_coupon_vendor',	1),
(215,	'2023_12_13_064910_coupon_id',	1),
(216,	'2023_12_13_071851_text2',	1),
(217,	'2023_12_13_072234_text3',	1),
(218,	'2023_12_14_023804_type',	1),
(219,	'2023_12_14_061742_banner_type',	1),
(220,	'2023_12_15_033117_coupon_id1',	1),
(221,	'2023_12_15_035625_read_admin',	1),
(222,	'2023_12_15_044654_coupon_vendor_service_order',	1),
(223,	'2023_12_15_045739_order_request_view',	1),
(224,	'2023_12_15_050023_orders_services_mute',	1),
(225,	'2023_12_15_062046_add_referal_code_in_users',	1),
(226,	'2023_12_16_080322_add_history_id_in_temp_orders',	1),
(227,	'2023_12_18_063400_activity',	1),
(228,	'2023_12_19_034213_accepted_vendor',	1),
(229,	'2023_12_19_135838_add_transport_website_link_in_contact_us_settings',	1),
(230,	'2023_12_20_101407_banner_image',	1),
(231,	'2023_12_20_134558_add_widthdraw_column_in_orders',	1),
(232,	'2023_12_20_141855_add_col_in_orders',	1),
(233,	'2023_12_27_093808_accepted_date',	1),
(234,	'2023_12_29_124743_add_per_cols_in_temp_orders',	1),
(235,	'2023_12_30_064915_withdraw_status',	1),
(236,	'2023_12_30_130908_vat',	1),
(237,	'2024_01_01_061043_ref_history_id',	1),
(238,	'2024_01_01_061125_ref_history_id1',	1),
(239,	'2024_01_01_064010_discount',	1),
(240,	'2024_01_01_083444_vendor_comment',	1),
(241,	'2024_01_02_033624_order_count',	1),
(242,	'2024_01_02_134206_add_activity_id_in_orders',	1),
(243,	'2024_01_04_044422_activity_id',	1),
(244,	'2024_01_06_055346_activity_id2',	1),
(245,	'2024_01_06_073218_create_dinein_details_tabel',	1),
(246,	'2024_01_06_100422_sort_order',	1),
(247,	'2024_01_09_061140_coupon_category',	1),
(248,	'2024_01_09_085036_coupon_brand',	1),
(249,	'2024_01_09_092540_coupons',	1),
(250,	'2024_01_09_115024_coupon_images',	1),
(251,	'2024_01_10_080721_add_col_in_products',	1),
(252,	'2024_01_16_095930_transport',	1),
(253,	'2024_01_17_122311_create_product_cuisins',	1),
(254,	'2024_01_22_155423_add_designation_in_users',	1),
(255,	'2024_02_06_085524_create_vendor_locations_table',	1),
(256,	'2024_02_06_130554_create_vendor_timings_table',	1),
(257,	'2024_02_07_122730_create_service_timings_table',	1),
(258,	'2024_02_13_084904_order_status_history',	1),
(259,	'2024_02_13_095213_service_order_status_history',	1),
(260,	'2024_02_15_052504_alter_add_fields_to_service',	1),
(261,	'2024_02_16_143959_add_activity_id_in_services',	1),
(262,	'2024_02_19_101458_alter_settings_add_to_settings',	1),
(263,	'2024_02_19_132115_add_order_type_in_orders',	1),
(264,	'2024_02_20_054329_alter_add_fields_to_temp_service_orders',	1),
(265,	'2024_02_20_054835_alter_add_fields_to_orders_services',	1),
(266,	'2024_02_20_061421_create_service_assigned_vendors_table',	1),
(267,	'2024_02_20_115848_alter_add_order_number_to_orders',	1),
(268,	'2024_02_20_134313_add_time_col_in_orders',	1),
(269,	'2024_02_22_051810_tesimonial',	1),
(270,	'2024_02_23_051302_admin_viewed',	1),
(271,	'2024_02_23_053722_create_promotion_banners_table',	1),
(272,	'2024_02_23_094731_create_subscribers_emails_table',	1),
(273,	'2024_02_26_143808_create_landing_page_settings_table',	1),
(274,	'2024_02_27_055419_price_label',	1),
(275,	'2024_02_27_060530_start_date',	1),
(276,	'2024_02_27_063601_sort_order2',	1),
(277,	'2024_02_29_055153_ratings_reply',	1),
(278,	'2024_03_02_033453_url',	1),
(279,	'2024_03_02_130435_url2',	1),
(280,	'2024_03_04_040737_add_categorypro',	1),
(281,	'2024_03_07_031014_delivery_charge',	1),
(282,	'2024_03_08_024704_service_charge',	1),
(283,	'2024_03_08_034030_service_charge1',	1),
(284,	'2024_03_08_035315_service_charge2',	1),
(285,	'2024_03_08_093338_alter_add_is_default_key_to_vendor_locations',	1),
(286,	'2024_03_09_062838_service_charge3',	1),
(287,	'2024_03_09_062943_service_charge4',	1),
(288,	'2024_03_19_090426_task_description1',	1),
(289,	'2024_03_19_090713_task_description2',	1),
(290,	'2024_03_20_043848_create_app_home_sections_table',	1),
(291,	'2024_03_20_075350_create_custom_banners_table',	1),
(292,	'2024_12_20_165612_create_product_items_table',	2),
(293,	'2025_01_06_065824_add_home_page_column_to_category_table',	3),
(294,	'2025_01_06_070849_add_sub_title_column_to_category_table',	4),
(295,	'2024_03_09_062943_service_dates',	5),
(296,	'2025_01_07_062618_create_help_topics_table',	6),
(297,	'2025_01_07_072131_make_phone_nullable_in_users_table',	6),
(298,	'2025_01_07_072620_add_is_survey_topic_to_help_topics_table',	6),
(299,	'2025_01_07_075530_create_currencies_table',	6),
(300,	'2025_01_07_081018_add_missing_columns_to_stores_table',	6),
(301,	'2025_01_07_120940_make_fields_nullable_in_stores_table',	6),
(302,	'2024_10_12_100000_create_event_features_table',	7),
(303,	'2024_10_12_100000_create_product_features_table',	7),
(304,	'2024_10_12_100000_create_product_product_feature_table',	7),
(305,	'2024_10_12_100000_create_service_event_feature_table',	7),
(306,	'2025_03_19_090713_product_plocies',	8),
(307,	'2025_03_19_090713_service25',	9),
(308,	'2025_01_06_191158_create_home_logos_table',	10),
(309,	'2025_01_06_191458_add_deleted_to_home_logos_table',	10),
(310,	'2025_01_06_192141_add_active_to_home_logos_table',	10),
(311,	'2025_01_07_141424_create_blogs_table',	10),
(312,	'2025_03_19_090713_event_feature_title',	11),
(313,	'2025_03_19_090713_feature_title',	11),
(314,	'2025_01_08_104625_add_tax_address_columns_to_stores_table',	12),
(315,	'2025_03_19_090713_service26',	12),
(316,	'2025_01_08_214128_add_location_to_users_table',	13),
(317,	'2025_01_09_024536_create_main_category_table',	13),
(318,	'2025_01_09_034309_create_web_banners_table',	13),
(319,	'2025_03_19_090713_product_checks',	14),
(320,	'2025_03_19_090713_category22',	15),
(321,	'2025_03_19_090713_category23',	16),
(322,	'2025_01_10_074013_add_two_factor_auth_to_users_table',	17),
(323,	'2025_01_10_074748_add_additional_fields_to_stores_table',	17),
(324,	'2025_01_10_080006_add_first_and_last_name_to_stores_table',	17),
(325,	'2025_01_10_080705_update_vendor_details_columns',	17),
(326,	'2025_03_19_090714_Banner1',	18),
(327,	'2025_01_09_034309_create_service_booking_table',	19),
(328,	'2025_03_19_090714_service_booking1',	20),
(329,	'2025_01_12_013804_add_banner_image_to_main_category_table',	21),
(330,	'2025_01_12_014459_add_is_handmade_to_category_table',	21),
(331,	'2025_01_12_234703_create_service_images_table',	22),
(332,	'2025_01_13_012752_add_feature_image_to_services_table',	22),
(333,	'2025_03_19_090714_service_booking2',	23),
(334,	'2025_01_13_092050_update_is_handmade_column_nullable_in_category_table',	24),
(335,	'2025_01_09_034309_vendor_follow',	25),
(336,	'2025_03_19_090713_product_plocies2',	25),
(337,	'2025_01_16_083825_create_wishlists_table',	26),
(338,	'2025_01_17_160835_add_name_and_email_to_ratings_table',	27),
(339,	'2024_10_31_221947_create_report_reasons_table',	28),
(340,	'2024_10_31_222021_create_reported_artists_table',	28),
(341,	'2025_01_20_203400_update_subject_nullable_in_contact_us_table',	28),
(342,	'2025_01_21_051039_add_social_fields_to_contact_us_settings_table',	28),
(343,	'2025_01_21_054129_create_aboutus_page_setting_table',	28),
(344,	'2025_02_28_222021_create_vendor_messages_table',	28),
(345,	'2025_03_19_090714_vendor_messages',	28);

DROP TABLE IF EXISTS "moda_main_categories";
DROP SEQUENCE IF EXISTS moda_main_categories_id_seq;
CREATE SEQUENCE moda_main_categories_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."moda_main_categories" (
    "id" bigint DEFAULT nextval('moda_main_categories_id_seq') NOT NULL,
    "name" character varying(255),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "moda_main_categories_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "moda_main_categories" ("id", "name", "created_at", "updated_at") VALUES
(1,	'Head',	'2024-06-27 10:45:56',	NULL),
(2,	'Upper Body',	'2024-06-27 10:45:56',	NULL),
(3,	'Lower Body',	'2024-06-27 10:45:56',	NULL),
(4,	'Footwear',	'2024-06-27 10:45:56',	NULL),
(5,	'Makeup',	'2024-06-27 10:45:56',	NULL),
(6,	'Accessories',	'2024-06-27 10:45:56',	NULL);

DROP TABLE IF EXISTS "moda_sub_categories";
DROP SEQUENCE IF EXISTS moda_sub_categories_id_seq;
CREATE SEQUENCE moda_sub_categories_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."moda_sub_categories" (
    "id" bigint DEFAULT nextval('moda_sub_categories_id_seq') NOT NULL,
    "main_category" integer NOT NULL,
    "name" character varying(255),
    "gender" integer NOT NULL,
    "image" character varying(900),
    "active" smallint DEFAULT '1' NOT NULL,
    "sort_order" integer DEFAULT '0' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "moda_sub_categories_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."moda_sub_categories"."gender" IS '1.Male,2.female';


DROP TABLE IF EXISTS "my_moda";
DROP SEQUENCE IF EXISTS my_moda_id_seq;
CREATE SEQUENCE my_moda_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."my_moda" (
    "id" bigint DEFAULT nextval('my_moda_id_seq') NOT NULL,
    "user_id" integer NOT NULL,
    "date" date NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "my_moda_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "my_moda_items";
DROP SEQUENCE IF EXISTS my_moda_items_id_seq;
CREATE SEQUENCE my_moda_items_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."my_moda_items" (
    "id" bigint DEFAULT nextval('my_moda_items_id_seq') NOT NULL,
    "my_moda_id" integer NOT NULL,
    "product_id" integer NOT NULL,
    "product_attribute_id" integer NOT NULL,
    "moda_sub_category" integer NOT NULL,
    "user_id" integer NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "my_moda_items_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "notifications";
DROP SEQUENCE IF EXISTS notifications_id_seq;
CREATE SEQUENCE notifications_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."notifications" (
    "id" bigint DEFAULT nextval('notifications_id_seq') NOT NULL,
    "description" character varying(600),
    "title" character varying(600),
    "image" character varying(600),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "user_type" integer DEFAULT '0' NOT NULL,
    "user_id" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "notifications_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "order_products";
DROP SEQUENCE IF EXISTS order_products_id_seq;
CREATE SEQUENCE order_products_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."order_products" (
    "id" bigint DEFAULT nextval('order_products_id_seq') NOT NULL,
    "order_id" integer DEFAULT '0' NOT NULL,
    "product_id" integer DEFAULT '0' NOT NULL,
    "product_attribute_id" integer DEFAULT '0' NOT NULL,
    "product_type" integer DEFAULT '0' NOT NULL,
    "quantity" integer DEFAULT '0' NOT NULL,
    "price" double precision,
    "discount" double precision,
    "total" double precision,
    "vendor_id" integer DEFAULT '0' NOT NULL,
    "order_status" integer DEFAULT '0' NOT NULL,
    "admin_commission" double precision,
    "vendor_commission" double precision,
    "shipping_charge" double precision,
    CONSTRAINT "order_products_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "order_products" ("id", "order_id", "product_id", "product_attribute_id", "product_type", "quantity", "price", "discount", "total", "vendor_id", "order_status", "admin_commission", "vendor_commission", "shipping_charge") VALUES
(1,	1,	8,	7,	2,	1,	110,	0,	110,	4,	0,	110,	0,	0),
(2,	2,	8,	7,	2,	1,	110,	0,	110,	4,	0,	110,	0,	0),
(3,	3,	3,	3,	1,	1,	359,	0,	359,	4,	0,	359,	0,	0),
(4,	4,	4,	4,	1,	1,	330,	0,	330,	4,	0,	330,	0,	0),
(30,	23,	32,	33,	0,	1,	250,	NULL,	250,	0,	0,	NULL,	NULL,	NULL),
(31,	23,	35,	36,	0,	1,	100,	NULL,	100,	0,	0,	NULL,	NULL,	NULL),
(32,	24,	34,	35,	0,	3,	300,	NULL,	900,	0,	0,	NULL,	NULL,	NULL),
(5,	5,	8,	7,	2,	2,	119,	0,	238,	4,	4,	238,	0,	0),
(6,	6,	4,	4,	1,	1,	330,	0,	330,	4,	0,	330,	0,	0),
(7,	7,	8,	7,	2,	1,	119,	0,	119,	4,	0,	119,	0,	0),
(8,	7,	5,	5,	1,	2,	250,	0,	500,	4,	0,	500,	0,	0),
(9,	8,	8,	7,	2,	1,	119,	0,	119,	4,	0,	119,	0,	0),
(10,	9,	15,	15,	1,	2,	330,	0,	660,	17,	0,	330,	330,	0),
(11,	10,	15,	15,	1,	2,	330,	0,	660,	17,	4,	330,	330,	0),
(12,	11,	17,	17,	1,	1,	4000,	0,	4000,	18,	0,	2000,	2000,	0),
(13,	11,	18,	18,	1,	1,	8000,	0,	8000,	18,	0,	4000,	4000,	0),
(14,	12,	15,	15,	1,	2,	330,	0,	660,	17,	0,	330,	330,	0),
(15,	12,	16,	16,	1,	2,	400,	0,	800,	17,	0,	400,	400,	0),
(16,	12,	14,	14,	1,	2,	650,	0,	1300,	17,	0,	650,	650,	0),
(17,	13,	20,	20,	1,	1,	7000,	0,	7000,	18,	0,	3500,	3500,	0),
(19,	15,	21,	21,	2,	6,	85,	0,	510,	17,	4,	255,	255,	0),
(18,	14,	13,	13,	1,	2,	300,	0,	600,	16,	4,	360,	240,	0),
(20,	16,	18,	18,	1,	1,	8000,	0,	8000,	18,	0,	4000,	4000,	0),
(21,	17,	33,	34,	0,	1,	250,	NULL,	250,	0,	0,	NULL,	NULL,	NULL),
(22,	17,	27,	28,	0,	1,	500,	NULL,	500,	0,	0,	NULL,	NULL,	NULL),
(23,	18,	32,	33,	0,	1,	250,	NULL,	250,	0,	0,	NULL,	NULL,	NULL),
(24,	19,	17,	17,	1,	1,	4000,	0,	4000,	18,	0,	2000,	2000,	0),
(25,	20,	15,	15,	1,	1,	330,	0,	330,	17,	4,	165,	165,	0),
(26,	20,	20,	20,	1,	2,	7000,	0,	14000,	18,	4,	7000,	7000,	0),
(27,	21,	32,	33,	0,	3,	250,	NULL,	750,	0,	3,	NULL,	NULL,	NULL),
(28,	22,	24,	25,	1,	1,	400,	0,	400,	30,	4,	240,	160,	0),
(29,	22,	38,	39,	1,	1,	1200,	0,	1200,	30,	4,	720,	480,	0),
(33,	25,	26,	27,	0,	1,	500,	NULL,	500,	0,	0,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS "order_request_view";
DROP SEQUENCE IF EXISTS order_request_view_id_seq;
CREATE SEQUENCE order_request_view_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."order_request_view" (
    "id" bigint DEFAULT nextval('order_request_view_id_seq') NOT NULL,
    "vendor" integer DEFAULT '0' NOT NULL,
    "service_order" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "order_request_view_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "order_status_history";
DROP SEQUENCE IF EXISTS order_status_history_id_seq;
CREATE SEQUENCE order_status_history_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."order_status_history" (
    "id" bigint DEFAULT nextval('order_status_history_id_seq') NOT NULL,
    "order_id" integer DEFAULT '0' NOT NULL,
    "status_id" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "order_status_history_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "order_status_history" ("id", "order_id", "status_id", "created_at", "updated_at") VALUES
(1,	5,	1,	'2025-01-07 08:09:16',	'2025-01-07 08:09:16'),
(2,	5,	2,	'2025-01-07 08:09:26',	'2025-01-07 08:09:26'),
(3,	5,	3,	'2025-01-07 08:09:34',	'2025-01-07 08:09:34'),
(4,	5,	4,	'2025-01-07 08:09:40',	'2025-01-07 08:09:40'),
(5,	10,	1,	'2025-01-07 11:01:48',	'2025-01-07 11:01:48'),
(6,	10,	2,	'2025-01-07 11:01:55',	'2025-01-07 11:01:55'),
(7,	10,	3,	'2025-01-07 11:02:00',	'2025-01-07 11:02:00'),
(8,	10,	4,	'2025-01-07 11:02:07',	'2025-01-07 11:02:07'),
(9,	15,	1,	'2025-01-09 15:55:53',	'2025-01-09 15:55:53'),
(10,	15,	2,	'2025-01-09 16:02:59',	'2025-01-09 16:02:59'),
(11,	15,	3,	'2025-01-09 16:03:10',	'2025-01-09 16:03:10'),
(12,	15,	4,	'2025-01-09 16:03:24',	'2025-01-09 16:03:24'),
(13,	14,	1,	'2025-01-11 10:24:33',	'2025-01-11 10:24:33'),
(14,	14,	2,	'2025-01-11 10:25:20',	'2025-01-11 10:25:20'),
(15,	14,	3,	'2025-01-11 10:26:21',	'2025-01-11 10:26:21'),
(16,	14,	4,	'2025-01-11 10:26:27',	'2025-01-11 10:26:27'),
(17,	20,	1,	'2025-01-14 11:59:35',	'2025-01-14 11:59:35'),
(18,	20,	2,	'2025-01-14 11:59:40',	'2025-01-14 11:59:40'),
(19,	20,	3,	'2025-01-14 11:59:45',	'2025-01-14 11:59:45'),
(20,	20,	4,	'2025-01-14 11:59:50',	'2025-01-14 11:59:50'),
(21,	21,	2,	'2025-01-14 18:39:13',	'2025-01-14 18:39:13'),
(22,	21,	3,	'2025-01-14 18:39:25',	'2025-01-14 18:39:25'),
(23,	22,	1,	'2025-01-15 09:32:18',	'2025-01-15 09:32:18'),
(24,	22,	2,	'2025-01-15 09:32:32',	'2025-01-15 09:32:32'),
(25,	22,	3,	'2025-01-15 09:32:44',	'2025-01-15 09:32:44'),
(26,	22,	4,	'2025-01-15 09:32:55',	'2025-01-15 09:32:55');

DROP TABLE IF EXISTS "orders";
DROP SEQUENCE IF EXISTS orders_order_id_seq;
CREATE SEQUENCE orders_order_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."orders" (
    "order_id" bigint DEFAULT nextval('orders_order_id_seq') NOT NULL,
    "invoice_id" character varying(100),
    "user_id" integer DEFAULT '0' NOT NULL,
    "address_id" integer DEFAULT '0' NOT NULL,
    "total" double precision DEFAULT '0',
    "vat" double precision DEFAULT '0',
    "discount" double precision DEFAULT '0',
    "grand_total" double precision DEFAULT '0',
    "payment_mode" integer DEFAULT '0' NOT NULL,
    "status" integer DEFAULT '0' NOT NULL,
    "booking_date" timestamp(0),
    "total_qty" integer DEFAULT '0' NOT NULL,
    "total_items_qty" integer DEFAULT '0' NOT NULL,
    "oder_type" integer DEFAULT '0' NOT NULL,
    "admin_commission" double precision DEFAULT '0',
    "vendor_commission" double precision DEFAULT '0',
    "shipping_charge" double precision DEFAULT '0',
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "is_muted" integer DEFAULT '0' NOT NULL,
    "refund_method" integer DEFAULT '0' NOT NULL,
    "refund_requested" integer DEFAULT '0' NOT NULL,
    "refund_requested_date" character varying(600),
    "order_no" character varying(600),
    "ref_history_id" character varying(255) DEFAULT '0',
    "ref_code" character varying(255) DEFAULT '',
    "withdraw_status" integer,
    "withdraw_request_at" timestamp(0),
    "vendor_id" character varying(255),
    "admin_commission_per" character varying(255),
    "vendor_commission_per" character varying(255),
    "admin_commission_percentage" character varying(255) DEFAULT '0',
    "vendor_commission_percentage" character varying(255) DEFAULT '0',
    "activity_id" integer DEFAULT '0',
    "order_type" integer DEFAULT '0' NOT NULL,
    "order_number" text,
    "pick_up_date" character varying(255) DEFAULT '',
    "pick_up_time" character varying(255) DEFAULT '',
    "service_charge" double precision DEFAULT '0' NOT NULL,
    CONSTRAINT "orders_pkey" PRIMARY KEY ("order_id")
) WITH (oids = false);

INSERT INTO "orders" ("order_id", "invoice_id", "user_id", "address_id", "total", "vat", "discount", "grand_total", "payment_mode", "status", "booking_date", "total_qty", "total_items_qty", "oder_type", "admin_commission", "vendor_commission", "shipping_charge", "created_at", "updated_at", "is_muted", "refund_method", "refund_requested", "refund_requested_date", "order_no", "ref_history_id", "ref_code", "withdraw_status", "withdraw_request_at", "vendor_id", "admin_commission_per", "vendor_commission_per", "admin_commission_percentage", "vendor_commission_percentage", "activity_id", "order_type", "order_number", "pick_up_date", "pick_up_time", "service_charge") VALUES
(11,	'15677d13a279d361736250274',	15,	7,	12000,	0,	6000,	6040,	2,	0,	'2025-01-07 11:44:55',	2,	2,	0,	3000,	3000,	40,	'2025-01-07 11:44:55',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	'LC2025010711',	'0',	'',	0,	NULL,	'18',	'3000',	'3000',	'50',	'50',	7,	0,	'LC2025010711',	'',	'',	0),
(1,	'9677bd27707f461736168055',	9,	2,	110,	0,	0,	110,	2,	0,	'2025-01-06 12:54:58',	1,	1,	0,	0,	110,	0,	'2025-01-06 12:54:58',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	'LC202501061',	'0',	'',	0,	NULL,	'4',	'0',	'110',	'0',	'100',	7,	0,	'LC202501061',	'',	'',	0),
(7,	'14677ce440be13b1736238144',	14,	10,	619,	0,	0,	619,	2,	0,	'2025-01-07 08:22:48',	2,	3,	0,	0,	619,	0,	'2025-01-07 08:22:48',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	'LC202501077',	'0',	'',	0,	NULL,	'4',	'0',	'619',	'0',	'100',	7,	0,	'LC202501077',	'',	'',	0),
(2,	'9677c0f48498181736183624',	9,	4,	110,	0,	0,	110,	2,	0,	'2025-01-06 17:14:02',	1,	1,	0,	0,	110,	0,	'2025-01-06 17:14:02',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	'LC202501062',	'0',	'',	0,	NULL,	'4',	'0',	'110',	'0',	'100',	7,	0,	'LC202501062',	'',	'',	0),
(3,	'9677c11db35d141736184283',	9,	4,	359,	0,	0,	359,	2,	0,	'2025-01-06 17:25:00',	1,	1,	0,	0,	359,	0,	'2025-01-06 17:25:00',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	'LC202501063',	'0',	'',	0,	NULL,	'4',	'0',	'359',	'0',	'100',	7,	0,	'LC202501063',	'',	'',	0),
(8,	'9677cec30d70ec1736240176',	9,	9,	119,	0,	11.9,	107.1,	2,	0,	'2025-01-07 08:56:33',	1,	1,	0,	0,	107,	0,	'2025-01-07 08:56:33',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	'LC202501078',	'0',	'',	0,	NULL,	'4',	'0',	'107',	'0',	'100',	7,	0,	'LC202501078',	'',	'',	0),
(21,	NULL,	1,	1,	250,	0,	0,	750,	2,	3,	NULL,	0,	0,	0,	0,	0,	0,	'2025-01-14 13:12:51',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	NULL,	'0',	'',	0,	NULL,	NULL,	NULL,	NULL,	'0',	'0',	0,	1,	'678662d32ce67',	'2025-01-14 13:12:51',	'13:12',	0),
(4,	'9677c1213cfb3b1736184339',	9,	4,	330,	0,	0,	330,	2,	0,	'2025-01-06 17:26:08',	1,	1,	0,	0,	330,	0,	'2025-01-06 17:26:08',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	'LC202501064',	'0',	'',	0,	NULL,	'4',	'0',	'330',	'0',	'100',	7,	0,	'LC202501064',	'',	'',	0),
(12,	'15677d1a8e85dda1736252046',	15,	11,	2760,	0,	0,	2785,	2,	0,	'2025-01-07 12:14:31',	3,	6,	0,	1380,	1380,	25,	'2025-01-07 12:14:31',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	'LC2025010712',	'0',	'',	0,	NULL,	'17',	'1380',	'1380',	'50',	'50',	7,	0,	'LC2025010712',	'',	'',	0),
(9,	'9677ced5c7acf01736240476',	9,	9,	660,	0,	0,	685,	2,	0,	'2025-01-07 09:01:32',	1,	2,	0,	330,	330,	25,	'2025-01-07 09:01:32',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	'LC202501079',	'0',	'',	0,	NULL,	'17',	'330',	'330',	'50',	'50',	7,	0,	'LC202501079',	'',	'',	0),
(15,	'9677e407c0829a1736327292',	9,	9,	510,	25.5,	0,	560.5,	2,	4,	'2025-01-08 09:09:00',	1,	6,	0,	255,	280,	25,	'2025-01-08 09:09:00',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	'LC2025010815',	'0',	'',	0,	NULL,	'17',	'255',	'280',	'50',	'50',	7,	0,	'LC2025010815',	'',	'',	0),
(20,	'967864fdb067a11736855515',	9,	9,	14330,	716.5,	0,	15046.5,	2,	4,	'2025-01-14 11:52:12',	2,	3,	0,	7165,	7881,	0,	'2025-01-14 11:52:12',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	'LC2025011420',	'0',	'',	0,	NULL,	'18',	'7165',	'7881',	'50',	'50',	7,	0,	'LC2025011420',	'',	'',	0),
(13,	'9677df7605bf3f1736308576',	9,	9,	7000,	350,	700,	6690,	2,	0,	'2025-01-08 03:56:34',	1,	1,	0,	3150,	3500,	40,	'2025-01-08 03:56:34',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	'LC2025010813',	'0',	'',	0,	NULL,	'18',	'3150',	'3500',	'50',	'50',	7,	0,	'LC2025010813',	'',	'',	0),
(5,	'15677cddd2a68e81736236498',	15,	7,	238,	0,	0,	238,	2,	4,	'2025-01-07 07:55:15',	1,	2,	0,	0,	238,	0,	'2025-01-07 07:55:15',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	'LC202501075',	'0',	'',	0,	NULL,	'4',	'0',	'238',	'0',	'100',	7,	0,	'LC202501075',	'',	'',	0),
(19,	'967863c44610021736850500',	9,	9,	4000,	200,	0,	4200,	2,	0,	'2025-01-14 10:28:38',	1,	1,	0,	2000,	2200,	0,	'2025-01-14 10:28:38',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	'LC2025011419',	'0',	'',	0,	NULL,	'18',	'2000',	'2200',	'50',	'50',	7,	0,	'LC2025011419',	'',	'',	0),
(6,	'15677ce391d45b31736237969',	15,	7,	330,	0,	0,	330,	2,	0,	'2025-01-07 08:19:52',	1,	1,	0,	0,	330,	0,	'2025-01-07 08:19:52',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	'LC202501076',	'0',	'',	0,	NULL,	'4',	'0',	'330',	'0',	'100',	7,	0,	'LC202501076',	'',	'',	0),
(10,	'9677cee303cd941736240688',	9,	9,	660,	0,	0,	685,	2,	4,	'2025-01-07 09:05:04',	1,	2,	0,	330,	330,	25,	'2025-01-07 09:05:04',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	'LC2025010710',	'0',	'',	0,	NULL,	'17',	'330',	'330',	'50',	'50',	7,	0,	'LC2025010710',	'',	'',	0),
(14,	'15677e14501b5d51736315984',	15,	11,	600,	30,	0,	680,	2,	4,	'2025-01-08 06:00:40',	1,	2,	0,	240,	390,	50,	'2025-01-08 06:00:40',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	'LC2025010814',	'0',	'',	0,	NULL,	'16',	'240',	'390',	'40',	'60',	7,	0,	'LC2025010814',	'',	'',	0),
(16,	'156784ffbbe6fdf1736769467',	15,	11,	8000,	400,	0,	8440,	2,	0,	'2025-01-13 11:58:05',	1,	1,	0,	4000,	4400,	40,	'2025-01-13 11:58:05',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	'LC2025011316',	'0',	'',	0,	NULL,	'18',	'4000',	'4400',	'50',	'50',	7,	0,	'LC2025011316',	'',	'',	0),
(17,	NULL,	55,	1,	750,	0,	0,	750,	2,	1,	NULL,	0,	0,	0,	0,	0,	0,	'2025-01-14 07:14:21',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	NULL,	'0',	'',	0,	NULL,	NULL,	NULL,	NULL,	'0',	'0',	0,	1,	'67860ecd5bdb7',	'2025-01-14 07:14:21',	'07:14',	0),
(18,	NULL,	55,	13,	250,	0,	0,	250,	2,	1,	NULL,	0,	0,	0,	0,	0,	0,	'2025-01-14 07:54:24',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	NULL,	'0',	'',	0,	NULL,	NULL,	NULL,	NULL,	'0',	'0',	0,	1,	'67861830aa235',	'2025-01-14 07:54:24',	'07:54',	0),
(22,	'5867877e05e64501736932869',	58,	15,	1600,	80,	0,	1680,	2,	4,	'2025-01-15 09:21:29',	2,	2,	0,	640,	1040,	0,	'2025-01-15 09:21:29',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	'LC2025011522',	'0',	'',	0,	NULL,	'30',	'640',	'1040',	'40',	'60',	7,	0,	'LC2025011522',	'',	'',	0),
(23,	NULL,	58,	15,	350,	17.5,	0,	367.5,	2,	1,	NULL,	0,	0,	0,	0,	0,	0,	'2025-01-15 09:43:58',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	NULL,	'0',	'',	0,	NULL,	NULL,	NULL,	NULL,	'0',	'0',	0,	1,	'6787835eeb2e3',	'2025-01-15 09:43:58',	'09:43',	0),
(24,	NULL,	60,	17,	300,	15,	0,	915,	2,	1,	NULL,	0,	0,	0,	0,	0,	0,	'2025-01-15 15:00:49',	'2025-01-16 04:15:12',	0,	0,	0,	NULL,	NULL,	'0',	'',	0,	NULL,	NULL,	NULL,	NULL,	'0',	'0',	0,	1,	'6787cda17a623',	'2025-01-15 15:00:49',	'15:00',	0),
(25,	NULL,	66,	18,	500,	25,	0,	525,	2,	1,	NULL,	0,	0,	0,	0,	0,	0,	'2025-01-27 11:14:37',	'2025-01-27 11:14:37',	0,	0,	0,	NULL,	NULL,	'0',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	'0',	0,	1,	'67976a9d511ae',	'2025-01-27 11:14:37',	'11:14',	0);

DROP TABLE IF EXISTS "orders_services";
DROP SEQUENCE IF EXISTS orders_services_order_id_seq;
CREATE SEQUENCE orders_services_order_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."orders_services" (
    "order_id" bigint DEFAULT nextval('orders_services_order_id_seq') NOT NULL,
    "invoice_id" character varying(600),
    "user_id" integer DEFAULT '0' NOT NULL,
    "address_id" integer DEFAULT '0' NOT NULL,
    "total" double precision,
    "vat" double precision,
    "discount" double precision,
    "grand_total" double precision,
    "payment_mode" integer DEFAULT '0' NOT NULL,
    "status" integer DEFAULT '0' NOT NULL,
    "booking_date" character varying(600),
    "admin_commission" double precision,
    "vendor_commission" double precision,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "is_mute" integer DEFAULT '0' NOT NULL,
    "refund_method" integer DEFAULT '0' NOT NULL,
    "refund_requested" integer DEFAULT '0' NOT NULL,
    "refund_accepted" integer DEFAULT '0' NOT NULL,
    "refund_requested_date" character varying(600),
    "refund_accepted_date" character varying(600),
    "order_no" character varying(600),
    "coupon_id" integer DEFAULT '0' NOT NULL,
    "coupon_vender_id" integer DEFAULT '0' NOT NULL,
    "read_admin" integer DEFAULT '0' NOT NULL,
    "accepted_vendor" integer DEFAULT '0' NOT NULL,
    "accepted_date" timestamp(0),
    "ref_history_id" integer DEFAULT '0' NOT NULL,
    "ref_code" character varying(600),
    "activity_id" integer DEFAULT '0' NOT NULL,
    "user_latitude" text,
    "user_longitude" text,
    "service_charge" double precision DEFAULT '0' NOT NULL,
    "task_description" character varying(600),
    "doc" character varying(600),
    CONSTRAINT "orders_services_pkey" PRIMARY KEY ("order_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "orders_services_items";
DROP SEQUENCE IF EXISTS orders_services_items_id_seq;
CREATE SEQUENCE orders_services_items_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."orders_services_items" (
    "id" bigint DEFAULT nextval('orders_services_items_id_seq') NOT NULL,
    "order_id" integer DEFAULT '0' NOT NULL,
    "service_id" integer DEFAULT '0' NOT NULL,
    "price" double precision,
    "discount" double precision,
    "total" double precision,
    "order_status" double precision,
    "admin_commission" double precision,
    "vendor_commission" double precision,
    "booking_date" character varying(600),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "accepted_vendor" integer DEFAULT '0' NOT NULL,
    "accepted_date" character varying(600),
    "text" character varying(600),
    "hourly_rate" double precision DEFAULT '0' NOT NULL,
    "task_description" text,
    "doc" character varying(600),
    "qty" integer DEFAULT '0' NOT NULL,
    "withdraw_status" integer DEFAULT '0' NOT NULL,
    "withdraw_request_at" timestamp(0),
    "vat" double precision DEFAULT '0' NOT NULL,
    "vendor_comment" character varying(600),
    "vendor_doc" character varying(600),
    CONSTRAINT "orders_services_items_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "orders_services_mute";
DROP SEQUENCE IF EXISTS orders_services_mute_id_seq;
CREATE SEQUENCE orders_services_mute_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."orders_services_mute" (
    "id" bigint DEFAULT nextval('orders_services_mute_id_seq') NOT NULL,
    "vendor_id" integer DEFAULT '0' NOT NULL,
    "service_order_id" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "orders_services_mute_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "orders_services_rejected";
DROP SEQUENCE IF EXISTS orders_services_rejected_id_seq;
CREATE SEQUENCE orders_services_rejected_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."orders_services_rejected" (
    "id" bigint DEFAULT nextval('orders_services_rejected_id_seq') NOT NULL,
    "vendor_id" integer DEFAULT '0' NOT NULL,
    "service_order_id" integer DEFAULT '0' NOT NULL,
    "service_order_item_id" bigint DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "orders_services_rejected_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "password_resets";
CREATE TABLE "public"."password_resets" (
    "email" character varying(255) NOT NULL,
    "token" character varying(255) NOT NULL,
    "created_at" timestamp(0)
) WITH (oids = false);

CREATE INDEX "password_resets_email_index" ON "public"."password_resets" USING btree ("email");


DROP TABLE IF EXISTS "payment_report";
DROP SEQUENCE IF EXISTS payment_report_id_seq;
CREATE SEQUENCE payment_report_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."payment_report" (
    "id" bigint DEFAULT nextval('payment_report_id_seq') NOT NULL,
    "transaction_id" character varying(255),
    "payment_status" character varying(255),
    "user_id" integer DEFAULT '0' NOT NULL,
    "ref_id" character varying(255),
    "amount" numeric(8,2) NOT NULL,
    "method_type" integer DEFAULT '1' NOT NULL,
    "vat" numeric(8,2) DEFAULT '0' NOT NULL,
    "wallet_amount_used" numeric(8,2) DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "payment_report_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "payment_report" ("id", "transaction_id", "payment_status", "user_id", "ref_id", "amount", "method_type", "vat", "wallet_amount_used", "created_at", "updated_at") VALUES
(1,	'9677bd27707f461736168055',	'A',	9,	'9677bd27707f461736168055',	110.00,	1,	0.00,	0.00,	'2025-01-06 12:54:15',	'2025-01-06 12:54:58'),
(2,	'9677c0a91e623e1736182417',	'P',	9,	'9677c0a91e623e1736182417',	110.00,	1,	0.00,	0.00,	'2025-01-06 16:53:38',	NULL),
(3,	'9677c0cb83eb8d1736182968',	'P',	9,	'9677c0cb83eb8d1736182968',	110.00,	1,	0.00,	0.00,	'2025-01-06 17:02:48',	NULL),
(4,	'9677c0f48498181736183624',	'A',	9,	'9677c0f48498181736183624',	110.00,	1,	0.00,	0.00,	'2025-01-06 17:13:44',	'2025-01-06 17:14:02'),
(5,	'9677c11db35d141736184283',	'A',	9,	'9677c11db35d141736184283',	359.00,	1,	0.00,	0.00,	'2025-01-06 17:24:43',	'2025-01-06 17:25:00'),
(6,	'9677c1213cfb3b1736184339',	'A',	9,	'9677c1213cfb3b1736184339',	330.00,	1,	0.00,	0.00,	'2025-01-06 17:25:40',	'2025-01-06 17:26:08'),
(7,	'15677cddd2a68e81736236498',	'A',	15,	'15677cddd2a68e81736236498',	238.00,	1,	0.00,	0.00,	'2025-01-07 07:54:59',	'2025-01-07 07:55:15'),
(8,	'15677ce391d45b31736237969',	'A',	15,	'15677ce391d45b31736237969',	330.00,	1,	0.00,	0.00,	'2025-01-07 08:19:30',	'2025-01-07 08:19:52'),
(9,	'14677ce40dd8fc91736238093',	'P',	14,	'14677ce40dd8fc91736238093',	619.00,	1,	0.00,	0.00,	'2025-01-07 08:21:34',	NULL),
(10,	'14677ce440be13b1736238144',	'A',	14,	'14677ce440be13b1736238144',	619.00,	1,	0.00,	0.00,	'2025-01-07 08:22:25',	'2025-01-07 08:22:48'),
(11,	'9677ce8d9dfc621736239321',	'P',	9,	'9677ce8d9dfc621736239321',	119.00,	1,	0.00,	0.00,	'2025-01-07 08:42:02',	NULL),
(12,	'9677ce94a0cf4f1736239434',	'P',	9,	'9677ce94a0cf4f1736239434',	119.00,	1,	0.00,	0.00,	'2025-01-07 08:43:54',	NULL),
(13,	'9677cec30d70ec1736240176',	'A',	9,	'9677cec30d70ec1736240176',	107.10,	1,	0.00,	0.00,	'2025-01-07 08:56:17',	'2025-01-07 08:56:33'),
(14,	'9677ced5c7acf01736240476',	'A',	9,	'9677ced5c7acf01736240476',	685.00,	1,	0.00,	0.00,	'2025-01-07 09:01:17',	'2025-01-07 09:01:32'),
(15,	'9677cee303cd941736240688',	'A',	9,	'9677cee303cd941736240688',	685.00,	1,	0.00,	0.00,	'2025-01-07 09:04:48',	'2025-01-07 09:05:04'),
(16,	'15677d138c0919f1736250252',	'P',	15,	'15677d138c0919f1736250252',	12040.00,	1,	0.00,	0.00,	'2025-01-07 11:44:12',	NULL),
(17,	'15677d13a279d361736250274',	'A',	15,	'15677d13a279d361736250274',	6040.00,	1,	0.00,	0.00,	'2025-01-07 11:44:34',	'2025-01-07 11:44:55'),
(18,	'15677d1a8e85dda1736252046',	'A',	15,	'15677d1a8e85dda1736252046',	2785.00,	1,	0.00,	0.00,	'2025-01-07 12:14:07',	'2025-01-07 12:14:31'),
(19,	'9677d20156eb7d1736253461',	'P',	9,	'9677d20156eb7d1736253461',	8040.00,	1,	0.00,	0.00,	'2025-01-07 12:37:41',	NULL),
(20,	'9677dd5699076b1736299881',	'P',	9,	'9677dd5699076b1736299881',	7440.00,	1,	0.00,	0.00,	'2025-01-08 01:31:22',	NULL),
(21,	'9677df7605bf3f1736308576',	'A',	9,	'9677df7605bf3f1736308576',	6690.00,	1,	350.00,	0.00,	'2025-01-08 03:56:16',	'2025-01-08 03:56:34'),
(22,	'15677e14501b5d51736315984',	'A',	15,	'15677e14501b5d51736315984',	680.00,	1,	30.00,	0.00,	'2025-01-08 05:59:44',	'2025-01-08 06:00:40'),
(23,	'9677e407c0829a1736327292',	'A',	9,	'9677e407c0829a1736327292',	560.50,	1,	25.50,	0.00,	'2025-01-08 09:08:12',	'2025-01-08 09:09:00'),
(24,	'156784ffbbe6fdf1736769467',	'A',	15,	'156784ffbbe6fdf1736769467',	8440.00,	1,	400.00,	0.00,	'2025-01-13 11:57:48',	'2025-01-13 11:58:05'),
(25,	'15678523943ee9d1736778644',	'P',	15,	'15678523943ee9d1736778644',	787.50,	1,	37.50,	0.00,	'2025-01-13 14:30:44',	NULL),
(26,	'15678523b6140791736778678',	'P',	15,	'15678523b6140791736778678',	1102.50,	1,	52.50,	0.00,	'2025-01-13 14:31:18',	NULL),
(27,	'15678523cc5f4821736778700',	'P',	15,	'15678523cc5f4821736778700',	945.00,	1,	45.00,	0.00,	'2025-01-13 14:31:40',	NULL),
(28,	'15678617d91898c1736841177',	'P',	15,	'15678617d91898c1736841177',	5145.00,	1,	245.00,	0.00,	'2025-01-14 07:52:57',	NULL),
(29,	'967863c44610021736850500',	'A',	9,	'967863c44610021736850500',	4200.00,	1,	200.00,	0.00,	'2025-01-14 10:28:20',	'2025-01-14 10:28:38'),
(30,	'967864fdb067a11736855515',	'A',	9,	'967864fdb067a11736855515',	15046.50,	1,	716.50,	0.00,	'2025-01-14 11:51:55',	'2025-01-14 11:52:12'),
(31,	'5867877e05e64501736932869',	'A',	58,	'5867877e05e64501736932869',	1680.00,	1,	80.00,	0.00,	'2025-01-15 09:21:10',	'2025-01-15 09:21:29');

DROP TABLE IF EXISTS "personal_access_tokens";
DROP SEQUENCE IF EXISTS personal_access_tokens_id_seq;
CREATE SEQUENCE personal_access_tokens_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."personal_access_tokens" (
    "id" bigint DEFAULT nextval('personal_access_tokens_id_seq') NOT NULL,
    "tokenable_type" character varying(255) NOT NULL,
    "tokenable_id" bigint NOT NULL,
    "name" character varying(255) NOT NULL,
    "token" character varying(64) NOT NULL,
    "abilities" text,
    "last_used_at" timestamp(0),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "personal_access_tokens_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "personal_access_tokens_token_unique" UNIQUE ("token")
) WITH (oids = false);

CREATE INDEX "personal_access_tokens_tokenable_type_tokenable_id_index" ON "public"."personal_access_tokens" USING btree ("tokenable_type", "tokenable_id");

INSERT INTO "personal_access_tokens" ("id", "tokenable_type", "tokenable_id", "name", "token", "abilities", "last_used_at", "created_at", "updated_at") VALUES
(1,	'App\Models\User',	7,	'Personal Access Token',	'015348c7de1918b7ef51982710dbd7494386afabc00f0fad35e28d1edddd2972',	'["*"]',	NULL,	'2024-11-30 05:21:25',	'2024-11-30 05:21:25'),
(2,	'App\Models\User',	7,	'Personal Access Token',	'4a40a3efb988de185539715964d6edb96af6e1850dd5e7deade36ab346fbd8ad',	'["*"]',	NULL,	'2024-11-30 05:21:26',	'2024-11-30 05:21:26'),
(3,	'App\Models\User',	7,	'Personal Access Token',	'22b672ad74ac4026a24a2aa205492dd5273445119efa1b50958fb7e4ddc47970',	'["*"]',	NULL,	'2024-11-30 05:40:35',	'2024-11-30 05:40:35'),
(4,	'App\Models\User',	7,	'Personal Access Token',	'ac29dab75cd1be2b9ce853e428eaee8570a1f82fa27f29addc2f993f7668a171',	'["*"]',	NULL,	'2024-11-30 07:58:43',	'2024-11-30 07:58:43'),
(5,	'App\Models\User',	8,	'Personal Access Token',	'fd69825cc8261218c33c93af2fe23e807792d42c7e76e82ae1f71914fd8475d1',	'["*"]',	NULL,	'2024-11-30 10:14:09',	'2024-11-30 10:14:09'),
(6,	'App\Models\User',	8,	'Personal Access Token',	'bd25d73b9e7531995bd1aa277ea8af310267a4114ee26cd2cb7bdf33e89b8bcc',	'["*"]',	NULL,	'2024-11-30 10:14:10',	'2024-11-30 10:14:10'),
(7,	'App\Models\User',	9,	'Personal Access Token',	'06019dffccbb436b84b10223b0aeacaa1fc5146efbc3d3640dfbef1f25f92b23',	'["*"]',	NULL,	'2024-11-30 11:33:34',	'2024-11-30 11:33:34'),
(8,	'App\Models\User',	9,	'Personal Access Token',	'0dcf0d7d6f870db7cf548d07dd55ac8daa19cf81823354792a90e78fcd45eb6c',	'["*"]',	NULL,	'2024-11-30 11:33:35',	'2024-11-30 11:33:35'),
(9,	'App\Models\User',	9,	'Personal Access Token',	'0168f42f9cef6df105138e9012b2970650a8b3e876a5cd4dd933dcefb641c5d7',	'["*"]',	NULL,	'2024-11-30 11:49:20',	'2024-11-30 11:49:20'),
(10,	'App\Models\User',	9,	'Personal Access Token',	'84c63355bb961147913f980657c5cc20096167244ecc6b63368ae9613c5152bd',	'["*"]',	NULL,	'2024-11-30 12:25:08',	'2024-11-30 12:25:08'),
(11,	'App\Models\User',	9,	'Personal Access Token',	'40dae69d4c7a803976c0b08bee12e24075b62f3fbaa94c151ec4c2123da1abfe',	'["*"]',	NULL,	'2024-12-02 08:35:22',	'2024-12-02 08:35:22'),
(12,	'App\Models\User',	10,	'Personal Access Token',	'870675b584608129ee1ef41e45cfe9d3bc2352e1fd343537c02d8c64c0b3d289',	'["*"]',	NULL,	'2024-12-02 09:21:57',	'2024-12-02 09:21:57'),
(13,	'App\Models\User',	10,	'Personal Access Token',	'1aa4a0cea71cf66f144c0a42cd883be3735bef35808fbdf5a7dab1bb0292b69a',	'["*"]',	NULL,	'2024-12-02 09:21:58',	'2024-12-02 09:21:58'),
(14,	'App\Models\User',	10,	'Personal Access Token',	'dc0877f8bde785ee704eba6419051c16ba70de9abd024d58159ed3ea58eed3e1',	'["*"]',	NULL,	'2024-12-02 09:22:03',	'2024-12-02 09:22:03'),
(15,	'App\Models\User',	10,	'Personal Access Token',	'f01dd28317ab608d120cf72e6391f39b48ce3cd6a6ba48301dcc4346d755b1bd',	'["*"]',	NULL,	'2024-12-02 09:23:45',	'2024-12-02 09:23:45'),
(16,	'App\Models\User',	10,	'Personal Access Token',	'92b0eb24679ddc74d37b09ccc0fe9cecdd47ead372248048e12db12b8516b4f8',	'["*"]',	NULL,	'2024-12-02 09:25:13',	'2024-12-02 09:25:13'),
(17,	'App\Models\User',	11,	'Personal Access Token',	'f2be01b540bf2974ed7d60046626efeb29312b3fe6d675abe4d8efaa61a569f3',	'["*"]',	NULL,	'2024-12-02 09:56:40',	'2024-12-02 09:56:40'),
(18,	'App\Models\User',	11,	'Personal Access Token',	'197d0bd1d6fc76e96b3ad55b914d85139b3ed81e27b47599398323381fc917df',	'["*"]',	NULL,	'2024-12-02 09:56:41',	'2024-12-02 09:56:41'),
(19,	'App\Models\User',	11,	'Personal Access Token',	'ad852278e1f32f11b740e12704fa06b219e3c5f27a6b577a44f501a1a61156eb',	'["*"]',	NULL,	'2024-12-02 10:05:29',	'2024-12-02 10:05:29'),
(20,	'App\Models\User',	9,	'Personal Access Token',	'12def0f454b209bcb8f31a8c5aa59154012fb5f96e873ca2381d96a54b6e4887',	'["*"]',	NULL,	'2024-12-02 10:08:36',	'2024-12-02 10:08:36'),
(21,	'App\Models\User',	12,	'Personal Access Token',	'c097ba8be80b6d9e6db2265e7916703baf1802cc13c5c86051a715ad00c50225',	'["*"]',	NULL,	'2024-12-02 21:48:49',	'2024-12-02 21:48:49'),
(22,	'App\Models\User',	12,	'Personal Access Token',	'3253403a852385de02aa5ee5bd925693b9a95108b215220cc133b7ca559372cf',	'["*"]',	NULL,	'2024-12-02 21:48:50',	'2024-12-02 21:48:50'),
(23,	'App\Models\User',	9,	'Personal Access Token',	'37b56bb78e3715223250930a095a73a19bf47c0af71d9dc2542124f1d9bfd2af',	'["*"]',	NULL,	'2024-12-03 15:37:06',	'2024-12-03 15:37:06'),
(24,	'App\Models\User',	2,	'Personal Access Token',	'e32a07c077afe85d31eea4b80fd5e64bc2170de52f26c594b55f21b091b4dd42',	'["*"]',	NULL,	'2024-12-20 09:08:34',	'2024-12-20 09:08:34'),
(25,	'App\Models\User',	9,	'Personal Access Token',	'f4783b1552b4b2776bbc478d7decd971f99695b64f0a427c9623dca64b793f63',	'["*"]',	NULL,	'2024-12-20 09:10:06',	'2024-12-20 09:10:06'),
(26,	'App\Models\User',	2,	'Personal Access Token',	'd49d31bafcd4bdbab23f94dd2e72306268c143f65bf22671a0e395e718d3db35',	'["*"]',	NULL,	'2024-12-20 09:17:09',	'2024-12-20 09:17:09'),
(27,	'App\Models\User',	9,	'Personal Access Token',	'bad01c64bab3cd3c9eb1e0c4104712fee718ff2646dcbfa1c36c74f3a6ed8fe2',	'["*"]',	NULL,	'2024-12-20 09:20:16',	'2024-12-20 09:20:16'),
(28,	'App\Models\User',	9,	'Personal Access Token',	'b6584dc4db80aefbe975f8f42ef13df8fb1856d3f238b75c4df3850d0d990efc',	'["*"]',	NULL,	'2024-12-20 09:20:20',	'2024-12-20 09:20:20'),
(29,	'App\Models\User',	2,	'Personal Access Token',	'f533d03224debff130c7499a25b09891694284faccee52e016154852676fe46a',	'["*"]',	NULL,	'2024-12-20 09:21:41',	'2024-12-20 09:21:41'),
(30,	'App\Models\User',	2,	'Personal Access Token',	'1b0354eed0c8192fc5abf77184fbc990c3e5a9f0fef06adc598dbea16eeb6628',	'["*"]',	NULL,	'2024-12-20 09:24:28',	'2024-12-20 09:24:28'),
(31,	'App\Models\User',	2,	'Personal Access Token',	'6542907ad2c741e2315021fb1049af4510157277020f4637214c3a35379eb755',	'["*"]',	NULL,	'2024-12-20 09:26:13',	'2024-12-20 09:26:13'),
(32,	'App\Models\User',	2,	'Personal Access Token',	'b7d14869187997e5c3d628d2888dec0d58ed5f0fdd185759b004db1521b0e102',	'["*"]',	NULL,	'2024-12-20 09:27:05',	'2024-12-20 09:27:05'),
(33,	'App\Models\User',	2,	'Personal Access Token',	'c5d5dd321c272d7d629f88e3426017a9226d1c9df46ed7498a43a0fae48c5cab',	'["*"]',	NULL,	'2024-12-20 09:28:34',	'2024-12-20 09:28:34'),
(34,	'App\Models\User',	2,	'Personal Access Token',	'5add1e5576a12e478e9d3194589e82c0b92d02804d66a094a224dd99f90808a4',	'["*"]',	NULL,	'2024-12-20 09:28:44',	'2024-12-20 09:28:44'),
(35,	'App\Models\User',	2,	'Personal Access Token',	'e3e8fcfed6eb0722ce9393a21048ce337615dd7e948ad4e616cd5692951d652c',	'["*"]',	NULL,	'2024-12-20 09:30:28',	'2024-12-20 09:30:28'),
(36,	'App\Models\User',	2,	'Personal Access Token',	'63dc7012a98074adeddabf75dfcb10f93c3226b7999f6fe47cd91ff66261c9a5',	'["*"]',	NULL,	'2024-12-20 09:32:05',	'2024-12-20 09:32:05'),
(37,	'App\Models\User',	9,	'Personal Access Token',	'5da423d47cadec89bcf1912ddca59f0f56adb42285a257353de40b851527a161',	'["*"]',	NULL,	'2024-12-20 09:35:22',	'2024-12-20 09:35:22'),
(38,	'App\Models\User',	9,	'Personal Access Token',	'67d19ca53016df790a2b09dcd3a306d77ad9333415aaef4f89dd77556d736ca1',	'["*"]',	NULL,	'2025-01-06 15:35:14',	'2025-01-06 15:35:14'),
(39,	'App\Models\User',	13,	'Personal Access Token',	'28d65ee9dc70390f15a1cec640cf2ebacf0fa44e55c33fce39f8963f363ffe1c',	'["*"]',	NULL,	'2025-01-06 22:22:11',	'2025-01-06 22:22:11'),
(40,	'App\Models\User',	13,	'Personal Access Token',	'6c6b63b06c7d6e886789fa42aabaa5cf5ce67aa2b3cbd7d2a1119c585ce2f7ee',	'["*"]',	NULL,	'2025-01-06 22:22:12',	'2025-01-06 22:22:12'),
(41,	'App\Models\User',	13,	'Personal Access Token',	'0d9409469d6f94500a2c61dab248ad36e3b622d84e74e9fb3791eb7f442e0518',	'["*"]',	NULL,	'2025-01-06 22:33:39',	'2025-01-06 22:33:39'),
(42,	'App\Models\User',	13,	'Personal Access Token',	'69129757334e07afeb9f27654b0e7761124e283ed66cc6a3a74ca2117cf09744',	'["*"]',	NULL,	'2025-01-06 22:37:17',	'2025-01-06 22:37:17'),
(43,	'App\Models\User',	9,	'Personal Access Token',	'ebad33481d0962557fb2e4bbce9075d8873412ac7051b0735636032836352190',	'["*"]',	NULL,	'2025-01-07 01:01:47',	'2025-01-07 01:01:47'),
(44,	'App\Models\User',	14,	'Personal Access Token',	'1e7d324a2cf094cedd023af79f6a4fd572f96fe5e69c29129e0ae2511abb895e',	'["*"]',	NULL,	'2025-01-07 04:05:16',	'2025-01-07 04:05:16'),
(45,	'App\Models\User',	14,	'Personal Access Token',	'a5df0ffaafdaa09e728cd2d5c8794d77c6f666194315e5b0f5ec84ee38483c14',	'["*"]',	NULL,	'2025-01-07 04:05:17',	'2025-01-07 04:05:17'),
(46,	'App\Models\User',	15,	'Personal Access Token',	'35a76d4e4396e7daa1c8fb6abb8e1a5714ff9e970ed1e60a58c21110474cdd03',	'["*"]',	NULL,	'2025-01-07 06:04:34',	'2025-01-07 06:04:34'),
(47,	'App\Models\User',	15,	'Personal Access Token',	'00fc3c20ecbcdca9fa8c8cbd21e022193fc07455939f017cb3ff1fa3e83ded79',	'["*"]',	NULL,	'2025-01-07 06:04:35',	'2025-01-07 06:04:35'),
(48,	'App\Models\User',	15,	'Personal Access Token',	'b1200f6e68511bf46bab83bbe5874ccf958d47ac551126ebb0a3d736ca6f6ef9',	'["*"]',	NULL,	'2025-01-07 11:07:17',	'2025-01-07 11:07:17'),
(49,	'App\Models\User',	9,	'Personal Access Token',	'f11fb4c6c209a269e80a2d5b92a789993c5cd9f2b16194f5367f45b8a265538f',	'["*"]',	NULL,	'2025-01-07 15:39:57',	'2025-01-07 15:39:57'),
(50,	'App\Models\User',	9,	'Personal Access Token',	'88258f5583080c76d6f1aaf5d133eddf9c5ec4403ab3564c275a0720ebdfbe5c',	'["*"]',	NULL,	'2025-01-07 16:18:33',	'2025-01-07 16:18:33'),
(51,	'App\Models\User',	9,	'Personal Access Token',	'01140d87dc2dc3ac2560f92f5fc6fca6a35236c6d1a6a0b71df41cd448064ec0',	'["*"]',	NULL,	'2025-01-08 01:28:31',	'2025-01-08 01:28:31'),
(52,	'App\Models\User',	15,	'Personal Access Token',	'c904f872b53032ed3b2e62d370633451e07bec2afdb3b41e8e2c2f007f9af99f',	'["*"]',	NULL,	'2025-01-08 05:52:43',	'2025-01-08 05:52:43'),
(53,	'App\Models\User',	9,	'Personal Access Token',	'70ce7cd37cb02bc2e09ae874dc43619c2521068430751e6fbe2ed873e95a71b0',	'["*"]',	NULL,	'2025-01-08 07:25:49',	'2025-01-08 07:25:49'),
(54,	'App\Models\User',	13,	'Personal Access Token',	'bfca87c029e9dacc72248a7073812a2d2633b04b914df3d2eb00b53ea3303219',	'["*"]',	NULL,	'2025-01-08 08:29:35',	'2025-01-08 08:29:35'),
(55,	'App\Models\User',	13,	'Personal Access Token',	'3c51be982a4b32bdfff7baf08bbce22bfefb6c3d0fc6a8cbdb465ff57fae2f58',	'["*"]',	NULL,	'2025-01-08 08:40:32',	'2025-01-08 08:40:32'),
(56,	'App\Models\User',	33,	'Personal Access Token',	'e7430f603def28e448c5d34c1079c4c04302a4968c1a6bbc500798506256e251',	'["*"]',	NULL,	'2025-01-08 09:01:55',	'2025-01-08 09:01:55'),
(57,	'App\Models\User',	33,	'Personal Access Token',	'930b58416090d0ce4777dad6ad64715e78ef1c9f3b853bb56ad851fd85a41994',	'["*"]',	NULL,	'2025-01-08 09:01:56',	'2025-01-08 09:01:56'),
(58,	'App\Models\User',	9,	'Personal Access Token',	'20002c6ed7fc9eaaab7a183247309fc88eceda9569abb9451d6bcae9a86c067d',	'["*"]',	NULL,	'2025-01-08 09:03:11',	'2025-01-08 09:03:11'),
(59,	'App\Models\User',	9,	'Personal Access Token',	'b9fbba27fe4395058aa212f38c1ab9365a8d68ce67bfc33b844495aea8e8b38f',	'["*"]',	NULL,	'2025-01-08 09:41:07',	'2025-01-08 09:41:07'),
(60,	'App\Models\User',	33,	'Personal Access Token',	'313f0b790d6ffbeef12707745c08c68120a9f8684c6ea55f22fd229ae76e406b',	'["*"]',	NULL,	'2025-01-08 09:44:43',	'2025-01-08 09:44:43'),
(61,	'App\Models\User',	33,	'Personal Access Token',	'978273c0bc6a54e3c4c1bb42b9d04835c1237c5866170fc9d412601bcd455142',	'["*"]',	NULL,	'2025-01-08 09:48:41',	'2025-01-08 09:48:41'),
(62,	'App\Models\User',	33,	'Personal Access Token',	'664bed29606ac81d0b48af356307b6a4e50222589862258d3a4fa7eaab91b68c',	'["*"]',	NULL,	'2025-01-08 09:53:03',	'2025-01-08 09:53:03'),
(63,	'App\Models\User',	33,	'Personal Access Token',	'e7ee254cace33fd9dc162a2339c9d843e29e8af2d2f5674c19f0bb5564c8e30f',	'["*"]',	NULL,	'2025-01-08 09:56:09',	'2025-01-08 09:56:09'),
(64,	'App\Models\User',	9,	'Personal Access Token',	'4394727f9961b65529c005404d779726e4b5848fdad5177264ccf55f948a42e3',	'["*"]',	NULL,	'2025-01-08 09:56:40',	'2025-01-08 09:56:40'),
(65,	'App\Models\User',	33,	'Personal Access Token',	'0ea3320db8238156500094a103177ced5ac1e829d99fb067625bc1f68e7939a3',	'["*"]',	NULL,	'2025-01-08 10:38:17',	'2025-01-08 10:38:17'),
(66,	'App\Models\User',	33,	'Personal Access Token',	'1069b689154d882dbfe6fe9f30c672a4101442646143a08570e019de25e8cd6d',	'["*"]',	NULL,	'2025-01-08 10:40:14',	'2025-01-08 10:40:14'),
(67,	'App\Models\User',	38,	'Personal Access Token',	'c6e93b03f64e653c0ebb337b91f174f39a3d3725b70b590f35f3defacd38881f',	'["*"]',	NULL,	'2025-01-08 10:41:12',	'2025-01-08 10:41:12'),
(68,	'App\Models\User',	38,	'Personal Access Token',	'ea13cc45c5ed4b3ff4bef8671f76b36e1b2ad3ecb314074d49fd1b6feb26db95',	'["*"]',	NULL,	'2025-01-08 10:41:12',	'2025-01-08 10:41:12'),
(69,	'App\Models\User',	33,	'Personal Access Token',	'3dc5fce70271711cbd4f92e78f7cfc0555e1d1ccb0556ce4f557e7ec24893670',	'["*"]',	NULL,	'2025-01-08 10:59:20',	'2025-01-08 10:59:20'),
(70,	'App\Models\User',	33,	'Personal Access Token',	'cf9fbbdd1581346502442734c9bf9c80c481cee8b5f5554dfe7bac9ff072761f',	'["*"]',	NULL,	'2025-01-08 11:44:33',	'2025-01-08 11:44:33'),
(71,	'App\Models\User',	33,	'Personal Access Token',	'26f8fb43dc2408fc005f107ba841ed77c9dc329aa0773076406884d2a80e5f8c',	'["*"]',	NULL,	'2025-01-08 15:17:56',	'2025-01-08 15:17:56'),
(72,	'App\Models\User',	13,	'Personal Access Token',	'090d4ec31cc1b82dc7d5241c7253c10a4a6ba8e2812fa4804111f3b435015059',	'["*"]',	NULL,	'2025-01-08 17:03:00',	'2025-01-08 17:03:00'),
(73,	'App\Models\User',	9,	'Personal Access Token',	'f7c000b1975d9aecb4cbc558685d036f127dc9822c71d9e06ee1720817a90e3b',	'["*"]',	NULL,	'2025-01-08 17:28:04',	'2025-01-08 17:28:04'),
(74,	'App\Models\User',	33,	'Personal Access Token',	'557f29ac544234c0094f5c3427e1ed3458669478f50c0d342251d038eb203848',	'["*"]',	NULL,	'2025-01-08 17:32:15',	'2025-01-08 17:32:15'),
(75,	'App\Models\User',	9,	'Personal Access Token',	'4074a9f3afd56a92fcc03953c59f1a2d923298205bde88cf63df6b337f223d91',	'["*"]',	NULL,	'2025-01-08 17:43:17',	'2025-01-08 17:43:17'),
(76,	'App\Models\User',	13,	'Personal Access Token',	'6fc1664b4f35569685f2663bb6cb943017521a7ddcd46b6753c87c4e8a5f63bf',	'["*"]',	NULL,	'2025-01-08 18:35:45',	'2025-01-08 18:35:45'),
(77,	'App\Models\User',	9,	'Personal Access Token',	'524adce55e3a6fca5c1389c2e20f41536dbfc4ab7abfbc2fecf8deea39f6dbbd',	'["*"]',	NULL,	'2025-01-08 20:02:05',	'2025-01-08 20:02:05'),
(78,	'App\Models\User',	33,	'Personal Access Token',	'1983db73ab8bffd242a59e0610813249d3a1ff330c5a5ae054e88b17738249c1',	'["*"]',	NULL,	'2025-01-09 07:12:54',	'2025-01-09 07:12:54'),
(79,	'App\Models\User',	38,	'Personal Access Token',	'4910bf08752f555e86553d6c7ee98349b374b6b24f752992f7577a2502f0394a',	'["*"]',	NULL,	'2025-01-09 08:17:32',	'2025-01-09 08:17:32'),
(80,	'App\Models\User',	33,	'Personal Access Token',	'63f845713cf320202991c402bf8a11383009b82125820fed0e3e53f3f5462b6e',	'["*"]',	NULL,	'2025-01-09 15:34:09',	'2025-01-09 15:34:09'),
(81,	'App\Models\User',	9,	'Personal Access Token',	'3496648c5cdd53be45125ca53834903ebed5ecd352f89ab6be4db64557d96e7a',	'["*"]',	NULL,	'2025-01-09 15:44:21',	'2025-01-09 15:44:21'),
(82,	'App\Models\User',	11,	'Personal Access Token',	'e1a3a1c6f366ca4a4b19f4e28315830b92c797a2315555f1703169d7cf5fd4b0',	'["*"]',	NULL,	'2025-01-09 16:27:15',	'2025-01-09 16:27:15'),
(83,	'App\Models\User',	9,	'Personal Access Token',	'dd13d6ff2d366efe7e82f24648c29d189ee921176818d783b86bd8925b093f11',	'["*"]',	NULL,	'2025-01-09 16:28:48',	'2025-01-09 16:28:48'),
(84,	'App\Models\User',	13,	'Personal Access Token',	'a17ca3b328e7e557fa9068dbc025d696d3a474c0d893f38a42c65ea0f2d6d193',	'["*"]',	NULL,	'2025-01-10 13:05:17',	'2025-01-10 13:05:17'),
(85,	'App\Models\User',	9,	'Personal Access Token',	'744ec82a754fb56786d738a63e521265f2e1fdbf38a2d75032f8575ca38ded2f',	'["*"]',	NULL,	'2025-01-10 13:55:24',	'2025-01-10 13:55:24'),
(86,	'App\Models\User',	13,	'Personal Access Token',	'cfdc4ecfe66048c7b378b32963e68ca50682da0458274c15dcab4ef8fb585603',	'["*"]',	NULL,	'2025-01-10 14:23:31',	'2025-01-10 14:23:31'),
(87,	'App\Models\User',	33,	'Personal Access Token',	'4c4d129b7b69c244a754abda7444ef4b61614e8b9866a92d1100c8c178f9e6bf',	'["*"]',	NULL,	'2025-01-10 15:24:15',	'2025-01-10 15:24:15'),
(88,	'App\Models\User',	13,	'Personal Access Token',	'f550db6a56e7ee553da7d3911b4c203af0fd8edeb83b6d494bbdd1f60f739e3d',	'["*"]',	NULL,	'2025-01-10 17:37:11',	'2025-01-10 17:37:11'),
(89,	'App\Models\User',	13,	'Personal Access Token',	'f7a17a082560767cbcf550164224160ce72477e157f25cc78ce32eb37fd609c9',	'["*"]',	NULL,	'2025-01-10 17:39:17',	'2025-01-10 17:39:17'),
(90,	'App\Models\User',	33,	'Personal Access Token',	'239f963b23904048547f65c39b037d0fe6b1feba1b28c34784328bdc99328fb4',	'["*"]',	NULL,	'2025-01-10 21:56:45',	'2025-01-10 21:56:45'),
(91,	'App\Models\User',	33,	'Personal Access Token',	'f8f0e268af1a3fd48c77526aecfa9ce5b0e7d5bb79b7dd2c8cc971d70e5ec34a',	'["*"]',	NULL,	'2025-01-10 21:57:29',	'2025-01-10 21:57:29'),
(92,	'App\Models\User',	33,	'Personal Access Token',	'83aa785090275a38b19aa4b4774ec2379c3ec541556561be141560c342b1eec6',	'["*"]',	NULL,	'2025-01-10 22:09:27',	'2025-01-10 22:09:27'),
(93,	'App\Models\User',	9,	'Personal Access Token',	'3fb5aee3e3388ef8f76f28267ef4f1f1a4c2dac2a091237e5ac6a39087316751',	'["*"]',	NULL,	'2025-01-11 06:17:25',	'2025-01-11 06:17:25'),
(94,	'App\Models\User',	13,	'Personal Access Token',	'e922f517e8e5e01b83db973db7456331f40cdf0a466230208458b1888a08c82c',	'["*"]',	NULL,	'2025-01-11 08:00:38',	'2025-01-11 08:00:38'),
(95,	'App\Models\User',	15,	'Personal Access Token',	'03355c160229acc4e37555f612e748d7a8f55f0cf5b486591574cdc9575355d0',	'["*"]',	NULL,	'2025-01-11 09:52:14',	'2025-01-11 09:52:14'),
(96,	'App\Models\User',	15,	'Personal Access Token',	'8c57a171e2f598e439470524c055b29ae2283afc570890b51150dae7ed331ddc',	'["*"]',	NULL,	'2025-01-11 11:04:15',	'2025-01-11 11:04:15'),
(97,	'App\Models\User',	15,	'Personal Access Token',	'd85ae5792f56bb06649304621bc576d995eba95ecb8f6f02dbdc074de1ad5339',	'["*"]',	NULL,	'2025-01-11 11:17:32',	'2025-01-11 11:17:32'),
(98,	'App\Models\User',	15,	'Personal Access Token',	'aaf20301ffafc5a5a07a4c4d99db81ada2b5a2c68016f815a70f3c0aec28d1e6',	'["*"]',	NULL,	'2025-01-11 11:19:07',	'2025-01-11 11:19:07'),
(99,	'App\Models\User',	13,	'Personal Access Token',	'0fedd695e6c0d20bd01ad2590b04951da25106aeef59fcb0e9e93f76e385d71c',	'["*"]',	NULL,	'2025-01-11 13:19:15',	'2025-01-11 13:19:15'),
(100,	'App\Models\User',	13,	'Personal Access Token',	'620c6f1659a219f77672826f77555c00031f423ea5d639de4689575d7b1d9289',	'["*"]',	NULL,	'2025-01-11 14:16:22',	'2025-01-11 14:16:22'),
(101,	'App\Models\User',	15,	'Personal Access Token',	'127de44032908818b27d398cc1225abcae849f82ed6f85aeae619daf9ef91cb9',	'["*"]',	NULL,	'2025-01-13 06:45:22',	'2025-01-13 06:45:22'),
(102,	'App\Models\User',	15,	'Personal Access Token',	'36485ed3355468ed1d92ae0ee6511f1f525de00f7838a1780819c83acf0e4b60',	'["*"]',	NULL,	'2025-01-13 07:56:48',	'2025-01-13 07:56:48'),
(103,	'App\Models\User',	15,	'Personal Access Token',	'beaf39d8a99dbbcfa64c842c551ae8d6f5ca7f67405a2b21f095fe77289ff2cf',	'["*"]',	NULL,	'2025-01-13 08:06:34',	'2025-01-13 08:06:34'),
(104,	'App\Models\User',	15,	'Personal Access Token',	'8ceba43a2249d3a91fb2294d81c5babee1d7f9ea3244c03214dcb384314f5efe',	'["*"]',	NULL,	'2025-01-13 08:14:33',	'2025-01-13 08:14:33'),
(105,	'App\Models\User',	15,	'Personal Access Token',	'44bff2d361661812a17ac5b4f07ad0f9de35259b8b24467a503f29096e252f8b',	'["*"]',	NULL,	'2025-01-13 09:28:26',	'2025-01-13 09:28:26'),
(106,	'App\Models\User',	15,	'Personal Access Token',	'b7aa175943298676b51e10d50817791dc6ee59d0feac23f153594a701da933cb',	'["*"]',	NULL,	'2025-01-13 12:29:04',	'2025-01-13 12:29:04'),
(107,	'App\Models\User',	33,	'Personal Access Token',	'b87f9eec2de6e37850044707eb0481985ead2cdf402893fef8bf62c15b189a2c',	'["*"]',	NULL,	'2025-01-13 12:43:00',	'2025-01-13 12:43:00'),
(108,	'App\Models\User',	33,	'Personal Access Token',	'd0f69e4eb9f936527276ec5779ce3018c49a58c8dbf1cb3b7edf45ef2e9bbeb3',	'["*"]',	NULL,	'2025-01-13 13:07:13',	'2025-01-13 13:07:13'),
(109,	'App\Models\User',	15,	'Personal Access Token',	'96729b30e344bee5fe8fdaac3cfc2786c515aab9fb9c1595a2b06644674604aa',	'["*"]',	NULL,	'2025-01-13 14:29:37',	'2025-01-13 14:29:37'),
(110,	'App\Models\User',	33,	'Personal Access Token',	'f2f777f9d4a3b6c8b8abf9effa900fc3ef5f5d956cf40c8565b50251b3eae59a',	'["*"]',	NULL,	'2025-01-13 15:39:50',	'2025-01-13 15:39:50'),
(111,	'App\Models\User',	15,	'Personal Access Token',	'f9fb084059d8b11bfccfec09b996424bfa21ffd26435bcc523d019ce3605b001',	'["*"]',	NULL,	'2025-01-13 17:43:32',	'2025-01-13 17:43:32'),
(112,	'App\Models\User',	15,	'Personal Access Token',	'3574557ef37bb127cded487fe3586cbea362318ac02bfce84fa67215014f6964',	'["*"]',	NULL,	'2025-01-14 07:47:57',	'2025-01-14 07:47:57'),
(113,	'App\Models\User',	15,	'Personal Access Token',	'2268d9857590b5fac8275b902a51a2e409f8b3daf7050a47216a4c6580e498a0',	'["*"]',	NULL,	'2025-01-14 07:57:44',	'2025-01-14 07:57:44'),
(114,	'App\Models\User',	15,	'Personal Access Token',	'5d80a890e4ef36340f909c6c4562961290497a57fc3f2e586310f96183ff866a',	'["*"]',	NULL,	'2025-01-14 10:20:33',	'2025-01-14 10:20:33'),
(115,	'App\Models\User',	9,	'Personal Access Token',	'92bac6bf7d72d39ed17f0347700e3d22890b185325bb6b1e7e6aa170de6af7ee',	'["*"]',	NULL,	'2025-01-14 10:27:33',	'2025-01-14 10:27:33'),
(116,	'App\Models\User',	9,	'Personal Access Token',	'3eddd64b69ed7770c3e9e3631b10bc85395dd2e9cdb511d922004566c45b1478',	'["*"]',	NULL,	'2025-01-14 10:36:29',	'2025-01-14 10:36:29'),
(117,	'App\Models\User',	9,	'Personal Access Token',	'e4e78f0588f3defa376c1f0046bbf611679da16dcb54627c0815f7523ff1f505',	'["*"]',	NULL,	'2025-01-14 16:10:49',	'2025-01-14 16:10:49'),
(118,	'App\Models\User',	15,	'Personal Access Token',	'e07921f0ddf57b42d3ae67fa44af6639c576664b1155e042a91ea2abe13794dc',	'["*"]',	NULL,	'2025-01-14 18:01:17',	'2025-01-14 18:01:17'),
(119,	'App\Models\User',	15,	'Personal Access Token',	'051f975f110003101cfbd96d9ef61b14b5ae267c1586e2cd7e7516467d1e04d2',	'["*"]',	NULL,	'2025-01-15 05:15:07',	'2025-01-15 05:15:07'),
(120,	'App\Models\User',	15,	'Personal Access Token',	'9e0138c81370f469e921da0da5f3bbfc0e0e35699406ca99014a38174e507d68',	'["*"]',	NULL,	'2025-01-15 09:08:50',	'2025-01-15 09:08:50'),
(121,	'App\Models\User',	58,	'Personal Access Token',	'e410ef3b29c10a90f7050773f10e4664e348974e8c1887db213036cb70aaebcf',	'["*"]',	NULL,	'2025-01-15 09:18:43',	'2025-01-15 09:18:43'),
(122,	'App\Models\User',	58,	'Personal Access Token',	'b204f66a7046acb2ed531c27445ab2e3c987ff2139d60988e380868842384727',	'["*"]',	NULL,	'2025-01-15 09:18:44',	'2025-01-15 09:18:44'),
(123,	'App\Models\User',	9,	'Personal Access Token',	'492bfcde1ebba0b89eeecf2f4ddc68bb1e69ced79e79da59dbbe9b253f4a3db5',	'["*"]',	NULL,	'2025-01-15 10:26:15',	'2025-01-15 10:26:15'),
(124,	'App\Models\User',	15,	'Personal Access Token',	'72b2b9e0e7a1ac3b25895e3e2ed1091e6244a0abaa5549fa8d5aaeaa55dae5b3',	'["*"]',	NULL,	'2025-01-15 11:23:07',	'2025-01-15 11:23:07'),
(125,	'App\Models\User',	15,	'Personal Access Token',	'f31c116ca7e47f2add28927e6633bf34ee1eee840114e60912c17bf483f392e9',	'["*"]',	NULL,	'2025-01-15 12:50:15',	'2025-01-15 12:50:15'),
(126,	'App\Models\User',	15,	'Personal Access Token',	'210ce316144dae807bd941f38b02f8054139609a6ddba39a36747e5c2551641b',	'["*"]',	NULL,	'2025-01-15 12:55:43',	'2025-01-15 12:55:43'),
(127,	'App\Models\User',	14,	'Personal Access Token',	'f2285a952769ee60eb68617655b031112ef875e4616109fcc26035e3c0f7c0c4',	'["*"]',	NULL,	'2025-01-15 13:01:57',	'2025-01-15 13:01:57'),
(128,	'App\Models\User',	9,	'Personal Access Token',	'05265212021cc6842d9d598dedd5a6f215ff181ce388ce5f6510e33f0e3474f9',	'["*"]',	NULL,	'2025-01-15 15:41:19',	'2025-01-15 15:41:19'),
(129,	'App\Models\User',	9,	'Personal Access Token',	'5eb8829415272fecfd9d66ffb8ddc522a4140799271dee56a0ba804d8fd1a2bf',	'["*"]',	NULL,	'2025-01-16 06:52:07',	'2025-01-16 06:52:07'),
(130,	'App\Models\User',	15,	'Personal Access Token',	'6280ee36a112f3eddc1b6e25ae69731783176fbab43ccdb556f9eb64030e63e8',	'["*"]',	NULL,	'2025-01-16 07:50:31',	'2025-01-16 07:50:31'),
(131,	'App\Models\User',	13,	'Personal Access Token',	'88d67f8c28f5b71554cafbff069de77b0bc6e74fcfe2b5986f00dad42e042a6d',	'["*"]',	NULL,	'2025-01-16 15:19:22',	'2025-01-16 15:19:22');

DROP TABLE IF EXISTS "post_comments";
DROP SEQUENCE IF EXISTS post_comments_id_seq;
CREATE SEQUENCE post_comments_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."post_comments" (
    "id" bigint DEFAULT nextval('post_comments_id_seq') NOT NULL,
    "user_id" integer NOT NULL,
    "post_id" integer NOT NULL,
    "parent_id" integer DEFAULT '0' NOT NULL,
    "comment" text NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "comment_node_id" text,
    CONSTRAINT "post_comments_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "post_likes";
DROP SEQUENCE IF EXISTS post_likes_id_seq;
CREATE SEQUENCE post_likes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."post_likes" (
    "id" bigint DEFAULT nextval('post_likes_id_seq') NOT NULL,
    "post_id" integer NOT NULL,
    "user_id" integer NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "post_likes_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "post_saves";
DROP SEQUENCE IF EXISTS post_saves_id_seq;
CREATE SEQUENCE post_saves_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."post_saves" (
    "id" bigint DEFAULT nextval('post_saves_id_seq') NOT NULL,
    "post_id" integer NOT NULL,
    "user_id" integer NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "post_saves_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "post_users";
DROP SEQUENCE IF EXISTS post_users_id_seq;
CREATE SEQUENCE post_users_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."post_users" (
    "id" bigint DEFAULT nextval('post_users_id_seq') NOT NULL,
    "post_id" integer NOT NULL,
    "user_id" integer NOT NULL,
    CONSTRAINT "post_users_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "posts";
DROP SEQUENCE IF EXISTS posts_id_seq;
CREATE SEQUENCE posts_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."posts" (
    "id" bigint DEFAULT nextval('posts_id_seq') NOT NULL,
    "user_id" integer NOT NULL,
    "caption" character varying(2500),
    "file_type" integer DEFAULT '1' NOT NULL,
    "file" text,
    "location_name" text,
    "lattitude" character varying(250),
    "longitude" character varying(250),
    "post_firebase_node_id" character varying(250),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "active" integer DEFAULT '1' NOT NULL,
    "visibility" character varying(20) DEFAULT 'public' NOT NULL,
    "extra_file_names" text,
    CONSTRAINT "posts_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "product";
DROP SEQUENCE IF EXISTS product_id_seq;
CREATE SEQUENCE product_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."product" (
    "id" bigint DEFAULT nextval('product_id_seq') NOT NULL,
    "product_type" integer DEFAULT '0' NOT NULL,
    "product_desc_full" text,
    "product_desc_short" text,
    "product_sale_from" character varying(200),
    "product_sale_to" character varying(200),
    "product_featured_image" character varying(600),
    "product_tag" character varying(600),
    "product_created_by" integer DEFAULT '0' NOT NULL,
    "product_updated_by" integer DEFAULT '0' NOT NULL,
    "product_status" integer DEFAULT '0' NOT NULL,
    "product_deleted" integer DEFAULT '0' NOT NULL,
    "product_name" character varying(900),
    "product_variation_type" integer DEFAULT '0' NOT NULL,
    "product_taxable" integer DEFAULT '1' NOT NULL,
    "product_vender_id" integer DEFAULT '0' NOT NULL,
    "product_image" character varying(200),
    "product_unique_iden" character varying(200),
    "product_brand_id" integer DEFAULT '0' NOT NULL,
    "product_name_arabic" character varying(900),
    "product_desc_full_arabic" text,
    "product_desc_short_arabic" text,
    "cash_points" integer DEFAULT '0' NOT NULL,
    "offer_enabled" integer DEFAULT '0' NOT NULL,
    "deal_enabled" integer DEFAULT '0' NOT NULL,
    "is_today_offer" integer DEFAULT '0' NOT NULL,
    "today_offer_date" character varying(200),
    "thanku_perc" double precision,
    "custom_status" integer,
    "meta_title" text,
    "meta_keyword" text,
    "meta_description" text,
    "product_vendor_status" integer DEFAULT '0' NOT NULL,
    "product_gender" character varying(100),
    "is_kandora" integer DEFAULT '0' NOT NULL,
    "collection_id" integer DEFAULT '0' NOT NULL,
    "hot_offer_enabled" integer DEFAULT '0' NOT NULL,
    "trending_enabled" integer DEFAULT '0' NOT NULL,
    "offers_list" integer DEFAULT '0' NOT NULL,
    "zero_quantity_orders" integer DEFAULT '0' NOT NULL,
    "product_code" character varying(300),
    "product_tags" character varying(1000),
    "sort_order" integer DEFAULT '0' NOT NULL,
    "offer_for_short" integer DEFAULT '0' NOT NULL,
    "hot_offer_sort_order" integer DEFAULT '0' NOT NULL,
    "new_trending_sort_order" integer DEFAULT '0' NOT NULL,
    "author_id" integer DEFAULT '0' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "default_category_id" integer DEFAULT '0' NOT NULL,
    "default_attribute_id" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "brand" character varying(600),
    "store_id" integer DEFAULT '0' NOT NULL,
    "moda_main_category" integer DEFAULT '0' NOT NULL,
    "moda_sub_category" integer DEFAULT '0' NOT NULL,
    "featured" integer DEFAULT '0' NOT NULL,
    "master_product" integer DEFAULT '0' NOT NULL,
    "boxcount" character varying(100),
    "activity_id" bigint,
    "recommended" integer DEFAULT '0' NOT NULL,
    "rating_avg" double precision,
    "shipment_and_policies" text,
    "new_arrival" character varying(255),
    "for_you" character varying(255),
    "trending" character varying(255),
    CONSTRAINT "product_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "product" ("id", "product_type", "product_desc_full", "product_desc_short", "product_sale_from", "product_sale_to", "product_featured_image", "product_tag", "product_created_by", "product_updated_by", "product_status", "product_deleted", "product_name", "product_variation_type", "product_taxable", "product_vender_id", "product_image", "product_unique_iden", "product_brand_id", "product_name_arabic", "product_desc_full_arabic", "product_desc_short_arabic", "cash_points", "offer_enabled", "deal_enabled", "is_today_offer", "today_offer_date", "thanku_perc", "custom_status", "meta_title", "meta_keyword", "meta_description", "product_vendor_status", "product_gender", "is_kandora", "collection_id", "hot_offer_enabled", "trending_enabled", "offers_list", "zero_quantity_orders", "product_code", "product_tags", "sort_order", "offer_for_short", "hot_offer_sort_order", "new_trending_sort_order", "author_id", "deleted", "default_category_id", "default_attribute_id", "created_at", "updated_at", "brand", "store_id", "moda_main_category", "moda_sub_category", "featured", "master_product", "boxcount", "activity_id", "recommended", "rating_avg", "shipment_and_policies", "new_arrival", "for_you", "trending") VALUES
(7,	2,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	4,	4,	1,	0,	'cccxz',	1,	1,	4,	NULL,	'149499832',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	1,	5,	0,	'2024-07-04 15:10:21',	'2025-01-07 07:33:09',	NULL,	0,	0,	0,	1,	0,	'0',	7,	0,	NULL,	NULL,	NULL,	NULL,	NULL),
(18,	1,	'Vivid Interiors
Vivid Interiors is a décor brand that brings vibrant and colorful designs to life.',	'Vivid Interiors
Vivid Interiors is a décor brand that brings vibrant and colorful designs to life.',	NULL,	NULL,	NULL,	NULL,	18,	18,	1,	0,	'Wall Decor',	1,	1,	18,	NULL,	'28972654',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	18,	'2025-01-07 09:00:55',	'2025-01-15 10:42:46',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	NULL,	NULL,	'1',	NULL),
(9,	2,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	4,	0,	1,	0,	'Test',	1,	1,	4,	NULL,	'340323432',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	1,	1,	9,	'2025-01-06 10:43:55',	NULL,	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	NULL,	NULL,	NULL,	NULL),
(12,	1,	'Premium quality clothing, focusing on high-end fabrics and sophisticated designs.',	'Premium quality clothing, focusing on high-end fabrics and sophisticated designs.',	NULL,	NULL,	NULL,	NULL,	16,	0,	1,	0,	'Luxe Loom',	1,	1,	16,	NULL,	'768797289',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	1,	7,	12,	'2025-01-07 08:32:44',	NULL,	NULL,	0,	0,	0,	1,	0,	'0',	7,	0,	NULL,	NULL,	NULL,	NULL,	NULL),
(4,	1,	'Crown & Brim is a premium hat and cap brand known for its impeccable craftsmanship and stylish designs. Combining modern trends with classic styles, Crown & Brim offers a diverse collection of hats and caps that cater to various occasions, from casual wear to formal events. Each piece is made from high-quality materials to ensure comfort, durability, and a perfect fit.',	'Crown & Brim is a premium hat and cap brand known for its impeccable craftsmanship and stylish designs. Combining modern trends with classic styles, Crown & Brim offers a diverse collection of hats and caps that cater to various occasions, from casual wear to formal events. Each piece is made from high-quality materials to ensure comfort, durability, and a perfect fit.',	NULL,	NULL,	NULL,	NULL,	4,	4,	1,	0,	'Crown & Brim',	1,	1,	4,	NULL,	'660606078',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	4,	'2024-07-02 11:38:59',	'2025-01-15 07:10:39',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	4.7,	'Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage.',	NULL,	NULL,	NULL),
(15,	1,	'Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty.',	'Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty.',	NULL,	NULL,	NULL,	NULL,	17,	17,	1,	0,	'Arabic jewels',	1,	1,	17,	NULL,	'291665267',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	15,	'2025-01-07 08:51:09',	'2025-01-15 10:37:50',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	3,	NULL,	NULL,	'1',	NULL),
(13,	1,	'Modern, city-inspired clothing for a trendy, on-the-go lifestyle.',	'Modern, city-inspired clothing for a trendy, on-the-go lifestyle.',	NULL,	NULL,	NULL,	NULL,	16,	0,	1,	0,	'Urban Weave',	1,	1,	16,	NULL,	'802142357',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	1,	7,	13,	'2025-01-07 08:33:32',	NULL,	NULL,	0,	0,	0,	1,	0,	'0',	7,	0,	NULL,	NULL,	NULL,	NULL,	NULL),
(14,	1,	'Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty. The word "Gleaming" suggests a radiant, shining quality, symbolizing the brilliance of fine jewelry. "Grace" adds an element of elegance and timeless appeal, evoking the delicate craftsmanship and refined designs that the brand offers.',	'Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty. The word "Gleaming" suggests a radiant, shining quality, symbolizing the brilliance of fine jewelry. "Grace" adds an element of elegance and timeless appeal, evoking the delicate craftsmanship and refined designs that the brand offers.',	NULL,	NULL,	NULL,	NULL,	17,	17,	1,	0,	'Persian Diamond',	1,	1,	17,	NULL,	'831094520',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	14,	'2025-01-07 08:49:53',	'2025-01-15 07:17:46',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	NULL,	NULL,	NULL,	NULL),
(5,	1,	'Handmade Brown Textured Ceramic Lamp | Bedroom & Livingroom Lightning | Unique, Minimalist Designed',	'Handmade Brown Textured Ceramic Lamp | Bedroom & Livingroom Lightning | Unique, Minimalist Designed',	NULL,	NULL,	NULL,	NULL,	4,	4,	1,	0,	'Handmade Brown Textured Ceramic Lamp',	1,	1,	4,	NULL,	'683252426',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	1,	1,	5,	'2024-07-02 11:55:08',	'2025-01-06 08:54:46',	NULL,	0,	0,	0,	1,	0,	'0',	7,	1,	NULL,	NULL,	NULL,	NULL,	NULL),
(17,	1,	'Vivid Interiors
Vivid Interiors is a décor brand that brings vibrant and colorful designs to life.',	'Vivid Interiors
Vivid Interiors is a décor brand that brings vibrant and colorful designs to life.',	NULL,	NULL,	NULL,	NULL,	18,	18,	1,	0,	'Drawing Room',	1,	1,	18,	NULL,	'817807687',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	17,	'2025-01-07 09:00:08',	'2025-01-15 07:40:20',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	NULL,	NULL,	NULL,	NULL),
(16,	1,	'Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty.',	'Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty.',	NULL,	NULL,	NULL,	NULL,	17,	17,	1,	0,	'Golden Envy',	1,	1,	17,	NULL,	'640877598',	0,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	16,	'2025-01-07 08:52:24',	'2025-01-15 07:40:37',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	NULL,	NULL,	NULL,	NULL),
(10,	2,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	5,	5,	1,	0,	'Test',	1,	1,	5,	NULL,	'562815623',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	1,	1,	10,	'2025-01-06 11:40:20',	'2025-01-07 07:51:43',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	NULL,	NULL,	NULL,	NULL),
(6,	1,	'Painters Palette, Floral Paint Palette, Botanical decorReal ,Pressed Flowers, Creative Artist Gift, Art lover tool, Mothers Day',	'Painters Palette, Floral Paint Palette, Botanical decorReal ,Pressed Flowers, Creative Artist Gift, Art lover tool, Mothers Day',	NULL,	NULL,	NULL,	NULL,	4,	4,	1,	0,	'Painters Palette, Floral Paint Palette',	1,	1,	4,	NULL,	'545180046',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	1,	5,	6,	'2024-07-02 11:56:57',	'2025-01-06 08:55:17',	NULL,	0,	0,	0,	1,	0,	'0',	7,	1,	NULL,	NULL,	NULL,	NULL,	NULL),
(27,	1,	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	NULL,	NULL,	NULL,	NULL,	18,	18,	1,	0,	'Art & Craft',	1,	1,	18,	NULL,	'974146296',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	28,	'2025-01-08 13:40:26',	'2025-01-15 10:41:52',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	NULL,	NULL,	NULL),
(28,	1,	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	NULL,	NULL,	NULL,	NULL,	18,	18,	1,	0,	'Photo frames',	1,	1,	18,	NULL,	'509305287',	4,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	29,	'2025-01-08 13:43:21',	'2025-01-15 07:41:24',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	NULL,	NULL,	NULL),
(19,	1,	'Opal & Oak combines nature-inspired designs with elegant craftsmanship.',	'Opal & Oak combines nature-inspired designs with elegant craftsmanship.',	NULL,	NULL,	NULL,	NULL,	18,	18,	1,	0,	'Opal & Oak Light',	1,	1,	18,	NULL,	'346196067',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	19,	'2025-01-07 09:02:07',	'2025-01-15 10:37:15',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	NULL,	NULL,	NULL,	'1'),
(26,	1,	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	NULL,	NULL,	NULL,	NULL,	30,	30,	1,	0,	'Loom & Luxe Jewels',	1,	1,	30,	NULL,	'401391550',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	27,	'2025-01-08 07:18:32',	'2025-01-15 07:33:07',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	NULL,	'1',	NULL),
(29,	1,	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	NULL,	NULL,	NULL,	NULL,	17,	17,	1,	0,	'Drawing Frames',	1,	1,	17,	NULL,	'675506466',	4,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	30,	'2025-01-08 13:44:34',	'2025-01-15 07:41:11',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	'1',	NULL,	NULL),
(21,	2,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	17,	17,	1,	0,	'Luxe Jewelers',	1,	1,	17,	NULL,	'787150137',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	1,	14,	22,	'2025-01-07 09:30:06',	'2025-01-15 07:34:21',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'Shipment And Policies Shipment And Policies Shipment And Policies Shipment And Policies',	NULL,	NULL,	'1'),
(23,	1,	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	NULL,	NULL,	NULL,	NULL,	30,	30,	1,	0,	'Scarves & Shawls',	1,	1,	30,	NULL,	'547271237',	5,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	24,	'2025-01-08 07:11:12',	'2025-01-15 07:20:15',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	'1',	NULL,	NULL),
(20,	1,	'Modern Nest
Modern Nest specializes in sleek, contemporary décor pieces that blend functionality and style.',	'Modern Nest
Modern Nest specializes in sleek, contemporary décor pieces that blend functionality and style.',	NULL,	NULL,	NULL,	NULL,	18,	18,	1,	0,	'Opal Storage',	1,	1,	18,	NULL,	'307917027',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	20,	'2025-01-07 09:17:05',	'2025-01-15 07:37:52',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	2.5,	NULL,	'1',	NULL,	NULL),
(34,	1,	'Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine.',	'Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine.',	NULL,	NULL,	NULL,	NULL,	5,	5,	1,	0,	'Fiorentina Infinity Set',	1,	1,	5,	NULL,	'885522180',	6,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	9,	35,	'2025-01-13 07:44:46',	'2025-01-15 06:17:34',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine.',	NULL,	NULL,	'1'),
(2,	1,	'Vibrant Vibes is a fashion brand that embodies elegance, sophistication, and timeless beauty. Specializing in meticulously crafted garments and accessories, the brand focuses on using delicate, high-quality fabrics to create designs that exude a sense of lightness and grace.',	'Vibrant Vibes is a fashion brand that embodies elegance, sophistication, and timeless beauty. Specializing in meticulously crafted garments and accessories, the brand focuses on using delicate, high-quality fabrics to create designs that exude a sense of lightness and grace.',	NULL,	NULL,	NULL,	NULL,	4,	4,	1,	0,	'Vibrant Vibes',	1,	1,	4,	NULL,	'679226087',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	2,	'2024-07-02 11:26:46',	'2025-01-15 07:45:33',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage.',	NULL,	NULL,	NULL),
(30,	1,	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	NULL,	NULL,	NULL,	NULL,	30,	30,	1,	0,	'FERRERO ROCHER Basket',	1,	1,	30,	NULL,	'510572943',	4,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	31,	'2025-01-08 13:45:37',	'2025-01-15 09:09:42',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	'1',	NULL,	NULL),
(32,	1,	'Little Bundles has the cutest personalised gifts for newborn baby boys & baby girls in UAE.',	'Little Bundles has the cutest personalised gifts for newborn baby boys & baby girls in UAE.',	NULL,	NULL,	NULL,	NULL,	5,	5,	1,	0,	'Valentine''s Gift',	1,	1,	5,	NULL,	'929459235',	5,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	33,	'2025-01-13 07:35:48',	'2025-01-15 07:43:45',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'This page summarises how to return a product to us, our IKEA return policy and making a claim at IKEA.',	NULL,	'1',	NULL),
(31,	1,	'The best housewarming gifts last longer than your visits
Better sound, cleaner air or smarter lighting. Nothing says welcome home like new home electronics. And with these practical housewarming gifts, you can help them find new ways to make the most of their life at home – every day.',	'The best housewarming gifts last longer than your visits
Better sound, cleaner air or smarter lighting. Nothing says welcome home like new home electronics. And with these practical housewarming gifts, you can help them find new ways to make the most of their life at home – every day.',	NULL,	NULL,	NULL,	NULL,	5,	5,	1,	0,	'Personalized Basket',	1,	1,	5,	NULL,	'532380448',	4,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	32,	'2025-01-13 07:34:09',	'2025-01-15 07:42:52',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'This page summarises how to return a product to us, our IKEA return policy and making a claim at IKEA.',	NULL,	NULL,	'1'),
(33,	1,	'Everyday essentials: A quality wallet, a stylish watch, or a comfortable backpack. Self-care: Grooming products, gym membership, or a subscription box.',	'Everyday essentials: A quality wallet, a stylish watch, or a comfortable backpack. Self-care: Grooming products, gym membership, or a subscription box.',	NULL,	NULL,	NULL,	NULL,	5,	5,	1,	0,	'Polo air Belt Wallet Card Holder Keychain Tan Set',	1,	1,	5,	NULL,	'806195042',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	34,	'2025-01-13 07:41:57',	'2025-01-15 10:36:51',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'Everyday essentials: A quality wallet, a stylish watch, or a comfortable backpack. Self-care: Grooming products, gym membership, or a subscription box.',	NULL,	NULL,	NULL),
(3,	1,	'A custom wall light is a tailored lighting fixture designed to meet specific aesthetic and functional preferences. These lights can be made to fit any interior style, whether modern, rustic, or contemporary, and can be crafted in various shapes, sizes, and materials. Custom wall lights are often designed to complement the unique features of a space, providing both ambient and accent lighting.',	'A custom wall light is a tailored lighting fixture designed to meet specific aesthetic and functional preferences. These lights can be made to fit any interior style, whether modern, rustic, or contemporary, and can be crafted in various shapes, sizes, and materials. Custom wall lights are often designed to complement the unique features of a space, providing both ambient and accent lighting.',	NULL,	NULL,	NULL,	NULL,	4,	4,	1,	0,	'Custom Wall Lights',	1,	1,	4,	NULL,	'526230169',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	3,	'2024-07-02 11:38:44',	'2025-01-15 07:06:47',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage.',	NULL,	NULL,	NULL),
(8,	2,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	4,	4,	1,	0,	'Cotton Luxe',	1,	1,	4,	NULL,	'121945084',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	7,	'2024-08-29 15:31:13',	'2025-01-15 10:34:51',	NULL,	0,	0,	0,	0,	0,	' ',	7,	0,	NULL,	'Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage.',	NULL,	NULL,	'1'),
(11,	1,	'Classic Stitch Collection
Timeless elegance in every thread. The Classic Stitch Collection features versatile, wardrobe-staple pieces designed to last. From tailored blazers to sleek trousers, these items are perfect for those who appreciate enduring style and quality craftsmanship.',	'Classic Stitch Collection
Timeless elegance in every thread. The Classic Stitch Collection features versatile, wardrobe-staple pieces designed to last. From tailored blazers to sleek trousers, these items are perfect for those who appreciate enduring style and quality craftsmanship.',	NULL,	NULL,	NULL,	NULL,	16,	16,	1,	0,	'Classic Stitch Collection',	1,	1,	16,	NULL,	'921777335',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	11,	'2025-01-07 08:24:37',	'2025-01-15 07:44:37',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage.',	NULL,	NULL,	NULL),
(24,	1,	'This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.',	'This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.',	NULL,	NULL,	NULL,	NULL,	30,	30,	1,	0,	'Handmade Gloves',	1,	1,	30,	NULL,	'895698902',	5,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	25,	'2025-01-08 07:13:21',	'2025-01-15 07:23:11',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage.',	NULL,	'1',	NULL),
(22,	2,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	30,	30,	1,	0,	'Handmade Bags',	1,	1,	30,	NULL,	'7209457',	5,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	1,	14,	23,	'2025-01-08 07:00:54',	'2025-01-15 07:24:42',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage.',	'1',	'1',	NULL),
(36,	2,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	5,	5,	1,	0,	'Handmade Bags',	1,	1,	5,	NULL,	'506583233',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	1,	14,	37,	'2025-01-15 07:29:48',	'2025-01-15 07:30:23',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage.',	NULL,	NULL,	NULL),
(35,	1,	'KKT is a premium hat and cap brand known for its impeccable craftsmanship and stylish designs. Combining modern trends with classic styles, Crown & Brim offers a diverse collection of hats and caps that cater to various occasions, from casual wear to formal events. Each piece is made from high-quality materials to ensure comfort, durability, and a perfect fit.',	'KKT is a premium hat and cap brand known for its impeccable craftsmanship and stylish designs. Combining modern trends with classic styles, Crown & Brim offers a diverse collection of hats and caps that cater to various occasions, from casual wear to formal events. Each piece is made from high-quality materials to ensure comfort, durability, and a perfect fit.',	NULL,	NULL,	NULL,	NULL,	16,	16,	1,	0,	'Handmade Hats',	1,	1,	16,	NULL,	'36258394',	5,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	36,	'2025-01-15 07:22:51',	'2025-01-15 10:35:34',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage.',	NULL,	NULL,	'1'),
(37,	1,	'Ethereal Threads offers a collection that seamlessly blends contemporary style with classic allure, making it the perfect choice for those seeking refined, ethereal fashion that makes a statement.',	'Ethereal Threads offers a collection that seamlessly blends contemporary style with classic allure, making it the perfect choice for those seeking refined, ethereal fashion that makes a statement.',	NULL,	NULL,	NULL,	NULL,	17,	0,	1,	0,	'Handmade Bags',	1,	1,	17,	NULL,	'77279860',	0,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	38,	'2025-01-15 07:32:05',	NULL,	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage.',	'1',	NULL,	NULL),
(25,	1,	'This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.',	'This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.',	NULL,	NULL,	NULL,	NULL,	30,	30,	1,	0,	'Chic Rings',	1,	1,	30,	NULL,	'566301039',	5,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	26,	'2025-01-08 07:17:17',	'2025-01-15 07:32:47',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.',	NULL,	NULL,	NULL),
(38,	1,	'Ethereal Threads offers a collection that seamlessly blends contemporary style with classic allure, making it the perfect choice for those seeking refined, ethereal fashion that makes a statement.',	'Ethereal Threads offers a collection that seamlessly blends contemporary style with classic allure, making it the perfect choice for those seeking refined, ethereal fashion that makes a statement.',	NULL,	NULL,	NULL,	NULL,	30,	0,	1,	0,	'Luxe Jewelers',	1,	1,	30,	NULL,	'742743318',	0,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	39,	'2025-01-15 07:37:10',	NULL,	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage.',	NULL,	NULL,	NULL),
(1,	1,	'Ethereal Threads is a fashion brand that embodies elegance, sophistication, and timeless beauty. Specializing in meticulously crafted garments and accessories, the brand focuses on using delicate, high-quality fabrics to create designs that exude a sense of lightness and grace.',	'Ethereal Threads is a fashion brand that embodies elegance, sophistication, and timeless beauty. Specializing in meticulously crafted garments and accessories, the brand focuses on using delicate, high-quality fabrics to create designs that exude a sense of lightness and grace.',	NULL,	NULL,	NULL,	NULL,	4,	4,	1,	0,	'Ethereal Threads',	1,	1,	4,	NULL,	'432347888',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	1,	'2024-07-02 11:20:49',	'2025-01-15 10:34:18',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage.',	NULL,	NULL,	NULL),
(39,	1,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	17,	0,	1,	0,	'Infant Essentials',	1,	1,	17,	NULL,	'758157439',	6,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	40,	'2025-01-15 11:08:52',	NULL,	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	NULL,	NULL,	NULL,	NULL),
(41,	1,	'Playtopia is a vibrant and innovative toy brand dedicated to sparking creativity, learning, and fun for children of all ages. Our toys are thoughtfully designed to inspire imagination and encourage developmental growth, from educational puzzles to interactive playsets. With a focus on safety, quality, and sustainability, Playtopia ensures every toy is made with non-toxic materials and built to last.',	'Playtopia is a vibrant and innovative toy brand dedicated to sparking creativity, learning, and fun for children of all ages. Our toys are thoughtfully designed to inspire imagination and encourage developmental growth, from educational puzzles to interactive playsets. With a focus on safety, quality, and sustainability, Playtopia ensures every toy is made with non-toxic materials and built to last.',	NULL,	NULL,	NULL,	NULL,	5,	5,	1,	0,	'Playtopia',	1,	1,	5,	NULL,	'788058173',	5,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	42,	'2025-01-15 11:13:18',	'2025-01-15 11:15:22',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage.',	NULL,	NULL,	NULL),
(42,	1,	'ToyWhiz is a dynamic toy brand that brings joy and excitement to children by offering a wide range of high-quality, innovative toys. Designed to entertain, educate, and inspire, ToyWhiz products cater to various age groups and developmental stages, ensuring there’s something for every child. From creative building sets to interactive learning toys, we prioritize safety and durability, using eco-friendly materials that are kind to both kids and the planet.',	'ToyWhiz is a dynamic toy brand that brings joy and excitement to children by offering a wide range of high-quality, innovative toys. Designed to entertain, educate, and inspire, ToyWhiz products cater to various age groups and developmental stages, ensuring there’s something for every child. From creative building sets to interactive learning toys, we prioritize safety and durability, using eco-friendly materials that are kind to both kids and the planet.',	NULL,	NULL,	NULL,	NULL,	17,	0,	1,	0,	'ToyWhiz',	1,	1,	17,	NULL,	'428629879',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	43,	'2025-01-15 11:15:07',	NULL,	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage.',	NULL,	NULL,	NULL),
(44,	1,	'uxe Flame is a high-end candle brand dedicated to elevating your home with premium scents and elegant designs. Each candle is expertly crafted using eco-friendly waxes and infused with carefully selected fragrances to create a soothing, luxurious atmosphere. Whether it''s the warm glow of a vanilla bean or the refreshing aroma of ocean breeze, Luxe Flame offers a diverse collection that adds sophistication and serenity to any space.',	'uxe Flame is a high-end candle brand dedicated to elevating your home with premium scents and elegant designs. Each candle is expertly crafted using eco-friendly waxes and infused with carefully selected fragrances to create a soothing, luxurious atmosphere. Whether it''s the warm glow of a vanilla bean or the refreshing aroma of ocean breeze, Luxe Flame offers a diverse collection that adds sophistication and serenity to any space.',	NULL,	NULL,	NULL,	NULL,	5,	0,	1,	0,	'Luxe Flame',	1,	1,	5,	NULL,	'860851640',	5,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	45,	'2025-01-15 11:18:00',	NULL,	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage.',	NULL,	'1',	NULL),
(43,	1,	'Enchanted Wick is a luxury candle brand that transforms any space into a serene and inviting haven. Crafted with the finest ingredients, each candle is hand-poured and infused with unique, captivating scents that evoke a sense of tranquility and warmth. From soothing lavender to refreshing citrus blends, Enchanted Wick offers a range of premium candles that cater to every mood and occasion.',	'Enchanted Wick is a luxury candle brand that transforms any space into a serene and inviting haven. Crafted with the finest ingredients, each candle is hand-poured and infused with unique, captivating scents that evoke a sense of tranquility and warmth. From soothing lavender to refreshing citrus blends, Enchanted Wick offers a range of premium candles that cater to every mood and occasion.',	NULL,	NULL,	NULL,	NULL,	5,	5,	1,	0,	'Enchanted Wick',	1,	1,	5,	NULL,	'785073986',	0,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	44,	'2025-01-15 11:16:38',	'2025-01-15 11:18:18',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage.',	NULL,	NULL,	NULL),
(45,	1,	'Joyful Treasures is a holiday-focused gift brand that specializes in curating the perfect Christmas gifts to spread cheer and warmth. From personalized keepsakes and festive décor to cozy apparel and unique stocking stuffers, we offer a wide selection of thoughtfully crafted items for all ages.',	'Joyful Treasures is a holiday-focused gift brand that specializes in curating the perfect Christmas gifts to spread cheer and warmth. From personalized keepsakes and festive décor to cozy apparel and unique stocking stuffers, we offer a wide selection of thoughtfully crafted items for all ages.',	NULL,	NULL,	NULL,	NULL,	4,	0,	1,	0,	'Joyful Treasures',	1,	1,	4,	NULL,	'277981405',	0,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	46,	'2025-01-15 11:20:47',	NULL,	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage.',	NULL,	NULL,	NULL),
(47,	1,	'Shipment And Policies',	'Shipment And Policies',	NULL,	NULL,	NULL,	NULL,	59,	0,	1,	0,	'sab Maribe',	1,	1,	59,	NULL,	'243728389',	0,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	1,	0,	48,	'2025-01-15 13:25:10',	NULL,	NULL,	0,	0,	0,	0,	0,	'0',	0,	0,	NULL,	'Shipment And Policies',	'1',	'1',	'1'),
(40,	1,	'Cherished Beginnings is a premium baby gift brand dedicated to providing thoughtful and high-quality gifts for newborns and their families. Our carefully curated collection features a range of adorable and practical items, from soft blankets and plush toys to personalized keepsakes and essentials.',	'Cherished Beginnings is a premium baby gift brand dedicated to providing thoughtful and high-quality gifts for newborns and their families. Our carefully curated collection features a range of adorable and practical items, from soft blankets and plush toys to personalized keepsakes and essentials.',	NULL,	NULL,	NULL,	NULL,	16,	16,	1,	0,	'Cherished Beginnings',	1,	1,	16,	NULL,	'310909408',	1,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	41,	'2025-01-15 11:11:47',	'2025-01-15 11:24:41',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage.',	NULL,	NULL,	NULL),
(48,	1,	'mmmm',	'mmmm',	NULL,	NULL,	NULL,	NULL,	59,	59,	1,	0,	'Testing',	1,	1,	59,	NULL,	'924654054',	0,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	0,	49,	'2025-01-15 14:06:59',	'2025-01-15 14:58:51',	NULL,	0,	0,	0,	0,	0,	'0',	0,	0,	NULL,	'yyyy',	NULL,	NULL,	NULL),
(46,	1,	'Merry Moments is a Christmas gift brand dedicated to making the holiday season even more magical. Our curated collection features a wide range of festive gifts, from charming ornaments and personalized stockings to cozy winter essentials and luxurious holiday treats. Each item is selected to bring warmth, joy, and a touch of holiday spirit to every celebration.',	'Merry Moments is a Christmas gift brand dedicated to making the holiday season even more magical. Our curated collection features a wide range of festive gifts, from charming ornaments and personalized stockings to cozy winter essentials and luxurious holiday treats. Each item is selected to bring warmth, joy, and a touch of holiday spirit to every celebration.',	NULL,	NULL,	NULL,	NULL,	17,	17,	1,	0,	'Merry Moments',	1,	1,	17,	NULL,	'426861049',	4,	NULL,	NULL,	NULL,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	14,	47,	'2025-01-15 11:22:06',	'2025-01-24 06:13:58',	NULL,	0,	0,	0,	0,	0,	'0',	7,	0,	NULL,	'Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage.',	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS "product_attribute";
DROP SEQUENCE IF EXISTS product_attribute_attribute_id_seq;
CREATE SEQUENCE product_attribute_attribute_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."product_attribute" (
    "attribute_id" bigint DEFAULT nextval('product_attribute_attribute_id_seq') NOT NULL,
    "attribute_name" character varying(400),
    "attribute_status" integer DEFAULT '0' NOT NULL,
    "attribute_created_date" timestamp(0),
    "attribute_name_arabic" character varying(600),
    "attribute_type" integer,
    "is_deleted" integer DEFAULT '0',
    CONSTRAINT "product_attribute_pkey" PRIMARY KEY ("attribute_id")
) WITH (oids = false);

INSERT INTO "product_attribute" ("attribute_id", "attribute_name", "attribute_status", "attribute_created_date", "attribute_name_arabic", "attribute_type", "is_deleted") VALUES
(1,	'Size',	1,	NULL,	'',	1,	0),
(2,	'Color',	1,	NULL,	'',	1,	0);

DROP TABLE IF EXISTS "product_attribute_values";
DROP SEQUENCE IF EXISTS product_attribute_values_attribute_values_id_seq;
CREATE SEQUENCE product_attribute_values_attribute_values_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."product_attribute_values" (
    "attribute_values_id" bigint DEFAULT nextval('product_attribute_values_attribute_values_id_seq') NOT NULL,
    "attribute_id" integer DEFAULT '0' NOT NULL,
    "attribute_values" character varying(600),
    "attribute_values_arabic" character varying(600) NOT NULL,
    "attribute_value_in" integer DEFAULT '1' NOT NULL,
    "attribute_value_color" character varying(600),
    "attribute_value_label" character varying(600),
    "attribute_value_label_arabic" character varying(600),
    "attribute_value_image" character varying(600),
    "is_deleted" integer DEFAULT '0' NOT NULL,
    "attribute_value_sort_order" integer DEFAULT '0' NOT NULL,
    "attribute_color" character varying(600),
    CONSTRAINT "product_attribute_values_pkey" PRIMARY KEY ("attribute_values_id")
) WITH (oids = false);

INSERT INTO "product_attribute_values" ("attribute_values_id", "attribute_id", "attribute_values", "attribute_values_arabic", "attribute_value_in", "attribute_value_color", "attribute_value_label", "attribute_value_label_arabic", "attribute_value_image", "is_deleted", "attribute_value_sort_order", "attribute_color") VALUES
(1,	2,	'Red',	'',	1,	NULL,	NULL,	NULL,	NULL,	0,	0,	'#ffffff'),
(3,	1,	'XL',	'',	1,	NULL,	NULL,	NULL,	NULL,	0,	0,	'#ffffff'),
(2,	2,	'Black',	'',	1,	NULL,	NULL,	NULL,	NULL,	0,	0,	'#ffffff'),
(4,	2,	'Multicolor',	'',	1,	NULL,	NULL,	NULL,	NULL,	0,	0,	'#ffffff'),
(5,	2,	'Brown',	'',	1,	NULL,	NULL,	NULL,	NULL,	0,	0,	'#ffffff'),
(6,	2,	'White',	'',	1,	NULL,	NULL,	NULL,	NULL,	0,	0,	'#ffffff'),
(7,	2,	'Silver',	'',	1,	NULL,	NULL,	NULL,	NULL,	0,	0,	'#ffffff');

DROP TABLE IF EXISTS "product_category";
DROP SEQUENCE IF EXISTS product_category_product_category_id_seq;
CREATE SEQUENCE product_category_product_category_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."product_category" (
    "product_category_id" bigint DEFAULT nextval('product_category_product_category_id_seq') NOT NULL,
    "product_id" integer DEFAULT '0' NOT NULL,
    "category_id" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "product_category_pkey" PRIMARY KEY ("product_category_id")
) WITH (oids = false);

INSERT INTO "product_category" ("product_category_id", "product_id", "category_id") VALUES
(158,	22,	9),
(160,	36,	9),
(161,	37,	9),
(162,	25,	3),
(163,	26,	3),
(164,	21,	9),
(165,	38,	3),
(166,	20,	4),
(170,	17,	4),
(171,	16,	3),
(173,	29,	8),
(174,	29,	4),
(175,	28,	8),
(176,	28,	4),
(20,	5,	3),
(21,	6,	3),
(23,	9,	1),
(178,	31,	10),
(179,	32,	14),
(180,	32,	11),
(181,	11,	13),
(28,	7,	1),
(30,	10,	1),
(183,	2,	13),
(34,	12,	1),
(35,	13,	1),
(186,	30,	11),
(187,	1,	13),
(188,	8,	13),
(189,	35,	9),
(190,	33,	11),
(191,	19,	4),
(192,	15,	3),
(194,	27,	4),
(195,	18,	4),
(196,	39,	17),
(144,	34,	9),
(147,	3,	4),
(148,	4,	14),
(151,	14,	3),
(199,	42,	18),
(200,	41,	18),
(154,	23,	9),
(202,	44,	16),
(203,	43,	16),
(157,	24,	9),
(204,	45,	15),
(207,	40,	17),
(208,	47,	14),
(209,	47,	16),
(226,	48,	13),
(231,	46,	15);

DROP TABLE IF EXISTS "product_cuisines";
DROP SEQUENCE IF EXISTS product_cuisines_id_seq;
CREATE SEQUENCE product_cuisines_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."product_cuisines" (
    "id" bigint DEFAULT nextval('product_cuisines_id_seq') NOT NULL,
    "product_id" integer DEFAULT '0' NOT NULL,
    "cuisine_id" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "product_cuisines_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "product_docs";
DROP SEQUENCE IF EXISTS product_docs_id_seq;
CREATE SEQUENCE product_docs_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."product_docs" (
    "id" bigint DEFAULT nextval('product_docs_id_seq') NOT NULL,
    "product_id" integer DEFAULT '0' NOT NULL,
    "title" character varying(600),
    "doc_path" character varying(600),
    CONSTRAINT "product_docs_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "product_features";
DROP SEQUENCE IF EXISTS product_features_id_seq;
CREATE SEQUENCE product_features_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."product_features" (
    "id" bigint DEFAULT nextval('product_features_id_seq') NOT NULL,
    "name" character varying(255),
    "image_path" character varying(255),
    "description" character varying(255),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "product_features_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "product_features" ("id", "name", "image_path", "description", "created_at", "updated_at") VALUES
(2,	'Handmade item',	'1736270610677d6312b67ed.png',	NULL,	'2025-01-07 17:23:30',	'2025-01-07 17:23:30'),
(3,	'Materials',	'1736270671677d634f3ae55.png',	NULL,	'2025-01-07 17:24:31',	'2025-01-07 17:24:31'),
(4,	'Sustainable features:',	'1736270709677d63758cdc1.png',	NULL,	'2025-01-07 17:25:09',	'2025-01-07 17:25:09'),
(5,	'Style',	'1736270734677d638eb1694.png',	NULL,	'2025-01-07 17:25:34',	'2025-01-07 17:25:34'),
(6,	'personalized',	'1736270768677d63b028218.png',	NULL,	'2025-01-07 17:26:08',	'2025-01-07 17:26:08'),
(7,	'Recycled',	'1736270823677d63e7a6c28.png',	NULL,	'2025-01-07 17:27:03',	'2025-01-07 17:27:03'),
(8,	'Length',	'1736270853677d64052a1f8.png',	NULL,	'2025-01-07 17:27:33',	'2025-01-07 17:27:33'),
(9,	'Availability',	'1736270888677d642898c78.png',	NULL,	'2025-01-07 17:28:08',	'2025-01-07 17:28:08');

DROP TABLE IF EXISTS "product_images";
DROP SEQUENCE IF EXISTS product_images_id_seq;
CREATE SEQUENCE product_images_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."product_images" (
    "id" bigint DEFAULT nextval('product_images_id_seq') NOT NULL,
    "product_id" integer NOT NULL,
    "image_name" text NOT NULL,
    "product_attribute_id" integer NOT NULL,
    CONSTRAINT "product_images_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "product_items";
DROP SEQUENCE IF EXISTS product_items_item_id_seq;
CREATE SEQUENCE product_items_item_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."product_items" (
    "item_id" bigint DEFAULT nextval('product_items_item_id_seq') NOT NULL,
    "product_id" integer DEFAULT '0' NOT NULL,
    "name" character varying(255),
    "image_path" character varying(255),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "product_items_pkey" PRIMARY KEY ("item_id")
) WITH (oids = false);

INSERT INTO "product_items" ("item_id", "product_id", "name", "image_path", "created_at", "updated_at") VALUES
(10,	9,	'Test Item',	'products//1736160235_Frame 1526390.png',	NULL,	NULL),
(11,	9,	'Test Item',	'products//1736160235_Frame 1526390.png',	NULL,	NULL),
(13,	7,	NULL,	NULL,	NULL,	NULL),
(14,	11,	NULL,	NULL,	NULL,	NULL),
(15,	11,	NULL,	NULL,	NULL,	NULL),
(16,	11,	NULL,	NULL,	NULL,	NULL),
(17,	11,	NULL,	NULL,	NULL,	NULL),
(18,	8,	NULL,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS "product_likes";
DROP SEQUENCE IF EXISTS product_likes_id_seq;
CREATE SEQUENCE product_likes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."product_likes" (
    "id" bigint DEFAULT nextval('product_likes_id_seq') NOT NULL,
    "product_id" integer NOT NULL,
    "user_id" integer NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "product_likes_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "product_master";
DROP SEQUENCE IF EXISTS product_master_id_seq;
CREATE SEQUENCE product_master_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."product_master" (
    "id" bigint DEFAULT nextval('product_master_id_seq') NOT NULL,
    "name" character varying(600),
    "active" integer DEFAULT '0' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "product_master_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "product_master_request";
DROP SEQUENCE IF EXISTS product_master_request_id_seq;
CREATE SEQUENCE product_master_request_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."product_master_request" (
    "id" bigint DEFAULT nextval('product_master_request_id_seq') NOT NULL,
    "name" character varying(600),
    "description" character varying(600),
    "vendor_id" integer DEFAULT '0' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "accepted" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "product_type" integer DEFAULT '0' NOT NULL,
    "category" character varying(600),
    CONSTRAINT "product_master_request_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "product_product_feature";
DROP SEQUENCE IF EXISTS product_product_feature_id_seq;
CREATE SEQUENCE product_product_feature_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."product_product_feature" (
    "id" bigint DEFAULT nextval('product_product_feature_id_seq') NOT NULL,
    "product_id" integer,
    "product_feature_id" integer,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "feature_title" character varying(600),
    CONSTRAINT "product_product_feature_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "product_product_feature" ("id", "product_id", "product_feature_id", "created_at", "updated_at", "feature_title") VALUES
(142,	2,	3,	'2025-01-15 07:45:33',	'2025-01-15 07:45:33',	'Woolen'),
(143,	1,	3,	'2025-01-15 10:34:18',	'2025-01-15 10:34:18',	'Cotton'),
(144,	19,	7,	'2025-01-15 10:37:15',	'2025-01-15 10:37:15',	NULL),
(145,	19,	3,	'2025-01-15 10:37:15',	'2025-01-15 10:37:15',	'Glass, Wood'),
(146,	18,	3,	'2025-01-15 10:42:46',	'2025-01-15 10:42:46',	'Wood, Metal, Parachute'),
(147,	18,	5,	'2025-01-15 10:42:46',	'2025-01-15 10:42:46',	'Home box'),
(148,	39,	2,	'2025-01-15 11:08:52',	'2025-01-15 11:08:52',	NULL),
(149,	39,	3,	'2025-01-15 11:08:52',	'2025-01-15 11:08:52',	'Soft Cotton'),
(150,	42,	6,	'2025-01-15 11:15:07',	'2025-01-15 11:15:07',	NULL),
(151,	42,	2,	'2025-01-15 11:15:07',	'2025-01-15 11:15:07',	NULL),
(152,	47,	2,	'2025-01-15 13:25:10',	'2025-01-15 13:25:10',	'Washs'),
(153,	47,	3,	'2025-01-15 13:25:10',	'2025-01-15 13:25:10',	'Master Name'),
(156,	48,	2,	'2025-01-15 14:58:51',	'2025-01-15 14:58:51',	'Washs'),
(157,	48,	4,	'2025-01-15 14:58:51',	'2025-01-15 14:58:51',	'Plates'),
(158,	48,	7,	'2025-01-15 14:58:51',	'2025-01-15 14:58:51',	'Recycle'),
(107,	4,	3,	'2025-01-15 07:10:39',	'2025-01-15 07:10:39',	'Jute'),
(108,	4,	2,	'2025-01-15 07:10:39',	'2025-01-15 07:10:39',	NULL),
(109,	4,	7,	'2025-01-15 07:10:39',	'2025-01-15 07:10:39',	NULL),
(110,	4,	5,	'2025-01-15 07:10:39',	'2025-01-15 07:10:39',	'Unique'),
(117,	23,	3,	'2025-01-15 07:20:15',	'2025-01-15 07:20:15',	'Cotton, linen'),
(118,	23,	5,	'2025-01-15 07:20:15',	'2025-01-15 07:20:15',	'Cross'),
(121,	24,	3,	'2025-01-15 07:23:11',	'2025-01-15 07:23:11',	'Jute, Parachute'),
(122,	24,	5,	'2025-01-15 07:23:11',	'2025-01-15 07:23:11',	'Unique'),
(123,	22,	3,	'2025-01-15 07:24:42',	'2025-01-15 07:24:42',	'Jute, Parachute'),
(124,	22,	6,	'2025-01-15 07:24:42',	'2025-01-15 07:24:42',	NULL),
(125,	26,	7,	'2025-01-15 07:33:07',	'2025-01-15 07:33:07',	NULL),
(126,	26,	3,	'2025-01-15 07:33:07',	'2025-01-15 07:33:07',	'Zircoon, Gold'),
(127,	21,	3,	'2025-01-15 07:34:21',	'2025-01-15 07:34:21',	'Gold, Rose Gold, Silver, Platinum'),
(128,	21,	5,	'2025-01-15 07:34:21',	'2025-01-15 07:34:21',	'Persian'),
(129,	20,	3,	'2025-01-15 07:37:52',	'2025-01-15 07:37:52',	'Wood'),
(134,	17,	3,	'2025-01-15 07:40:20',	'2025-01-15 07:40:20',	'Wood'),
(135,	17,	8,	'2025-01-15 07:40:20',	'2025-01-15 07:40:20',	'King'),
(136,	29,	4,	'2025-01-15 07:41:11',	'2025-01-15 07:41:11',	'Recycled metal. Item may include additional materials or use methods that aren''t considered sustainable features on our site.'),
(137,	29,	3,	'2025-01-15 07:41:11',	'2025-01-15 07:41:11',	'Cotton, Velvet'),
(138,	31,	5,	'2025-01-15 07:42:52',	'2025-01-15 07:42:52',	'Unique'),
(139,	11,	3,	'2025-01-15 07:44:37',	'2025-01-15 07:44:37',	'Woolen'),
(140,	11,	8,	'2025-01-15 07:44:37',	'2025-01-15 07:44:37',	'32'),
(167,	46,	7,	'2025-01-24 06:13:58',	'2025-01-24 06:13:58',	NULL),
(168,	46,	3,	'2025-01-24 06:13:58',	'2025-01-24 06:13:58',	'Woolen'),
(169,	46,	2,	'2025-01-24 06:13:58',	'2025-01-24 06:13:58',	NULL);

DROP TABLE IF EXISTS "product_selected_attribute_list";
DROP SEQUENCE IF EXISTS product_selected_attribute_list_product_attribute_id_seq;
CREATE SEQUENCE product_selected_attribute_list_product_attribute_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."product_selected_attribute_list" (
    "product_attribute_id" bigint DEFAULT nextval('product_selected_attribute_list_product_attribute_id_seq') NOT NULL,
    "product_id" integer DEFAULT '0' NOT NULL,
    "manage_stock" integer DEFAULT '0' NOT NULL,
    "stock_quantity" double precision,
    "allow_back_order" integer DEFAULT '0' NOT NULL,
    "stock_status" integer DEFAULT '0' NOT NULL,
    "sold_individually" integer DEFAULT '0' NOT NULL,
    "weight" double precision,
    "length" double precision,
    "height" double precision,
    "width" double precision,
    "shipping_class" integer DEFAULT '0' NOT NULL,
    "sale_price" double precision,
    "regular_price" double precision,
    "taxable" integer DEFAULT '0' NOT NULL,
    "image" character varying(600),
    "shipping_note" character varying(600),
    "title" character varying(600),
    "rating" double precision,
    "rated_users" integer DEFAULT '0' NOT NULL,
    "image_temp" character varying(600),
    "barcode" character varying(600),
    "image_action" character varying(600),
    "pr_code" character varying(600),
    "product_desc" text,
    "product_full_descr" text,
    "size_chart" character varying(600),
    CONSTRAINT "product_selected_attribute_list_pkey" PRIMARY KEY ("product_attribute_id")
) WITH (oids = false);

INSERT INTO "product_selected_attribute_list" ("product_attribute_id", "product_id", "manage_stock", "stock_quantity", "allow_back_order", "stock_status", "sold_individually", "weight", "length", "height", "width", "shipping_class", "sale_price", "regular_price", "taxable", "image", "shipping_note", "title", "rating", "rated_users", "image_temp", "barcode", "image_action", "pr_code", "product_desc", "product_full_descr", "size_chart") VALUES
(12,	12,	0,	6,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	200,	200,	1,	'677ce6ac3f87b1736238764.jpg,677ce6ac3f9a31736238764.jpg,677ce6ac3fa551736238764.jpg,677ce6ac3faf81736238764.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	'Premium quality clothing, focusing on high-end fabrics and sophisticated designs.',	'Luxe Loom
Indulge in luxury with the Luxe Loom collection. This line offers high-end fabrics and sophisticated designs for those who seek a touch of elegance in their everyday wear. Perfect for both formal occasions and upscale casual looks.',	NULL),
(3,	3,	0,	563,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	359,	600,	1,	'6786bcb9c18d81736883385.jpg,6786bcb9c1cb41736883385.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'A custom wall light is a tailored lighting fixture designed to meet specific aesthetic and functional preferences. These lights can be made to fit any interior style, whether modern, rustic, or contemporary, and can be crafted in various shapes, sizes, and materials. Custom wall lights are often designed to complement the unique features of a space, providing both ambient and accent lighting.',	'A custom wall light is a tailored lighting fixture designed to meet specific aesthetic and functional preferences. These lights can be made to fit any interior style, whether modern, rustic, or contemporary, and can be crafted in various shapes, sizes, and materials. Custom wall lights are often designed to complement the unique features of a space, providing both ambient and accent lighting.',	NULL),
(14,	14,	0,	13,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	600,	650,	1,	'6786b959c42661736882521.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty. The word "Gleaming" suggests a radiant, shining quality, symbolizing the brilliance of fine jewelry. "Grace" adds an element of elegance and timeless appeal, evoking the delicate craftsmanship and refined designs that the brand offers.',	'Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty. The word "Gleaming" suggests a radiant, shining quality, symbolizing the brilliance of fine jewelry. "Grace" adds an element of elegance and timeless appeal, evoking the delicate craftsmanship and refined designs that the brand offers.',	NULL),
(4,	4,	0,	443,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	330,	500,	1,	'67875f6f60dca1736925039.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'Crown & Brim is a premium hat and cap brand known for its impeccable craftsmanship and stylish designs. Combining modern trends with classic styles, Crown & Brim offers a diverse collection of hats and caps that cater to various occasions, from casual wear to formal events. Each piece is made from high-quality materials to ensure comfort, durability, and a perfect fit.',	'Crown & Brim is a premium hat and cap brand known for its impeccable craftsmanship and stylish designs. Combining modern trends with classic styles, Crown & Brim offers a diverse collection of hats and caps that cater to various occasions, from casual wear to formal events. Each piece is made from high-quality materials to ensure comfort, durability, and a perfect fit.',	NULL),
(6,	6,	0,	456,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	559,	600,	1,	'677b9a75797e11736153717.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'Painters Palette, Floral Paint Palette, Botanical decorReal ,Pressed Flowers, Creative Artist Gift, Art lover tool, Mothers Day',	'High-quality dried flowers: Our natural dried flowers are organic, non-toxic and tasteless.
A resin palette is the ideal addition to your creative equipment, as resin is relatively easy to clean (though it is advisable to clean while the paint is wet - as you’ll need less water and time). Transparent resin also provides us with an excellent canvas to decorate for your aesthetic pleasure. This, in turn, allows you to paint your own canvas with beautiful equipment at hand.',	NULL),
(5,	5,	0,	6542,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	250,	400,	1,	'677b9a56720fd1736153686.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'Handmade Brown Textured Ceramic Lamp | Bedroom & Livingroom Lightning | Unique, Minimalist Designed',	'"Rocca Lamp" This piece will bring the minimalist attitude of nature into your home.
•This unique ceramic lamp is made from high quality brown stoneware clay using hand building techniques only. Fired at high temperature (1240°C)
•Will add value to your home with its organic texture and minimalist shape.',	NULL),
(8,	8,	0,	15,	0,	0,	0,	0,	0,	0,	0,	0,	180,	200,	1,	'6787602add37d1736925226.jpg,,',	NULL,	NULL,	NULL,	0,	NULL,	'',	NULL,	'',	'Experience the ultimate in comfort with the Cotton Luxe collection. Soft, breathable cotton meets luxurious designs in this line, providing the perfect balance of relaxed style and high-end quality.',	'Experience the ultimate in comfort with the Cotton Luxe collection. Soft, breathable cotton meets luxurious designs in this line, providing the perfect balance of relaxed style and high-end quality.',	NULL),
(2,	2,	0,	54644,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	500,	600,	1,	'67875e441c2cd1736924740.jpg,6787679d386691736927133.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'Vibrant Vibes is a fashion brand that embodies elegance, sophistication, and timeless beauty. Specializing in meticulously crafted garments and accessories, the brand focuses on using delicate, high-quality fabrics to create designs that exude a sense of lightness and grace.',	'Vibrant Vibes is a fashion brand that embodies elegance, sophistication, and timeless beauty. Specializing in meticulously crafted garments and accessories, the brand focuses on using delicate, high-quality fabrics to create designs that exude a sense of lightness and grace.',	NULL),
(9,	9,	0,	10,	0,	0,	0,	0,	0,	0,	0,	0,	100,	100,	1,	'677bb3eb488771736160235.png',	NULL,	NULL,	NULL,	0,	NULL,	'',	NULL,	'',	'Some Short DEscription',	'Some Long DEscription',	NULL),
(13,	13,	0,	6,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	300,	300,	1,	'677ce6dc9bad41736238812.jpg,677ce6dc9bf421736238812.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	'Modern, city-inspired clothing for a trendy, on-the-go lifestyle.',	'Designed for the modern city dweller, the Urban Weave collection blends contemporary designs with comfort and practicality. From sharp jackets to casual tees, these pieces are perfect for navigating the fast-paced urban lifestyle with style.',	NULL),
(10,	10,	0,	10,	0,	0,	0,	0,	0,	0,	0,	0,	100,	100,	1,	'677bc12405c2a1736163620.png,,,,',	NULL,	NULL,	NULL,	0,	NULL,	'',	NULL,	'',	'Test Short Description 1',	'Test Long Description 1',	NULL),
(16,	16,	0,	8,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	400,	400,	1,	'6786b8fdaaba11736882429.jpg,6786b8fdaaf941736882429.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty.',	'This name would be perfect for a jewelry vendor focused on high-quality, exquisite pieces that emphasize both beauty and grace. It suggests a brand that appeals to those who appreciate both luxury and understated elegance, making it a great fit for products such as diamond jewelry, fine gemstones, or elegant gold pieces.',	NULL),
(18,	18,	0,	3,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	1200,	2000,	1,	'6786bb7c5d9f01736883068.jpg,6786bb7c5dff91736883068.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'Vivid Interiors
Vivid Interiors is a décor brand that brings vibrant and colorful designs to life.',	'Vivid Interiors
Vivid Interiors is a décor brand that brings vibrant and colorful designs to life. Whether you''re looking for bold statement pieces or subtle accents, Vivid Interiors ensures that every corner of your home radiates with energy and style.',	NULL),
(20,	20,	0,	4,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	7000,	8000,	1,	'6786bb1dd59da1736882973.jpg,6786bb1dd605b1736882973.jpg,6786bcfe377881736883454.jpg,6786bcfe37a701736883454.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'Modern Nest
Modern Nest specializes in sleek, contemporary décor pieces that blend functionality and style.',	'Modern Nest
Modern Nest specializes in sleek, contemporary décor pieces that blend functionality and style. With an eye for cutting-edge trends, Modern Nest is perfect for those looking to create a fresh, stylish atmosphere in their homes.',	NULL),
(7,	8,	0,	6,	0,	0,	0,	0,	0,	0,	0,	0,	119,	120,	1,	'678767c132a181736927169.jpg,',	NULL,	NULL,	NULL,	0,	NULL,	'',	NULL,	'',	'Experience the ultimate in comfort with the Cotton Luxe collection. Soft, breathable cotton meets luxurious designs in this line, providing the perfect balance of relaxed style and high-end quality.',	'Experience the ultimate in comfort with the Cotton Luxe collection. Soft, breathable cotton meets luxurious designs in this line, providing the perfect balance of relaxed style and high-end quality.',	NULL),
(17,	17,	0,	3,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	4000,	4000,	1,	'6786bbd90afe51736883161.jpg,6786bbf903db81736883193.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'Vivid Interiors
Vivid Interiors is a décor brand that brings vibrant and colorful designs to life.',	'Vivid Interiors
Vivid Interiors is a décor brand that brings vibrant and colorful designs to life. Whether you''re looking for bold statement pieces or subtle accents, Vivid Interiors ensures that every corner of your home radiates with energy and style.',	NULL),
(19,	19,	0,	7,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	8000,	8000,	1,	'6786bad93d61d1736882905.jpg,67876612e4be51736926738.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'Opal & Oak combines nature-inspired designs with elegant craftsmanship.',	'Opal & Oak combines nature-inspired designs with elegant craftsmanship. The brand offers décor that incorporates natural materials like wood and stone, creating a harmonious and earthy aesthetic that elevates any home.',	NULL),
(15,	15,	0,	1,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	330,	330,	1,	'6786b922db0a81736882466.jpg,6786b922db5d01736882466.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty.',	'Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty. The word "Gleaming" suggests a radiant, shining quality, symbolizing the brilliance of fine jewelry. "Grace" adds an element of elegance and timeless appeal, evoking the delicate craftsmanship and refined designs that the brand offers.',	NULL),
(26,	25,	0,	45,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	400,	450,	1,	'6786b8b3ba8a71736882355.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.',	'This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.',	NULL),
(27,	26,	0,	20,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	500,	500,	1,	'6786b84fb91681736882255.jpg,6786b84fb97621736882255.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	NULL),
(25,	24,	0,	39,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	400,	400,	1,	'678761578a0921736925527.jpg,6787625f019fd1736925791.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.',	'This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.',	NULL),
(24,	23,	0,	35,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	350,	350,	1,	'6787618ecdac21736925582.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	NULL),
(30,	29,	0,	15,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	250,	250,	1,	'6786b78eb2eb41736882062.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	NULL),
(29,	28,	0,	15,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	250,	250,	1,	'6786b7e56f2841736882149.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	NULL,	NULL),
(31,	30,	0,	15,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	250,	250,	1,	'6786b742955981736881986.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	NULL),
(28,	27,	0,	20,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	500,	500,	1,	'6786b8054e6421736882181.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.',	'By registering, you agree to pay in full to secure your spot. The workshop covers painting and drawing techniques, and materials are provided (you may bring your own). Cancellations made 48 hours in advance receive a full refund; 50% refund is given for cancellations within 24-48 hours. No refunds for cancellations within 24 hours or no-shows. Participants must follow all safety guidelines and are responsible for their belongings. Photos and videos may be taken for promotional purposes. Disruptive behavior will result in removal without refund. Organizers are not liable for personal injury or property damage.',	NULL),
(38,	37,	0,	NULL,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	480,	500,	1,	'678764753586b1736926325.jpg,6787647535e3c1736926325.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	'Ethereal Threads offers a collection that seamlessly blends contemporary style with classic allure, making it the perfect choice for those seeking refined, ethereal fashion that makes a statement.',	'Ethereal Threads offers a collection that seamlessly blends contemporary style with classic allure, making it the perfect choice for those seeking refined, ethereal fashion that makes a statement.',	NULL),
(36,	35,	0,	12,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	100,	150,	1,	'6787624bed32f1736925771.jpg,6787624bedbf11736925771.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'KKT is a premium hat and cap brand known for its impeccable craftsmanship and stylish designs. Combining modern trends with classic styles, Crown & Brim offers a diverse collection of hats and caps that cater to various occasions, from casual wear to formal events. Each piece is made from high-quality materials to ensure comfort, durability, and a perfect fit.',	'KKT is a premium hat and cap brand known for its impeccable craftsmanship and stylish designs. Combining modern trends with classic styles, Crown & Brim offers a diverse collection of hats and caps that cater to various occasions, from casual wear to formal events. Each piece is made from high-quality materials to ensure comfort, durability, and a perfect fit.',	NULL),
(33,	32,	0,	25,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	250,	250,	1,	'6786b5329f38c1736881458.jpg,6787673164ce91736927025.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'Little Bundles has the cutest personalised gifts for newborn baby boys & baby girls in UAE.',	'Little Bundles has the cutest personalised gifts for newborn baby boys & baby girls in UAE. There are adorable options from Sophie La Giraffe, Citron and our own Mamas & Papas range to choose from.',	NULL),
(40,	39,	0,	NULL,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	1,	'67879744054ca1736939332.jpg,6787974405a6d1736939332.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(35,	34,	0,	10,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	300,	300,	1,	'67863001c24151736847361.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine.',	'Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Check out the Best Collections of Valentine’s day Gifts all across UAE and Surprise your Valentine with joy and romance. Take a look into Personalized cakes, Heart shaped caked, red velvet strawberry cakes, flowers, and sweets. Happy Valentines day! with loads of Love from GDO.',	NULL),
(39,	38,	0,	49,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	1200,	1500,	1,	'678765a6295e11736926630.jpg,678765a6298991736926630.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	'Ethereal Threads offers a collection that seamlessly blends contemporary style with classic allure, making it the perfect choice for those seeking refined, ethereal fashion that makes a statement.',	'Ethereal Threads offers a collection that seamlessly blends contemporary style with classic allure, making it the perfect choice for those seeking refined, ethereal fashion that makes a statement.',	NULL),
(1,	1,	0,	67656,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	449,	500,	1,	'677e7f8dc5d9d1736343437.jpg,67876785df5441736927109.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'Ethereal Threads is a fashion brand that embodies elegance, sophistication, and timeless beauty. Specializing in meticulously crafted garments and accessories, the brand focuses on using delicate, high-quality fabrics to create designs that exude a sense of lightness and grace.',	'Ethereal Threads is a fashion brand that embodies elegance, sophistication, and timeless beauty. Specializing in meticulously crafted garments and accessories, the brand focuses on using delicate, high-quality fabrics to create designs that exude a sense of lightness and grace.',	NULL),
(32,	31,	0,	15,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	400,	500,	1,	'6786b4bf63e201736881343.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'The best housewarming gifts last longer than your visits
Better sound, cleaner air or smarter lighting. Nothing says welcome home like new home electronics. And with these practical housewarming gifts, you can help them find new ways to make the most of their life at home – every day.',	'The best housewarming gifts last longer than your visits
Better sound, cleaner air or smarter lighting. Nothing says welcome home like new home electronics. And with these practical housewarming gifts, you can help them find new ways to make the most of their life at home – every day.',	NULL),
(11,	11,	0,	10,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	400,	450,	1,	'67876765887f11736927077.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'Classic Stitch Collection
Timeless elegance in every thread. The Classic Stitch Collection features versatile, wardrobe-staple pieces designed to last. From tailored blazers to sleek trousers, these items are perfect for those who appreciate enduring style and quality craftsmanship.',	'Classic Stitch Collection
Timeless elegance in every thread. The Classic Stitch Collection features versatile, wardrobe-staple pieces designed to last. From tailored blazers to sleek trousers, these items are perfect for those who appreciate enduring style and quality craftsmanship.',	NULL),
(34,	33,	0,	25,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	250,	250,	1,	'6786b4a22cdd21736881314.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'Everyday essentials: A quality wallet, a stylish watch, or a comfortable backpack. Self-care: Grooming products, gym membership, or a subscription box.',	'Practical Gifts: Everyday essentials: A quality wallet, a stylish watch, or a comfortable backpack. Self-care: Grooming products, gym membership, or a subscription box. The most important thing is to choose a gift that comes from the heart and shows him how much you care.',	NULL),
(41,	40,	0,	15,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	600,	700,	1,	'67879acd4a0d11736940237.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'Cherished Beginnings is a premium baby gift brand dedicated to providing thoughtful and high-quality gifts for newborns and their families. Our carefully curated collection features a range of adorable and practical items, from soft blankets and plush toys to personalized keepsakes and essentials.',	'Cherished Beginnings is a premium baby gift brand dedicated to providing thoughtful and high-quality gifts for newborns and their families. Our carefully curated collection features a range of adorable and practical items, from soft blankets and plush toys to personalized keepsakes and essentials.',	NULL),
(43,	42,	0,	20,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	250,	350,	1,	'678798bb034ca1736939707.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	'ToyWhiz is a dynamic toy brand that brings joy and excitement to children by offering a wide range of high-quality, innovative toys. Designed to entertain, educate, and inspire, ToyWhiz products cater to various age groups and developmental stages, ensuring there’s something for every child. From creative building sets to interactive learning toys, we prioritize safety and durability, using eco-friendly materials that are kind to both kids and the planet.',	'ToyWhiz is a dynamic toy brand that brings joy and excitement to children by offering a wide range of high-quality, innovative toys. Designed to entertain, educate, and inspire, ToyWhiz products cater to various age groups and developmental stages, ensuring there’s something for every child. From creative building sets to interactive learning toys, we prioritize safety and durability, using eco-friendly materials that are kind to both kids and the planet.',	NULL),
(42,	41,	0,	50,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	350,	450,	1,	'6787984e7658c1736939598.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'Playtopia is a vibrant and innovative toy brand dedicated to sparking creativity, learning, and fun for children of all ages. Our toys are thoughtfully designed to inspire imagination and encourage developmental growth, from educational puzzles to interactive playsets. With a focus on safety, quality, and sustainability, Playtopia ensures every toy is made with non-toxic materials and built to last.',	'Playtopia is a vibrant and innovative toy brand dedicated to sparking creativity, learning, and fun for children of all ages. Our toys are thoughtfully designed to inspire imagination and encourage developmental growth, from educational puzzles to interactive playsets. With a focus on safety, quality, and sustainability, Playtopia ensures every toy is made with non-toxic materials and built to last.',	NULL),
(45,	44,	0,	50,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	400,	650,	1,	'6787996874c361736939880.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	'uxe Flame is a high-end candle brand dedicated to elevating your home with premium scents and elegant designs. Each candle is expertly crafted using eco-friendly waxes and infused with carefully selected fragrances to create a soothing, luxurious atmosphere. Whether it''s the warm glow of a vanilla bean or the refreshing aroma of ocean breeze, Luxe Flame offers a diverse collection that adds sophistication and serenity to any space.',	'uxe Flame is a high-end candle brand dedicated to elevating your home with premium scents and elegant designs. Each candle is expertly crafted using eco-friendly waxes and infused with carefully selected fragrances to create a soothing, luxurious atmosphere. Whether it''s the warm glow of a vanilla bean or the refreshing aroma of ocean breeze, Luxe Flame offers a diverse collection that adds sophistication and serenity to any space.',	NULL),
(44,	43,	0,	40,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	550,	600,	1,	'678799161b3e01736939798.jpg,6787997a2d3191736939898.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'Enchanted Wick is a luxury candle brand that transforms any space into a serene and inviting haven. Crafted with the finest ingredients, each candle is hand-poured and infused with unique, captivating scents that evoke a sense of tranquility and warmth. From soothing lavender to refreshing citrus blends, Enchanted Wick offers a range of premium candles that cater to every mood and occasion.',	'Enchanted Wick is a luxury candle brand that transforms any space into a serene and inviting haven. Crafted with the finest ingredients, each candle is hand-poured and infused with unique, captivating scents that evoke a sense of tranquility and warmth. From soothing lavender to refreshing citrus blends, Enchanted Wick offers a range of premium candles that cater to every mood and occasion.',	NULL),
(46,	45,	0,	40,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	500,	750,	1,	'67879a0f6a23e1736940047.jpg,67879a0f6a81c1736940047.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	'Joyful Treasures is a holiday-focused gift brand that specializes in curating the perfect Christmas gifts to spread cheer and warmth. From personalized keepsakes and festive décor to cozy apparel and unique stocking stuffers, we offer a wide selection of thoughtfully crafted items for all ages.',	'Joyful Treasures is a holiday-focused gift brand that specializes in curating the perfect Christmas gifts to spread cheer and warmth. From personalized keepsakes and festive décor to cozy apparel and unique stocking stuffers, we offer a wide selection of thoughtfully crafted items for all ages.',	NULL),
(48,	47,	0,	10,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	123,	123,	1,	'6787b73629fa21736947510.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	'Shipment And Policies',	'Shipment And Policies',	NULL),
(49,	48,	0,	20,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	400,	500,	1,	'6787c1037f7f91736950019.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'0000000000',	'mmmm',	'mmmm',	NULL),
(47,	46,	0,	20,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	0,	350,	450,	1,	'67879a5e8318c1736940126.jpg',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	'000000000',	'Merry Moments is a Christmas gift brand dedicated to making the holiday season even more magical. Our curated collection features a wide range of festive gifts, from charming ornaments and personalized stockings to cozy winter essentials and luxurious holiday treats. Each item is selected to bring warmth, joy, and a touch of holiday spirit to every celebration.',	'Merry Moments is a Christmas gift brand dedicated to making the holiday season even more magical. Our curated collection features a wide range of festive gifts, from charming ornaments and personalized stockings to cozy winter essentials and luxurious holiday treats. Each item is selected to bring warmth, joy, and a touch of holiday spirit to every celebration.',	NULL);

DROP TABLE IF EXISTS "product_selected_attributes";
DROP SEQUENCE IF EXISTS product_selected_attributes_product_selected_attributes_id_seq;
CREATE SEQUENCE product_selected_attributes_product_selected_attributes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."product_selected_attributes" (
    "product_selected_attributes_id" bigint DEFAULT nextval('product_selected_attributes_product_selected_attributes_id_seq') NOT NULL,
    "attribute_id" integer DEFAULT '0' NOT NULL,
    "attribute_values_id" integer DEFAULT '0' NOT NULL,
    "product_id" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "product_selected_attributes_pkey" PRIMARY KEY ("product_selected_attributes_id")
) WITH (oids = false);

INSERT INTO "product_selected_attributes" ("product_selected_attributes_id", "attribute_id", "attribute_values_id", "product_id") VALUES
(1,	2,	1,	8),
(2,	2,	2,	8),
(3,	1,	3,	9),
(4,	2,	2,	10),
(5,	2,	1,	21),
(6,	2,	2,	21),
(7,	2,	1,	22),
(8,	2,	5,	36);

DROP TABLE IF EXISTS "product_specifications";
DROP SEQUENCE IF EXISTS product_specifications_prod_spec_id_seq;
CREATE SEQUENCE product_specifications_prod_spec_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."product_specifications" (
    "prod_spec_id" bigint DEFAULT nextval('product_specifications_prod_spec_id_seq') NOT NULL,
    "product_id" integer DEFAULT '0' NOT NULL,
    "spec_title" text,
    "spec_descp" text,
    "lang" integer DEFAULT '1',
    "spec_title_arabic" text,
    "spec_descp_arabic" text,
    CONSTRAINT "product_specifications_pkey" PRIMARY KEY ("prod_spec_id")
) WITH (oids = false);

INSERT INTO "product_specifications" ("prod_spec_id", "product_id", "spec_title", "spec_descp", "lang", "spec_title_arabic", "spec_descp_arabic") VALUES
(145,	29,	NULL,	NULL,	1,	NULL,	NULL),
(146,	29,	NULL,	NULL,	1,	NULL,	NULL),
(147,	31,	NULL,	NULL,	1,	NULL,	NULL),
(148,	11,	NULL,	NULL,	1,	NULL,	NULL),
(149,	11,	NULL,	NULL,	1,	NULL,	NULL),
(151,	2,	NULL,	NULL,	1,	NULL,	NULL),
(152,	1,	NULL,	NULL,	1,	NULL,	NULL),
(12,	9,	NULL,	NULL,	1,	NULL,	NULL),
(153,	19,	NULL,	NULL,	1,	NULL,	NULL),
(14,	7,	NULL,	NULL,	1,	NULL,	NULL),
(15,	7,	NULL,	NULL,	1,	NULL,	NULL),
(154,	19,	NULL,	NULL,	1,	NULL,	NULL),
(155,	18,	NULL,	NULL,	1,	NULL,	NULL),
(156,	18,	NULL,	NULL,	1,	NULL,	NULL),
(159,	48,	NULL,	NULL,	1,	NULL,	NULL),
(160,	48,	NULL,	NULL,	1,	NULL,	NULL),
(161,	48,	NULL,	NULL,	1,	NULL,	NULL),
(116,	4,	NULL,	NULL,	1,	NULL,	NULL),
(117,	4,	NULL,	NULL,	1,	NULL,	NULL),
(118,	4,	NULL,	NULL,	1,	NULL,	NULL),
(119,	4,	NULL,	NULL,	1,	NULL,	NULL),
(126,	23,	NULL,	NULL,	1,	NULL,	NULL),
(127,	23,	NULL,	NULL,	1,	NULL,	NULL),
(130,	24,	NULL,	NULL,	1,	NULL,	NULL),
(131,	24,	NULL,	NULL,	1,	NULL,	NULL),
(132,	22,	NULL,	NULL,	1,	NULL,	NULL),
(133,	22,	NULL,	NULL,	1,	NULL,	NULL),
(134,	26,	NULL,	NULL,	1,	NULL,	NULL),
(135,	26,	NULL,	NULL,	1,	NULL,	NULL),
(136,	21,	NULL,	NULL,	1,	NULL,	NULL),
(137,	21,	NULL,	NULL,	1,	NULL,	NULL),
(138,	20,	NULL,	NULL,	1,	NULL,	NULL),
(143,	17,	NULL,	NULL,	1,	NULL,	NULL),
(144,	17,	NULL,	NULL,	1,	NULL,	NULL),
(170,	46,	NULL,	NULL,	1,	NULL,	NULL),
(171,	46,	NULL,	NULL,	1,	NULL,	NULL),
(172,	46,	NULL,	NULL,	1,	NULL,	NULL);

DROP TABLE IF EXISTS "product_temp_image";
DROP SEQUENCE IF EXISTS product_temp_image_id_seq;
CREATE SEQUENCE product_temp_image_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."product_temp_image" (
    "id" bigint DEFAULT nextval('product_temp_image_id_seq') NOT NULL,
    "product_id" integer DEFAULT '0' NOT NULL,
    "product_attribute_id" integer DEFAULT '0' NOT NULL,
    "image" character varying(600),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "product_temp_image_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "product_variations";
DROP SEQUENCE IF EXISTS product_variations_product_variations_id_seq;
CREATE SEQUENCE product_variations_product_variations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."product_variations" (
    "product_variations_id" bigint DEFAULT nextval('product_variations_product_variations_id_seq') NOT NULL,
    "attribute_id" integer DEFAULT '0' NOT NULL,
    "attribute_values_id" integer DEFAULT '0' NOT NULL,
    "product_attribute_id" integer DEFAULT '0' NOT NULL,
    "product_id" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "product_variations_pkey" PRIMARY KEY ("product_variations_id")
) WITH (oids = false);

INSERT INTO "product_variations" ("product_variations_id", "attribute_id", "attribute_values_id", "product_attribute_id", "product_id") VALUES
(1,	2,	1,	7,	8),
(2,	2,	2,	8,	8),
(3,	1,	3,	9,	9),
(4,	2,	2,	10,	10);

DROP TABLE IF EXISTS "products";
DROP SEQUENCE IF EXISTS products_id_seq;
CREATE SEQUENCE products_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."products" (
    "id" bigint DEFAULT nextval('products_id_seq') NOT NULL,
    "product_type" integer DEFAULT '1' NOT NULL,
    "name" character varying(2500) NOT NULL,
    "active" integer DEFAULT '1' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "created_by" integer DEFAULT '0' NOT NULL,
    "updated_by" integer DEFAULT '0' NOT NULL,
    "company_id" integer DEFAULT '0' NOT NULL,
    "store_id" integer DEFAULT '0' NOT NULL,
    "description" text NOT NULL,
    "featured" integer DEFAULT '0' NOT NULL,
    "meta_title" text,
    "meta_description" text,
    "meta_keywords" text,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "products_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "promotion_banners";
DROP SEQUENCE IF EXISTS promotion_banners_id_seq;
CREATE SEQUENCE promotion_banners_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."promotion_banners" (
    "id" bigint DEFAULT nextval('promotion_banners_id_seq') NOT NULL,
    "title" character varying(255) NOT NULL,
    "image_name" text NOT NULL,
    "status" integer DEFAULT '1' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "url" character varying(1600),
    "type" integer DEFAULT '0' NOT NULL,
    "product" integer DEFAULT '0' NOT NULL,
    "service" integer DEFAULT '0' NOT NULL,
    "banner_type" integer DEFAULT '0' NOT NULL,
    "activity" integer DEFAULT '0' NOT NULL,
    "store" integer DEFAULT '0' NOT NULL,
    "category" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "promotion_banners_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "ratings";
DROP SEQUENCE IF EXISTS ratings_id_seq;
CREATE SEQUENCE ratings_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."ratings" (
    "id" bigint DEFAULT nextval('ratings_id_seq') NOT NULL,
    "type" integer DEFAULT '0' NOT NULL,
    "user_id" integer DEFAULT '0' NOT NULL,
    "product_id" integer DEFAULT '0' NOT NULL,
    "product_varient_id" integer DEFAULT '0' NOT NULL,
    "service_id" integer DEFAULT '0' NOT NULL,
    "vendor_id" integer DEFAULT '0' NOT NULL,
    "rating" double precision,
    "title" text,
    "comment" text,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "order_id" integer DEFAULT '0' NOT NULL,
    "name" character varying(255),
    "email" character varying(255),
    CONSTRAINT "ratings_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "ratings" ("id", "type", "user_id", "product_id", "product_varient_id", "service_id", "vendor_id", "rating", "title", "comment", "created_at", "updated_at", "order_id", "name", "email") VALUES
(1,	1,	15,	4,	4,	0,	0,	5,	'Quality',	'test',	'2025-01-13 17:45:06',	'2025-01-13 17:45:06',	12,	NULL,	NULL),
(2,	1,	15,	4,	4,	0,	0,	4,	'Delivery',	'test',	'2025-01-13 17:45:06',	'2025-01-13 17:45:06',	12,	NULL,	NULL),
(3,	1,	15,	4,	4,	0,	0,	5,	'Overl All',	'test',	'2025-01-13 17:45:06',	'2025-01-13 17:45:06',	12,	NULL,	NULL),
(4,	1,	9,	20,	20,	0,	0,	2.5,	'Quality',	'test',	'2025-01-14 10:31:37',	'2025-01-14 10:31:37',	13,	NULL,	NULL),
(5,	1,	9,	20,	20,	0,	0,	2.5,	'Delivery',	'test',	'2025-01-14 10:31:37',	'2025-01-14 10:31:37',	13,	NULL,	NULL),
(6,	1,	9,	20,	20,	0,	0,	2.5,	'Overl All',	'test',	'2025-01-14 10:31:37',	'2025-01-14 10:31:37',	13,	NULL,	NULL),
(7,	1,	9,	15,	15,	0,	0,	3,	'Quality',	'test review.',	'2025-01-14 12:33:37',	'2025-01-14 12:33:37',	20,	NULL,	NULL),
(8,	1,	9,	15,	15,	0,	0,	3,	'Delivery',	'test review.',	'2025-01-14 12:33:37',	'2025-01-14 12:33:37',	20,	NULL,	NULL),
(9,	1,	9,	15,	15,	0,	0,	3,	'Overl All',	'test review.',	'2025-01-14 12:33:37',	'2025-01-14 12:33:37',	20,	NULL,	NULL),
(10,	3,	9,	0,	0,	14,	0,	2,	'Quality',	'test workshop',	'2025-01-14 17:30:06',	'2025-01-14 17:30:06',	17,	NULL,	NULL),
(11,	3,	9,	0,	0,	14,	0,	3,	'Delivery',	'test workshop',	'2025-01-14 17:30:06',	'2025-01-14 17:30:06',	17,	NULL,	NULL),
(12,	3,	9,	0,	0,	14,	0,	2.5,	'Overl All',	'test workshop',	'2025-01-14 17:30:06',	'2025-01-14 17:30:06',	17,	NULL,	NULL),
(13,	2,	9,	0,	0,	0,	17,	3,	'Quality',	'test',	'2025-01-14 18:27:58',	'2025-01-14 18:27:58',	20,	NULL,	NULL),
(14,	2,	9,	0,	0,	0,	17,	2,	'Delivery',	'test',	'2025-01-14 18:27:58',	'2025-01-14 18:27:58',	20,	NULL,	NULL),
(15,	2,	9,	0,	0,	0,	17,	2.5,	'Overl All',	'test',	'2025-01-14 18:27:58',	'2025-01-14 18:27:58',	20,	NULL,	NULL),
(16,	2,	9,	0,	0,	0,	18,	2.5,	'Quality',	'tedtshjs',	'2025-01-14 18:35:19',	'2025-01-14 18:35:19',	20,	NULL,	NULL),
(17,	2,	9,	0,	0,	0,	18,	2.5,	'Delivery',	'tedtshjs',	'2025-01-14 18:35:19',	'2025-01-14 18:35:19',	20,	NULL,	NULL),
(18,	2,	9,	0,	0,	0,	18,	2.5,	'Overl All',	'tedtshjs',	'2025-01-14 18:35:19',	'2025-01-14 18:35:19',	20,	NULL,	NULL),
(19,	3,	9,	0,	0,	15,	0,	4,	'Quality',	'test',	'2025-01-14 19:09:05',	'2025-01-14 19:09:05',	18,	NULL,	NULL),
(20,	3,	9,	0,	0,	15,	0,	2,	'Delivery',	'test',	'2025-01-14 19:09:05',	'2025-01-14 19:09:05',	18,	NULL,	NULL),
(21,	3,	9,	0,	0,	15,	0,	3,	'Overl All',	'test',	'2025-01-14 19:09:05',	'2025-01-14 19:09:05',	18,	NULL,	NULL),
(22,	2,	9,	0,	0,	0,	16,	2,	'Quality',	'tedt store',	'2025-01-14 19:09:30',	'2025-01-14 19:09:30',	18,	NULL,	NULL),
(23,	2,	9,	0,	0,	0,	16,	3,	'Delivery',	'tedt store',	'2025-01-14 19:09:30',	'2025-01-14 19:09:30',	18,	NULL,	NULL),
(24,	2,	9,	0,	0,	0,	16,	2.5,	'Overl All',	'tedt store',	'2025-01-14 19:09:30',	'2025-01-14 19:09:30',	18,	NULL,	NULL),
(25,	3,	58,	0,	0,	15,	0,	5,	'Quality',	'gghhhj',	'2025-01-15 09:23:46',	'2025-01-15 09:23:46',	20,	NULL,	NULL),
(26,	3,	58,	0,	0,	15,	0,	4.5,	'Delivery',	'gghhhj',	'2025-01-15 09:23:46',	'2025-01-15 09:23:46',	20,	NULL,	NULL),
(27,	3,	58,	0,	0,	15,	0,	4.5,	'Overl All',	'gghhhj',	'2025-01-15 09:23:46',	'2025-01-15 09:23:46',	20,	NULL,	NULL),
(28,	2,	58,	0,	0,	0,	16,	5,	'Quality',	'gghhj',	'2025-01-15 09:23:54',	'2025-01-15 09:23:54',	20,	NULL,	NULL),
(29,	2,	58,	0,	0,	0,	16,	4.5,	'Delivery',	'gghhj',	'2025-01-15 09:23:54',	'2025-01-15 09:23:54',	20,	NULL,	NULL),
(30,	2,	58,	0,	0,	0,	16,	4.5,	'Overl All',	'gghhj',	'2025-01-15 09:23:54',	'2025-01-15 09:23:54',	20,	NULL,	NULL),
(31,	1,	0,	30,	1,	0,	0,	4,	'Accusantium dolor co',	'Sit lorem ut aut vo',	'2025-01-17 17:19:12',	'2025-01-17 17:19:12',	0,	'Whoopi Cabrera',	'xege@mailinator.com'),
(32,	1,	0,	34,	1,	0,	0,	1,	'good',	'ghyoyoyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy',	'2025-01-18 03:58:15',	'2025-01-18 03:58:15',	0,	'khkjg',	'anil@dxbusinessgroup.com'),
(33,	1,	1,	8,	1,	0,	0,	5,	'Good Color and Quantity',	'lorem ipsum lorem ipsum lorem ipsum',	'2025-01-18 14:55:18',	'2025-01-18 14:55:18',	0,	'Hiba User',	'hibauser@gmail.com'),
(34,	1,	1,	8,	1,	0,	0,	4,	'Culpa dolor ut prae',	'Eos quam ea velit',	'2025-01-18 16:16:14',	'2025-01-18 16:16:14',	0,	'Igor Curry',	'wiqyn@mailinator.com'),
(35,	1,	1,	8,	1,	0,	0,	1,	'Voluptate sed nemo i',	'Fuga Anim voluptati',	'2025-01-18 16:16:37',	'2025-01-18 16:16:37',	0,	'Joel Montoya',	'qyrune@mailinator.com');

DROP TABLE IF EXISTS "ratings_reply";
DROP SEQUENCE IF EXISTS ratings_reply_id_seq;
CREATE SEQUENCE ratings_reply_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."ratings_reply" (
    "id" bigint DEFAULT nextval('ratings_reply_id_seq') NOT NULL,
    "rating_id" integer DEFAULT '0' NOT NULL,
    "message" character varying(600),
    "user_id" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "ratings_reply_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "ratings_reply" ("id", "rating_id", "message", "user_id", "created_at", "updated_at") VALUES
(1,	11,	'test',	1,	'2025-01-17 15:13:51',	'2025-01-17 15:13:51');

DROP TABLE IF EXISTS "ref_history";
DROP SEQUENCE IF EXISTS ref_history_id_seq;
CREATE SEQUENCE ref_history_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."ref_history" (
    "id" bigint DEFAULT nextval('ref_history_id_seq') NOT NULL,
    "sender_id" bigint DEFAULT '0' NOT NULL,
    "accepted_user_id" bigint DEFAULT '0' NOT NULL,
    "name" character varying(255),
    "ref_code" character varying(255),
    "status" integer DEFAULT '0' NOT NULL,
    "discount" integer DEFAULT '0',
    "discount_type" character varying(255) DEFAULT '1',
    "deleted_at" timestamp(0),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "ref_history_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "report_reasons";
DROP SEQUENCE IF EXISTS report_reasons_id_seq;
CREATE SEQUENCE report_reasons_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."report_reasons" (
    "id" bigint DEFAULT nextval('report_reasons_id_seq') NOT NULL,
    "reason" character varying(255) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "report_reasons_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "reported_shops";
DROP SEQUENCE IF EXISTS reported_shops_id_seq;
CREATE SEQUENCE reported_shops_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."reported_shops" (
    "id" bigint DEFAULT nextval('reported_shops_id_seq') NOT NULL,
    "user_id" bigint NOT NULL,
    "shop_id" bigint NOT NULL,
    "reason_id" bigint,
    "description" text,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "reported_shops_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "service";
DROP SEQUENCE IF EXISTS service_id_seq;
CREATE SEQUENCE service_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."service" (
    "id" bigint DEFAULT nextval('service_id_seq') NOT NULL,
    "name" character varying(600),
    "image" character varying(600),
    "service_price" double precision,
    "active" integer DEFAULT '0' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "order" integer DEFAULT '0' NOT NULL,
    "description" text,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "included" text,
    "service_user_id" bigint,
    "building_type" character varying(255),
    "service_type" character varying(255),
    "contract_type" character varying(255),
    "duration" text DEFAULT '0' NOT NULL,
    "building_type_id" integer,
    "time" character varying(255),
    "document" character varying(255),
    "order_count" integer DEFAULT '0' NOT NULL,
    "service_price_type" text DEFAULT 'Hourly',
    "activity_id" integer DEFAULT '0' NOT NULL,
    "price_label" character varying(600),
    "sort_order" integer DEFAULT '0' NOT NULL,
    "from_date" character varying(200),
    "to_date" character varying(200),
    "seats" character varying(200),
    "term_and_condition" text,
    "work_shop_details" character varying(200),
    "to_time" character varying(200),
    "from_time" character varying(200),
    "location" character varying(200),
    "latitude" character varying(200),
    "longitude" character varying(200),
    "vendor_id" integer,
    "feature_image" character varying(255),
    CONSTRAINT "service_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."service"."service_type" IS '0 for one day, 1 for week, 2 for month';

COMMENT ON COLUMN "public"."service"."contract_type" IS '0 for fresh, 1 for Extention';

INSERT INTO "service" ("id", "name", "image", "service_price", "active", "deleted", "order", "description", "created_at", "updated_at", "included", "service_user_id", "building_type", "service_type", "contract_type", "duration", "building_type_id", "time", "document", "order_count", "service_price_type", "activity_id", "price_label", "sort_order", "from_date", "to_date", "seats", "term_and_condition", "work_shop_details", "to_time", "from_time", "location", "latitude", "longitude", "vendor_id", "feature_image") VALUES
(5,	'Vendor Event',	'1736285259677d9c4b18414.jpg',	12,	0,	1,	0,	NULL,	'2025-01-07 21:27:39',	'2025-01-15 08:01:48',	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	'2025-01-09',	'2025-01-16',	'20',	'Here are our conditions',	NULL,	NULL,	NULL,	'2HRR+VG2 - Dubai - United Arab Emirates',	'25.0421408',	'55.5912693',	NULL,	'173673551567847b1bb3dcd.jpg'),
(1,	'Next',	'1736238076677ce3fc84db2.JPG',	200,	0,	1,	0,	'give',	'2025-01-07 08:21:16',	'2025-01-08 06:31:40',	NULL,	NULL,	NULL,	NULL,	NULL,	'300',	NULL,	NULL,	NULL,	0,	NULL,	0,	'200',	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(7,	'Tesla1',	'1736287391677da49f65395.jpg',	60,	0,	1,	0,	NULL,	'2025-01-07 22:03:11',	'2025-01-15 08:01:55',	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	'2025-01-30',	'2025-02-01',	'20',	'given',	NULL,	'06:06',	'11:22',	'Mulberry 2 building B1 - دبي - United Arab Emirates',	'25.1093069',	'55.2487733',	NULL,	'173673548467847afc34758.jpg'),
(6,	'Egypt',	'1736287067677da35b2833a.jpg',	20,	0,	1,	0,	NULL,	'2025-01-07 21:57:47',	'2025-01-15 08:02:04',	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	'2025-01-09',	'2025-01-09',	'20',	'AVailable AVailableAVailable AVailableAVailable AVailableAVailable AVailableAVailable AVailableAVailable AVailable',	NULL,	'22:02',	'11:33',	'465W+8R4 - Dubai - United Arab Emirates',	'25.1084406',	'55.2469174',	NULL,	'173673550067847b0c73a8d.jpg'),
(2,	'Pottery Worskhop',	'1736247725677d09ad197f7.png',	100,	1,	0,	0,	NULL,	'2025-01-07 08:52:58',	'2025-01-15 13:39:04',	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	NULL,	'15',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',	NULL,	NULL,	NULL,	'Dubai International Airport (DXB) - Dubai - United Arab Emirates',	'25.2566932',	'55.36431779999999',	17,	NULL),
(3,	'Next2',	'1736245273677d00196a04a.JPG',	200,	0,	1,	0,	'Term And ConditionsTerm And ConditionsTerm And ConditionsTerm And Conditions',	'2025-01-07 10:21:13',	'2025-01-13 02:32:05',	NULL,	NULL,	NULL,	NULL,	NULL,	'300',	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	'2025-01-08',	'2025-01-10',	'20',	'Term And ConditionsTerm And ConditionsTerm And ConditionsTerm And Conditions Term And ConditionsTerm And ConditionsTerm And ConditionsTerm And Conditions',	'Term And ConditionsTerm And ConditionsTerm And ConditionsTerm And Conditions',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(8,	'Test 1',	'1736288286677da81eb6eb0.png',	80,	0,	1,	0,	NULL,	'2025-01-07 22:18:06',	'2025-01-15 08:01:35',	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	'2025-01-07',	'2025-01-31',	'12',	'Test Terms',	NULL,	'15:17',	'15:17',	'سابقا - 673C+W8J - Dubai - United Arab Emirates',	'25.204819000000008',	'55.27075933862303',	NULL,	'173673546767847aeb13ce6.jpg'),
(10,	'Crafted Dimensions',	'173692798767876af30c491.jpg',	20,	1,	0,	0,	NULL,	'2025-01-08 10:33:48',	'2025-01-15 13:38:09',	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	'2025-01-09',	'2025-01-09',	'20',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',	NULL,	'22:22',	'11:01',	'3MQ3+R22, Makhdum Rashid, Multan, Punjab, Pakistan',	'30.0895212',	'71.65250259999999',	4,	NULL),
(9,	'Stonecraft Studios',	'173692808767876b57202a6.jpg',	100,	1,	0,	0,	NULL,	'2025-01-07 22:20:36',	'2025-01-15 13:38:24',	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	'2025-01-07',	'2025-02-20',	'15',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',	NULL,	'15:20',	'15:19',	'673C+W8J - سابقا - Dubai - United Arab Emirates',	'25.204624852707955',	'55.27080225396727',	18,	NULL),
(13,	'Artistry in Stone',	'173692777467876a1e5b58e.jpg',	80,	1,	0,	0,	NULL,	'2025-01-08 19:24:37',	'2025-01-15 13:37:17',	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	'2025-01-08',	'2025-02-27',	'14',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',	NULL,	'12:22',	'12:22',	'673C+P8 - Dubai - United Arab Emirates',	'25.204819',	'55.270931',	5,	NULL),
(12,	'Sculpture Workshop',	'173692762267876986d3599.jpg',	300,	1,	0,	0,	NULL,	'2025-01-08 14:25:03',	'2025-01-15 13:37:35',	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	'2025-01-08',	'2025-03-30',	'20',	'By registering, you agree to pay in full to secure your spot. The workshop covers painting and drawing techniques, and materials are provided (you may bring your own). Cancellations made 48 hours in advance receive a full refund; 50% refund is given for cancellations within 24-48 hours. No refunds for cancellations within 24 hours or no-shows. Participants must follow all safety guidelines and are responsible for their belongings. Photos and videos may be taken for promotional purposes. Disruptive behavior will result in removal without refund. Organizers are not liable for personal injury or property damage.',	NULL,	'18:23',	'18:23',	'Level 14, Boulevard Plaza Tower 1 - Sheikh Mohammed bin Rashid Blvd - Downtown Dubai - Burj Residence Phase I & II - Dubai - United Arab Emirates',	'25.193402613114053',	'55.2730767672119',	17,	NULL),
(11,	'Drawing & Painting',	'1736927673678769b9e05ea.jpg',	500,	1,	0,	0,	NULL,	'2025-01-08 14:22:29',	'2025-01-15 13:37:50',	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	'2025-01-08',	'2025-03-30',	'20',	'By registering, you agree to pay in full to secure your spot. The workshop covers painting and drawing techniques, and materials are provided (you may bring your own). Cancellations made 48 hours in advance receive a full refund; 50% refund is given for cancellations within 24-48 hours. No refunds for cancellations within 24 hours or no-shows. Participants must follow all safety guidelines and are responsible for their belongings. Photos and videos may be taken for promotional purposes. Disruptive behavior will result in removal without refund. Organizers are not liable for personal injury or property damage.',	NULL,	'19:22',	'18:21',	'7 27th St - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates',	'25.201168979102967',	'55.241662735229475',	18,	NULL),
(14,	'Molded Masterpieces',	'173692782967876a55e23b8.jpg',	45,	1,	0,	0,	NULL,	'2025-01-08 19:28:53',	'2025-01-15 13:37:05',	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	'2025-01-08',	'2025-01-16',	'12',	NULL,	NULL,	'12:27',	'12:27',	'673C+W8J - سابقا - Dubai - United Arab Emirates',	'25.204751048482994',	'55.27058767724608',	16,	NULL),
(15,	'Form & Shape',	'173692789667876a98dcacc.jpg',	30,	1,	0,	0,	NULL,	'2025-01-14 17:34:50',	'2025-01-23 07:14:31',	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	'2025-01-22',	'2025-01-30',	'30',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',	NULL,	'04:44',	'11:22',	'14 39b St - Za''abeel - Za''abeel 2 - Dubai - United Arab Emirates',	'25.202100909735144',	'55.28869795251463',	22,	NULL),
(16,	'Bookie bookie',	'1737630082679221820911c.jpg',	500,	1,	0,	0,	NULL,	'2025-01-23 11:01:22',	'2025-01-23 12:07:27',	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	'2025-01-23',	'2025-01-31',	'5',	'test',	NULL,	NULL,	NULL,	'12 4 St - Za''abeel - Za''abeel 2 - Dubai - United Arab Emirates',	'25.205976110964443',	'55.28158258896379',	26,	NULL),
(19,	'44345',	NULL,	23,	1,	0,	0,	NULL,	'2025-01-24 14:46:19',	'2025-01-24 14:46:19',	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	'223423-04-23',	NULL,	'234234',	'2342',	NULL,	NULL,	NULL,	'674G+29F - Sheikh Zayed Rd - Trade Centre - Trade CentreDIFC - Dubai - United Arab Emirates',	'25.20489665883013',	'55.27608084130858',	65,	NULL),
(20,	'44345llll',	NULL,	23,	1,	0,	0,	NULL,	'2025-01-24 14:49:41',	'2025-01-24 14:49:41',	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	'223423-04-23',	NULL,	'234234',	'2342',	NULL,	NULL,	NULL,	'Zaabeel - Za''abeel 2 - Dubai - United Arab Emirates',	'25.205595586071798',	'55.27882742333983',	65,	NULL),
(18,	'poble',	'17377297656793a6e562d6f.jpg',	45,	0,	1,	0,	NULL,	'2025-01-24 14:42:45',	'2025-01-24 15:03:15',	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	NULL,	'45',	'teest',	NULL,	NULL,	NULL,	'6822+H7 - Za''abeel - Za''abeel 2 - Dubai - United Arab Emirates',	'25.201634945310758',	'55.301830047851546',	65,	NULL),
(21,	'ppppp',	NULL,	323,	1,	0,	0,	NULL,	'2025-01-24 14:50:14',	'2025-01-25 07:21:39',	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	NULL,	'234',	'234234',	NULL,	NULL,	NULL,	'673H+45M - Al Mustaqbal St - Trade Centre - Dubai - United Arab Emirates',	'25.202844348533358',	'55.27788162231445',	65,	NULL);

DROP TABLE IF EXISTS "service_assigned_vendors";
DROP SEQUENCE IF EXISTS service_assigned_vendors_id_seq;
CREATE SEQUENCE service_assigned_vendors_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."service_assigned_vendors" (
    "id" bigint DEFAULT nextval('service_assigned_vendors_id_seq') NOT NULL,
    "vendor_user_id" integer NOT NULL,
    "order_id" integer NOT NULL,
    "service_status" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "service_assigned_vendors_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "service_bookings";
DROP SEQUENCE IF EXISTS service_bookings_id_seq;
CREATE SEQUENCE service_bookings_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."service_bookings" (
    "id" bigint DEFAULT nextval('service_bookings_id_seq') NOT NULL,
    "service_id" integer DEFAULT '0',
    "user_id" integer DEFAULT '0',
    "vendor_id" integer DEFAULT '0',
    "seat_no" character varying(600) DEFAULT '0',
    "status" character varying(255),
    "payment_type" character varying(255),
    "price" character varying(255),
    "service_charge" character varying(255),
    "Workshop_price" character varying(255),
    "tax" character varying(255),
    "grand_total" character varying(255),
    "ref_id" character varying(255),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "number_of_seats" character varying(255),
    "order_number" character varying(255),
    CONSTRAINT "service_bookings_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "service_bookings" ("id", "service_id", "user_id", "vendor_id", "seat_no", "status", "payment_type", "price", "service_charge", "Workshop_price", "tax", "grand_total", "ref_id", "created_at", "updated_at", "number_of_seats", "order_number") VALUES
(1,	14,	15,	18,	NULL,	'pending',	'1',	'45',	'0',	'45',	'2.25',	'47.25',	'14',	'2025-01-11 11:43:09',	'2025-01-11 11:43:09',	NULL,	NULL),
(2,	14,	15,	18,	'11',	'pending',	'1',	'45',	'0',	'45',	'2.25',	'47.25',	'14',	'2025-01-11 11:45:51',	'2025-01-11 11:45:51',	NULL,	NULL),
(3,	14,	15,	18,	'11',	'1',	'1',	'45',	'0',	'45',	'2.25',	'47.25',	'14',	'2025-01-11 11:50:02',	'2025-01-11 11:58:44',	NULL,	NULL),
(4,	14,	15,	18,	'12',	'1',	'1',	'45',	'0',	'45',	'2.25',	'47.25',	'14',	'2025-01-11 12:00:50',	'2025-01-11 12:01:16',	NULL,	NULL),
(5,	14,	13,	18,	'20',	'1',	'1',	'45',	'0',	'45',	'2.25',	'47.25',	'14',	'2025-01-11 14:05:19',	'2025-01-11 14:13:42',	NULL,	NULL),
(6,	14,	13,	18,	'13',	'1',	'1',	'45',	'0',	'45',	'2.25',	'47.25',	'14',	'2025-01-11 14:28:32',	'2025-01-11 15:07:56',	NULL,	NULL),
(7,	14,	15,	18,	'6,7',	'1',	'1',	'45',	'0',	'90',	'9',	'198',	'14',	'2025-01-11 16:15:29',	'2025-01-11 16:15:50',	NULL,	NULL),
(8,	14,	15,	18,	'2,3',	'1',	'1',	'45',	'0',	'90',	'9',	'198',	'14',	'2025-01-11 16:21:52',	'2025-01-11 16:22:20',	'2',	NULL),
(9,	14,	15,	18,	'7,8',	'1',	'1',	'90',	'0',	'45',	'9',	'99',	'14',	'2025-01-11 16:25:37',	'2025-01-11 16:25:50',	'2',	NULL),
(10,	13,	15,	NULL,	'7,8',	'1',	'1',	'80',	'0',	'160',	'16',	'176',	'13',	'2025-01-11 16:27:48',	'2025-01-11 16:28:08',	'2',	NULL),
(11,	14,	15,	18,	'1',	'pending',	'1',	'45',	'0',	'45',	'2.25',	'47.25',	'14',	'2025-01-11 20:43:25',	'2025-01-11 20:43:25',	'1',	NULL),
(12,	14,	9,	18,	'4,5',	'1',	'1',	'90',	'0',	'45',	'9',	'99',	'14',	'2025-01-11 20:54:46',	'2025-01-11 20:55:21',	'2',	NULL),
(13,	12,	9,	NULL,	'3,9,17,5',	'1',	'1',	'1200',	'0',	'300',	'240',	'1440',	'12',	'2025-01-11 23:00:37',	'2025-01-11 23:01:00',	'4',	NULL),
(14,	6,	9,	NULL,	'4,3',	'1',	'1',	'40',	'0',	'20',	'4',	'44',	'6',	'2025-01-13 08:36:33',	'2025-01-13 08:36:58',	'2',	'6784d09173eb9'),
(15,	12,	15,	NULL,	'2,8',	'1',	'1',	'600',	'0',	'300',	'60',	'660',	'12',	'2025-01-13 10:03:47',	'2025-01-13 10:04:15',	'2',	'6784e5036c681'),
(16,	11,	15,	NULL,	'16,17,18',	'1',	'1',	'1500',	'0',	'500',	'225',	'1725',	'11',	'2025-01-13 12:02:31',	'2025-01-13 12:02:50',	'3',	'678500d7e5b78'),
(17,	14,	9,	NULL,	'9',	'1',	'1',	'45',	'0',	'45',	'2.25',	'47.25',	'14',	'2025-01-14 16:33:17',	'2025-01-14 16:33:33',	'1',	'678691cd32c31'),
(18,	15,	9,	16,	'1',	'1',	'1',	'30',	'0',	'30',	'1.5',	'31.5',	'15',	'2025-01-14 18:37:07',	'2025-01-14 18:37:23',	'1',	'6786aed38c3e3'),
(19,	15,	57,	0,	'2,3',	'confirmed',	'1',	'30',	NULL,	NULL,	'1.5',	'63',	NULL,	'2025-01-15 07:15:38',	'2025-01-15 07:15:38',	'2',	'6787609a5344f'),
(20,	15,	58,	16,	'4,10,5,11',	'1',	'1',	'120',	'0',	'30',	'24',	'144',	'15',	'2025-01-15 09:22:10',	'2025-01-15 09:22:33',	'4',	'67877e4245f25'),
(21,	14,	58,	16,	'10',	'1',	'1',	'45',	'0',	'45',	'2.25',	'47.25',	'14',	'2025-01-15 09:24:32',	'2025-01-15 09:24:50',	'1',	'67877ed0407a0'),
(22,	11,	60,	0,	'1,2',	'confirmed',	'1',	'500',	NULL,	NULL,	'25',	'1050',	NULL,	'2025-01-15 15:03:01',	'2025-01-15 15:03:01',	'2',	'6787ce254be58'),
(23,	15,	15,	16,	'14,15',	'1',	'1',	'60',	'0',	'30',	'6',	'66',	'15',	'2025-01-15 15:08:24',	'2025-01-15 15:08:42',	'2',	'6787cf68f3242'),
(24,	15,	14,	16,	'9,8',	'pending',	'1',	'60',	'0',	'30',	'6',	'66',	'15',	'2025-01-15 15:16:24',	'2025-01-15 15:16:24',	'2',	'6787d1488a381'),
(25,	12,	52,	17,	'4,10',	'pending',	'1',	'600',	'0',	'300',	'60',	'660',	'12',	'2025-01-17 06:42:37',	'2025-01-17 06:42:37',	'2',	'6789fbdd97ea7'),
(26,	13,	55,	0,	'2,3,4',	'confirmed',	'1',	'80',	NULL,	NULL,	'12',	'252',	NULL,	'2025-01-17 17:37:35',	'2025-01-17 17:37:35',	'3',	'678a955fa56fe');

DROP TABLE IF EXISTS "service_category";
DROP SEQUENCE IF EXISTS service_category_id_seq;
CREATE SEQUENCE service_category_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."service_category" (
    "id" bigint DEFAULT nextval('service_category_id_seq') NOT NULL,
    "name" character varying(600),
    "image" character varying(600),
    "banner_image" character varying(600),
    "parent_id" integer DEFAULT '0' NOT NULL,
    "active" integer DEFAULT '0' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "order" integer DEFAULT '0' NOT NULL,
    "description" character varying(600),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "activity_id" integer DEFAULT '0' NOT NULL,
    "sort_order" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "service_category_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "service_category" ("id", "name", "image", "banner_image", "parent_id", "active", "deleted", "order", "description", "created_at", "updated_at", "activity_id", "sort_order") VALUES
(1,	'Event Category',	'1736237862677ce3267e26c.jpg',	'1736237862677ce3267fc4c.JPG',	0,	1,	0,	0,	'done',	'2025-01-07 08:17:42',	'2025-01-07 08:17:42',	6,	0);

DROP TABLE IF EXISTS "service_category_selected";
DROP SEQUENCE IF EXISTS service_category_selected_id_seq;
CREATE SEQUENCE service_category_selected_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."service_category_selected" (
    "id" bigint DEFAULT nextval('service_category_selected_id_seq') NOT NULL,
    "service_id" integer DEFAULT '0' NOT NULL,
    "category_id" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "service_category_selected_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "service_category_selected" ("id", "service_id", "category_id") VALUES
(1,	1,	1),
(2,	2,	1);

DROP TABLE IF EXISTS "service_event_feature";
DROP SEQUENCE IF EXISTS service_event_feature_id_seq;
CREATE SEQUENCE service_event_feature_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."service_event_feature" (
    "id" bigint DEFAULT nextval('service_event_feature_id_seq') NOT NULL,
    "service_id" integer,
    "event_feature_id" integer,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "feature_title" character varying(600),
    CONSTRAINT "service_event_feature_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "service_event_feature" ("id", "service_id", "event_feature_id", "created_at", "updated_at", "feature_title") VALUES
(20,	8,	1,	'2025-01-13 02:31:07',	'2025-01-13 02:31:07',	NULL),
(21,	7,	1,	'2025-01-13 02:31:24',	'2025-01-13 02:31:24',	NULL),
(22,	6,	1,	'2025-01-13 02:31:40',	'2025-01-13 02:31:40',	NULL),
(23,	5,	1,	'2025-01-13 02:31:55',	'2025-01-13 02:31:55',	NULL),
(33,	14,	1,	'2025-01-15 13:37:05',	'2025-01-15 13:37:05',	'English'),
(34,	13,	1,	'2025-01-15 13:37:17',	'2025-01-15 13:37:17',	'Dubai'),
(35,	12,	1,	'2025-01-15 13:37:35',	'2025-01-15 13:37:35',	'English, Urdu, Arabic'),
(36,	9,	1,	'2025-01-15 13:38:24',	'2025-01-15 13:38:24',	'Business Bay'),
(37,	15,	1,	'2025-01-23 07:14:31',	'2025-01-23 07:14:31',	'Za''abeel - Za''abeel 2 - Dubai');

DROP TABLE IF EXISTS "service_images";
DROP SEQUENCE IF EXISTS service_images_id_seq;
CREATE SEQUENCE service_images_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."service_images" (
    "id" bigint DEFAULT nextval('service_images_id_seq') NOT NULL,
    "service_id" bigint NOT NULL,
    "image" character varying(255) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "service_images_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "service_images" ("id", "service_id", "image", "created_at", "updated_at") VALUES
(2,	12,	'173692762267876986d59d2.jpg',	'2025-01-15 07:53:42',	'2025-01-15 07:53:42'),
(3,	11,	'1736927673678769b9e2bda.jpg',	'2025-01-15 07:54:33',	'2025-01-15 07:54:33'),
(4,	13,	'173692777467876a1e5dd01.jpg',	'2025-01-15 07:56:14',	'2025-01-15 07:56:14'),
(5,	14,	'173692782967876a55e42f1.jpg',	'2025-01-15 07:57:09',	'2025-01-15 07:57:09'),
(6,	15,	'173692789667876a98df415.jpg',	'2025-01-15 07:58:16',	'2025-01-15 07:58:16'),
(7,	10,	'173692798767876af30eb46.jpg',	'2025-01-15 07:59:47',	'2025-01-15 07:59:47');

DROP TABLE IF EXISTS "service_include";
DROP SEQUENCE IF EXISTS service_include_id_seq;
CREATE SEQUENCE service_include_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."service_include" (
    "id" bigint DEFAULT nextval('service_include_id_seq') NOT NULL,
    "service_id" integer,
    "title" character varying(255),
    "description" text,
    "icon" character varying(600),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "service_include_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "service_order_status_history";
DROP SEQUENCE IF EXISTS service_order_status_history_id_seq;
CREATE SEQUENCE service_order_status_history_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."service_order_status_history" (
    "id" bigint DEFAULT nextval('service_order_status_history_id_seq') NOT NULL,
    "order_id" integer DEFAULT '0' NOT NULL,
    "order_item_id" integer DEFAULT '0' NOT NULL,
    "status_id" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "service_order_status_history_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "service_timings";
DROP SEQUENCE IF EXISTS service_timings_id_seq;
CREATE SEQUENCE service_timings_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."service_timings" (
    "id" bigint DEFAULT nextval('service_timings_id_seq') NOT NULL,
    "vendor_id" integer DEFAULT '0' NOT NULL,
    "has_24_hour" integer DEFAULT '0' NOT NULL,
    "service_id" integer DEFAULT '0' NOT NULL,
    "day" character varying(255) NOT NULL,
    "time_from" character varying(255),
    "time_to" character varying(255),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "service_timings_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "service_type";
DROP SEQUENCE IF EXISTS service_type_id_seq;
CREATE SEQUENCE service_type_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."service_type" (
    "id" bigint DEFAULT nextval('service_type_id_seq') NOT NULL,
    "name" character varying(255),
    "description" text,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "service_type_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "service_types";
DROP SEQUENCE IF EXISTS service_types_id_seq;
CREATE SEQUENCE service_types_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."service_types" (
    "id" bigint DEFAULT nextval('service_types_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "status" integer DEFAULT '1' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "sort_order" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "service_types_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "service_types" ("id", "name", "status", "deleted", "sort_order", "created_at", "updated_at") VALUES
(1,	'Sa',	1,	0,	0,	'2025-01-01 17:53:23',	'2025-01-01 17:53:23');

DROP TABLE IF EXISTS "settings";
DROP SEQUENCE IF EXISTS settings_id_seq;
CREATE SEQUENCE settings_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."settings" (
    "id" bigint DEFAULT nextval('settings_id_seq') NOT NULL,
    "admin_commission" double precision NOT NULL,
    "shipping_charge" double precision NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "tax_percentage" double precision DEFAULT '0' NOT NULL,
    "store_radius" double precision DEFAULT '20' NOT NULL,
    "service_radius" double precision DEFAULT '20' NOT NULL,
    "service_charge" double precision DEFAULT '0' NOT NULL,
    CONSTRAINT "settings_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "settings" ("id", "admin_commission", "shipping_charge", "created_at", "updated_at", "tax_percentage", "store_radius", "service_radius", "service_charge") VALUES
(1,	0,	0,	NULL,	NULL,	5,	0,	0,	0);

DROP TABLE IF EXISTS "skin_colors";
DROP SEQUENCE IF EXISTS skin_colors_id_seq;
CREATE SEQUENCE skin_colors_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."skin_colors" (
    "id" bigint DEFAULT nextval('skin_colors_id_seq') NOT NULL,
    "name" character varying(255),
    "color" character varying(30) NOT NULL,
    "active" smallint DEFAULT '1' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "skin_colors_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "states";
DROP SEQUENCE IF EXISTS states_id_seq;
CREATE SEQUENCE states_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."states" (
    "id" bigint DEFAULT nextval('states_id_seq') NOT NULL,
    "name" character varying(100) NOT NULL,
    "active" smallint DEFAULT '1' NOT NULL,
    "country_id" integer,
    "created_uid" integer,
    "updated_uid" integer,
    "deleted" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "states_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "states" ("id", "name", "active", "country_id", "created_uid", "updated_uid", "deleted", "created_at", "updated_at") VALUES
(1,	'UAE',	1,	NULL,	NULL,	NULL,	0,	NULL,	NULL);

DROP TABLE IF EXISTS "store_images";
DROP SEQUENCE IF EXISTS store_images_id_seq;
CREATE SEQUENCE store_images_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."store_images" (
    "id" bigint DEFAULT nextval('store_images_id_seq') NOT NULL,
    "image" character varying(900),
    "store_id" bigint NOT NULL,
    CONSTRAINT "store_images_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "store_likes";
DROP SEQUENCE IF EXISTS store_likes_id_seq;
CREATE SEQUENCE store_likes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."store_likes" (
    "id" bigint DEFAULT nextval('store_likes_id_seq') NOT NULL,
    "store_id" integer NOT NULL,
    "user_id" integer NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "store_likes_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "store_managers_types";
DROP SEQUENCE IF EXISTS store_managers_types_id_seq;
CREATE SEQUENCE store_managers_types_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."store_managers_types" (
    "id" bigint DEFAULT nextval('store_managers_types_id_seq') NOT NULL,
    "name" character varying(600) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "vendor_id" bigint,
    CONSTRAINT "store_managers_types_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "man_vendor_id" ON "public"."store_managers_types" USING btree ("vendor_id");


DROP TABLE IF EXISTS "store_type";
DROP SEQUENCE IF EXISTS store_type_id_seq;
CREATE SEQUENCE store_type_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."store_type" (
    "id" bigint DEFAULT nextval('store_type_id_seq') NOT NULL,
    "name" character varying(600) NOT NULL,
    "banner_image" character varying(600),
    "active" integer DEFAULT '0' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "store_type_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "stores";
DROP SEQUENCE IF EXISTS stores_id_seq;
CREATE SEQUENCE stores_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."stores" (
    "id" bigint DEFAULT nextval('stores_id_seq') NOT NULL,
    "vendor_id" bigint NOT NULL,
    "industry_type" integer DEFAULT '0',
    "store_name" character varying(1000),
    "business_email" character varying(250),
    "dial_code" character varying(5),
    "mobile" character varying(20),
    "description" text,
    "location" character varying(1500) NOT NULL,
    "latitude" character varying(255),
    "longitude" character varying(255),
    "address_line1" character varying(900),
    "address_line2" character varying(255),
    "country_id" bigint NOT NULL,
    "state_id" bigint,
    "city_id" bigint,
    "zip" character varying(10),
    "logo" character varying(900),
    "cover_image" character varying(900),
    "license_number" character varying(100),
    "license_doc" character varying(900),
    "vat_cert_number" character varying(100),
    "vat_cert_doc" character varying(900),
    "active" smallint DEFAULT '1' NOT NULL,
    "verified" smallint DEFAULT '0' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "created_uid" bigint,
    "updated_uid" bigint,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "commission" double precision,
    "tax_number" character varying(15),
    "tax_street" character varying(255),
    "tax_address_line_2" character varying(255),
    "tax_city" character varying(100),
    "tax_state" character varying(100),
    "tax_post_code" character varying(10),
    "tax_phone" character varying(15),
    "bank_country" character varying(255),
    "tax_seller_type" character varying(255),
    "residence_country" character varying(255),
    "dob_day" character varying(255),
    "dob_month" character varying(255),
    "dob_year" character varying(255),
    "shop_currency" character varying(255),
    "shop_language" character varying(255),
    "first_name" character varying(255),
    "last_name" character varying(255),
    CONSTRAINT "stores_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "stores" ("id", "vendor_id", "industry_type", "store_name", "business_email", "dial_code", "mobile", "description", "location", "latitude", "longitude", "address_line1", "address_line2", "country_id", "state_id", "city_id", "zip", "logo", "cover_image", "license_number", "license_doc", "vat_cert_number", "vat_cert_doc", "active", "verified", "deleted", "created_uid", "updated_uid", "created_at", "updated_at", "commission", "tax_number", "tax_street", "tax_address_line_2", "tax_city", "tax_state", "tax_post_code", "tax_phone", "bank_country", "tax_seller_type", "residence_country", "dob_day", "dob_month", "dob_year", "shop_currency", "shop_language", "first_name", "last_name") VALUES
(1,	22,	0,	'Anilcompany',	'anz1@anz1.com',	NULL,	NULL,	'dgdgdf hfhfh dfhdf',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/hzTfNAZ5KaPgKteAkkWQ8B7R582SQlOVDhM3UwfZ.png',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-07 14:28:51',	'2025-01-07 14:28:51',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(2,	23,	0,	'Stephanie56sdfdfdgdf',	'admin@adasdmin.com',	NULL,	NULL,	'Autem fugiat soluta',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/VTw0Iz98CZ8xVFNVbKbLXhfxl3elahTezKeh1nr9.png',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-07 16:02:37',	'2025-01-07 16:02:37',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(3,	24,	0,	'Kirk',	'bilokece@mailinator.com',	NULL,	NULL,	'Asperiores aut repel',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/CLSpl46hraCvCFDcDLFTpVDDuUSwyTMiqGWparqC.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-07 17:56:58',	'2025-01-07 17:56:58',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(4,	25,	0,	'Almanara',	'anz2@anz1.com',	NULL,	NULL,	'The Dubai Municipality guides Dubai''s urban growth with a focus on innovation and sustainability, handling urban planning, waste management, public health',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/iPRZjcluku4TnIlQ7g65x4Eehw51p2mWb3awsfOC.png',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-07 18:12:25',	'2025-01-07 18:12:25',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(5,	26,	0,	'Sage',	'vahufad@mailinator.com',	NULL,	NULL,	'Suscipit veniam cup',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/DRRIiapPPltv0IIkxx4hO0aLEGDXEYoQjhzKLDFz.png',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-08 04:20:21',	'2025-01-08 04:20:21',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(6,	28,	0,	'Kato',	'kafefawu@mailinator.com',	NULL,	NULL,	'Voluptatem aut amet',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/ABTG5fB4t7TfkHNJDgjaByMwOoD0qSDURI3BHiTM.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-08 04:52:11',	'2025-01-08 04:52:11',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(7,	32,	0,	'jhjk',	'anz3@anz1.com',	NULL,	NULL,	'hjjhhtetycjf kjggkg',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/HscZyQfqG3EUhPEwYEB1ACzKvh3di3ISPdAvbMmZ.png',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-08 08:09:32',	'2025-01-08 08:09:32',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(8,	34,	0,	'Catherine',	'noripa@mailinator.com',	NULL,	NULL,	'Voluptas dolor archi',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/aQf6X3kXoa3Phb7bq3ZHqqwIKGPvrQfBFj3pj9CO.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-08 09:03:56',	'2025-01-08 09:03:56',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(9,	37,	0,	'sssss',	'is@sdg.com',	NULL,	NULL,	'Sasdaasddasda',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/dBkBGqkX09Z1WdNtg8EDeI8SbkBZzAFegS3BXNhc.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-08 10:40:55',	'2025-01-08 10:40:55',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(21,	51,	0,	'Elijah',	'favupapan@mailinator.com',	NULL,	NULL,	'Veniam aperiam opti',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/DEW2g2QNIpk1yBkn1uocw3D3dwqr4aX03D3AyprW.png',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-10 09:29:53',	'2025-01-10 09:29:53',	NULL,	'234234234234242',	'dasdadadasaas',	'asdasdadaasdasd',	'asdasdasdasa',	'adadasd',	'123123',	'231231313131123',	'1',	'2',	'1',	'16',	'8',	'1995',	'aed',	'English',	'asdasda',	'asdada'),
(12,	41,	0,	'Rajah',	'rufoqih@mailinator.com',	NULL,	NULL,	'Amet voluptas ut do',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/rN750pe9SSfQZs7zfUCYZ4V4OZrHAZ5u5IChf1CY.png',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-08 16:24:37',	'2025-01-08 16:24:37',	NULL,	'111111111111111',	'Karly',	'Shelley',	'Sasha',	'William',	'111111',	'111111111111111',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(13,	42,	0,	'Anne',	'liwuriryfy@mailinator.com',	NULL,	NULL,	'Ut consectetur exer',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/a9kqjMF3GDSMvoCicMdPgt2Tg6h119e9AJYQQ2km.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-08 16:32:13',	'2025-01-08 16:32:13',	NULL,	'111111111111111',	'Maxwell',	'Nasim',	'Castor',	'Madison',	'111111',	'111111111111111',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(14,	42,	0,	'Anne',	'liwuriryfy@mailinator.com',	NULL,	NULL,	'Ut consectetur exer',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/ubzCqbzbYXcpuklgHinXNzh7dZ39pK1RcruA9v9v.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-08 16:32:30',	'2025-01-08 16:32:30',	NULL,	'111111111111111',	'Maxwell',	'Nasim',	'Castor',	'Madison',	'111111',	'111111111111111',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(15,	42,	0,	'Anne',	'liwuriryfy@mailinator.com',	NULL,	NULL,	'Ut consectetur exer',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/uIZkVwPZhtAYSCM69COSCOw4LaTZgCcLyBFKO68p.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-08 16:38:05',	'2025-01-08 16:38:05',	NULL,	'111111111111111',	'Maxwell',	'Nasim',	'Castor',	'Madison',	'111111',	'111111111111111',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(16,	42,	0,	'Anne',	'liwuriryfy@mailinator.com',	NULL,	NULL,	'Ut consectetur exer',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/4SRqABbZkNCAXGBCdz9tzRAHt5lKGzfJRORb3RTL.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-08 16:41:15',	'2025-01-08 16:41:15',	NULL,	'111111111111111',	'Maxwell',	'Nasim',	'Castor',	'Madison',	'111111',	'111111111111111',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(17,	42,	0,	'Anne',	'liwuriryfy@mailinator.com',	NULL,	NULL,	'Ut consectetur exer',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/nbsFvhIM8Xe8IlEdmFZtbh5e6UOOmyx6eJRbunIL.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-08 16:43:01',	'2025-01-08 16:43:01',	NULL,	'111111111111111',	'Maxwell',	'Nasim',	'Castor',	'Madison',	'111111',	'111111111111111',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(18,	42,	0,	'Anne',	'liwuriryfy@mailinator.com',	NULL,	NULL,	'Ut consectetur exer',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/tTeSvFsBoPCHa7XT5GZQ6h2i7AVUdh9sb9GycMc7.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-08 16:43:22',	'2025-01-08 16:43:22',	NULL,	'111111111111111',	'Maxwell',	'Nasim',	'Castor',	'Madison',	'111111',	'111111111111111',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(19,	45,	0,	'dddee',	'sfsaf@f.com',	NULL,	NULL,	'zffsfasfafsasf',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/CWJpdaxlfHvBN6YoxYrPWpaUaKtsIWQGLb8XzGAE.png',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-09 15:02:08',	'2025-01-09 15:02:08',	NULL,	'666666666666666',	't25235',	'35235',	'35352',	'wwwww',	'525253',	'4535352352353',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(20,	50,	0,	'Madeline',	'mozu@mailinator.com',	NULL,	NULL,	'Dolores vel voluptatDolores vel voluptatDolores vel voluptatDolores vel voluptatDolores vel voluptatDolores vel voluptatDolores vel voluptatDolores vel voluptatDolores vel voluptatDolores vel voluptatDolores vel voluptatDolores vel voluptatDolores vel voluptat',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/796rc2LFLT9q5jStMYtOBgblPc1fxg6NGHCnWpAw.png',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-10 09:12:23',	'2025-01-10 09:12:23',	NULL,	'312312312313123',	'dasdasdada',	'sdadadasad',	'adadasdadaadsad',	'adadasasads',	'123123',	'231231231231313',	'1',	'2',	'1',	NULL,	NULL,	NULL,	'aed',	'Arabic',	'asdad',	'adada'),
(22,	52,	0,	'DXBAPPs',	'hibaejaz97@gmail.com',	NULL,	NULL,	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/VFsvnSGUxZ7p5LyOXsZtpUpUz3RoxoyrvETZtomd.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-10 09:45:17',	'2025-01-10 09:45:17',	NULL,	'112233000000000',	'Slicon oasis',	'building 102',	'Dubai',	'Dubai',	'500001',	'056166013322222',	'1',	'2',	'1',	'30',	'12',	'1998',	'aed',	'English',	'Hiba',	'Ejaz'),
(23,	59,	0,	'Ajesh Store',	'ajeshkumarcd@gmail.com',	NULL,	NULL,	'Its a store',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/Ir5xP7AO0AneBU32CAHfxsSiL43M62lhMq84Yr5J.webp',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-15 09:37:34',	'2025-01-15 09:37:34',	NULL,	'323232323232323',	'fdsfds',	'fdsdsdsdf',	'fdfdsfds',	'dsffd',	'323232',	'323232323232323',	'1',	'2',	'1',	'8',	'11',	'2007',	'aed',	'English',	'Ajesh',	'Kumar'),
(24,	61,	0,	'Ajesh Shop',	'ajeshkumarcd@gmail.com',	NULL,	NULL,	NULL,	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/xhll1bcyjbk8tlRSsObR5f8l2hKLsXDrozkS4cDj.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-15 10:16:59',	'2025-01-15 10:16:59',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'1',	NULL,	'1',	NULL,	NULL,	NULL,	'aed',	'English',	'Ajesh',	'Kumar'),
(25,	17,	0,	'Gleaming Grace',	'david@gmail.com',	NULL,	NULL,	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',	'dubai',	NULL,	NULL,	NULL,	NULL,	1,	1,	1,	'453453',	'logos/ex7p3aAT0v1pIoXBecvRCjlCDVX3slfZKftxwOZe.png',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-16 07:28:20',	'2025-01-16 07:28:20',	NULL,	'434534535345345',	'dubai',	'dubai',	'dubai',	'dubai',	'434534',	'564564564564654',	'1',	NULL,	'1',	'2',	'2',	'2006',	'aed',	'English',	'David',	'Grace'),
(26,	62,	0,	'Handwi',	'khalshamsi42@gmail.com',	NULL,	NULL,	'Make hand made products',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/IxeSgbfbuNuMSCYZnI3GtV3L3jiDMYmL4OKPOAet.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-17 15:06:39',	'2025-01-17 15:06:39',	NULL,	'004565464567547',	'1123',	'123srdsd',	'Alain aassdf',	'Tn ffgdfgfd',	'00',	'050000000000000',	'1',	'1',	'1',	'8',	'1',	'1992',	'aed',	'English',	'Khalifa',	'Alshamsi'),
(27,	65,	0,	'Craftee',	'mr.rizwan@hotmail.com',	NULL,	NULL,	'Handy things we are selling',	'Unknown',	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	'logos/qIKVBRcxpGbdUC7BUMNMBH7tevZtet4Qw9AdWCRx.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	0,	NULL,	NULL,	'2025-01-24 06:54:21',	'2025-01-24 06:54:21',	NULL,	'979892342342343',	'Uae32323',	'dubai',	'sharjah',	'sharjah',	'32234',	'232323232323232',	'1',	'1',	'1',	'25',	'12',	'1994',	'aed',	'English',	'Rizwan',	'Mirza');

DROP TABLE IF EXISTS "subscribers_emails";
DROP SEQUENCE IF EXISTS subscribers_emails_id_seq;
CREATE SEQUENCE subscribers_emails_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."subscribers_emails" (
    "id" bigint DEFAULT nextval('subscribers_emails_id_seq') NOT NULL,
    "email" character varying(255) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "subscribers_emails_email_unique" UNIQUE ("email"),
    CONSTRAINT "subscribers_emails_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "temp_order_products";
DROP SEQUENCE IF EXISTS temp_order_products_id_seq;
CREATE SEQUENCE temp_order_products_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."temp_order_products" (
    "id" bigint DEFAULT nextval('temp_order_products_id_seq') NOT NULL,
    "order_id" integer DEFAULT '0' NOT NULL,
    "product_id" integer DEFAULT '0' NOT NULL,
    "product_attribute_id" integer DEFAULT '0' NOT NULL,
    "product_type" integer DEFAULT '0' NOT NULL,
    "quantity" integer DEFAULT '0' NOT NULL,
    "price" double precision,
    "discount" double precision,
    "total" double precision,
    "vendor_id" integer DEFAULT '0' NOT NULL,
    "admin_commission" double precision,
    "vendor_commission" double precision,
    "shipping_charge" double precision,
    CONSTRAINT "temp_order_products_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "temp_order_products" ("id", "order_id", "product_id", "product_attribute_id", "product_type", "quantity", "price", "discount", "total", "vendor_id", "admin_commission", "vendor_commission", "shipping_charge") VALUES
(11,	10,	8,	7,	2,	1,	119,	0,	119,	4,	119,	0,	0),
(12,	10,	5,	5,	1,	2,	250,	0,	500,	4,	500,	0,	0),
(16,	14,	15,	15,	1,	2,	330,	0,	660,	17,	330,	330,	0),
(20,	17,	17,	17,	1,	1,	4000,	0,	4000,	18,	2000,	2000,	0),
(28,	21,	20,	20,	1,	1,	7000,	0,	7000,	18,	3500,	3500,	0),
(29,	22,	13,	13,	1,	2,	300,	0,	600,	16,	360,	240,	0),
(30,	23,	21,	21,	2,	6,	85,	0,	510,	17,	255,	255,	0),
(31,	24,	18,	18,	1,	1,	8000,	0,	8000,	18,	4000,	4000,	0),
(50,	33,	17,	17,	1,	1,	4000,	0,	4000,	18,	2000,	2000,	0),
(51,	33,	34,	35,	1,	3,	300,	0,	900,	5,	900,	0,	0),
(53,	35,	17,	17,	1,	1,	4000,	0,	4000,	18,	2000,	2000,	0),
(54,	36,	15,	15,	1,	1,	330,	0,	330,	17,	165,	165,	0),
(55,	36,	20,	20,	1,	2,	7000,	0,	14000,	18,	7000,	7000,	0),
(57,	38,	24,	25,	1,	1,	400,	0,	400,	30,	240,	160,	0),
(58,	38,	38,	39,	1,	1,	1200,	0,	1200,	30,	720,	480,	0);

DROP TABLE IF EXISTS "temp_orders";
DROP SEQUENCE IF EXISTS temp_orders_id_seq;
CREATE SEQUENCE temp_orders_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."temp_orders" (
    "id" bigint DEFAULT nextval('temp_orders_id_seq') NOT NULL,
    "invoice_id" character varying(100),
    "user_id" integer DEFAULT '0' NOT NULL,
    "address_id" integer DEFAULT '0' NOT NULL,
    "total" double precision DEFAULT '0',
    "vat" double precision DEFAULT '0',
    "discount" double precision DEFAULT '0',
    "grand_total" double precision DEFAULT '0',
    "payment_mode" integer DEFAULT '0' NOT NULL,
    "admin_commission" double precision DEFAULT '0',
    "vendor_commission" double precision DEFAULT '0',
    "shipping_charge" double precision DEFAULT '0',
    "temp_id" character varying(255) NOT NULL,
    "ref_history_id" character varying(255) DEFAULT '0',
    "ref_code" character varying(255) DEFAULT '',
    "admin_commission_percentage" character varying(255) DEFAULT '0',
    "vendor_commission_percentage" character varying(255) DEFAULT '0',
    "order_type" integer DEFAULT '0' NOT NULL,
    "pick_up_date" character varying(255) DEFAULT '',
    "pick_up_time" character varying(255) DEFAULT '',
    "service_charge" double precision DEFAULT '0' NOT NULL,
    CONSTRAINT "temp_orders_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "temp_orders" ("id", "invoice_id", "user_id", "address_id", "total", "vat", "discount", "grand_total", "payment_mode", "admin_commission", "vendor_commission", "shipping_charge", "temp_id", "ref_history_id", "ref_code", "admin_commission_percentage", "vendor_commission_percentage", "order_type", "pick_up_date", "pick_up_time", "service_charge") VALUES
(33,	NULL,	15,	11,	4900,	245,	0,	5145,	2,	0,	5145,	0,	'15678617d91898c1736841177',	'0',	'',	'0',	'100',	0,	'',	'',	0);

DROP TABLE IF EXISTS "temp_service_order_items";
DROP SEQUENCE IF EXISTS temp_service_order_items_id_seq;
CREATE SEQUENCE temp_service_order_items_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."temp_service_order_items" (
    "id" bigint DEFAULT nextval('temp_service_order_items_id_seq') NOT NULL,
    "order_id" integer DEFAULT '0' NOT NULL,
    "service_id" integer DEFAULT '0' NOT NULL,
    "price" double precision NOT NULL,
    "discount" double precision NOT NULL,
    "total" double precision NOT NULL,
    "admin_commission" double precision NOT NULL,
    "vendor_commission" double precision NOT NULL,
    "booking_date" character varying(600),
    "text" character varying(600),
    "hourly_rate" double precision DEFAULT '0' NOT NULL,
    "task_description" text,
    "doc" character varying(600),
    "qty" integer DEFAULT '0' NOT NULL,
    "vat" double precision DEFAULT '0' NOT NULL,
    CONSTRAINT "temp_service_order_items_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "temp_service_orders";
DROP SEQUENCE IF EXISTS temp_service_orders_id_seq;
CREATE SEQUENCE temp_service_orders_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."temp_service_orders" (
    "id" bigint DEFAULT nextval('temp_service_orders_id_seq') NOT NULL,
    "invoice_id" character varying(600),
    "user_id" integer DEFAULT '0' NOT NULL,
    "address_id" integer DEFAULT '0' NOT NULL,
    "total" double precision,
    "vat" double precision,
    "discount" double precision,
    "grand_total" double precision,
    "payment_mode" integer DEFAULT '0' NOT NULL,
    "admin_commission" double precision,
    "vendor_commission" double precision,
    "temp_id" character varying(600),
    "booking_date" character varying(600),
    "coupon_id" integer DEFAULT '0' NOT NULL,
    "ref_history_id" integer DEFAULT '0' NOT NULL,
    "ref_code" character varying(600),
    "user_latitude" text,
    "user_longitude" text,
    "service_charge" double precision DEFAULT '0' NOT NULL,
    "task_description" character varying(600),
    "doc" character varying(600),
    CONSTRAINT "temp_service_orders_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "temp_user_account_types";
DROP SEQUENCE IF EXISTS temp_user_account_types_id_seq;
CREATE SEQUENCE temp_user_account_types_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."temp_user_account_types" (
    "id" bigint DEFAULT nextval('temp_user_account_types_id_seq') NOT NULL,
    "temp_user_id" integer NOT NULL,
    "account_type_id" integer NOT NULL,
    "activity_type_id" integer NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "temp_user_account_types_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "temp_users";
DROP SEQUENCE IF EXISTS temp_users_id_seq;
CREATE SEQUENCE temp_users_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."temp_users" (
    "id" bigint DEFAULT nextval('temp_users_id_seq') NOT NULL,
    "name" character varying(255),
    "email" character varying(255),
    "dial_code" character varying(255),
    "phone" character varying(255),
    "phone_verified" integer DEFAULT '0' NOT NULL,
    "active" integer DEFAULT '0' NOT NULL,
    "email_verified" integer DEFAULT '0' NOT NULL,
    "password" character varying(255) NOT NULL,
    "email_verified_at" timestamp(0),
    "role" character varying(255),
    "first_name" character varying(255),
    "last_name" character varying(255),
    "user_image" character varying(255),
    "user_phone_otp" character varying(255),
    "user_email_otp" character varying(255),
    "user_device_token" character varying(255),
    "user_device_type" character varying(255),
    "user_access_token" character varying(255),
    "firebase_user_key" character varying(255),
    "device_cart_id" character varying(255),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "temp_users_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "temp_users" ("id", "name", "email", "dial_code", "phone", "phone_verified", "active", "email_verified", "password", "email_verified_at", "role", "first_name", "last_name", "user_image", "user_phone_otp", "user_email_otp", "user_device_token", "user_device_type", "user_access_token", "firebase_user_key", "device_cart_id", "created_at", "updated_at") VALUES
(9,	'hiba ',	'hibadxba@hotmail.com',	'971',	'561660133',	0,	1,	1,	'$2y$10$YS4/FdXdGkoFlnIUxXK.OeBPNl0UaM8iMukcbDkI7LcJpPeSdOe86',	'2025-01-07 06:04:26',	'2',	'hiba',	NULL,	'',	'1111',	'1111',	'fhdj8EbMROy8zpwUSqKOMp:APA91bHsqcne89vYhEvkRA6Pys0B6X36QbAZdLuiQeSXIdRp_2FSxWOKU9i7WfMBGb7WvG_ilE8A6PQYrXbXBdIhOQ5QKpkQPQk-PpGwon0guwVv-GztzLw',	'ANDROID',	NULL,	NULL,	'12d4d9f3ec83ed7c',	'2025-01-07 06:04:27',	'2025-01-07 06:04:27'),
(1,	'Aamir .',	'aamir.dxbapps@gmail.com',	'92',	'302806688',	0,	1,	1,	'$2y$10$KDc9BUiX1xEcFp3tQgDiZOD5Y.dFvnUUYT.ePm/QcJhxZIROHfBsO',	'2025-01-07 10:20:18',	'2',	'Aamir',	'.',	'',	'1111',	'1111',	'1111',	'smap',	NULL,	NULL,	'cart_a',	'2024-11-30 05:18:29',	'2025-01-07 10:20:19'),
(10,	'test dev',	'test@gmail.com',	'971',	'321654789',	0,	1,	1,	'$2y$10$8Gyulfr/6PN1DsBZrc8NlO/GI6h9DEQsPukIHmSMbPf9nQOmO2Glu',	'2025-01-08 09:01:49',	'2',	'test',	'dev',	'',	'1111',	'1111',	'cR0bfnAeSdyt0drSADtjDp:APA91bEx_HGUo4G4-njIw95ywCdiz1OTMFsKUqjubI5mjCn0jKHrNG5U4nJ0qE39PAjcgOj-Fywq4X1IQ6s0Zs30sYsiKiE8e3tRZA16SDVPMFVBTyJezFM',	'ANDROID',	NULL,	NULL,	'c948872a6eac9a75',	'2025-01-08 09:01:49',	'2025-01-08 09:01:49'),
(11,	'test dev two',	'test2@gmail.com',	'971',	'3213698744',	0,	1,	1,	'$2y$10$nq4fPOaEdxeJ3at79dYp4eL./VYaVj4L3iIdFl9xQUBb6/VUdSzau',	'2025-01-08 10:41:05',	'2',	'test',	'dev two',	'',	'1111',	'1111',	'cR0bfnAeSdyt0drSADtjDp:APA91bEx_HGUo4G4-njIw95ywCdiz1OTMFsKUqjubI5mjCn0jKHrNG5U4nJ0qE39PAjcgOj-Fywq4X1IQ6s0Zs30sYsiKiE8e3tRZA16SDVPMFVBTyJezFM',	'ANDROID',	NULL,	NULL,	'c948872a6eac9a75',	'2025-01-08 10:07:48',	'2025-01-08 10:41:05'),
(12,	'Ajesh Kumar',	'ajeshcd@gmail.com',	'971',	'505041860',	0,	1,	1,	'$2y$10$81AOcnDkVKLFdPyvouvFpucwMvHzopsB6NJo1qyELjw.O2IFS6706',	'2025-01-15 09:18:37',	'2',	'Ajesh',	'Kumar',	'',	'1111',	'1111',	'chZdpwJtQ4efOD8ChJVMPd:APA91bHEovPflqdsjn60y9LGi01vaQDofrotIMTTqgF1nK3KhJz5DzDiLEGZF0F4PhKCV7U6dqO8G_PvbcLsnDDgczIOweB9OnTjT4rRqUn5-m0uWBYZSsw',	'ANDROID',	NULL,	NULL,	'956a025e9c17369b',	'2025-01-15 09:18:37',	'2025-01-15 09:18:37'),
(2,	'hunain dev ',	'hunain88@gmail.com',	'971',	'123456789',	0,	1,	1,	'$2y$10$M9ms4LialUzuBX1uNTz/TONq9itxzPF4pRaV3zbRqZ9.HnFwMl.Ma',	'2024-11-30 11:31:52',	'2',	'hunain dev',	NULL,	'',	'1111',	'1111',	'ad',	'ANDROID',	NULL,	NULL,	'c948872a6eac9a75',	'2024-11-30 11:00:33',	'2024-11-30 11:31:52'),
(3,	's login ',	'new_social1@gmail.com',	'92',	'3095555555',	0,	1,	1,	'$2y$10$Ch0H1uVSxO/gNvhETynaDe8ePjT0Ws9EhOHU3rd5.ZEzPJPlNfxHq',	'2024-12-02 09:21:39',	'2',	's login',	NULL,	NULL,	'1111',	'1111',	'1111',	'andriod',	NULL,	NULL,	'cart_a',	'2024-12-02 09:09:32',	'2024-12-02 09:21:39'),
(4,	's login ',	'new_social2@gmail.com',	'92',	'3095555556',	0,	1,	1,	'$2y$10$c3u4EHtwPF.Cl2Y6NEDPE.GhKflO8vbJnoKYdmuuk89e34x0ZJ1Ea',	'2024-12-02 09:28:18',	'2',	's login',	NULL,	NULL,	'1111',	'1111',	'1111',	'andriod',	NULL,	NULL,	'cart_a',	'2024-12-02 09:24:17',	'2024-12-02 09:28:18'),
(5,	'Hunain Ahmad. ',	'hunainahmad12345@gmail.com',	'971',	'987654321',	0,	1,	1,	'$2y$10$/6ei8XQDoioTvlFHIG4mg.YFEwuKZ96SK/wqDCyM4e9nbzkSHjqGy',	'2024-12-02 09:55:22',	'2',	'Hunain Ahmad.',	NULL,	NULL,	'1111',	'1111',	'ad',	'ANDROID',	NULL,	NULL,	'c948872a6eac9a75',	'2024-12-02 09:46:52',	'2024-12-02 09:55:22'),
(6,	'ragadxb ',	'ragadxb@gmail.com',	'971',	'123456489',	0,	1,	1,	'$2y$10$aOU7pv9521zJrGNvaAQfW.siDZjhjVq98L8rNKTK1NJ3L3Luf.Hly',	'2024-12-02 21:48:43',	'2',	'ragadxb',	NULL,	NULL,	'1111',	'1111',	'fs3DpSFkQteL0pWepAU7uA:APA91bHqw-5EDCZMcGO_f1wjG6lFKNQo3ra0dQTeu16XZuudLwgiA2dbzQTM5CUAM0xKtGnDI1h6uq81FqJcKnlWVK5A-g61FcTnouNjDh4fX-czNOlGrJs',	'ANDROID',	NULL,	NULL,	'e19e10ee2b97a91c',	'2024-12-02 21:48:30',	'2024-12-02 21:48:43'),
(7,	'Asad ',	'asadnazir289@gmail.com',	'971',	'3441560349',	0,	1,	1,	'$2y$10$IA2FaaEjOUO/denwhnSAC.3ffpfNakaYUUSj6DWsqHF72Wr0qgqnu',	'2025-01-06 22:22:05',	'2',	'Asad',	NULL,	'',	'1111',	'1111',	'cr_Htg3pQdeU4WTjORg00M:APA91bGNQqtc9SniC8uUYcMPu6jkd-SLQDB05UZIqY8MXvfm-c95A3ale7rvIHxk-90S9V-18m_x5Rf2jXd-P6Ls6F_KOTdoWk_x2lHhcLskOGcjTYp5fuc',	'ANDROID',	NULL,	NULL,	'7812fe4f9424cf17',	'2025-01-06 22:21:57',	'2025-01-06 22:22:05'),
(8,	'anilnavis ',	'anil@dxbusinessgroup.com',	'971',	'899566995',	0,	1,	1,	'$2y$10$Gf6FAyl1oInlwx/l60Cl1.lxuuop0PR5pFI91ajE/1qTSqMjCk3Ka',	'2025-01-07 04:05:09',	'2',	'anilnavis',	NULL,	'',	'1111',	'1111',	'eZ7T5pAoSmmS_Qn_LiEWer:APA91bHGtJQol32rWtFEWj2_ZbtYTGS77qXgJxPzOddDKFm7ha7gdmd-lzoU5aeal0eM-V0nR2Z3HUN7tA8t21hBAXevnCdOexT_hqoCp3S4TO0zcb-OSms',	'ANDROID',	NULL,	NULL,	'0012e1f9e605c504',	'2025-01-07 04:05:09',	'2025-01-07 04:05:09');

DROP TABLE IF EXISTS "tesimonial";
DROP SEQUENCE IF EXISTS tesimonial_id_seq;
CREATE SEQUENCE tesimonial_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."tesimonial" (
    "id" bigint DEFAULT nextval('tesimonial_id_seq') NOT NULL,
    "name" character varying(255),
    "designation" character varying(255),
    "comment" text,
    "rating" double precision DEFAULT '0' NOT NULL,
    "user_image" character varying(255),
    "deleted" integer DEFAULT '0' NOT NULL,
    "active" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "tesimonial_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "tesimonial" ("id", "name", "designation", "comment", "rating", "user_image", "deleted", "active", "created_at", "updated_at") VALUES
(1,	'Kollision',	'Shetty Jamie',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s.',	3.5,	'1736323054testimonial-photo1.jpg',	0,	1,	'2025-01-08 07:57:34',	'2025-01-08 07:57:34'),
(2,	'Sara Colinton',	'Pel',	'Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software PageMaker including versions readable content page.',	1.5,	'1736323187testimonial-photo2.jpg',	0,	1,	'2025-01-08 07:59:47',	'2025-01-08 07:59:47'),
(3,	'Hamlet Tuong',	'OPL',	'Scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic of remaining essentially 1960s.',	5,	'1736323237testimonial-photo3.jpg',	0,	1,	'2025-01-08 08:00:37',	'2025-01-08 08:00:37');

DROP TABLE IF EXISTS "transport";
DROP SEQUENCE IF EXISTS transport_id_seq;
CREATE SEQUENCE transport_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."transport" (
    "id" bigint DEFAULT nextval('transport_id_seq') NOT NULL,
    "title" character varying(600),
    "description" character varying(600),
    "url" character varying(1600),
    "image" character varying(600),
    "active" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "transport_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "user_account_types";
DROP SEQUENCE IF EXISTS user_account_types_id_seq;
CREATE SEQUENCE user_account_types_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."user_account_types" (
    "id" bigint DEFAULT nextval('user_account_types_id_seq') NOT NULL,
    "user_id" integer NOT NULL,
    "account_type_id" integer NOT NULL,
    "activity_type_id" integer NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "user_account_types_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "user_address";
DROP SEQUENCE IF EXISTS user_address_id_seq;
CREATE SEQUENCE user_address_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."user_address" (
    "id" bigint DEFAULT nextval('user_address_id_seq') NOT NULL,
    "user_id" bigint NOT NULL,
    "full_name" character varying(255) NOT NULL,
    "dial_code" character varying(5) NOT NULL,
    "phone" character varying(20) NOT NULL,
    "address" text NOT NULL,
    "country_id" integer DEFAULT '0' NOT NULL,
    "state_id" integer DEFAULT '0' NOT NULL,
    "city_id" integer DEFAULT '0' NOT NULL,
    "address_type" character varying(255) DEFAULT 'Home' NOT NULL,
    "status" integer DEFAULT '1' NOT NULL,
    "is_default" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "land_mark" character varying(600),
    "building_name" character varying(600),
    "latitude" character varying(600),
    "longitude" character varying(600),
    "location" character varying(1600),
    "area_id" character varying(255) DEFAULT '',
    "apartment" character varying(255) DEFAULT '',
    "street" character varying(255) DEFAULT '',
    CONSTRAINT "user_address_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "user_address" ("id", "user_id", "full_name", "dial_code", "phone", "address", "country_id", "state_id", "city_id", "address_type", "status", "is_default", "created_at", "updated_at", "land_mark", "building_name", "latitude", "longitude", "location", "area_id", "apartment", "street") VALUES
(1,	9,	'Aamir .',	'92',	'3028066329',	'address n',	1,	0,	1,	'Home',	0,	0,	'2024-12-20 11:31:48',	'2025-01-15 11:00:15',	NULL,	'B1',	'11',	'11',	'Calicut Airport',	'1',	'A1',	'S1'),
(2,	9,	'Aamir .',	'92',	'3028066329',	'address n',	1,	0,	1,	'Home',	0,	0,	'2025-01-06 11:27:35',	'2025-01-15 11:00:15',	'Test Land',	'B1',	'25.1808127',	'55.3132194',	'Calicut Airport',	'1',	'A1',	'S1'),
(4,	9,	'Aamir New.',	'92',	'3028066329',	'address n',	1,	0,	1,	'0',	0,	0,	'2025-01-06 17:00:09',	'2025-01-15 11:00:15',	'Test Land',	'B1',	'25.1809515',	'55.3149132',	'Calicut Airport',	'1',	'A1',	'S1'),
(3,	9,	'Aamir .',	'92',	'3028066329',	'address n',	1,	0,	1,	'0',	0,	0,	'2025-01-06 16:00:17',	'2025-01-15 11:00:15',	'Test Land',	'B1',	'25.1809515',	'55.3149132',	'Calicut Airport',	'1',	'A1',	'S1'),
(10,	14,	'anilnavis',	'971',	'899566995',	'1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,',	1,	0,	1,	'0',	1,	1,	'2025-01-07 08:21:18',	'2025-01-07 08:21:18',	NULL,	'tu14',	'25.184234531783282',	'55.26004895567894',	'1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,',	'1',	NULL,	NULL),
(5,	9,	'hunain dev',	'971',	'123456789',	'Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,',	1,	0,	1,	'0',	0,	0,	'2025-01-06 23:35:22',	'2025-01-15 11:00:15',	NULL,	'Apt 1',	'33.516418169502025',	'73.11079904437065',	'Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,',	'1',	NULL,	'Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,'),
(6,	9,	'hunain dev',	'971',	'123456789',	'Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,',	1,	0,	1,	'0',	0,	0,	'2025-01-06 23:39:36',	'2025-01-15 11:00:15',	NULL,	'Apt1',	'33.516422921494396',	'73.11076920479536',	'Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,',	'1',	NULL,	NULL),
(8,	9,	'hunain dev',	'971',	'123456789',	'H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,',	1,	0,	1,	'0',	0,	0,	'2025-01-07 07:54:30',	'2025-01-15 11:00:15',	NULL,	'apt1',	'33.56680088238352',	'73.13682921230793',	'H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,',	'1',	NULL,	NULL),
(9,	9,	'hunain dev',	'971',	'123456789',	'H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,',	1,	0,	1,	'0',	0,	0,	'2025-01-07 08:01:26',	'2025-01-15 11:00:15',	NULL,	'apt1',	'33.566805910972626',	'73.13681814819574',	'H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,',	'1',	NULL,	NULL),
(16,	9,	'hunain dev',	'971',	'123456789',	'H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,',	1,	0,	1,	'0',	1,	1,	'2025-01-15 11:00:15',	'2025-01-15 11:00:15',	NULL,	'a1',	'33.566801161749595',	'73.1368101015687',	'H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,',	'1',	NULL,	NULL),
(12,	13,	'Asad',	'971',	'3441560349',	'9FGG+WQ, Muzaffarabad,',	1,	0,	1,	'0',	1,	1,	'2025-01-08 08:44:42',	'2025-01-08 08:44:42',	NULL,	'mzd',	'34.37904488161153',	'73.47675025463104',	'9FGG+WQ, Muzaffarabad,',	'1',	NULL,	NULL),
(11,	15,	'hiba',	'971',	'561660155',	'57P6+23F - Business Bay - Dubai - United Arab Emirates,',	1,	0,	1,	'0',	1,	0,	'2025-01-07 12:04:36',	'2025-01-15 11:26:39',	NULL,	'812',	'25.185139589051296',	'55.25988031178713',	'57P6+23F - Business Bay - Dubai - United Arab Emirates,',	'1',	NULL,	NULL),
(7,	15,	'hiba',	'971',	'561660133',	'1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,',	1,	0,	1,	'0',	1,	1,	'2025-01-07 07:52:33',	'2025-01-15 11:26:39',	NULL,	'304',	'25.184269726894854',	'55.26005566120148',	'1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,',	'1',	NULL,	NULL),
(17,	60,	'Guest hhh',	'50',	'0561660155',	'Ajman Gate Tower',	1,	1,	1,	'Home',	1,	0,	'2025-01-15 14:52:17',	'2025-01-15 14:52:17',	NULL,	NULL,	NULL,	NULL,	NULL,	'',	'',	''),
(13,	55,	'Price Chase1',	'921',	'54534534545345',	'ghfghfghf',	1,	1,	1,	'Home',	1,	0,	'2025-01-14 06:12:17',	'2025-01-14 08:00:48',	NULL,	NULL,	NULL,	NULL,	NULL,	'',	'',	''),
(14,	55,	'gfdghfghfghfg',	'921',	'567657657657',	'dfghfghfghfhh',	1,	1,	2,	'Home',	1,	1,	'2025-01-14 08:00:38',	'2025-01-14 08:00:48',	NULL,	NULL,	NULL,	NULL,	NULL,	'',	'',	''),
(15,	58,	'Ajesh Kumar',	'971',	'505041860',	'1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,',	1,	0,	1,	'0',	1,	1,	'2025-01-15 09:20:59',	'2025-01-15 09:20:59',	NULL,	'vhbb',	'25.184267906458302',	'55.26004895567894',	'1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,',	'1',	NULL,	NULL),
(18,	66,	'Rizwan',	'23423',	'3423423',	'3434',	1,	1,	1,	'Home',	1,	0,	'2025-01-27 11:12:17',	'2025-01-27 11:12:17',	NULL,	NULL,	NULL,	NULL,	NULL,	'',	'',	'');

DROP TABLE IF EXISTS "user_follows";
DROP SEQUENCE IF EXISTS user_follows_id_seq;
CREATE SEQUENCE user_follows_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."user_follows" (
    "id" bigint DEFAULT nextval('user_follows_id_seq') NOT NULL,
    "user_id" integer NOT NULL,
    "follow_user_id" integer NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "user_follows_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "user_privileges";
DROP SEQUENCE IF EXISTS user_privileges_id_seq;
CREATE SEQUENCE user_privileges_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."user_privileges" (
    "id" bigint DEFAULT nextval('user_privileges_id_seq') NOT NULL,
    "user_id" bigint NOT NULL,
    "designation_id" bigint NOT NULL,
    "privileges" character varying(1600),
    "status" smallint DEFAULT '1',
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "user_privileges_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "user_designation_id" ON "public"."user_privileges" USING btree ("designation_id");

CREATE INDEX "user_user_id" ON "public"."user_privileges" USING btree ("user_id");


DROP TABLE IF EXISTS "users";
DROP SEQUENCE IF EXISTS users_id_seq;
CREATE SEQUENCE users_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."users" (
    "id" bigint DEFAULT nextval('users_id_seq') NOT NULL,
    "name" character varying(255),
    "email" character varying(255),
    "dial_code" character varying(255),
    "phone" character varying(255),
    "phone_verified" integer DEFAULT '0' NOT NULL,
    "password" character varying(255) NOT NULL,
    "email_verified_at" timestamp(0),
    "role" character varying(255),
    "first_name" character varying(255),
    "last_name" character varying(255),
    "user_image" character varying(255),
    "user_phone_otp" character varying(255),
    "user_device_token" character varying(255),
    "user_device_type" character varying(255),
    "user_access_token" character varying(255),
    "firebase_user_key" character varying(255),
    "remember_token" character varying(100),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "country_id" integer DEFAULT '0' NOT NULL,
    "state_id" integer DEFAULT '0' NOT NULL,
    "city_id" integer DEFAULT '0' NOT NULL,
    "area" integer DEFAULT '0' NOT NULL,
    "active" integer DEFAULT '0' NOT NULL,
    "deleted" integer DEFAULT '0' NOT NULL,
    "display_name" character varying(600),
    "business_name" character varying(600),
    "email_verified" integer DEFAULT '0' NOT NULL,
    "user_email_otp" character varying(255),
    "dob" date,
    "vendor" integer DEFAULT '0' NOT NULL,
    "store" integer DEFAULT '0' NOT NULL,
    "previllege" integer DEFAULT '0' NOT NULL,
    "about_me" text,
    "verified" integer DEFAULT '0' NOT NULL,
    "designation_id" bigint,
    "is_private_profile" integer DEFAULT '0' NOT NULL,
    "user_name" character varying(150),
    "gender" integer DEFAULT '1' NOT NULL,
    "website" character varying(2500),
    "wallet_amount" double precision DEFAULT '0' NOT NULL,
    "password_reset_code" character varying(600),
    "password_reset_time" character varying(600),
    "approve" integer DEFAULT '0' NOT NULL,
    "user_permissions" text,
    "password_reset_otp" character varying(600),
    "is_social" character varying(255) DEFAULT '0',
    "activity_id" bigint,
    "temp_dial_code" character varying(255) DEFAULT '',
    "temp_mobile" character varying(255) DEFAULT '',
    "minimum_order_amount" double precision,
    "ref_code" character varying(255) DEFAULT '',
    "is_dinein" integer DEFAULT '0' NOT NULL,
    "is_delivery" integer DEFAULT '0' NOT NULL,
    "designation_name" character varying(255) DEFAULT '',
    "admin_viewed" integer DEFAULT '0' NOT NULL,
    "delivery_charge" integer DEFAULT '0' NOT NULL,
    "location" character varying(255),
    "two_factor_auth" character varying(255),
    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "designation_id" ON "public"."users" USING btree ("designation_id");

INSERT INTO "users" ("id", "name", "email", "dial_code", "phone", "phone_verified", "password", "email_verified_at", "role", "first_name", "last_name", "user_image", "user_phone_otp", "user_device_token", "user_device_type", "user_access_token", "firebase_user_key", "remember_token", "created_at", "updated_at", "country_id", "state_id", "city_id", "area", "active", "deleted", "display_name", "business_name", "email_verified", "user_email_otp", "dob", "vendor", "store", "previllege", "about_me", "verified", "designation_id", "is_private_profile", "user_name", "gender", "website", "wallet_amount", "password_reset_code", "password_reset_time", "approve", "user_permissions", "password_reset_otp", "is_social", "activity_id", "temp_dial_code", "temp_mobile", "minimum_order_amount", "ref_code", "is_dinein", "is_delivery", "designation_name", "admin_viewed", "delivery_charge", "location", "two_factor_auth") VALUES
(12,	'ragadxb ',	'ragadxb@gmail.com',	'971',	'123456489',	1,	'$2y$10$aOU7pv9521zJrGNvaAQfW.siDZjhjVq98L8rNKTK1NJ3L3Luf.Hly',	'2024-12-02 21:48:49',	'2',	'ragadxb',	NULL,	NULL,	'',	'fs3DpSFkQteL0pWepAU7uA:APA91bHqw-5EDCZMcGO_f1wjG6lFKNQo3ra0dQTeu16XZuudLwgiA2dbzQTM5CUAM0xKtGnDI1h6uq81FqJcKnlWVK5A-g61FcTnouNjDh4fX-czNOlGrJs',	'ANDROID',	'3253403a852385de02aa5ee5bd925693b9a95108b215220cc133b7ca559372cf',	'-OD8LEenh4QHGNFQdkI_',	NULL,	'2024-12-02 21:48:49',	'2024-12-02 21:48:50',	0,	0,	0,	0,	1,	0,	NULL,	NULL,	1,	'',	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'1',	NULL,	'',	'',	NULL,	'2024120212',	0,	0,	'',	0,	0,	NULL,	NULL),
(15,	'hiba user',	'hibadxba@hotmail.com',	'971',	'561660133',	1,	'$2y$10$ECC3eQMjTt79toCRsrO3rO2WHWkWjWFEdqzjZvQxSAt7HqmhDzqPu',	'2025-01-07 06:04:34',	'2',	'hiba',	'user',	'/uploads/company/677e11d258aa3_1736315346.png',	'',	'fey1dkwtSDmoK2uZswaeoA:APA91bFWiI68QhdNB_bXC42MjTOKlx_heXhOfy9x3NtX4d8IgfrvZ_ZbQYmZp9zD-BM9-AuvcBqAXFuAbGRJozxjooq1fIBp49OTrD9HNruesEq6SqqPZKw',	'ANDROID',	'6280ee36a112f3eddc1b6e25ae69731783176fbab43ccdb556f9eb64030e63e8',	'-OFzMLtcP864xGDgKYO1',	NULL,	'2025-01-07 06:04:34',	'2025-01-16 07:50:31',	0,	0,	0,	0,	1,	0,	NULL,	NULL,	1,	'',	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	100,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'2025010715',	0,	0,	'',	0,	0,	NULL,	NULL),
(52,	NULL,	'hibaejaz97@gmail.com_deleted_mail',	NULL,	'_deleted_mobile',	0,	'$2y$10$6Q4YcqMY9yr3vLV1MQe4n.KJjI3vxGhMWbn8dtfOrhLj44k1q/OZu',	NULL,	'3',	'Hiba',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-10 09:31:55',	'2025-01-10 09:45:17',	0,	0,	0,	0,	0,	1,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	'enabled'),
(3,	NULL,	'test@yopmail.com_deleted_mail',	'971',	'555555555_deleted_mobile',	0,	'$2y$10$BpeueI3YtidDFC0xMvef0e/QAYFzALbWPP/1G2CTojNChbwg.eVFK',	NULL,	'3',	'test',	'test',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2024-06-28 06:24:24',	NULL,	1,	0,	1,	0,	0,	1,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	7,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(6,	NULL,	'm@m.com',	NULL,	'123455',	0,	'$2y$10$PdomyeXOLOrlSh7Xb8c4wurVAHhY3TeZBM4iwgrtaz8IxfnoXFq3m',	NULL,	'1',	'Khalifa',	'Alian',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2024-07-04 15:04:04',	NULL,	0,	0,	0,	0,	1,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'manager',	0,	0,	NULL,	NULL),
(46,	NULL,	'hibaejaz97@gmail.com_deleted_mail',	NULL,	'_deleted_mobile',	0,	'$2y$10$.pe4lzE4Lj440.J2.dihoe8SX26G61JgtAq2Uzz7mE2pNGfdDHlrq',	NULL,	'3',	'Hiba',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-09 15:14:47',	'2025-01-09 15:14:47',	0,	0,	0,	0,	0,	1,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	1,	0,	NULL,	NULL),
(21,	NULL,	'nivuj@mailinator.com',	NULL,	NULL,	0,	'$2y$10$uTxli3soF3UE6AG74jh6Du420PNGOdTDV02gZXmz2cPKOpOjvTidi',	NULL,	'3',	'Serina',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-07 14:06:20',	'2025-01-07 14:06:20',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(2,	'RUSVIN K',	'rusvinmerak@gmail.com',	'971',	'7034526952',	1,	'$2y$10$yvUq0wjrEekXZoGO7K3KPOI02.VAxrNgQakGbD5BQB6HI3xFiadii',	NULL,	'2',	'RUSVIN',	'K',	'/uploads/company/667d446ad4466_1719485546.jpg',	NULL,	'1111',	NULL,	'63dc7012a98074adeddabf75dfcb10f93c3226b7999f6fe47cd91ff66261c9a5',	'-OEYPEBELYhVl2-wz_y0',	NULL,	'2024-06-27 10:48:19',	'2024-12-20 09:32:06',	0,	0,	0,	0,	1,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'202412202',	0,	0,	'',	0,	0,	NULL,	NULL),
(1,	'Admin',	'admin@admin.com',	'971',	'112233445566778899',	0,	'$2y$10$4CKClSnfh0w959jNrsJyl.8/oowWbizHIg4FrOlXxfgtYYBU6Y6jK',	NULL,	'1',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(14,	'anilnavis ',	'anil@dxbusinessgroup.com',	'971',	'899566995',	1,	'$2y$10$Gf6FAyl1oInlwx/l60Cl1.lxuuop0PR5pFI91ajE/1qTSqMjCk3Ka',	'2025-01-07 04:05:16',	'2',	'anilnavis',	NULL,	NULL,	'',	'eRt1vZ-ZSoCThgoF6Smx4P:APA91bGFrHB_eYb_L8QGblbaPut0ZHmEZks26RYHrZIl5ycZgljrpeQ34GWjb3D6sroD1d2kSE6JmAQ-EONqp3L0OWdbwvoEbW7PxtwVzQJ0fhPPXa2prK4',	'ANDROID',	'f2285a952769ee60eb68617655b031112ef875e4616109fcc26035e3c0f7c0c4',	'-OFyw2F-AGStHGYYeoAi',	NULL,	'2025-01-07 04:05:16',	'2025-01-15 13:01:57',	0,	0,	0,	0,	1,	0,	NULL,	NULL,	1,	'',	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'1',	NULL,	'',	'',	NULL,	'2025010714',	0,	0,	'',	0,	0,	NULL,	NULL),
(10,	's login ',	'new_social1@gmail.com',	'92',	'3095555555',	1,	'$2y$10$Ch0H1uVSxO/gNvhETynaDe8ePjT0Ws9EhOHU3rd5.ZEzPJPlNfxHq',	'2024-12-02 09:21:57',	'2',	's login',	NULL,	NULL,	'',	'1111',	'andriod',	'92b0eb24679ddc74d37b09ccc0fe9cecdd47ead372248048e12db12b8516b4f8',	'-OD5fIArJzZ9WkRHLkQV',	NULL,	'2024-12-02 09:21:57',	'2024-12-02 09:25:13',	0,	0,	0,	0,	1,	0,	NULL,	NULL,	1,	'',	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'1',	NULL,	'',	'',	NULL,	'2024120210',	0,	0,	'',	0,	0,	NULL,	NULL),
(23,	NULL,	'admin@adasdmin.com',	NULL,	NULL,	0,	'$2y$10$MYXxvxnN3DaVKHDrIlnpQuo1ULCYRtDiqSdQh0rra12RE/oVv59nC',	NULL,	'3',	'asdfsdf',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-07 15:59:19',	'2025-01-07 16:02:37',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	1,	0,	NULL,	NULL),
(22,	NULL,	'anz1@anz1.com',	NULL,	NULL,	0,	'$2y$10$gjN3VcAnQHy/3Bw6nBFjZuFI0zsak3BrlRnx11wEqe0JAnbhnubp6',	NULL,	'3',	'Anil',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-07 14:15:48',	'2025-01-07 14:15:48',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	1,	0,	NULL,	NULL),
(18,	NULL,	'steve@gmail.com',	'971',	'561660166',	0,	'$2y$10$uYwgr/WWSHi2b4LRcgV9JuzIwaDHnLG2GT82hYeuKN3X17mZ/dDVS',	NULL,	'3',	'Stive',	'Pie',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-07 08:57:01',	'2025-01-07 11:20:26',	1,	0,	1,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	7,	'',	'',	250,	'',	0,	0,	'',	1,	40,	NULL,	NULL),
(16,	NULL,	'tompay@gmail.com',	'971',	'5616601344',	0,	'$2y$10$3b11EZExJkzica5es0f7ge72ZO5zmtijWpRCeurykRVMPqWAJ/LhG',	NULL,	'3',	'Tom',	'Pay',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-07 06:48:56',	'2025-01-07 06:53:17',	1,	0,	2,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	7,	'',	'',	200,	'',	0,	0,	'',	1,	50,	NULL,	NULL),
(5,	NULL,	'v2@mailinator.com',	'971',	'76666666565',	0,	'$2y$10$MfA6hbpHAbNhN9gZ66t2juLLVeuB.1irp84jNEVbYEdoxYcAj8s5m',	NULL,	'3',	'Gift',	'Palace',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2024-07-02 04:35:46',	'2025-01-07 07:05:51',	1,	0,	1,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	7,	'',	'',	0,	'',	0,	0,	'',	1,	0,	NULL,	NULL),
(11,	'Hunain Ahmad. ',	'hunainahmad12345@gmail.com',	'971',	'987654321',	1,	'$2y$10$/6ei8XQDoioTvlFHIG4mg.YFEwuKZ96SK/wqDCyM4e9nbzkSHjqGy',	'2024-12-02 09:56:40',	'2',	'Hunain Ahmad.',	NULL,	NULL,	'',	'',	'ANDROID',	'e1a3a1c6f366ca4a4b19f4e28315830b92c797a2315555f1703169d7cf5fd4b0',	'-OD5nEoNNKMnhqVzS5qR',	NULL,	'2024-12-02 09:56:40',	'2025-01-09 16:27:22',	0,	0,	0,	0,	1,	0,	NULL,	NULL,	1,	'',	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'1',	NULL,	'',	'',	NULL,	'2024120211',	0,	0,	'',	0,	0,	NULL,	NULL),
(20,	NULL,	'wigeholy@mailinator.com',	NULL,	NULL,	0,	'$2y$10$y5H3zMzFyyWzM839oCZ6ZOBfmxQxq5JyhLx3OhYJsfphIgRfbBJ/6',	NULL,	'3',	'Clare',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-07 14:05:12',	'2025-01-07 14:05:12',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(19,	NULL,	'anz@anz.com',	NULL,	NULL,	0,	'$2y$10$2HmXwF4VdnHN8VWYeDVpGOkFjwtkRVkpsjM1FsDEhsm7aBqFiVH.i',	NULL,	'3',	'Anil',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-07 13:53:10',	'2025-01-07 13:53:10',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	1,	0,	NULL,	NULL),
(4,	NULL,	'v1@mailinator.com',	'971',	'98765543212',	0,	'$2y$10$QYVRbwZ2WiGwGf.p9GXYyuPXpDHfFenJMpLWhqi8toha/gSSaxlxu',	NULL,	'3',	'Gift',	'Hub',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2024-07-02 04:33:39',	'2025-01-07 23:29:50',	1,	0,	1,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	7,	'',	'',	0,	'',	0,	0,	'',	1,	0,	NULL,	NULL),
(51,	NULL,	'favupapan@mailinator.com',	NULL,	NULL,	0,	'$2y$10$ATXJ.Li2W1xwVQpfAJmRxegyy1GUL7Uiw4nrNPVuPM8ARqYgdeDlG',	NULL,	'3',	'Stephen',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-10 09:27:35',	'2025-01-10 09:29:53',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	'disabled'),
(17,	NULL,	'david@gmail.com',	'971',	'561660155',	0,	'$2y$10$iXZDqPPo2VwY0mPAOaRXf.mqkIkkb9iOJ6A051meq4mhNoZOJ5sf2',	NULL,	'3',	'David',	'Agarwal',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-07 08:48:08',	'2025-01-16 07:28:20',	1,	0,	1,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	7,	'',	'',	500,	'',	0,	0,	'',	1,	25,	NULL,	'disabled'),
(29,	NULL,	'xcczxcxzczx@dcss.ds',	NULL,	NULL,	0,	'$2y$10$LDzPhqDJSiHgASw7x6/6qOxVxIBTED4w3W26QftsY5EaoU1akmu4q',	NULL,	'3',	'fdsfdssdffsd',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-08 04:53:14',	'2025-01-08 04:53:14',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(24,	NULL,	'bilokece@mailinator.com',	NULL,	NULL,	0,	'$2y$10$dhyphEq9FoSU/J7HqADiquKjX/bTOXbdf.YjMO5asumqaOTMv2iZu',	NULL,	'3',	'Drew',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-07 17:56:06',	'2025-01-07 17:56:58',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(25,	NULL,	'anz2@anz1.com',	NULL,	NULL,	0,	'$2y$10$afs/WR31ORtUyuN8BLEwheAs2qsg.RmSyv4mYjf/4hHz8xcmqCncK',	NULL,	'3',	'Anil',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-07 18:03:25',	'2025-01-07 18:12:25',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(37,	NULL,	'is@sdg.com',	NULL,	NULL,	0,	'$2y$10$SbwTqt8O6aXIPUwNfr3EJ.EDfgdlebhI9Mtm/WeP4CnLb3i0tYMgq',	NULL,	'3',	'anil',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-08 10:34:31',	'2025-01-08 10:40:55',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(31,	NULL,	'asda@asdasd.com',	NULL,	NULL,	0,	'$2y$10$1aaVsXk8icfxaMv3v1TbOeIx87dhxSkxfw.HGxUztGW/ALoEyvjQ.',	NULL,	'3',	'Randall',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-08 07:21:34',	'2025-01-08 07:21:34',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	1,	0,	NULL,	NULL),
(26,	NULL,	'vahufad@mailinator.com',	NULL,	NULL,	0,	'$2y$10$hVYVN9LQ8ZqJwAeI3hnaD.SgQGXr.F32SDgQ4urJGVvd.86NUSqhS',	NULL,	'3',	'Louis',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-08 04:19:15',	'2025-01-08 04:20:21',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(27,	NULL,	'joqiqoryvo@mailinator.com',	NULL,	NULL,	0,	'$2y$10$LK45I6J0PRisRoIZ0ij2pu5idZfXxaKfd3L5mMnFs3XPuWU43Lhlq',	NULL,	'3',	'Brianna',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-08 04:42:31',	'2025-01-08 04:42:31',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(28,	NULL,	'kafefawu@mailinator.com',	NULL,	NULL,	0,	'$2y$10$k1V1cN6sXHkGHUphd0INSe2E/tSVytSXi3ZaJgW8EH6EIgXEqTp1C',	NULL,	'3',	'Sydney',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-08 04:45:57',	'2025-01-08 04:52:11',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(33,	'test dev',	'test@gmail.com',	'971',	'321654789',	1,	'$2y$10$IDnRHwX5rQqXcKLsZ3w1SOnajtcyWy0q2ze2tPhvzq0fN1aXB/6IS',	'2025-01-08 09:01:55',	'2',	'test',	'dev',	NULL,	'',	'',	'ANDROID',	'f2f777f9d4a3b6c8b8abf9effa900fc3ef5f5d956cf40c8565b50251b3eae59a',	'-OG48XUZStdwXaEt5sjB',	NULL,	'2025-01-08 09:01:55',	'2025-01-14 10:27:15',	0,	0,	0,	0,	1,	0,	NULL,	NULL,	1,	'',	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	100,	'',	'2025-01-08 10:39:36',	0,	NULL,	'0',	'0',	NULL,	'',	'',	NULL,	'2025010833',	0,	0,	'',	0,	0,	NULL,	NULL),
(32,	NULL,	'anz3@anz1.com',	NULL,	NULL,	0,	'$2y$10$Rqi2NBbL6ozp6nUBV4F7mOQDqQu0Kqb7.iXabPE9yukn6nMbWPi22',	NULL,	'3',	'Anil',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-08 07:59:31',	'2025-01-08 08:09:32',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	1,	0,	NULL,	NULL),
(34,	NULL,	'noripa@mailinator.com',	NULL,	NULL,	0,	'$2y$10$N2mgFydwSoIL53n9OiKW0.7TND9D.i8eAQjgyC7hhgGrR7Jgc/Lb2',	NULL,	'3',	'Latifah',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-08 09:03:10',	'2025-01-08 09:03:56',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(35,	NULL,	'csacs@cds.ss',	NULL,	NULL,	0,	'$2y$10$YNf1Rtn8/XQwm/U8KCF.2ObcSGqREQrQYBA3rhmZvvDDtM5tAWXy.',	NULL,	'3',	'csdvsd',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-08 09:22:37',	'2025-01-08 09:22:37',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(36,	NULL,	'vdvds@vdd.sds',	NULL,	NULL,	0,	'$2y$10$tA3U.c2D33Oyn4xBFIi0keHgF9wqusBUGEpGyQcEJFSat7oLx5ere',	NULL,	'3',	'vsdvds',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-08 09:23:10',	'2025-01-08 09:23:10',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	1,	0,	NULL,	NULL),
(40,	NULL,	'natifihi@mailinator.com',	NULL,	NULL,	0,	'$2y$10$0wpMF4VteB7ywDKExgIve.mVkuxAChwKxxpHpUXa4VYWKCjYVQZnS',	NULL,	'3',	'Deacon',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-08 14:11:19',	'2025-01-08 14:11:19',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(41,	NULL,	'rufoqih@mailinator.com',	NULL,	NULL,	0,	'$2y$10$0zDcFVAWrnLRMt6i.Gvgi.aasUhyqdBCjXgtb7cI3wHzTEtYHGXN.',	NULL,	'3',	'Marsden',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-08 16:22:26',	'2025-01-08 16:24:37',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	1,	0,	NULL,	NULL),
(39,	NULL,	'telinatyki@mailinator.com',	NULL,	NULL,	0,	'$2y$10$4u1vN2Hkhcq5avWjB4gRVe4uxDRNRSXVyPBzpXfVdnQZVfQeAYc2y',	NULL,	'3',	'Pearl',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-08 11:20:40',	'2025-01-08 11:20:40',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(43,	NULL,	'ddd@sdg.com',	NULL,	NULL,	0,	'$2y$10$qj4GbZUe12Tc76dgIikJi.eSH3GIPAlDJpHNly88qbA2XucMJ.sh6',	NULL,	'3',	'ai',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-09 07:46:10',	'2025-01-09 07:46:10',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(38,	'test dev two',	'test2@gmail.com',	'971',	'3213698744',	1,	'$2y$10$nq4fPOaEdxeJ3at79dYp4eL./VYaVj4L3iIdFl9xQUBb6/VUdSzau',	'2025-01-08 10:41:12',	'2',	'test',	'dev two',	NULL,	'',	'',	'ANDROID',	'4910bf08752f555e86553d6c7ee98349b374b6b24f752992f7577a2502f0394a',	'-OG4VFigX-8YaQYAcl3s',	NULL,	'2025-01-08 10:41:12',	'2025-01-09 12:23:11',	0,	0,	0,	0,	1,	0,	NULL,	NULL,	1,	'',	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'2025010838',	0,	0,	'',	0,	0,	NULL,	NULL),
(44,	NULL,	'anil@anil1.com',	NULL,	NULL,	0,	'$2y$10$.tJ4A3o99CrLRk8tD1/oGOT7QGfLck7tDmhXCZ8uGU3xbm6DyeUXy',	NULL,	'3',	'anil',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-09 14:36:44',	'2025-01-09 14:36:44',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(42,	NULL,	'liwuriryfy@mailinator.com',	NULL,	NULL,	0,	'$2y$10$4/VUWNk5vClDPPdiKsJXUuilgFAGpwq9JJQLpaQWgdpcpJ90sCxUe',	NULL,	'3',	'Leo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-08 16:31:25',	'2025-01-08 16:43:22',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	1,	0,	NULL,	NULL),
(30,	NULL,	'marthurcheng@gmail.com',	'971',	'561660188',	0,	'$2y$10$8LkTaz6xO4Tpr4mVRJfPCe49Mlo1eDy5yJeDDD7VJcg.GJzIZnZMy',	NULL,	'3',	'Marthur',	'Cheng',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-08 06:55:40',	NULL,	1,	0,	1,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	7,	'',	'',	200,	'',	0,	0,	'',	1,	20,	NULL,	NULL),
(45,	NULL,	'sfsaf@f.com',	NULL,	NULL,	0,	'$2y$10$wLju5ObQn11Sq.TZfLwkV.vqXk6L6ajYl3JYnG5gsg1qEr0xgWQlS',	NULL,	'3',	'anil',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-09 14:51:52',	'2025-01-09 15:02:08',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	1,	0,	NULL,	NULL),
(47,	NULL,	'wahal@mailinator.com',	NULL,	NULL,	0,	'$2y$10$rrhuWz1Gh9mosqKTf55YYezp/oyD6cjCjfd7srslW1WmSKkCrFkEG',	NULL,	'3',	'Valentine',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-10 06:17:33',	'2025-01-10 06:17:33',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(48,	NULL,	'puqeqocona@mailinator.com',	NULL,	NULL,	0,	'$2y$10$I4RWAJSrxKBg48pNxAg9cuStGfyaKlUX7Lf3cDoluUlfNVH3PWLbS',	NULL,	'3',	'Sierra',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-10 06:50:05',	'2025-01-10 06:50:05',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(49,	NULL,	'puqeqocona@mailinator.com',	NULL,	NULL,	0,	'$2y$10$KlWTN3NJ2Ekf5GuZdkkR2upkkHon1.ok04qxVKLm.OB4vbXtidULy',	NULL,	'3',	'Sierra',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-10 06:50:05',	'2025-01-10 06:50:05',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(50,	NULL,	'mozu@mailinator.com',	NULL,	NULL,	0,	'$2y$10$F06LgAFi9X1WnN9pHDiaceNjwFv/7BPVxXwREXnf54TuuuzUCQv6e',	NULL,	'3',	'Troy',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-10 09:10:30',	'2025-01-10 09:12:23',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	'enabled'),
(9,	'hunain dev',	'hunain88@gmail.com',	'971',	'123456789',	1,	'$2y$10$oMOk2VEOuBYI8FCX6J4zuuw3oXDbM/WxmRD5F0qCy06KqOVT95cjK',	'2024-11-30 11:33:34',	'2',	'hunain',	'dev',	'/uploads/company/6784d5cdf03dc_1736758733.jpg',	'',	'cR0bfnAeSdyt0drSADtjDp:APA91bEMal_fACVXP5m97PhpU380G1QvQu1W_1HwQ7wTLZVSx5hDiE39OFiWwwz1gjFefTIHg3kUgLlDrGhjRdktsW3qp29M-fcv3kkTXDtUzoSEhjyNdoE',	'ANDROID',	'5eb8829415272fecfd9d66ffb8ddc522a4140799271dee56a0ba804d8fd1a2bf',	'-OCwqEiORwtIfFZt9P2d',	NULL,	'2024-11-30 11:33:34',	'2025-01-16 06:52:07',	0,	0,	0,	0,	1,	0,	NULL,	NULL,	1,	'',	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	'',	'2024-11-30 12:22:30',	0,	NULL,	'0',	'0',	NULL,	'',	'',	NULL,	'202411309',	0,	0,	'',	0,	0,	NULL,	NULL),
(59,	NULL,	'ajeshkumarcd@gmail.com',	NULL,	NULL,	0,	'$2y$10$Oo802rzygY6/8pgTKYbt.O7gth2Bc2/Vajci5OceTGdlojbI.yLpi',	NULL,	'3',	'Ajesh Store',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-15 09:35:38',	'2025-01-15 09:37:34',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	'disabled'),
(56,	NULL,	'xzczxxzc@cvcx.ds',	NULL,	NULL,	0,	'$2y$10$gbX8IyFBRZJuYhIBy/lnb.VeTY5dZ5NCHujxZCrjAdpZbqK2ucrQW',	NULL,	'3',	'dsfsdfsdffds',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-15 05:06:00',	'2025-01-15 05:06:00',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(57,	NULL,	'dxbiftikhar1@gmail.com',	NULL,	'34242342342',	0,	'$2y$10$un1Ec59rRmSHFaxyF5OG5ORMQRXBK0fo0XHtuBbEB6mk9DDu7B12m',	NULL,	'2',	'dxb',	'iftikhar',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-15 07:14:18',	'2025-01-15 07:14:18',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(53,	NULL,	'lapunyc@mailinator.com',	NULL,	NULL,	0,	'$2y$10$sG5ugWtpY.u5i6eIpJxPJeytXO9j1U.exSr.KsXDpOsMNznEIViaG',	NULL,	'3',	'Alexa',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-10 13:48:26',	'2025-01-10 13:48:26',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(60,	NULL,	'guesthhh@gmail.com',	NULL,	'0561660155',	0,	'$2y$10$NDHjxsXg6Y3i/z1RRzy7/OzYYPEkE0.b1lZYWeODg8u6jeJromzEa',	NULL,	'2',	'Guest',	'hhh',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-15 09:48:06',	'2025-01-15 09:48:06',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(54,	NULL,	'hiba@gmail.com_deleted_mail',	NULL,	'_deleted_mobile',	0,	'$2y$10$kKqhBdyQQtw13AuhiQJwiusa6NYmR/a2gGywxUrfZ19LnGvf4ABCq',	NULL,	'3',	'hhh',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-10 15:09:05',	'2025-01-10 15:09:05',	0,	0,	0,	0,	0,	1,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(61,	NULL,	'ajeshkumarcd@gmail.com',	NULL,	NULL,	0,	'$2y$10$hQGWvHU0pI22myeQxUq5XeU521oRQWyVHRqtLs3zyekqYy32Z2quu',	NULL,	'3',	'Ajesh',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-15 10:16:59',	'2025-01-15 10:16:59',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	'disabled'),
(55,	NULL,	'dxbiftikhar@gmail.com',	NULL,	'757656756567576',	0,	'$2y$10$vLvwo5zZaUN0ftLsEx7dKO5.3e437SoriSCd8JxeTcLbrwzRMWgEW',	NULL,	'2',	'dxb',	'iftikhar',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-14 06:03:32',	'2025-01-14 06:03:32',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(58,	'Ajesh Kumar',	'ajeshcd@gmail.com',	'971',	'505041860',	1,	'$2y$10$81AOcnDkVKLFdPyvouvFpucwMvHzopsB6NJo1qyELjw.O2IFS6706',	'2025-01-15 09:18:43',	'2',	'Ajesh',	'Kumar',	NULL,	'',	'chZdpwJtQ4efOD8ChJVMPd:APA91bHEovPflqdsjn60y9LGi01vaQDofrotIMTTqgF1nK3KhJz5DzDiLEGZF0F4PhKCV7U6dqO8G_PvbcLsnDDgczIOweB9OnTjT4rRqUn5-m0uWBYZSsw',	'ANDROID',	'b204f66a7046acb2ed531c27445ab2e3c987ff2139d60988e380868842384727',	'-OGdFVnVVTZqyg56Z7KA',	NULL,	'2025-01-15 09:18:43',	'2025-01-15 09:18:44',	0,	0,	0,	0,	1,	0,	NULL,	NULL,	1,	'',	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'2025011558',	0,	0,	'',	0,	0,	NULL,	NULL),
(13,	'Asad nazir',	'asadnazir289@gmail.com',	'971',	'3441560349',	1,	'$2y$10$c2oHLdQkil2Ao7AISKLxUefUtBB9xGcwVgP3zJdCM6L15IYCs.Rt6',	'2025-01-06 22:22:11',	'2',	'Asad',	'nazir',	'/uploads/company/67892434b57b9_1737040948.jpg',	'',	'eufJNcZa8E8N5Kwvs2yBL8:APA91bH1k3W57vn3pxEnykSleW3KQhzUHX8sRLiurEIMnMXbJkagYCp_fRIhhzIuHGewMD475n_chKUreIChmDBNavWeDt_MZwDj7XxI5CtWCHq4farFXvE',	'ANDROID',	'88d67f8c28f5b71554cafbff069de77b0bc6e74fcfe2b5986f00dad42e042a6d',	'-OFxhWdfgqKK_9a7jQ9h',	NULL,	'2025-01-06 22:22:11',	'2025-01-16 15:22:28',	0,	0,	0,	0,	1,	0,	NULL,	NULL,	1,	'',	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	2010,	'',	'2025-01-10 13:01:55',	0,	NULL,	'0',	'0',	NULL,	'',	'',	NULL,	'2025010613',	0,	0,	'',	0,	0,	NULL,	NULL),
(62,	NULL,	'khalshamsi42@gmail.com',	NULL,	NULL,	0,	'$2y$10$w91P1OdzdIiM2jO52GvSu.fBrFhkz6N3NuOrwuVuK//JQMgXTa1JG',	NULL,	'3',	'Khalifa',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-17 14:59:51',	'2025-01-17 15:06:39',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	'enabled'),
(63,	NULL,	'drbal3in@hotmail.com',	NULL,	NULL,	0,	'$2y$10$GvPV68Vt33ZASgMxlotHoutryyZ8b4Cm7j6qHf4VUQgk0Cnk5obWa',	NULL,	'3',	'Mohammed',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-17 15:42:07',	'2025-01-17 15:42:07',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(64,	NULL,	'recoba-92@hotmail.com',	NULL,	NULL,	0,	'$2y$10$MvRKjQDT4AcWJ5HjSzeNteXctp5FsMIe3wsWdKjkwAV69MJmWxfJ2',	NULL,	'3',	'Abdullah',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-18 16:32:17',	'2025-01-18 16:32:17',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL),
(65,	NULL,	'mr.rizwan@hotmail.com',	NULL,	NULL,	0,	'$2y$10$LVfC6ASZS080MgdXQsv9fec4xVEjb3VyChfUCjEGD2QIMQzeBzdpK',	NULL,	'3',	'Rizwan',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-24 06:50:42',	'2025-01-24 06:54:21',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	1,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	'disabled'),
(66,	'Rizwan Mirza',	'rizwan.3d@gmail.com',	NULL,	'2423423423',	0,	'$2y$10$7F29MC97rN.aXKmSzFoypu0BG.QRIqcWJUHNrDx2QbcS4.cXFHrCS',	NULL,	'2',	'Rizwan',	'Mirza',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2025-01-27 06:05:59',	'2025-01-27 06:05:59',	0,	0,	0,	0,	0,	0,	NULL,	NULL,	0,	NULL,	NULL,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	1,	NULL,	0,	NULL,	NULL,	0,	NULL,	NULL,	'0',	NULL,	'',	'',	NULL,	'',	0,	0,	'',	0,	0,	NULL,	NULL);

DROP TABLE IF EXISTS "users_role";
DROP SEQUENCE IF EXISTS users_role_id_seq;
CREATE SEQUENCE users_role_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."users_role" (
    "id" bigint DEFAULT nextval('users_role_id_seq') NOT NULL,
    "role_name" character varying(200) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "users_role_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "users_role" ("id", "role_name", "created_at", "updated_at") VALUES
(1,	'admin',	'2024-06-27 10:45:55',	'2024-06-27 10:45:55'),
(2,	'users',	'2024-06-27 10:45:55',	'2024-06-27 10:45:55'),
(3,	'vendors',	'2024-06-27 10:45:55',	'2024-06-27 10:45:55');

DROP TABLE IF EXISTS "vendor_cuisines";
DROP SEQUENCE IF EXISTS vendor_cuisines_id_seq;
CREATE SEQUENCE vendor_cuisines_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."vendor_cuisines" (
    "id" bigint DEFAULT nextval('vendor_cuisines_id_seq') NOT NULL,
    "vendor_id" integer DEFAULT '0' NOT NULL,
    "cuisine_id" integer DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "vendor_cuisines_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "vendor_details";
DROP SEQUENCE IF EXISTS vendor_details_id_seq;
CREATE SEQUENCE vendor_details_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."vendor_details" (
    "id" bigint DEFAULT nextval('vendor_details_id_seq') NOT NULL,
    "homedelivery" integer DEFAULT '1' NOT NULL,
    "logo" character varying(600),
    "key_control" integer DEFAULT '0' NOT NULL,
    "branches" integer DEFAULT '0' NOT NULL,
    "company_name" character varying(600),
    "company_brand" character varying(600),
    "legal_staus" character varying(600),
    "reg_date" timestamp(0),
    "trade_license" character varying(600),
    "trade_license_expiry" timestamp(0),
    "vat_reg_number" character varying(600),
    "vat_reg_expiry" timestamp(0),
    "address1" character varying(600),
    "address2" character varying(600),
    "street" character varying(600),
    "zip" character varying(300),
    "trade_license_doc" character varying(600),
    "chamber_of_commerce_doc" character varying(600),
    "share_certificate_doc" character varying(600),
    "power_attorny_doc" character varying(600),
    "vat_reg_doc" character varying(600),
    "signed_agreement_doc" character varying(600),
    "identy1_type" integer DEFAULT '0' NOT NULL,
    "identy1_doc" character varying(600),
    "identy2_type" integer DEFAULT '0' NOT NULL,
    "identy2_doc" character varying(600),
    "company_identy1_type" integer DEFAULT '0' NOT NULL,
    "company_identy1_doc" character varying(600),
    "company_identy2_type" integer DEFAULT '0' NOT NULL,
    "company_identy2_doc" character varying(600),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "industry_type" integer DEFAULT '0' NOT NULL,
    "user_id" integer DEFAULT '0' NOT NULL,
    "store_type" integer DEFAULT '0' NOT NULL,
    "txt_location" character varying(600),
    "location" character varying(600),
    "latitude" character varying(600),
    "longitude" character varying(600),
    "area" character varying(600),
    "pharmacycommission" double precision,
    "servicecommission" double precision,
    "featured_flag" integer DEFAULT '0' NOT NULL,
    "open_time" character varying(600),
    "close_time" character varying(600),
    "description" text,
    "cover_image" character varying(600),
    "country" character varying(255) DEFAULT '0',
    "city" character varying(255) DEFAULT '0',
    "street1" character varying(255) DEFAULT '0',
    "street2" character varying(255) DEFAULT '0',
    "state" character varying(255) DEFAULT '0',
    "postal_code" character varying(255) DEFAULT '0',
    "phone_number" character varying(255) DEFAULT '0',
    CONSTRAINT "vendor_details_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "vendor_details" ("id", "homedelivery", "logo", "key_control", "branches", "company_name", "company_brand", "legal_staus", "reg_date", "trade_license", "trade_license_expiry", "vat_reg_number", "vat_reg_expiry", "address1", "address2", "street", "zip", "trade_license_doc", "chamber_of_commerce_doc", "share_certificate_doc", "power_attorny_doc", "vat_reg_doc", "signed_agreement_doc", "identy1_type", "identy1_doc", "identy2_type", "identy2_doc", "company_identy1_type", "company_identy1_doc", "company_identy2_type", "company_identy2_doc", "created_at", "updated_at", "industry_type", "user_id", "store_type", "txt_location", "location", "latitude", "longitude", "area", "pharmacycommission", "servicecommission", "featured_flag", "open_time", "close_time", "description", "cover_image", "country", "city", "street1", "street2", "state", "postal_code", "phone_number") VALUES
(1,	1,	NULL,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	'2024-06-27 10:52:26',	'2024-06-27 10:52:26',	1,	2,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	'0',	'0',	'0',	'0',	'0',	'0',	'0'),
(2,	1,	'/uploads/company/667e571830476_1719555864.jpg',	0,	0,	'Testttt',	NULL,	NULL,	NULL,	'84444842947664',	'2025-06-28 00:00:00',	NULL,	NULL,	'dsdsd',	'dsdsd',	'dsdsd',	'585220',	'/uploads/company/667e57183064f_1719555864.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	'2024-06-28 06:24:24',	'2024-06-28 06:24:24',	2,	3,	0,	NULL,	'673C+VFH - Dubai - United Arab Emirates',	'25.204819',	'55.270931',	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	'0',	'0',	'0',	'0',	'0',	'0',	'0'),
(16,	1,	NULL,	0,	0,	'DXBAPPs',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	'2025-01-10 09:45:17',	'2025-01-10 09:45:17',	0,	52,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	'1',	'1',	'Ajman industrial area 2',	'building 304',	'1',	'500001',	'5616601444'),
(18,	1,	NULL,	0,	0,	'Handwi',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	'2025-01-17 15:06:39',	'2025-01-17 15:06:39',	0,	62,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	'1',	'1',	'R',	'Fdfdfdsfdsfds 121',	'1',	'00000',	'0507188834'),
(5,	1,	'/uploads/company/677cce5819122_1736232536.jpg',	0,	0,	'Thread & Trend',	NULL,	NULL,	NULL,	'AABB1122',	'2025-02-28 00:00:00',	NULL,	NULL,	'Ajman Gate Tower',	'Ajman',	'Industrial area 2',	'00000',	'/uploads/company/677cce5819e1c_1736232536.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	'2025-01-07 06:48:56',	'2025-01-07 06:53:17',	0,	16,	0,	'9FG5+CP5 - Sheikh Zayed Street - Ajman Industrial 2 - Ajman - United Arab Emirates',	'9FG5+CP5 - Sheikh Zayed Street - Ajman Industrial 2 - Ajman - United Arab Emirates',	'25.3764521',	'55.45897369999999',	NULL,	NULL,	40,	0,	NULL,	NULL,	'Thread & Trend is a clothing brand name that combines two essential elements of fashion: "Thread," representing the materials and craftsmanship that go into creating clothing, and "Trend," symbolizing style, modernity, and staying current with fashion.

This name suggests a blend of quality fabric with contemporary, fashionable designs, making it an appealing choice for a clothing vendor aiming to attract customers who appreciate both craftsmanship and the latest trends. It evokes the idea of high-quality garments that are fashionable and timeless.',	'/uploads/company/677cce5819d59_1736232536.jpg',	'0',	'0',	'0',	'0',	'0',	'0',	'0'),
(4,	1,	'/uploads/company/668383a277971_1719894946.jpeg',	0,	0,	'Gift Palace',	NULL,	NULL,	NULL,	'56675756756',	'2024-07-31 00:00:00',	NULL,	NULL,	'1/2 Hatta Center',	NULL,	'1/2 Street',	'56755',	'/uploads/company/668383a277a95_1719894946.jpeg',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	'2024-07-02 04:35:46',	'2025-01-07 07:05:51',	2,	5,	0,	'673C+VFH - Dubai - United Arab Emirates',	'673C+VFH - Dubai - United Arab Emirates',	'25.204819',	'55.270931',	NULL,	NULL,	0,	0,	NULL,	NULL,	'test',	NULL,	'0',	'0',	'0',	'0',	'0',	'0',	'0'),
(7,	1,	'/uploads/company/677cec5da1611_1736240221.png',	0,	0,	'Vivid Interiors',	NULL,	NULL,	NULL,	'AABB5566',	'2025-03-12 00:00:00',	NULL,	NULL,	'Mariam al owais building',	NULL,	'Industrial area 2',	'00000',	'/uploads/company/677cec5da1be0_1736240221.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	'2025-01-07 08:57:01',	'2025-01-07 11:20:26',	0,	18,	0,	'58X6+JC - Al Jaddaf - Dubai - United Arab Emirates',	'58X6+JC - Al Jaddaf - Dubai - United Arab Emirates',	'25.200392364793725',	'55.31067060876463',	NULL,	NULL,	50,	0,	NULL,	NULL,	'Vivid Interiors is a décor brand that brings vibrant and colorful designs to life. Whether you''re looking for bold statement pieces or subtle accents, Vivid Interiors ensures that every corner of your home radiates with energy and style.',	'/uploads/company/677cec5da1b1b_1736240221.jpg',	'0',	'0',	'0',	'0',	'0',	'0',	'0'),
(8,	1,	'/uploads/company/6784d5cdf03dc_1736758733.jpg',	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	'2025-01-07 10:20:06',	'2025-01-13 08:58:53',	1,	9,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	'0',	'0',	'0',	'0',	'0',	'0',	'0'),
(3,	1,	'/uploads/company/677db8eeab55c_1736292590.png',	0,	0,	'Gift Hub',	NULL,	NULL,	NULL,	'76456456464',	'2024-07-31 00:00:00',	NULL,	NULL,	'Hatta Center',	NULL,	'1/2 Street',	'76575',	'/uploads/company/66838323cec5f_1719894819.png',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	'2024-07-02 04:33:39',	'2025-01-07 23:29:50',	2,	4,	0,	'Abu Dhabi UAE',	'Abu Dhabi UAE',	'25.205608871677928',	'55.288703590818336',	NULL,	NULL,	0,	0,	NULL,	NULL,	'test',	NULL,	'0',	'0',	'0',	'0',	'0',	'0',	'0'),
(9,	1,	NULL,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	'2025-01-08 05:49:06',	'2025-01-08 05:49:06',	1,	15,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	'0',	'0',	'0',	'0',	'0',	'0',	'0'),
(10,	1,	'/uploads/company/677e216c75cb9_1736319340.jpg',	0,	0,	'Ember & Lace',	NULL,	NULL,	NULL,	'AABB7788',	'2025-03-30 00:00:00',	NULL,	NULL,	'8th floor, 812 Apartment',	NULL,	'Industrial area 2',	'00000',	'/uploads/company/677e216c7671a_1736319340.png',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	'2025-01-08 06:55:40',	'2025-01-08 06:55:40',	0,	30,	0,	'58M2+4H Dubai - United Arab Emirates',	'58M2+4H Dubai - United Arab Emirates',	'25.182761887707354',	'55.30148672509764',	NULL,	NULL,	40,	0,	NULL,	NULL,	'This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design. Suggesting warmth and delicate detailing, this name could be fitting for handmade bags, scarves, and elegant accessories.',	'/uploads/company/677e216c762c0_1736319340.jpg',	'0',	'0',	'0',	'0',	'0',	'0',	'0'),
(11,	1,	NULL,	0,	0,	'Anne',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'Vielka',	NULL,	'Pandora',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	'2025-01-08 16:43:01',	'2025-01-08 16:43:01',	0,	42,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	'0',	'0',	'0',	'0',	'0',	'0',	'0'),
(12,	1,	NULL,	0,	0,	'Anne',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'Vielka',	NULL,	'Pandora',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	'2025-01-08 16:43:22',	'2025-01-08 16:43:22',	0,	42,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	'0',	'0',	'0',	'0',	'0',	'0',	'0'),
(13,	1,	NULL,	0,	0,	'dddee',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'wet',	NULL,	'werwer',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	'2025-01-09 15:02:08',	'2025-01-09 15:02:08',	0,	45,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	'0',	'0',	'0',	'0',	'0',	'0',	'0'),
(14,	1,	NULL,	0,	0,	'Madeline',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	'2025-01-10 09:12:23',	'2025-01-10 09:12:23',	0,	50,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	'1',	'1',	'asdasdasdada',	'adadasda',	'1',	'123123',	'2423423423'),
(15,	1,	NULL,	0,	0,	'Elijah',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	'2025-01-10 09:29:53',	'2025-01-10 09:29:53',	0,	51,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	'1',	'1',	'sadasdasdasd',	'asdasdasdad',	'1',	'213123',	'2131231313'),
(17,	1,	NULL,	0,	0,	'Ajesh Store',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	'2025-01-15 09:37:34',	'2025-01-15 09:37:34',	0,	59,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	'1',	'1',	'aeae',	'dsds',	'1',	'233232',	'3232323232'),
(6,	1,	'/uploads/company/677cea486f1af_1736239688.jpg',	0,	0,	'Gleaming Grace',	NULL,	NULL,	NULL,	'AABB3344',	'2025-03-28 00:00:00',	NULL,	NULL,	'Mariam al owais building',	NULL,	'Industrial area 2',	'00000',	'/uploads/company/677cea486f8e2_1736239688.png',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	'2025-01-07 08:48:08',	'2025-01-16 07:28:20',	0,	17,	0,	'10 27th St - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates',	'10 27th St - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates',	'25.20093599533033',	'55.241662735229475',	NULL,	NULL,	50,	0,	NULL,	NULL,	'Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty. The word "Gleaming" suggests a radiant, shining quality, symbolizing the brilliance of fine jewelry. "Grace" adds an element of elegance and timeless appeal, evoking the delicate craftsmanship and refined designs that the brand offers.

This name would be perfect for a jewelry vendor focused on high-quality, exquisite pieces that emphasize both beauty and grace. It suggests a brand that appeals to those who appreciate both luxury and understated elegance, making it a great fit for products such as diamond jewelry, fine gemstones, or elegant gold pieces.',	'/uploads/company/677cea486f816_1736239688.jpg',	'1',	'1',	'dubai',	'dubai',	'1',	'453453',	'4534534534'),
(19,	1,	NULL,	0,	0,	'Craftee',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	0,	NULL,	'2025-01-24 06:54:21',	'2025-01-24 06:54:21',	0,	65,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	'1',	'Select City',	'test address',	'uae',	'Select State',	'234232',	'2423423423');

DROP TABLE IF EXISTS "vendor_followers";
DROP SEQUENCE IF EXISTS vendor_followers_id_seq;
CREATE SEQUENCE vendor_followers_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."vendor_followers" (
    "id" bigint DEFAULT nextval('vendor_followers_id_seq') NOT NULL,
    "vendor_id" integer DEFAULT '0',
    "user_id" integer DEFAULT '0',
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "vendor_followers_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "vendor_locations";
DROP SEQUENCE IF EXISTS vendor_locations_id_seq;
CREATE SEQUENCE vendor_locations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."vendor_locations" (
    "id" bigint DEFAULT nextval('vendor_locations_id_seq') NOT NULL,
    "user_id" integer NOT NULL,
    "location" text,
    "latitude" character varying(255),
    "longitude" character varying(255),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "is_default" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "vendor_locations_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "vendor_locations" ("id", "user_id", "location", "latitude", "longitude", "created_at", "updated_at", "is_default") VALUES
(1,	3,	'673C+VFH - Dubai - United Arab Emirates',	'25.204819',	'55.270931',	'2024-06-28 06:24:24',	'2024-06-28 06:24:24',	1),
(4,	4,	'51 58a St - Al Wasl - Dubai - United Arab Emirates',	'25.199397661153014',	'55.26431966945836',	'2024-08-29 15:10:13',	'2024-08-29 15:10:13',	0),
(5,	4,	'3 19th St - Al Wasl - Dubai - United Arab Emirates',	'25.202644532643',	'55.25479483056639',	'2024-08-30 18:03:51',	'2024-08-30 18:03:51',	0),
(6,	16,	'9FG5+CP5 - Sheikh Zayed Street - Ajman Industrial 2 - Ajman - United Arab Emirates',	'25.3764521',	'55.45897369999999',	'2025-01-07 06:48:56',	'2025-01-07 06:53:17',	1),
(3,	5,	'673C+VFH - Dubai - United Arab Emirates',	'25.204819',	'55.270931',	'2024-07-02 04:35:46',	'2025-01-07 07:05:51',	1),
(8,	18,	'58X6+JC - Al Jaddaf - Dubai - United Arab Emirates',	'25.200392364793725',	'55.31067060876463',	'2025-01-07 08:57:01',	'2025-01-07 11:20:26',	1),
(2,	4,	'Abu Dhabi UAE',	'25.205608871677928',	'55.288703590818336',	'2024-07-02 04:33:39',	'2025-01-07 23:29:50',	1),
(9,	30,	'58M2+4H Dubai - United Arab Emirates',	'25.182761887707354',	'55.30148672509764',	'2025-01-08 06:55:40',	'2025-01-08 06:55:40',	1),
(7,	17,	'10 27th St - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates',	'25.20093599533033',	'55.241662735229475',	'2025-01-07 08:48:08',	'2025-01-08 09:07:18',	1);

DROP TABLE IF EXISTS "vendor_menu_images";
DROP SEQUENCE IF EXISTS vendor_menu_images_id_seq;
CREATE SEQUENCE vendor_menu_images_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."vendor_menu_images" (
    "id" bigint DEFAULT nextval('vendor_menu_images_id_seq') NOT NULL,
    "vendor_id" integer DEFAULT '0' NOT NULL,
    "image" character varying(255) DEFAULT '' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "vendor_menu_images_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "vendor_messages";
DROP SEQUENCE IF EXISTS vendor_messages_id_seq;
CREATE SEQUENCE vendor_messages_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."vendor_messages" (
    "id" bigint DEFAULT nextval('vendor_messages_id_seq') NOT NULL,
    "name" text,
    "email" text,
    "phone" text,
    "subject" text,
    "message" text,
    "vendor_id" bigint NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "user_id" character varying(255),
    CONSTRAINT "vendor_messages_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "vendor_service_timings";
DROP SEQUENCE IF EXISTS vendor_service_timings_id_seq;
CREATE SEQUENCE vendor_service_timings_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."vendor_service_timings" (
    "id" bigint DEFAULT nextval('vendor_service_timings_id_seq') NOT NULL,
    "service_id" integer DEFAULT '0' NOT NULL,
    "vendor" integer DEFAULT '0' NOT NULL,
    "sunday" integer DEFAULT '0' NOT NULL,
    "sun_from" character varying(255),
    "sun_to" character varying(255),
    "monday" integer DEFAULT '0' NOT NULL,
    "mon_from" character varying(255),
    "mon_to" character varying(255),
    "tuesday" integer DEFAULT '0' NOT NULL,
    "tues_from" character varying(255),
    "tues_to" character varying(255),
    "wednesday" integer DEFAULT '0' NOT NULL,
    "wed_from" character varying(255),
    "wed_to" character varying(255),
    "thursday" integer DEFAULT '0' NOT NULL,
    "thurs_from" character varying(255),
    "thurs_to" character varying(255),
    "friday" integer DEFAULT '0' NOT NULL,
    "fri_from" character varying(255),
    "fri_to" character varying(255),
    "saturday" integer DEFAULT '0' NOT NULL,
    "sat_from" character varying(255),
    "sat_to" character varying(255),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "vendor_service_timings_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "vendor_services";
DROP SEQUENCE IF EXISTS vendor_services_id_seq;
CREATE SEQUENCE vendor_services_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."vendor_services" (
    "id" bigint DEFAULT nextval('vendor_services_id_seq') NOT NULL,
    "vendor_id" bigint NOT NULL,
    "service_id" bigint NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "vendor_services_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "vendor_timings";
DROP SEQUENCE IF EXISTS vendor_timings_id_seq;
CREATE SEQUENCE vendor_timings_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."vendor_timings" (
    "id" bigint DEFAULT nextval('vendor_timings_id_seq') NOT NULL,
    "vendor_id" integer NOT NULL,
    "has_24_hour" integer DEFAULT '0' NOT NULL,
    "service_id" integer NOT NULL,
    "day" character varying(255) NOT NULL,
    "time_from" character varying(255),
    "time_to" character varying(255),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "vendor_timings_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "vendor_timings" ("id", "vendor_id", "has_24_hour", "service_id", "day", "time_from", "time_to", "created_at", "updated_at") VALUES
(10,	16,	0,	2,	'monday',	'12:00 AM',	'09:00 AM',	'2025-01-07 06:53:17',	'2025-01-07 06:53:17'),
(11,	16,	0,	2,	'tuesday',	'12:00 AM',	'09:00 PM',	'2025-01-07 06:53:17',	'2025-01-07 06:53:17'),
(12,	16,	0,	2,	'wednesday',	'12:00 AM',	'09:00 PM',	'2025-01-07 06:53:17',	'2025-01-07 06:53:17'),
(13,	16,	0,	2,	'thursday',	'12:00 AM',	'09:00 PM',	'2025-01-07 06:53:17',	'2025-01-07 06:53:17'),
(14,	16,	0,	2,	'friday',	'12:00 AM',	'02:00 PM',	'2025-01-07 06:53:17',	'2025-01-07 06:53:17'),
(15,	16,	0,	2,	'saturday',	'12:00 AM',	'11:00 PM',	'2025-01-07 06:53:17',	'2025-01-07 06:53:17'),
(16,	5,	1,	2,	'tuesday',	'00:00 AM',	'12:59 PM',	'2025-01-07 07:05:51',	'2025-01-07 07:05:51'),
(18,	18,	1,	2,	'sunday',	'00:00 AM',	'12:59 PM',	'2025-01-07 11:20:26',	'2025-01-07 11:20:26'),
(19,	18,	1,	2,	'monday',	'00:00 AM',	'12:59 PM',	'2025-01-07 11:20:26',	'2025-01-07 11:20:26'),
(20,	18,	1,	2,	'tuesday',	'00:00 AM',	'12:59 PM',	'2025-01-07 11:20:26',	'2025-01-07 11:20:26'),
(21,	18,	1,	2,	'wednesday',	'00:00 AM',	'12:59 PM',	'2025-01-07 11:20:26',	'2025-01-07 11:20:26'),
(22,	18,	1,	2,	'thursday',	'00:00 AM',	'12:59 PM',	'2025-01-07 11:20:26',	'2025-01-07 11:20:26'),
(23,	18,	1,	2,	'friday',	'00:00 AM',	'12:59 PM',	'2025-01-07 11:20:26',	'2025-01-07 11:20:26'),
(24,	18,	1,	2,	'saturday',	'00:00 AM',	'12:59 PM',	'2025-01-07 11:20:26',	'2025-01-07 11:20:26'),
(25,	4,	1,	2,	'monday',	'00:00 AM',	'12:59 PM',	'2025-01-07 23:29:50',	'2025-01-07 23:29:50'),
(26,	4,	1,	2,	'tuesday',	'00:00 AM',	'12:59 PM',	'2025-01-07 23:29:50',	'2025-01-07 23:29:50'),
(27,	17,	1,	2,	'tuesday',	'00:00 AM',	'12:59 PM',	'2025-01-08 09:07:18',	'2025-01-08 09:07:18'),
(28,	17,	1,	2,	'wednesday',	'00:00 AM',	'12:59 PM',	'2025-01-08 09:07:18',	'2025-01-08 09:07:18'),
(29,	17,	1,	2,	'thursday',	'00:00 AM',	'12:59 PM',	'2025-01-08 09:07:18',	'2025-01-08 09:07:18'),
(30,	17,	1,	2,	'friday',	'00:00 AM',	'12:59 PM',	'2025-01-08 09:07:18',	'2025-01-08 09:07:18'),
(31,	17,	1,	2,	'saturday',	'00:00 AM',	'12:59 PM',	'2025-01-08 09:07:18',	'2025-01-08 09:07:18');

DROP TABLE IF EXISTS "wallet_histories";
DROP SEQUENCE IF EXISTS wallet_histories_id_seq;
CREATE SEQUENCE wallet_histories_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."wallet_histories" (
    "id" bigint DEFAULT nextval('wallet_histories_id_seq') NOT NULL,
    "user_id" bigint NOT NULL,
    "wallet_amount" double precision DEFAULT '0' NOT NULL,
    "pay_type" character varying(255) NOT NULL,
    "description" character varying(255),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "pay_method" integer DEFAULT '0' NOT NULL,
    CONSTRAINT "wallet_histories_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "wallet_histories" ("id", "user_id", "wallet_amount", "pay_type", "description", "created_at", "updated_at", "pay_method") VALUES
(1,	13,	1000,	'credited',	'Wallet Top up (via App)',	'2025-01-10 13:12:00',	'2025-01-10 13:12:00',	2),
(2,	13,	1000,	'credited',	'Wallet Top up (via App)',	'2025-01-10 13:16:00',	'2025-01-10 13:16:00',	2),
(3,	13,	10,	'credited',	'Wallet Top up (via App)',	'2025-01-10 17:21:00',	'2025-01-10 17:21:00',	2),
(4,	33,	100,	'credited',	'Wallet Top up (via App)',	'2025-01-10 22:34:00',	'2025-01-10 22:34:00',	2),
(5,	15,	100,	'credited',	'Wallet Top up (via App)',	'2025-01-11 10:05:00',	'2025-01-11 10:05:00',	2);

DROP TABLE IF EXISTS "wallet_payment_report";
DROP SEQUENCE IF EXISTS wallet_payment_report_id_seq;
CREATE SEQUENCE wallet_payment_report_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."wallet_payment_report" (
    "id" bigint DEFAULT nextval('wallet_payment_report_id_seq') NOT NULL,
    "transaction_id" character varying(255),
    "payment_status" character varying(255),
    "user_id" integer DEFAULT '0' NOT NULL,
    "ref_id" character varying(255),
    "amount" numeric(8,2) NOT NULL,
    "method_type" integer DEFAULT '1' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "wallet_payment_report_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "wallet_payment_report" ("id", "transaction_id", "payment_status", "user_id", "ref_id", "amount", "method_type", "created_at", "updated_at") VALUES
(1,	'1367811b5d9e7a91736514397',	'A',	13,	'pi_3Qfhv7JGFNSKSXql0Rq256po',	1000.00,	2,	'2025-01-10 13:06:37',	'2025-01-10 13:12:21'),
(2,	'1367811d7540d011736514933',	'A',	13,	'pi_3Qfi3lJGFNSKSXql1j0MQltS',	1000.00,	2,	'2025-01-10 13:15:33',	'2025-01-10 13:16:32'),
(3,	'13678156f532b581736529653',	'A',	13,	'pi_3QfltBJGFNSKSXql0sVWFwV8',	10.00,	2,	'2025-01-10 17:20:53',	'2025-01-10 17:21:34'),
(4,	'336781a07ac9d921736548474',	'A',	33,	'pi_3QfqmkJGFNSKSXql1MHIW3sx',	100.00,	2,	'2025-01-10 22:34:34',	'2025-01-10 22:34:57'),
(5,	'156782424f241f81736589903',	'A',	15,	'pi_3Qg1YwJGFNSKSXql0f6U5XXm',	100.00,	2,	'2025-01-11 10:05:03',	'2025-01-11 10:05:21');

DROP TABLE IF EXISTS "web_banners";
DROP SEQUENCE IF EXISTS web_banners_id_seq;
CREATE SEQUENCE web_banners_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."web_banners" (
    "id" bigint DEFAULT nextval('web_banners_id_seq') NOT NULL,
    "name" character varying(255),
    "description" text,
    "banner_image" character varying(600),
    "button_link" character varying(255),
    "active" integer DEFAULT '1',
    "deleted" integer DEFAULT '0',
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "web_banners_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "web_banners" ("id", "name", "description", "banner_image", "button_link", "active", "deleted", "created_at", "updated_at") VALUES
(1,	'Handmade with Heart, <br> Delivered with Care.',	'<p>Crafting Connections, One Handmade <br />Treasure at a Time.</p>',	'1736413528051504500003.jpg',	'https://dxbitprojects.com/handwi/public/',	1,	0,	'2025-01-09 09:05:28',	'2025-01-09 09:05:28'),
(2,	'Delivered with Care',	'<p>Crafting Connections, One Handmade <br />Treasure at a Time.</p>',	'1736413579051504500003.jpg',	'https://dxbitprojects.com/handwi/public/',	1,	0,	'2025-01-09 09:06:19',	'2025-01-09 09:06:19');

DROP TABLE IF EXISTS "websockets_statistics_entries";
DROP SEQUENCE IF EXISTS websockets_statistics_entries_id_seq;
CREATE SEQUENCE websockets_statistics_entries_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."websockets_statistics_entries" (
    "id" integer DEFAULT nextval('websockets_statistics_entries_id_seq') NOT NULL,
    "app_id" character varying(255) NOT NULL,
    "peak_connection_count" integer NOT NULL,
    "websocket_message_count" integer NOT NULL,
    "api_message_count" integer NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "websockets_statistics_entries_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "wishlists";
DROP SEQUENCE IF EXISTS wishlists_id_seq;
CREATE SEQUENCE wishlists_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."wishlists" (
    "id" bigint DEFAULT nextval('wishlists_id_seq') NOT NULL,
    "user_id" bigint NOT NULL,
    "product_id" bigint NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "wishlists_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


ALTER TABLE ONLY "public"."bank_details" ADD CONSTRAINT "bank_details_user_id_foreign" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."comment_likes" ADD CONSTRAINT "comment_likes_comment_id_foreign" FOREIGN KEY (comment_id) REFERENCES post_comments(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."comment_likes" ADD CONSTRAINT "comment_likes_user_id_foreign" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."comment_taged_users" ADD CONSTRAINT "comment_taged_users_comment_id_foreign" FOREIGN KEY (comment_id) REFERENCES post_comments(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."comment_taged_users" ADD CONSTRAINT "comment_taged_users_user_id_foreign" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."designations" ADD CONSTRAINT "designations_user_id_foreign" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."help_topics" ADD CONSTRAINT "help_topics_user_id_foreign" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."order_products" ADD CONSTRAINT "order_products_product_id_foreign" FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."orders" ADD CONSTRAINT "orders_user_id_foreign" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."post_comments" ADD CONSTRAINT "post_comments_post_id_foreign" FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."post_comments" ADD CONSTRAINT "post_comments_user_id_foreign" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."post_saves" ADD CONSTRAINT "post_saves_post_id_foreign" FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."post_saves" ADD CONSTRAINT "post_saves_user_id_foreign" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."post_users" ADD CONSTRAINT "post_users_post_id_foreign" FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."post_users" ADD CONSTRAINT "post_users_user_id_foreign" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."product_docs" ADD CONSTRAINT "product_docs_product_id_foreign" FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."product_images" ADD CONSTRAINT "product_images_product_id_foreign" FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."product_items" ADD CONSTRAINT "product_items_product_id_foreign" FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."product_selected_attributes" ADD CONSTRAINT "product_selected_attributes_product_id_foreign" FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."product_specifications" ADD CONSTRAINT "product_specifications_product_id_foreign" FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."product_variations" ADD CONSTRAINT "product_variations_product_id_foreign" FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."service" ADD CONSTRAINT "service_service_user_id_foreign" FOREIGN KEY (service_user_id) REFERENCES users(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."service_images" ADD CONSTRAINT "service_images_service_id_foreign" FOREIGN KEY (service_id) REFERENCES service(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."store_managers_types" ADD CONSTRAINT "store_managers_types_vendor_id_foreign" FOREIGN KEY (vendor_id) REFERENCES users(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."temp_order_products" ADD CONSTRAINT "temp_order_products_product_id_foreign" FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."temp_orders" ADD CONSTRAINT "temp_orders_user_id_foreign" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."user_address" ADD CONSTRAINT "user_address_user_id_foreign" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."user_follows" ADD CONSTRAINT "user_follows_follow_user_id_foreign" FOREIGN KEY (follow_user_id) REFERENCES users(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."user_follows" ADD CONSTRAINT "user_follows_user_id_foreign" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."vendor_details" ADD CONSTRAINT "vendor_details_user_id_foreign" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."wallet_histories" ADD CONSTRAINT "wallet_histories_user_id_foreign" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE NOT DEFERRABLE;

-- 2025-04-03 12:00:33.418924+05
