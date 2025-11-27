--
-- PostgreSQL database dump
--

-- Dumped from database version 12.21 (Ubuntu 12.21-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.9 (Ubuntu 15.9-1.pgdg20.04+1)

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
-- Name: booking_addons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_addons (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    addon_id integer NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.booking_addons OWNER TO postgres;

--
-- Name: booking_addons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_addons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_addons_id_seq OWNER TO postgres;

--
-- Name: booking_addons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_addons_id_seq OWNED BY public.booking_addons.id;


--
-- Name: booking_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_products (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.booking_products OWNER TO postgres;

--
-- Name: booking_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_products_id_seq OWNER TO postgres;

--
-- Name: booking_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_products_id_seq OWNED BY public.booking_products.id;


--
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    booking_type character varying(255) DEFAULT 'package'::character varying NOT NULL,
    booking_id character varying(255) NOT NULL,
    yatch_id integer NOT NULL,
    package_id integer DEFAULT 0 NOT NULL,
    booking_date date NOT NULL,
    slot_from time(0) without time zone NOT NULL,
    slot_to time(0) without time zone NOT NULL,
    no_of_adults integer DEFAULT 0 NOT NULL,
    no_of_children integer DEFAULT 0 NOT NULL,
    special_requests text,
    payment_mode integer DEFAULT 0 NOT NULL,
    sub_total double precision DEFAULT '0'::double precision NOT NULL,
    tax double precision DEFAULT '0'::double precision NOT NULL,
    tax_percentage double precision DEFAULT '0'::double precision NOT NULL,
    grand_total double precision DEFAULT '0'::double precision NOT NULL,
    add_on_total double precision DEFAULT '0'::double precision NOT NULL,
    need_update_on_email_whatsap integer DEFAULT 1 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    created_for integer DEFAULT 1 NOT NULL,
    profile_title character varying(255) NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255),
    dial_code character varying(255),
    phone_number character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    offer_id integer DEFAULT 0 NOT NULL,
    discount double precision DEFAULT '0'::double precision NOT NULL,
    booking_status integer DEFAULT 0 NOT NULL,
    is_manual integer DEFAULT 0 NOT NULL,
    provider_user_id integer DEFAULT 0 NOT NULL,
    extra_product_prices double precision DEFAULT '0'::double precision NOT NULL,
    coupon_id integer DEFAULT 0 NOT NULL,
    coupon_discount_amount double precision DEFAULT '0'::double precision NOT NULL,
    payment_type integer DEFAULT 2 NOT NULL,
    coupon_discount double precision DEFAULT '0'::double precision NOT NULL,
    is_reviewed integer DEFAULT 0 NOT NULL,
    rating double precision DEFAULT '0'::double precision NOT NULL,
    review text,
    refund integer DEFAULT 0 NOT NULL,
    reschedule_reason text,
    cancel_reason text,
    package_extra_hours integer DEFAULT 0 NOT NULL,
    reschedule_price double precision DEFAULT '0'::double precision NOT NULL,
    new_grand_total double precision DEFAULT '0'::double precision NOT NULL,
    reschedule_refund_amount double precision DEFAULT '0'::double precision NOT NULL,
    is_rescheduled integer DEFAULT 0 NOT NULL,
    reschedule_tax double precision DEFAULT '0'::double precision NOT NULL,
    reschedule_extra_hours_price double precision DEFAULT '0'::double precision NOT NULL,
    refund_choice character varying(255),
    refund_percentage double precision DEFAULT '0'::double precision NOT NULL
);


ALTER TABLE public.bookings OWNER TO postgres;

--
-- Name: bookings_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings_history (
    id bigint NOT NULL,
    booking_id bigint NOT NULL,
    reason text NOT NULL,
    type character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.bookings_history OWNER TO postgres;

--
-- Name: bookings_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bookings_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bookings_history_id_seq OWNER TO postgres;

--
-- Name: bookings_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bookings_history_id_seq OWNED BY public.bookings_history.id;


--
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bookings_id_seq OWNER TO postgres;

--
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bookings_id_seq OWNED BY public.bookings.id;


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
-- Name: category_texts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category_texts (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    category_id integer NOT NULL,
    description text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.category_texts OWNER TO postgres;

--
-- Name: category_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_texts_id_seq OWNER TO postgres;

--
-- Name: category_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_texts_id_seq OWNED BY public.category_texts.id;


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
-- Name: coupon_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupon_categories (
    id bigint NOT NULL,
    coupon_id integer NOT NULL,
    category_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.coupon_categories OWNER TO postgres;

--
-- Name: coupon_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupon_categories_id_seq OWNER TO postgres;

--
-- Name: coupon_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_categories_id_seq OWNED BY public.coupon_categories.id;


--
-- Name: coupon_packages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupon_packages (
    id bigint NOT NULL,
    coupon_id integer NOT NULL,
    package_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.coupon_packages OWNER TO postgres;

--
-- Name: coupon_packages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_packages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupon_packages_id_seq OWNER TO postgres;

--
-- Name: coupon_packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_packages_id_seq OWNED BY public.coupon_packages.id;


--
-- Name: coupon_yatches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupon_yatches (
    id bigint NOT NULL,
    coupon_id integer NOT NULL,
    yatch_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.coupon_yatches OWNER TO postgres;

--
-- Name: coupon_yatches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_yatches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupon_yatches_id_seq OWNER TO postgres;

--
-- Name: coupon_yatches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_yatches_id_seq OWNED BY public.coupon_yatches.id;


--
-- Name: coupons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupons (
    id bigint NOT NULL,
    coupon_title character varying(255),
    coupon_code character varying(255),
    coupon_description text,
    coupon_start_date date,
    coupon_end_date date,
    amount_type integer DEFAULT 0 NOT NULL,
    coupon_amount double precision DEFAULT '0'::double precision NOT NULL,
    minimum_amount double precision DEFAULT '0'::double precision NOT NULL,
    coupon_minimum_spend double precision DEFAULT '0'::double precision NOT NULL,
    coupon_maximum_spend double precision DEFAULT '0'::double precision NOT NULL,
    usage_per_coupon integer,
    usage_per_user integer,
    provider_id text NOT NULL,
    coupon_status integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    applied_to character varying(255) DEFAULT 'package'::character varying NOT NULL,
    yatch_id character varying(255)
);


ALTER TABLE public.coupons OWNER TO postgres;

--
-- Name: COLUMN coupons.applied_to; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.coupons.applied_to IS 'package,yatch,package_category';


--
-- Name: coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupons_id_seq OWNER TO postgres;

--
-- Name: coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupons_id_seq OWNED BY public.coupons.id;


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
    profile_picture character varying(255),
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
-- Name: faq; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faq (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    created_by integer DEFAULT 0 NOT NULL,
    updated_by integer DEFAULT 0 NOT NULL,
    active integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.faq OWNER TO postgres;

--
-- Name: faq_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.faq_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faq_id_seq OWNER TO postgres;

--
-- Name: faq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faq_id_seq OWNED BY public.faq.id;


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
-- Name: help; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.help (
    id bigint NOT NULL,
    title character varying(600),
    description text,
    created_by integer DEFAULT 0 NOT NULL,
    updated_by integer DEFAULT 0 NOT NULL,
    active integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.help OWNER TO postgres;

--
-- Name: help_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.help_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.help_id_seq OWNER TO postgres;

--
-- Name: help_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.help_id_seq OWNED BY public.help.id;


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
-- Name: modify_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modify_requests (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    request_title text,
    remark text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.modify_requests OWNER TO postgres;

--
-- Name: modify_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modify_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modify_requests_id_seq OWNER TO postgres;

--
-- Name: modify_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modify_requests_id_seq OWNED BY public.modify_requests.id;


--
-- Name: package_media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.package_media (
    id bigint NOT NULL,
    filename character varying(255) NOT NULL,
    vendor_package_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    file_type character varying(255) DEFAULT 'image'::character varying NOT NULL
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
    updated_at timestamp(0) without time zone,
    description text
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
-- Name: socialdetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialdetails (
    id bigint NOT NULL,
    title_en character varying(255) NOT NULL,
    title_ar character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    mobile character varying(255) NOT NULL,
    desc_en text NOT NULL,
    desc_ar text NOT NULL,
    location character varying(255) NOT NULL,
    latitude character varying(255),
    longitude character varying(255),
    twitter character varying(255),
    instagram character varying(255),
    facebook character varying(255),
    youtube character varying(255),
    linkedin character varying(255),
    website_url character varying(255),
    snap_chat character varying(255),
    tiktok character varying(255),
    cancellation_hours integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.socialdetails OWNER TO postgres;

--
-- Name: socialdetails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialdetails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialdetails_id_seq OWNER TO postgres;

--
-- Name: socialdetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialdetails_id_seq OWNED BY public.socialdetails.id;


--
-- Name: special_day_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.special_day_rates (
    id bigint NOT NULL,
    yatch_id integer NOT NULL,
    date date NOT NULL,
    morning_from time(0) without time zone,
    morning_to time(0) without time zone,
    morning_rate double precision DEFAULT '0'::double precision NOT NULL,
    afternoon_from time(0) without time zone,
    afternoon_to time(0) without time zone,
    afternoon_rate double precision DEFAULT '0'::double precision NOT NULL,
    evening_from time(0) without time zone,
    evening_to time(0) without time zone,
    evening_rate double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.special_day_rates OWNER TO postgres;

--
-- Name: special_day_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.special_day_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.special_day_rates_id_seq OWNER TO postgres;

--
-- Name: special_day_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.special_day_rates_id_seq OWNED BY public.special_day_rates.id;


--
-- Name: temp_booking_addons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_booking_addons (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    addon_id integer NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.temp_booking_addons OWNER TO postgres;

--
-- Name: temp_booking_addons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_booking_addons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_booking_addons_id_seq OWNER TO postgres;

--
-- Name: temp_booking_addons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_booking_addons_id_seq OWNED BY public.temp_booking_addons.id;


--
-- Name: temp_booking_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_booking_products (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.temp_booking_products OWNER TO postgres;

--
-- Name: temp_booking_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_booking_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_booking_products_id_seq OWNER TO postgres;

--
-- Name: temp_booking_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_booking_products_id_seq OWNED BY public.temp_booking_products.id;


--
-- Name: temp_bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_bookings (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    booking_type character varying(255) DEFAULT 'package'::character varying NOT NULL,
    booking_id character varying(255) NOT NULL,
    yatch_id integer NOT NULL,
    package_id integer DEFAULT 0 NOT NULL,
    booking_date date NOT NULL,
    slot_from time(0) without time zone NOT NULL,
    slot_to time(0) without time zone NOT NULL,
    no_of_adults integer DEFAULT 0 NOT NULL,
    no_of_children integer DEFAULT 0 NOT NULL,
    special_requests text,
    payment_mode integer DEFAULT 0 NOT NULL,
    sub_total double precision DEFAULT '0'::double precision NOT NULL,
    tax double precision DEFAULT '0'::double precision NOT NULL,
    tax_percentage double precision DEFAULT '0'::double precision NOT NULL,
    grand_total double precision DEFAULT '0'::double precision NOT NULL,
    add_on_total double precision DEFAULT '0'::double precision NOT NULL,
    extra_product_prices double precision DEFAULT '0'::double precision NOT NULL,
    coupon_discount double precision DEFAULT '0'::double precision NOT NULL,
    need_update_on_email_whatsap integer DEFAULT 1 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    created_for integer DEFAULT 1 NOT NULL,
    profile_title character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255),
    dial_code character varying(255),
    phone_number character varying(255),
    offer_id integer DEFAULT 0 NOT NULL,
    discount double precision DEFAULT '0'::double precision NOT NULL,
    booking_status integer DEFAULT 0 NOT NULL,
    is_manual integer DEFAULT 0 NOT NULL,
    provider_user_id integer DEFAULT 0 NOT NULL,
    payment_type integer DEFAULT 0 NOT NULL,
    coupon_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    package_extra_hours integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.temp_bookings OWNER TO postgres;

--
-- Name: temp_bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_bookings_id_seq OWNER TO postgres;

--
-- Name: temp_bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_bookings_id_seq OWNED BY public.temp_bookings.id;


--
-- Name: temp_category_texts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_category_texts (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    category_id integer NOT NULL,
    description text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.temp_category_texts OWNER TO postgres;

--
-- Name: temp_category_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_category_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_category_texts_id_seq OWNER TO postgres;

--
-- Name: temp_category_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_category_texts_id_seq OWNED BY public.temp_category_texts.id;


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
-- Name: today_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.today_rates (
    id bigint NOT NULL,
    yatch_id integer NOT NULL,
    date date NOT NULL,
    morning_from time(0) without time zone,
    morning_to time(0) without time zone,
    morning_rate double precision DEFAULT '0'::double precision NOT NULL,
    afternoon_from time(0) without time zone,
    afternoon_to time(0) without time zone,
    afternoon_rate double precision DEFAULT '0'::double precision NOT NULL,
    evening_from time(0) without time zone,
    evening_to time(0) without time zone,
    evening_rate double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.today_rates OWNER TO postgres;

--
-- Name: today_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.today_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.today_rates_id_seq OWNER TO postgres;

--
-- Name: today_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.today_rates_id_seq OWNED BY public.today_rates.id;


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
    password_reset_code character varying(255),
    wallet_amount double precision DEFAULT '0'::double precision NOT NULL,
    firebase_user_key character varying(255),
    user_device_token text,
    temp_dial_code character varying(255),
    temp_phone character varying(255),
    emirates_id text,
    is_social integer DEFAULT 0 NOT NULL
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
    sub_title character varying(800),
    is_draft integer DEFAULT 0 NOT NULL,
    duration double precision DEFAULT '1'::double precision NOT NULL,
    is_published integer DEFAULT 0 NOT NULL,
    avg_rating double precision DEFAULT '0'::double precision,
    rated_count integer DEFAULT 0 NOT NULL
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
    profile_picture character varying(255),
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
-- Name: wallet_histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallet_histories (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    amount double precision DEFAULT '0'::double precision NOT NULL,
    type character varying(255) DEFAULT 'credit'::character varying NOT NULL,
    transaction_id character varying(255),
    description text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    pay_method integer DEFAULT 0,
    wallet_amount integer DEFAULT 0,
    pay_type character varying(255),
    is_earning integer DEFAULT 0
);


ALTER TABLE public.wallet_histories OWNER TO postgres;

--
-- Name: COLUMN wallet_histories.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.wallet_histories.type IS 'debit,credit';


--
-- Name: wallet_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wallet_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wallet_histories_id_seq OWNER TO postgres;

--
-- Name: wallet_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallet_histories_id_seq OWNED BY public.wallet_histories.id;


--
-- Name: wallet_payment_report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallet_payment_report (
    id bigint NOT NULL,
    transaction_id character varying(255),
    payment_status character varying(255),
    user_id integer DEFAULT 0 NOT NULL,
    ref_id character varying(255),
    amount numeric(8,2) NOT NULL,
    method_type integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.wallet_payment_report OWNER TO postgres;

--
-- Name: wallet_payment_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wallet_payment_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wallet_payment_report_id_seq OWNER TO postgres;

--
-- Name: wallet_payment_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallet_payment_report_id_seq OWNED BY public.wallet_payment_report.id;


--
-- Name: wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallets (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    balance numeric(15,2) DEFAULT '0'::numeric NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.wallets OWNER TO postgres;

--
-- Name: wallets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wallets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wallets_id_seq OWNER TO postgres;

--
-- Name: wallets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallets_id_seq OWNED BY public.wallets.id;


--
-- Name: wish_lists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wish_lists (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    type character varying(255) DEFAULT 'package'::character varying NOT NULL,
    package_id integer DEFAULT 0 NOT NULL,
    yatch_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.wish_lists OWNER TO postgres;

--
-- Name: wish_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wish_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wish_lists_id_seq OWNER TO postgres;

--
-- Name: wish_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wish_lists_id_seq OWNED BY public.wish_lists.id;


--
-- Name: yach_time_schedules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yach_time_schedules (
    id bigint NOT NULL,
    yatch_id integer NOT NULL,
    day character varying(255) NOT NULL,
    slot time(0) without time zone NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.yach_time_schedules OWNER TO postgres;

--
-- Name: yach_time_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.yach_time_schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.yach_time_schedules_id_seq OWNER TO postgres;

--
-- Name: yach_time_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.yach_time_schedules_id_seq OWNED BY public.yach_time_schedules.id;


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
    deleted_at timestamp(0) without time zone,
    offer_type character varying(255) DEFAULT 'percentage'::character varying NOT NULL,
    package_id integer DEFAULT 0 NOT NULL
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
-- Name: yatch_normal_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yatch_normal_rates (
    id bigint NOT NULL,
    yatch_id integer NOT NULL,
    day character varying(255) NOT NULL,
    morning_from time(0) without time zone,
    morning_to time(0) without time zone,
    morning_rate double precision DEFAULT '0'::double precision NOT NULL,
    afternoon_from time(0) without time zone,
    afternoon_to time(0) without time zone,
    afternoon_rate double precision DEFAULT '0'::double precision NOT NULL,
    evening_from time(0) without time zone,
    evening_to time(0) without time zone,
    evening_rate double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.yatch_normal_rates OWNER TO postgres;

--
-- Name: yatch_normal_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.yatch_normal_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.yatch_normal_rates_id_seq OWNER TO postgres;

--
-- Name: yatch_normal_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.yatch_normal_rates_id_seq OWNED BY public.yatch_normal_rates.id;


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
    year_refit character varying(255),
    is_today_overrided integer DEFAULT 0 NOT NULL,
    is_special_day_overrided integer DEFAULT 0 NOT NULL,
    is_sunday_available integer DEFAULT 0 NOT NULL,
    is_monday_available integer DEFAULT 0 NOT NULL,
    is_tuesday_available integer DEFAULT 0 NOT NULL,
    is_wednesday_available integer DEFAULT 0 NOT NULL,
    is_thursday_available integer DEFAULT 0 NOT NULL,
    is_friday_available integer DEFAULT 0 NOT NULL,
    is_saturday_available integer DEFAULT 0 NOT NULL,
    show_in_special_yatches integer DEFAULT 0 NOT NULL,
    avg_rating double precision DEFAULT '0'::double precision NOT NULL,
    rated_count integer DEFAULT 0 NOT NULL
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
-- Name: booking_addons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_addons ALTER COLUMN id SET DEFAULT nextval('public.booking_addons_id_seq'::regclass);


--
-- Name: booking_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_products ALTER COLUMN id SET DEFAULT nextval('public.booking_products_id_seq'::regclass);


--
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- Name: bookings_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings_history ALTER COLUMN id SET DEFAULT nextval('public.bookings_history_id_seq'::regclass);


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: category_texts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_texts ALTER COLUMN id SET DEFAULT nextval('public.category_texts_id_seq'::regclass);


--
-- Name: country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- Name: coupon_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_categories ALTER COLUMN id SET DEFAULT nextval('public.coupon_categories_id_seq'::regclass);


--
-- Name: coupon_packages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_packages ALTER COLUMN id SET DEFAULT nextval('public.coupon_packages_id_seq'::regclass);


--
-- Name: coupon_yatches id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_yatches ALTER COLUMN id SET DEFAULT nextval('public.coupon_yatches_id_seq'::regclass);


--
-- Name: coupons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons ALTER COLUMN id SET DEFAULT nextval('public.coupons_id_seq'::regclass);


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
-- Name: faq id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faq ALTER COLUMN id SET DEFAULT nextval('public.faq_id_seq'::regclass);


--
-- Name: hear_about_us id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hear_about_us ALTER COLUMN id SET DEFAULT nextval('public.hear_about_us_id_seq'::regclass);


--
-- Name: help id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help ALTER COLUMN id SET DEFAULT nextval('public.help_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: modify_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modify_requests ALTER COLUMN id SET DEFAULT nextval('public.modify_requests_id_seq'::regclass);


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
-- Name: socialdetails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialdetails ALTER COLUMN id SET DEFAULT nextval('public.socialdetails_id_seq'::regclass);


--
-- Name: special_day_rates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.special_day_rates ALTER COLUMN id SET DEFAULT nextval('public.special_day_rates_id_seq'::regclass);


--
-- Name: temp_booking_addons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_booking_addons ALTER COLUMN id SET DEFAULT nextval('public.temp_booking_addons_id_seq'::regclass);


--
-- Name: temp_booking_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_booking_products ALTER COLUMN id SET DEFAULT nextval('public.temp_booking_products_id_seq'::regclass);


--
-- Name: temp_bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_bookings ALTER COLUMN id SET DEFAULT nextval('public.temp_bookings_id_seq'::regclass);


--
-- Name: temp_category_texts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_category_texts ALTER COLUMN id SET DEFAULT nextval('public.temp_category_texts_id_seq'::regclass);


--
-- Name: temp_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users ALTER COLUMN id SET DEFAULT nextval('public.temp_users_id_seq'::regclass);


--
-- Name: today_rates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.today_rates ALTER COLUMN id SET DEFAULT nextval('public.today_rates_id_seq'::regclass);


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
-- Name: wallet_histories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_histories ALTER COLUMN id SET DEFAULT nextval('public.wallet_histories_id_seq'::regclass);


--
-- Name: wallet_payment_report id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_payment_report ALTER COLUMN id SET DEFAULT nextval('public.wallet_payment_report_id_seq'::regclass);


--
-- Name: wallets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets ALTER COLUMN id SET DEFAULT nextval('public.wallets_id_seq'::regclass);


--
-- Name: wish_lists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wish_lists ALTER COLUMN id SET DEFAULT nextval('public.wish_lists_id_seq'::regclass);


--
-- Name: yach_time_schedules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yach_time_schedules ALTER COLUMN id SET DEFAULT nextval('public.yach_time_schedules_id_seq'::regclass);


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
-- Name: yatch_normal_rates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yatch_normal_rates ALTER COLUMN id SET DEFAULT nextval('public.yatch_normal_rates_id_seq'::regclass);


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
6	Baloon	66bf1d8523b7c_1723800965.jpg	\N	0	1	0	0	1	1	2024-08-16 09:36:05	2024-08-16 09:36:05
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
-- Data for Name: booking_addons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_addons (id, booking_id, addon_id, quantity, created_at, updated_at) FROM stdin;
1	2	7	1	2024-08-08 11:01:45	2024-08-08 11:01:45
2	26	10	2	2024-08-15 18:43:23	2024-08-15 18:43:23
3	37	10	2	2024-08-16 12:56:38	2024-08-16 12:56:38
4	38	2	2	2024-08-16 19:14:10	2024-08-16 19:14:10
5	40	2	3	2024-08-16 20:44:14	2024-08-16 20:44:14
6	41	2	3	2024-08-16 20:47:27	2024-08-16 20:47:27
7	43	12	1	2024-08-17 06:04:59	2024-08-17 06:04:59
8	44	2	3	2024-08-17 12:40:28	2024-08-17 12:40:28
9	45	2	2	2024-08-17 12:47:04	2024-08-17 12:47:04
10	46	2	2	2024-08-17 18:12:49	2024-08-17 18:12:49
11	47	2	1	2024-08-17 19:36:57	2024-08-17 19:36:57
12	48	2	2	2024-08-17 19:56:53	2024-08-17 19:56:53
13	49	2	3	2024-08-17 20:00:59	2024-08-17 20:00:59
14	53	8	1	2024-08-17 22:36:10	2024-08-17 22:36:10
15	53	9	1	2024-08-17 22:36:10	2024-08-17 22:36:10
16	54	2	1	2024-08-17 23:31:35	2024-08-17 23:31:35
17	55	2	3	2024-08-17 23:53:53	2024-08-17 23:53:53
18	56	12	1	2024-08-18 07:48:57	2024-08-18 07:48:57
19	58	12	1	2024-08-18 07:57:52	2024-08-18 07:57:52
20	59	12	1	2024-08-18 08:12:47	2024-08-18 08:12:47
21	61	12	1	2024-08-18 09:24:49	2024-08-18 09:24:49
22	64	93	1	2024-08-18 09:46:20	2024-08-18 09:46:20
23	66	12	1	2024-08-18 09:56:57	2024-08-18 09:56:57
24	67	12	3	2024-08-18 09:58:11	2024-08-18 09:58:11
25	69	12	1	2024-08-18 10:39:42	2024-08-18 10:39:42
26	73	10	1	2024-08-19 07:12:57	2024-08-19 07:12:57
27	75	2	1	2024-08-19 07:48:52	2024-08-19 07:48:52
28	76	12	1	2024-08-19 07:50:30	2024-08-19 07:50:30
29	77	12	1	2024-08-19 08:01:28	2024-08-19 08:01:28
30	79	12	1	2024-08-19 08:05:48	2024-08-19 08:05:48
31	79	13	1	2024-08-19 08:05:48	2024-08-19 08:05:48
32	82	2	1	2024-08-19 09:20:52	2024-08-19 09:20:52
33	83	2	1	2024-08-19 09:26:53	2024-08-19 09:26:53
34	84	12	0	2024-08-19 10:10:41	2024-08-19 10:10:41
35	84	13	0	2024-08-19 10:10:41	2024-08-19 10:10:41
36	85	12	1	2024-08-19 10:29:39	2024-08-19 10:29:39
37	85	13	1	2024-08-19 10:29:39	2024-08-19 10:29:39
38	86	12	1	2024-08-19 10:31:27	2024-08-19 10:31:27
39	86	13	1	2024-08-19 10:31:27	2024-08-19 10:31:27
40	88	10	3	2024-08-19 10:47:49	2024-08-19 10:47:49
41	89	12	1	2024-08-19 10:47:52	2024-08-19 10:47:52
42	89	13	1	2024-08-19 10:47:52	2024-08-19 10:47:52
43	91	12	1	2024-08-19 11:32:22	2024-08-19 11:32:22
44	95	12	1	2024-08-19 12:03:18	2024-08-19 12:03:18
45	98	10	1	2024-08-19 12:28:40	2024-08-19 12:28:40
46	101	10	1	2024-08-19 12:31:00	2024-08-19 12:31:00
47	102	12	1	2024-08-19 12:36:16	2024-08-19 12:36:16
48	103	12	1	2024-08-19 12:37:53	2024-08-19 12:37:53
49	104	12	1	2024-08-19 12:44:51	2024-08-19 12:44:51
50	105	12	1	2024-08-19 13:01:56	2024-08-19 13:01:56
51	106	12	1	2024-08-19 13:04:21	2024-08-19 13:04:21
52	107	12	1	2024-08-19 13:05:54	2024-08-19 13:05:54
53	108	12	1	2024-08-19 13:07:32	2024-08-19 13:07:32
54	109	12	1	2024-08-19 13:11:27	2024-08-19 13:11:27
55	110	12	1	2024-08-19 13:16:41	2024-08-19 13:16:41
56	111	10	1	2024-08-19 13:19:18	2024-08-19 13:19:18
57	112	12	1	2024-08-19 13:31:18	2024-08-19 13:31:18
58	114	12	1	2024-08-19 14:30:20	2024-08-19 14:30:20
59	119	2	1	2024-08-19 19:19:37	2024-08-19 19:19:37
60	120	2	2	2024-08-19 19:56:18	2024-08-19 19:56:18
61	121	2	1	2024-08-19 20:21:03	2024-08-19 20:21:03
62	122	2	1	2024-08-19 20:21:36	2024-08-19 20:21:36
63	123	2	1	2024-08-19 21:14:33	2024-08-19 21:14:33
64	124	12	1	2024-08-19 23:13:17	2024-08-19 23:13:17
65	125	12	1	2024-08-19 23:28:50	2024-08-19 23:28:50
66	126	12	0	2024-08-20 02:07:05	2024-08-20 02:07:05
67	126	13	0	2024-08-20 02:07:05	2024-08-20 02:07:05
68	128	12	1	2024-08-20 07:24:25	2024-08-20 07:24:25
69	129	12	1	2024-08-20 07:39:37	2024-08-20 07:39:37
70	129	13	1	2024-08-20 07:39:37	2024-08-20 07:39:37
71	130	10	3	2024-08-20 07:47:13	2024-08-20 07:47:13
72	133	12	1	2024-08-20 09:42:29	2024-08-20 09:42:29
73	134	12	1	2024-08-20 09:48:05	2024-08-20 09:48:05
74	134	13	1	2024-08-20 09:48:05	2024-08-20 09:48:05
75	135	12	1	2024-08-20 10:26:51	2024-08-20 10:26:51
76	137	10	1	2024-08-20 11:20:45	2024-08-20 11:20:45
77	138	12	1	2024-08-20 12:05:11	2024-08-20 12:05:11
78	140	12	1	2024-08-20 12:28:17	2024-08-20 12:28:17
79	141	12	1	2024-08-20 13:38:22	2024-08-20 13:38:22
80	142	12	1	2024-08-20 13:51:20	2024-08-20 13:51:20
81	143	12	1	2024-08-20 15:17:09	2024-08-20 15:17:09
82	147	2	1	2024-08-20 20:06:29	2024-08-20 20:06:29
83	148	2	1	2024-08-20 22:36:30	2024-08-20 22:36:30
84	152	2	1	2024-08-20 23:19:14	2024-08-20 23:19:14
85	153	2	1	2024-08-20 23:22:44	2024-08-20 23:22:44
86	154	2	1	2024-08-20 23:26:10	2024-08-20 23:26:10
87	155	2	1	2024-08-20 23:31:03	2024-08-20 23:31:03
88	158	12	2	2024-08-21 06:06:30	2024-08-21 06:06:30
89	158	13	1	2024-08-21 06:06:30	2024-08-21 06:06:30
90	159	12	0	2024-08-21 06:33:55	2024-08-21 06:33:55
91	159	13	1	2024-08-21 06:33:55	2024-08-21 06:33:55
92	160	12	1	2024-08-21 07:48:57	2024-08-21 07:48:57
93	160	13	1	2024-08-21 07:48:57	2024-08-21 07:48:57
94	161	12	1	2024-08-21 08:02:54	2024-08-21 08:02:54
95	161	13	1	2024-08-21 08:02:54	2024-08-21 08:02:54
96	162	12	1	2024-08-21 08:33:32	2024-08-21 08:33:32
97	163	12	1	2024-08-21 08:38:20	2024-08-21 08:38:20
98	164	12	1	2024-08-21 08:42:12	2024-08-21 08:42:12
99	166	12	1	2024-08-21 08:58:50	2024-08-21 08:58:50
100	167	16	1	2024-08-21 09:06:21	2024-08-21 09:06:21
101	168	16	1	2024-08-21 09:13:49	2024-08-21 09:13:49
102	169	16	1	2024-08-21 09:17:28	2024-08-21 09:17:28
103	170	16	1	2024-08-21 09:22:16	2024-08-21 09:22:16
104	171	16	1	2024-08-21 09:36:31	2024-08-21 09:36:31
105	173	12	1	2024-08-21 12:13:52	2024-08-21 12:13:52
106	173	13	1	2024-08-21 12:13:52	2024-08-21 12:13:52
107	174	12	1	2024-08-21 12:32:56	2024-08-21 12:32:56
108	174	13	1	2024-08-21 12:32:56	2024-08-21 12:32:56
109	175	16	1	2024-08-21 13:32:05	2024-08-21 13:32:05
110	180	10	1	2024-08-22 20:47:54	2024-08-22 20:47:54
111	181	12	1	2024-08-23 06:38:32	2024-08-23 06:38:32
112	181	13	0	2024-08-23 06:38:32	2024-08-23 06:38:32
113	182	12	1	2024-08-23 22:17:20	2024-08-23 22:17:20
114	182	13	1	2024-08-23 22:17:20	2024-08-23 22:17:20
115	183	12	0	2024-08-26 08:32:48	2024-08-26 08:32:48
116	183	13	0	2024-08-26 08:32:48	2024-08-26 08:32:48
117	184	12	1	2024-08-26 13:06:02	2024-08-26 13:06:02
118	184	13	1	2024-08-26 13:06:02	2024-08-26 13:06:02
119	185	12	0	2024-08-26 13:25:51	2024-08-26 13:25:51
120	185	13	0	2024-08-26 13:25:51	2024-08-26 13:25:51
121	186	16	1	2024-09-02 07:18:14	2024-09-02 07:18:14
122	187	12	2	2024-09-03 10:45:45	2024-09-03 10:45:45
123	187	13	2	2024-09-03 10:45:45	2024-09-03 10:45:45
124	188	12	1	2024-09-03 11:20:08	2024-09-03 11:20:08
125	188	13	1	2024-09-03 11:20:08	2024-09-03 11:20:08
126	189	13	0	2024-09-03 11:38:55	2024-09-03 11:38:55
127	189	12	0	2024-09-03 11:38:55	2024-09-03 11:38:55
128	191	12	2	2024-09-03 11:54:45	2024-09-03 11:54:45
129	191	13	1	2024-09-03 11:54:45	2024-09-03 11:54:45
130	192	12	0	2024-09-03 11:58:39	2024-09-03 11:58:39
131	192	13	0	2024-09-03 11:58:39	2024-09-03 11:58:39
132	193	12	1	2024-09-03 12:40:27	2024-09-03 12:40:27
133	193	13	1	2024-09-03 12:40:27	2024-09-03 12:40:27
134	194	16	1	2024-09-05 19:32:24	2024-09-05 19:32:24
135	195	16	1	2024-09-06 07:51:17	2024-09-06 07:51:17
136	198	16	9	2024-09-07 15:58:54	2024-09-07 15:58:54
137	201	12	1	2024-09-09 11:40:17	2024-09-09 11:40:17
138	201	13	0	2024-09-09 11:40:17	2024-09-09 11:40:17
139	203	12	0	2024-09-09 20:59:20	2024-09-09 20:59:20
140	203	13	0	2024-09-09 20:59:20	2024-09-09 20:59:20
141	205	12	1	2024-09-10 07:23:03	2024-09-10 07:23:03
142	205	13	1	2024-09-10 07:23:03	2024-09-10 07:23:03
143	208	12	4	2024-09-10 11:39:56	2024-09-10 11:39:56
144	208	13	5	2024-09-10 11:39:56	2024-09-10 11:39:56
145	209	12	1	2024-09-10 16:26:58	2024-09-10 16:26:58
146	209	13	1	2024-09-10 16:26:58	2024-09-10 16:26:58
147	210	12	1	2024-09-10 16:53:04	2024-09-10 16:53:04
148	210	13	1	2024-09-10 16:53:04	2024-09-10 16:53:04
149	211	12	1	2024-09-10 17:19:06	2024-09-10 17:19:06
150	211	13	1	2024-09-10 17:19:06	2024-09-10 17:19:06
151	212	12	1	2024-09-10 17:31:16	2024-09-10 17:31:16
152	212	13	1	2024-09-10 17:31:16	2024-09-10 17:31:16
153	215	12	1	2024-09-10 21:09:44	2024-09-10 21:09:44
154	215	13	1	2024-09-10 21:09:44	2024-09-10 21:09:44
155	217	16	1	2024-09-13 08:59:17	2024-09-13 08:59:17
156	218	12	0	2024-09-13 09:11:26	2024-09-13 09:11:26
157	218	13	0	2024-09-13 09:11:26	2024-09-13 09:11:26
158	221	10	3	2024-09-14 13:23:05	2024-09-14 13:23:05
159	232	16	0	2024-09-20 09:25:15	2024-09-20 09:25:15
160	243	12	2	2024-09-30 12:15:32	2024-09-30 12:15:32
161	243	13	2	2024-09-30 12:15:32	2024-09-30 12:15:32
162	244	12	1	2024-09-30 13:09:55	2024-09-30 13:09:55
163	244	13	0	2024-09-30 13:09:55	2024-09-30 13:09:55
164	245	12	1	2024-09-30 13:10:43	2024-09-30 13:10:43
165	245	13	0	2024-09-30 13:10:43	2024-09-30 13:10:43
166	246	12	1	2024-09-30 13:12:53	2024-09-30 13:12:53
167	246	13	0	2024-09-30 13:12:53	2024-09-30 13:12:53
168	247	12	1	2024-09-30 13:14:06	2024-09-30 13:14:06
169	247	13	0	2024-09-30 13:14:06	2024-09-30 13:14:06
170	248	10	1	2024-09-30 16:58:22	2024-09-30 16:58:22
171	249	12	1	2024-09-30 17:45:07	2024-09-30 17:45:07
172	249	13	1	2024-09-30 17:45:07	2024-09-30 17:45:07
173	250	16	1	2024-10-01 05:48:50	2024-10-01 05:48:50
174	251	10	1	2024-10-01 06:42:24	2024-10-01 06:42:24
175	252	16	3	2024-10-01 06:49:44	2024-10-01 06:49:44
176	253	22	3	2024-10-01 11:48:34	2024-10-01 11:48:34
177	261	16	2	2024-10-02 13:55:13	2024-10-02 13:55:13
178	262	22	16	2024-10-03 17:03:18	2024-10-03 17:03:18
179	280	16	2	2024-10-07 19:42:28	2024-10-07 19:42:28
180	281	16	1	2024-10-07 19:49:15	2024-10-07 19:49:15
181	289	12	0	2024-10-09 02:24:58	2024-10-09 02:24:58
182	289	13	0	2024-10-09 02:24:58	2024-10-09 02:24:58
183	290	12	1	2024-10-09 02:53:38	2024-10-09 02:53:38
184	291	16	0	2024-10-09 04:12:22	2024-10-09 04:12:22
185	292	16	0	2024-10-09 04:14:41	2024-10-09 04:14:41
186	294	16	4	2024-10-09 07:32:34	2024-10-09 07:32:34
187	296	31	1	2024-10-09 12:01:04	2024-10-09 12:01:04
188	297	30	1	2024-10-09 12:11:07	2024-10-09 12:11:07
189	297	10	1	2024-10-09 12:11:07	2024-10-09 12:11:07
190	298	31	1	2024-10-09 12:19:58	2024-10-09 12:19:58
191	299	30	1	2024-10-09 12:23:39	2024-10-09 12:23:39
192	299	10	1	2024-10-09 12:23:39	2024-10-09 12:23:39
193	300	30	1	2024-10-09 12:30:38	2024-10-09 12:30:38
194	300	10	1	2024-10-09 12:30:38	2024-10-09 12:30:38
195	305	31	1	2024-10-09 21:20:18	2024-10-09 21:20:18
196	306	31	1	2024-10-09 21:31:22	2024-10-09 21:31:22
197	324	31	3	2024-10-10 06:32:54	2024-10-10 06:32:54
198	325	31	1	2024-10-10 09:17:01	2024-10-10 09:17:01
199	326	31	1	2024-10-10 09:31:52	2024-10-10 09:31:52
200	328	30	1	2024-10-10 10:34:56	2024-10-10 10:34:56
201	328	10	1	2024-10-10 10:34:56	2024-10-10 10:34:56
202	329	30	1	2024-10-10 10:49:29	2024-10-10 10:49:29
203	329	10	1	2024-10-10 10:49:29	2024-10-10 10:49:29
204	330	31	1	2024-10-10 14:08:13	2024-10-10 14:08:13
205	331	16	1	2024-10-11 03:37:43	2024-10-11 03:37:43
206	335	31	1	2024-10-17 05:12:38	2024-10-17 05:12:38
207	336	31	1	2024-10-17 11:42:28	2024-10-17 11:42:28
208	340	31	0	2024-10-18 12:12:58	2024-10-18 12:12:58
209	341	31	0	2024-10-18 16:50:25	2024-10-18 16:50:25
210	342	31	1	2024-10-18 17:24:40	2024-10-18 17:24:40
211	344	22	0	2024-10-19 07:06:49	2024-10-19 07:06:49
212	345	22	1	2024-10-19 07:13:43	2024-10-19 07:13:43
213	346	22	1	2024-10-19 07:50:26	2024-10-19 07:50:26
214	347	30	2	2024-10-19 08:05:13	2024-10-19 08:05:13
215	347	10	2	2024-10-19 08:05:13	2024-10-19 08:05:13
216	349	30	1	2024-10-19 08:14:57	2024-10-19 08:14:57
217	349	10	1	2024-10-19 08:14:57	2024-10-19 08:14:57
218	350	16	1	2024-10-19 08:17:26	2024-10-19 08:17:26
219	351	16	1	2024-10-19 08:20:17	2024-10-19 08:20:17
220	353	22	0	2024-10-19 08:24:42	2024-10-19 08:24:42
221	354	31	1	2024-10-19 08:59:39	2024-10-19 08:59:39
222	355	30	1	2024-10-19 09:02:33	2024-10-19 09:02:33
223	355	10	1	2024-10-19 09:02:33	2024-10-19 09:02:33
224	356	30	1	2024-10-19 09:39:11	2024-10-19 09:39:11
225	356	10	1	2024-10-19 09:39:11	2024-10-19 09:39:11
226	357	16	1	2024-10-19 11:10:00	2024-10-19 11:10:00
227	358	16	1	2024-10-19 11:33:34	2024-10-19 11:33:34
228	359	31	1	2024-10-19 11:41:16	2024-10-19 11:41:16
229	360	16	1	2024-10-19 12:01:39	2024-10-19 12:01:39
230	361	31	1	2024-10-19 12:03:27	2024-10-19 12:03:27
231	362	16	1	2024-10-19 18:20:27	2024-10-19 18:20:27
232	363	16	1	2024-10-19 18:22:32	2024-10-19 18:22:32
233	365	31	1	2024-10-20 09:37:47	2024-10-20 09:37:47
234	366	31	1	2024-10-20 09:38:27	2024-10-20 09:38:27
235	370	31	1	2024-10-20 10:19:45	2024-10-20 10:19:45
236	371	31	1	2024-10-20 10:20:26	2024-10-20 10:20:26
237	372	31	1	2024-10-20 10:26:50	2024-10-20 10:26:50
238	375	31	1	2024-10-20 12:02:29	2024-10-20 12:02:29
239	376	16	1	2024-10-21 04:42:58	2024-10-21 04:42:58
240	377	30	1	2024-10-21 04:45:31	2024-10-21 04:45:31
241	377	10	1	2024-10-21 04:45:31	2024-10-21 04:45:31
242	378	16	1	2024-10-21 04:52:07	2024-10-21 04:52:07
243	379	16	1	2024-10-21 04:53:39	2024-10-21 04:53:39
244	380	30	1	2024-10-21 04:54:42	2024-10-21 04:54:42
245	380	10	1	2024-10-21 04:54:42	2024-10-21 04:54:42
246	381	31	1	2024-10-21 05:02:19	2024-10-21 05:02:19
247	382	16	1	2024-10-21 05:38:19	2024-10-21 05:38:19
248	383	16	0	2024-10-21 06:04:39	2024-10-21 06:04:39
249	385	16	1	2024-10-21 06:16:49	2024-10-21 06:16:49
250	387	31	1	2024-10-21 07:30:47	2024-10-21 07:30:47
251	388	31	1	2024-10-21 11:18:51	2024-10-21 11:18:51
252	389	31	1	2024-10-21 12:24:31	2024-10-21 12:24:31
253	390	31	1	2024-10-21 13:25:01	2024-10-21 13:25:01
254	391	31	1	2024-10-21 14:58:11	2024-10-21 14:58:11
255	398	31	1	2024-10-22 13:32:52	2024-10-22 13:32:52
256	410	31	1	2024-10-23 15:45:41	2024-10-23 15:45:41
257	411	31	0	2024-10-23 23:43:57	2024-10-23 23:43:57
258	414	31	1	2024-10-24 04:01:59	2024-10-24 04:01:59
259	416	31	1	2024-10-24 04:25:10	2024-10-24 04:25:10
260	417	31	1	2024-10-24 04:50:49	2024-10-24 04:50:49
261	420	31	1	2024-10-24 06:16:45	2024-10-24 06:16:45
262	421	31	1	2024-10-24 06:50:39	2024-10-24 06:50:39
263	425	31	1	2024-10-24 12:49:21	2024-10-24 12:49:21
264	426	32	0	2024-10-24 13:02:11	2024-10-24 13:02:11
265	427	32	1	2024-10-24 13:08:54	2024-10-24 13:08:54
266	428	32	1	2024-10-24 13:14:31	2024-10-24 13:14:31
267	429	31	1	2024-10-24 13:22:05	2024-10-24 13:22:05
268	432	30	1	2024-10-30 07:57:58	2024-10-30 07:57:58
269	433	32	1	2024-10-30 13:21:28	2024-10-30 13:21:28
270	434	16	1	2024-11-02 18:12:04	2024-11-02 18:12:04
271	442	32	1	2024-11-05 14:29:21	2024-11-05 14:29:21
272	443	32	0	2024-11-05 14:34:14	2024-11-05 14:34:14
273	444	32	0	2024-11-05 14:35:55	2024-11-05 14:35:55
274	447	32	1	2024-11-05 15:48:39	2024-11-05 15:48:39
275	448	32	0	2024-11-06 07:53:21	2024-11-06 07:53:21
276	449	30	1	2024-11-06 12:01:02	2024-11-06 12:01:02
277	449	10	1	2024-11-06 12:01:02	2024-11-06 12:01:02
278	453	33	1	2024-11-06 15:08:16	2024-11-06 15:08:16
279	453	34	1	2024-11-06 15:08:16	2024-11-06 15:08:16
280	454	33	0	2024-11-06 16:10:46	2024-11-06 16:10:46
281	454	34	0	2024-11-06 16:10:46	2024-11-06 16:10:46
282	455	33	1	2024-11-07 05:06:47	2024-11-07 05:06:47
283	455	34	1	2024-11-07 05:06:47	2024-11-07 05:06:47
284	456	32	1	2024-11-07 06:28:17	2024-11-07 06:28:17
285	457	32	1	2024-11-07 06:29:28	2024-11-07 06:29:28
286	458	32	1	2024-11-07 06:31:26	2024-11-07 06:31:26
287	459	34	1	2024-11-07 06:36:29	2024-11-07 06:36:29
288	459	33	2	2024-11-07 06:36:29	2024-11-07 06:36:29
289	460	34	1	2024-11-07 06:36:41	2024-11-07 06:36:41
290	460	33	2	2024-11-07 06:36:41	2024-11-07 06:36:41
291	461	30	1	2024-11-07 06:43:48	2024-11-07 06:43:48
292	461	10	1	2024-11-07 06:43:48	2024-11-07 06:43:48
293	462	30	1	2024-11-07 06:44:14	2024-11-07 06:44:14
294	462	10	1	2024-11-07 06:44:14	2024-11-07 06:44:14
295	463	30	1	2024-11-07 06:45:23	2024-11-07 06:45:23
296	463	10	1	2024-11-07 06:45:23	2024-11-07 06:45:23
297	464	30	1	2024-11-07 07:37:06	2024-11-07 07:37:06
298	464	10	1	2024-11-07 07:37:06	2024-11-07 07:37:06
299	465	32	1	2024-11-07 07:40:31	2024-11-07 07:40:31
300	466	33	1	2024-11-07 07:46:50	2024-11-07 07:46:50
301	466	34	1	2024-11-07 07:46:50	2024-11-07 07:46:50
302	467	34	1	2024-11-07 14:29:33	2024-11-07 14:29:33
303	467	33	1	2024-11-07 14:29:33	2024-11-07 14:29:33
304	468	33	1	2024-11-07 14:38:33	2024-11-07 14:38:33
305	468	34	1	2024-11-07 14:38:33	2024-11-07 14:38:33
306	469	33	1	2024-11-07 16:44:27	2024-11-07 16:44:27
307	469	34	1	2024-11-07 16:44:27	2024-11-07 16:44:27
308	470	33	1	2024-11-07 16:58:03	2024-11-07 16:58:03
309	470	34	1	2024-11-07 16:58:03	2024-11-07 16:58:03
310	471	34	1	2024-11-07 17:11:40	2024-11-07 17:11:40
311	471	33	1	2024-11-07 17:11:40	2024-11-07 17:11:40
312	472	34	1	2024-11-07 17:32:02	2024-11-07 17:32:02
313	472	33	1	2024-11-07 17:32:02	2024-11-07 17:32:02
314	473	34	1	2024-11-07 17:46:48	2024-11-07 17:46:48
315	473	33	1	2024-11-07 17:46:48	2024-11-07 17:46:48
316	475	34	1	2024-11-07 17:56:37	2024-11-07 17:56:37
317	475	33	1	2024-11-07 17:56:37	2024-11-07 17:56:37
318	477	34	1	2024-11-07 18:05:05	2024-11-07 18:05:05
319	477	33	1	2024-11-07 18:05:05	2024-11-07 18:05:05
320	478	33	1	2024-11-07 19:05:11	2024-11-07 19:05:11
321	478	34	1	2024-11-07 19:05:11	2024-11-07 19:05:11
322	479	33	1	2024-11-07 19:15:14	2024-11-07 19:15:14
323	479	34	1	2024-11-07 19:15:14	2024-11-07 19:15:14
324	480	33	1	2024-11-08 09:33:56	2024-11-08 09:33:56
325	480	34	1	2024-11-08 09:33:56	2024-11-08 09:33:56
326	481	33	1	2024-11-08 12:09:48	2024-11-08 12:09:48
327	481	34	1	2024-11-08 12:09:48	2024-11-08 12:09:48
328	482	33	1	2024-11-08 13:01:49	2024-11-08 13:01:49
329	482	34	1	2024-11-08 13:01:49	2024-11-08 13:01:49
330	483	33	1	2024-11-08 16:26:17	2024-11-08 16:26:17
331	483	34	1	2024-11-08 16:26:17	2024-11-08 16:26:17
332	484	33	1	2024-11-12 06:00:52	2024-11-12 06:00:52
333	484	34	1	2024-11-12 06:00:52	2024-11-12 06:00:52
334	485	33	1	2024-11-16 08:42:46	2024-11-16 08:42:46
335	485	34	1	2024-11-16 08:42:46	2024-11-16 08:42:46
\.


--
-- Data for Name: booking_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_products (id, booking_id, product_id, quantity, created_at, updated_at) FROM stdin;
1	2	17	1	2024-08-08 11:01:44	2024-08-08 11:01:44
2	26	25	2	2024-08-15 18:43:23	2024-08-15 18:43:23
3	38	13	1	2024-08-16 19:14:10	2024-08-16 19:14:10
4	40	13	1	2024-08-16 20:44:14	2024-08-16 20:44:14
5	40	11	1	2024-08-16 20:44:14	2024-08-16 20:44:14
6	41	13	1	2024-08-16 20:47:27	2024-08-16 20:47:27
7	41	11	1	2024-08-16 20:47:27	2024-08-16 20:47:27
8	43	26	1	2024-08-17 06:04:59	2024-08-17 06:04:59
9	43	27	2	2024-08-17 06:04:59	2024-08-17 06:04:59
10	44	13	1	2024-08-17 12:40:28	2024-08-17 12:40:28
11	44	11	1	2024-08-17 12:40:28	2024-08-17 12:40:28
12	45	13	1	2024-08-17 12:47:04	2024-08-17 12:47:04
13	45	11	1	2024-08-17 12:47:04	2024-08-17 12:47:04
14	46	10	0	2024-08-17 18:12:49	2024-08-17 18:12:49
15	46	11	1	2024-08-17 18:12:49	2024-08-17 18:12:49
16	47	10	1	2024-08-17 19:36:57	2024-08-17 19:36:57
17	47	11	1	2024-08-17 19:36:57	2024-08-17 19:36:57
18	48	12	1	2024-08-17 19:56:53	2024-08-17 19:56:53
19	48	13	2	2024-08-17 19:56:53	2024-08-17 19:56:53
20	49	10	1	2024-08-17 20:00:59	2024-08-17 20:00:59
21	49	11	3	2024-08-17 20:00:59	2024-08-17 20:00:59
22	53	22	1	2024-08-17 22:36:10	2024-08-17 22:36:10
23	53	23	1	2024-08-17 22:36:10	2024-08-17 22:36:10
24	54	12	1	2024-08-17 23:31:35	2024-08-17 23:31:35
25	54	13	1	2024-08-17 23:31:35	2024-08-17 23:31:35
26	55	10	1	2024-08-17 23:53:53	2024-08-17 23:53:53
27	55	11	3	2024-08-17 23:53:53	2024-08-17 23:53:53
28	56	27	1	2024-08-18 07:48:57	2024-08-18 07:48:57
29	56	28	0	2024-08-18 07:48:57	2024-08-18 07:48:57
30	58	26	1	2024-08-18 07:57:52	2024-08-18 07:57:52
31	58	27	1	2024-08-18 07:57:52	2024-08-18 07:57:52
32	59	27	1	2024-08-18 08:12:47	2024-08-18 08:12:47
33	59	28	0	2024-08-18 08:12:47	2024-08-18 08:12:47
34	61	28	1	2024-08-18 09:24:49	2024-08-18 09:24:49
35	64	215	1	2024-08-18 09:46:20	2024-08-18 09:46:20
36	66	27	1	2024-08-18 09:56:57	2024-08-18 09:56:57
37	67	27	1	2024-08-18 09:58:11	2024-08-18 09:58:11
38	68	28	1	2024-08-18 10:05:51	2024-08-18 10:05:51
39	68	26	1	2024-08-18 10:05:51	2024-08-18 10:05:51
40	68	27	1	2024-08-18 10:05:51	2024-08-18 10:05:51
41	69	28	1	2024-08-18 10:39:42	2024-08-18 10:39:42
42	69	26	1	2024-08-18 10:39:42	2024-08-18 10:39:42
43	69	27	1	2024-08-18 10:39:42	2024-08-18 10:39:42
44	72	22	1	2024-08-19 06:28:14	2024-08-19 06:28:14
45	72	23	2	2024-08-19 06:28:14	2024-08-19 06:28:14
46	73	25	1	2024-08-19 07:12:57	2024-08-19 07:12:57
47	73	31	1	2024-08-19 07:12:57	2024-08-19 07:12:57
48	74	23	1	2024-08-19 07:18:34	2024-08-19 07:18:34
49	75	15	1	2024-08-19 07:48:52	2024-08-19 07:48:52
50	75	13	1	2024-08-19 07:48:52	2024-08-19 07:48:52
51	76	28	1	2024-08-19 07:50:30	2024-08-19 07:50:30
52	76	27	1	2024-08-19 07:50:30	2024-08-19 07:50:30
53	77	27	1	2024-08-19 08:01:28	2024-08-19 08:01:28
54	84	26	1	2024-08-19 10:10:41	2024-08-19 10:10:41
55	84	27	1	2024-08-19 10:10:41	2024-08-19 10:10:41
56	85	27	1	2024-08-19 10:29:39	2024-08-19 10:29:39
57	88	25	1	2024-08-19 10:47:49	2024-08-19 10:47:49
58	88	31	3	2024-08-19 10:47:49	2024-08-19 10:47:49
59	89	27	1	2024-08-19 10:47:52	2024-08-19 10:47:52
60	91	26	1	2024-08-19 11:32:22	2024-08-19 11:32:22
61	91	27	1	2024-08-19 11:32:22	2024-08-19 11:32:22
62	95	26	1	2024-08-19 12:03:18	2024-08-19 12:03:18
63	95	27	1	2024-08-19 12:03:18	2024-08-19 12:03:18
64	98	25	1	2024-08-19 12:28:40	2024-08-19 12:28:40
65	98	31	1	2024-08-19 12:28:40	2024-08-19 12:28:40
66	104	27	1	2024-08-19 12:44:51	2024-08-19 12:44:51
67	105	27	1	2024-08-19 13:01:56	2024-08-19 13:01:56
68	106	27	1	2024-08-19 13:04:21	2024-08-19 13:04:21
69	107	27	1	2024-08-19 13:05:54	2024-08-19 13:05:54
70	108	27	1	2024-08-19 13:07:32	2024-08-19 13:07:32
71	109	27	1	2024-08-19 13:11:27	2024-08-19 13:11:27
72	110	27	1	2024-08-19 13:16:41	2024-08-19 13:16:41
73	111	25	1	2024-08-19 13:19:18	2024-08-19 13:19:18
74	119	11	1	2024-08-19 19:19:37	2024-08-19 19:19:37
75	119	12	1	2024-08-19 19:19:37	2024-08-19 19:19:37
76	119	16	1	2024-08-19 19:19:37	2024-08-19 19:19:37
77	120	16	1	2024-08-19 19:56:18	2024-08-19 19:56:18
78	120	12	1	2024-08-19 19:56:18	2024-08-19 19:56:18
79	120	13	1	2024-08-19 19:56:18	2024-08-19 19:56:18
80	120	10	1	2024-08-19 19:56:18	2024-08-19 19:56:18
81	121	15	1	2024-08-19 20:21:03	2024-08-19 20:21:03
82	121	16	1	2024-08-19 20:21:03	2024-08-19 20:21:03
83	122	11	1	2024-08-19 20:21:36	2024-08-19 20:21:36
84	122	13	1	2024-08-19 20:21:36	2024-08-19 20:21:36
85	122	15	1	2024-08-19 20:21:36	2024-08-19 20:21:36
86	123	10	1	2024-08-19 21:14:33	2024-08-19 21:14:33
87	123	13	1	2024-08-19 21:14:33	2024-08-19 21:14:33
88	123	15	1	2024-08-19 21:14:33	2024-08-19 21:14:33
89	124	26	1	2024-08-19 23:13:17	2024-08-19 23:13:17
90	124	27	1	2024-08-19 23:13:17	2024-08-19 23:13:17
91	125	26	1	2024-08-19 23:28:50	2024-08-19 23:28:50
92	125	27	1	2024-08-19 23:28:50	2024-08-19 23:28:50
93	126	26	1	2024-08-20 02:07:05	2024-08-20 02:07:05
94	126	27	1	2024-08-20 02:07:05	2024-08-20 02:07:05
95	126	28	1	2024-08-20 02:07:05	2024-08-20 02:07:05
96	126	29	1	2024-08-20 02:07:05	2024-08-20 02:07:05
97	128	26	1	2024-08-20 07:24:25	2024-08-20 07:24:25
98	128	27	1	2024-08-20 07:24:25	2024-08-20 07:24:25
99	128	28	1	2024-08-20 07:24:25	2024-08-20 07:24:25
100	130	25	1	2024-08-20 07:47:13	2024-08-20 07:47:13
101	130	31	3	2024-08-20 07:47:13	2024-08-20 07:47:13
102	130	32	3	2024-08-20 07:47:13	2024-08-20 07:47:13
103	133	26	1	2024-08-20 09:42:29	2024-08-20 09:42:29
104	133	27	1	2024-08-20 09:42:29	2024-08-20 09:42:29
105	134	26	1	2024-08-20 09:48:05	2024-08-20 09:48:05
106	134	27	1	2024-08-20 09:48:05	2024-08-20 09:48:05
107	134	29	1	2024-08-20 09:48:05	2024-08-20 09:48:05
108	135	28	1	2024-08-20 10:26:51	2024-08-20 10:26:51
109	135	26	1	2024-08-20 10:26:51	2024-08-20 10:26:51
110	135	27	1	2024-08-20 10:26:51	2024-08-20 10:26:51
111	138	28	1	2024-08-20 12:05:11	2024-08-20 12:05:11
112	138	26	1	2024-08-20 12:05:11	2024-08-20 12:05:11
113	138	27	1	2024-08-20 12:05:11	2024-08-20 12:05:11
114	140	27	1	2024-08-20 12:28:16	2024-08-20 12:28:16
115	141	26	1	2024-08-20 13:38:22	2024-08-20 13:38:22
116	141	27	1	2024-08-20 13:38:22	2024-08-20 13:38:22
117	142	26	1	2024-08-20 13:51:20	2024-08-20 13:51:20
118	142	27	1	2024-08-20 13:51:20	2024-08-20 13:51:20
119	143	26	1	2024-08-20 15:17:09	2024-08-20 15:17:09
120	143	27	1	2024-08-20 15:17:09	2024-08-20 15:17:09
121	147	11	0	2024-08-20 20:06:29	2024-08-20 20:06:29
122	147	13	1	2024-08-20 20:06:29	2024-08-20 20:06:29
123	147	15	1	2024-08-20 20:06:29	2024-08-20 20:06:29
124	148	10	1	2024-08-20 22:36:30	2024-08-20 22:36:30
125	148	13	1	2024-08-20 22:36:30	2024-08-20 22:36:30
126	148	15	1	2024-08-20 22:36:30	2024-08-20 22:36:30
127	148	16	1	2024-08-20 22:36:30	2024-08-20 22:36:30
128	152	11	1	2024-08-20 23:19:14	2024-08-20 23:19:14
129	152	12	1	2024-08-20 23:19:14	2024-08-20 23:19:14
130	152	13	1	2024-08-20 23:19:14	2024-08-20 23:19:14
131	152	16	1	2024-08-20 23:19:14	2024-08-20 23:19:14
132	153	11	1	2024-08-20 23:22:44	2024-08-20 23:22:44
133	153	13	1	2024-08-20 23:22:44	2024-08-20 23:22:44
134	153	16	1	2024-08-20 23:22:44	2024-08-20 23:22:44
135	154	11	1	2024-08-20 23:26:10	2024-08-20 23:26:10
136	154	13	1	2024-08-20 23:26:10	2024-08-20 23:26:10
137	154	16	1	2024-08-20 23:26:10	2024-08-20 23:26:10
138	155	11	1	2024-08-20 23:31:03	2024-08-20 23:31:03
139	155	13	1	2024-08-20 23:31:03	2024-08-20 23:31:03
140	155	16	1	2024-08-20 23:31:03	2024-08-20 23:31:03
141	158	26	0	2024-08-21 06:06:30	2024-08-21 06:06:30
142	158	27	0	2024-08-21 06:06:30	2024-08-21 06:06:30
143	158	29	0	2024-08-21 06:06:30	2024-08-21 06:06:30
144	159	26	1	2024-08-21 06:33:55	2024-08-21 06:33:55
145	159	27	1	2024-08-21 06:33:55	2024-08-21 06:33:55
146	159	28	1	2024-08-21 06:33:55	2024-08-21 06:33:55
147	159	29	0	2024-08-21 06:33:55	2024-08-21 06:33:55
148	160	29	1	2024-08-21 07:48:57	2024-08-21 07:48:57
149	160	26	1	2024-08-21 07:48:57	2024-08-21 07:48:57
150	162	26	1	2024-08-21 08:33:32	2024-08-21 08:33:32
151	162	28	1	2024-08-21 08:33:32	2024-08-21 08:33:32
152	163	26	1	2024-08-21 08:38:20	2024-08-21 08:38:20
153	163	27	1	2024-08-21 08:38:20	2024-08-21 08:38:20
154	164	26	1	2024-08-21 08:42:12	2024-08-21 08:42:12
155	164	28	1	2024-08-21 08:42:12	2024-08-21 08:42:12
156	166	28	1	2024-08-21 08:58:50	2024-08-21 08:58:50
157	166	27	1	2024-08-21 08:58:50	2024-08-21 08:58:50
158	171	33	1	2024-08-21 09:36:31	2024-08-21 09:36:31
159	175	33	1	2024-08-21 13:32:05	2024-08-21 13:32:05
160	181	26	1	2024-08-23 06:38:32	2024-08-23 06:38:32
161	181	27	1	2024-08-23 06:38:32	2024-08-23 06:38:32
162	181	29	1	2024-08-23 06:38:32	2024-08-23 06:38:32
163	182	27	1	2024-08-23 22:17:20	2024-08-23 22:17:20
164	182	28	1	2024-08-23 22:17:20	2024-08-23 22:17:20
165	182	29	1	2024-08-23 22:17:20	2024-08-23 22:17:20
166	183	26	1	2024-08-26 08:32:48	2024-08-26 08:32:48
167	183	27	1	2024-08-26 08:32:48	2024-08-26 08:32:48
168	183	28	0	2024-08-26 08:32:48	2024-08-26 08:32:48
169	183	29	1	2024-08-26 08:32:48	2024-08-26 08:32:48
170	184	26	1	2024-08-26 13:06:02	2024-08-26 13:06:02
171	184	27	1	2024-08-26 13:06:02	2024-08-26 13:06:02
172	184	29	1	2024-08-26 13:06:02	2024-08-26 13:06:02
173	187	26	1	2024-09-03 10:45:45	2024-09-03 10:45:45
174	187	27	2	2024-09-03 10:45:45	2024-09-03 10:45:45
175	187	28	2	2024-09-03 10:45:45	2024-09-03 10:45:45
176	187	29	2	2024-09-03 10:45:45	2024-09-03 10:45:45
177	188	26	1	2024-09-03 11:20:08	2024-09-03 11:20:08
178	188	27	2	2024-09-03 11:20:08	2024-09-03 11:20:08
179	188	28	2	2024-09-03 11:20:08	2024-09-03 11:20:08
180	188	29	2	2024-09-03 11:20:08	2024-09-03 11:20:08
181	189	27	2	2024-09-03 11:38:55	2024-09-03 11:38:55
182	189	28	2	2024-09-03 11:38:55	2024-09-03 11:38:55
183	189	29	2	2024-09-03 11:38:55	2024-09-03 11:38:55
184	189	26	1	2024-09-03 11:38:55	2024-09-03 11:38:55
185	191	26	1	2024-09-03 11:54:45	2024-09-03 11:54:45
186	191	27	2	2024-09-03 11:54:45	2024-09-03 11:54:45
187	191	28	2	2024-09-03 11:54:45	2024-09-03 11:54:45
188	191	29	1	2024-09-03 11:54:45	2024-09-03 11:54:45
189	192	29	2	2024-09-03 11:58:39	2024-09-03 11:58:39
190	193	26	1	2024-09-03 12:40:27	2024-09-03 12:40:27
191	193	27	2	2024-09-03 12:40:27	2024-09-03 12:40:27
192	193	28	1	2024-09-03 12:40:27	2024-09-03 12:40:27
193	193	29	2	2024-09-03 12:40:27	2024-09-03 12:40:27
194	194	33	1	2024-09-05 19:32:24	2024-09-05 19:32:24
195	195	33	1	2024-09-06 07:51:17	2024-09-06 07:51:17
196	198	33	1	2024-09-07 15:58:54	2024-09-07 15:58:54
197	201	27	1	2024-09-09 11:40:17	2024-09-09 11:40:17
198	201	29	1	2024-09-09 11:40:17	2024-09-09 11:40:17
199	203	27	1	2024-09-09 20:59:20	2024-09-09 20:59:20
200	203	28	1	2024-09-09 20:59:20	2024-09-09 20:59:20
201	203	29	1	2024-09-09 20:59:20	2024-09-09 20:59:20
202	205	26	1	2024-09-10 07:23:03	2024-09-10 07:23:03
203	205	27	1	2024-09-10 07:23:03	2024-09-10 07:23:03
204	205	28	1	2024-09-10 07:23:03	2024-09-10 07:23:03
205	208	29	1	2024-09-10 11:39:55	2024-09-10 11:39:55
206	208	26	1	2024-09-10 11:39:56	2024-09-10 11:39:56
207	208	27	1	2024-09-10 11:39:56	2024-09-10 11:39:56
208	208	28	1	2024-09-10 11:39:56	2024-09-10 11:39:56
209	209	27	1	2024-09-10 16:26:58	2024-09-10 16:26:58
210	209	29	1	2024-09-10 16:26:58	2024-09-10 16:26:58
211	210	27	1	2024-09-10 16:53:04	2024-09-10 16:53:04
212	210	28	1	2024-09-10 16:53:04	2024-09-10 16:53:04
213	211	26	1	2024-09-10 17:19:06	2024-09-10 17:19:06
214	211	27	1	2024-09-10 17:19:06	2024-09-10 17:19:06
215	211	28	1	2024-09-10 17:19:06	2024-09-10 17:19:06
216	211	29	1	2024-09-10 17:19:06	2024-09-10 17:19:06
217	212	26	1	2024-09-10 17:31:16	2024-09-10 17:31:16
218	212	27	1	2024-09-10 17:31:16	2024-09-10 17:31:16
219	212	28	1	2024-09-10 17:31:16	2024-09-10 17:31:16
220	212	29	1	2024-09-10 17:31:16	2024-09-10 17:31:16
221	215	26	1	2024-09-10 21:09:44	2024-09-10 21:09:44
222	215	27	1	2024-09-10 21:09:44	2024-09-10 21:09:44
223	215	28	1	2024-09-10 21:09:44	2024-09-10 21:09:44
224	215	29	1	2024-09-10 21:09:44	2024-09-10 21:09:44
225	217	33	1	2024-09-13 08:59:17	2024-09-13 08:59:17
226	218	26	1	2024-09-13 09:11:26	2024-09-13 09:11:26
227	218	27	0	2024-09-13 09:11:26	2024-09-13 09:11:26
228	218	29	0	2024-09-13 09:11:26	2024-09-13 09:11:26
229	221	25	1	2024-09-14 13:23:05	2024-09-14 13:23:05
230	221	31	3	2024-09-14 13:23:05	2024-09-14 13:23:05
231	243	29	2	2024-09-30 12:15:32	2024-09-30 12:15:32
232	243	26	1	2024-09-30 12:15:32	2024-09-30 12:15:32
233	243	27	2	2024-09-30 12:15:32	2024-09-30 12:15:32
234	244	27	1	2024-09-30 13:09:55	2024-09-30 13:09:55
235	244	29	1	2024-09-30 13:09:55	2024-09-30 13:09:55
236	245	27	1	2024-09-30 13:10:43	2024-09-30 13:10:43
237	245	29	1	2024-09-30 13:10:43	2024-09-30 13:10:43
238	246	27	1	2024-09-30 13:12:53	2024-09-30 13:12:53
239	246	29	1	2024-09-30 13:12:53	2024-09-30 13:12:53
240	247	27	1	2024-09-30 13:14:06	2024-09-30 13:14:06
241	247	29	1	2024-09-30 13:14:06	2024-09-30 13:14:06
242	248	25	1	2024-09-30 16:58:22	2024-09-30 16:58:22
243	249	29	1	2024-09-30 17:45:07	2024-09-30 17:45:07
244	249	26	1	2024-09-30 17:45:07	2024-09-30 17:45:07
245	249	27	1	2024-09-30 17:45:07	2024-09-30 17:45:07
246	250	33	1	2024-10-01 05:48:50	2024-10-01 05:48:50
247	251	25	1	2024-10-01 06:42:24	2024-10-01 06:42:24
248	251	31	1	2024-10-01 06:42:24	2024-10-01 06:42:24
249	252	33	1	2024-10-01 06:49:44	2024-10-01 06:49:44
250	253	42	1	2024-10-01 11:48:34	2024-10-01 11:48:34
251	253	43	1	2024-10-01 11:48:34	2024-10-01 11:48:34
252	253	44	1	2024-10-01 11:48:34	2024-10-01 11:48:34
253	261	33	1	2024-10-02 13:55:13	2024-10-02 13:55:13
254	262	42	6	2024-10-03 17:03:18	2024-10-03 17:03:18
255	262	43	1	2024-10-03 17:03:18	2024-10-03 17:03:18
256	262	44	1	2024-10-03 17:03:18	2024-10-03 17:03:18
257	289	26	1	2024-10-09 02:24:57	2024-10-09 02:24:57
258	289	27	1	2024-10-09 02:24:58	2024-10-09 02:24:58
259	289	29	1	2024-10-09 02:24:58	2024-10-09 02:24:58
260	290	26	1	2024-10-09 02:53:38	2024-10-09 02:53:38
261	290	27	1	2024-10-09 02:53:38	2024-10-09 02:53:38
262	294	33	1	2024-10-09 07:32:34	2024-10-09 07:32:34
263	296	55	1	2024-10-09 12:01:04	2024-10-09 12:01:04
264	296	60	1	2024-10-09 12:01:04	2024-10-09 12:01:04
265	297	25	1	2024-10-09 12:11:07	2024-10-09 12:11:07
266	297	31	1	2024-10-09 12:11:07	2024-10-09 12:11:07
267	298	60	1	2024-10-09 12:19:58	2024-10-09 12:19:58
268	298	55	1	2024-10-09 12:19:58	2024-10-09 12:19:58
269	299	31	1	2024-10-09 12:23:39	2024-10-09 12:23:39
270	300	31	1	2024-10-09 12:30:38	2024-10-09 12:30:38
271	324	60	2	2024-10-10 06:32:54	2024-10-10 06:32:54
272	324	55	1	2024-10-10 06:32:54	2024-10-10 06:32:54
273	328	31	1	2024-10-10 10:34:56	2024-10-10 10:34:56
274	329	31	1	2024-10-10 10:49:29	2024-10-10 10:49:29
275	331	33	1	2024-10-11 03:37:43	2024-10-11 03:37:43
276	335	60	1	2024-10-17 05:12:38	2024-10-17 05:12:38
277	335	55	1	2024-10-17 05:12:38	2024-10-17 05:12:38
278	336	55	1	2024-10-17 11:42:27	2024-10-17 11:42:27
279	336	60	1	2024-10-17 11:42:27	2024-10-17 11:42:27
280	342	55	1	2024-10-18 17:24:40	2024-10-18 17:24:40
281	342	60	1	2024-10-18 17:24:40	2024-10-18 17:24:40
282	347	25	1	2024-10-19 08:05:13	2024-10-19 08:05:13
283	347	31	1	2024-10-19 08:05:13	2024-10-19 08:05:13
284	349	25	1	2024-10-19 08:14:57	2024-10-19 08:14:57
285	349	31	1	2024-10-19 08:14:57	2024-10-19 08:14:57
286	359	55	1	2024-10-19 11:41:16	2024-10-19 11:41:16
287	359	60	1	2024-10-19 11:41:16	2024-10-19 11:41:16
288	361	55	1	2024-10-19 12:03:27	2024-10-19 12:03:27
289	361	60	1	2024-10-19 12:03:27	2024-10-19 12:03:27
290	365	55	1	2024-10-20 09:37:47	2024-10-20 09:37:47
291	365	60	1	2024-10-20 09:37:47	2024-10-20 09:37:47
292	366	55	1	2024-10-20 09:38:27	2024-10-20 09:38:27
293	366	60	1	2024-10-20 09:38:27	2024-10-20 09:38:27
294	370	55	1	2024-10-20 10:19:45	2024-10-20 10:19:45
295	370	60	1	2024-10-20 10:19:45	2024-10-20 10:19:45
296	371	55	1	2024-10-20 10:20:26	2024-10-20 10:20:26
297	371	60	1	2024-10-20 10:20:26	2024-10-20 10:20:26
298	372	55	1	2024-10-20 10:26:50	2024-10-20 10:26:50
299	372	60	1	2024-10-20 10:26:50	2024-10-20 10:26:50
300	377	25	1	2024-10-21 04:45:31	2024-10-21 04:45:31
301	377	31	1	2024-10-21 04:45:31	2024-10-21 04:45:31
302	380	25	1	2024-10-21 04:54:42	2024-10-21 04:54:42
303	380	31	1	2024-10-21 04:54:42	2024-10-21 04:54:42
304	381	55	1	2024-10-21 05:02:18	2024-10-21 05:02:18
305	381	60	1	2024-10-21 05:02:18	2024-10-21 05:02:18
306	387	55	1	2024-10-21 07:30:47	2024-10-21 07:30:47
307	387	60	1	2024-10-21 07:30:47	2024-10-21 07:30:47
308	388	55	1	2024-10-21 11:18:50	2024-10-21 11:18:50
309	388	60	1	2024-10-21 11:18:50	2024-10-21 11:18:50
310	389	55	1	2024-10-21 12:24:31	2024-10-21 12:24:31
311	389	60	1	2024-10-21 12:24:31	2024-10-21 12:24:31
312	390	55	1	2024-10-21 13:25:01	2024-10-21 13:25:01
313	390	60	1	2024-10-21 13:25:01	2024-10-21 13:25:01
314	391	55	1	2024-10-21 14:58:11	2024-10-21 14:58:11
315	391	60	1	2024-10-21 14:58:11	2024-10-21 14:58:11
316	398	55	1	2024-10-22 13:32:51	2024-10-22 13:32:51
317	398	60	1	2024-10-22 13:32:52	2024-10-22 13:32:52
318	410	55	1	2024-10-23 15:45:41	2024-10-23 15:45:41
319	410	60	1	2024-10-23 15:45:41	2024-10-23 15:45:41
320	414	55	1	2024-10-24 04:01:59	2024-10-24 04:01:59
321	414	60	1	2024-10-24 04:01:59	2024-10-24 04:01:59
322	416	55	1	2024-10-24 04:25:10	2024-10-24 04:25:10
323	416	60	1	2024-10-24 04:25:10	2024-10-24 04:25:10
324	420	55	1	2024-10-24 06:16:45	2024-10-24 06:16:45
325	420	60	1	2024-10-24 06:16:45	2024-10-24 06:16:45
326	421	60	1	2024-10-24 06:50:39	2024-10-24 06:50:39
327	425	60	1	2024-10-24 12:49:21	2024-10-24 12:49:21
328	425	55	1	2024-10-24 12:49:21	2024-10-24 12:49:21
329	427	61	1	2024-10-24 13:08:54	2024-10-24 13:08:54
330	427	62	1	2024-10-24 13:08:54	2024-10-24 13:08:54
331	428	61	1	2024-10-24 13:14:31	2024-10-24 13:14:31
332	428	62	1	2024-10-24 13:14:31	2024-10-24 13:14:31
333	432	25	1	2024-10-30 07:57:58	2024-10-30 07:57:58
334	433	61	1	2024-10-30 13:21:28	2024-10-30 13:21:28
335	433	62	1	2024-10-30 13:21:28	2024-10-30 13:21:28
336	442	61	1	2024-11-05 14:29:21	2024-11-05 14:29:21
337	442	62	1	2024-11-05 14:29:21	2024-11-05 14:29:21
338	443	61	1	2024-11-05 14:34:14	2024-11-05 14:34:14
339	443	62	1	2024-11-05 14:34:14	2024-11-05 14:34:14
340	447	61	1	2024-11-05 15:48:39	2024-11-05 15:48:39
341	447	62	1	2024-11-05 15:48:39	2024-11-05 15:48:39
342	448	61	1	2024-11-06 07:53:20	2024-11-06 07:53:20
343	448	62	1	2024-11-06 07:53:20	2024-11-06 07:53:20
344	449	25	1	2024-11-06 12:01:02	2024-11-06 12:01:02
345	449	31	1	2024-11-06 12:01:02	2024-11-06 12:01:02
346	453	63	1	2024-11-06 15:08:16	2024-11-06 15:08:16
347	453	64	1	2024-11-06 15:08:16	2024-11-06 15:08:16
348	454	63	1	2024-11-06 16:10:46	2024-11-06 16:10:46
349	454	64	1	2024-11-06 16:10:46	2024-11-06 16:10:46
350	455	63	1	2024-11-07 05:06:47	2024-11-07 05:06:47
351	455	64	1	2024-11-07 05:06:47	2024-11-07 05:06:47
352	456	61	1	2024-11-07 06:28:17	2024-11-07 06:28:17
353	456	62	1	2024-11-07 06:28:17	2024-11-07 06:28:17
354	457	61	1	2024-11-07 06:29:28	2024-11-07 06:29:28
355	457	62	1	2024-11-07 06:29:28	2024-11-07 06:29:28
356	458	61	1	2024-11-07 06:31:26	2024-11-07 06:31:26
357	458	62	1	2024-11-07 06:31:26	2024-11-07 06:31:26
358	459	64	1	2024-11-07 06:36:29	2024-11-07 06:36:29
359	460	64	1	2024-11-07 06:36:41	2024-11-07 06:36:41
360	461	25	1	2024-11-07 06:43:48	2024-11-07 06:43:48
361	461	31	1	2024-11-07 06:43:48	2024-11-07 06:43:48
362	462	25	1	2024-11-07 06:44:14	2024-11-07 06:44:14
363	462	31	1	2024-11-07 06:44:14	2024-11-07 06:44:14
364	463	25	1	2024-11-07 06:45:23	2024-11-07 06:45:23
365	463	31	1	2024-11-07 06:45:23	2024-11-07 06:45:23
366	464	31	1	2024-11-07 07:37:06	2024-11-07 07:37:06
367	465	61	1	2024-11-07 07:40:31	2024-11-07 07:40:31
368	465	62	1	2024-11-07 07:40:31	2024-11-07 07:40:31
369	466	63	1	2024-11-07 07:46:50	2024-11-07 07:46:50
370	466	64	1	2024-11-07 07:46:50	2024-11-07 07:46:50
371	467	63	1	2024-11-07 14:29:33	2024-11-07 14:29:33
372	467	64	1	2024-11-07 14:29:33	2024-11-07 14:29:33
373	468	63	1	2024-11-07 14:38:33	2024-11-07 14:38:33
374	468	64	1	2024-11-07 14:38:33	2024-11-07 14:38:33
375	469	63	1	2024-11-07 16:44:27	2024-11-07 16:44:27
376	469	64	1	2024-11-07 16:44:27	2024-11-07 16:44:27
377	470	63	1	2024-11-07 16:58:03	2024-11-07 16:58:03
378	470	64	1	2024-11-07 16:58:03	2024-11-07 16:58:03
379	471	63	1	2024-11-07 17:11:40	2024-11-07 17:11:40
380	471	64	1	2024-11-07 17:11:40	2024-11-07 17:11:40
381	472	64	1	2024-11-07 17:32:02	2024-11-07 17:32:02
382	473	64	1	2024-11-07 17:46:48	2024-11-07 17:46:48
383	475	63	1	2024-11-07 17:56:37	2024-11-07 17:56:37
384	475	64	1	2024-11-07 17:56:37	2024-11-07 17:56:37
385	477	64	1	2024-11-07 18:05:05	2024-11-07 18:05:05
386	478	63	1	2024-11-07 19:05:11	2024-11-07 19:05:11
387	478	64	1	2024-11-07 19:05:11	2024-11-07 19:05:11
388	479	64	1	2024-11-07 19:15:14	2024-11-07 19:15:14
389	480	63	1	2024-11-08 09:33:56	2024-11-08 09:33:56
390	480	64	1	2024-11-08 09:33:56	2024-11-08 09:33:56
391	481	63	1	2024-11-08 12:09:48	2024-11-08 12:09:48
392	481	64	1	2024-11-08 12:09:48	2024-11-08 12:09:48
393	482	63	1	2024-11-08 13:01:49	2024-11-08 13:01:49
394	482	64	1	2024-11-08 13:01:49	2024-11-08 13:01:49
395	483	63	1	2024-11-08 16:26:17	2024-11-08 16:26:17
396	483	64	1	2024-11-08 16:26:17	2024-11-08 16:26:17
397	484	63	1	2024-11-12 06:00:52	2024-11-12 06:00:52
398	484	64	1	2024-11-12 06:00:52	2024-11-12 06:00:52
399	485	64	1	2024-11-16 08:42:46	2024-11-16 08:42:46
\.


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (id, user_id, booking_type, booking_id, yatch_id, package_id, booking_date, slot_from, slot_to, no_of_adults, no_of_children, special_requests, payment_mode, sub_total, tax, tax_percentage, grand_total, add_on_total, need_update_on_email_whatsap, created_by, created_for, profile_title, first_name, last_name, email, dial_code, phone_number, created_at, updated_at, offer_id, discount, booking_status, is_manual, provider_user_id, extra_product_prices, coupon_id, coupon_discount_amount, payment_type, coupon_discount, is_reviewed, rating, review, refund, reschedule_reason, cancel_reason, package_extra_hours, reschedule_price, new_grand_total, reschedule_refund_amount, is_rescheduled, reschedule_tax, reschedule_extra_hours_price, refund_choice, refund_percentage) FROM stdin;
2	0	pacakge	BL-1723114904	28	94	2024-08-05	02:00:00	22:00:00	4	0	hi	0	100	12.5	5	262.5	150	1	59	0	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-08-08 11:01:44	2024-08-08 11:01:44	11	0	0	1	59	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
3	0	yatch	BL-1723439744	30	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	63	0	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-08-12 05:15:44	2024-08-12 05:15:44	10	0	0	1	63	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
5	51	yatch	BL-1723588487	29	0	2024-08-14	13:00:00	14:00:00	6	5		0	6000	150	5	3150	0	1	60	51	Mr	Ahmad	Ali	razahamid34@gmail.com	92	3441562554	2024-08-13 22:34:47	2024-08-13 22:34:47	23	3000	0	1	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
7	51	yatch	BL-1723631788	29	0	2024-08-18	08:00:00	10:00:00	5	4		0	4000	100	5	2100	0	1	60	51	Ms	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-08-14 10:36:28	2024-08-14 10:36:28	19	2000	0	1	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
8	51	yatch	BL-1723639994	29	0	2024-08-18	08:00:00	12:00:00	5	2	remarks	0	4000	100	5	2100	0	1	60	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-08-14 12:53:14	2024-08-14 12:53:14	19	2000	0	1	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
10	51	yatch	BL-1723641470	31	0	2024-08-14	20:00:00	22:00:00	2	5		0	500	0	5	0	0	1	68	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-08-14 13:17:50	2024-08-14 13:17:50	28	500	0	1	68	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
13	51	yatch	BL-1723642339	31	0	2024-08-14	18:00:00	19:00:00	5	5	hello hi	0	250	0	5	0	0	1	68	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-08-14 13:32:19	2024-08-14 13:32:19	28	250	0	1	68	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
14	51	yatch	BL-1723642443	31	0	2024-08-14	18:00:00	19:00:00	5	5		0	250	0	5	0	0	1	68	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-08-14 13:34:03	2024-08-14 13:34:03	28	250	0	1	68	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
16	75	yatch	BL-1723729806	31	0	2024-08-15	18:00:00	19:00:00	2	0		0	500	25	5	525	0	0	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	971	3313334563	2024-08-15 13:50:13	2024-08-15 13:50:13	0	0	0	0	68	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
21	75	yatch	BL-1723732614	31	0	2024-08-15	19:00:00	20:00:00	2	2		0	500	25	5	525	0	1	75	75	mr	Usama	Shakeel	ushakeel010@gmail.com	91	3317277323	2024-08-15 14:37:18	2024-08-15 14:37:18	0	0	0	0	68	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
23	75	yatch	BL-1723733421	31	0	2024-08-15	19:00:00	20:00:00	2	2		0	500	25	5	525	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	2024-08-15 14:50:43	2024-08-15 14:50:43	0	0	0	0	68	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
24	0	yatch	BL-1723733572	35	0	2024-08-15	20:00:00	21:00:00	2	5	Need cocktail drinks	0	30	1.2	5	25.2	0	0	76	0	Mr	Anil	Navis	anil@dxbusinessgroup.com	971	564005096	2024-08-15 14:52:52	2024-08-15 14:52:52	30	6	0	1	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
25	75	yatch	BL-1723740002	31	0	2024-08-15	21:00:00	22:00:00	2	3	Special text	0	500	25	5	525	0	1	75	75	Mr	Usama	Shakeel	ushakeel010@gmail.com	91	3315788394	2024-08-15 16:40:31	2024-08-15 16:40:31	0	0	0	0	68	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
27	0	yatch	BL-1723764891	36	0	2024-08-16	04:00:00	06:00:00	6	3		0	100	-10	5	-210	0	1	68	0	Mr	bw	hw	z.falak777@gmail.com	971	184848484848	2024-08-15 23:34:51	2024-08-15 23:34:51	32	300	0	1	68	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
32	0	yatch	BL-1723783570	35	0	2024-08-16	20:00:00	22:00:00	2	8		0	60	2.4	5	50.4	0	1	76	0	Mr	anil	navks	h@g.ckm	355	8454664846	2024-08-16 04:46:10	2024-08-16 04:46:10	30	12	0	1	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
1	0	yatch	BL-1723103623	28	0	2024-08-05	02:00:00	22:00:00	4	0	hi	0	390	19.5	5	409.5	0	1	59	0	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-08-08 07:53:43	2024-08-16 09:12:33	11	0	1	1	59	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
6	51	yatch	BL-1723589028	29	0	2024-08-20	02:00:00	03:00:00	5	4		0	5000	125	5	2625	0	1	60	51	Mr	Ali	G	razahamid34@gmail.com	92	3441562554	2024-08-13 22:43:48	2024-09-30 17:29:31	21	2500	10	1	60	0	0	0	2	0	0	0	\N	2625	\N	\N	0	0	0	0	0	0	0	\N	0
33	59	yatch	BL-1723791644	31	0	2024-08-22	08:00:00	10:00:00	5	0	test	0	200	10	5	210	0	1	68	59	Mr	Sooraj	Sabu	sooraj@yopmail.com	971	505086084	2024-08-16 07:00:44	2024-08-16 07:00:44	0	0	0	1	68	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
34	0	yatch	BL-1723792894	31	0	2024-08-22	18:00:00	21:00:00	5	0	bbv	0	1500	75	5	1575	0	0	68	0	Mr	Sooraj	Sabu	hhjz@gh.com	971	505086055	2024-08-16 07:21:34	2024-08-16 07:21:34	0	0	0	1	68	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
15	51	pacakge	BL-1723669375	29	109	2024-08-18	08:00:00	10:00:00	5	2		0	12	0.6	5	12.6	0	1	60	51	Mr	Ali	Raza	razahamid34@gmail.com	92	3441562554	2024-08-14 21:02:55	2024-08-16 11:32:00	0	0	2	1	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
35	75	yatch	BL-1723798284	36	0	2024-08-16	17:00:00	18:00:00	2	2		0	300	15	5	315	0	1	75	75	Mr	Usama	Shakeel	shhhdjsj	91	3315002750	2024-08-16 08:52:02	2024-08-16 08:52:02	0	0	0	0	68	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
4	51	yatch	BL-1723587892	29	0	2024-08-14	13:00:00	14:00:00	4	6		0	6000	150	5	3150	0	1	60	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-08-13 22:24:52	2024-09-30 17:30:54	19	3000	10	1	60	0	0	0	2	0	0	0	\N	3150	\N	\N	0	0	0	0	0	0	0	\N	0
37	51	pacakge	BL-1723812998	29	123	2024-08-18	14:00:00	15:00:00	5	2		0	2000	115	5	2415	300	1	60	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-08-16 12:56:38	2024-09-30 16:54:41	0	0	10	1	60	0	0	0	2	0	0	0	\N	2415	\N	\N	0	0	0	0	0	0	0	\N	0
26	51	pacakge	BL-1723747403	29	123	2024-08-18	09:00:00	12:00:00	2	5	this is special request	0	2000	395	5	8295	900	1	60	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-08-15 18:43:23	2024-09-30 17:27:53	0	0	10	1	60	5000	0	0	2	0	0	0	\N	8295	\N	\N	0	0	0	0	0	0	0	\N	0
38	75	pacakge	BL-1723835625	4	3	2024-08-17	05:00:00	06:00:00	2	0		0	1500	79	5	1659	20	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	2024-08-16 19:14:10	2024-08-16 19:14:10	0	0	0	0	8	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
39	75	pacakge	BL-1723839478	4	3	2024-08-17	05:00:00	07:00:00	2	0		0	1500	75	5	1575	0	1	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	2024-08-16 20:18:23	2024-08-16 20:18:23	0	0	0	0	8	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
42	50	yatch	BL-1723848245	32	0	2024-08-18	05:00:00	06:00:00	8	2		0	0	0	5	0	0	1	50	50	Mr	Asad	Nazir	asadnazir289@gmail.com	+92	3441560318	2024-08-16 22:44:06	2024-08-16 22:44:06	0	0	0	0	63	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
43	74	pacakge	BL-1723874699	35	128	2024-08-17	20:00:00	21:00:00	2	3	Xghhjj	0	1500	83	5	1743	40	1	76	74	Mr	Fg	Fgh	anilnavis@gmail.com	971	866699966	2024-08-17 06:04:59	2024-08-17 10:24:00	0	0	1	1	76	120	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
40	75	pacakge	BL-1723841031	4	3	2024-08-17	05:00:00	07:00:00	2	0		0	1500	129.5	5	2719.5	30	1	75	75	Mr	Usama	Shakeel	ushakeel010@gmail.com	91	331586460	2024-08-16 20:44:14	2024-08-17 11:58:56	0	0	10	0	8	1060	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
41	75	pacakge	BL-1723841221	4	3	2024-08-17	05:00:00	07:00:00	2	0		0	1500	129.5	5	2719.5	30	1	75	75	Mr	Usama	Shakeel	ushakeel010@gmail.com	91	331506460	2024-08-16 20:47:27	2024-08-17 12:06:20	0	0	10	0	8	1060	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
44	75	pacakge	BL-1723898405	4	3	2024-08-17	17:00:00	18:00:00	3	0		0	1500	129.5	5	2719.5	30	1	75	75	Mr	Usama	Shakeel	ushakeel010@gmail.com	91	331686860	2024-08-17 12:40:28	2024-08-17 12:40:28	0	0	0	0	8	1060	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
36	75	yatch	BL-1723812905	29	0	2024-08-17	08:00:00	10:00:00	2	2		0	10000	500	5	10500	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	2024-08-16 12:55:28	2024-08-17 12:59:44	0	0	10	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
45	75	pacakge	BL-1723898802	4	3	2024-08-17	18:00:00	19:00:00	2	0		0	1500	129	5	2709	20	1	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	2024-08-17 12:47:04	2024-08-17 17:42:17	0	0	10	0	8	1060	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
46	78	pacakge	BL-1723918350	4	3	2024-08-18	13:00:00	14:00:00	1	2		0	1500	126	5	2646	20	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-17 18:12:49	2024-08-17 18:12:49	0	0	0	0	8	1000	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
47	78	pacakge	BL-1723923397	4	3	2024-08-17	07:00:00	08:00:00	1	12		0	1500	125.5	5	2635.5	10	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-17 19:36:57	2024-08-17 19:36:57	0	0	0	0	8	1000	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
48	78	pacakge	BL-1723924612	4	3	2024-08-17	07:00:00	08:00:00	1	2		0	1500	82	5	1722	20	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-17 19:56:53	2024-08-17 19:56:53	0	0	0	0	8	120	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
49	78	pacakge	BL-1723924858	4	3	2024-08-18	13:00:00	14:00:00	1	2		0	1500	226.5	5	4756.5	30	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-17 20:00:59	2024-08-17 20:00:59	0	0	0	0	8	3000	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
52	0	pacakge	BL-1723933862	36	126	2024-08-18	04:00:00	05:00:00	3	3		0	100	65	5	1365	1000	1	68	0	Mr	hh	hh	tet@gmail.com	971	8248041222	2024-08-17 22:31:02	2024-08-17 22:31:02	0	0	0	1	68	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
53	0	pacakge	BL-1723934170	36	126	2024-08-18	04:00:00	05:00:00	3	3		0	100	65	5	1365	1000	1	68	0	Mr	test	ts	z.falak777@gmail.com	971	852248855844	2024-08-17 22:36:10	2024-08-17 22:36:10	0	0	0	1	68	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
54	78	pacakge	BL-1723937474	4	3	2024-08-18	07:00:00	08:00:00	1	2	my special request	0	1500	78.5	5	1648.5	10	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-17 23:31:35	2024-08-17 23:31:35	0	0	0	0	8	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
55	78	pacakge	BL-1723938831	4	3	2024-08-18	16:00:00	17:00:00	1	2	my special interest	0	1500	226.5	5	4756.5	30	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-17 23:53:53	2024-08-17 23:53:53	0	0	0	0	8	3000	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
56	0	pacakge	BL-1723967337	35	128	2024-08-18	12:00:00	13:00:00	2	1	Fgsuus	0	1500	80	5	1680	40	1	76	0	Mr	anil	navis	h@g.com	355	54554846	2024-08-18 07:48:57	2024-08-18 07:48:57	0	0	0	1	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
57	0	pacakge	BL-1723967454	35	128	2024-08-18	12:00:00	13:00:00	2	2	Dyuui	0	1500	80	5	1680	40	1	76	0	Mr	Anl	Haj	gm@j.com	971	946499494	2024-08-18 07:50:54	2024-08-18 07:50:54	0	0	0	1	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
58	0	pacakge	BL-1723967872	35	128	2024-08-18	12:00:00	13:00:00	2	2	Fghj hjjjbn.    Hj	0	1500	80	5	1680	40	1	76	0	Mr	Anil	Nabyr	ghhh@gj.com	971	566689896	2024-08-18 07:57:52	2024-08-18 07:57:52	0	0	0	1	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
59	0	pacakge	BL-1723968767	35	128	2024-08-18	13:00:00	14:00:00	2	5	Burjee me me r	0	1500	80	5	1680	40	1	76	0	Mr	david	david	vdbd@hj.com	355	8484884994	2024-08-18 08:12:47	2024-08-18 08:12:47	0	0	0	1	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
64	75	pacakge	BL-1723974342	35	128	2024-08-18	16:00:00	17:00:00	4	0	hi	0	1500	75	5	1575	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-08-18 09:46:20	2024-08-18 09:46:20	0	0	0	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
61	77	pacakge	BL-1723973069	35	128	2024-08-18	18:00:00	19:00:00	2	2	Hash	0	1500	77	5	1617	40	1	77	77	Mr	Anil	navis	an@an.com	+971	534005096	2024-08-18 09:24:49	2024-08-18 13:43:12	0	0	2	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
66	77	pacakge	BL-1723974992	35	128	2024-08-18	19:00:00	20:00:00	2	0		0	1500	80	5	1680	40	0	77	77	Ms	Anil	navis	an@an.com	+971	534005096	2024-08-18 09:56:57	2024-08-18 09:56:57	0	0	0	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
67	77	pacakge	BL-1723975070	35	128	2024-08-18	19:00:00	20:00:00	3	0		0	1500	84	5	1764	120	1	77	77	Ms	Anil	navis	an@an.com	+971	534005096	2024-08-18 09:58:11	2024-08-18 09:58:25	0	0	10	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
68	77	pacakge	BL-1723975524	35	128	2024-08-18	19:00:00	20:00:00	2	0		0	1500	78	5	1638	0	0	77	77	Ms	Anil	navis	an@an.com	+971	534005096	2024-08-18 10:05:51	2024-08-18 10:05:51	0	0	0	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
69	77	pacakge	BL-1723977547	35	128	2024-08-18	16:00:00	17:00:00	2	2		0	1500	80	5	1680	40	0	77	77	Mr	Anil	navis	an@an.com	+971	534005096	2024-08-18 10:39:42	2024-08-18 10:39:42	0	0	0	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
70	59	pacakge	BL-1724043984	31	127	2024-08-21	12:00:00	15:00:00	5	0	Special req	0	150	7.5	5	157.5	0	1	68	59	Mr	SOORAJ SABU	Sabu	sooraj@yopmail.com	971	505086045	2024-08-19 05:06:24	2024-08-19 05:06:24	0	0	0	1	68	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
71	59	yatch	BL-1724048376	31	0	2024-08-22	17:00:00	20:00:00	2	1	Hi	0	1500	75	5	1575	0	0	68	59	Mr	Sooda	Uh	sooraj@yopmail.com	971	505086048	2024-08-19 06:19:36	2024-08-19 06:19:36	0	0	0	1	68	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
72	59	pacakge	BL-1724048894	31	113	2024-08-22	18:00:00	20:00:00	2	0	Speed ail req	0	1500	85	5	1785	0	0	68	59	Mr	Sooraj	Sabu	sooraj@yopmail.com	971	505086084	2024-08-19 06:28:14	2024-08-19 06:28:14	0	0	0	1	68	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
73	51	pacakge	BL-1724051576	29	123	2024-08-19	12:00:00	13:00:00	5	6		0	2000	107.5	5	2257.5	150	1	60	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-08-19 07:12:56	2024-08-19 07:12:56	0	0	0	1	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
74	59	pacakge	BL-1724051914	31	113	2024-08-21	08:00:00	10:00:00	2	0		0	1500	80	5	1680	0	1	68	59	Mr	Soors	Gg	sooraj@yopmail.com	971	505086054	2024-08-19 07:18:34	2024-08-19 07:18:34	0	0	0	1	68	100	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
75	75	pacakge	BL-1724053707	4	3	2024-08-19	13:00:00	04:00:00	2	0		0	1500	78.5	5	1648.5	10	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	2024-08-19 07:48:52	2024-08-19 07:48:52	0	0	0	0	8	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
87	75	pacakge	BL-1724063621	35	129	2024-08-19	15:00:00	04:00:00	4	0	hi	0	1500	75	5	1575	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-08-19 10:33:55	2024-08-19 10:33:55	0	0	0	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
76	75	pacakge	BL-1724053795	35	128	2024-08-19	20:00:00	04:00:00	2	0		0	1500	80	5	1680	40	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	2024-08-19 07:50:29	2024-08-19 12:00:08	0	0	2	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
77	75	pacakge	BL-1724054455	35	128	2024-08-19	20:00:00	04:00:00	2	0		0	1500	80	5	1680	40	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	2024-08-19 08:01:28	2024-08-19 08:01:28	0	0	0	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
83	77	pacakge	BL-1724059575	4	3	2024-08-19	17:00:00	04:00:00	2	3	Ghulam	0	1500	75.5	5	1585.5	10	1	77	77	Mr	Anil	navis	an@an.com	+971	534005096	2024-08-19 09:26:53	2024-08-19 13:32:55	0	0	2	0	8	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
78	75	yatch	BL-1724054550	29	0	2024-08-19	16:00:00	17:00:00	2	0		0	6000	300	5	6300	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	2024-08-19 08:02:50	2024-08-19 12:03:38	0	0	2	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
79	75	pacakge	BL-1724054728	35	125	2024-08-20	13:00:00	04:00:00	2	2		0	200	12.75	5	267.75	55	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	2024-08-19 08:05:48	2024-08-19 12:06:01	0	0	2	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
81	75	pacakge	BL-1724054991	35	128	2024-08-19	13:00:00	04:00:00	4	0	hi	0	1500	75	5	1575	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-08-19 08:09:57	2024-08-19 08:09:57	0	0	0	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
82	77	pacakge	BL-1724059251	4	3	2024-08-19	18:00:00	04:00:00	2	2	Beheld	0	1500	75.5	5	1585.5	10	1	77	77	Mr	Anil	navis	an@an.com	+971	534005096	2024-08-19 09:20:52	2024-08-19 13:21:54	0	0	1	0	8	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
88	51	pacakge	BL-1724064469	29	123	2024-08-19	18:00:00	21:00:00	2	5		0	2000	122.5	5	2572.5	450	1	60	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-08-19 10:47:49	2024-08-19 10:47:49	0	0	0	1	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
84	77	pacakge	BL-1724062224	35	129	2024-08-19	15:00:00	04:00:00	2	2	Nothing	0	1500	75	5	1575	0	1	77	77	Mr	Anil	navis	an@an.com	+971	534005096	2024-08-19 10:10:41	2024-08-19 14:13:57	0	0	2	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
85	75	pacakge	BL-1724063355	35	129	2024-08-19	15:00:00	04:00:00	2	0		0	1500	77.75	5	1632.75	55	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	2024-08-19 10:29:39	2024-08-19 10:29:39	0	0	0	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
86	75	pacakge	BL-1724063466	35	129	2024-08-19	15:00:00	04:00:00	2	0		0	1500	77.75	5	1632.75	55	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	2024-08-19 10:31:27	2024-08-19 10:31:27	0	0	0	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
89	75	pacakge	BL-1724064445	35	129	2024-08-19	17:00:00	19:00:00	2	0		0	1500	77.75	5	1632.75	55	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	2024-08-19 10:47:52	2024-08-19 10:47:52	0	0	0	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
90	75	pacakge	BL-1724064506	35	129	2024-08-19	15:00:00	17:00:00	4	0	hi	0	1500	75	5	1575	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-08-19 10:48:34	2024-08-19 10:48:34	0	0	0	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
91	75	pacakge	BL-1724067109	35	128	2024-08-19	17:00:00	20:00:00	2	0		0	1500	80	5	1680	40	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	2024-08-19 11:32:22	2024-08-19 15:33:57	0	0	1	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
92	75	yatch	BL-1724068173	29	0	2024-08-20	07:00:00	08:00:00	2	0		0	5000	125	5	2625	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	2024-08-19 11:49:59	2024-08-19 11:49:59	20	2500	0	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
93	75	yatch	BL-1724068296	29	0	2024-08-20	07:00:00	08:00:00	2	0		0	5000	250	5	5250	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	2024-08-19 11:52:00	2024-08-19 15:53:55	0	0	1	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
95	75	pacakge	BL-1724068979	35	128	2024-08-20	13:00:00	16:00:00	2	0		0	1500	80	5	1680	40	1	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	2024-08-19 12:03:18	2024-08-19 12:03:18	0	0	0	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
94	75	yatch	BL-1724068902	29	0	2024-08-20	09:00:00	10:00:00	2	0		0	5000	125	5	2625	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	2024-08-19 12:02:03	2024-08-19 16:05:23	23	2500	1	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
96	51	pacakge	BL-1724070416	29	123	2024-08-21	06:00:00	09:00:00	25	30		0	2000	122.5	5	2572.5	150	1	60	51	Mr	Hamid	RAZA	razahamid34@gmail.com	92	3441562559	2024-08-19 12:26:56	2024-08-19 12:26:56	0	0	0	1	60	300	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
97	51	pacakge	BL-1724070455	29	123	2024-08-21	06:00:00	09:00:00	25	30		0	2000	122.5	5	2572.5	150	1	60	51	Mr	Hamid	RAZA	razahamid34@gmail.com	92	3441562559	2024-08-19 12:27:35	2024-08-19 12:27:35	0	0	0	1	60	300	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
98	0	pacakge	BL-1724070520	29	123	2024-08-19	18:00:00	21:00:00	5	2	hi	0	2000	107.5	5	2257.5	150	1	60	0	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-08-19 12:28:40	2024-08-19 12:28:40	0	0	0	1	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
102	83	pacakge	BL-1724070956	35	128	2024-08-19	20:00:00	23:00:00	2	0		0	1500	77	5	1617	40	0	83	83	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	2024-08-19 12:36:16	2024-08-19 12:36:16	0	0	0	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
103	83	pacakge	BL-1724071052	35	128	2024-08-19	20:00:00	23:00:00	2	0		0	1500	77	5	1617	40	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	2024-08-19 12:37:53	2024-08-19 16:40:29	0	0	1	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
104	83	pacakge	BL-1724071469	35	128	2024-08-20	13:00:00	16:00:00	3	0		0	1500	80	5	1680	40	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	2024-08-19 12:44:51	2024-08-19 16:46:08	0	0	2	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
105	83	pacakge	BL-1724072495	35	128	2024-08-20	18:00:00	21:00:00	2	0		0	1500	80	5	1680	40	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	2024-08-19 13:01:56	2024-08-19 13:01:56	0	0	0	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
106	83	pacakge	BL-1724072640	35	128	2024-08-20	18:00:00	21:00:00	2	0		0	1500	80	5	1680	40	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	2024-08-19 13:04:20	2024-08-19 13:04:20	0	0	0	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
107	83	pacakge	BL-1724072723	35	128	2024-08-20	18:00:00	21:00:00	2	0		0	1500	80	5	1680	40	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	2024-08-19 13:05:54	2024-08-19 13:05:54	0	0	0	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
108	83	pacakge	BL-1724072826	35	128	2024-08-20	18:00:00	21:00:00	2	0		0	1500	80	5	1680	40	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	2024-08-19 13:07:32	2024-08-19 13:07:32	0	0	0	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
109	83	pacakge	BL-1724073066	35	128	2024-08-20	18:00:00	21:00:00	2	0		0	1500	80	5	1680	40	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	2024-08-19 13:11:27	2024-08-19 13:11:27	0	0	0	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
110	83	pacakge	BL-1724073380	35	128	2024-08-20	18:00:00	21:00:00	2	0		0	1500	80	5	1680	40	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	2024-08-19 13:16:41	2024-08-19 13:16:41	0	0	0	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
112	83	pacakge	BL-1724074257	35	128	2024-08-20	18:00:00	21:00:00	2	0		0	1500	77	5	1617	40	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	2024-08-19 13:31:18	2024-08-19 13:31:18	0	0	0	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
113	83	yatch	BL-1724076999	29	0	2024-08-20	18:00:00	19:00:00	2	0		0	8000	200	5	4200	0	1	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	2024-08-19 14:17:05	2024-08-19 14:17:05	21	4000	0	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
115	83	pacakge	BL-1724077939	35	129	2024-08-19	15:00:00	17:00:00	4	0	hi	0	1500	75	5	1575	0	1	83	83	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-08-19 14:32:35	2024-08-19 14:32:35	0	0	0	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
116	83	pacakge	BL-1724077970	35	129	2024-08-19	15:00:00	17:00:00	4	0	hi	0	1500	75	5	1575	0	1	83	83	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-08-19 14:32:57	2024-08-19 14:32:57	0	0	0	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
117	83	pacakge	BL-1724078167	35	129	2024-08-19	15:00:00	17:00:00	4	0	hi	0	1500	75	5	1575	0	1	83	83	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-08-19 14:36:11	2024-08-19 14:36:11	0	0	0	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
111	51	pacakge	BL-1724073558	29	123	2024-08-21	06:00:00	09:00:00	2	6		0	2000	107.5	5	2257.5	150	1	60	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562559	2024-08-19 13:19:18	2024-10-01 07:53:57	0	0	10	1	60	0	0	0	2	0	0	0	\N	2257	\N	\N	0	0	0	0	0	0	0	\N	0
101	51	pacakge	BL-1724070660	29	123	2024-08-21	06:00:00	09:00:00	25	30		0	2000	107.5	5	2257.5	150	1	60	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562584	2024-08-19 12:31:00	2024-10-01 07:54:18	0	0	10	1	60	0	0	0	2	0	0	0	\N	2257	\N	\N	0	0	0	0	0	0	0	\N	0
100	51	pacakge	BL-1724070576	29	123	2024-08-21	06:00:00	09:00:00	25	30		0	2000	122.5	5	2572.5	150	1	60	51	Mr	Hamid	RAZA	razahamid34@gmail.com	92	3441562559	2024-08-19 12:29:36	2024-10-01 08:01:15	0	0	10	1	60	300	0	0	2	0	0	0	\N	2572	\N	\N	0	0	0	0	0	0	0	\N	0
99	51	pacakge	BL-1724070543	29	123	2024-08-21	06:00:00	09:00:00	25	30		0	2000	122.5	5	2572.5	150	1	60	51	Mr	Hamid	RAZA	razahamid34@gmail.com	92	3441562559	2024-08-19 12:29:03	2024-10-01 08:01:35	0	0	10	1	60	300	0	0	2	0	0	0	\N	2572	\N	\N	0	0	0	0	0	0	0	\N	0
118	83	pacakge	BL-1724081464	35	129	2024-08-19	15:00:00	17:00:00	4	0	hi	0	1500	75	5	1575	0	1	83	83	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-08-19 15:31:09	2024-08-19 15:31:09	0	0	0	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
119	78	pacakge	BL-1724095174	4	3	2024-08-19	10:00:00	11:00:00	5	6	Special Request’s	0	1500	125.5	5	2635.5	10	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-19 19:19:37	2024-08-19 19:19:37	0	0	0	0	8	1000	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
120	78	pacakge	BL-1724097351	4	3	2024-08-28	14:00:00	15:00:00	1	2		0	1500	79	5	1659	20	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-19 19:56:18	2024-08-19 19:56:18	0	0	0	0	8	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
121	78	pacakge	BL-1724098862	4	3	2024-08-20	16:00:00	17:00:00	1	2	hi	0	1500	75.5	5	1585.5	10	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-19 20:21:03	2024-08-19 20:21:03	0	0	0	0	8	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
122	78	pacakge	BL-1724098896	4	3	2024-08-20	16:00:00	17:00:00	1	2	hi	0	1500	128.5	5	2698.5	10	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-19 20:21:36	2024-08-19 20:21:36	0	0	0	0	8	1060	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
124	77	pacakge	BL-1724109163	35	129	2024-08-20	18:00:00	20:00:00	2	2		0	1500	77	5	1617	40	1	77	77	Mr	Anil	navis	an@an.com	+971	534005096	2024-08-19 23:13:17	2024-08-20 03:21:23	0	0	1	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
125	77	pacakge	BL-1724110099	35	129	2024-08-20	20:00:00	22:00:00	5	2		0	1500	77	5	1617	40	0	77	77	Mr	Anil	navis	an@an.com	+971	534005096	2024-08-19 23:28:50	2024-08-20 03:29:39	0	0	1	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
127	59	yatch	BL-1724126869	35	0	2024-08-20	10:00:00	12:00:00	2	0		0	400	20	5	420	0	1	76	59	Mr	Sooraj	Sabu	sooraj@yopmail.com	971	505086046	2024-08-20 04:07:49	2024-08-20 04:07:49	0	0	0	1	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
126	77	pacakge	BL-1724119591	35	129	2024-08-21	18:00:00	20:00:00	2	2	I need extra cheese	0	1500	78	5	1638	0	0	77	77	Mr	Anil	navis	an@an.com	+971	534005096	2024-08-20 02:07:05	2024-08-20 09:55:56	0	0	1	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
123	78	pacakge	BL-1724102072	4	3	2024-08-20	16:00:00	17:00:00	2	5	it is my special request	0	1500	78.5	5	1648.5	10	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-19 21:14:33	2024-08-20 09:56:45	0	0	1	0	8	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
128	0	pacakge	BL-1724138665	35	128	2024-08-20	17:00:00	20:00:00	4	4		0	1500	80	5	1680	40	1	76	0	Mr	test	ges	z.falak777@gmail.com	93	848484848484	2024-08-20 07:24:25	2024-08-20 07:24:25	0	0	0	1	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
132	0	yatch	BL-1724145048	35	0	2024-08-20	20:00:00	21:00:00	0	0	The only way I could do that was if you wanted me too I could come	0	400	20	5	420	0	1	76	0	Mr	anil	navisp	h@h.clm	971	5464684646	2024-08-20 09:10:48	2024-08-20 13:16:38	0	0	2	1	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
129	83	pacakge	BL-1724139555	35	125	2024-08-20	17:00:00	20:00:00	2	0		0	200	12.75	5	267.75	55	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	2024-08-20 07:39:37	2024-08-20 11:40:43	0	0	2	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
131	78	yatch	BL-1724141062	31	0	2024-08-05	02:00:00	22:00:00	4	0	hi	0	8550	427.5	5	8977.5	0	1	78	78	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-08-20 08:07:05	2024-08-20 08:07:05	0	0	0	0	68	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
135	83	pacakge	BL-1724149589	35	128	2024-08-21	15:00:00	18:00:00	3	0		0	1500	80	5	1680	40	1	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	2024-08-20 10:26:51	2024-08-20 14:32:03	0	0	2	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
133	83	pacakge	BL-1724146925	35	128	2024-08-21	15:00:00	18:00:00	2	0		0	1500	80	5	1680	40	1	83	83	Mr	Usama	Shakeel	ushakeel010@gmail.com	91	331886460	2024-08-20 09:42:29	2024-08-20 09:42:29	0	0	0	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
134	0	pacakge	BL-1724147285	35	129	2024-08-20	15:00:00	17:00:00	2	2	Need extra distllled water	0	1500	78.25	5	1643.25	55	1	76	0	Mr	anilnavos	bj	bb@b.com	971	84546648464	2024-08-20 09:48:05	2024-08-20 13:48:43	0	0	1	1	76	10	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
138	83	pacakge	BL-1724155490	35	128	2024-08-21	20:00:00	23:00:00	2	0		0	1500	80	5	1680	40	1	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	2024-08-20 12:05:11	2024-08-20 16:05:21	0	0	1	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
136	83	yatch	BL-1724149801	29	0	2024-08-21	08:00:00	09:00:00	2	0		0	5000	250	5	5250	0	1	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	2024-08-20 10:30:23	2024-08-20 14:32:46	0	0	2	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
139	83	yatch	BL-1724155810	29	0	2024-08-21	14:00:00	15:00:00	2	0		0	6000	300	5	6300	0	1	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	2024-08-20 12:10:28	2024-08-20 16:13:11	0	0	1	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
140	87	pacakge	BL-1724156874	35	128	2024-08-22	18:00:00	21:00:00	2	0		0	1500	80	5	1680	40	1	87	87	Mr	Usama	Shakeel	ushakeel34@gmail.com	971	33168643	2024-08-20 12:28:16	2024-08-20 16:47:45	0	0	1	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
141	85	pacakge	BL-1724161080	35	128	2024-08-23	18:00:00	21:00:00	2	0		0	1500	80	5	1680	40	1	85	85	Mr	Usama	Shakeel	usama12@gmail.com	971	33158646	2024-08-20 13:38:22	2024-08-20 13:38:22	0	0	0	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
130	51	pacakge	BL-1724140033	29	123	2024-08-21	14:00:00	17:00:00	2	5		0	2000	167.5	5	3517.5	450	1	60	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-08-20 07:47:13	2024-10-01 07:23:55	0	0	10	1	60	900	0	0	2	0	0	0	\N	3517	\N	\N	0	0	0	0	0	0	0	\N	0
142	90	pacakge	BL-1724161860	35	128	2024-08-23	20:00:00	23:00:00	2	0		0	1500	80	5	1680	40	1	90	90	Mr	Usama	Shakeel	usama99@gmail.com	971	33154609	2024-08-20 13:51:20	2024-08-20 13:51:20	0	0	0	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
144	0	yatch	BL-1724177611	35	0	2024-08-23	21:00:00	22:00:00	2	2		0	600	24	5	504	0	1	76	0	Mr	hq	b	z.falak777@gmail.com	93	8454545454	2024-08-20 18:13:31	2024-08-20 18:13:31	30	120	0	1	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
145	0	yatch	BL-1724179756	35	0	2024-08-23	20:00:00	21:00:00	2	2		0	250	12.5	5	262.5	0	1	76	0	Mr	ha	bw	z.falak777@gmail.com	93	8115151551	2024-08-20 18:49:16	2024-08-20 18:49:16	0	0	0	1	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
146	78	yatch	BL-1724183762	35	0	2024-08-26	13:00:00	15:00:00	1	2	en	0	400	16	5	336	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-20 19:56:22	2024-08-20 19:56:22	30	80	0	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
147	78	pacakge	BL-1724184372	4	3	2024-08-21	06:00:00	07:00:00	1	2	tesr	0	1500	78.5	5	1648.5	10	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-20 20:06:29	2024-08-20 20:06:29	0	0	0	0	8	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
148	78	pacakge	BL-1724193389	4	3	2024-08-21	11:00:00	12:00:00	1	2		0	1500	78.5	5	1648.5	10	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-20 22:36:30	2024-08-20 22:36:30	0	0	0	0	8	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
149	78	yatch	BL-1724195205	35	0	2024-08-25	09:00:00	10:00:00	1	2	en	0	100	5	5	105	0	0	78	78	Mr	\N	\N		+971	\N	2024-08-20 23:07:04	2024-08-20 23:07:04	0	0	0	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
150	78	yatch	BL-1724195422	35	0	2024-08-29	20:00:00	21:00:00	1	2	en	0	30	1.5	5	31.5	0	0	78	78	Mr	\N	\N		+971	\N	2024-08-20 23:10:40	2024-08-20 23:10:40	0	0	0	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
151	78	yatch	BL-1724195796	39	0	2024-08-21	10:00:00	11:00:00	1	2	en	0	100	5	5	105	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-20 23:16:56	2024-08-20 23:16:56	0	0	0	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
152	78	pacakge	BL-1724195952	4	3	2024-08-21	11:00:00	12:00:00	1	2		0	1500	128.5	5	2698.5	10	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-20 23:19:14	2024-08-20 23:19:14	0	0	0	0	8	1060	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
153	78	pacakge	BL-1724196162	4	3	2024-08-21	06:00:00	07:00:00	2	5		0	1500	128.5	5	2698.5	10	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-20 23:22:44	2024-08-20 23:22:44	0	0	0	0	8	1060	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
154	78	pacakge	BL-1724196369	4	3	2024-08-21	11:00:00	12:00:00	1	2		0	1500	128.5	5	2698.5	10	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-20 23:26:10	2024-08-20 23:26:10	0	0	0	0	8	1060	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
155	78	pacakge	BL-1724196646	4	3	2024-08-21	04:00:00	05:00:00	1	2	test	0	1500	128.5	5	2698.5	10	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-20 23:31:03	2024-08-20 23:31:03	0	0	0	0	8	1060	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
156	78	yatch	BL-1724196728	39	0	2024-08-21	10:00:00	11:00:00	1	2	en	0	100	5	5	105	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-20 23:32:27	2024-08-20 23:32:27	0	0	0	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
161	92	pacakge	BL-1724227323	35	129	2024-08-23	21:00:00	23:00:00	1	1		0	1500	77.75	5	1632.75	55	0	92	92	Mr	Ajesh	kumar	ajeshcd@gmail.com	971	505041860	2024-08-21 08:02:54	2024-08-21 08:02:54	0	0	0	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
157	77	yatch	BL-1724207590	39	0	2024-08-21	10:00:00	11:00:00	2	2	en	0	100	5	5	105	0	0	77	77	Mr	Anil	navis	an@an.com	+971	534005096	2024-08-21 02:33:29	2024-08-21 07:15:29	0	0	2	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
162	92	pacakge	BL-1724229192	35	128	2024-08-22	13:00:00	16:00:00	2	2	Diggi	0	1500	77	5	1617	40	0	92	92	Mr	Ajesh	kumar	ajeshcd@gmail.com	971	505041860	2024-08-21 08:33:32	2024-08-21 08:33:32	0	0	0	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
143	90	pacakge	BL-1724167004	35	128	2024-08-23	18:00:00	21:00:00	2	0		0	1500	80	5	1680	40	1	90	90	Mr	Usama	Shakeel	usama99@gmail.com	971	33154609	2024-08-20 15:17:09	2024-08-21 09:58:17	0	0	2	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
158	0	pacakge	BL-1724220390	35	129	2024-08-23	21:00:00	23:00:00	2	1	Need welcome drink	0	1500	79.75	5	1674.75	95	1	76	0	Mr	anil	navis	gh@h.vom	971	845646484964	2024-08-21 06:06:30	2024-08-21 06:06:30	0	0	0	1	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
159	0	pacakge	BL-1724222035	35	129	2024-08-23	21:00:00	23:00:00	2	2		0	1500	78.25	5	1643.25	15	1	76	0	Mr	test	ba	z.falak777@gmail.com	93	845454545455	2024-08-21 06:33:55	2024-08-21 06:33:55	0	0	0	1	76	50	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
160	81	pacakge	BL-1724226506	35	129	2024-08-23	21:00:00	23:00:00	2	2		0	1500	78.25	5	1643.25	55	0	81	81	Ms	\N	\N	na@na.com	971	5568680900	2024-08-21 07:48:57	2024-08-21 07:48:57	0	0	0	0	76	10	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
163	92	pacakge	BL-1724229481	35	128	2024-08-22	14:00:00	17:00:00	1	1	Ghhhjij	0	1500	80	5	1680	40	0	92	92	Mr	Ajesh	kumar	ajeshcd@gmail.com	971	505041860	2024-08-21 08:38:20	2024-08-21 08:38:20	0	0	0	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
164	92	pacakge	BL-1724229711	35	128	2024-08-22	13:00:00	16:00:00	1	1	Gggv	0	1500	77	5	1617	40	0	92	92	Mr	Ajesh	kumar	ajeshcd@gmail.com	971	505041860	2024-08-21 08:42:12	2024-08-21 12:47:31	0	0	1	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
165	78	yatch	BL-1724229870	39	0	2024-08-21	13:00:00	14:00:00	1	2	en	0	150	7.5	5	157.5	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-21 08:44:58	2024-08-23 09:44:31	0	0	10	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
166	92	pacakge	BL-1724230689	35	128	2024-08-22	17:00:00	20:00:00	2	2		0	1500	80	5	1680	40	0	92	92	Mr	Ajesh	kumar	ajeshcd@gmail.com	971	505041860	2024-08-21 08:58:50	2024-08-21 12:59:50	0	0	1	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
167	92	pacakge	BL-1724231165	42	130	2024-08-22	16:00:00	18:00:00	2	2	Cache	0	1500	75.5	5	1585.5	10	1	92	92	Mr	Ajesh	kumar	ajeshcd@gmail.com	971	505041860	2024-08-21 09:06:21	2024-08-21 13:07:53	0	0	2	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
168	92	pacakge	BL-1724231607	42	130	2024-08-25	09:00:00	11:00:00	2	2		0	1500	75.5	5	1585.5	10	1	92	92	Mr	Anil	navis	g@g.com	+971	8454664846	2024-08-21 09:13:49	2024-08-21 13:14:24	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
170	92	pacakge	BL-1724232118	42	130	2024-08-26	14:00:00	16:00:00	2	2	Hwhe	0	1500	75.5	5	1585.5	10	0	92	92	Mr	vsbbs	Ben	h@hhsj.com	+971	54543343586	2024-08-21 09:22:16	2024-08-21 09:22:16	0	0	0	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
186	109	pacakge	BL-1725261475	42	130	2024-09-02	12:00:00	14:00:00	2	2		0	1500	75.5	5	1585.5	10	0	109	109	Mr	anil	na	v1@v1.com	971	546434864	2024-09-02 07:18:14	2024-09-02 07:18:14	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
181	99	pacakge	BL-1724395092	35	129	2024-08-24	18:00:00	20:00:00	2	2	Benne	0	1500	77.5	5	1627.5	40	0	99	99	Mr	anil iphirn	ghhh	navisanil@gmail.com	971	546648466	2024-08-23 06:38:32	2024-08-23 06:38:32	0	0	1	0	76	10	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
171	93	pacakge	BL-1724232972	42	130	2024-08-26	09:00:00	11:00:00	2	2	This	0	1500	75.5	5	1585.5	10	0	93	93	Mr	rianjjv	gaggs	bb@hdj.com	+971	8766464046	2024-08-21 09:36:31	2024-08-21 13:38:52	0	0	2	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
172	93	yatch	BL-1724237916	36	0	2024-08-23	17:00:00	18:00:00	2	2	en	0	300	15	5	315	0	0	93	93	Mr	anilnavis	navis	anilnavis71@gmail.com	971	8464664046	2024-08-21 10:58:54	2024-08-21 14:59:42	0	0	1	0	68	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
173	92	pacakge	BL-1724242409	35	129	2024-08-22	11:00:00	13:00:00	2	2		0	1500	77.75	5	1632.75	55	0	92	92	Mr	Ajesh	kumar	ajeshcd@gmail.com	971	505041860	2024-08-21 12:13:52	2024-08-21 12:13:52	0	0	0	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
114	83	pacakge	BL-1724077798	35	128	2024-08-21	20:00:00	23:00:00	1	0		0	1500	77	5	1617	40	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	2024-08-19 14:30:20	2024-08-21 16:22:24	0	0	1	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
174	83	pacakge	BL-1724243552	35	125	2024-08-23	21:00:00	00:00:00	2	0		0	200	12.75	5	267.75	55	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	2024-08-21 12:32:56	2024-08-21 16:33:11	0	0	1	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
175	99	pacakge	BL-1724247081	42	130	2024-08-23	13:00:00	15:00:00	11	2	Thjkjhjjjjjgjjbj	0	1500	75.5	5	1585.5	10	0	99	99	Mr	anil iphirn	ghhh	navisanil@gmail.com	971	546648466	2024-08-21 13:32:05	2024-08-21 13:32:05	0	0	0	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
176	59	yatch	BL-1724323975	31	0	2024-08-22	21:00:00	22:00:00	2	0		0	500	25	5	525	0	1	68	59	Mr	Soorja	Sabu	sooraj@yopmail.com	971	505086045	2024-08-22 10:52:55	2024-08-22 10:52:55	0	0	1	1	68	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
177	59	pacakge	BL-1724324113	31	127	2024-08-29	21:00:00	23:00:00	1	0		0	150	7.5	5	157.5	0	1	68	59	Mr	Sooraj	Sabu	sooraj@yopmail.com	971	505086045	2024-08-22 10:55:13	2024-08-22 10:55:13	0	0	1	1	68	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
182	78	pacakge	BL-1724451417	35	129	2024-08-24	15:00:00	17:00:00	2	5	special	0	1500	80.75	5	1695.75	55	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-08-23 22:17:20	2024-08-23 22:17:20	0	0	1	0	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
169	92	pacakge	BL-1724231829	42	130	2024-08-25	11:00:00	13:00:00	2	1	Ggghh	0	1500	75.5	5	1585.5	10	0	92	92	Mr	Subin	hi	sub@sub.com	+971	84646466464	2024-08-21 09:17:28	2024-08-25 11:00:48	0	0	2	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
179	51	yatch	BL-1724358707	29	0	2024-08-24	12:00:00	13:00:00	2	3		0	0	0	5	0	0	0	60	51	Mr	AHMAD	Ali	razahamid34@gmail.com	92	3441562554	2024-08-22 20:31:47	2024-09-30 16:49:09	0	0	10	1	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
184	99	pacakge	BL-1724677542	35	129	2024-08-26	18:00:00	20:00:00	2	2	Heaven	0	1500	78.25	5	1643.25	55	0	99	99	Mr	anil iphirn	ghhh	navisanil@gmail.com	971	546648466	2024-08-26 13:06:02	2024-08-26 13:06:02	0	0	1	0	76	10	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
185	99	pacakge	BL-1724678733	35	129	2024-08-26	20:00:00	22:00:00	1	0	The	0	1500	75	5	1575	0	0	99	99	Mr	anil iphirn	ghhh	navisanil@gmail.com	971	546648466	2024-08-26 13:25:51	2024-08-26 13:25:51	0	0	1	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
187	78	pacakge	BL-1725360328	35	129	2024-09-03	16:00:00	18:00:00	1	2		0	1500	86.5	5	1816.5	110	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-09-03 10:45:45	2024-09-03 10:45:45	0	0	1	0	76	120	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
188	78	pacakge	BL-1725362390	35	129	2024-09-03	20:00:00	22:00:00	1	2		0	1500	89.75	5	1884.75	55	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-09-03 11:20:08	2024-09-03 11:20:08	0	0	1	0	76	240	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
183	99	pacakge	BL-1724661146	35	129	2024-08-26	13:00:00	15:00:00	2	2	Bbssn	0	1500	75.5	5	1585.5	0	0	99	99	Mr	anil iphirn	ghhh	navisanil@gmail.com	971	546648466	2024-08-26 08:32:48	2024-09-13 04:18:21	0	0	2	0	76	10	0	0	2	0	1	4	Gshhsjejjdkd	0	\N	\N	0	0	0	0	0	0	0	\N	0
178	51	yatch	BL-1724358643	29	0	2024-08-24	09:00:00	11:00:00	2	3		0	5000	250	5	5250	0	0	60	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-08-22 20:30:43	2024-09-30 16:50:17	0	0	10	1	60	0	0	0	2	0	0	0	\N	5250	\N	\N	0	0	0	0	0	0	0	\N	0
189	78	pacakge	BL-1725363437	35	129	2024-09-03	18:00:00	20:00:00	1	2	hi	0	1500	87	5	1827	0	1	78	78	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-09-03 11:38:55	2024-09-03 11:38:55	0	0	1	0	76	240	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
190	78	yatch	BL-1725364020	39	0	2024-09-04	10:00:00	12:00:00	1	2		0	200	10	5	210	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-09-03 11:47:19	2024-09-03 11:47:19	0	0	1	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
191	78	pacakge	BL-1725364465	35	129	2024-09-04	16:00:00	18:00:00	1	2		0	1500	91.25	5	1916.25	95	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-09-03 11:54:45	2024-09-03 11:54:45	0	0	1	0	76	230	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
192	122	pacakge	BL-1725364701	35	129	2024-09-06	07:00:00	09:00:00	1	2		0	1500	76	5	1596	0	0	122	122	Mr	test	nas	testnew@gmail.com	971	545156446	2024-09-03 11:58:39	2024-09-03 11:58:39	0	0	1	0	76	20	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
193	99	pacakge	BL-1725367209	35	129	2024-09-04	12:00:00	14:00:00	2	2		0	1500	87.25	5	1832.25	55	0	99	99	Mr	anil iphirn	ghhh	navisanil@gmail.com	971	546648466	2024-09-03 12:40:27	2024-09-03 12:40:27	0	0	1	0	76	190	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
194	85	pacakge	BL-1725564711	42	130	2024-09-07	12:00:00	16:00:00	1	0		0	1850	93	5	1953	10	1	85	85	Mr	Usama	Shakeel	usama12@gmail.com	971	33158646	2024-09-05 19:32:24	2024-09-05 19:32:24	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
195	83	pacakge	BL-1725609055	42	130	2024-09-08	10:00:00	14:00:00	1	0		0	1720	86.5	5	1816.5	10	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	2024-09-06 07:51:17	2024-09-06 07:51:17	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
196	83	yatch	BL-1725622478	28	0	2024-09-08	14:00:00	18:00:00	1	0		0	500	25	5	525	0	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	2024-09-06 11:35:01	2024-09-06 11:35:01	0	0	1	0	59	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
197	83	yatch	BL-1725628828	36	0	2024-09-08	09:00:00	19:00:00	1	0		0	608.5	30.425	5	638.925	0	1	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	2024-09-06 13:20:49	2024-09-06 13:20:49	0	0	1	0	68	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
198	51	pacakge	BL-1725724698	42	130	2024-09-09	16:00:00	21:00:00	1	0		0	2100	109.5	5	2299.5	90	1	51	51	Mr	\N	\N	razahamid34@gmail.com	92	3441562554	2024-09-07 15:58:54	2024-09-07 15:59:38	0	0	10	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
200	0	yatch	BL-1725798941	35	0	2024-09-10	11:00:00	14:00:00	0	0	Ghehr	0	340	17	5	357	0	1	76	0	Mr	Yy	Gh	ggg@gh.com	971	646466593	2024-09-08 12:35:41	2024-09-08 12:35:41	0	0	1	1	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
201	78	pacakge	BL-1725881994	35	129	2024-09-09	13:00:00	19:00:00	1	0		0	2500	130.5	5	2740.5	40	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-09-09 11:40:17	2024-09-09 11:40:17	0	0	1	0	76	70	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
203	78	pacakge	BL-1725915539	35	129	2024-09-10	09:00:00	20:00:00	1	2		0	2710	141.5	5	2971.5	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-09-09 20:59:20	2024-09-09 20:59:20	0	0	1	0	76	120	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
204	97	yatch	BL-1725916016	35	0	2024-09-11	12:00:00	16:00:00	0	0		0	460	23	5	483	0	1	76	97	Mr	zain	falak	z.falak777@gmail.com	358	545454554	2024-09-09 21:06:56	2024-09-09 21:06:56	0	0	1	1	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
205	97	pacakge	BL-1725952983	35	129	2024-09-11	16:00:00	22:00:00	0	0		0	1940	105.25	5	2210.25	55	1	76	97	Mr	abc	abc	z.falak777@gmail.com	93	54545454545	2024-09-10 07:23:03	2024-09-10 07:23:03	0	0	1	1	76	110	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
207	125	yatch	BL-1725966895	47	0	2024-09-12	15:00:00	17:00:00	1	0		0	1200	60	5	1260	0	0	125	125	Mr	First	LAT	razahamid102@gmail.com	92	3441562582	2024-09-10 11:15:35	2024-09-10 11:17:10	0	0	2	0	60	0	0	0	2	0	1	3	Second review	0	\N	\N	0	0	0	0	0	0	0	\N	0
199	51	pacakge	BL-1725735034	47	138	2024-09-09	07:00:00	18:00:00	0	0		0	4530	226.5	5	4756.5	0	1	60	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-09-07 18:50:34	2024-09-10 12:15:03	0	0	2	1	60	0	0	0	2	0	1	4	Hamid test	0	\N	\N	0	0	0	0	0	0	0	\N	0
180	51	pacakge	BL-1724359674	29	123	2024-08-24	11:00:00	14:00:00	2	3		0	2000	107.5	5	2257.5	150	0	60	51	Mr	Java	Iqbal	razahamid34@gmail.com	92	3441562554	2024-08-22 20:47:54	2024-09-10 08:30:09	0	0	2	1	60	0	0	0	2	0	1	4	Greate	0	\N	\N	0	0	0	0	0	0	0	\N	0
206	51	yatch	BL-1725957360	47	0	2024-09-12	12:00:00	13:00:00	1	0		0	600	30	5	630	0	1	51	51	Mr	\N	\N	razahamid34@gmail.com	92	3441562554	2024-09-10 08:36:49	2024-09-10 08:41:01	0	0	2	0	60	0	0	0	2	0	1	4	HAMID REVIEW yacht	0	\N	\N	0	0	0	0	0	0	0	\N	0
208	125	pacakge	BL-1725968366	35	129	2024-09-12	14:00:00	22:00:00	1	0		0	1680	101.75	5	2136.75	235	0	125	125	Mr	First	LAT	razahamid102@gmail.com	92	3441562582	2024-09-10 11:39:55	2024-09-10 11:40:57	0	0	2	0	76	120	0	0	2	0	1	4	Great	0	\N	\N	0	0	0	0	0	0	0	\N	0
210	126	pacakge	BL-1725987147	35	129	2024-09-12	13:00:00	22:00:00	1	0		0	1700	93.25	5	1958.25	55	0	126	126	Mr	test	test	testnew1@gmail.com	971	845188844	2024-09-10 16:53:04	2024-09-10 16:53:04	0	0	1	0	76	110	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
209	78	pacakge	BL-1725985598	35	129	2024-10-11	11:00:00	14:00:00	1	0		0	1520	82.25	5	1727.25	55	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-09-10 16:26:58	2024-09-10 16:26:58	0	0	1	0	76	70	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
211	126	pacakge	BL-1725988720	35	129	2024-09-12	22:00:00	22:00:00	1	0		0	1880	102.75	5	2157.75	55	0	126	126	Mr	test	test	testnew1@gmail.com	971	845188844	2024-09-10 17:19:06	2024-09-10 17:19:06	0	0	1	0	76	120	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
212	126	pacakge	BL-1725989437	35	129	2024-09-12	22:00:00	22:00:00	1	0		0	1880	102.75	5	2157.75	55	0	126	126	Mr	test	test	testnew1@gmail.com	971	845188844	2024-09-10 17:31:16	2024-09-10 17:31:16	0	0	1	0	76	120	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
213	126	yatch	BL-1725998555	47	0	2024-09-12	22:00:00	23:00:00	1	0	en	0	800	40	5	840	0	0	126	126	Mr	test	test	testnew1@gmail.com	971	845188844	2024-09-10 20:03:02	2024-09-10 20:03:02	0	0	1	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
214	78	yatch	BL-1725998555	47	0	2024-09-12	22:00:00	23:00:00	1	0		0	800	40	5	840	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-09-10 20:03:37	2024-09-10 20:03:37	0	0	1	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
215	78	pacakge	BL-1726002564	35	129	2024-09-13	11:00:00	15:00:00	1	0		0	1540	85.75	5	1800.75	55	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-09-10 21:09:44	2024-09-10 21:09:44	0	0	1	0	76	120	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
216	78	yatch	BL-1726002860	47	0	2024-09-13	15:00:00	17:00:00	1	0	en	0	1600	80	5	1680	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-09-10 21:14:52	2024-09-10 21:14:52	0	0	1	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
217	99	pacakge	BL-1726217937	42	130	2024-09-17	10:00:00	14:00:00	1	0	Chunk	0	1500	75.5	5	1585.5	10	0	99	99	Mr	anil iphirn	ghhh	navisanil@gmail.com	971	546648466	2024-09-13 08:59:17	2024-09-13 08:59:17	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
218	136	pacakge	BL-1726218671	35	129	2024-09-15	10:00:00	16:00:00	1	0		0	1980	99	5	2079	0	0	136	136	Mr	kannan	annamalai	rtgjdcdmh4@privaterelay.appleid.com	91	8807990032	2024-09-13 09:11:26	2024-09-13 09:11:26	0	0	1	0	76	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
222	125	yatch	BL-1726321760	47	0	2024-09-16	16:00:00	17:00:00	1	0		0	900	45	5	945	0	1	125	125	Mr	First	LAT	razahamid102@gmail.com	92	3441562582	2024-09-14 13:50:06	2024-09-14 13:50:06	0	0	1	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
223	51	yatch	BL-1726321760	47	0	2024-09-16	16:00:00	17:00:00	0	0	Hi	0	900	45	5	945	0	1	51	51	Mr	\N	\N	razahamid34@gmail.com	92	3441562554	2024-09-14 13:50:10	2024-09-14 13:50:58	0	0	10	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
224	134	pacakge	BL-1726482031	64	149	2024-09-18	04:00:00	08:00:00	1	0		0	5500	275	5	5775	0	0	134	134	Mr	Rejisha	Dxb	rejishatest@gmail.com	971	223322332	2024-09-16 10:20:48	2024-09-16 18:29:08	0	0	2	0	131	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
225	135	pacakge	BL-1726497096	64	149	2024-09-18	08:00:00	11:00:00	0	0		0	5000	250	5	5250	0	0	135	135	Mr	Akhil	Padippurackal	devikadxbapps@hotmail.com	971	502693489	2024-09-16 14:32:03	2024-09-16 14:32:46	0	0	2	0	131	0	0	0	2	0	1	5	Nice experience	0	\N	\N	0	0	0	0	0	0	0	\N	0
226	134	yatch	BL-1726751553	64	0	2024-09-21	19:00:00	20:00:00	1	0	en	0	500	25	5	525	0	0	134	134	Mr	Rejisha	Dxb	rejishatest@gmail.com	971	223322332	2024-09-19 13:12:52	2024-09-19 13:12:52	0	0	1	0	131	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
227	135	yatch	BL-1726752289	62	0	2024-09-29	03:00:00	06:00:00	0	0		0	1500	75	5	1575	0	0	135	135	Mr	Akhil	Padippurackal	devikadxbapps@hotmail.com	971	502693489	2024-09-19 13:25:14	2024-09-19 13:25:14	0	0	1	0	133	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
228	135	pacakge	BL-1726752408	62	148	2024-09-21	01:00:00	04:00:00	0	0		0	9000	450	5	9450	0	0	135	135	Mr	Akhil	Padippurackal	devikadxbapps@hotmail.com	971	502693489	2024-09-19 13:27:10	2024-09-19 13:27:10	0	0	1	0	133	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
229	134	pacakge	BL-1726752675	64	149	2024-09-21	04:00:00	08:00:00	1	0		0	5500	275	5	5775	0	0	134	134	Mr	Rejisha	Dxb	rejishatest@gmail.com	971	223322332	2024-09-19 13:32:10	2024-09-19 13:32:10	0	0	1	0	131	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
230	134	yatch	BL-1726753036	64	0	2024-09-21	08:00:00	09:00:00	1	0	en	0	500	25	5	525	0	0	134	134	Mr	Rejisha	Dxb	rejishatest@gmail.com	971	223322332	2024-09-19 13:37:38	2024-09-19 13:37:38	0	0	1	0	131	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
232	134	pacakge	BL-1726824296	42	130	2024-09-22	09:00:00	12:00:00	1	0		0	1600	80	5	1680	0	0	134	134	Mr	Rejisha	Dxb	rejishatest@gmail.com	971	223322332	2024-09-20 09:25:15	2024-09-20 09:25:15	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
233	129	yatch	BL-1726828507	64	0	2024-09-22	18:00:00	19:00:00	0	0		0	100	5	5	105	0	1	131	129	Mrs	Dev	S R	devikasr1995@gmail.com	971	502693489	2024-09-20 10:35:07	2024-09-20 10:35:07	0	0	1	1	131	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
235	134	pacakge	BL-1727072374	31	115	2024-09-25	08:00:00	11:00:00	1	0		0	200	10	5	210	0	0	134	134	Mr	Rejisha	Dxb	rejishatest@gmail.com	971	223322332	2024-09-23 06:19:52	2024-09-23 06:19:52	0	0	1	0	68	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
220	51	pacakge	BL-1726231769	47	138	2024-09-15	16:00:00	19:00:00	0	0		0	730	36.5	5	766.5	0	1	60	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-09-13 12:49:29	2024-09-30 16:43:39	0	0	10	1	60	0	0	0	2	0	0	0	\N	766	\N	\N	0	0	0	0	0	0	0	\N	0
219	51	yatch	BL-1726222912	47	0	2024-09-15	19:00:00	20:00:00	0	0		0	700	35	5	735	0	1	60	51	Mr	HAMID	Raza	razahamid34@gmail.com	92	3441562554	2024-09-13 10:21:52	2024-09-30 16:47:21	0	0	10	1	60	0	0	0	2	0	0	0	\N	735	\N	\N	0	0	0	0	0	0	0	\N	0
231	135	pacakge	BL-1726753305	64	149	2024-09-21	09:00:00	12:00:00	0	0		0	5000	250	5	5250	0	0	135	135	Mr	Akhil	Padippurackal	devikadxbapps@hotmail.com	971	502693489	2024-09-19 13:42:08	2024-10-01 07:02:22	0	0	10	0	131	0	0	0	2	0	0	0	\N	5250	\N	\N	0	0	0	0	0	0	0	\N	0
234	129	yatch	BL-1726828566	62	0	2024-10-09	10:00:00	11:00:00	0	0		0	400	20	5	420	0	1	133	129	Mrs	DEV	Sr	devikasr1995@gmail.com	971	502693489	2024-09-20 10:36:06	2024-10-08 15:34:38	0	0	1	1	133	0	0	0	2	0	0	0	\N	0	This is testing	\N	0	0	0	0	0	0	0	\N	0
221	51	pacakge	BL-1726320143	47	138	2024-09-16	07:00:00	09:00:00	0	0		0	30	27.75	5	582.75	450	0	51	51	Mr	\N	\N	razahamid34@gmail.com	92	3441562554	2024-09-14 13:23:05	2024-09-30 12:21:04	0	0	10	0	60	75	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
243	51	pacakge	BL-1727698453	35	129	2024-10-02	12:00:00	14:00:00	0	0		0	1500	87.5	5	1837.5	110	0	51	51	Mr	\N	\N	razahamid34@gmail.com	92	3441562554	2024-09-30 12:15:32	2024-09-30 12:42:15	0	0	10	0	76	140	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
244	148	pacakge	BL-1725881994	35	129	2024-09-09	13:00:00	19:00:00	1	0		0	2500	130.5	5	2740.5	40	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-09-30 13:09:55	2024-09-30 13:09:55	0	0	1	0	76	70	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
245	148	pacakge	BL-1725881994	35	129	2024-09-09	13:00:00	19:00:00	1	0		0	2500	130.5	5	2740.5	40	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-09-30 13:10:43	2024-09-30 13:10:43	0	0	1	0	76	70	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
246	148	pacakge	BL-1725881994	35	129	2024-09-09	13:00:00	19:00:00	1	0		0	2500	130.5	5	2740.5	40	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-09-30 13:12:53	2024-09-30 13:12:53	0	0	1	0	76	70	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
247	148	pacakge	BL-1725881994	35	129	2024-09-09	13:00:00	19:00:00	1	0		0	2500	130.5	5	2740.5	40	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	2024-09-30 13:14:06	2024-09-30 13:14:06	0	0	1	0	76	70	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
248	51	pacakge	BL-1727715472	47	138	2024-10-02	05:00:00	08:00:00	0	0		0	530	34	5	714	150	1	51	51	Mr	\N	\N	razahamid34@gmail.com	92	3441562554	2024-09-30 16:58:22	2024-09-30 16:58:43	0	0	10	0	60	0	0	0	2	0	0	0	\N	357	\N	\N	0	0	0	0	0	0	0	\N	0
249	52	pacakge	BL-1727718275	35	129	2024-10-02	12:00:00	14:00:00	0	0		0	1500	81.25	5	1706.25	55	1	52	52	Mr	\N	\N	razahamd34@gmail.com	92	3441562555	2024-09-30 17:45:07	2024-09-30 17:47:45	0	0	10	0	76	70	0	0	2	0	0	0	\N	853	\N	\N	0	0	0	0	0	0	0	\N	0
250	52	pacakge	BL-1727761685	42	130	2024-10-03	09:00:00	11:00:00	0	0		0	1500	75.5	5	1585.5	10	1	52	52	Mr	\N	\N	razahamd34@gmail.com	92	3441562555	2024-10-01 05:48:50	2024-10-01 05:49:39	0	0	10	0	91	0	0	0	2	0	0	0	\N	792	\N	\N	0	0	0	0	0	0	0	\N	0
239	143	yatch	BL-1727098866	66	0	2024-09-28	02:00:00	03:00:00	0	0		0	500	25	5	525	0	0	143	143	Ms	DEVIKA	DXBAPPS	devikadxb8@gmail.com	971	508855858	2024-09-23 13:41:47	2024-10-01 06:44:16	0	0	10	0	133	0	0	0	2	0	0	0	\N	525	\N	\N	0	0	0	0	0	0	0	\N	0
240	135	yatch	BL-1727099408	65	0	2024-09-25	03:00:00	04:00:00	1	0	en	0	500	25	5	525	0	0	135	135	Mr	Akhil	Padippurackal	devikadxbapps@hotmail.com	971	502693489	2024-09-23 13:52:39	2024-10-01 06:52:29	0	0	10	0	129	0	0	0	2	0	0	0	\N	525	\N	\N	0	0	0	0	0	0	0	\N	0
242	135	yatch	BL-1727179607	64	0	2024-09-29	00:00:00	02:00:00	1	0	en	0	1000	50	5	1050	0	0	135	135	Mr	Akhil	Padippurackal	devikadxbapps@hotmail.com	971	502693489	2024-09-24 12:07:08	2024-10-01 06:49:39	0	0	10	0	131	0	0	0	2	0	0	0	\N	1050	\N	\N	0	0	0	0	0	0	0	\N	0
252	51	pacakge	BL-1727765380	42	130	2024-10-03	09:00:00	11:00:00	0	0		0	1500	76.5	5	1606.5	30	1	51	51	Mr	\N	\N	razahamid34@gmail.com	92	3441562554	2024-10-01 06:49:44	2024-10-01 06:50:24	0	0	10	0	91	0	0	0	2	0	0	0	\N	803	\N	\N	0	0	0	0	0	0	0	\N	0
251	51	pacakge	BL-1727764942	47	138	2024-10-03	12:00:00	14:00:00	0	0		0	30	10.25	5	215.25	150	1	51	51	Mr	\N	\N	razahamid34@gmail.com	92	3441562554	2024-10-01 06:42:24	2024-10-01 06:51:08	0	0	10	0	60	25	0	0	2	0	0	0	\N	215	\N	\N	0	0	0	0	0	0	0	\N	0
241	143	yatch	BL-1727099408	65	0	2024-09-25	05:00:00	06:00:00	0	0		0	500	25	5	525	0	0	143	143	Ms	DEVIKA	DXBAPPS	devikadxb8@gmail.com	971	508855858	2024-09-23 13:52:54	2024-10-01 06:52:11	0	0	10	0	129	0	0	0	2	0	0	0	\N	525	\N	\N	0	0	0	0	0	0	0	\N	0
237	143	yatch	BL-1727098073	65	0	2024-09-25	02:00:00	03:00:00	1	0	en	0	500	25	5	525	0	0	143	143	Mr	DEVIKA	DXBAPPS	devikadxb8@gmail.com	971	508855858	2024-09-23 13:30:04	2024-10-01 06:55:25	0	0	10	0	129	0	0	0	2	0	0	0	\N	525	\N	\N	0	0	0	0	0	0	0	\N	0
238	135	yatch	BL-1727098864	66	0	2024-09-28	02:00:00	03:00:00	1	0	en	0	500	25	5	525	0	0	135	135	Mr	Akhil	Padippurackal	devikadxbapps@hotmail.com	971	502693489	2024-09-23 13:41:44	2024-10-01 07:01:57	0	0	10	0	133	0	0	0	2	0	0	0	\N	525	\N	\N	0	0	0	0	0	0	0	\N	0
236	143	yatch	BL-1727098157	66	0	2024-09-28	00:00:00	01:00:00	0	0		0	500	25	5	525	0	0	143	143	Ms	DEVIKA	DXBAPPS	devikadxb8@gmail.com	971	508855858	2024-09-23 13:29:58	2024-10-01 07:01:18	0	0	10	0	133	0	0	0	2	0	0	0	\N	525	\N	\N	0	0	0	0	0	0	0	\N	0
137	51	pacakge	BL-1724152845	29	123	2024-08-22	12:00:00	15:00:00	2	5	Haid	0	2000	107.5	5	2257.5	150	0	60	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-08-20 11:20:45	2024-10-01 07:20:21	0	0	10	1	60	0	0	0	2	0	0	0	\N	2257	\N	\N	0	0	0	0	0	0	0	\N	0
253	156	pacakge	BL-1727783286	64	149	2024-10-03	05:00:00	12:00:00	0	0		0	7000	385	5	8085	600	1	156	156	Mr	Anil	Navis	anilnavis@gmail.com	971	523243163	2024-10-01 11:48:34	2024-10-01 11:48:34	0	0	1	0	131	100	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
254	51	pacakge	BL-1727791503	47	158	2024-10-07	07:00:00	09:00:00	0	0		0	3	0.15	5	3.15	0	1	60	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-10-01 14:05:03	2024-10-01 14:05:03	0	0	1	1	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
255	51	pacakge	BL-1727791615	47	158	2024-10-07	07:00:00	09:00:00	0	0	Hi	0	3	0.15	5	3.15	0	1	60	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-10-01 14:06:55	2024-10-01 14:06:55	0	0	1	1	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
256	51	pacakge	BL-1727791623	47	158	2024-10-07	07:00:00	09:00:00	0	0	Hi	0	3	0.15	5	3.15	0	0	60	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-10-01 14:07:03	2024-10-01 14:07:03	0	0	1	1	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
257	94	pacakge	BL-1727849426	23	8	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	148	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-02 06:10:26	2024-10-02 06:10:26	10	0	1	1	148	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
258	94	pacakge	BL-1727850727	23	8	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	148	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-02 06:32:07	2024-10-02 06:32:07	10	0	1	1	148	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
259	94	pacakge	BL-1727850916	23	8	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	148	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-02 06:35:16	2024-10-02 06:35:16	10	0	1	1	148	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
260	94	pacakge	BL-1727851070	23	8	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	148	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-02 06:37:50	2024-10-02 06:37:50	10	0	1	1	148	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
261	155	pacakge	BL-1727877225	42	130	2024-10-04	09:00:00	11:00:00	0	0		0	1500	76	5	1596	20	1	155	155	Ms	Hamid	Raza	razahamid105@gmail.com	92	3441562113	2024-10-02 13:55:13	2024-10-02 13:55:13	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
262	155	pacakge	BL-1727974987	64	149	2024-10-05	00:00:00	03:00:00	0	0		0	5000	440	5	9240	3200	1	155	155	Ms	Hamid	Raza	razahamid105@gmail.com	92	3441562113	2024-10-03 17:03:18	2024-10-03 17:03:18	0	0	1	0	131	600	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
263	155	pacakge	BL-1727975294	62	148	2024-10-05	03:00:00	07:00:00	0	0		0	10000	500	5	10500	0	0	155	155	Ms	Hamid	Raza	razahamid105@gmail.com	92	3441562113	2024-10-03 17:08:16	2024-10-03 17:08:16	0	0	1	0	133	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
264	94	pacakge	BL-1728031011	23	8	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	167	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-04 08:36:51	2024-10-04 08:36:51	10	0	1	1	167	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
265	94	pacakge	BL-1728031149	23	8	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	167	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-04 08:39:09	2024-10-04 08:39:09	10	0	1	1	167	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
266	94	pacakge	BL-1728031231	23	8	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	167	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-04 08:40:31	2024-10-04 08:40:31	10	0	1	1	167	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
267	94	pacakge	BL-1728031335	23	8	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	167	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-04 08:42:15	2024-10-04 08:42:15	10	0	1	1	167	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
268	94	pacakge	BL-1728031370	47	8	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	167	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-04 08:42:50	2024-10-04 08:42:50	10	0	1	1	167	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
269	94	pacakge	BL-1728046935	47	8	2024-08-05	08:00:00	23:00:00	4	0	hi	0	8885	422.0375	5	8862.7875	0	1	60	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-04 13:02:15	2024-10-04 13:02:15	10	0	1	1	60	0	2	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
270	94	yatch	BL-1728046948	47	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	8885	444.25	5	9329.25	0	1	60	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-04 13:02:28	2024-10-04 13:02:28	10	0	1	1	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
272	94	yatch	BL-1728047040	47	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	8885	444.25	5	9329.25	0	1	60	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-04 13:04:00	2024-10-04 13:04:00	10	0	1	1	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
273	51	yatch	BL-1728047097	47	0	2024-10-07	00:00:00	01:00:00	0	0		0	500	23.75	5	498.75	0	1	60	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-10-04 13:04:57	2024-10-04 13:04:57	0	0	1	1	60	0	2	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
271	51	yatch	BL-1728046990	47	0	2024-10-07	00:00:00	01:00:00	0	0		0	500	23.75	5	498.75	0	1	60	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-10-04 13:03:10	2024-10-05 17:43:30	0	0	10	1	60	0	2	0	2	0	0	0	\N	0	\N	This is testing	0	0	0	0	0	0	0	\N	0
274	155	yatch	BL-1728310700	47	0	2024-10-09	05:00:00	06:00:00	0	0		0	500	22.5	5	472.5	0	1	155	155	Ms	Hamid	Raza	razahamid105@gmail.com	92	3441562113	2024-10-07 14:18:21	2024-10-07 14:18:21	0	0	1	0	60	0	1	0	2	50	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
275	155	yatch	BL-1728310742	47	0	2024-10-09	05:00:00	06:00:00	0	0		0	500	22.5	5	472.5	0	1	155	155	Ms	Hamid	Raza	razahamid105@gmail.com	92	3441562113	2024-10-07 14:19:03	2024-10-07 14:19:03	0	0	1	0	60	0	1	0	2	50	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
276	155	yatch	BL-1728310742	47	0	2024-10-09	05:00:00	06:00:00	0	0		0	500	22.5	5	472.5	0	1	155	155	Ms	Hamid	Raza	razahamid105@gmail.com	92	3441562113	2024-10-07 14:27:08	2024-10-07 14:27:08	0	0	1	0	60	0	1	0	2	50	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
277	155	yatch	BL-1728310742	47	0	2024-10-09	05:00:00	06:00:00	0	0		0	500	22.5	5	472.5	0	1	155	155	Ms	Hamid	Raza	razahamid105@gmail.com	92	3441562113	2024-10-07 14:29:04	2024-10-07 14:29:04	0	0	1	0	60	0	1	0	2	50	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
278	155	yatch	BL-1728311518	47	0	2024-10-09	07:00:00	08:00:00	0	0		0	500	22.5	5	472.5	0	0	155	155	Ms	Hamid	Raza	razahamid105@gmail.com	92	3441562113	2024-10-07 14:31:58	2024-10-07 14:31:58	0	0	1	0	60	0	1	0	2	50	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
279	51	yatch	BL-1728311879	47	0	2024-10-09	09:00:00	10:00:00	0	0		0	500	25	5	525	0	1	60	51	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-10-07 14:37:59	2024-10-07 14:37:59	0	0	1	1	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
280	97	pacakge	BL-1728330147	42	130	2024-10-10	10:00:00	16:00:00	1	0		0	1500	76	5	1596	20	0	97	97	Mr	aah	has	z.falak777@gmail.com	971	8484544556	2024-10-07 19:42:28	2024-10-07 19:42:28	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
281	97	pacakge	BL-1728330554	42	130	2024-10-10	09:00:00	19:00:00	1	0		0	1500	75.5	5	1585.5	10	0	97	97	Mr	aah	has	z.falak777@gmail.com	971	8484544556	2024-10-07 19:49:15	2024-10-07 19:49:15	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
282	169	yatch	BL-1728366338	47	0	2024-10-10	19:00:00	20:00:00	0	0		0	800	36	5	756	0	1	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	2024-10-08 05:45:39	2024-10-08 05:45:39	0	0	1	0	60	0	1	0	2	80	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
283	169	yatch	BL-1728367736	47	0	2024-10-10	20:00:00	21:00:00	0	0		0	800	40	5	840	0	1	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	2024-10-08 06:09:01	2024-10-08 06:09:01	0	0	1	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
284	169	yatch	BL-1728368044	47	0	2024-10-10	21:00:00	22:00:00	0	0		0	800	40	5	840	0	1	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	2024-10-08 06:14:11	2024-10-08 06:14:11	0	0	1	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
285	169	yatch	BL-1728399247	47	0	2024-10-11	16:00:00	17:00:00	0	0		0	800	40	5	840	0	1	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	2024-10-08 14:54:11	2024-10-08 14:54:11	0	0	1	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
286	169	yatch	BL-1728399315	47	0	2024-10-12	18:00:00	19:00:00	0	0		0	1000	50	5	1050	0	1	169	169	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-10-08 14:55:17	2024-10-08 14:55:17	0	0	1	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
287	0	yatch	BL-1728404660	47	0	2024-10-11	18:00:00	19:00:00	0	0		0	900	20	5	420	0	1	60	0	Mr	ggg	df	z.falak@gmail.com	971	5221521	2024-10-08 16:24:20	2024-10-08 16:24:20	41	500	1	1	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
288	0	yatch	BL-1728407863	71	0	2024-10-12	09:00:00	12:00:00	0	0		0	150	7.5	5	157.5	0	1	174	0	Mr	yw	gw	z.falak777@gmail.com	971	8484	2024-10-08 17:17:43	2024-10-08 17:17:43	0	0	1	1	174	0	1	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
289	173	pacakge	BL-1728440697	35	129	2024-10-13	08:00:00	12:00:00	0	0	It’s urgent	0	1700	88.5	5	1858.5	0	1	76	173	Mr	anil	navis	anilnavis@gmail.com	971	564005096	2024-10-09 02:24:57	2024-10-09 02:24:57	0	0	1	1	76	70	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
290	173	pacakge	BL-1728442418	35	128	2024-10-12	12:00:00	16:00:00	0	0		0	1500	80	5	1680	40	1	76	173	Mr	anil	navis	anilnavis@gmail.com	971	52343163	2024-10-09 02:53:38	2024-10-09 02:53:38	0	0	1	1	76	60	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
291	173	pacakge	BL-1728447141	42	130	2024-10-11	14:00:00	19:00:00	1	0		0	1500	75	5	1575	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-09 04:12:22	2024-10-09 04:12:22	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
292	173	pacakge	BL-1728447280	42	130	2024-10-12	16:00:00	19:00:00	1	0		0	1700	85	5	1785	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-09 04:14:41	2024-10-09 05:14:49	0	0	10	0	91	0	0	0	2	0	0	0	\N	1785	\N	\N	0	0	0	0	0	0	0	\N	0
293	169	yatch	BL-1728458698	47	0	2024-10-11	03:00:00	05:00:00	0	0		0	1200	31.5	5	661.5	0	1	169	169	Mr	Anil	Anil	anil@dxbbusinessgroup.com	971	523243163	2024-10-09 07:25:09	2024-10-09 07:25:09	41	500	1	0	60	0	1	0	2	70	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
294	169	pacakge	BL-1728459151	42	130	2024-10-11	09:00:00	11:00:00	0	0		0	1500	77	5	1617	40	1	169	169	Mr	Anil	Anil	razahamid34@gmail.com	92	3441562554	2024-10-09 07:32:34	2024-10-09 07:32:34	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
295	169	pacakge	BL-1728460132	62	148	2024-10-11	05:00:00	09:00:00	0	0		0	10000	500	5	10500	0	1	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	2024-10-09 07:49:24	2024-10-09 07:49:24	0	0	1	0	133	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
296	173	pacakge	BL-1728475247	71	160	2024-10-12	12:00:00	15:00:00	1	0	Need extra neatness	0	2100	107	5	2247	20	1	173	173	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	2024-10-09 12:01:04	2024-10-09 12:01:04	0	0	1	0	174	20	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
297	169	pacakge	BL-1728475835	47	159	2024-10-11	07:00:00	08:00:00	0	0		0	20	159.75	5	3354.75	650	1	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	2024-10-09 12:11:07	2024-10-09 12:19:12	0	0	2	0	60	2525	0	0	2	0	1	4	Great	0	\N	\N	0	0	0	0	0	0	0	\N	0
298	173	pacakge	BL-1728476367	71	160	2024-10-12	15:00:00	18:00:00	0	0		0	2200	112	5	2352	20	1	173	173	Mr	Anil	Navis	anil@dxbusinessgroup.com	971	564005096	2024-10-09 12:19:58	2024-10-09 12:19:58	0	0	1	0	174	20	0	0	1	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
299	169	pacakge	BL-1728476592	47	159	2024-10-11	10:00:00	11:00:00	0	0		0	20	34.75	5	729.75	650	0	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	2024-10-09 12:23:39	2024-10-09 12:23:39	0	0	1	0	60	25	0	0	1	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
300	169	pacakge	BL-1728477012	47	159	2024-10-11	11:00:00	12:00:00	0	0		0	20	34.75	5	729.75	650	0	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	2024-10-09 12:30:38	2024-10-09 12:30:38	0	0	1	0	60	25	0	0	1	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
303	169	yatch	BL-1728481597	47	0	2024-10-11	12:00:00	14:00:00	0	0		0	1600	49.5	5	1039.5	0	1	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	2024-10-09 13:46:38	2024-10-09 13:46:38	41	500	1	0	60	0	1	0	3	110	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
305	173	pacakge	BL-1728508818	71	160	2024-10-13	09:00:00	12:00:00	0	0		0	2000	101	5	2121	20	1	174	173	Mr	anil	navis	anilnavis@gmail.com	971	523243163	2024-10-09 21:20:18	2024-10-09 21:20:18	0	0	1	1	174	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
302	173	yatch	BL-1728479775	71	0	2024-10-12	20:00:00	21:00:00	0	0	The only way I could do that was if tyyyyyyyu	0	200	9.5	5	199.5	0	1	174	173	Mr	anil	navis	anilnavis@gmail.com	971	523243163	2024-10-09 13:16:15	2024-10-17 14:32:40	0	0	10	1	174	0	2	0	2	0	0	0	\N	199	\N	\N	0	0	0	0	0	0	0	\N	0
301	173	yatch	BL-1728477580	71	0	2024-10-12	19:00:00	20:00:00	0	0		0	200	10	5	210	0	1	174	173	Mr	anil	navis	anilnavis@gmail.com	971	564005096	2024-10-09 12:39:40	2024-10-10 05:10:52	0	0	10	1	174	0	1	0	2	0	0	0	\N	0	\N	nothing	0	0	0	0	0	0	0	\N	0
304	0	yatch	BL-1728492523	71	0	2024-10-12	21:00:00	22:00:00	0	0	Abc	0	200	9.5	5	199.5	0	1	174	0	Mr	ba	bq	z.falak777@gmail.com	971	84848	2024-10-09 16:48:43	2024-10-10 03:25:43	0	0	2	1	174	0	2	0	2	0	1	3	The only way I could do that was if you wanted me too but you don’t want me too so you don’t need me too I don’t care about that either way but you know	0	\N	\N	0	0	0	0	0	0	0	\N	0
307	94	yatch	BL-1728534838	47	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	197	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-10 04:33:58	2024-10-10 04:33:58	10	0	1	1	197	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
308	94	yatch	BL-1728534908	47	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	197	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-10 04:35:08	2024-10-10 04:35:08	10	0	1	1	197	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
309	94	yatch	BL-1728535024	47	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	197	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-10 04:37:04	2024-10-10 04:37:04	10	0	1	1	197	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
310	94	yatch	BL-1728535546	47	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	197	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-10 04:45:46	2024-10-10 04:45:46	10	0	1	1	197	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
311	94	yatch	BL-1728535622	47	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	197	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-10 04:47:02	2024-10-10 04:47:02	10	0	1	1	197	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
312	94	yatch	BL-1728535818	47	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	197	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-10 04:50:18	2024-10-10 04:50:18	10	0	1	1	197	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
313	94	yatch	BL-1728536075	47	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	197	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-10 04:54:35	2024-10-10 04:54:35	10	0	1	1	197	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
314	94	yatch	BL-1728536226	47	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	197	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-10 04:57:06	2024-10-10 04:57:06	10	0	1	1	197	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
315	94	yatch	BL-1728536243	47	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	197	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-10 04:57:23	2024-10-10 04:57:23	10	0	1	1	197	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
316	94	yatch	BL-1728536387	47	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	197	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-10 04:59:47	2024-10-10 04:59:47	10	0	1	1	197	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
317	94	yatch	BL-1728536445	47	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	197	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-10 05:00:45	2024-10-10 05:00:45	10	0	1	1	197	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
318	94	yatch	BL-1728536791	47	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	197	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	2024-10-10 05:06:31	2024-10-10 05:06:31	10	0	1	1	197	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
319	94	yatch	BL-1728536987	47	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	197	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	92	3042721336	2024-10-10 05:09:47	2024-10-10 05:09:47	10	0	1	1	197	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
320	94	yatch	BL-1728539809	47	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	197	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	92	3042721336	2024-10-10 05:56:49	2024-10-10 05:56:49	10	0	1	1	197	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
321	94	yatch	BL-1728540068	47	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	197	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	92	3042721336	2024-10-10 06:01:08	2024-10-10 06:01:08	10	0	1	1	197	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
322	94	yatch	BL-1728540100	47	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	197	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	92	3042721336	2024-10-10 06:01:40	2024-10-10 06:01:40	10	0	1	1	197	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
323	94	yatch	BL-1728540281	47	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	197	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	92	3042721336	2024-10-10 06:04:41	2024-10-10 06:04:41	10	0	1	1	197	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
324	169	pacakge	BL-1728541972	71	160	2024-10-13	15:00:00	17:00:00	0	0		0	2000	105	5	2205	60	1	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	2024-10-10 06:32:54	2024-10-10 06:32:54	0	0	1	0	174	40	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
325	0	pacakge	BL-1728551821	71	160	2024-10-13	17:00:00	20:00:00	0	0		0	2400	121	5	2541	20	1	174	0	Mr	anil	navis	anil@dxbusinessgroup.com	971	523243163	2024-10-10 09:17:01	2024-10-10 09:17:01	0	0	1	1	174	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
326	0	pacakge	BL-1728552712	71	160	2024-10-20	09:00:00	12:00:00	0	0		0	2100	106	5	2226	20	1	174	0	Mr	anilnavis	navis	anil@dxbusinessgroup.com	971	523243163	2024-10-10 09:31:52	2024-10-10 09:31:52	0	0	1	1	174	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
327	94	yatch	BL-1728555860	47	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	197	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	92	3042721336	2024-10-10 10:24:20	2024-10-10 10:24:20	10	0	1	1	197	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
332	94	yatch	BL-1728881910	47	0	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	201	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	92	3042721336	2024-10-14 04:58:30	2024-10-14 04:58:30	10	0	1	1	201	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
333	94	pacakge	BL-1728881933	47	2	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	201	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	92	3042721336	2024-10-14 04:58:53	2024-10-14 04:58:53	10	0	1	1	201	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
334	94	pacakge	BL-1728882237	47	2	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	201	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	92	3042721336	2024-10-14 05:03:57	2024-10-14 05:03:57	10	0	1	1	201	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
341	173	pacakge	BL-1729270201	71	160	2024-10-20	19:00:00	23:00:00	1	0		0	2800	80.6	5	1692.6	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-18 16:50:25	2024-10-18 16:50:25	0	0	1	0	174	0	3	0	2	1188	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
306	173	pacakge	BL-1728509482	71	160	1970-01-01	20:00:00	21:00:00	0	0		0	2200	111	5	2331	20	1	174	173	Mr	anil	navis	anilnavis@gmail.com	971	523243163	2024-10-09 21:31:22	2024-10-14 16:22:25	0	0	1	1	174	0	0	0	2	0	0	0	\N	0	asfdsfsadf	\N	0	0	0	0	0	0	0	\N	0
330	173	pacakge	BL-1728569268	71	160	2024-10-19	09:00:00	11:00:00	1	0		0	2000	100.5	5	2110.5	20	1	173	173	mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	2024-10-10 14:08:13	2024-10-15 10:30:36	0	0	10	0	174	0	2	0	2	10	0	0	\N	0	\N	yes	0	0	0	0	0	0	0	\N	0
328	199	pacakge	BL-1728556494	47	159	2024-10-19	04:00:00	05:00:00	0	0		0	1020	84.75	5	1779.75	650	1	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-10-10 10:34:56	2024-10-16 13:21:05	0	0	1	0	60	25	0	0	2	0	0	0	\N	0	dgsdfgsfg	\N	0	0	0	0	0	0	0	\N	0
335	199	pacakge	BL-1729141929	71	160	2024-10-19	09:00:00	11:00:00	0	0		0	2000	102	5	2142	20	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	2024-10-17 05:12:38	2024-10-17 05:12:38	0	0	1	0	174	20	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
348	199	yatch	BL-1729325229	47	0	2024-10-26	04:00:00	07:00:00	0	0		0	1500	50	5	1050	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	2024-10-19 08:07:31	2024-10-19 08:07:31	41	500	1	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
337	199	yatch	BL-1729174631	71	0	2024-10-19	11:00:00	12:00:00	0	0		0	50	2.5	5	52.5	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	2024-10-17 14:17:15	2024-10-17 14:17:15	0	0	1	0	174	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
331	173	pacakge	BL-1728617862	42	130	2024-10-14	09:00:00	12:00:00	1	0	Nothing special	0	1600	80.5	5	1690.5	10	1	173	173	Mr	Anil	navis	bb@h.com	+971	5464864846	2024-10-11 03:37:43	2024-10-17 14:34:10	0	0	10	0	91	0	0	0	2	0	0	0	\N	1690	\N	\N	0	0	0	0	0	0	0	\N	0
338	173	yatch	BL-1729181697	71	0	2024-10-19	12:00:00	13:00:00	1	0	en	0	100	5	5	105	0	1	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-17 16:15:17	2024-10-17 16:20:13	0	0	10	0	174	0	0	0	2	0	0	0	\N	52	\N	\N	0	0	0	0	0	0	0	\N	0
339	173	yatch	BL-1729251823	71	0	2024-10-20	12:00:00	14:00:00	1	0	en	0	400	16	5	336	0	1	173	173	Mr	anil	navis	anil@dxbusinessgroup.com	+971	2424354648	2024-10-18 11:44:09	2024-10-18 11:44:09	0	0	1	0	174	0	5	0	2	80	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
340	173	pacakge	BL-1729253556	71	160	2024-10-20	14:00:00	19:00:00	1	0		0	3200	160	5	3360	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-18 12:12:58	2024-10-18 12:12:58	0	0	1	0	174	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
342	173	pacakge	BL-1729272258	71	160	2024-10-26	09:00:00	13:00:00	1	0		0	2150	70.89	5	1488.69	20	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-18 17:24:40	2024-10-18 17:24:40	0	0	1	0	174	20	3	0	2	772.2	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
343	193	yatch	BL-1728310742	47	0	2024-10-09	05:00:00	06:00:00	0	0		0	500	22.5	5	472.5	0	1	155	155	Ms	Hamid	Raza	razahamid105@gmail.com	92	3441562113	2024-10-19 04:57:32	2024-10-19 04:57:32	0	0	1	0	60	0	1	0	2	50	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
344	173	pacakge	BL-1729321572	64	149	2024-10-21	04:00:00	08:00:00	1	0		0	5500	185	5	3885	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-19 07:06:49	2024-10-19 07:06:49	0	0	1	0	131	0	3	0	2	1800	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
345	173	pacakge	BL-1729322001	64	149	2024-10-21	08:00:00	12:00:00	1	0		0	5775	197.5	5	4147.5	200	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-19 07:13:43	2024-10-19 07:13:43	0	0	1	0	131	0	3	0	2	2025	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
346	173	pacakge	BL-1729324200	64	149	2024-10-21	12:00:00	17:00:00	1	0		0	5775	197.5	5	4147.5	200	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-19 07:50:26	2024-10-19 07:50:26	0	0	1	0	131	0	3	0	2	2025	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
347	199	pacakge	BL-1729325091	47	159	2024-10-25	03:00:00	04:00:00	0	0		0	20	192.25	5	4037.25	1300	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	2024-10-19 08:05:13	2024-10-19 08:05:13	0	0	1	0	60	2525	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
329	199	pacakge	BL-1728557367	47	159	2024-10-24	15:00:00	16:00:00	0	0		0	20	31.275	5	656.775	650	1	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-10-10 10:49:29	2024-10-19 20:15:43	0	0	1	0	60	25	1	0	2	69.5	0	0	\N	0	sdfsdf	\N	0	72.975	729.75	0	1	0	0	\N	0
349	199	pacakge	BL-1729325676	47	159	2024-10-25	10:00:00	14:00:00	0	0		0	2420	199.8	5	4195.8	650	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	2024-10-19 08:14:57	2024-10-19 08:14:57	0	0	1	0	60	2525	4	0	2	1599	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
350	203	pacakge	BL-1729325828	42	130	2024-10-21	17:00:00	20:00:00	0	0		0	1700	85.5	5	1795.5	10	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	2024-10-19 08:17:26	2024-10-19 08:17:26	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
353	173	pacakge	BL-1729326260	64	149	2024-10-22	04:00:00	09:00:00	1	0		0	6000	195	5	4095	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-19 08:24:42	2024-10-19 08:24:42	0	0	1	0	131	0	3	0	2	2100	0	0	\N	0	\N	\N	1000	0	0	0	0	0	0	\N	0
354	202	pacakge	BL-1729328350	71	160	2024-10-27	11:00:00	15:00:00	0	0		0	2400	141	5	2961	20	0	202	202	Mr	Jdjdke	Nxndnd	arshad888hash@gmail.com	92	3042721336	2024-10-19 08:59:39	2024-10-19 08:59:39	0	0	1	0	174	0	0	0	2	0	0	0	\N	0	\N	\N	400	0	0	0	0	0	0	\N	0
355	202	pacakge	BL-1729328534	47	159	2024-10-26	08:00:00	09:00:00	0	0		0	20	26.8	5	562.8	650	0	202	202	Mr	Jdjdke	Nxndnd	arshad888hash@gmail.com	92	3042721336	2024-10-19 09:02:33	2024-10-19 09:02:33	0	0	1	0	60	0	4	0	2	134	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
356	202	pacakge	BL-1729330731	47	159	2024-10-25	18:00:00	22:00:00	0	0		0	20	33.5	5	703.5	650	0	202	202	Mr	Jdjdke	Nxndnd	arshad888hash@gmail.com	92	3042721336	2024-10-19 09:39:11	2024-10-19 17:42:45	0	0	1	0	60	0	0	0	2	0	0	0	\N	0	approved	\N	0	5670	6373.5	0	1	0	0	\N	0
364	173	yatch	BL-1729406991	71	0	2024-10-27	21:00:00	00:00:00	1	0	en	0	400	20	5	420	0	1	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-20 06:50:10	2024-10-20 11:52:23	0	0	1	0	174	0	0	0	2	0	0	0	\N	0	no reson	\N	0	0	0	420	1	0	0	\N	0
365	173	pacakge	BL-1729417046	71	160	2024-11-09	14:00:00	17:00:00	1	0	The only way I could do that was if you wanted me too but you don’t want me too so you	0	2200	85.4	5	1793.4	20	1	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-20 09:37:47	2024-10-20 09:37:47	0	0	1	0	174	20	3	0	2	732	0	0	\N	0	\N	\N	200	0	0	0	0	0	0	\N	0
351	203	pacakge	BL-1729325998	42	130	2024-11-03	09:00:00	11:00:00	0	0		0	1500	75.5	5	1585.5	10	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	2024-10-19 08:20:17	2024-10-19 19:50:34	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	zxczxc	\N	0	0	1585.5	0	1	0	0	\N	0
359	173	pacakge	BL-1729338055	71	160	2024-10-27	15:00:00	18:00:00	1	0	I need blue balloon	0	2400	142	5	2982	20	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-19 11:41:16	2024-10-19 11:41:16	0	0	1	0	174	20	0	0	2	0	0	0	\N	0	\N	\N	400	0	0	0	0	0	0	\N	0
360	203	pacakge	BL-1729339275	42	161	2024-11-02	09:00:00	21:00:00	0	0		0	2550	215.5	5	4525.5	10	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	2024-10-19 12:01:39	2024-10-19 12:01:39	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	1750	0	0	0	0	0	0	\N	0
366	173	pacakge	BL-1729417090	71	160	2024-11-09	14:00:00	17:00:00	1	0	The only way I could do that was if you wanted me too but you don’t want me too so you	0	2200	85.4	5	1793.4	20	1	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-20 09:38:27	2024-10-20 09:38:27	0	0	1	0	174	20	3	0	2	732	0	0	\N	0	\N	\N	200	0	0	0	0	0	0	\N	0
361	173	pacakge	BL-1729339381	71	160	2024-10-27	18:00:00	21:00:00	1	0	The first time the two sides agreed to meet on a single day yyyyy	0	2400	99.4	5	2087.4	20	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-19 12:03:27	2024-10-19 12:03:27	0	0	1	0	174	20	3	0	2	852	0	0	\N	0	\N	\N	400	0	0	0	0	0	0	\N	0
362	173	pacakge	BL-1729362003	42	161	2024-10-22	09:00:00	21:00:00	1	0		0	800	40.5	5	850.5	10	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-19 18:20:27	2024-10-19 18:20:27	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
358	203	pacakge	BL-1729337588	42	161	2024-11-16	09:00:00	21:00:00	0	0		0	2450	205.5	5	4315.5	10	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	2024-10-19 11:33:34	2024-10-19 16:13:19	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	aasd	\N	1650	210	4525.5	0	1	0	0	\N	0
357	203	pacakge	BL-1729336181	42	161	2024-11-09	09:00:00	14:00:00	0	0		0	2550	215.5	5	4525.5	10	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	2024-10-19 11:10:00	2024-10-19 16:15:08	0	0	1	0	91	0	0	0	2	0	0	0	\N	3360	dadasd	\N	1750	0	1690.5	2835	1	0	0	\N	0
363	173	pacakge	BL-1729362130	42	161	2024-10-22	09:00:00	21:00:00	1	0		0	800	40.5	5	850.5	10	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-19 18:22:32	2024-10-19 18:22:32	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
336	173	pacakge	BL-1729165328	71	160	2024-10-26	14:00:00	19:00:00	1	0		0	2100	70.04	5	1470.84	20	1	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-17 11:42:27	2024-10-19 17:10:45	0	0	1	0	174	20	3	0	2	739.2	0	0	\N	735	test	\N	0	1931.16	3402	0	1	0	0	\N	0
371	173	pacakge	BL-1729419609	71	160	2024-11-09	14:00:00	17:00:00	1	0	The only way I could do that was if you wanted me too but you don’t want me too so you	0	2200	85.4	5	1793.4	20	1	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-20 10:20:26	2024-10-20 10:20:26	0	0	1	0	174	20	3	0	2	732	0	0	\N	0	\N	\N	200	0	0	0	0	0	0	\N	0
369	193	yatch	BL-1729324946	64	0	2024-10-19	12:00:00	17:00:00	1	0		0	1525	76.25	5	1601.25	0	0	199	199	Mr	\N	\N		\N	\N	2024-10-20 10:17:45	2024-10-20 10:17:45	0	0	1	0	131	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
370	173	pacakge	BL-1729419561	71	160	2024-11-09	14:00:00	17:00:00	1	0	The only way I could do that was if you wanted me too but you don’t want me too so you	0	2200	85.4	5	1793.4	20	1	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-20 10:19:44	2024-10-20 10:19:44	0	0	1	0	174	20	3	0	2	732	0	0	\N	0	\N	\N	200	0	0	0	0	0	0	\N	0
372	173	pacakge	BL-1729419991	71	160	2024-11-03	11:00:00	14:00:00	1	0		0	2200	85.4	5	1793.4	20	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-20 10:26:49	2024-10-20 10:26:49	0	0	1	0	174	20	3	0	2	732	0	0	\N	0	\N	\N	200	0	0	0	0	0	0	\N	0
373	193	yatch	BL-1729324946	64	0	2024-10-19	12:00:00	17:00:00	1	0		0	1525	76.25	5	1601.25	0	0	199	199	Mr	\N	\N		\N	\N	2024-10-20 10:28:24	2024-10-20 10:28:24	0	0	1	0	131	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
374	203	yatch	BL-1729424945	28	0	2024-10-23	09:00:00	11:00:00	0	0		0	200	10	5	210	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	2024-10-20 11:49:24	2024-10-20 11:49:24	0	0	1	0	59	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
375	173	pacakge	BL-1729425729	71	160	2024-11-03	14:00:00	17:00:00	1	0		0	2400	98.7	5	2072.7	20	1	173	173	Mr	Anil	navis	anil@dxbusinesgroup.com	+971	564005096	2024-10-20 12:02:29	2024-10-20 12:02:29	0	0	1	0	174	0	3	0	2	846	0	0	\N	0	\N	\N	400	0	0	0	0	0	0	\N	0
376	203	pacakge	BL-1729485759	42	161	2024-10-23	11:00:00	14:00:00	0	0		0	800	40.5	5	850.5	10	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	2024-10-21 04:42:58	2024-10-21 04:42:58	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
378	203	pacakge	BL-1729486309	42	161	2024-10-23	11:00:00	14:00:00	0	0		0	800	40.5	5	850.5	10	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	2024-10-21 04:52:07	2024-10-21 04:52:07	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
379	203	pacakge	BL-1729486398	42	161	2024-10-23	11:00:00	14:00:00	0	0		0	800	40.5	5	850.5	10	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	2024-10-21 04:53:39	2024-10-21 04:53:39	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
380	199	pacakge	BL-1729486459	47	159	2024-10-24	03:00:00	04:00:00	0	0		0	20	159.75	5	3354.75	650	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	2024-10-21 04:54:42	2024-10-21 04:54:42	0	0	1	0	60	2525	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
381	173	pacakge	BL-1729486891	71	160	2024-11-03	17:00:00	20:00:00	1	0	The only way I could do that was if you wanted me too but you don’t	0	2400	99.4	5	2087.4	20	1	173	173	Mr	Anil	Davis	anil@dxbuisnessgroup.com	+971	523243163	2024-10-21 05:02:18	2024-10-21 05:02:18	0	0	1	0	174	20	3	0	2	852	0	0	\N	0	\N	\N	400	0	0	0	0	0	0	\N	0
382	203	pacakge	BL-1729489082	42	130	2024-10-23	14:00:00	20:00:00	0	0		0	1500	75.5	5	1585.5	10	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	2024-10-21 05:38:19	2024-10-21 05:38:19	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
383	173	pacakge	BL-1729490651	42	161	2024-10-24	16:00:00	21:00:00	1	0		0	800	40	5	840	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-21 06:04:39	2024-10-21 06:04:39	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
384	173	pacakge	BL-1729490911	62	148	2024-10-23	01:00:00	08:00:00	1	0		0	11500	490	5	10290	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-21 06:08:54	2024-10-21 06:08:54	0	0	1	0	133	0	3	0	2	4200	0	0	\N	0	\N	\N	2500	0	0	0	0	0	0	\N	0
385	203	pacakge	BL-1729491385	42	130	2024-10-30	09:00:00	14:00:00	0	0		0	1500	75.5	5	1585.5	10	1	203	203	Mr	S	Sd	dev@yopmail.com	91	9847823799	2024-10-21 06:16:49	2024-10-21 06:16:49	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
386	203	yatch	BL-1729491482	28	0	2024-10-30	16:00:00	20:00:00	0	0		0	950	47.5	5	997.5	0	0	203	203	Mr	Ds	D	dev@yopmail.com	971	9780	2024-10-21 06:18:19	2024-10-21 06:18:19	0	0	1	0	59	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
387	173	pacakge	BL-1729495827	71	160	2024-11-03	20:00:00	23:00:00	1	0	The only way I could	0	2400	99.4	5	2087.4	20	1	173	173	Mr	Anil	na	anil@dxbusinessgroup.com	+971	523243163	2024-10-21 07:30:47	2024-10-21 07:30:47	0	0	1	0	174	20	3	0	2	852	0	0	\N	0	\N	\N	400	0	0	0	0	0	0	\N	0
388	173	pacakge	BL-1729509508	71	160	2024-11-09	17:00:00	20:00:00	1	0	The only way I could do that was	0	2200	112	5	2352	20	1	173	173	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	2024-10-21 11:18:50	2024-10-21 11:18:50	0	0	1	0	174	20	0	0	2	0	0	0	\N	0	\N	\N	200	0	0	0	0	0	0	\N	0
389	173	pacakge	BL-1729513445	71	160	2024-11-09	20:00:00	23:00:00	1	0	Trying my luck on my birthday	0	2000	78.4	5	1646.4	20	1	173	173	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	2024-10-21 12:24:31	2024-10-21 12:24:31	0	0	1	0	174	20	3	0	2	672	0	0	\N	0	\N	\N	200	0	0	0	0	0	0	\N	0
390	173	pacakge	BL-1729517074	71	160	2024-11-17	09:00:00	11:00:00	1	0	The first time the two sides agreed to meet on a single day was when they agreed on	0	2000	74.9	5	1572.9	20	1	173	173	Mr	Sunil	navis	anil@dxbusinessgroup.com	+971	523243163	2024-10-21 13:25:01	2024-10-21 18:06:44	0	0	1	0	174	20	3	0	2	642	0	0	\N	0	nothing	\N	100	569.1	2142	0	1	0	0	\N	0
391	173	pacakge	BL-1729522670	71	160	2024-11-24	09:00:00	11:00:00	1	0	The first time the team had played a match was	0	2000	78.4	5	1646.4	20	1	173	173	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	2024-10-21 14:58:11	2024-10-21 19:04:19	0	0	1	0	174	20	3	0	2	672	0	0	\N	0	nothing	\N	200	495.6	2142	0	1	0	0	\N	0
393	203	pacakge	BL-1729577617	72	162	2024-10-27	18:00:00	20:00:00	0	0		0	1000	50	5	1050	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	2024-10-22 06:13:55	2024-10-22 06:13:55	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
377	199	pacakge	BL-1729485909	47	159	2024-10-24	03:00:00	04:00:00	0	0		0	20	159.75	5	3354.75	650	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	2024-10-21 04:45:31	2024-10-23 07:00:21	0	0	10	0	60	2525	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	bank	0
400	205	yatch	BL-1729655431	72	0	2024-10-29	08:00:00	10:00:00	0	0		0	200	10	5	210	0	0	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	971	523243163	2024-10-23 03:50:47	2024-10-23 04:12:17	0	0	10	0	91	0	0	0	2	0	0	0	\N	210	\N	\N	0	0	0	0	0	0	0	\N	0
392	203	pacakge	BL-1729573953	72	162	2024-10-27	09:00:00	15:00:00	0	0		0	1000	75	5	1575	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	2024-10-22 05:12:52	2024-10-22 11:42:20	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	asdas	\N	500	52.5	1627.5	0	1	77.5	550	\N	0
401	205	yatch	BL-1729656819	72	0	2024-10-29	09:00:00	11:00:00	0	0		0	200	10	5	210	0	0	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	971	523243163	2024-10-23 04:14:04	2024-10-23 04:14:31	0	0	10	0	91	0	0	0	2	0	0	0	\N	210	\N	\N	0	0	0	0	0	0	0	\N	0
394	203	yatch	BL-1729587252	72	0	2024-10-28	09:00:00	14:00:00	0	0		0	300	15	5	315	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	2024-10-22 08:54:29	2024-10-22 15:12:39	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	fgsdfs	\N	0	52.5	367.5	0	1	17.5	0	\N	0
402	203	yatch	BL-1729660785	72	0	2024-10-29	10:00:00	12:00:00	0	0		0	200	10	5	210	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	2024-10-23 05:20:07	2024-10-23 05:20:24	0	0	10	0	91	0	0	0	2	0	0	0	\N	210	\N	\N	0	0	0	0	0	0	0	wallet	100
403	199	yatch	BL-1729664696	47	0	2024-10-31	03:00:00	11:00:00	0	0		0	4000	200	5	4200	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	2024-10-23 06:25:19	2024-10-23 06:25:19	0	0	1	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
396	203	yatch	BL-1729597145	72	0	2024-10-28	16:00:00	19:00:00	0	0		0	450	22.5	5	472.5	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	2024-10-22 11:39:23	2024-10-22 11:39:23	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
397	203	yatch	BL-1729597268	72	0	2024-10-29	16:00:00	19:00:00	0	0		0	600	30	5	630	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	2024-10-22 11:41:25	2024-10-22 11:41:25	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
395	203	yatch	BL-1729595634	72	0	2024-10-29	19:00:00	21:00:00	0	0		0	600	30	5	630	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	2024-10-22 11:14:13	2024-10-22 15:50:01	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	czcz	\N	0	0	420	210	1	20	0	\N	0
398	173	pacakge	BL-1729603951	71	160	2024-11-17	11:00:00	15:00:00	1	0	The only way I could do that was if you wanted me too but you tyyyyyyy I know what I mean I don’t u	0	2000	78.4	5	1646.4	20	1	173	173	Mr	anil	navis	anilnavis@gmail.com	+971	523243163	2024-10-22 13:32:51	2024-10-22 17:46:02	0	0	1	0	174	20	3	0	2	672	0	0	\N	0	need one hour	\N	200	915.6	2562	0	1	122	400	\N	0
399	205	yatch	BL-1729645077	71	0	2024-11-09	09:00:00	12:00:00	1	0	en	0	150	7.5	5	157.5	0	1	205	205	Mr	Anil	Davis	anil@dxbusinessgroup.com	+971	523243163	2024-10-23 00:58:34	2024-10-23 00:59:52	0	0	10	0	174	0	0	0	2	0	0	0	\N	157	\N	\N	0	0	0	0	0	0	0	\N	0
406	205	yatch	BL-1729677558	71	0	2024-11-24	11:00:00	12:00:00	1	0	en	0	200	10	5	210	0	0	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	971	523243163	2024-10-23 09:59:46	2024-10-23 10:00:07	0	0	10	0	174	0	0	0	2	0	0	0	\N	210	\N	\N	0	0	0	0	0	0	0	bank	100
404	199	yatch	BL-1729665032	47	0	2024-11-02	04:00:00	05:00:00	0	0		0	2400	120	5	2520	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	2024-10-23 06:30:52	2024-10-23 07:03:34	0	0	10	0	60	0	0	0	2	0	0	0	\N	2520	provider requested	\N	0	0	525	1995	1	25	0	bank	100
405	203	pacakge	BL-1729666770	72	162	2024-10-29	08:00:00	11:00:00	0	0		0	1000	38.5	5	808.5	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	2024-10-23 07:03:52	2024-10-23 07:03:52	0	0	1	0	91	0	3	0	2	330	0	0	\N	0	\N	\N	100	0	0	0	0	0	0	\N	0
407	205	yatch	BL-1729683192	71	0	2024-11-24	11:00:00	12:00:00	1	0	en	0	200	10	5	210	0	0	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	971	523243163	2024-10-23 11:33:36	2024-10-23 11:34:10	0	0	10	0	174	0	0	0	2	0	0	0	\N	210	\N	\N	0	0	0	0	0	0	0	wallet	100
408	205	yatch	BL-1729687336	71	0	2024-11-23	09:00:00	10:00:00	1	0	en	0	50	2.5	5	52.5	0	0	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	971	523243163	2024-10-23 12:42:34	2024-10-23 12:43:38	0	0	10	0	174	0	0	0	2	0	0	0	\N	52	\N	\N	0	0	0	0	0	0	0	bank	100
409	205	yatch	BL-1729690524	71	0	2024-11-24	11:00:00	12:00:00	0	0	Vshhsjshjsjskkks	0	200	10	5	210	0	0	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	971	523243163	2024-10-23 13:35:57	2024-10-23 13:37:13	0	0	10	0	174	0	0	0	2	0	0	0	\N	210	\N	\N	0	0	0	0	0	0	0	bank	100
410	173	pacakge	BL-1729698320	71	160	2024-11-24	11:00:00	14:00:00	1	0	The only way I could do that was	0	2000	112	5	2352	20	1	173	173	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	2024-10-23 15:45:41	2024-10-23 15:45:41	0	0	1	0	174	20	0	0	2	0	0	0	\N	0	\N	\N	200	0	0	0	0	0	0	\N	0
411	173	pacakge	BL-1729727010	71	160	2024-10-26	19:00:00	00:00:00	1	0	This is test comments	0	2000	100	5	2100	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-23 23:43:57	2024-10-23 23:43:57	0	0	1	0	174	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
412	173	yatch	BL-1729727117	71	0	2024-10-26	20:00:00	22:00:00	1	0	en	0	400	20	5	420	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-23 23:45:38	2024-10-23 23:45:38	0	0	1	0	174	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
413	173	yatch	BL-1729731424	71	0	2024-10-27	09:00:00	11:00:00	1	0	This is test	0	208.33333333333	10.416666666667	5	218.75	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	2024-10-24 00:57:23	2024-10-24 00:57:23	0	0	1	0	174	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
414	205	pacakge	BL-1729742495	71	160	2024-10-26	22:00:00	00:00:00	1	0	The only way I could do that was if you wanted	0	2000	102	5	2142	20	1	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	2024-10-24 04:01:58	2024-10-24 04:01:58	0	0	1	0	174	20	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
415	203	pacakge	BL-1729742599	72	162	2024-10-26	08:00:00	10:00:00	0	0		0	1000	50	5	1050	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	2024-10-24 04:03:38	2024-10-24 04:09:31	0	0	10	0	91	0	0	0	2	0	0	0	\N	525	\N	\N	0	0	0	0	0	0	0	bank	50
416	205	pacakge	BL-1729743893	71	160	2024-11-24	14:00:00	16:00:00	1	0	The only way I could do that would	0	2000	102	5	2142	20	1	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	2024-10-24 04:25:10	2024-10-24 04:26:05	0	0	10	0	174	20	0	0	2	0	0	0	\N	2142	\N	\N	0	0	0	0	0	0	0	bank	100
417	203	pacakge	BL-1729745427	71	160	2024-11-16	09:00:00	12:00:00	0	0		0	2000	103.5	5	2173.5	20	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	2024-10-24 04:50:49	2024-10-24 04:51:02	0	0	10	0	174	0	0	0	2	0	0	0	\N	2173	\N	\N	50	0	0	0	0	0	0	bank	100
418	193	yatch	BL-1729324946	64	0	2024-10-19	12:00:00	17:00:00	1	0		0	1525	76.25	5	1601.25	0	0	199	199	Mr	\N	\N		\N	\N	2024-10-24 05:25:32	2024-10-24 05:25:32	0	0	1	0	131	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
419	193	yatch	BL-1729748024	64	0	2024-10-24	12:00:00	17:00:00	1	0		0	2098.3333333333	104.91666666667	5	2203.25	0	0	193	193	Mr	\N	\N		\N	\N	2024-10-24 05:34:54	2024-10-24 05:34:54	0	0	1	0	131	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
421	205	pacakge	BL-1729752611	71	160	2024-11-24	17:00:00	20:00:00	1	0	The only way I could do that was if you wanted me there at nine	0	2000	85.4	5	1793.4	20	1	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	2024-10-24 06:50:39	2024-10-24 06:50:39	0	0	1	0	174	20	3	0	2	732	0	0	\N	0	\N	\N	400	0	0	0	0	0	0	\N	0
422	205	yatch	BL-1729753899	71	0	2024-11-24	20:00:00	22:00:00	1	0	The first time the team had a good start in their second	0	800	40	5	840	0	1	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	2024-10-24 07:11:57	2024-10-24 07:11:57	0	0	1	0	174	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
423	205	yatch	BL-1729756649	71	0	2024-11-17	15:00:00	20:00:00	1	0		0	1030	41.2	5	865.2	0	1	205	205	Mr	Anil	nav	anil@dxbusinessgroup.com	+971	523243163	2024-10-24 07:57:49	2024-10-24 07:57:49	0	0	1	0	174	0	6	0	2	206	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
424	173	pacakge	BL-1729762272	72	162	2024-10-26	08:00:00	10:00:00	1	0	The only way I could do that	0	1000	50	5	1050	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	523243163	2024-10-24 09:31:30	2024-10-24 09:31:30	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
426	173	pacakge	BL-1729774908	73	163	2024-10-26	09:00:00	12:00:00	1	0		0	1500	80	5	1680	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	523243163	2024-10-24 13:02:11	2024-10-24 13:02:11	0	0	1	0	207	0	0	0	2	0	0	0	\N	0	\N	\N	100	0	0	0	0	0	0	\N	0
427	173	pacakge	BL-1729775315	73	163	2024-10-26	12:00:00	15:00:00	1	0	The only way I could do that was if you wanted it for the	0	1500	102	5	2142	140	1	173	173	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	2024-10-24 13:08:54	2024-10-24 13:08:54	0	0	1	0	207	200	0	0	2	0	0	0	\N	0	\N	\N	200	0	0	0	0	0	0	\N	0
428	173	pacakge	BL-1729775653	73	163	2024-10-26	15:00:00	17:00:00	1	0		0	1500	92	5	1932	140	1	173	173	Ms	Fatima	fa	anil@dxbusinessgroup.com	+971	50 228 3912	2024-10-24 13:14:31	2024-10-24 13:14:31	0	0	1	0	207	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
429	173	pacakge	BL-1729776101	71	160	2024-12-26	09:00:00	13:00:00	1	0		0	2000	101	5	2121	20	1	173	173	Mr	hh	hhh	gh@g.com	+971	523243163	2024-10-24 13:22:05	2024-10-24 13:22:05	0	0	1	0	174	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
425	199	pacakge	BL-1729774133	71	160	2024-10-31	09:00:00	13:00:00	0	0		0	2000	102	5	2142	20	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	2024-10-24 12:49:21	2024-10-28 07:07:53	0	0	10	0	174	20	0	0	2	0	0	0	\N	2142	\N	\N	0	0	0	0	0	0	0	wallet	100
430	199	yatch	BL-1730099342	47	0	2024-10-31	15:00:00	16:00:00	0	0		0	600	30	5	630	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	2024-10-28 07:09:27	2024-10-28 07:17:37	0	0	10	0	60	0	0	0	2	0	0	0	\N	630	\N	\N	0	0	0	0	0	0	0	wallet	100
431	209	pacakge	BL-1730178892	72	162	2024-11-30	09:00:00	12:00:00	1	0		0	1000	55	5	1155	0	1	209	209	Mr	Talal	Alhammadi	fj-hamad@hotmail.com	+971	502283912	2024-10-29 05:17:48	2024-10-29 05:17:48	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	100	0	0	0	0	0	0	\N	0
432	199	pacakge	BL-1730275049	47	159	2024-11-01	03:00:00	04:00:00	0	0		0	20	151	5	3171	500	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	2024-10-30 07:57:58	2024-10-30 07:57:58	0	0	1	0	60	2500	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
433	211	pacakge	BL-1730294466	73	163	2024-11-01	09:00:00	12:00:00	1	0	The first time the government	0	1500	97	5	2037	140	0	211	211	Mr	anil	navsi	navisanil@gmail.com	971	4534546643	2024-10-30 13:21:28	2024-10-30 13:21:28	0	0	1	0	207	200	0	0	2	0	0	0	\N	0	\N	\N	100	0	0	0	0	0	0	\N	0
420	205	pacakge	BL-1729750586	71	160	2024-11-24	14:00:00	17:00:00	1	0		0	2000	78.4	5	1646.4	20	1	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	+92	3042721336	2024-10-24 06:16:45	2024-10-24 06:16:45	0	0	1	0	174	20	3	0	2	672	0	0	\N	0	\N	\N	200	0	0	0	0	0	0	\N	0
434	214	pacakge	BL-1730571102	42	130	2024-12-25	09:00:00	15:00:00	0	0		0	1500	75.5	5	1585.5	10	1	214	214	Ms	Tester	Raga	radhadxbapps@hotmail.com	971	586400540	2024-11-02 18:12:04	2024-11-02 18:12:04	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
435	232	yatch	BL-1730809699	72	0	2024-11-09	08:00:00	09:00:00	1	0		0	100	5	5	105	0	1	232	232	Mr	Anil	navis	anil@dxbusinessgroup.com	971	122425464	2024-11-05 12:28:22	2024-11-05 12:28:22	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
436	232	yatch	BL-1730809711	72	0	2024-11-09	08:00:00	09:00:00	1	0		0	100	5	5	105	0	1	232	232	Mr	Anil	navis	anil@dxbusinessgroup.com	971	122425464	2024-11-05 12:28:34	2024-11-05 12:28:34	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
437	232	yatch	BL-1730810410	28	0	2024-11-07	09:00:00	10:00:00	1	0		0	0	0	5	0	0	1	232	232	Mr	gah	Ben	anilnavis@gmail.com	+971	523243163	2024-11-05 12:40:11	2024-11-05 12:40:11	0	0	1	0	59	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
438	232	yatch	BL-1730810466	31	0	2024-11-07	08:00:00	09:00:00	1	0		0	100	5	5	105	0	0	232	232	Mr	Anil	navis	anil@dxbusinessgroup.com	971	122425464	2024-11-05 12:41:06	2024-11-05 12:41:06	0	0	1	0	68	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
439	199	yatch	BL-1730812516	47	0	2024-11-15	07:00:00	08:00:00	0	0		0	600	30	5	630	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	2024-11-05 13:15:18	2024-11-05 13:15:18	0	0	1	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
440	232	yatch	BL-1730812594	72	0	2024-11-10	08:00:00	10:00:00	1	0		0	200	10	5	210	0	0	232	232	Mr	Anil	navis	anil@dxbusinessgroup.com	971	122425464	2024-11-05 13:16:35	2024-11-05 13:16:35	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
441	199	yatch	BL-1730812832	47	0	2024-11-09	04:00:00	05:00:00	0	0		0	500	25	5	525	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	2024-11-05 13:20:55	2024-11-05 13:20:55	0	0	1	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
442	233	pacakge	BL-1730816936	73	163	2024-11-07	09:00:00	12:00:00	1	0		0	1500	97	5	2037	140	0	233	233	Mr	amil	navis	navisanil12@gmail.com	971	5485464028	2024-11-05 14:29:20	2024-11-05 14:30:24	0	0	10	0	207	200	0	0	2	0	0	0	\N	1018	\N	\N	100	0	0	0	0	0	0	wallet	50
443	233	pacakge	BL-1730817232	73	163	2024-11-07	09:00:00	11:00:00	1	0		0	1500	85	5	1785	0	0	233	233	Mr	amil	navis	navisanil12@gmail.com	971	5485464028	2024-11-05 14:34:14	2024-11-05 14:34:14	0	0	1	0	207	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
444	233	pacakge	BL-1730817338	73	163	2024-11-11	09:00:00	11:00:00	1	0		0	1500	75	5	1575	0	0	233	233	Mr	amil	navis	navisanil12@gmail.com	971	5485464028	2024-11-05 14:35:55	2024-11-05 14:37:16	0	0	10	0	207	0	0	0	2	0	0	0	\N	1575	\N	\N	0	0	0	0	0	0	0	wallet	100
446	221	yatch	BL-1730820560	72	0	2024-11-10	10:00:00	11:00:00	0	0		0	100	5	5	105	0	0	221	221	Mr	Test	Tes	ss@twt.com	971	505042124	2024-11-05 15:29:22	2024-11-05 15:29:22	0	0	1	0	91	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
447	233	pacakge	BL-1730821717	73	163	2024-11-07	11:00:00	14:00:00	1	0		0	1500	102	5	2142	140	0	233	233	Mr	amil	navis	navisanil12@gmail.com	971	5485464028	2024-11-05 15:48:39	2024-11-05 15:48:39	0	0	1	0	207	200	0	0	2	0	0	0	\N	0	\N	\N	200	0	0	0	0	0	0	\N	0
448	236	pacakge	BL-1730879599	73	163	2024-11-08	09:00:00	13:00:00	1	0		0	1500	90	5	1890	0	0	236	236	Mr	anil	navis	anil007@gmail.com	971	5464864664	2024-11-06 07:53:20	2024-11-06 07:53:20	0	0	1	0	207	200	0	0	2	0	0	0	\N	0	\N	\N	100	0	0	0	0	0	0	\N	0
445	221	yatch	BL-1730820033	47	0	2024-11-06	03:00:00	04:00:00	0	0		0	500	25	5	525	0	0	221	221	Mr	Test	Tes	ss@twt.com	971	505042124	2024-11-05 15:20:33	2024-11-05 15:20:33	0	0	1	0	60	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
449	199	pacakge	BL-1730894461	47	159	2024-11-08	03:00:00	04:00:00	0	0		0	20	159.75	5	3354.75	650	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	2024-11-06 12:01:02	2024-11-06 12:01:33	0	0	10	0	60	2525	0	0	2	0	0	0	\N	1677	\N	\N	0	0	0	0	0	0	0	wallet	50
450	238	yatch	BL-1730896791	74	0	2024-11-08	09:00:00	13:00:00	1	0		0	4500	225	5	4725	0	1	238	238	Mr	Anil	navis	anilnavis@gmail.com	+971	523243163	2024-11-06 12:40:12	2024-11-06 12:40:12	0	0	1	0	235	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
451	231	yatch	BL-1730902519	74	0	2024-11-08	13:00:00	14:00:00	0	0	The only way I could do that was if you had the right person	0	1500	75	5	1575	0	1	235	231	Mr	anil	navis	anilnavis@gmail.com	971	523243163	2024-11-06 14:15:19	2024-11-06 14:15:19	0	0	1	1	235	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
452	231	yatch	BL-1730903905	74	0	2024-11-08	14:00:00	15:00:00	0	0		0	1500	75	5	1575	0	1	235	231	Mr	anil	navis	anilnavis@gmail.com	971	523243163	2024-11-06 14:38:25	2024-11-06 14:38:25	0	0	1	1	235	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
453	238	pacakge	BL-1730905695	74	164	2024-11-08	15:00:00	17:00:00	1	0	The first time the two sides were able	0	1000	63	5	1323	60	1	238	238	Mr	Anil	navis	anilnavis@gmail.com	+971	523243163	2024-11-06 15:08:16	2024-11-06 15:08:16	0	0	1	0	235	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
454	231	pacakge	BL-1730909446	74	164	2024-11-08	17:00:00	19:00:00	0	0	The only way I could do that was if you wanted me too but you don’t want me	0	1000	60	5	1260	0	1	235	231	Mr	anil	navis	anilnavis@gmail.com	971	523243163	2024-11-06 16:10:46	2024-11-06 16:10:46	0	0	1	1	235	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
455	231	pacakge	BL-1730956007	74	164	2024-11-10	11:00:00	14:00:00	0	0	Gags	0	1130	69.5	5	1459.5	60	1	235	231	Mr	gh	bhh	anilnavis@gmail.com	971	523243163	2024-11-07 05:06:47	2024-11-07 05:06:47	0	0	1	1	235	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
456	231	pacakge	BL-1730960896	73	163	2024-11-09	09:00:00	12:00:00	0	0		0	1600	97	5	2037	140	1	207	231	Mr	anil	navis	anilnavis@gmail.com	971	523243163	2024-11-07 06:28:16	2024-11-07 06:28:16	0	0	1	1	207	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
457	231	pacakge	BL-1730960968	73	163	2024-11-09	09:00:00	12:00:00	0	0		0	1600	97	5	2037	140	1	207	231	Mr	anil	navis	anilnavis@gmail.com	971	523243163	2024-11-07 06:29:28	2024-11-07 06:29:28	0	0	1	1	207	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
458	231	pacakge	BL-1730961086	73	163	2024-11-09	09:00:00	12:00:00	0	0	Bajaj’s	0	1600	97	5	2037	140	1	207	231	Mr	anil	navis	anilnavis@gmail.com	971	523243163	2024-11-07 06:31:26	2024-11-07 06:31:26	0	0	1	1	207	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
459	231	pacakge	BL-1730961389	74	164	2024-11-22	10:00:00	15:00:00	0	0		0	1000	65	5	1365	100	1	235	231	Mr	Anil	Navis	anilnavis@gmail.com	971	523243163	2024-11-07 06:36:29	2024-11-07 06:36:29	0	0	1	1	235	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
460	231	pacakge	BL-1730961401	74	164	2024-11-22	10:00:00	15:00:00	0	0		0	1000	65	5	1365	100	0	235	231	Mr	Anil	Navis	anilnavis@gmail.com	971	523243163	2024-11-07 06:36:41	2024-11-07 06:36:41	0	0	1	1	235	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
461	199	pacakge	BL-1730961828	47	159	2024-11-09	05:00:00	06:00:00	0	0		0	20	159.75	5	3354.75	650	1	60	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-11-07 06:43:48	2024-11-07 06:43:48	0	0	1	1	60	2525	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
462	199	pacakge	BL-1730961854	47	159	2024-11-09	05:00:00	06:00:00	0	0		0	20	159.75	5	3354.75	650	1	60	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-11-07 06:44:14	2024-11-07 06:44:14	0	0	1	1	60	2525	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
463	199	pacakge	BL-1730961923	47	159	2024-11-09	05:00:00	06:00:00	0	0		0	20	159.75	5	3354.75	650	1	60	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-11-07 06:45:23	2024-11-07 06:45:23	0	0	1	1	60	2525	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
464	199	pacakge	BL-1730965026	47	159	2024-11-09	11:00:00	13:00:00	0	0		0	20	34.75	5	729.75	650	1	60	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-11-07 07:37:06	2024-11-07 07:37:06	0	0	1	1	60	25	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
465	231	pacakge	BL-1730965231	73	163	2024-11-09	12:00:00	15:00:00	0	0		0	1500	92	5	1932	140	1	207	231	Mr	anil	navis	anilnavis@gmail.com	971	523243163	2024-11-07 07:40:31	2024-11-07 07:40:31	0	0	1	1	207	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
466	231	pacakge	BL-1730965610	74	164	2024-11-09	09:00:00	12:00:00	0	0		0	1000	63	5	1323	60	1	235	231	Mr	ggghb	hh	anilnavis@gmail.com	971	523243163	2024-11-07 07:46:50	2024-11-07 07:46:50	0	0	1	1	235	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
467	199	pacakge	BL-1730989773	74	164	2024-11-09	12:00:00	16:00:00	0	0		0	1000	63	5	1323	60	1	235	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-11-07 14:29:33	2024-11-07 14:29:33	0	0	1	1	235	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
468	231	pacakge	BL-1730990313	74	164	2024-11-09	16:00:00	19:00:00	0	0		0	1000	63	5	1323	60	1	235	231	Mr	anil	navis	anilnavis@gmail.com	971	523243163	2024-11-07 14:38:33	2024-11-07 14:38:33	0	0	1	1	235	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
469	231	pacakge	BL-1730997867	74	164	2024-11-10	14:00:00	17:00:00	0	0		0	1000	63	5	1323	60	1	235	231	Mr	anil	navis	anilnavis@gmail.com	971	523243163	2024-11-07 16:44:27	2024-11-07 16:44:27	0	0	1	1	235	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
470	231	pacakge	BL-1730998683	74	164	2024-11-10	17:00:00	20:00:00	0	0		0	1000	63	5	1323	60	1	235	231	Mr	anil	navis	anilnavis@gmail.com	971	523243163	2024-11-07 16:58:03	2024-11-07 16:58:03	0	0	1	1	235	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
471	199	pacakge	BL-1730999497	74	164	2024-11-09	19:00:00	22:00:00	0	0		0	1000	69	5	1449	60	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	2024-11-07 17:11:40	2024-11-07 17:11:40	0	0	1	0	235	200	0	0	2	0	0	0	\N	0	\N	\N	120	0	0	0	0	0	0	\N	0
472	199	pacakge	BL-1731000721	74	164	2024-11-11	09:00:00	14:00:00	0	0		0	1000	63	5	1323	60	1	235	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-11-07 17:32:01	2024-11-07 17:32:01	0	0	1	1	235	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
473	199	pacakge	BL-1731001608	74	164	2024-11-11	14:00:00	17:00:00	0	0		0	1000	63	5	1323	60	1	235	199	Mr	Hamid	Roshan	razahamid34@gmail.com	92	3441562554	2024-11-07 17:46:48	2024-11-07 17:46:48	0	0	1	1	235	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
474	94	pacakge	BL-1731002103	47	2	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	235	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	92	3042721336	2024-11-07 17:55:03	2024-11-07 17:55:03	10	0	1	1	235	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
475	199	pacakge	BL-1731002197	74	164	2024-11-12	09:00:00	12:00:00	0	0		0	1000	63	5	1323	60	1	235	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-11-07 17:56:37	2024-11-07 17:56:37	0	0	1	1	235	200	0	0	2	0	0	0	\N	0	\N	\N	120	0	0	0	0	0	0	\N	0
476	94	pacakge	BL-1731002508	47	2	2024-08-05	08:00:00	23:00:00	4	0	hi	0	0	0	5	0	0	1	235	94	mr	sooraj	sabu	sooraj.a2solution@gmail.com	92	3042721336	2024-11-07 18:01:48	2024-11-07 18:01:48	10	0	1	1	235	0	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
477	199	pacakge	BL-1731002705	74	164	2024-11-13	09:00:00	12:00:00	0	0		0	1000	63	5	1423	60	1	235	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	2024-11-07 18:05:05	2024-11-07 18:05:05	0	0	1	1	235	200	0	0	2	0	0	0	\N	0	\N	\N	100	0	0	0	0	0	0	\N	0
478	243	pacakge	BL-1731006291	74	164	2024-11-16	09:00:00	12:00:00	1	0		0	1000	68	5	1428	60	1	243	243	Mr	Anil	navis	anilnavis@gmail.com	+971	523243163	2024-11-07 19:05:11	2024-11-07 19:05:11	0	0	1	0	235	200	0	0	2	0	0	0	\N	0	\N	\N	100	0	0	0	0	0	0	\N	0
479	231	pacakge	BL-1731006914	74	164	2024-11-16	12:00:00	15:00:00	0	0		0	1000	68.5	5	1438.5	60	1	235	231	Mr	anil	navis	anilnavis@gmail.com	971	523243163	2024-11-07 19:15:14	2024-11-07 19:15:14	0	0	1	1	235	200	0	0	2	0	0	0	\N	0	\N	\N	110	0	0	0	0	0	0	\N	0
480	231	pacakge	BL-1731058435	74	164	2024-11-12	19:00:00	21:00:00	1	0		0	1000	50.4	5	1058.4	60	1	231	231	Mr	anil	navis	anilnavis@gmail.com	971	5640050333	2024-11-08 09:33:56	2024-11-08 09:36:36	0	0	10	0	235	200	7	0	2	252	0	0	\N	1058	\N	\N	0	0	0	0	0	0	0	wallet	100
481	231	pacakge	BL-1731067766	74	164	2024-11-12	14:00:00	17:00:00	1	0		0	1000	55.6	5	1167.6	60	1	231	231	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	2024-11-08 12:09:48	2024-11-08 12:09:48	0	0	1	0	235	200	7	0	2	278	0	0	\N	0	\N	\N	130	0	0	0	0	0	0	\N	0
482	232	pacakge	BL-1731070909	74	164	2024-11-12	18:00:00	20:00:00	0	0		0	1000	50.4	5	1058.4	60	1	235	232	Mr	anil	navis	anil@dxbusinessgroup.com	971	523243163	2024-11-08 13:01:49	2024-11-08 13:01:49	0	0	1	1	235	200	7	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
483	232	pacakge	BL-1731083177	74	164	2024-11-13	19:00:00	22:00:00	0	0		0	1000	55.6	5	1167.6	60	1	235	232	Mr	anil	navis	anil@dxbusinessgroup.com	971	523243163	2024-11-08 16:26:17	2024-11-08 16:26:17	0	0	1	1	235	200	7	0	2	0	0	0	\N	0	\N	\N	130	0	0	0	0	0	0	\N	0
484	231	pacakge	BL-1731391252	74	164	2024-11-14	14:00:00	17:00:00	0	0	Sbsbjssks	0	1000	69.9	5	1467.9	60	1	235	231	Mr	anil	anilnavis@gmail.com	anilnavis@gmail.com	971	523243163	2024-11-12 06:00:52	2024-11-12 06:00:52	0	0	1	1	235	200	0	0	2	0	0	0	\N	0	\N	\N	138	0	0	0	0	0	0	\N	0
485	231	pacakge	BL-1731746548	74	164	2024-11-19	09:00:00	11:00:00	1	0		0	1000	63	5	1323	60	1	231	231	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	2024-11-16 08:42:46	2024-11-16 08:42:46	0	0	1	0	235	200	0	0	2	0	0	0	\N	0	\N	\N	0	0	0	0	0	0	0	\N	0
\.


--
-- Data for Name: bookings_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings_history (id, booking_id, reason, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
beljwar_cache_settings	a:1:{s:3:"tax";s:1:"5";}	1731989641
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
-- Data for Name: category_texts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category_texts (id, booking_id, category_id, description, created_at, updated_at) FROM stdin;
1	2	7	hi test	2024-08-08 11:01:44	2024-08-08 11:01:44
3	26	14	put hamid on cake	2024-08-15 18:43:23	2024-08-15 18:43:23
4	40	3	test	2024-08-16 20:44:14	2024-08-16 20:44:14
5	40	5	test	2024-08-16 20:44:14	2024-08-16 20:44:14
6	43	15	Happy birthday to you	2024-08-17 06:04:59	2024-08-17 06:04:59
7	44	3	Red flowers	2024-08-17 12:40:28	2024-08-17 12:40:28
8	44	5	Red cake	2024-08-17 12:40:28	2024-08-17 12:40:28
9	45	3	Red flowers	2024-08-17 12:47:04	2024-08-17 12:47:04
10	45	5	Happy Birthday	2024-08-17 12:47:04	2024-08-17 12:47:04
12	53	12	Abd	2024-08-17 22:36:10	2024-08-17 22:36:10
13	53	13	Ss	2024-08-17 22:36:10	2024-08-17 22:36:10
14	54	3	best flower	2024-08-17 23:31:35	2024-08-17 23:31:35
15	55	5	Okt	2024-08-17 23:53:53	2024-08-17 23:53:53
17	58	15	Ryyuii	2024-08-18 07:57:52	2024-08-18 07:57:52
18	59	15	Happy birthday	2024-08-18 08:12:47	2024-08-18 08:12:47
19	61	15	Have	2024-08-18 09:24:49	2024-08-18 09:24:49
20	68	15	asd	2024-08-18 10:05:51	2024-08-18 10:05:51
21	69	15	happy birthday anil	2024-08-18 10:39:42	2024-08-18 10:39:42
22	72	13	Bday	2024-08-19 06:28:14	2024-08-19 06:28:14
23	72	12	Hi test	2024-08-19 06:28:14	2024-08-19 06:28:14
24	73	14	Hamid raza	2024-08-19 07:12:57	2024-08-19 07:12:57
25	74	12	Hg	2024-08-19 07:18:34	2024-08-19 07:18:34
26	82	3	They	2024-08-19 09:20:52	2024-08-19 09:20:52
27	83	3	Happy birthday	2024-08-19 09:26:53	2024-08-19 09:26:53
28	84	15	Happy birthday	2024-08-19 10:10:41	2024-08-19 10:10:41
29	88	14	Hamid on cake	2024-08-19 10:47:49	2024-08-19 10:47:49
32	98	14	hi	2024-08-19 12:28:40	2024-08-19 12:28:40
35	111	14	HAMID	2024-08-19 13:19:18	2024-08-19 13:19:18
36	119	0	Happy Belated happy	2024-08-19 19:19:37	2024-08-19 19:19:37
37	120	3	clor is my flower	2024-08-19 19:56:18	2024-08-19 19:56:18
38	120	5	cake is red.	2024-08-19 19:56:18	2024-08-19 19:56:18
39	123	3	that is clor of flower	2024-08-19 21:14:33	2024-08-19 21:14:33
40	123	5	that is really food cake	2024-08-19 21:14:33	2024-08-19 21:14:33
41	124	15	happy birthday nanny	2024-08-19 23:13:17	2024-08-19 23:13:17
42	125	15	happy birthday  nany	2024-08-19 23:28:50	2024-08-19 23:28:50
43	126	15	Happy valentine	2024-08-20 02:07:05	2024-08-20 02:07:05
44	130	14	HAMID	2024-08-20 07:47:13	2024-08-20 07:47:13
45	134	15	Happy birthday papa	2024-08-20 09:48:05	2024-08-20 09:48:05
46	147	3	tezy	2024-08-20 20:06:29	2024-08-20 20:06:29
47	147	5	test	2024-08-20 20:06:29	2024-08-20 20:06:29
48	158	15	Happy birthday	2024-08-21 06:06:30	2024-08-21 06:06:30
49	162	15	Choi	2024-08-21 08:33:32	2024-08-21 08:33:32
50	164	15	Dfggg.	2024-08-21 08:42:12	2024-08-21 08:42:12
51	167	15	Edge	2024-08-21 09:06:21	2024-08-21 09:06:21
52	167	18	Face	2024-08-21 09:06:21	2024-08-21 09:06:21
53	168	18	Vavbs	2024-08-21 09:13:49	2024-08-21 09:13:49
54	169	18	Try	2024-08-21 09:17:28	2024-08-21 09:17:28
55	170	18	Ghhh	2024-08-21 09:22:16	2024-08-21 09:22:16
56	171	18	Haha	2024-08-21 09:36:31	2024-08-21 09:36:31
57	175	18	Ghhhj	2024-08-21 13:32:05	2024-08-21 13:32:05
58	181	15	Happy birthday	2024-08-23 06:38:32	2024-08-23 06:38:32
59	181	18	Ghhhj	2024-08-23 06:38:32	2024-08-23 06:38:32
60	182	15	tesr	2024-08-23 22:17:20	2024-08-23 22:17:20
61	183	15	And	2024-08-26 08:32:48	2024-08-26 08:32:48
62	184	15	Ben	2024-08-26 13:06:02	2024-08-26 13:06:02
63	185	15	Shabna	2024-08-26 13:25:51	2024-08-26 13:25:51
64	186	18	Hshs	2024-09-02 07:18:14	2024-09-02 07:18:14
65	187	15	test	2024-09-03 10:45:45	2024-09-03 10:45:45
66	187	18	Test	2024-09-03 10:45:45	2024-09-03 10:45:45
67	193	15	Bb	2024-09-03 12:40:27	2024-09-03 12:40:27
68	217	18	Ccvbbb	2024-09-13 08:59:17	2024-09-13 08:59:17
69	218	15	Birthday	2024-09-13 09:11:26	2024-09-13 09:11:26
70	289	15	Happy birthday	2024-10-09 02:24:57	2024-10-09 02:24:57
71	291	18	Chi	2024-10-09 04:12:22	2024-10-09 04:12:22
72	292	18	Hhjjj	2024-10-09 04:14:41	2024-10-09 04:14:41
73	296	37	Hi	2024-10-09 12:01:04	2024-10-09 12:01:04
74	296	38	Hello	2024-10-09 12:01:04	2024-10-09 12:01:04
75	298	37	gui	2024-10-09 12:19:58	2024-10-09 12:19:58
76	298	38	ggh	2024-10-09 12:19:58	2024-10-09 12:19:58
77	305	37	Happy birthday Anil	2024-10-09 21:20:18	2024-10-09 21:20:18
78	305	38	Happy birthday Anil	2024-10-09 21:20:18	2024-10-09 21:20:18
79	306	37	Congratulations	2024-10-09 21:31:22	2024-10-09 21:31:22
80	306	38	Congratulations	2024-10-09 21:31:22	2024-10-09 21:31:22
81	325	37	Nothing	2024-10-10 09:17:01	2024-10-10 09:17:01
82	325	38	Nothing	2024-10-10 09:17:01	2024-10-10 09:17:01
83	330	37	Try	2024-10-10 14:08:13	2024-10-10 14:08:13
84	330	38	Vvb	2024-10-10 14:08:13	2024-10-10 14:08:13
85	331	18	Happy married life	2024-10-11 03:37:43	2024-10-11 03:37:43
86	336	37	Chef	2024-10-17 11:42:27	2024-10-17 11:42:27
87	336	38	Ben	2024-10-17 11:42:27	2024-10-17 11:42:27
88	342	37	Guys	2024-10-18 17:24:40	2024-10-18 17:24:40
89	342	38	Here	2024-10-18 17:24:40	2024-10-18 17:24:40
90	359	37	The first time the two	2024-10-19 11:41:16	2024-10-19 11:41:16
91	359	38	The only way I could do that was if	2024-10-19 11:41:16	2024-10-19 11:41:16
92	361	37	The The Great Depression and	2024-10-19 12:03:27	2024-10-19 12:03:27
93	361	38	The only way I could do this would	2024-10-19 12:03:27	2024-10-19 12:03:27
94	365	37	The The The Big Lie and its lies have nothing in yyyyy	2024-10-20 09:37:47	2024-10-20 09:37:47
95	365	38	The only way I could do that was if	2024-10-20 09:37:47	2024-10-20 09:37:47
96	366	37	The The The Big Lie and its lies have nothing in yyyyy	2024-10-20 09:38:27	2024-10-20 09:38:27
97	366	38	The only way I could do that was if	2024-10-20 09:38:27	2024-10-20 09:38:27
98	370	37	The The The Big Lie and its lies have nothing in yyyyy	2024-10-20 10:19:44	2024-10-20 10:19:44
99	370	38	The only way I could do that was if	2024-10-20 10:19:44	2024-10-20 10:19:44
100	371	37	The The The Big Lie and its lies have nothing in yyyyy	2024-10-20 10:20:26	2024-10-20 10:20:26
101	371	38	The only way I could do that was if	2024-10-20 10:20:26	2024-10-20 10:20:26
102	372	37	The first time the two sides agreed to meet on a single day was	2024-10-20 10:26:49	2024-10-20 10:26:49
103	372	38	The only way I could do that was if	2024-10-20 10:26:50	2024-10-20 10:26:50
104	375	37	The first time the team had played	2024-10-20 12:02:29	2024-10-20 12:02:29
105	375	38	The only way I could	2024-10-20 12:02:29	2024-10-20 12:02:29
106	381	37	The only way I could do that was if	2024-10-21 05:02:18	2024-10-21 05:02:18
107	381	38	Type in your phone and then click the	2024-10-21 05:02:18	2024-10-21 05:02:18
108	387	37	Shah	2024-10-21 07:30:47	2024-10-21 07:30:47
109	387	38	Banana	2024-10-21 07:30:47	2024-10-21 07:30:47
110	388	37	Heheh	2024-10-21 11:18:50	2024-10-21 11:18:50
111	388	38	The first time the two sides	2024-10-21 11:18:50	2024-10-21 11:18:50
112	389	37	The only way I could	2024-10-21 12:24:31	2024-10-21 12:24:31
113	389	38	The first time the team	2024-10-21 12:24:31	2024-10-21 12:24:31
114	390	37	The only way I could do that was if you wanted	2024-10-21 13:25:01	2024-10-21 13:25:01
115	390	38	The only way I could do that was if you wanted me	2024-10-21 13:25:01	2024-10-21 13:25:01
116	391	37	The only way I could do that was if you wanted me	2024-10-21 14:58:11	2024-10-21 14:58:11
117	391	38	The only way I could do	2024-10-21 14:58:11	2024-10-21 14:58:11
118	398	37	The only way I could do uiiiiiy is	2024-10-22 13:32:51	2024-10-22 13:32:51
119	398	38	The first time the two sides agreed to meet on a single	2024-10-22 13:32:51	2024-10-22 13:32:51
120	410	37	The The Big Lie was the most important thing in my	2024-10-23 15:45:41	2024-10-23 15:45:41
121	410	38	The only way I could do that	2024-10-23 15:45:41	2024-10-23 15:45:41
122	411	37	Test cake	2024-10-23 23:43:57	2024-10-23 23:43:57
123	414	37	The first time the two	2024-10-24 04:01:59	2024-10-24 04:01:59
124	414	38	The only way I could do	2024-10-24 04:01:59	2024-10-24 04:01:59
125	416	37	The The Big Lie was the most important	2024-10-24 04:25:10	2024-10-24 04:25:10
126	416	38	The only way I could do that	2024-10-24 04:25:10	2024-10-24 04:25:10
127	420	37	The only way I could do that was by getting	2024-10-24 06:16:45	2024-10-24 06:16:45
128	420	38	The first YYYY	2024-10-24 06:16:45	2024-10-24 06:16:45
129	421	37	The only way I could do that was if you had the right person and the	2024-10-24 06:50:39	2024-10-24 06:50:39
130	421	38	The first time the two sides	2024-10-24 06:50:39	2024-10-24 06:50:39
131	427	42	The only way I could do that would	2024-10-24 13:08:54	2024-10-24 13:08:54
132	428	42	Hi	2024-10-24 13:14:31	2024-10-24 13:14:31
133	429	37	The first time the	2024-10-24 13:22:05	2024-10-24 13:22:05
134	429	38	The only way	2024-10-24 13:22:05	2024-10-24 13:22:05
135	433	42	The only way I could do	2024-10-30 13:21:28	2024-10-30 13:21:28
136	453	43	The The Big Lie of	2024-11-06 15:08:16	2024-11-06 15:08:16
137	454	43	The first time the team had played a match was when they won a match in which	2024-11-06 16:10:46	2024-11-06 16:10:46
138	456	42	Happy birthday	2024-11-07 06:28:17	2024-11-07 06:28:17
139	457	42	Happy birthday	2024-11-07 06:29:28	2024-11-07 06:29:28
140	458	42	Happy birthday	2024-11-07 06:31:26	2024-11-07 06:31:26
141	468	43	The The Big Lie was the most successful	2024-11-07 14:38:33	2024-11-07 14:38:33
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
-- Data for Name: coupon_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_categories (id, coupon_id, category_id, created_at, updated_at) FROM stdin;
1	2	3	\N	\N
3	10	1	\N	\N
4	3	3	\N	\N
5	4	3	\N	\N
6	7	1	\N	\N
\.


--
-- Data for Name: coupon_packages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_packages (id, coupon_id, package_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: coupon_yatches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_yatches (id, coupon_id, yatch_id, created_at, updated_at) FROM stdin;
3	2	71	2024-10-09 17:04:06	2024-10-09 17:04:06
7	1	47	2024-10-16 13:38:29	2024-10-16 13:38:29
10	5	71	2024-10-18 15:41:28	2024-10-18 15:41:28
11	6	71	2024-10-24 11:42:04	2024-10-24 11:42:04
12	4	47	2024-11-06 15:10:17	2024-11-06 15:10:17
\.


--
-- Data for Name: coupons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupons (id, coupon_title, coupon_code, coupon_description, coupon_start_date, coupon_end_date, amount_type, coupon_amount, minimum_amount, coupon_minimum_spend, coupon_maximum_spend, usage_per_coupon, usage_per_user, provider_id, coupon_status, created_at, updated_at, deleted_at, applied_to, yatch_id) FROM stdin;
1	ABCD	ABCD	sasd	2024-10-06	2024-10-17	0	10	0	101	1000	100	1221	60	1	2024-10-07 16:28:22	2024-10-16 13:38:29	\N	yatch	47
5	sea halwk	SEA20	\N	2024-10-18	2024-10-30	1	20	0	60	10000	3	4	174	1	2024-10-18 15:41:28	2024-10-18 15:41:28	\N	yatch	71
3	sea halwk	SEAH	xvxv	2024-10-16	2024-10-31	1	30	0	100234	2003254	100	990	174	1	2024-10-16 07:33:36	2024-10-22 17:24:43	\N	package	
6	SEAYatch	SEAY	zxcz	2024-10-24	2024-11-09	1	20	0	600	1000	30	30	174	1	2024-10-24 11:42:04	2024-10-24 11:42:04	\N	yatch	71
4	Hamid50	CODEFIXED20	\N	2024-10-15	2024-11-09	1	20	0	0	0	150	5	60	1	2024-10-16 16:02:28	2024-11-06 15:10:17	\N	yatch	47
7	Bithday 20	BB20	birthday package	2024-11-08	2024-11-30	1	20	0	1000	3000	20	20		1	2024-11-08 12:51:47	2024-11-08 15:56:22	\N	package	
\.


--
-- Data for Name: customer_user_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_user_details (id, user_id, date_of_birth, lattitude, longitude, location_name, gender, is_social, wallet_balance, created_at, updated_at, profile_picture) FROM stdin;
1	5	2024-04-10	234235	34365645	Al Safa St Downtown Dubai - Dubai United Arab Emirates	male	1	300.00	2024-04-18 02:32:54	2024-04-18 13:32:15	\N
2	6	1980-04-24	234235	34365645	Al Safa St Downtown Dubai - Dubai United Arab Emirates	male	0	0.00	2024-04-20 16:21:34	2024-04-20 16:21:34	\N
3	9	1994-05-18	25.2566932	55.36431779999999	Dubai International Airport (DXB) - Dubai - United Arab Emirates	male	0	0.00	2024-05-12 12:22:36	2024-05-12 12:22:36	\N
4	10	1992-05-13	25.2566932	55.36431779999999	Dubai International Airport (DXB) - Dubai - United Arab Emirates	female	1	0.00	2024-05-12 12:30:44	2024-05-12 12:31:13	\N
5	13	1993-05-11	25.2566932	55.36431779999999	Dubai International Airport (DXB) - Dubai - United Arab Emirates	male	0	0.00	2024-05-13 10:17:55	2024-05-13 10:17:55	\N
6	16	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-14 10:25:42	2024-05-14 10:25:42	\N
7	18	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-14 13:30:29	2024-05-14 13:30:29	\N
8	19	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-14 15:40:25	2024-05-14 15:40:25	\N
9	20	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-14 17:14:46	2024-05-14 17:14:46	\N
10	21	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-14 21:46:39	2024-05-14 21:46:39	\N
11	22	1995-10-07	34.3790386	73.4766761kotlin.Unit	9FGG+WQ, Muzaffarabad,	male	0	0.00	2024-05-14 23:37:56	2024-05-14 23:37:56	\N
12	23	1995-10-07	34.3790428	73.4767068kotlin.Unit	9FGG+WQ, Muzaffarabad,	male	0	0.00	2024-05-14 23:44:05	2024-05-14 23:44:05	\N
15	26	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-17 09:14:09	2024-05-17 09:14:09	\N
16	27	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-17 10:12:42	2024-05-17 10:12:42	\N
17	28	1997-08-25	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-25 17:58:36	2024-05-25 17:58:36	\N
19	30	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-27 10:52:13	2024-05-27 10:52:13	\N
20	31	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-27 16:58:58	2024-05-27 16:58:58	\N
21	32	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-27 20:21:09	2024-05-27 20:21:09	\N
25	37	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-28 12:02:43	2024-05-28 12:02:43	\N
27	39	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-05-29 14:12:23	2024-05-29 14:12:23	\N
28	40	1997-08-29	28.422357324216193	70.31694492717412	Shahi Road, Shahi Road, Rahimyar Khan, Punjab, Pakistan	male	0	0.00	2024-05-29 15:43:11	2024-05-29 15:43:11	\N
32	44	1999-06-30	22.503313473408067	88.36604654788971	Prince Anwar Shah Road, Prince Anwar Shah Road, Kolkata, WB, 700068, India	male	0	0.00	2024-05-31 15:52:18	2024-05-31 15:52:18	\N
33	57	1996-01-12	37.422001384419765	-122.0839998498559	1600 Amphitheatre Pkwy Building 43, Mountain View, CA 94043, USA,	male	0	0.00	2024-07-25 15:32:52	2024-07-25 15:32:52	\N
34	58	1996-01-12	32.23070700983255	74.48605746030807	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	male	0	0.00	2024-07-26 11:29:22	2024-07-26 11:29:22	\N
37	66	1988-08-10	37.42199818917919	-122.08399984985589	1600 Amphitheatre Pkwy Building 43, Mountain View, CA 94043, USA,	male	0	0.00	2024-08-09 10:38:33	2024-08-09 10:38:33	\N
38	67	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-08-09 14:26:38	2024-08-09 14:26:38	\N
39	70	2015-08-13	33.54602556116209	73.12762890011072	Corniche Road, Corniche Road, Rawalpindi, Punjab, Pakistan	male	0	0.00	2024-08-12 23:42:22	2024-08-12 23:42:22	\N
40	71	2024-08-13	33.53110113905063	73.11713945120573	Bahria Avenue, Bahria Avenue, Rawalpindi, Punjab, Pakistan	male	0	0.00	2024-08-12 23:49:23	2024-08-12 23:49:23	\N
41	72	2024-08-13	33.537560274615906	73.13055619597435	Rawalpindi, Rawalpindi, Punjab, Pakistan	male	0	0.00	2024-08-12 23:52:28	2024-08-12 23:52:28	\N
42	73	2024-08-13	33.55533354078146	73.12849525362253	Ficus Road, Ficus Road, Rawalpindi, Punjab, Pakistan	male	0	0.00	2024-08-12 23:57:23	2024-08-12 23:57:23	\N
44	77	2024-08-16	25.283104458679613	55.33972296863794	Abu Hail Street 203/1, Abu Hail Street, Dubai, Dubai, United Arab Emirates	male	0	0.00	2024-08-16 06:37:34	2024-08-16 06:37:34	\N
45	78	2016-08-17	33.51595666594071	73.1108359247446	Rawalpindi, Rawalpindi, Punjab, Pakistan	male	0	0.00	2024-08-17 22:08:47	2024-08-17 22:08:47	\N
46	82	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-08-19 16:27:57	2024-08-19 16:27:57	\N
47	83	2024-08-17	33.634645067807256	73.05782776325941	J3M5+R66, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	male	0	0.00	2024-08-19 16:29:57	2024-08-19 16:29:57	\N
48	84	2024-08-20	25.313194765214654	55.36641027778388	Al Khan, Sharjah, Sharjah, United Arab Emirates	male	0	0.00	2024-08-20 06:37:54	2024-08-20 06:37:54	\N
49	85	2024-08-18	33.63466321231916	73.05781904608011	J3M5+R66, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	male	0	0.00	2024-08-20 16:15:59	2024-08-20 16:15:59	\N
50	87	2024-08-18	33.63464674268544	73.05782943964005	J3M5+R66, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	male	0	0.00	2024-08-20 16:25:06	2024-08-20 16:25:06	\N
51	88	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-08-20 16:50:14	2024-08-20 16:50:14	\N
52	90	2024-08-18	33.63466125829498	73.05781904608011	J3M5+R66, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	male	0	0.00	2024-08-20 17:45:50	2024-08-20 17:45:50	\N
53	92	2002-08-21	25.287612963479326	55.36774970591068	Baghdad Street, Baghdad Street, Dubai, Dubai, United Arab Emirates	male	0	0.00	2024-08-21 11:31:11	2024-08-21 11:31:11	\N
54	93	2011-08-21	25.192768745252117	55.26552267372609	Business Bay, Al Mustaqbal Street, Dubai, Dubai, United Arab Emirates	male	0	0.00	2024-08-21 13:34:36	2024-08-21 13:34:36	\N
55	94	1994-04-21	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	1	0.00	2024-08-21 14:23:50	2024-08-21 14:23:50	\N
56	95	2024-08-21	33.605146529951924	72.99786027520895	Rawalpindi, Rawalpindi, Punjab, Pakistan	male	1	0.00	2024-08-21 15:13:24	2024-08-21 15:13:24	\N
57	96	2024-08-20	33.63464897585629	73.05782876908779	J3M5+R27, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	male	1	0.00	2024-08-21 15:19:58	2024-08-21 15:19:58	\N
61	103	2003-08-26	25.390117651432156	55.46436991542578	133 Street 6a, 133 Street, Ajman, Ajman, United Arab Emirates	male	0	0.00	2024-08-26 21:57:27	2024-08-26 21:57:27	\N
62	104	2021-08-28	25.340647149690504	55.41078709065914	Sheikh Saqr Bin Khalid Al Qasimi St 194, Sheikh Saqr Bin Khalid Al Qasimi St, Sharjah, Sharjah, United Arab Emirates	male	0	0.00	2024-08-28 13:31:15	2024-08-28 13:31:15	\N
63	107	2021-08-28	25.317599712200106	55.394022949039936	5 Street 45, 5 Street, Dubai, Dubai, United Arab Emirates	male	0	0.00	2024-08-28 14:17:16	2024-08-28 14:17:16	\N
64	108	2021-08-30	25.21964871587669	55.273078791797154	Business Bay, Al Mustaqbal Street, Dubai, Dubai, United Arab Emirates	male	0	0.00	2024-08-30 09:44:07	2024-08-30 09:44:07	\N
65	109	2012-09-02	25.193937681755056	55.266291461884975	Business Bay, Al Mustaqbal Street, Dubai, Dubai, United Arab Emirates	male	0	0.00	2024-09-02 11:12:31	2024-09-02 11:12:31	\N
66	112	2024-09-02	24.301029738977974	54.49728101491928	مصفان الجنوبية, أبو ظبي, أبوظبي, الإمارات العربية المتحدة	female	0	0.00	2024-09-02 16:27:06	2024-09-02 16:27:06	\N
67	114	2024-08-05	25.286983322897402	55.371402874588966	11 8A St - Al Nahda - Al Nahda 2 - Dubai - United Arab Emirates,	female	1	0.00	2024-09-02 21:32:53	2024-09-02 21:32:53	\N
68	122	2015-09-03	33.553578871087495	73.15694779157639	Street 05, Street 05, Islamabad, Islamabad, Pakistan	male	0	0.00	2024-09-03 15:57:15	2024-09-03 15:57:15	\N
69	125	2024-09-09	32.230152261941804	74.4861027225852	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	male	0	0.00	2024-09-10 15:07:15	2024-09-10 15:07:15	\N
70	126	2024-09-10	33.51592563805389	73.10922056436539	Rawalpindi, Rawalpindi, Punjab, Pakistan	male	0	0.00	2024-09-10 20:34:11	2024-09-10 20:34:11	\N
71	132	2024-08-13	25.18426881667659	55.26002246886492	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	male	0	0.00	2024-09-11 15:52:43	2024-09-11 15:52:43	\N
72	134	1993-09-11	25.184195088973734	55.26029538363218	Business Bay, Al Mustaqbal Street, Dubai, Dubai, United Arab Emirates	female	0	0.00	2024-09-11 16:58:14	2024-09-11 16:58:14	\N
73	135	1990-09-01	25.184269726894854	55.26002448052168	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	male	0	0.00	2024-09-11 17:01:53	2024-09-11 17:01:53	\N
74	136	1995-06-15	12.961163732838424	80.25080859661102	3/921, Karunanidhi Road, Karunanidhi Road, Chennai, TN, 600041, India	male	0	0.00	2024-09-13 07:03:19	2024-09-13 07:03:19	\N
75	137	1993-09-08	25.10009981839715	55.23808132857084	463R+52 - Dubai - United Arab Emirates,	male	0	0.00	2024-09-13 16:18:10	2024-09-13 16:18:10	\N
76	139	2024-09-18	25.287158543377988	55.37125702947378	5 Street 45, 5 Street, Dubai, Dubai, United Arab Emirates	male	0	0.00	2024-09-18 23:17:21	2024-09-18 23:17:21	\N
78	145	2024-09-22	33.51644612239458	73.11077289283276	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	male	0	0.00	2024-09-23 20:40:32	2024-09-23 20:40:32	\N
79	147	2010-09-24	33.656098422039186	73.02347537130117	International Islamic University, Islamabad, Punjab, Pakistan	male	0	0.00	2024-09-24 13:38:22	2024-09-24 14:21:57	66f292c4edafa_1727173316.jpg
96	181	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-10-09 09:44:20	2024-10-09 09:44:20	\N
97	182	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-10-09 09:46:54	2024-10-09 09:46:54	\N
77	143	1999-07-01	25.281823602885833	55.368821918964386	6 Street, 6 Street, Dubai, Dubai, United Arab Emirates	female	1	0.00	2024-09-20 13:21:18	2024-10-01 10:00:59	66fb8f1406cf5_1727762196.jpg
98	183	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-10-09 09:49:34	2024-10-09 09:49:34	\N
80	155	2023-06-12	30.375321144564545	69.34511605650187	3, G Sdk, Loralai, Balochistan 68300, Pakistan,	female	0	0.00	2024-10-01 11:58:42	2024-10-01 12:21:35	66fbb10fc7868_1727770895.jpg
81	156	1995-09-01	25.18425273615262	55.26004794985056	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	female	0	0.00	2024-10-01 12:50:11	2024-10-01 12:50:11	\N
82	157	1995-10-01	25.184226643222377	55.26025615632535	Business Bay, Al Mustaqbal Street, Dubai, Dubai, United Arab Emirates	female	0	0.00	2024-10-01 12:53:52	2024-10-01 12:53:52	\N
87	166	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-10-03 15:29:12	2024-10-03 15:29:12	\N
88	168	1996-10-04	32.22889669273264	74.48322873562574	6FFH+R48, Zafer Wall Road, near Tariq General Store, Sialkot, Punjab, Pakistan,	male	1	0.00	2024-10-07 12:08:46	2024-10-07 12:08:46	\N
89	169	1996-10-02	32.23067411076785	74.48614329099655	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	male	0	0.00	2024-10-08 09:39:38	2024-10-08 09:39:38	\N
92	175	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-10-09 08:34:10	2024-10-09 08:34:10	\N
93	178	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-10-09 08:38:38	2024-10-09 08:38:38	\N
94	179	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-10-09 09:29:18	2024-10-09 09:29:18	\N
95	180	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-10-09 09:34:38	2024-10-09 09:34:38	\N
99	184	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-10-09 09:50:59	2024-10-09 09:50:59	\N
100	185	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-10-09 09:52:09	2024-10-09 09:52:09	\N
101	186	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-10-09 09:53:15	2024-10-09 09:53:15	\N
102	187	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-10-09 09:55:40	2024-10-09 09:55:40	\N
103	188	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-10-09 09:57:38	2024-10-09 09:57:38	\N
104	189	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-10-09 09:59:12	2024-10-09 09:59:12	\N
105	190	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-10-09 10:01:06	2024-10-09 10:01:06	\N
106	191	1981-10-09	24.306539644611547	54.21612784266471	Bu Kesheishah Island, Abu Dhabi, Abu Dhabi, United Arab Emirates	male	0	0.00	2024-10-09 19:49:05	2024-10-09 19:49:05	\N
107	193	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-10-10 08:12:46	2024-10-10 08:12:46	\N
108	198	2024-10-10	33.60513061315985	72.9977623745799	Rawalpindi, Rawalpindi, Punjab, Pakistan	male	1	0.00	2024-10-10 10:24:39	2024-10-10 10:24:39	\N
109	199	1996-10-26	32.230710129570824	74.48607858270407	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	male	1	0.00	2024-10-10 14:30:30	2024-10-10 14:30:30	\N
111	203	2024-10-07	25.224460759760177	55.22872343659401	Dubai - United Arab Emirates,	male	1	0.00	2024-10-19 12:16:10	2024-10-19 12:16:10	\N
113	206	2024-10-24	25.28670897198249	55.37151284515858	5 Street 46, 5 Street, Dubai, Dubai, United Arab Emirates	male	0	0.00	2024-10-24 04:41:55	2024-10-24 04:41:55	\N
114	208	2004-10-24	25.253656516353928	55.2822633460164	Al Mina Street 76/2, Al Mina Street, Dubai, Dubai, United Arab Emirates	male	0	0.00	2024-10-24 13:08:44	2024-10-24 13:08:44	\N
115	209	1997-07-30	24.310057462185824	54.573276713490486	Al Azminah Street, Al Azminah Street, Abu Dhabi, Abu Dhabi, United Arab Emirates	female	1	0.00	2024-10-29 09:07:46	2024-10-29 09:07:46	\N
116	210	2009-10-29	25.184128036168225	55.260299406945705	Business Bay, Al Mustaqbal Street, Dubai, Dubai, United Arab Emirates	female	0	0.00	2024-10-29 09:12:22	2024-10-29 09:12:22	\N
120	214	2024-11-01	25.167662876790992	55.413699969649315	China C3 - Dubai International City - China Cluster - Dubai - United Arab Emirates,	female	0	0.00	2024-11-02 22:10:33	2024-11-02 22:10:33	\N
121	215	1993-04-06	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	male	0	0.00	2024-11-04 11:48:06	2024-11-04 11:48:06	\N
122	221	2024-10-08	9.856548959273624	76.65108997374773	VM42+V4, Panakyachal, Kerala 685583, India,	male	0	0.00	2024-11-04 15:42:16	2024-11-04 15:42:16	\N
127	232	2024-11-05	25.23342706263532	55.26700526475907	13b Street 10, 13b Street, Dubai, Dubai, United Arab Emirates	male	0	0.00	2024-11-05 14:39:01	2024-11-05 14:39:01	\N
128	233	2003-11-05	25.25771097833064	55.2835276722908	Jumeira Street, Jumeira Street, Dubai, Dubai, United Arab Emirates	male	0	0.00	2024-11-05 17:40:37	2024-11-05 17:40:37	\N
129	236	2024-11-06	25.24235115749457	55.29146533459425	Sheikh Rashid Road, Sheikh Rashid Road, Dubai, Dubai, United Arab Emirates	male	0	0.00	2024-11-06 11:49:44	2024-11-06 11:49:44	\N
130	237	2024-11-04	24.87099962973205	67.01996572315693	V2C9+7XX, Garden Rd, Saddar Police Head Quarters, Karachi, Karachi City, Sindh, Pakistan,	male	1	0.00	2024-11-06 12:58:16	2024-11-06 12:58:16	\N
133	243	2021-11-07	25.216318239345878	55.256670378148556	26c Street 88, 26c Street, Dubai, Dubai, United Arab Emirates	male	1	0.00	2024-11-07 17:48:42	2024-11-07 17:48:42	\N
126	231	1990-11-05	25.224513838287667	55.26445616036653	Al Wasl Road 278, Al Wasl Road, Dubai, Dubai, United Arab Emirates	male	1	0.00	2024-11-05 12:37:08	2024-11-08 14:01:46	672de18ac1127_1731060106.jpg
134	244	1997-11-12	24.51471308575848	54.38234735280275	Al Saqlah St 48, Al Saqlah St, Abu Dhabi, Abu Dhabi, United Arab Emirates	female	1	0.00	2024-11-12 10:44:39	2024-11-12 10:44:39	\N
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
-- Data for Name: faq; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faq (id, title, description, created_by, updated_by, active, created_at, updated_at) FROM stdin;
1	What is beljwar	What is beljwar	1	1	1	2024-08-19 07:44:20	2024-08-19 07:44:20
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
-- Data for Name: help; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.help (id, title, description, created_by, updated_by, active, created_at, updated_at) FROM stdin;
1	asfadsf	abc	60	0	0	2024-10-05 08:40:21	2024-10-05 08:40:21
2	asfadsf	abc	60	0	0	2024-10-05 09:02:19	2024-10-05 09:02:19
3	hello	Hi	168	0	0	2024-10-07 08:14:33	2024-10-07 08:14:33
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
60	2024_07_16_092738_create_yach_time_schedules_table	29
61	2024_07_16_115752_create_yatch_normal_rates_table	29
62	2024_07_17_084054_create_special_day_rates_table	29
63	2024_07_17_093231_create_today_rates_table	29
64	2024_07_17_100754_alter_add_toogle_fileds_to_yatches	29
65	2024_07_17_130603_alter_add_is_dreaft_to_vendor_packages	29
66	2024_07_17_142303_alter_add_file_type_to_package_media	29
67	2024_08_05_121833_alter_add_description_to_products	30
68	2024_08_06_094254_alter_add_duration_to_vendor_packages	31
69	2024_08_06_100002_alter_add_fields_to_yatches	31
70	2024_08_06_180042_create_bookings_table	32
71	2024_08_07_090656_alter_add_oofer_type_to_yacht_offers	32
72	2024_08_07_094016_alter_add_discount_fields_to_bookings	32
73	2024_08_07_130930_alter_add_fileds_to_bookings	33
74	2024_08_07_170129_alter_add_price_extra_fields_to_bookings	34
75	2024_08_07_170437_create_category_texts_table	34
76	2024_08_07_170601_create_booking_addons_table	34
77	2024_08_07_170613_create_booking_products_table	34
78	2024_08_08_081847_create_modify_requests_table	35
79	2024_08_08_112818_alter_add_fild_to_yatches	36
80	2024_08_08_115747_alter_add_published_key_to_vendor_packages	37
81	2024_08_08_142702_create_wish_lists_table	38
82	2024_08_13_154347_create_coupons_table	39
83	2024_08_13_154403_create_coupon_packages_table	39
84	2024_08_13_154414_create_coupon_categories_table	39
85	2024_08_13_154424_create_coupon_yatches_table	39
86	2024_08_14_082757_alter_add_applied_to_to_coupons	40
87	2024_08_14_085030_alter_add_coupon_fileds_to_bookings	40
88	2024_08_14_095523_create_temp_bookings_table	40
89	2024_08_14_095540_create_temp_booking_addons_table	40
90	2024_08_14_095548_create_temp_booking_products_table	40
91	2024_08_14_100710_create_temp_category_texts_table	40
92	2024_08_14_102247_alter-add_wallet_amount_to_users	40
93	2024_08_14_102421_alter_add_payment_type_to_bookings	40
94	2024_08_14_113932_create_wallet_histories_table	40
95	2024_08_14_143033_alter_add_review_to_bookings	41
96	2024_08_14_143149_alter-add_review_fields_to_vendor_packages	41
97	2024_08_14_143206_alter-add_review_fields_to_yatches	41
98	2024_08_16_131256_alter_add_user_device_token_to_users	42
99	2024_08_17_161910_create_table_faq	43
100	2024_08_17_171236_alter_add_fields_to_users	43
101	2024_08_17_185303_alter_add_emirates_id_to_users	44
102	2024_08_21_141449_alter_add_is_social_to_users	45
103	2024_09_24_065147_add_profile_picture_column_to_vendor_user_details_table	46
104	2024_09_24_070638_add_profile_picture_column_to_customer_user_details_table	46
105	2024_09_27_100907_create_wallets_table	47
106	add_refund_column_to_booking_table	47
107	2024_09_29_082451_create_wallet_payment_report_table	48
108	2024_09_29_092516_alter_wallet_histories_table_add_pay_method	48
109	2024_09_29_092516_alter_wallet_histories_table_add_wallet_amount	49
110	2024_09_29_092516_alter_wallet_histories_table_add_pay_type	50
111	2024_09_29_092516_alter_wallet_histories_table_add_is_earning	51
112	2024_10_04_142039_alter_provider_id_column_in_coupons_table	52
113	2024_09_19_132546_create_help_table	53
114	2024_10_05_145127_add_reschedule_and_cancel_reasons_to_bookings_table	54
115	2024_10_05_155021_create_bookings_history_table	54
116	2024_09_29_082451_create_social_details_table	55
117	2024_10_06_162824_add_yatch_id_to_coupons_table	56
118	2024_08_07_130930_alter_add_package_extra_hours_bookings	57
119	2024_08_07_130930_alter_add_package_extra_hours_temp_bookings	58
120	2024_10_19_125553_alter_add_fields_to_bookings	59
122	2024_10_19_145012_alter_add_new_fileds_to_bookings	60
123	2024_10_22_100007_alter-add_reschedule_filds_to_bookings	61
124	2024_10_23_091525_alter-add_fileds_to_bookings	62
\.


--
-- Data for Name: modify_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modify_requests (id, booking_id, request_title, remark, created_at, updated_at) FROM stdin;
3	140	Full refund	Gdhhrjr	2024-08-21 08:45:41	2024-08-21 08:45:41
6	242	Offer bundle	NOTHING	2024-09-26 08:56:15	2024-09-26 08:56:15
7	301	Some other time	Need	2024-10-09 12:41:44	2024-10-09 12:41:44
8	301	Offer discount	Chunk	2024-10-09 12:45:58	2024-10-09 12:45:58
9	285	Full refund	No yime	2024-10-09 18:24:46	2024-10-09 18:24:46
15	330	Full refund	Bedi’s	2024-10-15 04:22:17	2024-10-15 04:22:17
16	303	Some other date	Testing	2024-10-15 06:00:49	2024-10-15 06:00:49
17	326	Full refund	Hihjjj	2024-10-15 06:22:32	2024-10-15 06:22:32
18	325	Same no.of hours, but a later return time	Hi	2024-10-15 07:07:44	2024-10-15 07:07:44
19	324	Some other date	Abc	2024-10-15 07:10:23	2024-10-15 07:10:23
20	306	Same return time, but less total hours	Test	2024-10-15 07:12:35	2024-10-15 07:12:35
21	305	Same no.of hours, but a later return time	Tes	2024-10-15 07:13:14	2024-10-15 07:13:14
22	302	Same return time, but less total hours	Hhi	2024-10-15 07:24:32	2024-10-15 07:24:32
23	298	Full refund	Client need full refund	2024-10-15 07:48:49	2024-10-15 07:48:49
24	300	Same no.of hours, but a later return time	Hi	2024-10-15 09:40:54	2024-10-15 09:40:54
27	351	Same no.of hours, but a later return time	Test	2024-10-19 10:03:20	2024-10-19 10:03:20
31	355	Same return time, but less total hours	Test	2024-10-19 13:43:16	2024-10-19 13:43:16
32	349	Same return time, but less total hours	Aad	2024-10-19 15:03:35	2024-10-19 15:03:35
34	387	Some other date	Change to dec	2024-10-21 09:58:55	2024-10-21 09:58:55
35	389	Some other time	Some other time	2024-10-21 12:40:03	2024-10-21 12:40:03
39	392	Some other date	Test	2024-10-22 05:31:26	2024-10-22 05:31:26
40	394	Some other date	Dcy	2024-10-22 08:54:48	2024-10-22 08:54:48
41	395	Some other date	Fvff	2024-10-22 11:36:28	2024-10-22 11:36:28
43	356	Same return time, but less total hours	Less hours	2024-10-23 06:21:46	2024-10-23 06:21:46
44	403	Same return time, but less total hours	Test refound	2024-10-23 06:25:54	2024-10-23 06:25:54
46	405	Some other date	Date changr	2024-10-23 07:16:56	2024-10-23 07:16:56
\.


--
-- Data for Name: package_media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.package_media (id, filename, vendor_package_id, created_at, updated_at, file_type) FROM stdin;
7	6641bce247c24_1715584226.jpg	2	2024-05-13 11:10:26	2024-05-13 11:10:26	image
8	6641bce248f69_1715584226.jpeg	2	2024-05-13 11:10:26	2024-05-13 11:10:26	image
9	6641bce249065_1715584226.jpg	2	2024-05-13 11:10:26	2024-05-13 11:10:26	image
10	6641bce249187_1715584226.mp4	2	2024-05-13 11:10:26	2024-05-13 11:10:26	image
11	66434091c4131_1715683473.jpg	3	2024-05-14 14:44:33	2024-05-14 14:44:33	image
12	66434091cb4a6_1715683473.jpg	3	2024-05-14 14:44:33	2024-05-14 14:44:33	image
13	66434091cb58f_1715683473.jpg	3	2024-05-14 14:44:33	2024-05-14 14:44:33	image
14	66434091cb725_1715683473.jpg	3	2024-05-14 14:44:33	2024-05-14 14:44:33	image
15	66434091cc2ad_1715683473.jpg	3	2024-05-14 14:44:33	2024-05-14 14:44:33	image
17	6643a2ce2888a_1715708622.mp4	3	2024-05-14 21:43:42	2024-05-14 21:43:42	image
20	172182159766a0e99ded630.mp4	5	2024-07-24 11:46:38	2024-07-24 11:46:38	video
22	172184879166a153d7b71e8.mp4	13	2024-07-24 19:19:51	2024-07-24 19:19:51	video
24	172184900266a154aa17731.jpg	13	2024-07-24 19:23:22	2024-07-24 19:23:22	image
25	172189302866a200a4cab8e.jpg	14	2024-07-25 07:37:08	2024-07-25 07:37:08	image
26	172189302866a200a4d9a1b.mp4	14	2024-07-25 07:37:08	2024-07-25 07:37:08	video
27	172189309566a200e7b01b7.jpg	15	2024-07-25 07:38:15	2024-07-25 07:38:15	image
28	172189309566a200e7b3e38.mp4	15	2024-07-25 07:38:15	2024-07-25 07:38:15	video
29	172227621666a7d97877ba4.jpg	26	2024-07-29 18:03:36	2024-07-29 18:03:36	image
30	172227649266a7da8c01e4e.png	26	2024-07-29 18:08:12	2024-07-29 18:08:12	image
31	172227738966a7de0dba77e.jpg	27	2024-07-29 18:23:09	2024-07-29 18:23:09	image
32	172227822766a7e153d947c.jpg	28	2024-07-29 18:37:07	2024-07-29 18:37:07	image
33	172227874766a7e35bbd013.jpg	29	2024-07-29 18:45:47	2024-07-29 18:45:47	image
34	172227889566a7e3ef624c0.png	29	2024-07-29 18:48:15	2024-07-29 18:48:15	image
35	172227897666a7e4405c7ab.png	29	2024-07-29 18:49:36	2024-07-29 18:49:36	image
36	172228067966a7eae75ec50.jpg	30	2024-07-29 19:17:59	2024-07-29 19:17:59	image
37	172228795066a8074e56b1e.jpg	31	2024-07-29 21:19:10	2024-07-29 21:19:10	image
38	172228795066a8074e58054.mp4	31	2024-07-29 21:19:10	2024-07-29 21:19:10	video
39	172228962166a80dd592c8a.jpg	32	2024-07-29 21:47:01	2024-07-29 21:47:01	image
40	172228962166a80dd59b039.mp4	32	2024-07-29 21:47:01	2024-07-29 21:47:01	video
41	172228979666a80e8497a6f.jpg	33	2024-07-29 21:49:56	2024-07-29 21:49:56	image
42	172229172566a8160df2374.jpg	34	2024-07-29 22:22:06	2024-07-29 22:22:06	image
43	172229197966a8170ba3778.jpg	35	2024-07-29 22:26:19	2024-07-29 22:26:19	image
44	172229256866a81958abeb3.jpg	36	2024-07-29 22:36:08	2024-07-29 22:36:08	image
45	172236161566a9270fadbfd.jpg	37	2024-07-30 17:46:55	2024-07-30 17:46:55	image
46	172236844566a941bd1fc2b.jpg	41	2024-07-30 19:40:45	2024-07-30 19:40:45	image
47	172236857066a9423aec3f8.jpg	42	2024-07-30 19:42:50	2024-07-30 19:42:50	image
48	172236861366a942654d603.jpg	42	2024-07-30 19:43:33	2024-07-30 19:43:33	image
49	172236925766a944e949bfc.jpg	44	2024-07-30 19:54:17	2024-07-30 19:54:17	image
50	172236968266a94692003ee.jpg	45	2024-07-30 20:01:22	2024-07-30 20:01:22	image
51	172237008566a948258b942.jpg	48	2024-07-30 20:08:05	2024-07-30 20:08:05	image
52	172237029266a948f47e7bf.jpg	49	2024-07-30 20:11:32	2024-07-30 20:11:32	image
53	172237130366a94ce733cc6.jpg	50	2024-07-30 20:28:23	2024-07-30 20:28:23	image
54	172237145066a94d7a2cf59.jpg	51	2024-07-30 20:30:50	2024-07-30 20:30:50	image
55	172237213866a9502a67190.jpg	52	2024-07-30 20:42:18	2024-07-30 20:42:18	image
56	172237351266a95588c1b30.jpg	53	2024-07-30 21:05:12	2024-07-30 21:05:12	image
57	172292546766b1c19bda0c9.png	54	2024-08-06 06:24:27	2024-08-06 06:24:27	image
58	172292546766b1c19be10dd.png	54	2024-08-06 06:24:27	2024-08-06 06:24:27	image
59	172292546766b1c19be12a8.mp4	54	2024-08-06 06:24:27	2024-08-06 06:24:27	video
60	172292589866b1c34ab70a2.png	54	2024-08-06 06:31:38	2024-08-06 06:31:38	image
61	172292589866b1c34ab84d0.png	54	2024-08-06 06:31:38	2024-08-06 06:31:38	image
62	172292589866b1c34ab865d.mp4	54	2024-08-06 06:31:38	2024-08-06 06:31:38	video
63	172292615966b1c44f2e48a.png	54	2024-08-06 06:35:59	2024-08-06 06:35:59	image
64	172292615966b1c44f2fa66.mp4	54	2024-08-06 06:35:59	2024-08-06 06:35:59	video
65	172292637966b1c52bcf673.png	54	2024-08-06 06:39:39	2024-08-06 06:39:39	image
66	172292637966b1c52bd4ebe.png	54	2024-08-06 06:39:39	2024-08-06 06:39:39	image
67	172292637966b1c52bd506d.mp4	54	2024-08-06 06:39:39	2024-08-06 06:39:39	video
68	172296654866b262146125a.jpg	55	2024-08-06 17:49:08	2024-08-06 17:49:08	image
69	172296654866b2621467602.mp4	55	2024-08-06 17:49:08	2024-08-06 17:49:08	video
70	172301933066b330429dacb.jpg	56	2024-08-07 08:28:50	2024-08-07 08:28:50	image
71	172301933066b33042a0e99.mp4	56	2024-08-07 08:28:50	2024-08-07 08:28:50	video
73	172304472666b393766887b.mp4	59	2024-08-07 15:32:06	2024-08-07 15:32:06	video
74	172304728166b39d71848fb.mp4	62	2024-08-07 16:14:41	2024-08-07 16:14:41	video
75	172304782566b39f915c7de.jpg	63	2024-08-07 16:23:45	2024-08-07 16:23:45	image
77	172304784666b39fa60e618.mp4	63	2024-08-07 16:24:06	2024-08-07 16:24:06	video
78	172304846766b3a21310c1f.jpg	64	2024-08-07 16:34:27	2024-08-07 16:34:27	image
79	172304846766b3a2131401b.mp4	64	2024-08-07 16:34:27	2024-08-07 16:34:27	video
80	172305026566b3a9194feef.jpg	65	2024-08-07 17:04:25	2024-08-07 17:04:25	image
81	172305026566b3a91956bbc.mp4	65	2024-08-07 17:04:25	2024-08-07 17:04:25	video
82	172305050266b3aa0614d21.jpg	66	2024-08-07 17:08:22	2024-08-07 17:08:22	image
83	172305050266b3aa061821f.mp4	66	2024-08-07 17:08:22	2024-08-07 17:08:22	video
84	172305078666b3ab2289e38.jpg	67	2024-08-07 17:13:06	2024-08-07 17:13:06	image
85	172305078666b3ab228d2f5.mp4	67	2024-08-07 17:13:06	2024-08-07 17:13:06	video
86	172305284166b3b3294ae71.jpg	68	2024-08-07 17:47:21	2024-08-07 17:47:21	image
87	172305284166b3b3294c291.mp4	68	2024-08-07 17:47:21	2024-08-07 17:47:21	video
88	172305431666b3b8ec824bb.jpg	69	2024-08-07 18:11:56	2024-08-07 18:11:56	image
89	172305431666b3b8ec8692a.mp4	69	2024-08-07 18:11:56	2024-08-07 18:11:56	video
90	172305837266b3c8c400d45.jpg	70	2024-08-07 19:19:32	2024-08-07 19:19:32	image
91	172305837266b3c8c410dac.mp4	70	2024-08-07 19:19:32	2024-08-07 19:19:32	video
92	172305942666b3cce2a669a.jpg	71	2024-08-07 19:37:06	2024-08-07 19:37:06	image
93	172305942666b3cce2b210c.mp4	71	2024-08-07 19:37:06	2024-08-07 19:37:06	video
94	172306017166b3cfcbe1e63.jpg	72	2024-08-07 19:49:31	2024-08-07 19:49:31	image
95	172306017166b3cfcbe5263.jpg	72	2024-08-07 19:49:31	2024-08-07 19:49:31	image
96	172306017166b3cfcbe5423.mp4	72	2024-08-07 19:49:31	2024-08-07 19:49:31	video
97	172306058366b3d1676f2a8.jpg	73	2024-08-07 19:56:23	2024-08-07 19:56:23	image
98	172306058366b3d167706d1.jpg	73	2024-08-07 19:56:23	2024-08-07 19:56:23	image
99	172306058366b3d1677088d.mp4	73	2024-08-07 19:56:23	2024-08-07 19:56:23	video
100	172306105166b3d33b67c0c.jpg	74	2024-08-07 20:04:11	2024-08-07 20:04:11	image
101	172306105166b3d33b6cff7.jpg	74	2024-08-07 20:04:11	2024-08-07 20:04:11	image
102	172306105166b3d33b6d190.mp4	74	2024-08-07 20:04:11	2024-08-07 20:04:11	video
103	172306185466b3d65e5c357.jpg	75	2024-08-07 20:17:34	2024-08-07 20:17:34	image
104	172306185466b3d65e65f06.jpg	75	2024-08-07 20:17:34	2024-08-07 20:17:34	image
105	172306185466b3d65e66186.mp4	75	2024-08-07 20:17:34	2024-08-07 20:17:34	video
106	172306202766b3d70b77473.jpg	76	2024-08-07 20:20:27	2024-08-07 20:20:27	image
107	172306202766b3d70b7884b.jpg	76	2024-08-07 20:20:27	2024-08-07 20:20:27	image
108	172306202766b3d70b78a11.mp4	76	2024-08-07 20:20:27	2024-08-07 20:20:27	video
109	172306236566b3d85db8bff.jpg	77	2024-08-07 20:26:05	2024-08-07 20:26:05	image
110	172306252066b3d8f844191.jpg	78	2024-08-07 20:28:40	2024-08-07 20:28:40	image
111	172306306166b3db156d621.jpg	79	2024-08-07 20:37:41	2024-08-07 20:37:41	image
112	172306306166b3db15728d6.jpg	79	2024-08-07 20:37:41	2024-08-07 20:37:41	image
113	172306306166b3db1572a5e.jpg	79	2024-08-07 20:37:41	2024-08-07 20:37:41	image
114	172306325566b3dbd726c9e.jpg	80	2024-08-07 20:40:55	2024-08-07 20:40:55	image
115	172306370066b3dd9410a59.jpg	81	2024-08-07 20:48:20	2024-08-07 20:48:20	image
116	172306392166b3de7120f26.jpg	82	2024-08-07 20:52:01	2024-08-07 20:52:01	image
117	172306458266b3e10633b70.jpg	83	2024-08-07 21:03:02	2024-08-07 21:03:02	image
118	172306477266b3e1c49a28d.jpg	84	2024-08-07 21:06:12	2024-08-07 21:06:12	image
119	172306490166b3e245db460.jpg	85	2024-08-07 21:08:21	2024-08-07 21:08:21	image
120	172306557666b3e4e81f49f.jpg	86	2024-08-07 21:19:36	2024-08-07 21:19:36	image
121	172306645466b3e85614d18.jpg	87	2024-08-07 21:34:14	2024-08-07 21:34:14	image
122	172306683666b3e9d4c2d5a.jpg	88	2024-08-07 21:40:36	2024-08-07 21:40:36	image
123	172306757966b3ecbb84a30.jpg	89	2024-08-07 21:52:59	2024-08-07 21:52:59	image
124	172306832566b3efa5a47ca.jpg	90	2024-08-07 22:05:25	2024-08-07 22:05:25	image
125	172306848566b3f0452f29f.jpg	91	2024-08-07 22:08:05	2024-08-07 22:08:05	image
126	172306884666b3f1ae0edf8.jpg	92	2024-08-07 22:14:06	2024-08-07 22:14:06	image
129	172311424866b4a3081cda4.png	94	2024-08-08 10:50:48	2024-08-08 10:50:48	image
130	172311424866b4a3081e054.png	94	2024-08-08 10:50:48	2024-08-08 10:50:48	image
131	172311424866b4a3081e209.mp4	94	2024-08-08 10:50:48	2024-08-08 10:50:48	video
132	172314870466b529a0178bb.jpg	95	2024-08-08 20:25:04	2024-08-08 20:25:04	image
133	172314870466b529a01bcfd.mp4	95	2024-08-08 20:25:04	2024-08-08 20:25:04	video
134	172315059766b531058aba7.jpg	96	2024-08-08 20:56:37	2024-08-08 20:56:37	image
135	172315059766b531058c042.mp4	96	2024-08-08 20:56:37	2024-08-08 20:56:37	video
136	172315148666b5347e87107.jpg	97	2024-08-08 21:11:26	2024-08-08 21:11:26	image
137	172315148666b5347e884d3.mp4	97	2024-08-08 21:11:26	2024-08-08 21:11:26	video
138	172315192566b536350ce7d.jpg	98	2024-08-08 21:18:45	2024-08-08 21:18:45	image
139	172315192566b5363512735.mp4	98	2024-08-08 21:18:45	2024-08-08 21:18:45	video
140	172315215666b5371c96451.jpg	99	2024-08-08 21:22:36	2024-08-08 21:22:36	image
141	172315215666b5371c9e9e0.mp4	99	2024-08-08 21:22:36	2024-08-08 21:22:36	video
142	172315279166b53997c9064.jpg	100	2024-08-08 21:33:11	2024-08-08 21:33:11	image
143	172315279166b53997ce680.mp4	100	2024-08-08 21:33:11	2024-08-08 21:33:11	video
144	172315329566b53b8f427b5.jpg	101	2024-08-08 21:41:35	2024-08-08 21:41:35	image
145	172315329566b53b8f43ba2.mp4	101	2024-08-08 21:41:35	2024-08-08 21:41:35	video
146	172315442666b53ffa570d3.jpg	102	2024-08-08 22:00:26	2024-08-08 22:00:26	image
147	172315442666b53ffa59734.mp4	102	2024-08-08 22:00:26	2024-08-08 22:00:26	video
148	172315459066b5409ec4687.jpg	103	2024-08-08 22:03:10	2024-08-08 22:03:10	image
149	172315459066b5409ecabac.mp4	103	2024-08-08 22:03:10	2024-08-08 22:03:10	video
150	172322560466b656041cabe.jpg	104	2024-08-09 17:46:44	2024-08-09 17:46:44	image
151	172322587766b657153fc81.jpg	105	2024-08-09 17:51:17	2024-08-09 17:51:17	image
152	172322587766b6571541070.jpg	105	2024-08-09 17:51:17	2024-08-09 17:51:17	image
153	172322587766b6571541222.jpg	105	2024-08-09 17:51:17	2024-08-09 17:51:17	image
154	172323381266b67614abfe9.jpg	106	2024-08-09 20:03:32	2024-08-09 20:03:32	image
155	172323381266b67614af447.jpg	106	2024-08-09 20:03:32	2024-08-09 20:03:32	image
156	172323381266b67614b2568.jpg	106	2024-08-09 20:03:32	2024-08-09 20:03:32	image
157	172323424666b677c611fb9.jpg	108	2024-08-09 20:10:46	2024-08-09 20:10:46	image
158	172323424666b677c6132ee.jpg	108	2024-08-09 20:10:46	2024-08-09 20:10:46	image
159	172323424666b677c613473.jpg	108	2024-08-09 20:10:46	2024-08-09 20:10:46	image
160	172323424666b677c613910.jpg	108	2024-08-09 20:10:46	2024-08-09 20:10:46	image
161	172323424666b677c613aae.jpg	108	2024-08-09 20:10:46	2024-08-09 20:10:46	image
162	172323637866b6801aea09e.jpg	109	2024-08-09 20:46:18	2024-08-09 20:46:18	image
163	172323637866b6801aeb467.jpg	109	2024-08-09 20:46:18	2024-08-09 20:46:18	image
164	172323637866b6801aeb67c.jpg	109	2024-08-09 20:46:18	2024-08-09 20:46:18	image
165	172323637866b6801aeb7d0.jpg	109	2024-08-09 20:46:18	2024-08-09 20:46:18	image
166	172323637866b6801aeb95a.jpg	109	2024-08-09 20:46:18	2024-08-09 20:46:18	image
167	172344586666b9b26ab0b60.jpg	111	2024-08-12 06:57:46	2024-08-12 06:57:46	image
168	172351734066bac99c15190.jpg	113	2024-08-13 02:49:00	2024-08-13 02:49:00	image
169	172351734066bac99c16799.mp4	113	2024-08-13 02:49:00	2024-08-13 02:49:00	video
170	172352806466baf3800ec91.jpg	114	2024-08-13 05:47:44	2024-08-13 05:47:44	image
171	172353519266bb0f58d8e5c.jpg	115	2024-08-13 07:46:32	2024-08-13 07:46:32	image
172	172353604766bb12af2b23f.jpg	116	2024-08-13 08:00:47	2024-08-13 08:00:47	image
173	172356206566bb78510222b.jpg	118	2024-08-13 15:14:25	2024-08-13 15:14:25	image
174	172356301666bb7c0828613.jpg	119	2024-08-13 15:30:16	2024-08-13 15:30:16	image
175	172356377566bb7eff00e7a.jpg	120	2024-08-13 15:42:55	2024-08-13 15:42:55	image
176	172356535066bb8526b65ab.jpg	121	2024-08-13 16:09:10	2024-08-13 16:09:10	image
177	66bc9a3110277_1723636273.mp4	3	2024-08-14 15:51:13	2024-08-14 15:51:13	video
178	66bc9c2551812_1723636773.mp4	3	2024-08-14 15:59:33	2024-08-14 15:59:33	video
180	172371177166bdc11be568e.jpg	124	2024-08-15 08:49:31	2024-08-15 08:49:31	image
181	172373156766be0e6f67719.jpg	125	2024-08-15 14:19:27	2024-08-15 14:19:27	image
182	172373156766be0e6f68ddd.jpg	125	2024-08-15 14:19:27	2024-08-15 14:19:27	image
187	172374551966be44efa22fa.jpg	123	2024-08-15 18:11:59	2024-08-15 18:11:59	image
188	172380569066bf2ffae686a.jpg	122	2024-08-16 10:54:50	2024-08-16 10:54:50	image
189	66bf39a3435a0_1723808163.mp4	125	2024-08-16 15:36:03	2024-08-16 15:36:03	video
190	66bf5050757cd_1723813968.jpg	1	2024-08-16 17:12:48	2024-08-16 17:12:48	image
191	172383499966bfa2778c573.jpg	126	2024-08-16 19:03:19	2024-08-16 19:03:19	image
192	172387311966c0375f58eb8.jpg	127	2024-08-17 05:38:39	2024-08-17 05:38:39	image
193	172387373166c039c3e9564.jpg	128	2024-08-17 05:48:51	2024-08-17 05:48:51	image
194	172406120266c31612c9377.jpg	129	2024-08-19 09:53:22	2024-08-19 09:53:22	image
195	172406120266c31612d73e1.jpg	129	2024-08-19 09:53:22	2024-08-19 09:53:22	image
196	172406120266c31612d96a0.mp4	129	2024-08-19 09:53:22	2024-08-19 09:53:22	video
197	172418738866c502fcaf432.jpg	130	2024-08-20 20:56:28	2024-08-20 20:56:28	image
198	172418738866c502fcb2306.jpg	130	2024-08-20 20:56:28	2024-08-20 20:56:28	image
199	172418738866c502fcb274d.jpg	130	2024-08-20 20:56:28	2024-08-20 20:56:28	image
200	172418738866c502fcb28ae.jpg	130	2024-08-20 20:56:28	2024-08-20 20:56:28	image
201	172418738866c502fcb29f9.jpg	130	2024-08-20 20:56:28	2024-08-20 20:56:28	image
202	172418738866c502fcb2aea.jpg	130	2024-08-20 20:56:28	2024-08-20 20:56:28	image
203	172418738866c502fcb30cf.mp4	130	2024-08-20 20:56:28	2024-08-20 20:56:28	video
204	172432531866c71dc6b762e.jpg	131	2024-08-22 11:15:18	2024-08-22 11:15:18	image
205	172536676766d701ef5d88d.jpg	146	2024-09-03 12:32:47	2024-09-03 12:32:47	image
206	172536996266d70e6a32c36.jpg	138	2024-09-03 13:26:02	2024-09-03 13:26:02	image
207	172537085266d711e44730d.jpg	144	2024-09-03 13:40:52	2024-09-03 13:40:52	image
208	172606461166e1a7e327c98.jpg	147	2024-09-11 14:23:31	2024-09-11 14:23:31	image
209	172606665566e1afdfa99aa.jpg	148	2024-09-11 14:57:35	2024-09-11 14:57:35	image
210	172606665566e1afdfb1e92.jpg	148	2024-09-11 14:57:35	2024-09-11 14:57:35	image
211	172606665566e1afdfb1fd1.jpg	148	2024-09-11 14:57:35	2024-09-11 14:57:35	image
212	172648099866e8026689ce4.jpg	149	2024-09-16 10:03:18	2024-09-16 10:03:18	image
213	172648099866e8026693da4.jpg	149	2024-09-16 10:03:18	2024-09-16 10:03:18	image
214	172708723266f142808dde5.jpg	151	2024-09-23 10:27:12	2024-09-23 10:27:12	image
215	172709272666f157f6100d7.jpg	151	2024-09-23 11:58:46	2024-09-23 11:58:46	image
216	172709272666f157f61471c.jpg	151	2024-09-23 11:58:46	2024-09-23 11:58:46	image
217	172777548866fbc300b8a9f.jpg	153	2024-10-01 09:38:08	2024-10-01 09:38:08	image
218	172777548966fbc301ad6fe.jpg	152	2024-10-01 09:38:09	2024-10-01 09:38:09	image
219	172777696666fbc8c6de437.jpg	154	2024-10-01 10:02:46	2024-10-01 10:02:46	image
220	172777696766fbc8c7f21e5.jpg	155	2024-10-01 10:02:48	2024-10-01 10:02:48	image
221	172777717966fbc99ba4f11.jpg	156	2024-10-01 10:06:19	2024-10-01 10:06:19	image
222	172777728666fbca066c30a.jpg	157	2024-10-01 10:08:06	2024-10-01 10:08:06	image
223	172779026666fbfcbaee01a.jpg	158	2024-10-01 13:44:27	2024-10-01 13:44:27	image
225	17284711156706604bcea99.jpg	160	2024-10-09 10:51:55	2024-10-09 10:51:55	image
226	670661a0b2975_1728471456.mp4	160	2024-10-09 14:57:36	2024-10-09 14:57:36	video
227	1728475599670671cf35efd.jpg	159	2024-10-09 12:06:39	2024-10-09 12:06:39	image
228	17293359036713925f577ff.jpg	161	2024-10-19 11:05:03	2024-10-19 11:05:03	image
229	17295712316717299fc6c0d.jpg	162	2024-10-22 04:27:11	2024-10-22 04:27:11	image
230	1729764700671a1d5c3d0c6.jpg	163	2024-10-24 10:11:40	2024-10-24 10:11:40	image
231	1729764700671a1d5c429bc.jpg	163	2024-10-24 10:11:40	2024-10-24 10:11:40	image
232	1729764700671a1d5c42be5.jpg	163	2024-10-24 10:11:40	2024-10-24 10:11:40	image
233	1730895325672b5ddd02b95.jpg	164	2024-11-06 12:15:25	2024-11-06 12:15:25	image
234	1730895325672b5ddd03f4a.jpg	164	2024-11-06 12:15:25	2024-11-06 12:15:25	image
235	1730895325672b5ddd04051.jpg	164	2024-11-06 12:15:25	2024-11-06 12:15:25	image
236	1730903648672b7e6067f7f.jpg	165	2024-11-06 14:34:08	2024-11-06 14:34:08	image
237	1730903648672b7e607126a.jpg	165	2024-11-06 14:34:08	2024-11-06 14:34:08	image
238	1731691606673784568ead8.jpg	166	2024-11-15 17:26:46	2024-11-15 17:26:46	image
239	1731692283673786fbd8348.jpg	167	2024-11-15 17:38:03	2024-11-15 17:38:03	image
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
50	37	10	0
51	37	11	0
52	37	12	0
54	49	11	0
55	49	12	0
56	49	10	0
58	50	10	0
59	50	11	0
60	51	10	0
61	51	11	0
62	52	10	0
63	52	11	0
64	53	10	0
65	53	11	0
66	54	17	1
67	64	10	0
68	64	11	0
69	65	3	0
70	65	3	0
71	66	11	0
72	66	12	0
73	67	10	0
74	67	11	0
75	67	12	0
76	67	10	0
77	67	11	0
78	67	12	0
79	68	12	0
80	68	13	0
81	68	12	0
82	68	13	0
83	70	10	0
84	70	11	0
85	71	10	0
86	71	12	0
87	72	10	0
88	72	11	0
89	72	12	0
90	73	10	0
91	73	11	0
92	74	10	0
93	74	11	0
94	74	12	0
95	75	10	0
96	75	11	0
97	75	12	0
98	76	10	0
99	76	11	0
100	76	12	0
101	77	10	0
102	77	11	0
103	77	12	0
104	77	13	0
105	78	10	0
106	78	11	0
107	78	12	0
108	78	13	0
109	79	10	0
110	79	11	0
111	79	12	0
112	80	10	0
113	80	11	0
114	81	10	0
115	81	11	0
116	81	12	0
117	82	10	0
118	82	11	0
119	83	10	0
120	83	11	0
121	83	12	0
122	84	10	0
123	84	11	0
124	84	12	0
125	85	10	0
126	85	11	0
127	85	12	0
128	85	13	0
129	86	10	0
130	86	11	0
131	86	12	0
132	87	10	0
133	87	11	0
134	87	12	0
135	88	10	0
136	88	11	0
137	88	12	0
138	88	13	0
139	89	10	0
140	89	11	0
141	89	12	0
142	89	15	0
143	89	16	0
144	90	10	0
145	90	11	0
146	90	12	0
147	91	10	0
148	91	11	0
149	91	12	0
150	91	13	0
151	91	14	0
152	92	10	0
153	92	11	0
154	92	12	0
155	92	14	0
156	92	15	0
157	94	17	1
158	94	18	1
159	98	19	0
160	99	19	0
161	100	20	0
162	102	19	1
163	102	20	0
164	103	19	1
165	103	20	0
166	104	19	1
167	104	20	0
168	105	19	0
169	105	20	0
170	108	19	0
171	108	20	1
172	109	19	1
173	109	20	0
174	109	19	0
175	113	22	1
176	113	23	0
177	116	22	0
178	116	23	0
181	118	22	0
182	118	23	0
183	118	22	0
184	118	23	0
186	121	22	0
187	121	23	0
201	1	1	0
202	1	2	0
203	1	3	1
204	1	4	1
205	3	12	1
206	3	13	0
207	3	10	1
208	3	11	0
209	3	15	1
210	3	16	1
211	126	22	0
212	126	23	0
213	128	28	1
214	128	26	1
215	128	27	0
219	129	26	1
220	129	27	0
221	129	28	0
222	129	29	0
224	130	33	1
225	147	29	1
226	147	26	1
227	147	30	0
230	138	25	1
231	138	31	0
232	149	44	1
233	149	42	0
234	149	43	1
235	150	26	0
236	150	27	0
237	151	48	0
238	151	46	0
239	151	47	1
240	152	50	0
241	152	51	0
246	160	60	0
247	160	55	1
248	159	25	0
249	159	31	0
253	161	33	0
254	163	61	0
255	163	62	1
256	164	63	1
257	164	64	0
258	166	63	1
259	166	64	0
260	167	63	1
261	167	64	1
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
1	App\\Models\\User	16	token-name	b8ba1defe22c407a16516df09f0d7c866f5d678b4c8b3f7a5fa81e622d7642e3	["*"]	\N	\N	2024-05-14 10:30:08	2024-05-14 10:30:08
2	App\\Models\\User	18	api	c99bb6b9c5451e72e23114ee6a42bd316ea3f865c8ebaff7301f3e07e84853c4	["*"]	2024-05-14 13:35:16	\N	2024-05-14 13:30:30	2024-05-14 13:35:16
3	App\\Models\\User	19	api	fe7f5bd30f5effe1e7d812ce6d1bc221b628497d5e5511e5ebca37bd2d1a01f7	["*"]	2024-05-14 16:04:50	\N	2024-05-14 15:40:26	2024-05-14 16:04:50
4	App\\Models\\User	20	api	5427c21dd716a379b51cd91d633fc3859e71214df1f9f1db77a0ddbb2d7baa44	["*"]	\N	\N	2024-05-14 17:14:47	2024-05-14 17:14:47
5	App\\Models\\User	21	api	213004e7e9bb6e172aa999f60700b85a8054f814660b2ecca90e1b60cbed3fd5	["*"]	\N	\N	2024-05-14 21:46:39	2024-05-14 21:46:39
7	App\\Models\\User	23	api	433a639533483a94f7ffcab2dbfb40195a29782aa8218df279ef071ad2d086b5	["*"]	\N	\N	2024-05-14 23:44:06	2024-05-14 23:44:06
8	App\\Models\\User	23	api	ebc2f43dfd7143a95e744fedb790cddcad08e87fbd6e847ce5a19771826ed796	["*"]	\N	\N	2024-05-14 23:45:08	2024-05-14 23:45:08
9	App\\Models\\User	23	api	9c0cb2ff8123b2974f6d35cd746d286b0dd1aa38b3d4cb2be38fa15721328e4f	["*"]	\N	\N	2024-05-15 02:23:04	2024-05-15 02:23:04
10	App\\Models\\User	18	api	25b4a1ec48a9d2254551894073dc74f5be3cd668b34f29794f49f9cce358fb8b	["*"]	\N	\N	2024-05-15 15:37:41	2024-05-15 15:37:41
11	App\\Models\\User	18	api	5c8f317b92c5df5315b6f8318a75de3d60558d183f4fdb6df2631e1d11ba7e34	["*"]	\N	\N	2024-05-16 20:09:56	2024-05-16 20:09:56
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
449	App\\Models\\User	114	api	690b06e56da9750d3be1f9769badab05b70d8db8b0e3bddd294916c4ca2fa7ad	["*"]	2024-09-03 08:48:12	\N	2024-09-03 08:47:10	2024-09-03 08:48:12
32	App\\Models\\User	27	api	78eec23eb25d5ca40cadc5d351613d65606994f3b3060462049bd0efe87fcb04	["*"]	\N	\N	2024-05-27 16:40:18	2024-05-27 16:40:18
33	App\\Models\\User	31	api	e89009aca6a8ac14cb3b3b8de02d7279372acdc753810fd5d4718e1e3d37e030	["*"]	\N	\N	2024-05-27 16:58:59	2024-05-27 16:58:59
34	App\\Models\\User	31	api	19388582502972ba4eeb413523b8903f81d5ac993261777b9bab22142029f302	["*"]	\N	\N	2024-05-27 16:59:49	2024-05-27 16:59:49
35	App\\Models\\User	27	api	69dfc7cfbb8bbab29633849cba12757a3baef95cbc4ea8d5c91a84b984753f11	["*"]	\N	\N	2024-05-27 20:06:27	2024-05-27 20:06:27
36	App\\Models\\User	27	api	42759c4f56cd64688614d196e6322be8d88e782539e910ef9fd0a722d62a6304	["*"]	\N	\N	2024-05-27 20:07:41	2024-05-27 20:07:41
37	App\\Models\\User	32	api	7e0a238a772520d2e4f6373074adcb6f395464b04cd7adc2121f5f782973ec9b	["*"]	\N	\N	2024-05-27 20:21:10	2024-05-27 20:21:10
38	App\\Models\\User	32	api	5a980c02c5f4e0f6389320eb0172633002866c2efcd0c8483223ad61452c49c9	["*"]	\N	\N	2024-05-27 20:26:06	2024-05-27 20:26:06
674	App\\Models\\User	157	api	db8cc82e9bb43aa180bb7ce001b0ddc3ec48f71bc9caca084d89fc6c9868d8d0	["*"]	2024-10-01 16:01:50	\N	2024-10-01 15:19:07	2024-10-01 16:01:50
42	App\\Models\\User	37	api	d80fc4fbf6771100a485fee5196d5408554ad2349c9d7dd2e83d14b84d979fae	["*"]	\N	\N	2024-05-28 12:02:44	2024-05-28 12:02:44
43	App\\Models\\User	28	api	a7234386c99b87a10624d8d98a06d7580ac5e4352e9a96b637ae11a07361b48f	["*"]	\N	\N	2024-05-28 12:05:10	2024-05-28 12:05:10
44	App\\Models\\User	28	api	926351755c7c553d05b4704089a13784815bbbbbe481788af5a9e3edc98f139f	["*"]	\N	\N	2024-05-28 13:25:15	2024-05-28 13:25:15
45	App\\Models\\User	28	api	acb20b3d159cf37d5d69b675365d0cceca4d11bae867a5608b0c58a9591a808c	["*"]	\N	\N	2024-05-28 14:32:15	2024-05-28 14:32:15
46	App\\Models\\User	28	api	1f7d22bbb787c8e805a940c4ae1bac454df44921f6c62bae43f0cf481309ec1a	["*"]	\N	\N	2024-05-28 14:45:38	2024-05-28 14:45:38
47	App\\Models\\User	28	api	e60471e367d6d6b34065431a74b6c586505266805e0a70f6444efb493bda72c3	["*"]	\N	\N	2024-05-28 14:57:58	2024-05-28 14:57:58
48	App\\Models\\User	28	api	fe853f971a2bf42be2da5fa911372db1a5e332ae4f7bff977ea6188e4e1689a0	["*"]	\N	\N	2024-05-28 15:00:13	2024-05-28 15:00:13
49	App\\Models\\User	28	api	e16bb77bf5ab1cdf2bcd83e649384cbe4c3d4f051dfbe292f274fdbad0204ad2	["*"]	\N	\N	2024-05-28 15:04:56	2024-05-28 15:04:56
459	App\\Models\\User	99	api	021afc68ed6adb12d89d4d51617c8f97d0c8e3f37a47987364ae3ef85aa8fe10	["*"]	2024-09-03 14:33:06	\N	2024-09-03 14:19:10	2024-09-03 14:33:06
750	App\\Models\\User	175	api	a7e8852932417b9293f3e8658c149e0bfc03c2a89986365f2943fdd6d3c5cec0	["*"]	\N	\N	2024-10-09 08:34:10	2024-10-09 08:34:10
755	App\\Models\\User	180	api	23d3a5afbd661e5ca267ab1c3eb0d8ba102d475f990640675d4f3855e1467da0	["*"]	\N	\N	2024-10-09 09:34:38	2024-10-09 09:34:38
699	App\\Models\\User	165	api	f64ee49491497e38ffaca40e64738750c8d9e419cc6ed04f433fb033fb617361	["*"]	2024-10-02 16:25:13	\N	2024-10-02 16:25:01	2024-10-02 16:25:13
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
432	App\\Models\\User	109	api	83acec8f4a75e652843e765016a02de509f19f7efdf41e6dc0c9d3a90a5a5b9d	["*"]	2024-09-02 11:19:57	\N	2024-09-02 11:12:31	2024-09-02 11:19:57
93	App\\Models\\User	14	api	ae25dc5dfdb32290b968d09c5c2ebd1f5b1d3e6ae0df59e2737b72cc53d9295e	["*"]	\N	\N	2024-06-03 20:15:12	2024-06-03 20:15:12
100	App\\Models\\User	17	api	16b2cad41ea82815c509e52d356aca5b827f4450cc9afd3f845dd0733ff9c3a6	["*"]	2024-06-05 20:47:01	\N	2024-06-05 10:50:11	2024-06-05 20:47:01
84	App\\Models\\User	14	api	ebebab8d9ec2ed6a942db203051f3db8e9bbb646af2a269d2f6503e12e68e2e1	["*"]	2024-06-03 01:53:04	\N	2024-06-03 01:47:42	2024-06-03 01:53:04
85	App\\Models\\User	28	api	0ae233d17915af0fa6794559f3d41a0b41fb4ab15dcd2d10aedee63a3b514b1e	["*"]	\N	\N	2024-06-03 11:10:57	2024-06-03 11:10:57
86	App\\Models\\User	45	api	82e32941c18af940ec63bce3f71c98e967f442aa53d6b3da6e8fb2f8dc8dcf8a	["*"]	\N	\N	2024-06-03 13:07:06	2024-06-03 13:07:06
87	App\\Models\\User	45	api	c2312027756e3970f47bfa3ea4d9d51378a284b1efc7bff2b80b8f7d9c92793a	["*"]	\N	\N	2024-06-03 13:07:25	2024-06-03 13:07:25
444	App\\Models\\User	99	api	55d6907ced6593de174e3369b87ffb8725d8b90fb21913a24f62388d56ba035c	["*"]	2024-09-02 21:25:06	\N	2024-09-02 21:10:12	2024-09-02 21:25:06
95	App\\Models\\User	14	api	ead390a9808bcea98a838a400a3c8bc4f2dd85ae938176455727a6fde411f971	["*"]	\N	\N	2024-06-03 20:35:16	2024-06-03 20:35:16
90	App\\Models\\User	14	api	885b36e0bf95ff50dd80df7d798fe2da575edaf7c91b1388caebcc29842da3cf	["*"]	2024-06-04 01:53:47	\N	2024-06-03 16:00:10	2024-06-04 01:53:47
96	App\\Models\\User	46	api	225877e71106f31047aeb3378fd16ef3c6f95fb6e63f93d830f11a47c1517400	["*"]	\N	\N	2024-06-03 22:48:04	2024-06-03 22:48:04
97	App\\Models\\User	47	api	f26b099b26545a29c780fd396545d69f160c7e5ffa6e587b4d33bd0a914349f6	["*"]	\N	\N	2024-06-04 00:55:04	2024-06-04 00:55:04
92	App\\Models\\User	28	api	3028edfc32322bce24351814213d189490918056389b86cf6238826f7e0e6e3a	["*"]	\N	\N	2024-06-03 17:54:45	2024-06-03 17:54:45
98	App\\Models\\User	33	api	4113fc635d638f000d5951c298d3c9686e219ac4fb213091b77070742d89e7b6	["*"]	2024-06-04 14:12:19	\N	2024-06-04 14:11:56	2024-06-04 14:12:19
99	App\\Models\\User	17	api	60e2714d9263bb3ab57823eace064de012901dd0adf512fc0781bb4d9261ca29	["*"]	2024-06-05 00:44:50	\N	2024-06-04 14:13:43	2024-06-05 00:44:50
942	App\\Models\\User	221	api	5ac6c2d19e4c7baf064845d4a4bf977cfeb6743f293db96585101906c88bad6b	["*"]	2024-11-05 19:46:45	\N	2024-11-05 16:39:27	2024-11-05 19:46:45
135	App\\Models\\User	28	api	1466c7bb2dda64f28ebd1fc9188096080cbf543a9f058575f840267d1edbc51d	["*"]	\N	\N	2024-08-06 11:08:15	2024-08-06 11:08:15
508	App\\Models\\User	99	api	10e11a14378cf788e2f892d8027eb147e39f95df3fdaf9d46e762d878058ef21	["*"]	2024-09-12 05:51:25	\N	2024-09-11 14:14:51	2024-09-12 05:51:25
103	App\\Models\\User	8	api	64db15fb40fa2b41f8b0c6d22369b9d54c20f4942a4a9a49c9f51aa9b94722b5	["*"]	2024-06-07 09:22:57	\N	2024-06-07 09:18:55	2024-06-07 09:22:57
152	App\\Models\\User	63	api	39816f5a7c14ba76240ad19fe4f578c272e46ae37f11021d3e79b2f4509df60e	["*"]	2024-08-08 11:21:55	\N	2024-08-08 11:18:52	2024-08-08 11:21:55
102	App\\Models\\User	45	api	4929728c8117f23745a875b89c2d8b7c90cbde41ce3c69beb91e90f1c5e1c7e3	["*"]	2024-06-07 20:15:31	\N	2024-06-06 19:08:38	2024-06-07 20:15:31
108	App\\Models\\User	48	api	f4704f31831b87a844aced9af82751d4fdae256a07bfc81fa6d152bb66ff112b	["*"]	\N	\N	2024-07-18 14:54:11	2024-07-18 14:54:11
445	App\\Models\\User	114	api	7f710837eb5952fe81c371988b1edcdab658bc95d9c2b422b0d1509544672487	["*"]	2024-09-02 21:38:37	\N	2024-09-02 21:32:53	2024-09-02 21:38:37
648	App\\Models\\User	22	api	c1ae6e78b5e9ff290e100a6d827cf820c1e920944f412f7ff0d2f15eadfd5f3d	["*"]	\N	\N	2024-09-30 11:44:19	2024-09-30 11:44:19
128	App\\Models\\User	45	api	2bdf2f42280d5e69a7ac4393b534bf7e6eff3c53928a652fa01ea9aa4f4abf6d	["*"]	\N	\N	2024-07-25 20:27:12	2024-07-25 20:27:12
129	App\\Models\\User	8	api	636b7e28a5c03bc42439ca7b32178e4e0e102b11201c36c9a7ca65401e200696	["*"]	\N	\N	2024-07-25 20:31:00	2024-07-25 20:31:00
151	App\\Models\\User	62	api	85f222dbdd58cc18f0f4df161c93dab7ad66661966715dba52a09934c315781b	["*"]	\N	\N	2024-08-08 11:07:57	2024-08-08 11:07:57
121	App\\Models\\User	8	api	85caa4cba27d61f989fe5c299c4e6c1ea4b0be2d930d0c2ad5eae3e357a9d57a	["*"]	\N	\N	2024-07-23 23:39:32	2024-07-23 23:39:32
122	App\\Models\\User	45	api	3bca758d0e1afdb9fdb7ef4695f06c5ea61e96c1a8ceb6b880bacee754e00523	["*"]	\N	\N	2024-07-23 23:41:16	2024-07-23 23:41:16
123	App\\Models\\User	8	api	44da0bc65d1d2a3ca02f98b947d1aaa327f3cb1aa2555640480bc86cb12144f3	["*"]	\N	\N	2024-07-23 23:41:28	2024-07-23 23:41:28
131	App\\Models\\User	8	api	3f2d5ef7d565047db35e639fcb5140bdcc6d172147c69c5e80f63427b42f4939	["*"]	2024-07-29 10:54:12	\N	2024-07-29 10:33:44	2024-07-29 10:54:12
605	App\\Models\\User	134	api	d60a8c951b2da9fef04d1f73101edc72c4248cac6ec1a431674b4dc4456d0ce8	["*"]	2024-10-01 09:46:11	\N	2024-09-24 11:33:10	2024-10-01 09:46:11
104	App\\Models\\User	45	api	e34aec9c295bd1d20b21bea2e0a5b0bfea519a76cdf0d87926f73facce2b4b81	["*"]	2024-06-07 21:55:29	\N	2024-06-07 20:23:32	2024-06-07 21:55:29
397	App\\Models\\User	101	api	f766f0ac89f504ab7bed5a0fca08e9269e2c0553ee62fd1fc9204112c3cc2b7b	["*"]	2024-08-24 13:09:16	\N	2024-08-24 13:03:35	2024-08-24 13:09:16
455	App\\Models\\User	118	api	bfb7996a2d1865fd716f51ef52de12178446dba08cb15c1d79711a85c09fcdd4	["*"]	2024-09-03 12:24:55	\N	2024-09-03 11:03:20	2024-09-03 12:24:55
125	App\\Models\\User	8	api	c29e4ad3c91b82e9fcc5e78b1acab794a009a55b8e8404fb4bd5424332fd7079	["*"]	2024-07-29 11:03:07	\N	2024-07-24 03:28:34	2024-07-29 11:03:07
120	App\\Models\\User	8	api	f609508af7d916095777418f61c87fa844741ca1b90d470f6a5e96f56c2e4fe2	["*"]	2024-07-24 02:20:20	\N	2024-07-23 23:16:47	2024-07-24 02:20:20
124	App\\Models\\User	45	api	7a4a974031c5098454399570cd1f622fc085d17948a1b74b1e41e36f5e848051	["*"]	2024-07-25 20:37:15	\N	2024-07-23 23:41:43	2024-07-25 20:37:15
117	App\\Models\\User	8	api	3e0a0e869f5643c37a8fefbc2dd62b1e2ad2f6c45b1ffc76ec2fde199678775c	["*"]	\N	\N	2024-07-22 20:41:52	2024-07-22 20:41:52
118	App\\Models\\User	55	api	dff6b5c18d9a51b840f6b0e5e6aaca5de7e738d696db10142d1e388639098636	["*"]	\N	\N	2024-07-22 21:20:33	2024-07-22 21:20:33
460	App\\Models\\User	59	api	b3d7e91d9db3cad154afbefdbdcd8d2441fba86f4d08c08b94b4e3d0e63d3ce1	["*"]	2024-09-05 11:31:21	\N	2024-09-03 14:51:38	2024-09-05 11:31:21
133	App\\Models\\User	28	api	3a914d0bf620903103e1683b7edde93acfff36b9d2f666f1b70892157be3812a	["*"]	\N	\N	2024-08-02 17:55:52	2024-08-02 17:55:52
111	App\\Models\\User	50	api	7ec53953cd81214dafcb7cd054f659e634114dabd20a457f074cdb0d4a6ceab6	["*"]	2024-07-18 21:22:20	\N	2024-07-18 15:30:34	2024-07-18 21:22:20
112	App\\Models\\User	50	api	ad4d63cda845f5d77f709ba822f7fec3868aa425e18fd46b1ce99ab612ca3ebc	["*"]	\N	\N	2024-07-18 21:30:48	2024-07-18 21:30:48
113	App\\Models\\User	50	api	6d61024d2035d630e0a9bb92a8231a2d8b4061b3081a104d718bfae4c25fceee	["*"]	\N	\N	2024-07-19 00:08:45	2024-07-19 00:08:45
524	App\\Models\\User	99	api	103a943177d3478c13f6d2db4c068ac27d25a077babc3cbda7f85c2921a0057b	["*"]	2024-09-13 08:21:34	\N	2024-09-13 07:52:43	2024-09-13 08:21:34
580	App\\Models\\User	142	api	0fe1810c5579aea141bbe1d12625f8848ec4a7a4a138edd0b463b09619a2ee86	["*"]	2024-09-23 15:06:41	\N	2024-09-23 14:32:07	2024-09-23 15:06:41
520	App\\Models\\User	97	api	03b2b8b73c76ee51185c969affdb9b489630895e10d359521ddeae195ac60980	["*"]	2024-09-12 15:21:22	\N	2024-09-12 14:21:16	2024-09-12 15:21:22
126	App\\Models\\User	56	api	6d7a351ab3b276b6370c77df0c4f31b86a197fe0f7ac050c126bba4d71b2de30	["*"]	2024-07-24 16:13:08	\N	2024-07-24 09:05:54	2024-07-24 16:13:08
159	App\\Models\\User	63	api	142ac58df0df2e12288c226f879a4677c39c595077795e5fd2cb900269ddca89	["*"]	\N	\N	2024-08-08 15:38:04	2024-08-08 15:38:04
528	App\\Models\\User	137	api	40cced7ac91748e15e124697f526846f349e9b772ac8f0b79691e116965a10f5	["*"]	2024-09-13 16:29:57	\N	2024-09-13 16:18:10	2024-09-13 16:29:57
127	App\\Models\\User	57	api	6273463b2582dca6d9a2b5a4985d65b4c7505c73e8844adf22a92fb41c645a13	["*"]	\N	\N	2024-07-25 15:32:52	2024-07-25 15:32:52
751	App\\Models\\User	178	api	67b0ec269efc60c0b440196c429ec2f5bba68eb97b1c86f0303149130aab2cba	["*"]	\N	\N	2024-10-09 08:38:38	2024-10-09 08:38:38
153	App\\Models\\User	63	api	60682998a7a630e4fc390a0b92d38e2d15ec4feae139bb759b9e0f0ed3e19de9	["*"]	2024-08-08 14:06:14	\N	2024-08-08 11:19:12	2024-08-08 14:06:14
613	App\\Models\\User	97	api	c67251f57f6f70fda07f6ea4f2ea6cf07798e1417f5a679904dac071ae1a2c79	["*"]	2024-09-24 22:39:25	\N	2024-09-24 21:13:35	2024-09-24 22:39:25
155	App\\Models\\User	63	api	018351cc4e246d8f80e08377b7a2463a991d739b1c64f154a5d5103914683c19	["*"]	2024-08-08 14:15:31	\N	2024-08-08 14:10:26	2024-08-08 14:15:31
705	App\\Models\\User	148	api	f8bab6e3d9b861b0c53da3cabbb2d127f82235074f7b654a1117373f040a0a69	["*"]	\N	\N	2024-10-03 15:28:21	2024-10-03 15:28:21
156	App\\Models\\User	63	api	c032c857f8b46fafb0a7953553caa1f4288d0ef5d75bc217607b12a9b65a79c5	["*"]	\N	\N	2024-08-08 14:20:51	2024-08-08 14:20:51
157	App\\Models\\User	63	api	c03f228f943d09484e248250470d039fc92d387e0ce8c326a5d5db0a2c1babfc	["*"]	\N	\N	2024-08-08 14:28:47	2024-08-08 14:28:47
158	App\\Models\\User	63	api	79643a77f8cf018012facb3621c29f1353f4f1759743d1fa35cd6121cca8d738	["*"]	\N	\N	2024-08-08 14:34:00	2024-08-08 14:34:00
160	App\\Models\\User	63	api	deeb57422e7bdb8e1e8eefb2791f8e2fcf3f376a9a84c40f8ce6735dcb5e9a6a	["*"]	\N	\N	2024-08-08 15:44:37	2024-08-08 15:44:37
708	App\\Models\\User	167	api	c9fa12d42960cedf294089d975b783f366562427271c8d8623074d4dbc9e064b	["*"]	2024-10-04 12:55:48	\N	2024-10-04 12:36:34	2024-10-04 12:55:48
161	App\\Models\\User	63	api	4772670b3a0dd891f60ec39eef042de699b3f7c285221ea7f96eb8676f18fa48	["*"]	\N	\N	2024-08-08 15:49:21	2024-08-08 15:49:21
182	App\\Models\\User	28	api	29a533aebf584388827d253836d4f4dda6fcecc1323b995eb012a1692aed5ba2	["*"]	\N	\N	2024-08-12 13:49:47	2024-08-12 13:49:47
162	App\\Models\\User	63	api	8278135801b184280d81e48ac65e0f0a88c991991add8139ae21279c43ec6ee4	["*"]	\N	\N	2024-08-08 16:03:31	2024-08-08 16:03:31
201	App\\Models\\User	75	api	e88c8476f618000df2b3fdcb918f7e80be08bc736b83deb0b01c02719b0a03ba	["*"]	2024-08-14 15:29:19	\N	2024-08-14 15:05:48	2024-08-14 15:29:19
192	App\\Models\\User	66	api	29b1b83e9d5a9ef33ebd256228c03d5215eceb6aead5eefc7b19e73263e58b1e	["*"]	2024-08-15 09:35:47	\N	2024-08-13 12:03:39	2024-08-15 09:35:47
163	App\\Models\\User	63	api	269aa845a0aead08151c5366975c1589c1f650a0b677197dd29b1291f75e6de5	["*"]	\N	\N	2024-08-08 16:18:54	2024-08-08 16:18:54
756	App\\Models\\User	181	api	8b094d9b10946c697fcdc1b42d64d75863809dd5f18b59778a9141d39599b19f	["*"]	\N	\N	2024-10-09 09:44:20	2024-10-09 09:44:20
513	App\\Models\\User	132	api	bc9da04865497e90d93b0aab09d24aad8f6e3735ba07c35c391ef60c5e7690b5	["*"]	2024-09-11 16:07:30	\N	2024-09-11 15:52:43	2024-09-11 16:07:30
732	App\\Models\\User	97	api	b0babdc201259ad7db29bf56fae7b50dc5c7ad08267e206e78b877eba2e0aa5d	["*"]	2024-10-08 16:30:38	\N	2024-10-07 21:26:42	2024-10-08 16:30:38
166	App\\Models\\User	63	api	90b31b8415f321d7f50c1db64f6735237ab7d30924b4fe3fe3592ee8be8adc75	["*"]	2024-08-08 17:58:40	\N	2024-08-08 17:49:08	2024-08-08 17:58:40
167	App\\Models\\User	63	api	4746a2966e5cc19ad41f00d65e0ac10bf7344dfe9d8a0670c938c96c8f833103	["*"]	\N	\N	2024-08-08 18:18:17	2024-08-08 18:18:17
174	App\\Models\\User	66	api	b21474841ef9ae07737d5e4a89d8b2464efb32b144377d416283d885beadc0d9	["*"]	\N	\N	2024-08-09 13:04:11	2024-08-09 13:04:11
759	App\\Models\\User	184	api	bc30bfa88003969b7791d590b623c5415ca57b0a964862ef416b1211369e705e	["*"]	\N	\N	2024-10-09 09:50:59	2024-10-09 09:50:59
175	App\\Models\\User	67	api	d593f28a0f5df300732dca4fca36150bf5d88261521267e6fa3c975b13bcb7f8	["*"]	\N	\N	2024-08-09 14:26:38	2024-08-09 14:26:38
788	App\\Models\\User	192	api	6b185e2144d3cf5d35c6339fc52492f15074b7f47b4d8ac1360fc7834726b435	["*"]	2024-11-11 14:02:34	\N	2024-10-09 19:52:22	2024-11-11 14:02:34
503	App\\Models\\User	78	api	b3fec8f302dfaeee89ba0be280d88f6e9fad97cfa8648ee75edfc752ea2d3ec2	["*"]	2024-09-11 01:21:37	\N	2024-09-11 01:06:41	2024-09-11 01:21:37
164	App\\Models\\User	63	api	302c96f08350dc43cba77f1467f084080e2c72a849b092d068baa53fdb96463d	["*"]	\N	\N	2024-08-08 17:35:50	2024-08-08 17:35:50
169	App\\Models\\User	28	api	5bbe40690a2e2916b8aac102b26a362d7b59d88a4c805a61b2c7c3dc5f98732f	["*"]	\N	\N	2024-08-08 20:10:16	2024-08-08 20:10:16
521	App\\Models\\User	99	api	ec35e57fff69dd665ac9b50b2049e82037e2c8a02bc80bbc8b988ea1b8a10835	["*"]	2024-09-13 06:39:00	\N	2024-09-12 15:00:49	2024-09-13 06:39:00
298	App\\Models\\User	75	api	ed7e2a653361a66236d82b6a5f59d8c6fe77754f021d8b2a2977ba48907c7764	["*"]	2024-10-09 11:29:38	\N	2024-08-20 12:46:02	2024-10-09 11:29:38
165	App\\Models\\User	63	api	7b79e2d698f24624fa78b5825a887691b336cdc7188aeb16de2a3c7c80064de5	["*"]	\N	\N	2024-08-08 17:42:01	2024-08-08 17:42:01
461	App\\Models\\User	122	api	1ad9f6c73cf837d7bccbb9008047b7d8026a4b6b968df2c6f307fc42dc7aba82	["*"]	2024-09-03 15:58:53	\N	2024-09-03 15:57:15	2024-09-03 15:58:53
195	App\\Models\\User	74	api	ad4fe81e226c79a572527f874cdd9c247185812bb66d2efd5ccd4f4c9cf6ab70	["*"]	2024-08-14 06:03:12	\N	2024-08-14 06:02:38	2024-08-14 06:03:12
181	App\\Models\\User	28	api	639a603a72e37428f41152c08fb07f5df314207ec3facd0680af1cf2354f8d56	["*"]	\N	\N	2024-08-12 12:05:29	2024-08-12 12:05:29
184	App\\Models\\User	70	api	220d136653edfcab04755fdf4b480d7253b1721c021b591e10ad9583d1820b22	["*"]	\N	\N	2024-08-12 23:42:22	2024-08-12 23:42:22
765	App\\Models\\User	189	api	a6b602b0cf8d94fb0c1ee6bfa74cc32bb9714234b9c7858dda311d00fb80baf2	["*"]	\N	\N	2024-10-09 09:59:12	2024-10-09 09:59:12
185	App\\Models\\User	71	api	f7bc81de0bc05160d89c4d1a26e7f926bd85d3921d4262e529282831a440ef41	["*"]	\N	\N	2024-08-12 23:49:23	2024-08-12 23:49:23
186	App\\Models\\User	72	api	6c99c6709ab2b46589d259c27f6f7fd92db79d733504cffb6f60f6793de6fd9c	["*"]	\N	\N	2024-08-12 23:52:28	2024-08-12 23:52:28
430	App\\Models\\User	108	api	b0305af8fab892713caea59413e2dcf88a3dbe2c734649390906b8b8cbe37666	["*"]	2024-08-30 09:44:09	\N	2024-08-30 09:44:07	2024-08-30 09:44:09
466	App\\Models\\User	124	api	aab4cebc749e86798f02a64c76d587178ff5fd1d25377a21c1f0757416de0eaf	["*"]	2024-09-05 05:19:19	\N	2024-09-04 06:54:15	2024-09-05 05:19:19
180	App\\Models\\User	28	api	c13d52c8379e2f7e16070a233d598a49e5d6d9adc0a09c48fc73bca2e98947e6	["*"]	\N	\N	2024-08-12 10:21:15	2024-08-12 10:21:15
191	App\\Models\\User	66	api	fb9a14d608a3ca16c85c74dbb940bcadc6e86d1588212537539f96c1bfcd71b8	["*"]	\N	\N	2024-08-13 12:01:12	2024-08-13 12:01:12
543	App\\Models\\User	139	api	f35988b78ba4d32b1bddbadbb6d47bfad53d398c76167a2ee6a7db3d77b1bc8c	["*"]	\N	\N	2024-09-18 23:17:21	2024-09-18 23:17:21
187	App\\Models\\User	73	api	f06724e198f69a85bbfe8fe5b232537f69a405d1dd21a2aad31c8945e88c14f7	["*"]	2024-08-17 22:03:18	\N	2024-08-12 23:57:23	2024-08-17 22:03:18
797	App\\Models\\User	195	api	ac10a6b003e0295204baf033b0f5d67ed9b0d83df5cfc49644a7de9aae5a5e4c	["*"]	\N	\N	2024-10-10 08:17:21	2024-10-10 08:17:21
726	App\\Models\\User	131	api	e20e1c0295c356f67022fc1ba6e431ff739df24eb0f414336b62045f351cda9b	["*"]	\N	\N	2024-10-07 13:01:19	2024-10-07 13:01:19
200	App\\Models\\User	75	api	b0796be87818ade6b2165e6ed594014377e0219162572a8ea33cccf911635b91	["*"]	\N	\N	2024-08-14 15:05:36	2024-08-14 15:05:36
805	App\\Models\\User	197	api	c403bed0284be356c9bab0d4f051645b7ba19fe3bf3905c4f7164efabde988a9	["*"]	\N	\N	2024-10-14 08:49:27	2024-10-14 08:49:27
901	App\\Models\\User	211	api	c6a7a2cce80c5fd4b35b46701f23ec02efe599f2a9a607a8e8ea0bbbde2e88e2	["*"]	2024-10-30 07:53:50	\N	2024-10-29 09:26:27	2024-10-30 07:53:50
310	App\\Models\\User	86	api	24a8ef6078600f0413cbade18f20775b9861475575857af5050cf2e3676aaf93	["*"]	\N	\N	2024-08-20 16:18:39	2024-08-20 16:18:39
314	App\\Models\\User	88	api	f7cf4a8d60093ec206f92009ca5cf58ef9d13aaf61484c187caeb74cd009f227	["*"]	\N	\N	2024-08-20 16:50:14	2024-08-20 16:50:14
903	App\\Models\\User	211	api	35cc37a0620377895de49bf1824ca5a3893ddd62636ccc9178d00913c390a2cb	["*"]	2024-10-30 17:22:43	\N	2024-10-30 17:19:58	2024-10-30 17:22:43
915	App\\Models\\User	215	api	5ffb1b6b0ac3da9b6d6f567f0e3ca2d74b40adfc981bb9f1301dd1c6d842d7a0	["*"]	\N	\N	2024-11-04 11:48:06	2024-11-04 11:48:06
934	App\\Models\\User	225	api	bfd4d9533a06bad0b9355310a2fe9f333756c1500721d6271a661151361d5df3	["*"]	2024-11-05 09:26:48	\N	2024-11-05 09:22:03	2024-11-05 09:26:48
936	App\\Models\\User	228	api	e523c84c30346a33147060326c9e1417c674b930b2c5a634a007d00053948f2b	["*"]	2024-11-05 12:32:54	\N	2024-11-05 12:32:29	2024-11-05 12:32:54
724	App\\Models\\User	135	api	9db981ff535332cdd391ac8c7a50c966f858081f0e9599ac5f2971ed18d3e4f7	["*"]	2024-10-23 16:44:30	\N	2024-10-07 12:59:41	2024-10-23 16:44:30
399	App\\Models\\User	99	api	c0cad694e91e6ae6b7e726b14466fec515e672703558120f2e108f02f474de61	["*"]	2024-08-26 09:59:04	\N	2024-08-26 09:53:14	2024-08-26 09:59:04
522	App\\Models\\User	97	api	71b585df9086ea9f363ffd4620bd47c0e7f6f705beb6c909dcf979d5c7ccfdb8	["*"]	2024-09-13 05:52:58	\N	2024-09-12 15:10:03	2024-09-13 05:52:58
907	App\\Models\\User	199	api	9c9fd981149e5eddb3a7e33646a8ad9260abe7f1e1901be7d433981a643a52b5	["*"]	2024-11-14 19:18:24	\N	2024-11-01 22:54:09	2024-11-14 19:18:24
645	App\\Models\\User	145	api	3239169a2abe0dcacbba9d9dc1ce0381f1a3f588f09d1b270bc6af91ac285344	["*"]	2024-09-28 19:42:55	\N	2024-09-28 19:42:46	2024-09-28 19:42:55
760	App\\Models\\User	185	api	ec246de264b0b8f13244885d1b8e57d238f0b1f0cb25ef376d835a988e1e2201	["*"]	\N	\N	2024-10-09 09:52:09	2024-10-09 09:52:09
766	App\\Models\\User	190	api	d950ee3a43e1dc2671499fea3bdffc56d99770a1c3dcf61c48622d34d8b82267	["*"]	\N	\N	2024-10-09 10:01:06	2024-10-09 10:01:06
499	App\\Models\\User	126	api	df91e9516b30586b22ba2db8d3671ec708a4a51c0fb9f2ec99f3a23f5251779f	["*"]	2024-09-11 01:03:15	\N	2024-09-10 20:34:11	2024-09-11 01:03:15
462	App\\Models\\User	123	api	fa1cc46593168e6fb4b98ab7e1388ed06a13bd3ae691964df70ca555c2d47811	["*"]	2024-09-03 16:44:25	\N	2024-09-03 16:13:54	2024-09-03 16:44:25
260	App\\Models\\User	80	api	a14b5c4139e391bbd7f9bb9c46d964640030f0e7f5bc38c5d343cc526bed94da	["*"]	\N	\N	2024-08-19 10:04:53	2024-08-19 10:04:53
220	App\\Models\\User	77	api	ccdc84282ababcfb33de71e2adc7c01187bd65ce499649d44764427639fdcdc4	["*"]	2024-08-17 11:30:03	\N	2024-08-16 06:37:34	2024-08-17 11:30:03
273	App\\Models\\User	82	api	70e73dbe6b8d53c34bd807d84895f6ea309e9e4f27adcb8d12e446e7cb4ea611	["*"]	\N	\N	2024-08-19 16:27:57	2024-08-19 16:27:57
302	App\\Models\\User	77	api	9db4fa76416e8d6fc774908f3aafad5ff023051b57fec8dcaead67a86132eb7f	["*"]	2024-08-20 13:13:16	\N	2024-08-20 13:13:09	2024-08-20 13:13:16
564	App\\Models\\User	143	api	34470d8f3385c1281c2ffba9ccf1852171090cf75bdeb2ff2008260a1de609fb	["*"]	2024-09-20 13:21:33	\N	2024-09-20 13:21:18	2024-09-20 13:21:33
411	App\\Models\\User	99	api	b0c1dc440cd292b812b0da942c21abb6c32ae7e1bf35a40a86068711b238459a	["*"]	2024-08-26 17:26:08	\N	2024-08-26 16:40:29	2024-08-26 17:26:08
697	App\\Models\\User	163	api	7e6e7cbb6034e19df887ebec904e4431846b7a00a5a0699d6548c2c9da909be2	["*"]	2024-10-02 16:19:19	\N	2024-10-02 16:17:21	2024-10-02 16:19:19
252	App\\Models\\User	75	api	a1287a08cab553492f4ad11b68393e75fde2ee9ee47d38dccc0dd0caad7e8e72	["*"]	\N	\N	2024-08-18 13:48:21	2024-08-18 13:48:21
447	App\\Models\\User	115	api	fca76ba1018c4d521f668a17cc28abcb98955be04b4585f056e0b4c9b15b363e	["*"]	2024-09-03 07:02:02	\N	2024-09-03 05:16:43	2024-09-03 07:02:02
526	App\\Models\\User	99	api	30d8f5fb18429beaea77f9a4a250380b797fc80cc8037242ad4bc8ad5d013204	["*"]	2024-09-17 14:14:45	\N	2024-09-13 12:56:42	2024-09-17 14:14:45
763	App\\Models\\User	187	api	9835368786e72ea509d198a4e878c32e2ca0c4ca519dfe415592f63055c1f563	["*"]	\N	\N	2024-10-09 09:55:40	2024-10-09 09:55:40
718	App\\Models\\User	51	api	ce3bcfe64122814eb8a189252995acab76f9bd7596f8d6461b5fda5e2f300a0b	["*"]	\N	\N	2024-10-07 11:59:22	2024-10-07 11:59:22
467	App\\Models\\User	85	api	beb47273217db01b1768b2a0cc4066877f865b557cd65835ac2de1f41335403a	["*"]	2024-09-05 23:32:41	\N	2024-09-05 20:05:24	2024-09-05 23:32:41
721	App\\Models\\User	129	api	d5921b125ac9ff65d768809173e8923b567563d5af534472aaa55051b7304cdb	["*"]	\N	\N	2024-10-07 12:43:47	2024-10-07 12:43:47
757	App\\Models\\User	182	api	20bda72c5247e8498858624132a0f5d3682edd5dfd3e3a6977a8448994deb612	["*"]	\N	\N	2024-10-09 09:46:54	2024-10-09 09:46:54
702	App\\Models\\User	162	api	be4824cd8f2a7c1232383408f1d8e0a67237920758e7b96944ad3734ebb6568d	["*"]	2024-10-03 14:11:57	\N	2024-10-03 14:07:44	2024-10-03 14:11:57
607	App\\Models\\User	147	api	8482aef5876814872fcc970ac9e2d086cbda631936a27148896b2d34266afa36	["*"]	2024-09-24 14:43:53	\N	2024-09-24 13:38:22	2024-09-24 14:43:53
248	App\\Models\\User	77	api	ba6b1ea907db624a75819aefa69f1ff8e91ce4f89c6e27a5e7fed645489c1b11	["*"]	2024-08-18 13:20:15	\N	2024-08-18 13:13:31	2024-08-18 13:20:15
274	App\\Models\\User	82	api	64c1430be86fa4e732f188a2254a4e914c40e0f12e38867118e3cba740995608	["*"]	\N	\N	2024-08-19 16:28:14	2024-08-19 16:28:14
727	App\\Models\\User	133	api	6ca47d067fd51eef35538e4cf500dbb273ba6af87ddf8e663c52ab41e581649f	["*"]	\N	\N	2024-10-07 13:02:48	2024-10-07 13:02:48
887	App\\Models\\User	206	api	dd7660c54192e2f57ffeaf8080d8e8e2881278a246b690aa155fa4779e1471f6	["*"]	2024-10-24 04:42:00	\N	2024-10-24 04:41:55	2024-10-24 04:42:00
239	App\\Models\\User	75	api	eeb1b952a035900431806db97272a91ff405cf8881f8966e69015c7e1aa1f813	["*"]	\N	\N	2024-08-17 16:51:36	2024-08-17 16:51:36
251	App\\Models\\User	75	api	703382b7fc56630e6944a227a2a9a5a638f222fb72123614ff87b6fc632ef771	["*"]	2024-08-19 14:07:05	\N	2024-08-18 13:40:10	2024-08-19 14:07:05
798	App\\Models\\User	196	api	03cbcc88ccbb931a897416c6cb74a4300ab63591dd62e57d6c3ec45bd136d29c	["*"]	\N	\N	2024-10-10 08:22:11	2024-10-10 08:22:11
899	App\\Models\\User	209	api	7645084d5971b462cc77837632e6eaf9afbafeb44b927148a409b20c0dd03244	["*"]	2024-10-29 09:25:29	\N	2024-10-29 09:11:50	2024-10-29 09:25:29
258	App\\Models\\User	79	api	fe7d93f4e2a0bc596bd58392745d0089c4a490a89f206b8dd76beb542ec9a481	["*"]	\N	\N	2024-08-19 08:38:09	2024-08-19 08:38:09
904	App\\Models\\User	212	api	a03d664dda1b35aca4e33640855c5da929f2d51da2370e57944c03652dcebaca	["*"]	2024-10-31 14:40:46	\N	2024-10-31 14:40:27	2024-10-31 14:40:46
254	App\\Models\\User	77	api	94d1c5ee2e55c0d64bdb41ff1e656772e104ce5a97bf9cff3de6a59258f6631f	["*"]	2024-08-19 16:06:11	\N	2024-08-18 14:36:30	2024-08-19 16:06:11
271	App\\Models\\User	75	api	8b521faeac527961d288c8446411143245b91f02e5bc5562a6f9a92a41503be4	["*"]	\N	\N	2024-08-19 16:11:38	2024-08-19 16:11:38
913	App\\Models\\User	214	api	692d7d94301062c153cd00820fdce55df62d2ab5c566511c31272599eac8fe7c	["*"]	2024-11-04 11:47:32	\N	2024-11-02 22:10:33	2024-11-04 11:47:32
916	App\\Models\\User	216	api	759e603eb7a2db69f9b1674aa4696a9c98c0453decd54ee2d679673f838e1912	["*"]	\N	\N	2024-11-04 11:48:53	2024-11-04 11:48:53
247	App\\Models\\User	77	api	9a0a8b0b9a6baa7097f476a418a4de42958b1c4083d2abd6512e224657e563d3	["*"]	2024-08-19 14:27:54	\N	2024-08-18 13:09:13	2024-08-19 14:27:54
272	App\\Models\\User	77	api	2f141a615a785a0766c28d28f72e23e51bfbb85369ab4cc257c8d787cfcd9db6	["*"]	\N	\N	2024-08-19 16:12:25	2024-08-19 16:12:25
262	App\\Models\\User	75	api	87346308daa4530d1f38189ef705e0244ce1f9a19ce51dae2a32909ed8f87de8	["*"]	2024-08-19 18:19:25	\N	2024-08-19 11:10:17	2024-08-19 18:19:25
343	App\\Models\\User	93	api	d391c51d8207482ce1b75a6f47937be8ba8ebeccbef1b362b1ff35d8b9f498b8	["*"]	2024-08-21 15:47:12	\N	2024-08-21 13:34:36	2024-08-21 15:47:12
428	App\\Models\\User	30	api	e03a676720461e8e8ef57aaea6fc22bb5de964d143d81d5da7fe3c7e6d460111	["*"]	\N	\N	2024-08-29 13:36:05	2024-08-29 13:36:05
914	App\\Models\\User	193	api	d52cf80e39e32cfb6f561cb13a0a45faf072498f9c789eb117888e588c90360a	["*"]	\N	\N	2024-11-04 11:38:32	2024-11-04 11:38:32
463	App\\Models\\User	99	api	0c0e35067a0d16346d268755a06555d4f57e3c813a1c6cd09576d980a800066b	["*"]	2024-09-11 10:31:47	\N	2024-09-03 16:37:45	2024-09-11 10:31:47
573	App\\Models\\User	1	api	58c14e2e0a3570e75c16927b53b2f3b5edeb0d63af95431e11a2e92177299810	["*"]	\N	\N	2024-09-23 11:45:08	2024-09-23 11:45:08
311	App\\Models\\User	86	api	82d74de82a411131938b0433f239f5802edab314519bf398a3f983b47886b444	["*"]	\N	\N	2024-08-20 16:19:09	2024-08-20 16:19:09
346	App\\Models\\User	94	api	025dafa46d23f691047e59a25b89b0caee604692f1209bdfd70262ae62a57297	["*"]	\N	\N	2024-08-21 14:23:50	2024-08-21 14:23:50
347	App\\Models\\User	94	api	7d8a469532e159f65e907263395c6bc7d0c479fcb9fd266b099c0547fcd444cc	["*"]	\N	\N	2024-08-21 14:23:57	2024-08-21 14:23:57
448	App\\Models\\User	99	api	d8be1cc57d015d8b3f68e3ae306e4a88cfa9da0493100fc6a7aa0b2f1e3f78d1	["*"]	2024-09-03 08:18:46	\N	2024-09-03 08:12:06	2024-09-03 08:18:46
707	App\\Models\\User	166	api	7fdd27614d31ccd5b20c07fbd52656157f61327cb5fc7a3f2ff00dd0c17d6cc1	["*"]	2024-10-04 12:35:17	\N	2024-10-04 12:02:46	2024-10-04 12:35:17
719	App\\Models\\User	168	api	f0c54c6553c84e38492023f79ca055ce68f7817cec1efc6ae0aadb639657758d	["*"]	2024-10-07 18:21:22	\N	2024-10-07 12:08:46	2024-10-07 18:21:22
698	App\\Models\\User	164	api	83bb1ed0fba5bbb90c349d1af7431d135d6c95a6b5f81eb5ce7684a472abad99	["*"]	2024-10-02 16:22:23	\N	2024-10-02 16:22:05	2024-10-02 16:22:23
315	App\\Models\\User	86	api	b7fcf4e90641be29a3d985ceb02dbba232aa39f03c7280be13eb1f824cb1a75c	["*"]	\N	\N	2024-08-20 17:02:35	2024-08-20 17:02:35
316	App\\Models\\User	89	api	c560fca19ac86ee7a539156901bcdb11f019be77388172b452105ad14d2b0f9f	["*"]	\N	\N	2024-08-20 17:04:20	2024-08-20 17:04:20
565	App\\Models\\User	143	api	67924a52399f9def3764cb3c995bcf897862a717c8aaa519b724dbaa88e6f868	["*"]	2024-09-23 18:24:06	\N	2024-09-20 13:23:19	2024-09-23 18:24:06
620	App\\Models\\User	143	api	c839bda1377f6678ab66b2413b8a2922de52fa5568bd5c0824630f23bca1dd0c	["*"]	2024-09-30 13:32:39	\N	2024-09-25 09:37:54	2024-09-30 13:32:39
519	App\\Models\\User	97	api	63a194f5b6d397ca550f04989fdebe9087b2191d809f01b97d0c69171fe41a51	["*"]	2024-09-12 05:23:09	\N	2024-09-11 20:57:08	2024-09-12 05:23:09
420	App\\Models\\User	104	api	1955b69aa4f765eef8cfe72cb33341da536e417e7f0acbd7ccb78784e1b314eb	["*"]	2024-08-28 13:31:17	\N	2024-08-28 13:31:15	2024-08-28 13:31:17
468	App\\Models\\User	68	api	340f87f41f04a4ab8e748b0b60a2f7055b3f9b9048c1c22520609cf9ac6c36d3	["*"]	2024-10-14 16:54:14	\N	2024-09-06 16:55:16	2024-10-14 16:54:14
952	App\\Models\\User	237	api	0ef5c8b9764021957f36d7cfdbfe59476207a30853321c4f1b9cad639b11b925	["*"]	2024-11-07 21:17:08	\N	2024-11-06 12:58:16	2024-11-07 21:17:08
523	App\\Models\\User	136	api	97d5872796502585d5d404d4b2f28e3b035fcf5a5718fc45604148bf8b6eeed7	["*"]	2024-11-08 07:01:49	\N	2024-09-13 07:03:19	2024-11-08 07:01:49
828	App\\Models\\User	202	api	4ecbac8b44124db4dae3e793d0644c3c0fc2f65c15b91be630179c6b0c3d07b7	["*"]	2024-10-24 09:54:20	\N	2024-10-15 16:34:00	2024-10-24 09:54:20
408	App\\Models\\User	83	api	31425a92687429f1c7bd0008d038a196239892208dd1e37605f99eee9588abcd	["*"]	2024-10-09 11:29:06	\N	2024-08-26 14:19:12	2024-10-09 11:29:06
754	App\\Models\\User	179	api	d7126a82712c61fac6b764e5368a5814c54d10450aedc49fbbee338db8875b57	["*"]	\N	\N	2024-10-09 09:29:18	2024-10-09 09:29:18
761	App\\Models\\User	186	api	890484850a97fca3b8f3818fd69f02cdef02aaf882b064f212f42d14def543ae	["*"]	\N	\N	2024-10-09 09:53:15	2024-10-09 09:53:15
758	App\\Models\\User	183	api	f45ba9a4e301e0588097addd1cfc166d463e7b6694f9d8760a3e92ca2874f274	["*"]	\N	\N	2024-10-09 09:49:34	2024-10-09 09:49:34
764	App\\Models\\User	188	api	f6c24e0e71c706380a3baf4f2ae059a17a2709cc8d2b031696b48c78d7b16fa2	["*"]	\N	\N	2024-10-09 09:57:38	2024-10-09 09:57:38
888	App\\Models\\User	205	api	d6fe999963c0909d3f0b5630a8934102b9b65fe9905ee5a8f061a0cc6eb45a23	["*"]	2024-10-24 12:00:43	\N	2024-10-24 05:17:13	2024-10-24 12:00:43
796	App\\Models\\User	194	api	c095af113deb183fdd499a9a46cd8625b06055ff969b6fcf0c7338213f2eba8e	["*"]	\N	\N	2024-10-10 08:14:35	2024-10-10 08:14:35
902	App\\Models\\User	173	api	273a5b3821bf1c60cd8dbd833174c787cd77098caedec12ea86d00de4be905ca	["*"]	2024-11-01 23:14:33	\N	2024-10-30 11:16:56	2024-11-01 23:14:33
357	App\\Models\\User	95	api	6227e4220d0ace8b1e8647dbd0220ecf588a2750d88e9aa61ac81a44099578a5	["*"]	2024-08-21 15:31:51	\N	2024-08-21 15:16:28	2024-08-21 15:31:51
919	App\\Models\\User	217	api	8161c96d8db22cde81a109b65ea81bbf60cc0f4368dd48c17b31caccf0e1cbab	["*"]	2024-11-04 13:15:35	\N	2024-11-04 13:15:28	2024-11-04 13:15:35
351	App\\Models\\User	94	api	daf2cf6e072c5001f81ee8f16dfdc80b9d6cc34454c04f16b3159df7745be3f0	["*"]	\N	\N	2024-08-21 14:54:46	2024-08-21 14:54:46
352	App\\Models\\User	94	api	e6fe0ee7b4701fe8aedac9137cf8fa680f3035dce7449b34b163321b97460c1a	["*"]	\N	\N	2024-08-21 14:55:21	2024-08-21 14:55:21
356	App\\Models\\User	95	api	709fcf29f5f2d732bd5e1fbb9884f5f12a454144d1c1f8ca2380e5d988d11cf6	["*"]	\N	\N	2024-08-21 15:13:57	2024-08-21 15:13:57
787	App\\Models\\User	191	api	5fd07f038389628f6fed72c8d86c4208592d1796305d99b725f429c7684908fd	["*"]	2024-11-13 15:34:37	\N	2024-10-09 19:49:05	2024-11-13 15:34:37
361	App\\Models\\User	97	api	0a57102ae7afd55bc9a3429d079f7483f98b737bfb9f8e50493f47ba5eb3d1ab	["*"]	2024-08-21 17:29:27	\N	2024-08-21 15:34:20	2024-08-21 17:29:27
353	App\\Models\\User	94	api	f92de1ee089c88463baf6c509f71c9bab4e0134426f6381928e590033f32db72	["*"]	\N	\N	2024-08-21 15:00:04	2024-08-21 15:00:04
931	App\\Models\\User	226	api	e416464c82b6ed97d1b0e390513384fe3705db3bc29888419e4bf8ac5f571a9c	["*"]	2024-11-05 09:21:16	\N	2024-11-05 09:20:45	2024-11-05 09:21:16
374	App\\Models\\User	74	api	2864752b75da2315021a0d3e1ac3ad0465e4a9812f7870c9021686051ca385b9	["*"]	2024-08-23 08:19:16	\N	2024-08-23 08:19:11	2024-08-23 08:19:16
846	App\\Models\\User	201	api	0ddb0a939493b3c4fbd4f02ad1447b7847d38bd61596940138fb8ed83b90d4f4	["*"]	\N	\N	2024-10-19 08:25:24	2024-10-19 08:25:24
365	App\\Models\\User	92	api	fc045e185beaa26a8144b83f55b574f94862b1c432baab7dbca8af8fdb39142e	["*"]	2024-08-21 16:40:17	\N	2024-08-21 16:08:24	2024-08-21 16:40:17
935	App\\Models\\User	227	api	a30868418581ca664a25aae723a86033c6db0f9a18a3ffe9fe2b0d3babc14253	["*"]	2024-11-05 09:35:42	\N	2024-11-05 09:35:18	2024-11-05 09:35:42
363	App\\Models\\User	99	api	cfa972631637e154cefbeb4555b6c791f408f8394d9c4e03e3e98a829f3dba1b	["*"]	2024-08-23 11:32:00	\N	2024-08-21 16:04:07	2024-08-23 11:32:00
390	App\\Models\\User	84	api	e50809ef43fc703c1e9894d5b96f0529f93047d32cdc63863e6c024746a7bda8	["*"]	2024-08-23 20:12:22	\N	2024-08-23 19:47:27	2024-08-23 20:12:22
1009	App\\Models\\User	60	api	6f4f3f09593afc19294f4d31ec5cd5633e58d53a88799cc49699db1cf9d050f8	["*"]	2024-11-18 00:17:36	\N	2024-11-17 23:19:52	2024-11-18 00:17:36
938	App\\Models\\User	230	api	f14fe103ca0a16422c0492293375242bb1518a49ebd26beaccdde8f742c647dd	["*"]	2024-11-05 12:35:59	\N	2024-11-05 12:35:46	2024-11-05 12:35:59
944	App\\Models\\User	234	api	b0394415f9e15f062a443e1051c8d534bcab51e713a0df2e240046d48d24cb42	["*"]	2024-11-06 05:27:04	\N	2024-11-05 23:29:32	2024-11-06 05:27:04
954	App\\Models\\User	229	api	edc5ca671a06878f228b0d45e01ba72049c9d5696a514968c4c8f2a46e85e4ed	["*"]	2024-11-06 15:48:41	\N	2024-11-06 15:47:28	2024-11-06 15:48:41
991	App\\Models\\User	203	api	e2f5aa823d64432efacf22e1f08a255ac34e748d490ff66ba6c880495672cb98	["*"]	2024-11-08 09:59:16	\N	2024-11-08 09:04:46	2024-11-08 09:59:16
1008	App\\Models\\User	231	api	09ac1b50e69bba1e1a76d187c2137ce3dd44cc79cbb63e7a7894ddef1833cc8e	["*"]	2024-11-16 12:42:59	\N	2024-11-16 08:01:13	2024-11-16 12:42:59
974	App\\Models\\User	238	api	ba04d05ad50045b9656fdab2f07afcb1ca244e020724e465f64d9d121c50eed6	["*"]	2024-11-07 16:54:59	\N	2024-11-07 16:54:41	2024-11-07 16:54:59
975	App\\Models\\User	241	api	034f9748bb5c301e76435b3955c4b9571ea5567aaf2c70ac24ae2fb5b5a194fa	["*"]	2024-11-07 16:59:09	\N	2024-11-07 16:58:42	2024-11-07 16:59:09
994	App\\Models\\User	243	api	3df8023df627ebd5ea5e8c0b28713044085e77b33ca5445951b002e6500cb138	["*"]	2024-11-08 11:29:22	\N	2024-11-08 09:30:01	2024-11-08 11:29:22
972	App\\Models\\User	232	api	83603060e042c1d37f796ec8fdbd0d044b6c6209150232da8b80315a921af82a	["*"]	2024-11-07 12:10:17	\N	2024-11-07 12:07:33	2024-11-07 12:10:17
976	App\\Models\\User	242	api	945da7ad802b5e2913d3c92dfd650eff44917307d335e372235d9a7322e7c730	["*"]	2024-11-07 17:15:30	\N	2024-11-07 17:03:36	2024-11-07 17:15:30
990	App\\Models\\User	112	api	7e4c3d3d9618cdc6d8c58d45d7e51e97e6071ffdd2d13b313af62ec04ef533d6	["*"]	\N	\N	2024-11-08 04:35:14	2024-11-08 04:35:14
992	App\\Models\\User	203	api	ce74d199480fc7e860ce38fd2c2e44243e0c94a776592ee8791f1b640254bbea	["*"]	2024-11-08 09:27:55	\N	2024-11-08 09:07:13	2024-11-08 09:27:55
1006	App\\Models\\User	244	api	db8bd5d38c20380e203a2411b9b278a5c61fe49a14fb37dd677620942c5c55dc	["*"]	2024-11-12 10:46:15	\N	2024-11-12 10:44:39	2024-11-12 10:46:15
1001	App\\Models\\User	231	api	65e4caafe60d4955dd11c849654f62b4720e8d25b238a95d439d1a05cdd36bdc	["*"]	2024-11-08 16:10:10	\N	2024-11-08 15:59:18	2024-11-08 16:10:10
956	App\\Models\\User	239	api	169dc9ec083d3f93ac550ba95a4f6795b89e8040e81f784e1f1258dd8d21ea3f	["*"]	2024-11-08 07:34:08	\N	2024-11-06 15:50:58	2024-11-08 07:34:08
1005	App\\Models\\User	235	api	b2f32cfb640cfd1fa6328914f0a66dd32031ad730535bfb3cab3e3789e1354c5	["*"]	2024-11-15 21:49:48	\N	2024-11-12 08:28:18	2024-11-15 21:49:48
1007	App\\Models\\User	231	api	cb25b3d53bdf1ef670189369ceb91c9ce9ad8c5e5d6e82ca2b3a213426deabe0	["*"]	2024-11-13 12:53:27	\N	2024-11-12 10:55:47	2024-11-13 12:53:27
\.


--
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_categories (id, name, image, active, sort_order, is_remarks, remarks_title, user_id, deleted_at, created_at, updated_at) FROM stdin;
1	Cake	66208abdc943f_1713408701.jpg	1	0	1	Tell us what to write on the cake?	4	\N	2024-04-18 02:51:41	2024-04-18 02:51:41
2	Accessories	6636278ecd4aa_1714825102.jpg	1	0	0	\N	4	\N	2024-05-04 16:18:22	2024-05-04 16:18:22
3	Flowers	663f3ec247657_1715420866.jpg	1	0	1	Color of Flower	8	\N	2024-05-11 13:47:46	2024-05-11 13:47:46
42	Cake	671a1d9050759_1729764752.jpg	1	0	1	What should write on the cake	207	\N	2024-10-24 10:12:32	2024-10-24 17:12:19
43	Cake	672b545f614a5_1730892895.jpg	1	0	1	What should write on cake	235	\N	2024-11-06 11:34:55	2024-11-06 11:34:55
41	abc	6705df85886a8_1728438149.jpg	1	0	0	\N	60	2024-11-06 15:43:47	2024-10-09 01:42:29	2024-11-06 15:43:47
4	Flowers	6641b4fef0cdd_1715582206.jpg	1	0	0	\N	15	\N	2024-05-13 10:36:46	2024-05-13 10:37:16
5	Cake	6643334dd8433_1715680077.jpg	1	0	1	Tell us what to write on the cake	8	\N	2024-05-14 13:47:57	2024-05-14 13:47:57
6	Accessories	664336bd3cc09_1715680957.jpg	1	0	0	\N	8	\N	2024-05-14 14:02:37	2024-05-14 14:02:37
7	First Category	66b1c583c5331_1722926467.png	1	0	1	test tityle	59	\N	2024-08-06 06:41:07	2024-08-06 06:41:07
10	ategory 1	66ba2c07e392d_1723476999.png	1	0	1	test tityle	69	\N	2024-08-12 15:36:39	2024-08-12 15:36:39
11	test cat	66ba6baf5fb39_1723493295.jpg	1	0	1	test	69	\N	2024-08-12 20:08:15	2024-08-12 20:08:15
12	Cake	66badd88001ed_1723522440.jpg	1	0	1	Cake name	68	\N	2024-08-13 04:14:00	2024-08-13 04:14:00
13	Baloon	66badf3818750_1723522872.jpg	1	0	1	What name write on baloon	68	\N	2024-08-13 04:21:12	2024-08-13 04:21:12
8	package catergory 01	66b34de001106_1723026912.png	1	0	1	package category title	60	2024-08-15 09:42:12	2024-08-07 10:35:12	2024-08-15 09:42:12
9	Category Two	66b3b32c589fc_1723052844.jpg	1	0	1	Title	60	2024-08-15 09:42:34	2024-08-07 17:47:24	2024-08-15 09:42:34
14	Category Cake	66bd979bc4b7e_1723701147.jpg	1	0	1	Add name on cake	60	\N	2024-08-15 05:52:27	2024-08-15 05:52:27
15	Cake	66bf1176b57ef_1723797878.jpg	1	0	1	What have to write on cake	76	\N	2024-08-16 08:44:38	2024-08-16 08:44:38
16	Baloon	66bf172b1d8ab_1723799339.jpg	1	0	0	\N	76	\N	2024-08-16 09:08:59	2024-08-16 09:08:59
17	Flower	66c2ec57a42c2_1724050519.jpg	1	0	1	Write on flower tag	60	\N	2024-08-19 06:55:19	2024-08-19 06:55:19
18	Flower Boquet	66c4fdd4960fc_1724186068.jpg	1	0	1	Whats write on the tag	91	\N	2024-08-20 20:34:28	2024-08-20 20:34:28
19	Cake	66cc3a384b67a_1724660280.jpg	1	0	1	What have write on cake	102	\N	2024-08-26 08:18:00	2024-08-26 12:19:05
20	test	66d711f98eb3e_1725370873.jpg	1	0	1	test	120	\N	2024-09-03 13:41:13	2024-09-03 13:41:13
21	Balloon	66e1abdc46c9c_1726065628.jpg	1	0	1	Yes! Here You write your wish	133	\N	2024-09-11 14:40:28	2024-09-11 14:40:28
22	cakes	66e1ad124dd68_1726065938.jpg	1	0	1	Make A Wish	133	\N	2024-09-11 14:45:38	2024-09-11 14:45:38
23	Flowers	66e1ad35e5508_1726065973.jpg	1	0	0	Give them	133	\N	2024-09-11 14:46:13	2024-09-11 14:46:13
24	Cake	66e7c6e05d1fe_1726465760.jpg	1	0	0	\N	131	\N	2024-09-16 05:49:20	2024-09-16 05:49:20
26	Balloons	66e7c700c2c94_1726465792.jpg	1	0	0	\N	131	\N	2024-09-16 05:49:52	2024-09-16 05:49:52
25	Flowers	66e7c6f059904_1726465776.jpg	1	0	0	\N	131	\N	2024-09-16 05:49:36	2024-09-16 09:51:25
27	Cake	66f150d5dd4c8_1727090901.jpeg	1	0	0	\N	129	\N	2024-09-23 11:28:21	2024-09-23 11:28:21
28	Decorations	66f150f45b495_1727090932.jpg	1	0	0	\N	129	\N	2024-09-23 11:28:52	2024-09-23 11:28:52
29	Fliwers	66f151035310d_1727090947.jpg	1	0	0	\N	129	\N	2024-09-23 11:29:07	2024-09-23 11:29:07
30	Cake	66fbc4541960d_1727775828.jpg	1	0	1	Home made Pastries	161	\N	2024-10-01 09:43:48	2024-10-01 09:43:48
31	Flowers	66fbc483cc781_1727775875.jpg	1	0	1	Fresh flowers	161	\N	2024-10-01 09:44:35	2024-10-01 09:44:35
32	Decorations	66fbc4b9f298d_1727775929.jpg	1	0	1	Dreamy beautiful decorations	161	\N	2024-10-01 09:45:29	2024-10-01 09:45:29
33	Food And Drinks	66fbc55912d43_1727776089.jpg	1	0	1	Home Made Food & Drinks	161	\N	2024-10-01 09:48:09	2024-10-01 09:48:09
34	Food	66fbca638471f_1727777379.jpg	1	0	1	Food	159	\N	2024-10-01 10:09:39	2024-10-01 10:09:39
35	Test	66fbfb3f2fc81_1727789887.jpg	1	0	1	Hi	60	\N	2024-10-01 13:38:07	2024-10-01 13:38:07
39	Boqute	6706096ed34a7_1728448878.jpg	1	0	0	\N	174	\N	2024-10-09 01:20:56	2024-10-09 08:41:18
40	Flower@Boquest	6705dc3af0623_1728437306.jpg	1	0	1	Gift Message	174	\N	2024-10-09 01:28:26	2024-10-24 17:01:05
37	Cake	6705d891c1436_1728436369.jpg	1	0	1	What should write on the cake	174	\N	2024-10-09 01:12:49	2024-10-24 17:01:28
38	Flower	6705d9239ff78_1728436515.jpg	1	0	1	Gift Message	174	\N	2024-10-09 01:15:15	2024-10-24 17:02:18
44	Flower	672b5c1d7ba92_1730894877.jpg	1	0	0	\N	235	\N	2024-11-06 12:07:57	2024-11-06 12:07:57
45	car	672b7e85a016b_1730903685.jpg	1	0	0	\N	239	\N	2024-11-06 14:34:45	2024-11-06 14:34:45
36	naja three	670534c973270_1728394441.jpg	1	0	1	ccg	60	2024-11-07 11:22:18	2024-10-08 13:34:01	2024-11-07 11:22:18
46	New category	672c6acdcefe3_1730964173.jpg	1	0	1	Hi re.arks	60	2024-11-07 11:23:07	2024-11-07 07:22:53	2024-11-07 11:23:07
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, image, price, active, user_id, category_id, deleted_at, created_at, updated_at, description) FROM stdin;
3	Party Time 33-Pieces Gold 16" EID MUBARAK Balloon Letter Balloons	66362a61c5439_1714825825.jpg	20.00	1	4	2	\N	2024-05-04 16:30:25	2024-05-04 16:30:25	\N
4	Disposable Glass	66362dea2508a_1714826730.jpg	10.00	1	4	2	\N	2024-05-04 16:45:30	2024-05-04 16:45:30	\N
1	Red Birthday Cake	66362e34dec6b_1714826804.png	100.00	1	4	1	\N	2024-04-18 02:56:45	2024-05-04 16:46:44	\N
2	Birthday Cake with Candles	66362ee33e713_1714826979.png	15.00	1	4	1	\N	2024-04-19 14:53:23	2024-05-04 16:49:39	\N
5	Disposable Plates 1 Packet	66362f37519e0_1714827063.jpg	30.00	1	4	2	\N	2024-05-04 16:51:03	2024-05-04 16:51:03	\N
6	Frozen 2 Printed Latex Balloons 8 PCS	66362f9510268_1714827157.jpg	40.00	1	4	2	\N	2024-05-04 16:52:37	2024-05-04 16:52:37	\N
32	3rd product	66c4d10870152_1724174600.jpg	300.00	1	60	14	\N	2024-08-17 05:58:27	2024-08-20 17:23:20	Description
33	Red Rose	66c4ff3e79f10_1724186430.jpg	200.00	1	91	18	\N	2024-08-20 20:40:30	2024-08-20 20:40:30	The first time the team had yyyyyyy was the best team ever to play for in a
7	Red Rose Bouquet 2	6641b5fa7a63a_1715582458.png	300.00	1	15	4	2024-05-13 10:41:21	2024-05-13 10:40:58	2024-05-13 10:41:21	\N
8	Red Rose Bouquet	6641b636b1225_1715582518.png	200.00	1	15	4	\N	2024-05-13 10:41:58	2024-05-13 10:41:58	\N
9	Mix Flowers Bouquet	6641b65c956bd_1715582556.jpg	250.00	1	15	4	\N	2024-05-13 10:42:36	2024-05-13 10:42:36	\N
10	Vanila Cake	664334857a9ca_1715680389.png	500.00	1	8	5	\N	2024-05-14 13:53:09	2024-05-14 13:53:09	\N
11	Red Birthday Cake	664334b64c9da_1715680438.png	1000.00	1	8	5	\N	2024-05-14 13:53:58	2024-05-14 13:53:58	\N
12	Pink Flowers	664334f5b29d1_1715680501.jpg	30.00	1	8	3	\N	2024-05-14 13:55:01	2024-05-14 13:55:01	\N
13	Red Rose Bouquet	664335495b62f_1715680585.jpg	60.00	1	8	3	\N	2024-05-14 13:56:25	2024-05-14 13:57:15	\N
15	Disposible Glass	66433865b4630_1715681381.jpg	10.00	1	8	6	\N	2024-05-14 14:09:41	2024-05-14 14:09:41	\N
16	Green and Golden Ballon	664338c949d96_1715681481.jpg	20.00	1	8	6	\N	2024-05-14 14:11:21	2024-05-14 14:11:21	\N
14	Blue and Golden Baloon	66433841aa04e_1715681345.jpg	20.00	1	8	6	\N	2024-05-14 14:09:05	2024-05-14 14:13:56	\N
17	First Product	66b1c5a5e468b_1722926501.png	600.00	1	59	7	\N	2024-08-06 06:41:41	2024-08-06 06:41:41	description
18	SecondProduct	66b1c703c14cc_1722926851.png	600.00	1	59	7	\N	2024-08-06 06:47:31	2024-08-06 06:47:31	description
34	Merry Joy	66cc3ba79e805_1724660647.jpg	200.00	1	102	19	\N	2024-08-26 08:23:40	2024-08-26 08:24:07	The only way I could do that was if you wanted me too
35	abc	66d710e0a2761_1725370592.jpg	500.00	1	60	14	\N	2024-09-03 13:36:32	2024-09-03 13:36:32	Test
21	wbab	66ba6ed4e2942_1723494100.jpg	500.00	1	69	10	2024-08-13 00:31:18	2024-08-12 17:02:40	2024-08-13 00:31:18	Test
22	Birthday baloon	66badf9e94cc1_1723522974.jpg	100.00	1	68	13	\N	2024-08-13 04:22:54	2024-08-13 04:22:54	Make your birthday unforgettable with wide selection of balloons, perfect for ages 1 to 60
23	Plum cake	66badffd10ac1_1723523069.jpg	100.00	1	68	12	\N	2024-08-13 04:24:29	2024-08-13 04:24:29	Plum cake
19	Product add 001	66b352a50bdd0_1723028133.png	600.00	1	60	8	2024-08-15 09:31:37	2024-08-07 10:55:33	2024-08-15 09:31:37	Product descrption
20	Produxt two edited	66b3b58d68233_1723053453.jpg	0.00	1	60	8	2024-08-15 09:31:40	2024-08-07 17:57:33	2024-08-15 09:31:40	Quantity
24	Birthday cake	66bd98110156c_1723701265.jpg	2500.00	1	60	14	2024-08-15 09:54:38	2024-08-15 05:54:25	2024-08-15 09:54:38	Quantity 01  pound
25	Birthday 🎂	66bd9851f27f3_1723701329.jpg	2500.00	1	60	14	\N	2024-08-15 05:55:29	2024-08-15 05:55:29	Hshshs
26	Bantibg cheese cake	66bf12d973693_1723798233.jpg	200.00	1	76	15	\N	2024-08-16 08:50:33	2024-08-16 08:50:33	Have a magical birthday with this Lazy Unicorn Cake!This 4kg cake serves up to 35 people. Please note that the top part is dummy. Please allow at least 48 hours for delivery
27	Aurora	66bf15156a54c_1723798805.jpg	60.00	1	76	15	\N	2024-08-16 09:00:05	2024-08-16 09:00:05	Auria and the rest of us have a great day pass on our great work to the lord for our
29	Birthday Red Baloon	66bf1766b11f1_1723799398.jpg	10.00	1	76	16	\N	2024-08-16 09:09:58	2024-08-16 09:09:58	How do I know that 🤔 😕 has a bright future in your world that
30	Happy birthday baloon	66bf17b0c50e0_1723799472.jpg	15.00	1	76	16	\N	2024-08-16 09:11:12	2024-08-16 09:11:12	Fghw hj I have been working with the company and the way they have a good sense
28	80' child	66bf1703e7124_1723799299.jpg	50.00	1	76	15	\N	2024-08-16 09:08:19	2024-08-16 09:55:07	Ghh and the rest of us have to go through a few of the best things we have done
31	Second product	66c03be0f03ca_1723874272.jpg	25.00	1	60	14	\N	2024-08-17 05:57:52	2024-08-17 05:57:52	This is product description
45	Balloons	66ed5c5a2421a_1726831706.jpg	100.00	1	131	26	\N	2024-09-20 11:28:26	2024-09-20 11:28:26	1 arch
36	vgg	66d7124238ae9_1725370946.jpg	500.00	1	120	20	\N	2024-09-03 13:42:26	2024-09-03 13:42:26	Ff
37	Flower	66e1ad62232f9_1726066018.jpg	100.00	1	133	23	\N	2024-09-11 14:46:58	2024-09-11 14:46:58	Flower Bouquet
38	Vanilla Cake	66e1ad958a9a4_1726066069.jpg	100.00	1	133	22	\N	2024-09-11 14:47:49	2024-09-11 14:47:49	Homemade Vanilla Cake
39	Vanilla Two Tier Cake	66e1addb1c815_1726066139.jpg	100.00	1	133	22	\N	2024-09-11 14:48:59	2024-09-11 14:48:59	Two Tier Best Quality Cake
40	Balloon Decor	66e1ae0d1e8df_1726066189.jpg	200.00	1	133	21	\N	2024-09-11 14:49:49	2024-09-11 14:49:49	Balloon Decorations
41	Mini Cakes	66e1ae3e94883_1726066238.jpg	100.00	1	133	22	\N	2024-09-11 14:50:38	2024-09-11 14:50:38	Mini cakes
42	Balloons decor	66e7c72a2acdf_1726465834.jpg	100.00	1	131	26	\N	2024-09-16 05:50:34	2024-09-16 05:50:34	Bunch of balloons
43	Flower Bouquet	66e7c8dad25e5_1726466266.jpg	100.00	1	131	25	\N	2024-09-16 05:57:46	2024-09-16 05:57:46	1 bouquet for birthday and we can usefor wedding also
44	Choclate cake	66ed5c79f3778_1726831737.jpg	300.00	1	131	24	\N	2024-09-16 05:58:34	2024-09-20 11:28:58	1kg cake
46	Flower Bouqet	66f1542117432_1727091745.jpg	100.00	1	129	29	\N	2024-09-23 11:42:25	2024-09-23 11:42:39	Bunch
47	CAKE	66f154d17576e_1727091921.jpg	100.00	1	129	27	\N	2024-09-23 11:45:21	2024-09-23 11:45:21	2kg chocolate cake
48	Yacht Decorations	66f1561ceb851_1727092252.jpg	200.00	1	129	28	\N	2024-09-23 11:50:52	2024-09-23 11:50:52	Balloon Decoration
49	Cake	66f26611cb1f8_1727161873.jpg	100.00	1	133	22	\N	2024-09-24 07:11:13	2024-09-24 07:11:13	2kg
50	Home Made pastries	66fbc4f825b3d_1727775992.jpg	25.00	1	161	30	\N	2024-10-01 09:46:32	2024-10-01 09:46:32	2 kg
51	Bouquet	66fbc5936c06f_1727776147.jpg	200.00	1	161	31	\N	2024-10-01 09:49:07	2024-10-01 09:49:07	1 bouquet
52	Food & Drinks	66fbca871781a_1727777415.jpg	200.00	1	159	34	\N	2024-10-01 10:10:15	2024-10-01 10:10:15	5
56	red rose	6705daf25dba1_1728436978.jpg	30.00	1	174	38	2024-10-09 05:26:21	2024-10-09 01:22:58	2024-10-09 05:26:21	Test
53	Product test	6705dd548bcca_1728437588.jpg	30.00	1	60	35	\N	2024-10-01 13:41:04	2024-10-09 01:33:08	This is produxt test with category test
57	test	6705df9d04635_1728438173.jpg	100.00	1	60	17	\N	2024-10-09 01:42:11	2024-10-09 01:42:53	Test
58	test av	6705dfca50890_1728438218.jpg	100.00	1	60	17	\N	2024-10-09 01:43:38	2024-10-09 01:43:38	Twst
59	Happy birthday cakr	6705e64410072_1728439876.jpg	50.00	1	76	15	\N	2024-10-09 02:11:16	2024-10-09 02:11:16	Happy birthday baloon
55	Red Rose Flower	670609d80b543_1728448984.jpg	54.00	1	174	38	\N	2024-10-09 01:22:08	2024-10-09 08:43:04	Js
60	Plum Cake	670609fa63376_1728449018.jpg	20.00	1	174	37	\N	2024-10-09 08:43:38	2024-10-09 08:43:38	\N
54	Lilly Flower	670609bd05ee8_1728448957.jpg	20.00	1	174	39	\N	2024-10-09 01:21:22	2024-10-09 08:44:27	Abv
61	choolate cake	671a1dc268dea_1729764802.jpg	200.00	1	207	42	\N	2024-10-24 10:13:22	2024-10-24 10:13:22	The first time the
62	Straberry Cake	671a1e24d3522_1729764900.jpg	200.00	1	207	42	\N	2024-10-24 10:15:00	2024-10-24 10:15:00	Straberry Cake
63	Chocolate cake	672b5496407d4_1730892950.jpg	120.00	1	235	43	\N	2024-11-06 11:35:50	2024-11-06 11:35:50	The first time the two sides agreed to meet
64	Rose Cream Cake	672b5b2332450_1730894627.jpg	200.00	1	235	43	\N	2024-11-06 12:03:47	2024-11-06 12:03:47	The Big Lie and I have a great
65	cv	672b7e9c5e586_1730903708.jpg	2500.00	1	239	45	\N	2024-11-06 14:35:08	2024-11-06 14:35:08	Ggg
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, meta_key, meta_value) FROM stdin;
1	tax	5
\.


--
-- Data for Name: socialdetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialdetails (id, title_en, title_ar, email, mobile, desc_en, desc_ar, location, latitude, longitude, twitter, instagram, facebook, youtube, linkedin, website_url, snap_chat, tiktok, cancellation_hours, created_at, updated_at) FROM stdin;
1	Placeat aliquip aut	Architecto sunt repe	info@gameclinic.com	987654321	Minim ipsum officii	Enim aspernatur quo	673C+W8X - Al Safa St - Dubai - United Arab Emirates			https://google.com	https://google.com	https://google.com	https://www.youtube.com/@GrayStillPlays	https://google.com	https://google.com	https://google.com	https://google.com	1	2024-10-05 17:13:28	2024-10-05 17:13:28
\.


--
-- Data for Name: special_day_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.special_day_rates (id, yatch_id, date, morning_from, morning_to, morning_rate, afternoon_from, afternoon_to, afternoon_rate, evening_from, evening_to, evening_rate, created_at, updated_at) FROM stdin;
2	19	2024-07-21	09:00:00	12:00:00	35	13:00:00	15:00:00	30	16:00:00	21:00:00	90	2024-07-18 10:45:03	2024-07-18 14:45:03
3	19	2024-07-18	09:00:00	12:00:00	35	13:00:00	15:00:00	30	16:00:00	21:00:00	92	2024-07-20 17:53:33	2024-07-20 21:53:33
4	19	2024-07-22	09:00:00	12:00:00	35	13:00:00	15:00:00	30	16:00:00	21:00:00	93	2024-07-20 17:54:35	2024-07-20 18:13:42
7	18	2024-07-27	22:17:00	22:17:00	100	22:17:00	22:17:00	20	22:17:00	22:17:00	60	2024-07-26 17:17:39	2024-07-26 21:17:39
8	18	2024-07-26	22:18:00	22:18:00	200	22:18:00	22:18:00	100	22:18:00	22:18:00	39	2024-07-26 17:18:35	2024-07-26 17:25:47
9	18	2024-07-29	00:50:00	00:50:00	100	00:50:00	00:50:00	300	00:50:00	00:50:00	90	2024-07-26 19:50:32	2024-07-26 23:50:32
10	27	2024-08-28	10:49:00	12:49:00	50	11:50:00	13:50:00	50	13:52:00	23:50:00	100	2024-07-29 06:50:53	2024-07-29 06:51:07
11	30	2024-08-12	12:20:00	12:20:00	208	\N	\N	0	\N	\N	0	2024-08-12 07:20:53	2024-08-12 11:20:53
15	30	2024-08-15	01:58:00	02:59:00	20	\N	\N	0	\N	\N	0	2024-08-14 20:59:28	2024-08-15 00:59:28
16	32	2024-08-15	02:44:00	02:55:00	10	02:00:00	02:50:00	20	02:35:00	02:55:00	30	2024-08-14 21:45:25	2024-08-14 21:45:55
17	35	2024-08-21	\N	\N	0	\N	\N	0	17:00:00	22:00:00	500	2024-08-20 04:30:23	2024-08-20 08:30:23
18	38	2024-08-21	08:00:00	12:00:00	1500	12:00:00	15:00:00	2500	15:00:00	20:00:00	5000	2024-08-20 14:09:52	2024-08-20 14:09:52
19	38	2024-08-22	09:00:00	12:00:00	885	12:00:00	15:00:00	950	15:00:00	21:00:00	8500	2024-08-20 14:11:07	2024-08-20 14:11:07
21	35	2024-08-23	\N	\N	0	\N	\N	0	20:35:00	23:35:00	600	2024-08-20 16:36:38	2024-08-20 20:36:38
22	36	2024-08-23	09:00:00	12:00:00	200	12:00:00	17:00:00	250	17:00:00	22:00:00	300	2024-08-21 14:29:11	2024-08-21 14:29:11
23	64	2024-09-20	16:49:00	17:49:00	500	19:50:00	20:50:00	500	22:50:00	23:50:00	500	2024-09-19 12:50:23	2024-09-19 16:50:23
24	62	2024-09-20	16:49:00	17:49:00	500	17:53:00	18:02:00	500	18:03:00	19:00:00	500	2024-09-19 12:50:50	2024-09-19 13:01:00
25	64	2024-09-21	\N	\N	0	\N	\N	0	17:05:00	23:05:00	200	2024-09-19 13:05:16	2024-09-19 17:05:16
26	64	2024-09-22	\N	\N	0	\N	\N	0	17:05:00	23:55:00	100	2024-09-19 13:05:34	2024-09-19 17:05:34
27	62	2024-09-21	\N	\N	0	\N	\N	0	17:07:00	23:55:00	200	2024-09-19 13:07:16	2024-09-19 17:07:16
28	64	2024-10-04	\N	\N	0	\N	\N	0	15:25:00	23:25:00	500	2024-09-23 06:25:28	2024-09-23 10:25:28
31	74	2024-11-08	09:00:00	12:00:00	1000	12:00:00	17:00:00	1500	17:00:00	23:00:00	2000	2024-11-06 12:26:09	2024-11-06 16:26:09
\.


--
-- Data for Name: temp_booking_addons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_booking_addons (id, booking_id, addon_id, quantity, created_at, updated_at) FROM stdin;
1	50	2	1	2024-08-16 19:00:30	2024-08-16 19:00:30
2	54	2	1	2024-08-16 19:04:41	2024-08-16 19:04:41
3	55	2	1	2024-08-16 19:04:51	2024-08-16 19:04:51
4	56	2	1	2024-08-16 19:05:31	2024-08-16 19:05:31
5	57	2	1	2024-08-16 19:05:37	2024-08-16 19:05:37
6	58	2	1	2024-08-16 19:05:42	2024-08-16 19:05:42
7	65	2	1	2024-08-16 19:11:57	2024-08-16 19:11:57
8	66	2	2	2024-08-16 19:13:45	2024-08-16 19:13:45
9	68	2	1	2024-08-16 20:28:16	2024-08-16 20:28:16
10	69	2	1	2024-08-16 20:32:59	2024-08-16 20:32:59
11	70	2	3	2024-08-16 20:43:51	2024-08-16 20:43:51
12	71	2	3	2024-08-16 20:47:01	2024-08-16 20:47:01
13	75	2	0	2024-08-16 23:14:38	2024-08-16 23:14:38
14	77	2	0	2024-08-16 23:20:12	2024-08-16 23:20:12
15	78	2	3	2024-08-17 12:40:05	2024-08-17 12:40:05
16	79	2	2	2024-08-17 12:46:42	2024-08-17 12:46:42
17	80	2	2	2024-08-17 18:12:30	2024-08-17 18:12:30
18	81	2	1	2024-08-17 19:36:37	2024-08-17 19:36:37
19	82	2	2	2024-08-17 19:56:52	2024-08-17 19:56:52
20	83	2	3	2024-08-17 20:00:58	2024-08-17 20:00:58
21	84	2	1	2024-08-17 23:31:14	2024-08-17 23:31:14
22	85	2	3	2024-08-17 23:53:51	2024-08-17 23:53:51
23	86	12	1	2024-08-18 09:17:59	2024-08-18 09:17:59
24	87	12	1	2024-08-18 09:19:49	2024-08-18 09:19:49
25	88	12	1	2024-08-18 09:24:29	2024-08-18 09:24:29
26	90	12	1	2024-08-18 09:38:37	2024-08-18 09:38:37
27	91	93	1	2024-08-18 09:45:42	2024-08-18 09:45:42
28	92	93	1	2024-08-18 09:47:10	2024-08-18 09:47:10
29	93	12	1	2024-08-18 09:56:32	2024-08-18 09:56:32
30	94	12	3	2024-08-18 09:57:50	2024-08-18 09:57:50
31	96	12	1	2024-08-18 10:39:07	2024-08-18 10:39:07
32	97	2	1	2024-08-19 07:48:27	2024-08-19 07:48:27
33	98	12	1	2024-08-19 07:49:55	2024-08-19 07:49:55
34	99	12	1	2024-08-19 08:00:55	2024-08-19 08:00:55
35	101	12	1	2024-08-19 08:05:28	2024-08-19 08:05:28
36	101	13	1	2024-08-19 08:05:28	2024-08-19 08:05:28
37	107	2	1	2024-08-19 09:20:51	2024-08-19 09:20:51
38	108	2	1	2024-08-19 09:26:15	2024-08-19 09:26:15
39	111	12	0	2024-08-19 10:10:24	2024-08-19 10:10:24
40	111	13	0	2024-08-19 10:10:24	2024-08-19 10:10:24
41	112	12	1	2024-08-19 10:29:15	2024-08-19 10:29:15
42	112	13	1	2024-08-19 10:29:15	2024-08-19 10:29:15
43	113	12	1	2024-08-19 10:31:06	2024-08-19 10:31:06
44	113	13	1	2024-08-19 10:31:06	2024-08-19 10:31:06
45	115	12	1	2024-08-19 10:47:26	2024-08-19 10:47:26
46	115	13	1	2024-08-19 10:47:26	2024-08-19 10:47:26
47	117	12	1	2024-08-19 11:31:49	2024-08-19 11:31:49
48	122	12	1	2024-08-19 12:02:59	2024-08-19 12:02:59
49	123	12	1	2024-08-19 12:35:56	2024-08-19 12:35:56
50	124	12	1	2024-08-19 12:37:32	2024-08-19 12:37:32
51	125	12	1	2024-08-19 12:44:29	2024-08-19 12:44:29
52	126	12	1	2024-08-19 13:01:35	2024-08-19 13:01:35
53	127	12	1	2024-08-19 13:04:00	2024-08-19 13:04:00
54	128	12	1	2024-08-19 13:05:23	2024-08-19 13:05:23
55	129	12	1	2024-08-19 13:07:06	2024-08-19 13:07:06
56	130	12	1	2024-08-19 13:11:06	2024-08-19 13:11:06
57	131	12	1	2024-08-19 13:16:20	2024-08-19 13:16:20
58	132	12	1	2024-08-19 13:30:57	2024-08-19 13:30:57
59	134	12	1	2024-08-19 14:29:58	2024-08-19 14:29:58
60	139	2	1	2024-08-19 19:19:34	2024-08-19 19:19:34
61	140	2	2	2024-08-19 19:55:51	2024-08-19 19:55:51
62	151	2	1	2024-08-19 20:21:02	2024-08-19 20:21:02
63	152	2	1	2024-08-19 20:21:36	2024-08-19 20:21:36
64	153	2	1	2024-08-19 21:14:32	2024-08-19 21:14:32
65	154	12	1	2024-08-19 23:12:43	2024-08-19 23:12:43
66	155	12	1	2024-08-19 23:28:19	2024-08-19 23:28:19
67	156	12	0	2024-08-20 02:06:31	2024-08-20 02:06:31
68	156	13	0	2024-08-20 02:06:31	2024-08-20 02:06:31
69	157	12	1	2024-08-20 07:39:15	2024-08-20 07:39:15
70	157	13	1	2024-08-20 07:39:15	2024-08-20 07:39:15
71	159	12	1	2024-08-20 09:42:06	2024-08-20 09:42:06
72	160	12	1	2024-08-20 10:26:29	2024-08-20 10:26:29
73	162	12	1	2024-08-20 12:04:50	2024-08-20 12:04:50
74	164	12	1	2024-08-20 12:27:54	2024-08-20 12:27:54
75	165	12	1	2024-08-20 13:38:00	2024-08-20 13:38:00
76	166	12	1	2024-08-20 13:51:00	2024-08-20 13:51:00
77	167	12	1	2024-08-20 15:16:44	2024-08-20 15:16:44
78	175	2	1	2024-08-20 20:06:12	2024-08-20 20:06:12
79	176	2	1	2024-08-20 22:36:29	2024-08-20 22:36:29
80	190	2	1	2024-08-20 23:19:12	2024-08-20 23:19:12
81	191	2	1	2024-08-20 23:22:42	2024-08-20 23:22:42
82	192	2	1	2024-08-20 23:26:09	2024-08-20 23:26:09
83	193	2	1	2024-08-20 23:30:46	2024-08-20 23:30:46
84	205	12	1	2024-08-21 07:48:26	2024-08-21 07:48:26
85	205	13	1	2024-08-21 07:48:26	2024-08-21 07:48:26
86	206	12	1	2024-08-21 08:02:03	2024-08-21 08:02:03
87	206	13	1	2024-08-21 08:02:03	2024-08-21 08:02:03
88	207	12	1	2024-08-21 08:33:12	2024-08-21 08:33:12
89	208	12	1	2024-08-21 08:38:01	2024-08-21 08:38:01
90	209	12	1	2024-08-21 08:41:51	2024-08-21 08:41:51
91	213	12	1	2024-08-21 08:58:09	2024-08-21 08:58:09
92	214	16	1	2024-08-21 09:04:52	2024-08-21 09:04:52
93	215	16	1	2024-08-21 09:06:05	2024-08-21 09:06:05
94	219	16	1	2024-08-21 09:13:28	2024-08-21 09:13:28
95	220	16	1	2024-08-21 09:17:09	2024-08-21 09:17:09
96	221	16	1	2024-08-21 09:21:58	2024-08-21 09:21:58
97	222	16	1	2024-08-21 09:36:12	2024-08-21 09:36:12
98	224	12	1	2024-08-21 12:13:29	2024-08-21 12:13:29
99	224	13	1	2024-08-21 12:13:29	2024-08-21 12:13:29
100	225	12	1	2024-08-21 12:32:33	2024-08-21 12:32:33
101	225	13	1	2024-08-21 12:32:33	2024-08-21 12:32:33
102	226	16	1	2024-08-21 13:31:21	2024-08-21 13:31:21
103	228	12	1	2024-08-23 06:38:12	2024-08-23 06:38:12
104	228	13	0	2024-08-23 06:38:12	2024-08-23 06:38:12
105	229	12	1	2024-08-23 22:16:57	2024-08-23 22:16:57
106	229	13	1	2024-08-23 22:16:57	2024-08-23 22:16:57
107	230	12	0	2024-08-26 08:32:26	2024-08-26 08:32:26
108	230	13	0	2024-08-26 08:32:26	2024-08-26 08:32:26
109	231	12	1	2024-08-26 13:05:42	2024-08-26 13:05:42
110	231	13	1	2024-08-26 13:05:42	2024-08-26 13:05:42
111	232	12	0	2024-08-26 13:25:33	2024-08-26 13:25:33
112	232	13	0	2024-08-26 13:25:33	2024-08-26 13:25:33
113	233	16	1	2024-09-02 07:17:55	2024-09-02 07:17:55
114	234	2	0	2024-09-02 12:33:34	2024-09-02 12:33:34
115	235	12	2	2024-09-03 10:45:28	2024-09-03 10:45:28
116	235	13	2	2024-09-03 10:45:28	2024-09-03 10:45:28
117	236	12	1	2024-09-03 11:19:50	2024-09-03 11:19:50
118	236	13	1	2024-09-03 11:19:50	2024-09-03 11:19:50
119	239	13	0	2024-09-03 11:37:17	2024-09-03 11:37:17
120	239	12	0	2024-09-03 11:37:17	2024-09-03 11:37:17
121	240	12	0	2024-09-03 11:40:07	2024-09-03 11:40:07
122	240	13	0	2024-09-03 11:40:07	2024-09-03 11:40:07
123	242	12	2	2024-09-03 11:54:25	2024-09-03 11:54:25
124	242	13	1	2024-09-03 11:54:25	2024-09-03 11:54:25
125	243	12	0	2024-09-03 11:58:21	2024-09-03 11:58:21
126	243	13	0	2024-09-03 11:58:21	2024-09-03 11:58:21
127	244	12	1	2024-09-03 12:40:09	2024-09-03 12:40:09
128	244	13	1	2024-09-03 12:40:09	2024-09-03 12:40:09
129	245	16	1	2024-09-05 19:31:51	2024-09-05 19:31:51
130	246	16	1	2024-09-06 07:50:55	2024-09-06 07:50:55
131	249	16	9	2024-09-07 15:58:18	2024-09-07 15:58:18
132	250	12	1	2024-09-09 11:39:54	2024-09-09 11:39:54
133	250	13	0	2024-09-09 11:39:54	2024-09-09 11:39:54
134	252	12	0	2024-09-09 20:58:59	2024-09-09 20:58:59
135	252	13	0	2024-09-09 20:58:59	2024-09-09 20:58:59
136	256	12	4	2024-09-10 11:39:26	2024-09-10 11:39:26
137	256	13	5	2024-09-10 11:39:26	2024-09-10 11:39:26
138	257	12	1	2024-09-10 16:26:38	2024-09-10 16:26:38
139	257	13	1	2024-09-10 16:26:38	2024-09-10 16:26:38
140	258	12	1	2024-09-10 16:52:27	2024-09-10 16:52:27
141	258	13	1	2024-09-10 16:52:27	2024-09-10 16:52:27
142	259	12	1	2024-09-10 17:10:51	2024-09-10 17:10:51
143	259	13	1	2024-09-10 17:10:51	2024-09-10 17:10:51
144	260	12	1	2024-09-10 17:18:05	2024-09-10 17:18:05
145	260	13	1	2024-09-10 17:18:05	2024-09-10 17:18:05
146	261	12	1	2024-09-10 17:18:40	2024-09-10 17:18:40
147	261	13	1	2024-09-10 17:18:40	2024-09-10 17:18:40
148	262	12	1	2024-09-10 17:30:37	2024-09-10 17:30:37
149	262	13	1	2024-09-10 17:30:37	2024-09-10 17:30:37
150	265	12	1	2024-09-10 21:03:15	2024-09-10 21:03:15
151	266	12	1	2024-09-10 21:09:24	2024-09-10 21:09:24
152	266	13	1	2024-09-10 21:09:24	2024-09-10 21:09:24
153	268	16	1	2024-09-13 08:58:57	2024-09-13 08:58:57
154	269	12	0	2024-09-13 09:11:11	2024-09-13 09:11:11
155	269	13	0	2024-09-13 09:11:11	2024-09-13 09:11:11
156	270	10	3	2024-09-14 13:22:23	2024-09-14 13:22:23
157	273	10	3	2024-09-14 14:03:30	2024-09-14 14:03:30
158	282	16	0	2024-09-20 09:24:56	2024-09-20 09:24:56
159	291	12	2	2024-09-30 12:14:13	2024-09-30 12:14:13
160	291	13	2	2024-09-30 12:14:13	2024-09-30 12:14:13
161	292	10	1	2024-09-30 16:57:52	2024-09-30 16:57:52
162	293	12	1	2024-09-30 17:44:35	2024-09-30 17:44:35
163	293	13	1	2024-09-30 17:44:35	2024-09-30 17:44:35
164	294	16	1	2024-10-01 05:48:05	2024-10-01 05:48:05
165	295	10	1	2024-10-01 06:42:22	2024-10-01 06:42:22
166	296	16	3	2024-10-01 06:49:40	2024-10-01 06:49:40
167	297	22	3	2024-10-01 11:48:06	2024-10-01 11:48:06
168	298	16	2	2024-10-02 13:53:45	2024-10-02 13:53:45
169	299	16	1	2024-10-03 16:51:18	2024-10-03 16:51:18
170	300	16	1	2024-10-03 16:53:06	2024-10-03 16:53:06
171	301	16	138	2024-10-03 16:56:25	2024-10-03 16:56:25
172	302	16	138	2024-10-03 16:56:45	2024-10-03 16:56:45
173	303	22	16	2024-10-03 17:03:07	2024-10-03 17:03:07
174	308	16	2	2024-10-07 19:42:27	2024-10-07 19:42:27
175	309	16	1	2024-10-07 19:49:14	2024-10-07 19:49:14
176	316	16	0	2024-10-09 04:12:21	2024-10-09 04:12:21
177	317	16	0	2024-10-09 04:14:40	2024-10-09 04:14:40
178	319	16	4	2024-10-09 07:32:31	2024-10-09 07:32:31
179	321	31	1	2024-10-09 12:00:47	2024-10-09 12:00:47
180	322	30	1	2024-10-09 12:10:35	2024-10-09 12:10:35
181	322	10	1	2024-10-09 12:10:35	2024-10-09 12:10:35
182	323	30	1	2024-10-09 12:15:58	2024-10-09 12:15:58
183	323	10	1	2024-10-09 12:15:58	2024-10-09 12:15:58
184	324	31	1	2024-10-09 12:19:27	2024-10-09 12:19:27
185	325	30	1	2024-10-09 12:21:25	2024-10-09 12:21:25
186	325	10	1	2024-10-09 12:21:25	2024-10-09 12:21:25
187	326	30	1	2024-10-09 12:23:12	2024-10-09 12:23:12
188	326	10	1	2024-10-09 12:23:12	2024-10-09 12:23:12
189	327	30	1	2024-10-09 12:30:12	2024-10-09 12:30:12
190	327	10	1	2024-10-09 12:30:12	2024-10-09 12:30:12
191	330	31	3	2024-10-10 06:32:52	2024-10-10 06:32:52
192	332	30	1	2024-10-10 10:32:45	2024-10-10 10:32:45
193	332	10	1	2024-10-10 10:32:45	2024-10-10 10:32:45
194	333	30	1	2024-10-10 10:34:54	2024-10-10 10:34:54
195	333	10	1	2024-10-10 10:34:54	2024-10-10 10:34:54
196	334	30	1	2024-10-10 10:49:27	2024-10-10 10:49:27
197	334	10	1	2024-10-10 10:49:27	2024-10-10 10:49:27
198	335	31	1	2024-10-10 14:07:48	2024-10-10 14:07:48
199	336	16	1	2024-10-11 03:37:42	2024-10-11 03:37:42
200	337	31	1	2024-10-16 16:10:16	2024-10-16 16:10:16
201	338	31	1	2024-10-16 16:10:30	2024-10-16 16:10:30
202	339	31	1	2024-10-16 16:25:54	2024-10-16 16:25:54
203	340	31	1	2024-10-16 16:41:19	2024-10-16 16:41:19
204	341	8	1	2024-10-17 04:19:43	2024-10-17 04:19:43
205	342	8	1	2024-10-17 04:22:38	2024-10-17 04:22:38
206	343	8	1	2024-10-17 04:24:52	2024-10-17 04:24:52
207	344	8	1	2024-10-17 04:50:17	2024-10-17 04:50:17
208	345	31	1	2024-10-17 05:12:09	2024-10-17 05:12:09
209	346	31	1	2024-10-17 05:12:16	2024-10-17 05:12:16
210	347	31	1	2024-10-17 11:42:08	2024-10-17 11:42:08
211	350	31	0	2024-10-18 06:50:42	2024-10-18 06:50:42
212	352	31	0	2024-10-18 12:12:36	2024-10-18 12:12:36
213	353	31	0	2024-10-18 16:50:01	2024-10-18 16:50:01
214	354	31	1	2024-10-18 17:24:18	2024-10-18 17:24:18
215	355	22	0	2024-10-19 07:06:12	2024-10-19 07:06:12
216	356	22	1	2024-10-19 07:13:21	2024-10-19 07:13:21
217	357	22	1	2024-10-19 07:50:00	2024-10-19 07:50:00
218	361	30	2	2024-10-19 08:04:51	2024-10-19 08:04:51
219	361	10	2	2024-10-19 08:04:51	2024-10-19 08:04:51
220	363	30	1	2024-10-19 08:14:36	2024-10-19 08:14:36
221	363	10	1	2024-10-19 08:14:36	2024-10-19 08:14:36
222	364	16	1	2024-10-19 08:17:08	2024-10-19 08:17:08
223	365	16	1	2024-10-19 08:19:58	2024-10-19 08:19:58
224	366	22	0	2024-10-19 08:24:20	2024-10-19 08:24:20
225	367	31	1	2024-10-19 08:59:10	2024-10-19 08:59:10
226	368	30	1	2024-10-19 09:02:14	2024-10-19 09:02:14
227	368	10	1	2024-10-19 09:02:14	2024-10-19 09:02:14
228	369	30	1	2024-10-19 09:38:51	2024-10-19 09:38:51
229	369	10	1	2024-10-19 09:38:51	2024-10-19 09:38:51
230	370	16	1	2024-10-19 11:09:41	2024-10-19 11:09:41
231	371	16	1	2024-10-19 11:33:08	2024-10-19 11:33:08
232	372	31	1	2024-10-19 11:39:26	2024-10-19 11:39:26
233	373	31	1	2024-10-19 11:40:55	2024-10-19 11:40:55
234	374	16	1	2024-10-19 12:01:15	2024-10-19 12:01:15
235	375	31	1	2024-10-19 12:03:01	2024-10-19 12:03:01
236	376	16	1	2024-10-19 18:20:03	2024-10-19 18:20:03
237	377	16	1	2024-10-19 18:22:10	2024-10-19 18:22:10
238	379	31	1	2024-10-20 09:37:26	2024-10-20 09:37:26
239	380	31	1	2024-10-20 09:38:10	2024-10-20 09:38:10
240	381	31	1	2024-10-20 10:19:21	2024-10-20 10:19:21
241	382	31	1	2024-10-20 10:20:09	2024-10-20 10:20:09
242	383	31	1	2024-10-20 10:26:31	2024-10-20 10:26:31
243	385	31	1	2024-10-20 12:02:09	2024-10-20 12:02:09
244	386	16	1	2024-10-21 04:42:39	2024-10-21 04:42:39
245	387	30	1	2024-10-21 04:45:09	2024-10-21 04:45:09
246	387	10	1	2024-10-21 04:45:09	2024-10-21 04:45:09
247	388	16	1	2024-10-21 04:51:49	2024-10-21 04:51:49
248	389	16	1	2024-10-21 04:53:18	2024-10-21 04:53:18
249	390	30	1	2024-10-21 04:54:19	2024-10-21 04:54:19
250	390	10	1	2024-10-21 04:54:19	2024-10-21 04:54:19
251	391	31	1	2024-10-21 05:01:31	2024-10-21 05:01:31
252	392	16	1	2024-10-21 05:06:29	2024-10-21 05:06:29
253	393	16	1	2024-10-21 05:38:02	2024-10-21 05:38:02
254	394	16	0	2024-10-21 06:04:11	2024-10-21 06:04:11
255	396	16	1	2024-10-21 06:16:25	2024-10-21 06:16:25
256	398	31	1	2024-10-21 07:30:27	2024-10-21 07:30:27
257	399	31	1	2024-10-21 11:18:28	2024-10-21 11:18:28
258	400	31	1	2024-10-21 12:24:05	2024-10-21 12:24:05
259	401	31	1	2024-10-21 13:24:34	2024-10-21 13:24:34
260	402	31	1	2024-10-21 14:57:50	2024-10-21 14:57:50
261	409	31	1	2024-10-22 13:32:31	2024-10-22 13:32:31
262	421	31	1	2024-10-23 15:45:20	2024-10-23 15:45:20
263	422	31	0	2024-10-23 23:43:30	2024-10-23 23:43:30
264	426	31	1	2024-10-24 04:01:35	2024-10-24 04:01:35
265	428	31	1	2024-10-24 04:24:53	2024-10-24 04:24:53
266	429	31	1	2024-10-24 04:50:27	2024-10-24 04:50:27
267	431	31	1	2024-10-24 06:16:26	2024-10-24 06:16:26
268	432	31	1	2024-10-24 06:50:11	2024-10-24 06:50:11
269	443	31	1	2024-10-24 12:45:13	2024-10-24 12:45:13
270	445	31	1	2024-10-24 12:48:53	2024-10-24 12:48:53
271	449	32	0	2024-10-24 13:01:48	2024-10-24 13:01:48
272	450	32	1	2024-10-24 13:08:35	2024-10-24 13:08:35
273	451	32	1	2024-10-24 13:14:13	2024-10-24 13:14:13
274	452	31	1	2024-10-24 13:21:41	2024-10-24 13:21:41
275	456	30	1	2024-10-30 07:57:29	2024-10-30 07:57:29
276	457	32	1	2024-10-30 13:21:06	2024-10-30 13:21:06
277	458	16	1	2024-11-02 18:11:42	2024-11-02 18:11:42
278	466	32	1	2024-11-05 14:28:56	2024-11-05 14:28:56
279	467	32	0	2024-11-05 14:33:52	2024-11-05 14:33:52
280	468	32	0	2024-11-05 14:35:38	2024-11-05 14:35:38
281	471	32	1	2024-11-05 15:48:37	2024-11-05 15:48:37
282	472	32	0	2024-11-06 07:53:19	2024-11-06 07:53:19
283	473	30	1	2024-11-06 12:01:01	2024-11-06 12:01:01
284	473	10	1	2024-11-06 12:01:01	2024-11-06 12:01:01
285	475	33	1	2024-11-06 15:08:15	2024-11-06 15:08:15
286	475	34	1	2024-11-06 15:08:15	2024-11-06 15:08:15
287	476	34	1	2024-11-07 17:11:37	2024-11-07 17:11:37
288	476	33	1	2024-11-07 17:11:37	2024-11-07 17:11:37
289	477	33	1	2024-11-07 19:04:51	2024-11-07 19:04:51
290	477	34	1	2024-11-07 19:04:51	2024-11-07 19:04:51
291	478	33	1	2024-11-08 09:33:55	2024-11-08 09:33:55
292	478	34	1	2024-11-08 09:33:55	2024-11-08 09:33:55
293	479	33	1	2024-11-08 12:09:27	2024-11-08 12:09:27
294	479	34	1	2024-11-08 12:09:27	2024-11-08 12:09:27
295	480	33	1	2024-11-16 08:42:28	2024-11-16 08:42:28
296	480	34	1	2024-11-16 08:42:28	2024-11-16 08:42:28
\.


--
-- Data for Name: temp_booking_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_booking_products (id, booking_id, product_id, quantity, created_at, updated_at) FROM stdin;
1	50	13	1	2024-08-16 19:00:30	2024-08-16 19:00:30
2	54	13	1	2024-08-16 19:04:41	2024-08-16 19:04:41
3	55	13	1	2024-08-16 19:04:51	2024-08-16 19:04:51
4	56	13	1	2024-08-16 19:05:31	2024-08-16 19:05:31
5	57	13	1	2024-08-16 19:05:37	2024-08-16 19:05:37
6	58	13	1	2024-08-16 19:05:42	2024-08-16 19:05:42
7	65	13	1	2024-08-16 19:11:57	2024-08-16 19:11:57
8	66	13	1	2024-08-16 19:13:45	2024-08-16 19:13:45
9	68	13	1	2024-08-16 20:28:16	2024-08-16 20:28:16
10	68	11	1	2024-08-16 20:28:16	2024-08-16 20:28:16
11	69	13	1	2024-08-16 20:32:59	2024-08-16 20:32:59
12	69	11	1	2024-08-16 20:32:59	2024-08-16 20:32:59
13	70	13	1	2024-08-16 20:43:51	2024-08-16 20:43:51
14	70	11	1	2024-08-16 20:43:51	2024-08-16 20:43:51
15	71	13	1	2024-08-16 20:47:01	2024-08-16 20:47:01
16	71	11	1	2024-08-16 20:47:01	2024-08-16 20:47:01
17	75	12	0	2024-08-16 23:14:38	2024-08-16 23:14:38
18	75	13	0	2024-08-16 23:14:38	2024-08-16 23:14:38
19	77	12	0	2024-08-16 23:20:12	2024-08-16 23:20:12
20	77	13	0	2024-08-16 23:20:12	2024-08-16 23:20:12
21	78	13	1	2024-08-17 12:40:05	2024-08-17 12:40:05
22	78	11	1	2024-08-17 12:40:05	2024-08-17 12:40:05
23	79	13	1	2024-08-17 12:46:42	2024-08-17 12:46:42
24	79	11	1	2024-08-17 12:46:42	2024-08-17 12:46:42
25	80	10	0	2024-08-17 18:12:30	2024-08-17 18:12:30
26	80	11	1	2024-08-17 18:12:30	2024-08-17 18:12:30
27	81	10	1	2024-08-17 19:36:37	2024-08-17 19:36:37
28	81	11	1	2024-08-17 19:36:37	2024-08-17 19:36:37
29	82	12	1	2024-08-17 19:56:52	2024-08-17 19:56:52
30	82	13	2	2024-08-17 19:56:52	2024-08-17 19:56:52
31	83	10	1	2024-08-17 20:00:58	2024-08-17 20:00:58
32	83	11	3	2024-08-17 20:00:58	2024-08-17 20:00:58
33	84	12	1	2024-08-17 23:31:14	2024-08-17 23:31:14
34	84	13	1	2024-08-17 23:31:14	2024-08-17 23:31:14
35	85	10	1	2024-08-17 23:53:51	2024-08-17 23:53:51
36	85	11	3	2024-08-17 23:53:51	2024-08-17 23:53:51
37	86	27	1	2024-08-18 09:17:59	2024-08-18 09:17:59
38	87	27	1	2024-08-18 09:19:49	2024-08-18 09:19:49
39	88	28	1	2024-08-18 09:24:29	2024-08-18 09:24:29
40	90	27	1	2024-08-18 09:38:37	2024-08-18 09:38:37
41	91	215	1	2024-08-18 09:45:42	2024-08-18 09:45:42
42	92	215	1	2024-08-18 09:47:10	2024-08-18 09:47:10
43	93	27	1	2024-08-18 09:56:32	2024-08-18 09:56:32
44	94	27	1	2024-08-18 09:57:50	2024-08-18 09:57:50
45	95	28	1	2024-08-18 10:05:24	2024-08-18 10:05:24
46	95	26	1	2024-08-18 10:05:24	2024-08-18 10:05:24
47	95	27	1	2024-08-18 10:05:24	2024-08-18 10:05:24
48	96	28	1	2024-08-18 10:39:07	2024-08-18 10:39:07
49	96	26	1	2024-08-18 10:39:07	2024-08-18 10:39:07
50	96	27	1	2024-08-18 10:39:07	2024-08-18 10:39:07
51	97	15	1	2024-08-19 07:48:27	2024-08-19 07:48:27
52	97	13	1	2024-08-19 07:48:27	2024-08-19 07:48:27
53	98	28	1	2024-08-19 07:49:55	2024-08-19 07:49:55
54	98	27	1	2024-08-19 07:49:55	2024-08-19 07:49:55
55	99	27	1	2024-08-19 08:00:55	2024-08-19 08:00:55
56	111	26	1	2024-08-19 10:10:24	2024-08-19 10:10:24
57	111	27	1	2024-08-19 10:10:24	2024-08-19 10:10:24
58	112	27	1	2024-08-19 10:29:15	2024-08-19 10:29:15
59	115	27	1	2024-08-19 10:47:26	2024-08-19 10:47:26
60	117	26	1	2024-08-19 11:31:49	2024-08-19 11:31:49
61	117	27	1	2024-08-19 11:31:49	2024-08-19 11:31:49
62	122	26	1	2024-08-19 12:02:59	2024-08-19 12:02:59
63	122	27	1	2024-08-19 12:02:59	2024-08-19 12:02:59
64	125	27	1	2024-08-19 12:44:29	2024-08-19 12:44:29
65	126	27	1	2024-08-19 13:01:35	2024-08-19 13:01:35
66	127	27	1	2024-08-19 13:04:00	2024-08-19 13:04:00
67	128	27	1	2024-08-19 13:05:23	2024-08-19 13:05:23
68	129	27	1	2024-08-19 13:07:06	2024-08-19 13:07:06
69	130	27	1	2024-08-19 13:11:06	2024-08-19 13:11:06
70	131	27	1	2024-08-19 13:16:20	2024-08-19 13:16:20
71	139	11	1	2024-08-19 19:19:34	2024-08-19 19:19:34
72	139	12	1	2024-08-19 19:19:34	2024-08-19 19:19:34
73	139	16	1	2024-08-19 19:19:34	2024-08-19 19:19:34
74	140	16	1	2024-08-19 19:55:51	2024-08-19 19:55:51
75	140	12	1	2024-08-19 19:55:51	2024-08-19 19:55:51
76	140	13	1	2024-08-19 19:55:51	2024-08-19 19:55:51
77	140	10	1	2024-08-19 19:55:51	2024-08-19 19:55:51
78	151	15	1	2024-08-19 20:21:02	2024-08-19 20:21:02
79	151	16	1	2024-08-19 20:21:02	2024-08-19 20:21:02
80	152	11	1	2024-08-19 20:21:36	2024-08-19 20:21:36
81	152	13	1	2024-08-19 20:21:36	2024-08-19 20:21:36
82	152	15	1	2024-08-19 20:21:36	2024-08-19 20:21:36
83	153	10	1	2024-08-19 21:14:32	2024-08-19 21:14:32
84	153	13	1	2024-08-19 21:14:32	2024-08-19 21:14:32
85	153	15	1	2024-08-19 21:14:32	2024-08-19 21:14:32
86	154	26	1	2024-08-19 23:12:43	2024-08-19 23:12:43
87	154	27	1	2024-08-19 23:12:43	2024-08-19 23:12:43
88	155	26	1	2024-08-19 23:28:19	2024-08-19 23:28:19
89	155	27	1	2024-08-19 23:28:19	2024-08-19 23:28:19
90	156	26	1	2024-08-20 02:06:31	2024-08-20 02:06:31
91	156	27	1	2024-08-20 02:06:31	2024-08-20 02:06:31
92	156	28	1	2024-08-20 02:06:31	2024-08-20 02:06:31
93	156	29	1	2024-08-20 02:06:31	2024-08-20 02:06:31
94	159	26	1	2024-08-20 09:42:05	2024-08-20 09:42:05
95	159	27	1	2024-08-20 09:42:05	2024-08-20 09:42:05
96	160	28	1	2024-08-20 10:26:29	2024-08-20 10:26:29
97	160	26	1	2024-08-20 10:26:29	2024-08-20 10:26:29
98	160	27	1	2024-08-20 10:26:29	2024-08-20 10:26:29
99	162	28	1	2024-08-20 12:04:50	2024-08-20 12:04:50
100	162	26	1	2024-08-20 12:04:50	2024-08-20 12:04:50
101	162	27	1	2024-08-20 12:04:50	2024-08-20 12:04:50
102	164	27	1	2024-08-20 12:27:54	2024-08-20 12:27:54
103	165	26	1	2024-08-20 13:38:00	2024-08-20 13:38:00
104	165	27	1	2024-08-20 13:38:00	2024-08-20 13:38:00
105	166	26	1	2024-08-20 13:51:00	2024-08-20 13:51:00
106	166	27	1	2024-08-20 13:51:00	2024-08-20 13:51:00
107	167	26	1	2024-08-20 15:16:44	2024-08-20 15:16:44
108	167	27	1	2024-08-20 15:16:44	2024-08-20 15:16:44
109	175	11	0	2024-08-20 20:06:12	2024-08-20 20:06:12
110	175	13	1	2024-08-20 20:06:12	2024-08-20 20:06:12
111	175	15	1	2024-08-20 20:06:12	2024-08-20 20:06:12
112	176	10	1	2024-08-20 22:36:29	2024-08-20 22:36:29
113	176	13	1	2024-08-20 22:36:29	2024-08-20 22:36:29
114	176	15	1	2024-08-20 22:36:29	2024-08-20 22:36:29
115	176	16	1	2024-08-20 22:36:29	2024-08-20 22:36:29
116	190	11	1	2024-08-20 23:19:12	2024-08-20 23:19:12
117	190	12	1	2024-08-20 23:19:12	2024-08-20 23:19:12
118	190	13	1	2024-08-20 23:19:12	2024-08-20 23:19:12
119	190	16	1	2024-08-20 23:19:12	2024-08-20 23:19:12
120	191	11	1	2024-08-20 23:22:42	2024-08-20 23:22:42
121	191	13	1	2024-08-20 23:22:42	2024-08-20 23:22:42
122	191	16	1	2024-08-20 23:22:42	2024-08-20 23:22:42
123	192	11	1	2024-08-20 23:26:09	2024-08-20 23:26:09
124	192	13	1	2024-08-20 23:26:09	2024-08-20 23:26:09
125	192	16	1	2024-08-20 23:26:09	2024-08-20 23:26:09
126	193	11	1	2024-08-20 23:30:46	2024-08-20 23:30:46
127	193	13	1	2024-08-20 23:30:46	2024-08-20 23:30:46
128	193	16	1	2024-08-20 23:30:46	2024-08-20 23:30:46
129	205	29	1	2024-08-21 07:48:26	2024-08-21 07:48:26
130	205	26	1	2024-08-21 07:48:26	2024-08-21 07:48:26
131	207	26	1	2024-08-21 08:33:12	2024-08-21 08:33:12
132	207	28	1	2024-08-21 08:33:12	2024-08-21 08:33:12
133	208	26	1	2024-08-21 08:38:01	2024-08-21 08:38:01
134	208	27	1	2024-08-21 08:38:01	2024-08-21 08:38:01
135	209	26	1	2024-08-21 08:41:51	2024-08-21 08:41:51
136	209	28	1	2024-08-21 08:41:51	2024-08-21 08:41:51
137	213	28	1	2024-08-21 08:58:09	2024-08-21 08:58:09
138	213	27	1	2024-08-21 08:58:09	2024-08-21 08:58:09
139	222	33	1	2024-08-21 09:36:12	2024-08-21 09:36:12
140	226	33	1	2024-08-21 13:31:21	2024-08-21 13:31:21
141	228	26	1	2024-08-23 06:38:12	2024-08-23 06:38:12
142	228	27	1	2024-08-23 06:38:12	2024-08-23 06:38:12
143	228	29	1	2024-08-23 06:38:12	2024-08-23 06:38:12
144	229	27	1	2024-08-23 22:16:57	2024-08-23 22:16:57
145	229	28	1	2024-08-23 22:16:57	2024-08-23 22:16:57
146	229	29	1	2024-08-23 22:16:57	2024-08-23 22:16:57
147	230	26	1	2024-08-26 08:32:26	2024-08-26 08:32:26
148	230	27	1	2024-08-26 08:32:26	2024-08-26 08:32:26
149	230	28	0	2024-08-26 08:32:26	2024-08-26 08:32:26
150	230	29	1	2024-08-26 08:32:26	2024-08-26 08:32:26
151	231	26	1	2024-08-26 13:05:42	2024-08-26 13:05:42
152	231	27	1	2024-08-26 13:05:42	2024-08-26 13:05:42
153	231	29	1	2024-08-26 13:05:42	2024-08-26 13:05:42
154	234	11	1	2024-09-02 12:33:34	2024-09-02 12:33:34
155	234	12	1	2024-09-02 12:33:34	2024-09-02 12:33:34
156	234	13	1	2024-09-02 12:33:34	2024-09-02 12:33:34
157	234	15	1	2024-09-02 12:33:34	2024-09-02 12:33:34
158	234	16	1	2024-09-02 12:33:34	2024-09-02 12:33:34
159	235	26	1	2024-09-03 10:45:28	2024-09-03 10:45:28
160	235	27	2	2024-09-03 10:45:28	2024-09-03 10:45:28
161	235	28	2	2024-09-03 10:45:28	2024-09-03 10:45:28
162	235	29	2	2024-09-03 10:45:28	2024-09-03 10:45:28
163	236	26	1	2024-09-03 11:19:50	2024-09-03 11:19:50
164	236	27	2	2024-09-03 11:19:50	2024-09-03 11:19:50
165	236	28	2	2024-09-03 11:19:50	2024-09-03 11:19:50
166	236	29	2	2024-09-03 11:19:50	2024-09-03 11:19:50
167	239	27	2	2024-09-03 11:37:17	2024-09-03 11:37:17
168	239	28	2	2024-09-03 11:37:17	2024-09-03 11:37:17
169	239	29	2	2024-09-03 11:37:17	2024-09-03 11:37:17
170	239	26	1	2024-09-03 11:37:17	2024-09-03 11:37:17
171	240	26	1	2024-09-03 11:40:07	2024-09-03 11:40:07
172	240	27	2	2024-09-03 11:40:07	2024-09-03 11:40:07
173	240	28	2	2024-09-03 11:40:07	2024-09-03 11:40:07
174	240	29	2	2024-09-03 11:40:07	2024-09-03 11:40:07
175	242	26	1	2024-09-03 11:54:25	2024-09-03 11:54:25
176	242	27	2	2024-09-03 11:54:25	2024-09-03 11:54:25
177	242	28	2	2024-09-03 11:54:25	2024-09-03 11:54:25
178	242	29	1	2024-09-03 11:54:25	2024-09-03 11:54:25
179	243	29	2	2024-09-03 11:58:21	2024-09-03 11:58:21
180	244	26	1	2024-09-03 12:40:09	2024-09-03 12:40:09
181	244	27	2	2024-09-03 12:40:09	2024-09-03 12:40:09
182	244	28	1	2024-09-03 12:40:09	2024-09-03 12:40:09
183	244	29	2	2024-09-03 12:40:09	2024-09-03 12:40:09
184	245	33	1	2024-09-05 19:31:51	2024-09-05 19:31:51
185	246	33	1	2024-09-06 07:50:55	2024-09-06 07:50:55
186	249	33	1	2024-09-07 15:58:18	2024-09-07 15:58:18
187	250	27	1	2024-09-09 11:39:54	2024-09-09 11:39:54
188	250	29	1	2024-09-09 11:39:54	2024-09-09 11:39:54
189	252	27	1	2024-09-09 20:58:59	2024-09-09 20:58:59
190	252	28	1	2024-09-09 20:58:59	2024-09-09 20:58:59
191	252	29	1	2024-09-09 20:58:59	2024-09-09 20:58:59
192	256	29	1	2024-09-10 11:39:26	2024-09-10 11:39:26
193	256	26	1	2024-09-10 11:39:26	2024-09-10 11:39:26
194	256	27	1	2024-09-10 11:39:26	2024-09-10 11:39:26
195	256	28	1	2024-09-10 11:39:26	2024-09-10 11:39:26
196	257	27	1	2024-09-10 16:26:38	2024-09-10 16:26:38
197	257	29	1	2024-09-10 16:26:38	2024-09-10 16:26:38
198	258	27	1	2024-09-10 16:52:27	2024-09-10 16:52:27
199	258	28	1	2024-09-10 16:52:27	2024-09-10 16:52:27
200	259	26	1	2024-09-10 17:10:51	2024-09-10 17:10:51
201	259	27	1	2024-09-10 17:10:51	2024-09-10 17:10:51
202	259	28	1	2024-09-10 17:10:51	2024-09-10 17:10:51
203	259	29	1	2024-09-10 17:10:51	2024-09-10 17:10:51
204	260	26	1	2024-09-10 17:18:05	2024-09-10 17:18:05
205	260	27	1	2024-09-10 17:18:05	2024-09-10 17:18:05
206	260	28	1	2024-09-10 17:18:05	2024-09-10 17:18:05
207	260	29	1	2024-09-10 17:18:05	2024-09-10 17:18:05
208	261	26	1	2024-09-10 17:18:40	2024-09-10 17:18:40
209	261	27	1	2024-09-10 17:18:40	2024-09-10 17:18:40
210	261	28	1	2024-09-10 17:18:40	2024-09-10 17:18:40
211	261	29	1	2024-09-10 17:18:40	2024-09-10 17:18:40
212	262	26	1	2024-09-10 17:30:37	2024-09-10 17:30:37
213	262	27	1	2024-09-10 17:30:37	2024-09-10 17:30:37
214	262	28	1	2024-09-10 17:30:37	2024-09-10 17:30:37
215	262	29	1	2024-09-10 17:30:37	2024-09-10 17:30:37
216	265	26	1	2024-09-10 21:03:15	2024-09-10 21:03:15
217	265	27	1	2024-09-10 21:03:15	2024-09-10 21:03:15
218	265	28	1	2024-09-10 21:03:15	2024-09-10 21:03:15
219	266	26	1	2024-09-10 21:09:24	2024-09-10 21:09:24
220	266	27	1	2024-09-10 21:09:24	2024-09-10 21:09:24
221	266	28	1	2024-09-10 21:09:24	2024-09-10 21:09:24
222	266	29	1	2024-09-10 21:09:24	2024-09-10 21:09:24
223	268	33	1	2024-09-13 08:58:57	2024-09-13 08:58:57
224	269	26	1	2024-09-13 09:11:11	2024-09-13 09:11:11
225	269	27	0	2024-09-13 09:11:11	2024-09-13 09:11:11
226	269	29	0	2024-09-13 09:11:11	2024-09-13 09:11:11
227	270	25	1	2024-09-14 13:22:23	2024-09-14 13:22:23
228	270	31	3	2024-09-14 13:22:23	2024-09-14 13:22:23
229	273	25	1	2024-09-14 14:03:30	2024-09-14 14:03:30
230	273	31	2	2024-09-14 14:03:30	2024-09-14 14:03:30
231	291	29	2	2024-09-30 12:14:13	2024-09-30 12:14:13
232	291	26	1	2024-09-30 12:14:13	2024-09-30 12:14:13
233	291	27	2	2024-09-30 12:14:13	2024-09-30 12:14:13
234	292	25	1	2024-09-30 16:57:52	2024-09-30 16:57:52
235	293	29	1	2024-09-30 17:44:35	2024-09-30 17:44:35
236	293	26	1	2024-09-30 17:44:35	2024-09-30 17:44:35
237	293	27	1	2024-09-30 17:44:35	2024-09-30 17:44:35
238	294	33	1	2024-10-01 05:48:05	2024-10-01 05:48:05
239	295	25	1	2024-10-01 06:42:22	2024-10-01 06:42:22
240	295	31	1	2024-10-01 06:42:22	2024-10-01 06:42:22
241	296	33	1	2024-10-01 06:49:40	2024-10-01 06:49:40
242	297	42	1	2024-10-01 11:48:06	2024-10-01 11:48:06
243	297	43	1	2024-10-01 11:48:06	2024-10-01 11:48:06
244	297	44	1	2024-10-01 11:48:06	2024-10-01 11:48:06
245	298	33	1	2024-10-02 13:53:45	2024-10-02 13:53:45
246	299	33	1	2024-10-03 16:51:18	2024-10-03 16:51:18
247	300	33	1	2024-10-03 16:53:06	2024-10-03 16:53:06
248	301	33	1	2024-10-03 16:56:25	2024-10-03 16:56:25
249	302	33	1	2024-10-03 16:56:45	2024-10-03 16:56:45
250	303	42	6	2024-10-03 17:03:07	2024-10-03 17:03:07
251	303	43	1	2024-10-03 17:03:07	2024-10-03 17:03:07
252	303	44	1	2024-10-03 17:03:07	2024-10-03 17:03:07
253	319	33	1	2024-10-09 07:32:31	2024-10-09 07:32:31
254	321	55	1	2024-10-09 12:00:47	2024-10-09 12:00:47
255	321	60	1	2024-10-09 12:00:47	2024-10-09 12:00:47
256	322	25	1	2024-10-09 12:10:35	2024-10-09 12:10:35
257	322	31	1	2024-10-09 12:10:35	2024-10-09 12:10:35
258	323	25	1	2024-10-09 12:15:58	2024-10-09 12:15:58
259	324	60	1	2024-10-09 12:19:27	2024-10-09 12:19:27
260	324	55	1	2024-10-09 12:19:27	2024-10-09 12:19:27
261	325	31	1	2024-10-09 12:21:25	2024-10-09 12:21:25
262	326	31	1	2024-10-09 12:23:12	2024-10-09 12:23:12
263	327	31	1	2024-10-09 12:30:12	2024-10-09 12:30:12
264	330	60	2	2024-10-10 06:32:52	2024-10-10 06:32:52
265	330	55	1	2024-10-10 06:32:52	2024-10-10 06:32:52
266	332	31	1	2024-10-10 10:32:45	2024-10-10 10:32:45
267	333	31	1	2024-10-10 10:34:54	2024-10-10 10:34:54
268	334	31	1	2024-10-10 10:49:27	2024-10-10 10:49:27
269	336	33	1	2024-10-11 03:37:42	2024-10-11 03:37:42
270	337	55	1	2024-10-16 16:10:16	2024-10-16 16:10:16
271	337	60	1	2024-10-16 16:10:16	2024-10-16 16:10:16
272	338	55	1	2024-10-16 16:10:30	2024-10-16 16:10:30
273	338	60	1	2024-10-16 16:10:30	2024-10-16 16:10:30
274	339	60	1	2024-10-16 16:25:54	2024-10-16 16:25:54
275	339	55	1	2024-10-16 16:25:54	2024-10-16 16:25:54
276	340	60	1	2024-10-16 16:41:19	2024-10-16 16:41:19
277	340	55	1	2024-10-16 16:41:19	2024-10-16 16:41:19
278	341	17	1	2024-10-17 04:19:43	2024-10-17 04:19:43
279	341	18	1	2024-10-17 04:19:43	2024-10-17 04:19:43
280	342	17	1	2024-10-17 04:22:38	2024-10-17 04:22:38
281	342	18	1	2024-10-17 04:22:38	2024-10-17 04:22:38
282	343	17	1	2024-10-17 04:24:52	2024-10-17 04:24:52
283	343	18	1	2024-10-17 04:24:52	2024-10-17 04:24:52
284	344	17	1	2024-10-17 04:50:17	2024-10-17 04:50:17
285	344	18	1	2024-10-17 04:50:17	2024-10-17 04:50:17
286	345	60	1	2024-10-17 05:12:09	2024-10-17 05:12:09
287	345	55	1	2024-10-17 05:12:09	2024-10-17 05:12:09
288	347	55	1	2024-10-17 11:42:08	2024-10-17 11:42:08
289	347	60	1	2024-10-17 11:42:08	2024-10-17 11:42:08
290	354	55	1	2024-10-18 17:24:18	2024-10-18 17:24:18
291	354	60	1	2024-10-18 17:24:18	2024-10-18 17:24:18
292	361	25	1	2024-10-19 08:04:51	2024-10-19 08:04:51
293	361	31	1	2024-10-19 08:04:51	2024-10-19 08:04:51
294	363	25	1	2024-10-19 08:14:36	2024-10-19 08:14:36
295	363	31	1	2024-10-19 08:14:36	2024-10-19 08:14:36
296	372	55	1	2024-10-19 11:39:26	2024-10-19 11:39:26
297	372	60	1	2024-10-19 11:39:26	2024-10-19 11:39:26
298	373	55	1	2024-10-19 11:40:55	2024-10-19 11:40:55
299	373	60	1	2024-10-19 11:40:55	2024-10-19 11:40:55
300	375	55	1	2024-10-19 12:03:01	2024-10-19 12:03:01
301	375	60	1	2024-10-19 12:03:01	2024-10-19 12:03:01
302	379	55	1	2024-10-20 09:37:26	2024-10-20 09:37:26
303	379	60	1	2024-10-20 09:37:26	2024-10-20 09:37:26
304	380	55	1	2024-10-20 09:38:10	2024-10-20 09:38:10
305	380	60	1	2024-10-20 09:38:10	2024-10-20 09:38:10
306	381	55	1	2024-10-20 10:19:21	2024-10-20 10:19:21
307	381	60	1	2024-10-20 10:19:21	2024-10-20 10:19:21
308	382	55	1	2024-10-20 10:20:09	2024-10-20 10:20:09
309	382	60	1	2024-10-20 10:20:09	2024-10-20 10:20:09
310	383	55	1	2024-10-20 10:26:31	2024-10-20 10:26:31
311	383	60	1	2024-10-20 10:26:31	2024-10-20 10:26:31
312	387	25	1	2024-10-21 04:45:09	2024-10-21 04:45:09
313	387	31	1	2024-10-21 04:45:09	2024-10-21 04:45:09
314	390	25	1	2024-10-21 04:54:19	2024-10-21 04:54:19
315	390	31	1	2024-10-21 04:54:19	2024-10-21 04:54:19
316	391	55	1	2024-10-21 05:01:31	2024-10-21 05:01:31
317	391	60	1	2024-10-21 05:01:31	2024-10-21 05:01:31
318	398	55	1	2024-10-21 07:30:27	2024-10-21 07:30:27
319	398	60	1	2024-10-21 07:30:27	2024-10-21 07:30:27
320	399	55	1	2024-10-21 11:18:28	2024-10-21 11:18:28
321	399	60	1	2024-10-21 11:18:28	2024-10-21 11:18:28
322	400	55	1	2024-10-21 12:24:05	2024-10-21 12:24:05
323	400	60	1	2024-10-21 12:24:05	2024-10-21 12:24:05
324	401	55	1	2024-10-21 13:24:34	2024-10-21 13:24:34
325	401	60	1	2024-10-21 13:24:34	2024-10-21 13:24:34
326	402	55	1	2024-10-21 14:57:50	2024-10-21 14:57:50
327	402	60	1	2024-10-21 14:57:50	2024-10-21 14:57:50
328	409	55	1	2024-10-22 13:32:31	2024-10-22 13:32:31
329	409	60	1	2024-10-22 13:32:31	2024-10-22 13:32:31
330	421	55	1	2024-10-23 15:45:20	2024-10-23 15:45:20
331	421	60	1	2024-10-23 15:45:20	2024-10-23 15:45:20
332	426	55	1	2024-10-24 04:01:35	2024-10-24 04:01:35
333	426	60	1	2024-10-24 04:01:35	2024-10-24 04:01:35
334	428	55	1	2024-10-24 04:24:53	2024-10-24 04:24:53
335	428	60	1	2024-10-24 04:24:53	2024-10-24 04:24:53
336	431	55	1	2024-10-24 06:16:26	2024-10-24 06:16:26
337	431	60	1	2024-10-24 06:16:26	2024-10-24 06:16:26
338	432	60	1	2024-10-24 06:50:11	2024-10-24 06:50:11
339	443	60	1	2024-10-24 12:45:13	2024-10-24 12:45:13
340	443	55	1	2024-10-24 12:45:13	2024-10-24 12:45:13
341	445	60	1	2024-10-24 12:48:53	2024-10-24 12:48:53
342	445	55	1	2024-10-24 12:48:53	2024-10-24 12:48:53
343	450	61	1	2024-10-24 13:08:35	2024-10-24 13:08:35
344	450	62	1	2024-10-24 13:08:35	2024-10-24 13:08:35
345	451	61	1	2024-10-24 13:14:13	2024-10-24 13:14:13
346	451	62	1	2024-10-24 13:14:13	2024-10-24 13:14:13
347	456	25	1	2024-10-30 07:57:29	2024-10-30 07:57:29
348	457	61	1	2024-10-30 13:21:06	2024-10-30 13:21:06
349	457	62	1	2024-10-30 13:21:06	2024-10-30 13:21:06
350	466	61	1	2024-11-05 14:28:56	2024-11-05 14:28:56
351	466	62	1	2024-11-05 14:28:56	2024-11-05 14:28:56
352	467	61	1	2024-11-05 14:33:52	2024-11-05 14:33:52
353	467	62	1	2024-11-05 14:33:52	2024-11-05 14:33:52
354	471	61	1	2024-11-05 15:48:37	2024-11-05 15:48:37
355	471	62	1	2024-11-05 15:48:37	2024-11-05 15:48:37
356	472	61	1	2024-11-06 07:53:19	2024-11-06 07:53:19
357	472	62	1	2024-11-06 07:53:19	2024-11-06 07:53:19
358	473	25	1	2024-11-06 12:01:01	2024-11-06 12:01:01
359	473	31	1	2024-11-06 12:01:01	2024-11-06 12:01:01
360	475	63	1	2024-11-06 15:08:15	2024-11-06 15:08:15
361	475	64	1	2024-11-06 15:08:15	2024-11-06 15:08:15
362	476	63	1	2024-11-07 17:11:37	2024-11-07 17:11:37
363	476	64	1	2024-11-07 17:11:37	2024-11-07 17:11:37
364	477	63	1	2024-11-07 19:04:51	2024-11-07 19:04:51
365	477	64	1	2024-11-07 19:04:51	2024-11-07 19:04:51
366	478	63	1	2024-11-08 09:33:55	2024-11-08 09:33:55
367	478	64	1	2024-11-08 09:33:55	2024-11-08 09:33:55
368	479	63	1	2024-11-08 12:09:26	2024-11-08 12:09:26
369	479	64	1	2024-11-08 12:09:27	2024-11-08 12:09:27
370	480	64	1	2024-11-16 08:42:28	2024-11-16 08:42:28
\.


--
-- Data for Name: temp_bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_bookings (id, user_id, booking_type, booking_id, yatch_id, package_id, booking_date, slot_from, slot_to, no_of_adults, no_of_children, special_requests, payment_mode, sub_total, tax, tax_percentage, grand_total, add_on_total, extra_product_prices, coupon_discount, need_update_on_email_whatsap, created_by, created_for, profile_title, first_name, last_name, email, dial_code, phone_number, offer_id, discount, booking_status, is_manual, provider_user_id, payment_type, coupon_id, created_at, updated_at, package_extra_hours) FROM stdin;
1	75	yatch	BL-1723722575	31	0	2024-08-15	17:00:00	18:00:00	2	0	hi	0	500	0	5	0	0	0	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	3313334563	27	500	0	0	68	0	0	2024-08-15 11:49:35	2024-08-15 11:49:35	0
2	75	yatch	BL-1723722591	31	0	2024-08-15	17:00:00	18:00:00	2	0	hi	0	500	0	5	0	0	0	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	3313334563	27	500	0	0	68	0	0	2024-08-15 11:49:51	2024-08-15 11:49:51	0
3	75	yatch	BL-1723722599	31	0	2024-08-15	17:00:00	18:00:00	2	0	hi	0	500	0	5	0	0	0	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	3313334563	27	500	0	0	68	0	0	2024-08-15 11:49:59	2024-08-15 11:49:59	0
4	75	yatch	BL-1723722735	31	0	2024-08-15	17:00:00	18:00:00	2	0	hi	0	500	0	5	0	0	0	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	3313334563	27	500	0	0	68	0	0	2024-08-15 11:52:15	2024-08-15 11:52:15	0
5	75	yatch	BL-1723722990	31	0	2024-08-15	17:00:00	18:00:00	2	0	hi	0	500	25	5	525	0	0	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	0	0	68	0	0	2024-08-15 11:56:30	2024-08-15 11:56:30	0
6	75	yatch	BL-1723723046	31	0	2024-08-15	17:00:00	18:00:00	2	0	hi	0	500	25	5	525	0	0	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	0	0	68	0	0	2024-08-15 11:57:26	2024-08-15 11:57:26	0
7	75	yatch	BL-1723723167	31	0	2024-08-15	17:00:00	18:00:00	2	0	hi	0	500	0	5	0	0	0	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	3313334563	27	500	0	0	68	0	0	2024-08-15 11:59:27	2024-08-15 11:59:27	0
8	75	yatch	BL-1723723224	31	0	2024-08-15	17:00:00	18:00:00	2	0	hi	0	500	0	5	0	0	0	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	3313334563	27	500	0	0	68	0	0	2024-08-15 12:00:24	2024-08-15 12:00:24	0
9	75	yatch	BL-1723723283	31	0	2024-08-15	18:00:00	19:00:00	2	0	hi	0	500	0	5	0	0	0	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	3313334563	27	500	0	0	68	0	0	2024-08-15 12:01:23	2024-08-15 12:01:23	0
10	75	yatch	BL-1723723331	31	0	2024-08-15	17:00:00	18:00:00	2	0	hi	0	500	0	5	0	0	0	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	3313334563	27	500	0	0	68	0	0	2024-08-15 12:02:11	2024-08-15 12:02:11	0
11	75	yatch	BL-1723723415	31	0	2024-08-15	17:00:00	18:00:00	2	0	hi	0	500	0	5	0	0	0	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	3313334563	27	500	0	0	68	0	0	2024-08-15 12:03:35	2024-08-15 12:03:35	0
12	75	yatch	BL-1723723538	31	0	2024-08-15	18:00:00	19:00:00	2	0	hi	0	500	0	5	0	0	0	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	3313334563	27	500	0	0	68	0	0	2024-08-15 12:05:38	2024-08-15 12:05:38	0
14	75	yatch	BL-1723723623	31	0	2024-08-15	18:00:00	19:00:00	2	0	hi	0	500	25	5	525	0	0	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	3313334563	0	0	0	0	68	0	0	2024-08-15 12:07:03	2024-08-15 12:07:03	0
18	75	yatch	BL-1723729251	31	0	2024-08-15	18:00:00	19:00:00	2	0	hi	0	500	25	5	525	0	0	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	3313334563	0	0	0	0	68	0	0	2024-08-15 13:40:51	2024-08-15 13:40:51	0
19	75	yatch	BL-1723729288	31	0	2024-08-15	18:00:00	19:00:00	4	0		0	500	0	5	0	0	0	0	0	75	75	Mr	Usama	Shakeel	ushakeel010@gmail.com	91	331637372	27	500	0	0	68	0	0	2024-08-15 13:41:28	2024-08-15 13:41:28	0
20	75	yatch	BL-1723729303	31	0	2024-08-15	18:00:00	19:00:00	2	0	hi	0	500	25	5	525	0	0	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	3313334563	0	0	0	0	68	0	0	2024-08-15 13:41:43	2024-08-15 13:41:43	0
21	75	yatch	BL-1723729358	31	0	2024-08-15	18:00:00	19:00:00	2	0	hi	0	500	25	5	525	0	0	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	3313334563	0	0	0	0	68	0	0	2024-08-15 13:42:38	2024-08-15 13:42:38	0
22	75	yatch	BL-1723729373	31	0	2024-08-15	18:00:00	19:00:00	2	0	hi	0	500	25	5	525	0	0	0	0	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	3313334563	0	0	0	0	68	0	0	2024-08-15 13:42:53	2024-08-15 13:42:53	0
23	75	yatch	BL-1723729381	31	0	2024-08-15	18:00:00	19:00:00	2	0		0	500	25	5	525	0	0	0	0	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	3313334563	0	0	0	0	68	0	0	2024-08-15 13:43:01	2024-08-15 13:43:01	0
24	75	yatch	BL-1723729392	31	0	2024-08-15	18:00:00	19:00:00	2	0		0	500	25	5	525	0	0	0	0	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	971	3313334563	0	0	0	0	68	0	0	2024-08-15 13:43:12	2024-08-15 13:43:12	0
25	75	yatch	BL-1723729429	31	0	2024-08-15	18:00:00	19:00:00	2	0		0	500	0	5	0	0	0	0	0	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	971	3313334563	27	500	0	0	68	0	0	2024-08-15 13:43:49	2024-08-15 13:43:49	0
26	75	yatch	BL-1723729480	31	0	2024-08-15	18:00:00	19:00:00	4	0		0	500	0	5	0	0	0	0	0	75	75	Mr	Usama	Shakeel	ushakeel010@gmail.com	91	331637372	27	500	0	0	68	0	0	2024-08-15 13:44:40	2024-08-15 13:44:40	0
30	75	yatch	BL-1723729721	31	0	2024-08-15	18:00:00	19:00:00	4	0		0	500	25	5	525	0	0	0	0	75	75	Mr	Usama	Shakeel	ushakeel010@gmail.com	91	452526362	0	0	0	0	68	0	0	2024-08-15 13:48:41	2024-08-15 13:48:41	0
32	75	yatch	BL-1723729806	31	0	2024-08-15	18:00:00	19:00:00	2	0		0	500	25	5	525	0	0	0	0	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	971	3313334563	0	0	0	0	68	0	0	2024-08-15 13:50:06	2024-08-15 13:50:06	0
33	75	yatch	BL-1723730234	31	0	2024-08-15	18:00:00	19:00:00	4	0		0	500	25	5	525	0	0	0	0	75	75	mr	Usama	Shakeel	ushakeel010@gmail.com	91	331737382	0	0	0	0	68	0	0	2024-08-15 13:57:14	2024-08-15 13:57:14	0
34	75	yatch	BL-1723732334	31	0	2024-08-15	19:00:00	20:00:00	2	1		0	500	25	5	525	0	0	0	0	75	75	\N	\N	\N		\N	\N	0	0	0	0	68	0	0	2024-08-15 14:32:14	2024-08-15 14:32:14	0
35	75	yatch	BL-1723732388	31	0	2024-08-15	19:00:00	20:00:00	2	1		0	500	25	5	525	0	0	0	0	75	75	\N	\N	\N		\N	\N	0	0	0	0	68	0	0	2024-08-15 14:33:08	2024-08-15 14:33:08	0
36	75	yatch	BL-1723732444	31	0	2024-08-15	19:00:00	20:00:00	2	1		0	500	25	5	525	0	0	0	0	75	75	\N	\N	\N		\N	\N	0	0	0	0	68	0	0	2024-08-15 14:34:04	2024-08-15 14:34:04	0
37	75	yatch	BL-1723732534	31	0	2024-08-15	19:00:00	20:00:00	2	2		0	500	25	5	525	0	0	0	0	75	75	\N	\N	\N		\N	\N	0	0	0	0	68	0	0	2024-08-15 14:35:34	2024-08-15 14:35:34	0
38	75	yatch	BL-1723732614	31	0	2024-08-15	19:00:00	20:00:00	2	2		0	500	25	5	525	0	0	0	1	75	75	mr	Usama	Shakeel	ushakeel010@gmail.com	91	3317277323	0	0	0	0	68	0	0	2024-08-15 14:36:54	2024-08-15 14:36:54	0
39	75	yatch	BL-1723732698	31	0	2024-08-15	18:00:00	19:00:00	2	0		0	500	25	5	525	0	0	0	0	75	75	\N	\N	\N		\N	\N	0	0	0	0	68	0	0	2024-08-15 14:38:18	2024-08-15 14:38:18	0
40	75	yatch	BL-1723733421	31	0	2024-08-15	19:00:00	20:00:00	2	2		0	500	25	5	525	0	0	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	68	0	0	2024-08-15 14:50:21	2024-08-15 14:50:21	0
41	75	yatch	BL-1723740002	31	0	2024-08-15	21:00:00	22:00:00	2	3	Special text	0	500	25	5	525	0	0	0	1	75	75	Mr	Usama	Shakeel	ushakeel010@gmail.com	91	3315788394	0	0	0	0	68	0	0	2024-08-15 16:40:02	2024-08-15 16:40:02	0
42	75	yatch	BL-1723798284	36	0	2024-08-16	17:00:00	18:00:00	2	2		0	300	15	5	315	0	0	0	1	75	75	Mr	Usama	Shakeel	shhhdjsj	91	3315002750	0	0	0	0	68	0	0	2024-08-16 08:51:24	2024-08-16 08:51:24	0
43	75	yatch	BL-1723812905	29	0	2024-08-17	08:00:00	10:00:00	2	2		0	10000	500	5	10500	0	0	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	60	0	0	2024-08-16 12:55:05	2024-08-16 12:55:05	0
50	75	pacakge	BL-1723834830	4	3	2024-08-17	06:00:00	07:00:00	2	0	hi	0	1500	78.5	5	1648.5	10	60	0	0	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	971	3313334563	0	0	0	0	8	0	0	2024-08-16 19:00:30	2024-08-16 19:00:30	0
51	75	pacakge	BL-1723835004	4	3	2024-08-17	05:00:00	06:00:00	2	0		0	1500	78.5	5	1648.5	10	60	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	8	0	0	2024-08-16 19:03:24	2024-08-16 19:03:24	0
52	75	pacakge	BL-1723835035	4	3	2024-08-17	05:00:00	06:00:00	2	0		0	1500	78.5	5	1648.5	10	60	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	8	0	0	2024-08-16 19:03:55	2024-08-16 19:03:55	0
53	75	pacakge	BL-1723835067	4	3	2024-08-17	05:00:00	06:00:00	2	0		0	1500	78.5	5	1648.5	10	60	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	8	0	0	2024-08-16 19:04:27	2024-08-16 19:04:27	0
54	75	pacakge	BL-1723835081	4	3	2024-08-17	06:00:00	07:00:00	2	0	hi	0	1500	78.5	5	1648.5	10	60	0	0	75	75	mr	\N	\N	sooraj.a2solution@gmail.com	971	3313334563	0	0	0	0	8	0	0	2024-08-16 19:04:41	2024-08-16 19:04:41	0
55	75	pacakge	BL-1723835091	4	3	2024-08-17	06:00:00	07:00:00	2	0	hi	0	1500	78.5	5	1648.5	10	60	0	0	75	75	mr	\N	\N	sooraj.a2solution@gmail.com	971	3313334563	0	0	0	0	8	0	0	2024-08-16 19:04:51	2024-08-16 19:04:51	0
56	75	pacakge	BL-1723835131	4	3	2024-08-17	06:00:00	07:00:00	2	0	hi	0	1500	78.5	5	1648.5	10	60	0	0	75	75	mr	\N	\N	sooraj.a2solution@gmail.com	\N	\N	0	0	0	0	8	0	0	2024-08-16 19:05:31	2024-08-16 19:05:31	0
57	75	pacakge	BL-1723835137	4	3	2024-08-17	06:00:00	07:00:00	2	0	hi	0	1500	78.5	5	1648.5	10	60	0	0	75	75	mr	\N	\N		\N	\N	0	0	0	0	8	0	0	2024-08-16 19:05:37	2024-08-16 19:05:37	0
58	75	pacakge	BL-1723835142	4	3	2024-08-17	06:00:00	07:00:00	2	0		0	1500	78.5	5	1648.5	10	60	0	0	75	75	mr	\N	\N		\N	\N	0	0	0	0	8	0	0	2024-08-16 19:05:42	2024-08-16 19:05:42	0
59	75	pacakge	BL-1723835269	4	3	2024-08-17	08:00:00	09:00:00	2	0		0	1500	79	5	1659	20	60	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	8	0	0	2024-08-16 19:07:49	2024-08-16 19:07:49	0
60	75	pacakge	BL-1723835459	4	3	2024-08-17	08:00:00	09:00:00	2	0		0	1500	78.5	5	1648.5	10	60	0	0	75	75	mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	8	0	0	2024-08-16 19:10:59	2024-08-16 19:10:59	0
61	75	pacakge	BL-1723835469	4	3	2024-08-17	08:00:00	09:00:00	2	0	hi	0	1500	78.5	5	1648.5	10	60	0	0	75	75	mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	8	0	0	2024-08-16 19:11:09	2024-08-16 19:11:09	0
62	75	pacakge	BL-1723835474	4	3	2024-08-17	08:00:00	09:00:00	2	0		0	1500	78.5	5	1648.5	10	60	0	0	75	75	mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	8	0	0	2024-08-16 19:11:14	2024-08-16 19:11:14	0
63	75	pacakge	BL-1723835481	4	3	2024-08-17	08:00:00	09:00:00	2	0		0	1500	78.5	5	1648.5	10	60	0	0	75	75	mr	\N	\N	ushakeel010@gmail.com	971	\N	0	0	0	0	8	0	0	2024-08-16 19:11:21	2024-08-16 19:11:21	0
64	75	pacakge	BL-1723835508	4	3	2024-08-17	08:00:00	09:00:00	2	0		0	1500	78.5	5	1648.5	10	60	0	0	75	75	mr	Usama	Shakeel	ushakeel010@gmail.com	971	338646064	0	0	0	0	8	0	0	2024-08-16 19:11:48	2024-08-16 19:11:48	0
65	75	pacakge	BL-1723835517	4	3	2024-08-17	08:00:00	09:00:00	2	0		0	1500	78.5	5	1648.5	10	60	0	0	75	75	mr	Usama	Shakeel	ushakeel010@gmail.com	971	338646064	0	0	0	0	8	0	0	2024-08-16 19:11:57	2024-08-16 19:11:57	0
66	75	pacakge	BL-1723835625	4	3	2024-08-17	05:00:00	06:00:00	2	0		0	1500	79	5	1659	20	60	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	8	0	0	2024-08-16 19:13:45	2024-08-16 19:13:45	0
67	75	pacakge	BL-1723839478	4	3	2024-08-17	05:00:00	07:00:00	2	0		0	1500	75	5	1575	0	0	0	1	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	8	0	0	2024-08-16 20:17:58	2024-08-16 20:17:58	0
68	75	pacakge	BL-1723840096	4	3	2024-08-17	05:00:00	06:00:00	2	0		0	1500	128.5	5	2698.5	10	1060	0	1	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	8	0	0	2024-08-16 20:28:16	2024-08-16 20:28:16	0
69	75	pacakge	BL-1723840379	4	3	2024-08-17	05:00:00	07:00:00	2	0		0	1500	128.5	5	2698.5	10	1060	0	1	75	75	Mr	Usama	Shakeel	ahdjaja	91	3315864668	0	0	0	0	8	0	0	2024-08-16 20:32:59	2024-08-16 20:32:59	0
70	75	pacakge	BL-1723841031	4	3	2024-08-17	05:00:00	07:00:00	2	0		0	1500	129.5	5	2719.5	30	1060	0	1	75	75	Mr	Usama	Shakeel	ushakeel010@gmail.com	91	331586460	0	0	0	0	8	0	0	2024-08-16 20:43:51	2024-08-16 20:43:51	0
71	75	pacakge	BL-1723841221	4	3	2024-08-17	05:00:00	07:00:00	2	0		0	1500	129.5	5	2719.5	30	1060	0	1	75	75	Mr	Usama	Shakeel	ushakeel010@gmail.com	91	331506460	0	0	0	0	8	0	0	2024-08-16 20:47:01	2024-08-16 20:47:01	0
72	50	yatch	BL-1723848245	32	0	2024-08-18	05:00:00	06:00:00	8	2		0	0	0	5	0	0	0	0	1	50	50	Mr	Asad	Nazir	asadnazir289@gmail.com	+92	3441560318	0	0	0	0	63	0	0	2024-08-16 22:44:05	2024-08-16 22:44:05	0
73	73	pacakge	BL-1723849296	4	3	2024-08-17	11:00:00	12:00:00	1	2		0	1500	75	5	1575	0	0	0	0	73	73	\N	\N	\N		\N	\N	0	0	0	0	8	0	0	2024-08-16 23:01:36	2024-08-16 23:01:36	0
74	73	pacakge	BL-1723849694	4	3	2024-08-17	11:00:00	12:00:00	1	2		0	1500	75	5	1575	0	0	0	1	73	73	Mr	test	njky	teydu@gmail.com	+971	51681848445	0	0	0	0	8	0	0	2024-08-16 23:08:14	2024-08-16 23:08:14	0
75	73	pacakge	BL-1723850078	4	3	2024-08-17	14:00:00	15:00:00	1	2	hi	0	1500	75	5	1575	0	0	0	1	73	73	Mr	test	njky	teydu@gmail.com	+971	51681848445	0	0	0	0	8	0	0	2024-08-16 23:14:38	2024-08-16 23:14:38	0
77	73	pacakge	BL-1723850412	4	3	2024-08-17	14:00:00	15:00:00	1	2	hi	0	1500	75	5	1575	0	0	0	1	73	73	Mr	test	njky	teydu@gmail.com	+971	51681848445	0	0	0	0	8	0	0	2024-08-16 23:20:12	2024-08-16 23:20:12	0
78	75	pacakge	BL-1723898405	4	3	2024-08-17	17:00:00	18:00:00	3	0		0	1500	129.5	5	2719.5	30	1060	0	1	75	75	Mr	Usama	Shakeel	ushakeel010@gmail.com	91	331686860	0	0	0	0	8	0	0	2024-08-17 12:40:05	2024-08-17 12:40:05	0
79	75	pacakge	BL-1723898802	4	3	2024-08-17	18:00:00	19:00:00	2	0		0	1500	129	5	2709	20	1060	0	1	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	8	0	0	2024-08-17 12:46:42	2024-08-17 12:46:42	0
80	78	pacakge	BL-1723918350	4	3	2024-08-18	13:00:00	14:00:00	1	2		0	1500	126	5	2646	20	1000	0	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-17 18:12:30	2024-08-17 18:12:30	0
81	78	pacakge	BL-1723923397	4	3	2024-08-17	07:00:00	08:00:00	1	12		0	1500	125.5	5	2635.5	10	1000	0	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-17 19:36:37	2024-08-17 19:36:37	0
82	78	pacakge	BL-1723924612	4	3	2024-08-17	07:00:00	08:00:00	1	2		0	1500	82	5	1722	20	120	0	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-17 19:56:52	2024-08-17 19:56:52	0
83	78	pacakge	BL-1723924858	4	3	2024-08-18	13:00:00	14:00:00	1	2		0	1500	226.5	5	4756.5	30	3000	0	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-17 20:00:58	2024-08-17 20:00:58	0
84	78	pacakge	BL-1723937474	4	3	2024-08-18	07:00:00	08:00:00	1	2	my special request	0	1500	78.5	5	1648.5	10	60	0	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-17 23:31:14	2024-08-17 23:31:14	0
85	78	pacakge	BL-1723938831	4	3	2024-08-18	16:00:00	17:00:00	1	2	my special interest	0	1500	226.5	5	4756.5	30	3000	0	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-17 23:53:51	2024-08-17 23:53:51	0
86	77	pacakge	BL-1723972679	35	128	2024-08-18	16:00:00	17:00:00	2	2		0	1500	80	5	1680	40	60	0	1	77	77	\N	Anil	navis	an@an.com	+971	534005096	0	0	0	0	76	0	0	2024-08-18 09:17:59	2024-08-18 09:17:59	0
87	77	pacakge	BL-1723972789	35	128	2024-08-18	16:00:00	17:00:00	2	2		0	1500	80	5	1680	40	60	0	1	77	77	\N	Anil	navis	an@an.com	+971	534005096	0	0	0	0	76	0	0	2024-08-18 09:19:49	2024-08-18 09:19:49	0
88	77	pacakge	BL-1723973069	35	128	2024-08-18	18:00:00	19:00:00	2	2	Hash	0	1500	77	5	1617	40	0	0	1	77	77	Mr	Anil	navis	an@an.com	+971	534005096	0	0	0	0	76	0	0	2024-08-18 09:24:29	2024-08-18 09:24:29	0
89	75	yatch	BL-1723973204	36	0	2024-08-18	17:00:00	18:00:00	2	0		0	100	5	5	105	0	0	0	0	75	75	\N	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	68	0	0	2024-08-18 09:26:44	2024-08-18 09:26:44	0
90	75	pacakge	BL-1723973917	35	128	2024-08-18	18:00:00	19:00:00	2	0		0	1500	80	5	1680	40	60	0	0	75	75	\N	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	76	0	0	2024-08-18 09:38:37	2024-08-18 09:38:37	0
91	75	pacakge	BL-1723974342	35	128	2024-08-18	16:00:00	17:00:00	4	0	hi	0	1500	75	5	1575	0	0	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	0	0	76	0	0	2024-08-18 09:45:42	2024-08-18 09:45:42	0
92	75	pacakge	BL-1723974430	35	128	2024-08-18	16:00:00	17:00:00	4	0	hi	0	1500	75	5	1575	0	0	0	1	75	75	\N	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	0	0	76	0	0	2024-08-18 09:47:10	2024-08-18 09:47:10	0
93	77	pacakge	BL-1723974992	35	128	2024-08-18	19:00:00	20:00:00	2	0		0	1500	80	5	1680	40	60	0	0	77	77	Ms	Anil	navis	an@an.com	+971	534005096	0	0	0	0	76	0	0	2024-08-18 09:56:32	2024-08-18 09:56:32	0
94	77	pacakge	BL-1723975070	35	128	2024-08-18	19:00:00	20:00:00	3	0		0	1500	84	5	1764	120	60	0	1	77	77	Ms	Anil	navis	an@an.com	+971	534005096	0	0	0	0	76	0	0	2024-08-18 09:57:50	2024-08-18 09:57:50	0
95	77	pacakge	BL-1723975524	35	128	2024-08-18	19:00:00	20:00:00	2	0		0	1500	78	5	1638	0	60	0	0	77	77	Ms	Anil	navis	an@an.com	+971	534005096	0	0	0	0	76	0	0	2024-08-18 10:05:24	2024-08-18 10:05:24	0
96	77	pacakge	BL-1723977547	35	128	2024-08-18	16:00:00	17:00:00	2	2		0	1500	80	5	1680	40	60	0	0	77	77	Mr	Anil	navis	an@an.com	+971	534005096	0	0	0	0	76	0	0	2024-08-18 10:39:07	2024-08-18 10:39:07	0
97	75	pacakge	BL-1724053707	4	3	2024-08-19	13:00:00	04:00:00	2	0		0	1500	78.5	5	1648.5	10	60	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	8	0	0	2024-08-19 07:48:27	2024-08-19 07:48:27	0
98	75	pacakge	BL-1724053795	35	128	2024-08-19	20:00:00	04:00:00	2	0		0	1500	80	5	1680	40	60	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	76	0	0	2024-08-19 07:49:55	2024-08-19 07:49:55	0
99	75	pacakge	BL-1724054455	35	128	2024-08-19	20:00:00	04:00:00	2	0		0	1500	80	5	1680	40	60	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	76	0	0	2024-08-19 08:00:55	2024-08-19 08:00:55	0
100	75	yatch	BL-1724054550	29	0	2024-08-19	16:00:00	17:00:00	2	0		0	6000	300	5	6300	0	0	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	60	0	0	2024-08-19 08:02:30	2024-08-19 08:02:30	0
101	75	pacakge	BL-1724054728	35	125	2024-08-20	13:00:00	04:00:00	2	2		0	200	12.75	5	267.75	55	0	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	76	0	0	2024-08-19 08:05:28	2024-08-19 08:05:28	0
102	75	pacakge	BL-1724054966	35	128	2024-08-19	13:00:00	04:00:00	4	0	hi	0	1500	75	5	1575	0	0	0	1	75	75	\N	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	0	0	76	0	0	2024-08-19 08:09:26	2024-08-19 08:09:26	0
103	75	pacakge	BL-1724054991	35	128	2024-08-19	13:00:00	04:00:00	4	0	hi	0	1500	75	5	1575	0	0	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	0	0	76	0	0	2024-08-19 08:09:51	2024-08-19 08:09:51	0
107	77	pacakge	BL-1724059251	4	3	2024-08-19	18:00:00	04:00:00	2	2	Beheld	0	1500	75.5	5	1585.5	10	0	0	1	77	77	Mr	Anil	navis	an@an.com	+971	534005096	0	0	0	0	8	0	0	2024-08-19 09:20:51	2024-08-19 09:20:51	0
108	77	pacakge	BL-1724059575	4	3	2024-08-19	17:00:00	04:00:00	2	3	Ghulam	0	1500	75.5	5	1585.5	10	0	0	1	77	77	Mr	Anil	navis	an@an.com	+971	534005096	0	0	0	0	8	0	0	2024-08-19 09:26:15	2024-08-19 09:26:15	0
109	78	pacakge	BL-1724060258	4	3	2024-08-19	15:00:00	04:00:00	1	2		0	1500	128.5	5	2698.5	10	1060	0	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-19 09:37:38	2024-08-19 09:37:38	0
110	78	pacakge	BL-1724061090	4	3	2024-08-19	17:00:00	04:00:00	1	2		0	1500	78.5	5	1648.5	10	60	0	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-19 09:51:30	2024-08-19 09:51:30	0
111	77	pacakge	BL-1724062224	35	129	2024-08-19	15:00:00	04:00:00	2	2	Nothing	0	1500	75	5	1575	0	0	0	1	77	77	Mr	Anil	navis	an@an.com	+971	534005096	0	0	0	0	76	0	0	2024-08-19 10:10:24	2024-08-19 10:10:24	0
112	75	pacakge	BL-1724063355	35	129	2024-08-19	15:00:00	04:00:00	2	0		0	1500	77.75	5	1632.75	55	0	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	76	0	0	2024-08-19 10:29:15	2024-08-19 10:29:15	0
113	75	pacakge	BL-1724063466	35	129	2024-08-19	15:00:00	04:00:00	2	0		0	1500	77.75	5	1632.75	55	0	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	76	0	0	2024-08-19 10:31:06	2024-08-19 10:31:06	0
114	75	pacakge	BL-1724063621	35	129	2024-08-19	15:00:00	04:00:00	4	0	hi	0	1500	75	5	1575	0	0	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	0	0	76	0	0	2024-08-19 10:33:41	2024-08-19 10:33:41	0
115	75	pacakge	BL-1724064445	35	129	2024-08-19	17:00:00	19:00:00	2	0		0	1500	77.75	5	1632.75	55	0	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	76	0	0	2024-08-19 10:47:25	2024-08-19 10:47:25	0
116	75	pacakge	BL-1724064506	35	129	2024-08-19	15:00:00	17:00:00	4	0	hi	0	1500	75	5	1575	0	0	0	1	75	75	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	0	0	76	0	0	2024-08-19 10:48:26	2024-08-19 10:48:26	0
117	75	pacakge	BL-1724067109	35	128	2024-08-19	17:00:00	20:00:00	2	0		0	1500	80	5	1680	40	60	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	76	0	0	2024-08-19 11:31:49	2024-08-19 11:31:49	0
118	75	yatch	BL-1724067950	29	0	2024-08-20	07:00:00	08:00:00	2	0		0	5000	250	5	5250	0	0	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	60	0	0	2024-08-19 11:45:50	2024-08-19 11:45:50	0
119	75	yatch	BL-1724068173	29	0	2024-08-20	07:00:00	08:00:00	2	0		0	5000	125	5	2625	0	0	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	20	2500	0	0	60	0	0	2024-08-19 11:49:33	2024-08-19 11:49:33	0
120	75	yatch	BL-1724068296	29	0	2024-08-20	07:00:00	08:00:00	2	0		0	5000	250	5	5250	0	0	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	60	0	0	2024-08-19 11:51:36	2024-08-19 11:51:36	0
121	75	yatch	BL-1724068902	29	0	2024-08-20	09:00:00	10:00:00	2	0		0	5000	125	5	2625	0	0	0	0	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	23	2500	0	0	60	0	0	2024-08-19 12:01:42	2024-08-19 12:01:42	0
122	75	pacakge	BL-1724068979	35	128	2024-08-20	13:00:00	16:00:00	2	0		0	1500	80	5	1680	40	60	0	1	75	75	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	76	0	0	2024-08-19 12:02:59	2024-08-19 12:02:59	0
123	83	pacakge	BL-1724070956	35	128	2024-08-19	20:00:00	23:00:00	2	0		0	1500	77	5	1617	40	0	0	0	83	83	Mr	\N	\N	ushakeel010@gmail.com	971	338646064	0	0	0	0	76	0	0	2024-08-19 12:35:56	2024-08-19 12:35:56	0
124	83	pacakge	BL-1724071052	35	128	2024-08-19	20:00:00	23:00:00	2	0		0	1500	77	5	1617	40	0	0	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	0	0	0	0	76	0	0	2024-08-19 12:37:32	2024-08-19 12:37:32	0
125	83	pacakge	BL-1724071469	35	128	2024-08-20	13:00:00	16:00:00	3	0		0	1500	80	5	1680	40	60	0	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	0	0	0	0	76	0	0	2024-08-19 12:44:29	2024-08-19 12:44:29	0
126	83	pacakge	BL-1724072495	35	128	2024-08-20	18:00:00	21:00:00	2	0		0	1500	80	5	1680	40	60	0	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	0	0	0	0	76	0	0	2024-08-19 13:01:35	2024-08-19 13:01:35	0
127	83	pacakge	BL-1724072640	35	128	2024-08-20	18:00:00	21:00:00	2	0		0	1500	80	5	1680	40	60	0	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	0	0	0	0	76	0	0	2024-08-19 13:04:00	2024-08-19 13:04:00	0
128	83	pacakge	BL-1724072723	35	128	2024-08-20	18:00:00	21:00:00	2	0		0	1500	80	5	1680	40	60	0	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	0	0	0	0	76	0	0	2024-08-19 13:05:23	2024-08-19 13:05:23	0
129	83	pacakge	BL-1724072826	35	128	2024-08-20	18:00:00	21:00:00	2	0		0	1500	80	5	1680	40	60	0	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	0	0	0	0	76	0	0	2024-08-19 13:07:06	2024-08-19 13:07:06	0
130	83	pacakge	BL-1724073066	35	128	2024-08-20	18:00:00	21:00:00	2	0		0	1500	80	5	1680	40	60	0	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	0	0	0	0	76	0	0	2024-08-19 13:11:06	2024-08-19 13:11:06	0
131	83	pacakge	BL-1724073380	35	128	2024-08-20	18:00:00	21:00:00	2	0		0	1500	80	5	1680	40	60	0	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	0	0	0	0	76	0	0	2024-08-19 13:16:20	2024-08-19 13:16:20	0
132	83	pacakge	BL-1724074257	35	128	2024-08-20	18:00:00	21:00:00	2	0		0	1500	77	5	1617	40	0	0	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	0	0	0	0	76	0	0	2024-08-19 13:30:57	2024-08-19 13:30:57	0
133	83	yatch	BL-1724076999	29	0	2024-08-20	18:00:00	19:00:00	2	0		0	8000	200	5	4200	0	0	0	1	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	21	4000	0	0	60	0	0	2024-08-19 14:16:39	2024-08-19 14:16:39	0
134	83	pacakge	BL-1724077798	35	128	2024-08-21	20:00:00	23:00:00	1	0		0	1500	77	5	1617	40	0	0	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	0	0	0	0	76	0	0	2024-08-19 14:29:58	2024-08-19 14:29:58	0
135	83	pacakge	BL-1724077939	35	129	2024-08-19	15:00:00	17:00:00	4	0	hi	0	1500	75	5	1575	0	0	0	1	83	83	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	0	0	76	0	0	2024-08-19 14:32:19	2024-08-19 14:32:19	0
136	83	pacakge	BL-1724077970	35	129	2024-08-19	15:00:00	17:00:00	4	0	hi	0	1500	75	5	1575	0	0	0	1	83	83	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	0	0	76	0	0	2024-08-19 14:32:50	2024-08-19 14:32:50	0
137	83	pacakge	BL-1724078167	35	129	2024-08-19	15:00:00	17:00:00	4	0	hi	0	1500	75	5	1575	0	0	0	1	83	83	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	0	0	76	0	0	2024-08-19 14:36:07	2024-08-19 14:36:07	0
138	83	pacakge	BL-1724081464	35	129	2024-08-19	15:00:00	17:00:00	4	0	hi	0	1500	75	5	1575	0	0	0	1	83	83	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	0	0	76	0	0	2024-08-19 15:31:04	2024-08-19 15:31:04	0
139	78	pacakge	BL-1724095174	4	3	2024-08-19	10:00:00	11:00:00	5	6	Special Request’s	0	1500	125.5	5	2635.5	10	1000	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-19 19:19:34	2024-08-19 19:19:34	0
140	78	pacakge	BL-1724097351	4	3	2024-08-28	14:00:00	15:00:00	1	2		0	1500	79	5	1659	20	60	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-19 19:55:51	2024-08-19 19:55:51	0
141	78	pacakge	BL-1724097449	4	3	2024-08-19	08:00:00	09:00:00	1	2	test	0	1500	128.5	5	2698.5	10	1060	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-19 19:57:29	2024-08-19 19:57:29	0
142	78	pacakge	BL-1724097475	4	3	2024-08-19	08:00:00	09:00:00	1	2	test	0	1500	128.5	5	2698.5	10	1060	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-19 19:57:55	2024-08-19 19:57:55	0
143	78	pacakge	BL-1724097504	4	3	2024-08-19	08:00:00	09:00:00	1	2	test	0	1500	128.5	5	2698.5	10	1060	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-19 19:58:24	2024-08-19 19:58:24	0
144	78	pacakge	BL-1724097556	4	3	2024-08-21	14:00:00	15:00:00	1	2		0	1500	78.5	5	1648.5	10	60	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-19 19:59:16	2024-08-19 19:59:16	0
145	78	pacakge	BL-1724098044	4	3	2024-08-20	10:00:00	11:00:00	1	2	1	0	1500	128.5	5	2698.5	10	1060	0	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-19 20:07:24	2024-08-19 20:07:24	0
146	78	pacakge	BL-1724098049	4	3	2024-08-20	10:00:00	11:00:00	1	2	1	0	1500	128.5	5	2698.5	10	1060	0	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-19 20:07:29	2024-08-19 20:07:29	0
147	78	pacakge	BL-1724098181	4	3	2024-08-20	04:00:00	05:00:00	1	2	1	0	1500	78.5	5	1648.5	10	60	0	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-19 20:09:41	2024-08-19 20:09:41	0
148	78	pacakge	BL-1724098363	4	3	2024-08-20	16:00:00	17:00:00	2	5		0	1500	75.5	5	1585.5	10	0	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-19 20:12:43	2024-08-19 20:12:43	0
149	78	pacakge	BL-1724098488	4	3	2024-08-20	10:00:00	11:00:00	2	5		0	1500	78.5	5	1648.5	10	60	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-19 20:14:48	2024-08-19 20:14:48	0
150	78	pacakge	BL-1724098764	4	3	2024-08-20	12:00:00	13:00:00	1	2	hi	0	1500	125.5	5	2635.5	10	1000	0	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-19 20:19:24	2024-08-19 20:19:24	0
151	78	pacakge	BL-1724098862	4	3	2024-08-20	16:00:00	17:00:00	1	2	hi	0	1500	75.5	5	1585.5	10	0	0	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-19 20:21:02	2024-08-19 20:21:02	0
152	78	pacakge	BL-1724098896	4	3	2024-08-20	16:00:00	17:00:00	1	2	hi	0	1500	128.5	5	2698.5	10	1060	0	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-19 20:21:36	2024-08-19 20:21:36	0
153	78	pacakge	BL-1724102072	4	3	2024-08-20	16:00:00	17:00:00	2	5	it is my special request	0	1500	78.5	5	1648.5	10	60	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-19 21:14:32	2024-08-19 21:14:32	0
154	77	pacakge	BL-1724109163	35	129	2024-08-20	18:00:00	20:00:00	2	2		0	1500	77	5	1617	40	0	0	1	77	77	Mr	Anil	navis	an@an.com	+971	534005096	0	0	0	0	76	0	0	2024-08-19 23:12:43	2024-08-19 23:12:43	0
155	77	pacakge	BL-1724110099	35	129	2024-08-20	20:00:00	22:00:00	5	2		0	1500	77	5	1617	40	0	0	0	77	77	Mr	Anil	navis	an@an.com	+971	534005096	0	0	0	0	76	0	0	2024-08-19 23:28:19	2024-08-19 23:28:19	0
156	77	pacakge	BL-1724119591	35	129	2024-08-21	18:00:00	20:00:00	2	2	I need extra cheese	0	1500	78	5	1638	0	60	0	0	77	77	Mr	Anil	navis	an@an.com	+971	534005096	0	0	0	0	76	0	0	2024-08-20 02:06:31	2024-08-20 02:06:31	0
157	83	pacakge	BL-1724139555	35	125	2024-08-20	17:00:00	20:00:00	2	0		0	200	12.75	5	267.75	55	0	0	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	0	0	0	0	76	0	0	2024-08-20 07:39:15	2024-08-20 07:39:15	0
158	78	yatch	BL-1724141062	31	0	2024-08-05	02:00:00	22:00:00	4	0	hi	0	8550	427.5	5	8977.5	0	0	0	1	78	78	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	0	0	68	0	0	2024-08-20 08:04:22	2024-08-20 08:04:22	0
159	83	pacakge	BL-1724146925	35	128	2024-08-21	15:00:00	18:00:00	2	0		0	1500	80	5	1680	40	60	0	1	83	83	Mr	Usama	Shakeel	ushakeel010@gmail.com	91	331886460	0	0	0	0	76	0	0	2024-08-20 09:42:05	2024-08-20 09:42:05	0
160	83	pacakge	BL-1724149589	35	128	2024-08-21	15:00:00	18:00:00	3	0		0	1500	80	5	1680	40	60	0	1	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	0	0	0	0	76	0	0	2024-08-20 10:26:29	2024-08-20 10:26:29	0
161	83	yatch	BL-1724149801	29	0	2024-08-21	08:00:00	09:00:00	2	0		0	5000	250	5	5250	0	0	0	1	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	0	0	0	0	60	0	0	2024-08-20 10:30:01	2024-08-20 10:30:01	0
162	83	pacakge	BL-1724155490	35	128	2024-08-21	20:00:00	23:00:00	2	0		0	1500	80	5	1680	40	60	0	1	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	0	0	0	0	76	0	0	2024-08-20 12:04:50	2024-08-20 12:04:50	0
163	83	yatch	BL-1724155810	29	0	2024-08-21	14:00:00	15:00:00	2	0		0	6000	300	5	6300	0	0	0	1	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	0	0	0	0	60	0	0	2024-08-20 12:10:10	2024-08-20 12:10:10	0
164	87	pacakge	BL-1724156874	35	128	2024-08-22	18:00:00	21:00:00	2	0		0	1500	80	5	1680	40	60	0	1	87	87	Mr	Usama	Shakeel	ushakeel34@gmail.com	971	33168643	0	0	0	0	76	0	0	2024-08-20 12:27:54	2024-08-20 12:27:54	0
165	85	pacakge	BL-1724161080	35	128	2024-08-23	18:00:00	21:00:00	2	0		0	1500	80	5	1680	40	60	0	1	85	85	Mr	Usama	Shakeel	usama12@gmail.com	971	33158646	0	0	0	0	76	0	0	2024-08-20 13:38:00	2024-08-20 13:38:00	0
166	90	pacakge	BL-1724161860	35	128	2024-08-23	20:00:00	23:00:00	2	0		0	1500	80	5	1680	40	60	0	1	90	90	Mr	Usama	Shakeel	usama99@gmail.com	971	33154609	0	0	0	0	76	0	0	2024-08-20 13:51:00	2024-08-20 13:51:00	0
167	90	pacakge	BL-1724167004	35	128	2024-08-23	18:00:00	21:00:00	2	0		0	1500	80	5	1680	40	60	0	1	90	90	Mr	Usama	Shakeel	usama99@gmail.com	971	33154609	0	0	0	0	76	0	0	2024-08-20 15:16:44	2024-08-20 15:16:44	0
168	90	yatch	BL-1724167098	29	0	2024-08-23	08:00:00	09:00:00	3	0		0	5000	250	5	5250	0	0	0	1	90	90	Mr	Usama	Shakeel	usama99@gmail.com	971	33154609	0	0	0	0	60	0	0	2024-08-20 15:18:18	2024-08-20 15:18:18	0
169	78	yatch	BL-1724183762	35	0	2024-08-26	13:00:00	15:00:00	1	2	en	0	400	16	5	336	0	0	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	30	80	0	0	76	0	0	2024-08-20 19:56:02	2024-08-20 19:56:02	0
175	78	pacakge	BL-1724184372	4	3	2024-08-21	06:00:00	07:00:00	1	2	tesr	0	1500	78.5	5	1648.5	10	60	0	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-20 20:06:12	2024-08-20 20:06:12	0
176	78	pacakge	BL-1724193389	4	3	2024-08-21	11:00:00	12:00:00	1	2		0	1500	78.5	5	1648.5	10	60	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-20 22:36:29	2024-08-20 22:36:29	0
181	78	yatch	BL-1724194878	31	0	2024-08-05	02:00:00	22:00:00	4	0	hi	0	8550	427.5	5	8977.5	0	0	0	1	78	78	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	0	0	68	0	0	2024-08-20 23:01:18	2024-08-20 23:01:18	0
182	78	yatch	BL-1724194894	31	0	2024-08-05	02:00:00	22:00:00	4	0	hi	0	8550	427.5	5	8977.5	0	0	0	1	78	78	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	0	0	68	0	0	2024-08-20 23:01:34	2024-08-20 23:01:34	0
183	78	yatch	BL-1724194927	31	0	2024-08-05	02:00:00	22:00:00	4	0	hi	0	8550	427.5	5	8977.5	0	0	0	1	78	78	mr	\N	\N		91	9847823799	0	0	0	0	68	0	0	2024-08-20 23:02:07	2024-08-20 23:02:07	0
184	78	yatch	BL-1724194934	31	0	2024-08-05	02:00:00	22:00:00	4	0	hi	0	8550	427.5	5	8977.5	0	0	0	1	78	78	mr	\N	\N		91	\N	0	0	0	0	68	0	0	2024-08-20 23:02:14	2024-08-20 23:02:14	0
185	78	yatch	BL-1724194947	31	0	2024-08-05	02:00:00	22:00:00	4	0	hi	0	8550	-1710	5	-35910	0	0	0	1	78	78	mr	\N	\N		91	\N	31	42750	0	0	68	0	0	2024-08-20 23:02:27	2024-08-20 23:02:27	0
187	78	yatch	BL-1724195205	35	0	2024-08-25	09:00:00	10:00:00	1	2	en	0	100	5	5	105	0	0	0	0	78	78	Mr	\N	\N		+971	\N	0	0	0	0	76	0	0	2024-08-20 23:06:45	2024-08-20 23:06:45	0
188	78	yatch	BL-1724195422	35	0	2024-08-29	20:00:00	21:00:00	1	2	en	0	30	1.5	5	31.5	0	0	0	0	78	78	Mr	\N	\N		+971	\N	0	0	0	0	76	0	0	2024-08-20 23:10:22	2024-08-20 23:10:22	0
189	78	yatch	BL-1724195796	39	0	2024-08-21	10:00:00	11:00:00	1	2	en	0	100	5	5	105	0	0	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	76	0	0	2024-08-20 23:16:36	2024-08-20 23:16:36	0
190	78	pacakge	BL-1724195952	4	3	2024-08-21	11:00:00	12:00:00	1	2		0	1500	128.5	5	2698.5	10	1060	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-20 23:19:12	2024-08-20 23:19:12	0
191	78	pacakge	BL-1724196162	4	3	2024-08-21	06:00:00	07:00:00	2	5		0	1500	128.5	5	2698.5	10	1060	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-20 23:22:42	2024-08-20 23:22:42	0
192	78	pacakge	BL-1724196369	4	3	2024-08-21	11:00:00	12:00:00	1	2		0	1500	128.5	5	2698.5	10	1060	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-20 23:26:09	2024-08-20 23:26:09	0
193	78	pacakge	BL-1724196646	4	3	2024-08-21	04:00:00	05:00:00	1	2	test	0	1500	128.5	5	2698.5	10	1060	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	8	0	0	2024-08-20 23:30:46	2024-08-20 23:30:46	0
194	78	yatch	BL-1724196693	37	0	2024-08-21	04:00:00	05:00:00	1	2	en	0	0	0	5	0	0	0	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	81	0	0	2024-08-20 23:31:33	2024-08-20 23:31:33	0
195	78	yatch	BL-1724196728	39	0	2024-08-21	10:00:00	11:00:00	1	2	en	0	100	5	5	105	0	0	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	76	0	0	2024-08-20 23:32:08	2024-08-20 23:32:08	0
196	77	yatch	BL-1724207590	39	0	2024-08-21	10:00:00	11:00:00	2	2	en	0	100	5	5	105	0	0	0	0	77	77	Mr	Anil	navis	an@an.com	+971	534005096	0	0	0	0	76	0	0	2024-08-21 02:33:10	2024-08-21 02:33:10	0
205	81	pacakge	BL-1724226506	35	129	2024-08-23	21:00:00	23:00:00	2	2		0	1500	78.25	5	1643.25	55	10	0	0	81	81	Ms	\N	\N	na@na.com	971	5568680900	0	0	0	0	76	0	0	2024-08-21 07:48:26	2024-08-21 07:48:26	0
206	92	pacakge	BL-1724227323	35	129	2024-08-23	21:00:00	23:00:00	1	1		0	1500	77.75	5	1632.75	55	0	0	0	92	92	Mr	Ajesh	kumar	ajeshcd@gmail.com	971	505041860	0	0	0	0	76	0	0	2024-08-21 08:02:03	2024-08-21 08:02:03	0
207	92	pacakge	BL-1724229192	35	128	2024-08-22	13:00:00	16:00:00	2	2	Diggi	0	1500	77	5	1617	40	0	0	0	92	92	Mr	Ajesh	kumar	ajeshcd@gmail.com	971	505041860	0	0	0	0	76	0	0	2024-08-21 08:33:12	2024-08-21 08:33:12	0
208	92	pacakge	BL-1724229481	35	128	2024-08-22	14:00:00	17:00:00	1	1	Ghhhjij	0	1500	80	5	1680	40	60	0	0	92	92	Mr	Ajesh	kumar	ajeshcd@gmail.com	971	505041860	0	0	0	0	76	0	0	2024-08-21 08:38:01	2024-08-21 08:38:01	0
209	92	pacakge	BL-1724229711	35	128	2024-08-22	13:00:00	16:00:00	1	1	Gggv	0	1500	77	5	1617	40	0	0	0	92	92	Mr	Ajesh	kumar	ajeshcd@gmail.com	971	505041860	0	0	0	0	76	0	0	2024-08-21 08:41:51	2024-08-21 08:41:51	0
210	78	yatch	BL-1724229870	39	0	2024-08-21	13:00:00	14:00:00	1	2	en	0	150	7.5	5	157.5	0	0	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	0	0	76	0	0	2024-08-21 08:44:30	2024-08-21 08:44:30	0
213	92	pacakge	BL-1724230689	35	128	2024-08-22	17:00:00	20:00:00	2	2		0	1500	80	5	1680	40	60	0	0	92	92	Mr	Ajesh	kumar	ajeshcd@gmail.com	971	505041860	0	0	0	0	76	0	0	2024-08-21 08:58:09	2024-08-21 08:58:09	0
214	92	pacakge	BL-1724231092	42	130	2024-08-22	16:00:00	18:00:00	2	2	Cache	0	1500	75.5	5	1585.5	10	0	0	0	92	92	Mr	Ajesh	kumar	ajeshcd@gmail.com	971	505041860	0	0	0	0	91	0	0	2024-08-21 09:04:52	2024-08-21 09:04:52	0
215	92	pacakge	BL-1724231165	42	130	2024-08-22	16:00:00	18:00:00	2	2	Cache	0	1500	75.5	5	1585.5	10	0	0	1	92	92	Mr	Ajesh	kumar	ajeshcd@gmail.com	971	505041860	0	0	0	0	91	0	0	2024-08-21 09:06:05	2024-08-21 09:06:05	0
219	92	pacakge	BL-1724231607	42	130	2024-08-25	09:00:00	11:00:00	2	2		0	1500	75.5	5	1585.5	10	0	0	1	92	92	Mr	Anil	navis	g@g.com	+971	8454664846	0	0	0	0	91	0	0	2024-08-21 09:13:27	2024-08-21 09:13:27	0
220	92	pacakge	BL-1724231829	42	130	2024-08-25	11:00:00	13:00:00	2	1	Ggghh	0	1500	75.5	5	1585.5	10	0	0	0	92	92	Mr	Subin	hi	sub@sub.com	+971	84646466464	0	0	0	0	91	0	0	2024-08-21 09:17:09	2024-08-21 09:17:09	0
221	92	pacakge	BL-1724232118	42	130	2024-08-26	14:00:00	16:00:00	2	2	Hwhe	0	1500	75.5	5	1585.5	10	0	0	0	92	92	Mr	vsbbs	Ben	h@hhsj.com	+971	54543343586	0	0	0	0	91	0	0	2024-08-21 09:21:58	2024-08-21 09:21:58	0
222	93	pacakge	BL-1724232972	42	130	2024-08-26	09:00:00	11:00:00	2	2	This	0	1500	75.5	5	1585.5	10	0	0	0	93	93	Mr	rianjjv	gaggs	bb@hdj.com	+971	8766464046	0	0	0	0	91	0	0	2024-08-21 09:36:12	2024-08-21 09:36:12	0
223	93	yatch	BL-1724237916	36	0	2024-08-23	17:00:00	18:00:00	2	2	en	0	300	15	5	315	0	0	0	0	93	93	Mr	anilnavis	navis	anilnavis71@gmail.com	971	8464664046	0	0	0	0	68	0	0	2024-08-21 10:58:36	2024-08-21 10:58:36	0
224	92	pacakge	BL-1724242409	35	129	2024-08-22	11:00:00	13:00:00	2	2		0	1500	77.75	5	1632.75	55	0	0	0	92	92	Mr	Ajesh	kumar	ajeshcd@gmail.com	971	505041860	0	0	0	0	76	0	0	2024-08-21 12:13:29	2024-08-21 12:13:29	0
225	83	pacakge	BL-1724243552	35	125	2024-08-23	21:00:00	00:00:00	2	0		0	200	12.75	5	267.75	55	0	0	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	0	0	0	0	76	0	0	2024-08-21 12:32:32	2024-08-21 12:32:32	0
226	99	pacakge	BL-1724247081	42	130	2024-08-23	13:00:00	15:00:00	11	2	Thjkjhjjjjjgjjbj	0	1500	75.5	5	1585.5	10	0	0	0	99	99	Mr	anil iphirn	ghhh	navisanil@gmail.com	971	546648466	0	0	0	0	91	0	0	2024-08-21 13:31:21	2024-08-21 13:31:21	0
227	99	yatch	BL-1724249719	36	0	2024-08-22	10:00:00	12:00:00	1	1		0	200	10	5	210	0	0	0	0	99	99	Mr	anil iphirn	ghhh	navisanil@gmail.com	971	546648466	0	0	0	0	68	0	0	2024-08-21 14:15:19	2024-08-21 14:15:19	0
228	99	pacakge	BL-1724395092	35	129	2024-08-24	18:00:00	20:00:00	2	2	Benne	0	1500	77.5	5	1627.5	40	10	0	0	99	99	Mr	anil iphirn	ghhh	navisanil@gmail.com	971	546648466	0	0	1	0	76	0	0	2024-08-23 06:38:12	2024-08-23 06:38:12	0
229	78	pacakge	BL-1724451417	35	129	2024-08-24	15:00:00	17:00:00	2	5	special	0	1500	80.75	5	1695.75	55	60	0	1	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	1	0	76	0	0	2024-08-23 22:16:57	2024-08-23 22:16:57	0
230	99	pacakge	BL-1724661146	35	129	2024-08-26	13:00:00	15:00:00	2	2	Bbssn	0	1500	75.5	5	1585.5	0	10	0	0	99	99	Mr	anil iphirn	ghhh	navisanil@gmail.com	971	546648466	0	0	1	0	76	0	0	2024-08-26 08:32:26	2024-08-26 08:32:26	0
231	99	pacakge	BL-1724677542	35	129	2024-08-26	18:00:00	20:00:00	2	2	Heaven	0	1500	78.25	5	1643.25	55	10	0	0	99	99	Mr	anil iphirn	ghhh	navisanil@gmail.com	971	546648466	0	0	1	0	76	0	0	2024-08-26 13:05:42	2024-08-26 13:05:42	0
232	99	pacakge	BL-1724678733	35	129	2024-08-26	20:00:00	22:00:00	1	0	The	0	1500	75	5	1575	0	0	0	0	99	99	Mr	anil iphirn	ghhh	navisanil@gmail.com	971	546648466	0	0	1	0	76	0	0	2024-08-26 13:25:33	2024-08-26 13:25:33	0
233	109	pacakge	BL-1725261475	42	130	2024-09-02	12:00:00	14:00:00	2	2		0	1500	75.5	5	1585.5	10	0	0	0	109	109	Mr	anil	na	v1@v1.com	971	546434864	0	0	1	0	91	0	0	2024-09-02 07:17:55	2024-09-02 07:17:55	0
234	112	pacakge	BL-1725280414	4	3	2024-09-02	17:00:00	18:00:00	3	0		0	1500	128	5	2688	0	1060	0	1	112	112	Mr	zamzam	ali	zmzmali05@gmail.com	971	566676166	0	0	1	0	8	0	0	2024-09-02 12:33:34	2024-09-02 12:33:34	0
235	78	pacakge	BL-1725360328	35	129	2024-09-03	16:00:00	18:00:00	1	2		0	1500	86.5	5	1816.5	110	120	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	1	0	76	0	0	2024-09-03 10:45:28	2024-09-03 10:45:28	0
236	78	pacakge	BL-1725362390	35	129	2024-09-03	20:00:00	22:00:00	1	2		0	1500	89.75	5	1884.75	55	240	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	1	0	76	0	0	2024-09-03 11:19:50	2024-09-03 11:19:50	0
237	78	pacakge	BL-1725363379	35	129	2024-09-03	18:00:00	20:00:00	1	2	hi	0	1500	87	5	1827	0	240	0	1	78	78	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	1	0	76	0	0	2024-09-03 11:36:19	2024-09-03 11:36:19	0
238	78	pacakge	BL-1725363417	35	129	2024-09-03	18:00:00	20:00:00	1	2	hi	0	1500	87	5	1827	0	240	0	1	78	78	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	1	0	76	0	0	2024-09-03 11:36:57	2024-09-03 11:36:57	0
239	78	pacakge	BL-1725363437	35	129	2024-09-03	18:00:00	20:00:00	1	2	hi	0	1500	87	5	1827	0	240	0	1	78	78	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	1	0	76	0	0	2024-09-03 11:37:17	2024-09-03 11:37:17	0
240	78	pacakge	BL-1725363607	35	129	2024-09-03	18:00:00	20:00:00	1	2		0	1500	87	5	1827	0	240	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	1	0	76	0	0	2024-09-03 11:40:07	2024-09-03 11:40:07	0
241	78	yatch	BL-1725364020	39	0	2024-09-04	10:00:00	12:00:00	1	2		0	200	10	5	210	0	0	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	1	0	76	0	0	2024-09-03 11:47:00	2024-09-03 11:47:00	0
242	78	pacakge	BL-1725364465	35	129	2024-09-04	16:00:00	18:00:00	1	2		0	1500	91.25	5	1916.25	95	230	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	1	0	76	0	0	2024-09-03 11:54:25	2024-09-03 11:54:25	0
243	122	pacakge	BL-1725364701	35	129	2024-09-06	07:00:00	09:00:00	1	2		0	1500	76	5	1596	0	20	0	0	122	122	Mr	test	nas	testnew@gmail.com	971	545156446	0	0	1	0	76	0	0	2024-09-03 11:58:21	2024-09-03 11:58:21	0
244	99	pacakge	BL-1725367209	35	129	2024-09-04	12:00:00	14:00:00	2	2		0	1500	87.25	5	1832.25	55	190	0	0	99	99	Mr	anil iphirn	ghhh	navisanil@gmail.com	971	546648466	0	0	1	0	76	0	0	2024-09-03 12:40:09	2024-09-03 12:40:09	0
245	85	pacakge	BL-1725564711	42	130	2024-09-07	12:00:00	16:00:00	1	0		0	1850	93	5	1953	10	0	0	1	85	85	Mr	Usama	Shakeel	usama12@gmail.com	971	33158646	0	0	1	0	91	0	0	2024-09-05 19:31:51	2024-09-05 19:31:51	0
246	83	pacakge	BL-1725609055	42	130	2024-09-08	10:00:00	14:00:00	1	0		0	1720	86.5	5	1816.5	10	0	0	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	0	0	1	0	91	0	0	2024-09-06 07:50:55	2024-09-06 07:50:55	0
247	83	yatch	BL-1725622478	28	0	2024-09-08	14:00:00	18:00:00	1	0		0	500	25	5	525	0	0	0	0	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	0	0	1	0	59	0	0	2024-09-06 11:34:38	2024-09-06 11:34:38	0
248	83	yatch	BL-1725628828	36	0	2024-09-08	09:00:00	19:00:00	1	0		0	608.5	30.425	5	638.925	0	0	0	1	83	83	Mr	Usama	Shakeel	ushakeel10@gmail.com	971	33158864	0	0	1	0	68	0	0	2024-09-06 13:20:28	2024-09-06 13:20:28	0
249	51	pacakge	BL-1725724698	42	130	2024-09-09	16:00:00	21:00:00	1	0		0	2100	109.5	5	2299.5	90	0	0	1	51	51	Mr	\N	\N	razahamid34@gmail.com	92	3441562554	0	0	1	0	91	0	0	2024-09-07 15:58:18	2024-09-07 15:58:18	0
250	78	pacakge	BL-1725881994	35	129	2024-09-09	13:00:00	19:00:00	1	0		0	2500	130.5	5	2740.5	40	70	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	1	0	76	0	0	2024-09-09 11:39:54	2024-09-09 11:39:54	0
251	78	yatch	BL-1725915436	39	0	2024-09-10	14:00:00	15:00:00	1	2	en	0	120	6	5	126	0	0	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	1	0	76	0	0	2024-09-09 20:57:16	2024-09-09 20:57:16	0
252	78	pacakge	BL-1725915539	35	129	2024-09-10	09:00:00	20:00:00	1	2		0	2710	141.5	5	2971.5	0	120	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	1	0	76	0	0	2024-09-09 20:58:59	2024-09-09 20:58:59	0
253	51	yatch	BL-1725957360	47	0	2024-09-12	12:00:00	13:00:00	1	0		0	600	30	5	630	0	0	0	1	51	51	Mr	\N	\N	razahamid34@gmail.com	92	3441562554	0	0	1	0	60	0	0	2024-09-10 08:36:00	2024-09-10 08:36:00	0
254	51	yatch	BL-1725965661	47	0	2024-09-12	13:00:00	14:00:00	1	0		0	600	30	5	630	0	0	0	1	51	51	Mr	\N	\N	razahamid34@gmail.com	92	3441562554	0	0	1	0	60	0	0	2024-09-10 10:54:21	2024-09-10 10:54:21	0
255	125	yatch	BL-1725966895	47	0	2024-09-12	15:00:00	17:00:00	1	0		0	1200	60	5	1260	0	0	0	0	125	125	Mr	First	LAT	razahamid102@gmail.com	92	3441562582	0	0	1	0	60	0	0	2024-09-10 11:14:55	2024-09-10 11:14:55	0
256	125	pacakge	BL-1725968366	35	129	2024-09-12	14:00:00	22:00:00	1	0		0	1680	101.75	5	2136.75	235	120	0	0	125	125	Mr	First	LAT	razahamid102@gmail.com	92	3441562582	0	0	1	0	76	0	0	2024-09-10 11:39:26	2024-09-10 11:39:26	0
257	78	pacakge	BL-1725985598	35	129	2024-10-11	11:00:00	14:00:00	1	0		0	1520	82.25	5	1727.25	55	70	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	1	0	76	0	0	2024-09-10 16:26:38	2024-09-10 16:26:38	0
258	126	pacakge	BL-1725987147	35	129	2024-09-12	13:00:00	22:00:00	1	0		0	1700	93.25	5	1958.25	55	110	0	0	126	126	Mr	test	test	testnew1@gmail.com	971	845188844	0	0	1	0	76	0	0	2024-09-10 16:52:27	2024-09-10 16:52:27	0
259	126	pacakge	BL-1725988251	35	129	2024-09-12	22:00:00	22:00:00	1	0		0	1880	102.75	5	2157.75	55	120	0	0	126	126	Mr	test	test	testnew1@gmail.com	971	845188844	0	0	1	0	76	0	0	2024-09-10 17:10:51	2024-09-10 17:10:51	0
260	126	pacakge	BL-1725988685	35	129	2024-09-12	22:00:00	22:00:00	1	0		0	1880	102.75	5	2157.75	55	120	0	0	126	126	Mr	test	test	testnew1@gmail.com	971	845188844	0	0	1	0	76	0	0	2024-09-10 17:18:05	2024-09-10 17:18:05	0
261	126	pacakge	BL-1725988720	35	129	2024-09-12	22:00:00	22:00:00	1	0		0	1880	102.75	5	2157.75	55	120	0	0	126	126	Mr	test	test	testnew1@gmail.com	971	845188844	0	0	1	0	76	0	0	2024-09-10 17:18:40	2024-09-10 17:18:40	0
262	126	pacakge	BL-1725989437	35	129	2024-09-12	22:00:00	22:00:00	1	0		0	1880	102.75	5	2157.75	55	120	0	0	126	126	Mr	test	test	testnew1@gmail.com	971	845188844	0	0	1	0	76	0	0	2024-09-10 17:30:37	2024-09-10 17:30:37	0
263	78	yatch	BL-1725998555	47	0	2024-09-12	22:00:00	23:00:00	1	0		0	800	40	5	840	0	0	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	1	0	60	0	0	2024-09-10 20:02:35	2024-09-10 20:02:35	0
264	126	yatch	BL-1725998555	47	0	2024-09-12	22:00:00	23:00:00	1	0	en	0	800	40	5	840	0	0	0	0	126	126	Mr	test	test	testnew1@gmail.com	971	845188844	0	0	1	0	60	0	0	2024-09-10 20:02:35	2024-09-10 20:02:35	0
265	126	pacakge	BL-1726002195	35	128	2024-09-14	11:00:00	15:00:00	1	0		0	1500	80	5	1680	40	60	0	0	126	126	Mr	test	test	testnew1@gmail.com	971	845188844	0	0	1	0	76	0	0	2024-09-10 21:03:15	2024-09-10 21:03:15	0
266	78	pacakge	BL-1726002564	35	129	2024-09-13	11:00:00	15:00:00	1	0		0	1540	85.75	5	1800.75	55	120	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	1	0	76	0	0	2024-09-10 21:09:24	2024-09-10 21:09:24	0
267	78	yatch	BL-1726002860	47	0	2024-09-13	15:00:00	17:00:00	1	0	en	0	1600	80	5	1680	0	0	0	0	78	78	Mr	nasrullah	khan	nasrullah@gmail.com	+971	949198488	0	0	1	0	60	0	0	2024-09-10 21:14:20	2024-09-10 21:14:20	0
268	99	pacakge	BL-1726217937	42	130	2024-09-17	10:00:00	14:00:00	1	0	Chunk	0	1500	75.5	5	1585.5	10	0	0	0	99	99	Mr	anil iphirn	ghhh	navisanil@gmail.com	971	546648466	0	0	1	0	91	0	0	2024-09-13 08:58:57	2024-09-13 08:58:57	0
269	136	pacakge	BL-1726218671	35	129	2024-09-15	10:00:00	16:00:00	1	0		0	1980	99	5	2079	0	0	0	0	136	136	Mr	kannan	annamalai	rtgjdcdmh4@privaterelay.appleid.com	91	8807990032	0	0	1	0	76	0	0	2024-09-13 09:11:11	2024-09-13 09:11:11	0
270	51	pacakge	BL-1726320143	47	138	2024-09-16	07:00:00	09:00:00	0	0		0	30	27.75	5	582.75	450	75	0	0	51	51	Mr	\N	\N	razahamid34@gmail.com	92	3441562554	0	0	1	0	60	0	0	2024-09-14 13:22:23	2024-09-14 13:22:23	0
271	125	yatch	BL-1726321760	47	0	2024-09-16	16:00:00	17:00:00	1	0		0	900	45	5	945	0	0	0	1	125	125	Mr	First	LAT	razahamid102@gmail.com	92	3441562582	0	0	1	0	60	0	0	2024-09-14 13:49:20	2024-09-14 13:49:20	0
272	51	yatch	BL-1726321760	47	0	2024-09-16	16:00:00	17:00:00	0	0	Hi	0	900	45	5	945	0	0	0	1	51	51	Mr	\N	\N	razahamid34@gmail.com	92	3441562554	0	0	1	0	60	0	0	2024-09-14 13:49:20	2024-09-14 13:49:20	0
273	51	pacakge	BL-1726322610	47	138	2024-09-16	17:00:00	19:00:00	0	0		0	30	26.5	5	556.5	450	50	0	0	51	51	Mr	\N	\N	razahamid34@gmail.com	92	3441562554	0	0	1	0	60	0	0	2024-09-14 14:03:30	2024-09-14 14:03:30	0
274	134	pacakge	BL-1726482031	64	149	2024-09-18	04:00:00	08:00:00	1	0		0	5500	275	5	5775	0	0	0	0	134	134	Mr	Rejisha	Dxb	rejishatest@gmail.com	971	223322332	0	0	1	0	131	0	0	2024-09-16 10:20:31	2024-09-16 10:20:31	0
275	135	pacakge	BL-1726497096	64	149	2024-09-18	08:00:00	11:00:00	0	0		0	5000	250	5	5250	0	0	0	0	135	135	Mr	Akhil	Padippurackal	devikadxbapps@hotmail.com	971	502693489	0	0	1	0	131	0	0	2024-09-16 14:31:36	2024-09-16 14:31:36	0
276	134	yatch	BL-1726751553	64	0	2024-09-21	19:00:00	20:00:00	1	0	en	0	500	25	5	525	0	0	0	0	134	134	Mr	Rejisha	Dxb	rejishatest@gmail.com	971	223322332	0	0	1	0	131	0	0	2024-09-19 13:12:33	2024-09-19 13:12:33	0
277	135	yatch	BL-1726752289	62	0	2024-09-29	03:00:00	06:00:00	0	0		0	1500	75	5	1575	0	0	0	0	135	135	Mr	Akhil	Padippurackal	devikadxbapps@hotmail.com	971	502693489	0	0	1	0	133	0	0	2024-09-19 13:24:49	2024-09-19 13:24:49	0
278	135	pacakge	BL-1726752408	62	148	2024-09-21	01:00:00	04:00:00	0	0		0	9000	450	5	9450	0	0	0	0	135	135	Mr	Akhil	Padippurackal	devikadxbapps@hotmail.com	971	502693489	0	0	1	0	133	0	0	2024-09-19 13:26:48	2024-09-19 13:26:48	0
279	134	pacakge	BL-1726752675	64	149	2024-09-21	04:00:00	08:00:00	1	0		0	5500	275	5	5775	0	0	0	0	134	134	Mr	Rejisha	Dxb	rejishatest@gmail.com	971	223322332	0	0	1	0	131	0	0	2024-09-19 13:31:15	2024-09-19 13:31:15	0
280	134	yatch	BL-1726753036	64	0	2024-09-21	08:00:00	09:00:00	1	0	en	0	500	25	5	525	0	0	0	0	134	134	Mr	Rejisha	Dxb	rejishatest@gmail.com	971	223322332	0	0	1	0	131	0	0	2024-09-19 13:37:16	2024-09-19 13:37:16	0
281	135	pacakge	BL-1726753305	64	149	2024-09-21	09:00:00	12:00:00	0	0		0	5000	250	5	5250	0	0	0	0	135	135	Mr	Akhil	Padippurackal	devikadxbapps@hotmail.com	971	502693489	0	0	1	0	131	0	0	2024-09-19 13:41:45	2024-09-19 13:41:45	0
282	134	pacakge	BL-1726824296	42	130	2024-09-22	09:00:00	12:00:00	1	0		0	1600	80	5	1680	0	0	0	0	134	134	Mr	Rejisha	Dxb	rejishatest@gmail.com	971	223322332	0	0	1	0	91	0	0	2024-09-20 09:24:56	2024-09-20 09:24:56	0
283	134	pacakge	BL-1727072374	31	115	2024-09-25	08:00:00	11:00:00	1	0		0	200	10	5	210	0	0	0	0	134	134	Mr	Rejisha	Dxb	rejishatest@gmail.com	971	223322332	0	0	1	0	68	0	0	2024-09-23 06:19:34	2024-09-23 06:19:34	0
284	143	yatch	BL-1727098073	65	0	2024-09-25	02:00:00	03:00:00	1	0	en	0	500	25	5	525	0	0	0	0	143	143	Mr	DEVIKA	DXBAPPS	devikadxb8@gmail.com	971	508855858	0	0	1	0	129	0	0	2024-09-23 13:27:53	2024-09-23 13:27:53	0
285	143	yatch	BL-1727098157	66	0	2024-09-28	00:00:00	01:00:00	0	0		0	500	25	5	525	0	0	0	0	143	143	Ms	DEVIKA	DXBAPPS	devikadxb8@gmail.com	971	508855858	0	0	1	0	133	0	0	2024-09-23 13:29:17	2024-09-23 13:29:17	0
286	135	yatch	BL-1727098864	66	0	2024-09-28	02:00:00	03:00:00	1	0	en	0	500	25	5	525	0	0	0	0	135	135	Mr	Akhil	Padippurackal	devikadxbapps@hotmail.com	971	502693489	0	0	1	0	133	0	0	2024-09-23 13:41:04	2024-09-23 13:41:04	0
287	143	yatch	BL-1727098866	66	0	2024-09-28	02:00:00	03:00:00	0	0		0	500	25	5	525	0	0	0	0	143	143	Ms	DEVIKA	DXBAPPS	devikadxb8@gmail.com	971	508855858	0	0	1	0	133	0	0	2024-09-23 13:41:06	2024-09-23 13:41:06	0
288	143	yatch	BL-1727099408	65	0	2024-09-25	05:00:00	06:00:00	0	0		0	500	25	5	525	0	0	0	0	143	143	Ms	DEVIKA	DXBAPPS	devikadxb8@gmail.com	971	508855858	0	0	1	0	129	0	0	2024-09-23 13:50:08	2024-09-23 13:50:08	0
289	135	yatch	BL-1727099408	65	0	2024-09-25	03:00:00	04:00:00	1	0	en	0	500	25	5	525	0	0	0	0	135	135	Mr	Akhil	Padippurackal	devikadxbapps@hotmail.com	971	502693489	0	0	1	0	129	0	0	2024-09-23 13:50:08	2024-09-23 13:50:08	0
290	135	yatch	BL-1727179607	64	0	2024-09-29	00:00:00	02:00:00	1	0	en	0	1000	50	5	1050	0	0	0	0	135	135	Mr	Akhil	Padippurackal	devikadxbapps@hotmail.com	971	502693489	0	0	1	0	131	0	0	2024-09-24 12:06:47	2024-09-24 12:06:47	0
291	51	pacakge	BL-1727698453	35	129	2024-10-02	12:00:00	14:00:00	0	0		0	1500	87.5	5	1837.5	110	140	0	0	51	51	Mr	\N	\N	razahamid34@gmail.com	92	3441562554	0	0	1	0	76	0	0	2024-09-30 12:14:13	2024-09-30 12:14:13	0
292	51	pacakge	BL-1727715472	47	138	2024-10-02	05:00:00	08:00:00	0	0		0	530	34	5	714	150	0	0	1	51	51	Mr	\N	\N	razahamid34@gmail.com	92	3441562554	0	0	1	0	60	0	0	2024-09-30 16:57:52	2024-09-30 16:57:52	0
293	52	pacakge	BL-1727718275	35	129	2024-10-02	12:00:00	14:00:00	0	0		0	1500	81.25	5	1706.25	55	70	0	1	52	52	Mr	\N	\N	razahamd34@gmail.com	92	3441562555	0	0	1	0	76	0	0	2024-09-30 17:44:35	2024-09-30 17:44:35	0
294	52	pacakge	BL-1727761685	42	130	2024-10-03	09:00:00	11:00:00	0	0		0	1500	75.5	5	1585.5	10	0	0	1	52	52	Mr	\N	\N	razahamd34@gmail.com	92	3441562555	0	0	1	0	91	0	0	2024-10-01 05:48:05	2024-10-01 05:48:05	0
295	51	pacakge	BL-1727764942	47	138	2024-10-03	12:00:00	14:00:00	0	0		0	30	10.25	5	215.25	150	25	0	1	51	51	Mr	\N	\N	razahamid34@gmail.com	92	3441562554	0	0	1	0	60	0	0	2024-10-01 06:42:22	2024-10-01 06:42:22	0
296	51	pacakge	BL-1727765380	42	130	2024-10-03	09:00:00	11:00:00	0	0		0	1500	76.5	5	1606.5	30	0	0	1	51	51	Mr	\N	\N	razahamid34@gmail.com	92	3441562554	0	0	1	0	91	0	0	2024-10-01 06:49:40	2024-10-01 06:49:40	0
297	156	pacakge	BL-1727783286	64	149	2024-10-03	05:00:00	12:00:00	0	0		0	7000	385	5	8085	600	100	0	1	156	156	Mr	Anil	Navis	anilnavis@gmail.com	971	523243163	0	0	1	0	131	0	0	2024-10-01 11:48:06	2024-10-01 11:48:06	0
298	155	pacakge	BL-1727877225	42	130	2024-10-04	09:00:00	11:00:00	0	0		0	1500	76	5	1596	20	0	0	1	155	155	Ms	Hamid	Raza	razahamid105@gmail.com	92	3441562113	0	0	1	0	91	0	0	2024-10-02 13:53:45	2024-10-02 13:53:45	0
299	155	pacakge	BL-1727974278	42	130	2024-10-05	09:00:00	11:00:00	0	0		0	1500	75.5	5	1585.5	10	0	0	0	155	155	Ms	Hamid	Raza	razahamid105@gmail.com	92	3441562113	0	0	1	0	91	0	0	2024-10-03 16:51:18	2024-10-03 16:51:18	0
300	155	pacakge	BL-1727974386	42	130	2024-10-05	09:00:00	11:00:00	0	0		0	1500	75.5	5	1585.5	10	0	0	0	155	155	Ms	Hamid	Raza	razahamid105@gmail.com	92	3441562113	0	0	1	0	91	0	0	2024-10-03 16:53:06	2024-10-03 16:53:06	0
301	155	pacakge	BL-1727974585	42	130	2024-10-05	13:00:00	21:00:00	0	0		0	2700	204	5	4284	1380	0	0	0	155	155	Ms	Hamid	Raza	razahamid105@gmail.com	92	3441562113	0	0	1	0	91	0	0	2024-10-03 16:56:25	2024-10-03 16:56:25	0
302	155	pacakge	BL-1727974605	42	130	2024-10-05	13:00:00	21:00:00	0	0		0	2700	204	5	4284	1380	0	0	0	155	155	Ms	Hamid	Raza	razahamid105@gmail.com	92	3441562113	0	0	1	0	91	0	0	2024-10-03 16:56:45	2024-10-03 16:56:45	0
303	155	pacakge	BL-1727974987	64	149	2024-10-05	00:00:00	03:00:00	0	0		0	5000	440	5	9240	3200	600	0	1	155	155	Ms	Hamid	Raza	razahamid105@gmail.com	92	3441562113	0	0	1	0	131	0	0	2024-10-03 17:03:07	2024-10-03 17:03:07	0
304	155	pacakge	BL-1727975294	62	148	2024-10-05	03:00:00	07:00:00	0	0		0	10000	500	5	10500	0	0	0	0	155	155	Ms	Hamid	Raza	razahamid105@gmail.com	92	3441562113	0	0	1	0	133	0	0	2024-10-03 17:08:14	2024-10-03 17:08:14	0
305	155	yatch	BL-1728310700	47	0	2024-10-09	05:00:00	06:00:00	0	0		0	500	22.5	5	472.5	0	0	50	1	155	155	Ms	Hamid	Raza	razahamid105@gmail.com	92	3441562113	0	0	1	0	60	0	1	2024-10-07 14:18:20	2024-10-07 14:18:20	0
306	155	yatch	BL-1728310742	47	0	2024-10-09	05:00:00	06:00:00	0	0		0	500	22.5	5	472.5	0	0	50	1	155	155	Ms	Hamid	Raza	razahamid105@gmail.com	92	3441562113	0	0	1	0	60	0	1	2024-10-07 14:19:02	2024-10-07 14:19:02	0
307	155	yatch	BL-1728311518	47	0	2024-10-09	07:00:00	08:00:00	0	0		0	500	22.5	5	472.5	0	0	50	0	155	155	Ms	Hamid	Raza	razahamid105@gmail.com	92	3441562113	0	0	1	0	60	0	1	2024-10-07 14:31:58	2024-10-07 14:31:58	0
308	97	pacakge	BL-1728330147	42	130	2024-10-10	10:00:00	16:00:00	1	0		0	1500	76	5	1596	20	0	0	0	97	97	Mr	aah	has	z.falak777@gmail.com	971	8484544556	0	0	1	0	91	0	0	2024-10-07 19:42:27	2024-10-07 19:42:27	0
309	97	pacakge	BL-1728330554	42	130	2024-10-10	09:00:00	19:00:00	1	0		0	1500	75.5	5	1585.5	10	0	0	0	97	97	Mr	aah	has	z.falak777@gmail.com	971	8484544556	0	0	1	0	91	0	0	2024-10-07 19:49:14	2024-10-07 19:49:14	0
310	97	yatch	BL-1728336256	36	0	2024-10-11	09:00:00	10:00:00	1	0		0	200	10	5	210	0	0	0	0	97	97	Mr	aah	has	z.falak777@gmail.com	971	8484544556	0	0	1	0	68	0	1	2024-10-07 21:24:16	2024-10-07 21:24:16	0
311	169	yatch	BL-1728366338	47	0	2024-10-10	19:00:00	20:00:00	0	0		0	800	36	5	756	0	0	80	1	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	0	0	1	0	60	0	1	2024-10-08 05:45:38	2024-10-08 05:45:38	0
312	169	yatch	BL-1728367736	47	0	2024-10-10	20:00:00	21:00:00	0	0		0	800	40	5	840	0	0	0	1	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	0	0	1	0	60	0	0	2024-10-08 06:08:56	2024-10-08 06:08:56	0
313	169	yatch	BL-1728368044	47	0	2024-10-10	21:00:00	22:00:00	0	0		0	800	40	5	840	0	0	0	1	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	0	0	1	0	60	0	0	2024-10-08 06:14:04	2024-10-08 06:14:04	0
314	169	yatch	BL-1728399247	47	0	2024-10-11	16:00:00	17:00:00	0	0		0	800	40	5	840	0	0	0	1	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	0	0	1	0	60	0	0	2024-10-08 14:54:07	2024-10-08 14:54:07	0
315	169	yatch	BL-1728399315	47	0	2024-10-12	18:00:00	19:00:00	0	0		0	1000	50	5	1050	0	0	0	1	169	169	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	0	0	1	0	60	0	0	2024-10-08 14:55:15	2024-10-08 14:55:15	0
316	173	pacakge	BL-1728447141	42	130	2024-10-11	14:00:00	19:00:00	1	0		0	1500	75	5	1575	0	0	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	91	0	0	2024-10-09 04:12:21	2024-10-09 04:12:21	0
317	173	pacakge	BL-1728447280	42	130	2024-10-12	16:00:00	19:00:00	1	0		0	1700	85	5	1785	0	0	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	91	0	0	2024-10-09 04:14:40	2024-10-09 04:14:40	0
318	169	yatch	BL-1728458698	47	0	2024-10-11	03:00:00	05:00:00	0	0		0	1200	31.5	5	661.5	0	0	70	1	169	169	Mr	Anil	Anil	anil@dxbbusinessgroup.com	971	523243163	41	500	1	0	60	0	1	2024-10-09 07:24:58	2024-10-09 07:24:58	0
319	169	pacakge	BL-1728459151	42	130	2024-10-11	09:00:00	11:00:00	0	0		0	1500	77	5	1617	40	0	0	1	169	169	Mr	Anil	Anil	razahamid34@gmail.com	92	3441562554	0	0	1	0	91	0	0	2024-10-09 07:32:31	2024-10-09 07:32:31	0
320	169	pacakge	BL-1728460132	62	148	2024-10-11	05:00:00	09:00:00	0	0		0	10000	500	5	10500	0	0	0	1	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	0	0	1	0	133	0	0	2024-10-09 07:48:52	2024-10-09 07:48:52	0
321	173	pacakge	BL-1728475247	71	160	2024-10-12	12:00:00	15:00:00	1	0	Need extra neatness	0	2100	107	5	2247	20	20	0	1	173	173	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	0	0	1	0	174	0	0	2024-10-09 12:00:47	2024-10-09 12:00:47	0
322	169	pacakge	BL-1728475835	47	159	2024-10-11	07:00:00	08:00:00	0	0		0	20	159.75	5	3354.75	650	2525	0	1	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	0	0	1	0	60	0	0	2024-10-09 12:10:35	2024-10-09 12:10:35	0
323	169	pacakge	BL-1728476158	47	159	2024-10-11	10:00:00	11:00:00	0	0		0	20	158.5	5	3328.5	650	2500	0	0	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	0	0	1	0	60	0	0	2024-10-09 12:15:58	2024-10-09 12:15:58	0
324	173	pacakge	BL-1728476367	71	160	2024-10-12	15:00:00	18:00:00	0	0		0	2200	112	5	2352	20	20	0	1	173	173	Mr	Anil	Navis	anil@dxbusinessgroup.com	971	564005096	0	0	1	0	174	1	0	2024-10-09 12:19:27	2024-10-09 12:19:27	0
325	169	pacakge	BL-1728476485	47	159	2024-10-11	10:00:00	11:00:00	0	0		0	20	34.75	5	729.75	650	25	0	0	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	0	0	1	0	60	1	0	2024-10-09 12:21:25	2024-10-09 12:21:25	0
326	169	pacakge	BL-1728476592	47	159	2024-10-11	10:00:00	11:00:00	0	0		0	20	34.75	5	729.75	650	25	0	0	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	0	0	1	0	60	1	0	2024-10-09 12:23:12	2024-10-09 12:23:12	0
327	169	pacakge	BL-1728477012	47	159	2024-10-11	11:00:00	12:00:00	0	0		0	20	34.75	5	729.75	650	25	0	0	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	0	0	1	0	60	1	0	2024-10-09 12:30:12	2024-10-09 12:30:12	0
328	169	yatch	BL-1728481456	47	0	2024-10-11	12:00:00	14:00:00	0	0		0	1600	49.5	5	1039.5	0	0	110	1	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	41	500	1	0	60	1	1	2024-10-09 13:44:16	2024-10-09 13:44:16	0
329	169	yatch	BL-1728481597	47	0	2024-10-11	12:00:00	14:00:00	0	0		0	1600	49.5	5	1039.5	0	0	110	1	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	41	500	1	0	60	3	1	2024-10-09 13:46:37	2024-10-09 13:46:37	0
330	169	pacakge	BL-1728541972	71	160	2024-10-13	15:00:00	17:00:00	0	0		0	2000	105	5	2205	60	40	0	1	169	169	Mr	Hamid	Male	razahamid106@gmail.com	92	4441562554	0	0	1	0	174	0	0	2024-10-10 06:32:52	2024-10-10 06:32:52	0
331	198	yatch	BL-1728542570	47	0	2024-10-12	04:00:00	05:00:00	1	0	en	0	500	25	5	525	0	0	0	0	198	198	Mr	te sy	ajv	z.falak777@gmail.com	971	545454454544	0	0	1	0	60	0	0	2024-10-10 06:42:50	2024-10-10 06:42:50	0
332	199	pacakge	BL-1728556365	47	159	2024-10-12	04:00:00	07:00:00	0	0		0	1020	84.75	5	1779.75	650	25	0	1	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	0	0	1	0	60	0	0	2024-10-10 10:32:45	2024-10-10 10:32:45	0
333	199	pacakge	BL-1728556494	47	159	2024-10-12	04:00:00	07:00:00	0	0		0	1020	84.75	5	1779.75	650	25	0	1	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	0	0	1	0	60	0	0	2024-10-10 10:34:54	2024-10-10 10:34:54	0
334	199	pacakge	BL-1728557367	47	159	2024-10-12	08:00:00	09:00:00	0	0		0	20	31.275	5	656.775	650	25	69.5	1	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562554	0	0	1	0	60	0	1	2024-10-10 10:49:27	2024-10-10 10:49:27	0
335	173	pacakge	BL-1728569268	71	160	2024-10-19	09:00:00	11:00:00	1	0		0	2000	100.5	5	2110.5	20	0	10	1	173	173	mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	0	0	1	0	174	0	2	2024-10-10 14:07:48	2024-10-10 14:07:48	0
336	173	pacakge	BL-1728617862	42	130	2024-10-14	09:00:00	12:00:00	1	0	Nothing special	0	1600	80.5	5	1690.5	10	0	0	1	173	173	Mr	Anil	navis	bb@h.com	+971	5464864846	0	0	1	0	91	0	0	2024-10-11 03:37:42	2024-10-11 03:37:42	0
337	173	pacakge	BL-1729095016	71	160	2024-10-19	09:00:00	12:00:00	1	0		0	2050	104.5	5	2194.5	20	20	0	1	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	174	0	0	2024-10-16 16:10:16	2024-10-16 16:10:16	0
338	173	pacakge	BL-1729095030	71	160	2024-10-19	09:00:00	12:00:00	1	0		0	2050	104.5	5	2194.5	20	20	0	1	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	174	0	0	2024-10-16 16:10:30	2024-10-16 16:10:30	0
339	173	pacakge	BL-1729095954	71	160	2024-10-20	12:00:00	15:00:00	0	0		0	2200	112	5	2352	20	20	0	1	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	174	0	0	2024-10-16 16:25:54	2024-10-16 16:25:54	0
340	199	pacakge	BL-1729096879	71	160	2024-10-19	09:00:00	11:00:00	0	0		0	2000	102	5	2142	20	20	0	1	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	0	0	1	0	174	0	0	2024-10-16 16:41:19	2024-10-16 16:41:19	0
341	193	yatch	BL-1729138783	47	0	2024-08-05	02:00:00	22:00:00	4	0	hi	0	11385	568.75	5	11943.75	0	0	10	1	193	193	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	1	0	60	0	1	2024-10-17 04:19:43	2024-10-17 04:19:43	0
342	193	yatch	BL-1729138958	47	0	2024-08-05	02:00:00	22:00:00	4	0	hi	0	11385	568.75	5	11943.75	0	0	10	1	193	193	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	1	0	60	0	1	2024-10-17 04:22:38	2024-10-17 04:22:38	0
343	193	yatch	BL-1729139092	47	0	2024-08-05	02:00:00	22:00:00	4	0	hi	0	11385	568.75	5	11943.75	0	0	10	1	193	193	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	1	0	60	0	1	2024-10-17 04:24:52	2024-10-17 04:24:52	0
344	193	yatch	BL-1729140617	47	0	2024-08-05	02:00:00	22:00:00	4	0	hi	0	11385	568.75	5	11943.75	0	0	10	1	193	193	mr	sooraj	sabu	sooraj.a2solution@gmail.com	91	9847823799	0	0	1	0	60	0	1	2024-10-17 04:50:17	2024-10-17 04:50:17	0
345	199	pacakge	BL-1729141929	71	160	2024-10-19	09:00:00	11:00:00	0	0		0	2000	102	5	2142	20	20	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	0	0	1	0	174	0	0	2024-10-17 05:12:09	2024-10-17 05:12:09	0
346	202	pacakge	BL-1729141936	71	160	2024-10-19	09:00:00	12:00:00	0	0		0	2050	68.52	5	1438.92	20	0	699.6	0	202	202	Mr	Jdjdke	Nxndnd	arshad888hash@gmail.com	92	3042721336	0	0	1	0	174	0	3	2024-10-17 05:12:16	2024-10-17 05:12:16	0
347	173	pacakge	BL-1729165328	71	160	2024-10-19	11:00:00	14:00:00	1	0		0	2100	70.04	5	1470.84	20	20	739.2	1	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	174	0	3	2024-10-17 11:42:08	2024-10-17 11:42:08	0
348	199	yatch	BL-1729174631	71	0	2024-10-19	11:00:00	12:00:00	0	0		0	50	2.5	5	52.5	0	0	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	0	0	1	0	174	0	0	2024-10-17 14:17:11	2024-10-17 14:17:11	0
349	173	yatch	BL-1729181697	71	0	2024-10-19	12:00:00	13:00:00	1	0	en	0	100	5	5	105	0	0	0	1	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	174	0	0	2024-10-17 16:14:57	2024-10-17 16:14:57	0
350	198	pacakge	BL-1729234242	71	160	2024-10-20	12:00:00	16:00:00	1	0		0	2600	130	5	2730	0	0	0	0	198	198	Mr	te sy	ajv	z.falak777@gmail.com	971	545454454544	0	0	1	0	174	0	0	2024-10-18 06:50:42	2024-10-18 06:50:42	0
351	173	yatch	BL-1729251823	71	0	2024-10-20	12:00:00	14:00:00	1	0	en	0	400	16	5	336	0	0	80	1	173	173	Mr	anil	navis	anil@dxbusinessgroup.com	+971	2424354648	0	0	1	0	174	0	5	2024-10-18 11:43:43	2024-10-18 11:43:43	0
352	173	pacakge	BL-1729253556	71	160	2024-10-20	14:00:00	19:00:00	1	0		0	3200	160	5	3360	0	0	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	174	0	0	2024-10-18 12:12:36	2024-10-18 12:12:36	0
353	173	pacakge	BL-1729270201	71	160	2024-10-20	19:00:00	23:00:00	1	0		0	2800	80.6	5	1692.6	0	0	1188	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	174	0	3	2024-10-18 16:50:01	2024-10-18 16:50:01	0
354	173	pacakge	BL-1729272258	71	160	2024-10-26	09:00:00	13:00:00	1	0		0	2150	70.89	5	1488.69	20	20	772.2	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	174	0	3	2024-10-18 17:24:18	2024-10-18 17:24:18	0
355	173	pacakge	BL-1729321572	64	149	2024-10-21	04:00:00	08:00:00	1	0		0	5500	185	5	3885	0	0	1800	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	131	0	3	2024-10-19 07:06:12	2024-10-19 07:06:12	0
356	173	pacakge	BL-1729322001	64	149	2024-10-21	08:00:00	12:00:00	1	0		0	5775	197.5	5	4147.5	200	0	2025	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	131	0	3	2024-10-19 07:13:21	2024-10-19 07:13:21	0
357	173	pacakge	BL-1729324200	64	149	2024-10-21	12:00:00	17:00:00	1	0		0	5775	197.5	5	4147.5	200	0	2025	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	131	0	3	2024-10-19 07:50:00	2024-10-19 07:50:00	775
360	199	yatch	BL-1729324946	64	0	2024-10-19	12:00:00	17:00:00	1	0		0	1525	76.25	5	1601.25	0	0	0	0	199	199	\N	\N	\N		\N	\N	0	0	1	0	131	0	0	2024-10-19 08:02:26	2024-10-19 08:02:26	0
361	199	pacakge	BL-1729325091	47	159	2024-10-25	03:00:00	04:00:00	0	0		0	20	192.25	5	4037.25	1300	2525	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	0	0	1	0	60	0	0	2024-10-19 08:04:51	2024-10-19 08:04:51	0
362	199	yatch	BL-1729325229	47	0	2024-10-26	04:00:00	07:00:00	0	0		0	1500	50	5	1050	0	0	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	41	500	1	0	60	0	0	2024-10-19 08:07:09	2024-10-19 08:07:09	0
363	199	pacakge	BL-1729325676	47	159	2024-10-25	10:00:00	14:00:00	0	0		0	2420	199.8	5	4195.8	650	2525	1599	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	0	0	1	0	60	0	4	2024-10-19 08:14:36	2024-10-19 08:14:36	2400
364	203	pacakge	BL-1729325828	42	130	2024-10-21	17:00:00	20:00:00	0	0		0	1700	85.5	5	1795.5	10	0	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	0	0	1	0	91	0	0	2024-10-19 08:17:08	2024-10-19 08:17:08	200
365	203	pacakge	BL-1729325998	42	130	2024-10-22	09:00:00	16:00:00	0	0		0	1500	75.5	5	1585.5	10	0	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	0	0	1	0	91	0	0	2024-10-19 08:19:58	2024-10-19 08:19:58	0
366	173	pacakge	BL-1729326260	64	149	2024-10-22	04:00:00	09:00:00	1	0		0	6000	195	5	4095	0	0	2100	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	131	0	3	2024-10-19 08:24:20	2024-10-19 08:24:20	1000
367	202	pacakge	BL-1729328350	71	160	2024-10-27	11:00:00	15:00:00	0	0		0	2400	141	5	2961	20	0	0	0	202	202	Mr	Jdjdke	Nxndnd	arshad888hash@gmail.com	92	3042721336	0	0	1	0	174	0	0	2024-10-19 08:59:10	2024-10-19 08:59:10	400
368	202	pacakge	BL-1729328534	47	159	2024-10-26	08:00:00	09:00:00	0	0		0	20	26.8	5	562.8	650	0	134	0	202	202	Mr	Jdjdke	Nxndnd	arshad888hash@gmail.com	92	3042721336	0	0	1	0	60	0	4	2024-10-19 09:02:14	2024-10-19 09:02:14	0
369	202	pacakge	BL-1729330731	47	159	2024-10-25	04:00:00	05:00:00	0	0		0	20	33.5	5	703.5	650	0	0	0	202	202	Mr	Jdjdke	Nxndnd	arshad888hash@gmail.com	92	3042721336	0	0	1	0	60	0	0	2024-10-19 09:38:51	2024-10-19 09:38:51	0
370	203	pacakge	BL-1729336181	42	161	2024-11-09	09:00:00	21:00:00	0	0		0	2550	215.5	5	4525.5	10	0	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	0	0	1	0	91	0	0	2024-10-19 11:09:41	2024-10-19 11:09:41	1750
371	203	pacakge	BL-1729337588	42	161	2024-11-16	10:00:00	21:00:00	0	0		0	2450	205.5	5	4315.5	10	0	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	0	0	1	0	91	0	0	2024-10-19 11:33:08	2024-10-19 11:33:08	1650
372	173	pacakge	BL-1729337966	71	160	2024-10-27	15:00:00	18:00:00	1	0	I need blue balloon	0	2400	142	5	2982	20	20	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	174	0	0	2024-10-19 11:39:26	2024-10-19 11:39:26	400
373	173	pacakge	BL-1729338055	71	160	2024-10-27	15:00:00	18:00:00	1	0	I need blue balloon	0	2400	142	5	2982	20	20	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	174	0	0	2024-10-19 11:40:55	2024-10-19 11:40:55	400
374	203	pacakge	BL-1729339275	42	161	2024-11-02	09:00:00	21:00:00	0	0		0	2550	215.5	5	4525.5	10	0	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	0	0	1	0	91	0	0	2024-10-19 12:01:15	2024-10-19 12:01:15	1750
375	173	pacakge	BL-1729339381	71	160	2024-10-27	18:00:00	21:00:00	1	0	The first time the two sides agreed to meet on a single day yyyyy	0	2400	99.4	5	2087.4	20	20	852	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	174	0	3	2024-10-19 12:03:01	2024-10-19 12:03:01	400
376	173	pacakge	BL-1729362003	42	161	2024-10-22	09:00:00	21:00:00	1	0		0	800	40.5	5	850.5	10	0	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	91	0	0	2024-10-19 18:20:03	2024-10-19 18:20:03	0
377	173	pacakge	BL-1729362130	42	161	2024-10-22	09:00:00	21:00:00	1	0		0	800	40.5	5	850.5	10	0	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	91	0	0	2024-10-19 18:22:10	2024-10-19 18:22:10	0
378	173	yatch	BL-1729406991	71	0	2024-10-26	19:00:00	21:00:00	1	0	en	0	400	20	5	420	0	0	0	1	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	174	0	0	2024-10-20 06:49:51	2024-10-20 06:49:51	0
379	173	pacakge	BL-1729417046	71	160	2024-11-09	14:00:00	17:00:00	1	0	The only way I could do that was if you wanted me too but you don’t want me too so you	0	2200	85.4	5	1793.4	20	20	732	1	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	174	0	3	2024-10-20 09:37:26	2024-10-20 09:37:26	200
380	173	pacakge	BL-1729417090	71	160	2024-11-09	14:00:00	17:00:00	1	0	The only way I could do that was if you wanted me too but you don’t want me too so you	0	2200	85.4	5	1793.4	20	20	732	1	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	174	0	3	2024-10-20 09:38:10	2024-10-20 09:38:10	200
381	173	pacakge	BL-1729419561	71	160	2024-11-09	14:00:00	17:00:00	1	0	The only way I could do that was if you wanted me too but you don’t want me too so you	0	2200	85.4	5	1793.4	20	20	732	1	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	174	0	3	2024-10-20 10:19:21	2024-10-20 10:19:21	200
382	173	pacakge	BL-1729419609	71	160	2024-11-09	14:00:00	17:00:00	1	0	The only way I could do that was if you wanted me too but you don’t want me too so you	0	2200	85.4	5	1793.4	20	20	732	1	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	174	0	3	2024-10-20 10:20:09	2024-10-20 10:20:09	200
383	173	pacakge	BL-1729419991	71	160	2024-11-03	11:00:00	14:00:00	1	0		0	2200	85.4	5	1793.4	20	20	732	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	174	0	3	2024-10-20 10:26:31	2024-10-20 10:26:31	200
384	203	yatch	BL-1729424945	28	0	2024-10-23	09:00:00	11:00:00	0	0		0	200	10	5	210	0	0	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	0	0	1	0	59	0	0	2024-10-20 11:49:05	2024-10-20 11:49:05	0
385	173	pacakge	BL-1729425729	71	160	2024-11-03	14:00:00	17:00:00	1	0		0	2400	98.7	5	2072.7	20	0	846	1	173	173	Mr	Anil	navis	anil@dxbusinesgroup.com	+971	564005096	0	0	1	0	174	0	3	2024-10-20 12:02:09	2024-10-20 12:02:09	400
386	203	pacakge	BL-1729485759	42	161	2024-10-23	11:00:00	14:00:00	0	0		0	800	40.5	5	850.5	10	0	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	0	0	1	0	91	0	0	2024-10-21 04:42:39	2024-10-21 04:42:39	0
387	199	pacakge	BL-1729485909	47	159	2024-10-24	03:00:00	04:00:00	0	0		0	20	159.75	5	3354.75	650	2525	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	0	0	1	0	60	0	0	2024-10-21 04:45:09	2024-10-21 04:45:09	0
388	203	pacakge	BL-1729486309	42	161	2024-10-23	11:00:00	14:00:00	0	0		0	800	40.5	5	850.5	10	0	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	0	0	1	0	91	0	0	2024-10-21 04:51:49	2024-10-21 04:51:49	0
389	203	pacakge	BL-1729486398	42	161	2024-10-23	11:00:00	14:00:00	0	0		0	800	40.5	5	850.5	10	0	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	0	0	1	0	91	0	0	2024-10-21 04:53:18	2024-10-21 04:53:18	0
390	199	pacakge	BL-1729486459	47	159	2024-10-24	03:00:00	04:00:00	0	0		0	20	159.75	5	3354.75	650	2525	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	0	0	1	0	60	0	0	2024-10-21 04:54:19	2024-10-21 04:54:19	0
391	173	pacakge	BL-1729486891	71	160	2024-11-03	17:00:00	20:00:00	1	0	The only way I could do that was if you wanted me too but you don’t	0	2400	99.4	5	2087.4	20	20	852	1	173	173	Mr	Anil	Davis	anil@dxbuisnessgroup.com	+971	523243163	0	0	1	0	174	0	3	2024-10-21 05:01:31	2024-10-21 05:01:31	400
392	203	pacakge	BL-1729487189	42	130	2024-10-23	14:00:00	20:00:00	0	0		0	1500	75.5	5	1585.5	10	0	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	0	0	1	0	91	0	0	2024-10-21 05:06:29	2024-10-21 05:06:29	0
393	203	pacakge	BL-1729489082	42	130	2024-10-23	14:00:00	20:00:00	0	0		0	1500	75.5	5	1585.5	10	0	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	0	0	1	0	91	0	0	2024-10-21 05:38:02	2024-10-21 05:38:02	0
394	173	pacakge	BL-1729490651	42	161	2024-10-24	16:00:00	21:00:00	1	0		0	800	40	5	840	0	0	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	91	0	0	2024-10-21 06:04:11	2024-10-21 06:04:11	0
395	173	pacakge	BL-1729490911	62	148	2024-10-23	01:00:00	08:00:00	1	0		0	11500	490	5	10290	0	0	4200	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	133	0	3	2024-10-21 06:08:31	2024-10-21 06:08:31	2500
396	203	pacakge	BL-1729491385	42	130	2024-10-30	09:00:00	14:00:00	0	0		0	1500	75.5	5	1585.5	10	0	0	1	203	203	Mr	S	Sd	dev@yopmail.com	91	9847823799	0	0	1	0	91	0	0	2024-10-21 06:16:25	2024-10-21 06:16:25	0
397	203	yatch	BL-1729491482	28	0	2024-10-30	16:00:00	20:00:00	0	0		0	950	47.5	5	997.5	0	0	0	0	203	203	Mr	Ds	D	dev@yopmail.com	971	9780	0	0	1	0	59	0	0	2024-10-21 06:18:02	2024-10-21 06:18:02	0
398	173	pacakge	BL-1729495827	71	160	2024-11-03	20:00:00	23:00:00	1	0	The only way I could	0	2400	99.4	5	2087.4	20	20	852	1	173	173	Mr	Anil	na	anil@dxbusinessgroup.com	+971	523243163	0	0	1	0	174	0	3	2024-10-21 07:30:27	2024-10-21 07:30:27	400
399	173	pacakge	BL-1729509508	71	160	2024-11-09	17:00:00	20:00:00	1	0	The only way I could do that was	0	2200	112	5	2352	20	20	0	1	173	173	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	0	0	1	0	174	0	0	2024-10-21 11:18:28	2024-10-21 11:18:28	200
400	173	pacakge	BL-1729513445	71	160	2024-11-09	20:00:00	23:00:00	1	0	Trying my luck on my birthday	0	2000	78.4	5	1646.4	20	20	672	1	173	173	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	0	0	1	0	174	0	3	2024-10-21 12:24:05	2024-10-21 12:24:05	200
401	173	pacakge	BL-1729517074	71	160	2024-11-10	09:00:00	12:00:00	1	0	The first time the two sides agreed to meet on a single day was when they agreed on	0	2000	74.9	5	1572.9	20	20	642	1	173	173	Mr	Sunil	navis	anil@dxbusinessgroup.com	+971	523243163	0	0	1	0	174	0	3	2024-10-21 13:24:34	2024-10-21 13:24:34	100
402	173	pacakge	BL-1729522670	71	160	2024-11-17	11:00:00	14:00:00	1	0	The first time the team had played a match was	0	2000	78.4	5	1646.4	20	20	672	1	173	173	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	0	0	1	0	174	0	3	2024-10-21 14:57:50	2024-10-21 14:57:50	200
403	203	pacakge	BL-1729573953	72	162	2024-10-27	08:00:00	14:00:00	0	0		0	1000	75	5	1575	0	0	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	0	0	1	0	91	0	0	2024-10-22 05:12:33	2024-10-22 05:12:33	500
404	203	pacakge	BL-1729577617	72	162	2024-10-27	18:00:00	20:00:00	0	0		0	1000	50	5	1050	0	0	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	0	0	1	0	91	0	0	2024-10-22 06:13:37	2024-10-22 06:13:37	0
405	203	yatch	BL-1729587252	72	0	2024-10-28	10:00:00	14:00:00	0	0		0	300	15	5	315	0	0	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	0	0	1	0	91	0	0	2024-10-22 08:54:12	2024-10-22 08:54:12	0
406	203	yatch	BL-1729595634	72	0	2024-10-29	09:00:00	14:00:00	0	0		0	600	30	5	630	0	0	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	0	0	1	0	91	0	0	2024-10-22 11:13:54	2024-10-22 11:13:54	0
407	203	yatch	BL-1729597145	72	0	2024-10-28	16:00:00	19:00:00	0	0		0	450	22.5	5	472.5	0	0	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	0	0	1	0	91	0	0	2024-10-22 11:39:05	2024-10-22 11:39:05	0
408	203	yatch	BL-1729597268	72	0	2024-10-29	16:00:00	19:00:00	0	0		0	600	30	5	630	0	0	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	0	0	1	0	91	0	0	2024-10-22 11:41:08	2024-10-22 11:41:08	0
462	232	yatch	BL-1730810466	31	0	2024-11-07	08:00:00	09:00:00	1	0		0	100	5	5	105	0	0	0	0	232	232	Mr	Anil	navis	anil@dxbusinessgroup.com	971	122425464	0	0	1	0	68	0	0	2024-11-05 12:41:06	2024-11-05 12:41:06	0
409	173	pacakge	BL-1729603951	71	160	2024-11-17	11:00:00	14:00:00	1	0	The only way I could do that was if you wanted me too but you tyyyyyyy I know what I mean I don’t u	0	2000	78.4	5	1646.4	20	20	672	1	173	173	Mr	anil	navis	anilnavis@gmail.com	+971	523243163	0	0	1	0	174	0	3	2024-10-22 13:32:31	2024-10-22 13:32:31	200
410	205	yatch	BL-1729645077	71	0	2024-11-09	09:00:00	12:00:00	1	0	en	0	150	7.5	5	157.5	0	0	0	1	205	205	Mr	Anil	Davis	anil@dxbusinessgroup.com	+971	523243163	0	0	1	0	174	0	0	2024-10-23 00:57:57	2024-10-23 00:57:57	0
411	205	yatch	BL-1729655431	72	0	2024-10-29	08:00:00	10:00:00	0	0		0	200	10	5	210	0	0	0	0	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	971	523243163	0	0	1	0	91	0	0	2024-10-23 03:50:31	2024-10-23 03:50:31	0
412	205	yatch	BL-1729656819	72	0	2024-10-29	09:00:00	11:00:00	0	0		0	200	10	5	210	0	0	0	0	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	971	523243163	0	0	1	0	91	0	0	2024-10-23 04:13:39	2024-10-23 04:13:39	0
413	203	yatch	BL-1729660785	72	0	2024-10-29	10:00:00	12:00:00	0	0		0	200	10	5	210	0	0	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	0	0	1	0	91	0	0	2024-10-23 05:19:45	2024-10-23 05:19:45	0
414	199	yatch	BL-1729664696	47	0	2024-10-31	03:00:00	11:00:00	0	0		0	4000	200	5	4200	0	0	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	0	0	1	0	60	0	0	2024-10-23 06:24:56	2024-10-23 06:24:56	0
415	199	yatch	BL-1729665032	47	0	2024-11-01	11:00:00	14:00:00	0	0		0	2400	120	5	2520	0	0	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	0	0	1	0	60	0	0	2024-10-23 06:30:32	2024-10-23 06:30:32	0
416	203	pacakge	BL-1729666770	72	162	2024-10-29	08:00:00	11:00:00	0	0		0	1000	38.5	5	808.5	0	0	330	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	0	0	1	0	91	0	3	2024-10-23 06:59:30	2024-10-23 06:59:30	100
417	205	yatch	BL-1729677558	71	0	2024-11-24	11:00:00	12:00:00	1	0	en	0	200	10	5	210	0	0	0	0	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	971	523243163	0	0	1	0	174	0	0	2024-10-23 09:59:18	2024-10-23 09:59:18	0
418	205	yatch	BL-1729683192	71	0	2024-11-24	11:00:00	12:00:00	1	0	en	0	200	10	5	210	0	0	0	0	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	971	523243163	0	0	1	0	174	0	0	2024-10-23 11:33:12	2024-10-23 11:33:12	0
419	205	yatch	BL-1729687336	71	0	2024-11-23	09:00:00	10:00:00	1	0	en	0	50	2.5	5	52.5	0	0	0	0	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	971	523243163	0	0	1	0	174	0	0	2024-10-23 12:42:16	2024-10-23 12:42:16	0
420	205	yatch	BL-1729690524	71	0	2024-11-24	11:00:00	12:00:00	0	0	Vshhsjshjsjskkks	0	200	10	5	210	0	0	0	0	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	971	523243163	0	0	1	0	174	0	0	2024-10-23 13:35:24	2024-10-23 13:35:24	0
421	173	pacakge	BL-1729698320	71	160	2024-11-24	11:00:00	14:00:00	1	0	The only way I could do that was	0	2000	112	5	2352	20	20	0	1	173	173	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	0	0	1	0	174	0	0	2024-10-23 15:45:20	2024-10-23 15:45:20	200
422	173	pacakge	BL-1729727010	71	160	2024-10-26	19:00:00	00:00:00	1	0	This is test comments	0	2000	100	5	2100	0	0	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	174	0	0	2024-10-23 23:43:30	2024-10-23 23:43:30	0
423	173	yatch	BL-1729727117	71	0	2024-10-26	20:00:00	22:00:00	1	0	en	0	400	20	5	420	0	0	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	174	0	0	2024-10-23 23:45:17	2024-10-23 23:45:17	0
424	173	yatch	BL-1729731389	71	0	2024-10-26	22:00:00	00:00:00	1	0	This is test	0	0	0	5	0	0	0	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	174	0	0	2024-10-24 00:56:29	2024-10-24 00:56:29	0
425	173	yatch	BL-1729731424	71	0	2024-10-27	09:00:00	11:00:00	1	0	This is test	0	208.33333333333	10.416666666667	5	218.75	0	0	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	2424564846	0	0	1	0	174	0	0	2024-10-24 00:57:04	2024-10-24 00:57:04	0
426	205	pacakge	BL-1729742495	71	160	2024-10-26	22:00:00	00:00:00	1	0	The only way I could do that was if you wanted	0	2000	102	5	2142	20	20	0	1	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	0	0	1	0	174	0	0	2024-10-24 04:01:35	2024-10-24 04:01:35	0
427	203	pacakge	BL-1729742599	72	162	2024-10-26	08:00:00	10:00:00	0	0		0	1000	50	5	1050	0	0	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	0	0	1	0	91	0	0	2024-10-24 04:03:19	2024-10-24 04:03:19	0
428	205	pacakge	BL-1729743893	71	160	2024-11-24	14:00:00	16:00:00	1	0	The only way I could do that would	0	2000	102	5	2142	20	20	0	1	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	0	0	1	0	174	0	0	2024-10-24 04:24:53	2024-10-24 04:24:53	0
429	203	pacakge	BL-1729745427	71	160	2024-11-16	09:00:00	12:00:00	0	0		0	2000	103.5	5	2173.5	20	0	0	0	203	203	Mr	Sooraj	Sabu	soorajsabu117@gmail.com	971	505086058	0	0	1	0	174	0	0	2024-10-24 04:50:27	2024-10-24 04:50:27	50
430	193	yatch	BL-1729748024	64	0	2024-10-24	12:00:00	17:00:00	1	0		0	2098.3333333333	104.91666666667	5	2203.25	0	0	0	0	193	193	\N	\N	\N		\N	\N	0	0	1	0	131	0	0	2024-10-24 05:33:44	2024-10-24 05:33:44	0
431	205	pacakge	BL-1729750586	71	160	2024-11-24	14:00:00	17:00:00	1	0		0	2000	78.4	5	1646.4	20	20	672	1	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	0	0	1	0	174	0	3	2024-10-24 06:16:26	2024-10-24 06:16:26	200
432	205	pacakge	BL-1729752611	71	160	2024-11-24	17:00:00	20:00:00	1	0	The only way I could do that was if you wanted me there at nine	0	2000	85.4	5	1793.4	20	20	732	1	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	0	0	1	0	174	0	3	2024-10-24 06:50:11	2024-10-24 06:50:11	400
433	205	yatch	BL-1729753899	71	0	2024-11-24	20:00:00	22:00:00	1	0	The first time the team had a good start in their second	0	800	40	5	840	0	0	0	1	205	205	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	0	0	1	0	174	0	0	2024-10-24 07:11:39	2024-10-24 07:11:39	0
434	205	yatch	BL-1729756649	71	0	2024-11-17	15:00:00	20:00:00	1	0		0	1030	41.2	5	865.2	0	0	206	1	205	205	Mr	Anil	nav	anil@dxbusinessgroup.com	+971	523243163	0	0	1	0	174	0	6	2024-10-24 07:57:29	2024-10-24 07:57:29	0
435	173	pacakge	BL-1729762272	72	162	2024-10-26	08:00:00	10:00:00	1	0	The only way I could do that	0	1000	50	5	1050	0	0	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	523243163	0	0	1	0	91	0	0	2024-10-24 09:31:12	2024-10-24 09:31:12	0
436	173	pacakge	BL-1729773307	71	160	2024-12-08	09:00:00	12:00:00	1	0	The first time the two	0	2000	78.4	5	1646.4	20	20	672	1	173	173	Ms	Fatima	Jasim	fj-hamad@hotmail.com	+971	502283912	0	0	1	0	174	0	3	2024-10-24 12:35:07	2024-10-24 12:35:07	200
437	173	pacakge	BL-1729773315	71	160	2024-12-08	09:00:00	12:00:00	1	0	The first time the two	0	2000	78.4	5	1646.4	20	20	672	1	173	173	Ms	Fatima	Jasim	fj-hamad@hotmail.com	+971	502283912	0	0	1	0	174	0	3	2024-10-24 12:35:15	2024-10-24 12:35:15	200
438	173	pacakge	BL-1729773327	71	160	2024-12-08	09:00:00	12:00:00	1	0	The first time the two	0	2000	78.4	5	1646.4	20	20	672	1	173	173	Ms	Fatima	Jasim	fj-hamad@hotmail.com	+971	502283912	0	0	1	0	174	0	3	2024-10-24 12:35:27	2024-10-24 12:35:27	200
439	173	pacakge	BL-1729773338	71	160	2024-12-08	09:00:00	12:00:00	1	0	The first time the two	0	2000	78.4	5	1646.4	20	20	672	1	173	173	Ms	Fatima	Jasim	fj-hamad@hotmail.com	+971	502283912	0	0	1	0	174	0	3	2024-10-24 12:35:38	2024-10-24 12:35:38	200
440	173	pacakge	BL-1729773347	71	160	2024-12-08	09:00:00	12:00:00	1	0	The first time the two	0	2000	78.4	5	1646.4	20	20	672	1	173	173	Ms	Fatima	Jasim	fj-hamad@hotmail.com	+971	502283912	0	0	1	0	174	0	3	2024-10-24 12:35:47	2024-10-24 12:35:47	200
441	173	pacakge	BL-1729773414	71	160	2024-12-08	09:00:00	12:00:00	1	0	The first time the two	0	2000	78.4	5	1646.4	20	20	672	1	173	173	Ms	Fatima	Jasim	anil@dxbusinessgroup.com	+971	502283912	0	0	1	0	174	0	3	2024-10-24 12:36:54	2024-10-24 12:36:54	200
442	173	pacakge	BL-1729773506	71	160	2024-12-08	09:00:00	12:00:00	1	0	The first time the two	0	2000	78.4	5	1646.4	20	20	672	1	173	173	Mr	gays	haha	g@g.com	+971	523243163	0	0	1	0	174	0	3	2024-10-24 12:38:26	2024-10-24 12:38:26	200
443	199	pacakge	BL-1729773913	71	160	2024-10-31	09:00:00	11:00:00	0	0		0	2000	102	5	2142	20	20	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	0	0	1	0	174	0	0	2024-10-24 12:45:13	2024-10-24 12:45:13	0
444	173	pacakge	BL-1729774113	71	160	2024-10-31	09:00:00	12:00:00	1	0		0	2000	102	5	2142	20	20	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	523243163	0	0	1	0	174	0	0	2024-10-24 12:48:33	2024-10-24 12:48:33	0
445	199	pacakge	BL-1729774133	71	160	2024-10-31	09:00:00	13:00:00	0	0		0	2000	102	5	2142	20	20	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	0	0	1	0	174	0	0	2024-10-24 12:48:53	2024-10-24 12:48:53	0
446	173	pacakge	BL-1729774330	71	160	2024-10-31	09:00:00	12:00:00	1	0		0	2000	102	5	2142	20	20	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	523243163	0	0	1	0	174	0	0	2024-10-24 12:52:10	2024-10-24 12:52:10	0
447	173	pacakge	BL-1729774450	71	160	2024-10-31	13:00:00	17:00:00	1	0		0	2000	101	5	2121	20	0	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	523243163	0	0	1	0	174	0	0	2024-10-24 12:54:10	2024-10-24 12:54:10	0
448	173	pacakge	BL-1729774684	71	160	2024-10-31	13:00:00	17:00:00	1	0		0	2000	101	5	2121	20	0	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	523243163	0	0	1	0	174	0	0	2024-10-24 12:58:04	2024-10-24 12:58:04	0
449	173	pacakge	BL-1729774908	73	163	2024-10-26	09:00:00	12:00:00	1	0		0	1500	80	5	1680	0	0	0	0	173	173	Mr	Anil	nabis	anilnavis@gmail.com	971	523243163	0	0	1	0	207	0	0	2024-10-24 13:01:48	2024-10-24 13:01:48	100
450	173	pacakge	BL-1729775315	73	163	2024-10-26	12:00:00	15:00:00	1	0	The only way I could do that was if you wanted it for the	0	1500	102	5	2142	140	200	0	1	173	173	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	0	0	1	0	207	0	0	2024-10-24 13:08:35	2024-10-24 13:08:35	200
451	173	pacakge	BL-1729775653	73	163	2024-10-26	15:00:00	17:00:00	1	0		0	1500	92	5	1932	140	200	0	1	173	173	Ms	Fatima	fa	anil@dxbusinessgroup.com	+971	50 228 3912	0	0	1	0	207	0	0	2024-10-24 13:14:13	2024-10-24 13:14:13	0
452	173	pacakge	BL-1729776101	71	160	2024-12-26	09:00:00	13:00:00	1	0		0	2000	101	5	2121	20	0	0	1	173	173	Mr	hh	hhh	gh@g.com	+971	523243163	0	0	1	0	174	0	0	2024-10-24 13:21:41	2024-10-24 13:21:41	0
453	199	yatch	BL-1730099342	47	0	2024-10-31	15:00:00	16:00:00	0	0		0	600	30	5	630	0	0	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	0	0	1	0	60	0	0	2024-10-28 07:09:02	2024-10-28 07:09:02	0
454	209	pacakge	BL-1730178808	72	162	2024-11-30	09:00:00	12:00:00	1	0		0	1000	55	5	1155	0	0	0	1	209	209	Mr	Talal	Alhammadi	fj-hamad@hotmail.com	+971	502283912	0	0	1	0	91	0	0	2024-10-29 05:13:28	2024-10-29 05:13:28	100
455	209	pacakge	BL-1730178892	72	162	2024-11-30	09:00:00	12:00:00	1	0		0	1000	55	5	1155	0	0	0	1	209	209	Mr	Talal	Alhammadi	fj-hamad@hotmail.com	+971	502283912	0	0	1	0	91	0	0	2024-10-29 05:14:52	2024-10-29 05:14:52	100
456	199	pacakge	BL-1730275049	47	159	2024-11-01	03:00:00	04:00:00	0	0		0	20	151	5	3171	500	2500	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	0	0	1	0	60	0	0	2024-10-30 07:57:29	2024-10-30 07:57:29	0
457	211	pacakge	BL-1730294466	73	163	2024-11-01	09:00:00	12:00:00	1	0	The first time the government	0	1500	97	5	2037	140	200	0	0	211	211	Mr	anil	navsi	navisanil@gmail.com	971	4534546643	0	0	1	0	207	0	0	2024-10-30 13:21:06	2024-10-30 13:21:06	100
458	214	pacakge	BL-1730571102	42	130	2024-12-25	09:00:00	15:00:00	0	0		0	1500	75.5	5	1585.5	10	0	0	1	214	214	Ms	Tester	Raga	radhadxbapps@hotmail.com	971	586400540	0	0	1	0	91	0	0	2024-11-02 18:11:42	2024-11-02 18:11:42	0
459	232	yatch	BL-1730809699	72	0	2024-11-09	08:00:00	09:00:00	1	0		0	100	5	5	105	0	0	0	1	232	232	Mr	Anil	navis	anil@dxbusinessgroup.com	971	122425464	0	0	1	0	91	0	0	2024-11-05 12:28:19	2024-11-05 12:28:19	0
460	232	yatch	BL-1730809711	72	0	2024-11-09	08:00:00	09:00:00	1	0		0	100	5	5	105	0	0	0	1	232	232	Mr	Anil	navis	anil@dxbusinessgroup.com	971	122425464	0	0	1	0	91	0	0	2024-11-05 12:28:31	2024-11-05 12:28:31	0
461	232	yatch	BL-1730810410	28	0	2024-11-07	09:00:00	10:00:00	1	0		0	0	0	5	0	0	0	0	1	232	232	Mr	gah	Ben	anilnavis@gmail.com	+971	523243163	0	0	1	0	59	0	0	2024-11-05 12:40:10	2024-11-05 12:40:10	0
463	199	yatch	BL-1730812516	47	0	2024-11-15	07:00:00	08:00:00	0	0		0	600	30	5	630	0	0	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	0	0	1	0	60	0	0	2024-11-05 13:15:16	2024-11-05 13:15:16	0
464	232	yatch	BL-1730812594	72	0	2024-11-10	08:00:00	10:00:00	1	0		0	200	10	5	210	0	0	0	0	232	232	Mr	Anil	navis	anil@dxbusinessgroup.com	971	122425464	0	0	1	0	91	0	0	2024-11-05 13:16:34	2024-11-05 13:16:34	0
465	199	yatch	BL-1730812832	47	0	2024-11-09	04:00:00	05:00:00	0	0		0	500	25	5	525	0	0	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	0	0	1	0	60	0	0	2024-11-05 13:20:32	2024-11-05 13:20:32	0
466	233	pacakge	BL-1730816936	73	163	2024-11-07	09:00:00	12:00:00	1	0		0	1500	97	5	2037	140	200	0	0	233	233	Mr	amil	navis	navisanil12@gmail.com	971	5485464028	0	0	1	0	207	0	0	2024-11-05 14:28:56	2024-11-05 14:28:56	100
467	233	pacakge	BL-1730817232	73	163	2024-11-07	09:00:00	11:00:00	1	0		0	1500	85	5	1785	0	200	0	0	233	233	Mr	amil	navis	navisanil12@gmail.com	971	5485464028	0	0	1	0	207	0	0	2024-11-05 14:33:52	2024-11-05 14:33:52	0
468	233	pacakge	BL-1730817338	73	163	2024-11-11	09:00:00	11:00:00	1	0		0	1500	75	5	1575	0	0	0	0	233	233	Mr	amil	navis	navisanil12@gmail.com	971	5485464028	0	0	1	0	207	0	0	2024-11-05 14:35:38	2024-11-05 14:35:38	0
469	221	yatch	BL-1730820033	47	0	2024-11-07	03:00:00	04:00:00	0	0		0	500	25	5	525	0	0	0	0	221	221	Mr	Test	Tes	ss@twt.com	971	505042124	0	0	1	0	60	0	0	2024-11-05 15:20:33	2024-11-05 15:20:33	0
470	221	yatch	BL-1730820560	72	0	2024-11-10	10:00:00	11:00:00	0	0		3	100	5	5	105	0	0	0	0	221	221	Mr	Test	Tes	ss@twt.com	971	505042124	0	0	1	0	91	3	0	2024-11-05 15:29:20	2024-11-05 15:29:20	0
471	233	pacakge	BL-1730821717	73	163	2024-11-07	11:00:00	14:00:00	1	0		3	1500	102	5	2142	140	200	0	0	233	233	Mr	amil	navis	navisanil12@gmail.com	971	5485464028	0	0	1	0	207	3	0	2024-11-05 15:48:37	2024-11-05 15:48:37	200
472	236	pacakge	BL-1730879599	73	163	2024-11-08	09:00:00	13:00:00	1	0		3	1500	90	5	1890	0	200	0	0	236	236	Mr	anil	navis	anil007@gmail.com	971	5464864664	0	0	1	0	207	3	0	2024-11-06 07:53:19	2024-11-06 07:53:19	100
473	199	pacakge	BL-1730894461	47	159	2024-11-08	03:00:00	04:00:00	0	0		3	20	159.75	5	3354.75	650	2525	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	0	0	1	0	60	3	0	2024-11-06 12:01:01	2024-11-06 12:01:01	0
474	238	yatch	BL-1730896791	74	0	2024-11-08	09:00:00	13:00:00	1	0		1	4500	225	5	4725	0	0	0	1	238	238	Mr	Anil	navis	anilnavis@gmail.com	+971	523243163	0	0	1	0	235	1	0	2024-11-06 12:39:51	2024-11-06 12:39:51	0
475	238	pacakge	BL-1730905695	74	164	2024-11-08	15:00:00	17:00:00	1	0	The first time the two sides were able	3	1000	63	5	1323	60	200	0	1	238	238	Mr	Anil	navis	anilnavis@gmail.com	+971	523243163	0	0	1	0	235	3	0	2024-11-06 15:08:15	2024-11-06 15:08:15	0
476	199	pacakge	BL-1730999497	74	164	2024-11-09	19:00:00	22:00:00	0	0		3	1000	69	5	1449	60	200	0	0	199	199	Mr	Hamid	Raza	razahamid34@gmail.com	92	3441562555	0	0	1	0	235	3	0	2024-11-07 17:11:37	2024-11-07 17:11:37	120
477	243	pacakge	BL-1731006291	74	164	2024-11-16	09:00:00	12:00:00	1	0		1	1000	68	5	1428	60	200	0	1	243	243	Mr	Anil	navis	anilnavis@gmail.com	+971	523243163	0	0	1	0	235	1	0	2024-11-07 19:04:51	2024-11-07 19:04:51	100
478	231	pacakge	BL-1731058435	74	164	2024-11-12	19:00:00	21:00:00	1	0		3	1000	50.4	5	1058.4	60	200	252	1	231	231	Mr	anil	navis	anilnavis@gmail.com	971	5640050333	0	0	1	0	235	3	7	2024-11-08 09:33:55	2024-11-08 09:33:55	0
479	231	pacakge	BL-1731067766	74	164	2024-11-12	14:00:00	17:00:00	1	0		1	1000	55.6	5	1167.6	60	200	278	1	231	231	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	0	0	1	0	235	1	7	2024-11-08 12:09:26	2024-11-08 12:09:26	130
480	231	pacakge	BL-1731746548	74	164	2024-11-19	09:00:00	11:00:00	1	0		1	1000	63	5	1323	60	200	0	1	231	231	Mr	Anil	navis	anil@dxbusinessgroup.com	+971	523243163	0	0	1	0	235	1	0	2024-11-16 08:42:28	2024-11-16 08:42:28	0
\.


--
-- Data for Name: temp_category_texts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_category_texts (id, booking_id, category_id, description, created_at, updated_at) FROM stdin;
10	68	5	hey	2024-08-16 20:28:16	2024-08-16 20:28:16
11	69	3	heyhey	2024-08-16 20:32:59	2024-08-16 20:32:59
12	70	3	test	2024-08-16 20:43:51	2024-08-16 20:43:51
13	70	5	test	2024-08-16 20:43:51	2024-08-16 20:43:51
16	78	3	Red flowers	2024-08-17 12:40:05	2024-08-17 12:40:05
17	78	5	Red cake	2024-08-17 12:40:05	2024-08-17 12:40:05
18	79	3	Red flowers	2024-08-17 12:46:42	2024-08-17 12:46:42
19	79	5	Happy Birthday	2024-08-17 12:46:42	2024-08-17 12:46:42
20	84	3	best flower	2024-08-17 23:31:14	2024-08-17 23:31:14
21	85	5	Okt	2024-08-17 23:53:51	2024-08-17 23:53:51
22	86	15	ety7i99i hjh hv. hnvjn	2024-08-18 09:17:59	2024-08-18 09:17:59
23	87	15	ety7i99i hjh hv. hnvjn	2024-08-18 09:19:49	2024-08-18 09:19:49
24	88	15	Have	2024-08-18 09:24:29	2024-08-18 09:24:29
25	95	15	asd	2024-08-18 10:05:24	2024-08-18 10:05:24
26	96	15	happy birthday anil	2024-08-18 10:39:07	2024-08-18 10:39:07
27	107	3	They	2024-08-19 09:20:51	2024-08-19 09:20:51
28	108	3	Happy birthday	2024-08-19 09:26:15	2024-08-19 09:26:15
31	111	15	Happy birthday	2024-08-19 10:10:24	2024-08-19 10:10:24
32	139	0	Happy Belated happy	2024-08-19 19:19:34	2024-08-19 19:19:34
33	140	3	clor is my flower	2024-08-19 19:55:51	2024-08-19 19:55:51
34	140	5	cake is red.	2024-08-19 19:55:51	2024-08-19 19:55:51
45	153	3	that is clor of flower	2024-08-19 21:14:32	2024-08-19 21:14:32
46	153	5	that is really food cake	2024-08-19 21:14:32	2024-08-19 21:14:32
47	154	15	happy birthday nanny	2024-08-19 23:12:43	2024-08-19 23:12:43
48	155	15	happy birthday  nany	2024-08-19 23:28:19	2024-08-19 23:28:19
49	156	15	Happy valentine	2024-08-20 02:06:31	2024-08-20 02:06:31
50	175	3	tezy	2024-08-20 20:06:12	2024-08-20 20:06:12
51	175	5	test	2024-08-20 20:06:12	2024-08-20 20:06:12
52	207	15	Choi	2024-08-21 08:33:12	2024-08-21 08:33:12
53	209	15	Dfggg.	2024-08-21 08:41:51	2024-08-21 08:41:51
54	214	15	Edge	2024-08-21 09:04:52	2024-08-21 09:04:52
55	214	18	Face	2024-08-21 09:04:52	2024-08-21 09:04:52
56	215	15	Edge	2024-08-21 09:06:05	2024-08-21 09:06:05
57	215	18	Face	2024-08-21 09:06:05	2024-08-21 09:06:05
58	219	18	Vavbs	2024-08-21 09:13:28	2024-08-21 09:13:28
59	220	18	Try	2024-08-21 09:17:09	2024-08-21 09:17:09
60	221	18	Ghhh	2024-08-21 09:21:58	2024-08-21 09:21:58
61	222	18	Haha	2024-08-21 09:36:12	2024-08-21 09:36:12
62	226	18	Ghhhj	2024-08-21 13:31:21	2024-08-21 13:31:21
63	228	15	Happy birthday	2024-08-23 06:38:12	2024-08-23 06:38:12
64	228	18	Ghhhj	2024-08-23 06:38:12	2024-08-23 06:38:12
65	229	15	tesr	2024-08-23 22:16:57	2024-08-23 22:16:57
66	230	15	And	2024-08-26 08:32:26	2024-08-26 08:32:26
67	231	15	Ben	2024-08-26 13:05:42	2024-08-26 13:05:42
68	232	15	Shabna	2024-08-26 13:25:33	2024-08-26 13:25:33
69	233	18	Hshs	2024-09-02 07:17:55	2024-09-02 07:17:55
70	234	3	Kakkkk	2024-09-02 12:33:34	2024-09-02 12:33:34
71	234	5	Happy birthday	2024-09-02 12:33:34	2024-09-02 12:33:34
72	235	15	test	2024-09-03 10:45:28	2024-09-03 10:45:28
73	235	18	Test	2024-09-03 10:45:28	2024-09-03 10:45:28
76	244	15	Bb	2024-09-03 12:40:09	2024-09-03 12:40:09
77	268	18	Ccvbbb	2024-09-13 08:58:57	2024-09-13 08:58:57
78	269	15	Birthday	2024-09-13 09:11:11	2024-09-13 09:11:11
79	316	18	Chi	2024-10-09 04:12:21	2024-10-09 04:12:21
80	317	18	Hhjjj	2024-10-09 04:14:40	2024-10-09 04:14:40
81	321	37	Hi	2024-10-09 12:00:47	2024-10-09 12:00:47
82	321	38	Hello	2024-10-09 12:00:47	2024-10-09 12:00:47
83	324	37	gui	2024-10-09 12:19:27	2024-10-09 12:19:27
84	324	38	ggh	2024-10-09 12:19:27	2024-10-09 12:19:27
85	335	37	Try	2024-10-10 14:07:48	2024-10-10 14:07:48
86	335	38	Vvb	2024-10-10 14:07:48	2024-10-10 14:07:48
87	336	18	Happy married life	2024-10-11 03:37:42	2024-10-11 03:37:42
88	337	37	Haha	2024-10-16 16:10:16	2024-10-16 16:10:16
89	337	38	As	2024-10-16 16:10:16	2024-10-16 16:10:16
90	338	37	Haha	2024-10-16 16:10:30	2024-10-16 16:10:30
91	338	38	As	2024-10-16 16:10:30	2024-10-16 16:10:30
92	341	7	hi	2024-10-17 04:19:43	2024-10-17 04:19:43
93	342	7	hi	2024-10-17 04:22:38	2024-10-17 04:22:38
94	343	7	hi	2024-10-17 04:24:52	2024-10-17 04:24:52
95	344	7	hi	2024-10-17 04:50:17	2024-10-17 04:50:17
96	347	37	Chef	2024-10-17 11:42:08	2024-10-17 11:42:08
97	347	38	Ben	2024-10-17 11:42:08	2024-10-17 11:42:08
98	354	37	Guys	2024-10-18 17:24:18	2024-10-18 17:24:18
99	354	38	Here	2024-10-18 17:24:18	2024-10-18 17:24:18
100	372	37	The first time the two	2024-10-19 11:39:26	2024-10-19 11:39:26
101	372	38	The only way I could do that was if	2024-10-19 11:39:26	2024-10-19 11:39:26
102	373	37	The first time the two	2024-10-19 11:40:55	2024-10-19 11:40:55
103	373	38	The only way I could do that was if	2024-10-19 11:40:55	2024-10-19 11:40:55
104	375	37	The The Great Depression and	2024-10-19 12:03:01	2024-10-19 12:03:01
105	375	38	The only way I could do this would	2024-10-19 12:03:01	2024-10-19 12:03:01
106	379	37	The The The Big Lie and its lies have nothing in yyyyy	2024-10-20 09:37:26	2024-10-20 09:37:26
107	379	38	The only way I could do that was if	2024-10-20 09:37:26	2024-10-20 09:37:26
108	380	37	The The The Big Lie and its lies have nothing in yyyyy	2024-10-20 09:38:10	2024-10-20 09:38:10
109	380	38	The only way I could do that was if	2024-10-20 09:38:10	2024-10-20 09:38:10
110	381	37	The The The Big Lie and its lies have nothing in yyyyy	2024-10-20 10:19:21	2024-10-20 10:19:21
111	381	38	The only way I could do that was if	2024-10-20 10:19:21	2024-10-20 10:19:21
112	382	37	The The The Big Lie and its lies have nothing in yyyyy	2024-10-20 10:20:09	2024-10-20 10:20:09
113	382	38	The only way I could do that was if	2024-10-20 10:20:09	2024-10-20 10:20:09
114	383	37	The first time the two sides agreed to meet on a single day was	2024-10-20 10:26:31	2024-10-20 10:26:31
115	383	38	The only way I could do that was if	2024-10-20 10:26:31	2024-10-20 10:26:31
116	385	37	The first time the team had played	2024-10-20 12:02:09	2024-10-20 12:02:09
117	385	38	The only way I could	2024-10-20 12:02:09	2024-10-20 12:02:09
118	391	37	The only way I could do that was if	2024-10-21 05:01:31	2024-10-21 05:01:31
119	391	38	Type in your phone and then click the	2024-10-21 05:01:31	2024-10-21 05:01:31
120	398	37	Shah	2024-10-21 07:30:27	2024-10-21 07:30:27
121	398	38	Banana	2024-10-21 07:30:27	2024-10-21 07:30:27
122	399	37	Heheh	2024-10-21 11:18:28	2024-10-21 11:18:28
123	399	38	The first time the two sides	2024-10-21 11:18:28	2024-10-21 11:18:28
124	400	37	The only way I could	2024-10-21 12:24:05	2024-10-21 12:24:05
125	400	38	The first time the team	2024-10-21 12:24:05	2024-10-21 12:24:05
126	401	37	The only way I could do that was if you wanted	2024-10-21 13:24:34	2024-10-21 13:24:34
127	401	38	The only way I could do that was if you wanted me	2024-10-21 13:24:34	2024-10-21 13:24:34
128	402	37	The only way I could do that was if you wanted me	2024-10-21 14:57:50	2024-10-21 14:57:50
129	402	38	The only way I could do	2024-10-21 14:57:50	2024-10-21 14:57:50
130	409	37	The only way I could do uiiiiiy is	2024-10-22 13:32:31	2024-10-22 13:32:31
131	409	38	The first time the two sides agreed to meet on a single	2024-10-22 13:32:31	2024-10-22 13:32:31
132	421	37	The The Big Lie was the most important thing in my	2024-10-23 15:45:20	2024-10-23 15:45:20
133	421	38	The only way I could do that	2024-10-23 15:45:20	2024-10-23 15:45:20
134	422	37	Test cake	2024-10-23 23:43:30	2024-10-23 23:43:30
135	426	37	The first time the two	2024-10-24 04:01:35	2024-10-24 04:01:35
136	426	38	The only way I could do	2024-10-24 04:01:35	2024-10-24 04:01:35
137	428	37	The The Big Lie was the most important	2024-10-24 04:24:53	2024-10-24 04:24:53
138	428	38	The only way I could do that	2024-10-24 04:24:53	2024-10-24 04:24:53
139	431	37	The only way I could do that was by getting	2024-10-24 06:16:26	2024-10-24 06:16:26
140	431	38	The first YYYY	2024-10-24 06:16:26	2024-10-24 06:16:26
141	432	37	The only way I could do that was if you had the right person and the	2024-10-24 06:50:11	2024-10-24 06:50:11
142	432	38	The first time the two sides	2024-10-24 06:50:11	2024-10-24 06:50:11
154	450	42	The only way I could do that would	2024-10-24 13:08:35	2024-10-24 13:08:35
155	451	42	Hi	2024-10-24 13:14:13	2024-10-24 13:14:13
156	452	37	The first time the	2024-10-24 13:21:41	2024-10-24 13:21:41
157	452	38	The only way	2024-10-24 13:21:41	2024-10-24 13:21:41
158	457	42	The only way I could do	2024-10-30 13:21:06	2024-10-30 13:21:06
159	475	43	The The Big Lie of	2024-11-06 15:08:15	2024-11-06 15:08:15
\.


--
-- Data for Name: temp_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_users (id, name, email, dial_code, phone, user_type_id, user_phone_otp, access_token, user_data, created_at, updated_at) FROM stdin;
70	 	testc2@gmail.con	971	32145680987	3	1234	caff5db474f0524c95db1b72d843dd74	{"name":"owner two","email":"testc2@gmail.con","dial_code":"971","phone":"32145680987","password":"Hunain@12","confirm_password":"Hunain@12","account_type":"company","location_name":"H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,","location":"33.56681848244403,73.13681647181511","date_of_birth":"1993-04-06","company_name":"test company two","device_type":"ANDROID","fcm_token":"abcd","device_cart_id":"507c25ffbc01d8ae","is_represent":"1","rep_name":"representative name","rep_email":"represe@gmail.com","rep_dial_code":"971","rep_phone":"36512369874","logo":{},"trade_license":{}}	2024-07-18 15:01:27	2024-07-18 15:01:27
74	 	razahamid341@gmail.com	92	3441562559	3	1234	8d3879b8a0de8b7e572fec11c5dd0c01	{"name":"Raza","email":"razahamid341@gmail.com","dial_code":"92","phone":"3441562559","password":"As@1As@2","confirm_password":"As@1As@2","account_type":"company","location_name":"6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,","location":"32.23089391032757,74.48620900511742","date_of_birth":"1993-04-06","company_name":"Hamid","device_type":"ANDROID","fcm_token":"abcd","device_cart_id":"599d57ab8f6dbde0","is_represent":"1","rep_name":"Hamid","rep_email":"razahamid34@gmail.com","rep_dial_code":"92","rep_phone":"3441562559","logo":{}}	2024-07-21 12:54:23	2024-07-21 12:54:23
274	Asad Z	arshadiqbal.d1@gmail.com	92	3042721336	2	1234	33b576571a06d7a32c0bf927ef03e7a4	{"first_name":"Asad","last_name":"Z","email":"arshadiqbal.d1@gmail.com","dial_code":"92","phone":"3042721336","gender":"male","date_of_birth":"1993-04-06","password":"testing22","confirm_password":"testing22","location_name":"462Q+26 Dubai - United Arab Emirates","location":"25.1000998,55.2380812","is_social":"0"}	2024-10-31 14:28:16	2024-10-31 14:28:16
78	 	az@gmail.com	92	861646464646	3	1234	71475ac9811f740373ecdc1bf890ec55	{"fcm_token":"abdhjef ekef kjwf wedfw","rep_email":"ali@gmail.com","dial_code":"92","location_name":"5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan","rep_dial_code":"92","name":"az","language":"en","password":"Zain@777","device_type":"iOS","phone":"861646464646","location":"33.51605765801733,73.1108292890817","confirm_password":"Zain@777","account_type":"company","company_name":"az","rep_phone":"404844848484","email":"az@gmail.com","is_represent":"1","device_cart_id":"13822C6B-D116-4BEA-8B25-6D127B86654A","rep_name":"ali","trade_license":{},"logo":{}}	2024-07-22 21:23:05	2024-07-22 21:23:05
11	Asad Nazir	asadnazir289@gmail.com	+93	3441560339	2	1234	dfc5b4ecce758143f31577aacc8cfe69	{"first_name":"Asad","last_name":"Nazir","email":"asadnazir289@gmail.com","dial_code":"+93","phone":"3441560339","gender":"Male","date_of_birth":"2024-05-02","password":"Asdf@1122","confirm_password":"Asdf@1122","location_name":"Tibesti est, Chad,","location":"18.927893452951487,16.96881382885415kotlin.Unit","is_social":"0"}	2024-05-17 00:48:05	2024-05-17 00:48:05
194	 	test7001@gmail.com	358	848454545455	3	1234	9fd65c2963c3f96437a2c2a811f52766	{"account_type":"individual","confirm_password":"12345678","device_cart_id":"2DBAA594-4E15-4641-8594-F2D3DF28A52C","device_type":"iOS","dial_code":"358","email":"test7001@gmail.com","family_name":"gas","fcm_token":"dHr-E_6XUUpYiu-VzkigyA:APA91bFDz51DpaauPJvz3lgNnZ2FG26FKPELNpv1gkv8ARhE9VWJt7iTp9wKuJOROfp2AGyHXW4uPD4fUb60TYPmZGVlsJ-QxhVPFqhvBW67wrdQF9AUUKX8puf-EYTFT7TvWXbI_15a","gender":"male","hear_about_us":"2","language":"en","name":"tata","nationality":"1","password":"12345678","phone":"848454545455","username":"test8001@gmail.com"}	2024-09-21 00:35:53	2024-09-21 00:35:53
27	Asad Z	testing145@gmail.com	92	54142365	2	1234	08978ef09ef14d544fbbf0241288b0c0	{"first_name":"Asad","last_name":"Z","email":"testing145@gmail.com","dial_code":"92","phone":"54142365","gender":"male","date_of_birth":"1993-04-06","password":"testing22","confirm_password":"testing22","location_name":"462Q+26 Dubai - United Arab Emirates","location":"25.1000998,55.2380812","is_social":"0"}	2024-05-27 10:47:22	2024-05-27 10:47:22
28	Teas afafd	asfadfdf@gmail.com	92	65874512	2	1234	b9bffae2b89ff1578e54c3f2be186577	{"is_social":"1","first_name":"Teas","last_name":"afafd","email":"asfadfdf@gmail.com","dial_code":"92","phone":"65874512","gender":"male","date_of_birth":"1994-04-21","location_name":"462Q+26 Dubai - United Arab Emirates","location":"25.1000998,55.2380812"}	2024-05-27 10:48:05	2024-05-27 10:48:05
42	 	new2wahab262khurram@gmail.com	92	41236547	3	1234	ce840e4dc489871bd243529b45b320da	{"name":"Wahab","family_name":"Khurram","email":"new2wahab262khurram@gmail.com","dial_code":"92","phone":"41236547","password":"testing22","confirm_password":"testing22","account_type":"individual","hear_about_us":"1","nationality":"1","username":"wahabfun223","gender":"male","date_of_birth":"1993-04-06"}	2024-05-27 22:05:46	2024-05-27 22:05:46
46	Asad Nazir	abcde@gmail.com	+93	3441560318	2	1234	a69f6f4ec9a7177334203a7fa254b079	{"first_name":"Asad","last_name":"Nazir","email":"abcde@gmail.com","dial_code":"+93","phone":"3441560318","gender":"Male","date_of_birth":"2018-05-28","password":"Asdf@1123","confirm_password":"Asdf@1123","location_name":"673C+W8V - Dubai - United Arab Emirates,","location":"673C+W8V - Dubai - United Arab Emirates,","is_social":"0"}	2024-05-28 11:53:20	2024-05-28 11:53:20
51	Asad Z	asadz14534@gmail.com	92	555412364	2	1234	955b7544c903f9953383818ce27e669f	{"first_name":"Asad","last_name":"Z","email":"asadz14534@gmail.com","dial_code":"92","phone":"555412364","gender":"male","date_of_birth":"1993-04-06","password":"testing22","confirm_password":"testing22","location_name":"462Q+26 Dubai - United Arab Emirates","location":"25.1000998,55.2380812","is_social":"0","device_type":"android","fcm_token":"aasfdf","device_cart_id":"252"}	2024-05-29 14:13:23	2024-05-29 14:13:23
53	Suleman Ali	suleman.ali303@gmail.com	+92	30276558762	2	1234	b6a8058852ccd258b5701aabaa1510c3	{"password":"Zulfiqar@12","is_social":"0","fcm_token":null,"last_name":"Ali","location_name":"Shahi Road, Shahi Road, Rahimyar Khan, Punjab, Pakistan","location":"28.422355775563563,70.31694542616606","device_type":"ios","email":"suleman.ali303@gmail.com","phone":"30276558762","first_name":"Suleman","device_cart_id":"21B1BA04-A445-4E0D-9105-E43BA3DEAEDE","date_of_birth":"1997-08-25","gender":"male","confirm_password":"Zulfiqar@12","dial_code":"+92"}	2024-05-29 14:42:28	2024-05-29 14:42:28
54	suleman ali	ib2suleman.alti@gmail.com	+92	30276558761	2	1234	3551c70b1949ef9a4986a0987a058fd6	{"device_type":"ios","date_of_birth":"1997-05-29","gender":"male","first_name":"suleman","phone":"30276558761","password":"qwerty","last_name":"ali","dial_code":"+92","confirm_password":"qwerty","location_name":"Shahi Road, Shahi Road, Rahimyar Khan, Punjab, Pakistan","is_social":"0","device_cart_id":"21B1BA04-A445-4E0D-9105-E43BA3DEAEDE","location":"28.422355775563563,70.31694542616606","email":"ib2suleman.alti@gmail.com","fcm_token":null}	2024-05-29 14:51:53	2024-05-29 14:51:53
55	suleman ali	suleman.ali3034@gmail.com	+92	30276558762222	2	1234	6ec812214e5c76f3b67012857c7cf26d	{"email":"suleman.ali3034@gmail.com","device_type":"ios","dial_code":"+92","device_cart_id":"21B1BA04-A445-4E0D-9105-E43BA3DEAEDE","fcm_token":null,"phone":"30276558762222","first_name":"suleman","location_name":"Shahi Road, Shahi Road, Rahimyar Khan, Punjab, Pakistan","gender":"male","date_of_birth":"1997-08-25","is_social":"0","location":"28.422355775563563,70.31694542616606","password":"Zulfiqar","last_name":"ali","confirm_password":"Zulfiqar"}	2024-05-29 15:23:48	2024-05-29 15:23:48
142	Sooraj Sabu	soorfaj1@yopmail.com	91	86469555	2	1234	b3e535978eca18bc64f2ad1a100d11ff	{"first_name":"Sooraj","last_name":"Sabu","email":"soorfaj1@yopmail.com","dial_code":"91","phone":"86469555","gender":"male","date_of_birth":"1993-04-06","password":"Hello@1985","confirm_password":"Hello@1985","location_name":"462Q+26 Dubai - United Arab Emirates","location":"25.1000998,55.2380812","is_social":"0","device_type":"android","fcm_token":"aasfdf","device_cart_id":"252"}	2024-08-26 18:58:52	2024-08-26 18:58:52
75	 	razahamid39@gmail.com	92	3441562568	3	1234	237debb30eccf509e2a9fc530b060919	{"name":"Hamid","family_name":"Hamid","email":"razahamid39@gmail.com","dial_code":"92","phone":"3441562568","password":"As@1As@2","confirm_password":"As@1As@2","account_type":"individual","hear_about_us":"1","nationality":"164","username":"razahamid35","gender":"Male","date_of_birth":"1993-04-06","device_type":"ANDROID","fcm_token":"asd","device_cart_id":"Asd"}	2024-07-22 09:48:50	2024-07-22 09:48:50
66	 	test30@gmail.com	93	5151151515	3	1234	3b1d2a4ae4ec63ea0fee59a1414ef6e3	{"rep_phone":"84848484","rep_email":"testRep@gmail.com","language":"en","email":"test30@gmail.com","dial_code":"93","phone":"5151151515","is_represent":"1","account_type":"company","rep_name":"test","company_name":"test","password":"Test@777","device_type":"iOS","location_name":"Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan","fcm_token":"abdhjef ekef kjwf wedfw","location":"33.51611946299474,73.11084576954921","rep_dial_code":"93","device_cart_id":"13822C6B-D116-4BEA-8B25-6D127B86654A","name":"test","confirm_password":"Test@777","trade_license":{},"logo":{}}	2024-06-06 00:48:51	2024-06-06 00:48:51
67	 	testcomp1@gmail.com	93	815145454	3	1234	e1aa328c02aacbcdb81f199d52f28785	{"device_type":"iOS","email":"testcomp1@gmail.com","location":"33.51611946299474,73.11084576954921","company_name":"bash","is_represent":"1","location_name":"Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan","rep_dial_code":"1684","fcm_token":"abdhjef ekef kjwf wedfw","language":"en","rep_email":"testrep1@gmail.com","phone":"815145454","name":"hwwha","dial_code":"93","rep_phone":"8484313113","device_cart_id":"13822C6B-D116-4BEA-8B25-6D127B86654A","password":"test@777","account_type":"company","confirm_password":"test@777","rep_name":"bas","logo":{},"trade_license":{}}	2024-06-06 01:01:49	2024-06-06 01:01:49
85	 	asad1122@gmail.com	92	3441560319	3	1234	6bd6c4ddd64518498ca7edcc71ac41b1	{"name":"Asad","family_name":"Asad","email":"asad1122@gmail.com","dial_code":"92","phone":"3441560319","password":"Asdf@1122","confirm_password":"Asdf@1122","account_type":"individual","hear_about_us":"1","nationality":"164","username":"asad","gender":"male","date_of_birth":"1993-04-06","device_type":"ANDROID","fcm_token":"asd","device_cart_id":"Asd"}	2024-08-08 11:05:45	2024-08-08 11:05:45
91	test user	test797@gmail.com	+971	837982748927	2	1234	a458b2f57bb558abecd9ae7bf5bc78c9	{"confirm_password":"Test@1234","date_of_birth":"1995-08-08","device_cart_id":"956CBA0E-AC69-4600-86C6-0EEBADE8EEC9","device_type":"iOS","dial_code":"+971","email":"test797@gmail.com","fcm_token":"abdhjef ekef kjwf wedfw","first_name":"test","gender":"Male","is_social":"0","language":"en","last_name":"user","location":"37.78583393502708,-122.40641713142396","location_name":"Powell St, Ellis St, San Francisco, CA, 94108, United States","password":"Test@1234","phone":"837982748927"}	2024-08-08 21:52:14	2024-08-08 21:52:14
92	nas test	testyujl@gmail.com	+971	7298478937	2	1234	d96608e512d0bad2dc3a7f49fbda23be	{"confirm_password":"Test@1234","date_of_birth":"2010-08-09","device_cart_id":"956CBA0E-AC69-4600-86C6-0EEBADE8EEC9","device_type":"iOS","dial_code":"+971","email":"testyujl@gmail.com","fcm_token":"abdhjef ekef kjwf wedfw","first_name":"nas","gender":"Male","is_social":"0","language":"en","last_name":"test","location":"37.78583393502708,-122.40641713142396","location_name":"Powell St, Ellis St, San Francisco, CA, 94108, United States","password":"Test@1234","phone":"7298478937"}	2024-08-09 00:19:54	2024-08-09 00:19:54
93	test test	testryt@gmail.com	+971	7687676767	2	1234	2356cb2b5322dbba4761c558c9afee46	{"confirm_password":"Test@1234","date_of_birth":"2011-08-09","device_cart_id":"956CBA0E-AC69-4600-86C6-0EEBADE8EEC9","device_type":"iOS","dial_code":"+971","email":"testryt@gmail.com","fcm_token":"abdhjef ekef kjwf wedfw","first_name":"test","gender":"Male","is_social":"0","language":"en","last_name":"test","location":"37.78583393502708,-122.40641713142396","location_name":"Powell St, Ellis St, San Francisco, CA, 94108, United States","password":"Test@1234","phone":"7687676767"}	2024-08-09 00:24:07	2024-08-09 00:24:07
94	test tyuy	gjhg@gmail.com	+971	6876867432	2	1234	8e117e75727186c9a09048e42c160337	{"confirm_password":"Test@1234","date_of_birth":"2015-08-09","device_cart_id":"956CBA0E-AC69-4600-86C6-0EEBADE8EEC9","device_type":"iOS","dial_code":"+971","email":"gjhg@gmail.com","fcm_token":"abdhjef ekef kjwf wedfw","first_name":"test","gender":"Male","is_social":"0","language":"en","last_name":"tyuy","location":"37.78583393502708,-122.40641713142396","location_name":"Powell St, Ellis St, San Francisco, CA, 94108, United States","password":"Test@1234","phone":"6876867432"}	2024-08-09 00:28:15	2024-08-09 00:28:15
95	test nasjk	testnk@gmail.com	+971	638264826	2	1234	6de2461b3070e4f18ce52d9678668089	{"confirm_password":"Test@1234","date_of_birth":"1992-08-09","device_cart_id":"956CBA0E-AC69-4600-86C6-0EEBADE8EEC9","device_type":"iOS","dial_code":"+971","email":"testnk@gmail.com","fcm_token":"abdhjef ekef kjwf wedfw","first_name":"test","gender":"Male","is_social":"0","language":"en","last_name":"nasjk","location":"37.78583393502708,-122.40641713142396","location_name":"Powell St, Ellis St, San Francisco, CA, 94108, United States","password":"Test@1234","phone":"638264826"}	2024-08-09 00:36:24	2024-08-09 00:36:24
195	 	test7002@gmail.com	355	54545545454	3	1234	ff6600e4a414f4b8f15b7999af934828	{"account_type":"individual","confirm_password":"Zain@777","device_cart_id":"2DBAA594-4E15-4641-8594-F2D3DF28A52C","device_type":"iOS","dial_code":"355","email":"test7002@gmail.com","family_name":"ha","fcm_token":"dHr-E_6XUUpYiu-VzkigyA:APA91bFDz51DpaauPJvz3lgNnZ2FG26FKPELNpv1gkv8ARhE9VWJt7iTp9wKuJOROfp2AGyHXW4uPD4fUb60TYPmZGVlsJ-QxhVPFqhvBW67wrdQF9AUUKX8puf-EYTFT7TvWXbI_15a","gender":"male","hear_about_us":"1","language":"en","name":"hq","nationality":"1","password":"Zain@777","phone":"54545545454","username":"test8002@gmail.com"}	2024-09-21 00:39:58	2024-09-21 00:39:58
197	 	test805@gmail.com	971	515454554	3	1234	cbb7404bc4c0c9ac29966f4736434a15	{"account_type":"individual","confirm_password":"Zain@777","device_cart_id":"2DBAA594-4E15-4641-8594-F2D3DF28A52C","device_type":"iOS","dial_code":"971","email":"test805@gmail.com","family_name":"jas","fcm_token":"dHr-E_6XUUpYiu-VzkigyA:APA91bFDz51DpaauPJvz3lgNnZ2FG26FKPELNpv1gkv8ARhE9VWJt7iTp9wKuJOROfp2AGyHXW4uPD4fUb60TYPmZGVlsJ-QxhVPFqhvBW67wrdQF9AUUKX8puf-EYTFT7TvWXbI_15a","gender":"male","hear_about_us":"2","language":"en","name":"as","nationality":"1","password":"Zain@777","phone":"515454554","username":"tets@gmail.com"}	2024-09-21 05:39:33	2024-09-21 05:39:33
96	nas test	testbii@gmail.com	+971	646169184894	2	1234	7d89378abecd3216cbe5da9fb83c186a	{"confirm_password":"Test@1234","date_of_birth":"2016-08-09","device_cart_id":"CF7E22F7-2383-4D17-BEFB-43BA40F8C46F","device_type":"iOS","dial_code":"+971","email":"testbii@gmail.com","fcm_token":"abdhjef ekef kjwf wedfw","first_name":"nas","gender":"Male","is_social":"0","language":"en","last_name":"test","location":"33.53822119649842,73.11710726469755","location_name":"Service Road, Service Road, Rawalpindi, Punjab, Pakistan","password":"Test@1234","phone":"646169184894"}	2024-08-09 00:48:36	2024-08-09 00:48:36
143	test nas	testjk@gmail.com	971	51515848454	2	1234	f01e2da8bb1088044ac754f969909cf3	{"confirm_password":"Test@1234","date_of_birth":"2024-08-26","device_cart_id":"CF7E22F7-2383-4D17-BEFB-43BA40F8C46F","device_type":"iOS","dial_code":"971","email":"testjk@gmail.com","fcm_token":"dYnvpt0Do0nnkvZrcksuk8:APA91bG1XMZIoQJhRc5a0Aje_7olrBzvw8jnNfBRNpE0LMyelBJtLbUZfOGXtaU7YgfHraTYZDU4Tif08RuFhsvIGEISs0LWoG6BIY9bTevjvrKUiRJadi5My4qqyw0mC0Pnt-1piKE2","first_name":"test","gender":"male","is_social":"0","language":"en","last_name":"nas","location":"33.538330185245265,73.12179107218981","location_name":"Service Road, Service Road, Rawalpindi, Punjab, Pakistan","password":"Test@1234","phone":"51515848454"}	2024-08-26 19:30:53	2024-08-26 19:30:53
277	Asad Z	arshadiqbal.d11@gmail.com	92	3042721336	2	2466	fef2558ea048e8bf46933ab84c18e127	{"first_name":"Asad","last_name":"Z","email":"arshadiqbal.d11@gmail.com","dial_code":"92","phone":"3042721336","gender":"male","date_of_birth":"1993-04-06","password":"testing22","confirm_password":"testing22","location_name":"462Q+26 Dubai - United Arab Emirates","location":"25.1000998,55.2380812","is_social":"0"}	2024-10-31 15:34:28	2024-10-31 15:34:28
110	 	mbs@yopmail.com	971	505086087	3	1234	be5b0eee3aa88e3c7cc94e8a8cd2d721	{"name":"Mbs","email":"mbs@yopmail.com","dial_code":"971","phone":"505086087","password":"Hello@1985","confirm_password":"Hello@1985","account_type":"company","location_name":"673C+W8V - Dubai - United Arab Emirates,","location":"25.204849237091366,55.27078282088041","date_of_birth":"1993-04-06","company_name":"Mb","device_type":"ANDROID","fcm_token":"abcd","device_cart_id":"d40ff12425303f2c","logo":{},"trade_license":{}}	2024-08-17 18:34:33	2024-08-17 18:34:33
111	 	razahamid002@gmail.com	92	3441562599	3	1234	2a12523b1f1b01eaf1eaa633fcc2334f	{"name":"Raxa","email":"razahamid002@gmail.com","dial_code":"92","phone":"3441562599","password":"As@1As@2","confirm_password":"As@1As@2","account_type":"company","location_name":"6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,","location":"32.23068800778801,74.48604740202427","date_of_birth":"1993-04-06","company_name":"Hamid","device_type":"ANDROID","fcm_token":"abcd","device_cart_id":"599d57ab8f6dbde0","is_represent":"1","rep_name":"Ahmad","rep_email":"razahamid003@gmail.com","rep_dial_code":"92","rep_phone":"3441562598","logo":{},"trade_license":{}}	2024-08-17 18:54:07	2024-08-17 18:54:07
112	 	razahamid003@gmail.com	92	3441562597	3	1234	0d07be716651987931d6a793bbccbca7	{"name":"Wahab","family_name":"Khurram","email":"razahamid003@gmail.com","dial_code":"92","phone":"3441562597","password":"testing22","confirm_password":"testing22","account_type":"company","location_name":"462Q+26 Dubai - United Arab Emirates","location":"25.1000998,55.2380812","hear_about_us":"1","nationality":"1","username":"wahabfun22","gender":"male","company_name":"IBM 2","device_type":"android","fcm_token":"aasfdf","device_cart_id":"252","logo":{},"trade_license":{}}	2024-08-17 20:08:46	2024-08-17 20:08:46
113	nasrullah khan	nasrulah@gmail.com	+971	64518848454	2	1234	377a97376639fdba025b37f06529f086	{"confirm_password":"Test@1234","date_of_birth":"2024-08-17","device_cart_id":"CF7E22F7-2383-4D17-BEFB-43BA40F8C46F","device_type":"iOS","dial_code":"+971","email":"nasrulah@gmail.com","fcm_token":"abdhjef ekef kjwf wedfw","first_name":"nasrullah","gender":"male","is_social":"0","language":"en","last_name":"khan","location":"33.51595666594071,73.1108359247446","location_name":"Rawalpindi, Rawalpindi, Punjab, Pakistan","password":"Test@1234","phone":"64518848454"}	2024-08-17 22:05:35	2024-08-17 22:05:35
167	First Name Last NAME	razahamid101@gmail.com	92	3441562580	2	1234	5687d0723641c2d2f190a88172f006ef	{"first_name":"First Name","last_name":"Last NAME","email":"razahamid101@gmail.com","dial_code":"92","phone":"3441562580","gender":"female","date_of_birth":"1996-09-28","password":"As@1As@2","confirm_password":"As@1As@2","location_name":"6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,","location":"32.230739058047924,74.48611278086901","is_social":"null","device_type":"ANDROID","fcm_token":"fFtWOj8kR5OrxvaBZBTsHq:APA91bHljrMnIv0PqqA9oDMtpmRV_-W3PYqKE-PkZZpGxcHUgp8w5FFCcSiTjCZ1fWkMmoM7zPIM4ksEizpGykNmadR_M6O85cI52Msymdcf7_a90DvpJncKOXBeuaNH3NSzauPGHKo1","device_cart_id":"Asd"}	2024-09-10 15:00:38	2024-09-10 15:00:38
170	Test New	testan@gmail.com	92	3357705056	2	1234	67ba6aa41852cf97718e49189fb01f2d	{"first_name":"Test","last_name":"New","email":"testan@gmail.com","dial_code":"92","phone":"3357705056","gender":"male","date_of_birth":"2024-09-08","password":"Test@1234","confirm_password":"Test@1234","location_name":"Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,","location":"33.51642879160227,73.11083659529686","is_social":"null","device_type":"ANDROID","fcm_token":"c0QZxJCDR1OnmgYHEZ787J:APA91bFKw9wrbqBEYP4nWBu2KBJmpKlYVARwj-eWkzeDOfOXKPUcO2PxfaD4fLEvT5Xr2AWnKt3jL9JB7OFnd1EmJP2LbjNirERn79uhltrtIiXbqLjJYDCWsfgLsFcEqBKIZd9zvMAh","device_cart_id":"Asd"}	2024-09-10 20:30:11	2024-09-10 20:30:11
196	 	test8003@gmail.com	358	84848484884	3	1234	975a499c2e2d005caa5a75442fda0556	{"account_type":"individual","confirm_password":"Zain@777","device_cart_id":"2DBAA594-4E15-4641-8594-F2D3DF28A52C","device_type":"iOS","dial_code":"358","email":"test8003@gmail.com","family_name":"qha","fcm_token":"dHr-E_6XUUpYiu-VzkigyA:APA91bFDz51DpaauPJvz3lgNnZ2FG26FKPELNpv1gkv8ARhE9VWJt7iTp9wKuJOROfp2AGyHXW4uPD4fUb60TYPmZGVlsJ-QxhVPFqhvBW67wrdQF9AUUKX8puf-EYTFT7TvWXbI_15a","gender":"male","hear_about_us":"2","language":"en","name":"ccf","nationality":"1","password":"Zain@777","phone":"84848484884","username":"test8005@gmail.com"}	2024-09-21 00:50:07	2024-09-21 00:50:07
138	Usama Shakeel	usama0@gmail.com	971	33158684	2	1234	f49e8a03328b519cb42b64c55849ad12	{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","dial_code":"971","phone":"33158684","gender":"male","date_of_birth":"2024-08-20","password":"Hello@123","confirm_password":"Hello@123","location_name":"J3M5+R27, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,","location":"33.63464758012452,73.05783078074455","is_social":"null","device_type":"ANDROID","fcm_token":"fBYTxQTpQiOGvjb5YNQR8z:APA91bHy-zLfq7MQizKIpjaX38GjKzIucVM2FgZec7qVg98kXP1yo_zckFE8Iy23MNeu1PAvxs0Fjq3_assLiwJyBLW5LMN_JBQGvC3eEMgpJfCYpElZdB1FVe49c684HwGpG84M3D1g","device_cart_id":"Asd"}	2024-08-21 16:35:15	2024-08-21 16:35:15
199	 	dev@dev.con	971	555555555	3	1234	139b153a017b36f79bda2482e47cd9da	{"account_type":"individual","confirm_password":"Hello@1985","device_cart_id":"A913C498-535B-4C7E-B63A-1396DD50EB55","device_type":"iOS","dial_code":"971","email":"dev@dev.con","family_name":"s","fcm_token":"cRj4M4TBdEdVlAwA7zoyG7:APA91bHcEgfq7I9291rtkV7K50HQkhiRP4rQO98RpKckXJsVLbQQw_FoYS9SMlAn8mO9P-SS-uA8i1RtGgP-JW7JQ3FArEO3Zx-nYf-gStd-gaGNC0ml6hDXxV-ELcuJ1XabPooc7qxo","gender":"female","hear_about_us":"1","language":"en","name":"Dev","nationality":"98","password":"Hello@1985","phone":"555555555","username":"dev@dev.com"}	2024-09-23 17:01:08	2024-09-23 17:01:08
200	 	dev@dev.com	971	555555555	3	1234	031bf0db1f4ac90508a9a42b92cb00d4	{"name":"DEV","family_name":"S","email":"dev@dev.com","dial_code":"971","phone":"555555555","password":"Hello@1985","confirm_password":"Hello@1985","account_type":"individual","hear_about_us":"4","nationality":"98","username":"dev@dev.com","gender":"female","device_type":"ANDROID","fcm_token":"cFDyCZg7QkGQIGTpptEZAB:APA91bHbIMLfMEygP31uY7_AlcinOgOAD4yMPR3yI9-oeA8Ixn460gKqKd-xkP4yPrREkJI6wuQ0SsxnJH35qmYD8s-EKRGi1y97qFG91iupW3E0_aIKavaHF1J3yIXbKDxucnIQGMnY","device_cart_id":"853f83811c6a386b"}	2024-09-23 17:01:16	2024-09-23 17:01:16
262	Test Test	test123@mailinator.com	92	3042721335	2	1234	56ec6279fcbb0b2d6d35d319ae6d7e7e	{"first_name":"Test","last_name":"Test","email":"test123@mailinator.com","dial_code":"92","phone":"3042721335","gender":"male","date_of_birth":"2024-10-01","password":"Arshad888###","confirm_password":"Arshad888###","location_name":"V2C9+7XX, Garden Rd, Saddar Police Head Quarters, Karachi, Karachi City, Sindh, Pakistan,","location":"24.871016968082884,67.01998114585876","is_social":"0","device_type":"ANDROID","fcm_token":"ddBnFG5jTBumynNyvOk3_l:APA91bF-O_BCFhQmz8mQpqba7aQ8GmCXh_RAiHLcAB3HOMaIn5JA6V0K4Sx3Cfg1IvydZ8W_OWtyTVjBBaoQ5admOFSKmoG_-3LBDmuq413leWDGX3Aaf1Z7_J6VAf8wwRG9P9WDWAQT","device_cart_id":"Asd"}	2024-10-15 16:30:26	2024-10-15 16:30:26
278	anil navis	ab@ab.com	971	564005096	2	6000	77eac88f795801d2019173dba52fbe6b	{"confirm_password":"Hello@1985","date_of_birth":"2013-10-31","device_cart_id":"6EA6D416-DA42-428C-825E-3AEF16F25740","device_type":"iOS","dial_code":"971","email":"ab@ab.com","fcm_token":"eOZD3UlEA0B8j0v7wrL4Rf:APA91bFzURhYaPydIZArKi-mZ8ipmu_478J8HNVneLj6cXwWqxilf6pvQJ6Xof_8tCjkBngFPfyVKMqtahc_ptS9X6ny7-TbDDQQ-_jtI-V8KjLR7-GElBA","first_name":"anil","gender":"male","is_social":"0","language":"en","last_name":"navis","location":"25.18412105781981,55.260304771363735","location_name":"Business Bay, Al Mustaqbal Street, Dubai, Dubai, United Arab Emirates","password":"Hello@1985","phone":"564005096"}	2024-10-31 15:36:35	2024-10-31 15:36:35
279	anil navis	b@b.com	971	564005096	2	2201	64433187807325235866de8c557639ad	{"confirm_password":"Hello@1985","date_of_birth":"2010-10-31","device_cart_id":"6EA6D416-DA42-428C-825E-3AEF16F25740","device_type":"iOS","dial_code":"971","email":"b@b.com","fcm_token":"eOZD3UlEA0B8j0v7wrL4Rf:APA91bFzURhYaPydIZArKi-mZ8ipmu_478J8HNVneLj6cXwWqxilf6pvQJ6Xof_8tCjkBngFPfyVKMqtahc_ptS9X6ny7-TbDDQQ-_jtI-V8KjLR7-GElBA","first_name":"anil","gender":"male","is_social":"0","language":"en","last_name":"navis","location":"25.184121016658313,55.260304715774126","location_name":"Business Bay, Al Mustaqbal Street, Dubai, Dubai, United Arab Emirates","password":"Hello@1985","phone":"564005096"}	2024-10-31 15:39:56	2024-10-31 15:39:56
281	 	bn@bn.cob	971	564005098	3	4604	1290ad5bc42d463e02457a0c5b933c3f	{"account_type":"individual","confirm_password":"Hello@1985","device_cart_id":"6EA6D416-DA42-428C-825E-3AEF16F25740","device_type":"iOS","dial_code":"971","email":"bn@bn.cob","family_name":"abdulla","fcm_token":"cydiT-P4BkIOq8gn98xgtX:APA91bGcdc4sO6RqazXZsW5DOMesDC2I6A2QWQM1-cqLKkoxFsWjHH6b-8K3ZmkXh7lOKUPKm2IzUNH1prk8kf6n4wZoH0XG-XdH06OBwHEdbII4ghI07Pw","gender":"male","hear_about_us":"1","language":"en","name":"abdullab","nationality":"1","password":"Hello@1985","phone":"564005098","username":"gb@gb.com"}	2024-10-31 15:50:33	2024-10-31 15:50:33
234	Sooraj Sabu	arshadiqbal.d2@gmail.com	91	8646955121	2	1234	5d49c4002fd4f3e1bdf5269349670e1f	{"first_name":"Sooraj","last_name":"Sabu","email":"arshadiqbal.d2@gmail.com","dial_code":"91","phone":"8646955121","gender":"male","date_of_birth":"1993-04-06","password":"Hello@1985","confirm_password":"Hello@1985","location_name":"462Q+26 Dubai - United Arab Emirates","location":"25.1000998,55.2380812","is_social":"0","device_type":"android","fcm_token":"aasfdf","device_cart_id":"252"}	2024-10-09 08:22:23	2024-10-09 08:22:23
241	Sooraj Sabu	arshadtest121@mailinator.com	91	86469551211121	2	1234	734984631ff9513c3b52a6e67cad760f	{"otp":"1234","access_token":"93ee01a299ab23fb8c508e652418c640","first_name":"Sooraj","last_name":"Sabu","email":"arshadtest121@mailinator.com","dial_code":"91","phone":"86469551211121","gender":"male","date_of_birth":"1993-04-06","password":"Hello@1985","confirm_password":"Hello@1985","location_name":"462Q+26 Dubai - United Arab Emirates","location":"25.1000998,55.2380812","is_social":"0","device_type":"android","fcm_token":"aasfdf","device_cart_id":"252"}	2024-10-09 09:32:59	2024-10-09 09:32:59
244	Sooraj Sabu	arshadtest121111@mailinator.com	91	86469551211121111	2	1234	f9a2e9c981f7156ddfef7d8ab40176b7	{"otp":"1234","access_token":"b0e7995266dcdff449bf9dd7182e9257","first_name":"Sooraj","last_name":"Sabu","email":"arshadtest121111@mailinator.com","dial_code":"91","phone":"86469551211121111","gender":"male","date_of_birth":"1993-04-06","password":"Hello@1985","confirm_password":"Hello@1985","location_name":"462Q+26 Dubai - United Arab Emirates","location":"25.1000998,55.2380812","is_social":"0","device_type":"android","fcm_token":"aasfdf","device_cart_id":"252"}	2024-10-09 09:36:31	2024-10-09 09:36:31
246	Sooraj Sabu	arshadtest1211111@mailinator.com	91	864695512111211111	2	1234	21194c77e47acdd19f68d00a45640033	{"otp":"1234","access_token":"15497511c2a4ab462a9765b924ce3f43","first_name":"Sooraj","last_name":"Sabu","email":"arshadtest1211111@mailinator.com","dial_code":"91","phone":"864695512111211111","gender":"male","date_of_birth":"1993-04-06","password":"Hello@1985","confirm_password":"Hello@1985","location_name":"462Q+26 Dubai - United Arab Emirates","location":"25.1000998,55.2380812","is_social":"0","device_type":"android","fcm_token":"aasfdf","device_cart_id":"252"}	2024-10-09 09:37:37	2024-10-09 09:37:37
247	Sooraj Sabu	arshadtest12111111@mailinator.com	91	8646955121112111111	2	1234	37f8ebaef7f5f4c5b3cc4715fec7a5f0	{"first_name":"Sooraj","last_name":"Sabu","email":"arshadtest12111111@mailinator.com","dial_code":"91","phone":"8646955121112111111","gender":"male","date_of_birth":"1993-04-06","password":"Hello@1985","confirm_password":"Hello@1985","location_name":"462Q+26 Dubai - United Arab Emirates","location":"25.1000998,55.2380812","is_social":"0","device_type":"android","fcm_token":"aasfdf","device_cart_id":"252"}	2024-10-09 09:38:47	2024-10-09 09:38:47
282	 	gh@gh.com	971	485464948	3	3308	a7a4e9d3389e842900a36faa075855f4	{"account_type":"individual","confirm_password":"Hello@1985","device_cart_id":"6EA6D416-DA42-428C-825E-3AEF16F25740","device_type":"iOS","dial_code":"971","email":"gh@gh.com","family_name":"navis","fcm_token":"cydiT-P4BkIOq8gn98xgtX:APA91bGcdc4sO6RqazXZsW5DOMesDC2I6A2QWQM1-cqLKkoxFsWjHH6b-8K3ZmkXh7lOKUPKm2IzUNH1prk8kf6n4wZoH0XG-XdH06OBwHEdbII4ghI07Pw","gender":"female","hear_about_us":"1","language":"en","name":"anil","nationality":"1","password":"Hello@1985","phone":"485464948","username":"h@h.ckm"}	2024-11-01 12:42:19	2024-11-01 12:42:19
283	 	razahamid0011@gmail.com	92	3441562334	3	3544	45a018c11c1c00132d04e0df1c46b03e	{"name":"Hamid Raza","email":"razahamid0011@gmail.com","dial_code":"92","phone":"3441562334","password":"As@1As@2","confirm_password":"As@1As@2","account_type":"company","location_name":"Unnamed Road, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,","location":"32.22621107208052,74.48132034391165","company_name":"Hamid Company","device_type":"ANDROID","fcm_token":"e1EBZAfZRTyaYAHkhzjdSV:APA91bH5a2pDM71kU9PwyvY7J19IAY08P9XUskufr81EALbG3oFKUhVgjyWjC2YwUOjb4HK__wOXHQeNTWQPmAGQFhzKvQCIpFgkLidjtSdm-hlMXBP1XV8bNTXh1YBsDPaOf2Jw0Bu_","device_cart_id":"2d92159a1fa92303","is_represent":"0","logo":"672507a60b922_1730480038.jpg","trade_license":"672507a626bb9_1730480038.PDF"}	2024-11-01 20:54:00	2024-11-01 20:54:00
284	 	razahamd34@gmail.com	92	3441562334	3	3202	94e6c462df3e06eb17d76de37215fe49	{"name":"Hamid Raza","email":"razahamd34@gmail.com","dial_code":"92","phone":"3441562334","password":"As@1As@2","confirm_password":"As@1As@2","account_type":"company","location_name":"Unnamed Road, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,","location":"32.22621107208052,74.48132034391165","company_name":"Hamid Company","device_type":"ANDROID","fcm_token":"e1EBZAfZRTyaYAHkhzjdSV:APA91bH5a2pDM71kU9PwyvY7J19IAY08P9XUskufr81EALbG3oFKUhVgjyWjC2YwUOjb4HK__wOXHQeNTWQPmAGQFhzKvQCIpFgkLidjtSdm-hlMXBP1XV8bNTXh1YBsDPaOf2Jw0Bu_","device_cart_id":"2d92159a1fa92303","is_represent":"0","logo":"67250839eab1d_1730480185.jpg","trade_license":"6725083a03f41_1730480186.PDF"}	2024-11-01 20:56:29	2024-11-01 20:56:29
289	Sooraj Sabu	sdfsdfsdfsdf@yopmail.com	91	345235345	2	4364	914b54db6cd2b9c7585a9497c9fdb841	{"first_name":"Sooraj","last_name":"Sabu","email":"sdfsdfsdfsdf@yopmail.com","dial_code":"91","phone":"345235345","gender":"male","date_of_birth":"1993-04-06","password":"Hello@1985","confirm_password":"Hello@1985","location_name":"462Q+26 Dubai - United Arab Emirates","location":"25.1000998,55.2380812","is_social":"0","device_type":"android","fcm_token":"aasfdf","device_cart_id":"252"}	2024-11-04 08:39:54	2024-11-04 08:39:54
291	 	test201@gmail.com	92	3325408407	3	\N	63a20d5d1e720f87fe7290a809af2b49	{"account_type":"individual","confirm_password":"Zain@777","device_cart_id":"81D81716-1BB7-486B-8875-57E17BD63AF2","device_type":"iOS","dial_code":"92","email":"test201@gmail.com","family_name":"zain","fcm_token":"eFvFDQhYIkhQnw95DCX9VS:APA91bFOJydas-i2efrAfDBwWS4AweEYzanRT0RVBWc_vn_8ZnS_HuN4XDX0uD9-aS4GKYrIstELTwSBBjz2xZKhu5V1dHPaR10KhhgK_vswIB1leKoQBOI","gender":"male","hear_about_us":"1","language":"en","name":"zain","nationality":"1","password":"Zain@777","phone":"3325408407","username":"test101@gmail.com"}	2024-11-04 11:15:47	2024-11-04 11:15:47
292	Sooraj Sabu	customertest1@mailinator.com	91	304272213361	2	\N	6aafa035812b0138735fe25b0c3b45ca	{"first_name":"Sooraj","last_name":"Sabu","email":"customertest1@mailinator.com","dial_code":"91","phone":"304272213361","gender":"male","date_of_birth":"1993-04-06","password":"Hello@1985","confirm_password":"Hello@1985","location_name":"462Q+26 Dubai - United Arab Emirates","location":"25.1000998,55.2380812","is_social":"0","device_type":"android","fcm_token":"aasfdf","device_cart_id":"252"}	2024-11-04 11:43:07	2024-11-04 11:43:07
320	Sooraj Sabu	ss@xx.com	91	9847823799	2	1234	548a62548686e7ee23c88d3048a791ab	{"first_name":"Sooraj","last_name":"Sabu","email":"ss@xx.com","dial_code":"91","phone":"9847823799","gender":"male","date_of_birth":"2024-11-04","password":"Hello@1985","confirm_password":"Hello@1985","location_name":"VM42+V4, Panakyachal, Kerala 685583, India,","location":"9.856546977310058,76.6510896384716","is_social":"0","device_type":"ANDROID","fcm_token":"eSquH0icRZSQ7isYYdxVV1:APA91bEgxYwj9QAjQ9cqW8gNoER7ZtixHufNGXtoyjYfSCTthw4hka98MLhZ7IAZkyFDgJ8am3UTvppuTBUkeYUqq-UF1bBzuYZ3v_seIEr9zoMSNfKJPYs","device_cart_id":"Asd"}	2024-11-07 14:18:36	2024-11-07 14:18:36
321	Sooraj Sabu	sdfsdfsssdfsdf@yopmail.com	91	9847823799	2	1234	2a82c97f5c9532e7a9444fd57b2291a7	{"first_name":"Sooraj","last_name":"Sabu","email":"sdfsdfsssdfsdf@yopmail.com","dial_code":"91","phone":"9847823799","gender":"male","date_of_birth":"1993-04-06","password":"Hello@1985","confirm_password":"Hello@1985","location_name":"462Q+26 Dubai - United Arab Emirates","location":"25.1000998,55.2380812","is_social":"0","device_type":"android","fcm_token":"aasfdf","device_cart_id":"252"}	2024-11-07 14:20:33	2024-11-07 14:20:33
322	 	sscx@cx.com	91	9847823799	3	1234	6a2304e604fbcc34e0f8715049ea5dfd	{"name":"Ss","family_name":"Xx","email":"sscx@cx.com","dial_code":"91","phone":"9847823799","password":"Hello@1985","confirm_password":"Hello@1985","account_type":"individual","hear_about_us":"5","nationality":"98","username":"xx@x.com","gender":"female","device_type":"ANDROID","fcm_token":"e81rgiWgSQa1Mg4qcNoLU3:APA91bGn6Bf5ctD2-bphs50HFdHc3QesztT5b87SNxAdGP8pbwUoXhJtfOMBOEMv8G9bZx8vIRNpEvVDPkq2KoHt55f3fnMGHYTeY0UlkIv3do3xP-XUMOg","device_cart_id":"d40ff12425303f2c"}	2024-11-07 14:25:20	2024-11-07 14:25:20
327	 	zmzmali04@outlook.com	971	507027622	3	1836	420af69e5ca61040316ae921023fb346	{"account_type":"individual","confirm_password":"Zamzam5271$","device_cart_id":"EA4A875E-03AB-47A5-A992-0D869FEB73B0","device_type":"iOS","dial_code":"971","email":"zmzmali04@outlook.com","family_name":"alhmed","fcm_token":"fO1jL5lt0EK5onlZnaM93f:APA91bGPKS1NwsiBnJJIYgQf6oaGsexUGrpN1MVtIFZL1ik4LwUlSjyBPEY4cuDk5c572alac91IjRd-wmTLr_n4DP2Lzpg4CBInvGuegomqEZEo-WbfuII","gender":"female","hear_about_us":"5","language":"en","name":"maryam","nationality":"10","password":"Zamzam5271$","phone":"507027622","username":"zmzmali04@outlook.com"}	2024-11-15 12:12:22	2024-11-15 12:12:22
\.


--
-- Data for Name: today_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.today_rates (id, yatch_id, date, morning_from, morning_to, morning_rate, afternoon_from, afternoon_to, afternoon_rate, evening_from, evening_to, evening_rate, created_at, updated_at) FROM stdin;
1	19	2024-07-18	09:00:00	12:00:00	25	13:00:00	15:00:00	30	16:00:00	21:00:00	80	2024-07-18 10:36:03	2024-07-18 10:37:01
2	19	2024-07-19	09:00:00	12:00:00	25	13:00:00	15:00:00	30	16:00:00	21:00:00	80	2024-07-20 08:33:38	2024-07-20 12:33:38
3	19	2024-07-20	09:00:00	12:00:00	25	13:00:00	15:00:00	30	16:00:00	21:00:00	80	2024-07-20 08:33:59	2024-07-20 17:20:39
4	21	2024-07-20	09:00:00	11:00:00	20	13:00:00	15:00:00	30	16:00:00	18:00:00	50	2024-07-20 17:26:06	2024-07-20 21:26:06
6	18	2024-07-26	02:36:00	02:36:00	90	02:37:00	02:37:00	90	02:37:00	02:37:00	30	2024-07-25 21:37:14	2024-07-26 01:37:14
7	29	2024-08-13	06:00:00	10:00:00	5000	13:00:00	17:00:00	6000	18:00:00	22:00:00	8000	2024-08-13 17:15:24	2024-08-13 21:15:24
8	29	2024-08-14	06:00:00	10:00:00	5000	13:00:00	17:00:00	6000	18:00:00	22:00:00	8000	2024-08-13 21:41:31	2024-08-14 01:41:31
9	30	2024-08-14	11:22:00	11:22:00	2000	\N	\N	0	\N	\N	0	2024-08-14 06:22:49	2024-08-14 10:22:49
10	32	2024-08-15	02:42:00	02:56:00	20	02:42:00	02:48:00	30	02:42:00	02:45:00	40	2024-08-14 21:43:35	2024-08-14 21:58:58
12	35	2024-08-20	09:00:00	12:00:00	200	12:00:00	15:00:00	300	15:00:00	22:00:00	400	2024-08-20 02:58:36	2024-08-20 06:58:36
13	38	2024-08-20	08:00:00	12:00:00	258	12:00:00	15:00:00	850	15:00:00	21:00:00	950	2024-08-20 13:48:31	2024-08-20 13:48:31
14	48	2024-08-24	09:31:00	08:30:00	33	07:30:00	07:20:00	2	08:30:00	09:32:00	5	2024-08-24 08:32:56	2024-08-24 12:32:56
15	59	2024-09-03	18:21:00	18:21:00	100	18:21:00	22:21:00	200	23:22:00	23:42:00	300	2024-09-03 13:21:50	2024-09-03 17:21:50
16	62	2024-09-19	17:01:00	23:01:00	500	\N	\N	0	\N	\N	0	2024-09-19 13:01:22	2024-09-19 17:01:22
17	64	2024-09-19	17:03:00	23:03:00	100	\N	\N	0	\N	\N	0	2024-09-19 13:03:43	2024-09-19 17:03:43
19	64	2024-09-24	13:20:00	14:06:00	10	14:11:00	15:10:00	15	15:13:00	17:13:00	25	2024-09-24 08:21:00	2024-09-24 10:13:52
22	47	2024-10-08	21:27:00	23:27:00	200	\N	\N	0	\N	\N	0	2024-10-08 16:27:28	2024-10-08 20:27:28
23	71	2024-10-08	22:13:00	23:13:00	100	\N	\N	0	\N	\N	0	2024-10-08 17:13:57	2024-10-08 21:13:57
24	47	2024-10-21	01:19:00	06:31:00	100	08:21:00	11:21:00	200	15:21:00	20:21:00	300	2024-10-21 15:21:57	2024-10-21 15:31:34
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, dial_code, phone, phone_verified, password, email_verified_at, role, verified, user_type_id, first_name, last_name, user_image, user_phone_otp, remember_token, created_at, updated_at, active, device_type, fcm_token, device_cart_id, password_reset_code, wallet_amount, firebase_user_key, user_device_token, temp_dial_code, temp_phone, emirates_id, is_social) FROM stdin;
217	bhs	jk@jk.com	971	456468464	1	$2y$12$gqy.aXGjQhbkIVr1in5Woe3rKzP4.DZpI6iJAdg/UMyZkmTVf6EpK	\N	\N	1	3			\N	\N	\N	2024-11-04 13:15:24	2024-11-08 09:07:13	1	iOS	cydiT-P4BkIOq8gn98xgtX:APA91bGcdc4sO6RqazXZsW5DOMesDC2I6A2QWQM1-cqLKkoxFsWjHH6b-8K3ZmkXh7lOKUPKm2IzUNH1prk8kf6n4wZoH0XG-XdH06OBwHEdbII4ghI07Pw	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	\N	\N	\N	\N	\N	0
244	Fatima Jassim	wfwdykpffd@privaterelay.appleid.com	971	502422421	1	$2y$12$VfJTttGzpHAH8nBZ90rd7.KT9k0EskiCh47NOe3IEY4fP5KpzzAlO	\N	\N	1	2	Fatima	Jassim	\N	\N	\N	2024-11-12 10:44:35	2024-11-12 10:44:45	1	iOS	\N	B9B8CAC9-C27D-465C-B472-E72D1CF53043	\N	0	-OBU6WLcqzhpIt5kIY3-	carHcK2JtEc3ucKWMpjYgL:APA91bHYHBGOVQqRbuQVpGiiOhEjeFA-kCIM5BkwmDA3AAnVZqwW11oNVdZmEB8NfKMi0LCkPvzPS0XWGJtBdpc3F2rstaBwW13K9VwJSEmCYsgcqJobwIA	\N	\N	\N	1
100	shukoor	ann@ann.com	971	546646484	1	$2y$12$N8XBDbZV/vVDxF4KlIFwxeMA5xmXOI2ZYqRZ3h79/WCSj93wveKuG	\N	\N	1	3			\N	\N	\N	2024-08-24 12:58:34	2024-11-08 09:07:13	1	iOS	dVY3Byg6QEM8i3Nve9-q7Y:APA91bF0hJBBLhSw0UrlvkdeJ3NM5jJTvQgJe2lP3j3wLVqvBGssoUlmbHkBERGuT1GNfHhPa6ESSX5tiCL-lKs5qR6vAOHP7TW3isW_zMC4zir08p3H6Dg-BMxIt7ZpbQj027z8sS0B	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	\N	\N	\N	\N	\N	0
222	ftf	hbn@hbn.com	971	55587560	1	$2y$12$A3tcqnFInQEUjUJ3ZaTeBu4iEDOjNyyw0E1qGFZWbgSjzPPnNv6Nm	\N	\N	1	3			\N	\N	\N	2024-11-04 21:39:01	2024-11-08 09:07:13	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	\N	\N	\N	\N	\N	0
224	anil	helo@helo.com	971	45348464	1	$2y$12$B5HOY5MdEAl4wKJXE2Sz8uWG.dVYpyRHwS5PbOkAqdMcu8WY/SoTG	\N	\N	1	3			\N	\N	\N	2024-11-04 23:52:53	2024-11-08 09:07:13	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	\N	\N	\N	\N	\N	0
214	Tester Raga	radhadxbapps@hotmail.com	971	586400540	1	$2y$12$K/QJ79cfvpEAuKIGkDejo.OWSNY1Rp6BB2qZYO7qSQjiamyt7gw/m	\N	\N	1	2	Tester	Raga	\N	\N	\N	2024-11-02 22:10:30	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	0	-OAi3a3AU0fB7dkpJSD9	\N	\N	\N	\N	0
137	Jinu Mathew	jinu@jinu.com	971	95112233	1	$2y$12$gICCbgNVs7HOKSMwvrHWD.gjb4x4f8/oKb/SLhSB1k6odsbHl2mfe	\N	\N	1	2	Jinu	Mathew	\N	\N	\N	2024-09-13 16:18:10	2024-09-13 16:18:13	1	ANDROID	\N	Asd	\N	0	-O6fJRxlDPSvW8m73uH1	fgUY4k0fTP6HIf0RRrLrjL:APA91bHim1U8px0xTS9sXrlReQDiaaiVQ7rYXoMLX79KE1ZEAiihuBaiMiu4xtnlwCpFed04uCJKgdam0-r454nf2dpiAKP6YJl_yA0P3UwV31R6qvarpUYMXk_d5Q57a-TtdyFMLVy_	\N	\N	\N	0
157	Devika Beljwar 2	beljwar2@yopmail.com	971	505555858	1	$2y$12$p9h7.wnuNG3CYJIEPqnHGeoiCrb3d60wvr.FObO4rZPy.4sx6MoxK	\N	\N	1	2	Devika	Beljwar 2	\N	\N	\N	2024-10-01 12:53:52	2024-10-01 15:19:07	1	iOS	\N	A913C498-535B-4C7E-B63A-1396DD50EB55	\N	0	-O86HIqhC7HySbJAgh8e	cFW4WDEaq0e6qhR8JmmEXJ:APA91bHALIRX_y3RXp4OX5GAnZq2YSYcrtIlZc_-UA0Ik7-bD29IRfYr_B1JhJyjycGhwhKYuP8hdZ-hIYD7fYE5VCaEskfGbbfHPuSUYBllYxIUJEFEEUJy54bgZns8a_TQxwH_QKfp	\N	\N	\N	0
209	Fatima Alhammadi	fjassim1997@icloud.com	971	523176356	1	$2y$12$08stskeIvqcibqAzoJxX1.uZ2cTogTbqKxAIVviqGVN16vwUcQCq.	\N	\N	1	2	Fatima	Alhammadi	\N	\N	\N	2024-10-29 09:07:43	2024-11-08 09:07:13	1	iOS	\N	B9B8CAC9-C27D-465C-B472-E72D1CF53043	\N	0	-OALf3q5m8KaYxEb180m	\N	\N	\N	\N	1
239	Aj.individual	ajeshkumarcd@gmail.com	971	55688775	1	$2y$12$/X84C1lu07W9L71tSGNprekjmNKqtyJc2CcSHv0X1liY66XiVTqHO	\N	\N	1	3			\N	\N	\N	2024-11-06 15:50:55	2024-11-08 09:07:13	1	iOS	fQZ8YAi7dk4qi_vaC-asif:APA91bGjJSfZekrMl3TZPZQD4i1VbBO4pHR1Z0KAu_pksNAr6MJpYLFaKIJUi3Z7aNejq8XJGTY8-3QeXvv2Zwiy_kfgD2u6Kp8lSxROZmraO-c34OuZPRA	846D4AB8-EA4A-4186-A3E5-B879F4ECF224	\N	0	\N	\N	\N	\N	\N	0
225	Sooraj	vv1@vv.com	971	505086485	1	$2y$12$fhgxh0t6qrkdI48s9sgRJeZiUNhwMr4t0JcsbppcZif1vedmc4gYi	\N	\N	1	3			\N	\N	\N	2024-11-05 09:20:20	2024-11-08 09:07:13	1	ANDROID	\N	d40ff12425303f2c	\N	0	-OAulGchQWcYOtkD9uih	\N	\N	\N	\N	0
19	Wahab Khurram	abc@gmail.com	92	343434343	1	$2y$12$ieBKoK0mT59eX/W4R/yqLuVUgtIEg6P82t/WpXZPvuiFgPrWaXCGi	\N	\N	1	2	Wahab	Khurram	\N	\N	\N	2024-05-14 15:40:25	2024-11-08 09:07:13	1	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0
80	Hamid	razahamid004@gmail.com	92	3441562590	1	$2y$12$Mk/3an0ssp.lzKxlvtCZDe7jKkScFUvhPcN900cvCaO4/qI7Yr51i	\N	\N	1	3			\N	\N	\N	2024-08-19 10:04:53	2024-11-08 09:07:13	1	ANDROID	abcd	599d57ab8f6dbde0	\N	0	\N	\N	\N	\N	\N	0
191	test t	test@t.com	971	123456786558	1	$2y$12$CYAJtvSvJVIAD9FOHX/BvucASo9mIrXtV6a3zHvXJrX/W3EmSLizO	\N	\N	1	2	test	t	\N	\N	\N	2024-10-09 19:49:01	2024-10-09 19:49:08	1	iOS	\N	79F5B631-92F8-4485-9EDC-2092FE5C5248	\N	0	-O8ly3AOTR9OCYsHvSTi	abdhjef ekef kjwf wedfw	\N	\N	\N	0
66	Usama Shakeel	ushakeel@gmail.com	92	3315002750	1	$2y$12$88h4qpdFhjI99jMgnTX3ZOPSX6DBd/KhAmGdRSX4PSR5e4CYvl5Ri	\N	\N	1	2	Usama	Shakeel	\N	\N	\N	2024-08-09 10:38:33	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	0	\N	\N	\N	\N	\N	0
30	Asad Z	asdf@gmail.com	92	5412235	1	$2y$12$2m9aok7Wjp55dYlciZZ.NulcsRUazkE/5FPXVpsMaGTt9Tsx6QDXe	\N	\N	1	2	Asad	Z	\N	\N	\N	2024-05-27 10:52:13	2024-11-08 09:07:13	1	android	\N	252	\N	0	-O4jmFDLjnIH6qTSIryf	\N	\N	\N	\N	0
190	Sooraj Sabu	test11111@mailinator.com	91	15121112111111	1	$2y$12$7OoczLFeLD.Av8gdhxsHv.nWc6z3DNdujk9Cta2y7ud1Tgc8xZOm.	\N	\N	1	2	Sooraj	Sabu	\N	\N	\N	2024-10-09 10:01:03	2024-11-08 09:07:13	1	android	\N	252	\N	0	-O8jrTcNO__tE-idgYWL	\N	\N	\N	\N	0
180	Sooraj Sabu	arshadtest12111@mailinator.com	91	8646955121112111	1	$2y$12$hTs1PJP0SIMqPxCVTeCewO5PVWt58MA6KQgRs9JpKw0LCkqpHxHRG	\N	\N	1	2	Sooraj	Sabu	\N	\N	\N	2024-10-09 09:34:38	2024-11-08 09:07:13	1	android	\N	252	\N	0	-O8jlQAFADxTZ1lXmBPO	\N	\N	\N	\N	0
186	Sooraj Sabu	test1@mailinator.com	91	1512111211	1	$2y$12$RNRCNftY2CvDtBuyUs3fC.wvJXfD62ZL5oPeS.JyRRdlCmpyAKbUS	\N	\N	1	2	Sooraj	Sabu	\N	\N	\N	2024-10-09 09:53:12	2024-11-08 09:07:13	1	android	\N	252	\N	0	-O8jpgKgZCHKd4V-T2DF	\N	\N	\N	\N	0
39	Asad Z	asadz1453@gmail.com	92	5412364	1	$2y$12$JMsSsvbO2Qe4ErGJFiW2H.y1oe2ZQWaaTOhKkyyuX//ol1ZeGd8C.	\N	\N	1	2	Asad	Z	\N	\N	\N	2024-05-29 14:12:23	2024-11-08 09:07:13	1	android	\N	252	\N	0	\N	\N	\N	\N	\N	0
58	Hamid Raza	razahamid35@gmail.com	92	3441568572	1	$2y$12$z568ru7eCqOfL7T8fcu8SeEWLdOhG788cJWphTnVSm.lCz3BtM5/6	\N	\N	1	2	Hamid	Raza	\N	\N	\N	2024-07-26 11:29:22	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	0	\N	\N	\N	\N	\N	0
117	abc	test21@gmail.com	93	84545454	1	$2y$12$YQ3gDuzNpR4ZjH7HGe8wQu1sNOMtnJt.Dw5Ra4V/m1MV6G6ru7zJW	\N	\N	1	3			\N	\N	\N	2024-09-03 10:56:15	2024-11-08 09:07:13	1	iOS	\N	2DBAA594-4E15-4641-8594-F2D3DF28A52C	\N	0	\N	\N	\N	\N	\N	0
223	anil	sea@sea.com	971	54645496	1	$2y$12$klvwvRZ53gsVCb1goeAmIOCAnH/1HiL/.QNIggpPTFdeSuOkxsNQO	\N	\N	1	3			\N	\N	\N	2024-11-04 21:51:01	2024-11-08 09:07:13	1	iOS	dUh-TGvtKE7NsLNfm1dihF:APA91bHFg-RcgvGK0TAqDeZa8lhM_GPvhcgLSpw_D3c1cL0sowD-zRJZTuj-rS45ws10p_-dY-SBORPNgv4Aw6TGKAqIDvWYromySJG99p3TXksNhwTu2uo	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	\N	\N	\N	\N	\N	0
240	Kdkske	hhhh@mailinator.com	92	3242520413	1	$2y$12$CJnpFhmpTZ6trAgCZPLR6Op3OWHegA2Fi9tOZk.2T5MsvnT3UDxjy	\N	\N	1	3			\N	\N	\N	2024-11-07 10:36:16	2024-11-08 09:07:13	1	ANDROID	ckzXVpogTUGtWVLF1NDx3p:APA91bEwNMpyq9eIfwefs3Ulj7GrUBTFG6vZKt0RrrScMhG4Poy4hoyATsrzfvJ7EQ2G5DdwwFkTx0-wpjCpN6d5X0FBmxonAG8XTN2XyaadFmc10h3Voa0zbZaEVTJlflxDGNFI0z14	f5a21df4d9d8522e	\N	0	\N	\N	\N	\N	\N	0
216	sooraj	partnertest21111@mailinator.com	91	305272133612111	1	$2y$12$V9uLY9VcQyoII6zGDvHoPevWeJ7OMgLjnf1UPDQzTEpS8xQCvhlCi	\N	\N	1	3			\N	\N	\N	2024-11-04 11:48:49	2024-11-08 09:07:13	1	android	\N	252	\N	0	\N	\N	\N	\N	\N	0
207	Arabin	a2solutions.kochin@gmail.com	971	5232431632	1	$2y$12$1rk2h1orTIw/g/EnqckY4OhWBUnPpOovD6frUmalgImqK2VP0qQrK	\N	\N	1	3			\N	\N	\N	2024-10-24 12:12:12	2024-11-08 09:07:13	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	-OB4HQXAcWOgJHDn0IUr	\N	\N	\N	\N	0
206	ajil navis	bc@bc.com	971	256348646	1	$2y$12$I4RLDEuZmqDZ6ynKLFJP4OzKy.tt0iKIrEB7aRXa282hukQDMPCCO	\N	\N	1	2	ajil	navis	\N	\N	\N	2024-10-24 04:41:51	2024-10-24 04:41:58	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	-O9vyGsfo5crZDWwyAoz	cfy1LQA2605Hod6GM1VGPe:APA91bH6M93eURszCAu9J-434ecGNkW7r1GmC0nqoQ3Ts_VI7Bnkczjr_sK12-Hy_p9doN1RYrC1TjzxVVqpao5gK4J6-optLtCybEb8mW91zLVmdbA30BEI27VSDE6u8k_FXNlX3mqA	\N	\N	\N	0
133	Arun Padippurackal	arun.devu.290321@gmail.com	971	522366996	1	$2y$12$ZMoYxzj9xaT2iwY2hsvLMuQhuxBxDBKQX88QAIlalZQlqNc3xtw1i	\N	\N	1	3			\N	\N	\N	2024-09-11 16:44:19	2024-10-01 14:18:50	1	ANDROID	\N	853f83811c6a386b	\N	0	-O6vD3jWQD0DOIcXsasV	fAf_Cb7WSIqBFParEiZTqd:APA91bEKu07X39aSOT26wum_gXEKdC_R7GW9lLDFkqJW6gw2Gb_a9jiHtDClWvv-LPH9xXl5txL-LxQbIAxryZ729StqRMe6AVQBhNJ8MBJLJ_crqgNUERdH9CMb6wtnog05yFamHt4i	\N	\N	\N	0
16	Wahab Khurram	newwahab2khurram@gmail.com	92	365464340	1	$2y$12$4K5Yv1qRO6Lpk/cciZnFT.FcnB/5Nr3ndWIkgl2Z2w698fIzBTUWK	\N	\N	0	2	Wahab	Khurram	\N	1234	\N	2024-05-14 10:25:42	2024-11-08 09:07:13	1	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0
110	bbb	nbs@nbs.com	93	84546464664	1	$2y$12$TtmvKNCDa9Pg4aRWWpk5SOMsB7qGnAnIm.O6b7g7BgKIGyCnYgZP6	\N	\N	1	3			\N	\N	\N	2024-09-02 14:43:35	2024-11-08 09:07:13	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	-O5mKVwOw4NeLwUrx9Xq	\N	\N	\N	\N	0
27	Asad Z	asadz145@gmail.com	92	5412365	1	$2y$12$zqV6Zc1n9adpyQgnZO9oFOavW8paPxlW7zMch5Tq1H2cUWy8M9e3u	\N	\N	1	2	Asad	Z	\N	1234	\N	2024-05-17 10:12:42	2024-11-08 09:07:13	1	ANDROID	\N	507c25ffbc01d8ae	e26302abcfeda8f7280699cda24c4fb4	0	\N	\N	\N	\N	\N	0
11	Wahab	wahabfun124134@gmail.com	92	6548745	1	$2y$12$LDDsHfEDY/GzDSImvT5qVuW.PasDEoXZKaNILCYXGfmG3gDSEyEUG	\N	\N	1	3	\N	\N	\N	\N	\N	2024-05-12 12:38:15	2024-11-08 09:07:13	1	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0
54	Hamid	razahamid45@gmail.com	92	3441562550	1	$2y$12$xYdREkmmGFRLRMDNlvbt.uCuyeho3MM/KU1fIouLcSOTvqQIdYTpu	\N	\N	1	3	\N	\N	\N	\N	\N	2024-07-22 10:04:32	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	0	\N	\N	\N	\N	\N	0
188	Sooraj Sabu	test111@mailinator.com	91	151211121111	1	$2y$12$2SI3zLrVh3vQ72rxr8izzuTC6qOI9m0YZ1k4sOgtqewxXvtap4Iju	\N	\N	1	2	Sooraj	Sabu	\N	\N	\N	2024-10-09 09:57:38	2024-11-08 09:07:13	1	android	\N	252	\N	0	-O8jqgFcrlEzu0w1Ur_F	\N	\N	\N	\N	0
221	Test Tes	ss@twt.com	971	505042124	1	$2y$12$I4SdOJWkz7Piz3yZpJPXreJ0/bu3uDI/.Y0TrnvdSXtnRXqTp870a	\N	\N	1	2	Test	Tes	\N	\N	\N	2024-11-04 15:42:12	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	895	-OAqyuuaojKXYHnzCVfL	\N	\N	\N	\N	0
220	test	pdf@gmail.com	971	151616161616	1	$2y$12$KCcVOT2H4Ih0S4Isqsz7a..37zUWrz.55Y7g/mecW6oJrUhabqJsK	\N	\N	1	3			\N	\N	\N	2024-11-04 15:40:46	2024-11-08 09:07:13	1	iOS	\N	81D81716-1BB7-486B-8875-57E17BD63AF2	\N	0	-OAsVyRwhRx2U4Ocx3RM	\N	\N	\N	\N	0
192	test	test@test.com	971	123457678754	1	$2y$12$XJ/lhG3eetecWL2ZvDISp.rMXZaDSMdq0TzDrI18P8iDIgbCxl5RG	\N	\N	1	3			\N	\N	\N	2024-10-09 19:52:22	2024-11-08 09:07:13	1	iOS	fJ1KxGPWJEVVnJqVfj760N:APA91bGPW6jGKbE_GqU7kgpkxIpCDySktJE7TKQUWbht0W0f8fZkV7eqjvsqGM8ok3IpskeBNXOxII4NOi2l18NmMsfBfBOQJvnxwHgr6aANfS_3szZHA7zaqnNkCVaMncOlOAfadSQ8	79F5B631-92F8-4485-9EDC-2092FE5C5248	\N	0	\N	\N	\N	\N	\N	0
40	Suleman Ali	suleman.ali303303@gmail.com	+92	302765587622133	1	$2y$12$nWt1ij2gWMrV77T39frHcOloQPatIJ6xVRY2IPX3pGqyQ3//mxg5m	\N	\N	1	2	Suleman	Ali	\N	\N	\N	2024-05-29 15:43:11	2024-11-08 09:07:13	1	android	\N	252	\N	0	\N	\N	\N	\N	\N	0
158	Devika Beljwar	beljwar4@yopmail.com	971	5555555553	1	$2y$12$3rvq4u.WLK57EVYA/XbAZuIBKpbu9m7vkw.2lE.s6h5zcTs3U10zu	\N	\N	1	3			\N	\N	\N	2024-10-01 12:59:21	2024-11-08 09:07:13	1	iOS	\N	A913C498-535B-4C7E-B63A-1396DD50EB55	\N	0	\N	\N	\N	\N	\N	0
201	sooraj	partnertest2111@mailinator.com	91	30527213361211	1	$2y$12$EU5W12SEnfaN8ifT6y.pbuJzjqII1dMteN/XO2SV16GkjM14nNT2S	\N	\N	1	3			\N	\N	\N	2024-10-14 08:54:41	2024-11-08 09:07:13	1	android	\N	252	\N	0	\N	\N	\N	\N	\N	0
20	Wahab Khurram	abc@gmail.cos	92	343434342	1	$2y$12$nZZ91T7myUbdhRHARhSQpO6J7liNpG21nCQJ78YV8KZK9ylbG2nKm	\N	\N	1	2	Wahab	Khurram	\N	\N	\N	2024-05-14 17:14:46	2024-11-08 09:07:13	1	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0
125	First LAT	razahamid102@gmail.com	92	3441562582	1	$2y$12$hPXeAAuesRihmXm2Abjws.UO.k2Y2fvuuBOu.yqoWchuBtbaP5Ocm	\N	\N	1	2	First	LAT	\N	\N	\N	2024-09-10 15:07:15	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	-4341.75	-O6QbRlpS6mkSGTrMCbm	\N	\N	\N	\N	0
92	Ajesh kumar	ajeshcd@gmail.com	971	505041860	1	$2y$12$UTnhl0mjci6v3LzGdMecPObpaDW4Ozc9lzrYS303WxQA4a.DczSfu	\N	\N	1	2	Ajesh	kumar	\N	\N	\N	2024-08-21 11:31:11	2024-08-21 12:13:52	1	iOS	\N	F8FB81C1-7EA8-421C-A9A3-12DD329592B3	\N	-16201.5	-O4nqBPemfa9pKt5VNHp	cQatBc8cs0E7pW4ru-AzG8:APA91bEPll9giF8WnUUCBm5bChu3GfXKliSni7ZUgbAuKUqjkc7iI-sv47TvcaZLMw1UgtUuITQpTJ7rlll55BDX9sAZbJRTzIAAsnJuxIFc9LgUXAP8uSdHsr27AEz6BTQxad7ioBdm	\N	\N	\N	0
6	Anil Navis	anil@anil.com	256	134523525	1	$2y$12$ZmbHfgmtFe8uMDnz9czK8u4jnlVBBlTFUte0OR4pO3mm.Adni84Jy	\N	\N	1	2	Anil	Navis	\N	\N	\N	2024-04-20 16:21:34	2024-11-08 09:07:13	1	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0
47	test	test2@gmail.com	358	8454545454	1	$2y$12$9YCAQp/VhjZ9aQiPZfM5huRnMXCjGlR9OckXVxTW.Shmt5U3jUbA2	\N	\N	1	3	\N	\N	\N	1234	\N	2024-06-04 00:55:04	2024-11-08 09:07:13	1	iOS	\N	13822C6B-D116-4BEA-8B25-6D127B86654A	5b331821b2b50dc9ec16fb80eb7baf5a	0	\N	\N	\N	\N	\N	0
23	asad asad	asadf@gmail.com	+92	344556622	1	$2y$12$tUSEd9CEvbzK6Nc9dhuWsuhrFS5pF/IDwoW9kU7fIFlt4g8wmsBv.	\N	\N	1	2	asad	asad	\N	\N	\N	2024-05-14 23:44:05	2024-11-08 09:07:13	1	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0
76	Anil	navisanil1@gmail.com	971	5660986095	1	$2y$12$GkI6/Y5f3CxnsFQ/yk.yl.2wzMk4of7iuMdxTi5WgeNTu.K7SPZSq	\N	\N	1	3			\N		\N	2024-08-15 15:01:20	2024-11-08 09:07:13	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	-O4TqU9iwLwn6S4CJGtV	\N			\N	0
215	Sooraj Sabu	customertest2@mailinator.com	91	3042722133612	1	$2y$12$4wwREn4Ejm6MB/ckj9hsk.YIkVjoymXthMkRSBthsnA0NaNKv/z46	\N	\N	1	2	Sooraj	Sabu	\N	\N	\N	2024-11-04 11:48:02	2024-11-08 09:07:13	1	android	\N	252	\N	0	-OAq8IxaSqw-7KYA3Rik	\N	\N	\N	\N	0
126	test test	testnew1@gmail.com	971	845188844	1	$2y$12$ri2ELuOpak4QBWz9EM84FeqojYThnTZrYidH0rZlT2TfkpSvz.6aW	\N	\N	1	2	test	test	\N	\N	\N	2024-09-10 20:34:11	2024-09-10 20:03:02	1	iOS	\N	FE49AB71-D7FE-444D-89C3-96EF066162B1	\N	-7113.75	-O6RmGw35ZATOqHWdiXy	eTSoEXb7ZUExskl9u3IKMY:APA91bFaK_WPcYQrzw6c7io5sY5wkM-4yOTdwVkngjTYANK5-5S8M-l9YRpUZjuuBFoV_XFTy_ZQ6zAdKIAdgrmh1cwZpxHKrtISHYIo8iwc1RNgD5q3PqWLwUWVKAzZfok7bSkL9Qa-	\N	\N	\N	0
243	anil navis	navisanil@gmail.com	971	523243163	1	$2y$12$ZD44dzEyytX.7bl3ZBoWaulHjTpJG2NyiqmpEyCSayKWEF42u/Vbe	\N	\N	1	2	anil	navis	\N		\N	2024-11-07 17:48:39	2024-11-08 09:31:59	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	bc3e7fe2b4815da45eb244ed661e76f9	0	-OB5sbwuIXxG-jOZz4rl	\N			\N	1
75	Usama	ushakeel012342340@gmail.com	971	338646064	1	$2y$12$3Z4JZ6/4UUcq9P4n8IZSZ.zmVZeQFDlqAan/goJyDYCOoCgLecMSi	\N	\N	1	3			\N	\N	\N	2024-08-14 15:05:36	2024-08-21 14:04:52	1	ANDROID	\N	59c571258dfb76f9	\N	-63651	-O4RruMjfrala8Rxbt3x	f0PUZFJiQgm57f4XM-Znug:APA91bG9cda0NFm2gLUzF_KRp2DXpy7UQphIX2ACdZicMLgyAb6Rw6tegm2ItKjZgGrHCtu_GWv2GnWTguYrpK_GvNLDbahYQhDj4ZRwkxY3WN08t11FqgtOAHpj1SaAj31U_YOuDvW2	\N	\N	\N	0
72	newyser njko@gmail.com	testyu@gmail.com	+971	649196164	1	$2y$12$O8Aracv0efjU1acfKhY9o.AmW9UuPEJQCS9mb4o0bfrG5wrJsY/7C	\N	\N	1	2	newyser	njko@gmail.com	\N	\N	\N	2024-08-12 23:52:28	2024-11-08 09:07:13	1	iOS	\N	CF7E22F7-2383-4D17-BEFB-43BA40F8C46F	\N	0	\N	\N	\N	\N	\N	0
88	Usama Shakee	usama2@gmail.com	91	86469553	1	$2y$12$iZJxYDysrazsjN63Jlzs8u6L379ZBDTS45nX3Ctvko9uYuFrWz/KO	\N	\N	1	2	Usama	Shakee	\N	\N	\N	2024-08-20 16:50:14	2024-11-08 09:07:13	1	android	\N	252	\N	0	-O4jpcAQT7UNyRja9DIT	\N	\N	\N	\N	0
113	Anil	jj@jj.com	358	546646486	1	$2y$12$TfFaV8FE4TSMYMsMMOoWs.Ydl/1Nr4FkBDfFLPp9Il0plt/G3TwLG	\N	\N	1	3			\N	\N	\N	2024-09-02 19:51:31	2024-11-08 09:07:13	1	iOS	fe2I_2xsPEzup_5jFFkgQj:APA91bF3LShI3PAITOshBZkUZnq8QRQGyaITOMs1Xn_r-Gn9Jtii5q5K_7Pyf7AVzayMMVj558k9e4YxJMl9BvKclEE9C0ko7nolkNdCSWG5JdvQ3_XeTJYsivZl5gUKGH7hiHzRTyux	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	\N	\N	\N	\N	\N	0
106	vhb	bn@bn.com	358	5156464846	1	$2y$12$W3y1dcndUeC7uafHIy2WCuAbWUrfYYBnAxAn9q1HrOFqmc1mc10hS	\N	\N	1	3			\N	\N	\N	2024-08-28 13:57:10	2024-11-08 09:07:13	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	\N	\N	\N	\N	\N	0
37	Asad Z	asadz149@gmail.com	92	541236500	1	$2y$12$usMGADKptVve0Ljm/Xhim.wIeryZovNQfVpoIUwW0DW7LxpR2MMYC	\N	\N	1	2	Asad	Z	\N	\N	\N	2024-05-28 12:02:43	2024-11-08 09:07:13	1	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0
187	Sooraj Sabu	test11@mailinator.com	91	15121112111	1	$2y$12$nOp5gEqc7TnsmQJZ4NBjGOS7YTqVdK6SnuufFcP5zkDPDPbpdq.SW	\N	\N	1	2	Sooraj	Sabu	\N	\N	\N	2024-10-09 09:55:37	2024-11-08 09:07:13	1	android	\N	252	\N	0	-O8jqE1gS__mj6Rpdt7R	\N	\N	\N	\N	0
146	Rashiya	shafi1@shafi1.com	971	552255550	1	$2y$12$xgJWCANlgWpzUstGQZa5aeAMue9BjdTYKS7ctriQiIy9sDYLGa53K	\N	\N	1	3			\N		\N	2024-09-24 10:34:12	2024-11-08 09:07:13	1	ANDROID	\N	e19e10ee2b97a91c	\N	0	\N	\N			\N	0
71	test tuts	tesyu@gmail.com	+971	646161994	1	$2y$12$LVGZEKDI6YTsqm1/7SkDKu/g9tLHgp.1uJ9.BEF/IAldl3hG0Ebxq	\N	\N	1	2	test	tuts	\N	\N	\N	2024-08-12 23:49:23	2024-11-08 09:07:13	1	iOS	\N	CF7E22F7-2383-4D17-BEFB-43BA40F8C46F	\N	0	\N	\N	\N	\N	\N	0
96	Usama Shakeel	ushakeel010@gmail.com	971	33158648	1	$2y$12$ewkixkeF3mS1wgNUdztFkOOEY8zFQS2PxWENx8mXfl90cTHIjeJ7y	\N	\N	1	2	Usama	Shakeel	\N	\N	\N	2024-08-21 15:19:58	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	0	-O4oeYpJVepls-FMt9Ji	\N	\N	\N	\N	1
114	Yu Yy	hr@dxbusinessgroup.com	971	94664649	1	$2y$12$Byhx0FQQrJVikveoIFc/kOJL7kzRRLMElUxNg4HYXegsY4G7mFbe.	\N	\N	1	2	Yu	Yy	\N	\N	\N	2024-09-02 21:32:53	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	0	-O5nmzgL748ioYxbPEU8	\N	\N	\N	\N	1
175	Sooraj Sabu	arshadtest@mailinator.com	91	86469551211	1	$2y$12$Si4qEalsYy0ZVyqXhZXa8OFQWC9WXwA.M1SRRk/w3Ogep3K.zejxS	\N	\N	1	2	Sooraj	Sabu	\N	\N	\N	2024-10-09 08:34:10	2024-11-08 09:07:13	1	android	\N	252	\N	0	-O8jY_ZeiijmGnmWRL1G	\N	\N	\N	\N	0
10	Wahab 2 Khurram	wahabfun222222@gmail.com	213	6541232	1	$2y$12$ud7qNLnfKUA99BYJ80txEOvgQwzofYpVnFVGZ6H9dTxjkkK97TtxC	\N	\N	1	2	Wahab 2	Khurram	\N	\N	\N	2024-05-12 12:30:44	2024-11-08 09:07:13	1	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0
32	Asad Z	test@gmail.com	92	54123656	1	$2y$12$.oAr8zr/r71PbRvZ7h3In.5l3oNG2kQCI6l.esZ4JCxg53iQCfdmK	\N	\N	1	2	Asad	Z	\N	\N	\N	2024-05-27 20:21:09	2024-11-08 09:07:13	1	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0
68	Anil	navis@cnavis.com	971	546468464	1	$2y$12$H6e7rIZh.gKo9LEshc27kuo2CHA3iWz92JDiacxM/VzSmOEOthcoa	\N	\N	1	3	\N	\N	\N	\N	\N	2024-08-10 09:02:30	2024-11-08 09:07:13	1	android	\N	252	\N	0	-O4RuiuF8lf09-7kW6s2	\N	\N	\N	\N	0
143	DEVIKA s	devikadxb8@gmail.com	971	5088558580	1	$2y$12$Z/Chj3h0I.4Z3sBJHZoJueU02M2fMVlpt67m/HUHSdNMWGa9Pdvbq	\N	\N	1	2	DEVIKA	s	\N		\N	2024-09-20 13:21:18	2024-11-08 09:07:13	1	iOS	\N	A913C498-535B-4C7E-B63A-1396DD50EB55	\N	525	-O7Dj4uHcFvI9HpKFbO1	\N			\N	1
4	Wahab	g@dg.com	971	3463463463	1	$2y$12$f8./dw6uYgRQQVr2GEMDf.36bMi9cX/aBxkVlxYJyI9JlgMWf1C1G	\N	\N	1	3	\N	\N	\N	\N	\N	2024-04-05 07:20:18	2024-11-08 09:07:13	1	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0
208	James Cam	riananil2009@gmail.com	971	566466464	1	$2y$12$H8nPVdpFwoGO1IbZ/Z51ROwuNKU1oWloUYxMo2RFBt.96Y0dsxa8.	\N	\N	1	2	James	Cam	\N	\N	\N	2024-10-24 13:08:40	2024-11-08 09:07:13	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	-O9xmH7NfPpGTootKEHN	\N	\N	\N	\N	0
198	te sy ajv	z.falak777@gmail.com	971	545454454544	1	$2y$12$Y7.HD111vm2tQQpUAtCRH.6CkGWc8mvABbIGy/LzZWhqzUN6tckki	\N	\N	1	2	te sy	ajv	\N	\N	\N	2024-10-10 10:24:36	2024-11-08 09:07:13	1	iOS	\N	81D81716-1BB7-486B-8875-57E17BD63AF2	\N	0	-O8p5TS68681arWl5KGa	\N	\N	\N	\N	1
123	Anil	vv1@vv1.com	971	4864648646	1	$2y$12$lhCK784AsrszbwI9XJqTDelYONMt1AjWNY9O32oKjjXCjFKCEE/Pe	\N	\N	1	3			\N	\N	\N	2024-09-03 16:13:54	2024-11-08 09:07:13	1	iOS	dhPiZVymMk_hodChg9gYNx:APA91bEeyTKmSl0XGKXPRWSfHDIoOUcJIVthCJZKFkpz8fPVVEMqkVzKggaVi9k7NPk_E3zaeBb4iKN7bZKbLI0eWNhqDrwpOxQNnekyD5O1oWntxP8QTiAEzHhknK1wk8tHCqHqm1vO	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	\N	\N	\N	\N	\N	0
161	Devikas	beljwar7@yopmail.com	971	502255555	1	$2y$12$Ut.sUKyTd6R85COrJ41IQOJxyCMp.pMXk5BC/nqS2ixP7tkJPdfdK	\N	\N	1	3			\N	\N	\N	2024-10-01 13:05:44	2024-11-08 09:07:13	1	iOS	\N	A913C498-535B-4C7E-B63A-1396DD50EB55	\N	0	\N	\N	\N	\N	\N	0
79	Abdl	newwahab22khurram@gmail.com	92	8745412	1	$2y$12$4MgAL0Tc//5Yt8uxs1WZB.v5vm3v8V7811WhoIBP48he0ITxQHwSm	\N	\N	1	3			\N	\N	\N	2024-08-19 08:38:09	2024-11-08 09:07:13	1	android	\N	252	\N	0	\N	\N	\N	\N	\N	0
83	Usama Shakeel	ushakeel10@gmail.com	971	33158864	1	$2y$12$XkCVdd8XFXWfFfoai3O.Z.Kj9Iwd5TXIe7L3z.bGLH5lkJYkvS336	\N	\N	1	2	Usama	Shakeel	\N	\N	\N	2024-08-19 16:29:57	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	-48833.925	-O4ebOky707jRB3DIfwt	\N	\N	\N	\N	0
103	basil ta	basil@basil.com	971	8454634846	1	$2y$12$arlj4TJucmgiCgZPRt.1fuSnGoNJrILOhlMu3SmUHSItAbFP.gcc2	\N	\N	1	2	basil	ta	\N	\N	\N	2024-08-26 21:57:27	2024-08-26 21:57:29	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	-O5EpUP32JqClZgdu0eD	ccsDaZ_zTUTCoutlNiEYkV:APA91bHLn3b1d4AT_Jg1z1t10oTlY4cvpZJtT5SxjKzfXJ1rFB98Pres5UYg6rwp5lgzaS_ZbEeOl0gSmqBv26ot9RHFGsIuxRleIqU6FDBWDJUshMwECd8fMymhtOWwuY37RRgAU9zz	\N	\N	\N	0
122	test nas	testnew@gmail.com	971	545156446	1	$2y$12$hGzXHJPzMSuYRI587NTFE.atoj6t5sl4aviizFcUaccES5Epst4SC	\N	\N	1	2	test	nas	\N	\N	\N	2024-09-03 15:57:15	2024-09-03 11:58:39	1	iOS	\N	CF7E22F7-2383-4D17-BEFB-43BA40F8C46F	\N	-1596	-O5rjkrGqyzfFnWT5APv	dYnvpt0Do0nnkvZrcksuk8:APA91bG1XMZIoQJhRc5a0Aje_7olrBzvw8jnNfBRNpE0LMyelBJtLbUZfOGXtaU7YgfHraTYZDU4Tif08RuFhsvIGEISs0LWoG6BIY9bTevjvrKUiRJadi5My4qqyw0mC0Pnt-1piKE2	\N	\N	\N	0
5	Wahab khurram	wahabfun22@gmail.com	93	3654874142	1	$2y$12$yq6fmNoRibAfEmNgvMvW7e2T7VgDR/WazLXNaUKgjKSrSceUkEhgu	\N	\N	1	2	Wahab	khurram	\N	\N	\N	2024-04-18 02:32:54	2024-11-08 09:07:13	1	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0
237	Test Ndnd	arshad888hash@gmail.com	92	3042721336	1	$2y$12$ypUzaKEo9.0wh82.Ev6ITOoKby2qSYmcGRisMGyV7zyM2EGDZhune	\N	\N	1	2	Test	Ndnd	\N	\N	\N	2024-11-06 12:58:12	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	0	-OB-gYV_K1Jt-tl846aj	\N	\N	\N	\N	1
199	Hamid Raza	razahamid34@gmail.com	92	3441562555	1	$2y$12$aJ9Rmy1R08sNifWQ1tH8pOlotRz/3z1oCZguOWUQAET2T1KGtzoLS	\N	\N	1	2	Hamid	Raza	\N		\N	2024-10-10 14:30:26	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	43873.55	-O8pyiZYx3e19pdTwPrm	\N			\N	1
82	Usama Shakee	usama@gmail.com	91	86469554	1	$2y$12$8ZgPUgJOwuLClTse8Bi2SOMJzAZLv1JwtWgfaWudnoHviF.XVbcK2	\N	\N	1	2	Usama	Shakee	\N	\N	\N	2024-08-19 16:27:57	2024-11-08 09:07:13	1	android	\N	252	\N	0	-O4eawTaYLSH9zotnwKq	\N	\N	\N	\N	0
8	Mehmood	mehmood@gmail.com	93	4636346666	1	$2y$12$MApYKHwBp7lGh8FdndIgXOywZR347kkY5PlT/ayC5wioOoR2BWQ4y	\N	\N	1	3	\N	\N	\N	\N	\N	2024-05-05 17:32:00	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	0	-O4Py9t1-trm7NTzXZ2_	\N	\N	\N	\N	0
116	moin	test18@gmail.com	93	848454544545	1	$2y$12$m7bANsUljuevmkqlCnpJl.oG1eOD.Bno62zbzcVaol6BTZZ7t4nYK	\N	\N	1	3			\N	\N	\N	2024-09-03 10:43:06	2024-11-08 09:07:13	1	iOS	\N	2DBAA594-4E15-4641-8594-F2D3DF28A52C	\N	0	-O5qcxcwxqC3sl4AUPpq	\N	\N	\N	\N	0
102	Raheem	ra@ra.com	971	84864646434	1	$2y$12$4wt4X4h6E.wmPgXG6keSk.Wi8gTdkfLhGv9gB8G6oKoRdx3DYOmH2	\N	\N	1	3			\N	\N	\N	2024-08-26 11:52:46	2024-11-08 09:07:13	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	-O5CfAW0ThipnpFKLrkr	\N	\N	\N	\N	0
115	vh	ff@ff.com	93	555558856	1	$2y$12$mqAcfqCAYrHwyJO.77lBF.HUsdwVj2eL8Sft69.cfu6cF.5qlhqiy	\N	\N	1	3			\N	\N	\N	2024-09-03 05:16:43	2024-11-08 09:07:13	1	iOS	eni4P9ixn04FkcKQaRM-c4:APA91bHsvrUM4xoRRhCf2c6e4dxNK1jMEy_0jnMqaSNTLaxE-j4BUlI_qC4Hq1aJuAJ5hJZgFSACXY6-dIW2aLcl0tkRVEy16iRHN2Nza9j_UfNE9_9rrbC-s4sQLRPMTeXoAQK1tyYO	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	\N	\N	\N	\N	\N	0
107	gh gg	vv@vv.com	971	5456484664	1	$2y$12$PPhfOEg6fLWND9/ycyikmexFV0XQhweDmkY.5wfBEKRbj8wYrqEki	\N	\N	1	2	gh	gg	\N	\N	\N	2024-08-28 14:17:16	2024-08-28 14:17:19	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	-O5NUL3kJCFJGc-VkVMf	dmpTpbT2_kZllQsLV3aB0s:APA91bGA27hvPF5DGwpdMNISPPt1XwGECEcbaMi4nGm_jH_7fACCTHDfH0GedDQ8bnduRluBk9SDnMj59WtJ-8lpuVCBL6vW0v7s7g7D6NbLDLIh_8f4PU_GKzXSNfjWGQO9I0fj6qcq	\N	\N	\N	0
231	anil navis	anilnavis@gmail.com	971	5640050333	1	$2y$12$1uFUpsXnRznu/fd4Sa4rKO9p3MukdU9NEp.GvuN9MXg6eB12YHBK2	\N	\N	1	2	anil	navis	\N	9769	\N	2024-11-05 12:37:03	2024-11-16 08:01:13	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	cbcefe5a9a37fc0869f26bc50228d4b7	5000	-OAvT7LMBRo_R-u9WMWp	dlQw6apgY0KKjiOV4vUWpy:APA91bEqGmb9KYuxpyhjJd86s8sPgvPdntcQ-fANUXSPsihYMNU99TfUEfBmq7OtKXL5VOiEP8OUhhAll7O1jvuhohB7iGt_jc3G2nMB8ibiDG2DJlhWMlk			\N	1
60	HamidYatch	razahamid001@gmail.com	92	3441562509	1	$2y$12$qtC21cTMh6aEkHLM.BsHe.g4RP9pInCVHdC8GQrcri5IPiVJlXf06	\N	\N	1	3			\N	6922	\N	2024-08-06 21:19:22	2024-11-17 23:19:52	1	ANDROID	\N	599d57ab8f6dbde0	0dc0d1c033c13ad1c004402bc539be35	0	-O4Q5OLJnImQ3fN2R8ML	cTzsvCFWTomUHSy3Km9bix:APA91bHENspC7DmIGbIMRCRJTA-BlFkYkuDIXCaQMJhSDUBqs5OnY3bCRfZVhwforjCab91BJ8R5vRdbS24Lo7PvxJ_YVQZ2cNHLVTM3kfFy1US65dshxTc	971	523243163	\N	0
136	kannan annamalai	rtgjdcdmh4@privaterelay.appleid.com	91	8807990032	1	$2y$12$GS8EZynh0QRjTI/lMjxtDumBTtZ4RYZO8tvRJzHiEkUYgcUWMEGTe	\N	\N	1	2	kannan	annamalai	\N	\N	\N	2024-09-13 07:03:19	2024-09-13 09:11:26	1	iOS	\N	D0AFF90A-AE63-423A-8354-FD0288490C6C	\N	-2079	-O6dKSJzNT21TgRwHbeH	cebDBne_2kvilaog7LMx9T:APA91bG7Exk_23lxzdX2RMfIF6tGx6tF5VzM5r2jtQTfPqkmBobOZ1KG6WediOckyAFXICxdFBvOx1S1w9xHLHAY83jVuceAeJsAr-7Rs2C6fQL9E2CSzO_lEtD495MSQHZb74CqQ7AJ	\N	\N	\N	0
185	Sooraj Sabu	arshadtest1211111111111@mailinator.com	91	864695512111211111111111	1	$2y$12$kZGm6gWskbmlnH4QYs38qeCwmwVxv.U/Cx9PkcYkpU7wMzL90nzRS	\N	\N	1	2	Sooraj	Sabu	\N	\N	\N	2024-10-09 09:52:06	2024-11-08 09:07:13	1	android	\N	252	\N	0	-O8jpQkUH-xLFMnNlnH0	\N	\N	\N	\N	0
94	Teas afafd	sooraj.a2solution@gmail.com	92	65874512	1	$2y$12$wWmdNfmGEh7YE5ThgNmddutMKIQBp2wGtEq1Rqlb4MY11V6QUp1oi	\N	\N	1	2	Teas	afafd	\N	\N	\N	2024-08-21 14:23:50	2024-11-08 09:07:13	1	android	\N	252	\N	0	-O4oSheOnRjqM1_Uy2yh	\N	\N	\N	\N	1
139	anil navis	abinmobiria@gmail.com	971	848464664	1	$2y$12$wKLnylejycROmwqkxKw2buvUrbESdkjAXSZj.l75iv.Xd6Va5W6W.	\N	\N	1	2	anil	navis	\N	\N	\N	2024-09-18 23:17:21	2024-09-18 23:17:24	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	-O75ZLAzMaRIo3XsDmU0	ehnhqIQHBEqrrXg_jAt-yb:APA91bF48BBZZbT8zn-mmWhkR79-1WtpBn1rGw8-CAaQd7p6Xs_m6_T6-HrVaSM7fmyaZBfztY9gZTk3XJe3cxXg0ky-fGNTPx6nPiRijQvrY_9yJON7s-SDkVQAVrY5IpTanswiALEJ	\N	\N	\N	0
14	Abdul Khans	abdulkhan22@gmail.com	962	6587412	1	$2y$12$VXNpxmI7i43eM8PSmZJB7eQy6anU1Okkm1BwOJlEyBjEK8qPNHTyC	\N	\N	1	3	\N	\N	\N	\N	\N	2024-05-13 10:19:22	2024-11-08 09:07:13	1	iOS	\N	13822C6B-D116-4BEA-8B25-6D127B86654A	\N	0	\N	\N	\N	\N	\N	0
151	Dev test E	devtest@gmail.com	92	3095565454	1	$2y$12$VlUKDDrXDzvV.8qnCglMe.Bg52rg2p9eWwm9jTAlIBgxbNbQ9/fPa	\N	\N	1	3			\N	\N	\N	2024-09-27 15:44:29	2024-11-08 09:07:13	1	ANDROID	\N	c4f068da61c4c474	\N	0	-O7nOtN-YdpQadie1efN	\N	\N	\N	\N	0
124	Rafeeq	rk@rk.com	971	515438464	1	$2y$12$M9wmGgHCPEDVr3V2aGLNzuD5lWJ5qr7ZCEKeSJ3X53Mr0kB4Gnkdu	\N	\N	1	3			\N	\N	\N	2024-09-04 06:54:15	2024-11-08 09:07:13	1	iOS	ff5icEmcwk4hjmQZbrDKey:APA91bF-cfD86J9S2WnSp22QTfxzJfypFfBn_Oa5kbmMuczZqmcKRGv2Q4aY20AWcPIdIxOHQHC93egYYSsyE-Ib52ds_slv2vHaDYHsbrDqul9_8zhTfO2acll3dMcl_xtlaF6MO6nR	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	\N	\N	\N	\N	\N	0
145	Test Ine	test1@gmail.com	92	3095565455	1	$2y$12$/fmb/2OUzdtjxubuyRP4d.wT6s5W.d6B7Ig.JkmOkQ1lbABohTNLS	\N	\N	1	2	Test	Ine	\N	\N	\N	2024-09-23 20:40:32	2024-11-08 09:07:13	1	ANDROID	\N	c4f068da61c4c474	\N	0	-O7UkOSbHX7zjGWnqgxj	\N	\N	\N	\N	0
90	Usama Shakeel	usama99@gmail.com	971	33157738	1	$2y$12$vHyVOeLRR2ymKIaO2hlRzOOPnDg/hhZyn//MrqCw1G.Okt83qY.eW	\N	\N	1	2	Usama	Shakeel	\N		\N	2024-08-20 17:45:50	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	-3360	-O4k1LochdZPQF_L2o30	\N			\N	0
86	sooraj	hamid001@gmail.com	91	984782379942	1	$2y$12$0Prm7T0ZXk4PngEUeDvFLO9OwKdY1Mg50kAKtMS6HNtWtTK4Yza3.	\N	\N	1	3			\N	\N	\N	2024-08-20 16:18:39	2024-11-08 09:07:13	1	android	\N	252	\N	0	-O4jiWAXRoKT6ba5FUlH	\N	\N	\N	\N	0
235	anilbb	boomer@boomer.com	971	564005096	1	$2y$12$tTEFshKc5o8xL6MuPXQg9ew4IuiUIIsK912DS8x.RM7uPiyVqfdhq	\N	\N	1	3			\N		\N	2024-11-06 08:13:28	2024-11-12 08:28:18	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	141f956d37310ebdb33fb04461f05dab	0	-OAzffOM_VFcaosNqaBF	fTeso8TpbkzmgOEhKjCRbI:APA91bHTtRhvcIfRRemxApaVzGUDH2qPKsxeNPYor89Cp2FdAFFZO9lnhuXaeT2hqr0YQ9rpJZqASAg2oGfnVCy9APdt-bAtMXfyNYQomMjwhx2GXzR3mg0			\N	0
81	sunil	na@na.com	971	5568680900	1	$2y$12$tne4TrwhwR25nRYcBg4lF.HGwETpK48TqgEgpx2F4U52YH9Gneobq	\N	\N	1	3			\N	\N	\N	2024-08-19 12:11:09	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	-1643.25	-O4ijFATiM7JPiRIwege	\N	\N	\N	\N	0
127	abc	test101@gmail.com	358	84848484848	1	$2y$12$TxAHkOmxe7nWx024G3kcUOjObQUgB53V/7yDGswQNJqEX2owRXS/u	\N	\N	1	3			\N	1234	\N	2024-09-11 05:25:14	2024-11-08 09:07:13	1	iOS	\N	6248E5A7-DA73-462C-8CF2-19F8E3499CEE	c0885b5fa1c86821ffb476475be2af7a	0	-O7ZwXsupqBKSuFjIzqa	\N	\N	\N	\N	0
184	Sooraj Sabu	arshadtest121111111111@mailinator.com	91	86469551211121111111111	1	$2y$12$P1JI1UQCz1UfTttbXxy3G.RzxdAFn/iN6tva3A6/OPkayT77wJjhi	\N	\N	1	2	Sooraj	Sabu	\N	\N	\N	2024-10-09 09:50:56	2024-11-08 09:07:13	1	android	\N	252	\N	0	-O8jp9NOta5j_xhaXHqy	\N	\N	\N	\N	0
59	sooraj	sooraj@yopmail.com	91	854545	1	$2y$12$M2ZqM74UCeFiRc5rf6wAf.9gs/4zu9bKO3yvjANDWuYX2wzx33Tne	\N	\N	1	3	\N	\N	\N	\N	\N	2024-08-06 10:21:49	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	0	-O4od9FOl_DzRrgwSR9F	\N	\N	\N	\N	0
1	Admin	admin@admin.com	971	112233445566778899	0	$2y$12$g.15P0FdiwQlP9wb9v8ds.ieo6TilCEAD.RhIr3n8hl0REQ7UJ096	\N	1	1	1	\N	\N	\N	\N	\N	\N	2024-11-08 09:07:13	1	iOS	\N	79F5B631-92F8-4485-9EDC-2092FE5C5248	\N	0	-O7SpePAMzw2lvfL-CyU	\N	\N	\N	\N	0
49	test four	test4@gmail.com	971	3698753321	1	$2y$12$riOcUF85bXY5jUuqr/NqCOi.FgnyqR0N1HmFDjpGTps4i.qaJ/enm	\N	\N	1	3	\N	\N	\N	\N	\N	2024-07-18 14:59:32	2024-11-08 09:07:13	1	ANDROID	\N	507c25ffbc01d8ae	\N	0	\N	\N	\N	\N	\N	0
63	Asad	abcd@gmail.com	92	3441560355	1	$2y$12$xQNylH.0U2vT7R44bQ9fpuQaUPEEtdOlBNyyT6W6eUhm5c0orXEfW	\N	\N	1	3	\N	\N	\N	\N	\N	2024-08-08 11:18:52	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	0	-O4Rfj92Ng_Jt2UKGoWt	\N	\N	\N	\N	0
140	Baderiya	bader123@yopmail.com	971	585588558	1	$2y$12$4myU97lqYmpnlyYX79TZ7.nv4e7bLaF4TPTzear.r9GXWT9dav3wO	\N	\N	1	3			\N	\N	\N	2024-09-20 12:38:23	2024-11-08 09:07:13	1	ANDROID	\N	853f83811c6a386b	\N	0	\N	\N	\N	\N	\N	0
196	sooraj	partnertest21@mailinator.com	91	305272133612	1	$2y$12$20AgSlS2gHCYBIbMvlSFFehq60kDXv.n5zT28LG1mBYl737YpYnn6	\N	\N	1	3			\N	\N	\N	2024-10-10 08:22:07	2024-11-08 09:07:13	1	android	\N	252	\N	0	\N	\N	\N	\N	\N	0
12	Abdul Wahab 2	abdulwahab442@gmail.com	92	6516554	1	$2y$12$XxH6ciFl1wHX1p3mkjCZt.UXVmqaD.4odQjrynBz1yLYDNDsoF4W2	\N	\N	1	3	\N	\N	\N	\N	\N	2024-05-12 12:40:34	2024-11-08 09:07:13	1	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0
210	anil navis	nm@nm.com	971	54346846463	1	$2y$12$76HIEEN2kxQ73GKRY0MXYOSrVImCQY86g0MGqFeBpdV0mxbjfKmWq	\N	\N	1	2	anil	navis	\N	\N	\N	2024-10-29 09:12:18	2024-10-29 09:12:25	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	-OALg7JR1PVpAx3fHrZ4	cXmkSYrTCE8hiAJThd5p9d:APA91bGymeIXphoNXg-TvA30nQ-TdbzTOBdaOu8aohCVDz5agJ1oShI7eMwsmvBg-YFng0oQR379AmGnYcVLm_xTG9D36qrd0tQ9cY-emFKKYbhrKvMwECk	\N	\N	\N	0
85	Usama Shakeel	usama12@gmail.com	971	33158646	1	$2y$12$iET8exhdHpLWejuzfKtGhusARP0au61AmSYwTrQQ8hrdwGaH6PVuu	\N	\N	1	2	Usama	Shakeel	\N	\N	\N	2024-08-20 16:15:59	2024-09-05 19:32:24	1	ANDROID	\N	Asd	\N	-3633	-O4jhmatf4GmDjqY2pi8	fH8Y67ApR_Wj82leR7wuW7:APA91bHwfG6HkV356UBiOAW61c1ZxrImgJfltAWvUTemT-hTBACzlPD0SfNL2cKRgBENyXtykVcU_iX2_kb7e1aHowjlCTcz5bez7mctTPVOJBkC8BH3Qgqep2WOcFyfM5xQGHcLC1B4	\N	\N	\N	0
95	abc test	z.falak77eere7@gmail.com	971	18161619191	1	$2y$12$j6zV.k1Wa8.N1mafwibmw.oZx33dKKYj2ZiC8MLbjMMRzvXt5Owx2	\N	\N	1	2	abc	test	\N	\N	\N	2024-08-21 15:13:24	2024-08-21 15:16:28	1	iOS	\N	13822C6B-D116-4BEA-8B25-6D127B86654A	\N	0	-O4od3EeYjLQvTLkV3uG	eAP6zhK_Ykqcol0ItbVyoM:APA91bHZLTSD5Wbj2z6mIGhcGkHW4h5rNQuwY1aMG9BVQA6qfQzcJa2U9kTIK5_RyAtJ9pSGSMn3YzeIvFgrpprQatCpBRXKLPkudKuwVS9UPuSHjpkkJLYJkXiIXcVjZf8RXJiKIScb	\N	\N	\N	1
33	Wahab	vendor262khurram@gmail.com	92	41236544	1	$2y$12$yoFIERqMyL/OepR9lZVcxONcuK4segSQrZZ5OMzhXQv/vYcY7K0QO	\N	\N	1	3	\N	\N	\N	\N	\N	2024-05-28 09:09:53	2024-11-08 09:07:13	1	android	\N	252	\N	0	\N	\N	\N	\N	\N	0
120	abcs	test50@gmail.com	358	48484848	1	$2y$12$ANlP/kqLVLEHnD4o.72IheYIksSUyWez.dhHcWtrv9z.b4f14SwC2	\N	\N	1	3			\N	\N	\N	2024-09-03 13:00:12	2024-11-08 09:07:13	1	iOS	\N	2DBAA594-4E15-4641-8594-F2D3DF28A52C	\N	0	-O5s6OdDxIVXwZI1B9we	\N	\N	\N	\N	0
194	sooraj	partnertest@mailinator.com	91	3052721336	1	$2y$12$AzcBugEqBbbVypbo1A/2iOTWKRVP/2cn8o3.xs5Edy8Iv35D./kRK	\N	\N	1	3			\N	\N	\N	2024-10-10 08:14:35	2024-11-08 09:07:13	1	android	\N	252	\N	0	\N	\N	\N	\N	\N	0
183	Sooraj Sabu	arshadtest12111111111@mailinator.com	91	8646955121112111111111	1	$2y$12$H46eNE7IC8V.ktVEjdmXqun2xwfbxBpkmzqimleGXZHVjHbA1LXCm	\N	\N	1	2	Sooraj	Sabu	\N	\N	\N	2024-10-09 09:49:31	2024-11-08 09:07:13	1	android	\N	252	\N	0	-O8jopwytxnWfcBh6fZv	\N	\N	\N	\N	0
181	Sooraj Sabu	arshadtest121111111@mailinator.com	91	86469551211121111111	1	$2y$12$fP1xy5gmFNnkI/94nJSZAOmcp0q/BSszvjIO6KBmBfGW9mgaGcn9y	\N	\N	1	2	Sooraj	Sabu	\N	\N	\N	2024-10-09 09:44:17	2024-11-08 09:07:13	1	android	\N	252	\N	0	-O8jndHma8TMT8ltyZH8	\N	\N	\N	\N	0
22	Asad Nazir	asad@gmail.com	+92	3445522331	1	$2y$12$0PQOL5hxEDwf93EsPhA1OeYsxWmqPKscTl7RGPIx8qQKKQB.cXu.C	\N	\N	1	2	Asad	Nazir	\N	\N	\N	2024-05-14 23:37:56	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	0	-O4iolyWpRSR6V96kwAu	\N	\N	\N	\N	0
141	FBadri	fbadri123@yopmail.com	971	555566558	1	$2y$12$HK0pKsFn9I/VAnmFMlgqO.3ActtdqmU/q9AT.LLFC92UPdpDDnUd.	\N	\N	1	3			\N	\N	\N	2024-09-20 13:15:18	2024-11-08 09:07:13	1	ANDROID	\N	853f83811c6a386b	\N	0	\N	\N	\N	\N	\N	0
112	zamzam ali	zmzmali05@gmail.com	971	566676166	1	$2y$12$WpxCoxnHJjiDBZorC9L7oO0MoANr6QeYIndT1PTG3ttKuMcgNJcpW	\N	\N	1	2	zamzam	ali	\N	1912	\N	2024-09-02 16:27:06	2024-11-08 14:15:25	1	iOS	\N	EA4A875E-03AB-47A5-A992-0D869FEB73B0	4fdf01c8d7baef70ddcfd30c22fa5f7c	0	-O5mh-ZPT52B8AodztDU	eCUXfNZ5OUmymODgmHivau:APA91bECD5V3J4vdzcguQr958ipLcoThiFIel3qR5rlZP1QkH4Gz29C8kaNdi1NtMB1tcGUUSns_sFMHYFDYaJ5gT1paHDwlYfftvHz8eIBIzBr8psId-XvmhDL61xH5CysNm3YOZhzz	\N	\N	\N	0
108	hhh yy	nb@nb.com	971	5464648643	1	$2y$12$2mSfAQs9NJcdbOFXocTSRuOYHpX0ULTUQWK3NXP.oXwATKGCkugci	\N	\N	1	2	hhh	yy	\N	\N	\N	2024-08-30 09:44:07	2024-08-30 09:44:09	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	-O5Wo-5p4PRoQo0dwT1F	c_34JXma_0Ewmd-W5Q5F4O:APA91bEcSOIZQZdQg3Mw--YnVLERq5eBo-Bb-0-UgA3PwDYBBSVb6Wa6VSjGK6EE_7RH94waUMwVCGu8yAqNrC9H8eGa-gqzvehGL_ov2Bt12vG_yUpMjmZAvM05GjUo3pIzofBPVJqe	\N	\N	\N	0
78	nasrullah khan	nasrullah@gmail.com	+971	949198488	1	$2y$12$DkhryaeGovwqLI6QdyZjr.k63Y.13f.RxmnsXjL2D56mNNZiMD6nq	\N	\N	1	2	nasrullah	khan	\N	\N	\N	2024-08-17 22:08:47	2024-09-10 21:14:52	1	iOS	\N	CF7E22F7-2383-4D17-BEFB-43BA40F8C46F	\N	-73536.75	-O4gACV0xEKtT-OMfo7T	dEKd2C-v60r7mwADZRzxBf:APA91bF6jvvW4bx5rmpMfZNp3u109UZsaYouK_hVlWEQrhLRzFgrEIRpv-a0KT6gEGwtRqmY3z3lNI3jfQxyD0Vwk-UHgMYnZq4hgYKgEulMVl9SP5716Q0qXxUlQShtjC42USs-iXJq	\N	\N	\N	0
101	Lathif	ind1@ind1.com	971	566899099	1	$2y$12$d3uwVLwuFLsIQ5gyw/IGIOfVPohEn2Q/m2d9QgR3IBSmZGUJajQpS	\N	\N	1	3			\N	\N	\N	2024-08-24 13:02:50	2024-08-24 13:03:37	1	ANDROID	\N	22e245fb755e3d9b	\N	0	-O52c6OmDMkCDuU6YfJu	di49g4mtTem7zjp4ZcIwgZ:APA91bEygMsSPA6IqQR86vci2I0iRysx6Kb-RDAAJrH0yPSmJhEX18xJdQSzWEYytKW52FgCUFy_re5X0zf7jvOZl25TuXkqOKsewYkaRU9vz0pesf1nP9bl0KYaV4wYeY-5ya01nO5v	\N	\N	\N	0
77	Anil navis	an@an.com	+971	534005096	1	$2y$12$JoT2O8oaT4Br4OP58.JptuLJQ8SjtMJEXarxipDTxM6DtHULHr88q	\N	\N	1	2	Anil	navis	\N	\N	\N	2024-08-16 06:37:34	2024-08-21 02:33:29	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	-18102	-O4Zjrg5netCyfcexQvt	eZGs9lS1HE_yv5DZ3Zio0z:APA91bHYM9KdvfwEoZW3JQsOcImLKuTuQAQoFBM_2z3kir2tfD47GVgqo9uDKgywfnPWvOPDzwp4lZ4esym9WtGKw6xCHr69MjVFv4-lNzmGL4qPSexcu7p03yrQvtFAV_Z7s_s74ur5	\N	\N	\N	0
104	ghh ty	nmc@nmc.com	971	5454648464	1	$2y$12$NKyUrTE00af2fgJ7HLwUY.syq8tDWBO6c2VTflGf7czt2N1WZRcP2	\N	\N	1	2	ghh	ty	\N	\N	\N	2024-08-28 13:31:15	2024-08-28 13:31:16	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	-O5NJnWRxDclp8ot0e-R	dPjDbytlkE_uraHd67UPLW:APA91bHo_ppDJmOHAoWpzbiSVra4ezrWcPCsNxSL2E-72CkVEJFJ0MNi0iariKGWD-7zprlyba35r4H1Toz10Eh96I6CuwiOrAkEZdxeNI_jjq2_7SYse0q2LnlWNiQ5UBwbouFra5dY	\N	\N	\N	0
232	Anil navis	anil@dxbusinessgroup.com	971	2255225522	1	$2y$12$iE6klZhK3A7FllDpNStgyuyCiOZ10tie/EUljQU.4djKoXGr02Gtm	\N	\N	1	2	Anil	navis	\N		\N	2024-11-05 14:38:57	2024-11-07 12:09:55	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	500	-OAvu1-yKLa8rxdW0ZHH	fis_MLF6qkr_g5pXlH-kbm:APA91bFqZguT1V6bZ_GapiPKcO2gxUF3AzjOIlX9tEhvTDvhozDJXO2nK_iiqMvV6vK5FpM7DVIsEupYYoCfY4zf6gwyyurXF6QrpyCH7XBxackXFdOCtLY			\N	0
150	owner name	c101@gmail.com	971	258369123131	1	$2y$12$V51bqcnaHpq.gJLRtai96eoV126bxAaPUD5LPFHLYJlsNKVqQmu4a	\N	\N	1	3			\N	\N	\N	2024-09-27 14:13:32	2024-11-08 09:07:13	1	iOS	\N	81D81716-1BB7-486B-8875-57E17BD63AF2	\N	0	-O7n2Ow9jkUhAgZEOr-P	\N	\N	\N	\N	0
131	Devika E	devika@dxbapps.com	971	502693488	1	$2y$12$waVECvfFYSfrQj.FSuPBROpPx4xw6IovB0XaCUfYhImXidGgaw1/S	\N	\N	1	3			\N	1111	\N	2024-09-11 15:03:00	2024-11-08 09:07:13	1	iOS	c6GOeNzAoUBnpq_RcSnXvg:APA91bE8fF5lFxD1CFylR9-1eiGutNIQYCeGTr7ev2xZpK_OtQskAiSy_Lr3zu90Hw2U9SRoE4yvpHsL0QRL-GR9Yz7Ex6SuW2ui4lSGyKY1ZkQDivDFsltfCnzhIBFcKPrEdqsKyuFp	A913C498-535B-4C7E-B63A-1396DD50EB55	\N	0	-O6tJ43sbPkEpVtFOPBo	\N	+971	502693487	\N	0
17	N Biswas	p1@mailinator.com	91	9832831811	1	$2y$12$ADcnR7EEvMF8qRe.eJ2m8eaXLvHl5vaNBgIS5WLH3T/bsDtp6HYBq	\N	\N	1	3	\N	\N	\N	\N	\N	2024-05-14 11:50:32	2024-11-08 09:07:13	1	android	\N	252	\N	0	\N	\N	\N	\N	\N	0
218	test	test301@gmail.com	971	369896311111	1	$2y$12$E7/pn3K8kyeug1Wkp6JJBONIPK5jco7n1TVZmetEfYDBk520RKR5O	\N	\N	1	3			\N		\N	2024-11-04 13:21:54	2024-11-08 09:07:13	1	iOS	\N	81D81716-1BB7-486B-8875-57E17BD63AF2	\N	0	\N	\N			\N	0
234	Marc	marc@marc.com	971	523243164	1	$2y$12$yZ9NDHVc68mzacA/I5qvFeE3UWsJ2RAZIuqu6YDzoMfeBd6J.LgZK	\N	\N	1	3			\N	\N	\N	2024-11-05 23:29:28	2024-11-08 09:07:13	1	iOS	d3-1cK5xYESyt-P-IdgQGg:APA91bEtemPDVbxfUQOMbm7hxbTY1YLLJ_ZCM20-ccs7EP6iMvGtoMuy6H-6SwVZeQ58hGl709116ZdK2kO677JjEsDg3EUzOav2gOoTUkOyoFiE1q_ZgjA	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	\N	\N	\N	\N	\N	0
160	Devika	beljwar5@yopmail.com	971	503355555	1	$2y$12$cZIgysNyM9Yhdq8WyUi5B.FGr7UT9cYZYrN1UkjmPMRIGNar1DDzu	\N	\N	1	3			\N	\N	\N	2024-10-01 13:03:53	2024-11-08 09:07:13	1	ANDROID	\N	853f83811c6a386b	\N	0	\N	\N	\N	\N	\N	0
233	amil navis	navisanil12@gmail.com	971	5485464028	1	$2y$12$g.NwDEON3wsm6skYU6WkoOcFn3U26uIu9IV1Sk3e1lHRoUS6wQWwW	\N	\N	1	2	amil	navis	\N	\N	\N	2024-11-05 17:40:34	2024-11-05 15:48:39	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	451.5	-OAwY_IBtbxxOZMXWjea	cnaUxbIIN0gui12JEs_KAY:APA91bE169d-ymGiIPC6O1R5UzFhVNnlru3sw1dW6Ho4ufFsWrhsxjyUbOJNQ9yX39bXgET-_qIyI1cU5F-VDUIj3-LnDsPEq_ZkludjCGWPTSIy6nurVAg	\N	\N	\N	0
193	Sooraj Sabu	customertest@mailinator.com	91	30427221336	1	$2y$12$CphFI8/p4vm3wxdVBTkno.u2dmTYe1XIWKfuyo4WEwJ46Velm/4wa	\N	\N	1	2	Sooraj	Sabu	\N	\N	\N	2024-10-10 08:12:42	2024-11-08 09:07:13	1	android	\N	252	\N	-472.5	-O8ocGnompuTVk9N9WjT	\N	\N	\N	\N	0
26	Wahab Khurram	asadz14@gmail.com	92	3441560889	1	$2y$12$.UvBxCqm9cF0h/JG86j46uknKOnGi2nTbeAruVY58HOCaS/YJlomy	\N	\N	1	2	Wahab	Khurram	\N	\N	\N	2024-05-17 09:14:09	2024-11-08 09:07:13	1	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0
84	david david	mm@mm.com	971	546864049	1	$2y$12$LMUrYpLgE23rR.kzgK7K2u6SEOAadCUzQauuYuxyVdZHXWP88p7OK	\N	\N	1	2	david	david	\N	\N	\N	2024-08-20 06:37:54	2024-08-23 19:47:27	1	iOS	\N	1B25C0C1-B725-4D6E-B83B-9CE604421FF5	\N	0	-O4hdU-7Fo9l4K3SrlAb	ezp4KogpfUEXqJJ6r0OZDl:APA91bFMQt2IxtjC2VirhNAXIooNiYehDxwCCJ_WCc-aixCS__BI2rhMpGhHjIsvT69YmF17d1Owy7rkoCo4pDpwhCyDWFXvU0Q-gT-2LJel9u4N6WbwA-Y3mWTAxj0BolXHixI3_-Rj	\N	\N	\N	0
93	anilnavis navis	anilnavis71@gmail.com	971	8464664046	1	$2y$12$MfJ/.deIcnYa7nOmlnH.4eYnQDGhsnM1/lLbDE3ernz5fZei5IQJG	\N	\N	1	2	anilnavis	navis	\N	\N	\N	2024-08-21 13:34:36	2024-08-21 10:58:54	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	-1900.5	-O4oHR_5uzUa_dWQ9lh6	eZGs9lS1HE_yv5DZ3Zio0z:APA91bHYM9KdvfwEoZW3JQsOcImLKuTuQAQoFBM_2z3kir2tfD47GVgqo9uDKgywfnPWvOPDzwp4lZ4esym9WtGKw6xCHr69MjVFv4-lNzmGL4qPSexcu7p03yrQvtFAV_Z7s_s74ur5	\N	\N	\N	0
45	Hunain Dev	hunain88@gmail.com	971	0987654321	1	$2y$12$i6G.GzOMbkBdqwSRm9IupelrFKL9AehsshxuB2z.FR/iu/bhZVvW6	\N	\N	1	3	\N	\N	\N	\N	\N	2024-06-03 13:07:06	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	0	\N	\N	\N	\N	\N	0
219	test	img@gmail.com	971	545451515151	1	$2y$12$dXn8gbIRy.6noRvhNimlAeLUDMJlI5aJzeekfPObHCWs2ztbyB/ie	\N	\N	1	3			\N	\N	\N	2024-11-04 15:32:33	2024-11-08 09:07:13	1	iOS	\N	81D81716-1BB7-486B-8875-57E17BD63AF2	\N	0	\N	\N	\N	\N	\N	0
18	Wahab Khurram	newwahab32khurram@gmail.com	92	5413254	1	$2y$12$b3Mer5QPlE1apBDLu4cO7u87FRqv66IcUJiBF4U8xne2RTaQDfoLe	\N	\N	1	2	Wahab	Khurram	\N	\N	\N	2024-05-14 13:30:29	2024-11-08 09:07:13	1	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0
7	Marwan	marwan@gmail.com	93	46363466663	1	$2y$12$2M9Smdq3IF2.2OBu51.0POKm13R3ekvLXJ/zE7u5r2eVtdMTgXpSq	\N	\N	1	3	\N	\N	\N	\N	\N	2024-05-05 16:20:40	2024-11-08 09:07:13	1	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0
135	Akhil Padippurackal	devikadxbapps@hotmail.com	971	502693489	1	$2y$12$hBMrI8Ccmrs50w1VdDfO1.l6xPrhgkGiw64yfkOVYeR/HwYCuagZm	\N	\N	1	2	Akhil	Padippurackal	\N	\N	\N	2024-09-11 17:01:53	2024-10-07 12:59:41	1	ANDROID	\N	Asd	\N	-22050	-O6WAGSe7GWEXPJi8iUk	e6ZrcL2ITzuepKR75pzOMs:APA91bEkH9xnU1Q9b2apeoLmWbbvuLowAX-0N9sXUIv7FUsnDgVqoF7fkno-y8MBcam7naSf3idaTAajf04tKl_zSNDmLI89TT3f8QkgoiXSqIjgCeQ_a9EiFn0ydPm9hRCHVflqS_G_	\N	\N	\N	0
67	Sooraj Sabu	nas@yopmail.com	91	8646955	1	$2y$12$vPAu4Z0cxmXCgHcxTVbrrue/7Nv/NAQpV9COnHt0simG60T1MUXFO	\N	\N	1	2	Sooraj	Sabu	\N	\N	\N	2024-08-09 14:26:38	2024-11-08 09:07:13	1	android	\N	252	\N	0	\N	\N	\N	\N	\N	0
57	Hamid Raza	razahamid31@gmail.com	92	3441562512	1	$2y$12$fEabffdsjaGF3P2m2WTgzuODTwyCnS9wpvL3g0mg8EvPv6VK6DlhS	\N	\N	1	2	Hamid	Raza	\N	\N	\N	2024-07-25 15:32:52	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	0	\N	\N	\N	\N	\N	0
167	sooraj	jdoe99053@gmail.com	91	98478237994123	1	$2y$12$JdyY3ER1oPB6iO3f2PmQoeSZdvziC0U6ocPCsDrKJpw6SL0merYO6	\N	\N	1	3			\N	\N	\N	2024-10-04 12:36:34	2024-11-08 09:07:13	1	android	\N	252	\N	0	\N	\N	\N	\N	\N	0
156	Devika BELJWAR One	beljwar1@yopmail.com	971	502693489	1	$2y$12$MgryMwycreTQZbBCTTPjdOWajy1TEtzpWpPwL0aEm0b/HzuHSYRHS	\N	\N	1	2	Devika	BELJWAR One	\N	1234	\N	2024-10-01 12:50:11	2024-10-01 18:30:30	1	ANDROID	\N	Asd	b26ad07907420a8b002e7d46dcbc226b	-8085	-O86GSUZO0UeZHNj1r7l	fVz9z-WFQ5akhLFEhIJ_1r:APA91bEzgnYn2UIWgiAWIFP4QnUF0AZgNMJkmM0Z1dBJ77OigliGG0t2i-Op_qaFL02XmJ0f80RbjPco72vMKQoa2mN5yh_bQuaMX0QME5-CsRcKUEjzjU54_kwQFX17xHQfdWnq8qUe			\N	0
134	Rejisha Dxb	rejishatest@gmail.com	971	223322332	1	$2y$12$ZLyp9RLYfBPzSCYKZLCLneKsaTCq73BxG.jieTbi1h4HjhUaurTDy	\N	\N	1	2	Rejisha	Dxb	\N	\N	\N	2024-09-11 16:58:14	2024-09-24 11:33:10	1	ANDROID	\N	Asd	\N	-14490	-O6W9RWmEXPdb3XBrqSa	eM5vB7ncQ-iCi1S0T41qQ9:APA91bFf3LQA6vkr90NEf9YyhSSEoLG7JFycsMr0JuizMhU_IUpLjoqr6pseVjAstsLX-3QTJmRHie-zlgKrCEqHXGQ9MxFLjx7U31i-QwFNCAYK6yv-Sz_jZ8K0EwMzWNyqj_-AYzA8	\N	\N	\N	0
111	Fatima	fj-hamad@hotmail.com	971	502283912	1	$2y$12$KGbwQphVu2xeUChajd2EsOvdMtKf1j5.b3Rg9DsvX4hqHoTAHPczy	\N	\N	1	3			\N	\N	\N	2024-09-02 15:40:15	2024-09-02 19:47:10	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	-O5mXw6dO5vscCCLNjmF	fe2I_2xsPEzup_5jFFkgQj:APA91bF3LShI3PAITOshBZkUZnq8QRQGyaITOMs1Xn_r-Gn9Jtii5q5K_7Pyf7AVzayMMVj558k9e4YxJMl9BvKclEE9C0ko7nolkNdCSWG5JdvQ3_XeTJYsivZl5gUKGH7hiHzRTyux	\N	\N	\N	0
182	Sooraj Sabu	arshadtest1211111111@mailinator.com	91	864695512111211111111	1	$2y$12$zZ87ihOfTORfRlaZBz9EjeDMZuvhVm3yp22euxJOPe4dBjLvg6Hqm	\N	\N	1	2	Sooraj	Sabu	\N	\N	\N	2024-10-09 09:46:50	2024-11-08 09:07:13	1	android	\N	252	\N	0	-O8joDcJaxqhxRYrdW0r	\N	\N	\N	\N	0
153	bash	c103@gmail.com	971	8484848448	1	$2y$12$LknxDyrQQFHF5qf0bR6RS..uyuzWlP5icUAZDzmbkH27C2qRnq.eC	\N	\N	1	3			\N	\N	\N	2024-09-27 21:09:48	2024-11-08 09:07:13	1	iOS	\N	6248E5A7-DA73-462C-8CF2-19F8E3499CEE	\N	0	\N	\N	\N	\N	\N	0
169	Hamid Male	razahamid106@gmail.com	92	4441562554	1	$2y$12$A65aE0sFSfYeJkeTliEF9eictO3VqclwvnnqHwrwdr9M1ohqk5bkG	\N	\N	1	2	Hamid	Male	\N	\N	\N	2024-10-08 09:39:38	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	35566.5	-O8ecyck77NQ4V9gSbkq	\N	\N	\N	\N	0
152	Company Owner one	companytest1@gmail.com	971	123456789	1	$2y$12$cTaJOsHgbpLHl6dhziy8Re6O6E6YnbvinDKIH5.vFYclKIH670fdm	\N	\N	1	3			\N	\N	\N	2024-09-27 19:30:49	2024-11-08 09:07:13	1	ANDROID	\N	c4f068da61c4c474	\N	0	-O7oYbTXgGiEfI5S3_M5	\N	\N	\N	\N	0
155	Hamid Raza	razahamid105@gmail.com	92	3441562113	1	$2y$12$eDDfqK1whw6yWH7j9CJ2t.ExlG0CJ8AHGxZElrywQFrbzZwaqZoGq	\N	\N	1	2	Hamid	Raza	\N	\N	\N	2024-10-01 11:58:42	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	3954.5	-O864fNszacNl20nM6Kp	\N			\N	0
148	Test	medacezone@gmail.com	92	412365471	1	$2y$12$FsaCzugnfTN6jdLfwgpwyukzz7YpRA9Y.YK.vJa8ul.GCKnsLFrXO	\N	\N	1	3			\N	\N	\N	2024-09-26 11:33:48	2024-11-08 09:07:13	1	android	\N	252	\N	-10962	-O7hFCiywY_7HN7s9EpX	\N	\N	\N	\N	0
138	HAMID	razahamid006@gmail.com	92	3441562001	1	$2y$12$qscHRp0jeilRKI31ooWEgeGKOytbTM0tI2nIlg1Heinv0XZ.VAT6W	\N	\N	1	3			\N	\N	\N	2024-09-17 20:05:54	2024-11-08 09:07:13	1	ANDROID	\N	2d92159a1fa92303	\N	0	-O7-nyePMp7LvMJbr5F8	\N	\N	\N	\N	0
91	anil	bv@bv.com	971	42258508555	1	$2y$12$c8WI7o2Pf/zL0.I0iATQrOKdh6ntqOcCouv.dt9kRDEoMWAyWI0S6	\N	\N	1	3			\N	\N	\N	2024-08-21 00:25:51	2024-11-08 09:07:13	1	ANDROID	\N	d40ff12425303f2c	\N	0	-O4oAoziTv_njLbQR2nM	\N	\N	\N	\N	0
189	Sooraj Sabu	test1111@mailinator.com	91	1512111211111	1	$2y$12$qUBXFKF40bk8D22mj5o39uRgjHqnPmrWAGs0x8h6H9Us02wopldVG	\N	\N	1	2	Sooraj	Sabu	\N	\N	\N	2024-10-09 09:59:09	2024-11-08 09:07:13	1	android	\N	252	\N	0	-O8jr20t_Aq3SHzbGyJf	\N	\N	\N	\N	0
147	moin sheikuwiw	moinuser@gmail.com	971	848494949494	1	$2y$12$id8WTBMhB5YGhsZKWLgyUeLe9DlSKUvl2SK6njlTxTV7/j20LwCi2	\N	\N	1	2	moin	sheikuwiw	\N	\N	\N	2024-09-24 13:38:22	2024-09-24 14:40:58	1	iOS	\N	28AA2C8D-2700-470C-8233-6BB2331DE0C6	\N	0	-O7YOMOlcvc8uhZqPFss	cbNB61H8TUG5g1mpOcLyjj:APA91bFs8C6Dbc1oIMNEve7YV8hMPy_RWLgRK_8wWQcucz3XFNxbiCJcLPXdRA5sb9QLf8IgcIQK7CUq_dqOAbsbr2GN4yEAK9Y3Qj667ilxbbPeORo7mNmgPeZWJhG6n8bttYGL-no7	\N	\N	\N	0
159	Devika Individual	beljwar3@yopmail.com	971	505555552	1	$2y$12$MB6WhrEhyCE1gZBIQbj1T.LGw9f9z99znx1U/z9Aa18zlRxLu950a	\N	\N	1	3			\N	\N	\N	2024-10-01 12:59:23	2024-11-08 09:07:13	1	iOS	\N	A913C498-535B-4C7E-B63A-1396DD50EB55	\N	0	-O86Xahq5ABnOf-fa9-7	\N	\N	\N	\N	0
9	wahab khurram	wahabfun22222@gmail.com	91	6541235	1	$2y$12$mfS.NUcbYhQvhpGo2b0w.uJYOTDq5IodzL0IKkSP6cL5Do.gfy3fC	\N	\N	1	2	wahab	khurram	\N	\N	\N	2024-05-12 12:22:36	2024-11-08 09:07:13	1	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0
128	Anil	anilnavis1971@gmail.com	971	5464384646	1	$2y$12$Z/Pq7ub0feQc7cCH5JXSOe28TDIp2iPagBjnBHJbIygAmQNRmvUj6	\N	\N	1	3			\N	\N	\N	2024-09-11 12:13:55	2024-11-08 09:07:13	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	\N	\N	\N	\N	\N	0
195	sooraj	partnertest1@mailinator.com	91	30527213361	1	$2y$12$Z44OPINhutmyoiE7VGaW8u082jafVsAN6GVuCcbSpjRpQYHvHLMm.	\N	\N	1	3			\N	\N	\N	2024-10-10 08:17:21	2024-11-08 09:07:13	1	android	\N	252	\N	0	\N	\N	\N	\N	\N	0
13	Ali Khans	alikhan22@gmail.com	358	65874513	1	$2y$12$hymU0d/EiXZfQclQ0tsLCOHFiyfEvIp8WdE2hHyznk7055nF/o.7.	\N	\N	1	2	Ali	Khans	\N	\N	\N	2024-05-13 10:17:55	2024-11-08 09:07:13	1	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0
21	Wahab Khurram	abc@gmail.coss	92	343434142	1	$2y$12$jKjGvdcWGMXFa0VFhVsUHec0wC9VTK22L5v7PLcr5.phxFrkdJrR2	\N	\N	1	2	Wahab	Khurram	\N	\N	\N	2024-05-14 21:46:39	2024-11-08 09:07:13	1	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0
179	Sooraj Sabu	arshadtest12@mailinator.com	91	8646955121112	1	$2y$12$p.I3xR3AKUNCkBbgTuMfBOFiKRQjC2L/wBIOvVAbq6SbEOCN78eMW	\N	\N	1	2	Sooraj	Sabu	\N	\N	\N	2024-10-09 09:29:18	2024-11-08 09:07:13	1	android	\N	252	\N	0	-O8jkCEnHvdpWnB5xFCZ	\N	\N	\N	\N	0
87	Usama Shakeel	ushakeel34@gmail.com	971	33168643	1	$2y$12$WsucoEry9cmbGK9KostF..5w6/s66dRpS3.4ekT0OIsh.wk2/7owq	\N	\N	1	2	Usama	Shakeel	\N	\N	\N	2024-08-20 16:25:06	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	-1680	-O4jjs7H9Tp6X6Lzj16I	\N	\N	\N	\N	0
149	Provider name	p101@gmail.com	971	545454545454	1	$2y$12$e240lyZU7j16wKTnlXyXYu4UUcWCnsGDUE5No58FHBvSjkXEwfMOK	\N	\N	1	3			\N	\N	\N	2024-09-27 12:09:44	2024-11-08 09:07:13	1	iOS	\N	6248E5A7-DA73-462C-8CF2-19F8E3499CEE	\N	0	-O7oTz5AXO7GileGoPWm	\N	\N	\N	\N	0
31	Asad Z	asadz146@gmail.com	92	54123655	1	$2y$12$.8HvCmOOfczS3F.dfx/Ha.3octEyXrwSVP72cvr8APEqbUUidZ5tW	\N	\N	1	2	Asad	Z	\N	\N	\N	2024-05-27 16:58:58	2024-11-08 09:07:13	1	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0
73	test njky	teydu@gmail.com	+971	51681848445	1	$2y$12$NJxgIeyX8L3YiEI5njKfKedz4V2vCw/F3MbZf4tC95Bb6vYE.rPr6	\N	\N	1	2	test	njky	\N	\N	\N	2024-08-12 23:57:23	2024-11-08 09:07:13	1	iOS	\N	CF7E22F7-2383-4D17-BEFB-43BA40F8C46F	\N	0	\N	\N	\N	\N	\N	0
178	Sooraj Sabu	arshadtest1@mailinator.com	91	864695512111	1	$2y$12$U9KAKO2KVaVW0nBObKXmHOlNfESLyDIcaMd9tuOFFcqgTXwkeBncW	\N	\N	1	2	Sooraj	Sabu	\N	\N	\N	2024-10-09 08:38:38	2024-11-08 09:07:13	1	android	\N	252	\N	0	-O8jZb1G_r_J1EFjQqzS	\N	\N	\N	\N	0
89	Hamid	razahamid005@gmail.com	92	3441562581	1	$2y$12$guPtNR1Atlw3XM7BF.fyMeJQvOzWmWz2mLJ68W99m7awLqE.ADiF2	\N	\N	1	3			\N	\N	\N	2024-08-20 17:04:20	2024-11-08 09:07:13	1	ANDROID	\N	599d57ab8f6dbde0	\N	0	-O4jtE34MKkk20Qb18Ko	\N	\N	\N	\N	0
171	Anil	navisanil@gmsil.com	971	555084560	1	$2y$12$eWwOTChJWR/Zu6/r/3wFCOtEY3Ed2sMvqOdbwqDQCxyLsOasGfByO	\N	\N	1	3			\N	\N	\N	2024-10-08 12:03:43	2024-11-08 09:07:13	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	-OAd4KajYvJ9-EWo50G4	\N	\N	\N	\N	0
166	Sooraj Sabu	arshadiqbal.d@gmail.com	91	864695512	1	$2y$12$Qk2mxIJoJd7x8ss/sSKZh.p6KC0J.hD1F73e8.l/T0YdingQG8vTW	\N	\N	1	2	Sooraj	Sabu	\N	\N	\N	2024-10-03 15:29:12	2024-11-08 09:07:13	1	android	\N	252	\N	15	-O8H81WB0d-nyTRzZe8K	\N	\N	\N	\N	0
105	ghh	gb@gb.com	93	51212433484	1	$2y$12$i.DZfVW9dwgNhnPedZbLae6yPoRIubVbNZy6Ag4AyEWA8M6g2fgJi	\N	\N	1	3			\N	\N	\N	2024-08-28 13:55:02	2024-09-24 04:43:16	1	ANDROID	\N	a5666c730607589e	\N	0	-O7WTsGAA5lqgMBzSBUS	feF6-JQVQw2PoXc6hVHPMj:APA91bFPPi1UELmHZT8Nxymd8Fx4Pb5dtOK4XpXDZ6tUwFSRW5KFU7kHxa8pAtwd6XZXHqvFHgmWdA7KdfsEz1kKRYPlpSiLTyOAFxwHgDyAoyowmVPOZ7AdfXvpRUsdhE2fnX0xerdR	\N	\N	\N	0
55	ali	ali@gmail.com	92	666888888888	1	$2y$12$p7Irg.02qgW.dv16k.xMkeT.ShvqumY9AHDhVxJanPmRqhAdutime	\N	\N	1	3	\N	\N	\N	1234	\N	2024-07-22 21:20:33	2024-11-08 09:07:13	1	iOS	\N	13822C6B-D116-4BEA-8B25-6D127B86654A	1074fc3bdbf04f30fe41e0d02e5b7f2e	0	\N	\N	\N	\N	\N	0
48	test three name	test3@gmail.com	971	36985221470	1	$2y$12$evewlTswg9m8wTntm4BPE.BUUoWtfniV.5y9AnL1Nc6Q.5v1p3/Sq	\N	\N	1	3	\N	\N	\N	\N	\N	2024-07-18 14:54:11	2024-11-08 09:07:13	1	ANDROID	\N	507c25ffbc01d8ae	\N	0	\N	\N	\N	\N	\N	0
119	abc	test23@gmail.com	358	849494949	1	$2y$12$.K.HFPhyKIQgZvyn/Ucu2.VLm2avcgioBhUTys/b4m3rGyPkhQKla	\N	\N	1	3			\N	\N	\N	2024-09-03 12:27:05	2024-11-08 09:07:13	1	iOS	\N	2DBAA594-4E15-4641-8594-F2D3DF28A52C	\N	0	\N	\N	\N	\N	\N	0
46	Wahab	vendor2621khurram@gmail.com	92	41236548	1	$2y$12$V7sgBaaR7aOvd3PadmEAoOzi/yjkiSFNcv8I1wl1YDIbLqaCUxxui	\N	\N	1	3	\N	\N	\N	\N	\N	2024-06-03 22:48:04	2024-11-08 09:07:13	1	android	\N	252	\N	0	\N	\N	\N	\N	\N	0
56	Anil	gg@gg.com	971	54648464	1	$2y$12$LZdxzWfEy1.2ZEX5DtlWrOK4TxfbgK2G10qsR.bsiA2H4fKCydGGe	\N	\N	1	3	\N	\N	\N	\N	\N	2024-07-24 09:05:54	2024-11-08 09:07:13	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	0	\N	\N	\N	\N	\N	0
62	sooraj	asd@yopmail.com	91	98478237994	1	$2y$12$YF0Q13o5eZ2ceq6UXU/zU.BDDk4SAzqenLw5PT45weZbzVyhYloIq	\N	\N	1	3	\N	\N	\N	\N	\N	2024-08-08 11:07:57	2024-11-08 09:07:13	1	android	\N	252	\N	0	\N	\N	\N	\N	\N	0
129	Devika	devikasr1995@gmail.com	971	555555582	1	$2y$12$FTtB9B9H6skRSB2j8ZowdOX4s0xbWjrkh1Ayju7Zy7/H5heWrfziq	\N	\N	1	3			\N		\N	2024-09-11 14:08:34	2024-09-24 11:36:44	1	ANDROID	\N	e19e10ee2b97a91c	\N	0	-O6VaEH7s0itYYL7v6I-	fU-xTvifSY6__0to_5R4ba:APA91bHn2u9-bR3HF-4aAYxkFeQWIyCkaOKvn0sFX28a-UMAxboB937BJ_aB3F4obp64CMeUj06UxnQiATna4WwvGRZxCP6QpRbXwjwqymo4BySRkdvH6i-IitzTxGpLG3u0b-J1WLra			\N	0
168	Hamid Raza	hamidiqbalgoraya@gmail.com	92	646464646	1	$2y$12$ex/FKaMEyXxD/F5qVBSXi.8o3IdQK6Co6G1eshMKM7urOZfd/nnZy	\N	\N	1	2	Hamid	Raza	\N	\N	\N	2024-10-07 12:08:46	2024-10-07 12:08:47	1	ANDROID	\N	Asd	\N	0	-O8a0WFZ3tmuavLQxNYd	fFtWOj8kR5OrxvaBZBTsHq:APA91bHljrMnIv0PqqA9oDMtpmRV_-W3PYqKE-PkZZpGxcHUgp8w5FFCcSiTjCZ1fWkMmoM7zPIM4ksEizpGykNmadR_M6O85cI52Msymdcf7_a90DvpJncKOXBeuaNH3NSzauPGHKo1	\N	\N	\N	1
50	Asad	asadz@gmail.com	971	3441560319	1	$2y$12$8nCIzYbJaL56DvQnEXvIcOkgn4HRc8Ac.ihOReCTgMUMjw7vYwFJO	\N	\N	1	3	\N	\N	\N	\N	\N	2024-07-18 15:30:34	2024-11-08 09:07:13	1	ANDROID	\N	Asd	\N	0	\N	\N	\N	\N	\N	0
132	Anil Nav	nmn@gmail.com	971	64646949	1	$2y$12$m7WuIkqTSkyN2wWaVzuNK.vC2myqXIrr7ax1V1k.Zne1ss4aDvpB6	\N	\N	1	2	Anil	Nav	\N	\N	\N	2024-09-11 15:52:43	2024-09-11 15:52:46	1	ANDROID	\N	Asd	\N	0	-O6VvRlq01hQOWw7hUzL	f7RZQVFlRNKT9pxttcq7Bv:APA91bFkPiGBk0U3YTRJ6EAMHFPuVDKJfa3iAl5MZ5RIXkzzI2KyHIB5QXwH90EnDfMbwOEd01CYqtUfYYJwLg758hHWG6Oq8CVSpTVkb5oIA2DcgcJROfMytW20K0lUmybjWuw7GR_K	\N	\N	\N	0
121	abs	test51@gmail.com	358	8484484848	1	$2y$12$F4Dbh6GtJPEbubOV2Ht4O.0lMosPKjYPs/YGBRt1XcGqdZ37sCIlS	\N	\N	1	3			\N	\N	\N	2024-09-03 13:29:09	2024-11-08 09:07:13	1	iOS	\N	2DBAA594-4E15-4641-8594-F2D3DF28A52C	\N	0	\N	\N	\N	\N	\N	0
70	test new	testui@gmail.com	+971	546180407	1	$2y$12$WB06CKfc4VMif9nYipMHwOnwccv6wg7ymSDauIaCpHVV/fH2FYeqm	\N	\N	1	2	test	new	\N	\N	\N	2024-08-12 23:42:22	2024-11-08 09:07:13	1	iOS	\N	CF7E22F7-2383-4D17-BEFB-43BA40F8C46F	\N	0	\N	\N	\N	\N	\N	0
69	test	ztest@gmail.com	971	84845545454	1	$2y$12$ZFTpTfncYxKbSd/qmhkeKuG.SZsrGNDf7mV5eIISPjRpcsxgsiufu	\N	\N	1	3	\N	\N	\N	\N	\N	2024-08-12 19:11:39	2024-11-08 09:07:13	1	iOS	\N	13822C6B-D116-4BEA-8B25-6D127B86654A	\N	0	\N	\N	\N	\N	\N	0
204	Provider	provider001@gmail.com	971	346464644	1	$2y$12$2smsszlZET27TLAej7/0EeVU8WN65Ae0ezvH/9xL7PQAt3M/53LJ.	\N	\N	1	3			\N	\N	\N	2024-10-19 12:18:01	2024-11-08 09:07:13	1	ANDROID	\N	2d92159a1fa92303	\N	0	\N	\N	\N	\N	\N	0
118	aha	test22@gmail.com	358	5454545445	1	$2y$12$f.izyELLPUzLRa5WjX/YBeN2koOkdNno2aVhrwyPZpUg2tJnlC3k2	\N	\N	1	3			\N	\N	\N	2024-09-03 11:03:20	2024-11-08 09:07:13	1	iOS	\N	2DBAA594-4E15-4641-8594-F2D3DF28A52C	\N	0	\N	\N	\N	\N	\N	0
44	Nemai Biswas	u0@mailinator.com	+91	963696217236	1	$2y$12$8cR5avklLv2b0sJ/BeS1SuailGCgZ/26LPJzmtBOY5OqqC4pnEagq	\N	\N	1	2	Nemai	Biswas	\N	\N	\N	2024-05-31 15:52:18	2024-11-08 09:07:13	1	ios	\N	F1863CDF-4994-46E0-B5F9-A371B6BB6AEF	\N	0	\N	\N	\N	\N	\N	0
15	Ahmed Khan	ahmedkhan123@gmail.com	92	6541234	1	$2y$12$ZD57HNkLwyxo3y1FBfxly.Xy8UFLviSHLQoQWtWXMo8nenRjiU2FS	\N	\N	1	3	\N	\N	\N	\N	\N	2024-05-13 10:34:50	2024-11-08 09:07:13	1	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0
174	Arabian Gulf	gfgdfgdfd@gmail.com	971	2555458665	1	$2y$12$GlTT77uMWtAYnzi6V/4hD.PaRybN.r8jZD4vbuJln6BwZyFJc5k16	\N	\N	1	3			\N	\N	\N	2024-10-08 17:48:19	2024-11-08 09:07:13	1	ANDROID	\N	2d92159a1fa92303	\N	0	-O8h1hXxDSCxaHbf_GeB	\N	\N	\N	\N	0
28	Suleman Ali	ib2suleman.ali@gmail.com	92	3126747241	1	$2y$12$P90U2Z9xwvqxi.bt83Wdu.Y5TJWOIHvLY5TSoGKXgOrmLHTKKPitW	\N	\N	1	2	Suleman	Ali	\N	\N	\N	2024-05-25 17:58:36	2024-11-08 09:07:13	1	ios	\N	79F5B631-92F8-4485-9EDC-2092FE5C5248	\N	0	\N	\N	\N	\N	\N	0
144	abc	test700@gmail.com	93	84848484843	1	$2y$12$3r/ABBXC5Gv1O8hpZQIoSuykcPkg3MpHiji8c.m3tb6TeY.Txz4H.	\N	\N	1	3			\N	1111	\N	2024-09-21 00:01:13	2024-11-08 09:07:13	1	iOS	\N	2DBAA594-4E15-4641-8594-F2D3DF28A52C	\N	0	\N	\N	93	848484841234	\N	0
142	Bhadri	badri123@gmail.com	971	525252525	1	$2y$12$N3DTCSQqfY9BkGV99TQMIe2.OxSDXtDFl6d8n2wV3xIBp1ahCchc2	\N	\N	1	3			\N	\N	\N	2024-09-20 13:15:22	2024-09-23 14:32:08	1	iOS	\N	28AA2C8D-2700-470C-8233-6BB2331DE0C6	\N	0	-O7TR3iPSkqv7q7X1rNK	d6JUeS_TxUVJtNwc6-fqa-:APA91bGddXYTfJg-dpFxtl97-Lsx69U8nd9mxURI0GA7dmL9jwfsrAezEbciTZVjxj-bPYlwPzu5XyAls26gGl4u6cHDYW2-bSY435voWWSbINuE9-0TrzRxuc-ROhFXqwHZZqSoDmi_	\N	\N	\N	0
236	anil navis	anil007@gmail.com	971	5464864664	1	$2y$12$spOjaG5HOUFHeDGZq01RSu7iIdpL.9w2ehtNC8sEWgxtViA1CodTi	\N	\N	1	2	anil	navis	\N	7447	\N	2024-11-06 11:49:40	2024-11-07 11:40:08	1	iOS	\N	81D81716-1BB7-486B-8875-57E17BD63AF2	7a02875cbd56213c4dc351ebc64f428e	3110	-OB-RrYDPjE5zOUW6UQo	fwWa_TfR2EfMjSWPVjyPQL:APA91bFikJaHyXwfMahuVyFjifjl6q_JUQMQ0ODETkxmcNZ8aOS0WD6MZxhPK_gpVgu5HgHzjcl3NGLH1696zMCEettY3R13LYic5fXoHWv5Uauo9lbYmJ0	\N	\N	\N	0
203	Sooraj Sabu	soorajsabu117@gmail.com	971	505086058	1	$2y$12$GDNLNfVcr.7vBZ2qILoow.gY6Cq4e0HOu2Ufb9Ab2xn8ZhpQEz/1y	\N	\N	1	2	Sooraj	Sabu	\N	7429	\N	2024-10-19 12:16:07	2024-11-08 09:09:25	1	ANDROID	\N	Asd	05ff5165931d0e2fc19fbfcf5776006b	-16537.5	-O9YqHi6dBPLrzFMCc4E	\N	91	9847823799	\N	1
109	anil na	v1@v1.com	971	546434864	1	$2y$12$3AIzyHMEHMt/S1QOXyd0YeW5ogm.actSNe52RS4ZQ06zwhQIFndji	\N	\N	1	2	anil	na	\N	\N	\N	2024-09-02 11:12:31	2024-09-02 07:18:14	1	iOS	\N	6EA6D416-DA42-428C-825E-3AEF16F25740	\N	-1585.5	-O5l_-Oc7JYgmOfA5jKC	fGDUzPeshESzj5XA1hRvcw:APA91bFoN8qk4zm8c5QLf4HL24nmmwrHcpOkru2iCbwPxNHLGqDM0XJ2baebg0jtB6zuVJKaU3VLzmgiZuOrAuPHMLWXkblYst8Pgh3EYsSWcpGx9VvwWV6NaHrSfMiIe5_F2Yv_TG3z	\N	\N	\N	0
130	Devika	devikaarunavafive@gmail.com	971	552266985	1	$2y$12$ILGn6sAHwfPTWz42nmgGJO2.It.RQnIgF6l5KfskfBoye5HI.uHoa	\N	\N	1	3			\N	\N	\N	2024-09-11 14:26:50	2024-11-08 09:07:13	1	ANDROID	\N	853f83811c6a386b	\N	0	-O6VcQHjJpiH4x6FJsra	\N	\N	\N	\N	0
154	Company Owner Two E	companytest2@gmail.com	92	3095565453	1	$2y$12$pDf289I7Y5MI9AD9DechrOKUcd8cfs/baVwhDoo6Us/O3vRF2akSC	\N	\N	1	3			\N	\N	\N	2024-09-27 22:36:17	2024-11-08 09:07:13	1	ANDROID	\N	c4f068da61c4c474	\N	0	\N	\N	\N	\N	\N	0
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
6	Beer	extra in	66b4a3873be0f_1723114375.jpg	100.00	62	4,2	2024-08-08 14:52:55	2024-08-08 14:54:29	\N
7	Beer	sd	66b4a44c5b6d7_1723114572.jpg	150.00	59	4	2024-08-08 14:56:12	2024-08-08 14:56:12	\N
8	test	Abcs	66bbb52c1bb04_1723577644.jpg	900.00	68	13	2024-08-13 17:28:13	2024-08-13 19:34:04	\N
9	Chocolate cake	The only way I could do that was if you wanted me too but you don’t want me too	66bc1e0e117f1_1723604494.jpg	100.00	68	12	2024-08-14 03:01:34	2024-08-14 03:01:34	\N
11	Happy birthday baloon	Happy Birthday DAD You're My SuperHero Bouquet with Hi-Float and Weigts Balloon Type: Latex/Microfoil with Ultra Hi-Float Balloon Count:3 Regular Foil, and 3 Assorted Happy Birthday latex balloons.	66bf1e217e2cb_1723801121.jpg	10.00	76	6	2024-08-16 09:38:41	2024-08-16 09:38:41	\N
12	Red rose bouquet	Good service to you and your family and I hope you have a great day	66bf20fac7f1f_1723801850.jpg	40.00	76	4	2024-08-16 09:50:50	2024-08-16 09:50:50	\N
13	White and pink rose bouquet	Can you please send me the link to the website for the next two weeks and I will send	66bf214040f55_1723801920.jpg	15.00	76	4	2024-08-16 09:52:00	2024-08-16 09:52:00	\N
14	Red flower	Goonkdkn	66c2c6ccb6229_1724040908.jpg	20.00	76	4	2024-08-19 04:15:08	2024-08-19 04:15:08	\N
10	Red rose	Description hamid	66bdabcd71b42_1723706317.jpg	150.00	60	4,3,6	2024-08-15 07:18:37	2024-08-19 07:26:01	\N
15	abc	Test	66c4b693b58d4_1724167827.jpg	250.00	76	16	2024-08-20 15:30:27	2024-08-20 15:30:27	\N
16	Red Flower	The first time the team had played a match was when	66c4fe2332885_1724186147.jpg	10.00	91	18	2024-08-20 20:35:47	2024-08-20 20:35:47	\N
17	Cup Cakes	Cup Cakes Set of 5	66e1aea4739b3_1726066340.jpg	50.00	133	22	2024-09-11 14:52:20	2024-09-11 14:52:20	\N
18	Flowe Bouqet	Bunch of flowers	66e1aee7e541e_1726066407.jpg	200.00	133	23	2024-09-11 14:53:27	2024-09-11 14:53:27	\N
19	Balloon Decor	1Arch	66e1af1d968a3_1726066461.jpg	100.00	133	21	2024-09-11 14:54:21	2024-09-11 14:54:21	\N
20	Cake Slices	Small cake slices	66e1af4984aba_1726066505.jpg	50.00	133	22	2024-09-11 14:55:05	2024-09-11 14:55:05	\N
21	Bouqet	Bunch	66e802eccb2fa_1726481132.jpeg	200.00	131	4	2024-09-16 10:05:32	2024-09-16 10:05:32	\N
22	Cakes	2kg	66e803454899e_1726481221.jpg	200.00	131	3	2024-09-16 10:07:01	2024-09-16 10:07:01	\N
23	Decor	Bulk	66e803730c257_1726481267.jpg	300.00	131	6	2024-09-16 10:07:47	2024-09-16 10:07:47	\N
24	BOUQUET	Bunch of flowers	66f157551cf47_1727092565.jpg	100.00	129	4	2024-09-23 11:56:05	2024-09-23 11:56:05	\N
25	CAKE	Cake 2kg	66f15780af387_1727092608.jpg	200.00	129	3	2024-09-23 11:56:48	2024-09-23 11:56:48	\N
26	DECORATION	Arch of balloons	66f157a4b9434_1727092644.jpg	200.00	129	6	2024-09-23 11:57:24	2024-09-23 11:57:24	\N
27	Party Decorations	Decorations on full yacht	66f157d03fffb_1727092688.jpg	500.00	129	6	2024-09-23 11:58:08	2024-09-23 11:58:08	\N
28	Food	1 burger + 1 drin	66fbc6b2c4f02_1727776434.jpg	50.00	161	33	2024-10-01 09:53:54	2024-10-01 09:53:54	\N
29	Add on test	This is add on with category test	66fbfc442bc92_1727790148.jpg	500.00	60	35	2024-10-01 13:42:28	2024-10-01 13:42:28	\N
30	Two	Zhnznz	66fbfd308ec75_1727790384.jpg	500.00	60	35	2024-10-01 13:46:24	2024-10-01 13:46:24	\N
31	Flower	Flower Boquet	670660aa90f81_1728471210.jpg	20.00	174	39	2024-10-09 10:53:30	2024-10-09 10:53:30	\N
32	Donut cake	Donut cake	671a1e8836494_1729765000.jpg	140.00	207	42	2024-10-24 10:16:40	2024-10-24 10:16:40	\N
33	Rose Flower Boqute	Rose Flower Boqute	672b5c59ad4bc_1730894937.jpg	40.00	235	44	2024-11-06 12:08:57	2024-11-06 12:08:57	\N
34	White and Pink flower	The only way I could do that was if you	672b5cba6305e_1730895034.jpg	20.00	235	44	2024-11-06 12:10:34	2024-11-06 12:10:34	\N
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
12	37	3
13	49	2
14	50	2
15	51	2
16	51	3
17	52	2
18	52	3
19	53	2
20	64	2
21	64	3
24	66	3
25	67	3
26	67	3
27	68	3
28	68	3
29	70	2
30	70	3
31	71	2
32	71	3
33	72	2
34	72	3
35	73	2
36	73	3
37	74	2
38	74	3
39	75	2
40	75	3
41	76	2
42	76	3
43	77	2
44	77	3
45	78	2
46	78	3
47	79	2
48	79	3
49	80	2
50	80	3
51	81	2
52	81	3
53	82	2
54	82	3
55	83	3
56	84	2
57	84	3
58	85	2
59	85	3
60	86	2
61	86	3
62	87	2
63	87	3
64	88	2
65	88	3
66	89	2
67	89	3
68	90	2
69	90	3
70	91	2
71	91	3
72	92	2
73	92	3
74	94	7
77	124	7
78	124	7
79	124	7
80	124	7
82	122	8
83	122	8
84	121	9
87	121	8
89	125	12
90	125	13
91	126	8
92	126	9
93	128	12
94	129	12
95	129	13
97	130	16
98	147	12
101	138	10
102	150	12
103	151	24
104	151	25
105	151	26
106	151	27
107	149	22
108	152	28
109	160	31
110	159	10
111	159	30
112	161	16
113	163	32
114	164	33
115	164	34
116	166	33
117	166	34
118	167	33
119	167	34
\.


--
-- Data for Name: vendor_package_attach_include; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_package_attach_include (id, vendor_package_id, include_id) FROM stdin;
3	1	5
4	3	2
5	3	4
6	125	6
7	123	7
\.


--
-- Data for Name: vendor_package_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_package_categories (id, vendor_package_id, category_id) FROM stdin;
206	126	1
207	127	3
209	128	3
8	2	1
12	3	2
19	1	1
20	1	4
21	1	5
22	4	1
23	5	3
24	6	3
25	7	3
26	8	3
27	9	1
28	10	1
29	11	1
30	12	2
31	13	5
32	14	5
33	15	5
34	16	5
35	17	3
36	18	1
37	19	3
38	20	3
39	21	3
40	22	3
41	23	4
42	24	1
43	25	3
44	26	3
45	27	3
46	28	3
47	29	3
48	30	3
49	31	1
50	32	1
51	33	3
52	34	1
53	35	3
54	36	1
55	37	3
56	38	1
57	39	3
58	40	3
59	41	3
60	42	3
61	43	3
62	44	3
63	45	3
64	46	3
65	47	3
66	48	3
67	49	3
68	50	3
69	51	3
70	52	3
71	53	3
72	54	1
73	55	3
74	56	3
75	57	1
76	58	3
77	59	3
78	60	3
79	61	3
80	62	1
81	63	3
82	64	3
83	65	3
84	66	1
85	67	3
86	68	3
87	69	4
88	70	3
89	71	3
90	72	3
91	73	3
92	74	4
93	75	3
94	76	4
95	77	3
96	78	4
97	79	4
98	80	4
99	81	3
100	82	5
101	83	3
102	84	5
103	85	4
104	86	4
105	87	4
106	88	3
107	89	5
108	90	1
109	91	5
110	92	3
111	93	3
112	94	1
113	95	3
114	96	1
115	97	1
116	98	2
117	99	2
118	100	5
119	101	5
120	102	5
121	103	4
122	104	4
123	105	5
124	106	2
125	107	4
126	108	5
130	110	3
223	129	4
135	112	3
136	111	3
227	130	5
228	131	3
234	123	1
235	132	3
236	133	3
147	114	3
237	134	3
149	115	5
150	116	3
151	117	3
238	135	3
153	118	3
240	136	3
243	139	3
244	140	3
160	119	1
245	141	3
246	142	3
163	120	3
247	143	4
249	145	4
250	146	3
168	109	4
252	137	3
171	113	1
254	144	1
256	147	3
259	138	1
263	150	1
184	124	3
189	125	1
195	122	5
199	121	4
277	151	5
278	148	3
279	149	3
281	153	4
282	152	4
283	154	3
284	155	3
285	156	3
286	157	1
289	158	3
291	160	3
297	159	3
299	161	3
300	162	3
301	163	3
302	164	1
303	165	1
304	166	3
305	167	4
\.


--
-- Data for Name: vendor_package_facilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_package_facilities (id, vendor_package_id, facility_id) FROM stdin;
240	121	3
241	121	4
242	121	5
243	121	6
244	121	7
245	121	8
12	2	5
13	2	6
14	2	7
15	2	8
16	2	9
26	3	3
27	3	5
28	3	6
31	1	6
35	52	3
36	52	5
37	52	7
38	52	8
39	53	3
40	53	5
41	54	5
42	54	8
43	68	3
44	68	5
45	68	7
46	68	9
47	70	3
48	70	5
49	70	7
50	71	4
51	71	6
52	71	8
53	72	4
54	72	6
55	72	8
56	73	3
57	73	5
58	73	7
59	73	9
60	74	3
61	74	5
62	74	7
63	75	3
64	75	5
65	75	7
66	75	9
71	76	3
72	76	4
73	76	5
74	76	6
75	76	7
76	76	8
77	76	9
78	77	3
79	77	4
80	77	5
81	77	6
82	77	7
83	77	8
84	77	9
85	78	3
86	78	4
87	78	5
88	78	6
89	78	7
90	78	8
91	78	9
92	79	3
93	79	4
94	79	5
95	79	6
96	79	7
97	79	8
98	79	9
113	80	3
114	80	4
115	80	5
116	80	6
117	80	7
118	80	8
119	80	9
120	81	3
121	81	5
122	81	7
123	82	3
124	82	4
125	82	5
126	82	6
127	82	7
128	82	8
129	82	9
130	83	3
131	83	5
132	83	7
133	83	9
134	84	3
135	84	5
136	84	7
137	84	9
138	85	3
139	85	5
140	85	7
141	85	9
142	86	3
143	86	5
144	86	7
145	87	3
146	87	5
147	87	7
148	87	9
149	88	3
150	88	5
151	88	7
152	88	9
153	89	3
154	90	3
155	90	5
156	91	3
157	92	4
158	94	5
159	94	8
160	103	5
161	103	9
162	104	5
163	104	9
164	105	6
165	108	5
166	108	8
167	108	3
172	109	4
176	116	3
177	116	8
178	113	3
179	113	4
180	113	5
181	113	7
182	113	8
186	118	3
187	118	4
188	118	5
189	118	6
190	118	7
191	118	8
208	124	5
209	124	6
210	125	3
211	125	5
212	125	7
213	125	9
258	126	3
259	126	4
224	122	5
225	122	6
226	122	7
227	122	8
260	126	5
261	126	6
262	126	7
263	126	8
264	126	9
267	128	3
268	128	5
269	128	6
280	129	3
281	129	6
282	129	8
291	130	3
292	130	6
293	130	7
294	130	8
295	131	3
296	131	4
297	131	5
298	123	3
299	123	5
300	123	7
301	123	8
302	123	9
310	147	3
311	147	4
312	147	5
313	147	6
314	147	7
315	147	8
316	147	9
326	138	5
327	138	6
342	148	3
343	148	4
344	148	5
345	148	6
346	148	7
347	148	8
348	148	9
355	150	4
356	150	5
357	150	9
364	151	4
365	151	5
366	151	6
367	151	7
368	151	8
369	151	9
370	149	3
371	149	4
372	149	5
373	149	6
374	149	7
375	149	8
376	149	9
377	152	3
378	152	4
379	152	5
380	152	6
381	152	7
382	152	8
383	152	9
384	157	5
385	157	6
386	157	8
387	157	9
388	160	7
389	160	9
400	159	6
401	159	8
402	161	3
403	161	4
404	161	5
405	161	6
406	161	7
407	162	3
408	162	4
409	162	5
410	162	6
411	162	7
412	163	3
413	163	4
414	163	6
415	164	4
416	164	5
417	164	6
418	166	3
419	166	6
420	167	6
421	167	7
422	167	8
423	167	9
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
6	bithday	1	76	2024-08-16 15:25:48	2024-08-16 15:25:48	\N
7	wifi	1	60	2024-08-18 11:58:08	2024-08-18 11:58:08	\N
\.


--
-- Data for Name: vendor_packages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_packages (id, user_id, name, price, what_includes, package_details, departure_info, return_info, additional_info, cancellation_policy, faq_info, help_info, location, starting_point, yatch_id, created_at, updated_at, deleted_at, offer_price, lattitude, longitude, active, sub_title, is_draft, duration, is_published, avg_rating, rated_count) FROM stdin;
12	54	1st Aniversay	6000.00	all	included	\N	\N	\N	\N	\N	\N	6FHM+7XF, Daska, Sialkot, Punjab, Pakistan,	\N	24	2024-07-24 19:14:35	2024-07-24 23:14:35	\N	6000.00	32.22839922500436	74.48498323559761	0	Special day	1	1	0	0	0
2	15	Dubai Marina Yacht Tours and Birthday Package	2500.00	<ul class="activity-highlights__list" style="box-sizing: border-box; border: 0px; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px; margin: 0px; padding: 0px 0px 0px 16px; vertical-align: baseline; list-style-position: outside; list-style-image: initial; color: #1a2b49;" data-test-id="activity-highlights" data-v-72aefa1b="">\r\n<li class="activity-highlights__list-item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline;" data-v-72aefa1b="">Savor fresh assorted sliders and skewers onboard a yacht in the Dubai Marina</li>\r\n<li class="activity-highlights__list-item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline;" data-v-72aefa1b="">Enjoy a selection of club classics played by an onboard DJ</li>\r\n<li class="activity-highlights__list-item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline;" data-v-72aefa1b="">Have the chance to savor unlimited refreshing beverages</li>\r\n<li class="activity-highlights__list-item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline;" data-v-72aefa1b="">Take advantage of the free Wi-Fi connection aboard the boat</li>\r\n<li class="activity-highlights__list-item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline;" data-v-72aefa1b="">Admire the beauty of the Dubai skyline as it is lit for the night</li>\r\n</ul>	<p style="box-sizing: border-box; border: 0px; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px; margin: 0px 0px 2px; padding: 0px; vertical-align: baseline; color: #1a2b49; white-space-collapse: preserve;">Make the most of your time in Dubai with a night-time marina cruise. Sail around the marina and enjoy sweeping views of the city's skyline as it sparkles for the night. Party to hot music on an open deck.</p>\r\n<p style="box-sizing: border-box; border: 0px; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px; margin: 0px 0px 2px; padding: 0px; vertical-align: baseline; color: #1a2b49; white-space-collapse: preserve;">&nbsp;</p>\r\n<p style="box-sizing: border-box; border: 0px; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px; margin: 0px 0px 2px; padding: 0px; vertical-align: baseline; color: #1a2b49; white-space-collapse: preserve;">Meet your host and check-in before boarding the yacht. Set sail and take in highlights like the Jumeirah Beach Residence and the Ain Dubai observation wheel while they are lit up for the night. See the city lights reflected in the water from the ship.</p>\r\n<p style="box-sizing: border-box; border: 0px; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px; margin: 0px 0px 2px; padding: 0px; vertical-align: baseline; color: #1a2b49; white-space-collapse: preserve;">&nbsp;</p>\r\n<p style="box-sizing: border-box; border: 0px; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px; margin: 0px 0px 2px; padding: 0px; vertical-align: baseline; color: #1a2b49; white-space-collapse: preserve;">Listen to chart-topping hits played by a live DJ and dance under the stars on an the open deck. Enjoy some assorted sliders and skewers and choose from a selection of drinks. After the cruise, return to the departure point.</p>\r\n<p style="box-sizing: border-box; border: 0px; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px; margin: 0px 0px 2px; padding: 0px; vertical-align: baseline; color: #1a2b49; white-space-collapse: preserve;">Kindly arrive 30 minutes prior to your scheduled departure time. This will allow you to comfortably check into our lounge, where you can enjoy complimentary WiFi while awaiting the boarding announcement for your yacht excursion. The sliders BBQ Menu includes: Beef sliders Chicken sliders Veggie sliders Mozzarella sticks Veg skewers Corn on the cob</p>	<p><span style="color: #1a2b49; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px;">Board your cruise at the Xclusive Yachts, boarding area in the Dubai Marina. If you're arriving by metro, get off at the DMCC metro station. By taxi, ask to be taken to the Marina Mansion. Once you are in front of Marina Mansion, cross the road and walk towards a ramp next to the bridge. Walk down the ramp, and take a left to the meeting point.</span></p>	<p>No return</p>	<ul class="activity-highlights__list" style="box-sizing: border-box; border: 0px; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px; margin: 0px; padding: 0px 0px 0px 16px; vertical-align: baseline; list-style-position: outside; list-style-image: initial; color: #1a2b49;" data-test-id="activity-highlights" data-v-72aefa1b="">\r\n<li class="activity-highlights__list-item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline;" data-v-72aefa1b="">Savor fresh assorted sliders and skewers onboard a yacht in the Dubai Marina</li>\r\n<li class="activity-highlights__list-item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline;" data-v-72aefa1b="">Enjoy a selection of club classics played by an onboard DJ</li>\r\n<li class="activity-highlights__list-item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline;" data-v-72aefa1b="">Have the chance to savor unlimited refreshing beverages</li>\r\n<li class="activity-highlights__list-item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline;" data-v-72aefa1b="">Take advantage of the free Wi-Fi connection aboard the boat</li>\r\n<li class="activity-highlights__list-item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline;" data-v-72aefa1b="">Admire the beauty of the Dubai skyline as it is lit for the night</li>\r\n</ul>	<p>no cancellation</p>	<p>faq</p>	<div class="activity-important-information__content" style="box-sizing: border-box; border: 0px; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px; margin: 0px 0px 24px; padding: 0px; vertical-align: baseline; color: #1a2b49;" data-v-fe6f5540="">\r\n<p class="activity-important-information__title" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: 1rem; margin: 0px 0px 8px; padding: 0px; vertical-align: baseline; line-height: 1.25rem;" data-v-fe6f5540="">What to bring</p>\r\n<section class="toggle-content" style="box-sizing: border-box; display: flex; flex-direction: column; position: relative; margin-bottom: 8px;" data-v-fe6f5540="" data-v-1740b522="">\r\n<div class="toggle-content__content" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline; display: inline-block; overflow: hidden; white-space-collapse: preserve; max-height: calc(var(--line-clamp-number) * var(--line-clamp-height)); text-overflow: ellipsis; --line-clamp-number: 4; --line-clamp-height: 22px;" data-v-1740b522="">\r\n<ul class="activity-important-information__list to-bring" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px 0px 0px 18px; vertical-align: baseline; list-style-position: outside; list-style-image: initial;" data-v-fe6f5540="">\r\n<li class="activity-important-information__item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline; white-space-collapse: collapse;" data-v-fe6f5540="">Passport</li>\r\n</ul>\r\n</div>\r\n</section>\r\n</div>\r\n<div class="activity-important-information__content" style="box-sizing: border-box; border: 0px; font-family: 'GT Eesti', 'fallback for GT Eesti', sans-serif; font-size: 16px; margin: 0px 0px 24px; padding: 0px; vertical-align: baseline; color: #1a2b49;" data-v-fe6f5540="">\r\n<p class="activity-important-information__title" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: 1rem; margin: 0px 0px 8px; padding: 0px; vertical-align: baseline; line-height: 1.25rem;" data-v-fe6f5540="">Know before you go</p>\r\n<section class="toggle-content" style="box-sizing: border-box; display: flex; flex-direction: column; position: relative; margin-bottom: 8px;" data-v-fe6f5540="" data-v-1740b522="">\r\n<div class="toggle-content__content" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline; display: inline-block; overflow: hidden; white-space-collapse: preserve; max-height: calc(var(--line-clamp-number) * var(--line-clamp-height)); text-overflow: ellipsis; --line-clamp-number: 4; --line-clamp-height: 22px;" data-v-1740b522="">\r\n<ul class="activity-important-information__list good-to-know" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px 0px 0px 18px; vertical-align: baseline; list-style-position: outside; list-style-image: initial;" data-v-fe6f5540="">\r\n<li class="activity-important-information__item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline; white-space-collapse: collapse;" data-v-fe6f5540="">Yacht selection will vary depending on weather conditions and/or capacity requirements</li>\r\n<li class="activity-important-information__item" style="box-sizing: border-box; border: 0px; font-family: inherit; font-size: inherit; font-weight: inherit; margin: 0px; padding: 0px; vertical-align: baseline; white-space-collapse: collapse;" data-v-fe6f5540="">This tour is for those aged 21 years and above</li>\r\n</ul>\r\n</div>\r\n</section>\r\n</div>	Dubai International Airport (DXB) - Dubai - United Arab Emirates	\N	5	2024-05-13 11:10:26	2024-05-13 11:18:05	\N	1200.00	25.2566932	55.36431779999999	1	\N	0	1	0	0	0
13	54	Name	6000.00	included	details	\N	\N	\N	\N	\N	\N	6FHM+7XF, Daska, Sialkot, Punjab, Pakistan,	\N	24	2024-07-24 19:19:28	2024-07-24 23:19:28	\N	6000.00	32.22839922500436	74.48498323559761	0	description	1	1	0	0	0
14	54	Package	6000.00	includded	detaila	\N	\N	\N	\N	\N	\N	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	\N	24	2024-07-25 07:36:34	2024-07-25 11:36:34	\N	6000.00	32.230764583167144	74.48610372841358	0	descriptio.	1	1	0	0	0
4	50	Package 1	250.00	what incude	pakcage details	\N	\N	\N	\N	\N	\N	thodupuzha	\N	21	2024-07-18 13:57:31	2024-07-18 17:57:31	\N	250.00	98.2545454	96.515454	0	short description	1	1	0	0	0
5	54	Hamid	250.00	what incude	pakcage details	\N	\N	\N	\N	\N	\N	thodupuzha	\N	24	2024-07-24 10:04:16	2024-07-24 14:04:16	\N	250.00	98.2545454	96.515454	0	short description	1	1	0	0	0
15	54	Package	6000.00	includded	detaila	\N	\N	\N	\N	\N	\N	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	\N	24	2024-07-25 07:37:49	2024-07-25 11:37:49	\N	6000.00	32.230764583167144	74.48610372841358	0	descriptio.	1	1	0	0	0
6	54	Lover	25000.00	included everything	derails test	\N	\N	\N	\N	\N	\N	5 Abi Al Sedeeq Al Naji St - Al Falaj - Al Riqa Suburb - Sharjah - United Arab Emirates,	\N	24	2024-07-24 17:53:07	2024-07-24 21:53:07	\N	25000.00	25.35434691988301	55.43305043131113	0	Beautiful Place For Love	1	1	0	0	0
7	54	Package	2500.00	included	package details	\N	\N	\N	\N	\N	\N	673C+W8V - Dubai - United Arab Emirates,	\N	24	2024-07-24 17:58:45	2024-07-24 21:58:45	\N	2500.00	25.204849237091366	55.27078282088041	0	Description	1	1	0	0	0
8	54	Package	2500.00	included	package details	\N	\N	\N	\N	\N	\N	673C+W8V - Dubai - United Arab Emirates,	\N	24	2024-07-24 17:58:54	2024-07-24 21:58:54	\N	2500.00	25.204849237091366	55.27078282088041	0	Description	1	1	0	0	0
9	54	1st Birthday	6000.00	all included	details	\N	\N	\N	\N	\N	\N	6FMP+78C, Dugri Hinduan, Sialkot, Punjab, Pakistan,	\N	24	2024-07-24 19:07:30	2024-07-24 23:07:30	\N	6000.00	32.23223510154121	74.48501475155354	0	For New One	1	1	0	0	0
10	54	1st Birthday	6000.00	all included	details	\N	\N	\N	\N	\N	\N	6FMP+78C, Dugri Hinduan, Sialkot, Punjab, Pakistan,	\N	24	2024-07-24 19:08:27	2024-07-24 23:08:27	\N	6000.00	32.23223510154121	74.48501475155354	0	For New One	1	1	0	0	0
11	54	2nd Birthday	3500.00	included	yes	\N	\N	\N	\N	\N	\N	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	\N	24	2024-07-24 19:11:13	2024-07-24 23:11:13	\N	3500.00	32.23071239847134	74.4860577955842	0	for new one	1	1	0	0	0
16	54	Package	6000.00	includded	detaila	\N	\N	\N	\N	\N	\N	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	\N	24	2024-07-25 07:38:23	2024-07-25 11:38:23	\N	6000.00	32.230764583167144	74.48610372841358	0	descriptio.	1	1	0	0	0
17	8	test	400.00	Abv	Abc	\N	\N	\N	\N	\N	\N	G486+865, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-07-29 16:45:40	2024-07-29 20:45:40	\N	400.00	33.51596547150588	33.51596547150588	0	abc	1	1	0	0	0
18	8	rtest	250.00	what incude	pakcage details	\N	\N	\N	\N	\N	\N	thodupuzha	\N	18	2024-07-29 16:56:26	2024-07-29 20:56:26	\N	250.00	98.2545454	96.515454	0	short description	1	1	0	0	0
19	8	anccand	250.00	Test	Test	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-29 17:04:35	2024-07-29 21:04:35	\N	250.00	33.51608759427626	33.51608759427626	0	vvv	1	1	0	0	0
20	8	test	100.00	Bhh	Yes	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-29 17:06:24	2024-07-29 21:06:24	\N	100.00	33.51607964468917	33.51607964468917	0	whh	1	1	0	0	0
21	8	test	200.00	Tested	Tyy	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-29 17:09:36	2024-07-29 21:09:36	\N	200.00	33.51608993226115	33.51608993226115	0	ggg	1	1	0	0	0
22	8	test	250.00	Yyy	Trst	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-29 17:11:07	2024-07-29 21:11:07	\N	250.00	33.51608107404825	33.51608107404825	0	test	1	1	0	0	0
23	8	res	250.00	I’m	Hyy	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-29 17:12:35	2024-07-29 21:12:35	\N	250.00	33.51606251665457	33.51606251665457	0	ree	1	1	0	0	0
24	8	abv	100.00	Abc	Test	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-29 17:33:32	2024-07-29 21:33:32	\N	100.00	33.5160811833148	33.5160811833148	0	test	1	1	0	0	0
25	8	ab	100.00	Bbaba	B a. A	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-29 17:50:59	2024-07-29 21:50:59	\N	100.00	33.51606468633403	33.51606468633403	0	ha	1	1	0	0	0
26	8	test	100.00	Test	Test	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-29 18:02:56	2024-07-29 22:02:56	\N	100.00	33.516096226542054	33.516096226542054	0	tws	1	1	0	0	0
27	8	abc	100.00	Anv	Test	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-29 18:22:44	2024-07-29 22:22:44	\N	100.00	33.51607529439526	33.51607529439526	0	test	1	1	0	0	0
28	8	test	100.00	Abc	Jww	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-29 18:36:52	2024-07-29 22:36:52	\N	100.00	33.51611271986177	33.51611271986177	0	test	1	1	0	0	0
29	8	tst	100.00	Test	Test	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-07-29 18:45:33	2024-07-29 22:45:33	\N	100.00	33.51610638117492	33.51610638117492	0	test	1	1	0	0	0
30	8	abc	100.00	Test	Test	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-29 19:17:49	2024-07-29 23:17:49	\N	100.00	33.51602768380107	33.51602768380107	0	test	1	1	0	0	0
31	8	test	100.00	Abc	Abc	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-29 21:18:48	2024-07-30 01:18:48	\N	100.00	33.51607093226565	33.51607093226565	0	abc	1	1	0	0	0
32	8	sff	100.00	Yyy	Vvv	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-29 21:46:39	2024-07-30 01:46:39	\N	100.00	33.516033761489254	33.516033761489254	0	ff	1	1	0	0	0
33	8	bab	200.00	Hah	Ba	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-29 21:49:47	2024-07-30 01:49:47	\N	200.00	33.51604178211199	33.51604178211199	0	haha	1	1	0	0	0
34	8	hg	100.00	Hh	Bbb	\N	\N	\N	\N	\N	\N	HWMV+86 Raucourt-et-Flaba, France	\N	18	2024-07-29 22:21:50	2024-07-30 02:21:50	\N	100.00	33.51605241429047	33.51605241429047	0	hh	1	1	0	0	0
35	8	kk	100.00	Hhh	Hhh	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-29 22:26:10	2024-07-30 02:26:10	\N	100.00	33.516058969849965	33.516058969849965	0	nn	1	1	0	0	0
36	8	ii	108.00	Bbb	Hh	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-29 22:35:59	2024-07-30 02:35:59	\N	108.00	33.516088529453675	33.516088529453675	0	nj	1	1	0	0	0
37	8	test	100.00	Bac	Abc	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-30 17:46:47	2024-07-30 21:46:47	\N	100.00	33.51608013741069	33.51608013741069	0	test	1	1	0	0	0
38	8	abc	100.00	Abc	Test	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-30 19:31:14	2024-07-30 23:31:14	\N	100.00	33.516099725822414	33.516099725822414	0	tyt	1	1	0	0	0
39	8	avx	200.00	Yyy	Ggg	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-30 19:35:32	2024-07-30 23:35:32	\N	200.00	33.51607566240598	33.51607566240598	0	gg	1	1	0	0	0
40	8	tes	100.00	Abc	Anc	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-30 19:37:30	2024-07-30 23:37:30	\N	100.00	33.51607998690887	33.51607998690887	0	test	1	1	0	0	0
41	8	test	100.00	Anc	Avc	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-30 19:39:53	2024-07-30 23:39:53	\N	100.00	33.51607197790972	33.51607197790972	0	test	1	1	0	0	0
42	8	test	100.00	Anc	Avc	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-30 19:42:34	2024-07-30 23:42:34	\N	100.00	33.51607197790972	33.51607197790972	0	test	1	1	0	0	0
43	8	tes	200.00	Ggg	Hhg	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-30 19:48:52	2024-07-30 23:48:52	\N	200.00	33.51606912420903	33.51606912420903	0	tr	1	1	0	0	0
44	8	tes	20.00	Hhg	Vvv	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-30 19:53:45	2024-07-30 23:53:45	\N	20.00	33.51607842876191	33.51607842876191	0	ff	1	1	0	0	0
45	8	abc	100.00	Test	Test	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-30 20:01:13	2024-07-31 00:01:13	\N	100.00	33.5160951056622	33.5160951056622	0	test	1	1	0	0	0
46	8	tsst	100.00	Abc	Abc	\N	\N	\N	\N	\N	\N	G486+865, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-07-30 20:04:34	2024-07-31 00:04:34	\N	100.00	33.51593209012229	33.51593209012229	0	test	1	1	0	0	0
47	8	tsst	100.00	Abc	Abc	\N	\N	\N	\N	\N	\N	G486+865, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-07-30 20:05:09	2024-07-31 00:05:09	\N	100.00	33.51593209012229	33.51593209012229	0	test	1	1	0	0	0
48	8	test	100.00	Abc	Abc	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-30 20:07:42	2024-07-31 00:07:42	\N	100.00	33.516077922065136	33.516077922065136	0	twst	1	1	0	0	0
49	8	abc	100.00	Abc	Abc	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-30 20:11:25	2024-07-31 00:11:25	\N	100.00	33.516092124294566	33.516092124294566	0	bab	1	1	0	0	0
50	8	abc	100.00	Bwsh	Bss	\N	\N	\N	\N	\N	\N	G486+865, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-07-30 20:28:13	2024-07-31 00:28:13	\N	100.00	33.51592705325851	33.51592705325851	0	test	1	1	0	0	0
51	8	bav	100.00	Test	Test	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-30 20:30:42	2024-07-31 00:30:42	\N	100.00	33.51601622531931	33.51601622531931	0	haha	1	1	0	0	0
52	8	te sy	200.00	Abc	Haha	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-30 20:42:01	2024-07-31 00:42:01	\N	200.00	33.516059111115915	33.516059111115915	0	twst	1	1	0	0	0
53	8	test	100.00	Anc	Ba	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-07-30 21:05:05	2024-07-30 21:05:38	\N	100.00	33.516043465205705	33.516043465205705	0	test	0	1	0	0	0
54	59	Birthday test from sooraj	250.00	what incude	pakcage details	\N	\N	\N	\N	\N	\N	thodupuzha	\N	28	2024-08-06 06:23:35	2024-08-06 06:50:14	\N	250.00	98.2545454	96.515454	0	short description	0	5	0	0	0
55	60	Destination Weding	20000.00	balloons	package details	\N	\N	\N	\N	\N	\N	673C+W8V - Dubai - United Arab Emirates,	\N	29	2024-08-06 17:47:38	2024-08-09 00:54:47	2024-08-09 00:54:47	20000.00	25.204849237091366	55.27078282088041	0	this is for destination	1	5	0	0	0
56	60	Destination Wedding 02	25000.00	package includes	package details	\N	\N	\N	\N	\N	\N	576R+G4 - Dubai - United Arab Emirates,	\N	29	2024-08-07 08:24:35	2024-08-09 00:54:52	2024-08-09 00:54:52	25000.00	25.161475123266055	55.2901104837656	0	this is description	1	10	0	0	0
58	8	test 1	200.00	Abxjjj	Test	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 15:27:19	2024-08-07 19:27:19	\N	100.00	33.51609939581396	33.51609939581396	0	abc	1	5	0	0	0
59	8	test	500.00	Svv	Advf	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-08-07 15:31:29	2024-08-07 19:31:29	\N	200.00	33.51605977590526	33.51605977590526	0	abc	1	5	0	0	0
60	8	abc	200.00	Abc	Abc	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-08-07 16:07:34	2024-08-07 20:07:34	\N	100.00	33.5160628313852	33.5160628313852	0	test	1	5	0	0	0
61	8	test	100.00	Test	Test	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-08-07 16:11:32	2024-08-07 20:11:32	\N	50.00	33.51607235960856	33.51607235960856	0	trtt	1	2	0	0	0
62	8	test	2500.00	Yy	Test	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-08-07 16:14:06	2024-08-07 20:14:06	\N	200.00	33.51606562279535	33.51606562279535	0	ddd	1	2	0	0	0
63	8	qbc	100.00	Nab	Yest	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-08-07 16:23:24	2024-08-07 20:23:24	\N	50.00	33.516081802535034	33.516081802535034	0	test	1	5	0	0	0
64	8	twst	100.00	Gas	Test	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-08-07 16:34:11	2024-08-07 20:34:11	\N	500.00	33.51607917830395	33.51607917830395	0	test	1	2	0	0	0
65	8	test	200.00	Abc	Abc	\N	\N	\N	\N	\N	\N	G485+PQW, Islamabad, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 17:04:07	2024-08-07 21:04:07	\N	100.00	33.516764760312334	33.516764760312334	0	abc	1	5	0	0	0
66	8	abc	200.00	Test	Test	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-08-07 17:08:05	2024-08-07 21:08:05	\N	100.00	33.51606052657433	33.51606052657433	0	test	1	5	0	0	0
67	8	test	200.00	Test	Test	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-08-07 17:12:48	2024-08-07 21:12:48	\N	300.00	33.51605822358256	33.51605822358256	0	yrdd	1	5	0	0	0
68	8	abc	100.00	Yes	Test	\N	\N	\N	\N	\N	\N	G486+P6, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 17:47:04	2024-08-07 21:47:04	\N	50.00	33.51704360110777	33.51704360110777	0	test	1	5	0	0	0
70	8	test	100.00	Ff	Yu	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 19:19:13	2024-08-07 23:19:13	\N	500.00	33.51616393839982	33.51616393839982	0	ggg	1	5	0	0	0
71	8	test	100.00	Tedt	Tested	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 19:36:47	2024-08-07 23:36:47	\N	50.00	33.516126781213714	33.516126781213714	0	test	1	5	0	0	0
72	8	test	500.00	Test	Abc	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-08-07 19:47:55	2024-08-07 23:47:55	\N	250.00	33.516114537474486	33.516114537474486	0	abc	1	5	0	0	0
73	8	ab	200.00	Hahs	Hha	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 19:55:49	2024-08-07 23:55:49	\N	100.00	33.51613361153364	33.51613361153364	0	bash	1	5	0	0	0
74	8	test	250.00	Abc	Baba	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 20:03:51	2024-08-08 00:03:51	\N	100.00	33.516159239670664	33.516159239670664	0	test	1	5	0	0	0
75	8	test	250.00	Abc	Abc	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 20:17:11	2024-08-08 00:17:11	\N	30.00	33.51615019583573	33.51615019583573	0	abc	1	5	0	0	0
76	8	test	200.00	Ggg	Vvv	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 20:20:05	2024-08-08 00:20:05	\N	100.00	33.516131327825626	33.516131327825626	0	ui	1	2	0	0	0
77	8	tesr	200.00	Hhhh	Hhh	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 20:25:54	2024-08-08 00:25:54	\N	50.00	33.51618786599353	33.51618786599353	0	gg	1	5	0	0	0
78	8	test	100.00	Hh	Test	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 20:28:28	2024-08-08 00:28:28	\N	50.00	33.51616539654276	33.51616539654276	0	gbj	1	5	0	0	0
79	8	aba	100.00	Test	Test	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 20:37:17	2024-08-08 00:37:17	\N	50.00	33.51612726187229	33.51612726187229	0	bash	1	2	0	0	0
80	8	abc	500.00	Test	Test	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 20:40:44	2024-08-08 00:40:44	\N	250.00	33.51627416173946	33.51627416173946	0	basb	1	6	0	0	0
81	8	abc	250.00	Babba	Basnsb	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 20:48:09	2024-08-08 00:48:09	\N	200.00	33.516123811344066	33.516123811344066	0	behe	1	6	0	0	0
82	8	abc	200.00	Test	Test	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 20:51:52	2024-08-08 00:51:52	\N	100.00	33.51613569519429	33.51613569519429	0	test	1	9	0	0	0
83	8	aba	250.00	Te  at	Test	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 21:02:53	2024-08-08 01:02:53	\N	100.00	33.5162764071899	33.5162764071899	0	bab	1	8	0	0	0
84	8	baa	200.00	Test	Test	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 21:06:03	2024-08-08 01:06:03	\N	100.00	33.51611447719471	33.51611447719471	0	ba	1	8	0	0	0
85	8	abc	200.00	Test	Test	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 21:08:13	2024-08-08 01:08:13	\N	100.00	33.516275949718406	33.516275949718406	0	baba	1	8	0	0	0
86	8	test	200.00	Test	Abc	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 21:19:27	2024-08-08 01:19:27	\N	100.00	33.5162695111422	33.5162695111422	0	yest	1	8	0	0	0
87	8	ddd	100.00	Ggg	Bbb	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 21:34:02	2024-08-08 01:34:02	\N	50.00	33.51612842993893	73.11083362120985	0	drr	1	8	0	0	0
88	8	reee	100.00	Tested	Testing	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 21:40:28	2024-08-08 01:40:28	\N	50.00	33.516186127190366	73.11083379101395	0	test	1	6	0	0	0
89	8	test	200.00	Test	Test	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	18	2024-08-07 21:52:45	2024-08-08 01:52:45	\N	100.00	33.51627506704559	73.11087717899456	0	gwsh	1	3	0	0	0
90	8	abc	500.00	Te sy	Hahaaha	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-08-07 22:05:17	2024-08-08 02:05:17	\N	300.00	33.51607967231729	73.1108089107671	0	hash	1	5	0	0	0
91	8	bassh	100.00	Babwbw	Babbawb	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-08-07 22:07:54	2024-08-08 02:07:54	\N	50.00	33.51603366569088	73.11079832518178	0	gaa	1	8	0	0	0
94	59	Birthday test from sooraj	250.00	what incude	pakcage details	\N	\N	\N	\N	\N	\N	thodupuzha	\N	28	2024-08-08 10:45:30	2024-08-08 14:59:19	\N	100.00	98.2545454	96.515454	0	short description	0	5	1	0	0
92	8	tes	200.00	Yrer	Teer	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	18	2024-08-07 22:13:56	2024-08-08 20:03:15	2024-08-08 20:03:15	100.00	33.51605450028254	73.11079695639748	0	dcc	1	5	0	0	0
95	60	Destination Weding 010	25000.00	includes	details	\N	\N	\N	\N	\N	\N	673C+W8V - Dubai - United Arab Emirates,	\N	29	2024-08-08 20:24:40	2024-08-09 00:53:08	2024-08-09 00:53:08	2000.00	25.204849237091366	55.27078282088041	0	desrcupyion	1	25	0	0	0
57	60	Birthday test from sooraj	250.00	what incude	pakcage details	\N	\N	\N	\N	\N	\N	thodupuzha	\N	29	2024-08-07 08:57:54	2024-08-09 00:54:42	2024-08-09 00:54:42	250.00	98.2545454	96.515454	0	short description	1	5	0	0	0
69	60	New Year	3500.00	includes	details	\N	\N	\N	\N	\N	\N	673C+W8V - Dubai - United Arab Emirates,	\N	29	2024-08-07 18:11:26	2024-08-09 00:54:57	2024-08-09 00:54:57	300.00	25.204849237091366	55.27078282088041	0	description	1	5	0	0	0
96	60	First Package	25000.00	ballons	cele	\N	\N	\N	\N	\N	\N	673C+W8V - Dubai - United Arab Emirates,	\N	29	2024-08-08 20:56:17	2024-08-09 01:05:46	2024-08-09 01:05:46	3000.00	25.204849237091366	55.27078282088041	0	short description	1	5	0	0	0
98	60	Annnj	57576.00	hsbs	usjsjs	\N	\N	\N	\N	\N	\N	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	\N	29	2024-08-08 21:18:23	2024-08-09 01:21:33	2024-08-09 01:21:33	666.00	32.230767986515836	74.48610372841358	0	shsh	1	67	0	0	0
97	60	Birthday	3444.00	ballons	events	\N	\N	\N	\N	\N	\N	673C+W8V - Dubai - United Arab Emirates,	\N	29	2024-08-08 21:11:08	2024-08-09 01:21:36	2024-08-09 01:21:36	123.00	25.204849237091366	55.27078282088041	0	short	1	25	0	0	0
101	60	Usjz	6767.00	hsjz	bzbz	\N	\N	\N	\N	\N	\N	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	\N	29	2024-08-08 21:41:13	2024-08-09 01:48:55	2024-08-09 01:48:55	1213.00	32.23076656845388	74.48610741645098	0	zbzh	1	9797	0	0	0
99	60	Anniversir	7667.00	hshs	zjjsjs	\N	\N	\N	\N	\N	\N	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	\N	29	2024-08-08 21:22:10	2024-08-09 01:49:00	2024-08-09 01:49:00	64.00	32.230760896205915	74.4861013814807	0	zbz	1	7976	0	0	0
100	60	Package	4646.00	hshs	hjsjs	\N	\N	\N	\N	\N	\N	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	\N	29	2024-08-08 21:32:52	2024-08-09 01:49:06	2024-08-09 01:49:06	64.00	32.23072771354821	74.48608126491308	0	descriptuon	1	7979	0	0	0
102	60	Paxkages	575.00	jsjss	shsjsj	\N	\N	\N	\N	\N	\N	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	\N	29	2024-08-08 22:00:07	2024-08-09 21:48:33	2024-08-09 21:48:33	5.00	32.23079946748511	74.48611982166767	0	hshs	1	7676	0	0	0
103	60	Jsjs	347567.00	zhjz	xjjzjz	\N	\N	\N	\N	\N	\N	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	\N	29	2024-08-08 22:02:46	2024-08-09 21:48:38	2024-08-09 21:48:38	4646.00	32.230772240701505	74.48611043393612	0	zhhz	1	34664	0	0	0
104	60	Zhha	7646.00	jsnsnsns	jsjsjs	\N	\N	\N	\N	\N	\N	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	\N	29	2024-08-09 17:46:30	2024-08-09 21:48:44	2024-08-09 21:48:44	6464.00	32.2306987850675	74.48605678975582	0	jsjs	0	494	0	0	0
108	60	Ksjsjs	7676.00	shahabs	sushshsj	\N	\N	\N	\N	\N	\N	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	\N	29	2024-08-09 20:10:17	2024-08-10 00:41:40	2024-08-10 00:41:40	676.00	32.230675528831235	74.48605343699455	0	sjzjzj	1	6776	0	0	0
106	60	Full Aniversary Package	25000.00	injded	details	\N	\N	\N	\N	\N	\N	673C+W8V - Dubai - United Arab Emirates,	\N	29	2024-08-09 19:49:49	2024-08-10 00:41:44	2024-08-10 00:41:44	20000.00	25.204849237091366	55.27078282088041	0	this is short description	1	2	0	0	0
107	60	Sjzjzj	6776.00	shhshs	zjhzjsjs	\N	\N	\N	\N	\N	\N	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	\N	29	2024-08-09 20:06:31	2024-08-10 00:41:50	2024-08-10 00:41:50	6464.00	32.2306888586259	74.48605109006166	0	zhzhhz	1	797	0	0	0
105	60	Valentines Day Yatch Package	36700.00	all included here and I have to get back in time to see how much it is and I'll let him get it out and he can go back home and see what she says to you when we go out for a meal and a meal and then I will have the tea in my bed for a bit so I'll have a shower with the shower now so I'll get back in time ⏲️ 😌 ☺️ 😊 😴 🤪 is the only thing that I think is the best way to do this and I was just trying it for me but it wasn't the same thing so we had	hahaha ha 😆 not even a good idea 🤣 I don't know if I have the same or wrong 😅 I don't want it in my room and you have a good mood and you have a good day 😊 😄 ☺️ and I will hope 😊 in see get I you 😊 a go do the it 😊 of it to	\N	\N	\N	\N	\N	\N	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	\N	29	2024-08-09 17:50:46	2024-08-10 00:41:54	2024-08-10 00:41:54	4000.00	32.23075494034517	74.48609735816717	0	this is short description for this	0	25	0	0	0
93	63	Marriage Celebration	2000.00	no	no	\N	\N	\N	\N	\N	\N	9FGG+WQ, Muzaffarabad,	\N	30	2024-08-08 07:29:26	2024-08-18 11:00:16	\N	1800.00	34.37903741043802	73.47673751413822	0	na	1	5	0	0	0
110	8	Hineymoon@	2000.00	not appear, check that you don't already have the same app installed from the AppStore.\n\nIf an app with the same bundle identifier is already installed on the device from the AppStore, nothing will happen.	not appear, check that you don't already have the same app installed from the AppStore.\n\nIf an app with the same bundle identifier is already installed on the device from the AppStore, nothing will happen.	\N	\N	\N	\N	\N	\N	114 2C St - Al Bada'a - Dubai - United Arab Emirates	\N	27	2024-08-10 08:16:39	2024-08-10 12:16:39	\N	2000.00	25.287109378873552	55.371278398516324	0	gehs	1	12	0	0	0
112	63	Abc	669.00	gagga	gagag	\N	\N	\N	\N	\N	\N	9FGG+WQ, Muzaffarabad,	\N	32	2024-08-12 18:14:49	2024-08-12 22:14:49	\N	555.00	34.37903768714816	73.47674824297428	0	cagaga	1	54545	0	0	0
111	63	Merrage Organizations	2000.00	bahah	hah	\N	\N	\N	\N	\N	\N	9FGG+WQ, Muzaffarabad,	\N	30	2024-08-12 06:57:30	2024-08-12 21:58:42	\N	1800.00	\N	\N	0	babba	1	5	0	0	0
109	60	Updated	123.00	included	details	\N	\N	\N	\N	\N	\N	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	\N	29	2024-08-09 20:42:50	2024-08-15 10:06:01	2024-08-15 10:06:01	12.00	\N	\N	0	updated	1	5	0	0	0
117	68	av	200.00	Sbc	Abb	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	31	2024-08-13 15:14:04	2024-08-13 19:14:04	\N	100.00	33.51612221696055	73.11082185033958	0	gh	1	5	0	0	0
118	68	av	200.00	Sbc	Abb	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	31	2024-08-13 15:14:16	2024-08-13 15:16:31	\N	100.00	33.51612221696055	73.11082185033958	0	gh	1	5	0	0	0
128	76	Summer Marriarge Pakagr	2000.00	Cake| Fresh Juice | Burger	For me the same thing and that it was the only 💯 😴 🙃 😪 😌 🙂 💯 😴 🙃	\N	\N	\N	\N	\N	\N	88CX+69P - Al Mamzar Beach St - Al Mamzar - Dubai - United Arab Emirates,	\N	35	2024-08-17 05:48:41	2024-08-18 12:06:46	\N	1500.00	25.320738904432016	55.34916266798973	1	married to a friend who was sold on a bright vision and	0	3	1	0	0
114	69	ha	500.00	Wha	Ba	\N	\N	\N	\N	\N	\N	JX4X+44W, Street 13, Friends Colony, Rawalpindi, Punjab 46000, Pakistan	\N	33	2024-08-13 05:36:36	2024-08-13 08:21:02	\N	200.00	33.60517219037254	72.99780826797445	0	ha	1	5	0	0	0
113	68	Honymoon Dubai	2000.00	Experience a personalized touch: We will make sure not to miss even the minute details when designing the holiday packages to suit your personal preferences. Thus, the holidays we create always carry a personalized touch in them.	Our 24-hour team of travel consultants will assist you every step of your way both before and after booking your holiday.	\N	\N	\N	\N	\N	\N	79WH+8VP - Amman St - Al Nahda - Al Nahda 2 - Dubai - United Arab Emirates	\N	31	2024-08-13 02:41:54	2024-08-21 12:20:41	\N	1500.00	\N	\N	1	Relax with your partner in an underwater spa treatment, dining options at an all-glass underwater restaurant, dance in an underwater nightclub	1	2	0	0	0
115	68	Valentine dubai	200.00	It originated as a Christian feast day honoring a martyr named Valentine It originated as a Christian feast day honoring a martyr named Valentine	It originated as a Christian feast day honoring a martyr named Valentine, and through later folk traditions it has also become a significant cultural, religious ..	\N	\N	\N	\N	\N	\N	4584+2F Dubai - United Arab Emirates	\N	31	2024-08-13 07:45:38	2024-08-21 12:20:41	\N	100.00	25.184172173623946	55.26026068222577	1	It originated as a Christian feast day honoring a martyr named Valentine	1	2	0	0	0
116	68	ggg	200.00	Hshhs	Hannah’s	\N	\N	\N	\N	\N	\N	57Q7+WHQ - Business Bay - Dubai - United Arab Emirates	\N	31	2024-08-13 08:00:25	2024-08-13 15:12:10	\N	180.00	25.184172173623946	55.26026068222577	0	vh	1	2	0	0	0
119	68	test	100.00	Abc	Abc	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	31	2024-08-13 15:24:39	2024-08-13 15:53:14	\N	50.00	33.51618763112733	73.1108296123699	0	test	1	8	0	0	0
121	68	zain	500.00	Ghh	Ggg	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	31	2024-08-13 15:54:28	2024-08-26 08:30:16	\N	250.00	\N	\N	0	abc	0	5	0	0	0
120	63	Merriage	3000.00	10 ballons, 2 cakes, 3 booky	its a premium package that provide services of even planning	\N	\N	\N	\N	\N	\N	9FGG+WQ, Muzaffarabad,	\N	30	2024-08-13 15:42:30	2024-08-13 16:12:00	\N	2800.00	\N	\N	0	even planners for merraige	1	4	0	0	0
122	68	test	100.00	An	Test	\N	\N	\N	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	\N	31	2024-08-13 19:43:27	2024-08-16 10:56:53	\N	50.00	\N	\N	0	ab	1	8	0	0	0
148	133	Marriage Celebration	10000.00	Cake,Balloons	\N	\N	\N	\N	\N	\N	\N	348R+RRW - Jumeirah Lake Towers - JLT Cluster J - Dubai - United Arab Emirates	\N	62	2024-09-11 14:57:04	2024-10-01 15:42:24	\N	9000.00	25.067114548476003	55.14206696301699	1	Celebrating your marriage at the center of sea	1	2	1	0	0
124	59	Test	120.00	hhhh	ghhh	\N	\N	\N	\N	\N	\N	VM42+V4, Panakyachal, Kerala 685583, India,	\N	28	2024-08-15 08:49:18	2024-08-15 09:11:24	\N	100.00	\N	\N	0	short	1	2	0	0	0
1	4	Package for couples	120.00	<p><span style="color: #7a7a7a; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px;">Dinner | Brunch | Lunch</span></p>	<p><span style="color: #7a7a7a; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px;">What could be more indulgent than brining a private chef aboard your private yacht charter for the ultimate dinner cruise, brunch cruise or lunch cruise?&nbsp; After booking, our galley crew will work with you to create the perfect custom 4-course menu for your event.&nbsp; Whether you want pasta and shellfish, grilled fillet or something more veggie, our chefs have got you covered.</span></p>	<p><span style="color: #7a7a7a; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px;">What could be more indulgent than brining a private chef aboard your private yacht charter for the ultimate dinner cruise, brunch cruise or lunch cruise?&nbsp; After booking, our galley crew will work with you to create the perfect custom 4-course menu for your event.&nbsp; Whether you want pasta and shellfish, grilled fillet or something more veggie, our chefs have got you covered.</span></p>	<p><span style="color: #7a7a7a; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px;">What could be more indulgent than brining a private chef aboard your private yacht charter for the ultimate dinner cruise, brunch cruise or lunch cruise?&nbsp; After booking, our galley crew will work with you to create the perfect custom 4-course menu for your event.&nbsp; Whether you want pasta and shellfish, grilled fillet or something more veggie, our chefs have got you covered.</span></p>	<p><span style="color: #7a7a7a; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px;">What could be more indulgent than brining a private chef aboard your private yacht charter for the ultimate dinner cruise, brunch cruise or lunch cruise?&nbsp; After booking, our galley crew will work with you to create the perfect custom 4-course menu for your event.&nbsp; Whether you want pasta and shellfish, grilled fillet or something more veggie, our chefs have got you covered.</span></p>	<p><span style="color: #7a7a7a; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px;">What could be more indulgent than brining a private chef aboard your private yacht charter for the ultimate dinner cruise, brunch cruise or lunch cruise?&nbsp; After booking, our galley crew will work with you to create the perfect custom 4-course menu for your event.&nbsp; Whether you want pasta and shellfish, grilled fillet or something more veggie, our chefs have got you covered.</span></p>	<p><span style="color: #7a7a7a; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px;">What could be more indulgent than brining a private chef aboard your private yacht charter for the ultimate dinner cruise, brunch cruise or lunch cruise?&nbsp; After booking, our galley crew will work with you to create the perfect custom 4-course menu for your event.&nbsp; Whether you want pasta and shellfish, grilled fillet or something more veggie, our chefs have got you covered.</span></p>	<p><span style="color: #7a7a7a; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px;">What could be more indulgent than brining a private chef aboard your private yacht charter for the ultimate dinner cruise, brunch cruise or lunch cruise?&nbsp; After booking, our galley crew will work with you to create the perfect custom 4-course menu for your event.&nbsp; Whether you want pasta and shellfish, grilled fillet or something more veggie, our chefs have got you covered.</span></p>	dubai	\N	2	2024-04-18 02:50:35	2024-08-16 17:12:48	\N	100.00	25.204819	55.270931	1	Package for couples	0	1	0	0	0
3	8	Gathering Party	2000.00	<p><span style="color: #1d3466; font-family: Poppins, sans-serif; letter-spacing: 0.4992px;">20 balloons (10 white | 10 Pink) 1 Cake (2KG)</span></p>	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	663Q+25V - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates	\N	4	2024-05-14 14:44:33	2024-08-16 19:31:33	\N	1500.00	25.202528042224237	55.23835825372313	1	sub	0	1	0	0	0
126	68	newTest	200.00	Abc	Abc	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	36	2024-08-16 19:03:04	2024-08-16 19:03:51	\N	100.00	33.515952085093396	73.11073913908557	0	abc	0	5	0	0	0
127	68	Honeymoon Pakahr	200.00	2 Cake | 3 Bouquet | 3 Grill	The driver is not available to view any room for the following week and we have a few more energy to go to our next meeting with you	\N	\N	\N	\N	\N	\N	Mamzar, Beach 5-1 - Al Mamzar - Dubai - United Arab Emirates,	\N	31	2024-08-17 05:36:14	2024-08-21 12:20:47	\N	150.00	25.304956654114996	55.349237099289894	1	gym is the opposite and only a half of my heart	1	2	0	0	0
147	76	MARR	5000.00	Cakes	Marriage	\N	\N	\N	\N	\N	\N	34JQ+7W7 - Dubai Marina - Dubai - United Arab Emirates,	\N	63	2024-09-11 14:22:28	2024-09-11 18:59:04	\N	4000.00	\N	\N	1	Dream marriage	0	2	0	0	0
125	76	Baby Girl Birthday	300.00	<p>Baloon | Cakes | Flowers | Decorations</p>	<p>While there are many places to rent a yacht in Dubai, you can choose a yacht rental with a suitable location for you. The Marina's in Dubai include Yacht Club Dubai Marina, Pier 7, Dubai Harbour, Dubai Marina Walk, Dubai Creek Golf &amp; Yacht Club, Marasi Marina, Bulgari Hotel &amp; Resorts and Jumeirah. Dubai Marina is a popular choice for those looking to rent a yacht, however, all Marina's in Dubai offer stunning views of the city.</p>\r\n<p>&nbsp;</p>	<p><strong style="margin: 0px; padding: 0px; color: #000000; font-family: 'Open Sans', Arial, sans-serif; text-align: justify;">Lorem Ipsum</strong><span style="color: #000000; font-family: 'Open Sans', Arial, sans-serif; text-align: justify;">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>	<p><strong style="margin: 0px; padding: 0px; color: #000000; font-family: 'Open Sans', Arial, sans-serif; text-align: justify;">Lorem Ipsum</strong><span style="color: #000000; font-family: 'Open Sans', Arial, sans-serif; text-align: justify;">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>	<p><strong style="margin: 0px; padding: 0px; color: #000000; font-family: 'Open Sans', Arial, sans-serif; text-align: justify;">Lorem Ipsum</strong><span style="color: #000000; font-family: 'Open Sans', Arial, sans-serif; text-align: justify;">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>	<p><strong style="margin: 0px; padding: 0px; color: #000000; font-family: 'Open Sans', Arial, sans-serif; text-align: justify;">Lorem Ipsum</strong><span style="color: #000000; font-family: 'Open Sans', Arial, sans-serif; text-align: justify;">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>	<p><strong style="margin: 0px; padding: 0px; color: #000000; font-family: 'Open Sans', Arial, sans-serif; text-align: justify;">Lorem Ipsum</strong><span style="color: #000000; font-family: 'Open Sans', Arial, sans-serif; text-align: justify;">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>	<p><strong style="margin: 0px; padding: 0px; color: #000000; font-family: 'Open Sans', Arial, sans-serif; text-align: justify;">Lorem Ipsum</strong><span style="color: #000000; font-family: 'Open Sans', Arial, sans-serif; text-align: justify;">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>	Building No.6, Ground Floor, Main Road - The Palm Jumeirah - Dubai - United Arab Emirates,	\N	35	2024-08-15 14:10:35	2024-08-18 12:08:12	\N	200.00	25.204819	55.270931	1	Enjoy baby girl birthday for the yesr	1	3	1	0	0
132	75	J	666.00	Fgh	Ghh	\N	\N	\N	\N	\N	\N	J3M5+R27, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	\N	34	2024-08-26 11:42:26	2024-08-26 15:42:43	2024-08-26 15:42:43	6.00	33.63466767865999	73.0578163638711	0	jjj	1	633	0	0	0
133	111	Bride to Be	3500.00	\N	\N	\N	\N	\N	\N	\N	\N	442 Al Meena St - Zayed Port - Al Mina - Abu Dhabi - United Arab Emirates	\N	4	2024-09-02 11:42:22	2024-09-02 17:31:24	2024-09-02 17:31:24	3000.00	24.514781950000195	54.38234328999998	0	\N	1	3	1	0	0
130	91	Just Married	2000.00	1 Cake | Welcome Drinks | Music	Book yacht today enjoy our watersports jetski dubai, banana ride, donut ride & water slide. Book your party yacht with us & get free Water sports, bbq, speaker and more.	\N	\N	\N	\N	\N	\N	34GJ+597 - Jumeirah Beach Residence - Dubai - United Arab Emirates	\N	42	2024-08-20 20:52:04	2024-08-21 18:55:27	\N	1500.00	25.07712709999999	55.13332399999999	1	After tapping the "Install" button in the popup, if nothing seems to happen and you are on this page, check your device's home screen: the installation	0	2	1	0	0
135	115	Honeymoon Package	1500.00	Decoration | Cakes | Chocolates | Beverages	The only way I could do that was if you wanted me too but you don’t uunderstand how to use the phone so you don’t know what I’m doing and you know	\N	\N	\N	\N	\N	\N	MARITIME Dubai - مدينة دبي الملاحية - دبي - United Arab Emirates	\N	53	2024-09-03 03:02:02	2024-09-03 07:02:02	\N	1200.00	25.27236940781223	55.2636706084013	0	The The Big Lie was the most important thing in our lives today that was the most powerful thing that happened in our lives in a short period and it is what it was and I am proud to be part and proud	1	1	0	0	0
131	68	Pk	5568.00	Bhgvd	Vvv	\N	\N	\N	\N	\N	\N	673C+W8V - Dubai - United Arab Emirates,	\N	31	2024-08-22 11:15:13	2024-08-22 15:26:50	2024-08-22 15:26:50	58.00	25.204849237091366	55.27078282088041	0	nbb	0	5	0	0	0
134	60	rr	500.00	Ft	Fre	\N	\N	\N	\N	\N	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	\N	47	2024-09-02 15:36:26	2024-09-13 17:32:34	2024-09-13 17:32:34	50.00	33.51599447771851	73.11076125739547	0	Rt	1	2	0	0	0
139	116	ahahaa	50.00	Wns	Bss	\N	\N	\N	\N	\N	\N	JX4X+542, Street 13, Friends Colony, Rawalpindi, Punjab 46000, Pakistan	\N	54	2024-09-03 06:46:57	2024-09-03 10:46:57	\N	25.00	33.60507661868996	72.9977791017119	0	Bas	1	2	0	0	0
140	116	baa	50.00	Bas	Ba	\N	\N	\N	\N	\N	\N	JX4X+542, Street 13, Friends Colony, Rawalpindi, Punjab 46000, Pakistan	\N	54	2024-09-03 06:48:21	2024-09-03 10:48:21	\N	23.00	33.60515186148974	72.99784090577877	0	Hash	1	2	0	0	0
141	117	bBa	50.00	Bas	S	\N	\N	\N	\N	\N	\N	JX4X+542, Street 13, Friends Colony, Rawalpindi, Punjab 46000, Pakistan	\N	55	2024-09-03 06:58:39	2024-09-03 10:58:39	\N	23.00	33.605153345464146	72.9978325715522	0	Bas	1	5	0	0	0
142	118	aan	500.00	An	Ba	\N	\N	\N	\N	\N	\N	JX4X+542, Street 13, Friends Colony, Rawalpindi, Punjab 46000, Pakistan	\N	56	2024-09-03 08:24:55	2024-09-03 12:24:55	\N	25.00	33.60518584187911	72.99781440925904	0	Baa	1	5	0	0	0
143	119	test	500.00	Ba	Bas	\N	\N	\N	\N	\N	\N	JX4X+43W, Street 13, Friends Colony, Rawalpindi, Punjab 46000, Pakistan	\N	57	2024-09-03 08:29:46	2024-09-03 12:29:46	\N	60.00	33.605082421294746	72.99763096243481	0	Gas	1	5	0	0	0
145	121	basb	50.00	Sb	Sab	\N	\N	\N	\N	\N	\N	JX4X+542, Street 13, Friends Colony, Rawalpindi, Punjab 46000, Pakistan	\N	59	2024-09-03 09:31:59	2024-09-03 13:31:59	\N	25.00	33.60514456092802	72.9978262733032	0	Baba	1	5	0	0	0
146	123	Honeymoon weekend	1500.00	Cake | Flowers |	The first time the two sides agreed to meet on a single day was the day before a summit in Beijing in March that was expected in Beijing and was to take build of the first round in Beijing on May to be completed in a few weeks time to avoid the two	\N	\N	\N	\N	\N	\N	665R+3J8 - Jumeirah - Dubai - United Arab Emirates	\N	60	2024-09-03 12:23:14	2024-09-03 16:23:14	\N	1000.00	25.20788578103105	55.241608433425434	0	The first time the team had played a match was when they yyyyy	1	2	0	0	0
144	120	test	50.00	S	Bs	\N	\N	\N	\N	\N	\N	JX4X+542, Street 13, Friends Colony, Rawalpindi, Punjab 46000, Pakistan	\N	58	2024-09-03 09:23:35	2024-09-03 13:40:44	\N	25.00	33.605152686472564	72.99784010525042	0	Test	1	8	0	0	0
136	60	Hamid	2500.00	All	All	\N	\N	\N	\N	\N	\N	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	\N	47	2024-09-03 06:12:02	2024-09-13 17:32:31	2024-09-13 17:32:31	300.00	\N	\N	0	test	1	2	0	0	0
137	60	test	50.00	Bab	Ba	\N	\N	\N	\N	\N	\N	masjid Ibrahim, 595 Street 2, nmbr2, Rawalpindi, Punjab 46000, Pakistan	\N	47	2024-09-03 06:20:08	2024-09-13 17:32:22	2024-09-13 17:32:22	25.00	33.611699530763275	73.00663210451603	0	Abc	1	2	0	0	0
129	76	New Eve Pacake	2000.00	1 Cake | 1 Coktail | 1 Beer	The only way I could do that was if you wanted me too but you yyyyyyyy have a problem with me I just don’t want to be around you and I don’t	\N	\N	\N	\N	\N	\N	449V+2J Dubai - United Arab Emirates	\N	35	2024-08-19 09:52:24	2024-09-13 08:18:21	\N	1500.00	25.18417317269935	55.260259944919206	1	its good pakage for young couplea	1	2	1	0.20512820512820512	39
138	60	abc	50.00	Abc	Test	\N	\N	\N	\N	\N	\N	JX4X+542, Street 13, Friends Colony, Rawalpindi, Punjab 46000, Pakistan	\N	47	2024-09-03 06:25:25	2024-10-01 14:04:48	2024-10-01 14:04:48	30.00	\N	\N	1	Test	0	2	1	4	1
123	60	Birthday Package	2500.00	all included yesbs usjsjs shsjjsjsjsjs sjsjkssn sjsjsjsjsjsjs Also include validation. Start time should be less than end time for all slots	all included yesbs usjsjs shsjjsjsjsjs sjsjkssn sjsjsjsjsjsjs Also include validation. Start time should be less than end time for all slots	<p><strong>all included</strong>&nbsp;<em>yesbs usjsjs</em>&nbsp;shsjjsjsjsjs sjsjkssn sjsjsjsjsjsjs Also include validation. Start time should be less than end time for all slots</p>	<p><strong>all included</strong>&nbsp;<em>yesbs usjsjs</em>&nbsp;shsjjsjsjsjs sjsjkssn sjsjsjsjsjsjs Also include validation. Start time should be less than end time for all slots</p>	<p><strong>all included</strong>&nbsp;<em>yesbs usjsjs</em>&nbsp;shsjjsjsjsjs sjsjkssn sjsjsjsjsjsjs Also include validation. Start time should be less than end time for all slots</p>	<p><strong>all included</strong>&nbsp;<em>yesbs usjsjs</em>&nbsp;shsjjsjsjsjs sjsjkssn sjsjsjsjsjsjs Also include validation. Start time should be less than end time for all slots</p>	<p><strong>all included</strong>&nbsp;<em>yesbs usjsjs</em>&nbsp;shsjjsjsjsjs sjsjkssn sjsjsjsjsjsjs Also include validation. Start time should be less than end time for all slots</p>	<p><strong>all included</strong>&nbsp;<em>yesbs usjsjs</em>&nbsp;shsjjsjsjsjs sjsjkssn sjsjsjsjsjsjs Also include validation. Start time should be less than end time for all slots</p>	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	\N	29	2024-08-15 06:07:54	2024-09-13 17:32:26	2024-09-13 17:32:26	2000.00	\N	\N	0	included cake	1	3	1	0.2857142857142857	14
155	60	Test	200.00	Shsjjs	Jsjsjsj	\N	\N	\N	\N	\N	\N	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	\N	47	2024-10-01 10:02:25	2024-10-01 14:04:53	2024-10-01 14:04:53	100.00	32.230738207210514	74.48609232902527	0	short	1	5	0	0	0
149	131	Dream Wedding	10000.00	Cake	Wedding,Proposals,wedding reception	\N	\N	\N	\N	\N	\N	685V+GG - Ras Al Khor - Dubai Creek Harbour - Dubai - United Arab Emirates,	\N	64	2024-09-16 10:02:55	2024-10-01 15:42:14	\N	5000.00	\N	\N	1	you can now make your dream wedding real	1	3	1	2.5	2
150	76	test	25.00	\N	\N	\N	\N	\N	\N	\N	\N	6865+JR Dubai - United Arab Emirates	\N	63	2024-09-23 08:04:25	2024-10-01 15:42:18	\N	30.00	25.211524377014992	55.30952665954828	0	\N	1	25	0	0	0
151	129	Date With Your Right Partner	3000.00	1 Cake 1 kg	You can have a couple dating in the yacht with a romantic atmosphere	\N	\N	\N	\N	\N	\N	685V+GG - Ras Al Khor - Dubai Creek Harbour - Dubai - United Arab Emirates,	\N	65	2024-09-23 10:26:50	2024-09-24 06:26:52	\N	2500.00	\N	\N	0	You can have a couple dating in the yacht with a romantic atmosphere	1	1	0	0	0
154	161	D@Marriage	5008.00	Food And cake	Dream Come Tre	\N	\N	\N	\N	\N	\N	57M6+P43 - Business Bay - Dubai - United Arab Emirates	\N	68	2024-10-01 10:02:23	2024-10-01 14:13:06	\N	3000.00	25.184172571248187	55.26028588313138	1	Marriage	1	2	0	0	0
156	60	Paxkafe	24545.00	Hshsbs	Shjsjs	\N	\N	\N	\N	\N	\N	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	\N	47	2024-10-01 10:06:10	2024-10-03 15:18:27	2024-10-03 15:18:27	6464.00	32.2307469991969	74.48609936982393	1	short	1	25	0	0	0
153	160	Santa Party	5000.00	Cakes\nDrinks\nFood	Make your new year eve special	\N	\N	\N	\N	\N	\N	685V+GG - Ras Al Khor - Dubai Creek Harbour - Dubai - United Arab Emirates,	\N	67	2024-10-01 09:35:59	2024-10-01 14:17:37	\N	2400.00	25.20956388650037	55.34308075904846	1	Santa Party	1	1	0	0	0
152	161	New Santa Party	5000.00	Cake\nDrinks\nFood	Make your new year eve special	\N	\N	\N	\N	\N	\N	685V+GG - Ras Al Khor - Dubai Creek Harbour - Dubai - United Arab Emirates	\N	68	2024-10-01 09:35:57	2024-10-01 14:17:42	\N	2400.00	25.20956388650037	55.34308075904846	1	New Santa Party	1	1	0	0	0
158	60	Paxkage	200.00	Dhdhhs	Sjjsjs	\N	\N	\N	\N	\N	\N	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	\N	47	2024-10-01 13:44:17	2024-10-03 15:18:32	2024-10-03 15:18:32	3.00	\N	\N	0	short	1	2	0	0	0
157	159	Happiest Birthday 123	8000.00	<p>Cake 2 kg</p>	<p>Cake 2 kg</p>	<p>Cake 2 kg</p>	<p>Cake 2 kg</p>	<p>Cake 2 kg</p>	<p>Cake 2 kg</p>	<p>Cake 2 kg</p>	<p>Cake 2 kg</p>	685V+GG - Ras Al Khor - Dubai Creek Harbour - Dubai - United Arab Emirates	\N	69	2024-10-01 10:07:38	2024-10-07 10:07:18	\N	6000.00	25.20956388650037	55.34308075904846	1	Birthday Function	0	2	0	0	0
159	60	Marriage Package	30.00	Vshs	Xbzb	\N	\N	\N	\N	\N	\N	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	\N	47	2024-10-04 11:28:05	2024-10-10 14:29:18	\N	20.00	32.230737639985534	74.48609970510006	1	this should not show	0	1	1	4	1
160	174	Marriage package for Asians	2000.00	<p>1 Cake | Welcome Drink | Veg Meal</p>	<p>ter tapping the "Install" button in the popup, if nothing seems to happen and you are on this page, check your device's home screen: the installation should be in progress: you should see the icon of</p>	<p>ter tapping the "Install" button in the popup, if nothing seems to happen and you are on this page, check your device's home screen: the installation should be in progress: you should see the icon of</p>	<p>ter tapping the "Install" button in the popup, if nothing seems to happen and you are on this page, check your device's home screen: the installation should be in progress: you should see the icon of</p>	<p>ter tapping the "Install" button in the popup, if nothing seems to happen and you are on this page, check your device's home screen: the installation should be in progress: you should see the icon of</p>	<p>ter tapping the "Install" button in the popup, if nothing seems to happen and you are on this page, check your device's home screen: the installation should be in progress: you should see the icon of</p>	<p>ter tapping the "Install" button in the popup, if nothing seems to happen and you are on this page, check your device's home screen: the installation should be in progress: you should see the icon of</p>	<p>ter tapping the "Install" button in the popup, if nothing seems to happen and you are on this page, check your device's home screen: the installation should be in progress: you should see the icon of</p>	57M6+P43 - Business Bay - Dubai - United Arab Emirates	\N	71	2024-10-09 10:50:34	2024-10-09 14:58:38	\N	2000.00	25.184153243119567	55.26029969309111	1	ter tapping the "Install" button in the popup, if nothing seems to happen and you are on this page, check your device's home screen: the installation should be in progress: you should see the icon of	0	2	1	0	0
163	207	Birthday Pakage	2000.00	1 Cake | 1 Flower Boquet | Welcome Drink	Enjoy Boatanza’s catering services. Savor gourmet meals prepared by our skilled chefs, using only the finest ingredients. Whether it’s a light brunch or a lavish dinner under the stars, our culinary offerings are sure to delight your palate.	\N	\N	\N	\N	\N	\N	56XG+VP Dubai - United Arab Emirates	\N	73	2024-10-24 10:10:51	2024-10-24 14:18:40	\N	1500.00	25.199743971671936	55.22687237709761	1	Book the brand new 92ft yacht in Dubai, Model 2022 and fully refitted this year 2024, offering unique design and spacious luxury for up to 35 guests. Perfect for large groups seeking an amazing sea experience with modern amenities and expert crew service.	0	2	1	0	0
161	91	Test	1000.00	<p>Gdfjdgh</p>	<p>Ttddt</p>	<p>asdasdas</p>	<p>asdfasdasda</p>	<p>asdfsdfsdf</p>	<p>sfsdf</p>	<p>dfsdf</p>	<p>gsdfsd</p>	VM42+V4, Panakyachal, Kerala 685583, India,	\N	42	2024-10-19 11:04:52	2024-10-21 11:25:12	\N	800.00	9.85655061090992	76.6510896384716	0	tdx	1	2	1	0	0
164	235	Birthday Package	1200.00	Barbecue | Cocktail | Softdrinks	BBQ Catering or Fine dining on a yacht? We work with the best chefs who love to Barbeque and famous private chefs which prepare the most delicious food there is. For a full 5 star restaurant feeling on a yacht!	\N	\N	\N	\N	\N	\N	67G3+7P2 - Jumeirah - Al Barsha 3 - Dubai - United Arab Emirates	\N	74	2024-11-06 12:14:18	2024-11-06 18:54:25	\N	1000.00	25.226005790392048	55.25415480136871	1	Are you striving to find an amazing venue to celebrate your birthday, but nothing is coming to mind? Search no more; Dubriani has got you covered. We are here to give you an amazing idea to celebrate your birthday in style with your loved ones.	0	2	1	0	0
162	91	Couple Goal	1500.00	<p>Food</p>	<p>Package.detail text</p>	<p>hfgtfrgtr</p>	<p>hjghghfghyfg</p>	<p>jkhjghjgjhg</p>	<p>knjkhjghfgh</p>	<p>khjkhjihjuhju</p>	<p>jhugjgfh</p>	673C+W8V - Dubai - United Arab Emirates,	\N	72	2024-10-22 04:26:35	2024-10-22 11:39:52	\N	1000.00	25.204849237091366	55.27078282088041	1	short describe	0	2	1	0	0
165	239	burthday package	2500.00	Rules	\N	\N	\N	\N	\N	\N	\N	79J4+55 Dubai - United Arab Emirates	\N	75	2024-11-06 14:33:48	2024-11-06 18:55:03	\N	1900.00	25.280469583312332	55.3554060043965	0	Hi	1	2	0	0	0
167	235	New.year pakage	2000.00	1 Cake | Baloon	The only way I could do that was if you wanted me too but you don’t want me	\N	\N	\N	\N	\N	\N	22 Al Kitab St - Al Bahyah - New Al Bahia - Abu Dhabi - United Arab Emirates	\N	74	2024-11-15 17:37:25	2024-11-15 21:38:59	\N	1200.00	24.545752314848475	54.62827004492283	1	The only way I could do that was if you wanted me too I could come and pick	0	2	1	0	0
166	235	Marriage@pakage	2000.00	Cocktail | Softdrink	The first time the two sides agreed to meet on a single day was when they agreed on the first time that a	\N	\N	\N	\N	\N	\N	FJ38+W56 - Al Rahah - Al Zeina - Abu Dhabi - United Arab Emirates	\N	74	2024-11-15 17:26:09	2024-11-15 21:31:12	\N	1000.00	24.454681190009687	54.61509738117456	1	The only way I could do that was if you	0	2	1	0	0
\.


--
-- Data for Name: vendor_user_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_user_details (id, user_id, username, logo, trade_license, date_of_birth, lattitude, longitude, location_name, account_type, company_name, family_name, nationality, hear_about_us_id, gender, is_represent, rep_name, rep_email, rep_dial_code, rep_phone, created_at, updated_at, profile_picture) FROM stdin;
1	4	\N	6636338e8a86e_1714828174.jpg	6636338e8dc91_1714828174.pdf	\N	234235	34365645	Al Safa St Downtown Dubai - Dubai United Arab Emirates	company	Party Cruise	\N	\N	\N	\N	1	Anil	anilnavis@gmail.com	358	34564564646	2024-04-05 07:20:18	2024-05-04 17:09:34	\N
2	7	marwanuae	\N	\N	1971-12-25	25.205906219113306	55.24406599450682	277 Jumeirah St - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates	individual	\N	Marwan Family	98	20	male	0	\N	\N	\N	\N	2024-05-05 16:20:40	2024-05-05 16:20:40	\N
3	8	\N	66378a50aab48_1714915920.png	66378a50ac13c_1714915920.pdf	\N	25.0671146	55.1420671	348R+RR Dubai - United Arab Emirates	company	Royal Yatch	\N	\N	\N	\N	1	Khalfan	khalfan@gmail.com	93	45747776	2024-05-05 17:32:00	2024-05-05 17:32:00	\N
4	11	wahabfun22	\N	\N	1993-05-19	0	0	no location	individual	\N	Khurram	164	16	male	0	\N	\N	\N	\N	2024-05-12 12:38:15	2024-05-12 12:38:15	\N
33	86	hamid002@gmail.com	\N	\N	\N	0	0	no location	individual	\N	sabu	1	1	male	0	\N	\N	\N	\N	2024-08-20 16:18:39	2024-08-20 16:18:39	\N
41	110	gg@gg.com	\N	\N	\N	0	0	no location	individual	\N	gyh	229	1	male	0	\N	\N	\N	\N	2024-09-02 14:43:35	2024-09-02 14:43:35	\N
42	111	fj-hamad@hotmail.com	\N	\N	\N	0	0	no location	individual	\N	Test	229	20	female	0	\N	\N	\N	\N	2024-09-02 15:40:15	2024-09-02 15:40:15	\N
34	89	razahamid006@gmail.com	\N	\N	\N	0	0	no location	individual	\N	Raza	164	1	female	0	\N	\N	\N	\N	2024-08-20 17:04:20	2024-08-20 17:08:47	\N
5	12	\N	664080d1d1943_1715503313.jpg	\N	\N	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	company	Ibm 5	\N	\N	\N	\N	1	Abdul Wahab	wahabfun22@gmail.com	92	32145655	2024-05-12 12:40:34	2024-05-12 14:15:19	\N
6	14	abdulkhan	\N	\N	1994-05-10	0	0	no location	individual	\N	Khans	164	2	male	0	\N	\N	\N	\N	2024-05-13 10:19:22	2024-05-13 10:19:47	\N
7	15	\N	6641b48a69d74_1715582090.png	\N	\N	25.2566932	55.36431779999999	Dubai International Airport (DXB) - Dubai - United Arab Emirates	company	Oxy Zen	\N	\N	\N	\N	1	Khan Ahmed	wahab3333@gmail.com	92	6547894	2024-05-13 10:34:50	2024-05-13 10:34:50	\N
8	17	\N	664317c809264_1715673032.jpg	664317c80a8b9_1715673032.jpg	\N	22.5743545	88.3628734	H9F7+P4X, Calcutta University, College Square, Kolkata, West Bengal 700012, India	company	Elite Diamond	\N	\N	\N	\N	0	\N	\N	\N	\N	2024-05-14 11:50:32	2024-05-14 11:50:32	\N
9	33	wahabvendor223	\N	\N	1993-04-06	0	0	no location	individual	\N	Khurram	1	1	male	0	\N	\N	\N	\N	2024-05-28 09:09:53	2024-05-28 09:09:53	\N
10	45	hunain_88	\N	\N	2024-06-03	0	0	no location	individual	\N	Developer	229	4	male	0	\N	\N	\N	\N	2024-06-03 13:07:06	2024-06-03 13:07:06	\N
11	46	wahabvendor2231	\N	\N	\N	0	0	no location	individual	\N	Khurram	1	1	male	0	\N	\N	\N	\N	2024-06-03 22:48:04	2024-06-03 22:48:04	\N
12	47	moin2	\N	\N	\N	0	0	no location	individual	\N	abc	1	1	male	0	\N	\N	\N	\N	2024-06-04 00:55:04	2024-06-04 00:55:04	\N
13	48	test_three_name	\N	\N	1993-04-06	0	0	no location	individual	\N	family three	229	7	male	0	\N	\N	\N	\N	2024-07-18 14:54:11	2024-07-18 14:54:11	\N
14	49	test_four_username	\N	\N	1993-04-06	0	0	no location	individual	\N	family four	229	6	male	0	\N	\N	\N	\N	2024-07-18 14:59:32	2024-07-18 14:59:32	\N
15	50	asadz14	\N	\N	1993-04-06	0	0	no location	individual	\N	Nazir	229	2	male	0	\N	\N	\N	\N	2024-07-18 15:30:34	2024-07-18 15:30:34	\N
19	54	razahamid67	\N	\N	1993-04-06	0	0	no location	individual	\N	Hamid	164	1	female	0	\N	\N	\N	\N	2024-07-22 10:04:32	2024-07-22 10:04:32	\N
20	55	ali	\N	\N	\N	0	0	no location	individual	\N	test	164	1	male	0	\N	\N	\N	\N	2024-07-22 21:20:33	2024-07-22 21:20:33	\N
21	56	anilnavis@gmail.com	\N	\N	\N	0	0	no location	individual	\N	hjsj	98	1	female	0	\N	\N	\N	\N	2024-07-24 09:05:54	2024-07-24 09:05:54	\N
22	59	soorajdev	\N	\N	\N	0	0	no location	individual	\N	sabu	1	1	male	0	\N	\N	\N	\N	2024-08-06 10:21:49	2024-08-06 10:21:49	\N
24	62	soorajdevss	\N	\N	\N	0	0	no location	individual	\N	sabu	1	1	male	0	\N	\N	\N	\N	2024-08-08 11:07:57	2024-08-08 11:07:57	\N
25	63	abcz14	\N	\N	1993-04-06	0	0	no location	individual	\N	Asad	164	2	male	0	\N	\N	\N	\N	2024-08-08 11:18:52	2024-08-08 11:18:52	\N
27	69	zain	\N	\N	\N	0	0	no location	individual	\N	zain	164	1	male	0	\N	\N	\N	\N	2024-08-12 19:11:39	2024-08-12 19:11:39	\N
28	75	usama	\N	\N	1993-04-06	0	0	no location	individual	\N	Usama	164	1	male	0	\N	\N	\N	\N	2024-08-14 15:05:36	2024-08-14 15:05:36	\N
26	68	navis@navis.com	\N	\N	1993-08-12	0	0	no location	individual	\N	navisfamily	229	2	male	0	\N	\N	\N	\N	2024-08-10 09:02:30	2024-08-17 08:56:40	\N
30	79	\N	66c2cc18b72c4_1724042264.png	\N	\N	25.1000998	55.2380812	462Q+26 Dubai - United Arab Emirates	company	IBM 2	Khurram	\N	\N	\N	1	Abdul Wahab	wahabfun22@gmail.com	92	8712547	2024-08-19 08:38:09	2024-08-19 08:38:09	\N
31	80	\N	66c2e0770f331_1724047479.jpg	66c2e07729ab5_1724047479.jpg	1993-04-06	32.230772240701505	74.48610976338387	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	company	Company	\N	\N	\N	\N	1	Ali	razahamid005@gmail.com	92	3441562591	2024-08-19 10:04:53	2024-08-19 10:04:53	\N
32	81	\N	66c44696aeae2_1724139158.jpg	66c2fe1817102_1724055064.jpg	\N	25.184098114592558	55.26027429398765	7HRHVGPC+JH	company	Paradise	\N	\N	\N	\N	1	Robert	b@b.com	93	466096899800	2024-08-19 12:11:09	2024-08-20 11:32:38	\N
35	91	\N	66c4fbc5a7b1f_1724185541.jpg	66c4fbc5a94cc_1724185541.jpg	\N	25.0795964	55.1410889	20 Al Mamsha St - Jumeirah Beach Residence - Dubai - United Arab Emirates	company	Blue wave	\N	\N	\N	\N	1	Nick	nick@nick.com	971	8464640649	2024-08-21 00:25:51	2024-08-21 00:25:51	\N
36	100	ind@ind.com	\N	\N	\N	0	0	no location	individual	\N	Riwa Manzil	229	1	male	0	\N	\N	\N	\N	2024-08-24 12:58:34	2024-08-24 12:58:34	\N
37	101	ann1@ann1.com	\N	\N	\N	0	0	no location	individual	\N	Latif Manzil	229	1	male	0	\N	\N	\N	\N	2024-08-24 13:02:50	2024-08-24 13:02:50	\N
38	102	bn@bn.com	\N	\N	\N	0	0	no location	individual	\N	Rh Manzil	229	1	male	0	\N	\N	\N	\N	2024-08-26 11:52:46	2024-08-26 11:52:46	\N
40	106	\N	66cef46fc8b92_1724839023.jpg	66cef46fd057f_1724839023.jpg	\N	25.30215775115601	55.344370231032364	882W+53Q - Cairo St - Al Mamzar - Dubai - United Arab Emirates	company	hjj	\N	\N	\N	\N	1	bbb	bbnj@vv.com	93	8484964664	2024-08-28 13:57:10	2024-08-28 13:57:10	\N
43	113	h@h.com	\N	\N	\N	0	0	no location	individual	\N	Navisfamily	229	1	male	0	\N	\N	\N	\N	2024-09-02 19:51:31	2024-09-02 19:51:31	\N
44	115	ffgg@gg.com	\N	\N	\N	0	0	no location	individual	\N	ggghh	2	2	male	0	\N	\N	\N	\N	2024-09-03 05:16:43	2024-09-03 05:16:43	\N
45	116	test20@gmail.com	\N	\N	\N	0	0	no location	individual	\N	abc	1	2	male	0	\N	\N	\N	\N	2024-09-03 10:43:06	2024-09-03 10:43:06	\N
46	117	abc@gmail.com	\N	\N	\N	0	0	no location	individual	\N	hash	1	1	male	0	\N	\N	\N	\N	2024-09-03 10:56:15	2024-09-03 10:56:15	\N
47	118	abc21@gmail.com	\N	\N	\N	0	0	no location	individual	\N	bas	2	1	male	0	\N	\N	\N	\N	2024-09-03 11:03:20	2024-09-03 11:03:20	\N
48	119	tesr24@gmail.com	\N	\N	\N	0	0	no location	individual	\N	xyz	1	2	male	0	\N	\N	\N	\N	2024-09-03 12:27:05	2024-09-03 12:27:05	\N
23	60	razahamid45@gmail.com	66fc0bd88c1d9_1727794136.jpg	\N	1993-04-06	0	0	no location	individual	\N	Provider	164	1	female	0	\N	\N	\N	\N	2024-08-06 21:19:22	2024-10-15 14:56:43	\N
49	120	test80@gmail.com	\N	\N	\N	0	0	no location	individual	\N	bas	1	2	male	0	\N	\N	\N	\N	2024-09-03 13:00:12	2024-09-03 13:00:12	\N
50	121	teat92@gmail.com	\N	\N	\N	0	0	no location	individual	\N	has	1	2	male	0	\N	\N	\N	\N	2024-09-03 13:29:09	2024-09-03 13:29:09	\N
51	123	hb@hb.com	\N	\N	\N	0	0	no location	individual	\N	navis	229	3	male	0	\N	\N	\N	\N	2024-09-03 16:13:54	2024-09-03 16:13:54	\N
52	124	hh@hh.com	\N	\N	\N	0	0	no location	individual	\N	Rk Manzil	229	1	male	0	\N	\N	\N	\N	2024-09-04 06:54:15	2024-09-04 06:54:15	\N
53	127	z.falak777@gmail.com	\N	\N	\N	0	0	no location	individual	\N	abc	1	1	male	0	\N	\N	\N	\N	2024-09-11 05:25:14	2024-09-11 05:25:14	\N
54	128	anilnavis71@gmail.com	\N	\N	\N	0	0	no location	individual	\N	navis	98	1	male	0	\N	\N	\N	\N	2024-09-11 12:13:55	2024-09-11 12:13:55	\N
55	129	devikasr1995@gmail.com	\N	\N	\N	0	0	no location	individual	\N	Surendran Pillai	98	5	female	0	\N	\N	\N	\N	2024-09-11 14:08:34	2024-09-11 14:08:34	\N
56	130	\N	66e17060591c8_1726050400.jpg	66e170605ad6a_1726050400.jpg	\N	25.18426578261561	55.260022804141045	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	company	DX DEVIKA TECH	\N	\N	\N	\N	1	Devika Arun	devikaarunavafive@gmail.com	971	552266985	2024-09-11 14:26:50	2024-09-11 14:26:50	\N
58	133	\N	66e190994be67_1726058649.jpg	66e1909951ae2_1726058649.jpg	\N	25.2007374963366	55.26135854423046	56 13th St - Al Wasl - Dubai - United Arab Emirates	company	Padippurackal	\N	\N	\N	\N	1	Devika	arun.devu.290321@gmail.com	971	552255252	2024-09-11 16:44:19	2024-09-11 16:44:19	\N
59	138	\N	66e9a8d64d8a5_1726589142.jpg	66e9a8d64f092_1726589142.jpg	\N	32.230934183221535	74.4856695458293	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	company	Company	\N	\N	\N	\N	0	\N	\N	\N	\N	2024-09-17 20:05:54	2024-09-17 20:05:54	\N
60	140	\N	66ed3468c6983_1726821480.jpg	66ed3468ccf59_1726821480.jpg	\N	25.184266996240012	55.260034538805485	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	company	BADER	\N	\N	\N	\N	1	Dev	dev@dev.com	971	223366859	2024-09-20 12:38:23	2024-09-20 12:38:23	\N
61	141	\N	66ed3bde740f5_1726823390.jpg	66ed3bde7a9e2_1726823390.jpg	\N	25.184266996240012	55.260034538805485	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	company	BHA	\N	\N	\N	\N	1	Dev	dev@dev.com	971	885588589	2024-09-20 13:15:18	2024-09-20 13:15:18	\N
62	142	\N	66ed3abbac690_1726823099.jpg	66ed3abbafd4e_1726823099.jpg	\N	25.184190890123077	55.26026268771008	57M6+P43 - Business Bay - Dubai - United Arab Emirates	company	Badamiya	\N	\N	\N	\N	1	Dev	dev@dev.con	971	552255885	2024-09-20 13:15:22	2024-09-20 13:15:22	\N
63	144	test700in@gmail.com	\N	\N	\N	0	0	no location	individual	\N	test	1	1	male	0	\N	\N	\N	\N	2024-09-21 00:01:13	2024-09-21 00:01:13	\N
70	153	\N	66f6e6f30dc0f_1727457011.jpg	66f6e6d283040_1727456978.jpg	\N	33.51607783058144	73.1107903667796	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	company	abv	\N	\N	\N	\N	0	aba	test109@gmail.com	971	643431548451511	2024-09-27 21:09:48	2024-09-27 21:10:11	\N
39	105	hh@gh.com	\N	\N	2024-09-04	0	0	no location	individual	\N	ghh	1	2	male	0	\N	\N	\N	\N	2024-08-28 13:55:02	2024-09-23 18:33:43	\N
64	146	shafi@shafi.com	\N	\N	\N	0	0	no location	individual	\N	Samiy	98	1	female	0	\N	\N	\N	\N	2024-09-24 10:34:12	2024-09-24 10:34:12	\N
73	159	beljwar3@yopmail.com	\N	\N	\N	0	0	no location	individual	\N	Beljwar One	98	4	female	0	\N	\N	\N	\N	2024-10-01 12:59:23	2024-10-01 12:59:23	\N
66	149	test102@gmail.com	\N	\N	\N	0	0	no location	individual	\N	Provider family name	1	3	male	0	\N	\N	\N	\N	2024-09-27 12:09:44	2024-09-27 21:35:23	66f6ecdba12a6_1727458523.jpg
74	160	\N	66fbbac531316_1727773381.jpg	66fbbac532abe_1727773381.jpg	\N	25.18425273615262	55.26004794985056	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	company	Beljwar Six	\N	\N	\N	\N	0	\N	\N	\N	\N	2024-10-01 13:03:53	2024-10-01 13:03:53	\N
57	131	devika@dxbapps.com	66f2aef6e5fe7_1727180534.jpg	\N	2015-09-03	0	0	no location	individual	\N	Arun Padippurackal	229	5	female	0	\N	\N	\N	\N	2024-09-11 15:03:00	2024-09-24 16:34:35	\N
71	154	\N	66f7083b70afa_1727465531.jpg	66f7083b76324_1727465531.jpg	\N	25.204849237091366	55.27078282088041	673C+W8V - Dubai - United Arab Emirates,	company	Company Name Two E	\N	\N	\N	\N	1	Rep name E	repemailE@gmail.com	92	3095565450	2024-09-27 22:36:17	2024-09-27 23:32:11	\N
68	151	devtestcontact@gmail.com	66f6a655a9fa7_1727440469.jpg	\N	\N	0	0	no location	individual	\N	FamilyDev E	229	3	female	0	\N	\N	\N	\N	2024-09-27 15:44:29	2024-09-27 19:07:30	\N
69	152	\N	66f6cfa0676b9_1727451040.jpg	66f6cfa068ea5_1727451040.jpg	\N	33.51640223634926	73.1108295544982	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	company	Company Name One	\N	\N	\N	\N	0	\N	\N	\N	\N	2024-09-27 19:30:49	2024-09-27 19:30:49	\N
67	150	\N	66f7114b73ddc_1727467851.jpg	66f6e5da0022e_1727456730.jpg	\N	33.51607783058144	73.1107903667796	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	company	company name	\N	\N	\N	\N	1	Rep name	repComp@gmail.com	358	963154811148	2024-09-27 14:13:32	2024-09-28 00:10:51	\N
75	161	\N	66fbbba6a5d0a_1727773606.jpg	66fbbb5c9492a_1727773532.jpg	\N	25.184223986998518	55.26032048303259	57M6+P43 - Business Bay - Dubai - United Arab Emirates	company	Beljwar Fives	\N	\N	\N	\N	0	Aheen	beljwar6@yopmail.com	971	\N	2024-10-01 13:05:44	2024-10-01 13:06:46	\N
65	148	arshad	66f5104465bef_1727336516.jpg	66f5104467ad1_1727336516.pdf	\N	25.1000998	55.2380812	abc	company	abc	Khurram	1	1	male	1	arshad	arshadiqbal.d123@gmail.com	92	4324234234	2024-09-26 11:33:48	2024-09-26 11:41:56	\N
72	158	beljwar4@yopmail.com	\N	\N	\N	0	0	no location	individual	\N	Individual 2	98	1	female	0	\N	\N	\N	\N	2024-10-01 12:59:21	2024-10-01 12:59:21	\N
76	167	soorajdevssa	\N	\N	\N	0	0	no location	individual	\N	sabu	1	1	male	0	\N	\N	\N	\N	2024-10-04 12:36:34	2024-10-04 12:36:34	\N
77	171	\N	6704e73eeb6e5_1728374590.jpg	6704e73eecf71_1728374590.jpg	\N	25.21500816626201	55.273731239140034	2 34A St - Al Satwa - Dubai - United Arab Emirates	company	Navis Yach	\N	\N	\N	\N	1	Anilrep	a@a.clm	971	84664648464	2024-10-08 12:03:43	2024-10-08 12:03:43	\N
80	192	test@test.com	\N	\N	\N	0	0	no location	individual	\N	test	229	20	male	0	\N	\N	\N	\N	2024-10-09 19:52:22	2024-10-09 19:52:22	\N
81	194	partnertest	\N	\N	\N	0	0	no location	individual	\N	sabu	1	1	male	0	\N	\N	\N	\N	2024-10-10 08:14:35	2024-10-10 08:14:35	\N
82	195	partnertest1	\N	\N	\N	0	0	no location	individual	\N	sabu	1	1	male	0	\N	\N	\N	\N	2024-10-10 08:17:21	2024-10-10 08:17:21	\N
83	196	partnertest12	\N	\N	\N	0	0	no location	individual	\N	sabu	1	1	male	0	\N	\N	\N	\N	2024-10-10 08:22:10	2024-10-10 08:22:10	\N
85	201	partnertest1211	\N	\N	\N	0	0	no location	individual	\N	sabu	1	1	male	0	\N	\N	\N	\N	2024-10-14 08:54:44	2024-10-14 08:54:44	\N
86	204	provider001@gmail.com	\N	\N	\N	0	0	no location	individual	\N	Indi	1	5	male	0	\N	\N	\N	\N	2024-10-19 12:18:05	2024-10-19 12:18:05	\N
29	76	anil@anil.com	66f2d77787549_1727190903.jpg	\N	1993-04-06	0	0	no location	individual	\N	Anil	1	2	female	0	\N	\N	\N	\N	2024-08-15 15:01:20	2024-11-01 22:47:20	6725223896d80_1730486840.jpg
87	207	\N	671a015163873_1729757521.jpg	671a01516a573_1729757521.jpg	\N	25.184127807881275	55.260292470600234	57M6+P43 - Business Bay - Dubai - United Arab Emirates	company	Arabian Ranches	\N	\N	\N	\N	1	Mac manager	mac@mac.com	971	423454343	2024-10-24 12:12:16	2024-10-24 12:12:16	\N
88	216	partnertest12111	\N	\N	\N	0	0	no location	individual	\N	sabu	1	1	male	0	\N	\N	\N	\N	2024-11-04 11:48:53	2024-11-04 11:48:53	\N
89	217	ghhjk@ghhh.com	\N	\N	\N	0	0	no location	individual	\N	yey	1	1	female	0	\N	\N	\N	\N	2024-11-04 13:15:28	2024-11-04 13:15:28	\N
90	218	test304@gmail.com	\N	\N	\N	0	0	no location	individual	\N	test	1	1	male	0	\N	\N	\N	\N	2024-11-04 13:21:58	2024-11-04 13:21:58	\N
91	219	\N	6728b0c88d4f4_1730719944.jpg	6728b0c8a9fae_1730719944.png	\N	33.605160846364754	72.99789501964091	JX4X+542, Street 13, Friends Colony, Rawalpindi, Punjab 46000, Pakistan	company	compimg	\N	\N	\N	\N	0	\N	\N	971	\N	2024-11-04 15:32:37	2024-11-04 15:32:37	\N
79	174	\N	67259655123fc_1730516565.jpg	6728c9897175f_1730726281.jpg	\N	25.287169207543872	55.371268709811815	building 4 SS Lootah - النهدة - النهدة ٢ - دبي - United Arab Emirates	company	Arabian Gulf Stream	\N	\N	\N	\N	1	Kumar 1	kumar@gmail.com	971	84664648643	2024-10-08 17:48:19	2024-11-04 17:18:01	\N
92	220	\N	6728f6e24b621_1730737890.jpg	6728f6e251e58_1730737890.pdf	\N	33.60511964860373	72.99789218157562	JX4X+542, Street 13, Friends Colony, Rawalpindi, Punjab 46000, Pakistan	company	test	\N	\N	\N	\N	0	\N	\N	971	\N	2024-11-04 15:40:50	2024-11-04 20:31:30	\N
93	222	ghj@ghj.com	\N	\N	\N	0	0	no location	individual	\N	rrt	1	1	male	0	\N	\N	\N	\N	2024-11-04 21:39:04	2024-11-04 21:39:04	\N
94	223	\N	672909e5baeef_1730742757.jpg	6729097eb69ab_1730742654.pdf	\N	25.28905412177062	55.37150613963604	79QC+GP3 - Al Nahda - Al Nahda 2 - Dubai - United Arab Emirates	company	JK criuze	\N	\N	\N	\N	1	jack	jack@jack.com	971	5464684646	2024-11-04 21:51:05	2024-11-04 21:52:37	\N
95	224	\N	6729260d9054d_1730749965.jpg	6729260d97bb7_1730749965.pdf	\N	25.287185873611094	55.36984529357661	Al Nahda 2 Building - Al Nahda - Dubai - United Arab Emirates	company	hello@crise	\N	\N	\N	\N	1	sbs	gshjdj@hdjjd.com	971	54343843	2024-11-04 23:52:57	2024-11-04 23:52:57	\N
96	225	vv1@vv.com	\N	\N	\N	0	0	no location	individual	\N	Sabu	98	1	male	0	\N	\N	\N	\N	2024-11-05 09:20:23	2024-11-05 09:20:23	\N
99	234	marc@marc.com	\N	\N	\N	0	0	no location	individual	\N	marc family	1	1	male	0	\N	\N	\N	\N	2024-11-05 23:29:32	2024-11-05 23:29:32	\N
101	239	ajeshcd@gmail.com	\N	\N	\N	0	0	no location	individual	\N	aj	98	1	male	0	\N	\N	\N	\N	2024-11-06 15:50:58	2024-11-06 15:50:58	\N
102	240	hhhh@mailinator.com	\N	\N	\N	0	0	no location	individual	\N	Bdndnd	5	7	female	0	\N	\N	\N	\N	2024-11-07 10:36:20	2024-11-07 10:36:20	\N
100	235	bv@bv.com	\N	\N	2010-11-17	0	0	no location	individual	\N	s	1	1	female	0	\N	\N	\N	\N	2024-11-06 08:13:31	2024-11-08 12:49:58	\N
\.


--
-- Data for Name: wallet_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_histories (id, user_id, amount, type, transaction_id, description, created_at, updated_at, pay_method, wallet_amount, pay_type, is_earning) FROM stdin;
1	75	525	debit	BEW-1723729813	Debited for thwe booking #BL-1723729806	2024-08-15 13:50:13	2024-08-15 13:50:13	0	0	\N	0
2	75	525	debit	BEW-1723732638	Debited for thwe booking #BL-1723732614	2024-08-15 14:37:18	2024-08-15 14:37:18	0	0	\N	0
3	75	525	debit	BEW-1723733443	Debited for thwe booking #BL-1723733421	2024-08-15 14:50:43	2024-08-15 14:50:43	0	0	\N	0
4	75	525	debit	BEW-1723740031	Debited for thwe booking #BL-1723740002	2024-08-15 16:40:31	2024-08-15 16:40:31	0	0	\N	0
5	75	315	debit	BEW-1723798322	Debited for thwe booking #BL-1723798284	2024-08-16 08:52:02	2024-08-16 08:52:02	0	0	\N	0
6	75	10500	debit	BEW-1723812928	Debited for thwe booking #BL-1723812905	2024-08-16 12:55:28	2024-08-16 12:55:28	0	0	\N	0
7	75	1659	debit	BEW-1723835650	Debited for thwe booking #BL-1723835625	2024-08-16 19:14:10	2024-08-16 19:14:10	0	0	\N	0
8	75	1575	debit	BEW-1723839503	Debited for thwe booking #BL-1723839478	2024-08-16 20:18:23	2024-08-16 20:18:23	0	0	\N	0
9	75	2719.5	debit	BEW-1723841054	Debited for thwe booking #BL-1723841031	2024-08-16 20:44:14	2024-08-16 20:44:14	0	0	\N	0
10	75	2719.5	debit	BEW-1723841247	Debited for thwe booking #BL-1723841221	2024-08-16 20:47:27	2024-08-16 20:47:27	0	0	\N	0
11	50	0	debit	BEW-1723848246	Debited for thwe booking #BL-1723848245	2024-08-16 22:44:06	2024-08-16 22:44:06	0	0	\N	0
12	75	2719.5	debit	BEW-1723898428	Debited for thwe booking #BL-1723898405	2024-08-17 12:40:28	2024-08-17 12:40:28	0	0	\N	0
13	75	2709	debit	BEW-1723898824	Debited for thwe booking #BL-1723898802	2024-08-17 12:47:04	2024-08-17 12:47:04	0	0	\N	0
14	78	2646	debit	BEW-1723918369	Debited for thwe booking #BL-1723918350	2024-08-17 18:12:49	2024-08-17 18:12:49	0	0	\N	0
15	78	2635.5	debit	BEW-1723923417	Debited for thwe booking #BL-1723923397	2024-08-17 19:36:57	2024-08-17 19:36:57	0	0	\N	0
16	78	1722	debit	BEW-1723924613	Debited for thwe booking #BL-1723924612	2024-08-17 19:56:53	2024-08-17 19:56:53	0	0	\N	0
17	78	4756.5	debit	BEW-1723924859	Debited for thwe booking #BL-1723924858	2024-08-17 20:00:59	2024-08-17 20:00:59	0	0	\N	0
18	78	1648.5	debit	BEW-1723937495	Debited for thwe booking #BL-1723937474	2024-08-17 23:31:35	2024-08-17 23:31:35	0	0	\N	0
19	78	4756.5	debit	BEW-1723938833	Debited for thwe booking #BL-1723938831	2024-08-17 23:53:53	2024-08-17 23:53:53	0	0	\N	0
20	77	1617	debit	BEW-1723973089	Debited for thwe booking #BL-1723973069	2024-08-18 09:24:49	2024-08-18 09:24:49	0	0	\N	0
21	75	1575	debit	BEW-1723974380	Debited for thwe booking #BL-1723974342	2024-08-18 09:46:20	2024-08-18 09:46:20	0	0	\N	0
22	77	1680	debit	BEW-1723975017	Debited for thwe booking #BL-1723974992	2024-08-18 09:56:57	2024-08-18 09:56:57	0	0	\N	0
23	77	1764	debit	BEW-1723975091	Debited for thwe booking #BL-1723975070	2024-08-18 09:58:11	2024-08-18 09:58:11	0	0	\N	0
24	77	1638	debit	BEW-1723975551	Debited for thwe booking #BL-1723975524	2024-08-18 10:05:51	2024-08-18 10:05:51	0	0	\N	0
25	77	1680	debit	BEW-1723977583	Debited for thwe booking #BL-1723977547	2024-08-18 10:39:43	2024-08-18 10:39:43	0	0	\N	0
26	75	1648.5	debit	BEW-1724053732	Debited for thwe booking #BL-1724053707	2024-08-19 07:48:52	2024-08-19 07:48:52	0	0	\N	0
27	75	1680	debit	BEW-1724053830	Debited for thwe booking #BL-1724053795	2024-08-19 07:50:30	2024-08-19 07:50:30	0	0	\N	0
28	75	1680	debit	BEW-1724054488	Debited for thwe booking #BL-1724054455	2024-08-19 08:01:28	2024-08-19 08:01:28	0	0	\N	0
29	75	6300	debit	BEW-1724054570	Debited for thwe booking #BL-1724054550	2024-08-19 08:02:50	2024-08-19 08:02:50	0	0	\N	0
30	75	267.75	debit	BEW-1724054748	Debited for thwe booking #BL-1724054728	2024-08-19 08:05:48	2024-08-19 08:05:48	0	0	\N	0
31	75	1575	debit	BEW-1724054997	Debited for thwe booking #BL-1724054991	2024-08-19 08:09:57	2024-08-19 08:09:57	0	0	\N	0
32	77	1585.5	debit	BEW-1724059252	Debited for thwe booking #BL-1724059251	2024-08-19 09:20:52	2024-08-19 09:20:52	0	0	\N	0
33	77	1585.5	debit	BEW-1724059613	Debited for thwe booking #BL-1724059575	2024-08-19 09:26:53	2024-08-19 09:26:53	0	0	\N	0
34	77	1575	debit	BEW-1724062241	Debited for thwe booking #BL-1724062224	2024-08-19 10:10:41	2024-08-19 10:10:41	0	0	\N	0
35	75	1632.75	debit	BEW-1724063379	Debited for thwe booking #BL-1724063355	2024-08-19 10:29:39	2024-08-19 10:29:39	0	0	\N	0
36	75	1632.75	debit	BEW-1724063487	Debited for thwe booking #BL-1724063466	2024-08-19 10:31:27	2024-08-19 10:31:27	0	0	\N	0
37	75	1575	debit	BEW-1724063635	Debited for thwe booking #BL-1724063621	2024-08-19 10:33:55	2024-08-19 10:33:55	0	0	\N	0
38	75	1632.75	debit	BEW-1724064472	Debited for thwe booking #BL-1724064445	2024-08-19 10:47:52	2024-08-19 10:47:52	0	0	\N	0
39	75	1575	debit	BEW-1724064515	Debited for thwe booking #BL-1724064506	2024-08-19 10:48:35	2024-08-19 10:48:35	0	0	\N	0
40	75	1680	debit	BEW-1724067142	Debited for thwe booking #BL-1724067109	2024-08-19 11:32:22	2024-08-19 11:32:22	0	0	\N	0
41	75	2625	debit	BEW-1724068199	Debited for thwe booking #BL-1724068173	2024-08-19 11:49:59	2024-08-19 11:49:59	0	0	\N	0
42	75	5250	debit	BEW-1724068320	Debited for thwe booking #BL-1724068296	2024-08-19 11:52:00	2024-08-19 11:52:00	0	0	\N	0
43	75	2625	debit	BEW-1724068924	Debited for thwe booking #BL-1724068902	2024-08-19 12:02:04	2024-08-19 12:02:04	0	0	\N	0
44	75	1680	debit	BEW-1724068998	Debited for thwe booking #BL-1724068979	2024-08-19 12:03:18	2024-08-19 12:03:18	0	0	\N	0
45	83	1617	debit	BEW-1724070976	Debited for thwe booking #BL-1724070956	2024-08-19 12:36:16	2024-08-19 12:36:16	0	0	\N	0
46	83	1617	debit	BEW-1724071073	Debited for thwe booking #BL-1724071052	2024-08-19 12:37:53	2024-08-19 12:37:53	0	0	\N	0
47	83	1680	debit	BEW-1724071491	Debited for thwe booking #BL-1724071469	2024-08-19 12:44:51	2024-08-19 12:44:51	0	0	\N	0
48	83	1680	debit	BEW-1724072516	Debited for thwe booking #BL-1724072495	2024-08-19 13:01:56	2024-08-19 13:01:56	0	0	\N	0
49	83	1680	debit	BEW-1724072661	Debited for thwe booking #BL-1724072640	2024-08-19 13:04:21	2024-08-19 13:04:21	0	0	\N	0
50	83	1680	debit	BEW-1724072754	Debited for thwe booking #BL-1724072723	2024-08-19 13:05:54	2024-08-19 13:05:54	0	0	\N	0
51	83	1680	debit	BEW-1724072852	Debited for thwe booking #BL-1724072826	2024-08-19 13:07:32	2024-08-19 13:07:32	0	0	\N	0
52	83	1680	debit	BEW-1724073087	Debited for thwe booking #BL-1724073066	2024-08-19 13:11:27	2024-08-19 13:11:27	0	0	\N	0
53	83	1680	debit	BEW-1724073401	Debited for thwe booking #BL-1724073380	2024-08-19 13:16:41	2024-08-19 13:16:41	0	0	\N	0
54	83	1617	debit	BEW-1724074278	Debited for thwe booking #BL-1724074257	2024-08-19 13:31:18	2024-08-19 13:31:18	0	0	\N	0
55	83	4200	debit	BEW-1724077026	Debited for thwe booking #BL-1724076999	2024-08-19 14:17:06	2024-08-19 14:17:06	0	0	\N	0
56	83	1617	debit	BEW-1724077820	Debited for thwe booking #BL-1724077798	2024-08-19 14:30:20	2024-08-19 14:30:20	0	0	\N	0
57	83	1575	debit	BEW-1724077955	Debited for thwe booking #BL-1724077939	2024-08-19 14:32:35	2024-08-19 14:32:35	0	0	\N	0
58	83	1575	debit	BEW-1724077977	Debited for thwe booking #BL-1724077970	2024-08-19 14:32:57	2024-08-19 14:32:57	0	0	\N	0
59	83	1575	debit	BEW-1724078171	Debited for thwe booking #BL-1724078167	2024-08-19 14:36:11	2024-08-19 14:36:11	0	0	\N	0
60	83	1575	debit	BEW-1724081469	Debited for thwe booking #BL-1724081464	2024-08-19 15:31:09	2024-08-19 15:31:09	0	0	\N	0
61	78	2635.5	debit	BEW-1724095177	Debited for thwe booking #BL-1724095174	2024-08-19 19:19:37	2024-08-19 19:19:37	0	0	\N	0
62	78	1659	debit	BEW-1724097378	Debited for thwe booking #BL-1724097351	2024-08-19 19:56:18	2024-08-19 19:56:18	0	0	\N	0
63	78	1585.5	debit	BEW-1724098863	Debited for thwe booking #BL-1724098862	2024-08-19 20:21:03	2024-08-19 20:21:03	0	0	\N	0
64	78	2698.5	debit	BEW-1724098896	Debited for thwe booking #BL-1724098896	2024-08-19 20:21:36	2024-08-19 20:21:36	0	0	\N	0
65	78	1648.5	debit	BEW-1724102073	Debited for thwe booking #BL-1724102072	2024-08-19 21:14:33	2024-08-19 21:14:33	0	0	\N	0
66	77	1617	debit	BEW-1724109197	Debited for thwe booking #BL-1724109163	2024-08-19 23:13:17	2024-08-19 23:13:17	0	0	\N	0
67	77	1617	debit	BEW-1724110130	Debited for thwe booking #BL-1724110099	2024-08-19 23:28:50	2024-08-19 23:28:50	0	0	\N	0
68	77	1638	debit	BEW-1724119625	Debited for thwe booking #BL-1724119591	2024-08-20 02:07:05	2024-08-20 02:07:05	0	0	\N	0
69	83	267.75	debit	BEW-1724139577	Debited for thwe booking #BL-1724139555	2024-08-20 07:39:37	2024-08-20 07:39:37	0	0	\N	0
70	78	8977.5	debit	BEW-1724141225	Debited for thwe booking #BL-1724141062	2024-08-20 08:07:05	2024-08-20 08:07:05	0	0	\N	0
71	83	1680	debit	BEW-1724146949	Debited for thwe booking #BL-1724146925	2024-08-20 09:42:29	2024-08-20 09:42:29	0	0	\N	0
72	83	1680	debit	BEW-1724149611	Debited for thwe booking #BL-1724149589	2024-08-20 10:26:51	2024-08-20 10:26:51	0	0	\N	0
73	83	5250	debit	BEW-1724149823	Debited for thwe booking #BL-1724149801	2024-08-20 10:30:23	2024-08-20 10:30:23	0	0	\N	0
74	83	1680	debit	BEW-1724155511	Debited for thwe booking #BL-1724155490	2024-08-20 12:05:11	2024-08-20 12:05:11	0	0	\N	0
75	83	6300	debit	BEW-1724155828	Debited for thwe booking #BL-1724155810	2024-08-20 12:10:28	2024-08-20 12:10:28	0	0	\N	0
76	87	1680	debit	BEW-1724156897	Debited for thwe booking #BL-1724156874	2024-08-20 12:28:17	2024-08-20 12:28:17	0	0	\N	0
77	85	1680	debit	BEW-1724161102	Debited for thwe booking #BL-1724161080	2024-08-20 13:38:22	2024-08-20 13:38:22	0	0	\N	0
78	90	1680	debit	BEW-1724161880	Debited for thwe booking #BL-1724161860	2024-08-20 13:51:20	2024-08-20 13:51:20	0	0	\N	0
79	90	1680	debit	BEW-1724167029	Debited for thwe booking #BL-1724167004	2024-08-20 15:17:09	2024-08-20 15:17:09	0	0	\N	0
80	78	336	debit	BEW-1724183782	Debited for thwe booking #BL-1724183762	2024-08-20 19:56:22	2024-08-20 19:56:22	0	0	\N	0
81	78	1648.5	debit	BEW-1724184389	Debited for thwe booking #BL-1724184372	2024-08-20 20:06:29	2024-08-20 20:06:29	0	0	\N	0
82	78	1648.5	debit	BEW-1724193390	Debited for thwe booking #BL-1724193389	2024-08-20 22:36:30	2024-08-20 22:36:30	0	0	\N	0
83	78	105	debit	BEW-1724195224	Debited for thwe booking #BL-1724195205	2024-08-20 23:07:04	2024-08-20 23:07:04	0	0	\N	0
84	78	31.5	debit	BEW-1724195440	Debited for thwe booking #BL-1724195422	2024-08-20 23:10:40	2024-08-20 23:10:40	0	0	\N	0
85	78	105	debit	BEW-1724195816	Debited for thwe booking #BL-1724195796	2024-08-20 23:16:56	2024-08-20 23:16:56	0	0	\N	0
86	78	2698.5	debit	BEW-1724195954	Debited for thwe booking #BL-1724195952	2024-08-20 23:19:14	2024-08-20 23:19:14	0	0	\N	0
87	78	2698.5	debit	BEW-1724196164	Debited for thwe booking #BL-1724196162	2024-08-20 23:22:44	2024-08-20 23:22:44	0	0	\N	0
88	78	2698.5	debit	BEW-1724196370	Debited for thwe booking #BL-1724196369	2024-08-20 23:26:10	2024-08-20 23:26:10	0	0	\N	0
89	78	2698.5	debit	BEW-1724196663	Debited for thwe booking #BL-1724196646	2024-08-20 23:31:03	2024-08-20 23:31:03	0	0	\N	0
90	78	105	debit	BEW-1724196748	Debited for thwe booking #BL-1724196728	2024-08-20 23:32:28	2024-08-20 23:32:28	0	0	\N	0
91	77	105	debit	BEW-1724207609	Debited for thwe booking #BL-1724207590	2024-08-21 02:33:29	2024-08-21 02:33:29	0	0	\N	0
92	81	1643.25	debit	BEW-1724226537	Debited for thwe booking #BL-1724226506	2024-08-21 07:48:57	2024-08-21 07:48:57	0	0	\N	0
93	92	1632.75	debit	BEW-1724227374	Debited for thwe booking #BL-1724227323	2024-08-21 08:02:54	2024-08-21 08:02:54	0	0	\N	0
94	92	1617	debit	BEW-1724229212	Debited for thwe booking #BL-1724229192	2024-08-21 08:33:32	2024-08-21 08:33:32	0	0	\N	0
95	92	1680	debit	BEW-1724229500	Debited for thwe booking #BL-1724229481	2024-08-21 08:38:20	2024-08-21 08:38:20	0	0	\N	0
96	92	1617	debit	BEW-1724229732	Debited for thwe booking #BL-1724229711	2024-08-21 08:42:12	2024-08-21 08:42:12	0	0	\N	0
97	78	157.5	debit	BEW-1724229898	Debited for thwe booking #BL-1724229870	2024-08-21 08:44:58	2024-08-21 08:44:58	0	0	\N	0
98	92	1680	debit	BEW-1724230730	Debited for thwe booking #BL-1724230689	2024-08-21 08:58:50	2024-08-21 08:58:50	0	0	\N	0
99	92	1585.5	debit	BEW-1724231181	Debited for thwe booking #BL-1724231165	2024-08-21 09:06:21	2024-08-21 09:06:21	0	0	\N	0
100	92	1585.5	debit	BEW-1724231629	Debited for thwe booking #BL-1724231607	2024-08-21 09:13:49	2024-08-21 09:13:49	0	0	\N	0
101	92	1585.5	debit	BEW-1724231848	Debited for thwe booking #BL-1724231829	2024-08-21 09:17:28	2024-08-21 09:17:28	0	0	\N	0
102	92	1585.5	debit	BEW-1724232136	Debited for thwe booking #BL-1724232118	2024-08-21 09:22:16	2024-08-21 09:22:16	0	0	\N	0
103	93	1585.5	debit	BEW-1724232991	Debited for thwe booking #BL-1724232972	2024-08-21 09:36:31	2024-08-21 09:36:31	0	0	\N	0
104	93	315	debit	BEW-1724237934	Debited for thwe booking #BL-1724237916	2024-08-21 10:58:54	2024-08-21 10:58:54	0	0	\N	0
105	92	1632.75	debit	BEW-1724242432	Debited for thwe booking #BL-1724242409	2024-08-21 12:13:52	2024-08-21 12:13:52	0	0	\N	0
106	83	267.75	debit	BEW-1724243576	Debited for thwe booking #BL-1724243552	2024-08-21 12:32:56	2024-08-21 12:32:56	0	0	\N	0
107	99	1585.5	debit	BEW-1724247125	Debited for thwe booking #BL-1724247081	2024-08-21 13:32:05	2024-08-21 13:32:05	0	0	\N	0
108	99	1627.5	debit	BEW-1724395112	Debited for thwe booking #BL-1724395092	2024-08-23 06:38:32	2024-08-23 06:38:32	0	0	\N	0
109	78	1695.75	debit	BEW-1724451440	Debited for thwe booking #BL-1724451417	2024-08-23 22:17:20	2024-08-23 22:17:20	0	0	\N	0
110	99	1585.5	debit	BEW-1724661168	Debited for thwe booking #BL-1724661146	2024-08-26 08:32:48	2024-08-26 08:32:48	0	0	\N	0
111	99	1643.25	debit	BEW-1724677562	Debited for thwe booking #BL-1724677542	2024-08-26 13:06:02	2024-08-26 13:06:02	0	0	\N	0
112	99	1575	debit	BEW-1724678751	Debited for thwe booking #BL-1724678733	2024-08-26 13:25:51	2024-08-26 13:25:51	0	0	\N	0
113	109	1585.5	debit	BEW-1725261494	Debited for thwe booking #BL-1725261475	2024-09-02 07:18:14	2024-09-02 07:18:14	0	0	\N	0
114	78	1816.5	debit	BEW-1725360345	Debited for thwe booking #BL-1725360328	2024-09-03 10:45:45	2024-09-03 10:45:45	0	0	\N	0
115	78	1884.75	debit	BEW-1725362408	Debited for thwe booking #BL-1725362390	2024-09-03 11:20:08	2024-09-03 11:20:08	0	0	\N	0
116	78	1827	debit	BEW-1725363535	Debited for thwe booking #BL-1725363437	2024-09-03 11:38:55	2024-09-03 11:38:55	0	0	\N	0
117	78	210	debit	BEW-1725364039	Debited for thwe booking #BL-1725364020	2024-09-03 11:47:19	2024-09-03 11:47:19	0	0	\N	0
118	78	1916.25	debit	BEW-1725364485	Debited for thwe booking #BL-1725364465	2024-09-03 11:54:45	2024-09-03 11:54:45	0	0	\N	0
119	122	1596	debit	BEW-1725364719	Debited for thwe booking #BL-1725364701	2024-09-03 11:58:39	2024-09-03 11:58:39	0	0	\N	0
120	99	1832.25	debit	BEW-1725367227	Debited for thwe booking #BL-1725367209	2024-09-03 12:40:27	2024-09-03 12:40:27	0	0	\N	0
121	85	1953	debit	BEW-1725564744	Debited for thwe booking #BL-1725564711	2024-09-05 19:32:24	2024-09-05 19:32:24	0	0	\N	0
122	83	1816.5	debit	BEW-1725609077	Debited for thwe booking #BL-1725609055	2024-09-06 07:51:17	2024-09-06 07:51:17	0	0	\N	0
123	83	525	debit	BEW-1725622501	Debited for thwe booking #BL-1725622478	2024-09-06 11:35:01	2024-09-06 11:35:01	0	0	\N	0
124	83	638.925	debit	BEW-1725628849	Debited for thwe booking #BL-1725628828	2024-09-06 13:20:49	2024-09-06 13:20:49	0	0	\N	0
125	51	2299.5	debit	BEW-1725724734	Debited for thwe booking #BL-1725724698	2024-09-07 15:58:54	2024-09-07 15:58:54	0	0	\N	0
126	78	2740.5	debit	BEW-1725882017	Debited for thwe booking #BL-1725881994	2024-09-09 11:40:17	2024-09-09 11:40:17	0	0	\N	0
127	78	126	debit	BEW-1725915458	Debited for thwe booking #BL-1725915436	2024-09-09 20:57:38	2024-09-09 20:57:38	0	0	\N	0
128	78	2971.5	debit	BEW-1725915560	Debited for thwe booking #BL-1725915539	2024-09-09 20:59:20	2024-09-09 20:59:20	0	0	\N	0
129	51	630	debit	BEW-1725957409	Debited for thwe booking #BL-1725957360	2024-09-10 08:36:49	2024-09-10 08:36:49	0	0	\N	0
130	125	1260	debit	BEW-1725966935	Debited for thwe booking #BL-1725966895	2024-09-10 11:15:35	2024-09-10 11:15:35	0	0	\N	0
131	125	2136.75	debit	BEW-1725968396	Debited for thwe booking #BL-1725968366	2024-09-10 11:39:56	2024-09-10 11:39:56	0	0	\N	0
132	78	1727.25	debit	BEW-1725985618	Debited for thwe booking #BL-1725985598	2024-09-10 16:26:58	2024-09-10 16:26:58	0	0	\N	0
133	126	1958.25	debit	BEW-1725987184	Debited for thwe booking #BL-1725987147	2024-09-10 16:53:04	2024-09-10 16:53:04	0	0	\N	0
134	126	2157.75	debit	BEW-1725988746	Debited for thwe booking #BL-1725988720	2024-09-10 17:19:06	2024-09-10 17:19:06	0	0	\N	0
135	126	2157.75	debit	BEW-1725989476	Debited for thwe booking #BL-1725989437	2024-09-10 17:31:16	2024-09-10 17:31:16	0	0	\N	0
136	126	840	debit	BEW-1725998582	Debited for thwe booking #BL-1725998555	2024-09-10 20:03:02	2024-09-10 20:03:02	0	0	\N	0
137	78	840	debit	BEW-1725998617	Debited for thwe booking #BL-1725998555	2024-09-10 20:03:37	2024-09-10 20:03:37	0	0	\N	0
138	78	1800.75	debit	BEW-1726002584	Debited for thwe booking #BL-1726002564	2024-09-10 21:09:44	2024-09-10 21:09:44	0	0	\N	0
139	78	1680	debit	BEW-1726002892	Debited for thwe booking #BL-1726002860	2024-09-10 21:14:52	2024-09-10 21:14:52	0	0	\N	0
140	99	1585.5	debit	BEW-1726217957	Debited for thwe booking #BL-1726217937	2024-09-13 08:59:17	2024-09-13 08:59:17	0	0	\N	0
141	136	2079	debit	BEW-1726218686	Debited for thwe booking #BL-1726218671	2024-09-13 09:11:26	2024-09-13 09:11:26	0	0	\N	0
142	51	582.75	debit	BEW-1726320185	Debited for thwe booking #BL-1726320143	2024-09-14 13:23:05	2024-09-14 13:23:05	0	0	\N	0
143	125	945	debit	BEW-1726321806	Debited for thwe booking #BL-1726321760	2024-09-14 13:50:06	2024-09-14 13:50:06	0	0	\N	0
144	51	945	debit	BEW-1726321810	Debited for thwe booking #BL-1726321760	2024-09-14 13:50:10	2024-09-14 13:50:10	0	0	\N	0
145	134	5775	debit	BEW-1726482048	Debited for thwe booking #BL-1726482031	2024-09-16 10:20:48	2024-09-16 10:20:48	0	0	\N	0
146	135	5250	debit	BEW-1726497123	Debited for thwe booking #BL-1726497096	2024-09-16 14:32:03	2024-09-16 14:32:03	0	0	\N	0
147	134	525	debit	BEW-1726751572	Debited for thwe booking #BL-1726751553	2024-09-19 13:12:52	2024-09-19 13:12:52	0	0	\N	0
148	135	1575	debit	BEW-1726752314	Debited for thwe booking #BL-1726752289	2024-09-19 13:25:14	2024-09-19 13:25:14	0	0	\N	0
149	135	9450	debit	BEW-1726752430	Debited for thwe booking #BL-1726752408	2024-09-19 13:27:10	2024-09-19 13:27:10	0	0	\N	0
150	134	5775	debit	BEW-1726752730	Debited for thwe booking #BL-1726752675	2024-09-19 13:32:10	2024-09-19 13:32:10	0	0	\N	0
151	134	525	debit	BEW-1726753058	Debited for thwe booking #BL-1726753036	2024-09-19 13:37:38	2024-09-19 13:37:38	0	0	\N	0
152	135	5250	debit	BEW-1726753328	Debited for thwe booking #BL-1726753305	2024-09-19 13:42:08	2024-09-19 13:42:08	0	0	\N	0
153	134	1680	debit	BEW-1726824315	Debited for thwe booking #BL-1726824296	2024-09-20 09:25:15	2024-09-20 09:25:15	0	0	\N	0
154	134	210	debit	BEW-1727072392	Debited for thwe booking #BL-1727072374	2024-09-23 06:19:52	2024-09-23 06:19:52	0	0	\N	0
155	143	525	debit	BEW-1727098198	Debited for thwe booking #BL-1727098157	2024-09-23 13:29:58	2024-09-23 13:29:58	0	0	\N	0
156	143	525	debit	BEW-1727098204	Debited for thwe booking #BL-1727098073	2024-09-23 13:30:04	2024-09-23 13:30:04	0	0	\N	0
157	135	525	debit	BEW-1727098904	Debited for thwe booking #BL-1727098864	2024-09-23 13:41:44	2024-09-23 13:41:44	0	0	\N	0
158	143	525	debit	BEW-1727098907	Debited for thwe booking #BL-1727098866	2024-09-23 13:41:47	2024-09-23 13:41:47	0	0	\N	0
159	135	525	debit	BEW-1727099559	Debited for thwe booking #BL-1727099408	2024-09-23 13:52:39	2024-09-23 13:52:39	0	0	\N	0
160	143	525	debit	BEW-1727099574	Debited for thwe booking #BL-1727099408	2024-09-23 13:52:54	2024-09-23 13:52:54	0	0	\N	0
161	135	1050	debit	BEW-1727179628	Debited for thwe booking #BL-1727179607	2024-09-24 12:07:08	2024-09-24 12:07:08	0	0	\N	0
162	51	1837.5	debit	BEW-1727698532	Debited for thwe booking #BL-1727698453	2024-09-30 12:15:32	2024-09-30 12:15:32	0	0	\N	0
163	148	2740.5	debit	BEW-1727701795	Debited for thwe booking #BL-1725881994	2024-09-30 13:09:55	2024-09-30 13:09:55	0	0	\N	0
164	148	2740.5	debit	BEW-1727701843	Debited for thwe booking #BL-1725881994	2024-09-30 13:10:43	2024-09-30 13:10:43	0	0	\N	0
165	148	2740.5	debit	BEW-1727701973	Debited for thwe booking #BL-1725881994	2024-09-30 13:12:53	2024-09-30 13:12:53	0	0	\N	0
166	148	2740.5	debit	BEW-1727702046	Debited for thwe booking #BL-1725881994	2024-09-30 13:14:06	2024-09-30 13:14:06	0	0	\N	0
167	51	714	debit	BEW-1727715502	Debited for thwe booking #BL-1727715472	2024-09-30 16:58:22	2024-09-30 16:58:22	0	0	\N	0
168	52	1706.25	debit	BEW-1727718307	Debited for thwe booking #BL-1727718275	2024-09-30 17:45:07	2024-09-30 17:45:07	0	0	\N	0
169	52	1585.5	debit	BEW-1727761730	Debited for thwe booking #BL-1727761685	2024-10-01 05:48:50	2024-10-01 05:48:50	0	0	\N	0
170	51	215.25	debit	BEW-1727764944	Debited for thwe booking #BL-1727764942	2024-10-01 06:42:24	2024-10-01 06:42:24	0	0	\N	0
171	51	1606.5	debit	BEW-1727765384	Debited for thwe booking #BL-1727765380	2024-10-01 06:49:44	2024-10-01 06:49:44	0	0	\N	0
172	156	8085	debit	BEW-1727783314	Debited for thwe booking #BL-1727783286	2024-10-01 11:48:34	2024-10-01 11:48:34	0	0	\N	0
173	155	1596	debit	BEW-1727877313	Debited for thwe booking #BL-1727877225	2024-10-02 13:55:13	2024-10-02 13:55:13	0	0	\N	0
174	166	3	credit	\N	Wallet Top up 	2024-10-03 12:03:00	2024-10-03 12:03:00	1	0	RECHARGED	0
175	155	3	credit	\N	Wallet Top up 	2024-10-03 13:18:00	2024-10-03 13:18:00	1	0	RECHARGED	0
176	155	50	credit	\N	Wallet Top up 	2024-10-03 16:11:00	2024-10-03 16:11:00	1	0	RECHARGED	0
177	155	1600	credit	\N	Wallet Top up 	2024-10-03 16:12:00	2024-10-03 16:12:00	1	0	RECHARGED	0
178	155	6000	credit	\N	Wallet Top up 	2024-10-03 16:48:00	2024-10-03 16:48:00	1	0	RECHARGED	0
179	155	10000	credit	\N	Wallet Top up 	2024-10-03 16:59:00	2024-10-03 16:59:00	1	0	RECHARGED	0
180	155	9240	debit	BEW-1727974998	Debited for thwe booking #BL-1727974987	2024-10-03 17:03:18	2024-10-03 17:03:18	0	0	\N	0
181	155	5000	credit	\N	Wallet Top up 	2024-10-03 17:08:00	2024-10-03 17:08:00	1	0	RECHARGED	0
182	155	10500	debit	BEW-1727975296	Debited for thwe booking #BL-1727975294	2024-10-03 17:08:16	2024-10-03 17:08:16	0	0	\N	0
183	155	472.5	debit	BEW-1728310701	Debited for thwe booking #BL-1728310700	2024-10-07 14:18:21	2024-10-07 14:18:21	0	0	\N	0
184	155	472.5	debit	BEW-1728310743	Debited for thwe booking #BL-1728310742	2024-10-07 14:19:03	2024-10-07 14:19:03	0	0	\N	0
185	155	472.5	debit	BEW-1728311228	Debited for thwe booking #BL-1728310742	2024-10-07 14:27:08	2024-10-07 14:27:08	0	0	\N	0
186	155	5000	credit	\N	Wallet Top up 	2024-10-07 14:27:00	2024-10-07 14:27:00	1	0	RECHARGED	0
187	155	472.5	debit	BEW-1728311344	Debited for thwe booking #BL-1728310742	2024-10-07 14:29:04	2024-10-07 14:29:04	0	0	\N	0
188	155	472.5	debit	BEW-1728311518	Debited for thwe booking #BL-1728311518	2024-10-07 14:31:58	2024-10-07 14:31:58	0	0	\N	0
189	97	100	credit	\N	Wallet Top up 	2024-10-07 17:28:00	2024-10-07 17:28:00	1	0	RECHARGED	0
190	97	1596	debit	BEW-1728330148	Debited for thwe booking #BL-1728330147	2024-10-07 19:42:28	2024-10-07 19:42:28	0	0	\N	0
191	97	3000	credit	\N	Wallet Top up 	2024-10-07 19:46:00	2024-10-07 19:46:00	1	0	RECHARGED	0
192	97	100	credit	\N	Wallet Top up 	2024-10-07 19:49:00	2024-10-07 19:49:00	1	0	RECHARGED	0
193	97	1585.5	debit	BEW-1728330555	Debited for thwe booking #BL-1728330554	2024-10-07 19:49:15	2024-10-07 19:49:15	0	0	\N	0
194	169	5000	credit	\N	Wallet Top up 	2024-10-08 05:45:00	2024-10-08 05:45:00	1	0	RECHARGED	0
195	169	756	debit	BEW-1728366339	Debited for thwe booking #BL-1728366338	2024-10-08 05:45:39	2024-10-08 05:45:39	0	0	\N	0
196	169	840	debit	BEW-1728367741	Debited for thwe booking #BL-1728367736	2024-10-08 06:09:01	2024-10-08 06:09:01	0	0	\N	0
197	169	840	debit	BEW-1728368052	Debited for thwe booking #BL-1728368044	2024-10-08 06:14:12	2024-10-08 06:14:12	0	0	\N	0
198	170	5000	credit	\N	Wallet Top up 	2024-10-08 07:38:00	2024-10-08 07:38:00	1	0	RECHARGED	0
199	169	840	debit	BEW-1728399251	Debited for thwe booking #BL-1728399247	2024-10-08 14:54:11	2024-10-08 14:54:11	0	0	\N	0
200	169	1050	debit	BEW-1728399317	Debited for thwe booking #BL-1728399315	2024-10-08 14:55:17	2024-10-08 14:55:17	0	0	\N	0
201	173	2000	credit	\N	Wallet Top up 	2024-10-09 04:10:00	2024-10-09 04:10:00	1	0	RECHARGED	0
202	173	1575	debit	BEW-1728447142	Debited for thwe booking #BL-1728447141	2024-10-09 04:12:22	2024-10-09 04:12:22	0	0	\N	0
203	173	20000	credit	\N	Wallet Top up 	2024-10-09 04:13:00	2024-10-09 04:13:00	1	0	RECHARGED	0
204	173	1785	debit	BEW-1728447281	Debited for thwe booking #BL-1728447280	2024-10-09 04:14:41	2024-10-09 04:14:41	0	0	\N	0
205	169	661.5	debit	BEW-1728458709	Debited for thwe booking #BL-1728458698	2024-10-09 07:25:09	2024-10-09 07:25:09	0	0	\N	0
206	169	5000	credit	\N	Wallet Top up 	2024-10-09 07:32:00	2024-10-09 07:32:00	1	0	RECHARGED	0
207	169	1617	debit	BEW-1728459154	Debited for thwe booking #BL-1728459151	2024-10-09 07:32:34	2024-10-09 07:32:34	0	0	\N	0
208	169	10500	debit	BEW-1728460164	Debited for thwe booking #BL-1728460132	2024-10-09 07:49:24	2024-10-09 07:49:24	0	0	\N	0
209	173	2247	debit	BEW-1728475264	Debited for thwe booking #BL-1728475247	2024-10-09 12:01:04	2024-10-09 12:01:04	0	0	\N	0
210	169	3354.75	debit	BEW-1728475867	Debited for thwe booking #BL-1728475835	2024-10-09 12:11:07	2024-10-09 12:11:07	0	0	\N	0
211	173	2352	debit	BEW-1728476398	Debited for the booking #BL-1728476367	2024-10-09 12:19:58	2024-10-09 12:19:58	0	0	\N	0
212	169	729.75	debit	BEW-1728476619	Debited for the booking #BL-1728476592	2024-10-09 12:23:39	2024-10-09 12:23:39	0	0	\N	0
213	169	50000	credit	\N	Wallet Top up 	2024-10-09 13:46:00	2024-10-09 13:46:00	1	0	RECHARGED	0
214	169	1039.5	debit	BEW-1728481598	Debited for the booking #BL-1728481597	2024-10-09 13:46:38	2024-10-09 13:46:38	0	0	\N	0
215	169	2205	debit	BEW-1728541974	Debited for thwe booking #BL-1728541972	2024-10-10 06:32:54	2024-10-10 06:32:54	0	0	\N	0
216	199	6000	credit	\N	Wallet Top up 	2024-10-10 10:34:00	2024-10-10 10:34:00	1	0	RECHARGED	0
217	199	1779.75	debit	BEW-1728556496	Debited for thwe booking #BL-1728556494	2024-10-10 10:34:56	2024-10-10 10:34:56	0	0	\N	0
218	199	656.775	debit	BEW-1728557369	Debited for thwe booking #BL-1728557367	2024-10-10 10:49:29	2024-10-10 10:49:29	0	0	\N	0
219	173	2110.5	debit	BEW-1728569293	Debited for thwe booking #BL-1728569268	2024-10-10 14:08:13	2024-10-10 14:08:13	0	0	\N	0
220	173	1690.5	debit	BEW-1728617863	Debited for thwe booking #BL-1728617862	2024-10-11 03:37:43	2024-10-11 03:37:43	0	0	\N	0
221	199	2142	debit	BEW-1729141958	Debited for thwe booking #BL-1729141929	2024-10-17 05:12:38	2024-10-17 05:12:38	0	0	\N	0
222	173	1470.84	debit	BEW-1729165348	Debited for thwe booking #BL-1729165328	2024-10-17 11:42:28	2024-10-17 11:42:28	0	0	\N	0
223	199	52.5	debit	BEW-1729174635	Debited for thwe booking #BL-1729174631	2024-10-17 14:17:15	2024-10-17 14:17:15	0	0	\N	0
224	173	105	debit	BEW-1729181717	Debited for thwe booking #BL-1729181697	2024-10-17 16:15:17	2024-10-17 16:15:17	0	0	\N	0
225	173	336	debit	BEW-1729251850	Debited for thwe booking #BL-1729251823	2024-10-18 11:44:10	2024-10-18 11:44:10	0	0	\N	0
226	173	3360	debit	BEW-1729253579	Debited for thwe booking #BL-1729253556	2024-10-18 12:12:59	2024-10-18 12:12:59	0	0	\N	0
227	173	1692.6	debit	BEW-1729270225	Debited for thwe booking #BL-1729270201	2024-10-18 16:50:25	2024-10-18 16:50:25	0	0	\N	0
228	173	1488.69	debit	BEW-1729272280	Debited for thwe booking #BL-1729272258	2024-10-18 17:24:40	2024-10-18 17:24:40	0	0	\N	0
229	193	472.5	debit	BEW-1729313852	Debited for thwe booking #BL-1728310742	2024-10-19 04:57:32	2024-10-19 04:57:32	0	0	\N	0
230	173	3885	debit	BEW-1729321609	Debited for thwe booking #BL-1729321572	2024-10-19 07:06:49	2024-10-19 07:06:49	0	0	\N	0
231	173	4147.5	debit	BEW-1729322023	Debited for thwe booking #BL-1729322001	2024-10-19 07:13:43	2024-10-19 07:13:43	0	0	\N	0
232	173	4147.5	debit	BEW-1729324226	Debited for thwe booking #BL-1729324200	2024-10-19 07:50:26	2024-10-19 07:50:26	0	0	\N	0
233	199	4037.25	debit	BEW-1729325113	Debited for thwe booking #BL-1729325091	2024-10-19 08:05:13	2024-10-19 08:05:13	0	0	\N	0
234	199	1050	debit	BEW-1729325251	Debited for thwe booking #BL-1729325229	2024-10-19 08:07:31	2024-10-19 08:07:31	0	0	\N	0
235	199	4195.8	debit	BEW-1729325697	Debited for thwe booking #BL-1729325676	2024-10-19 08:14:57	2024-10-19 08:14:57	0	0	\N	0
236	203	1795.5	debit	BEW-1729325846	Debited for thwe booking #BL-1729325828	2024-10-19 08:17:26	2024-10-19 08:17:26	0	0	\N	0
237	203	1585.5	debit	BEW-1729326017	Debited for thwe booking #BL-1729325998	2024-10-19 08:20:17	2024-10-19 08:20:17	0	0	\N	0
238	173	4095	debit	BEW-1729326283	Debited for thwe booking #BL-1729326260	2024-10-19 08:24:43	2024-10-19 08:24:43	0	0	\N	0
239	202	2961	debit	BEW-1729328379	Debited for thwe booking #BL-1729328350	2024-10-19 08:59:39	2024-10-19 08:59:39	0	0	\N	0
240	202	562.8	debit	BEW-1729328553	Debited for thwe booking #BL-1729328534	2024-10-19 09:02:33	2024-10-19 09:02:33	0	0	\N	0
241	202	703.5	debit	BEW-1729330751	Debited for thwe booking #BL-1729330731	2024-10-19 09:39:11	2024-10-19 09:39:11	0	0	\N	0
242	203	4525.5	debit	BEW-1729336200	Debited for thwe booking #BL-1729336181	2024-10-19 11:10:00	2024-10-19 11:10:00	0	0	\N	0
243	203	4315.5	debit	BEW-1729337614	Debited for thwe booking #BL-1729337588	2024-10-19 11:33:34	2024-10-19 11:33:34	0	0	\N	0
244	173	2982	debit	BEW-1729338076	Debited for thwe booking #BL-1729338055	2024-10-19 11:41:16	2024-10-19 11:41:16	0	0	\N	0
245	203	4525.5	debit	BEW-1729339299	Debited for thwe booking #BL-1729339275	2024-10-19 12:01:39	2024-10-19 12:01:39	0	0	\N	0
246	173	2087.4	debit	BEW-1729339408	Debited for thwe booking #BL-1729339381	2024-10-19 12:03:28	2024-10-19 12:03:28	0	0	\N	0
247	205	2000	credit	\N	Wallet Top up 	2024-10-23 01:04:00	2024-10-23 01:04:00	1	0	RECHARGED	0
248	205	210	credit	\N	booking cancellation refund	2024-10-23 04:12:00	2024-10-23 04:12:00	0	0	credit	0
249	205	210	credit	\N	booking cancellation refund	2024-10-23 04:14:00	2024-10-23 04:14:00	0	0	credit	0
250	203	210	credit	\N	booking cancellation refund	2024-10-23 05:20:00	2024-10-23 05:20:00	0	0	credit	0
251	205	210	credit	\N	booking cancellation refund	2024-10-23 11:34:00	2024-10-23 11:34:00	0	0	credit	0
252	199	2142	credit	\N	booking cancellation refund	2024-10-28 07:07:00	2024-10-28 07:07:00	0	0	credit	0
253	199	2142	credit	\N	booking cancellation refund	2024-10-28 07:07:00	2024-10-28 07:07:00	0	0	credit	0
254	199	630	credit	\N	booking cancellation refund	2024-10-28 07:17:00	2024-10-28 07:17:00	0	0	credit	0
255	232	500	credit	\N	Wallet Top up 	2024-11-05 10:46:00	2024-11-05 10:46:00	1	0	RECHARGED	0
256	199	50000	credit	\N	Wallet Top up 	2024-11-05 13:13:00	2024-11-05 13:13:00	1	0	RECHARGED	0
257	233	1018.5	credit	\N	booking cancellation refund	2024-11-05 14:30:00	2024-11-05 14:30:00	0	0	credit	0
258	233	1575	credit	\N	booking cancellation refund	2024-11-05 14:37:00	2024-11-05 14:37:00	0	0	credit	0
259	221	1000	credit	\N	Wallet Top up 	2024-11-05 15:19:00	2024-11-05 15:19:00	1	0	RECHARGED	0
260	221	105	debit	BEW-1730820562	Debited for thwe booking #BL-1730820560	2024-11-05 15:29:22	2024-11-05 15:29:22	0	0	\N	0
261	233	2142	debit	BEW-1730821719	Debited for thwe booking #BL-1730821717	2024-11-05 15:48:39	2024-11-05 15:48:39	0	0	\N	0
262	236	5000	credit	\N	Wallet Top up 	2024-11-06 07:52:00	2024-11-06 07:52:00	1	0	RECHARGED	0
263	236	1890	debit	BEW-1730879601	Debited for thwe booking #BL-1730879599	2024-11-06 07:53:21	2024-11-06 07:53:21	0	0	debit	0
264	199	3354.75	debit	BEW-1730894462	Debited for thwe booking #BL-1730894461	2024-11-06 12:01:02	2024-11-06 12:01:02	0	0	debit	0
265	199	1677.375	credit	\N	booking cancellation refund	2024-11-06 12:01:00	2024-11-06 12:01:00	0	0	credit	0
266	238	20000	credit	\N	Wallet Top up 	2024-11-06 12:52:00	2024-11-06 12:52:00	1	0	RECHARGED	0
267	238	1323	debit	BEW-1730905696	Debited for thwe booking #BL-1730905695	2024-11-06 15:08:16	2024-11-06 15:08:16	0	0	debit	0
268	199	1449	debit	BEW-1730999500	Debited for thwe booking #BL-1730999497	2024-11-07 17:11:40	2024-11-07 17:11:40	0	0	debit	0
269	231	5000	credit	\N	Wallet Top up 	2024-11-08 08:37:00	2024-11-08 08:37:00	1	0	RECHARGED	0
270	231	1058.4	debit	BEW-1731058436	Debited for thwe booking #BL-1731058435	2024-11-08 09:33:56	2024-11-08 09:33:56	0	0	debit	0
271	231	1058.4	credit	\N	booking cancellation refund	2024-11-08 09:36:00	2024-11-08 09:36:00	0	0	credit	0
\.


--
-- Data for Name: wallet_payment_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_payment_report (id, transaction_id, payment_status, user_id, ref_id, amount, method_type, created_at, updated_at) FROM stdin;
1	16666fe814ec377a1727955278	A	166	pi_3Q5nIoBjsMxFtgBe1p1R0W6m	3.00	1	2024-10-03 11:34:38	2024-10-03 16:03:31
2	15566fe98c5449b11727961285	P	155	pi_3Q5orhBjsMxFtgBe0DA9SxSO	10.00	1	2024-10-03 13:14:45	\N
3	15566fe991cd724e1727961372	A	155	pi_3Q5ot6BjsMxFtgBe0po9otCn	3.00	1	2024-10-03 13:16:12	2024-10-03 17:18:17
4	15566feb07a626111727967354	P	155	pi_3Q5qRaBjsMxFtgBe0f34Up8G	3.00	1	2024-10-03 14:55:54	\N
5	15566feb0822fe621727967362	P	155	pi_3Q5qRiBjsMxFtgBe0PqbVJLb	3.00	2	2024-10-03 14:56:02	\N
6	15566febbed2161e1727970285	P	155	pi_3Q5rCqBjsMxFtgBe0ONjv7vT	50.00	2	2024-10-03 15:44:45	\N
7	15566febc83b6adb1727970435	P	155	pi_3Q5rFHBjsMxFtgBe0s7yT8ku	50.00	2	2024-10-03 15:47:15	\N
8	15566febc8a1fde41727970442	P	155	pi_3Q5rFNBjsMxFtgBe132lUKhn	50.00	1	2024-10-03 15:47:22	\N
9	15566febd739928e1727970675	P	155	pi_3Q5rJ9BjsMxFtgBe1OJN4PAe	25.00	1	2024-10-03 15:51:15	\N
10	15566febdffb496b1727970815	P	155	pi_3Q5rLPBjsMxFtgBe0NFWgY1u	50.00	1	2024-10-03 15:53:35	\N
11	15566fec214c05871727971860	P	155	pi_3Q5rcGBjsMxFtgBe0Gip1jRy	50.00	2	2024-10-03 16:11:00	\N
12	15566fec22317ceb1727971875	A	155	pi_3Q5rcUBjsMxFtgBe0I4rrFFP	50.00	1	2024-10-03 16:11:15	2024-10-03 20:11:40
13	15566fec2507694d1727971920	A	155	pi_3Q5rdEBjsMxFtgBe1pmR8nXy	1600.00	1	2024-10-03 16:12:00	2024-10-03 20:12:23
14	15566fecabb799bb1727974075	A	155	pi_3Q5sBzBjsMxFtgBe1BjABj3A	6000.00	1	2024-10-03 16:47:55	2024-10-03 20:48:24
15	15566fecd4f88eff1727974735	A	155	pi_3Q5sMdBjsMxFtgBe19YzuRsi	10000.00	1	2024-10-03 16:58:55	2024-10-03 20:59:22
16	15566fecf545078f1727975252	A	155	pi_3Q5sUyBjsMxFtgBe00UUwAUY	5000.00	1	2024-10-03 17:07:32	2024-10-03 21:08:03
17	16666ff8945d8b291728022853	P	166	pi_3Q64sjBjsMxFtgBe1adRZGQ3	3.00	1	2024-10-04 06:20:53	\N
18	1556703efb0972691728311216	A	155	pi_3Q7HtkBjsMxFtgBe19mO2BzW	5000.00	1	2024-10-07 14:26:56	2024-10-07 18:27:25
19	9767041a316a0f01728322097	A	97	pi_3Q7KjFBjsMxFtgBe06wZG8Ke	100.00	1	2024-10-07 17:28:17	2024-10-07 21:28:44
20	9767043526b3c441728328998	P	97	pi_3Q7MWYBjsMxFtgBe0dVO1oxC	200.00	1	2024-10-07 19:23:18	\N
21	9767043a8bac7891728330379	A	97	pi_3Q7MspBjsMxFtgBe1nfv0e1o	3000.00	1	2024-10-07 19:46:19	2024-10-07 23:46:39
22	9767043b21edb701728330529	A	97	pi_3Q7MvFBjsMxFtgBe1PpaoDzZ	100.00	1	2024-10-07 19:48:49	2024-10-07 23:49:11
23	1696704c6e0482bc1728366304	A	169	pi_3Q7WEGBjsMxFtgBe0nagx4SO	5000.00	1	2024-10-08 05:45:04	2024-10-08 09:45:33
24	1706704e12852d781728373032	A	170	pi_3Q7XymBjsMxFtgBe1x11zqtx	5000.00	1	2024-10-08 07:37:12	2024-10-08 11:38:11
25	17367060238caacd1728447032	A	173	pi_3Q7rEKBjsMxFtgBe1WNJXYJN	2000.00	1	2024-10-09 04:10:32	2024-10-09 08:10:49
26	173670602c04eb181728447168	A	173	pi_3Q7rGWBjsMxFtgBe1QK0MEp3	20000.00	1	2024-10-09 04:12:48	2024-10-09 08:13:07
27	1696706314064a001728459072	P	169	pi_3Q7uMWBjsMxFtgBe1SXlwL7E	5000.00	1	2024-10-09 07:31:12	\N
28	1696706315dc66611728459101	A	169	pi_3Q7uMzBjsMxFtgBe0oMRQB0o	5000.00	1	2024-10-09 07:31:41	2024-10-09 11:32:22
29	169670688e11cbc61728481505	P	169	pi_3Q80CKBjsMxFtgBe1azNj3Gu	50000.00	1	2024-10-09 13:45:05	\N
30	1696706891c1d9191728481564	A	169	pi_3Q80DHBjsMxFtgBe1OTHPDhy	50000.00	1	2024-10-09 13:46:04	2024-10-09 17:46:31
31	1996707adacae9321728556460	A	199	pi_3Q8JhIBjsMxFtgBe1yfSxRUO	6000.00	1	2024-10-10 10:34:20	2024-10-10 14:34:48
32	20567184ba2d84e21729645474	A	205	pi_3QCt02BjsMxFtgBe1TTSqj3f	2000.00	1	2024-10-23 01:04:34	2024-10-23 05:04:52
33	20967206f3ab89ab1730178874	P	209	pi_3QF7lGBjsMxFtgBe0v9eeWeM	5000.00	1	2024-10-29 05:14:34	\N
34	2326729f7412a1c81730803521	A	232	pi_3QHkGCBjsMxFtgBe0AeMqwNv	500.00	1	2024-11-05 10:45:21	2024-11-05 14:46:42
35	221672a122a82fb91730810410	P	221	pi_3QHm3KBjsMxFtgBe1LUpmS4m	100.00	1	2024-11-05 12:40:10	\N
36	199672a19e01ec941730812384	A	199	pi_3QHmZ9BjsMxFtgBe0x9Dj7lg	50000.00	1	2024-11-05 13:13:04	2024-11-05 17:13:35
37	221672a376c45ff61730819948	A	221	pi_3QHoXABjsMxFtgBe05X3Omxt	1000.00	1	2024-11-05 15:19:08	2024-11-05 19:19:25
38	236672b202733f2a1730879527	A	236	pi_3QI426BjsMxFtgBe0ZPtb3a1	5000.00	1	2024-11-06 07:52:07	2024-11-06 11:52:29
39	238672b66685ec3f1730897512	A	238	pi_3QI8iCBjsMxFtgBe1A9nNNjz	20000.00	1	2024-11-06 12:51:52	2024-11-06 16:52:12
40	231672dcd9b33ff11731055003	A	231	pi_3QIngMBjsMxFtgBe0C9mYdB1	5000.00	1	2024-11-08 08:36:43	2024-11-08 12:37:03
\.


--
-- Data for Name: wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallets (id, user_id, balance, created_at, updated_at) FROM stdin;
4	135	1575.00	2024-10-01 10:49:39	2024-10-01 10:52:29
3	143	2625.00	2024-10-01 10:43:32	2024-10-01 11:01:03
8	203	210.00	2024-10-23 09:20:24	2024-10-23 09:20:24
10	233	2593.50	2024-11-05 18:30:24	2024-11-05 18:37:16
9	199	6591.38	2024-10-28 11:07:43	2024-11-06 16:01:33
11	231	1058.40	2024-11-08 13:36:36	2024-11-08 13:36:36
\.


--
-- Data for Name: wish_lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wish_lists (id, user_id, type, package_id, yatch_id, created_at, updated_at) FROM stdin;
4	30	package	3	0	2024-08-09 22:49:16	2024-08-09 22:49:16
6	73	package	1	0	2024-08-12 20:27:12	2024-08-12 20:27:12
8	66	package	2	0	2024-08-13 09:48:37	2024-08-13 09:48:37
10	66	package	31	0	2024-08-13 12:51:55	2024-08-13 12:51:55
11	73	package	93	0	2024-08-13 21:02:27	2024-08-13 21:02:27
12	73	package	31	0	2024-08-13 21:34:54	2024-08-13 21:34:54
13	78	package	128	0	2024-08-23 08:24:33	2024-08-23 08:24:33
18	78	package	6	0	2024-08-23 17:39:44	2024-08-23 17:39:44
19	78	package	130	0	2024-08-23 17:42:26	2024-08-23 17:42:26
30	0	package	3	0	2024-08-26 15:08:37	2024-08-26 15:08:37
38	83	package	115	0	2024-08-26 19:29:49	2024-08-26 19:29:49
39	83	package	1	0	2024-08-26 19:29:51	2024-08-26 19:29:51
41	125	package	129	0	2024-09-10 12:29:24	2024-09-10 12:29:24
67	135	package	130	0	2024-09-19 14:17:36	2024-09-19 14:17:36
68	134	package	115	0	2024-09-19 14:17:49	2024-09-19 14:17:49
69	134	package	130	0	2024-09-19 14:17:52	2024-09-19 14:17:52
70	51	package	129	0	2024-09-30 17:01:17	2024-09-30 17:01:17
76	155	package	153	0	2024-10-01 11:31:56	2024-10-01 11:31:56
77	155	package	152	0	2024-10-01 11:31:57	2024-10-01 11:31:57
78	155	package	129	0	2024-10-01 11:31:59	2024-10-01 11:31:59
82	51	package	153	0	2024-10-02 07:23:40	2024-10-02 07:23:40
83	99	package	157	0	2024-10-08 02:24:28	2024-10-08 02:24:28
84	169	package	157	0	2024-10-08 06:38:04	2024-10-08 06:38:04
85	169	package	159	0	2024-10-09 12:22:41	2024-10-09 12:22:41
86	169	package	115	0	2024-10-09 18:00:01	2024-10-09 18:00:01
87	169	package	129	0	2024-10-09 18:00:03	2024-10-09 18:00:03
88	169	package	154	0	2024-10-09 18:00:04	2024-10-09 18:00:04
89	169	package	1	0	2024-10-09 18:00:05	2024-10-09 18:00:05
90	169	package	125	0	2024-10-09 18:00:07	2024-10-09 18:00:07
91	169	package	153	0	2024-10-09 18:00:21	2024-10-09 18:00:21
92	169	package	160	0	2024-10-09 18:00:23	2024-10-09 18:00:23
\.


--
-- Data for Name: yach_time_schedules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.yach_time_schedules (id, yatch_id, day, slot, created_at, updated_at) FROM stdin;
1	17	sun	02:00:00	2024-07-18 06:16:47	2024-07-18 06:16:47
70	19	sun	00:00:00	2024-07-23 23:02:02	2024-07-23 23:02:02
71	19	sun	01:00:00	2024-07-23 23:02:02	2024-07-23 23:02:02
72	19	tue	03:00:00	2024-07-23 23:02:02	2024-07-23 23:02:02
73	19	wed	00:00:00	2024-07-23 23:02:02	2024-07-23 23:02:02
74	19	wed	04:00:00	2024-07-23 23:02:02	2024-07-23 23:02:02
75	19	thu	05:00:00	2024-07-23 23:02:02	2024-07-23 23:02:02
76	19	fri	06:00:00	2024-07-23 23:02:02	2024-07-23 23:02:02
77	19	sat	07:00:00	2024-07-23 23:02:02	2024-07-23 23:02:02
78	24	mon	02:00:00	2024-07-24 06:46:25	2024-07-24 06:46:25
79	24	mon	03:00:00	2024-07-24 06:46:25	2024-07-24 06:46:25
1030	42	sun	09:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1031	42	sun	19:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1032	42	sun	20:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1033	42	sun	10:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1034	42	sun	11:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1035	42	sun	12:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1036	42	sun	13:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1037	42	sun	14:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1038	42	sun	15:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1039	42	sun	16:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1040	42	sun	17:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1041	42	sun	18:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1042	42	mon	09:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1043	42	mon	19:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1044	42	mon	20:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
95	18	sun	00:00:00	2024-07-24 19:21:04	2024-07-24 19:21:04
96	18	sun	01:00:00	2024-07-24 19:21:05	2024-07-24 19:21:05
97	18	sun	04:00:00	2024-07-24 19:21:05	2024-07-24 19:21:05
98	18	sun	06:00:00	2024-07-24 19:21:05	2024-07-24 19:21:05
99	18	sun	09:00:00	2024-07-24 19:21:05	2024-07-24 19:21:05
100	18	mon	00:00:00	2024-07-24 19:21:05	2024-07-24 19:21:05
101	18	mon	04:00:00	2024-07-24 19:21:05	2024-07-24 19:21:05
102	18	tue	03:00:00	2024-07-24 19:21:05	2024-07-24 19:21:05
103	18	wed	00:00:00	2024-07-24 19:21:05	2024-07-24 19:21:05
104	18	wed	05:00:00	2024-07-24 19:21:05	2024-07-24 19:21:05
105	18	thu	00:00:00	2024-07-24 19:21:05	2024-07-24 19:21:05
106	18	thu	11:00:00	2024-07-24 19:21:05	2024-07-24 19:21:05
107	18	fri	08:00:00	2024-07-24 19:21:05	2024-07-24 19:21:05
108	18	fri	13:00:00	2024-07-24 19:21:05	2024-07-24 19:21:05
109	18	sat	00:00:00	2024-07-24 19:21:05	2024-07-24 19:21:05
110	18	sat	01:00:00	2024-07-24 19:21:05	2024-07-24 19:21:05
111	18	sat	08:00:00	2024-07-24 19:21:05	2024-07-24 19:21:05
112	27	sun	09:00:00	2024-07-29 06:48:37	2024-07-29 06:48:37
113	27	mon	09:00:00	2024-07-29 06:48:37	2024-07-29 06:48:37
114	27	fri	09:00:00	2024-07-29 06:48:37	2024-07-29 06:48:37
115	27	sat	09:00:00	2024-07-29 06:48:37	2024-07-29 06:48:37
306	30	sun	02:00:00	2024-08-13 09:27:59	2024-08-13 09:27:59
307	30	sun	03:00:00	2024-08-13 09:27:59	2024-08-13 09:27:59
308	30	sun	10:00:00	2024-08-13 09:27:59	2024-08-13 09:27:59
309	30	mon	10:00:00	2024-08-13 09:27:59	2024-08-13 09:27:59
310	30	mon	12:00:00	2024-08-13 09:27:59	2024-08-13 09:27:59
311	30	tue	09:00:00	2024-08-13 09:27:59	2024-08-13 09:27:59
122	23	sun	02:00:00	2024-08-08 07:50:24	2024-08-08 07:50:24
123	23	sun	03:00:00	2024-08-08 07:50:24	2024-08-08 07:50:24
124	23	sun	10:00:00	2024-08-08 07:50:24	2024-08-08 07:50:24
125	23	mon	10:00:00	2024-08-08 07:50:24	2024-08-08 07:50:24
126	23	mon	12:00:00	2024-08-08 07:50:24	2024-08-08 07:50:24
127	23	tue	09:00:00	2024-08-08 07:50:24	2024-08-08 07:50:24
128	23	tue	10:00:00	2024-08-08 07:50:24	2024-08-08 07:50:24
129	23	tue	11:00:00	2024-08-08 07:50:24	2024-08-08 07:50:24
1045	42	mon	10:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
429	31	wed	08:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
430	31	wed	09:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
431	31	wed	10:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
432	31	wed	11:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
312	30	tue	10:00:00	2024-08-13 09:27:59	2024-08-13 09:27:59
313	30	tue	11:00:00	2024-08-13 09:27:59	2024-08-13 09:27:59
314	30	tue	01:00:00	2024-08-13 09:27:59	2024-08-13 09:27:59
130	23	tue	13:00:00	2024-08-08 07:50:24	2024-08-08 07:50:24
131	23	tue	14:00:00	2024-08-08 07:50:24	2024-08-08 07:50:24
132	23	tue	15:00:00	2024-08-08 07:50:24	2024-08-08 07:50:24
133	23	tue	16:00:00	2024-08-08 07:50:24	2024-08-08 07:50:24
134	23	wed	13:00:00	2024-08-08 07:50:24	2024-08-08 07:50:24
315	30	tue	02:00:00	2024-08-13 09:27:59	2024-08-13 09:27:59
316	30	tue	03:00:00	2024-08-13 09:27:59	2024-08-13 09:27:59
317	30	tue	04:00:00	2024-08-13 09:27:59	2024-08-13 09:27:59
318	30	wed	13:00:00	2024-08-13 09:27:59	2024-08-13 09:27:59
326	33	sun	00:00:00	2024-08-13 09:41:37	2024-08-13 09:41:37
327	33	mon	00:00:00	2024-08-13 09:41:37	2024-08-13 09:41:37
328	33	tue	00:00:00	2024-08-13 09:41:37	2024-08-13 09:41:37
329	33	wed	00:00:00	2024-08-13 09:41:37	2024-08-13 09:41:37
330	33	thu	00:00:00	2024-08-13 09:41:37	2024-08-13 09:41:37
433	31	wed	12:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
434	31	wed	13:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
435	31	wed	14:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
436	31	wed	15:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
437	31	wed	16:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
438	31	wed	18:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
439	31	wed	19:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
440	31	wed	21:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
441	31	wed	20:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
442	31	wed	17:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
443	31	thu	08:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
444	31	thu	09:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
445	31	thu	10:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
446	31	thu	17:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
447	31	thu	18:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
448	31	thu	19:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
449	31	thu	20:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
450	31	thu	21:00:00	2024-08-14 08:51:07	2024-08-14 08:51:07
1528	45	sun	02:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1529	45	sun	06:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1530	45	sun	09:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1531	45	sun	12:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1046	42	mon	11:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1047	42	mon	12:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1048	42	mon	13:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1049	42	mon	14:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1050	42	mon	15:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1051	42	mon	16:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1052	42	mon	17:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1053	42	mon	18:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1054	42	tue	09:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1055	42	tue	19:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1056	42	tue	20:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1057	42	tue	10:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1058	42	tue	11:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1059	42	tue	12:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1060	42	tue	13:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1061	42	tue	14:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1062	42	tue	15:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1063	42	tue	16:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1304	36	sun	09:00:00	2024-08-21 10:57:12	2024-08-21 10:57:12
1305	36	sun	19:00:00	2024-08-21 10:57:12	2024-08-21 10:57:12
1306	36	sun	10:00:00	2024-08-21 10:57:12	2024-08-21 10:57:12
1307	36	sun	11:00:00	2024-08-21 10:57:12	2024-08-21 10:57:12
1308	36	sun	12:00:00	2024-08-21 10:57:12	2024-08-21 10:57:12
1309	36	sun	13:00:00	2024-08-21 10:57:12	2024-08-21 10:57:12
1310	36	sun	14:00:00	2024-08-21 10:57:12	2024-08-21 10:57:12
1311	36	sun	15:00:00	2024-08-21 10:57:12	2024-08-21 10:57:12
1312	36	sun	16:00:00	2024-08-21 10:57:12	2024-08-21 10:57:12
1313	36	sun	17:00:00	2024-08-21 10:57:12	2024-08-21 10:57:12
1314	36	sun	18:00:00	2024-08-21 10:57:12	2024-08-21 10:57:12
1315	36	mon	09:00:00	2024-08-21 10:57:12	2024-08-21 10:57:12
1316	36	mon	19:00:00	2024-08-21 10:57:12	2024-08-21 10:57:12
1317	36	mon	10:00:00	2024-08-21 10:57:12	2024-08-21 10:57:12
1318	36	mon	11:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1319	36	mon	12:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
331	32	sun	04:00:00	2024-08-13 10:58:05	2024-08-13 10:58:05
332	32	sun	05:00:00	2024-08-13 10:58:05	2024-08-13 10:58:05
333	32	sun	06:00:00	2024-08-13 10:58:05	2024-08-13 10:58:05
334	32	sat	03:00:00	2024-08-13 10:58:05	2024-08-13 10:58:05
335	32	sat	05:00:00	2024-08-13 10:58:05	2024-08-13 10:58:05
336	32	sat	08:00:00	2024-08-13 10:58:05	2024-08-13 10:58:05
1320	36	mon	13:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
923	37	fri	04:00:00	2024-08-20 08:05:25	2024-08-20 08:05:25
1321	36	mon	14:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1322	36	mon	15:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1323	36	mon	16:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1324	36	mon	17:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1532	45	sun	13:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1533	45	sun	11:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1534	45	sun	10:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1535	45	sun	08:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1536	45	sun	07:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1537	45	mon	06:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1538	45	mon	12:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1325	36	mon	18:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1539	45	mon	13:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1540	45	tue	01:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1541	45	tue	06:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1542	45	tue	12:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1543	45	tue	13:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1544	45	wed	06:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1545	45	wed	07:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1546	45	wed	08:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1547	45	wed	09:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1548	45	wed	11:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1549	45	wed	12:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1550	45	wed	13:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1326	36	tue	09:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1551	45	thu	13:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1552	45	thu	12:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1553	45	thu	09:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1554	45	thu	11:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1555	45	thu	07:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1556	45	thu	08:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1557	45	thu	06:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1558	45	fri	12:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1559	45	fri	13:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1560	45	fri	11:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1561	45	fri	09:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1562	45	fri	08:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1327	36	tue	19:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1563	45	fri	06:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1564	45	fri	07:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1565	45	sat	12:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1566	45	sat	10:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1567	45	sat	11:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1568	45	sat	07:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
1569	45	sat	06:00:00	2024-08-22 11:59:57	2024-08-22 11:59:57
2149	64	sun	00:00:00	2024-09-16 10:14:46	2024-09-16 10:14:46
2150	64	sun	02:00:00	2024-09-16 10:14:46	2024-09-16 10:14:46
2151	64	sun	01:00:00	2024-09-16 10:14:46	2024-09-16 10:14:46
2152	64	sun	03:00:00	2024-09-16 10:14:46	2024-09-16 10:14:46
2153	64	sun	04:00:00	2024-09-16 10:14:46	2024-09-16 10:14:46
2154	64	sun	05:00:00	2024-09-16 10:14:46	2024-09-16 10:14:46
2155	64	sun	06:00:00	2024-09-16 10:14:46	2024-09-16 10:14:46
2156	64	sun	07:00:00	2024-09-16 10:14:46	2024-09-16 10:14:46
2157	64	sun	08:00:00	2024-09-16 10:14:46	2024-09-16 10:14:46
2158	64	sun	09:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2159	64	sun	10:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2160	64	sun	11:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2161	64	sun	12:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2162	64	sun	13:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2163	64	sun	14:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2164	64	sun	15:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2165	64	sun	16:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2166	64	sun	17:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2167	64	sun	18:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2168	64	sun	19:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2169	64	sun	20:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2170	64	sun	21:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2171	64	sun	22:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2172	64	sun	23:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2173	64	mon	23:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2174	64	mon	21:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2175	64	mon	22:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2176	64	mon	20:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2177	64	mon	18:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2178	64	mon	19:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2179	64	mon	17:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2180	64	mon	16:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2181	64	mon	14:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2182	64	mon	15:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2183	64	mon	13:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2184	64	mon	12:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2185	64	mon	11:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2186	64	mon	10:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2187	64	mon	09:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2188	64	mon	08:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2189	64	mon	07:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2190	64	mon	06:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2191	64	mon	04:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2192	64	mon	05:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2193	64	tue	23:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2194	64	tue	22:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2195	64	tue	21:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
1328	36	tue	10:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1329	36	tue	11:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1330	36	tue	12:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1331	36	tue	13:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1332	36	tue	14:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1333	36	tue	15:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1334	36	tue	16:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1335	36	tue	17:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1336	36	tue	18:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1337	36	wed	09:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1338	36	wed	19:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1339	36	wed	10:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1340	36	wed	11:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1341	36	wed	12:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1342	36	wed	13:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1343	36	wed	14:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1344	36	wed	15:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1345	36	wed	16:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1346	36	wed	17:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1347	36	wed	18:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1348	36	thu	09:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1349	36	thu	19:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1350	36	thu	10:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1351	36	thu	11:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1352	36	thu	12:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1353	36	thu	13:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1354	36	thu	14:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1355	36	thu	15:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1356	36	thu	16:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1357	36	thu	17:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1358	36	thu	18:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1359	36	fri	09:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1360	36	fri	19:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1361	36	fri	10:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1362	36	fri	11:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1363	36	fri	12:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1364	36	fri	13:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1365	36	fri	14:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1366	36	fri	15:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1367	36	fri	16:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1368	36	fri	17:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1369	36	fri	18:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1370	36	sat	09:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1371	36	sat	19:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1372	36	sat	10:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1373	36	sat	11:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1374	36	sat	12:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1375	36	sat	13:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1064	42	tue	17:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
912	37	tue	04:00:00	2024-08-20 08:05:14	2024-08-20 08:05:14
915	37	wed	04:00:00	2024-08-20 08:05:16	2024-08-20 08:05:16
637	4	sun	04:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
638	4	sun	18:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
639	4	sun	17:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
640	4	sun	16:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
641	4	sun	15:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
642	4	sun	14:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
643	4	sun	13:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
644	4	sun	11:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
645	4	sun	12:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
646	4	sun	10:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
647	4	sun	09:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
648	4	sun	08:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
649	4	sun	07:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
650	4	mon	04:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
651	4	mon	18:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
652	4	mon	17:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
653	4	mon	16:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
654	4	mon	15:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
655	4	mon	14:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
656	4	mon	13:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
657	4	mon	12:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
658	4	mon	11:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
659	4	mon	10:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
660	4	mon	09:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
661	4	mon	08:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
662	4	mon	07:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
663	4	tue	04:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
664	4	tue	18:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
665	4	tue	17:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
666	4	tue	16:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
667	4	tue	15:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
668	4	tue	14:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
669	4	tue	13:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
670	4	tue	12:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
671	4	tue	09:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
672	4	tue	10:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
673	4	tue	11:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
674	4	tue	08:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
675	4	tue	07:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
676	4	wed	04:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
677	4	wed	18:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
678	4	wed	16:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
679	4	wed	14:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
680	4	wed	13:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
681	4	wed	12:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
682	4	wed	11:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
683	4	wed	10:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
684	4	wed	08:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
685	4	wed	06:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
686	4	thu	18:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
687	4	thu	17:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
688	4	thu	16:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
689	4	thu	12:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
690	4	fri	04:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
691	4	fri	05:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
692	4	fri	06:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
693	4	fri	08:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
694	4	fri	10:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
695	4	fri	07:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
696	4	fri	09:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
697	4	fri	11:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
698	4	fri	12:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
699	4	fri	13:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
927	37	sat	04:00:00	2024-08-20 08:05:29	2024-08-20 08:05:29
700	4	fri	14:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
701	4	fri	15:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
702	4	fri	16:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
703	4	fri	17:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
704	4	fri	18:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
705	4	sat	04:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
706	4	sat	05:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
707	4	sat	06:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
708	4	sat	07:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
709	4	sat	09:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
710	4	sat	10:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
711	4	sat	12:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
712	4	sat	13:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
713	4	sat	11:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
714	4	sat	08:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
715	4	sat	15:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
716	4	sat	14:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
717	4	sat	17:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
718	4	sat	16:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
719	4	sat	18:00:00	2024-08-16 11:36:26	2024-08-16 11:36:26
1065	42	tue	18:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1066	42	wed	09:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
907	37	sun	04:00:00	2024-08-20 08:05:07	2024-08-20 08:05:07
723	29	sun	08:00:00	2024-08-16 12:53:51	2024-08-16 12:53:51
724	29	sun	09:00:00	2024-08-16 12:53:51	2024-08-16 12:53:51
725	29	sun	10:00:00	2024-08-16 12:53:51	2024-08-16 12:53:51
726	29	sun	11:00:00	2024-08-16 12:53:51	2024-08-16 12:53:51
727	29	sun	14:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
728	29	mon	16:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
729	29	mon	10:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
730	29	mon	18:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
731	29	mon	12:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
732	29	tue	15:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
733	29	tue	07:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
734	29	tue	09:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
735	29	tue	12:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
736	29	tue	13:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
737	29	tue	18:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
738	29	tue	19:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
739	29	tue	20:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
740	29	wed	17:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
741	29	wed	13:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
742	29	wed	15:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
743	29	wed	16:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
744	29	wed	14:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
745	29	wed	10:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
746	29	wed	08:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
747	29	wed	06:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
748	29	wed	19:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
749	29	thu	10:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
750	29	thu	12:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
751	29	thu	14:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
752	29	thu	15:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
753	29	thu	16:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
754	29	thu	18:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
755	29	thu	17:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
756	29	fri	08:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
757	29	fri	10:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
758	29	fri	12:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
759	29	fri	14:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
760	29	sat	07:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
761	29	sat	08:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
762	29	sat	10:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
763	29	sat	09:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
764	29	sat	12:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
765	29	sat	13:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
766	29	sat	15:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
767	29	sat	14:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
768	29	sat	16:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
769	29	sat	18:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
770	29	sat	17:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
771	29	sat	11:00:00	2024-08-16 12:53:52	2024-08-16 12:53:52
1067	42	wed	19:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1068	42	wed	20:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1069	42	wed	10:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1070	42	wed	11:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1071	42	wed	12:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1376	36	sat	14:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1377	36	sat	15:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1378	36	sat	16:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1379	36	sat	17:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1380	36	sat	18:00:00	2024-08-21 10:57:13	2024-08-21 10:57:13
1444	28	sun	09:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1445	28	sun	19:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1446	28	sun	20:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1447	28	sun	10:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1448	28	sun	11:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1449	28	sun	12:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1450	28	sun	13:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1451	28	sun	14:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1452	28	sun	15:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1453	28	sun	16:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1454	28	sun	17:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1455	28	sun	18:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1456	28	mon	09:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1457	28	mon	19:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1458	28	mon	20:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1459	28	mon	10:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1460	28	mon	11:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1461	28	mon	12:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1462	28	mon	13:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1463	28	mon	14:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1464	28	mon	15:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1465	28	mon	16:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1466	28	mon	17:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1467	28	mon	18:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1468	28	tue	09:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1469	28	tue	19:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1470	28	tue	20:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
910	37	mon	04:00:00	2024-08-20 08:05:11	2024-08-20 08:05:11
1471	28	tue	10:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1472	28	tue	11:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1473	28	tue	12:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1474	28	tue	13:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1475	28	tue	14:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1476	28	tue	15:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1477	28	tue	16:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1072	42	wed	13:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1073	42	wed	14:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1074	42	wed	15:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1075	42	wed	16:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1076	42	wed	17:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1077	42	wed	18:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1078	42	thu	09:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1079	42	thu	19:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1080	42	thu	20:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1081	42	thu	10:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1082	42	thu	11:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1083	42	thu	12:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1084	42	thu	13:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1085	42	thu	14:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1086	42	thu	15:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1087	42	thu	16:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1088	42	thu	17:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1089	42	thu	18:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1090	42	fri	09:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1091	42	fri	19:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1092	42	fri	20:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1093	42	fri	10:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1094	42	fri	11:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1095	42	fri	12:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1096	42	fri	13:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1097	42	fri	14:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1098	42	fri	15:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1099	42	fri	16:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1100	42	fri	17:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1101	42	fri	18:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1102	42	sat	09:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1103	42	sat	19:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1104	42	sat	20:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1105	42	sat	10:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1106	42	sat	11:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1107	42	sat	12:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1108	42	sat	13:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1109	42	sat	14:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1110	42	sat	15:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1111	42	sat	16:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1112	42	sat	17:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
1113	42	sat	18:00:00	2024-08-20 21:12:12	2024-08-20 21:12:12
2196	64	tue	20:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2197	64	tue	18:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2198	64	tue	19:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
1586	45	fri	02:00:00	2024-08-22 12:25:39	2024-08-22 12:25:39
2199	64	tue	16:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2200	64	tue	17:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2201	64	tue	15:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2202	64	tue	14:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2203	64	tue	12:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2204	64	tue	13:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2205	64	tue	10:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2206	64	tue	11:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2207	64	tue	08:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2208	64	tue	09:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2209	64	tue	06:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2210	64	tue	07:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2211	64	tue	05:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2212	64	tue	04:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2213	64	wed	23:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2214	64	wed	21:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2215	64	wed	22:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2216	64	wed	20:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2217	64	wed	18:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2218	64	wed	19:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2219	64	wed	16:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2220	64	wed	17:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2221	64	wed	14:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2222	64	wed	15:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2223	64	wed	12:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2224	64	wed	13:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2225	64	wed	10:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2226	64	wed	11:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2227	64	wed	09:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2228	64	wed	08:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2229	64	wed	06:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2230	64	wed	07:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2231	64	wed	04:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2232	64	wed	05:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2233	64	thu	23:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2234	64	thu	21:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2235	64	thu	20:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2236	64	thu	22:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2237	64	thu	19:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2238	64	thu	18:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2239	64	thu	16:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2240	64	thu	17:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2241	64	thu	15:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2242	64	thu	14:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2243	64	thu	12:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2244	64	thu	13:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2245	64	thu	10:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2246	64	thu	11:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2247	64	thu	09:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2248	64	thu	08:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2249	64	thu	06:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2250	64	thu	07:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2251	64	thu	05:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2252	64	thu	04:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2253	64	fri	23:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2254	64	fri	21:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2255	64	fri	22:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2256	64	fri	20:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2257	64	fri	00:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2258	64	fri	01:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2259	64	fri	02:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2260	64	fri	03:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2261	64	fri	04:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2262	64	fri	05:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2263	64	fri	06:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2264	64	fri	07:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2265	64	fri	08:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2266	64	fri	09:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2267	64	fri	10:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2268	64	fri	11:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2269	64	fri	12:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2270	64	fri	13:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2271	64	fri	14:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2272	64	fri	15:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2273	64	fri	16:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
1193	39	sun	09:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1194	39	sun	13:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1195	39	sun	15:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1196	39	sun	16:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1197	39	sun	17:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1198	39	sun	18:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1199	39	sun	20:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1200	39	mon	09:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1201	39	mon	10:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1202	39	mon	12:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1203	39	mon	15:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1204	39	mon	17:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1205	39	mon	20:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1206	39	tue	10:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1207	39	tue	12:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1208	39	tue	13:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1209	39	tue	14:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1210	39	tue	16:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1211	39	tue	17:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1212	39	tue	19:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1213	39	tue	20:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1214	39	wed	07:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1215	39	wed	18:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1216	39	wed	19:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1217	39	wed	20:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1218	39	wed	21:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1219	39	wed	22:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1220	39	wed	09:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1221	39	wed	10:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1222	39	wed	11:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1223	39	wed	12:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1224	39	wed	13:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1225	39	wed	14:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1226	39	wed	15:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1227	39	wed	16:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1228	39	wed	17:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1229	39	thu	10:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1230	39	thu	20:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1231	39	thu	21:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1232	39	thu	22:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1233	39	thu	11:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1234	39	thu	12:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1235	39	thu	13:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1236	39	thu	14:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1237	39	thu	15:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1238	39	thu	16:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1239	39	thu	17:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1240	39	thu	18:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1241	39	thu	19:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1242	39	fri	11:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1243	39	fri	14:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1244	39	fri	17:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1245	39	fri	18:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1246	39	fri	19:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1247	39	fri	20:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1248	39	sat	10:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1249	39	sat	11:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1250	39	sat	12:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1251	39	sat	13:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1252	39	sat	16:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1253	39	sat	18:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
1254	39	sat	20:00:00	2024-08-21 08:30:30	2024-08-21 08:30:30
2274	64	fri	17:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2275	64	fri	18:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2276	64	fri	19:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2277	64	sat	22:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2278	64	sat	23:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2279	64	sat	21:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2280	64	sat	20:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2281	64	sat	19:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2282	64	sat	18:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2283	64	sat	17:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2284	64	sat	16:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2285	64	sat	15:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2286	64	sat	14:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2287	64	sat	13:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2288	64	sat	12:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2289	64	sat	11:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2290	64	sat	10:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2291	64	sat	09:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2292	64	sat	08:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2293	64	sat	07:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2294	64	sat	00:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2295	64	sat	01:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2296	64	sat	02:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2297	64	sat	03:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2298	64	sat	05:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2299	64	sat	04:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
2300	64	sat	06:00:00	2024-09-16 10:14:47	2024-09-16 10:14:47
1478	28	tue	17:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1479	28	tue	18:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1480	28	wed	09:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1481	28	wed	19:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1482	28	wed	20:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1483	28	wed	10:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1484	28	wed	11:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1485	28	wed	12:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1486	28	wed	13:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1487	28	wed	14:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1488	28	wed	15:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1489	28	wed	16:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1490	28	wed	17:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1491	28	wed	18:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1492	28	thu	09:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1493	28	thu	19:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1494	28	thu	20:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1495	28	thu	10:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1496	28	thu	11:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1497	28	thu	12:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1498	28	thu	13:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1499	28	thu	14:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1500	28	thu	15:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1501	28	thu	16:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1502	28	thu	17:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1503	28	thu	18:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1504	28	fri	09:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1505	28	fri	19:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1506	28	fri	20:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1507	28	fri	10:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1508	28	fri	11:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1509	28	fri	12:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1510	28	fri	13:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1511	28	fri	14:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1512	28	fri	15:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1513	28	fri	16:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1514	28	fri	17:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1515	28	fri	18:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1516	28	sat	09:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1517	28	sat	19:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1518	28	sat	20:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1519	28	sat	10:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1520	28	sat	11:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1521	28	sat	12:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1522	28	sat	13:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1523	28	sat	14:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1524	28	sat	15:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1525	28	sat	16:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1526	28	sat	17:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
1527	28	sat	18:00:00	2024-08-21 11:15:09	2024-08-21 11:15:09
2301	62	sun	01:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2302	62	sun	11:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2303	62	sun	12:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2304	62	sun	13:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2305	62	sun	14:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2306	62	sun	15:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2307	62	sun	16:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2308	62	sun	17:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2309	62	sun	18:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2310	62	sun	19:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2311	62	sun	20:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2312	62	sun	02:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2313	62	sun	21:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2314	62	sun	22:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2315	62	sun	23:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2316	62	sun	03:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2317	62	sun	04:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2318	62	sun	05:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2319	62	sun	06:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2320	62	sun	07:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2321	62	sun	08:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2322	62	sun	09:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2323	62	sun	10:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2324	62	mon	01:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2325	62	mon	11:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2326	62	mon	12:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2327	62	mon	13:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2328	62	mon	14:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2329	62	mon	15:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2330	62	mon	16:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2331	62	mon	17:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2332	62	mon	18:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2333	62	mon	19:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2334	62	mon	20:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2335	62	mon	02:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2336	62	mon	21:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2337	62	mon	22:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2338	62	mon	23:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2339	62	mon	03:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2340	62	mon	04:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2341	62	mon	05:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2342	62	mon	06:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2343	62	mon	07:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2344	62	mon	08:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2345	62	mon	09:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2346	62	mon	10:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2347	62	tue	01:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2348	62	tue	11:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2349	62	tue	12:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2350	62	tue	13:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2351	62	tue	14:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2352	62	tue	15:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2353	62	tue	16:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2354	62	tue	17:00:00	2024-09-16 11:20:05	2024-09-16 11:20:05
2355	62	tue	18:00:00	2024-09-16 11:20:05	2024-09-16 11:20:06
2356	62	tue	19:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2357	62	tue	20:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2358	62	tue	02:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2359	62	tue	21:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2360	62	tue	22:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2361	62	tue	23:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2362	62	tue	03:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2363	62	tue	04:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2364	62	tue	05:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2365	62	tue	06:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2366	62	tue	07:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2367	62	tue	08:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2368	62	tue	09:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2369	62	tue	10:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2370	62	wed	01:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2371	62	wed	11:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2372	62	wed	12:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2373	62	wed	13:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2374	62	wed	14:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2375	62	wed	15:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2376	62	wed	16:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2377	62	wed	17:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2378	62	wed	18:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2379	62	wed	19:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2380	62	wed	20:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2381	62	wed	02:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2382	62	wed	21:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2383	62	wed	22:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
1767	48	sun	09:00:00	2024-08-23 08:48:40	2024-08-23 08:48:40
1768	48	mon	09:00:00	2024-08-23 08:48:41	2024-08-23 08:48:41
1769	48	mon	10:00:00	2024-08-23 08:48:42	2024-08-23 08:48:42
1770	48	sun	10:00:00	2024-08-23 08:48:43	2024-08-23 08:48:43
1771	48	sun	11:00:00	2024-08-23 08:48:45	2024-08-23 08:48:45
1772	48	tue	11:00:00	2024-08-23 08:48:47	2024-08-23 08:48:47
1773	48	tue	09:00:00	2024-08-23 08:48:47	2024-08-23 08:48:47
1774	48	tue	10:00:00	2024-08-23 08:48:47	2024-08-23 08:48:47
1775	48	wed	11:00:00	2024-08-23 08:48:48	2024-08-23 08:48:48
1776	48	wed	10:00:00	2024-08-23 08:48:50	2024-08-23 08:48:50
1777	48	wed	09:00:00	2024-08-23 08:48:51	2024-08-23 08:48:51
1778	48	thu	09:00:00	2024-08-23 08:48:51	2024-08-23 08:48:51
1779	48	thu	11:00:00	2024-08-23 08:48:51	2024-08-23 08:48:51
1780	48	thu	10:00:00	2024-08-23 08:48:52	2024-08-23 08:48:52
1781	48	fri	11:00:00	2024-08-23 08:48:53	2024-08-23 08:48:53
1782	48	sat	09:00:00	2024-08-23 08:48:55	2024-08-23 08:48:55
1783	48	sat	11:00:00	2024-08-23 08:48:55	2024-08-23 08:48:55
1784	48	fri	10:00:00	2024-08-23 08:48:55	2024-08-23 08:48:55
1785	48	sat	10:00:00	2024-08-23 08:48:57	2024-08-23 08:48:57
1786	48	sat	12:00:00	2024-08-23 08:48:57	2024-08-23 08:48:57
1787	48	fri	09:00:00	2024-08-23 08:48:57	2024-08-23 08:48:57
1788	48	sat	13:00:00	2024-08-23 08:48:59	2024-08-23 08:48:59
1789	48	sat	17:00:00	2024-08-23 08:49:00	2024-08-23 08:49:00
1790	48	sat	14:00:00	2024-08-23 08:49:00	2024-08-23 08:49:00
1791	48	sat	15:00:00	2024-08-23 08:49:01	2024-08-23 08:49:01
1792	48	sat	18:00:00	2024-08-23 08:49:02	2024-08-23 08:49:02
1793	48	sat	16:00:00	2024-08-23 08:49:04	2024-08-23 08:49:04
1794	48	sat	19:00:00	2024-08-23 08:49:07	2024-08-23 08:49:07
1795	48	sat	20:00:00	2024-08-23 08:49:07	2024-08-23 08:49:07
1797	48	sat	22:00:00	2024-08-23 08:49:09	2024-08-23 08:49:09
1798	48	sat	21:00:00	2024-08-23 08:49:11	2024-08-23 08:49:11
1799	48	fri	21:00:00	2024-08-23 08:49:12	2024-08-23 08:49:12
1800	48	fri	20:00:00	2024-08-23 08:49:13	2024-08-23 08:49:13
1801	48	fri	19:00:00	2024-08-23 08:49:13	2024-08-23 08:49:13
1802	48	fri	18:00:00	2024-08-23 08:49:13	2024-08-23 08:49:13
1803	48	fri	17:00:00	2024-08-23 08:49:15	2024-08-23 08:49:15
1804	48	fri	16:00:00	2024-08-23 08:49:17	2024-08-23 08:49:17
1805	48	fri	15:00:00	2024-08-23 08:49:18	2024-08-23 08:49:18
1806	48	fri	12:00:00	2024-08-23 08:49:19	2024-08-23 08:49:19
1807	48	fri	14:00:00	2024-08-23 08:49:19	2024-08-23 08:49:19
1808	48	fri	13:00:00	2024-08-23 08:49:19	2024-08-23 08:49:19
1809	48	thu	12:00:00	2024-08-23 08:49:21	2024-08-23 08:49:21
1810	48	thu	13:00:00	2024-08-23 08:49:22	2024-08-23 08:49:22
1811	48	thu	14:00:00	2024-08-23 08:49:23	2024-08-23 08:49:23
1812	48	thu	16:00:00	2024-08-23 08:49:23	2024-08-23 08:49:23
1813	48	thu	15:00:00	2024-08-23 08:49:24	2024-08-23 08:49:24
1814	48	thu	17:00:00	2024-08-23 08:49:24	2024-08-23 08:49:24
1815	48	thu	18:00:00	2024-08-23 08:49:25	2024-08-23 08:49:25
1816	48	thu	19:00:00	2024-08-23 08:49:26	2024-08-23 08:49:26
1817	48	thu	20:00:00	2024-08-23 08:49:28	2024-08-23 08:49:28
1818	48	thu	21:00:00	2024-08-23 08:49:28	2024-08-23 08:49:28
1819	48	wed	20:00:00	2024-08-23 08:49:28	2024-08-23 08:49:28
1820	48	wed	21:00:00	2024-08-23 08:49:29	2024-08-23 08:49:29
1821	48	wed	19:00:00	2024-08-23 08:49:30	2024-08-23 08:49:30
1822	48	wed	18:00:00	2024-08-23 08:49:31	2024-08-23 08:49:31
1823	48	wed	17:00:00	2024-08-23 08:49:32	2024-08-23 08:49:32
1824	48	wed	15:00:00	2024-08-23 08:49:32	2024-08-23 08:49:32
1825	48	wed	16:00:00	2024-08-23 08:49:33	2024-08-23 08:49:33
1826	48	wed	13:00:00	2024-08-23 08:49:34	2024-08-23 08:49:34
1827	48	wed	14:00:00	2024-08-23 08:49:34	2024-08-23 08:49:34
1828	48	wed	12:00:00	2024-08-23 08:49:35	2024-08-23 08:49:35
1829	48	tue	12:00:00	2024-08-23 08:49:36	2024-08-23 08:49:36
1830	48	tue	13:00:00	2024-08-23 08:49:37	2024-08-23 08:49:37
1831	48	tue	14:00:00	2024-08-23 08:49:38	2024-08-23 08:49:38
1832	48	tue	16:00:00	2024-08-23 08:49:39	2024-08-23 08:49:39
1833	48	tue	15:00:00	2024-08-23 08:49:39	2024-08-23 08:49:39
1834	48	tue	17:00:00	2024-08-23 08:49:40	2024-08-23 08:49:40
1835	48	tue	19:00:00	2024-08-23 08:49:41	2024-08-23 08:49:41
1836	48	tue	18:00:00	2024-08-23 08:49:42	2024-08-23 08:49:42
1837	48	tue	20:00:00	2024-08-23 08:49:42	2024-08-23 08:49:42
1838	48	tue	21:00:00	2024-08-23 08:49:43	2024-08-23 08:49:43
1839	48	mon	21:00:00	2024-08-23 08:49:44	2024-08-23 08:49:44
1840	48	mon	20:00:00	2024-08-23 08:49:45	2024-08-23 08:49:45
1841	48	mon	19:00:00	2024-08-23 08:49:46	2024-08-23 08:49:46
1842	48	mon	17:00:00	2024-08-23 08:49:46	2024-08-23 08:49:46
1843	48	mon	18:00:00	2024-08-23 08:49:47	2024-08-23 08:49:47
1844	48	mon	16:00:00	2024-08-23 08:49:48	2024-08-23 08:49:48
1845	48	mon	15:00:00	2024-08-23 08:49:49	2024-08-23 08:49:49
1846	48	mon	14:00:00	2024-08-23 08:49:49	2024-08-23 08:49:49
1847	48	mon	13:00:00	2024-08-23 08:49:50	2024-08-23 08:49:50
1848	48	mon	12:00:00	2024-08-23 08:49:51	2024-08-23 08:49:51
1849	48	mon	11:00:00	2024-08-23 08:49:52	2024-08-23 08:49:52
1850	48	sun	12:00:00	2024-08-23 08:49:53	2024-08-23 08:49:53
1851	48	sun	13:00:00	2024-08-23 08:49:54	2024-08-23 08:49:54
1852	48	sun	14:00:00	2024-08-23 08:49:55	2024-08-23 08:49:55
1853	48	sun	16:00:00	2024-08-23 08:49:55	2024-08-23 08:49:55
1854	48	sun	15:00:00	2024-08-23 08:49:55	2024-08-23 08:49:55
1855	48	sun	17:00:00	2024-08-23 08:49:56	2024-08-23 08:49:56
1856	48	sun	18:00:00	2024-08-23 08:49:58	2024-08-23 08:49:58
1860	48	sun	19:00:00	2024-08-23 08:50:06	2024-08-23 08:50:06
1861	48	sun	21:00:00	2024-08-23 08:50:08	2024-08-23 08:50:08
1862	48	sun	20:00:00	2024-08-23 08:50:08	2024-08-23 08:50:08
1863	49	sun	09:00:00	2024-08-26 08:04:42	2024-08-26 08:04:42
1864	49	sun	10:00:00	2024-08-26 08:04:42	2024-08-26 08:04:42
1865	49	mon	10:00:00	2024-08-26 08:04:45	2024-08-26 08:04:45
1866	49	mon	09:00:00	2024-08-26 08:04:45	2024-08-26 08:04:45
1867	49	tue	09:00:00	2024-08-26 08:04:48	2024-08-26 08:04:48
1868	49	tue	10:00:00	2024-08-26 08:04:49	2024-08-26 08:04:49
1869	49	wed	10:00:00	2024-08-26 08:04:50	2024-08-26 08:04:50
1870	49	wed	09:00:00	2024-08-26 08:04:50	2024-08-26 08:04:50
1871	49	thu	10:00:00	2024-08-26 08:04:51	2024-08-26 08:04:51
1872	49	thu	09:00:00	2024-08-26 08:04:51	2024-08-26 08:04:51
1873	49	fri	10:00:00	2024-08-26 08:04:51	2024-08-26 08:04:51
1874	49	fri	09:00:00	2024-08-26 08:04:52	2024-08-26 08:04:52
1875	49	sat	09:00:00	2024-08-26 08:05:21	2024-08-26 08:05:21
1876	49	sat	10:00:00	2024-08-26 08:05:21	2024-08-26 08:05:21
1877	49	sat	11:00:00	2024-08-26 08:05:22	2024-08-26 08:05:22
1878	49	sat	12:00:00	2024-08-26 08:05:23	2024-08-26 08:05:23
1879	49	sat	13:00:00	2024-08-26 08:05:24	2024-08-26 08:05:24
1880	49	sat	14:00:00	2024-08-26 08:05:24	2024-08-26 08:05:24
1881	49	sat	15:00:00	2024-08-26 08:05:25	2024-08-26 08:05:25
1882	49	sat	16:00:00	2024-08-26 08:05:25	2024-08-26 08:05:25
1883	49	sat	17:00:00	2024-08-26 08:05:26	2024-08-26 08:05:26
1884	49	sat	18:00:00	2024-08-26 08:05:26	2024-08-26 08:05:26
1885	49	sat	19:00:00	2024-08-26 08:05:27	2024-08-26 08:05:27
1886	49	sat	20:00:00	2024-08-26 08:05:28	2024-08-26 08:05:28
1887	49	sat	21:00:00	2024-08-26 08:05:29	2024-08-26 08:05:29
1888	49	fri	21:00:00	2024-08-26 08:05:29	2024-08-26 08:05:29
1889	49	fri	20:00:00	2024-08-26 08:05:30	2024-08-26 08:05:30
1890	49	fri	19:00:00	2024-08-26 08:05:30	2024-08-26 08:05:30
1891	49	fri	18:00:00	2024-08-26 08:05:30	2024-08-26 08:05:30
1892	49	fri	17:00:00	2024-08-26 08:05:32	2024-08-26 08:05:32
1893	49	fri	15:00:00	2024-08-26 08:05:32	2024-08-26 08:05:32
1894	49	fri	14:00:00	2024-08-26 08:05:33	2024-08-26 08:05:33
1895	49	fri	16:00:00	2024-08-26 08:05:33	2024-08-26 08:05:33
1896	49	fri	13:00:00	2024-08-26 08:05:34	2024-08-26 08:05:34
1897	49	fri	12:00:00	2024-08-26 08:05:34	2024-08-26 08:05:34
1898	49	fri	11:00:00	2024-08-26 08:05:35	2024-08-26 08:05:35
1899	49	thu	11:00:00	2024-08-26 08:05:36	2024-08-26 08:05:36
1900	49	thu	12:00:00	2024-08-26 08:05:36	2024-08-26 08:05:36
1901	49	thu	13:00:00	2024-08-26 08:05:37	2024-08-26 08:05:37
1902	49	thu	14:00:00	2024-08-26 08:05:37	2024-08-26 08:05:37
1903	49	thu	15:00:00	2024-08-26 08:05:38	2024-08-26 08:05:38
1904	49	thu	16:00:00	2024-08-26 08:05:38	2024-08-26 08:05:38
1905	49	wed	12:00:00	2024-08-26 08:05:39	2024-08-26 08:05:39
1906	49	wed	11:00:00	2024-08-26 08:05:39	2024-08-26 08:05:39
1907	49	wed	13:00:00	2024-08-26 08:05:40	2024-08-26 08:05:40
1908	49	wed	14:00:00	2024-08-26 08:05:40	2024-08-26 08:05:40
1909	49	wed	15:00:00	2024-08-26 08:05:41	2024-08-26 08:05:41
1910	49	wed	16:00:00	2024-08-26 08:05:41	2024-08-26 08:05:41
1911	49	wed	17:00:00	2024-08-26 08:05:42	2024-08-26 08:05:42
1912	49	wed	20:00:00	2024-08-26 08:05:43	2024-08-26 08:05:43
1913	49	wed	21:00:00	2024-08-26 08:05:44	2024-08-26 08:05:44
1914	49	wed	19:00:00	2024-08-26 08:05:45	2024-08-26 08:05:45
1915	49	wed	18:00:00	2024-08-26 08:05:45	2024-08-26 08:05:45
1916	49	thu	17:00:00	2024-08-26 08:05:46	2024-08-26 08:05:46
1917	49	thu	18:00:00	2024-08-26 08:05:47	2024-08-26 08:05:47
1918	49	thu	19:00:00	2024-08-26 08:05:47	2024-08-26 08:05:47
1919	49	thu	20:00:00	2024-08-26 08:05:48	2024-08-26 08:05:48
1920	49	thu	21:00:00	2024-08-26 08:05:48	2024-08-26 08:05:48
1921	49	tue	21:00:00	2024-08-26 08:05:49	2024-08-26 08:05:49
1922	49	tue	20:00:00	2024-08-26 08:05:50	2024-08-26 08:05:50
1923	49	mon	21:00:00	2024-08-26 08:05:50	2024-08-26 08:05:50
1924	49	sun	21:00:00	2024-08-26 08:05:51	2024-08-26 08:05:51
1925	49	sun	20:00:00	2024-08-26 08:05:52	2024-08-26 08:05:52
1926	49	mon	20:00:00	2024-08-26 08:05:52	2024-08-26 08:05:52
1927	49	tue	19:00:00	2024-08-26 08:05:54	2024-08-26 08:05:54
1928	49	tue	18:00:00	2024-08-26 08:05:54	2024-08-26 08:05:54
1929	49	mon	19:00:00	2024-08-26 08:05:55	2024-08-26 08:05:55
1930	49	sun	19:00:00	2024-08-26 08:05:56	2024-08-26 08:05:56
1931	49	sun	18:00:00	2024-08-26 08:05:56	2024-08-26 08:05:56
1932	49	sun	17:00:00	2024-08-26 08:05:56	2024-08-26 08:05:56
1933	49	sun	16:00:00	2024-08-26 08:05:57	2024-08-26 08:05:57
1934	49	sun	15:00:00	2024-08-26 08:05:58	2024-08-26 08:05:58
1935	49	sun	14:00:00	2024-08-26 08:05:58	2024-08-26 08:05:58
1936	49	sun	13:00:00	2024-08-26 08:05:58	2024-08-26 08:05:58
1937	49	sun	12:00:00	2024-08-26 08:05:59	2024-08-26 08:05:59
1938	49	sun	11:00:00	2024-08-26 08:06:00	2024-08-26 08:06:00
1939	49	mon	11:00:00	2024-08-26 08:06:00	2024-08-26 08:06:00
1940	49	mon	12:00:00	2024-08-26 08:06:01	2024-08-26 08:06:01
1941	49	mon	13:00:00	2024-08-26 08:06:01	2024-08-26 08:06:01
1942	49	mon	14:00:00	2024-08-26 08:06:02	2024-08-26 08:06:02
1943	49	mon	15:00:00	2024-08-26 08:06:02	2024-08-26 08:06:02
1944	49	mon	16:00:00	2024-08-26 08:06:03	2024-08-26 08:06:03
1945	49	mon	17:00:00	2024-08-26 08:06:03	2024-08-26 08:06:03
1946	49	mon	18:00:00	2024-08-26 08:06:04	2024-08-26 08:06:04
1947	49	tue	17:00:00	2024-08-26 08:06:04	2024-08-26 08:06:04
1948	49	tue	16:00:00	2024-08-26 08:06:05	2024-08-26 08:06:05
1949	49	tue	15:00:00	2024-08-26 08:06:05	2024-08-26 08:06:05
1950	49	tue	14:00:00	2024-08-26 08:06:06	2024-08-26 08:06:06
1951	49	tue	13:00:00	2024-08-26 08:06:06	2024-08-26 08:06:06
1952	49	tue	12:00:00	2024-08-26 08:06:07	2024-08-26 08:06:07
1953	49	tue	11:00:00	2024-08-26 08:06:07	2024-08-26 08:06:07
1954	51	sun	09:00:00	2024-08-26 12:53:58	2024-08-26 12:53:58
1955	51	sun	10:00:00	2024-08-26 12:53:58	2024-08-26 12:53:58
1956	51	sun	11:00:00	2024-08-26 12:53:58	2024-08-26 12:53:58
1957	51	sun	12:00:00	2024-08-26 12:53:58	2024-08-26 12:53:58
1958	51	sun	13:00:00	2024-08-26 12:53:58	2024-08-26 12:53:58
1959	51	sun	14:00:00	2024-08-26 12:53:58	2024-08-26 12:53:58
1960	51	sun	15:00:00	2024-08-26 12:53:58	2024-08-26 12:53:58
1961	51	sun	16:00:00	2024-08-26 12:53:58	2024-08-26 12:53:59
1962	51	sun	17:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1963	51	mon	09:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1964	51	mon	10:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1965	51	mon	11:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1966	51	mon	12:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1967	51	mon	13:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1968	51	mon	14:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1969	51	mon	15:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1970	51	mon	16:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1971	51	mon	17:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1972	51	tue	09:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1973	51	tue	10:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1974	51	tue	11:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1975	51	tue	12:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1976	51	tue	13:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1977	51	tue	14:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1978	51	tue	15:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1979	51	tue	16:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1980	51	tue	17:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1981	51	wed	09:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1982	51	wed	10:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1983	51	wed	11:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1984	51	wed	12:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1985	51	wed	13:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1986	51	wed	14:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1987	51	wed	15:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1988	51	wed	16:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1989	51	wed	17:00:00	2024-08-26 12:53:59	2024-08-26 12:53:59
1990	35	sun	08:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
1991	35	sun	20:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
1992	35	sun	21:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
1993	35	sun	22:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
1994	35	sun	09:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
1995	35	sun	10:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
1996	35	sun	11:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
1997	35	sun	12:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
1998	35	sun	15:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
1999	35	sun	16:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2000	35	sun	17:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2001	35	sun	18:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2002	35	sun	19:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2003	35	mon	13:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2004	35	mon	23:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2005	35	mon	14:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2006	35	mon	15:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2007	35	mon	16:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2008	35	mon	17:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2009	35	mon	18:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2010	35	mon	19:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2011	35	mon	20:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2012	35	mon	21:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2013	35	mon	22:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2014	35	tue	09:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2015	35	tue	20:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2016	35	tue	10:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2017	35	tue	11:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2018	35	tue	12:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2019	35	tue	13:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2020	35	tue	14:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2021	35	tue	15:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2022	35	tue	16:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2023	35	tue	17:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2024	35	tue	18:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2025	35	wed	12:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2026	35	wed	22:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2027	35	wed	13:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2028	35	wed	14:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2029	35	wed	15:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2030	35	wed	16:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2031	35	wed	17:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2032	35	wed	18:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2033	35	wed	19:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2034	35	wed	20:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2035	35	wed	21:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2036	35	thu	12:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2037	35	thu	22:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2038	35	thu	13:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2039	35	thu	14:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2040	35	thu	15:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2041	35	thu	16:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2042	35	thu	17:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2043	35	thu	18:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2044	35	thu	19:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2045	35	thu	20:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2046	35	thu	21:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2047	35	fri	11:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2048	35	fri	21:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2049	35	fri	12:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2050	35	fri	13:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2051	35	fri	14:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2052	35	fri	15:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2053	35	fri	16:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2054	35	fri	17:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2055	35	fri	18:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2056	35	fri	19:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2057	35	fri	20:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2058	35	sat	11:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2059	35	sat	21:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2060	35	sat	22:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2061	35	sat	23:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2062	35	sat	12:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2063	35	sat	13:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2064	35	sat	14:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2065	35	sat	15:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2066	35	sat	16:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2067	35	sat	17:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2068	35	sat	18:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2069	35	sat	19:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
2070	35	sat	20:00:00	2024-09-10 12:44:29	2024-09-10 12:44:29
3149	72	sun	08:00:00	2024-10-22 04:14:23	2024-10-22 04:14:23
3155	72	sun	18:00:00	2024-10-22 04:14:33	2024-10-22 04:14:33
3161	72	mon	11:00:00	2024-10-22 04:14:43	2024-10-22 04:14:43
3167	72	mon	16:00:00	2024-10-22 04:14:50	2024-10-22 04:14:50
3173	72	tue	11:00:00	2024-10-22 04:14:57	2024-10-22 04:14:57
3179	72	tue	17:00:00	2024-10-22 04:15:02	2024-10-22 04:15:02
3185	72	sat	09:00:00	2024-10-22 04:15:08	2024-10-22 04:15:08
3191	72	sat	15:00:00	2024-10-22 04:15:13	2024-10-22 04:15:13
3196	72	sat	20:00:00	2024-10-22 04:15:16	2024-10-22 04:15:16
3306	73	sun	09:00:00	2024-10-24 10:22:58	2024-10-24 10:22:58
3307	73	sun	19:00:00	2024-10-24 10:22:58	2024-10-24 10:22:58
3308	73	sun	20:00:00	2024-10-24 10:22:58	2024-10-24 10:22:58
3309	73	sun	10:00:00	2024-10-24 10:22:58	2024-10-24 10:22:58
3310	73	sun	11:00:00	2024-10-24 10:22:58	2024-10-24 10:22:58
3311	73	sun	12:00:00	2024-10-24 10:22:58	2024-10-24 10:22:58
3312	73	sun	13:00:00	2024-10-24 10:22:58	2024-10-24 10:22:58
3313	73	sun	14:00:00	2024-10-24 10:22:58	2024-10-24 10:22:58
3314	73	sun	15:00:00	2024-10-24 10:22:58	2024-10-24 10:22:58
3315	73	sun	16:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3316	73	sun	17:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3317	73	sun	18:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3318	73	mon	09:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3319	73	mon	19:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3320	73	mon	20:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3321	73	mon	10:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3322	73	mon	11:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3323	73	mon	12:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3324	73	mon	13:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3325	73	mon	14:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3326	73	mon	15:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3327	73	mon	16:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3328	73	mon	17:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3329	73	mon	18:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3330	73	tue	09:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3331	73	tue	19:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3332	73	tue	20:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3333	73	tue	10:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3334	73	tue	11:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3335	73	tue	12:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3336	73	tue	13:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3337	73	tue	14:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3338	73	tue	15:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3339	73	tue	16:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3340	73	tue	17:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3341	73	tue	18:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3342	73	wed	09:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3343	73	wed	19:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3344	73	wed	20:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3345	73	wed	10:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3346	73	wed	11:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3347	73	wed	12:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3348	73	wed	13:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3349	73	wed	14:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3350	73	wed	15:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3351	73	wed	16:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3110	47	thu	03:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3111	47	thu	04:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3112	47	thu	05:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3113	47	thu	06:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3114	47	thu	07:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3115	47	thu	08:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3116	47	thu	09:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3117	47	thu	10:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3118	47	thu	15:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3119	47	thu	16:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3120	47	thu	17:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3121	47	thu	19:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3122	47	thu	20:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3123	47	thu	21:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3124	47	thu	22:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3125	47	fri	03:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3126	47	fri	04:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3127	47	fri	07:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3128	47	fri	10:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3129	47	fri	11:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3130	47	fri	12:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
2384	62	wed	23:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2385	62	wed	03:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2386	62	wed	04:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2387	62	wed	05:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2388	62	wed	06:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2389	62	wed	07:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2390	62	wed	08:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2391	62	wed	09:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2392	62	wed	10:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2393	62	thu	01:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2394	62	thu	11:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2395	62	thu	12:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2396	62	thu	13:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2397	62	thu	14:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2398	62	thu	15:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2399	62	thu	16:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2400	62	thu	17:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2401	62	thu	18:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2402	62	thu	19:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2403	62	thu	20:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2404	62	thu	02:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2405	62	thu	21:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2406	62	thu	22:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2407	62	thu	23:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2408	62	thu	03:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2409	62	thu	04:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2410	62	thu	05:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2411	62	thu	06:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2412	62	thu	07:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2413	62	thu	08:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2414	62	thu	09:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2415	62	thu	10:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2416	62	fri	01:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2417	62	fri	11:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2418	62	fri	12:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2419	62	fri	13:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2420	62	fri	14:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2421	62	fri	15:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2422	62	fri	16:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2423	62	fri	17:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2424	62	fri	18:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2425	62	fri	19:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2426	62	fri	20:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2427	62	fri	02:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2428	62	fri	21:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2429	62	fri	22:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2430	62	fri	23:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2431	62	fri	03:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2432	62	fri	04:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2433	62	fri	05:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2434	62	fri	06:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2435	62	fri	07:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2436	62	fri	08:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2437	62	fri	09:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2438	62	fri	10:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2439	62	sat	01:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2440	62	sat	11:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2441	62	sat	12:00:00	2024-09-16 11:20:06	2024-09-16 11:20:06
2442	62	sat	13:00:00	2024-09-16 11:20:07	2024-09-16 11:20:07
2443	62	sat	14:00:00	2024-09-16 11:20:07	2024-09-16 11:20:07
2444	62	sat	15:00:00	2024-09-16 11:20:07	2024-09-16 11:20:07
2445	62	sat	16:00:00	2024-09-16 11:20:07	2024-09-16 11:20:07
2446	62	sat	17:00:00	2024-09-16 11:20:07	2024-09-16 11:20:07
2447	62	sat	18:00:00	2024-09-16 11:20:07	2024-09-16 11:20:07
2448	62	sat	19:00:00	2024-09-16 11:20:07	2024-09-16 11:20:07
2449	62	sat	20:00:00	2024-09-16 11:20:07	2024-09-16 11:20:07
2450	62	sat	02:00:00	2024-09-16 11:20:07	2024-09-16 11:20:07
2451	62	sat	21:00:00	2024-09-16 11:20:07	2024-09-16 11:20:07
2452	62	sat	22:00:00	2024-09-16 11:20:07	2024-09-16 11:20:07
2453	62	sat	23:00:00	2024-09-16 11:20:07	2024-09-16 11:20:07
2454	62	sat	03:00:00	2024-09-16 11:20:07	2024-09-16 11:20:07
2455	62	sat	04:00:00	2024-09-16 11:20:07	2024-09-16 11:20:07
2456	62	sat	05:00:00	2024-09-16 11:20:07	2024-09-16 11:20:07
2457	62	sat	06:00:00	2024-09-16 11:20:07	2024-09-16 11:20:07
2458	62	sat	07:00:00	2024-09-16 11:20:07	2024-09-16 11:20:07
2459	62	sat	08:00:00	2024-09-16 11:20:07	2024-09-16 11:20:07
2460	62	sat	09:00:00	2024-09-16 11:20:07	2024-09-16 11:20:07
2461	62	sat	10:00:00	2024-09-16 11:20:07	2024-09-16 11:20:07
3131	47	fri	13:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3132	47	fri	16:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3133	47	fri	18:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3134	47	fri	19:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3135	47	fri	21:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3136	47	fri	23:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3137	47	sat	04:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3138	47	sat	05:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3139	47	sat	06:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3140	47	sat	08:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3141	47	sat	11:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3142	47	sat	12:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3143	47	sat	18:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3144	47	sat	19:00:00	2024-10-19 14:30:53	2024-10-19 14:30:53
3150	72	sun	13:00:00	2024-10-22 04:14:26	2024-10-22 04:14:26
3156	72	sun	19:00:00	2024-10-22 04:14:33	2024-10-22 04:14:33
3162	72	mon	12:00:00	2024-10-22 04:14:46	2024-10-22 04:14:46
3168	72	mon	18:00:00	2024-10-22 04:14:51	2024-10-22 04:14:51
3174	72	tue	13:00:00	2024-10-22 04:14:57	2024-10-22 04:14:57
3180	72	tue	15:00:00	2024-10-22 04:15:04	2024-10-22 04:15:04
3186	72	sat	10:00:00	2024-10-22 04:15:09	2024-10-22 04:15:09
3145	72	sun	09:00:00	2024-10-22 04:14:18	2024-10-22 04:14:18
3151	72	sun	14:00:00	2024-10-22 04:14:29	2024-10-22 04:14:29
3157	72	sun	20:00:00	2024-10-22 04:14:34	2024-10-22 04:14:34
3163	72	mon	13:00:00	2024-10-22 04:14:46	2024-10-22 04:14:46
3169	72	mon	19:00:00	2024-10-22 04:14:51	2024-10-22 04:14:51
3175	72	tue	10:00:00	2024-10-22 04:14:57	2024-10-22 04:14:57
3181	72	tue	16:00:00	2024-10-22 04:15:05	2024-10-22 04:15:05
3187	72	sat	11:00:00	2024-10-22 04:15:10	2024-10-22 04:15:10
3192	72	sat	16:00:00	2024-10-22 04:15:13	2024-10-22 04:15:13
3352	73	wed	17:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3353	73	wed	18:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3354	73	thu	09:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3355	73	thu	19:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3356	73	thu	20:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3357	73	thu	10:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3358	73	thu	11:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3359	73	thu	12:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3360	73	thu	13:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3361	73	thu	14:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3362	73	thu	15:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3363	73	thu	16:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3364	73	thu	17:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3365	73	thu	18:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3366	73	fri	09:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3367	73	fri	19:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3368	73	fri	20:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3369	73	fri	10:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3370	73	fri	11:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3371	73	fri	12:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3372	73	fri	13:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3373	73	fri	14:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3374	73	fri	15:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3375	73	fri	16:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3376	73	fri	17:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3377	73	fri	18:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3378	73	sat	09:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3379	73	sat	19:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3380	73	sat	20:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3381	73	sat	10:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3382	73	sat	11:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3383	73	sat	12:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3384	73	sat	13:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3385	73	sat	14:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3386	73	sat	15:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3387	73	sat	16:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3388	73	sat	17:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3389	73	sat	18:00:00	2024-10-24 10:22:59	2024-10-24 10:22:59
3444	74	mon	11:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3445	74	mon	12:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3446	74	mon	13:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3447	74	mon	14:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3448	74	mon	15:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3449	74	mon	16:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3450	74	mon	17:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3451	74	mon	18:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3452	74	tue	09:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3453	74	tue	10:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3454	74	tue	11:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3455	74	tue	12:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3456	74	tue	14:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3457	74	tue	15:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3458	74	tue	16:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3459	74	tue	18:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3460	74	tue	19:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3461	74	tue	20:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3462	74	wed	09:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3463	74	wed	10:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3464	74	wed	11:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3465	74	wed	14:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3466	74	wed	15:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3467	74	wed	17:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3468	74	wed	19:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3469	74	wed	20:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3470	74	wed	21:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3471	74	thu	09:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3472	74	thu	12:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3473	74	thu	14:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3474	74	thu	15:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3475	74	thu	16:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3476	74	thu	17:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3477	74	thu	18:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3478	74	thu	19:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3479	74	thu	21:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3480	74	fri	09:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3481	74	fri	20:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3482	74	fri	21:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3483	74	fri	10:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3484	74	fri	11:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3485	74	fri	12:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3486	74	fri	13:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3487	74	fri	14:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3488	74	fri	15:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3489	74	fri	16:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3490	74	fri	17:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3491	74	fri	18:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3492	74	sat	09:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3493	74	sat	19:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3494	74	sat	20:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3495	74	sat	21:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3496	74	sat	10:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3497	74	sat	11:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3498	74	sat	12:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3499	74	sat	13:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3500	74	sat	14:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3501	74	sat	15:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3502	74	sat	16:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3503	74	sat	17:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3504	74	sat	18:00:00	2024-11-06 12:22:26	2024-11-06 12:22:26
3542	77	wed	08:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3543	77	wed	09:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3544	77	thu	04:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3545	77	thu	05:00:00	2024-11-08 05:48:19	2024-11-08 05:48:19
3546	77	thu	06:00:00	2024-11-08 05:48:19	2024-11-08 05:48:19
3547	77	thu	07:00:00	2024-11-08 05:48:19	2024-11-08 05:48:19
2616	65	sun	02:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2617	65	sun	03:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2618	65	sun	04:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2619	65	sun	05:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2620	65	sun	06:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
3548	77	thu	08:00:00	2024-11-08 05:48:19	2024-11-08 05:48:19
2621	65	sun	07:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2622	65	sun	08:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2623	65	sun	09:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2624	65	sun	10:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2625	65	sun	11:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2626	65	sun	12:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2627	65	sun	13:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2628	65	sun	14:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2629	65	sun	15:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2630	65	sun	16:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2631	65	sun	17:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2632	65	sun	18:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2633	65	sun	19:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2634	65	sun	20:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2635	65	sun	21:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2636	65	sun	22:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2637	65	sun	23:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2638	65	mon	02:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2639	65	mon	03:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2640	65	mon	04:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2641	65	mon	05:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2642	65	mon	06:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2643	65	mon	07:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2644	65	mon	08:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2645	65	mon	09:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2646	65	mon	10:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2647	65	mon	11:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2648	65	mon	12:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2649	65	mon	13:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2650	65	mon	14:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2651	65	mon	15:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2652	65	mon	16:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2653	65	mon	17:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2654	65	mon	18:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2655	65	mon	19:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2656	65	mon	20:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2657	65	mon	21:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2658	65	mon	22:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2659	65	mon	23:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2660	65	tue	02:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2661	65	tue	03:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2662	65	tue	04:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2663	65	tue	05:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2664	65	tue	06:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2665	65	tue	07:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2666	65	tue	08:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2667	65	tue	09:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2668	65	tue	10:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2669	65	tue	11:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2670	65	tue	12:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2671	65	tue	13:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2672	65	tue	14:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2673	65	tue	15:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2674	65	tue	16:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2675	65	tue	17:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2676	65	tue	18:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2677	65	tue	19:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2678	65	tue	20:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2679	65	tue	21:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2680	65	tue	22:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2681	65	tue	23:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2682	65	wed	02:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2683	65	wed	03:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2684	65	wed	04:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2685	65	wed	05:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2686	65	wed	06:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2687	65	wed	07:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2688	65	wed	08:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2689	65	wed	09:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2690	65	wed	10:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2691	65	wed	11:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2692	65	wed	12:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2693	65	wed	13:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2694	65	wed	14:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2695	65	wed	15:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2696	65	wed	16:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2697	65	wed	17:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2698	65	wed	18:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2699	65	wed	19:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2700	65	wed	20:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2701	65	wed	21:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2702	65	wed	22:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2703	65	wed	23:00:00	2024-09-23 10:21:28	2024-09-23 10:21:28
2704	66	sun	00:00:00	2024-09-23 13:07:01	2024-09-23 13:07:01
2705	66	sun	10:00:00	2024-09-23 13:07:01	2024-09-23 13:07:01
2706	66	sun	11:00:00	2024-09-23 13:07:01	2024-09-23 13:07:01
2707	66	sun	12:00:00	2024-09-23 13:07:01	2024-09-23 13:07:01
2708	66	sun	13:00:00	2024-09-23 13:07:01	2024-09-23 13:07:01
2709	66	sun	14:00:00	2024-09-23 13:07:01	2024-09-23 13:07:01
2710	66	sun	15:00:00	2024-09-23 13:07:01	2024-09-23 13:07:01
2711	66	sun	16:00:00	2024-09-23 13:07:01	2024-09-23 13:07:01
2712	66	sun	17:00:00	2024-09-23 13:07:01	2024-09-23 13:07:01
2713	66	sun	18:00:00	2024-09-23 13:07:01	2024-09-23 13:07:01
2714	66	sun	19:00:00	2024-09-23 13:07:01	2024-09-23 13:07:01
2715	66	sun	01:00:00	2024-09-23 13:07:01	2024-09-23 13:07:01
2716	66	sun	20:00:00	2024-09-23 13:07:01	2024-09-23 13:07:01
2717	66	sun	21:00:00	2024-09-23 13:07:01	2024-09-23 13:07:01
2718	66	sun	22:00:00	2024-09-23 13:07:01	2024-09-23 13:07:01
2719	66	sun	23:00:00	2024-09-23 13:07:01	2024-09-23 13:07:01
2720	66	sun	02:00:00	2024-09-23 13:07:01	2024-09-23 13:07:01
2721	66	sun	03:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2722	66	sun	04:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2723	66	sun	05:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2724	66	sun	06:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2725	66	sun	07:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2726	66	sun	08:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2727	66	sun	09:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2728	66	sat	00:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2729	66	sat	10:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2730	66	sat	11:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2731	66	sat	12:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2732	66	sat	13:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2733	66	sat	14:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2734	66	sat	15:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2735	66	sat	16:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2736	66	sat	17:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2737	66	sat	18:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2738	66	sat	19:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2739	66	sat	01:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2740	66	sat	20:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2741	66	sat	21:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2742	66	sat	22:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2743	66	sat	23:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2744	66	sat	02:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2745	66	sat	03:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2746	66	sat	04:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2747	66	sat	05:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2748	66	sat	06:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2749	66	sat	07:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2750	66	sat	08:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
2751	66	sat	09:00:00	2024-09-23 13:07:02	2024-09-23 13:07:02
3146	72	sun	10:00:00	2024-10-22 04:14:19	2024-10-22 04:14:19
3152	72	sun	15:00:00	2024-10-22 04:14:29	2024-10-22 04:14:29
3158	72	mon	08:00:00	2024-10-22 04:14:42	2024-10-22 04:14:42
3164	72	mon	14:00:00	2024-10-22 04:14:46	2024-10-22 04:14:46
3170	72	mon	20:00:00	2024-10-22 04:14:52	2024-10-22 04:14:52
3176	72	tue	12:00:00	2024-10-22 04:14:58	2024-10-22 04:14:58
3182	72	tue	19:00:00	2024-10-22 04:15:05	2024-10-22 04:15:05
2759	70	sun	09:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2760	70	sun	10:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2761	70	sun	11:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2762	70	sun	12:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2763	70	sun	13:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2764	70	sun	14:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2765	70	sun	15:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2766	70	sun	16:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2767	70	sun	17:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2768	70	sun	18:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2769	70	mon	09:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2770	70	mon	10:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2771	70	mon	11:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2772	70	mon	12:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2773	70	mon	13:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2774	70	mon	14:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2775	70	mon	15:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2776	70	mon	16:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2777	70	mon	17:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2778	70	mon	18:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2779	70	tue	09:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2780	70	tue	10:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2781	70	tue	11:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2782	70	tue	12:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2783	70	tue	13:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2784	70	tue	14:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2785	70	tue	15:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2786	70	tue	16:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2787	70	tue	17:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2788	70	tue	18:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2789	70	wed	09:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2790	70	wed	10:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2791	70	wed	11:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2792	70	wed	12:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2793	70	wed	13:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2794	70	wed	14:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2795	70	wed	15:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2796	70	wed	16:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2797	70	wed	17:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2798	70	wed	18:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2799	70	thu	09:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2800	70	thu	10:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2801	70	thu	11:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2802	70	thu	12:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2803	70	thu	13:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2804	70	thu	14:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2805	70	thu	15:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2806	70	thu	16:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2807	70	thu	17:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2808	70	thu	18:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2809	70	fri	09:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2810	70	fri	12:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2811	70	fri	15:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2812	70	fri	18:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2813	70	sat	09:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2814	70	sat	12:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2815	70	sat	15:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
2816	70	sat	18:00:00	2024-10-08 10:42:49	2024-10-08 10:42:49
3188	72	sat	12:00:00	2024-10-22 04:15:11	2024-10-22 04:15:11
3193	72	sat	17:00:00	2024-10-22 04:15:14	2024-10-22 04:15:14
3198	71	sun	09:00:00	2024-10-24 07:48:03	2024-10-24 07:48:03
3199	71	sun	19:00:00	2024-10-24 07:48:03	2024-10-24 07:48:03
3200	71	sun	20:00:00	2024-10-24 07:48:03	2024-10-24 07:48:03
3201	71	sun	21:00:00	2024-10-24 07:48:03	2024-10-24 07:48:03
3202	71	sun	22:00:00	2024-10-24 07:48:03	2024-10-24 07:48:03
3203	71	sun	23:00:00	2024-10-24 07:48:03	2024-10-24 07:48:03
3204	71	sun	10:00:00	2024-10-24 07:48:03	2024-10-24 07:48:03
3205	71	sun	11:00:00	2024-10-24 07:48:03	2024-10-24 07:48:03
3206	71	sun	12:00:00	2024-10-24 07:48:03	2024-10-24 07:48:03
3207	71	sun	13:00:00	2024-10-24 07:48:03	2024-10-24 07:48:03
3208	71	sun	14:00:00	2024-10-24 07:48:03	2024-10-24 07:48:03
3209	71	sun	15:00:00	2024-10-24 07:48:03	2024-10-24 07:48:03
3210	71	sun	16:00:00	2024-10-24 07:48:03	2024-10-24 07:48:03
3211	71	sun	17:00:00	2024-10-24 07:48:03	2024-10-24 07:48:03
3212	71	sun	18:00:00	2024-10-24 07:48:03	2024-10-24 07:48:03
3213	71	thu	09:00:00	2024-10-24 07:48:03	2024-10-24 07:48:03
3214	71	thu	19:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3215	71	thu	20:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3216	71	thu	21:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3217	71	thu	22:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3218	71	thu	23:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3219	71	thu	10:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3220	71	thu	11:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3221	71	thu	12:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3222	71	thu	13:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3223	71	thu	14:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3224	71	thu	15:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3225	71	thu	16:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3226	71	thu	17:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3227	71	thu	18:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3228	71	fri	09:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3229	71	fri	19:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3230	71	fri	20:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3231	71	fri	21:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3232	71	fri	22:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3233	71	fri	23:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3234	71	fri	10:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3235	71	fri	11:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3236	71	fri	12:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3237	71	fri	13:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3238	71	fri	14:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3239	71	fri	15:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3147	72	sun	11:00:00	2024-10-22 04:14:22	2024-10-22 04:14:22
3153	72	sun	16:00:00	2024-10-22 04:14:31	2024-10-22 04:14:31
3159	72	mon	09:00:00	2024-10-22 04:14:42	2024-10-22 04:14:42
3165	72	mon	15:00:00	2024-10-22 04:14:47	2024-10-22 04:14:47
3171	72	tue	08:00:00	2024-10-22 04:14:54	2024-10-22 04:14:54
3177	72	tue	14:00:00	2024-10-22 04:15:01	2024-10-22 04:15:01
3183	72	tue	20:00:00	2024-10-22 04:15:06	2024-10-22 04:15:06
3189	72	sat	13:00:00	2024-10-22 04:15:11	2024-10-22 04:15:11
3194	72	sat	18:00:00	2024-10-22 04:15:14	2024-10-22 04:15:14
3240	71	fri	16:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3241	71	fri	17:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3242	71	fri	18:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3243	71	sat	09:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3244	71	sat	19:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3245	71	sat	20:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3246	71	sat	21:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3247	71	sat	22:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3248	71	sat	23:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3249	71	sat	10:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3250	71	sat	11:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3251	71	sat	12:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3252	71	sat	13:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3253	71	sat	14:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3254	71	sat	15:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3255	71	sat	16:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3256	71	sat	17:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3257	71	sat	18:00:00	2024-10-24 07:48:04	2024-10-24 07:48:04
3505	77	sun	00:00:00	2024-11-08 05:48:17	2024-11-08 05:48:17
3506	77	sun	06:00:00	2024-11-08 05:48:17	2024-11-08 05:48:17
3507	77	sun	09:00:00	2024-11-08 05:48:17	2024-11-08 05:48:17
3508	77	sun	12:00:00	2024-11-08 05:48:17	2024-11-08 05:48:17
3509	77	sun	13:00:00	2024-11-08 05:48:17	2024-11-08 05:48:17
3510	77	sun	11:00:00	2024-11-08 05:48:17	2024-11-08 05:48:17
3511	77	sun	10:00:00	2024-11-08 05:48:17	2024-11-08 05:48:17
3512	77	sun	07:00:00	2024-11-08 05:48:17	2024-11-08 05:48:17
3513	77	sun	08:00:00	2024-11-08 05:48:17	2024-11-08 05:48:17
3514	77	sun	05:00:00	2024-11-08 05:48:17	2024-11-08 05:48:17
3515	77	sun	04:00:00	2024-11-08 05:48:17	2024-11-08 05:48:17
3516	77	sun	03:00:00	2024-11-08 05:48:17	2024-11-08 05:48:17
3517	77	sun	02:00:00	2024-11-08 05:48:17	2024-11-08 05:48:17
3518	77	sun	01:00:00	2024-11-08 05:48:17	2024-11-08 05:48:17
3519	77	mon	11:00:00	2024-11-08 05:48:17	2024-11-08 05:48:17
3520	77	mon	02:00:00	2024-11-08 05:48:17	2024-11-08 05:48:17
3521	77	mon	03:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3522	77	mon	04:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3523	77	mon	05:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3524	77	mon	06:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3525	77	mon	07:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3526	77	mon	08:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3527	77	mon	09:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3528	77	mon	10:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3529	77	tue	03:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3530	77	tue	04:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3531	77	tue	05:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3532	77	tue	06:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3533	77	tue	07:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3534	77	tue	08:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3535	77	tue	09:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3536	77	tue	10:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3537	77	wed	03:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3538	77	wed	04:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3539	77	wed	05:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3540	77	wed	06:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3541	77	wed	07:00:00	2024-11-08 05:48:18	2024-11-08 05:48:18
3148	72	sun	12:00:00	2024-10-22 04:14:22	2024-10-22 04:14:22
3154	72	sun	17:00:00	2024-10-22 04:14:31	2024-10-22 04:14:31
3160	72	mon	10:00:00	2024-10-22 04:14:42	2024-10-22 04:14:42
3166	72	mon	17:00:00	2024-10-22 04:14:49	2024-10-22 04:14:49
3172	72	tue	09:00:00	2024-10-22 04:14:56	2024-10-22 04:14:56
3178	72	tue	18:00:00	2024-10-22 04:15:01	2024-10-22 04:15:01
3184	72	sat	08:00:00	2024-10-22 04:15:06	2024-10-22 04:15:06
3190	72	sat	14:00:00	2024-10-22 04:15:12	2024-10-22 04:15:12
3195	72	sat	19:00:00	2024-10-22 04:15:15	2024-10-22 04:15:15
3426	74	sun	09:00:00	2024-11-06 12:22:24	2024-11-06 12:22:24
3427	74	sun	19:00:00	2024-11-06 12:22:24	2024-11-06 12:22:24
3428	74	sun	20:00:00	2024-11-06 12:22:24	2024-11-06 12:22:24
3429	74	sun	21:00:00	2024-11-06 12:22:24	2024-11-06 12:22:24
3430	74	sun	10:00:00	2024-11-06 12:22:24	2024-11-06 12:22:24
3431	74	sun	11:00:00	2024-11-06 12:22:24	2024-11-06 12:22:24
3432	74	sun	12:00:00	2024-11-06 12:22:24	2024-11-06 12:22:24
3433	74	sun	13:00:00	2024-11-06 12:22:24	2024-11-06 12:22:24
3434	74	sun	14:00:00	2024-11-06 12:22:24	2024-11-06 12:22:24
3435	74	sun	15:00:00	2024-11-06 12:22:24	2024-11-06 12:22:24
3436	74	sun	16:00:00	2024-11-06 12:22:24	2024-11-06 12:22:24
3437	74	sun	17:00:00	2024-11-06 12:22:24	2024-11-06 12:22:24
3438	74	sun	18:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3439	74	mon	09:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3440	74	mon	19:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3441	74	mon	20:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3442	74	mon	21:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3443	74	mon	10:00:00	2024-11-06 12:22:25	2024-11-06 12:22:25
3549	77	fri	05:00:00	2024-11-08 05:48:19	2024-11-08 05:48:19
3550	77	fri	06:00:00	2024-11-08 05:48:19	2024-11-08 05:48:19
3551	77	fri	07:00:00	2024-11-08 05:48:19	2024-11-08 05:48:19
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
44	21	6
45	21	7
46	19	9
47	22	3
48	22	4
49	22	8
50	22	6
51	23	3
52	23	4
53	23	5
54	23	6
55	23	7
56	23	8
57	24	4
58	24	7
59	25	3
60	26	3
61	26	5
62	26	6
63	26	8
64	18	4
65	18	7
67	27	3
68	27	5
69	27	6
70	27	7
71	27	8
72	27	9
75	28	3
76	29	3
77	29	4
78	29	5
79	29	6
80	29	7
81	29	8
82	29	9
83	30	3
84	30	4
85	30	5
86	30	6
87	30	9
88	31	3
89	31	5
90	31	8
91	32	3
92	32	4
93	32	5
94	32	6
95	32	7
96	32	8
97	31	6
98	31	9
99	33	3
100	33	4
101	33	5
102	33	6
103	33	8
104	34	3
105	35	5
107	35	8
109	36	3
110	36	4
111	36	5
112	36	6
113	36	7
114	36	8
115	37	3
116	37	5
117	37	7
118	38	3
119	38	5
120	38	7
121	35	3
122	39	3
123	39	5
124	39	8
125	40	3
126	40	5
127	40	7
128	40	9
129	40	8
130	41	3
131	41	5
132	41	7
133	41	9
134	41	8
135	42	3
136	42	4
137	42	6
138	42	7
139	43	4
140	44	3
141	44	8
142	44	9
143	45	4
144	46	3
145	46	5
146	46	7
147	46	9
148	47	3
149	47	4
150	47	6
151	47	7
152	47	9
153	48	3
154	48	5
155	48	8
156	49	3
157	49	5
158	49	6
159	49	8
160	49	9
161	50	3
162	50	5
163	50	8
164	51	3
165	51	5
166	51	6
167	51	8
168	52	3
169	52	5
170	52	8
171	53	5
172	53	8
173	53	9
174	54	3
175	54	4
176	54	5
177	54	6
178	54	7
179	54	8
180	54	9
181	55	3
182	55	5
183	55	7
184	56	3
185	56	5
186	56	7
187	56	9
188	57	3
189	57	5
190	57	7
191	57	9
192	58	3
193	58	5
194	58	7
195	58	9
196	59	3
197	59	5
198	59	7
199	59	9
200	60	3
201	60	5
202	60	6
203	60	8
204	60	9
205	61	5
206	61	8
207	62	3
208	62	4
209	62	5
210	62	6
211	62	7
212	62	8
213	62	9
214	63	3
215	63	4
216	63	5
217	63	6
218	63	7
219	63	8
220	63	9
221	64	3
222	64	4
223	64	5
224	64	6
225	64	7
226	64	8
227	64	9
228	65	3
229	65	4
230	65	5
231	65	6
232	65	7
233	65	8
234	65	9
235	66	3
236	66	4
237	66	5
238	66	6
239	66	7
240	66	8
241	67	3
242	67	4
243	67	5
244	67	6
245	67	7
246	67	8
247	67	9
248	68	3
249	68	4
250	68	5
251	68	6
252	68	7
253	68	8
254	68	9
255	69	3
256	69	4
257	69	5
258	69	6
259	69	7
260	69	8
261	69	9
262	70	3
263	70	5
264	70	6
265	70	8
266	70	9
267	71	3
268	71	5
269	71	6
270	71	8
271	72	3
272	72	4
273	72	5
274	72	6
275	72	7
276	72	8
277	72	9
278	73	6
279	73	7
280	73	8
281	73	9
282	74	3
283	74	5
284	74	6
285	74	7
286	74	8
287	75	3
288	75	4
289	75	6
290	75	7
291	75	8
292	75	9
293	76	9
294	77	3
\.


--
-- Data for Name: yacht_offers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.yacht_offers (id, yacht_id, name, description, price, offer_price, image, status, created_at, updated_at, deleted_at, offer_type, package_id) FROM stdin;
1	2	Offer 2	<p><strong>Testing&nbsp;</strong></p>	500.00	200.00	663aeab22f32f_1715137202.jpg	1	2024-05-08 07:00:02	2024-05-13 01:37:26	\N	percentage	0
3	6	Birthday Offer	testing	100.00	0.00	6660837e52ecf_1717601150.png	1	2024-06-05 19:25:50	2024-06-05 19:25:50	\N	percentage	0
2	6	Special offer	testing	40.00	20.00	666030354ad45_1717579829.png	1	2024-06-05 13:28:24	2024-06-05 20:47:01	\N	percentage	0
4	15	Test Offer E	Description Test Offer E	121.00	0.00	6660b27361115_1717613171.png	1	2024-06-05 21:21:27	2024-06-05 23:11:01	\N	percentage	0
5	19	testing	Short description	23.00	11.00	6698e78a132b6_1721296778.png	1	2024-07-18 13:59:38	2024-07-18 13:59:38	\N	percentage	0
34	31	test	<p>dasd</p>	12.00	0.00	66c5cd3e8b031_1724239166.png	1	2024-08-21 15:19:26	2024-08-21 15:22:20	2024-08-21 15:22:20	fixed	0
8	18	test	abcd	50.00	60.00	66a15decdca36_1721851372.jpg	1	2024-07-25 00:02:52	2024-07-25 00:02:52	\N	percentage	0
7	18	twst	abchhhh	50.00	60.00	66a173771e2b6_1721856887.jpg	1	2024-07-25 00:00:54	2024-07-25 01:34:47	\N	percentage	0
6	24	Hamid	description	7000.00	6000.00	66a200278d0a8_1721892903.jpg	1	2024-07-24 23:40:07	2024-07-25 11:35:03	\N	percentage	0
20	29	Birthday Offer	testing	50.00	0.00	66ba4a9684de3_1723484822.png	1	2024-08-12 21:47:02	2024-08-12 21:47:02	\N	percentage	0
21	29	Birthday Offer	testing	50.00	0.00	66ba4ab9834f8_1723484857.png	1	2024-08-12 21:47:37	2024-08-12 21:47:37	\N	percentage	0
22	29	Birthday Offer	testing	50.00	0.00	66bb4ff95791a_1723551737.png	1	2024-08-13 16:22:17	2024-08-13 16:22:17	\N	percentage	0
23	29	Birthday Offer	testing	50.00	0.00	66bb51926402f_1723552146.png	1	2024-08-13 16:29:06	2024-08-13 16:29:06	\N	percentage	0
19	29	This is First	description	50.00	0.00	66ba499bcb905_1723484571.png	1	2024-08-12 21:42:51	2024-08-14 14:07:37	\N	percentage	0
17	30	Birthday Offer	testing	50.00	0.00	66bc6abca39de_1723624124.jpg	1	2024-08-12 11:55:12	2024-08-14 14:15:47	2024-08-14 14:15:47	percentage	0
24	30	By One Get On	you can buy this offer and get one free.	4500.00	0.00	66bb69b4092e6_1723558324.jpg	1	2024-08-13 18:12:04	2024-08-14 14:47:56	2024-08-14 14:47:56	fixed	0
18	30	Birthday Offer	testing	50.00	0.00	66b9c0ebb3134_1723449579.png	1	2024-08-12 11:59:39	2024-08-14 14:48:49	2024-08-14 14:48:49	percentage	0
29	30	Get 50% Off On Events Planning Services	subscribe this offer to get this offer. its limited offer for 10 days	2000.00	0.00	66bc8cf8e1733_1723632888.jpg	1	2024-08-14 14:54:49	2024-08-14 14:55:54	2024-08-14 14:55:54	percentage	0
30	35	RAMADAN OFFER	it's the best Ramadan Offer	20.00	0.00	66be0a98541c9_1723730584.jpg	1	2024-08-15 18:03:04	2024-08-15 18:03:04	\N	percentage	0
27	31	add	drd	2008.00	0.00	66bb91223f466_1723568418.jpg	1	2024-08-13 21:00:18	2024-08-21 14:43:47	2024-08-21 14:43:47	fixed	0
32	36	independence day off	use test code	300.00	0.00	66be453a1e32d_1723745594.jpg	1	2024-08-15 22:13:14	2024-08-21 14:44:27	2024-08-21 14:44:27	percentage	0
31	36	Ramada offer	Ramanan offer	20.00	0.00	66c5c3319af95_1724236593.jpg	1	2024-08-15 20:46:52	2024-08-21 14:46:30	\N	percentage	0
28	31	RAMADAN Offer	Secial offer for Ramadan	500.00	0.00	66bc5291b6403_1723617937.jpg	1	2024-08-14 10:45:37	2024-08-21 14:46:42	2024-08-21 14:46:42	fixed	0
41	47	teat	twst	500.00	0.00	67051de58eb6a_1728388581.jpg	1	2024-10-08 15:30:22	2024-10-08 15:56:21	\N	fixed	0
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
7	19	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	t	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2024-07-18 10:18:15	2024-07-18 10:21:18
2	4	t	f	f	f	f	f	f	f	f	t	t	t	t	t	t	t	t	t	t	t	t	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	t	t	t	t	t	t	t	t	t	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2024-05-05 21:07:04	2024-05-11 14:06:06
6	17	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2024-07-18 09:40:59	2024-07-18 10:31:56
8	31	t	f	f	f	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	f	t	f	f	f	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	f	t	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	2024-08-10 10:57:15	2024-08-12 18:13:19
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
-- Data for Name: yatch_normal_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.yatch_normal_rates (id, yatch_id, day, morning_from, morning_to, morning_rate, afternoon_from, afternoon_to, afternoon_rate, evening_from, evening_to, evening_rate, created_at, updated_at) FROM stdin;
164	29	sun	06:00:00	10:00:00	2000	13:00:00	17:00:00	3000	18:00:00	22:00:00	5000	2024-08-13 21:46:40	2024-08-13 21:46:40
165	29	mon	06:00:00	10:00:00	5000	13:00:00	17:00:00	6000	18:00:00	22:00:00	8000	2024-08-13 21:46:40	2024-08-13 21:46:40
166	29	tue	06:00:00	10:00:00	5000	13:00:00	17:00:00	6000	18:00:00	22:00:00	8000	2024-08-13 21:46:40	2024-08-13 21:46:40
167	29	wed	06:00:00	10:00:00	5000	13:00:00	17:00:00	6000	18:00:00	22:00:00	8000	2024-08-13 21:46:40	2024-08-13 21:46:40
168	29	thu	06:00:00	10:00:00	5000	13:00:00	17:00:00	6000	18:00:00	22:00:00	8000	2024-08-13 21:46:40	2024-08-13 21:46:40
169	29	fri	06:00:00	10:00:00	5000	13:00:00	17:00:00	6000	18:00:00	22:00:00	8000	2024-08-13 21:46:40	2024-08-13 21:46:40
170	29	sat	06:00:00	10:00:00	5000	13:00:00	17:00:00	6000	18:00:00	22:00:00	8000	2024-08-13 21:46:40	2024-08-13 21:46:40
257	37	tue	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-20 08:44:50	2024-08-20 08:44:50
258	37	wed	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-20 08:44:50	2024-08-20 08:44:50
260	37	fri	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-20 08:44:50	2024-08-20 08:44:50
261	37	sat	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-20 08:44:50	2024-08-20 08:44:50
178	31	sun	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-14 08:23:42	2024-08-14 08:23:42
179	31	mon	09:00:00	12:00:00	250	12:00:00	15:00:00	500	15:00:00	21:00:00	650	2024-08-14 08:23:42	2024-08-14 08:23:42
180	31	tue	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-14 08:23:42	2024-08-14 08:23:42
181	31	wed	09:00:00	12:00:00	100	12:00:00	15:00:00	150	15:00:00	21:00:00	250	2024-08-14 08:23:42	2024-08-14 08:23:42
182	31	thu	06:32:00	12:00:00	100	12:30:00	17:00:00	200	17:00:00	22:00:00	500	2024-08-14 08:23:42	2024-08-14 08:23:42
183	31	fri	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-14 08:23:42	2024-08-14 08:23:42
184	31	sat	06:00:00	12:00:00	200	\N	\N	0	\N	\N	0	2024-08-14 08:23:42	2024-08-14 08:23:42
92	18	sun	\N	\N	0	\N	\N	0	\N	\N	0	2024-07-29 21:44:27	2024-07-29 21:44:27
93	18	mon	\N	\N	0	\N	\N	0	\N	\N	0	2024-07-29 21:44:27	2024-07-29 21:44:27
94	18	tue	\N	\N	0	\N	\N	0	\N	\N	0	2024-07-29 21:44:27	2024-07-29 21:44:27
95	18	wed	\N	\N	0	\N	\N	0	\N	\N	0	2024-07-29 21:44:27	2024-07-29 21:44:27
96	18	thu	\N	\N	0	\N	\N	0	\N	\N	0	2024-07-29 21:44:27	2024-07-29 21:44:27
97	18	fri	\N	\N	0	\N	\N	0	\N	\N	0	2024-07-29 21:44:27	2024-07-29 21:44:27
98	18	sat	02:44:00	02:44:00	60	02:44:00	02:44:00	30	02:44:00	02:44:00	50	2024-07-29 21:44:27	2024-07-29 21:44:27
29	19	sun	08:00:00	09:00:00	22	10:00:00	12:00:00	33	13:00:00	14:00:00	44	2024-07-25 16:34:48	2024-07-25 16:34:48
30	19	mon	09:00:00	11:00:00	26	13:00:00	15:00:00	31	16:00:00	21:00:00	81	2024-07-25 16:34:48	2024-07-25 16:34:48
31	19	tue	\N	\N	0	\N	\N	0	\N	\N	0	2024-07-25 16:34:48	2024-07-25 16:34:48
32	19	wed	\N	\N	0	\N	\N	0	\N	\N	0	2024-07-25 16:34:48	2024-07-25 16:34:48
33	19	thu	\N	\N	0	\N	\N	0	\N	\N	0	2024-07-25 16:34:48	2024-07-25 16:34:48
34	19	fri	07:00:00	09:00:00	21	10:00:00	13:00:00	31	14:00:00	17:00:00	41	2024-07-25 16:34:48	2024-07-25 16:34:48
35	19	sat	\N	\N	0	\N	\N	0	\N	\N	0	2024-07-25 16:34:48	2024-07-25 16:34:48
99	28	sun	04:00:00	12:00:00	200	13:00:00	16:00:00	250	\N	\N	0	2024-08-08 07:48:24	2024-08-08 07:48:24
100	28	mon	09:00:00	12:00:00	25	13:00:00	15:00:00	30	16:00:00	21:00:00	80	2024-08-08 07:48:24	2024-08-08 07:48:24
101	28	tue	09:00:00	12:00:00	200	12:00:00	15:00:00	300	15:00:00	21:00:00	500	2024-08-08 07:48:24	2024-08-08 07:48:24
103	28	thu	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-08 07:48:24	2024-08-08 07:48:24
104	28	fri	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-08 07:48:24	2024-08-08 07:48:24
105	28	sat	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-08 07:48:24	2024-08-08 07:48:24
106	30	sun	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-12 07:20:59	2024-08-12 07:20:59
107	30	mon	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-12 07:20:59	2024-08-12 07:20:59
108	30	tue	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-12 07:20:59	2024-08-12 07:20:59
109	30	wed	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-12 07:20:59	2024-08-12 07:20:59
110	30	thu	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-12 07:20:59	2024-08-12 07:20:59
111	30	fri	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-12 07:20:59	2024-08-12 07:20:59
112	30	sat	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-12 07:20:59	2024-08-12 07:20:59
255	37	sun	08:00:00	11:00:00	100	11:00:00	15:00:00	280	15:00:00	21:00:00	800	2024-08-20 12:46:34	2024-08-20 12:46:34
256	37	mon	09:00:00	12:00:00	500	12:00:00	15:00:00	585	15:00:00	18:00:00	895	2024-08-20 12:48:27	2024-08-20 12:48:27
263	38	tue	09:00:00	12:00:00	100	12:00:00	15:00:00	110	15:00:00	22:00:00	200	2024-08-20 16:11:52	2024-08-20 16:11:52
265	39	tue	09:00:00	12:00:00	100	12:00:00	15:00:00	120	15:00:00	22:00:00	150	2024-08-20 17:48:26	2024-08-20 17:48:26
507	74	sun	09:00:00	12:00:00	120	13:00:00	17:00:00	130	18:00:00	23:00:00	150	2024-11-06 13:57:44	2024-11-06 13:57:44
209	36	wed	09:00:00	12:00:00	100	12:00:00	17:00:00	110	17:00:00	22:00:00	200	2024-08-21 14:25:32	2024-08-21 14:25:32
259	37	thu	09:00:00	12:00:00	100	12:00:00	17:00:00	120	17:00:00	22:00:00	150	2024-08-21 15:03:20	2024-08-21 15:03:20
185	32	sun	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-14 12:03:23	2024-08-14 12:03:23
186	32	mon	17:05:00	17:35:00	20	18:25:00	22:02:00	30	19:01:00	21:30:00	40	2024-08-14 12:03:23	2024-08-14 12:03:23
187	32	tue	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-14 12:03:23	2024-08-14 12:03:23
188	32	wed	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-14 12:03:23	2024-08-14 12:03:23
189	32	thu	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-14 12:03:23	2024-08-14 12:03:23
190	32	fri	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-14 12:03:23	2024-08-14 12:03:23
191	32	sat	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-14 12:03:23	2024-08-14 12:03:23
210	36	thu	09:00:00	12:00:00	100	12:00:00	17:00:00	120	17:00:00	22:00:00	300	2024-08-21 14:27:25	2024-08-21 14:27:25
102	28	wed	09:00:00	12:00:00	100	12:00:00	17:00:00	200	17:00:00	22:00:00	250	2024-08-21 15:16:26	2024-08-21 15:16:26
207	36	mon	09:00:00	12:00:00	100	12:00:00	15:00:00	150	15:00:00	22:00:00	200	2024-08-26 12:55:51	2024-08-26 12:55:51
208	36	tue	09:00:00	12:00:00	100	12:00:00	14:00:00	110	14:00:00	22:00:00	150	2024-08-26 12:56:36	2024-08-26 12:56:36
206	36	sun	21:40:00	21:40:00	10	14:41:00	22:41:00	30	12:41:00	21:41:00	60	2024-08-15 22:30:56	2024-08-15 22:30:56
211	36	fri	03:30:00	03:30:00	100	05:30:00	14:30:00	200	14:30:00	23:30:00	300	2024-08-15 22:30:56	2024-08-15 22:30:56
213	4	sun	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-16 11:38:29	2024-08-16 11:38:29
214	4	mon	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-16 11:38:30	2024-08-16 11:38:30
215	4	tue	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-16 11:38:30	2024-08-16 11:38:30
216	4	wed	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-16 11:38:30	2024-08-16 11:38:30
217	4	thu	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-16 11:38:30	2024-08-16 11:38:30
218	4	fri	09:00:00	12:00:00	250	12:00:00	15:00:00	300	15:00:00	20:00:00	350	2024-08-16 11:38:30	2024-08-16 11:38:30
219	4	sat	09:00:00	12:00:00	100	12:00:00	15:00:00	250	15:00:00	19:00:00	350	2024-08-16 11:38:30	2024-08-16 11:38:30
249	35	mon	09:00:00	12:00:00	150	12:00:00	15:00:00	200	15:00:00	19:00:00	250	2024-08-20 10:29:28	2024-08-20 10:29:28
262	38	mon	08:00:00	12:00:00	100	12:00:00	15:00:00	150	15:00:00	20:00:00	250	2024-08-20 13:08:12	2024-08-20 13:08:12
251	35	wed	09:00:00	12:00:00	100	12:00:00	14:00:00	120	14:00:00	19:00:00	110	2024-08-20 16:23:59	2024-08-20 16:23:59
264	39	mon	09:00:00	12:00:00	100	12:00:00	15:00:00	150	15:00:00	22:00:00	200	2024-08-20 16:51:00	2024-08-20 16:51:00
266	39	wed	09:00:00	12:00:00	100	12:00:00	14:00:00	150	14:00:00	19:00:00	200	2024-08-20 17:49:36	2024-08-20 17:49:36
509	74	tue	09:00:00	12:00:00	120	13:00:00	17:00:00	130	18:00:00	23:00:00	140	2024-11-06 13:57:44	2024-11-06 13:57:44
510	74	wed	09:00:00	12:00:00	100	13:00:00	17:00:00	120	18:00:00	23:00:00	130	2024-11-06 13:57:44	2024-11-06 13:57:44
511	74	thu	09:00:00	12:00:00	100	13:00:00	17:00:00	138	18:00:00	23:00:00	150	2024-11-06 13:57:44	2024-11-06 13:57:44
274	42	sun	09:00:00	12:00:00	100	12:00:00	15:00:00	110	15:00:00	22:00:00	200	2024-08-20 21:25:18	2024-08-20 21:25:18
276	42	tue	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-20 21:25:18	2024-08-20 21:25:18
277	42	wed	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-20 21:25:18	2024-08-20 21:25:18
278	42	thu	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-20 21:25:18	2024-08-20 21:25:18
279	42	fri	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-20 21:25:18	2024-08-20 21:25:18
275	42	mon	09:00:00	12:00:00	100	12:00:00	16:00:00	150	16:00:00	22:00:00	200	2024-08-21 01:32:05	2024-08-21 01:32:05
281	26	wed	09:00:00	12:00:00	100	12:00:00	17:00:00	150	17:00:00	22:00:00	200	2024-08-21 15:08:20	2024-08-21 15:08:20
512	74	fri	09:00:00	12:00:00	100	13:00:00	17:00:00	200	18:00:00	23:00:00	300	2024-11-06 13:57:44	2024-11-06 13:57:44
513	74	sat	09:00:00	12:00:00	100	13:00:00	17:00:00	110	18:00:00	23:00:00	120	2024-11-06 13:57:44	2024-11-06 13:57:44
388	63	sun	00:00:00	13:00:00	10	13:01:00	16:30:00	20	16:31:00	23:55:00	30	2024-09-23 12:49:44	2024-09-23 12:49:44
389	63	mon	\N	\N	0	\N	\N	0	\N	\N	0	2024-09-23 12:49:44	2024-09-23 12:49:44
390	63	tue	\N	\N	0	\N	\N	0	\N	\N	0	2024-09-23 12:49:44	2024-09-23 12:49:44
248	35	sun	09:00:00	12:00:00	100	12:00:00	15:00:00	110	15:00:00	22:00:00	150	2024-08-20 04:30:40	2024-08-20 04:30:40
250	35	tue	09:00:00	12:00:00	100	12:00:00	15:00:00	120	15:00:00	21:00:00	150	2024-08-20 04:30:40	2024-08-20 04:30:40
252	35	thu	09:00:00	12:00:00	10	12:00:00	16:00:00	20	16:00:00	22:00:00	30	2024-08-20 04:30:40	2024-08-20 04:30:40
253	35	fri	09:00:00	12:00:00	10	12:00:00	18:00:00	20	18:00:00	22:00:00	30	2024-08-20 04:30:40	2024-08-20 04:30:40
254	35	sat	\N	\N	0	\N	\N	0	\N	\N	0	2024-08-20 04:30:40	2024-08-20 04:30:40
391	63	wed	\N	\N	0	\N	\N	0	\N	\N	0	2024-09-23 12:49:44	2024-09-23 12:49:44
392	63	thu	\N	\N	0	\N	\N	0	\N	\N	0	2024-09-23 12:49:44	2024-09-23 12:49:44
393	63	fri	\N	\N	0	\N	\N	0	\N	\N	0	2024-09-23 12:49:44	2024-09-23 12:49:44
394	63	sat	\N	\N	0	\N	\N	0	\N	\N	0	2024-09-23 12:49:44	2024-09-23 12:49:44
508	74	mon	09:00:00	12:00:00	0	12:00:00	16:00:00	0	16:00:00	23:00:00	0	2024-11-08 11:28:51	2024-11-08 11:28:51
303	47	sun	06:00:00	10:00:00	500	11:00:00	17:00:00	600	18:00:00	22:00:00	700	2024-08-23 21:54:39	2024-08-23 21:54:39
304	47	mon	06:00:00	10:00:00	500	11:01:00	17:00:00	900	18:00:00	23:00:00	500	2024-08-23 21:54:39	2024-08-23 21:54:39
305	47	tue	06:00:00	10:00:00	400	11:00:00	17:00:00	600	18:00:00	22:00:00	800	2024-08-23 21:54:39	2024-08-23 21:54:39
306	47	wed	06:00:00	10:00:00	500	11:00:00	17:00:00	600	18:00:00	23:00:00	900	2024-08-23 21:54:39	2024-08-23 21:54:39
307	47	thu	06:00:00	11:00:00	500	11:00:00	17:00:00	600	18:00:00	23:00:00	800	2024-08-23 21:54:39	2024-08-23 21:54:39
308	47	fri	06:00:00	10:00:00	600	11:00:00	17:00:00	800	18:00:00	23:00:00	900	2024-08-23 21:54:39	2024-08-23 21:54:39
309	47	sat	06:00:00	11:00:00	500	11:00:00	17:00:00	900	18:00:00	23:00:00	1000	2024-08-23 21:54:39	2024-08-23 21:54:39
212	36	sat	09:00:00	12:00:00	100	12:00:00	14:00:00	110	14:00:00	21:00:00	120	2024-08-26 12:57:22	2024-08-26 12:57:22
310	51	mon	09:00:00	12:00:00	100	12:00:00	14:00:00	110	14:00:00	16:00:00	150	2024-08-26 16:57:54	2024-08-26 16:57:54
280	42	sat	09:00:00	12:00:00	100	12:00:00	15:00:00	150	15:00:00	18:00:00	200	2024-09-05 12:05:54	2024-09-05 12:05:54
445	72	tue	08:00:00	12:00:00	100	12:00:00	15:00:00	150	15:00:00	20:00:00	200	2024-10-22 08:20:57	2024-10-22 08:20:57
447	72	sun	08:00:00	12:00:00	100	12:00:00	15:00:00	150	15:00:00	20:00:00	200	2024-10-22 08:22:11	2024-10-22 08:22:11
449	72	fri	08:00:00	12:00:00	100	12:00:00	15:00:00	150	15:00:00	20:00:00	200	2024-10-22 08:23:34	2024-10-22 08:23:34
465	73	sun	\N	\N	0	\N	\N	0	\N	\N	0	2024-10-24 11:11:36	2024-10-24 11:11:36
466	73	mon	\N	\N	0	\N	\N	0	\N	\N	0	2024-10-24 11:11:36	2024-10-24 11:11:36
467	73	tue	\N	\N	0	\N	\N	0	\N	\N	0	2024-10-24 11:11:36	2024-10-24 11:11:36
468	73	wed	09:00:00	12:00:00	100	13:00:00	16:00:00	200	17:00:00	22:00:00	400	2024-10-24 11:11:36	2024-10-24 11:11:36
469	73	thu	09:00:00	12:00:00	100	13:00:00	16:00:00	200	18:00:00	22:00:00	400	2024-10-24 11:11:36	2024-10-24 11:11:36
470	73	fri	09:00:00	12:00:00	100	13:00:00	17:00:00	200	18:00:00	22:00:00	400	2024-10-24 11:11:36	2024-10-24 11:11:36
471	73	sat	09:00:00	12:00:00	100	13:00:00	17:00:00	200	18:00:00	22:00:00	400	2024-10-24 11:11:36	2024-10-24 11:11:36
479	71	sun	01:47:00	10:47:00	100	10:51:00	17:51:00	200	18:51:00	22:51:00	400	2024-10-24 11:31:55	2024-10-24 11:31:55
480	71	mon	09:00:00	12:00:00	100	13:00:00	16:00:00	200	17:00:00	22:00:00	300	2024-10-24 11:31:55	2024-10-24 11:31:55
481	71	tue	08:00:00	12:00:00	150	13:00:00	16:00:00	200	17:00:00	22:00:00	300	2024-10-24 11:31:55	2024-10-24 11:31:55
482	71	wed	\N	\N	200	\N	\N	300	\N	\N	400	2024-10-24 11:31:55	2024-10-24 11:31:55
483	71	thu	\N	\N	0	\N	\N	0	\N	\N	0	2024-10-24 11:31:55	2024-10-24 11:31:55
484	71	fri	09:00:00	12:00:00	150	13:00:00	15:00:00	200	16:00:00	22:00:00	300	2024-10-24 11:31:55	2024-10-24 11:31:55
485	71	sat	\N	\N	50	\N	\N	100	\N	\N	200	2024-10-24 11:31:55	2024-10-24 11:31:55
360	64	sun	00:05:00	13:55:00	500	14:05:00	16:55:00	300	17:05:00	23:55:00	200	2024-09-20 10:22:16	2024-09-20 10:22:16
361	64	mon	00:05:00	13:55:00	500	11:05:00	16:55:00	300	16:00:00	23:55:00	200	2024-09-20 10:22:16	2024-09-20 10:22:16
362	64	tue	00:17:00	13:55:00	500	14:17:00	16:55:00	300	17:18:00	23:55:00	200	2024-09-20 10:22:16	2024-09-20 10:22:16
363	64	wed	00:18:00	13:55:00	500	14:06:00	16:55:00	300	17:05:00	23:55:00	200	2024-09-20 10:22:16	2024-09-20 10:22:16
364	64	thu	00:05:00	13:55:00	500	14:05:00	16:56:00	400	17:10:00	23:55:00	200	2024-09-20 10:22:16	2024-09-20 10:22:16
365	64	fri	00:05:00	13:56:00	600	14:11:00	16:55:00	300	17:05:00	23:54:00	200	2024-09-20 10:22:16	2024-09-20 10:22:16
366	64	sat	00:05:00	13:55:00	500	14:05:00	16:55:00	200	17:10:00	23:55:00	100	2024-09-20 10:22:16	2024-09-20 10:22:16
367	62	sun	00:05:00	13:54:00	400	12:22:00	16:55:00	300	15:49:00	23:55:00	200	2024-09-20 10:22:20	2024-09-20 10:22:20
368	62	mon	12:10:00	13:56:00	500	11:46:00	16:56:00	400	17:23:00	23:50:00	300	2024-09-20 10:22:20	2024-09-20 10:22:20
369	62	tue	00:02:00	13:57:00	500	14:09:00	16:58:00	300	17:04:00	11:55:00	200	2024-09-20 10:22:20	2024-09-20 10:22:20
370	62	wed	00:01:00	13:55:00	500	14:10:00	16:55:00	500	17:05:00	11:55:00	500	2024-09-20 10:22:20	2024-09-20 10:22:20
371	62	thu	12:09:00	13:55:00	500	14:25:00	16:55:00	500	17:05:00	23:55:00	500	2024-09-20 10:22:20	2024-09-20 10:22:20
372	62	fri	00:05:00	13:55:00	500	14:10:00	16:55:00	500	17:10:00	23:55:00	500	2024-09-20 10:22:20	2024-09-20 10:22:20
373	62	sat	00:01:00	13:55:00	500	14:10:00	16:55:00	500	17:10:00	23:55:00	500	2024-09-20 10:22:20	2024-09-20 10:22:20
381	65	sun	01:06:00	11:56:00	500	12:00:00	16:05:00	500	16:10:00	23:55:00	500	2024-09-23 10:08:11	2024-09-23 10:08:11
382	65	mon	01:05:00	11:55:00	500	12:00:00	15:00:00	500	15:05:00	23:55:00	500	2024-09-23 10:08:11	2024-09-23 10:08:11
383	65	tue	00:05:00	11:00:00	500	11:05:00	15:00:00	500	15:05:00	23:55:00	500	2024-09-23 10:08:11	2024-09-23 10:08:11
384	65	wed	00:05:00	12:05:00	500	12:10:00	15:00:00	500	15:05:00	23:55:00	500	2024-09-23 10:08:11	2024-09-23 10:08:11
385	65	thu	00:05:00	11:00:00	500	11:05:00	15:00:00	500	15:06:00	23:55:00	500	2024-09-23 10:08:11	2024-09-23 10:08:11
386	65	fri	00:05:00	11:00:00	500	11:05:00	15:00:00	500	15:05:00	23:55:00	500	2024-09-23 10:08:11	2024-09-23 10:08:11
387	65	sat	00:00:00	23:00:00	500	11:05:00	15:00:00	500	15:05:00	23:55:00	500	2024-09-23 10:08:11	2024-09-23 10:08:11
395	66	sun	\N	\N	0	\N	\N	0	\N	\N	0	2024-09-23 13:10:08	2024-09-23 13:10:08
396	66	mon	\N	\N	0	\N	\N	0	\N	\N	0	2024-09-23 13:10:08	2024-09-23 13:10:08
397	66	tue	\N	\N	0	\N	\N	0	\N	\N	0	2024-09-23 13:10:08	2024-09-23 13:10:08
398	66	wed	\N	\N	0	\N	\N	0	\N	\N	0	2024-09-23 13:10:08	2024-09-23 13:10:08
399	66	thu	\N	\N	0	\N	\N	0	\N	\N	0	2024-09-23 13:10:08	2024-09-23 13:10:08
400	66	fri	\N	\N	0	\N	\N	0	\N	\N	0	2024-09-23 13:10:08	2024-09-23 13:10:08
401	66	sat	00:09:00	11:02:00	500	23:10:00	15:05:00	500	15:10:00	23:22:00	500	2024-09-23 13:10:08	2024-09-23 13:10:08
514	77	sun	02:00:00	10:00:00	150	11:00:00	15:00:00	200	15:00:00	20:00:00	250	2024-11-08 05:49:41	2024-11-08 05:49:41
515	77	mon	\N	\N	0	\N	\N	0	\N	\N	0	2024-11-08 05:49:41	2024-11-08 05:49:41
516	77	tue	\N	\N	0	\N	\N	0	\N	\N	0	2024-11-08 05:49:41	2024-11-08 05:49:41
517	77	wed	\N	\N	0	\N	\N	0	\N	\N	0	2024-11-08 05:49:41	2024-11-08 05:49:41
518	77	thu	\N	\N	0	\N	\N	0	\N	\N	0	2024-11-08 05:49:41	2024-11-08 05:49:41
519	77	fri	\N	\N	0	\N	\N	0	\N	\N	0	2024-11-08 05:49:41	2024-11-08 05:49:41
520	77	sat	\N	\N	0	\N	\N	0	\N	\N	0	2024-11-08 05:49:41	2024-11-08 05:49:41
444	72	mon	08:00:00	12:00:00	50	12:00:00	15:00:00	100	15:00:00	20:00:00	150	2024-10-22 08:19:07	2024-10-22 08:19:07
446	72	wed	08:00:00	12:00:00	100	12:00:00	15:00:00	150	15:00:00	20:00:00	200	2024-10-22 08:21:28	2024-10-22 08:21:28
448	72	thu	08:00:00	12:00:00	100	12:00:00	15:00:00	150	15:00:00	20:00:00	200	2024-10-22 08:23:01	2024-10-22 08:23:01
450	72	sat	08:00:00	12:00:00	100	12:00:00	15:00:00	150	15:00:00	20:00:00	200	2024-10-22 08:24:10	2024-10-22 08:24:10
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
43	21	6698b16659db5_1721282918.png	2024-07-18 10:08:38	2024-07-18 10:08:38
44	21	6698b1665d138_1721282918.png	2024-07-18 10:08:38	2024-07-18 10:08:38
45	22	6699153401cf5_1721308468.webp	2024-07-18 17:14:28	2024-07-18 17:14:28
47	23	66a02a3a6ad54_1721772602.jpg	2024-07-24 02:10:02	2024-07-24 02:10:02
48	24	66a0a01bccb54_1721802779.jpg	2024-07-24 10:32:59	2024-07-24 10:32:59
53	27	66a73a93bf578_1722235539.jpg	2024-07-29 10:45:39	2024-07-29 10:45:39
54	27	66a73a93c0b75_1722235539.jpg	2024-07-29 10:45:39	2024-07-29 10:45:39
55	27	66a73a93c1061_1722235539.jpg	2024-07-29 10:45:39	2024-07-29 10:45:39
59	31	66b70bb30a7ed_1723272115.jpg	2024-08-10 10:41:55	2024-08-10 10:41:55
60	31	66b70bb30d3aa_1723272115.jpg	2024-08-10 10:41:55	2024-08-10 10:41:55
66	34	66bda39001761_1723704208.jpg	2024-08-15 10:43:28	2024-08-15 10:43:28
68	34	66bdb40fb0887_1723708431.jpg	2024-08-15 11:53:51	2024-08-15 11:53:51
69	33	66bdc217901fc_1723712023.jpg	2024-08-15 12:53:43	2024-08-15 12:53:43
70	32	66bdc29a41e6e_1723712154.jpg	2024-08-15 12:55:54	2024-08-15 12:55:54
71	30	66bdc2f156ef1_1723712241.jpg	2024-08-15 12:57:21	2024-08-15 12:57:21
72	28	66bdc59a13bd9_1723712922.jpg	2024-08-15 13:08:42	2024-08-15 13:08:42
73	26	66bdc62eccc4d_1723713070.jpg	2024-08-15 13:11:10	2024-08-15 13:11:10
74	25	66bdca7fbabb5_1723714175.jpeg	2024-08-15 13:29:35	2024-08-15 13:29:35
75	35	66be006d23c98_1723727981.jpg	2024-08-15 17:19:41	2024-08-15 17:19:41
76	35	66be006d2424d_1723727981.jpg	2024-08-15 17:19:41	2024-08-15 17:19:41
78	36	66c197770159f_1723963255.jpg	2024-08-18 10:40:55	2024-08-18 10:40:55
79	37	66c44caa4e41b_1724140714.jpg	2024-08-20 11:58:34	2024-08-20 11:58:34
80	38	66c45a333ef8c_1724144179.jpg	2024-08-20 12:56:19	2024-08-20 12:56:19
81	39	66c48c88d54f5_1724157064.jpg	2024-08-20 16:31:04	2024-08-20 16:31:04
82	39	66c48c88d5a6e_1724157064.jpg	2024-08-20 16:31:04	2024-08-20 16:31:04
83	39	66c48c88d6072_1724157064.jpg	2024-08-20 16:31:04	2024-08-20 16:31:04
84	40	66c4b9f7ee406_1724168695.jpg	2024-08-20 19:44:55	2024-08-20 19:44:55
85	41	66c4be11b06e9_1724169745.jpg	2024-08-20 20:02:25	2024-08-20 20:02:25
86	42	66c500a58a7cb_1724186789.jpg	2024-08-21 00:46:29	2024-08-21 00:46:29
87	43	66c5fa93bf05d_1724250771.jpg	2024-08-21 18:32:51	2024-08-21 18:32:51
88	44	66c719f15ef04_1724324337.jpg	2024-08-22 14:58:57	2024-08-22 14:58:57
89	45	66c71c08b3447_1724324872.jpg	2024-08-22 15:07:52	2024-08-22 15:07:52
90	46	66c77b9d30ef1_1724349341.jpg	2024-08-22 21:55:41	2024-08-22 21:55:41
92	48	66c7f8a7b6ad8_1724381351.jpg	2024-08-23 06:49:11	2024-08-23 06:49:11
93	48	66c7f8a7b7133_1724381351.jpg	2024-08-23 06:49:11	2024-08-23 06:49:11
94	48	66c7f8a7b765d_1724381351.jpg	2024-08-23 06:49:11	2024-08-23 06:49:11
95	49	66cc35fd3345a_1724659197.jpg	2024-08-26 11:59:57	2024-08-26 11:59:57
96	50	66cc3666f293a_1724659302.jpg	2024-08-26 12:01:42	2024-08-26 12:01:42
97	29	66cc449260c4a_1724662930.jpeg	2024-08-26 13:02:10	2024-08-26 13:02:10
98	51	66cc78b741117_1724676279.jpg	2024-08-26 16:44:39	2024-08-26 16:44:39
99	47	66d584eef1708_1725269230.jpg	2024-09-02 13:27:11	2024-09-02 13:27:11
100	52	66d5bde002b27_1725283808.jpg	2024-09-02 17:30:08	2024-09-02 17:30:08
101	53	66d664371a92a_1725326391.jpg	2024-09-03 05:19:51	2024-09-03 05:19:51
102	54	66d6b06554311_1725345893.jpg	2024-09-03 10:44:53	2024-09-03 10:44:53
103	55	66d6b348551e4_1725346632.jpg	2024-09-03 10:57:12	2024-09-03 10:57:12
104	56	66d6b4eac80e0_1725347050.jpg	2024-09-03 11:04:10	2024-09-03 11:04:10
105	57	66d6c88b25373_1725352075.jpg	2024-09-03 12:27:55	2024-09-03 12:27:55
106	58	66d6d3eb3e694_1725354987.jpg	2024-09-03 13:16:27	2024-09-03 13:16:27
107	59	66d6d71691d31_1725355798.jpg	2024-09-03 13:29:58	2024-09-03 13:29:58
108	60	66d6fe6659cd4_1725365862.jpg	2024-09-03 16:17:42	2024-09-03 16:17:42
109	61	66d7f93976870_1725430073.jpg	2024-09-04 10:07:53	2024-09-04 10:07:53
110	62	66e1a3beb4875_1726063550.jpg	2024-09-11 18:05:50	2024-09-11 18:05:50
111	62	66e1a3beb4e64_1726063550.jpg	2024-09-11 18:05:50	2024-09-11 18:05:50
112	62	66e1a3beb5367_1726063550.jpg	2024-09-11 18:05:50	2024-09-11 18:05:50
113	63	66e1a3c026b36_1726063552.jpg	2024-09-11 18:05:52	2024-09-11 18:05:52
114	63	66e1a3c027446_1726063552.jpg	2024-09-11 18:05:52	2024-09-11 18:05:52
115	63	66e1a3c027c7d_1726063552.jpg	2024-09-11 18:05:52	2024-09-11 18:05:52
116	64	66e801c8e0764_1726480840.jpg	2024-09-16 14:00:40	2024-09-16 14:00:40
117	64	66e801c8e0d54_1726480840.jpg	2024-09-16 14:00:40	2024-09-16 14:00:40
118	65	66f1384edd339_1727084622.jpg	2024-09-23 13:43:42	2024-09-23 13:43:42
119	65	66f1384ee3add_1727084622.jpg	2024-09-23 13:43:42	2024-09-23 13:43:42
120	65	66f1384ee4056_1727084622.jpg	2024-09-23 13:43:42	2024-09-23 13:43:42
121	66	66f15e49a5bc2_1727094345.jpg	2024-09-23 16:25:45	2024-09-23 16:25:45
122	66	66f15e49a61ba_1727094345.jpg	2024-09-23 16:25:45	2024-09-23 16:25:45
123	66	66f15e49a66ac_1727094345.jpg	2024-09-23 16:25:45	2024-09-23 16:25:45
124	66	66f26056116ed_1727160406.jpg	2024-09-24 10:46:46	2024-09-24 10:46:46
125	67	66fbbe5e7031f_1727774302.jpg	2024-10-01 13:18:22	2024-10-01 13:18:22
126	67	66fbbe5e7494d_1727774302.jpg	2024-10-01 13:18:22	2024-10-01 13:18:22
127	68	66fbbe5feec26_1727774303.jpg	2024-10-01 13:18:23	2024-10-01 13:18:23
128	68	66fbbe5ff12a2_1727774303.jpg	2024-10-01 13:18:23	2024-10-01 13:18:23
129	69	66fbc99e120a8_1727777182.jpg	2024-10-01 14:06:22	2024-10-01 14:06:22
132	71	67053975592d5_1728395637.jpg	2024-10-08 17:53:57	2024-10-08 17:53:57
134	72	6717267941551_1729570425.jpg	2024-10-22 08:13:45	2024-10-22 08:13:45
135	73	671a09015278d_1729759489.jpg	2024-10-24 12:44:49	2024-10-24 12:44:49
136	74	672b533f695ff_1730892607.jpg	2024-11-06 15:30:07	2024-11-06 15:30:07
137	75	672b592e05a83_1730894126.jpg	2024-11-06 15:55:26	2024-11-06 15:55:26
138	75	672b592e0602b_1730894126.jpg	2024-11-06 15:55:26	2024-11-06 15:55:26
139	76	672c51d2995c7_1730957778.jpg	2024-11-07 09:36:18	2024-11-07 09:36:18
141	77	672dace474806_1731046628.jpg	2024-11-08 10:17:08	2024-11-08 10:17:08
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
24	33	ovr_nd	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	2024-08-13 11:57:32	2024-08-13 11:57:34
23	33	ovr_sd_nd	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-08-13 11:57:17	2024-08-13 11:57:46
25	35	s_day	2024-08-20	9:00 AM	12:00 PM	350.00	12:00 PM	3:00 PM	500.00	3:00 PM	6:00 PM	550.00	0	2024-08-20 10:31:26	2024-08-20 10:31:26
26	35	t_day	2024-08-20	9:00 AM	12:00 PM	800.00	12:00 PM	3:00 PM	1500.00	3:00 PM	6:00 PM	2500.00	0	2024-08-20 10:32:19	2024-08-20 10:32:19
27	38	t_day	2024-08-20	8:00 AM	12:00 PM	1000.00	12:00 PM	3:00 PM	2500.00	3:00 PM	8:00 PM	5000.00	0	2024-08-20 13:11:18	2024-08-20 13:11:18
28	39	t_day	2024-08-21	9:00 AM	12:00 PM	150.00	12:00 PM	5:00 PM	300.00	5:00 PM	10:00 PM	500.00	0	2024-08-21 15:42:24	2024-08-21 15:44:17
\.


--
-- Data for Name: yatches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.yatches (id, user_id, name, capacity, size, rules, created_at, updated_at, location, latitude, longitude, type, document, captain_name, captain_dial_code, captain_phone, deleted_at, active, size_m2, size_ft2, year_refit, is_today_overrided, is_special_day_overrided, is_sunday_available, is_monday_available, is_tuesday_available, is_wednesday_available, is_thursday_available, is_friday_available, is_saturday_available, show_in_special_yatches, avg_rating, rated_count) FROM stdin;
3	1	Test	100	50	dsdsd	2024-04-09 06:40:42	2024-04-09 06:40:42	Dubai	234235	 34365645	2	\N	Farhan	971	555555555555	\N	1	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0
36	68	Gulf Stream	5	0	<p><span style="color: #272c32; font-family: RomainText, Georgia, 'Times New Roman', serif;"><span style="font-size: 16px;">Gulf Stream is one of the newest breed of 29 meter Jongerts, designed by Tony Castro and built in 2005. She is known for her excellent build quality, modern comforts of a well-heeled yacht, and her exceptional sailing performance.&nbsp;</span></span></p>\r\n<p>&nbsp;</p>	2024-08-15 20:26:44	2024-08-26 08:29:22	G486+865, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	33.515936095414965	73.11073347834851	3	66be2c445a29d_1723739204.jpg	zain	358	845454545544	\N	1	5	5	2024	0	1	1	1	1	1	1	1	1	1	0	0
2	4	Yatch 1	50	50	<p>sdssss dfsgdgdfg dsgsdgdfgf dgfdg</p>	2024-04-09 05:30:45	2024-08-21 15:05:22	Dubai	234235	 34365645	2	66363474dd506_1714828404.pdf	Maryam	93	5555555555	\N	0	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0
6	17	Elite Diamond Austin A-50 Yacht	100	100	<p><span style="white-space-collapse: preserve;">Welcome to Elite Rentals, where luxury meets unparalleled elegance in yacht rentals. We invite you to embark on a truly extraordinary experience aboard our exclusive category A - Diamond Yachts. Our commitment to excellence sets us apart from other yacht rental companies in Dubai, as we offer only the most prestigious yachts that cannot be compared in any way.<br /></span></p>	2024-05-14 12:02:13	2024-08-21 15:49:04	Fairlie Place Park of KMDA, 36, Strand Rd, Fairley Place, B.B.D. Bagh, Kolkata, West Bengal 700001, India	22.574869012065648	88.3452920202128	4	\N	NB Captain	91	9832831812	\N	0	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0
25	54	Contessa	35	0	<p><span style="color: #000000; font-family: Montserrat, sans-serif; font-size: medium;">Enjoy a pleasant evening with your loved ones at the spacious al fresco dining and entertaining area on the main aft deck, replete with plenty of built-in seating. Have afternoon tea in the main deck lounge, with large array of cozy sofas for everyone to sit on and share their favorite moments of the day so far. Her vast main salon, furnished with comfortable, elegant seating is perfectly matched to enjoy a gastronomic extravaganza before retiring to one of her three well-appointed cabins.</span></p>	2024-07-24 12:27:48	2024-09-02 13:22:38	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	32.2307985	74.4862595	3	66a0bb04a4247_1721809668.PDF	Captain Hamid	358	3441562554	\N	1	1800	2000	1974	0	0	0	0	0	0	0	0	0	0	0	0
22	50	asf	4	0	gg	2024-07-18 17:14:27	2024-08-21 15:09:47	9FHC+J8P, Muzaffarabad,	34.3795778	73.4697652	5	66991533e1fca_1721308467.pdf	no	971	34415880565	\N	0	100	25	2029	0	0	0	0	0	0	0	0	0	0	0	0
13	45	Yest Dubain Yacht	35	0	Test Rules	2024-06-04 03:27:59	2024-08-21 15:56:29	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	33.5164401	73.110848	4	\N	Test Captain Name	971	3690852147	\N	0	75	115	2023	0	0	0	0	0	0	0	0	0	0	0	0
21	45	Yacht Testing	20	0	test rules	2024-07-18 10:08:38	2024-08-21 15:56:38	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	33.5668255	73.136814	3	6698b1664c10c_1721282918.pdf	test captain	971	12369084534	\N	0	8	21	2025	0	0	0	0	0	0	0	0	0	0	0	0
8	14	Luxury Yacht	40	0	Testing etc etc	2024-06-03 01:48:26	2024-08-21 15:49:28	462Q+26 Dubai - United Arab Emirates	25.1000998	55.2380812	1	665db1a096457_1717416352.pdf	Abdul Captain	92	6541235	\N	0	10	15	2022	0	0	0	0	0	0	0	0	0	0	0	0
14	45	Test Dubai Luxury Yacht	45	0	Test Rulea	2024-06-04 12:10:29	2024-08-21 15:56:50	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	33.5668242	73.1368171	5	665ecbf5692cc_1717488629.pdf	Captain Name Test	971	36990852147	\N	0	85	125	2026	0	0	0	0	0	0	0	0	0	0	0	0
9	14	Luxury Yacht	20	0	Testing etc etc	2024-06-03 16:00:24	2024-08-21 15:49:25	462Q+26 Dubai - United Arab Emirates	25.1000998	55.2380812	1	\N	Abdul Wahab	92	6541235	\N	0	10	15	2022	0	0	0	0	0	0	0	0	0	0	0	0
18	8	Sea breez	20	0	not appear, check that you don't already have the same app installed from the AppStore.  If an app with the same bundle identifier is already installed on the device from the AppStore, nothing will happen.	2024-06-07 09:22:57	2024-08-21 17:12:00	7HVH2746+39	25.184152905955827	55.26022762276609	3	\N	Anil.	971	546468464	\N	0	23	20	2011	1	1	0	0	0	0	0	0	0	0	0	0
20	45	moin	10	0	Abc	2024-06-07 21:38:51	2024-08-21 15:56:05	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	33.51611924914763	73.11084569979172	4	666345ab0aeb7_1717781931.pdf	abc	93	248454544545	\N	0	50	50	2024	0	0	0	0	0	0	0	0	0	0	0	0
19	45	test	10	0	This is test ipa	2024-06-07 20:40:49	2024-08-21 15:56:07	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	33.51611924914763	73.11084569979172	2	6663381157b65_1717778449.pdf	cap	93	815454545	\N	0	10	10	2024	0	0	0	0	0	0	0	0	0	0	0	0
17	45	test2	10	0	ba	2024-06-07 02:16:38	2024-08-21 15:56:09	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	33.51611929195096	73.11084570162603	2	\N	moin	93	54545464	\N	0	10	15	2027	0	0	0	0	0	0	0	0	0	0	0	0
16	45	test	10	0	test	2024-06-07 02:12:04	2024-08-21 15:56:12	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	33.51611929195096	73.11084570162603	2	\N	abc	93	23845431	\N	0	5	5	2024	0	0	0	0	0	0	0	0	0	0	0	0
10	14	Luxury Yacht	20	0	Testing etc etc	2024-06-03 16:02:10	2024-08-21 15:49:21	462Q+26 Dubai - United Arab Emirates	25.1000998	55.2380812	1	665db0c2431f0_1717416130.pdf	Abdul Wahab	92	6541235	\N	0	10	15	2022	0	0	0	0	0	0	0	0	0	0	0	0
23	8	test	25	0	test	2024-07-22 23:58:15	2024-08-21 15:04:36	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	33.516040908466294	73.11076894307215	2	\N	ali	92	484848484848	\N	0	25	25	2010	0	0	1	0	1	1	0	0	0	0	0	0
15	45	Test Dubai Luxury Yacht Two E	60	0	Test Rules Test E	2024-06-04 22:03:32	2024-08-21 15:56:21	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	33.5164107	73.1108277	3	665f5c53d892d_1717525587.pdf	Yest Captain Name E	971	3669258122	\N	0	100	155	2026	0	0	0	0	0	0	0	0	0	0	0	0
50	102	hhj	2	0	The first time the team had played a match was when you	2024-08-26 12:01:42	2024-08-26 12:01:49	7HX7JH26+96	25.184176613664963	55.26025619749754	3	66cc3666ed80b_1724659302.pdf	Ghjjk	971	54334864846	2024-08-26 12:01:49	0	22	5	2012	0	0	0	0	0	0	0	0	0	0	0	0
12	14	Luxury Yacht	20	0	Testing etc etc	2024-06-04 01:53:47	2024-08-21 15:49:20	462Q+26 Dubai - United Arab Emirates	25.1000998	55.2380812	1	665e3b6b3eea1_1717451627.pdf	Abdul Wahab	92	6541235	\N	0	10	15	2022	0	0	0	0	0	0	0	0	0	0	0	0
35	76	Notica Dubai	5	0	<p>At least once in your life, you must charter a yacht out into the ocean and experience the magic of open waters. You can rent yachts for corporate events, private events, or even for destination getaways. When you get some free time from your busy schedule in the UAE, you can voyage on a yacht to spend your holiday in style. It is however imperative to understand that yachts present an entirely different social environment than city life. Therefore, as a gentleman, it is essential to follow a certain etiquette onboard a yacht, and many of the people are not aware of these simple rules.</p>\r\n<p>Home away from home<br />It can be a daunting feeling to get onboard a yacht for the first time, and you may be very out of place. You must try to relax as much as possible and enjoy the great time planned for you. The crew and your friends want you to be as comfortable as possible, so they can have a memorable trip on high seas. You can help by being yourself and treating the yacht just like your own home, only that it is way better.</p>\r\n<p>Give respect where it is due<br />The captain and crew on board a yacht are qualified and skilled at what they do. You must treat them like highly valued employees as they have a hectic job taking care of your company. Give them the respect they deserve because they work hard at keeping everything tidy, making sure the yacht is in working order and taking care of your every requirement.</p>\r\n<p>Keep the yacht clean<br />When you are on the water, you must be especially careful of throwing waste off the deck. Even on the yacht, make sure that the crew is aware of any unfortunate incidents as they can help in cleaning up. Let the crew work on keeping the yacht in top shape and do not interfere with their business.</p>\r\n<p>Bring suitable luggage<br />Most yachts are not known to have a significant amount of storage space. So, before you think of bringing along your hard-sided suitcase, understand that it might not be appropriate. You can help by bringing with you soft luggage which will be easy to store and also accessible at all times.</p>\r\n<p>Pay attention to safety briefings<br />The captain and the crew have the prime responsibility of keeping you safe and making sure you have a pleasant trip. They take it very seriously, and you must pay attention to every word that is spoken during the safety briefings as it might mean the difference between life and death. The crew will explain about lifejackets and life rafts as it is a requirement of insurance and maritime laws.</p>\r\n<p>Be within legal limits<br />You will most probably have a party on board the yacht, and people might get foggy ideas about breaking the law. These are murky waters, and the tolerance level for illegal activities aboard a yacht is zero. The penalty for this can begin with the seizing the yacht, losing the license and jail time for those involved. A gentleman does not look good in a fluorescent orange prison jumpsuit.</p>	2024-08-15 17:19:41	2024-10-10 10:16:12	3106 Marasi Dr - Business Bay - Dubai - United Arab Emirates	25.18370681436933	55.26034636442469	3	66c46196a5f0c_1724146070.pdf	Cook	358	564005096	\N	0	200	120	1975	1	1	1	1	1	1	1	1	1	0	0	0
26	56	Sea breez	200	0	<p><span style="color: #000000; font-family: Montserrat, sans-serif; font-size: medium;">Enjoy a pleasant evening with your loved ones at the spacious al fresco dining and entertaining area on the main aft deck, replete with plenty of built-in seating. Have afternoon tea in the main deck lounge, with large array of cozy sofas for everyone to sit on and share their favorite moments of the day so far. Her vast main salon, furnished with comfortable, elegant seating is perfectly matched to enjoy a gastronomic extravaganza before retiring to one of her three well-appointed cabins.</span></p>	2024-07-24 16:12:52	2024-08-15 13:11:10	7HRJJ3HP+QG	25.184165118554457	55.260263319264205	2	66a0efc4ab1c3_1721823172.jpg	Navid	358	54640464843	\N	1	25	25	2011	0	0	0	0	0	0	0	0	0	0	0	0
30	63	Sunreef	10	0	<p><span style="color: #000000; font-family: Montserrat, sans-serif; font-size: medium;">Enjoy a pleasant evening with your loved ones at the spacious al fresco dining and entertaining area on the main aft deck, replete with plenty of built-in seating. Have afternoon tea in the main deck lounge, with large array of cozy sofas for everyone to sit on and share their favorite moments of the day so far. Her vast main salon, furnished with comfortable, elegant seating is perfectly matched to enjoy a gastronomic extravaganza before retiring to one of her three well-appointed cabins.</span></p>	2024-08-08 11:25:42	2024-08-21 15:06:37	Dubai International Airport (DXB) - Dubai - United Arab Emirates	25.2566932	55.36431779999999	3	66b472f6c2c1c_1723101942.pdf	Josif	358	3445699226	\N	0	10	24	1974	1	0	0	1	0	0	0	0	0	1	0	0
27	8	Blue bell	100	0	The only way I could do that was if you wanted YYYY YYYYvshsaj	2024-07-29 10:45:39	2024-07-29 10:45:39	7HX85FFX+J5	25.18416520448264	55.26026343742039	3	66a73a93b7457_1722235539.pdf	Navis	971	84684094	\N	1	20	25	2012	0	0	0	0	0	0	0	0	0	0	0	0
34	75	Azimut	25	0	<p><span style="color: #000000; font-family: Montserrat, sans-serif; font-size: medium;">This luxury sailing vessel is a hallmark of breathtaking beauty and superior craftsmanship. Impressive from the inside out, Lady Maia features an excellent open deck and entertainment area to let you take in the magnificent landmarks of Dubai. With lots of seating areas and a variety of al fresco dining possibilities, you could spend each day in a different area.</span></p>	2024-08-14 15:08:30	2024-08-15 12:52:25	J3M5+R66, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	33.6346635	73.0578205	2	66bc902ec0d4d_1723633710.pdf	Usama	358	331586468	\N	1	250	250	1979	0	0	0	0	0	0	0	0	0	0	0	0
31	68	NavisCruiz	20	0	Our fleet consists of yachts that we own, manage, or rent on behalf of discerning owners. Each yacht is selected with extreme caution and is subject to regular, thorough inspections to ensure it meets our high standards in terms of quality, maintenance, safety, and service.	2024-08-10 10:41:54	2024-08-21 12:23:40	79PF+XG Dubai - United Arab Emirates	25.287109378873552	55.371278398516324	3	66b70bb2ef2e6_1723272114.jpg	Captain.Cook	971	218618648	\N	1	25	25	2011	1	0	0	0	0	1	1	1	1	0	0	0
32	63	INSPIRATION	6	0	<p>A member of the highly successful Benetti Fast 125 series, the 125-foot (38.10m) motor yacht INSPIRATION moves through the water at a clip. Incorporating all the latest and most desirable design memes, INSPIRATION provides an exceptional level of performance, is beautifully designed &ndash; both inside and out &ndash; and offers a high level of safety while at sea. Her abundant features make her ideal for private or charter use. The yachts in her series were awarded Robb Report China&rsquo;s Best of the Best design award for yachts between 100 and 180 feet.</p>	2024-08-12 14:24:56	2024-08-21 15:46:37	9FGG+WQ, Muzaffarabad,	34.3790379	73.4767363	3	66b9e2f8176e2_1723458296.pdf	John	358	3441560319	\N	0	10	25	1974	0	0	1	0	0	0	0	0	1	0	0	0
28	59	Sunreef	20	0	<p><span style="color: #000000; font-family: Montserrat, sans-serif; font-size: medium;">Enjoy a pleasant evening with your loved ones at the spacious al fresco dining and entertaining area on the main aft deck, replete with plenty of built-in seating. Have afternoon tea in the main deck lounge, with large array of cozy sofas for everyone to sit on and share their favorite moments of the day so far. Her vast main salon, furnished with comfortable, elegant seating is perfectly matched to enjoy a gastronomic extravaganza before retiring to one of her three well-appointed cabins.</span></p>	2024-08-06 10:22:16	2024-08-21 15:14:48	462Q+26 Dubai - United Arab Emirates	25.1000998	55.2380812	2	66b1c11814674_1722925336.pdf	Abdul Wahab	358	6541235	\N	1	10	15	2000	0	0	1	1	1	1	1	1	1	1	0	0
33	69	Palmer Dubai	25	0	<p><span style="color: #000000; font-family: Montserrat, sans-serif; font-size: medium;">This luxury sailing vessel is a hallmark of breathtaking beauty and superior craftsmanship. Impressive from the inside out, Lady Maia features an excellent open deck and entertainment area to let you take in the magnificent landmarks of Dubai. With lots of seating areas and a variety of al fresco dining possibilities, you could spend each day in a different area.</span></p>	2024-08-13 09:36:07	2024-08-15 12:53:43	JX4X+44W, Street 13, Friends Colony, Rawalpindi, Punjab 46000, Pakistan	33.60514841322206	72.99784103298799	2	66baf0c7b4063_1723527367.jpg	zain	358	946464646464	\N	1	50	50	2010	0	0	1	1	1	1	1	0	0	0	0	0
24	54	Hamid	25	0	No Rules	2024-07-24 10:32:59	2024-09-02 13:22:35	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	32.2307875	74.4860867	2	66a0a01bc5d4a_1721802779.PDF	Captain Hamid	92	3441562554	\N	0	6000	2500	1974	0	0	0	0	0	0	0	0	0	0	0	0
29	60	First Yacht	50	0	<p>no rules</p>	2024-08-06 21:24:34	2024-10-01 14:05:00	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	32.2307951	74.4859915	3	66b25c52acc7c_1722965074.pdf	Hamid As Captain	358	3441562554	2024-10-01 14:05:00	0	1000	3500	2005	0	0	1	1	1	1	1	1	1	0	0	0
49	102	Raheem Yacht Master	20	0	The UAE yacht code were submitted to the IMO and to all IMO members in 2009. Tasneef took the initiative to update the code, establish the interpretations, check lists as well as the operating system. On this basis, the UAE introduced the code to the UAE market as well as the international market in 2014 as the first of its kind globally.\nTasneef as the technical arm of the Federal Transport Authority, carries out UAE Yacht Code surveys and certification on its behalf. Tasneef has been involved in all stages of development, interpretation, implementation of the code and increasing the awareness in the local and global yachting industry. Tasneef’s involvement in the development of the UAE Yacht Code has also contributed to improving the yachting standards in the region.	2024-08-26 11:59:57	2024-08-26 12:04:41	39 5b St - Umm Suqeim - Umm Suqeim 1 - Dubai - United Arab Emirates	25.16866030441372	55.21350961178541	3	66cc3693596a5_1724659347.pdf	Captain Marwan	971	5434846046	\N	1	8	500	2011	0	0	1	1	1	1	1	1	1	0	0	0
73	207	Arabian Ranches	100	0	The UAE yacht code were submitted to the IMO and to all IMO members in 2009. Tasneef took the initiative to update the code, establish the interpretations, check lists as well as the operating system. On this basis, the UAE introduced the code to the UAE market as well as the international market in 2014 as the first of its kind globally.\nTasneef as the technical arm of the Federal Transport Authority, carries out UAE Yacht Code surveys and certification on its behalf. Tasneef has been involved in all stages of development, interpretation, implementation of the code and increasing the awareness in the local and global yachting industry. Tasneef’s involvement in the development of the UAE Yacht Code has also contributed to improving the yachting standards in the region.	2024-10-24 12:44:49	2024-10-24 14:22:58	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.184127807881275	55.260292470600234	2	671a09014406b_1729759489.jpg	Captain Tomskn	971	5464864664	\N	1	150	200	2011	0	0	1	1	1	1	1	1	1	0	0	0
42	91	Gulf Stream	3	0	The only way I could do that was if you wanted me too I could come and pick it out and then I can go pick up it from your place or you could just pick me out of there or you could pick me out and I could just go pick up my truck or yyyyyyyy you know I don’t care what time I can come pick you out or you could go to work or you could do it and then you could go get your car	2024-08-21 00:46:29	2024-08-21 18:55:55	97 Al Zahra St - Al Sufouh - Dubai Knowledge Park - Dubai - United Arab Emirates	25.081078	55.13397500000001	6	66c500a5870e3_1724186789.jpg	Catain. Cook	971	5465486484	\N	1	200	200	2012	0	0	1	1	1	1	1	1	1	0	0	0
4	8	My Serenity	12	21m (70ft)	<p style="outline: 0px; box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 20px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 15px; line-height: inherit; font-family: Montserrat, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: #000000;">The 2017 Sunseeker 70ft yacht is a luxurious motor yacht, offering ample space and comfort for owners and guests. The yacht is approximately 70 feet in length and boasts a distinctive and modern exterior design, as well as a luxurious and functional interior.</p>\r\n<p style="outline: 0px; box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 20px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 15px; line-height: inherit; font-family: Montserrat, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: #000000;">The full-beam master suite is located at the aft of the yacht and includes a large bed, ample storage space, and an en-suite bathroom. VIP staterooms and additional guest cabins also have en-suite bathrooms, ensuring comfort for all guests. The yacht's exterior deck spaces are perfect for both relaxation and entertainment, with a large aft flybridge, a forward sunpad and lounge area, and dining and seating areas.</p>\r\n<p style="outline: 0px; box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 20px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 15px; line-height: inherit; font-family: Montserrat, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: #000000;">The yacht's fully equipped galley features modern appliances and ample counter space, making meal preparation a breeze. With air conditioning throughout and aaccess to tender, water toys, and audio and visual systems. It is powered by twin diesel engines, providing smooth and efficient performance, and has state-of-the-art navigation and safety systems for peace of mind while out at sea.</p>\r\n<p style="outline: 0px; box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 20px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 15px; line-height: inherit; font-family: Montserrat, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: #000000;">In conclusion, the 2017 Sunseeker 70ft yacht is a standout in the world of yachting, offering spacious living spaces, luxurious features, and impressive performance. Whether you're looking for a relaxing retreat or an adventure-filled getaway, this yacht is the perfect choice.</p>	2024-05-05 19:00:58	2024-08-16 15:24:49	34 Al Mamsha St - Jumeirah Beach Residence - Dubai - United Arab Emirates	234235	 34365645	4	66379f2aa6d55_1714921258.pdf	Johnn	93	463666647	\N	1	\N	\N	\N	0	0	1	1	1	1	1	1	1	0	0	0
37	81	Blue Voyage	5	0	type of the question and I don't know if I should go with you are a good idea and not just the	2024-08-20 11:58:34	2024-08-20 12:04:54	Dubai Canal Marine Transport Station 1 - Dubai - United Arab Emirates,	25.198423405576555	55.2335125207901	2	66c44caa3daa6_1724140714.pdf	Robert	971	564005097	\N	1	200	200	1978	0	0	1	1	1	1	1	1	1	0	0	0
44	68	Test Active	10	0	hggs	2024-08-22 14:58:57	2024-08-22 14:58:57	VM42+V4, Panakyachal, Kerala 685583, India,	9.8565502	76.6510839	2	66c719f1520db_1724324337.pdf	Sooraj	971	505086045	\N	1	10	10	1982	0	0	0	0	0	0	0	0	0	0	0	0
46	76	tst	50	0	Av	2024-08-22 21:55:41	2024-08-24 12:40:00	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	33.51602741508648	73.11079157589414	2	66c77b9d2c1d4_1724349341.jpg	nn	93	5454545454	2024-08-24 12:40:00	0	80	80	2019	0	0	0	0	0	0	0	0	0	0	0	0
39	76	Blue Queen	20	0	The only way I could do that was if you wanted me too but you don’t want me too so you don’t need me too I don’t care about that yyyyyyy you know I don’t want to do it but you don’t have a problem I don’t want to be mad I don’t want you I don’t care I don’t want nobody to know what I don’t want	2024-08-20 16:31:04	2024-08-20 16:47:46	2X4R+43 Dubai - United Arab Emirates	25.18417308877024	55.260258925764326	5	66c48c88a6dc8_1724157064.pdf	Captain Mike	971	545640640646	\N	1	200	400	2014	0	0	1	1	1	1	1	1	1	0	0	0
45	68	Test Active 2	10	0	<p>gvvc</p>	2024-08-22 15:07:52	2024-08-22 15:59:57	VM42+V4, Panakyachal, Kerala 685583, India,	9.8565505	76.6510838	4	66c71c08ab04e_1724324872.pdf	Sor	358	505058604	\N	0	98	58	1979	0	0	1	1	1	1	1	1	1	0	0	0
38	81	Sty	10	0	gvvv	2024-08-20 12:56:19	2024-08-21 15:01:57	VM42+V4, Panakyachal, Kerala 685583, India,	9.8565451	76.6510839	3	66c45a333b5a9_1724144179.pdf	Sd	971	505086808	\N	0	58	58	1982	1	0	0	0	0	0	0	0	0	0	0	0
43	76	anil	20	0	Ruler	2024-08-21 18:32:51	2024-08-21 18:32:51	HC9H+5W Abu Dhabi - United Arab Emirates	24.5264943	54.3740483	3	66c5fa93ae3d0_1724250771.pdf	bb	355	58896688767	\N	1	2	2	2011	0	0	0	0	0	0	0	0	0	0	0	0
40	76	testMoin	5	0	Abc	2024-08-20 19:44:55	2024-08-26 12:30:46	6, Block N Gulberg III, Lahore, Punjab 56000, Pakistan	31.5203696	74.35874729999999	3	66c4ba71261de_1724168817.jpg	test	93	84545454545	2024-08-26 12:30:46	0	5	5	2024	0	0	0	0	0	0	0	0	0	0	0	0
48	76	Azimut 75 Viktoria for rent	20	0	The vessel is impressive in its chic size. The upper huge deck is its highlight, from here you can observe the sea beauties from above, as well as relax on soft leather sofas or sunbathe in the open air. Such a luxurious vacation is the dream of many.\n\nThe 23-meter yacht has an impeccable style and is equipped with everything necessary for a full leisure, both for a couple of hours and for a long trip.\n\nThe main salon is equipped with a U-shaped settee for large numbers of guests. There is also a dining area with a comfortable roomy table, sofas, leather armchairs, a refrigerator, a bar and a barbecue.\n\nA fully equipped galley is available for those who wish to prepare their own meals.	2024-08-23 06:49:11	2024-08-23 12:50:53	54 Amman St - Al Nahda - Al Nahda 2 - Dubai - United Arab Emirates	25.29790506346225	55.380888013578385	3	66c7f8a79ded5_1724381351.pdf	Captain Thomas Cook	971	54664846846	\N	1	600	200	2012	0	0	1	1	1	1	1	1	1	0	0	0
41	76	ab	5	0	Abc	2024-08-20 20:02:25	2024-08-24 12:40:51	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	33.51601383450322	73.11079056163263	3	66c4bf98ed7b2_1724170136.jpg	baa	93	484848484	\N	0	8	5	2024	0	0	0	0	0	0	0	0	0	0	0	0
51	76	Dhbai Yacht	23	0	<p>The first time the team had played a</p>	2024-08-26 16:44:39	2024-09-23 14:56:02	56GM+X4 Kharkushi, Hormozgan Province, Iran	25.240208294200738	55.26674576103687	3	66cc78b734a61_1724676279.pdf	captian cookk	358	546646646	\N	0	200	200	2012	0	0	1	1	1	1	0	0	0	0	0	0
77	235	First	10	0	Rules	2024-11-08 09:47:23	2024-11-15 21:49:36	4 Street 89 - Al Jazzat - Al Riqa Suburb - Sharjah - United Arab Emirates	25.36800514903298	55.43800346553326	2	672da5eb3ca39_1731044843.pdf	Ss	971	505086566	\N	1	58	655	1980	0	0	1	1	1	1	1	1	0	0	0	0
52	111	Bule burd	12	0	Heheh	2024-09-02 17:30:08	2024-09-02 17:34:10	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.18417715072961	55.260254767015894	2	66d5bddff1b04_1725283807.jpg	Thomas cook	213	5466484684	\N	1	12	12	2010	0	0	0	0	0	0	0	0	0	0	0	0
53	115	Bluebell	20	0	The first time the team had played a match was when they won a match in which the players had a goal in hand to win a penalty in a match against a club in the Champions Cup semi finals against a	2024-09-03 05:19:51	2024-09-03 06:59:24	building 4 SS Lootah - النهدة - النهدة ٢ - دبي - United Arab Emirates	25.28695139431089	55.371236205072634	2	66d664370cec8_1725326391.jpg	captain micheal	358	556586866	\N	1	20	20	2011	0	0	0	0	0	0	0	0	0	0	0	0
54	116	new yacht	50	0	Abc	2024-09-03 10:44:53	2024-09-03 10:46:23	JX4X+542, Street 13, Friends Colony, Rawalpindi, Punjab 46000, Pakistan	33.60515284677413	72.99784109019869	3	66d6b06547577_1725345893.jpg	ab	358	45454545454	\N	1	80	80	2024	0	0	0	0	0	0	0	0	0	0	0	0
55	117	ha	50	0	Ha	2024-09-03 10:57:12	2024-09-03 10:58:00	JX4X+542, Street 13, Friends Colony, Rawalpindi, Punjab 46000, Pakistan	33.605157225668485	72.99782976396702	2	66d6b34846b6b_1725346632.jpg	b	93	4949494944	\N	1	50	50	2024	0	0	0	0	0	0	0	0	0	0	0	0
56	118	ah	50	0	Has	2024-09-03 11:04:10	2024-09-03 12:12:12	JX4X+542, Street 13, Friends Colony, Rawalpindi, Punjab 46000, Pakistan	33.60515261684216	72.99783755813907	2	66d6b4eaba758_1725347050.jpg	babasn	93	494848484	\N	1	80	50	2024	0	0	0	0	0	0	0	0	0	0	0	0
57	119	aha	50	0	Hanasn	2024-09-03 12:27:55	2024-09-03 12:29:02	JX4X+542, Street 13, Friends Colony, Rawalpindi, Punjab 46000, Pakistan	33.605152757495645	72.99784010853685	2	66d6c88b11d1b_1725352075.jpg	na	355	944664	\N	1	50	50	2024	0	0	0	0	0	0	0	0	0	0	0	0
58	120	ah	50	0	Bssns	2024-09-03 13:16:27	2024-09-03 13:20:09	JX4X+542, Street 13, Friends Colony, Rawalpindi, Punjab 46000, Pakistan	33.605152524120996	72.9978403833566	2	66d6d3eb3ad51_1725354987.jpg	zn	355	8484844848	\N	1	50	50	2024	0	0	0	0	0	0	0	0	0	0	0	0
59	121	test	50	0	Test	2024-09-03 13:29:58	2024-09-03 13:31:04	JX4X+542, Street 13, Friends Colony, Rawalpindi, Punjab 46000, Pakistan	33.60513934701813	72.99783657526031	2	66d6d716845b2_1725355798.jpg	test	358	848484	\N	1	50	50	2024	0	0	0	0	0	0	0	0	0	0	0	0
60	123	Gulf wave	50	0	The only way I could do that was if you wanted me too I could come and pick it out and then I can go pick up it from your place or you could just pick me out of there or	2024-09-03 16:17:42	2024-09-03 16:19:17	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.184177566452767	55.26025477026384	3	66d6fe664f0c1_1725365862.pdf	Thomas Martjn	971	45346046	\N	1	200	200	2012	0	0	0	0	0	0	0	0	0	0	0	0
61	124	Blue voyage	20	0	The first time the team had played a match was when they won a match in which	2024-09-04 10:07:53	2024-09-04 10:07:53	12b 14A St - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates	25.208219159212298	55.24233095347881	3	66d7f93954f3c_1725430073.pdf	Captain. cook	355	848646484	\N	0	120	120	2012	0	0	0	0	0	0	0	0	0	0	0	0
67	160	Blue whales 1	250	0	No Smoking	2024-10-01 13:18:22	2024-10-01 13:28:04	685V+GG - Ras Al Khor - Dubai Creek Harbour - Dubai - United Arab Emirates,	25.20956388650037	55.34308075904846	3	66fbbe5e521a4_1727774302.pdf	Hardeek	971	553366996	\N	1	25	25	2024	0	0	0	0	0	0	0	0	0	0	0	0
62	133	BlueWave	20	0	No Smoking	2024-09-11 18:05:50	2024-09-23 13:44:25	685V+GG - Ras Al Khor - Dubai Creek Harbour - Dubai - United Arab Emirates	25.20956388650037	55.34308075904846	4	66f1271d8ab1c_1727080221.pdf	Adheen	971	223366575	\N	1	10	10	2024	1	1	1	1	1	1	1	1	1	0	0	0
65	129	Wave Runner	50	0	No Smoking	2024-09-23 13:43:42	2024-10-01 13:28:14	685V+GG - Ras Al Khor - Dubai Creek Harbour - Dubai - United Arab Emirates,	25.20956388650037	55.34308075904846	3	66f1384e9a6a2_1727084622.pdf	SHAFI	971	553366968	\N	1	50	50	2024	0	0	1	1	1	1	0	0	0	0	0	0
66	133	Waves	25	0	No smoking	2024-09-23 16:25:45	2024-10-01 13:28:14	685V+GG - Ras Al Khor - Dubai Creek Harbour - Dubai - United Arab Emirates	25.20956388650037	55.34308075904846	4	66f15e49a2078_1727094345.pdf	sahel	971	556666885	\N	1	25	25	2024	0	0	1	0	0	0	0	0	1	0	0	0
63	76	Blueway	20	0	NO SMOKING	2024-09-11 18:05:52	2024-09-23 14:56:14	7HQRXXFV+FR	25.07959647390748	55.14108896255493	4	66f130038a9fc_1727082499.jpg	Ahsan	971	223355656	\N	0	10	10	2022	0	0	0	0	0	0	0	0	0	0	0	0
47	60	Blue Stream	25	0	These rules relate to the 1938 version of Yacht. The object of the game is to score points by rolling five dice to make certain combinations. The dice can be rolled up to three times in a turn to try to make these combinations. A game consists of twelve rounds. After each round the player chooses which scoring category is to be used for that round. Once a category has been used in the game, it cannot be used again. The scoring categories have varying point values, some of which are fixed values and others where the score depends on the value of the dice. A Yacht is five-of-a-kind and scores 50 points; the highest of any category. The winner is the player who scores the most points.	2024-08-23 00:51:42	2024-10-19 18:30:53	41 Al Baqqarah St - Al Muzoun - Abu Dhabi - United Arab Emirates	24.410393669751585	54.42899027076416	4	\N	Jamid	92	3441594646	\N	1	3500	25600	2020	0	0	0	0	0	0	1	1	1	0	3.5	2
5	15	Voyager Elite Reef's Rhapsody 50ft Yacht	75	45 ft	<p style="-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-family: Roboto, HR, sans-serif; color: #323233; margin: 0px; font-size: 16.704px;">Premium vessel with gorgeous design for 17 people. Starting point &ndash; Dubai Marina.</p>\n<p style="-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-family: Roboto, HR, sans-serif; color: #323233; margin: 0px; font-size: 16.704px;">&nbsp;</p>\n<p style="-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-family: Roboto, HR, sans-serif; color: #323233; margin: 0px; font-size: 16.704px;">The best luxury yacht rental Dubai is providing our website. Our charter company has huge yachts and boats for rental in Dubai. The best charter deals and offers Dubai. The lower deck consists of three bedrooms, two twin bunk guest accommodations and one VIP ensuite with a King size bed. The Yacht Azimut 50 with flybridge (upper deck) for rent from Dubai Marina, near JBR, Palm Jumeirah.</p>\n<p style="-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-family: Roboto, HR, sans-serif; color: #323233; margin: 0px; font-size: 16.704px;">&nbsp;</p>\n<p style="-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-family: Roboto, HR, sans-serif; color: #323233; margin: 0px; font-size: 16.704px;">The yacht accommodates 17 persons and sleeps 6 persons in 3 cabins. You can rent it for a week or more weeks, or only for a 3-4 hours trip around Dubai famous sights and nearby Islands. The flybridge has ample seating, coupled with a large open space, ideal for parties or gatherings.</p>	2024-05-13 11:01:00	2024-08-21 17:10:40	Dubai International Airport (DXB) - Dubai - United Arab Emirates	25.2566932	55.36431779999999	4	6641baac15b6c_1715583660.pdf	Ahmed Khan	358	6874135	\N	0	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	0	0
68	161	Blue whales 2	250	0	No smoking	2024-10-01 13:18:23	2024-10-01 13:28:03	685V+GG - Ras Al Khor - Dubai Creek Harbour - Dubai - United Arab Emirates	25.20956388650037	55.34308075904846	3	66fbbe5fdf742_1727774303.pdf	Hardeep	971	549966356	\N	1	25	25	2024	0	0	0	0	0	0	0	0	0	0	0	0
71	174	Sea Hawlk	200	0	There is no standard definition, though the term generally applies to vessels with a cabin intended for overnight use. To be termed a yacht, as opposed to a boat, such a pleasure vessel is likely to be at least 33 feet (10 m) in length and may have been judged to have good aesthetic qualities	2024-10-08 17:53:57	2024-10-10 07:25:43	Ground Floor, Building A1 - Dubai Design District - دبي - United Arab Emirates	25.187667827721846	55.30200272798539	4	670539754ed9a_1728395637.jpg	Captain Gill	971	4546846466	\N	1	20	20	2013	0	0	1	1	1	1	1	1	1	0	0.75	4
74	235	Sunroof	200	0	The only way I could do that was if you wanted me too I could come and pick it out and then I can go pick up it from your place or you could	2024-11-06 15:30:07	2024-11-06 16:34:07	66CH+33 Dubai - United Arab Emirates	25.220361207623288	55.22752817720175	2	672b533f4b9fe_1730892607.pdf	Mike	971	523243163	\N	1	25	200	2010	0	1	1	1	1	1	1	1	1	0	0	0
69	159	Blie way	250	0	no smoking	2024-10-01 14:06:22	2024-10-08 16:23:07	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.184180755446878	55.260313137368534	2	66fbc99e0e42d_1727777182.pdf	Ashred	971	552211414	\N	1	25	25	2024	0	0	0	0	0	0	0	0	0	0	0	0
64	131	Bluemoon	25	0	No Smoking	2024-09-16 14:00:40	2024-09-23 13:31:33	685V+GG - Ras Al Khor - Dubai Creek Harbour - Dubai - United Arab Emirates,	25.20956388650037	55.34308075904846	4	66f12c5f96cff_1727081567.PDF	Ahras	971	858589856	\N	1	25	25	2023	0	1	1	1	1	1	1	1	1	0	0	0
72	91	Sp Yatch	10	0	<p>Rules</p>	2024-10-22 08:11:29	2024-10-22 08:24:26	673C+W8V - Dubai - United Arab Emirates,	25.204849237091366	55.27078282088041	4	671725f12dba8_1729570289.pdf	Sooraj	358	505086097	\N	1	12	58	1979	0	0	1	1	1	0	0	0	1	0	0	0
75	239	aj yacht	5	0	Good	2024-11-06 15:55:26	2024-11-06 15:58:14	7HRHVR35+GM	25.25827602305901	55.32725536909487	2	672b592e01eee_1730894126.jpg	aj@captain	971	5566800	\N	1	80	25	2014	0	0	0	0	0	0	0	0	0	0	0	0
76	220	tet	20	0	Ha	2024-11-07 09:36:18	2024-11-07 09:36:49	JX4X+542, Street 13, Friends Colony, Rawalpindi, Punjab 46000, Pakistan	33.60515370022786	72.99781632486985	2	672c51f13bb56_1730957809.jpg	be	93	616694643131	\N	0	80	50	2010	0	0	0	0	0	0	0	0	0	0	0	0
\.


--
-- Name: addon_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addon_category_id_seq', 6, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articles_id_seq', 6, true);


--
-- Name: booking_addons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_addons_id_seq', 335, true);


--
-- Name: booking_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_products_id_seq', 399, true);


--
-- Name: bookings_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_history_id_seq', 1, false);


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_id_seq', 485, true);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 6, true);


--
-- Name: category_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_texts_id_seq', 141, true);


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_seq', 242, true);


--
-- Name: coupon_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_categories_id_seq', 6, true);


--
-- Name: coupon_packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_packages_id_seq', 1, false);


--
-- Name: coupon_yatches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_yatches_id_seq', 12, true);


--
-- Name: coupons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupons_id_seq', 7, true);


--
-- Name: customer_user_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_user_details_id_seq', 134, true);


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
-- Name: faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faq_id_seq', 1, true);


--
-- Name: hear_about_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hear_about_us_id_seq', 20, true);


--
-- Name: help_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.help_id_seq', 3, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 124, true);


--
-- Name: modify_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modify_requests_id_seq', 46, true);


--
-- Name: package_media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.package_media_id_seq', 239, true);


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

SELECT pg_catalog.setval('public.package_products_id_seq', 261, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1009, true);


--
-- Name: product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_categories_id_seq', 46, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 65, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);


--
-- Name: socialdetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialdetails_id_seq', 1, true);


--
-- Name: special_day_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.special_day_rates_id_seq', 31, true);


--
-- Name: temp_booking_addons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_booking_addons_id_seq', 296, true);


--
-- Name: temp_booking_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_booking_products_id_seq', 370, true);


--
-- Name: temp_bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_bookings_id_seq', 480, true);


--
-- Name: temp_category_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_category_texts_id_seq', 159, true);


--
-- Name: temp_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_users_id_seq', 327, true);


--
-- Name: today_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.today_rates_id_seq', 24, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 244, true);


--
-- Name: vendor_addons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_addons_id_seq', 34, true);


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

SELECT pg_catalog.setval('public.vendor_package_addons_id_seq', 119, true);


--
-- Name: vendor_package_attach_include_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_package_attach_include_id_seq', 7, true);


--
-- Name: vendor_package_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_package_categories_id_seq', 305, true);


--
-- Name: vendor_package_facilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_package_facilities_id_seq', 423, true);


--
-- Name: vendor_package_includes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_package_includes_id_seq', 7, true);


--
-- Name: vendor_packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_packages_id_seq', 167, true);


--
-- Name: vendor_user_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_user_details_id_seq', 103, true);


--
-- Name: wallet_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_histories_id_seq', 271, true);


--
-- Name: wallet_payment_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_payment_report_id_seq', 40, true);


--
-- Name: wallets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallets_id_seq', 11, true);


--
-- Name: wish_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wish_lists_id_seq', 95, true);


--
-- Name: yach_time_schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yach_time_schedules_id_seq', 3551, true);


--
-- Name: yacht_attach_facilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yacht_attach_facilities_id_seq', 294, true);


--
-- Name: yacht_offers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yacht_offers_id_seq', 41, true);


--
-- Name: yacht_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yacht_orders_id_seq', 6, true);


--
-- Name: yacht_rates_schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yacht_rates_schedules_id_seq', 8, true);


--
-- Name: yacht_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yacht_types_id_seq', 8, true);


--
-- Name: yatch_normal_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yatch_normal_rates_id_seq', 520, true);


--
-- Name: yatch_photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yatch_photos_id_seq', 141, true);


--
-- Name: yatch_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yatch_rates_id_seq', 28, true);


--
-- Name: yatches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yatches_id_seq', 77, true);


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
-- Name: booking_addons booking_addons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_addons
    ADD CONSTRAINT booking_addons_pkey PRIMARY KEY (id);


--
-- Name: booking_products booking_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_products
    ADD CONSTRAINT booking_products_pkey PRIMARY KEY (id);


--
-- Name: bookings_history bookings_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings_history
    ADD CONSTRAINT bookings_history_pkey PRIMARY KEY (id);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


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
-- Name: category_texts category_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_texts
    ADD CONSTRAINT category_texts_pkey PRIMARY KEY (id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: coupon_categories coupon_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_categories
    ADD CONSTRAINT coupon_categories_pkey PRIMARY KEY (id);


--
-- Name: coupon_packages coupon_packages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_packages
    ADD CONSTRAINT coupon_packages_pkey PRIMARY KEY (id);


--
-- Name: coupon_yatches coupon_yatches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_yatches
    ADD CONSTRAINT coupon_yatches_pkey PRIMARY KEY (id);


--
-- Name: coupons coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);


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
-- Name: faq faq_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faq
    ADD CONSTRAINT faq_pkey PRIMARY KEY (id);


--
-- Name: hear_about_us hear_about_us_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hear_about_us
    ADD CONSTRAINT hear_about_us_pkey PRIMARY KEY (id);


--
-- Name: help help_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help
    ADD CONSTRAINT help_pkey PRIMARY KEY (id);


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
-- Name: modify_requests modify_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modify_requests
    ADD CONSTRAINT modify_requests_pkey PRIMARY KEY (id);


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
-- Name: socialdetails socialdetails_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialdetails
    ADD CONSTRAINT socialdetails_email_unique UNIQUE (email);


--
-- Name: socialdetails socialdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialdetails
    ADD CONSTRAINT socialdetails_pkey PRIMARY KEY (id);


--
-- Name: special_day_rates special_day_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.special_day_rates
    ADD CONSTRAINT special_day_rates_pkey PRIMARY KEY (id);


--
-- Name: temp_booking_addons temp_booking_addons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_booking_addons
    ADD CONSTRAINT temp_booking_addons_pkey PRIMARY KEY (id);


--
-- Name: temp_booking_products temp_booking_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_booking_products
    ADD CONSTRAINT temp_booking_products_pkey PRIMARY KEY (id);


--
-- Name: temp_bookings temp_bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_bookings
    ADD CONSTRAINT temp_bookings_pkey PRIMARY KEY (id);


--
-- Name: temp_category_texts temp_category_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_category_texts
    ADD CONSTRAINT temp_category_texts_pkey PRIMARY KEY (id);


--
-- Name: temp_users temp_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users
    ADD CONSTRAINT temp_users_pkey PRIMARY KEY (id);


--
-- Name: today_rates today_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.today_rates
    ADD CONSTRAINT today_rates_pkey PRIMARY KEY (id);


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
-- Name: wallet_histories wallet_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_histories
    ADD CONSTRAINT wallet_histories_pkey PRIMARY KEY (id);


--
-- Name: wallet_payment_report wallet_payment_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_payment_report
    ADD CONSTRAINT wallet_payment_report_pkey PRIMARY KEY (id);


--
-- Name: wallets wallets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id);


--
-- Name: wish_lists wish_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wish_lists
    ADD CONSTRAINT wish_lists_pkey PRIMARY KEY (id);


--
-- Name: yach_time_schedules yach_time_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yach_time_schedules
    ADD CONSTRAINT yach_time_schedules_pkey PRIMARY KEY (id);


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
-- Name: yatch_normal_rates yatch_normal_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yatch_normal_rates
    ADD CONSTRAINT yatch_normal_rates_pkey PRIMARY KEY (id);


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
-- Name: wallets wallets_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


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

