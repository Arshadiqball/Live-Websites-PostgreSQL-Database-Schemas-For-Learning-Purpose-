--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.10 (Ubuntu 15.10-1.pgdg20.04+1)

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
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_id_seq" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    booking_status integer DEFAULT 0 NOT NULL,
    booking_code character varying(255) NOT NULL,
    pickup_latitude character varying(255) NOT NULL,
    pickup_longitude character varying(255) NOT NULL,
    dropoff_latitude character varying(255) NOT NULL,
    dropoff_longitude character varying(255) NOT NULL,
    pickup_location_name text NOT NULL,
    dropoff_location_name text NOT NULL,
    vehicle_type_id integer NOT NULL,
    payment_type integer DEFAULT 0 NOT NULL,
    base_fare double precision DEFAULT '0'::double precision NOT NULL,
    rta_commssion double precision DEFAULT '0'::double precision NOT NULL,
    rate_per_km double precision DEFAULT '0'::double precision NOT NULL,
    total_km_charge double precision DEFAULT '0'::double precision NOT NULL,
    total_charge double precision DEFAULT '0'::double precision NOT NULL,
    amount_to_pay double precision DEFAULT '0'::double precision NOT NULL,
    wallet_amount_used double precision DEFAULT '0'::double precision NOT NULL,
    rate_id integer DEFAULT 0 NOT NULL,
    distance_km double precision DEFAULT '0'::double precision NOT NULL,
    needed_date date,
    need_time time(0) without time zone,
    time_needed character varying(255),
    currency_code character varying(255),
    driver_instructions text,
    friend_name character varying(255),
    friend_phone_number character varying(255),
    driver_id integer DEFAULT 0 NOT NULL,
    driver_commission double precision DEFAULT '0'::double precision NOT NULL,
    caby_commission double precision DEFAULT '0'::double precision NOT NULL,
    salik double precision DEFAULT '0'::double precision NOT NULL,
    surcharge double precision DEFAULT '0'::double precision NOT NULL,
    city_crossing_fee double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    cancell_title text,
    cancell_reason text,
    is_rated integer DEFAULT 0 NOT NULL,
    overall_rating double precision DEFAULT '0'::double precision NOT NULL,
    driver_rating double precision DEFAULT '0'::double precision NOT NULL,
    refer_friend_rating double precision DEFAULT '0'::double precision NOT NULL,
    coupon_code character varying(255),
    coupon_id integer DEFAULT 0 NOT NULL,
    coupon_discount double precision DEFAULT '0'::double precision NOT NULL,
    is_scheduled integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.bookings OWNER TO postgres;

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
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    id bigint NOT NULL,
    company_name character varying(255) NOT NULL,
    contact_person character varying(255),
    document_frond_view character varying(255),
    document_back_view character varying(255),
    document_number character varying(255),
    expiry_date date,
    account_number character varying(255),
    bank_name character varying(255),
    swift_code character varying(255),
    iban_code character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    user_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.companies OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_id_seq OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: complaints; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.complaints (
    id bigint NOT NULL,
    bookings_id bigint NOT NULL,
    complainant_id bigint NOT NULL,
    complaint_title character varying(255) NOT NULL,
    complaint_description text NOT NULL,
    status_id smallint DEFAULT '1'::smallint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.complaints OWNER TO postgres;

--
-- Name: COLUMN complaints.complainant_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.complaints.complainant_id IS 'user id from users';


--
-- Name: complaints_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.complaints_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.complaints_id_seq OWNER TO postgres;

--
-- Name: complaints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.complaints_id_seq OWNED BY public.complaints.id;


--
-- Name: complaints_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.complaints_status (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.complaints_status OWNER TO postgres;

--
-- Name: complaints_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.complaints_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.complaints_status_id_seq OWNER TO postgres;

--
-- Name: complaints_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.complaints_status_id_seq OWNED BY public.complaints_status.id;


--
-- Name: coupon_usages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupon_usages (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    user_id integer NOT NULL,
    coupon_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.coupon_usages OWNER TO postgres;

--
-- Name: coupon_usages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_usages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupon_usages_id_seq OWNER TO postgres;

--
-- Name: coupon_usages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_usages_id_seq OWNED BY public.coupon_usages.id;


--
-- Name: discount_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount_types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.discount_types OWNER TO postgres;

--
-- Name: discount_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.discount_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_types_id_seq OWNER TO postgres;

--
-- Name: discount_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.discount_types_id_seq OWNED BY public.discount_types.id;


--
-- Name: discounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discounts (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    vehicle_type_id integer NOT NULL,
    discount_type_id integer NOT NULL,
    description text,
    value numeric(10,2),
    start_date date NOT NULL,
    end_date date NOT NULL,
    "limit" integer NOT NULL,
    per_person integer NOT NULL,
    daily_limit integer NOT NULL,
    coupon_code character varying(255) NOT NULL,
    status smallint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.discounts OWNER TO postgres;

--
-- Name: COLUMN discounts.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.discounts.status IS '1-Active, 0-Inactive';


--
-- Name: discounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.discounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discounts_id_seq OWNER TO postgres;

--
-- Name: discounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.discounts_id_seq OWNED BY public.discounts.id;


--
-- Name: driver_alloted_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.driver_alloted_orders (
    id bigint NOT NULL,
    driver_id integer NOT NULL,
    order_id integer NOT NULL,
    order_status integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.driver_alloted_orders OWNER TO postgres;

--
-- Name: driver_alloted_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.driver_alloted_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.driver_alloted_orders_id_seq OWNER TO postgres;

--
-- Name: driver_alloted_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.driver_alloted_orders_id_seq OWNED BY public.driver_alloted_orders.id;


--
-- Name: driver_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.driver_details (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    vehicle_type_id integer DEFAULT 0 NOT NULL,
    vechicle_make_id integer DEFAULT 0 NOT NULL,
    vehicle_model_id integer DEFAULT 0 NOT NULL,
    vehicle_front_view text,
    vehicle_back_view text,
    driving_licence_front_view text,
    driving_licence_back_view text,
    driving_licence_number character varying(255),
    driving_licence_expiry_date date,
    rta_permit_front_view text,
    rta_permit_back_view text,
    rta_permit_number character varying(255),
    rta_permit_expiry_date date,
    emirates_id_front_view text,
    emirates_id_back_view text,
    emirates_id_number character varying(255),
    emirates_id_expiry_date date,
    ownership_certifcate_front_view text,
    ownership_certifcate_back_view text,
    ownership_certifcate_number character varying(255),
    ownership_certifcate_expiry_date date,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.driver_details OWNER TO postgres;

--
-- Name: driver_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.driver_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.driver_details_id_seq OWNER TO postgres;

--
-- Name: driver_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.driver_details_id_seq OWNED BY public.driver_details.id;


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
-- Name: location_suggestions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location_suggestions (
    id bigint NOT NULL,
    type integer NOT NULL,
    title character varying(255) NOT NULL,
    latitude character varying(255) NOT NULL,
    longitude character varying(255) NOT NULL,
    status integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.location_suggestions OWNER TO postgres;

--
-- Name: location_suggestions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.location_suggestions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_suggestions_id_seq OWNER TO postgres;

--
-- Name: location_suggestions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.location_suggestions_id_seq OWNED BY public.location_suggestions.id;


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
-- Name: model_has_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_permissions OWNER TO postgres;

--
-- Name: model_has_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_roles OWNER TO postgres;

--
-- Name: pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pages (
    id bigint NOT NULL,
    identifier character varying(255) NOT NULL,
    content text NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.pages OWNER TO postgres;

--
-- Name: COLUMN pages.identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pages.identifier IS 'about-us, terms-and-conditions, privacy-policy, contact-details, faqs';


--
-- Name: COLUMN pages.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pages.status IS '0 - Inactive, 1 - Active';


--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO postgres;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


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
-- Name: rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rates (
    id bigint NOT NULL,
    vehicle_type_id integer NOT NULL,
    period_name character varying(255),
    start_time time(0) without time zone,
    end_time time(0) without time zone,
    base_fare double precision DEFAULT '0'::double precision NOT NULL,
    waiting_charge_per_min double precision DEFAULT '0'::double precision NOT NULL,
    commission double precision DEFAULT '0'::double precision NOT NULL,
    rta_commission double precision DEFAULT '0'::double precision NOT NULL,
    hourly_payment double precision DEFAULT '0'::double precision NOT NULL,
    rate_per_km double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    status integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.rates OWNER TO postgres;

--
-- Name: rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rates_id_seq OWNER TO postgres;

--
-- Name: rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rates_id_seq OWNED BY public.rates.id;


--
-- Name: role_has_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_has_permissions OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
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
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    id bigint NOT NULL,
    caby_commission_percentaqge double precision DEFAULT '0'::double precision NOT NULL,
    driver_commission_percentaqge double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
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
-- Name: temp_bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_bookings (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    booking_code character varying(255) NOT NULL,
    pickup_latitude character varying(255) NOT NULL,
    pickup_longitude character varying(255) NOT NULL,
    dropoff_latitude character varying(255) NOT NULL,
    dropoff_longitude character varying(255) NOT NULL,
    pickup_location_name text NOT NULL,
    dropoff_location_name text NOT NULL,
    vehicle_type_id integer NOT NULL,
    payment_type integer DEFAULT 0 NOT NULL,
    base_fare double precision DEFAULT '0'::double precision NOT NULL,
    rta_commssion double precision DEFAULT '0'::double precision NOT NULL,
    rate_per_km double precision DEFAULT '0'::double precision NOT NULL,
    total_km_charge double precision DEFAULT '0'::double precision NOT NULL,
    total_charge double precision DEFAULT '0'::double precision NOT NULL,
    amount_to_pay double precision DEFAULT '0'::double precision NOT NULL,
    wallet_amount_used double precision DEFAULT '0'::double precision NOT NULL,
    rate_id integer DEFAULT 0 NOT NULL,
    distance_km double precision DEFAULT '0'::double precision NOT NULL,
    time_needed character varying(255),
    needed_date date,
    need_time time(0) without time zone,
    currency_code character varying(255),
    driver_instructions text,
    friend_name character varying(255),
    friend_phone_number character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    coupon_code character varying(255),
    coupon_id integer DEFAULT 0 NOT NULL,
    coupon_discount double precision DEFAULT '0'::double precision NOT NULL,
    is_scheduled integer DEFAULT 0 NOT NULL
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
-- Name: temp_tip_amounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_tip_amounts (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    driver_id integer NOT NULL,
    user_id integer NOT NULL,
    payment_type integer NOT NULL,
    tip_amount double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.temp_tip_amounts OWNER TO postgres;

--
-- Name: temp_tip_amounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_tip_amounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_tip_amounts_id_seq OWNER TO postgres;

--
-- Name: temp_tip_amounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_tip_amounts_id_seq OWNED BY public.temp_tip_amounts.id;


--
-- Name: temp_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_users (
    id bigint NOT NULL,
    name character varying(255),
    email character varying(255),
    password character varying(255),
    dial_code character varying(255),
    phone character varying(255),
    user_phone_otp character varying(255),
    user_device_token character varying(255),
    firebase_user_key character varying(255),
    user_image text,
    dob date,
    gender integer DEFAULT 3 NOT NULL,
    company_id integer DEFAULT 0 NOT NULL,
    vehicle_type_id integer DEFAULT 0 NOT NULL,
    vechicle_make_id integer DEFAULT 0 NOT NULL,
    vehicle_model_id integer DEFAULT 0 NOT NULL,
    vehicle_front_view text,
    vehicle_back_view text,
    driving_licence_front_view text,
    driving_licence_back_view text,
    driving_licence_number character varying(255),
    driving_licence_expiry_date date,
    rta_permit_front_view text,
    rta_permit_back_view text,
    rta_permit_number character varying(255),
    rta_permit_expiry_date date,
    emirates_id_front_view text,
    emirates_id_back_view text,
    emirates_id_number character varying(255),
    emirates_id_expiry_date date,
    ownership_certifcate_front_view text,
    ownership_certifcate_back_view text,
    ownership_certifcate_number character varying(255),
    ownership_certifcate_expiry_date date,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    first_name character varying(255),
    last_name character varying(255),
    role integer DEFAULT 3 NOT NULL,
    user_code character varying(255)
);


ALTER TABLE public.temp_users OWNER TO postgres;

--
-- Name: COLUMN temp_users.gender; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.temp_users.gender IS '1-male,2-female,3others';


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
-- Name: tip_amounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tip_amounts (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    driver_id integer NOT NULL,
    user_id integer NOT NULL,
    payment_type integer NOT NULL,
    tip_amount double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.tip_amounts OWNER TO postgres;

--
-- Name: tip_amounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tip_amounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tip_amounts_id_seq OWNER TO postgres;

--
-- Name: tip_amounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tip_amounts_id_seq OWNED BY public.tip_amounts.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    user_code character varying(255),
    name character varying(255),
    email character varying(255),
    email_verified_at timestamp(0) without time zone,
    password character varying(255),
    dial_code character varying(255),
    phone character varying(255),
    user_phone_otp character varying(255),
    user_device_token character varying(255),
    firebase_user_key character varying(255),
    access_token character varying(255),
    role integer DEFAULT 3 NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    user_image text,
    dob date,
    gender integer DEFAULT 3 NOT NULL,
    company_id integer DEFAULT 0 NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    first_name character varying(255),
    last_name character varying(255),
    latitude character varying(255),
    longitude character varying(255),
    hide_profile integer DEFAULT 0 NOT NULL,
    is_verified integer DEFAULT 0 NOT NULL,
    wallet_amount double precision DEFAULT '0'::double precision NOT NULL,
    avg_rating double precision DEFAULT '0'::double precision NOT NULL,
    rated_users integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: COLUMN users.gender; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.gender IS '1-male,2-female,3others';


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
-- Name: vehicle_makes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle_makes (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    image text,
    status integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.vehicle_makes OWNER TO postgres;

--
-- Name: vehicle_makes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicle_makes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicle_makes_id_seq OWNER TO postgres;

--
-- Name: vehicle_makes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicle_makes_id_seq OWNED BY public.vehicle_makes.id;


--
-- Name: vehicle_models; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle_models (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    vehicle_make_id integer NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.vehicle_models OWNER TO postgres;

--
-- Name: vehicle_models_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicle_models_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicle_models_id_seq OWNER TO postgres;

--
-- Name: vehicle_models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicle_models_id_seq OWNED BY public.vehicle_models.id;


--
-- Name: vehicle_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle_types (
    id bigint NOT NULL,
    "position" character varying(255),
    name character varying(255) NOT NULL,
    image text,
    map_icon text,
    status integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.vehicle_types OWNER TO postgres;

--
-- Name: vehicle_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicle_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicle_types_id_seq OWNER TO postgres;

--
-- Name: vehicle_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicle_types_id_seq OWNED BY public.vehicle_types.id;


--
-- Name: wallet_histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallet_histories (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    pay_type character varying(255) NOT NULL,
    amount double precision DEFAULT '0'::double precision NOT NULL,
    remark text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.wallet_histories OWNER TO postgres;

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
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: complaints id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaints ALTER COLUMN id SET DEFAULT nextval('public.complaints_id_seq'::regclass);


--
-- Name: complaints_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaints_status ALTER COLUMN id SET DEFAULT nextval('public.complaints_status_id_seq'::regclass);


--
-- Name: coupon_usages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_usages ALTER COLUMN id SET DEFAULT nextval('public.coupon_usages_id_seq'::regclass);


--
-- Name: discount_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_types ALTER COLUMN id SET DEFAULT nextval('public.discount_types_id_seq'::regclass);


--
-- Name: discounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts ALTER COLUMN id SET DEFAULT nextval('public.discounts_id_seq'::regclass);


--
-- Name: driver_alloted_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_alloted_orders ALTER COLUMN id SET DEFAULT nextval('public.driver_alloted_orders_id_seq'::regclass);


--
-- Name: driver_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_details ALTER COLUMN id SET DEFAULT nextval('public.driver_details_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: location_suggestions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_suggestions ALTER COLUMN id SET DEFAULT nextval('public.location_suggestions_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: rates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rates ALTER COLUMN id SET DEFAULT nextval('public.rates_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: temp_bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_bookings ALTER COLUMN id SET DEFAULT nextval('public.temp_bookings_id_seq'::regclass);


--
-- Name: temp_tip_amounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_tip_amounts ALTER COLUMN id SET DEFAULT nextval('public.temp_tip_amounts_id_seq'::regclass);


--
-- Name: temp_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users ALTER COLUMN id SET DEFAULT nextval('public.temp_users_id_seq'::regclass);


--
-- Name: tip_amounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tip_amounts ALTER COLUMN id SET DEFAULT nextval('public.tip_amounts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: vehicle_makes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_makes ALTER COLUMN id SET DEFAULT nextval('public.vehicle_makes_id_seq'::regclass);


--
-- Name: vehicle_models id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_models ALTER COLUMN id SET DEFAULT nextval('public.vehicle_models_id_seq'::regclass);


--
-- Name: vehicle_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_types ALTER COLUMN id SET DEFAULT nextval('public.vehicle_types_id_seq'::regclass);


--
-- Name: wallet_histories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_histories ALTER COLUMN id SET DEFAULT nextval('public.wallet_histories_id_seq'::regclass);


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" (id, latitude, longitude, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (id, user_id, booking_status, booking_code, pickup_latitude, pickup_longitude, dropoff_latitude, dropoff_longitude, pickup_location_name, dropoff_location_name, vehicle_type_id, payment_type, base_fare, rta_commssion, rate_per_km, total_km_charge, total_charge, amount_to_pay, wallet_amount_used, rate_id, distance_km, needed_date, need_time, time_needed, currency_code, driver_instructions, friend_name, friend_phone_number, driver_id, driver_commission, caby_commission, salik, surcharge, city_crossing_fee, created_at, updated_at, cancell_title, cancell_reason, is_rated, overall_rating, driver_rating, refer_friend_rating, coupon_code, coupon_id, coupon_discount, is_scheduled) FROM stdin;
1	8	10	CB1732096058	25.2048	55.2708	25.2567	55.3643	dubai	dubai airport	2	2	15	10	20	379.2	404.2	404.2	0	2	18.96	2024-11-20	15:20:00	27 mins	AED	airport cehcking time to fast	sooraj	+919847823799	0	0	0	0	0	0	2024-11-20 09:47:45	2024-11-20 10:09:29	it took long time to find a caby	i dont want	0	0	0	0	\N	0	0	0
2	15	0	CB1732097390	25.1850084	55.2535499	25.1974379	55.2743373	Office Dubai - United Arab Emirates	Cafe Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-20	15:20:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-20 10:09:51	2024-11-20 10:09:51	\N	\N	0	0	0	0	\N	0	0	0
3	15	0	CB1732097788	25.1850084	55.2535499	25.1974379	55.2743373	Home Dubai - United Arab Emirates	Office Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-20	15:20:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-20 10:16:29	2024-11-20 10:16:29	\N	\N	0	0	0	0	\N	0	0	0
4	15	0	CB1732101522	25.1850084	55.2535499	25.1974379	55.2743373	Home Dubai - United Arab Emirates	Office Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-22	16:18:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-20 11:18:43	2024-11-20 11:18:43	\N	\N	0	0	0	0	\N	0	0	0
5	15	0	CB1732101609	25.1850084	55.2535499	25.1974379	55.2743373	Home Dubai - United Arab Emirates	Gym Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-22	16:19:00	13 mins	AED	Asd	Hamid	\N	0	0	0	0	0	0	2024-11-20 11:20:09	2024-11-20 11:20:09	\N	\N	0	0	0	0	\N	0	0	0
6	15	0	CB1732102486	25.1850084	55.2535499	25.1974379	55.2743373	Office Dubai - United Arab Emirates	Home Dubai - United Arab Emirates	1	2	10	5	15	120.75	135.75	135.75	0	1	8.05	2024-11-22	16:33:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-20 11:34:47	2024-11-20 11:34:47	\N	\N	0	0	0	0	\N	0	0	0
7	15	10	CB1732103851	25.1850084	55.2535499	25.1974379	55.2743373	Cafe Dubai - United Arab Emirates	Cafe Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-20	16:57:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-20 11:57:31	2024-11-20 11:57:40	I want to change my booking details	\N	0	0	0	0	\N	0	0	0
8	15	0	CB1732177657	33.634669074391425	73.0578039586544	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	0	45.4	2	1.02	2024-11-21	13:27:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-21 08:27:38	2024-11-21 08:27:38	\N	\N	0	0	0	0	\N	0	0	0
9	15	10	CB1732517470	25.1850084	55.2535499	25.1974379	55.2743373	Cafe Dubai - United Arab Emirates	Cafe Dubai - United Arab Emirates	4	2	100000	3	10	80.5	100083.5	99942.9	140.6	3	8.05	2024-11-25	11:51:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 06:51:11	2024-11-25 07:07:33	\N	\N	0	0	0	0	\N	0	0	0
10	15	10	CB1732519366	33.6346727032931	73.0578026175499	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	12:22:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 07:22:47	2024-11-25 07:27:39	\N	\N	0	0	0	0	\N	0	0	0
11	15	0	CB1732519929	33.63467996109602	73.05779993534088	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	12:32:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 07:32:09	2024-11-25 07:34:51	\N	\N	0	0	0	0	\N	0	0	0
14	15	10	CB1732525768	33.63467409902449	73.05780798196793	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	14:09:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 09:09:28	2024-11-25 09:09:38	\N	\N	0	0	0	0	\N	0	0	0
12	15	10	CB1732520292	33.634659862563424	73.05780965834856	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	12:38:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 07:38:13	2024-11-25 07:39:04	\N	\N	0	0	0	0	\N	0	0	0
13	15	10	CB1732521015	33.634659862563424	73.05780965834856	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	12:50:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 07:50:16	2024-11-25 07:50:16	\N	\N	0	0	0	0	\N	0	0	0
15	15	10	CB1732527110	33.6346615374413	73.05781066417694	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	14:31:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 09:31:51	2024-11-25 09:32:42	\N	\N	0	0	0	0	\N	0	0	0
16	15	10	CB1732527295	33.6346615374413	73.05781066417694	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	14:34:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 09:34:55	2024-11-25 09:35:46	\N	\N	0	0	0	0	\N	0	0	0
17	15	10	CB1732527498	33.6346615374413	73.05781066417694	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	14:38:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 09:38:18	2024-11-25 09:39:09	\N	\N	0	0	0	0	\N	0	0	0
18	15	10	CB1732528194	33.6346615374413	73.05781066417694	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	14:49:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 09:49:54	2024-11-25 09:50:45	\N	\N	0	0	0	0	\N	0	0	0
19	15	10	CB1732529071	33.63466712036738	73.05780529975891	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	15:04:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 10:04:31	2024-11-25 10:05:22	\N	\N	0	0	0	0	\N	0	0	0
24	15	10	CB1732538637	33.634669074391425	73.0578089877963	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	17:43:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 12:43:57	2024-11-25 12:44:07	\N	\N	0	0	0	0		0	0	0
20	15	10	CB1732529481	33.63466097914867	73.05781099945307	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	15:11:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-25 10:11:21	2024-11-25 10:12:12	\N	\N	0	0	0	0	\N	0	0	0
21	15	10	CB1732534960	33.6346615374413	73.05781066417694	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	16:42:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 11:42:41	2024-11-25 11:42:51	\N	\N	0	0	0	0		0	0	0
22	15	1	CB1732535066	33.6346615374413	73.05781066417694	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	16:44:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-25 11:44:26	2024-11-25 11:44:50	\N	\N	0	0	0	0		0	0	0
23	15	10	CB1732535171	33.6346615374413	73.05781066417694	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	16:46:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 11:46:12	2024-11-25 11:46:22	\N	\N	0	0	0	0		0	0	0
25	15	1	CB1732539257	33.634661816587624	73.05780798196793	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	17:54:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-25 12:54:18	2024-11-25 12:54:49	\N	\N	0	0	0	0		0	0	0
26	15	1	CB1732541309	33.634661816587624	73.05780798196793	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	18:28:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-25 13:28:29	2024-11-25 13:28:53	\N	\N	0	0	0	0		0	0	0
27	15	1	CB1732543054	33.634661816587624	73.05780798196793	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	18:57:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-25 13:57:34	2024-11-25 13:58:05	\N	\N	0	0	0	0		0	0	0
28	15	1	CB1732545728	33.63467186585427	73.05780496448278	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	19:42:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-25 14:42:09	2024-11-25 14:43:00	\N	\N	0	0	0	0		0	0	0
30	15	4	CB1732548079	33.63467437817075	73.05780060589314	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	20:21:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-25 15:21:20	2024-11-25 15:22:03	\N	\N	0	0	0	0		0	0	0
29	15	4	CB1732545881	33.63467437817075	73.05780060589314	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	19:44:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-25 14:44:41	2024-11-25 18:12:34	\N	\N	0	0	0	0		0	0	0
38	15	10	CB1732883513	25.1850084	55.2535499	25.1974379	55.2743373	Gym Dubai - United Arab Emirates	Home Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-29	17:31:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-29 12:31:53	2024-11-29 12:32:04	\N	\N	0	0	0	0		0	0	0
31	15	4	CB1732554411	33.63466097914867	73.05781435221434	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	22:06:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-25 17:06:51	2024-11-25 17:07:54	\N	\N	0	0	0	0		0	0	0
32	8	10	CB1732594029	25.2048	55.2708	25.2567	55.3643	dubai	dubai airport	2	1	15	10	20	379.2	404.2	0	0	2	18.96	2024-11-26	15:20:00	27 mins	AED	airport cehcking time to fast	sooraj	+919847823799	0	0	0	0	0	0	2024-11-26 04:07:28	2024-11-26 04:07:38	\N	\N	0	0	0	0	FREERIDE	2	404.2	0
33	15	10	CB1732878677	25.1850084	55.2535499	25.1974379	55.2743373	Gym Dubai - United Arab Emirates	Gym Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-29	16:11:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-29 11:11:17	2024-11-29 11:11:27	\N	\N	0	0	0	0		0	0	0
34	15	10	CB1732878826	33.634678007072196	73.05780798196793	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	4	2	100000	3	10	10.7	100013.7	100013.7	0	3	1.07	2024-11-29	16:13:00	5 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-29 11:13:47	2024-11-29 11:13:57	\N	\N	0	0	0	0		0	0	0
35	15	10	CB1732881785	25.1850084	55.2535499	25.1974379	55.2743373	Office Dubai - United Arab Emirates	Gym Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-29	17:03:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-29 12:03:05	2024-11-29 12:03:16	\N	\N	0	0	0	0		0	0	0
36	15	10	CB1732882725	33.634676611340886	73.05780496448278	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	21.4	46.4	46.4	0	2	1.07	2024-11-29	17:18:00	5 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-29 12:18:46	2024-11-29 12:19:50	I booked by mistake	\N	0	0	0	0		0	0	0
37	15	10	CB1732882978	25.1850084	55.2535499	25.1974379	55.2743373	Gym Dubai - United Arab Emirates	Gym Dubai - United Arab Emirates	2	2	15	10	20	161	186	139.6	46.4	2	8.05	2024-11-29	17:22:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-29 12:22:58	2024-11-29 12:23:09	\N	\N	0	0	0	0		0	0	0
39	15	1	CB1732884153	33.634664049758086	73.05781569331884	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	21.4	46.4	46.4	0	2	1.07	2024-11-29	17:42:00	5 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-29 12:42:34	2024-11-29 12:44:13	\N	\N	0	0	0	0		0	0	0
40	15	10	CB1732901944	25.1850084	55.2535499	25.1974379	55.2743373	Office Dubai - United Arab Emirates	Home Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-29	22:39:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-29 17:39:05	2024-11-29 17:39:15	\N	\N	0	0	0	0		0	0	0
41	15	10	CB1732902526	33.6346727032931	73.0578026175499	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	4	2	100000	3	10	10.7	100013.7	100013.7	0	3	1.07	2024-11-29	22:48:00	5 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-29 17:48:47	2024-11-29 17:48:57	\N	\N	0	0	0	0		0	0	0
42	15	1	CB1732902809	33.63467409902449	73.05780429393053	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	21.4	46.4	46.4	0	2	1.07	2024-11-29	22:53:00	5 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-29 17:53:29	2024-11-29 17:53:47	\N	\N	0	0	0	0		0	0	0
43	15	10	CB1732903874	25.1850084	55.2535499	25.1974379	55.2743373	Cafe Dubai - United Arab Emirates	Home Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-29	23:11:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-29 18:11:15	2024-11-29 18:11:25	\N	\N	0	0	0	0		0	0	0
44	15	10	CB1732947794	33.6354830611228	73.05731445550919	33.64079723396806	73.05805407464504	J3P4+7V5, Satellite Town, Rawalpindi, Punjab, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	19.6	44.6	44.6	0	2	0.98	2024-11-30	11:23:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 06:23:14	2024-11-30 06:24:37	I booked by mistake	\N	0	0	0	0		0	0	0
45	15	4	CB1732947937	33.6354830611228	73.05731445550919	33.64079723396806	73.05805407464504	J3P4+7V5, Satellite Town, Rawalpindi, Punjab, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	19.6	44.6	0	44.6	2	0.98	2024-11-30	11:25:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-30 06:25:37	2024-11-30 06:29:32	\N	\N	0	0	0	0		0	0	0
77	15	10	CB1733162596	25.19062790693043	55.28373812701417	25.1974379	55.2743373	Malls Dubai Mall	Malls Test	2	2	15	10	20	77.2	102.2	0	102.2	2	3.86	2024-12-02	23:03:00	11 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 18:03:16	2024-12-02 18:04:37	I booked by mistake	\N	0	0	0	0		0	0	0
46	15	2	CB1732950324	33.6346699118303	73.05780563503504	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	21.4	46.4	46.4	0	2	1.07	2024-11-30	12:05:00	5 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-30 07:05:25	2024-11-30 07:16:00	\N	\N	0	0	0	0		0	0	0
47	32	10	CB1732951911	25.286959374057723	55.37141393870115	25.325853631378898	55.418544709682465	11 8A St - Al Nahda - Al Nahda 2 - Dubai - United Arab Emirates,	8CG9+F5Q - Sheikh Khalifa Bin Zayed Al Nahyan Rd - Industrial Area 5 - Industrial Area - Sharjah - United Arab Emirates,	2	2	15	10	20	197.2	222.2	222.2	0	2	9.86	2024-11-30	11:31:00	17 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 07:31:52	2024-11-30 07:32:02	\N	\N	0	0	0	0		0	0	0
48	15	10	CB1732952324	25.1850084	55.2535499	25.1974379	55.2743373	Office Dubai - United Arab Emirates	Office Dubai - United Arab Emirates	4	2	100000	3	10	80.5	100083.5	100083.5	0	3	8.05	2024-11-30	12:38:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 07:38:45	2024-11-30 07:38:55	\N	\N	0	0	0	0		0	0	0
49	15	1	CB1732960406	33.634667399513674	73.05780697613955	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	21.4	46.4	46.4	0	2	1.07	2024-11-30	14:53:00	5 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-30 09:53:27	2024-11-30 09:53:47	\N	\N	0	0	0	0		0	0	0
50	15	4	CB1732960785	33.63466879524513	73.05780697613955	33.638027138774426	73.06838996708393	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	Commercial Market Rd, Block B Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	27	52	52	0	2	1.35	2024-11-30	14:59:00	5 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-30 09:59:46	2024-11-30 10:03:30	\N	\N	0	0	0	0		0	0	0
51	15	1	CB1732961066	33.63466879524513	73.05780697613955	33.638027138774426	73.06838996708393	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	Commercial Market Rd, Block B Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	27	52	52	0	2	1.35	2024-11-30	15:04:00	5 mins	AED	Asd	Hamid	\N	13	0	0	0	0	0	2024-11-30 10:04:27	2024-11-30 10:08:51	\N	\N	0	0	0	0		0	0	0
53	36	10	CB1732963522	33.64079723396806	73.05805407464504	33.63514362177493	73.05731445550919	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3P4+7V5, Satellite Town, Rawalpindi, Punjab, Pakistan,	1	2	10	5	15	15.15	30.15	30.15	0	1	1.01	2024-11-30	15:45:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 10:45:23	2024-11-30 10:45:33	\N	\N	0	0	0	0		0	0	0
55	36	1	CB1732964295	33.63553498182613	73.05768325924873	33.64079723396806	73.05805407464504	J3P4+7V5, Satellite Town, Rawalpindi, Punjab, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	18.6	43.6	43.6	0	2	0.93	2024-12-02	15:46:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-30 10:58:15	2024-11-30 11:00:39	\N	\N	0	0	0	0		0	0	1
54	36	4	CB1732963638	33.63553498182613	73.05768325924873	33.64079723396806	73.05805407464504	J3P4+7V5, Satellite Town, Rawalpindi, Punjab, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	18.6	43.6	43.6	0	2	0.93	2024-11-30	15:47:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-30 10:47:18	2024-11-30 10:53:39	\N	\N	0	0	0	0		0	0	0
56	36	10	CB1732965357	25.1850084	55.2535499	25.1974379	55.2743373	Cafe Dubai - United Arab Emirates	Home Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-30	16:15:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 11:15:58	2024-11-30 11:16:08	\N	\N	0	0	0	0		0	0	0
57	36	10	CB1732968054	25.385901327314215	55.459055453538895	25.348810416744495	55.42182303965092	105 Sheikh Jaber Al-Sabah St - Al Nuaimia 1 - Ajman - United Arab Emirates,	8CXC+CQ8 - Sheikh Rashid Bin Saqr Al Qasimi St - Dasman - Halwan - Sharjah - United Arab Emirates,	2	2	15	10	20	181.4	206.4	206.4	0	2	9.07	2024-11-30	16:00:00	11 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 12:00:55	2024-11-30 12:01:05	\N	\N	0	0	0	0		0	0	0
58	36	10	CB1732968118	25.37627319908674	55.45930255204439	25.266196982993428	55.4162011295557	9FG5+CP5 - Sheikh Zayed Street - Ajman Industrial 2 - Ajman - United Arab Emirates,	7C88+GF7 - Muhaisnah - Muhaisanah 2 - Dubai - United Arab Emirates,	2	2	15	10	20	429	454	454	0	2	21.45	2024-11-30	16:01:00	27 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 12:01:58	2024-11-30 12:02:09	\N	\N	0	0	0	0		0	0	0
59	36	10	CB1732968699	25.1850084	55.2535499	25.1974379	55.2743373	Home Dubai - United Arab Emirates	Cafe Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-30	16:11:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 12:11:40	2024-11-30 12:11:50	\N	\N	0	0	0	0		0	0	0
60	36	10	CB1732968755	25.1850084	55.2535499	25.1974379	55.2743373	Gym Dubai - United Arab Emirates	Cafe Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-30	16:12:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 12:12:37	2024-11-30 12:12:47	\N	\N	0	0	0	0		0	0	0
52	15	10	CB1732961965	33.63553498182613	73.05768325924873	25.1974379	55.2743373	J3P4+7V5, Satellite Town, Rawalpindi, Punjab, Pakistan,	Cafe Dubai - United Arab Emirates	2	2	15	10	20	95627.4	95652.4	95652.4	0	2	4781.37	2024-11-30	15:19:00	2 days 10 hours	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-30 10:19:25	2024-12-02 14:47:29	I booked by mistake	\N	0	0	0	0		0	0	0
61	36	10	CB1732972258	25.181566652053196	55.271510034799576	25.197437749735975	55.2743374183774	57JC+JJC - Business Bay - Dubai - United Arab Emirates,	1 Sheikh Zayed Rd - Trade Centre - Trade Centre 1 - Dubai - United Arab Emirates,	2	2	15	10	20	84.2	109.2	109.2	0	2	4.21	2024-11-30	17:10:00	11 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 13:10:58	2024-11-30 13:11:09	\N	\N	0	0	0	0		0	0	0
62	36	10	CB1732972599	25.376234424515854	55.45929819345474	25.388707682994298	55.46567916870117	9FG5+CP5 - Sheikh Zayed Street - Ajman Industrial 2 - Ajman - United Arab Emirates,	9FG5+CP5 - Sheikh Zayed Street - Ajman Industrial 2 - Ajman - United Arab Emirates,	2	2	15	10	20	42	67	67	0	2	2.1	2024-11-30	17:16:00	6 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 13:16:40	2024-11-30 13:16:50	\N	\N	0	0	0	0		0	0	0
69	37	10	CB1733119218	33.634676611340886	73.05780228227377	33.6329712899292	73.06160531938076	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	32 Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab 46300, Pakistan,	1	2	10	5	15	9.75	24.75	24.75	0	1	0.65	2024-12-02	11:00:00	3 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 06:00:18	2024-12-02 06:00:28	\N	\N	0	0	0	0		0	0	0
74	15	10	CB1733150744	33.63840313334286	73.05573832243681	33.63469363926134	73.05780965834856	J3Q4+692, New Phagwari Rd, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	2	2	15	10	20	14.8	39.8	39.8	0	2	0.74	2024-12-02	19:45:00	3 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 14:45:45	2024-12-02 14:47:06	I booked by mistake	\N	0	0	0	0		0	0	0
63	36	4	CB1732972734	25.1850084	55.2535499	25.1974379	55.2743373	Office Dubai - United Arab Emirates	Office Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-30	17:18:00	13 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-30 13:18:54	2024-11-30 13:21:30	\N	\N	0	0	0	0		0	0	0
64	36	10	CB1733118143	25.1850084	55.2535499	25.1974379	55.2743373	Cafe Dubai - United Arab Emirates	Gym Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-12-02	09:42:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 05:42:24	2024-12-02 05:46:46	It took too long to find a Cabby	\N	0	0	0	0		0	0	0
65	36	10	CB1733118424	25.1850084	55.2535499	25.1974379	55.2743373	Gym Dubai - United Arab Emirates	Home Dubai - United Arab Emirates	2	2	15	10	20	161	186	0	186	2	8.05	2024-12-02	09:47:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 05:47:05	2024-12-02 05:54:00	It took too long to find a Cabby	\N	0	0	0	0		0	0	0
66	36	10	CB1733118903	25.1850084	55.2535499	25.1974379	55.2743373	Office Dubai - United Arab Emirates	Gym Dubai - United Arab Emirates	4	2	100000	3	10	80.5	100083.5	99897.5	186	3	8.05	2024-12-02	09:55:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 05:55:04	2024-12-02 05:55:26	I don’t need a ride anymore	\N	0	0	0	0		0	0	0
67	36	0	CB1733118955	25.1850084	55.2535499	25.1974379	55.2743373	Home Dubai - United Arab Emirates	Cafe Dubai - United Arab Emirates	2	2	15	10	20	161	186	0	186	2	8.05	2024-12-02	09:55:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 05:55:55	2024-12-02 05:55:55	\N	\N	0	0	0	0		0	0	0
68	36	0	CB1733118987	25.1850084	55.2535499	25.1974379	55.2743373	Office Dubai - United Arab Emirates	Cafe Dubai - United Arab Emirates	2	2	15	10	20	161	186	0	186	2	8.05	2024-12-02	09:56:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 05:56:28	2024-12-02 05:56:28	\N	\N	0	0	0	0		0	0	0
71	36	10	CB1733120870	25.38585316586487	55.459599271416664	25.378262802548825	55.47303479164839	9FP5+8Q9 Footover Bridge - Al Nuaimia 1 - Ajman - United Arab Emirates,	9FHF+954 - Hassan Bin Haitham St - Ajman Industrial 2 - Ajman - United Arab Emirates,	2	2	15	10	20	58	83	0	83	2	2.9	2024-12-02	10:27:00	7 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 06:27:50	2024-12-02 06:32:06	I want to change my booking details	\N	0	0	0	0		0	0	0
72	36	4	CB1733121151	25.376261990813617	55.45930255204439	25.36187001325	55.45109063386917	9FG5+CP5 - Sheikh Zayed Street - Ajman Industrial 2 - Ajman - United Arab Emirates,	13 35 St - Al Ramtha - Wasit Suburb - Sharjah - United Arab Emirates,	2	2	15	10	20	166.6	191.6	0	191.6	2	8.33	2024-12-02	10:32:00	11 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-12-02 06:32:32	2024-12-02 06:37:56	\N	\N	0	0	0	0		0	0	0
70	37	4	CB1733119276	33.63467884451097	73.05779121816158	33.63388159911073	73.05971100926399	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	5.2	30.2	30.2	0	2	0.26	2024-12-02	11:01:00	1 min	AED	\N	\N	\N	13	0	0	0	0	0	2024-12-02 06:01:16	2024-12-02 06:34:34	\N	\N	0	0	0	0		0	0	0
73	15	10	CB1733150601	33.634660141709716	73.05781401693821	33.63288307791791	73.0602440983057	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3M6+538, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	9	34	34	0	2	0.45	2024-12-02	19:43:00	2 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 14:43:21	2024-12-02 14:47:16	I booked by mistake	\N	0	0	0	0		0	0	0
75	15	1	CB1733154839	33.63467968194975	73.05781569331884	33.63293890831528	73.0600456148386	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3M6+538, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	8.8	33.8	0	33.8	2	0.44	2024-12-02	20:53:00	2 mins	AED	\N	\N	\N	39	0	0	0	0	0	2024-12-02 15:53:59	2024-12-02 15:54:55	\N	\N	0	0	0	0		0	0	0
76	15	10	CB1733159748	25.1945448	55.3641298	25.1974379	55.2743373	Business Centers Office2	Business Centers Office2	1	2	10	5	15	172.5	187.5	0	187.5	1	11.5	2024-12-02	22:15:00	16 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 17:15:48	2024-12-02 17:15:58	\N	\N	0	0	0	0		0	0	0
78	15	1	CB1733163672	33.63466879524513	73.05781066417694	33.633857592307045	73.05961310863495	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3M5+GPG, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	5.2	30.2	0	30.2	2	0.26	2024-12-02	23:21:00	1 min	AED	\N	\N	\N	39	0	0	0	0	0	2024-12-02 18:21:13	2024-12-02 18:21:28	\N	\N	0	0	0	0		0	0	0
79	36	10	CB1733215247	25.37620867577051	55.459246560931206	25.1974379	55.2743373	9FG5+CP5 - Sheikh Zayed Street - Ajman Industrial 2 - Ajman - United Arab Emirates,	Business Centers Office2	2	2	15	10	20	703.8	728.8	0	728.8	2	35.19	2024-12-03	12:40:00	35 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-03 08:40:48	2024-12-03 08:43:43	I want to change my booking details	\N	0	0	0	0		0	0	0
87	31	0	CB1733248328	25.19062790693043	55.28373812701417	25.118107	55.200608	Dubai Mall	Mall of the Emirates	2	2	15	10	20	340.4	365.4	365.4	0	2	17.02	2024-12-07	22:51:00	20 mins	AED	\N	Sheraz Team	+923455591870	0	0	0	0	0	0	2024-12-03 17:52:08	2024-12-03 17:52:08	\N	\N	0	0	0	0		0	0	1
88	31	0	CB1733257202	25.19062790693043	55.28373812701417	25.277025957740072	55.28672218322754	Dubai Mall	Marina	2	2	15	10	20	352.2	377.2	377.2	0	2	17.61	2024-12-05	13:19:00	24 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-03 20:20:02	2024-12-03 20:20:02	\N	\N	0	0	0	0		0	0	1
80	36	4	CB1733215475	25.376243815233394	55.459249913692474	25.387025694809896	55.46674903482199	9FG5+CP5 - Sheikh Zayed Street - Ajman Industrial 2 - Ajman - United Arab Emirates,	9FP8+WMC - Al Nuaimia 1 - Ajman - United Arab Emirates,	2	2	15	10	20	37.6	62.6	0	62.6	2	1.88	2024-12-03	12:44:00	5 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-12-03 08:44:35	2024-12-03 08:46:32	\N	\N	0	0	0	0		0	0	0
81	31	0	CB1733239880	25.2048	55.2708	25.2567	55.3643	dubai	dubai airport	2	1	15	10	20	379.2	404.2	404.2	0	2	18.96	2024-12-03	15:20:00	28 mins	AED	airport cehcking time to fast	sooraj	+919847823799	0	0	0	0	0	0	2024-12-03 15:36:22	2024-12-03 15:36:22	\N	\N	0	0	0	0	FREERIDE	0	0	1
82	31	0	CB1733240873	25.19062790693043	55.28373812701417	25.118107	55.200608	Dubai Mall	Mall of the Emirates	2	2	15	10	20	340.4	365.4	365.4	0	2	17.02	2024-12-03	15:20:00	20 mins	AED	\N	Faizan	03315026163	0	0	0	0	0	0	2024-12-03 15:47:54	2024-12-03 15:47:54	\N	\N	0	0	0	0		0	0	0
83	31	0	CB1733242533	25.19062790693043	55.28373812701417	25.118107	55.200608	Dubai Mall	Mall of the Emirates	2	2	15	10	20	340.4	365.4	365.4	0	2	17.02	2024-12-03	21:15:00	20 mins	AED	\N	Sheraz Team	+923455591870	0	0	0	0	0	0	2024-12-03 16:15:33	2024-12-03 16:15:33	\N	\N	0	0	0	0		0	0	0
84	15	0	CB1733245088	25.19062790693043	55.28373812701417	25.1974379	55.2743373	Malls Dubai Mall	Malls Test	2	2	15	10	20	77.2	102.2	0	102.2	2	3.86	2024-12-03	21:58:00	11 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-03 16:58:09	2024-12-03 16:58:09	\N	\N	0	0	0	0		0	0	0
85	15	1	CB1733246167	33.64205943440809	73.06337255984545	33.64079723396806	73.05805407464504	J3R7+XJ2, Saidpur Rd, D Block Block D Satellite Town, Rawalpindi, Punjab, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	23	48	0	48	2	1.15	2024-12-03	22:16:00	4 mins	AED	\N	\N	\N	39	0	0	0	0	0	2024-12-03 17:16:07	2024-12-03 17:16:23	\N	\N	0	0	0	0		0	0	0
86	31	0	CB1733248249	25.19062790693043	55.28373812701417	25.118107	55.200608	Dubai Mall	Mall of the Emirates	2	2	15	10	20	340.4	365.4	365.4	0	2	17.02	2024-12-07	22:50:00	20 mins	AED	\N	Sheraz Team	+923455591870	0	0	0	0	0	0	2024-12-03 17:50:49	2024-12-03 17:50:49	\N	\N	0	0	0	0		0	0	1
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
spatie.permission.cache	a:3:{s:5:"alias";a:4:{s:1:"a";s:2:"id";s:1:"b";s:4:"name";s:1:"c";s:10:"guard_name";s:1:"r";s:5:"roles";}s:11:"permissions";a:99:{i:0;a:4:{s:1:"a";i:1;s:1:"b";s:9:"dashboard";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:1;a:4:{s:1:"a";i:2;s:1:"b";s:7:"livemap";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:2;a:4:{s:1:"a";i:3;s:1:"b";s:5:"rides";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:3;a:4:{s:1:"a";i:4;s:1:"b";s:9:"rides-all";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:4;a:4:{s:1:"a";i:5;s:1:"b";s:12:"rides-active";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:5;a:4:{s:1:"a";i:6;s:1:"b";s:15:"rides-completed";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:6;a:4:{s:1:"a";i:7;s:1:"b";s:14:"rides-canceled";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:7;a:4:{s:1:"a";i:8;s:1:"b";s:13:"rides-ongoing";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:8;a:4:{s:1:"a";i:9;s:1:"b";s:9:"customers";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:9;a:4:{s:1:"a";i:10;s:1:"b";s:16:"customers-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:10;a:4:{s:1:"a";i:11;s:1:"b";s:14:"customers-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:11;a:4:{s:1:"a";i:12;s:1:"b";s:14:"customers-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:12;a:4:{s:1:"a";i:13;s:1:"b";s:16:"customers-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:13;a:4:{s:1:"a";i:14;s:1:"b";s:7:"drivers";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:14;a:4:{s:1:"a";i:15;s:1:"b";s:14:"drivers-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:15;a:4:{s:1:"a";i:16;s:1:"b";s:12:"drivers-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:16;a:4:{s:1:"a";i:17;s:1:"b";s:12:"drivers-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:17;a:4:{s:1:"a";i:18;s:1:"b";s:14:"drivers-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:18;a:4:{s:1:"a";i:19;s:1:"b";s:9:"companies";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:19;a:4:{s:1:"a";i:20;s:1:"b";s:16:"companies-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:20;a:4:{s:1:"a";i:21;s:1:"b";s:14:"companies-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:21;a:4:{s:1:"a";i:22;s:1:"b";s:14:"companies-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:22;a:4:{s:1:"a";i:23;s:1:"b";s:16:"companies-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:23;a:4:{s:1:"a";i:24;s:1:"b";s:13:"vehicle-types";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:24;a:4:{s:1:"a";i:25;s:1:"b";s:20:"vehicle-types-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:25;a:4:{s:1:"a";i:26;s:1:"b";s:18:"vehicle-types-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:26;a:4:{s:1:"a";i:27;s:1:"b";s:18:"vehicle-types-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:27;a:4:{s:1:"a";i:28;s:1:"b";s:20:"vehicle-types-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:28;a:4:{s:1:"a";i:29;s:1:"b";s:13:"vehicle-makes";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:29;a:4:{s:1:"a";i:30;s:1:"b";s:20:"vehicle-makes-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:30;a:4:{s:1:"a";i:31;s:1:"b";s:18:"vehicle-makes-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:31;a:4:{s:1:"a";i:32;s:1:"b";s:18:"vehicle-makes-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:32;a:4:{s:1:"a";i:33;s:1:"b";s:20:"vehicle-makes-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:33;a:4:{s:1:"a";i:34;s:1:"b";s:14:"vehicle-models";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:34;a:4:{s:1:"a";i:35;s:1:"b";s:21:"vehicle-models-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:35;a:4:{s:1:"a";i:36;s:1:"b";s:19:"vehicle-models-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:36;a:4:{s:1:"a";i:37;s:1:"b";s:19:"vehicle-models-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:37;a:4:{s:1:"a";i:38;s:1:"b";s:21:"vehicle-models-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:38;a:4:{s:1:"a";i:39;s:1:"b";s:5:"rates";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:39;a:4:{s:1:"a";i:40;s:1:"b";s:12:"rates-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:40;a:4:{s:1:"a";i:41;s:1:"b";s:10:"rates-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:41;a:4:{s:1:"a";i:42;s:1:"b";s:10:"rates-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:42;a:4:{s:1:"a";i:43;s:1:"b";s:12:"rates-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:43;a:4:{s:1:"a";i:44;s:1:"b";s:20:"location-suggestions";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:44;a:4:{s:1:"a";i:45;s:1:"b";s:27:"location-suggestions-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:45;a:4:{s:1:"a";i:46;s:1:"b";s:25:"location-suggestions-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:46;a:4:{s:1:"a";i:47;s:1:"b";s:25:"location-suggestions-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:47;a:4:{s:1:"a";i:48;s:1:"b";s:27:"location-suggestions-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:48;a:4:{s:1:"a";i:49;s:1:"b";s:9:"feedbacks";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:49;a:4:{s:1:"a";i:50;s:1:"b";s:18:"feedbacks-customer";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:50;a:4:{s:1:"a";i:51;s:1:"b";s:16:"feedbacks-driver";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:51;a:4:{s:1:"a";i:52;s:1:"b";s:15:"feedbacks-cabby";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:52;a:4:{s:1:"a";i:53;s:1:"b";s:8:"livechat";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:53;a:4:{s:1:"a";i:54;s:1:"b";s:9:"discounts";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:54;a:4:{s:1:"a";i:55;s:1:"b";s:16:"discounts-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:55;a:4:{s:1:"a";i:56;s:1:"b";s:14:"discounts-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:56;a:4:{s:1:"a";i:57;s:1:"b";s:14:"discounts-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:57;a:4:{s:1:"a";i:58;s:1:"b";s:16:"discounts-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:58;a:4:{s:1:"a";i:59;s:1:"b";s:5:"tasks";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:59;a:4:{s:1:"a";i:60;s:1:"b";s:12:"tasks-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:60;a:4:{s:1:"a";i:61;s:1:"b";s:10:"tasks-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:61;a:4:{s:1:"a";i:62;s:1:"b";s:10:"tasks-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:62;a:4:{s:1:"a";i:63;s:1:"b";s:12:"tasks-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:63;a:4:{s:1:"a";i:64;s:1:"b";s:10:"complaints";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:64;a:4:{s:1:"a";i:65;s:1:"b";s:24:"complaints-from-customer";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:65;a:4:{s:1:"a";i:66;s:1:"b";s:22:"complaints-from-driver";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:66;a:4:{s:1:"a";i:67;s:1:"b";s:8:"accounts";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:67;a:4:{s:1:"a";i:68;s:1:"b";s:15:"accounts-driver";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:68;a:4:{s:1:"a";i:69;s:1:"b";s:17:"accounts-customer";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:69;a:4:{s:1:"a";i:70;s:1:"b";s:15:"payment-history";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:70;a:4:{s:1:"a";i:71;s:1:"b";s:7:"reports";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:71;a:4:{s:1:"a";i:72;s:1:"b";s:14:"reports-driver";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:72;a:4:{s:1:"a";i:73;s:1:"b";s:16:"reports-customer";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:73;a:4:{s:1:"a";i:74;s:1:"b";s:13:"reports-rides";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:74;a:4:{s:1:"a";i:75;s:1:"b";s:17:"reports-companies";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:75;a:4:{s:1:"a";i:76;s:1:"b";s:27:"reports-driver-excel-export";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:76;a:4:{s:1:"a";i:77;s:1:"b";s:29:"reports-customer-excel-export";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:77;a:4:{s:1:"a";i:78;s:1:"b";s:26:"reports-rides-excel-export";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:78;a:4:{s:1:"a";i:79;s:1:"b";s:30:"reports-companies-excel-export";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:79;a:4:{s:1:"a";i:80;s:1:"b";s:11:"cabby-pages";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:80;a:4:{s:1:"a";i:81;s:1:"b";s:20:"cabby-pages-about-us";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:81;a:4:{s:1:"a";i:82;s:1:"b";s:32:"cabby-pages-terms-and-conditions";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:82;a:4:{s:1:"a";i:83;s:1:"b";s:26:"cabby-pages-privacy-policy";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:83;a:4:{s:1:"a";i:84;s:1:"b";s:27:"cabby-pages-contact-details";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:84;a:4:{s:1:"a";i:85;s:1:"b";s:16:"cabby-pages-faqs";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:85;a:4:{s:1:"a";i:86;s:1:"b";s:32:"cabby-pages-emergency-assistance";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:86;a:4:{s:1:"a";i:87;s:1:"b";s:32:"cabby-pages-report-safety-issues";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:87;a:4:{s:1:"a";i:88;s:1:"b";s:25:"cabby-pages-share-my-trip";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:88;a:4:{s:1:"a";i:89;s:1:"b";s:25:"cabby-pages-safety-center";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:89;a:4:{s:1:"a";i:90;s:1:"b";s:5:"roles";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:90;a:4:{s:1:"a";i:91;s:1:"b";s:12:"roles-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:91;a:4:{s:1:"a";i:92;s:1:"b";s:10:"roles-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:92;a:4:{s:1:"a";i:93;s:1:"b";s:10:"roles-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:93;a:4:{s:1:"a";i:94;s:1:"b";s:12:"roles-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:94;a:4:{s:1:"a";i:95;s:1:"b";s:5:"users";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:95;a:4:{s:1:"a";i:96;s:1:"b";s:12:"users-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:96;a:4:{s:1:"a";i:97;s:1:"b";s:10:"users-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:97;a:4:{s:1:"a";i:98;s:1:"b";s:10:"users-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:98;a:4:{s:1:"a";i:99;s:1:"b";s:12:"users-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}}s:5:"roles";a:1:{i:0;a:3:{s:1:"a";i:1;s:1:"b";s:13:"Administrator";s:1:"c";s:3:"web";}}}	1733300321
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (id, company_name, contact_person, document_frond_view, document_back_view, document_number, expiry_date, account_number, bank_name, swift_code, iban_code, created_at, updated_at, deleted_at, user_id) FROM stdin;
2	Al Falasi Luxury Transport	anil	1732264108674040ac3c2c1.jpg	1732264108674040ac3c45a.jpeg	547773373	2024-12-26	45747474	dfhdfh	ryuru8568	fhdfh56858	2024-11-22 08:28:28	2024-12-02 16:18:18	\N	18
1	Al Ghazal Transport Co	sooraj			2352525	2024-12-12	34334636436	bnk	swift	iban	2024-11-13 10:52:02	2024-12-02 16:20:06	\N	7
\.


--
-- Data for Name: complaints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.complaints (id, bookings_id, complainant_id, complaint_title, complaint_description, status_id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: complaints_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.complaints_status (id, name, code, created_at, updated_at) FROM stdin;
1	Pending	pending	2024-11-21 12:10:02	2024-11-21 12:10:02
2	In Progress	progress	2024-11-21 12:10:02	2024-11-21 12:10:02
3	Resolved	resolved	2024-11-21 12:10:02	2024-11-21 12:10:02
\.


--
-- Data for Name: coupon_usages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_usages (id, booking_id, user_id, coupon_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: discount_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discount_types (id, name, code, created_at, updated_at) FROM stdin;
1	Free Ride	free_ride	2024-11-21 12:23:15	2024-11-21 12:23:15
2	% Discount	percent_discount	2024-11-21 12:23:15	2024-11-21 12:23:15
3	Amount Discount	amount_discount	2024-11-21 12:23:15	2024-11-21 12:23:15
\.


--
-- Data for Name: discounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discounts (id, title, vehicle_type_id, discount_type_id, description, value, start_date, end_date, "limit", per_person, daily_limit, coupon_code, status, created_at, updated_at, deleted_at) FROM stdin;
1	Save100	4	1	Users can now access Rider at no cost for non-commercial activities on first ride	100.00	2024-11-22	2024-12-21	5000	100	2000	SAVE100	1	2024-11-21 13:07:00	2024-11-26 14:56:46	2024-11-26 14:56:46
2	50 off RIDE	2	2	free ride free ride coupen	50.00	2024-11-20	2024-12-05	10	2	5	50off	1	2024-11-25 07:08:10	2024-11-29 13:06:09	\N
3	Save1000	4	2	Save 1000 AED by a purchase of 15000 AED	85.00	2024-11-27	2024-11-30	1000	500	10	SAVE1000	1	2024-11-26 14:56:31	2024-11-29 13:07:05	\N
\.


--
-- Data for Name: driver_alloted_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.driver_alloted_orders (id, driver_id, order_id, order_status, created_at, updated_at) FROM stdin;
87	13	52	1	2024-11-30 10:19:36	2024-11-30 14:20:21
88	13	52	1	2024-11-30 10:20:16	2024-11-30 14:20:21
41	13	22	1	2024-11-25 11:44:37	2024-11-25 11:44:50
42	13	25	1	2024-11-25 12:54:28	2024-11-25 12:54:49
43	13	26	1	2024-11-25 13:28:39	2024-11-25 13:28:53
44	13	27	1	2024-11-25 13:57:44	2024-11-25 13:58:05
90	29	54	0	2024-11-30 10:48:09	2024-11-30 10:48:09
45	13	28	1	2024-11-25 14:42:19	2024-11-25 14:43:00
46	13	28	1	2024-11-25 14:42:59	2024-11-25 14:43:00
47	13	29	1	2024-11-25 14:44:52	2024-11-25 14:45:15
48	13	30	1	2024-11-25 15:21:30	2024-11-25 15:21:41
49	13	31	1	2024-11-25 17:07:01	2024-11-25 17:07:13
50	29	36	3	2024-11-29 12:18:56	2024-11-29 12:19:37
51	29	36	0	2024-11-29 12:19:37	2024-11-29 12:19:37
89	13	54	1	2024-11-30 10:47:29	2024-11-30 14:48:28
52	13	39	1	2024-11-29 12:42:44	2024-11-29 16:44:13
53	13	39	1	2024-11-29 12:43:25	2024-11-29 16:44:13
54	13	39	1	2024-11-29 12:44:05	2024-11-29 16:44:13
55	13	42	1	2024-11-29 17:53:39	2024-11-29 21:53:47
56	13	44	3	2024-11-30 06:23:25	2024-11-30 06:24:05
57	13	44	3	2024-11-30 06:24:05	2024-11-30 06:24:46
58	13	44	0	2024-11-30 06:24:46	2024-11-30 06:24:46
116	38	67	3	2024-12-02 05:56:06	2024-12-02 05:56:46
59	13	45	1	2024-11-30 06:25:48	2024-11-30 10:27:21
60	13	45	1	2024-11-30 06:26:28	2024-11-30 10:27:21
61	13	45	1	2024-11-30 06:27:09	2024-11-30 10:27:21
62	29	46	3	2024-11-30 07:05:35	2024-11-30 07:06:15
63	29	46	3	2024-11-30 07:06:15	2024-11-30 07:06:56
64	29	46	3	2024-11-30 07:06:56	2024-11-30 07:07:36
65	29	46	3	2024-11-30 07:07:36	2024-11-30 07:08:16
66	29	46	3	2024-11-30 07:08:16	2024-11-30 07:08:57
67	29	46	3	2024-11-30 07:08:57	2024-11-30 07:09:37
68	29	46	3	2024-11-30 07:09:37	2024-11-30 07:10:17
69	29	46	3	2024-11-30 07:10:17	2024-11-30 07:10:58
70	29	46	3	2024-11-30 07:10:58	2024-11-30 07:11:38
71	29	46	3	2024-11-30 07:11:38	2024-11-30 07:12:19
72	29	46	3	2024-11-30 07:12:19	2024-11-30 07:12:59
73	29	46	3	2024-11-30 07:12:59	2024-11-30 07:13:39
74	29	46	3	2024-11-30 07:13:39	2024-11-30 07:14:19
75	29	46	3	2024-11-30 07:14:19	2024-11-30 07:15:00
76	29	46	0	2024-11-30 07:15:00	2024-11-30 07:15:00
77	13	49	1	2024-11-30 09:53:37	2024-11-30 13:53:47
78	13	50	1	2024-11-30 09:59:56	2024-11-30 14:00:48
79	13	50	1	2024-11-30 10:00:37	2024-11-30 14:00:48
117	38	68	3	2024-12-02 05:56:38	2024-12-02 05:57:19
91	13	55	1	2024-11-30 10:58:26	2024-11-30 15:00:39
92	13	55	1	2024-11-30 10:59:06	2024-11-30 15:00:39
93	13	55	1	2024-11-30 10:59:47	2024-11-30 15:00:39
80	13	51	1	2024-11-30 10:04:37	2024-11-30 14:08:51
81	13	51	1	2024-11-30 10:05:17	2024-11-30 14:08:51
82	13	51	1	2024-11-30 10:05:58	2024-11-30 14:08:51
83	13	51	1	2024-11-30 10:06:38	2024-11-30 14:08:51
84	13	51	1	2024-11-30 10:07:18	2024-11-30 14:08:51
85	13	51	1	2024-11-30 10:07:59	2024-11-30 14:08:51
86	13	51	1	2024-11-30 10:08:39	2024-11-30 14:08:51
94	13	55	1	2024-11-30 11:00:27	2024-11-30 15:00:39
95	13	63	1	2024-11-30 13:19:04	2024-11-30 17:19:56
96	13	63	1	2024-11-30 13:19:45	2024-11-30 17:19:56
97	38	64	3	2024-12-02 05:42:34	2024-12-02 05:43:15
98	38	64	3	2024-12-02 05:43:15	2024-12-02 05:43:55
99	38	64	3	2024-12-02 05:43:55	2024-12-02 05:44:35
100	38	64	3	2024-12-02 05:44:35	2024-12-02 05:45:16
101	38	64	3	2024-12-02 05:45:16	2024-12-02 05:45:56
102	38	64	3	2024-12-02 05:45:56	2024-12-02 05:46:37
103	38	64	0	2024-12-02 05:46:37	2024-12-02 05:46:37
104	38	65	3	2024-12-02 05:47:15	2024-12-02 05:47:56
105	38	65	3	2024-12-02 05:47:56	2024-12-02 05:48:36
106	38	65	3	2024-12-02 05:48:36	2024-12-02 05:49:16
107	38	65	3	2024-12-02 05:49:16	2024-12-02 05:49:57
108	38	65	3	2024-12-02 05:49:57	2024-12-02 05:50:37
109	38	65	3	2024-12-02 05:50:37	2024-12-02 05:51:18
110	38	65	3	2024-12-02 05:51:18	2024-12-02 05:51:58
111	38	65	3	2024-12-02 05:51:58	2024-12-02 05:52:38
112	38	65	3	2024-12-02 05:52:38	2024-12-02 05:53:19
113	38	65	3	2024-12-02 05:53:19	2024-12-02 05:53:59
114	38	65	0	2024-12-02 05:53:59	2024-12-02 05:53:59
115	34	66	0	2024-12-02 05:55:14	2024-12-02 05:55:14
118	38	67	3	2024-12-02 05:56:46	2024-12-02 05:57:27
119	38	68	3	2024-12-02 05:57:19	2024-12-02 05:57:59
120	38	67	3	2024-12-02 05:57:27	2024-12-02 05:58:07
121	38	68	3	2024-12-02 05:57:59	2024-12-02 05:58:39
122	38	67	3	2024-12-02 05:58:07	2024-12-02 05:58:47
123	38	68	3	2024-12-02 05:58:39	2024-12-02 05:59:20
124	38	67	3	2024-12-02 05:58:47	2024-12-02 05:59:28
125	38	68	3	2024-12-02 05:59:20	2024-12-02 06:00:00
126	38	67	3	2024-12-02 05:59:28	2024-12-02 06:00:08
127	38	68	3	2024-12-02 06:00:00	2024-12-02 06:00:40
128	38	67	3	2024-12-02 06:00:08	2024-12-02 06:00:49
129	38	68	3	2024-12-02 06:00:40	2024-12-02 06:01:21
130	38	67	3	2024-12-02 06:00:49	2024-12-02 06:01:29
132	13	70	1	2024-12-02 06:01:26	2024-12-02 10:01:37
131	38	68	3	2024-12-02 06:01:21	2024-12-02 06:02:01
133	38	67	3	2024-12-02 06:01:29	2024-12-02 06:02:09
134	38	68	3	2024-12-02 06:02:01	2024-12-02 06:02:41
135	38	67	3	2024-12-02 06:02:09	2024-12-02 06:02:50
136	38	68	3	2024-12-02 06:02:41	2024-12-02 06:03:22
137	38	67	3	2024-12-02 06:02:50	2024-12-02 06:03:30
138	38	68	3	2024-12-02 06:03:22	2024-12-02 06:04:02
139	38	67	3	2024-12-02 06:03:30	2024-12-02 06:04:10
140	38	68	3	2024-12-02 06:04:02	2024-12-02 06:04:42
141	38	67	3	2024-12-02 06:04:10	2024-12-02 06:04:51
142	38	68	3	2024-12-02 06:04:42	2024-12-02 06:05:23
143	38	67	3	2024-12-02 06:04:51	2024-12-02 06:05:31
144	38	68	3	2024-12-02 06:05:23	2024-12-02 06:06:03
145	38	67	3	2024-12-02 06:05:31	2024-12-02 06:06:11
146	38	68	3	2024-12-02 06:06:03	2024-12-02 06:06:43
147	38	67	3	2024-12-02 06:06:11	2024-12-02 06:06:52
148	38	68	3	2024-12-02 06:06:43	2024-12-02 06:07:24
149	38	67	3	2024-12-02 06:06:52	2024-12-02 06:07:32
150	38	68	3	2024-12-02 06:07:24	2024-12-02 06:08:04
151	38	67	3	2024-12-02 06:07:32	2024-12-02 06:08:12
152	38	68	3	2024-12-02 06:08:04	2024-12-02 06:08:45
154	38	68	3	2024-12-02 06:08:45	2024-12-02 06:09:25
156	38	68	3	2024-12-02 06:09:25	2024-12-02 06:10:05
158	38	68	3	2024-12-02 06:10:05	2024-12-02 06:10:46
160	38	68	3	2024-12-02 06:10:46	2024-12-02 06:11:26
162	38	68	3	2024-12-02 06:11:26	2024-12-02 06:12:06
164	38	68	3	2024-12-02 06:12:06	2024-12-02 06:12:47
166	38	68	3	2024-12-02 06:12:47	2024-12-02 06:13:27
168	38	68	3	2024-12-02 06:13:27	2024-12-02 06:14:07
170	38	68	3	2024-12-02 06:14:07	2024-12-02 06:14:48
172	38	68	3	2024-12-02 06:14:48	2024-12-02 06:15:28
174	38	68	3	2024-12-02 06:15:28	2024-12-02 06:16:08
176	38	68	3	2024-12-02 06:16:08	2024-12-02 06:16:49
178	38	68	3	2024-12-02 06:16:49	2024-12-02 06:17:29
3853	38	87	3	2024-12-03 21:08:38	2024-12-03 21:09:18
3860	38	87	3	2024-12-03 21:09:18	2024-12-03 21:09:59
3867	38	87	3	2024-12-03 21:09:59	2024-12-03 21:10:39
3874	38	87	3	2024-12-03 21:10:39	2024-12-03 21:11:19
3881	38	87	3	2024-12-03 21:11:19	2024-12-03 21:12:00
4816	38	83	3	2024-12-03 22:41:06	2024-12-03 22:41:46
4823	38	83	3	2024-12-03 22:41:46	2024-12-03 22:42:27
4830	38	83	3	2024-12-03 22:42:27	2024-12-03 22:43:07
4837	38	83	3	2024-12-03 22:43:07	2024-12-03 22:43:47
4844	38	83	3	2024-12-03 22:43:47	2024-12-03 22:44:28
4851	38	83	3	2024-12-03 22:44:28	2024-12-03 22:45:08
4858	38	83	3	2024-12-03 22:45:08	2024-12-03 22:45:48
4865	38	83	3	2024-12-03 22:45:48	2024-12-03 22:46:29
4872	38	83	3	2024-12-03 22:46:29	2024-12-03 22:47:09
8303	38	84	3	2024-12-04 04:16:45	2024-12-04 04:17:26
8310	38	84	3	2024-12-04 04:17:26	2024-12-04 04:18:06
8317	38	84	0	2024-12-04 04:18:06	2024-12-04 04:18:06
153	38	67	3	2024-12-02 06:08:12	2024-12-02 06:08:53
155	38	67	3	2024-12-02 06:08:53	2024-12-02 06:09:33
157	38	67	3	2024-12-02 06:09:33	2024-12-02 06:10:13
159	38	67	3	2024-12-02 06:10:13	2024-12-02 06:10:54
161	38	67	3	2024-12-02 06:10:54	2024-12-02 06:11:34
163	38	67	3	2024-12-02 06:11:34	2024-12-02 06:12:14
165	38	67	3	2024-12-02 06:12:14	2024-12-02 06:12:55
167	38	67	3	2024-12-02 06:12:55	2024-12-02 06:13:35
169	38	67	3	2024-12-02 06:13:35	2024-12-02 06:14:15
171	38	67	3	2024-12-02 06:14:15	2024-12-02 06:14:56
173	38	67	3	2024-12-02 06:14:56	2024-12-02 06:15:36
175	38	67	3	2024-12-02 06:15:36	2024-12-02 06:16:16
177	38	67	3	2024-12-02 06:16:16	2024-12-02 06:16:57
179	38	67	3	2024-12-02 06:16:57	2024-12-02 06:17:37
180	38	68	3	2024-12-02 06:17:29	2024-12-02 06:18:10
181	38	67	3	2024-12-02 06:17:37	2024-12-02 06:18:17
182	38	68	3	2024-12-02 06:18:10	2024-12-02 06:18:50
183	38	67	3	2024-12-02 06:18:17	2024-12-02 06:18:58
184	38	68	3	2024-12-02 06:18:50	2024-12-02 06:19:30
185	38	67	3	2024-12-02 06:18:58	2024-12-02 06:19:38
186	38	68	3	2024-12-02 06:19:30	2024-12-02 06:20:11
187	38	67	3	2024-12-02 06:19:38	2024-12-02 06:20:18
188	38	68	3	2024-12-02 06:20:11	2024-12-02 06:20:51
189	38	67	3	2024-12-02 06:20:18	2024-12-02 06:20:59
190	38	68	3	2024-12-02 06:20:51	2024-12-02 06:21:31
191	38	67	3	2024-12-02 06:20:59	2024-12-02 06:21:39
192	38	68	3	2024-12-02 06:21:31	2024-12-02 06:22:12
193	38	67	3	2024-12-02 06:21:39	2024-12-02 06:22:19
194	38	68	3	2024-12-02 06:22:12	2024-12-02 06:22:52
195	38	67	3	2024-12-02 06:22:19	2024-12-02 06:23:00
196	38	68	3	2024-12-02 06:22:52	2024-12-02 06:23:32
197	38	67	3	2024-12-02 06:23:00	2024-12-02 06:23:40
198	38	68	3	2024-12-02 06:23:32	2024-12-02 06:24:13
199	38	67	3	2024-12-02 06:23:40	2024-12-02 06:24:20
200	38	68	3	2024-12-02 06:24:13	2024-12-02 06:24:53
201	38	67	3	2024-12-02 06:24:20	2024-12-02 06:25:01
202	38	68	3	2024-12-02 06:24:53	2024-12-02 06:25:33
203	38	67	3	2024-12-02 06:25:01	2024-12-02 06:25:41
204	38	68	3	2024-12-02 06:25:33	2024-12-02 06:26:14
205	38	67	3	2024-12-02 06:25:41	2024-12-02 06:26:21
206	38	68	3	2024-12-02 06:26:14	2024-12-02 06:26:54
207	38	67	3	2024-12-02 06:26:21	2024-12-02 06:27:02
208	38	68	3	2024-12-02 06:26:54	2024-12-02 06:27:34
209	38	67	3	2024-12-02 06:27:02	2024-12-02 06:27:42
210	38	68	3	2024-12-02 06:27:34	2024-12-02 06:28:15
211	38	67	3	2024-12-02 06:27:42	2024-12-02 06:28:22
212	38	71	3	2024-12-02 06:28:01	2024-12-02 06:28:41
213	38	68	3	2024-12-02 06:28:15	2024-12-02 06:28:55
214	38	67	3	2024-12-02 06:28:22	2024-12-02 06:29:02
215	13	71	3	2024-12-02 06:28:41	2024-12-02 06:29:22
216	38	68	3	2024-12-02 06:28:55	2024-12-02 06:29:35
217	38	67	3	2024-12-02 06:29:02	2024-12-02 06:29:43
218	13	71	3	2024-12-02 06:29:22	2024-12-02 06:30:02
219	38	68	3	2024-12-02 06:29:35	2024-12-02 06:30:16
220	38	67	3	2024-12-02 06:29:43	2024-12-02 06:30:23
221	13	71	3	2024-12-02 06:30:02	2024-12-02 06:30:42
222	38	68	3	2024-12-02 06:30:16	2024-12-02 06:30:56
223	38	67	3	2024-12-02 06:30:23	2024-12-02 06:31:03
224	13	71	3	2024-12-02 06:30:42	2024-12-02 06:31:23
225	38	68	3	2024-12-02 06:30:56	2024-12-02 06:31:36
226	38	67	3	2024-12-02 06:31:03	2024-12-02 06:31:44
227	13	71	3	2024-12-02 06:31:23	2024-12-02 06:32:03
230	38	71	0	2024-12-02 06:32:03	2024-12-02 06:32:03
228	38	68	3	2024-12-02 06:31:36	2024-12-02 06:32:17
229	38	67	3	2024-12-02 06:31:44	2024-12-02 06:32:24
231	38	68	3	2024-12-02 06:32:17	2024-12-02 06:32:57
232	38	67	3	2024-12-02 06:32:24	2024-12-02 06:33:04
233	38	72	3	2024-12-02 06:32:42	2024-12-02 06:33:23
234	38	68	3	2024-12-02 06:32:57	2024-12-02 06:33:37
235	38	67	3	2024-12-02 06:33:04	2024-12-02 06:33:45
236	38	72	3	2024-12-02 06:33:23	2024-12-02 06:34:03
237	38	68	3	2024-12-02 06:33:37	2024-12-02 06:34:18
238	38	67	3	2024-12-02 06:33:45	2024-12-02 06:34:25
239	38	72	3	2024-12-02 06:34:03	2024-12-02 06:34:44
240	38	68	3	2024-12-02 06:34:18	2024-12-02 06:34:58
241	38	67	3	2024-12-02 06:34:25	2024-12-02 06:35:05
242	38	72	3	2024-12-02 06:34:44	2024-12-02 06:35:24
243	38	68	3	2024-12-02 06:34:58	2024-12-02 06:35:38
244	38	67	3	2024-12-02 06:35:05	2024-12-02 06:35:46
256	38	67	3	2024-12-02 06:38:27	2024-12-02 06:39:07
246	38	68	3	2024-12-02 06:35:38	2024-12-02 06:36:19
247	38	67	3	2024-12-02 06:35:46	2024-12-02 06:36:26
245	13	72	1	2024-12-02 06:35:24	2024-12-02 10:36:31
248	13	72	1	2024-12-02 06:36:04	2024-12-02 10:36:31
249	38	68	3	2024-12-02 06:36:19	2024-12-02 06:36:59
250	38	67	3	2024-12-02 06:36:26	2024-12-02 06:37:06
251	38	68	3	2024-12-02 06:36:59	2024-12-02 06:37:39
252	38	67	3	2024-12-02 06:37:06	2024-12-02 06:37:47
253	38	68	3	2024-12-02 06:37:39	2024-12-02 06:38:20
254	38	67	3	2024-12-02 06:37:47	2024-12-02 06:38:27
255	38	68	3	2024-12-02 06:38:20	2024-12-02 06:39:00
257	38	68	3	2024-12-02 06:39:00	2024-12-02 06:39:40
258	38	67	3	2024-12-02 06:39:07	2024-12-02 06:39:48
259	38	68	3	2024-12-02 06:39:40	2024-12-02 06:40:21
260	38	67	3	2024-12-02 06:39:48	2024-12-02 06:40:28
261	38	68	3	2024-12-02 06:40:21	2024-12-02 06:41:01
262	38	67	3	2024-12-02 06:40:28	2024-12-02 06:41:08
263	38	68	3	2024-12-02 06:41:01	2024-12-02 06:41:41
264	38	67	3	2024-12-02 06:41:08	2024-12-02 06:41:49
265	38	68	3	2024-12-02 06:41:41	2024-12-02 06:42:22
266	38	67	3	2024-12-02 06:41:49	2024-12-02 06:42:29
267	38	68	3	2024-12-02 06:42:22	2024-12-02 06:43:02
268	38	67	3	2024-12-02 06:42:29	2024-12-02 06:43:09
269	38	68	3	2024-12-02 06:43:02	2024-12-02 06:43:42
270	38	67	3	2024-12-02 06:43:09	2024-12-02 06:43:50
271	38	68	3	2024-12-02 06:43:42	2024-12-02 06:44:23
272	38	67	3	2024-12-02 06:43:50	2024-12-02 06:44:30
273	38	68	3	2024-12-02 06:44:23	2024-12-02 06:45:03
274	38	67	3	2024-12-02 06:44:30	2024-12-02 06:45:10
275	38	68	3	2024-12-02 06:45:03	2024-12-02 06:45:43
276	38	67	3	2024-12-02 06:45:10	2024-12-02 06:45:51
277	38	68	3	2024-12-02 06:45:43	2024-12-02 06:46:24
278	38	67	3	2024-12-02 06:45:51	2024-12-02 06:46:31
280	38	67	3	2024-12-02 06:46:31	2024-12-02 06:47:11
282	38	67	3	2024-12-02 06:47:11	2024-12-02 06:47:52
284	38	67	3	2024-12-02 06:47:52	2024-12-02 06:48:32
3855	38	82	3	2024-12-03 21:08:44	2024-12-03 21:09:24
3862	38	82	3	2024-12-03 21:09:24	2024-12-03 21:10:05
3869	38	82	3	2024-12-03 21:10:05	2024-12-03 21:10:45
3876	38	82	3	2024-12-03 21:10:45	2024-12-03 21:11:25
3883	38	82	3	2024-12-03 21:11:25	2024-12-03 21:12:06
4818	38	87	3	2024-12-03 22:41:26	2024-12-03 22:42:07
4825	38	87	3	2024-12-03 22:42:07	2024-12-03 22:42:47
4832	38	87	3	2024-12-03 22:42:47	2024-12-03 22:43:27
4839	38	87	3	2024-12-03 22:43:27	2024-12-03 22:44:08
4846	38	87	3	2024-12-03 22:44:08	2024-12-03 22:44:48
4853	38	87	3	2024-12-03 22:44:48	2024-12-03 22:45:28
4860	38	87	3	2024-12-03 22:45:28	2024-12-03 22:46:08
4867	38	87	3	2024-12-03 22:46:08	2024-12-03 22:46:49
4874	38	87	3	2024-12-03 22:46:49	2024-12-03 22:47:29
8304	38	87	3	2024-12-04 04:16:57	2024-12-04 04:17:37
8311	38	87	3	2024-12-04 04:17:37	2024-12-04 04:18:18
8318	38	87	0	2024-12-04 04:18:18	2024-12-04 04:18:18
279	38	68	3	2024-12-02 06:46:24	2024-12-02 06:47:04
281	38	68	3	2024-12-02 06:47:04	2024-12-02 06:47:44
283	38	68	3	2024-12-02 06:47:44	2024-12-02 06:48:25
285	38	68	3	2024-12-02 06:48:25	2024-12-02 06:49:05
286	38	67	3	2024-12-02 06:48:32	2024-12-02 06:49:12
287	38	68	3	2024-12-02 06:49:05	2024-12-02 06:49:45
288	38	67	3	2024-12-02 06:49:12	2024-12-02 06:49:53
289	38	68	3	2024-12-02 06:49:45	2024-12-02 06:50:26
290	38	67	3	2024-12-02 06:49:53	2024-12-02 06:50:33
291	38	68	3	2024-12-02 06:50:26	2024-12-02 06:51:06
292	38	67	3	2024-12-02 06:50:33	2024-12-02 06:51:13
293	38	68	3	2024-12-02 06:51:06	2024-12-02 06:51:46
294	38	67	3	2024-12-02 06:51:13	2024-12-02 06:51:54
295	38	68	3	2024-12-02 06:51:46	2024-12-02 06:52:27
296	38	67	3	2024-12-02 06:51:54	2024-12-02 06:52:34
297	38	68	3	2024-12-02 06:52:27	2024-12-02 06:53:07
298	38	67	3	2024-12-02 06:52:34	2024-12-02 06:53:14
299	38	68	3	2024-12-02 06:53:07	2024-12-02 06:53:47
300	38	67	3	2024-12-02 06:53:14	2024-12-02 06:53:55
301	38	68	3	2024-12-02 06:53:47	2024-12-02 06:54:28
302	38	67	3	2024-12-02 06:53:55	2024-12-02 06:54:35
303	38	68	3	2024-12-02 06:54:28	2024-12-02 06:55:08
304	38	67	3	2024-12-02 06:54:35	2024-12-02 06:55:15
305	38	68	3	2024-12-02 06:55:08	2024-12-02 06:55:48
306	38	67	3	2024-12-02 06:55:15	2024-12-02 06:55:56
307	38	68	3	2024-12-02 06:55:48	2024-12-02 06:56:29
308	38	67	3	2024-12-02 06:55:56	2024-12-02 06:56:36
309	38	68	3	2024-12-02 06:56:29	2024-12-02 06:57:09
310	38	67	3	2024-12-02 06:56:36	2024-12-02 06:57:16
311	38	68	3	2024-12-02 06:57:09	2024-12-02 06:57:49
312	38	67	3	2024-12-02 06:57:16	2024-12-02 06:57:57
313	38	68	3	2024-12-02 06:57:49	2024-12-02 06:58:30
314	38	67	3	2024-12-02 06:57:57	2024-12-02 06:58:37
315	38	68	3	2024-12-02 06:58:30	2024-12-02 06:59:10
316	38	67	3	2024-12-02 06:58:37	2024-12-02 06:59:18
317	38	68	3	2024-12-02 06:59:10	2024-12-02 06:59:51
318	38	67	3	2024-12-02 06:59:18	2024-12-02 06:59:58
319	38	68	3	2024-12-02 06:59:51	2024-12-02 07:00:31
320	38	67	3	2024-12-02 06:59:58	2024-12-02 07:00:38
321	38	68	3	2024-12-02 07:00:31	2024-12-02 07:01:11
322	38	67	3	2024-12-02 07:00:38	2024-12-02 07:01:19
323	38	68	3	2024-12-02 07:01:11	2024-12-02 07:01:52
324	38	67	3	2024-12-02 07:01:19	2024-12-02 07:01:59
325	38	68	3	2024-12-02 07:01:52	2024-12-02 07:02:32
326	38	67	3	2024-12-02 07:01:59	2024-12-02 07:02:39
327	38	68	3	2024-12-02 07:02:32	2024-12-02 07:03:12
328	38	67	3	2024-12-02 07:02:39	2024-12-02 07:03:20
329	38	68	3	2024-12-02 07:03:12	2024-12-02 07:03:53
330	38	67	3	2024-12-02 07:03:20	2024-12-02 07:04:00
331	38	68	3	2024-12-02 07:03:53	2024-12-02 07:04:33
332	38	67	3	2024-12-02 07:04:00	2024-12-02 07:04:41
333	38	68	3	2024-12-02 07:04:33	2024-12-02 07:05:13
334	38	67	3	2024-12-02 07:04:41	2024-12-02 07:05:21
335	38	68	3	2024-12-02 07:05:13	2024-12-02 07:05:54
336	38	67	3	2024-12-02 07:05:21	2024-12-02 07:06:01
337	38	68	3	2024-12-02 07:05:54	2024-12-02 07:06:34
338	38	67	3	2024-12-02 07:06:01	2024-12-02 07:06:42
339	38	68	3	2024-12-02 07:06:34	2024-12-02 07:07:14
340	38	67	3	2024-12-02 07:06:42	2024-12-02 07:07:22
341	38	68	3	2024-12-02 07:07:14	2024-12-02 07:07:55
342	38	67	3	2024-12-02 07:07:22	2024-12-02 07:08:02
343	38	68	3	2024-12-02 07:07:55	2024-12-02 07:08:35
344	38	67	3	2024-12-02 07:08:02	2024-12-02 07:08:43
345	38	68	3	2024-12-02 07:08:35	2024-12-02 07:09:15
346	38	67	3	2024-12-02 07:08:43	2024-12-02 07:09:23
347	38	68	3	2024-12-02 07:09:15	2024-12-02 07:09:56
348	38	67	3	2024-12-02 07:09:23	2024-12-02 07:10:03
349	38	68	3	2024-12-02 07:09:56	2024-12-02 07:10:36
350	38	67	3	2024-12-02 07:10:03	2024-12-02 07:10:44
351	38	68	3	2024-12-02 07:10:36	2024-12-02 07:11:16
352	38	67	3	2024-12-02 07:10:44	2024-12-02 07:11:24
353	38	68	3	2024-12-02 07:11:16	2024-12-02 07:11:57
354	38	67	3	2024-12-02 07:11:24	2024-12-02 07:12:05
355	38	68	3	2024-12-02 07:11:57	2024-12-02 07:12:37
356	38	67	3	2024-12-02 07:12:05	2024-12-02 07:12:45
357	38	68	3	2024-12-02 07:12:37	2024-12-02 07:13:17
358	38	67	3	2024-12-02 07:12:45	2024-12-02 07:13:25
359	38	68	3	2024-12-02 07:13:17	2024-12-02 07:13:58
360	38	67	3	2024-12-02 07:13:25	2024-12-02 07:14:06
361	38	68	3	2024-12-02 07:13:58	2024-12-02 07:14:38
362	38	67	3	2024-12-02 07:14:06	2024-12-02 07:14:46
363	38	68	3	2024-12-02 07:14:38	2024-12-02 07:15:18
364	38	67	3	2024-12-02 07:14:46	2024-12-02 07:15:26
365	38	68	3	2024-12-02 07:15:18	2024-12-02 07:15:59
366	38	67	3	2024-12-02 07:15:26	2024-12-02 07:16:07
367	38	68	3	2024-12-02 07:15:59	2024-12-02 07:16:39
368	38	67	3	2024-12-02 07:16:07	2024-12-02 07:16:47
369	38	68	3	2024-12-02 07:16:39	2024-12-02 07:17:19
370	38	67	3	2024-12-02 07:16:47	2024-12-02 07:17:28
371	38	68	3	2024-12-02 07:17:19	2024-12-02 07:18:00
372	38	67	3	2024-12-02 07:17:28	2024-12-02 07:18:08
373	38	68	3	2024-12-02 07:18:00	2024-12-02 07:18:40
374	38	67	3	2024-12-02 07:18:08	2024-12-02 07:18:48
375	38	68	3	2024-12-02 07:18:40	2024-12-02 07:19:20
376	38	67	3	2024-12-02 07:18:48	2024-12-02 07:19:29
377	38	68	3	2024-12-02 07:19:20	2024-12-02 07:20:01
378	38	67	3	2024-12-02 07:19:29	2024-12-02 07:20:09
379	38	68	3	2024-12-02 07:20:01	2024-12-02 07:20:41
380	38	67	3	2024-12-02 07:20:09	2024-12-02 07:20:49
381	38	68	3	2024-12-02 07:20:41	2024-12-02 07:21:21
382	38	67	3	2024-12-02 07:20:49	2024-12-02 07:21:30
383	38	68	3	2024-12-02 07:21:21	2024-12-02 07:22:02
384	38	67	3	2024-12-02 07:21:30	2024-12-02 07:22:10
385	38	68	3	2024-12-02 07:22:02	2024-12-02 07:22:42
386	38	67	3	2024-12-02 07:22:10	2024-12-02 07:22:51
387	38	68	3	2024-12-02 07:22:42	2024-12-02 07:23:22
388	38	67	3	2024-12-02 07:22:51	2024-12-02 07:23:31
389	38	68	3	2024-12-02 07:23:22	2024-12-02 07:24:03
390	38	67	3	2024-12-02 07:23:31	2024-12-02 07:24:11
391	38	68	3	2024-12-02 07:24:03	2024-12-02 07:24:43
392	38	67	3	2024-12-02 07:24:11	2024-12-02 07:24:52
393	38	68	3	2024-12-02 07:24:43	2024-12-02 07:25:23
394	38	67	3	2024-12-02 07:24:52	2024-12-02 07:25:32
396	38	67	3	2024-12-02 07:25:32	2024-12-02 07:26:12
398	38	67	3	2024-12-02 07:26:12	2024-12-02 07:26:53
400	38	67	3	2024-12-02 07:26:53	2024-12-02 07:27:33
402	38	67	3	2024-12-02 07:27:33	2024-12-02 07:28:14
404	38	67	3	2024-12-02 07:28:14	2024-12-02 07:28:54
406	38	67	3	2024-12-02 07:28:54	2024-12-02 07:29:34
3857	38	83	3	2024-12-03 21:08:52	2024-12-03 21:09:33
3864	38	83	3	2024-12-03 21:09:33	2024-12-03 21:10:13
3871	38	83	3	2024-12-03 21:10:13	2024-12-03 21:10:53
3878	38	83	3	2024-12-03 21:10:53	2024-12-03 21:11:34
3885	38	83	3	2024-12-03 21:11:34	2024-12-03 21:12:14
4820	38	81	3	2024-12-03 22:41:28	2024-12-03 22:42:08
4827	38	81	3	2024-12-03 22:42:08	2024-12-03 22:42:49
4834	38	81	3	2024-12-03 22:42:49	2024-12-03 22:43:29
4841	38	81	3	2024-12-03 22:43:29	2024-12-03 22:44:09
4848	38	81	3	2024-12-03 22:44:09	2024-12-03 22:44:50
4855	38	81	3	2024-12-03 22:44:50	2024-12-03 22:45:30
4862	38	81	3	2024-12-03 22:45:30	2024-12-03 22:46:10
4869	38	81	3	2024-12-03 22:46:10	2024-12-03 22:46:51
4876	38	81	3	2024-12-03 22:46:51	2024-12-03 22:47:31
8305	38	81	3	2024-12-04 04:16:59	2024-12-04 04:17:39
8312	38	81	3	2024-12-04 04:17:39	2024-12-04 04:18:20
8319	38	81	0	2024-12-04 04:18:20	2024-12-04 04:18:20
395	38	68	3	2024-12-02 07:25:23	2024-12-02 07:26:04
397	38	68	3	2024-12-02 07:26:04	2024-12-02 07:26:44
399	38	68	3	2024-12-02 07:26:44	2024-12-02 07:27:24
401	38	68	3	2024-12-02 07:27:24	2024-12-02 07:28:05
403	38	68	3	2024-12-02 07:28:05	2024-12-02 07:28:45
405	38	68	3	2024-12-02 07:28:45	2024-12-02 07:29:25
407	38	68	3	2024-12-02 07:29:25	2024-12-02 07:30:06
408	38	67	3	2024-12-02 07:29:34	2024-12-02 07:30:15
409	38	68	3	2024-12-02 07:30:06	2024-12-02 07:30:46
410	38	67	3	2024-12-02 07:30:15	2024-12-02 07:30:55
411	38	68	3	2024-12-02 07:30:46	2024-12-02 07:31:26
412	38	67	3	2024-12-02 07:30:55	2024-12-02 07:31:35
413	38	68	3	2024-12-02 07:31:26	2024-12-02 07:32:07
414	38	67	3	2024-12-02 07:31:35	2024-12-02 07:32:16
415	38	68	3	2024-12-02 07:32:07	2024-12-02 07:32:47
416	38	67	3	2024-12-02 07:32:16	2024-12-02 07:32:56
417	38	68	3	2024-12-02 07:32:47	2024-12-02 07:33:27
418	38	67	3	2024-12-02 07:32:56	2024-12-02 07:33:37
419	38	68	3	2024-12-02 07:33:27	2024-12-02 07:34:08
420	38	67	3	2024-12-02 07:33:37	2024-12-02 07:34:17
421	38	68	3	2024-12-02 07:34:08	2024-12-02 07:34:48
422	38	67	3	2024-12-02 07:34:17	2024-12-02 07:34:57
423	38	68	3	2024-12-02 07:34:48	2024-12-02 07:35:28
424	38	67	3	2024-12-02 07:34:57	2024-12-02 07:35:38
425	38	68	3	2024-12-02 07:35:28	2024-12-02 07:36:09
426	38	67	3	2024-12-02 07:35:38	2024-12-02 07:36:18
427	38	68	3	2024-12-02 07:36:09	2024-12-02 07:36:49
428	38	67	3	2024-12-02 07:36:18	2024-12-02 07:36:58
429	38	68	3	2024-12-02 07:36:49	2024-12-02 07:37:29
430	38	67	3	2024-12-02 07:36:58	2024-12-02 07:37:39
431	38	68	3	2024-12-02 07:37:29	2024-12-02 07:38:10
432	38	67	3	2024-12-02 07:37:39	2024-12-02 07:38:19
433	38	68	3	2024-12-02 07:38:10	2024-12-02 07:38:50
434	38	67	3	2024-12-02 07:38:19	2024-12-02 07:39:00
435	38	68	3	2024-12-02 07:38:50	2024-12-02 07:39:30
436	38	67	3	2024-12-02 07:39:00	2024-12-02 07:39:40
437	38	68	3	2024-12-02 07:39:30	2024-12-02 07:40:11
438	38	67	3	2024-12-02 07:39:40	2024-12-02 07:40:20
439	38	68	3	2024-12-02 07:40:11	2024-12-02 07:40:51
440	38	67	3	2024-12-02 07:40:20	2024-12-02 07:41:01
441	38	68	3	2024-12-02 07:40:51	2024-12-02 07:41:31
442	38	67	3	2024-12-02 07:41:01	2024-12-02 07:41:41
443	38	68	3	2024-12-02 07:41:31	2024-12-02 07:42:12
444	38	67	3	2024-12-02 07:41:41	2024-12-02 07:42:21
445	38	68	3	2024-12-02 07:42:12	2024-12-02 07:42:52
446	38	67	3	2024-12-02 07:42:21	2024-12-02 07:43:02
447	38	68	3	2024-12-02 07:42:52	2024-12-02 07:43:32
448	38	67	3	2024-12-02 07:43:02	2024-12-02 07:43:42
449	38	68	3	2024-12-02 07:43:32	2024-12-02 07:44:13
450	38	67	3	2024-12-02 07:43:42	2024-12-02 07:44:22
451	38	68	3	2024-12-02 07:44:13	2024-12-02 07:44:53
452	38	67	3	2024-12-02 07:44:22	2024-12-02 07:45:03
453	38	68	3	2024-12-02 07:44:53	2024-12-02 07:45:33
454	38	67	3	2024-12-02 07:45:03	2024-12-02 07:45:43
455	38	68	3	2024-12-02 07:45:33	2024-12-02 07:46:14
456	38	67	3	2024-12-02 07:45:43	2024-12-02 07:46:24
457	38	68	3	2024-12-02 07:46:14	2024-12-02 07:46:54
458	38	67	3	2024-12-02 07:46:24	2024-12-02 07:47:04
459	38	68	3	2024-12-02 07:46:54	2024-12-02 07:47:34
460	38	67	3	2024-12-02 07:47:04	2024-12-02 07:47:44
461	38	68	3	2024-12-02 07:47:34	2024-12-02 07:48:15
462	38	67	3	2024-12-02 07:47:44	2024-12-02 07:48:25
463	38	68	3	2024-12-02 07:48:15	2024-12-02 07:48:55
464	38	67	3	2024-12-02 07:48:25	2024-12-02 07:49:05
465	38	68	3	2024-12-02 07:48:55	2024-12-02 07:49:35
466	38	67	3	2024-12-02 07:49:05	2024-12-02 07:49:45
467	38	68	3	2024-12-02 07:49:35	2024-12-02 07:50:16
468	38	67	3	2024-12-02 07:49:45	2024-12-02 07:50:26
469	38	68	3	2024-12-02 07:50:16	2024-12-02 07:50:56
470	38	67	3	2024-12-02 07:50:26	2024-12-02 07:51:06
471	38	68	3	2024-12-02 07:50:56	2024-12-02 07:51:36
472	38	67	3	2024-12-02 07:51:06	2024-12-02 07:51:46
473	38	68	3	2024-12-02 07:51:36	2024-12-02 07:52:16
474	38	67	3	2024-12-02 07:51:46	2024-12-02 07:52:27
475	38	68	3	2024-12-02 07:52:16	2024-12-02 07:52:57
476	38	67	3	2024-12-02 07:52:27	2024-12-02 07:53:07
477	38	68	3	2024-12-02 07:52:57	2024-12-02 07:53:37
478	38	67	3	2024-12-02 07:53:07	2024-12-02 07:53:48
479	38	68	3	2024-12-02 07:53:37	2024-12-02 07:54:17
480	38	67	3	2024-12-02 07:53:48	2024-12-02 07:54:28
481	38	68	3	2024-12-02 07:54:17	2024-12-02 07:54:58
482	38	67	3	2024-12-02 07:54:28	2024-12-02 07:55:08
483	38	68	3	2024-12-02 07:54:58	2024-12-02 07:55:38
484	38	67	3	2024-12-02 07:55:08	2024-12-02 07:55:49
485	38	68	3	2024-12-02 07:55:38	2024-12-02 07:56:18
486	38	67	3	2024-12-02 07:55:49	2024-12-02 07:56:29
487	38	68	3	2024-12-02 07:56:18	2024-12-02 07:56:59
488	38	67	3	2024-12-02 07:56:29	2024-12-02 07:57:09
489	38	68	3	2024-12-02 07:56:59	2024-12-02 07:57:39
490	38	67	3	2024-12-02 07:57:09	2024-12-02 07:57:50
491	38	68	3	2024-12-02 07:57:39	2024-12-02 07:58:19
492	38	67	3	2024-12-02 07:57:50	2024-12-02 07:58:30
493	38	68	3	2024-12-02 07:58:19	2024-12-02 07:59:00
494	38	67	3	2024-12-02 07:58:30	2024-12-02 07:59:11
495	38	68	3	2024-12-02 07:59:00	2024-12-02 07:59:40
496	38	67	3	2024-12-02 07:59:11	2024-12-02 07:59:51
497	38	68	3	2024-12-02 07:59:40	2024-12-02 08:00:21
498	38	67	3	2024-12-02 07:59:51	2024-12-02 08:00:31
499	38	68	3	2024-12-02 08:00:21	2024-12-02 08:01:01
500	38	67	3	2024-12-02 08:00:31	2024-12-02 08:01:12
501	38	68	3	2024-12-02 08:01:01	2024-12-02 08:01:42
502	38	67	3	2024-12-02 08:01:12	2024-12-02 08:01:52
503	38	68	3	2024-12-02 08:01:42	2024-12-02 08:02:22
504	38	67	3	2024-12-02 08:01:52	2024-12-02 08:02:32
505	38	68	3	2024-12-02 08:02:22	2024-12-02 08:03:02
506	38	67	3	2024-12-02 08:02:32	2024-12-02 08:03:13
507	38	68	3	2024-12-02 08:03:02	2024-12-02 08:03:43
508	38	67	3	2024-12-02 08:03:13	2024-12-02 08:03:53
509	38	68	3	2024-12-02 08:03:43	2024-12-02 08:04:23
510	38	67	3	2024-12-02 08:03:53	2024-12-02 08:04:33
511	38	68	3	2024-12-02 08:04:23	2024-12-02 08:05:03
512	38	67	3	2024-12-02 08:04:33	2024-12-02 08:05:14
513	38	68	3	2024-12-02 08:05:03	2024-12-02 08:05:44
515	38	68	3	2024-12-02 08:05:44	2024-12-02 08:06:24
517	38	68	3	2024-12-02 08:06:24	2024-12-02 08:07:05
519	38	68	3	2024-12-02 08:07:05	2024-12-02 08:07:45
521	38	68	3	2024-12-02 08:07:45	2024-12-02 08:08:25
523	38	68	3	2024-12-02 08:08:25	2024-12-02 08:09:06
525	38	68	3	2024-12-02 08:09:06	2024-12-02 08:09:46
527	38	68	3	2024-12-02 08:09:46	2024-12-02 08:10:26
529	38	68	3	2024-12-02 08:10:26	2024-12-02 08:11:07
531	38	68	3	2024-12-02 08:11:07	2024-12-02 08:11:47
533	38	68	3	2024-12-02 08:11:47	2024-12-02 08:12:28
535	38	68	3	2024-12-02 08:12:28	2024-12-02 08:13:08
537	38	68	3	2024-12-02 08:13:08	2024-12-02 08:13:48
539	38	68	3	2024-12-02 08:13:48	2024-12-02 08:14:29
541	38	68	3	2024-12-02 08:14:29	2024-12-02 08:15:09
543	38	68	3	2024-12-02 08:15:09	2024-12-02 08:15:49
545	38	68	3	2024-12-02 08:15:49	2024-12-02 08:16:30
547	38	68	3	2024-12-02 08:16:30	2024-12-02 08:17:10
549	38	68	3	2024-12-02 08:17:10	2024-12-02 08:17:51
551	38	68	3	2024-12-02 08:17:51	2024-12-02 08:18:31
3852	38	86	3	2024-12-03 21:08:36	2024-12-03 21:09:16
3859	38	86	3	2024-12-03 21:09:16	2024-12-03 21:09:56
3866	38	86	3	2024-12-03 21:09:56	2024-12-03 21:10:37
3873	38	86	3	2024-12-03 21:10:37	2024-12-03 21:11:17
3880	38	86	3	2024-12-03 21:11:17	2024-12-03 21:11:57
4815	38	88	3	2024-12-03 22:41:04	2024-12-03 22:41:45
4822	38	88	3	2024-12-03 22:41:45	2024-12-03 22:42:25
4829	38	88	3	2024-12-03 22:42:25	2024-12-03 22:43:05
4836	38	88	3	2024-12-03 22:43:05	2024-12-03 22:43:46
4843	38	88	3	2024-12-03 22:43:46	2024-12-03 22:44:26
4850	38	88	3	2024-12-03 22:44:26	2024-12-03 22:45:06
4857	38	88	3	2024-12-03 22:45:06	2024-12-03 22:45:47
4864	38	88	3	2024-12-03 22:45:47	2024-12-03 22:46:27
4871	38	88	3	2024-12-03 22:46:27	2024-12-03 22:47:07
514	38	67	3	2024-12-02 08:05:14	2024-12-02 08:05:54
516	38	67	3	2024-12-02 08:05:54	2024-12-02 08:06:35
518	38	67	3	2024-12-02 08:06:35	2024-12-02 08:07:15
520	38	67	3	2024-12-02 08:07:15	2024-12-02 08:07:55
522	38	67	3	2024-12-02 08:07:55	2024-12-02 08:08:36
524	38	67	3	2024-12-02 08:08:36	2024-12-02 08:09:16
526	38	67	3	2024-12-02 08:09:16	2024-12-02 08:09:56
528	38	67	3	2024-12-02 08:09:56	2024-12-02 08:10:37
530	38	67	3	2024-12-02 08:10:37	2024-12-02 08:11:17
532	38	67	3	2024-12-02 08:11:17	2024-12-02 08:11:57
534	38	67	3	2024-12-02 08:11:57	2024-12-02 08:12:38
536	38	67	3	2024-12-02 08:12:38	2024-12-02 08:13:18
538	38	67	3	2024-12-02 08:13:18	2024-12-02 08:13:58
540	38	67	3	2024-12-02 08:13:58	2024-12-02 08:14:39
542	38	67	3	2024-12-02 08:14:39	2024-12-02 08:15:19
544	38	67	3	2024-12-02 08:15:19	2024-12-02 08:15:59
546	38	67	3	2024-12-02 08:15:59	2024-12-02 08:16:40
548	38	67	3	2024-12-02 08:16:40	2024-12-02 08:17:20
550	38	67	3	2024-12-02 08:17:20	2024-12-02 08:18:00
552	38	67	3	2024-12-02 08:18:00	2024-12-02 08:18:41
553	38	68	3	2024-12-02 08:18:31	2024-12-02 08:19:11
554	38	67	3	2024-12-02 08:18:41	2024-12-02 08:19:21
555	38	68	3	2024-12-02 08:19:11	2024-12-02 08:19:52
556	38	67	3	2024-12-02 08:19:21	2024-12-02 08:20:01
557	38	68	3	2024-12-02 08:19:52	2024-12-02 08:20:32
558	38	67	3	2024-12-02 08:20:01	2024-12-02 08:20:42
559	38	68	3	2024-12-02 08:20:32	2024-12-02 08:21:12
560	38	67	3	2024-12-02 08:20:42	2024-12-02 08:21:22
561	38	68	3	2024-12-02 08:21:12	2024-12-02 08:21:53
562	38	67	3	2024-12-02 08:21:22	2024-12-02 08:22:02
563	38	68	3	2024-12-02 08:21:53	2024-12-02 08:22:33
564	38	67	3	2024-12-02 08:22:02	2024-12-02 08:22:43
565	38	68	3	2024-12-02 08:22:33	2024-12-02 08:23:13
566	38	67	3	2024-12-02 08:22:43	2024-12-02 08:23:23
567	38	68	3	2024-12-02 08:23:13	2024-12-02 08:23:54
568	38	67	3	2024-12-02 08:23:23	2024-12-02 08:24:03
569	38	68	3	2024-12-02 08:23:54	2024-12-02 08:24:34
570	38	67	3	2024-12-02 08:24:03	2024-12-02 08:24:44
571	38	68	3	2024-12-02 08:24:34	2024-12-02 08:25:15
572	38	67	3	2024-12-02 08:24:44	2024-12-02 08:25:24
573	38	68	3	2024-12-02 08:25:15	2024-12-02 08:25:55
574	38	67	3	2024-12-02 08:25:24	2024-12-02 08:26:05
575	38	68	3	2024-12-02 08:25:55	2024-12-02 08:26:35
576	38	67	3	2024-12-02 08:26:05	2024-12-02 08:26:45
577	38	68	3	2024-12-02 08:26:35	2024-12-02 08:27:16
578	38	67	3	2024-12-02 08:26:45	2024-12-02 08:27:25
579	38	68	3	2024-12-02 08:27:16	2024-12-02 08:27:56
580	38	67	3	2024-12-02 08:27:25	2024-12-02 08:28:06
581	38	68	3	2024-12-02 08:27:56	2024-12-02 08:28:36
582	38	67	3	2024-12-02 08:28:06	2024-12-02 08:28:46
583	38	68	3	2024-12-02 08:28:36	2024-12-02 08:29:17
584	38	67	3	2024-12-02 08:28:46	2024-12-02 08:29:26
585	38	68	3	2024-12-02 08:29:17	2024-12-02 08:29:57
586	38	67	3	2024-12-02 08:29:26	2024-12-02 08:30:07
587	38	68	3	2024-12-02 08:29:57	2024-12-02 08:30:38
588	38	67	3	2024-12-02 08:30:07	2024-12-02 08:30:47
589	38	68	3	2024-12-02 08:30:38	2024-12-02 08:31:18
590	38	67	3	2024-12-02 08:30:47	2024-12-02 08:31:27
591	38	68	3	2024-12-02 08:31:18	2024-12-02 08:31:58
592	38	67	3	2024-12-02 08:31:27	2024-12-02 08:32:08
593	38	68	3	2024-12-02 08:31:58	2024-12-02 08:32:39
594	38	67	3	2024-12-02 08:32:08	2024-12-02 08:32:48
595	38	68	3	2024-12-02 08:32:39	2024-12-02 08:33:19
596	38	67	3	2024-12-02 08:32:48	2024-12-02 08:33:28
597	38	68	3	2024-12-02 08:33:19	2024-12-02 08:34:00
598	38	67	3	2024-12-02 08:33:28	2024-12-02 08:34:09
599	38	68	3	2024-12-02 08:34:00	2024-12-02 08:34:40
600	38	67	3	2024-12-02 08:34:09	2024-12-02 08:34:49
601	38	68	3	2024-12-02 08:34:40	2024-12-02 08:35:20
602	38	67	3	2024-12-02 08:34:49	2024-12-02 08:35:29
603	38	68	3	2024-12-02 08:35:20	2024-12-02 08:36:01
604	38	67	3	2024-12-02 08:35:29	2024-12-02 08:36:10
605	38	68	3	2024-12-02 08:36:01	2024-12-02 08:36:41
606	38	67	3	2024-12-02 08:36:10	2024-12-02 08:36:50
607	38	68	3	2024-12-02 08:36:41	2024-12-02 08:37:21
608	38	67	3	2024-12-02 08:36:50	2024-12-02 08:37:31
609	38	68	3	2024-12-02 08:37:21	2024-12-02 08:38:02
610	38	67	3	2024-12-02 08:37:31	2024-12-02 08:38:11
611	38	68	3	2024-12-02 08:38:02	2024-12-02 08:38:42
612	38	67	3	2024-12-02 08:38:11	2024-12-02 08:38:51
613	38	68	3	2024-12-02 08:38:42	2024-12-02 08:39:23
614	38	67	3	2024-12-02 08:38:51	2024-12-02 08:39:32
615	38	68	3	2024-12-02 08:39:23	2024-12-02 08:40:03
616	38	67	3	2024-12-02 08:39:32	2024-12-02 08:40:12
617	38	68	3	2024-12-02 08:40:03	2024-12-02 08:40:43
618	38	67	3	2024-12-02 08:40:12	2024-12-02 08:40:52
619	38	68	3	2024-12-02 08:40:43	2024-12-02 08:41:24
620	38	67	3	2024-12-02 08:40:52	2024-12-02 08:41:33
621	38	68	3	2024-12-02 08:41:24	2024-12-02 08:42:04
622	38	67	3	2024-12-02 08:41:33	2024-12-02 08:42:13
623	38	68	3	2024-12-02 08:42:04	2024-12-02 08:42:44
624	38	67	3	2024-12-02 08:42:13	2024-12-02 08:42:53
625	38	68	3	2024-12-02 08:42:44	2024-12-02 08:43:25
626	38	67	3	2024-12-02 08:42:53	2024-12-02 08:43:34
627	38	68	3	2024-12-02 08:43:25	2024-12-02 08:44:05
628	38	67	3	2024-12-02 08:43:34	2024-12-02 08:44:14
629	38	68	3	2024-12-02 08:44:05	2024-12-02 08:44:45
630	38	67	3	2024-12-02 08:44:14	2024-12-02 08:44:54
631	38	68	3	2024-12-02 08:44:45	2024-12-02 08:45:26
632	38	67	3	2024-12-02 08:44:54	2024-12-02 08:45:35
633	38	68	3	2024-12-02 08:45:26	2024-12-02 08:46:06
634	38	67	3	2024-12-02 08:45:35	2024-12-02 08:46:15
635	38	68	3	2024-12-02 08:46:06	2024-12-02 08:46:47
636	38	67	3	2024-12-02 08:46:15	2024-12-02 08:46:55
637	38	68	3	2024-12-02 08:46:47	2024-12-02 08:47:27
638	38	67	3	2024-12-02 08:46:55	2024-12-02 08:47:36
639	38	68	3	2024-12-02 08:47:27	2024-12-02 08:48:07
640	38	67	3	2024-12-02 08:47:36	2024-12-02 08:48:16
641	38	68	3	2024-12-02 08:48:07	2024-12-02 08:48:48
642	38	67	3	2024-12-02 08:48:16	2024-12-02 08:48:57
643	38	68	3	2024-12-02 08:48:48	2024-12-02 08:49:28
644	38	67	3	2024-12-02 08:48:57	2024-12-02 08:49:37
3854	38	81	3	2024-12-03 21:08:40	2024-12-03 21:09:20
645	38	68	3	2024-12-02 08:49:28	2024-12-02 08:50:08
647	38	68	3	2024-12-02 08:50:08	2024-12-02 08:50:49
649	38	68	3	2024-12-02 08:50:49	2024-12-02 08:51:29
651	38	68	3	2024-12-02 08:51:29	2024-12-02 08:52:10
653	38	68	3	2024-12-02 08:52:10	2024-12-02 08:52:50
655	38	68	3	2024-12-02 08:52:50	2024-12-02 08:53:30
657	38	68	3	2024-12-02 08:53:30	2024-12-02 08:54:11
3861	38	81	3	2024-12-03 21:09:20	2024-12-03 21:10:00
3868	38	81	3	2024-12-03 21:10:00	2024-12-03 21:10:41
3875	38	81	3	2024-12-03 21:10:41	2024-12-03 21:11:21
3882	38	81	3	2024-12-03 21:11:21	2024-12-03 21:12:01
4817	38	84	3	2024-12-03 22:41:18	2024-12-03 22:41:58
4824	38	84	3	2024-12-03 22:41:58	2024-12-03 22:42:39
4831	38	84	3	2024-12-03 22:42:39	2024-12-03 22:43:19
4838	38	84	3	2024-12-03 22:43:19	2024-12-03 22:43:59
4845	38	84	3	2024-12-03 22:43:59	2024-12-03 22:44:40
4852	38	84	3	2024-12-03 22:44:40	2024-12-03 22:45:20
4859	38	84	3	2024-12-03 22:45:20	2024-12-03 22:46:00
4866	38	84	3	2024-12-03 22:46:00	2024-12-03 22:46:41
4873	38	84	3	2024-12-03 22:46:41	2024-12-03 22:47:21
646	38	67	3	2024-12-02 08:49:37	2024-12-02 08:50:17
648	38	67	3	2024-12-02 08:50:17	2024-12-02 08:50:58
650	38	67	3	2024-12-02 08:50:58	2024-12-02 08:51:38
652	38	67	3	2024-12-02 08:51:38	2024-12-02 08:52:18
654	38	67	3	2024-12-02 08:52:18	2024-12-02 08:52:59
656	38	67	3	2024-12-02 08:52:59	2024-12-02 08:53:39
658	38	67	3	2024-12-02 08:53:39	2024-12-02 08:54:19
659	38	68	3	2024-12-02 08:54:11	2024-12-02 08:54:51
660	38	67	3	2024-12-02 08:54:19	2024-12-02 08:55:00
661	38	68	3	2024-12-02 08:54:51	2024-12-02 08:55:32
662	38	67	3	2024-12-02 08:55:00	2024-12-02 08:55:40
663	38	68	3	2024-12-02 08:55:32	2024-12-02 08:56:12
664	38	67	3	2024-12-02 08:55:40	2024-12-02 08:56:20
665	38	68	3	2024-12-02 08:56:12	2024-12-02 08:56:52
666	38	67	3	2024-12-02 08:56:20	2024-12-02 08:57:01
667	38	68	3	2024-12-02 08:56:52	2024-12-02 08:57:33
668	38	67	3	2024-12-02 08:57:01	2024-12-02 08:57:41
669	38	68	3	2024-12-02 08:57:33	2024-12-02 08:58:13
670	38	67	3	2024-12-02 08:57:41	2024-12-02 08:58:21
671	38	68	3	2024-12-02 08:58:13	2024-12-02 08:58:53
672	38	67	3	2024-12-02 08:58:21	2024-12-02 08:59:02
673	38	68	3	2024-12-02 08:58:53	2024-12-02 08:59:34
674	38	67	3	2024-12-02 08:59:02	2024-12-02 08:59:42
675	38	68	3	2024-12-02 08:59:34	2024-12-02 09:00:14
676	38	67	3	2024-12-02 08:59:42	2024-12-02 09:00:23
677	38	68	3	2024-12-02 09:00:14	2024-12-02 09:00:55
678	38	67	3	2024-12-02 09:00:23	2024-12-02 09:01:03
679	38	68	3	2024-12-02 09:00:55	2024-12-02 09:01:35
680	38	67	3	2024-12-02 09:01:03	2024-12-02 09:01:43
681	38	68	3	2024-12-02 09:01:35	2024-12-02 09:02:15
682	38	67	3	2024-12-02 09:01:43	2024-12-02 09:02:24
683	38	68	3	2024-12-02 09:02:15	2024-12-02 09:02:56
684	38	67	3	2024-12-02 09:02:24	2024-12-02 09:03:04
685	38	68	3	2024-12-02 09:02:56	2024-12-02 09:03:36
686	38	67	3	2024-12-02 09:03:04	2024-12-02 09:03:44
687	38	68	3	2024-12-02 09:03:36	2024-12-02 09:04:17
688	38	67	3	2024-12-02 09:03:44	2024-12-02 09:04:25
689	38	68	3	2024-12-02 09:04:17	2024-12-02 09:04:57
690	38	67	3	2024-12-02 09:04:25	2024-12-02 09:05:05
691	38	68	3	2024-12-02 09:04:57	2024-12-02 09:05:37
692	38	67	3	2024-12-02 09:05:05	2024-12-02 09:05:45
693	38	68	3	2024-12-02 09:05:37	2024-12-02 09:06:18
694	38	67	3	2024-12-02 09:05:45	2024-12-02 09:06:26
695	38	68	3	2024-12-02 09:06:18	2024-12-02 09:06:58
696	38	67	3	2024-12-02 09:06:26	2024-12-02 09:07:06
697	38	68	3	2024-12-02 09:06:58	2024-12-02 09:07:38
698	38	67	3	2024-12-02 09:07:06	2024-12-02 09:07:47
699	38	68	3	2024-12-02 09:07:38	2024-12-02 09:08:19
700	38	67	3	2024-12-02 09:07:47	2024-12-02 09:08:27
701	38	68	3	2024-12-02 09:08:19	2024-12-02 09:08:59
702	38	67	3	2024-12-02 09:08:27	2024-12-02 09:09:08
703	38	68	3	2024-12-02 09:08:59	2024-12-02 09:09:39
704	38	67	3	2024-12-02 09:09:08	2024-12-02 09:09:48
705	38	68	3	2024-12-02 09:09:39	2024-12-02 09:10:20
706	38	67	3	2024-12-02 09:09:48	2024-12-02 09:10:28
707	38	68	3	2024-12-02 09:10:20	2024-12-02 09:11:00
708	38	67	3	2024-12-02 09:10:28	2024-12-02 09:11:09
709	38	68	3	2024-12-02 09:11:00	2024-12-02 09:11:41
710	38	67	3	2024-12-02 09:11:09	2024-12-02 09:11:49
711	38	68	3	2024-12-02 09:11:41	2024-12-02 09:12:21
712	38	67	3	2024-12-02 09:11:49	2024-12-02 09:12:29
713	38	68	3	2024-12-02 09:12:21	2024-12-02 09:13:01
714	38	67	3	2024-12-02 09:12:29	2024-12-02 09:13:10
715	38	68	3	2024-12-02 09:13:01	2024-12-02 09:13:42
716	38	67	3	2024-12-02 09:13:10	2024-12-02 09:13:50
717	38	68	3	2024-12-02 09:13:42	2024-12-02 09:14:22
718	38	67	3	2024-12-02 09:13:50	2024-12-02 09:14:30
719	38	68	3	2024-12-02 09:14:22	2024-12-02 09:15:02
720	38	67	3	2024-12-02 09:14:30	2024-12-02 09:15:11
721	38	68	3	2024-12-02 09:15:02	2024-12-02 09:15:42
722	38	67	3	2024-12-02 09:15:11	2024-12-02 09:15:51
723	38	68	3	2024-12-02 09:15:42	2024-12-02 09:16:23
724	38	67	3	2024-12-02 09:15:51	2024-12-02 09:16:31
725	38	68	3	2024-12-02 09:16:23	2024-12-02 09:17:03
726	38	67	3	2024-12-02 09:16:31	2024-12-02 09:17:12
727	38	68	3	2024-12-02 09:17:03	2024-12-02 09:17:43
728	38	67	3	2024-12-02 09:17:12	2024-12-02 09:17:52
729	38	68	3	2024-12-02 09:17:43	2024-12-02 09:18:24
730	38	67	3	2024-12-02 09:17:52	2024-12-02 09:18:33
731	38	68	3	2024-12-02 09:18:24	2024-12-02 09:19:04
732	38	67	3	2024-12-02 09:18:33	2024-12-02 09:19:13
733	38	68	3	2024-12-02 09:19:04	2024-12-02 09:19:44
734	38	67	3	2024-12-02 09:19:13	2024-12-02 09:19:53
735	38	68	3	2024-12-02 09:19:44	2024-12-02 09:20:25
736	38	67	3	2024-12-02 09:19:53	2024-12-02 09:20:34
737	38	68	3	2024-12-02 09:20:25	2024-12-02 09:21:05
738	38	67	3	2024-12-02 09:20:34	2024-12-02 09:21:14
739	38	68	3	2024-12-02 09:21:05	2024-12-02 09:21:46
740	38	67	3	2024-12-02 09:21:14	2024-12-02 09:21:54
741	38	68	3	2024-12-02 09:21:46	2024-12-02 09:22:26
742	38	67	3	2024-12-02 09:21:54	2024-12-02 09:22:35
743	38	68	3	2024-12-02 09:22:26	2024-12-02 09:23:06
744	38	67	3	2024-12-02 09:22:35	2024-12-02 09:23:15
745	38	68	3	2024-12-02 09:23:06	2024-12-02 09:23:47
746	38	67	3	2024-12-02 09:23:15	2024-12-02 09:23:55
747	38	68	3	2024-12-02 09:23:47	2024-12-02 09:24:27
748	38	67	3	2024-12-02 09:23:55	2024-12-02 09:24:36
749	38	68	3	2024-12-02 09:24:27	2024-12-02 09:25:07
750	38	67	3	2024-12-02 09:24:36	2024-12-02 09:25:16
751	38	68	3	2024-12-02 09:25:07	2024-12-02 09:25:48
752	38	67	3	2024-12-02 09:25:16	2024-12-02 09:25:57
753	38	68	3	2024-12-02 09:25:48	2024-12-02 09:26:28
754	38	67	3	2024-12-02 09:25:57	2024-12-02 09:26:37
755	38	68	3	2024-12-02 09:26:28	2024-12-02 09:27:08
756	38	67	3	2024-12-02 09:26:37	2024-12-02 09:27:17
757	38	68	3	2024-12-02 09:27:08	2024-12-02 09:27:49
758	38	67	3	2024-12-02 09:27:17	2024-12-02 09:27:58
759	38	68	3	2024-12-02 09:27:49	2024-12-02 09:28:29
760	38	67	3	2024-12-02 09:27:58	2024-12-02 09:28:38
761	38	68	3	2024-12-02 09:28:29	2024-12-02 09:29:09
762	38	67	3	2024-12-02 09:28:38	2024-12-02 09:29:18
763	38	68	3	2024-12-02 09:29:09	2024-12-02 09:29:50
3856	38	88	3	2024-12-03 21:08:48	2024-12-03 21:09:28
764	38	67	3	2024-12-02 09:29:18	2024-12-02 09:29:59
766	38	67	3	2024-12-02 09:29:59	2024-12-02 09:30:39
768	38	67	3	2024-12-02 09:30:39	2024-12-02 09:31:19
770	38	67	3	2024-12-02 09:31:19	2024-12-02 09:32:00
772	38	67	3	2024-12-02 09:32:00	2024-12-02 09:32:40
774	38	67	3	2024-12-02 09:32:40	2024-12-02 09:33:21
3863	38	88	3	2024-12-03 21:09:28	2024-12-03 21:10:09
3870	38	88	3	2024-12-03 21:10:09	2024-12-03 21:10:49
3877	38	88	3	2024-12-03 21:10:49	2024-12-03 21:11:30
3884	38	88	3	2024-12-03 21:11:30	2024-12-03 21:12:10
4819	38	86	3	2024-12-03 22:41:27	2024-12-03 22:42:07
4826	38	86	3	2024-12-03 22:42:07	2024-12-03 22:42:48
4833	38	86	3	2024-12-03 22:42:48	2024-12-03 22:43:28
4840	38	86	3	2024-12-03 22:43:28	2024-12-03 22:44:08
4847	38	86	3	2024-12-03 22:44:08	2024-12-03 22:44:49
4854	38	86	3	2024-12-03 22:44:49	2024-12-03 22:45:29
4861	38	86	3	2024-12-03 22:45:29	2024-12-03 22:46:09
4868	38	86	3	2024-12-03 22:46:09	2024-12-03 22:46:50
4875	38	86	3	2024-12-03 22:46:50	2024-12-03 22:47:30
765	38	68	3	2024-12-02 09:29:50	2024-12-02 09:30:30
767	38	68	3	2024-12-02 09:30:30	2024-12-02 09:31:10
769	38	68	3	2024-12-02 09:31:10	2024-12-02 09:31:51
771	38	68	3	2024-12-02 09:31:51	2024-12-02 09:32:31
773	38	68	3	2024-12-02 09:32:31	2024-12-02 09:33:11
775	38	68	3	2024-12-02 09:33:11	2024-12-02 09:33:52
776	38	67	3	2024-12-02 09:33:21	2024-12-02 09:34:01
777	38	68	3	2024-12-02 09:33:52	2024-12-02 09:34:32
778	38	67	3	2024-12-02 09:34:01	2024-12-02 09:34:41
779	38	68	3	2024-12-02 09:34:32	2024-12-02 09:35:12
780	38	67	3	2024-12-02 09:34:41	2024-12-02 09:35:22
781	38	68	3	2024-12-02 09:35:12	2024-12-02 09:35:53
782	38	67	3	2024-12-02 09:35:22	2024-12-02 09:36:02
783	38	68	3	2024-12-02 09:35:53	2024-12-02 09:36:33
784	38	67	3	2024-12-02 09:36:02	2024-12-02 09:36:42
785	38	68	3	2024-12-02 09:36:33	2024-12-02 09:37:13
786	38	67	3	2024-12-02 09:36:42	2024-12-02 09:37:23
787	38	68	3	2024-12-02 09:37:13	2024-12-02 09:37:54
788	38	67	3	2024-12-02 09:37:23	2024-12-02 09:38:03
789	38	68	3	2024-12-02 09:37:54	2024-12-02 09:38:34
790	38	67	3	2024-12-02 09:38:03	2024-12-02 09:38:43
791	38	68	3	2024-12-02 09:38:34	2024-12-02 09:39:14
792	38	67	3	2024-12-02 09:38:43	2024-12-02 09:39:24
793	38	68	3	2024-12-02 09:39:14	2024-12-02 09:39:55
794	38	67	3	2024-12-02 09:39:24	2024-12-02 09:40:04
795	38	68	3	2024-12-02 09:39:55	2024-12-02 09:40:35
796	38	67	3	2024-12-02 09:40:04	2024-12-02 09:40:45
797	38	68	3	2024-12-02 09:40:35	2024-12-02 09:41:15
798	38	67	3	2024-12-02 09:40:45	2024-12-02 09:41:25
799	38	68	3	2024-12-02 09:41:15	2024-12-02 09:41:56
800	38	67	3	2024-12-02 09:41:25	2024-12-02 09:42:05
801	38	68	3	2024-12-02 09:41:56	2024-12-02 09:42:36
802	38	67	3	2024-12-02 09:42:05	2024-12-02 09:42:46
803	38	68	3	2024-12-02 09:42:36	2024-12-02 09:43:16
804	38	67	3	2024-12-02 09:42:46	2024-12-02 09:43:26
805	38	68	3	2024-12-02 09:43:16	2024-12-02 09:43:57
806	38	67	3	2024-12-02 09:43:26	2024-12-02 09:44:06
807	38	68	3	2024-12-02 09:43:57	2024-12-02 09:44:37
808	38	67	3	2024-12-02 09:44:06	2024-12-02 09:44:47
809	38	68	3	2024-12-02 09:44:37	2024-12-02 09:45:17
810	38	67	3	2024-12-02 09:44:47	2024-12-02 09:45:27
811	38	68	3	2024-12-02 09:45:17	2024-12-02 09:45:58
812	38	67	3	2024-12-02 09:45:27	2024-12-02 09:46:08
813	38	68	3	2024-12-02 09:45:58	2024-12-02 09:46:38
814	38	67	3	2024-12-02 09:46:08	2024-12-02 09:46:48
815	38	68	3	2024-12-02 09:46:38	2024-12-02 09:47:18
816	38	67	3	2024-12-02 09:46:48	2024-12-02 09:47:29
817	38	68	3	2024-12-02 09:47:18	2024-12-02 09:47:59
818	38	67	3	2024-12-02 09:47:29	2024-12-02 09:48:09
819	38	68	3	2024-12-02 09:47:59	2024-12-02 09:48:39
820	38	67	3	2024-12-02 09:48:09	2024-12-02 09:48:49
821	38	68	3	2024-12-02 09:48:39	2024-12-02 09:49:19
822	38	67	3	2024-12-02 09:48:49	2024-12-02 09:49:30
823	38	68	3	2024-12-02 09:49:19	2024-12-02 09:50:00
824	38	67	3	2024-12-02 09:49:30	2024-12-02 09:50:10
825	38	68	3	2024-12-02 09:50:00	2024-12-02 09:50:40
826	38	67	3	2024-12-02 09:50:10	2024-12-02 09:50:50
827	38	68	3	2024-12-02 09:50:40	2024-12-02 09:51:20
828	38	67	3	2024-12-02 09:50:50	2024-12-02 09:51:31
829	38	68	3	2024-12-02 09:51:20	2024-12-02 09:52:01
830	38	67	3	2024-12-02 09:51:31	2024-12-02 09:52:11
831	38	68	3	2024-12-02 09:52:01	2024-12-02 09:52:41
832	38	67	3	2024-12-02 09:52:11	2024-12-02 09:52:52
833	38	68	3	2024-12-02 09:52:41	2024-12-02 09:53:21
834	38	67	3	2024-12-02 09:52:52	2024-12-02 09:53:32
835	38	68	3	2024-12-02 09:53:21	2024-12-02 09:54:02
836	38	67	3	2024-12-02 09:53:32	2024-12-02 09:54:12
837	38	68	3	2024-12-02 09:54:02	2024-12-02 09:54:42
838	38	67	3	2024-12-02 09:54:12	2024-12-02 09:54:53
839	38	68	3	2024-12-02 09:54:42	2024-12-02 09:55:22
840	38	67	3	2024-12-02 09:54:53	2024-12-02 09:55:33
841	38	68	3	2024-12-02 09:55:22	2024-12-02 09:56:03
842	38	67	3	2024-12-02 09:55:33	2024-12-02 09:56:13
843	38	68	3	2024-12-02 09:56:03	2024-12-02 09:56:43
844	38	67	3	2024-12-02 09:56:13	2024-12-02 09:56:54
845	38	68	3	2024-12-02 09:56:43	2024-12-02 09:57:23
846	38	67	3	2024-12-02 09:56:54	2024-12-02 09:57:34
847	38	68	3	2024-12-02 09:57:23	2024-12-02 09:58:04
848	38	67	3	2024-12-02 09:57:34	2024-12-02 09:58:15
849	38	68	3	2024-12-02 09:58:04	2024-12-02 09:58:44
850	38	67	3	2024-12-02 09:58:15	2024-12-02 09:58:55
851	38	68	3	2024-12-02 09:58:44	2024-12-02 09:59:24
852	38	67	3	2024-12-02 09:58:55	2024-12-02 09:59:35
853	38	68	3	2024-12-02 09:59:24	2024-12-02 10:00:05
854	38	67	3	2024-12-02 09:59:35	2024-12-02 10:00:16
855	38	68	3	2024-12-02 10:00:05	2024-12-02 10:00:45
856	38	67	3	2024-12-02 10:00:16	2024-12-02 10:00:56
857	38	68	3	2024-12-02 10:00:45	2024-12-02 10:01:25
858	38	67	3	2024-12-02 10:00:56	2024-12-02 10:01:36
859	38	68	3	2024-12-02 10:01:25	2024-12-02 10:02:06
860	38	67	3	2024-12-02 10:01:36	2024-12-02 10:02:17
861	38	68	3	2024-12-02 10:02:06	2024-12-02 10:02:46
862	38	67	3	2024-12-02 10:02:17	2024-12-02 10:02:57
863	38	68	3	2024-12-02 10:02:46	2024-12-02 10:03:27
864	38	67	3	2024-12-02 10:02:57	2024-12-02 10:03:37
865	38	68	3	2024-12-02 10:03:27	2024-12-02 10:04:07
866	38	67	3	2024-12-02 10:03:37	2024-12-02 10:04:18
867	38	68	3	2024-12-02 10:04:07	2024-12-02 10:04:47
868	38	67	3	2024-12-02 10:04:18	2024-12-02 10:04:58
869	38	68	3	2024-12-02 10:04:47	2024-12-02 10:05:28
870	38	67	3	2024-12-02 10:04:58	2024-12-02 10:05:38
871	38	68	3	2024-12-02 10:05:28	2024-12-02 10:06:08
872	38	67	3	2024-12-02 10:05:38	2024-12-02 10:06:19
873	38	68	3	2024-12-02 10:06:08	2024-12-02 10:06:49
874	38	67	3	2024-12-02 10:06:19	2024-12-02 10:06:59
875	38	68	3	2024-12-02 10:06:49	2024-12-02 10:07:29
876	38	67	3	2024-12-02 10:06:59	2024-12-02 10:07:40
877	38	68	3	2024-12-02 10:07:29	2024-12-02 10:08:09
878	38	67	3	2024-12-02 10:07:40	2024-12-02 10:08:20
879	38	68	3	2024-12-02 10:08:09	2024-12-02 10:08:50
880	38	67	3	2024-12-02 10:08:20	2024-12-02 10:09:01
881	38	68	3	2024-12-02 10:08:50	2024-12-02 10:09:30
3858	38	84	3	2024-12-03 21:09:06	2024-12-03 21:09:46
882	38	67	3	2024-12-02 10:09:01	2024-12-02 10:09:41
884	38	67	3	2024-12-02 10:09:41	2024-12-02 10:10:21
886	38	67	3	2024-12-02 10:10:21	2024-12-02 10:11:01
888	38	67	3	2024-12-02 10:11:02	2024-12-02 10:11:42
890	38	67	3	2024-12-02 10:11:42	2024-12-02 10:12:22
892	38	67	3	2024-12-02 10:12:22	2024-12-02 10:13:03
894	38	67	3	2024-12-02 10:13:03	2024-12-02 10:13:43
896	38	67	3	2024-12-02 10:13:43	2024-12-02 10:14:23
898	38	67	3	2024-12-02 10:14:23	2024-12-02 10:15:04
900	38	67	3	2024-12-02 10:15:04	2024-12-02 10:15:44
902	38	67	3	2024-12-02 10:15:44	2024-12-02 10:16:24
904	38	67	3	2024-12-02 10:16:24	2024-12-02 10:17:04
3865	38	84	3	2024-12-03 21:09:46	2024-12-03 21:10:27
3872	38	84	3	2024-12-03 21:10:27	2024-12-03 21:11:07
3879	38	84	3	2024-12-03 21:11:07	2024-12-03 21:11:47
4821	38	82	3	2024-12-03 22:41:35	2024-12-03 22:42:16
4828	38	82	3	2024-12-03 22:42:16	2024-12-03 22:42:56
4835	38	82	3	2024-12-03 22:42:56	2024-12-03 22:43:36
4842	38	82	3	2024-12-03 22:43:36	2024-12-03 22:44:17
4849	38	82	3	2024-12-03 22:44:17	2024-12-03 22:44:57
4856	38	82	3	2024-12-03 22:44:57	2024-12-03 22:45:37
4863	38	82	3	2024-12-03 22:45:37	2024-12-03 22:46:18
4870	38	82	3	2024-12-03 22:46:18	2024-12-03 22:46:58
4877	38	82	3	2024-12-03 22:46:58	2024-12-03 22:47:38
883	38	68	3	2024-12-02 10:09:30	2024-12-02 10:10:10
885	38	68	3	2024-12-02 10:10:10	2024-12-02 10:10:51
887	38	68	3	2024-12-02 10:10:51	2024-12-02 10:11:31
889	38	68	3	2024-12-02 10:11:31	2024-12-02 10:12:12
891	38	68	3	2024-12-02 10:12:12	2024-12-02 10:12:52
893	38	68	3	2024-12-02 10:12:52	2024-12-02 10:13:32
895	38	68	3	2024-12-02 10:13:32	2024-12-02 10:14:13
897	38	68	3	2024-12-02 10:14:13	2024-12-02 10:14:53
899	38	68	3	2024-12-02 10:14:53	2024-12-02 10:15:33
901	38	68	3	2024-12-02 10:15:33	2024-12-02 10:16:14
903	38	68	3	2024-12-02 10:16:14	2024-12-02 10:16:54
905	38	68	3	2024-12-02 10:16:54	2024-12-02 10:17:35
906	38	67	3	2024-12-02 10:17:04	2024-12-02 10:17:45
907	38	68	3	2024-12-02 10:17:35	2024-12-02 10:18:15
908	38	67	3	2024-12-02 10:17:45	2024-12-02 10:18:25
909	38	68	3	2024-12-02 10:18:15	2024-12-02 10:18:55
910	38	67	3	2024-12-02 10:18:25	2024-12-02 10:19:06
911	38	68	3	2024-12-02 10:18:55	2024-12-02 10:19:36
912	38	67	3	2024-12-02 10:19:06	2024-12-02 10:19:46
913	38	68	3	2024-12-02 10:19:36	2024-12-02 10:20:16
914	38	67	3	2024-12-02 10:19:46	2024-12-02 10:20:26
915	38	68	3	2024-12-02 10:20:16	2024-12-02 10:20:56
916	38	67	3	2024-12-02 10:20:26	2024-12-02 10:21:07
917	38	68	3	2024-12-02 10:20:56	2024-12-02 10:21:37
918	38	67	3	2024-12-02 10:21:07	2024-12-02 10:21:47
919	38	68	3	2024-12-02 10:21:37	2024-12-02 10:22:17
920	38	67	3	2024-12-02 10:21:47	2024-12-02 10:22:27
921	38	68	3	2024-12-02 10:22:17	2024-12-02 10:22:58
922	38	67	3	2024-12-02 10:22:27	2024-12-02 10:23:08
923	38	68	3	2024-12-02 10:22:58	2024-12-02 10:23:38
924	38	67	3	2024-12-02 10:23:08	2024-12-02 10:23:48
925	38	68	3	2024-12-02 10:23:38	2024-12-02 10:24:18
926	38	67	3	2024-12-02 10:23:48	2024-12-02 10:24:28
927	38	68	3	2024-12-02 10:24:18	2024-12-02 10:24:59
928	38	67	3	2024-12-02 10:24:28	2024-12-02 10:25:08
929	38	68	3	2024-12-02 10:24:59	2024-12-02 10:25:39
930	38	67	3	2024-12-02 10:25:08	2024-12-02 10:25:49
931	38	68	3	2024-12-02 10:25:39	2024-12-02 10:26:19
932	38	67	3	2024-12-02 10:25:49	2024-12-02 10:26:29
933	38	68	3	2024-12-02 10:26:19	2024-12-02 10:27:00
934	38	67	3	2024-12-02 10:26:29	2024-12-02 10:27:10
935	38	68	3	2024-12-02 10:27:00	2024-12-02 10:27:40
936	38	67	3	2024-12-02 10:27:10	2024-12-02 10:27:50
937	38	68	3	2024-12-02 10:27:40	2024-12-02 10:28:20
938	38	67	3	2024-12-02 10:27:50	2024-12-02 10:28:30
939	38	68	3	2024-12-02 10:28:20	2024-12-02 10:29:01
940	38	67	3	2024-12-02 10:28:30	2024-12-02 10:29:11
941	38	68	3	2024-12-02 10:29:01	2024-12-02 10:29:41
942	38	67	3	2024-12-02 10:29:11	2024-12-02 10:29:51
943	38	68	3	2024-12-02 10:29:41	2024-12-02 10:30:22
944	38	67	3	2024-12-02 10:29:51	2024-12-02 10:30:31
945	38	68	3	2024-12-02 10:30:22	2024-12-02 10:31:02
946	38	67	3	2024-12-02 10:30:31	2024-12-02 10:31:12
947	38	68	3	2024-12-02 10:31:02	2024-12-02 10:31:42
948	38	67	3	2024-12-02 10:31:12	2024-12-02 10:31:52
949	38	68	3	2024-12-02 10:31:42	2024-12-02 10:32:23
950	38	67	3	2024-12-02 10:31:52	2024-12-02 10:32:32
951	38	68	3	2024-12-02 10:32:23	2024-12-02 10:33:03
952	38	67	3	2024-12-02 10:32:32	2024-12-02 10:33:13
953	38	68	3	2024-12-02 10:33:03	2024-12-02 10:33:43
954	38	67	3	2024-12-02 10:33:13	2024-12-02 10:33:53
955	38	68	3	2024-12-02 10:33:43	2024-12-02 10:34:24
956	38	67	3	2024-12-02 10:33:53	2024-12-02 10:34:33
957	38	68	3	2024-12-02 10:34:24	2024-12-02 10:35:04
958	38	67	3	2024-12-02 10:34:33	2024-12-02 10:35:14
959	38	68	3	2024-12-02 10:35:04	2024-12-02 10:35:45
960	38	67	3	2024-12-02 10:35:14	2024-12-02 10:35:54
961	38	68	3	2024-12-02 10:35:45	2024-12-02 10:36:25
962	38	67	3	2024-12-02 10:35:54	2024-12-02 10:36:34
963	38	68	3	2024-12-02 10:36:25	2024-12-02 10:37:05
964	38	67	3	2024-12-02 10:36:34	2024-12-02 10:37:15
965	38	68	3	2024-12-02 10:37:05	2024-12-02 10:37:46
966	38	67	3	2024-12-02 10:37:15	2024-12-02 10:37:55
967	38	68	3	2024-12-02 10:37:46	2024-12-02 10:38:26
968	38	67	3	2024-12-02 10:37:55	2024-12-02 10:38:35
969	38	68	3	2024-12-02 10:38:26	2024-12-02 10:39:06
970	38	67	3	2024-12-02 10:38:35	2024-12-02 10:39:16
971	38	68	3	2024-12-02 10:39:06	2024-12-02 10:39:47
972	38	67	3	2024-12-02 10:39:16	2024-12-02 10:39:56
973	38	68	3	2024-12-02 10:39:47	2024-12-02 10:40:27
974	38	67	3	2024-12-02 10:39:56	2024-12-02 10:40:36
975	38	68	3	2024-12-02 10:40:27	2024-12-02 10:41:08
976	38	67	3	2024-12-02 10:40:36	2024-12-02 10:41:17
977	38	68	3	2024-12-02 10:41:08	2024-12-02 10:41:48
978	38	67	3	2024-12-02 10:41:17	2024-12-02 10:41:57
979	38	68	3	2024-12-02 10:41:48	2024-12-02 10:42:28
980	38	67	3	2024-12-02 10:41:57	2024-12-02 10:42:37
981	38	68	3	2024-12-02 10:42:28	2024-12-02 10:43:09
982	38	67	3	2024-12-02 10:42:37	2024-12-02 10:43:18
983	38	68	3	2024-12-02 10:43:09	2024-12-02 10:43:49
984	38	67	3	2024-12-02 10:43:18	2024-12-02 10:43:58
985	38	68	3	2024-12-02 10:43:49	2024-12-02 10:44:29
986	38	67	3	2024-12-02 10:43:58	2024-12-02 10:44:38
987	38	68	3	2024-12-02 10:44:29	2024-12-02 10:45:10
988	38	67	3	2024-12-02 10:44:38	2024-12-02 10:45:19
989	38	68	3	2024-12-02 10:45:10	2024-12-02 10:45:50
990	38	67	3	2024-12-02 10:45:19	2024-12-02 10:45:59
991	38	68	3	2024-12-02 10:45:50	2024-12-02 10:46:31
992	38	67	3	2024-12-02 10:45:59	2024-12-02 10:46:39
993	38	68	3	2024-12-02 10:46:31	2024-12-02 10:47:11
994	38	67	3	2024-12-02 10:46:39	2024-12-02 10:47:20
995	38	68	3	2024-12-02 10:47:11	2024-12-02 10:47:51
996	38	67	3	2024-12-02 10:47:20	2024-12-02 10:48:00
997	38	68	3	2024-12-02 10:47:51	2024-12-02 10:48:32
998	38	67	3	2024-12-02 10:48:00	2024-12-02 10:48:40
999	38	68	3	2024-12-02 10:48:32	2024-12-02 10:49:12
1000	38	67	3	2024-12-02 10:48:40	2024-12-02 10:49:21
1001	38	68	3	2024-12-02 10:49:12	2024-12-02 10:49:52
1002	38	67	3	2024-12-02 10:49:21	2024-12-02 10:50:01
1003	38	68	3	2024-12-02 10:49:52	2024-12-02 10:50:33
1004	38	67	3	2024-12-02 10:50:01	2024-12-02 10:50:41
1005	38	68	3	2024-12-02 10:50:33	2024-12-02 10:51:13
1006	38	67	3	2024-12-02 10:50:41	2024-12-02 10:51:22
1008	38	67	3	2024-12-02 10:51:22	2024-12-02 10:52:02
1010	38	67	3	2024-12-02 10:52:02	2024-12-02 10:52:42
1012	38	67	3	2024-12-02 10:52:42	2024-12-02 10:53:23
1014	38	67	3	2024-12-02 10:53:23	2024-12-02 10:54:03
1016	38	67	3	2024-12-02 10:54:03	2024-12-02 10:54:43
1018	38	67	3	2024-12-02 10:54:43	2024-12-02 10:55:24
1020	38	67	3	2024-12-02 10:55:24	2024-12-02 10:56:04
1022	38	67	3	2024-12-02 10:56:04	2024-12-02 10:56:44
1024	38	67	3	2024-12-02 10:56:44	2024-12-02 10:57:25
1026	38	67	3	2024-12-02 10:57:25	2024-12-02 10:58:05
1028	38	67	3	2024-12-02 10:58:05	2024-12-02 10:58:45
1030	38	67	3	2024-12-02 10:58:45	2024-12-02 10:59:26
1032	38	67	3	2024-12-02 10:59:26	2024-12-02 11:00:06
1034	38	67	3	2024-12-02 11:00:06	2024-12-02 11:00:46
1036	38	67	3	2024-12-02 11:00:46	2024-12-02 11:01:27
1038	38	67	3	2024-12-02 11:01:27	2024-12-02 11:02:07
1040	38	67	3	2024-12-02 11:02:07	2024-12-02 11:02:47
1042	38	67	3	2024-12-02 11:02:47	2024-12-02 11:03:28
1044	38	67	3	2024-12-02 11:03:28	2024-12-02 11:04:08
1046	38	67	3	2024-12-02 11:04:08	2024-12-02 11:04:49
1048	38	67	3	2024-12-02 11:04:49	2024-12-02 11:05:29
3887	38	86	3	2024-12-03 21:11:57	2024-12-03 21:12:38
3894	38	86	3	2024-12-03 21:12:38	2024-12-03 21:13:18
3901	38	86	3	2024-12-03 21:13:18	2024-12-03 21:13:58
3908	38	86	3	2024-12-03 21:13:58	2024-12-03 21:14:39
3915	38	86	3	2024-12-03 21:14:39	2024-12-03 21:15:19
3922	38	86	3	2024-12-03 21:15:19	2024-12-03 21:16:00
3929	38	86	3	2024-12-03 21:16:00	2024-12-03 21:16:40
3936	38	86	3	2024-12-03 21:16:40	2024-12-03 21:17:20
3943	38	86	3	2024-12-03 21:17:20	2024-12-03 21:18:01
3950	38	86	3	2024-12-03 21:18:01	2024-12-03 21:18:42
3957	38	86	3	2024-12-03 21:18:42	2024-12-03 21:19:22
3964	38	86	3	2024-12-03 21:19:22	2024-12-03 21:20:02
3971	38	86	3	2024-12-03 21:20:02	2024-12-03 21:20:43
3978	38	86	3	2024-12-03 21:20:43	2024-12-03 21:21:23
3985	38	86	3	2024-12-03 21:21:23	2024-12-03 21:22:03
3992	38	86	3	2024-12-03 21:22:03	2024-12-03 21:22:44
3999	38	86	3	2024-12-03 21:22:44	2024-12-03 21:23:24
4006	38	86	3	2024-12-03 21:23:24	2024-12-03 21:24:04
4013	38	86	3	2024-12-03 21:24:04	2024-12-03 21:24:45
4020	38	86	3	2024-12-03 21:24:45	2024-12-03 21:25:26
4027	38	86	3	2024-12-03 21:25:26	2024-12-03 21:26:06
4034	38	86	3	2024-12-03 21:26:06	2024-12-03 21:26:46
4041	38	86	3	2024-12-03 21:26:46	2024-12-03 21:27:27
4048	38	86	3	2024-12-03 21:27:27	2024-12-03 21:28:07
4055	38	86	3	2024-12-03 21:28:07	2024-12-03 21:28:47
4062	38	86	3	2024-12-03 21:28:47	2024-12-03 21:29:28
4069	38	86	3	2024-12-03 21:29:28	2024-12-03 21:30:08
4076	38	86	3	2024-12-03 21:30:08	2024-12-03 21:30:48
4083	38	86	3	2024-12-03 21:30:48	2024-12-03 21:31:29
4090	38	86	3	2024-12-03 21:31:29	2024-12-03 21:32:09
4097	38	86	3	2024-12-03 21:32:09	2024-12-03 21:32:50
4879	38	83	3	2024-12-03 22:47:09	2024-12-03 22:47:50
4886	38	83	3	2024-12-03 22:47:50	2024-12-03 22:48:30
4893	38	83	3	2024-12-03 22:48:30	2024-12-03 22:49:10
4900	38	83	3	2024-12-03 22:49:10	2024-12-03 22:49:51
4907	38	83	3	2024-12-03 22:49:51	2024-12-03 22:50:31
4914	38	83	3	2024-12-03 22:50:31	2024-12-03 22:51:11
4921	38	83	3	2024-12-03 22:51:11	2024-12-03 22:51:52
4928	38	83	3	2024-12-03 22:51:52	2024-12-03 22:52:32
4935	38	83	3	2024-12-03 22:52:32	2024-12-03 22:53:12
4942	38	83	3	2024-12-03 22:53:12	2024-12-03 22:53:53
4949	38	83	3	2024-12-03 22:53:53	2024-12-03 22:54:33
4956	38	83	3	2024-12-03 22:54:33	2024-12-03 22:55:14
4963	38	83	3	2024-12-03 22:55:14	2024-12-03 22:55:54
4970	38	83	3	2024-12-03 22:55:54	2024-12-03 22:56:34
4977	38	83	3	2024-12-03 22:56:34	2024-12-03 22:57:15
4984	38	83	3	2024-12-03 22:57:15	2024-12-03 22:57:55
4991	38	83	3	2024-12-03 22:57:55	2024-12-03 22:58:35
4998	38	83	3	2024-12-03 22:58:35	2024-12-03 22:59:16
5005	38	83	3	2024-12-03 22:59:16	2024-12-03 22:59:57
5012	38	83	3	2024-12-03 22:59:57	2024-12-03 23:00:38
5019	38	83	3	2024-12-03 23:00:38	2024-12-03 23:01:18
5026	38	83	3	2024-12-03 23:01:18	2024-12-03 23:01:58
5033	38	83	3	2024-12-03 23:01:58	2024-12-03 23:02:39
5040	38	83	3	2024-12-03 23:02:39	2024-12-03 23:03:19
5047	38	83	3	2024-12-03 23:03:19	2024-12-03 23:03:59
5054	38	83	3	2024-12-03 23:03:59	2024-12-03 23:04:40
5061	38	83	3	2024-12-03 23:04:40	2024-12-03 23:05:20
5068	38	83	3	2024-12-03 23:05:20	2024-12-03 23:06:01
5075	38	83	3	2024-12-03 23:06:01	2024-12-03 23:06:41
5082	38	83	3	2024-12-03 23:06:41	2024-12-03 23:07:21
5089	38	83	3	2024-12-03 23:07:21	2024-12-03 23:08:02
5096	38	83	3	2024-12-03 23:08:02	2024-12-03 23:08:42
5103	38	83	3	2024-12-03 23:08:42	2024-12-03 23:09:22
5110	38	83	3	2024-12-03 23:09:22	2024-12-03 23:10:03
5117	38	83	3	2024-12-03 23:10:03	2024-12-03 23:10:43
5124	38	83	3	2024-12-03 23:10:43	2024-12-03 23:11:23
5131	38	83	3	2024-12-03 23:11:23	2024-12-03 23:12:04
5138	38	83	3	2024-12-03 23:12:04	2024-12-03 23:12:44
5145	38	83	3	2024-12-03 23:12:44	2024-12-03 23:13:24
1007	38	68	3	2024-12-02 10:51:13	2024-12-02 10:51:54
1009	38	68	3	2024-12-02 10:51:54	2024-12-02 10:52:34
1011	38	68	3	2024-12-02 10:52:34	2024-12-02 10:53:14
1013	38	68	3	2024-12-02 10:53:14	2024-12-02 10:53:55
1015	38	68	3	2024-12-02 10:53:55	2024-12-02 10:54:35
1017	38	68	3	2024-12-02 10:54:35	2024-12-02 10:55:15
1019	38	68	3	2024-12-02 10:55:15	2024-12-02 10:55:56
1021	38	68	3	2024-12-02 10:55:56	2024-12-02 10:56:36
1023	38	68	3	2024-12-02 10:56:36	2024-12-02 10:57:17
1025	38	68	3	2024-12-02 10:57:17	2024-12-02 10:57:57
1027	38	68	3	2024-12-02 10:57:57	2024-12-02 10:58:37
1029	38	68	3	2024-12-02 10:58:37	2024-12-02 10:59:18
1031	38	68	3	2024-12-02 10:59:18	2024-12-02 10:59:58
1033	38	68	3	2024-12-02 10:59:58	2024-12-02 11:00:38
1035	38	68	3	2024-12-02 11:00:38	2024-12-02 11:01:19
1037	38	68	3	2024-12-02 11:01:19	2024-12-02 11:01:59
1039	38	68	3	2024-12-02 11:01:59	2024-12-02 11:02:39
1041	38	68	3	2024-12-02 11:02:39	2024-12-02 11:03:20
1043	38	68	3	2024-12-02 11:03:20	2024-12-02 11:04:00
1045	38	68	3	2024-12-02 11:04:00	2024-12-02 11:04:41
1047	38	68	3	2024-12-02 11:04:41	2024-12-02 11:05:21
1049	38	68	3	2024-12-02 11:05:21	2024-12-02 11:06:01
1050	38	67	3	2024-12-02 11:05:29	2024-12-02 11:06:09
1051	38	68	3	2024-12-02 11:06:01	2024-12-02 11:06:42
1052	38	67	3	2024-12-02 11:06:09	2024-12-02 11:06:50
1053	38	68	3	2024-12-02 11:06:42	2024-12-02 11:07:22
1054	38	67	3	2024-12-02 11:06:50	2024-12-02 11:07:30
1055	38	68	3	2024-12-02 11:07:22	2024-12-02 11:08:02
1056	38	67	3	2024-12-02 11:07:30	2024-12-02 11:08:10
1057	38	68	3	2024-12-02 11:08:02	2024-12-02 11:08:43
1058	38	67	3	2024-12-02 11:08:10	2024-12-02 11:08:51
1059	38	68	3	2024-12-02 11:08:43	2024-12-02 11:09:23
1060	38	67	3	2024-12-02 11:08:51	2024-12-02 11:09:31
1061	38	68	3	2024-12-02 11:09:23	2024-12-02 11:10:04
1062	38	67	3	2024-12-02 11:09:31	2024-12-02 11:10:11
1063	38	68	3	2024-12-02 11:10:04	2024-12-02 11:10:44
1064	38	67	3	2024-12-02 11:10:11	2024-12-02 11:10:52
1065	38	68	3	2024-12-02 11:10:44	2024-12-02 11:11:24
1066	38	67	3	2024-12-02 11:10:52	2024-12-02 11:11:32
1067	38	68	3	2024-12-02 11:11:24	2024-12-02 11:12:05
1068	38	67	3	2024-12-02 11:11:32	2024-12-02 11:12:12
1069	38	68	3	2024-12-02 11:12:05	2024-12-02 11:12:45
1070	38	67	3	2024-12-02 11:12:12	2024-12-02 11:12:53
1071	38	68	3	2024-12-02 11:12:45	2024-12-02 11:13:25
1072	38	67	3	2024-12-02 11:12:53	2024-12-02 11:13:33
1073	38	68	3	2024-12-02 11:13:25	2024-12-02 11:14:06
1074	38	67	3	2024-12-02 11:13:33	2024-12-02 11:14:14
1075	38	68	3	2024-12-02 11:14:06	2024-12-02 11:14:46
1076	38	67	3	2024-12-02 11:14:14	2024-12-02 11:14:54
1077	38	68	3	2024-12-02 11:14:46	2024-12-02 11:15:26
1078	38	67	3	2024-12-02 11:14:54	2024-12-02 11:15:35
1079	38	68	3	2024-12-02 11:15:26	2024-12-02 11:16:07
1080	38	67	3	2024-12-02 11:15:35	2024-12-02 11:16:15
1081	38	68	3	2024-12-02 11:16:07	2024-12-02 11:16:47
1082	38	67	3	2024-12-02 11:16:15	2024-12-02 11:16:55
1083	38	68	3	2024-12-02 11:16:47	2024-12-02 11:17:28
1084	38	67	3	2024-12-02 11:16:55	2024-12-02 11:17:36
1085	38	68	3	2024-12-02 11:17:28	2024-12-02 11:18:08
1086	38	67	3	2024-12-02 11:17:36	2024-12-02 11:18:16
1087	38	68	3	2024-12-02 11:18:08	2024-12-02 11:18:48
1088	38	67	3	2024-12-02 11:18:16	2024-12-02 11:18:56
1089	38	68	3	2024-12-02 11:18:48	2024-12-02 11:19:29
1090	38	67	3	2024-12-02 11:18:56	2024-12-02 11:19:37
1091	38	68	3	2024-12-02 11:19:29	2024-12-02 11:20:09
1092	38	67	3	2024-12-02 11:19:37	2024-12-02 11:20:17
1093	38	68	3	2024-12-02 11:20:09	2024-12-02 11:20:49
1094	38	67	3	2024-12-02 11:20:17	2024-12-02 11:20:57
1095	38	68	3	2024-12-02 11:20:49	2024-12-02 11:21:30
1096	38	67	3	2024-12-02 11:20:57	2024-12-02 11:21:38
1097	38	68	3	2024-12-02 11:21:30	2024-12-02 11:22:10
1098	38	67	3	2024-12-02 11:21:38	2024-12-02 11:22:18
1099	38	68	3	2024-12-02 11:22:10	2024-12-02 11:22:50
1100	38	67	3	2024-12-02 11:22:18	2024-12-02 11:22:58
1101	38	68	3	2024-12-02 11:22:50	2024-12-02 11:23:31
1102	38	67	3	2024-12-02 11:22:58	2024-12-02 11:23:39
1103	38	68	3	2024-12-02 11:23:31	2024-12-02 11:24:11
1104	38	67	3	2024-12-02 11:23:39	2024-12-02 11:24:19
1105	38	68	3	2024-12-02 11:24:11	2024-12-02 11:24:51
1106	38	67	3	2024-12-02 11:24:19	2024-12-02 11:24:59
1107	38	68	3	2024-12-02 11:24:51	2024-12-02 11:25:32
1108	38	67	3	2024-12-02 11:24:59	2024-12-02 11:25:40
1109	38	68	3	2024-12-02 11:25:32	2024-12-02 11:26:12
1110	38	67	3	2024-12-02 11:25:40	2024-12-02 11:26:20
1111	38	68	3	2024-12-02 11:26:12	2024-12-02 11:26:52
1112	38	67	3	2024-12-02 11:26:20	2024-12-02 11:27:01
1113	38	68	3	2024-12-02 11:26:52	2024-12-02 11:27:33
1114	38	67	3	2024-12-02 11:27:01	2024-12-02 11:27:41
1115	38	68	3	2024-12-02 11:27:33	2024-12-02 11:28:13
1116	38	67	3	2024-12-02 11:27:41	2024-12-02 11:28:21
1117	38	68	3	2024-12-02 11:28:13	2024-12-02 11:28:53
1118	38	67	3	2024-12-02 11:28:21	2024-12-02 11:29:02
1119	38	68	3	2024-12-02 11:28:53	2024-12-02 11:29:34
1120	38	67	3	2024-12-02 11:29:02	2024-12-02 11:29:42
1121	38	68	3	2024-12-02 11:29:34	2024-12-02 11:30:14
1122	38	67	3	2024-12-02 11:29:42	2024-12-02 11:30:23
1123	38	68	3	2024-12-02 11:30:14	2024-12-02 11:30:54
1124	38	67	3	2024-12-02 11:30:23	2024-12-02 11:31:03
1125	38	68	3	2024-12-02 11:30:54	2024-12-02 11:31:35
1126	38	67	3	2024-12-02 11:31:03	2024-12-02 11:31:44
1127	38	68	3	2024-12-02 11:31:35	2024-12-02 11:32:15
1128	38	67	3	2024-12-02 11:31:44	2024-12-02 11:32:24
1129	38	68	3	2024-12-02 11:32:15	2024-12-02 11:32:56
1130	38	67	3	2024-12-02 11:32:24	2024-12-02 11:33:04
1131	38	68	3	2024-12-02 11:32:56	2024-12-02 11:33:36
1132	38	67	3	2024-12-02 11:33:04	2024-12-02 11:33:45
1133	38	68	3	2024-12-02 11:33:36	2024-12-02 11:34:16
1134	38	67	3	2024-12-02 11:33:45	2024-12-02 11:34:25
1135	38	68	3	2024-12-02 11:34:16	2024-12-02 11:34:57
1136	38	67	3	2024-12-02 11:34:25	2024-12-02 11:35:05
1137	38	68	3	2024-12-02 11:34:57	2024-12-02 11:35:37
1138	38	67	3	2024-12-02 11:35:05	2024-12-02 11:35:46
1139	38	68	3	2024-12-02 11:35:37	2024-12-02 11:36:17
1140	38	67	3	2024-12-02 11:35:46	2024-12-02 11:36:26
1142	38	67	3	2024-12-02 11:36:26	2024-12-02 11:37:06
1144	38	67	3	2024-12-02 11:37:06	2024-12-02 11:37:47
1146	38	67	3	2024-12-02 11:37:47	2024-12-02 11:38:27
1148	38	67	3	2024-12-02 11:38:27	2024-12-02 11:39:08
1150	38	67	3	2024-12-02 11:39:08	2024-12-02 11:39:48
1152	38	67	3	2024-12-02 11:39:48	2024-12-02 11:40:28
1154	38	67	3	2024-12-02 11:40:28	2024-12-02 11:41:09
1156	38	67	3	2024-12-02 11:41:09	2024-12-02 11:41:49
1158	38	67	3	2024-12-02 11:41:49	2024-12-02 11:42:29
1160	38	67	3	2024-12-02 11:42:29	2024-12-02 11:43:10
1162	38	67	3	2024-12-02 11:43:10	2024-12-02 11:43:50
1164	38	67	3	2024-12-02 11:43:50	2024-12-02 11:44:30
1166	38	67	3	2024-12-02 11:44:30	2024-12-02 11:45:11
1168	38	67	3	2024-12-02 11:45:11	2024-12-02 11:45:51
1170	38	67	3	2024-12-02 11:45:51	2024-12-02 11:46:31
1172	38	67	3	2024-12-02 11:46:31	2024-12-02 11:47:12
1174	38	67	3	2024-12-02 11:47:12	2024-12-02 11:47:52
1176	38	67	3	2024-12-02 11:47:52	2024-12-02 11:48:33
1178	38	67	3	2024-12-02 11:48:33	2024-12-02 11:49:13
1180	38	67	3	2024-12-02 11:49:13	2024-12-02 11:49:53
1182	38	67	3	2024-12-02 11:49:53	2024-12-02 11:50:34
1184	38	67	3	2024-12-02 11:50:34	2024-12-02 11:51:14
1186	38	67	3	2024-12-02 11:51:14	2024-12-02 11:51:54
1188	38	67	3	2024-12-02 11:51:54	2024-12-02 11:52:35
1190	38	67	3	2024-12-02 11:52:35	2024-12-02 11:53:15
1192	38	67	3	2024-12-02 11:53:15	2024-12-02 11:53:55
1194	38	67	3	2024-12-02 11:53:55	2024-12-02 11:54:36
1196	38	67	3	2024-12-02 11:54:36	2024-12-02 11:55:16
1198	38	67	3	2024-12-02 11:55:16	2024-12-02 11:55:57
1200	38	67	3	2024-12-02 11:55:57	2024-12-02 11:56:37
1202	38	67	3	2024-12-02 11:56:37	2024-12-02 11:57:17
1204	38	67	3	2024-12-02 11:57:17	2024-12-02 11:57:58
1206	38	67	3	2024-12-02 11:57:58	2024-12-02 11:58:38
3889	38	81	3	2024-12-03 21:12:01	2024-12-03 21:12:42
3896	38	81	3	2024-12-03 21:12:42	2024-12-03 21:13:22
3903	38	81	3	2024-12-03 21:13:22	2024-12-03 21:14:02
3910	38	81	3	2024-12-03 21:14:02	2024-12-03 21:14:43
3917	38	81	3	2024-12-03 21:14:43	2024-12-03 21:15:23
3924	38	81	3	2024-12-03 21:15:23	2024-12-03 21:16:03
3931	38	81	3	2024-12-03 21:16:03	2024-12-03 21:16:44
3938	38	81	3	2024-12-03 21:16:44	2024-12-03 21:17:24
3945	38	81	3	2024-12-03 21:17:24	2024-12-03 21:18:04
3952	38	81	3	2024-12-03 21:18:05	2024-12-03 21:18:45
3959	38	81	3	2024-12-03 21:18:45	2024-12-03 21:19:26
3966	38	81	3	2024-12-03 21:19:26	2024-12-03 21:20:06
3973	38	81	3	2024-12-03 21:20:06	2024-12-03 21:20:46
3980	38	81	3	2024-12-03 21:20:46	2024-12-03 21:21:27
3987	38	81	3	2024-12-03 21:21:27	2024-12-03 21:22:07
3994	38	81	3	2024-12-03 21:22:07	2024-12-03 21:22:47
4001	38	81	3	2024-12-03 21:22:47	2024-12-03 21:23:28
4008	38	81	3	2024-12-03 21:23:28	2024-12-03 21:24:08
4015	38	81	3	2024-12-03 21:24:08	2024-12-03 21:24:49
4022	38	81	3	2024-12-03 21:24:49	2024-12-03 21:25:29
4029	38	81	3	2024-12-03 21:25:29	2024-12-03 21:26:09
4036	38	81	3	2024-12-03 21:26:09	2024-12-03 21:26:50
4043	38	81	3	2024-12-03 21:26:50	2024-12-03 21:27:30
4050	38	81	3	2024-12-03 21:27:30	2024-12-03 21:28:10
4057	38	81	3	2024-12-03 21:28:10	2024-12-03 21:28:51
4064	38	81	3	2024-12-03 21:28:51	2024-12-03 21:29:31
4071	38	81	3	2024-12-03 21:29:31	2024-12-03 21:30:11
4078	38	81	3	2024-12-03 21:30:11	2024-12-03 21:30:52
4085	38	81	3	2024-12-03 21:30:52	2024-12-03 21:31:32
4092	38	81	3	2024-12-03 21:31:32	2024-12-03 21:32:12
4099	38	81	3	2024-12-03 21:32:12	2024-12-03 21:32:53
4881	38	87	3	2024-12-03 22:47:29	2024-12-03 22:48:09
4888	38	87	3	2024-12-03 22:48:09	2024-12-03 22:48:50
4895	38	87	3	2024-12-03 22:48:50	2024-12-03 22:49:30
4902	38	87	3	2024-12-03 22:49:30	2024-12-03 22:50:10
4909	38	87	3	2024-12-03 22:50:10	2024-12-03 22:50:51
4916	38	87	3	2024-12-03 22:50:51	2024-12-03 22:51:31
4923	38	87	3	2024-12-03 22:51:31	2024-12-03 22:52:11
4930	38	87	3	2024-12-03 22:52:11	2024-12-03 22:52:51
4937	38	87	3	2024-12-03 22:52:51	2024-12-03 22:53:32
4944	38	87	3	2024-12-03 22:53:32	2024-12-03 22:54:12
4951	38	87	3	2024-12-03 22:54:12	2024-12-03 22:54:52
4958	38	87	3	2024-12-03 22:54:52	2024-12-03 22:55:33
4965	38	87	3	2024-12-03 22:55:33	2024-12-03 22:56:13
4972	38	87	3	2024-12-03 22:56:13	2024-12-03 22:56:53
4979	38	87	3	2024-12-03 22:56:53	2024-12-03 22:57:34
4986	38	87	3	2024-12-03 22:57:34	2024-12-03 22:58:14
4993	38	87	3	2024-12-03 22:58:14	2024-12-03 22:58:54
5000	38	87	3	2024-12-03 22:58:54	2024-12-03 22:59:35
5007	38	87	3	2024-12-03 22:59:35	2024-12-03 23:00:17
5014	38	87	3	2024-12-03 23:00:17	2024-12-03 23:00:58
5021	38	87	3	2024-12-03 23:00:58	2024-12-03 23:01:38
5028	38	87	3	2024-12-03 23:01:38	2024-12-03 23:02:18
5035	38	87	3	2024-12-03 23:02:18	2024-12-03 23:02:59
5042	38	87	3	2024-12-03 23:02:59	2024-12-03 23:03:39
5049	38	87	3	2024-12-03 23:03:39	2024-12-03 23:04:19
5056	38	87	3	2024-12-03 23:04:19	2024-12-03 23:05:00
5063	38	87	3	2024-12-03 23:05:00	2024-12-03 23:05:40
5070	38	87	3	2024-12-03 23:05:40	2024-12-03 23:06:20
5077	38	87	3	2024-12-03 23:06:20	2024-12-03 23:07:01
5084	38	87	3	2024-12-03 23:07:01	2024-12-03 23:07:41
5091	38	87	3	2024-12-03 23:07:41	2024-12-03 23:08:21
5098	38	87	3	2024-12-03 23:08:21	2024-12-03 23:09:02
5105	38	87	3	2024-12-03 23:09:02	2024-12-03 23:09:42
5112	38	87	3	2024-12-03 23:09:42	2024-12-03 23:10:22
5119	38	87	3	2024-12-03 23:10:22	2024-12-03 23:11:03
5126	38	87	3	2024-12-03 23:11:03	2024-12-03 23:11:43
5133	38	87	3	2024-12-03 23:11:43	2024-12-03 23:12:23
5140	38	87	3	2024-12-03 23:12:23	2024-12-03 23:13:04
5147	38	87	3	2024-12-03 23:13:04	2024-12-03 23:13:44
1141	38	68	3	2024-12-02 11:36:17	2024-12-02 11:36:58
1143	38	68	3	2024-12-02 11:36:58	2024-12-02 11:37:38
1145	38	68	3	2024-12-02 11:37:38	2024-12-02 11:38:18
1147	38	68	3	2024-12-02 11:38:18	2024-12-02 11:38:59
1149	38	68	3	2024-12-02 11:38:59	2024-12-02 11:39:39
1151	38	68	3	2024-12-02 11:39:39	2024-12-02 11:40:19
1153	38	68	3	2024-12-02 11:40:19	2024-12-02 11:41:00
1155	38	68	3	2024-12-02 11:41:00	2024-12-02 11:41:40
1157	38	68	3	2024-12-02 11:41:40	2024-12-02 11:42:20
1159	38	68	3	2024-12-02 11:42:20	2024-12-02 11:43:01
1161	38	68	3	2024-12-02 11:43:01	2024-12-02 11:43:41
1163	38	68	3	2024-12-02 11:43:41	2024-12-02 11:44:22
1165	38	68	3	2024-12-02 11:44:22	2024-12-02 11:45:02
1167	38	68	3	2024-12-02 11:45:02	2024-12-02 11:45:42
1169	38	68	3	2024-12-02 11:45:42	2024-12-02 11:46:23
1171	38	68	3	2024-12-02 11:46:23	2024-12-02 11:47:03
1173	38	68	3	2024-12-02 11:47:03	2024-12-02 11:47:43
1175	38	68	3	2024-12-02 11:47:43	2024-12-02 11:48:24
1177	38	68	3	2024-12-02 11:48:24	2024-12-02 11:49:04
1179	38	68	3	2024-12-02 11:49:04	2024-12-02 11:49:45
1181	38	68	3	2024-12-02 11:49:45	2024-12-02 11:50:25
1183	38	68	3	2024-12-02 11:50:25	2024-12-02 11:51:05
1185	38	68	3	2024-12-02 11:51:05	2024-12-02 11:51:46
1187	38	68	3	2024-12-02 11:51:46	2024-12-02 11:52:26
1189	38	68	3	2024-12-02 11:52:26	2024-12-02 11:53:06
1191	38	68	3	2024-12-02 11:53:06	2024-12-02 11:53:47
1193	38	68	3	2024-12-02 11:53:47	2024-12-02 11:54:27
1195	38	68	3	2024-12-02 11:54:27	2024-12-02 11:55:07
1197	38	68	3	2024-12-02 11:55:07	2024-12-02 11:55:48
1199	38	68	3	2024-12-02 11:55:48	2024-12-02 11:56:28
1201	38	68	3	2024-12-02 11:56:28	2024-12-02 11:57:08
1203	38	68	3	2024-12-02 11:57:08	2024-12-02 11:57:49
1205	38	68	3	2024-12-02 11:57:49	2024-12-02 11:58:29
1207	38	68	3	2024-12-02 11:58:29	2024-12-02 11:59:09
1208	38	67	3	2024-12-02 11:58:38	2024-12-02 11:59:18
1209	38	68	3	2024-12-02 11:59:09	2024-12-02 11:59:50
1210	38	67	3	2024-12-02 11:59:18	2024-12-02 11:59:59
1211	38	68	3	2024-12-02 11:59:50	2024-12-02 12:00:30
1212	38	67	3	2024-12-02 11:59:59	2024-12-02 12:00:39
1213	38	68	3	2024-12-02 12:00:30	2024-12-02 12:01:10
1214	38	67	3	2024-12-02 12:00:39	2024-12-02 12:01:20
1215	38	68	3	2024-12-02 12:01:10	2024-12-02 12:01:51
1216	38	67	3	2024-12-02 12:01:20	2024-12-02 12:02:00
1217	38	68	3	2024-12-02 12:01:51	2024-12-02 12:02:31
1218	38	67	3	2024-12-02 12:02:00	2024-12-02 12:02:40
1219	38	68	3	2024-12-02 12:02:31	2024-12-02 12:03:12
1220	38	67	3	2024-12-02 12:02:40	2024-12-02 12:03:21
1221	38	68	3	2024-12-02 12:03:12	2024-12-02 12:03:52
1222	38	67	3	2024-12-02 12:03:21	2024-12-02 12:04:01
1223	38	68	3	2024-12-02 12:03:52	2024-12-02 12:04:32
1224	38	67	3	2024-12-02 12:04:01	2024-12-02 12:04:42
1225	38	68	3	2024-12-02 12:04:32	2024-12-02 12:05:12
1226	38	67	3	2024-12-02 12:04:42	2024-12-02 12:05:22
1227	38	68	3	2024-12-02 12:05:12	2024-12-02 12:05:53
1228	38	67	3	2024-12-02 12:05:22	2024-12-02 12:06:02
1229	38	68	3	2024-12-02 12:05:53	2024-12-02 12:06:33
1230	38	67	3	2024-12-02 12:06:02	2024-12-02 12:06:43
1231	38	68	3	2024-12-02 12:06:33	2024-12-02 12:07:13
1232	38	67	3	2024-12-02 12:06:43	2024-12-02 12:07:23
1233	38	68	3	2024-12-02 12:07:13	2024-12-02 12:07:54
1234	38	67	3	2024-12-02 12:07:23	2024-12-02 12:08:03
1235	38	68	3	2024-12-02 12:07:54	2024-12-02 12:08:34
1236	38	67	3	2024-12-02 12:08:03	2024-12-02 12:08:44
1237	38	68	3	2024-12-02 12:08:34	2024-12-02 12:09:14
1238	38	67	3	2024-12-02 12:08:44	2024-12-02 12:09:24
1239	38	68	3	2024-12-02 12:09:14	2024-12-02 12:09:55
1240	38	67	3	2024-12-02 12:09:24	2024-12-02 12:10:04
1241	38	68	3	2024-12-02 12:09:55	2024-12-02 12:10:35
1242	38	67	3	2024-12-02 12:10:04	2024-12-02 12:10:45
1243	38	68	3	2024-12-02 12:10:35	2024-12-02 12:11:16
1244	38	67	3	2024-12-02 12:10:45	2024-12-02 12:11:25
1245	38	68	3	2024-12-02 12:11:16	2024-12-02 12:11:56
1246	38	67	3	2024-12-02 12:11:25	2024-12-02 12:12:05
1247	38	68	3	2024-12-02 12:11:56	2024-12-02 12:12:36
1248	38	67	3	2024-12-02 12:12:05	2024-12-02 12:12:46
1249	38	68	3	2024-12-02 12:12:36	2024-12-02 12:13:17
1250	38	67	3	2024-12-02 12:12:46	2024-12-02 12:13:26
1251	38	68	3	2024-12-02 12:13:17	2024-12-02 12:13:57
1252	38	67	3	2024-12-02 12:13:26	2024-12-02 12:14:06
1253	38	68	3	2024-12-02 12:13:57	2024-12-02 12:14:37
1254	38	67	3	2024-12-02 12:14:06	2024-12-02 12:14:47
1255	38	68	3	2024-12-02 12:14:37	2024-12-02 12:15:18
1256	38	67	3	2024-12-02 12:14:47	2024-12-02 12:15:27
1257	38	68	3	2024-12-02 12:15:18	2024-12-02 12:15:58
1258	38	67	3	2024-12-02 12:15:27	2024-12-02 12:16:07
1259	38	68	3	2024-12-02 12:15:58	2024-12-02 12:16:38
1260	38	67	3	2024-12-02 12:16:07	2024-12-02 12:16:48
1261	38	68	3	2024-12-02 12:16:38	2024-12-02 12:17:19
1262	38	67	3	2024-12-02 12:16:48	2024-12-02 12:17:28
1263	38	68	3	2024-12-02 12:17:19	2024-12-02 12:17:59
1264	38	67	3	2024-12-02 12:17:28	2024-12-02 12:18:08
1265	38	68	3	2024-12-02 12:17:59	2024-12-02 12:18:40
1266	38	67	3	2024-12-02 12:18:08	2024-12-02 12:18:49
1267	38	68	3	2024-12-02 12:18:40	2024-12-02 12:19:20
1268	38	67	3	2024-12-02 12:18:49	2024-12-02 12:19:29
1269	38	68	3	2024-12-02 12:19:20	2024-12-02 12:20:00
1270	38	67	3	2024-12-02 12:19:29	2024-12-02 12:20:09
1271	38	68	3	2024-12-02 12:20:00	2024-12-02 12:20:41
1272	38	67	3	2024-12-02 12:20:09	2024-12-02 12:20:50
1273	38	68	3	2024-12-02 12:20:41	2024-12-02 12:21:21
1274	38	67	3	2024-12-02 12:20:50	2024-12-02 12:21:30
1275	38	68	3	2024-12-02 12:21:21	2024-12-02 12:22:01
1276	38	67	3	2024-12-02 12:21:30	2024-12-02 12:22:10
1277	38	68	3	2024-12-02 12:22:01	2024-12-02 12:22:42
1278	38	67	3	2024-12-02 12:22:10	2024-12-02 12:22:51
1279	38	68	3	2024-12-02 12:22:42	2024-12-02 12:23:22
1280	38	67	3	2024-12-02 12:22:51	2024-12-02 12:23:31
1281	38	68	3	2024-12-02 12:23:22	2024-12-02 12:24:02
1282	38	67	3	2024-12-02 12:23:31	2024-12-02 12:24:11
1283	38	68	3	2024-12-02 12:24:02	2024-12-02 12:24:43
1284	38	67	3	2024-12-02 12:24:11	2024-12-02 12:24:52
1285	38	68	3	2024-12-02 12:24:43	2024-12-02 12:25:23
1286	38	67	3	2024-12-02 12:24:52	2024-12-02 12:25:32
1288	38	67	3	2024-12-02 12:25:32	2024-12-02 12:26:12
1290	38	67	3	2024-12-02 12:26:12	2024-12-02 12:26:53
1292	38	67	3	2024-12-02 12:26:53	2024-12-02 12:27:33
1294	38	67	3	2024-12-02 12:27:33	2024-12-02 12:28:13
3891	38	88	3	2024-12-03 21:12:10	2024-12-03 21:12:50
3898	38	88	3	2024-12-03 21:12:50	2024-12-03 21:13:31
3905	38	88	3	2024-12-03 21:13:31	2024-12-03 21:14:11
3912	38	88	3	2024-12-03 21:14:11	2024-12-03 21:14:51
3919	38	88	3	2024-12-03 21:14:51	2024-12-03 21:15:32
3926	38	88	3	2024-12-03 21:15:32	2024-12-03 21:16:12
3933	38	88	3	2024-12-03 21:16:12	2024-12-03 21:16:52
3940	38	88	3	2024-12-03 21:16:52	2024-12-03 21:17:33
3947	38	88	3	2024-12-03 21:17:33	2024-12-03 21:18:14
3954	38	88	3	2024-12-03 21:18:14	2024-12-03 21:18:55
3961	38	88	3	2024-12-03 21:18:55	2024-12-03 21:19:35
3968	38	88	3	2024-12-03 21:19:35	2024-12-03 21:20:15
3975	38	88	3	2024-12-03 21:20:15	2024-12-03 21:20:56
3982	38	88	3	2024-12-03 21:20:56	2024-12-03 21:21:36
3989	38	88	3	2024-12-03 21:21:36	2024-12-03 21:22:17
3996	38	88	3	2024-12-03 21:22:17	2024-12-03 21:22:57
4003	38	88	3	2024-12-03 21:22:57	2024-12-03 21:23:37
4010	38	88	3	2024-12-03 21:23:37	2024-12-03 21:24:18
4017	38	88	3	2024-12-03 21:24:18	2024-12-03 21:24:58
4024	38	88	3	2024-12-03 21:24:58	2024-12-03 21:25:38
4031	38	88	3	2024-12-03 21:25:38	2024-12-03 21:26:19
4038	38	88	3	2024-12-03 21:26:19	2024-12-03 21:26:59
4045	38	88	3	2024-12-03 21:26:59	2024-12-03 21:27:40
4052	38	88	3	2024-12-03 21:27:40	2024-12-03 21:28:20
4059	38	88	3	2024-12-03 21:28:20	2024-12-03 21:29:00
4066	38	88	3	2024-12-03 21:29:00	2024-12-03 21:29:41
4073	38	88	3	2024-12-03 21:29:41	2024-12-03 21:30:21
4080	38	88	3	2024-12-03 21:30:21	2024-12-03 21:31:01
4087	38	88	3	2024-12-03 21:31:01	2024-12-03 21:31:42
4094	38	88	3	2024-12-03 21:31:42	2024-12-03 21:32:22
4101	38	88	3	2024-12-03 21:32:22	2024-12-03 21:33:02
4883	38	81	3	2024-12-03 22:47:31	2024-12-03 22:48:11
4890	38	81	3	2024-12-03 22:48:11	2024-12-03 22:48:52
4897	38	81	3	2024-12-03 22:48:52	2024-12-03 22:49:32
4904	38	81	3	2024-12-03 22:49:32	2024-12-03 22:50:12
4911	38	81	3	2024-12-03 22:50:12	2024-12-03 22:50:53
4918	38	81	3	2024-12-03 22:50:53	2024-12-03 22:51:33
4925	38	81	3	2024-12-03 22:51:33	2024-12-03 22:52:13
4932	38	81	3	2024-12-03 22:52:13	2024-12-03 22:52:54
4939	38	81	3	2024-12-03 22:52:54	2024-12-03 22:53:34
4946	38	81	3	2024-12-03 22:53:34	2024-12-03 22:54:14
4953	38	81	3	2024-12-03 22:54:14	2024-12-03 22:54:54
4960	38	81	3	2024-12-03 22:54:54	2024-12-03 22:55:35
4967	38	81	3	2024-12-03 22:55:35	2024-12-03 22:56:15
4974	38	81	3	2024-12-03 22:56:15	2024-12-03 22:56:55
4981	38	81	3	2024-12-03 22:56:55	2024-12-03 22:57:36
4988	38	81	3	2024-12-03 22:57:36	2024-12-03 22:58:16
4995	38	81	3	2024-12-03 22:58:16	2024-12-03 22:58:56
5002	38	81	3	2024-12-03 22:58:56	2024-12-03 22:59:37
5009	38	81	3	2024-12-03 22:59:37	2024-12-03 23:00:18
5016	38	81	3	2024-12-03 23:00:18	2024-12-03 23:00:59
5023	38	81	3	2024-12-03 23:00:59	2024-12-03 23:01:39
5030	38	81	3	2024-12-03 23:01:39	2024-12-03 23:02:20
5037	38	81	3	2024-12-03 23:02:20	2024-12-03 23:03:00
5044	38	81	3	2024-12-03 23:03:00	2024-12-03 23:03:40
5051	38	81	3	2024-12-03 23:03:40	2024-12-03 23:04:21
5058	38	81	3	2024-12-03 23:04:21	2024-12-03 23:05:01
5065	38	81	3	2024-12-03 23:05:01	2024-12-03 23:05:41
5072	38	81	3	2024-12-03 23:05:41	2024-12-03 23:06:22
5079	38	81	3	2024-12-03 23:06:22	2024-12-03 23:07:02
5086	38	81	3	2024-12-03 23:07:02	2024-12-03 23:07:42
5093	38	81	3	2024-12-03 23:07:42	2024-12-03 23:08:23
5100	38	81	3	2024-12-03 23:08:23	2024-12-03 23:09:03
5107	38	81	3	2024-12-03 23:09:03	2024-12-03 23:09:43
5114	38	81	3	2024-12-03 23:09:43	2024-12-03 23:10:24
5121	38	81	3	2024-12-03 23:10:24	2024-12-03 23:11:04
5128	38	81	3	2024-12-03 23:11:04	2024-12-03 23:11:44
5135	38	81	3	2024-12-03 23:11:44	2024-12-03 23:12:25
5142	38	81	3	2024-12-03 23:12:25	2024-12-03 23:13:05
5149	38	81	3	2024-12-03 23:13:05	2024-12-03 23:13:45
1287	38	68	3	2024-12-02 12:25:23	2024-12-02 12:26:03
1289	38	68	3	2024-12-02 12:26:03	2024-12-02 12:26:44
1291	38	68	3	2024-12-02 12:26:44	2024-12-02 12:27:24
1293	38	68	3	2024-12-02 12:27:24	2024-12-02 12:28:04
1295	38	68	3	2024-12-02 12:28:04	2024-12-02 12:28:45
1296	38	67	3	2024-12-02 12:28:13	2024-12-02 12:28:54
1297	38	68	3	2024-12-02 12:28:45	2024-12-02 12:29:25
1298	38	67	3	2024-12-02 12:28:54	2024-12-02 12:29:34
1299	38	68	3	2024-12-02 12:29:25	2024-12-02 12:30:06
1300	38	67	3	2024-12-02 12:29:34	2024-12-02 12:30:14
1301	38	68	3	2024-12-02 12:30:06	2024-12-02 12:30:46
1302	38	67	3	2024-12-02 12:30:14	2024-12-02 12:30:55
1303	38	68	3	2024-12-02 12:30:46	2024-12-02 12:31:26
1304	38	67	3	2024-12-02 12:30:55	2024-12-02 12:31:35
1305	38	68	3	2024-12-02 12:31:26	2024-12-02 12:32:07
1306	38	67	3	2024-12-02 12:31:35	2024-12-02 12:32:15
1307	38	68	3	2024-12-02 12:32:07	2024-12-02 12:32:47
1308	38	67	3	2024-12-02 12:32:15	2024-12-02 12:32:56
1309	38	68	3	2024-12-02 12:32:47	2024-12-02 12:33:27
1310	38	67	3	2024-12-02 12:32:56	2024-12-02 12:33:36
1311	38	68	3	2024-12-02 12:33:27	2024-12-02 12:34:08
1312	38	67	3	2024-12-02 12:33:36	2024-12-02 12:34:16
1313	38	68	3	2024-12-02 12:34:08	2024-12-02 12:34:48
1314	38	67	3	2024-12-02 12:34:16	2024-12-02 12:34:57
1315	38	68	3	2024-12-02 12:34:48	2024-12-02 12:35:28
1316	38	67	3	2024-12-02 12:34:57	2024-12-02 12:35:37
1317	38	68	3	2024-12-02 12:35:28	2024-12-02 12:36:09
1318	38	67	3	2024-12-02 12:35:37	2024-12-02 12:36:17
1319	38	68	3	2024-12-02 12:36:09	2024-12-02 12:36:49
1320	38	67	3	2024-12-02 12:36:17	2024-12-02 12:36:58
1321	38	68	3	2024-12-02 12:36:49	2024-12-02 12:37:29
1322	38	67	3	2024-12-02 12:36:58	2024-12-02 12:37:38
1323	38	68	3	2024-12-02 12:37:29	2024-12-02 12:38:10
1324	38	67	3	2024-12-02 12:37:38	2024-12-02 12:38:18
1325	38	68	3	2024-12-02 12:38:10	2024-12-02 12:38:50
1326	38	67	3	2024-12-02 12:38:18	2024-12-02 12:38:59
1327	38	68	3	2024-12-02 12:38:50	2024-12-02 12:39:30
1328	38	67	3	2024-12-02 12:38:59	2024-12-02 12:39:39
1329	38	68	3	2024-12-02 12:39:30	2024-12-02 12:40:11
1330	38	67	3	2024-12-02 12:39:39	2024-12-02 12:40:19
1331	38	68	3	2024-12-02 12:40:11	2024-12-02 12:40:51
1332	38	67	3	2024-12-02 12:40:19	2024-12-02 12:41:00
1333	38	68	3	2024-12-02 12:40:51	2024-12-02 12:41:31
1334	38	67	3	2024-12-02 12:41:00	2024-12-02 12:41:40
1335	38	68	3	2024-12-02 12:41:31	2024-12-02 12:42:12
1336	38	67	3	2024-12-02 12:41:40	2024-12-02 12:42:21
1337	38	68	3	2024-12-02 12:42:12	2024-12-02 12:42:52
1338	38	67	3	2024-12-02 12:42:21	2024-12-02 12:43:01
1339	38	68	3	2024-12-02 12:42:52	2024-12-02 12:43:32
1340	38	67	3	2024-12-02 12:43:01	2024-12-02 12:43:41
1341	38	68	3	2024-12-02 12:43:32	2024-12-02 12:44:13
1342	38	67	3	2024-12-02 12:43:41	2024-12-02 12:44:22
1343	38	68	3	2024-12-02 12:44:13	2024-12-02 12:44:53
1344	38	67	3	2024-12-02 12:44:22	2024-12-02 12:45:02
1345	38	68	3	2024-12-02 12:44:53	2024-12-02 12:45:34
1346	38	67	3	2024-12-02 12:45:02	2024-12-02 12:45:42
1347	38	68	3	2024-12-02 12:45:34	2024-12-02 12:46:14
1348	38	67	3	2024-12-02 12:45:42	2024-12-02 12:46:23
1349	38	68	3	2024-12-02 12:46:14	2024-12-02 12:46:55
1350	38	67	3	2024-12-02 12:46:23	2024-12-02 12:47:03
1351	38	68	3	2024-12-02 12:46:55	2024-12-02 12:47:35
1352	38	67	3	2024-12-02 12:47:03	2024-12-02 12:47:43
1353	38	68	3	2024-12-02 12:47:35	2024-12-02 12:48:15
1354	38	67	3	2024-12-02 12:47:43	2024-12-02 12:48:24
1355	38	68	3	2024-12-02 12:48:15	2024-12-02 12:48:56
1356	38	67	3	2024-12-02 12:48:24	2024-12-02 12:49:04
1357	38	68	3	2024-12-02 12:48:56	2024-12-02 12:49:36
1358	38	67	3	2024-12-02 12:49:04	2024-12-02 12:49:44
1359	38	68	3	2024-12-02 12:49:36	2024-12-02 12:50:16
1360	38	67	3	2024-12-02 12:49:44	2024-12-02 12:50:25
1361	38	68	3	2024-12-02 12:50:16	2024-12-02 12:50:57
1362	38	67	3	2024-12-02 12:50:25	2024-12-02 12:51:05
1363	38	68	3	2024-12-02 12:50:57	2024-12-02 12:51:37
1364	38	67	3	2024-12-02 12:51:05	2024-12-02 12:51:45
1365	38	68	3	2024-12-02 12:51:37	2024-12-02 12:52:17
1366	38	67	3	2024-12-02 12:51:45	2024-12-02 12:52:26
1367	38	68	3	2024-12-02 12:52:17	2024-12-02 12:52:58
1368	38	67	3	2024-12-02 12:52:26	2024-12-02 12:53:06
1369	38	68	3	2024-12-02 12:52:58	2024-12-02 12:53:38
1370	38	67	3	2024-12-02 12:53:06	2024-12-02 12:53:46
1371	38	68	3	2024-12-02 12:53:38	2024-12-02 12:54:18
1372	38	67	3	2024-12-02 12:53:46	2024-12-02 12:54:27
1373	38	68	3	2024-12-02 12:54:18	2024-12-02 12:54:59
1374	38	67	3	2024-12-02 12:54:27	2024-12-02 12:55:07
1375	38	68	3	2024-12-02 12:54:59	2024-12-02 12:55:39
1376	38	67	3	2024-12-02 12:55:07	2024-12-02 12:55:48
1377	38	68	3	2024-12-02 12:55:39	2024-12-02 12:56:19
1378	38	67	3	2024-12-02 12:55:48	2024-12-02 12:56:28
1379	38	68	3	2024-12-02 12:56:19	2024-12-02 12:57:00
1380	38	67	3	2024-12-02 12:56:28	2024-12-02 12:57:09
1381	38	68	3	2024-12-02 12:57:00	2024-12-02 12:57:40
1382	38	67	3	2024-12-02 12:57:09	2024-12-02 12:57:49
1383	38	68	3	2024-12-02 12:57:40	2024-12-02 12:58:20
1384	38	67	3	2024-12-02 12:57:49	2024-12-02 12:58:29
1385	38	68	3	2024-12-02 12:58:20	2024-12-02 12:59:01
1386	38	67	3	2024-12-02 12:58:29	2024-12-02 12:59:10
1387	38	68	3	2024-12-02 12:59:01	2024-12-02 12:59:41
1388	38	67	3	2024-12-02 12:59:10	2024-12-02 12:59:50
1389	38	68	3	2024-12-02 12:59:41	2024-12-02 13:00:21
1391	38	68	0	2024-12-02 13:00:21	2024-12-02 13:00:21
1390	38	67	3	2024-12-02 12:59:50	2024-12-02 13:00:30
1392	38	67	3	2024-12-02 13:00:30	2024-12-02 13:01:11
1393	38	67	3	2024-12-02 13:01:11	2024-12-02 13:01:51
1394	38	67	3	2024-12-02 13:01:51	2024-12-02 13:02:31
1395	38	67	3	2024-12-02 13:02:31	2024-12-02 13:03:12
1396	38	67	3	2024-12-02 13:03:12	2024-12-02 13:03:52
1397	38	67	3	2024-12-02 13:03:52	2024-12-02 13:04:32
1398	38	67	3	2024-12-02 13:04:32	2024-12-02 13:05:13
1399	38	67	3	2024-12-02 13:05:13	2024-12-02 13:05:53
1400	38	67	3	2024-12-02 13:05:53	2024-12-02 13:06:33
1401	38	67	0	2024-12-02 13:06:33	2024-12-02 13:06:33
1402	29	73	3	2024-12-02 14:43:31	2024-12-02 14:44:12
1403	29	73	3	2024-12-02 14:44:12	2024-12-02 14:44:52
1404	29	73	3	2024-12-02 14:44:52	2024-12-02 14:45:33
1405	29	73	3	2024-12-02 14:45:33	2024-12-02 14:46:13
1406	39	74	3	2024-12-02 14:45:55	2024-12-02 14:46:36
1407	29	73	3	2024-12-02 14:46:13	2024-12-02 14:46:53
1409	29	73	0	2024-12-02 14:46:53	2024-12-02 14:46:53
1408	39	74	3	2024-12-02 14:46:36	2024-12-02 14:47:16
1410	39	74	0	2024-12-02 14:47:16	2024-12-02 14:47:16
1459	38	82	3	2024-12-03 15:55:29	2024-12-03 15:56:09
1411	39	75	1	2024-12-02 15:54:10	2024-12-02 19:54:55
1412	39	75	1	2024-12-02 15:54:50	2024-12-02 19:54:55
1413	38	77	3	2024-12-02 18:03:26	2024-12-02 18:04:07
1414	38	77	3	2024-12-02 18:04:07	2024-12-02 18:04:47
1415	38	77	0	2024-12-02 18:04:47	2024-12-02 18:04:47
1416	29	78	0	2024-12-02 18:21:23	2024-12-02 18:21:23
1417	13	79	0	2024-12-03 08:40:58	2024-12-03 08:40:58
1418	13	80	1	2024-12-03 08:44:45	2024-12-03 12:45:05
1419	38	81	3	2024-12-03 15:36:33	2024-12-03 15:37:13
1420	38	81	3	2024-12-03 15:37:13	2024-12-03 15:37:54
1421	38	81	3	2024-12-03 15:37:54	2024-12-03 15:38:34
1422	38	81	3	2024-12-03 15:38:34	2024-12-03 15:39:15
1423	38	81	3	2024-12-03 15:39:15	2024-12-03 15:39:55
1424	38	81	3	2024-12-03 15:39:55	2024-12-03 15:40:35
1425	38	81	3	2024-12-03 15:40:35	2024-12-03 15:41:16
1426	38	81	3	2024-12-03 15:41:16	2024-12-03 15:41:56
1427	38	81	3	2024-12-03 15:41:56	2024-12-03 15:42:37
1428	38	81	3	2024-12-03 15:42:37	2024-12-03 15:43:17
1429	38	81	3	2024-12-03 15:43:17	2024-12-03 15:43:57
1430	38	81	3	2024-12-03 15:43:57	2024-12-03 15:44:38
1431	38	81	3	2024-12-03 15:44:38	2024-12-03 15:45:18
1432	38	81	3	2024-12-03 15:45:18	2024-12-03 15:45:58
1433	38	81	3	2024-12-03 15:45:58	2024-12-03 15:46:39
1434	38	81	3	2024-12-03 15:46:39	2024-12-03 15:47:19
1435	38	81	3	2024-12-03 15:47:19	2024-12-03 15:48:00
1436	38	81	3	2024-12-03 15:48:00	2024-12-03 15:48:40
1437	38	82	3	2024-12-03 15:48:04	2024-12-03 15:48:44
1438	38	81	3	2024-12-03 15:48:40	2024-12-03 15:49:20
1439	38	82	3	2024-12-03 15:48:44	2024-12-03 15:49:25
1440	38	81	3	2024-12-03 15:49:20	2024-12-03 15:50:01
1441	38	82	3	2024-12-03 15:49:25	2024-12-03 15:50:05
1442	38	81	3	2024-12-03 15:50:01	2024-12-03 15:50:41
1443	38	82	3	2024-12-03 15:50:05	2024-12-03 15:50:45
1444	38	81	3	2024-12-03 15:50:41	2024-12-03 15:51:22
1445	38	82	3	2024-12-03 15:50:45	2024-12-03 15:51:26
1446	38	81	3	2024-12-03 15:51:22	2024-12-03 15:52:02
1447	38	82	3	2024-12-03 15:51:26	2024-12-03 15:52:06
1448	38	81	3	2024-12-03 15:52:02	2024-12-03 15:52:43
1449	38	82	3	2024-12-03 15:52:06	2024-12-03 15:52:46
1450	38	81	3	2024-12-03 15:52:43	2024-12-03 15:53:23
1451	38	82	3	2024-12-03 15:52:46	2024-12-03 15:53:28
1452	38	81	3	2024-12-03 15:53:23	2024-12-03 15:54:03
1453	38	82	3	2024-12-03 15:53:28	2024-12-03 15:54:08
1454	38	81	3	2024-12-03 15:54:03	2024-12-03 15:54:44
1455	38	82	3	2024-12-03 15:54:08	2024-12-03 15:54:48
1456	38	81	3	2024-12-03 15:54:44	2024-12-03 15:55:24
1457	38	82	3	2024-12-03 15:54:48	2024-12-03 15:55:29
1458	38	81	3	2024-12-03 15:55:24	2024-12-03 15:56:04
1460	38	81	3	2024-12-03 15:56:04	2024-12-03 15:56:45
1461	38	82	3	2024-12-03 15:56:09	2024-12-03 15:56:50
1462	38	81	3	2024-12-03 15:56:45	2024-12-03 15:57:25
1463	38	82	3	2024-12-03 15:56:50	2024-12-03 15:57:30
1464	38	81	3	2024-12-03 15:57:25	2024-12-03 15:58:06
1465	38	82	3	2024-12-03 15:57:30	2024-12-03 15:58:10
1466	38	81	3	2024-12-03 15:58:06	2024-12-03 15:58:46
1467	38	82	3	2024-12-03 15:58:10	2024-12-03 15:58:51
1468	38	81	3	2024-12-03 15:58:46	2024-12-03 15:59:26
1469	38	82	3	2024-12-03 15:58:51	2024-12-03 15:59:31
1470	38	81	3	2024-12-03 15:59:26	2024-12-03 16:00:07
1471	38	82	3	2024-12-03 15:59:31	2024-12-03 16:00:11
1472	38	81	3	2024-12-03 16:00:07	2024-12-03 16:00:47
1473	38	82	3	2024-12-03 16:00:11	2024-12-03 16:00:52
1474	38	81	3	2024-12-03 16:00:47	2024-12-03 16:01:28
1475	38	82	3	2024-12-03 16:00:52	2024-12-03 16:01:32
1476	38	81	3	2024-12-03 16:01:28	2024-12-03 16:02:08
1477	38	82	3	2024-12-03 16:01:32	2024-12-03 16:02:12
1478	38	81	3	2024-12-03 16:02:08	2024-12-03 16:02:48
1479	38	82	3	2024-12-03 16:02:12	2024-12-03 16:02:53
1480	38	81	3	2024-12-03 16:02:48	2024-12-03 16:03:29
1481	38	82	3	2024-12-03 16:02:53	2024-12-03 16:03:33
1482	38	81	3	2024-12-03 16:03:29	2024-12-03 16:04:09
1483	38	82	3	2024-12-03 16:03:33	2024-12-03 16:04:13
1484	38	81	3	2024-12-03 16:04:09	2024-12-03 16:04:49
1485	38	82	3	2024-12-03 16:04:13	2024-12-03 16:04:54
1486	38	81	3	2024-12-03 16:04:49	2024-12-03 16:05:30
1487	38	82	3	2024-12-03 16:04:54	2024-12-03 16:05:34
1488	38	81	3	2024-12-03 16:05:30	2024-12-03 16:06:10
1489	38	82	3	2024-12-03 16:05:34	2024-12-03 16:06:14
1490	38	81	3	2024-12-03 16:06:10	2024-12-03 16:06:50
1491	38	82	3	2024-12-03 16:06:14	2024-12-03 16:06:55
1492	38	81	3	2024-12-03 16:06:50	2024-12-03 16:07:31
1493	38	82	3	2024-12-03 16:06:55	2024-12-03 16:07:35
1494	38	81	3	2024-12-03 16:07:31	2024-12-03 16:08:11
1495	38	82	3	2024-12-03 16:07:35	2024-12-03 16:08:15
1496	38	81	3	2024-12-03 16:08:11	2024-12-03 16:08:52
1497	38	82	3	2024-12-03 16:08:15	2024-12-03 16:08:56
1498	38	81	3	2024-12-03 16:08:52	2024-12-03 16:09:32
1499	38	82	3	2024-12-03 16:08:56	2024-12-03 16:09:36
1500	38	81	3	2024-12-03 16:09:32	2024-12-03 16:10:12
1501	38	82	3	2024-12-03 16:09:36	2024-12-03 16:10:16
1502	38	81	3	2024-12-03 16:10:12	2024-12-03 16:10:53
1503	38	82	3	2024-12-03 16:10:16	2024-12-03 16:10:57
1504	38	81	3	2024-12-03 16:10:53	2024-12-03 16:11:33
1505	38	82	3	2024-12-03 16:10:57	2024-12-03 16:11:37
1506	38	81	3	2024-12-03 16:11:33	2024-12-03 16:12:13
1507	38	82	3	2024-12-03 16:11:37	2024-12-03 16:12:17
1508	38	81	3	2024-12-03 16:12:13	2024-12-03 16:12:54
1509	38	82	3	2024-12-03 16:12:17	2024-12-03 16:12:58
1510	38	81	3	2024-12-03 16:12:54	2024-12-03 16:13:34
1511	38	82	3	2024-12-03 16:12:58	2024-12-03 16:13:38
1512	38	81	3	2024-12-03 16:13:34	2024-12-03 16:14:15
1513	38	82	3	2024-12-03 16:13:38	2024-12-03 16:14:19
1514	38	81	3	2024-12-03 16:14:15	2024-12-03 16:14:55
3886	38	84	3	2024-12-03 21:11:47	2024-12-03 21:12:28
1515	38	82	3	2024-12-03 16:14:19	2024-12-03 16:14:59
1517	38	82	3	2024-12-03 16:14:59	2024-12-03 16:15:39
1519	38	82	3	2024-12-03 16:15:39	2024-12-03 16:16:20
1522	38	82	3	2024-12-03 16:16:20	2024-12-03 16:17:00
1525	38	82	3	2024-12-03 16:17:00	2024-12-03 16:17:40
1528	38	82	3	2024-12-03 16:17:40	2024-12-03 16:18:21
1531	38	82	3	2024-12-03 16:18:21	2024-12-03 16:19:01
1534	38	82	3	2024-12-03 16:19:01	2024-12-03 16:19:41
1537	38	82	3	2024-12-03 16:19:41	2024-12-03 16:20:22
1540	38	82	3	2024-12-03 16:20:22	2024-12-03 16:21:02
1543	38	82	3	2024-12-03 16:21:02	2024-12-03 16:21:42
1546	38	82	3	2024-12-03 16:21:42	2024-12-03 16:22:23
1549	38	82	3	2024-12-03 16:22:23	2024-12-03 16:23:03
1552	38	82	3	2024-12-03 16:23:03	2024-12-03 16:23:43
1555	38	82	3	2024-12-03 16:23:43	2024-12-03 16:24:24
1558	38	82	3	2024-12-03 16:24:24	2024-12-03 16:25:04
1561	38	82	3	2024-12-03 16:25:04	2024-12-03 16:25:44
1564	38	82	3	2024-12-03 16:25:44	2024-12-03 16:26:25
1567	38	82	3	2024-12-03 16:26:25	2024-12-03 16:27:05
1570	38	82	3	2024-12-03 16:27:05	2024-12-03 16:27:45
1573	38	82	3	2024-12-03 16:27:45	2024-12-03 16:28:26
1576	38	82	3	2024-12-03 16:28:26	2024-12-03 16:29:06
1579	38	82	3	2024-12-03 16:29:06	2024-12-03 16:29:46
3893	38	84	3	2024-12-03 21:12:28	2024-12-03 21:13:08
3900	38	84	3	2024-12-03 21:13:08	2024-12-03 21:13:48
3907	38	84	3	2024-12-03 21:13:48	2024-12-03 21:14:29
3914	38	84	3	2024-12-03 21:14:29	2024-12-03 21:15:09
3921	38	84	3	2024-12-03 21:15:09	2024-12-03 21:15:50
3928	38	84	3	2024-12-03 21:15:50	2024-12-03 21:16:30
3935	38	84	3	2024-12-03 21:16:30	2024-12-03 21:17:10
3942	38	84	3	2024-12-03 21:17:10	2024-12-03 21:17:51
3949	38	84	3	2024-12-03 21:17:51	2024-12-03 21:18:31
3956	38	84	3	2024-12-03 21:18:31	2024-12-03 21:19:12
3963	38	84	3	2024-12-03 21:19:12	2024-12-03 21:19:52
3970	38	84	3	2024-12-03 21:19:52	2024-12-03 21:20:32
3977	38	84	3	2024-12-03 21:20:32	2024-12-03 21:21:13
3984	38	84	3	2024-12-03 21:21:13	2024-12-03 21:21:53
3991	38	84	3	2024-12-03 21:21:53	2024-12-03 21:22:34
3998	38	84	3	2024-12-03 21:22:34	2024-12-03 21:23:14
4005	38	84	3	2024-12-03 21:23:14	2024-12-03 21:23:54
4012	38	84	3	2024-12-03 21:23:54	2024-12-03 21:24:35
4019	38	84	3	2024-12-03 21:24:35	2024-12-03 21:25:15
4026	38	84	3	2024-12-03 21:25:15	2024-12-03 21:25:55
4033	38	84	3	2024-12-03 21:25:55	2024-12-03 21:26:36
4040	38	84	3	2024-12-03 21:26:36	2024-12-03 21:27:16
4047	38	84	3	2024-12-03 21:27:16	2024-12-03 21:27:56
4054	38	84	3	2024-12-03 21:27:56	2024-12-03 21:28:37
4061	38	84	3	2024-12-03 21:28:37	2024-12-03 21:29:17
4068	38	84	3	2024-12-03 21:29:17	2024-12-03 21:29:57
4075	38	84	3	2024-12-03 21:29:57	2024-12-03 21:30:38
4082	38	84	3	2024-12-03 21:30:38	2024-12-03 21:31:18
4089	38	84	3	2024-12-03 21:31:18	2024-12-03 21:31:58
4096	38	84	3	2024-12-03 21:31:58	2024-12-03 21:32:39
4103	38	84	3	2024-12-03 21:32:39	2024-12-03 21:33:19
4878	38	88	3	2024-12-03 22:47:07	2024-12-03 22:47:48
4885	38	88	3	2024-12-03 22:47:48	2024-12-03 22:48:28
4892	38	88	3	2024-12-03 22:48:28	2024-12-03 22:49:08
4899	38	88	3	2024-12-03 22:49:08	2024-12-03 22:49:49
4906	38	88	3	2024-12-03 22:49:49	2024-12-03 22:50:29
4913	38	88	3	2024-12-03 22:50:29	2024-12-03 22:51:09
4920	38	88	3	2024-12-03 22:51:09	2024-12-03 22:51:50
4927	38	88	3	2024-12-03 22:51:50	2024-12-03 22:52:30
4934	38	88	3	2024-12-03 22:52:30	2024-12-03 22:53:10
4941	38	88	3	2024-12-03 22:53:10	2024-12-03 22:53:51
4948	38	88	3	2024-12-03 22:53:51	2024-12-03 22:54:31
4955	38	88	3	2024-12-03 22:54:31	2024-12-03 22:55:11
4962	38	88	3	2024-12-03 22:55:11	2024-12-03 22:55:51
4969	38	88	3	2024-12-03 22:55:51	2024-12-03 22:56:32
4976	38	88	3	2024-12-03 22:56:32	2024-12-03 22:57:12
4983	38	88	3	2024-12-03 22:57:12	2024-12-03 22:57:52
4990	38	88	3	2024-12-03 22:57:52	2024-12-03 22:58:33
4997	38	88	3	2024-12-03 22:58:33	2024-12-03 22:59:13
5004	38	88	3	2024-12-03 22:59:13	2024-12-03 22:59:54
5011	38	88	3	2024-12-03 22:59:54	2024-12-03 23:00:35
5018	38	88	3	2024-12-03 23:00:35	2024-12-03 23:01:15
5025	38	88	3	2024-12-03 23:01:15	2024-12-03 23:01:56
5032	38	88	3	2024-12-03 23:01:56	2024-12-03 23:02:36
5039	38	88	3	2024-12-03 23:02:36	2024-12-03 23:03:16
5046	38	88	3	2024-12-03 23:03:16	2024-12-03 23:03:57
5053	38	88	3	2024-12-03 23:03:57	2024-12-03 23:04:37
5060	38	88	3	2024-12-03 23:04:37	2024-12-03 23:05:17
5067	38	88	3	2024-12-03 23:05:17	2024-12-03 23:05:57
5074	38	88	3	2024-12-03 23:05:57	2024-12-03 23:06:38
5081	38	88	3	2024-12-03 23:06:38	2024-12-03 23:07:18
5088	38	88	3	2024-12-03 23:07:18	2024-12-03 23:07:58
5095	38	88	3	2024-12-03 23:07:58	2024-12-03 23:08:39
5102	38	88	3	2024-12-03 23:08:39	2024-12-03 23:09:19
5109	38	88	3	2024-12-03 23:09:19	2024-12-03 23:09:59
5116	38	88	3	2024-12-03 23:09:59	2024-12-03 23:10:40
5123	38	88	3	2024-12-03 23:10:40	2024-12-03 23:11:20
5130	38	88	3	2024-12-03 23:11:20	2024-12-03 23:12:00
5137	38	88	3	2024-12-03 23:12:00	2024-12-03 23:12:41
5144	38	88	3	2024-12-03 23:12:41	2024-12-03 23:13:21
1516	38	81	3	2024-12-03 16:14:55	2024-12-03 16:15:35
1518	38	81	3	2024-12-03 16:15:35	2024-12-03 16:16:16
1520	38	83	3	2024-12-03 16:15:43	2024-12-03 16:16:24
1521	38	81	3	2024-12-03 16:16:16	2024-12-03 16:16:56
1523	38	83	3	2024-12-03 16:16:24	2024-12-03 16:17:04
1524	38	81	3	2024-12-03 16:16:56	2024-12-03 16:17:36
1526	38	83	3	2024-12-03 16:17:04	2024-12-03 16:17:45
1527	38	81	3	2024-12-03 16:17:36	2024-12-03 16:18:17
1529	38	83	3	2024-12-03 16:17:45	2024-12-03 16:18:25
1530	38	81	3	2024-12-03 16:18:17	2024-12-03 16:18:57
1532	38	83	3	2024-12-03 16:18:25	2024-12-03 16:19:05
1533	38	81	3	2024-12-03 16:18:57	2024-12-03 16:19:37
1535	38	83	3	2024-12-03 16:19:05	2024-12-03 16:19:46
1536	38	81	3	2024-12-03 16:19:38	2024-12-03 16:20:18
1538	38	83	3	2024-12-03 16:19:46	2024-12-03 16:20:26
1539	38	81	3	2024-12-03 16:20:18	2024-12-03 16:20:58
1541	38	83	3	2024-12-03 16:20:26	2024-12-03 16:21:06
1542	38	81	3	2024-12-03 16:20:58	2024-12-03 16:21:39
1544	38	83	3	2024-12-03 16:21:06	2024-12-03 16:21:47
1545	38	81	3	2024-12-03 16:21:39	2024-12-03 16:22:19
1547	38	83	3	2024-12-03 16:21:47	2024-12-03 16:22:27
1548	38	81	3	2024-12-03 16:22:19	2024-12-03 16:22:59
1550	38	83	3	2024-12-03 16:22:27	2024-12-03 16:23:07
1551	38	81	3	2024-12-03 16:22:59	2024-12-03 16:23:40
1553	38	83	3	2024-12-03 16:23:07	2024-12-03 16:23:48
1554	38	81	3	2024-12-03 16:23:40	2024-12-03 16:24:20
1556	38	83	3	2024-12-03 16:23:48	2024-12-03 16:24:28
1557	38	81	3	2024-12-03 16:24:20	2024-12-03 16:25:00
1559	38	83	3	2024-12-03 16:24:28	2024-12-03 16:25:08
1560	38	81	3	2024-12-03 16:25:00	2024-12-03 16:25:41
1562	38	83	3	2024-12-03 16:25:08	2024-12-03 16:25:49
1563	38	81	3	2024-12-03 16:25:41	2024-12-03 16:26:21
1565	38	83	3	2024-12-03 16:25:49	2024-12-03 16:26:29
1566	38	81	3	2024-12-03 16:26:21	2024-12-03 16:27:02
1568	38	83	3	2024-12-03 16:26:29	2024-12-03 16:27:09
1569	38	81	3	2024-12-03 16:27:02	2024-12-03 16:27:42
1571	38	83	3	2024-12-03 16:27:09	2024-12-03 16:27:50
1572	38	81	3	2024-12-03 16:27:42	2024-12-03 16:28:23
1574	38	83	3	2024-12-03 16:27:50	2024-12-03 16:28:30
1575	38	81	3	2024-12-03 16:28:23	2024-12-03 16:29:03
1577	38	83	3	2024-12-03 16:28:30	2024-12-03 16:29:10
1578	38	81	3	2024-12-03 16:29:03	2024-12-03 16:29:43
1580	38	83	3	2024-12-03 16:29:10	2024-12-03 16:29:51
1581	38	81	3	2024-12-03 16:29:43	2024-12-03 16:30:24
1582	38	82	3	2024-12-03 16:29:46	2024-12-03 16:30:27
1583	38	83	3	2024-12-03 16:29:51	2024-12-03 16:30:31
1584	38	81	3	2024-12-03 16:30:24	2024-12-03 16:31:04
1585	38	82	3	2024-12-03 16:30:27	2024-12-03 16:31:07
1586	38	83	3	2024-12-03 16:30:31	2024-12-03 16:31:11
1587	38	81	3	2024-12-03 16:31:04	2024-12-03 16:31:44
1588	38	82	3	2024-12-03 16:31:07	2024-12-03 16:31:47
1589	38	83	3	2024-12-03 16:31:11	2024-12-03 16:31:52
1590	38	81	3	2024-12-03 16:31:44	2024-12-03 16:32:25
1591	38	82	3	2024-12-03 16:31:47	2024-12-03 16:32:28
1592	38	83	3	2024-12-03 16:31:52	2024-12-03 16:32:32
1593	38	81	3	2024-12-03 16:32:25	2024-12-03 16:33:05
1594	38	82	3	2024-12-03 16:32:28	2024-12-03 16:33:08
1595	38	83	3	2024-12-03 16:32:32	2024-12-03 16:33:12
1596	38	81	3	2024-12-03 16:33:05	2024-12-03 16:33:45
1597	38	82	3	2024-12-03 16:33:08	2024-12-03 16:33:48
1598	38	83	3	2024-12-03 16:33:12	2024-12-03 16:33:53
1599	38	81	3	2024-12-03 16:33:45	2024-12-03 16:34:26
1600	38	82	3	2024-12-03 16:33:48	2024-12-03 16:34:29
1601	38	83	3	2024-12-03 16:33:53	2024-12-03 16:34:33
1602	38	81	3	2024-12-03 16:34:26	2024-12-03 16:35:06
1603	38	82	3	2024-12-03 16:34:29	2024-12-03 16:35:09
1604	38	83	3	2024-12-03 16:34:33	2024-12-03 16:35:13
1605	38	81	3	2024-12-03 16:35:06	2024-12-03 16:35:47
1606	38	82	3	2024-12-03 16:35:09	2024-12-03 16:35:49
1607	38	83	3	2024-12-03 16:35:13	2024-12-03 16:35:54
1608	38	81	3	2024-12-03 16:35:47	2024-12-03 16:36:27
1609	38	82	3	2024-12-03 16:35:49	2024-12-03 16:36:30
1610	38	83	3	2024-12-03 16:35:54	2024-12-03 16:36:34
1611	38	81	3	2024-12-03 16:36:27	2024-12-03 16:37:07
1612	38	82	3	2024-12-03 16:36:30	2024-12-03 16:37:10
1613	38	83	3	2024-12-03 16:36:34	2024-12-03 16:37:14
1614	38	81	3	2024-12-03 16:37:07	2024-12-03 16:37:48
1615	38	82	3	2024-12-03 16:37:10	2024-12-03 16:37:50
1616	38	83	3	2024-12-03 16:37:14	2024-12-03 16:37:55
1617	38	81	3	2024-12-03 16:37:48	2024-12-03 16:38:28
1618	38	82	3	2024-12-03 16:37:50	2024-12-03 16:38:31
1619	38	83	3	2024-12-03 16:37:55	2024-12-03 16:38:35
1620	38	81	3	2024-12-03 16:38:28	2024-12-03 16:39:08
1621	38	82	3	2024-12-03 16:38:31	2024-12-03 16:39:11
1622	38	83	3	2024-12-03 16:38:35	2024-12-03 16:39:16
1623	38	81	3	2024-12-03 16:39:08	2024-12-03 16:39:49
1624	38	82	3	2024-12-03 16:39:11	2024-12-03 16:39:51
1625	38	83	3	2024-12-03 16:39:16	2024-12-03 16:39:56
1626	38	81	3	2024-12-03 16:39:49	2024-12-03 16:40:29
1627	38	82	3	2024-12-03 16:39:51	2024-12-03 16:40:32
1628	38	83	3	2024-12-03 16:39:56	2024-12-03 16:40:36
1629	38	81	3	2024-12-03 16:40:29	2024-12-03 16:41:09
1630	38	82	3	2024-12-03 16:40:32	2024-12-03 16:41:12
1631	38	83	3	2024-12-03 16:40:36	2024-12-03 16:41:17
1632	38	81	3	2024-12-03 16:41:09	2024-12-03 16:41:50
1633	38	82	3	2024-12-03 16:41:12	2024-12-03 16:41:52
1634	38	83	3	2024-12-03 16:41:17	2024-12-03 16:41:57
1635	38	81	3	2024-12-03 16:41:50	2024-12-03 16:42:30
1636	38	82	3	2024-12-03 16:41:52	2024-12-03 16:42:33
1637	38	83	3	2024-12-03 16:41:57	2024-12-03 16:42:37
1638	38	81	3	2024-12-03 16:42:30	2024-12-03 16:43:10
1639	38	82	3	2024-12-03 16:42:33	2024-12-03 16:43:13
1640	38	83	3	2024-12-03 16:42:37	2024-12-03 16:43:18
1641	38	81	3	2024-12-03 16:43:10	2024-12-03 16:43:51
1642	38	82	3	2024-12-03 16:43:13	2024-12-03 16:43:53
1643	38	83	3	2024-12-03 16:43:18	2024-12-03 16:43:58
1644	38	81	3	2024-12-03 16:43:51	2024-12-03 16:44:31
1645	38	82	3	2024-12-03 16:43:53	2024-12-03 16:44:33
1646	38	83	3	2024-12-03 16:43:58	2024-12-03 16:44:38
1647	38	81	3	2024-12-03 16:44:31	2024-12-03 16:45:11
1648	38	82	3	2024-12-03 16:44:34	2024-12-03 16:45:14
1649	38	83	3	2024-12-03 16:44:38	2024-12-03 16:45:19
3888	38	87	3	2024-12-03 21:12:00	2024-12-03 21:12:40
1650	38	81	3	2024-12-03 16:45:11	2024-12-03 16:45:52
1653	38	81	3	2024-12-03 16:45:52	2024-12-03 16:46:32
1656	38	81	3	2024-12-03 16:46:32	2024-12-03 16:47:12
1659	38	81	3	2024-12-03 16:47:12	2024-12-03 16:47:53
1662	38	81	3	2024-12-03 16:47:53	2024-12-03 16:48:33
1665	38	81	3	2024-12-03 16:48:33	2024-12-03 16:49:13
1668	38	81	3	2024-12-03 16:49:13	2024-12-03 16:49:54
1671	38	81	3	2024-12-03 16:49:54	2024-12-03 16:50:34
1674	38	81	3	2024-12-03 16:50:34	2024-12-03 16:51:14
1677	38	81	3	2024-12-03 16:51:14	2024-12-03 16:51:55
1680	38	81	3	2024-12-03 16:51:55	2024-12-03 16:52:35
1683	38	81	3	2024-12-03 16:52:35	2024-12-03 16:53:15
3895	38	87	3	2024-12-03 21:12:40	2024-12-03 21:13:20
3902	38	87	3	2024-12-03 21:13:20	2024-12-03 21:14:01
3909	38	87	3	2024-12-03 21:14:01	2024-12-03 21:14:41
3916	38	87	3	2024-12-03 21:14:41	2024-12-03 21:15:21
3923	38	87	3	2024-12-03 21:15:21	2024-12-03 21:16:02
3930	38	87	3	2024-12-03 21:16:02	2024-12-03 21:16:42
3937	38	87	3	2024-12-03 21:16:42	2024-12-03 21:17:22
3944	38	87	3	2024-12-03 21:17:22	2024-12-03 21:18:03
3951	38	87	3	2024-12-03 21:18:03	2024-12-03 21:18:44
3958	38	87	3	2024-12-03 21:18:44	2024-12-03 21:19:24
3965	38	87	3	2024-12-03 21:19:24	2024-12-03 21:20:04
3972	38	87	3	2024-12-03 21:20:04	2024-12-03 21:20:45
3979	38	87	3	2024-12-03 21:20:45	2024-12-03 21:21:25
3986	38	87	3	2024-12-03 21:21:25	2024-12-03 21:22:05
3993	38	87	3	2024-12-03 21:22:05	2024-12-03 21:22:46
4000	38	87	3	2024-12-03 21:22:46	2024-12-03 21:23:26
4007	38	87	3	2024-12-03 21:23:26	2024-12-03 21:24:06
4014	38	87	3	2024-12-03 21:24:06	2024-12-03 21:24:47
4021	38	87	3	2024-12-03 21:24:47	2024-12-03 21:25:27
4028	38	87	3	2024-12-03 21:25:27	2024-12-03 21:26:07
4035	38	87	3	2024-12-03 21:26:07	2024-12-03 21:26:48
4042	38	87	3	2024-12-03 21:26:48	2024-12-03 21:27:28
4049	38	87	3	2024-12-03 21:27:28	2024-12-03 21:28:08
4056	38	87	3	2024-12-03 21:28:08	2024-12-03 21:28:49
4063	38	87	3	2024-12-03 21:28:49	2024-12-03 21:29:29
4070	38	87	3	2024-12-03 21:29:29	2024-12-03 21:30:09
4077	38	87	3	2024-12-03 21:30:09	2024-12-03 21:30:50
4084	38	87	3	2024-12-03 21:30:50	2024-12-03 21:31:30
4091	38	87	3	2024-12-03 21:31:30	2024-12-03 21:32:10
4098	38	87	3	2024-12-03 21:32:10	2024-12-03 21:32:51
4880	38	84	3	2024-12-03 22:47:21	2024-12-03 22:48:01
4887	38	84	3	2024-12-03 22:48:01	2024-12-03 22:48:41
4894	38	84	3	2024-12-03 22:48:41	2024-12-03 22:49:22
4901	38	84	3	2024-12-03 22:49:22	2024-12-03 22:50:02
4908	38	84	3	2024-12-03 22:50:02	2024-12-03 22:50:42
4915	38	84	3	2024-12-03 22:50:42	2024-12-03 22:51:23
4922	38	84	3	2024-12-03 22:51:23	2024-12-03 22:52:03
4929	38	84	3	2024-12-03 22:52:03	2024-12-03 22:52:43
4936	38	84	3	2024-12-03 22:52:43	2024-12-03 22:53:24
4943	38	84	3	2024-12-03 22:53:24	2024-12-03 22:54:04
4950	38	84	3	2024-12-03 22:54:04	2024-12-03 22:54:44
4957	38	84	3	2024-12-03 22:54:44	2024-12-03 22:55:25
4964	38	84	3	2024-12-03 22:55:25	2024-12-03 22:56:05
4971	38	84	3	2024-12-03 22:56:05	2024-12-03 22:56:45
4978	38	84	3	2024-12-03 22:56:45	2024-12-03 22:57:26
4985	38	84	3	2024-12-03 22:57:26	2024-12-03 22:58:06
4992	38	84	3	2024-12-03 22:58:06	2024-12-03 22:58:46
4999	38	84	3	2024-12-03 22:58:46	2024-12-03 22:59:27
5006	38	84	3	2024-12-03 22:59:27	2024-12-03 23:00:08
5013	38	84	3	2024-12-03 23:00:08	2024-12-03 23:00:49
5020	38	84	3	2024-12-03 23:00:49	2024-12-03 23:01:29
5027	38	84	3	2024-12-03 23:01:29	2024-12-03 23:02:10
5034	38	84	3	2024-12-03 23:02:10	2024-12-03 23:02:50
5041	38	84	3	2024-12-03 23:02:50	2024-12-03 23:03:30
5048	38	84	3	2024-12-03 23:03:30	2024-12-03 23:04:11
5055	38	84	3	2024-12-03 23:04:11	2024-12-03 23:04:51
5062	38	84	3	2024-12-03 23:04:51	2024-12-03 23:05:31
5069	38	84	3	2024-12-03 23:05:31	2024-12-03 23:06:12
5076	38	84	3	2024-12-03 23:06:12	2024-12-03 23:06:52
5083	38	84	3	2024-12-03 23:06:52	2024-12-03 23:07:32
5090	38	84	3	2024-12-03 23:07:32	2024-12-03 23:08:13
5097	38	84	3	2024-12-03 23:08:13	2024-12-03 23:08:53
5104	38	84	3	2024-12-03 23:08:53	2024-12-03 23:09:33
5111	38	84	3	2024-12-03 23:09:33	2024-12-03 23:10:14
5118	38	84	3	2024-12-03 23:10:14	2024-12-03 23:10:54
5125	38	84	3	2024-12-03 23:10:54	2024-12-03 23:11:34
5132	38	84	3	2024-12-03 23:11:34	2024-12-03 23:12:15
5139	38	84	3	2024-12-03 23:12:15	2024-12-03 23:12:55
5146	38	84	3	2024-12-03 23:12:55	2024-12-03 23:13:35
1651	38	82	3	2024-12-03 16:45:14	2024-12-03 16:45:54
1654	38	82	3	2024-12-03 16:45:54	2024-12-03 16:46:34
1657	38	82	3	2024-12-03 16:46:34	2024-12-03 16:47:15
1660	38	82	3	2024-12-03 16:47:15	2024-12-03 16:47:56
1663	38	82	3	2024-12-03 16:47:56	2024-12-03 16:48:36
1666	38	82	3	2024-12-03 16:48:36	2024-12-03 16:49:16
1669	38	82	3	2024-12-03 16:49:16	2024-12-03 16:49:57
1672	38	82	3	2024-12-03 16:49:57	2024-12-03 16:50:37
1675	38	82	3	2024-12-03 16:50:37	2024-12-03 16:51:18
1678	38	82	3	2024-12-03 16:51:18	2024-12-03 16:51:58
1681	38	82	3	2024-12-03 16:51:58	2024-12-03 16:52:38
3890	38	82	3	2024-12-03 21:12:06	2024-12-03 21:12:46
3897	38	82	3	2024-12-03 21:12:46	2024-12-03 21:13:26
3904	38	82	3	2024-12-03 21:13:26	2024-12-03 21:14:07
3911	38	82	3	2024-12-03 21:14:07	2024-12-03 21:14:47
3918	38	82	3	2024-12-03 21:14:47	2024-12-03 21:15:27
3925	38	82	3	2024-12-03 21:15:27	2024-12-03 21:16:08
3932	38	82	3	2024-12-03 21:16:08	2024-12-03 21:16:48
3939	38	82	3	2024-12-03 21:16:48	2024-12-03 21:17:28
3946	38	82	3	2024-12-03 21:17:28	2024-12-03 21:18:09
3953	38	82	3	2024-12-03 21:18:09	2024-12-03 21:18:50
3960	38	82	3	2024-12-03 21:18:50	2024-12-03 21:19:30
3967	38	82	3	2024-12-03 21:19:30	2024-12-03 21:20:11
3974	38	82	3	2024-12-03 21:20:11	2024-12-03 21:20:51
3981	38	82	3	2024-12-03 21:20:51	2024-12-03 21:21:31
3988	38	82	3	2024-12-03 21:21:31	2024-12-03 21:22:12
3995	38	82	3	2024-12-03 21:22:12	2024-12-03 21:22:52
4002	38	82	3	2024-12-03 21:22:52	2024-12-03 21:23:32
4009	38	82	3	2024-12-03 21:23:32	2024-12-03 21:24:13
4016	38	82	3	2024-12-03 21:24:13	2024-12-03 21:24:53
4023	38	82	3	2024-12-03 21:24:53	2024-12-03 21:25:33
4030	38	82	3	2024-12-03 21:25:33	2024-12-03 21:26:14
4037	38	82	3	2024-12-03 21:26:14	2024-12-03 21:26:54
4044	38	82	3	2024-12-03 21:26:54	2024-12-03 21:27:34
4051	38	82	3	2024-12-03 21:27:34	2024-12-03 21:28:15
4058	38	82	3	2024-12-03 21:28:15	2024-12-03 21:28:55
4065	38	82	3	2024-12-03 21:28:55	2024-12-03 21:29:35
4072	38	82	3	2024-12-03 21:29:35	2024-12-03 21:30:15
4079	38	82	3	2024-12-03 21:30:15	2024-12-03 21:30:56
4086	38	82	3	2024-12-03 21:30:56	2024-12-03 21:31:36
4093	38	82	3	2024-12-03 21:31:36	2024-12-03 21:32:16
4100	38	82	3	2024-12-03 21:32:16	2024-12-03 21:32:57
4882	38	86	3	2024-12-03 22:47:30	2024-12-03 22:48:10
4889	38	86	3	2024-12-03 22:48:10	2024-12-03 22:48:51
4896	38	86	3	2024-12-03 22:48:51	2024-12-03 22:49:31
4903	38	86	3	2024-12-03 22:49:31	2024-12-03 22:50:11
4910	38	86	3	2024-12-03 22:50:11	2024-12-03 22:50:52
4917	38	86	3	2024-12-03 22:50:52	2024-12-03 22:51:32
4924	38	86	3	2024-12-03 22:51:32	2024-12-03 22:52:12
4931	38	86	3	2024-12-03 22:52:12	2024-12-03 22:52:53
4938	38	86	3	2024-12-03 22:52:53	2024-12-03 22:53:33
4945	38	86	3	2024-12-03 22:53:33	2024-12-03 22:54:13
4952	38	86	3	2024-12-03 22:54:13	2024-12-03 22:54:53
4959	38	86	3	2024-12-03 22:54:53	2024-12-03 22:55:34
4966	38	86	3	2024-12-03 22:55:34	2024-12-03 22:56:14
4973	38	86	3	2024-12-03 22:56:14	2024-12-03 22:56:54
4980	38	86	3	2024-12-03 22:56:54	2024-12-03 22:57:35
4987	38	86	3	2024-12-03 22:57:35	2024-12-03 22:58:15
4994	38	86	3	2024-12-03 22:58:15	2024-12-03 22:58:55
5001	38	86	3	2024-12-03 22:58:55	2024-12-03 22:59:36
5008	38	86	3	2024-12-03 22:59:36	2024-12-03 23:00:17
5015	38	86	3	2024-12-03 23:00:17	2024-12-03 23:00:58
5022	38	86	3	2024-12-03 23:00:58	2024-12-03 23:01:39
5029	38	86	3	2024-12-03 23:01:39	2024-12-03 23:02:19
5036	38	86	3	2024-12-03 23:02:19	2024-12-03 23:02:59
5043	38	86	3	2024-12-03 23:02:59	2024-12-03 23:03:40
5050	38	86	3	2024-12-03 23:03:40	2024-12-03 23:04:20
5057	38	86	3	2024-12-03 23:04:20	2024-12-03 23:05:00
5064	38	86	3	2024-12-03 23:05:00	2024-12-03 23:05:41
5071	38	86	3	2024-12-03 23:05:41	2024-12-03 23:06:21
5078	38	86	3	2024-12-03 23:06:21	2024-12-03 23:07:01
5085	38	86	3	2024-12-03 23:07:01	2024-12-03 23:07:42
5092	38	86	3	2024-12-03 23:07:42	2024-12-03 23:08:22
5099	38	86	3	2024-12-03 23:08:22	2024-12-03 23:09:02
5106	38	86	3	2024-12-03 23:09:02	2024-12-03 23:09:43
5113	38	86	3	2024-12-03 23:09:43	2024-12-03 23:10:23
5120	38	86	3	2024-12-03 23:10:23	2024-12-03 23:11:03
5127	38	86	3	2024-12-03 23:11:03	2024-12-03 23:11:43
5134	38	86	3	2024-12-03 23:11:43	2024-12-03 23:12:24
5141	38	86	3	2024-12-03 23:12:24	2024-12-03 23:13:04
5148	38	86	3	2024-12-03 23:13:04	2024-12-03 23:13:44
1652	38	83	3	2024-12-03 16:45:19	2024-12-03 16:45:59
1655	38	83	3	2024-12-03 16:45:59	2024-12-03 16:46:39
1658	38	83	3	2024-12-03 16:46:39	2024-12-03 16:47:20
1661	38	83	3	2024-12-03 16:47:20	2024-12-03 16:48:00
1664	38	83	3	2024-12-03 16:48:00	2024-12-03 16:48:40
1667	38	83	3	2024-12-03 16:48:40	2024-12-03 16:49:21
1670	38	83	3	2024-12-03 16:49:21	2024-12-03 16:50:01
1673	38	83	3	2024-12-03 16:50:01	2024-12-03 16:50:41
1676	38	83	3	2024-12-03 16:50:41	2024-12-03 16:51:22
1679	38	83	3	2024-12-03 16:51:22	2024-12-03 16:52:02
1682	38	83	3	2024-12-03 16:52:02	2024-12-03 16:52:42
1684	38	82	3	2024-12-03 16:52:38	2024-12-03 16:53:19
1685	38	83	3	2024-12-03 16:52:42	2024-12-03 16:53:23
1686	38	81	3	2024-12-03 16:53:15	2024-12-03 16:53:56
1687	38	82	3	2024-12-03 16:53:19	2024-12-03 16:53:59
1688	38	83	3	2024-12-03 16:53:23	2024-12-03 16:54:03
1689	38	81	3	2024-12-03 16:53:56	2024-12-03 16:54:36
1690	38	82	3	2024-12-03 16:53:59	2024-12-03 16:54:39
1691	38	83	3	2024-12-03 16:54:03	2024-12-03 16:54:43
1692	38	81	3	2024-12-03 16:54:36	2024-12-03 16:55:16
1693	38	82	3	2024-12-03 16:54:39	2024-12-03 16:55:20
1694	38	83	3	2024-12-03 16:54:43	2024-12-03 16:55:24
1695	38	81	3	2024-12-03 16:55:16	2024-12-03 16:55:57
1696	38	82	3	2024-12-03 16:55:20	2024-12-03 16:56:00
1697	38	83	3	2024-12-03 16:55:24	2024-12-03 16:56:04
1698	38	81	3	2024-12-03 16:55:57	2024-12-03 16:56:37
1699	38	82	3	2024-12-03 16:56:00	2024-12-03 16:56:41
1700	38	83	3	2024-12-03 16:56:04	2024-12-03 16:56:44
1701	38	81	3	2024-12-03 16:56:37	2024-12-03 16:57:17
1702	38	82	3	2024-12-03 16:56:41	2024-12-03 16:57:21
1703	38	83	3	2024-12-03 16:56:44	2024-12-03 16:57:25
1704	38	81	3	2024-12-03 16:57:17	2024-12-03 16:57:58
1705	38	82	3	2024-12-03 16:57:21	2024-12-03 16:58:01
1706	38	83	3	2024-12-03 16:57:25	2024-12-03 16:58:05
1707	38	81	3	2024-12-03 16:57:58	2024-12-03 16:58:38
1708	38	82	3	2024-12-03 16:58:01	2024-12-03 16:58:42
1709	38	83	3	2024-12-03 16:58:05	2024-12-03 16:58:45
1710	38	84	3	2024-12-03 16:58:19	2024-12-03 16:59:00
1711	38	81	3	2024-12-03 16:58:38	2024-12-03 16:59:18
1712	38	82	3	2024-12-03 16:58:42	2024-12-03 16:59:22
1713	38	83	3	2024-12-03 16:58:45	2024-12-03 16:59:26
1714	38	84	3	2024-12-03 16:59:00	2024-12-03 16:59:40
1715	38	81	3	2024-12-03 16:59:18	2024-12-03 16:59:59
1716	38	82	3	2024-12-03 16:59:22	2024-12-03 17:00:02
1717	38	83	3	2024-12-03 16:59:26	2024-12-03 17:00:06
1718	38	84	3	2024-12-03 16:59:40	2024-12-03 17:00:20
1719	38	81	3	2024-12-03 16:59:59	2024-12-03 17:00:39
1720	38	82	3	2024-12-03 17:00:02	2024-12-03 17:00:43
1721	38	83	3	2024-12-03 17:00:06	2024-12-03 17:00:46
1722	38	84	3	2024-12-03 17:00:20	2024-12-03 17:01:01
1723	38	81	3	2024-12-03 17:00:39	2024-12-03 17:01:19
1724	38	82	3	2024-12-03 17:00:43	2024-12-03 17:01:23
1725	38	83	3	2024-12-03 17:00:46	2024-12-03 17:01:27
1726	38	84	3	2024-12-03 17:01:01	2024-12-03 17:01:41
1727	38	81	3	2024-12-03 17:01:19	2024-12-03 17:02:00
1728	38	82	3	2024-12-03 17:01:23	2024-12-03 17:02:04
1729	38	83	3	2024-12-03 17:01:27	2024-12-03 17:02:07
1730	38	84	3	2024-12-03 17:01:41	2024-12-03 17:02:21
1731	38	81	3	2024-12-03 17:02:00	2024-12-03 17:02:40
1732	38	82	3	2024-12-03 17:02:04	2024-12-03 17:02:44
1733	38	83	3	2024-12-03 17:02:07	2024-12-03 17:02:47
1734	38	84	3	2024-12-03 17:02:21	2024-12-03 17:03:02
1735	38	81	3	2024-12-03 17:02:40	2024-12-03 17:03:20
1736	38	82	3	2024-12-03 17:02:44	2024-12-03 17:03:24
1737	38	83	3	2024-12-03 17:02:47	2024-12-03 17:03:28
1738	38	84	3	2024-12-03 17:03:02	2024-12-03 17:03:42
1739	38	81	3	2024-12-03 17:03:20	2024-12-03 17:04:01
1740	38	82	3	2024-12-03 17:03:24	2024-12-03 17:04:05
1741	38	83	3	2024-12-03 17:03:28	2024-12-03 17:04:08
1742	38	84	3	2024-12-03 17:03:42	2024-12-03 17:04:23
1743	38	81	3	2024-12-03 17:04:01	2024-12-03 17:04:41
1744	38	82	3	2024-12-03 17:04:05	2024-12-03 17:04:45
1745	38	83	3	2024-12-03 17:04:08	2024-12-03 17:04:48
1746	38	84	3	2024-12-03 17:04:23	2024-12-03 17:05:03
1747	38	81	3	2024-12-03 17:04:41	2024-12-03 17:05:21
1748	38	82	3	2024-12-03 17:04:45	2024-12-03 17:05:25
1749	38	83	3	2024-12-03 17:04:48	2024-12-03 17:05:29
1750	38	84	3	2024-12-03 17:05:03	2024-12-03 17:05:43
1751	38	81	3	2024-12-03 17:05:21	2024-12-03 17:06:02
1752	38	82	3	2024-12-03 17:05:25	2024-12-03 17:06:06
1753	38	83	3	2024-12-03 17:05:29	2024-12-03 17:06:09
1754	38	84	3	2024-12-03 17:05:43	2024-12-03 17:06:24
1755	38	81	3	2024-12-03 17:06:02	2024-12-03 17:06:42
1756	38	82	3	2024-12-03 17:06:06	2024-12-03 17:06:46
1757	38	83	3	2024-12-03 17:06:09	2024-12-03 17:06:49
1758	38	84	3	2024-12-03 17:06:24	2024-12-03 17:07:04
1759	38	81	3	2024-12-03 17:06:42	2024-12-03 17:07:22
1760	38	82	3	2024-12-03 17:06:46	2024-12-03 17:07:27
1761	38	83	3	2024-12-03 17:06:49	2024-12-03 17:07:30
1762	38	84	3	2024-12-03 17:07:04	2024-12-03 17:07:44
1763	38	81	3	2024-12-03 17:07:22	2024-12-03 17:08:03
1764	38	82	3	2024-12-03 17:07:27	2024-12-03 17:08:07
1765	38	83	3	2024-12-03 17:07:30	2024-12-03 17:08:10
1766	38	84	3	2024-12-03 17:07:44	2024-12-03 17:08:25
1767	38	81	3	2024-12-03 17:08:03	2024-12-03 17:08:43
1768	38	82	3	2024-12-03 17:08:07	2024-12-03 17:08:47
1769	38	83	3	2024-12-03 17:08:10	2024-12-03 17:08:50
1770	38	84	3	2024-12-03 17:08:25	2024-12-03 17:09:05
1771	38	81	3	2024-12-03 17:08:43	2024-12-03 17:09:23
1772	38	82	3	2024-12-03 17:08:47	2024-12-03 17:09:28
1773	38	83	3	2024-12-03 17:08:50	2024-12-03 17:09:31
1774	38	84	3	2024-12-03 17:09:05	2024-12-03 17:09:45
1775	38	81	3	2024-12-03 17:09:23	2024-12-03 17:10:04
1776	38	82	3	2024-12-03 17:09:28	2024-12-03 17:10:08
1777	38	83	3	2024-12-03 17:09:31	2024-12-03 17:10:11
1778	38	84	3	2024-12-03 17:09:45	2024-12-03 17:10:26
1779	38	81	3	2024-12-03 17:10:04	2024-12-03 17:10:44
1780	38	82	3	2024-12-03 17:10:08	2024-12-03 17:10:48
1781	38	83	3	2024-12-03 17:10:11	2024-12-03 17:10:51
1782	38	84	3	2024-12-03 17:10:26	2024-12-03 17:11:06
1783	38	81	3	2024-12-03 17:10:44	2024-12-03 17:11:24
1784	38	82	3	2024-12-03 17:10:48	2024-12-03 17:11:29
3892	38	83	3	2024-12-03 21:12:14	2024-12-03 21:12:54
1785	38	83	3	2024-12-03 17:10:51	2024-12-03 17:11:31
1789	38	83	3	2024-12-03 17:11:31	2024-12-03 17:12:12
1793	38	83	3	2024-12-03 17:12:12	2024-12-03 17:12:52
3899	38	83	3	2024-12-03 21:12:54	2024-12-03 21:13:35
3906	38	83	3	2024-12-03 21:13:35	2024-12-03 21:14:15
3913	38	83	3	2024-12-03 21:14:15	2024-12-03 21:14:55
3920	38	83	3	2024-12-03 21:14:55	2024-12-03 21:15:36
3927	38	83	3	2024-12-03 21:15:36	2024-12-03 21:16:16
3934	38	83	3	2024-12-03 21:16:16	2024-12-03 21:16:56
3941	38	83	3	2024-12-03 21:16:56	2024-12-03 21:17:37
3948	38	83	3	2024-12-03 21:17:37	2024-12-03 21:18:18
3955	38	83	3	2024-12-03 21:18:18	2024-12-03 21:18:59
3962	38	83	3	2024-12-03 21:18:59	2024-12-03 21:19:39
3969	38	83	3	2024-12-03 21:19:39	2024-12-03 21:20:19
3976	38	83	3	2024-12-03 21:20:19	2024-12-03 21:21:00
3983	38	83	3	2024-12-03 21:21:00	2024-12-03 21:21:40
3990	38	83	3	2024-12-03 21:21:40	2024-12-03 21:22:21
3997	38	83	3	2024-12-03 21:22:21	2024-12-03 21:23:01
4004	38	83	3	2024-12-03 21:23:01	2024-12-03 21:23:41
4011	38	83	3	2024-12-03 21:23:41	2024-12-03 21:24:22
4018	38	83	3	2024-12-03 21:24:22	2024-12-03 21:25:02
4025	38	83	3	2024-12-03 21:25:02	2024-12-03 21:25:42
4032	38	83	3	2024-12-03 21:25:42	2024-12-03 21:26:23
4039	38	83	3	2024-12-03 21:26:23	2024-12-03 21:27:03
4046	38	83	3	2024-12-03 21:27:03	2024-12-03 21:27:43
4053	38	83	3	2024-12-03 21:27:43	2024-12-03 21:28:24
4060	38	83	3	2024-12-03 21:28:24	2024-12-03 21:29:04
4067	38	83	3	2024-12-03 21:29:04	2024-12-03 21:29:44
4074	38	83	3	2024-12-03 21:29:44	2024-12-03 21:30:25
4081	38	83	3	2024-12-03 21:30:25	2024-12-03 21:31:05
4088	38	83	3	2024-12-03 21:31:05	2024-12-03 21:31:46
4095	38	83	3	2024-12-03 21:31:46	2024-12-03 21:32:26
4102	38	83	3	2024-12-03 21:32:26	2024-12-03 21:33:06
4884	38	82	3	2024-12-03 22:47:38	2024-12-03 22:48:19
4891	38	82	3	2024-12-03 22:48:19	2024-12-03 22:48:59
4898	38	82	3	2024-12-03 22:48:59	2024-12-03 22:49:40
4905	38	82	3	2024-12-03 22:49:40	2024-12-03 22:50:20
4912	38	82	3	2024-12-03 22:50:20	2024-12-03 22:51:00
4919	38	82	3	2024-12-03 22:51:00	2024-12-03 22:51:41
4926	38	82	3	2024-12-03 22:51:41	2024-12-03 22:52:21
4933	38	82	3	2024-12-03 22:52:21	2024-12-03 22:53:01
4940	38	82	3	2024-12-03 22:53:01	2024-12-03 22:53:42
4947	38	82	3	2024-12-03 22:53:42	2024-12-03 22:54:22
4954	38	82	3	2024-12-03 22:54:22	2024-12-03 22:55:02
4961	38	82	3	2024-12-03 22:55:02	2024-12-03 22:55:43
4968	38	82	3	2024-12-03 22:55:43	2024-12-03 22:56:23
4975	38	82	3	2024-12-03 22:56:23	2024-12-03 22:57:03
4982	38	82	3	2024-12-03 22:57:03	2024-12-03 22:57:44
4989	38	82	3	2024-12-03 22:57:44	2024-12-03 22:58:24
4996	38	82	3	2024-12-03 22:58:24	2024-12-03 22:59:05
5003	38	82	3	2024-12-03 22:59:05	2024-12-03 22:59:46
5010	38	82	3	2024-12-03 22:59:46	2024-12-03 23:00:27
5017	38	82	3	2024-12-03 23:00:27	2024-12-03 23:01:08
5024	38	82	3	2024-12-03 23:01:08	2024-12-03 23:01:48
5031	38	82	3	2024-12-03 23:01:48	2024-12-03 23:02:28
5038	38	82	3	2024-12-03 23:02:28	2024-12-03 23:03:09
5045	38	82	3	2024-12-03 23:03:09	2024-12-03 23:03:49
5052	38	82	3	2024-12-03 23:03:49	2024-12-03 23:04:29
5059	38	82	3	2024-12-03 23:04:29	2024-12-03 23:05:10
5066	38	82	3	2024-12-03 23:05:10	2024-12-03 23:05:50
5073	38	82	3	2024-12-03 23:05:50	2024-12-03 23:06:31
5080	38	82	3	2024-12-03 23:06:31	2024-12-03 23:07:11
5087	38	82	3	2024-12-03 23:07:11	2024-12-03 23:07:51
5094	38	82	3	2024-12-03 23:07:51	2024-12-03 23:08:32
5101	38	82	3	2024-12-03 23:08:32	2024-12-03 23:09:12
5108	38	82	3	2024-12-03 23:09:12	2024-12-03 23:09:53
5115	38	82	3	2024-12-03 23:09:53	2024-12-03 23:10:33
5122	38	82	3	2024-12-03 23:10:33	2024-12-03 23:11:13
5129	38	82	3	2024-12-03 23:11:13	2024-12-03 23:11:54
5136	38	82	3	2024-12-03 23:11:54	2024-12-03 23:12:34
5143	38	82	3	2024-12-03 23:12:34	2024-12-03 23:13:14
5150	38	82	3	2024-12-03 23:13:14	2024-12-03 23:13:55
1786	38	84	3	2024-12-03 17:11:06	2024-12-03 17:11:47
1790	38	84	3	2024-12-03 17:11:47	2024-12-03 17:12:27
1794	38	84	3	2024-12-03 17:12:27	2024-12-03 17:13:07
4104	38	86	3	2024-12-03 21:32:50	2024-12-03 21:33:30
4111	38	86	3	2024-12-03 21:33:30	2024-12-03 21:34:10
4118	38	86	3	2024-12-03 21:34:10	2024-12-03 21:34:51
4125	38	86	3	2024-12-03 21:34:51	2024-12-03 21:35:31
4132	38	86	3	2024-12-03 21:35:31	2024-12-03 21:36:12
4139	38	86	3	2024-12-03 21:36:12	2024-12-03 21:36:52
4146	38	86	3	2024-12-03 21:36:52	2024-12-03 21:37:32
4153	38	86	3	2024-12-03 21:37:32	2024-12-03 21:38:13
4160	38	86	3	2024-12-03 21:38:13	2024-12-03 21:38:53
4167	38	86	3	2024-12-03 21:38:53	2024-12-03 21:39:33
4174	38	86	3	2024-12-03 21:39:33	2024-12-03 21:40:14
4181	38	86	3	2024-12-03 21:40:14	2024-12-03 21:40:54
4188	38	86	3	2024-12-03 21:40:54	2024-12-03 21:41:34
4195	38	86	3	2024-12-03 21:41:35	2024-12-03 21:42:15
4202	38	86	3	2024-12-03 21:42:15	2024-12-03 21:42:55
4209	38	86	3	2024-12-03 21:42:55	2024-12-03 21:43:36
4216	38	86	3	2024-12-03 21:43:36	2024-12-03 21:44:16
4223	38	86	3	2024-12-03 21:44:16	2024-12-03 21:44:56
4230	38	86	3	2024-12-03 21:44:56	2024-12-03 21:45:37
4237	38	86	3	2024-12-03 21:45:37	2024-12-03 21:46:17
4244	38	86	3	2024-12-03 21:46:17	2024-12-03 21:46:57
4252	38	86	3	2024-12-03 21:46:57	2024-12-03 21:47:38
4259	38	86	3	2024-12-03 21:47:38	2024-12-03 21:48:18
4266	38	86	3	2024-12-03 21:48:18	2024-12-03 21:48:58
4273	38	86	3	2024-12-03 21:48:58	2024-12-03 21:49:39
4280	38	86	3	2024-12-03 21:49:39	2024-12-03 21:50:19
4287	38	86	3	2024-12-03 21:50:19	2024-12-03 21:50:59
4294	38	86	3	2024-12-03 21:50:59	2024-12-03 21:51:40
4301	38	86	3	2024-12-03 21:51:40	2024-12-03 21:52:20
4308	38	86	3	2024-12-03 21:52:20	2024-12-03 21:53:00
4315	38	86	3	2024-12-03 21:53:00	2024-12-03 21:53:41
4322	38	86	3	2024-12-03 21:53:41	2024-12-03 21:54:21
4329	38	86	3	2024-12-03 21:54:21	2024-12-03 21:55:01
5151	38	88	3	2024-12-03 23:13:21	2024-12-03 23:14:01
5158	38	88	3	2024-12-03 23:14:01	2024-12-03 23:14:42
5165	38	88	3	2024-12-03 23:14:42	2024-12-03 23:15:22
5172	38	88	3	2024-12-03 23:15:22	2024-12-03 23:16:02
5179	38	88	3	2024-12-03 23:16:02	2024-12-03 23:16:43
5186	38	88	3	2024-12-03 23:16:43	2024-12-03 23:17:23
5193	38	88	3	2024-12-03 23:17:23	2024-12-03 23:18:03
5200	38	88	3	2024-12-03 23:18:03	2024-12-03 23:18:44
5207	38	88	3	2024-12-03 23:18:44	2024-12-03 23:19:24
5214	38	88	3	2024-12-03 23:19:24	2024-12-03 23:20:04
5221	38	88	3	2024-12-03 23:20:04	2024-12-03 23:20:45
5228	38	88	3	2024-12-03 23:20:45	2024-12-03 23:21:25
5235	38	88	3	2024-12-03 23:21:25	2024-12-03 23:22:05
5242	38	88	3	2024-12-03 23:22:05	2024-12-03 23:22:45
5249	38	88	3	2024-12-03 23:22:45	2024-12-03 23:23:26
5256	38	88	3	2024-12-03 23:23:26	2024-12-03 23:24:06
5263	38	88	3	2024-12-03 23:24:06	2024-12-03 23:24:47
5270	38	88	3	2024-12-03 23:24:47	2024-12-03 23:25:27
5277	38	88	3	2024-12-03 23:25:27	2024-12-03 23:26:07
5284	38	88	3	2024-12-03 23:26:07	2024-12-03 23:26:48
5291	38	88	3	2024-12-03 23:26:48	2024-12-03 23:27:28
5298	38	88	3	2024-12-03 23:27:28	2024-12-03 23:28:08
5305	38	88	3	2024-12-03 23:28:08	2024-12-03 23:28:49
5312	38	88	3	2024-12-03 23:28:49	2024-12-03 23:29:29
5319	38	88	3	2024-12-03 23:29:29	2024-12-03 23:30:09
5326	38	88	3	2024-12-03 23:30:09	2024-12-03 23:30:50
5333	38	88	3	2024-12-03 23:30:50	2024-12-03 23:31:30
5340	38	88	3	2024-12-03 23:31:30	2024-12-03 23:32:10
5347	38	88	3	2024-12-03 23:32:10	2024-12-03 23:32:50
5354	38	88	3	2024-12-03 23:32:50	2024-12-03 23:33:31
5361	38	88	3	2024-12-03 23:33:31	2024-12-03 23:34:11
5368	38	88	3	2024-12-03 23:34:11	2024-12-03 23:34:51
5375	38	88	3	2024-12-03 23:34:51	2024-12-03 23:35:32
5382	38	88	3	2024-12-03 23:35:32	2024-12-03 23:36:12
5389	38	88	3	2024-12-03 23:36:12	2024-12-03 23:36:53
5396	38	88	3	2024-12-03 23:36:53	2024-12-03 23:37:34
5403	38	88	3	2024-12-03 23:37:34	2024-12-03 23:38:15
5410	38	88	3	2024-12-03 23:38:15	2024-12-03 23:38:56
5417	38	88	3	2024-12-03 23:38:56	2024-12-03 23:39:36
5424	38	88	3	2024-12-03 23:39:36	2024-12-03 23:40:16
5431	38	88	3	2024-12-03 23:40:16	2024-12-03 23:40:57
1787	38	81	3	2024-12-03 17:11:24	2024-12-03 17:12:05
1791	38	81	3	2024-12-03 17:12:05	2024-12-03 17:12:45
4105	38	87	3	2024-12-03 21:32:51	2024-12-03 21:33:31
4112	38	87	3	2024-12-03 21:33:31	2024-12-03 21:34:11
4119	38	87	3	2024-12-03 21:34:11	2024-12-03 21:34:52
4126	38	87	3	2024-12-03 21:34:52	2024-12-03 21:35:32
4133	38	87	3	2024-12-03 21:35:32	2024-12-03 21:36:12
4140	38	87	3	2024-12-03 21:36:12	2024-12-03 21:36:53
4147	38	87	3	2024-12-03 21:36:53	2024-12-03 21:37:33
4154	38	87	3	2024-12-03 21:37:33	2024-12-03 21:38:13
4161	38	87	3	2024-12-03 21:38:13	2024-12-03 21:38:53
4168	38	87	3	2024-12-03 21:38:53	2024-12-03 21:39:34
4175	38	87	3	2024-12-03 21:39:34	2024-12-03 21:40:14
4182	38	87	3	2024-12-03 21:40:14	2024-12-03 21:40:54
4189	38	87	3	2024-12-03 21:40:54	2024-12-03 21:41:35
4196	38	87	3	2024-12-03 21:41:35	2024-12-03 21:42:15
4203	38	87	3	2024-12-03 21:42:15	2024-12-03 21:42:55
4210	38	87	3	2024-12-03 21:42:55	2024-12-03 21:43:36
4217	38	87	3	2024-12-03 21:43:36	2024-12-03 21:44:16
4224	38	87	3	2024-12-03 21:44:16	2024-12-03 21:44:56
4231	38	87	3	2024-12-03 21:44:56	2024-12-03 21:45:37
4238	38	87	3	2024-12-03 21:45:37	2024-12-03 21:46:17
4245	38	87	3	2024-12-03 21:46:17	2024-12-03 21:46:57
4251	38	87	3	2024-12-03 21:46:57	2024-12-03 21:47:38
4258	38	87	3	2024-12-03 21:47:38	2024-12-03 21:48:18
4265	38	87	3	2024-12-03 21:48:18	2024-12-03 21:48:58
4272	38	87	3	2024-12-03 21:48:58	2024-12-03 21:49:39
4279	38	87	3	2024-12-03 21:49:39	2024-12-03 21:50:19
4286	38	87	3	2024-12-03 21:50:19	2024-12-03 21:50:59
4293	38	87	3	2024-12-03 21:50:59	2024-12-03 21:51:40
4300	38	87	3	2024-12-03 21:51:40	2024-12-03 21:52:20
4307	38	87	3	2024-12-03 21:52:20	2024-12-03 21:53:00
4314	38	87	3	2024-12-03 21:53:00	2024-12-03 21:53:41
4321	38	87	3	2024-12-03 21:53:41	2024-12-03 21:54:21
4328	38	87	3	2024-12-03 21:54:21	2024-12-03 21:55:01
5152	38	83	3	2024-12-03 23:13:24	2024-12-03 23:14:05
5159	38	83	3	2024-12-03 23:14:05	2024-12-03 23:14:45
5166	38	83	3	2024-12-03 23:14:45	2024-12-03 23:15:26
5173	38	83	3	2024-12-03 23:15:26	2024-12-03 23:16:06
5180	38	83	3	2024-12-03 23:16:06	2024-12-03 23:16:46
5187	38	83	3	2024-12-03 23:16:46	2024-12-03 23:17:27
5194	38	83	3	2024-12-03 23:17:27	2024-12-03 23:18:07
5201	38	83	3	2024-12-03 23:18:07	2024-12-03 23:18:47
5208	38	83	3	2024-12-03 23:18:47	2024-12-03 23:19:28
5215	38	83	3	2024-12-03 23:19:28	2024-12-03 23:20:08
5222	38	83	3	2024-12-03 23:20:08	2024-12-03 23:20:48
5229	38	83	3	2024-12-03 23:20:48	2024-12-03 23:21:29
5236	38	83	3	2024-12-03 23:21:29	2024-12-03 23:22:09
5243	38	83	3	2024-12-03 23:22:09	2024-12-03 23:22:49
5250	38	83	3	2024-12-03 23:22:49	2024-12-03 23:23:30
5257	38	83	3	2024-12-03 23:23:30	2024-12-03 23:24:10
5264	38	83	3	2024-12-03 23:24:10	2024-12-03 23:24:50
5271	38	83	3	2024-12-03 23:24:50	2024-12-03 23:25:31
5278	38	83	3	2024-12-03 23:25:31	2024-12-03 23:26:11
5285	38	83	3	2024-12-03 23:26:11	2024-12-03 23:26:51
5292	38	83	3	2024-12-03 23:26:51	2024-12-03 23:27:32
5299	38	83	3	2024-12-03 23:27:32	2024-12-03 23:28:12
5306	38	83	3	2024-12-03 23:28:12	2024-12-03 23:28:52
5313	38	83	3	2024-12-03 23:28:52	2024-12-03 23:29:33
5320	38	83	3	2024-12-03 23:29:33	2024-12-03 23:30:13
5327	38	83	3	2024-12-03 23:30:13	2024-12-03 23:30:53
5334	38	83	3	2024-12-03 23:30:53	2024-12-03 23:31:34
5341	38	83	3	2024-12-03 23:31:34	2024-12-03 23:32:14
5348	38	83	3	2024-12-03 23:32:14	2024-12-03 23:32:54
5355	38	83	3	2024-12-03 23:32:54	2024-12-03 23:33:35
5362	38	83	3	2024-12-03 23:33:35	2024-12-03 23:34:15
5369	38	83	3	2024-12-03 23:34:15	2024-12-03 23:34:55
5376	38	83	3	2024-12-03 23:34:55	2024-12-03 23:35:36
5383	38	83	3	2024-12-03 23:35:36	2024-12-03 23:36:16
5390	38	83	3	2024-12-03 23:36:16	2024-12-03 23:36:57
5397	38	83	3	2024-12-03 23:36:57	2024-12-03 23:37:38
5404	38	83	3	2024-12-03 23:37:38	2024-12-03 23:38:19
5411	38	83	3	2024-12-03 23:38:19	2024-12-03 23:39:00
5418	38	83	3	2024-12-03 23:39:00	2024-12-03 23:39:40
5425	38	83	3	2024-12-03 23:39:40	2024-12-03 23:40:20
5432	38	83	3	2024-12-03 23:40:20	2024-12-03 23:41:01
1788	38	82	3	2024-12-03 17:11:29	2024-12-03 17:12:09
1792	38	82	3	2024-12-03 17:12:09	2024-12-03 17:12:49
1795	38	81	3	2024-12-03 17:12:45	2024-12-03 17:13:25
1796	38	82	3	2024-12-03 17:12:49	2024-12-03 17:13:30
1797	38	83	3	2024-12-03 17:12:52	2024-12-03 17:13:32
1798	38	84	3	2024-12-03 17:13:07	2024-12-03 17:13:48
1799	38	81	3	2024-12-03 17:13:25	2024-12-03 17:14:06
1800	38	82	3	2024-12-03 17:13:30	2024-12-03 17:14:10
1801	38	83	3	2024-12-03 17:13:32	2024-12-03 17:14:13
1802	38	84	3	2024-12-03 17:13:48	2024-12-03 17:14:28
1803	38	81	3	2024-12-03 17:14:06	2024-12-03 17:14:46
1804	38	82	3	2024-12-03 17:14:10	2024-12-03 17:14:50
1805	38	83	3	2024-12-03 17:14:13	2024-12-03 17:14:53
1806	38	84	3	2024-12-03 17:14:28	2024-12-03 17:15:08
1807	38	81	3	2024-12-03 17:14:46	2024-12-03 17:15:26
1808	38	82	3	2024-12-03 17:14:50	2024-12-03 17:15:31
1809	38	83	3	2024-12-03 17:14:53	2024-12-03 17:15:33
1810	38	84	3	2024-12-03 17:15:08	2024-12-03 17:15:49
1811	38	81	3	2024-12-03 17:15:26	2024-12-03 17:16:07
1812	38	82	3	2024-12-03 17:15:31	2024-12-03 17:16:11
1813	38	83	3	2024-12-03 17:15:33	2024-12-03 17:16:14
1818	29	85	0	2024-12-03 17:16:17	2024-12-03 17:16:17
1814	38	84	3	2024-12-03 17:15:49	2024-12-03 17:16:29
1815	38	81	3	2024-12-03 17:16:07	2024-12-03 17:16:47
1816	38	82	3	2024-12-03 17:16:11	2024-12-03 17:16:52
1817	38	83	3	2024-12-03 17:16:14	2024-12-03 17:16:54
1819	38	84	3	2024-12-03 17:16:29	2024-12-03 17:17:09
1820	38	81	3	2024-12-03 17:16:47	2024-12-03 17:17:27
1821	38	82	3	2024-12-03 17:16:52	2024-12-03 17:17:32
1822	38	83	3	2024-12-03 17:16:54	2024-12-03 17:17:34
1823	38	84	3	2024-12-03 17:17:10	2024-12-03 17:17:50
1824	38	81	3	2024-12-03 17:17:27	2024-12-03 17:18:08
1825	38	82	3	2024-12-03 17:17:32	2024-12-03 17:18:12
1826	38	83	3	2024-12-03 17:17:34	2024-12-03 17:18:15
1827	38	84	3	2024-12-03 17:17:50	2024-12-03 17:18:30
1828	38	81	3	2024-12-03 17:18:08	2024-12-03 17:18:48
1829	38	82	3	2024-12-03 17:18:12	2024-12-03 17:18:53
1830	38	83	3	2024-12-03 17:18:15	2024-12-03 17:18:55
1831	38	84	3	2024-12-03 17:18:30	2024-12-03 17:19:11
1832	38	81	3	2024-12-03 17:18:48	2024-12-03 17:19:28
1833	38	82	3	2024-12-03 17:18:53	2024-12-03 17:19:33
1834	38	83	3	2024-12-03 17:18:55	2024-12-03 17:19:36
1835	38	84	3	2024-12-03 17:19:11	2024-12-03 17:19:51
1836	38	81	3	2024-12-03 17:19:28	2024-12-03 17:20:09
1837	38	82	3	2024-12-03 17:19:33	2024-12-03 17:20:13
1838	38	83	3	2024-12-03 17:19:36	2024-12-03 17:20:16
1839	38	84	3	2024-12-03 17:19:51	2024-12-03 17:20:31
1840	38	81	3	2024-12-03 17:20:09	2024-12-03 17:20:49
1841	38	82	3	2024-12-03 17:20:13	2024-12-03 17:20:54
1842	38	83	3	2024-12-03 17:20:16	2024-12-03 17:20:56
1843	38	84	3	2024-12-03 17:20:31	2024-12-03 17:21:12
1844	38	81	3	2024-12-03 17:20:49	2024-12-03 17:21:29
1845	38	82	3	2024-12-03 17:20:54	2024-12-03 17:21:34
1846	38	83	3	2024-12-03 17:20:56	2024-12-03 17:21:37
1847	38	84	3	2024-12-03 17:21:12	2024-12-03 17:21:52
1848	38	81	3	2024-12-03 17:21:29	2024-12-03 17:22:10
1849	38	82	3	2024-12-03 17:21:34	2024-12-03 17:22:15
1850	38	83	3	2024-12-03 17:21:37	2024-12-03 17:22:17
1851	38	84	3	2024-12-03 17:21:52	2024-12-03 17:22:32
1852	38	81	3	2024-12-03 17:22:10	2024-12-03 17:22:50
1853	38	82	3	2024-12-03 17:22:15	2024-12-03 17:22:55
1854	38	83	3	2024-12-03 17:22:17	2024-12-03 17:22:57
1855	38	84	3	2024-12-03 17:22:32	2024-12-03 17:23:13
1856	38	81	3	2024-12-03 17:22:50	2024-12-03 17:23:30
1857	38	82	3	2024-12-03 17:22:55	2024-12-03 17:23:35
1858	38	83	3	2024-12-03 17:22:57	2024-12-03 17:23:38
1859	38	84	3	2024-12-03 17:23:13	2024-12-03 17:23:53
1860	38	81	3	2024-12-03 17:23:30	2024-12-03 17:24:11
1861	38	82	3	2024-12-03 17:23:35	2024-12-03 17:24:16
1862	38	83	3	2024-12-03 17:23:38	2024-12-03 17:24:18
1863	38	84	3	2024-12-03 17:23:53	2024-12-03 17:24:33
1864	38	81	3	2024-12-03 17:24:11	2024-12-03 17:24:51
1865	38	82	3	2024-12-03 17:24:16	2024-12-03 17:24:56
1866	38	83	3	2024-12-03 17:24:18	2024-12-03 17:24:59
1867	38	84	3	2024-12-03 17:24:34	2024-12-03 17:25:14
1868	38	81	3	2024-12-03 17:24:51	2024-12-03 17:25:31
1869	38	82	3	2024-12-03 17:24:56	2024-12-03 17:25:36
1870	38	83	3	2024-12-03 17:24:59	2024-12-03 17:25:39
1871	38	84	3	2024-12-03 17:25:14	2024-12-03 17:25:54
1872	38	81	3	2024-12-03 17:25:31	2024-12-03 17:26:12
1873	38	82	3	2024-12-03 17:25:36	2024-12-03 17:26:17
1874	38	83	3	2024-12-03 17:25:39	2024-12-03 17:26:20
1875	38	84	3	2024-12-03 17:25:54	2024-12-03 17:26:35
1876	38	81	3	2024-12-03 17:26:12	2024-12-03 17:26:52
1877	38	82	3	2024-12-03 17:26:17	2024-12-03 17:26:57
1878	38	83	3	2024-12-03 17:26:20	2024-12-03 17:27:00
1879	38	84	3	2024-12-03 17:26:35	2024-12-03 17:27:15
1880	38	81	3	2024-12-03 17:26:52	2024-12-03 17:27:32
1881	38	82	3	2024-12-03 17:26:57	2024-12-03 17:27:37
1882	38	83	3	2024-12-03 17:27:00	2024-12-03 17:27:40
1883	38	84	3	2024-12-03 17:27:15	2024-12-03 17:27:55
1884	38	81	3	2024-12-03 17:27:32	2024-12-03 17:28:13
1885	38	82	3	2024-12-03 17:27:37	2024-12-03 17:28:18
1886	38	83	3	2024-12-03 17:27:40	2024-12-03 17:28:21
1887	38	84	3	2024-12-03 17:27:55	2024-12-03 17:28:36
1888	38	81	3	2024-12-03 17:28:13	2024-12-03 17:28:53
1889	38	82	3	2024-12-03 17:28:18	2024-12-03 17:28:58
1890	38	83	3	2024-12-03 17:28:21	2024-12-03 17:29:01
1891	38	84	3	2024-12-03 17:28:36	2024-12-03 17:29:16
1892	38	81	3	2024-12-03 17:28:53	2024-12-03 17:29:33
1893	38	82	3	2024-12-03 17:28:58	2024-12-03 17:29:39
1894	38	83	3	2024-12-03 17:29:01	2024-12-03 17:29:42
1895	38	84	3	2024-12-03 17:29:16	2024-12-03 17:29:56
1896	38	81	3	2024-12-03 17:29:33	2024-12-03 17:30:14
1897	38	82	3	2024-12-03 17:29:39	2024-12-03 17:30:19
1898	38	83	3	2024-12-03 17:29:42	2024-12-03 17:30:22
1899	38	84	3	2024-12-03 17:29:56	2024-12-03 17:30:37
1900	38	81	3	2024-12-03 17:30:14	2024-12-03 17:30:54
1901	38	82	3	2024-12-03 17:30:19	2024-12-03 17:30:59
1902	38	83	3	2024-12-03 17:30:22	2024-12-03 17:31:02
1903	38	84	3	2024-12-03 17:30:37	2024-12-03 17:31:17
1904	38	81	3	2024-12-03 17:30:54	2024-12-03 17:31:34
1905	38	82	3	2024-12-03 17:30:59	2024-12-03 17:31:40
1909	38	82	3	2024-12-03 17:31:40	2024-12-03 17:32:20
4107	38	82	3	2024-12-03 21:32:57	2024-12-03 21:33:37
4114	38	82	3	2024-12-03 21:33:37	2024-12-03 21:34:17
4121	38	82	3	2024-12-03 21:34:17	2024-12-03 21:34:58
4128	38	82	3	2024-12-03 21:34:58	2024-12-03 21:35:38
4135	38	82	3	2024-12-03 21:35:38	2024-12-03 21:36:18
4142	38	82	3	2024-12-03 21:36:18	2024-12-03 21:36:59
4149	38	82	3	2024-12-03 21:36:59	2024-12-03 21:37:39
4156	38	82	3	2024-12-03 21:37:39	2024-12-03 21:38:19
4163	38	82	3	2024-12-03 21:38:19	2024-12-03 21:39:00
4170	38	82	3	2024-12-03 21:39:00	2024-12-03 21:39:40
4177	38	82	3	2024-12-03 21:39:40	2024-12-03 21:40:20
4184	38	82	3	2024-12-03 21:40:20	2024-12-03 21:41:00
4191	38	82	3	2024-12-03 21:41:00	2024-12-03 21:41:41
4198	38	82	3	2024-12-03 21:41:41	2024-12-03 21:42:21
4205	38	82	3	2024-12-03 21:42:21	2024-12-03 21:43:01
4212	38	82	3	2024-12-03 21:43:01	2024-12-03 21:43:42
4219	38	82	3	2024-12-03 21:43:42	2024-12-03 21:44:22
4226	38	82	3	2024-12-03 21:44:22	2024-12-03 21:45:02
4233	38	82	3	2024-12-03 21:45:02	2024-12-03 21:45:43
4240	38	82	3	2024-12-03 21:45:43	2024-12-03 21:46:23
4247	38	82	3	2024-12-03 21:46:23	2024-12-03 21:47:03
4254	38	82	3	2024-12-03 21:47:03	2024-12-03 21:47:44
4261	38	82	3	2024-12-03 21:47:44	2024-12-03 21:48:24
4268	38	82	3	2024-12-03 21:48:24	2024-12-03 21:49:04
4275	38	82	3	2024-12-03 21:49:04	2024-12-03 21:49:45
4282	38	82	3	2024-12-03 21:49:45	2024-12-03 21:50:25
4289	38	82	3	2024-12-03 21:50:25	2024-12-03 21:51:05
4296	38	82	3	2024-12-03 21:51:05	2024-12-03 21:51:46
4303	38	82	3	2024-12-03 21:51:46	2024-12-03 21:52:26
4310	38	82	3	2024-12-03 21:52:26	2024-12-03 21:53:06
4317	38	82	3	2024-12-03 21:53:06	2024-12-03 21:53:46
4324	38	82	3	2024-12-03 21:53:46	2024-12-03 21:54:27
4331	38	82	3	2024-12-03 21:54:27	2024-12-03 21:55:07
5154	38	87	3	2024-12-03 23:13:44	2024-12-03 23:14:24
5161	38	87	3	2024-12-03 23:14:24	2024-12-03 23:15:05
5168	38	87	3	2024-12-03 23:15:05	2024-12-03 23:15:45
5175	38	87	3	2024-12-03 23:15:45	2024-12-03 23:16:25
5182	38	87	3	2024-12-03 23:16:25	2024-12-03 23:17:06
5189	38	87	3	2024-12-03 23:17:06	2024-12-03 23:17:46
5196	38	87	3	2024-12-03 23:17:46	2024-12-03 23:18:26
5203	38	87	3	2024-12-03 23:18:26	2024-12-03 23:19:07
5210	38	87	3	2024-12-03 23:19:07	2024-12-03 23:19:47
5217	38	87	3	2024-12-03 23:19:47	2024-12-03 23:20:27
5224	38	87	3	2024-12-03 23:20:27	2024-12-03 23:21:08
5231	38	87	3	2024-12-03 23:21:08	2024-12-03 23:21:48
5238	38	87	3	2024-12-03 23:21:48	2024-12-03 23:22:28
5245	38	87	3	2024-12-03 23:22:28	2024-12-03 23:23:09
5252	38	87	3	2024-12-03 23:23:09	2024-12-03 23:23:49
5259	38	87	3	2024-12-03 23:23:49	2024-12-03 23:24:29
5266	38	87	3	2024-12-03 23:24:29	2024-12-03 23:25:10
5273	38	87	3	2024-12-03 23:25:10	2024-12-03 23:25:50
5280	38	87	3	2024-12-03 23:25:50	2024-12-03 23:26:30
5287	38	87	3	2024-12-03 23:26:30	2024-12-03 23:27:11
5294	38	87	3	2024-12-03 23:27:11	2024-12-03 23:27:51
5301	38	87	3	2024-12-03 23:27:51	2024-12-03 23:28:31
5308	38	87	3	2024-12-03 23:28:31	2024-12-03 23:29:12
5315	38	87	3	2024-12-03 23:29:12	2024-12-03 23:29:52
5322	38	87	3	2024-12-03 23:29:52	2024-12-03 23:30:32
5329	38	87	3	2024-12-03 23:30:32	2024-12-03 23:31:12
5336	38	87	3	2024-12-03 23:31:12	2024-12-03 23:31:53
5343	38	87	3	2024-12-03 23:31:53	2024-12-03 23:32:33
5350	38	87	3	2024-12-03 23:32:33	2024-12-03 23:33:13
5357	38	87	3	2024-12-03 23:33:13	2024-12-03 23:33:54
5364	38	87	3	2024-12-03 23:33:54	2024-12-03 23:34:34
5371	38	87	3	2024-12-03 23:34:34	2024-12-03 23:35:14
5378	38	87	3	2024-12-03 23:35:14	2024-12-03 23:35:55
5385	38	87	3	2024-12-03 23:35:55	2024-12-03 23:36:36
5392	38	87	3	2024-12-03 23:36:36	2024-12-03 23:37:17
5399	38	87	3	2024-12-03 23:37:17	2024-12-03 23:37:57
5406	38	87	3	2024-12-03 23:37:57	2024-12-03 23:38:38
5413	38	87	3	2024-12-03 23:38:38	2024-12-03 23:39:19
5420	38	87	3	2024-12-03 23:39:19	2024-12-03 23:40:00
5427	38	87	3	2024-12-03 23:40:00	2024-12-03 23:40:40
1906	38	83	3	2024-12-03 17:31:02	2024-12-03 17:31:43
1910	38	83	3	2024-12-03 17:31:43	2024-12-03 17:32:23
4108	38	88	3	2024-12-03 21:33:02	2024-12-03 21:33:43
4115	38	88	3	2024-12-03 21:33:43	2024-12-03 21:34:23
4122	38	88	3	2024-12-03 21:34:23	2024-12-03 21:35:03
4129	38	88	3	2024-12-03 21:35:03	2024-12-03 21:35:44
4136	38	88	3	2024-12-03 21:35:44	2024-12-03 21:36:24
4143	38	88	3	2024-12-03 21:36:24	2024-12-03 21:37:05
4150	38	88	3	2024-12-03 21:37:05	2024-12-03 21:37:45
4157	38	88	3	2024-12-03 21:37:45	2024-12-03 21:38:25
4164	38	88	3	2024-12-03 21:38:25	2024-12-03 21:39:06
4171	38	88	3	2024-12-03 21:39:06	2024-12-03 21:39:46
4178	38	88	3	2024-12-03 21:39:46	2024-12-03 21:40:26
4185	38	88	3	2024-12-03 21:40:26	2024-12-03 21:41:07
4192	38	88	3	2024-12-03 21:41:07	2024-12-03 21:41:47
4199	38	88	3	2024-12-03 21:41:47	2024-12-03 21:42:27
4206	38	88	3	2024-12-03 21:42:27	2024-12-03 21:43:08
4213	38	88	3	2024-12-03 21:43:08	2024-12-03 21:43:48
4220	38	88	3	2024-12-03 21:43:48	2024-12-03 21:44:28
4227	38	88	3	2024-12-03 21:44:28	2024-12-03 21:45:09
4234	38	88	3	2024-12-03 21:45:09	2024-12-03 21:45:49
4241	38	88	3	2024-12-03 21:45:49	2024-12-03 21:46:30
4248	38	88	3	2024-12-03 21:46:30	2024-12-03 21:47:10
4255	38	88	3	2024-12-03 21:47:10	2024-12-03 21:47:50
4262	38	88	3	2024-12-03 21:47:50	2024-12-03 21:48:31
4269	38	88	3	2024-12-03 21:48:31	2024-12-03 21:49:11
4276	38	88	3	2024-12-03 21:49:11	2024-12-03 21:49:51
4283	38	88	3	2024-12-03 21:49:51	2024-12-03 21:50:32
4290	38	88	3	2024-12-03 21:50:32	2024-12-03 21:51:12
4297	38	88	3	2024-12-03 21:51:12	2024-12-03 21:51:52
4304	38	88	3	2024-12-03 21:51:52	2024-12-03 21:52:33
4311	38	88	3	2024-12-03 21:52:33	2024-12-03 21:53:13
4318	38	88	3	2024-12-03 21:53:13	2024-12-03 21:53:53
4325	38	88	3	2024-12-03 21:53:53	2024-12-03 21:54:34
4332	38	88	3	2024-12-03 21:54:34	2024-12-03 21:55:14
5155	38	86	3	2024-12-03 23:13:44	2024-12-03 23:14:25
5162	38	86	3	2024-12-03 23:14:25	2024-12-03 23:15:05
5169	38	86	3	2024-12-03 23:15:05	2024-12-03 23:15:45
5176	38	86	3	2024-12-03 23:15:45	2024-12-03 23:16:26
5183	38	86	3	2024-12-03 23:16:26	2024-12-03 23:17:06
5190	38	86	3	2024-12-03 23:17:06	2024-12-03 23:17:46
5197	38	86	3	2024-12-03 23:17:46	2024-12-03 23:18:27
5204	38	86	3	2024-12-03 23:18:27	2024-12-03 23:19:07
5211	38	86	3	2024-12-03 23:19:07	2024-12-03 23:19:47
5218	38	86	3	2024-12-03 23:19:47	2024-12-03 23:20:28
5225	38	86	3	2024-12-03 23:20:28	2024-12-03 23:21:08
5232	38	86	3	2024-12-03 23:21:08	2024-12-03 23:21:48
5239	38	86	3	2024-12-03 23:21:48	2024-12-03 23:22:29
5246	38	86	3	2024-12-03 23:22:29	2024-12-03 23:23:09
5253	38	86	3	2024-12-03 23:23:09	2024-12-03 23:23:49
5260	38	86	3	2024-12-03 23:23:49	2024-12-03 23:24:30
5267	38	86	3	2024-12-03 23:24:30	2024-12-03 23:25:10
5274	38	86	3	2024-12-03 23:25:10	2024-12-03 23:25:50
5281	38	86	3	2024-12-03 23:25:50	2024-12-03 23:26:30
5288	38	86	3	2024-12-03 23:26:30	2024-12-03 23:27:11
5295	38	86	3	2024-12-03 23:27:11	2024-12-03 23:27:51
5302	38	86	3	2024-12-03 23:27:51	2024-12-03 23:28:31
5309	38	86	3	2024-12-03 23:28:31	2024-12-03 23:29:12
5316	38	86	3	2024-12-03 23:29:12	2024-12-03 23:29:52
5323	38	86	3	2024-12-03 23:29:52	2024-12-03 23:30:32
5330	38	86	3	2024-12-03 23:30:32	2024-12-03 23:31:13
5337	38	86	3	2024-12-03 23:31:13	2024-12-03 23:31:53
5344	38	86	3	2024-12-03 23:31:53	2024-12-03 23:32:33
5351	38	86	3	2024-12-03 23:32:33	2024-12-03 23:33:14
5358	38	86	3	2024-12-03 23:33:14	2024-12-03 23:33:54
5365	38	86	3	2024-12-03 23:33:54	2024-12-03 23:34:34
5372	38	86	3	2024-12-03 23:34:34	2024-12-03 23:35:15
5379	38	86	3	2024-12-03 23:35:15	2024-12-03 23:35:55
5386	38	86	3	2024-12-03 23:35:55	2024-12-03 23:36:36
5393	38	86	3	2024-12-03 23:36:36	2024-12-03 23:37:17
5400	38	86	3	2024-12-03 23:37:17	2024-12-03 23:37:58
5407	38	86	3	2024-12-03 23:37:58	2024-12-03 23:38:39
5414	38	86	3	2024-12-03 23:38:39	2024-12-03 23:39:20
5421	38	86	3	2024-12-03 23:39:20	2024-12-03 23:40:00
5428	38	86	3	2024-12-03 23:40:00	2024-12-03 23:40:40
1907	38	84	3	2024-12-03 17:31:17	2024-12-03 17:31:58
4109	38	83	3	2024-12-03 21:33:06	2024-12-03 21:33:47
4116	38	83	3	2024-12-03 21:33:47	2024-12-03 21:34:27
4123	38	83	3	2024-12-03 21:34:27	2024-12-03 21:35:07
4130	38	83	3	2024-12-03 21:35:07	2024-12-03 21:35:48
4137	38	83	3	2024-12-03 21:35:48	2024-12-03 21:36:28
4144	38	83	3	2024-12-03 21:36:28	2024-12-03 21:37:08
4151	38	83	3	2024-12-03 21:37:08	2024-12-03 21:37:49
4158	38	83	3	2024-12-03 21:37:49	2024-12-03 21:38:29
4165	38	83	3	2024-12-03 21:38:29	2024-12-03 21:39:09
4172	38	83	3	2024-12-03 21:39:09	2024-12-03 21:39:50
4179	38	83	3	2024-12-03 21:39:50	2024-12-03 21:40:30
4186	38	83	3	2024-12-03 21:40:30	2024-12-03 21:41:11
4193	38	83	3	2024-12-03 21:41:11	2024-12-03 21:41:51
4200	38	83	3	2024-12-03 21:41:51	2024-12-03 21:42:32
4207	38	83	3	2024-12-03 21:42:32	2024-12-03 21:43:12
4214	38	83	3	2024-12-03 21:43:12	2024-12-03 21:43:52
4221	38	83	3	2024-12-03 21:43:52	2024-12-03 21:44:33
4228	38	83	3	2024-12-03 21:44:33	2024-12-03 21:45:13
4235	38	83	3	2024-12-03 21:45:13	2024-12-03 21:45:53
4242	38	83	3	2024-12-03 21:45:53	2024-12-03 21:46:34
4249	38	83	3	2024-12-03 21:46:34	2024-12-03 21:47:14
4256	38	83	3	2024-12-03 21:47:14	2024-12-03 21:47:54
4263	38	83	3	2024-12-03 21:47:54	2024-12-03 21:48:35
4270	38	83	3	2024-12-03 21:48:35	2024-12-03 21:49:15
4277	38	83	3	2024-12-03 21:49:15	2024-12-03 21:49:55
4284	38	83	3	2024-12-03 21:49:55	2024-12-03 21:50:36
4291	38	83	3	2024-12-03 21:50:36	2024-12-03 21:51:16
4298	38	83	3	2024-12-03 21:51:16	2024-12-03 21:51:57
4305	38	83	3	2024-12-03 21:51:57	2024-12-03 21:52:37
4312	38	83	3	2024-12-03 21:52:37	2024-12-03 21:53:17
4319	38	83	3	2024-12-03 21:53:17	2024-12-03 21:53:58
4326	38	83	3	2024-12-03 21:53:58	2024-12-03 21:54:38
4333	38	83	3	2024-12-03 21:54:38	2024-12-03 21:55:18
5156	38	81	3	2024-12-03 23:13:45	2024-12-03 23:14:26
5163	38	81	3	2024-12-03 23:14:26	2024-12-03 23:15:06
5170	38	81	3	2024-12-03 23:15:06	2024-12-03 23:15:46
5177	38	81	3	2024-12-03 23:15:46	2024-12-03 23:16:27
5184	38	81	3	2024-12-03 23:16:27	2024-12-03 23:17:07
5191	38	81	3	2024-12-03 23:17:07	2024-12-03 23:17:47
5198	38	81	3	2024-12-03 23:17:47	2024-12-03 23:18:28
5205	38	81	3	2024-12-03 23:18:28	2024-12-03 23:19:08
5212	38	81	3	2024-12-03 23:19:08	2024-12-03 23:19:48
5219	38	81	3	2024-12-03 23:19:48	2024-12-03 23:20:29
5226	38	81	3	2024-12-03 23:20:29	2024-12-03 23:21:09
5233	38	81	3	2024-12-03 23:21:09	2024-12-03 23:21:49
5240	38	81	3	2024-12-03 23:21:49	2024-12-03 23:22:29
5247	38	81	3	2024-12-03 23:22:29	2024-12-03 23:23:10
5254	38	81	3	2024-12-03 23:23:10	2024-12-03 23:23:50
5261	38	81	3	2024-12-03 23:23:50	2024-12-03 23:24:30
5268	38	81	3	2024-12-03 23:24:30	2024-12-03 23:25:11
5275	38	81	3	2024-12-03 23:25:11	2024-12-03 23:25:51
5282	38	81	3	2024-12-03 23:25:51	2024-12-03 23:26:31
5289	38	81	3	2024-12-03 23:26:31	2024-12-03 23:27:12
5296	38	81	3	2024-12-03 23:27:12	2024-12-03 23:27:52
5303	38	81	3	2024-12-03 23:27:52	2024-12-03 23:28:32
5310	38	81	3	2024-12-03 23:28:32	2024-12-03 23:29:13
5317	38	81	3	2024-12-03 23:29:13	2024-12-03 23:29:53
5324	38	81	3	2024-12-03 23:29:53	2024-12-03 23:30:33
5331	38	81	3	2024-12-03 23:30:33	2024-12-03 23:31:13
5338	38	81	3	2024-12-03 23:31:13	2024-12-03 23:31:54
5345	38	81	3	2024-12-03 23:31:54	2024-12-03 23:32:34
5352	38	81	3	2024-12-03 23:32:34	2024-12-03 23:33:14
5359	38	81	3	2024-12-03 23:33:14	2024-12-03 23:33:55
5366	38	81	3	2024-12-03 23:33:55	2024-12-03 23:34:35
5373	38	81	3	2024-12-03 23:34:35	2024-12-03 23:35:15
5380	38	81	3	2024-12-03 23:35:15	2024-12-03 23:35:56
5387	38	81	3	2024-12-03 23:35:56	2024-12-03 23:36:37
5394	38	81	3	2024-12-03 23:36:37	2024-12-03 23:37:17
5401	38	81	3	2024-12-03 23:37:17	2024-12-03 23:37:58
5408	38	81	3	2024-12-03 23:37:58	2024-12-03 23:38:39
5415	38	81	3	2024-12-03 23:38:39	2024-12-03 23:39:21
5422	38	81	3	2024-12-03 23:39:21	2024-12-03 23:40:01
5429	38	81	3	2024-12-03 23:40:01	2024-12-03 23:40:41
1908	38	81	3	2024-12-03 17:31:34	2024-12-03 17:32:14
1911	38	84	3	2024-12-03 17:31:58	2024-12-03 17:32:38
1912	38	81	3	2024-12-03 17:32:14	2024-12-03 17:32:55
1913	38	82	3	2024-12-03 17:32:20	2024-12-03 17:33:00
1914	38	83	3	2024-12-03 17:32:23	2024-12-03 17:33:03
1915	38	84	3	2024-12-03 17:32:38	2024-12-03 17:33:18
1916	38	81	3	2024-12-03 17:32:55	2024-12-03 17:33:35
1917	38	82	3	2024-12-03 17:33:00	2024-12-03 17:33:41
1918	38	83	3	2024-12-03 17:33:03	2024-12-03 17:33:44
1919	38	84	3	2024-12-03 17:33:18	2024-12-03 17:33:59
1920	38	81	3	2024-12-03 17:33:35	2024-12-03 17:34:15
1921	38	82	3	2024-12-03 17:33:41	2024-12-03 17:34:21
1922	38	83	3	2024-12-03 17:33:44	2024-12-03 17:34:24
1923	38	84	3	2024-12-03 17:33:59	2024-12-03 17:34:39
1924	38	81	3	2024-12-03 17:34:15	2024-12-03 17:34:56
1925	38	82	3	2024-12-03 17:34:21	2024-12-03 17:35:02
1926	38	83	3	2024-12-03 17:34:24	2024-12-03 17:35:05
1927	38	84	3	2024-12-03 17:34:39	2024-12-03 17:35:19
1928	38	81	3	2024-12-03 17:34:56	2024-12-03 17:35:36
1929	38	82	3	2024-12-03 17:35:02	2024-12-03 17:35:42
1930	38	83	3	2024-12-03 17:35:05	2024-12-03 17:35:45
1931	38	84	3	2024-12-03 17:35:19	2024-12-03 17:36:00
1932	38	81	3	2024-12-03 17:35:36	2024-12-03 17:36:16
1933	38	82	3	2024-12-03 17:35:42	2024-12-03 17:36:22
1934	38	83	3	2024-12-03 17:35:45	2024-12-03 17:36:25
1935	38	84	3	2024-12-03 17:36:00	2024-12-03 17:36:40
1936	38	81	3	2024-12-03 17:36:16	2024-12-03 17:36:57
1937	38	82	3	2024-12-03 17:36:22	2024-12-03 17:37:03
1938	38	83	3	2024-12-03 17:36:25	2024-12-03 17:37:06
1939	38	84	3	2024-12-03 17:36:40	2024-12-03 17:37:20
1940	38	81	3	2024-12-03 17:36:57	2024-12-03 17:37:37
1941	38	82	3	2024-12-03 17:37:03	2024-12-03 17:37:43
1942	38	83	3	2024-12-03 17:37:06	2024-12-03 17:37:46
1943	38	84	3	2024-12-03 17:37:20	2024-12-03 17:38:01
1944	38	81	3	2024-12-03 17:37:37	2024-12-03 17:38:17
1945	38	82	3	2024-12-03 17:37:43	2024-12-03 17:38:23
1946	38	83	3	2024-12-03 17:37:46	2024-12-03 17:38:26
1947	38	84	3	2024-12-03 17:38:01	2024-12-03 17:38:41
1948	38	81	3	2024-12-03 17:38:17	2024-12-03 17:38:58
1949	38	82	3	2024-12-03 17:38:23	2024-12-03 17:39:04
1950	38	83	3	2024-12-03 17:38:26	2024-12-03 17:39:07
1951	38	84	3	2024-12-03 17:38:41	2024-12-03 17:39:22
1952	38	81	3	2024-12-03 17:38:58	2024-12-03 17:39:38
1953	38	82	3	2024-12-03 17:39:04	2024-12-03 17:39:44
1954	38	83	3	2024-12-03 17:39:07	2024-12-03 17:39:47
1955	38	84	3	2024-12-03 17:39:22	2024-12-03 17:40:02
1956	38	81	3	2024-12-03 17:39:38	2024-12-03 17:40:18
1957	38	82	3	2024-12-03 17:39:44	2024-12-03 17:40:25
1958	38	83	3	2024-12-03 17:39:47	2024-12-03 17:40:27
1959	38	84	3	2024-12-03 17:40:02	2024-12-03 17:40:42
1960	38	81	3	2024-12-03 17:40:18	2024-12-03 17:40:59
1961	38	82	3	2024-12-03 17:40:25	2024-12-03 17:41:05
1962	38	83	3	2024-12-03 17:40:27	2024-12-03 17:41:08
1963	38	84	3	2024-12-03 17:40:42	2024-12-03 17:41:23
1964	38	81	3	2024-12-03 17:40:59	2024-12-03 17:41:39
1965	38	82	3	2024-12-03 17:41:05	2024-12-03 17:41:45
1966	38	83	3	2024-12-03 17:41:08	2024-12-03 17:41:48
1967	38	84	3	2024-12-03 17:41:23	2024-12-03 17:42:03
1968	38	81	3	2024-12-03 17:41:39	2024-12-03 17:42:19
1969	38	82	3	2024-12-03 17:41:45	2024-12-03 17:42:26
1970	38	83	3	2024-12-03 17:41:48	2024-12-03 17:42:28
1971	38	84	3	2024-12-03 17:42:03	2024-12-03 17:42:43
1972	38	81	3	2024-12-03 17:42:19	2024-12-03 17:43:00
1973	38	82	3	2024-12-03 17:42:26	2024-12-03 17:43:06
1974	38	83	3	2024-12-03 17:42:28	2024-12-03 17:43:09
1975	38	84	3	2024-12-03 17:42:43	2024-12-03 17:43:24
1976	38	81	3	2024-12-03 17:43:00	2024-12-03 17:43:40
1977	38	82	3	2024-12-03 17:43:06	2024-12-03 17:43:46
1978	38	83	3	2024-12-03 17:43:09	2024-12-03 17:43:49
1979	38	84	3	2024-12-03 17:43:24	2024-12-03 17:44:04
1980	38	81	3	2024-12-03 17:43:40	2024-12-03 17:44:20
1981	38	82	3	2024-12-03 17:43:46	2024-12-03 17:44:27
1982	38	83	3	2024-12-03 17:43:49	2024-12-03 17:44:30
1983	38	84	3	2024-12-03 17:44:04	2024-12-03 17:44:44
1984	38	81	3	2024-12-03 17:44:20	2024-12-03 17:45:01
1985	38	82	3	2024-12-03 17:44:27	2024-12-03 17:45:07
1986	38	83	3	2024-12-03 17:44:30	2024-12-03 17:45:10
1987	38	84	3	2024-12-03 17:44:44	2024-12-03 17:45:25
1988	38	81	3	2024-12-03 17:45:01	2024-12-03 17:45:41
1989	38	82	3	2024-12-03 17:45:07	2024-12-03 17:45:47
1990	38	83	3	2024-12-03 17:45:10	2024-12-03 17:45:50
1991	38	84	3	2024-12-03 17:45:25	2024-12-03 17:46:05
1992	38	81	3	2024-12-03 17:45:41	2024-12-03 17:46:21
1993	38	82	3	2024-12-03 17:45:47	2024-12-03 17:46:28
1994	38	83	3	2024-12-03 17:45:50	2024-12-03 17:46:31
1995	38	84	3	2024-12-03 17:46:05	2024-12-03 17:46:46
1996	38	81	3	2024-12-03 17:46:21	2024-12-03 17:47:02
1997	38	82	3	2024-12-03 17:46:28	2024-12-03 17:47:08
1998	38	83	3	2024-12-03 17:46:31	2024-12-03 17:47:11
1999	38	84	3	2024-12-03 17:46:46	2024-12-03 17:47:26
2000	38	81	3	2024-12-03 17:47:02	2024-12-03 17:47:42
2001	38	82	3	2024-12-03 17:47:08	2024-12-03 17:47:49
2002	38	83	3	2024-12-03 17:47:11	2024-12-03 17:47:51
2003	38	84	3	2024-12-03 17:47:26	2024-12-03 17:48:06
2004	38	81	3	2024-12-03 17:47:42	2024-12-03 17:48:22
2005	38	82	3	2024-12-03 17:47:49	2024-12-03 17:48:29
2006	38	83	3	2024-12-03 17:47:51	2024-12-03 17:48:32
2007	38	84	3	2024-12-03 17:48:06	2024-12-03 17:48:47
2008	38	81	3	2024-12-03 17:48:22	2024-12-03 17:49:03
2009	38	82	3	2024-12-03 17:48:29	2024-12-03 17:49:09
2010	38	83	3	2024-12-03 17:48:32	2024-12-03 17:49:12
2011	38	84	3	2024-12-03 17:48:47	2024-12-03 17:49:27
2012	38	81	3	2024-12-03 17:49:03	2024-12-03 17:49:43
2013	38	82	3	2024-12-03 17:49:09	2024-12-03 17:49:50
2014	38	83	3	2024-12-03 17:49:12	2024-12-03 17:49:53
2015	38	84	3	2024-12-03 17:49:27	2024-12-03 17:50:07
2016	38	81	3	2024-12-03 17:49:43	2024-12-03 17:50:23
2017	38	82	3	2024-12-03 17:49:50	2024-12-03 17:50:30
2018	38	83	3	2024-12-03 17:49:53	2024-12-03 17:50:33
2019	38	84	3	2024-12-03 17:50:07	2024-12-03 17:50:48
2020	38	81	3	2024-12-03 17:50:23	2024-12-03 17:51:04
2021	38	82	3	2024-12-03 17:50:30	2024-12-03 17:51:11
2022	38	83	3	2024-12-03 17:50:33	2024-12-03 17:51:13
2027	38	83	3	2024-12-03 17:51:13	2024-12-03 17:51:54
4106	38	81	3	2024-12-03 21:32:53	2024-12-03 21:33:33
4113	38	81	3	2024-12-03 21:33:33	2024-12-03 21:34:13
4120	38	81	3	2024-12-03 21:34:13	2024-12-03 21:34:54
4127	38	81	3	2024-12-03 21:34:54	2024-12-03 21:35:34
4134	38	81	3	2024-12-03 21:35:34	2024-12-03 21:36:14
4141	38	81	3	2024-12-03 21:36:14	2024-12-03 21:36:54
4148	38	81	3	2024-12-03 21:36:54	2024-12-03 21:37:35
4155	38	81	3	2024-12-03 21:37:35	2024-12-03 21:38:15
4162	38	81	3	2024-12-03 21:38:15	2024-12-03 21:38:56
4169	38	81	3	2024-12-03 21:38:56	2024-12-03 21:39:36
4176	38	81	3	2024-12-03 21:39:36	2024-12-03 21:40:16
4183	38	81	3	2024-12-03 21:40:16	2024-12-03 21:40:57
4190	38	81	3	2024-12-03 21:40:57	2024-12-03 21:41:37
4197	38	81	3	2024-12-03 21:41:37	2024-12-03 21:42:17
4204	38	81	3	2024-12-03 21:42:17	2024-12-03 21:42:58
4211	38	81	3	2024-12-03 21:42:58	2024-12-03 21:43:38
4218	38	81	3	2024-12-03 21:43:38	2024-12-03 21:44:18
4225	38	81	3	2024-12-03 21:44:18	2024-12-03 21:44:58
4232	38	81	3	2024-12-03 21:44:58	2024-12-03 21:45:39
4239	38	81	3	2024-12-03 21:45:39	2024-12-03 21:46:19
4246	38	81	3	2024-12-03 21:46:19	2024-12-03 21:46:59
4253	38	81	3	2024-12-03 21:46:59	2024-12-03 21:47:40
4260	38	81	3	2024-12-03 21:47:40	2024-12-03 21:48:20
4267	38	81	3	2024-12-03 21:48:20	2024-12-03 21:49:00
4274	38	81	3	2024-12-03 21:49:00	2024-12-03 21:49:41
4281	38	81	3	2024-12-03 21:49:41	2024-12-03 21:50:21
4288	38	81	3	2024-12-03 21:50:21	2024-12-03 21:51:01
4295	38	81	3	2024-12-03 21:51:01	2024-12-03 21:51:42
4302	38	81	3	2024-12-03 21:51:42	2024-12-03 21:52:22
4309	38	81	3	2024-12-03 21:52:22	2024-12-03 21:53:02
4316	38	81	3	2024-12-03 21:53:02	2024-12-03 21:53:43
4323	38	81	3	2024-12-03 21:53:43	2024-12-03 21:54:23
4330	38	81	3	2024-12-03 21:54:23	2024-12-03 21:55:03
5153	38	84	3	2024-12-03 23:13:35	2024-12-03 23:14:16
5160	38	84	3	2024-12-03 23:14:16	2024-12-03 23:14:56
5167	38	84	3	2024-12-03 23:14:56	2024-12-03 23:15:36
5174	38	84	3	2024-12-03 23:15:36	2024-12-03 23:16:17
5181	38	84	3	2024-12-03 23:16:17	2024-12-03 23:16:57
5188	38	84	3	2024-12-03 23:16:57	2024-12-03 23:17:37
5195	38	84	3	2024-12-03 23:17:37	2024-12-03 23:18:18
5202	38	84	3	2024-12-03 23:18:18	2024-12-03 23:18:58
5209	38	84	3	2024-12-03 23:18:58	2024-12-03 23:19:38
5216	38	84	3	2024-12-03 23:19:38	2024-12-03 23:20:19
5223	38	84	3	2024-12-03 23:20:19	2024-12-03 23:20:59
5230	38	84	3	2024-12-03 23:20:59	2024-12-03 23:21:39
5237	38	84	3	2024-12-03 23:21:39	2024-12-03 23:22:20
5244	38	84	3	2024-12-03 23:22:20	2024-12-03 23:23:00
5251	38	84	3	2024-12-03 23:23:00	2024-12-03 23:23:40
5258	38	84	3	2024-12-03 23:23:40	2024-12-03 23:24:20
5265	38	84	3	2024-12-03 23:24:20	2024-12-03 23:25:01
5272	38	84	3	2024-12-03 23:25:01	2024-12-03 23:25:41
5279	38	84	3	2024-12-03 23:25:41	2024-12-03 23:26:21
5286	38	84	3	2024-12-03 23:26:21	2024-12-03 23:27:02
5293	38	84	3	2024-12-03 23:27:02	2024-12-03 23:27:42
5300	38	84	3	2024-12-03 23:27:42	2024-12-03 23:28:22
5307	38	84	3	2024-12-03 23:28:22	2024-12-03 23:29:03
5314	38	84	3	2024-12-03 23:29:03	2024-12-03 23:29:43
5321	38	84	3	2024-12-03 23:29:43	2024-12-03 23:30:23
5328	38	84	3	2024-12-03 23:30:23	2024-12-03 23:31:04
5335	38	84	3	2024-12-03 23:31:04	2024-12-03 23:31:44
5342	38	84	3	2024-12-03 23:31:44	2024-12-03 23:32:24
5349	38	84	3	2024-12-03 23:32:24	2024-12-03 23:33:05
5356	38	84	3	2024-12-03 23:33:05	2024-12-03 23:33:45
5363	38	84	3	2024-12-03 23:33:45	2024-12-03 23:34:25
5370	38	84	3	2024-12-03 23:34:25	2024-12-03 23:35:06
5377	38	84	3	2024-12-03 23:35:06	2024-12-03 23:35:46
5384	38	84	3	2024-12-03 23:35:46	2024-12-03 23:36:26
5391	38	84	3	2024-12-03 23:36:26	2024-12-03 23:37:07
5398	38	84	3	2024-12-03 23:37:07	2024-12-03 23:37:48
5405	38	84	3	2024-12-03 23:37:48	2024-12-03 23:38:29
5412	38	84	3	2024-12-03 23:38:29	2024-12-03 23:39:10
5419	38	84	3	2024-12-03 23:39:10	2024-12-03 23:39:50
5426	38	84	3	2024-12-03 23:39:50	2024-12-03 23:40:31
2023	38	84	3	2024-12-03 17:50:48	2024-12-03 17:51:28
2024	38	86	3	2024-12-03 17:50:59	2024-12-03 17:51:40
2028	38	84	3	2024-12-03 17:51:28	2024-12-03 17:52:08
2029	38	86	3	2024-12-03 17:51:40	2024-12-03 17:52:20
4110	38	84	3	2024-12-03 21:33:19	2024-12-03 21:33:59
4117	38	84	3	2024-12-03 21:33:59	2024-12-03 21:34:40
4124	38	84	3	2024-12-03 21:34:40	2024-12-03 21:35:20
4131	38	84	3	2024-12-03 21:35:20	2024-12-03 21:36:00
4138	38	84	3	2024-12-03 21:36:00	2024-12-03 21:36:41
4145	38	84	3	2024-12-03 21:36:41	2024-12-03 21:37:21
4152	38	84	3	2024-12-03 21:37:21	2024-12-03 21:38:01
4159	38	84	3	2024-12-03 21:38:01	2024-12-03 21:38:42
4166	38	84	3	2024-12-03 21:38:42	2024-12-03 21:39:22
4173	38	84	3	2024-12-03 21:39:22	2024-12-03 21:40:03
4180	38	84	3	2024-12-03 21:40:03	2024-12-03 21:40:43
4187	38	84	3	2024-12-03 21:40:43	2024-12-03 21:41:23
4194	38	84	3	2024-12-03 21:41:23	2024-12-03 21:42:04
4201	38	84	3	2024-12-03 21:42:04	2024-12-03 21:42:44
4208	38	84	3	2024-12-03 21:42:44	2024-12-03 21:43:24
4215	38	84	3	2024-12-03 21:43:24	2024-12-03 21:44:05
4222	38	84	3	2024-12-03 21:44:05	2024-12-03 21:44:45
4229	38	84	3	2024-12-03 21:44:45	2024-12-03 21:45:25
4236	38	84	3	2024-12-03 21:45:25	2024-12-03 21:46:06
4243	38	84	3	2024-12-03 21:46:06	2024-12-03 21:46:46
4250	38	84	3	2024-12-03 21:46:46	2024-12-03 21:47:27
4257	38	84	3	2024-12-03 21:47:27	2024-12-03 21:48:07
4264	38	84	3	2024-12-03 21:48:07	2024-12-03 21:48:47
4271	38	84	3	2024-12-03 21:48:47	2024-12-03 21:49:28
4278	38	84	3	2024-12-03 21:49:28	2024-12-03 21:50:08
4285	38	84	3	2024-12-03 21:50:08	2024-12-03 21:50:48
4292	38	84	3	2024-12-03 21:50:48	2024-12-03 21:51:29
4299	38	84	3	2024-12-03 21:51:29	2024-12-03 21:52:09
4306	38	84	3	2024-12-03 21:52:09	2024-12-03 21:52:49
4313	38	84	3	2024-12-03 21:52:49	2024-12-03 21:53:30
4320	38	84	3	2024-12-03 21:53:30	2024-12-03 21:54:10
4327	38	84	3	2024-12-03 21:54:10	2024-12-03 21:54:51
4334	38	84	3	2024-12-03 21:54:51	2024-12-03 21:55:31
5157	38	82	3	2024-12-03 23:13:55	2024-12-03 23:14:35
5164	38	82	3	2024-12-03 23:14:35	2024-12-03 23:15:15
5171	38	82	3	2024-12-03 23:15:15	2024-12-03 23:15:56
5178	38	82	3	2024-12-03 23:15:56	2024-12-03 23:16:36
5185	38	82	3	2024-12-03 23:16:36	2024-12-03 23:17:16
5192	38	82	3	2024-12-03 23:17:16	2024-12-03 23:17:57
5199	38	82	3	2024-12-03 23:17:57	2024-12-03 23:18:37
5206	38	82	3	2024-12-03 23:18:37	2024-12-03 23:19:18
5213	38	82	3	2024-12-03 23:19:18	2024-12-03 23:19:58
5220	38	82	3	2024-12-03 23:19:58	2024-12-03 23:20:38
5227	38	82	3	2024-12-03 23:20:38	2024-12-03 23:21:19
5234	38	82	3	2024-12-03 23:21:19	2024-12-03 23:21:59
5241	38	82	3	2024-12-03 23:21:59	2024-12-03 23:22:39
5248	38	82	3	2024-12-03 23:22:39	2024-12-03 23:23:20
5255	38	82	3	2024-12-03 23:23:20	2024-12-03 23:24:00
5262	38	82	3	2024-12-03 23:24:00	2024-12-03 23:24:40
5269	38	82	3	2024-12-03 23:24:40	2024-12-03 23:25:21
5276	38	82	3	2024-12-03 23:25:21	2024-12-03 23:26:01
5283	38	82	3	2024-12-03 23:26:01	2024-12-03 23:26:42
5290	38	82	3	2024-12-03 23:26:42	2024-12-03 23:27:22
5297	38	82	3	2024-12-03 23:27:22	2024-12-03 23:28:02
5304	38	82	3	2024-12-03 23:28:02	2024-12-03 23:28:43
5311	38	82	3	2024-12-03 23:28:43	2024-12-03 23:29:23
5318	38	82	3	2024-12-03 23:29:23	2024-12-03 23:30:03
5325	38	82	3	2024-12-03 23:30:03	2024-12-03 23:30:44
5332	38	82	3	2024-12-03 23:30:44	2024-12-03 23:31:24
5339	38	82	3	2024-12-03 23:31:24	2024-12-03 23:32:05
5346	38	82	3	2024-12-03 23:32:05	2024-12-03 23:32:45
5353	38	82	3	2024-12-03 23:32:45	2024-12-03 23:33:25
5360	38	82	3	2024-12-03 23:33:25	2024-12-03 23:34:06
5367	38	82	3	2024-12-03 23:34:06	2024-12-03 23:34:46
5374	38	82	3	2024-12-03 23:34:46	2024-12-03 23:35:26
5381	38	82	3	2024-12-03 23:35:26	2024-12-03 23:36:07
5388	38	82	3	2024-12-03 23:36:07	2024-12-03 23:36:48
5395	38	82	3	2024-12-03 23:36:48	2024-12-03 23:37:29
5402	38	82	3	2024-12-03 23:37:29	2024-12-03 23:38:10
5409	38	82	3	2024-12-03 23:38:10	2024-12-03 23:38:51
5416	38	82	3	2024-12-03 23:38:51	2024-12-03 23:39:31
5423	38	82	3	2024-12-03 23:39:31	2024-12-03 23:40:11
5430	38	82	3	2024-12-03 23:40:11	2024-12-03 23:40:52
2025	38	81	3	2024-12-03 17:51:04	2024-12-03 17:51:44
2030	38	81	3	2024-12-03 17:51:44	2024-12-03 17:52:24
4335	38	87	3	2024-12-03 21:55:01	2024-12-03 21:55:42
4342	38	87	3	2024-12-03 21:55:42	2024-12-03 21:56:22
4349	38	87	3	2024-12-03 21:56:22	2024-12-03 21:57:02
4356	38	87	3	2024-12-03 21:57:02	2024-12-03 21:57:42
4363	38	87	3	2024-12-03 21:57:42	2024-12-03 21:58:23
4370	38	87	3	2024-12-03 21:58:23	2024-12-03 21:59:03
4377	38	87	3	2024-12-03 21:59:03	2024-12-03 21:59:43
4384	38	87	3	2024-12-03 21:59:43	2024-12-03 22:00:24
4391	38	87	3	2024-12-03 22:00:24	2024-12-03 22:01:04
4398	38	87	3	2024-12-03 22:01:04	2024-12-03 22:01:44
4405	38	87	3	2024-12-03 22:01:44	2024-12-03 22:02:25
4412	38	87	3	2024-12-03 22:02:25	2024-12-03 22:03:05
4419	38	87	3	2024-12-03 22:03:05	2024-12-03 22:03:45
4426	38	87	3	2024-12-03 22:03:45	2024-12-03 22:04:26
4433	38	87	3	2024-12-03 22:04:26	2024-12-03 22:05:06
4440	38	87	3	2024-12-03 22:05:06	2024-12-03 22:05:46
4447	38	87	3	2024-12-03 22:05:46	2024-12-03 22:06:27
4454	38	87	3	2024-12-03 22:06:27	2024-12-03 22:07:07
4461	38	87	3	2024-12-03 22:07:07	2024-12-03 22:07:47
4468	38	87	3	2024-12-03 22:07:47	2024-12-03 22:08:28
4475	38	87	3	2024-12-03 22:08:28	2024-12-03 22:09:08
4482	38	87	3	2024-12-03 22:09:08	2024-12-03 22:09:48
4489	38	87	3	2024-12-03 22:09:48	2024-12-03 22:10:29
4496	38	87	3	2024-12-03 22:10:29	2024-12-03 22:11:09
4503	38	87	3	2024-12-03 22:11:09	2024-12-03 22:11:49
4510	38	87	3	2024-12-03 22:11:49	2024-12-03 22:12:30
4517	38	87	3	2024-12-03 22:12:30	2024-12-03 22:13:10
4524	38	87	3	2024-12-03 22:13:10	2024-12-03 22:13:50
4531	38	87	3	2024-12-03 22:13:50	2024-12-03 22:14:31
4538	38	87	3	2024-12-03 22:14:31	2024-12-03 22:15:11
4545	38	87	3	2024-12-03 22:15:11	2024-12-03 22:15:51
4552	38	87	3	2024-12-03 22:15:51	2024-12-03 22:16:32
4559	38	87	3	2024-12-03 22:16:32	2024-12-03 22:17:12
4566	38	87	3	2024-12-03 22:17:12	2024-12-03 22:17:52
4573	38	87	3	2024-12-03 22:17:52	2024-12-03 22:18:32
5433	38	84	3	2024-12-03 23:40:31	2024-12-03 23:41:11
5440	38	84	3	2024-12-03 23:41:11	2024-12-03 23:41:52
5447	38	84	3	2024-12-03 23:41:52	2024-12-03 23:42:32
5454	38	84	3	2024-12-03 23:42:32	2024-12-03 23:43:12
5461	38	84	3	2024-12-03 23:43:12	2024-12-03 23:43:53
5468	38	84	3	2024-12-03 23:43:53	2024-12-03 23:44:33
5475	38	84	3	2024-12-03 23:44:33	2024-12-03 23:45:14
5482	38	84	3	2024-12-03 23:45:14	2024-12-03 23:45:55
5489	38	84	3	2024-12-03 23:45:55	2024-12-03 23:46:35
5496	38	84	3	2024-12-03 23:46:35	2024-12-03 23:47:16
5503	38	84	3	2024-12-03 23:47:16	2024-12-03 23:47:56
5510	38	84	3	2024-12-03 23:47:56	2024-12-03 23:48:36
5517	38	84	3	2024-12-03 23:48:36	2024-12-03 23:49:17
5524	38	84	3	2024-12-03 23:49:17	2024-12-03 23:49:57
5531	38	84	3	2024-12-03 23:49:57	2024-12-03 23:50:37
5538	38	84	3	2024-12-03 23:50:37	2024-12-03 23:51:18
5545	38	84	3	2024-12-03 23:51:18	2024-12-03 23:51:58
5552	38	84	3	2024-12-03 23:51:58	2024-12-03 23:52:39
5559	38	84	3	2024-12-03 23:52:39	2024-12-03 23:53:19
5566	38	84	3	2024-12-03 23:53:19	2024-12-03 23:53:59
5573	38	84	3	2024-12-03 23:53:59	2024-12-03 23:54:40
5580	38	84	3	2024-12-03 23:54:40	2024-12-03 23:55:20
5587	38	84	3	2024-12-03 23:55:20	2024-12-03 23:56:00
5594	38	84	3	2024-12-03 23:56:00	2024-12-03 23:56:41
5601	38	84	3	2024-12-03 23:56:41	2024-12-03 23:57:21
5608	38	84	3	2024-12-03 23:57:21	2024-12-03 23:58:01
5615	38	84	3	2024-12-03 23:58:01	2024-12-03 23:58:42
5622	38	84	3	2024-12-03 23:58:42	2024-12-03 23:59:22
5629	38	84	3	2024-12-03 23:59:22	2024-12-04 00:00:03
5636	38	84	3	2024-12-04 00:00:03	2024-12-04 00:00:43
5643	38	84	3	2024-12-04 00:00:43	2024-12-04 00:01:23
5650	38	84	3	2024-12-04 00:01:23	2024-12-04 00:02:04
5657	38	84	3	2024-12-04 00:02:04	2024-12-04 00:02:44
5664	38	84	3	2024-12-04 00:02:44	2024-12-04 00:03:24
5671	38	84	3	2024-12-04 00:03:24	2024-12-04 00:04:05
5678	38	84	3	2024-12-04 00:04:05	2024-12-04 00:04:45
5685	38	84	3	2024-12-04 00:04:45	2024-12-04 00:05:25
5692	38	84	3	2024-12-04 00:05:25	2024-12-04 00:06:06
5699	38	84	3	2024-12-04 00:06:06	2024-12-04 00:06:46
5706	38	84	3	2024-12-04 00:06:46	2024-12-04 00:07:26
5713	38	84	3	2024-12-04 00:07:26	2024-12-04 00:08:07
5720	38	84	3	2024-12-04 00:08:07	2024-12-04 00:08:47
5727	38	84	3	2024-12-04 00:08:47	2024-12-04 00:09:27
2026	38	82	3	2024-12-03 17:51:11	2024-12-03 17:51:51
2031	38	82	3	2024-12-03 17:51:51	2024-12-03 17:52:31
2032	38	83	3	2024-12-03 17:51:54	2024-12-03 17:52:34
2033	38	84	3	2024-12-03 17:52:08	2024-12-03 17:52:49
2034	38	87	3	2024-12-03 17:52:18	2024-12-03 17:52:59
2035	38	86	3	2024-12-03 17:52:20	2024-12-03 17:53:01
2036	38	81	3	2024-12-03 17:52:24	2024-12-03 17:53:05
2037	38	82	3	2024-12-03 17:52:31	2024-12-03 17:53:12
2038	38	83	3	2024-12-03 17:52:34	2024-12-03 17:53:14
2039	38	84	3	2024-12-03 17:52:49	2024-12-03 17:53:29
2040	38	87	3	2024-12-03 17:52:59	2024-12-03 17:53:39
2041	38	86	3	2024-12-03 17:53:01	2024-12-03 17:53:41
2042	38	81	3	2024-12-03 17:53:05	2024-12-03 17:53:45
2043	38	82	3	2024-12-03 17:53:12	2024-12-03 17:53:52
2044	38	83	3	2024-12-03 17:53:14	2024-12-03 17:53:55
2045	38	84	3	2024-12-03 17:53:29	2024-12-03 17:54:09
2046	38	87	3	2024-12-03 17:53:39	2024-12-03 17:54:19
2047	38	86	3	2024-12-03 17:53:41	2024-12-03 17:54:21
2048	38	81	3	2024-12-03 17:53:45	2024-12-03 17:54:25
2049	38	82	3	2024-12-03 17:53:52	2024-12-03 17:54:32
2050	38	83	3	2024-12-03 17:53:55	2024-12-03 17:54:35
2051	38	84	3	2024-12-03 17:54:09	2024-12-03 17:54:50
2052	38	87	3	2024-12-03 17:54:19	2024-12-03 17:55:00
2053	38	86	3	2024-12-03 17:54:21	2024-12-03 17:55:02
2054	38	81	3	2024-12-03 17:54:25	2024-12-03 17:55:06
2055	38	82	3	2024-12-03 17:54:32	2024-12-03 17:55:13
2056	38	83	3	2024-12-03 17:54:35	2024-12-03 17:55:15
2057	38	84	3	2024-12-03 17:54:50	2024-12-03 17:55:30
2058	38	87	3	2024-12-03 17:55:00	2024-12-03 17:55:40
2059	38	86	3	2024-12-03 17:55:02	2024-12-03 17:55:42
2060	38	81	3	2024-12-03 17:55:06	2024-12-03 17:55:46
2061	38	82	3	2024-12-03 17:55:13	2024-12-03 17:55:53
2062	38	83	3	2024-12-03 17:55:15	2024-12-03 17:55:56
2063	38	84	3	2024-12-03 17:55:30	2024-12-03 17:56:11
2064	38	87	3	2024-12-03 17:55:40	2024-12-03 17:56:21
2065	38	86	3	2024-12-03 17:55:42	2024-12-03 17:56:22
2066	38	81	3	2024-12-03 17:55:46	2024-12-03 17:56:26
2067	38	82	3	2024-12-03 17:55:53	2024-12-03 17:56:33
2068	38	83	3	2024-12-03 17:55:56	2024-12-03 17:56:36
2069	38	84	3	2024-12-03 17:56:11	2024-12-03 17:56:51
2070	38	87	3	2024-12-03 17:56:21	2024-12-03 17:57:01
2071	38	86	3	2024-12-03 17:56:22	2024-12-03 17:57:03
2072	38	81	3	2024-12-03 17:56:26	2024-12-03 17:57:07
2073	38	82	3	2024-12-03 17:56:33	2024-12-03 17:57:14
2074	38	83	3	2024-12-03 17:56:36	2024-12-03 17:57:16
2075	38	84	3	2024-12-03 17:56:51	2024-12-03 17:57:31
2076	38	87	3	2024-12-03 17:57:01	2024-12-03 17:57:41
2077	38	86	3	2024-12-03 17:57:03	2024-12-03 17:57:43
2078	38	81	3	2024-12-03 17:57:07	2024-12-03 17:57:47
2079	38	82	3	2024-12-03 17:57:14	2024-12-03 17:57:54
2080	38	83	3	2024-12-03 17:57:16	2024-12-03 17:57:57
2081	38	84	3	2024-12-03 17:57:31	2024-12-03 17:58:12
2082	38	87	3	2024-12-03 17:57:41	2024-12-03 17:58:22
2083	38	86	3	2024-12-03 17:57:43	2024-12-03 17:58:23
2084	38	81	3	2024-12-03 17:57:47	2024-12-03 17:58:27
2085	38	82	3	2024-12-03 17:57:54	2024-12-03 17:58:34
2086	38	83	3	2024-12-03 17:57:57	2024-12-03 17:58:37
2087	38	84	3	2024-12-03 17:58:12	2024-12-03 17:58:52
2088	38	87	3	2024-12-03 17:58:22	2024-12-03 17:59:02
2089	38	86	3	2024-12-03 17:58:23	2024-12-03 17:59:04
2090	38	81	3	2024-12-03 17:58:27	2024-12-03 17:59:08
2091	38	82	3	2024-12-03 17:58:34	2024-12-03 17:59:15
2092	38	83	3	2024-12-03 17:58:37	2024-12-03 17:59:18
2093	38	84	3	2024-12-03 17:58:52	2024-12-03 17:59:33
2094	38	87	3	2024-12-03 17:59:02	2024-12-03 17:59:43
2095	38	86	3	2024-12-03 17:59:04	2024-12-03 17:59:45
2096	38	81	3	2024-12-03 17:59:08	2024-12-03 17:59:49
2097	38	82	3	2024-12-03 17:59:15	2024-12-03 17:59:56
2098	38	83	3	2024-12-03 17:59:18	2024-12-03 17:59:59
2099	38	84	3	2024-12-03 17:59:33	2024-12-03 18:00:14
2100	38	87	3	2024-12-03 17:59:43	2024-12-03 18:00:24
2101	38	86	3	2024-12-03 17:59:45	2024-12-03 18:00:26
2102	38	81	3	2024-12-03 17:59:49	2024-12-03 18:00:30
2103	38	82	3	2024-12-03 17:59:56	2024-12-03 18:00:37
2104	38	83	3	2024-12-03 17:59:59	2024-12-03 18:00:39
2105	38	84	3	2024-12-03 18:00:14	2024-12-03 18:00:55
2106	38	87	3	2024-12-03 18:00:24	2024-12-03 18:01:05
2107	38	86	3	2024-12-03 18:00:26	2024-12-03 18:01:07
2108	38	81	3	2024-12-03 18:00:30	2024-12-03 18:01:11
2109	38	82	3	2024-12-03 18:00:37	2024-12-03 18:01:18
2110	38	83	3	2024-12-03 18:00:39	2024-12-03 18:01:20
2111	38	84	3	2024-12-03 18:00:55	2024-12-03 18:01:36
2112	38	87	3	2024-12-03 18:01:05	2024-12-03 18:01:46
2113	38	86	3	2024-12-03 18:01:07	2024-12-03 18:01:48
2114	38	81	3	2024-12-03 18:01:11	2024-12-03 18:01:52
2115	38	82	3	2024-12-03 18:01:18	2024-12-03 18:01:59
2116	38	83	3	2024-12-03 18:01:20	2024-12-03 18:02:01
2117	38	84	3	2024-12-03 18:01:36	2024-12-03 18:02:17
2118	38	87	3	2024-12-03 18:01:46	2024-12-03 18:02:27
2119	38	86	3	2024-12-03 18:01:48	2024-12-03 18:02:29
2120	38	81	3	2024-12-03 18:01:52	2024-12-03 18:02:33
2121	38	82	3	2024-12-03 18:01:59	2024-12-03 18:02:40
2122	38	83	3	2024-12-03 18:02:01	2024-12-03 18:02:42
2123	38	84	3	2024-12-03 18:02:17	2024-12-03 18:02:57
2124	38	87	3	2024-12-03 18:02:27	2024-12-03 18:03:07
2125	38	86	3	2024-12-03 18:02:29	2024-12-03 18:03:09
2126	38	81	3	2024-12-03 18:02:33	2024-12-03 18:03:13
2127	38	82	3	2024-12-03 18:02:40	2024-12-03 18:03:20
2128	38	83	3	2024-12-03 18:02:42	2024-12-03 18:03:22
2129	38	84	3	2024-12-03 18:02:57	2024-12-03 18:03:38
2130	38	87	3	2024-12-03 18:03:07	2024-12-03 18:03:47
2131	38	86	3	2024-12-03 18:03:09	2024-12-03 18:03:49
2132	38	81	3	2024-12-03 18:03:13	2024-12-03 18:03:53
2133	38	82	3	2024-12-03 18:03:20	2024-12-03 18:04:00
2134	38	83	3	2024-12-03 18:03:22	2024-12-03 18:04:03
2135	38	84	3	2024-12-03 18:03:38	2024-12-03 18:04:18
2136	38	87	3	2024-12-03 18:03:47	2024-12-03 18:04:28
2137	38	86	3	2024-12-03 18:03:49	2024-12-03 18:04:30
2138	38	81	3	2024-12-03 18:03:53	2024-12-03 18:04:34
2139	38	82	3	2024-12-03 18:04:00	2024-12-03 18:04:41
2140	38	83	3	2024-12-03 18:04:03	2024-12-03 18:04:43
2141	38	84	3	2024-12-03 18:04:18	2024-12-03 18:04:59
2142	38	87	3	2024-12-03 18:04:28	2024-12-03 18:05:08
2148	38	87	3	2024-12-03 18:05:08	2024-12-03 18:05:49
2154	38	87	3	2024-12-03 18:05:49	2024-12-03 18:06:29
2160	38	87	3	2024-12-03 18:06:29	2024-12-03 18:07:09
4337	38	81	3	2024-12-03 21:55:03	2024-12-03 21:55:43
4344	38	81	3	2024-12-03 21:55:43	2024-12-03 21:56:24
4351	38	81	3	2024-12-03 21:56:24	2024-12-03 21:57:04
4358	38	81	3	2024-12-03 21:57:04	2024-12-03 21:57:44
4365	38	81	3	2024-12-03 21:57:44	2024-12-03 21:58:25
4372	38	81	3	2024-12-03 21:58:25	2024-12-03 21:59:05
4379	38	81	3	2024-12-03 21:59:05	2024-12-03 21:59:45
4386	38	81	3	2024-12-03 21:59:45	2024-12-03 22:00:26
4393	38	81	3	2024-12-03 22:00:26	2024-12-03 22:01:06
4400	38	81	3	2024-12-03 22:01:06	2024-12-03 22:01:46
4407	38	81	3	2024-12-03 22:01:46	2024-12-03 22:02:27
4414	38	81	3	2024-12-03 22:02:27	2024-12-03 22:03:07
4421	38	81	3	2024-12-03 22:03:07	2024-12-03 22:03:47
4428	38	81	3	2024-12-03 22:03:47	2024-12-03 22:04:28
4435	38	81	3	2024-12-03 22:04:28	2024-12-03 22:05:08
4442	38	81	3	2024-12-03 22:05:08	2024-12-03 22:05:48
4449	38	81	3	2024-12-03 22:05:48	2024-12-03 22:06:29
4456	38	81	3	2024-12-03 22:06:29	2024-12-03 22:07:09
4463	38	81	3	2024-12-03 22:07:09	2024-12-03 22:07:49
4470	38	81	3	2024-12-03 22:07:49	2024-12-03 22:08:30
4477	38	81	3	2024-12-03 22:08:30	2024-12-03 22:09:10
4484	38	81	3	2024-12-03 22:09:10	2024-12-03 22:09:50
4491	38	81	3	2024-12-03 22:09:50	2024-12-03 22:10:31
4498	38	81	3	2024-12-03 22:10:31	2024-12-03 22:11:11
4505	38	81	3	2024-12-03 22:11:11	2024-12-03 22:11:51
4512	38	81	3	2024-12-03 22:11:51	2024-12-03 22:12:32
4519	38	81	3	2024-12-03 22:12:32	2024-12-03 22:13:12
4526	38	81	3	2024-12-03 22:13:12	2024-12-03 22:13:52
4533	38	81	3	2024-12-03 22:13:52	2024-12-03 22:14:33
4540	38	81	3	2024-12-03 22:14:33	2024-12-03 22:15:13
4547	38	81	3	2024-12-03 22:15:13	2024-12-03 22:15:53
4554	38	81	3	2024-12-03 22:15:53	2024-12-03 22:16:33
4561	38	81	3	2024-12-03 22:16:33	2024-12-03 22:17:14
4568	38	81	3	2024-12-03 22:17:14	2024-12-03 22:17:54
4575	38	81	3	2024-12-03 22:17:54	2024-12-03 22:18:34
5435	38	86	3	2024-12-03 23:40:40	2024-12-03 23:41:21
5442	38	86	3	2024-12-03 23:41:21	2024-12-03 23:42:01
5449	38	86	3	2024-12-03 23:42:01	2024-12-03 23:42:41
5456	38	86	3	2024-12-03 23:42:41	2024-12-03 23:43:21
5463	38	86	3	2024-12-03 23:43:21	2024-12-03 23:44:02
5470	38	86	3	2024-12-03 23:44:02	2024-12-03 23:44:42
5477	38	86	3	2024-12-03 23:44:42	2024-12-03 23:45:23
5484	38	86	3	2024-12-03 23:45:23	2024-12-03 23:46:04
5491	38	86	3	2024-12-03 23:46:04	2024-12-03 23:46:44
5498	38	86	3	2024-12-03 23:46:44	2024-12-03 23:47:25
5505	38	86	3	2024-12-03 23:47:25	2024-12-03 23:48:05
5512	38	86	3	2024-12-03 23:48:05	2024-12-03 23:48:45
5519	38	86	3	2024-12-03 23:48:45	2024-12-03 23:49:26
5526	38	86	3	2024-12-03 23:49:26	2024-12-03 23:50:06
5533	38	86	3	2024-12-03 23:50:06	2024-12-03 23:50:46
5540	38	86	3	2024-12-03 23:50:46	2024-12-03 23:51:27
5547	38	86	3	2024-12-03 23:51:27	2024-12-03 23:52:07
5554	38	86	3	2024-12-03 23:52:07	2024-12-03 23:52:47
5561	38	86	3	2024-12-03 23:52:47	2024-12-03 23:53:28
5568	38	86	3	2024-12-03 23:53:28	2024-12-03 23:54:08
5575	38	86	3	2024-12-03 23:54:08	2024-12-03 23:54:48
5582	38	86	3	2024-12-03 23:54:48	2024-12-03 23:55:29
5589	38	86	3	2024-12-03 23:55:29	2024-12-03 23:56:09
5596	38	86	3	2024-12-03 23:56:09	2024-12-03 23:56:49
5603	38	86	3	2024-12-03 23:56:49	2024-12-03 23:57:29
5610	38	86	3	2024-12-03 23:57:29	2024-12-03 23:58:10
5617	38	86	3	2024-12-03 23:58:10	2024-12-03 23:58:50
5624	38	86	3	2024-12-03 23:58:50	2024-12-03 23:59:30
5631	38	86	3	2024-12-03 23:59:30	2024-12-04 00:00:11
5638	38	86	3	2024-12-04 00:00:11	2024-12-04 00:00:51
5645	38	86	3	2024-12-04 00:00:51	2024-12-04 00:01:32
5652	38	86	3	2024-12-04 00:01:32	2024-12-04 00:02:12
5659	38	86	3	2024-12-04 00:02:12	2024-12-04 00:02:52
5666	38	86	3	2024-12-04 00:02:52	2024-12-04 00:03:33
5673	38	86	3	2024-12-04 00:03:33	2024-12-04 00:04:13
5680	38	86	3	2024-12-04 00:04:13	2024-12-04 00:04:53
5687	38	86	3	2024-12-04 00:04:53	2024-12-04 00:05:34
5694	38	86	3	2024-12-04 00:05:34	2024-12-04 00:06:14
5701	38	86	3	2024-12-04 00:06:14	2024-12-04 00:06:55
5708	38	86	3	2024-12-04 00:06:55	2024-12-04 00:07:35
5715	38	86	3	2024-12-04 00:07:35	2024-12-04 00:08:15
5722	38	86	3	2024-12-04 00:08:15	2024-12-04 00:08:56
5729	38	86	3	2024-12-04 00:08:56	2024-12-04 00:09:36
2143	38	86	3	2024-12-03 18:04:30	2024-12-03 18:05:10
2149	38	86	3	2024-12-03 18:05:10	2024-12-03 18:05:50
2155	38	86	3	2024-12-03 18:05:50	2024-12-03 18:06:31
2161	38	86	3	2024-12-03 18:06:31	2024-12-03 18:07:11
4338	38	82	3	2024-12-03 21:55:07	2024-12-03 21:55:47
4345	38	82	3	2024-12-03 21:55:47	2024-12-03 21:56:28
4352	38	82	3	2024-12-03 21:56:28	2024-12-03 21:57:08
4359	38	82	3	2024-12-03 21:57:08	2024-12-03 21:57:49
4366	38	82	3	2024-12-03 21:57:49	2024-12-03 21:58:29
4373	38	82	3	2024-12-03 21:58:29	2024-12-03 21:59:09
4380	38	82	3	2024-12-03 21:59:09	2024-12-03 21:59:50
4387	38	82	3	2024-12-03 21:59:50	2024-12-03 22:00:30
4394	38	82	3	2024-12-03 22:00:30	2024-12-03 22:01:10
4401	38	82	3	2024-12-03 22:01:10	2024-12-03 22:01:51
4408	38	82	3	2024-12-03 22:01:51	2024-12-03 22:02:31
4415	38	82	3	2024-12-03 22:02:31	2024-12-03 22:03:12
4422	38	82	3	2024-12-03 22:03:12	2024-12-03 22:03:52
4429	38	82	3	2024-12-03 22:03:52	2024-12-03 22:04:32
4436	38	82	3	2024-12-03 22:04:32	2024-12-03 22:05:13
4443	38	82	3	2024-12-03 22:05:13	2024-12-03 22:05:53
4450	38	82	3	2024-12-03 22:05:53	2024-12-03 22:06:33
4457	38	82	3	2024-12-03 22:06:33	2024-12-03 22:07:14
4464	38	82	3	2024-12-03 22:07:14	2024-12-03 22:07:54
4471	38	82	3	2024-12-03 22:07:54	2024-12-03 22:08:34
4478	38	82	3	2024-12-03 22:08:34	2024-12-03 22:09:15
4485	38	82	3	2024-12-03 22:09:15	2024-12-03 22:09:55
4492	38	82	3	2024-12-03 22:09:55	2024-12-03 22:10:36
4499	38	82	3	2024-12-03 22:10:36	2024-12-03 22:11:16
4506	38	82	3	2024-12-03 22:11:16	2024-12-03 22:11:56
4513	38	82	3	2024-12-03 22:11:56	2024-12-03 22:12:37
4520	38	82	3	2024-12-03 22:12:37	2024-12-03 22:13:17
4527	38	82	3	2024-12-03 22:13:17	2024-12-03 22:13:57
4534	38	82	3	2024-12-03 22:13:57	2024-12-03 22:14:38
4541	38	82	3	2024-12-03 22:14:38	2024-12-03 22:15:18
4548	38	82	3	2024-12-03 22:15:18	2024-12-03 22:15:58
4555	38	82	3	2024-12-03 22:15:58	2024-12-03 22:16:39
4562	38	82	3	2024-12-03 22:16:39	2024-12-03 22:17:19
4569	38	82	3	2024-12-03 22:17:19	2024-12-03 22:18:00
5436	38	81	3	2024-12-03 23:40:41	2024-12-03 23:41:21
5443	38	81	3	2024-12-03 23:41:22	2024-12-03 23:42:02
5450	38	81	3	2024-12-03 23:42:02	2024-12-03 23:42:42
5457	38	81	3	2024-12-03 23:42:42	2024-12-03 23:43:22
5464	38	81	3	2024-12-03 23:43:22	2024-12-03 23:44:03
5471	38	81	3	2024-12-03 23:44:03	2024-12-03 23:44:43
5478	38	81	3	2024-12-03 23:44:43	2024-12-03 23:45:24
5485	38	81	3	2024-12-03 23:45:24	2024-12-03 23:46:05
5492	38	81	3	2024-12-03 23:46:05	2024-12-03 23:46:45
5499	38	81	3	2024-12-03 23:46:45	2024-12-03 23:47:26
5506	38	81	3	2024-12-03 23:47:26	2024-12-03 23:48:06
5513	38	81	3	2024-12-03 23:48:06	2024-12-03 23:48:46
5520	38	81	3	2024-12-03 23:48:46	2024-12-03 23:49:27
5527	38	81	3	2024-12-03 23:49:27	2024-12-03 23:50:07
5534	38	81	3	2024-12-03 23:50:07	2024-12-03 23:50:47
5541	38	81	3	2024-12-03 23:50:47	2024-12-03 23:51:28
5548	38	81	3	2024-12-03 23:51:28	2024-12-03 23:52:08
5555	38	81	3	2024-12-03 23:52:08	2024-12-03 23:52:48
5562	38	81	3	2024-12-03 23:52:48	2024-12-03 23:53:29
5569	38	81	3	2024-12-03 23:53:29	2024-12-03 23:54:09
5576	38	81	3	2024-12-03 23:54:09	2024-12-03 23:54:50
5583	38	81	3	2024-12-03 23:54:50	2024-12-03 23:55:30
5590	38	81	3	2024-12-03 23:55:30	2024-12-03 23:56:10
5597	38	81	3	2024-12-03 23:56:10	2024-12-03 23:56:51
5604	38	81	3	2024-12-03 23:56:51	2024-12-03 23:57:31
5611	38	81	3	2024-12-03 23:57:31	2024-12-03 23:58:11
5618	38	81	3	2024-12-03 23:58:11	2024-12-03 23:58:52
5625	38	81	3	2024-12-03 23:58:52	2024-12-03 23:59:32
5632	38	81	3	2024-12-03 23:59:32	2024-12-04 00:00:12
5639	38	81	3	2024-12-04 00:00:12	2024-12-04 00:00:53
5646	38	81	3	2024-12-04 00:00:53	2024-12-04 00:01:33
5653	38	81	3	2024-12-04 00:01:33	2024-12-04 00:02:13
5660	38	81	3	2024-12-04 00:02:13	2024-12-04 00:02:54
5667	38	81	3	2024-12-04 00:02:54	2024-12-04 00:03:34
5674	38	81	3	2024-12-04 00:03:34	2024-12-04 00:04:14
5681	38	81	3	2024-12-04 00:04:14	2024-12-04 00:04:55
5688	38	81	3	2024-12-04 00:04:55	2024-12-04 00:05:35
5695	38	81	3	2024-12-04 00:05:35	2024-12-04 00:06:15
5702	38	81	3	2024-12-04 00:06:15	2024-12-04 00:06:56
5709	38	81	3	2024-12-04 00:06:56	2024-12-04 00:07:36
5716	38	81	3	2024-12-04 00:07:36	2024-12-04 00:08:17
5723	38	81	3	2024-12-04 00:08:17	2024-12-04 00:08:57
5730	38	81	3	2024-12-04 00:08:57	2024-12-04 00:09:37
2144	38	81	3	2024-12-03 18:04:34	2024-12-03 18:05:14
2150	38	81	3	2024-12-03 18:05:14	2024-12-03 18:05:54
2156	38	81	3	2024-12-03 18:05:54	2024-12-03 18:06:34
2162	38	81	3	2024-12-03 18:06:35	2024-12-03 18:07:15
4339	38	88	3	2024-12-03 21:55:14	2024-12-03 21:55:54
4346	38	88	3	2024-12-03 21:55:54	2024-12-03 21:56:35
4353	38	88	3	2024-12-03 21:56:35	2024-12-03 21:57:15
4360	38	88	3	2024-12-03 21:57:15	2024-12-03 21:57:56
4367	38	88	3	2024-12-03 21:57:56	2024-12-03 21:58:36
4374	38	88	3	2024-12-03 21:58:36	2024-12-03 21:59:16
4381	38	88	3	2024-12-03 21:59:16	2024-12-03 21:59:57
4388	38	88	3	2024-12-03 21:59:57	2024-12-03 22:00:37
4395	38	88	3	2024-12-03 22:00:37	2024-12-03 22:01:17
4402	38	88	3	2024-12-03 22:01:17	2024-12-03 22:01:58
4409	38	88	3	2024-12-03 22:01:58	2024-12-03 22:02:38
4416	38	88	3	2024-12-03 22:02:38	2024-12-03 22:03:19
4423	38	88	3	2024-12-03 22:03:19	2024-12-03 22:03:59
4430	38	88	3	2024-12-03 22:03:59	2024-12-03 22:04:39
4437	38	88	3	2024-12-03 22:04:39	2024-12-03 22:05:20
4444	38	88	3	2024-12-03 22:05:20	2024-12-03 22:06:00
4451	38	88	3	2024-12-03 22:06:00	2024-12-03 22:06:40
4458	38	88	3	2024-12-03 22:06:40	2024-12-03 22:07:21
4465	38	88	3	2024-12-03 22:07:21	2024-12-03 22:08:01
4472	38	88	3	2024-12-03 22:08:01	2024-12-03 22:08:41
4479	38	88	3	2024-12-03 22:08:41	2024-12-03 22:09:22
4486	38	88	3	2024-12-03 22:09:22	2024-12-03 22:10:02
4493	38	88	3	2024-12-03 22:10:02	2024-12-03 22:10:42
4500	38	88	3	2024-12-03 22:10:42	2024-12-03 22:11:23
4507	38	88	3	2024-12-03 22:11:23	2024-12-03 22:12:03
4514	38	88	3	2024-12-03 22:12:03	2024-12-03 22:12:44
4521	38	88	3	2024-12-03 22:12:44	2024-12-03 22:13:24
4528	38	88	3	2024-12-03 22:13:24	2024-12-03 22:14:04
4535	38	88	3	2024-12-03 22:14:04	2024-12-03 22:14:45
4542	38	88	3	2024-12-03 22:14:45	2024-12-03 22:15:25
4549	38	88	3	2024-12-03 22:15:25	2024-12-03 22:16:06
4556	38	88	3	2024-12-03 22:16:06	2024-12-03 22:16:46
4563	38	88	3	2024-12-03 22:16:46	2024-12-03 22:17:26
4570	38	88	3	2024-12-03 22:17:26	2024-12-03 22:18:07
5437	38	82	3	2024-12-03 23:40:52	2024-12-03 23:41:32
5444	38	82	3	2024-12-03 23:41:32	2024-12-03 23:42:12
5451	38	82	3	2024-12-03 23:42:12	2024-12-03 23:42:53
5458	38	82	3	2024-12-03 23:42:53	2024-12-03 23:43:33
5465	38	82	3	2024-12-03 23:43:33	2024-12-03 23:44:14
5472	38	82	3	2024-12-03 23:44:14	2024-12-03 23:44:54
5479	38	82	3	2024-12-03 23:44:54	2024-12-03 23:45:35
5486	38	82	3	2024-12-03 23:45:35	2024-12-03 23:46:16
5493	38	82	3	2024-12-03 23:46:16	2024-12-03 23:46:56
5500	38	82	3	2024-12-03 23:46:56	2024-12-03 23:47:37
5507	38	82	3	2024-12-03 23:47:37	2024-12-03 23:48:17
5514	38	82	3	2024-12-03 23:48:17	2024-12-03 23:48:57
5521	38	82	3	2024-12-03 23:48:57	2024-12-03 23:49:38
5528	38	82	3	2024-12-03 23:49:38	2024-12-03 23:50:18
5535	38	82	3	2024-12-03 23:50:18	2024-12-03 23:50:58
5542	38	82	3	2024-12-03 23:50:58	2024-12-03 23:51:39
5549	38	82	3	2024-12-03 23:51:39	2024-12-03 23:52:19
5556	38	82	3	2024-12-03 23:52:19	2024-12-03 23:52:59
5563	38	82	3	2024-12-03 23:52:59	2024-12-03 23:53:40
5570	38	82	3	2024-12-03 23:53:40	2024-12-03 23:54:20
5577	38	82	3	2024-12-03 23:54:20	2024-12-03 23:55:01
5584	38	82	3	2024-12-03 23:55:01	2024-12-03 23:55:41
5591	38	82	3	2024-12-03 23:55:41	2024-12-03 23:56:21
5598	38	82	3	2024-12-03 23:56:21	2024-12-03 23:57:02
5605	38	82	3	2024-12-03 23:57:02	2024-12-03 23:57:42
5612	38	82	3	2024-12-03 23:57:42	2024-12-03 23:58:22
5619	38	82	3	2024-12-03 23:58:22	2024-12-03 23:59:03
5626	38	82	3	2024-12-03 23:59:03	2024-12-03 23:59:43
5633	38	82	3	2024-12-03 23:59:43	2024-12-04 00:00:23
5640	38	82	3	2024-12-04 00:00:23	2024-12-04 00:01:04
5647	38	82	3	2024-12-04 00:01:04	2024-12-04 00:01:44
5654	38	82	3	2024-12-04 00:01:44	2024-12-04 00:02:24
5661	38	82	3	2024-12-04 00:02:24	2024-12-04 00:03:05
5668	38	82	3	2024-12-04 00:03:05	2024-12-04 00:03:45
5675	38	82	3	2024-12-04 00:03:45	2024-12-04 00:04:25
5682	38	82	3	2024-12-04 00:04:25	2024-12-04 00:05:05
5689	38	82	3	2024-12-04 00:05:05	2024-12-04 00:05:46
5696	38	82	3	2024-12-04 00:05:46	2024-12-04 00:06:26
5703	38	82	3	2024-12-04 00:06:26	2024-12-04 00:07:06
5710	38	82	3	2024-12-04 00:07:06	2024-12-04 00:07:47
5717	38	82	3	2024-12-04 00:07:47	2024-12-04 00:08:27
5724	38	82	3	2024-12-04 00:08:27	2024-12-04 00:09:07
5731	38	82	3	2024-12-04 00:09:07	2024-12-04 00:09:48
2145	38	82	3	2024-12-03 18:04:41	2024-12-03 18:05:21
2151	38	82	3	2024-12-03 18:05:21	2024-12-03 18:06:01
2157	38	82	3	2024-12-03 18:06:01	2024-12-03 18:06:42
2163	38	82	3	2024-12-03 18:06:42	2024-12-03 18:07:22
4340	38	83	3	2024-12-03 21:55:18	2024-12-03 21:55:59
4347	38	83	3	2024-12-03 21:55:59	2024-12-03 21:56:39
4354	38	83	3	2024-12-03 21:56:39	2024-12-03 21:57:19
4361	38	83	3	2024-12-03 21:57:19	2024-12-03 21:58:00
4368	38	83	3	2024-12-03 21:58:00	2024-12-03 21:58:40
4375	38	83	3	2024-12-03 21:58:40	2024-12-03 21:59:20
4382	38	83	3	2024-12-03 21:59:20	2024-12-03 22:00:01
4389	38	83	3	2024-12-03 22:00:01	2024-12-03 22:00:41
4396	38	83	3	2024-12-03 22:00:41	2024-12-03 22:01:22
4403	38	83	3	2024-12-03 22:01:22	2024-12-03 22:02:02
4410	38	83	3	2024-12-03 22:02:02	2024-12-03 22:02:42
4417	38	83	3	2024-12-03 22:02:42	2024-12-03 22:03:23
4424	38	83	3	2024-12-03 22:03:23	2024-12-03 22:04:03
4431	38	83	3	2024-12-03 22:04:03	2024-12-03 22:04:43
4438	38	83	3	2024-12-03 22:04:43	2024-12-03 22:05:24
4445	38	83	3	2024-12-03 22:05:24	2024-12-03 22:06:04
4452	38	83	3	2024-12-03 22:06:04	2024-12-03 22:06:44
4459	38	83	3	2024-12-03 22:06:44	2024-12-03 22:07:25
4466	38	83	3	2024-12-03 22:07:25	2024-12-03 22:08:05
4473	38	83	3	2024-12-03 22:08:05	2024-12-03 22:08:46
4480	38	83	3	2024-12-03 22:08:46	2024-12-03 22:09:26
4487	38	83	3	2024-12-03 22:09:26	2024-12-03 22:10:06
4494	38	83	3	2024-12-03 22:10:06	2024-12-03 22:10:47
4501	38	83	3	2024-12-03 22:10:47	2024-12-03 22:11:27
4508	38	83	3	2024-12-03 22:11:27	2024-12-03 22:12:07
4515	38	83	3	2024-12-03 22:12:07	2024-12-03 22:12:48
4522	38	83	3	2024-12-03 22:12:48	2024-12-03 22:13:28
4529	38	83	3	2024-12-03 22:13:28	2024-12-03 22:14:08
4536	38	83	3	2024-12-03 22:14:08	2024-12-03 22:14:49
4543	38	83	3	2024-12-03 22:14:49	2024-12-03 22:15:29
4550	38	83	3	2024-12-03 22:15:29	2024-12-03 22:16:09
4557	38	83	3	2024-12-03 22:16:09	2024-12-03 22:16:50
4564	38	83	3	2024-12-03 22:16:50	2024-12-03 22:17:30
4571	38	83	3	2024-12-03 22:17:30	2024-12-03 22:18:11
5438	38	88	3	2024-12-03 23:40:57	2024-12-03 23:41:37
5445	38	88	3	2024-12-03 23:41:37	2024-12-03 23:42:17
5452	38	88	3	2024-12-03 23:42:17	2024-12-03 23:42:58
5459	38	88	3	2024-12-03 23:42:58	2024-12-03 23:43:38
5466	38	88	3	2024-12-03 23:43:38	2024-12-03 23:44:18
5473	38	88	3	2024-12-03 23:44:18	2024-12-03 23:44:59
5480	38	88	3	2024-12-03 23:44:59	2024-12-03 23:45:40
5487	38	88	3	2024-12-03 23:45:40	2024-12-03 23:46:20
5494	38	88	3	2024-12-03 23:46:20	2024-12-03 23:47:00
5501	38	88	3	2024-12-03 23:47:00	2024-12-03 23:47:41
5508	38	88	3	2024-12-03 23:47:41	2024-12-03 23:48:21
5515	38	88	3	2024-12-03 23:48:21	2024-12-03 23:49:01
5522	38	88	3	2024-12-03 23:49:01	2024-12-03 23:49:42
5529	38	88	3	2024-12-03 23:49:42	2024-12-03 23:50:22
5536	38	88	3	2024-12-03 23:50:22	2024-12-03 23:51:02
5543	38	88	3	2024-12-03 23:51:02	2024-12-03 23:51:43
5550	38	88	3	2024-12-03 23:51:43	2024-12-03 23:52:23
5557	38	88	3	2024-12-03 23:52:23	2024-12-03 23:53:03
5564	38	88	3	2024-12-03 23:53:03	2024-12-03 23:53:44
5571	38	88	3	2024-12-03 23:53:44	2024-12-03 23:54:24
5578	38	88	3	2024-12-03 23:54:24	2024-12-03 23:55:04
5585	38	88	3	2024-12-03 23:55:04	2024-12-03 23:55:45
5592	38	88	3	2024-12-03 23:55:45	2024-12-03 23:56:25
5599	38	88	3	2024-12-03 23:56:25	2024-12-03 23:57:05
5606	38	88	3	2024-12-03 23:57:05	2024-12-03 23:57:46
5613	38	88	3	2024-12-03 23:57:46	2024-12-03 23:58:26
5620	38	88	3	2024-12-03 23:58:26	2024-12-03 23:59:06
5627	38	88	3	2024-12-03 23:59:06	2024-12-03 23:59:46
5634	38	88	3	2024-12-03 23:59:46	2024-12-04 00:00:27
5641	38	88	3	2024-12-04 00:00:27	2024-12-04 00:01:07
5648	38	88	3	2024-12-04 00:01:07	2024-12-04 00:01:47
5655	38	88	3	2024-12-04 00:01:47	2024-12-04 00:02:28
5662	38	88	3	2024-12-04 00:02:28	2024-12-04 00:03:08
5669	38	88	3	2024-12-04 00:03:08	2024-12-04 00:03:48
5676	38	88	3	2024-12-04 00:03:48	2024-12-04 00:04:29
5683	38	88	3	2024-12-04 00:04:29	2024-12-04 00:05:09
5690	38	88	3	2024-12-04 00:05:09	2024-12-04 00:05:49
5697	38	88	3	2024-12-04 00:05:49	2024-12-04 00:06:30
5704	38	88	3	2024-12-04 00:06:30	2024-12-04 00:07:10
5711	38	88	3	2024-12-04 00:07:10	2024-12-04 00:07:50
5718	38	88	3	2024-12-04 00:07:50	2024-12-04 00:08:31
5725	38	88	3	2024-12-04 00:08:31	2024-12-04 00:09:11
5732	38	88	3	2024-12-04 00:09:11	2024-12-04 00:09:51
2146	38	83	3	2024-12-03 18:04:43	2024-12-03 18:05:23
2152	38	83	3	2024-12-03 18:05:23	2024-12-03 18:06:04
2158	38	83	3	2024-12-03 18:06:04	2024-12-03 18:06:44
2164	38	83	3	2024-12-03 18:06:44	2024-12-03 18:07:24
4341	38	84	3	2024-12-03 21:55:31	2024-12-03 21:56:11
4348	38	84	3	2024-12-03 21:56:11	2024-12-03 21:56:52
4355	38	84	3	2024-12-03 21:56:52	2024-12-03 21:57:32
4362	38	84	3	2024-12-03 21:57:32	2024-12-03 21:58:12
4369	38	84	3	2024-12-03 21:58:12	2024-12-03 21:58:53
4376	38	84	3	2024-12-03 21:58:53	2024-12-03 21:59:33
4383	38	84	3	2024-12-03 21:59:33	2024-12-03 22:00:13
4390	38	84	3	2024-12-03 22:00:13	2024-12-03 22:00:54
4397	38	84	3	2024-12-03 22:00:54	2024-12-03 22:01:34
4404	38	84	3	2024-12-03 22:01:34	2024-12-03 22:02:15
4411	38	84	3	2024-12-03 22:02:15	2024-12-03 22:02:55
4418	38	84	3	2024-12-03 22:02:55	2024-12-03 22:03:35
4425	38	84	3	2024-12-03 22:03:35	2024-12-03 22:04:16
4432	38	84	3	2024-12-03 22:04:16	2024-12-03 22:04:56
4439	38	84	3	2024-12-03 22:04:56	2024-12-03 22:05:37
4446	38	84	3	2024-12-03 22:05:37	2024-12-03 22:06:17
4453	38	84	3	2024-12-03 22:06:17	2024-12-03 22:06:57
4460	38	84	3	2024-12-03 22:06:57	2024-12-03 22:07:38
4467	38	84	3	2024-12-03 22:07:38	2024-12-03 22:08:18
4474	38	84	3	2024-12-03 22:08:18	2024-12-03 22:08:58
4481	38	84	3	2024-12-03 22:08:58	2024-12-03 22:09:39
4488	38	84	3	2024-12-03 22:09:39	2024-12-03 22:10:19
4495	38	84	3	2024-12-03 22:10:19	2024-12-03 22:10:59
4502	38	84	3	2024-12-03 22:10:59	2024-12-03 22:11:40
4509	38	84	3	2024-12-03 22:11:40	2024-12-03 22:12:20
4516	38	84	3	2024-12-03 22:12:20	2024-12-03 22:13:00
4523	38	84	3	2024-12-03 22:13:00	2024-12-03 22:13:41
4530	38	84	3	2024-12-03 22:13:41	2024-12-03 22:14:21
4537	38	84	3	2024-12-03 22:14:21	2024-12-03 22:15:01
4544	38	84	3	2024-12-03 22:15:01	2024-12-03 22:15:42
4551	38	84	3	2024-12-03 22:15:42	2024-12-03 22:16:22
4558	38	84	3	2024-12-03 22:16:22	2024-12-03 22:17:02
4565	38	84	3	2024-12-03 22:17:02	2024-12-03 22:17:43
4572	38	84	3	2024-12-03 22:17:43	2024-12-03 22:18:23
5439	38	83	3	2024-12-03 23:41:01	2024-12-03 23:41:41
5446	38	83	3	2024-12-03 23:41:41	2024-12-03 23:42:21
5453	38	83	3	2024-12-03 23:42:21	2024-12-03 23:43:02
5460	38	83	3	2024-12-03 23:43:02	2024-12-03 23:43:42
5467	38	83	3	2024-12-03 23:43:42	2024-12-03 23:44:22
5474	38	83	3	2024-12-03 23:44:22	2024-12-03 23:45:03
5481	38	83	3	2024-12-03 23:45:03	2024-12-03 23:45:44
5488	38	83	3	2024-12-03 23:45:44	2024-12-03 23:46:24
5495	38	83	3	2024-12-03 23:46:24	2024-12-03 23:47:04
5502	38	83	3	2024-12-03 23:47:04	2024-12-03 23:47:44
5509	38	83	3	2024-12-03 23:47:44	2024-12-03 23:48:25
5516	38	83	3	2024-12-03 23:48:25	2024-12-03 23:49:05
5523	38	83	3	2024-12-03 23:49:05	2024-12-03 23:49:46
5530	38	83	3	2024-12-03 23:49:46	2024-12-03 23:50:26
5537	38	83	3	2024-12-03 23:50:26	2024-12-03 23:51:06
5544	38	83	3	2024-12-03 23:51:06	2024-12-03 23:51:47
5551	38	83	3	2024-12-03 23:51:47	2024-12-03 23:52:27
5558	38	83	3	2024-12-03 23:52:27	2024-12-03 23:53:07
5565	38	83	3	2024-12-03 23:53:07	2024-12-03 23:53:48
5572	38	83	3	2024-12-03 23:53:48	2024-12-03 23:54:28
5579	38	83	3	2024-12-03 23:54:28	2024-12-03 23:55:08
5586	38	83	3	2024-12-03 23:55:08	2024-12-03 23:55:49
5593	38	83	3	2024-12-03 23:55:49	2024-12-03 23:56:29
5600	38	83	3	2024-12-03 23:56:29	2024-12-03 23:57:09
5607	38	83	3	2024-12-03 23:57:09	2024-12-03 23:57:49
5614	38	83	3	2024-12-03 23:57:49	2024-12-03 23:58:30
5621	38	83	3	2024-12-03 23:58:30	2024-12-03 23:59:10
5628	38	83	3	2024-12-03 23:59:10	2024-12-03 23:59:50
5635	38	83	3	2024-12-03 23:59:50	2024-12-04 00:00:31
5642	38	83	3	2024-12-04 00:00:31	2024-12-04 00:01:11
5649	38	83	3	2024-12-04 00:01:11	2024-12-04 00:01:51
5656	38	83	3	2024-12-04 00:01:51	2024-12-04 00:02:32
5663	38	83	3	2024-12-04 00:02:32	2024-12-04 00:03:12
5670	38	83	3	2024-12-04 00:03:12	2024-12-04 00:03:52
5677	38	83	3	2024-12-04 00:03:52	2024-12-04 00:04:33
5684	38	83	3	2024-12-04 00:04:33	2024-12-04 00:05:13
5691	38	83	3	2024-12-04 00:05:13	2024-12-04 00:05:53
5698	38	83	3	2024-12-04 00:05:53	2024-12-04 00:06:34
5705	38	83	3	2024-12-04 00:06:34	2024-12-04 00:07:14
5712	38	83	3	2024-12-04 00:07:14	2024-12-04 00:07:54
5719	38	83	3	2024-12-04 00:07:54	2024-12-04 00:08:35
5726	38	83	3	2024-12-04 00:08:35	2024-12-04 00:09:15
5733	38	83	3	2024-12-04 00:09:15	2024-12-04 00:09:55
2147	38	84	3	2024-12-03 18:04:59	2024-12-03 18:05:39
2153	38	84	3	2024-12-03 18:05:39	2024-12-03 18:06:19
2159	38	84	3	2024-12-03 18:06:19	2024-12-03 18:07:00
2165	38	84	3	2024-12-03 18:07:00	2024-12-03 18:07:40
2166	38	87	3	2024-12-03 18:07:09	2024-12-03 18:07:50
2167	38	86	3	2024-12-03 18:07:11	2024-12-03 18:07:51
2168	38	81	3	2024-12-03 18:07:15	2024-12-03 18:07:55
2169	38	82	3	2024-12-03 18:07:22	2024-12-03 18:08:02
2170	38	83	3	2024-12-03 18:07:24	2024-12-03 18:08:05
2171	38	84	3	2024-12-03 18:07:40	2024-12-03 18:08:20
2172	38	87	3	2024-12-03 18:07:50	2024-12-03 18:08:30
2173	38	86	3	2024-12-03 18:07:51	2024-12-03 18:08:32
2174	38	81	3	2024-12-03 18:07:55	2024-12-03 18:08:36
2175	38	82	3	2024-12-03 18:08:02	2024-12-03 18:08:43
2176	38	83	3	2024-12-03 18:08:05	2024-12-03 18:08:45
2177	38	84	3	2024-12-03 18:08:20	2024-12-03 18:09:01
2178	38	87	3	2024-12-03 18:08:30	2024-12-03 18:09:10
2179	38	86	3	2024-12-03 18:08:32	2024-12-03 18:09:12
2180	38	81	3	2024-12-03 18:08:36	2024-12-03 18:09:16
2181	38	82	3	2024-12-03 18:08:43	2024-12-03 18:09:23
2182	38	83	3	2024-12-03 18:08:45	2024-12-03 18:09:25
2183	38	84	3	2024-12-03 18:09:01	2024-12-03 18:09:41
2184	38	87	3	2024-12-03 18:09:10	2024-12-03 18:09:51
2185	38	86	3	2024-12-03 18:09:12	2024-12-03 18:09:52
2186	38	81	3	2024-12-03 18:09:16	2024-12-03 18:09:56
2187	38	82	3	2024-12-03 18:09:23	2024-12-03 18:10:04
2188	38	83	3	2024-12-03 18:09:25	2024-12-03 18:10:06
2189	38	84	3	2024-12-03 18:09:41	2024-12-03 18:10:21
2190	38	87	3	2024-12-03 18:09:51	2024-12-03 18:10:31
2191	38	86	3	2024-12-03 18:09:52	2024-12-03 18:10:33
2192	38	81	3	2024-12-03 18:09:56	2024-12-03 18:10:37
2193	38	82	3	2024-12-03 18:10:04	2024-12-03 18:10:44
2194	38	83	3	2024-12-03 18:10:06	2024-12-03 18:10:46
2195	38	84	3	2024-12-03 18:10:21	2024-12-03 18:11:02
2196	38	87	3	2024-12-03 18:10:31	2024-12-03 18:11:11
2197	38	86	3	2024-12-03 18:10:33	2024-12-03 18:11:13
2198	38	81	3	2024-12-03 18:10:37	2024-12-03 18:11:17
2199	38	82	3	2024-12-03 18:10:44	2024-12-03 18:11:24
2200	38	83	3	2024-12-03 18:10:46	2024-12-03 18:11:27
2201	38	84	3	2024-12-03 18:11:02	2024-12-03 18:11:42
2202	38	87	3	2024-12-03 18:11:11	2024-12-03 18:11:52
2203	38	86	3	2024-12-03 18:11:13	2024-12-03 18:11:54
2204	38	81	3	2024-12-03 18:11:17	2024-12-03 18:11:57
2205	38	82	3	2024-12-03 18:11:24	2024-12-03 18:12:05
2206	38	83	3	2024-12-03 18:11:27	2024-12-03 18:12:07
2207	38	84	3	2024-12-03 18:11:42	2024-12-03 18:12:22
2208	38	87	3	2024-12-03 18:11:52	2024-12-03 18:12:32
2209	38	86	3	2024-12-03 18:11:54	2024-12-03 18:12:34
2210	38	81	3	2024-12-03 18:11:57	2024-12-03 18:12:38
2211	38	82	3	2024-12-03 18:12:05	2024-12-03 18:12:45
2212	38	83	3	2024-12-03 18:12:07	2024-12-03 18:12:48
2213	38	84	3	2024-12-03 18:12:22	2024-12-03 18:13:03
2214	38	87	3	2024-12-03 18:12:32	2024-12-03 18:13:12
2215	38	86	3	2024-12-03 18:12:34	2024-12-03 18:13:14
2216	38	81	3	2024-12-03 18:12:38	2024-12-03 18:13:18
2217	38	82	3	2024-12-03 18:12:45	2024-12-03 18:13:25
2218	38	83	3	2024-12-03 18:12:48	2024-12-03 18:13:28
2219	38	84	3	2024-12-03 18:13:03	2024-12-03 18:13:43
2220	38	87	3	2024-12-03 18:13:12	2024-12-03 18:13:53
2221	38	86	3	2024-12-03 18:13:14	2024-12-03 18:13:55
2222	38	81	3	2024-12-03 18:13:18	2024-12-03 18:13:58
2223	38	82	3	2024-12-03 18:13:25	2024-12-03 18:14:06
2224	38	83	3	2024-12-03 18:13:28	2024-12-03 18:14:09
2225	38	84	3	2024-12-03 18:13:43	2024-12-03 18:14:23
2226	38	87	3	2024-12-03 18:13:53	2024-12-03 18:14:33
2227	38	86	3	2024-12-03 18:13:55	2024-12-03 18:14:35
2228	38	81	3	2024-12-03 18:13:58	2024-12-03 18:14:38
2229	38	82	3	2024-12-03 18:14:06	2024-12-03 18:14:46
2230	38	83	3	2024-12-03 18:14:09	2024-12-03 18:14:49
2231	38	84	3	2024-12-03 18:14:23	2024-12-03 18:15:04
2232	38	87	3	2024-12-03 18:14:33	2024-12-03 18:15:14
2233	38	86	3	2024-12-03 18:14:35	2024-12-03 18:15:15
2234	38	81	3	2024-12-03 18:14:38	2024-12-03 18:15:19
2235	38	82	3	2024-12-03 18:14:46	2024-12-03 18:15:26
2236	38	83	3	2024-12-03 18:14:49	2024-12-03 18:15:29
2237	38	84	3	2024-12-03 18:15:04	2024-12-03 18:15:44
2238	38	87	3	2024-12-03 18:15:14	2024-12-03 18:15:54
2239	38	86	3	2024-12-03 18:15:15	2024-12-03 18:15:56
2240	38	81	3	2024-12-03 18:15:19	2024-12-03 18:15:59
2241	38	82	3	2024-12-03 18:15:26	2024-12-03 18:16:07
2242	38	83	3	2024-12-03 18:15:29	2024-12-03 18:16:10
2243	38	84	3	2024-12-03 18:15:44	2024-12-03 18:16:25
2244	38	87	3	2024-12-03 18:15:54	2024-12-03 18:16:34
2245	38	86	3	2024-12-03 18:15:56	2024-12-03 18:16:36
2246	38	81	3	2024-12-03 18:15:59	2024-12-03 18:16:39
2247	38	82	3	2024-12-03 18:16:07	2024-12-03 18:16:47
2248	38	83	3	2024-12-03 18:16:10	2024-12-03 18:16:50
2249	38	84	3	2024-12-03 18:16:25	2024-12-03 18:17:05
2250	38	87	3	2024-12-03 18:16:34	2024-12-03 18:17:14
2251	38	86	3	2024-12-03 18:16:36	2024-12-03 18:17:16
2252	38	81	3	2024-12-03 18:16:39	2024-12-03 18:17:20
2253	38	82	3	2024-12-03 18:16:47	2024-12-03 18:17:27
2254	38	83	3	2024-12-03 18:16:50	2024-12-03 18:17:30
2255	38	84	3	2024-12-03 18:17:05	2024-12-03 18:17:45
2256	38	87	3	2024-12-03 18:17:15	2024-12-03 18:17:55
2257	38	86	3	2024-12-03 18:17:16	2024-12-03 18:17:57
2258	38	81	3	2024-12-03 18:17:20	2024-12-03 18:18:00
2259	38	82	3	2024-12-03 18:17:27	2024-12-03 18:18:08
2260	38	83	3	2024-12-03 18:17:30	2024-12-03 18:18:11
2261	38	84	3	2024-12-03 18:17:45	2024-12-03 18:18:26
2262	38	87	3	2024-12-03 18:17:55	2024-12-03 18:18:35
2263	38	86	3	2024-12-03 18:17:57	2024-12-03 18:18:37
2264	38	81	3	2024-12-03 18:18:00	2024-12-03 18:18:40
2265	38	82	3	2024-12-03 18:18:08	2024-12-03 18:18:48
2266	38	83	3	2024-12-03 18:18:11	2024-12-03 18:18:51
2267	38	84	3	2024-12-03 18:18:26	2024-12-03 18:19:06
2268	38	87	3	2024-12-03 18:18:35	2024-12-03 18:19:16
2269	38	86	3	2024-12-03 18:18:37	2024-12-03 18:19:17
2270	38	81	3	2024-12-03 18:18:40	2024-12-03 18:19:21
2271	38	82	3	2024-12-03 18:18:48	2024-12-03 18:19:29
2272	38	83	3	2024-12-03 18:18:51	2024-12-03 18:19:31
2273	38	84	3	2024-12-03 18:19:06	2024-12-03 18:19:46
4336	38	86	3	2024-12-03 21:55:01	2024-12-03 21:55:42
2274	38	87	3	2024-12-03 18:19:16	2024-12-03 18:19:56
2280	38	87	3	2024-12-03 18:19:56	2024-12-03 18:20:36
2286	38	87	3	2024-12-03 18:20:36	2024-12-03 18:21:17
2292	38	87	3	2024-12-03 18:21:17	2024-12-03 18:21:57
2298	38	87	3	2024-12-03 18:21:57	2024-12-03 18:22:37
4343	38	86	3	2024-12-03 21:55:42	2024-12-03 21:56:22
4350	38	86	3	2024-12-03 21:56:22	2024-12-03 21:57:02
4357	38	86	3	2024-12-03 21:57:02	2024-12-03 21:57:43
4364	38	86	3	2024-12-03 21:57:43	2024-12-03 21:58:23
4371	38	86	3	2024-12-03 21:58:23	2024-12-03 21:59:04
4378	38	86	3	2024-12-03 21:59:04	2024-12-03 21:59:44
4385	38	86	3	2024-12-03 21:59:44	2024-12-03 22:00:24
4392	38	86	3	2024-12-03 22:00:24	2024-12-03 22:01:04
4399	38	86	3	2024-12-03 22:01:04	2024-12-03 22:01:45
4406	38	86	3	2024-12-03 22:01:45	2024-12-03 22:02:25
4413	38	86	3	2024-12-03 22:02:25	2024-12-03 22:03:06
4420	38	86	3	2024-12-03 22:03:06	2024-12-03 22:03:46
4427	38	86	3	2024-12-03 22:03:46	2024-12-03 22:04:26
4434	38	86	3	2024-12-03 22:04:26	2024-12-03 22:05:07
4441	38	86	3	2024-12-03 22:05:07	2024-12-03 22:05:47
4448	38	86	3	2024-12-03 22:05:47	2024-12-03 22:06:27
4455	38	86	3	2024-12-03 22:06:27	2024-12-03 22:07:08
4462	38	86	3	2024-12-03 22:07:08	2024-12-03 22:07:48
4469	38	86	3	2024-12-03 22:07:48	2024-12-03 22:08:28
4476	38	86	3	2024-12-03 22:08:28	2024-12-03 22:09:08
4483	38	86	3	2024-12-03 22:09:08	2024-12-03 22:09:49
4490	38	86	3	2024-12-03 22:09:49	2024-12-03 22:10:29
4497	38	86	3	2024-12-03 22:10:29	2024-12-03 22:11:09
4504	38	86	3	2024-12-03 22:11:09	2024-12-03 22:11:50
4511	38	86	3	2024-12-03 22:11:50	2024-12-03 22:12:30
4518	38	86	3	2024-12-03 22:12:30	2024-12-03 22:13:10
4525	38	86	3	2024-12-03 22:13:10	2024-12-03 22:13:51
4532	38	86	3	2024-12-03 22:13:51	2024-12-03 22:14:31
4539	38	86	3	2024-12-03 22:14:31	2024-12-03 22:15:11
4546	38	86	3	2024-12-03 22:15:11	2024-12-03 22:15:52
4553	38	86	3	2024-12-03 22:15:52	2024-12-03 22:16:32
4560	38	86	3	2024-12-03 22:16:32	2024-12-03 22:17:12
4567	38	86	3	2024-12-03 22:17:12	2024-12-03 22:17:53
4574	38	86	3	2024-12-03 22:17:53	2024-12-03 22:18:33
5434	38	87	3	2024-12-03 23:40:40	2024-12-03 23:41:20
5441	38	87	3	2024-12-03 23:41:20	2024-12-03 23:42:01
5448	38	87	3	2024-12-03 23:42:01	2024-12-03 23:42:41
5455	38	87	3	2024-12-03 23:42:41	2024-12-03 23:43:21
5462	38	87	3	2024-12-03 23:43:21	2024-12-03 23:44:02
5469	38	87	3	2024-12-03 23:44:02	2024-12-03 23:44:42
5476	38	87	3	2024-12-03 23:44:42	2024-12-03 23:45:23
5483	38	87	3	2024-12-03 23:45:23	2024-12-03 23:46:04
5490	38	87	3	2024-12-03 23:46:04	2024-12-03 23:46:44
5497	38	87	3	2024-12-03 23:46:44	2024-12-03 23:47:24
5504	38	87	3	2024-12-03 23:47:24	2024-12-03 23:48:05
5511	38	87	3	2024-12-03 23:48:05	2024-12-03 23:48:45
5518	38	87	3	2024-12-03 23:48:45	2024-12-03 23:49:25
5525	38	87	3	2024-12-03 23:49:25	2024-12-03 23:50:06
5532	38	87	3	2024-12-03 23:50:06	2024-12-03 23:50:46
5539	38	87	3	2024-12-03 23:50:46	2024-12-03 23:51:26
5546	38	87	3	2024-12-03 23:51:26	2024-12-03 23:52:07
5553	38	87	3	2024-12-03 23:52:07	2024-12-03 23:52:47
5560	38	87	3	2024-12-03 23:52:47	2024-12-03 23:53:27
5567	38	87	3	2024-12-03 23:53:27	2024-12-03 23:54:08
5574	38	87	3	2024-12-03 23:54:08	2024-12-03 23:54:48
5581	38	87	3	2024-12-03 23:54:48	2024-12-03 23:55:28
5588	38	87	3	2024-12-03 23:55:28	2024-12-03 23:56:09
5595	38	87	3	2024-12-03 23:56:09	2024-12-03 23:56:49
5602	38	87	3	2024-12-03 23:56:49	2024-12-03 23:57:29
5609	38	87	3	2024-12-03 23:57:29	2024-12-03 23:58:10
5616	38	87	3	2024-12-03 23:58:10	2024-12-03 23:58:50
5623	38	87	3	2024-12-03 23:58:50	2024-12-03 23:59:30
5630	38	87	3	2024-12-03 23:59:30	2024-12-04 00:00:11
5637	38	87	3	2024-12-04 00:00:11	2024-12-04 00:00:51
5644	38	87	3	2024-12-04 00:00:51	2024-12-04 00:01:31
5651	38	87	3	2024-12-04 00:01:31	2024-12-04 00:02:12
5658	38	87	3	2024-12-04 00:02:12	2024-12-04 00:02:52
5665	38	87	3	2024-12-04 00:02:52	2024-12-04 00:03:32
5672	38	87	3	2024-12-04 00:03:32	2024-12-04 00:04:13
5679	38	87	3	2024-12-04 00:04:13	2024-12-04 00:04:53
5686	38	87	3	2024-12-04 00:04:53	2024-12-04 00:05:33
5693	38	87	3	2024-12-04 00:05:33	2024-12-04 00:06:14
5700	38	87	3	2024-12-04 00:06:14	2024-12-04 00:06:54
5707	38	87	3	2024-12-04 00:06:54	2024-12-04 00:07:34
5714	38	87	3	2024-12-04 00:07:34	2024-12-04 00:08:14
5721	38	87	3	2024-12-04 00:08:14	2024-12-04 00:08:55
5728	38	87	3	2024-12-04 00:08:55	2024-12-04 00:09:35
2275	38	86	3	2024-12-03 18:19:17	2024-12-03 18:19:58
2281	38	86	3	2024-12-03 18:19:58	2024-12-03 18:20:38
2287	38	86	3	2024-12-03 18:20:38	2024-12-03 18:21:18
2293	38	86	3	2024-12-03 18:21:18	2024-12-03 18:21:59
2299	38	86	3	2024-12-03 18:21:59	2024-12-03 18:22:39
4576	38	82	3	2024-12-03 22:18:00	2024-12-03 22:18:40
4583	38	82	3	2024-12-03 22:18:40	2024-12-03 22:19:20
4590	38	82	3	2024-12-03 22:19:20	2024-12-03 22:20:01
4597	38	82	3	2024-12-03 22:20:01	2024-12-03 22:20:41
4604	38	82	3	2024-12-03 22:20:41	2024-12-03 22:21:21
4611	38	82	3	2024-12-03 22:21:21	2024-12-03 22:22:02
4618	38	82	3	2024-12-03 22:22:02	2024-12-03 22:22:42
4625	38	82	3	2024-12-03 22:22:42	2024-12-03 22:23:22
4632	38	82	3	2024-12-03 22:23:22	2024-12-03 22:24:03
4639	38	82	3	2024-12-03 22:24:03	2024-12-03 22:24:43
4646	38	82	3	2024-12-03 22:24:43	2024-12-03 22:25:23
4653	38	82	3	2024-12-03 22:25:23	2024-12-03 22:26:04
4660	38	82	3	2024-12-03 22:26:04	2024-12-03 22:26:44
4667	38	82	3	2024-12-03 22:26:44	2024-12-03 22:27:25
4674	38	82	3	2024-12-03 22:27:25	2024-12-03 22:28:05
4681	38	82	3	2024-12-03 22:28:05	2024-12-03 22:28:45
4688	38	82	3	2024-12-03 22:28:45	2024-12-03 22:29:26
4695	38	82	3	2024-12-03 22:29:26	2024-12-03 22:30:07
4702	38	82	3	2024-12-03 22:30:07	2024-12-03 22:30:48
4709	38	82	3	2024-12-03 22:30:48	2024-12-03 22:31:29
4716	38	82	3	2024-12-03 22:31:29	2024-12-03 22:32:10
4723	38	82	3	2024-12-03 22:32:10	2024-12-03 22:32:51
4730	38	82	3	2024-12-03 22:32:51	2024-12-03 22:33:31
4737	38	82	3	2024-12-03 22:33:31	2024-12-03 22:34:11
4744	38	82	3	2024-12-03 22:34:11	2024-12-03 22:34:52
4751	38	82	3	2024-12-03 22:34:52	2024-12-03 22:35:32
4758	38	82	3	2024-12-03 22:35:32	2024-12-03 22:36:12
4765	38	82	3	2024-12-03 22:36:12	2024-12-03 22:36:53
4772	38	82	3	2024-12-03 22:36:53	2024-12-03 22:37:33
4779	38	82	3	2024-12-03 22:37:33	2024-12-03 22:38:13
4786	38	82	3	2024-12-03 22:38:13	2024-12-03 22:38:54
4793	38	82	3	2024-12-03 22:38:54	2024-12-03 22:39:34
4800	38	82	3	2024-12-03 22:39:34	2024-12-03 22:40:14
4807	38	82	3	2024-12-03 22:40:14	2024-12-03 22:40:55
4814	38	82	3	2024-12-03 22:40:55	2024-12-03 22:41:35
5734	38	84	3	2024-12-04 00:09:27	2024-12-04 00:10:08
5741	38	84	3	2024-12-04 00:10:08	2024-12-04 00:10:48
5748	38	84	3	2024-12-04 00:10:48	2024-12-04 00:11:28
5755	38	84	3	2024-12-04 00:11:29	2024-12-04 00:12:09
5762	38	84	3	2024-12-04 00:12:09	2024-12-04 00:12:49
5769	38	84	3	2024-12-04 00:12:49	2024-12-04 00:13:30
5776	38	84	3	2024-12-04 00:13:30	2024-12-04 00:14:10
5783	38	84	3	2024-12-04 00:14:10	2024-12-04 00:14:50
5790	38	84	3	2024-12-04 00:14:50	2024-12-04 00:15:31
5797	38	84	3	2024-12-04 00:15:31	2024-12-04 00:16:11
5804	38	84	3	2024-12-04 00:16:11	2024-12-04 00:16:52
5811	38	84	3	2024-12-04 00:16:52	2024-12-04 00:17:33
5818	38	84	3	2024-12-04 00:17:33	2024-12-04 00:18:14
5825	38	84	3	2024-12-04 00:18:14	2024-12-04 00:18:55
5832	38	84	3	2024-12-04 00:18:55	2024-12-04 00:19:36
5839	38	84	3	2024-12-04 00:19:36	2024-12-04 00:20:17
5846	38	84	3	2024-12-04 00:20:17	2024-12-04 00:20:58
5853	38	84	3	2024-12-04 00:20:58	2024-12-04 00:21:39
5860	38	84	3	2024-12-04 00:21:39	2024-12-04 00:22:20
5867	38	84	3	2024-12-04 00:22:20	2024-12-04 00:23:00
5874	38	84	3	2024-12-04 00:23:00	2024-12-04 00:23:41
5881	38	84	3	2024-12-04 00:23:41	2024-12-04 00:24:22
5888	38	84	3	2024-12-04 00:24:22	2024-12-04 00:25:03
5895	38	84	3	2024-12-04 00:25:03	2024-12-04 00:25:44
5902	38	84	3	2024-12-04 00:25:44	2024-12-04 00:26:25
5909	38	84	3	2024-12-04 00:26:25	2024-12-04 00:27:06
5916	38	84	3	2024-12-04 00:27:06	2024-12-04 00:27:46
5923	38	84	3	2024-12-04 00:27:46	2024-12-04 00:28:26
5930	38	84	3	2024-12-04 00:28:26	2024-12-04 00:29:07
5937	38	84	3	2024-12-04 00:29:07	2024-12-04 00:29:47
5944	38	84	3	2024-12-04 00:29:47	2024-12-04 00:30:27
5951	38	84	3	2024-12-04 00:30:27	2024-12-04 00:31:08
5958	38	84	3	2024-12-04 00:31:08	2024-12-04 00:31:48
5965	38	84	3	2024-12-04 00:31:48	2024-12-04 00:32:28
5972	38	84	3	2024-12-04 00:32:28	2024-12-04 00:33:09
5979	38	84	3	2024-12-04 00:33:09	2024-12-04 00:33:49
5986	38	84	3	2024-12-04 00:33:49	2024-12-04 00:34:29
5993	38	84	3	2024-12-04 00:34:29	2024-12-04 00:35:10
6000	38	84	3	2024-12-04 00:35:10	2024-12-04 00:35:50
6007	38	84	3	2024-12-04 00:35:50	2024-12-04 00:36:31
6014	38	84	3	2024-12-04 00:36:31	2024-12-04 00:37:11
6021	38	84	3	2024-12-04 00:37:11	2024-12-04 00:37:51
6028	38	84	3	2024-12-04 00:37:51	2024-12-04 00:38:32
6035	38	84	3	2024-12-04 00:38:32	2024-12-04 00:39:12
6042	38	84	3	2024-12-04 00:39:12	2024-12-04 00:39:52
2276	38	81	3	2024-12-03 18:19:21	2024-12-03 18:20:01
2282	38	81	3	2024-12-03 18:20:01	2024-12-03 18:20:41
2288	38	81	3	2024-12-03 18:20:41	2024-12-03 18:21:22
2294	38	81	3	2024-12-03 18:21:22	2024-12-03 18:22:02
4577	38	88	3	2024-12-03 22:18:07	2024-12-03 22:18:47
4584	38	88	3	2024-12-03 22:18:47	2024-12-03 22:19:28
4591	38	88	3	2024-12-03 22:19:28	2024-12-03 22:20:08
4598	38	88	3	2024-12-03 22:20:08	2024-12-03 22:20:48
4605	38	88	3	2024-12-03 22:20:48	2024-12-03 22:21:29
4612	38	88	3	2024-12-03 22:21:29	2024-12-03 22:22:09
4619	38	88	3	2024-12-03 22:22:09	2024-12-03 22:22:50
4626	38	88	3	2024-12-03 22:22:50	2024-12-03 22:23:30
4633	38	88	3	2024-12-03 22:23:30	2024-12-03 22:24:10
4640	38	88	3	2024-12-03 22:24:10	2024-12-03 22:24:51
4647	38	88	3	2024-12-03 22:24:51	2024-12-03 22:25:31
4654	38	88	3	2024-12-03 22:25:31	2024-12-03 22:26:11
4661	38	88	3	2024-12-03 22:26:11	2024-12-03 22:26:51
4668	38	88	3	2024-12-03 22:26:51	2024-12-03 22:27:32
4675	38	88	3	2024-12-03 22:27:32	2024-12-03 22:28:12
4682	38	88	3	2024-12-03 22:28:12	2024-12-03 22:28:52
4689	38	88	3	2024-12-03 22:28:52	2024-12-03 22:29:33
4696	38	88	3	2024-12-03 22:29:33	2024-12-03 22:30:14
4703	38	88	3	2024-12-03 22:30:14	2024-12-03 22:30:55
4710	38	88	3	2024-12-03 22:30:55	2024-12-03 22:31:36
4717	38	88	3	2024-12-03 22:31:36	2024-12-03 22:32:17
4724	38	88	3	2024-12-03 22:32:17	2024-12-03 22:32:57
4731	38	88	3	2024-12-03 22:32:57	2024-12-03 22:33:38
4738	38	88	3	2024-12-03 22:33:38	2024-12-03 22:34:18
4745	38	88	3	2024-12-03 22:34:18	2024-12-03 22:34:58
4752	38	88	3	2024-12-03 22:34:58	2024-12-03 22:35:42
4759	38	88	3	2024-12-03 22:35:42	2024-12-03 22:36:22
4766	38	88	3	2024-12-03 22:36:22	2024-12-03 22:37:03
4773	38	88	3	2024-12-03 22:37:03	2024-12-03 22:37:43
4780	38	88	3	2024-12-03 22:37:43	2024-12-03 22:38:23
4787	38	88	3	2024-12-03 22:38:23	2024-12-03 22:39:04
4794	38	88	3	2024-12-03 22:39:04	2024-12-03 22:39:44
4801	38	88	3	2024-12-03 22:39:44	2024-12-03 22:40:24
4808	38	88	3	2024-12-03 22:40:24	2024-12-03 22:41:04
5735	38	87	3	2024-12-04 00:09:35	2024-12-04 00:10:15
5742	38	87	3	2024-12-04 00:10:15	2024-12-04 00:10:56
5749	38	87	3	2024-12-04 00:10:56	2024-12-04 00:11:36
5756	38	87	3	2024-12-04 00:11:36	2024-12-04 00:12:17
5763	38	87	3	2024-12-04 00:12:17	2024-12-04 00:12:57
5770	38	87	3	2024-12-04 00:12:57	2024-12-04 00:13:37
5777	38	87	3	2024-12-04 00:13:37	2024-12-04 00:14:18
5784	38	87	3	2024-12-04 00:14:18	2024-12-04 00:14:58
5791	38	87	3	2024-12-04 00:14:58	2024-12-04 00:15:38
5798	38	87	3	2024-12-04 00:15:38	2024-12-04 00:16:19
5805	38	87	3	2024-12-04 00:16:19	2024-12-04 00:17:01
5812	38	87	3	2024-12-04 00:17:01	2024-12-04 00:17:42
5819	38	87	3	2024-12-04 00:17:42	2024-12-04 00:18:23
5826	38	87	3	2024-12-04 00:18:23	2024-12-04 00:19:03
5833	38	87	3	2024-12-04 00:19:03	2024-12-04 00:19:44
5840	38	87	3	2024-12-04 00:19:44	2024-12-04 00:20:25
5847	38	87	3	2024-12-04 00:20:25	2024-12-04 00:21:06
5854	38	87	3	2024-12-04 00:21:06	2024-12-04 00:21:47
5861	38	87	3	2024-12-04 00:21:47	2024-12-04 00:22:28
5868	38	87	3	2024-12-04 00:22:28	2024-12-04 00:23:09
5875	38	87	3	2024-12-04 00:23:09	2024-12-04 00:23:49
5882	38	87	3	2024-12-04 00:23:49	2024-12-04 00:24:30
5889	38	87	3	2024-12-04 00:24:30	2024-12-04 00:25:11
5896	38	87	3	2024-12-04 00:25:11	2024-12-04 00:25:52
5903	38	87	3	2024-12-04 00:25:52	2024-12-04 00:26:33
5910	38	87	3	2024-12-04 00:26:33	2024-12-04 00:27:14
5917	38	87	3	2024-12-04 00:27:14	2024-12-04 00:27:54
5924	38	87	3	2024-12-04 00:27:54	2024-12-04 00:28:34
5931	38	87	3	2024-12-04 00:28:34	2024-12-04 00:29:14
5938	38	87	3	2024-12-04 00:29:14	2024-12-04 00:29:55
5945	38	87	3	2024-12-04 00:29:55	2024-12-04 00:30:35
5952	38	87	3	2024-12-04 00:30:35	2024-12-04 00:31:15
5959	38	87	3	2024-12-04 00:31:15	2024-12-04 00:31:56
5966	38	87	3	2024-12-04 00:31:56	2024-12-04 00:32:36
5973	38	87	3	2024-12-04 00:32:36	2024-12-04 00:33:16
5980	38	87	3	2024-12-04 00:33:16	2024-12-04 00:33:57
5987	38	87	3	2024-12-04 00:33:57	2024-12-04 00:34:37
5994	38	87	3	2024-12-04 00:34:37	2024-12-04 00:35:17
6001	38	87	3	2024-12-04 00:35:17	2024-12-04 00:35:58
6008	38	87	3	2024-12-04 00:35:58	2024-12-04 00:36:38
6015	38	87	3	2024-12-04 00:36:38	2024-12-04 00:37:18
6022	38	87	3	2024-12-04 00:37:18	2024-12-04 00:37:59
6029	38	87	3	2024-12-04 00:37:59	2024-12-04 00:38:39
6036	38	87	3	2024-12-04 00:38:39	2024-12-04 00:39:19
6043	38	87	3	2024-12-04 00:39:19	2024-12-04 00:40:00
2277	38	82	3	2024-12-03 18:19:29	2024-12-03 18:20:09
2283	38	82	3	2024-12-03 18:20:09	2024-12-03 18:20:49
2289	38	82	3	2024-12-03 18:20:49	2024-12-03 18:21:30
2295	38	82	3	2024-12-03 18:21:30	2024-12-03 18:22:10
4578	38	83	3	2024-12-03 22:18:11	2024-12-03 22:18:51
4585	38	83	3	2024-12-03 22:18:51	2024-12-03 22:19:32
4592	38	83	3	2024-12-03 22:19:32	2024-12-03 22:20:12
4599	38	83	3	2024-12-03 22:20:12	2024-12-03 22:20:52
4606	38	83	3	2024-12-03 22:20:52	2024-12-03 22:21:33
4613	38	83	3	2024-12-03 22:21:33	2024-12-03 22:22:13
4620	38	83	3	2024-12-03 22:22:13	2024-12-03 22:22:53
4627	38	83	3	2024-12-03 22:22:53	2024-12-03 22:23:34
4634	38	83	3	2024-12-03 22:23:34	2024-12-03 22:24:14
4641	38	83	3	2024-12-03 22:24:14	2024-12-03 22:24:54
4648	38	83	3	2024-12-03 22:24:54	2024-12-03 22:25:35
4655	38	83	3	2024-12-03 22:25:35	2024-12-03 22:26:15
4662	38	83	3	2024-12-03 22:26:15	2024-12-03 22:26:55
4669	38	83	3	2024-12-03 22:26:55	2024-12-03 22:27:36
4676	38	83	3	2024-12-03 22:27:36	2024-12-03 22:28:16
4683	38	83	3	2024-12-03 22:28:16	2024-12-03 22:28:57
4690	38	83	3	2024-12-03 22:28:57	2024-12-03 22:29:37
4697	38	83	3	2024-12-03 22:29:37	2024-12-03 22:30:18
4704	38	83	3	2024-12-03 22:30:18	2024-12-03 22:30:59
4711	38	83	3	2024-12-03 22:30:59	2024-12-03 22:31:40
4718	38	83	3	2024-12-03 22:31:40	2024-12-03 22:32:21
4725	38	83	3	2024-12-03 22:32:21	2024-12-03 22:33:02
4732	38	83	3	2024-12-03 22:33:02	2024-12-03 22:33:42
4739	38	83	3	2024-12-03 22:33:42	2024-12-03 22:34:22
4746	38	83	3	2024-12-03 22:34:22	2024-12-03 22:35:03
4753	38	83	3	2024-12-03 22:35:03	2024-12-03 22:35:43
4760	38	83	3	2024-12-03 22:35:43	2024-12-03 22:36:23
4767	38	83	3	2024-12-03 22:36:23	2024-12-03 22:37:04
4774	38	83	3	2024-12-03 22:37:04	2024-12-03 22:37:44
4781	38	83	3	2024-12-03 22:37:44	2024-12-03 22:38:25
4788	38	83	3	2024-12-03 22:38:25	2024-12-03 22:39:05
4795	38	83	3	2024-12-03 22:39:05	2024-12-03 22:39:45
4802	38	83	3	2024-12-03 22:39:45	2024-12-03 22:40:26
4809	38	83	3	2024-12-03 22:40:26	2024-12-03 22:41:06
5736	38	86	3	2024-12-04 00:09:36	2024-12-04 00:10:16
5743	38	86	3	2024-12-04 00:10:16	2024-12-04 00:10:57
5750	38	86	3	2024-12-04 00:10:57	2024-12-04 00:11:37
5757	38	86	3	2024-12-04 00:11:37	2024-12-04 00:12:17
5764	38	86	3	2024-12-04 00:12:17	2024-12-04 00:12:58
5771	38	86	3	2024-12-04 00:12:58	2024-12-04 00:13:38
5778	38	86	3	2024-12-04 00:13:38	2024-12-04 00:14:18
5785	38	86	3	2024-12-04 00:14:18	2024-12-04 00:14:59
5792	38	86	3	2024-12-04 00:14:59	2024-12-04 00:15:39
5799	38	86	3	2024-12-04 00:15:39	2024-12-04 00:16:20
5806	38	86	3	2024-12-04 00:16:20	2024-12-04 00:17:01
5813	38	86	3	2024-12-04 00:17:01	2024-12-04 00:17:42
5820	38	86	3	2024-12-04 00:17:42	2024-12-04 00:18:23
5827	38	86	3	2024-12-04 00:18:23	2024-12-04 00:19:04
5834	38	86	3	2024-12-04 00:19:04	2024-12-04 00:19:45
5841	38	86	3	2024-12-04 00:19:45	2024-12-04 00:20:26
5848	38	86	3	2024-12-04 00:20:26	2024-12-04 00:21:07
5855	38	86	3	2024-12-04 00:21:07	2024-12-04 00:21:48
5862	38	86	3	2024-12-04 00:21:48	2024-12-04 00:22:29
5869	38	86	3	2024-12-04 00:22:29	2024-12-04 00:23:09
5876	38	86	3	2024-12-04 00:23:09	2024-12-04 00:23:50
5883	38	86	3	2024-12-04 00:23:50	2024-12-04 00:24:31
5890	38	86	3	2024-12-04 00:24:31	2024-12-04 00:25:12
5897	38	86	3	2024-12-04 00:25:12	2024-12-04 00:25:53
5904	38	86	3	2024-12-04 00:25:53	2024-12-04 00:26:34
5911	38	86	3	2024-12-04 00:26:34	2024-12-04 00:27:15
5918	38	86	3	2024-12-04 00:27:15	2024-12-04 00:27:55
5925	38	86	3	2024-12-04 00:27:55	2024-12-04 00:28:35
5932	38	86	3	2024-12-04 00:28:35	2024-12-04 00:29:16
5939	38	86	3	2024-12-04 00:29:16	2024-12-04 00:29:56
5946	38	86	3	2024-12-04 00:29:56	2024-12-04 00:30:36
5953	38	86	3	2024-12-04 00:30:36	2024-12-04 00:31:17
5960	38	86	3	2024-12-04 00:31:17	2024-12-04 00:31:57
5967	38	86	3	2024-12-04 00:31:57	2024-12-04 00:32:37
5974	38	86	3	2024-12-04 00:32:37	2024-12-04 00:33:18
5981	38	86	3	2024-12-04 00:33:18	2024-12-04 00:33:58
5988	38	86	3	2024-12-04 00:33:58	2024-12-04 00:34:39
5995	38	86	3	2024-12-04 00:34:39	2024-12-04 00:35:19
6002	38	86	3	2024-12-04 00:35:19	2024-12-04 00:35:59
6009	38	86	3	2024-12-04 00:35:59	2024-12-04 00:36:40
6016	38	86	3	2024-12-04 00:36:40	2024-12-04 00:37:20
6023	38	86	3	2024-12-04 00:37:20	2024-12-04 00:38:00
6030	38	86	3	2024-12-04 00:38:00	2024-12-04 00:38:41
6037	38	86	3	2024-12-04 00:38:41	2024-12-04 00:39:21
6044	38	86	3	2024-12-04 00:39:21	2024-12-04 00:40:01
2278	38	83	3	2024-12-03 18:19:31	2024-12-03 18:20:12
2284	38	83	3	2024-12-03 18:20:12	2024-12-03 18:20:52
2290	38	83	3	2024-12-03 18:20:52	2024-12-03 18:21:32
2296	38	83	3	2024-12-03 18:21:32	2024-12-03 18:22:13
4579	38	84	3	2024-12-03 22:18:23	2024-12-03 22:19:04
4586	38	84	3	2024-12-03 22:19:04	2024-12-03 22:19:44
4593	38	84	3	2024-12-03 22:19:44	2024-12-03 22:20:24
4600	38	84	3	2024-12-03 22:20:24	2024-12-03 22:21:05
4607	38	84	3	2024-12-03 22:21:05	2024-12-03 22:21:45
4614	38	84	3	2024-12-03 22:21:45	2024-12-03 22:22:25
4621	38	84	3	2024-12-03 22:22:25	2024-12-03 22:23:06
4628	38	84	3	2024-12-03 22:23:06	2024-12-03 22:23:46
4635	38	84	3	2024-12-03 22:23:46	2024-12-03 22:24:26
4642	38	84	3	2024-12-03 22:24:26	2024-12-03 22:25:07
4649	38	84	3	2024-12-03 22:25:07	2024-12-03 22:25:47
4656	38	84	3	2024-12-03 22:25:47	2024-12-03 22:26:27
4663	38	84	3	2024-12-03 22:26:27	2024-12-03 22:27:08
4670	38	84	3	2024-12-03 22:27:08	2024-12-03 22:27:48
4677	38	84	3	2024-12-03 22:27:48	2024-12-03 22:28:29
4684	38	84	3	2024-12-03 22:28:29	2024-12-03 22:29:09
4691	38	84	3	2024-12-03 22:29:09	2024-12-03 22:29:50
4698	38	84	3	2024-12-03 22:29:50	2024-12-03 22:30:31
4705	38	84	3	2024-12-03 22:30:31	2024-12-03 22:31:13
4712	38	84	3	2024-12-03 22:31:13	2024-12-03 22:31:54
4719	38	84	3	2024-12-03 22:31:54	2024-12-03 22:32:34
4726	38	84	3	2024-12-03 22:32:34	2024-12-03 22:33:14
4733	38	84	3	2024-12-03 22:33:14	2024-12-03 22:33:55
4740	38	84	3	2024-12-03 22:33:55	2024-12-03 22:34:35
4747	38	84	3	2024-12-03 22:34:35	2024-12-03 22:35:15
4754	38	84	3	2024-12-03 22:35:15	2024-12-03 22:35:56
4761	38	84	3	2024-12-03 22:35:56	2024-12-03 22:36:36
4768	38	84	3	2024-12-03 22:36:36	2024-12-03 22:37:16
4775	38	84	3	2024-12-03 22:37:16	2024-12-03 22:37:56
4782	38	84	3	2024-12-03 22:37:56	2024-12-03 22:38:37
4789	38	84	3	2024-12-03 22:38:37	2024-12-03 22:39:17
4796	38	84	3	2024-12-03 22:39:17	2024-12-03 22:39:57
4803	38	84	3	2024-12-03 22:39:57	2024-12-03 22:40:38
4810	38	84	3	2024-12-03 22:40:38	2024-12-03 22:41:18
5737	38	81	3	2024-12-04 00:09:37	2024-12-04 00:10:18
5744	38	81	3	2024-12-04 00:10:18	2024-12-04 00:10:58
5751	38	81	3	2024-12-04 00:10:58	2024-12-04 00:11:39
5758	38	81	3	2024-12-04 00:11:39	2024-12-04 00:12:19
5765	38	81	3	2024-12-04 00:12:19	2024-12-04 00:12:59
5772	38	81	3	2024-12-04 00:12:59	2024-12-04 00:13:40
5779	38	81	3	2024-12-04 00:13:40	2024-12-04 00:14:20
5786	38	81	3	2024-12-04 00:14:20	2024-12-04 00:15:00
5793	38	81	3	2024-12-04 00:15:00	2024-12-04 00:15:41
5800	38	81	3	2024-12-04 00:15:41	2024-12-04 00:16:22
5807	38	81	3	2024-12-04 00:16:22	2024-12-04 00:17:03
5814	38	81	3	2024-12-04 00:17:03	2024-12-04 00:17:44
5821	38	81	3	2024-12-04 00:17:44	2024-12-04 00:18:25
5828	38	81	3	2024-12-04 00:18:25	2024-12-04 00:19:06
5835	38	81	3	2024-12-04 00:19:06	2024-12-04 00:19:47
5842	38	81	3	2024-12-04 00:19:47	2024-12-04 00:20:28
5849	38	81	3	2024-12-04 00:20:28	2024-12-04 00:21:09
5856	38	81	3	2024-12-04 00:21:09	2024-12-04 00:21:49
5863	38	81	3	2024-12-04 00:21:49	2024-12-04 00:22:30
5870	38	81	3	2024-12-04 00:22:30	2024-12-04 00:23:11
5877	38	81	3	2024-12-04 00:23:11	2024-12-04 00:23:51
5884	38	81	3	2024-12-04 00:23:51	2024-12-04 00:24:32
5891	38	81	3	2024-12-04 00:24:32	2024-12-04 00:25:13
5898	38	81	3	2024-12-04 00:25:13	2024-12-04 00:25:54
5905	38	81	3	2024-12-04 00:25:54	2024-12-04 00:26:35
5912	38	81	3	2024-12-04 00:26:35	2024-12-04 00:27:16
5919	38	81	3	2024-12-04 00:27:16	2024-12-04 00:27:56
5926	38	81	3	2024-12-04 00:27:56	2024-12-04 00:28:37
5933	38	81	3	2024-12-04 00:28:37	2024-12-04 00:29:17
5940	38	81	3	2024-12-04 00:29:17	2024-12-04 00:29:57
5947	38	81	3	2024-12-04 00:29:57	2024-12-04 00:30:38
5954	38	81	3	2024-12-04 00:30:38	2024-12-04 00:31:18
5961	38	81	3	2024-12-04 00:31:18	2024-12-04 00:31:58
5968	38	81	3	2024-12-04 00:31:58	2024-12-04 00:32:39
5975	38	81	3	2024-12-04 00:32:39	2024-12-04 00:33:19
5982	38	81	3	2024-12-04 00:33:19	2024-12-04 00:33:59
5989	38	81	3	2024-12-04 00:33:59	2024-12-04 00:34:40
5996	38	81	3	2024-12-04 00:34:40	2024-12-04 00:35:20
6003	38	81	3	2024-12-04 00:35:20	2024-12-04 00:36:01
6010	38	81	3	2024-12-04 00:36:01	2024-12-04 00:36:41
6017	38	81	3	2024-12-04 00:36:41	2024-12-04 00:37:21
6024	38	81	3	2024-12-04 00:37:21	2024-12-04 00:38:02
6031	38	81	3	2024-12-04 00:38:02	2024-12-04 00:38:42
6038	38	81	3	2024-12-04 00:38:42	2024-12-04 00:39:22
6045	38	81	3	2024-12-04 00:39:22	2024-12-04 00:40:03
2279	38	84	3	2024-12-03 18:19:46	2024-12-03 18:20:27
2285	38	84	3	2024-12-03 18:20:27	2024-12-03 18:21:07
2291	38	84	3	2024-12-03 18:21:07	2024-12-03 18:21:48
2297	38	84	3	2024-12-03 18:21:48	2024-12-03 18:22:28
2300	38	81	3	2024-12-03 18:22:02	2024-12-03 18:22:42
2301	38	82	3	2024-12-03 18:22:10	2024-12-03 18:22:51
2302	38	83	3	2024-12-03 18:22:13	2024-12-03 18:22:53
2303	38	84	3	2024-12-03 18:22:28	2024-12-03 18:23:08
2304	38	87	3	2024-12-03 18:22:37	2024-12-03 18:23:18
2305	38	86	3	2024-12-03 18:22:39	2024-12-03 18:23:20
2306	38	81	3	2024-12-03 18:22:42	2024-12-03 18:23:23
2307	38	82	3	2024-12-03 18:22:51	2024-12-03 18:23:31
2308	38	83	3	2024-12-03 18:22:53	2024-12-03 18:23:33
2309	38	84	3	2024-12-03 18:23:08	2024-12-03 18:23:49
2310	38	87	3	2024-12-03 18:23:18	2024-12-03 18:23:58
2311	38	86	3	2024-12-03 18:23:20	2024-12-03 18:24:00
2312	38	81	3	2024-12-03 18:23:23	2024-12-03 18:24:03
2313	38	82	3	2024-12-03 18:23:31	2024-12-03 18:24:12
2314	38	83	3	2024-12-03 18:23:33	2024-12-03 18:24:14
2315	38	84	3	2024-12-03 18:23:49	2024-12-03 18:24:29
2316	38	87	3	2024-12-03 18:23:58	2024-12-03 18:24:38
2317	38	86	3	2024-12-03 18:24:00	2024-12-03 18:24:40
2318	38	81	3	2024-12-03 18:24:03	2024-12-03 18:24:43
2319	38	82	3	2024-12-03 18:24:12	2024-12-03 18:24:52
2320	38	83	3	2024-12-03 18:24:14	2024-12-03 18:24:54
2321	38	84	3	2024-12-03 18:24:29	2024-12-03 18:25:10
2322	38	87	3	2024-12-03 18:24:38	2024-12-03 18:25:19
2323	38	86	3	2024-12-03 18:24:40	2024-12-03 18:25:21
2324	38	81	3	2024-12-03 18:24:43	2024-12-03 18:25:24
2325	38	82	3	2024-12-03 18:24:52	2024-12-03 18:25:33
2326	38	83	3	2024-12-03 18:24:54	2024-12-03 18:25:35
2327	38	84	3	2024-12-03 18:25:10	2024-12-03 18:25:51
2328	38	87	3	2024-12-03 18:25:19	2024-12-03 18:26:00
2329	38	86	3	2024-12-03 18:25:21	2024-12-03 18:26:02
2330	38	81	3	2024-12-03 18:25:24	2024-12-03 18:26:05
2331	38	82	3	2024-12-03 18:25:33	2024-12-03 18:26:14
2332	38	83	3	2024-12-03 18:25:35	2024-12-03 18:26:16
2333	38	84	3	2024-12-03 18:25:51	2024-12-03 18:26:32
2334	38	87	3	2024-12-03 18:26:00	2024-12-03 18:26:41
2335	38	86	3	2024-12-03 18:26:02	2024-12-03 18:26:43
2336	38	81	3	2024-12-03 18:26:05	2024-12-03 18:26:46
2337	38	82	3	2024-12-03 18:26:14	2024-12-03 18:26:55
2338	38	83	3	2024-12-03 18:26:16	2024-12-03 18:26:57
2339	38	84	3	2024-12-03 18:26:32	2024-12-03 18:27:13
2340	38	87	3	2024-12-03 18:26:41	2024-12-03 18:27:22
2341	38	86	3	2024-12-03 18:26:43	2024-12-03 18:27:24
2342	38	81	3	2024-12-03 18:26:46	2024-12-03 18:27:27
2343	38	82	3	2024-12-03 18:26:55	2024-12-03 18:27:36
2344	38	83	3	2024-12-03 18:26:57	2024-12-03 18:27:38
2345	38	84	3	2024-12-03 18:27:13	2024-12-03 18:27:54
2346	38	87	3	2024-12-03 18:27:22	2024-12-03 18:28:03
2347	38	86	3	2024-12-03 18:27:24	2024-12-03 18:28:05
2348	38	81	3	2024-12-03 18:27:27	2024-12-03 18:28:08
2349	38	82	3	2024-12-03 18:27:36	2024-12-03 18:28:17
2350	38	83	3	2024-12-03 18:27:38	2024-12-03 18:28:19
2351	38	84	3	2024-12-03 18:27:54	2024-12-03 18:28:35
2352	38	87	3	2024-12-03 18:28:03	2024-12-03 18:28:44
2353	38	86	3	2024-12-03 18:28:05	2024-12-03 18:28:46
2354	38	81	3	2024-12-03 18:28:08	2024-12-03 18:28:49
2355	38	82	3	2024-12-03 18:28:17	2024-12-03 18:28:58
2356	38	83	3	2024-12-03 18:28:19	2024-12-03 18:29:00
2357	38	84	3	2024-12-03 18:28:35	2024-12-03 18:29:16
2358	38	87	3	2024-12-03 18:28:44	2024-12-03 18:29:25
2359	38	86	3	2024-12-03 18:28:46	2024-12-03 18:29:27
2360	38	81	3	2024-12-03 18:28:49	2024-12-03 18:29:30
2361	38	82	3	2024-12-03 18:28:58	2024-12-03 18:29:39
2362	38	83	3	2024-12-03 18:29:00	2024-12-03 18:29:41
2363	38	84	3	2024-12-03 18:29:16	2024-12-03 18:29:57
2364	38	87	3	2024-12-03 18:29:25	2024-12-03 18:30:06
2365	38	86	3	2024-12-03 18:29:27	2024-12-03 18:30:07
2366	38	81	3	2024-12-03 18:29:30	2024-12-03 18:30:10
2367	38	82	3	2024-12-03 18:29:39	2024-12-03 18:30:19
2368	38	83	3	2024-12-03 18:29:41	2024-12-03 18:30:22
2369	38	84	3	2024-12-03 18:29:57	2024-12-03 18:30:37
2370	38	87	3	2024-12-03 18:30:06	2024-12-03 18:30:46
2371	38	86	3	2024-12-03 18:30:07	2024-12-03 18:30:48
2372	38	81	3	2024-12-03 18:30:10	2024-12-03 18:30:51
2373	38	82	3	2024-12-03 18:30:19	2024-12-03 18:31:00
2374	38	83	3	2024-12-03 18:30:22	2024-12-03 18:31:02
2375	38	84	3	2024-12-03 18:30:37	2024-12-03 18:31:18
2376	38	87	3	2024-12-03 18:30:46	2024-12-03 18:31:26
2377	38	86	3	2024-12-03 18:30:48	2024-12-03 18:31:28
2378	38	81	3	2024-12-03 18:30:51	2024-12-03 18:31:31
2379	38	82	3	2024-12-03 18:31:00	2024-12-03 18:31:40
2380	38	83	3	2024-12-03 18:31:02	2024-12-03 18:31:43
2381	38	84	3	2024-12-03 18:31:18	2024-12-03 18:31:58
2382	38	87	3	2024-12-03 18:31:26	2024-12-03 18:32:07
2383	38	86	3	2024-12-03 18:31:28	2024-12-03 18:32:08
2384	38	81	3	2024-12-03 18:31:31	2024-12-03 18:32:11
2385	38	82	3	2024-12-03 18:31:40	2024-12-03 18:32:20
2386	38	83	3	2024-12-03 18:31:43	2024-12-03 18:32:23
2387	38	84	3	2024-12-03 18:31:58	2024-12-03 18:32:38
2388	38	87	3	2024-12-03 18:32:07	2024-12-03 18:32:47
2389	38	86	3	2024-12-03 18:32:08	2024-12-03 18:32:49
2390	38	81	3	2024-12-03 18:32:11	2024-12-03 18:32:52
2391	38	82	3	2024-12-03 18:32:20	2024-12-03 18:33:01
2392	38	83	3	2024-12-03 18:32:23	2024-12-03 18:33:03
2393	38	84	3	2024-12-03 18:32:38	2024-12-03 18:33:19
2394	38	87	3	2024-12-03 18:32:47	2024-12-03 18:33:28
2395	38	86	3	2024-12-03 18:32:49	2024-12-03 18:33:29
2396	38	81	3	2024-12-03 18:32:52	2024-12-03 18:33:32
2397	38	82	3	2024-12-03 18:33:01	2024-12-03 18:33:41
2398	38	83	3	2024-12-03 18:33:03	2024-12-03 18:33:44
2399	38	84	3	2024-12-03 18:33:19	2024-12-03 18:33:59
2400	38	87	3	2024-12-03 18:33:28	2024-12-03 18:34:08
2401	38	86	3	2024-12-03 18:33:29	2024-12-03 18:34:09
2402	38	81	3	2024-12-03 18:33:32	2024-12-03 18:34:12
2403	38	82	3	2024-12-03 18:33:41	2024-12-03 18:34:21
2404	38	83	3	2024-12-03 18:33:44	2024-12-03 18:34:24
2405	38	84	3	2024-12-03 18:33:59	2024-12-03 18:34:39
2406	38	87	3	2024-12-03 18:34:08	2024-12-03 18:34:48
2407	38	86	3	2024-12-03 18:34:09	2024-12-03 18:34:50
2408	38	81	3	2024-12-03 18:34:12	2024-12-03 18:34:53
2414	38	81	3	2024-12-03 18:34:53	2024-12-03 18:35:33
2420	38	81	3	2024-12-03 18:35:33	2024-12-03 18:36:13
2426	38	81	3	2024-12-03 18:36:13	2024-12-03 18:36:54
2432	38	81	3	2024-12-03 18:36:54	2024-12-03 18:37:34
2438	38	81	3	2024-12-03 18:37:34	2024-12-03 18:38:14
4581	38	86	3	2024-12-03 22:18:33	2024-12-03 22:19:13
4588	38	86	3	2024-12-03 22:19:13	2024-12-03 22:19:53
4595	38	86	3	2024-12-03 22:19:53	2024-12-03 22:20:34
4602	38	86	3	2024-12-03 22:20:34	2024-12-03 22:21:14
4609	38	86	3	2024-12-03 22:21:14	2024-12-03 22:21:54
4616	38	86	3	2024-12-03 22:21:54	2024-12-03 22:22:35
4623	38	86	3	2024-12-03 22:22:35	2024-12-03 22:23:15
4630	38	86	3	2024-12-03 22:23:15	2024-12-03 22:23:55
4637	38	86	3	2024-12-03 22:23:55	2024-12-03 22:24:36
4644	38	86	3	2024-12-03 22:24:36	2024-12-03 22:25:16
4651	38	86	3	2024-12-03 22:25:16	2024-12-03 22:25:56
4658	38	86	3	2024-12-03 22:25:56	2024-12-03 22:26:37
4665	38	86	3	2024-12-03 22:26:37	2024-12-03 22:27:17
4672	38	86	3	2024-12-03 22:27:17	2024-12-03 22:27:57
4679	38	86	3	2024-12-03 22:27:57	2024-12-03 22:28:38
4686	38	86	3	2024-12-03 22:28:38	2024-12-03 22:29:19
4693	38	86	3	2024-12-03 22:29:19	2024-12-03 22:29:59
4700	38	86	3	2024-12-03 22:29:59	2024-12-03 22:30:40
4707	38	86	3	2024-12-03 22:30:40	2024-12-03 22:31:21
4714	38	86	3	2024-12-03 22:31:21	2024-12-03 22:32:02
4721	38	86	3	2024-12-03 22:32:02	2024-12-03 22:32:43
4728	38	86	3	2024-12-03 22:32:43	2024-12-03 22:33:23
4735	38	86	3	2024-12-03 22:33:23	2024-12-03 22:34:03
4742	38	86	3	2024-12-03 22:34:03	2024-12-03 22:34:44
4749	38	86	3	2024-12-03 22:34:44	2024-12-03 22:35:24
4756	38	86	3	2024-12-03 22:35:24	2024-12-03 22:36:04
4763	38	86	3	2024-12-03 22:36:04	2024-12-03 22:36:45
4770	38	86	3	2024-12-03 22:36:45	2024-12-03 22:37:25
4777	38	86	3	2024-12-03 22:37:25	2024-12-03 22:38:05
4784	38	86	3	2024-12-03 22:38:05	2024-12-03 22:38:46
4791	38	86	3	2024-12-03 22:38:46	2024-12-03 22:39:26
4798	38	86	3	2024-12-03 22:39:26	2024-12-03 22:40:06
4805	38	86	3	2024-12-03 22:40:06	2024-12-03 22:40:47
4812	38	86	3	2024-12-03 22:40:47	2024-12-03 22:41:27
5739	38	88	3	2024-12-04 00:09:51	2024-12-04 00:10:32
5746	38	88	3	2024-12-04 00:10:32	2024-12-04 00:11:12
5753	38	88	3	2024-12-04 00:11:12	2024-12-04 00:11:52
5760	38	88	3	2024-12-04 00:11:52	2024-12-04 00:12:33
5767	38	88	3	2024-12-04 00:12:33	2024-12-04 00:13:13
5774	38	88	3	2024-12-04 00:13:13	2024-12-04 00:13:53
5781	38	88	3	2024-12-04 00:13:53	2024-12-04 00:14:34
5788	38	88	3	2024-12-04 00:14:34	2024-12-04 00:15:14
5795	38	88	3	2024-12-04 00:15:14	2024-12-04 00:15:54
5802	38	88	3	2024-12-04 00:15:54	2024-12-04 00:16:35
5809	38	88	3	2024-12-04 00:16:35	2024-12-04 00:17:16
5816	38	88	3	2024-12-04 00:17:16	2024-12-04 00:17:57
5823	38	88	3	2024-12-04 00:17:57	2024-12-04 00:18:38
5830	38	88	3	2024-12-04 00:18:38	2024-12-04 00:19:19
5837	38	88	3	2024-12-04 00:19:19	2024-12-04 00:20:00
5844	38	88	3	2024-12-04 00:20:00	2024-12-04 00:20:41
5851	38	88	3	2024-12-04 00:20:41	2024-12-04 00:21:22
5858	38	88	3	2024-12-04 00:21:22	2024-12-04 00:22:03
5865	38	88	3	2024-12-04 00:22:03	2024-12-04 00:22:44
5872	38	88	3	2024-12-04 00:22:44	2024-12-04 00:23:24
5879	38	88	3	2024-12-04 00:23:24	2024-12-04 00:24:04
5886	38	88	3	2024-12-04 00:24:04	2024-12-04 00:24:45
5893	38	88	3	2024-12-04 00:24:45	2024-12-04 00:25:26
5900	38	88	3	2024-12-04 00:25:26	2024-12-04 00:26:07
5907	38	88	3	2024-12-04 00:26:07	2024-12-04 00:26:48
5914	38	88	3	2024-12-04 00:26:48	2024-12-04 00:27:29
5921	38	88	3	2024-12-04 00:27:29	2024-12-04 00:28:10
5928	38	88	3	2024-12-04 00:28:10	2024-12-04 00:28:50
5935	38	88	3	2024-12-04 00:28:50	2024-12-04 00:29:30
5942	38	88	3	2024-12-04 00:29:30	2024-12-04 00:30:11
5949	38	88	3	2024-12-04 00:30:11	2024-12-04 00:30:51
5956	38	88	3	2024-12-04 00:30:51	2024-12-04 00:31:31
5963	38	88	3	2024-12-04 00:31:31	2024-12-04 00:32:11
5970	38	88	3	2024-12-04 00:32:11	2024-12-04 00:32:52
5977	38	88	3	2024-12-04 00:32:52	2024-12-04 00:33:32
5984	38	88	3	2024-12-04 00:33:32	2024-12-04 00:34:12
5991	38	88	3	2024-12-04 00:34:12	2024-12-04 00:34:53
5998	38	88	3	2024-12-04 00:34:53	2024-12-04 00:35:33
6005	38	88	3	2024-12-04 00:35:33	2024-12-04 00:36:13
6012	38	88	3	2024-12-04 00:36:13	2024-12-04 00:36:54
6019	38	88	3	2024-12-04 00:36:54	2024-12-04 00:37:34
6026	38	88	3	2024-12-04 00:37:34	2024-12-04 00:38:14
6033	38	88	3	2024-12-04 00:38:14	2024-12-04 00:38:55
6040	38	88	3	2024-12-04 00:38:55	2024-12-04 00:39:35
2409	38	82	3	2024-12-03 18:34:21	2024-12-03 18:35:02
2415	38	82	3	2024-12-03 18:35:02	2024-12-03 18:35:42
2421	38	82	3	2024-12-03 18:35:42	2024-12-03 18:36:23
2427	38	82	3	2024-12-03 18:36:23	2024-12-03 18:37:03
2433	38	82	3	2024-12-03 18:37:03	2024-12-03 18:37:43
2439	38	82	3	2024-12-03 18:37:43	2024-12-03 18:38:24
4582	38	81	3	2024-12-03 22:18:34	2024-12-03 22:19:15
4589	38	81	3	2024-12-03 22:19:15	2024-12-03 22:19:55
4596	38	81	3	2024-12-03 22:19:55	2024-12-03 22:20:35
4603	38	81	3	2024-12-03 22:20:35	2024-12-03 22:21:16
4610	38	81	3	2024-12-03 22:21:16	2024-12-03 22:21:56
4617	38	81	3	2024-12-03 22:21:56	2024-12-03 22:22:36
4624	38	81	3	2024-12-03 22:22:36	2024-12-03 22:23:17
4631	38	81	3	2024-12-03 22:23:17	2024-12-03 22:23:57
4638	38	81	3	2024-12-03 22:23:57	2024-12-03 22:24:37
4645	38	81	3	2024-12-03 22:24:37	2024-12-03 22:25:17
4652	38	81	3	2024-12-03 22:25:17	2024-12-03 22:25:58
4659	38	81	3	2024-12-03 22:25:58	2024-12-03 22:26:38
4666	38	81	3	2024-12-03 22:26:38	2024-12-03 22:27:18
4673	38	81	3	2024-12-03 22:27:18	2024-12-03 22:27:59
4680	38	81	3	2024-12-03 22:27:59	2024-12-03 22:28:39
4687	38	81	3	2024-12-03 22:28:39	2024-12-03 22:29:20
4694	38	81	3	2024-12-03 22:29:20	2024-12-03 22:30:01
4701	38	81	3	2024-12-03 22:30:01	2024-12-03 22:30:42
4708	38	81	3	2024-12-03 22:30:42	2024-12-03 22:31:23
4715	38	81	3	2024-12-03 22:31:23	2024-12-03 22:32:04
4722	38	81	3	2024-12-03 22:32:04	2024-12-03 22:32:44
4729	38	81	3	2024-12-03 22:32:44	2024-12-03 22:33:24
4736	38	81	3	2024-12-03 22:33:24	2024-12-03 22:34:05
4743	38	81	3	2024-12-03 22:34:05	2024-12-03 22:34:45
4750	38	81	3	2024-12-03 22:34:45	2024-12-03 22:35:25
4757	38	81	3	2024-12-03 22:35:25	2024-12-03 22:36:06
4764	38	81	3	2024-12-03 22:36:06	2024-12-03 22:36:46
4771	38	81	3	2024-12-03 22:36:46	2024-12-03 22:37:26
4778	38	81	3	2024-12-03 22:37:26	2024-12-03 22:38:07
4785	38	81	3	2024-12-03 22:38:07	2024-12-03 22:38:47
4792	38	81	3	2024-12-03 22:38:47	2024-12-03 22:39:27
4799	38	81	3	2024-12-03 22:39:27	2024-12-03 22:40:08
4806	38	81	3	2024-12-03 22:40:08	2024-12-03 22:40:48
4813	38	81	3	2024-12-03 22:40:48	2024-12-03 22:41:28
5740	38	83	3	2024-12-04 00:09:55	2024-12-04 00:10:36
5747	38	83	3	2024-12-04 00:10:36	2024-12-04 00:11:16
5754	38	83	3	2024-12-04 00:11:16	2024-12-04 00:11:56
5761	38	83	3	2024-12-04 00:11:56	2024-12-04 00:12:37
5768	38	83	3	2024-12-04 00:12:37	2024-12-04 00:13:17
5775	38	83	3	2024-12-04 00:13:17	2024-12-04 00:13:57
5782	38	83	3	2024-12-04 00:13:57	2024-12-04 00:14:38
5789	38	83	3	2024-12-04 00:14:38	2024-12-04 00:15:18
5796	38	83	3	2024-12-04 00:15:18	2024-12-04 00:15:58
5803	38	83	3	2024-12-04 00:15:58	2024-12-04 00:16:39
5810	38	83	3	2024-12-04 00:16:39	2024-12-04 00:17:20
5817	38	83	3	2024-12-04 00:17:20	2024-12-04 00:18:01
5824	38	83	3	2024-12-04 00:18:01	2024-12-04 00:18:42
5831	38	83	3	2024-12-04 00:18:42	2024-12-04 00:19:23
5838	38	83	3	2024-12-04 00:19:23	2024-12-04 00:20:04
5845	38	83	3	2024-12-04 00:20:04	2024-12-04 00:20:45
5852	38	83	3	2024-12-04 00:20:45	2024-12-04 00:21:26
5859	38	83	3	2024-12-04 00:21:26	2024-12-04 00:22:07
5866	38	83	3	2024-12-04 00:22:07	2024-12-04 00:22:48
5873	38	83	3	2024-12-04 00:22:48	2024-12-04 00:23:29
5880	38	83	3	2024-12-04 00:23:29	2024-12-04 00:24:09
5887	38	83	3	2024-12-04 00:24:09	2024-12-04 00:24:50
5894	38	83	3	2024-12-04 00:24:50	2024-12-04 00:25:31
5901	38	83	3	2024-12-04 00:25:31	2024-12-04 00:26:12
5908	38	83	3	2024-12-04 00:26:12	2024-12-04 00:26:53
5915	38	83	3	2024-12-04 00:26:53	2024-12-04 00:27:34
5922	38	83	3	2024-12-04 00:27:34	2024-12-04 00:28:15
5929	38	83	3	2024-12-04 00:28:15	2024-12-04 00:28:55
5936	38	83	3	2024-12-04 00:28:55	2024-12-04 00:29:35
5943	38	83	3	2024-12-04 00:29:35	2024-12-04 00:30:16
5950	38	83	3	2024-12-04 00:30:16	2024-12-04 00:30:56
5957	38	83	3	2024-12-04 00:30:56	2024-12-04 00:31:36
5964	38	83	3	2024-12-04 00:31:36	2024-12-04 00:32:17
5971	38	83	3	2024-12-04 00:32:17	2024-12-04 00:32:57
5978	38	83	3	2024-12-04 00:32:57	2024-12-04 00:33:37
5985	38	83	3	2024-12-04 00:33:37	2024-12-04 00:34:18
5992	38	83	3	2024-12-04 00:34:18	2024-12-04 00:34:58
5999	38	83	3	2024-12-04 00:34:58	2024-12-04 00:35:38
6006	38	83	3	2024-12-04 00:35:38	2024-12-04 00:36:19
6013	38	83	3	2024-12-04 00:36:19	2024-12-04 00:36:59
6020	38	83	3	2024-12-04 00:36:59	2024-12-04 00:37:39
6027	38	83	3	2024-12-04 00:37:39	2024-12-04 00:38:19
6034	38	83	3	2024-12-04 00:38:19	2024-12-04 00:39:00
6041	38	83	3	2024-12-04 00:39:00	2024-12-04 00:39:40
2410	38	83	3	2024-12-03 18:34:24	2024-12-03 18:35:04
2416	38	83	3	2024-12-03 18:35:04	2024-12-03 18:35:45
2422	38	83	3	2024-12-03 18:35:45	2024-12-03 18:36:25
2428	38	83	3	2024-12-03 18:36:25	2024-12-03 18:37:06
2434	38	83	3	2024-12-03 18:37:06	2024-12-03 18:37:46
2440	38	83	3	2024-12-03 18:37:46	2024-12-03 18:38:26
4580	38	87	3	2024-12-03 22:18:32	2024-12-03 22:19:13
4587	38	87	3	2024-12-03 22:19:13	2024-12-03 22:19:53
4594	38	87	3	2024-12-03 22:19:53	2024-12-03 22:20:33
4601	38	87	3	2024-12-03 22:20:33	2024-12-03 22:21:14
4608	38	87	3	2024-12-03 22:21:14	2024-12-03 22:21:54
4615	38	87	3	2024-12-03 22:21:54	2024-12-03 22:22:34
4622	38	87	3	2024-12-03 22:22:34	2024-12-03 22:23:15
4629	38	87	3	2024-12-03 22:23:15	2024-12-03 22:23:55
4636	38	87	3	2024-12-03 22:23:55	2024-12-03 22:24:35
4643	38	87	3	2024-12-03 22:24:35	2024-12-03 22:25:16
4650	38	87	3	2024-12-03 22:25:16	2024-12-03 22:25:56
4657	38	87	3	2024-12-03 22:25:56	2024-12-03 22:26:36
4664	38	87	3	2024-12-03 22:26:36	2024-12-03 22:27:16
4671	38	87	3	2024-12-03 22:27:16	2024-12-03 22:27:57
4678	38	87	3	2024-12-03 22:27:57	2024-12-03 22:28:37
4685	38	87	3	2024-12-03 22:28:37	2024-12-03 22:29:18
4692	38	87	3	2024-12-03 22:29:18	2024-12-03 22:29:59
4699	38	87	3	2024-12-03 22:29:59	2024-12-03 22:30:40
4706	38	87	3	2024-12-03 22:30:40	2024-12-03 22:31:21
4713	38	87	3	2024-12-03 22:31:21	2024-12-03 22:32:02
4720	38	87	3	2024-12-03 22:32:02	2024-12-03 22:32:42
4727	38	87	3	2024-12-03 22:32:42	2024-12-03 22:33:23
4734	38	87	3	2024-12-03 22:33:23	2024-12-03 22:34:03
4741	38	87	3	2024-12-03 22:34:03	2024-12-03 22:34:43
4748	38	87	3	2024-12-03 22:34:43	2024-12-03 22:35:23
4755	38	87	3	2024-12-03 22:35:24	2024-12-03 22:36:04
4762	38	87	3	2024-12-03 22:36:04	2024-12-03 22:36:44
4769	38	87	3	2024-12-03 22:36:44	2024-12-03 22:37:24
4776	38	87	3	2024-12-03 22:37:24	2024-12-03 22:38:05
4783	38	87	3	2024-12-03 22:38:05	2024-12-03 22:38:45
4790	38	87	3	2024-12-03 22:38:45	2024-12-03 22:39:25
4797	38	87	3	2024-12-03 22:39:25	2024-12-03 22:40:06
4804	38	87	3	2024-12-03 22:40:06	2024-12-03 22:40:46
4811	38	87	3	2024-12-03 22:40:46	2024-12-03 22:41:26
5738	38	82	3	2024-12-04 00:09:48	2024-12-04 00:10:28
5745	38	82	3	2024-12-04 00:10:28	2024-12-04 00:11:09
5752	38	82	3	2024-12-04 00:11:09	2024-12-04 00:11:49
5759	38	82	3	2024-12-04 00:11:49	2024-12-04 00:12:29
5766	38	82	3	2024-12-04 00:12:29	2024-12-04 00:13:09
5773	38	82	3	2024-12-04 00:13:09	2024-12-04 00:13:50
5780	38	82	3	2024-12-04 00:13:50	2024-12-04 00:14:30
5787	38	82	3	2024-12-04 00:14:30	2024-12-04 00:15:10
5794	38	82	3	2024-12-04 00:15:10	2024-12-04 00:15:51
5801	38	82	3	2024-12-04 00:15:51	2024-12-04 00:16:32
5808	38	82	3	2024-12-04 00:16:32	2024-12-04 00:17:13
5815	38	82	3	2024-12-04 00:17:13	2024-12-04 00:17:54
5822	38	82	3	2024-12-04 00:17:54	2024-12-04 00:18:35
5829	38	82	3	2024-12-04 00:18:35	2024-12-04 00:19:16
5836	38	82	3	2024-12-04 00:19:16	2024-12-04 00:19:57
5843	38	82	3	2024-12-04 00:19:57	2024-12-04 00:20:38
5850	38	82	3	2024-12-04 00:20:38	2024-12-04 00:21:19
5857	38	82	3	2024-12-04 00:21:19	2024-12-04 00:22:00
5864	38	82	3	2024-12-04 00:22:00	2024-12-04 00:22:41
5871	38	82	3	2024-12-04 00:22:41	2024-12-04 00:23:21
5878	38	82	3	2024-12-04 00:23:21	2024-12-04 00:24:02
5885	38	82	3	2024-12-04 00:24:02	2024-12-04 00:24:43
5892	38	82	3	2024-12-04 00:24:43	2024-12-04 00:25:23
5899	38	82	3	2024-12-04 00:25:23	2024-12-04 00:26:04
5906	38	82	3	2024-12-04 00:26:04	2024-12-04 00:26:45
5913	38	82	3	2024-12-04 00:26:45	2024-12-04 00:27:26
5920	38	82	3	2024-12-04 00:27:26	2024-12-04 00:28:07
5927	38	82	3	2024-12-04 00:28:07	2024-12-04 00:28:47
5934	38	82	3	2024-12-04 00:28:47	2024-12-04 00:29:27
5941	38	82	3	2024-12-04 00:29:27	2024-12-04 00:30:08
5948	38	82	3	2024-12-04 00:30:08	2024-12-04 00:30:48
5955	38	82	3	2024-12-04 00:30:48	2024-12-04 00:31:28
5962	38	82	3	2024-12-04 00:31:28	2024-12-04 00:32:09
5969	38	82	3	2024-12-04 00:32:09	2024-12-04 00:32:49
5976	38	82	3	2024-12-04 00:32:49	2024-12-04 00:33:29
5983	38	82	3	2024-12-04 00:33:29	2024-12-04 00:34:10
5990	38	82	3	2024-12-04 00:34:10	2024-12-04 00:34:50
5997	38	82	3	2024-12-04 00:34:50	2024-12-04 00:35:30
6004	38	82	3	2024-12-04 00:35:30	2024-12-04 00:36:11
6011	38	82	3	2024-12-04 00:36:11	2024-12-04 00:36:51
6018	38	82	3	2024-12-04 00:36:51	2024-12-04 00:37:31
6025	38	82	3	2024-12-04 00:37:31	2024-12-04 00:38:12
6032	38	82	3	2024-12-04 00:38:12	2024-12-04 00:38:52
6039	38	82	3	2024-12-04 00:38:52	2024-12-04 00:39:32
6046	38	82	3	2024-12-04 00:39:32	2024-12-04 00:40:13
2411	38	84	3	2024-12-03 18:34:39	2024-12-03 18:35:20
2417	38	84	3	2024-12-03 18:35:20	2024-12-03 18:36:00
2423	38	84	3	2024-12-03 18:36:00	2024-12-03 18:36:41
2429	38	84	3	2024-12-03 18:36:41	2024-12-03 18:37:21
2435	38	84	3	2024-12-03 18:37:21	2024-12-03 18:38:01
2441	38	84	3	2024-12-03 18:38:01	2024-12-03 18:38:42
6047	38	88	3	2024-12-04 00:39:35	2024-12-04 00:40:15
6054	38	88	3	2024-12-04 00:40:15	2024-12-04 00:40:56
6061	38	88	3	2024-12-04 00:40:56	2024-12-04 00:41:36
6068	38	88	3	2024-12-04 00:41:36	2024-12-04 00:42:16
6075	38	88	3	2024-12-04 00:42:16	2024-12-04 00:42:57
6082	38	88	3	2024-12-04 00:42:57	2024-12-04 00:43:37
6089	38	88	3	2024-12-04 00:43:37	2024-12-04 00:44:17
6096	38	88	3	2024-12-04 00:44:17	2024-12-04 00:44:58
6103	38	88	3	2024-12-04 00:44:58	2024-12-04 00:45:38
6110	38	88	3	2024-12-04 00:45:38	2024-12-04 00:46:18
6117	38	88	3	2024-12-04 00:46:18	2024-12-04 00:46:59
6124	38	88	3	2024-12-04 00:46:59	2024-12-04 00:47:39
6131	38	88	3	2024-12-04 00:47:39	2024-12-04 00:48:19
6138	38	88	3	2024-12-04 00:48:19	2024-12-04 00:49:00
6145	38	88	3	2024-12-04 00:49:00	2024-12-04 00:49:40
6152	38	88	3	2024-12-04 00:49:40	2024-12-04 00:50:21
6159	38	88	3	2024-12-04 00:50:21	2024-12-04 00:51:02
6166	38	88	3	2024-12-04 00:51:02	2024-12-04 00:51:43
6173	38	88	3	2024-12-04 00:51:43	2024-12-04 00:52:24
6180	38	88	3	2024-12-04 00:52:24	2024-12-04 00:53:05
6187	38	88	3	2024-12-04 00:53:05	2024-12-04 00:53:45
6194	38	88	3	2024-12-04 00:53:45	2024-12-04 00:54:25
6201	38	88	3	2024-12-04 00:54:25	2024-12-04 00:55:06
6208	38	88	3	2024-12-04 00:55:06	2024-12-04 00:55:46
6215	38	88	3	2024-12-04 00:55:46	2024-12-04 00:56:26
6222	38	88	3	2024-12-04 00:56:26	2024-12-04 00:57:07
6229	38	88	3	2024-12-04 00:57:07	2024-12-04 00:57:47
6236	38	88	3	2024-12-04 00:57:47	2024-12-04 00:58:27
6243	38	88	3	2024-12-04 00:58:27	2024-12-04 00:59:07
6250	38	88	3	2024-12-04 00:59:07	2024-12-04 00:59:48
6257	38	88	3	2024-12-04 00:59:48	2024-12-04 01:00:28
6264	38	88	3	2024-12-04 01:00:28	2024-12-04 01:01:08
6271	38	88	3	2024-12-04 01:01:08	2024-12-04 01:01:49
6278	38	88	3	2024-12-04 01:01:49	2024-12-04 01:02:29
6285	38	88	3	2024-12-04 01:02:29	2024-12-04 01:03:09
6292	38	88	3	2024-12-04 01:03:09	2024-12-04 01:03:50
6299	38	88	3	2024-12-04 01:03:50	2024-12-04 01:04:30
6306	38	88	3	2024-12-04 01:04:30	2024-12-04 01:05:10
6313	38	88	3	2024-12-04 01:05:10	2024-12-04 01:05:51
6320	38	88	3	2024-12-04 01:05:51	2024-12-04 01:06:31
6327	38	88	3	2024-12-04 01:06:31	2024-12-04 01:07:11
6334	38	88	3	2024-12-04 01:07:11	2024-12-04 01:07:52
6341	38	88	3	2024-12-04 01:07:52	2024-12-04 01:08:32
6348	38	88	3	2024-12-04 01:08:32	2024-12-04 01:09:12
6355	38	88	3	2024-12-04 01:09:12	2024-12-04 01:09:53
6362	38	88	3	2024-12-04 01:09:53	2024-12-04 01:10:33
6369	38	88	3	2024-12-04 01:10:33	2024-12-04 01:11:13
6376	38	88	3	2024-12-04 01:11:13	2024-12-04 01:11:54
2412	38	87	3	2024-12-03 18:34:48	2024-12-03 18:35:29
2418	38	87	3	2024-12-03 18:35:29	2024-12-03 18:36:09
2424	38	87	3	2024-12-03 18:36:09	2024-12-03 18:36:49
2430	38	87	3	2024-12-03 18:36:49	2024-12-03 18:37:30
2436	38	87	3	2024-12-03 18:37:30	2024-12-03 18:38:10
6048	38	83	3	2024-12-04 00:39:40	2024-12-04 00:40:20
6055	38	83	3	2024-12-04 00:40:20	2024-12-04 00:41:01
6062	38	83	3	2024-12-04 00:41:01	2024-12-04 00:41:41
6069	38	83	3	2024-12-04 00:41:41	2024-12-04 00:42:21
6076	38	83	3	2024-12-04 00:42:21	2024-12-04 00:43:02
6083	38	83	3	2024-12-04 00:43:02	2024-12-04 00:43:42
6090	38	83	3	2024-12-04 00:43:42	2024-12-04 00:44:22
6097	38	83	3	2024-12-04 00:44:22	2024-12-04 00:45:03
6104	38	83	3	2024-12-04 00:45:03	2024-12-04 00:45:43
6111	38	83	3	2024-12-04 00:45:43	2024-12-04 00:46:23
6118	38	83	3	2024-12-04 00:46:23	2024-12-04 00:47:04
6125	38	83	3	2024-12-04 00:47:04	2024-12-04 00:47:44
6132	38	83	3	2024-12-04 00:47:44	2024-12-04 00:48:24
6139	38	83	3	2024-12-04 00:48:24	2024-12-04 00:49:05
6146	38	83	3	2024-12-04 00:49:05	2024-12-04 00:49:45
6153	38	83	3	2024-12-04 00:49:45	2024-12-04 00:50:26
6160	38	83	3	2024-12-04 00:50:26	2024-12-04 00:51:07
6167	38	83	3	2024-12-04 00:51:07	2024-12-04 00:51:48
6174	38	83	3	2024-12-04 00:51:48	2024-12-04 00:52:29
6181	38	83	3	2024-12-04 00:52:29	2024-12-04 00:53:10
6188	38	83	3	2024-12-04 00:53:10	2024-12-04 00:53:50
6195	38	83	3	2024-12-04 00:53:50	2024-12-04 00:54:31
6202	38	83	3	2024-12-04 00:54:31	2024-12-04 00:55:11
6209	38	83	3	2024-12-04 00:55:11	2024-12-04 00:55:51
6216	38	83	3	2024-12-04 00:55:51	2024-12-04 00:56:32
6223	38	83	3	2024-12-04 00:56:32	2024-12-04 00:57:12
6230	38	83	3	2024-12-04 00:57:12	2024-12-04 00:57:52
6237	38	83	3	2024-12-04 00:57:52	2024-12-04 00:58:33
6244	38	83	3	2024-12-04 00:58:33	2024-12-04 00:59:13
6251	38	83	3	2024-12-04 00:59:13	2024-12-04 00:59:53
6258	38	83	3	2024-12-04 00:59:53	2024-12-04 01:00:33
6265	38	83	3	2024-12-04 01:00:33	2024-12-04 01:01:14
6272	38	83	3	2024-12-04 01:01:14	2024-12-04 01:01:54
6279	38	83	3	2024-12-04 01:01:54	2024-12-04 01:02:35
6286	38	83	3	2024-12-04 01:02:35	2024-12-04 01:03:15
6293	38	83	3	2024-12-04 01:03:15	2024-12-04 01:03:55
6300	38	83	3	2024-12-04 01:03:55	2024-12-04 01:04:35
6307	38	83	3	2024-12-04 01:04:35	2024-12-04 01:05:16
6314	38	83	3	2024-12-04 01:05:16	2024-12-04 01:05:56
6321	38	83	3	2024-12-04 01:05:56	2024-12-04 01:06:36
6328	38	83	3	2024-12-04 01:06:36	2024-12-04 01:07:17
6335	38	83	3	2024-12-04 01:07:17	2024-12-04 01:07:57
6342	38	83	3	2024-12-04 01:07:57	2024-12-04 01:08:37
6349	38	83	3	2024-12-04 01:08:37	2024-12-04 01:09:18
6356	38	83	3	2024-12-04 01:09:18	2024-12-04 01:09:58
6363	38	83	3	2024-12-04 01:09:58	2024-12-04 01:10:38
6370	38	83	3	2024-12-04 01:10:38	2024-12-04 01:11:19
6377	38	83	3	2024-12-04 01:11:19	2024-12-04 01:12:00
2413	38	86	3	2024-12-03 18:34:50	2024-12-03 18:35:30
2419	38	86	3	2024-12-03 18:35:30	2024-12-03 18:36:11
2425	38	86	3	2024-12-03 18:36:11	2024-12-03 18:36:51
2431	38	86	3	2024-12-03 18:36:51	2024-12-03 18:37:31
2437	38	86	3	2024-12-03 18:37:31	2024-12-03 18:38:12
2442	38	87	3	2024-12-03 18:38:10	2024-12-03 18:38:50
2443	38	86	3	2024-12-03 18:38:12	2024-12-03 18:38:52
2444	38	81	3	2024-12-03 18:38:14	2024-12-03 18:38:55
2445	38	82	3	2024-12-03 18:38:24	2024-12-03 18:39:04
2446	38	83	3	2024-12-03 18:38:26	2024-12-03 18:39:07
2447	38	84	3	2024-12-03 18:38:42	2024-12-03 18:39:22
2448	38	87	3	2024-12-03 18:38:50	2024-12-03 18:39:31
2449	38	86	3	2024-12-03 18:38:52	2024-12-03 18:39:32
2450	38	81	3	2024-12-03 18:38:55	2024-12-03 18:39:35
2451	38	82	3	2024-12-03 18:39:04	2024-12-03 18:39:44
2452	38	83	3	2024-12-03 18:39:07	2024-12-03 18:39:47
2453	38	84	3	2024-12-03 18:39:22	2024-12-03 18:40:02
2454	38	87	3	2024-12-03 18:39:31	2024-12-03 18:40:11
2455	38	86	3	2024-12-03 18:39:32	2024-12-03 18:40:13
2456	38	81	3	2024-12-03 18:39:35	2024-12-03 18:40:15
2457	38	82	3	2024-12-03 18:39:44	2024-12-03 18:40:25
2458	38	83	3	2024-12-03 18:39:47	2024-12-03 18:40:27
2459	38	84	3	2024-12-03 18:40:02	2024-12-03 18:40:43
2460	38	87	3	2024-12-03 18:40:11	2024-12-03 18:40:51
2461	38	86	3	2024-12-03 18:40:13	2024-12-03 18:40:53
2462	38	81	3	2024-12-03 18:40:15	2024-12-03 18:40:56
2463	38	82	3	2024-12-03 18:40:25	2024-12-03 18:41:05
2464	38	83	3	2024-12-03 18:40:27	2024-12-03 18:41:08
2465	38	84	3	2024-12-03 18:40:43	2024-12-03 18:41:23
2466	38	87	3	2024-12-03 18:40:51	2024-12-03 18:41:32
2467	38	86	3	2024-12-03 18:40:53	2024-12-03 18:41:33
2468	38	81	3	2024-12-03 18:40:56	2024-12-03 18:41:36
2469	38	82	3	2024-12-03 18:41:05	2024-12-03 18:41:45
2470	38	83	3	2024-12-03 18:41:08	2024-12-03 18:41:48
2471	38	84	3	2024-12-03 18:41:23	2024-12-03 18:42:03
2472	38	87	3	2024-12-03 18:41:32	2024-12-03 18:42:12
2473	38	86	3	2024-12-03 18:41:33	2024-12-03 18:42:14
2474	38	81	3	2024-12-03 18:41:36	2024-12-03 18:42:16
2475	38	82	3	2024-12-03 18:41:45	2024-12-03 18:42:26
2476	38	83	3	2024-12-03 18:41:48	2024-12-03 18:42:28
2477	38	84	3	2024-12-03 18:42:03	2024-12-03 18:42:44
2478	38	87	3	2024-12-03 18:42:12	2024-12-03 18:42:52
2479	38	86	3	2024-12-03 18:42:14	2024-12-03 18:42:54
2480	38	81	3	2024-12-03 18:42:16	2024-12-03 18:42:57
2481	38	82	3	2024-12-03 18:42:26	2024-12-03 18:43:06
2482	38	83	3	2024-12-03 18:42:28	2024-12-03 18:43:09
2483	38	84	3	2024-12-03 18:42:44	2024-12-03 18:43:24
2484	38	87	3	2024-12-03 18:42:52	2024-12-03 18:43:33
2485	38	86	3	2024-12-03 18:42:54	2024-12-03 18:43:34
2486	38	81	3	2024-12-03 18:42:57	2024-12-03 18:43:37
2487	38	82	3	2024-12-03 18:43:06	2024-12-03 18:43:46
2488	38	83	3	2024-12-03 18:43:09	2024-12-03 18:43:49
2489	38	84	3	2024-12-03 18:43:24	2024-12-03 18:44:05
2490	38	87	3	2024-12-03 18:43:33	2024-12-03 18:44:13
2491	38	86	3	2024-12-03 18:43:34	2024-12-03 18:44:15
2492	38	81	3	2024-12-03 18:43:37	2024-12-03 18:44:17
2493	38	82	3	2024-12-03 18:43:46	2024-12-03 18:44:27
2494	38	83	3	2024-12-03 18:43:49	2024-12-03 18:44:29
2495	38	84	3	2024-12-03 18:44:05	2024-12-03 18:44:45
2496	38	87	3	2024-12-03 18:44:13	2024-12-03 18:44:53
2497	38	86	3	2024-12-03 18:44:15	2024-12-03 18:44:55
2498	38	81	3	2024-12-03 18:44:17	2024-12-03 18:44:58
2499	38	82	3	2024-12-03 18:44:27	2024-12-03 18:45:07
2500	38	83	3	2024-12-03 18:44:29	2024-12-03 18:45:10
2501	38	84	3	2024-12-03 18:44:45	2024-12-03 18:45:25
2502	38	87	3	2024-12-03 18:44:53	2024-12-03 18:45:34
2503	38	86	3	2024-12-03 18:44:55	2024-12-03 18:45:35
2504	38	81	3	2024-12-03 18:44:58	2024-12-03 18:45:38
2505	38	82	3	2024-12-03 18:45:07	2024-12-03 18:45:47
2506	38	83	3	2024-12-03 18:45:10	2024-12-03 18:45:50
2507	38	84	3	2024-12-03 18:45:25	2024-12-03 18:46:06
2508	38	87	3	2024-12-03 18:45:34	2024-12-03 18:46:14
2509	38	86	3	2024-12-03 18:45:35	2024-12-03 18:46:16
2510	38	81	3	2024-12-03 18:45:38	2024-12-03 18:46:20
2511	38	82	3	2024-12-03 18:45:47	2024-12-03 18:46:28
2512	38	83	3	2024-12-03 18:45:50	2024-12-03 18:46:30
2513	38	84	3	2024-12-03 18:46:06	2024-12-03 18:46:46
2514	38	87	3	2024-12-03 18:46:14	2024-12-03 18:46:54
2515	38	86	3	2024-12-03 18:46:16	2024-12-03 18:46:56
2516	38	81	3	2024-12-03 18:46:20	2024-12-03 18:47:01
2517	38	82	3	2024-12-03 18:46:28	2024-12-03 18:47:08
2518	38	83	3	2024-12-03 18:46:30	2024-12-03 18:47:11
2519	38	84	3	2024-12-03 18:46:46	2024-12-03 18:47:26
2520	38	87	3	2024-12-03 18:46:54	2024-12-03 18:47:35
2521	38	86	3	2024-12-03 18:46:56	2024-12-03 18:47:37
2522	38	81	3	2024-12-03 18:47:01	2024-12-03 18:47:41
2523	38	82	3	2024-12-03 18:47:08	2024-12-03 18:47:49
2524	38	83	3	2024-12-03 18:47:11	2024-12-03 18:47:51
2525	38	84	3	2024-12-03 18:47:26	2024-12-03 18:48:07
2526	38	87	3	2024-12-03 18:47:35	2024-12-03 18:48:16
2527	38	86	3	2024-12-03 18:47:37	2024-12-03 18:48:17
2528	38	81	3	2024-12-03 18:47:41	2024-12-03 18:48:22
2529	38	82	3	2024-12-03 18:47:49	2024-12-03 18:48:30
2530	38	83	3	2024-12-03 18:47:51	2024-12-03 18:48:32
2531	38	84	3	2024-12-03 18:48:07	2024-12-03 18:48:48
2532	38	87	3	2024-12-03 18:48:16	2024-12-03 18:48:57
2533	38	86	3	2024-12-03 18:48:17	2024-12-03 18:48:58
2534	38	81	3	2024-12-03 18:48:22	2024-12-03 18:49:03
2535	38	82	3	2024-12-03 18:48:30	2024-12-03 18:49:10
2536	38	83	3	2024-12-03 18:48:32	2024-12-03 18:49:13
2537	38	84	3	2024-12-03 18:48:48	2024-12-03 18:49:29
2538	38	87	3	2024-12-03 18:48:57	2024-12-03 18:49:37
2539	38	86	3	2024-12-03 18:48:58	2024-12-03 18:49:39
2540	38	81	3	2024-12-03 18:49:03	2024-12-03 18:49:44
2541	38	82	3	2024-12-03 18:49:10	2024-12-03 18:49:51
2542	38	83	3	2024-12-03 18:49:13	2024-12-03 18:49:55
2543	38	84	3	2024-12-03 18:49:29	2024-12-03 18:50:10
2544	38	87	3	2024-12-03 18:49:38	2024-12-03 18:50:18
2545	38	86	3	2024-12-03 18:49:39	2024-12-03 18:50:20
2546	38	81	3	2024-12-03 18:49:44	2024-12-03 18:50:25
2547	38	82	3	2024-12-03 18:49:51	2024-12-03 18:50:32
2548	38	83	3	2024-12-03 18:49:55	2024-12-03 18:50:36
2549	38	84	3	2024-12-03 18:50:10	2024-12-03 18:50:51
2555	38	84	3	2024-12-03 18:50:51	2024-12-03 18:51:32
2561	38	84	3	2024-12-03 18:51:32	2024-12-03 18:52:13
2567	38	84	3	2024-12-03 18:52:13	2024-12-03 18:52:54
2573	38	84	3	2024-12-03 18:52:54	2024-12-03 18:53:34
2579	38	84	3	2024-12-03 18:53:34	2024-12-03 18:54:14
2585	38	84	3	2024-12-03 18:54:14	2024-12-03 18:54:55
2591	38	84	3	2024-12-03 18:54:55	2024-12-03 18:55:35
6050	38	87	3	2024-12-04 00:40:00	2024-12-04 00:40:40
6057	38	87	3	2024-12-04 00:40:40	2024-12-04 00:41:20
6064	38	87	3	2024-12-04 00:41:20	2024-12-04 00:42:01
6071	38	87	3	2024-12-04 00:42:01	2024-12-04 00:42:41
6078	38	87	3	2024-12-04 00:42:41	2024-12-04 00:43:21
6085	38	87	3	2024-12-04 00:43:21	2024-12-04 00:44:02
6092	38	87	3	2024-12-04 00:44:02	2024-12-04 00:44:42
6099	38	87	3	2024-12-04 00:44:42	2024-12-04 00:45:22
6106	38	87	3	2024-12-04 00:45:22	2024-12-04 00:46:03
6113	38	87	3	2024-12-04 00:46:03	2024-12-04 00:46:43
6120	38	87	3	2024-12-04 00:46:43	2024-12-04 00:47:23
6127	38	87	3	2024-12-04 00:47:23	2024-12-04 00:48:04
6134	38	87	3	2024-12-04 00:48:04	2024-12-04 00:48:44
6141	38	87	3	2024-12-04 00:48:44	2024-12-04 00:49:24
6148	38	87	3	2024-12-04 00:49:24	2024-12-04 00:50:05
6155	38	87	3	2024-12-04 00:50:05	2024-12-04 00:50:45
6162	38	87	3	2024-12-04 00:50:45	2024-12-04 00:51:26
6169	38	87	3	2024-12-04 00:51:26	2024-12-04 00:52:07
6176	38	87	3	2024-12-04 00:52:07	2024-12-04 00:52:48
6183	38	87	3	2024-12-04 00:52:48	2024-12-04 00:53:29
6190	38	87	3	2024-12-04 00:53:29	2024-12-04 00:54:10
6197	38	87	3	2024-12-04 00:54:10	2024-12-04 00:54:50
6204	38	87	3	2024-12-04 00:54:50	2024-12-04 00:55:30
6211	38	87	3	2024-12-04 00:55:30	2024-12-04 00:56:11
6218	38	87	3	2024-12-04 00:56:11	2024-12-04 00:56:51
6225	38	87	3	2024-12-04 00:56:51	2024-12-04 00:57:31
6232	38	87	3	2024-12-04 00:57:31	2024-12-04 00:58:12
6239	38	87	3	2024-12-04 00:58:12	2024-12-04 00:58:52
6246	38	87	3	2024-12-04 00:58:52	2024-12-04 00:59:32
6253	38	87	3	2024-12-04 00:59:32	2024-12-04 01:00:13
6260	38	87	3	2024-12-04 01:00:13	2024-12-04 01:00:53
6267	38	87	3	2024-12-04 01:00:53	2024-12-04 01:01:33
6274	38	87	3	2024-12-04 01:01:33	2024-12-04 01:02:14
6281	38	87	3	2024-12-04 01:02:14	2024-12-04 01:02:54
6288	38	87	3	2024-12-04 01:02:54	2024-12-04 01:03:34
6295	38	87	3	2024-12-04 01:03:34	2024-12-04 01:04:15
6302	38	87	3	2024-12-04 01:04:15	2024-12-04 01:04:55
6309	38	87	3	2024-12-04 01:04:55	2024-12-04 01:05:35
6316	38	87	3	2024-12-04 01:05:35	2024-12-04 01:06:16
6323	38	87	3	2024-12-04 01:06:16	2024-12-04 01:06:56
6330	38	87	3	2024-12-04 01:06:56	2024-12-04 01:07:37
6337	38	87	3	2024-12-04 01:07:37	2024-12-04 01:08:17
6344	38	87	3	2024-12-04 01:08:17	2024-12-04 01:08:57
6351	38	87	3	2024-12-04 01:08:57	2024-12-04 01:09:38
6358	38	87	3	2024-12-04 01:09:38	2024-12-04 01:10:18
6365	38	87	3	2024-12-04 01:10:18	2024-12-04 01:10:58
6372	38	87	3	2024-12-04 01:10:58	2024-12-04 01:11:39
6379	38	87	3	2024-12-04 01:11:39	2024-12-04 01:12:20
2550	38	87	3	2024-12-03 18:50:18	2024-12-03 18:50:59
2556	38	87	3	2024-12-03 18:50:59	2024-12-03 18:51:40
2562	38	87	3	2024-12-03 18:51:40	2024-12-03 18:52:21
2568	38	87	3	2024-12-03 18:52:21	2024-12-03 18:53:02
2574	38	87	3	2024-12-03 18:53:02	2024-12-03 18:53:42
2580	38	87	3	2024-12-03 18:53:42	2024-12-03 18:54:23
2586	38	87	3	2024-12-03 18:54:23	2024-12-03 18:55:03
2592	38	87	3	2024-12-03 18:55:03	2024-12-03 18:55:43
6051	38	86	3	2024-12-04 00:40:01	2024-12-04 00:40:42
6058	38	86	3	2024-12-04 00:40:42	2024-12-04 00:41:22
6065	38	86	3	2024-12-04 00:41:22	2024-12-04 00:42:03
6072	38	86	3	2024-12-04 00:42:03	2024-12-04 00:42:43
6079	38	86	3	2024-12-04 00:42:43	2024-12-04 00:43:23
6086	38	86	3	2024-12-04 00:43:23	2024-12-04 00:44:04
6093	38	86	3	2024-12-04 00:44:04	2024-12-04 00:44:44
6100	38	86	3	2024-12-04 00:44:44	2024-12-04 00:45:24
6107	38	86	3	2024-12-04 00:45:24	2024-12-04 00:46:05
6114	38	86	3	2024-12-04 00:46:05	2024-12-04 00:46:45
6121	38	86	3	2024-12-04 00:46:45	2024-12-04 00:47:25
6128	38	86	3	2024-12-04 00:47:25	2024-12-04 00:48:06
6135	38	86	3	2024-12-04 00:48:06	2024-12-04 00:48:46
6142	38	86	3	2024-12-04 00:48:46	2024-12-04 00:49:27
6149	38	86	3	2024-12-04 00:49:27	2024-12-04 00:50:07
6156	38	86	3	2024-12-04 00:50:07	2024-12-04 00:50:48
6163	38	86	3	2024-12-04 00:50:48	2024-12-04 00:51:29
6170	38	86	3	2024-12-04 00:51:29	2024-12-04 00:52:10
6177	38	86	3	2024-12-04 00:52:10	2024-12-04 00:52:51
6184	38	86	3	2024-12-04 00:52:51	2024-12-04 00:53:32
6191	38	86	3	2024-12-04 00:53:32	2024-12-04 00:54:13
6198	38	86	3	2024-12-04 00:54:13	2024-12-04 00:54:53
6205	38	86	3	2024-12-04 00:54:53	2024-12-04 00:55:33
6212	38	86	3	2024-12-04 00:55:33	2024-12-04 00:56:14
6219	38	86	3	2024-12-04 00:56:14	2024-12-04 00:56:54
6226	38	86	3	2024-12-04 00:56:54	2024-12-04 00:57:35
6233	38	86	3	2024-12-04 00:57:35	2024-12-04 00:58:15
6240	38	86	3	2024-12-04 00:58:15	2024-12-04 00:58:56
6247	38	86	3	2024-12-04 00:58:56	2024-12-04 00:59:36
6254	38	86	3	2024-12-04 00:59:36	2024-12-04 01:00:16
6261	38	86	3	2024-12-04 01:00:16	2024-12-04 01:00:57
6268	38	86	3	2024-12-04 01:00:57	2024-12-04 01:01:37
6275	38	86	3	2024-12-04 01:01:37	2024-12-04 01:02:17
6282	38	86	3	2024-12-04 01:02:17	2024-12-04 01:02:58
6289	38	86	3	2024-12-04 01:02:58	2024-12-04 01:03:38
6296	38	86	3	2024-12-04 01:03:38	2024-12-04 01:04:18
6303	38	86	3	2024-12-04 01:04:18	2024-12-04 01:04:59
6310	38	86	3	2024-12-04 01:04:59	2024-12-04 01:05:39
6317	38	86	3	2024-12-04 01:05:39	2024-12-04 01:06:19
6324	38	86	3	2024-12-04 01:06:19	2024-12-04 01:07:00
6331	38	86	3	2024-12-04 01:07:00	2024-12-04 01:07:40
6338	38	86	3	2024-12-04 01:07:40	2024-12-04 01:08:20
6345	38	86	3	2024-12-04 01:08:20	2024-12-04 01:09:01
6352	38	86	3	2024-12-04 01:09:01	2024-12-04 01:09:41
6359	38	86	3	2024-12-04 01:09:41	2024-12-04 01:10:21
6366	38	86	3	2024-12-04 01:10:21	2024-12-04 01:11:02
6373	38	86	3	2024-12-04 01:11:02	2024-12-04 01:11:42
6380	38	86	3	2024-12-04 01:11:42	2024-12-04 01:12:23
2551	38	86	3	2024-12-03 18:50:20	2024-12-03 18:51:01
2557	38	86	3	2024-12-03 18:51:01	2024-12-03 18:51:42
2563	38	86	3	2024-12-03 18:51:42	2024-12-03 18:52:23
2569	38	86	3	2024-12-03 18:52:23	2024-12-03 18:53:04
2575	38	86	3	2024-12-03 18:53:04	2024-12-03 18:53:44
2581	38	86	3	2024-12-03 18:53:44	2024-12-03 18:54:24
2587	38	86	3	2024-12-03 18:54:24	2024-12-03 18:55:05
2593	38	86	3	2024-12-03 18:55:05	2024-12-03 18:55:45
6052	38	81	3	2024-12-04 00:40:03	2024-12-04 00:40:43
6059	38	81	3	2024-12-04 00:40:43	2024-12-04 00:41:23
6066	38	81	3	2024-12-04 00:41:23	2024-12-04 00:42:04
6073	38	81	3	2024-12-04 00:42:04	2024-12-04 00:42:44
6080	38	81	3	2024-12-04 00:42:44	2024-12-04 00:43:24
6087	38	81	3	2024-12-04 00:43:24	2024-12-04 00:44:05
6094	38	81	3	2024-12-04 00:44:05	2024-12-04 00:44:45
6101	38	81	3	2024-12-04 00:44:45	2024-12-04 00:45:25
6108	38	81	3	2024-12-04 00:45:25	2024-12-04 00:46:06
6115	38	81	3	2024-12-04 00:46:06	2024-12-04 00:46:46
6122	38	81	3	2024-12-04 00:46:46	2024-12-04 00:47:26
6129	38	81	3	2024-12-04 00:47:26	2024-12-04 00:48:07
6136	38	81	3	2024-12-04 00:48:07	2024-12-04 00:48:47
6143	38	81	3	2024-12-04 00:48:47	2024-12-04 00:49:28
6150	38	81	3	2024-12-04 00:49:28	2024-12-04 00:50:08
6157	38	81	3	2024-12-04 00:50:08	2024-12-04 00:50:49
6164	38	81	3	2024-12-04 00:50:49	2024-12-04 00:51:30
6171	38	81	3	2024-12-04 00:51:30	2024-12-04 00:52:11
6178	38	81	3	2024-12-04 00:52:11	2024-12-04 00:52:52
6185	38	81	3	2024-12-04 00:52:52	2024-12-04 00:53:33
6192	38	81	3	2024-12-04 00:53:33	2024-12-04 00:54:14
6199	38	81	3	2024-12-04 00:54:14	2024-12-04 00:54:54
6206	38	81	3	2024-12-04 00:54:54	2024-12-04 00:55:34
6213	38	81	3	2024-12-04 00:55:34	2024-12-04 00:56:15
6220	38	81	3	2024-12-04 00:56:15	2024-12-04 00:56:55
6227	38	81	3	2024-12-04 00:56:55	2024-12-04 00:57:35
6234	38	81	3	2024-12-04 00:57:35	2024-12-04 00:58:16
6241	38	81	3	2024-12-04 00:58:16	2024-12-04 00:58:56
6248	38	81	3	2024-12-04 00:58:56	2024-12-04 00:59:36
6255	38	81	3	2024-12-04 00:59:36	2024-12-04 01:00:17
6262	38	81	3	2024-12-04 01:00:17	2024-12-04 01:00:57
6269	38	81	3	2024-12-04 01:00:57	2024-12-04 01:01:37
6276	38	81	3	2024-12-04 01:01:37	2024-12-04 01:02:18
6283	38	81	3	2024-12-04 01:02:18	2024-12-04 01:02:58
6290	38	81	3	2024-12-04 01:02:58	2024-12-04 01:03:38
6297	38	81	3	2024-12-04 01:03:38	2024-12-04 01:04:19
6304	38	81	3	2024-12-04 01:04:19	2024-12-04 01:04:59
6311	38	81	3	2024-12-04 01:04:59	2024-12-04 01:05:39
6318	38	81	3	2024-12-04 01:05:39	2024-12-04 01:06:20
6325	38	81	3	2024-12-04 01:06:20	2024-12-04 01:07:00
6332	38	81	3	2024-12-04 01:07:00	2024-12-04 01:07:40
6339	38	81	3	2024-12-04 01:07:40	2024-12-04 01:08:21
6346	38	81	3	2024-12-04 01:08:21	2024-12-04 01:09:01
6353	38	81	3	2024-12-04 01:09:01	2024-12-04 01:09:42
6360	38	81	3	2024-12-04 01:09:42	2024-12-04 01:10:22
6367	38	81	3	2024-12-04 01:10:22	2024-12-04 01:11:02
6374	38	81	3	2024-12-04 01:11:02	2024-12-04 01:11:43
6381	38	81	3	2024-12-04 01:11:43	2024-12-04 01:12:23
2552	38	81	3	2024-12-03 18:50:25	2024-12-03 18:51:06
2558	38	81	3	2024-12-03 18:51:06	2024-12-03 18:51:47
2564	38	81	3	2024-12-03 18:51:47	2024-12-03 18:52:28
2570	38	81	3	2024-12-03 18:52:28	2024-12-03 18:53:08
2576	38	81	3	2024-12-03 18:53:08	2024-12-03 18:53:48
2582	38	81	3	2024-12-03 18:53:48	2024-12-03 18:54:29
2588	38	81	3	2024-12-03 18:54:29	2024-12-03 18:55:09
6053	38	82	3	2024-12-04 00:40:13	2024-12-04 00:40:53
6060	38	82	3	2024-12-04 00:40:53	2024-12-04 00:41:33
6067	38	82	3	2024-12-04 00:41:33	2024-12-04 00:42:14
6074	38	82	3	2024-12-04 00:42:14	2024-12-04 00:42:54
6081	38	82	3	2024-12-04 00:42:54	2024-12-04 00:43:34
6088	38	82	3	2024-12-04 00:43:34	2024-12-04 00:44:15
6095	38	82	3	2024-12-04 00:44:15	2024-12-04 00:44:55
6102	38	82	3	2024-12-04 00:44:55	2024-12-04 00:45:35
6109	38	82	3	2024-12-04 00:45:35	2024-12-04 00:46:16
6116	38	82	3	2024-12-04 00:46:16	2024-12-04 00:46:56
6123	38	82	3	2024-12-04 00:46:56	2024-12-04 00:47:36
6130	38	82	3	2024-12-04 00:47:36	2024-12-04 00:48:17
6137	38	82	3	2024-12-04 00:48:17	2024-12-04 00:48:57
6144	38	82	3	2024-12-04 00:48:57	2024-12-04 00:49:37
6151	38	82	3	2024-12-04 00:49:37	2024-12-04 00:50:18
6158	38	82	3	2024-12-04 00:50:18	2024-12-04 00:50:59
6165	38	82	3	2024-12-04 00:50:59	2024-12-04 00:51:40
6172	38	82	3	2024-12-04 00:51:40	2024-12-04 00:52:21
6179	38	82	3	2024-12-04 00:52:21	2024-12-04 00:53:02
6186	38	82	3	2024-12-04 00:53:02	2024-12-04 00:53:42
6193	38	82	3	2024-12-04 00:53:42	2024-12-04 00:54:23
6200	38	82	3	2024-12-04 00:54:23	2024-12-04 00:55:03
6207	38	82	3	2024-12-04 00:55:03	2024-12-04 00:55:43
6214	38	82	3	2024-12-04 00:55:43	2024-12-04 00:56:24
6221	38	82	3	2024-12-04 00:56:24	2024-12-04 00:57:04
6228	38	82	3	2024-12-04 00:57:04	2024-12-04 00:57:44
6235	38	82	3	2024-12-04 00:57:44	2024-12-04 00:58:25
6242	38	82	3	2024-12-04 00:58:25	2024-12-04 00:59:05
6249	38	82	3	2024-12-04 00:59:05	2024-12-04 00:59:45
6256	38	82	3	2024-12-04 00:59:45	2024-12-04 01:00:25
6263	38	82	3	2024-12-04 01:00:25	2024-12-04 01:01:06
6270	38	82	3	2024-12-04 01:01:06	2024-12-04 01:01:46
6277	38	82	3	2024-12-04 01:01:46	2024-12-04 01:02:27
6284	38	82	3	2024-12-04 01:02:27	2024-12-04 01:03:07
6291	38	82	3	2024-12-04 01:03:07	2024-12-04 01:03:47
6298	38	82	3	2024-12-04 01:03:47	2024-12-04 01:04:27
6305	38	82	3	2024-12-04 01:04:27	2024-12-04 01:05:08
6312	38	82	3	2024-12-04 01:05:08	2024-12-04 01:05:48
6319	38	82	3	2024-12-04 01:05:48	2024-12-04 01:06:28
6326	38	82	3	2024-12-04 01:06:28	2024-12-04 01:07:09
6333	38	82	3	2024-12-04 01:07:09	2024-12-04 01:07:49
6340	38	82	3	2024-12-04 01:07:49	2024-12-04 01:08:29
6347	38	82	3	2024-12-04 01:08:29	2024-12-04 01:09:10
6354	38	82	3	2024-12-04 01:09:10	2024-12-04 01:09:50
6361	38	82	3	2024-12-04 01:09:50	2024-12-04 01:10:30
6368	38	82	3	2024-12-04 01:10:30	2024-12-04 01:11:11
6375	38	82	3	2024-12-04 01:11:11	2024-12-04 01:11:52
2553	38	82	3	2024-12-03 18:50:32	2024-12-03 18:51:13
2559	38	82	3	2024-12-03 18:51:13	2024-12-03 18:51:55
2565	38	82	3	2024-12-03 18:51:55	2024-12-03 18:52:36
2571	38	82	3	2024-12-03 18:52:36	2024-12-03 18:53:16
2577	38	82	3	2024-12-03 18:53:16	2024-12-03 18:53:56
2583	38	82	3	2024-12-03 18:53:56	2024-12-03 18:54:37
2589	38	82	3	2024-12-03 18:54:37	2024-12-03 18:55:17
6049	38	84	3	2024-12-04 00:39:52	2024-12-04 00:40:32
6056	38	84	3	2024-12-04 00:40:32	2024-12-04 00:41:13
6063	38	84	3	2024-12-04 00:41:13	2024-12-04 00:41:53
6070	38	84	3	2024-12-04 00:41:53	2024-12-04 00:42:33
6077	38	84	3	2024-12-04 00:42:33	2024-12-04 00:43:14
6084	38	84	3	2024-12-04 00:43:14	2024-12-04 00:43:54
6091	38	84	3	2024-12-04 00:43:54	2024-12-04 00:44:34
6098	38	84	3	2024-12-04 00:44:34	2024-12-04 00:45:15
6105	38	84	3	2024-12-04 00:45:15	2024-12-04 00:45:55
6112	38	84	3	2024-12-04 00:45:55	2024-12-04 00:46:35
6119	38	84	3	2024-12-04 00:46:35	2024-12-04 00:47:15
6126	38	84	3	2024-12-04 00:47:15	2024-12-04 00:47:56
6133	38	84	3	2024-12-04 00:47:56	2024-12-04 00:48:36
6140	38	84	3	2024-12-04 00:48:36	2024-12-04 00:49:16
6147	38	84	3	2024-12-04 00:49:16	2024-12-04 00:49:57
6154	38	84	3	2024-12-04 00:49:57	2024-12-04 00:50:38
6161	38	84	3	2024-12-04 00:50:38	2024-12-04 00:51:19
6168	38	84	3	2024-12-04 00:51:19	2024-12-04 00:52:00
6175	38	84	3	2024-12-04 00:52:00	2024-12-04 00:52:41
6182	38	84	3	2024-12-04 00:52:41	2024-12-04 00:53:21
6189	38	84	3	2024-12-04 00:53:21	2024-12-04 00:54:02
6196	38	84	3	2024-12-04 00:54:02	2024-12-04 00:54:42
6203	38	84	3	2024-12-04 00:54:42	2024-12-04 00:55:22
6210	38	84	3	2024-12-04 00:55:22	2024-12-04 00:56:03
6217	38	84	3	2024-12-04 00:56:03	2024-12-04 00:56:43
6224	38	84	3	2024-12-04 00:56:43	2024-12-04 00:57:23
6231	38	84	3	2024-12-04 00:57:23	2024-12-04 00:58:04
6238	38	84	3	2024-12-04 00:58:04	2024-12-04 00:58:44
6245	38	84	3	2024-12-04 00:58:44	2024-12-04 00:59:24
6252	38	84	3	2024-12-04 00:59:24	2024-12-04 01:00:05
6259	38	84	3	2024-12-04 01:00:05	2024-12-04 01:00:45
6266	38	84	3	2024-12-04 01:00:45	2024-12-04 01:01:26
6273	38	84	3	2024-12-04 01:01:26	2024-12-04 01:02:06
6280	38	84	3	2024-12-04 01:02:06	2024-12-04 01:02:46
6287	38	84	3	2024-12-04 01:02:46	2024-12-04 01:03:26
6294	38	84	3	2024-12-04 01:03:27	2024-12-04 01:04:07
6301	38	84	3	2024-12-04 01:04:07	2024-12-04 01:04:47
6308	38	84	3	2024-12-04 01:04:47	2024-12-04 01:05:27
6315	38	84	3	2024-12-04 01:05:27	2024-12-04 01:06:08
6322	38	84	3	2024-12-04 01:06:08	2024-12-04 01:06:48
6329	38	84	3	2024-12-04 01:06:48	2024-12-04 01:07:28
6336	38	84	3	2024-12-04 01:07:28	2024-12-04 01:08:09
6343	38	84	3	2024-12-04 01:08:09	2024-12-04 01:08:50
6350	38	84	3	2024-12-04 01:08:50	2024-12-04 01:09:30
6357	38	84	3	2024-12-04 01:09:30	2024-12-04 01:10:10
6364	38	84	3	2024-12-04 01:10:10	2024-12-04 01:10:50
6371	38	84	3	2024-12-04 01:10:50	2024-12-04 01:11:31
6378	38	84	3	2024-12-04 01:11:31	2024-12-04 01:12:12
2554	38	83	3	2024-12-03 18:50:36	2024-12-03 18:51:17
2560	38	83	3	2024-12-03 18:51:17	2024-12-03 18:51:58
2566	38	83	3	2024-12-03 18:51:58	2024-12-03 18:52:38
2572	38	83	3	2024-12-03 18:52:38	2024-12-03 18:53:18
2578	38	83	3	2024-12-03 18:53:18	2024-12-03 18:53:59
2584	38	83	3	2024-12-03 18:53:59	2024-12-03 18:54:39
2590	38	83	3	2024-12-03 18:54:39	2024-12-03 18:55:19
2594	38	81	3	2024-12-03 18:55:09	2024-12-03 18:55:49
2595	38	82	3	2024-12-03 18:55:17	2024-12-03 18:55:57
2596	38	83	3	2024-12-03 18:55:19	2024-12-03 18:56:00
2597	38	84	3	2024-12-03 18:55:35	2024-12-03 18:56:15
2598	38	87	3	2024-12-03 18:55:43	2024-12-03 18:56:24
2599	38	86	3	2024-12-03 18:55:45	2024-12-03 18:56:25
2600	38	81	3	2024-12-03 18:55:49	2024-12-03 18:56:30
2601	38	82	3	2024-12-03 18:55:57	2024-12-03 18:56:37
2602	38	83	3	2024-12-03 18:56:00	2024-12-03 18:56:40
2603	38	84	3	2024-12-03 18:56:15	2024-12-03 18:56:56
2604	38	87	3	2024-12-03 18:56:24	2024-12-03 18:57:04
2605	38	86	3	2024-12-03 18:56:25	2024-12-03 18:57:06
2606	38	81	3	2024-12-03 18:56:30	2024-12-03 18:57:10
2607	38	82	3	2024-12-03 18:56:37	2024-12-03 18:57:18
2608	38	83	3	2024-12-03 18:56:40	2024-12-03 18:57:20
2609	38	84	3	2024-12-03 18:56:56	2024-12-03 18:57:36
2610	38	87	3	2024-12-03 18:57:04	2024-12-03 18:57:44
2611	38	86	3	2024-12-03 18:57:06	2024-12-03 18:57:46
2612	38	81	3	2024-12-03 18:57:10	2024-12-03 18:57:50
2613	38	82	3	2024-12-03 18:57:18	2024-12-03 18:57:58
2614	38	83	3	2024-12-03 18:57:20	2024-12-03 18:58:01
2615	38	84	3	2024-12-03 18:57:36	2024-12-03 18:58:16
2616	38	87	3	2024-12-03 18:57:44	2024-12-03 18:58:25
2617	38	86	3	2024-12-03 18:57:46	2024-12-03 18:58:26
2618	38	81	3	2024-12-03 18:57:50	2024-12-03 18:58:31
2619	38	82	3	2024-12-03 18:57:58	2024-12-03 18:58:38
2620	38	83	3	2024-12-03 18:58:01	2024-12-03 18:58:41
2621	38	84	3	2024-12-03 18:58:16	2024-12-03 18:58:57
2622	38	87	3	2024-12-03 18:58:25	2024-12-03 18:59:05
2623	38	86	3	2024-12-03 18:58:26	2024-12-03 18:59:07
2624	38	81	3	2024-12-03 18:58:31	2024-12-03 18:59:11
2625	38	82	3	2024-12-03 18:58:38	2024-12-03 18:59:19
2626	38	83	3	2024-12-03 18:58:41	2024-12-03 18:59:21
2627	38	84	3	2024-12-03 18:58:57	2024-12-03 18:59:37
2628	38	87	3	2024-12-03 18:59:05	2024-12-03 18:59:45
2629	38	86	3	2024-12-03 18:59:07	2024-12-03 18:59:47
2630	38	81	3	2024-12-03 18:59:11	2024-12-03 18:59:51
2631	38	82	3	2024-12-03 18:59:19	2024-12-03 18:59:59
2632	38	83	3	2024-12-03 18:59:21	2024-12-03 19:00:02
2633	38	84	3	2024-12-03 18:59:37	2024-12-03 19:00:18
2634	38	87	3	2024-12-03 18:59:45	2024-12-03 19:00:26
2635	38	86	3	2024-12-03 18:59:47	2024-12-03 19:00:27
2636	38	81	3	2024-12-03 18:59:51	2024-12-03 19:00:32
2637	38	82	3	2024-12-03 18:59:59	2024-12-03 19:00:39
2638	38	83	3	2024-12-03 19:00:02	2024-12-03 19:00:42
2639	38	84	3	2024-12-03 19:00:18	2024-12-03 19:00:58
2640	38	87	3	2024-12-03 19:00:26	2024-12-03 19:01:06
2641	38	86	3	2024-12-03 19:00:27	2024-12-03 19:01:08
2642	38	81	3	2024-12-03 19:00:32	2024-12-03 19:01:12
2643	38	82	3	2024-12-03 19:00:39	2024-12-03 19:01:20
2644	38	83	3	2024-12-03 19:00:42	2024-12-03 19:01:23
2645	38	84	3	2024-12-03 19:00:58	2024-12-03 19:01:38
2646	38	87	3	2024-12-03 19:01:06	2024-12-03 19:01:47
2647	38	86	3	2024-12-03 19:01:08	2024-12-03 19:01:48
2648	38	81	3	2024-12-03 19:01:12	2024-12-03 19:01:52
2649	38	82	3	2024-12-03 19:01:20	2024-12-03 19:02:00
2650	38	83	3	2024-12-03 19:01:23	2024-12-03 19:02:03
2651	38	84	3	2024-12-03 19:01:39	2024-12-03 19:02:19
2652	38	87	3	2024-12-03 19:01:47	2024-12-03 19:02:27
2653	38	86	3	2024-12-03 19:01:48	2024-12-03 19:02:28
2654	38	81	3	2024-12-03 19:01:52	2024-12-03 19:02:33
2655	38	82	3	2024-12-03 19:02:00	2024-12-03 19:02:40
2656	38	83	3	2024-12-03 19:02:03	2024-12-03 19:02:43
2657	38	84	3	2024-12-03 19:02:19	2024-12-03 19:02:59
2658	38	87	3	2024-12-03 19:02:27	2024-12-03 19:03:07
2659	38	86	3	2024-12-03 19:02:28	2024-12-03 19:03:09
2660	38	81	3	2024-12-03 19:02:33	2024-12-03 19:03:13
2661	38	82	3	2024-12-03 19:02:40	2024-12-03 19:03:21
2662	38	83	3	2024-12-03 19:02:43	2024-12-03 19:03:24
2663	38	84	3	2024-12-03 19:02:59	2024-12-03 19:03:40
2664	38	87	3	2024-12-03 19:03:07	2024-12-03 19:03:48
2665	38	86	3	2024-12-03 19:03:09	2024-12-03 19:03:49
2666	38	81	3	2024-12-03 19:03:13	2024-12-03 19:03:53
2667	38	82	3	2024-12-03 19:03:21	2024-12-03 19:04:01
2668	38	83	3	2024-12-03 19:03:24	2024-12-03 19:04:04
2669	38	84	3	2024-12-03 19:03:40	2024-12-03 19:04:20
2670	38	87	3	2024-12-03 19:03:48	2024-12-03 19:04:28
2671	38	86	3	2024-12-03 19:03:49	2024-12-03 19:04:29
2672	38	81	3	2024-12-03 19:03:53	2024-12-03 19:04:34
2673	38	82	3	2024-12-03 19:04:01	2024-12-03 19:04:41
2674	38	83	3	2024-12-03 19:04:04	2024-12-03 19:04:44
2675	38	84	3	2024-12-03 19:04:20	2024-12-03 19:05:00
2676	38	87	3	2024-12-03 19:04:28	2024-12-03 19:05:09
2677	38	86	3	2024-12-03 19:04:29	2024-12-03 19:05:10
2678	38	81	3	2024-12-03 19:04:34	2024-12-03 19:05:14
2679	38	82	3	2024-12-03 19:04:41	2024-12-03 19:05:22
2680	38	83	3	2024-12-03 19:04:44	2024-12-03 19:05:25
2681	38	84	3	2024-12-03 19:05:00	2024-12-03 19:05:41
2682	38	87	3	2024-12-03 19:05:09	2024-12-03 19:05:49
2683	38	86	3	2024-12-03 19:05:10	2024-12-03 19:05:50
2684	38	81	3	2024-12-03 19:05:14	2024-12-03 19:05:54
2685	38	82	3	2024-12-03 19:05:22	2024-12-03 19:06:02
2686	38	83	3	2024-12-03 19:05:25	2024-12-03 19:06:05
2687	38	84	3	2024-12-03 19:05:41	2024-12-03 19:06:21
2688	38	87	3	2024-12-03 19:05:49	2024-12-03 19:06:29
2689	38	86	3	2024-12-03 19:05:50	2024-12-03 19:06:30
2690	38	81	3	2024-12-03 19:05:54	2024-12-03 19:06:35
2691	38	82	3	2024-12-03 19:06:02	2024-12-03 19:06:42
2692	38	83	3	2024-12-03 19:06:05	2024-12-03 19:06:45
2693	38	84	3	2024-12-03 19:06:21	2024-12-03 19:07:01
2694	38	87	3	2024-12-03 19:06:29	2024-12-03 19:07:10
2695	38	86	3	2024-12-03 19:06:30	2024-12-03 19:07:11
2696	38	81	3	2024-12-03 19:06:35	2024-12-03 19:07:15
2697	38	82	3	2024-12-03 19:06:42	2024-12-03 19:07:23
2698	38	83	3	2024-12-03 19:06:45	2024-12-03 19:07:26
2699	38	84	3	2024-12-03 19:07:01	2024-12-03 19:07:42
2705	38	84	3	2024-12-03 19:07:42	2024-12-03 19:08:22
2711	38	84	3	2024-12-03 19:08:22	2024-12-03 19:09:03
2717	38	84	3	2024-12-03 19:09:03	2024-12-03 19:09:43
2723	38	84	3	2024-12-03 19:09:43	2024-12-03 19:10:23
2729	38	84	3	2024-12-03 19:10:23	2024-12-03 19:11:04
2735	38	84	3	2024-12-03 19:11:04	2024-12-03 19:11:44
2741	38	84	3	2024-12-03 19:11:44	2024-12-03 19:12:24
2747	38	84	3	2024-12-03 19:12:24	2024-12-03 19:13:05
2753	38	84	3	2024-12-03 19:13:05	2024-12-03 19:13:45
6383	38	88	3	2024-12-04 01:11:54	2024-12-04 01:12:35
6390	38	88	3	2024-12-04 01:12:35	2024-12-04 01:13:16
6397	38	88	3	2024-12-04 01:13:16	2024-12-04 01:13:57
6404	38	88	3	2024-12-04 01:13:57	2024-12-04 01:14:38
6411	38	88	3	2024-12-04 01:14:38	2024-12-04 01:15:18
6418	38	88	3	2024-12-04 01:15:18	2024-12-04 01:15:59
6425	38	88	3	2024-12-04 01:15:59	2024-12-04 01:16:39
6432	38	88	3	2024-12-04 01:16:39	2024-12-04 01:17:19
6439	38	88	3	2024-12-04 01:17:19	2024-12-04 01:17:59
6446	38	88	3	2024-12-04 01:17:59	2024-12-04 01:18:40
6453	38	88	3	2024-12-04 01:18:40	2024-12-04 01:19:20
6460	38	88	3	2024-12-04 01:19:20	2024-12-04 01:20:01
6467	38	88	3	2024-12-04 01:20:01	2024-12-04 01:20:41
6474	38	88	3	2024-12-04 01:20:41	2024-12-04 01:21:21
6481	38	88	3	2024-12-04 01:21:21	2024-12-04 01:22:01
6488	38	88	3	2024-12-04 01:22:01	2024-12-04 01:22:42
6495	38	88	3	2024-12-04 01:22:42	2024-12-04 01:23:22
6502	38	88	3	2024-12-04 01:23:22	2024-12-04 01:24:02
6509	38	88	3	2024-12-04 01:24:02	2024-12-04 01:24:43
6516	38	88	3	2024-12-04 01:24:43	2024-12-04 01:25:23
6523	38	88	3	2024-12-04 01:25:23	2024-12-04 01:26:03
6530	38	88	3	2024-12-04 01:26:03	2024-12-04 01:26:44
6537	38	88	3	2024-12-04 01:26:44	2024-12-04 01:27:24
6544	38	88	3	2024-12-04 01:27:24	2024-12-04 01:28:04
6551	38	88	3	2024-12-04 01:28:04	2024-12-04 01:28:45
6558	38	88	3	2024-12-04 01:28:45	2024-12-04 01:29:25
6565	38	88	3	2024-12-04 01:29:25	2024-12-04 01:30:05
6572	38	88	3	2024-12-04 01:30:05	2024-12-04 01:30:46
6579	38	88	3	2024-12-04 01:30:46	2024-12-04 01:31:26
6586	38	88	3	2024-12-04 01:31:26	2024-12-04 01:32:06
6593	38	88	3	2024-12-04 01:32:06	2024-12-04 01:32:47
6600	38	88	3	2024-12-04 01:32:47	2024-12-04 01:33:27
6607	38	88	3	2024-12-04 01:33:27	2024-12-04 01:34:07
6614	38	88	3	2024-12-04 01:34:07	2024-12-04 01:34:48
6621	38	88	3	2024-12-04 01:34:48	2024-12-04 01:35:28
6628	38	88	3	2024-12-04 01:35:28	2024-12-04 01:36:08
6635	38	88	3	2024-12-04 01:36:08	2024-12-04 01:36:49
6642	38	88	3	2024-12-04 01:36:49	2024-12-04 01:37:29
6649	38	88	3	2024-12-04 01:37:29	2024-12-04 01:38:10
6656	38	88	3	2024-12-04 01:38:10	2024-12-04 01:38:50
6663	38	88	3	2024-12-04 01:38:50	2024-12-04 01:39:30
6670	38	88	3	2024-12-04 01:39:30	2024-12-04 01:40:11
6677	38	88	3	2024-12-04 01:40:11	2024-12-04 01:40:51
6684	38	88	3	2024-12-04 01:40:51	2024-12-04 01:41:31
6691	38	88	3	2024-12-04 01:41:31	2024-12-04 01:42:12
6698	38	88	3	2024-12-04 01:42:12	2024-12-04 01:42:52
6705	38	88	3	2024-12-04 01:42:52	2024-12-04 01:43:32
6712	38	88	3	2024-12-04 01:43:32	2024-12-04 01:44:13
6719	38	88	3	2024-12-04 01:44:13	2024-12-04 01:44:53
6726	38	88	3	2024-12-04 01:44:53	2024-12-04 01:45:33
2700	38	87	3	2024-12-03 19:07:10	2024-12-03 19:07:50
2706	38	87	3	2024-12-03 19:07:50	2024-12-03 19:08:30
2712	38	87	3	2024-12-03 19:08:30	2024-12-03 19:09:11
2718	38	87	3	2024-12-03 19:09:11	2024-12-03 19:09:51
2724	38	87	3	2024-12-03 19:09:51	2024-12-03 19:10:31
2730	38	87	3	2024-12-03 19:10:31	2024-12-03 19:11:12
2736	38	87	3	2024-12-03 19:11:12	2024-12-03 19:11:52
2742	38	87	3	2024-12-03 19:11:52	2024-12-03 19:12:33
2748	38	87	3	2024-12-03 19:12:33	2024-12-03 19:13:13
2754	38	87	3	2024-12-03 19:13:13	2024-12-03 19:13:53
6384	38	83	3	2024-12-04 01:12:00	2024-12-04 01:12:41
6391	38	83	3	2024-12-04 01:12:41	2024-12-04 01:13:22
6398	38	83	3	2024-12-04 01:13:22	2024-12-04 01:14:03
6405	38	83	3	2024-12-04 01:14:03	2024-12-04 01:14:44
6412	38	83	3	2024-12-04 01:14:44	2024-12-04 01:15:25
6419	38	83	3	2024-12-04 01:15:25	2024-12-04 01:16:05
6426	38	83	3	2024-12-04 01:16:05	2024-12-04 01:16:45
6433	38	83	3	2024-12-04 01:16:45	2024-12-04 01:17:26
6440	38	83	3	2024-12-04 01:17:26	2024-12-04 01:18:06
6447	38	83	3	2024-12-04 01:18:06	2024-12-04 01:18:46
6454	38	83	3	2024-12-04 01:18:46	2024-12-04 01:19:27
6461	38	83	3	2024-12-04 01:19:27	2024-12-04 01:20:07
6468	38	83	3	2024-12-04 01:20:07	2024-12-04 01:20:47
6475	38	83	3	2024-12-04 01:20:47	2024-12-04 01:21:28
6482	38	83	3	2024-12-04 01:21:28	2024-12-04 01:22:08
6489	38	83	3	2024-12-04 01:22:08	2024-12-04 01:22:48
6496	38	83	3	2024-12-04 01:22:48	2024-12-04 01:23:29
6503	38	83	3	2024-12-04 01:23:29	2024-12-04 01:24:09
6510	38	83	3	2024-12-04 01:24:09	2024-12-04 01:24:49
6517	38	83	3	2024-12-04 01:24:49	2024-12-04 01:25:29
6524	38	83	3	2024-12-04 01:25:29	2024-12-04 01:26:10
6531	38	83	3	2024-12-04 01:26:10	2024-12-04 01:26:50
6538	38	83	3	2024-12-04 01:26:50	2024-12-04 01:27:31
6545	38	83	3	2024-12-04 01:27:31	2024-12-04 01:28:11
6552	38	83	3	2024-12-04 01:28:11	2024-12-04 01:28:51
6559	38	83	3	2024-12-04 01:28:51	2024-12-04 01:29:32
6566	38	83	3	2024-12-04 01:29:32	2024-12-04 01:30:12
6573	38	83	3	2024-12-04 01:30:12	2024-12-04 01:30:52
6580	38	83	3	2024-12-04 01:30:52	2024-12-04 01:31:33
6587	38	83	3	2024-12-04 01:31:33	2024-12-04 01:32:13
6594	38	83	3	2024-12-04 01:32:13	2024-12-04 01:32:53
6601	38	83	3	2024-12-04 01:32:53	2024-12-04 01:33:34
6608	38	83	3	2024-12-04 01:33:34	2024-12-04 01:34:14
6615	38	83	3	2024-12-04 01:34:14	2024-12-04 01:34:54
6622	38	83	3	2024-12-04 01:34:54	2024-12-04 01:35:35
6629	38	83	3	2024-12-04 01:35:35	2024-12-04 01:36:15
6636	38	83	3	2024-12-04 01:36:15	2024-12-04 01:36:56
6643	38	83	3	2024-12-04 01:36:56	2024-12-04 01:37:36
6650	38	83	3	2024-12-04 01:37:36	2024-12-04 01:38:17
6657	38	83	3	2024-12-04 01:38:17	2024-12-04 01:38:57
6664	38	83	3	2024-12-04 01:38:57	2024-12-04 01:39:37
6671	38	83	3	2024-12-04 01:39:37	2024-12-04 01:40:18
6678	38	83	3	2024-12-04 01:40:18	2024-12-04 01:40:58
6685	38	83	3	2024-12-04 01:40:58	2024-12-04 01:41:38
6692	38	83	3	2024-12-04 01:41:38	2024-12-04 01:42:19
6699	38	83	3	2024-12-04 01:42:19	2024-12-04 01:42:59
6706	38	83	3	2024-12-04 01:42:59	2024-12-04 01:43:40
6713	38	83	3	2024-12-04 01:43:40	2024-12-04 01:44:20
6720	38	83	3	2024-12-04 01:44:20	2024-12-04 01:45:00
2701	38	86	3	2024-12-03 19:07:11	2024-12-03 19:07:51
2707	38	86	3	2024-12-03 19:07:51	2024-12-03 19:08:31
2713	38	86	3	2024-12-03 19:08:31	2024-12-03 19:09:12
2719	38	86	3	2024-12-03 19:09:12	2024-12-03 19:09:53
2725	38	86	3	2024-12-03 19:09:53	2024-12-03 19:10:33
2731	38	86	3	2024-12-03 19:10:33	2024-12-03 19:11:13
2737	38	86	3	2024-12-03 19:11:13	2024-12-03 19:11:54
2743	38	86	3	2024-12-03 19:11:54	2024-12-03 19:12:34
2749	38	86	3	2024-12-03 19:12:34	2024-12-03 19:13:14
6385	38	84	3	2024-12-04 01:12:12	2024-12-04 01:12:53
6392	38	84	3	2024-12-04 01:12:53	2024-12-04 01:13:34
6399	38	84	3	2024-12-04 01:13:34	2024-12-04 01:14:15
6406	38	84	3	2024-12-04 01:14:15	2024-12-04 01:14:55
6413	38	84	3	2024-12-04 01:14:55	2024-12-04 01:15:35
6420	38	84	3	2024-12-04 01:15:35	2024-12-04 01:16:15
6427	38	84	3	2024-12-04 01:16:15	2024-12-04 01:16:56
6434	38	84	3	2024-12-04 01:16:56	2024-12-04 01:17:36
6441	38	84	3	2024-12-04 01:17:36	2024-12-04 01:18:16
6448	38	84	3	2024-12-04 01:18:16	2024-12-04 01:18:57
6455	38	84	3	2024-12-04 01:18:57	2024-12-04 01:19:37
6462	38	84	3	2024-12-04 01:19:37	2024-12-04 01:20:18
6469	38	84	3	2024-12-04 01:20:18	2024-12-04 01:20:58
6476	38	84	3	2024-12-04 01:20:58	2024-12-04 01:21:38
6483	38	84	3	2024-12-04 01:21:38	2024-12-04 01:22:19
6490	38	84	3	2024-12-04 01:22:19	2024-12-04 01:22:59
6497	38	84	3	2024-12-04 01:22:59	2024-12-04 01:23:39
6504	38	84	3	2024-12-04 01:23:39	2024-12-04 01:24:20
6511	38	84	3	2024-12-04 01:24:20	2024-12-04 01:25:00
6518	38	84	3	2024-12-04 01:25:00	2024-12-04 01:25:40
6525	38	84	3	2024-12-04 01:25:40	2024-12-04 01:26:21
6532	38	84	3	2024-12-04 01:26:21	2024-12-04 01:27:01
6539	38	84	3	2024-12-04 01:27:01	2024-12-04 01:27:41
6546	38	84	3	2024-12-04 01:27:41	2024-12-04 01:28:22
6553	38	84	3	2024-12-04 01:28:22	2024-12-04 01:29:02
6560	38	84	3	2024-12-04 01:29:02	2024-12-04 01:29:42
6567	38	84	3	2024-12-04 01:29:42	2024-12-04 01:30:23
6574	38	84	3	2024-12-04 01:30:23	2024-12-04 01:31:03
6581	38	84	3	2024-12-04 01:31:03	2024-12-04 01:31:43
6588	38	84	3	2024-12-04 01:31:43	2024-12-04 01:32:24
6595	38	84	3	2024-12-04 01:32:24	2024-12-04 01:33:04
6602	38	84	3	2024-12-04 01:33:04	2024-12-04 01:33:44
6609	38	84	3	2024-12-04 01:33:44	2024-12-04 01:34:24
6616	38	84	3	2024-12-04 01:34:24	2024-12-04 01:35:05
6623	38	84	3	2024-12-04 01:35:05	2024-12-04 01:35:45
6630	38	84	3	2024-12-04 01:35:45	2024-12-04 01:36:26
6637	38	84	3	2024-12-04 01:36:26	2024-12-04 01:37:06
6644	38	84	3	2024-12-04 01:37:06	2024-12-04 01:37:46
6651	38	84	3	2024-12-04 01:37:46	2024-12-04 01:38:27
6658	38	84	3	2024-12-04 01:38:27	2024-12-04 01:39:07
6665	38	84	3	2024-12-04 01:39:07	2024-12-04 01:39:47
6672	38	84	3	2024-12-04 01:39:47	2024-12-04 01:40:28
6679	38	84	3	2024-12-04 01:40:28	2024-12-04 01:41:08
6686	38	84	3	2024-12-04 01:41:08	2024-12-04 01:41:48
6693	38	84	3	2024-12-04 01:41:48	2024-12-04 01:42:29
6700	38	84	3	2024-12-04 01:42:29	2024-12-04 01:43:09
6707	38	84	3	2024-12-04 01:43:09	2024-12-04 01:43:49
6714	38	84	3	2024-12-04 01:43:49	2024-12-04 01:44:30
6721	38	84	3	2024-12-04 01:44:30	2024-12-04 01:45:10
2702	38	81	3	2024-12-03 19:07:15	2024-12-03 19:07:55
2708	38	81	3	2024-12-03 19:07:55	2024-12-03 19:08:36
2714	38	81	3	2024-12-03 19:08:36	2024-12-03 19:09:16
2720	38	81	3	2024-12-03 19:09:16	2024-12-03 19:09:56
2726	38	81	3	2024-12-03 19:09:56	2024-12-03 19:10:37
2732	38	81	3	2024-12-03 19:10:37	2024-12-03 19:11:17
2738	38	81	3	2024-12-03 19:11:17	2024-12-03 19:11:57
2744	38	81	3	2024-12-03 19:11:57	2024-12-03 19:12:38
2750	38	81	3	2024-12-03 19:12:38	2024-12-03 19:13:18
6386	38	87	3	2024-12-04 01:12:20	2024-12-04 01:13:01
6393	38	87	3	2024-12-04 01:13:01	2024-12-04 01:13:42
6400	38	87	3	2024-12-04 01:13:42	2024-12-04 01:14:22
6407	38	87	3	2024-12-04 01:14:22	2024-12-04 01:15:03
6414	38	87	3	2024-12-04 01:15:03	2024-12-04 01:15:43
6421	38	87	3	2024-12-04 01:15:43	2024-12-04 01:16:23
6428	38	87	3	2024-12-04 01:16:23	2024-12-04 01:17:04
6435	38	87	3	2024-12-04 01:17:04	2024-12-04 01:17:44
6442	38	87	3	2024-12-04 01:17:44	2024-12-04 01:18:25
6449	38	87	3	2024-12-04 01:18:25	2024-12-04 01:19:05
6456	38	87	3	2024-12-04 01:19:05	2024-12-04 01:19:45
6463	38	87	3	2024-12-04 01:19:45	2024-12-04 01:20:26
6470	38	87	3	2024-12-04 01:20:26	2024-12-04 01:21:06
6477	38	87	3	2024-12-04 01:21:06	2024-12-04 01:21:46
6484	38	87	3	2024-12-04 01:21:46	2024-12-04 01:22:27
6491	38	87	3	2024-12-04 01:22:27	2024-12-04 01:23:07
6498	38	87	3	2024-12-04 01:23:07	2024-12-04 01:23:47
6505	38	87	3	2024-12-04 01:23:47	2024-12-04 01:24:28
6512	38	87	3	2024-12-04 01:24:28	2024-12-04 01:25:08
6519	38	87	3	2024-12-04 01:25:08	2024-12-04 01:25:48
6526	38	87	3	2024-12-04 01:25:48	2024-12-04 01:26:29
6533	38	87	3	2024-12-04 01:26:29	2024-12-04 01:27:09
6540	38	87	3	2024-12-04 01:27:09	2024-12-04 01:27:49
6547	38	87	3	2024-12-04 01:27:49	2024-12-04 01:28:30
6554	38	87	3	2024-12-04 01:28:30	2024-12-04 01:29:10
6561	38	87	3	2024-12-04 01:29:10	2024-12-04 01:29:50
6568	38	87	3	2024-12-04 01:29:50	2024-12-04 01:30:31
6575	38	87	3	2024-12-04 01:30:31	2024-12-04 01:31:11
6582	38	87	3	2024-12-04 01:31:11	2024-12-04 01:31:51
6589	38	87	3	2024-12-04 01:31:51	2024-12-04 01:32:32
6596	38	87	3	2024-12-04 01:32:32	2024-12-04 01:33:12
6603	38	87	3	2024-12-04 01:33:12	2024-12-04 01:33:52
6610	38	87	3	2024-12-04 01:33:52	2024-12-04 01:34:33
6617	38	87	3	2024-12-04 01:34:33	2024-12-04 01:35:13
6624	38	87	3	2024-12-04 01:35:13	2024-12-04 01:35:53
6631	38	87	3	2024-12-04 01:35:53	2024-12-04 01:36:34
6638	38	87	3	2024-12-04 01:36:34	2024-12-04 01:37:14
6645	38	87	3	2024-12-04 01:37:14	2024-12-04 01:37:54
6652	38	87	3	2024-12-04 01:37:54	2024-12-04 01:38:35
6659	38	87	3	2024-12-04 01:38:35	2024-12-04 01:39:15
6666	38	87	3	2024-12-04 01:39:15	2024-12-04 01:39:55
6673	38	87	3	2024-12-04 01:39:55	2024-12-04 01:40:36
6680	38	87	3	2024-12-04 01:40:36	2024-12-04 01:41:16
6687	38	87	3	2024-12-04 01:41:16	2024-12-04 01:41:56
6694	38	87	3	2024-12-04 01:41:56	2024-12-04 01:42:37
6701	38	87	3	2024-12-04 01:42:37	2024-12-04 01:43:17
6708	38	87	3	2024-12-04 01:43:17	2024-12-04 01:43:57
6715	38	87	3	2024-12-04 01:43:57	2024-12-04 01:44:38
6722	38	87	3	2024-12-04 01:44:38	2024-12-04 01:45:18
2703	38	82	3	2024-12-03 19:07:23	2024-12-03 19:08:03
2709	38	82	3	2024-12-03 19:08:03	2024-12-03 19:08:43
2715	38	82	3	2024-12-03 19:08:43	2024-12-03 19:09:24
2721	38	82	3	2024-12-03 19:09:24	2024-12-03 19:10:04
2727	38	82	3	2024-12-03 19:10:04	2024-12-03 19:10:44
2733	38	82	3	2024-12-03 19:10:44	2024-12-03 19:11:25
2739	38	82	3	2024-12-03 19:11:25	2024-12-03 19:12:05
2745	38	82	3	2024-12-03 19:12:05	2024-12-03 19:12:45
2751	38	82	3	2024-12-03 19:12:45	2024-12-03 19:13:26
6387	38	86	3	2024-12-04 01:12:23	2024-12-04 01:13:04
6394	38	86	3	2024-12-04 01:13:04	2024-12-04 01:13:45
6401	38	86	3	2024-12-04 01:13:45	2024-12-04 01:14:26
6408	38	86	3	2024-12-04 01:14:26	2024-12-04 01:15:06
6415	38	86	3	2024-12-04 01:15:06	2024-12-04 01:15:46
6422	38	86	3	2024-12-04 01:15:46	2024-12-04 01:16:27
6429	38	86	3	2024-12-04 01:16:27	2024-12-04 01:17:07
6436	38	86	3	2024-12-04 01:17:07	2024-12-04 01:17:47
6443	38	86	3	2024-12-04 01:17:47	2024-12-04 01:18:28
6450	38	86	3	2024-12-04 01:18:28	2024-12-04 01:19:08
6457	38	86	3	2024-12-04 01:19:08	2024-12-04 01:19:48
6464	38	86	3	2024-12-04 01:19:48	2024-12-04 01:20:29
6471	38	86	3	2024-12-04 01:20:29	2024-12-04 01:21:09
6478	38	86	3	2024-12-04 01:21:09	2024-12-04 01:21:49
6485	38	86	3	2024-12-04 01:21:49	2024-12-04 01:22:30
6492	38	86	3	2024-12-04 01:22:30	2024-12-04 01:23:10
6499	38	86	3	2024-12-04 01:23:10	2024-12-04 01:23:50
6506	38	86	3	2024-12-04 01:23:50	2024-12-04 01:24:31
6513	38	86	3	2024-12-04 01:24:31	2024-12-04 01:25:11
6520	38	86	3	2024-12-04 01:25:11	2024-12-04 01:25:51
6527	38	86	3	2024-12-04 01:25:51	2024-12-04 01:26:32
6534	38	86	3	2024-12-04 01:26:32	2024-12-04 01:27:12
6541	38	86	3	2024-12-04 01:27:12	2024-12-04 01:27:52
6548	38	86	3	2024-12-04 01:27:52	2024-12-04 01:28:33
6555	38	86	3	2024-12-04 01:28:33	2024-12-04 01:29:13
6562	38	86	3	2024-12-04 01:29:13	2024-12-04 01:29:53
6569	38	86	3	2024-12-04 01:29:53	2024-12-04 01:30:34
6576	38	86	3	2024-12-04 01:30:34	2024-12-04 01:31:14
6583	38	86	3	2024-12-04 01:31:14	2024-12-04 01:31:54
6590	38	86	3	2024-12-04 01:31:54	2024-12-04 01:32:35
6597	38	86	3	2024-12-04 01:32:35	2024-12-04 01:33:15
6604	38	86	3	2024-12-04 01:33:15	2024-12-04 01:33:55
6611	38	86	3	2024-12-04 01:33:55	2024-12-04 01:34:36
6618	38	86	3	2024-12-04 01:34:36	2024-12-04 01:35:16
6625	38	86	3	2024-12-04 01:35:16	2024-12-04 01:35:56
6632	38	86	3	2024-12-04 01:35:56	2024-12-04 01:36:36
6639	38	86	3	2024-12-04 01:36:36	2024-12-04 01:37:17
6646	38	86	3	2024-12-04 01:37:17	2024-12-04 01:37:57
6653	38	86	3	2024-12-04 01:37:57	2024-12-04 01:38:37
6660	38	86	3	2024-12-04 01:38:37	2024-12-04 01:39:18
6667	38	86	3	2024-12-04 01:39:18	2024-12-04 01:39:58
6674	38	86	3	2024-12-04 01:39:58	2024-12-04 01:40:38
6681	38	86	3	2024-12-04 01:40:38	2024-12-04 01:41:19
6688	38	86	3	2024-12-04 01:41:19	2024-12-04 01:41:59
6695	38	86	3	2024-12-04 01:41:59	2024-12-04 01:42:39
6702	38	86	3	2024-12-04 01:42:39	2024-12-04 01:43:20
6709	38	86	3	2024-12-04 01:43:20	2024-12-04 01:44:00
6716	38	86	3	2024-12-04 01:44:00	2024-12-04 01:44:40
6723	38	86	3	2024-12-04 01:44:40	2024-12-04 01:45:21
2704	38	83	3	2024-12-03 19:07:26	2024-12-03 19:08:06
2710	38	83	3	2024-12-03 19:08:06	2024-12-03 19:08:46
2716	38	83	3	2024-12-03 19:08:46	2024-12-03 19:09:27
2722	38	83	3	2024-12-03 19:09:27	2024-12-03 19:10:07
2728	38	83	3	2024-12-03 19:10:07	2024-12-03 19:10:48
2734	38	83	3	2024-12-03 19:10:48	2024-12-03 19:11:28
2740	38	83	3	2024-12-03 19:11:28	2024-12-03 19:12:08
2746	38	83	3	2024-12-03 19:12:08	2024-12-03 19:12:49
2752	38	83	3	2024-12-03 19:12:49	2024-12-03 19:13:29
2755	38	86	3	2024-12-03 19:13:14	2024-12-03 19:13:55
2756	38	81	3	2024-12-03 19:13:18	2024-12-03 19:13:58
2757	38	82	3	2024-12-03 19:13:26	2024-12-03 19:14:06
2758	38	83	3	2024-12-03 19:13:29	2024-12-03 19:14:09
2759	38	84	3	2024-12-03 19:13:45	2024-12-03 19:14:26
2760	38	87	3	2024-12-03 19:13:53	2024-12-03 19:14:34
2761	38	86	3	2024-12-03 19:13:55	2024-12-03 19:14:35
2762	38	81	3	2024-12-03 19:13:58	2024-12-03 19:14:39
2763	38	82	3	2024-12-03 19:14:06	2024-12-03 19:14:46
2764	38	83	3	2024-12-03 19:14:09	2024-12-03 19:14:50
2765	38	84	3	2024-12-03 19:14:26	2024-12-03 19:15:06
2766	38	87	3	2024-12-03 19:14:34	2024-12-03 19:15:14
2767	38	86	3	2024-12-03 19:14:35	2024-12-03 19:15:15
2768	38	81	3	2024-12-03 19:14:39	2024-12-03 19:15:19
2769	38	82	3	2024-12-03 19:14:46	2024-12-03 19:15:27
2770	38	83	3	2024-12-03 19:14:50	2024-12-03 19:15:30
2771	38	84	3	2024-12-03 19:15:06	2024-12-03 19:15:46
2772	38	87	3	2024-12-03 19:15:14	2024-12-03 19:15:54
2773	38	86	3	2024-12-03 19:15:15	2024-12-03 19:15:56
2774	38	81	3	2024-12-03 19:15:19	2024-12-03 19:15:59
2775	38	82	3	2024-12-03 19:15:27	2024-12-03 19:16:07
2776	38	83	3	2024-12-03 19:15:30	2024-12-03 19:16:10
2777	38	84	3	2024-12-03 19:15:46	2024-12-03 19:16:27
2778	38	87	3	2024-12-03 19:15:54	2024-12-03 19:16:35
2779	38	86	3	2024-12-03 19:15:56	2024-12-03 19:16:36
2780	38	81	3	2024-12-03 19:15:59	2024-12-03 19:16:40
2781	38	82	3	2024-12-03 19:16:07	2024-12-03 19:16:47
2782	38	83	3	2024-12-03 19:16:10	2024-12-03 19:16:51
2783	38	84	3	2024-12-03 19:16:27	2024-12-03 19:17:07
2784	38	87	3	2024-12-03 19:16:35	2024-12-03 19:17:15
2785	38	86	3	2024-12-03 19:16:36	2024-12-03 19:17:16
2786	38	81	3	2024-12-03 19:16:40	2024-12-03 19:17:20
2787	38	82	3	2024-12-03 19:16:47	2024-12-03 19:17:28
2788	38	83	3	2024-12-03 19:16:51	2024-12-03 19:17:31
2789	38	84	3	2024-12-03 19:17:07	2024-12-03 19:17:47
2790	38	87	3	2024-12-03 19:17:15	2024-12-03 19:17:55
2791	38	86	3	2024-12-03 19:17:16	2024-12-03 19:17:57
2792	38	81	3	2024-12-03 19:17:20	2024-12-03 19:18:00
2793	38	82	3	2024-12-03 19:17:28	2024-12-03 19:18:08
2794	38	83	3	2024-12-03 19:17:31	2024-12-03 19:18:12
2795	38	84	3	2024-12-03 19:17:47	2024-12-03 19:18:28
2796	38	87	3	2024-12-03 19:17:55	2024-12-03 19:18:36
2797	38	86	3	2024-12-03 19:17:57	2024-12-03 19:18:37
2798	38	81	3	2024-12-03 19:18:00	2024-12-03 19:18:41
2799	38	82	3	2024-12-03 19:18:08	2024-12-03 19:18:48
2800	38	83	3	2024-12-03 19:18:12	2024-12-03 19:18:52
2801	38	84	3	2024-12-03 19:18:28	2024-12-03 19:19:08
2802	38	87	3	2024-12-03 19:18:36	2024-12-03 19:19:16
2803	38	86	3	2024-12-03 19:18:37	2024-12-03 19:19:17
2804	38	81	3	2024-12-03 19:18:41	2024-12-03 19:19:21
2805	38	82	3	2024-12-03 19:18:48	2024-12-03 19:19:29
2806	38	83	3	2024-12-03 19:18:52	2024-12-03 19:19:32
2807	38	84	3	2024-12-03 19:19:08	2024-12-03 19:19:48
2808	38	87	3	2024-12-03 19:19:16	2024-12-03 19:19:56
2809	38	86	3	2024-12-03 19:19:17	2024-12-03 19:19:58
2810	38	81	3	2024-12-03 19:19:21	2024-12-03 19:20:01
2811	38	82	3	2024-12-03 19:19:29	2024-12-03 19:20:09
2812	38	83	3	2024-12-03 19:19:32	2024-12-03 19:20:13
2813	38	84	3	2024-12-03 19:19:48	2024-12-03 19:20:29
2814	38	87	3	2024-12-03 19:19:56	2024-12-03 19:20:37
2815	38	86	3	2024-12-03 19:19:58	2024-12-03 19:20:38
2816	38	81	3	2024-12-03 19:20:01	2024-12-03 19:20:42
2817	38	82	3	2024-12-03 19:20:09	2024-12-03 19:20:49
2818	38	83	3	2024-12-03 19:20:13	2024-12-03 19:20:53
2819	38	84	3	2024-12-03 19:20:29	2024-12-03 19:21:09
2820	38	87	3	2024-12-03 19:20:37	2024-12-03 19:21:17
2821	38	86	3	2024-12-03 19:20:38	2024-12-03 19:21:18
2822	38	81	3	2024-12-03 19:20:42	2024-12-03 19:21:22
2823	38	82	3	2024-12-03 19:20:49	2024-12-03 19:21:30
2824	38	83	3	2024-12-03 19:20:53	2024-12-03 19:21:34
2825	38	84	3	2024-12-03 19:21:09	2024-12-03 19:21:50
2826	38	87	3	2024-12-03 19:21:17	2024-12-03 19:21:58
2827	38	86	3	2024-12-03 19:21:18	2024-12-03 19:21:59
2828	38	81	3	2024-12-03 19:21:22	2024-12-03 19:22:03
2829	38	82	3	2024-12-03 19:21:30	2024-12-03 19:22:11
2830	38	83	3	2024-12-03 19:21:34	2024-12-03 19:22:15
2831	38	84	3	2024-12-03 19:21:50	2024-12-03 19:22:31
2832	38	87	3	2024-12-03 19:21:58	2024-12-03 19:22:39
2833	38	86	3	2024-12-03 19:21:59	2024-12-03 19:22:40
2834	38	81	3	2024-12-03 19:22:03	2024-12-03 19:22:44
2835	38	82	3	2024-12-03 19:22:11	2024-12-03 19:22:52
2836	38	83	3	2024-12-03 19:22:15	2024-12-03 19:22:56
2837	38	84	3	2024-12-03 19:22:31	2024-12-03 19:23:12
2838	38	87	3	2024-12-03 19:22:39	2024-12-03 19:23:20
2839	38	86	3	2024-12-03 19:22:40	2024-12-03 19:23:21
2840	38	81	3	2024-12-03 19:22:44	2024-12-03 19:23:25
2841	38	82	3	2024-12-03 19:22:52	2024-12-03 19:23:33
2842	38	83	3	2024-12-03 19:22:56	2024-12-03 19:23:37
2843	38	84	3	2024-12-03 19:23:12	2024-12-03 19:23:52
2844	38	87	3	2024-12-03 19:23:20	2024-12-03 19:24:01
2845	38	86	3	2024-12-03 19:23:21	2024-12-03 19:24:01
2846	38	81	3	2024-12-03 19:23:25	2024-12-03 19:24:06
2847	38	82	3	2024-12-03 19:23:33	2024-12-03 19:24:13
2848	38	83	3	2024-12-03 19:23:37	2024-12-03 19:24:17
2849	38	84	3	2024-12-03 19:23:52	2024-12-03 19:24:33
2850	38	87	3	2024-12-03 19:24:01	2024-12-03 19:24:41
2851	38	86	3	2024-12-03 19:24:01	2024-12-03 19:24:42
2852	38	81	3	2024-12-03 19:24:06	2024-12-03 19:24:46
2853	38	82	3	2024-12-03 19:24:13	2024-12-03 19:24:54
2854	38	83	3	2024-12-03 19:24:17	2024-12-03 19:24:58
2855	38	84	3	2024-12-03 19:24:33	2024-12-03 19:25:13
2856	38	87	3	2024-12-03 19:24:41	2024-12-03 19:25:21
2857	38	86	3	2024-12-03 19:24:42	2024-12-03 19:25:22
2858	38	81	3	2024-12-03 19:24:46	2024-12-03 19:25:26
2864	38	81	3	2024-12-03 19:25:26	2024-12-03 19:26:07
2870	38	81	3	2024-12-03 19:26:07	2024-12-03 19:26:47
2876	38	81	3	2024-12-03 19:26:47	2024-12-03 19:27:27
2882	38	81	3	2024-12-03 19:27:27	2024-12-03 19:28:08
2888	38	81	3	2024-12-03 19:28:08	2024-12-03 19:28:48
2894	38	81	3	2024-12-03 19:28:48	2024-12-03 19:29:28
2900	38	81	3	2024-12-03 19:29:28	2024-12-03 19:30:09
2906	38	81	3	2024-12-03 19:30:09	2024-12-03 19:30:49
2912	38	81	3	2024-12-03 19:30:49	2024-12-03 19:31:29
6382	38	82	3	2024-12-04 01:11:52	2024-12-04 01:12:33
6389	38	82	3	2024-12-04 01:12:33	2024-12-04 01:13:14
6396	38	82	3	2024-12-04 01:13:14	2024-12-04 01:13:55
6403	38	82	3	2024-12-04 01:13:55	2024-12-04 01:14:36
6410	38	82	3	2024-12-04 01:14:36	2024-12-04 01:15:16
6417	38	82	3	2024-12-04 01:15:16	2024-12-04 01:15:56
6424	38	82	3	2024-12-04 01:15:56	2024-12-04 01:16:37
6431	38	82	3	2024-12-04 01:16:37	2024-12-04 01:17:17
6438	38	82	3	2024-12-04 01:17:17	2024-12-04 01:17:57
6445	38	82	3	2024-12-04 01:17:57	2024-12-04 01:18:38
6452	38	82	3	2024-12-04 01:18:38	2024-12-04 01:19:18
6459	38	82	3	2024-12-04 01:19:18	2024-12-04 01:19:58
6466	38	82	3	2024-12-04 01:19:58	2024-12-04 01:20:39
6473	38	82	3	2024-12-04 01:20:39	2024-12-04 01:21:19
6480	38	82	3	2024-12-04 01:21:19	2024-12-04 01:21:59
6487	38	82	3	2024-12-04 01:21:59	2024-12-04 01:22:40
6494	38	82	3	2024-12-04 01:22:40	2024-12-04 01:23:20
6501	38	82	3	2024-12-04 01:23:20	2024-12-04 01:24:00
6508	38	82	3	2024-12-04 01:24:00	2024-12-04 01:24:41
6515	38	82	3	2024-12-04 01:24:41	2024-12-04 01:25:21
6522	38	82	3	2024-12-04 01:25:21	2024-12-04 01:26:01
6529	38	82	3	2024-12-04 01:26:01	2024-12-04 01:26:42
6536	38	82	3	2024-12-04 01:26:42	2024-12-04 01:27:22
6543	38	82	3	2024-12-04 01:27:22	2024-12-04 01:28:02
6550	38	82	3	2024-12-04 01:28:02	2024-12-04 01:28:43
6557	38	82	3	2024-12-04 01:28:43	2024-12-04 01:29:23
6564	38	82	3	2024-12-04 01:29:23	2024-12-04 01:30:03
6571	38	82	3	2024-12-04 01:30:03	2024-12-04 01:30:44
6578	38	82	3	2024-12-04 01:30:44	2024-12-04 01:31:24
6585	38	82	3	2024-12-04 01:31:24	2024-12-04 01:32:04
6592	38	82	3	2024-12-04 01:32:04	2024-12-04 01:32:45
6599	38	82	3	2024-12-04 01:32:45	2024-12-04 01:33:25
6606	38	82	3	2024-12-04 01:33:25	2024-12-04 01:34:05
6613	38	82	3	2024-12-04 01:34:05	2024-12-04 01:34:46
6620	38	82	3	2024-12-04 01:34:46	2024-12-04 01:35:26
6627	38	82	3	2024-12-04 01:35:26	2024-12-04 01:36:06
6634	38	82	3	2024-12-04 01:36:06	2024-12-04 01:36:47
6641	38	82	3	2024-12-04 01:36:47	2024-12-04 01:37:27
6648	38	82	3	2024-12-04 01:37:27	2024-12-04 01:38:07
6655	38	82	3	2024-12-04 01:38:07	2024-12-04 01:38:48
6662	38	82	3	2024-12-04 01:38:48	2024-12-04 01:39:28
6669	38	82	3	2024-12-04 01:39:28	2024-12-04 01:40:08
6676	38	82	3	2024-12-04 01:40:08	2024-12-04 01:40:49
6683	38	82	3	2024-12-04 01:40:49	2024-12-04 01:41:29
6690	38	82	3	2024-12-04 01:41:29	2024-12-04 01:42:09
6697	38	82	3	2024-12-04 01:42:09	2024-12-04 01:42:50
6704	38	82	3	2024-12-04 01:42:50	2024-12-04 01:43:30
6711	38	82	3	2024-12-04 01:43:30	2024-12-04 01:44:10
6718	38	82	3	2024-12-04 01:44:10	2024-12-04 01:44:50
6725	38	82	3	2024-12-04 01:44:50	2024-12-04 01:45:31
2859	38	82	3	2024-12-03 19:24:54	2024-12-03 19:25:34
2865	38	82	3	2024-12-03 19:25:34	2024-12-03 19:26:14
2871	38	82	3	2024-12-03 19:26:14	2024-12-03 19:26:55
2877	38	82	3	2024-12-03 19:26:55	2024-12-03 19:27:35
2883	38	82	3	2024-12-03 19:27:35	2024-12-03 19:28:15
2889	38	82	3	2024-12-03 19:28:15	2024-12-03 19:28:56
2895	38	82	3	2024-12-03 19:28:56	2024-12-03 19:29:36
2901	38	82	3	2024-12-03 19:29:36	2024-12-03 19:30:16
2907	38	82	3	2024-12-03 19:30:16	2024-12-03 19:30:57
2913	38	82	3	2024-12-03 19:30:57	2024-12-03 19:31:38
6388	38	81	3	2024-12-04 01:12:23	2024-12-04 01:13:04
6395	38	81	3	2024-12-04 01:13:04	2024-12-04 01:13:45
6402	38	81	3	2024-12-04 01:13:45	2024-12-04 01:14:26
6409	38	81	3	2024-12-04 01:14:26	2024-12-04 01:15:07
6416	38	81	3	2024-12-04 01:15:07	2024-12-04 01:15:47
6423	38	81	3	2024-12-04 01:15:47	2024-12-04 01:16:27
6430	38	81	3	2024-12-04 01:16:27	2024-12-04 01:17:08
6437	38	81	3	2024-12-04 01:17:08	2024-12-04 01:17:48
6444	38	81	3	2024-12-04 01:17:48	2024-12-04 01:18:28
6451	38	81	3	2024-12-04 01:18:28	2024-12-04 01:19:09
6458	38	81	3	2024-12-04 01:19:09	2024-12-04 01:19:49
6465	38	81	3	2024-12-04 01:19:49	2024-12-04 01:20:29
6472	38	81	3	2024-12-04 01:20:29	2024-12-04 01:21:10
6479	38	81	3	2024-12-04 01:21:10	2024-12-04 01:21:50
6486	38	81	3	2024-12-04 01:21:50	2024-12-04 01:22:30
6493	38	81	3	2024-12-04 01:22:30	2024-12-04 01:23:11
6500	38	81	3	2024-12-04 01:23:11	2024-12-04 01:23:51
6507	38	81	3	2024-12-04 01:23:51	2024-12-04 01:24:31
6514	38	81	3	2024-12-04 01:24:31	2024-12-04 01:25:12
6521	38	81	3	2024-12-04 01:25:12	2024-12-04 01:25:52
6528	38	81	3	2024-12-04 01:25:52	2024-12-04 01:26:33
6535	38	81	3	2024-12-04 01:26:33	2024-12-04 01:27:13
6542	38	81	3	2024-12-04 01:27:13	2024-12-04 01:27:53
6549	38	81	3	2024-12-04 01:27:53	2024-12-04 01:28:34
6556	38	81	3	2024-12-04 01:28:34	2024-12-04 01:29:14
6563	38	81	3	2024-12-04 01:29:14	2024-12-04 01:29:54
6570	38	81	3	2024-12-04 01:29:54	2024-12-04 01:30:35
6577	38	81	3	2024-12-04 01:30:35	2024-12-04 01:31:15
6584	38	81	3	2024-12-04 01:31:15	2024-12-04 01:31:55
6591	38	81	3	2024-12-04 01:31:55	2024-12-04 01:32:36
6598	38	81	3	2024-12-04 01:32:36	2024-12-04 01:33:16
6605	38	81	3	2024-12-04 01:33:16	2024-12-04 01:33:56
6612	38	81	3	2024-12-04 01:33:56	2024-12-04 01:34:37
6619	38	81	3	2024-12-04 01:34:37	2024-12-04 01:35:17
6626	38	81	3	2024-12-04 01:35:17	2024-12-04 01:35:57
6633	38	81	3	2024-12-04 01:35:57	2024-12-04 01:36:38
6640	38	81	3	2024-12-04 01:36:38	2024-12-04 01:37:18
6647	38	81	3	2024-12-04 01:37:18	2024-12-04 01:37:58
6654	38	81	3	2024-12-04 01:37:58	2024-12-04 01:38:39
6661	38	81	3	2024-12-04 01:38:39	2024-12-04 01:39:19
6668	38	81	3	2024-12-04 01:39:19	2024-12-04 01:39:59
6675	38	81	3	2024-12-04 01:39:59	2024-12-04 01:40:40
6682	38	81	3	2024-12-04 01:40:40	2024-12-04 01:41:20
6689	38	81	3	2024-12-04 01:41:20	2024-12-04 01:42:00
6696	38	81	3	2024-12-04 01:42:00	2024-12-04 01:42:41
6703	38	81	3	2024-12-04 01:42:41	2024-12-04 01:43:21
6710	38	81	3	2024-12-04 01:43:21	2024-12-04 01:44:01
6717	38	81	3	2024-12-04 01:44:01	2024-12-04 01:44:42
6724	38	81	3	2024-12-04 01:44:42	2024-12-04 01:45:22
2860	38	83	3	2024-12-03 19:24:58	2024-12-03 19:25:38
2866	38	83	3	2024-12-03 19:25:38	2024-12-03 19:26:18
2872	38	83	3	2024-12-03 19:26:18	2024-12-03 19:26:59
2878	38	83	3	2024-12-03 19:26:59	2024-12-03 19:27:39
2884	38	83	3	2024-12-03 19:27:39	2024-12-03 19:28:19
2890	38	83	3	2024-12-03 19:28:19	2024-12-03 19:29:00
2896	38	83	3	2024-12-03 19:29:00	2024-12-03 19:29:40
2902	38	83	3	2024-12-03 19:29:40	2024-12-03 19:30:20
2908	38	83	3	2024-12-03 19:30:20	2024-12-03 19:31:01
2914	38	83	3	2024-12-03 19:31:01	2024-12-03 19:31:42
6727	38	83	3	2024-12-04 01:45:00	2024-12-04 01:45:41
6734	38	83	3	2024-12-04 01:45:41	2024-12-04 01:46:21
6741	38	83	3	2024-12-04 01:46:21	2024-12-04 01:47:01
6748	38	83	3	2024-12-04 01:47:01	2024-12-04 01:47:42
6755	38	83	3	2024-12-04 01:47:42	2024-12-04 01:48:22
6762	38	83	3	2024-12-04 01:48:22	2024-12-04 01:49:02
6769	38	83	3	2024-12-04 01:49:02	2024-12-04 01:49:43
6776	38	83	3	2024-12-04 01:49:43	2024-12-04 01:50:23
6783	38	83	3	2024-12-04 01:50:23	2024-12-04 01:51:03
6790	38	83	3	2024-12-04 01:51:03	2024-12-04 01:51:44
6797	38	83	3	2024-12-04 01:51:44	2024-12-04 01:52:24
6804	38	83	3	2024-12-04 01:52:24	2024-12-04 01:53:05
6811	38	83	3	2024-12-04 01:53:05	2024-12-04 01:53:45
6818	38	83	3	2024-12-04 01:53:45	2024-12-04 01:54:25
6825	38	83	3	2024-12-04 01:54:25	2024-12-04 01:55:06
6832	38	83	3	2024-12-04 01:55:06	2024-12-04 01:55:46
6839	38	83	3	2024-12-04 01:55:46	2024-12-04 01:56:26
6846	38	83	3	2024-12-04 01:56:26	2024-12-04 01:57:07
6853	38	83	3	2024-12-04 01:57:07	2024-12-04 01:57:47
6860	38	83	3	2024-12-04 01:57:47	2024-12-04 01:58:27
6867	38	83	3	2024-12-04 01:58:28	2024-12-04 01:59:08
6874	38	83	3	2024-12-04 01:59:08	2024-12-04 01:59:48
6881	38	83	3	2024-12-04 01:59:48	2024-12-04 02:00:29
6888	38	83	3	2024-12-04 02:00:29	2024-12-04 02:01:10
6895	38	83	3	2024-12-04 02:01:10	2024-12-04 02:01:50
6902	38	83	3	2024-12-04 02:01:50	2024-12-04 02:02:30
6909	38	83	3	2024-12-04 02:02:30	2024-12-04 02:03:11
6916	38	83	3	2024-12-04 02:03:11	2024-12-04 02:03:51
6923	38	83	3	2024-12-04 02:03:51	2024-12-04 02:04:31
6930	38	83	3	2024-12-04 02:04:31	2024-12-04 02:05:12
6937	38	83	3	2024-12-04 02:05:12	2024-12-04 02:05:52
6944	38	83	3	2024-12-04 02:05:52	2024-12-04 02:06:33
6951	38	83	3	2024-12-04 02:06:33	2024-12-04 02:07:13
6958	38	83	3	2024-12-04 02:07:13	2024-12-04 02:07:53
6965	38	83	3	2024-12-04 02:07:53	2024-12-04 02:08:34
6972	38	83	3	2024-12-04 02:08:34	2024-12-04 02:09:14
6979	38	83	3	2024-12-04 02:09:14	2024-12-04 02:09:54
6986	38	83	3	2024-12-04 02:09:54	2024-12-04 02:10:35
6993	38	83	3	2024-12-04 02:10:35	2024-12-04 02:11:15
7000	38	83	3	2024-12-04 02:11:15	2024-12-04 02:11:55
7007	38	83	3	2024-12-04 02:11:55	2024-12-04 02:12:36
7014	38	83	3	2024-12-04 02:12:36	2024-12-04 02:13:16
7021	38	83	3	2024-12-04 02:13:16	2024-12-04 02:13:57
7028	38	83	3	2024-12-04 02:13:57	2024-12-04 02:14:37
7035	38	83	3	2024-12-04 02:14:37	2024-12-04 02:15:17
7042	38	83	3	2024-12-04 02:15:17	2024-12-04 02:15:58
7049	38	83	3	2024-12-04 02:15:58	2024-12-04 02:16:38
7056	38	83	3	2024-12-04 02:16:38	2024-12-04 02:17:18
7063	38	83	3	2024-12-04 02:17:18	2024-12-04 02:17:59
7070	38	83	3	2024-12-04 02:17:59	2024-12-04 02:18:39
7077	38	83	3	2024-12-04 02:18:39	2024-12-04 02:19:19
7084	38	83	3	2024-12-04 02:19:19	2024-12-04 02:20:00
2861	38	84	3	2024-12-03 19:25:13	2024-12-03 19:25:54
2867	38	84	3	2024-12-03 19:25:54	2024-12-03 19:26:34
2873	38	84	3	2024-12-03 19:26:34	2024-12-03 19:27:14
2879	38	84	3	2024-12-03 19:27:14	2024-12-03 19:27:55
2885	38	84	3	2024-12-03 19:27:55	2024-12-03 19:28:35
2891	38	84	3	2024-12-03 19:28:35	2024-12-03 19:29:15
2897	38	84	3	2024-12-03 19:29:15	2024-12-03 19:29:56
2903	38	84	3	2024-12-03 19:29:56	2024-12-03 19:30:36
2909	38	84	3	2024-12-03 19:30:36	2024-12-03 19:31:16
2915	38	84	3	2024-12-03 19:31:16	2024-12-03 19:31:57
6728	38	84	3	2024-12-04 01:45:10	2024-12-04 01:45:50
6735	38	84	3	2024-12-04 01:45:50	2024-12-04 01:46:31
6742	38	84	3	2024-12-04 01:46:31	2024-12-04 01:47:11
6749	38	84	3	2024-12-04 01:47:11	2024-12-04 01:47:51
6756	38	84	3	2024-12-04 01:47:51	2024-12-04 01:48:32
6763	38	84	3	2024-12-04 01:48:32	2024-12-04 01:49:12
6770	38	84	3	2024-12-04 01:49:12	2024-12-04 01:49:52
6777	38	84	3	2024-12-04 01:49:52	2024-12-04 01:50:33
6784	38	84	3	2024-12-04 01:50:33	2024-12-04 01:51:13
6791	38	84	3	2024-12-04 01:51:13	2024-12-04 01:51:53
6798	38	84	3	2024-12-04 01:51:53	2024-12-04 01:52:34
6805	38	84	3	2024-12-04 01:52:34	2024-12-04 01:53:14
6812	38	84	3	2024-12-04 01:53:14	2024-12-04 01:53:54
6819	38	84	3	2024-12-04 01:53:54	2024-12-04 01:54:35
6826	38	84	3	2024-12-04 01:54:35	2024-12-04 01:55:15
6833	38	84	3	2024-12-04 01:55:15	2024-12-04 01:55:55
6840	38	84	3	2024-12-04 01:55:55	2024-12-04 01:56:36
6847	38	84	3	2024-12-04 01:56:36	2024-12-04 01:57:16
6854	38	84	3	2024-12-04 01:57:16	2024-12-04 01:57:56
6861	38	84	3	2024-12-04 01:57:56	2024-12-04 01:58:37
6868	38	84	3	2024-12-04 01:58:37	2024-12-04 01:59:17
6875	38	84	3	2024-12-04 01:59:17	2024-12-04 01:59:58
6882	38	84	3	2024-12-04 01:59:58	2024-12-04 02:00:39
6889	38	84	3	2024-12-04 02:00:39	2024-12-04 02:01:19
6896	38	84	3	2024-12-04 02:01:19	2024-12-04 02:01:59
6903	38	84	3	2024-12-04 02:01:59	2024-12-04 02:02:40
6910	38	84	3	2024-12-04 02:02:40	2024-12-04 02:03:20
6917	38	84	3	2024-12-04 02:03:20	2024-12-04 02:04:00
6924	38	84	3	2024-12-04 02:04:00	2024-12-04 02:04:41
6931	38	84	3	2024-12-04 02:04:41	2024-12-04 02:05:21
6938	38	84	3	2024-12-04 02:05:21	2024-12-04 02:06:01
6945	38	84	3	2024-12-04 02:06:01	2024-12-04 02:06:42
6952	38	84	3	2024-12-04 02:06:42	2024-12-04 02:07:22
6959	38	84	3	2024-12-04 02:07:22	2024-12-04 02:08:02
6966	38	84	3	2024-12-04 02:08:02	2024-12-04 02:08:43
6973	38	84	3	2024-12-04 02:08:43	2024-12-04 02:09:23
6980	38	84	3	2024-12-04 02:09:23	2024-12-04 02:10:03
6987	38	84	3	2024-12-04 02:10:03	2024-12-04 02:10:44
6994	38	84	3	2024-12-04 02:10:44	2024-12-04 02:11:24
7001	38	84	3	2024-12-04 02:11:24	2024-12-04 02:12:05
7008	38	84	3	2024-12-04 02:12:05	2024-12-04 02:12:45
7015	38	84	3	2024-12-04 02:12:45	2024-12-04 02:13:25
7022	38	84	3	2024-12-04 02:13:25	2024-12-04 02:14:05
7029	38	84	3	2024-12-04 02:14:05	2024-12-04 02:14:46
7036	38	84	3	2024-12-04 02:14:46	2024-12-04 02:15:26
7043	38	84	3	2024-12-04 02:15:26	2024-12-04 02:16:07
7050	38	84	3	2024-12-04 02:16:07	2024-12-04 02:16:47
7057	38	84	3	2024-12-04 02:16:47	2024-12-04 02:17:27
7064	38	84	3	2024-12-04 02:17:27	2024-12-04 02:18:07
7071	38	84	3	2024-12-04 02:18:07	2024-12-04 02:18:48
7078	38	84	3	2024-12-04 02:18:48	2024-12-04 02:19:28
7085	38	84	3	2024-12-04 02:19:28	2024-12-04 02:20:08
2862	38	87	3	2024-12-03 19:25:21	2024-12-03 19:26:02
2868	38	87	3	2024-12-03 19:26:02	2024-12-03 19:26:42
2874	38	87	3	2024-12-03 19:26:42	2024-12-03 19:27:22
2880	38	87	3	2024-12-03 19:27:22	2024-12-03 19:28:03
2886	38	87	3	2024-12-03 19:28:03	2024-12-03 19:28:43
2892	38	87	3	2024-12-03 19:28:43	2024-12-03 19:29:24
2898	38	87	3	2024-12-03 19:29:24	2024-12-03 19:30:04
2904	38	87	3	2024-12-03 19:30:04	2024-12-03 19:30:44
2910	38	87	3	2024-12-03 19:30:44	2024-12-03 19:31:25
6729	38	87	3	2024-12-04 01:45:18	2024-12-04 01:45:58
6736	38	87	3	2024-12-04 01:45:58	2024-12-04 01:46:39
6743	38	87	3	2024-12-04 01:46:39	2024-12-04 01:47:19
6750	38	87	3	2024-12-04 01:47:19	2024-12-04 01:47:59
6757	38	87	3	2024-12-04 01:47:59	2024-12-04 01:48:40
6764	38	87	3	2024-12-04 01:48:40	2024-12-04 01:49:20
6771	38	87	3	2024-12-04 01:49:20	2024-12-04 01:50:00
6778	38	87	3	2024-12-04 01:50:00	2024-12-04 01:50:41
6785	38	87	3	2024-12-04 01:50:41	2024-12-04 01:51:21
6792	38	87	3	2024-12-04 01:51:21	2024-12-04 01:52:02
6799	38	87	3	2024-12-04 01:52:02	2024-12-04 01:52:42
6806	38	87	3	2024-12-04 01:52:42	2024-12-04 01:53:22
6813	38	87	3	2024-12-04 01:53:22	2024-12-04 01:54:03
6820	38	87	3	2024-12-04 01:54:03	2024-12-04 01:54:43
6827	38	87	3	2024-12-04 01:54:43	2024-12-04 01:55:23
6834	38	87	3	2024-12-04 01:55:23	2024-12-04 01:56:04
6841	38	87	3	2024-12-04 01:56:04	2024-12-04 01:56:44
6848	38	87	3	2024-12-04 01:56:44	2024-12-04 01:57:24
6855	38	87	3	2024-12-04 01:57:24	2024-12-04 01:58:05
6862	38	87	3	2024-12-04 01:58:05	2024-12-04 01:58:45
6869	38	87	3	2024-12-04 01:58:45	2024-12-04 01:59:25
6876	38	87	3	2024-12-04 01:59:25	2024-12-04 02:00:06
6883	38	87	3	2024-12-04 02:00:06	2024-12-04 02:00:47
6890	38	87	3	2024-12-04 02:00:47	2024-12-04 02:01:28
6897	38	87	3	2024-12-04 02:01:28	2024-12-04 02:02:08
6904	38	87	3	2024-12-04 02:02:08	2024-12-04 02:02:48
6911	38	87	3	2024-12-04 02:02:48	2024-12-04 02:03:29
6918	38	87	3	2024-12-04 02:03:29	2024-12-04 02:04:09
6925	38	87	3	2024-12-04 02:04:09	2024-12-04 02:04:49
6932	38	87	3	2024-12-04 02:04:49	2024-12-04 02:05:30
6939	38	87	3	2024-12-04 02:05:30	2024-12-04 02:06:10
6946	38	87	3	2024-12-04 02:06:10	2024-12-04 02:06:50
6953	38	87	3	2024-12-04 02:06:50	2024-12-04 02:07:31
6960	38	87	3	2024-12-04 02:07:31	2024-12-04 02:08:11
6967	38	87	3	2024-12-04 02:08:11	2024-12-04 02:08:51
6974	38	87	3	2024-12-04 02:08:51	2024-12-04 02:09:32
6981	38	87	3	2024-12-04 02:09:32	2024-12-04 02:10:12
6988	38	87	3	2024-12-04 02:10:12	2024-12-04 02:10:52
6995	38	87	3	2024-12-04 02:10:52	2024-12-04 02:11:33
7002	38	87	3	2024-12-04 02:11:33	2024-12-04 02:12:13
7009	38	87	3	2024-12-04 02:12:13	2024-12-04 02:12:53
7016	38	87	3	2024-12-04 02:12:53	2024-12-04 02:13:34
7023	38	87	3	2024-12-04 02:13:34	2024-12-04 02:14:14
7030	38	87	3	2024-12-04 02:14:14	2024-12-04 02:14:54
7037	38	87	3	2024-12-04 02:14:54	2024-12-04 02:15:35
7044	38	87	3	2024-12-04 02:15:35	2024-12-04 02:16:15
7051	38	87	3	2024-12-04 02:16:15	2024-12-04 02:16:55
7058	38	87	3	2024-12-04 02:16:55	2024-12-04 02:17:36
7065	38	87	3	2024-12-04 02:17:36	2024-12-04 02:18:16
7072	38	87	3	2024-12-04 02:18:16	2024-12-04 02:18:56
7079	38	87	3	2024-12-04 02:18:56	2024-12-04 02:19:37
7086	38	87	3	2024-12-04 02:19:37	2024-12-04 02:20:17
2863	38	86	3	2024-12-03 19:25:22	2024-12-03 19:26:02
2869	38	86	3	2024-12-03 19:26:02	2024-12-03 19:26:43
2875	38	86	3	2024-12-03 19:26:43	2024-12-03 19:27:23
2881	38	86	3	2024-12-03 19:27:23	2024-12-03 19:28:03
2887	38	86	3	2024-12-03 19:28:03	2024-12-03 19:28:44
2893	38	86	3	2024-12-03 19:28:44	2024-12-03 19:29:24
2899	38	86	3	2024-12-03 19:29:24	2024-12-03 19:30:04
2905	38	86	3	2024-12-03 19:30:04	2024-12-03 19:30:45
2911	38	86	3	2024-12-03 19:30:45	2024-12-03 19:31:25
2916	38	87	3	2024-12-03 19:31:25	2024-12-03 19:32:06
2917	38	86	3	2024-12-03 19:31:25	2024-12-03 19:32:06
2918	38	81	3	2024-12-03 19:31:29	2024-12-03 19:32:10
2919	38	82	3	2024-12-03 19:31:38	2024-12-03 19:32:18
2920	38	83	3	2024-12-03 19:31:42	2024-12-03 19:32:23
2921	38	84	3	2024-12-03 19:31:57	2024-12-03 19:32:39
2922	38	87	3	2024-12-03 19:32:06	2024-12-03 19:32:47
2923	38	86	3	2024-12-03 19:32:06	2024-12-03 19:32:47
2924	38	81	3	2024-12-03 19:32:10	2024-12-03 19:32:51
2925	38	82	3	2024-12-03 19:32:18	2024-12-03 19:32:59
2926	38	83	3	2024-12-03 19:32:23	2024-12-03 19:33:04
2927	38	84	3	2024-12-03 19:32:39	2024-12-03 19:33:20
2928	38	87	3	2024-12-03 19:32:47	2024-12-03 19:33:28
2929	38	86	3	2024-12-03 19:32:47	2024-12-03 19:33:28
2930	38	81	3	2024-12-03 19:32:51	2024-12-03 19:33:32
2931	38	82	3	2024-12-03 19:32:59	2024-12-03 19:33:40
2932	38	83	3	2024-12-03 19:33:04	2024-12-03 19:33:45
2933	38	84	3	2024-12-03 19:33:20	2024-12-03 19:34:01
2934	38	87	3	2024-12-03 19:33:28	2024-12-03 19:34:09
2935	38	86	3	2024-12-03 19:33:28	2024-12-03 19:34:10
2936	38	81	3	2024-12-03 19:33:32	2024-12-03 19:34:13
2937	38	82	3	2024-12-03 19:33:40	2024-12-03 19:34:21
2938	38	83	3	2024-12-03 19:33:45	2024-12-03 19:34:26
2939	38	84	3	2024-12-03 19:34:01	2024-12-03 19:34:42
2940	38	87	3	2024-12-03 19:34:09	2024-12-03 19:34:50
2941	38	86	3	2024-12-03 19:34:10	2024-12-03 19:34:50
2942	38	81	3	2024-12-03 19:34:13	2024-12-03 19:34:54
2943	38	82	3	2024-12-03 19:34:21	2024-12-03 19:35:02
2944	38	83	3	2024-12-03 19:34:26	2024-12-03 19:35:07
2945	38	84	3	2024-12-03 19:34:42	2024-12-03 19:35:23
2946	38	87	3	2024-12-03 19:34:50	2024-12-03 19:35:31
2947	38	86	3	2024-12-03 19:34:50	2024-12-03 19:35:31
2948	38	81	3	2024-12-03 19:34:54	2024-12-03 19:35:35
2949	38	82	3	2024-12-03 19:35:02	2024-12-03 19:35:43
2950	38	83	3	2024-12-03 19:35:07	2024-12-03 19:35:48
2951	38	84	3	2024-12-03 19:35:23	2024-12-03 19:36:04
2952	38	87	3	2024-12-03 19:35:31	2024-12-03 19:36:12
2953	38	86	3	2024-12-03 19:35:31	2024-12-03 19:36:12
2954	38	81	3	2024-12-03 19:35:35	2024-12-03 19:36:16
2955	38	82	3	2024-12-03 19:35:43	2024-12-03 19:36:24
2956	38	83	3	2024-12-03 19:35:48	2024-12-03 19:36:29
2957	38	84	3	2024-12-03 19:36:04	2024-12-03 19:36:45
2958	38	87	3	2024-12-03 19:36:12	2024-12-03 19:36:53
2959	38	86	3	2024-12-03 19:36:12	2024-12-03 19:36:53
2960	38	81	3	2024-12-03 19:36:16	2024-12-03 19:36:57
2961	38	82	3	2024-12-03 19:36:24	2024-12-03 19:37:05
2962	38	83	3	2024-12-03 19:36:29	2024-12-03 19:37:10
2963	38	84	3	2024-12-03 19:36:45	2024-12-03 19:37:26
2964	38	87	3	2024-12-03 19:36:53	2024-12-03 19:37:34
2965	38	86	3	2024-12-03 19:36:53	2024-12-03 19:37:34
2966	38	81	3	2024-12-03 19:36:57	2024-12-03 19:37:37
2967	38	82	3	2024-12-03 19:37:05	2024-12-03 19:37:45
2968	38	83	3	2024-12-03 19:37:10	2024-12-03 19:37:50
2969	38	84	3	2024-12-03 19:37:26	2024-12-03 19:38:06
2970	38	87	3	2024-12-03 19:37:34	2024-12-03 19:38:14
2971	38	86	3	2024-12-03 19:37:34	2024-12-03 19:38:15
2972	38	81	3	2024-12-03 19:37:37	2024-12-03 19:38:18
2973	38	82	3	2024-12-03 19:37:45	2024-12-03 19:38:26
2974	38	83	3	2024-12-03 19:37:50	2024-12-03 19:38:31
2975	38	84	3	2024-12-03 19:38:06	2024-12-03 19:38:47
2976	38	87	3	2024-12-03 19:38:14	2024-12-03 19:38:55
2977	38	86	3	2024-12-03 19:38:15	2024-12-03 19:38:55
2978	38	81	3	2024-12-03 19:38:18	2024-12-03 19:38:58
2979	38	82	3	2024-12-03 19:38:26	2024-12-03 19:39:06
2980	38	83	3	2024-12-03 19:38:31	2024-12-03 19:39:11
2981	38	84	3	2024-12-03 19:38:47	2024-12-03 19:39:27
2983	38	86	3	2024-12-03 19:38:55	2024-12-03 19:39:35
2982	38	87	3	2024-12-03 19:38:55	2024-12-03 19:39:35
2984	38	81	3	2024-12-03 19:38:58	2024-12-03 19:39:38
2985	38	82	3	2024-12-03 19:39:06	2024-12-03 19:39:46
2986	38	83	3	2024-12-03 19:39:11	2024-12-03 19:39:51
2987	38	84	3	2024-12-03 19:39:27	2024-12-03 19:40:07
2988	38	86	3	2024-12-03 19:39:35	2024-12-03 19:40:15
2989	38	87	3	2024-12-03 19:39:35	2024-12-03 19:40:16
2990	38	81	3	2024-12-03 19:39:38	2024-12-03 19:40:19
2991	38	82	3	2024-12-03 19:39:46	2024-12-03 19:40:27
2992	38	83	3	2024-12-03 19:39:51	2024-12-03 19:40:32
2993	38	84	3	2024-12-03 19:40:07	2024-12-03 19:40:48
2994	38	86	3	2024-12-03 19:40:15	2024-12-03 19:40:56
2995	38	87	3	2024-12-03 19:40:16	2024-12-03 19:40:56
2996	38	81	3	2024-12-03 19:40:19	2024-12-03 19:40:59
2997	38	82	3	2024-12-03 19:40:27	2024-12-03 19:41:07
2998	38	83	3	2024-12-03 19:40:32	2024-12-03 19:41:12
2999	38	84	3	2024-12-03 19:40:48	2024-12-03 19:41:28
3000	38	86	3	2024-12-03 19:40:56	2024-12-03 19:41:36
3001	38	87	3	2024-12-03 19:40:56	2024-12-03 19:41:36
3002	38	81	3	2024-12-03 19:40:59	2024-12-03 19:41:39
3003	38	82	3	2024-12-03 19:41:07	2024-12-03 19:41:47
3004	38	83	3	2024-12-03 19:41:12	2024-12-03 19:41:52
3005	38	84	3	2024-12-03 19:41:28	2024-12-03 19:42:08
3006	38	86	3	2024-12-03 19:41:36	2024-12-03 19:42:16
3007	38	87	3	2024-12-03 19:41:36	2024-12-03 19:42:17
3008	38	81	3	2024-12-03 19:41:39	2024-12-03 19:42:20
3009	38	82	3	2024-12-03 19:41:47	2024-12-03 19:42:28
3010	38	83	3	2024-12-03 19:41:52	2024-12-03 19:42:33
3011	38	84	3	2024-12-03 19:42:08	2024-12-03 19:42:49
3012	38	86	3	2024-12-03 19:42:16	2024-12-03 19:42:57
3013	38	87	3	2024-12-03 19:42:17	2024-12-03 19:42:57
3014	38	81	3	2024-12-03 19:42:20	2024-12-03 19:43:00
3015	38	82	3	2024-12-03 19:42:28	2024-12-03 19:43:08
3016	38	83	3	2024-12-03 19:42:33	2024-12-03 19:43:13
3017	38	84	3	2024-12-03 19:42:49	2024-12-03 19:43:29
3018	38	86	3	2024-12-03 19:42:57	2024-12-03 19:43:37
3019	38	87	3	2024-12-03 19:42:57	2024-12-03 19:43:37
3025	38	87	3	2024-12-03 19:43:37	2024-12-03 19:44:18
3031	38	87	3	2024-12-03 19:44:18	2024-12-03 19:44:58
3037	38	87	3	2024-12-03 19:44:58	2024-12-03 19:45:39
3043	38	87	3	2024-12-03 19:45:39	2024-12-03 19:46:19
3049	38	87	3	2024-12-03 19:46:19	2024-12-03 19:46:59
3055	38	87	3	2024-12-03 19:46:59	2024-12-03 19:47:40
3061	38	87	3	2024-12-03 19:47:40	2024-12-03 19:48:20
3067	38	87	3	2024-12-03 19:48:20	2024-12-03 19:49:00
3073	38	87	3	2024-12-03 19:49:00	2024-12-03 19:49:41
3079	38	87	3	2024-12-03 19:49:41	2024-12-03 19:50:21
3085	38	87	3	2024-12-03 19:50:21	2024-12-03 19:51:02
6731	38	81	3	2024-12-04 01:45:22	2024-12-04 01:46:02
6738	38	81	3	2024-12-04 01:46:02	2024-12-04 01:46:43
6745	38	81	3	2024-12-04 01:46:43	2024-12-04 01:47:23
6752	38	81	3	2024-12-04 01:47:23	2024-12-04 01:48:03
6759	38	81	3	2024-12-04 01:48:03	2024-12-04 01:48:44
6766	38	81	3	2024-12-04 01:48:44	2024-12-04 01:49:24
6773	38	81	3	2024-12-04 01:49:24	2024-12-04 01:50:04
6780	38	81	3	2024-12-04 01:50:04	2024-12-04 01:50:45
6787	38	81	3	2024-12-04 01:50:45	2024-12-04 01:51:25
6794	38	81	3	2024-12-04 01:51:25	2024-12-04 01:52:06
6801	38	81	3	2024-12-04 01:52:06	2024-12-04 01:52:46
6808	38	81	3	2024-12-04 01:52:46	2024-12-04 01:53:26
6815	38	81	3	2024-12-04 01:53:26	2024-12-04 01:54:07
6822	38	81	3	2024-12-04 01:54:07	2024-12-04 01:54:47
6829	38	81	3	2024-12-04 01:54:47	2024-12-04 01:55:27
6836	38	81	3	2024-12-04 01:55:27	2024-12-04 01:56:08
6843	38	81	3	2024-12-04 01:56:08	2024-12-04 01:56:48
6850	38	81	3	2024-12-04 01:56:48	2024-12-04 01:57:28
6857	38	81	3	2024-12-04 01:57:28	2024-12-04 01:58:09
6864	38	81	3	2024-12-04 01:58:09	2024-12-04 01:58:49
6871	38	81	3	2024-12-04 01:58:49	2024-12-04 01:59:29
6878	38	81	3	2024-12-04 01:59:29	2024-12-04 02:00:10
6885	38	81	3	2024-12-04 02:00:10	2024-12-04 02:00:51
6892	38	81	3	2024-12-04 02:00:51	2024-12-04 02:01:31
6899	38	81	3	2024-12-04 02:01:31	2024-12-04 02:02:12
6906	38	81	3	2024-12-04 02:02:12	2024-12-04 02:02:52
6913	38	81	3	2024-12-04 02:02:52	2024-12-04 02:03:32
6920	38	81	3	2024-12-04 02:03:32	2024-12-04 02:04:13
6927	38	81	3	2024-12-04 02:04:13	2024-12-04 02:04:53
6934	38	81	3	2024-12-04 02:04:53	2024-12-04 02:05:34
6941	38	81	3	2024-12-04 02:05:34	2024-12-04 02:06:14
6948	38	81	3	2024-12-04 02:06:14	2024-12-04 02:06:54
6955	38	81	3	2024-12-04 02:06:54	2024-12-04 02:07:35
6962	38	81	3	2024-12-04 02:07:35	2024-12-04 02:08:15
6969	38	81	3	2024-12-04 02:08:15	2024-12-04 02:08:55
6976	38	81	3	2024-12-04 02:08:55	2024-12-04 02:09:36
6983	38	81	3	2024-12-04 02:09:36	2024-12-04 02:10:16
6990	38	81	3	2024-12-04 02:10:16	2024-12-04 02:10:56
6997	38	81	3	2024-12-04 02:10:56	2024-12-04 02:11:37
7004	38	81	3	2024-12-04 02:11:37	2024-12-04 02:12:17
7011	38	81	3	2024-12-04 02:12:17	2024-12-04 02:12:57
7018	38	81	3	2024-12-04 02:12:57	2024-12-04 02:13:38
7025	38	81	3	2024-12-04 02:13:38	2024-12-04 02:14:18
7032	38	81	3	2024-12-04 02:14:18	2024-12-04 02:14:58
7039	38	81	3	2024-12-04 02:14:58	2024-12-04 02:15:38
7046	38	81	3	2024-12-04 02:15:38	2024-12-04 02:16:19
7053	38	81	3	2024-12-04 02:16:19	2024-12-04 02:16:59
7060	38	81	3	2024-12-04 02:16:59	2024-12-04 02:17:39
7067	38	81	3	2024-12-04 02:17:39	2024-12-04 02:18:20
7074	38	81	3	2024-12-04 02:18:20	2024-12-04 02:19:00
7081	38	81	3	2024-12-04 02:19:00	2024-12-04 02:19:40
7088	38	81	3	2024-12-04 02:19:40	2024-12-04 02:20:21
3020	38	81	3	2024-12-03 19:43:00	2024-12-03 19:43:40
3026	38	81	3	2024-12-03 19:43:40	2024-12-03 19:44:21
3032	38	81	3	2024-12-03 19:44:21	2024-12-03 19:45:01
3038	38	81	3	2024-12-03 19:45:01	2024-12-03 19:45:41
3044	38	81	3	2024-12-03 19:45:41	2024-12-03 19:46:22
3050	38	81	3	2024-12-03 19:46:22	2024-12-03 19:47:02
3056	38	81	3	2024-12-03 19:47:02	2024-12-03 19:47:43
3062	38	81	3	2024-12-03 19:47:43	2024-12-03 19:48:23
3068	38	81	3	2024-12-03 19:48:23	2024-12-03 19:49:03
3074	38	81	3	2024-12-03 19:49:03	2024-12-03 19:49:44
3080	38	81	3	2024-12-03 19:49:44	2024-12-03 19:50:24
6732	38	82	3	2024-12-04 01:45:31	2024-12-04 01:46:11
6739	38	82	3	2024-12-04 01:46:11	2024-12-04 01:46:51
6746	38	82	3	2024-12-04 01:46:51	2024-12-04 01:47:32
6753	38	82	3	2024-12-04 01:47:32	2024-12-04 01:48:12
6760	38	82	3	2024-12-04 01:48:12	2024-12-04 01:48:52
6767	38	82	3	2024-12-04 01:48:52	2024-12-04 01:49:33
6774	38	82	3	2024-12-04 01:49:33	2024-12-04 01:50:13
6781	38	82	3	2024-12-04 01:50:13	2024-12-04 01:50:54
6788	38	82	3	2024-12-04 01:50:54	2024-12-04 01:51:34
6795	38	82	3	2024-12-04 01:51:34	2024-12-04 01:52:14
6802	38	82	3	2024-12-04 01:52:14	2024-12-04 01:52:55
6809	38	82	3	2024-12-04 01:52:55	2024-12-04 01:53:35
6816	38	82	3	2024-12-04 01:53:35	2024-12-04 01:54:15
6823	38	82	3	2024-12-04 01:54:15	2024-12-04 01:54:56
6830	38	82	3	2024-12-04 01:54:56	2024-12-04 01:55:36
6837	38	82	3	2024-12-04 01:55:36	2024-12-04 01:56:16
6844	38	82	3	2024-12-04 01:56:16	2024-12-04 01:56:57
6851	38	82	3	2024-12-04 01:56:57	2024-12-04 01:57:37
6858	38	82	3	2024-12-04 01:57:37	2024-12-04 01:58:17
6865	38	82	3	2024-12-04 01:58:17	2024-12-04 01:58:58
6872	38	82	3	2024-12-04 01:58:58	2024-12-04 01:59:38
6879	38	82	3	2024-12-04 01:59:38	2024-12-04 02:00:19
6886	38	82	3	2024-12-04 02:00:19	2024-12-04 02:01:00
6893	38	82	3	2024-12-04 02:01:00	2024-12-04 02:01:40
6900	38	82	3	2024-12-04 02:01:40	2024-12-04 02:02:21
6907	38	82	3	2024-12-04 02:02:21	2024-12-04 02:03:01
6914	38	82	3	2024-12-04 02:03:01	2024-12-04 02:03:42
6921	38	82	3	2024-12-04 02:03:42	2024-12-04 02:04:22
6928	38	82	3	2024-12-04 02:04:22	2024-12-04 02:05:02
6935	38	82	3	2024-12-04 02:05:02	2024-12-04 02:05:43
6942	38	82	3	2024-12-04 02:05:43	2024-12-04 02:06:23
6949	38	82	3	2024-12-04 02:06:23	2024-12-04 02:07:03
6956	38	82	3	2024-12-04 02:07:03	2024-12-04 02:07:44
6963	38	82	3	2024-12-04 02:07:44	2024-12-04 02:08:24
6970	38	82	3	2024-12-04 02:08:24	2024-12-04 02:09:04
6977	38	82	3	2024-12-04 02:09:04	2024-12-04 02:09:45
6984	38	82	3	2024-12-04 02:09:45	2024-12-04 02:10:25
6991	38	82	3	2024-12-04 02:10:25	2024-12-04 02:11:06
6998	38	82	3	2024-12-04 02:11:06	2024-12-04 02:11:46
7005	38	82	3	2024-12-04 02:11:46	2024-12-04 02:12:27
7012	38	82	3	2024-12-04 02:12:27	2024-12-04 02:13:07
7019	38	82	3	2024-12-04 02:13:07	2024-12-04 02:13:47
7026	38	82	3	2024-12-04 02:13:47	2024-12-04 02:14:28
7033	38	82	3	2024-12-04 02:14:28	2024-12-04 02:15:08
7040	38	82	3	2024-12-04 02:15:08	2024-12-04 02:15:48
7047	38	82	3	2024-12-04 02:15:48	2024-12-04 02:16:29
7054	38	82	3	2024-12-04 02:16:29	2024-12-04 02:17:09
7061	38	82	3	2024-12-04 02:17:09	2024-12-04 02:17:49
7068	38	82	3	2024-12-04 02:17:49	2024-12-04 02:18:30
7075	38	82	3	2024-12-04 02:18:30	2024-12-04 02:19:10
7082	38	82	3	2024-12-04 02:19:10	2024-12-04 02:19:50
7089	38	82	3	2024-12-04 02:19:50	2024-12-04 02:20:31
3021	38	82	3	2024-12-03 19:43:08	2024-12-03 19:43:48
3027	38	82	3	2024-12-03 19:43:48	2024-12-03 19:44:29
3033	38	82	3	2024-12-03 19:44:29	2024-12-03 19:45:09
3039	38	82	3	2024-12-03 19:45:09	2024-12-03 19:45:49
3045	38	82	3	2024-12-03 19:45:49	2024-12-03 19:46:30
3051	38	82	3	2024-12-03 19:46:30	2024-12-03 19:47:10
3057	38	82	3	2024-12-03 19:47:10	2024-12-03 19:47:50
3063	38	82	3	2024-12-03 19:47:50	2024-12-03 19:48:31
3069	38	82	3	2024-12-03 19:48:31	2024-12-03 19:49:11
3075	38	82	3	2024-12-03 19:49:11	2024-12-03 19:49:51
3081	38	82	3	2024-12-03 19:49:51	2024-12-03 19:50:32
6733	38	88	3	2024-12-04 01:45:33	2024-12-04 01:46:14
6740	38	88	3	2024-12-04 01:46:14	2024-12-04 01:46:54
6747	38	88	3	2024-12-04 01:46:54	2024-12-04 01:47:34
6754	38	88	3	2024-12-04 01:47:34	2024-12-04 01:48:15
6761	38	88	3	2024-12-04 01:48:15	2024-12-04 01:48:55
6768	38	88	3	2024-12-04 01:48:55	2024-12-04 01:49:35
6775	38	88	3	2024-12-04 01:49:35	2024-12-04 01:50:16
6782	38	88	3	2024-12-04 01:50:16	2024-12-04 01:50:56
6789	38	88	3	2024-12-04 01:50:56	2024-12-04 01:51:36
6796	38	88	3	2024-12-04 01:51:36	2024-12-04 01:52:17
6803	38	88	3	2024-12-04 01:52:17	2024-12-04 01:52:57
6810	38	88	3	2024-12-04 01:52:57	2024-12-04 01:53:37
6817	38	88	3	2024-12-04 01:53:37	2024-12-04 01:54:18
6824	38	88	3	2024-12-04 01:54:18	2024-12-04 01:54:58
6831	38	88	3	2024-12-04 01:54:58	2024-12-04 01:55:38
6838	38	88	3	2024-12-04 01:55:38	2024-12-04 01:56:19
6845	38	88	3	2024-12-04 01:56:19	2024-12-04 01:56:59
6852	38	88	3	2024-12-04 01:56:59	2024-12-04 01:57:39
6859	38	88	3	2024-12-04 01:57:39	2024-12-04 01:58:20
6866	38	88	3	2024-12-04 01:58:20	2024-12-04 01:59:00
6873	38	88	3	2024-12-04 01:59:00	2024-12-04 01:59:41
6880	38	88	3	2024-12-04 01:59:41	2024-12-04 02:00:22
6887	38	88	3	2024-12-04 02:00:22	2024-12-04 02:01:03
6894	38	88	3	2024-12-04 02:01:03	2024-12-04 02:01:43
6901	38	88	3	2024-12-04 02:01:43	2024-12-04 02:02:23
6908	38	88	3	2024-12-04 02:02:23	2024-12-04 02:03:03
6915	38	88	3	2024-12-04 02:03:03	2024-12-04 02:03:44
6922	38	88	3	2024-12-04 02:03:44	2024-12-04 02:04:24
6929	38	88	3	2024-12-04 02:04:24	2024-12-04 02:05:04
6936	38	88	3	2024-12-04 02:05:04	2024-12-04 02:05:45
6943	38	88	3	2024-12-04 02:05:45	2024-12-04 02:06:25
6950	38	88	3	2024-12-04 02:06:25	2024-12-04 02:07:05
6957	38	88	3	2024-12-04 02:07:05	2024-12-04 02:07:46
6964	38	88	3	2024-12-04 02:07:46	2024-12-04 02:08:26
6971	38	88	3	2024-12-04 02:08:26	2024-12-04 02:09:06
6978	38	88	3	2024-12-04 02:09:06	2024-12-04 02:09:47
6985	38	88	3	2024-12-04 02:09:47	2024-12-04 02:10:27
6992	38	88	3	2024-12-04 02:10:27	2024-12-04 02:11:07
6999	38	88	3	2024-12-04 02:11:07	2024-12-04 02:11:48
7006	38	88	3	2024-12-04 02:11:48	2024-12-04 02:12:28
7013	38	88	3	2024-12-04 02:12:28	2024-12-04 02:13:08
7020	38	88	3	2024-12-04 02:13:08	2024-12-04 02:13:49
7027	38	88	3	2024-12-04 02:13:49	2024-12-04 02:14:29
7034	38	88	3	2024-12-04 02:14:29	2024-12-04 02:15:09
7041	38	88	3	2024-12-04 02:15:09	2024-12-04 02:15:49
7048	38	88	3	2024-12-04 02:15:49	2024-12-04 02:16:30
7055	38	88	3	2024-12-04 02:16:30	2024-12-04 02:17:10
7062	38	88	3	2024-12-04 02:17:10	2024-12-04 02:17:50
7069	38	88	3	2024-12-04 02:17:50	2024-12-04 02:18:31
7076	38	88	3	2024-12-04 02:18:31	2024-12-04 02:19:12
7083	38	88	3	2024-12-04 02:19:12	2024-12-04 02:19:52
7090	38	88	3	2024-12-04 02:19:52	2024-12-04 02:20:32
3022	38	83	3	2024-12-03 19:43:13	2024-12-03 19:43:53
3028	38	83	3	2024-12-03 19:43:53	2024-12-03 19:44:34
3034	38	83	3	2024-12-03 19:44:34	2024-12-03 19:45:14
3040	38	83	3	2024-12-03 19:45:14	2024-12-03 19:45:54
3046	38	83	3	2024-12-03 19:45:54	2024-12-03 19:46:35
3052	38	83	3	2024-12-03 19:46:35	2024-12-03 19:47:15
3058	38	83	3	2024-12-03 19:47:15	2024-12-03 19:47:56
3064	38	83	3	2024-12-03 19:47:56	2024-12-03 19:48:36
3070	38	83	3	2024-12-03 19:48:36	2024-12-03 19:49:16
3076	38	83	3	2024-12-03 19:49:16	2024-12-03 19:49:57
3082	38	83	3	2024-12-03 19:49:57	2024-12-03 19:50:37
6730	38	86	3	2024-12-04 01:45:21	2024-12-04 01:46:01
6737	38	86	3	2024-12-04 01:46:01	2024-12-04 01:46:41
6744	38	86	3	2024-12-04 01:46:41	2024-12-04 01:47:22
6751	38	86	3	2024-12-04 01:47:22	2024-12-04 01:48:02
6758	38	86	3	2024-12-04 01:48:02	2024-12-04 01:48:42
6765	38	86	3	2024-12-04 01:48:42	2024-12-04 01:49:23
6772	38	86	3	2024-12-04 01:49:23	2024-12-04 01:50:03
6779	38	86	3	2024-12-04 01:50:03	2024-12-04 01:50:43
6786	38	86	3	2024-12-04 01:50:43	2024-12-04 01:51:24
6793	38	86	3	2024-12-04 01:51:24	2024-12-04 01:52:04
6800	38	86	3	2024-12-04 01:52:04	2024-12-04 01:52:44
6807	38	86	3	2024-12-04 01:52:44	2024-12-04 01:53:25
6814	38	86	3	2024-12-04 01:53:25	2024-12-04 01:54:05
6821	38	86	3	2024-12-04 01:54:05	2024-12-04 01:54:45
6828	38	86	3	2024-12-04 01:54:45	2024-12-04 01:55:26
6835	38	86	3	2024-12-04 01:55:26	2024-12-04 01:56:06
6842	38	86	3	2024-12-04 01:56:06	2024-12-04 01:56:46
6849	38	86	3	2024-12-04 01:56:46	2024-12-04 01:57:26
6856	38	86	3	2024-12-04 01:57:26	2024-12-04 01:58:07
6863	38	86	3	2024-12-04 01:58:07	2024-12-04 01:58:47
6870	38	86	3	2024-12-04 01:58:47	2024-12-04 01:59:27
6877	38	86	3	2024-12-04 01:59:27	2024-12-04 02:00:08
6884	38	86	3	2024-12-04 02:00:08	2024-12-04 02:00:49
6891	38	86	3	2024-12-04 02:00:49	2024-12-04 02:01:30
6898	38	86	3	2024-12-04 02:01:30	2024-12-04 02:02:10
6905	38	86	3	2024-12-04 02:02:10	2024-12-04 02:02:50
6912	38	86	3	2024-12-04 02:02:50	2024-12-04 02:03:31
6919	38	86	3	2024-12-04 02:03:31	2024-12-04 02:04:11
6926	38	86	3	2024-12-04 02:04:11	2024-12-04 02:04:52
6933	38	86	3	2024-12-04 02:04:52	2024-12-04 02:05:32
6940	38	86	3	2024-12-04 02:05:32	2024-12-04 02:06:12
6947	38	86	3	2024-12-04 02:06:12	2024-12-04 02:06:53
6954	38	86	3	2024-12-04 02:06:53	2024-12-04 02:07:33
6961	38	86	3	2024-12-04 02:07:33	2024-12-04 02:08:13
6968	38	86	3	2024-12-04 02:08:13	2024-12-04 02:08:54
6975	38	86	3	2024-12-04 02:08:54	2024-12-04 02:09:34
6982	38	86	3	2024-12-04 02:09:34	2024-12-04 02:10:14
6989	38	86	3	2024-12-04 02:10:14	2024-12-04 02:10:55
6996	38	86	3	2024-12-04 02:10:55	2024-12-04 02:11:35
7003	38	86	3	2024-12-04 02:11:35	2024-12-04 02:12:16
7010	38	86	3	2024-12-04 02:12:16	2024-12-04 02:12:56
7017	38	86	3	2024-12-04 02:12:56	2024-12-04 02:13:36
7024	38	86	3	2024-12-04 02:13:36	2024-12-04 02:14:17
7031	38	86	3	2024-12-04 02:14:17	2024-12-04 02:14:57
7038	38	86	3	2024-12-04 02:14:57	2024-12-04 02:15:38
7045	38	86	3	2024-12-04 02:15:38	2024-12-04 02:16:18
7052	38	86	3	2024-12-04 02:16:18	2024-12-04 02:16:58
7059	38	86	3	2024-12-04 02:16:58	2024-12-04 02:17:39
7066	38	86	3	2024-12-04 02:17:39	2024-12-04 02:18:19
7073	38	86	3	2024-12-04 02:18:19	2024-12-04 02:18:59
7080	38	86	3	2024-12-04 02:18:59	2024-12-04 02:19:40
7087	38	86	3	2024-12-04 02:19:40	2024-12-04 02:20:20
3023	38	84	3	2024-12-03 19:43:29	2024-12-03 19:44:09
3029	38	84	3	2024-12-03 19:44:09	2024-12-03 19:44:50
3035	38	84	3	2024-12-03 19:44:50	2024-12-03 19:45:30
3041	38	84	3	2024-12-03 19:45:30	2024-12-03 19:46:11
3047	38	84	3	2024-12-03 19:46:11	2024-12-03 19:46:51
3053	38	84	3	2024-12-03 19:46:51	2024-12-03 19:47:31
3059	38	84	3	2024-12-03 19:47:31	2024-12-03 19:48:12
3065	38	84	3	2024-12-03 19:48:12	2024-12-03 19:48:52
3071	38	84	3	2024-12-03 19:48:52	2024-12-03 19:49:32
3077	38	84	3	2024-12-03 19:49:32	2024-12-03 19:50:13
3083	38	84	3	2024-12-03 19:50:13	2024-12-03 19:50:53
7091	38	83	3	2024-12-04 02:20:00	2024-12-04 02:20:40
7098	38	83	3	2024-12-04 02:20:40	2024-12-04 02:21:20
7105	38	83	3	2024-12-04 02:21:20	2024-12-04 02:22:01
7112	38	83	3	2024-12-04 02:22:01	2024-12-04 02:22:41
7119	38	83	3	2024-12-04 02:22:41	2024-12-04 02:23:22
7126	38	83	3	2024-12-04 02:23:22	2024-12-04 02:24:02
7133	38	83	3	2024-12-04 02:24:02	2024-12-04 02:24:42
7140	38	83	3	2024-12-04 02:24:42	2024-12-04 02:25:23
7147	38	83	3	2024-12-04 02:25:23	2024-12-04 02:26:03
7154	38	83	3	2024-12-04 02:26:03	2024-12-04 02:26:43
7161	38	83	3	2024-12-04 02:26:43	2024-12-04 02:27:24
7168	38	83	3	2024-12-04 02:27:24	2024-12-04 02:28:04
7175	38	83	3	2024-12-04 02:28:04	2024-12-04 02:28:44
7182	38	83	3	2024-12-04 02:28:44	2024-12-04 02:29:25
7189	38	83	3	2024-12-04 02:29:25	2024-12-04 02:30:05
7196	38	83	3	2024-12-04 02:30:05	2024-12-04 02:30:45
7203	38	83	3	2024-12-04 02:30:45	2024-12-04 02:31:26
7210	38	83	3	2024-12-04 02:31:26	2024-12-04 02:32:06
7217	38	83	3	2024-12-04 02:32:06	2024-12-04 02:32:46
7224	38	83	3	2024-12-04 02:32:46	2024-12-04 02:33:27
7231	38	83	3	2024-12-04 02:33:27	2024-12-04 02:34:07
7238	38	83	3	2024-12-04 02:34:07	2024-12-04 02:34:48
7245	38	83	3	2024-12-04 02:34:48	2024-12-04 02:35:29
7252	38	83	3	2024-12-04 02:35:29	2024-12-04 02:36:10
7259	38	83	3	2024-12-04 02:36:10	2024-12-04 02:36:51
7266	38	83	3	2024-12-04 02:36:51	2024-12-04 02:37:32
7273	38	83	3	2024-12-04 02:37:32	2024-12-04 02:38:12
7280	38	83	3	2024-12-04 02:38:12	2024-12-04 02:38:52
7287	38	83	3	2024-12-04 02:38:52	2024-12-04 02:39:33
7294	38	83	3	2024-12-04 02:39:33	2024-12-04 02:40:13
7301	38	83	3	2024-12-04 02:40:13	2024-12-04 02:40:53
7308	38	83	3	2024-12-04 02:40:53	2024-12-04 02:41:34
7315	38	83	3	2024-12-04 02:41:34	2024-12-04 02:42:14
7322	38	83	3	2024-12-04 02:42:14	2024-12-04 02:42:55
7329	38	83	3	2024-12-04 02:42:55	2024-12-04 02:43:35
7336	38	83	3	2024-12-04 02:43:35	2024-12-04 02:44:16
7343	38	83	3	2024-12-04 02:44:16	2024-12-04 02:44:57
7350	38	83	3	2024-12-04 02:44:57	2024-12-04 02:45:38
7357	38	83	3	2024-12-04 02:45:38	2024-12-04 02:46:19
7364	38	83	3	2024-12-04 02:46:19	2024-12-04 02:47:00
7371	38	83	3	2024-12-04 02:47:00	2024-12-04 02:47:40
7378	38	83	3	2024-12-04 02:47:40	2024-12-04 02:48:21
7385	38	83	3	2024-12-04 02:48:21	2024-12-04 02:49:02
7392	38	83	3	2024-12-04 02:49:02	2024-12-04 02:49:42
7399	38	83	3	2024-12-04 02:49:42	2024-12-04 02:50:22
7406	38	83	3	2024-12-04 02:50:22	2024-12-04 02:51:03
7413	38	83	3	2024-12-04 02:51:03	2024-12-04 02:51:43
7420	38	83	3	2024-12-04 02:51:43	2024-12-04 02:52:23
7427	38	83	3	2024-12-04 02:52:23	2024-12-04 02:53:04
7434	38	83	3	2024-12-04 02:53:04	2024-12-04 02:53:44
7441	38	83	3	2024-12-04 02:53:44	2024-12-04 02:54:26
7448	38	83	3	2024-12-04 02:54:26	2024-12-04 02:55:07
7455	38	83	3	2024-12-04 02:55:07	2024-12-04 02:55:48
7462	38	83	3	2024-12-04 02:55:48	2024-12-04 02:56:29
7469	38	83	3	2024-12-04 02:56:29	2024-12-04 02:57:09
3024	38	86	3	2024-12-03 19:43:37	2024-12-03 19:44:17
3030	38	86	3	2024-12-03 19:44:17	2024-12-03 19:44:58
3036	38	86	3	2024-12-03 19:44:58	2024-12-03 19:45:38
3042	38	86	3	2024-12-03 19:45:38	2024-12-03 19:46:18
3048	38	86	3	2024-12-03 19:46:18	2024-12-03 19:46:59
3054	38	86	3	2024-12-03 19:46:59	2024-12-03 19:47:39
3060	38	86	3	2024-12-03 19:47:39	2024-12-03 19:48:19
3066	38	86	3	2024-12-03 19:48:19	2024-12-03 19:49:00
3072	38	86	3	2024-12-03 19:49:00	2024-12-03 19:49:40
3078	38	86	3	2024-12-03 19:49:40	2024-12-03 19:50:20
3084	38	86	3	2024-12-03 19:50:20	2024-12-03 19:51:01
3086	38	81	3	2024-12-03 19:50:24	2024-12-03 19:51:04
3087	38	82	3	2024-12-03 19:50:32	2024-12-03 19:51:12
3088	38	83	3	2024-12-03 19:50:37	2024-12-03 19:51:17
3089	38	84	3	2024-12-03 19:50:53	2024-12-03 19:51:34
3090	38	86	3	2024-12-03 19:51:01	2024-12-03 19:51:42
3091	38	87	3	2024-12-03 19:51:02	2024-12-03 19:51:42
3092	38	81	3	2024-12-03 19:51:04	2024-12-03 19:51:45
3093	38	82	3	2024-12-03 19:51:12	2024-12-03 19:51:53
3094	38	83	3	2024-12-03 19:51:17	2024-12-03 19:51:58
3095	38	84	3	2024-12-03 19:51:34	2024-12-03 19:52:15
3096	38	86	3	2024-12-03 19:51:42	2024-12-03 19:52:23
3097	38	87	3	2024-12-03 19:51:42	2024-12-03 19:52:23
3098	38	81	3	2024-12-03 19:51:45	2024-12-03 19:52:26
3099	38	82	3	2024-12-03 19:51:53	2024-12-03 19:52:34
3100	38	83	3	2024-12-03 19:51:58	2024-12-03 19:52:39
3101	38	84	3	2024-12-03 19:52:15	2024-12-03 19:52:56
3102	38	86	3	2024-12-03 19:52:23	2024-12-03 19:53:04
3103	38	87	3	2024-12-03 19:52:23	2024-12-03 19:53:04
3104	38	81	3	2024-12-03 19:52:26	2024-12-03 19:53:08
3105	38	82	3	2024-12-03 19:52:34	2024-12-03 19:53:15
3106	38	83	3	2024-12-03 19:52:39	2024-12-03 19:53:20
3107	38	84	3	2024-12-03 19:52:56	2024-12-03 19:53:37
3108	38	86	3	2024-12-03 19:53:04	2024-12-03 19:53:44
3109	38	87	3	2024-12-03 19:53:04	2024-12-03 19:53:45
3110	38	81	3	2024-12-03 19:53:08	2024-12-03 19:53:49
3111	38	82	3	2024-12-03 19:53:15	2024-12-03 19:53:56
3112	38	83	3	2024-12-03 19:53:20	2024-12-03 19:54:01
3113	38	84	3	2024-12-03 19:53:37	2024-12-03 19:54:17
3114	38	86	3	2024-12-03 19:53:44	2024-12-03 19:54:25
3115	38	87	3	2024-12-03 19:53:45	2024-12-03 19:54:26
3116	38	81	3	2024-12-03 19:53:49	2024-12-03 19:54:29
3117	38	82	3	2024-12-03 19:53:56	2024-12-03 19:54:36
3118	38	83	3	2024-12-03 19:54:01	2024-12-03 19:54:42
3119	38	84	3	2024-12-03 19:54:17	2024-12-03 19:54:58
3120	38	86	3	2024-12-03 19:54:25	2024-12-03 19:55:05
3121	38	87	3	2024-12-03 19:54:26	2024-12-03 19:55:06
3122	38	81	3	2024-12-03 19:54:29	2024-12-03 19:55:10
3123	38	82	3	2024-12-03 19:54:36	2024-12-03 19:55:17
3124	38	83	3	2024-12-03 19:54:42	2024-12-03 19:55:22
3125	38	84	3	2024-12-03 19:54:58	2024-12-03 19:55:38
3126	38	86	3	2024-12-03 19:55:05	2024-12-03 19:55:45
3127	38	87	3	2024-12-03 19:55:06	2024-12-03 19:55:46
3128	38	81	3	2024-12-03 19:55:10	2024-12-03 19:55:50
3129	38	82	3	2024-12-03 19:55:17	2024-12-03 19:55:57
3130	38	83	3	2024-12-03 19:55:22	2024-12-03 19:56:02
3131	38	84	3	2024-12-03 19:55:38	2024-12-03 19:56:19
3132	38	86	3	2024-12-03 19:55:45	2024-12-03 19:56:26
3133	38	87	3	2024-12-03 19:55:46	2024-12-03 19:56:27
3134	38	81	3	2024-12-03 19:55:50	2024-12-03 19:56:30
3135	38	82	3	2024-12-03 19:55:57	2024-12-03 19:56:37
3136	38	83	3	2024-12-03 19:56:02	2024-12-03 19:56:43
3137	38	84	3	2024-12-03 19:56:19	2024-12-03 19:56:59
3138	38	86	3	2024-12-03 19:56:26	2024-12-03 19:57:06
3139	38	87	3	2024-12-03 19:56:27	2024-12-03 19:57:07
3140	38	81	3	2024-12-03 19:56:30	2024-12-03 19:57:11
3141	38	82	3	2024-12-03 19:56:37	2024-12-03 19:57:18
3142	38	83	3	2024-12-03 19:56:43	2024-12-03 19:57:23
3143	38	84	3	2024-12-03 19:56:59	2024-12-03 19:57:39
3144	38	86	3	2024-12-03 19:57:06	2024-12-03 19:57:46
3145	38	87	3	2024-12-03 19:57:07	2024-12-03 19:57:48
3146	38	81	3	2024-12-03 19:57:11	2024-12-03 19:57:51
3147	38	82	3	2024-12-03 19:57:18	2024-12-03 19:57:58
3148	38	83	3	2024-12-03 19:57:23	2024-12-03 19:58:03
3149	38	84	3	2024-12-03 19:57:39	2024-12-03 19:58:20
3150	38	86	3	2024-12-03 19:57:46	2024-12-03 19:58:27
3151	38	87	3	2024-12-03 19:57:48	2024-12-03 19:58:28
3152	38	81	3	2024-12-03 19:57:51	2024-12-03 19:58:31
3153	38	82	3	2024-12-03 19:57:58	2024-12-03 19:58:38
3154	38	83	3	2024-12-03 19:58:03	2024-12-03 19:58:44
3155	38	84	3	2024-12-03 19:58:20	2024-12-03 19:59:00
3156	38	86	3	2024-12-03 19:58:27	2024-12-03 19:59:07
3157	38	87	3	2024-12-03 19:58:28	2024-12-03 19:59:08
3158	38	81	3	2024-12-03 19:58:31	2024-12-03 19:59:12
3159	38	82	3	2024-12-03 19:58:38	2024-12-03 19:59:18
3160	38	83	3	2024-12-03 19:58:44	2024-12-03 19:59:24
3161	38	84	3	2024-12-03 19:59:00	2024-12-03 19:59:41
3162	38	86	3	2024-12-03 19:59:07	2024-12-03 19:59:48
3163	38	87	3	2024-12-03 19:59:08	2024-12-03 19:59:49
3164	38	81	3	2024-12-03 19:59:12	2024-12-03 19:59:52
3165	38	82	3	2024-12-03 19:59:18	2024-12-03 19:59:59
3166	38	83	3	2024-12-03 19:59:24	2024-12-03 20:00:04
3167	38	84	3	2024-12-03 19:59:41	2024-12-03 20:00:21
3168	38	86	3	2024-12-03 19:59:48	2024-12-03 20:00:28
3169	38	87	3	2024-12-03 19:59:49	2024-12-03 20:00:29
3170	38	81	3	2024-12-03 19:59:52	2024-12-03 20:00:33
3171	38	82	3	2024-12-03 19:59:59	2024-12-03 20:00:39
3172	38	83	3	2024-12-03 20:00:04	2024-12-03 20:00:45
3173	38	84	3	2024-12-03 20:00:21	2024-12-03 20:01:01
3174	38	86	3	2024-12-03 20:00:28	2024-12-03 20:01:08
3175	38	87	3	2024-12-03 20:00:29	2024-12-03 20:01:09
3176	38	81	3	2024-12-03 20:00:33	2024-12-03 20:01:13
3177	38	82	3	2024-12-03 20:00:39	2024-12-03 20:01:19
3178	38	83	3	2024-12-03 20:00:45	2024-12-03 20:01:25
3179	38	84	3	2024-12-03 20:01:01	2024-12-03 20:01:42
3180	38	86	3	2024-12-03 20:01:08	2024-12-03 20:01:49
3181	38	87	3	2024-12-03 20:01:09	2024-12-03 20:01:50
3182	38	81	3	2024-12-03 20:01:13	2024-12-03 20:01:53
3183	38	82	3	2024-12-03 20:01:19	2024-12-03 20:02:00
3184	38	83	3	2024-12-03 20:01:25	2024-12-03 20:02:06
3185	38	84	3	2024-12-03 20:01:42	2024-12-03 20:02:22
3186	38	86	3	2024-12-03 20:01:49	2024-12-03 20:02:29
3187	38	87	3	2024-12-03 20:01:50	2024-12-03 20:02:30
3193	38	87	3	2024-12-03 20:02:30	2024-12-03 20:03:10
3199	38	87	3	2024-12-03 20:03:10	2024-12-03 20:03:51
3205	38	87	3	2024-12-03 20:03:51	2024-12-03 20:04:31
3211	38	87	3	2024-12-03 20:04:31	2024-12-03 20:05:11
3217	38	87	3	2024-12-03 20:05:11	2024-12-03 20:05:52
3223	38	87	3	2024-12-03 20:05:52	2024-12-03 20:06:33
3229	38	87	3	2024-12-03 20:06:33	2024-12-03 20:07:14
3235	38	87	3	2024-12-03 20:07:14	2024-12-03 20:07:55
3241	38	87	3	2024-12-03 20:07:55	2024-12-03 20:08:36
3247	38	87	3	2024-12-03 20:08:36	2024-12-03 20:09:17
3253	38	87	3	2024-12-03 20:09:17	2024-12-03 20:09:57
3259	38	87	3	2024-12-03 20:09:57	2024-12-03 20:10:38
3265	38	87	3	2024-12-03 20:10:38	2024-12-03 20:11:18
3271	38	87	3	2024-12-03 20:11:18	2024-12-03 20:11:58
7093	38	87	3	2024-12-04 02:20:17	2024-12-04 02:20:57
7100	38	87	3	2024-12-04 02:20:57	2024-12-04 02:21:38
7107	38	87	3	2024-12-04 02:21:38	2024-12-04 02:22:18
7114	38	87	3	2024-12-04 02:22:18	2024-12-04 02:22:58
7121	38	87	3	2024-12-04 02:22:58	2024-12-04 02:23:38
7128	38	87	3	2024-12-04 02:23:38	2024-12-04 02:24:19
7135	38	87	3	2024-12-04 02:24:19	2024-12-04 02:24:59
7142	38	87	3	2024-12-04 02:24:59	2024-12-04 02:25:39
7149	38	87	3	2024-12-04 02:25:39	2024-12-04 02:26:20
7156	38	87	3	2024-12-04 02:26:20	2024-12-04 02:27:00
7163	38	87	3	2024-12-04 02:27:00	2024-12-04 02:27:40
7170	38	87	3	2024-12-04 02:27:40	2024-12-04 02:28:21
7177	38	87	3	2024-12-04 02:28:21	2024-12-04 02:29:01
7184	38	87	3	2024-12-04 02:29:01	2024-12-04 02:29:41
7191	38	87	3	2024-12-04 02:29:41	2024-12-04 02:30:22
7198	38	87	3	2024-12-04 02:30:22	2024-12-04 02:31:02
7205	38	87	3	2024-12-04 02:31:02	2024-12-04 02:31:42
7212	38	87	3	2024-12-04 02:31:42	2024-12-04 02:32:23
7219	38	87	3	2024-12-04 02:32:23	2024-12-04 02:33:03
7226	38	87	3	2024-12-04 02:33:03	2024-12-04 02:33:43
7233	38	87	3	2024-12-04 02:33:43	2024-12-04 02:34:24
7240	38	87	3	2024-12-04 02:34:24	2024-12-04 02:35:05
7247	38	87	3	2024-12-04 02:35:05	2024-12-04 02:35:46
7254	38	87	3	2024-12-04 02:35:46	2024-12-04 02:36:27
7261	38	87	3	2024-12-04 02:36:27	2024-12-04 02:37:08
7268	38	87	3	2024-12-04 02:37:08	2024-12-04 02:37:49
7275	38	87	3	2024-12-04 02:37:49	2024-12-04 02:38:29
7282	38	87	3	2024-12-04 02:38:29	2024-12-04 02:39:10
7289	38	87	3	2024-12-04 02:39:10	2024-12-04 02:39:50
7296	38	87	3	2024-12-04 02:39:50	2024-12-04 02:40:30
7303	38	87	3	2024-12-04 02:40:30	2024-12-04 02:41:11
7310	38	87	3	2024-12-04 02:41:11	2024-12-04 02:41:51
7317	38	87	3	2024-12-04 02:41:51	2024-12-04 02:42:31
7324	38	87	3	2024-12-04 02:42:31	2024-12-04 02:43:12
7331	38	87	3	2024-12-04 02:43:12	2024-12-04 02:43:53
7338	38	87	3	2024-12-04 02:43:53	2024-12-04 02:44:34
7345	38	87	3	2024-12-04 02:44:34	2024-12-04 02:45:14
7352	38	87	3	2024-12-04 02:45:14	2024-12-04 02:45:55
7359	38	87	3	2024-12-04 02:45:55	2024-12-04 02:46:36
7366	38	87	3	2024-12-04 02:46:36	2024-12-04 02:47:17
7373	38	87	3	2024-12-04 02:47:17	2024-12-04 02:47:58
7380	38	87	3	2024-12-04 02:47:58	2024-12-04 02:48:39
7387	38	87	3	2024-12-04 02:48:39	2024-12-04 02:49:19
7394	38	87	3	2024-12-04 02:49:19	2024-12-04 02:50:00
7401	38	87	3	2024-12-04 02:50:00	2024-12-04 02:50:40
7408	38	87	3	2024-12-04 02:50:40	2024-12-04 02:51:20
7415	38	87	3	2024-12-04 02:51:20	2024-12-04 02:52:01
7422	38	87	3	2024-12-04 02:52:01	2024-12-04 02:52:41
7429	38	87	3	2024-12-04 02:52:41	2024-12-04 02:53:21
7436	38	87	3	2024-12-04 02:53:21	2024-12-04 02:54:02
7443	38	87	3	2024-12-04 02:54:02	2024-12-04 02:54:43
7450	38	87	3	2024-12-04 02:54:43	2024-12-04 02:55:24
7457	38	87	3	2024-12-04 02:55:24	2024-12-04 02:56:05
7464	38	87	3	2024-12-04 02:56:05	2024-12-04 02:56:46
7471	38	87	3	2024-12-04 02:56:46	2024-12-04 02:57:26
3188	38	81	3	2024-12-03 20:01:53	2024-12-03 20:02:34
3194	38	81	3	2024-12-03 20:02:34	2024-12-03 20:03:14
3200	38	81	3	2024-12-03 20:03:14	2024-12-03 20:03:54
3206	38	81	3	2024-12-03 20:03:54	2024-12-03 20:04:35
3212	38	81	3	2024-12-03 20:04:35	2024-12-03 20:05:15
3218	38	81	3	2024-12-03 20:05:15	2024-12-03 20:05:56
3224	38	81	3	2024-12-03 20:05:56	2024-12-03 20:06:36
3230	38	81	3	2024-12-03 20:06:36	2024-12-03 20:07:17
3236	38	81	3	2024-12-03 20:07:17	2024-12-03 20:07:58
3242	38	81	3	2024-12-03 20:07:58	2024-12-03 20:08:39
3248	38	81	3	2024-12-03 20:08:39	2024-12-03 20:09:20
3254	38	81	3	2024-12-03 20:09:20	2024-12-03 20:10:00
3260	38	81	3	2024-12-03 20:10:00	2024-12-03 20:10:41
3266	38	81	3	2024-12-03 20:10:41	2024-12-03 20:11:21
3272	38	81	3	2024-12-03 20:11:21	2024-12-03 20:12:01
7094	38	86	3	2024-12-04 02:20:20	2024-12-04 02:21:00
7101	38	86	3	2024-12-04 02:21:00	2024-12-04 02:21:41
7108	38	86	3	2024-12-04 02:21:41	2024-12-04 02:22:21
7115	38	86	3	2024-12-04 02:22:21	2024-12-04 02:23:02
7122	38	86	3	2024-12-04 02:23:02	2024-12-04 02:23:42
7129	38	86	3	2024-12-04 02:23:42	2024-12-04 02:24:22
7136	38	86	3	2024-12-04 02:24:22	2024-12-04 02:25:03
7143	38	86	3	2024-12-04 02:25:03	2024-12-04 02:25:43
7150	38	86	3	2024-12-04 02:25:43	2024-12-04 02:26:23
7157	38	86	3	2024-12-04 02:26:23	2024-12-04 02:27:04
7164	38	86	3	2024-12-04 02:27:04	2024-12-04 02:27:44
7171	38	86	3	2024-12-04 02:27:44	2024-12-04 02:28:24
7178	38	86	3	2024-12-04 02:28:24	2024-12-04 02:29:05
7185	38	86	3	2024-12-04 02:29:05	2024-12-04 02:29:45
7192	38	86	3	2024-12-04 02:29:45	2024-12-04 02:30:25
7199	38	86	3	2024-12-04 02:30:25	2024-12-04 02:31:06
7206	38	86	3	2024-12-04 02:31:06	2024-12-04 02:31:47
7214	38	86	3	2024-12-04 02:31:47	2024-12-04 02:32:27
7221	38	86	3	2024-12-04 02:32:27	2024-12-04 02:33:07
7228	38	86	3	2024-12-04 02:33:07	2024-12-04 02:33:48
7235	38	86	3	2024-12-04 02:33:48	2024-12-04 02:34:29
7242	38	86	3	2024-12-04 02:34:29	2024-12-04 02:35:10
7249	38	86	3	2024-12-04 02:35:10	2024-12-04 02:35:51
7256	38	86	3	2024-12-04 02:35:51	2024-12-04 02:36:31
7263	38	86	3	2024-12-04 02:36:31	2024-12-04 02:37:12
7270	38	86	3	2024-12-04 02:37:12	2024-12-04 02:37:54
7277	38	86	3	2024-12-04 02:37:54	2024-12-04 02:38:34
7284	38	86	3	2024-12-04 02:38:34	2024-12-04 02:39:15
7291	38	86	3	2024-12-04 02:39:15	2024-12-04 02:39:55
7298	38	86	3	2024-12-04 02:39:55	2024-12-04 02:40:35
7305	38	86	3	2024-12-04 02:40:35	2024-12-04 02:41:16
7312	38	86	3	2024-12-04 02:41:16	2024-12-04 02:41:56
7319	38	86	3	2024-12-04 02:41:56	2024-12-04 02:42:36
7326	38	86	3	2024-12-04 02:42:36	2024-12-04 02:43:17
7333	38	86	3	2024-12-04 02:43:17	2024-12-04 02:43:58
7340	38	86	3	2024-12-04 02:43:58	2024-12-04 02:44:39
7347	38	86	3	2024-12-04 02:44:39	2024-12-04 02:45:20
7354	38	86	3	2024-12-04 02:45:20	2024-12-04 02:46:01
7361	38	86	3	2024-12-04 02:46:01	2024-12-04 02:46:42
7368	38	86	3	2024-12-04 02:46:42	2024-12-04 02:47:23
7375	38	86	3	2024-12-04 02:47:23	2024-12-04 02:48:04
7382	38	86	3	2024-12-04 02:48:04	2024-12-04 02:48:45
7389	38	86	3	2024-12-04 02:48:45	2024-12-04 02:49:25
7396	38	86	3	2024-12-04 02:49:25	2024-12-04 02:50:05
7403	38	86	3	2024-12-04 02:50:05	2024-12-04 02:50:46
7410	38	86	3	2024-12-04 02:50:46	2024-12-04 02:51:26
7417	38	86	3	2024-12-04 02:51:26	2024-12-04 02:52:06
7424	38	86	3	2024-12-04 02:52:06	2024-12-04 02:52:47
7431	38	86	3	2024-12-04 02:52:47	2024-12-04 02:53:27
7438	38	86	3	2024-12-04 02:53:27	2024-12-04 02:54:08
7445	38	86	3	2024-12-04 02:54:08	2024-12-04 02:54:49
7452	38	86	3	2024-12-04 02:54:49	2024-12-04 02:55:30
7459	38	86	3	2024-12-04 02:55:30	2024-12-04 02:56:11
7466	38	86	3	2024-12-04 02:56:11	2024-12-04 02:56:52
7473	38	86	3	2024-12-04 02:56:52	2024-12-04 02:57:32
3189	38	82	3	2024-12-03 20:02:00	2024-12-03 20:02:40
3195	38	82	3	2024-12-03 20:02:40	2024-12-03 20:03:20
3201	38	82	3	2024-12-03 20:03:20	2024-12-03 20:04:01
3207	38	82	3	2024-12-03 20:04:01	2024-12-03 20:04:41
3213	38	82	3	2024-12-03 20:04:41	2024-12-03 20:05:21
3219	38	82	3	2024-12-03 20:05:21	2024-12-03 20:06:02
3225	38	82	3	2024-12-03 20:06:02	2024-12-03 20:06:43
3231	38	82	3	2024-12-03 20:06:43	2024-12-03 20:07:24
3237	38	82	3	2024-12-03 20:07:24	2024-12-03 20:08:05
3243	38	82	3	2024-12-03 20:08:05	2024-12-03 20:08:46
3249	38	82	3	2024-12-03 20:08:46	2024-12-03 20:09:26
3255	38	82	3	2024-12-03 20:09:26	2024-12-03 20:10:06
3261	38	82	3	2024-12-03 20:10:06	2024-12-03 20:10:47
3267	38	82	3	2024-12-03 20:10:47	2024-12-03 20:11:27
7095	38	81	3	2024-12-04 02:20:21	2024-12-04 02:21:01
7102	38	81	3	2024-12-04 02:21:01	2024-12-04 02:21:41
7109	38	81	3	2024-12-04 02:21:41	2024-12-04 02:22:22
7116	38	81	3	2024-12-04 02:22:22	2024-12-04 02:23:02
7123	38	81	3	2024-12-04 02:23:02	2024-12-04 02:23:42
7130	38	81	3	2024-12-04 02:23:42	2024-12-04 02:24:23
7137	38	81	3	2024-12-04 02:24:23	2024-12-04 02:25:03
7144	38	81	3	2024-12-04 02:25:03	2024-12-04 02:25:43
7151	38	81	3	2024-12-04 02:25:43	2024-12-04 02:26:24
7158	38	81	3	2024-12-04 02:26:24	2024-12-04 02:27:04
7165	38	81	3	2024-12-04 02:27:04	2024-12-04 02:27:44
7172	38	81	3	2024-12-04 02:27:44	2024-12-04 02:28:25
7179	38	81	3	2024-12-04 02:28:25	2024-12-04 02:29:05
7186	38	81	3	2024-12-04 02:29:05	2024-12-04 02:29:45
7193	38	81	3	2024-12-04 02:29:45	2024-12-04 02:30:26
7200	38	81	3	2024-12-04 02:30:26	2024-12-04 02:31:06
7207	38	81	3	2024-12-04 02:31:06	2024-12-04 02:31:46
7213	38	81	3	2024-12-04 02:31:46	2024-12-04 02:32:27
7220	38	81	3	2024-12-04 02:32:27	2024-12-04 02:33:07
7227	38	81	3	2024-12-04 02:33:07	2024-12-04 02:33:47
7234	38	81	3	2024-12-04 02:33:47	2024-12-04 02:34:28
7241	38	81	3	2024-12-04 02:34:28	2024-12-04 02:35:09
7248	38	81	3	2024-12-04 02:35:09	2024-12-04 02:35:50
7255	38	81	3	2024-12-04 02:35:50	2024-12-04 02:36:31
7262	38	81	3	2024-12-04 02:36:31	2024-12-04 02:37:12
7269	38	81	3	2024-12-04 02:37:12	2024-12-04 02:37:53
7276	38	81	3	2024-12-04 02:37:53	2024-12-04 02:38:34
7283	38	81	3	2024-12-04 02:38:34	2024-12-04 02:39:14
7290	38	81	3	2024-12-04 02:39:14	2024-12-04 02:39:54
7297	38	81	3	2024-12-04 02:39:54	2024-12-04 02:40:35
7304	38	81	3	2024-12-04 02:40:35	2024-12-04 02:41:15
7311	38	81	3	2024-12-04 02:41:15	2024-12-04 02:41:55
7318	38	81	3	2024-12-04 02:41:55	2024-12-04 02:42:36
7325	38	81	3	2024-12-04 02:42:36	2024-12-04 02:43:16
7332	38	81	3	2024-12-04 02:43:16	2024-12-04 02:43:57
7339	38	81	3	2024-12-04 02:43:57	2024-12-04 02:44:38
7346	38	81	3	2024-12-04 02:44:38	2024-12-04 02:45:19
7353	38	81	3	2024-12-04 02:45:19	2024-12-04 02:46:00
7360	38	81	3	2024-12-04 02:46:00	2024-12-04 02:46:41
7367	38	81	3	2024-12-04 02:46:41	2024-12-04 02:47:22
7374	38	81	3	2024-12-04 02:47:22	2024-12-04 02:48:03
7381	38	81	3	2024-12-04 02:48:03	2024-12-04 02:48:44
7388	38	81	3	2024-12-04 02:48:44	2024-12-04 02:49:24
7395	38	81	3	2024-12-04 02:49:24	2024-12-04 02:50:04
7402	38	81	3	2024-12-04 02:50:04	2024-12-04 02:50:45
7409	38	81	3	2024-12-04 02:50:45	2024-12-04 02:51:25
7416	38	81	3	2024-12-04 02:51:25	2024-12-04 02:52:05
7423	38	81	3	2024-12-04 02:52:05	2024-12-04 02:52:46
7430	38	81	3	2024-12-04 02:52:46	2024-12-04 02:53:26
7437	38	81	3	2024-12-04 02:53:26	2024-12-04 02:54:07
7444	38	81	3	2024-12-04 02:54:07	2024-12-04 02:54:48
7451	38	81	3	2024-12-04 02:54:48	2024-12-04 02:55:29
7458	38	81	3	2024-12-04 02:55:29	2024-12-04 02:56:10
7465	38	81	3	2024-12-04 02:56:10	2024-12-04 02:56:51
7472	38	81	3	2024-12-04 02:56:51	2024-12-04 02:57:31
3190	38	83	3	2024-12-03 20:02:06	2024-12-03 20:02:46
3196	38	83	3	2024-12-03 20:02:46	2024-12-03 20:03:26
3202	38	83	3	2024-12-03 20:03:26	2024-12-03 20:04:07
3208	38	83	3	2024-12-03 20:04:07	2024-12-03 20:04:47
3214	38	83	3	2024-12-03 20:04:47	2024-12-03 20:05:27
3220	38	83	3	2024-12-03 20:05:27	2024-12-03 20:06:08
3226	38	83	3	2024-12-03 20:06:08	2024-12-03 20:06:49
3232	38	83	3	2024-12-03 20:06:49	2024-12-03 20:07:30
3238	38	83	3	2024-12-03 20:07:30	2024-12-03 20:08:11
3244	38	83	3	2024-12-03 20:08:11	2024-12-03 20:08:52
3250	38	83	3	2024-12-03 20:08:52	2024-12-03 20:09:32
3256	38	83	3	2024-12-03 20:09:32	2024-12-03 20:10:12
3262	38	83	3	2024-12-03 20:10:12	2024-12-03 20:10:53
3268	38	83	3	2024-12-03 20:10:53	2024-12-03 20:11:33
7096	38	82	3	2024-12-04 02:20:31	2024-12-04 02:21:11
7103	38	82	3	2024-12-04 02:21:11	2024-12-04 02:21:51
7110	38	82	3	2024-12-04 02:21:51	2024-12-04 02:22:32
7117	38	82	3	2024-12-04 02:22:32	2024-12-04 02:23:12
7124	38	82	3	2024-12-04 02:23:12	2024-12-04 02:23:53
7131	38	82	3	2024-12-04 02:23:53	2024-12-04 02:24:33
7138	38	82	3	2024-12-04 02:24:33	2024-12-04 02:25:13
7145	38	82	3	2024-12-04 02:25:13	2024-12-04 02:25:54
7152	38	82	3	2024-12-04 02:25:54	2024-12-04 02:26:34
7159	38	82	3	2024-12-04 02:26:34	2024-12-04 02:27:14
7166	38	82	3	2024-12-04 02:27:14	2024-12-04 02:27:55
7173	38	82	3	2024-12-04 02:27:55	2024-12-04 02:28:35
7180	38	82	3	2024-12-04 02:28:35	2024-12-04 02:29:15
7187	38	82	3	2024-12-04 02:29:15	2024-12-04 02:29:56
7194	38	82	3	2024-12-04 02:29:56	2024-12-04 02:30:36
7201	38	82	3	2024-12-04 02:30:36	2024-12-04 02:31:16
7208	38	82	3	2024-12-04 02:31:16	2024-12-04 02:31:57
7215	38	82	3	2024-12-04 02:31:57	2024-12-04 02:32:37
7222	38	82	3	2024-12-04 02:32:37	2024-12-04 02:33:18
7229	38	82	3	2024-12-04 02:33:18	2024-12-04 02:33:58
7236	38	82	3	2024-12-04 02:33:58	2024-12-04 02:34:39
7243	38	82	3	2024-12-04 02:34:39	2024-12-04 02:35:20
7250	38	82	3	2024-12-04 02:35:20	2024-12-04 02:36:01
7257	38	82	3	2024-12-04 02:36:01	2024-12-04 02:36:42
7264	38	82	3	2024-12-04 02:36:42	2024-12-04 02:37:23
7271	38	82	3	2024-12-04 02:37:23	2024-12-04 02:38:04
7278	38	82	3	2024-12-04 02:38:04	2024-12-04 02:38:44
7285	38	82	3	2024-12-04 02:38:44	2024-12-04 02:39:24
7292	38	82	3	2024-12-04 02:39:24	2024-12-04 02:40:05
7299	38	82	3	2024-12-04 02:40:05	2024-12-04 02:40:45
7306	38	82	3	2024-12-04 02:40:45	2024-12-04 02:41:26
7313	38	82	3	2024-12-04 02:41:26	2024-12-04 02:42:06
7320	38	82	3	2024-12-04 02:42:06	2024-12-04 02:42:46
7327	38	82	3	2024-12-04 02:42:46	2024-12-04 02:43:27
7334	38	82	3	2024-12-04 02:43:27	2024-12-04 02:44:08
7341	38	82	3	2024-12-04 02:44:08	2024-12-04 02:44:49
7348	38	82	3	2024-12-04 02:44:49	2024-12-04 02:45:29
7355	38	82	3	2024-12-04 02:45:29	2024-12-04 02:46:10
7362	38	82	3	2024-12-04 02:46:10	2024-12-04 02:46:51
7369	38	82	3	2024-12-04 02:46:51	2024-12-04 02:47:32
7376	38	82	3	2024-12-04 02:47:32	2024-12-04 02:48:13
7383	38	82	3	2024-12-04 02:48:13	2024-12-04 02:48:54
7390	38	82	3	2024-12-04 02:48:54	2024-12-04 02:49:34
7397	38	82	3	2024-12-04 02:49:34	2024-12-04 02:50:14
7404	38	82	3	2024-12-04 02:50:14	2024-12-04 02:50:55
7411	38	82	3	2024-12-04 02:50:55	2024-12-04 02:51:35
7418	38	82	3	2024-12-04 02:51:35	2024-12-04 02:52:16
7425	38	82	3	2024-12-04 02:52:16	2024-12-04 02:52:56
7432	38	82	3	2024-12-04 02:52:56	2024-12-04 02:53:36
7439	38	82	3	2024-12-04 02:53:36	2024-12-04 02:54:17
7446	38	82	3	2024-12-04 02:54:17	2024-12-04 02:54:58
7453	38	82	3	2024-12-04 02:54:58	2024-12-04 02:55:39
7460	38	82	3	2024-12-04 02:55:39	2024-12-04 02:56:20
7467	38	82	3	2024-12-04 02:56:20	2024-12-04 02:57:01
7474	38	82	3	2024-12-04 02:57:01	2024-12-04 02:57:42
3191	38	84	3	2024-12-03 20:02:22	2024-12-03 20:03:03
3197	38	84	3	2024-12-03 20:03:03	2024-12-03 20:03:43
3203	38	84	3	2024-12-03 20:03:43	2024-12-03 20:04:23
3209	38	84	3	2024-12-03 20:04:23	2024-12-03 20:05:03
3215	38	84	3	2024-12-03 20:05:03	2024-12-03 20:05:44
3221	38	84	3	2024-12-03 20:05:44	2024-12-03 20:06:25
3227	38	84	3	2024-12-03 20:06:25	2024-12-03 20:07:06
3233	38	84	3	2024-12-03 20:07:06	2024-12-03 20:07:47
3239	38	84	3	2024-12-03 20:07:47	2024-12-03 20:08:28
3245	38	84	3	2024-12-03 20:08:28	2024-12-03 20:09:09
3251	38	84	3	2024-12-03 20:09:09	2024-12-03 20:09:49
3257	38	84	3	2024-12-03 20:09:49	2024-12-03 20:10:29
3263	38	84	3	2024-12-03 20:10:29	2024-12-03 20:11:09
3269	38	84	3	2024-12-03 20:11:09	2024-12-03 20:11:50
7097	38	88	3	2024-12-04 02:20:32	2024-12-04 02:21:13
7104	38	88	3	2024-12-04 02:21:13	2024-12-04 02:21:53
7111	38	88	3	2024-12-04 02:21:53	2024-12-04 02:22:33
7118	38	88	3	2024-12-04 02:22:33	2024-12-04 02:23:13
7125	38	88	3	2024-12-04 02:23:13	2024-12-04 02:23:54
7132	38	88	3	2024-12-04 02:23:54	2024-12-04 02:24:34
7139	38	88	3	2024-12-04 02:24:34	2024-12-04 02:25:15
7146	38	88	3	2024-12-04 02:25:15	2024-12-04 02:25:55
7153	38	88	3	2024-12-04 02:25:55	2024-12-04 02:26:35
7160	38	88	3	2024-12-04 02:26:35	2024-12-04 02:27:16
7167	38	88	3	2024-12-04 02:27:16	2024-12-04 02:27:56
7174	38	88	3	2024-12-04 02:27:56	2024-12-04 02:28:36
7181	38	88	3	2024-12-04 02:28:36	2024-12-04 02:29:17
7188	38	88	3	2024-12-04 02:29:17	2024-12-04 02:29:57
7195	38	88	3	2024-12-04 02:29:57	2024-12-04 02:30:37
7202	38	88	3	2024-12-04 02:30:37	2024-12-04 02:31:17
7209	38	88	3	2024-12-04 02:31:17	2024-12-04 02:31:58
7216	38	88	3	2024-12-04 02:31:58	2024-12-04 02:32:38
7223	38	88	3	2024-12-04 02:32:38	2024-12-04 02:33:18
7230	38	88	3	2024-12-04 02:33:18	2024-12-04 02:33:59
7237	38	88	3	2024-12-04 02:33:59	2024-12-04 02:34:40
7244	38	88	3	2024-12-04 02:34:40	2024-12-04 02:35:21
7251	38	88	3	2024-12-04 02:35:21	2024-12-04 02:36:02
7258	38	88	3	2024-12-04 02:36:02	2024-12-04 02:36:43
7265	38	88	3	2024-12-04 02:36:43	2024-12-04 02:37:24
7272	38	88	3	2024-12-04 02:37:24	2024-12-04 02:38:05
7279	38	88	3	2024-12-04 02:38:05	2024-12-04 02:38:45
7286	38	88	3	2024-12-04 02:38:45	2024-12-04 02:39:25
7293	38	88	3	2024-12-04 02:39:25	2024-12-04 02:40:06
7300	38	88	3	2024-12-04 02:40:06	2024-12-04 02:40:46
7307	38	88	3	2024-12-04 02:40:46	2024-12-04 02:41:26
7314	38	88	3	2024-12-04 02:41:26	2024-12-04 02:42:07
7321	38	88	3	2024-12-04 02:42:07	2024-12-04 02:42:47
7328	38	88	3	2024-12-04 02:42:47	2024-12-04 02:43:27
7335	38	88	3	2024-12-04 02:43:27	2024-12-04 02:44:08
7342	38	88	3	2024-12-04 02:44:08	2024-12-04 02:44:49
7349	38	88	3	2024-12-04 02:44:49	2024-12-04 02:45:30
7356	38	88	3	2024-12-04 02:45:30	2024-12-04 02:46:11
7363	38	88	3	2024-12-04 02:46:11	2024-12-04 02:46:52
7370	38	88	3	2024-12-04 02:46:52	2024-12-04 02:47:33
7377	38	88	3	2024-12-04 02:47:33	2024-12-04 02:48:14
7384	38	88	3	2024-12-04 02:48:14	2024-12-04 02:48:55
7391	38	88	3	2024-12-04 02:48:55	2024-12-04 02:49:35
7398	38	88	3	2024-12-04 02:49:35	2024-12-04 02:50:15
7405	38	88	3	2024-12-04 02:50:15	2024-12-04 02:50:56
7412	38	88	3	2024-12-04 02:50:56	2024-12-04 02:51:36
7419	38	88	3	2024-12-04 02:51:36	2024-12-04 02:52:16
7426	38	88	3	2024-12-04 02:52:16	2024-12-04 02:52:57
7433	38	88	3	2024-12-04 02:52:57	2024-12-04 02:53:37
7440	38	88	3	2024-12-04 02:53:37	2024-12-04 02:54:18
7447	38	88	3	2024-12-04 02:54:18	2024-12-04 02:54:59
7454	38	88	3	2024-12-04 02:54:59	2024-12-04 02:55:40
7461	38	88	3	2024-12-04 02:55:40	2024-12-04 02:56:21
7468	38	88	3	2024-12-04 02:56:21	2024-12-04 02:57:02
7475	38	88	3	2024-12-04 02:57:02	2024-12-04 02:57:42
3192	38	86	3	2024-12-03 20:02:29	2024-12-03 20:03:09
3198	38	86	3	2024-12-03 20:03:09	2024-12-03 20:03:50
3204	38	86	3	2024-12-03 20:03:50	2024-12-03 20:04:30
3210	38	86	3	2024-12-03 20:04:30	2024-12-03 20:05:10
3216	38	86	3	2024-12-03 20:05:10	2024-12-03 20:05:51
3222	38	86	3	2024-12-03 20:05:51	2024-12-03 20:06:32
3228	38	86	3	2024-12-03 20:06:32	2024-12-03 20:07:13
3234	38	86	3	2024-12-03 20:07:13	2024-12-03 20:07:53
3240	38	86	3	2024-12-03 20:07:53	2024-12-03 20:08:34
3246	38	86	3	2024-12-03 20:08:34	2024-12-03 20:09:15
3252	38	86	3	2024-12-03 20:09:15	2024-12-03 20:09:56
3258	38	86	3	2024-12-03 20:09:56	2024-12-03 20:10:36
3264	38	86	3	2024-12-03 20:10:36	2024-12-03 20:11:16
3270	38	86	3	2024-12-03 20:11:16	2024-12-03 20:11:57
3273	38	82	3	2024-12-03 20:11:27	2024-12-03 20:12:07
3274	38	83	3	2024-12-03 20:11:33	2024-12-03 20:12:13
3275	38	84	3	2024-12-03 20:11:50	2024-12-03 20:12:30
3276	38	86	3	2024-12-03 20:11:57	2024-12-03 20:12:37
3277	38	87	3	2024-12-03 20:11:58	2024-12-03 20:12:39
3278	38	81	3	2024-12-03 20:12:01	2024-12-03 20:12:42
3279	38	82	3	2024-12-03 20:12:07	2024-12-03 20:12:47
3280	38	83	3	2024-12-03 20:12:13	2024-12-03 20:12:54
3281	38	84	3	2024-12-03 20:12:30	2024-12-03 20:13:10
3282	38	86	3	2024-12-03 20:12:37	2024-12-03 20:13:17
3283	38	87	3	2024-12-03 20:12:39	2024-12-03 20:13:19
3284	38	81	3	2024-12-03 20:12:42	2024-12-03 20:13:22
3285	38	82	3	2024-12-03 20:12:47	2024-12-03 20:13:28
3286	38	83	3	2024-12-03 20:12:54	2024-12-03 20:13:34
3287	38	84	3	2024-12-03 20:13:10	2024-12-03 20:13:51
3288	38	86	3	2024-12-03 20:13:17	2024-12-03 20:13:58
3289	38	87	3	2024-12-03 20:13:19	2024-12-03 20:13:59
3290	38	81	3	2024-12-03 20:13:22	2024-12-03 20:14:02
3291	38	82	3	2024-12-03 20:13:28	2024-12-03 20:14:08
3292	38	83	3	2024-12-03 20:13:34	2024-12-03 20:14:14
3293	38	84	3	2024-12-03 20:13:51	2024-12-03 20:14:31
3294	38	86	3	2024-12-03 20:13:58	2024-12-03 20:14:38
3295	38	87	3	2024-12-03 20:13:59	2024-12-03 20:14:40
3296	38	81	3	2024-12-03 20:14:02	2024-12-03 20:14:43
3297	38	82	3	2024-12-03 20:14:08	2024-12-03 20:14:48
3298	38	83	3	2024-12-03 20:14:14	2024-12-03 20:14:55
3299	38	84	3	2024-12-03 20:14:31	2024-12-03 20:15:11
3300	38	86	3	2024-12-03 20:14:38	2024-12-03 20:15:18
3301	38	87	3	2024-12-03 20:14:40	2024-12-03 20:15:20
3302	38	81	3	2024-12-03 20:14:43	2024-12-03 20:15:23
3303	38	82	3	2024-12-03 20:14:48	2024-12-03 20:15:29
3304	38	83	3	2024-12-03 20:14:55	2024-12-03 20:15:35
3305	38	84	3	2024-12-03 20:15:11	2024-12-03 20:15:52
3306	38	86	3	2024-12-03 20:15:18	2024-12-03 20:15:59
3307	38	87	3	2024-12-03 20:15:20	2024-12-03 20:16:01
3308	38	81	3	2024-12-03 20:15:23	2024-12-03 20:16:03
3309	38	82	3	2024-12-03 20:15:29	2024-12-03 20:16:09
3310	38	83	3	2024-12-03 20:15:35	2024-12-03 20:16:16
3311	38	84	3	2024-12-03 20:15:52	2024-12-03 20:16:32
3312	38	86	3	2024-12-03 20:15:59	2024-12-03 20:16:39
3313	38	87	3	2024-12-03 20:16:01	2024-12-03 20:16:41
3314	38	81	3	2024-12-03 20:16:03	2024-12-03 20:16:44
3315	38	82	3	2024-12-03 20:16:09	2024-12-03 20:16:49
3316	38	83	3	2024-12-03 20:16:16	2024-12-03 20:16:56
3317	38	84	3	2024-12-03 20:16:32	2024-12-03 20:17:12
3318	38	86	3	2024-12-03 20:16:39	2024-12-03 20:17:19
3319	38	87	3	2024-12-03 20:16:41	2024-12-03 20:17:21
3320	38	81	3	2024-12-03 20:16:44	2024-12-03 20:17:24
3321	38	82	3	2024-12-03 20:16:49	2024-12-03 20:17:30
3322	38	83	3	2024-12-03 20:16:56	2024-12-03 20:17:36
3323	38	84	3	2024-12-03 20:17:12	2024-12-03 20:17:53
3324	38	86	3	2024-12-03 20:17:19	2024-12-03 20:17:59
3325	38	87	3	2024-12-03 20:17:21	2024-12-03 20:18:02
3326	38	81	3	2024-12-03 20:17:24	2024-12-03 20:18:04
3327	38	82	3	2024-12-03 20:17:30	2024-12-03 20:18:10
3328	38	83	3	2024-12-03 20:17:36	2024-12-03 20:18:17
3329	38	84	3	2024-12-03 20:17:53	2024-12-03 20:18:33
3330	38	86	3	2024-12-03 20:17:59	2024-12-03 20:18:40
3331	38	87	3	2024-12-03 20:18:02	2024-12-03 20:18:42
3332	38	81	3	2024-12-03 20:18:04	2024-12-03 20:18:45
3333	38	82	3	2024-12-03 20:18:10	2024-12-03 20:18:50
3334	38	83	3	2024-12-03 20:18:17	2024-12-03 20:18:57
3335	38	84	3	2024-12-03 20:18:33	2024-12-03 20:19:13
3336	38	86	3	2024-12-03 20:18:40	2024-12-03 20:19:20
3337	38	87	3	2024-12-03 20:18:42	2024-12-03 20:19:22
3338	38	81	3	2024-12-03 20:18:45	2024-12-03 20:19:25
3339	38	82	3	2024-12-03 20:18:51	2024-12-03 20:19:31
3340	38	83	3	2024-12-03 20:18:57	2024-12-03 20:19:37
3341	38	84	3	2024-12-03 20:19:13	2024-12-03 20:19:54
3342	38	86	3	2024-12-03 20:19:20	2024-12-03 20:20:00
3343	38	87	3	2024-12-03 20:19:22	2024-12-03 20:20:03
3344	38	81	3	2024-12-03 20:19:25	2024-12-03 20:20:06
3345	38	82	3	2024-12-03 20:19:31	2024-12-03 20:20:11
3346	38	83	3	2024-12-03 20:19:37	2024-12-03 20:20:18
3347	38	84	3	2024-12-03 20:19:54	2024-12-03 20:20:34
3348	38	86	3	2024-12-03 20:20:00	2024-12-03 20:20:41
3349	38	87	3	2024-12-03 20:20:03	2024-12-03 20:20:43
3350	38	81	3	2024-12-03 20:20:06	2024-12-03 20:20:46
3351	38	82	3	2024-12-03 20:20:11	2024-12-03 20:20:51
3352	38	88	3	2024-12-03 20:20:12	2024-12-03 20:20:53
3353	38	83	3	2024-12-03 20:20:18	2024-12-03 20:20:58
3354	38	84	3	2024-12-03 20:20:34	2024-12-03 20:21:14
3355	38	86	3	2024-12-03 20:20:41	2024-12-03 20:21:21
3356	38	87	3	2024-12-03 20:20:43	2024-12-03 20:21:24
3357	38	81	3	2024-12-03 20:20:46	2024-12-03 20:21:26
3358	38	82	3	2024-12-03 20:20:51	2024-12-03 20:21:32
3359	38	88	3	2024-12-03 20:20:53	2024-12-03 20:21:33
3360	38	83	3	2024-12-03 20:20:58	2024-12-03 20:21:38
3361	38	84	3	2024-12-03 20:21:14	2024-12-03 20:21:55
3362	38	86	3	2024-12-03 20:21:21	2024-12-03 20:22:01
3363	38	87	3	2024-12-03 20:21:24	2024-12-03 20:22:04
3364	38	81	3	2024-12-03 20:21:26	2024-12-03 20:22:07
3365	38	82	3	2024-12-03 20:21:32	2024-12-03 20:22:12
3366	38	88	3	2024-12-03 20:21:33	2024-12-03 20:22:14
3367	38	83	3	2024-12-03 20:21:38	2024-12-03 20:22:19
3368	38	84	3	2024-12-03 20:21:55	2024-12-03 20:22:35
3369	38	86	3	2024-12-03 20:22:01	2024-12-03 20:22:42
3370	38	87	3	2024-12-03 20:22:04	2024-12-03 20:22:44
7092	38	84	3	2024-12-04 02:20:08	2024-12-04 02:20:49
3371	38	81	3	2024-12-03 20:22:07	2024-12-03 20:22:47
3378	38	81	3	2024-12-03 20:22:47	2024-12-03 20:23:27
3385	38	81	3	2024-12-03 20:23:27	2024-12-03 20:24:08
3392	38	81	3	2024-12-03 20:24:08	2024-12-03 20:24:48
3399	38	81	3	2024-12-03 20:24:48	2024-12-03 20:25:28
3406	38	81	3	2024-12-03 20:25:29	2024-12-03 20:26:09
3413	38	81	3	2024-12-03 20:26:09	2024-12-03 20:26:49
3420	38	81	3	2024-12-03 20:26:49	2024-12-03 20:27:30
3427	38	81	3	2024-12-03 20:27:30	2024-12-03 20:28:10
3434	38	81	3	2024-12-03 20:28:10	2024-12-03 20:28:50
3441	38	81	3	2024-12-03 20:28:50	2024-12-03 20:29:31
3448	38	81	3	2024-12-03 20:29:31	2024-12-03 20:30:11
3455	38	81	3	2024-12-03 20:30:11	2024-12-03 20:30:51
3462	38	81	3	2024-12-03 20:30:51	2024-12-03 20:31:32
7099	38	84	3	2024-12-04 02:20:49	2024-12-04 02:21:29
7106	38	84	3	2024-12-04 02:21:29	2024-12-04 02:22:09
7113	38	84	3	2024-12-04 02:22:09	2024-12-04 02:22:50
7120	38	84	3	2024-12-04 02:22:50	2024-12-04 02:23:30
7127	38	84	3	2024-12-04 02:23:30	2024-12-04 02:24:10
7134	38	84	3	2024-12-04 02:24:10	2024-12-04 02:24:51
7141	38	84	3	2024-12-04 02:24:51	2024-12-04 02:25:31
7148	38	84	3	2024-12-04 02:25:31	2024-12-04 02:26:11
7155	38	84	3	2024-12-04 02:26:11	2024-12-04 02:26:52
7162	38	84	3	2024-12-04 02:26:52	2024-12-04 02:27:32
7169	38	84	3	2024-12-04 02:27:32	2024-12-04 02:28:13
7176	38	84	3	2024-12-04 02:28:13	2024-12-04 02:28:53
7183	38	84	3	2024-12-04 02:28:53	2024-12-04 02:29:33
7190	38	84	3	2024-12-04 02:29:33	2024-12-04 02:30:14
7197	38	84	3	2024-12-04 02:30:14	2024-12-04 02:30:54
7204	38	84	3	2024-12-04 02:30:54	2024-12-04 02:31:34
7211	38	84	3	2024-12-04 02:31:34	2024-12-04 02:32:15
7218	38	84	3	2024-12-04 02:32:15	2024-12-04 02:32:55
7225	38	84	3	2024-12-04 02:32:55	2024-12-04 02:33:35
7232	38	84	3	2024-12-04 02:33:35	2024-12-04 02:34:16
7239	38	84	3	2024-12-04 02:34:16	2024-12-04 02:34:57
7246	38	84	3	2024-12-04 02:34:57	2024-12-04 02:35:37
7253	38	84	3	2024-12-04 02:35:37	2024-12-04 02:36:18
7260	38	84	3	2024-12-04 02:36:18	2024-12-04 02:36:59
7267	38	84	3	2024-12-04 02:36:59	2024-12-04 02:37:40
7274	38	84	3	2024-12-04 02:37:40	2024-12-04 02:38:21
7281	38	84	3	2024-12-04 02:38:21	2024-12-04 02:39:01
7288	38	84	3	2024-12-04 02:39:01	2024-12-04 02:39:41
7295	38	84	3	2024-12-04 02:39:41	2024-12-04 02:40:22
7302	38	84	3	2024-12-04 02:40:22	2024-12-04 02:41:02
7309	38	84	3	2024-12-04 02:41:02	2024-12-04 02:41:42
7316	38	84	3	2024-12-04 02:41:42	2024-12-04 02:42:23
7323	38	84	3	2024-12-04 02:42:23	2024-12-04 02:43:03
7330	38	84	3	2024-12-04 02:43:03	2024-12-04 02:43:43
7337	38	84	3	2024-12-04 02:43:43	2024-12-04 02:44:24
7344	38	84	3	2024-12-04 02:44:24	2024-12-04 02:45:05
7351	38	84	3	2024-12-04 02:45:05	2024-12-04 02:45:46
7358	38	84	3	2024-12-04 02:45:46	2024-12-04 02:46:28
7365	38	84	3	2024-12-04 02:46:28	2024-12-04 02:47:09
7372	38	84	3	2024-12-04 02:47:09	2024-12-04 02:47:50
7379	38	84	3	2024-12-04 02:47:50	2024-12-04 02:48:31
7386	38	84	3	2024-12-04 02:48:31	2024-12-04 02:49:11
7393	38	84	3	2024-12-04 02:49:11	2024-12-04 02:49:51
7400	38	84	3	2024-12-04 02:49:51	2024-12-04 02:50:32
7407	38	84	3	2024-12-04 02:50:32	2024-12-04 02:51:12
7414	38	84	3	2024-12-04 02:51:12	2024-12-04 02:51:52
7421	38	84	3	2024-12-04 02:51:52	2024-12-04 02:52:33
7428	38	84	3	2024-12-04 02:52:33	2024-12-04 02:53:13
7435	38	84	3	2024-12-04 02:53:13	2024-12-04 02:53:53
7442	38	84	3	2024-12-04 02:53:53	2024-12-04 02:54:34
7449	38	84	3	2024-12-04 02:54:34	2024-12-04 02:55:15
7456	38	84	3	2024-12-04 02:55:15	2024-12-04 02:55:56
7463	38	84	3	2024-12-04 02:55:56	2024-12-04 02:56:37
7470	38	84	3	2024-12-04 02:56:37	2024-12-04 02:57:17
3372	38	82	3	2024-12-03 20:22:12	2024-12-03 20:22:52
3379	38	82	3	2024-12-03 20:22:52	2024-12-03 20:23:33
3386	38	82	3	2024-12-03 20:23:33	2024-12-03 20:24:13
3393	38	82	3	2024-12-03 20:24:13	2024-12-03 20:24:53
3400	38	82	3	2024-12-03 20:24:53	2024-12-03 20:25:34
3407	38	82	3	2024-12-03 20:25:34	2024-12-03 20:26:14
3414	38	82	3	2024-12-03 20:26:14	2024-12-03 20:26:54
3421	38	82	3	2024-12-03 20:26:54	2024-12-03 20:27:35
3428	38	82	3	2024-12-03 20:27:35	2024-12-03 20:28:15
3435	38	82	3	2024-12-03 20:28:15	2024-12-03 20:28:55
3442	38	82	3	2024-12-03 20:28:55	2024-12-03 20:29:36
3449	38	82	3	2024-12-03 20:29:36	2024-12-03 20:30:16
3456	38	82	3	2024-12-03 20:30:16	2024-12-03 20:30:56
3463	38	82	3	2024-12-03 20:30:56	2024-12-03 20:31:37
7476	38	83	3	2024-12-04 02:57:09	2024-12-04 02:57:49
7483	38	83	3	2024-12-04 02:57:49	2024-12-04 02:58:30
7490	38	83	3	2024-12-04 02:58:30	2024-12-04 02:59:10
7497	38	83	3	2024-12-04 02:59:10	2024-12-04 02:59:50
7504	38	83	3	2024-12-04 02:59:50	2024-12-04 03:00:31
7511	38	83	3	2024-12-04 03:00:31	2024-12-04 03:01:11
7518	38	83	3	2024-12-04 03:01:11	2024-12-04 03:01:51
7525	38	83	3	2024-12-04 03:01:51	2024-12-04 03:02:32
7532	38	83	3	2024-12-04 03:02:32	2024-12-04 03:03:12
7539	38	83	3	2024-12-04 03:03:12	2024-12-04 03:03:52
7546	38	83	3	2024-12-04 03:03:52	2024-12-04 03:04:33
7553	38	83	3	2024-12-04 03:04:33	2024-12-04 03:05:13
7560	38	83	3	2024-12-04 03:05:13	2024-12-04 03:05:53
7567	38	83	3	2024-12-04 03:05:53	2024-12-04 03:06:33
7574	38	83	3	2024-12-04 03:06:33	2024-12-04 03:07:14
7581	38	83	3	2024-12-04 03:07:14	2024-12-04 03:07:54
7588	38	83	3	2024-12-04 03:07:54	2024-12-04 03:08:34
7595	38	83	3	2024-12-04 03:08:34	2024-12-04 03:09:15
7602	38	83	3	2024-12-04 03:09:15	2024-12-04 03:09:55
7609	38	83	3	2024-12-04 03:09:55	2024-12-04 03:10:35
7616	38	83	3	2024-12-04 03:10:35	2024-12-04 03:11:16
7623	38	83	3	2024-12-04 03:11:16	2024-12-04 03:11:56
7630	38	83	3	2024-12-04 03:11:56	2024-12-04 03:12:36
7637	38	83	3	2024-12-04 03:12:36	2024-12-04 03:13:17
7644	38	83	3	2024-12-04 03:13:17	2024-12-04 03:13:57
7651	38	83	3	2024-12-04 03:13:57	2024-12-04 03:14:37
7658	38	83	3	2024-12-04 03:14:37	2024-12-04 03:15:18
7665	38	83	3	2024-12-04 03:15:18	2024-12-04 03:15:58
7672	38	83	3	2024-12-04 03:15:58	2024-12-04 03:16:38
7679	38	83	3	2024-12-04 03:16:38	2024-12-04 03:17:18
7686	38	83	3	2024-12-04 03:17:18	2024-12-04 03:17:59
7693	38	83	3	2024-12-04 03:17:59	2024-12-04 03:18:39
7700	38	83	3	2024-12-04 03:18:39	2024-12-04 03:19:19
7707	38	83	3	2024-12-04 03:19:19	2024-12-04 03:20:00
7714	38	83	3	2024-12-04 03:20:00	2024-12-04 03:20:40
7721	38	83	3	2024-12-04 03:20:40	2024-12-04 03:21:20
7728	38	83	3	2024-12-04 03:21:20	2024-12-04 03:22:01
7735	38	83	3	2024-12-04 03:22:01	2024-12-04 03:22:41
7742	38	83	3	2024-12-04 03:22:41	2024-12-04 03:23:22
7749	38	83	3	2024-12-04 03:23:22	2024-12-04 03:24:03
7756	38	83	3	2024-12-04 03:24:03	2024-12-04 03:24:44
7763	38	83	3	2024-12-04 03:24:44	2024-12-04 03:25:25
7770	38	83	3	2024-12-04 03:25:25	2024-12-04 03:26:06
7777	38	83	3	2024-12-04 03:26:06	2024-12-04 03:26:46
7784	38	83	3	2024-12-04 03:26:46	2024-12-04 03:27:26
7791	38	83	3	2024-12-04 03:27:26	2024-12-04 03:28:07
7798	38	83	3	2024-12-04 03:28:07	2024-12-04 03:28:47
7805	38	83	3	2024-12-04 03:28:47	2024-12-04 03:29:27
7812	38	83	3	2024-12-04 03:29:27	2024-12-04 03:30:08
7819	38	83	3	2024-12-04 03:30:08	2024-12-04 03:30:48
7826	38	83	3	2024-12-04 03:30:48	2024-12-04 03:31:28
7833	38	83	3	2024-12-04 03:31:28	2024-12-04 03:32:09
7840	38	83	3	2024-12-04 03:32:09	2024-12-04 03:32:49
7847	38	83	3	2024-12-04 03:32:49	2024-12-04 03:33:29
7854	38	83	3	2024-12-04 03:33:29	2024-12-04 03:34:10
7861	38	83	3	2024-12-04 03:34:10	2024-12-04 03:34:50
7868	38	83	3	2024-12-04 03:34:50	2024-12-04 03:35:30
7875	38	83	3	2024-12-04 03:35:30	2024-12-04 03:36:11
3373	38	88	3	2024-12-03 20:22:14	2024-12-03 20:22:54
3380	38	88	3	2024-12-03 20:22:54	2024-12-03 20:23:35
3387	38	88	3	2024-12-03 20:23:35	2024-12-03 20:24:15
3394	38	88	3	2024-12-03 20:24:15	2024-12-03 20:24:55
3401	38	88	3	2024-12-03 20:24:55	2024-12-03 20:25:36
3408	38	88	3	2024-12-03 20:25:36	2024-12-03 20:26:16
3415	38	88	3	2024-12-03 20:26:16	2024-12-03 20:26:56
3422	38	88	3	2024-12-03 20:26:56	2024-12-03 20:27:37
3429	38	88	3	2024-12-03 20:27:37	2024-12-03 20:28:17
3436	38	88	3	2024-12-03 20:28:17	2024-12-03 20:28:57
3443	38	88	3	2024-12-03 20:28:57	2024-12-03 20:29:38
3450	38	88	3	2024-12-03 20:29:38	2024-12-03 20:30:18
3457	38	88	3	2024-12-03 20:30:18	2024-12-03 20:30:59
3464	38	88	3	2024-12-03 20:30:59	2024-12-03 20:31:39
7477	38	84	3	2024-12-04 02:57:17	2024-12-04 02:57:58
7484	38	84	3	2024-12-04 02:57:58	2024-12-04 02:58:38
7491	38	84	3	2024-12-04 02:58:38	2024-12-04 02:59:18
7498	38	84	3	2024-12-04 02:59:18	2024-12-04 02:59:59
7505	38	84	3	2024-12-04 02:59:59	2024-12-04 03:00:39
7512	38	84	3	2024-12-04 03:00:39	2024-12-04 03:01:19
7519	38	84	3	2024-12-04 03:01:19	2024-12-04 03:02:00
7526	38	84	3	2024-12-04 03:02:00	2024-12-04 03:02:40
7533	38	84	3	2024-12-04 03:02:40	2024-12-04 03:03:20
7540	38	84	3	2024-12-04 03:03:20	2024-12-04 03:04:01
7547	38	84	3	2024-12-04 03:04:01	2024-12-04 03:04:41
7554	38	84	3	2024-12-04 03:04:41	2024-12-04 03:05:21
7561	38	84	3	2024-12-04 03:05:21	2024-12-04 03:06:02
7568	38	84	3	2024-12-04 03:06:02	2024-12-04 03:06:42
7575	38	84	3	2024-12-04 03:06:42	2024-12-04 03:07:22
7582	38	84	3	2024-12-04 03:07:22	2024-12-04 03:08:02
7589	38	84	3	2024-12-04 03:08:02	2024-12-04 03:08:43
7596	38	84	3	2024-12-04 03:08:43	2024-12-04 03:09:23
7603	38	84	3	2024-12-04 03:09:23	2024-12-04 03:10:03
7610	38	84	3	2024-12-04 03:10:03	2024-12-04 03:10:44
7617	38	84	3	2024-12-04 03:10:44	2024-12-04 03:11:24
7624	38	84	3	2024-12-04 03:11:24	2024-12-04 03:12:04
7631	38	84	3	2024-12-04 03:12:04	2024-12-04 03:12:45
7638	38	84	3	2024-12-04 03:12:45	2024-12-04 03:13:25
7645	38	84	3	2024-12-04 03:13:25	2024-12-04 03:14:06
7652	38	84	3	2024-12-04 03:14:06	2024-12-04 03:14:46
7659	38	84	3	2024-12-04 03:14:46	2024-12-04 03:15:26
7666	38	84	3	2024-12-04 03:15:26	2024-12-04 03:16:07
7673	38	84	3	2024-12-04 03:16:07	2024-12-04 03:16:47
7680	38	84	3	2024-12-04 03:16:47	2024-12-04 03:17:27
7687	38	84	3	2024-12-04 03:17:27	2024-12-04 03:18:08
7694	38	84	3	2024-12-04 03:18:08	2024-12-04 03:18:48
7701	38	84	3	2024-12-04 03:18:48	2024-12-04 03:19:28
7708	38	84	3	2024-12-04 03:19:28	2024-12-04 03:20:08
7715	38	84	3	2024-12-04 03:20:08	2024-12-04 03:20:49
7722	38	84	3	2024-12-04 03:20:49	2024-12-04 03:21:29
7729	38	84	3	2024-12-04 03:21:29	2024-12-04 03:22:09
7736	38	84	3	2024-12-04 03:22:09	2024-12-04 03:22:50
7743	38	84	3	2024-12-04 03:22:50	2024-12-04 03:23:31
7750	38	84	3	2024-12-04 03:23:31	2024-12-04 03:24:12
7757	38	84	3	2024-12-04 03:24:12	2024-12-04 03:24:53
7764	38	84	3	2024-12-04 03:24:53	2024-12-04 03:25:34
7771	38	84	3	2024-12-04 03:25:34	2024-12-04 03:26:15
7778	38	84	3	2024-12-04 03:26:15	2024-12-04 03:26:55
7785	38	84	3	2024-12-04 03:26:55	2024-12-04 03:27:36
7792	38	84	3	2024-12-04 03:27:36	2024-12-04 03:28:16
7799	38	84	3	2024-12-04 03:28:16	2024-12-04 03:28:57
7806	38	84	3	2024-12-04 03:28:57	2024-12-04 03:29:37
7813	38	84	3	2024-12-04 03:29:37	2024-12-04 03:30:17
7820	38	84	3	2024-12-04 03:30:17	2024-12-04 03:30:57
7827	38	84	3	2024-12-04 03:30:57	2024-12-04 03:31:38
7834	38	84	3	2024-12-04 03:31:38	2024-12-04 03:32:19
7841	38	84	3	2024-12-04 03:32:19	2024-12-04 03:32:59
7848	38	84	3	2024-12-04 03:32:59	2024-12-04 03:33:39
7855	38	84	3	2024-12-04 03:33:39	2024-12-04 03:34:19
7862	38	84	3	2024-12-04 03:34:19	2024-12-04 03:35:00
7869	38	84	3	2024-12-04 03:35:00	2024-12-04 03:35:40
7876	38	84	3	2024-12-04 03:35:40	2024-12-04 03:36:21
3374	38	83	3	2024-12-03 20:22:19	2024-12-03 20:22:59
3381	38	83	3	2024-12-03 20:22:59	2024-12-03 20:23:39
3388	38	83	3	2024-12-03 20:23:39	2024-12-03 20:24:20
3395	38	83	3	2024-12-03 20:24:20	2024-12-03 20:25:00
3402	38	83	3	2024-12-03 20:25:00	2024-12-03 20:25:40
3409	38	83	3	2024-12-03 20:25:40	2024-12-03 20:26:21
3416	38	83	3	2024-12-03 20:26:21	2024-12-03 20:27:01
3423	38	83	3	2024-12-03 20:27:01	2024-12-03 20:27:42
3430	38	83	3	2024-12-03 20:27:42	2024-12-03 20:28:22
3437	38	83	3	2024-12-03 20:28:22	2024-12-03 20:29:02
3444	38	83	3	2024-12-03 20:29:02	2024-12-03 20:29:43
3451	38	83	3	2024-12-03 20:29:43	2024-12-03 20:30:23
3458	38	83	3	2024-12-03 20:30:23	2024-12-03 20:31:03
3465	38	83	3	2024-12-03 20:31:03	2024-12-03 20:31:44
7478	38	87	3	2024-12-04 02:57:26	2024-12-04 02:58:06
7485	38	87	3	2024-12-04 02:58:06	2024-12-04 02:58:47
7492	38	87	3	2024-12-04 02:58:47	2024-12-04 02:59:27
7499	38	87	3	2024-12-04 02:59:27	2024-12-04 03:00:07
7506	38	87	3	2024-12-04 03:00:07	2024-12-04 03:00:47
7513	38	87	3	2024-12-04 03:00:47	2024-12-04 03:01:28
7520	38	87	3	2024-12-04 03:01:28	2024-12-04 03:02:08
7527	38	87	3	2024-12-04 03:02:08	2024-12-04 03:02:49
7534	38	87	3	2024-12-04 03:02:49	2024-12-04 03:03:29
7541	38	87	3	2024-12-04 03:03:29	2024-12-04 03:04:09
7548	38	87	3	2024-12-04 03:04:09	2024-12-04 03:04:50
7555	38	87	3	2024-12-04 03:04:50	2024-12-04 03:05:30
7562	38	87	3	2024-12-04 03:05:30	2024-12-04 03:06:10
7569	38	87	3	2024-12-04 03:06:10	2024-12-04 03:06:51
7576	38	87	3	2024-12-04 03:06:51	2024-12-04 03:07:31
7583	38	87	3	2024-12-04 03:07:31	2024-12-04 03:08:11
7590	38	87	3	2024-12-04 03:08:11	2024-12-04 03:08:52
7597	38	87	3	2024-12-04 03:08:52	2024-12-04 03:09:32
7604	38	87	3	2024-12-04 03:09:32	2024-12-04 03:10:12
7611	38	87	3	2024-12-04 03:10:12	2024-12-04 03:10:53
7618	38	87	3	2024-12-04 03:10:53	2024-12-04 03:11:33
7625	38	87	3	2024-12-04 03:11:33	2024-12-04 03:12:14
7632	38	87	3	2024-12-04 03:12:14	2024-12-04 03:12:54
7639	38	87	3	2024-12-04 03:12:54	2024-12-04 03:13:34
7646	38	87	3	2024-12-04 03:13:34	2024-12-04 03:14:15
7653	38	87	3	2024-12-04 03:14:15	2024-12-04 03:14:55
7660	38	87	3	2024-12-04 03:14:55	2024-12-04 03:15:36
7667	38	87	3	2024-12-04 03:15:36	2024-12-04 03:16:16
7674	38	87	3	2024-12-04 03:16:16	2024-12-04 03:16:56
7681	38	87	3	2024-12-04 03:16:56	2024-12-04 03:17:37
7688	38	87	3	2024-12-04 03:17:37	2024-12-04 03:18:17
7695	38	87	3	2024-12-04 03:18:17	2024-12-04 03:18:57
7702	38	87	3	2024-12-04 03:18:57	2024-12-04 03:19:38
7709	38	87	3	2024-12-04 03:19:38	2024-12-04 03:20:18
7716	38	87	3	2024-12-04 03:20:18	2024-12-04 03:20:59
7723	38	87	3	2024-12-04 03:20:59	2024-12-04 03:21:39
7730	38	87	3	2024-12-04 03:21:39	2024-12-04 03:22:19
7737	38	87	3	2024-12-04 03:22:19	2024-12-04 03:23:00
7744	38	87	3	2024-12-04 03:23:00	2024-12-04 03:23:41
7751	38	87	3	2024-12-04 03:23:41	2024-12-04 03:24:22
7758	38	87	3	2024-12-04 03:24:22	2024-12-04 03:25:03
7765	38	87	3	2024-12-04 03:25:03	2024-12-04 03:25:44
7772	38	87	3	2024-12-04 03:25:44	2024-12-04 03:26:25
7779	38	87	3	2024-12-04 03:26:25	2024-12-04 03:27:06
7786	38	87	3	2024-12-04 03:27:06	2024-12-04 03:27:46
7793	38	87	3	2024-12-04 03:27:46	2024-12-04 03:28:26
7800	38	87	3	2024-12-04 03:28:26	2024-12-04 03:29:07
7807	38	87	3	2024-12-04 03:29:07	2024-12-04 03:29:47
7814	38	87	3	2024-12-04 03:29:47	2024-12-04 03:30:28
7821	38	87	3	2024-12-04 03:30:28	2024-12-04 03:31:08
7828	38	87	3	2024-12-04 03:31:08	2024-12-04 03:31:48
7835	38	87	3	2024-12-04 03:31:48	2024-12-04 03:32:29
7842	38	87	3	2024-12-04 03:32:29	2024-12-04 03:33:09
7849	38	87	3	2024-12-04 03:33:09	2024-12-04 03:33:49
7856	38	87	3	2024-12-04 03:33:49	2024-12-04 03:34:30
7863	38	87	3	2024-12-04 03:34:30	2024-12-04 03:35:10
7870	38	87	3	2024-12-04 03:35:10	2024-12-04 03:35:50
7877	38	87	3	2024-12-04 03:35:50	2024-12-04 03:36:31
3375	38	84	3	2024-12-03 20:22:35	2024-12-03 20:23:15
3382	38	84	3	2024-12-03 20:23:15	2024-12-03 20:23:56
3389	38	84	3	2024-12-03 20:23:56	2024-12-03 20:24:36
3396	38	84	3	2024-12-03 20:24:36	2024-12-03 20:25:16
3403	38	84	3	2024-12-03 20:25:16	2024-12-03 20:25:56
3410	38	84	3	2024-12-03 20:25:56	2024-12-03 20:26:37
3417	38	84	3	2024-12-03 20:26:37	2024-12-03 20:27:17
3424	38	84	3	2024-12-03 20:27:17	2024-12-03 20:27:57
3431	38	84	3	2024-12-03 20:27:57	2024-12-03 20:28:38
3438	38	84	3	2024-12-03 20:28:38	2024-12-03 20:29:18
3445	38	84	3	2024-12-03 20:29:18	2024-12-03 20:29:58
3452	38	84	3	2024-12-03 20:29:58	2024-12-03 20:30:39
3459	38	84	3	2024-12-03 20:30:39	2024-12-03 20:31:19
3466	38	84	3	2024-12-03 20:31:19	2024-12-03 20:31:59
7479	38	81	3	2024-12-04 02:57:31	2024-12-04 02:58:11
7486	38	81	3	2024-12-04 02:58:11	2024-12-04 02:58:52
7493	38	81	3	2024-12-04 02:58:52	2024-12-04 02:59:32
7500	38	81	3	2024-12-04 02:59:32	2024-12-04 03:00:12
7507	38	81	3	2024-12-04 03:00:12	2024-12-04 03:00:53
7514	38	81	3	2024-12-04 03:00:53	2024-12-04 03:01:33
7521	38	81	3	2024-12-04 03:01:33	2024-12-04 03:02:13
7528	38	81	3	2024-12-04 03:02:13	2024-12-04 03:02:54
7535	38	81	3	2024-12-04 03:02:54	2024-12-04 03:03:34
7542	38	81	3	2024-12-04 03:03:34	2024-12-04 03:04:14
7549	38	81	3	2024-12-04 03:04:14	2024-12-04 03:04:55
7556	38	81	3	2024-12-04 03:04:55	2024-12-04 03:05:35
7563	38	81	3	2024-12-04 03:05:35	2024-12-04 03:06:15
7570	38	81	3	2024-12-04 03:06:15	2024-12-04 03:06:56
7577	38	81	3	2024-12-04 03:06:56	2024-12-04 03:07:36
7584	38	81	3	2024-12-04 03:07:36	2024-12-04 03:08:16
7591	38	81	3	2024-12-04 03:08:16	2024-12-04 03:08:57
7598	38	81	3	2024-12-04 03:08:57	2024-12-04 03:09:37
7605	38	81	3	2024-12-04 03:09:37	2024-12-04 03:10:17
7612	38	81	3	2024-12-04 03:10:17	2024-12-04 03:10:58
7619	38	81	3	2024-12-04 03:10:58	2024-12-04 03:11:38
7626	38	81	3	2024-12-04 03:11:38	2024-12-04 03:12:18
7633	38	81	3	2024-12-04 03:12:18	2024-12-04 03:12:59
7640	38	81	3	2024-12-04 03:12:59	2024-12-04 03:13:39
7647	38	81	3	2024-12-04 03:13:39	2024-12-04 03:14:19
7654	38	81	3	2024-12-04 03:14:19	2024-12-04 03:15:00
7661	38	81	3	2024-12-04 03:15:00	2024-12-04 03:15:40
7668	38	81	3	2024-12-04 03:15:40	2024-12-04 03:16:20
7675	38	81	3	2024-12-04 03:16:20	2024-12-04 03:17:01
7682	38	81	3	2024-12-04 03:17:01	2024-12-04 03:17:41
7689	38	81	3	2024-12-04 03:17:41	2024-12-04 03:18:21
7696	38	81	3	2024-12-04 03:18:21	2024-12-04 03:19:02
7703	38	81	3	2024-12-04 03:19:02	2024-12-04 03:19:42
7710	38	81	3	2024-12-04 03:19:42	2024-12-04 03:20:22
7717	38	81	3	2024-12-04 03:20:22	2024-12-04 03:21:02
7724	38	81	3	2024-12-04 03:21:02	2024-12-04 03:21:43
7731	38	81	3	2024-12-04 03:21:43	2024-12-04 03:22:23
7738	38	81	3	2024-12-04 03:22:23	2024-12-04 03:23:04
7745	38	81	3	2024-12-04 03:23:04	2024-12-04 03:23:45
7752	38	81	3	2024-12-04 03:23:45	2024-12-04 03:24:26
7759	38	81	3	2024-12-04 03:24:26	2024-12-04 03:25:07
7766	38	81	3	2024-12-04 03:25:07	2024-12-04 03:25:48
7773	38	81	3	2024-12-04 03:25:48	2024-12-04 03:26:29
7780	38	81	3	2024-12-04 03:26:29	2024-12-04 03:27:09
7787	38	81	3	2024-12-04 03:27:09	2024-12-04 03:27:50
7794	38	81	3	2024-12-04 03:27:50	2024-12-04 03:28:30
7801	38	81	3	2024-12-04 03:28:30	2024-12-04 03:29:10
7808	38	81	3	2024-12-04 03:29:10	2024-12-04 03:29:51
7815	38	81	3	2024-12-04 03:29:51	2024-12-04 03:30:31
7822	38	81	3	2024-12-04 03:30:31	2024-12-04 03:31:11
7829	38	81	3	2024-12-04 03:31:11	2024-12-04 03:31:52
7836	38	81	3	2024-12-04 03:31:52	2024-12-04 03:32:32
7843	38	81	3	2024-12-04 03:32:32	2024-12-04 03:33:12
7850	38	81	3	2024-12-04 03:33:12	2024-12-04 03:33:53
7857	38	81	3	2024-12-04 03:33:53	2024-12-04 03:34:33
7864	38	81	3	2024-12-04 03:34:33	2024-12-04 03:35:13
7871	38	81	3	2024-12-04 03:35:13	2024-12-04 03:35:53
7878	38	81	3	2024-12-04 03:35:53	2024-12-04 03:36:34
3376	38	86	3	2024-12-03 20:22:42	2024-12-03 20:23:22
3383	38	86	3	2024-12-03 20:23:22	2024-12-03 20:24:02
3390	38	86	3	2024-12-03 20:24:02	2024-12-03 20:24:43
3397	38	86	3	2024-12-03 20:24:43	2024-12-03 20:25:23
3404	38	86	3	2024-12-03 20:25:23	2024-12-03 20:26:03
3411	38	86	3	2024-12-03 20:26:03	2024-12-03 20:26:44
3418	38	86	3	2024-12-03 20:26:44	2024-12-03 20:27:24
3425	38	86	3	2024-12-03 20:27:24	2024-12-03 20:28:04
3432	38	86	3	2024-12-03 20:28:04	2024-12-03 20:28:45
3439	38	86	3	2024-12-03 20:28:45	2024-12-03 20:29:25
3446	38	86	3	2024-12-03 20:29:25	2024-12-03 20:30:05
3453	38	86	3	2024-12-03 20:30:05	2024-12-03 20:30:46
3460	38	86	3	2024-12-03 20:30:46	2024-12-03 20:31:26
7480	38	86	3	2024-12-04 02:57:32	2024-12-04 02:58:13
7487	38	86	3	2024-12-04 02:58:13	2024-12-04 02:58:53
7494	38	86	3	2024-12-04 02:58:53	2024-12-04 02:59:34
7501	38	86	3	2024-12-04 02:59:34	2024-12-04 03:00:14
7508	38	86	3	2024-12-04 03:00:14	2024-12-04 03:00:54
7515	38	86	3	2024-12-04 03:00:54	2024-12-04 03:01:35
7522	38	86	3	2024-12-04 03:01:35	2024-12-04 03:02:15
7529	38	86	3	2024-12-04 03:02:15	2024-12-04 03:02:55
7536	38	86	3	2024-12-04 03:02:55	2024-12-04 03:03:36
7543	38	86	3	2024-12-04 03:03:36	2024-12-04 03:04:16
7550	38	86	3	2024-12-04 03:04:16	2024-12-04 03:04:56
7557	38	86	3	2024-12-04 03:04:56	2024-12-04 03:05:37
7564	38	86	3	2024-12-04 03:05:37	2024-12-04 03:06:17
7571	38	86	3	2024-12-04 03:06:17	2024-12-04 03:06:58
7578	38	86	3	2024-12-04 03:06:58	2024-12-04 03:07:38
7585	38	86	3	2024-12-04 03:07:38	2024-12-04 03:08:18
7592	38	86	3	2024-12-04 03:08:18	2024-12-04 03:08:59
7599	38	86	3	2024-12-04 03:08:59	2024-12-04 03:09:39
7606	38	86	3	2024-12-04 03:09:39	2024-12-04 03:10:19
7613	38	86	3	2024-12-04 03:10:19	2024-12-04 03:11:00
7620	38	86	3	2024-12-04 03:11:00	2024-12-04 03:11:40
7627	38	86	3	2024-12-04 03:11:40	2024-12-04 03:12:20
7634	38	86	3	2024-12-04 03:12:20	2024-12-04 03:13:01
7641	38	86	3	2024-12-04 03:13:01	2024-12-04 03:13:41
7648	38	86	3	2024-12-04 03:13:41	2024-12-04 03:14:22
7655	38	86	3	2024-12-04 03:14:22	2024-12-04 03:15:02
7662	38	86	3	2024-12-04 03:15:02	2024-12-04 03:15:42
7669	38	86	3	2024-12-04 03:15:42	2024-12-04 03:16:23
7676	38	86	3	2024-12-04 03:16:23	2024-12-04 03:17:03
7683	38	86	3	2024-12-04 03:17:03	2024-12-04 03:17:43
7690	38	86	3	2024-12-04 03:17:43	2024-12-04 03:18:24
7697	38	86	3	2024-12-04 03:18:24	2024-12-04 03:19:04
7704	38	86	3	2024-12-04 03:19:04	2024-12-04 03:19:44
7711	38	86	3	2024-12-04 03:19:44	2024-12-04 03:20:25
7718	38	86	3	2024-12-04 03:20:25	2024-12-04 03:21:05
7725	38	86	3	2024-12-04 03:21:05	2024-12-04 03:21:46
7732	38	86	3	2024-12-04 03:21:46	2024-12-04 03:22:26
7739	38	86	3	2024-12-04 03:22:26	2024-12-04 03:23:07
7746	38	86	3	2024-12-04 03:23:07	2024-12-04 03:23:48
7753	38	86	3	2024-12-04 03:23:48	2024-12-04 03:24:29
7760	38	86	3	2024-12-04 03:24:29	2024-12-04 03:25:10
7767	38	86	3	2024-12-04 03:25:10	2024-12-04 03:25:51
7774	38	86	3	2024-12-04 03:25:51	2024-12-04 03:26:31
7781	38	86	3	2024-12-04 03:26:31	2024-12-04 03:27:12
7788	38	86	3	2024-12-04 03:27:12	2024-12-04 03:27:52
7795	38	86	3	2024-12-04 03:27:52	2024-12-04 03:28:32
7802	38	86	3	2024-12-04 03:28:32	2024-12-04 03:29:13
7809	38	86	3	2024-12-04 03:29:13	2024-12-04 03:29:53
7816	38	86	3	2024-12-04 03:29:53	2024-12-04 03:30:33
7823	38	86	3	2024-12-04 03:30:33	2024-12-04 03:31:14
7830	38	86	3	2024-12-04 03:31:14	2024-12-04 03:31:54
7837	38	86	3	2024-12-04 03:31:54	2024-12-04 03:32:35
7844	38	86	3	2024-12-04 03:32:35	2024-12-04 03:33:15
7851	38	86	3	2024-12-04 03:33:15	2024-12-04 03:33:55
7858	38	86	3	2024-12-04 03:33:55	2024-12-04 03:34:36
7865	38	86	3	2024-12-04 03:34:36	2024-12-04 03:35:16
7872	38	86	3	2024-12-04 03:35:16	2024-12-04 03:35:56
7879	38	86	3	2024-12-04 03:35:56	2024-12-04 03:36:37
3377	38	87	3	2024-12-03 20:22:44	2024-12-03 20:23:25
3384	38	87	3	2024-12-03 20:23:25	2024-12-03 20:24:05
3391	38	87	3	2024-12-03 20:24:05	2024-12-03 20:24:45
3398	38	87	3	2024-12-03 20:24:45	2024-12-03 20:25:26
3405	38	87	3	2024-12-03 20:25:26	2024-12-03 20:26:06
3412	38	87	3	2024-12-03 20:26:06	2024-12-03 20:26:46
3419	38	87	3	2024-12-03 20:26:46	2024-12-03 20:27:27
3426	38	87	3	2024-12-03 20:27:27	2024-12-03 20:28:07
3433	38	87	3	2024-12-03 20:28:07	2024-12-03 20:28:48
3440	38	87	3	2024-12-03 20:28:48	2024-12-03 20:29:28
3447	38	87	3	2024-12-03 20:29:28	2024-12-03 20:30:08
3454	38	87	3	2024-12-03 20:30:08	2024-12-03 20:30:49
3461	38	87	3	2024-12-03 20:30:49	2024-12-03 20:31:29
3467	38	86	3	2024-12-03 20:31:26	2024-12-03 20:32:06
3468	38	87	3	2024-12-03 20:31:29	2024-12-03 20:32:09
3469	38	81	3	2024-12-03 20:31:32	2024-12-03 20:32:12
3470	38	82	3	2024-12-03 20:31:37	2024-12-03 20:32:17
3471	38	88	3	2024-12-03 20:31:39	2024-12-03 20:32:19
3472	38	83	3	2024-12-03 20:31:44	2024-12-03 20:32:24
3473	38	84	3	2024-12-03 20:31:59	2024-12-03 20:32:40
3474	38	86	3	2024-12-03 20:32:06	2024-12-03 20:32:47
3475	38	87	3	2024-12-03 20:32:09	2024-12-03 20:32:50
3476	38	81	3	2024-12-03 20:32:12	2024-12-03 20:32:52
3477	38	82	3	2024-12-03 20:32:17	2024-12-03 20:32:57
3478	38	88	3	2024-12-03 20:32:19	2024-12-03 20:33:00
3479	38	83	3	2024-12-03 20:32:24	2024-12-03 20:33:04
3480	38	84	3	2024-12-03 20:32:40	2024-12-03 20:33:20
3481	38	86	3	2024-12-03 20:32:47	2024-12-03 20:33:27
3482	38	87	3	2024-12-03 20:32:50	2024-12-03 20:33:30
3483	38	81	3	2024-12-03 20:32:52	2024-12-03 20:33:33
3484	38	82	3	2024-12-03 20:32:57	2024-12-03 20:33:37
3485	38	88	3	2024-12-03 20:33:00	2024-12-03 20:33:40
3486	38	83	3	2024-12-03 20:33:04	2024-12-03 20:33:45
3487	38	84	3	2024-12-03 20:33:20	2024-12-03 20:34:00
3488	38	86	3	2024-12-03 20:33:27	2024-12-03 20:34:07
3489	38	87	3	2024-12-03 20:33:30	2024-12-03 20:34:10
3490	38	81	3	2024-12-03 20:33:33	2024-12-03 20:34:13
3491	38	82	3	2024-12-03 20:33:37	2024-12-03 20:34:18
3492	38	88	3	2024-12-03 20:33:40	2024-12-03 20:34:20
3493	38	83	3	2024-12-03 20:33:45	2024-12-03 20:34:25
3494	38	84	3	2024-12-03 20:34:00	2024-12-03 20:34:41
3495	38	86	3	2024-12-03 20:34:07	2024-12-03 20:34:48
3496	38	87	3	2024-12-03 20:34:10	2024-12-03 20:34:51
3497	38	81	3	2024-12-03 20:34:13	2024-12-03 20:34:54
3498	38	82	3	2024-12-03 20:34:18	2024-12-03 20:34:58
3499	38	88	3	2024-12-03 20:34:20	2024-12-03 20:35:01
3500	38	83	3	2024-12-03 20:34:25	2024-12-03 20:35:06
3501	38	84	3	2024-12-03 20:34:41	2024-12-03 20:35:21
3502	38	86	3	2024-12-03 20:34:48	2024-12-03 20:35:28
3503	38	87	3	2024-12-03 20:34:51	2024-12-03 20:35:31
3504	38	81	3	2024-12-03 20:34:54	2024-12-03 20:35:34
3505	38	82	3	2024-12-03 20:34:58	2024-12-03 20:35:38
3506	38	88	3	2024-12-03 20:35:01	2024-12-03 20:35:41
3507	38	83	3	2024-12-03 20:35:06	2024-12-03 20:35:46
3508	38	84	3	2024-12-03 20:35:21	2024-12-03 20:36:01
3509	38	86	3	2024-12-03 20:35:28	2024-12-03 20:36:09
3510	38	87	3	2024-12-03 20:35:31	2024-12-03 20:36:11
3511	38	81	3	2024-12-03 20:35:34	2024-12-03 20:36:14
3512	38	82	3	2024-12-03 20:35:38	2024-12-03 20:36:19
3513	38	88	3	2024-12-03 20:35:41	2024-12-03 20:36:21
3514	38	83	3	2024-12-03 20:35:46	2024-12-03 20:36:26
3515	38	84	3	2024-12-03 20:36:01	2024-12-03 20:36:42
3516	38	86	3	2024-12-03 20:36:09	2024-12-03 20:36:49
3517	38	87	3	2024-12-03 20:36:11	2024-12-03 20:36:52
3518	38	81	3	2024-12-03 20:36:14	2024-12-03 20:36:55
3519	38	82	3	2024-12-03 20:36:19	2024-12-03 20:36:59
3520	38	88	3	2024-12-03 20:36:21	2024-12-03 20:37:02
3521	38	83	3	2024-12-03 20:36:26	2024-12-03 20:37:07
3522	38	84	3	2024-12-03 20:36:42	2024-12-03 20:37:22
3523	38	86	3	2024-12-03 20:36:49	2024-12-03 20:37:29
3524	38	87	3	2024-12-03 20:36:52	2024-12-03 20:37:32
3525	38	81	3	2024-12-03 20:36:55	2024-12-03 20:37:35
3526	38	82	3	2024-12-03 20:36:59	2024-12-03 20:37:39
3527	38	88	3	2024-12-03 20:37:02	2024-12-03 20:37:42
3528	38	83	3	2024-12-03 20:37:07	2024-12-03 20:37:47
3529	38	84	3	2024-12-03 20:37:22	2024-12-03 20:38:02
3530	38	86	3	2024-12-03 20:37:29	2024-12-03 20:38:10
3531	38	87	3	2024-12-03 20:37:32	2024-12-03 20:38:12
3532	38	81	3	2024-12-03 20:37:35	2024-12-03 20:38:15
3533	38	82	3	2024-12-03 20:37:39	2024-12-03 20:38:20
3534	38	88	3	2024-12-03 20:37:42	2024-12-03 20:38:22
3535	38	83	3	2024-12-03 20:37:47	2024-12-03 20:38:27
3536	38	84	3	2024-12-03 20:38:02	2024-12-03 20:38:43
3537	38	86	3	2024-12-03 20:38:10	2024-12-03 20:38:50
3538	38	87	3	2024-12-03 20:38:12	2024-12-03 20:38:53
3539	38	81	3	2024-12-03 20:38:15	2024-12-03 20:38:56
3540	38	82	3	2024-12-03 20:38:20	2024-12-03 20:39:00
3541	38	88	3	2024-12-03 20:38:22	2024-12-03 20:39:03
3542	38	83	3	2024-12-03 20:38:27	2024-12-03 20:39:08
3543	38	84	3	2024-12-03 20:38:43	2024-12-03 20:39:24
3544	38	86	3	2024-12-03 20:38:50	2024-12-03 20:39:31
3545	38	87	3	2024-12-03 20:38:53	2024-12-03 20:39:34
3546	38	81	3	2024-12-03 20:38:56	2024-12-03 20:39:37
3547	38	82	3	2024-12-03 20:39:00	2024-12-03 20:39:41
3548	38	88	3	2024-12-03 20:39:03	2024-12-03 20:39:44
3549	38	83	3	2024-12-03 20:39:08	2024-12-03 20:39:49
3550	38	84	3	2024-12-03 20:39:24	2024-12-03 20:40:05
3551	38	86	3	2024-12-03 20:39:31	2024-12-03 20:40:12
3552	38	87	3	2024-12-03 20:39:34	2024-12-03 20:40:15
3553	38	81	3	2024-12-03 20:39:37	2024-12-03 20:40:18
3554	38	82	3	2024-12-03 20:39:41	2024-12-03 20:40:22
3555	38	88	3	2024-12-03 20:39:44	2024-12-03 20:40:25
3556	38	83	3	2024-12-03 20:39:49	2024-12-03 20:40:30
3557	38	84	3	2024-12-03 20:40:05	2024-12-03 20:40:46
3558	38	86	3	2024-12-03 20:40:12	2024-12-03 20:40:53
3559	38	87	3	2024-12-03 20:40:15	2024-12-03 20:40:56
3560	38	81	3	2024-12-03 20:40:18	2024-12-03 20:40:59
3561	38	82	3	2024-12-03 20:40:22	2024-12-03 20:41:03
3562	38	88	3	2024-12-03 20:40:25	2024-12-03 20:41:06
3563	38	83	3	2024-12-03 20:40:30	2024-12-03 20:41:10
3564	38	84	3	2024-12-03 20:40:46	2024-12-03 20:41:26
3565	38	86	3	2024-12-03 20:40:53	2024-12-03 20:41:33
3566	38	87	3	2024-12-03 20:40:56	2024-12-03 20:41:36
3573	38	87	3	2024-12-03 20:41:36	2024-12-03 20:42:16
3580	38	87	3	2024-12-03 20:42:16	2024-12-03 20:42:57
3587	38	87	3	2024-12-03 20:42:57	2024-12-03 20:43:37
3594	38	87	3	2024-12-03 20:43:37	2024-12-03 20:44:17
3601	38	87	3	2024-12-03 20:44:17	2024-12-03 20:44:58
3608	38	87	3	2024-12-03 20:44:58	2024-12-03 20:45:38
3615	38	87	3	2024-12-03 20:45:38	2024-12-03 20:46:19
3622	38	87	3	2024-12-03 20:46:19	2024-12-03 20:46:59
3629	38	87	3	2024-12-03 20:46:59	2024-12-03 20:47:39
3636	38	87	3	2024-12-03 20:47:39	2024-12-03 20:48:20
3643	38	87	3	2024-12-03 20:48:20	2024-12-03 20:49:00
3650	38	87	3	2024-12-03 20:49:00	2024-12-03 20:49:40
3657	38	87	3	2024-12-03 20:49:40	2024-12-03 20:50:21
3664	38	87	3	2024-12-03 20:50:21	2024-12-03 20:51:01
7482	38	88	3	2024-12-04 02:57:42	2024-12-04 02:58:23
7489	38	88	3	2024-12-04 02:58:23	2024-12-04 02:59:03
7496	38	88	3	2024-12-04 02:59:03	2024-12-04 02:59:43
7503	38	88	3	2024-12-04 02:59:43	2024-12-04 03:00:24
7510	38	88	3	2024-12-04 03:00:24	2024-12-04 03:01:04
7517	38	88	3	2024-12-04 03:01:04	2024-12-04 03:01:44
7524	38	88	3	2024-12-04 03:01:44	2024-12-04 03:02:25
7531	38	88	3	2024-12-04 03:02:25	2024-12-04 03:03:05
7538	38	88	3	2024-12-04 03:03:05	2024-12-04 03:03:45
7545	38	88	3	2024-12-04 03:03:45	2024-12-04 03:04:26
7552	38	88	3	2024-12-04 03:04:26	2024-12-04 03:05:06
7559	38	88	3	2024-12-04 03:05:06	2024-12-04 03:05:46
7566	38	88	3	2024-12-04 03:05:46	2024-12-04 03:06:27
7573	38	88	3	2024-12-04 03:06:27	2024-12-04 03:07:07
7580	38	88	3	2024-12-04 03:07:07	2024-12-04 03:07:47
7587	38	88	3	2024-12-04 03:07:47	2024-12-04 03:08:28
7594	38	88	3	2024-12-04 03:08:28	2024-12-04 03:09:08
7601	38	88	3	2024-12-04 03:09:08	2024-12-04 03:09:48
7608	38	88	3	2024-12-04 03:09:48	2024-12-04 03:10:29
7615	38	88	3	2024-12-04 03:10:29	2024-12-04 03:11:09
7622	38	88	3	2024-12-04 03:11:09	2024-12-04 03:11:49
7629	38	88	3	2024-12-04 03:11:49	2024-12-04 03:12:30
7636	38	88	3	2024-12-04 03:12:30	2024-12-04 03:13:10
7643	38	88	3	2024-12-04 03:13:10	2024-12-04 03:13:50
7650	38	88	3	2024-12-04 03:13:50	2024-12-04 03:14:31
7657	38	88	3	2024-12-04 03:14:31	2024-12-04 03:15:11
7664	38	88	3	2024-12-04 03:15:11	2024-12-04 03:15:51
7671	38	88	3	2024-12-04 03:15:51	2024-12-04 03:16:32
7678	38	88	3	2024-12-04 03:16:32	2024-12-04 03:17:12
7685	38	88	3	2024-12-04 03:17:12	2024-12-04 03:17:52
7692	38	88	3	2024-12-04 03:17:52	2024-12-04 03:18:33
7699	38	88	3	2024-12-04 03:18:33	2024-12-04 03:19:13
7706	38	88	3	2024-12-04 03:19:13	2024-12-04 03:19:53
7713	38	88	3	2024-12-04 03:19:53	2024-12-04 03:20:34
7720	38	88	3	2024-12-04 03:20:34	2024-12-04 03:21:14
7727	38	88	3	2024-12-04 03:21:14	2024-12-04 03:21:54
7734	38	88	3	2024-12-04 03:21:54	2024-12-04 03:22:35
7741	38	88	3	2024-12-04 03:22:35	2024-12-04 03:23:16
7748	38	88	3	2024-12-04 03:23:16	2024-12-04 03:23:57
7755	38	88	3	2024-12-04 03:23:57	2024-12-04 03:24:38
7762	38	88	3	2024-12-04 03:24:38	2024-12-04 03:25:18
7769	38	88	3	2024-12-04 03:25:18	2024-12-04 03:25:59
7776	38	88	3	2024-12-04 03:25:59	2024-12-04 03:26:40
7783	38	88	3	2024-12-04 03:26:40	2024-12-04 03:27:20
7790	38	88	3	2024-12-04 03:27:20	2024-12-04 03:28:00
7797	38	88	3	2024-12-04 03:28:00	2024-12-04 03:28:41
7804	38	88	3	2024-12-04 03:28:41	2024-12-04 03:29:21
7811	38	88	3	2024-12-04 03:29:21	2024-12-04 03:30:02
7818	38	88	3	2024-12-04 03:30:02	2024-12-04 03:30:42
7825	38	88	3	2024-12-04 03:30:42	2024-12-04 03:31:22
7832	38	88	3	2024-12-04 03:31:22	2024-12-04 03:32:03
7839	38	88	3	2024-12-04 03:32:03	2024-12-04 03:32:43
7846	38	88	3	2024-12-04 03:32:43	2024-12-04 03:33:23
7853	38	88	3	2024-12-04 03:33:23	2024-12-04 03:34:04
7860	38	88	3	2024-12-04 03:34:04	2024-12-04 03:34:44
7867	38	88	3	2024-12-04 03:34:44	2024-12-04 03:35:24
7874	38	88	3	2024-12-04 03:35:24	2024-12-04 03:36:05
3567	38	81	3	2024-12-03 20:40:59	2024-12-03 20:41:39
3574	38	81	3	2024-12-03 20:41:39	2024-12-03 20:42:19
3581	38	81	3	2024-12-03 20:42:19	2024-12-03 20:43:00
3588	38	81	3	2024-12-03 20:43:00	2024-12-03 20:43:40
3595	38	81	3	2024-12-03 20:43:40	2024-12-03 20:44:20
3602	38	81	3	2024-12-03 20:44:20	2024-12-03 20:45:01
3609	38	81	3	2024-12-03 20:45:01	2024-12-03 20:45:41
3616	38	81	3	2024-12-03 20:45:41	2024-12-03 20:46:21
3623	38	81	3	2024-12-03 20:46:21	2024-12-03 20:47:02
3630	38	81	3	2024-12-03 20:47:02	2024-12-03 20:47:42
3637	38	81	3	2024-12-03 20:47:42	2024-12-03 20:48:22
3644	38	81	3	2024-12-03 20:48:22	2024-12-03 20:49:03
3651	38	81	3	2024-12-03 20:49:03	2024-12-03 20:49:43
3658	38	81	3	2024-12-03 20:49:43	2024-12-03 20:50:23
3665	38	81	3	2024-12-03 20:50:23	2024-12-03 20:51:04
7481	38	82	3	2024-12-04 02:57:42	2024-12-04 02:58:22
7488	38	82	3	2024-12-04 02:58:22	2024-12-04 02:59:02
7495	38	82	3	2024-12-04 02:59:02	2024-12-04 02:59:43
7502	38	82	3	2024-12-04 02:59:43	2024-12-04 03:00:23
7509	38	82	3	2024-12-04 03:00:23	2024-12-04 03:01:03
7516	38	82	3	2024-12-04 03:01:03	2024-12-04 03:01:44
7523	38	82	3	2024-12-04 03:01:44	2024-12-04 03:02:24
7530	38	82	3	2024-12-04 03:02:24	2024-12-04 03:03:04
7537	38	82	3	2024-12-04 03:03:04	2024-12-04 03:03:45
7544	38	82	3	2024-12-04 03:03:45	2024-12-04 03:04:25
7551	38	82	3	2024-12-04 03:04:25	2024-12-04 03:05:05
7558	38	82	3	2024-12-04 03:05:05	2024-12-04 03:05:46
7565	38	82	3	2024-12-04 03:05:46	2024-12-04 03:06:26
7572	38	82	3	2024-12-04 03:06:26	2024-12-04 03:07:06
7579	38	82	3	2024-12-04 03:07:06	2024-12-04 03:07:47
7586	38	82	3	2024-12-04 03:07:47	2024-12-04 03:08:27
7593	38	82	3	2024-12-04 03:08:27	2024-12-04 03:09:07
7600	38	82	3	2024-12-04 03:09:07	2024-12-04 03:09:47
7607	38	82	3	2024-12-04 03:09:47	2024-12-04 03:10:28
7614	38	82	3	2024-12-04 03:10:28	2024-12-04 03:11:08
7621	38	82	3	2024-12-04 03:11:08	2024-12-04 03:11:48
7628	38	82	3	2024-12-04 03:11:48	2024-12-04 03:12:29
7635	38	82	3	2024-12-04 03:12:29	2024-12-04 03:13:09
7642	38	82	3	2024-12-04 03:13:09	2024-12-04 03:13:50
7649	38	82	3	2024-12-04 03:13:50	2024-12-04 03:14:30
7656	38	82	3	2024-12-04 03:14:30	2024-12-04 03:15:10
7663	38	82	3	2024-12-04 03:15:10	2024-12-04 03:15:51
7670	38	82	3	2024-12-04 03:15:51	2024-12-04 03:16:31
7677	38	82	3	2024-12-04 03:16:31	2024-12-04 03:17:11
7684	38	82	3	2024-12-04 03:17:11	2024-12-04 03:17:52
7691	38	82	3	2024-12-04 03:17:52	2024-12-04 03:18:32
7698	38	82	3	2024-12-04 03:18:32	2024-12-04 03:19:12
7705	38	82	3	2024-12-04 03:19:12	2024-12-04 03:19:53
7712	38	82	3	2024-12-04 03:19:53	2024-12-04 03:20:33
7719	38	82	3	2024-12-04 03:20:33	2024-12-04 03:21:13
7726	38	82	3	2024-12-04 03:21:13	2024-12-04 03:21:54
7733	38	82	3	2024-12-04 03:21:54	2024-12-04 03:22:34
7740	38	82	3	2024-12-04 03:22:34	2024-12-04 03:23:15
7747	38	82	3	2024-12-04 03:23:15	2024-12-04 03:23:56
7754	38	82	3	2024-12-04 03:23:56	2024-12-04 03:24:37
7761	38	82	3	2024-12-04 03:24:37	2024-12-04 03:25:18
7768	38	82	3	2024-12-04 03:25:18	2024-12-04 03:25:59
7775	38	82	3	2024-12-04 03:25:59	2024-12-04 03:26:39
7782	38	82	3	2024-12-04 03:26:39	2024-12-04 03:27:20
7789	38	82	3	2024-12-04 03:27:20	2024-12-04 03:28:00
7796	38	82	3	2024-12-04 03:28:00	2024-12-04 03:28:40
7803	38	82	3	2024-12-04 03:28:40	2024-12-04 03:29:21
7810	38	82	3	2024-12-04 03:29:21	2024-12-04 03:30:01
7817	38	82	3	2024-12-04 03:30:01	2024-12-04 03:30:41
7824	38	82	3	2024-12-04 03:30:41	2024-12-04 03:31:22
7831	38	82	3	2024-12-04 03:31:22	2024-12-04 03:32:02
7838	38	82	3	2024-12-04 03:32:02	2024-12-04 03:32:42
7845	38	82	3	2024-12-04 03:32:42	2024-12-04 03:33:23
7852	38	82	3	2024-12-04 03:33:23	2024-12-04 03:34:03
7859	38	82	3	2024-12-04 03:34:03	2024-12-04 03:34:43
7866	38	82	3	2024-12-04 03:34:43	2024-12-04 03:35:24
7873	38	82	3	2024-12-04 03:35:24	2024-12-04 03:36:05
7880	38	82	3	2024-12-04 03:36:05	2024-12-04 03:36:46
3568	38	82	3	2024-12-03 20:41:03	2024-12-03 20:41:44
3575	38	82	3	2024-12-03 20:41:44	2024-12-03 20:42:24
3582	38	82	3	2024-12-03 20:42:24	2024-12-03 20:43:04
3589	38	82	3	2024-12-03 20:43:04	2024-12-03 20:43:45
3596	38	82	3	2024-12-03 20:43:45	2024-12-03 20:44:25
3603	38	82	3	2024-12-03 20:44:25	2024-12-03 20:45:05
3610	38	82	3	2024-12-03 20:45:05	2024-12-03 20:45:46
3617	38	82	3	2024-12-03 20:45:46	2024-12-03 20:46:26
3624	38	82	3	2024-12-03 20:46:26	2024-12-03 20:47:06
3631	38	82	3	2024-12-03 20:47:06	2024-12-03 20:47:47
3638	38	82	3	2024-12-03 20:47:47	2024-12-03 20:48:27
3645	38	82	3	2024-12-03 20:48:27	2024-12-03 20:49:07
3652	38	82	3	2024-12-03 20:49:07	2024-12-03 20:49:47
3659	38	82	3	2024-12-03 20:49:47	2024-12-03 20:50:28
3666	38	82	3	2024-12-03 20:50:28	2024-12-03 20:51:08
7881	38	88	3	2024-12-04 03:36:05	2024-12-04 03:36:46
7888	38	88	3	2024-12-04 03:36:46	2024-12-04 03:37:27
7895	38	88	3	2024-12-04 03:37:27	2024-12-04 03:38:07
7902	38	88	3	2024-12-04 03:38:07	2024-12-04 03:38:48
7909	38	88	3	2024-12-04 03:38:48	2024-12-04 03:39:28
7916	38	88	3	2024-12-04 03:39:28	2024-12-04 03:40:08
7923	38	88	3	2024-12-04 03:40:08	2024-12-04 03:40:49
7930	38	88	3	2024-12-04 03:40:49	2024-12-04 03:41:29
7937	38	88	3	2024-12-04 03:41:29	2024-12-04 03:42:10
7944	38	88	3	2024-12-04 03:42:10	2024-12-04 03:42:50
7951	38	88	3	2024-12-04 03:42:50	2024-12-04 03:43:30
7958	38	88	3	2024-12-04 03:43:30	2024-12-04 03:44:11
7965	38	88	3	2024-12-04 03:44:11	2024-12-04 03:44:51
7972	38	88	3	2024-12-04 03:44:51	2024-12-04 03:45:31
7979	38	88	3	2024-12-04 03:45:31	2024-12-04 03:46:12
7986	38	88	3	2024-12-04 03:46:12	2024-12-04 03:46:52
7993	38	88	3	2024-12-04 03:46:52	2024-12-04 03:47:32
8000	38	88	3	2024-12-04 03:47:32	2024-12-04 03:48:13
8007	38	88	3	2024-12-04 03:48:13	2024-12-04 03:48:53
8014	38	88	3	2024-12-04 03:48:53	2024-12-04 03:49:33
8021	38	88	3	2024-12-04 03:49:33	2024-12-04 03:50:14
8028	38	88	3	2024-12-04 03:50:14	2024-12-04 03:50:54
8035	38	88	3	2024-12-04 03:50:54	2024-12-04 03:51:35
8042	38	88	3	2024-12-04 03:51:35	2024-12-04 03:52:15
8049	38	88	3	2024-12-04 03:52:15	2024-12-04 03:52:55
8056	38	88	3	2024-12-04 03:52:55	2024-12-04 03:53:36
8063	38	88	3	2024-12-04 03:53:36	2024-12-04 03:54:16
8070	38	88	3	2024-12-04 03:54:16	2024-12-04 03:54:56
8077	38	88	3	2024-12-04 03:54:56	2024-12-04 03:55:37
8084	38	88	3	2024-12-04 03:55:37	2024-12-04 03:56:18
8091	38	88	3	2024-12-04 03:56:18	2024-12-04 03:56:59
8098	38	88	3	2024-12-04 03:56:59	2024-12-04 03:57:40
8105	38	88	3	2024-12-04 03:57:40	2024-12-04 03:58:21
8112	38	88	3	2024-12-04 03:58:21	2024-12-04 03:59:02
8119	38	88	3	2024-12-04 03:59:02	2024-12-04 03:59:42
8126	38	88	3	2024-12-04 03:59:42	2024-12-04 04:00:22
8133	38	88	3	2024-12-04 04:00:22	2024-12-04 04:01:03
8140	38	88	3	2024-12-04 04:01:03	2024-12-04 04:01:43
8147	38	88	3	2024-12-04 04:01:43	2024-12-04 04:02:23
8154	38	88	3	2024-12-04 04:02:23	2024-12-04 04:03:04
8161	38	88	3	2024-12-04 04:03:04	2024-12-04 04:03:44
8168	38	88	3	2024-12-04 04:03:44	2024-12-04 04:04:24
8175	38	88	3	2024-12-04 04:04:24	2024-12-04 04:05:05
8182	38	88	3	2024-12-04 04:05:05	2024-12-04 04:05:45
8189	38	88	3	2024-12-04 04:05:45	2024-12-04 04:06:25
8196	38	88	3	2024-12-04 04:06:25	2024-12-04 04:07:06
8203	38	88	3	2024-12-04 04:07:06	2024-12-04 04:07:46
8210	38	88	3	2024-12-04 04:07:46	2024-12-04 04:08:27
8217	38	88	3	2024-12-04 04:08:27	2024-12-04 04:09:07
8224	38	88	3	2024-12-04 04:09:07	2024-12-04 04:09:47
8231	38	88	3	2024-12-04 04:09:47	2024-12-04 04:10:28
8238	38	88	3	2024-12-04 04:10:28	2024-12-04 04:11:08
8245	38	88	3	2024-12-04 04:11:08	2024-12-04 04:11:48
8252	38	88	3	2024-12-04 04:11:48	2024-12-04 04:12:29
8259	38	88	3	2024-12-04 04:12:29	2024-12-04 04:13:09
8266	38	88	3	2024-12-04 04:13:09	2024-12-04 04:13:49
8273	38	88	3	2024-12-04 04:13:49	2024-12-04 04:14:30
8280	38	88	3	2024-12-04 04:14:30	2024-12-04 04:15:10
8287	38	88	3	2024-12-04 04:15:10	2024-12-04 04:15:51
8294	38	88	3	2024-12-04 04:15:51	2024-12-04 04:16:31
3569	38	88	3	2024-12-03 20:41:06	2024-12-03 20:41:46
3576	38	88	3	2024-12-03 20:41:46	2024-12-03 20:42:26
3583	38	88	3	2024-12-03 20:42:26	2024-12-03 20:43:07
3590	38	88	3	2024-12-03 20:43:07	2024-12-03 20:43:47
3597	38	88	3	2024-12-03 20:43:47	2024-12-03 20:44:27
3604	38	88	3	2024-12-03 20:44:27	2024-12-03 20:45:08
3611	38	88	3	2024-12-03 20:45:08	2024-12-03 20:45:48
3618	38	88	3	2024-12-03 20:45:48	2024-12-03 20:46:28
3625	38	88	3	2024-12-03 20:46:28	2024-12-03 20:47:09
3632	38	88	3	2024-12-03 20:47:09	2024-12-03 20:47:49
3639	38	88	3	2024-12-03 20:47:49	2024-12-03 20:48:30
3646	38	88	3	2024-12-03 20:48:30	2024-12-03 20:49:10
3653	38	88	3	2024-12-03 20:49:10	2024-12-03 20:49:50
3660	38	88	3	2024-12-03 20:49:50	2024-12-03 20:50:31
7882	38	83	3	2024-12-04 03:36:11	2024-12-04 03:36:52
7889	38	83	3	2024-12-04 03:36:52	2024-12-04 03:37:33
7896	38	83	3	2024-12-04 03:37:33	2024-12-04 03:38:13
7903	38	83	3	2024-12-04 03:38:13	2024-12-04 03:38:53
7910	38	83	3	2024-12-04 03:38:53	2024-12-04 03:39:34
7917	38	83	3	2024-12-04 03:39:34	2024-12-04 03:40:14
7924	38	83	3	2024-12-04 03:40:14	2024-12-04 03:40:54
7931	38	83	3	2024-12-04 03:40:54	2024-12-04 03:41:34
7938	38	83	3	2024-12-04 03:41:34	2024-12-04 03:42:15
7945	38	83	3	2024-12-04 03:42:15	2024-12-04 03:42:56
7952	38	83	3	2024-12-04 03:42:56	2024-12-04 03:43:36
7959	38	83	3	2024-12-04 03:43:36	2024-12-04 03:44:16
7966	38	83	3	2024-12-04 03:44:16	2024-12-04 03:44:57
7973	38	83	3	2024-12-04 03:44:57	2024-12-04 03:45:37
7980	38	83	3	2024-12-04 03:45:37	2024-12-04 03:46:17
7987	38	83	3	2024-12-04 03:46:17	2024-12-04 03:46:58
7994	38	83	3	2024-12-04 03:46:58	2024-12-04 03:47:38
8001	38	83	3	2024-12-04 03:47:38	2024-12-04 03:48:18
8008	38	83	3	2024-12-04 03:48:18	2024-12-04 03:48:59
8015	38	83	3	2024-12-04 03:48:59	2024-12-04 03:49:39
8022	38	83	3	2024-12-04 03:49:39	2024-12-04 03:50:19
8029	38	83	3	2024-12-04 03:50:19	2024-12-04 03:51:00
8036	38	83	3	2024-12-04 03:51:00	2024-12-04 03:51:40
8043	38	83	3	2024-12-04 03:51:40	2024-12-04 03:52:20
8050	38	83	3	2024-12-04 03:52:20	2024-12-04 03:53:01
8057	38	83	3	2024-12-04 03:53:01	2024-12-04 03:53:41
8064	38	83	3	2024-12-04 03:53:41	2024-12-04 03:54:21
8071	38	83	3	2024-12-04 03:54:21	2024-12-04 03:55:02
8078	38	83	3	2024-12-04 03:55:02	2024-12-04 03:55:43
8085	38	83	3	2024-12-04 03:55:43	2024-12-04 03:56:24
8092	38	83	3	2024-12-04 03:56:24	2024-12-04 03:57:05
8099	38	83	3	2024-12-04 03:57:05	2024-12-04 03:57:45
8106	38	83	3	2024-12-04 03:57:45	2024-12-04 03:58:26
8113	38	83	3	2024-12-04 03:58:26	2024-12-04 03:59:06
8120	38	83	3	2024-12-04 03:59:06	2024-12-04 03:59:47
8127	38	83	3	2024-12-04 03:59:47	2024-12-04 04:00:27
8134	38	83	3	2024-12-04 04:00:27	2024-12-04 04:01:07
8141	38	83	3	2024-12-04 04:01:07	2024-12-04 04:01:48
8148	38	83	3	2024-12-04 04:01:48	2024-12-04 04:02:28
8155	38	83	3	2024-12-04 04:02:28	2024-12-04 04:03:09
8162	38	83	3	2024-12-04 04:03:09	2024-12-04 04:03:49
8169	38	83	3	2024-12-04 04:03:49	2024-12-04 04:04:29
8176	38	83	3	2024-12-04 04:04:29	2024-12-04 04:05:09
8183	38	83	3	2024-12-04 04:05:09	2024-12-04 04:05:50
8190	38	83	3	2024-12-04 04:05:50	2024-12-04 04:06:30
8197	38	83	3	2024-12-04 04:06:30	2024-12-04 04:07:10
8204	38	83	3	2024-12-04 04:07:10	2024-12-04 04:07:51
8211	38	83	3	2024-12-04 04:07:51	2024-12-04 04:08:31
8218	38	83	3	2024-12-04 04:08:31	2024-12-04 04:09:11
8225	38	83	3	2024-12-04 04:09:11	2024-12-04 04:09:52
8232	38	83	3	2024-12-04 04:09:52	2024-12-04 04:10:32
8239	38	83	3	2024-12-04 04:10:32	2024-12-04 04:11:12
8246	38	83	3	2024-12-04 04:11:12	2024-12-04 04:11:53
8253	38	83	3	2024-12-04 04:11:53	2024-12-04 04:12:33
8260	38	83	3	2024-12-04 04:12:33	2024-12-04 04:13:13
8267	38	83	3	2024-12-04 04:13:13	2024-12-04 04:13:54
8274	38	83	3	2024-12-04 04:13:54	2024-12-04 04:14:34
8281	38	83	3	2024-12-04 04:14:34	2024-12-04 04:15:14
8288	38	83	3	2024-12-04 04:15:14	2024-12-04 04:15:55
8295	38	83	3	2024-12-04 04:15:55	2024-12-04 04:16:35
3570	38	83	3	2024-12-03 20:41:10	2024-12-03 20:41:50
3577	38	83	3	2024-12-03 20:41:50	2024-12-03 20:42:31
3584	38	83	3	2024-12-03 20:42:31	2024-12-03 20:43:11
3591	38	83	3	2024-12-03 20:43:11	2024-12-03 20:43:52
3598	38	83	3	2024-12-03 20:43:52	2024-12-03 20:44:32
3605	38	83	3	2024-12-03 20:44:32	2024-12-03 20:45:12
3612	38	83	3	2024-12-03 20:45:12	2024-12-03 20:45:53
3619	38	83	3	2024-12-03 20:45:53	2024-12-03 20:46:33
3626	38	83	3	2024-12-03 20:46:33	2024-12-03 20:47:13
3633	38	83	3	2024-12-03 20:47:13	2024-12-03 20:47:54
3640	38	83	3	2024-12-03 20:47:54	2024-12-03 20:48:34
3647	38	83	3	2024-12-03 20:48:34	2024-12-03 20:49:14
3654	38	83	3	2024-12-03 20:49:14	2024-12-03 20:49:55
3661	38	83	3	2024-12-03 20:49:55	2024-12-03 20:50:35
7883	38	84	3	2024-12-04 03:36:21	2024-12-04 03:37:02
7890	38	84	3	2024-12-04 03:37:02	2024-12-04 03:37:42
7897	38	84	3	2024-12-04 03:37:42	2024-12-04 03:38:23
7904	38	84	3	2024-12-04 03:38:23	2024-12-04 03:39:03
7911	38	84	3	2024-12-04 03:39:03	2024-12-04 03:39:43
7918	38	84	3	2024-12-04 03:39:43	2024-12-04 03:40:24
7925	38	84	3	2024-12-04 03:40:24	2024-12-04 03:41:04
7932	38	84	3	2024-12-04 03:41:04	2024-12-04 03:41:44
7939	38	84	3	2024-12-04 03:41:44	2024-12-04 03:42:25
7946	38	84	3	2024-12-04 03:42:25	2024-12-04 03:43:05
7953	38	84	3	2024-12-04 03:43:05	2024-12-04 03:43:45
7960	38	84	3	2024-12-04 03:43:45	2024-12-04 03:44:26
7967	38	84	3	2024-12-04 03:44:26	2024-12-04 03:45:06
7974	38	84	3	2024-12-04 03:45:06	2024-12-04 03:45:46
7981	38	84	3	2024-12-04 03:45:46	2024-12-04 03:46:27
7988	38	84	3	2024-12-04 03:46:27	2024-12-04 03:47:07
7995	38	84	3	2024-12-04 03:47:07	2024-12-04 03:47:48
8002	38	84	3	2024-12-04 03:47:48	2024-12-04 03:48:28
8009	38	84	3	2024-12-04 03:48:28	2024-12-04 03:49:08
8016	38	84	3	2024-12-04 03:49:08	2024-12-04 03:49:49
8023	38	84	3	2024-12-04 03:49:49	2024-12-04 03:50:29
8030	38	84	3	2024-12-04 03:50:29	2024-12-04 03:51:09
8037	38	84	3	2024-12-04 03:51:09	2024-12-04 03:51:50
8044	38	84	3	2024-12-04 03:51:50	2024-12-04 03:52:30
8051	38	84	3	2024-12-04 03:52:30	2024-12-04 03:53:10
8058	38	84	3	2024-12-04 03:53:10	2024-12-04 03:53:51
8065	38	84	3	2024-12-04 03:53:51	2024-12-04 03:54:31
8072	38	84	3	2024-12-04 03:54:31	2024-12-04 03:55:11
8079	38	84	3	2024-12-04 03:55:11	2024-12-04 03:55:52
8086	38	84	3	2024-12-04 03:55:52	2024-12-04 03:56:33
8093	38	84	3	2024-12-04 03:56:33	2024-12-04 03:57:14
8100	38	84	3	2024-12-04 03:57:14	2024-12-04 03:57:55
8107	38	84	3	2024-12-04 03:57:55	2024-12-04 03:58:36
8114	38	84	3	2024-12-04 03:58:36	2024-12-04 03:59:16
8121	38	84	3	2024-12-04 03:59:16	2024-12-04 03:59:56
8128	38	84	3	2024-12-04 03:59:56	2024-12-04 04:00:37
8135	38	84	3	2024-12-04 04:00:37	2024-12-04 04:01:17
8142	38	84	3	2024-12-04 04:01:17	2024-12-04 04:01:57
8149	38	84	3	2024-12-04 04:01:57	2024-12-04 04:02:38
8156	38	84	3	2024-12-04 04:02:38	2024-12-04 04:03:18
8163	38	84	3	2024-12-04 04:03:18	2024-12-04 04:03:59
8170	38	84	3	2024-12-04 04:03:59	2024-12-04 04:04:39
8177	38	84	3	2024-12-04 04:04:39	2024-12-04 04:05:19
8184	38	84	3	2024-12-04 04:05:19	2024-12-04 04:06:00
8191	38	84	3	2024-12-04 04:06:00	2024-12-04 04:06:40
8198	38	84	3	2024-12-04 04:06:40	2024-12-04 04:07:20
8205	38	84	3	2024-12-04 04:07:20	2024-12-04 04:08:01
8212	38	84	3	2024-12-04 04:08:01	2024-12-04 04:08:41
8219	38	84	3	2024-12-04 04:08:41	2024-12-04 04:09:21
8226	38	84	3	2024-12-04 04:09:21	2024-12-04 04:10:02
8233	38	84	3	2024-12-04 04:10:02	2024-12-04 04:10:42
8240	38	84	3	2024-12-04 04:10:42	2024-12-04 04:11:23
8247	38	84	3	2024-12-04 04:11:23	2024-12-04 04:12:03
8254	38	84	3	2024-12-04 04:12:03	2024-12-04 04:12:43
8261	38	84	3	2024-12-04 04:12:43	2024-12-04 04:13:24
8268	38	84	3	2024-12-04 04:13:24	2024-12-04 04:14:04
8275	38	84	3	2024-12-04 04:14:04	2024-12-04 04:14:44
8282	38	84	3	2024-12-04 04:14:44	2024-12-04 04:15:25
8289	38	84	3	2024-12-04 04:15:25	2024-12-04 04:16:05
8296	38	84	3	2024-12-04 04:16:05	2024-12-04 04:16:45
3571	38	84	3	2024-12-03 20:41:26	2024-12-03 20:42:06
3578	38	84	3	2024-12-03 20:42:06	2024-12-03 20:42:46
3585	38	84	3	2024-12-03 20:42:46	2024-12-03 20:43:27
3592	38	84	3	2024-12-03 20:43:27	2024-12-03 20:44:07
3599	38	84	3	2024-12-03 20:44:07	2024-12-03 20:44:47
3606	38	84	3	2024-12-03 20:44:47	2024-12-03 20:45:28
3613	38	84	3	2024-12-03 20:45:28	2024-12-03 20:46:08
3620	38	84	3	2024-12-03 20:46:08	2024-12-03 20:46:48
3627	38	84	3	2024-12-03 20:46:48	2024-12-03 20:47:29
3634	38	84	3	2024-12-03 20:47:29	2024-12-03 20:48:09
3641	38	84	3	2024-12-03 20:48:09	2024-12-03 20:48:49
3648	38	84	3	2024-12-03 20:48:49	2024-12-03 20:49:30
3655	38	84	3	2024-12-03 20:49:30	2024-12-03 20:50:10
3662	38	84	3	2024-12-03 20:50:10	2024-12-03 20:50:50
7884	38	87	3	2024-12-04 03:36:31	2024-12-04 03:37:12
7891	38	87	3	2024-12-04 03:37:12	2024-12-04 03:37:52
7898	38	87	3	2024-12-04 03:37:52	2024-12-04 03:38:33
7905	38	87	3	2024-12-04 03:38:33	2024-12-04 03:39:13
7912	38	87	3	2024-12-04 03:39:13	2024-12-04 03:39:53
7919	38	87	3	2024-12-04 03:39:53	2024-12-04 03:40:34
7926	38	87	3	2024-12-04 03:40:34	2024-12-04 03:41:14
7933	38	87	3	2024-12-04 03:41:14	2024-12-04 03:41:54
7940	38	87	3	2024-12-04 03:41:54	2024-12-04 03:42:35
7947	38	87	3	2024-12-04 03:42:35	2024-12-04 03:43:15
7954	38	87	3	2024-12-04 03:43:15	2024-12-04 03:43:55
7961	38	87	3	2024-12-04 03:43:55	2024-12-04 03:44:36
7968	38	87	3	2024-12-04 03:44:36	2024-12-04 03:45:16
7975	38	87	3	2024-12-04 03:45:16	2024-12-04 03:45:57
7982	38	87	3	2024-12-04 03:45:57	2024-12-04 03:46:37
7989	38	87	3	2024-12-04 03:46:37	2024-12-04 03:47:17
7996	38	87	3	2024-12-04 03:47:17	2024-12-04 03:47:58
8003	38	87	3	2024-12-04 03:47:58	2024-12-04 03:48:38
8010	38	87	3	2024-12-04 03:48:38	2024-12-04 03:49:18
8017	38	87	3	2024-12-04 03:49:18	2024-12-04 03:49:59
8024	38	87	3	2024-12-04 03:49:59	2024-12-04 03:50:39
8031	38	87	3	2024-12-04 03:50:39	2024-12-04 03:51:19
8038	38	87	3	2024-12-04 03:51:19	2024-12-04 03:52:00
8045	38	87	3	2024-12-04 03:52:00	2024-12-04 03:52:40
8052	38	87	3	2024-12-04 03:52:40	2024-12-04 03:53:20
8059	38	87	3	2024-12-04 03:53:20	2024-12-04 03:54:01
8066	38	87	3	2024-12-04 03:54:01	2024-12-04 03:54:41
8073	38	87	3	2024-12-04 03:54:41	2024-12-04 03:55:22
8080	38	87	3	2024-12-04 03:55:22	2024-12-04 03:56:03
8087	38	87	3	2024-12-04 03:56:03	2024-12-04 03:56:44
8094	38	87	3	2024-12-04 03:56:44	2024-12-04 03:57:25
8101	38	87	3	2024-12-04 03:57:25	2024-12-04 03:58:06
8108	38	87	3	2024-12-04 03:58:06	2024-12-04 03:58:46
8115	38	87	3	2024-12-04 03:58:46	2024-12-04 03:59:27
8122	38	87	3	2024-12-04 03:59:27	2024-12-04 04:00:07
8129	38	87	3	2024-12-04 04:00:07	2024-12-04 04:00:48
8136	38	87	3	2024-12-04 04:00:48	2024-12-04 04:01:28
8143	38	87	3	2024-12-04 04:01:28	2024-12-04 04:02:08
8150	38	87	3	2024-12-04 04:02:08	2024-12-04 04:02:49
8157	38	87	3	2024-12-04 04:02:49	2024-12-04 04:03:29
8164	38	87	3	2024-12-04 04:03:29	2024-12-04 04:04:10
8171	38	87	3	2024-12-04 04:04:10	2024-12-04 04:04:50
8178	38	87	3	2024-12-04 04:04:50	2024-12-04 04:05:31
8185	38	87	3	2024-12-04 04:05:31	2024-12-04 04:06:11
8192	38	87	3	2024-12-04 04:06:11	2024-12-04 04:06:51
8199	38	87	3	2024-12-04 04:06:51	2024-12-04 04:07:32
8206	38	87	3	2024-12-04 04:07:32	2024-12-04 04:08:12
8213	38	87	3	2024-12-04 04:08:12	2024-12-04 04:08:52
8220	38	87	3	2024-12-04 04:08:52	2024-12-04 04:09:33
8227	38	87	3	2024-12-04 04:09:33	2024-12-04 04:10:13
8234	38	87	3	2024-12-04 04:10:13	2024-12-04 04:10:53
8241	38	87	3	2024-12-04 04:10:53	2024-12-04 04:11:34
8248	38	87	3	2024-12-04 04:11:34	2024-12-04 04:12:14
8255	38	87	3	2024-12-04 04:12:14	2024-12-04 04:12:55
8262	38	87	3	2024-12-04 04:12:55	2024-12-04 04:13:35
8269	38	87	3	2024-12-04 04:13:35	2024-12-04 04:14:15
8276	38	87	3	2024-12-04 04:14:15	2024-12-04 04:14:56
8283	38	87	3	2024-12-04 04:14:56	2024-12-04 04:15:36
8290	38	87	3	2024-12-04 04:15:36	2024-12-04 04:16:17
8297	38	87	3	2024-12-04 04:16:17	2024-12-04 04:16:57
3572	38	86	3	2024-12-03 20:41:33	2024-12-03 20:42:14
3579	38	86	3	2024-12-03 20:42:14	2024-12-03 20:42:54
3586	38	86	3	2024-12-03 20:42:54	2024-12-03 20:43:34
3593	38	86	3	2024-12-03 20:43:34	2024-12-03 20:44:15
3600	38	86	3	2024-12-03 20:44:15	2024-12-03 20:44:55
3607	38	86	3	2024-12-03 20:44:55	2024-12-03 20:45:35
3614	38	86	3	2024-12-03 20:45:35	2024-12-03 20:46:16
3621	38	86	3	2024-12-03 20:46:16	2024-12-03 20:46:56
3628	38	86	3	2024-12-03 20:46:56	2024-12-03 20:47:36
3635	38	86	3	2024-12-03 20:47:36	2024-12-03 20:48:17
3642	38	86	3	2024-12-03 20:48:17	2024-12-03 20:48:57
3649	38	86	3	2024-12-03 20:48:57	2024-12-03 20:49:37
3656	38	86	3	2024-12-03 20:49:37	2024-12-03 20:50:18
3663	38	86	3	2024-12-03 20:50:18	2024-12-03 20:50:58
3667	38	88	3	2024-12-03 20:50:31	2024-12-03 20:51:11
3668	38	83	3	2024-12-03 20:50:35	2024-12-03 20:51:15
3669	38	84	3	2024-12-03 20:50:50	2024-12-03 20:51:31
3670	38	86	3	2024-12-03 20:50:58	2024-12-03 20:51:39
3671	38	87	3	2024-12-03 20:51:01	2024-12-03 20:51:42
3672	38	81	3	2024-12-03 20:51:04	2024-12-03 20:51:45
3673	38	82	3	2024-12-03 20:51:08	2024-12-03 20:51:49
3674	38	88	3	2024-12-03 20:51:11	2024-12-03 20:51:52
3675	38	83	3	2024-12-03 20:51:15	2024-12-03 20:51:56
3676	38	84	3	2024-12-03 20:51:31	2024-12-03 20:52:12
3677	38	86	3	2024-12-03 20:51:39	2024-12-03 20:52:21
3678	38	87	3	2024-12-03 20:51:42	2024-12-03 20:52:24
3679	38	81	3	2024-12-03 20:51:45	2024-12-03 20:52:26
3680	38	82	3	2024-12-03 20:51:49	2024-12-03 20:52:30
3681	38	88	3	2024-12-03 20:51:52	2024-12-03 20:52:33
3682	38	83	3	2024-12-03 20:51:56	2024-12-03 20:52:37
3683	38	84	3	2024-12-03 20:52:12	2024-12-03 20:52:52
3684	38	86	3	2024-12-03 20:52:21	2024-12-03 20:53:02
3685	38	87	3	2024-12-03 20:52:24	2024-12-03 20:53:05
3686	38	81	3	2024-12-03 20:52:26	2024-12-03 20:53:07
3687	38	82	3	2024-12-03 20:52:30	2024-12-03 20:53:11
3688	38	88	3	2024-12-03 20:52:33	2024-12-03 20:53:14
3689	38	83	3	2024-12-03 20:52:37	2024-12-03 20:53:18
3690	38	84	3	2024-12-03 20:52:52	2024-12-03 20:53:33
3691	38	86	3	2024-12-03 20:53:02	2024-12-03 20:53:42
3692	38	87	3	2024-12-03 20:53:05	2024-12-03 20:53:45
3693	38	81	3	2024-12-03 20:53:07	2024-12-03 20:53:47
3694	38	82	3	2024-12-03 20:53:11	2024-12-03 20:53:51
3695	38	88	3	2024-12-03 20:53:14	2024-12-03 20:53:54
3696	38	83	3	2024-12-03 20:53:18	2024-12-03 20:53:59
3697	38	84	3	2024-12-03 20:53:33	2024-12-03 20:54:13
3698	38	86	3	2024-12-03 20:53:42	2024-12-03 20:54:22
3699	38	87	3	2024-12-03 20:53:45	2024-12-03 20:54:25
3700	38	81	3	2024-12-03 20:53:47	2024-12-03 20:54:27
3701	38	82	3	2024-12-03 20:53:51	2024-12-03 20:54:32
3702	38	88	3	2024-12-03 20:53:54	2024-12-03 20:54:34
3703	38	83	3	2024-12-03 20:53:59	2024-12-03 20:54:39
3704	38	84	3	2024-12-03 20:54:13	2024-12-03 20:54:53
3705	38	86	3	2024-12-03 20:54:22	2024-12-03 20:55:03
3706	38	87	3	2024-12-03 20:54:25	2024-12-03 20:55:06
3707	38	81	3	2024-12-03 20:54:27	2024-12-03 20:55:08
3708	38	82	3	2024-12-03 20:54:32	2024-12-03 20:55:12
3709	38	88	3	2024-12-03 20:54:34	2024-12-03 20:55:15
3710	38	83	3	2024-12-03 20:54:39	2024-12-03 20:55:19
3711	38	84	3	2024-12-03 20:54:53	2024-12-03 20:55:34
3712	38	86	3	2024-12-03 20:55:03	2024-12-03 20:55:43
3713	38	87	3	2024-12-03 20:55:06	2024-12-03 20:55:46
3714	38	81	3	2024-12-03 20:55:08	2024-12-03 20:55:48
3715	38	82	3	2024-12-03 20:55:12	2024-12-03 20:55:52
3716	38	88	3	2024-12-03 20:55:15	2024-12-03 20:55:55
3717	38	83	3	2024-12-03 20:55:19	2024-12-03 20:56:00
3718	38	84	3	2024-12-03 20:55:34	2024-12-03 20:56:14
3719	38	86	3	2024-12-03 20:55:43	2024-12-03 20:56:23
3720	38	87	3	2024-12-03 20:55:46	2024-12-03 20:56:26
3721	38	81	3	2024-12-03 20:55:48	2024-12-03 20:56:28
3722	38	82	3	2024-12-03 20:55:52	2024-12-03 20:56:33
3723	38	88	3	2024-12-03 20:55:55	2024-12-03 20:56:36
3724	38	83	3	2024-12-03 20:56:00	2024-12-03 20:56:40
3725	38	84	3	2024-12-03 20:56:14	2024-12-03 20:56:54
3726	38	86	3	2024-12-03 20:56:23	2024-12-03 20:57:04
3727	38	87	3	2024-12-03 20:56:26	2024-12-03 20:57:07
3728	38	81	3	2024-12-03 20:56:28	2024-12-03 20:57:09
3729	38	82	3	2024-12-03 20:56:33	2024-12-03 20:57:13
3730	38	88	3	2024-12-03 20:56:36	2024-12-03 20:57:16
3731	38	83	3	2024-12-03 20:56:40	2024-12-03 20:57:20
3732	38	84	3	2024-12-03 20:56:54	2024-12-03 20:57:35
3733	38	86	3	2024-12-03 20:57:04	2024-12-03 20:57:44
3734	38	87	3	2024-12-03 20:57:07	2024-12-03 20:57:47
3735	38	81	3	2024-12-03 20:57:09	2024-12-03 20:57:49
3736	38	82	3	2024-12-03 20:57:13	2024-12-03 20:57:54
3737	38	88	3	2024-12-03 20:57:16	2024-12-03 20:57:57
3738	38	83	3	2024-12-03 20:57:20	2024-12-03 20:58:01
3739	38	84	3	2024-12-03 20:57:35	2024-12-03 20:58:16
3740	38	86	3	2024-12-03 20:57:44	2024-12-03 20:58:25
3741	38	87	3	2024-12-03 20:57:47	2024-12-03 20:58:28
3742	38	81	3	2024-12-03 20:57:49	2024-12-03 20:58:30
3743	38	82	3	2024-12-03 20:57:54	2024-12-03 20:58:35
3744	38	88	3	2024-12-03 20:57:57	2024-12-03 20:58:38
3745	38	83	3	2024-12-03 20:58:01	2024-12-03 20:58:42
3746	38	84	3	2024-12-03 20:58:16	2024-12-03 20:58:56
3747	38	86	3	2024-12-03 20:58:25	2024-12-03 20:59:05
3748	38	87	3	2024-12-03 20:58:28	2024-12-03 20:59:08
3749	38	81	3	2024-12-03 20:58:30	2024-12-03 20:59:10
3750	38	82	3	2024-12-03 20:58:35	2024-12-03 20:59:15
3751	38	88	3	2024-12-03 20:58:38	2024-12-03 20:59:18
3752	38	83	3	2024-12-03 20:58:42	2024-12-03 20:59:23
3753	38	84	3	2024-12-03 20:58:56	2024-12-03 20:59:36
3754	38	86	3	2024-12-03 20:59:05	2024-12-03 20:59:46
3755	38	87	3	2024-12-03 20:59:08	2024-12-03 20:59:49
3756	38	81	3	2024-12-03 20:59:10	2024-12-03 20:59:51
3757	38	82	3	2024-12-03 20:59:15	2024-12-03 20:59:55
3758	38	88	3	2024-12-03 20:59:18	2024-12-03 20:59:59
3759	38	83	3	2024-12-03 20:59:23	2024-12-03 21:00:03
3760	38	84	3	2024-12-03 20:59:36	2024-12-03 21:00:17
3761	38	86	3	2024-12-03 20:59:46	2024-12-03 21:00:27
3762	38	87	3	2024-12-03 20:59:49	2024-12-03 21:00:30
3763	38	81	3	2024-12-03 20:59:51	2024-12-03 21:00:32
3764	38	82	3	2024-12-03 20:59:55	2024-12-03 21:00:36
3765	38	88	3	2024-12-03 20:59:59	2024-12-03 21:00:40
3772	38	88	3	2024-12-03 21:00:40	2024-12-03 21:01:21
3779	38	88	3	2024-12-03 21:01:21	2024-12-03 21:02:02
3786	38	88	3	2024-12-03 21:02:02	2024-12-03 21:02:43
3793	38	88	3	2024-12-03 21:02:43	2024-12-03 21:03:24
3800	38	88	3	2024-12-03 21:03:24	2024-12-03 21:04:05
3807	38	88	3	2024-12-03 21:04:05	2024-12-03 21:04:46
3814	38	88	3	2024-12-03 21:04:46	2024-12-03 21:05:26
3821	38	88	3	2024-12-03 21:05:26	2024-12-03 21:06:07
3828	38	88	3	2024-12-03 21:06:07	2024-12-03 21:06:47
3835	38	88	3	2024-12-03 21:06:47	2024-12-03 21:07:27
3842	38	88	3	2024-12-03 21:07:27	2024-12-03 21:08:08
3849	38	88	3	2024-12-03 21:08:08	2024-12-03 21:08:48
7886	38	86	3	2024-12-04 03:36:37	2024-12-04 03:37:18
7893	38	86	3	2024-12-04 03:37:18	2024-12-04 03:37:58
7900	38	86	3	2024-12-04 03:37:58	2024-12-04 03:38:38
7907	38	86	3	2024-12-04 03:38:38	2024-12-04 03:39:19
7914	38	86	3	2024-12-04 03:39:19	2024-12-04 03:39:59
7921	38	86	3	2024-12-04 03:39:59	2024-12-04 03:40:40
7928	38	86	3	2024-12-04 03:40:40	2024-12-04 03:41:20
7935	38	86	3	2024-12-04 03:41:20	2024-12-04 03:42:00
7942	38	86	3	2024-12-04 03:42:00	2024-12-04 03:42:41
7949	38	86	3	2024-12-04 03:42:41	2024-12-04 03:43:21
7956	38	86	3	2024-12-04 03:43:21	2024-12-04 03:44:01
7963	38	86	3	2024-12-04 03:44:01	2024-12-04 03:44:42
7970	38	86	3	2024-12-04 03:44:42	2024-12-04 03:45:22
7977	38	86	3	2024-12-04 03:45:22	2024-12-04 03:46:02
7984	38	86	3	2024-12-04 03:46:02	2024-12-04 03:46:43
7991	38	86	3	2024-12-04 03:46:43	2024-12-04 03:47:23
7998	38	86	3	2024-12-04 03:47:23	2024-12-04 03:48:04
8005	38	86	3	2024-12-04 03:48:04	2024-12-04 03:48:44
8012	38	86	3	2024-12-04 03:48:44	2024-12-04 03:49:24
8019	38	86	3	2024-12-04 03:49:24	2024-12-04 03:50:05
8026	38	86	3	2024-12-04 03:50:05	2024-12-04 03:50:45
8033	38	86	3	2024-12-04 03:50:45	2024-12-04 03:51:25
8040	38	86	3	2024-12-04 03:51:25	2024-12-04 03:52:06
8047	38	86	3	2024-12-04 03:52:06	2024-12-04 03:52:46
8054	38	86	3	2024-12-04 03:52:46	2024-12-04 03:53:26
8061	38	86	3	2024-12-04 03:53:26	2024-12-04 03:54:07
8068	38	86	3	2024-12-04 03:54:07	2024-12-04 03:54:47
8075	38	86	3	2024-12-04 03:54:47	2024-12-04 03:55:28
8082	38	86	3	2024-12-04 03:55:28	2024-12-04 03:56:09
8089	38	86	3	2024-12-04 03:56:09	2024-12-04 03:56:50
8096	38	86	3	2024-12-04 03:56:50	2024-12-04 03:57:31
8103	38	86	3	2024-12-04 03:57:31	2024-12-04 03:58:12
8110	38	86	3	2024-12-04 03:58:12	2024-12-04 03:58:52
8117	38	86	3	2024-12-04 03:58:52	2024-12-04 03:59:33
8124	38	86	3	2024-12-04 03:59:33	2024-12-04 04:00:13
8131	38	86	3	2024-12-04 04:00:13	2024-12-04 04:00:54
8138	38	86	3	2024-12-04 04:00:54	2024-12-04 04:01:34
8145	38	86	3	2024-12-04 04:01:34	2024-12-04 04:02:14
8152	38	86	3	2024-12-04 04:02:14	2024-12-04 04:02:55
8159	38	86	3	2024-12-04 04:02:55	2024-12-04 04:03:35
8166	38	86	3	2024-12-04 04:03:35	2024-12-04 04:04:16
8173	38	86	3	2024-12-04 04:04:16	2024-12-04 04:04:56
8180	38	86	3	2024-12-04 04:04:56	2024-12-04 04:05:36
8187	38	86	3	2024-12-04 04:05:36	2024-12-04 04:06:17
8194	38	86	3	2024-12-04 04:06:17	2024-12-04 04:06:57
8201	38	86	3	2024-12-04 04:06:57	2024-12-04 04:07:37
8208	38	86	3	2024-12-04 04:07:37	2024-12-04 04:08:18
8215	38	86	3	2024-12-04 04:08:18	2024-12-04 04:08:58
8222	38	86	3	2024-12-04 04:08:58	2024-12-04 04:09:38
8229	38	86	3	2024-12-04 04:09:38	2024-12-04 04:10:19
8236	38	86	3	2024-12-04 04:10:19	2024-12-04 04:10:59
8243	38	86	3	2024-12-04 04:10:59	2024-12-04 04:11:39
8250	38	86	3	2024-12-04 04:11:39	2024-12-04 04:12:20
8257	38	86	3	2024-12-04 04:12:20	2024-12-04 04:13:00
8264	38	86	3	2024-12-04 04:13:00	2024-12-04 04:13:40
8271	38	86	3	2024-12-04 04:13:40	2024-12-04 04:14:21
8278	38	86	3	2024-12-04 04:14:21	2024-12-04 04:15:01
8285	38	86	3	2024-12-04 04:15:01	2024-12-04 04:15:41
8292	38	86	3	2024-12-04 04:15:41	2024-12-04 04:16:22
3766	38	83	3	2024-12-03 21:00:03	2024-12-03 21:00:44
3773	38	83	3	2024-12-03 21:00:44	2024-12-03 21:01:25
3780	38	83	3	2024-12-03 21:01:25	2024-12-03 21:02:06
3787	38	83	3	2024-12-03 21:02:06	2024-12-03 21:02:47
3794	38	83	3	2024-12-03 21:02:47	2024-12-03 21:03:28
3801	38	83	3	2024-12-03 21:03:28	2024-12-03 21:04:09
3808	38	83	3	2024-12-03 21:04:09	2024-12-03 21:04:50
3815	38	83	3	2024-12-03 21:04:50	2024-12-03 21:05:30
3822	38	83	3	2024-12-03 21:05:30	2024-12-03 21:06:11
3829	38	83	3	2024-12-03 21:06:11	2024-12-03 21:06:51
3836	38	83	3	2024-12-03 21:06:51	2024-12-03 21:07:32
3843	38	83	3	2024-12-03 21:07:32	2024-12-03 21:08:12
3850	38	83	3	2024-12-03 21:08:12	2024-12-03 21:08:52
7887	38	82	3	2024-12-04 03:36:46	2024-12-04 03:37:26
7894	38	82	3	2024-12-04 03:37:26	2024-12-04 03:38:06
7901	38	82	3	2024-12-04 03:38:06	2024-12-04 03:38:47
7908	38	82	3	2024-12-04 03:38:47	2024-12-04 03:39:27
7915	38	82	3	2024-12-04 03:39:27	2024-12-04 03:40:07
7922	38	82	3	2024-12-04 03:40:07	2024-12-04 03:40:48
7929	38	82	3	2024-12-04 03:40:48	2024-12-04 03:41:28
7936	38	82	3	2024-12-04 03:41:28	2024-12-04 03:42:09
7943	38	82	3	2024-12-04 03:42:09	2024-12-04 03:42:49
7950	38	82	3	2024-12-04 03:42:49	2024-12-04 03:43:29
7957	38	82	3	2024-12-04 03:43:29	2024-12-04 03:44:10
7964	38	82	3	2024-12-04 03:44:10	2024-12-04 03:44:50
7971	38	82	3	2024-12-04 03:44:50	2024-12-04 03:45:30
7978	38	82	3	2024-12-04 03:45:30	2024-12-04 03:46:11
7985	38	82	3	2024-12-04 03:46:11	2024-12-04 03:46:51
7992	38	82	3	2024-12-04 03:46:51	2024-12-04 03:47:31
7999	38	82	3	2024-12-04 03:47:31	2024-12-04 03:48:12
8006	38	82	3	2024-12-04 03:48:12	2024-12-04 03:48:52
8013	38	82	3	2024-12-04 03:48:52	2024-12-04 03:49:32
8020	38	82	3	2024-12-04 03:49:32	2024-12-04 03:50:13
8027	38	82	3	2024-12-04 03:50:13	2024-12-04 03:50:53
8034	38	82	3	2024-12-04 03:50:53	2024-12-04 03:51:34
8041	38	82	3	2024-12-04 03:51:34	2024-12-04 03:52:14
8048	38	82	3	2024-12-04 03:52:14	2024-12-04 03:52:54
8055	38	82	3	2024-12-04 03:52:54	2024-12-04 03:53:35
8062	38	82	3	2024-12-04 03:53:35	2024-12-04 03:54:15
8069	38	82	3	2024-12-04 03:54:15	2024-12-04 03:54:55
8076	38	82	3	2024-12-04 03:54:55	2024-12-04 03:55:36
8083	38	82	3	2024-12-04 03:55:36	2024-12-04 03:56:17
8090	38	82	3	2024-12-04 03:56:17	2024-12-04 03:56:58
8097	38	82	3	2024-12-04 03:56:58	2024-12-04 03:57:39
8104	38	82	3	2024-12-04 03:57:39	2024-12-04 03:58:20
8111	38	82	3	2024-12-04 03:58:20	2024-12-04 03:59:00
8118	38	82	3	2024-12-04 03:59:00	2024-12-04 03:59:41
8125	38	82	3	2024-12-04 03:59:41	2024-12-04 04:00:21
8132	38	82	3	2024-12-04 04:00:21	2024-12-04 04:01:02
8139	38	82	3	2024-12-04 04:01:02	2024-12-04 04:01:42
8146	38	82	3	2024-12-04 04:01:42	2024-12-04 04:02:22
8153	38	82	3	2024-12-04 04:02:22	2024-12-04 04:03:03
8160	38	82	3	2024-12-04 04:03:03	2024-12-04 04:03:43
8167	38	82	3	2024-12-04 04:03:43	2024-12-04 04:04:23
8174	38	82	3	2024-12-04 04:04:23	2024-12-04 04:05:04
8181	38	82	3	2024-12-04 04:05:04	2024-12-04 04:05:44
8188	38	82	3	2024-12-04 04:05:44	2024-12-04 04:06:24
8195	38	82	3	2024-12-04 04:06:24	2024-12-04 04:07:05
8202	38	82	3	2024-12-04 04:07:05	2024-12-04 04:07:45
8209	38	82	3	2024-12-04 04:07:45	2024-12-04 04:08:25
8216	38	82	3	2024-12-04 04:08:25	2024-12-04 04:09:06
8223	38	82	3	2024-12-04 04:09:06	2024-12-04 04:09:46
8230	38	82	3	2024-12-04 04:09:46	2024-12-04 04:10:26
8237	38	82	3	2024-12-04 04:10:26	2024-12-04 04:11:07
8244	38	82	3	2024-12-04 04:11:07	2024-12-04 04:11:47
8251	38	82	3	2024-12-04 04:11:47	2024-12-04 04:12:27
8258	38	82	3	2024-12-04 04:12:27	2024-12-04 04:13:08
8265	38	82	3	2024-12-04 04:13:08	2024-12-04 04:13:48
8272	38	82	3	2024-12-04 04:13:48	2024-12-04 04:14:28
8279	38	82	3	2024-12-04 04:14:28	2024-12-04 04:15:08
8286	38	82	3	2024-12-04 04:15:08	2024-12-04 04:15:49
8293	38	82	3	2024-12-04 04:15:49	2024-12-04 04:16:29
3767	38	84	3	2024-12-03 21:00:17	2024-12-03 21:00:58
3774	38	84	3	2024-12-03 21:00:58	2024-12-03 21:01:39
3781	38	84	3	2024-12-03 21:01:39	2024-12-03 21:02:20
3788	38	84	3	2024-12-03 21:02:20	2024-12-03 21:03:01
3795	38	84	3	2024-12-03 21:03:01	2024-12-03 21:03:42
3802	38	84	3	2024-12-03 21:03:42	2024-12-03 21:04:23
3809	38	84	3	2024-12-03 21:04:23	2024-12-03 21:05:04
3816	38	84	3	2024-12-03 21:05:04	2024-12-03 21:05:44
3823	38	84	3	2024-12-03 21:05:44	2024-12-03 21:06:25
3830	38	84	3	2024-12-03 21:06:25	2024-12-03 21:07:05
3837	38	84	3	2024-12-03 21:07:05	2024-12-03 21:07:45
3844	38	84	3	2024-12-03 21:07:45	2024-12-03 21:08:26
3851	38	84	3	2024-12-03 21:08:26	2024-12-03 21:09:06
7885	38	81	3	2024-12-04 03:36:34	2024-12-04 03:37:15
7892	38	81	3	2024-12-04 03:37:15	2024-12-04 03:37:55
7899	38	81	3	2024-12-04 03:37:55	2024-12-04 03:38:35
7906	38	81	3	2024-12-04 03:38:35	2024-12-04 03:39:16
7913	38	81	3	2024-12-04 03:39:16	2024-12-04 03:39:56
7920	38	81	3	2024-12-04 03:39:56	2024-12-04 03:40:36
7927	38	81	3	2024-12-04 03:40:36	2024-12-04 03:41:17
7934	38	81	3	2024-12-04 03:41:17	2024-12-04 03:41:57
7941	38	81	3	2024-12-04 03:41:57	2024-12-04 03:42:37
7948	38	81	3	2024-12-04 03:42:37	2024-12-04 03:43:18
7955	38	81	3	2024-12-04 03:43:18	2024-12-04 03:43:58
7962	38	81	3	2024-12-04 03:43:58	2024-12-04 03:44:38
7969	38	81	3	2024-12-04 03:44:38	2024-12-04 03:45:19
7976	38	81	3	2024-12-04 03:45:19	2024-12-04 03:45:59
7983	38	81	3	2024-12-04 03:45:59	2024-12-04 03:46:39
7990	38	81	3	2024-12-04 03:46:39	2024-12-04 03:47:20
7997	38	81	3	2024-12-04 03:47:20	2024-12-04 03:48:00
8004	38	81	3	2024-12-04 03:48:00	2024-12-04 03:48:40
8011	38	81	3	2024-12-04 03:48:40	2024-12-04 03:49:21
8018	38	81	3	2024-12-04 03:49:21	2024-12-04 03:50:01
8025	38	81	3	2024-12-04 03:50:01	2024-12-04 03:50:41
8032	38	81	3	2024-12-04 03:50:41	2024-12-04 03:51:22
8039	38	81	3	2024-12-04 03:51:22	2024-12-04 03:52:02
8046	38	81	3	2024-12-04 03:52:02	2024-12-04 03:52:42
8053	38	81	3	2024-12-04 03:52:42	2024-12-04 03:53:23
8060	38	81	3	2024-12-04 03:53:23	2024-12-04 03:54:03
8067	38	81	3	2024-12-04 03:54:03	2024-12-04 03:54:43
8074	38	81	3	2024-12-04 03:54:43	2024-12-04 03:55:24
8081	38	81	3	2024-12-04 03:55:24	2024-12-04 03:56:05
8088	38	81	3	2024-12-04 03:56:05	2024-12-04 03:56:46
8095	38	81	3	2024-12-04 03:56:46	2024-12-04 03:57:28
8102	38	81	3	2024-12-04 03:57:28	2024-12-04 03:58:09
8109	38	81	3	2024-12-04 03:58:09	2024-12-04 03:58:49
8116	38	81	3	2024-12-04 03:58:49	2024-12-04 03:59:30
8123	38	81	3	2024-12-04 03:59:30	2024-12-04 04:00:10
8130	38	81	3	2024-12-04 04:00:10	2024-12-04 04:00:50
8137	38	81	3	2024-12-04 04:00:50	2024-12-04 04:01:31
8144	38	81	3	2024-12-04 04:01:31	2024-12-04 04:02:11
8151	38	81	3	2024-12-04 04:02:11	2024-12-04 04:02:51
8158	38	81	3	2024-12-04 04:02:51	2024-12-04 04:03:32
8165	38	81	3	2024-12-04 04:03:32	2024-12-04 04:04:12
8172	38	81	3	2024-12-04 04:04:12	2024-12-04 04:04:52
8179	38	81	3	2024-12-04 04:04:52	2024-12-04 04:05:33
8186	38	81	3	2024-12-04 04:05:33	2024-12-04 04:06:13
8193	38	81	3	2024-12-04 04:06:13	2024-12-04 04:06:54
8200	38	81	3	2024-12-04 04:06:54	2024-12-04 04:07:34
8207	38	81	3	2024-12-04 04:07:34	2024-12-04 04:08:14
8214	38	81	3	2024-12-04 04:08:14	2024-12-04 04:08:55
8221	38	81	3	2024-12-04 04:08:55	2024-12-04 04:09:35
8228	38	81	3	2024-12-04 04:09:35	2024-12-04 04:10:15
8235	38	81	3	2024-12-04 04:10:15	2024-12-04 04:10:56
8242	38	81	3	2024-12-04 04:10:56	2024-12-04 04:11:36
8249	38	81	3	2024-12-04 04:11:36	2024-12-04 04:12:16
8256	38	81	3	2024-12-04 04:12:16	2024-12-04 04:12:57
8263	38	81	3	2024-12-04 04:12:57	2024-12-04 04:13:37
8270	38	81	3	2024-12-04 04:13:37	2024-12-04 04:14:18
8277	38	81	3	2024-12-04 04:14:18	2024-12-04 04:14:58
8284	38	81	3	2024-12-04 04:14:58	2024-12-04 04:15:38
8291	38	81	3	2024-12-04 04:15:38	2024-12-04 04:16:19
8298	38	81	3	2024-12-04 04:16:19	2024-12-04 04:16:59
3768	38	86	3	2024-12-03 21:00:27	2024-12-03 21:01:08
3775	38	86	3	2024-12-03 21:01:08	2024-12-03 21:01:49
3782	38	86	3	2024-12-03 21:01:49	2024-12-03 21:02:30
3789	38	86	3	2024-12-03 21:02:30	2024-12-03 21:03:11
3796	38	86	3	2024-12-03 21:03:11	2024-12-03 21:03:52
3803	38	86	3	2024-12-03 21:03:52	2024-12-03 21:04:33
3810	38	86	3	2024-12-03 21:04:33	2024-12-03 21:05:14
3817	38	86	3	2024-12-03 21:05:14	2024-12-03 21:05:54
3824	38	86	3	2024-12-03 21:05:54	2024-12-03 21:06:35
3831	38	86	3	2024-12-03 21:06:35	2024-12-03 21:07:15
3838	38	86	3	2024-12-03 21:07:15	2024-12-03 21:07:55
3845	38	86	3	2024-12-03 21:07:55	2024-12-03 21:08:36
8299	38	86	3	2024-12-04 04:16:22	2024-12-04 04:17:02
8306	38	86	3	2024-12-04 04:17:02	2024-12-04 04:17:42
8313	38	86	3	2024-12-04 04:17:42	2024-12-04 04:18:23
8320	38	86	0	2024-12-04 04:18:23	2024-12-04 04:18:23
3769	38	87	3	2024-12-03 21:00:30	2024-12-03 21:01:11
3776	38	87	3	2024-12-03 21:01:11	2024-12-03 21:01:51
3783	38	87	3	2024-12-03 21:01:51	2024-12-03 21:02:32
3790	38	87	3	2024-12-03 21:02:32	2024-12-03 21:03:13
3797	38	87	3	2024-12-03 21:03:13	2024-12-03 21:03:54
3804	38	87	3	2024-12-03 21:03:54	2024-12-03 21:04:35
3811	38	87	3	2024-12-03 21:04:35	2024-12-03 21:05:16
3818	38	87	3	2024-12-03 21:05:16	2024-12-03 21:05:57
3825	38	87	3	2024-12-03 21:05:57	2024-12-03 21:06:37
3832	38	87	3	2024-12-03 21:06:37	2024-12-03 21:07:17
3839	38	87	3	2024-12-03 21:07:17	2024-12-03 21:07:57
3846	38	87	3	2024-12-03 21:07:57	2024-12-03 21:08:38
8300	38	82	3	2024-12-04 04:16:29	2024-12-04 04:17:09
8307	38	82	3	2024-12-04 04:17:09	2024-12-04 04:17:50
8314	38	82	3	2024-12-04 04:17:50	2024-12-04 04:18:30
8321	38	82	0	2024-12-04 04:18:30	2024-12-04 04:18:30
3770	38	81	3	2024-12-03 21:00:32	2024-12-03 21:01:13
3777	38	81	3	2024-12-03 21:01:13	2024-12-03 21:01:54
3784	38	81	3	2024-12-03 21:01:54	2024-12-03 21:02:35
3791	38	81	3	2024-12-03 21:02:35	2024-12-03 21:03:16
3798	38	81	3	2024-12-03 21:03:16	2024-12-03 21:03:57
3805	38	81	3	2024-12-03 21:03:57	2024-12-03 21:04:38
3812	38	81	3	2024-12-03 21:04:38	2024-12-03 21:05:18
3819	38	81	3	2024-12-03 21:05:18	2024-12-03 21:05:58
3826	38	81	3	2024-12-03 21:05:58	2024-12-03 21:06:39
3833	38	81	3	2024-12-03 21:06:39	2024-12-03 21:07:19
3840	38	81	3	2024-12-03 21:07:19	2024-12-03 21:07:59
3847	38	81	3	2024-12-03 21:07:59	2024-12-03 21:08:40
8301	38	88	3	2024-12-04 04:16:31	2024-12-04 04:17:11
8308	38	88	3	2024-12-04 04:17:11	2024-12-04 04:17:52
8315	38	88	3	2024-12-04 04:17:52	2024-12-04 04:18:32
8322	38	88	0	2024-12-04 04:18:32	2024-12-04 04:18:32
3771	38	82	3	2024-12-03 21:00:36	2024-12-03 21:01:17
3778	38	82	3	2024-12-03 21:01:17	2024-12-03 21:01:58
3785	38	82	3	2024-12-03 21:01:58	2024-12-03 21:02:39
3792	38	82	3	2024-12-03 21:02:39	2024-12-03 21:03:20
3799	38	82	3	2024-12-03 21:03:20	2024-12-03 21:04:01
3806	38	82	3	2024-12-03 21:04:01	2024-12-03 21:04:42
3813	38	82	3	2024-12-03 21:04:42	2024-12-03 21:05:22
3820	38	82	3	2024-12-03 21:05:22	2024-12-03 21:06:03
3827	38	82	3	2024-12-03 21:06:03	2024-12-03 21:06:43
3834	38	82	3	2024-12-03 21:06:43	2024-12-03 21:07:23
3841	38	82	3	2024-12-03 21:07:23	2024-12-03 21:08:04
3848	38	82	3	2024-12-03 21:08:04	2024-12-03 21:08:44
8302	38	83	3	2024-12-04 04:16:35	2024-12-04 04:17:16
8309	38	83	3	2024-12-04 04:17:16	2024-12-04 04:17:56
8316	38	83	3	2024-12-04 04:17:56	2024-12-04 04:18:36
8323	38	83	0	2024-12-04 04:18:36	2024-12-04 04:18:36
\.


--
-- Data for Name: driver_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.driver_details (id, user_id, vehicle_type_id, vechicle_make_id, vehicle_model_id, vehicle_front_view, vehicle_back_view, driving_licence_front_view, driving_licence_back_view, driving_licence_number, driving_licence_expiry_date, rta_permit_front_view, rta_permit_back_view, rta_permit_number, rta_permit_expiry_date, emirates_id_front_view, emirates_id_back_view, emirates_id_number, emirates_id_expiry_date, ownership_certifcate_front_view, ownership_certifcate_back_view, ownership_certifcate_number, ownership_certifcate_expiry_date, created_at, updated_at, deleted_at) FROM stdin;
1	11	1	2	2	1731913967673ae8efbb418.png	1731913967673ae8efbca79.png	1731918772673afbb4ddb2b.jpg	1731918772673afbb4e386b.png	d no	2025-12-12	1731918772673afbb4e3ac5.jpg	1731918772673afbb4e816b.jpg	rt no	2025-05-12	1731918772673afbb4ec8de.jpg	1731918772673afbb4f0393.jpg	em no	2025-08-20	1731918772673afbb4f3d24.jpg	1731918773673afbb50355b.jpg	ow no	2025-09-15	2024-11-18 08:32:53	2024-11-18 08:32:53	\N
2	12	2	1	1	1731922020673b0864cc1db.jpg	1731922020673b0864cd8cf.jpg	1731922090673b08aa9ddd7.jpg	1731922090673b08aa9f3c7.jpg	8288	2024-11-29	1731922090673b08aa9f57f.jpg	1731922090673b08aa9f6ec.jpg	92929	2024-11-28	1731922090673b08aa9f87a.jpg	1731922090673b08aa9fa06.jpg	92882	2024-11-29	1731922090673b08aa9fb89.jpg	1731922090673b08aa9fce8.jpg	83828	2024-11-29	2024-11-18 09:28:10	2024-11-18 09:28:10	\N
3	13	2	2	2	1731922231673b09371de7a.jpg	1731922231673b09371f42d.jpg	1731922491673b0a3b99ccc.jpg	1731922491673b0a3b9b24f.jpg	245677	2024-11-27	1731922491673b0a3b9b409.jpg	1731922491673b0a3b9b56f.jpg	98766	2024-11-29	1731922491673b0a3b9b704.jpg	1731922491673b0a3b9b866.jpg	9877	2024-11-28	1731922491673b0a3b9b9f7.jpg	1731922491673b0a3b9bb7b.jpg	82882	2024-11-28	2024-11-18 09:34:51	2024-11-18 09:34:51	\N
4	14	2	1	1	1731927391673b1d5f09175.jpg	1731927391673b1d5f0a7e9.jpg	1731927438673b1d8e2eafe.jpg	1731927438673b1d8e3041c.jpg	Gdgfdf	2024-11-30	1731927438673b1d8e3091d.jpg	1731927438673b1d8e30a89.jpg	Fgf	2024-11-28	1731927438673b1d8e30f51.jpg	1731927438673b1d8e313fb.jpg	Hhgs	2024-11-30	1731927438673b1d8e31590.jpg	1731927438673b1d8e316e4.jpg	Gddx	2024-11-30	2024-11-18 10:57:18	2024-11-18 10:57:18	\N
5	24	4	2	2	17326166226745a1aef2563.jpg	17326166226745a1aef267a.jpg	17326166226745a1aef2767.jpg	17326166226745a1aef2833.jpg	449	2024-11-30	17326166226745a1aef2954.jpg	17326166226745a1aef2a47.jpg	589	2024-11-30	17326166226745a1aef2b5e.jpg	17326166226745a1aef2d36.jpg	760	2024-11-30	17326166226745a1aef2f4c.jpeg	17326166226745a1aef3042.jpeg	34	2024-11-30	2024-11-26 14:23:42	2024-11-26 14:23:42	\N
6	25	4	3	5	17326205476745b103947a6.jpg	17326205476745b10395dcb.jpg	17326213376745b419069e9.jpg	17326213376745b41907fee.jpg	AJ76233	2026-05-20	17326213376745b41908206.jpg	17326213376745b4190849e.jpg	AJ76444	2027-11-25	17326213376745b4190868c.jpg	17326213376745b419087c8.jpg	AJ12301998	2026-06-15	17326213376745b41908934.jpg	17326213376745b41908a64.jpg	AJ2001998	2027-11-30	2024-11-26 11:42:17	2024-11-26 11:42:17	\N
7	29	2	2	2	1732859064674954b8084e9.jpg	1732859064674954b809af5.jpg	1732859125674954f5ef798.jpg	1732859125674954f5f0cdb.jpg	7899	2024-12-18	1732859125674954f5f0e06.jpg	1732859125674954f5f0ee5.jpg	89065	2024-12-02	1732859125674954f5f0ffc.jpg	1732859125674954f5f10d9.jpg	79995	2024-12-04	1732859125674954f5f11ed.jpg	1732859125674954f5f12ce.jpg	8955333	2024-12-04	2024-11-29 05:45:25	2024-11-29 05:45:25	\N
8	30	4	3	4	17328627786749633abbef3.png	17328627786749633abc003.jpg	17328627786749633abc0d8.pdf	17328627786749633abcdd5.pdf	KIA123456789	2025-02-28	17328627786749633abda7d.pdf	17328627786749633abe7ec.pdf	KIA12345689	2025-02-28	17328627786749633abf45f.pdf	17328627786749633ac001b.pdf	123456789	2025-02-28	17328627786749633ac0ce0.pdf	17328627786749633ac19af.pdf	123456789	2025-02-28	2024-11-29 10:46:18	2024-11-29 10:46:18	\N
9	33	4	3	4	1732953368674ac5184278d.jpg	1732953368674ac51843e9d.jpg	1732953679674ac64f0bbd5.jpg	1732953679674ac64f0d1af.jpg	DXB123456789	2025-02-28	1732953679674ac64f0d3cf.jpg	1732953679674ac64f0d594.jpg	DXB123456789	2025-02-28	1732953679674ac64f0d78e.jpg	1732953679674ac64f0d962.jpg	DXB123456789	2025-02-28	1732953679674ac64f0de0c.jpg	1732953679674ac64f0e28d.jpg	DXB123456789	2025-02-28	2024-11-30 08:01:19	2024-11-30 08:01:19	\N
10	34	4	3	4	1732953922674ac74220452.jpg	1732953922674ac74221abf.jpg	1732954135674ac8175c4b4.jpg	1732954135674ac8175db36.jpg	DXB123456789	2025-02-28	1732954135674ac8175dd56.jpg	1732954135674ac8175df3d.jpg	DXB123456789	2025-02-28	1732954135674ac8175e151.jpg	1732954135674ac8175e35e.jpg	DXB123456789	2025-02-28	1732954135674ac8175e567.jpg	1732954135674ac8175e71f.jpg	DXB123456789	2025-02-28	2024-11-30 08:08:55	2024-11-30 08:08:55	\N
11	38	2	5	6	1733054014674c4e3e0efea.jpg	1733054014674c4e3e1059f.jpg	1733054309674c4f6577abe.jpg	1733054309674c4f6579126.jpg	573638TYDIDN	2024-12-31	1733054309674c4f65792b2.jpg	1733054309674c4f657942c.jpg	GDJD638383839	2024-12-31	1733054309674c4f6579566.jpg	1733054309674c4f65796af.jpg	GDJD6383883	2024-12-26	1733054309674c4f65797de.jpg	1733054309674c4f657990f.jpg	G6484838	2024-12-26	2024-12-01 11:58:29	2024-12-01 11:58:29	\N
12	39	2	5	6	1733121343674d553f59831.jpg	1733121343674d553f5ae80.jpg	1733121403674d557bbf2be.jpg	1733121403674d557bc08bf.jpg	0987655	2024-12-31	1733121403674d557bc09dd.jpg	1733121403674d557bc0aad.jpg	98765	2024-12-31	1733121403674d557bc0ba3.jpg	1733121403674d557bc0c8c.jpg	89655	2024-12-28	1733121403674d557bc0d84.jpg	1733121403674d557bc0e50.jpg	987766	2024-12-27	2024-12-02 06:36:43	2024-12-02 06:36:43	\N
13	40	6	5	6	1733131564674d7d2c87707.jpg	1733131564674d7d2c88d0c.jpg	1733131743674d7ddf23b0c.jpg	1733131743674d7ddf2512c.jpg	Dxb123456789	2025-02-28	1733131743674d7ddf25359.jpg	1733131743674d7ddf2551a.jpg	Dxb123456789	2025-02-28	1733131743674d7ddf2575f.jpg	1733131743674d7ddf25999.jpg	Dxb123456789	2025-02-28	1733131743674d7ddf25bbd.jpg	1733131743674d7ddf25dc7.jpg	Dxb123456789	2025-02-28	2024-12-02 09:29:03	2024-12-02 09:29:03	\N
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
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
-- Data for Name: location_suggestions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location_suggestions (id, type, title, latitude, longitude, status, created_at, updated_at, deleted_at) FROM stdin;
2	1	Mall of the Emirates	25.118107	55.200608	1	2024-11-21 12:58:25	2024-11-21 12:58:25	\N
1	1	Dubai Mall	25.19062790693043	55.28373812701417	1	2024-11-20 04:45:12	2024-11-28 16:28:44	\N
3	1	Test	25.271360096230215	55.30521869659424	1	2024-12-02 13:35:38	2024-12-02 13:35:38	\N
4	3	Office	25.1815668	55.27151019999999	1	2024-12-02 13:52:02	2024-12-02 13:52:02	\N
5	2	Marina	25.277025957740072	55.28672218322754	1	2024-12-02 14:11:41	2024-12-02 14:11:41	\N
6	2	Cruise Terminal	25.272424638564743	55.2798875276285	1	2024-12-02 14:12:22	2024-12-02 14:12:22	\N
7	3	Office2	25.1945448	55.3641298	1	2024-12-02 14:13:14	2024-12-02 14:13:14	\N
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
16	0001_01_01_000000_create_users_table	1
17	0001_01_01_000001_create_cache_table	1
18	0001_01_01_000002_create_jobs_table	1
19	2024_11_08_111159_create_temp_users_table	1
20	2024_11_11_052746_create_companies_table	1
21	2024_11_11_060502_create_vehicle_types_table	1
22	2024_11_11_061352_create_vehicle_makes_table	1
23	2024_11_11_061645_create_vehicle_models_table	1
24	2024_11_11_064039_create_driver_details_table	1
25	2024_11_11_070211_create_settings_table	1
26	2024_11_11_070506_create_rates_table	1
27	2024_11_12_061456_create_personal_access_tokens_table	2
30	2024_11_12_080653_alter_update_name_nullable_to_users	3
31	2024_11_13_050738_alter_add_fileds_to_companies	4
34	2024_11_13_061554_alter_add_fields_to_temp_users	5
35	2024_11_14_080531_alter_add_driver_locations_to_users	6
36	2024_11_15_070801_alter_add_hide_profile_to_users	7
37	2024_11_15_103741_create_location_suggestions_table	7
38	2024_11_15_114733_alter_add_status_to_rates	7
39	2024_11_16_041919_alter_add_wallet_amount_to_users	7
40	2024_11_16_053112_create_temp_bookings_table	7
41	2024_11_16_054019_create_bookings_table	7
42	2024_11_16_072912_create_driver_alloted_orders_table	7
43	2024_11_18_061711_create_wallet_histories_table	8
44	2024_11_18_064608_alter_add_cancellation_fileds_to_bookings	8
45	2024_11_18_074639_alter_add_rating_fileds_to_bookings	8
46	2024_11_19_115308_create_pages_table	9
47	2024_11_20_041526_create_discounts_table	10
48	2024_11_20_053331_create_discount_types_table	10
49	2024_11_20_054827_create_complaints_status_table	10
50	2024_11_20_132258_create_complaints_table	10
51	2024_11_25_092443_create_coupon_usages_table	11
52	2024_11_25_092705_alter_add_fields_to_bookings	11
53	2024_11_25_100150_alter_add_fields_to_temp_bookings	11
54	2024_11_25_124012_create_temp_tip_amounts_table	12
55	2024_11_25_124048_create_tip_amounts_table	12
56	2024_11_26_053010_alter_add_rating_fileds_to_users	13
57	2024_11_26_145856_make_value_nullable_in_discounts_table	14
58	2024_11_27_033135_alter_add_is_scheduled_fields_to_bookings	14
59	2024_11_28_102413_create_permission_tables	15
\.


--
-- Data for Name: model_has_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
\.


--
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
1	App\\Models\\User	1
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages (id, identifier, content, status, created_at, updated_at) FROM stdin;
1	about-us	<h2>What is Lorem Ipsum?</h2><p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	1	2024-11-20 03:50:15	2024-11-21 13:26:34
2	terms-and-conditions	<p>Content for Terms and Conditions</p><p> </p><h3><strong>The standard Lorem Ipsum passage, used since the 1500s</strong></h3><p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p><h3><strong>Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</strong></h3><p>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"</p>	1	2024-11-20 03:50:27	2024-11-21 13:27:33
3	privacy-policy	<p>Content for Privacy Policy</p><p> </p><p><strong>Content</strong></p><p> </p><p><img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wAARCAD7AV4DASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD9UqKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWigBKKWigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC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iiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA//2VN5c3RlbS5JTy5EaXJlY3RvcnlOb3RGb3VuZEV4Y2VwdGlvbjogQ291bGQgbm90IGZpbmQgYSBwYXJ0IG9mIHRoZSBwYXRoICdEOlxBcHBsaWNhdGlvbnNcQUxMX0lNQUdFU1xVdGlsc1xJbWFnZUNhY2hlXDFfMjUxXzM1MF8wXzkxX2h0dHBzJTNhJTJmJTJmY21zLmhheW1hcmtldGluZGlhLm5ldCUyZm1vZGVsJTJmdXBsb2FkcyUyZm1vZGVsaW1hZ2VzJTJmQk1XLTItU2VyaWVzLUdyYW4tQ291cGUtMjcxMjIwMjIxMTQ3LmpwZycuDQogICBhdCBTeXN0ZW0uSU8uX19FcnJvci5XaW5JT0Vycm9yKEludDMyIGVycm9yQ29kZSwgU3RyaW5nIG1heWJlRnVsbFBhdGgpDQogICBhdCBTeXN0ZW0uSU8uRmlsZVN0cmVhbS5Jbml0KFN0cmluZyBwYXRoLCBGaWxlTW9kZSBtb2RlLCBGaWxlQWNjZXNzIGFjY2VzcywgSW50MzIgcmlnaHRzLCBCb29sZWFuIHVzZVJpZ2h0cywgRmlsZVNoYXJlIHNoYXJlLCBJbnQzMiBidWZmZXJTaXplLCBGaWxlT3B0aW9ucyBvcHRpb25zLCBTRUNVUklUWV9BVFRSSUJVVEVTIHNlY0F0dHJzLCBTdHJpbmcgbXNnUGF0aCwgQm9vbGVhbiBiRnJvbVByb3h5LCBCb29sZWFuIHVzZUxvbmdQYXRoLCBCb29sZWFuIGNoZWNrSG9zdCkNCiAgIGF0IFN5c3RlbS5JTy5GaWxlU3RyZWFtLi5jdG9yKFN0cmluZyBwYXRoLCBGaWxlTW9kZSBtb2RlLCBGaWxlQWNjZXNzIGFjY2VzcywgRmlsZVNoYXJlIHNoYXJlLCBJbnQzMiBidWZmZXJTaXplKQ0KICAgYXQgU3lzdGVtLklPLkZpbGUuQ3JlYXRlKFN0cmluZyBwYXRoKQ0KICAgYXQgSW1hZ2VSZXNpemVyLlByb2Nlc3NSZXF1ZXN0KEh0dHBDb250ZXh0IGNvbnRleHQpIGluIGQ6XEFwcGxpY2F0aW9uc1xBTExfSU1BR0VTXFV0aWxzXEltYWdlUmVzaXplci5hc2h4OmxpbmUgMjc4" alt="2VN5c3RlbS5JTy5EaXJlY3RvcnlOb3RGb3VuZEV4Y2VwdGlvbjogQ291bGQgbm90IGZpbmQgYSBwYXJ0IG9mIHRoZSBwYXRoICdEOlxBcHBsaWNhdGlvbnNcQUxMX0lNQUdFU1xVdGlsc1xJbWFnZUNhY2hlXDFfMjUxXzM1MF8wXzkxX2h0dHBzJTNhJTJmJTJmY21zLmhheW1hcmtldGluZGlhLm5ldCUyZm1vZGVsJTJmdXBsb2FkcyUyZm1vZGVsaW1hZ2VzJTJmQk1XLTItU2VyaWVzLUdyYW4tQ291cGUtMjcxMjIwMjIxMTQ3LmpwZycuDQogICBhdCBTeXN0ZW0uSU8uX19FcnJvci5XaW5JT0Vycm9yKEludDMyIGVycm9yQ29kZSwgU3RyaW5nIG1heWJlRnVsbFBhdGgpDQogICBhdCBTeXN0ZW0uSU8uRmlsZVN0cmVhbS5Jbml0KFN0cmluZyBwYXRoLCBGaWxlTW9kZSBtb2RlLCBGaWxlQWNjZXNzIGFjY2VzcywgSW50MzIgcmlnaHRzLCBCb29sZWFuIHVzZVJpZ2h0cywgRmlsZVNoYXJlIHNoYXJlLCBJbnQzMiBidWZmZXJTaXplLCBGaWxlT3B0aW9ucyBvcHRpb25zLCBTRUNVUklUWV9BVFRSSUJVVEVTIHNlY0F0dHJzLCBTdHJpbmcgbXNnUGF0aCwgQm9vbGVhbiBiRnJvbVByb3h5LCBCb29sZWFuIHVzZUxvbmdQYXRoLCBCb29sZWFuIGNoZWNrSG9zdCkNCiAgIGF0IFN5c3RlbS5JTy5GaWxlU3RyZWFtLi5jdG9yKFN0cmluZyBwYXRoLCBGaWxlTW9kZSBtb2RlLCBGaWxlQWNjZXNzIGFjY2VzcywgRmlsZVNoYXJlIHNoYXJlLCBJbnQzMiBidWZmZXJTaXplKQ0KICAgYXQgU3lzdGVtLklPLkZpbGUuQ3JlYXRlKFN0cmluZyBwYXRoKQ0KICAgYXQgSW1hZ2VSZXNpemVyLlByb2Nlc3NSZXF1ZXN0KEh0dHBDb250ZXh0IGNvbnRleHQpIGluIGQ6XEFwcGxpY2F0aW9uc1xBTExfSU1BR0VTXFV0aWxzXEltYWdlUmVzaXplci5hc2h4OmxpbmUgMjc4" /></p><p> </p><h3><strong>1914 translation by H. Rackham</strong></h3><p>"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"</p>	1	2024-11-20 03:50:27	2024-11-21 13:28:01
4	contact-details	<p> </p><p> </p><div><h4>26985 Brighton Lane,</h4><div>Lake Forest, CA 92630</div></div><div><p>Our office is open:<br />Mon to Fri from 9 a.m. to 5 p.m.</p></div>	1	2024-11-20 03:50:27	2024-11-21 13:32:06
5	faqs	<p>Content for FAQs</p><p> </p><h3><strong>Section 1.10.33 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</strong></h3><p>"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."</p><h3><strong>1914 translation by H. Rackham</strong></h3><p>"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains."</p><p> </p><p> </p>	0	2024-11-20 03:50:27	2024-11-21 13:33:00
6	emergency-assistance	<h4><strong>Emergency Assistance</strong></h4>	1	2024-11-26 06:40:36	2024-11-26 06:40:36
7	safety-center	<h4><strong>Safety Center</strong></h4>	1	2024-11-26 07:17:48	2024-11-26 07:17:48
8	share-my-trip	<h4><strong>Share My Trip</strong></h4>	1	2024-11-26 07:18:03	2024-11-26 07:18:03
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (id, name, guard_name, created_at, updated_at) FROM stdin;
1	dashboard	web	2024-12-02 08:13:37	2024-12-02 08:13:37
2	livemap	web	2024-12-02 08:13:37	2024-12-02 08:13:37
3	rides	web	2024-12-02 08:13:37	2024-12-02 08:13:37
4	rides-all	web	2024-12-02 08:13:37	2024-12-02 08:13:37
5	rides-active	web	2024-12-02 08:13:37	2024-12-02 08:13:37
6	rides-completed	web	2024-12-02 08:13:37	2024-12-02 08:13:37
7	rides-canceled	web	2024-12-02 08:13:37	2024-12-02 08:13:37
8	rides-ongoing	web	2024-12-02 08:13:37	2024-12-02 08:13:37
9	customers	web	2024-12-02 08:13:37	2024-12-02 08:13:37
10	customers-create	web	2024-12-02 08:13:37	2024-12-02 08:13:37
11	customers-save	web	2024-12-02 08:13:37	2024-12-02 08:13:37
12	customers-edit	web	2024-12-02 08:13:37	2024-12-02 08:13:37
13	customers-delete	web	2024-12-02 08:13:37	2024-12-02 08:13:37
14	drivers	web	2024-12-02 08:13:37	2024-12-02 08:13:37
15	drivers-create	web	2024-12-02 08:13:37	2024-12-02 08:13:37
16	drivers-save	web	2024-12-02 08:13:37	2024-12-02 08:13:37
17	drivers-edit	web	2024-12-02 08:13:37	2024-12-02 08:13:37
18	drivers-delete	web	2024-12-02 08:13:37	2024-12-02 08:13:37
19	companies	web	2024-12-02 08:13:37	2024-12-02 08:13:37
20	companies-create	web	2024-12-02 08:13:37	2024-12-02 08:13:37
21	companies-save	web	2024-12-02 08:13:37	2024-12-02 08:13:37
22	companies-edit	web	2024-12-02 08:13:37	2024-12-02 08:13:37
23	companies-delete	web	2024-12-02 08:13:37	2024-12-02 08:13:37
24	vehicle-types	web	2024-12-02 08:13:37	2024-12-02 08:13:37
25	vehicle-types-create	web	2024-12-02 08:13:37	2024-12-02 08:13:37
26	vehicle-types-save	web	2024-12-02 08:13:37	2024-12-02 08:13:37
27	vehicle-types-edit	web	2024-12-02 08:13:37	2024-12-02 08:13:37
28	vehicle-types-delete	web	2024-12-02 08:13:37	2024-12-02 08:13:37
29	vehicle-makes	web	2024-12-02 08:13:37	2024-12-02 08:13:37
30	vehicle-makes-create	web	2024-12-02 08:13:37	2024-12-02 08:13:37
31	vehicle-makes-save	web	2024-12-02 08:13:37	2024-12-02 08:13:37
32	vehicle-makes-edit	web	2024-12-02 08:13:37	2024-12-02 08:13:37
33	vehicle-makes-delete	web	2024-12-02 08:13:37	2024-12-02 08:13:37
34	vehicle-models	web	2024-12-02 08:13:37	2024-12-02 08:13:37
35	vehicle-models-create	web	2024-12-02 08:13:37	2024-12-02 08:13:37
36	vehicle-models-save	web	2024-12-02 08:13:37	2024-12-02 08:13:37
37	vehicle-models-edit	web	2024-12-02 08:13:37	2024-12-02 08:13:37
38	vehicle-models-delete	web	2024-12-02 08:13:37	2024-12-02 08:13:37
39	rates	web	2024-12-02 08:13:37	2024-12-02 08:13:37
40	rates-create	web	2024-12-02 08:13:37	2024-12-02 08:13:37
41	rates-save	web	2024-12-02 08:13:37	2024-12-02 08:13:37
42	rates-edit	web	2024-12-02 08:13:37	2024-12-02 08:13:37
43	rates-delete	web	2024-12-02 08:13:37	2024-12-02 08:13:37
44	location-suggestions	web	2024-12-02 08:13:37	2024-12-02 08:13:37
45	location-suggestions-create	web	2024-12-02 08:13:37	2024-12-02 08:13:37
46	location-suggestions-save	web	2024-12-02 08:13:37	2024-12-02 08:13:37
47	location-suggestions-edit	web	2024-12-02 08:13:37	2024-12-02 08:13:37
48	location-suggestions-delete	web	2024-12-02 08:13:37	2024-12-02 08:13:37
49	feedbacks	web	2024-12-02 08:13:37	2024-12-02 08:13:37
50	feedbacks-customer	web	2024-12-02 08:13:37	2024-12-02 08:13:37
51	feedbacks-driver	web	2024-12-02 08:13:37	2024-12-02 08:13:37
52	feedbacks-cabby	web	2024-12-02 08:13:37	2024-12-02 08:13:37
53	livechat	web	2024-12-02 08:13:37	2024-12-02 08:13:37
54	discounts	web	2024-12-02 08:13:37	2024-12-02 08:13:37
55	discounts-create	web	2024-12-02 08:13:37	2024-12-02 08:13:37
56	discounts-save	web	2024-12-02 08:13:37	2024-12-02 08:13:37
57	discounts-edit	web	2024-12-02 08:13:37	2024-12-02 08:13:37
58	discounts-delete	web	2024-12-02 08:13:37	2024-12-02 08:13:37
59	tasks	web	2024-12-02 08:13:37	2024-12-02 08:13:37
60	tasks-create	web	2024-12-02 08:13:37	2024-12-02 08:13:37
61	tasks-save	web	2024-12-02 08:13:37	2024-12-02 08:13:37
62	tasks-edit	web	2024-12-02 08:13:37	2024-12-02 08:13:37
63	tasks-delete	web	2024-12-02 08:13:37	2024-12-02 08:13:37
64	complaints	web	2024-12-02 08:13:37	2024-12-02 08:13:37
65	complaints-from-customer	web	2024-12-02 08:13:37	2024-12-02 08:13:37
66	complaints-from-driver	web	2024-12-02 08:13:37	2024-12-02 08:13:37
67	accounts	web	2024-12-02 08:13:37	2024-12-02 08:13:37
68	accounts-driver	web	2024-12-02 08:13:37	2024-12-02 08:13:37
69	accounts-customer	web	2024-12-02 08:13:37	2024-12-02 08:13:37
70	payment-history	web	2024-12-02 08:13:37	2024-12-02 08:13:37
71	reports	web	2024-12-02 08:13:38	2024-12-02 08:13:38
72	reports-driver	web	2024-12-02 08:13:38	2024-12-02 08:13:38
73	reports-customer	web	2024-12-02 08:13:38	2024-12-02 08:13:38
74	reports-rides	web	2024-12-02 08:13:38	2024-12-02 08:13:38
75	reports-companies	web	2024-12-02 08:13:38	2024-12-02 08:13:38
76	reports-driver-excel-export	web	2024-12-02 08:13:38	2024-12-02 08:13:38
77	reports-customer-excel-export	web	2024-12-02 08:13:38	2024-12-02 08:13:38
78	reports-rides-excel-export	web	2024-12-02 08:13:38	2024-12-02 08:13:38
79	reports-companies-excel-export	web	2024-12-02 08:13:38	2024-12-02 08:13:38
80	cabby-pages	web	2024-12-02 08:13:38	2024-12-02 08:13:38
81	cabby-pages-about-us	web	2024-12-02 08:13:38	2024-12-02 08:13:38
82	cabby-pages-terms-and-conditions	web	2024-12-02 08:13:38	2024-12-02 08:13:38
83	cabby-pages-privacy-policy	web	2024-12-02 08:13:38	2024-12-02 08:13:38
84	cabby-pages-contact-details	web	2024-12-02 08:13:38	2024-12-02 08:13:38
85	cabby-pages-faqs	web	2024-12-02 08:13:38	2024-12-02 08:13:38
86	cabby-pages-emergency-assistance	web	2024-12-02 08:13:38	2024-12-02 08:13:38
87	cabby-pages-report-safety-issues	web	2024-12-02 08:13:38	2024-12-02 08:13:38
88	cabby-pages-share-my-trip	web	2024-12-02 08:13:38	2024-12-02 08:13:38
89	cabby-pages-safety-center	web	2024-12-02 08:13:38	2024-12-02 08:13:38
90	roles	web	2024-12-02 08:13:38	2024-12-02 08:13:38
91	roles-create	web	2024-12-02 08:13:38	2024-12-02 08:13:38
92	roles-save	web	2024-12-02 08:13:38	2024-12-02 08:13:38
93	roles-edit	web	2024-12-02 08:13:38	2024-12-02 08:13:38
94	roles-delete	web	2024-12-02 08:13:38	2024-12-02 08:13:38
95	users	web	2024-12-02 08:13:38	2024-12-02 08:13:38
96	users-create	web	2024-12-02 08:13:38	2024-12-02 08:13:38
97	users-save	web	2024-12-02 08:13:38	2024-12-02 08:13:38
98	users-edit	web	2024-12-02 08:13:38	2024-12-02 08:13:38
99	users-delete	web	2024-12-02 08:13:38	2024-12-02 08:13:38
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
1	App\\Models\\User	3	api_token	51932bdccf9d68b7c4b2d6b02d3b39afae783f4894bb38579be1789edcbbb574	["*"]	\N	\N	2024-11-12 11:10:03	2024-11-12 11:10:03
2	App\\Models\\User	4	api_token	abbbb3753834874f9eccc3871d5a4af99297f3ac866b34fc739f94d6b39631b9	["*"]	\N	\N	2024-11-12 11:10:21	2024-11-12 11:10:21
3	App\\Models\\User	5	api_token	65f24a76f79101909a2d3121e179077bb6f1890cdfc537f5673876e3820314c3	["*"]	\N	\N	2024-11-12 11:10:47	2024-11-12 11:10:47
4	App\\Models\\User	6	api_token	2d6803446278e954847af125cbe4870198fc7e62e509a02f6306907d217b626f	["*"]	\N	\N	2024-11-12 11:15:37	2024-11-12 11:15:37
5	App\\Models\\User	8	api_token	d826f245f292bb8c80574e23cd06fad365517e74409db958042222c30b7b4d0f	["*"]	\N	\N	2024-11-13 12:37:05	2024-11-13 12:37:05
6	App\\Models\\User	9	api_token	5a024cd78371e43e417792bd07656118021adc2881019329b4e9dd41ffc52ee1	["*"]	\N	\N	2024-11-13 12:44:42	2024-11-13 12:44:42
7	App\\Models\\User	10	api_token	b38fcfe3a8f653d6213115401833762ad08bf8343d828bc68b387000ca4c6b28	["*"]	\N	\N	2024-11-18 04:16:52	2024-11-18 04:16:52
8	App\\Models\\User	11	api_token	92a9e0b9811f989878c935ffbef23409daaa630e98bdb105cb7022e236b3628f	["*"]	\N	\N	2024-11-18 08:32:52	2024-11-18 08:32:52
9	App\\Models\\User	12	api_token	06e15c862abdb954f856e9c3d284b13a431b54744ddc41d1589b5daced82b58e	["*"]	\N	\N	2024-11-18 09:28:10	2024-11-18 09:28:10
10	App\\Models\\User	13	api_token	e65c6ba2580d89ccf77fe9c6b70b0bb327adadc54aff8b18c61da5c8b01ba481	["*"]	\N	\N	2024-11-18 09:34:51	2024-11-18 09:34:51
11	App\\Models\\User	14	api_token	16098cdbf00d7727eb325a81c9027c65dda6bb0eb4d7dc7230005f34b92a7774	["*"]	\N	\N	2024-11-18 10:57:18	2024-11-18 10:57:18
12	App\\Models\\User	15	api_token	64ad8b35dd2f6d01a687d51ae5fd109839dc6bd8a16b58b0d807d03b19bda2be	["*"]	\N	\N	2024-11-19 12:58:18	2024-11-19 12:58:18
13	App\\Models\\User	17	api_token	e1531edb347d1cfda8ac4a0d4c41804c8a72db9205a61d1c13a6134a0e7bd00d	["*"]	\N	\N	2024-11-22 08:19:03	2024-11-22 08:19:03
14	App\\Models\\User	19	api_token	23a6a38e56e1a120e0bc96108bf99457aaf9fdf8557bdeaf177a64708594b62a	["*"]	\N	\N	2024-11-22 09:16:25	2024-11-22 09:16:25
15	App\\Models\\User	20	api_token	637416e11dac8116d5620ad7e461438bcbbfdaccfb36c364bfb27fb8e2ae3c8a	["*"]	\N	\N	2024-11-22 11:37:00	2024-11-22 11:37:00
16	App\\Models\\User	23	api_token	a82a5ff141829d58102df07cd67648b190e1bf381f6ab799597d892a7e4cff28	["*"]	\N	\N	2024-11-25 05:16:56	2024-11-25 05:16:56
17	App\\Models\\User	25	api_token	4e4f24efd67ae8d8a77fd0158b43e2930622dbaec12e76bf1549569ab7d66cc4	["*"]	\N	\N	2024-11-26 15:42:17	2024-11-26 15:42:17
18	App\\Models\\User	27	api_token	a8e6ce2c498c3f3a0d30e1ff9982cc47badd2e568b1e1ebee45e8b01d90baf7a	["*"]	\N	\N	2024-11-28 23:33:11	2024-11-28 23:33:11
19	App\\Models\\User	28	api_token	a86931c88af83e39b8cfd637dd35b8cb16a8b5b0a7ce95ea749434980063de1b	["*"]	\N	\N	2024-11-28 23:40:15	2024-11-28 23:40:15
20	App\\Models\\User	29	api_token	5f16a8cd07b88624ed01e5068cd3a22c636dbe9769caa3ad8e8e05e4185d7f94	["*"]	\N	\N	2024-11-29 09:45:25	2024-11-29 09:45:25
21	App\\Models\\User	31	api_token	0ec12f6d031c08f9dd3956eb8abb6c90c8c09719508cd6ea7be342352e98ba0f	["*"]	\N	\N	2024-11-29 21:22:04	2024-11-29 21:22:04
22	App\\Models\\User	32	api_token	ee314e5c1e70d15c2a8f63dfd1593eaf2bb3d4716e6b4297bfa3e3350097b9cd	["*"]	\N	\N	2024-11-30 10:48:45	2024-11-30 10:48:45
23	App\\Models\\User	33	api_token	9e42de9397fdf6112de17cf755d12ab39c507aae0514cb020b463028025dab0d	["*"]	\N	\N	2024-11-30 12:01:19	2024-11-30 12:01:19
24	App\\Models\\User	34	api_token	9e517a1b2002704b4bb3d93fb0e77533a7100560afa9063be02974c0ac4c4949	["*"]	\N	\N	2024-11-30 12:08:55	2024-11-30 12:08:55
25	App\\Models\\User	35	api_token	8ca43562db3184c53ca65551bae13adcd4bf337a74c49eb362fdd25d72399175	["*"]	\N	\N	2024-11-30 13:22:46	2024-11-30 13:22:46
26	App\\Models\\User	36	api_token	9739e946a4b813dded20d13605438ae8d714e1c44a091a63909afeb5a9934a6b	["*"]	\N	\N	2024-11-30 14:28:40	2024-11-30 14:28:40
27	App\\Models\\User	37	api_token	b053b4e0aed9de4718d1893426e2eaa7b82677b1d1b8b498ebaf380bd751f532	["*"]	\N	\N	2024-11-30 23:54:56	2024-11-30 23:54:56
28	App\\Models\\User	38	api_token	fe29ebe9db88e292d5211801404002b059ea003807b3cf083aa56e7db734d369	["*"]	\N	\N	2024-12-01 15:58:29	2024-12-01 15:58:29
29	App\\Models\\User	39	api_token	efa391962c7163edc98ad20741a3a4777e8b59b794d5b8ffb145bd63e12b2ea3	["*"]	\N	\N	2024-12-02 10:36:43	2024-12-02 10:36:43
30	App\\Models\\User	40	api_token	a338dbb1489b7f32e30d221e0b07c25e41ca1753670968c062b2f89cfe8d2542	["*"]	\N	\N	2024-12-02 13:29:03	2024-12-02 13:29:03
31	App\\Models\\User	41	api_token	c82e394bceea8958a7de33e50ab1fcc5e1c715c8cdd97bd99931483c6bab62c5	["*"]	\N	\N	2024-12-04 01:43:29	2024-12-04 01:43:29
\.


--
-- Data for Name: rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rates (id, vehicle_type_id, period_name, start_time, end_time, base_fare, waiting_charge_per_min, commission, rta_commission, hourly_payment, rate_per_km, created_at, updated_at, deleted_at, status) FROM stdin;
1	1	morning	01:59:00	23:54:00	10	10	5	5	10	15	2024-11-20 06:30:11	2024-11-20 06:30:11	\N	1
2	2	test	02:02:00	23:29:00	15	20	10	10	10	20	2024-11-20 06:30:53	2024-11-20 06:30:53	\N	1
3	4	Suv testing	04:00:00	23:00:00	100000	2.5	5	3	20	10	2024-11-21 12:55:41	2024-11-25 06:44:58	\N	1
4	4	Afternoon	04:20:00	04:30:00	5000	100	5	2	60	80	2024-11-28 16:18:32	2024-11-28 16:18:32	\N	1
\.


--
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
41	1
42	1
43	1
44	1
45	1
46	1
47	1
48	1
49	1
50	1
51	1
52	1
53	1
54	1
55	1
56	1
57	1
58	1
59	1
60	1
61	1
62	1
63	1
64	1
65	1
66	1
67	1
68	1
69	1
70	1
71	1
72	1
73	1
74	1
75	1
76	1
77	1
78	1
79	1
80	1
81	1
82	1
83	1
84	1
85	1
86	1
87	1
88	1
89	1
90	1
91	1
92	1
93	1
94	1
95	1
96	1
97	1
98	1
99	1
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
1	Administrator	web	2024-12-02 08:13:51	2024-12-02 08:13:51
3	User	web	2024-12-02 08:13:51	2024-12-02 08:13:51
4	Driver	web	2024-12-02 08:13:51	2024-12-02 08:13:51
5	Company	web	2024-12-02 08:13:51	2024-12-02 08:13:51
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, caby_commission_percentaqge, driver_commission_percentaqge, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: temp_bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_bookings (id, user_id, booking_code, pickup_latitude, pickup_longitude, dropoff_latitude, dropoff_longitude, pickup_location_name, dropoff_location_name, vehicle_type_id, payment_type, base_fare, rta_commssion, rate_per_km, total_km_charge, total_charge, amount_to_pay, wallet_amount_used, rate_id, distance_km, time_needed, needed_date, need_time, currency_code, driver_instructions, friend_name, friend_phone_number, created_at, updated_at, coupon_code, coupon_id, coupon_discount, is_scheduled) FROM stdin;
37	8	CB1732809673	25.2048	55.2708	25.2567	55.3643	dubai	dubai airport	2	1	15	10	20	379.2	404.2	404.2	0	2	18.96	28 mins	2024-11-28	15:20:00	AED	airport cehcking time to fast	sooraj	+919847823799	2024-11-28 16:01:13	2024-11-28 16:01:13	FREERIDE2	0	0	1
\.


--
-- Data for Name: temp_tip_amounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_tip_amounts (id, booking_id, driver_id, user_id, payment_type, tip_amount, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: temp_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_users (id, name, email, password, dial_code, phone, user_phone_otp, user_device_token, firebase_user_key, user_image, dob, gender, company_id, vehicle_type_id, vechicle_make_id, vehicle_model_id, vehicle_front_view, vehicle_back_view, driving_licence_front_view, driving_licence_back_view, driving_licence_number, driving_licence_expiry_date, rta_permit_front_view, rta_permit_back_view, rta_permit_number, rta_permit_expiry_date, emirates_id_front_view, emirates_id_back_view, emirates_id_number, emirates_id_expiry_date, ownership_certifcate_front_view, ownership_certifcate_back_view, ownership_certifcate_number, ownership_certifcate_expiry_date, created_at, updated_at, first_name, last_name, role, user_code) FROM stdin;
9	\N	\N	\N	971	9847823791		234234234	\N	\N	\N	3	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-18 05:20:05	2024-11-18 05:20:12	\N	\N	3	\N
11	\N	\N	\N	971	984782398	1111	\N	\N	\N	\N	3	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-18 06:02:32	2024-11-18 06:02:32	\N	\N	3	\N
28	\N	\N	\N	971	9847823795	1111	\N	\N	\N	\N	3	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-28 23:04:18	2024-11-28 19:04:18	\N	\N	3	\N
16	Usama Shakeel	ushakeel010@gmail.com	\N	971	313243464		esiJzS_VSIS05x-2wVep_b:APA91bHq3QIimlkWi-sy4g-nk8NrubhFaBhallai_d0SITLNaC0AhEbdPsc0ByyEsZ5AIfm5DknFBd6USUsgpAHE03QXOYa81Xu7C_37hv6YYnzCoNFCwHE	\N	1731917595673af71b93342.jpg	2024-11-17	1	7	2	2	2	1731917664673af760ba477.jpg	1731917664673af760bba36.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-18 08:13:15	2024-11-18 08:14:24	Usama	Shakeel	4	CBD81731917595
17	Usama Shakeel	ushakeel010@gmail.com	\N	971	331545466		esiJzS_VSIS05x-2wVep_b:APA91bHq3QIimlkWi-sy4g-nk8NrubhFaBhallai_d0SITLNaC0AhEbdPsc0ByyEsZ5AIfm5DknFBd6USUsgpAHE03QXOYa81Xu7C_37hv6YYnzCoNFCwHE	\N	1731920574673b02be9e02c.jpg	2024-11-17	1	7	2	2	2	1731920589673b02cd2da37.jpg	1731920589673b02cd2efd2.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-18 09:02:54	2024-11-18 09:03:09	Usama	Shakeel	4	CBD181731920574
13	\N	\N	\N	971	649494994		esiJzS_VSIS05x-2wVep_b:APA91bHq3QIimlkWi-sy4g-nk8NrubhFaBhallai_d0SITLNaC0AhEbdPsc0ByyEsZ5AIfm5DknFBd6USUsgpAHE03QXOYa81Xu7C_37hv6YYnzCoNFCwHE	\N	\N	\N	3	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-18 07:09:00	2024-11-18 07:09:05	\N	\N	3	\N
18	Usama Shakeel	ushakeel010@gmail.com	\N	971	313546464		esiJzS_VSIS05x-2wVep_b:APA91bHq3QIimlkWi-sy4g-nk8NrubhFaBhallai_d0SITLNaC0AhEbdPsc0ByyEsZ5AIfm5DknFBd6USUsgpAHE03QXOYa81Xu7C_37hv6YYnzCoNFCwHE	\N	1731920795673b039b614e9.jpg	2024-11-17	1	7	2	2	2	1731920812673b03ac02395.jpg	1731920812673b03ac039f1.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-18 09:06:35	2024-11-18 09:06:52	Usama	Shakeel	4	CBD121731920795
15	Usama Shakeel	ushakeel010@gmail.com	\N	971	631646644		esiJzS_VSIS05x-2wVep_b:APA91bHq3QIimlkWi-sy4g-nk8NrubhFaBhallai_d0SITLNaC0AhEbdPsc0ByyEsZ5AIfm5DknFBd6USUsgpAHE03QXOYa81Xu7C_37hv6YYnzCoNFCwHE	\N	1731917396673af65420eb4.jpg	2024-11-17	1	7	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-18 08:09:56	2024-11-18 08:09:56	Usama	Shakeel	4	CBD31731917396
22	\N	\N	\N	971	331580275	1111	\N	\N	\N	\N	3	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-21 06:16:59	2024-11-21 06:16:59	\N	\N	3	\N
14	Usama Shakeel	ushakeel010@gmail.com	\N	971	331546466		esiJzS_VSIS05x-2wVep_b:APA91bHq3QIimlkWi-sy4g-nk8NrubhFaBhallai_d0SITLNaC0AhEbdPsc0ByyEsZ5AIfm5DknFBd6USUsgpAHE03QXOYa81Xu7C_37hv6YYnzCoNFCwHE	\N	1731917515673af6cb82d9d.jpg	2024-11-17	1	7	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-18 08:11:55	2024-11-18 08:11:55	Usama	Shakeel	4	CBD191731917515
40	\N	\N	\N	971	345464666		ey3zQAOkRR6JywQapz-9aA:APA91bFeeyk8gupYyLcE8OIO_rpGqKUUXvBioZZdXxlwSk6bjeKbN5WDk7rVTyUVv1aN5B6mWjBMPSrs14Dnz9nUm3BTMOcHCbMx93bX2wpRTECC1JnCGKI	\N	\N	\N	3	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-30 17:16:07	2024-11-30 17:16:11	\N	\N	3	\N
31	\N	\N	\N	92	331500275	1111	\N	\N	\N	\N	3	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-29 15:56:03	2024-11-29 11:56:03	\N	\N	3	\N
32	\N	\N	\N	971	331500273	1111	\N	\N	\N	\N	3	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-29 15:58:53	2024-11-29 11:58:53	\N	\N	3	\N
34	\N	\N	\N	971	546648649	1111	\N	\N	\N	\N	3	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-30 06:28:16	2024-11-30 02:28:16	\N	\N	3	\N
45	Usama Shakeel	jk@kj.com	\N	971	345678988		ey3zQAOkRR6JywQapz-9aA:APA91bFeeyk8gupYyLcE8OIO_rpGqKUUXvBioZZdXxlwSk6bjeKbN5WDk7rVTyUVv1aN5B6mWjBMPSrs14Dnz9nUm3BTMOcHCbMx93bX2wpRTECC1JnCGKI	\N	1733131893674d7e758f46a.jpg	2024-12-01	1	7	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-02 09:31:33	2024-12-02 09:31:33	Usama	Shakeel	4	CBD51733131893
46	\N	\N	\N	971	364566343		ey3zQAOkRR6JywQapz-9aA:APA91bFeeyk8gupYyLcE8OIO_rpGqKUUXvBioZZdXxlwSk6bjeKbN5WDk7rVTyUVv1aN5B6mWjBMPSrs14Dnz9nUm3BTMOcHCbMx93bX2wpRTECC1JnCGKI	\N	\N	\N	3	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-02 13:43:02	2024-12-02 13:43:06	\N	\N	3	\N
47	Usama Shakeel	uy@j.com	\N	971	373166467		ey3zQAOkRR6JywQapz-9aA:APA91bFeeyk8gupYyLcE8OIO_rpGqKUUXvBioZZdXxlwSk6bjeKbN5WDk7rVTyUVv1aN5B6mWjBMPSrs14Dnz9nUm3BTMOcHCbMx93bX2wpRTECC1JnCGKI	\N	1733132693674d8195eb913.jpg	2024-12-01	1	7	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-02 09:44:53	2024-12-02 09:44:53	Usama	Shakeel	4	CBD181733132693
48	\N	\N	\N	971	213184545454	1111	\N	\N	\N	\N	3	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-04 01:10:26	2024-12-03 21:10:26	\N	\N	3	\N
49	\N	\N	\N	971	81343434455	1111	\N	\N	\N	\N	3	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-04 01:15:43	2024-12-03 21:15:43	\N	\N	3	\N
50	\N	\N	\N	971	484455455454	1111	\N	\N	\N	\N	3	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-04 01:18:49	2024-12-03 21:18:49	\N	\N	3	\N
\.


--
-- Data for Name: tip_amounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tip_amounts (id, booking_id, driver_id, user_id, payment_type, tip_amount, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, user_code, name, email, email_verified_at, password, dial_code, phone, user_phone_otp, user_device_token, firebase_user_key, access_token, role, status, deleted, user_image, dob, gender, company_id, remember_token, created_at, updated_at, first_name, last_name, latitude, longitude, hide_profile, is_verified, wallet_amount, avg_rating, rated_users) FROM stdin;
1	\N	Admin	admin@admin.com	\N	$2y$12$x0uvl6ysyThjRUnIXBuJe.LkcbYW1Dk5N98NxoeM0tyrCGOs6HCs6	971	112233445566778899	\N	\N	\N	\N	1	1	0	\N	\N	3	0	\N	\N	2024-11-11 09:56:40	\N	\N	\N	\N	0	0	0	0	0
15	CBU141732021098	Usama Shakeel	ushakeel@gmail.com	\N	\N	971	331500275		dYB-EJVYSweMLT2uxuzG-n:APA91bGG3C_6s2-Z276Y4qvZcx8KkhJdkyDmLrIdZ8SlFAID8aj-o0_oKYCd6RleUjWvLL-y5wmHnGBXnedRsF6wJQRnuTtTv5JkT1q6NQK_sWD8cOncG9Q	-OC3V8Z8AgGCnvnO12n_	12|N72lkgALJtaP10ZUcvLYUHwIZ28L7UR3ovz4u7eS88fb4694	3	1	0	1732960222674adfde39088.jpg	2024-11-29	2	0	\N	2024-11-19 12:58:18	2024-12-03 21:16:07	Usama	Shakeel	\N	\N	0	0	95324.5	0	0
19	CBU81732266985	User Cabby	cabby@gmail.com	\N	\N	971	561660144		fhyh_iAxTrurW_9UOKujJq:APA91bHovQqbgB4KPOwoS6XreLhzZjVfgRxPv7MXgyBFZG7xMNyodHYCeh5-5Z-jMgWkRSGU41Px-RR6jsrdO7M1p35fI_9Wk7jCZLTxfwqo3So2pKyacD8	-OCI97jI0UAKox6448zI	14|8KRPfSnmaXH5ZNu0oJFEpncdXSl9BCRtcuKmrVW5e0962aa5	3	1	0	\N	\N	3	0	\N	2024-11-22 09:16:25	2024-11-23 05:58:03	User	Cabby	\N	\N	0	0	0	0	0
6	CBU121731410137	Sooraj Sabu	sooraj.a2solution+2@gmail.com	\N	\N	971	9847823799		111111111	-OBxU27ZpkGcRtv6fAeI	4|4H5qrz2qnINmA8gLkadLCi6GPqz2vpeYE1OE83Rb3dc639b3	3	1	0	\N	\N	3	0	\N	2024-11-12 11:15:37	2024-11-29 21:02:09	Sooraj	Sabu	25.7128	-55.0060	0	0	0	0	0
10	CBU121731903412	dev de	dev@dev.com	\N	\N	971	808524456	\N	111111111	-OBxUCjJsDxkbkKfUiu7	7|17BzvF9Rybi3yz0tWmnlJOHDTadM1if7i38lUYjue96d5b19	3	1	0	\N	\N	3	0	\N	2024-11-18 04:16:52	2024-11-18 04:16:53	dev	de	\N	\N	0	0	0	0	0
14	CBD201731927371	Sooraj Sabu	sooraj@yopmail.com	\N	\N	971	505865875	\N	c4IPLmKwTrCxKqOYM2-_ZV:APA91bF7BuvHEud3LC7JxKcfk_iUl9wYQSsvG0AF-_Xum9PntUDp20_QrTzWtMADcWxHHQVPuZncWhnIdMZOWpOsM9WT1RUwmdtcWCpzNXNZvCSeHBKbO1o	-OByurMjfI0ZoaVVo4fT	11|3k6dw2g8uaFvPICHDb9ERxGp6CappAPKugS8Q4rKcde4707c	4	1	0	1731927371673b1d4b30104.jpg	\N	3	0	\N	2024-11-18 10:57:18	2024-11-18 10:57:18	Sooraj	Sabu	9.8565498	76.6510898	0	0	0	0	0
17	CBU21732263543	Anil Navis	anilnavis@gmail.com	\N	\N	971	564005096		cHKaBkcSQ3u7B2yT0Ef0Qt:APA91bHtWUPm8Jh0frCFknw619zTEFohLa4mE3OMRaguWTgUgebmuORlb7Or-Ml6nnfqAv_67IJuUgHo58DTI5syq3i1JmcADizqttEEteFiuNSQe53W2Uo	-OCHx-MfVlKWHB_cGUrx	13|wkoEXuAXeFROA8x4cSvJxbrJ9VRw37Hdt9gKxExz8bf2cec4	3	1	0	\N	\N	3	0	\N	2024-11-22 08:19:03	2024-11-30 06:45:31	Anil	Navis	\N	\N	0	0	0	0	0
11	CBD111731911066	Usama driver	usama@yopmail.com	\N	\N	971	984782372	\N	234234234	-OByOnql6a2bC3V4WnY4	8|VVA8ORKAyPrbSY83QSeeQZGK1vVFTv4K0RJnQeei2464ecae	4	1	0	1731911066673add9a81b93.jpg	\N	3	0	\N	2024-11-18 08:32:52	2024-11-18 08:32:53	Usama	driver	\N	\N	0	0	0	0	0
18	CBU201732263929	Al Falasi Luxury Transport	j@yy.com	\N	$2y$12$rI8m5nNV7OsDxlVyzue3yePOuKo8/X0rsWVElFVJq6T387KniRy3G	971	8758785885	\N	\N	\N	\N	5	1	0	1732264108674040ac389cc.jpg	\N	3	2	\N	2024-11-22 08:28:28	2024-12-02 16:18:18	\N	\N	\N	\N	0	0	0	0	0
12	CBD181731922004	Usama Shakeel	ushakeel010@gmail.com	\N	\N	971	331245433	\N	esiJzS_VSIS05x-2wVep_b:APA91bHq3QIimlkWi-sy4g-nk8NrubhFaBhallai_d0SITLNaC0AhEbdPsc0ByyEsZ5AIfm5DknFBd6USUsgpAHE03QXOYa81Xu7C_37hv6YYnzCoNFCwHE	-OByaSoozUw8yvy6Y4iy	9|7OYtMiprZvZZVzaf6WvvcOVVfC6Kk15i3pMNhvct563ec1ea	4	1	0	1731922004673b08543d7ad.jpg	\N	3	0	\N	2024-11-18 09:28:10	2024-11-18 09:28:11	Usama	Shakeel	\N	\N	0	0	0	0	0
7	CMP-122	Al Ghazal Transport Co	cmp@cmp.com	2024-11-13 10:35:54		971	50505055	1111	device			5	1	0	\N	\N	3	1	\N	2024-11-13 10:35:54	2024-12-02 16:20:06	\N	\N	\N	\N	0	0	0	0	0
23	CBU171732511816	Sooraj Sabu	soorajsabu@yopmail.com	\N	\N	91	9847823799	\N	faaM5vMVRDSUaXLHmEeQVl:APA91bERvZmMGugLOBWNskwC_fnZueAxqnZ2y1rwNmeM4i-XCKTP9wzJRVICCJ8JHZvloH_9V17XQsl2BU1my6n7RNXCKZvp7UDqQd2VkpqKVGKOrg0aOhQ	-OCWk4veF3xFuIt9Bxlw	16|pvd6SXNYwJbHCbbzmd0bkM5SHRsiEMM3rFe9CPhJf6c747ce	3	1	0	\N	\N	3	0	\N	2024-11-25 05:16:56	2024-11-25 05:16:57	Sooraj	Sabu	\N	\N	0	0	0	0	0
28	CBU101732822815	moin ahmed	test11@gmail.com	\N	\N	971	9847823796	\N	abdhjef ekef kjwf wedfw	-OCoHSEjXwClRW_N5a9e	19|bxCpWwFNJCTRiyOjn1bLy04CykEwpF8IyhW5965A17dcfbe6	3	1	0	\N	\N	3	0	\N	2024-11-28 19:40:15	2024-11-29 16:39:15	moin	ahmed	\N	\N	0	0	0	0	0
22	CBU41732507969	Rakesh K A	rakeshdxbapps@hotmail.com	\N	$2y$12$duADe26y5U0eOd/Y5TupQOylbsnh8vyv0O0bkNG0mpUBEGN5IL0le	971	1234567890	\N	\N	\N	\N	3	1	0	17325080946743f9be5c3aa.jpg	1990-05-26	1	0	\N	2024-11-25 04:14:54	2024-11-26 14:19:03	Rakesh	K A	\N	\N	0	0	0	0	0
20	CBU31732275420	Usama Shakeel	ushake@gmail.com	\N	\N	971	331500245	\N	c5rKR2v0RLqUzc4DrpgvB3:APA91bE2Z8R0_CgIevA95RXaLUYOb0aOC25DAaELZlgEaFeMahUwFdmwKfBqp3CShXHUKKc8uD4Q-PezDrcnQ9UZ_HHr7uYRHeSslKXZgG2G_AHOzfVtILU	-OCIeJ1NkNHgKe0mYncO	15|sNug8TK698gG3DmzrLthIRBZy6yd1gmlFTsm3e3M3bf12306	3	1	0	\N	\N	3	0	\N	2024-11-22 11:37:00	2024-11-22 11:37:01	Usama	Shakeel	\N	\N	0	0	0	0	0
24	CBD171732616542	Aurora Kinney	rofym@mailinator.com	\N	$2y$12$rJDmukKJbRVxY8oV6qoEPeYHLLPcbFsNbMmi.XKEI2z35FPR7xOfe	971	881424242	\N	\N	\N	\N	4	1	0	17326166226745a1aeef561.jpeg	2007-11-14	2	2	\N	2024-11-26 14:23:42	2024-11-26 14:23:42	Aurora	Kinney	\N	\N	0	0	0	0	0
27	CBU181732822391	a b	test10@gmail.com	\N	\N	971	9847823790	\N	abdhjef ekef kjwf wedfw	-OCoFptciajP_4LIbyrc	18|Pfp9zQE3ykVbUHagUqexjBCcKF1FwJiHhYXwnu5M61277f86	3	1	0	\N	\N	3	0	\N	2024-11-28 19:33:11	2024-11-28 23:33:12	a	b	\N	\N	0	0	0	0	0
29	CBD191732859044	Usama Shakeel	ushak@gmail.com	\N	\N	971	331500246	\N	ey3zQAOkRR6JywQapz-9aA:APA91bFeeyk8gupYyLcE8OIO_rpGqKUUXvBioZZdXxlwSk6bjeKbN5WDk7rVTyUVv1aN5B6mWjBMPSrs14Dnz9nUm3BTMOcHCbMx93bX2wpRTECC1JnCGKI	-OCqRyCjDTpCX0puO4S0	20|U1yUgJ9m5qRKOWj46nsb6kX0r9QnWgNVXBafIocL24081245	4	1	0	1732859044674954a4c68c5.jpg	\N	3	0	\N	2024-11-29 05:45:25	2024-11-29 09:45:26	Usama	Shakeel	33.6346754	73.0578023	0	0	0	0	0
8	CBD131731478845	Sooraj Sabu	sooraj.a2solution+3@gmail.com	\N	\N	971	9847823798		234234234	-OBxlK4zzQqqrsC3otw8	5|IFINyRoRDqB5TfvwvAiiDCafyMVbc56eaehDI0Iv8275fb39	4	1	0	\N	\N	3	0	\N	2024-11-13 12:37:04	2024-11-30 09:17:49	Sooraj	Sabu	\N	\N	0	0	404.2	0	0
31	CBU91732900924	abc test	test91@gmail.com	\N	\N	971	523484545454	\N	abdhjef ekef kjwf wedfw	-OCswQ0KBktPKsD9_9CY	21|f9XETm7hlTkJ5OqAcbY88Ywxu0K8LqSTQmncuG0s56d41041	3	1	0	1732910407674a1d4794b7b.jpg	2007-11-29	1	0	\N	2024-11-29 17:22:04	2024-11-29 20:21:51	abc	test	\N	\N	0	0	0	0	0
32	CBU161732949325	Anil Navis	cv@vbb.com	\N	\N	971	800800800	\N	cHKaBkcSQ3u7B2yT0Ef0Qt:APA91bHtWUPm8Jh0frCFknw619zTEFohLa4mE3OMRaguWTgUgebmuORlb7Or-Ml6nnfqAv_67IJuUgHo58DTI5syq3i1JmcADizqttEEteFiuNSQe53W2Uo	-OCvp2UdusrY-e_SQVlj	22|TfRRq55qCREiXL5mYm4Z6XNzcwXsqbjxT7dRkPpx7d4ab66e	3	1	0	\N	\N	3	0	\N	2024-11-30 06:48:45	2024-11-30 10:48:45	Anil	Navis	\N	\N	0	0	0	0	0
36	CBU11732962520	Joya Smith	u@u.com	\N	\N	971	123123123		fp_KltMjSpC0QfRNVF6USM:APA91bFbecuLW0DuXsIPF7INOILJBpaBkWvRvYSgdxiDLkwpzEwqveyoiZ8HbYYI3nxIbubohMbHW8IANfmwIvqM1-5UvOiWvY6H9mKwgpQPRQDcr-1skMc	-OCwbO0yBrdjVTxhDtK_	26|zUxLHKBOkoYvH1Y33BsgVg36IOXwegDvlBxTxJ4F7bc3fead	3	1	0	1732962758674ae9c6b1ff5.jpg	2024-11-29	2	0	\N	2024-11-30 10:28:40	2024-12-03 12:44:35	Joya	Smith	\N	\N	0	0	99457.3	0	0
26	CBU141732789170	Guest hhh	guesthhh@gmail.com	\N	$2y$12$VX9YzF0zeRAqp3ObGIKqIuJWsC2X2EAHeBOLg3AvEec/DRgknwlvy	971	561660100		fp_KltMjSpC0QfRNVF6USM:APA91bFbecuLW0DuXsIPF7INOILJBpaBkWvRvYSgdxiDLkwpzEwqveyoiZ8HbYYI3nxIbubohMbHW8IANfmwIvqM1-5UvOiWvY6H9mKwgpQPRQDcr-1skMc	-OCvoxPBu4qpyOAPU1sM	\N	3	1	0	1732789222674843e6eaa96.png	1998-12-30	1	0	\N	2024-11-28 14:20:22	2024-12-03 08:20:40	Guest	hhh	\N	\N	0	0	0	0	0
35	CBU11732958566	Anil navis	b@b.com	\N	\N	971	22552255	\N	abdhjef ekef kjwf wedfw	-OCwNIZiY027pApSSGsf	25|3pQSmF2XLIS0KHLOpG1kfYM6KKqxUJtFBHx3OdbY24fa14c3	3	1	0	1732958606674ad98e1dc9b.jpg	2024-11-30	1	0	\N	2024-11-30 09:22:46	2024-11-30 09:23:52	Anil	navis	\N	\N	0	0	0	0	0
13	CBD181731922200	Usama Shakeel	ushakeel0@gmail.com	\N	\N	92	3315002750		chfsM6pETOWFPiM627jDpa:APA91bECOT1Dvki_lKhB7g2SLRA4IyrI9ISiDZACKVl7WqmwuHrkqjSiX0bMEHmUqp0tXjREgOEYhW6pWIY377Pux7UbxYP5j0dEGV0s6L0BrGmO3IK_0EU	-OBybzhceTrGJKyP6KKw	10|V0Xd5uIJOcZ7dVvtlfb5P9Lnkil1VTq4DgmhWv43ee8f5469	4	1	0	1731922200673b0918a0f4e.jpg	\N	3	0	\N	2024-11-18 09:34:51	2024-12-03 08:42:07	Usama	Shakeel	25.3762231	55.45927	0	0	0	0	0
41	CBU201733262209	baja ja	test21@gmail.com	\N	\N	971	484545454845	\N	abdhjef ekef kjwf wedfw	-ODDTbLLrtxxkJTGbKAu	31|QjcGUzos2Sm17ugGsgX4gmZcp6pgnE0ZgayKyjql90e0559f	3	1	0	\N	\N	3	0	\N	2024-12-03 21:43:29	2024-12-04 01:43:30	baja	ja	\N	\N	0	0	0	0	0
38	CBD71733053131	Anil Navis	anildriver@gmail.com	\N	\N	971	523243163	\N	c_jUDC0mTqOPR-a5KJSbae:APA91bEYVm3PKH46yg1XttPZP5M4_eNWFxYbe4GoYXVvpEMIwWgMH39lRV_m66qijjxJj1EP98GVc0K7e8Hqdb0hcUwORfW0q_lGWAosG0x_bHiRqbSaPsU	-OD14XR9O1EnPvZ5Lmdd	28|exYYCcWIAmU9FRa5XdVV5xMro6CpDOeUHXm4q2pweb6c4d64	4	1	0	1733053131674c4acb0b182.jpg	\N	3	0	\N	2024-12-01 11:58:29	2024-12-01 15:58:30	Anil	Navis	25.2869676	55.3714098	0	0	0	0	0
37	CBU21732996496	Jasonn Smith	k@kk.com	\N	\N	971	124124124	\N	c5rKR2v0RLqUzc4DrpgvB3:APA91bE2Z8R0_CgIevA95RXaLUYOb0aOC25DAaELZlgEaFeMahUwFdmwKfBqp3CShXHUKKc8uD4Q-PezDrcnQ9UZ_HHr7uYRHeSslKXZgG2G_AHOzfVtILU	-OCyczwIfNvyzhms7c5P	27|jXVtnxmn3ZGhiaPGWvkhwQ18iOLr3G3Ls59mDKeu0e37fd09	3	1	0	\N	\N	3	0	\N	2024-11-30 19:54:56	2024-12-02 07:21:57	Jasonn	Smith	\N	\N	0	0	0	0	0
40	CBD71733130930	Dxb Cabby Driver	dxbcabby@gmail.com	\N	\N	971	561660133	\N	cLAxXT1tSoCy6SZ-D7DMoP:APA91bFugvovy4SSm4YaNbcMLiA4NJgSpYGzxCor9MF7xGnfF92fmTmGx8-8TPj-rZ1tZRjfhg8i810JLlvXdn-d-kpbZ2PJnAbOrIA51c1Gz-ixB5oLvLc	-OD5gv7wRKMIPbGJ59l4	30|qjhGvixz8yrM7GXSZnGMAnNzMBfHhwL43GrY8E6T6de12a09	4	1	0	1733130930674d7ab22ea11.jpg	\N	3	0	\N	2024-12-02 09:29:03	2024-12-02 13:29:03	Dxb Cabby	Driver	25.3762658	55.4592429	0	0	0	0	0
39	CBD21733121316	Usama Shakeel	i@gmail.com	\N	\N	971	125125125		ey3zQAOkRR6JywQapz-9aA:APA91bFeeyk8gupYyLcE8OIO_rpGqKUUXvBioZZdXxlwSk6bjeKbN5WDk7rVTyUVv1aN5B6mWjBMPSrs14Dnz9nUm3BTMOcHCbMx93bX2wpRTECC1JnCGKI	-OD54Ts-Hkwlo6JsN3hw	29|Ceh3cwC2YqFbsAcWyPiJOWVz7G3ackCELHG0a0LMa448db23	4	1	0	1733121316674d552442231.jpg	\N	3	0	\N	2024-12-02 06:36:43	2024-12-03 14:58:29	Usama	Shakeel	33.6346709	73.0578167	0	0	0	0	0
\.


--
-- Data for Name: vehicle_makes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle_makes (id, name, image, status, created_at, updated_at, deleted_at) FROM stdin;
1	Honda City	1731556330673573ea47029.jpg	1	2024-11-13 11:12:15	2024-11-28 16:14:44	2024-11-28 16:14:44
3	Kia	17328622346749611ae99b4.jpg	1	2024-11-21 12:43:50	2024-11-29 10:37:14	\N
2	Toyota	1733053713674c4d119d10d.png	1	2024-11-13 11:12:21	2024-12-01 15:48:33	\N
4	Hundai	1733053788674c4d5cdbcd7.png	1	2024-12-01 15:49:48	2024-12-01 15:49:48	\N
5	Honda	1733053833674c4d89c30c8.png	1	2024-12-01 15:50:33	2024-12-01 15:50:33	\N
\.


--
-- Data for Name: vehicle_models; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle_models (id, name, vehicle_make_id, status, created_at, updated_at, deleted_at) FROM stdin;
2	m2	2	1	2024-11-13 11:16:11	2024-11-13 11:16:11	\N
1	2015	1	1	2024-11-13 11:16:03	2024-11-14 03:54:14	\N
3	asda	2	0	2024-11-14 03:54:29	2024-11-14 03:54:37	2024-11-14 03:54:37
4	2014-1111	3	1	2024-11-21 12:47:33	2024-11-21 12:47:49	\N
5	picnto	3	1	2024-11-22 08:45:11	2024-11-22 08:45:11	\N
6	Civic	5	1	2024-12-01 15:52:05	2024-12-01 15:52:05	\N
\.


--
-- Data for Name: vehicle_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle_types (id, "position", name, image, map_icon, status, created_at, updated_at, deleted_at) FROM stdin;
3	7	Electric	17315562066735736e11db9.jpg	17315562066735736e13fa5.png	1	2024-11-14 03:50:06	2024-11-14 03:51:36	2024-11-14 03:51:36
1	5	Electric	1733141762674da50285451.png	1733285944674fd8383ca45.png	1	2024-11-13 11:10:01	2024-12-04 08:19:04	\N
2	4	Comfort	1733141739674da4eb06fbb.png	1733286012674fd87c3dc45.png	1	2024-11-13 11:10:40	2024-12-04 08:20:12	\N
4	5	Executive	1733141622674da47625ebf.png	1733286029674fd88d4ef90.png	1	2024-11-21 12:39:31	2024-12-04 08:20:29	\N
5	6	Eco-friendly	1732957697674ad601df654.png	1733286046674fd89e48b94.png	1	2024-11-30 13:08:17	2024-12-04 08:20:46	\N
6	7	Premier	1732957742674ad62e22be6.png	1733286069674fd8b52952c.png	1	2024-11-30 13:09:02	2024-12-04 08:21:09	\N
8	10	Kids	1732957865674ad6a97398b.png	1733286087674fd8c70d55b.png	1	2024-11-30 13:11:05	2024-12-04 08:21:27	\N
7	9	Max	1732957808674ad67037c52.png	1733286104674fd8d883c59.png	1	2024-11-30 13:10:08	2024-12-04 08:21:44	\N
\.


--
-- Data for Name: wallet_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_histories (id, user_id, pay_type, amount, remark, created_at, updated_at) FROM stdin;
1	8	credit	404.2	cancellation refund for the booking #CB1732096058	2024-11-20 10:09:29	2024-11-20 10:09:29
2	15	credit	186	cancellation refund for the booking #CB1732103851	2024-11-20 11:57:40	2024-11-20 11:57:40
3	15	debit	45.4	used for the booking #CB1732177657	2024-11-21 08:27:38	2024-11-21 08:27:38
4	15	debit	140.6	used for the booking #CB1732517470	2024-11-25 06:51:11	2024-11-25 06:51:11
5	15	credit	46.4	cancellation refund for the booking #CB1732882725	2024-11-29 12:19:50	2024-11-29 12:19:50
6	15	debit	46.4	used for the booking #CB1732882978	2024-11-29 12:22:58	2024-11-29 12:22:58
7	15	credit	44.6	cancellation refund for the booking #CB1732947794	2024-11-30 06:24:37	2024-11-30 06:24:37
8	15	debit	44.6	used for the booking #CB1732947937	2024-11-30 06:25:37	2024-11-30 06:25:37
9	36	credit	186	cancellation refund for the booking #CB1733118143	2024-12-02 05:46:46	2024-12-02 05:46:46
10	36	debit	186	used for the booking #CB1733118424	2024-12-02 05:47:05	2024-12-02 05:47:05
11	36	credit	186	cancellation refund for the booking #CB1733118424	2024-12-02 05:54:00	2024-12-02 05:54:00
12	36	debit	186	used for the booking #CB1733118903	2024-12-02 05:55:04	2024-12-02 05:55:04
13	36	credit	100083.5	cancellation refund for the booking #CB1733118903	2024-12-02 05:55:26	2024-12-02 05:55:26
14	36	debit	186	used for the booking #CB1733118955	2024-12-02 05:55:55	2024-12-02 05:55:55
15	36	debit	186	used for the booking #CB1733118987	2024-12-02 05:56:28	2024-12-02 05:56:28
16	36	debit	83	used for the booking #CB1733120870	2024-12-02 06:27:50	2024-12-02 06:27:50
17	36	credit	83	cancellation refund for the booking #CB1733120870	2024-12-02 06:32:06	2024-12-02 06:32:06
18	36	debit	191.6	used for the booking #CB1733121151	2024-12-02 06:32:32	2024-12-02 06:32:32
19	15	credit	39.8	cancellation refund for the booking #CB1733150744	2024-12-02 14:47:06	2024-12-02 14:47:06
20	15	credit	34	cancellation refund for the booking #CB1733150601	2024-12-02 14:47:16	2024-12-02 14:47:16
21	15	credit	95652.4	cancellation refund for the booking #CB1732961965	2024-12-02 14:47:29	2024-12-02 14:47:29
22	15	debit	33.8	used for the booking #CB1733154839	2024-12-02 15:53:59	2024-12-02 15:53:59
23	15	debit	187.5	used for the booking #CB1733159748	2024-12-02 17:15:48	2024-12-02 17:15:48
24	15	debit	102.2	used for the booking #CB1733162596	2024-12-02 18:03:16	2024-12-02 18:03:16
25	15	credit	102.2	cancellation refund for the booking #CB1733162596	2024-12-02 18:04:37	2024-12-02 18:04:37
26	15	debit	30.2	used for the booking #CB1733163672	2024-12-02 18:21:13	2024-12-02 18:21:13
27	36	debit	728.8	used for the booking #CB1733215247	2024-12-03 08:40:48	2024-12-03 08:40:48
28	36	credit	728.8	cancellation refund for the booking #CB1733215247	2024-12-03 08:43:43	2024-12-03 08:43:43
29	36	debit	62.6	used for the booking #CB1733215475	2024-12-03 08:44:35	2024-12-03 08:44:35
30	15	debit	102.2	used for the booking #CB1733245088	2024-12-03 16:58:09	2024-12-03 16:58:09
31	15	debit	48	used for the booking #CB1733246167	2024-12-03 17:16:07	2024-12-03 17:16:07
\.


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 1, false);


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_id_seq', 88, true);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_id_seq', 2, true);


--
-- Name: complaints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.complaints_id_seq', 1, false);


--
-- Name: complaints_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.complaints_status_id_seq', 3, true);


--
-- Name: coupon_usages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_usages_id_seq', 1, false);


--
-- Name: discount_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discount_types_id_seq', 3, true);


--
-- Name: discounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discounts_id_seq', 3, true);


--
-- Name: driver_alloted_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.driver_alloted_orders_id_seq', 8323, true);


--
-- Name: driver_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.driver_details_id_seq', 13, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: location_suggestions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.location_suggestions_id_seq', 7, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 59, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pages_id_seq', 8, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 99, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 31, true);


--
-- Name: rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rates_id_seq', 4, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, false);


--
-- Name: temp_bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_bookings_id_seq', 95, true);


--
-- Name: temp_tip_amounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_tip_amounts_id_seq', 1, false);


--
-- Name: temp_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_users_id_seq', 51, true);


--
-- Name: tip_amounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tip_amounts_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 41, true);


--
-- Name: vehicle_makes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_makes_id_seq', 5, true);


--
-- Name: vehicle_models_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_models_id_seq', 6, true);


--
-- Name: vehicle_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_types_id_seq', 8, true);


--
-- Name: wallet_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_histories_id_seq', 31, true);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


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
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: complaints complaints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaints
    ADD CONSTRAINT complaints_pkey PRIMARY KEY (id);


--
-- Name: complaints_status complaints_status_code_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaints_status
    ADD CONSTRAINT complaints_status_code_unique UNIQUE (code);


--
-- Name: complaints_status complaints_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaints_status
    ADD CONSTRAINT complaints_status_pkey PRIMARY KEY (id);


--
-- Name: coupon_usages coupon_usages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_usages
    ADD CONSTRAINT coupon_usages_pkey PRIMARY KEY (id);


--
-- Name: discount_types discount_types_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_types
    ADD CONSTRAINT discount_types_name_unique UNIQUE (name);


--
-- Name: discount_types discount_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_types
    ADD CONSTRAINT discount_types_pkey PRIMARY KEY (id);


--
-- Name: discounts discounts_coupon_code_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_coupon_code_unique UNIQUE (coupon_code);


--
-- Name: discounts discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_pkey PRIMARY KEY (id);


--
-- Name: driver_alloted_orders driver_alloted_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_alloted_orders
    ADD CONSTRAINT driver_alloted_orders_pkey PRIMARY KEY (id);


--
-- Name: driver_details driver_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_details
    ADD CONSTRAINT driver_details_pkey PRIMARY KEY (id);


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
-- Name: location_suggestions location_suggestions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_suggestions
    ADD CONSTRAINT location_suggestions_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- Name: pages pages_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_identifier_unique UNIQUE (identifier);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: permissions permissions_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


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
-- Name: rates rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rates
    ADD CONSTRAINT rates_pkey PRIMARY KEY (id);


--
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- Name: roles roles_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: temp_bookings temp_bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_bookings
    ADD CONSTRAINT temp_bookings_pkey PRIMARY KEY (id);


--
-- Name: temp_tip_amounts temp_tip_amounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_tip_amounts
    ADD CONSTRAINT temp_tip_amounts_pkey PRIMARY KEY (id);


--
-- Name: temp_users temp_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users
    ADD CONSTRAINT temp_users_pkey PRIMARY KEY (id);


--
-- Name: tip_amounts tip_amounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tip_amounts
    ADD CONSTRAINT tip_amounts_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vehicle_makes vehicle_makes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_makes
    ADD CONSTRAINT vehicle_makes_pkey PRIMARY KEY (id);


--
-- Name: vehicle_models vehicle_models_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_models
    ADD CONSTRAINT vehicle_models_pkey PRIMARY KEY (id);


--
-- Name: vehicle_types vehicle_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_types
    ADD CONSTRAINT vehicle_types_pkey PRIMARY KEY (id);


--
-- Name: wallet_histories wallet_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_histories
    ADD CONSTRAINT wallet_histories_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);


--
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

