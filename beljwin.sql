--
-- PostgreSQL database dump
--

-- Dumped from database version 12.19 (Ubuntu 12.19-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.7 (Ubuntu 15.7-1.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: addon_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addon_category (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(1500),
    banner_image character varying(1500),
    parent_id integer DEFAULT 0 NOT NULL,
    active integer DEFAULT 1 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    created_uid integer NOT NULL,
    updated_uid integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.addon_category OWNER TO postgres;

--
-- Name: addon_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.addon_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addon_category_id_seq OWNER TO postgres;

--
-- Name: addon_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.addon_category_id_seq OWNED BY public.addon_category.id;


--
-- Name: articles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articles (
    id bigint NOT NULL,
    title_en character varying(255),
    title_ar character varying(255),
    status integer DEFAULT 1 NOT NULL,
    desc_en text,
    desc_ar text,
    meta_title text,
    meta_keyword text,
    meta_description text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.articles OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_id_seq OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(1500),
    banner_image character varying(1500),
    parent_id integer DEFAULT 0 NOT NULL,
    active integer DEFAULT 1 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    created_uid integer NOT NULL,
    updated_uid integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    id bigint NOT NULL,
    name character varying(1500) NOT NULL,
    prefix character varying(20) NOT NULL,
    dial_code character varying(100) NOT NULL,
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted smallint DEFAULT '0'::smallint NOT NULL
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_id_seq OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;


--
-- Name: customer_user_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_user_details (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    date_of_birth date,
    lattitude character varying(255),
    longitude character varying(255),
    location_name character varying(255),
    gender character varying(255),
    is_social integer DEFAULT 0 NOT NULL,
    wallet_balance numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT customer_user_details_gender_check CHECK (((gender)::text = ANY ((ARRAY['male'::character varying, 'female'::character varying, 'other'::character varying])::text[])))
);


ALTER TABLE public.customer_user_details OWNER TO postgres;

--
-- Name: customer_user_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_user_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_user_details_id_seq OWNER TO postgres;

--
-- Name: customer_user_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_user_details_id_seq OWNED BY public.customer_user_details.id;


--
-- Name: facilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facilities (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.facilities OWNER TO postgres;

--
-- Name: facilities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facilities_id_seq OWNER TO postgres;

--
-- Name: facilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facilities_id_seq OWNED BY public.facilities.id;


--
-- Name: facility_facility_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facility_facility_item (
    id bigint NOT NULL,
    facility_groups_model_id bigint NOT NULL,
    facility_item_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.facility_facility_item OWNER TO postgres;

--
-- Name: facility_facility_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facility_facility_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facility_facility_item_id_seq OWNER TO postgres;

--
-- Name: facility_facility_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facility_facility_item_id_seq OWNED BY public.facility_facility_item.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: hear_about_us; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hear_about_us (
    id bigint NOT NULL,
    name character varying(1500) NOT NULL,
    active smallint DEFAULT '1'::smallint NOT NULL,
    deleted smallint DEFAULT '0'::smallint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.hear_about_us OWNER TO postgres;

--
-- Name: hear_about_us_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hear_about_us_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hear_about_us_id_seq OWNER TO postgres;

--
-- Name: hear_about_us_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hear_about_us_id_seq OWNED BY public.hear_about_us.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: package_media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.package_media (
    id bigint NOT NULL,
    filename character varying(255) NOT NULL,
    vendor_package_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.package_media OWNER TO postgres;

--
-- Name: package_media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.package_media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.package_media_id_seq OWNER TO postgres;

--
-- Name: package_media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.package_media_id_seq OWNED BY public.package_media.id;


--
-- Name: package_ord_addons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.package_ord_addons (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    addon_id bigint NOT NULL,
    remarks character varying(1500),
    price numeric(10,2) NOT NULL,
    qty integer DEFAULT 1 NOT NULL,
    discount numeric(10,2) NOT NULL
);


ALTER TABLE public.package_ord_addons OWNER TO postgres;

--
-- Name: package_ord_addons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.package_ord_addons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.package_ord_addons_id_seq OWNER TO postgres;

--
-- Name: package_ord_addons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.package_ord_addons_id_seq OWNED BY public.package_ord_addons.id;


--
-- Name: package_ord_prods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.package_ord_prods (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    remarks character varying(1500),
    price numeric(10,2) NOT NULL,
    qty integer DEFAULT 1 NOT NULL,
    discount numeric(10,2) NOT NULL
);


ALTER TABLE public.package_ord_prods OWNER TO postgres;

--
-- Name: package_ord_prods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.package_ord_prods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.package_ord_prods_id_seq OWNER TO postgres;

--
-- Name: package_ord_prods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.package_ord_prods_id_seq OWNED BY public.package_ord_prods.id;


--
-- Name: package_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.package_orders (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    package_id bigint NOT NULL,
    date date,
    start_time character varying(50) NOT NULL,
    end_time character varying(50) NOT NULL,
    guests_adults integer DEFAULT 0 NOT NULL,
    guests_children integer DEFAULT 0 NOT NULL,
    booking_for character varying(255) DEFAULT 'myself'::character varying NOT NULL,
    cstmr_title character varying(255) DEFAULT 'mr'::character varying NOT NULL,
    cstmr_first_name character varying(50),
    cstmr_last_name character varying(50),
    cstmr_email character varying(50),
    cstmr_dial_code character varying(50),
    cstmr_phone character varying(50),
    send_as_gift integer DEFAULT 0 NOT NULL,
    total numeric(10,2) NOT NULL,
    tax numeric(10,2) NOT NULL,
    discount numeric(10,2) NOT NULL,
    payment_method character varying(50) DEFAULT 'manual'::character varying NOT NULL,
    payment_id character varying(50),
    status character varying(50) DEFAULT 'pending'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    vendor_id bigint,
    order_number character varying(15),
    location character varying(255),
    lattitude character varying(255),
    longitude character varying(255),
    sub_total numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    grand_total_n_tax numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    grand_total_w_tax numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    hours numeric(10,2),
    hourly_rate numeric(10,2),
    CONSTRAINT package_orders_booking_for_check CHECK (((booking_for)::text = ANY ((ARRAY['myself'::character varying, 'other'::character varying])::text[]))),
    CONSTRAINT package_orders_cstmr_title_check CHECK (((cstmr_title)::text = ANY ((ARRAY['mr'::character varying, 'mrs'::character varying, 'miss'::character varying, 'ms'::character varying])::text[])))
);


ALTER TABLE public.package_orders OWNER TO postgres;

--
-- Name: package_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.package_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.package_orders_id_seq OWNER TO postgres;

--
-- Name: package_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.package_orders_id_seq OWNED BY public.package_orders.id;


--
-- Name: package_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.package_products (
    id bigint NOT NULL,
    package_id bigint NOT NULL,
    product_id bigint NOT NULL,
    included integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.package_products OWNER TO postgres;

--
-- Name: package_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.package_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.package_products_id_seq OWNER TO postgres;

--
-- Name: package_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.package_products_id_seq OWNED BY public.package_products.id;


--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: product_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(1500),
    active integer DEFAULT 1 NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    is_remarks integer DEFAULT 0 NOT NULL,
    remarks_title character varying(2000),
    user_id bigint NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.product_categories OWNER TO postgres;

--
-- Name: product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_categories_id_seq OWNER TO postgres;

--
-- Name: product_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_categories_id_seq OWNED BY public.product_categories.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(255),
    price numeric(8,2) NOT NULL,
    active integer DEFAULT 1 NOT NULL,
    user_id bigint NOT NULL,
    category_id bigint NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    id bigint NOT NULL,
    meta_key character varying(255) NOT NULL,
    meta_value character varying(255) NOT NULL
);


ALTER TABLE public.settings OWNER TO postgres;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO postgres;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: temp_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_users (
    id bigint NOT NULL,
    name character varying(255),
    email character varying(255),
    dial_code character varying(255),
    phone character varying(255) NOT NULL,
    user_type_id integer,
    user_phone_otp character varying(255),
    access_token character varying(255) NOT NULL,
    user_data json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.temp_users OWNER TO postgres;

--
-- Name: temp_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_users_id_seq OWNER TO postgres;

--
-- Name: temp_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_users_id_seq OWNED BY public.temp_users.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255),
    email character varying(255),
    dial_code character varying(255),
    phone character varying(255) NOT NULL,
    phone_verified integer DEFAULT 0 NOT NULL,
    password character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    role character varying(255),
    verified integer DEFAULT 0 NOT NULL,
    user_type_id integer,
    first_name character varying(255),
    last_name character varying(255),
    user_image character varying(255),
    user_phone_otp character varying(255),
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    active integer DEFAULT 1 NOT NULL,
    device_type character varying(255),
    fcm_token character varying(255),
    device_cart_id character varying(255),
    password_reset_code character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: vendor_addons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_addons (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    extra_info text,
    image character varying(255),
    price numeric(8,2) NOT NULL,
    user_id bigint NOT NULL,
    category_ids character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.vendor_addons OWNER TO postgres;

--
-- Name: vendor_addons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_addons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_addons_id_seq OWNER TO postgres;

--
-- Name: vendor_addons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_addons_id_seq OWNED BY public.vendor_addons.id;


--
-- Name: vendor_facility_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_facility_groups (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    user_id bigint
);


ALTER TABLE public.vendor_facility_groups OWNER TO postgres;

--
-- Name: vendor_facility_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_facility_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_facility_groups_id_seq OWNER TO postgres;

--
-- Name: vendor_facility_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_facility_groups_id_seq OWNED BY public.vendor_facility_groups.id;


--
-- Name: vendor_facility_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_facility_items (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    extra_info character varying(255),
    facility_group_id bigint NOT NULL,
    icon character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.vendor_facility_items OWNER TO postgres;

--
-- Name: vendor_facility_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_facility_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_facility_items_id_seq OWNER TO postgres;

--
-- Name: vendor_facility_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_facility_items_id_seq OWNED BY public.vendor_facility_items.id;


--
-- Name: vendor_package_addons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_package_addons (
    id bigint NOT NULL,
    vendor_package_id bigint NOT NULL,
    addon_id bigint NOT NULL
);


ALTER TABLE public.vendor_package_addons OWNER TO postgres;

--
-- Name: vendor_package_addons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_package_addons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_package_addons_id_seq OWNER TO postgres;

--
-- Name: vendor_package_addons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_package_addons_id_seq OWNED BY public.vendor_package_addons.id;


--
-- Name: vendor_package_attach_include; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_package_attach_include (
    id bigint NOT NULL,
    vendor_package_id bigint NOT NULL,
    include_id bigint NOT NULL
);


ALTER TABLE public.vendor_package_attach_include OWNER TO postgres;

--
-- Name: vendor_package_attach_include_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_package_attach_include_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_package_attach_include_id_seq OWNER TO postgres;

--
-- Name: vendor_package_attach_include_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_package_attach_include_id_seq OWNED BY public.vendor_package_attach_include.id;


--
-- Name: vendor_package_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_package_categories (
    id bigint NOT NULL,
    vendor_package_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.vendor_package_categories OWNER TO postgres;

--
-- Name: vendor_package_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_package_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_package_categories_id_seq OWNER TO postgres;

--
-- Name: vendor_package_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_package_categories_id_seq OWNED BY public.vendor_package_categories.id;


--
-- Name: vendor_package_facilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_package_facilities (
    id bigint NOT NULL,
    vendor_package_id bigint NOT NULL,
    facility_id bigint NOT NULL
);


ALTER TABLE public.vendor_package_facilities OWNER TO postgres;

--
-- Name: vendor_package_facilities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_package_facilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_package_facilities_id_seq OWNER TO postgres;

--
-- Name: vendor_package_facilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_package_facilities_id_seq OWNED BY public.vendor_package_facilities.id;


--
-- Name: vendor_package_includes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_package_includes (
    id bigint NOT NULL,
    name character varying(1500) NOT NULL,
    active smallint DEFAULT '1'::smallint NOT NULL,
    vendor_user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.vendor_package_includes OWNER TO postgres;

--
-- Name: vendor_package_includes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_package_includes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_package_includes_id_seq OWNER TO postgres;

--
-- Name: vendor_package_includes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_package_includes_id_seq OWNED BY public.vendor_package_includes.id;


--
-- Name: vendor_packages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_packages (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    name character varying(200) NOT NULL,
    price numeric(10,2) NOT NULL,
    what_includes text,
    package_details text,
    departure_info text,
    return_info text,
    additional_info text,
    cancellation_policy text,
    faq_info text,
    help_info text,
    location character varying(400),
    starting_point character varying(50),
    yatch_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    offer_price numeric(10,2),
    lattitude character varying(255),
    longitude character varying(255),
    active integer DEFAULT 1 NOT NULL,
    sub_title character varying(800)
);


ALTER TABLE public.vendor_packages OWNER TO postgres;

--
-- Name: vendor_packages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_packages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_packages_id_seq OWNER TO postgres;

--
-- Name: vendor_packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_packages_id_seq OWNED BY public.vendor_packages.id;


--
-- Name: vendor_user_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_user_details (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    username character varying(50),
    logo character varying(255),
    trade_license character varying(255),
    date_of_birth date,
    lattitude character varying(255),
    longitude character varying(255),
    location_name character varying(255),
    account_type character varying(255) DEFAULT 'company'::character varying NOT NULL,
    company_name character varying(255),
    family_name character varying(255),
    nationality character varying(255),
    hear_about_us_id bigint,
    gender character varying(255),
    is_represent integer DEFAULT 0 NOT NULL,
    rep_name character varying(255),
    rep_email character varying(255),
    rep_dial_code character varying(255),
    rep_phone character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT vendor_user_details_account_type_check CHECK (((account_type)::text = ANY ((ARRAY['individual'::character varying, 'company'::character varying])::text[]))),
    CONSTRAINT vendor_user_details_gender_check CHECK (((gender)::text = ANY ((ARRAY['male'::character varying, 'female'::character varying, 'other'::character varying])::text[])))
);


ALTER TABLE public.vendor_user_details OWNER TO postgres;

--
-- Name: vendor_user_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_user_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_user_details_id_seq OWNER TO postgres;

--
-- Name: vendor_user_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_user_details_id_seq OWNED BY public.vendor_user_details.id;


--
-- Name: yacht_attach_facilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yacht_attach_facilities (
    id bigint NOT NULL,
    yacht_id bigint NOT NULL,
    facility_id bigint NOT NULL
);


ALTER TABLE public.yacht_attach_facilities OWNER TO postgres;

--
-- Name: yacht_attach_facilities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.yacht_attach_facilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.yacht_attach_facilities_id_seq OWNER TO postgres;

--
-- Name: yacht_attach_facilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.yacht_attach_facilities_id_seq OWNED BY public.yacht_attach_facilities.id;


--
-- Name: yacht_offers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yacht_offers (
    id bigint NOT NULL,
    yacht_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    price numeric(10,2) NOT NULL,
    offer_price numeric(10,2) NOT NULL,
    image character varying(255) NOT NULL,
    status smallint DEFAULT '1'::smallint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.yacht_offers OWNER TO postgres;

--
-- Name: yacht_offers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.yacht_offers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.yacht_offers_id_seq OWNER TO postgres;

--
-- Name: yacht_offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.yacht_offers_id_seq OWNED BY public.yacht_offers.id;


--
-- Name: yacht_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yacht_orders (
    id bigint NOT NULL,
    order_number character varying(15) NOT NULL,
    user_id bigint NOT NULL,
    yatch_id bigint NOT NULL,
    location_name character varying(255) NOT NULL,
    lattitude character varying(255),
    longitude character varying(255),
    date date NOT NULL,
    start_time character varying(50) NOT NULL,
    end_time character varying(50) NOT NULL,
    guests_adults integer DEFAULT 0 NOT NULL,
    guests_children integer DEFAULT 0 NOT NULL,
    booking_for character varying(255) DEFAULT 'myself'::character varying NOT NULL,
    cstmr_title character varying(255) DEFAULT 'mr'::character varying NOT NULL,
    cstmr_first_name character varying(50),
    cstmr_last_name character varying(50),
    cstmr_email character varying(50),
    cstmr_dial_code character varying(50),
    cstmr_phone character varying(50),
    send_as_gift integer DEFAULT 0 NOT NULL,
    rates_type character varying(50) NOT NULL,
    rate numeric(10,2) NOT NULL,
    total numeric(10,2) NOT NULL,
    tax numeric(10,2) NOT NULL,
    discount numeric(10,2) NOT NULL,
    payment_method character varying(50) DEFAULT 'manual'::character varying NOT NULL,
    payment_id character varying(50),
    status character varying(50) DEFAULT 'pending'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    vendor_id bigint,
    CONSTRAINT yacht_orders_booking_for_check CHECK (((booking_for)::text = ANY ((ARRAY['myself'::character varying, 'other'::character varying])::text[]))),
    CONSTRAINT yacht_orders_cstmr_title_check CHECK (((cstmr_title)::text = ANY ((ARRAY['mr'::character varying, 'mrs'::character varying, 'miss'::character varying, 'ms'::character varying])::text[])))
);


ALTER TABLE public.yacht_orders OWNER TO postgres;

--
-- Name: yacht_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.yacht_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.yacht_orders_id_seq OWNER TO postgres;

--
-- Name: yacht_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.yacht_orders_id_seq OWNED BY public.yacht_orders.id;


--
-- Name: yacht_rates_schedules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yacht_rates_schedules (
    id bigint NOT NULL,
    yatch_id bigint NOT NULL,
    sun boolean DEFAULT false NOT NULL,
    sun_1 boolean DEFAULT false NOT NULL,
    sun_2 boolean DEFAULT false NOT NULL,
    sun_3 boolean DEFAULT false NOT NULL,
    sun_4 boolean DEFAULT false NOT NULL,
    sun_5 boolean DEFAULT false NOT NULL,
    sun_6 boolean DEFAULT false NOT NULL,
    sun_7 boolean DEFAULT false NOT NULL,
    sun_8 boolean DEFAULT false NOT NULL,
    sun_9 boolean DEFAULT false NOT NULL,
    sun_10 boolean DEFAULT false NOT NULL,
    sun_11 boolean DEFAULT false NOT NULL,
    sun_12 boolean DEFAULT false NOT NULL,
    sun_13 boolean DEFAULT false NOT NULL,
    sun_14 boolean DEFAULT false NOT NULL,
    sun_15 boolean DEFAULT false NOT NULL,
    sun_16 boolean DEFAULT false NOT NULL,
    sun_17 boolean DEFAULT false NOT NULL,
    sun_18 boolean DEFAULT false NOT NULL,
    sun_19 boolean DEFAULT false NOT NULL,
    sun_20 boolean DEFAULT false NOT NULL,
    sun_21 boolean DEFAULT false NOT NULL,
    sun_22 boolean DEFAULT false NOT NULL,
    sun_23 boolean DEFAULT false NOT NULL,
    sun_24 boolean DEFAULT false NOT NULL,
    mon boolean DEFAULT false NOT NULL,
    mon_1 boolean DEFAULT false NOT NULL,
    mon_2 boolean DEFAULT false NOT NULL,
    mon_3 boolean DEFAULT false NOT NULL,
    mon_4 boolean DEFAULT false NOT NULL,
    mon_5 boolean DEFAULT false NOT NULL,
    mon_6 boolean DEFAULT false NOT NULL,
    mon_7 boolean DEFAULT false NOT NULL,
    mon_8 boolean DEFAULT false NOT NULL,
    mon_9 boolean DEFAULT false NOT NULL,
    mon_10 boolean DEFAULT false NOT NULL,
    mon_11 boolean DEFAULT false NOT NULL,
    mon_12 boolean DEFAULT false NOT NULL,
    mon_13 boolean DEFAULT false NOT NULL,
    mon_14 boolean DEFAULT false NOT NULL,
    mon_15 boolean DEFAULT false NOT NULL,
    mon_16 boolean DEFAULT false NOT NULL,
    mon_17 boolean DEFAULT false NOT NULL,
    mon_18 boolean DEFAULT false NOT NULL,
    mon_19 boolean DEFAULT false NOT NULL,
    mon_20 boolean DEFAULT false NOT NULL,
    mon_21 boolean DEFAULT false NOT NULL,
    mon_22 boolean DEFAULT false NOT NULL,
    mon_23 boolean DEFAULT false NOT NULL,
    mon_24 boolean DEFAULT false NOT NULL,
    tue boolean DEFAULT false NOT NULL,
    tue_1 boolean DEFAULT false NOT NULL,
    tue_2 boolean DEFAULT false NOT NULL,
    tue_3 boolean DEFAULT false NOT NULL,
    tue_4 boolean DEFAULT false NOT NULL,
    tue_5 boolean DEFAULT false NOT NULL,
    tue_6 boolean DEFAULT false NOT NULL,
    tue_7 boolean DEFAULT false NOT NULL,
    tue_8 boolean DEFAULT false NOT NULL,
    tue_9 boolean DEFAULT false NOT NULL,
    tue_10 boolean DEFAULT false NOT NULL,
    tue_11 boolean DEFAULT false NOT NULL,
    tue_12 boolean DEFAULT false NOT NULL,
    tue_13 boolean DEFAULT false NOT NULL,
    tue_14 boolean DEFAULT false NOT NULL,
    tue_15 boolean DEFAULT false NOT NULL,
    tue_16 boolean DEFAULT false NOT NULL,
    tue_17 boolean DEFAULT false NOT NULL,
    tue_18 boolean DEFAULT false NOT NULL,
    tue_19 boolean DEFAULT false NOT NULL,
    tue_20 boolean DEFAULT false NOT NULL,
    tue_21 boolean DEFAULT false NOT NULL,
    tue_22 boolean DEFAULT false NOT NULL,
    tue_23 boolean DEFAULT false NOT NULL,
    tue_24 boolean DEFAULT false NOT NULL,
    wed boolean DEFAULT false NOT NULL,
    wed_1 boolean DEFAULT false NOT NULL,
    wed_2 boolean DEFAULT false NOT NULL,
    wed_3 boolean DEFAULT false NOT NULL,
    wed_4 boolean DEFAULT false NOT NULL,
    wed_5 boolean DEFAULT false NOT NULL,
    wed_6 boolean DEFAULT false NOT NULL,
    wed_7 boolean DEFAULT false NOT NULL,
    wed_8 boolean DEFAULT false NOT NULL,
    wed_9 boolean DEFAULT false NOT NULL,
    wed_10 boolean DEFAULT false NOT NULL,
    wed_11 boolean DEFAULT false NOT NULL,
    wed_12 boolean DEFAULT false NOT NULL,
    wed_13 boolean DEFAULT false NOT NULL,
    wed_14 boolean DEFAULT false NOT NULL,
    wed_15 boolean DEFAULT false NOT NULL,
    wed_16 boolean DEFAULT false NOT NULL,
    wed_17 boolean DEFAULT false NOT NULL,
    wed_18 boolean DEFAULT false NOT NULL,
    wed_19 boolean DEFAULT false NOT NULL,
    wed_20 boolean DEFAULT false NOT NULL,
    wed_21 boolean DEFAULT false NOT NULL,
    wed_22 boolean DEFAULT false NOT NULL,
    wed_23 boolean DEFAULT false NOT NULL,
    wed_24 boolean DEFAULT false NOT NULL,
    thu boolean DEFAULT false NOT NULL,
    thu_1 boolean DEFAULT false NOT NULL,
    thu_2 boolean DEFAULT false NOT NULL,
    thu_3 boolean DEFAULT false NOT NULL,
    thu_4 boolean DEFAULT false NOT NULL,
    thu_5 boolean DEFAULT false NOT NULL,
    thu_6 boolean DEFAULT false NOT NULL,
    thu_7 boolean DEFAULT false NOT NULL,
    thu_8 boolean DEFAULT false NOT NULL,
    thu_9 boolean DEFAULT false NOT NULL,
    thu_10 boolean DEFAULT false NOT NULL,
    thu_11 boolean DEFAULT false NOT NULL,
    thu_12 boolean DEFAULT false NOT NULL,
    thu_13 boolean DEFAULT false NOT NULL,
    thu_14 boolean DEFAULT false NOT NULL,
    thu_15 boolean DEFAULT false NOT NULL,
    thu_16 boolean DEFAULT false NOT NULL,
    thu_17 boolean DEFAULT false NOT NULL,
    thu_18 boolean DEFAULT false NOT NULL,
    thu_19 boolean DEFAULT false NOT NULL,
    thu_20 boolean DEFAULT false NOT NULL,
    thu_21 boolean DEFAULT false NOT NULL,
    thu_22 boolean DEFAULT false NOT NULL,
    thu_23 boolean DEFAULT false NOT NULL,
    thu_24 boolean DEFAULT false NOT NULL,
    fri boolean DEFAULT false NOT NULL,
    fri_1 boolean DEFAULT false NOT NULL,
    fri_2 boolean DEFAULT false NOT NULL,
    fri_3 boolean DEFAULT false NOT NULL,
    fri_4 boolean DEFAULT false NOT NULL,
    fri_5 boolean DEFAULT false NOT NULL,
    fri_6 boolean DEFAULT false NOT NULL,
    fri_7 boolean DEFAULT false NOT NULL,
    fri_8 boolean DEFAULT false NOT NULL,
    fri_9 boolean DEFAULT false NOT NULL,
    fri_10 boolean DEFAULT false NOT NULL,
    fri_11 boolean DEFAULT false NOT NULL,
    fri_12 boolean DEFAULT false NOT NULL,
    fri_13 boolean DEFAULT false NOT NULL,
    fri_14 boolean DEFAULT false NOT NULL,
    fri_15 boolean DEFAULT false NOT NULL,
    fri_16 boolean DEFAULT false NOT NULL,
    fri_17 boolean DEFAULT false NOT NULL,
    fri_18 boolean DEFAULT false NOT NULL,
    fri_19 boolean DEFAULT false NOT NULL,
    fri_20 boolean DEFAULT false NOT NULL,
    fri_21 boolean DEFAULT false NOT NULL,
    fri_22 boolean DEFAULT false NOT NULL,
    fri_23 boolean DEFAULT false NOT NULL,
    fri_24 boolean DEFAULT false NOT NULL,
    sat boolean DEFAULT false NOT NULL,
    sat_1 boolean DEFAULT false NOT NULL,
    sat_2 boolean DEFAULT false NOT NULL,
    sat_3 boolean DEFAULT false NOT NULL,
    sat_4 boolean DEFAULT false NOT NULL,
    sat_5 boolean DEFAULT false NOT NULL,
    sat_6 boolean DEFAULT false NOT NULL,
    sat_7 boolean DEFAULT false NOT NULL,
    sat_8 boolean DEFAULT false NOT NULL,
    sat_9 boolean DEFAULT false NOT NULL,
    sat_10 boolean DEFAULT false NOT NULL,
    sat_11 boolean DEFAULT false NOT NULL,
    sat_12 boolean DEFAULT false NOT NULL,
    sat_13 boolean DEFAULT false NOT NULL,
    sat_14 boolean DEFAULT false NOT NULL,
    sat_15 boolean DEFAULT false NOT NULL,
    sat_16 boolean DEFAULT false NOT NULL,
    sat_17 boolean DEFAULT false NOT NULL,
    sat_18 boolean DEFAULT false NOT NULL,
    sat_19 boolean DEFAULT false NOT NULL,
    sat_20 boolean DEFAULT false NOT NULL,
    sat_21 boolean DEFAULT false NOT NULL,
    sat_22 boolean DEFAULT false NOT NULL,
    sat_23 boolean DEFAULT false NOT NULL,
    sat_24 boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.yacht_rates_schedules OWNER TO postgres;

--
-- Name: yacht_rates_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.yacht_rates_schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.yacht_rates_schedules_id_seq OWNER TO postgres;

--
-- Name: yacht_rates_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.yacht_rates_schedules_id_seq OWNED BY public.yacht_rates_schedules.id;


--
-- Name: yacht_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yacht_types (
    id bigint NOT NULL,
    name character varying(1500) NOT NULL,
    active smallint DEFAULT '1'::smallint NOT NULL,
    deleted smallint DEFAULT '0'::smallint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.yacht_types OWNER TO postgres;

--
-- Name: yacht_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.yacht_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.yacht_types_id_seq OWNER TO postgres;

--
-- Name: yacht_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.yacht_types_id_seq OWNED BY public.yacht_types.id;


--
-- Name: yatch_photos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yatch_photos (
    id bigint NOT NULL,
    yatch_id bigint NOT NULL,
    filename character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.yatch_photos OWNER TO postgres;

--
-- Name: yatch_photos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.yatch_photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.yatch_photos_id_seq OWNER TO postgres;

--
-- Name: yatch_photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.yatch_photos_id_seq OWNED BY public.yatch_photos.id;


--
-- Name: yatch_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yatch_rates (
    id bigint NOT NULL,
    yatch_id bigint NOT NULL,
    type character varying(255),
    date date,
    mon_s character varying(255),
    mon_e character varying(255),
    mon_r numeric(10,2),
    aft_s character varying(255),
    aft_e character varying(255),
    aft_r numeric(10,2),
    eve_s character varying(255),
    eve_e character varying(255),
    eve_r numeric(10,2),
    data character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.yatch_rates OWNER TO postgres;

--
-- Name: yatch_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.yatch_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.yatch_rates_id_seq OWNER TO postgres;

--
-- Name: yatch_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.yatch_rates_id_seq OWNED BY public.yatch_rates.id;


--
-- Name: yatches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yatches (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    capacity character varying(255) NOT NULL,
    size character varying(255) NOT NULL,
    rules text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    location character varying(255),
    latitude character varying(255),
    longitude character varying(255),
    type character varying(255),
    document character varying(255),
    captain_name character varying(255),
    captain_dial_code character varying(255),
    captain_phone character varying(255),
    deleted_at timestamp(0) without time zone,
    active integer DEFAULT 1 NOT NULL,
    size_m2 character varying(255),
    size_ft2 character varying(255),
    year_refit character varying(255)
);


ALTER TABLE public.yatches OWNER TO postgres;

--
-- Name: yatches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.yatches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.yatches_id_seq OWNER TO postgres;

--
-- Name: yatches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.yatches_id_seq OWNED BY public.yatches.id;


--
-- Name: addon_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addon_category ALTER COLUMN id SET DEFAULT nextval('public.addon_category_id_seq'::regclass);


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- Name: customer_user_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_user_details ALTER COLUMN id SET DEFAULT nextval('public.customer_user_details_id_seq'::regclass);


--
-- Name: facilities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facilities ALTER COLUMN id SET DEFAULT nextval('public.facilities_id_seq'::regclass);


--
-- Name: facility_facility_item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_facility_item ALTER COLUMN id SET DEFAULT nextval('public.facility_facility_item_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: hear_about_us id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hear_about_us ALTER COLUMN id SET DEFAULT nextval('public.hear_about_us_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: package_media id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_media ALTER COLUMN id SET DEFAULT nextval('public.package_media_id_seq'::regclass);


--
-- Name: package_ord_addons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_ord_addons ALTER COLUMN id SET DEFAULT nextval('public.package_ord_addons_id_seq'::regclass);


--
-- Name: package_ord_prods id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_ord_prods ALTER COLUMN id SET DEFAULT nextval('public.package_ord_prods_id_seq'::regclass);


--
-- Name: package_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_orders ALTER COLUMN id SET DEFAULT nextval('public.package_orders_id_seq'::regclass);


--
-- Name: package_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_products ALTER COLUMN id SET DEFAULT nextval('public.package_products_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: product_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories ALTER COLUMN id SET DEFAULT nextval('public.product_categories_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: temp_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users ALTER COLUMN id SET DEFAULT nextval('public.temp_users_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: vendor_addons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_addons ALTER COLUMN id SET DEFAULT nextval('public.vendor_addons_id_seq'::regclass);


--
-- Name: vendor_facility_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_facility_groups ALTER COLUMN id SET DEFAULT nextval('public.vendor_facility_groups_id_seq'::regclass);


--
-- Name: vendor_facility_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_facility_items ALTER COLUMN id SET DEFAULT nextval('public.vendor_facility_items_id_seq'::regclass);


--
-- Name: vendor_package_addons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_package_addons ALTER COLUMN id SET DEFAULT nextval('public.vendor_package_addons_id_seq'::regclass);


--
-- Name: vendor_package_attach_include id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_package_attach_include ALTER COLUMN id SET DEFAULT nextval('public.vendor_package_attach_include_id_seq'::regclass);


--
-- Name: vendor_package_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_package_categories ALTER COLUMN id SET DEFAULT nextval('public.vendor_package_categories_id_seq'::regclass);


--
-- Name: vendor_package_facilities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_package_facilities ALTER COLUMN id SET DEFAULT nextval('public.vendor_package_facilities_id_seq'::regclass);


--
-- Name: vendor_package_includes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_package_includes ALTER COLUMN id SET DEFAULT nextval('public.vendor_package_includes_id_seq'::regclass);


--
-- Name: vendor_packages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_packages ALTER COLUMN id SET DEFAULT nextval('public.vendor_packages_id_seq'::regclass);


--
-- Name: vendor_user_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_user_details ALTER COLUMN id SET DEFAULT nextval('public.vendor_user_details_id_seq'::regclass);


--
-- Name: yacht_attach_facilities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yacht_attach_facilities ALTER COLUMN id SET DEFAULT nextval('public.yacht_attach_facilities_id_seq'::regclass);


--
-- Name: yacht_offers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yacht_offers ALTER COLUMN id SET DEFAULT nextval('public.yacht_offers_id_seq'::regclass);


--
-- Name: yacht_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yacht_orders ALTER COLUMN id SET DEFAULT nextval('public.yacht_orders_id_seq'::regclass);


--
-- Name: yacht_rates_schedules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yacht_rates_schedules ALTER COLUMN id SET DEFAULT nextval('public.yacht_rates_schedules_id_seq'::regclass);


--
-- Name: yacht_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yacht_types ALTER COLUMN id SET DEFAULT nextval('public.yacht_types_id_seq'::regclass);


--
-- Name: yatch_photos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yatch_photos ALTER COLUMN id SET DEFAULT nextval('public.yatch_photos_id_seq'::regclass);


--
-- Name: yatch_rates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yatch_rates ALTER COLUMN id SET DEFAULT nextval('public.yatch_rates_id_seq'::regclass);


--
-- Name: yatches id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yatches ALTER COLUMN id SET DEFAULT nextval('public.yatches_id_seq'::regclass);


--
-- Data for Name: addon_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addon_category (id, name, image, banner_image, parent_id, active, deleted, sort_order, created_uid, updated_uid, created_at, updated_at) FROM stdin;
4	Flowers	663f0a1819243_1715407384.jpeg	663f0a181fca0_1715407384.jpg	0	1	0	0	1	1	2024-05-11 06:03:04	2024-05-11 06:03:04
3	Birthday	663f362b8f11c_1715418667.jpg	663f362b9062a_1715418667.jpg	0	1	0	0	1	1	2024-04-18 02:48:07	2024-05-11 09:11:07
2	Cake	663f37b086340_1715419056.jpeg	663f36c19cba4_1715418817.jpg	3	1	0	0	1	1	2024-04-18 02:47:17	2024-05-11 09:17:36
1	fdfdf	\N	\N	0	0	1	0	1	1	2024-04-03 11:12:06	2024-05-12 14:36:01
5	Testing	66409ba2e4c0a_1715510178.jpg	\N	0	0	1	0	1	1	2024-05-12 10:36:18	2024-05-12 14:36:25
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles (id, title_en, title_ar, status, desc_en, desc_ar, meta_title, meta_keyword, meta_description, created_at, updated_at) FROM stdin;
1	About Us	\N	1	<p>About us text...</p>	\N	\N	\N	\N	2024-05-31 16:48:21	2024-05-31 16:48:21
2	Terms & Conditions	\N	1	<p>Terms &amp; Conditions text...</p>	\N	\N	\N	\N	2024-05-31 16:49:02	2024-05-31 16:49:02
3	Privacy Policy	\N	1	<p>Privacy Policy text..</p>	\N	\N	\N	\N	2024-05-31 16:49:28	2024-05-31 16:49:28
4	Cancellation Policy	\N	1	<p>Cancellation Policy</p>	\N	\N	\N	\N	2024-05-31 16:49:53	2024-05-31 16:49:53
5	Terms of Service	\N	1	<p>Terms of Service text...</p>	\N	\N	\N	\N	2024-05-31 16:51:39	2024-05-31 16:51:39
6	User Agreement	\N	1	<p>User Agreement text...</p>	\N	\N	\N	\N	2024-05-31 16:52:21	2024-05-31 16:52:21
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
beljwar_cache_settings	a:1:{s:3:"tax";s:1:"5";}	1717707242
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name, image, banner_image, parent_id, active, deleted, sort_order, created_uid, updated_uid, created_at, updated_at, deleted_at) FROM stdin;
3	Marriage	663f268235c59_1715414658.jpg	663f26823a1a7_1715414658.jpg	0	1	0	0	1	1	2024-05-11 08:04:18	2024-05-11 08:04:18	\N
1	Birthday	663f26f93b1a6_1715414777.jpg	663f26f93c641_1715414777.jpeg	0	1	0	0	1	1	2024-04-18 02:46:31	2024-05-11 08:06:17	\N
4	New Year Eve	663f2bd253ef2_1715416018.png	663f2bd255445_1715416018.png	0	1	0	0	1	1	2024-05-11 08:26:58	2024-05-11 08:26:58	\N
5	Valentine's Day	663f2c0cc6920_1715416076.jpeg	663f2c0ccbe1f_1715416076.jpeg	0	1	0	0	1	1	2024-05-11 08:27:56	2024-05-11 08:27:56	\N
2	Aniversary	663f2573bb826_1715414387.jpg	663f2573c0c99_1715414387.jpg	0	1	0	0	1	1	2024-05-11 07:59:47	2024-05-12 14:24:57	\N
6	Testing category	664099341d07e_1715509556.jpg	\N	0	0	1	0	1	1	2024-05-12 10:25:56	2024-05-12 14:32:38	2024-05-12 14:32:38
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, name, prefix, dial_code, active, created_at, updated_at, deleted) FROM stdin;
2	Aland Islands	AX	358	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
3	Albania	AL	355	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
4	Algeria	DZ	213	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
5	AmericanSamoa	AS	1684	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
6	Andorra	AD	376	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
7	Angola	AO	244	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
8	Anguilla	AI	1264	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
9	Antarctica	AQ	672	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
10	Antigua and Barbuda	AG	1268	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
11	Argentina	AR	54	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
12	Armenia	AM	374	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
13	Aruba	AW	297	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
14	Australia	AU	61	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
15	Austria	AT	43	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
16	Azerbaijan	AZ	994	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
17	Bahamas	BS	1242	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
18	Bahrain	BH	973	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
19	Bangladesh	BD	880	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
20	Barbados	BB	1246	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
21	Belarus	BY	375	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
22	Belgium	BE	32	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
23	Belize	BZ	501	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
24	Benin	BJ	229	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
25	Bermuda	BM	1441	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
26	Bhutan	BT	975	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
27	Bolivia, Plurinational State of	BO	591	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
28	Bosnia and Herzegovina	BA	387	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
29	Botswana	BW	267	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
30	Brazil	BR	55	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
31	British Indian Ocean Territory	IO	246	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
32	Brunei Darussalam	BN	673	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
33	Bulgaria	BG	359	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
34	Burkina Faso	BF	226	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
35	Burundi	BI	257	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
36	Cambodia	KH	855	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
37	Cameroon	CM	237	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
38	Canada	CA	1	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
39	Cape Verde	CV	238	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
40	Cayman Islands	KY	 345	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
41	Central African Republic	CF	236	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
42	Chad	TD	235	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
43	Chile	CL	56	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
44	China	CN	86	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
45	Christmas Island	CX	61	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
46	Cocos (Keeling) Islands	CC	61	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
47	Colombia	CO	57	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
48	Comoros	KM	269	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
49	Congo	CG	242	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
50	Congo, The Democratic Republic of the Congo	CD	243	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
51	Cook Islands	CK	682	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
52	Costa Rica	CR	506	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
53	Cote d'Ivoire	CI	225	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
54	Croatia	HR	385	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
55	Cuba	CU	53	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
56	Cyprus	CY	357	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
57	Czech Republic	CZ	420	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
58	Denmark	DK	45	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
59	Djibouti	DJ	253	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
60	Dominica	DM	1767	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
61	Dominican Republic	DO	1849	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
62	Ecuador	EC	593	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
63	Egypt	EG	20	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
64	El Salvador	SV	503	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
65	Equatorial Guinea	GQ	240	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
66	Eritrea	ER	291	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
67	Estonia	EE	372	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
68	Ethiopia	ET	251	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
69	Falkland Islands (Malvinas)	FK	500	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
70	Faroe Islands	FO	298	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
71	Fiji	FJ	679	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
72	Finland	FI	358	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
73	France	FR	33	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
74	French Guiana	GF	594	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
75	French Polynesia	PF	689	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
76	Gabon	GA	241	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
77	Gambia	GM	220	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
78	Georgia	GE	995	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
79	Germany	DE	49	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
80	Ghana	GH	233	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
81	Gibraltar	GI	350	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
82	Greece	GR	30	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
83	Greenland	GL	299	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
84	Grenada	GD	1473	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
85	Guadeloupe	GP	590	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
86	Guam	GU	1671	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
87	Guatemala	GT	502	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
88	Guernsey	GG	44	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
89	Guinea	GN	224	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
90	Guinea-Bissau	GW	245	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
91	Guyana	GY	595	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
92	Haiti	HT	509	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
93	Holy See (Vatican City State)	VA	379	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
94	Honduras	HN	504	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
95	Hong Kong	HK	852	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
96	Hungary	HU	36	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
97	Iceland	IS	354	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
98	India	IN	91	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
99	Indonesia	ID	62	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
100	Iran, Islamic Republic of Persian Gulf	IR	98	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
101	Iraq	IQ	964	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
102	Ireland	IE	353	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
103	Isle of Man	IM	44	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
104	Israel	IL	972	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
105	Italy	IT	39	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
106	Jamaica	JM	1876	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
107	Japan	JP	81	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
108	Jersey	JE	44	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
109	Jordan	JO	962	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
110	Kazakhstan	KZ	77	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
111	Kenya	KE	254	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
112	Kiribati	KI	686	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
113	Korea, Democratic People's Republic of Korea	KP	850	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
114	Korea, Republic of South Korea	KR	82	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
115	Kuwait	KW	965	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
116	Kyrgyzstan	KG	996	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
117	Laos	LA	856	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
118	Latvia	LV	371	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
119	Lebanon	LB	961	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
120	Lesotho	LS	266	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
121	Liberia	LR	231	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
122	Libyan Arab Jamahiriya	LY	218	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
123	Liechtenstein	LI	423	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
124	Lithuania	LT	370	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
125	Luxembourg	LU	352	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
126	Macao	MO	853	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
127	Macedonia	MK	389	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
128	Madagascar	MG	261	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
129	Malawi	MW	265	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
130	Malaysia	MY	60	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
131	Maldives	MV	960	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
132	Mali	ML	223	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
133	Malta	MT	356	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
134	Marshall Islands	MH	692	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
135	Martinique	MQ	596	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
136	Mauritania	MR	222	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
137	Mauritius	MU	230	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
138	Mayotte	YT	262	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
139	Mexico	MX	52	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
140	Micronesia, Federated States of Micronesia	FM	691	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
141	Moldova	MD	373	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
142	Monaco	MC	377	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
143	Mongolia	MN	976	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
144	Montenegro	ME	382	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
145	Montserrat	MS	1664	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
146	Morocco	MA	212	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
147	Mozambique	MZ	258	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
148	Myanmar	MM	95	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
149	Namibia	NA	264	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
150	Nauru	NR	674	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
151	Nepal	NP	977	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
152	Netherlands	NL	31	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
153	Netherlands Antilles	AN	599	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
154	New Caledonia	NC	687	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
155	New Zealand	NZ	64	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
156	Nicaragua	NI	505	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
157	Niger	NE	227	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
158	Nigeria	NG	234	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
159	Niue	NU	683	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
160	Norfolk Island	NF	672	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
161	Northern Mariana Islands	MP	1670	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
162	Norway	NO	47	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
163	Oman	OM	968	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
164	Pakistan	PK	92	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
165	Palau	PW	680	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
166	Palestinian Territory, Occupied	PS	970	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
167	Panama	PA	507	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
168	Papua New Guinea	PG	675	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
169	Paraguay	PY	595	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
170	Peru	PE	51	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
171	Philippines	PH	63	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
172	Pitcairn	PN	872	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
173	Poland	PL	48	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
174	Portugal	PT	351	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
175	Puerto Rico	PR	1939	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
176	Qatar	QA	974	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
177	Romania	RO	40	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
178	Russia	RU	7	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
179	Rwanda	RW	250	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
180	Reunion	RE	262	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
181	Saint Barthelemy	BL	590	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
182	Saint Helena, Ascension and Tristan Da Cunha	SH	290	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
183	Saint Kitts and Nevis	KN	1869	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
184	Saint Lucia	LC	1758	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
185	Saint Martin	MF	590	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
186	Saint Pierre and Miquelon	PM	508	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
187	Saint Vincent and the Grenadines	VC	1784	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
188	Samoa	WS	685	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
189	San Marino	SM	378	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
190	Sao Tome and Principe	ST	239	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
191	Saudi Arabia	SA	966	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
192	Senegal	SN	221	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
193	Serbia	RS	381	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
194	Seychelles	SC	248	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
195	Sierra Leone	SL	232	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
196	Singapore	SG	65	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
197	Slovakia	SK	421	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
198	Slovenia	SI	386	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
199	Solomon Islands	SB	677	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
200	Somalia	SO	252	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
201	South Africa	ZA	27	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
202	South Sudan	SS	211	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
203	South Georgia and the South Sandwich Islands	GS	500	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
204	Spain	ES	34	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
205	Sri Lanka	LK	94	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
206	Sudan	SD	249	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
207	Suriname	SR	597	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
208	Svalbard and Jan Mayen	SJ	47	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
209	Swaziland	SZ	268	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
210	Sweden	SE	46	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
211	Switzerland	CH	41	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
212	Syrian Arab Republic	SY	963	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
213	Taiwan	TW	886	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
214	Tajikistan	TJ	992	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
215	Tanzania, United Republic of Tanzania	TZ	255	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
216	Thailand	TH	66	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
217	Timor-Leste	TL	670	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
218	Togo	TG	228	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
219	Tokelau	TK	690	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
220	Tonga	TO	676	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
221	Trinidad and Tobago	TT	1868	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
222	Tunisia	TN	216	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
223	Turkey	TR	90	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
224	Turkmenistan	TM	993	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
225	Turks and Caicos Islands	TC	1649	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
226	Tuvalu	TV	688	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
227	Uganda	UG	256	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
228	Ukraine	UA	380	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
229	United Arab Emirates	AE	971	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
230	United Kingdom	GB	44	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
231	United States	US	1	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
232	Uruguay	UY	598	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
233	Uzbekistan	UZ	998	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
234	Vanuatu	VU	678	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
235	Venezuela, Bolivarian Republic of Venezuela	VE	58	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
236	Vietnam	VN	84	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
237	Virgin Islands, British	VG	1284	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
238	Virgin Islands, U.S.	VI	1340	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
239	Wallis and Futuna	WF	681	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
240	Yemen	YE	967	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
241	Zambia	ZM	260	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
242	Zimbabwe	ZW	263	1	2024-03-25 08:59:26	2024-03-25 08:59:26	0
1	Afghanistan	AF	93	1	2024-03-25 08:59:26	2024-05-12 10:24:13	0
\.


--
-- Data for Name: customer_user_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_user_details (id, user_id, date_of_birth, lattitude, longitude, location_name, gender, is_social, wallet_balance, created_at, updated_at) FROM stdin;
1	5	2024-04-10	234235	34365645	Al Safa St Downtown Dubai - Dubai United Arab Emirates	male	1	300.00	2024-04-18 02:32:54	2024-04-18 13:32:15
2	6	1980-04-24	234235	34365645	Al Safa St Downtown Dubai - Dubai United Arab Emirates	male	0	0.00	2024-04-20 16:21:34	2024-04-20 16:21:34
3	9	1994-05-18	25.2566932	55.36431779999999	Dubai International Airport (DXB) - Dubai - United Arab Emirates	male	0	0.00	2024-05-12 12:22:36	2024-05-12 12:22:36
4	10	1992-05-13	25.2566932	55.36431779999999	Dubai International Airport (DXB) - Dubai - United Arab Emirates	female	1	0.00	2024-05-12 12:30:44	2024-05-12 12:31:13
5	13	1993-05-11	25.2566932	55.36431779999999	Dubai International Airport (DXB) - Dubai - United Arab Emirates	male	0	0.00	2024-05-13 10:17:55	2024-05-13 10:17:55
6	16	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-14 10:25:42	2024-05-14 10:25:42
7	18	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-14 13:30:29	2024-05-14 13:30:29
8	19	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-14 15:40:25	2024-05-14 15:40:25
9	20	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-14 17:14:46	2024-05-14 17:14:46
10	21	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-14 21:46:39	2024-05-14 21:46:39
11	22	1995-10-07	34.3790386	73.4766761kotlin.Unit	9FGG+WQ, Muzaffarabad,	male	0	0.00	2024-05-14 23:37:56	2024-05-14 23:37:56
12	23	1995-10-07	34.3790428	73.4767068kotlin.Unit	9FGG+WQ, Muzaffarabad,	male	0	0.00	2024-05-14 23:44:05	2024-05-14 23:44:05
15	26	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-17 09:14:09	2024-05-17 09:14:09
16	27	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-17 10:12:42	2024-05-17 10:12:42
17	28	1997-08-25	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-25 17:58:36	2024-05-25 17:58:36
19	30	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-27 10:52:13	2024-05-27 10:52:13
20	31	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-27 16:58:58	2024-05-27 16:58:58
21	32	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-27 20:21:09	2024-05-27 20:21:09
25	37	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-28 12:02:43	2024-05-28 12:02:43
27	39	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-29 14:12:23	2024-05-29 14:12:23
28	40	1997-08-29	28.422357324216193	70.31694492717412	Shahi Road, Shahi Road, Rahimyar Khan, Punjab, Pakistan	male	0	0.00	2024-05-29 15:43:11	2024-05-29 15:43:11
32	44	1999-06-30	22.503313473408067	88.36604654788971	Prince Anwar Shah Road, Prince Anwar Shah Road, Kolkata, WB, 700068, India	male	0	0.00	2024-05-31 15:52:18	2024-05-31 15:52:18
\.


--
-- Data for Name: facilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facilities (id, name, icon, status, created_at, updated_at) FROM stdin;
4	Free Wifi	66379c2a4117f_1714920490.png	1	2024-05-05 18:48:10	2024-05-05 18:48:10
3	Swimming Pool	66379c5c5b882_1714920540.png	1	2024-04-09 05:28:34	2024-05-05 18:49:00
5	Barbeque	66379c76c90e8_1714920566.png	1	2024-05-05 18:49:26	2024-05-05 18:50:28
6	Kitchen	66379cdcd9b18_1714920668.png	1	2024-05-05 18:51:08	2024-05-05 18:51:08
7	Sound System	6637a1ee6a7ef_1714921966.png	1	2024-05-05 19:12:46	2024-05-05 19:12:46
8	Diving Equipment	6637a209a567c_1714921993.png	1	2024-05-05 19:13:13	2024-05-05 19:13:13
9	Fishing Equipment	6637a2251ecb4_1714922021.png	1	2024-05-05 19:13:41	2024-05-05 19:13:41
\.


--
-- Data for Name: facility_facility_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facility_facility_item (id, facility_groups_model_id, facility_item_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: hear_about_us; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hear_about_us (id, name, active, deleted, created_at, updated_at) FROM stdin;
1	Google	1	0	\N	\N
2	Facebook	1	0	\N	\N
3	Twitter	1	0	\N	\N
4	Instagram	1	0	\N	\N
5	Friend	1	0	\N	\N
6	Family	1	0	\N	\N
7	Colleague	1	0	\N	\N
8	TV	1	0	\N	\N
9	Radio	1	0	\N	\N
10	Newspaper	1	0	\N	\N
11	Magazine	1	0	\N	\N
12	Billboard	1	0	\N	\N
13	Conference	1	0	\N	\N
14	Workshop	1	0	\N	\N
15	Trade Show	1	0	\N	\N
16	Exhibition	1	0	\N	\N
17	Website	1	0	\N	\N
18	Newsletter	1	0	\N	\N
19	Email Campaign	1	0	\N	\N
20	Other	1	0	\N	2024-05-12 10:24:37
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2024_03_21_122103_add_indexes_to_tables	2
5	2024_03_22_111410_create_country_models_table	2
6	2024_03_22_111510_add_deleted_to_country_table	2
7	2024_03_22_190801_add_category_table	2
8	2024_03_25_094517_add_vendor_user	3
9	2024_03_25_100752_add_admin_addon_category_table	4
10	2024_03_25_112920_add_facility_group_table	4
11	2024_03_25_113022_add_vendor_facility_items_table	4
12	2024_03_25_144114_create_facility_facility_item_table_relation	4
13	2024_03_25_151256_add_user_id_to_vendor_facility_groups_table	4
14	2024_03_25_180220_add_yatch_table	5
15	2024_03_25_180333_add_yatch_photos_table	5
16	2024_03_26_095206_add_vendor_addon_table	5
17	2024_03_26_124500_add_vendor_package_table	6
18	2024_04_03_074246_create_hear_about_us_models_table	7
19	2024_04_03_174246_add_vendor_details_table	7
20	add_active_column_to_user_table	7
21	2024_04_05_101824_add_facility_table	8
22	2024_04_05_163410_alter_vendor_package_table	8
23	2024_04_05_163490_add_package_media_table	8
24	2024_04_06_074351_modify_yatch_table	8
25	2024_04_06_085243_add_facility_to_yatch_table	8
26	2024_04_06_085717_add_soft_delete_to_yatch_table	8
27	2024_04_06_091915_add_softe_delete_to_addons_table	8
28	2024_04_06_092730_add_soft_delete_to_package_table	8
29	2024_04_06_094302_add_soft_delete_to__category_table	8
30	2024_04_06_154859_add_yacht_type_table	8
31	2024_04_08_160714_add_customer_user_details_table	9
32	2024_04_13_085831_add_yacht_rates_schedule_table	10
33	2024_04_13_123026_add_yacht_rates_table	10
34	2024_04_17_083644_add_product_category_table	11
35	2024_04_17_142042_add_products_table	11
36	2024_04_17_155204_add_package_products_table	11
37	2024_04_17_193947_add_offer_price_package_table	11
38	2024_04_17_204217_add_package_booking_all_orders_table	12
39	2024_04_19_162544_add_yacht_booking_all_orders_table	13
40	2024_04_19_223953_modify_orders_table	13
41	2024_04_22_115813_modify_all_tables_location_columns	14
42	2024_05_07_044714_edit_yacht_rate_table	15
43	2024_05_08_005204_add_yacht_offer_table	16
44	2024_05_10_050853_create_personal_access_tokens_table	17
45	2024_05_10_082057_add_categories_facilities_addons_table_for_vendor	17
46	2024_05_12_155130_modify_yatch_table	18
47	2024_05_12_180136_modify_package_table_to_add_active_field	18
48	2024_05_13_105800_modify_yacht_table	19
49	2024_05_13_114624_add_fields_to_total_package_booking_table	20
50	2024_05_13_114630_add_article_table	21
51	2024_05_13_114640_create_settings	21
52	2024_05_14_120635_add_temp_user_table	22
53	2024_05_14_205220_add_vendor_package_includes_table	23
54	2024_05_14_221808_add_vendor_package_attach_includes_table	24
55	2024_05_14_223904_modify_package_table	25
56	2024_05_14_230206_add_fields_to_package_booking_table	25
57	2024_05_20_120938_add_fields_user_table	26
58	2024_05_27_133206_modify_yatches_table	27
59	2024_05_27_133211_add_vendor_package_attach_includes_table	28
\.


--
-- Data for Name: package_media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.package_media (id, filename, vendor_package_id, created_at, updated_at) FROM stdin;
3	66361f2e55c5b_1714822958.png	1	2024-05-04 15:42:38	2024-05-04 15:42:38
4	66361f2e5bea4_1714822958.jpg	1	2024-05-04 15:42:38	2024-05-04 15:42:38
5	66361f2e5c831_1714822958.png	1	2024-05-04 15:42:38	2024-05-04 15:42:38
6	66361f2e5d219_1714822958.jpg	1	2024-05-04 15:42:38	2024-05-04 15:42:38
7	6641bce247c24_1715584226.jpg	2	2024-05-13 11:10:26	2024-05-13 11:10:26
8	6641bce248f69_1715584226.jpeg	2	2024-05-13 11:10:26	2024-05-13 11:10:26
9	6641bce249065_1715584226.jpg	2	2024-05-13 11:10:26	2024-05-13 11:10:26
10	6641bce249187_1715584226.mp4	2	2024-05-13 11:10:26	2024-05-13 11:10:26
11	66434091c4131_1715683473.jpg	3	2024-05-14 14:44:33	2024-05-14 14:44:33
12	66434091cb4a6_1715683473.jpg	3	2024-05-14 14:44:33	2024-05-14 14:44:33
13	66434091cb58f_1715683473.jpg	3	2024-05-14 14:44:33	2024-05-14 14:44:33
14	66434091cb725_1715683473.jpg	3	2024-05-14 14:44:33	2024-05-14 14:44:33
15	66434091cc2ad_1715683473.jpg	3	2024-05-14 14:44:33	2024-05-14 14:44:33
16	6643a1f767b84_1715708407.mp4	3	2024-05-14 21:40:07	2024-05-14 21:40:07
17	6643a2ce2888a_1715708622.mp4	3	2024-05-14 21:43:42	2024-05-14 21:43:42
18	6643a2ce7a61d_1715708622.mp4	3	2024-05-14 21:43:42	2024-05-14 21:43:42
\.


--
-- Data for Name: package_ord_addons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.package_ord_addons (id, order_id, addon_id, remarks, price, qty, discount) FROM stdin;
1	1	1	extra cream	10.00	3	0.00
2	3	5	Cake should have Ali name written on it	250.00	1	0.00
4	5	5	Needs to be fresh	250.00	2	0.00
5	6	2		10.00	2	0.00
6	8	2		10.00	2	0.00
\.


--
-- Data for Name: package_ord_prods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.package_ord_prods (id, order_id, product_id, remarks, price, qty, discount) FROM stdin;
1	1	1	hapeey birth day Anil	10.00	1	0.00
2	2	1		100.00	1	0.00
3	3	8		200.00	1	0.00
4	3	9		250.00	1	0.00
7	5	8		200.00	1	0.00
8	5	9		250.00	1	0.00
9	6	12	I need light pink	0.00	1	0.00
10	6	13	I need light pink	60.00	1	0.00
11	6	10	happy birth day Anil	0.00	1	0.00
12	6	15		0.00	1	0.00
13	6	16		0.00	1	0.00
14	7	1		100.00	1	0.00
15	7	2		15.00	1	0.00
16	7	3		0.00	1	0.00
17	8	12		0.00	1	0.00
18	8	11		1000.00	1	0.00
19	8	15		0.00	1	0.00
20	8	16		0.00	1	0.00
21	9	12		0.00	1	0.00
22	9	13		60.00	1	0.00
23	9	11		1000.00	1	0.00
24	9	15		0.00	1	0.00
25	9	16		0.00	1	0.00
\.


--
-- Data for Name: package_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.package_orders (id, user_id, package_id, date, start_time, end_time, guests_adults, guests_children, booking_for, cstmr_title, cstmr_first_name, cstmr_last_name, cstmr_email, cstmr_dial_code, cstmr_phone, send_as_gift, total, tax, discount, payment_method, payment_id, status, created_at, updated_at, vendor_id, order_number, location, lattitude, longitude, sub_total, grand_total_n_tax, grand_total_w_tax, hours, hourly_rate) FROM stdin;
1	5	1	2024-04-19	11:55:00	13:55:00	3	2	myself	mr	\N	\N	\N	\N	\N	0	100.00	0.00	0.00	manual	\N	upcoming	2024-04-19 15:00:16	2024-04-19 15:00:16	\N	\N	\N	\N	\N	0.00	0.00	0.00	\N	\N
2	5	1	2024-05-08	2:00 PM	04:00 PM	1	0	myself	mr	\N	\N	\N	\N	\N	0	100.00	0.00	0.00	manual	\N	upcoming	2024-05-07 08:55:53	2024-05-07 08:55:53	4	3651715057753	location	123	123	0.00	0.00	0.00	\N	\N
5	13	2	2024-05-21	1:00 PM	05:00 PM	2	0	myself	mr	\N	\N	\N	\N	\N	0	1200.00	0.00	0.00	manual	\N	upcoming	2024-05-13 11:53:55	2024-05-13 11:53:55	15	3101715586835	location	123	123	2150.00	2150.00	2150.00	\N	\N
6	5	3	2024-05-15	10:00 PM	12:00 AM	3	2	myself	mr	\N	\N	\N	\N	\N	0	1500.00	0.00	0.00	manual	\N	upcoming	2024-05-14 20:25:36	2024-05-14 20:25:36	8	3581715703936	location	123	123	1580.00	1580.00	1580.00	\N	\N
7	13	1	2024-05-16	1:00 PM	3:00 PM	1	0	myself	mr	\N	\N	\N	\N	\N	0	200.00	0.00	0.00	manual	\N	upcoming	2024-05-15 00:01:03	2024-05-15 00:01:03	4	3221715716863	location	123	123	315.00	315.00	315.00	2.00	100.00
3	13	2	2024-05-15	12:00 PM	04:00 PM	2	0	other	mr	Ahmed	Khan	ahmedkhan22@gmail.com	92	6547123	0	1200.00	0.00	0.00	manual	\N	confirmed	2024-05-13 11:15:35	2024-05-15 00:01:50	15	8661715584535	location	123	123	0.00	0.00	0.00	\N	\N
8	6	3	2024-05-17	9:00 AM	11:00 AM	1	2	myself	mr	\N	\N	\N	\N	\N	0	3000.00	0.00	0.00	manual	\N	upcoming	2024-05-15 02:01:15	2024-05-15 02:01:15	8	3761715724075	location	123	123	4020.00	4020.00	4020.00	2.00	1500.00
9	6	3	2024-05-16	9:00 AM	12:00 PM	2	2	myself	mr	\N	\N	\N	\N	\N	0	4500.00	0.00	0.00	manual	\N	confirmed	2024-05-15 02:02:16	2024-05-15 02:20:29	8	4681715724136	location	123	123	5560.00	5560.00	5560.00	3.00	1500.00
\.


--
-- Data for Name: package_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.package_products (id, package_id, product_id, included) FROM stdin;
14	2	8	0
15	2	9	0
32	3	12	1
33	3	13	0
34	3	10	1
35	3	11	0
36	3	15	1
37	3	16	1
46	1	1	0
47	1	2	0
48	1	3	1
49	1	4	1
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
1	App\\Models\\User	16	token-name	b8ba1defe22c407a16516df09f0d7c866f5d678b4c8b3f7a5fa81e622d7642e3	["*"]	\N	\N	2024-05-14 10:30:08	2024-05-14 10:30:08
40	App\\Models\\User	30	api	fa6d5d5e4c09d54d9693fc8660f67378270d641f8f69de3e273600c0a54af32b	["*"]	\N	\N	2024-05-28 10:36:38	2024-05-28 10:36:38
2	App\\Models\\User	18	api	c99bb6b9c5451e72e23114ee6a42bd316ea3f865c8ebaff7301f3e07e84853c4	["*"]	2024-05-14 13:35:16	\N	2024-05-14 13:30:30	2024-05-14 13:35:16
3	App\\Models\\User	19	api	fe7f5bd30f5effe1e7d812ce6d1bc221b628497d5e5511e5ebca37bd2d1a01f7	["*"]	2024-05-14 16:04:50	\N	2024-05-14 15:40:26	2024-05-14 16:04:50
4	App\\Models\\User	20	api	5427c21dd716a379b51cd91d633fc3859e71214df1f9f1db77a0ddbb2d7baa44	["*"]	\N	\N	2024-05-14 17:14:47	2024-05-14 17:14:47
5	App\\Models\\User	21	api	213004e7e9bb6e172aa999f60700b85a8054f814660b2ecca90e1b60cbed3fd5	["*"]	\N	\N	2024-05-14 21:46:39	2024-05-14 21:46:39
6	App\\Models\\User	22	api	98e8b87ecbda343a384a018ed9d1473950e0fd125aaef3bcceb767eaf72e8d06	["*"]	\N	\N	2024-05-14 23:37:57	2024-05-14 23:37:57
7	App\\Models\\User	23	api	433a639533483a94f7ffcab2dbfb40195a29782aa8218df279ef071ad2d086b5	["*"]	\N	\N	2024-05-14 23:44:06	2024-05-14 23:44:06
8	App\\Models\\User	23	api	ebc2f43dfd7143a95e744fedb790cddcad08e87fbd6e847ce5a19771826ed796	["*"]	\N	\N	2024-05-14 23:45:08	2024-05-14 23:45:08
9	App\\Models\\User	23	api	9c0cb2ff8123b2974f6d35cd746d286b0dd1aa38b3d4cb2be38fa15721328e4f	["*"]	\N	\N	2024-05-15 02:23:04	2024-05-15 02:23:04
10	App\\Models\\User	18	api	25b4a1ec48a9d2254551894073dc74f5be3cd668b34f29794f49f9cce358fb8b	["*"]	\N	\N	2024-05-15 15:37:41	2024-05-15 15:37:41
11	App\\Models\\User	18	api	5c8f317b92c5df5315b6f8318a75de3d60558d183f4fdb6df2631e1d11ba7e34	["*"]	\N	\N	2024-05-16 20:09:56	2024-05-16 20:09:56
41	App\\Models\\User	30	api	a580c86f950dca2bf37c4c503452161e4630c27029133699a049f1b436ff0e33	["*"]	\N	\N	2024-05-28 10:37:14	2024-05-28 10:37:14
13	App\\Models\\User	18	api	03f722eee27230a59886da6d3bf672c0fa28fdc4bd98aafd7d75aaf665901309	["*"]	\N	\N	2024-05-17 10:04:42	2024-05-17 10:04:42
14	App\\Models\\User	18	api	f405fc049dd2f17c97fc43e7cbe51d82658d06e3c0f49c3cbf6b56cdfc5703fb	["*"]	\N	\N	2024-05-17 10:05:09	2024-05-17 10:05:09
15	App\\Models\\User	18	api	b3384ee94f1817f8eeeb81a07ff1a24e5ff81561b719effa39b92ffe908d3291	["*"]	\N	\N	2024-05-17 10:07:39	2024-05-17 10:07:39
16	App\\Models\\User	27	api	a09bbe97d87bffca5d4e6f456b94c55759435b9c50dcefb300ff13394fa58077	["*"]	\N	\N	2024-05-17 10:12:43	2024-05-17 10:12:43
17	App\\Models\\User	27	api	4801d8127669a576891c58c063d125b3420e88ce87de1704bee37b6289a8122d	["*"]	\N	\N	2024-05-17 10:13:04	2024-05-17 10:13:04
18	App\\Models\\User	27	api	081a1a6f3493e19b45787af6dba0bdc3fd20f7c1e1c3a73dbf15693f30e8e95c	["*"]	2024-05-17 10:23:30	\N	2024-05-17 10:19:36	2024-05-17 10:23:30
12	App\\Models\\User	26	api	bc639ed7f0961b417b1541a5b50c4d3bed787c66c5751db018e098bae7e7d9a0	["*"]	2024-05-17 10:28:05	\N	2024-05-17 09:14:10	2024-05-17 10:28:05
19	App\\Models\\User	27	api	1a825b18f86087d449d68b8bac5de1c6b5eb71e09625a63f7f04571ea4201818	["*"]	\N	\N	2024-05-25 08:44:37	2024-05-25 08:44:37
20	App\\Models\\User	27	api	886fe3595e09d914fa0d663044b7b809cabd9eb5d55efa2a968110fa6bb9277a	["*"]	\N	\N	2024-05-25 08:49:17	2024-05-25 08:49:17
21	App\\Models\\User	27	api	13fb374fd4c56711c90f3f34f37ea41c3f268e6e19626c79118ae9c8b2ce96bc	["*"]	\N	\N	2024-05-25 08:51:50	2024-05-25 08:51:50
22	App\\Models\\User	27	api	c81ad17dcb028b4c285cd65c1018ea5a05d27d57f1ab7e5e9a4ac04475d08328	["*"]	\N	\N	2024-05-25 08:51:50	2024-05-25 08:51:50
23	App\\Models\\User	27	api	9ab3f7a01a4ea0b52715ca5d3323bc2f5817c897a8773b31bb3d23d1c5b9f280	["*"]	\N	\N	2024-05-25 08:51:50	2024-05-25 08:51:50
24	App\\Models\\User	27	api	5f34da8752d8353d693f0a5d4e0951a6e6e8a08f0e46c9e048e1f67d8d9c3179	["*"]	\N	\N	2024-05-25 08:52:12	2024-05-25 08:52:12
25	App\\Models\\User	28	api	00efa0facca1223b3ada490403cdf12de7f44640f2a8df3d3e754a5e11d9c128	["*"]	\N	\N	2024-05-25 17:58:37	2024-05-25 17:58:37
26	App\\Models\\User	28	api	d148c6a370eef94ee35a2fd5ef36a62593deeb42c1a69a4ac4823a8ed9471220	["*"]	\N	\N	2024-05-25 18:02:52	2024-05-25 18:02:52
27	App\\Models\\User	28	api	025024848b4b372d69c619f2f2559e6fd94642f0a8ceb129d06437932efaf733	["*"]	\N	\N	2024-05-25 18:24:26	2024-05-25 18:24:26
28	App\\Models\\User	28	api	7453b353b571d67a1cead19be2fa918b129721dd2d4f889be986f6f75e66e572	["*"]	\N	\N	2024-05-25 18:37:45	2024-05-25 18:37:45
29	App\\Models\\User	30	api	551f07ec8666b5914e5d49112f8f1a8e50a0465c82f8fa18f0d63be88611da5d	["*"]	\N	\N	2024-05-27 10:52:14	2024-05-27 10:52:14
30	App\\Models\\User	30	api	7d26b602b1a96f89e47a86724d536b2a1ebeed53c9f90aebc4078845d594d63e	["*"]	\N	\N	2024-05-27 11:05:35	2024-05-27 11:05:35
31	App\\Models\\User	30	api	4308cf52156a04580bdaee0df69fdd6a5fcd1c42a1ea58479783ab6e2b8e5bdd	["*"]	\N	\N	2024-05-27 11:06:23	2024-05-27 11:06:23
32	App\\Models\\User	27	api	78eec23eb25d5ca40cadc5d351613d65606994f3b3060462049bd0efe87fcb04	["*"]	\N	\N	2024-05-27 16:40:18	2024-05-27 16:40:18
33	App\\Models\\User	31	api	e89009aca6a8ac14cb3b3b8de02d7279372acdc753810fd5d4718e1e3d37e030	["*"]	\N	\N	2024-05-27 16:58:59	2024-05-27 16:58:59
34	App\\Models\\User	31	api	19388582502972ba4eeb413523b8903f81d5ac993261777b9bab22142029f302	["*"]	\N	\N	2024-05-27 16:59:49	2024-05-27 16:59:49
35	App\\Models\\User	27	api	69dfc7cfbb8bbab29633849cba12757a3baef95cbc4ea8d5c91a84b984753f11	["*"]	\N	\N	2024-05-27 20:06:27	2024-05-27 20:06:27
36	App\\Models\\User	27	api	42759c4f56cd64688614d196e6322be8d88e782539e910ef9fd0a722d62a6304	["*"]	\N	\N	2024-05-27 20:07:41	2024-05-27 20:07:41
37	App\\Models\\User	32	api	7e0a238a772520d2e4f6373074adcb6f395464b04cd7adc2121f5f782973ec9b	["*"]	\N	\N	2024-05-27 20:21:10	2024-05-27 20:21:10
38	App\\Models\\User	32	api	5a980c02c5f4e0f6389320eb0172633002866c2efcd0c8483223ad61452c49c9	["*"]	\N	\N	2024-05-27 20:26:06	2024-05-27 20:26:06
42	App\\Models\\User	37	api	d80fc4fbf6771100a485fee5196d5408554ad2349c9d7dd2e83d14b84d979fae	["*"]	\N	\N	2024-05-28 12:02:44	2024-05-28 12:02:44
43	App\\Models\\User	28	api	a7234386c99b87a10624d8d98a06d7580ac5e4352e9a96b637ae11a07361b48f	["*"]	\N	\N	2024-05-28 12:05:10	2024-05-28 12:05:10
44	App\\Models\\User	28	api	926351755c7c553d05b4704089a13784815bbbbbe481788af5a9e3edc98f139f	["*"]	\N	\N	2024-05-28 13:25:15	2024-05-28 13:25:15
45	App\\Models\\User	28	api	acb20b3d159cf37d5d69b675365d0cceca4d11bae867a5608b0c58a9591a808c	["*"]	\N	\N	2024-05-28 14:32:15	2024-05-28 14:32:15
46	App\\Models\\User	28	api	1f7d22bbb787c8e805a940c4ae1bac454df44921f6c62bae43f0cf481309ec1a	["*"]	\N	\N	2024-05-28 14:45:38	2024-05-28 14:45:38
47	App\\Models\\User	28	api	e60471e367d6d6b34065431a74b6c586505266805e0a70f6444efb493bda72c3	["*"]	\N	\N	2024-05-28 14:57:58	2024-05-28 14:57:58
48	App\\Models\\User	28	api	fe853f971a2bf42be2da5fa911372db1a5e332ae4f7bff977ea6188e4e1689a0	["*"]	\N	\N	2024-05-28 15:00:13	2024-05-28 15:00:13
49	App\\Models\\User	28	api	e16bb77bf5ab1cdf2bcd83e649384cbe4c3d4f051dfbe292f274fdbad0204ad2	["*"]	\N	\N	2024-05-28 15:04:56	2024-05-28 15:04:56
50	App\\Models\\User	28	api	761c5678cf93108375ecbb0d127d4c99a427caa5e7f1f95edb58e050c2a63bde	["*"]	\N	\N	2024-05-28 15:06:10	2024-05-28 15:06:10
51	App\\Models\\User	28	api	0672dd5b88992566977604aaeb2f0e5e0d096235caf679b9f3e28f6ef3e143c5	["*"]	\N	\N	2024-05-28 15:14:59	2024-05-28 15:14:59
52	App\\Models\\User	28	api	acbbc1ae03047799f4ef301e2e7607c0c283c3c37d92b458da0cf0df6effc051	["*"]	\N	\N	2024-05-28 15:17:28	2024-05-28 15:17:28
53	App\\Models\\User	28	api	8f6ed0d698c8a7ecb902b5a3a502ff38d782b6a3218366685d6cf4f8e530b5ef	["*"]	\N	\N	2024-05-28 15:19:16	2024-05-28 15:19:16
54	App\\Models\\User	28	api	cb80fc57b735776ea8a76111799a417c4c2ceeca45eed5872a832089f767c383	["*"]	\N	\N	2024-05-28 15:20:38	2024-05-28 15:20:38
55	App\\Models\\User	28	api	aa3d8ce3c1f4dd9a51eecf7d3d61a7e54fe55ad642b05d9de20292772a4d70fe	["*"]	\N	\N	2024-05-28 15:27:53	2024-05-28 15:27:53
56	App\\Models\\User	28	api	dbfa213e4899d91845cc788151cc5d40a2b42d73b421b51b88bcddad4c371786	["*"]	\N	\N	2024-05-28 15:37:49	2024-05-28 15:37:49
57	App\\Models\\User	28	api	2f3a12075e650b36acf7d4ebd787f7105a9fa19c74a51ec81b24456101c6b793	["*"]	\N	\N	2024-05-28 15:38:51	2024-05-28 15:38:51
58	App\\Models\\User	28	api	b62b463731feb54b1c24bb660f33da064c477ce76c03529741ea6564547fe17b	["*"]	\N	\N	2024-05-28 15:41:08	2024-05-28 15:41:08
59	App\\Models\\User	28	api	6371dc0a810017d3e6c52ed4e7d1a3bbb4ed3ea08efaacf0b28eb6afea285cef	["*"]	\N	\N	2024-05-28 15:44:12	2024-05-28 15:44:12
60	App\\Models\\User	28	api	e36fdcc1d42f51a8b527c20e2bd10f8fa99757f46cb02c91276b71cab6090a9e	["*"]	\N	\N	2024-05-28 15:53:25	2024-05-28 15:53:25
61	App\\Models\\User	28	api	97fa4d60ba2e0feac743a46f171f5dbd8c9b1c8bade463e4b022094640c833cc	["*"]	\N	\N	2024-05-28 16:55:22	2024-05-28 16:55:22
62	App\\Models\\User	28	api	617c381c0abe2a22af7cf93b66bbb94eae4770f1f6b45a65c186540d8e6bce59	["*"]	\N	\N	2024-05-28 17:16:11	2024-05-28 17:16:11
63	App\\Models\\User	28	api	91cdc98cbbb1bd1089dbdb5f13140dc1cc76dfad825b8133254b6ee100d62a57	["*"]	\N	\N	2024-05-28 18:54:58	2024-05-28 18:54:58
64	App\\Models\\User	39	api	033f1a8cfa31bfbac5ccd503556a0ac0d1bf73a55022d1f04318d3c28b679463	["*"]	\N	\N	2024-05-29 14:12:24	2024-05-29 14:12:24
65	App\\Models\\User	40	api	ac9b090646adefb10017ca62f9b4fde4bb7f2b95bae8865275a0e512604f23c8	["*"]	\N	\N	2024-05-29 15:43:13	2024-05-29 15:43:13
66	App\\Models\\User	40	api	5c0e84f5886ca5f2689595513ac0c9dc3b3f836539598bd4b1b2e6e42924d548	["*"]	\N	\N	2024-05-29 15:48:33	2024-05-29 15:48:33
67	App\\Models\\User	28	api	41d9883cf5b3ca190b596773cc332706a850d12131e96f30f5bebde06b83a9b3	["*"]	\N	\N	2024-05-29 16:00:44	2024-05-29 16:00:44
68	App\\Models\\User	28	api	f22cfabb2c3dbeda855ac9621c7b598f00c3998cf36b5af8d3609436f2e082e1	["*"]	\N	\N	2024-05-29 16:09:05	2024-05-29 16:09:05
69	App\\Models\\User	28	api	32b8412eac6ae77b3649f281174bc612e38be8f0714c07d98143496e38301a71	["*"]	\N	\N	2024-05-29 16:10:04	2024-05-29 16:10:04
70	App\\Models\\User	28	api	38ddf46367ea25a0ef135b794ffbff8bc297280c37c0a97033427204fe7a82a7	["*"]	\N	\N	2024-05-29 16:22:18	2024-05-29 16:22:18
71	App\\Models\\User	28	api	95e42a22393742bb9eb2f0e0e5ca89386f88297db063de421f6cfc74976d46a4	["*"]	\N	\N	2024-05-29 17:31:01	2024-05-29 17:31:01
72	App\\Models\\User	28	api	6750d69364183fc3b1af31ccd7686d1c3d2f60e00e393f01ab75c532091fb0b9	["*"]	\N	\N	2024-05-29 17:47:57	2024-05-29 17:47:57
73	App\\Models\\User	28	api	05f82beb12ac9b7614782033026726d73819014aad0d6c7522438368cd102364	["*"]	\N	\N	2024-05-29 18:14:14	2024-05-29 18:14:14
74	App\\Models\\User	28	api	f641b75632d847957ffed0e98a2060f49560fa68b345479833edc98f84f2659b	["*"]	\N	\N	2024-05-29 18:28:03	2024-05-29 18:28:03
75	App\\Models\\User	28	api	1374d96672367ceaadc3e8327353db078274975368078e4462127082cf5e2912	["*"]	\N	\N	2024-05-29 18:41:35	2024-05-29 18:41:35
76	App\\Models\\User	28	api	5463efb083621d42fdb717ad25841cda3950434c3295126502f45868dfd4317c	["*"]	\N	\N	2024-05-29 18:45:38	2024-05-29 18:45:38
77	App\\Models\\User	28	api	a6ebfb3e614d529e7f5b90a7a28532003290b42b0ec77b4500d27ed8f41aa4a3	["*"]	\N	\N	2024-05-29 18:47:37	2024-05-29 18:47:37
78	App\\Models\\User	28	api	74ef6db9115073e28f4bd7550489daddb99b2bbcdc52e7ad203d8e2b84d3f353	["*"]	\N	\N	2024-05-30 10:44:39	2024-05-30 10:44:39
79	App\\Models\\User	28	api	554fc9e1e2eb3ed8299761accc64f26450b05314540c37fa9f8a1b1c96cdaa61	["*"]	\N	\N	2024-05-31 12:09:59	2024-05-31 12:09:59
81	App\\Models\\User	44	api	17c369b0f172158b2715e5482a6c299cdb6a2d6a4ddb9db45e4545f60530f5ec	["*"]	\N	\N	2024-05-31 15:52:19	2024-05-31 15:52:19
82	App\\Models\\User	44	api	1ad2d74a981b19078f472551b9f542af092179ce9d0c6fce1494ded67290728b	["*"]	\N	\N	2024-05-31 15:57:43	2024-05-31 15:57:43
83	App\\Models\\User	30	api	4c019a0fb8f21ce3a02f36a6ba8131dd2489f7c4520e1dfd3102f06e6c410396	["*"]	\N	\N	2024-06-03 01:38:46	2024-06-03 01:38:46
93	App\\Models\\User	14	api	ae25dc5dfdb32290b968d09c5c2ebd1f5b1d3e6ae0df59e2737b72cc53d9295e	["*"]	\N	\N	2024-06-03 20:15:12	2024-06-03 20:15:12
100	App\\Models\\User	17	api	16b2cad41ea82815c509e52d356aca5b827f4450cc9afd3f845dd0733ff9c3a6	["*"]	2024-06-05 20:47:01	\N	2024-06-05 10:50:11	2024-06-05 20:47:01
84	App\\Models\\User	14	api	ebebab8d9ec2ed6a942db203051f3db8e9bbb646af2a269d2f6503e12e68e2e1	["*"]	2024-06-03 01:53:04	\N	2024-06-03 01:47:42	2024-06-03 01:53:04
85	App\\Models\\User	28	api	0ae233d17915af0fa6794559f3d41a0b41fb4ab15dcd2d10aedee63a3b514b1e	["*"]	\N	\N	2024-06-03 11:10:57	2024-06-03 11:10:57
86	App\\Models\\User	45	api	82e32941c18af940ec63bce3f71c98e967f442aa53d6b3da6e8fb2f8dc8dcf8a	["*"]	\N	\N	2024-06-03 13:07:06	2024-06-03 13:07:06
87	App\\Models\\User	45	api	c2312027756e3970f47bfa3ea4d9d51378a284b1efc7bff2b80b8f7d9c92793a	["*"]	\N	\N	2024-06-03 13:07:25	2024-06-03 13:07:25
95	App\\Models\\User	14	api	ead390a9808bcea98a838a400a3c8bc4f2dd85ae938176455727a6fde411f971	["*"]	\N	\N	2024-06-03 20:35:16	2024-06-03 20:35:16
90	App\\Models\\User	14	api	885b36e0bf95ff50dd80df7d798fe2da575edaf7c91b1388caebcc29842da3cf	["*"]	2024-06-04 01:53:47	\N	2024-06-03 16:00:10	2024-06-04 01:53:47
96	App\\Models\\User	46	api	225877e71106f31047aeb3378fd16ef3c6f95fb6e63f93d830f11a47c1517400	["*"]	\N	\N	2024-06-03 22:48:04	2024-06-03 22:48:04
97	App\\Models\\User	47	api	f26b099b26545a29c780fd396545d69f160c7e5ffa6e587b4d33bd0a914349f6	["*"]	\N	\N	2024-06-04 00:55:04	2024-06-04 00:55:04
92	App\\Models\\User	28	api	3028edfc32322bce24351814213d189490918056389b86cf6238826f7e0e6e3a	["*"]	\N	\N	2024-06-03 17:54:45	2024-06-03 17:54:45
98	App\\Models\\User	33	api	4113fc635d638f000d5951c298d3c9686e219ac4fb213091b77070742d89e7b6	["*"]	2024-06-04 14:12:19	\N	2024-06-04 14:11:56	2024-06-04 14:12:19
99	App\\Models\\User	17	api	60e2714d9263bb3ab57823eace064de012901dd0adf512fc0781bb4d9261ca29	["*"]	2024-06-05 00:44:50	\N	2024-06-04 14:13:43	2024-06-05 00:44:50
94	App\\Models\\User	45	api	f25a488c406aee099b6a3c717eba1e1a1360cff162943e87bcd041a863fd2b83	["*"]	2024-06-06 19:16:07	\N	2024-06-03 20:26:46	2024-06-06 19:16:07
101	App\\Models\\User	22	api	34e16ef054f3741f26f3d174e17bce0f3fa1237b86467420e65e81a9417f573d	["*"]	\N	\N	2024-06-06 13:41:20	2024-06-06 13:41:20
103	App\\Models\\User	8	api	64db15fb40fa2b41f8b0c6d22369b9d54c20f4942a4a9a49c9f51aa9b94722b5	["*"]	2024-06-07 09:22:57	\N	2024-06-07 09:18:55	2024-06-07 09:22:57
102	App\\Models\\User	45	api	4929728c8117f23745a875b89c2d8b7c90cbde41ce3c69beb91e90f1c5e1c7e3	["*"]	2024-06-07 20:15:31	\N	2024-06-06 19:08:38	2024-06-07 20:15:31
104	App\\Models\\User	45	api	e34aec9c295bd1d20b21bea2e0a5b0bfea519a76cdf0d87926f73facce2b4b81	["*"]	2024-06-07 21:55:29	\N	2024-06-07 20:23:32	2024-06-07 21:55:29
\.


--
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_categories (id, name, image, active, sort_order, is_remarks, remarks_title, user_id, deleted_at, created_at, updated_at) FROM stdin;
1	Cake	66208abdc943f_1713408701.jpg	1	0	1	Tell us what to write on the cake?	4	\N	2024-04-18 02:51:41	2024-04-18 02:51:41
2	Accessories	6636278ecd4aa_1714825102.jpg	1	0	0	\N	4	\N	2024-05-04 16:18:22	2024-05-04 16:18:22
3	Flowers	663f3ec247657_1715420866.jpg	1	0	1	Color of Flower	8	\N	2024-05-11 13:47:46	2024-05-11 13:47:46
4	Flowers	6641b4fef0cdd_1715582206.jpg	1	0	0	\N	15	\N	2024-05-13 10:36:46	2024-05-13 10:37:16
5	Cake	6643334dd8433_1715680077.jpg	1	0	1	Tell us what to write on the cake	8	\N	2024-05-14 13:47:57	2024-05-14 13:47:57
6	Accessories	664336bd3cc09_1715680957.jpg	1	0	0	\N	8	\N	2024-05-14 14:02:37	2024-05-14 14:02:37
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, image, price, active, user_id, category_id, deleted_at, created_at, updated_at) FROM stdin;
3	Party Time 33-Pieces Gold 16" EID MUBARAK Balloon Letter Balloons	66362a61c5439_1714825825.jpg	20.00	1	4	2	\N	2024-05-04 16:30:25	2024-05-04 16:30:25
4	Disposable Glass	66362dea2508a_1714826730.jpg	10.00	1	4	2	\N	2024-05-04 16:45:30	2024-05-04 16:45:30
1	Red Birthday Cake	66362e34dec6b_1714826804.png	100.00	1	4	1	\N	2024-04-18 02:56:45	2024-05-04 16:46:44
2	Birthday Cake with Candles	66362ee33e713_1714826979.png	15.00	1	4	1	\N	2024-04-19 14:53:23	2024-05-04 16:49:39
5	Disposable Plates 1 Packet	66362f37519e0_1714827063.jpg	30.00	1	4	2	\N	2024-05-04 16:51:03	2024-05-04 16:51:03
6	Frozen 2 Printed Latex Balloons 8 PCS	66362f9510268_1714827157.jpg	40.00	1	4	2	\N	2024-05-04 16:52:37	2024-05-04 16:52:37
7	Red Rose Bouquet 2	6641b5fa7a63a_1715582458.png	300.00	1	15	4	2024-05-13 10:41:21	2024-05-13 10:40:58	2024-05-13 10:41:21
8	Red Rose Bouquet	6641b636b1225_1715582518.png	200.00	1	15	4	\N	2024-05-13 10:41:58	2024-05-13 10:41:58
9	Mix Flowers Bouquet	6641b65c956bd_1715582556.jpg	250.00	1	15	4	\N	2024-05-13 10:42:36	2024-05-13 10:42:36
10	Vanila Cake	664334857a9ca_1715680389.png	500.00	1	8	5	\N	2024-05-14 13:53:09	2024-05-14 13:53:09
11	Red Birthday Cake	664334b64c9da_1715680438.png	1000.00	1	8	5	\N	2024-05-14 13:53:58	2024-05-14 13:53:58
12	Pink Flowers	664334f5b29d1_1715680501.jpg	30.00	1	8	3	\N	2024-05-14 13:55:01	2024-05-14 13:55:01
13	Red Rose Bouquet	664335495b62f_1715680585.jpg	60.00	1	8	3	\N	2024-05-14 13:56:25	2024-05-14 13:57:15
15	Disposible Glass	66433865b4630_1715681381.jpg	10.00	1	8	6	\N	2024-05-14 14:09:41	2024-05-14 14:09:41
16	Green and Golden Ballon	664338c949d96_1715681481.jpg	20.00	1	8	6	\N	2024-05-14 14:11:21	2024-05-14 14:11:21
14	Blue and Golden Baloon	66433841aa04e_1715681345.jpg	20.00	1	8	6	\N	2024-05-14 14:09:05	2024-05-14 14:13:56
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, meta_key, meta_value) FROM stdin;
1	tax	5
\.


--
-- Data for Name: temp_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_users (id, name, email, dial_code, phone, user_type_id, user_phone_otp, access_token, user_data, created_at, updated_at) FROM stdin;
11	Asad Nazir	asadnazir289@gmail.com	+93	3441560339	2	1234	dfc5b4ecce758143f31577aacc8cfe69	{"first_name":"Asad","last_name":"Nazir","email":"asadnazir289@gmail.com","dial_code":"+93","phone":"3441560339","gender":"Male","date_of_birth":"2024-05-02","password":"Asdf@1122","confirm_password":"Asdf@1122","location_name":"Tibesti est, Chad,","location":"18.927893452951487,16.96881382885415kotlin.Unit","is_social":"0"}	2024-05-17 00:48:05	2024-05-17 00:48:05
21	 	newwahab22khurram@gmail.com	92	8745412	3	1234	a5c352f765fb9c7a45b45db6035cf91f	{"name":"Wahab","email":"newwahab22khurram@gmail.com","dial_code":"92","phone":"8745412","password":"testing22","confirm_password":"testing22","account_type":"company","location_name":"462Q+26 Dubai - United Arab Emirates","location":"25.1000998,55.2380812","date_of_birth":"1993-04-06","company_name":"IBM 2","is_represent":"1","rep_name":"Abdul Wahab","rep_email":"wahabfun22@gmail.com","rep_dial_code":"92","rep_phone":"8712547"}	2024-05-25 01:50:34	2024-05-25 01:50:34
24	 	test3@gmail.com	971	36908455464	3	1234	68b68d49de9571a953f71a5672b5f242	{"name":"testOwnerName","email":"test3@gmail.com","dial_code":"971","phone":"36908455464","password":"Hunain@12","confirm_password":"Hunain@12","account_type":"company","location_name":"G486+WGH, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,","location":"33.51730399227441,73.11123389750719","date_of_birth":"1993-04-06","company_name":"testCompanyName","device_type":"ANDROID","fcm_token":"abcd","is_represent":"1","rep_name":"repName","rep_email":"rep@gmail.com","rep_dial_code":"92","rep_phone":"1590822699","logo":{},"trade_license":{}}	2024-05-25 02:53:23	2024-05-25 02:53:23
27	Asad Z	testing145@gmail.com	92	54142365	2	1234	08978ef09ef14d544fbbf0241288b0c0	{"first_name":"Asad","last_name":"Z","email":"testing145@gmail.com","dial_code":"92","phone":"54142365","gender":"male","date_of_birth":"1993-04-06","password":"testing22","confirm_password":"testing22","location_name":"462Q+26 Dubai - United Arab Emirates","location":"25.1000998,55.2380812","is_social":"0"}	2024-05-27 10:47:22	2024-05-27 10:47:22
28	Teas afafd	asfadfdf@gmail.com	92	65874512	2	1234	b9bffae2b89ff1578e54c3f2be186577	{"is_social":"1","first_name":"Teas","last_name":"afafd","email":"asfadfdf@gmail.com","dial_code":"92","phone":"65874512","gender":"male","date_of_birth":"1994-04-21","location_name":"462Q+26 Dubai - United Arab Emirates","location":"25.1000998,55.2380812"}	2024-05-27 10:48:05	2024-05-27 10:48:05
41	 	test4@gmail.com	971	369369369	3	1234	051c5ff5c53835366297b0e1bdd02835	{"name":"test four","family_name":"four family","email":"test4@gmail.com","dial_code":"971","phone":"369369369","password":"Hunain@12","confirm_password":"Hunain@12","account_type":"individual","hear_about_us":"5","nationality":"1","username":"four_name","gender":"male","date_of_birth":"1993-04-06","device_type":"ANDROID","fcm_token":"abc"}	2024-05-27 22:04:37	2024-05-27 22:04:37
42	 	new2wahab262khurram@gmail.com	92	41236547	3	1234	ce840e4dc489871bd243529b45b320da	{"name":"Wahab","family_name":"Khurram","email":"new2wahab262khurram@gmail.com","dial_code":"92","phone":"41236547","password":"testing22","confirm_password":"testing22","account_type":"individual","hear_about_us":"1","nationality":"1","username":"wahabfun223","gender":"male","date_of_birth":"1993-04-06"}	2024-05-27 22:05:46	2024-05-27 22:05:46
46	Asad Nazir	abcde@gmail.com	+93	3441560318	2	1234	a69f6f4ec9a7177334203a7fa254b079	{"first_name":"Asad","last_name":"Nazir","email":"abcde@gmail.com","dial_code":"+93","phone":"3441560318","gender":"Male","date_of_birth":"2018-05-28","password":"Asdf@1123","confirm_password":"Asdf@1123","location_name":"673C+W8V - Dubai - United Arab Emirates,","location":"673C+W8V - Dubai - United Arab Emirates,","is_social":"0"}	2024-05-28 11:53:20	2024-05-28 11:53:20
49	Asad Nazir	abcd@gmail.com	+93	3441590318	2	1234	b79e2e515f6bbb06a2cc274299b05952	{"first_name":"Asad","last_name":"Nazir","email":"abcd@gmail.com","dial_code":"+93","phone":"3441590318","gender":"Male","date_of_birth":"2005-05-28","password":"Asdf@1122","confirm_password":"Asdf@1122","location_name":"673C+W8X - Al Safa St - Dubai - United Arab Emirates,","location":"673C+W8X - Al Safa St - Dubai - United Arab Emirates,","is_social":"0"}	2024-05-28 13:00:31	2024-05-28 13:00:31
51	Asad Z	asadz14534@gmail.com	92	555412364	2	1234	955b7544c903f9953383818ce27e669f	{"first_name":"Asad","last_name":"Z","email":"asadz14534@gmail.com","dial_code":"92","phone":"555412364","gender":"male","date_of_birth":"1993-04-06","password":"testing22","confirm_password":"testing22","location_name":"462Q+26 Dubai - United Arab Emirates","location":"25.1000998,55.2380812","is_social":"0","device_type":"android","fcm_token":"aasfdf","device_cart_id":"252"}	2024-05-29 14:13:23	2024-05-29 14:13:23
53	Suleman Ali	suleman.ali303@gmail.com	+92	30276558762	2	1234	b6a8058852ccd258b5701aabaa1510c3	{"password":"Zulfiqar@12","is_social":"0","fcm_token":null,"last_name":"Ali","location_name":"Shahi Road, Shahi Road, Rahimyar Khan, Punjab, Pakistan","location":"28.422355775563563,70.31694542616606","device_type":"ios","email":"suleman.ali303@gmail.com","phone":"30276558762","first_name":"Suleman","device_cart_id":"21B1BA04-A445-4E0D-9105-E43BA3DEAEDE","date_of_birth":"1997-08-25","gender":"male","confirm_password":"Zulfiqar@12","dial_code":"+92"}	2024-05-29 14:42:28	2024-05-29 14:42:28
54	suleman ali	ib2suleman.alti@gmail.com	+92	30276558761	2	1234	3551c70b1949ef9a4986a0987a058fd6	{"device_type":"ios","date_of_birth":"1997-05-29","gender":"male","first_name":"suleman","phone":"30276558761","password":"qwerty","last_name":"ali","dial_code":"+92","confirm_password":"qwerty","location_name":"Shahi Road, Shahi Road, Rahimyar Khan, Punjab, Pakistan","is_social":"0","device_cart_id":"21B1BA04-A445-4E0D-9105-E43BA3DEAEDE","location":"28.422355775563563,70.31694542616606","email":"ib2suleman.alti@gmail.com","fcm_token":null}	2024-05-29 14:51:53	2024-05-29 14:51:53
55	suleman ali	suleman.ali3034@gmail.com	+92	30276558762222	2	1234	6ec812214e5c76f3b67012857c7cf26d	{"email":"suleman.ali3034@gmail.com","device_type":"ios","dial_code":"+92","device_cart_id":"21B1BA04-A445-4E0D-9105-E43BA3DEAEDE","fcm_token":null,"phone":"30276558762222","first_name":"suleman","location_name":"Shahi Road, Shahi Road, Rahimyar Khan, Punjab, Pakistan","gender":"male","date_of_birth":"1997-08-25","is_social":"0","location":"28.422355775563563,70.31694542616606","password":"Zulfiqar","last_name":"ali","confirm_password":"Zulfiqar"}	2024-05-29 15:23:48	2024-05-29 15:23:48
64	 	test1@gmail.com	358	454545454554	3	1234	565a385fde6f7067a5edc3a29c967759	{"account_type":"individual","confirm_password":"Zain777","device_cart_id":"13822C6B-D116-4BEA-8B25-6D127B86654A","device_type":"iOS","dial_code":"358","email":"test1@gmail.com","family_name":"test","fcm_token":"abdhjef ekef kjwf wedfw","gender":"male","hear_about_us":"1","language":"en","name":"moin","nationality":"1","password":"Zain777","phone":"454545454554","username":"moin"}	2024-06-03 23:29:54	2024-06-03 23:29:54
66	 	test30@gmail.com	93	5151151515	3	1234	3b1d2a4ae4ec63ea0fee59a1414ef6e3	{"rep_phone":"84848484","rep_email":"testRep@gmail.com","language":"en","email":"test30@gmail.com","dial_code":"93","phone":"5151151515","is_represent":"1","account_type":"company","rep_name":"test","company_name":"test","password":"Test@777","device_type":"iOS","location_name":"Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan","fcm_token":"abdhjef ekef kjwf wedfw","location":"33.51611946299474,73.11084576954921","rep_dial_code":"93","device_cart_id":"13822C6B-D116-4BEA-8B25-6D127B86654A","name":"test","confirm_password":"Test@777","trade_license":{},"logo":{}}	2024-06-06 00:48:51	2024-06-06 00:48:51
67	 	testcomp1@gmail.com	93	815145454	3	1234	e1aa328c02aacbcdb81f199d52f28785	{"device_type":"iOS","email":"testcomp1@gmail.com","location":"33.51611946299474,73.11084576954921","company_name":"bash","is_represent":"1","location_name":"Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan","rep_dial_code":"1684","fcm_token":"abdhjef ekef kjwf wedfw","language":"en","rep_email":"testrep1@gmail.com","phone":"815145454","name":"hwwha","dial_code":"93","rep_phone":"8484313113","device_cart_id":"13822C6B-D116-4BEA-8B25-6D127B86654A","password":"test@777","account_type":"company","confirm_password":"test@777","rep_name":"bas","logo":{},"trade_license":{}}	2024-06-06 01:01:49	2024-06-06 01:01:49
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, dial_code, phone, phone_verified, password, email_verified_at, role, verified, user_type_id, first_name, last_name, user_image, user_phone_otp, remember_token, created_at, updated_at, active, device_type, fcm_token, device_cart_id, password_reset_code) FROM stdin;
28	Suleman Ali	ib2suleman.ali@gmail.com	92	3126747241	1	$2y$12$P90U2Z9xwvqxi.bt83Wdu.Y5TJWOIHvLY5TSoGKXgOrmLHTKKPitW	\N	\N	1	2	Suleman	Ali	\N	\N	\N	2024-05-25 17:58:36	2024-06-03 17:54:45	1	ios	\N	DF3AD695-C632-4ED7-9EED-30C04FACE20C	\N
1	Admin	admin@admin.com	971	112233445566778899	0	$2y$12$2g6sWLJfPvFqNWZVYygDqOqVDJv9GjuM8lsf34dVgL.bFXU4jocZK	\N	1	1	1	\N	\N	\N	\N	\N	\N	2024-06-03 17:54:45	1	\N	\N	\N	\N
5	Wahab khurram	wahabfun22@gmail.com	93	3654874142	1	$2y$12$yq6fmNoRibAfEmNgvMvW7e2T7VgDR/WazLXNaUKgjKSrSceUkEhgu	\N	\N	1	2	Wahab	khurram	\N	\N	\N	2024-04-18 02:32:54	2024-06-03 17:54:45	1	\N	\N	\N	\N
6	Anil Navis	anil@anil.com	256	134523525	1	$2y$12$ZmbHfgmtFe8uMDnz9czK8u4jnlVBBlTFUte0OR4pO3mm.Adni84Jy	\N	\N	1	2	Anil	Navis	\N	\N	\N	2024-04-20 16:21:34	2024-06-03 17:54:45	1	\N	\N	\N	\N
7	Marwan	marwan@gmail.com	93	46363466663	1	$2y$12$2M9Smdq3IF2.2OBu51.0POKm13R3ekvLXJ/zE7u5r2eVtdMTgXpSq	\N	\N	1	3	\N	\N	\N	\N	\N	2024-05-05 16:20:40	2024-06-03 17:54:45	1	\N	\N	\N	\N
9	wahab khurram	wahabfun22222@gmail.com	91	6541235	1	$2y$12$mfS.NUcbYhQvhpGo2b0w.uJYOTDq5IodzL0IKkSP6cL5Do.gfy3fC	\N	\N	1	2	wahab	khurram	\N	\N	\N	2024-05-12 12:22:36	2024-06-03 17:54:45	1	\N	\N	\N	\N
10	Wahab 2 Khurram	wahabfun222222@gmail.com	213	6541232	1	$2y$12$ud7qNLnfKUA99BYJ80txEOvgQwzofYpVnFVGZ6H9dTxjkkK97TtxC	\N	\N	1	2	Wahab 2	Khurram	\N	\N	\N	2024-05-12 12:30:44	2024-06-03 17:54:45	1	\N	\N	\N	\N
27	Asad Z	asadz145@gmail.com	92	5412365	1	$2y$12$zqV6Zc1n9adpyQgnZO9oFOavW8paPxlW7zMch5Tq1H2cUWy8M9e3u	\N	\N	1	2	Asad	Z	\N	1234	\N	2024-05-17 10:12:42	2024-05-31 13:42:11	1	ANDROID	\N	507c25ffbc01d8ae	ebd650e7f587082e5880ceb26b308c76
8	Mehmood	mehmood@gmail.com	93	4636346666	1	$2y$12$uQsl2xYENmJ3m2h9z6Cd6uA9QuedJ5fLvg3zmWACD30rrZIszDgqC	\N	\N	1	3	\N	\N	\N	\N	\N	2024-05-05 17:32:00	2024-06-07 09:18:55	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N
21	Wahab Khurram	abc@gmail.coss	92	343434142	1	$2y$12$jKjGvdcWGMXFa0VFhVsUHec0wC9VTK22L5v7PLcr5.phxFrkdJrR2	\N	\N	1	2	Wahab	Khurram	\N	\N	\N	2024-05-14 21:46:39	2024-06-03 17:54:45	1	\N	\N	\N	\N
11	Wahab	wahabfun124134@gmail.com	92	6548745	1	$2y$12$LDDsHfEDY/GzDSImvT5qVuW.PasDEoXZKaNILCYXGfmG3gDSEyEUG	\N	\N	1	3	\N	\N	\N	\N	\N	2024-05-12 12:38:15	2024-06-03 17:54:45	1	\N	\N	\N	\N
12	Abdul Wahab 2	abdulwahab442@gmail.com	92	6516554	1	$2y$12$XxH6ciFl1wHX1p3mkjCZt.UXVmqaD.4odQjrynBz1yLYDNDsoF4W2	\N	\N	1	3	\N	\N	\N	\N	\N	2024-05-12 12:40:34	2024-06-03 17:54:45	1	\N	\N	\N	\N
4	Wahab	g@dg.com	971	3463463463	1	$2y$12$f8./dw6uYgRQQVr2GEMDf.36bMi9cX/aBxkVlxYJyI9JlgMWf1C1G	\N	\N	1	3	\N	\N	\N	\N	\N	2024-04-05 07:20:18	2024-06-03 17:54:45	1	\N	\N	\N	\N
13	Ali Khans	alikhan22@gmail.com	358	65874513	1	$2y$12$hymU0d/EiXZfQclQ0tsLCOHFiyfEvIp8WdE2hHyznk7055nF/o.7.	\N	\N	1	2	Ali	Khans	\N	\N	\N	2024-05-13 10:17:55	2024-06-03 17:54:45	1	\N	\N	\N	\N
15	Ahmed Khan	ahmedkhan123@gmail.com	92	6541234	1	$2y$12$ZD57HNkLwyxo3y1FBfxly.Xy8UFLviSHLQoQWtWXMo8nenRjiU2FS	\N	\N	1	3	\N	\N	\N	\N	\N	2024-05-13 10:34:50	2024-06-03 17:54:45	1	\N	\N	\N	\N
16	Wahab Khurram	newwahab2khurram@gmail.com	92	365464340	1	$2y$12$4K5Yv1qRO6Lpk/cciZnFT.FcnB/5Nr3ndWIkgl2Z2w698fIzBTUWK	\N	\N	0	2	Wahab	Khurram	\N	1234	\N	2024-05-14 10:25:42	2024-06-03 17:54:45	1	\N	\N	\N	\N
18	Wahab Khurram	newwahab32khurram@gmail.com	92	5413254	1	$2y$12$b3Mer5QPlE1apBDLu4cO7u87FRqv66IcUJiBF4U8xne2RTaQDfoLe	\N	\N	1	2	Wahab	Khurram	\N	\N	\N	2024-05-14 13:30:29	2024-06-03 17:54:45	1	\N	\N	\N	\N
19	Wahab Khurram	abc@gmail.com	92	343434343	1	$2y$12$ieBKoK0mT59eX/W4R/yqLuVUgtIEg6P82t/WpXZPvuiFgPrWaXCGi	\N	\N	1	2	Wahab	Khurram	\N	\N	\N	2024-05-14 15:40:25	2024-06-03 17:54:45	1	\N	\N	\N	\N
14	Abdul Khans	abdulkhan22@gmail.com	962	6587412	1	$2y$12$VXNpxmI7i43eM8PSmZJB7eQy6anU1Okkm1BwOJlEyBjEK8qPNHTyC	\N	\N	1	3	\N	\N	\N	\N	\N	2024-05-13 10:19:22	2024-06-03 20:35:16	1	iOS	\N	13822C6B-D116-4BEA-8B25-6D127B86654A	\N
17	N Biswas	p1@mailinator.com	91	9832831811	1	$2y$12$ADcnR7EEvMF8qRe.eJ2m8eaXLvHl5vaNBgIS5WLH3T/bsDtp6HYBq	\N	\N	1	3	\N	\N	\N	\N	\N	2024-05-14 11:50:32	2024-06-04 14:13:43	1	android	\N	252	\N
46	Wahab	vendor2621khurram@gmail.com	92	41236548	1	$2y$12$V7sgBaaR7aOvd3PadmEAoOzi/yjkiSFNcv8I1wl1YDIbLqaCUxxui	\N	\N	1	3	\N	\N	\N	\N	\N	2024-06-03 22:48:04	2024-06-03 22:48:04	1	android	\N	252	\N
33	Wahab	vendor262khurram@gmail.com	92	41236544	1	$2y$12$yoFIERqMyL/OepR9lZVcxONcuK4segSQrZZ5OMzhXQv/vYcY7K0QO	\N	\N	1	3	\N	\N	\N	\N	\N	2024-05-28 09:09:53	2024-06-04 14:11:56	1	android	\N	252	\N
22	Asad Nazir	asad@gmail.com	+92	3445522331	1	$2y$12$0PQOL5hxEDwf93EsPhA1OeYsxWmqPKscTl7RGPIx8qQKKQB.cXu.C	\N	\N	1	2	Asad	Nazir	\N	\N	\N	2024-05-14 23:37:56	2024-06-06 13:41:20	1	ANDROID	abcd	7812fe4f9424cf17	\N
47	test	test2@gmail.com	358	8454545454	1	$2y$12$9YCAQp/VhjZ9aQiPZfM5huRnMXCjGlR9OckXVxTW.Shmt5U3jUbA2	\N	\N	1	3	\N	\N	\N	\N	\N	2024-06-04 00:55:04	2024-06-04 00:55:04	1	iOS	\N	13822C6B-D116-4BEA-8B25-6D127B86654A	\N
45	Hunain Dev	hunain88@gmail.com	971	0987654321	1	$2y$12$i6G.GzOMbkBdqwSRm9IupelrFKL9AehsshxuB2z.FR/iu/bhZVvW6	\N	\N	1	3	\N	\N	\N	\N	\N	2024-06-03 13:07:06	2024-06-07 20:23:32	1	iOS	abdhjef ekef kjwf wedfw	13822C6B-D116-4BEA-8B25-6D127B86654A	\N
31	Asad Z	asadz146@gmail.com	92	54123655	1	$2y$12$.8HvCmOOfczS3F.dfx/Ha.3octEyXrwSVP72cvr8APEqbUUidZ5tW	\N	\N	1	2	Asad	Z	\N	\N	\N	2024-05-27 16:58:58	2024-06-03 17:54:45	1	\N	\N	\N	\N
32	Asad Z	test@gmail.com	92	54123656	1	$2y$12$.oAr8zr/r71PbRvZ7h3In.5l3oNG2kQCI6l.esZ4JCxg53iQCfdmK	\N	\N	1	2	Asad	Z	\N	\N	\N	2024-05-27 20:21:09	2024-06-03 17:54:45	1	\N	\N	\N	\N
37	Asad Z	asadz149@gmail.com	92	541236500	1	$2y$12$usMGADKptVve0Ljm/Xhim.wIeryZovNQfVpoIUwW0DW7LxpR2MMYC	\N	\N	1	2	Asad	Z	\N	\N	\N	2024-05-28 12:02:43	2024-06-03 17:54:45	1	\N	\N	\N	\N
44	Nemai Biswas	u0@mailinator.com	+91	963696217236	1	$2y$12$8cR5avklLv2b0sJ/BeS1SuailGCgZ/26LPJzmtBOY5OqqC4pnEagq	\N	\N	1	2	Nemai	Biswas	\N	\N	\N	2024-05-31 15:52:18	2024-06-03 17:54:45	1	ios	\N	F1863CDF-4994-46E0-B5F9-A371B6BB6AEF	\N
30	Asad Z	asdf@gmail.com	92	5412235	1	$2y$12$2m9aok7Wjp55dYlciZZ.NulcsRUazkE/5FPXVpsMaGTt9Tsx6QDXe	\N	\N	1	2	Asad	Z	\N	\N	\N	2024-05-27 10:52:13	2024-06-03 17:54:45	1	android	\N	252	\N
20	Wahab Khurram	abc@gmail.cos	92	343434342	1	$2y$12$nZZ91T7myUbdhRHARhSQpO6J7liNpG21nCQJ78YV8KZK9ylbG2nKm	\N	\N	1	2	Wahab	Khurram	\N	\N	\N	2024-05-14 17:14:46	2024-06-03 17:54:45	1	\N	\N	\N	\N
23	asad asad	asadf@gmail.com	+92	344556622	1	$2y$12$tUSEd9CEvbzK6Nc9dhuWsuhrFS5pF/IDwoW9kU7fIFlt4g8wmsBv.	\N	\N	1	2	asad	asad	\N	\N	\N	2024-05-14 23:44:05	2024-06-03 17:54:45	1	\N	\N	\N	\N
26	Wahab Khurram	asadz14@gmail.com	92	3441560889	1	$2y$12$.UvBxCqm9cF0h/JG86j46uknKOnGi2nTbeAruVY58HOCaS/YJlomy	\N	\N	1	2	Wahab	Khurram	\N	\N	\N	2024-05-17 09:14:09	2024-06-03 17:54:45	1	\N	\N	\N	\N
40	Suleman Ali	suleman.ali303303@gmail.com	+92	302765587622133	1	$2y$12$nWt1ij2gWMrV77T39frHcOloQPatIJ6xVRY2IPX3pGqyQ3//mxg5m	\N	\N	1	2	Suleman	Ali	\N	\N	\N	2024-05-29 15:43:11	2024-06-03 17:54:45	1	android	\N	252	\N
39	Asad Z	asadz1453@gmail.com	92	5412364	1	$2y$12$JMsSsvbO2Qe4ErGJFiW2H.y1oe2ZQWaaTOhKkyyuX//ol1ZeGd8C.	\N	\N	1	2	Asad	Z	\N	\N	\N	2024-05-29 14:12:23	2024-06-03 17:54:45	1	android	\N	252	\N
\.


--
-- Data for Name: vendor_addons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_addons (id, name, extra_info, image, price, user_id, category_ids, created_at, updated_at, deleted_at) FROM stdin;
1	1 Pound Cake	\N	66208a3f9111e_1713408575.jpg	10.00	4	2	2024-04-18 02:49:35	2024-04-18 02:49:35	\N
2	Plum Cake	What's write on cake	663f081832a9e_1715406872.png	10.00	8	2	2024-05-11 09:54:32	2024-05-11 09:54:32	\N
3	Red Rose	\N	663f2c60edfdf_1715416160.png	20.00	8	4	2024-05-11 12:29:20	2024-05-11 12:29:20	\N
4	Mix Cake	\N	6641b8b1cde08_1715583153.jpg	250.00	15	2	2024-05-13 10:52:33	2024-05-13 10:52:52	2024-05-13 10:52:52
5	Mix Cake	\N	6641b8d79636f_1715583191.jpg	250.00	15	2	2024-05-13 10:53:11	2024-05-13 10:53:11	\N
\.


--
-- Data for Name: vendor_facility_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_facility_groups (id, name, description, created_at, updated_at, user_id) FROM stdin;
\.


--
-- Data for Name: vendor_facility_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_facility_items (id, name, extra_info, facility_group_id, icon, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: vendor_package_addons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_package_addons (id, vendor_package_id, addon_id) FROM stdin;
4	2	5
8	3	2
11	1	1
\.


--
-- Data for Name: vendor_package_attach_include; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_package_attach_include (id, vendor_package_id, include_id) FROM stdin;
3	1	5
\.


--
-- Data for Name: vendor_package_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_package_categories (id, vendor_package_id, category_id) FROM stdin;
8	2	1
12	3	2
19	1	1
20	1	4
21	1	5
\.


--
-- Data for Name: vendor_package_facilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_package_facilities (id, vendor_package_id, facility_id) FROM stdin;
12	2	5
13	2	6
14	2	7
15	2	8
16	2	9
26	3	3
27	3	5
28	3	6
31	1	6
\.


--
-- Data for Name: vendor_package_includes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_package_includes (id, name, active, vendor_user_id, created_at, updated_at, deleted_at) FROM stdin;
1	decorations	1	8	2024-05-14 22:08:17	2024-05-14 22:08:17	\N
2	afternoon tea	1	8	2024-05-14 22:08:36	2024-05-14 22:08:36	\N
3	⁠jacuzzi	1	8	2024-05-14 22:08:55	2024-05-14 22:08:55	\N
4	coffee box	1	8	2024-05-14 22:09:18	2024-05-14 22:09:18	\N
5	decorations	1	4	2024-05-14 22:31:47	2024-05-14 22:31:47	\N
\.


--
-- Data for Name: vendor_packages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_packages (id, user_id, name, price, what_includes, package_details, departure_info, return_info, additional_info, cancellation_policy, faq_info, help_info, location, starting_point, yatch_id, created_at, updated_at, deleted_at, offer_price, lattitude, longitude, active, sub_title) FROM stdin;
2	15	Dubai Marina Yacht Tours and Birthday Package	2500.00	<ul class="activity-highlights__list" style="box-sizing: border-box; border: 0px; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px; margin: 0px; padding: 0px 0px 0px 16px; vertical-align: baseline; list-style-position: outside; list-style-image: initial; color: #1a2b49;" data-test-id="activity-highlights" data-v-72aefa1b="">\r\n<li class="activity-highlights__list-item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline;" data-v-72aefa1b="">Savor fresh assorted sliders and skewers onboard a yacht in the Dubai Marina</li>\r\n<li class="activity-highlights__list-item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline;" data-v-72aefa1b="">Enjoy a selection of club classics played by an onboard DJ</li>\r\n<li class="activity-highlights__list-item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline;" data-v-72aefa1b="">Have the chance to savor unlimited refreshing beverages</li>\r\n<li class="activity-highlights__list-item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline;" data-v-72aefa1b="">Take advantage of the free Wi-Fi connection aboard the boat</li>\r\n<li class="activity-highlights__list-item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline;" data-v-72aefa1b="">Admire the beauty of the Dubai skyline as it is lit for the night</li>\r\n</ul>	<p style="box-sizing: border-box; border: 0px; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px; margin: 0px 0px 2px; padding: 0px; vertical-align: baseline; color: #1a2b49; white-space-collapse: preserve;">Make the most of your time in Dubai with a night-time marina cruise. Sail around the marina and enjoy sweeping views of the city's skyline as it sparkles for the night. Party to hot music on an open deck.</p>\r\n<p style="box-sizing: border-box; border: 0px; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px; margin: 0px 0px 2px; padding: 0px; vertical-align: baseline; color: #1a2b49; white-space-collapse: preserve;">&nbsp;</p>\r\n<p style="box-sizing: border-box; border: 0px; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px; margin: 0px 0px 2px; padding: 0px; vertical-align: baseline; color: #1a2b49; white-space-collapse: preserve;">Meet your host and check-in before boarding the yacht. Set sail and take in highlights like the Jumeirah Beach Residence and the Ain Dubai observation wheel while they are lit up for the night. See the city lights reflected in the water from the ship.</p>\r\n<p style="box-sizing: border-box; border: 0px; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px; margin: 0px 0px 2px; padding: 0px; vertical-align: baseline; color: #1a2b49; white-space-collapse: preserve;">&nbsp;</p>\r\n<p style="box-sizing: border-box; border: 0px; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px; margin: 0px 0px 2px; padding: 0px; vertical-align: baseline; color: #1a2b49; white-space-collapse: preserve;">Listen to chart-topping hits played by a live DJ and dance under the stars on an the open deck. Enjoy some assorted sliders and skewers and choose from a selection of drinks. After the cruise, return to the departure point.</p>\r\n<p style="box-sizing: border-box; border: 0px; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px; margin: 0px 0px 2px; padding: 0px; vertical-align: baseline; color: #1a2b49; white-space-collapse: preserve;">Kindly arrive 30 minutes prior to your scheduled departure time. This will allow you to comfortably check into our lounge, where you can enjoy complimentary WiFi while awaiting the boarding announcement for your yacht excursion. The sliders BBQ Menu includes: Beef sliders Chicken sliders Veggie sliders Mozzarella sticks Veg skewers Corn on the cob</p>	<p><span style="color: #1a2b49; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px;">Board your cruise at the Xclusive Yachts, boarding area in the Dubai Marina. If you're arriving by metro, get off at the DMCC metro station. By taxi, ask to be taken to the Marina Mansion. Once you are in front of Marina Mansion, cross the road and walk towards a ramp next to the bridge. Walk down the ramp, and take a left to the meeting point.</span></p>	<p>No return</p>	<ul class="activity-highlights__list" style="box-sizing: border-box; border: 0px; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px; margin: 0px; padding: 0px 0px 0px 16px; vertical-align: baseline; list-style-position: outside; list-style-image: initial; color: #1a2b49;" data-test-id="activity-highlights" data-v-72aefa1b="">\r\n<li class="activity-highlights__list-item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline;" data-v-72aefa1b="">Savor fresh assorted sliders and skewers onboard a yacht in the Dubai Marina</li>\r\n<li class="activity-highlights__list-item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline;" data-v-72aefa1b="">Enjoy a selection of club classics played by an onboard DJ</li>\r\n<li class="activity-highlights__list-item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline;" data-v-72aefa1b="">Have the chance to savor unlimited refreshing beverages</li>\r\n<li class="activity-highlights__list-item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline;" data-v-72aefa1b="">Take advantage of the free Wi-Fi connection aboard the boat</li>\r\n<li class="activity-highlights__list-item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline;" data-v-72aefa1b="">Admire the beauty of the Dubai skyline as it is lit for the night</li>\r\n</ul>	<p>no cancellation</p>	<p>faq</p>	<div class="activity-important-information__content" style="box-sizing: border-box; border: 0px; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px; margin: 0px 0px 24px; padding: 0px; vertical-align: baseline; color: #1a2b49;" data-v-fe6f5540="">\r\n<p class="activity-important-information__title" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: 1rem; margin: 0px 0px 8px; padding: 0px; vertical-align: baseline; line-height: 1.25rem;" data-v-fe6f5540="">What to bring</p>\r\n<section class="toggle-content" style="box-sizing: border-box; display: flex; flex-direction: column; position: relative; margin-bottom: 8px;" data-v-fe6f5540="" data-v-1740b522="">\r\n<div class="toggle-content__content" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline; display: inline-block; overflow: hidden; white-space-collapse: preserve; max-height: calc(var(--line-clamp-number) * var(--line-clamp-height)); text-overflow: ellipsis; --line-clamp-number: 4; --line-clamp-height: 22px;" data-v-1740b522="">\r\n<ul class="activity-important-information__list to-bring" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px 0px 0px 18px; vertical-align: baseline; list-style-position: outside; list-style-image: initial;" data-v-fe6f5540="">\r\n<li class="activity-important-information__item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline; white-space-collapse: collapse;" data-v-fe6f5540="">Passport</li>\r\n</ul>\r\n</div>\r\n</section>\r\n</div>\r\n<div class="activity-important-information__content" style="box-sizing: border-box; border: 0px; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px; margin: 0px 0px 24px; padding: 0px; vertical-align: baseline; color: #1a2b49;" data-v-fe6f5540="">\r\n<p class="activity-important-information__title" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: 1rem; margin: 0px 0px 8px; padding: 0px; vertical-align: baseline; line-height: 1.25rem;" data-v-fe6f5540="">Know before you go</p>\r\n<section class="toggle-content" style="box-sizing: border-box; display: flex; flex-direction: column; position: relative; margin-bottom: 8px;" data-v-fe6f5540="" data-v-1740b522="">\r\n<div class="toggle-content__content" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline; display: inline-block; overflow: hidden; white-space-collapse: preserve; max-height: calc(var(--line-clamp-number) * var(--line-clamp-height)); text-overflow: ellipsis; --line-clamp-number: 4; --line-clamp-height: 22px;" data-v-1740b522="">\r\n<ul class="activity-important-information__list good-to-know" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px 0px 0px 18px; vertical-align: baseline; list-style-position: outside; list-style-image: initial;" data-v-fe6f5540="">\r\n<li class="activity-important-information__item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline; white-space-collapse: collapse;" data-v-fe6f5540="">Yacht selection will vary depending on weather conditions and/or capacity requirements</li>\r\n<li class="activity-important-information__item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline; white-space-collapse: collapse;" data-v-fe6f5540="">This tour is for those aged 21 years and above</li>\r\n</ul>\r\n</div>\r\n</section>\r\n</div>	Dubai International Airport (DXB) - Dubai - United Arab Emirates	\N	5	2024-05-13 11:10:26	2024-05-13 11:18:05	\N	1200.00	25.2566932	55.36431779999999	1	\N
3	8	Gathering Party	2000.00	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	663Q+25V - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates	\N	4	2024-05-14 14:44:33	2024-05-14 21:43:42	\N	1500.00	25.202528042224237	55.23835825372313	1	\N
1	4	Birthday Package 1	120.00	<p>testingggg</p>	<p>testingggg</p>	<p>testingggg</p>	<p>testingggg</p>	<p>testingggg</p>	<p>testingggg</p>	<p>testingggg</p>	<p>testingggg</p>	dubai	\N	2	2024-04-18 02:50:35	2024-05-15 00:00:19	\N	100.00	25.204819	55.270931	1	\N
\.


--
-- Data for Name: vendor_user_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_user_details (id, user_id, username, logo, trade_license, date_of_birth, lattitude, longitude, location_name, account_type, company_name, family_name, nationality, hear_about_us_id, gender, is_represent, rep_name, rep_email, rep_dial_code, rep_phone, created_at, updated_at) FROM stdin;
1	4	\N	6636338e8a86e_1714828174.jpg	6636338e8dc91_1714828174.pdf	\N	234235	34365645	Al Safa St Downtown Dubai - Dubai United Arab Emirates	company	Party Cruise	\N	\N	\N	\N	1	Anil	anilnavis@gmail.com	358	34564564646	2024-04-05 07:20:18	2024-05-04 17:09:34
2	7	marwanuae	\N	\N	1971-12-25	25.205906219113306	55.24406599450682	277 Jumeirah St - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates	individual	\N	Marwan Family	98	20	male	0	\N	\N	\N	\N	2024-05-05 16:20:40	2024-05-05 16:20:40
3	8	\N	66378a50aab48_1714915920.png	66378a50ac13c_1714915920.pdf	\N	25.0671146	55.1420671	348R+RR Dubai - United Arab Emirates	company	Royal Yatch	\N	\N	\N	\N	1	Khalfan	khalfan@gmail.com	93	45747776	2024-05-05 17:32:00	2024-05-05 17:32:00
4	11	wahabfun22	\N	\N	1993-05-19	0	0	no location	individual	\N	Khurram	164	16	male	0	\N	\N	\N	\N	2024-05-12 12:38:15	2024-05-12 12:38:15
5	12	\N	664080d1d1943_1715503313.jpg	\N	\N	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	company	Ibm 5	\N	\N	\N	\N	1	Abdul Wahab	wahabfun22@gmail.com	92	32145655	2024-05-12 12:40:34	2024-05-12 14:15:19
6	14	abdulkhan	\N	\N	1994-05-10	0	0	no location	individual	\N	Khans	164	2	male	0	\N	\N	\N	\N	2024-05-13 10:19:22	2024-05-13 10:19:47
7	15	\N	6641b48a69d74_1715582090.png	\N	\N	25.2566932	55.36431779999999	Dubai International Airport (DXB) - Dubai - United Arab Emirates	company	Oxy Zen	\N	\N	\N	\N	1	Khan Ahmed	wahab3333@gmail.com	92	6547894	2024-05-13 10:34:50	2024-05-13 10:34:50
8	17	\N	664317c809264_1715673032.jpg	664317c80a8b9_1715673032.jpg	\N	22.5743545	88.3628734	H9F7+P4X, Calcutta University, College Square, Kolkata, West Bengal 700012, India	company	Elite Diamond	\N	\N	\N	\N	0	\N	\N	\N	\N	2024-05-14 11:50:32	2024-05-14 11:50:32
9	33	wahabvendor223	\N	\N	1993-04-06	0	0	no location	individual	\N	Khurram	1	1	male	0	\N	\N	\N	\N	2024-05-28 09:09:53	2024-05-28 09:09:53
10	45	hunain_88	\N	\N	2024-06-03	0	0	no location	individual	\N	Developer	229	4	male	0	\N	\N	\N	\N	2024-06-03 13:07:06	2024-06-03 13:07:06
11	46	wahabvendor2231	\N	\N	\N	0	0	no location	individual	\N	Khurram	1	1	male	0	\N	\N	\N	\N	2024-06-03 22:48:04	2024-06-03 22:48:04
12	47	moin2	\N	\N	\N	0	0	no location	individual	\N	abc	1	1	male	0	\N	\N	\N	\N	2024-06-04 00:55:04	2024-06-04 00:55:04
\.


--
-- Data for Name: yacht_attach_facilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.yacht_attach_facilities (id, yacht_id, facility_id) FROM stdin;
1	8	1
2	8	2
3	8	3
4	9	1
5	9	2
6	9	3
7	10	1
8	10	2
9	10	3
10	12	1
11	12	2
12	12	3
13	13	3
14	13	4
15	13	7
16	14	8
17	14	9
18	6	4
19	6	5
20	6	6
21	15	6
24	15	8
25	15	5
26	16	3
27	16	5
28	16	7
29	17	4
30	17	6
31	17	8
32	18	3
33	18	5
34	18	6
35	18	9
36	19	3
37	19	5
38	19	7
39	20	3
40	20	4
41	20	5
42	20	6
43	20	8
\.


--
-- Data for Name: yacht_offers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.yacht_offers (id, yacht_id, name, description, price, offer_price, image, status, created_at, updated_at, deleted_at) FROM stdin;
1	2	Offer 2	<p><strong>Testing&nbsp;</strong></p>	500.00	200.00	663aeab22f32f_1715137202.jpg	1	2024-05-08 07:00:02	2024-05-13 01:37:26	\N
3	6	Birthday Offer	testing	100.00	0.00	6660837e52ecf_1717601150.png	1	2024-06-05 19:25:50	2024-06-05 19:25:50	\N
2	6	Special offer	testing	40.00	20.00	666030354ad45_1717579829.png	1	2024-06-05 13:28:24	2024-06-05 20:47:01	\N
4	15	Test Offer E	Description Test Offer E	121.00	0.00	6660b27361115_1717613171.png	1	2024-06-05 21:21:27	2024-06-05 23:11:01	\N
\.


--
-- Data for Name: yacht_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.yacht_orders (id, order_number, user_id, yatch_id, location_name, lattitude, longitude, date, start_time, end_time, guests_adults, guests_children, booking_for, cstmr_title, cstmr_first_name, cstmr_last_name, cstmr_email, cstmr_dial_code, cstmr_phone, send_as_gift, rates_type, rate, total, tax, discount, payment_method, payment_id, status, created_at, updated_at, vendor_id) FROM stdin;
1	4431715588539	13	5	location	123	123	2024-05-13	1:00 PM	3:00 PM	1	0	myself	mr	\N	\N	\N	\N	\N	0	today	1.00	2.00	0.00	0.00	manual	\N	upcoming	2024-05-13 12:22:19	2024-05-13 12:22:19	15
2	9921715589698	13	5	location	123	123	2024-05-13	1:00 PM	3:00 PM	2	0	myself	mr	\N	\N	\N	\N	\N	0	Today -> Afternoon	1.00	2.00	0.00	0.00	manual	\N	confirmed	2024-05-13 12:41:38	2024-05-13 15:20:09	15
3	9191715589763	13	5	location	123	123	2024-05-13	12:00 PM	3:00 PM	2	0	myself	mr	\N	\N	\N	\N	\N	0	Today -> Afternoon	30.00	90.00	0.00	0.00	manual	\N	upcoming	2024-05-13 12:42:43	2024-05-13 15:21:03	15
4	6711715771025	13	4	location	123	123	2024-05-24	10:00 AM	2:00 PM	1	0	myself	mr	\N	\N	\N	\N	\N	0	Normal Day -> Friday -> Afternoon	2000.00	8000.00	0.00	0.00	manual	\N	upcoming	2024-05-15 15:03:45	2024-05-15 15:03:45	8
5	4901715771256	13	4	location	123	123	2024-05-19	9:00 AM	12:00 PM	2	3	myself	mr	\N	\N	\N	\N	\N	0	Normal Day -> Sunday -> Morning	1000.00	3000.00	0.00	0.00	manual	\N	upcoming	2024-05-15 15:07:36	2024-05-15 15:07:36	8
6	6391715771458	6	4	location	123	123	2024-05-19	9:00 AM	12:00 PM	1	2	myself	mr	\N	\N	\N	\N	\N	0	Normal Day -> Sunday -> Morning	1000.00	3000.00	0.00	0.00	manual	\N	confirmed	2024-05-15 15:10:58	2024-05-15 15:13:10	8
\.


--
-- Data for Name: yacht_rates_schedules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.yacht_rates_schedules (id, yatch_id, sun, sun_1, sun_2, sun_3, sun_4, sun_5, sun_6, sun_7, sun_8, sun_9, sun_10, sun_11, sun_12, sun_13, sun_14, sun_15, sun_16, sun_17, sun_18, sun_19, sun_20, sun_21, sun_22, sun_23, sun_24, mon, mon_1, mon_2, mon_3, mon_4, mon_5, mon_6, mon_7, mon_8, mon_9, mon_10, mon_11, mon_12, mon_13, mon_14, mon_15, mon_16, mon_17, mon_18, mon_19, mon_20, mon_21, mon_22, mon_23, mon_24, tue, tue_1, tue_2, tue_3, tue_4, tue_5, tue_6, tue_7, tue_8, tue_9, tue_10, tue_11, tue_12, tue_13, tue_14, tue_15, tue_16, tue_17, tue_18, tue_19, tue_20, tue_21, tue_22, tue_23, tue_24, wed, wed_1, wed_2, wed_3, wed_4, wed_5, wed_6, wed_7, wed_8, wed_9, wed_10, wed_11, wed_12, wed_13, wed_14, wed_15, wed_16, wed_17, wed_18, wed_19, wed_20, wed_21, wed_22, wed_23, wed_24, thu, thu_1, thu_2, thu_3, thu_4, thu_5, thu_6, thu_7, thu_8, thu_9, thu_10, thu_11, thu_12, thu_13, thu_14, thu_15, thu_16, thu_17, thu_18, thu_19, thu_20, thu_21, thu_22, thu_23, thu_24, fri, fri_1, fri_2, fri_3, fri_4, fri_5, fri_6, fri_7, fri_8, fri_9, fri_10, fri_11, fri_12, fri_13, fri_14, fri_15, fri_16, fri_17, fri_18, fri_19, fri_20, fri_21, fri_22, fri_23, fri_24, sat, sat_1, sat_2, sat_3, sat_4, sat_5, sat_6, sat_7, sat_8, sat_9, sat_10, sat_11, sat_12, sat_13, sat_14, sat_15, sat_16, sat_17, sat_18, sat_19, sat_20, sat_21, sat_22, sat_23, sat_24, created_at, updated_at) FROM stdin;
1	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2024-04-13 20:58:57	2024-04-13 20:59:11
3	6	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2024-06-04 19:38:06	2024-06-05 00:44:50
4	15	t	t	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	t	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	f	f	f	t	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	f	f	f	f	f	2024-06-05 00:35:11	2024-06-05 01:48:30
5	18	f	f	f	f	f	f	f	f	f	t	t	t	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2024-07-15 08:18:34	2024-07-15 08:19:23
2	4	t	f	f	f	f	f	f	f	f	t	t	t	t	t	t	t	t	t	t	t	t	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	t	t	t	t	t	t	t	t	t	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2024-05-05 21:07:04	2024-05-11 14:06:06
\.


--
-- Data for Name: yacht_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.yacht_types (id, name, active, deleted, created_at, updated_at) FROM stdin;
1	long	0	1	2024-04-09 05:25:29	\N
2	Weekender Yacht	1	0	2024-04-09 05:25:31	2024-04-18 12:45:35
3	Cruiser Yacht	1	0	2024-04-18 12:46:03	\N
4	Luxury Yacht	1	0	2024-04-18 12:46:16	\N
5	Mega Yacht	1	0	2024-04-18 12:46:33	\N
6	Fishing Yacht	1	0	2024-04-18 12:46:51	\N
7	Giant Yacht	1	0	2024-04-19 15:20:26	\N
8	Testing	0	1	2024-05-12 10:38:14	2024-05-12 10:38:33
\.


--
-- Data for Name: yatch_photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.yatch_photos (id, yatch_id, filename, created_at, updated_at) FROM stdin;
3	2	6614d285465a4_1712640645.jpg	2024-04-09 05:30:45	2024-04-09 05:30:45
4	3	6614e2eab1043_1712644842.jpg	2024-04-09 06:40:42	2024-04-09 06:40:42
5	2	66363474e68aa_1714828404.jpg	2024-05-04 17:13:24	2024-05-04 17:13:24
6	2	66363474e902c_1714828404.jpg	2024-05-04 17:13:24	2024-05-04 17:13:24
7	2	66363474ea0b0_1714828404.jpg	2024-05-04 17:13:24	2024-05-04 17:13:24
8	2	66363474ea7e0_1714828404.jpg	2024-05-04 17:13:24	2024-05-04 17:13:24
9	4	66379f2aa9523_1714921258.jpg	2024-05-05 19:00:58	2024-05-05 19:00:58
10	4	66379f2aa9dfb_1714921258.jpg	2024-05-05 19:00:58	2024-05-05 19:00:58
11	4	66379f2aaa8c0_1714921258.jpg	2024-05-05 19:00:58	2024-05-05 19:00:58
12	4	66379f2aab158_1714921258.jpg	2024-05-05 19:00:58	2024-05-05 19:00:58
13	4	66379f2aab89a_1714921258.jpg	2024-05-05 19:00:58	2024-05-05 19:00:58
14	5	6641baac183a1_1715583660.jpg	2024-05-13 11:01:00	2024-05-13 11:01:00
15	5	6641baac198fe_1715583660.jpg	2024-05-13 11:01:00	2024-05-13 11:01:00
16	5	6641baac1a978_1715583660.jpg	2024-05-13 11:01:00	2024-05-13 11:01:00
17	5	6641baac1b082_1715583660.jpg	2024-05-13 11:01:00	2024-05-13 11:01:00
18	6	66431a8546981_1715673733.png	2024-05-14 12:02:13	2024-05-14 12:02:13
19	6	66431a85491b3_1715673733.png	2024-05-14 12:02:13	2024-05-14 12:02:13
20	6	66431a85498a6_1715673733.png	2024-05-14 12:02:13	2024-05-14 12:02:13
21	8	665ce94e45351_1717365070.jpg	2024-06-03 01:51:10	2024-06-03 01:51:10
22	10	665db0c24d21b_1717416130.png	2024-06-03 16:02:10	2024-06-03 16:02:10
23	10	665db0c24d6ce_1717416130.png	2024-06-03 16:02:10	2024-06-03 16:02:10
25	8	665db1a098d25_1717416352.png	2024-06-03 16:05:52	2024-06-03 16:05:52
26	12	665e3b6b48cd0_1717451627.png	2024-06-04 01:53:47	2024-06-04 01:53:47
27	12	665e3b6b4917a_1717451627.png	2024-06-04 01:53:47	2024-06-04 01:53:47
28	13	665e517f08f14_1717457279.png	2024-06-04 03:27:59	2024-06-04 03:27:59
30	14	665ecbf56c686_1717488629.png	2024-06-04 12:10:29	2024-06-04 12:10:29
31	14	665ecbf56cc3d_1717488629.png	2024-06-04 12:10:29	2024-06-04 12:10:29
33	15	665f56f492b4d_1717524212.png	2024-06-04 22:03:32	2024-06-04 22:03:32
34	15	665f56f492f51_1717524212.png	2024-06-04 22:03:32	2024-06-04 22:03:32
35	15	665f5c53dbc77_1717525587.png	2024-06-04 22:26:27	2024-06-04 22:26:27
36	16	66623434885f0_1717711924.jpg	2024-06-07 02:12:04	2024-06-07 02:12:04
37	16	666234348a3aa_1717711924.jpg	2024-06-07 02:12:04	2024-06-07 02:12:04
38	17	66623546506dd_1717712198.jpg	2024-06-07 02:16:38	2024-06-07 02:16:38
39	17	6662354652063_1717712198.jpg	2024-06-07 02:16:38	2024-06-07 02:16:38
40	18	6662993170c35_1717737777.jpg	2024-06-07 09:22:57	2024-06-07 09:22:57
41	19	666338115a87c_1717778449.jpg	2024-06-07 20:40:49	2024-06-07 20:40:49
42	20	666345ab14f7c_1717781931.jpg	2024-06-07 21:38:51	2024-06-07 21:38:51
\.


--
-- Data for Name: yatch_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.yatch_rates (id, yatch_id, type, date, mon_s, mon_e, mon_r, aft_s, aft_e, aft_r, eve_s, eve_e, eve_r, data, created_at, updated_at) FROM stdin;
1	2	n_day	\N	9	11	100.00	12	16	60.00	17	20	600.00	mon	2024-04-13 21:05:00	2024-04-13 21:05:00
6	2	s_day	2024-04-20	9	11	100.00	12	14	200.00	15	21	500.00	0	2024-04-13 21:20:30	2024-04-13 21:20:30
7	2	ovr_sd_nd	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-04-13 21:22:34	2024-04-13 21:22:34
11	4	s_day	2024-05-23	9	11	2000.00	12	15	4000.00	16	22	10000.00	0	2024-05-05 19:24:42	2024-05-05 19:24:42
9	4	ovr_nd	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-05-05 19:15:32	2024-05-06 09:14:16
12	4	n_day	\N	9:00 AM	12:00 PM	1000.00	12:00 PM	2:00 PM	2000.00	2:00 PM	9:00 PM	3000.00	fri	2024-05-11 09:49:59	2024-05-11 09:49:59
13	4	n_day	\N	9:00 AM	11:00 AM	1000.00	12:00 PM	3:00 PM	1500.00	3:00 PM	9:00 PM	3000.00	mon	2024-05-11 14:07:35	2024-05-11 14:07:35
15	5	t_day	2024-05-13	9:00 AM	12:00 PM	20.00	12:00 PM	4:00 PM	30.00	4:00 PM	11:00 PM	40.00	0	2024-05-13 12:21:33	2024-05-13 12:21:33
16	5	ovr_sd_nd	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-05-13 12:22:05	2024-05-13 12:22:05
17	4	n_day	\N	9:00 AM	12:00 PM	1000.00	12:00 PM	3:00 PM	2000.00	3:00 PM	10:00 PM	7000.00	sun	2024-05-15 19:29:37	2024-05-15 19:29:37
8	4	ovr_sd_nd	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-05-05 19:15:27	2024-05-15 19:31:48
19	6	s_day	2024-06-13	9:00 AM	12:00 PM	10.00	12:00 PM	4:00 PM	20.00	4:00 PM	11:00 PM	30.00	0	2024-06-05 10:53:34	2024-06-05 10:53:34
20	6	s_day	2024-06-15	9:00 AM	12:00 PM	10.00	12:00 PM	4:00 PM	20.00	4:00 PM	11:00 PM	30.00	0	2024-06-05 10:53:51	2024-06-05 10:53:51
21	6	n_day	\N	9:00 AM	12:00 PM	10.00	12:00 PM	4:00 PM	20.00	4:00 PM	11:00 PM	30.00	mon	2024-06-05 10:59:15	2024-06-05 10:59:41
22	6	n_day	\N	9:00 AM	12:00 PM	10.00	12:00 PM	4:00 PM	20.00	4:00 PM	11:00 PM	30.00	tue	2024-06-05 11:00:12	2024-06-05 11:00:12
\.


--
-- Data for Name: yatches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.yatches (id, user_id, name, capacity, size, rules, created_at, updated_at, location, latitude, longitude, type, document, captain_name, captain_dial_code, captain_phone, deleted_at, active, size_m2, size_ft2, year_refit) FROM stdin;
3	1	Test	100	50	dsdsd	2024-04-09 06:40:42	2024-04-09 06:40:42	Dubai	234235	 34365645	2	\N	Farhan	971	555555555555	\N	1	\N	\N	\N
2	4	Yatch 1	50	50	<p>sdssss dfsgdgdfg dsgsdgdfgf dgfdg</p>	2024-04-09 05:30:45	2024-05-04 17:13:24	Dubai	234235	 34365645	2	66363474dd506_1714828404.pdf	Maryam	93	5555555555	\N	1	\N	\N	\N
5	15	Voyager Elite Reef's Rhapsody 50ft Yacht	75 Guests	45 ft	<p style="-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-family: Roboto, HR, sans-serif; color: #323233; margin: 0px; font-size: 16.704px;">Premium vessel with gorgeous design for 17 people. Starting point &ndash; Dubai Marina.</p>\r\n<p style="-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-family: Roboto, HR, sans-serif; color: #323233; margin: 0px; font-size: 16.704px;">&nbsp;</p>\r\n<p style="-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-family: Roboto, HR, sans-serif; color: #323233; margin: 0px; font-size: 16.704px;">The best luxury yacht rental Dubai is providing our website. Our charter company has huge yachts and boats for rental in Dubai. The best charter deals and offers Dubai. The lower deck consists of three bedrooms, two twin bunk guest accommodations and one VIP ensuite with a King size bed. The Yacht Azimut 50 with flybridge (upper deck) for rent from Dubai Marina, near JBR, Palm Jumeirah.</p>\r\n<p style="-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-family: Roboto, HR, sans-serif; color: #323233; margin: 0px; font-size: 16.704px;">&nbsp;</p>\r\n<p style="-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-family: Roboto, HR, sans-serif; color: #323233; margin: 0px; font-size: 16.704px;">The yacht accommodates 17 persons and sleeps 6 persons in 3 cabins. You can rent it for a week or more weeks, or only for a 3-4 hours trip around Dubai famous sights and nearby Islands. The flybridge has ample seating, coupled with a large open space, ideal for parties or gatherings.</p>	2024-05-13 11:01:00	2024-05-13 11:01:32	Dubai International Airport (DXB) - Dubai - United Arab Emirates	25.2566932	55.36431779999999	4	6641baac15b6c_1715583660.pdf	Ahmed Khan	358	6874135	\N	1	\N	\N	\N
6	17	Elite Diamond Austin A-50 Yacht	100	100	<p><span style="white-space-collapse: preserve;">Welcome to Elite Rentals, where luxury meets unparalleled elegance in yacht rentals. We invite you to embark on a truly extraordinary experience aboard our exclusive category A - Diamond Yachts. Our commitment to excellence sets us apart from other yacht rental companies in Dubai, as we offer only the most prestigious yachts that cannot be compared in any way.<br /></span></p>	2024-05-14 12:02:13	2024-06-04 14:16:03	Fairlie Place Park of KMDA, 36, Strand Rd, Fairley Place, B.B.D. Bagh, Kolkata, West Bengal 700001, India	22.574869012065648	88.3452920202128	4	\N	NB Captain	91	9832831812	\N	1	\N	\N	\N
4	8	My Serenity	12	21m (70ft)	<p style="outline: 0px; box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 20px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 15px; line-height: inherit; font-family: Montserrat, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: #000000;">The 2017 Sunseeker 70ft yacht is a luxurious motor yacht, offering ample space and comfort for owners and guests. The yacht is approximately 70 feet in length and boasts a distinctive and modern exterior design, as well as a luxurious and functional interior.</p>\r\n<p style="outline: 0px; box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 20px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 15px; line-height: inherit; font-family: Montserrat, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: #000000;">The full-beam master suite is located at the aft of the yacht and includes a large bed, ample storage space, and an en-suite bathroom. VIP staterooms and additional guest cabins also have en-suite bathrooms, ensuring comfort for all guests. The yacht's exterior deck spaces are perfect for both relaxation and entertainment, with a large aft flybridge, a forward sunpad and lounge area, and dining and seating areas.</p>\r\n<p style="outline: 0px; box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 20px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 15px; line-height: inherit; font-family: Montserrat, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: #000000;">The yacht's fully equipped galley features modern appliances and ample counter space, making meal preparation a breeze. With air conditioning throughout and aaccess to tender, water toys, and audio and visual systems. It is powered by twin diesel engines, providing smooth and efficient performance, and has state-of-the-art navigation and safety systems for peace of mind while out at sea.</p>\r\n<p style="outline: 0px; box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 20px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 15px; line-height: inherit; font-family: Montserrat, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: #000000;">In conclusion, the 2017 Sunseeker 70ft yacht is a standout in the world of yachting, offering spacious living spaces, luxurious features, and impressive performance. Whether you're looking for a relaxing retreat or an adventure-filled getaway, this yacht is the perfect choice.</p>	2024-05-05 19:00:58	2024-05-15 19:22:26	34 Al Mamsha St - Jumeirah Beach Residence - Dubai - United Arab Emirates	234235	 34365645	4	66379f2aa6d55_1714921258.pdf	Johnn	93	463666647	\N	1	\N	\N	\N
17	45	test2	10	0	ba	2024-06-07 02:16:38	2024-06-07 02:16:38	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	33.51611929195096	73.11084570162603	2	\N	moin	93	54545464	\N	1	10	15	2027
10	14	Luxury Yacht	20 seats	0	Testing etc etc	2024-06-03 16:02:10	2024-06-03 16:02:10	462Q+26 Dubai - United Arab Emirates	25.1000998	55.2380812	1	665db0c2431f0_1717416130.pdf	Abdul Wahab	92	6541235	\N	1	10	15	2022
18	8	Sea breez	20	0	not appear, check that you don't already have the same app installed from the AppStore.  If an app with the same bundle identifier is already installed on the device from the AppStore, nothing will happen.	2024-06-07 09:22:57	2024-06-07 09:22:57	7HVH2746+39	25.184152905955827	55.26022762276609	3	\N	Anil.	971	546468464	\N	1	23	20	2011
19	45	test	10	0	This is test ipa	2024-06-07 20:40:49	2024-06-07 20:40:49	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	33.51611924914763	73.11084569979172	2	6663381157b65_1717778449.pdf	cap	93	815454545	\N	1	10	10	2024
8	14	Luxury Yacht	40 seats	0	Testing etc etc	2024-06-03 01:48:26	2024-06-03 16:05:52	462Q+26 Dubai - United Arab Emirates	25.1000998	55.2380812	1	665db1a096457_1717416352.pdf	Abdul Captain	92	6541235	\N	1	10	15	2022
20	45	moin	10	0	Abc	2024-06-07 21:38:51	2024-06-07 21:38:51	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	33.51611924914763	73.11084569979172	4	666345ab0aeb7_1717781931.pdf	abc	93	248454544545	\N	1	50	50	2024
9	14	Luxury Yacht	20 seats	0	Testing etc etc	2024-06-03 16:00:24	2024-06-03 16:20:14	462Q+26 Dubai - United Arab Emirates	25.1000998	55.2380812	1	\N	Abdul Wahab	92	6541235	\N	1	10	15	2022
12	14	Luxury Yacht	20 seats	0	Testing etc etc	2024-06-04 01:53:47	2024-06-04 01:53:47	462Q+26 Dubai - United Arab Emirates	25.1000998	55.2380812	1	665e3b6b3eea1_1717451627.pdf	Abdul Wahab	92	6541235	\N	1	10	15	2022
14	45	Test Dubai Luxury Yacht	45	0	Test Rulea	2024-06-04 12:10:29	2024-06-04 12:10:29	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	33.5668242	73.1368171	5	665ecbf5692cc_1717488629.pdf	Captain Name Test	971	36990852147	\N	1	85	125	2026
13	45	Yest Dubain Yacht	35	0	Test Rules	2024-06-04 03:27:59	2024-06-04 14:37:03	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	33.5164401	73.110848	4	\N	Test Captain Name	971	3690852147	\N	1	75	115	2023
15	45	Test Dubai Luxury Yacht Two E	60	0	Test Rules Test E	2024-06-04 22:03:32	2024-06-04 22:26:27	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	33.5164107	73.1108277	3	665f5c53d892d_1717525587.pdf	Yest Captain Name E	971	3669258122	\N	1	100	155	2026
16	45	test	10	0	test	2024-06-07 02:12:04	2024-06-07 02:12:04	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	33.51611929195096	73.11084570162603	2	\N	abc	93	23845431	\N	1	5	5	2024
\.


--
-- Name: addon_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addon_category_id_seq', 5, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articles_id_seq', 6, true);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 6, true);


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_seq', 242, true);


--
-- Name: customer_user_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_user_details_id_seq', 32, true);


--
-- Name: facilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facilities_id_seq', 10, true);


--
-- Name: facility_facility_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facility_facility_item_id_seq', 1, false);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: hear_about_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hear_about_us_id_seq', 20, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 59, true);


--
-- Name: package_media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.package_media_id_seq', 18, true);


--
-- Name: package_ord_addons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.package_ord_addons_id_seq', 6, true);


--
-- Name: package_ord_prods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.package_ord_prods_id_seq', 25, true);


--
-- Name: package_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.package_orders_id_seq', 9, true);


--
-- Name: package_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.package_products_id_seq', 49, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 104, true);


--
-- Name: product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_categories_id_seq', 6, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 16, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);


--
-- Name: temp_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_users_id_seq', 67, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 47, true);


--
-- Name: vendor_addons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_addons_id_seq', 5, true);


--
-- Name: vendor_facility_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_facility_groups_id_seq', 2, true);


--
-- Name: vendor_facility_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_facility_items_id_seq', 2, true);


--
-- Name: vendor_package_addons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_package_addons_id_seq', 11, true);


--
-- Name: vendor_package_attach_include_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_package_attach_include_id_seq', 3, true);


--
-- Name: vendor_package_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_package_categories_id_seq', 21, true);


--
-- Name: vendor_package_facilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_package_facilities_id_seq', 31, true);


--
-- Name: vendor_package_includes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_package_includes_id_seq', 5, true);


--
-- Name: vendor_packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_packages_id_seq', 3, true);


--
-- Name: vendor_user_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_user_details_id_seq', 12, true);


--
-- Name: yacht_attach_facilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yacht_attach_facilities_id_seq', 43, true);


--
-- Name: yacht_offers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yacht_offers_id_seq', 4, true);


--
-- Name: yacht_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yacht_orders_id_seq', 6, true);


--
-- Name: yacht_rates_schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yacht_rates_schedules_id_seq', 5, true);


--
-- Name: yacht_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yacht_types_id_seq', 8, true);


--
-- Name: yatch_photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yatch_photos_id_seq', 42, true);


--
-- Name: yatch_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yatch_rates_id_seq', 22, true);


--
-- Name: yatches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yatches_id_seq', 20, true);


--
-- Name: addon_category addon_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addon_category
    ADD CONSTRAINT addon_category_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: customer_user_details customer_user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_user_details
    ADD CONSTRAINT customer_user_details_pkey PRIMARY KEY (id);


--
-- Name: facilities facilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facilities
    ADD CONSTRAINT facilities_pkey PRIMARY KEY (id);


--
-- Name: facility_facility_item facility_facility_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_facility_item
    ADD CONSTRAINT facility_facility_item_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: hear_about_us hear_about_us_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hear_about_us
    ADD CONSTRAINT hear_about_us_pkey PRIMARY KEY (id);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: package_media package_media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_media
    ADD CONSTRAINT package_media_pkey PRIMARY KEY (id);


--
-- Name: package_ord_addons package_ord_addons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_ord_addons
    ADD CONSTRAINT package_ord_addons_pkey PRIMARY KEY (id);


--
-- Name: package_ord_prods package_ord_prods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_ord_prods
    ADD CONSTRAINT package_ord_prods_pkey PRIMARY KEY (id);


--
-- Name: package_orders package_orders_order_number_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_orders
    ADD CONSTRAINT package_orders_order_number_unique UNIQUE (order_number);


--
-- Name: package_orders package_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_orders
    ADD CONSTRAINT package_orders_pkey PRIMARY KEY (id);


--
-- Name: package_products package_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_products
    ADD CONSTRAINT package_products_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: settings settings_meta_key_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_meta_key_unique UNIQUE (meta_key);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: temp_users temp_users_phone_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users
    ADD CONSTRAINT temp_users_phone_unique UNIQUE (phone);


--
-- Name: temp_users temp_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users
    ADD CONSTRAINT temp_users_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_unique UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vendor_addons vendor_addons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_addons
    ADD CONSTRAINT vendor_addons_pkey PRIMARY KEY (id);


--
-- Name: vendor_facility_groups vendor_facility_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_facility_groups
    ADD CONSTRAINT vendor_facility_groups_pkey PRIMARY KEY (id);


--
-- Name: vendor_facility_items vendor_facility_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_facility_items
    ADD CONSTRAINT vendor_facility_items_pkey PRIMARY KEY (id);


--
-- Name: vendor_package_addons vendor_package_addons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_package_addons
    ADD CONSTRAINT vendor_package_addons_pkey PRIMARY KEY (id);


--
-- Name: vendor_package_attach_include vendor_package_attach_include_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_package_attach_include
    ADD CONSTRAINT vendor_package_attach_include_pkey PRIMARY KEY (id);


--
-- Name: vendor_package_categories vendor_package_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_package_categories
    ADD CONSTRAINT vendor_package_categories_pkey PRIMARY KEY (id);


--
-- Name: vendor_package_facilities vendor_package_facilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_package_facilities
    ADD CONSTRAINT vendor_package_facilities_pkey PRIMARY KEY (id);


--
-- Name: vendor_package_includes vendor_package_includes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_package_includes
    ADD CONSTRAINT vendor_package_includes_pkey PRIMARY KEY (id);


--
-- Name: vendor_packages vendor_packages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_packages
    ADD CONSTRAINT vendor_packages_pkey PRIMARY KEY (id);


--
-- Name: vendor_user_details vendor_user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_user_details
    ADD CONSTRAINT vendor_user_details_pkey PRIMARY KEY (id);


--
-- Name: yacht_attach_facilities yacht_attach_facilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yacht_attach_facilities
    ADD CONSTRAINT yacht_attach_facilities_pkey PRIMARY KEY (id);


--
-- Name: yacht_offers yacht_offers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yacht_offers
    ADD CONSTRAINT yacht_offers_pkey PRIMARY KEY (id);


--
-- Name: yacht_orders yacht_orders_order_number_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yacht_orders
    ADD CONSTRAINT yacht_orders_order_number_unique UNIQUE (order_number);


--
-- Name: yacht_orders yacht_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yacht_orders
    ADD CONSTRAINT yacht_orders_pkey PRIMARY KEY (id);


--
-- Name: yacht_rates_schedules yacht_rates_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yacht_rates_schedules
    ADD CONSTRAINT yacht_rates_schedules_pkey PRIMARY KEY (id);


--
-- Name: yacht_types yacht_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yacht_types
    ADD CONSTRAINT yacht_types_pkey PRIMARY KEY (id);


--
-- Name: yatch_photos yatch_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yatch_photos
    ADD CONSTRAINT yatch_photos_pkey PRIMARY KEY (id);


--
-- Name: yatch_rates yatch_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yatch_rates
    ADD CONSTRAINT yatch_rates_pkey PRIMARY KEY (id);


--
-- Name: yatches yatches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yatches
    ADD CONSTRAINT yatches_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: package_ord_addons_order_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX package_ord_addons_order_id_index ON public.package_ord_addons USING btree (order_id);


--
-- Name: package_ord_prods_order_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX package_ord_prods_order_id_index ON public.package_ord_prods USING btree (order_id);


--
-- Name: package_orders_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX package_orders_user_id_index ON public.package_orders USING btree (user_id);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: products_category_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_category_id_index ON public.products USING btree (category_id);


--
-- Name: products_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_user_id_index ON public.products USING btree (user_id);


--
-- Name: temp_users_access_token_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX temp_users_access_token_index ON public.temp_users USING btree (access_token);


--
-- Name: temp_users_dial_code_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX temp_users_dial_code_index ON public.temp_users USING btree (dial_code);


--
-- Name: temp_users_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX temp_users_email_index ON public.temp_users USING btree (email);


--
-- Name: temp_users_phone_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX temp_users_phone_index ON public.temp_users USING btree (phone);


--
-- Name: users_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_id_index ON public.users USING btree (id);


--
-- Name: users_password_reset_code_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_password_reset_code_index ON public.users USING btree (password_reset_code);


--
-- Name: vendor_package_addons_vendor_package_id_addon_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_package_addons_vendor_package_id_addon_id_index ON public.vendor_package_addons USING btree (vendor_package_id, addon_id);


--
-- Name: vendor_package_attach_include_vendor_package_id_include_id_inde; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_package_attach_include_vendor_package_id_include_id_inde ON public.vendor_package_attach_include USING btree (vendor_package_id, include_id);


--
-- Name: vendor_package_categories_vendor_package_id_category_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_package_categories_vendor_package_id_category_id_index ON public.vendor_package_categories USING btree (vendor_package_id, category_id);


--
-- Name: vendor_package_facilities_vendor_package_id_facility_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_package_facilities_vendor_package_id_facility_id_index ON public.vendor_package_facilities USING btree (vendor_package_id, facility_id);


--
-- Name: yacht_attach_facilities_yacht_id_facility_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX yacht_attach_facilities_yacht_id_facility_id_index ON public.yacht_attach_facilities USING btree (yacht_id, facility_id);


--
-- Name: yacht_offers_offer_price_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX yacht_offers_offer_price_index ON public.yacht_offers USING btree (offer_price);


--
-- Name: yacht_offers_price_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX yacht_offers_price_index ON public.yacht_offers USING btree (price);


--
-- Name: yacht_offers_yacht_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX yacht_offers_yacht_id_index ON public.yacht_offers USING btree (yacht_id);


--
-- Name: yacht_orders_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX yacht_orders_user_id_index ON public.yacht_orders USING btree (user_id);


--
-- Name: yatch_rates_yatch_id_type_data_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX yatch_rates_yatch_id_type_data_date_index ON public.yatch_rates USING btree (yatch_id, type, data, date);


--
-- Name: customer_user_details customer_user_details_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_user_details
    ADD CONSTRAINT customer_user_details_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: facility_facility_item facility_facility_item_facility_groups_model_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_facility_item
    ADD CONSTRAINT facility_facility_item_facility_groups_model_id_foreign FOREIGN KEY (facility_groups_model_id) REFERENCES public.vendor_facility_groups(id) ON DELETE CASCADE;


--
-- Name: facility_facility_item facility_facility_item_facility_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_facility_item
    ADD CONSTRAINT facility_facility_item_facility_item_id_foreign FOREIGN KEY (facility_item_id) REFERENCES public.vendor_facility_items(id) ON DELETE CASCADE;


--
-- Name: package_media package_media_vendor_package_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_media
    ADD CONSTRAINT package_media_vendor_package_id_foreign FOREIGN KEY (vendor_package_id) REFERENCES public.vendor_packages(id) ON DELETE CASCADE;


--
-- Name: package_ord_addons package_ord_addons_addon_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_ord_addons
    ADD CONSTRAINT package_ord_addons_addon_id_foreign FOREIGN KEY (addon_id) REFERENCES public.vendor_addons(id) ON DELETE CASCADE;


--
-- Name: package_ord_addons package_ord_addons_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_ord_addons
    ADD CONSTRAINT package_ord_addons_order_id_foreign FOREIGN KEY (order_id) REFERENCES public.package_orders(id) ON DELETE CASCADE;


--
-- Name: package_ord_prods package_ord_prods_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_ord_prods
    ADD CONSTRAINT package_ord_prods_order_id_foreign FOREIGN KEY (order_id) REFERENCES public.package_orders(id) ON DELETE CASCADE;


--
-- Name: package_ord_prods package_ord_prods_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_ord_prods
    ADD CONSTRAINT package_ord_prods_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: package_orders package_orders_package_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_orders
    ADD CONSTRAINT package_orders_package_id_foreign FOREIGN KEY (package_id) REFERENCES public.vendor_packages(id) ON DELETE CASCADE;


--
-- Name: package_orders package_orders_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_orders
    ADD CONSTRAINT package_orders_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: package_orders package_orders_vendor_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_orders
    ADD CONSTRAINT package_orders_vendor_id_foreign FOREIGN KEY (vendor_id) REFERENCES public.users(id);


--
-- Name: package_products package_products_package_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_products
    ADD CONSTRAINT package_products_package_id_foreign FOREIGN KEY (package_id) REFERENCES public.vendor_packages(id) ON DELETE CASCADE;


--
-- Name: package_products package_products_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.package_products
    ADD CONSTRAINT package_products_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: product_categories product_categories_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: products products_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.product_categories(id) ON DELETE CASCADE;


--
-- Name: products products_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: vendor_addons vendor_addons_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_addons
    ADD CONSTRAINT vendor_addons_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: vendor_facility_groups vendor_facility_groups_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_facility_groups
    ADD CONSTRAINT vendor_facility_groups_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: vendor_facility_items vendor_facility_items_facility_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_facility_items
    ADD CONSTRAINT vendor_facility_items_facility_group_id_foreign FOREIGN KEY (facility_group_id) REFERENCES public.vendor_facility_groups(id) ON DELETE CASCADE;


--
-- Name: vendor_package_addons vendor_package_addons_addon_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_package_addons
    ADD CONSTRAINT vendor_package_addons_addon_id_foreign FOREIGN KEY (addon_id) REFERENCES public.vendor_addons(id) ON DELETE CASCADE;


--
-- Name: vendor_package_addons vendor_package_addons_vendor_package_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_package_addons
    ADD CONSTRAINT vendor_package_addons_vendor_package_id_foreign FOREIGN KEY (vendor_package_id) REFERENCES public.vendor_packages(id) ON DELETE CASCADE;


--
-- Name: vendor_package_attach_include vendor_package_attach_include_include_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_package_attach_include
    ADD CONSTRAINT vendor_package_attach_include_include_id_foreign FOREIGN KEY (include_id) REFERENCES public.vendor_package_includes(id) ON DELETE CASCADE;


--
-- Name: vendor_package_attach_include vendor_package_attach_include_vendor_package_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_package_attach_include
    ADD CONSTRAINT vendor_package_attach_include_vendor_package_id_foreign FOREIGN KEY (vendor_package_id) REFERENCES public.vendor_packages(id) ON DELETE CASCADE;


--
-- Name: vendor_package_categories vendor_package_categories_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_package_categories
    ADD CONSTRAINT vendor_package_categories_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.category(id) ON DELETE CASCADE;


--
-- Name: vendor_package_categories vendor_package_categories_vendor_package_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_package_categories
    ADD CONSTRAINT vendor_package_categories_vendor_package_id_foreign FOREIGN KEY (vendor_package_id) REFERENCES public.vendor_packages(id) ON DELETE CASCADE;


--
-- Name: vendor_package_facilities vendor_package_facilities_facility_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_package_facilities
    ADD CONSTRAINT vendor_package_facilities_facility_id_foreign FOREIGN KEY (facility_id) REFERENCES public.facilities(id) ON DELETE CASCADE;


--
-- Name: vendor_package_facilities vendor_package_facilities_vendor_package_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_package_facilities
    ADD CONSTRAINT vendor_package_facilities_vendor_package_id_foreign FOREIGN KEY (vendor_package_id) REFERENCES public.vendor_packages(id) ON DELETE CASCADE;


--
-- Name: vendor_package_includes vendor_package_includes_vendor_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_package_includes
    ADD CONSTRAINT vendor_package_includes_vendor_user_id_foreign FOREIGN KEY (vendor_user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: vendor_packages vendor_packages_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_packages
    ADD CONSTRAINT vendor_packages_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: vendor_packages vendor_packages_yatch_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_packages
    ADD CONSTRAINT vendor_packages_yatch_id_foreign FOREIGN KEY (yatch_id) REFERENCES public.yatches(id) ON DELETE SET NULL;


--
-- Name: vendor_user_details vendor_user_details_hear_about_us_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_user_details
    ADD CONSTRAINT vendor_user_details_hear_about_us_id_foreign FOREIGN KEY (hear_about_us_id) REFERENCES public.hear_about_us(id) ON DELETE CASCADE;


--
-- Name: vendor_user_details vendor_user_details_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_user_details
    ADD CONSTRAINT vendor_user_details_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: yacht_offers yacht_offers_yacht_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yacht_offers
    ADD CONSTRAINT yacht_offers_yacht_id_foreign FOREIGN KEY (yacht_id) REFERENCES public.yatches(id) ON DELETE CASCADE;


--
-- Name: yacht_orders yacht_orders_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yacht_orders
    ADD CONSTRAINT yacht_orders_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: yacht_orders yacht_orders_vendor_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yacht_orders
    ADD CONSTRAINT yacht_orders_vendor_id_foreign FOREIGN KEY (vendor_id) REFERENCES public.users(id);


--
-- Name: yacht_orders yacht_orders_yatch_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yacht_orders
    ADD CONSTRAINT yacht_orders_yatch_id_foreign FOREIGN KEY (yatch_id) REFERENCES public.yatches(id) ON DELETE SET NULL;


--
-- Name: yacht_rates_schedules yacht_rates_schedules_yatch_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yacht_rates_schedules
    ADD CONSTRAINT yacht_rates_schedules_yatch_id_foreign FOREIGN KEY (yatch_id) REFERENCES public.yatches(id) ON DELETE CASCADE;


--
-- Name: yatch_photos yatch_photos_yatch_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yatch_photos
    ADD CONSTRAINT yatch_photos_yatch_id_foreign FOREIGN KEY (yatch_id) REFERENCES public.yatches(id) ON DELETE CASCADE;


--
-- Name: yatch_rates yatch_rates_yatch_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yatch_rates
    ADD CONSTRAINT yatch_rates_yatch_id_foreign FOREIGN KEY (yatch_id) REFERENCES public.yatches(id) ON DELETE CASCADE;


--
-- Name: yatches yatches_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yatches
    ADD CONSTRAINT yatches_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

