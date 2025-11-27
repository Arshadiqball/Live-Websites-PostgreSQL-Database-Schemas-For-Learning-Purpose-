--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-2.pgdg20.04+1)
-- Dumped by pg_dump version 15.13 (Ubuntu 15.13-1.pgdg20.04+1)

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
-- Name: app_banners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_banners (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    banner_image character varying(1500),
    active integer DEFAULT 1 NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.app_banners OWNER TO postgres;

--
-- Name: app_banners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_banners_id_seq OWNER TO postgres;

--
-- Name: app_banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_banners_id_seq OWNED BY public.app_banners.id;


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
-- Name: booking_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_orders (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    vendor_id bigint NOT NULL,
    booking_id bigint NOT NULL,
    reference_number character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    total_paid numeric(10,2) NOT NULL,
    tax numeric(10,2) NOT NULL,
    discount numeric(10,2) NOT NULL,
    order_id character varying(50),
    is_rescheduled integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.booking_orders OWNER TO postgres;

--
-- Name: booking_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_orders_id_seq OWNER TO postgres;

--
-- Name: booking_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_orders_id_seq OWNED BY public.booking_orders.id;


--
-- Name: booking_resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_resources (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    active smallint DEFAULT '1'::smallint NOT NULL,
    deleted smallint DEFAULT '0'::smallint NOT NULL
);


ALTER TABLE public.booking_resources OWNER TO postgres;

--
-- Name: booking_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_resources_id_seq OWNER TO postgres;

--
-- Name: booking_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_resources_id_seq OWNED BY public.booking_resources.id;


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
    active integer DEFAULT 1 NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
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
-- Name: contact_us_entries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_us_entries (
    id bigint NOT NULL,
    customer_id bigint,
    name character varying(255),
    email character varying(255),
    dial_code character varying(255),
    phone character varying(255),
    message character varying(4000),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.contact_us_entries OWNER TO postgres;

--
-- Name: contact_us_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_us_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_us_entries_id_seq OWNER TO postgres;

--
-- Name: contact_us_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_us_entries_id_seq OWNED BY public.contact_us_entries.id;


--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    id bigint NOT NULL,
    name character varying(1500) NOT NULL,
    prefix character varying(20) NOT NULL,
    dial_code character varying(100) NOT NULL,
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    deleted smallint DEFAULT '0'::smallint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
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
-- Name: customer_ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_ratings (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    vendor_id bigint NOT NULL,
    rating integer NOT NULL,
    review text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.customer_ratings OWNER TO postgres;

--
-- Name: customer_ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_ratings_id_seq OWNER TO postgres;

--
-- Name: customer_ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_ratings_id_seq OWNED BY public.customer_ratings.id;


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
    total_rating numeric(3,2) DEFAULT '0'::numeric NOT NULL,
    wallet_id character varying(13),
    remarks character varying(255),
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
-- Name: favourites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favourites (
    id bigint NOT NULL,
    vendor_id bigint,
    customer_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.favourites OWNER TO postgres;

--
-- Name: favourites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.favourites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favourites_id_seq OWNER TO postgres;

--
-- Name: favourites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favourites_id_seq OWNED BY public.favourites.id;


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
-- Name: report_reasons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_reasons (
    id bigint NOT NULL,
    reason character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.report_reasons OWNER TO postgres;

--
-- Name: report_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_reasons_id_seq OWNER TO postgres;

--
-- Name: report_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_reasons_id_seq OWNED BY public.report_reasons.id;


--
-- Name: reported_artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reported_artists (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    artist_id bigint NOT NULL,
    reason_id bigint,
    description text,
    attachment_link character varying(255),
    contact_info character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    other_reason character varying(255)
);


ALTER TABLE public.reported_artists OWNER TO postgres;

--
-- Name: reported_artists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reported_artists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reported_artists_id_seq OWNER TO postgres;

--
-- Name: reported_artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reported_artists_id_seq OWNED BY public.reported_artists.id;


--
-- Name: reported_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reported_users (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.reported_users OWNER TO postgres;

--
-- Name: reported_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reported_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reported_users_id_seq OWNER TO postgres;

--
-- Name: reported_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reported_users_id_seq OWNED BY public.reported_users.id;


--
-- Name: role_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_permissions (
    id bigint NOT NULL,
    user_role_id_fk integer NOT NULL,
    module_key character varying(255) NOT NULL,
    permissions text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.role_permissions OWNER TO postgres;

--
-- Name: role_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_permissions_id_seq OWNER TO postgres;

--
-- Name: role_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_permissions_id_seq OWNED BY public.role_permissions.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    role character varying(255) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    is_admin_role integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


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
-- Name: temp_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_transactions (
    id bigint NOT NULL,
    type character varying(50),
    p_id character varying(100),
    p_status character varying(50),
    transaction_data text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.temp_transactions OWNER TO postgres;

--
-- Name: temp_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_transactions_id_seq OWNER TO postgres;

--
-- Name: temp_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_transactions_id_seq OWNED BY public.temp_transactions.id;


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
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    vendor_id bigint,
    order_id bigint,
    transaction_id character varying(50),
    status character varying(255) NOT NULL,
    amount numeric(10,2) NOT NULL,
    type character varying(255) NOT NULL,
    payment_method character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    other_customer_id bigint,
    p_trans_id character varying(255),
    p_info character varying(255),
    p_data character varying(255)
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_id_seq OWNER TO postgres;

--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


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
    active integer DEFAULT 1 NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    role_id bigint,
    device_type character varying(255),
    fcm_token character varying(255),
    device_cart_id character varying(255),
    password_reset_code character varying(255),
    req_chng_email character varying(255),
    req_chng_phone character varying(255),
    req_chng_dial_code character varying(255),
    deleted_at timestamp(0) without time zone,
    last_login timestamp(0) without time zone,
    user_name character varying(600)
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
-- Name: users_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_role (
    id bigint NOT NULL,
    role_name character varying(200) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users_role OWNER TO postgres;

--
-- Name: users_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_role_id_seq OWNER TO postgres;

--
-- Name: users_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_role_id_seq OWNED BY public.users_role.id;


--
-- Name: vendor_booking_dates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_booking_dates (
    id bigint NOT NULL,
    booking_id bigint NOT NULL,
    date date,
    start_time time(6) without time zone,
    end_time time(6) without time zone,
    resource_id bigint
);


ALTER TABLE public.vendor_booking_dates OWNER TO postgres;

--
-- Name: vendor_booking_dates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_booking_dates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_booking_dates_id_seq OWNER TO postgres;

--
-- Name: vendor_booking_dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_booking_dates_id_seq OWNED BY public.vendor_booking_dates.id;


--
-- Name: vendor_booking_media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_booking_media (
    id bigint NOT NULL,
    filename character varying(255) NOT NULL,
    vendor_booking_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.vendor_booking_media OWNER TO postgres;

--
-- Name: vendor_booking_media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_booking_media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_booking_media_id_seq OWNER TO postgres;

--
-- Name: vendor_booking_media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_booking_media_id_seq OWNED BY public.vendor_booking_media.id;


--
-- Name: vendor_bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_bookings (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    title character varying(255) NOT NULL,
    reference_number character varying(255) NOT NULL,
    total numeric(10,2) NOT NULL,
    advance numeric(10,2) NOT NULL,
    order_id character varying(50),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    customer_id bigint,
    status character varying(255),
    total_paid numeric(10,2),
    tax numeric(10,2),
    discount numeric(10,2),
    is_rescheduled integer DEFAULT 0 NOT NULL,
    hourly_rate numeric(10,2),
    total_with_tax numeric(10,2),
    total_without_tax numeric(10,2),
    total_hours numeric(10,2),
    last_payment_method character varying(255),
    temp_reschedule_data text,
    before_reschedule_dates text,
    total_rschdl_paid integer DEFAULT 0 NOT NULL,
    disraption double precision DEFAULT '0'::double precision NOT NULL,
    artist_commission double precision DEFAULT '0'::double precision NOT NULL,
    neworer_commission double precision DEFAULT '0'::double precision NOT NULL,
    gateway double precision DEFAULT '0'::double precision NOT NULL,
    cancel_remarks text,
    is_refund_made boolean DEFAULT false NOT NULL,
    refund_file character varying(255),
    duration numeric(10,2),
    reschedule_amount bigint DEFAULT '0'::bigint NOT NULL,
    admin_completed bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE public.vendor_bookings OWNER TO postgres;

--
-- Name: vendor_bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_bookings_id_seq OWNER TO postgres;

--
-- Name: vendor_bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_bookings_id_seq OWNED BY public.vendor_bookings.id;


--
-- Name: vendor_portfolios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_portfolios (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    title character varying(255),
    description character varying(255),
    filename character varying(255) NOT NULL,
    mime character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT vendor_portfolios_type_check CHECK (((type)::text = ANY ((ARRAY['image'::character varying, 'video'::character varying])::text[])))
);


ALTER TABLE public.vendor_portfolios OWNER TO postgres;

--
-- Name: vendor_portfolios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_portfolios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_portfolios_id_seq OWNER TO postgres;

--
-- Name: vendor_portfolios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_portfolios_id_seq OWNED BY public.vendor_portfolios.id;


--
-- Name: vendor_ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_ratings (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    vendor_id bigint NOT NULL,
    rating integer NOT NULL,
    review text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    booking_id bigint,
    rating_type character varying(255)
);


ALTER TABLE public.vendor_ratings OWNER TO postgres;

--
-- Name: vendor_ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_ratings_id_seq OWNER TO postgres;

--
-- Name: vendor_ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_ratings_id_seq OWNED BY public.vendor_ratings.id;


--
-- Name: vendor_user_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_user_details (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    username character varying(50) NOT NULL,
    date_of_birth date,
    lattitude character varying(255),
    longitude character varying(255),
    location_name character varying(255),
    about text,
    instagram character varying(255),
    twitter character varying(255),
    facebook character varying(255),
    tiktok character varying(255),
    gender character varying(255),
    c_policy text,
    r_policy text,
    reference_number character varying(255) NOT NULL,
    hourly_rate numeric(8,2),
    advance_percent integer DEFAULT 0 NOT NULL,
    availability_from date,
    category_id bigint,
    type character varying(255) DEFAULT 'resident'::character varying NOT NULL,
    total_rating numeric(3,2) DEFAULT '0'::numeric NOT NULL,
    thread character varying(255),
    availability_to date,
    deposit_amount numeric(8,2),
    categories character varying(600),
    CONSTRAINT vendor_user_details_gender_check CHECK (((gender)::text = ANY ((ARRAY['male'::character varying, 'female'::character varying, 'other'::character varying])::text[]))),
    CONSTRAINT vendor_user_details_type_check CHECK (((type)::text = ANY ((ARRAY['resident'::character varying, 'guest'::character varying])::text[])))
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
-- Name: app_banners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_banners ALTER COLUMN id SET DEFAULT nextval('public.app_banners_id_seq'::regclass);


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: booking_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_orders ALTER COLUMN id SET DEFAULT nextval('public.booking_orders_id_seq'::regclass);


--
-- Name: booking_resources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_resources ALTER COLUMN id SET DEFAULT nextval('public.booking_resources_id_seq'::regclass);


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: contact_us_entries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us_entries ALTER COLUMN id SET DEFAULT nextval('public.contact_us_entries_id_seq'::regclass);


--
-- Name: country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- Name: customer_ratings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_ratings ALTER COLUMN id SET DEFAULT nextval('public.customer_ratings_id_seq'::regclass);


--
-- Name: customer_user_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_user_details ALTER COLUMN id SET DEFAULT nextval('public.customer_user_details_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: favourites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourites ALTER COLUMN id SET DEFAULT nextval('public.favourites_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: report_reasons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_reasons ALTER COLUMN id SET DEFAULT nextval('public.report_reasons_id_seq'::regclass);


--
-- Name: reported_artists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reported_artists ALTER COLUMN id SET DEFAULT nextval('public.reported_artists_id_seq'::regclass);


--
-- Name: reported_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reported_users ALTER COLUMN id SET DEFAULT nextval('public.reported_users_id_seq'::regclass);


--
-- Name: role_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions ALTER COLUMN id SET DEFAULT nextval('public.role_permissions_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: temp_transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_transactions ALTER COLUMN id SET DEFAULT nextval('public.temp_transactions_id_seq'::regclass);


--
-- Name: temp_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users ALTER COLUMN id SET DEFAULT nextval('public.temp_users_id_seq'::regclass);


--
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_role ALTER COLUMN id SET DEFAULT nextval('public.users_role_id_seq'::regclass);


--
-- Name: vendor_booking_dates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_booking_dates ALTER COLUMN id SET DEFAULT nextval('public.vendor_booking_dates_id_seq'::regclass);


--
-- Name: vendor_booking_media id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_booking_media ALTER COLUMN id SET DEFAULT nextval('public.vendor_booking_media_id_seq'::regclass);


--
-- Name: vendor_bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_bookings ALTER COLUMN id SET DEFAULT nextval('public.vendor_bookings_id_seq'::regclass);


--
-- Name: vendor_portfolios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_portfolios ALTER COLUMN id SET DEFAULT nextval('public.vendor_portfolios_id_seq'::regclass);


--
-- Name: vendor_ratings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_ratings ALTER COLUMN id SET DEFAULT nextval('public.vendor_ratings_id_seq'::regclass);


--
-- Name: vendor_user_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_user_details ALTER COLUMN id SET DEFAULT nextval('public.vendor_user_details_id_seq'::regclass);


--
-- Data for Name: app_banners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_banners (id, name, banner_image, active, sort_order, created_at, updated_at) FROM stdin;
1	Banner 1	6661a1d6667a9_1717674454.png	1	0	2024-06-06 15:47:34	2024-08-14 19:22:59
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles (id, title_en, title_ar, status, desc_en, desc_ar, meta_title, meta_keyword, meta_description, created_at, updated_at) FROM stdin;
3	Privacy Policy	\N	1	<p>Privacy policy--Others who use this device won&rsquo;t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google. Downloads, bookmarks and reading list items will be saved.</p>	\N	\N	\N	\N	2024-06-10 11:46:37	2024-06-11 16:12:37
5	Contact us	\N	1	<p>send an email to the studio here</p>	\N	\N	\N	\N	2024-06-10 11:47:26	2024-06-24 15:30:39
1	About Us	\N	1	<p>About us ---Say something here abnout is&nbsp;</p>	\N	\N	\N	\N	2024-05-01 11:56:48	2024-06-24 15:31:13
6	Deposit policy	\N	1	<p>Deposit policy</p>	\N	\N	\N	\N	2024-07-05 13:15:33	2024-07-05 13:15:33
7	Cancelation Policy	\N	1	<p>Cancelation Policy</p>	\N	\N	\N	\N	2024-07-05 13:15:34	2024-07-05 13:18:05
8	Rescheduling Policy	\N	1	<p>Rescheduling Policy</p>	\N	\N	\N	\N	2024-07-05 13:19:17	2024-07-05 13:19:17
9	Pricing	\N	1	<p>Pricing</p>	\N	\N	\N	\N	2024-07-05 13:19:30	2024-07-05 13:19:30
4	Terms & Conditions	\N	1	<p>Terms &amp; Conditions--&nbsp;Others who use this device won&rsquo;t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google. Downloads, bookmarks and reading list items will be saved.</p>	\N	\N	\N	\N	2024-06-10 11:47:10	2024-09-02 22:07:48
14	Rescheduling Policy	\N	1	<p>A reschedule policy outlines the rules and procedures for changing or canceling appointments, events, or bookings. It typically covers the notice period required, any associated fees or penalties, and the process for requesting changes. The goal is to provide clear expectations for both the customer and the business or provider.</p>	\N	\N	\N	\N	2025-05-15 14:15:50	2025-05-15 14:39:08
\.


--
-- Data for Name: booking_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_orders (id, customer_id, vendor_id, booking_id, reference_number, status, total_paid, tax, discount, order_id, is_rescheduled, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: booking_resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_resources (id, name, active, deleted) FROM stdin;
6	dfgdfg	1	1
7	ghdhd	1	1
9	fcghdgh	1	1
8	dghtyuuuuu	1	1
10	city	1	1
11	xvxv	1	1
5	workstation 2	1	0
2	workstation 5	1	0
3	workstation 4	1	0
4	workstation 3	1	0
13	workstation joker	1	1
14	workstation 7	1	0
1	Workstation 6	1	0
16	workstation 8	1	0
17	workstation new	1	0
19	Workstation 14	1	1
15	Workstation 13	1	1
18	Workstation 10	1	1
12	Workstation 1	1	0
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name, image, active, sort_order, created_at, updated_at, deleted_at) FROM stdin;
1	tes	66c0bb079f0ef_1723906823.jpeg	1	0	2024-08-17 19:00:24	2024-08-17 19:00:30	2024-08-17 19:00:30
2	Testing	66c0e773360e7_1723918195.jpeg	1	0	2024-08-17 22:09:55	2024-08-17 22:28:51	2024-08-17 22:28:51
3	df	66c2c5a71b644_1724040615.jpg	1	0	2024-08-19 08:10:15	2024-08-19 08:13:27	2024-08-19 08:13:27
4	Traditional	66c6eddfd0759_1724313055.png	1	0	2024-08-22 11:50:56	2024-08-22 11:50:56	\N
5	Color	66c6edfa87684_1724313082.png	1	0	2024-08-22 11:51:22	2024-08-22 11:51:22	\N
6	Floral	66c6ee0b684a6_1724313099.png	1	0	2024-08-22 11:51:39	2024-08-22 11:51:39	\N
7	Ornamental	66c6ee44454a2_1724313156.png	1	0	2024-08-22 11:52:36	2024-08-22 11:52:36	\N
9	Realism	66c6ee7511f2f_1724313205.png	1	0	2024-08-22 11:53:25	2024-08-22 11:53:25	\N
10	Black n Grey	66c6eea46b160_1724313252.png	1	0	2024-08-22 11:54:13	2024-08-22 11:54:13	\N
11	Watercolor	66c6eef9e9be6_1724313337.png	1	0	2024-08-22 11:55:38	2024-08-22 11:55:38	\N
12	Geometric	66c6ef0ad6ee4_1724313354.png	1	0	2024-08-22 11:55:55	2024-08-22 11:55:55	\N
13	Japanese	66c6ef1dab61d_1724313373.png	1	0	2024-08-22 11:56:13	2024-08-22 11:56:13	\N
8	Fine Line	66c6ee64afd37_1724313188.png	1	0	2024-08-22 11:53:09	2024-10-30 15:41:12	\N
14	Test	6762daf282364_1734531826.png	0	0	2024-12-18 18:23:46	2024-12-18 18:24:02	\N
\.


--
-- Data for Name: contact_us_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_us_entries (id, customer_id, name, email, dial_code, phone, message, created_at, updated_at) FROM stdin;
8	173	James Cordon	x95y47zzfm@privaterelay.appleid.com	+971	526463852	Hi there I would like to ask something.	2024-09-26 00:22:44	2024-09-26 00:22:44
9	249	Test Dev	test@gmail.com	971	369852147	hi there i am ask to something.	2025-01-18 16:30:52	2025-01-18 16:30:52
10	245	Abc D	abc@gmail.com	971	896541273	Contact us report	2025-02-04 16:48:41	2025-02-04 16:48:41
11	254	Anil Navis	anilnavis@gmail.com	971	564005096	Shashi’s	2025-02-06 13:42:24	2025-02-06 13:42:24
12	264	Mahesh Kumar	ajtest@gmail.com	971	505041866	Vvvvh	2025-02-10 12:40:39	2025-02-10 12:40:39
13	315	Anil Navis	anilnavis@gmail.com	971	564005096	He	2025-04-11 18:13:18	2025-04-11 18:13:18
14	315	Anil Navis	anilnavis@gmail.com	971	564005096	Message	2025-04-11 18:14:27	2025-04-11 18:14:27
15	315	Anil Navis	anilnavis@gmail.com	971	564005096	Fgghhhh	2025-04-12 06:47:42	2025-04-12 06:47:42
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, name, prefix, dial_code, active, deleted, created_at, updated_at) FROM stdin;
2	Aland Islands	AX	358	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
3	Albania	AL	355	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
4	Algeria	DZ	213	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
6	Andorra	AD	376	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
7	Angola	AO	244	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
8	Anguilla	AI	1264	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
9	Antarctica	AQ	672	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
10	Antigua and Barbuda	AG	1268	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
11	Argentina	AR	54	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
12	Armenia	AM	374	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
13	Aruba	AW	297	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
14	Australia	AU	61	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
15	Austria	AT	43	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
16	Azerbaijan	AZ	994	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
17	Bahamas	BS	1242	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
18	Bahrain	BH	973	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
19	Bangladesh	BD	880	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
20	Barbados	BB	1246	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
21	Belarus	BY	375	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
22	Belgium	BE	32	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
23	Belize	BZ	501	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
24	Benin	BJ	229	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
25	Bermuda	BM	1441	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
26	Bhutan	BT	975	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
27	Bolivia, Plurinational State of	BO	591	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
28	Bosnia and Herzegovina	BA	387	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
29	Botswana	BW	267	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
30	Brazil	BR	55	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
31	British Indian Ocean Territory	IO	246	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
32	Brunei Darussalam	BN	673	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
33	Bulgaria	BG	359	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
34	Burkina Faso	BF	226	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
35	Burundi	BI	257	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
36	Cambodia	KH	855	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
37	Cameroon	CM	237	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
38	Canada	CA	1	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
39	Cape Verde	CV	238	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
40	Cayman Islands	KY	 345	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
41	Central African Republic	CF	236	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
42	Chad	TD	235	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
43	Chile	CL	56	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
44	China	CN	86	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
45	Christmas Island	CX	61	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
46	Cocos (Keeling) Islands	CC	61	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
47	Colombia	CO	57	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
48	Comoros	KM	269	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
49	Congo	CG	242	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
50	Congo, The Democratic Republic of the Congo	CD	243	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
51	Cook Islands	CK	682	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
52	Costa Rica	CR	506	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
53	Cote d'Ivoire	CI	225	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
54	Croatia	HR	385	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
55	Cuba	CU	53	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
56	Cyprus	CY	357	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
57	Czech Republic	CZ	420	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
58	Denmark	DK	45	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
59	Djibouti	DJ	253	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
60	Dominica	DM	1767	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
61	Dominican Republic	DO	1849	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
62	Ecuador	EC	593	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
63	Egypt	EG	20	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
64	El Salvador	SV	503	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
65	Equatorial Guinea	GQ	240	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
66	Eritrea	ER	291	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
67	Estonia	EE	372	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
68	Ethiopia	ET	251	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
69	Falkland Islands (Malvinas)	FK	500	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
70	Faroe Islands	FO	298	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
71	Fiji	FJ	679	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
72	Finland	FI	358	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
73	France	FR	33	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
74	French Guiana	GF	594	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
75	French Polynesia	PF	689	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
76	Gabon	GA	241	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
77	Gambia	GM	220	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
78	Georgia	GE	995	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
79	Germany	DE	49	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
80	Ghana	GH	233	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
81	Gibraltar	GI	350	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
82	Greece	GR	30	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
83	Greenland	GL	299	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
84	Grenada	GD	1473	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
85	Guadeloupe	GP	590	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
86	Guam	GU	1671	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
87	Guatemala	GT	502	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
88	Guernsey	GG	44	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
89	Guinea	GN	224	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
90	Guinea-Bissau	GW	245	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
91	Guyana	GY	595	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
92	Haiti	HT	509	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
93	Holy See (Vatican City State)	VA	379	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
94	Honduras	HN	504	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
95	Hong Kong	HK	852	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
96	Hungary	HU	36	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
97	Iceland	IS	354	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
98	India	IN	91	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
99	Indonesia	ID	62	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
100	Iran, Islamic Republic of Persian Gulf	IR	98	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
101	Iraq	IQ	964	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
102	Ireland	IE	353	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
103	Isle of Man	IM	44	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
104	Israel	IL	972	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
1	Afghanistan	AF	9	1	0	2024-04-24 00:50:31	2024-08-07 09:07:20
105	Italy	IT	39	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
106	Jamaica	JM	1876	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
107	Japan	JP	81	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
108	Jersey	JE	44	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
109	Jordan	JO	962	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
110	Kazakhstan	KZ	77	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
111	Kenya	KE	254	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
112	Kiribati	KI	686	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
113	Korea, Democratic People's Republic of Korea	KP	850	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
114	Korea, Republic of South Korea	KR	82	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
115	Kuwait	KW	965	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
116	Kyrgyzstan	KG	996	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
117	Laos	LA	856	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
118	Latvia	LV	371	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
119	Lebanon	LB	961	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
120	Lesotho	LS	266	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
121	Liberia	LR	231	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
122	Libyan Arab Jamahiriya	LY	218	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
123	Liechtenstein	LI	423	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
124	Lithuania	LT	370	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
125	Luxembourg	LU	352	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
126	Macao	MO	853	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
127	Macedonia	MK	389	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
128	Madagascar	MG	261	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
129	Malawi	MW	265	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
130	Malaysia	MY	60	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
131	Maldives	MV	960	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
132	Mali	ML	223	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
133	Malta	MT	356	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
134	Marshall Islands	MH	692	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
135	Martinique	MQ	596	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
136	Mauritania	MR	222	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
137	Mauritius	MU	230	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
138	Mayotte	YT	262	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
139	Mexico	MX	52	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
140	Micronesia, Federated States of Micronesia	FM	691	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
141	Moldova	MD	373	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
142	Monaco	MC	377	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
143	Mongolia	MN	976	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
144	Montenegro	ME	382	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
145	Montserrat	MS	1664	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
146	Morocco	MA	212	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
147	Mozambique	MZ	258	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
148	Myanmar	MM	95	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
149	Namibia	NA	264	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
150	Nauru	NR	674	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
151	Nepal	NP	977	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
152	Netherlands	NL	31	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
153	Netherlands Antilles	AN	599	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
154	New Caledonia	NC	687	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
155	New Zealand	NZ	64	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
156	Nicaragua	NI	505	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
157	Niger	NE	227	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
158	Nigeria	NG	234	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
159	Niue	NU	683	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
160	Norfolk Island	NF	672	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
161	Northern Mariana Islands	MP	1670	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
162	Norway	NO	47	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
163	Oman	OM	968	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
164	Pakistan	PK	92	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
165	Palau	PW	680	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
166	Palestinian Territory, Occupied	PS	970	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
167	Panama	PA	507	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
168	Papua New Guinea	PG	675	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
169	Paraguay	PY	595	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
170	Peru	PE	51	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
171	Philippines	PH	63	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
172	Pitcairn	PN	872	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
173	Poland	PL	48	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
174	Portugal	PT	351	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
175	Puerto Rico	PR	1939	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
176	Qatar	QA	974	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
177	Romania	RO	40	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
178	Russia	RU	7	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
179	Rwanda	RW	250	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
180	Reunion	RE	262	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
181	Saint Barthelemy	BL	590	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
182	Saint Helena, Ascension and Tristan Da Cunha	SH	290	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
183	Saint Kitts and Nevis	KN	1869	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
185	Saint Martin	MF	590	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
186	Saint Pierre and Miquelon	PM	508	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
187	Saint Vincent and the Grenadines	VC	1784	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
188	Samoa	WS	685	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
189	San Marino	SM	378	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
190	Sao Tome and Principe	ST	239	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
191	Saudi Arabia	SA	966	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
192	Senegal	SN	221	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
193	Serbia	RS	381	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
194	Seychelles	SC	248	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
195	Sierra Leone	SL	232	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
196	Singapore	SG	65	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
197	Slovakia	SK	421	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
198	Slovenia	SI	386	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
199	Solomon Islands	SB	677	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
200	Somalia	SO	252	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
201	South Africa	ZA	27	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
202	South Sudan	SS	211	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
203	South Georgia and the South Sandwich Islands	GS	500	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
204	Spain	ES	34	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
205	Sri Lanka	LK	94	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
206	Sudan	SD	249	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
207	Suriname	SR	597	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
208	Svalbard and Jan Mayen	SJ	47	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
209	Swaziland	SZ	268	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
210	Sweden	SE	46	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
211	Switzerland	CH	41	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
212	Syrian Arab Republic	SY	963	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
213	Taiwan	TW	886	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
214	Tajikistan	TJ	992	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
215	Tanzania, United Republic of Tanzania	TZ	255	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
216	Thailand	TH	66	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
217	Timor-Leste	TL	670	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
218	Togo	TG	228	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
219	Tokelau	TK	690	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
220	Tonga	TO	676	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
221	Trinidad and Tobago	TT	1868	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
222	Tunisia	TN	216	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
223	Turkey	TR	90	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
224	Turkmenistan	TM	993	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
225	Turks and Caicos Islands	TC	1649	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
226	Tuvalu	TV	688	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
227	Uganda	UG	256	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
228	Ukraine	UA	380	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
229	United Arab Emirates	AE	971	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
230	United Kingdom	GB	44	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
231	United States	US	1	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
232	Uruguay	UY	598	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
233	Uzbekistan	UZ	998	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
234	Vanuatu	VU	678	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
235	Venezuela, Bolivarian Republic of Venezuela	VE	58	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
236	Vietnam	VN	84	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
237	Virgin Islands, British	VG	1284	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
238	Virgin Islands, U.S.	VI	1340	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
239	Wallis and Futuna	WF	681	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
240	Yemen	YE	967	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
241	Zambia	ZM	260	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
242	Zimbabwe	ZW	263	1	0	2024-04-24 00:50:31	2024-04-24 00:50:31
5	American Samoa	AS	1684	1	0	2024-04-24 00:50:31	2024-05-22 13:19:37
243	5654	DFG	45	0	1	2024-08-07 08:58:23	\N
246	rerggggggggggggggggggggggggggggggggggggggggggggggg	40540	4254	0	1	2024-08-08 05:40:40	\N
247	erter	456	43	0	1	2024-08-14 13:58:12	\N
248	asds	12	12	0	1	2024-08-14 15:03:46	\N
245	34	1	324	0	1	2024-08-07 09:00:56	\N
244	12	SC	23	0	1	2024-08-07 08:59:44	\N
184	Saint Lucia	LC	1758	1	0	2024-04-24 00:50:31	2024-08-15 04:58:10
249	qwerty	23	342	0	1	2024-08-15 04:07:16	2024-08-15 05:33:01
250	new	12	1232	0	1	2024-08-15 05:33:31	\N
251	Tester	62700	91	1	0	2024-10-10 08:37:22	\N
\.


--
-- Data for Name: customer_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_ratings (id, user_id, vendor_id, rating, review, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: customer_user_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_user_details (id, user_id, date_of_birth, lattitude, longitude, location_name, gender, is_social, wallet_balance, created_at, updated_at, total_rating, wallet_id, remarks) FROM stdin;
221	302	2025-03-05				male	0	0.00	2025-03-13 09:19:54	2025-03-13 09:19:54	0.00	sp99316594967	\N
222	303	1964-10-19				\N	0	0.00	2025-03-13 09:43:37	2025-03-13 09:43:37	0.00	sp10599480290	\N
223	304	2019-03-12				male	0	0.00	2025-03-13 09:45:18	2025-03-13 09:45:18	0.00	sp66136233912	\N
224	305	1992-03-16				\N	0	0.00	2025-03-17 12:41:19	2025-03-17 12:41:19	0.00	sp93890958603	\N
225	306	\N				\N	0	0.00	2025-03-17 13:20:59	2025-03-17 13:20:59	0.00	sp73726846923	\N
227	311	\N				\N	1	0.00	2025-03-17 19:15:35	2025-03-17 19:15:35	0.00	sp64908548380	\N
228	312	\N				\N	1	0.00	2025-03-18 03:02:15	2025-03-18 03:02:15	0.00	sp23731161092	\N
231	315	2025-03-18				male	0	340.00	2025-03-19 11:24:13	2025-05-15 14:28:59	0.00	sp40282392509	\N
232	316	2018-03-18				male	0	0.00	2025-03-19 16:10:46	2025-03-19 16:10:46	0.00	sp21327514765	\N
229	313	2012-03-18	25.204819	55.270931		male	0	260.00	2025-03-19 11:04:43	2025-05-16 11:00:28	0.00	sp71597475968	\N
240	324	2025-05-15				\N	0	0.00	2025-05-16 14:46:42	2025-05-16 14:46:42	0.00	sp68744865021	\N
242	326	2025-05-15				\N	0	0.00	2025-05-16 14:50:44	2025-05-16 15:00:23	0.00	sp50777128588	\N
243	327	\N				\N	0	0.00	2025-05-16 16:08:18	2025-05-16 16:08:18	0.00	sp13589085926	\N
244	329	2025-05-16				\N	0	0.00	2025-05-17 04:50:11	2025-05-17 04:50:11	0.00	sp98164247796	\N
245	330	\N				\N	0	0.00	2025-05-17 12:55:36	2025-05-17 12:55:36	0.00	sp54858925200	\N
230	314	2025-03-04				male	0	800.00	2025-03-19 11:17:03	2025-03-20 15:44:51	0.00	sp20544592988	\N
246	331	\N				\N	0	0.00	2025-05-20 11:15:34	2025-05-20 11:15:34	0.00	sp44077271432	\N
241	325	1998-05-14				male	0	0.00	2025-05-16 14:47:58	2025-05-20 12:04:55	0.00	sp39957135020	\N
233	317	2025-03-19	25.204819	55.270931		male	0	9603.00	2025-03-20 17:07:03	2025-03-20 22:19:05	0.00	sp85621064695	\N
235	319	2025-03-10	25.204819	55.270931		male	0	0.00	2025-03-21 14:45:25	2025-03-21 14:55:53	0.00	sp67476254884	done
234	318	2025-03-02	25.204819	55.270931		male	0	0.00	2025-03-21 14:25:51	2025-03-21 15:14:28	0.00	sp12712941354	zfs
236	320	2025-03-11	25.204819	55.270931		male	0	0.00	2025-03-21 15:18:16	2025-03-21 15:18:16	0.00	sp15130753281	\N
237	321	2025-03-20				\N	0	0.00	2025-03-21 15:38:09	2025-03-21 15:38:09	0.00	sp59006597187	\N
238	322	2025-03-04	25.204819	55.270931		male	0	0.00	2025-03-21 15:41:09	2025-03-21 15:41:09	0.00	sp47489157272	ddd
226	307	\N	25.204819	55.270931		male	0	1580.00	2025-03-17 14:15:29	2025-03-23 14:51:33	0.00	sp89802962961	\N
239	323	1970-03-30				male	0	31756.00	2025-03-31 15:17:22	2025-04-29 15:07:36	0.00	sp67045694804	\N
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: favourites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favourites (id, vendor_id, customer_id, created_at, updated_at) FROM stdin;
6	25	30	2024-06-11 17:10:58	2024-06-11 17:10:58
9	2	30	2024-06-11 19:07:58	2024-06-11 19:07:58
17	2	29	2024-06-12 10:35:34	2024-06-12 10:35:34
21	7	48	2024-06-12 20:49:11	2024-06-12 20:49:11
22	27	50	2024-06-12 22:27:47	2024-06-12 22:27:47
24	27	30	2024-06-13 00:11:26	2024-06-13 00:11:26
25	27	29	2024-06-14 00:24:22	2024-06-14 00:24:22
26	10	86	2024-06-15 15:08:00	2024-06-15 15:08:00
28	27	92	2024-06-17 11:07:46	2024-06-17 11:07:46
30	10	92	2024-06-19 00:20:12	2024-06-19 00:20:12
31	27	82	2024-06-20 10:42:06	2024-06-20 10:42:06
33	25	92	2024-06-21 12:48:12	2024-06-21 12:48:12
34	27	100	2024-06-21 19:21:26	2024-06-21 19:21:26
35	7	100	2024-06-22 01:37:41	2024-06-22 01:37:41
36	134	173	2024-09-23 15:08:21	2024-09-23 15:08:21
37	135	173	2024-09-23 15:08:34	2024-09-23 15:08:34
40	133	173	2024-09-24 13:15:03	2024-09-24 13:15:03
41	134	198	2024-09-25 16:32:00	2024-09-25 16:32:00
42	135	202	2024-09-30 19:55:16	2024-09-30 19:55:16
43	134	202	2024-10-01 12:21:25	2024-10-01 12:21:25
44	134	201	2024-10-01 14:33:20	2024-10-01 14:33:20
45	135	201	2024-10-01 14:33:27	2024-10-01 14:33:27
46	212	209	2024-10-15 18:42:20	2024-10-15 18:42:20
47	212	221	2024-10-16 16:42:00	2024-10-16 16:42:00
48	134	221	2024-10-16 16:42:57	2024-10-16 16:42:57
49	212	207	2024-10-16 16:49:16	2024-10-16 16:49:16
51	135	223	2024-10-21 14:07:55	2024-10-21 14:07:55
52	133	210	2024-10-24 13:44:37	2024-10-24 13:44:37
53	133	223	2024-10-30 17:52:09	2024-10-30 17:52:09
56	133	236	2024-11-11 14:32:37	2024-11-11 14:32:37
57	226	236	2024-11-11 14:32:46	2024-11-11 14:32:46
58	134	231	2024-11-15 14:35:08	2024-11-15 14:35:08
59	226	238	2024-11-16 18:19:36	2024-11-16 18:19:36
60	134	238	2024-11-16 18:19:45	2024-11-16 18:19:45
62	134	232	2024-11-18 15:52:43	2024-11-18 15:52:43
63	226	232	2024-11-18 15:52:48	2024-11-18 15:52:48
65	133	238	2024-11-19 14:26:37	2024-11-19 14:26:37
66	135	238	2024-11-19 20:46:15	2024-11-19 20:46:15
67	135	232	2024-11-20 11:18:31	2024-11-20 11:18:31
69	134	236	2025-01-11 14:56:42	2025-01-11 14:56:42
70	247	236	2025-01-11 15:13:37	2025-01-11 15:13:37
71	247	249	2025-01-18 16:22:54	2025-01-18 16:22:54
91	252	254	2025-02-06 15:27:14	2025-02-06 15:27:14
92	250	254	2025-02-06 15:27:22	2025-02-06 15:27:22
93	133	254	2025-02-06 15:27:28	2025-02-06 15:27:28
95	248	236	2025-02-07 10:47:49	2025-02-07 10:47:49
96	256	236	2025-02-07 10:48:05	2025-02-07 10:48:05
97	247	254	2025-02-07 18:44:41	2025-02-07 18:44:41
98	256	258	2025-02-07 23:30:26	2025-02-07 23:30:26
99	247	255	2025-02-08 12:28:38	2025-02-08 12:28:38
100	247	258	2025-02-09 02:36:01	2025-02-09 02:36:01
101	133	258	2025-02-09 02:42:21	2025-02-09 02:42:21
103	134	265	2025-02-10 11:50:05	2025-02-10 11:50:05
106	134	267	2025-02-11 11:59:45	2025-02-11 11:59:45
107	250	267	2025-02-11 12:01:22	2025-02-11 12:01:22
108	247	277	2025-02-13 00:35:20	2025-02-13 00:35:20
109	134	277	2025-02-13 00:36:41	2025-02-13 00:36:41
110	256	279	2025-02-13 23:05:03	2025-02-13 23:05:03
111	247	275	2025-02-14 17:17:43	2025-02-14 17:17:43
112	247	279	2025-02-20 14:06:10	2025-02-20 14:06:10
113	257	279	2025-03-01 09:16:44	2025-03-01 09:16:44
114	135	317	2025-03-21 11:17:16	2025-03-21 11:17:16
115	133	307	2025-03-23 14:43:23	2025-03-23 14:43:23
116	134	307	2025-03-23 19:16:47	2025-03-23 19:16:47
117	310	323	2025-03-31 16:44:27	2025-03-31 16:44:27
119	308	323	2025-03-31 16:45:19	2025-03-31 16:45:19
120	309	323	2025-03-31 17:13:09	2025-03-31 17:13:09
122	328	327	2025-05-18 13:07:59	2025-05-18 13:07:59
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
4	2024_03_21_122103_add_indexes_to_tables	1
5	2024_03_22_111410_create_country_models_table	1
6	2024_03_22_190801_add_category_table	1
7	2024_04_03_174246_add_vendor_details_table	1
8	2024_04_08_160714_add_customer_user_details_table	1
9	2024_04_24_155243_add_vendor_portfolio_table	2
10	2024_04_25_020535_modify_vendor_user_detail_table	2
11	2024_04_25_030125_add_vendor_booking_table	2
12	2024_05_01_104409_add_article_table	3
13	2024_05_02_051918_add_vendor_bookings_dates	4
14	2024_05_02_051920_create_users_role_table	5
15	2024_05_02_051921_create_role_permissions_table	5
16	2024_05_02_153917_add_role_table	5
17	2024_05_02_153918_add_role_id_to_users_table	5
18	2024_05_03_052938_add_all_booking_order_tables	5
19	2024_05_04_220436_add_vendor_ratings_table	6
20	2024_05_17_003006_add_fields_vendor_user_details_table	7
21	2024_05_17_201339_alter_vendor_booking_table	8
22	2024_05_17_201340_vendor_booking_media_table	8
23	2024_05_17_201350_add_customer_ratings_table	8
24	2024_05_20_111718_create_personal_access_tokens_table	9
25	2024_05_20_111720_add_temp_user_table	9
26	2024_05_20_120938_add_fields_user_table	9
27	2024_05_21_025742_add_booking_field_vendor_table	9
28	2024_05_04_220438_add_app_banner	10
29	2024_05_21_025750_create_settings	11
30	2024_06_07_062909_add_temp_transactions_table	12
31	2024_06_07_141805_add_booking_resource_table	13
32	2024_06_11_081804_add_add_to_favourite_table	14
33	2024_06_11_081845_add_contact_us_entries	15
34	2024_07_05_092855_last_login	16
35	2024_07_05_150417_categories	17
36	2024_07_06_085307_disraption	18
37	2024_07_23_123316_add_fields_to_customer_table	19
38	2024_07_31_085148_add_fields_vendor_booking_table	20
39	2024_08_13_224050_add_duration_field_vendor_bookings_table	21
40	2024_08_27_111423_user_name	22
41	2024_09_30_181721_create_reported_users_table	23
42	2024_10_31_221947_create_report_reasons_table	23
43	2024_10_31_222021_create_reported_artists_table	23
44	2024_11_07_025146_add_other_reason_to_reported_artist_table	24
45	2024_12_12_000331_add_booking_reschedule_amount_to_booking_table	25
46	2024_12_16_000331_add_rating_type_to_rating_table	26
47	2024_12_17_000331_add_admin_completed_to_booking_table	27
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
1	App\\Models\\User	9	api	f006db4d0a3184276b4de3e79ef41b9021593aa2aef6caa1e967b7782a465ebd	["*"]	\N	\N	2024-05-22 08:06:18	2024-05-22 08:06:18
2	App\\Models\\User	9	api	e818159b313a59e519e7c000a58e51dbf424a98224846aa08aad0b2b0546e686	["*"]	\N	\N	2024-05-22 16:30:29	2024-05-22 16:30:29
3	App\\Models\\User	9	api	dcc063cb19160a4d7e082da640abdbe71af9405cee0b12e6ab7ff41fe2ef9057	["*"]	\N	\N	2024-05-22 16:30:37	2024-05-22 16:30:37
4	App\\Models\\User	6	api	a0377d9ffe2ffe49ce105f11d1484f560f01654e7a1615755e762473305a7d71	["*"]	\N	\N	2024-05-22 16:50:24	2024-05-22 16:50:24
5	App\\Models\\User	4	api	eafc904ec602655f446a33b0541b37d6481b540c0e9bd6750ce8a8d3f9491949	["*"]	\N	\N	2024-05-22 16:51:16	2024-05-22 16:51:16
6	App\\Models\\User	3	api	58c6891eee52f724874f68e33c031af3f84f86c1faa694c8d8399c616a5ef9b7	["*"]	\N	\N	2024-05-22 16:53:49	2024-05-22 16:53:49
7	App\\Models\\User	3	api	565c6cdb8438b9674fc3ba4f09689a1821725b5683f907b56c694bd091da40f8	["*"]	\N	\N	2024-05-22 16:55:13	2024-05-22 16:55:13
8	App\\Models\\User	3	api	32b967235e422405456671f2c65dbf6923622abdfc447626f484e44b6859cdf5	["*"]	\N	\N	2024-05-22 16:55:38	2024-05-22 16:55:38
9	App\\Models\\User	9	api	d7ab6ae9c40953da1c1c24148d53662e0ff61f0ae34e42521aa20ad730f9856b	["*"]	\N	\N	2024-05-23 18:38:03	2024-05-23 18:38:03
10	App\\Models\\User	6	api	6212b2839172d7b517ae1573130f97f8b715d33406530d8660f71e1665f7c04f	["*"]	\N	\N	2024-05-23 18:38:05	2024-05-23 18:38:05
11	App\\Models\\User	9	api	550fd1bb569e01d7a7fc88ceed8963c42ffe84f0ac9ca7db9f7a8cac75e0e1df	["*"]	\N	\N	2024-05-23 18:42:31	2024-05-23 18:42:31
12	App\\Models\\User	12	api	9d65d057c550dc9e69e740249faaf92b1656a0ca908ee7302c9ba15a606d2e42	["*"]	\N	\N	2024-05-24 05:59:47	2024-05-24 05:59:47
13	App\\Models\\User	12	api	2d1b360bf90e1c2fdcce4da03d31ac72da5deab62cb465755834fd465f5242d2	["*"]	\N	\N	2024-05-24 06:00:08	2024-05-24 06:00:08
14	App\\Models\\User	13	api	fd40acead1a2f1eb8eaf44987c8c86b0d3296be893e8f814f7ae4b55c4a3c723	["*"]	\N	\N	2024-05-24 11:42:34	2024-05-24 11:42:34
15	App\\Models\\User	14	api	cc3017e8d13c71e02354766c2b68a6783962cd73ca77ce7294747eea6db635c7	["*"]	\N	\N	2024-05-25 07:53:27	2024-05-25 07:53:27
16	App\\Models\\User	14	api	3c322506aea8ed87dfc95174a5a91db99fa7b556d9fbd93efd631279e2823b6f	["*"]	\N	\N	2024-05-25 07:54:10	2024-05-25 07:54:10
17	App\\Models\\User	14	api	68397f7eb842a01a46929d8ffee8e65169beee70dd90bdc2ae16f4d2213c2b46	["*"]	\N	\N	2024-05-25 09:36:47	2024-05-25 09:36:47
18	App\\Models\\User	14	api	3d642f4441e7cd3bcc99cf325c060e081a9fc02405ad382f1258f9d947359750	["*"]	\N	\N	2024-05-25 09:52:40	2024-05-25 09:52:40
19	App\\Models\\User	14	api	4de52e7dbd8b352f0e8135411e83c1ed79a26a9a072ec4d1a156d18b9935da30	["*"]	\N	\N	2024-05-25 11:15:50	2024-05-25 11:15:50
20	App\\Models\\User	14	api	c7ec05577f214aed040985c610120d95e70f92f5dd92d52bfe78c664e0131140	["*"]	\N	\N	2024-05-25 11:17:29	2024-05-25 11:17:29
21	App\\Models\\User	14	api	57030f76eb5f4492fa1f0c4a408a9312c140a489aaf89de44ad723e65a2869a9	["*"]	\N	\N	2024-05-25 11:22:28	2024-05-25 11:22:28
22	App\\Models\\User	14	api	751d79eea71580b3390783e0d67466d7b380ed658ace1014214d5e6c3875b9cd	["*"]	\N	\N	2024-05-25 11:35:49	2024-05-25 11:35:49
23	App\\Models\\User	15	api	bac37e3305d493e2f77b1938d0e44b6c543a90b70f90d575621210f4c7acac2f	["*"]	\N	\N	2024-06-03 17:56:06	2024-06-03 17:56:06
24	App\\Models\\User	15	api	f448ce9fbc7dc75d54df467c233a6458cb64ca8de6d3be2326f41e8cbddb9714	["*"]	\N	\N	2024-06-04 11:36:24	2024-06-04 11:36:24
25	App\\Models\\User	15	api	8701c8a6a748f5a938be91a604b0fe0c9e3cd86694ac91fdec7ee3754d3429b0	["*"]	\N	\N	2024-06-04 11:40:01	2024-06-04 11:40:01
28	App\\Models\\User	15	api	ddb94b24273b347212f7ee39dc2d8ae9fb8353cde92378c647cd1d8acbf41086	["*"]	2024-06-04 14:28:23	\N	2024-06-04 14:27:01	2024-06-04 14:28:23
29	App\\Models\\User	15	api	250120c17644de63654a2008066f79597ce657e41bcffa02c9032f219b08131c	["*"]	2024-06-04 14:58:19	\N	2024-06-04 14:57:41	2024-06-04 14:58:19
30	App\\Models\\User	9	api	124fdd44535d6581ffdb1883657cf1e8d9430912d1d952c558ffb74b2357a420	["*"]	\N	\N	2024-06-04 15:01:23	2024-06-04 15:01:23
31	App\\Models\\User	9	api	3a81a68bc796ea4d1bb3ccb53977178466c779dde2ccad6e19c5fde89ca43e4f	["*"]	2024-06-04 15:02:17	\N	2024-06-04 15:01:49	2024-06-04 15:02:17
34	App\\Models\\User	9	api	e38ecf7bc0debba235284055bb4c88d7157abf84a4131e70eecb4b042693613f	["*"]	2024-06-06 14:16:42	\N	2024-06-04 15:41:22	2024-06-06 14:16:42
351	App\\Models\\User	30	api	77b1819e62d6ed3c5843da7bac7dee1e7ed52ad66077803b15354b5c0e1b4db8	["*"]	\N	\N	2024-06-14 11:27:58	2024-06-14 11:27:58
37	App\\Models\\User	16	api	3503fabef3d62aeb6a076365cac2a7f2c618a41bdecee75c8b706cf476385e9e	["*"]	2024-06-06 18:49:15	\N	2024-06-05 15:30:28	2024-06-06 18:49:15
35	App\\Models\\User	9	api	c992ec5d21d1df9f8f2bcc5b870e87220c0a971d76dd7f889d81ab5d025e243c	["*"]	2024-06-05 15:08:32	\N	2024-06-05 14:42:47	2024-06-05 15:08:32
32	App\\Models\\User	15	api	1d2c115613bc9995ba463eebbebd2f5d8fae859e75c48770d7c48cff81d30910	["*"]	2024-06-04 15:35:57	\N	2024-06-04 15:32:47	2024-06-04 15:35:57
36	App\\Models\\User	16	api	b7776316e40ad9faca9bee2384d6c3030fa167de16fd13e7c1c59af74cbdf6af	["*"]	\N	\N	2024-06-05 15:27:16	2024-06-05 15:27:16
27	App\\Models\\User	15	api	318eab9bcc263c56cd1a75744d3994d74c3cf83ac3ea428162003b9f3b891bbc	["*"]	2024-06-04 15:40:29	\N	2024-06-04 13:38:15	2024-06-04 15:40:29
26	App\\Models\\User	15	api	27f89068867ee83a494bd07ad18a16f72c0a5e2fbd0a9c04fcf91d2cfc603ff3	["*"]	2024-06-05 14:42:00	\N	2024-06-04 11:57:28	2024-06-05 14:42:00
33	App\\Models\\User	9	api	120f2a4b20b59690aa203429c07d639acb18f0f15deb101fbcde44ac57a5e901	["*"]	2024-06-06 12:20:14	\N	2024-06-04 15:39:03	2024-06-06 12:20:14
38	App\\Models\\User	9	api	5f825d37927e95e581e17836bd3a213eacfe523c633563f829cc6a6b7c8dffa5	["*"]	\N	\N	2024-06-05 17:32:03	2024-06-05 17:32:03
355	App\\Models\\User	30	api	d1192e41aa49a44ee9fba07f58432e693cba28c352add67f031971e9e07a10ed	["*"]	2024-06-14 14:42:27	\N	2024-06-14 14:27:29	2024-06-14 14:42:27
39	App\\Models\\User	26	api	ee34c5c1ca9f173da0200933f3e7b4375309b6b19a865ae3fb3e344e31bfc9a8	["*"]	\N	\N	2024-06-06 09:36:56	2024-06-06 09:36:56
40	App\\Models\\User	26	api	204a51db31c65ce1cb715a62168a28965b1254f51aa4696e885768944cb6717e	["*"]	\N	\N	2024-06-06 09:37:39	2024-06-06 09:37:39
41	App\\Models\\User	26	api	39d04e422dfdb6eb9586e39acda31d58d0e3cacdd5543ad171780da96a16bcdb	["*"]	\N	\N	2024-06-06 09:46:56	2024-06-06 09:46:56
42	App\\Models\\User	26	api	3788322356a64100288a6c5bcbd70c1407f5aaa701303dc61f361d8580591ad3	["*"]	\N	\N	2024-06-06 09:52:35	2024-06-06 09:52:35
43	App\\Models\\User	28	api	8cd67e47ba88449419592481c96e5820d99cae50d45a7905777bf4aa24a82604	["*"]	\N	\N	2024-06-06 10:32:14	2024-06-06 10:32:14
44	App\\Models\\User	28	api	d27791dc2a47d33f2f02e2a9d7ac9b222efeb21d8e9ee672e0fb2f4d8ef943d3	["*"]	\N	\N	2024-06-06 10:39:37	2024-06-06 10:39:37
211	App\\Models\\User	47	api	2ea208eac639519998607595dbf4c154edbe81b05778b76deee368c9b2082b18	["*"]	\N	\N	2024-06-12 13:47:03	2024-06-12 13:47:03
1024	App\\Models\\User	255	api	aff2aebde4d8b2e5506b78df5c0de1cc1ab3cfd03fda72798881a03af89c1be1	["*"]	\N	\N	2025-02-08 09:42:56	2025-02-08 09:42:56
45	App\\Models\\User	28	api	ddd78f86648444a00e544c489c986e9c1d8d4c2f14051ea0a350d0bcf00f0c36	["*"]	\N	\N	2024-06-06 11:01:54	2024-06-06 11:01:54
46	App\\Models\\User	9	api	be9f017d2a1b500257f8105bdfbbc5119fefc2b70768ac4b673e0e37bf5e8fb9	["*"]	\N	\N	2024-06-06 11:58:23	2024-06-06 11:58:23
47	App\\Models\\User	29	api	ce32371ab33d9f36fc20df3132c43bbfa9f2e2d521840c4e9d893cc56b7b065e	["*"]	\N	\N	2024-06-06 12:31:52	2024-06-06 12:31:52
48	App\\Models\\User	4	api	2448081c0f8790c30f28da00614970d3d68ab268c071e0921389d1eb692f5022	["*"]	\N	\N	2024-06-06 12:34:33	2024-06-06 12:34:33
352	App\\Models\\User	54	api	f8e8fb4996366de84adf91d5a5c269ef3b550910ab8a7686c5c24bfc2e862069	["*"]	\N	\N	2024-06-14 12:17:02	2024-06-14 12:17:02
50	App\\Models\\User	4	api	9cae851aca7c5966fa27b6a922ec8aeed49bc93d76d506960824d18bf9187e9c	["*"]	2024-06-06 13:17:38	\N	2024-06-06 13:16:58	2024-06-06 13:17:38
54	App\\Models\\User	9	api	2b05d2fb23433271853469978949791b68196d70513e6bab9afdd594a9f3b6d2	["*"]	2024-06-06 18:18:49	\N	2024-06-06 15:15:06	2024-06-06 18:18:49
73	App\\Models\\User	31	api	cbbb316d9138e3e092c2529e9388d705707d008c269a38aa79d87f23f7f9398c	["*"]	\N	\N	2024-06-07 13:30:47	2024-06-07 13:30:47
78	App\\Models\\User	9	api	08292e2ca79bda9399c0515a026881c3cea6e8ab4a27266a4faa1097ac425da6	["*"]	2024-06-10 13:27:16	\N	2024-06-07 15:19:00	2024-06-10 13:27:16
65	App\\Models\\User	30	api	19bf6382a01199275cd64072fe84264a83e016322f39844e716045c087c43e61	["*"]	2024-06-06 22:16:43	\N	2024-06-06 22:16:19	2024-06-06 22:16:43
52	App\\Models\\User	9	api	0e05a87342a611dec00fcc3eaf9b780cc0716b9b20ff1f47ddeb3da161a32c17	["*"]	\N	\N	2024-06-06 15:12:02	2024-06-06 15:12:02
53	App\\Models\\User	15	api	82e0ca8bba3c8b18395985dee3c5f7395711356ea6d3fe6f06347d503c7e8fef	["*"]	2024-06-06 15:14:16	\N	2024-06-06 15:14:07	2024-06-06 15:14:16
89	App\\Models\\User	31	api	8d37eaa27fb66f9fafdfab7147ecd16f7cd8a73f928f24828f595d5c620ceb31	["*"]	2024-06-11 21:05:21	\N	2024-06-08 01:44:58	2024-06-11 21:05:21
56	App\\Models\\User	28	api	ab15ed8fb72856a661b8edf07de67cdbd9fa4dc65fad29c148d3af17af833ac4	["*"]	2024-06-06 18:33:11	\N	2024-06-06 18:01:22	2024-06-06 18:33:11
55	App\\Models\\User	30	api	f49d9cda36940244a38254ed8e55aa20d67845ac829a57e90b64bb7d2d76090c	["*"]	\N	\N	2024-06-06 17:53:26	2024-06-06 17:53:26
77	App\\Models\\User	31	api	fbff2dda616e7a427bec2a85b8ea14c24ddb7154a38f1f07f05d3bcf44c27b57	["*"]	2024-06-07 15:04:17	\N	2024-06-07 15:04:06	2024-06-07 15:04:17
63	App\\Models\\User	30	api	4bc8f15f1e5685ec80a12afdebb8b92ba205d582493ed6881da1fe4d0aace6e9	["*"]	2024-06-07 13:36:19	\N	2024-06-06 20:40:09	2024-06-07 13:36:19
59	App\\Models\\User	9	api	8adb7af4e888fe81919e7fc30644eee6768e254e538825bfb9144dfba40d6402	["*"]	2024-06-06 18:50:53	\N	2024-06-06 18:43:57	2024-06-06 18:50:53
67	App\\Models\\User	9	api	bac61aa221c0f6bd38c0b4b5ba14c5832c88007177d2a129237abf951c234fbe	["*"]	2024-06-11 10:38:23	\N	2024-06-06 22:30:07	2024-06-11 10:38:23
74	App\\Models\\User	30	api	5c8eedf17ba3f02ab7b0465b6cffa18bb3acd21504b73cbe0ef1e8df4ee85393	["*"]	2024-06-10 12:23:37	\N	2024-06-07 13:57:31	2024-06-10 12:23:37
66	App\\Models\\User	9	api	b8949bd7d8b55333df73fb341575e415be0521072163e71c88ca019099e48c45	["*"]	2024-06-06 23:07:56	\N	2024-06-06 22:18:09	2024-06-06 23:07:56
58	App\\Models\\User	28	api	9db4ff405a9d698fcc55f127480d9d9aa0a791b70aff63393fa90b25ed2b9ece	["*"]	2024-06-06 18:36:14	\N	2024-06-06 18:33:42	2024-06-06 18:36:14
57	App\\Models\\User	28	api	31f50133015e1fd60b666d5f846b98d638527eab670ae0a54845779656397e97	["*"]	2024-06-06 18:39:39	\N	2024-06-06 18:25:20	2024-06-06 18:39:39
70	App\\Models\\User	30	api	ea2f748e4520b189b1d60b0352bcc2a69a126af9855c7c7d8a0c91fb56f4215a	["*"]	2024-06-10 17:38:31	\N	2024-06-07 13:21:02	2024-06-10 17:38:31
61	App\\Models\\User	30	api	ac4ad255fdce2902d339959715e285bcb59def96273ac40b1507662b524326a1	["*"]	2024-06-06 19:26:41	\N	2024-06-06 19:03:23	2024-06-06 19:26:41
192	App\\Models\\User	45	api	8db90ef9991d429015cc8a74bac35f3ce3f56ac5ae9686729d2d6cbb57800cd9	["*"]	2024-06-12 08:00:13	\N	2024-06-12 06:42:26	2024-06-12 08:00:13
51	App\\Models\\User	9	api	3d6f0c560df4cfe94f385c04c312ba4af3b64c0d71857256f39e6c1a0d82c6ac	["*"]	2024-06-06 23:02:28	\N	2024-06-06 13:19:06	2024-06-06 23:02:28
81	App\\Models\\User	26	api	c8dd6f1b38fbdd8dec9af975358a49eddbb983d96d0fac4705b6166ac56dfc10	["*"]	\N	\N	2024-06-07 20:05:05	2024-06-07 20:05:05
83	App\\Models\\User	31	api	af1ce77d68f587d2e25fa140ce0dfbd2c16d6265d3ad03e1903fbf4c7e5375cc	["*"]	\N	\N	2024-06-08 00:17:27	2024-06-08 00:17:27
75	App\\Models\\User	28	api	afef2dc56a398fc454d8dc30f5271009003217be7ec34011c006f305ff18e740	["*"]	\N	\N	2024-06-07 13:59:37	2024-06-07 13:59:37
60	App\\Models\\User	30	api	2c68a7c1ccb06d84906e92e12060a906e1e646660ddc980a947577d1311b0e88	["*"]	2024-06-07 11:30:46	\N	2024-06-06 19:00:36	2024-06-07 11:30:46
72	App\\Models\\User	31	api	89d9210f6692a307da62608bbbebcd9101c429831cf11bcf45f6351f9f8af904	["*"]	2024-06-07 13:26:13	\N	2024-06-07 13:25:51	2024-06-07 13:26:13
62	App\\Models\\User	30	api	e699b54ce58ee92b726788cecb5a15e1816b8924781ea36331e1233f7e875c32	["*"]	2024-06-10 19:47:54	\N	2024-06-06 19:27:26	2024-06-10 19:47:54
79	App\\Models\\User	31	api	ba9ee916e7d2af448cda558d23a2860db69e930f456cca01b35003d0e11b2fa0	["*"]	2024-06-08 00:21:10	\N	2024-06-07 15:36:24	2024-06-08 00:21:10
69	App\\Models\\User	9	api	f3b8232b7151414484489dfe55f96047afc4e3177c29cc219c142883f8ad6622	["*"]	2024-06-12 12:50:05	\N	2024-06-07 10:49:50	2024-06-12 12:50:05
80	App\\Models\\User	31	api	13466916531bfc2cba6094b405f633e1fa9e915219093f22a4f529334bdf0026	["*"]	\N	\N	2024-06-07 15:38:00	2024-06-07 15:38:00
76	App\\Models\\User	28	api	b43c729feca2c8a49e0caf07599435f2551a4bd2b2fa3f94c81cc523c5c65ba4	["*"]	2024-06-14 01:49:54	\N	2024-06-07 14:00:00	2024-06-14 01:49:54
86	App\\Models\\User	31	api	9510557bc8843a08cefd6d8e010d4f0bb3d31611a6db3d05833b1a0c7f68598b	["*"]	\N	\N	2024-06-08 00:35:41	2024-06-08 00:35:41
84	App\\Models\\User	31	api	0bd853263c72f504f6f353602faab7cfb156dcec01cffe05c6bd9d25293eb147	["*"]	2024-06-08 00:32:51	\N	2024-06-08 00:32:42	2024-06-08 00:32:51
82	App\\Models\\User	26	api	73fbbccd21feab746f3ee4cbc5c4bfa66a2cb0a6a6799fd9c92abf0e07a806aa	["*"]	2024-06-08 00:23:26	\N	2024-06-07 20:05:09	2024-06-08 00:23:26
87	App\\Models\\User	31	api	82d34f1b07577193c78aa35bb982fb62c1724333ed5f33d60d97de6315888b98	["*"]	\N	\N	2024-06-08 01:41:49	2024-06-08 01:41:49
88	App\\Models\\User	31	api	fbe71e6af8e574e85bb6368d42effb91f050670470ecf628a6b4deea37394495	["*"]	\N	\N	2024-06-08 01:44:29	2024-06-08 01:44:29
90	App\\Models\\User	31	api	57beeb5245fd1995c09982f57aff4908a3a8b3fd3fe778a995a30508b47eb463	["*"]	\N	\N	2024-06-08 02:46:50	2024-06-08 02:46:50
91	App\\Models\\User	31	api	5354493a759319e9e5c30d17503ab53116f433dee6a42600f9a6b60dedcd690f	["*"]	\N	\N	2024-06-08 03:52:05	2024-06-08 03:52:05
92	App\\Models\\User	31	api	1b57d94a36c87829ee3fe24214e033d03a254baa658ffbfe2b2ff934fb224360	["*"]	\N	\N	2024-06-08 03:52:26	2024-06-08 03:52:26
93	App\\Models\\User	31	api	4470e57d639ea45a08d3878b7ebc7fbd24dd91d906ba7c45a0f761380a443278	["*"]	\N	\N	2024-06-08 03:53:22	2024-06-08 03:53:22
212	App\\Models\\User	47	api	a945f12bbd232dbf4e955f2683aa35ac90f3b24cda3ad76d8ea5de1fb35db1b8	["*"]	\N	\N	2024-06-12 13:47:47	2024-06-12 13:47:47
94	App\\Models\\User	4	api	83f8e921ea2b4ae3acb4795fb3ceea9e1dcf457ec6b305546b76e4349a299c63	["*"]	\N	\N	2024-06-10 11:43:31	2024-06-10 11:43:31
193	App\\Models\\User	45	api	6ec4ff667c4d11a9451134336e04de571f5b35d8cc5dbf7cb7bf37cda5324f52	["*"]	\N	\N	2024-06-12 06:42:55	2024-06-12 06:42:55
248	App\\Models\\User	50	api	d1905c8ebf09de100cb8a9d4281463ea11a582b8552835e8918108fe99beda0b	["*"]	\N	\N	2024-06-13 08:30:27	2024-06-13 08:30:27
97	App\\Models\\User	9	api	1ff687c114f653aebf59cab5746c37db5fcdac4d7c71e9eee2e62ced802b661f	["*"]	\N	\N	2024-06-10 13:30:17	2024-06-10 13:30:17
216	App\\Models\\User	30	api	89fc2a4889a46684aa3dee51e2253379c58267ff0cc71e12c6aedf30f53ae4d2	["*"]	2024-07-15 09:36:31	\N	2024-06-12 16:23:01	2024-07-15 09:36:31
229	App\\Models\\User	50	api	17c6ba442d388f372ed76dd637777ecadb39ecd50f9812769dcd4bd091c92069	["*"]	2024-06-12 22:33:07	\N	2024-06-12 21:42:59	2024-06-12 22:33:07
1217	App\\Models\\User	254	api	4334ae86ea294d13e88222133255e2abf1b320927d4de968b621cdbfda3ab439	["*"]	2025-02-25 09:04:28	\N	2025-02-24 22:44:45	2025-02-25 09:04:28
213	App\\Models\\User	47	api	5d1f41886e85c139317d5fc6bd9938847a45d6459cb4397a740ac8a895342bfb	["*"]	\N	\N	2024-06-12 13:47:56	2024-06-12 13:47:56
280	App\\Models\\User	63	api	bd4af8db4cda0949e2c33f4a76f63dc059878ac0c2ebc412d4d952d9b164fd04	["*"]	2024-06-13 14:56:46	\N	2024-06-13 14:56:36	2024-06-13 14:56:46
215	App\\Models\\User	47	api	31cab1da0c2299a1c63f5714c7fbcca7a75145ba84b519200eea5c581030431c	["*"]	\N	\N	2024-06-12 13:50:21	2024-06-12 13:50:21
221	App\\Models\\User	15	api	c339871d78f4f54f39008de52cb7f7632f322a1ba468b349da6110e8d8a5d058	["*"]	2024-06-13 11:23:34	\N	2024-06-12 19:51:29	2024-06-13 11:23:34
282	App\\Models\\User	64	api	17d52b60f81e3352e43eddd4a3c0cc890f7022ed344642aa83c8a837135a6032	["*"]	\N	\N	2024-06-13 14:58:10	2024-06-13 14:58:10
239	App\\Models\\User	50	api	113b1077d44536884177d8c69ac39c298918b08335e3422c728cf098739ee32e	["*"]	2024-06-12 22:36:16	\N	2024-06-12 22:34:47	2024-06-12 22:36:16
258	App\\Models\\User	54	api	786b70e71ae464f24f4690d9c4f0cf2bbcf9549193b9b0f4d430d86cb6cb929b	["*"]	2024-06-13 11:25:29	\N	2024-06-13 11:15:07	2024-06-13 11:25:29
98	App\\Models\\User	9	api	f94d5a31de718e6ce84b8baaae1bcfba53cd8673e10dde0343f92743235ec662	["*"]	2024-06-10 13:56:54	\N	2024-06-10 13:30:31	2024-06-10 13:56:54
262	App\\Models\\User	15	api	a542f01e21ea30b25c7ad5fca91f7fe6eb2a01e2b099bd60fac23b78113f93db	["*"]	\N	\N	2024-06-13 11:51:12	2024-06-13 11:51:12
217	App\\Models\\User	46	api	f21e6bbe2e7c9a9d102eae121dd5f9722227401977f492b915926f3c68d700cc	["*"]	2024-06-12 17:10:07	\N	2024-06-12 16:52:35	2024-06-12 17:10:07
100	App\\Models\\User	9	api	3862c575d1ee3577bec4dff94a00558d3daffb0c09bacdac2db296329537d3ef	["*"]	\N	\N	2024-06-10 13:57:32	2024-06-10 13:57:32
266	App\\Models\\User	33	api	51d43e9d9ee013aae7586bcf871b09c33e6ebac9b77371de38f015a47032f4e2	["*"]	2024-06-13 13:24:17	\N	2024-06-13 13:23:50	2024-06-13 13:24:17
99	App\\Models\\User	9	api	1ff1bed29f4bc0a30bfea7ead47c8dcc087efef44c08797054ef2308db764e95	["*"]	2024-06-10 14:00:19	\N	2024-06-10 13:57:03	2024-06-10 14:00:19
227	App\\Models\\User	50	api	daaf20987afcc1c47b2c6ffed6a8f48cca601d953a79f37f509bc935fe25fef4	["*"]	\N	\N	2024-06-12 21:41:11	2024-06-12 21:41:11
101	App\\Models\\User	9	api	258998583d5c6dea7ad8f7b542847b123d5b9ecd47434be67e64ff5a75df2d72	["*"]	2024-06-10 14:11:56	\N	2024-06-10 14:00:32	2024-06-10 14:11:56
102	App\\Models\\User	9	api	6c6222e2b3f7dbbb63ea8e77a69e42272ab06d1cb13225ed63da3c5c837cbf06	["*"]	\N	\N	2024-06-10 14:12:14	2024-06-10 14:12:14
103	App\\Models\\User	9	api	2c42d22a1726c87036169463edb69659359760331c20f8220ac3df0b505c6307	["*"]	\N	\N	2024-06-10 14:12:27	2024-06-10 14:12:27
104	App\\Models\\User	9	api	1adbbb950a205453f6f94f60f06e12d40bfe25ca018a3d946b4fb217493f2bcf	["*"]	\N	\N	2024-06-10 14:13:57	2024-06-10 14:13:57
105	App\\Models\\User	9	api	6aaa0c1bf5a523655b7822451fdc894cb5bb7ddc7a524af9445361e52909f921	["*"]	\N	\N	2024-06-10 14:14:23	2024-06-10 14:14:23
106	App\\Models\\User	9	api	74df83f1dc7b3d1410c3ddb6f4c946a17870e7af430920a3dffbc6b826763005	["*"]	\N	\N	2024-06-10 14:15:08	2024-06-10 14:15:08
270	App\\Models\\User	55	api	c8c37851946495fe7d5e40ff99add8b6ae3a4f7332614bb253af321045d9edbd	["*"]	2024-06-13 14:36:35	\N	2024-06-13 14:28:56	2024-06-13 14:36:35
254	App\\Models\\User	33	api	49d118456e3591b0dc53655079a6a2a3a8e6a15eb8758f257894727ff1dbb966	["*"]	\N	\N	2024-06-13 09:44:17	2024-06-13 09:44:17
235	App\\Models\\User	50	api	3812372c0c4176f7759732d95257301f72d45617f3ff74a7a9dc9cc597a7b7d2	["*"]	\N	\N	2024-06-12 22:29:59	2024-06-12 22:29:59
245	App\\Models\\User	33	api	3b07f359edc3f7a7c33e1241cd35955a05305a9ccca8b144514f0b828bac0c59	["*"]	\N	\N	2024-06-13 02:06:06	2024-06-13 02:06:06
288	App\\Models\\User	54	api	dfb14a7fab4b2d4593ab32b95f5124efe3d527e3fb1cc5dd6961e9f3c512ebab	["*"]	\N	\N	2024-06-13 16:34:10	2024-06-13 16:34:10
237	App\\Models\\User	50	api	c1aee0c066a5ae772212d52e18679072496c5cafd43517e34c4bac3cf143818b	["*"]	\N	\N	2024-06-12 22:31:01	2024-06-12 22:31:01
290	App\\Models\\User	66	api	1ad9c8b39342b7d31e11492083f7a8246c6bc3f972e2736202198778f0c416d0	["*"]	2024-06-13 16:39:47	\N	2024-06-13 16:38:12	2024-06-13 16:39:47
272	App\\Models\\User	57	api	52c6a1db2b731cfa8ec2b661614f4bd6cbb765043d2e740ecdaebc0492597ec4	["*"]	2024-06-13 14:42:46	\N	2024-06-13 14:39:41	2024-06-13 14:42:46
274	App\\Models\\User	57	api	c821e245eed7fbadcfcd83de34cb5dc336b016ba72f958506f5fa8b152068fcd	["*"]	\N	\N	2024-06-13 14:43:13	2024-06-13 14:43:13
304	App\\Models\\User	69	api	47bcf2ba758eee231240ee54869440cad47fad142de71501c54455b84d31f7b8	["*"]	\N	\N	2024-06-13 20:56:48	2024-06-13 20:56:48
296	App\\Models\\User	67	api	3cda5b7fb4b0109e5694ed9a7fa5c672a479c17b4c297869d091263fede5f750	["*"]	\N	\N	2024-06-13 20:47:01	2024-06-13 20:47:01
298	App\\Models\\User	67	api	4556d43447a3fc36eb1fb30cf2f76aad7f633cb4bcf561ce6509f5b687bfe29c	["*"]	\N	\N	2024-06-13 20:49:00	2024-06-13 20:49:00
300	App\\Models\\User	67	api	e06eb55849558b2b776fd11a83fc1491c27fb92a67e87035d57c0cecea34467e	["*"]	\N	\N	2024-06-13 20:51:20	2024-06-13 20:51:20
302	App\\Models\\User	69	api	860d859e87c0702905579256a72a6bcb854879b393178e5b27047396916c4d0f	["*"]	\N	\N	2024-06-13 20:53:10	2024-06-13 20:53:10
310	App\\Models\\User	68	api	a24733ee6ca2b99798699798df15aaa5e6efc1b1fbff3d5db5f934f7460885b9	["*"]	\N	\N	2024-06-14 02:09:22	2024-06-14 02:09:22
312	App\\Models\\User	68	api	4ad01ce39641a77368e07599ebdbbe5eea0f4e9c6b7bf4269eb31a39b01bf1e9	["*"]	\N	\N	2024-06-14 02:12:36	2024-06-14 02:12:36
314	App\\Models\\User	68	api	ea123527c06ad6eefd3d03c912dd78dbff1e276a4455e2de28ce45cbd02dd7ff	["*"]	\N	\N	2024-06-14 02:16:43	2024-06-14 02:16:43
316	App\\Models\\User	68	api	73edf1dae925dffa47bf7ed452a8b421847677684cd19d45daf9abaa885844ad	["*"]	2024-06-14 02:29:19	\N	2024-06-14 02:27:25	2024-06-14 02:29:19
318	App\\Models\\User	68	api	0e0c7c17fdddac603a8857ecb0d7984a498d78b74077c232b0718659064f8371	["*"]	\N	\N	2024-06-14 02:29:43	2024-06-14 02:29:43
107	App\\Models\\User	9	api	5ee22e91d74c74ce0762b2c6325bc1a41a2f434c09a20ffd04206c846d8de9eb	["*"]	\N	\N	2024-06-10 14:16:01	2024-06-10 14:16:01
198	App\\Models\\User	48	api	89c64af651a202ffbf27d6ed391ce493fdd9768cd454d8e366e96e6cbfec89ed	["*"]	\N	\N	2024-06-12 10:18:23	2024-06-12 10:18:23
108	App\\Models\\User	9	api	3e02548084a349e9bef57bfb84e9d2218f3ce93819e1865c043865ceae34d9cc	["*"]	2024-06-10 14:23:56	\N	2024-06-10 14:17:36	2024-06-10 14:23:56
202	App\\Models\\User	15	api	ffbb3eda467fc0d90593db8d1be472e56286f694e6308c6227786879a172f413	["*"]	\N	\N	2024-06-12 11:25:34	2024-06-12 11:25:34
143	App\\Models\\User	9	api	bce83a9932465ed44946ff3fcc421791b08d548bc2d1320d8dd5ee67c998f853	["*"]	\N	\N	2024-06-11 10:44:00	2024-06-11 10:44:00
206	App\\Models\\User	30	api	a1633741205b0e49a7a76ec84823a719901c92b8de43453f4498d5a84cd7e7cd	["*"]	\N	\N	2024-06-12 12:32:10	2024-06-12 12:32:10
209	App\\Models\\User	47	api	43b4a468a5b7efd238253ea8c354c0e93356f493bd9925370bec9863fcc283c0	["*"]	\N	\N	2024-06-12 13:46:12	2024-06-12 13:46:12
114	App\\Models\\User	32	api	a4974b0e7141aaadcaebfe9cc5af92001361a5e2146f7ed01375e68bd50be6e0	["*"]	\N	\N	2024-06-10 15:18:14	2024-06-10 15:18:14
110	App\\Models\\User	9	api	7dc1d10dd63d190f5df81b3254100df99efc77f692a2ecf388851a7c02129f60	["*"]	2024-06-10 16:01:21	\N	2024-06-10 14:31:45	2024-06-10 16:01:21
158	App\\Models\\User	9	api	4b36e8b754bf95ec9c006ea26d2eb30cacb26c023a9bbca974c41ea25ed675b9	["*"]	\N	\N	2024-06-11 13:35:18	2024-06-11 13:35:18
144	App\\Models\\User	9	api	6ad04653850519d4cb3969dd41c6333ca483e926be4b0d77e4469e17b16a473c	["*"]	\N	\N	2024-06-11 10:45:42	2024-06-11 10:45:42
109	App\\Models\\User	9	api	1f6bd1ab2ae5c8b734fd5a66257a4cfebbad2af9cc3da792e289abb0653b2b92	["*"]	2024-06-10 14:31:36	\N	2024-06-10 14:24:10	2024-06-10 14:31:36
164	App\\Models\\User	15	api	17abbd42a2f28e4a92d3de7ada59457520771fd5c45503e71ed4a27e31f40f1a	["*"]	\N	\N	2024-06-11 14:49:42	2024-06-11 14:49:42
150	App\\Models\\User	35	api	9b95f9fa83ff188091be5b15cec104d4eb76dd8fafdb8b0d9747fe6ae182fc4a	["*"]	\N	\N	2024-06-11 12:57:16	2024-06-11 12:57:16
159	App\\Models\\User	40	api	6723c4c76223716b9436950d9649c1fcccfbb4d7d0c8f6acac41bb0092390203	["*"]	\N	\N	2024-06-11 13:37:53	2024-06-11 13:37:53
120	App\\Models\\User	30	api	a5142cbf9553a8052e68c2c81db7ea3d72b1810db9cbf86df2940c736ed705e5	["*"]	\N	\N	2024-06-10 19:48:33	2024-06-10 19:48:33
145	App\\Models\\User	32	api	e9d3c146279fbd113c0d922e345844f431896872948c5fa735ea6879471e1979	["*"]	2024-06-11 10:56:14	\N	2024-06-11 10:56:13	2024-06-11 10:56:14
137	App\\Models\\User	33	api	3ceb0fd413832f34b0130514e582fe3bf832e0d812e3d4c910d3f48bfd5e732c	["*"]	2024-06-11 09:22:07	\N	2024-06-11 09:12:47	2024-06-11 09:22:07
132	App\\Models\\User	34	api	fb7204f6ace7f0c390f191b1e21f8e0af5ef71012ae866eaad113d18292d0893	["*"]	\N	\N	2024-06-10 21:25:30	2024-06-10 21:25:30
165	App\\Models\\User	15	api	4be3da8608cb1e922e2a6b40fe5c6565d702d28d5bc1dd82cf064b3241036907	["*"]	\N	\N	2024-06-11 14:51:11	2024-06-11 14:51:11
133	App\\Models\\User	30	api	7429ea549a730c94f8fb0fdda813cd615e52192a082e1c0bcf28622216ffc0bd	["*"]	\N	\N	2024-06-10 21:52:19	2024-06-10 21:52:19
134	App\\Models\\User	30	api	ebb990092de5f4e6cacdf656def2416a884e444b714275fcd64681f9833cdb2b	["*"]	\N	\N	2024-06-10 21:52:38	2024-06-10 21:52:38
173	App\\Models\\User	43	api	a79b9860a1e97db456e2f94b0b3d322fb2f07c5c5e85435218dc958b0839f3e5	["*"]	\N	\N	2024-06-11 17:25:21	2024-06-11 17:25:21
167	App\\Models\\User	38	api	e813644e4f38a1bc148cac7c3525f977cdeb8ca9b99db78339d2e036c1dddfd4	["*"]	2024-06-11 15:29:52	\N	2024-06-11 15:28:59	2024-06-11 15:29:52
1049	App\\Models\\User	264	api	160afe8c37de312f354772a6b701c150359b2571d984f098ced452714218fe28	["*"]	\N	\N	2025-02-09 13:11:10	2025-02-09 13:11:10
151	App\\Models\\User	37	api	3b90ff2ab704d6139e45fc10c6b588981d420bd48577614f7c0fb0f4d24e63d5	["*"]	\N	\N	2024-06-11 13:02:35	2024-06-11 13:02:35
152	App\\Models\\User	38	api	af3049f373ad8ee3c19a6d35026e6fdfed89e97bcf1eae6540e16e065e739b48	["*"]	\N	\N	2024-06-11 13:09:49	2024-06-11 13:09:49
175	App\\Models\\User	43	api	b1afcb733b7eb470db19019af69fd921cf539639d35cb1e03303a170039176e6	["*"]	2024-06-11 18:22:41	\N	2024-06-11 17:31:26	2024-06-11 18:22:41
142	App\\Models\\User	9	api	4675027ba405ce44cf1c3c275683457baeb7f22082ad8ac58a7f0909d46f32eb	["*"]	\N	\N	2024-06-11 10:43:45	2024-06-11 10:43:45
174	App\\Models\\User	43	api	a5c2f7e7b11a29cb94c6b393b6290d425c217f1c3d29735cd2e86a95c3fc9bea	["*"]	2024-06-11 17:25:45	\N	2024-06-11 17:25:45	2024-06-11 17:25:45
156	App\\Models\\User	39	api	ca803424c35f0cb88f8e58ef8045f15575ab09c5e2f1ab2ea98ca8ed3cb532c2	["*"]	\N	\N	2024-06-11 13:32:06	2024-06-11 13:32:06
148	App\\Models\\User	36	api	d2f7806ff098143c10407034585d87ec98988601a3fb66d5fb3c553eb188677d	["*"]	\N	\N	2024-06-11 12:45:07	2024-06-11 12:45:07
166	App\\Models\\User	35	api	841fc831964a3b4f4586b0687432384a86326d3816766393a6dad1149e4119d8	["*"]	2024-06-11 16:09:01	\N	2024-06-11 15:19:00	2024-06-11 16:09:01
154	App\\Models\\User	35	api	5f9330007ce3cd7d0679250a55f62884575994cc6134aeeb68743e8a4ce37ed5	["*"]	2024-06-11 13:39:59	\N	2024-06-11 13:30:08	2024-06-11 13:39:59
160	App\\Models\\User	9	api	9e15cb96ce007c02fa044c6f503abe93655889fda7db2dde186d895203bd3ada	["*"]	\N	\N	2024-06-11 13:43:26	2024-06-11 13:43:26
161	App\\Models\\User	9	api	117b451263508c71a212ff3f456734dfe2f7894a21d589cccfc8983bfe50bd8f	["*"]	\N	\N	2024-06-11 13:43:32	2024-06-11 13:43:32
169	App\\Models\\User	4	api	e135e47ef524119444ab7fa708330d41e344757d9a8071c2d0f162fb1b3b9e30	["*"]	\N	\N	2024-06-11 15:59:21	2024-06-11 15:59:21
168	App\\Models\\User	42	api	83456210e4c14d1d20135b5ea6547870b60ee858000e98c59d45ced1091650e6	["*"]	2024-06-11 16:22:59	\N	2024-06-11 15:38:46	2024-06-11 16:22:59
171	App\\Models\\User	42	api	15b869b6ccd10298fa28f14fb757fd7f7d95fc794f6f963d96bade62ebd7744d	["*"]	\N	\N	2024-06-11 16:23:00	2024-06-11 16:23:00
178	App\\Models\\User	33	api	2374487beaf8a99bb6183e90839a6126c54592b3b26bd8de7dc681391732a1f2	["*"]	\N	\N	2024-06-11 19:42:00	2024-06-11 19:42:00
181	App\\Models\\User	44	api	fdfdf3203dc7e0084817664356c131b5a26ef03b33628d679f08cbb8f8af6524	["*"]	2024-06-11 21:22:22	\N	2024-06-11 19:53:12	2024-06-11 21:22:22
179	App\\Models\\User	35	api	4e1ab16697eb801e297e6d119ee711b5e7f8ab5b588c99b4de397708ae0fd2a4	["*"]	2024-06-11 21:16:10	\N	2024-06-11 19:46:16	2024-06-11 21:16:10
180	App\\Models\\User	44	api	da18824c5ebfe27a165ea66130ee06f052f51fe9eb9fa94efbdf03b766b807b2	["*"]	\N	\N	2024-06-11 19:50:52	2024-06-11 19:50:52
183	App\\Models\\User	44	api	83d9c6bea941378c6ef1100deb4ea8525ac138c672d55f738f3d353980bf69b1	["*"]	\N	\N	2024-06-11 20:19:22	2024-06-11 20:19:22
184	App\\Models\\User	35	api	622fa075d47ad659fdd9592defbb483751048c7a4fccab0d36552dc5fc791bb3	["*"]	\N	\N	2024-06-11 21:08:55	2024-06-11 21:08:55
185	App\\Models\\User	35	api	3e19343bc9712ba201624abf75355f8b24e72c9b9f24b67f76b5fcb33bb71ab4	["*"]	\N	\N	2024-06-11 21:12:19	2024-06-11 21:12:19
186	App\\Models\\User	35	api	05bd10d8988c4db677061d0f7d083a917b7a7e43faea2a7786bd6afb854083fa	["*"]	\N	\N	2024-06-11 21:12:28	2024-06-11 21:12:28
187	App\\Models\\User	35	api	2229b5dca90709902e8abac9ac058e7bf531dd70d1b9d02006e6b9c99f8e47c3	["*"]	\N	\N	2024-06-11 21:13:14	2024-06-11 21:13:14
188	App\\Models\\User	35	api	8f6591943b51af79903253178f35d536b0eddda08875fb151ccc568068032511	["*"]	2024-06-11 21:16:20	\N	2024-06-11 21:16:11	2024-06-11 21:16:20
335	App\\Models\\User	15	api	3441881c05598137558b657e302a3badad16bc918d7afdec7f069c0a8205ff18	["*"]	2024-06-15 13:15:57	\N	2024-06-14 10:48:41	2024-06-15 13:15:57
49	App\\Models\\User	4	api	ed2a3d267582c96ba72800b1ac41500aeddd25a6e3b3db387a97d04e2bf0f731	["*"]	2024-06-21 14:50:29	\N	2024-06-06 12:35:33	2024-06-21 14:50:29
265	App\\Models\\User	33	api	28d33b753b98110b8ed06c97370ba09b30b2575da30f67cda917c984b368e7e0	["*"]	2024-06-14 15:42:06	\N	2024-06-13 13:13:28	2024-06-14 15:42:06
353	App\\Models\\User	15	api	e47d69c53389ddf07f049d6976aa0dfc52165749634069a55676accbc3625149	["*"]	2024-06-14 14:03:43	\N	2024-06-14 13:42:57	2024-06-14 14:03:43
303	App\\Models\\User	70	api	3b7c3a5fcf8b23210f43f162ba9215ac2ad51d3f80ba251f527c82b5b44433d4	["*"]	\N	\N	2024-06-13 20:54:43	2024-06-13 20:54:43
305	App\\Models\\User	69	api	c74a5ee53a9b078101abb217ed5acad6d1b3cf1c0599a1d6b6c759a729004a88	["*"]	\N	\N	2024-06-13 20:56:53	2024-06-13 20:56:53
259	App\\Models\\User	54	api	d69c3d24c28d159113ae9361ca95ad2c20d624405f66076dedaf624bef8d8ee7	["*"]	\N	\N	2024-06-13 11:25:26	2024-06-13 11:25:26
236	App\\Models\\User	50	api	25dd6e0f836ebeac1997851f3df1b0be894ebc1d6514afc7cee430e6d2a5baed	["*"]	\N	\N	2024-06-12 22:30:22	2024-06-12 22:30:22
963	App\\Models\\User	251	api	e27891c8a5d97b6b0678751bfa44348cd31efc1d619795bd3421f16f2d77ad49	["*"]	2025-02-05 17:05:06	\N	2025-02-05 16:51:50	2025-02-05 17:05:06
261	App\\Models\\User	54	api	32a8c3ca2cb5a41ac16ddbba506be8e74d6e1a5e5a494023b537f38e10ac2569	["*"]	\N	\N	2024-06-13 11:25:41	2024-06-13 11:25:41
1225	App\\Models\\User	293	api	4a5815e19af087109b97f7dfc523941ba652c35ea28ddbd43577b8029adda2cf	["*"]	\N	\N	2025-03-09 23:21:03	2025-03-09 23:21:03
249	App\\Models\\User	50	api	59425dd2fbf7588432563aeeeac36d1d94439ac944be2676a7c4e6771886d1ae	["*"]	\N	\N	2024-06-13 08:30:51	2024-06-13 08:30:51
273	App\\Models\\User	57	api	2da9d09032b9f9aa36a20867cc6ccad478fe94527df156e66cd6d56b0e6bb493	["*"]	\N	\N	2024-06-13 14:42:46	2024-06-13 14:42:46
979	App\\Models\\User	255	api	bf6ed960442475f761b15b3d4becb279fa7701535267ad555500ba1eac645fd9	["*"]	2025-02-06 14:57:33	\N	2025-02-06 14:25:15	2025-02-06 14:57:33
287	App\\Models\\User	66	api	0c79bc876207a5d34f4c1bbafb15064ea8822d03cf7b9fe6cf3a4169d8a22ee0	["*"]	2024-06-13 16:40:25	\N	2024-06-13 16:33:23	2024-06-13 16:40:25
210	App\\Models\\User	47	api	884f7fcd65fbd07f29b98ffc3b3796fba84f115e0da7c5562c983cbdf24e0f34	["*"]	\N	\N	2024-06-12 13:46:47	2024-06-12 13:46:47
189	App\\Models\\User	35	api	0a3dae7c9f13daff7aa0b682468f1a8f6ac857a9a3e1ee4213c36469d8f09b62	["*"]	2024-06-12 06:53:08	\N	2024-06-11 21:16:21	2024-06-12 06:53:08
207	App\\Models\\User	30	api	a7eddb22e6e2e34f62081e7d73c290e4ff657152fb77c42cd005fe43ac93f4b9	["*"]	2024-06-12 19:05:50	\N	2024-06-12 12:49:48	2024-06-12 19:05:50
199	App\\Models\\User	49	api	e037c7cb4afa1f828358ba858bc4a5e119332e791c4aca70e158e376a4d77706	["*"]	\N	\N	2024-06-12 10:39:46	2024-06-12 10:39:46
214	App\\Models\\User	47	api	e66deb882cc80d8a83f4c2530e46673149e446cf539acd62d42a4c2ae956c000	["*"]	\N	\N	2024-06-12 13:48:42	2024-06-12 13:48:42
323	App\\Models\\User	77	api	e8195327e2f966c916865991f80e8577f1d0114cd9919e5404c23b3f15bf39d9	["*"]	2024-06-14 08:49:04	\N	2024-06-14 08:48:41	2024-06-14 08:49:04
263	App\\Models\\User	33	api	93e11ad6e74e8f7795e881bc9171ffd122750456925b48b286c8470a0fe985fb	["*"]	\N	\N	2024-06-13 13:04:53	2024-06-13 13:04:53
230	App\\Models\\User	51	api	f270fce788592ebf73ad060121e7242181c9e7e7edf45ddb1678204c5932147d	["*"]	\N	\N	2024-06-12 21:45:00	2024-06-12 21:45:00
232	App\\Models\\User	52	api	807a64e3aa0ca6f36d990ec27c39176c550ce784f992d9947334a63293b64574	["*"]	\N	\N	2024-06-12 22:06:35	2024-06-12 22:06:35
222	App\\Models\\User	48	api	8473191a4bf31be9f0e64aaa0273caeba3ca3d5fc855f1f524189e343ba26d25	["*"]	\N	\N	2024-06-12 20:36:32	2024-06-12 20:36:32
315	App\\Models\\User	68	api	6079ec6186cd804b677793e64c7ee309fe0a56da9b53921c7078fe8c8951629e	["*"]	2024-06-14 02:22:23	\N	2024-06-14 02:20:40	2024-06-14 02:22:23
331	App\\Models\\User	67	api	b830b1a663bf716cfed54a8b202ee961871cc281a51e96efbd97a3b20945f5d9	["*"]	2024-06-14 10:43:14	\N	2024-06-14 10:42:56	2024-06-14 10:43:14
220	App\\Models\\User	15	api	bafc2caeb37f2edcbb688b8ae3caac248aa4b6fe7e8e65db536361547a4a92e7	["*"]	2024-06-13 13:35:26	\N	2024-06-12 19:44:26	2024-06-13 13:35:26
267	App\\Models\\User	33	api	160eca3bf47a50fc0bea3cc3479523243c0906658fd15d89e56184150691b9c4	["*"]	\N	\N	2024-06-13 13:49:51	2024-06-13 13:49:51
269	App\\Models\\User	33	api	35745db4112f395bba61946995a803db8fa7cb3941764cda14e49cc7f5bd89c8	["*"]	\N	\N	2024-06-13 14:14:14	2024-06-13 14:14:14
281	App\\Models\\User	64	api	fefe5dea7830004de41a875b3d2f627f6436dd55b2f7a8ffe6db37f83794eda8	["*"]	2024-06-13 14:58:10	\N	2024-06-13 14:56:47	2024-06-13 14:58:10
283	App\\Models\\User	64	api	9683ac85804114ac42046dc1c25916aff8400b76ada1534e3fbbbf8a433dc672	["*"]	\N	\N	2024-06-13 14:58:27	2024-06-13 14:58:27
309	App\\Models\\User	68	api	3837452efcd2dab8d251f631bcfda70d21d07aa5f30549c74bcc5bf005feb417	["*"]	\N	\N	2024-06-14 01:53:44	2024-06-14 01:53:44
295	App\\Models\\User	67	api	28606049cd2a311c600f002e88b78bddf0f2f4b974d3d4c08a15af8f82f95c4c	["*"]	2024-06-13 20:45:16	\N	2024-06-13 20:39:13	2024-06-13 20:45:16
297	App\\Models\\User	68	api	79cbe49f9cc8cc4a273ad6836ae0350eed5f74f0f9060997f04a64df2daa8291	["*"]	\N	\N	2024-06-13 20:48:59	2024-06-13 20:48:59
299	App\\Models\\User	68	api	c0471f689f01df1db97a9b3342d888046a4b2ab88c95b7cf1e14ab13dba88381	["*"]	\N	\N	2024-06-13 20:51:03	2024-06-13 20:51:03
311	App\\Models\\User	68	api	7dd43ca8fd02af5130bf13b1246cacee48bfaf753c9b40d020fedc332c877a09	["*"]	\N	\N	2024-06-14 02:11:12	2024-06-14 02:11:12
301	App\\Models\\User	64	api	eba9676844637bf90853ae8ce5953f8ce58c0dc9136c9e272f8c7c30570b4f61	["*"]	\N	\N	2024-06-13 20:52:59	2024-06-13 20:52:59
313	App\\Models\\User	68	api	0c5c939e5bc119fff3ee1fa6369f8d2c9852f1a964935c0cdec62143c9cc613e	["*"]	2024-06-14 02:15:03	\N	2024-06-14 02:14:51	2024-06-14 02:15:03
319	App\\Models\\User	68	api	effcccf48c011d0fb4beb48d6c2f0404110d839162b984328d4f01224713a494	["*"]	\N	\N	2024-06-14 02:31:56	2024-06-14 02:31:56
325	App\\Models\\User	66	api	9c0c2d5c9482b2ef8e789b10161eb8e435a97a8944b03b49a0fb41df6722a528	["*"]	\N	\N	2024-06-14 08:51:09	2024-06-14 08:51:09
334	App\\Models\\User	77	api	1f1e9e58eecf46c5f6b3791f529befb4ac2787f55b74ac845ec5094c66dd2a8b	["*"]	2024-06-14 10:47:57	\N	2024-06-14 10:47:38	2024-06-14 10:47:57
332	App\\Models\\User	67	api	2bdab408dc3d7bbe6d3ace91a1feff44dc416187678025b30abaf92745eaac26	["*"]	2024-06-14 10:47:37	\N	2024-06-14 10:44:46	2024-06-14 10:47:37
336	App\\Models\\User	80	api	0abeb6cb5e11cb67684b7ade06139cad571926afd8c271adc51b468be65fd613	["*"]	2024-06-14 10:51:19	\N	2024-06-14 10:50:45	2024-06-14 10:51:19
338	App\\Models\\User	67	api	6d65e408f2d49277cb8d62ebafbd1c99025f3f4ca38e99e722f8113c9a990186	["*"]	2024-06-14 10:52:47	\N	2024-06-14 10:52:10	2024-06-14 10:52:47
387	App\\Models\\User	84	api	3a7c7d85806935181aa38dfbe22ed7f9d118cf70d47c6111bc31209be4ca993b	["*"]	2024-06-15 15:23:30	\N	2024-06-15 15:22:46	2024-06-15 15:23:30
286	App\\Models\\User	15	api	c96bdca733dae22dead5ad39675fea4e0e72be46f0101eab1750d3a39d3aabe6	["*"]	2024-06-14 16:55:47	\N	2024-06-13 15:47:33	2024-06-14 16:55:47
340	App\\Models\\User	81	api	2cc221f7939da8715c8bc5284e481c66c1b6bb1ae5eacbd5d5bcb0ff389a2768	["*"]	2024-06-14 10:59:05	\N	2024-06-14 10:55:38	2024-06-14 10:59:05
368	App\\Models\\User	15	api	4371e3331fe5351cf8dfc1428f51fe4d9953e6652dc13c8f0ad42576a5873205	["*"]	2024-06-14 20:01:44	\N	2024-06-14 17:55:37	2024-06-14 20:01:44
341	App\\Models\\User	67	api	db39d4370e7169abe0b7894473f780489d610585650be4ee07893f4e48c92da3	["*"]	2024-06-14 11:03:53	\N	2024-06-14 11:03:00	2024-06-14 11:03:53
342	App\\Models\\User	67	api	5942ef4829dc271e872c5a2471e779de134fef9c92652b1d49912c76a55e94a7	["*"]	\N	\N	2024-06-14 11:03:53	2024-06-14 11:03:53
1226	App\\Models\\User	294	api	51b8c33a6f62aa9726799c4953dbbee9f87bded98e37917f5c107a9e8e2eca19	["*"]	\N	\N	2025-03-09 23:24:40	2025-03-09 23:24:40
356	App\\Models\\User	30	api	7335b87639dbdd9753af7cf3889e40e84be2f70275c38646894b4bb884588830	["*"]	2024-06-14 15:45:23	\N	2024-06-14 14:47:56	2024-06-14 15:45:23
344	App\\Models\\User	80	api	49c8112c1ba520e17859600b16d6c078110c0ef7c74a46dfaca200fccdaeb24c	["*"]	\N	\N	2024-06-14 11:09:48	2024-06-14 11:09:48
358	App\\Models\\User	83	api	0aadd56b08b3ef2786eef1418aa06c2ed7ac6609fcbacbc027f0cd9e7c323a6b	["*"]	2024-06-14 15:45:34	\N	2024-06-14 15:44:55	2024-06-14 15:45:34
345	App\\Models\\User	67	api	2a2769216aa1948e3fbfed408dc685f8d7fe450478281268a4f8f9a39857e4fb	["*"]	\N	\N	2024-06-14 11:11:05	2024-06-14 11:11:05
361	App\\Models\\User	30	api	a56e3b4a4865de231fd2550a83e4a86d92282d6ba351a95be1a041c8df065cc2	["*"]	2024-06-14 15:48:53	\N	2024-06-14 15:48:52	2024-06-14 15:48:53
346	App\\Models\\User	66	api	61aad7d138d190c643bbe38825f634a4d187cec00e039439ab64574713348011	["*"]	2024-06-14 11:15:11	\N	2024-06-14 11:12:08	2024-06-14 11:15:11
955	App\\Models\\User	251	api	fc901d1eb30ad21722bb8a27d64fb18af54abc96b6c1c2e29c29d90c6cb19368	["*"]	2025-02-05 14:05:40	\N	2025-02-05 13:02:11	2025-02-05 14:05:40
373	App\\Models\\User	29	api	cc4ac72891657913bd10488ba6c7d1de307b7b0bcf336b71e6ad197d84266c7f	["*"]	2024-06-15 01:13:28	\N	2024-06-15 01:13:21	2024-06-15 01:13:28
349	App\\Models\\User	66	api	1412cad6c6ea96c229d705745da978f7a12d8756bc87b7d6d7b57dfd35295a77	["*"]	\N	\N	2024-06-14 11:23:52	2024-06-14 11:23:52
362	App\\Models\\User	82	api	fd081e03926ae3fe884389e001f8ed0181a6781e5290c764963e46e29abb2edd	["*"]	\N	\N	2024-06-14 15:50:52	2024-06-14 15:50:52
378	App\\Models\\User	15	api	6a03a6dc33e91198aecf863545f4b499c998f04bb5fa3b08300a821f9577d880	["*"]	2024-06-15 13:02:08	\N	2024-06-15 12:01:33	2024-06-15 13:02:08
386	App\\Models\\User	84	api	27a0109e55f03b1d60fa94e93ede038d908e9e8af20de9d2d3919a335cd29816	["*"]	2024-06-15 15:19:47	\N	2024-06-15 15:19:46	2024-06-15 15:19:47
384	App\\Models\\User	86	api	7417718e6a84e47d572fdd8fb58d049890453c6bed8b6af6e80eca835861ad77	["*"]	\N	\N	2024-06-15 15:08:30	2024-06-15 15:08:30
350	App\\Models\\User	30	api	fa1171f0b4ce54063d898e0ca3084bb2dec4bfd9f781b3079fec76ccc6773810	["*"]	2024-06-15 15:20:22	\N	2024-06-14 11:26:35	2024-06-15 15:20:22
360	App\\Models\\User	82	api	c2c183ae355213f9a31f53bb2eee75afab7abca9f9d899a71387ca9f5acbb310	["*"]	2024-06-14 17:03:28	\N	2024-06-14 15:48:22	2024-06-14 17:03:28
372	App\\Models\\User	82	api	6c533529b10816a48508278c1b97d24459561710604a1d7e4ecab1cd0e917cf7	["*"]	\N	\N	2024-06-14 21:50:28	2024-06-14 21:50:28
964	App\\Models\\User	251	api	b53d13d273716053ae67261c3b953fae50a8d6f43f3034648d7d724ddff6a39b	["*"]	2025-02-05 18:07:34	\N	2025-02-05 18:04:11	2025-02-05 18:07:34
365	App\\Models\\User	82	api	ce9fcdbd129a3713e9b7d5ec97650b89ea8a7e4b337ca3defa7ee124820fe4f7	["*"]	2024-06-14 21:52:48	\N	2024-06-14 16:49:43	2024-06-14 21:52:48
354	App\\Models\\User	30	api	7608b5461438b7cd7841a596f377bf028d10dc0510cfc6a33bd602c4f60951fd	["*"]	2024-06-14 14:21:18	\N	2024-06-14 14:21:18	2024-06-14 14:21:18
375	App\\Models\\User	82	api	c9a6edcb6f182966a0d428325db76e44b0ad08dd53eb173bf57a57e898cd1dae	["*"]	2024-06-15 10:00:04	\N	2024-06-15 08:48:19	2024-06-15 10:00:04
394	App\\Models\\User	87	api	dac61f8e344b923a0d7635205c470ca151ca1df5c76477e44f5a7ac82732fd08	["*"]	2024-06-27 18:10:30	\N	2024-06-15 19:51:35	2024-06-27 18:10:30
367	App\\Models\\User	30	api	7d9598a74864c1aacd9e08765c344784629d754585af1f56edaa99c57f9f767f	["*"]	2024-06-14 17:55:15	\N	2024-06-14 16:56:49	2024-06-14 17:55:15
376	App\\Models\\User	82	api	0aa670c39f5c5debb6785afd9cd0c58177f72d622080cbce16a5120f73595cd3	["*"]	2024-06-15 10:02:21	\N	2024-06-15 10:02:06	2024-06-15 10:02:21
374	App\\Models\\User	82	api	592a3dd4dc25664595b082f775867acd7e5f2f90ef98c6875cb359de49b34311	["*"]	\N	\N	2024-06-15 08:48:17	2024-06-15 08:48:17
370	App\\Models\\User	84	api	8840add510e340bbdbaa013402b71310e30c14a38af58a457df1d0e1ec5a6ab4	["*"]	\N	\N	2024-06-14 21:22:26	2024-06-14 21:22:26
371	App\\Models\\User	84	api	7d2d1f768b4cb99698188000d255f91cf7892a21a3bf79f340f77dc8f3ea1741	["*"]	\N	\N	2024-06-14 21:22:41	2024-06-14 21:22:41
382	App\\Models\\User	85	api	9189cfdb648327c523b7cf0ff2956c34de789a215cccc7b1f252158d51d8fd7c	["*"]	\N	\N	2024-06-15 14:47:03	2024-06-15 14:47:03
388	App\\Models\\User	30	api	cdff38a4aaaea7e32870a891484252126dbdd4a4a604b981624767bf850285ae	["*"]	2024-06-15 19:16:18	\N	2024-06-15 15:29:56	2024-06-15 19:16:18
385	App\\Models\\User	84	api	1fe473d5258262cdc0bf2598da73606c49d966fe4d0a2ae5c33d7af8c0d4dfa0	["*"]	\N	\N	2024-06-15 15:19:11	2024-06-15 15:19:11
395	App\\Models\\User	84	api	80a414230dbcf89a7ff7d43aebc6ff643156045e10072fa515ef0bba17189ee6	["*"]	2024-06-15 20:36:44	\N	2024-06-15 20:02:17	2024-06-15 20:36:44
366	App\\Models\\User	30	api	d7a79474e72ad8e3400e7905a373c19c96e0f933640786f11485b86805622b38	["*"]	2024-06-23 09:56:03	\N	2024-06-14 16:50:06	2024-06-23 09:56:03
392	App\\Models\\User	85	api	6bb26f4bc8a4bb620a5d48398374bb03933e66fe6fdd4dc66159ee55382d8f33	["*"]	2024-06-15 16:49:47	\N	2024-06-15 16:40:51	2024-06-15 16:49:47
390	App\\Models\\User	87	api	d5f636f96e03275b6722b19067f61f27f377aaf63b2e431d813934d6d58f4baa	["*"]	2024-06-15 19:44:59	\N	2024-06-15 15:36:00	2024-06-15 19:44:59
393	App\\Models\\User	88	api	1684889befcd4c6f5bd229b4c5bf75f25ecb2114916138f34b9c48a8fdf7d1cf	["*"]	2024-06-15 17:03:11	\N	2024-06-15 17:00:22	2024-06-15 17:03:11
402	App\\Models\\User	93	api	bf339affe38654788d3689bca6b4d9d39d8ea97ae0e31e85b9ec1eb638cb2819	["*"]	2024-06-21 11:16:55	\N	2024-06-16 11:36:16	2024-06-21 11:16:55
398	App\\Models\\User	89	api	873f7b2396acfc45a8c075f5827dd286d605c0a442520fa5ffa8f325c8fc81af	["*"]	2024-06-15 21:43:47	\N	2024-06-15 21:33:40	2024-06-15 21:43:47
397	App\\Models\\User	89	api	d33a66efde33af6a5d2ec89e693bc528d3e1bf212b5eb217176eb1b285d38f84	["*"]	2024-06-15 21:45:26	\N	2024-06-15 21:06:53	2024-06-15 21:45:26
399	App\\Models\\User	1	api	2b8c46c128f9c479b358558168c4dc400cf655042b7b92f194630dfbbfa36b93	["*"]	\N	\N	2024-06-16 10:32:05	2024-06-16 10:32:05
400	App\\Models\\User	1	api	a605d9c41306a32d1361c361d4baaf13a969d4b87b88064c9612aaa9169c98a4	["*"]	\N	\N	2024-06-16 10:32:11	2024-06-16 10:32:11
401	App\\Models\\User	92	api	7c0c1c17c048eec0a3708d86b1120af153c0b89c014c5d4e69d24bc846fbb4ac	["*"]	2024-06-16 11:37:49	\N	2024-06-16 10:59:35	2024-06-16 11:37:49
942	App\\Models\\User	246	api	4231581d6de791c7e3e50912000896986cb5fb38199ef9a4bb04e406473be7f2	["*"]	\N	\N	2025-01-08 12:14:55	2025-01-08 12:14:55
404	App\\Models\\User	93	api	bc53b80f895e52f7e58ddc90951b85bd2fa9145dcd2511272c726d231cf02e60	["*"]	\N	\N	2024-06-16 11:39:43	2024-06-16 11:39:43
406	App\\Models\\User	92	api	e1ea140c95a27d0cd03d9979bba6dd1b0bbc9e9debf6b619bf3bb158967e845b	["*"]	2024-06-20 10:47:23	\N	2024-06-16 11:56:36	2024-06-20 10:47:23
426	App\\Models\\User	99	api	d27fdaa120b01965257caeb6936ac555c1eea42b2de5da07dca5dffabffbb209	["*"]	2024-06-25 07:17:28	\N	2024-06-21 17:21:23	2024-06-25 07:17:28
420	App\\Models\\User	29	api	af57bbee204b3631bcc41002de9f9b2ff6f12290949981f98a4874b045b5f421	["*"]	\N	\N	2024-06-21 13:43:27	2024-06-21 13:43:27
405	App\\Models\\User	94	api	141665a8a10965435d90fc953f6a09b0ccf07f9d0248902a311387ea51ac2493	["*"]	2024-07-08 12:46:44	\N	2024-06-16 11:52:00	2024-07-08 12:46:44
421	App\\Models\\User	98	api	cd6bbb75e51ca5e8d0079a5dc8bfb7fd07c5b1d7dad7f3ba437f915456d519c7	["*"]	2024-06-21 14:01:02	\N	2024-06-21 13:56:51	2024-06-21 14:01:02
1000	App\\Models\\User	255	api	b825bc8df3d5f533d23881c603ff439df9f75986367a78ae2f7ec20dde078244	["*"]	2025-02-07 16:39:57	\N	2025-02-07 12:39:57	2025-02-07 16:39:57
411	App\\Models\\User	89	api	a97e451d7affaec328c69e00d8e6d3a6b14787dbcbde17eb4680e2713dff32e3	["*"]	2024-06-20 14:32:32	\N	2024-06-19 14:53:04	2024-06-20 14:32:32
407	App\\Models\\User	95	api	7342a06d8738848a9ebc35b1c430bfa69b37a5d7b296a3bb5d2037f69202f3ab	["*"]	2024-06-17 10:43:05	\N	2024-06-17 10:42:17	2024-06-17 10:43:05
412	App\\Models\\User	96	api	585a4e82dc82e3079810b4da9130f08e3da0f82a0835e5894344c430c19e4fbf	["*"]	2024-06-20 14:35:18	\N	2024-06-20 14:13:16	2024-06-20 14:35:18
414	App\\Models\\User	89	api	ca891331b9ad0d28056f1a3985305f43f963ef47639b610907660efab521d2b6	["*"]	2024-06-21 14:28:13	\N	2024-06-20 14:51:29	2024-06-21 14:28:13
410	App\\Models\\User	92	api	a02eba37b3a1e02531048a91219e864dff57cc4a5efefc7b01660094294842bd	["*"]	\N	\N	2024-06-17 12:28:30	2024-06-17 12:28:30
983	App\\Models\\User	255	api	930b9288c6327909c838d2551ff802326fbfc6304b0c1477ad6c90440838c0ff	["*"]	2025-02-06 19:39:19	\N	2025-02-06 19:04:09	2025-02-06 19:39:19
427	App\\Models\\User	100	api	593750b9031639687d676a32672925dfd1c7f8baefaf35fbee010949d32b6d66	["*"]	2024-08-16 22:59:04	\N	2024-06-21 19:20:09	2024-08-16 22:59:04
408	App\\Models\\User	92	api	065d104cbba78dfa83531daa8a454f8515051c623465dfe1e5c46993e3f5e76d	["*"]	2024-06-21 17:52:38	\N	2024-06-17 10:44:58	2024-06-21 17:52:38
970	App\\Models\\User	254	api	e7a2e2258c23327e2d8ce55dbff3eb5a2a9c8991c635d000f50ca35117057682	["*"]	2025-02-06 10:59:23	\N	2025-02-06 09:55:14	2025-02-06 10:59:23
989	App\\Models\\User	254	api	4c6fcd6b6bddd161ac0270ab92daf4df3a8e8ca7c37a01501c2267d6b349a773	["*"]	2025-02-06 22:57:02	\N	2025-02-06 22:18:56	2025-02-06 22:57:02
409	App\\Models\\User	92	api	0a1729b0cfac674e14fa15cfad02a0d425575fc836e0d0afcec8dbb2d21e15b3	["*"]	\N	\N	2024-06-17 10:49:24	2024-06-17 10:49:24
428	App\\Models\\User	100	api	b9542a19e27dae3c554ca29997f2a1e4a4687d28bf570ed6647728e6ca4cbde2	["*"]	\N	\N	2024-06-24 16:14:35	2024-06-24 16:14:35
415	App\\Models\\User	97	api	ab20226b20b2e6cdb37c4a99ca06198c25ebe8f7bb27b2c46c7fd0f7e12b5cce	["*"]	2024-06-20 19:03:04	\N	2024-06-20 18:49:59	2024-06-20 19:03:04
424	App\\Models\\User	97	api	9a09cd0d24f309ca9f34e163a9bb0353f7c01f21527cc715d2dc5f528441ef3c	["*"]	2024-06-21 16:17:14	\N	2024-06-21 16:16:50	2024-06-21 16:17:14
980	App\\Models\\User	255	api	91271ac1bdd080b7dac08aae1ed523a5aaaab2569901b0ef1229d0eb1251da3e	["*"]	2025-02-06 16:00:28	\N	2025-02-06 14:53:54	2025-02-06 16:00:28
965	App\\Models\\User	251	api	f6d6162880f9a7864497c0d21bdb46e2a553b8cb414a31d2165059b49a0372a7	["*"]	2025-02-05 18:11:08	\N	2025-02-05 18:09:50	2025-02-05 18:11:08
430	App\\Models\\User	100	api	a7fcb29db66a84ccbfdde7b5f2c5ca2a8e54ce4017877495efe8ec62c044f10d	["*"]	\N	\N	2024-07-06 00:54:34	2024-07-06 00:54:34
429	App\\Models\\User	100	api	10e6c3f4e3dfa1ed315ba2aa050675aa27f1986f7abd2f6712a4b00de48a937a	["*"]	\N	\N	2024-06-24 18:20:41	2024-06-24 18:20:41
416	App\\Models\\User	30	api	953263e882f3066649c18f1613acde2f1a455c9774e4322f2c262bc37ec9ad2b	["*"]	2024-06-21 17:02:04	\N	2024-06-20 23:51:31	2024-06-21 17:02:04
419	App\\Models\\User	29	api	02567eabea89323812f3c0e8d2afae8aa6d2cbb53ab118a4f515e756b88811de	["*"]	2024-06-21 13:42:43	\N	2024-06-21 13:30:18	2024-06-21 13:42:43
425	App\\Models\\User	100	api	420c81760cbdbd9b6fac197254199acb30b94220f219813f66acb8f8c8848691	["*"]	\N	\N	2024-06-21 17:20:54	2024-06-21 17:20:54
431	App\\Models\\User	100	api	d572638b0c2ce817b935e3737b67c3402f5921f09da117842f0889f308acc423	["*"]	\N	\N	2024-07-06 07:16:23	2024-07-06 07:16:23
432	App\\Models\\User	100	api	afb63d1d99002ff36c1d9186e146c4f21ffe6e01b05ec893983353d88a1d15d7	["*"]	\N	\N	2024-07-06 07:16:35	2024-07-06 07:16:35
433	App\\Models\\User	100	api	9c5d31506a1829cc81edddd9d6fe41cf097d923f34da7c0e0c7802c480daf2e8	["*"]	\N	\N	2024-07-06 07:16:58	2024-07-06 07:16:58
434	App\\Models\\User	100	api	8bf441a0784e541b7e00d98f37d8ab6172ccd865125b857024c952153adb1204	["*"]	\N	\N	2024-07-06 07:18:40	2024-07-06 07:18:40
435	App\\Models\\User	100	api	45b0969ea3291d77055ca2879ea5a02ac747731e99f136793f95ff30482bfee3	["*"]	\N	\N	2024-07-06 07:20:03	2024-07-06 07:20:03
413	App\\Models\\User	89	api	4bc57ff8ba02425eeadb4ddc7d928b482aedd930c3fcd2d77087ff40b1ad5172	["*"]	2024-06-21 15:57:54	\N	2024-06-20 14:39:15	2024-06-21 15:57:54
436	App\\Models\\User	100	api	0c76fcd2c2a42117a79bd5486ea1ab260f01a3ee3ff5e1140edb8aeb87be24a5	["*"]	\N	\N	2024-07-06 07:20:09	2024-07-06 07:20:09
437	App\\Models\\User	100	api	cc8226b4681fa5defe7c33254b285b48f6756766e856374bfebf0286ecf959ff	["*"]	\N	\N	2024-07-06 07:21:43	2024-07-06 07:21:43
438	App\\Models\\User	100	api	155b64d678fec2b54adc1638e5918cc89db156bb7621a4df2dba7ea95b39f473	["*"]	\N	\N	2024-07-06 07:21:58	2024-07-06 07:21:58
439	App\\Models\\User	100	api	b3a2d510a5f557c5bde9335777cbdb25e4a4ee0cf8d13b1a61486e2c0db2bec5	["*"]	\N	\N	2024-07-06 07:27:26	2024-07-06 07:27:26
440	App\\Models\\User	100	api	de417c5eaaefca12966df291b8a944665e18cef91df5ad38f46b5f097fee72ed	["*"]	\N	\N	2024-07-06 07:27:40	2024-07-06 07:27:40
441	App\\Models\\User	102	api	ee70cd63f61ba305f1ab71fd4e99b32a43972e3e814729825ec81036b374f5bb	["*"]	\N	\N	2024-07-06 08:37:59	2024-07-06 08:37:59
1018	App\\Models\\User	253	api	ac70f93dd0690cdc507dece8352bdd095527a8b03491bee3e2fdca2637f547a8	["*"]	2025-02-07 19:39:51	\N	2025-02-07 19:18:06	2025-02-07 19:39:51
1015	App\\Models\\User	255	api	ba48384641ec9467c49db50d71c824447d1efb397259a06326d4c1627e81e4ac	["*"]	2025-02-08 09:36:22	\N	2025-02-07 17:32:53	2025-02-08 09:36:22
1037	App\\Models\\User	262	api	264688de7f924d55c378ee2e0526c9985fee40e7bc7713a08f34c09c95a3a60f	["*"]	2025-02-08 11:14:05	\N	2025-02-08 10:39:50	2025-02-08 11:14:05
1050	App\\Models\\User	264	api	a5b6962de13b22d7da5f04da07bae3f7ecb94682d848b19abd7c8be51dca48aa	["*"]	\N	\N	2025-02-09 13:11:23	2025-02-09 13:11:23
1058	App\\Models\\User	254	api	77bec53dde6abbbfb085cf5589e56f508e43f03aab07f80794958a557b7f34a4	["*"]	\N	\N	2025-02-09 15:04:29	2025-02-09 15:04:29
442	App\\Models\\User	102	api	304225a89bc6fcf7f1d0b8ae6afd7ec229085d0f77cc833ef4377bda04f2c84b	["*"]	\N	\N	2024-07-06 08:38:49	2024-07-06 08:38:49
966	App\\Models\\User	251	api	602e6a4a79648778194e82d494b276f6cf36fe606b010e2c88fc9aa1ea07d039	["*"]	2025-02-05 18:18:16	\N	2025-02-05 18:14:21	2025-02-05 18:18:16
981	App\\Models\\User	255	api	9b69619b0f73296859e1101a058cbe47ff84a549aa80b29f76fa96cbc0ba9f0e	["*"]	2025-02-06 16:31:25	\N	2025-02-06 16:17:56	2025-02-06 16:31:25
447	App\\Models\\User	86	api	98992735bd325ed25d87f75faf104f4e3b34cc84237f167ff4b7a7a3508c7703	["*"]	2024-08-16 16:47:15	\N	2024-07-18 13:49:27	2024-08-16 16:47:15
984	App\\Models\\User	255	api	398919c6bbcaaca694c1248a03f2992c8e8afed4fbe3802d14dbb9ddc8a0482f	["*"]	2025-02-06 19:14:38	\N	2025-02-06 19:08:01	2025-02-06 19:14:38
1218	App\\Models\\User	254	api	aedafabba6d41e14665d592329b3a1ac3a8eaddff037c8de1dfd8a74d3897a77	["*"]	2025-02-25 11:42:54	\N	2025-02-25 10:29:20	2025-02-25 11:42:54
443	App\\Models\\User	102	api	e135e242c722075a2d917f1c3ebbfb3f2f8a4549f1ff4f1937fa1fa01963c941	["*"]	2024-07-06 08:45:52	\N	2024-07-06 08:40:27	2024-07-06 08:45:52
444	App\\Models\\User	30	api	684ede42dc4cfdc98d0ca360dfcf62cb3b7b07a6b933379ccd5e14a4244306d8	["*"]	2024-07-15 09:36:51	\N	2024-07-15 09:36:31	2024-07-15 09:36:51
944	App\\Models\\User	232	api	d1245ef1c0161b3509d76c1ae7105a37c0d2c879e2b9deef06578634af65c6b4	["*"]	2025-01-20 18:38:24	\N	2025-01-20 17:00:40	2025-01-20 18:38:24
446	App\\Models\\User	100	api	5c46f0ac3401775aca92bcd9cdc835955dc4267799b4624ab622ae6a9576265e	["*"]	\N	\N	2024-07-18 12:47:47	2024-07-18 12:47:47
947	App\\Models\\User	232	api	8193b4b9d8cc4c8ae37a63047077429215cf6a597c8f929b697df289241fafe1	["*"]	\N	\N	2025-02-04 15:14:03	2025-02-04 15:14:03
1222	App\\Models\\User	254	api	96ba771f690ea1d9e5afaa0739103802371a1dc95f86fdb66cabce24a02543ad	["*"]	2025-02-27 21:19:30	\N	2025-02-27 21:19:04	2025-02-27 21:19:30
997	App\\Models\\User	249	api	ac6fa4b8382babf0827dea066735e3cb373eef9caaf2a393c850b8ebe5095076	["*"]	\N	\N	2025-02-07 12:16:08	2025-02-07 12:16:08
1007	App\\Models\\User	254	api	6775270c324bdb9c92533863033e894ebd9734ebbdcb342443df26bc038c6d24	["*"]	2025-02-07 17:14:37	\N	2025-02-07 15:19:18	2025-02-07 17:14:37
957	App\\Models\\User	251	api	551b2be1f45aeffbb937357b6c7f09f539660be10e28ffb390822b728f78ac71	["*"]	2025-02-05 13:51:18	\N	2025-02-05 13:49:03	2025-02-05 13:51:18
1019	App\\Models\\User	254	api	8a95f1f5fde187f41e3d27f5dd02bc3cc80bf7f66dd3975d6b615da65162b915	["*"]	2025-02-08 07:22:18	\N	2025-02-07 19:58:27	2025-02-08 07:22:18
976	App\\Models\\User	255	api	5bf716f500c7d0590cb7f94b10e4e3158a8e6fe6af7a284a90127a5e83671d50	["*"]	2025-02-06 16:53:32	\N	2025-02-06 12:49:53	2025-02-06 16:53:32
448	App\\Models\\User	96	api	7406097d9966033b570ca8fc33a3c94c633d606f95e860969355124c48450bd9	["*"]	\N	\N	2024-08-09 06:37:03	2024-08-09 06:37:03
449	App\\Models\\User	94	api	cad927bc440bd2697d917e4c3591946794b2c7a098d644d9852b9ead4227d8fa	["*"]	\N	\N	2024-08-09 06:37:27	2024-08-09 06:37:27
450	App\\Models\\User	9	api	b69d5faecc887aae13f3921bb8a699a618a43f8c74591b6ebcc4bc45cff23623	["*"]	\N	\N	2024-08-09 06:38:19	2024-08-09 06:38:19
451	App\\Models\\User	13	api	a0b4931c7ea3c6cef141227a6af87184c763cb65ce273c9535352eecf5a17776	["*"]	\N	\N	2024-08-09 06:38:32	2024-08-09 06:38:32
452	App\\Models\\User	14	api	bd8ed6ee3286e6241ed602e479c8ff292cdd3341a7b674da3e6fcb4d3b2a4cce	["*"]	\N	\N	2024-08-09 06:38:50	2024-08-09 06:38:50
453	App\\Models\\User	16	api	20cad901d642fb649b9f446fbc44b25d9df91ad53c4f177aa9158828677f2528	["*"]	\N	\N	2024-08-09 06:38:53	2024-08-09 06:38:53
454	App\\Models\\User	28	api	216ca1d2c97da433a3aaa2b97a76e2df4c70ba3f90bb95049ec97ebc9c881990	["*"]	\N	\N	2024-08-09 06:38:56	2024-08-09 06:38:56
455	App\\Models\\User	30	api	60d1343dc877c905a6567ad202e2de8579bc3bf7ced01d2fa4281133352ef38e	["*"]	\N	\N	2024-08-09 06:39:22	2024-08-09 06:39:22
456	App\\Models\\User	34	api	627127e7045dd7651109099170ff0a5061caed1d7d7b7b613eae5966441d7937	["*"]	\N	\N	2024-08-09 06:39:35	2024-08-09 06:39:35
457	App\\Models\\User	35	api	520e13ecb4324e1e950515b7d55bfb3e6c9d8810c23982b8a360923bb9ef82f7	["*"]	\N	\N	2024-08-09 06:39:37	2024-08-09 06:39:37
458	App\\Models\\User	36	api	98ecc30ee99b522c1a690983fa640d920febb398b32b29a8b23ae25cf33e5b81	["*"]	\N	\N	2024-08-09 06:39:52	2024-08-09 06:39:52
459	App\\Models\\User	37	api	aa3ce72d98e1900ab617d63e7040f0839a7fb7ec403edf6c65de20e8828b7762	["*"]	\N	\N	2024-08-09 06:39:56	2024-08-09 06:39:56
460	App\\Models\\User	38	api	d230859930669f8750d4d57bcb7f9e2e096921d9850cf9d7ed2d94d5b9c2b9c3	["*"]	\N	\N	2024-08-09 06:39:58	2024-08-09 06:39:58
461	App\\Models\\User	39	api	d319c889387961298a83581f41b1045ab976a2eeb2db53d82ab84d2b38e69775	["*"]	\N	\N	2024-08-09 06:40:26	2024-08-09 06:40:26
1077	App\\Models\\User	262	api	c321c089b7f87942d7c100d2a5044de469461c7d2c81713651c5f1c9e1710d01	["*"]	2025-02-10 11:57:03	\N	2025-02-10 11:07:11	2025-02-10 11:57:03
990	App\\Models\\User	253	api	8ad580ad91e265736d2d855c8a1128f406fc8aac5b68ed2f7403ffba47adfe36	["*"]	2025-02-07 01:46:56	\N	2025-02-06 23:50:03	2025-02-07 01:46:56
1016	App\\Models\\User	254	api	116f457e60565c4c73d41650c87c59f695d4c1f179c19e14a0b2aabcf44517b4	["*"]	2025-02-07 19:44:57	\N	2025-02-07 17:33:00	2025-02-07 19:44:57
1035	App\\Models\\User	254	api	059f0fd6ced197890d532e1603d776d17ce37a8bdae2b17a461fc1a1eb0dec57	["*"]	2025-02-08 10:34:11	\N	2025-02-08 10:34:00	2025-02-08 10:34:11
1041	App\\Models\\User	251	api	24be8574cdf2b723cc8dc543260be0aeebd808c07a68e276b175a2c4e500b4a5	["*"]	2025-02-09 15:55:48	\N	2025-02-08 10:53:29	2025-02-09 15:55:48
1063	App\\Models\\User	262	api	319ff76c8aca9bf5c5b66dc88a269b079aa83d48e922c33f798ac7987217d095	["*"]	2025-02-09 17:31:11	\N	2025-02-09 17:15:58	2025-02-09 17:31:11
1079	App\\Models\\User	262	api	7ee66050c077134be530a8b6f11f94336d1d4712991d32574f8abc2fda6e23f3	["*"]	\N	\N	2025-02-10 11:22:05	2025-02-10 11:22:05
1083	App\\Models\\User	254	api	51ac503cbb6121acac3d6b025b4dc675953bdb51a467c091377a0037153212f3	["*"]	2025-02-10 12:06:11	\N	2025-02-10 12:03:28	2025-02-10 12:06:11
1047	App\\Models\\User	264	api	3b62166518ea2f2d8abd93f410f894a314ee022ed1b88694049566f0ec10bac3	["*"]	\N	\N	2025-02-09 13:10:35	2025-02-09 13:10:35
1051	App\\Models\\User	264	api	5615adf6125f10d0269de81996b5b8f512324bc80176061830b50b94e6a9d269	["*"]	\N	\N	2025-02-09 13:11:59	2025-02-09 13:11:59
1059	App\\Models\\User	254	api	b7d85de4597d23399691e5a2e642a827d198901d125cd3ef45cfd522023ffb57	["*"]	\N	\N	2025-02-09 15:05:16	2025-02-09 15:05:16
1028	App\\Models\\User	260	api	a1c6fef7cdb3d0050a8cfd18e46f006d87bf00b9573bf7afeb6547a574f9d1ae	["*"]	2025-02-10 09:38:33	\N	2025-02-08 10:01:27	2025-02-10 09:38:33
1073	App\\Models\\User	261	api	8ad28c3832b6a5a569618335cf6ad619c5270c9a429cc8bd98e52f794d9d04d3	["*"]	2025-02-10 06:35:34	\N	2025-02-10 06:35:34	2025-02-10 06:35:34
1081	App\\Models\\User	254	api	23d40b14a94c503cef5800ed25d5d14c05d23cc53fdcca3418ee4eb82a2ca2a7	["*"]	2025-02-10 12:05:16	\N	2025-02-10 11:37:51	2025-02-10 12:05:16
1085	App\\Models\\User	264	api	c59b3bcf3f19ac2c3e6035654ef883d4e5ea5e42b4ffa8e0061f3d60476965d1	["*"]	2025-02-10 13:38:11	\N	2025-02-10 12:38:39	2025-02-10 13:38:11
462	App\\Models\\User	40	api	b2bf747bef7678a7e314653888d554cb2c8480410bed74692fd1ca6c065a583f	["*"]	\N	\N	2024-08-09 06:40:30	2024-08-09 06:40:30
463	App\\Models\\User	41	api	fc2a56d30b9e7e89b58137508db753aa43c463b9f11777bacd06c8a352092f93	["*"]	\N	\N	2024-08-09 06:40:50	2024-08-09 06:40:50
464	App\\Models\\User	42	api	930e5757a050f5ae9812f1a9c432c3777a6600ce622655d924c352b416394fd7	["*"]	\N	\N	2024-08-09 06:40:53	2024-08-09 06:40:53
465	App\\Models\\User	43	api	8523eace3753e0e7c75431e60df0a8df5541f07a3b6fe5464ca06d230e650fa2	["*"]	\N	\N	2024-08-09 06:40:55	2024-08-09 06:40:55
466	App\\Models\\User	44	api	af8bf7947018bb6a785e0a46220d88493fb608481c300b5b7c1347b9caace320	["*"]	\N	\N	2024-08-09 06:40:58	2024-08-09 06:40:58
467	App\\Models\\User	45	api	821f44a163d44dd5985f83d314ea25194444c052b3969a644aee618bf2da853c	["*"]	\N	\N	2024-08-09 06:41:08	2024-08-09 06:41:08
468	App\\Models\\User	46	api	f3c7e56944cc886656f5fb16961cacd124664f389de8102848c3504ddc442af3	["*"]	\N	\N	2024-08-09 06:41:16	2024-08-09 06:41:16
469	App\\Models\\User	47	api	3028f01204521eecb5f69159ae51476134970abb16f2300945bd1208a97a7c09	["*"]	\N	\N	2024-08-09 06:41:19	2024-08-09 06:41:19
470	App\\Models\\User	48	api	c972b4e62b45e030166e03142e9d4ad5bfae95dc20c0383e834fc75f49dac4e4	["*"]	\N	\N	2024-08-09 06:41:28	2024-08-09 06:41:28
471	App\\Models\\User	49	api	d4417ac381a6132a451d14577525e395c46017dd8c3956629677ae0a23371239	["*"]	\N	\N	2024-08-09 06:42:00	2024-08-09 06:42:00
472	App\\Models\\User	50	api	1cd15d61223f277dee62bd06791808006aa16ba4fd6e92f4319e1f9a7ed83190	["*"]	\N	\N	2024-08-09 06:42:03	2024-08-09 06:42:03
473	App\\Models\\User	51	api	6fc0c4cee00d6ecc872e8b7cf2d8c101199833638bb7893cf6c2831c4bc74236	["*"]	\N	\N	2024-08-09 06:42:05	2024-08-09 06:42:05
474	App\\Models\\User	52	api	d2b1a39c724ce7904ad1038f389a04b7cf83664f7224db8f1ac816f243e18ad6	["*"]	\N	\N	2024-08-09 06:42:07	2024-08-09 06:42:07
475	App\\Models\\User	53	api	d4a540dc26320267283c28924fe1732814ac7632402f7db23ff54c540e7c97aa	["*"]	\N	\N	2024-08-09 06:42:17	2024-08-09 06:42:17
476	App\\Models\\User	54	api	43f181c529ad4637b5da79c367da98ec4771856d737c33b4d49896fd89033640	["*"]	\N	\N	2024-08-09 06:42:19	2024-08-09 06:42:19
477	App\\Models\\User	55	api	e84b8089298fc04bc0892ae156260a82dd7aee562941ab94b7e7cc46786c0584	["*"]	\N	\N	2024-08-09 06:42:29	2024-08-09 06:42:29
478	App\\Models\\User	56	api	b69c15b2bd9ff588da0747b16790e625dee3b56175fdf2d1cc2863593fc69ee8	["*"]	\N	\N	2024-08-09 06:42:31	2024-08-09 06:42:31
479	App\\Models\\User	57	api	5a27be5d55354386d76ed537301c1889b90e93de5285fd44bb6153112e779f17	["*"]	\N	\N	2024-08-09 06:42:38	2024-08-09 06:42:38
480	App\\Models\\User	63	api	0170415e00f6cfae58d8686b01c7a0e1903150ee69fb58d9dbc2e3c5cb06a9fd	["*"]	\N	\N	2024-08-09 06:42:40	2024-08-09 06:42:40
481	App\\Models\\User	65	api	43e058cdb15fc16523387d742e63fd4d3d275775ac469b624378b0bbd06cc004	["*"]	\N	\N	2024-08-09 06:43:04	2024-08-09 06:43:04
482	App\\Models\\User	66	api	3fb5d20dc1587025b18a56ac74d4991f7072e6f4d4991c70b5253c91c73e3920	["*"]	\N	\N	2024-08-09 06:43:06	2024-08-09 06:43:06
483	App\\Models\\User	67	api	4b49a64e5f0437e37f63540f96faafd9f826b5f5ee0ba8f065154949cb1eb174	["*"]	\N	\N	2024-08-09 06:43:09	2024-08-09 06:43:09
484	App\\Models\\User	78	api	3698d05d09bc6939f6a63d3675f5371c627421f2d729a1dcc972d0eaa20e6b62	["*"]	\N	\N	2024-08-09 06:43:10	2024-08-09 06:43:10
485	App\\Models\\User	79	api	32f9524cd275963974e402b64b8bb75e917a0d07e3df6b0988248e4e7097c864	["*"]	\N	\N	2024-08-09 06:43:42	2024-08-09 06:43:42
486	App\\Models\\User	80	api	a3b493ebb7582d835565dadeba9ff1bdb2393edd7242dc5ace4d088685013c50	["*"]	\N	\N	2024-08-09 06:43:50	2024-08-09 06:43:50
487	App\\Models\\User	83	api	2a7d083c163d679348e42b4bcd5f8d12ba4303e9d774b15b3e2b02369233fcca	["*"]	\N	\N	2024-08-09 06:43:58	2024-08-09 06:43:58
488	App\\Models\\User	86	api	f463c7377bae06aee6343e3792cfc4c96424edbb8ef87a163e750ac293bbe0aa	["*"]	\N	\N	2024-08-09 06:43:59	2024-08-09 06:43:59
489	App\\Models\\User	87	api	2fa4ea7c5a9ddc7aadcc707275f94ff2c63b1f3daef3461c134445608d62c576	["*"]	\N	\N	2024-08-09 06:44:01	2024-08-09 06:44:01
490	App\\Models\\User	88	api	9beb1373a37333f772af292e65045751a6352daf6ccf00c6d06d3f3bad2c693d	["*"]	\N	\N	2024-08-09 06:44:09	2024-08-09 06:44:09
491	App\\Models\\User	89	api	23988100dd3d755c49f6a67e80c1d1753b6a74290a8ca264c9e512ea528b202a	["*"]	\N	\N	2024-08-09 06:44:18	2024-08-09 06:44:18
492	App\\Models\\User	92	api	1feff49d746c1145923c65cff8599cbeeb0100915965a5ba9c7113fadef0befd	["*"]	\N	\N	2024-08-09 06:44:51	2024-08-09 06:44:51
493	App\\Models\\User	93	api	a917cdcf7daf239fceb0e6fde461a85c5aeb0e596d2b49b1483157a8ad4fb711	["*"]	\N	\N	2024-08-09 06:44:54	2024-08-09 06:44:54
494	App\\Models\\User	94	api	5a0d6bbb1607cf933290c8d982282420003e711e5e543dffce98ce4d0a1bb1d2	["*"]	\N	\N	2024-08-09 06:44:56	2024-08-09 06:44:56
495	App\\Models\\User	97	api	903836bc066214e0fe395a46163e87b3a7da8cb753e4180d7807d0f3ff70e529	["*"]	\N	\N	2024-08-09 06:45:03	2024-08-09 06:45:03
496	App\\Models\\User	98	api	d91dceb4898e2d267366637eeac9e40b8e0ce359387b1da09692656d55ef3edd	["*"]	\N	\N	2024-08-09 06:45:11	2024-08-09 06:45:11
497	App\\Models\\User	99	api	0b1fb16407a1c4e58feb121125444c1fa3d08c30c69fa50c25a4a42806857dec	["*"]	\N	\N	2024-08-09 06:45:18	2024-08-09 06:45:18
498	App\\Models\\User	100	api	7184f6d026d0f99814fef7f68ce8270d55bfd7b327973e401e6e62c59c749750	["*"]	\N	\N	2024-08-09 06:45:21	2024-08-09 06:45:21
499	App\\Models\\User	102	api	c19f3564017eda54d138dc539fc27d302d8c84ccd1bc9295119578ed522f0d77	["*"]	\N	\N	2024-08-13 22:37:21	2024-08-13 22:37:21
500	App\\Models\\User	102	api	70b6d78727daa563d4beed906a41e1287e24e07d8edfddef612aafda022e3b80	["*"]	\N	\N	2024-08-13 22:37:45	2024-08-13 22:37:45
501	App\\Models\\User	102	api	12b5fffeeebb388371944f906bca38d7b336291e71ae27511d9d3212aee234d4	["*"]	\N	\N	2024-08-14 10:54:07	2024-08-14 10:54:07
502	App\\Models\\User	45	api	d758f3a1df48b01d760b50366fb70ee6101d304ecdabb69de50e691955937be5	["*"]	\N	\N	2024-08-14 12:24:39	2024-08-14 12:24:39
503	App\\Models\\User	109	api	d3b0bcd055e675285be132c2d0a2b1c5d2e33145317d965fee17a4c8b9fb4c64	["*"]	\N	\N	2024-08-14 12:29:51	2024-08-14 12:29:51
504	App\\Models\\User	109	api	24def3999be80daed7f3abc19207e61379f565bff84b44ce50ea03337a1acbb2	["*"]	\N	\N	2024-08-14 12:36:27	2024-08-14 12:36:27
505	App\\Models\\User	109	api	497fe4ca416e1b3c57e56a7e76dd034cbd3c0e964da8c0e79c909b9346eae4c9	["*"]	\N	\N	2024-08-14 12:36:58	2024-08-14 12:36:58
506	App\\Models\\User	110	api	3c47ff07b5ed11c1bcc6dc3e475f72bf24392d233acaf804d83ce16dbcb8a8a9	["*"]	\N	\N	2024-08-14 13:24:41	2024-08-14 13:24:41
507	App\\Models\\User	111	api	f76117673fb53ca45a8eca16065ca64ff7c62c3d455e1b03a7b11bfcc2107cb2	["*"]	\N	\N	2024-08-14 13:27:00	2024-08-14 13:27:00
508	App\\Models\\User	120	api	6591111c791ea52e78d7fc7081590a61af81ed0e45c72e7e36c8895ced26307c	["*"]	\N	\N	2024-08-14 17:16:55	2024-08-14 17:16:55
509	App\\Models\\User	9	api	3f6f2ac16a1bd2f3e5d8e1918456296389eabdad838c4f3c0515192480322044	["*"]	\N	\N	2024-08-14 17:21:06	2024-08-14 17:21:06
510	App\\Models\\User	110	api	24fedd009c331c039c103fa0eb905ffc0d7b29216904d773cf3f79a48f0e9969	["*"]	\N	\N	2024-08-14 17:26:25	2024-08-14 17:26:25
511	App\\Models\\User	110	api	685d07de79c397c4701e4a7bdeb106a3b9c2534332b58e1a0f6f73af131ef82b	["*"]	\N	\N	2024-08-14 18:18:29	2024-08-14 18:18:29
512	App\\Models\\User	125	api	3500d7c455472566dd74c5d897135caecbbcd0385c4095063c19dbc1e9bcdf7e	["*"]	\N	\N	2024-08-15 08:54:13	2024-08-15 08:54:13
513	App\\Models\\User	125	api	28fc9c0ba89da7c80df1790a64dcf8124856b919ea9f3abbd23d67e5942648f5	["*"]	\N	\N	2024-08-15 11:08:26	2024-08-15 11:08:26
514	App\\Models\\User	130	api	0ddc94e446e7ae711a23cdc38361f5ad5fce533085535c85940faf6c9c4fc639	["*"]	\N	\N	2024-08-16 09:49:04	2024-08-16 09:49:04
515	App\\Models\\User	1	api	9dc1631fcf9cbe86f635201653c5238353799068765acb31ad24b8b03d5f50bf	["*"]	\N	\N	2024-08-17 18:30:40	2024-08-17 18:30:40
516	App\\Models\\User	1	api	4fd6a96fa87d560398e5e5575e1ffec9168d51b31a7b7342bb5fccd86a62027d	["*"]	\N	\N	2024-08-17 18:30:44	2024-08-17 18:30:44
517	App\\Models\\User	137	api	07be6ea2c2af25d9b38aecc9001dca2a00526faac988422c8b4ce6fb83cce675	["*"]	\N	\N	2024-08-22 13:25:44	2024-08-22 13:25:44
518	App\\Models\\User	138	api	df3105e88b4223df36757d253577d3f4053633f48135a7ffdc65b59cc094c930	["*"]	2024-08-26 16:42:08	\N	2024-08-26 16:41:46	2024-08-26 16:42:08
519	App\\Models\\User	138	api	42855e2ffdcc78785ead2f744180203b28594a5ff2ae0fec7e3c6d9f17bcc5f3	["*"]	\N	\N	2024-08-27 11:19:25	2024-08-27 11:19:25
520	App\\Models\\User	137	api	b61810b9e58fadd85073c16d3a972b5c5ee2679b1a0caf1d707149640738fadd	["*"]	\N	\N	2024-08-27 11:19:55	2024-08-27 11:19:55
521	App\\Models\\User	137	api	c919b2e740e21535b1a8584ffd184fdbbdf8835c86a5f60ff6282cfb682a807f	["*"]	\N	\N	2024-08-27 11:20:35	2024-08-27 11:20:35
522	App\\Models\\User	137	api	54b8a544ec3fa444aa5cb78354b5c37dfbcd43c879857368c276979bfa1f5068	["*"]	\N	\N	2024-08-27 11:21:55	2024-08-27 11:21:55
523	App\\Models\\User	138	api	3d8ef7269b60d684edc9745d5e8da076f75efb24d472807c5d0885ac91045bdf	["*"]	\N	\N	2024-08-27 11:22:16	2024-08-27 11:22:16
524	App\\Models\\User	139	api	b82faa7b1b3e08b577f4e3a645dbbe3dca9e7f88f917e5b7d43b36e210bafee6	["*"]	\N	\N	2024-08-27 11:42:34	2024-08-27 11:42:34
525	App\\Models\\User	139	api	aeff716ec3394505020878d533d2147d1e1cd78685597692e451d61fd351644a	["*"]	\N	\N	2024-08-27 11:43:17	2024-08-27 11:43:17
526	App\\Models\\User	142	api	560a11e97460fb180c50d46a7156bd757063aadf7c7d164b00d0e780cc7131c2	["*"]	\N	\N	2024-08-27 14:03:23	2024-08-27 14:03:23
527	App\\Models\\User	142	api	97d38fd7e7c865fa9ce73cabb9bdaffa62debc9607d1789b1f833fa83e514258	["*"]	\N	\N	2024-08-27 15:25:00	2024-08-27 15:25:00
535	App\\Models\\User	144	api	508082999e4e83e617052eb095811d771d3f091bfa95820efdc715fcfe2ff1a6	["*"]	2024-08-28 13:55:55	\N	2024-08-28 11:16:23	2024-08-28 13:55:55
532	App\\Models\\User	148	api	9d6a4be62fb4d1cf28b8c70b6624ed06c4d924ed2934dea17f5ab7780ebc2cdb	["*"]	\N	\N	2024-08-27 20:47:58	2024-08-27 20:47:58
945	App\\Models\\User	232	api	6a14135c64a858ca97d73ddde8660ea21b8d1d588b3c790439b6c54df3db85ea	["*"]	2025-01-20 17:24:42	\N	2025-01-20 17:24:31	2025-01-20 17:24:42
948	App\\Models\\User	251	api	fd4933667be542f681af768843a17db56873642349714621b7017dca82b4e514	["*"]	2025-02-04 19:58:41	\N	2025-02-04 15:16:10	2025-02-04 19:58:41
551	App\\Models\\User	157	api	2aba5017939af9ae141eee8fb6ccfe0522a6c11c155fe6beec58a825f87e054a	["*"]	2024-08-30 11:29:32	\N	2024-08-30 11:29:05	2024-08-30 11:29:32
530	App\\Models\\User	146	api	c9def223c96b10223cab4241691d3e8c96a48c33f22ecbca59caa897a310a300	["*"]	2024-08-27 17:54:42	\N	2024-08-27 17:54:07	2024-08-27 17:54:42
539	App\\Models\\User	144	api	a8164476310cafebe06ec3710920b2c2f942f087176f7627d734351912c44321	["*"]	2024-08-28 14:01:07	\N	2024-08-28 13:56:26	2024-08-28 14:01:07
544	App\\Models\\User	155	api	8f4e9c7a1d75bc69e101f5712bfef601530a06d14524ba9c0399b246e27be121	["*"]	\N	\N	2024-08-28 21:04:39	2024-08-28 21:04:39
545	App\\Models\\User	156	api	2f11b730ed3f36930db455595b56ba1fb2d4e4590f24c7e58740e23973aa608c	["*"]	\N	\N	2024-08-29 09:19:11	2024-08-29 09:19:11
531	App\\Models\\User	147	api	fa4fd6eccb690232093db50a4cd077f16da53f02169e87a070c3d6e1db49ea60	["*"]	\N	\N	2024-08-27 20:00:31	2024-08-27 20:00:31
541	App\\Models\\User	152	api	ecf2f1aaa9cccf0f016aa6a6921fb1fe9e17053ec3c513da9ba0cc1444b2c196	["*"]	2024-08-28 16:34:33	\N	2024-08-28 16:06:07	2024-08-28 16:34:33
1227	App\\Models\\User	295	api	f53efa4e6cbdae13fd6414f3a1692a2d7ea7fe79dcf445be9636317d329adcea	["*"]	\N	\N	2025-03-09 23:29:25	2025-03-09 23:29:25
540	App\\Models\\User	151	api	2201b90f9af9e725ee9ac08cbc5b7774ea5bcd5a27e4ba1ec740fc58f6748923	["*"]	\N	\N	2024-08-28 15:57:50	2024-08-28 15:57:50
543	App\\Models\\User	153	api	631a03209e54a4a409d9cdae4b79512efb850d6b40c4d3825507de7543f92e9b	["*"]	\N	\N	2024-08-28 18:50:34	2024-08-28 18:50:34
534	App\\Models\\User	144	api	653dfcbb88750d9cf809d5139da47d2c00922f0cbfb2d9955bdac0edd81fe307	["*"]	2024-08-28 14:33:57	\N	2024-08-28 08:38:22	2024-08-28 14:33:57
536	App\\Models\\User	149	api	bb531cdaab34305c6eb1dec51f86391b36555eac5e3cd851c896a367aceea91a	["*"]	\N	\N	2024-08-28 12:19:06	2024-08-28 12:19:06
537	App\\Models\\User	149	api	e32a2be9a6bc5df39e4511d17ea8f6efe069d48d9ba0a4af0b591ec7bdf128c5	["*"]	\N	\N	2024-08-28 12:21:50	2024-08-28 12:21:50
538	App\\Models\\User	150	api	e36c387afb91a2d6d2734512202488147ab463d3462aeca9d9533c2b0763d2d8	["*"]	\N	\N	2024-08-28 12:32:29	2024-08-28 12:32:29
533	App\\Models\\User	144	api	7d7b919c7012dea0be500e18febedfce36fc1fd03503bf0ea35c1a5247153106	["*"]	2024-08-29 19:05:58	\N	2024-08-28 08:32:24	2024-08-29 19:05:58
548	App\\Models\\User	1	api	af6b9470bf2d1d5ca42ef03699132fddc4af6c0bfbcd4789d724a14f817e710a	["*"]	2024-08-30 10:32:08	\N	2024-08-30 08:40:41	2024-08-30 10:32:08
556	App\\Models\\User	144	api	1ed2ff51c3b21db9809825cc2b85e607ab16a5837bd0d87bf18fcf23fe0fba4f	["*"]	2024-08-31 11:34:45	\N	2024-08-31 08:12:21	2024-08-31 11:34:45
563	App\\Models\\User	158	api	19881f73fe756c6e77b3a14f4a4b2dd87d622a778c0da6e07c3f01cc6d5c9c2f	["*"]	\N	\N	2024-08-31 14:48:15	2024-08-31 14:48:15
557	App\\Models\\User	144	api	4526beafe973f776a0061131461f32ee16d9107ecaf3c31eb76869965064d644	["*"]	2024-08-31 10:14:19	\N	2024-08-31 08:27:40	2024-08-31 10:14:19
552	App\\Models\\User	157	api	8e7dfcffc5dbe00c127e87a35ddb47b6844964028d2313deaabc3e305399242e	["*"]	2024-08-31 11:00:18	\N	2024-08-30 11:29:32	2024-08-31 11:00:18
553	App\\Models\\User	145	api	f2aa9448f4c3fedcd2379a7857166ccf89040e477df6884099de8aba00a120b4	["*"]	2024-09-03 06:58:33	\N	2024-08-30 11:55:46	2024-09-03 06:58:33
565	App\\Models\\User	158	api	70ac4f8b6df25d53657aba118ef863cb30803c1e94a5931860c4b8c2eb28898d	["*"]	\N	\N	2024-08-31 14:53:39	2024-08-31 14:53:39
569	App\\Models\\User	158	api	da7ed1536422357c4871c4cf028660df9f69ba11820cff3328d8baf0b3b0b4c8	["*"]	2024-09-03 12:05:17	\N	2024-08-31 14:56:12	2024-09-03 12:05:17
566	App\\Models\\User	158	api	918908f26450b10ac56f1332cb5ad29d65d70cd964b74ffb06483d67fb9857e0	["*"]	\N	\N	2024-08-31 14:54:26	2024-08-31 14:54:26
567	App\\Models\\User	158	api	48ef0f05bb291d6fd84fa6211e6ec869d156463479623e078d186f187acb013f	["*"]	2024-08-31 16:36:10	\N	2024-08-31 14:54:57	2024-08-31 16:36:10
570	App\\Models\\User	158	api	61f09a2bb87ce4d6e5ad166cdd2b1cc0363f27470760e86512834f39702ebf46	["*"]	2024-08-31 15:35:39	\N	2024-08-31 15:01:28	2024-08-31 15:35:39
572	App\\Models\\User	159	api	8c50426430e7bc41814416e5bcf70a473e9a57181fcf4aa3157fd55af1e0dfd0	["*"]	\N	\N	2024-08-31 20:26:43	2024-08-31 20:26:43
578	App\\Models\\User	158	api	7ee1d36a14ff4016ac9c8d33ae1f55cc47004143663f4c3f7d74772ca31e595c	["*"]	2024-09-02 13:20:15	\N	2024-09-02 11:53:14	2024-09-02 13:20:15
573	App\\Models\\User	159	api	b0f62589711ef9130deb20c867f951f9d0a94385405e3d111ac66cd92f59155b	["*"]	2024-08-31 20:55:47	\N	2024-08-31 20:29:19	2024-08-31 20:55:47
580	App\\Models\\User	144	api	03ae2a695118b1372c36711b48ce19ca8c370de0497e42abed9c2ef49bd155c4	["*"]	2024-09-02 18:14:53	\N	2024-09-02 15:08:57	2024-09-02 18:14:53
587	App\\Models\\User	144	api	92d98fc100c923a76a880ca616c959ef394be481489c88036fd4a1659391109f	["*"]	2024-09-03 18:07:04	\N	2024-09-03 13:14:06	2024-09-03 18:07:04
1228	App\\Models\\User	296	api	19a2277ffb55a426b0e5981f848072cc88901d67118b0fcb4a8ed41674c50276	["*"]	\N	\N	2025-03-09 23:36:15	2025-03-09 23:36:15
582	App\\Models\\User	144	api	8465cce29942c38912c5c071752f0fde66347ff9d9afa6695721c8530f21b124	["*"]	2024-09-03 13:08:07	\N	2024-09-02 21:07:50	2024-09-03 13:08:07
590	App\\Models\\User	158	api	6db6a7523b859a44cb89d70d534ac4659a52c4402dcfeed04f6e71275b030c14	["*"]	2024-09-03 18:26:14	\N	2024-09-03 18:26:14	2024-09-03 18:26:14
609	App\\Models\\User	145	api	6af31b80ed331b880b1142a50c6a601c1a0f602f80c6c7ce7765ced933993ae2	["*"]	2024-09-04 23:02:46	\N	2024-09-04 15:49:14	2024-09-04 23:02:46
574	App\\Models\\User	157	api	a3e4cadb489722e72cbe0ef55cc8f8d8c50d3aea2a27ee51f3df748273319556	["*"]	2024-09-01 08:18:08	\N	2024-09-01 08:05:01	2024-09-01 08:18:08
594	App\\Models\\User	160	api	8eab2d2708237e3ce7053b8e96cb06911b1a018a9bdae11c82955d7c7dc9db49	["*"]	2024-09-04 08:29:20	\N	2024-09-04 07:28:01	2024-09-04 08:29:20
631	App\\Models\\User	138	api	9ccafac0fb46fc5281a253a0231ab3da3d9301fcf8710621a117fd422f7a7bca	["*"]	2024-09-10 13:19:44	\N	2024-09-10 13:10:37	2024-09-10 13:19:44
598	App\\Models\\User	160	api	450c8fddef762686e138d107c91feb19423997a8b1c625baf84acb192b9ec8e6	["*"]	2024-09-04 14:15:38	\N	2024-09-04 09:29:30	2024-09-04 14:15:38
626	App\\Models\\User	158	api	58a725a97a1bf0245afbbe7ea32e32a976122b11fb944702a3845aac8a78be3f	["*"]	2024-09-06 19:05:47	\N	2024-09-06 19:05:15	2024-09-06 19:05:47
605	App\\Models\\User	144	api	c2999126e6ce70f9ab5fbfbdf398bd6deb4940ed437095490f83a24ff1557415	["*"]	2024-09-04 14:42:52	\N	2024-09-04 14:42:50	2024-09-04 14:42:52
568	App\\Models\\User	158	api	59b05e84cf135b3bfbdbeeb76be2a2680eaf176b955ef1b0324f155800b41af2	["*"]	2024-09-03 17:51:39	\N	2024-08-31 14:56:02	2024-09-03 17:51:39
621	App\\Models\\User	163	api	e8a4ec8297700a082ec482423b00cf17663523dee9ba0abb8bfba3d63269b92f	["*"]	2024-09-05 14:07:54	\N	2024-09-05 11:39:52	2024-09-05 14:07:54
596	App\\Models\\User	144	api	3b65fdb01906110eac6a6b883a07f97b50249a69da0285964a5f9038f9d45318	["*"]	2024-09-04 09:21:32	\N	2024-09-04 08:02:58	2024-09-04 09:21:32
622	App\\Models\\User	149	api	865a77ec963a23bb4e6c58010ecf10e3aabd1bf56d4cb072a96fff42a6dbff9d	["*"]	\N	\N	2024-09-05 12:26:06	2024-09-05 12:26:06
617	App\\Models\\User	160	api	98e3aa94e77355c36ff5388576e67cbfef5177ad06bb8598af8de98852b40a2d	["*"]	2024-09-04 17:42:00	\N	2024-09-04 17:15:10	2024-09-04 17:42:00
588	App\\Models\\User	144	api	4ffa3d631f8a7bdf4aef0a834fb742a07d1d4d6e283b52ca61a5e5e431148fc8	["*"]	2024-09-03 15:49:33	\N	2024-09-03 13:43:10	2024-09-03 15:49:33
584	App\\Models\\User	159	api	4b477619e87fd4fbe0962a69fd02b68f0bf0086c648db80db4aaa91b76c36b1a	["*"]	2024-09-03 13:57:39	\N	2024-09-03 09:55:09	2024-09-03 13:57:39
583	App\\Models\\User	159	api	bd98904cc3dd25ed34740700533f6b67ce358ca523899c52ddd2b78333679775	["*"]	\N	\N	2024-09-03 09:53:35	2024-09-03 09:53:35
586	App\\Models\\User	161	api	b8dfe028206cb462ae8d17e55dc71fa6c180a48d2c313700c7834d2059fff7cf	["*"]	\N	\N	2024-09-03 13:02:45	2024-09-03 13:02:45
592	App\\Models\\User	144	api	c2554d9a19f22a1c51871934fc58311cf0577900834a7b8e2e90099966e7fe50	["*"]	2024-09-04 07:11:57	\N	2024-09-04 06:59:21	2024-09-04 07:11:57
593	App\\Models\\User	160	api	cd96a5e703e486c19bbc04d394bdc7461011a4000dd112f2584f0ba7f575ab66	["*"]	\N	\N	2024-09-04 07:26:26	2024-09-04 07:26:26
611	App\\Models\\User	160	api	2654fded5084f2d923b4bf2c299b347d98e033557dd840c643e92e2016e33356	["*"]	2024-09-04 16:14:32	\N	2024-09-04 16:00:41	2024-09-04 16:14:32
591	App\\Models\\User	158	api	306902607caad8e1b34f59ce5f3c0cfa59e99b75cc28ac0d2b987ddba744e164	["*"]	2024-09-04 08:48:06	\N	2024-09-03 18:31:07	2024-09-04 08:48:06
620	App\\Models\\User	158	api	fba456072a44b835016f2aa2181a4c30b0236fa5efc559ce697b7d717c9761fa	["*"]	2024-09-05 08:34:22	\N	2024-09-04 21:01:01	2024-09-05 08:34:22
616	App\\Models\\User	160	api	05f08c0ef9e2d4207008ba7e8711063a53a627841c48c75315a545bd5da8d40b	["*"]	2024-09-05 13:12:36	\N	2024-09-04 17:06:54	2024-09-05 13:12:36
600	App\\Models\\User	158	api	610bfa211994641bc9fd70f4d13d889f339d88d97a0335fca952e3ce6613a885	["*"]	2024-09-04 15:44:35	\N	2024-09-04 10:13:23	2024-09-04 15:44:35
618	App\\Models\\User	158	api	f1de5173cdb48ae34fa1cf227eaa6e9188a5dcc0b635c0b2fbd15aa3baf4f8e7	["*"]	2024-09-04 20:45:07	\N	2024-09-04 20:43:48	2024-09-04 20:45:07
612	App\\Models\\User	158	api	6127b8f05d9f6ee987f35d4747736af18c81dfe47d9b8d23351cc26820dada79	["*"]	2024-09-04 20:42:20	\N	2024-09-04 16:13:49	2024-09-04 20:42:20
623	App\\Models\\User	149	api	836f1b81b3955117625ca9e839b19f1300e7714f2bed7397648ca7425a45f9fc	["*"]	2024-09-05 15:40:58	\N	2024-09-05 12:27:08	2024-09-05 15:40:58
624	App\\Models\\User	164	api	c78e1673e4a04cfb222515a417222bfdc70daa279f5bcf8e58aa33a5846c16ed	["*"]	\N	\N	2024-09-06 08:23:07	2024-09-06 08:23:07
627	App\\Models\\User	158	api	b7e310dd1919f4395b26567de2ad504d147e63d1f5fee722bd3bc1921271f42a	["*"]	2024-09-06 19:36:52	\N	2024-09-06 19:28:41	2024-09-06 19:36:52
625	App\\Models\\User	165	api	5b0d18e473faae74083aaad7c7c98d3ea4cac68dbc1cac0540fb8cdd249a344b	["*"]	2024-09-06 18:09:31	\N	2024-09-06 18:02:45	2024-09-06 18:09:31
619	App\\Models\\User	158	api	291a99c776c9bf9528d0909eaf32267f8e259611b31bd8778e8a6149bd5ce350	["*"]	2024-09-04 20:48:05	\N	2024-09-04 20:47:12	2024-09-04 20:48:05
633	App\\Models\\User	138	api	2e05877114049beacafec1c2fcb67744dfca3114930bab97ecb9e9e86584b215	["*"]	2024-09-10 13:20:49	\N	2024-09-10 13:20:04	2024-09-10 13:20:49
632	App\\Models\\User	1	api	88e4816b704e273b5646fd1f306f1176fa4598792a47dd0d71e298a57b9b3bbf	["*"]	\N	\N	2024-09-10 13:19:55	2024-09-10 13:19:55
634	App\\Models\\User	166	api	0197e44c8f1449ba9771615e1437ebf5a5fc90906de54128d29216f14cc79e51	["*"]	2024-09-10 13:21:16	\N	2024-09-10 13:21:15	2024-09-10 13:21:16
628	App\\Models\\User	158	api	274ab3c37a0d81f9c574f722b8c2382c7b0cc941fbe7ee8edf55661283ec7865	["*"]	2024-09-10 04:31:51	\N	2024-09-10 04:30:34	2024-09-10 04:31:51
629	App\\Models\\User	1	api	b8d27efaab0d673870a26ba90efe999b8892e6cd7bd3da5fbe5d5c7c721d3196	["*"]	\N	\N	2024-09-10 13:10:22	2024-09-10 13:10:22
630	App\\Models\\User	1	api	886d2287afe151d4105c9b6084ddd1616aade27176efd0bb97deb156edf26731	["*"]	\N	\N	2024-09-10 13:10:26	2024-09-10 13:10:26
635	App\\Models\\User	138	api	dcbf47463dd704219518befc4e40a648b3d283cdd777bb64e06941ecc2f72e54	["*"]	\N	\N	2024-09-10 13:23:07	2024-09-10 13:23:07
636	App\\Models\\User	167	api	3bdeb891d3eca06b85c8dbf484f37a5353a0087c8ccdd2863f4779fff721ca57	["*"]	2024-09-11 09:45:08	\N	2024-09-10 17:15:07	2024-09-11 09:45:08
637	App\\Models\\User	168	api	b236c43434cbd9799c22bcc0622578792c251043426be3dede0f827426609a57	["*"]	2024-09-11 08:41:08	\N	2024-09-11 08:40:49	2024-09-11 08:41:08
949	App\\Models\\User	232	api	5c960dc34e19612d6451506b25d2cf82954816fdd563ef367d2c815cd015e16d	["*"]	2025-02-04 15:25:51	\N	2025-02-04 15:24:24	2025-02-04 15:25:51
669	App\\Models\\User	194	api	03d325be38d4bed8013d484f7695dfaf68d165a4c1482eea2a944d6e334f28b0	["*"]	\N	\N	2024-09-23 12:17:02	2024-09-23 12:17:02
653	App\\Models\\User	177	api	3101befffa1841ca39b8600a870e54dbc5d1d045aaf2b0bc4b333b7546a8ec76	["*"]	\N	\N	2024-09-13 12:15:52	2024-09-13 12:15:52
654	App\\Models\\User	178	api	3392ec52755ebc73ddd230dadb10ecd7caaca7b0995fdecae64fe99d04c93d77	["*"]	2024-09-13 16:02:08	\N	2024-09-13 15:12:41	2024-09-13 16:02:08
640	App\\Models\\User	170	api	0bbf9dec09fdfe27e5fd3ae8023268efe049d6900759890c396bc377257bcf80	["*"]	2024-09-11 08:44:19	\N	2024-09-11 08:43:31	2024-09-11 08:44:19
641	App\\Models\\User	170	api	0a8b62b8631d178c4829c2328311554ec8793cf287be9d1bc6250e3cf9be480b	["*"]	2024-09-11 08:44:20	\N	2024-09-11 08:44:19	2024-09-11 08:44:20
958	App\\Models\\User	251	api	ca8824067aa9c42db6fb8d23d16cda22fcc1a4518dbd55775e66179bde05af4b	["*"]	2025-02-05 14:10:13	\N	2025-02-05 14:08:57	2025-02-05 14:10:13
643	App\\Models\\User	171	api	9c5f6ff392b1c06265799b44daff3d12a1a67a4c9df17c4638e1d56282ad920f	["*"]	2024-09-11 09:04:07	\N	2024-09-11 09:04:05	2024-09-11 09:04:07
651	App\\Models\\User	176	api	ab1ea99dacbb93c49597217c33a7ff2dd0a7f75107cc04eb39803dc43a48b639	["*"]	2024-09-13 15:29:04	\N	2024-09-13 11:50:35	2024-09-13 15:29:04
644	App\\Models\\User	172	api	f16e64548397762e83b5cf0be378f2eac17a1fcc8e134175b35e14157c4e3200	["*"]	2024-09-11 09:17:34	\N	2024-09-11 09:16:38	2024-09-11 09:17:35
645	App\\Models\\User	172	api	5d0cd5a685792980f8b8b2e51cbb7855d1f437f36aa8bb6f40c2ff0bdf28e2ec	["*"]	2024-09-11 09:17:36	\N	2024-09-11 09:17:35	2024-09-11 09:17:36
646	App\\Models\\User	167	api	6f0d1e01b5326db73363bcddb2a2b6854d04f24e80af760cd3780a6242b7809b	["*"]	2024-09-11 10:13:57	\N	2024-09-11 10:13:31	2024-09-11 10:13:57
647	App\\Models\\User	167	api	bfd565b165598a418af4928cafaa507f87aff478e5b77cb096b9fd1859ffcfcb	["*"]	2024-09-11 10:14:50	\N	2024-09-11 10:14:25	2024-09-11 10:14:50
656	App\\Models\\User	179	api	f648b6133bf4719289849ae21e437e8a27313b7dfb4f6058a3c0be3f78a86a8d	["*"]	2024-09-13 20:43:24	\N	2024-09-13 20:42:32	2024-09-13 20:43:24
648	App\\Models\\User	173	api	20626c7ad3ed017329d0576734c5c4de76e6a3a231e4fe755472428ad3b85dca	["*"]	2024-09-12 20:20:43	\N	2024-09-12 20:19:28	2024-09-12 20:20:43
665	App\\Models\\User	191	api	a12ad51a3ce268dd22671c4fed4a63607563854de4b9c26be24c640e13d983bd	["*"]	2024-09-18 17:42:54	\N	2024-09-18 14:39:24	2024-09-18 17:42:54
650	App\\Models\\User	175	api	ec430b3de675992bda4209058f38e0a1f19bc71b2aa0d537f8f2125feda0ddc8	["*"]	\N	\N	2024-09-13 05:27:52	2024-09-13 05:27:52
660	App\\Models\\User	186	api	660e987ef21dab9705c01734d77ac88795dc9ccbf776aeb7dc23fa652e523742	["*"]	2024-09-18 21:11:24	\N	2024-09-18 11:11:22	2024-09-18 21:11:24
678	App\\Models\\User	198	api	1a40be5f1fe5af7bcd7de6aaf185ae03a2c044f50cfd65760991521da9204163	["*"]	2024-09-30 15:56:42	\N	2024-09-25 15:21:35	2024-09-30 15:56:42
666	App\\Models\\User	173	api	3425cf04976f13d9d52be816a56ef692d7484f034132dd4d2f1019d91e72f1d2	["*"]	2024-09-19 00:23:44	\N	2024-09-19 00:23:08	2024-09-19 00:23:44
658	App\\Models\\User	176	api	5073cdef0c8d4f2147dc531a5081d22ae125895e8762af2af09e4f752a74af5f	["*"]	2024-09-16 09:53:06	\N	2024-09-16 08:31:29	2024-09-16 09:53:06
652	App\\Models\\User	177	api	5fbc2aa5a6225a41778e11e4a0f66792ca80683780955b1d93e8092324bcfe13	["*"]	2024-09-13 18:41:47	\N	2024-09-13 12:13:38	2024-09-13 18:41:47
661	App\\Models\\User	187	api	ac4ab6d20c9e502fe093b9cbfb7a0ba17a710779849c3e03d1d542b5579e2073	["*"]	2024-09-18 11:25:49	\N	2024-09-18 11:25:26	2024-09-18 11:25:49
659	App\\Models\\User	177	api	3b3b71ebf608f57017f3eb31fbd3c8bf337f9abd4f0db56ad0359e9b6c7b3535	["*"]	2024-09-16 09:32:42	\N	2024-09-16 09:23:14	2024-09-16 09:32:42
670	App\\Models\\User	173	api	0c1db308683ceae1506c6d12db37cb1c207adefc8306127d6b88749251ad57ac	["*"]	\N	\N	2024-09-23 13:17:31	2024-09-23 13:17:31
662	App\\Models\\User	188	api	e1e36860fd260189e44a1f57cbcfec06faff6cbb5bc0019a2649f49ae2fbae35	["*"]	2024-09-18 12:06:04	\N	2024-09-18 12:05:49	2024-09-18 12:06:04
671	App\\Models\\User	173	api	bf1f8de47cca9e36fb45393a85e36859246a82e605120ab6cfbbee509f01116a	["*"]	\N	\N	2024-09-23 13:18:10	2024-09-23 13:18:10
663	App\\Models\\User	189	api	d79056b198c9cb6b56ac885196a1c4075d988545d32253126009bc0074879d8d	["*"]	2024-09-18 12:08:11	\N	2024-09-18 12:07:54	2024-09-18 12:08:11
680	App\\Models\\User	200	api	103b9a95c256bfd22a8561dfad3b06922beee98ff8e1fee8929e87ae1a99f82d	["*"]	2024-09-30 16:40:01	\N	2024-09-27 12:51:02	2024-09-30 16:40:01
649	App\\Models\\User	174	api	98d09933f75e9bc041d2a80e3f50d125211af5cfe4d75d5aa8af2c9eb0a84233	["*"]	2024-09-18 13:42:22	\N	2024-09-12 20:43:51	2024-09-18 13:42:22
674	App\\Models\\User	196	api	d0e4f9a58280f42747851ce5947332333c77296f0e9b2a24b12c0e97689faf0a	["*"]	\N	\N	2024-09-24 07:45:01	2024-09-24 07:45:01
664	App\\Models\\User	190	api	1bfd7bd6e0f3ac4bcd28c0881f6a5c884489622d5dde933af137c506af1a7fcb	["*"]	2024-09-18 14:38:27	\N	2024-09-18 14:38:08	2024-09-18 14:38:27
672	App\\Models\\User	173	api	10783bf67370c5b3b6a6545d739bf54b09b70cf7d591f3cc7fc27f51f76b1ebb	["*"]	\N	\N	2024-09-23 13:20:00	2024-09-23 13:20:00
673	App\\Models\\User	173	api	47044d8501ce9bce62b4ce3520ea2b70b97e47da60b9f369835f95b6c70a4744	["*"]	\N	\N	2024-09-23 13:23:34	2024-09-23 13:23:34
677	App\\Models\\User	197	api	9aaa8ed14167d787f9f9092ba5db6356a69ec31ea02c7fc42691a7436d33205f	["*"]	\N	\N	2024-09-24 21:39:12	2024-09-24 21:39:12
668	App\\Models\\User	192	api	b9f0a3c1e875ffff69c6ebf5a10c45ed9f4d619c37d26ce4c3d78e978fdb96d2	["*"]	2024-09-20 09:43:10	\N	2024-09-20 09:42:40	2024-09-20 09:43:10
675	App\\Models\\User	173	api	490d33e5f78f8a05079a6456c73234bd954db62ce3d06c3815408836b5eb7390	["*"]	\N	\N	2024-09-24 16:23:42	2024-09-24 16:23:42
679	App\\Models\\User	199	api	242182ed1365411830786e62d5f1125c197e5bcdb0051c35c7b8f031a390d437	["*"]	2024-09-27 12:33:57	\N	2024-09-27 12:31:23	2024-09-27 12:33:57
682	App\\Models\\User	198	api	76906e33d9cfdba1f6f0e5945c68b2039e20b4e9bd397b23ae8eb41a1051ee42	["*"]	2024-09-30 12:38:42	\N	2024-09-30 12:38:34	2024-09-30 12:38:42
676	App\\Models\\User	173	api	78fbb707bead20350b80463088ea2a8142a8ea5021a7d70a6ea2a7f5cf8fa5aa	["*"]	\N	\N	2024-09-24 16:33:24	2024-09-24 16:33:24
683	App\\Models\\User	198	api	23d2be1fac62d99bbc1e1dfc37dfad295d0febdcd78dad89dd951624ef773916	["*"]	2024-09-30 16:05:18	\N	2024-09-30 15:56:42	2024-09-30 16:05:18
685	App\\Models\\User	201	api	297ef43f0bbb0f21245787bee37f40a56a34450e4c87b3670077d667df156c43	["*"]	2024-10-09 19:38:36	\N	2024-09-30 16:14:54	2024-10-09 19:38:36
684	App\\Models\\User	198	api	15cca01210c5d10931189a8dfa760f6772c185c4cd23b0db3e55200a2c5f5be7	["*"]	\N	\N	2024-09-30 15:57:16	2024-09-30 15:57:16
687	App\\Models\\User	202	api	c60efb24b3aef3fc64122a4fb8ca0b0f9fa1967f3002e29cc80dad9584d8de21	["*"]	2024-09-30 19:55:27	\N	2024-09-30 18:34:59	2024-09-30 19:55:27
686	App\\Models\\User	202	api	647fe1e365d23b8dc1b7fbc40ec12d8db2e8c497c499e1393c6e558f226f0539	["*"]	2024-09-30 18:34:59	\N	2024-09-30 18:34:26	2024-09-30 18:34:59
688	App\\Models\\User	202	api	d9eb3ac04de42e30c32827e1bca02a497fedc2023eb48995b5fb027370bbc7bb	["*"]	\N	\N	2024-09-30 19:51:44	2024-09-30 19:51:44
1235	App\\Models\\User	301	api	d4bc330f09bef56d45fdb70005bb7320405dbb8bc63d2717d97f6f0288347324	["*"]	\N	\N	2025-03-13 09:15:05	2025-03-13 09:15:05
721	App\\Models\\User	209	api	95dd6b667d7eb63e0aa5560c2c396e23aaf7f1653b5226f3ae3b01ab888c75d0	["*"]	2024-10-15 16:01:47	\N	2024-10-15 15:48:20	2024-10-15 16:01:47
689	App\\Models\\User	202	api	b53e68ea796497d584120e5c1bbb7226519c5ca7636dd42dbbacbb80ea829489	["*"]	2024-10-01 12:49:07	\N	2024-10-01 04:19:46	2024-10-01 12:49:07
695	App\\Models\\User	205	api	e26ea104df456de54c6e38fc18d15e17caf7f94297ede0ca1b47d97ec0259d99	["*"]	\N	\N	2024-10-10 11:55:01	2024-10-10 11:55:01
734	App\\Models\\User	209	api	28da0a2bcd3ec8397431da0201394d5f7316469bc09e8fed92f4dc74119a80aa	["*"]	2024-10-16 11:13:07	\N	2024-10-16 11:12:36	2024-10-16 11:13:07
950	App\\Models\\User	251	api	04bc2dac86bb1cabe774f0330e5f3ff5663ebace5c55c37121fefd2cb7413601	["*"]	2025-02-05 12:17:42	\N	2025-02-04 16:55:11	2025-02-05 12:17:42
696	App\\Models\\User	202	api	cc9248a364af36f43a0bc4234f9ffc4c493cf4851369bbab1f0191f7740cd62a	["*"]	2024-10-10 14:17:12	\N	2024-10-10 14:11:34	2024-10-10 14:17:12
959	App\\Models\\User	251	api	f9d64b425bc1c0853f161098b28d5f847777b9ce3273a7419643f25fb5b2c637	["*"]	2025-02-05 14:19:13	\N	2025-02-05 14:11:19	2025-02-05 14:19:13
709	App\\Models\\User	209	api	b0e18e866da3308ef5e5f014a779a07b9c13d4446e7da0a558eabf832845f3fb	["*"]	2024-10-11 11:33:19	\N	2024-10-11 11:21:36	2024-10-11 11:33:19
697	App\\Models\\User	206	api	979a7f04eb52aa9a18ffc9508fd555b91eaac8637600b2150b53b888bb977513	["*"]	2024-10-10 14:28:44	\N	2024-10-10 14:28:08	2024-10-10 14:28:44
692	App\\Models\\User	203	api	3cbb0bec0fad47bbf2fcfde916aa6c99a7ce47d871c639848c454f70c4028f25	["*"]	2024-10-01 12:37:23	\N	2024-10-01 12:27:59	2024-10-01 12:37:23
705	App\\Models\\User	207	api	88acc0e022d6a0040976b5b10e2944137f6a31f272442a0120d40e30791d907d	["*"]	\N	\N	2024-10-11 11:12:57	2024-10-11 11:12:57
727	App\\Models\\User	214	api	d0fd1dadc83df38697585c74a939da3d017b3c9810fc6b63b29d35027b384727	["*"]	2024-10-16 09:23:47	\N	2024-10-16 09:23:17	2024-10-16 09:23:47
706	App\\Models\\User	207	api	6d2801aaea507d2c74c5f80a474275fb6496f3f36dc8dd1568f7a82be85b8978	["*"]	\N	\N	2024-10-11 11:13:30	2024-10-11 11:13:30
694	App\\Models\\User	204	api	11237ebc2f8b707c3cfbd3e051496682760b69c7b9c7cc85328b440ddebca660	["*"]	\N	\N	2024-10-02 05:32:10	2024-10-02 05:32:10
699	App\\Models\\User	207	api	5999d26d25c4a596eb3a5e3b40e8ad72b09558fdf1df6bac56d02a7f582ce75a	["*"]	2024-10-11 10:17:36	\N	2024-10-11 10:08:29	2024-10-11 10:17:36
700	App\\Models\\User	207	api	f9d8f094765a665fd6d14065ac879b05e371d786b4277c8e9422b20deddf70c8	["*"]	2024-10-11 10:17:38	\N	2024-10-11 10:17:36	2024-10-11 10:17:38
701	App\\Models\\User	208	api	79be5dfb5921c119402d40a9c6a94417731854110b52b5ab2e0bc2c1bbe71cc0	["*"]	2024-10-11 10:23:29	\N	2024-10-11 10:23:28	2024-10-11 10:23:29
702	App\\Models\\User	205	api	c78d3a1bad8c2017ba026068a4d4490ca0c609045cf8a1b9bb9191a7f0db6d6f	["*"]	\N	\N	2024-10-11 10:34:49	2024-10-11 10:34:49
690	App\\Models\\User	203	api	5163533a5069d7fcb14cba48dffded350fdff7f2670b3451c70c20bcc40bf7da	["*"]	\N	\N	2024-10-01 12:25:28	2024-10-01 12:25:28
728	App\\Models\\User	214	api	2fadef2e6039f3e7eb0d8a5d5ca06f68900a3db3baf5ba9dec88cffc7f13e6b9	["*"]	2024-10-16 10:26:09	\N	2024-10-16 09:23:47	2024-10-16 10:26:09
691	App\\Models\\User	203	api	31fd0a2c7fe1fa396f4c8c68bac82e0979028428f81eccd49e4841e77df03bde	["*"]	2024-10-01 12:27:59	\N	2024-10-01 12:25:56	2024-10-01 12:27:59
712	App\\Models\\User	209	api	1002eab2a500c1ceb87318d2f158f6cdd8c117a9a5aa566eefdea164019bbb19	["*"]	2024-10-11 11:45:07	\N	2024-10-11 11:45:06	2024-10-11 11:45:07
716	App\\Models\\User	209	api	4683600e392f77c59847b7c74b35cd0ca5f20aa5170bd834385a679755ff96b8	["*"]	2024-10-15 13:09:11	\N	2024-10-15 10:57:00	2024-10-15 13:09:11
729	App\\Models\\User	214	api	6e8f34c80fc72d52bee50ef7b751b2447166b3fdf21a8f9c64c4ddc766982f91	["*"]	\N	\N	2024-10-16 09:25:04	2024-10-16 09:25:04
730	App\\Models\\User	215	api	3817105fccbc712dc2b20493f0095e962173a8ff698c92c2a672717cf2bc9f72	["*"]	\N	\N	2024-10-16 09:27:14	2024-10-16 09:27:14
731	App\\Models\\User	215	api	838a34a28294e3fbb1f2df2b91e8b6e0048d34d0277f66a714a595da800b4108	["*"]	\N	\N	2024-10-16 09:29:34	2024-10-16 09:29:34
732	App\\Models\\User	214	api	0597f9b522b0c8113170d88d8cdd9b8463f7a62b7875d145d7509a3642eb1a17	["*"]	\N	\N	2024-10-16 09:29:51	2024-10-16 09:29:51
710	App\\Models\\User	207	api	d9cf1f042cb74325a0ad4e1969ae3e54f8506bef6554b122affc56019ab07b16	["*"]	\N	\N	2024-10-11 11:32:41	2024-10-11 11:32:41
715	App\\Models\\User	209	api	8e90ede8a1e88509b95f62fb436a1e6449d97fd18d705e986df85b57507c1a4f	["*"]	2024-10-15 09:37:53	\N	2024-10-11 12:28:16	2024-10-15 09:37:53
718	App\\Models\\User	209	api	b15655d2461cdcc73f15bb91af045fd47bfbf3d39eae51c7415bef3a0e7b5df0	["*"]	2024-10-15 16:47:40	\N	2024-10-15 11:25:16	2024-10-15 16:47:40
693	App\\Models\\User	203	api	b874c3ecea7203a7736ff761d2ade4c3283b59708499b04275127f4525796959	["*"]	2024-11-01 07:12:25	\N	2024-10-01 12:38:38	2024-11-01 07:12:25
720	App\\Models\\User	207	api	1e01b8c0ea46615f9791942e5ae5783c18689936f5cecbe0ed002fc221315321	["*"]	\N	\N	2024-10-15 15:45:50	2024-10-15 15:45:50
738	App\\Models\\User	217	api	a5bc853bd5de8e901d320f09fddd176b46ed2305977df2072a15e42ac4253a23	["*"]	2024-10-16 11:25:38	\N	2024-10-16 11:25:18	2024-10-16 11:25:38
722	App\\Models\\User	211	api	39f91bdb92d6f1990425f879b484457b9f6c8a33d97d37f74bd525096394c527	["*"]	\N	\N	2024-10-15 15:53:55	2024-10-15 15:53:55
717	App\\Models\\User	209	api	f9af67200eec494bbbf5dc96c77d293498ab2c605f0b20673850c93041238bf1	["*"]	\N	\N	2024-10-15 11:24:44	2024-10-15 11:24:44
733	App\\Models\\User	215	api	4c9e381a022f8ea5e38a808aea33c695cc9fcafd33ed63c497211ff1120b09b5	["*"]	\N	\N	2024-10-16 09:30:10	2024-10-16 09:30:10
725	App\\Models\\User	213	api	9d14fbee8dc9d2b108883970517a8f933abfb270057c49c7ab96a0c64be7db86	["*"]	\N	\N	2024-10-16 09:21:44	2024-10-16 09:21:44
726	App\\Models\\User	213	api	5bf075376a1281f2961687d598f6f831d5e84718fea26edf6305d65a74f77160	["*"]	\N	\N	2024-10-16 09:22:22	2024-10-16 09:22:22
741	App\\Models\\User	207	api	3ebe99049b929c438220391835086797d0c97362b211f589fdcd4dc3198feb81	["*"]	\N	\N	2024-10-16 11:35:05	2024-10-16 11:35:05
747	App\\Models\\User	207	api	f6d98c1c9142e9f4d4dee4c9b5c7137f4e838fe33e3ea1d223f57da06db72bff	["*"]	\N	\N	2024-10-16 11:51:36	2024-10-16 11:51:36
743	App\\Models\\User	218	api	9b48abe943dbe42bf1001d6b7f14e8cde6207f7b78aa70ee232e482967639232	["*"]	2024-10-16 11:44:55	\N	2024-10-16 11:44:04	2024-10-16 11:44:55
744	App\\Models\\User	219	api	bf1fbe281ea36581d99ba69bbb1d217c91ee963a97f5249a83d6f09898f0527e	["*"]	2024-10-16 12:08:19	\N	2024-10-16 11:44:23	2024-10-16 12:08:19
749	App\\Models\\User	220	api	371fefb52ec3e17aa348959489ef3228abaec688edc31f30548343d800b3e3ce	["*"]	2024-10-16 12:17:55	\N	2024-10-16 12:04:14	2024-10-16 12:17:55
750	App\\Models\\User	220	api	bd676e1dc2a44479b29a3528781c5d7d5c2c68e05c1929ec5c2974ec08577edf	["*"]	\N	\N	2024-10-16 12:07:06	2024-10-16 12:07:06
751	App\\Models\\User	220	api	f1a5a9231a35784c918880646cc5eb139747a22b975c402ffe7256b5565ddb63	["*"]	\N	\N	2024-10-16 12:10:05	2024-10-16 12:10:05
667	App\\Models\\User	173	api	3025dd0b3ad0e84501c8b301fe8d3fd51b652c8814fe0fafdf27a95c6f4c8299	["*"]	2024-10-20 18:39:37	\N	2024-09-19 00:23:44	2024-10-20 18:39:37
796	App\\Models\\User	223	api	9c4235a0d93273a9d7d8279590f1d55e255868bbddca7d70c6f5cf0a607eee13	["*"]	2024-10-25 13:10:37	\N	2024-10-25 12:56:59	2024-10-25 13:10:37
793	App\\Models\\User	221	api	35ff32334ea9cca7c8c262df5d661d81c5e512ce928e191f5965e120de5574eb	["*"]	2024-10-24 19:09:15	\N	2024-10-24 19:09:09	2024-10-24 19:09:15
761	App\\Models\\User	221	api	67ed5ed9e0fe4fa85890d751dad06d51d7033e385ccf1f54150bc83a41f060e9	["*"]	\N	\N	2024-10-16 16:07:03	2024-10-16 16:07:03
757	App\\Models\\User	217	api	3a7d12ecfcc5cae65d88d5c4634fca2730545aa0ea7fe2c7f3d4067134a68aa2	["*"]	2024-10-16 14:45:49	\N	2024-10-16 14:45:49	2024-10-16 14:45:49
781	App\\Models\\User	223	api	9e48405a8da89a5027b2abd8eae68f60fc8919853e5efe17df85c0fbf0176d28	["*"]	2024-10-18 18:09:19	\N	2024-10-18 16:48:45	2024-10-18 18:09:19
775	App\\Models\\User	221	api	133659257e061b7e732eee1a87634afb9b0b4970b6f030112aa0577c1f17346a	["*"]	2024-10-17 14:55:08	\N	2024-10-17 14:53:35	2024-10-17 14:55:08
779	App\\Models\\User	223	api	2076afb3ec50bab314fe966c0895d080422dd0639ac06e02be05188a22e6a489	["*"]	2024-10-18 10:10:53	\N	2024-10-17 22:51:45	2024-10-18 10:10:53
773	App\\Models\\User	207	api	f47bfda000a86ae8f310cc9b1872644ae4cb8e9f237b0bf48cce00b89a573eaa	["*"]	2024-11-06 12:13:53	\N	2024-10-17 11:04:48	2024-11-06 12:13:53
784	App\\Models\\User	223	api	f6cb877a388f2009375300a22e389a43e8bd411c245bbf181029521bf7cd6bee	["*"]	2024-10-19 09:55:26	\N	2024-10-18 20:50:49	2024-10-19 09:55:26
797	App\\Models\\User	210	api	5b82f6ad79999df419611eafa724dc3e565d51330bfea96d3b09d5fea4f73636	["*"]	\N	\N	2024-10-25 13:12:16	2024-10-25 13:12:16
760	App\\Models\\User	221	api	cfb9dfce99e2a342d68110c3b43caddfeb1c2d733a13c41f7fc9aaf3ddec1c12	["*"]	2024-10-16 18:48:59	\N	2024-10-16 15:12:33	2024-10-16 18:48:59
758	App\\Models\\User	207	api	ab9cad015fe19cb3b4c70f90b66d5d37fd1d323012f02610cf13370df55086fd	["*"]	2024-10-16 19:07:41	\N	2024-10-16 15:06:07	2024-10-16 19:07:41
765	App\\Models\\User	222	api	04ddd77f0e21ad6ed4508c6e0829da6993d1b61f3c3e8efb1fe4daf45f24f139	["*"]	\N	\N	2024-10-17 10:24:49	2024-10-17 10:24:49
763	App\\Models\\User	210	api	deb52c00e52fe185472f3b7476753fa9e1d8316338f8f94c91e5aeb1333f7736	["*"]	2024-10-18 19:24:43	\N	2024-10-17 10:02:27	2024-10-18 19:24:43
759	App\\Models\\User	221	api	fee1998b60c0c55fe5cc698e77f93c095c47683073ccde344c49b30d3d681d12	["*"]	2024-10-16 15:12:33	\N	2024-10-16 15:12:09	2024-10-16 15:12:33
998	App\\Models\\User	249	api	2812cf9a4991760215dd0f724b3c90e84a35e645cc8959bf3a15e9270a2ff4df	["*"]	\N	\N	2025-02-07 12:17:36	2025-02-07 12:17:36
794	App\\Models\\User	210	api	e595ae5bb8060abf82005f0d0e9164547b6facb8b8ec77622bd286c1160c542d	["*"]	2024-10-24 23:50:53	\N	2024-10-24 23:31:17	2024-10-24 23:50:53
772	App\\Models\\User	210	api	0870c26bd480b3ac9830310393391439774a8864e8075ea46774903f1edb7659	["*"]	\N	\N	2024-10-17 10:53:39	2024-10-17 10:53:39
771	App\\Models\\User	207	api	6fbc1ae4efd1a1f79c557c73ba29ef87dbfdc82b4f797c6194089a6c6ab2f50f	["*"]	2024-10-17 10:59:49	\N	2024-10-17 10:50:16	2024-10-17 10:59:49
790	App\\Models\\User	223	api	b32aabbee042c45dad93150ef0925b57a32876aea49b91477b412acfa3a05ffa	["*"]	\N	\N	2024-10-22 13:45:48	2024-10-22 13:45:48
764	App\\Models\\User	207	api	e5df4e8ecd9af717044378b3421603f4751f425f83ac52d3b5e3e19028016aa1	["*"]	\N	\N	2024-10-17 10:05:48	2024-10-17 10:05:48
785	App\\Models\\User	227	api	4917f90216f1029c1d67ee3354b29949aa0a6f71767c4771b20732d36f146c62	["*"]	\N	\N	2024-10-18 21:55:40	2024-10-18 21:55:40
786	App\\Models\\User	227	api	e62ba9da3939142588f3d0b569e2bd8122ac1a613e586a113b2c5bf3fb663991	["*"]	\N	\N	2024-10-18 22:01:05	2024-10-18 22:01:05
774	App\\Models\\User	210	api	ac628d97aec876c3c0d5e6e05cc882e6ceaf6f40d99a06133a2e045f40cfcb96	["*"]	\N	\N	2024-10-17 11:04:59	2024-10-17 11:04:59
791	App\\Models\\User	223	api	a38f834e43c46504632ce6a46609b3182efe7c4dfd26db6f7441b119d2ff720f	["*"]	\N	\N	2024-10-22 13:50:50	2024-10-22 13:50:50
789	App\\Models\\User	173	api	151e256c240d36b522552defc12bdeaf38fcbce02ca1c963ca62c71e07a6898b	["*"]	\N	\N	2024-10-21 14:39:11	2024-10-21 14:39:11
800	App\\Models\\User	229	api	cd60ea805d312fa475a91d19fa34af43e5b198e2f7ee4c558da973b4ec154268	["*"]	\N	\N	2024-10-27 17:32:38	2024-10-27 17:32:38
808	App\\Models\\User	232	api	d97ff7b286da8f7990f607ecb9c9aa19b2bc0b4e02e1c1e48f19343ce46b82ac	["*"]	2024-11-07 16:24:57	\N	2024-11-06 16:23:19	2024-11-07 16:24:57
780	App\\Models\\User	223	api	a1f1d418e38238792a52ff77bc527a2194714776c8ee60d698faeeb5dd4dfb8b	["*"]	2024-10-18 14:00:44	\N	2024-10-18 13:40:54	2024-10-18 14:00:44
787	App\\Models\\User	223	api	7728ae16e822ef1f88ac47464a96ac5c124764f72a6bddece9144825d22f76f1	["*"]	2024-10-24 12:59:04	\N	2024-10-19 14:10:25	2024-10-24 12:59:04
788	App\\Models\\User	173	api	c0504e2dc54fff5c4320acc725c5010c94664ae2bff13c2e3111d2dab11c73a9	["*"]	2024-11-06 22:24:58	\N	2024-10-21 13:13:10	2024-11-06 22:24:58
811	App\\Models\\User	234	api	ad143e27bf16177826e839c193132cad60671b2f6b74755044f88f44b3a05eb1	["*"]	2024-11-07 09:33:19	\N	2024-11-07 00:56:24	2024-11-07 09:33:19
792	App\\Models\\User	228	api	187d3a5fc3902ba265c0d0c80d5d5570f101ff403a679cec63f73453f5e91cc5	["*"]	\N	\N	2024-10-24 13:47:51	2024-10-24 13:47:51
802	App\\Models\\User	223	api	fda6fb63a5368069d1445ea8842d1ed36c73b3e65abcd3d7e0b0b523960587ca	["*"]	2024-11-02 16:06:52	\N	2024-10-30 17:46:10	2024-11-02 16:06:52
798	App\\Models\\User	223	api	17195e7632d692b6d4b6ab9626bc7bb348310f806251ea1fdfa3ebd88891795a	["*"]	2024-10-25 14:01:20	\N	2024-10-25 13:36:14	2024-10-25 14:01:20
783	App\\Models\\User	210	api	73a9bebde8916de0784ac53e7996c3b9d1201e528a042ae87125d02b704a4937	["*"]	2024-10-25 15:13:13	\N	2024-10-18 19:25:51	2024-10-25 15:13:13
803	App\\Models\\User	223	api	e1da70ed79991131c2f7ddd67204b92d6265244ee19b602825e39418861920d1	["*"]	2024-11-05 10:58:17	\N	2024-11-05 10:24:57	2024-11-05 10:58:17
806	App\\Models\\User	231	api	6dc99e878ce7843c5a3420982d9786d3b633aa9e8bdd607627a31a86af39300d	["*"]	2024-11-06 15:36:47	\N	2024-11-06 15:18:12	2024-11-06 15:36:47
807	App\\Models\\User	232	api	55221c3805d2014dca2d9be40cdbd9c2f85dd3ce8bb001fa1b8b2e7d2cd5de94	["*"]	\N	\N	2024-11-06 16:19:49	2024-11-06 16:19:49
809	App\\Models\\User	233	api	f89255e242c4d273ef128df8282c88a6d4859e34d68abe791ae1185e7ea8a4ba	["*"]	2024-11-06 21:42:47	\N	2024-11-06 21:41:05	2024-11-06 21:42:47
812	App\\Models\\User	231	api	37ebb978bfa1c6c58b35cbf5887ba9cb92799eb158481525739977e1f33ff7ed	["*"]	\N	\N	2024-11-07 03:10:14	2024-11-07 03:10:14
816	App\\Models\\User	231	api	b70d381755d0fa46186159d99e1b6741e83118448cdd0bb1b08db6b9ed5c9c3b	["*"]	2024-11-07 05:18:21	\N	2024-11-07 05:18:14	2024-11-07 05:18:21
813	App\\Models\\User	231	api	919cafa4a1270c47cd01df4167fa2e29aed87a2bc274974c7033f1ea03ce70c2	["*"]	\N	\N	2024-11-07 04:50:26	2024-11-07 04:50:26
814	App\\Models\\User	231	api	0ef1d8feeace15623aa0f2c2c8381843e12f843b7f994177b33bcea7df3f96e8	["*"]	\N	\N	2024-11-07 04:55:09	2024-11-07 04:55:09
815	App\\Models\\User	231	api	e62a06bfe6d55191e52d61c363b813919c3267b82c1fd32722d0dc90c9028daf	["*"]	\N	\N	2024-11-07 04:58:54	2024-11-07 04:58:54
818	App\\Models\\User	231	api	d89f278c1cc40ef426e27eeeef1b759223098b0543a19f276553bb71d88ab6de	["*"]	2024-11-07 13:04:52	\N	2024-11-07 12:14:13	2024-11-07 13:04:52
817	App\\Models\\User	233	api	d47c0123f2216ab566d34b424506ea1029e622fae16e5a54a889ad42cb269c4e	["*"]	2024-11-07 19:39:22	\N	2024-11-07 12:01:47	2024-11-07 19:39:22
854	App\\Models\\User	238	api	4ceb8dae33dbbe8a7cb57e6c42c84ef1cbae1b0f3c54736d199e3f1669e37b62	["*"]	2024-11-20 22:33:38	\N	2024-11-20 22:16:18	2024-11-20 22:33:38
831	App\\Models\\User	231	api	29d68b201b65dc595d0c358850f63879f2bae39dc1ae2fefeea896fc10d73500	["*"]	2024-11-08 11:55:35	\N	2024-11-08 11:54:21	2024-11-08 11:55:35
827	App\\Models\\User	235	api	5361dd9c13b63dfe37a19154e8739176b8c2876c1995eadf0162e48e9b25f123	["*"]	\N	\N	2024-11-08 09:41:08	2024-11-08 09:41:08
951	App\\Models\\User	251	api	0167ba976fea228adece24dd6350be939d759f0afe97b325d684fa1e421d21d4	["*"]	2025-02-05 12:34:01	\N	2025-02-04 18:25:22	2025-02-05 12:34:01
824	App\\Models\\User	231	api	3de4fe79039d8483c71f57232aa0ea46fca75d7f2fa6485d5beaa329cb673c30	["*"]	2024-11-08 23:15:37	\N	2024-11-07 19:55:49	2024-11-08 23:15:37
860	App\\Models\\User	238	api	deb5c038b38f990d86d2c8c40d19cd23179ace9e490582a2b69174f9259c1b23	["*"]	2024-11-21 12:32:07	\N	2024-11-21 12:14:02	2024-11-21 12:32:07
846	App\\Models\\User	238	api	0a3fed0b7ab97cc2f80a02f66cf22be366fd0c6a1ad823b9fc00b8e645b0f9bb	["*"]	\N	\N	2024-11-19 14:19:08	2024-11-19 14:19:08
844	App\\Models\\User	232	api	f1b04ece513249d333a06290b193f695b1819d3a7fa62cceb6fa4ebca27c1485	["*"]	\N	\N	2024-11-18 15:34:56	2024-11-18 15:34:56
826	App\\Models\\User	231	api	b6973e3e396da4322c2ec5709fd80d96642d7c779dbc0bc4dfcbfc39325425ad	["*"]	2024-11-08 10:55:27	\N	2024-11-08 09:22:45	2024-11-08 10:55:27
828	App\\Models\\User	231	api	be70d42e2e472b0f31a18511a9d15fcc84e51daa447b0d55aa9674eb365c5654	["*"]	2024-11-08 11:06:26	\N	2024-11-08 11:06:19	2024-11-08 11:06:26
856	App\\Models\\User	238	api	e0ef5c7651df3664b7010a1aa796a2cab100eb0bed8117f6500a8e8fb14887a7	["*"]	2024-11-21 10:05:18	\N	2024-11-21 09:21:55	2024-11-21 10:05:18
819	App\\Models\\User	231	api	8583e841215dc9f42c66599c2e61f711dcdaa1023cb6eff50b78c070f1f453fc	["*"]	2024-11-07 14:17:39	\N	2024-11-07 13:16:10	2024-11-07 14:17:39
834	App\\Models\\User	1	api	c12f89193b8815f37e21757a8f5a1ef36e6a099b13a5a7232c328639b3c8bd87	["*"]	\N	\N	2024-11-08 16:57:38	2024-11-08 16:57:38
835	App\\Models\\User	1	api	29a139ef52056cac5110b01639fe70d197bbb721798b399806797c0b92a6b7a4	["*"]	\N	\N	2024-11-08 16:57:43	2024-11-08 16:57:43
960	App\\Models\\User	251	api	4458836633917d572f725f0e4ad9bcae3a33dc83eae9c9a1cef35d041956611c	["*"]	2025-02-05 16:48:38	\N	2025-02-05 14:23:43	2025-02-05 16:48:38
857	App\\Models\\User	238	api	05b1311680c802629273bcecc40f297c5abb2c7a1010870ad55ce8285f8a9ade	["*"]	2024-11-21 12:02:59	\N	2024-11-21 11:46:07	2024-11-21 12:02:59
852	App\\Models\\User	232	api	e0d0d384ef357a6280b33ef59f429b641183dfc56f2d13501595f55719640f09	["*"]	2024-11-20 10:33:13	\N	2024-11-20 10:08:28	2024-11-20 10:33:13
821	App\\Models\\User	232	api	6f302772dcf7467cfd14e997e08da17b61eb2a08424f73bb9cbb640c0038fc19	["*"]	2024-11-07 19:18:13	\N	2024-11-07 16:13:47	2024-11-07 19:18:13
829	App\\Models\\User	231	api	2e262e6b5d3e66bb50aea17fb3d83bc93e12cb99f4366823f4d169433501f0f6	["*"]	2024-11-08 11:28:57	\N	2024-11-08 11:08:45	2024-11-08 11:28:57
851	App\\Models\\User	232	api	cdc08526ddd6ef27e3755e88fa4f83296945e6fed6a58961095a2744330b00c4	["*"]	\N	\N	2024-11-20 09:59:40	2024-11-20 09:59:40
830	App\\Models\\User	231	api	37c243a7284ddf8b70768803526e26793cf95c75d6f811e5a230d74047d24d8a	["*"]	2024-11-08 11:31:32	\N	2024-11-08 11:31:22	2024-11-08 11:31:32
850	App\\Models\\User	232	api	35020f7c9e2c55b3c8e11234c729d7a344f1c951f5d8a8356753fd715d18c592	["*"]	2024-11-20 11:59:21	\N	2024-11-20 09:30:19	2024-11-20 11:59:21
967	App\\Models\\User	251	api	e8227d7632ce04022fc23e7cd432c82f1fcd4bd85600ec0e4ff6f04241acaf60	["*"]	2025-02-06 09:38:09	\N	2025-02-05 18:20:38	2025-02-06 09:38:09
972	App\\Models\\User	254	api	97e34461d5e72713fead885bf5701391f1120a7670eaf1682c496bf3935f95e0	["*"]	2025-02-06 13:47:11	\N	2025-02-06 11:27:46	2025-02-06 13:47:11
820	App\\Models\\User	231	api	5a8e6c598b7ad0a96e1a034919557d1313df3b0895eea065998459cf99fbb864	["*"]	2024-11-08 08:44:39	\N	2024-11-07 14:21:34	2024-11-08 08:44:39
832	App\\Models\\User	231	api	f9940f15fd2cbd6cd775e4a2740d512d2516fa61bdcd18ec4c7dff82617f64ab	["*"]	\N	\N	2024-11-08 11:55:09	2024-11-08 11:55:09
825	App\\Models\\User	231	api	b4160e057d36c2e44ca05475e21731eeb8fa0096d1981f078533e10ec2ee5dfa	["*"]	2024-11-08 09:15:16	\N	2024-11-08 09:15:15	2024-11-08 09:15:16
842	App\\Models\\User	232	api	482c0553c3a9f00f8893003c8e7ae03cbe9c65f7d679a38e17d62380fa586187	["*"]	2024-11-16 15:01:42	\N	2024-11-16 15:01:08	2024-11-16 15:01:42
847	App\\Models\\User	238	api	75fa461d24b26c8811ab798e4336836525ccd35ef0091892dd49cf8a6e2d08d3	["*"]	2024-11-20 09:17:42	\N	2024-11-19 14:19:15	2024-11-20 09:17:42
839	App\\Models\\User	238	api	ebab91c9de71cd44d6042c52a9fc3b9e3b6ac5f466509721046dacee905e4b51	["*"]	2024-11-18 14:16:06	\N	2024-11-08 18:27:10	2024-11-18 14:16:06
855	App\\Models\\User	238	api	edcc93117fc17cea547f90f8613c619942cf43bc12f7538b776c28ebf8982204	["*"]	2024-11-21 00:17:51	\N	2024-11-20 23:51:49	2024-11-21 00:17:51
848	App\\Models\\User	238	api	cb67d046cd611a6c5154b1e8236d14ba33f97558a2c0825667c306dd9f979e16	["*"]	2024-11-21 11:59:18	\N	2024-11-19 19:28:13	2024-11-21 11:59:18
845	App\\Models\\User	241	api	6f9b3de404452f334ec4d1d1b0e5fbea7390473519c88a3a070b9bb13d57cbaa	["*"]	\N	\N	2024-11-19 05:47:44	2024-11-19 05:47:44
849	App\\Models\\User	238	api	62288d9f05351fbc5d2dd9174bfafc8e1dd6d5758eedf894ddf90be0bcb40d47	["*"]	2024-11-19 21:07:33	\N	2024-11-19 20:58:13	2024-11-19 21:07:33
977	App\\Models\\User	254	api	3ad5f69ba8418a3b00b738ab998a5033ffeb4d56186aad4c9ac9729f65f1e0a7	["*"]	2025-02-06 15:27:54	\N	2025-02-06 13:49:11	2025-02-06 15:27:54
853	App\\Models\\User	238	api	0b49738a6ad877a7db5e907c69a3b95049a641c76090cf66fd1ef4d993d58a79	["*"]	2024-11-20 21:20:26	\N	2024-11-20 15:09:53	2024-11-20 21:20:26
858	App\\Models\\User	238	api	8a318424cddd8aea34cf9a7081c6d98431c7e9ff1ac473c5fdce996256c4c365	["*"]	2024-11-21 12:02:09	\N	2024-11-21 12:02:01	2024-11-21 12:02:09
862	App\\Models\\User	238	api	0ddbfc91f6219b3f1ccd76199d902fb616d993ff5dafc1e574f20fdfc4e2f62e	["*"]	2024-11-23 19:25:42	\N	2024-11-21 15:48:51	2024-11-23 19:25:42
859	App\\Models\\User	238	api	45b665736348be9617e270e4fe24d1d3fd7057af44ee31b96d21e70c70241de9	["*"]	2024-11-21 12:07:33	\N	2024-11-21 12:06:15	2024-11-21 12:07:33
823	App\\Models\\User	232	api	5cf9c0513a7140cc51660055ea5db92a511bc8d1758aff2ba63732b1c17b7554	["*"]	2024-11-22 17:09:27	\N	2024-11-07 17:13:57	2024-11-22 17:09:27
866	App\\Models\\User	238	api	916f34c4c6152921c8e5cfcdfccd0809b8d1e18e186a3dca12c4703b1c29617f	["*"]	2024-11-25 12:46:05	\N	2024-11-25 11:40:31	2024-11-25 12:46:05
863	App\\Models\\User	238	api	af33478bae824c1d614179b2adf0bd3e39de7c6821f0c5d1917b89300ea0319b	["*"]	2024-11-23 19:20:28	\N	2024-11-23 12:37:57	2024-11-23 19:20:28
868	App\\Models\\User	238	api	6103a55965aca6c7c206b82fa257bea3a3a8e7f5212dd60281dcdb8444714e76	["*"]	2024-11-25 16:26:50	\N	2024-11-25 14:17:56	2024-11-25 16:26:50
867	App\\Models\\User	238	api	2107f477fb6ea0bafc9bf7847b0141ba389cceaefe63fc05e84a2de06dc49ae7	["*"]	2024-11-25 16:17:58	\N	2024-11-25 13:59:11	2024-11-25 16:17:58
870	App\\Models\\User	238	api	d622be3f3c3d7215f220c543402215247b070ce4c3cec959197c3f58b3a7778d	["*"]	\N	\N	2024-11-25 16:43:15	2024-11-25 16:43:15
892	App\\Models\\User	231	api	5ad8bb2ae9e9b60cbda6a950fe55a50bcd9c9512c506c8dca33a2e03ac4c6635	["*"]	2024-12-15 05:57:32	\N	2024-12-15 05:29:42	2024-12-15 05:57:32
894	App\\Models\\User	231	api	19249315d32ffab8a37c7dd457219215a9af428648b49ef86e566cf127464066	["*"]	2024-12-15 06:55:26	\N	2024-12-15 06:09:24	2024-12-15 06:55:26
886	App\\Models\\User	238	api	382bd7e6fdcd6a703946319206474118fa44a906df74c26d856009ddfd0a824d	["*"]	2024-12-14 10:34:03	\N	2024-12-14 10:00:43	2024-12-14 10:34:03
917	App\\Models\\User	244	api	772e80d1e1f3d7957ed8b505ae59f1ca8d92b6c196a9a78cf31418b0783fb820	["*"]	2024-12-17 19:30:27	\N	2024-12-17 19:30:23	2024-12-17 19:30:27
901	App\\Models\\User	231	api	79c94e5ecc6b7e0c9d615fe8ac97a3a5ae15443dd2aa3859388953333d9845d0	["*"]	2024-12-17 13:11:38	\N	2024-12-17 09:54:08	2024-12-17 13:11:38
952	App\\Models\\User	251	api	02145cc043e69c2b7fbb0967861123f8734e7f15995ba003007ea3f8c83224cb	["*"]	2025-02-05 12:20:03	\N	2025-02-05 12:18:43	2025-02-05 12:20:03
923	App\\Models\\User	245	api	cffa841d8fd2995d8c0488f01a8bcdde38928d12f677191378e0a32b067840a9	["*"]	2024-12-17 23:09:18	\N	2024-12-17 22:56:33	2024-12-17 23:09:18
898	App\\Models\\User	231	api	0288901cf206d491b262cbe8339f98d4a706c4d470562a465ec8610a0f7076ed	["*"]	2024-12-17 08:51:37	\N	2024-12-15 07:59:23	2024-12-17 08:51:37
871	App\\Models\\User	238	api	8f82f05313718125929254858f4ebfea735a0c2359292a94ca8a4476c6d66d1e	["*"]	2024-12-13 18:43:06	\N	2024-12-13 17:32:37	2024-12-13 18:43:06
836	App\\Models\\User	236	api	116fc5d01661e02b3a6bd9315aa36f6852a94921ab26f920b69710a4424dfd89	["*"]	2025-02-07 14:39:23	\N	2024-11-08 17:04:11	2025-02-07 14:39:23
884	App\\Models\\User	231	api	50169b8a40577d2ef0eb9ce4d9932272f37474f041f77968990f7f0064787f02	["*"]	2024-12-13 22:37:15	\N	2024-12-13 22:23:46	2024-12-13 22:37:15
885	App\\Models\\User	238	api	7bc50305cc2248b31181d247ff469a4ceb71422d2254a3e50c93fa718e02d6d7	["*"]	\N	\N	2024-12-14 10:00:35	2024-12-14 10:00:35
961	App\\Models\\User	251	api	59d0e576f4c406b8a3ac1fe5028fa5ec374dcfb83eaff598a6ac8a60cced59cf	["*"]	2025-02-05 15:38:14	\N	2025-02-05 15:36:32	2025-02-05 15:38:14
896	App\\Models\\User	231	api	2ff61ebbd98934c3298dff3ab668d8c63a26638a10b8b8dea416a687e4b40d7c	["*"]	2024-12-15 07:39:04	\N	2024-12-15 07:36:57	2024-12-15 07:39:04
890	App\\Models\\User	231	api	458029b40a484dc0b730341e88c4baecd563722645115d802d5b7943cc078c49	["*"]	2024-12-15 05:18:14	\N	2024-12-15 04:52:38	2024-12-15 05:18:14
878	App\\Models\\User	238	api	4e4043f9628db4ea7edb034c7453460c32b68f19124a4219d52c8e43eb062a99	["*"]	\N	\N	2024-12-13 22:00:31	2024-12-13 22:00:31
879	App\\Models\\User	238	api	bcd98194dc7de197ec70bd7b63a2e6f8c1ff9ff8776320a4c7cf0642bd8acbf4	["*"]	\N	\N	2024-12-13 22:02:50	2024-12-13 22:02:50
880	App\\Models\\User	242	api	ab442e114e3a3423c7587251b449d1f00e267c5dd1717eaf6d96d7a0bf31a18d	["*"]	\N	\N	2024-12-13 22:05:47	2024-12-13 22:05:47
891	App\\Models\\User	231	api	3182b1b0128ae82b51543c80d159ef918e0145b318bff67a504b915bcd29abc7	["*"]	2024-12-15 05:25:16	\N	2024-12-15 05:24:59	2024-12-15 05:25:16
889	App\\Models\\User	243	api	6336ebd1783edcde30ab71a7af948b28c603b15cd7fa7496d0c89fa5cdf4eb4b	["*"]	2024-12-16 10:02:02	\N	2024-12-14 17:09:45	2024-12-16 10:02:02
905	App\\Models\\User	244	api	b972f6dce4f2924cbd00817c991925f612d4224388a45b1d91e045047009e890	["*"]	2024-12-17 12:12:52	\N	2024-12-17 12:08:06	2024-12-17 12:12:52
893	App\\Models\\User	231	api	db4d4c047f13970ae5b4e1a13d297ef50b98981def084224c03f80be4e38a069	["*"]	2024-12-15 06:06:03	\N	2024-12-15 06:00:42	2024-12-15 06:06:03
897	App\\Models\\User	231	api	99435c611c16256fa5b2c909afe1d170f52e3c8dc6e45a9e81a899945d3d4889	["*"]	2024-12-15 07:53:04	\N	2024-12-15 07:52:21	2024-12-15 07:53:04
883	App\\Models\\User	231	api	d9459eb1de49705475464357a1d01f029799949f0a66f04dd1f76ef3a01340de	["*"]	\N	\N	2024-12-13 22:23:21	2024-12-13 22:23:21
907	App\\Models\\User	231	api	e0580c4eee9304128456dcf1d7965ca2a7ee293ae462f7c0668e6ae7e2ef0f8d	["*"]	2024-12-17 13:16:16	\N	2024-12-17 13:05:15	2024-12-17 13:16:16
895	App\\Models\\User	231	api	901068ee51354c6ddda6bb1ca3c95dac743704645213093a2d9d5ce0b5b5d358	["*"]	2024-12-15 07:35:37	\N	2024-12-15 06:57:54	2024-12-15 07:35:37
888	App\\Models\\User	238	api	6acf0a03dc68cfa435427b95846b3d62c4224386e63ca8564ce5172b3cf9f223	["*"]	2024-12-16 10:08:04	\N	2024-12-14 10:31:59	2024-12-16 10:08:04
904	App\\Models\\User	242	api	d1794e3fccd952dd1c845e3e3b02778b54ebae22dd7aedde6adcc38ab2d512c0	["*"]	2024-12-17 13:05:16	\N	2024-12-17 11:57:28	2024-12-17 13:05:16
906	App\\Models\\User	244	api	60acf7a30d3cbbf242eb392cc05ca9165160e0be731a306b9c7b5ce84c53a20a	["*"]	2024-12-17 12:27:04	\N	2024-12-17 12:20:38	2024-12-17 12:27:04
908	App\\Models\\User	231	api	50ba08a3e5fcafb9b1600b1a2505da1eff4cb9cf350d64ae027109d2cc854ebb	["*"]	2024-12-17 13:20:35	\N	2024-12-17 13:20:30	2024-12-17 13:20:35
902	App\\Models\\User	238	api	a75885c417b27ecc234428fc5804417bf9219ace3fb6105d59f92aa5fff7eb2e	["*"]	2024-12-17 11:50:31	\N	2024-12-17 11:45:19	2024-12-17 11:50:31
899	App\\Models\\User	238	api	43ab569166c1a2805154d46034edc0568bb30d5fba754ec34ebf87d1db2f02dc	["*"]	2024-12-16 09:38:11	\N	2024-12-16 09:32:10	2024-12-16 09:38:11
911	App\\Models\\User	244	api	271e80862049170c5743fd87f2316e420ee2b9618cb97d6fc92879ce82bee74e	["*"]	2024-12-17 17:20:40	\N	2024-12-17 16:02:55	2024-12-17 17:20:40
903	App\\Models\\User	237	api	b5e735d27ec20abd4017d34282c67ee29ebc4d343dd9476c0c8af087f83708b2	["*"]	\N	\N	2024-12-17 11:57:15	2024-12-17 11:57:15
918	App\\Models\\User	244	api	362833c78a62a80f77da4db79c2028b5fb136d6ed2ef0c69369d2dc9b100b63e	["*"]	2024-12-17 19:44:24	\N	2024-12-17 19:39:54	2024-12-17 19:44:24
909	App\\Models\\User	231	api	a5871540b70be7487424222115f6adf2c61d658c6bd6b3bfdbeae2a64edfa49d	["*"]	2024-12-17 13:42:03	\N	2024-12-17 13:40:02	2024-12-17 13:42:03
1239	App\\Models\\User	304	api	a9c8303900b6fbbf387376cff2b1834fdcc52e73201e21d4995ac772f356666c	["*"]	\N	\N	2025-03-13 09:45:56	2025-03-13 09:45:56
914	App\\Models\\User	244	api	587b2c67f16f2e4739e4defd051fad05b96544fe4de8c40c1bee15a706b8b350	["*"]	2024-12-17 18:36:58	\N	2024-12-17 17:59:54	2024-12-17 18:36:58
910	App\\Models\\User	231	api	33cca3294aa0e7bbdacee740f36d54ed6f8501642f7db02366aa8310520d370e	["*"]	2024-12-17 19:24:24	\N	2024-12-17 13:46:09	2024-12-17 19:24:24
930	App\\Models\\User	244	api	4f3f76a39c5117b757950971f96c2d802f65762cc69203e8e2460df213d1cbf0	["*"]	2024-12-18 11:54:34	\N	2024-12-18 11:53:01	2024-12-18 11:54:34
925	App\\Models\\User	245	api	c0c91a501fc34e587fea487fbe74d7c3a54e26903e8bd9bff4f113c14f3a29e6	["*"]	2024-12-18 09:30:36	\N	2024-12-18 09:26:02	2024-12-18 09:30:36
926	App\\Models\\User	245	api	a09b620d4d5dfa5b8a631f8ac259bc78692ef1699406ea4357a420fc947c41a5	["*"]	2024-12-18 09:43:22	\N	2024-12-18 09:37:19	2024-12-18 09:43:22
934	App\\Models\\User	245	api	df57e07f3a7eed34586c9806f42fb6f0d25fa2a696e2623fce597e5e57dbed53	["*"]	2024-12-18 19:10:35	\N	2024-12-18 17:27:15	2024-12-18 19:10:35
933	App\\Models\\User	245	api	6e5ee4b47f5838ab47432417a8f7f9bfb3bbc8fa4c87b9ec6a31117e62133c2c	["*"]	2024-12-18 16:39:31	\N	2024-12-18 16:39:31	2024-12-18 16:39:31
931	App\\Models\\User	238	api	41e95e2cc69a5a1517fe7f2d23c03bfea48dab2691e9d87b14a11a515fe1150c	["*"]	2024-12-18 11:56:50	\N	2024-12-18 11:56:41	2024-12-18 11:56:50
928	App\\Models\\User	245	api	b916230f2a4b2befbb613b0e668861feca7504476c0fbf07f34bdb766b87776f	["*"]	2024-12-18 19:07:43	\N	2024-12-18 09:48:10	2024-12-18 19:07:43
1219	App\\Models\\User	254	api	f4a8ed92c8d8788f2d5a274d170b17bdccabb77ab95e8e16d0dd30f319221f7c	["*"]	2025-02-25 12:01:43	\N	2025-02-25 12:00:37	2025-02-25 12:01:43
1223	App\\Models\\User	254	api	d823106138c5264330967ab0e523d89c2e0a4113b0753545adbd8d8eae89b030	["*"]	2025-02-28 10:23:31	\N	2025-02-28 06:36:54	2025-02-28 10:23:31
1074	App\\Models\\User	261	api	6c8adcf640eeee2fdf71ad17cf6dd4b6bae04a7644946c3302126d5e113a85af	["*"]	2025-02-10 15:54:39	\N	2025-02-10 06:53:31	2025-02-10 15:54:39
962	App\\Models\\User	251	api	5af71ca28eee7c9259d20e7bc05a02680fd1df8c7ee5fa2fcfb3df355af066d4	["*"]	2025-02-05 15:45:44	\N	2025-02-05 15:45:23	2025-02-05 15:45:44
1086	App\\Models\\User	254	api	22fd2a96c56ebd3565011ce2013a0bd9f09e9c39fa93fda7367fa06f50ee02d6	["*"]	2025-02-10 13:19:01	\N	2025-02-10 12:40:08	2025-02-10 13:19:01
937	App\\Models\\User	245	api	966850a97b288970db3500484da943888c913f51922ec7429aa46a6ac0e577f5	["*"]	2024-12-18 19:29:15	\N	2024-12-18 19:28:03	2024-12-18 19:29:15
1060	App\\Models\\User	262	api	c266a542a24d5d383ddb464db18f308360e90e4b9714bd5e4eb552c9b3a53573	["*"]	2025-02-09 16:05:23	\N	2025-02-09 15:29:53	2025-02-09 16:05:23
1229	App\\Models\\User	297	api	052e77d7cae142956a96a5db6200b38933f9a9f012805a63da14104a70f71bb7	["*"]	2025-03-12 06:57:57	\N	2025-03-10 12:11:42	2025-03-12 06:57:57
1062	App\\Models\\User	254	api	88ff9733a0fe998cc09d05b4348228dfd6f2364882079cb0f488ebb9ca2738ea	["*"]	\N	\N	2025-02-09 16:20:57	2025-02-09 16:20:57
1046	App\\Models\\User	264	api	fd9a8bc05483542a18362d24cb3720738313c226ee00790486efa973a142975c	["*"]	2025-02-09 20:10:54	\N	2025-02-09 12:55:37	2025-02-09 20:10:54
1084	App\\Models\\User	264	api	c19b61089fd87108b67f0415f86e44a82c0acc34d600c0ba442b7d71db6fb888	["*"]	2025-02-10 12:27:55	\N	2025-02-10 12:10:27	2025-02-10 12:27:55
1089	App\\Models\\User	254	api	755509ffe5ae6247e5aed5bfb41c6395f1acaa40411fbbbb0e750a07194cf9cc	["*"]	2025-02-11 09:30:06	\N	2025-02-10 13:58:38	2025-02-11 09:30:06
994	App\\Models\\User	255	api	f6ddd190eaf4be33550fe960ff9523d16bcfc6295fa126363fd9f9d80bf11fb7	["*"]	2025-02-07 09:57:59	\N	2025-02-07 09:10:32	2025-02-07 09:57:59
999	App\\Models\\User	249	api	4f9a1a438444bdc924415275525f0a5f9499bb3cd6d372c329c1b213bf2b110c	["*"]	2025-02-07 12:56:38	\N	2025-02-07 12:17:42	2025-02-07 12:56:38
991	App\\Models\\User	253	api	47d374764c1cbabfb1c0d63df632f1042445d9884c351e699dc32ca421346944	["*"]	2025-02-07 01:14:56	\N	2025-02-07 01:11:28	2025-02-07 01:14:56
953	App\\Models\\User	251	api	0e2669b8fb231811ca15b0a524fed9dbcf050fedf5e7264922a4ca1f6bfd659e	["*"]	2025-02-05 12:50:46	\N	2025-02-05 12:25:08	2025-02-05 12:50:46
1036	App\\Models\\User	263	api	28eb4cc75ecba83d59f327c78cfaef6d6f5916279d330dd16bfc9ce6e1febab3	["*"]	2025-02-08 10:39:41	\N	2025-02-08 10:39:41	2025-02-08 10:39:41
1017	App\\Models\\User	253	api	e37e52b046c174e8936445764604d644010e82f228258d52db17001c346b26b3	["*"]	2025-02-07 20:48:32	\N	2025-02-07 19:08:06	2025-02-07 20:48:32
1020	App\\Models\\User	258	api	eb0be93de8146e9e188b875d6cee9d573b804292fe61ef511fd39592896d5989	["*"]	2025-02-09 12:40:08	\N	2025-02-07 23:30:16	2025-02-09 12:40:08
1064	App\\Models\\User	262	api	591caff4049046db4dfe22dffa654ca94fbf1346d081f217fa107ac44fd437d6	["*"]	\N	\N	2025-02-09 17:29:19	2025-02-09 17:29:19
1080	App\\Models\\User	262	api	6a4f6baaf50ee474fd6b826dd09f980f2d08915ee59346804d2ee03e6405e8cd	["*"]	\N	\N	2025-02-10 11:22:33	2025-02-10 11:22:33
1048	App\\Models\\User	264	api	448c8fa1fcbff38f95a023e2bc0288b0a87a0a8fa284e21fa42b32319458ac03	["*"]	\N	\N	2025-02-09 13:10:43	2025-02-09 13:10:43
1072	App\\Models\\User	262	api	121a95228ce1978ef3db410d8297e41338d4b7b169a4a2b4d115bf267620f717	["*"]	2025-02-10 09:49:24	\N	2025-02-09 21:44:10	2025-02-10 09:49:24
1054	App\\Models\\User	262	api	935449a62177dbcc8cc89a519d6b7de8749a050b656fed8e4374bed13487c779	["*"]	2025-02-09 14:15:04	\N	2025-02-09 14:11:51	2025-02-09 14:15:04
1045	App\\Models\\User	258	api	4ba05d5c0132484fdc9e24d48602eaa2c8020f9b3aea441c0203eecdc2a030be	["*"]	\N	\N	2025-02-09 02:38:54	2025-02-09 02:38:54
1070	App\\Models\\User	262	api	918b44dbcd3c1e1cb940f61f8576e73e50c4b62a9756ea040467ec159bc45d9c	["*"]	2025-02-09 21:38:42	\N	2025-02-09 21:27:14	2025-02-09 21:38:42
1098	App\\Models\\User	254	api	ac634a71d19dc1b22b4c1341c9dbbae7e68ca349ff9fc33a5e49bdf00ee553e3	["*"]	2025-02-11 10:22:08	\N	2025-02-11 09:48:21	2025-02-11 10:22:08
1082	App\\Models\\User	265	api	f69d81bbeba7550f26061ee631d57badcede5ce41ab4f14f8a0b1f9d0cc02219	["*"]	2025-02-10 15:16:19	\N	2025-02-10 11:47:46	2025-02-10 15:16:19
1078	App\\Models\\User	249	api	da5086c4ea0e57d0b4282463ac811ea9207ad4a81cf205db74832167c75a3986	["*"]	2025-02-10 11:46:57	\N	2025-02-10 11:14:30	2025-02-10 11:46:57
1095	App\\Models\\User	254	api	4880939d05c48f0c93bb37df50ac49e2ce835a77e29b9d2d4f1b632ccd1aff39	["*"]	2025-02-11 10:08:10	\N	2025-02-11 02:53:05	2025-02-11 10:08:10
1106	App\\Models\\User	255	api	58ea967e80b4d878d5bfcee81dcc9d5b398f9c314365cb06b8534e5c9d319d9b	["*"]	2025-02-11 19:18:23	\N	2025-02-11 11:38:08	2025-02-11 19:18:23
1088	App\\Models\\User	264	api	2f4633e647c7f31bb5a3fe4753b5253e8e2edc94285d877a4f950fdf797d9265	["*"]	2025-02-10 21:00:56	\N	2025-02-10 13:55:22	2025-02-10 21:00:56
1011	App\\Models\\User	254	api	11fcc85ff88cb720f8d466fa6644ed8f6e8356cc47276445ca59ce9821dff2fb	["*"]	2025-02-11 00:16:50	\N	2025-02-07 16:07:39	2025-02-11 00:16:50
1093	App\\Models\\User	255	api	42b76715609bbdf0dfc1d18bfe1cfa263ace076df5cff6db006c2757480e7d36	["*"]	2025-02-10 22:55:07	\N	2025-02-10 22:54:41	2025-02-10 22:55:07
1094	App\\Models\\User	254	api	33e2cf29806507e6eddd218c826a2b71935283385e3e824e8ee25f97d67f63bd	["*"]	2025-02-11 03:45:38	\N	2025-02-11 02:46:06	2025-02-11 03:45:38
1090	App\\Models\\User	266	api	40afa046a7964dfe3aca7f5390d9fac70c7fb3c896ac8b6a54f8f9aac1a4b62d	["*"]	2025-02-11 11:29:44	\N	2025-02-10 16:11:42	2025-02-11 11:29:44
1116	App\\Models\\User	254	api	6b46b8abde682acdb1bb32d27751b8bb89950de5a596cd6f4ac20c0f863d60b0	["*"]	2025-02-11 12:14:48	\N	2025-02-11 12:14:07	2025-02-11 12:14:48
1109	App\\Models\\User	267	api	f7d8f40e603fb542eb6cdea82a4ede9f3b5f80ff29594e16560c4ae959a7a9d0	["*"]	\N	\N	2025-02-11 11:55:49	2025-02-11 11:55:49
1105	App\\Models\\User	262	api	7fc906a68becf57eef05db9d3b91c46c51beb2fe34519ece60b06ce1551941d0	["*"]	2025-02-11 11:32:02	\N	2025-02-11 10:57:38	2025-02-11 11:32:02
1108	App\\Models\\User	267	api	33a2a440640c4a1d150bd972a22d3d9f02953350b3117f6d9ffea12c9da4c3df	["*"]	\N	\N	2025-02-11 11:54:47	2025-02-11 11:54:47
1110	App\\Models\\User	267	api	97531a04b25ff2a5c3c56b5a3f9ce310839495106a293f9fa3445df948ffdbd0	["*"]	\N	\N	2025-02-11 11:56:57	2025-02-11 11:56:57
1112	App\\Models\\User	255	api	2ec0a42f6a6843a1cc56a311bea34fe8e106c483a5acf6c4be9a3f114434215f	["*"]	\N	\N	2025-02-11 12:05:42	2025-02-11 12:05:42
1113	App\\Models\\User	254	api	c0f38c81797e88ccc58ff7b9eea58a696f7f56f00a9a94314e79c1342247ea7b	["*"]	\N	\N	2025-02-11 12:09:39	2025-02-11 12:09:39
1115	App\\Models\\User	267	api	f5d54b525d1210d4f55a3d172370cec4546131e36e6d18a8469e5764c9d27ffe	["*"]	\N	\N	2025-02-11 12:11:28	2025-02-11 12:11:28
1114	App\\Models\\User	254	api	90598aea9de3c9dc7a0b82918075a2359f6941d50f25637d561b7a9a046b6026	["*"]	2025-02-11 12:18:43	\N	2025-02-11 12:10:28	2025-02-11 12:18:43
1220	App\\Models\\User	254	api	f809c6c2530ae014403c76dfda8f8e88c507c1393a775039331705bab7c946f8	["*"]	2025-02-27 20:26:54	\N	2025-02-27 09:17:35	2025-02-27 20:26:54
1123	App\\Models\\User	254	api	f9d009e79b3ab93bd3fe89be7ee50eeb6f6db9366df6d044011dc2ca4a40937f	["*"]	2025-02-11 17:24:16	\N	2025-02-11 17:17:42	2025-02-11 17:24:16
1200	App\\Models\\User	289	api	c739139651c0f75ca60fc00d4762a1610c79bbac0fde9cf8655b262ba853b0c1	["*"]	2025-03-11 16:02:27	\N	2025-02-22 01:38:53	2025-03-11 16:02:27
1119	App\\Models\\User	255	api	6944ebd2889135721b1821e64e8072679626ad586b71b9483fb0c2456bc0f6f9	["*"]	2025-02-11 12:16:18	\N	2025-02-11 12:16:04	2025-02-11 12:16:18
1182	App\\Models\\User	281	api	17aac369bc6c599683a13c00e773d2ba94056c295e9997311c0f4863b96063be	["*"]	2025-02-17 21:10:52	\N	2025-02-17 17:51:06	2025-02-17 21:10:52
1129	App\\Models\\User	269	api	c096cfb92c92fb8186ab2d89c015152f1ef2ca3dd58b4df388c57c69376d6cc9	["*"]	2025-02-12 09:50:18	\N	2025-02-12 05:37:18	2025-02-12 09:50:18
1145	App\\Models\\User	273	api	08bbd17b0b913da2e22889861d3858c25f5ada0220a90d5a4c1ec6c207970e76	["*"]	2025-02-12 18:02:28	\N	2025-02-12 17:22:45	2025-02-12 18:02:28
1143	App\\Models\\User	255	api	af8cc269a75bf6900a5535f89f0de76aa23fa184fdd5c9fa35eeeb364feec0b5	["*"]	2025-02-12 12:45:14	\N	2025-02-12 12:36:50	2025-02-12 12:45:14
1189	App\\Models\\User	249	api	b1b48647df1ea659ad622dea2ac2b56d482c0a814ab65c6df9221d464153c81f	["*"]	2025-02-21 11:44:58	\N	2025-02-21 11:41:25	2025-02-21 11:44:58
1131	App\\Models\\User	271	api	b1eeb1fba7a2aa0082fa199d25ac93a2943cf6082a10a1516412f278839fb92e	["*"]	2025-02-12 10:33:32	\N	2025-02-12 10:32:50	2025-02-12 10:33:32
1152	App\\Models\\User	276	api	5e02ec7dc40650c8c7da61f6da56634cac9d68e89d9b80ff5c63433f7a0fc78a	["*"]	2025-02-12 20:25:58	\N	2025-02-12 20:24:25	2025-02-12 20:25:58
1144	App\\Models\\User	264	api	8ac0df969151af88254ab4c4c5c7f6f318ede78a6b168b8c3b83e5f6e375c53d	["*"]	2025-02-12 17:17:01	\N	2025-02-12 14:56:40	2025-02-12 17:17:01
1153	App\\Models\\User	276	api	3f321f6c76a1a92a6b7d4f7a593182a095c30a4f17ada83e854d32fff4ffc86b	["*"]	2025-02-12 20:27:24	\N	2025-02-12 20:25:58	2025-02-12 20:27:24
1135	App\\Models\\User	272	api	2bde93641926c8cfdd2be84ef82748cb4ca1bdcb53f76d087292866030937c10	["*"]	\N	\N	2025-02-12 11:26:33	2025-02-12 11:26:33
1118	App\\Models\\User	254	api	104d63d82081f31f0c8b8f8384fb4f3c40a3a813b09468a416fa1756398a85d6	["*"]	2025-02-11 17:17:41	\N	2025-02-11 12:15:59	2025-02-11 17:17:41
1183	App\\Models\\User	254	api	048533a80fdca38c46f381b87761da8d7c236f507509fda986395334c58a967e	["*"]	2025-02-17 20:51:33	\N	2025-02-17 20:51:30	2025-02-17 20:51:33
1139	App\\Models\\User	249	api	acded0b2b6b865a49982645bce95b5d9cbe220111d24a4057c77a91aa0bf4776	["*"]	\N	\N	2025-02-12 12:13:56	2025-02-12 12:13:56
1159	App\\Models\\User	254	api	b19367c3c73e8f93fc21283f006ae63df535fd37ffb12ff5fed5fc25aa0f982c	["*"]	\N	\N	2025-02-13 10:02:47	2025-02-13 10:02:47
1163	App\\Models\\User	254	api	ce111e813953d1c9e990fc8e32c8a430fbaa0022349e9e7ddc0a7c81c63cd234	["*"]	\N	\N	2025-02-13 11:17:51	2025-02-13 11:17:51
1160	App\\Models\\User	254	api	f164eb43ced38109c780922ed9fc0394ffb7e24fa1d374a2e979a6ea53c8083d	["*"]	2025-02-13 10:05:10	\N	2025-02-13 10:03:30	2025-02-13 10:05:10
1146	App\\Models\\User	274	api	b1a31d8205d13e584dc980d3880038e0d46b85a7df6f99b3af01af7b6f8a2f87	["*"]	\N	\N	2025-02-12 17:46:45	2025-02-12 17:46:45
1177	App\\Models\\User	281	api	76cf6d3bdd768621143eec4ae4a3b116e46c94c26215b4dceee896a0e03a68b6	["*"]	2025-02-17 09:57:45	\N	2025-02-17 09:52:05	2025-02-17 09:57:45
1191	App\\Models\\User	249	api	0226fea9b240c6417d86c1d6ee6f58d7d0b2acd491b8727b8ca023aa65d6e13e	["*"]	2025-02-21 12:23:01	\N	2025-02-21 12:23:00	2025-02-21 12:23:01
1164	App\\Models\\User	254	api	f2b156215202b3fb7b0735ce4e69a8eacb31338492da90d9b1f02cddd8255b74	["*"]	2025-02-13 11:20:40	\N	2025-02-13 11:18:47	2025-02-13 11:20:40
1166	App\\Models\\User	254	api	2154c303f2208d60ef2902a3d753432408e7fbfad0ec22d2743139b9d882570c	["*"]	2025-02-13 11:21:03	\N	2025-02-13 11:21:03	2025-02-13 11:21:03
1169	App\\Models\\User	279	api	c15100b99bd6eee6cad7f63f33a2c1e5f845e1e3cab2f6c6b76c09661ed92755	["*"]	\N	\N	2025-02-13 23:00:08	2025-02-13 23:00:08
1192	App\\Models\\User	249	api	7faf48f3207820cbf58d4beea904234e289d5519609cbf7722da179805b35a55	["*"]	\N	\N	2025-02-21 12:27:14	2025-02-21 12:27:14
1157	App\\Models\\User	278	api	299daabb60e2f445e59fabf5704fc8abffe35f6d2d4b07e1be84ff96a0351737	["*"]	2025-02-13 11:29:57	\N	2025-02-13 09:41:23	2025-02-13 11:29:57
1170	App\\Models\\User	279	api	e47ad09fe6e801602277942835df2924a2298a2e4370dd7c712b3dd80ffd4495	["*"]	\N	\N	2025-02-13 23:00:31	2025-02-13 23:00:31
1193	App\\Models\\User	249	api	66ed8c825066f12bf033725327305480b4a752a05a67edead340cee1340a0816	["*"]	\N	\N	2025-02-21 12:34:25	2025-02-21 12:34:25
1121	App\\Models\\User	255	api	1ca1ce02d1c50cf221cf0141570db025922241fdf3a34d129241d0f74caac294	["*"]	2025-02-16 15:37:06	\N	2025-02-11 12:27:55	2025-02-16 15:37:06
1168	App\\Models\\User	279	api	4d8daf82fe4e81e473bb1d81970e85973700328efb764bb74867ed7dc2d0766d	["*"]	2025-02-13 23:04:39	\N	2025-02-13 22:52:17	2025-02-13 23:04:39
1176	App\\Models\\User	280	api	eeb64ef0868042885d73ecea311106494f97dbc81e87f4997a0864e0120250c6	["*"]	2025-02-17 09:47:54	\N	2025-02-17 09:47:53	2025-02-17 09:47:54
1186	App\\Models\\User	249	api	068fb106a0edc34e4a1a96ee706181536d8a37e916263eb09840db0cee582c85	["*"]	\N	\N	2025-02-21 10:33:12	2025-02-21 10:33:12
1190	App\\Models\\User	249	api	1e8347e0d14eeccddc0853daedb641b256a367173be932e2a1b062ed0794a3e8	["*"]	2025-02-21 11:55:26	\N	2025-02-21 11:54:27	2025-02-21 11:55:26
1198	App\\Models\\User	287	api	4a52ac7999273baec9f21742b35cb186127bf43e5fad5f8ce4344bd8ea14f2f0	["*"]	2025-02-22 01:31:35	\N	2025-02-22 01:30:51	2025-02-22 01:31:35
1179	App\\Models\\User	281	api	cfd8abeb07cf91b49ff2f0c2c8a1305c5202677add06e23ede6b31ef4ccb9e14	["*"]	2025-02-21 03:42:36	\N	2025-02-17 12:02:23	2025-02-21 03:42:36
1187	App\\Models\\User	282	api	66efd200408d525cf24945d01ab6bfc2bba18e78365523ebd2136da175568149	["*"]	\N	\N	2025-02-21 11:14:00	2025-02-21 11:14:00
1195	App\\Models\\User	254	api	fb24bfcf388bebefe7673ff5430748245bff92f7afe2d8ae60ff1c4e20b8c329	["*"]	2025-02-21 17:23:38	\N	2025-02-21 15:47:43	2025-02-21 17:23:38
1196	App\\Models\\User	254	api	03722249f9ec7765d34a921f2689f2baae7a2fe1c1287f0216f4e2b3ab63f30a	["*"]	\N	\N	2025-02-21 17:21:27	2025-02-21 17:21:27
1199	App\\Models\\User	288	api	3cd47d5e4a1c5388319959019453d3567411811c95b67ecf4bea3983d21cb419	["*"]	2025-02-22 01:34:45	\N	2025-02-22 01:33:29	2025-02-22 01:34:45
1201	App\\Models\\User	289	api	7c79a379c969dfd786daf4a0435e2c5a614ab19aed630ca55b2f8aa777fd6eaf	["*"]	\N	\N	2025-02-22 01:39:13	2025-02-22 01:39:13
1204	App\\Models\\User	249	api	487102d27967cd986cbc3176a80ad47e33494165359c7113e077eecffe309004	["*"]	\N	\N	2025-02-22 03:10:12	2025-02-22 03:10:12
1275	App\\Models\\User	313	api	277981135d34e9e6b6df6b09998ceb0bb86ae6a052f3eab0f8d14de327feaaba	["*"]	2025-04-11 11:57:58	\N	2025-04-11 10:37:51	2025-04-11 11:57:58
1206	App\\Models\\User	261	api	0693b0d5dead71867e9f69045f074941ee5aa79f888d4a9c3f58e9e77aa15e7d	["*"]	\N	\N	2025-02-22 03:11:03	2025-02-22 03:11:03
1207	App\\Models\\User	261	api	6ff2afcc75c5f0d6f4ad24c81e5b4c636c537889d3ace41929391d8ea4f8996a	["*"]	\N	\N	2025-02-22 03:11:22	2025-02-22 03:11:22
1208	App\\Models\\User	249	api	4120bbfdedab9dfe846c84714f47e728ff800d8228662ffed5763197e02ec1e5	["*"]	\N	\N	2025-02-22 03:13:19	2025-02-22 03:13:19
1209	App\\Models\\User	249	api	f32237464f9eed662130f7709109f10996d8df3b424d23dbb603a0e8ff25ab97	["*"]	\N	\N	2025-02-22 03:19:18	2025-02-22 03:19:18
1210	App\\Models\\User	249	api	442bd9ebbe524b2716d85d176a4f10e7df8bb030a76d2f5a181bb5728f4aa6bd	["*"]	\N	\N	2025-02-22 03:19:40	2025-02-22 03:19:40
1211	App\\Models\\User	254	api	681fbccf16d0e06be6fce3617393b5974bdc5cc2c2ed73e40095de36d50476b7	["*"]	2025-02-24 15:13:19	\N	2025-02-24 15:13:19	2025-02-24 15:13:19
1212	App\\Models\\User	254	api	dd20b0b43df084f281c722dac9cc1130625ff0bd178d044e499999c0ceaf0051	["*"]	\N	\N	2025-02-24 15:15:29	2025-02-24 15:15:29
1205	App\\Models\\User	261	api	ccdc8b042969141e5d5d580845d0cd2c70b6f59e04be9eefbc78c4af6aedc68c	["*"]	2025-02-24 22:18:08	\N	2025-02-22 03:10:24	2025-02-24 22:18:08
1171	App\\Models\\User	279	api	10fb3adbd64a394e55c9bcdc0e9b9820e0bfa54c31c6dfb0a5d097529d718a43	["*"]	2025-03-12 01:17:22	\N	2025-02-13 23:04:40	2025-03-12 01:17:22
1254	App\\Models\\User	317	api	1810e5598026b392bc97bb5a4c69e1f1e6aaa4830830302d33713ae78079cb76	["*"]	\N	\N	2025-03-20 22:19:05	2025-03-20 22:19:05
1232	App\\Models\\User	254	api	71dfb87ca6fbebcabfdc7392b285c99219737100f9e940723d2aa9c4b5a8696d	["*"]	2025-03-12 08:02:03	\N	2025-03-11 19:44:27	2025-03-12 08:02:03
1263	App\\Models\\User	320	api	06c39d6afa7bfe3ed5079db83bcd242ba9f07d91c27050ed9705da668cb03aa3	["*"]	\N	\N	2025-03-21 15:18:16	2025-03-21 15:18:16
1214	App\\Models\\User	249	api	c463fcc6d29eb0870c8a7554bb85f439a4a9c0fd284510a5357a71a78343c545	["*"]	\N	\N	2025-02-24 20:40:31	2025-02-24 20:40:31
1245	App\\Models\\User	311	api	2a29e009b49d409da20ababd181040c865ad76d69795ffae1a9d4121c5ab600c	["*"]	\N	\N	2025-03-17 19:15:35	2025-03-17 19:15:35
1246	App\\Models\\User	312	api	4b479e90d411a003e47542de6fbd84f38306767a539c7f4d0c24807a3d9943f0	["*"]	\N	\N	2025-03-18 03:02:15	2025-03-18 03:02:15
1237	App\\Models\\User	303	api	45276f48458fb2059f9281b0ca7e0dee9b6fc91a04f3ef3f5d6b19aa5082e4e9	["*"]	2025-03-17 12:34:22	\N	2025-03-13 09:43:37	2025-03-17 12:34:22
1215	App\\Models\\User	249	api	3313c6f0b6f72c957f9d2d153f4ff198a54e2fff725b49a27815e6c79c154e2d	["*"]	\N	\N	2025-02-24 20:44:09	2025-02-24 20:44:09
1231	App\\Models\\User	254	api	ecf843eee97bcabef8a47d8c905bdf74d8253b715b37df4f86d304d335d7607f	["*"]	2025-03-11 16:18:04	\N	2025-03-11 16:09:55	2025-03-11 16:18:04
1216	App\\Models\\User	249	api	6229f9778a4539674cd9ca3de243aa9dfe81c65f51daa81242af0de18bd71a56	["*"]	\N	\N	2025-02-24 20:44:20	2025-02-24 20:44:20
1242	App\\Models\\User	307	api	1446063407c2ee727729d619af9ca7ac92b80b6e11ab0ba5b2145736fe6ef807	["*"]	\N	\N	2025-03-17 14:15:29	2025-03-17 14:15:29
1221	App\\Models\\User	261	api	ce509c1fb71ab03e35c8280b12bbae0f2c8b277d8ae141c3ea1f9e7ca57bc4c0	["*"]	2025-02-28 02:07:58	\N	2025-02-27 19:57:36	2025-02-28 02:07:58
1240	App\\Models\\User	305	api	9eec3150b56e807710bc6000c610dfe6afedb390f7f974659bae0526786fdfec	["*"]	2025-03-17 12:42:21	\N	2025-03-17 12:41:19	2025-03-17 12:42:21
1250	App\\Models\\User	316	api	0b6f7fd6d55953e728878b97b0b53058c2d9010e8b8bf55e954f7d15fced14c7	["*"]	2025-03-19 16:10:48	\N	2025-03-19 16:10:46	2025-03-19 16:10:48
1249	App\\Models\\User	315	api	57814f48554501c514ecbfbcfc096c360b0d2fc06c6980737f59b7f3215e8dd9	["*"]	2025-03-19 19:39:07	\N	2025-03-19 11:24:13	2025-03-19 19:39:07
1230	App\\Models\\User	254	api	a3ab58a64bb11e6650e71bad013b864cba38fd814a93f06492f6158f015118f7	["*"]	2025-03-11 12:37:24	\N	2025-03-11 12:37:23	2025-03-11 12:37:24
1252	App\\Models\\User	314	api	2b8801c505ba3824bf12322426cf318e06197484f8f01140cada794e66983cc3	["*"]	2025-03-20 13:58:58	\N	2025-03-20 13:51:41	2025-03-20 13:58:58
1265	App\\Models\\User	322	api	3e8ec4e39b94b52b9f17c1539066abde936f57baeedb413a9e60fd64d468855a	["*"]	\N	\N	2025-03-21 15:41:09	2025-03-21 15:41:09
1256	App\\Models\\User	318	api	ffd7c2afcf2663afc74488e616082fe741afa502507297942bc7ffc8dc911b6f	["*"]	\N	\N	2025-03-21 14:25:51	2025-03-21 14:25:51
1267	App\\Models\\User	315	api	3af96566f333e88c55f2cd07f410dd6cf646557443f76d266c8e55ae12a6c2c5	["*"]	2025-04-04 08:09:22	\N	2025-03-21 17:23:45	2025-04-04 08:09:22
1257	App\\Models\\User	318	api	a5b5be92923fce8fccece5803218f5083de8a1cf18d311b6a587c58de641e03e	["*"]	2025-03-21 14:26:35	\N	2025-03-21 14:26:33	2025-03-21 14:26:35
1244	App\\Models\\User	307	api	69ad2d9c2d46eb3e2347716dbbae043d147d8bfeaba1b87fdf83b1d220d15b0a	["*"]	2025-03-24 02:47:25	\N	2025-03-17 15:45:59	2025-03-24 02:47:25
1258	App\\Models\\User	319	api	3d5c97b6191af0dc127a61b51f62590a6f960b1c247f5d535bc4bab7d0bcb06f	["*"]	\N	\N	2025-03-21 14:45:25	2025-03-21 14:45:25
1269	App\\Models\\User	323	api	4afa088e09419d75aafcd49a590ec107b3bc51354d968e7613ceca562c2f98ad	["*"]	\N	\N	2025-03-31 17:19:49	2025-03-31 17:19:49
1253	App\\Models\\User	317	api	bc317f906f6d8d3c74c5509591c9a170837258aea98a09c7f8f2fadcf5d51414	["*"]	2025-03-21 11:18:14	\N	2025-03-20 17:07:03	2025-03-21 11:18:14
1259	App\\Models\\User	319	api	42c38fcad58a4c65eda7655d3545f621613b5fe09a0961e04dccc60933a026f5	["*"]	\N	\N	2025-03-21 14:54:54	2025-03-21 14:54:54
1260	App\\Models\\User	319	api	14ae09bd1da18dcbfb6edad42337772f7f5a7c044c257ceb7d4ab970242d58e3	["*"]	\N	\N	2025-03-21 14:55:53	2025-03-21 14:55:53
1261	App\\Models\\User	318	api	97197c9ab066ceade77e70a3383b00271de45748b9b1a58d5f344b7378720071	["*"]	\N	\N	2025-03-21 15:14:28	2025-03-21 15:14:28
1271	App\\Models\\User	315	api	c74a39ad63bb1efdde6534cf75a849406351c2a8e8a269eb355f2f318a7def04	["*"]	2025-04-06 19:46:14	\N	2025-04-06 19:46:13	2025-04-06 19:46:14
1274	App\\Models\\User	313	api	7c3877a480190098e4a593645d38144d231ffe4010b22e4156c23473280c75ee	["*"]	\N	\N	2025-04-11 10:36:23	2025-04-11 10:36:23
1276	App\\Models\\User	313	api	cb61e7261f4cc77db6f8d4db378310d0f438f01935af8c3ead23d6efc86cb236	["*"]	2025-04-11 11:58:19	\N	2025-04-11 11:45:39	2025-04-11 11:58:19
1272	App\\Models\\User	315	api	9a62227cff47c0a5837fba9eb466fcfbd6919f81716619ef6c8fb1f60edd954f	["*"]	2025-04-11 15:17:13	\N	2025-04-08 07:55:36	2025-04-11 15:17:13
1278	App\\Models\\User	315	api	a7218eb4a3a40eb077e147e50ac9a1da0e748b8b98e2b2659dc9f28e14a49910	["*"]	2025-04-11 17:07:25	\N	2025-04-11 17:04:21	2025-04-11 17:07:25
1296	App\\Models\\User	326	api	008bf5fb188b4b54e7f9c5855062f0b4ab69057c8949b7a498d8b44e3a1a3276	["*"]	2025-05-16 15:00:23	\N	2025-05-16 14:50:44	2025-05-16 15:00:23
1287	App\\Models\\User	313	api	1cc4e8ecc01a80a572f76f5e5cd1faa9c67e433cc03df8fe111e36fc98da4485	["*"]	2025-05-16 14:30:20	\N	2025-05-15 14:13:20	2025-05-16 14:30:20
1279	App\\Models\\User	315	api	1238004200b4b70d9940bb967b131f6c34b3cb85adabed80c8774588e6edf0fc	["*"]	2025-04-11 18:14:27	\N	2025-04-11 18:11:29	2025-04-11 18:14:27
1312	App\\Models\\User	330	api	4d6a4b371fe070d92964b54c399c734d093c8fb32908b2d23e3bf119122a5bbf	["*"]	2025-05-17 13:21:34	\N	2025-05-17 12:55:36	2025-05-17 13:21:34
1299	App\\Models\\User	326	api	3d4ab312107aed7f3f724b6874497ba4cc58b2159d6a45b2c58ac8c3139c69b1	["*"]	\N	\N	2025-05-16 15:01:09	2025-05-16 15:01:09
1283	App\\Models\\User	313	api	f581bcfe4bf44a71cab85fca0f080e78af189f75b103a6d956d4e061fd94817b	["*"]	\N	\N	2025-05-06 17:53:37	2025-05-06 17:53:37
1288	App\\Models\\User	315	api	1e63fcb2877313b8c671614a477eccc637db91c25117e796783adde0f4736bd9	["*"]	2025-05-15 14:30:36	\N	2025-05-15 14:18:31	2025-05-15 14:30:36
1307	App\\Models\\User	315	api	26ecf8cd37c832cbc2e75440128137f9c9d21eaf80bfd8605914f6892e1faa67	["*"]	2025-05-17 04:48:26	\N	2025-05-16 21:13:46	2025-05-17 04:48:26
1300	App\\Models\\User	326	api	357874b6b62d931806298f3985dbe83823bb850fe613af1198fbf64d544b0c1e	["*"]	\N	\N	2025-05-16 15:01:37	2025-05-16 15:01:37
1284	App\\Models\\User	313	api	2f4cf3f44269640a977c3f1a902f5e6970afb3e1aed8de6128555e63d57c6f6e	["*"]	2025-05-06 18:18:05	\N	2025-05-06 17:53:48	2025-05-06 18:18:05
1316	App\\Models\\User	331	api	8e4bc6d88822a98a26a10b807840e939b02800b32ac77e8007f5954714dbe6f0	["*"]	2025-05-21 10:22:07	\N	2025-05-20 11:15:34	2025-05-21 10:22:07
1268	App\\Models\\User	323	api	bb797b4670de7cbc790ba9243ca3a942eb1ee6aa9613990c79e4a5b4d05b43af	["*"]	2025-05-16 14:42:18	\N	2025-03-31 15:17:22	2025-05-16 14:42:18
1301	App\\Models\\User	326	api	76d837db4293f9ac0591f75525a9756f134b9c11b5da40a0cfc4dde8b2e8ef97	["*"]	\N	\N	2025-05-16 15:02:54	2025-05-16 15:02:54
1292	App\\Models\\User	313	api	80c9b52f201de02715c2b3a30a529f4762119967506e5876c277e0f01b4f044c	["*"]	2025-05-16 14:44:10	\N	2025-05-16 13:23:14	2025-05-16 14:44:10
1305	App\\Models\\User	327	api	0a63a925be334e99fd30bd0c47126a9bdeb3d0f25ab94c11c71f7b12dac21d12	["*"]	2025-05-16 19:54:52	\N	2025-05-16 19:12:25	2025-05-16 19:54:52
1318	App\\Models\\User	331	api	a95104027c249596539e6fa97570139a4e2be077823e8c27c6f62431c49e7371	["*"]	2025-05-22 12:37:54	\N	2025-05-22 12:16:25	2025-05-22 12:37:54
1290	App\\Models\\User	313	api	0a5684ca38ad84e580c0243f487b7c8977692ca5199d3a11d9d8c6309127016c	["*"]	2025-05-16 13:09:46	\N	2025-05-16 13:08:39	2025-05-16 13:09:46
1302	App\\Models\\User	326	api	4ca5e916c52a5430918d086e0219058df1e908157a5fbba1d5085fabd229e67d	["*"]	\N	\N	2025-05-16 15:03:24	2025-05-16 15:03:24
1291	App\\Models\\User	313	api	317c0fba1106ab9cb75bd32ec4576369d121137d9f56cfa1acf56b42acc6607c	["*"]	2025-05-16 13:21:01	\N	2025-05-16 13:17:46	2025-05-16 13:21:01
1314	App\\Models\\User	330	api	ffe70d206926dd7bca8f013fcc94e1591a99ef31644209adff1784484cfd1be0	["*"]	2025-05-17 13:43:50	\N	2025-05-17 13:43:47	2025-05-17 13:43:50
1294	App\\Models\\User	324	api	8d51e7e23169a0aec82a8dd9d7e264639f02c42ae29fdd47e6a906568be9808b	["*"]	2025-05-16 14:49:25	\N	2025-05-16 14:46:42	2025-05-16 14:49:25
1308	App\\Models\\User	329	api	9a46f6e363367145dba9d787158ec0ef12e86b0dcc23352f5cad895219475d82	["*"]	2025-05-17 10:07:02	\N	2025-05-17 04:50:11	2025-05-17 10:07:02
1293	App\\Models\\User	315	api	141d4de4bd50d09b462dacc62e4f95681a01b7af0dfd991d8bbdb0d319ffdb59	["*"]	2025-05-16 17:24:17	\N	2025-05-16 14:45:15	2025-05-16 17:24:17
1317	App\\Models\\User	325	api	36fd0f11c2771d4ada9534be16b3088b471355c43f785cd3b2bda031a21cf422	["*"]	\N	\N	2025-05-20 12:04:55	2025-05-20 12:04:55
1297	App\\Models\\User	326	api	0f016c574658f60b99d95374b509782bc8ac2ec7896e8feffadbefbf796b1fd9	["*"]	\N	\N	2025-05-16 14:59:26	2025-05-16 14:59:26
1306	App\\Models\\User	315	api	8db74002544564c85cd99c0091dc59f769b3dfc863e21c55b0d4ecadc9c4124f	["*"]	2025-05-16 20:02:56	\N	2025-05-16 20:02:07	2025-05-16 20:02:56
1311	App\\Models\\User	329	api	a3b82f8ac329f3364d2087fda4cc37aece4a480682cdaae4fb3aaf809cdd7450	["*"]	2025-05-17 12:54:37	\N	2025-05-17 12:49:50	2025-05-17 12:54:37
1310	App\\Models\\User	329	api	1b07eae2122274ae310498349940bd11bd87d397c386a25cfd842c178eadaf1a	["*"]	2025-05-17 10:15:18	\N	2025-05-17 10:14:41	2025-05-17 10:15:18
1303	App\\Models\\User	327	api	855a0c00ca08a769dbc492ad1e64237f1481563608ad72e732c8dd3be762a24b	["*"]	2025-05-20 16:30:16	\N	2025-05-16 16:08:18	2025-05-20 16:30:16
1315	App\\Models\\User	330	api	e4201aa4cc9ef13fdd21c46b52a544b82711bf228befc49502331334c772226b	["*"]	2025-05-20 11:14:06	\N	2025-05-17 15:48:11	2025-05-20 11:14:06
1319	App\\Models\\User	331	api	c85f00a8af01c823be726ba7ba42a6e08146197d549d1e7ef17aad17b8f49649	["*"]	2025-05-22 13:03:56	\N	2025-05-22 12:48:17	2025-05-22 13:03:56
1313	App\\Models\\User	325	api	57bb1c13839752f76bf3a451e285789dd7c19d1a979cadbcae91a0ff18b1301f	["*"]	2025-05-22 12:37:08	\N	2025-05-17 13:10:12	2025-05-22 12:37:08
\.


--
-- Data for Name: report_reasons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_reasons (id, reason, created_at, updated_at) FROM stdin;
1	Inappropriate behavior	\N	\N
2	Illegal activity	\N	\N
3	Safety concern	\N	\N
4	Quality of service	\N	\N
5	Other	\N	2025-05-18 13:08:18
\.


--
-- Data for Name: reported_artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reported_artists (id, user_id, artist_id, reason_id, description, attachment_link, contact_info, created_at, updated_at, other_reason) FROM stdin;
1	223	142	1	cheated on me	\N	\N	2024-11-01 10:59:35	2024-11-01 10:59:35	\N
2	233	133	1	Test	\N	\N	2024-11-06 23:42:15	2024-11-06 23:42:15	\N
3	233	133	1	Test	\N	\N	2024-11-06 23:44:03	2024-11-06 23:44:03	\N
4	233	133	5	Test	\N	\N	2024-11-06 23:47:27	2024-11-06 23:47:27	\N
5	234	133	1	The only way I could do that was if you wanted me too I could come and pick it out for the girls to go out with me but you could come over	\N	anil@hjkd.com	2024-11-07 01:04:54	2024-11-07 01:04:54	\N
6	234	133	2	Karen has a great story on how the new album will make you a fan and a friend in a relationship	\N	ghh@hh.com	2024-11-07 01:06:09	2024-11-07 01:06:09	\N
7	234	133	1	cheated on me	672bef7c5899f_1730932604.jpg	\N	2024-11-07 02:36:45	2024-11-07 02:36:45	\N
8	234	133	5	The first time the team had a game in a major tournament in which the players had a game of the day	\N	9715428134816	2024-11-07 02:40:48	2024-11-07 02:40:48	\N
9	234	133	5	The only way I could do that was if you wanted me too I could come uuyyuuu	\N	anilnavis@gmail.com	2024-11-07 02:44:53	2024-11-07 02:44:53	\N
10	234	133	5	cheated on me	672bf415041fc_1730933781.jpg	blame game	2024-11-07 02:56:21	2024-11-07 02:56:21	\N
11	234	133	5	cheated on me	672bf4691e7e1_1730933865.jpg	blame game	2024-11-07 02:57:45	2024-11-07 02:57:45	\N
12	234	133	5	cheated on me	672bf51764399_1730934039.jpg	blame game	2024-11-07 03:00:39	2024-11-07 03:00:39	\N
13	234	133	5	cheated on me	672bf5aa43066_1730934186.jpg	\N	2024-11-07 03:03:07	2024-11-07 03:03:07	blame game
14	234	135	5	The first time the two sides agreed to meet on a single day was when they agreed on the	\N	anilnavis@gmail.com	2024-11-07 03:11:49	2024-11-07 03:11:49	something other
15	234	133	5	cheated on me	672c5a6534c51_1730959973.pdf	\N	2024-11-07 10:12:54	2024-11-07 10:12:54	blame game
16	233	134	1	Test	\N	\N	2024-11-07 11:32:05	2024-11-07 11:32:05	\N
17	233	134	1	Abc	\N	\N	2024-11-07 11:33:21	2024-11-07 11:33:21	\N
18	233	134	1	\N	\N	\N	2024-11-07 11:39:28	2024-11-07 11:39:28	\N
19	233	134	1	Test	\N	\N	2024-11-07 11:47:42	2024-11-07 11:47:42	\N
20	233	134	3	\N	\N	\N	2024-11-07 11:53:47	2024-11-07 11:53:47	\N
21	233	134	2	Abc	\N	\N	2024-11-07 11:54:22	2024-11-07 11:54:22	\N
22	233	134	2	Test	\N	\N	2024-11-07 12:02:22	2024-11-07 12:02:22	\N
23	234	133	5	cheated on me	672c75230dbce_1730966819.pdf	sabeeh@gmail.com - 223344556677	2024-11-07 12:07:01	2024-11-07 12:07:01	blame game
24	233	134	2	Test	\N	971554448644444 - test@test.com	2024-11-07 13:33:49	2024-11-07 13:33:49	\N
25	233	134	3	Test	\N	971554440151515 - test@gmail.com	2024-11-07 13:41:26	2024-11-07 13:41:26	\N
26	233	134	4	\N	\N	971181516166446 - test@test.com	2024-11-07 13:51:02	2024-11-07 13:51:02	\N
27	233	134	3	Test	\N	971919961616161 - test@test.com	2024-11-07 13:58:25	2024-11-07 13:58:25	\N
28	233	134	2	Test	\N	971515115551551 - test@gmail.com	2024-11-07 14:00:58	2024-11-07 14:00:58	\N
29	233	134	2	\N	672c917a6bed8_1730974074.pdf	\N	2024-11-07 14:07:54	2024-11-07 14:07:54	\N
30	232	133	4	The only way I could do that was if you wanted me too I could come and yyyyuu	672cb0ea5a549_1730982122.pdf	9715121581616 - agn@gh.com	2024-11-07 16:22:03	2024-11-07 16:22:03	\N
31	232	134	3	The only way I could do that was if you wanted me too I could come	672cb28526cf1_1730982533.pdf	971523243163 - anil@snil.com	2024-11-07 16:28:53	2024-11-07 16:28:53	\N
32	232	134	4	Quality of service wasn’t great	672ccb7d9f738_1730988925.png	971987654321 - raga@gmail.com	2024-11-07 18:15:25	2024-11-07 18:15:25	\N
33	232	134	5	Artist reached late	672ccd6009f87_1730989408.png	971987654321 - raga@gmail.com	2024-11-07 18:23:28	2024-11-07 18:23:28	Delay
34	234	133	5	cheated on me	672cdfed9f382_1730994157.pdf	sabeeh@gmail.com - 223344556677	2024-11-07 19:42:40	2024-11-07 19:42:40	blame game
35	231	133	1	\N	\N	\N	2024-11-08 01:55:44	2024-11-08 01:55:44	\N
36	231	133	5	\N	\N	\N	2024-11-08 10:50:13	2024-11-08 10:50:13	test other
37	231	133	2	test description	672db590e2716_1731048848.pdf	test@gmail.com - 971321654987741	2024-11-08 10:54:09	2024-11-08 10:54:09	\N
38	236	133	1	The artist was rude	672e0cae25174_1731071150.png	chalent@me.com	2024-11-08 17:05:50	2024-11-08 17:05:50	\N
39	236	135	3	This and that	\N	\N	2024-11-10 17:45:44	2024-11-10 17:45:44	\N
40	236	134	1	The artist was rude	673125e841aaf_1731274216.png	\N	2024-11-11 01:30:16	2024-11-11 01:30:16	\N
41	236	134	1	The artists did	67324f88812d3_1731350408.png	\N	2024-11-11 22:40:09	2024-11-11 22:40:09	\N
42	236	135	2	Bdjdb	\N	\N	2024-11-26 01:38:06	2024-11-26 01:38:06	\N
43	238	134	4	Test	6762979b24af3_1734514587.pdf	\N	2024-12-18 13:36:27	2024-12-18 13:36:27	\N
44	254	250	2	The first time the two sides agreed to meet on	\N	971546468464 - anilnavis@gmail.com	2025-02-07 18:45:25	2025-02-07 18:45:25	\N
45	264	247	1	Fggg	\N	9718555566 - fggg@fggg.com	2025-02-10 12:43:19	2025-02-10 12:43:19	\N
46	264	257	1	Hi	\N	97156658880 - fffgg@fff.com	2025-02-10 12:44:44	2025-02-10 12:44:44	\N
47	279	256	1	D’hégémonie	\N	\N	2025-02-13 23:59:29	2025-02-13 23:59:29	\N
48	275	247	2	\N	\N	\N	2025-02-14 17:21:47	2025-02-14 17:21:47	\N
49	279	134	1	\N	\N	9718451 - vxbdb@dhdh.com	2025-02-20 13:48:09	2025-02-20 13:48:09	\N
50	279	256	3	The Burj Khalifa, located in Dubai, United Arab Emirates, is the world’s tallest building, standing at 828 meters (2,717 feet). Officially inaugurated on January 4, 2010, it serves as a symbol of Dubai’s rapid development and ambition.\n\nDesign and Architecture\n\nDesigned by architect Adrian Smith of Skidmore, Owings & Merrill, the Burj Khalifa’s architecture draws inspiration from Islamic traditions, notably the spiral minaret of the Great Mosque of Samarra. Its Y-shaped tripartite floor plan optimizes space for residential and hotel use, while a central core and wings provide structural support. The exterior features a cladding system designed to withstand Dubai’s extreme temperatures.  ￼\n\nConstruction\n\nConstruction began in January 2004 and concluded in October 2009. The primary structure comprises reinforced concrete, with significant amounts of steel sourced from the demolished Palace of the Republic in East Berlin. The project involved over 22 million man-hours and used 330,000 cubic meters of concrete and 55,000 tonnes of steel rebar.  ￼\n\nFeatures\n\t•\tObservation Decks: The Burj Khalifa offers multiple observation decks, including “At the Top” on the 124th floor and another on the 148th floor at 555 meters, providing panoramic views of Dubai.  ￼\n\t•\tThe Dubai Fountain: Situated at the base, this choreographed fountain system features water displays reaching up to 150 meters, accompanied by music and lights.  ￼\n\t•\tArmani Hotel Dubai: Located within the tower, this luxury hotel occupies the lower floors and offers premium accommodations and dining experiences.\n\nRecords and Achievements\n\nBeyond being the tallest building globally, the Burj Khalifa holds records for:\n\t•\tHighest number of stories: 163 floors.\n\t•\tHighest occupied floor: Level 154.\n\t•\tTallest service elevator: Reaching 504 meters.\n\t•\tWorld’s highest observation deck: At 555 meters on the 148th floor.  ￼\n\nCultural Impact\n\nThe Burj Khalifa has become an iconic landmark, attracting millions of visitors annually. It has been featured in various films, documentaries, and media, symbolizing human ingenuity and the possibilities of modern engineering.\n\nFor more detailed information, you can refer to the Burj Khalifa’s official website.	67b6fb527a14e_1740045138.png	\N	2025-02-20 13:52:18	2025-02-20 13:52:18	\N
51	254	256	1	The first time the two sides agreed to meet on a single	67bd4f1e290b8_1740459806.png	971564005096 - anilnavis@gmail.com	2025-02-25 09:03:26	2025-02-25 09:03:26	\N
52	279	256	1	\N	\N	chalent@me.com	2025-03-12 01:03:17	2025-03-12 01:03:17	\N
53	327	328	1	\N	\N	\N	2025-05-18 13:08:31	2025-05-18 13:08:31	\N
\.


--
-- Data for Name: reported_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reported_users (id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_permissions (id, user_role_id_fk, module_key, permissions, created_at, updated_at) FROM stdin;
128	2	customers	["c","r","u"]	\N	\N
129	2	customers_booking_order	["r"]	\N	\N
130	2	reporting_customers_booking_order	["c","r","u"]	\N	\N
131	2	customer_ratings	["r","u"]	\N	\N
132	2	vendors	["c","r","u","d"]	\N	\N
133	2	vendors_portfolio	["c"]	\N	\N
134	2	vendors_booking	["c","r","u","d"]	\N	\N
135	2	reporting_vendors	["r"]	\N	\N
136	2	reporting_vendors_booking	["r"]	\N	\N
137	3	dashboard	["r"]	\N	\N
138	3	admin_users	["c","r","u","d"]	\N	\N
139	3	user_roles	["c","r","u","d"]	\N	\N
140	3	customers	["r"]	\N	\N
141	3	customer_ratings	["r","u","d"]	\N	\N
142	3	reporting_customer_rating	["r"]	\N	\N
143	3	vendors	["c","r","u","d"]	\N	\N
144	3	vendors_portfolio	["c"]	\N	\N
145	3	vendors_booking	["c","r","u","d"]	\N	\N
146	3	reporting_vendors	["r"]	\N	\N
147	3	reporting_vendors_booking	["r"]	\N	\N
148	3	masters_country	["c","r","u","d"]	\N	\N
149	3	masters_category	["c","r","u","d"]	\N	\N
150	3	cms_pages	["c","r","u","d"]	\N	\N
151	3	vendor_ratings	["c","r","u","d"]	\N	\N
152	3	reporting_vendors_rating	["r"]	\N	\N
56	4	dashboard	["r"]	\N	\N
153	9	customers	["c","r","u","d"]	\N	\N
58	8	admin_users	["r","u"]	\N	\N
59	8	customers	["r","u"]	\N	\N
154	9	customers_booking_order	["r"]	\N	\N
155	9	reporting_customers_booking_order	["c","r","u","d"]	\N	\N
156	9	customers_transactions	["r"]	\N	\N
157	9	reporting_customers_transactions	["r"]	\N	\N
158	9	reporting_customers	["r"]	\N	\N
159	9	customer_ratings	["c","r","u","d"]	\N	\N
160	9	reporting_customer_rating	["r"]	\N	\N
161	9	vendors_booking	["c","r","u","d"]	\N	\N
162	9	reporting_vendors_booking	["r"]	\N	\N
163	9	masters_country	["c","r","u","d"]	\N	\N
164	9	vendor_ratings	["c","r","u","d"]	\N	\N
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, role, status, is_admin_role, created_at, updated_at, deleted_at) FROM stdin;
1	Super Admin	1	1	2024-05-03 08:46:02	2024-05-03 08:46:02	\N
2	Bookings team	1	1	2024-05-03 15:39:02	2024-05-22 16:18:34	\N
3	Admin Team	1	1	2024-05-07 14:27:02	2024-05-22 16:20:36	\N
5	fg	1	1	2024-08-14 15:31:50	2024-08-14 15:36:09	2024-08-14 15:36:09
6	qwerty	1	1	2024-08-14 17:06:18	2024-08-14 17:06:28	2024-08-14 17:06:28
8	Admin Users	1	1	2024-08-15 14:52:34	2024-08-15 14:52:34	\N
4	user2	1	1	2024-08-08 15:39:58	2024-08-19 14:44:09	2024-08-19 14:44:09
7	team	1	1	2024-08-15 08:48:16	2024-08-19 14:44:19	2024-08-19 14:44:19
9	Test	1	1	2024-12-18 18:22:01	2024-12-18 18:22:01	\N
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, meta_key, meta_value) FROM stdin;
4	scl_twitter	https://x.com/DXBMediaOffice?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor
7	scl_linkedin	https://www.linkedin.com/company/dubai/?trk=public_profile_experience-item_profile-section-card_image-click&originalSubdomain=pk
3	tax_percentage	5
10	company_name	Disraption
11	company_address	26985 Brighton Lane, Lake Forest, CA 92630
13	cms_location	{"latitude":"25.1000998","longitude":"55.2380812","location_name":"Dubai Hills Mall Storm Coaster - Dubai - United Arab Emirates"}
14	cms_cancellation_policy	<p>testing cancelation policy</p>
1	whatsapp_dialcode	971
5	scl_facebook	https://www.facebook.com/dubaihillstattoo/
6	scl_instagram	https://www.instagram.com/dubaihillstattoo
8	email	management@dubaihillstattoo.com
9	website	https://www.dubaihillstattoo.com
12	return_policies	[{"dayStart":"1","dayEnd":"4","amount":"0"},{"dayStart":"4","dayEnd":"7","amount":"50"},{"dayStart":"7","dayEnd":"15","amount":"100%"},{"dayStart":"16","dayEnd":"18","amount":"100"}]
2	whatsapp_phone	559160301
15	return_policies_hours	[{"hours":"24","amount":"100"},{"hours":"48","amount":"75"},{"hours":"72","amount":"0"}]
\.


--
-- Data for Name: temp_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_transactions (id, type, p_id, p_status, transaction_data, created_at, updated_at) FROM stdin;
1200	stripe	pi_3RRTa0BjsMxFtgBe1blXOt1E	pending	{"order_id":745,"vendor_id":308,"customer_id":325,"transaction_id":"D8412825","amount":210,"type":"booking_full","status":"success","payment_method":"stripe","p_transaction_id":"pi_3RRTa0BjsMxFtgBe1blXOt1E","p_status":"pending","debid_credit":"debit","app_label":"Outstanding Paid"}	2025-05-22 11:30:17	2025-05-22 11:30:17
1202	stripe	pi_3RRUYtBjsMxFtgBe11ZhClwE	pending	{"order_id":745,"vendor_id":308,"customer_id":325,"transaction_id":"D8692133","amount":210,"type":"booking_full","status":"success","payment_method":"stripe","p_transaction_id":"pi_3RRUYtBjsMxFtgBe11ZhClwE","p_status":"pending","debid_credit":"debit","app_label":"Outstanding Paid"}	2025-05-22 12:33:11	2025-05-22 12:33:11
1205	stripe	pi_3RRV2NBjsMxFtgBe13NdCvhq	pending	{"order_id":746,"vendor_id":328,"customer_id":331,"transaction_id":"D9643013","amount":600,"type":"booking_full","status":"success","payment_method":"stripe","p_transaction_id":"pi_3RRV2NBjsMxFtgBe13NdCvhq","p_status":"pending","debid_credit":"debit","app_label":"Outstanding Paid"}	2025-05-22 13:03:39	2025-05-22 13:03:39
\.


--
-- Data for Name: temp_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_users (id, name, email, dial_code, phone, user_type_id, user_phone_otp, access_token, user_data, created_at, updated_at) FROM stdin;
3	abdul wahab	newabdulwahab22@gmail.com	92	5412365	2	1234	5a29851c59d792c08aafb788da6dec4a	{"first_name":"Abdul","last_name":"Wahab","email":"newabdulwahab22@gmail.com","dial_code":"92","phone":"5412365","gender":"male","date_of_birth":"1993-04-06","password":"testing22","device_type":"android","device_cart_id":"cart_a","fcm_token":"adgkduhuefabsfbagfafasf"}	2024-05-23 12:01:15	2024-05-23 12:01:15
4	raj kumar	raj@gmail.com	+971	9578861344	2	1234	bf849beeb2c65707e15415062c8d0e56	{"date_of_birth":"2023-05-23","device_cart_id":"cart_a","device_type":"ios","dial_code":"+971","email":"raj@gmail.com","fcm_token":null,"first_name":"Raj","gender":"male","language":"en","last_name":"Kumar","password":"12345678","phone":"9578861344","timezone":"Asia\\/Kolkata"}	2024-05-23 15:07:24	2024-05-23 15:07:24
5	vijay karthi	vijay@gmail.co	+971	6575676576	2	1234	630ac46bb24f8ea31dad1be600bcd645	{"date_of_birth":"2022-05-23","device_cart_id":"cart_a","device_type":"ios","dial_code":"+971","email":"vijay@gmail.co","fcm_token":null,"first_name":"Vijay","gender":"male","language":"en","last_name":"Karthi","password":"12345678","phone":"6575676576","timezone":"Asia\\/Kolkata"}	2024-05-23 15:28:11	2024-05-23 15:28:11
6	manoj k	manoj@gmail.com	+971	1234567890	2	1234	655c239ad6ef3dbf6acb0a90cc50fc37	{"date_of_birth":"2023-05-23","device_cart_id":"cart_a","device_type":"ios","dial_code":"+971","email":"manoj@gmail.com","fcm_token":null,"first_name":"Manoj","gender":"male","language":"en","last_name":"K","password":"12345678","phone":"1234567890","timezone":"Asia\\/Kolkata"}	2024-05-23 15:30:12	2024-05-23 15:30:12
8	jaya m	jaya@gmail.com	+971	1234567899	2	1234	4e36cc059f0375997b9f2218b9a25772	{"date_of_birth":"2023-05-23","device_cart_id":"cart_a","device_type":"ios","dial_code":"+971","email":"jaya@gmail.com","fcm_token":null,"first_name":"Jaya","gender":"male","language":"en","last_name":"M","password":"12345678","phone":"1234567899","timezone":"Asia\\/Kolkata"}	2024-05-23 15:34:22	2024-05-23 15:34:22
9	viki v	viki@gmail.com	+971	1234567898	2	1234	fbc319f2eee36a28a4b76a741108654f	{"date_of_birth":"2022-04-23","device_cart_id":"cart_a","device_type":"ios","dial_code":"+971","email":"viki@gmail.com","fcm_token":null,"first_name":"Viki","gender":"female","language":"en","last_name":"V","password":"123456789","phone":"1234567898","timezone":"Asia\\/Kolkata"}	2024-05-23 15:49:28	2024-05-23 15:49:28
10	vinai k	vinai@gmail.com	+971	1235567890	2	1234	04d4de9d7c4d0249119bc85db53bf281	{"date_of_birth":"2024-04-23","device_cart_id":"cart_a","device_type":"ios","dial_code":"+971","email":"vinai@gmail.com","fcm_token":null,"first_name":"Vinai","gender":"male","language":"en","last_name":"K","password":"123456789","phone":"1235567890","timezone":"Asia\\/Kolkata"}	2024-05-23 15:55:41	2024-05-23 15:55:41
11	new t	new@gmail.com	+971	9578861355	2	1234	d76fe98746a900e5cca377ed27b8690a	{"date_of_birth":"2023-05-23","device_cart_id":"cart_a","device_type":"ios","dial_code":"+971","email":"new@gmail.com","fcm_token":"abdhjef ekef kjwf wedfw","first_name":"New","gender":"male","language":"en","last_name":"T","password":"12345678","phone":"9578861355","timezone":"Asia\\/Kolkata"}	2024-05-23 16:09:57	2024-05-23 16:09:57
14	roby r	robyiosdev@gmail.com	+91	8870978253	2	1234	b28d98a99c27427d6cbf97be107247bd	{"date_of_birth":"1993-04-09","device_cart_id":"cart_a","device_type":"ios","dial_code":"+91","email":"robyiosdev@gmail.com","fcm_token":"abdhjef ekef kjwf wedfw","first_name":"Roby","gender":"male","language":"en","last_name":"R","password":"12345678","phone":"8870978253","timezone":"Asia\\/Kolkata"}	2024-05-23 17:06:25	2024-05-23 17:06:25
15	abdul wahab	abwahab232@gmail.com	92	5412364	2	1234	4348067f685e1735417f9ce6a742079f	{"first_name":"Abdul","last_name":"Wahab","email":"abwahab232@gmail.com","dial_code":"92","phone":"5412364","gender":"male","date_of_birth":"1993-04-06","password":"testing22","device_type":"android","device_cart_id":"cart_a","fcm_token":"adgkduhuefabsfbagfafasf"}	2024-05-24 05:59:30	2024-05-24 05:59:30
16	vino d	vino@gmail.co	+971	9578861244	2	1234	66ceb294985de228c51c42e18e5d6576	{"date_of_birth":"2023-05-24","device_cart_id":"cart_a","device_type":"ios","dial_code":"+971","email":"vino@gmail.co","fcm_token":"abdhjef ekef kjwf wedfw","first_name":"Vino","gender":"male","language":"en","last_name":"D","password":"12345678","phone":"9578861244","timezone":"Asia\\/Kolkata"}	2024-05-24 11:39:39	2024-05-24 11:39:39
17	ashwin a	ashwin@gmail.com	+971	9578861342	2	1234	a65a3d66c833152a54b205cf83c4c1b9	{"date_of_birth":"2022-05-24","device_cart_id":"cart_a","device_type":"ios","dial_code":"+971","email":"ashwin@gmail.com","fcm_token":"abdhjef ekef kjwf wedfw","first_name":"Ashwin","gender":"male","language":"en","last_name":"A","password":"12345678","phone":"9578861342","timezone":"Asia\\/Kolkata"}	2024-05-24 11:42:02	2024-05-24 11:42:02
18	maya d	maya@gmail.com	+971	9578861300	2	1234	c2ff62b27beadb0a253e8b3efa5000e5	{"date_of_birth":"2023-05-25","device_cart_id":"cart_a","device_type":"ios","dial_code":"+971","email":"maya@gmail.com","fcm_token":"abdhjef ekef kjwf wedfw","first_name":"Maya","gender":"male","language":"en","last_name":"D","password":"12345678","phone":"9578861300","timezone":"Asia\\/Kolkata"}	2024-05-25 07:53:12	2024-05-25 07:53:12
27	hanza khan	hamza@test.com	+971	5454545454	2	1234	ab828772b516341f047e5e2cbe654776	{"date_of_birth":"12-09-1999","device_cart_id":null,"device_type":"iOS","dial_code":"+971","email":"hamza@test.com","fcm_token":"abdhjef ekef kjwf wedfw","first_name":"hanza","gender":"male","last_name":"khan","password":"hamza@123","phone":"5454545454"}	2024-06-03 17:34:09	2024-06-03 17:34:09
29	suleman ali	ib2suleman.ali@gmail.com	+92	3027655876	2	1234	ae05a44d2a6e536905c7d628cd93cd6f	{"date_of_birth":"1997-08-25","device_cart_id":"cart_a","device_type":"ios","dial_code":"+92","email":"ib2suleman.ali@gmail.com","fcm_token":"abdhjef ekef kjwf wedfw","first_name":"Suleman","gender":"male","language":"en","last_name":"Ali","password":"Zulfiqar@12","phone":"3027655876","timezone":"Asia\\/Karachi"}	2024-06-05 15:26:55	2024-06-05 15:26:55
197	yest dev two	test2@gmail.com	971	3494646464	2	1234	963a4f66f31ee45b85b7f8062ea6d312	{"first_name":"yest","last_name":"dev two","email":"test2@gmail.com","dial_code":"971","phone":"3494646464","gender":null,"date_of_birth":null,"password":"hello@1985","device_type":"android","device_cart_id":"9e363211509dbc4a","fcm_token":"cxXRGjhbR0CZ4pF9gVmDOv:APA91bHEJLpstHHXiLSCbgfEELLxznUNRkYrFNRAFHPoAOK4wmy0nRgW7m2rLZjc0OMzGRy57GyYu7EHVdyaKQMbXw42HvwoF-VfXd3TcNZ8z0UQIu2hW_k"}	2025-02-22 03:07:57	2025-02-22 03:07:57
35	abdul wahab	testw@gmail.com	92	541236499	2	1234	bea77525ed0b26656953cc20da5e8f5d	{"first_name":"Abdul","last_name":"Wahab","email":"testW@gmail.com","dial_code":"92","phone":"541236499","gender":"male","date_of_birth":null,"password":"testing22","device_type":"android","device_cart_id":"cart_a","fcm_token":"adgkduhuefabsfbagfafasf"}	2024-06-06 10:45:43	2024-06-06 10:45:43
248	nas test	jaisk@gmail.com	971	4546646464	2	1234	777019096a3cd5a608c3c51405b93993	{"date_of_birth":"2025-05-16","device_cart_id":"cart_a","device_type":"ios","dial_code":"971","email":"jaisk@gmail.com","fcm_token":"cOjcbX8LP04Qm-BdOywdbj:APA91bEGqpXuCkLmmx0f7bXYwpfC367aKay8O6V7YurRqkmVoKYxhV5eiJgkcjjyRLUc7tFMvfcy9XzlnG0qks9Sl9bBfWVOwonEEVHPCqSpJt4H2J1DOsw","first_name":"nas","gender":"female","language":"en","last_name":"test","password":"Test@1234","phone":"4546646464","timezone":"Asia\\/Karachi"}	2025-05-17 12:22:35	2025-05-17 12:22:35
46	abdul wahab	abwahab21325@gmail.com	92	54123621	2	1234	51887536cdbe2ade61be0c2808dba731	{"first_name":"Abdul","last_name":"Wahab","email":"abwahab21325@gmail.com","dial_code":"92","phone":"54123621","gender":null,"date_of_birth":null,"password":"testing22","device_type":"android","device_cart_id":"cart_a","fcm_token":"adgkduhuefabsfbagfafasf"}	2024-06-11 09:03:12	2024-06-11 09:03:12
55	abdul wahab	abwahab2325@gmail.com	92	5412360	2	1234	5c48af00ab8a14e826aa051b3e037eed	{"first_name":"Abdul","last_name":"Wahab","email":"abwahab2325@gmail.com","dial_code":"92","phone":"5412360","gender":"male","date_of_birth":"1993-04-06","password":"testing22","device_type":"android","device_cart_id":"cart_a","fcm_token":"adgkduhuefabsfbagfafasf"}	2024-06-11 15:52:33	2024-06-11 15:52:33
72	nemai sixteen	u16@mailinator.com	+91	9638527412	2	1234	e50b58ec25cc6147c473e2672e6603ea	{"date_of_birth":"2013-06-13","device_cart_id":"cart_a","device_type":"ios","dial_code":"+91","email":"u16@mailinator.com","fcm_token":"d5D-y8q5J0LisFiYIRPm2I:APA91bGtUMYrAq7NtzSsPfhjAcaODEP2g_eR6AJPj-mJgVGfPfiw7agJlQ8_Nwogp7cIfapu9-9xabT4yttT14xWBFTDrLKopfYYZv7k0LoS_qtKwUTdyRV8OCRRXsu6veJ9FEWftjbx","first_name":"Nemai","gender":"male","language":"en","last_name":"Sixteen","password":"Hello@123","phone":"9638527412","timezone":"Asia\\/Kolkata"}	2024-06-14 08:44:07	2024-06-14 08:44:07
131	ragasara k	abc2@yopmail.com	+971	586400540	2	1234	54ea00f9e0648e0c14e7ddeefdc9cf8e	{"date_of_birth":"1994-10-15","device_cart_id":"cart_a","device_type":"ios","dial_code":"+971","email":"abc2@yopmail.com","fcm_token":"eE8Ww6YPtUlxtSgzHj5ZXy:APA91bFSL3FNPmpUt3k5oxtUJl1aYKokRtKEFRSPCY_GTRiWqH-N10eaE7esjFUpWRlKhlAnPDJAW1ayloQyVS5cleJCqJAk4RYdqQWGEHXIvUc-DMW2bmDXl5rZUSGARn3VKf6luIxf","first_name":"RagaSara","gender":"female","language":"en","last_name":"K","password":"Hello@123","phone":"586400540","timezone":"Asia\\/Dubai"}	2024-10-16 10:14:39	2024-10-16 10:14:39
132	tesr bb	nklll@gmail.com	971	855888525	2	1234	9c93af45fa49eff2a06c9a7837b8667a	{"date_of_birth":"2014-10-15","device_cart_id":"cart_a","device_type":"ios","dial_code":"971","email":"nklll@gmail.com","fcm_token":"dE6rMbJfkEdDm06Np9j4NS:APA91bE8mpGOBXXYV23YXE7ffCIALjDaXj1_hcU-a8Um6JqOhzWj7v5NKJuZ6DW3_JUGVq24XP5Tl6L9C0AydTtnEAyJHi52XJ5gDO0n2PTwvC8keJP_dIlSfJnzFQ_kTXEP1qwVY3sn","first_name":"tesr","gender":"male","language":"en","last_name":"bb","password":"Test@1234","phone":"855888525","timezone":"Asia\\/Karachi"}	2024-10-16 11:14:33	2024-10-16 11:14:33
142	yasmin nadia	yasmin@gmail.com	971	586400541	2	1234	84cede9288f66c7464fa270147a16f9d	{"date_of_birth":"2020-10-15","device_cart_id":"cart_a","device_type":"ios","dial_code":"971","email":"yasmin@gmail.com","fcm_token":"dE6rMbJfkEdDm06Np9j4NS:APA91bE8mpGOBXXYV23YXE7ffCIALjDaXj1_hcU-a8Um6JqOhzWj7v5NKJuZ6DW3_JUGVq24XP5Tl6L9C0AydTtnEAyJHi52XJ5gDO0n2PTwvC8keJP_dIlSfJnzFQ_kTXEP1qwVY3sn","first_name":"yasmin","gender":"female","language":"en","last_name":"nadia","password":"Hello@123","phone":"586400541","timezone":"Asia\\/Karachi"}	2024-10-16 11:57:19	2024-10-16 11:57:19
148	anil temp temp	temp@temp.com	971	545456484	2	1234	3353e27cf2c1de3ad3c7ba0a63bc439f	{"date_of_birth":"2024-11-03","device_cart_id":"cart_a","device_type":"ios","dial_code":"971","email":"temp@temp.com","fcm_token":"dHLTWPK_OEG6g45TiJGYEP:APA91bG2YXy0AGjtBw_eaOuYo3nZuGSjPFQRfocRpt82Z0LagH9KF-wDaNws7zoSUBOb88P2FFFzacrt9NWLGu7RRm4krfMo8tq4tyEEkZY35dP4xfCAQI80wgKQQsIVkW-4BpAQ0CH-","first_name":"Anil Temp","gender":"male","language":"en","last_name":"Temp","password":"Hello@1985","phone":"545456484","timezone":"Asia\\/Dubai"}	2024-11-04 08:14:36	2024-11-04 08:14:36
157	test use	test@test.com	+92	3315489762	2	1234	4fba51bd39ea805e6e9fe701cea76a59	{"date_of_birth":null,"device_cart_id":"cart_a","device_type":"ios","dial_code":"+92","email":"test@test.com","fcm_token":"fECJGS2o9El_jupzyeNASy:APA91bGi8sBSeoIil8eOSWig_htvsxgmiANr6dsn_-L1-9cVI1xattF12CadFYfOWs61IO9TU0W7qMKe3kBn6MHRHAn9zkwJNm_XMgwlT1q6xDzjowujy8q7J6hZPp4pDEVtNYlM5HV9","first_name":"Test","gender":"male","language":"en","last_name":"Use","password":"test@123","phone":"3315489762","timezone":"Asia\\/Karachi"}	2024-11-11 12:20:41	2024-11-11 12:20:41
229	mohan kumar testing	mohan+3@gmail.com	971	56400509	2	1234	f10ff22df98255d8dfc84b87250f8455	{"first_name":"Mohan Kumar","last_name":"Testing","email":"mohan+3@gmail.com","dial_code":"971","phone":"56400509","gender":"male","date_of_birth":"1993-04-06","password":"testing22","device_type":"android","device_cart_id":"cart_a","fcm_token":"adgkduhuefabsfbagfafasf"}	2025-03-13 09:33:47	2025-03-13 09:33:47
249	nas test	nas@gh.com	971	4946469484	2	1234	cdb2469cc76044f0310258edb65927a2	{"date_of_birth":"2025-05-15","device_cart_id":"cart_a","device_type":"ios","dial_code":"971","email":"nas@gh.com","fcm_token":"cOjcbX8LP04Qm-BdOywdbj:APA91bEGqpXuCkLmmx0f7bXYwpfC367aKay8O6V7YurRqkmVoKYxhV5eiJgkcjjyRLUc7tFMvfcy9XzlnG0qks9Sl9bBfWVOwonEEVHPCqSpJt4H2J1DOsw","first_name":"nas","gender":null,"language":"en","last_name":"test","password":"Test@1234","phone":"4946469484","timezone":"Asia\\/Karachi"}	2025-05-17 12:25:25	2025-05-17 12:25:25
210	mohan kumar	mohan1@gmail.vom	971	989898989812	2	1234	6e0927065f77ef11f8dce7f4f7be4d8c	{"date_of_birth":"2021-03-08","device_cart_id":"cart_a","device_type":"ios","dial_code":"971","email":"mohan1@gmail.vom","fcm_token":"cq1-wlLVHEfAr3ip_evX7d:APA91bG6FwPhFg1RSG3aj9fG16agnPXkyDz10faUvqFLAeZ2kORLjAMo_26A58M3ztiENdJJbJm6yaDtb6LDMzkWCSB97fWzcPsjRT8Psyoua_r1FHMucnQ","first_name":"Mohan","gender":"male","language":"en","last_name":"Kumar","password":"Hello@1985","phone":"989898989812","timezone":"Asia\\/Dubai"}	2025-03-09 22:27:41	2025-03-09 22:27:41
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (id, customer_id, vendor_id, order_id, transaction_id, status, amount, type, payment_method, created_at, updated_at, other_customer_id, p_trans_id, p_info, p_data) FROM stdin;
1264	306	134	696	D6087938	success	600.00	booking_advance	stripe_card	2025-03-17 13:34:26	2025-03-17 13:34:26	\N	\N	\N	\N
1267	313	\N	\N	D9198601	success	1000.00	wallet_credit	stripe	2025-03-19 11:05:32	2025-03-19 11:05:32	\N	\N	\N	{"clientSecret":"pi_3R4GgdBjsMxFtgBe0CMJLEHJ_secret_XvAvy71dsjZbXc7atOQx5jm6Y"}
1270	313	\N	\N	D3910313	success	100.00	wallet_credit	stripe	2025-03-19 11:50:26	2025-03-19 11:50:26	\N	\N	\N	{"clientSecret":"pi_3R4HO8BjsMxFtgBe0FMUW5cx_secret_tGRFkLDzYmW2X04JG8J22c19t"}
1273	315	\N	\N	D7819469	success	50.00	wallet_credit	stripe	2025-03-20 05:52:44	2025-03-20 05:52:44	\N	\N	\N	{"clientSecret":"pi_3R4YHYBjsMxFtgBe1nalY0b4_secret_rDXtNhG8yFFUAAYatB8NKMYWA"}
1276	314	308	700	D2207257	success	600.00	booking_advance	stripe_card	2025-03-20 13:45:07	2025-03-20 13:45:07	\N	\N	\N	\N
1281	313	\N	\N	D4332443	success	20.00	wallet_transfer	wallet	2025-03-20 14:40:49	2025-03-20 14:40:49	315	\N	\N	\N
1282	315	\N	\N	D4055741	success	20.00	wallet_receive	wallet	2025-03-20 14:40:49	2025-03-20 14:40:49	313	\N	\N	\N
1286	314	\N	\N	D2960424	success	1000.00	wallet_credit	wallet	2025-03-20 15:43:38	2025-03-20 15:43:38	\N	\N	\N	{"clientSecret":"pi_3R4hVLBjsMxFtgBe0LHnWVIi_secret_DMnV44HJ8JQyB8MaKnTx7US66"}
1289	317	\N	\N	D6796806	success	10003.00	wallet_credit	wallet	2025-03-20 17:07:35	2025-03-20 17:07:35	\N	\N	\N	{"clientSecret":"pi_3R4iobBjsMxFtgBe1tO91GG2_secret_oEpI701z4Ug2Cs5QJsl8qyF2m"}
1292	313	308	698	D8089062	success	210.00	booking_full	stripe_card	2025-03-21 10:50:46	2025-03-21 10:50:46	\N	\N	\N	\N
1295	313	310	704	D1014885	success	250.00	booking_full	stripe_card	2025-03-21 11:40:51	2025-03-21 11:40:51	\N	\N	\N	\N
1298	315	133	706	D6301347	success	600.00	booking_advance	stripe_card	2025-03-21 13:33:43	2025-03-21 13:33:43	\N	\N	\N	\N
1301	307	\N	\N	D3440068	success	580.00	wallet_credit	wallet	2025-03-23 14:51:33	2025-03-23 14:51:33	\N	\N	\N	{"clientSecret":"pi_3R5m7YBjsMxFtgBe1QO4mCbK_secret_hntIXyUpCS6M4RM6qqFCFgfj4"}
1304	323	309	708	D9062594	success	600.00	booking_advance	stripe_card	2025-03-31 17:14:33	2025-03-31 17:14:33	\N	\N	\N	\N
1307	313	134	709	D2896274	success	600.00	booking_advance	stripe_card	2025-04-04 15:43:27	2025-04-04 15:43:27	\N	\N	\N	\N
1310	313	135	713	D9965578	success	400.00	booking_advance	stripe_card	2025-04-08 11:49:05	2025-04-08 11:49:05	\N	\N	\N	\N
1313	313	135	715	D8455422	success	400.00	booking_advance	stripe_card	2025-04-11 10:48:04	2025-04-11 10:48:04	\N	\N	\N	\N
1316	313	135	715	D1843388	success	400.00	booking_reschedule	stripe_card	2025-04-11 11:57:57	2025-04-11 11:57:57	\N	\N	\N	\N
1319	315	135	716	D4515792	success	370.00	booking_full	stripe_card	2025-04-11 17:05:32	2025-04-11 17:05:32	\N	\N	\N	\N
1322	323	310	719	D8577548	success	1650.00	booking_full	stripe_card	2025-04-29 14:47:40	2025-04-29 14:47:40	\N	\N	\N	\N
1325	323	133	721	D5037283	success	600.00	booking_advance	wallet	2025-04-29 15:07:37	2025-04-29 15:07:37	\N	\N	\N	\N
1328	315	308	722	D9435855	success	600.00	booking_advance	wallet	2025-05-15 14:19:00	2025-05-15 14:19:00	\N	\N	\N	\N
1331	313	134	709	D2618965	success	210.00	booking_full	wallet	2025-05-15 14:32:23	2025-05-15 14:32:23	\N	\N	\N	\N
1334	313	135	724	D4719136	success	370.00	booking_full	wallet	2025-05-15 15:08:06	2025-05-15 15:08:06	\N	\N	\N	\N
1337	313	308	725	D5322423	success	210.00	booking_full	wallet	2025-05-15 16:06:06	2025-05-15 16:06:06	\N	\N	\N	\N
1340	313	135	727	D8278662	success	400.00	booking_advance	wallet	2025-05-16 11:00:29	2025-05-16 11:00:29	\N	\N	\N	\N
1343	329	308	730	D2967606	success	600.00	booking_advance	stripe_card	2025-05-17 05:34:11	2025-05-17 05:34:11	\N	\N	\N	\N
1346	331	308	733	D5403384	success	600.00	booking_advance	stripe_card	2025-05-20 11:36:02	2025-05-20 11:36:02	\N	\N	\N	\N
1349	327	328	736	D1470023	success	200.00	booking_advance	stripe_card	2025-05-20 12:47:59	2025-05-20 12:47:59	\N	\N	\N	\N
1352	327	135	742	D3576591	success	400.00	booking_advance	stripe_card	2025-05-20 16:29:39	2025-05-20 16:29:39	\N	\N	\N	\N
1355	325	308	744	D2001932	success	600.00	booking_advance	stripe_card	2025-05-21 19:09:05	2025-05-21 19:09:05	\N	\N	\N	\N
1358	325	308	745	D9246970	success	210.00	booking_full	stripe_card	2025-05-22 12:33:58	2025-05-22 12:33:58	\N	\N	\N	\N
1265	306	135	697	D3805971	success	400.00	booking_advance	stripe_card	2025-03-17 13:49:22	2025-03-17 13:49:22	\N	\N	\N	\N
1268	314	\N	\N	D6975778	success	200.00	wallet_credit	stripe	2025-03-19 11:18:36	2025-03-19 11:18:36	\N	\N	\N	{"clientSecret":"pi_3R4GsSBjsMxFtgBe01kGBog8_secret_vzXq32UBBqYaQsMgqSZoCoLEF"}
1271	315	\N	\N	D9412292	success	1000.00	wallet_credit	stripe	2025-03-19 12:18:08	2025-03-19 12:18:08	\N	\N	\N	{"clientSecret":"pi_3R4HoxBjsMxFtgBe1lLr4ycr_secret_QW0b8EmHyNz1Z7C4lX4YJoLx5"}
1274	315	308	699	D9446067	success	600.00	booking_advance	wallet	2025-03-20 06:26:40	2025-03-20 06:26:40	\N	\N	\N	\N
1277	313	\N	\N	D1741183	success	50.00	wallet_transfer	wallet	2025-03-20 14:36:31	2025-03-20 14:36:31	315	\N	\N	\N
1278	315	\N	\N	D4720519	success	50.00	wallet_receive	wallet	2025-03-20 14:36:31	2025-03-20 14:36:31	313	\N	\N	\N
1283	313	\N	\N	D1775277	success	20.00	wallet_transfer	wallet	2025-03-20 14:41:24	2025-03-20 14:41:24	315	\N	\N	\N
1284	315	\N	\N	D1172479	success	20.00	wallet_receive	wallet	2025-03-20 14:41:24	2025-03-20 14:41:24	313	\N	\N	\N
1287	314	308	700	D7296414	success	600.00	booking_reschedule	wallet	2025-03-20 15:44:51	2025-03-20 15:44:51	\N	\N	\N	\N
1290	317	135	701	D3656582	success	400.00	booking_advance	wallet	2025-03-20 17:19:33	2025-03-20 17:19:33	\N	\N	\N	\N
1293	313	133	703	D2234710	success	600.00	booking_advance	stripe_card	2025-03-21 11:03:09	2025-03-21 11:03:09	\N	\N	\N	\N
1296	313	310	705	D6649561	success	100.00	booking_advance	stripe_card	2025-03-21 11:56:33	2025-03-21 11:56:33	\N	\N	\N	\N
1299	315	133	706	D3785029	success	450.00	booking_reschedule	stripe_card	2025-03-21 14:02:05	2025-03-21 14:02:05	\N	\N	\N	\N
1302	323	308	707	D5396282	success	600.00	booking_advance	stripe_card	2025-03-31 17:01:14	2025-03-31 17:01:14	\N	\N	\N	\N
1305	323	309	708	D8075988	success	210.00	booking_full	stripe_card	2025-03-31 18:12:17	2025-03-31 18:12:17	\N	\N	\N	\N
1308	313	133	703	D1142096	success	210.00	booking_full	stripe_card	2025-04-04 15:49:16	2025-04-04 15:49:16	\N	\N	\N	\N
1311	323	135	712	D5576655	success	400.00	booking_advance	wallet	2025-04-09 00:44:37	2025-04-09 00:44:37	\N	\N	\N	\N
1314	315	135	716	D3265292	success	400.00	booking_advance	stripe_card	2025-04-11 11:08:06	2025-04-11 11:08:06	\N	\N	\N	\N
1317	313	135	717	D7880496	success	400.00	booking_advance	stripe_card	2025-04-11 16:25:00	2025-04-11 16:25:00	\N	\N	\N	\N
1320	315	134	718	D7097163	success	600.00	booking_advance	wallet	2025-04-12 06:49:20	2025-04-12 06:49:20	\N	\N	\N	\N
1323	323	134	720	D4754518	success	600.00	booking_advance	wallet	2025-04-29 14:50:02	2025-04-29 14:50:02	\N	\N	\N	\N
1326	315	134	718	D4412816	success	210.00	booking_full	stripe_card	2025-05-06 17:46:21	2025-05-06 17:46:21	\N	\N	\N	\N
1329	315	134	711	D1400300	success	600.00	booking_advance	wallet	2025-05-15 14:29:00	2025-05-15 14:29:00	\N	\N	\N	\N
1332	313	135	724	D6294919	success	400.00	booking_advance	stripe_card	2025-05-15 14:41:41	2025-05-15 14:41:41	\N	\N	\N	\N
1335	313	308	725	D7260089	success	600.00	booking_advance	stripe_card	2025-05-15 15:32:31	2025-05-15 15:32:31	\N	\N	\N	\N
1338	313	308	726	D5001302	success	600.00	booking_advance	wallet	2025-05-15 16:54:48	2025-05-15 16:54:48	\N	\N	\N	\N
1341	313	135	728	D1392308	success	400.00	booking_advance	stripe_card	2025-05-16 13:20:49	2025-05-16 13:20:49	\N	\N	\N	\N
1344	329	308	731	D8312072	success	600.00	booking_advance	stripe_card	2025-05-17 12:52:51	2025-05-17 12:52:51	\N	\N	\N	\N
1347	327	308	735	D9673753	success	600.00	booking_advance	stripe_card	2025-05-20 11:50:21	2025-05-20 11:50:21	\N	\N	\N	\N
1350	327	308	738	D3319399	success	600.00	booking_advance	stripe_card	2025-05-20 13:17:46	2025-05-20 13:17:46	\N	\N	\N	\N
1353	325	135	743	D6071505	success	400.00	booking_advance	stripe_card	2025-05-20 16:34:12	2025-05-20 16:34:12	\N	\N	\N	\N
1356	325	308	745	D6698834	success	600.00	booking_advance	stripe_card	2025-05-22 10:13:54	2025-05-22 10:13:54	\N	\N	\N	\N
1359	325	328	747	D8244234	success	200.00	booking_advance	stripe_card	2025-05-22 12:37:06	2025-05-22 12:37:06	\N	\N	\N	\N
1266	307	\N	\N	D5421155	success	1000.00	wallet_credit	stripe	2025-03-17 20:23:12	2025-03-17 20:23:12	\N	\N	\N	{"clientSecret":"pi_3R3gRGBjsMxFtgBe1pIJSq2g_secret_m5iauf4aa1qNOWGnCXN7i7YXo"}
1269	313	308	698	D4037512	success	600.00	booking_advance	wallet	2025-03-19 11:33:55	2025-03-19 11:33:55	\N	\N	\N	\N
1272	315	\N	\N	D4879982	success	500.00	wallet_credit	stripe	2025-03-19 19:39:04	2025-03-19 19:39:04	\N	\N	\N	{"clientSecret":"pi_3R4OhbBjsMxFtgBe1kV9Sz91_secret_q883m8vjeDpPZsMD7lcUXOAIB"}
1275	315	308	699	D3678867	success	600.00	booking_reschedule	stripe_card	2025-03-20 11:39:11	2025-03-20 11:39:11	\N	\N	\N	\N
1279	315	\N	\N	D7499096	success	100.00	wallet_transfer	wallet	2025-03-20 14:38:33	2025-03-20 14:38:33	313	\N	\N	\N
1280	313	\N	\N	D4867397	success	100.00	wallet_receive	wallet	2025-03-20 14:38:33	2025-03-20 14:38:33	315	\N	\N	\N
1285	314	\N	\N	D2519259	success	200.00	wallet_credit	wallet	2025-03-20 15:42:47	2025-03-20 15:42:47	\N	\N	\N	{"clientSecret":"pi_3R4hUTBjsMxFtgBe0vI2yWWB_secret_Mvw1lxEY9nNCLlRQQXIRcZrk5"}
1288	315	\N	\N	D7936853	success	1000.00	wallet_credit	wallet	2025-03-20 17:01:30	2025-03-20 17:01:30	\N	\N	\N	{"clientSecret":"pi_3R4iikBjsMxFtgBe1axK5ErN_secret_vDDYyH0IBvz7s9V3TrbVmoaO2"}
1291	317	135	702	D7174394	success	400.00	booking_advance	stripe_card	2025-03-20 17:25:49	2025-03-20 17:25:49	\N	\N	\N	\N
1294	313	310	704	D7656709	success	100.00	booking_advance	stripe_card	2025-03-21 11:10:36	2025-03-21 11:10:36	\N	\N	\N	\N
1297	313	310	705	D5821967	success	250.00	booking_full	wallet	2025-03-21 12:06:45	2025-03-21 12:06:45	\N	\N	\N	\N
1300	315	\N	\N	D2671950	success	200.00	wallet_credit	wallet	2025-03-21 14:10:49	2025-03-21 14:10:49	\N	\N	\N	{"clientSecret":"pi_3R52X5BjsMxFtgBe1xnvRkX6_secret_MFtXNz0OyjQN7yv4LsM39exJd"}
1303	323	308	707	D8217709	success	1020.00	booking_full	stripe_card	2025-03-31 17:03:34	2025-03-31 17:03:34	\N	\N	\N	\N
1306	323	\N	\N	D5761433	success	33456.00	wallet_credit	wallet	2025-04-01 16:39:37	2025-04-01 16:39:37	\N	\N	\N	{"clientSecret":"pi_3R9465BjsMxFtgBe0T4gedEu_secret_3s8sP8VXur25KbYFetazMnmwH"}
1309	315	133	706	D6649139	success	210.00	booking_full	stripe_card	2025-04-05 12:34:33	2025-04-05 12:34:33	\N	\N	\N	\N
1312	315	308	714	D7657908	success	600.00	booking_advance	stripe_card	2025-04-11 08:02:58	2025-04-11 08:02:58	\N	\N	\N	\N
1315	315	308	714	D5775721	success	210.00	booking_full	stripe_card	2025-04-11 11:16:49	2025-04-11 11:16:49	\N	\N	\N	\N
1318	313	135	717	D8689648	success	370.00	booking_full	stripe_card	2025-04-11 16:31:34	2025-04-11 16:31:34	\N	\N	\N	\N
1321	323	310	719	D7822026	success	100.00	booking_advance	wallet	2025-04-29 14:46:41	2025-04-29 14:46:41	\N	\N	\N	\N
1324	323	134	720	D4732176	success	210.00	booking_full	stripe_card	2025-04-29 15:02:35	2025-04-29 15:02:35	\N	\N	\N	\N
1327	313	135	723	D9303116	success	400.00	booking_advance	stripe_card	2025-05-06 17:54:37	2025-05-06 17:54:37	\N	\N	\N	\N
1330	315	308	710	D6309633	success	600.00	booking_advance	stripe_card	2025-05-15 14:29:52	2025-05-15 14:29:52	\N	\N	\N	\N
1333	313	\N	\N	D4104891	success	500.00	wallet_credit	wallet	2025-05-15 15:07:32	2025-05-15 15:07:32	\N	\N	\N	{"clientSecret":"pi_3ROzdABjsMxFtgBe1FKOvMyy_secret_LnL8ZvRM5CnveRbXjwezLavUz"}
1336	313	\N	\N	D1433710	success	1500.00	wallet_credit	wallet	2025-05-15 16:00:01	2025-05-15 16:00:01	\N	\N	\N	{"clientSecret":"pi_3RP0RzBjsMxFtgBe0uxgpVGM_secret_TbCH7SvaAsXBgzw81pkeSEHmb"}
1339	313	308	726	D1235517	success	210.00	booking_full	wallet	2025-05-15 17:46:56	2025-05-15 17:46:56	\N	\N	\N	\N
1342	327	328	729	D5534098	success	200.00	booking_advance	stripe_card	2025-05-16 17:08:45	2025-05-16 17:08:45	\N	\N	\N	\N
1345	331	328	732	D9970061	success	200.00	booking_advance	stripe_card	2025-05-20 11:23:34	2025-05-20 11:23:34	\N	\N	\N	\N
1348	325	308	737	D9237726	success	600.00	booking_advance	stripe_card	2025-05-20 12:36:36	2025-05-20 12:36:36	\N	\N	\N	\N
1351	325	328	741	D3770214	success	200.00	booking_advance	stripe_card	2025-05-20 16:26:41	2025-05-20 16:26:41	\N	\N	\N	\N
1354	325	135	740	D1736660	success	400.00	booking_advance	stripe_card	2025-05-20 16:42:20	2025-05-20 16:42:20	\N	\N	\N	\N
1357	331	328	746	D9434908	success	200.00	booking_advance	stripe_card	2025-05-22 12:25:51	2025-05-22 12:25:51	\N	\N	\N	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, dial_code, phone, phone_verified, password, email_verified_at, role, verified, user_type_id, first_name, last_name, user_image, user_phone_otp, active, remember_token, created_at, updated_at, role_id, device_type, fcm_token, device_cart_id, password_reset_code, req_chng_email, req_chng_phone, req_chng_dial_code, deleted_at, last_login, user_name) FROM stdin;
317	sunil nah	sunil@sunil.com	971	523243163	1	$2y$12$IbXzxZ7dRsXLHR1edj4hyuSlwV9lg18ATbIutjkthSlS1oebw9NVe	\N	\N	1	2	sunil	nah	\N	\N	1	\N	2025-03-20 17:07:03	2025-03-20 22:19:05	\N	ios	eGTBDMDBEEmhs3-xQm2Peq:APA91bF2GwJwg2KdRMFUVXB8-BUqkvQ2atyukfUmv9EiKZq9bxniqwKBxMzqBeAXgTnG3IgAoeqONRSElHHe7Svu0_vLPwL3bfXNtPB99JMX4nEzp80fI4E	cart_a	\N	\N	\N	\N	\N	\N	\N
323	chalent chanter	chalent@me.com	+971	526162947	1	$2y$12$J.VTwmMv0NM5pNTGfofPyuFAyqow/gCmQtQZwP9r25mRJJPGUO.bK	\N	\N	1	2	chalent	chanter	67ea96758ba1a_1743427189.jpg	\N	1	\N	2025-03-31 15:17:22	2025-05-16 14:42:18	\N	ios	eUQo5hxdZ0Kmt6SS9VgNZ0:APA91bFA1s8UEhYnu4lHt5-IRy24gidFEG2Nq8rQpNXeLm_AOLhha7pcjDQq_gg15s6aDIobuGAWeKH0tG5POBRvarjOwRhScr5AEWqtURKaGGHGRzhNH2A	cart_a	\N	\N	\N	\N	2025-05-16 14:42:18	\N	\N
305	chalent chanter	chalent@me.com	971	526162947	1	$2y$12$bmyp0qL34PkEFXwGFHiKRuxP6BPhKYC07DGDKmz82IMKkPq3LHNB2	\N	\N	1	2	chalent	chanter	\N	\N	1	\N	2025-03-17 12:41:19	2025-03-17 13:04:32	\N	ios	\N	cart_a	\N	\N	\N	\N	2025-03-17 13:04:32	\N	\N
311	Kelly Gunther	q2mgzrfh8p@privaterelay.appleid.com	\N	6634128105	0	$2y$12$l2OfuQo5W3EubNdlF.YcgO1SlwPkuMMFpDNIRhYt1VVTKlNdn4lSG	\N	\N	0	2	Kelly Gunther	\N	\N	\N	1	\N	2025-03-17 19:15:35	2025-03-17 19:15:35	\N	\N	\N	03C90ECF-55AB-4D0B-9E36-0469725D5A48	\N	\N	\N	\N	\N	\N	\N
25	Cristian Khan	ahmedkhan2134@gmail.com	971	8795214512	1	$2y$12$RudaDkEwPGXppFzKVnWqGeeP4j3uO1tkJqTpCXi7k1HH.LG0xzV.e	\N	\N	1	3	Cristian	Khan	666970c09549e_1718186176.png	\N	1	\N	2024-06-06 09:03:39	2024-08-17 18:14:55	\N	\N	\N	\N	\N	\N	\N	\N	2024-08-17 18:14:55	\N	\N
10	Eva Mular	chalent2@me.com	971	5261629547	1	$2y$12$wXk5hwByeI.drNdibNqjm.9hdBMqj2W7e5SH8NopoedgKexKoMvc.	\N	\N	1	3	Eva	Mular	666970d0c4695_1718186192.png	\N	1	\N	2024-05-22 14:13:45	2024-08-17 18:14:55	\N	\N	\N	\N	\N	\N	\N	\N	2024-08-17 18:14:55	\N	\N
324	chalent chanter	chalent@me.com	971	526162947	1	$2y$12$fJTETynjMo4tvQC8s8eGHukFiIB3Uwi5SPB6zl7iqL8bbuTe6MtfW	\N	\N	1	2	chalent	chanter	\N	\N	1	\N	2025-05-16 14:46:42	2025-05-16 14:49:25	\N	ios	eUQo5hxdZ0Kmt6SS9VgNZ0:APA91bFA1s8UEhYnu4lHt5-IRy24gidFEG2Nq8rQpNXeLm_AOLhha7pcjDQq_gg15s6aDIobuGAWeKH0tG5POBRvarjOwRhScr5AEWqtURKaGGHGRzhNH2A	cart_a	\N	\N	\N	\N	2025-05-16 14:49:25	\N	\N
27	Karen Valdez	a02@mailin.com	91	9876543234	1	$2y$12$ZitjzEGwa.cQNIJ1u.erd.QW788jRhVM6lFSwSgRckcOa7Q73.wAu	\N	\N	1	3	Karen	Valdez	66aa128b0185f_1722421899.jpg	\N	1	\N	2024-06-06 10:06:20	2024-08-17 18:14:55	\N	\N	\N	\N	\N	\N	\N	\N	2024-08-17 18:14:55	\N	\N
327	go give	chalent@me.com	971	548754525	1	$2y$12$6y1JCCTVmEMttmneNVWiz.dRpXLgUm8KZRYmfdLWIIPrcJ21tRebK	\N	\N	1	2	go	give	\N	\N	1	\N	2025-05-16 16:08:18	2025-05-16 19:12:25	\N	ios	c0IyRTIBi0HFrY8MFanaXI:APA91bF9GnT4fYJtg-vkf_Tz3S750OUG5LqA72oUphrnWbclq66NWvctE9azxhN7MfLaBlmbXYyv6gVePO-BjImDirCfT4tlFk2dzbznWGLnbsmy_kco_EI	264BB5A1-DFB5-4C0E-BD28-13CF981F6CDA	\N	\N	\N	\N	\N	\N	\N
7	Maria Mollye	aliahmed000@gmail.com	92	6548741	1	$2y$12$m6bYiq7imYCkO4uA0X2BPelqULk8zjs7yiMryQ0Q1NkCtHwpoMvWm	\N	\N	1	3	Maria	Mollye	66b4b62d46ee1_1723119149.jpg	\N	1	\N	2024-05-06 02:17:44	2024-08-17 18:14:55	\N	\N	\N	\N	\N	\N	\N	\N	2024-08-17 18:14:55	\N	\N
2	Anya Korla	wahabartist@gmail.com	971	23423423423	1	$2y$12$eW/BHBwfTidVnAxCRpbf6.cDwvlo/zGk07ApUvOcRetpeePESmVbi	\N	\N	1	3	Anya	Korla	66bdc175ce74c_1723711861.jpg	\N	1	\N	2024-04-25 04:47:10	2024-08-17 18:14:55	\N	\N	\N	\N	\N	\N	\N	\N	2024-08-17 18:14:55	\N	\N
328	John Mack	mack@john.com	971	3434545	1	$2y$12$yQJOnjgrI555OS6mxe6T.uRtgxjJbZvDogj78iICFi0c73xNLnnvm	\N	\N	1	3	John	Mack	682733c0048e7_1747399616.jpg	\N	1	\N	2025-05-16 16:46:56	2025-05-16 16:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
306	lebron james	lebronny@james.com	971	542583695	1	$2y$12$MhobscmPtxgVKDqaOzmRF.Gmntoed/enMLFRVOc1N6N1YraS1N5vG	\N	\N	1	2	lebron	james	\N	\N	1	\N	2025-03-17 13:20:59	2025-03-17 13:20:59	\N	ios	\N	cart_a	\N	\N	\N	\N	\N	\N	\N
312	Nancy Auckerman	st6pdy7fcc@privaterelay.appleid.com	\N	7243616652	0	$2y$12$HXgU2lM1.6yRN4nPjRadFuix5X7rFIS5VHf0ycGPDhkDEgwiMBcoG	\N	\N	0	2	Nancy Auckerman	\N	\N	\N	1	\N	2025-03-18 03:02:15	2025-03-18 03:02:15	\N	\N	\N	056445A5-8EB6-47A0-BAE6-FA740ADBD5FE	\N	\N	\N	\N	\N	\N	\N
325	nas test	nas@gmail.com	+971	49946197945	1	$2y$12$/HFXOfpzWeJdOzOU3Eu5puEhvW/nQTN3.D6S4U1EaMtf1KW9J8Try	\N	\N	1	2	nas	test	682c37a72c75f_1747728295.jpg	1234	1	\N	2025-05-16 14:47:58	2025-05-20 12:04:55	\N	ios	cOjcbX8LP04Qm-BdOywdbj:APA91bEGqpXuCkLmmx0f7bXYwpfC367aKay8O6V7YurRqkmVoKYxhV5eiJgkcjjyRLUc7tFMvfcy9XzlnG0qks9Sl9bBfWVOwonEEVHPCqSpJt4H2J1DOsw	557F352E-B772-4E73-84E9-28EF5380AEE8	ee146a53d43aab445bf8e5a182538d1f	\N	\N	\N	\N	\N	\N
318	anil navi	aniladmin@gmail.com	971	464437373	1	$2y$12$wOuK1y1ySgAnE43ZoipjwO4xeOv1jpvLSOF4NUt0T6BpjxJhtFPbS	\N	\N	1	2	anil	navi	\N	\N	1	\N	2025-03-21 14:25:51	2025-03-21 15:36:24	\N	ios	\N	84612618-8DCC-4275-9B0A-D4E5AD6EE97E	\N	\N	\N	\N	2025-03-21 15:36:24	\N	\N
104	rt sdf	dsz@gmail.com	971	567567556	1	$2y$12$sogf52BUES4IBbv5kQsPnORJXVzn3t8fie2L86YxIlgfQAA04wFGO	\N	\N	1	3	rt	sdf	66b396682e54f_1723045480.jpg	\N	1	\N	2024-08-07 19:44:40	2024-08-14 17:51:06	\N	\N	\N	\N	\N	\N	\N	\N	2024-08-14 17:51:06	\N	\N
319	sha jkj	sss@hmao.com	971	54655665	1	$2y$12$ohXGHAI1.hNti6GoFWtLNuFMeNHFSEz9GjRGcFYqZafQR7pdMN8nu	\N	\N	1	2	sha	jkj	\N	\N	1	\N	2025-03-21 14:45:25	2025-03-21 14:55:53	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
313	test user	testuser@gmail.com	971	54548484887	1	$2y$12$WPTz6IFiCmn9yJgFnGWDq.m37FUsCEwekr/waF/7fIEbr8iDnh9ae	\N	\N	1	2	test	user	\N	\N	1	\N	2025-03-19 11:04:43	2025-05-16 14:44:10	\N	ios	\N	70281124-72B2-4B32-8C83-BB8AB2EE43BB		\N	\N	\N	2025-05-16 14:44:10	\N	\N
326	cgzvv cg	chalent@me.co	971	852852885	1	$2y$12$QjpIBSCsCxFoYHwEAWWxl.lmRv0Vhc1bACgC4FZ5km6e8JtM0nLJK	\N	\N	1	2	cgzvv	cg	68271a8e68efa_1747393166.jpg	\N	1	\N	2025-05-16 14:50:44	2025-05-16 15:03:24	\N	ios	eUQo5hxdZ0Kmt6SS9VgNZ0:APA91bFA1s8UEhYnu4lHt5-IRy24gidFEG2Nq8rQpNXeLm_AOLhha7pcjDQq_gg15s6aDIobuGAWeKH0tG5POBRvarjOwRhScr5AEWqtURKaGGHGRzhNH2A	cart_a	\N	\N	\N	\N	\N	\N	\N
307	kevin durant	durant@kevin.com	971	528467845	1	$2y$12$Mah3S.AS5jTQNy3qL4C3p.t2Vzs4GAUVNYua4eoCvdidZPoWjOOBi	\N	\N	1	2	kevin	durant	\N	\N	1	\N	2025-03-17 14:15:29	2025-03-17 14:21:08	\N	ios	\N	7F4A49DB-CD30-4606-B8BB-70E2C37FD586	\N	\N	\N	\N	\N	\N	kevin34
329	anil navis	anilnavis@gmail.com	971	564005096	1	$2y$12$NndhMwW0L2pjgKUm.rdPjO18g665Fn2Q7SrU5y5PovpxMQRlWn7eO	\N	\N	1	2	anil	navis	\N	1234	1	\N	2025-05-17 04:50:11	2025-05-17 12:54:38	\N	ios	cRrE0Zsvm0FGqAPCNBoVZj:APA91bH0CrHHC_d6x66wq7laDO37BnT14wNAmr5yN7sizSh0bzB3u5mfhvK3xBmfF9AKB1mP0cUx4NmH5icKJ2Susg9Fxydn9zjLahmPCMrL3wK6TxdWtjA	99779AA9-A638-4CC1-9E79-984558099673	74c6315932840627958fbd2159a6edc0	anilnavis@1gmail.com	\N	\N	2025-05-17 12:54:38	\N	\N
320	anil navis	anilad@anilad.com	971	67575758588	1	$2y$12$5Ely2FOPZ.UL4vy7IbNXKe3M3DMvu9vmuzF8jNBZ/sxl7Cb6QEJN6	\N	\N	1	2	anil	navis	\N	\N	1	\N	2025-03-21 15:18:16	2025-03-21 15:18:16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
308	Denis Dvornikov	ftemetattoo@gmail.com	7	9202888514	1	$2y$12$mTIRc4x029iwzDpMOYj1U.rm/bl0TKmLV1V3eNTYi1vGHtZq8aDUa	\N	\N	1	3	Denis	Dvornikov	67d803a0cdb6c_1742209952.jpg	\N	1	\N	2025-03-17 15:12:33	2025-03-17 15:13:42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
330	anil navis	anilnavis@gmail.com	971	456466496	1	$2y$12$kD6zHKik0lxNnqTOCXWut.290QKPU8QkAKjUwxTm2qmCSoC1COQn.	\N	\N	1	2	anil	navis	\N	\N	1	\N	2025-05-17 12:55:36	2025-05-20 11:14:06	\N	ios	cOUCs4cqakIXujb3jDg4Rb:APA91bE0PPPUQ0RTBow_cDVbi9Ygi-sdmXTyW6Td_abW1YE9gYD5CSLFQagF8CMKWnLz-BFDf6bpV5hGwIG8wG0uQ9sNbqrOakmALeq1KHrxd6y78IqNGSw	542A3BA0-1DFE-4AA2-B581-36FCE9DBF39E	\N	\N	\N	\N	2025-05-20 11:14:06	\N	\N
195	Karen Madino	u25@mailinator.com	971	4265346456	1	$2y$12$fqpXYA.qLWZheTReQrtx1.kKcuFBwMSCQ4T3iDkuPx7HkqnfifgkO	\N	\N	1	3	Karen	Madino	66f1313d1ed90_1727082813.jpg	\N	1	\N	2024-09-23 13:13:34	2024-09-23 13:54:21	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-23 13:54:21	\N	\N
302	sabeeh shah	hashmi@gmail.com	971	2233445566	1	$2y$12$i4TlVgzX3NC.7CxD.hDiVubEeonolLx0xvuPLjPA/sQKb6SPYdPzK	\N	\N	1	2	sabeeh	shah	\N	\N	1	\N	2025-03-13 09:19:54	2025-03-13 09:44:11	\N	android	\N	a94a84c9aa0ca3f3	\N	\N	\N	\N	2025-03-13 09:44:11	\N	\N
314	sabeeh shah	shah@gmail.com	971	2345678933	1	$2y$12$LIvTJH9sDDpuRTXn8cTn3ex1mG/OZMDN5iqCaYWyGyEUqH88DOH2m	\N	\N	1	2	sabeeh	shah	\N	\N	1	\N	2025-03-19 11:17:03	2025-03-20 13:51:41	\N	android	\N	cart_a	\N	\N	\N	\N	\N	\N	\N
1	Admin	admin@admin.com	971	112233445566778899	0	$2y$12$CRCflbvSGgFT2INMh87FQOVjuVGRKbaZJXKy1j0GWQ4SkPgpFmkN2	\N	1	1	1	\N	\N	\N	\N	1	\N	\N	2025-05-22 12:16:50	\N	ios	\N	03377690-D382-478E-BC43-AFEBBA4EC8E1	\N	\N	\N	\N	\N	2025-05-22 08:16:50	\N
321	anil navis	aniladmin@gmail.com	971	464437373	1	$2y$12$gNZC1D1Y75npz6ockitF9eP85vGwSSswIK95O3rfx0PhKA/yS26fG	\N	\N	1	2	anil	navis	\N	\N	1	\N	2025-03-21 15:38:09	2025-03-21 15:38:09	\N	ios	\N	cart_a	\N	\N	\N	\N	\N	\N	\N
303	chalent chanter	chalent@me.com	971	526162947	1	$2y$12$LondJ..mQ0pidjpcE.tMgObmC2hdMyOes5PdkUqHVNWPt9mX6uxDm	\N	\N	1	2	chalent	chanter	\N	\N	1	\N	2025-03-13 09:43:37	2025-03-17 12:34:22	\N	ios	\N	cart_a	\N	\N	\N	\N	2025-03-17 12:34:22	\N	\N
131	Wahab khurram	wahabfun22@gmail.com	971	134234234323	1	$2y$12$dQqjHwGNaRx.Tq7iUxCXrOn5CGlDCS.c9I9/RYtW6lJY3SuAGU6py	\N	\N	1	3	Wahab	khurram	66c0eb3915f93_1723919161.jpg	\N	1	\N	2024-08-17 22:26:01	2024-08-17 22:28:39	\N	\N	\N	\N	\N	\N	\N	\N	2024-08-17 22:28:39	\N	\N
315	anil navis	anilnavis@gmail.com	971	564005096	1	$2y$12$gFgZDgxOEwG6XVrUXqJ4qucDFnoAPeY7EnEDVh2FWqy13nBldMLfm	\N	\N	1	2	anil	navis	\N	1234	1	\N	2025-03-19 11:24:13	2025-05-17 04:48:26	\N	ios	eRod9X2-i0W7hXh6T045iQ:APA91bGvLzylfc_9WMuNGWqU_ycKP34h1QXPvKNSPcTVd4eVrU7kBYPAyRBt8YbWVGCsPwYheaamIXkCYCCmhGbXccvCQKu3rjEgaxBHPqU_Yz4UT0YWYgs	D668785A-B481-40BE-B3D0-50C3792C4884	\N	anilnavis1@gmail.com	564005097	971	2025-05-17 04:48:26	\N	\N
135	Paula Bolchat	paulabolchatink@gmail.com	971	588314553	1	$2y$12$fJxiQvCJj5x6GL.XprgTmOwLF0NVzmuPU9xqaachr638pvFFcxt4G	\N	\N	1	3	Paula	Bolchat	67d7fd8f1ed09_1742208399.jpg	\N	1	\N	2024-08-22 13:13:48	2025-03-17 14:46:39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
134	Evgeniya Kataewa	kataewa.tattoo@gmail.com	7	9869541725	1	$2y$12$f9/ZV4qKsH2zI7r1U8h/O.H5XEMgZ6qDCGoejXyzQrh/s1Nqeyr3i	\N	\N	1	3	Evgeniya	Kataewa	67d7fe8b5101e_1742208651.jpg	\N	1	\N	2024-08-22 13:06:06	2025-03-17 14:50:51	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
133	Karen Gonzalez	kareng2506@gmail.com	57	3017652473	1	$2y$12$dwmUCJ1tmJ61JWWyUjgJKOiGd4LBC/DmWcuhQTxNh2/bzQCOQZbuu	\N	\N	1	3	Karen	Gonzalez	67d8011b5e057_1742209307.jpg	\N	1	\N	2024-08-22 12:56:48	2025-03-17 15:01:47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
331	anil navis	anilnavis@gmail.com	971	546466465	1	$2y$12$Yyqej08dn7Qidz7x3FBw2OtupVYh9iLfJcBMaYY/5kJvIXsABM4hu	\N	\N	1	2	anil	navis	\N	\N	1	\N	2025-05-20 11:15:34	2025-05-22 12:48:17	\N	ios	f6jq6jdzJ0konbTw27z6Kw:APA91bFHiytxee6ZmHGiXzs9bu9j-N8Iln02pZ6Xh7Pr51FBXqFyjrKv-FxieAiSwTKM4OlH46cNcd8PtkXVW4Rz8322uZEV3lYWj327F5-k42o6kiNskiQ	2B21D441-3F63-4C98-BD85-BB7510103405	\N	\N	\N	\N	\N	\N	\N
309	Christina Dvornikova	christinatattoo@gmail.com	7	9307701555	1	$2y$12$t2mO.cxFZyP43Tm8HIIX6.VrQWIaAuW1VbVEEC9WIdZAxGg9VHlCu	\N	\N	1	3	Christina	Dvornikova	67d80d2b11b84_1742212395.jpg	\N	1	\N	2025-03-17 15:36:28	2025-03-17 15:53:15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
115	dhg ds	sd@gmail.com	971	567567657	1	$2y$12$E2GBKtf5GDucGoza.7iCA.hZxt0I2MDOcBflEqQGjnm5lQi5fotni	\N	\N	1	3	dhg	ds	66bc96e375d7c_1723635427.jpg	\N	1	\N	2024-08-14 15:37:08	2024-08-14 17:50:34	\N	\N	\N	\N	\N	\N	\N	\N	2024-08-14 17:50:34	\N	\N
121	Testing aa	washfajsf@gmail.com	971	33534534	1	$2y$12$/JUiCT8PoQ5YP22X.GewoObmNsqJWBPS1Wf08MK2OyjmgPgeD1Yiy	\N	\N	1	3	Testing	aa	66bcc253d337a_1723646547.jpg	\N	1	\N	2024-08-14 18:42:28	2024-08-14 18:42:36	\N	\N	\N	\N	\N	\N	\N	\N	2024-08-14 18:42:36	\N	\N
122	fdx vsd	sdx@gmail.com	971	456456	1	$2y$12$B.n0lz6WUoIbYvrbMdFm7.XMOpGlbhGLliebc6mlnD1zCr8ukK6xq	\N	\N	1	3	fdx	vsd	66bcc60079d37_1723647488.jpg	\N	1	\N	2024-08-14 18:58:09	2024-08-14 19:03:04	\N	\N	\N	\N	\N	\N	\N	\N	2024-08-14 19:03:04	\N	\N
123	jasmin s	jas@gmail.com	971	567567567	1	$2y$12$c8hEyV.8dpFNLyWQfJQwbuaIBhgubCcCk/vM5hcZlNUDrLqXQ2UrS	\N	\N	1	3	jasmin	s	66bd83318dbec_1723695921.jpg	\N	1	\N	2024-08-15 08:25:21	2024-08-17 17:38:40	\N	\N	\N	\N	\N	\N	\N	\N	2024-08-17 17:38:40	\N	\N
322	anil navis	anilnew@anilnew.com	971	343466363	1	$2y$12$i3DeEfBudFVOt/wzdhc6PeDfx.LxQqAyafJv5cUsEDBsuxWSt93OS	\N	\N	1	2	anil	navis	67dd5054d3032_1742557268.jpg	\N	1	\N	2025-03-21 15:41:09	2025-03-21 15:44:48	\N	ios	\N	84612618-8DCC-4275-9B0A-D4E5AD6EE97E		\N	\N	\N	\N	\N	\N
304	test user	nasrullah@gmail.com	971	4523312221	1	$2y$12$IcqH6Fmz4jw.HqcMKJV6zuT5EoLq.95BakYH2tlR1pMVVQ1rmJjYm	\N	\N	1	2	test	user	\N	1234	1	\N	2025-03-13 09:45:18	2025-03-17 13:04:20	\N	ios	\N	cart_a	22ee87ae7144e13238522720c237ae69	\N	\N	\N	2025-03-17 13:04:20	\N	\N
310	Jason Leon	jasonleon11@gmail.com	971	564708537	1	$2y$12$j98OM7acVMM5RNVD6bOk8OQLUwZamoMTgMhV4yCRxeGKbQEmpUDVO	\N	\N	1	3	Jason	Leon	67d80ab6286f1_1742211766.jpg	\N	1	\N	2025-03-17 15:42:46	2025-03-17 15:42:46	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
316	ajesh kumar	ajeshcd@gmail.com	971	505041860	1	$2y$12$xXfybyeZW/vk/X5zhw7hz.QJRdPxs94B65oeze6HejfW0Y9ZAkYZy	\N	\N	1	2	ajesh	kumar	\N	\N	1	\N	2025-03-19 16:10:46	2025-03-19 16:10:46	\N	ios	cq1-wlLVHEfAr3ip_evX7d:APA91bG6FwPhFg1RSG3aj9fG16agnPXkyDz10faUvqFLAeZ2kORLjAMo_26A58M3ztiENdJJbJm6yaDtb6LDMzkWCSB97fWzcPsjRT8Psyoua_r1FHMucnQ	cart_a	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: users_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_role (id, role_name, created_at, updated_at) FROM stdin;
1	admin	2024-05-03 08:46:02	2024-05-03 08:46:02
2	users	2024-05-03 08:46:02	2024-05-03 08:46:02
3	vendors	2024-05-03 08:46:02	2024-05-03 08:46:02
\.


--
-- Data for Name: vendor_booking_dates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_booking_dates (id, booking_id, date, start_time, end_time, resource_id) FROM stdin;
1008	696	2025-03-17	14:00:00	17:00:00	12
1010	697	2025-03-18	11:30:00	12:30:00	12
1011	698	2025-03-19	12:00:00	13:00:00	1
1013	699	2025-03-21	10:00:00	11:00:00	1
1020	703	2025-03-22	10:00:00	11:00:00	1
1021	700	2025-03-22	13:30:00	14:30:00	1
1022	704	2025-03-21	11:30:00	12:30:00	1
1023	702	2025-03-22	15:00:00	16:00:00	1
1024	701	2025-03-22	18:00:00	19:00:00	1
1025	705	2025-03-21	12:00:00	13:00:00	1
1029	706	2025-03-21	14:00:00	15:00:00	1
1030	707	2025-03-31	15:00:00	17:00:00	1
1031	708	2025-03-31	18:00:00	19:00:00	1
1032	709	2025-04-04	16:00:00	17:00:00	1
1033	710	2025-04-08	10:00:00	11:00:00	1
1034	711	2025-04-08	11:30:00	12:30:00	1
1035	712	2025-04-08	13:00:00	14:00:00	1
1036	713	2025-04-08	14:30:00	15:30:00	1
1037	714	2025-04-11	10:00:00	11:00:00	1
1039	715	2025-04-11	14:00:00	15:00:00	16
1040	716	2025-04-11	11:30:00	12:30:00	16
1041	717	2025-04-11	16:30:00	17:30:00	1
1042	718	2025-04-12	10:00:00	11:00:00	1
1043	719	2025-04-29	14:00:00	19:00:00	12
1044	720	2025-04-29	15:00:00	16:00:00	1
1045	721	2025-04-29	15:30:00	18:00:00	1
1046	722	2025-05-06	18:00:00	19:00:00	2
1047	723	2025-05-07	10:00:00	11:00:00	12
1048	724	2025-05-15	15:00:00	16:00:00	1
1049	725	2025-05-15	16:00:00	17:00:00	1
1050	726	2025-05-15	17:00:00	18:00:00	1
1051	727	2025-05-16	11:00:00	12:00:00	1
1052	728	2025-05-16	13:30:00	14:30:00	1
1054	729	2025-05-19	10:00:00	13:00:00	1
1055	730	2025-05-17	10:00:00	11:00:00	1
1056	731	2025-05-17	13:00:00	14:00:00	1
1057	732	2025-05-20	11:30:00	12:30:00	1
1060	735	2025-05-20	16:00:00	17:00:00	1
1061	733	2025-05-21	10:00:00	11:00:00	1
1065	738	2025-05-21	13:30:00	14:30:00	1
1066	739	2025-05-20	13:30:00	14:30:00	1
1067	737	2025-05-21	11:30:00	12:30:00	1
1068	740	2025-05-21	15:00:00	16:00:00	1
1069	741	2025-05-20	17:30:00	18:30:00	1
1070	742	2025-05-21	16:30:00	17:30:00	1
1071	743	2025-05-21	18:00:00	19:00:00	1
1072	744	2025-05-22	10:00:00	11:00:00	1
1073	745	2025-05-22	11:30:00	12:30:00	1
1074	746	2025-05-22	13:00:00	14:00:00	1
1075	747	2025-05-22	14:30:00	15:30:00	1
1076	748	2025-05-22	16:00:00	17:00:00	1
\.


--
-- Data for Name: vendor_booking_media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_booking_media (id, filename, vendor_booking_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: vendor_bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_bookings (id, user_id, title, reference_number, total, advance, order_id, created_at, updated_at, customer_id, status, total_paid, tax, discount, is_rescheduled, hourly_rate, total_with_tax, total_without_tax, total_hours, last_payment_method, temp_reschedule_data, before_reschedule_dates, total_rschdl_paid, disraption, artist_commission, neworer_commission, gateway, cancel_remarks, is_refund_made, refund_file, duration, reschedule_amount, admin_completed) FROM stdin;
705	310	45	D7152393	350.00	100.00	D9634298	2025-03-21 11:54:22	2025-03-21 12:06:44	313	completed	350.00	0.00	0.00	0	350.00	350.00	350.00	1.00	wallet		[{"id":1025,"booking_id":705,"date":"2025-03-21","start_time":"12:00:00","end_time":"13:00:00","resource_id":1}]	0	17.5	191.8	140.7	11.15	\N	f	\N	1.00	0	0
707	308	nothing	D7216116	1620.00	600.00	D2861745	2025-03-31 16:58:49	2025-03-31 17:03:34	323	completed	1620.00	0.00	0.00	0	810.00	1620.00	1620.00	2.00	stripe_card		[{"id":1030,"booking_id":707,"date":"2025-03-31","start_time":"15:00:00","end_time":"17:00:00","resource_id":1}]	0	81	887.76	651.24	47.98	\N	f	\N	2.00	0	0
708	309	non	D9136804	810.00	600.00	D7512827	2025-03-31 17:13:59	2025-03-31 18:12:17	323	completed	810.00	0.00	0.00	0	810.00	810.00	810.00	1.00	stripe_card		[{"id":1031,"booking_id":708,"date":"2025-03-31","start_time":"18:00:00","end_time":"19:00:00","resource_id":1}]	0	40.5	443.88	325.62	24.49	\N	f	\N	1.00	0	0
709	134	ww	D5143592	810.00	600.00	D3475069	2025-04-04 15:42:02	2025-05-15 14:32:21	313	completed	810.00	0.00	0.00	0	810.00	810.00	810.00	1.00	wallet		[{"id":1032,"booking_id":709,"date":"2025-04-04","start_time":"16:00:00","end_time":"17:00:00","resource_id":1}]	0	40.5	443.88	325.62	24.49	\N	f	\N	1.00	0	0
703	133	hi	D3168556	810.00	600.00	D9715764	2025-03-21 11:01:40	2025-04-04 15:49:16	313	completed	810.00	0.00	0.00	1	810.00	810.00	810.00	1.00	stripe_card		[{"id":1020,"booking_id":703,"date":"2025-03-22","start_time":"10:00:00","end_time":"11:00:00","resource_id":1}]	600	40.5	443.88	325.62	24.49	\N	f	\N	1.00	600	0
706	133	jk	D7545593	810.00	600.00	D5420954	2025-03-21 13:32:51	2025-04-05 12:34:33	315	completed	810.00	0.00	0.00	1	810.00	810.00	810.00	1.00	stripe_card		[{"id":1029,"booking_id":706,"date":"2025-03-21","start_time":"14:00:00","end_time":"15:00:00","resource_id":1}]	0	40.5	443.88	325.62	24.49	\N	f	\N	1.00	0	0
713	135	hi	D6575015	770.00	400.00	D9140177	2025-04-08 10:39:14	2025-04-08 11:49:05	313	payment	400.00	0.00	0.00	0	770.00	770.00	770.00	1.00	stripe_card		[{"id":1036,"booking_id":713,"date":"2025-04-08","start_time":"14:30:00","end_time":"15:30:00","resource_id":1}]	0	38.5	421.96	309.54	23.33	\N	f	\N	1.00	0	0
712	135	hj	D7582088	770.00	400.00	D5641984	2025-04-08 10:38:41	2025-04-09 00:44:37	323	payment	400.00	0.00	0.00	0	770.00	770.00	770.00	1.00	wallet		\N	0	38.5	421.96	309.54	23.33	\N	f	\N	1.00	0	0
714	308	aa	D6779158	810.00	600.00	D7484930	2025-04-11 07:41:52	2025-04-11 11:16:49	315	completed	810.00	0.00	0.00	0	810.00	810.00	810.00	1.00	stripe_card		[{"id":1037,"booking_id":714,"date":"2025-04-11","start_time":"10:00:00","end_time":"11:00:00","resource_id":1}]	0	40.5	443.88	325.62	24.49	\N	f	\N	1.00	0	0
716	135	www	D4623632	770.00	400.00	D5094632	2025-04-11 11:07:30	2025-04-11 17:05:32	315	completed	770.00	0.00	0.00	0	770.00	770.00	770.00	1.00	stripe_card		[{"id":1040,"booking_id":716,"date":"2025-04-11","start_time":"11:30:00","end_time":"12:30:00","resource_id":16}]	0	38.5	421.96	309.54	23.33	\N	f	\N	1.00	0	0
718	134	sw	D9976045	810.00	600.00	D1608959	2025-04-12 06:48:54	2025-05-06 17:46:21	315	completed	810.00	0.00	0.00	0	810.00	810.00	810.00	1.00	stripe_card		[{"id":1042,"booking_id":718,"date":"2025-04-12","start_time":"10:00:00","end_time":"11:00:00","resource_id":1}]	0	40.5	443.88	325.62	24.49	\N	f	\N	1.00	0	0
697	135	ghg	D6158530	770.00	400.00	D8427318	2025-03-17 13:41:35	2025-03-17 10:58:35	306	payment	400.00	0.00	0.00	1	770.00	770.00	770.00	1.00	stripe_card	{"new_dates":[{"id":1009,"booking_id":697,"date":"2025-03-17","start_time":"17:30:00","end_time":"18:30:00","resource_id":12}],"reschedule_rate":400,"reschedule_policy":{"hours":"24","amount":"100"}}	[{"id":1009,"booking_id":697,"date":"2025-03-17","start_time":"17:30:00","end_time":"18:30:00","resource_id":12}]	0	38.5	421.96	309.54	23.33	\N	f	\N	1.00	400	0
711	134	gg	D6879408	810.00	600.00	D4687639	2025-04-08 09:20:25	2025-05-15 14:28:59	315	payment	600.00	0.00	0.00	0	810.00	810.00	810.00	1.00	wallet		\N	0	40.5	443.88	325.62	24.49	\N	f	\N	1.00	0	0
698	308	hi	D5758861	810.00	600.00	D7702751	2025-03-19 11:26:03	2025-03-21 10:50:46	313	completed	810.00	0.00	0.00	0	810.00	810.00	810.00	1.00	stripe_card		[{"id":1011,"booking_id":698,"date":"2025-03-19","start_time":"12:00:00","end_time":"13:00:00","resource_id":1}]	0	40.5	443.88	325.62	24.49	\N	f	\N	1.00	0	0
696	134	na	D5591851	2430.00	600.00	D9150787	2025-03-17 13:22:51	2025-03-17 13:34:26	306	payment	600.00	0.00	0.00	0	810.00	2430.00	2430.00	3.00	stripe_card		[{"id":1008,"booking_id":696,"date":"2025-03-17","start_time":"14:00:00","end_time":"17:00:00","resource_id":12}]	0	121.5	1331.64	976.86	71.47	\N	f	\N	3.00	0	0
700	308	22	D7571402	810.00	600.00	D2761220	2025-03-20 13:44:16	2025-03-21 11:08:34	314	payment	600.00	0.00	0.00	1	810.00	810.00	810.00	1.00	wallet	{"new_dates":[{"id":1016,"booking_id":700,"date":"2025-03-21","start_time":"12:30:00","end_time":"13:30:00","resource_id":12}],"reschedule_rate":600,"reschedule_policy":{"hours":"24","amount":"100"}}	[{"id":1016,"booking_id":700,"date":"2025-03-21","start_time":"12:30:00","end_time":"13:30:00","resource_id":12}]	600	40.5	443.88	325.62	24.49	\N	f	\N	1.00	600	0
699	308	2	D1894651	810.00	600.00	D6030886	2025-03-20 06:24:50	2025-03-20 11:39:11	315	payment	600.00	0.00	0.00	1	810.00	810.00	810.00	1.00	wallet		[{"id":1013,"booking_id":699,"date":"2025-03-21","start_time":"10:00:00","end_time":"11:00:00","resource_id":1,"vendor_booking_resource":{"id":1,"name":"Workstation 6","active":1,"deleted":0}}]	600	40.5	443.88	325.62	24.49	\N	f	\N	1.00	0	0
704	310	hi	D4536686	350.00	100.00	D1042875	2025-03-21 11:10:06	2025-03-21 11:40:51	313	completed	350.00	0.00	0.00	0	350.00	350.00	350.00	1.00	stripe_card		[{"id":1022,"booking_id":704,"date":"2025-03-21","start_time":"11:30:00","end_time":"12:30:00","resource_id":1}]	0	17.5	191.8	140.7	11.15	\N	f	\N	1.00	0	0
701	135	ew	D4362841	770.00	400.00	D5299090	2025-03-20 17:19:18	2025-03-21 11:53:07	317	payment	400.00	0.00	0.00	1	770.00	770.00	770.00	1.00	wallet	{"new_dates":[{"id":1017,"booking_id":701,"date":"2025-03-21","start_time":"14:00:00","end_time":"15:00:00","resource_id":1}],"reschedule_rate":400,"reschedule_policy":{"hours":"24","amount":"100"}}	[{"id":1017,"booking_id":701,"date":"2025-03-21","start_time":"14:00:00","end_time":"15:00:00","resource_id":1}]	0	38.5	421.96	309.54	23.33	\N	f	\N	1.00	400	0
702	135	hh	D8627600	770.00	400.00	D2055872	2025-03-20 17:25:19	2025-03-21 11:51:44	317	payment	400.00	0.00	0.00	1	770.00	770.00	770.00	1.00	stripe_card	{"new_dates":[{"id":1018,"booking_id":702,"date":"2025-03-21","start_time":"15:30:00","end_time":"16:30:00","resource_id":1}],"reschedule_rate":400,"reschedule_policy":{"hours":"24","amount":"100"}}	[{"id":1018,"booking_id":702,"date":"2025-03-21","start_time":"15:30:00","end_time":"16:30:00","resource_id":1}]	0	38.5	421.96	309.54	23.33	\N	f	\N	1.00	400	0
743	135	hi	D4574477	770.00	400.00	D3763254	2025-05-20 16:32:10	2025-05-20 16:34:12	325	payment	400.00	0.00	0.00	0	770.00	770.00	770.00	1.00	stripe_card		[{"id":1071,"booking_id":743,"date":"2025-05-21","start_time":"18:00:00","end_time":"19:00:00","resource_id":1}]	0	38.5	421.96	309.54	23.33	\N	f	\N	1.00	0	0
747	328	hi	D5669040	800.00	200.00	D2916252	2025-05-22 12:33:19	2025-05-22 12:37:06	325	payment	200.00	0.00	0.00	0	800.00	800.00	800.00	1.00	stripe_card		[{"id":1075,"booking_id":747,"date":"2025-05-22","start_time":"14:30:00","end_time":"15:30:00","resource_id":1}]	0	40	438.4	321.6	24.2	\N	f	\N	1.00	0	0
715	135	test	D8522598	770.00	400.00	D8223989	2025-04-11 10:38:49	2025-04-11 11:57:57	313	payment	400.00	0.00	0.00	1	770.00	770.00	770.00	1.00	stripe_card		[{"id":1039,"booking_id":715,"date":"2025-04-11","start_time":"14:00:00","end_time":"15:00:00","resource_id":16,"vendor_booking_resource":{"id":16,"name":"workstation 8","active":1,"deleted":0}}]	400	38.5	421.96	309.54	23.33	\N	f	\N	1.00	0	0
717	135	ff	D6583779	770.00	400.00	D2326480	2025-04-11 16:24:15	2025-04-11 16:31:34	313	completed	770.00	0.00	0.00	0	770.00	770.00	770.00	1.00	stripe_card		[{"id":1041,"booking_id":717,"date":"2025-04-11","start_time":"16:30:00","end_time":"17:30:00","resource_id":1}]	0	38.5	421.96	309.54	23.33	\N	f	\N	1.00	0	0
744	308	hi	D5018443	810.00	600.00	D7795809	2025-05-21 19:08:09	2025-05-21 19:09:05	325	payment	600.00	0.00	0.00	0	810.00	810.00	810.00	1.00	stripe_card		[{"id":1072,"booking_id":744,"date":"2025-05-22","start_time":"10:00:00","end_time":"11:00:00","resource_id":1}]	0	40.5	443.88	325.62	24.49	\N	f	\N	1.00	0	0
748	328	ff	D4600075	800.00	200.00	D3434986	2025-05-22 12:49:34	2025-05-22 12:49:35	331	created	0.00	0.00	0.00	0	800.00	800.00	800.00	1.00	\N	\N	\N	0	40	438.4	321.6	24.2	\N	f	\N	1.00	0	0
745	308	12	D1853770	810.00	600.00	D3209083	2025-05-22 10:12:41	2025-05-22 12:33:58	325	completed	810.00	0.00	0.00	0	810.00	810.00	810.00	1.00	stripe_card		[{"id":1073,"booking_id":745,"date":"2025-05-22","start_time":"11:30:00","end_time":"12:30:00","resource_id":1}]	0	40.5	443.88	325.62	24.49	\N	f	\N	1.00	0	0
719	310	no	D3920160	1750.00	100.00	D5483896	2025-04-29 14:45:53	2025-04-29 14:47:40	323	completed	1750.00	0.00	0.00	0	350.00	1750.00	1750.00	5.00	stripe_card		[{"id":1043,"booking_id":719,"date":"2025-04-29","start_time":"14:00:00","end_time":"19:00:00","resource_id":12}]	0	87.5	959	703.5	51.75	\N	f	\N	5.00	0	0
730	308	ww	D7447156	810.00	600.00	D2336347	2025-05-17 05:33:41	2025-05-17 05:34:11	329	payment	600.00	0.00	0.00	0	810.00	810.00	810.00	1.00	stripe_card		[{"id":1055,"booking_id":730,"date":"2025-05-17","start_time":"10:00:00","end_time":"11:00:00","resource_id":1}]	0	40.5	443.88	325.62	24.49	\N	f	\N	1.00	0	0
720	134	no	D4834307	810.00	600.00	D5971296	2025-04-29 14:49:35	2025-04-29 15:02:35	323	completed	810.00	0.00	0.00	0	810.00	810.00	810.00	1.00	stripe_card		[{"id":1044,"booking_id":720,"date":"2025-04-29","start_time":"15:00:00","end_time":"16:00:00","resource_id":1}]	0	40.5	443.88	325.62	24.49	\N	f	\N	1.00	0	0
727	135	j	D8849876	770.00	400.00	D3537852	2025-05-16 10:59:43	2025-05-16 11:00:28	313	payment	400.00	0.00	0.00	0	770.00	770.00	770.00	1.00	wallet		\N	0	38.5	421.96	309.54	23.33	\N	f	\N	1.00	0	0
721	133	none	D7735258	2025.00	600.00	D1795445	2025-04-29 15:06:11	2025-04-29 15:07:36	323	payment	600.00	0.00	0.00	0	810.00	2025.00	2025.00	2.50	wallet		\N	0	101.25	1109.7	814.05	59.725	\N	f	\N	2.50	0	0
723	135	hi	D4805299	770.00	400.00	D9352657	2025-05-06 17:48:06	2025-05-06 17:54:37	313	payment	400.00	0.00	0.00	0	770.00	770.00	770.00	1.00	stripe_card		[{"id":1047,"booking_id":723,"date":"2025-05-07","start_time":"10:00:00","end_time":"11:00:00","resource_id":12}]	0	38.5	421.96	309.54	23.33	\N	f	\N	1.00	0	0
722	308	kk	D6133578	810.00	600.00	D1889304	2025-05-06 17:10:55	2025-05-15 14:18:59	315	payment	600.00	0.00	0.00	0	810.00	810.00	810.00	1.00	wallet		\N	0	40.5	443.88	325.62	24.49	\N	f	\N	1.00	0	0
710	308	ff	D4933455	810.00	600.00	D1683792	2025-04-08 09:19:10	2025-05-15 14:29:52	315	payment	600.00	0.00	0.00	0	810.00	810.00	810.00	1.00	stripe_card		[{"id":1033,"booking_id":710,"date":"2025-04-08","start_time":"10:00:00","end_time":"11:00:00","resource_id":1}]	0	40.5	443.88	325.62	24.49	\N	f	\N	1.00	0	0
728	135	2	D7829615	770.00	400.00	D6668346	2025-05-16 13:16:41	2025-05-16 13:20:49	313	payment	400.00	0.00	0.00	0	770.00	770.00	770.00	1.00	stripe_card		[{"id":1052,"booking_id":728,"date":"2025-05-16","start_time":"13:30:00","end_time":"14:30:00","resource_id":1}]	0	38.5	421.96	309.54	23.33	\N	f	\N	1.00	0	0
724	135	sss	D2259159	770.00	400.00	D2173363	2025-05-15 14:40:46	2025-05-15 15:08:05	313	completed	770.00	0.00	0.00	0	770.00	770.00	770.00	1.00	wallet		[{"id":1048,"booking_id":724,"date":"2025-05-15","start_time":"15:00:00","end_time":"16:00:00","resource_id":1}]	0	38.5	421.96	309.54	23.33	\N	f	\N	1.00	0	0
725	308	hh	D9258621	810.00	600.00	D3285606	2025-05-15 15:31:32	2025-05-15 16:06:05	313	completed	810.00	0.00	0.00	0	810.00	810.00	810.00	1.00	wallet		[{"id":1049,"booking_id":725,"date":"2025-05-15","start_time":"16:00:00","end_time":"17:00:00","resource_id":1}]	0	40.5	443.88	325.62	24.49	\N	f	\N	1.00	0	0
733	308	ko	D4651844	810.00	600.00	D7130477	2025-05-20 11:35:16	2025-05-20 11:59:30	331	payment	600.00	0.00	0.00	1	810.00	810.00	810.00	1.00	stripe_card	{"new_dates":[{"id":1058,"booking_id":733,"date":"2025-05-20","start_time":"13:00:00","end_time":"14:00:00","resource_id":1}],"reschedule_rate":600,"reschedule_policy":{"hours":"24","amount":"100"}}	[{"id":1058,"booking_id":733,"date":"2025-05-20","start_time":"13:00:00","end_time":"14:00:00","resource_id":1}]	0	40.5	443.88	325.62	24.49	\N	f	\N	1.00	600	0
726	308	12	D4477240	810.00	600.00	D2554608	2025-05-15 16:53:39	2025-05-15 17:46:55	313	completed	810.00	0.00	0.00	0	810.00	810.00	810.00	1.00	wallet		\N	0	40.5	443.88	325.62	24.49	\N	f	\N	1.00	0	0
731	308	s	D9426506	810.00	600.00	D7506536	2025-05-17 12:52:23	2025-05-17 12:52:51	329	payment	600.00	0.00	0.00	0	810.00	810.00	810.00	1.00	stripe_card		[{"id":1056,"booking_id":731,"date":"2025-05-17","start_time":"13:00:00","end_time":"14:00:00","resource_id":1}]	0	40.5	443.88	325.62	24.49	\N	f	\N	1.00	0	0
735	308	h	D9830765	810.00	600.00	D7660255	2025-05-20 11:49:11	2025-05-20 11:50:21	327	payment	600.00	0.00	0.00	0	810.00	810.00	810.00	1.00	stripe_card		[{"id":1060,"booking_id":735,"date":"2025-05-20","start_time":"16:00:00","end_time":"17:00:00","resource_id":1}]	0	40.5	443.88	325.62	24.49	\N	f	\N	1.00	0	0
729	328	hh	D4164536	2400.00	200.00	D3654831	2025-05-16 17:07:47	2025-05-16 17:45:03	327	payment	200.00	0.00	0.00	1	800.00	800.00	800.00	3.00	stripe_card	{"new_dates":[{"id":1053,"booking_id":729,"date":"2025-05-16","start_time":"18:00:00","end_time":"19:00:00","resource_id":1}],"reschedule_rate":1800,"reschedule_policy":{"hours":"24","amount":"100"}}	[{"id":1053,"booking_id":729,"date":"2025-05-16","start_time":"18:00:00","end_time":"19:00:00","resource_id":1}]	0	40	438.4	321.6	24.2	\N	f	\N	3.00	1800	0
732	328	jj	D9479245	800.00	200.00	D8203365	2025-05-20 11:22:32	2025-05-20 11:23:34	331	payment	200.00	0.00	0.00	0	800.00	800.00	800.00	1.00	stripe_card		[{"id":1057,"booking_id":732,"date":"2025-05-20","start_time":"11:30:00","end_time":"12:30:00","resource_id":1}]	0	40	438.4	321.6	24.2	\N	f	\N	1.00	0	0
739	135	hi	D2942792	770.00	400.00	D8077413	2025-05-20 13:21:22	2025-05-20 13:21:23	327	created	0.00	0.00	0.00	0	770.00	770.00	770.00	1.00	\N	\N	\N	0	38.5	421.96	309.54	23.33	\N	f	\N	1.00	0	0
738	308	hi	D3629155	810.00	600.00	D8078241	2025-05-20 13:15:06	2025-05-20 13:19:03	327	payment	600.00	0.00	0.00	1	810.00	810.00	810.00	1.00	stripe_card	{"new_dates":[{"id":1064,"booking_id":738,"date":"2025-05-20","start_time":"13:30:00","end_time":"14:30:00","resource_id":1}],"reschedule_rate":600,"reschedule_policy":{"hours":"24","amount":"100"}}	[{"id":1064,"booking_id":738,"date":"2025-05-20","start_time":"13:30:00","end_time":"14:30:00","resource_id":1}]	0	40.5	443.88	325.62	24.49	\N	f	\N	1.00	600	0
737	308	hi	D8073194	810.00	600.00	D7815019	2025-05-20 12:36:09	2025-05-20 15:35:59	325	payment	600.00	0.00	0.00	1	810.00	810.00	810.00	1.00	stripe_card	{"new_dates":[{"id":1063,"booking_id":737,"date":"2025-05-20","start_time":"17:30:00","end_time":"18:30:00","resource_id":1}],"reschedule_rate":600,"reschedule_policy":{"hours":"24","amount":"100"}}	[{"id":1063,"booking_id":737,"date":"2025-05-20","start_time":"17:30:00","end_time":"18:30:00","resource_id":1}]	0	40.5	443.88	325.62	24.49	\N	f	\N	1.00	600	0
742	135	hi	D2959586	770.00	400.00	D7805270	2025-05-20 16:28:59	2025-05-20 16:29:39	327	payment	400.00	0.00	0.00	0	770.00	770.00	770.00	1.00	stripe_card		[{"id":1070,"booking_id":742,"date":"2025-05-21","start_time":"16:30:00","end_time":"17:30:00","resource_id":1}]	0	38.5	421.96	309.54	23.33	\N	f	\N	1.00	0	0
740	135	hi	D2504531	770.00	400.00	D5531395	2025-05-20 15:42:50	2025-05-20 16:42:20	325	payment	400.00	0.00	0.00	0	770.00	770.00	770.00	1.00	stripe_card		[{"id":1068,"booking_id":740,"date":"2025-05-21","start_time":"15:00:00","end_time":"16:00:00","resource_id":1}]	0	38.5	421.96	309.54	23.33	\N	f	\N	1.00	0	0
741	328	hi	D6900162	800.00	200.00	D5303878	2025-05-20 16:25:20	2025-05-20 16:26:41	325	payment	200.00	0.00	0.00	0	800.00	800.00	800.00	1.00	stripe_card		[{"id":1069,"booking_id":741,"date":"2025-05-20","start_time":"17:30:00","end_time":"18:30:00","resource_id":1}]	0	40	438.4	321.6	24.2	\N	f	\N	1.00	0	0
746	328	hi	D4630059	800.00	200.00	D1151406	2025-05-22 12:21:06	2025-05-22 12:25:51	331	payment	200.00	0.00	0.00	0	800.00	800.00	800.00	1.00	stripe_card		[{"id":1074,"booking_id":746,"date":"2025-05-22","start_time":"13:00:00","end_time":"14:00:00","resource_id":1}]	0	40	438.4	321.6	24.2	\N	f	\N	1.00	0	0
\.


--
-- Data for Name: vendor_portfolios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_portfolios (id, user_id, title, description, filename, mime, type, sort_order, created_at, updated_at) FROM stdin;
1	2	Testing 1	Description testing	6629a8240f0d7_1714006052.jpg	image/jpeg	image	0	\N	\N
5	7	Testing	Testing	66380866bad18_1714948198.jpg	image/jpeg	image	0	\N	\N
4	2	Video 2	testing 2	663094587d440_1714459736.mp4	video/mp4	video	1	\N	2024-05-06 03:01:59
3	2	Video	Testing	66309434b19ad_1714459700.mp4	video/mp4	video	2	\N	2024-05-06 03:01:59
15	10	Music	The art of the live is musics	6669688c52800_1718184076.jpg	image/jpeg	image	0	\N	\N
16	10	Music	The art of the live is musics	6669688c73d07_1718184076.jpg	image/jpeg	image	1	\N	\N
17	10	Music	The art of the live is musics	6669688c7ba11_1718184076.jpg	image/jpeg	image	2	\N	\N
18	10	Music	The art of the live is musics	6669688c82531_1718184076.jpg	image/jpeg	image	3	\N	\N
19	10	Music	The art of the live is musics	6669688c891ca_1718184076.jpg	image/jpeg	image	4	\N	\N
20	10	Music	The art of the live is musics	6669688c978b1_1718184076.jpg	image/jpeg	image	5	\N	\N
21	10	Music	The art of the live is musics	6669688ca04f8_1718184076.jpg	image/jpeg	image	6	\N	\N
22	10	Music	The art of the live is musics	6669688ca68c9_1718184076.jpg	image/jpeg	image	7	\N	\N
23	10	Music	The art of the live is musics	6669688caca8e_1718184076.jpg	image/jpeg	image	8	\N	\N
24	10	Music	The art of the live is musics	6669688cba56f_1718184076.jpg	image/jpeg	image	9	\N	\N
25	10	Music	The art of the live is musics	6669688cc1d0e_1718184076.jpg	image/jpeg	image	10	\N	\N
26	10	Music	The art of the live is musics	6669688cc8672_1718184076.jpg	image/jpeg	image	11	\N	\N
27	10	Music	The art of the live is musics	6669688cdc338_1718184076.jpg	image/jpeg	image	12	\N	\N
28	10	Music	The art of the live is musics	6669688ce3ae1_1718184076.jpg	image/jpeg	image	13	\N	\N
29	27	Musics	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google.	66696a05f0b4c_1718184453.jpg	image/jpeg	image	0	\N	\N
30	27	Musics	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google.	66696a065967e_1718184454.jpg	image/jpeg	image	1	\N	\N
31	27	Musics	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google.	66696a0672b4c_1718184454.jpg	image/jpeg	image	2	\N	\N
32	27	Musics	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google.	66696a067d635_1718184454.jpg	image/jpeg	image	3	\N	\N
33	27	Musics	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google.	66696a0687523_1718184454.jpg	image/jpeg	image	4	\N	\N
34	27	Musics	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google.	66696a068ce65_1718184454.jpg	image/jpeg	image	5	\N	\N
35	27	Musics	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google.	66696a0693237_1718184454.jpg	image/jpeg	image	6	\N	\N
36	27	Musics	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google.	66696a06a0b07_1718184454.jpg	image/jpeg	image	7	\N	\N
37	27	Musics	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google.	66696a06b31f7_1718184454.jpg	image/jpeg	image	8	\N	\N
38	27	Musics	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google.	66696a06ba819_1718184454.jpg	image/jpeg	image	9	\N	\N
39	27	Musics	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google.	66696a06c3707_1718184454.jpg	image/jpeg	image	10	\N	\N
40	27	Musics	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google.	66696a06ca2e9_1718184454.jpg	image/jpeg	image	11	\N	\N
41	27	Musics	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google.	66696a06d007d_1718184454.jpg	image/jpeg	image	12	\N	\N
42	10	Music	The art of the live is musics	66697345a0b18_1718186821.mp4	video/mp4	video	14	\N	\N
43	10	Music	The art of the live is musics	66697345d3b99_1718186821.mp4	video/mp4	video	15	\N	\N
44	10	Music	The art of the live is musics	66697345e6f70_1718186821.mp4	video/mp4	video	16	\N	\N
45	27	Musics	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google.	666973756370b_1718186869.mp4	video/mp4	video	13	\N	\N
46	27	Musics	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google.	66697375afe92_1718186869.mp4	video/mp4	video	14	\N	\N
47	27	Musics	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google.	66697375c828f_1718186869.mp4	video/mp4	video	15	\N	\N
48	27	Musics	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google.	66697375dab23_1718186869.mp4	video/mp4	video	16	\N	\N
49	27	Musics	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google.	66697375ef1be_1718186869.mp4	video/mp4	video	17	\N	\N
50	104	sddg	zsdfsg	66b396ac6e534_1723045548.jpg	image/jpeg	image	0	\N	\N
54	133	\N	\N	66f26fdd6eff6_1727164381.jpg	image/jpeg	image	7	\N	2025-03-17 14:32:14
63	133	\N	\N	66f26fdec58c2_1727164382.jpg	image/jpeg	image	16	\N	2025-03-17 14:32:14
55	133	\N	\N	66f26fdd8477f_1727164381.jpg	image/jpeg	image	8	\N	2025-03-17 14:32:14
56	133	\N	\N	66f26fdda1bea_1727164381.jpg	image/jpeg	image	9	\N	2025-03-17 14:32:14
57	133	\N	\N	66f26fddcc520_1727164381.jpg	image/jpeg	image	10	\N	2025-03-17 14:32:14
58	133	\N	\N	66f26fde05bfa_1727164382.jpg	image/jpeg	image	11	\N	2025-03-17 14:32:14
59	133	\N	\N	66f26fde221dd_1727164382.jpg	image/jpeg	image	12	\N	2025-03-17 14:32:14
60	133	\N	\N	66f26fde42633_1727164382.jpg	image/jpeg	image	13	\N	2025-03-17 14:32:14
61	133	\N	\N	66f26fde697ee_1727164382.jpg	image/jpeg	image	14	\N	2025-03-17 14:32:14
62	133	\N	\N	66f26fde9e756_1727164382.jpg	image/jpeg	image	15	\N	2025-03-17 14:32:14
52	133	\N	\N	66f26fdd398e7_1727164381.jpg	image/jpeg	image	5	\N	2025-03-17 14:32:14
64	133	\N	\N	66f26fdeef78f_1727164382.jpg	image/jpeg	image	17	\N	2025-03-17 14:32:14
51	133	\N	\N	66f26fdcbfcdb_1727164380.jpg	image/jpeg	image	4	\N	2025-03-17 14:32:14
66	134	\N	\N	66f271ad8dad8_1727164845.jpg	image/jpeg	image	0	\N	\N
67	134	\N	\N	66f271add95a8_1727164845.jpg	image/jpeg	image	1	\N	\N
68	134	\N	\N	66f271aded680_1727164845.jpg	image/jpeg	image	2	\N	\N
69	134	\N	\N	66f271ae0e5d3_1727164846.jpg	image/jpeg	image	3	\N	\N
70	134	\N	\N	66f271ae22bad_1727164846.jpg	image/jpeg	image	4	\N	\N
71	134	\N	\N	66f271ae3c119_1727164846.jpg	image/jpeg	image	5	\N	\N
72	134	\N	\N	66f271ae4fc71_1727164846.jpg	image/jpeg	image	6	\N	\N
73	134	\N	\N	66f271ae61bee_1727164846.jpg	image/jpeg	image	7	\N	\N
74	134	\N	\N	66f271ae7794d_1727164846.jpg	image/jpeg	image	8	\N	\N
75	134	\N	\N	66f271ae8d1bb_1727164846.jpg	image/jpeg	image	9	\N	\N
76	134	\N	\N	66f271aea30f8_1727164846.jpg	image/jpeg	image	10	\N	\N
53	133	\N	\N	66f26fdd4fcee_1727164381.jpg	image/jpeg	image	6	\N	2025-03-17 14:32:14
77	134	\N	\N	66f271aeb5647_1727164846.jpeg	image/jpeg	image	11	\N	\N
78	134	\N	\N	66f271aecf6d6_1727164846.jpeg	image/jpeg	image	12	\N	\N
79	134	\N	\N	66f271aee045e_1727164846.jpeg	image/jpeg	image	13	\N	\N
80	134	\N	\N	66f271af00abc_1727164847.jpeg	image/jpeg	image	14	\N	\N
139	309	\N	\N	67ea7ef03929d_1743421168.jpg	image/jpeg	image	4	\N	\N
140	309	\N	\N	67ea7f0fd771e_1743421199.jpg	image/jpeg	image	5	\N	\N
141	309	\N	\N	67ea7f1010323_1743421200.jpg	image/jpeg	image	6	\N	\N
142	309	\N	\N	67ea7f3b2b079_1743421243.jpg	image/jpeg	image	7	\N	\N
143	309	\N	\N	67ea7f3b7053a_1743421243.jpg	image/jpeg	image	8	\N	\N
144	309	\N	\N	67ea7f3b7f6a4_1743421243.jpg	image/jpeg	image	9	\N	\N
126	133	\N	\N	67d7fa2da031a_1742207533.jpg	image/jpeg	image	0	\N	\N
127	133	\N	\N	67d7fa2e22f32_1742207534.jpg	image/jpeg	image	1	\N	\N
128	133	\N	\N	67d7fa2e3d5e8_1742207534.jpg	image/jpeg	image	2	\N	\N
129	133	\N	\N	67d7fa2e50c40_1742207534.jpg	image/jpeg	image	3	\N	\N
133	309	\N	\N	67ea7d9e5af6c_1743420830.jpg	image/jpeg	image	0	\N	\N
134	309	\N	\N	67ea7d9eb9e26_1743420830.jpg	image/jpeg	image	1	\N	\N
135	309	\N	\N	67ea7d9ecea8a_1743420830.jpg	image/jpeg	image	2	\N	\N
136	309	\N	\N	67ea7d9edee1e_1743420830.jpg	image/jpeg	image	3	\N	\N
145	309	\N	\N	67ea7f3b8fd41_1743421243.jpg	image/jpeg	image	10	\N	\N
146	309	\N	\N	67ea7f5d51afa_1743421277.jpg	image/jpeg	image	11	\N	\N
147	309	\N	\N	67ea7f5d89275_1743421277.jpg	image/jpeg	image	12	\N	\N
148	309	\N	\N	67ea7f88e7cf4_1743421320.jpg	image/jpeg	image	13	\N	\N
149	309	\N	\N	67ea7f8930bab_1743421321.jpg	image/jpeg	image	14	\N	\N
150	309	\N	\N	67ea7f894361d_1743421321.jpg	image/jpeg	image	15	\N	\N
151	309	\N	\N	67ea7f894fcc7_1743421321.jpg	image/jpeg	image	16	\N	\N
152	309	\N	\N	67ea7ff07b835_1743421424.jpeg	image/jpeg	image	17	\N	\N
153	135	\N	\N	67ea81b6707c8_1743421878.jpg	image/jpeg	image	0	\N	2025-03-31 15:52:02
154	135	\N	\N	67ea81b69c2df_1743421878.jpg	image/jpeg	image	1	\N	2025-03-31 15:52:02
155	135	\N	\N	67ea81b6b03db_1743421878.jpg	image/jpeg	image	2	\N	2025-03-31 15:52:02
81	135	\N	\N	66f274c364e97_1727165635.jpg	image/jpeg	image	3	\N	2025-03-31 15:52:02
82	135	\N	\N	66f274c41a407_1727165636.jpg	image/jpeg	image	4	\N	2025-03-31 15:52:02
83	135	\N	\N	66f274c433557_1727165636.jpg	image/jpeg	image	5	\N	2025-03-31 15:52:02
84	135	\N	\N	66f274c44794c_1727165636.jpg	image/jpeg	image	6	\N	2025-03-31 15:52:02
85	135	\N	\N	66f274c460792_1727165636.jpg	image/jpeg	image	7	\N	2025-03-31 15:52:02
86	135	\N	\N	66f274c477903_1727165636.jpg	image/jpeg	image	8	\N	2025-03-31 15:52:02
87	135	\N	\N	66f274c496cc7_1727165636.jpg	image/jpeg	image	9	\N	2025-03-31 15:52:02
88	135	\N	\N	66f274c4ae3b2_1727165636.jpg	image/jpeg	image	10	\N	2025-03-31 15:52:02
89	135	\N	\N	66f274c4c3ef1_1727165636.jpg	image/jpeg	image	11	\N	2025-03-31 15:52:02
90	135	\N	\N	66f274c4f0e58_1727165636.jpg	image/jpeg	image	12	\N	2025-03-31 15:52:02
91	135	\N	\N	66f274c524b9a_1727165637.jpg	image/jpeg	image	13	\N	2025-03-31 15:52:02
92	135	\N	\N	66f274c53d975_1727165637.jpg	image/jpeg	image	14	\N	2025-03-31 15:52:02
93	135	\N	\N	66f274c54a69c_1727165637.jpg	image/jpeg	image	15	\N	2025-03-31 15:52:02
94	135	\N	\N	66f274c5626eb_1727165637.jpg	image/jpeg	image	16	\N	2025-03-31 15:52:02
95	135	\N	\N	66f274c57cc6a_1727165637.jpg	image/jpeg	image	17	\N	2025-03-31 15:52:02
156	308	\N	\N	67ea85cb59d56_1743422923.jpg	image/jpeg	image	0	\N	\N
168	308	\N	\N	67ea8796219b8_1743423382.jpg	image/jpeg	image	12	\N	\N
169	308	\N	\N	67ea879637e67_1743423382.jpg	image/jpeg	image	13	\N	\N
165	308	\N	\N	67ea8795c12d4_1743423381.jpg	image/jpeg	image	1	\N	2025-03-31 16:19:13
157	308	\N	\N	67ea85cbb0d33_1743422923.jpg	image/jpeg	image	2	\N	2025-03-31 16:19:13
158	308	\N	\N	67ea85cbca658_1743422923.jpg	image/jpeg	image	3	\N	2025-03-31 16:19:13
166	308	\N	\N	67ea879600ae3_1743423382.jpg	image/jpeg	image	4	\N	2025-03-31 16:19:13
159	308	\N	\N	67ea85f7b8ebb_1743422967.jpg	image/jpeg	image	5	\N	2025-03-31 16:19:13
160	308	\N	\N	67ea85f7ee192_1743422967.jpg	image/jpeg	image	6	\N	2025-03-31 16:19:13
167	308	\N	\N	67ea879613f37_1743423382.jpg	image/jpeg	image	7	\N	2025-03-31 16:19:13
161	308	\N	\N	67ea85f80d047_1743422968.jpg	image/jpeg	image	8	\N	2025-03-31 16:19:13
162	308	\N	\N	67ea85f81f409_1743422968.jpg	image/jpeg	image	9	\N	2025-03-31 16:19:13
163	308	\N	\N	67ea873eae9ff_1743423294.jpg	image/jpeg	image	10	\N	2025-03-31 16:19:13
164	308	\N	\N	67ea873f00ed3_1743423295.jpg	image/jpeg	image	11	\N	2025-03-31 16:19:13
170	308	\N	\N	67ea898532223_1743423877.jpg	image/jpeg	image	14	\N	\N
171	308	\N	\N	67ea89857b98f_1743423877.jpg	image/jpeg	image	15	\N	\N
172	308	\N	\N	67ea89859057a_1743423877.jpg	image/jpeg	image	16	\N	\N
173	308	\N	\N	67ea8985a5650_1743423877.jpg	image/jpeg	image	17	\N	\N
175	310	\N	\N	67ea8b4696ff1_1743424326.jpeg	image/jpeg	image	0	\N	\N
176	310	\N	\N	67ea8b73e8e95_1743424371.jpeg	image/jpeg	image	1	\N	\N
177	310	\N	\N	67ea8b744405d_1743424372.jpeg	image/jpeg	image	2	\N	\N
178	310	\N	\N	67ea8b7455e76_1743424372.jpeg	image/jpeg	image	3	\N	\N
179	310	\N	\N	67ea8b746c2ab_1743424372.jpeg	image/jpeg	image	4	\N	\N
180	310	\N	\N	67ea8b8ac806b_1743424394.jpeg	image/jpeg	image	5	\N	\N
181	310	\N	\N	67ea8bc18b91a_1743424449.jpeg	image/jpeg	image	6	\N	\N
182	310	\N	\N	67ea8bc1cc12a_1743424449.jpeg	image/jpeg	image	7	\N	\N
183	310	\N	\N	67ea8bc1e1ae0_1743424449.jpeg	image/jpeg	image	8	\N	\N
184	310	\N	\N	67ea8be445dec_1743424484.jpeg	image/jpeg	image	9	\N	\N
185	310	\N	\N	67ea8be49be3c_1743424484.jpeg	image/jpeg	image	10	\N	\N
186	310	\N	\N	67ea8c1c645f2_1743424540.jpeg	image/jpeg	image	11	\N	\N
187	310	\N	\N	67ea8c1c9b5e8_1743424540.jpeg	image/jpeg	image	12	\N	\N
188	310	\N	\N	67ea8c1cb0b88_1743424540.jpeg	image/jpeg	image	13	\N	\N
189	310	\N	\N	67ea8c6741db3_1743424615.jpeg	image/jpeg	image	14	\N	\N
190	310	\N	\N	67ea8c6775712_1743424615.jpeg	image/jpeg	image	15	\N	\N
191	310	\N	\N	67ea8ca6b1152_1743424678.jpeg	image/jpeg	image	16	\N	\N
192	310	\N	\N	67ea8ca6ee935_1743424678.jpeg	image/jpeg	image	17	\N	\N
\.


--
-- Data for Name: vendor_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_ratings (id, user_id, vendor_id, rating, review, created_at, updated_at, booking_id, rating_type) FROM stdin;
203	313	308	5	Fine	2025-03-21 10:51:15	2025-03-21 10:51:15	698	NA
204	313	310	4	Good	2025-03-21 11:41:13	2025-03-21 11:41:13	704	NA
205	306	135	5	Great artist	2025-03-31 15:52:55	2025-03-31 15:52:55	\N	NA
206	306	310	5	Top artist	2025-03-31 15:54:39	2025-03-31 15:54:39	\N	NA
207	312	133	4	Great artist	2025-03-31 15:56:02	2025-03-31 15:56:02	\N	NA
208	311	134	4	Great artist!	2025-03-31 15:58:39	2025-03-31 15:58:39	\N	NA
209	307	133	5	Top artist	2025-03-31 16:02:37	2025-03-31 16:02:37	\N	NA
210	314	134	5	Great artist!	2025-03-31 16:05:22	2025-03-31 16:05:22	\N	NA
211	316	309	5	Top artist!	2025-03-31 16:06:15	2025-03-31 16:06:15	\N	NA
212	323	308	5	Good communication	2025-03-31 17:08:39	2025-03-31 17:08:39	707	NA
213	323	309	5	Best artist	2025-03-31 18:12:46	2025-03-31 18:12:46	708	NA
214	315	133	4	Goood job	2025-04-05 12:34:59	2025-04-05 12:34:59	706	NA
215	315	308	1	Good job	2025-04-11 11:17:58	2025-04-11 11:17:58	714	NA
216	315	135	4	Hi	2025-04-12 07:31:27	2025-04-12 07:31:27	716	NA
217	323	310	5	Great artist, good chat!	2025-04-29 14:48:07	2025-04-29 14:48:07	719	NA
218	323	134	5	Amazing artist!	2025-04-29 15:02:56	2025-04-29 15:02:56	720	NA
219	315	134	5	Test	2025-05-06 17:47:41	2025-05-06 17:47:41	718	NA
\.


--
-- Data for Name: vendor_user_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_user_details (id, user_id, username, date_of_birth, lattitude, longitude, location_name, about, instagram, twitter, facebook, tiktok, gender, c_policy, r_policy, reference_number, hourly_rate, advance_percent, availability_from, category_id, type, total_rating, thread, availability_to, deposit_amount, categories) FROM stdin;
27	308	Denis	1991-03-29	25.1000998	55.2380812	Dubai Hills Mall Storm Coaster - Dubai - United Arab Emirates	<p class="p1" style="caret-color: #000000; color: #000000;">My name is Denis. I&rsquo;ve been a tattoo artist for 14 years, specializing in&nbsp;<span class="s1"><strong>color and black &amp; grey realism</strong></span>, as well as&nbsp;<span class="s1"><strong>cover-ups</strong></span>.</p>	https://www.instagram.com/ftemetattoo/	\N	\N	\N	male	\N	\N	695941	810.00	0	\N	5	resident	3.67	\N	\N	600.00	5,7,9,10,12
30	328	John Mack	2025-04-15	25.204819	55.270931	\N	<p>John Mack</p>	\N	\N	\N	\N	male	\N	\N	740419	800.00	0	2025-05-16	4	guest	0.00	\N	2025-06-16	200.00	4,5,6,7
1	131	wahabfun	1993-08-26	25.204819	55.270931	\N	<p>te</p>	\N	\N	\N	\N	male	\N	\N	967136	80.00	0	2024-08-21	2	resident	0.00	\N	2024-08-27	20.00	2
28	309	Christina	1992-09-09	25.1000998	55.2380812	Dubai Hills Mall Storm Coaster - Dubai - United Arab Emirates	<p class="p1" style="caret-color: #000000; color: #000000;">Tattooing has always fascinated me. I&rsquo;ve been drawing since childhood, and in 2020, I decided to pursue a career in tattooing. It was the best decision of my life, as it allows me to create&nbsp;<span class="s1"><strong>beautiful, lasting artwork on women&rsquo;s bodies</strong></span>&nbsp;that they will cherish forever.</p>\r\n<p class="p2" style="caret-color: #000000; color: #000000;">&nbsp;</p>\r\n<p class="p1" style="caret-color: #000000; color: #000000;">I specialize in&nbsp;<span class="s1"><strong>fineline, delicate floral tattoos, and ornamental designs</strong></span>, which I love to blend and harmonize with the natural anatomy of the body.</p>	https://www.instagram.com/loveftemetattoo/	\N	\N	\N	female	\N	\N	194323	810.00	0	\N	6	resident	5.00	\N	\N	600.00	6,7,8,12
3	133	karen	1992-07-25	25.1000998	55.2380812	Dubai Hills Mall Storm Coaster - Dubai - United Arab Emirates	<p>Hi, I&rsquo;m Karen, a tattoo artist from Colombia with nearly a decade of experience. My passion lies in creating meaningful, personalized designs that reflect the beauty of nature, architecture, and the intricate patterns found in life. I believe every tattoo is a story waiting to be told, and I&rsquo;m here to bring your story to life on your skin. My approach is warm and collaborative, ensuring that each piece is crafted with care, love, and a deep connection to your unique journey. I&rsquo;m excited to work with you and create something truly special together.</p>	https://www.instagram.com/karentattooart/	\N	\N	\N	female	\N	\N	733867	810.00	0	2025-01-11	5	resident	4.33	\N	2025-12-26	600.00	5,6,8,12,13
29	310	Jason	1992-11-01	25.204819	55.270931	\N	<p class="p1" style="caret-color: #000000; color: #000000;">Jason was born in&nbsp;<span class="s1"><strong>Bogot&aacute;, Colombia</strong></span>, and grew up surrounded by art, musicians, and painters, which fueled his desire to become an artist himself.</p>\r\n<p class="p2" style="caret-color: #000000; color: #000000;">&nbsp;</p>\r\n<p class="p1" style="caret-color: #000000; color: #000000;">He pursued a career in&nbsp;<span class="s1"><strong>visual arts</strong></span>, becoming a&nbsp;<span class="s1"><strong>commercial photographer</strong></span>, but his passion for creativity led him to explore the&nbsp;<span class="s1"><strong>art of tattooing</strong></span>. After apprenticing at&nbsp;<span class="s1"><strong>Dubai Hills Tattoo</strong></span>&nbsp;and learning from some of the best artists, he is now ready to create&nbsp;<span class="s1"><strong>bold and timeless traditional pieces</strong></span>, his preferred style.</p>	https://www.instagram.com/_inkbyjason_/	\N	\N	\N	male	\N	\N	477325	350.00	0	\N	4	resident	4.67	\N	\N	100.00	4,5
4	134	Evgeniya	1995-01-12	25.1000998	55.2380812	Dubai Hills Mall Storm Coaster - Dubai - United Arab Emirates	<p>Hello! I'm Evgenia, a tattoo artist from Russia with a background in art and a degree in design. I began my tattooing journey in 2018, and from the very first moment, I knew it was my true passion. Tattooing allows me to not only mark significant moments in someone's life but also to help them express their individuality by adding a unique artistic touch to their body. It&rsquo;s an honor to create lasting art that tells a personal story.</p>	https://www.instagram.com/kataewa_tattoo/	\N	\N	\N	female	\N	\N	754816	810.00	0	2024-10-19	5	resident	4.75	\N	2031-09-30	600.00	5,6,8,9,10,12
5	135	paula	1990-08-11	25.1000998	55.2380812	Dubai Hills Mall Storm Coaster - Dubai - United Arab Emirates	<p>Hi, I&rsquo;m Paula, an artist from Rio de Janeiro, Brazil. Growing up in a slum, I learned early on to fight for every opportunity, and art has always been my guiding light. My journey began with canvas painting and graffiti, but everything changed at the start of the COVID-19 pandemic when I discovered the world of tattooing. After taking an online course, I fell in love with this art form. I was fortunate to intern with one of Brazil&rsquo;s top realistic tattoo artists, where I honed my skills in botanical drawings and fine line work. In my first year as a professional tattoo artist, I earned 2nd place in a national competition for beginner artists. My style now centers around fineline, lettering, whipshading, and dotwork in blackwork. I&rsquo;m passionate about bringing my clients' visions to life through my art and would love to create something unique and meaningful for you.&nbsp;</p>	https://www.instagram.com/bolchat.ink/	https://www.instagram.com/bolchat.ink/	https://www.instagram.com/bolchat.ink/	https://www.tiktok.com/@bolchat.ink?_t=ZS-8wOzim02NPt&_r=1	female	\N	\N	378631	770.00	0	2025-03-21	5	resident	4.50	https://www.instagram.com/bolchat.ink/	2025-08-31	400.00	5,6,7,8
11	195	karen45	1998-09-16	25.1000998	55.2380812	Dubai Hills Mall Storm Coaster - Dubai - United Arab Emirates	<p>sdfgsadfdas</p>	https://www.instagram.com/kataewa_tattoo/	fdagfdg	afdgfdg	adfgafdg	male	\N	\N	453324	810.00	0	2024-09-24	5	resident	0.00	afdgfdg	2024-09-30	600.00	5,6,7
\.


--
-- Name: app_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_banners_id_seq', 8, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articles_id_seq', 14, true);


--
-- Name: booking_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_orders_id_seq', 1, false);


--
-- Name: booking_resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_resources_id_seq', 19, true);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 14, true);


--
-- Name: contact_us_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_us_entries_id_seq', 15, true);


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_seq', 251, true);


--
-- Name: customer_ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_ratings_id_seq', 1, true);


--
-- Name: customer_user_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_user_details_id_seq', 246, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: favourites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favourites_id_seq', 122, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 47, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1319, true);


--
-- Name: report_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_reasons_id_seq', 5, true);


--
-- Name: reported_artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reported_artists_id_seq', 53, true);


--
-- Name: reported_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reported_users_id_seq', 1, false);


--
-- Name: role_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_permissions_id_seq', 164, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 9, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 15, true);


--
-- Name: temp_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_transactions_id_seq', 1205, true);


--
-- Name: temp_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_users_id_seq', 251, true);


--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transactions_id_seq', 1359, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 331, true);


--
-- Name: users_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_role_id_seq', 3, true);


--
-- Name: vendor_booking_dates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_booking_dates_id_seq', 1076, true);


--
-- Name: vendor_booking_media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_booking_media_id_seq', 20, true);


--
-- Name: vendor_bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_bookings_id_seq', 748, true);


--
-- Name: vendor_portfolios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_portfolios_id_seq', 192, true);


--
-- Name: vendor_ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_ratings_id_seq', 219, true);


--
-- Name: vendor_user_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_user_details_id_seq', 30, true);


--
-- Name: app_banners app_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_banners
    ADD CONSTRAINT app_banners_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: booking_orders booking_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_orders
    ADD CONSTRAINT booking_orders_pkey PRIMARY KEY (id);


--
-- Name: booking_resources booking_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_resources
    ADD CONSTRAINT booking_resources_pkey PRIMARY KEY (id);


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
-- Name: contact_us_entries contact_us_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us_entries
    ADD CONSTRAINT contact_us_entries_pkey PRIMARY KEY (id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: customer_ratings customer_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_ratings
    ADD CONSTRAINT customer_ratings_pkey PRIMARY KEY (id);


--
-- Name: customer_user_details customer_user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_user_details
    ADD CONSTRAINT customer_user_details_pkey PRIMARY KEY (id);


--
-- Name: customer_user_details customer_user_details_wallet_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_user_details
    ADD CONSTRAINT customer_user_details_wallet_id_unique UNIQUE (wallet_id);


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
-- Name: favourites favourites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_pkey PRIMARY KEY (id);


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
-- Name: report_reasons report_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_reasons
    ADD CONSTRAINT report_reasons_pkey PRIMARY KEY (id);


--
-- Name: reported_artists reported_artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reported_artists
    ADD CONSTRAINT reported_artists_pkey PRIMARY KEY (id);


--
-- Name: reported_users reported_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reported_users
    ADD CONSTRAINT reported_users_pkey PRIMARY KEY (id);


--
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


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
-- Name: temp_transactions temp_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_transactions
    ADD CONSTRAINT temp_transactions_pkey PRIMARY KEY (id);


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
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_role users_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_role
    ADD CONSTRAINT users_role_pkey PRIMARY KEY (id);


--
-- Name: vendor_booking_dates vendor_booking_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_booking_dates
    ADD CONSTRAINT vendor_booking_dates_pkey PRIMARY KEY (id);


--
-- Name: vendor_booking_media vendor_booking_media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_booking_media
    ADD CONSTRAINT vendor_booking_media_pkey PRIMARY KEY (id);


--
-- Name: vendor_bookings vendor_bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_bookings
    ADD CONSTRAINT vendor_bookings_pkey PRIMARY KEY (id);


--
-- Name: vendor_portfolios vendor_portfolios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_portfolios
    ADD CONSTRAINT vendor_portfolios_pkey PRIMARY KEY (id);


--
-- Name: vendor_ratings vendor_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_ratings
    ADD CONSTRAINT vendor_ratings_pkey PRIMARY KEY (id);


--
-- Name: vendor_user_details vendor_user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_user_details
    ADD CONSTRAINT vendor_user_details_pkey PRIMARY KEY (id);


--
-- Name: booking_orders_booking_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX booking_orders_booking_id_index ON public.booking_orders USING btree (booking_id);


--
-- Name: booking_orders_customer_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX booking_orders_customer_id_index ON public.booking_orders USING btree (customer_id);


--
-- Name: booking_orders_order_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX booking_orders_order_id_index ON public.booking_orders USING btree (order_id);


--
-- Name: booking_orders_reference_number_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX booking_orders_reference_number_index ON public.booking_orders USING btree (reference_number);


--
-- Name: booking_orders_status_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX booking_orders_status_index ON public.booking_orders USING btree (status);


--
-- Name: booking_orders_vendor_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX booking_orders_vendor_id_index ON public.booking_orders USING btree (vendor_id);


--
-- Name: customer_ratings_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customer_ratings_user_id_index ON public.customer_ratings USING btree (user_id);


--
-- Name: customer_ratings_vendor_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customer_ratings_vendor_id_index ON public.customer_ratings USING btree (vendor_id);


--
-- Name: customer_user_details_total_rating_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customer_user_details_total_rating_index ON public.customer_user_details USING btree (total_rating);


--
-- Name: customer_user_details_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customer_user_details_user_id_index ON public.customer_user_details USING btree (user_id);


--
-- Name: customer_user_details_wallet_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customer_user_details_wallet_id_index ON public.customer_user_details USING btree (wallet_id);


--
-- Name: favourites_customer_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX favourites_customer_id_index ON public.favourites USING btree (customer_id);


--
-- Name: favourites_vendor_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX favourites_vendor_id_index ON public.favourites USING btree (vendor_id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: temp_transactions_p_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX temp_transactions_p_id_index ON public.temp_transactions USING btree (p_id);


--
-- Name: temp_transactions_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX temp_transactions_type_index ON public.temp_transactions USING btree (type);


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
-- Name: transactions_customer_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transactions_customer_id_index ON public.transactions USING btree (customer_id);


--
-- Name: transactions_order_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transactions_order_id_index ON public.transactions USING btree (order_id);


--
-- Name: transactions_other_customer_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transactions_other_customer_id_index ON public.transactions USING btree (other_customer_id);


--
-- Name: transactions_p_trans_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transactions_p_trans_id_index ON public.transactions USING btree (p_trans_id);


--
-- Name: transactions_payment_method_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transactions_payment_method_index ON public.transactions USING btree (payment_method);


--
-- Name: transactions_status_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transactions_status_index ON public.transactions USING btree (status);


--
-- Name: transactions_transaction_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transactions_transaction_id_index ON public.transactions USING btree (transaction_id);


--
-- Name: transactions_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transactions_type_index ON public.transactions USING btree (type);


--
-- Name: transactions_vendor_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transactions_vendor_id_index ON public.transactions USING btree (vendor_id);


--
-- Name: users_device_cart_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_device_cart_id_index ON public.users USING btree (device_cart_id);


--
-- Name: users_fcm_token_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_fcm_token_index ON public.users USING btree (fcm_token);


--
-- Name: users_forget_pass_token_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_forget_pass_token_index ON public.users USING btree (password_reset_code);


--
-- Name: users_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_id_index ON public.users USING btree (id);


--
-- Name: users_role_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_role_id_index ON public.users USING btree (role_id);


--
-- Name: vendor_booking_dates_booking_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_booking_dates_booking_id_index ON public.vendor_booking_dates USING btree (booking_id);


--
-- Name: vendor_booking_dates_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_booking_dates_date_index ON public.vendor_booking_dates USING btree (date);


--
-- Name: vendor_booking_dates_start_time_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_booking_dates_start_time_index ON public.vendor_booking_dates USING btree (start_time);


--
-- Name: vendor_booking_media_vendor_booking_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_booking_media_vendor_booking_id_index ON public.vendor_booking_media USING btree (vendor_booking_id);


--
-- Name: vendor_bookings_customer_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_bookings_customer_id_index ON public.vendor_bookings USING btree (customer_id);


--
-- Name: vendor_bookings_order_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_bookings_order_id_index ON public.vendor_bookings USING btree (order_id);


--
-- Name: vendor_bookings_reference_number_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_bookings_reference_number_index ON public.vendor_bookings USING btree (reference_number);


--
-- Name: vendor_bookings_status_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_bookings_status_index ON public.vendor_bookings USING btree (status);


--
-- Name: vendor_bookings_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_bookings_user_id_index ON public.vendor_bookings USING btree (user_id);


--
-- Name: vendor_portfolios_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_portfolios_user_id_index ON public.vendor_portfolios USING btree (user_id);


--
-- Name: vendor_ratings_booking_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_ratings_booking_id_index ON public.vendor_ratings USING btree (booking_id);


--
-- Name: vendor_ratings_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_ratings_user_id_index ON public.vendor_ratings USING btree (user_id);


--
-- Name: vendor_ratings_vendor_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_ratings_vendor_id_index ON public.vendor_ratings USING btree (vendor_id);


--
-- Name: vendor_user_details_availability_from_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_user_details_availability_from_index ON public.vendor_user_details USING btree (availability_from);


--
-- Name: vendor_user_details_availability_to_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_user_details_availability_to_index ON public.vendor_user_details USING btree (availability_to);


--
-- Name: vendor_user_details_category_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_user_details_category_id_index ON public.vendor_user_details USING btree (category_id);


--
-- Name: vendor_user_details_reference_number_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_user_details_reference_number_index ON public.vendor_user_details USING btree (reference_number);


--
-- Name: vendor_user_details_total_rating_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_user_details_total_rating_index ON public.vendor_user_details USING btree (total_rating);


--
-- Name: vendor_user_details_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_user_details_type_index ON public.vendor_user_details USING btree (type);


--
-- Name: vendor_user_details_username_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vendor_user_details_username_index ON public.vendor_user_details USING btree (username);


--
-- Name: booking_orders booking_orders_booking_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_orders
    ADD CONSTRAINT booking_orders_booking_id_foreign FOREIGN KEY (booking_id) REFERENCES public.vendor_bookings(id) ON DELETE CASCADE;


--
-- Name: booking_orders booking_orders_customer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_orders
    ADD CONSTRAINT booking_orders_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: booking_orders booking_orders_vendor_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_orders
    ADD CONSTRAINT booking_orders_vendor_id_foreign FOREIGN KEY (vendor_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: customer_ratings customer_ratings_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_ratings
    ADD CONSTRAINT customer_ratings_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: customer_ratings customer_ratings_vendor_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_ratings
    ADD CONSTRAINT customer_ratings_vendor_id_foreign FOREIGN KEY (vendor_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: customer_user_details customer_user_details_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_user_details
    ADD CONSTRAINT customer_user_details_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: transactions transactions_customer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: transactions transactions_other_customer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_other_customer_id_foreign FOREIGN KEY (other_customer_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: transactions transactions_vendor_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_vendor_id_foreign FOREIGN KEY (vendor_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: vendor_booking_dates vendor_booking_dates_booking_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_booking_dates
    ADD CONSTRAINT vendor_booking_dates_booking_id_foreign FOREIGN KEY (booking_id) REFERENCES public.vendor_bookings(id) ON DELETE CASCADE;


--
-- Name: vendor_booking_media vendor_booking_media_vendor_booking_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_booking_media
    ADD CONSTRAINT vendor_booking_media_vendor_booking_id_foreign FOREIGN KEY (vendor_booking_id) REFERENCES public.vendor_bookings(id) ON DELETE CASCADE;


--
-- Name: vendor_bookings vendor_bookings_customer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_bookings
    ADD CONSTRAINT vendor_bookings_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: vendor_bookings vendor_bookings_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_bookings
    ADD CONSTRAINT vendor_bookings_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: vendor_portfolios vendor_portfolios_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_portfolios
    ADD CONSTRAINT vendor_portfolios_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: vendor_ratings vendor_ratings_booking_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_ratings
    ADD CONSTRAINT vendor_ratings_booking_id_foreign FOREIGN KEY (booking_id) REFERENCES public.vendor_bookings(id) ON DELETE CASCADE;


--
-- Name: vendor_ratings vendor_ratings_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_ratings
    ADD CONSTRAINT vendor_ratings_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: vendor_ratings vendor_ratings_vendor_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_ratings
    ADD CONSTRAINT vendor_ratings_vendor_id_foreign FOREIGN KEY (vendor_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: vendor_user_details vendor_user_details_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_user_details
    ADD CONSTRAINT vendor_user_details_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.category(id) ON DELETE SET NULL;


--
-- Name: vendor_user_details vendor_user_details_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_user_details
    ADD CONSTRAINT vendor_user_details_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

