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

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


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
    is_scheduled integer DEFAULT 0 NOT NULL,
    rider_rating double precision DEFAULT '0'::double precision NOT NULL,
    is_rider_rated integer DEFAULT 0 NOT NULL,
    sur_charge double precision DEFAULT '0'::double precision NOT NULL,
    waiting_charge_per_min double precision DEFAULT '0'::double precision NOT NULL,
    waiting_charge double precision DEFAULT '0'::double precision NOT NULL,
    caby_commision_amount double precision DEFAULT '0'::double precision NOT NULL,
    caby_commission_amount double precision DEFAULT '0'::double precision NOT NULL,
    driver_amount_transfered double precision DEFAULT '0'::double precision NOT NULL
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
-- Name: driver_cancel_bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.driver_cancel_bookings (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    driver_id integer NOT NULL,
    reason_title character varying(255),
    reason text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.driver_cancel_bookings OWNER TO postgres;

--
-- Name: driver_cancel_bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.driver_cancel_bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.driver_cancel_bookings_id_seq OWNER TO postgres;

--
-- Name: driver_cancel_bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.driver_cancel_bookings_id_seq OWNED BY public.driver_cancel_bookings.id;


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
    updated_at timestamp(0) without time zone,
    target_order_count integer DEFAULT 10 NOT NULL,
    target_order_complete_amount double precision DEFAULT '0'::double precision NOT NULL
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
    is_scheduled integer DEFAULT 0 NOT NULL,
    sur_charge double precision DEFAULT '0'::double precision NOT NULL,
    waiting_charge_per_min double precision DEFAULT '0'::double precision NOT NULL,
    waiting_charge double precision DEFAULT '0'::double precision NOT NULL,
    caby_commission double precision DEFAULT '0'::double precision NOT NULL
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
    rated_users integer DEFAULT 0 NOT NULL,
    deleted_at timestamp(0) without time zone
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
-- Name: driver_cancel_bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_cancel_bookings ALTER COLUMN id SET DEFAULT nextval('public.driver_cancel_bookings_id_seq'::regclass);


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

COPY public.bookings (id, user_id, booking_status, booking_code, pickup_latitude, pickup_longitude, dropoff_latitude, dropoff_longitude, pickup_location_name, dropoff_location_name, vehicle_type_id, payment_type, base_fare, rta_commssion, rate_per_km, total_km_charge, total_charge, amount_to_pay, wallet_amount_used, rate_id, distance_km, needed_date, need_time, time_needed, currency_code, driver_instructions, friend_name, friend_phone_number, driver_id, driver_commission, caby_commission, salik, surcharge, city_crossing_fee, created_at, updated_at, cancell_title, cancell_reason, is_rated, overall_rating, driver_rating, refer_friend_rating, coupon_code, coupon_id, coupon_discount, is_scheduled, rider_rating, is_rider_rated, sur_charge, waiting_charge_per_min, waiting_charge, caby_commision_amount, caby_commission_amount, driver_amount_transfered) FROM stdin;
1	8	10	CB1732096058	25.2048	55.2708	25.2567	55.3643	dubai	dubai airport	2	2	15	10	20	379.2	404.2	404.2	0	2	18.96	2024-11-20	15:20:00	27 mins	AED	airport cehcking time to fast	sooraj	+919847823799	0	0	0	0	0	0	2024-11-20 09:47:45	2024-11-20 10:09:29	it took long time to find a caby	i dont want	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0	0
2	15	0	CB1732097390	25.1850084	55.2535499	25.1974379	55.2743373	Office Dubai - United Arab Emirates	Cafe Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-20	15:20:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-20 10:09:51	2024-11-20 10:09:51	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0	0
3	15	0	CB1732097788	25.1850084	55.2535499	25.1974379	55.2743373	Home Dubai - United Arab Emirates	Office Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-20	15:20:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-20 10:16:29	2024-11-20 10:16:29	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0	0
4	15	0	CB1732101522	25.1850084	55.2535499	25.1974379	55.2743373	Home Dubai - United Arab Emirates	Office Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-22	16:18:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-20 11:18:43	2024-11-20 11:18:43	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0	0
5	15	0	CB1732101609	25.1850084	55.2535499	25.1974379	55.2743373	Home Dubai - United Arab Emirates	Gym Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-22	16:19:00	13 mins	AED	Asd	Hamid	\N	0	0	0	0	0	0	2024-11-20 11:20:09	2024-11-20 11:20:09	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0	0
6	15	0	CB1732102486	25.1850084	55.2535499	25.1974379	55.2743373	Office Dubai - United Arab Emirates	Home Dubai - United Arab Emirates	1	2	10	5	15	120.75	135.75	135.75	0	1	8.05	2024-11-22	16:33:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-20 11:34:47	2024-11-20 11:34:47	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0	0
7	15	10	CB1732103851	25.1850084	55.2535499	25.1974379	55.2743373	Cafe Dubai - United Arab Emirates	Cafe Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-20	16:57:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-20 11:57:31	2024-11-20 11:57:40	I want to change my booking details	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0	0
8	15	0	CB1732177657	33.634669074391425	73.0578039586544	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	0	45.4	2	1.02	2024-11-21	13:27:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-21 08:27:38	2024-11-21 08:27:38	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0	0
9	15	10	CB1732517470	25.1850084	55.2535499	25.1974379	55.2743373	Cafe Dubai - United Arab Emirates	Cafe Dubai - United Arab Emirates	4	2	100000	3	10	80.5	100083.5	99942.9	140.6	3	8.05	2024-11-25	11:51:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 06:51:11	2024-11-25 07:07:33	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0	0
10	15	10	CB1732519366	33.6346727032931	73.0578026175499	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	12:22:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 07:22:47	2024-11-25 07:27:39	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0	0
11	15	0	CB1732519929	33.63467996109602	73.05779993534088	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	12:32:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 07:32:09	2024-11-25 07:34:51	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0	0
14	15	10	CB1732525768	33.63467409902449	73.05780798196793	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	14:09:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 09:09:28	2024-11-25 09:09:38	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0	0
12	15	10	CB1732520292	33.634659862563424	73.05780965834856	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	12:38:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 07:38:13	2024-11-25 07:39:04	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0	0
13	15	10	CB1732521015	33.634659862563424	73.05780965834856	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	12:50:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 07:50:16	2024-11-25 07:50:16	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0	0
15	15	10	CB1732527110	33.6346615374413	73.05781066417694	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	14:31:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 09:31:51	2024-11-25 09:32:42	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0	0
16	15	10	CB1732527295	33.6346615374413	73.05781066417694	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	14:34:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 09:34:55	2024-11-25 09:35:46	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0	0
17	15	10	CB1732527498	33.6346615374413	73.05781066417694	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	14:38:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 09:38:18	2024-11-25 09:39:09	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0	0
18	15	10	CB1732528194	33.6346615374413	73.05781066417694	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	14:49:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 09:49:54	2024-11-25 09:50:45	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0	0
19	15	10	CB1732529071	33.63466712036738	73.05780529975891	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	15:04:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 10:04:31	2024-11-25 10:05:22	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0	0
24	15	10	CB1732538637	33.634669074391425	73.0578089877963	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	17:43:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 12:43:57	2024-11-25 12:44:07	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
20	15	10	CB1732529481	33.63466097914867	73.05781099945307	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	15:11:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-25 10:11:21	2024-11-25 10:12:12	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	0	0
21	15	10	CB1732534960	33.6346615374413	73.05781066417694	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	16:42:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 11:42:41	2024-11-25 11:42:51	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
22	15	1	CB1732535066	33.6346615374413	73.05781066417694	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	16:44:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-25 11:44:26	2024-11-25 11:44:50	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
23	15	10	CB1732535171	33.6346615374413	73.05781066417694	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	16:46:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-25 11:46:12	2024-11-25 11:46:22	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
25	15	1	CB1732539257	33.634661816587624	73.05780798196793	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	17:54:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-25 12:54:18	2024-11-25 12:54:49	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
26	15	1	CB1732541309	33.634661816587624	73.05780798196793	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	18:28:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-25 13:28:29	2024-11-25 13:28:53	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
27	15	1	CB1732543054	33.634661816587624	73.05780798196793	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	18:57:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-25 13:57:34	2024-11-25 13:58:05	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
28	15	1	CB1732545728	33.63467186585427	73.05780496448278	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	19:42:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-25 14:42:09	2024-11-25 14:43:00	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
30	15	4	CB1732548079	33.63467437817075	73.05780060589314	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	20:21:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-25 15:21:20	2024-11-25 15:22:03	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
29	15	4	CB1732545881	33.63467437817075	73.05780060589314	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	19:44:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-25 14:44:41	2024-11-25 18:12:34	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
38	15	10	CB1732883513	25.1850084	55.2535499	25.1974379	55.2743373	Gym Dubai - United Arab Emirates	Home Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-29	17:31:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-29 12:31:53	2024-11-29 12:32:04	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
31	15	4	CB1732554411	33.63466097914867	73.05781435221434	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	45.4	0	2	1.02	2024-11-25	22:06:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-25 17:06:51	2024-11-25 17:07:54	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
32	8	10	CB1732594029	25.2048	55.2708	25.2567	55.3643	dubai	dubai airport	2	1	15	10	20	379.2	404.2	0	0	2	18.96	2024-11-26	15:20:00	27 mins	AED	airport cehcking time to fast	sooraj	+919847823799	0	0	0	0	0	0	2024-11-26 04:07:28	2024-11-26 04:07:38	\N	\N	0	0	0	0	FREERIDE	2	404.2	0	0	0	0	0	0	0	0	0
33	15	10	CB1732878677	25.1850084	55.2535499	25.1974379	55.2743373	Gym Dubai - United Arab Emirates	Gym Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-29	16:11:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-29 11:11:17	2024-11-29 11:11:27	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
34	15	10	CB1732878826	33.634678007072196	73.05780798196793	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	4	2	100000	3	10	10.7	100013.7	100013.7	0	3	1.07	2024-11-29	16:13:00	5 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-29 11:13:47	2024-11-29 11:13:57	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
35	15	10	CB1732881785	25.1850084	55.2535499	25.1974379	55.2743373	Office Dubai - United Arab Emirates	Gym Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-29	17:03:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-29 12:03:05	2024-11-29 12:03:16	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
36	15	10	CB1732882725	33.634676611340886	73.05780496448278	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	21.4	46.4	46.4	0	2	1.07	2024-11-29	17:18:00	5 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-29 12:18:46	2024-11-29 12:19:50	I booked by mistake	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
37	15	10	CB1732882978	25.1850084	55.2535499	25.1974379	55.2743373	Gym Dubai - United Arab Emirates	Gym Dubai - United Arab Emirates	2	2	15	10	20	161	186	139.6	46.4	2	8.05	2024-11-29	17:22:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-29 12:22:58	2024-11-29 12:23:09	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
39	15	1	CB1732884153	33.634664049758086	73.05781569331884	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	21.4	46.4	46.4	0	2	1.07	2024-11-29	17:42:00	5 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-29 12:42:34	2024-11-29 12:44:13	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
40	15	10	CB1732901944	25.1850084	55.2535499	25.1974379	55.2743373	Office Dubai - United Arab Emirates	Home Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-29	22:39:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-29 17:39:05	2024-11-29 17:39:15	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
41	15	10	CB1732902526	33.6346727032931	73.0578026175499	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	4	2	100000	3	10	10.7	100013.7	100013.7	0	3	1.07	2024-11-29	22:48:00	5 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-29 17:48:47	2024-11-29 17:48:57	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
42	15	1	CB1732902809	33.63467409902449	73.05780429393053	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	21.4	46.4	46.4	0	2	1.07	2024-11-29	22:53:00	5 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-29 17:53:29	2024-11-29 17:53:47	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
43	15	10	CB1732903874	25.1850084	55.2535499	25.1974379	55.2743373	Cafe Dubai - United Arab Emirates	Home Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-29	23:11:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-29 18:11:15	2024-11-29 18:11:25	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
44	15	10	CB1732947794	33.6354830611228	73.05731445550919	33.64079723396806	73.05805407464504	J3P4+7V5, Satellite Town, Rawalpindi, Punjab, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	19.6	44.6	44.6	0	2	0.98	2024-11-30	11:23:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 06:23:14	2024-11-30 06:24:37	I booked by mistake	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
45	15	4	CB1732947937	33.6354830611228	73.05731445550919	33.64079723396806	73.05805407464504	J3P4+7V5, Satellite Town, Rawalpindi, Punjab, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	19.6	44.6	0	44.6	2	0.98	2024-11-30	11:25:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-30 06:25:37	2024-11-30 06:29:32	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
77	15	10	CB1733162596	25.19062790693043	55.28373812701417	25.1974379	55.2743373	Malls Dubai Mall	Malls Test	2	2	15	10	20	77.2	102.2	0	102.2	2	3.86	2024-12-02	23:03:00	11 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 18:03:16	2024-12-02 18:04:37	I booked by mistake	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
46	15	2	CB1732950324	33.6346699118303	73.05780563503504	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	21.4	46.4	46.4	0	2	1.07	2024-11-30	12:05:00	5 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-30 07:05:25	2024-11-30 07:16:00	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
47	32	10	CB1732951911	25.286959374057723	55.37141393870115	25.325853631378898	55.418544709682465	11 8A St - Al Nahda - Al Nahda 2 - Dubai - United Arab Emirates,	8CG9+F5Q - Sheikh Khalifa Bin Zayed Al Nahyan Rd - Industrial Area 5 - Industrial Area - Sharjah - United Arab Emirates,	2	2	15	10	20	197.2	222.2	222.2	0	2	9.86	2024-11-30	11:31:00	17 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 07:31:52	2024-11-30 07:32:02	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
48	15	10	CB1732952324	25.1850084	55.2535499	25.1974379	55.2743373	Office Dubai - United Arab Emirates	Office Dubai - United Arab Emirates	4	2	100000	3	10	80.5	100083.5	100083.5	0	3	8.05	2024-11-30	12:38:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 07:38:45	2024-11-30 07:38:55	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
49	15	1	CB1732960406	33.634667399513674	73.05780697613955	33.64079723396806	73.05805407464504	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	21.4	46.4	46.4	0	2	1.07	2024-11-30	14:53:00	5 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-30 09:53:27	2024-11-30 09:53:47	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
50	15	4	CB1732960785	33.63466879524513	73.05780697613955	33.638027138774426	73.06838996708393	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	Commercial Market Rd, Block B Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	27	52	52	0	2	1.35	2024-11-30	14:59:00	5 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-30 09:59:46	2024-11-30 10:03:30	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
51	15	1	CB1732961066	33.63466879524513	73.05780697613955	33.638027138774426	73.06838996708393	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	Commercial Market Rd, Block B Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	27	52	52	0	2	1.35	2024-11-30	15:04:00	5 mins	AED	Asd	Hamid	\N	13	0	0	0	0	0	2024-11-30 10:04:27	2024-11-30 10:08:51	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
53	36	10	CB1732963522	33.64079723396806	73.05805407464504	33.63514362177493	73.05731445550919	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3P4+7V5, Satellite Town, Rawalpindi, Punjab, Pakistan,	1	2	10	5	15	15.15	30.15	30.15	0	1	1.01	2024-11-30	15:45:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 10:45:23	2024-11-30 10:45:33	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
55	36	1	CB1732964295	33.63553498182613	73.05768325924873	33.64079723396806	73.05805407464504	J3P4+7V5, Satellite Town, Rawalpindi, Punjab, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	18.6	43.6	43.6	0	2	0.93	2024-12-02	15:46:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-30 10:58:15	2024-11-30 11:00:39	\N	\N	0	0	0	0		0	0	1	0	0	0	0	0	0	0	0
54	36	4	CB1732963638	33.63553498182613	73.05768325924873	33.64079723396806	73.05805407464504	J3P4+7V5, Satellite Town, Rawalpindi, Punjab, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	18.6	43.6	43.6	0	2	0.93	2024-11-30	15:47:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-30 10:47:18	2024-11-30 10:53:39	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
56	36	10	CB1732965357	25.1850084	55.2535499	25.1974379	55.2743373	Cafe Dubai - United Arab Emirates	Home Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-30	16:15:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 11:15:58	2024-11-30 11:16:08	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
57	36	10	CB1732968054	25.385901327314215	55.459055453538895	25.348810416744495	55.42182303965092	105 Sheikh Jaber Al-Sabah St - Al Nuaimia 1 - Ajman - United Arab Emirates,	8CXC+CQ8 - Sheikh Rashid Bin Saqr Al Qasimi St - Dasman - Halwan - Sharjah - United Arab Emirates,	2	2	15	10	20	181.4	206.4	206.4	0	2	9.07	2024-11-30	16:00:00	11 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 12:00:55	2024-11-30 12:01:05	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
58	36	10	CB1732968118	25.37627319908674	55.45930255204439	25.266196982993428	55.4162011295557	9FG5+CP5 - Sheikh Zayed Street - Ajman Industrial 2 - Ajman - United Arab Emirates,	7C88+GF7 - Muhaisnah - Muhaisanah 2 - Dubai - United Arab Emirates,	2	2	15	10	20	429	454	454	0	2	21.45	2024-11-30	16:01:00	27 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 12:01:58	2024-11-30 12:02:09	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
59	36	10	CB1732968699	25.1850084	55.2535499	25.1974379	55.2743373	Home Dubai - United Arab Emirates	Cafe Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-30	16:11:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 12:11:40	2024-11-30 12:11:50	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
60	36	10	CB1732968755	25.1850084	55.2535499	25.1974379	55.2743373	Gym Dubai - United Arab Emirates	Cafe Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-30	16:12:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 12:12:37	2024-11-30 12:12:47	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
52	15	10	CB1732961965	33.63553498182613	73.05768325924873	25.1974379	55.2743373	J3P4+7V5, Satellite Town, Rawalpindi, Punjab, Pakistan,	Cafe Dubai - United Arab Emirates	2	2	15	10	20	95627.4	95652.4	95652.4	0	2	4781.37	2024-11-30	15:19:00	2 days 10 hours	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-30 10:19:25	2024-12-02 14:47:29	I booked by mistake	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
61	36	10	CB1732972258	25.181566652053196	55.271510034799576	25.197437749735975	55.2743374183774	57JC+JJC - Business Bay - Dubai - United Arab Emirates,	1 Sheikh Zayed Rd - Trade Centre - Trade Centre 1 - Dubai - United Arab Emirates,	2	2	15	10	20	84.2	109.2	109.2	0	2	4.21	2024-11-30	17:10:00	11 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 13:10:58	2024-11-30 13:11:09	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
62	36	10	CB1732972599	25.376234424515854	55.45929819345474	25.388707682994298	55.46567916870117	9FG5+CP5 - Sheikh Zayed Street - Ajman Industrial 2 - Ajman - United Arab Emirates,	9FG5+CP5 - Sheikh Zayed Street - Ajman Industrial 2 - Ajman - United Arab Emirates,	2	2	15	10	20	42	67	67	0	2	2.1	2024-11-30	17:16:00	6 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-11-30 13:16:40	2024-11-30 13:16:50	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
69	37	10	CB1733119218	33.634676611340886	73.05780228227377	33.6329712899292	73.06160531938076	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	32 Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab 46300, Pakistan,	1	2	10	5	15	9.75	24.75	24.75	0	1	0.65	2024-12-02	11:00:00	3 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 06:00:18	2024-12-02 06:00:28	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
74	15	10	CB1733150744	33.63840313334286	73.05573832243681	33.63469363926134	73.05780965834856	J3Q4+692, New Phagwari Rd, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	2	2	15	10	20	14.8	39.8	39.8	0	2	0.74	2024-12-02	19:45:00	3 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 14:45:45	2024-12-02 14:47:06	I booked by mistake	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
63	36	4	CB1732972734	25.1850084	55.2535499	25.1974379	55.2743373	Office Dubai - United Arab Emirates	Office Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-11-30	17:18:00	13 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-11-30 13:18:54	2024-11-30 13:21:30	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
64	36	10	CB1733118143	25.1850084	55.2535499	25.1974379	55.2743373	Cafe Dubai - United Arab Emirates	Gym Dubai - United Arab Emirates	2	2	15	10	20	161	186	186	0	2	8.05	2024-12-02	09:42:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 05:42:24	2024-12-02 05:46:46	It took too long to find a Cabby	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
65	36	10	CB1733118424	25.1850084	55.2535499	25.1974379	55.2743373	Gym Dubai - United Arab Emirates	Home Dubai - United Arab Emirates	2	2	15	10	20	161	186	0	186	2	8.05	2024-12-02	09:47:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 05:47:05	2024-12-02 05:54:00	It took too long to find a Cabby	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
66	36	10	CB1733118903	25.1850084	55.2535499	25.1974379	55.2743373	Office Dubai - United Arab Emirates	Gym Dubai - United Arab Emirates	4	2	100000	3	10	80.5	100083.5	99897.5	186	3	8.05	2024-12-02	09:55:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 05:55:04	2024-12-02 05:55:26	I don’t need a ride anymore	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
67	36	0	CB1733118955	25.1850084	55.2535499	25.1974379	55.2743373	Home Dubai - United Arab Emirates	Cafe Dubai - United Arab Emirates	2	2	15	10	20	161	186	0	186	2	8.05	2024-12-02	09:55:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 05:55:55	2024-12-02 05:55:55	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
68	36	0	CB1733118987	25.1850084	55.2535499	25.1974379	55.2743373	Office Dubai - United Arab Emirates	Cafe Dubai - United Arab Emirates	2	2	15	10	20	161	186	0	186	2	8.05	2024-12-02	09:56:00	13 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 05:56:28	2024-12-02 05:56:28	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
71	36	10	CB1733120870	25.38585316586487	55.459599271416664	25.378262802548825	55.47303479164839	9FP5+8Q9 Footover Bridge - Al Nuaimia 1 - Ajman - United Arab Emirates,	9FHF+954 - Hassan Bin Haitham St - Ajman Industrial 2 - Ajman - United Arab Emirates,	2	2	15	10	20	58	83	0	83	2	2.9	2024-12-02	10:27:00	7 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 06:27:50	2024-12-02 06:32:06	I want to change my booking details	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
72	36	4	CB1733121151	25.376261990813617	55.45930255204439	25.36187001325	55.45109063386917	9FG5+CP5 - Sheikh Zayed Street - Ajman Industrial 2 - Ajman - United Arab Emirates,	13 35 St - Al Ramtha - Wasit Suburb - Sharjah - United Arab Emirates,	2	2	15	10	20	166.6	191.6	0	191.6	2	8.33	2024-12-02	10:32:00	11 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-12-02 06:32:32	2024-12-02 06:37:56	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
70	37	4	CB1733119276	33.63467884451097	73.05779121816158	33.63388159911073	73.05971100926399	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	5.2	30.2	30.2	0	2	0.26	2024-12-02	11:01:00	1 min	AED	\N	\N	\N	13	0	0	0	0	0	2024-12-02 06:01:16	2024-12-02 06:34:34	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
73	15	10	CB1733150601	33.634660141709716	73.05781401693821	33.63288307791791	73.0602440983057	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3M6+538, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	9	34	34	0	2	0.45	2024-12-02	19:43:00	2 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 14:43:21	2024-12-02 14:47:16	I booked by mistake	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
76	15	10	CB1733159748	25.1945448	55.3641298	25.1974379	55.2743373	Business Centers Office2	Business Centers Office2	1	2	10	5	15	172.5	187.5	0	187.5	1	11.5	2024-12-02	22:15:00	16 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-02 17:15:48	2024-12-02 17:15:58	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
79	36	10	CB1733215247	25.37620867577051	55.459246560931206	25.1974379	55.2743373	9FG5+CP5 - Sheikh Zayed Street - Ajman Industrial 2 - Ajman - United Arab Emirates,	Business Centers Office2	2	2	15	10	20	703.8	728.8	0	728.8	2	35.19	2024-12-03	12:40:00	35 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-03 08:40:48	2024-12-03 08:43:43	I want to change my booking details	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
87	31	0	CB1733248328	25.19062790693043	55.28373812701417	25.118107	55.200608	Dubai Mall	Mall of the Emirates	2	2	15	10	20	340.4	365.4	365.4	0	2	17.02	2024-12-07	22:51:00	20 mins	AED	\N	Sheraz Team	+923455591870	0	0	0	0	0	0	2024-12-03 17:52:08	2024-12-03 17:52:08	\N	\N	0	0	0	0		0	0	1	0	0	0	0	0	0	0	0
88	31	0	CB1733257202	25.19062790693043	55.28373812701417	25.277025957740072	55.28672218322754	Dubai Mall	Marina	2	2	15	10	20	352.2	377.2	377.2	0	2	17.61	2024-12-05	13:19:00	24 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-03 20:20:02	2024-12-03 20:20:02	\N	\N	0	0	0	0		0	0	1	0	0	0	0	0	0	0	0
80	36	4	CB1733215475	25.376243815233394	55.459249913692474	25.387025694809896	55.46674903482199	9FG5+CP5 - Sheikh Zayed Street - Ajman Industrial 2 - Ajman - United Arab Emirates,	9FP8+WMC - Al Nuaimia 1 - Ajman - United Arab Emirates,	2	2	15	10	20	37.6	62.6	0	62.6	2	1.88	2024-12-03	12:44:00	5 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-12-03 08:44:35	2024-12-03 08:46:32	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
81	31	0	CB1733239880	25.2048	55.2708	25.2567	55.3643	dubai	dubai airport	2	1	15	10	20	379.2	404.2	404.2	0	2	18.96	2024-12-03	15:20:00	28 mins	AED	airport cehcking time to fast	sooraj	+919847823799	0	0	0	0	0	0	2024-12-03 15:36:22	2024-12-03 15:36:22	\N	\N	0	0	0	0	FREERIDE	0	0	1	0	0	0	0	0	0	0	0
82	31	0	CB1733240873	25.19062790693043	55.28373812701417	25.118107	55.200608	Dubai Mall	Mall of the Emirates	2	2	15	10	20	340.4	365.4	365.4	0	2	17.02	2024-12-03	15:20:00	20 mins	AED	\N	Faizan	03315026163	0	0	0	0	0	0	2024-12-03 15:47:54	2024-12-03 15:47:54	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
83	31	0	CB1733242533	25.19062790693043	55.28373812701417	25.118107	55.200608	Dubai Mall	Mall of the Emirates	2	2	15	10	20	340.4	365.4	365.4	0	2	17.02	2024-12-03	21:15:00	20 mins	AED	\N	Sheraz Team	+923455591870	0	0	0	0	0	0	2024-12-03 16:15:33	2024-12-03 16:15:33	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
84	15	0	CB1733245088	25.19062790693043	55.28373812701417	25.1974379	55.2743373	Malls Dubai Mall	Malls Test	2	2	15	10	20	77.2	102.2	0	102.2	2	3.86	2024-12-03	21:58:00	11 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-03 16:58:09	2024-12-03 16:58:09	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
78	15	4	CB1733163672	33.63466879524513	73.05781066417694	33.633857592307045	73.05961310863495	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3M5+GPG, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	5.2	30.2	0	30.2	2	0.26	2024-12-02	23:21:00	1 min	AED	\N	\N	\N	39	0	0	0	0	0	2024-12-02 18:21:13	2024-12-06 07:04:59	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
86	31	0	CB1733248249	25.19062790693043	55.28373812701417	25.118107	55.200608	Dubai Mall	Mall of the Emirates	2	2	15	10	20	340.4	365.4	365.4	0	2	17.02	2024-12-07	22:50:00	20 mins	AED	\N	Sheraz Team	+923455591870	0	0	0	0	0	0	2024-12-03 17:50:49	2024-12-03 17:50:49	\N	\N	0	0	0	0		0	0	1	0	0	0	0	0	0	0	0
91	37	10	CB1733294599	25.18426912008268	55.26003755629063	25.187093191258324	55.27719262987375	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	57PG+RR - Downtown Dubai - South Ridge - Dubai - United Arab Emirates,	2	2	15	10	20	46.8	71.8	71.8	0	2	2.34	2024-12-04	10:43:00	7 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-04 06:43:19	2024-12-04 06:44:24	It took too long to find a Cabby	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
90	36	1	CB1733294569	25.184165474937046	55.26030644012625	25.184165969791803	55.26030664046392	57M6+P43 - Business Bay - Dubai - United Arab Emirates	57M6+P43 - Business Bay - Dubai - United Arab Emirates	2	2	15	10	20	0	25	25	0	2	0	2024-12-04	10:42:00	1 min	AED	\N	\N	\N	13	0	0	0	0	0	2024-12-04 06:42:49	2024-12-04 07:10:21	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
92	37	4	CB1733296140	25.18426517580341	55.26003856211901	25.169137015494755	55.25688428431749	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	52 13D St - Al Quoz - Al Quoz 1 - Dubai - United Arab Emirates,	2	2	15	10	20	91.2	116.2	44.4	71.8	2	4.56	2024-12-04	11:08:00	9 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-12-04 07:09:01	2024-12-04 07:11:32	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
89	37	3	CB1733294516	25.18426274855458	55.26004023849964	25.186910544887596	55.27877278625965	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	Tower 5 - Downtown Dubai - South Ridge - Dubai - United Arab Emirates,	2	2	15	10	20	49	74	74	0	2	2.45	2024-12-04	10:41:00	8 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-12-04 06:41:57	2024-12-04 07:19:08	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
93	37	4	CB1733296642	25.18427033370703	55.26002984493971	25.15368255591441	55.25115843862295	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	5732+8GJ - Al Quoz - Al Quoz 4 - Dubai - United Arab Emirates,	2	2	15	10	20	133.8	158.8	158.8	0	2	6.69	2024-12-04	11:17:00	13 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-12-04 07:17:22	2024-12-04 07:20:04	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
85	15	4	CB1733246167	33.64205943440809	73.06337255984545	33.64079723396806	73.05805407464504	J3R7+XJ2, Saidpur Rd, D Block Block D Satellite Town, Rawalpindi, Punjab, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	23	48	0	48	2	1.15	2024-12-03	22:16:00	4 mins	AED	\N	\N	\N	39	0	0	0	0	0	2024-12-03 17:16:07	2024-12-04 09:30:00	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
94	36	2	CB1733298038	25.186836818783288	55.26516024023295	25.197088869949003	55.27286924421787	Business Bay, Burlington Tower - Office 304 - Business Bay - Dubai - United Arab Emirates	Burj Khalifa - Shop - 02 Level - 84 Souk Al Bahar Bridge - Downtown Dubai - Dubai - United Arab Emirates	2	2	15	10	20	46	71	71	0	2	2.3	2024-12-04	11:40:00	8 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-12-04 07:40:38	2024-12-04 07:42:10	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
95	36	1	CB1733298149	25.186836818783288	55.26516024023295	25.197088869949003	55.27286924421787	Business Bay, Burlington Tower - Office 304 - Business Bay - Dubai - United Arab Emirates	Burj Khalifa - Shop - 02 Level - 84 Souk Al Bahar Bridge - Downtown Dubai - Dubai - United Arab Emirates	2	2	15	10	20	46	71	71	0	2	2.3	2024-12-04	11:42:00	8 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-12-04 07:42:29	2024-12-04 07:42:53	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
96	42	10	CB1733299208	25.186805568610406	55.26386775076389	25.19336034441722	55.271247178316116	57P7+PG Dubai - United Arab Emirates	57VC+9FP - Downtown Dubai - Dubai - United Arab Emirates	1	2	10	5	15	22.8	37.8	37.8	0	1	1.52	2024-12-04	12:00:00	5 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-04 08:00:09	2024-12-04 08:00:19	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
97	36	10	CB1733299445	25.184163651256767	55.260314472613516	25.167154904735245	55.25646921247243	57M6+P43 - Business Bay - Dubai - United Arab Emirates	23 40 B Street - Al Quoz - Al Quoz 1 - Dubai - United Arab Emirates	1	2	10	5	15	70.95	85.95	85.95	0	1	4.73	2024-12-04	12:04:00	10 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-04 08:04:06	2024-12-04 08:04:16	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
98	23	0	CB1733302615	25.273610949596716	55.31659126281738	25.1974379	55.2743373	Malls Burj Nahar Mall	Malls Mall of the Emirates	2	2	15	10	20	269.2	294.2	294.2	0	2	13.46	2024-12-04	14:26:00	22 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-04 08:56:55	2024-12-04 08:56:55	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
99	23	0	CB1733303075	25.118107	55.200608	25.1974379	55.2743373	Malls Mall of the Emirates	Malls Burj Nahar Mall	2	2	15	10	20	333.8	358.8	358.8	0	2	16.69	2024-12-04	14:34:00	21 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-04 09:04:35	2024-12-04 09:04:35	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
104	15	10	CB1733328113	33.63663200872374	73.06263830512762	33.62972860168015	73.06129418313503	J3P7+M33, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3H6+RFW, Punjab, Scheme 1 Block E Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	22.4	47.4	0	47.4	2	1.12	2024-12-04	21:01:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-04 16:01:54	2024-12-04 16:02:28	I booked by mistake	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
100	15	4	CB1733307377	33.638519532219455	73.06308321654797	33.629119188221686	73.06187756359577	6 Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3H6+JMG, Saidpur Rd, Block E Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	33.4	58.4	0	58.4	2	1.67	2024-12-04	15:16:00	5 mins	AED	\N	\N	\N	39	0	0	0	0	0	2024-12-04 10:16:18	2024-12-04 12:04:28	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
102	46	0	CB1733327595	25.273610949596716	55.31659126281738	25.118107	55.200608	Burj Nahar Mall	Mall of the Emirates	2	2	15	10	20	493.4	518.4	518.4	0	2	24.67	2024-12-04	20:53:00	28 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-04 15:53:16	2024-12-04 15:53:16	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
101	15	4	CB1733315708	33.63914423141573	73.06294675916433	33.631569378223105	73.06209482252598	J3Q7+M59, Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	279 Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	33.6	58.6	0	58.6	2	1.68	2024-12-04	17:35:00	5 mins	AED	\N	\N	\N	39	0	0	0	0	0	2024-12-04 12:35:09	2024-12-04 15:53:58	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
103	15	10	CB1733327924	33.63716013984488	73.06289076805115	33.62943436411252	73.06257661432028	23-32 Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3H6+QR3, Saidpur Rd, Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	21.4	46.4	0	46.4	2	1.07	2024-12-04	20:58:00	3 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-04 15:58:45	2024-12-04 16:01:05	I booked by mistake	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
105	15	10	CB1733328189	33.63816000712426	73.06321531534195	33.62303905490406	73.06242372840643	J3Q7+78M, D Block Block D Satellite Town, Rawalpindi, Punjab, Pakistan,	Kartarpura Rd, J3F6+5XR, Main Kartarpura Bazar, Kartarpura, Kartar Pura, Rawalpindi, Punjab 46000, Pakistan,	2	2	15	10	20	37	62	0	62	2	1.85	2024-12-04	21:03:00	7 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-04 16:03:09	2024-12-04 16:04:20	I want to change my booking details	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
107	36	10	CB1733328511	33.64115507330067	73.06328639388084	33.63149205188356	73.06217361241579	J3R7+F9C, New Katarian Satellite Town, Rawalpindi, Punjab, Pakistan,	761 Saidpur Rd, Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	28.6	53.6	0	53.6	2	1.43	2024-12-04	21:08:00	5 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-04 16:08:31	2024-12-04 16:09:51	I want to change my booking details	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
106	15	10	CB1733328286	33.6390900798328	73.06301549077034	33.63274154769835	73.06269161403179	J3Q7+M59, Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3M7+52R, Asghar Mall Scheme, Rawalpindi, Punjab 46300, Pakistan,	2	2	15	10	20	24	49	0	49	2	1.2	2024-12-04	21:04:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-04 16:04:47	2024-12-05 18:18:28	I want to change my booking details	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
109	46	0	CB1733332097	25.19062790693043	55.28373812701417	25.118107	55.200608	Dubai Mall	Mall of the Emirates	2	2	15	10	20	340.4	365.4	365.4	0	2	17.02	2024-12-04	22:08:00	20 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-04 17:08:18	2024-12-04 17:08:18	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
113	36	10	CB1733333307	33.63924667271914	73.06272245943546	33.62929031575278	73.06152116507292	Main Saidpur Rd, near Askari Bank, opposite Royal Mansion Wedding Hall, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3H6+VM4, Saidpur Rd, Block E Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	37.4	62.4	0	62.4	2	1.87	2024-12-04	22:28:00	6 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-04 17:28:28	2024-12-04 17:29:41	I found another ride	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
108	36	4	CB1733328665	33.6379858267247	73.06435458362103	33.6319442843653	73.06232213973999	J3Q7+6V4, D Block Block D Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	Office No.1, First Floor at Building No, NW-800 Saidpur Rd, opposite Rasheed Nursing Home, Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	16	41	0	41	2	0.8	2024-12-04	21:11:00	3 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-12-04 16:11:06	2024-12-04 17:14:51	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
110	46	0	CB1733332686	25.19062790693043	55.28373812701417	25.118107	55.200608	Dubai Mall	Mall of the Emirates	2	2	15	10	20	340.4	365.4	365.4	0	2	17.02	2024-12-04	22:18:00	20 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-04 17:18:06	2024-12-04 17:18:06	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
118	46	0	CB1733342604	25.273610949596716	55.31659126281738	25.19062790693043	55.28373812701417	Burj Nahar Mall	Dubai Mall	2	2	15	10	20	364.6	389.6	389.6	0	2	18.23	2024-12-05	13:03:00	24 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-04 20:03:25	2024-12-04 20:03:25	\N	\N	0	0	0	0		0	0	1	0	0	0	0	0	0	0	0
119	46	0	CB1733343846	25.273610949596716	55.31659126281738	25.19062790693043	55.28373812701417	Burj Nahar Mall	Dubai Mall	2	2	15	10	20	364.6	389.6	389.6	0	2	18.23	2024-12-06	13:23:00	24 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-04 20:24:06	2024-12-04 20:24:06	\N	\N	0	0	0	0		0	0	1	0	0	0	0	0	0	0	0
111	36	4	CB1733332885	33.637223225058214	73.06312948465347	33.630144552504156	73.06161638349295	J3P7+V76, Saidpur Rd, Block B Satellite Town, Rawalpindi, Punjab, Pakistan,	J3J6+3HG, Block E Asghar Mall Scheme, Rawalpindi, Punjab 46000, Pakistan,	2	2	15	10	20	16.8	41.8	0	41.8	2	0.84	2024-12-04	22:21:00	2 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-12-04 17:21:26	2024-12-04 17:27:11	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
112	36	10	CB1733333250	33.637223225058214	73.06312948465347	33.630144552504156	73.06161638349295	J3P7+V76, Saidpur Rd, Block B Satellite Town, Rawalpindi, Punjab, Pakistan,	J3J6+3HG, Block E Asghar Mall Scheme, Rawalpindi, Punjab 46000, Pakistan,	2	2	15	10	20	16.8	41.8	0	41.8	2	0.84	2024-12-04	22:27:00	2 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-04 17:27:30	2024-12-04 17:28:09	I found another ride	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
114	36	4	CB1733333441	33.640238979309395	73.06315463036299	33.63347208678724	73.06258298456669	J3R7+37J, Saidpur Rd, Block D Satellite Town, Rawalpindi, Punjab, Pakistan,	15 Saidpur Rd, Block B Satellite Town, Rawalpindi, Punjab 46300, Pakistan,	2	2	15	10	20	19.8	44.8	0	44.8	2	0.99	2024-12-04	22:30:00	3 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-12-04 17:30:42	2024-12-04 17:32:24	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
115	36	10	CB1733333764	33.63925727971361	73.06286998093128	33.63235966618235	73.06218668818474	Main Saidpur Rd, near Askari Bank, opposite Royal Mansion Wedding Hall, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	Siraj Plaza, Second Floor, office # B8, Main Saidpur Rd, Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	28.2	53.2	0	53.2	2	1.41	2024-12-04	22:36:00	5 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-04 17:36:05	2024-12-04 17:37:30	I want to change my booking details	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
120	46	0	CB1733344207	25.273610949596716	55.31659126281738	25.19062790693043	55.28373812701417	Burj Nahar Mall	Dubai Mall	2	2	15	10	20	364.6	389.6	389.6	0	2	18.23	2024-12-06	13:29:00	24 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-04 20:30:07	2024-12-04 20:30:07	\N	\N	0	0	0	0		0	0	1	0	0	0	0	0	0	0	0
116	36	4	CB1733333867	33.6388784975483	73.06264668703079	33.629374902318794	73.06192986667156	5 Saidpur Rd, MPCHS Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3H6+QR3, Saidpur Rd, Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	33	58	0	58	2	1.65	2024-12-04	22:37:00	5 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-12-04 17:37:48	2024-12-04 17:42:52	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
117	46	0	CB1733342467	25.273610949596716	55.31659126281738	25.19062790693043	55.28373812701417	Burj Nahar Mall	Dubai Mall	2	2	15	10	20	364.6	389.6	389.6	0	2	18.23	2024-12-06	12:00:00	24 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-04 20:01:08	2024-12-04 20:01:08	\N	\N	0	0	0	0		0	0	1	0	0	0	0	0	0	0	0
121	46	0	CB1733344404	25.273610949596716	55.31659126281738	25.19062790693043	55.28373812701417	Burj Nahar Mall	Dubai Mall	2	2	15	10	20	364.6	389.6	389.6	0	2	18.23	2024-12-06	13:33:00	24 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-04 20:33:24	2024-12-04 20:33:24	\N	\N	0	0	0	0		0	0	1	0	0	0	0	0	0	0	0
122	36	10	CB1733379686	33.63901080632007	73.06313149631023	33.63125811834705	73.0622148513794	J3Q7+M59, Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	793 Saidpur Rd, Asghar Mall Scheme, Rawalpindi, Punjab 46000, Pakistan,	2	2	15	10	20	27.6	52.6	0	52.6	2	1.38	2024-12-05	11:21:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-05 06:21:26	2024-12-05 06:21:37	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
123	36	10	CB1733379762	33.63803160494076	73.06312814354897	33.64079723396806	73.05805407464504	J3Q7+78M, D Block Block D Satellite Town, Rawalpindi, Punjab, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	21.8	46.8	0	46.8	2	1.09	2024-12-05	11:22:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-05 06:22:42	2024-12-05 06:22:52	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
124	15	10	CB1733379912	33.63955539155042	73.06321263313293	33.63122657356139	73.06295983493328	32 Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	797 Saidpur Rd, Asghar Mall Scheme, Rawalpindi, Punjab 46000, Pakistan,	2	2	15	10	20	27	52	0	52	2	1.35	2024-12-05	11:25:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-05 06:25:13	2024-12-05 06:25:23	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
125	15	10	CB1733380122	33.639753853071745	73.06295178830624	33.63210005278143	73.06198686361313	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3J6+RMC, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	26.4	51.4	0	51.4	2	1.32	2024-12-05	11:28:00	4 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-05 06:28:43	2024-12-05 06:30:00	I found another ride	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
126	36	10	CB1733380322	33.63815693663949	73.06286662817001	33.63114980522951	73.06206431239843	32 Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3J6+CQ8, Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	34.8	59.8	0	59.8	2	1.74	2024-12-05	11:32:00	5 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-05 06:32:02	2024-12-05 06:32:38	It took too long to find a Cabby	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
128	36	10	CB1733387254	25.184535510340258	55.2726985886693	25.169510250750005	55.256534926593304	Business Bay Office Tower - Business Bay - Dubai - United Arab Emirates,	47 13D St - Al Quoz - Al Quoz 1 - Dubai - United Arab Emirates,	2	2	15	10	20	120.8	145.8	0	145.8	2	6.04	2024-12-05	12:27:00	11 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-05 08:27:34	2024-12-05 08:28:25	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
129	36	10	CB1733387387	25.18429005510123	55.260035544633865	25.169939014718487	55.25639310479164	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	20 36A Street - Al Quoz - Al Quoz 1 - Dubai - United Arab Emirates,	2	2	15	10	20	93.4	118.4	0	118.4	2	4.67	2024-12-05	12:29:00	9 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-05 08:29:48	2024-12-05 08:29:58	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
130	36	10	CB1733387462	25.18429005510123	55.260035544633865	25.169939014718487	55.25639310479164	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	20 36A Street - Al Quoz - Al Quoz 1 - Dubai - United Arab Emirates,	2	2	15	10	20	93.4	118.4	0	118.4	2	4.67	2024-12-05	12:31:00	9 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-05 08:31:02	2024-12-05 08:31:12	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
132	47	10	CB1733389051	25.184250308903508	55.260045267641544	25.15648123676931	55.2682001888752	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	5749+PC4 - Al Quoz - Ghadeer Al Tair - Dubai - United Arab Emirates,	2	2	15	10	20	127.4	152.4	152.4	0	2	6.37	2024-12-05	12:57:00	10 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-05 08:57:31	2024-12-05 08:57:41	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
127	36	4	CB1733381984	33.638940744105504	73.0632870644331	33.63116125069423	73.06197881698608	J3Q7+GC2, Younus Mir St, D Block Block D Satellite Town, Rawalpindi, Punjab, Pakistan,	J3J6+CQ8, Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	22.6	47.6	0	47.6	2	1.13	2024-12-05	11:59:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-12-05 06:59:45	2024-12-05 08:48:38	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
131	47	10	CB1733388958	25.18425152252806	55.26003822684288	25.15792789470882	55.26721280068159	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	5758+6J7 - Al Quoz - Ghadeer Al Tair - Dubai - United Arab Emirates,	2	2	15	10	20	118.6	143.6	143.6	0	2	5.93	2024-12-05	12:55:00	9 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-05 08:55:58	2024-12-05 08:56:49	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
133	47	10	CB1733389194	25.184250308903508	55.260045267641544	25.15648123676931	55.2682001888752	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	5749+PC4 - Al Quoz - Ghadeer Al Tair - Dubai - United Arab Emirates,	2	2	15	10	20	127.4	152.4	152.4	0	2	6.37	2024-12-05	12:59:00	10 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-05 08:59:54	2024-12-05 09:00:04	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
134	23	10	CB1733389467	25.273610949596716	55.31659126281738	25.1974379	55.2743373	Malls Burj Nahar Mall	Malls Test	2	2	15	10	20	269.2	294.2	294.2	0	2	13.46	2024-12-05	14:34:00	22 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-05 09:04:28	2024-12-05 09:04:38	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
135	36	10	CB1733389971	33.63979376862487	73.06286696344614	33.6298500371954	73.06232750415802	J3Q7+X5C, Holy Family Rd, Block F Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3H6+XWP, Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	30.6	55.6	0	55.6	2	1.53	2024-12-05	14:12:00	5 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-05 09:12:52	2024-12-05 09:13:02	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
136	36	10	CB1733393339	33.63827249844506	73.06333065032959	33.628060590783335	73.06140549480915	J3Q7+883, Block D Satellite Town, Rawalpindi, Punjab, Pakistan,	J3H6+6MC, Asghar Mall Rd, Block E Pir Choha Mohalla, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	23.8	48.8	0	48.8	2	1.19	2024-12-05	15:08:00	3 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-05 10:09:00	2024-12-05 10:09:51	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
137	47	10	CB1733393827	25.184250308903508	55.260045267641544	25.15648123676931	55.2682001888752	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	5749+PC4 - Al Quoz - Ghadeer Al Tair - Dubai - United Arab Emirates,	2	2	15	10	20	127.4	152.4	152.4	0	2	6.37	2024-12-05	14:17:00	10 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-05 10:17:08	2024-12-05 10:17:59	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
139	47	10	CB1733394554	25.184250308903508	55.260045267641544	25.15648123676931	55.2682001888752	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	5749+PC4 - Al Quoz - Ghadeer Al Tair - Dubai - United Arab Emirates,	2	2	15	10	20	127.4	152.4	152.4	0	2	6.37	2024-12-05	14:29:00	10 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-05 10:29:14	2024-12-05 10:29:25	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
143	36	10	CB1733398158	33.63798191882708	73.06286964565516	33.64079723396806	73.05805407464504	S#04, 2nd Floor E-8 Markaz Plaza, Haidri chowk, Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	24	49	0	49	2	1.2	2024-12-05	16:29:00	4 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-05 11:29:18	2024-12-05 11:29:28	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
140	47	10	CB1733395658	25.184250308903508	55.260045267641544	25.15648123676931	55.2682001888752	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	5749+PC4 - Al Quoz - Ghadeer Al Tair - Dubai - United Arab Emirates,	1	2	10	5	15	95.55	110.55	110.55	0	1	6.37	2024-12-05	14:47:00	10 mins	AED	\N	\N	\N	0	0	0	0	0	0	2024-12-05 10:47:38	2024-12-05 10:48:29	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
138	36	4	CB1733394176	33.63900299061769	73.06300610303879	33.64079723396806	73.05805407464504	J3Q7+M59, Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	21.8	46.8	0	46.8	2	1.09	2024-12-05	15:22:00	4 mins	AED	\N	\N	\N	13	0	0	0	0	0	2024-12-05 10:22:57	2024-12-05 11:15:56	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
141	36	10	CB1733397798	33.6380977600027	73.06303963065147	33.62920126247967	73.06183867156506	19 Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3H6+JMG, Saidpur Rd, Block E Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	39.8	64.8	0	64.8	2	1.99	2024-12-05	16:23:00	6 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-05 11:23:19	2024-12-05 11:23:29	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
142	23	10	CB1733397799	9.864847336240025	76.63740567862988	9.864346902660776	76.69013556092978	VJ7P+CWV, Kannadikandam-Randuthengu Rd, Kannadikandam, Vazhithala, Kerala 685583, India,	Parakadavu Rd, Karimkunnam, Karimkunnam part, Kerala 685608, India,	2	2	15	10	20	248.6	273.6	273.6	0	2	12.43	2024-12-05	16:53:00	21 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-05 11:23:19	2024-12-05 11:24:10	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
144	36	10	CB1733398254	33.63804444516773	73.0631247907877	33.628271362143835	73.06203816086054	19 Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3H6+8RX, Saidpur Rd, Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	21.8	46.8	0	46.8	2	1.09	2024-12-05	16:30:00	3 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-05 11:30:55	2024-12-05 11:31:05	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
145	36	10	CB1733401306	25.273610949596716	55.31659126281738	25.1974379	55.2743373	Malls Burj Nahar Mall	Malls Dubai Mall	2	2	15	10	20	269.2	294.2	0	294.2	2	13.46	2024-12-05	17:21:00	22 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-05 12:21:46	2024-12-05 12:25:25	I booked by mistake	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
146	36	0	CB1733401545	33.636985120006585	73.06274894624949	33.631583056882434	73.06206833571196	34 Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	279 Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	16	41	0	41	2	0.8	2024-12-05	17:25:00	3 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-05 12:25:45	2024-12-05 12:25:45	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
147	36	10	CB1733401788	33.63872804492155	73.06297894567251	33.630498527865036	73.062324821949	5 Saidpur Rd, MPCHS Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3J6+6WF, Saidpur Rd, Asghar Mall Scheme, Rawalpindi, Punjab 46000, Pakistan,	2	2	15	10	20	30.6	55.6	0	55.6	2	1.53	2024-12-05	17:29:00	4 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-05 12:29:49	2024-12-05 12:30:25	It took too long to find a Cabby	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
148	36	10	CB1733401920	33.63834758562207	73.0627704039216	33.62863818683154	73.06177195161581	7e Saidpur Rd, MPCHS Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3H6+CQG, Saidpur Rd, Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	38	63	0	63	2	1.9	2024-12-05	17:31:00	6 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-05 12:32:00	2024-12-05 12:32:26	I want to change my booking details	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
149	36	4	CB1733401982	33.63790794787439	73.06305974721909	33.626023759118574	73.06246630847454	23 Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3G6+9VP, Asghar Mall Rd, Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	28	53	0	53	2	1.4	2024-12-05	17:33:00	4 mins	AED	\N	\N	\N	13	0	10	0	0	0	2024-12-05 12:33:02	2024-12-05 12:47:43	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
155	15	10	CB1733403979	33.641544731288164	73.06384328752756	33.64079723396806	73.05805407464504	J3R7+MPQ, D Block Block D Satellite Town, Rawalpindi, Punjab, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	18	43	0	43	2	0.9	2024-12-15	18:05:00	3 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-05 13:06:19	2024-12-05 18:07:39	I don’t need a ride anymore	\N	0	0	0	0		0	0	1	0	0	0	20	0	0	0	0
156	15	10	CB1733421962	33.63848464048639	73.06273151189089	33.6322759200095	73.06204453110695	6 Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3J6+RMC, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	29.8	54.8	0	54.8	2	1.49	2024-12-05	23:06:00	5 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-05 18:06:03	2024-12-05 18:18:38	I booked by mistake	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
150	36	4	CB1733402895	33.6391874968312	73.0626081302762	33.62936261912623	73.06194797158241	Main Saidpur Rd, near Askari Bank, opposite Royal Mansion Wedding Hall, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3H6+QR3, Saidpur Rd, Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	33	58	0	58	2	1.65	2024-12-05	17:48:00	5 mins	AED	\N	\N	\N	13	0	10	0	0	0	2024-12-05 12:48:15	2024-12-05 12:56:10	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
151	36	10	CB1733403400	33.637900132071906	73.06310031563044	33.62866470758174	73.0620089918375	J3Q7+48V, Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3H6+CQG, Saidpur Rd, Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.6	45.6	0	45.6	2	1.03	2024-12-05	17:56:00	3 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-05 12:56:41	2024-12-05 12:57:15	I want to change my booking details	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
152	36	10	CB1733403456	33.64498430765008	73.06397806853056	33.62915966703216	73.0617243424058	J3W7+2CH, Block F New Katarian Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3H6+JMG, Saidpur Rd, Block E Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	40.8	65.8	0	65.8	2	2.04	2024-12-05	17:57:00	6 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-05 12:57:36	2024-12-05 12:58:24	It took too long to find a Cabby	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
153	36	0	CB1733403528	33.64103253722238	73.06307315826416	33.63009737429019	73.06233152747154	1026 Saidpur Rd, Block D Satellite Town, Rawalpindi, Punjab, Pakistan,	J3J6+2W6, Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	31.6	56.6	0	56.6	2	1.58	2024-12-05	17:58:00	5 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-05 12:58:48	2024-12-05 12:58:48	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
154	15	10	CB1733403786	33.64428401066029	73.06378595530987	33.62708042739001	73.06204184889793	F1140 Opp Total Parco Petrol Pump, Saidpur Rd, Block F New Katarian Satellite Town, Rawalpindi, Punjab, Pakistan,	J3G6+RRX, Saidpur Rd, Kartar Pura, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	38.6	63.6	0	63.6	2	1.93	2024-12-05	18:03:00	6 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-05 13:03:07	2024-12-05 13:05:43	I don’t need a ride anymore	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
157	15	10	CB1733422786	33.63467689048716	73.05780798196793	33.61506323708958	73.06635115295649	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J378+XF7, Waris Khan Committee Mohalla Waris Khan, Rawalpindi, Punjab 46000, Pakistan,	2	2	15	10	20	91.4	116.4	0	116.4	2	4.57	2024-12-05	23:19:00	14 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-05 18:19:46	2024-12-05 18:20:13	I booked by mistake	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
158	46	0	CB1733434531	25.273610949596716	55.31659126281738	25.19062790693043	55.28373812701417	Burj Nahar Mall	Dubai Mall	2	2	15	10	20	364.6	389.6	389.6	0	2	18.23	2024-12-06	14:35:00	24 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-05 21:35:31	2024-12-05 21:35:31	\N	\N	0	0	0	0		0	0	1	0	0	0	20	0	0	0	0
159	15	10	CB1733462410	33.638591269578214	73.06243915110826	33.63151661765961	73.0624421685934	5 Saidpur Rd, MPCHS Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3J6+JW7, Saidpur Rd, Asghar Mall Scheme, Rawalpindi, Punjab 46000, Pakistan,	2	2	15	10	20	29	54	0	54	2	1.45	2024-12-06	10:20:00	5 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-06 05:20:10	2024-12-06 06:05:05	I want to change my booking details	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
160	51	4	CB1733462674	25.185383222159047	55.259047485888004	25.257817106322943	55.288672149181366	57P5+6R2 - Business Bay - Dubai - United Arab Emirates,	9 14A St - Al Raffa - Dubai - United Arab Emirates,	1	2	10	5	15	186.9	201.9	201.9	0	1	12.46	2024-12-06	09:24:00	17 mins	AED	\N	\N	\N	50	0	5	0	0	0	2024-12-06 05:24:34	2024-12-06 05:27:54	\N	\N	0	0	0	0		0	0	0	0	0	0	10	0	0	0	0
163	23	0	CB1733467096	25.273610949596716	55.31659126281738	25.1974379	55.2743373	Malls Burj Nahar Mall	Malls Mall of the Emirates	2	2	15	10	20	269.2	294.2	294.2	0	2	13.46	2024-12-06	12:08:00	22 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-06 06:38:16	2024-12-06 06:38:16	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
75	15	4	CB1733154839	33.63467968194975	73.05781569331884	33.63293890831528	73.0600456148386	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3M6+538, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	8.8	33.8	0	33.8	2	0.44	2024-12-02	20:53:00	2 mins	AED	\N	\N	\N	39	0	0	0	0	0	2024-12-02 15:53:59	2024-12-06 07:05:14	\N	\N	0	0	0	0		0	0	0	0	0	0	0	0	0	0	0
164	51	10	CB1733467213	25.184292482349523	55.26004057377577	25.19631647688206	55.25478545576334	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	12 36B St - Al Wasl - Dubai - United Arab Emirates,	1	2	10	5	15	108.3	123.3	123.3	0	1	7.22	2024-12-06	10:40:00	12 mins	AED	\N	\N	\N	50	0	5	0	0	0	2024-12-06 06:40:13	2024-12-06 06:42:55	It took too long to find a Cabby	\N	0	0	0	0		0	0	0	0	0	0	10	0	0	0	0
161	15	10	CB1733465210	33.64079723396806	73.05805407464504	33.62971464356398	73.06217964738607	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3H6+VVP, Saidpur Rd, Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	39	64	0	64	2	1.95	2024-12-06	11:06:00	7 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-06 06:06:50	2024-12-06 06:59:49	I want to change my booking details	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
166	15	10	CB1733468646	33.639041789990436	73.06251492351294	33.62606703112528	73.06160800158978	Main Saidpur Rd, near Askari Bank, opposite Royal Mansion Wedding Hall, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	Saidpur Rd, J3G6+CMW, Asghar Mall Chowk, Pir Choha Mohalla, Rawalpindi, Punjab 46000, Pakistan,	2	2	15	10	20	40.8	65.8	0	65.8	2	2.04	2024-12-06	12:04:00	7 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-06 07:04:06	2024-12-06 07:05:30	I don’t need a ride anymore	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
167	15	0	CB1733468762	33.639610380231524	73.06318111717701	33.64079723396806	73.05805407464504	32 Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.4	45.4	0	45.4	2	1.02	2024-12-06	12:06:00	4 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-06 07:06:02	2024-12-06 07:06:02	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
162	15	4	CB1733465656	33.637394615625766	73.0626942962408	33.62961330757273	73.06203849613667	23-32 Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	378 Saidpur Rd, Block E Asghar Mall Scheme, Rawalpindi, Punjab 46030, Pakistan,	2	2	15	10	20	19.2	44.2	0	44.2	2	0.96	2024-12-06	11:14:00	3 mins	AED	\N	\N	\N	39	0	10	0	0	0	2024-12-06 06:14:16	2024-12-06 07:02:43	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
168	51	10	CB1733469711	25.190628042416744	55.28373822569847	25.18602825590517	55.280769020318985	57RM+48C - Business Bay - Dubai - United Arab Emirates,	Business Bay, Bay Square Centers - BB13, Shop No. G01 - Ground Floor - الخليج التجاري - Bay Square - دبي - United Arab Emirates,	1	2	10	5	15	21.3	36.3	36.3	0	1	1.42	2024-12-06	11:21:00	4 mins	AED	\N	\N	\N	0	0	5	0	0	0	2024-12-06 07:21:51	2024-12-06 07:23:21	It took too long to find a Cabby	\N	0	0	0	0		0	0	0	0	0	0	10	0	0	0	0
165	51	4	CB1733467664	25.184291572131414	55.2600372210145	25.19892639338651	55.27557794004679	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	Unit BF - 02 Financial Center Rd - Downtown Dubai - Dubai - United Arab Emirates,	1	2	10	5	15	48.6	63.6	63.6	0	1	3.24	2024-12-06	10:47:00	10 mins	AED	\N	\N	\N	50	0	5	0	0	0	2024-12-06 06:47:45	2024-12-06 07:12:17	\N	\N	0	0	0	0		0	0	0	0	0	0	10	0	0	0	0
170	51	10	CB1733469894	25.184287931258922	55.260032527148724	25.187794041069907	55.30083294957876	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	58Q2+CG6 - Dubai Design District - Dubai - United Arab Emirates,	1	2	10	5	15	91.95	106.95	106.95	0	1	6.13	2024-12-06	11:24:00	13 mins	AED	\N	\N	\N	0	0	5	0	0	0	2024-12-06 07:24:55	2024-12-06 07:26:42	I booked by mistake	\N	0	0	0	0		0	0	0	0	0	0	10	0	0	0	0
171	51	1	CB1733470272	25.184258500868996	55.260038897395134	25.210146910497468	55.29822751879692	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	Tariaq Bedon Esm - Za'abeel - Za'abeel 2 - Dubai - United Arab Emirates,	1	2	10	5	15	94.65	109.65	109.65	0	1	6.31	2024-12-06	11:31:00	12 mins	AED	\N	\N	\N	50	0	5	0	0	0	2024-12-06 07:31:13	2024-12-06 07:31:55	\N	\N	0	0	0	0		0	0	0	0	0	0	10	0	0	0	0
169	53	4	CB1733469744	33.64038273022999	73.06326862424612	33.62952900040377	73.06203983724117	J3R7+57F, Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3H6+QR3, Saidpur Rd, Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	28.4	53.4	53.4	0	2	1.42	2024-12-06	12:22:00	4 mins	AED	\N	\N	\N	52	0	10	0	0	0	2024-12-06 07:22:25	2024-12-06 07:30:02	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
172	53	10	CB1733470440	33.639570185463	73.0629762634635	33.62950666736505	73.06233085691929	32 Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3H6+QR3, Saidpur Rd, Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	31	56	56	0	2	1.55	2024-12-06	12:33:00	4 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-06 07:34:01	2024-12-06 07:36:53	It took too long to find a Cabby	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
178	53	4	CB1733476336	33.64181576026684	73.06357439607382	33.62832914969828	73.06182626634836	765 Holy Family Rd, Block F New Katarian Satellite Town, Rawalpindi, Punjab 46300, Pakistan,	1059 Saidpur Rd, near Asghar Mall Road, opposite Grand Avenue Hall, Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	2	2	15	10	20	30.2	55.2	55.2	0	2	1.51	2024-12-06	14:12:00	4 mins	AED	\N	\N	\N	52	0	10	0	0	0	2024-12-06 09:12:16	2024-12-06 09:17:10	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
173	53	4	CB1733470652	33.6346665620748	73.0578126758337	33.642866094170785	73.06375611573458	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3V7+597, 6th Rd, Block F New Katarian Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	31.6	56.6	56.6	0	2	1.58	2024-12-06	12:37:00	6 mins	AED	\N	\N	\N	52	0	10	0	0	0	2024-12-06 07:37:32	2024-12-06 08:41:43	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
177	53	4	CB1733476053	33.63577867374124	73.05889897048473	33.64079723396806	73.05805407464504	J3P5+7G9, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3R4+FXJ, Holy Family Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	16.2	41.2	41.2	0	2	0.81	2024-12-06	14:07:00	3 mins	AED	\N	\N	\N	52	0	10	0	0	0	2024-12-06 09:07:34	2024-12-06 09:09:55	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
174	53	4	CB1733474539	33.64040115266072	73.06315060704947	33.642866094170785	73.06375611573458	1021 Saidpur Rd, Block D Satellite Town, Rawalpindi, Punjab, Pakistan,	J3V7+597, 6th Rd, Block F New Katarian Satellite Town, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	7.4	32.4	32.4	0	2	0.37	2024-12-06	13:42:00	1 min	AED	\N	\N	\N	52	0	10	0	0	0	2024-12-06 08:42:20	2024-12-06 08:44:14	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
175	53	10	CB1733475506	33.63468191511976	73.0578039586544	33.629785550770684	73.06300643831491	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	104, Asghar Mall Scheme, Rawalpindi, Punjab 40100, Pakistan,	2	2	15	10	20	19.6	44.6	44.6	0	2	0.98	2024-12-06	13:58:00	4 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-06 08:58:26	2024-12-06 08:59:01	I don’t need a ride anymore	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
176	53	10	CB1733475569	33.63468442743596	73.0578026175499	33.623780843541525	73.06415643543005	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3F7+QJC, Kartar Pura, Rawalpindi, Punjab 46000, Pakistan,	2	2	15	10	20	45	70	70	0	2	2.25	2024-12-06	13:59:00	9 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-06 08:59:30	2024-12-06 09:05:16	I want to change my booking details	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
180	53	10	CB1733477328	33.639702214042	73.06328941136599	33.62894163955927	73.06179843842983	1020 Saidpur Rd, Block D Satellite Town, Rawalpindi, Punjab, Pakistan,	J3H6+JMG, Saidpur Rd, Block E Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	28.6	53.6	53.6	0	2	1.43	2024-12-06	14:28:00	4 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-06 09:28:49	2024-12-06 09:28:59	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
182	53	10	CB1733479081	33.63821220534847	73.06327700614929	33.62919093341069	73.0621300265193	J3Q7+78M, D Block Block D Satellite Town, Rawalpindi, Punjab, Pakistan,	J3H6+QR3, Saidpur Rd, Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	20.6	45.6	65.1	-19.5	2	1.03	2024-12-06	14:57:00	3 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-06 09:58:02	2024-12-06 09:58:12	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
179	53	4	CB1733477122	33.640628641442625	73.06316737085581	33.62866945339934	73.06171260774136	shop 10 ground floor, aftab plaza, Saidpur Rd, near green pharmacy holy family stop, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3H6+GMJ, Saidpur Rd, Block E Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	33	58	58	0	2	1.65	2024-12-06	14:25:00	5 mins	AED	\N	\N	\N	52	0	10	0	0	0	2024-12-06 09:25:22	2024-12-06 09:27:44	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
181	53	10	CB1733477890	33.64048517005999	73.06335479021072	33.62677668893414	73.06147590279579	1022 Saidpur Rd, Block D Satellite Town, Rawalpindi, Punjab, Pakistan,	7 Saidpur Rd, beside JS Bank, Pir Choha Mohalla, Rawalpindi, Punjab 46200, Pakistan,	2	2	15	10	20	31.4	56.4	56.4	0	2	1.57	2024-12-06	14:38:00	5 mins	AED	\N	\N	\N	52	0	10	0	0	0	2024-12-06 09:38:11	2024-12-06 09:39:21	I want to change my booking details	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
183	53	10	CB1733479242	33.639164608033454	73.06315999478102	33.62885649423759	73.06161269545555	J3Q7+M59, Saidpur Rd, Block E Satellite Town, Rawalpindi, Punjab, Pakistan,	J3H6+GMJ, Saidpur Rd, Block E Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	36.6	61.6	81.1	-19.5	2	1.83	2024-12-06	15:00:00	6 mins	AED	\N	\N	\N	52	0	10	0	0	0	2024-12-06 10:00:42	2024-12-06 10:01:11	I want to change my booking details	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
184	53	4	CB1733479405	33.63988895179227	73.06295212358236	33.627108623644574	73.0618155375123	J3Q7+X5C, Holy Family Rd, Block F Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3G6+RPJ, Saidpur Rd, Pir Choha Mohalla, Rawalpindi, Punjab 46000, Pakistan,	2	2	15	10	20	35	60	99	-39	2	1.75	2024-12-06	15:03:00	5 mins	AED	\N	\N	\N	52	0	10	0	0	0	2024-12-06 10:03:26	2024-12-06 10:03:58	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
185	51	1	CB1733486276	25.18426062471179	55.260041914880276	25.179855391727774	55.239972956478596	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	56HQ+QVX Safa park - Al Safa - Al Safa 1 - Dubai - United Arab Emirates,	1	2	10	5	15	79.5	94.5	94.5	0	1	5.3	2024-12-06	15:57:00	10 mins	AED	\N	\N	\N	50	0	5	0	0	0	2024-12-06 11:57:56	2024-12-06 11:58:15	\N	\N	0	0	0	0		0	0	0	0	0	0	10	0	0	0	0
186	51	10	CB1733486608	25.170107424781985	55.256398133933544	25.160667606011494	55.224372893571854	20 36A Street - Al Quoz - Al Quoz 1 - Dubai - United Arab Emirates,	33 21st St - Al Safa - Al Safa 2 - Dubai - United Arab Emirates,	1	2	10	5	15	87.6	102.6	102.6	0	1	5.84	2024-12-06	16:03:00	9 mins	AED	\N	\N	\N	0	0	5	0	0	0	2024-12-06 12:03:28	2024-12-06 12:03:39	\N	\N	0	0	0	0		0	0	0	0	0	0	10	0	0	0	0
189	53	4	CB1733487530	25.15726177261548	55.26710383594036	25.221215949559515	55.27175109833479	5758+6J7 - Al Quoz - Ghadeer Al Tair - Dubai - United Arab Emirates,	151 6D St - Al Satwa - Dubai - United Arab Emirates,	2	2	15	10	20	241	266	305	-39	2	12.05	2024-12-06	16:18:00	17 mins	AED	\N	\N	\N	56	0	10	0	0	0	2024-12-06 12:18:51	2024-12-06 12:19:50	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
187	36	4	CB1733486835	33.6388614704553	73.06285757571459	33.62958315799861	73.06289244443178	5 Saidpur Rd, MPCHS Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	104, Asghar Mall Scheme, Rawalpindi, Punjab 40100, Pakistan,	2	2	15	10	20	33.4	58.4	0	58.4	2	1.67	2024-12-06	17:07:00	5 mins	AED	\N	\N	\N	52	0	10	0	0	0	2024-12-06 12:07:16	2024-12-06 12:07:50	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
188	51	10	CB1733487035	25.188161758059703	55.230161771178246	25.1974379	55.2743373	Majlis Al Ghoreifa - Jumeirah - Jumeirah 3 - Dubai - United Arab Emirates,	Malls Dubai Mall	1	2	10	5	15	125.4	140.4	140.4	0	1	8.36	2024-12-06	16:10:00	13 mins	AED	\N	\N	\N	0	0	5	0	0	0	2024-12-06 12:10:35	2024-12-06 12:10:45	\N	\N	0	0	0	0		0	0	0	0	0	0	10	0	0	0	0
192	53	4	CB1733489316	25.18106662669833	55.2401177957654	25.13710857050373	55.25737278163433	5 8B St - Al Safa - Al Safa 1 - Dubai - United Arab Emirates,	1 26th St - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	2	2	15	10	20	239.8	264.8	303.8	-39	2	11.99	2024-12-06	16:48:00	15 mins	AED	\N	\N	\N	56	0	10	0	0	0	2024-12-06 12:48:36	2024-12-06 12:50:05	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
191	36	4	CB1733488365	33.63777870790642	73.06083887815475	33.63036704349622	73.06241132318974	J3P6+X9H, Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	J3J6+6WF, Saidpur Rd, Asghar Mall Scheme, Rawalpindi, Punjab 46000, Pakistan,	2	2	15	10	20	22.4	47.4	0	47.4	2	1.12	2024-12-06	17:32:00	3 mins	AED	\N	\N	\N	52	0	10	0	0	0	2024-12-06 12:32:46	2024-12-06 12:33:14	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
190	36	4	CB1733488082	33.6388614704553	73.06285757571459	33.62958315799861	73.06289244443178	5 Saidpur Rd, MPCHS Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan,	104, Asghar Mall Scheme, Rawalpindi, Punjab 40100, Pakistan,	2	2	15	10	20	33.4	58.4	0	58.4	2	1.67	2024-12-06	17:27:00	5 mins	AED	\N	\N	\N	52	0	10	0	0	0	2024-12-06 12:28:03	2024-12-06 12:29:35	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
195	57	4	CB1733505225	33.57101697214666	73.0830304697156	33.596878896722096	73.0528412014246	H3CJ+7WV, Lane 7, Gulistan Colony, Rawalpindi, Punjab, Pakistan	80 Adam Jee Rd, Saddar, Rawalpindi, Punjab 46000, Pakistan	2	2	15	10	20	151.2	176.2	176.2	0	2	7.56	2024-12-06	22:13:00	16 mins	AED	\N	\N	\N	58	0	10	0	0	0	2024-12-06 17:13:46	2024-12-06 17:36:20	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
194	57	4	CB1733501928	33.57101697214666	73.0830304697156	33.596878896722096	73.0528412014246	H3CJ+7WV, Lane 7, Gulistan Colony, Rawalpindi, Punjab, Pakistan	80 Adam Jee Rd, Saddar, Rawalpindi, Punjab 46000, Pakistan	2	2	15	10	20	151.2	176.2	176.2	0	2	7.56	2024-12-06	21:18:00	16 mins	AED	\N	\N	\N	58	0	10	0	0	0	2024-12-06 16:18:48	2024-12-06 17:09:18	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
196	57	4	CB1733507001	33.596878896722096	73.0528412014246	33.55648635054603	72.83406212925911	80 Adam Jee Rd, Saddar, Rawalpindi, Punjab 46000, Pakistan	Islamabad International Airport, New Islamabad Airport Rd, Islamabad, Rawalpindi, Punjab, Pakistan	2	2	15	10	20	563.8	588.8	588.8	0	2	28.19	2024-12-06	22:43:00	40 mins	AED	\N	\N	\N	58	0	10	0	0	0	2024-12-06 17:43:22	2024-12-06 17:45:15	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
198	57	0	CB1733512657	33.596878896722096	73.0528412014246	33.55648635054603	72.83406212925911	80 Adam Jee Rd, Saddar, Rawalpindi, Punjab 46000, Pakistan	Islamabad International Airport, New Islamabad Airport Rd, Islamabad, Rawalpindi, Punjab, Pakistan	2	2	15	10	20	563.8	588.8	588.8	0	2	28.19	2024-12-07	13:17:00	40 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-06 19:17:37	2024-12-06 19:17:37	\N	\N	0	0	0	0		0	0	1	0	0	0	20	0	0	0	0
197	57	4	CB1733507610	33.59667223762605	73.05298939347267	33.52139559867921	73.15885450690985	H3W3+J4H, Kashmir Rd, Saddar, Rawalpindi, Punjab 46000, Pakistan	Main Grand Trunk Rd, Defense Housing Authority Sector F DHA Phase II, Islamabad, Islamabad Capital Territory 44000, Pakistan	2	2	15	10	20	293.6	318.6	318.6	0	2	14.68	2024-12-06	22:53:00	25 mins	AED	\N	\N	\N	58	0	10	0	0	0	2024-12-06 17:53:31	2024-12-06 17:55:01	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
202	57	10	CB1733513996	33.596878896722096	73.0528412014246	33.55648635054603	72.83406212925911	80 Adam Jee Rd, Saddar, Rawalpindi, Punjab 46000, Pakistan	Islamabad International Airport, New Islamabad Airport Rd, Islamabad, Rawalpindi, Punjab, Pakistan	2	2	15	10	20	563.8	588.8	588.8	0	2	28.19	2024-12-06	15:10:00	40 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-06 19:39:56	2024-12-06 19:40:37	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
199	36	10	CB1733513105	33.648422071985536	73.06499093770981	33.62730655550828	73.06237109005451	J3X7+7WW, Pindora, Rawalpindi, Punjab, Pakistan,	J3G6+RRX, Saidpur Rd, Kartar Pura, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	49.4	74.4	74.4	0	2	2.47	2024-12-06	15:10:00	8 mins	AED	\N	\N	\N	58	0	10	0	0	0	2024-12-06 19:25:05	2024-12-06 19:26:26	I want to change my booking details	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
200	36	10	CB1733513722	33.63927933109268	73.06328404694796	33.62691655392598	73.06182391941547	1017 Saidpur Rd, D Block Block D Satellite Town, Rawalpindi, Punjab, Pakistan,	J3G6+RPJ, Saidpur Rd, Pir Choha Mohalla, Rawalpindi, Punjab 46000, Pakistan,	2	2	15	10	20	27.6	52.6	52.6	0	2	1.38	2024-12-06	15:10:00	4 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-06 19:35:23	2024-12-06 19:36:04	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
193	36	4	CB1733490060	33.63833055842409	73.06344531476498	33.629143754674445	73.06144170463085	J3Q7+883, Block D Satellite Town, Rawalpindi, Punjab, Pakistan,	J3H6+JMG, Saidpur Rd, Block E Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	28	53	0	53	2	1.4	2024-12-06	18:00:00	5 mins	AED	\N	\N	\N	52	0	10	0	0	0	2024-12-06 13:01:00	2024-12-06 19:36:29	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
203	36	10	CB1733515054	33.635720332898806	73.06343257427216	33.62865158679056	73.06196305900812	J3P7+6FX, B-Block Block B Satellite Town, Rawalpindi, Punjab, Pakistan,	J3H6+CQG, Saidpur Rd, Asghar Mall Scheme, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	17.2	42.2	42.2	0	2	0.86	2024-12-06	15:10:00	2 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-06 19:57:35	2024-12-06 19:57:45	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
201	36	4	CB1733513804	33.63927933109268	73.06328404694796	33.62691655392598	73.06182391941547	1017 Saidpur Rd, D Block Block D Satellite Town, Rawalpindi, Punjab, Pakistan,	J3G6+RPJ, Saidpur Rd, Pir Choha Mohalla, Rawalpindi, Punjab 46000, Pakistan,	2	2	15	10	20	27.6	52.6	52.6	0	2	1.38	2024-12-06	15:10:00	4 mins	AED	\N	\N	\N	52	0	10	0	0	0	2024-12-06 19:36:44	2024-12-06 19:37:10	\N	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
204	57	10	CB1733515290	33.596878896722096	73.0528412014246	33.55648635054603	72.83406212925911	80 Adam Jee Rd, Saddar, Rawalpindi, Punjab 46000, Pakistan	Islamabad International Airport, New Islamabad Airport Rd, Islamabad, Rawalpindi, Punjab, Pakistan	1	2	10	5	15	422.85	437.85	437.85	0	1	28.19	2024-12-07	15:10:00	40 mins	AED	\N	\N	\N	0	0	5	0	0	0	2024-12-06 20:01:31	2024-12-06 20:01:41	\N	\N	0	0	0	0		0	0	0	0	0	0	10	0	0	0	0
205	57	1	CB1733515625	33.596878896722096	73.0528412014246	33.55648635054603	72.83406212925911	80 Adam Jee Rd, Saddar, Rawalpindi, Punjab 46000, Pakistan	Islamabad International Airport, New Islamabad Airport Rd, Islamabad, Rawalpindi, Punjab, Pakistan	4	2	100000	3	10	281.9	100284.9	100284.9	0	3	28.19	2024-12-07	15:10:00	40 mins	AED	\N	\N	\N	60	0	5	0	0	0	2024-12-06 20:07:06	2024-12-06 20:07:23	\N	\N	0	0	0	0		0	0	0	0	0	0	2.5	0	0	0	0
206	36	10	CB1733518985	33.6346536	73.0578097	33.6277895185139	73.06111246347427	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, Punjab 46000, Pakistan	J3H6+4F6, Asghar Mall Rd, Pir Choha Mohalla, Rawalpindi, Punjab, Pakistan,	2	2	15	10	20	23.8	48.8	48.8	0	2	1.19	2024-12-07	15:10:00	5 mins	AED	\N	\N	\N	0	0	10	0	0	0	2024-12-06 21:03:05	2024-12-06 21:03:14	I booked by mistake	\N	0	0	0	0		0	0	0	0	0	0	20	0	0	0	0
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
spatie.permission.cache	a:3:{s:5:"alias";a:4:{s:1:"a";s:2:"id";s:1:"b";s:4:"name";s:1:"c";s:10:"guard_name";s:1:"r";s:5:"roles";}s:11:"permissions";a:99:{i:0;a:4:{s:1:"a";i:1;s:1:"b";s:9:"dashboard";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:1;a:4:{s:1:"a";i:2;s:1:"b";s:7:"livemap";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:2;a:4:{s:1:"a";i:3;s:1:"b";s:5:"rides";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:3;a:4:{s:1:"a";i:4;s:1:"b";s:9:"rides-all";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:4;a:4:{s:1:"a";i:5;s:1:"b";s:12:"rides-active";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:5;a:4:{s:1:"a";i:6;s:1:"b";s:15:"rides-completed";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:6;a:4:{s:1:"a";i:7;s:1:"b";s:14:"rides-canceled";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:7;a:4:{s:1:"a";i:8;s:1:"b";s:13:"rides-ongoing";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:8;a:4:{s:1:"a";i:9;s:1:"b";s:9:"customers";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:9;a:4:{s:1:"a";i:10;s:1:"b";s:16:"customers-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:10;a:4:{s:1:"a";i:11;s:1:"b";s:14:"customers-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:11;a:4:{s:1:"a";i:12;s:1:"b";s:14:"customers-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:12;a:4:{s:1:"a";i:13;s:1:"b";s:16:"customers-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:13;a:4:{s:1:"a";i:14;s:1:"b";s:7:"drivers";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:14;a:4:{s:1:"a";i:15;s:1:"b";s:14:"drivers-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:15;a:4:{s:1:"a";i:16;s:1:"b";s:12:"drivers-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:16;a:4:{s:1:"a";i:17;s:1:"b";s:12:"drivers-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:17;a:4:{s:1:"a";i:18;s:1:"b";s:14:"drivers-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:18;a:4:{s:1:"a";i:19;s:1:"b";s:9:"companies";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:19;a:4:{s:1:"a";i:20;s:1:"b";s:16:"companies-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:20;a:4:{s:1:"a";i:21;s:1:"b";s:14:"companies-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:21;a:4:{s:1:"a";i:22;s:1:"b";s:14:"companies-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:22;a:4:{s:1:"a";i:23;s:1:"b";s:16:"companies-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:23;a:4:{s:1:"a";i:24;s:1:"b";s:13:"vehicle-types";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:24;a:4:{s:1:"a";i:25;s:1:"b";s:20:"vehicle-types-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:25;a:4:{s:1:"a";i:26;s:1:"b";s:18:"vehicle-types-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:26;a:4:{s:1:"a";i:27;s:1:"b";s:18:"vehicle-types-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:27;a:4:{s:1:"a";i:28;s:1:"b";s:20:"vehicle-types-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:28;a:4:{s:1:"a";i:29;s:1:"b";s:13:"vehicle-makes";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:29;a:4:{s:1:"a";i:30;s:1:"b";s:20:"vehicle-makes-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:30;a:4:{s:1:"a";i:31;s:1:"b";s:18:"vehicle-makes-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:31;a:4:{s:1:"a";i:32;s:1:"b";s:18:"vehicle-makes-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:32;a:4:{s:1:"a";i:33;s:1:"b";s:20:"vehicle-makes-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:33;a:4:{s:1:"a";i:34;s:1:"b";s:14:"vehicle-models";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:34;a:4:{s:1:"a";i:35;s:1:"b";s:21:"vehicle-models-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:35;a:4:{s:1:"a";i:36;s:1:"b";s:19:"vehicle-models-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:36;a:4:{s:1:"a";i:37;s:1:"b";s:19:"vehicle-models-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:37;a:4:{s:1:"a";i:38;s:1:"b";s:21:"vehicle-models-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:38;a:4:{s:1:"a";i:39;s:1:"b";s:5:"rates";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:39;a:4:{s:1:"a";i:40;s:1:"b";s:12:"rates-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:40;a:4:{s:1:"a";i:41;s:1:"b";s:10:"rates-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:41;a:4:{s:1:"a";i:42;s:1:"b";s:10:"rates-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:42;a:4:{s:1:"a";i:43;s:1:"b";s:12:"rates-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:43;a:4:{s:1:"a";i:44;s:1:"b";s:20:"location-suggestions";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:44;a:4:{s:1:"a";i:45;s:1:"b";s:27:"location-suggestions-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:45;a:4:{s:1:"a";i:46;s:1:"b";s:25:"location-suggestions-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:46;a:4:{s:1:"a";i:47;s:1:"b";s:25:"location-suggestions-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:47;a:4:{s:1:"a";i:48;s:1:"b";s:27:"location-suggestions-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:48;a:4:{s:1:"a";i:49;s:1:"b";s:9:"feedbacks";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:49;a:4:{s:1:"a";i:50;s:1:"b";s:18:"feedbacks-customer";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:50;a:4:{s:1:"a";i:51;s:1:"b";s:16:"feedbacks-driver";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:51;a:4:{s:1:"a";i:52;s:1:"b";s:15:"feedbacks-cabby";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:52;a:4:{s:1:"a";i:53;s:1:"b";s:8:"livechat";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:53;a:4:{s:1:"a";i:54;s:1:"b";s:9:"discounts";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:54;a:4:{s:1:"a";i:55;s:1:"b";s:16:"discounts-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:55;a:4:{s:1:"a";i:56;s:1:"b";s:14:"discounts-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:56;a:4:{s:1:"a";i:57;s:1:"b";s:14:"discounts-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:57;a:4:{s:1:"a";i:58;s:1:"b";s:16:"discounts-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:58;a:4:{s:1:"a";i:59;s:1:"b";s:5:"tasks";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:59;a:4:{s:1:"a";i:60;s:1:"b";s:12:"tasks-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:60;a:4:{s:1:"a";i:61;s:1:"b";s:10:"tasks-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:61;a:4:{s:1:"a";i:62;s:1:"b";s:10:"tasks-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:62;a:4:{s:1:"a";i:63;s:1:"b";s:12:"tasks-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:63;a:4:{s:1:"a";i:64;s:1:"b";s:10:"complaints";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:64;a:4:{s:1:"a";i:65;s:1:"b";s:24:"complaints-from-customer";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:65;a:4:{s:1:"a";i:66;s:1:"b";s:22:"complaints-from-driver";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:66;a:4:{s:1:"a";i:67;s:1:"b";s:8:"accounts";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:67;a:4:{s:1:"a";i:68;s:1:"b";s:15:"accounts-driver";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:68;a:4:{s:1:"a";i:69;s:1:"b";s:17:"accounts-customer";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:69;a:4:{s:1:"a";i:70;s:1:"b";s:15:"payment-history";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:70;a:4:{s:1:"a";i:71;s:1:"b";s:7:"reports";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:71;a:4:{s:1:"a";i:72;s:1:"b";s:14:"reports-driver";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:72;a:4:{s:1:"a";i:73;s:1:"b";s:16:"reports-customer";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:73;a:4:{s:1:"a";i:74;s:1:"b";s:13:"reports-rides";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:74;a:4:{s:1:"a";i:75;s:1:"b";s:17:"reports-companies";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:75;a:4:{s:1:"a";i:76;s:1:"b";s:27:"reports-driver-excel-export";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:76;a:4:{s:1:"a";i:77;s:1:"b";s:29:"reports-customer-excel-export";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:77;a:4:{s:1:"a";i:78;s:1:"b";s:26:"reports-rides-excel-export";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:78;a:4:{s:1:"a";i:79;s:1:"b";s:30:"reports-companies-excel-export";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:79;a:4:{s:1:"a";i:80;s:1:"b";s:11:"cabby-pages";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:80;a:4:{s:1:"a";i:81;s:1:"b";s:20:"cabby-pages-about-us";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:81;a:4:{s:1:"a";i:82;s:1:"b";s:32:"cabby-pages-terms-and-conditions";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:82;a:4:{s:1:"a";i:83;s:1:"b";s:26:"cabby-pages-privacy-policy";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:83;a:4:{s:1:"a";i:84;s:1:"b";s:27:"cabby-pages-contact-details";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:84;a:4:{s:1:"a";i:85;s:1:"b";s:16:"cabby-pages-faqs";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:85;a:4:{s:1:"a";i:86;s:1:"b";s:32:"cabby-pages-emergency-assistance";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:86;a:4:{s:1:"a";i:87;s:1:"b";s:32:"cabby-pages-report-safety-issues";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:87;a:4:{s:1:"a";i:88;s:1:"b";s:25:"cabby-pages-share-my-trip";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:88;a:4:{s:1:"a";i:89;s:1:"b";s:25:"cabby-pages-safety-center";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:89;a:4:{s:1:"a";i:90;s:1:"b";s:5:"roles";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:90;a:4:{s:1:"a";i:91;s:1:"b";s:12:"roles-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:91;a:4:{s:1:"a";i:92;s:1:"b";s:10:"roles-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:92;a:4:{s:1:"a";i:93;s:1:"b";s:10:"roles-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:93;a:4:{s:1:"a";i:94;s:1:"b";s:12:"roles-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:94;a:4:{s:1:"a";i:95;s:1:"b";s:5:"users";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:95;a:4:{s:1:"a";i:96;s:1:"b";s:12:"users-create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:96;a:4:{s:1:"a";i:97;s:1:"b";s:10:"users-save";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:97;a:4:{s:1:"a";i:98;s:1:"b";s:10:"users-edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:98;a:4:{s:1:"a";i:99;s:1:"b";s:12:"users-delete";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}}s:5:"roles";a:1:{i:0;a:3:{s:1:"a";i:1;s:1:"b";s:13:"Administrator";s:1:"c";s:3:"web";}}}	1733564615
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
18084	52	179	4	2024-12-06 09:25:33	2024-12-06 13:25:41
18085	52	181	4	2024-12-06 09:38:21	2024-12-06 13:38:27
18086	52	183	4	2024-12-06 10:00:52	2024-12-06 14:00:58
18087	52	184	4	2024-12-06 10:03:36	2024-12-06 10:03:58
18088	50	185	1	2024-12-06 11:58:06	2024-12-06 15:58:15
18089	52	187	4	2024-12-06 12:07:26	2024-12-06 12:07:50
18090	56	189	4	2024-12-06 12:19:01	2024-12-06 12:19:50
18091	52	190	4	2024-12-06 12:28:13	2024-12-06 12:29:35
18092	52	191	4	2024-12-06 12:32:56	2024-12-06 12:33:14
18093	56	192	4	2024-12-06 12:48:47	2024-12-06 12:50:05
18095	58	194	4	2024-12-06 16:18:59	2024-12-06 17:09:18
18096	58	195	4	2024-12-06 17:13:56	2024-12-06 17:36:20
18097	58	196	4	2024-12-06 17:43:32	2024-12-06 17:45:15
18098	58	197	4	2024-12-06 17:53:41	2024-12-06 17:55:01
18099	58	199	4	2024-12-06 19:25:15	2024-12-06 19:26:26
18100	58	200	0	2024-12-06 19:35:33	2024-12-06 19:35:33
18094	52	193	4	2024-12-06 13:01:10	2024-12-06 19:36:29
18101	52	201	4	2024-12-06 19:36:54	2024-12-06 19:37:10
18102	52	202	0	2024-12-06 19:40:06	2024-12-06 19:40:06
18103	60	205	1	2024-12-06 20:07:16	2024-12-07 00:07:23
\.


--
-- Data for Name: driver_cancel_bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.driver_cancel_bookings (id, booking_id, driver_id, reason_title, reason, created_at, updated_at) FROM stdin;
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
14	48	2	6	7	1733388136675167689efcd.jpg	173338813667516768a05b9.jpg	1733388238675167cedfb5a.jpg	1733388238675167cee114d.jpg	Dxb123456789	2025-02-28	1733388238675167cee12e9.jpg	1733388238675167cee142e.jpg	Dxb123456789	2025-02-28	1733388238675167cee15a1.jpg	1733388238675167cee16f8.jpg	Dxb123456789	2025-02-28	1733388238675167cee1869.jpg	1733388238675167cee19a3.jpg	Dxb123456789	2025-02-28	2024-12-05 08:43:58	2024-12-05 08:43:58	\N
15	49	2	6	7	173339364367517ceb83b71.jpg	173339364367517ceb851c2.jpg	173339379767517d85d6fc0.jpg	173339379767517d85d867e.jpg	Dxb123456789	2025-02-28	173339379767517d85d880b.jpg	173339379767517d85d894b.jpg	Dxb123456789	2025-02-28	173339379767517d85d8ada.jpg	173339379767517d85d8c15.jpg	Dxb123456789	2025-02-28	173339379767517d85d8d71.jpg	173339379767517d85d8ea1.jpg	Dxb123456789	2025-02-28	2024-12-05 10:16:37	2024-12-05 10:16:37	\N
16	50	1	6	7	1733394935675181f7005ee.jpg	1733394935675181f701bec.jpg	17333953406751838ccb4a8.jpg	17333953406751838cccadc.jpg	Dxb123456789	2025-02-28	17333953406751838cccc39.jpg	17333953406751838cccd6b.jpg	Dxb123456789	2025-02-28	17333953406751838ccceae.jpg	17333953406751838cccfe1.jpg	Dxb123456789	2025-02-28	17333953406751838ccd16b.jpg	17333953406751838ccd270.jpg	Dxb123456789	2025-02-28	2024-12-05 10:42:20	2024-12-05 10:42:20	\N
17	52	2	6	7	17334693806752a4c479f08.jpg	17334693806752a4c47b536.jpg	17334694496752a509011b0.jpg	17334694496752a50902759.jpg	098765	2024-12-19	17334694496752a509028e6.jpg	17334694496752a50902a18.jpg	0987654	2024-12-23	17334694496752a50902b6f.jpg	17334694496752a50902cca.jpg	789900	2024-12-26	17334694496752a50902e4b.jpg	17334694496752a50902f8c.jpg	98654433	2024-12-26	2024-12-06 07:17:29	2024-12-06 07:17:29	\N
18	56	2	5	6	17334807366752d120b5fc3.jpg	17334807366752d120b751f.jpg	17334807896752d15519830.jpg	17334807896752d1551ae84.jpg	97362	2024-12-08	17334807896752d1551b020.jpg	17334807896752d1551b184.jpg	57899	2024-12-15	17334807896752d1551b343.jpg	17334807896752d1551b4b5.jpg	886262	2024-12-22	17334807896752d1551b63a.jpg	17334807896752d1551b7ca.jpg	7272881	2024-12-22	2024-12-06 10:26:29	2024-12-06 10:26:29	\N
19	58	2	6	7	173350171967532317e4410.jpg	173350171967532317e591c.jpg	173350180067532368e8734.jpg	173350180067532368e9d0a.jpg	Haywu188wq	2034-01-31	173350180067532368e9e68.jpg	173350180067532368e9f4c.jpg	Jw	2034-11-30	173350180067532368ea0aa.jpg	173350180067532368ea1b2.jpg	Hwhsh	2033-12-31	173350180067532368ea32f.jpg	173350180067532368ea449.jpg	Jssj	2034-12-15	2024-12-06 16:16:40	2024-12-06 16:16:40	\N
20	59	5	6	7	17335151176753576d09ecb.jpg	17335151176753576d0b335.jpg	1733515178675357aaa155b.jpg	1733515178675357aaa2b3d.jpg	Nwjwo	2024-12-30	1733515178675357aaa2c94.jpg	1733515178675357aaa2d9b.jpg	Jw	2024-12-30	1733515178675357aaa2ee9.jpg	1733515178675357aaa2ffe.jpg	Wjw	2024-12-30	1733515178675357aaa3122.jpg	1733515178675357aaa3223.jpg	Jss	2024-12-30	2024-12-06 19:59:38	2024-12-06 19:59:38	\N
21	60	4	5	6	17335155476753591bc2c72.jpg	17335155476753591bc41e6.jpg	17335155936753594941bf6.jpg	173351559367535949431e0.jpg	Kw	2024-12-30	173351559367535949433ed.jpg	17335155936753594943592.jpg	Kw	2024-12-30	1733515593675359494378b.jpg	1733515593675359494394e.jpg	Kw	2024-12-30	17335155936753594943b33.jpg	17335155936753594943d1f.jpg	Kwk	2024-12-30	2024-12-06 20:06:33	2024-12-06 20:06:33	\N
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
8	1	Burj Nahar Mall	25.273610949596716	55.31659126281738	1	2024-12-04 11:59:24	2024-12-04 11:59:24	\N
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
60	2024_12_04_060115_alter_add_rider_rating_to_bookings	16
61	2024_12_04_062318_create_driver_cancel_bookings_table	16
62	2024_12_04_101749_alter_add_polygon_data_to_rates	16
63	2024_12_04_111253_create_polgon_models_table	16
64	2024_12_05_033732_alter_add_surcharge-to_temp_bookings_and_bookings	17
65	2024_12_05_093612_alter_add_polygon_coordinates_text_to_polgon_models	18
66	2024_12_05_090840_alter_add_fileds_to_settings	19
67	2024_12_05_095500_alter_add_waiting_charge_to_temp_bookings	20
68	2024_12_05_103954_alter_add_driver_amount_transfered_to_bookings	20
69	2024_12_06_210022_add_soft_deletes_to_users_table	21
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
32	App\\Models\\User	42	api_token	60053fbd18d3178bb829abb0f82e8cf7977c98512e3cf87d8da0c077fd877846	["*"]	\N	\N	2024-12-04 11:54:48	2024-12-04 11:54:48
33	App\\Models\\User	45	api_token	9760154bd386f7e42175d808726c004b68e330f1cd65f75b56048035c1d82954	["*"]	\N	\N	2024-12-04 17:44:13	2024-12-04 17:44:13
34	App\\Models\\User	46	api_token	36080b951a84e32ec830a3373ff6316a8eee77e59b738917a58cf164938ae1c3	["*"]	\N	\N	2024-12-04 19:52:46	2024-12-04 19:52:46
35	App\\Models\\User	47	api_token	142bf331092ef4a9a8e90a95da6790215224cd19ab2b6cfd7b0d46c97b7fc7ad	["*"]	\N	\N	2024-12-05 12:37:29	2024-12-05 12:37:29
36	App\\Models\\User	48	api_token	114841ca1121ae94a5f3f97215ffc0473d06cd6589d859bc3af0631c95fedacb	["*"]	\N	\N	2024-12-05 12:43:58	2024-12-05 12:43:58
37	App\\Models\\User	49	api_token	5182559d40d14c176dfba954ebc19a8fb36b6cf17775956f52d5eca02f5ac89e	["*"]	\N	\N	2024-12-05 14:16:37	2024-12-05 14:16:37
38	App\\Models\\User	50	api_token	1e1c1bed669d01aa2db7c1c8b632ff98a72f5ff0886ea98ee1b7b82d53348d16	["*"]	\N	\N	2024-12-05 14:42:20	2024-12-05 14:42:20
39	App\\Models\\User	51	api_token	6656d6c1317b92296d286ac28c68483145d8d5eaeabfbe9cb2da318773713246	["*"]	\N	\N	2024-12-06 09:03:51	2024-12-06 09:03:51
40	App\\Models\\User	52	api_token	1c09d8fdc2b0176406e80a910e833b8230c1d0db11d4f6137e7eacfa1609b1a9	["*"]	\N	\N	2024-12-06 11:17:28	2024-12-06 11:17:28
41	App\\Models\\User	53	api_token	742a611f94d5bf154c5d95b2b8f6d0d9075ee8c8b0464ff7ae7efd0a22700471	["*"]	\N	\N	2024-12-06 11:21:58	2024-12-06 11:21:58
42	App\\Models\\User	26	api_token	770d10737be2de4d1409f18f4e2cce2f80c8ef2ce382fcc391cd9edd8b72d15b	["*"]	\N	\N	2024-12-06 13:56:37	2024-12-06 13:56:37
43	App\\Models\\User	26	api_token	d6c793456e611647c0419f6575745d5d9a63f9ab5721c8144247379f7383e1e1	["*"]	\N	\N	2024-12-06 14:13:34	2024-12-06 14:13:34
44	App\\Models\\User	55	api_token	e637f3f75dbb37870c6597a095c2de40589115c8a19d2f704a1264180cc4b08d	["*"]	\N	\N	2024-12-06 14:25:43	2024-12-06 14:25:43
45	App\\Models\\User	56	api_token	028cbce72aac4f1b18c3730e4db29ba335425d011e8c8a8df96753bb4abf73da	["*"]	\N	\N	2024-12-06 14:26:29	2024-12-06 14:26:29
46	App\\Models\\User	36	api_token	2c26e915b452ad93826fd9f7952402a3550dba91106e0db44d01ed5b676a8efa	["*"]	\N	\N	2024-12-06 14:47:42	2024-12-06 14:47:42
47	App\\Models\\User	15	api_token	e216f8610c4e86c303fdbc1437e560b85818225d9cdf3144e32d3a45e9d321fd	["*"]	\N	\N	2024-12-06 14:48:24	2024-12-06 14:48:24
48	App\\Models\\User	36	api_token	2cff32c1962987d1cc01bd0677f11fda71f20eb2ac58a2c9784a189e2287903c	["*"]	\N	\N	2024-12-06 14:58:51	2024-12-06 14:58:51
49	App\\Models\\User	39	api_token	4d58ddf98db54b6686611c0ce9446b2b7e67f2df5345fd0ebba155be7cebc4bf	["*"]	\N	\N	2024-12-06 15:03:20	2024-12-06 15:03:20
50	App\\Models\\User	52	api_token	39bf4cf048f346ea526dc87e8c6281899302fb0b1cd7944c07fe1f96dc61ffbe	["*"]	\N	\N	2024-12-06 15:05:04	2024-12-06 15:05:04
51	App\\Models\\User	52	api_token	eadede43691f0c03970273ce2d832da3f132bdb3e2a0eecaefedc40f082099f1	["*"]	\N	\N	2024-12-06 16:07:32	2024-12-06 16:07:32
52	App\\Models\\User	53	api_token	5905cd898d1efc4403a594a602468517e0c1abc0de084c68415916f89ff9d3cb	["*"]	\N	\N	2024-12-06 16:16:44	2024-12-06 16:16:44
53	App\\Models\\User	56	api_token	340df4c07a757ea4b828cbb756b67bf277ce11c5800ee5aa8f164a3b8bfef5fa	["*"]	\N	\N	2024-12-06 16:17:44	2024-12-06 16:17:44
54	App\\Models\\User	47	api_token	c8431e2f34b780ae332fcefd76770f0a196f8a50eeac3fada95ca75b5184cdbf	["*"]	\N	\N	2024-12-06 16:25:36	2024-12-06 16:25:36
55	App\\Models\\User	56	api_token	ec99b9186a16ca6bb9f13ae6a84ccc857a2a417841b5fac57d68542738937d3a	["*"]	\N	\N	2024-12-06 16:46:50	2024-12-06 16:46:50
56	App\\Models\\User	57	api_token	cee27f1bb0ac621f740f8140cbd5cf2aedef39a5cdbe33fc2b6ad7a01f16ab85	["*"]	\N	\N	2024-12-06 19:48:34	2024-12-06 19:48:34
57	App\\Models\\User	58	api_token	d87447873275cad7b37332430a1ebe8f146d008a70831b5fbb2e60d828905e84	["*"]	\N	\N	2024-12-06 20:16:40	2024-12-06 20:16:40
58	App\\Models\\User	52	api_token	e76306acaf131ce6a667c83da96e7b20bfacef08c9b51577aabfb9eec6e222bf	["*"]	\N	\N	2024-12-06 23:03:05	2024-12-06 23:03:05
59	App\\Models\\User	52	api_token	01e47a9174028041da1b166882e04ed56878d195f3ae6be31495420430ab7be3	["*"]	\N	\N	2024-12-06 23:22:13	2024-12-06 23:22:13
60	App\\Models\\User	52	api_token	b7b87eb9beaeff2d0090ea2e581fa0a86fece161d618158396ef9ec2f5e0f9ec	["*"]	\N	\N	2024-12-06 23:34:57	2024-12-06 23:34:57
61	App\\Models\\User	58	api_token	09dd11099173d748b51a8680494925a6a616f70513b979adcda94dc351707fad	["*"]	\N	\N	2024-12-06 23:48:26	2024-12-06 23:48:26
62	App\\Models\\User	58	api_token	43ef1be9fe64dce07ba568b2c3bbe1be96799c895459e975ee4e3c0f6ec7865f	["*"]	\N	\N	2024-12-06 23:55:28	2024-12-06 23:55:28
63	App\\Models\\User	59	api_token	fe139b798cb8ceb33f2c9261392fbcff485fe10210ce8ddfa7da5619e77dc3d9	["*"]	\N	\N	2024-12-06 23:59:38	2024-12-06 23:59:38
64	App\\Models\\User	60	api_token	b834a6063d97fe30e2f3d85b40578671fcd728d941a748f553e84136aa686c8a	["*"]	\N	\N	2024-12-07 00:06:33	2024-12-07 00:06:33
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

COPY public.settings (id, caby_commission_percentaqge, driver_commission_percentaqge, created_at, updated_at, target_order_count, target_order_complete_amount) FROM stdin;
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: temp_bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_bookings (id, user_id, booking_code, pickup_latitude, pickup_longitude, dropoff_latitude, dropoff_longitude, pickup_location_name, dropoff_location_name, vehicle_type_id, payment_type, base_fare, rta_commssion, rate_per_km, total_km_charge, total_charge, amount_to_pay, wallet_amount_used, rate_id, distance_km, time_needed, needed_date, need_time, currency_code, driver_instructions, friend_name, friend_phone_number, created_at, updated_at, coupon_code, coupon_id, coupon_discount, is_scheduled, sur_charge, waiting_charge_per_min, waiting_charge, caby_commission) FROM stdin;
37	8	CB1732809673	25.2048	55.2708	25.2567	55.3643	dubai	dubai airport	2	1	15	10	20	379.2	404.2	404.2	0	2	18.96	28 mins	2024-11-28	15:20:00	AED	airport cehcking time to fast	sooraj	+919847823799	2024-11-28 16:01:13	2024-11-28 16:01:13	FREERIDE2	0	0	1	0	0	0	0
196	51	CB1733487036	25.188161758059703	55.230161771178246	25.1974379	55.2743373	Majlis Al Ghoreifa - Jumeirah - Jumeirah 3 - Dubai - United Arab Emirates,	Malls Dubai Mall	1	2	10	5	15	125.4	140.4	140.4	0	1	8.36	13 mins	2024-12-06	16:10:00	AED	\N	\N	\N	2024-12-06 12:10:36	2024-12-06 12:10:36		0	0	0	0	10	0	5
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
64	\N	\N	\N	971	134134134		feVJn7s-RbmiOMtbnrxVMg:APA91bG7yjyGkOAGpgBjOdPlbF4N2wxxoGnY8n_EoSJ2n4ciSZqDZPluxgAIGZukByzR-KpOVY33OLRMXwRjwOxB_LZyUfLtDKI8aJf5UAUT26PE2UnfDjo	\N	\N	\N	3	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-06 14:17:24	2024-12-06 14:17:28	\N	\N	3	\N
47	Usama Shakeel	uy@j.com	\N	971	373166467		ey3zQAOkRR6JywQapz-9aA:APA91bFeeyk8gupYyLcE8OIO_rpGqKUUXvBioZZdXxlwSk6bjeKbN5WDk7rVTyUVv1aN5B6mWjBMPSrs14Dnz9nUm3BTMOcHCbMx93bX2wpRTECC1JnCGKI	\N	1733132693674d8195eb913.jpg	2024-12-01	1	7	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-02 09:44:53	2024-12-02 09:44:53	Usama	Shakeel	4	CBD181733132693
48	\N	\N	\N	971	213184545454	1111	\N	\N	\N	\N	3	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-04 01:10:26	2024-12-03 21:10:26	\N	\N	3	\N
49	\N	\N	\N	971	81343434455	1111	\N	\N	\N	\N	3	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-04 01:15:43	2024-12-03 21:15:43	\N	\N	3	\N
50	\N	\N	\N	971	484455455454	1111	\N	\N	\N	\N	3	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-04 01:18:49	2024-12-03 21:18:49	\N	\N	3	\N
55	\N	\N	\N	92	3315002705	1111	\N	\N	\N	\N	3	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-04 21:37:09	2024-12-04 17:37:09	\N	\N	3	\N
66	\N	\N	\N	971	222222222		elPoYB9kTvyAxx-DS4Sf1f:APA91bFtS7de3xzlVZy_Pzbd5cYS9ZS8SMvADmpCCWmgboJ-_jaMfcL7Ah8uUgw9Y1FUmBaN42hT8-EOkD_JI3l96YzpiVHyokJV0f-gBuONn-vB8lTHe9o	\N	\N	\N	3	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-06 14:30:35	2024-12-06 14:30:38	\N	\N	3	\N
67	\N	\N	\N	971	369369369		feVJn7s-RbmiOMtbnrxVMg:APA91bG7yjyGkOAGpgBjOdPlbF4N2wxxoGnY8n_EoSJ2n4ciSZqDZPluxgAIGZukByzR-KpOVY33OLRMXwRjwOxB_LZyUfLtDKI8aJf5UAUT26PE2UnfDjo	\N	\N	\N	3	0	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-06 14:44:58	2024-12-06 14:45:02	\N	\N	3	\N
68	Usama Shakeel	ii@gmail.com	\N	971	478478478		feVJn7s-RbmiOMtbnrxVMg:APA91bG7yjyGkOAGpgBjOdPlbF4N2wxxoGnY8n_EoSJ2n4ciSZqDZPluxgAIGZukByzR-KpOVY33OLRMXwRjwOxB_LZyUfLtDKI8aJf5UAUT26PE2UnfDjo	\N	17334835926752dc4877be0.jpg	2024-12-05	2	18	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-06 11:13:12	2024-12-06 11:13:12	Usama	Shakeel	4	CBD61733483592
\.


--
-- Data for Name: tip_amounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tip_amounts (id, booking_id, driver_id, user_id, payment_type, tip_amount, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, user_code, name, email, email_verified_at, password, dial_code, phone, user_phone_otp, user_device_token, firebase_user_key, access_token, role, status, deleted, user_image, dob, gender, company_id, remember_token, created_at, updated_at, first_name, last_name, latitude, longitude, hide_profile, is_verified, wallet_amount, avg_rating, rated_users, deleted_at) FROM stdin;
1	\N	Admin	admin@admin.com	\N	$2y$12$x0uvl6ysyThjRUnIXBuJe.LkcbYW1Dk5N98NxoeM0tyrCGOs6HCs6	971	112233445566778899	\N	\N	\N	\N	1	1	0	\N	\N	3	0	\N	\N	2024-11-11 09:56:40	\N	\N	\N	\N	0	0	0	0	0	\N
12	CBD181731922004	Usama Shakeel	ushakeel010@gmail.com	\N	\N	971	331245433	\N	esiJzS_VSIS05x-2wVep_b:APA91bHq3QIimlkWi-sy4g-nk8NrubhFaBhallai_d0SITLNaC0AhEbdPsc0ByyEsZ5AIfm5DknFBd6USUsgpAHE03QXOYa81Xu7C_37hv6YYnzCoNFCwHE	-OByaSoozUw8yvy6Y4iy	9|7OYtMiprZvZZVzaf6WvvcOVVfC6Kk15i3pMNhvct563ec1ea	4	1	0	1731922004673b08543d7ad.jpg	\N	3	0	\N	2024-11-18 09:28:10	2024-11-18 09:28:11	Usama	Shakeel	25.7128	-55.006	0	0	0	0	0	\N
19	CBU81732266985	User Cabby	cabby@gmail.com	\N	\N	971	561660144		fhyh_iAxTrurW_9UOKujJq:APA91bHovQqbgB4KPOwoS6XreLhzZjVfgRxPv7MXgyBFZG7xMNyodHYCeh5-5Z-jMgWkRSGU41Px-RR6jsrdO7M1p35fI_9Wk7jCZLTxfwqo3So2pKyacD8	-OCI97jI0UAKox6448zI	14|8KRPfSnmaXH5ZNu0oJFEpncdXSl9BCRtcuKmrVW5e0962aa5	3	1	0	\N	\N	3	0	\N	2024-11-22 09:16:25	2024-11-23 05:58:03	User	Cabby	\N	\N	0	0	0	0	0	\N
6	CBU121731410137	Sooraj Sabu	sooraj.a2solution+2@gmail.com	\N	\N	971	9847823799		111111111	-OBxU27ZpkGcRtv6fAeI	4|4H5qrz2qnINmA8gLkadLCi6GPqz2vpeYE1OE83Rb3dc639b3	3	1	0	\N	\N	3	0	\N	2024-11-12 11:15:37	2024-11-29 21:02:09	Sooraj	Sabu	25.7128	-55.0060	0	0	0	0	0	\N
10	CBU121731903412	dev de	dev@dev.com	\N	\N	971	808524456	\N	111111111	-OBxUCjJsDxkbkKfUiu7	7|17BzvF9Rybi3yz0tWmnlJOHDTadM1if7i38lUYjue96d5b19	3	1	0	\N	\N	3	0	\N	2024-11-18 04:16:52	2024-11-18 04:16:53	dev	de	\N	\N	0	0	0	0	0	\N
14	CBD201731927371	Sooraj Sabu	sooraj@yopmail.com	\N	\N	971	505865875		eQM18LTcRHabGtjh8kDxI9:APA91bHfnfFfmFhLZQv8RbX4R0sdzYV23ifG0gigfFqjIPY5-BiXjB9twCY2GJS1-3Ml3AMH8eZV2yoPjWehI0m42O-2b-iUqpZoO34hrSm-M8rjs7a34CA	-OByurMjfI0ZoaVVo4fT	11|3k6dw2g8uaFvPICHDb9ERxGp6CappAPKugS8Q4rKcde4707c	4	1	0	1731927371673b1d4b30104.jpg	\N	3	0	\N	2024-11-18 10:57:18	2024-12-05 11:22:19	Sooraj	Sabu	9.85655	76.6510898	0	0	0	0	0	\N
29	CBD191732859044	Usama Shakeel	ushak@gmail.com	\N	\N	971	331500246	\N	ey3zQAOkRR6JywQapz-9aA:APA91bFeeyk8gupYyLcE8OIO_rpGqKUUXvBioZZdXxlwSk6bjeKbN5WDk7rVTyUVv1aN5B6mWjBMPSrs14Dnz9nUm3BTMOcHCbMx93bX2wpRTECC1JnCGKI	-OCqRyCjDTpCX0puO4S0	20|U1yUgJ9m5qRKOWj46nsb6kX0r9QnWgNVXBafIocL24081245	4	1	0	1732859044674954a4c68c5.jpg	\N	3	0	\N	2024-11-29 05:45:25	2024-11-29 09:45:26	Usama	Shakeel	33.6346754	73.0578023	1	0	0	0	0	\N
17	CBU21732263543	Anil Navis	anilnavis@gmail.com	\N	\N	971	564005096		cHKaBkcSQ3u7B2yT0Ef0Qt:APA91bHtWUPm8Jh0frCFknw619zTEFohLa4mE3OMRaguWTgUgebmuORlb7Or-Ml6nnfqAv_67IJuUgHo58DTI5syq3i1JmcADizqttEEteFiuNSQe53W2Uo	-OCHx-MfVlKWHB_cGUrx	13|wkoEXuAXeFROA8x4cSvJxbrJ9VRw37Hdt9gKxExz8bf2cec4	3	1	0	\N	\N	3	0	\N	2024-11-22 08:19:03	2024-11-30 06:45:31	Anil	Navis	\N	\N	0	0	0	0	0	\N
11	CBD111731911066	Usama driver	usama@yopmail.com	\N	\N	971	984782372	\N	234234234	-OByOnql6a2bC3V4WnY4	8|VVA8ORKAyPrbSY83QSeeQZGK1vVFTv4K0RJnQeei2464ecae	4	1	0	1731911066673add9a81b93.jpg	\N	3	0	\N	2024-11-18 08:32:52	2024-11-18 08:32:53	Usama	driver	\N	\N	0	0	0	0	0	\N
18	CBU201732263929	Al Falasi Luxury Transport	j@yy.com	\N	$2y$12$rI8m5nNV7OsDxlVyzue3yePOuKo8/X0rsWVElFVJq6T387KniRy3G	971	8758785885	\N	\N	\N	\N	5	1	0	1732264108674040ac389cc.jpg	\N	3	2	\N	2024-11-22 08:28:28	2024-12-02 16:18:18	\N	\N	\N	\N	0	0	0	0	0	\N
7	CMP-122	Al Ghazal Transport Co	cmp@cmp.com	2024-11-13 10:35:54		971	50505055	1111	device			5	1	0	\N	\N	3	1	\N	2024-11-13 10:35:54	2024-12-02 16:20:06	\N	\N	\N	\N	0	0	0	0	0	\N
23	CBU171732511816	Sooraj S Sabu	soorajsabu@yopmail.com	\N	\N	91	9847823799		c0nBJPpsSY2dTHJIiac8_7:APA91bEAb--2t2ozip0SI__zCQzidvKbvxBdBe7tNQvfKdXa-e41B1tPEJk4S3obdltuOvL4I2wDp8RJIcIjlwZyAVfCdi_AxkvArARP0XCJcpMYcMGJGNk	-OCWk4veF3xFuIt9Bxlw	16|pvd6SXNYwJbHCbbzmd0bkM5SHRsiEMM3rFe9CPhJf6c747ce	3	1	0	17334190806751e04864e75.jpg	1993-08-20	1	0	\N	2024-11-25 05:16:56	2024-12-05 17:18:00	Sooraj S	Sabu	\N	\N	0	0	0	0	0	\N
28	CBU101732822815	moin ahmed	test11@gmail.com	\N	\N	971	9847823796	\N	abdhjef ekef kjwf wedfw	-OCoHSEjXwClRW_N5a9e	19|bxCpWwFNJCTRiyOjn1bLy04CykEwpF8IyhW5965A17dcfbe6	3	1	0	\N	\N	3	0	\N	2024-11-28 19:40:15	2024-11-29 16:39:15	moin	ahmed	\N	\N	0	0	0	0	0	\N
22	CBU41732507969	Rakesh K A	rakeshdxbapps@hotmail.com	\N	$2y$12$duADe26y5U0eOd/Y5TupQOylbsnh8vyv0O0bkNG0mpUBEGN5IL0le	971	1234567890	\N	\N	\N	\N	3	1	0	17325080946743f9be5c3aa.jpg	1990-05-26	1	0	\N	2024-11-25 04:14:54	2024-11-26 14:19:03	Rakesh	K A	\N	\N	0	0	0	0	0	\N
20	CBU31732275420	Usama Shakeel	ushake@gmail.com	\N	\N	971	331500245	\N	c5rKR2v0RLqUzc4DrpgvB3:APA91bE2Z8R0_CgIevA95RXaLUYOb0aOC25DAaELZlgEaFeMahUwFdmwKfBqp3CShXHUKKc8uD4Q-PezDrcnQ9UZ_HHr7uYRHeSslKXZgG2G_AHOzfVtILU	-OCIeJ1NkNHgKe0mYncO	15|sNug8TK698gG3DmzrLthIRBZy6yd1gmlFTsm3e3M3bf12306	3	1	0	\N	\N	3	0	\N	2024-11-22 11:37:00	2024-11-22 11:37:01	Usama	Shakeel	\N	\N	0	0	0	0	0	\N
24	CBD171732616542	Aurora Kinney	rofym@mailinator.com	\N	$2y$12$rJDmukKJbRVxY8oV6qoEPeYHLLPcbFsNbMmi.XKEI2z35FPR7xOfe	971	881424242	\N	\N	\N	\N	4	1	0	17326166226745a1aeef561.jpeg	2007-11-14	2	2	\N	2024-11-26 14:23:42	2024-11-26 14:23:42	Aurora	Kinney	\N	\N	0	0	0	0	0	\N
27	CBU181732822391	a b	test10@gmail.com	\N	\N	971	9847823790	\N	abdhjef ekef kjwf wedfw	-OCoFptciajP_4LIbyrc	18|Pfp9zQE3ykVbUHagUqexjBCcKF1FwJiHhYXwnu5M61277f86	3	1	0	\N	\N	3	0	\N	2024-11-28 19:33:11	2024-11-28 23:33:12	a	b	\N	\N	0	0	0	0	0	\N
15	CBU141732021098	Usama Shakeel	ushakeel@gmail.com	\N	\N	971	331500275		e7nY81-bR_CMiMaOfitw5_:APA91bG0LfzP-dYWzw1Lbq2VZKNG7kAiMNl8lroxVH6pZM3vzMVwWe2xrzrdv3PG6XAPkcAUuv5pRll14TdeLqrdrugCPna1Nv5dhRvKqa2wcmcISFQtRJk	-OC3V8Z8AgGCnvnO12n_	47|0nKX2phmVNRzzumSd0XKKIozgsnKAeY4v0KnAvT02429664f	3	1	0	1732960222674adfde39088.jpg	2024-11-29	2	0	\N	2024-11-19 12:58:18	2024-12-06 18:17:52	Usama	Shakeel	\N	\N	0	0	94348.1	0	0	\N
31	CBU91732900924	abc test	test91@gmail.com	\N	\N	971	523484545454	\N	abdhjef ekef kjwf wedfw	-OCswQ0KBktPKsD9_9CY	21|f9XETm7hlTkJ5OqAcbY88Ywxu0K8LqSTQmncuG0s56d41041	3	1	0	1732910407674a1d4794b7b.jpg	2007-11-29	1	0	\N	2024-11-29 17:22:04	2024-11-29 20:21:51	abc	test	\N	\N	0	0	0	0	0	\N
13	CBD181731922200	Usamaa Shakeel	ushakeel0@gmail.com	\N	\N	92	3315002750		cewmuGFlTmW7BOgtAFyk1d:APA91bHvSuj-6APwf8zf_5RoBI_0qLGjtJwtXLfaKOaDZhZ7HSudxOJuA8kUrYlBKc97YC17rOyEbtmMZ4Zcgnnb0lkGHHsRYc6JU3gr_D8GOqKVl8WYqNI	-OBybzhceTrGJKyP6KKw	10|V0Xd5uIJOcZ7dVvtlfb5P9Lnkil1VTq4DgmhWv43ee8f5469	4	1	0	1731922200673b0918a0f4e.jpg	2024-12-04	1	0	\N	2024-11-18 09:34:51	2024-12-05 17:47:10	Usamaa	Shakeel	33.6346839	73.0578136	1	0	0	0	0	\N
32	CBU161732949325	Anil Navis	cv@vbb.com	\N	\N	971	800800800	\N	cHKaBkcSQ3u7B2yT0Ef0Qt:APA91bHtWUPm8Jh0frCFknw619zTEFohLa4mE3OMRaguWTgUgebmuORlb7Or-Ml6nnfqAv_67IJuUgHo58DTI5syq3i1JmcADizqttEEteFiuNSQe53W2Uo	-OCvp2UdusrY-e_SQVlj	22|TfRRq55qCREiXL5mYm4Z6XNzcwXsqbjxT7dRkPpx7d4ab66e	3	1	0	\N	\N	3	0	\N	2024-11-30 06:48:45	2024-11-30 10:48:45	Anil	Navis	\N	\N	0	0	0	0	0	\N
35	CBU11732958566	Anil navis	b@b.com	\N	\N	971	22552255	\N	abdhjef ekef kjwf wedfw	-OCwNIZiY027pApSSGsf	25|3pQSmF2XLIS0KHLOpG1kfYM6KKqxUJtFBHx3OdbY24fa14c3	3	1	0	1732958606674ad98e1dc9b.jpg	2024-11-30	1	0	\N	2024-11-30 09:22:46	2024-11-30 09:23:52	Anil	navis	\N	\N	0	0	0	0	0	\N
36	CBU11732962520	Jon’s Smith	u@u.com	\N	\N	971	123123123		e7nY81-bR_CMiMaOfitw5_:APA91bG0LfzP-dYWzw1Lbq2VZKNG7kAiMNl8lroxVH6pZM3vzMVwWe2xrzrdv3PG6XAPkcAUuv5pRll14TdeLqrdrugCPna1Nv5dhRvKqa2wcmcISFQtRJk	-OCwbO0yBrdjVTxhDtK_	48|ijnFr7bhoiPXZYUALsquMC5xbqPfjUKeAMh7yQDTa3804659	3	1	0	1732962758674ae9c6b1ff5.jpg	2024-11-29	2	0	\N	2024-11-30 10:28:40	2024-12-07 01:03:14	Jon’s	Smith	\N	\N	0	0	97170.5	0	0	\N
26	CBU141732789170	Guest hhh	guesthhh@gmail.com	\N	$2y$12$VX9YzF0zeRAqp3ObGIKqIuJWsC2X2EAHeBOLg3AvEec/DRgknwlvy	971	561660100		elPoYB9kTvyAxx-DS4Sf1f:APA91bFtS7de3xzlVZy_Pzbd5cYS9ZS8SMvADmpCCWmgboJ-_jaMfcL7Ah8uUgw9Y1FUmBaN42hT8-EOkD_JI3l96YzpiVHyokJV0f-gBuONn-vB8lTHe9o	-OCvoxPBu4qpyOAPU1sM	43|3LtbwujOgKVqBAyQGH8brplXZHY5gVNmh98UJ1Jf9395dbd3	3	1	0	1732789222674843e6eaa96.png	1998-12-30	1	0	\N	2024-11-28 14:20:22	2024-12-06 14:13:34	Guest	hhh	\N	\N	0	0	0	0	0	\N
41	CBU201733262209	baja ja	test21@gmail.com	\N	\N	971	484545454845	\N	abdhjef ekef kjwf wedfw	-ODDTbLLrtxxkJTGbKAu	31|QjcGUzos2Sm17ugGsgX4gmZcp6pgnE0ZgayKyjql90e0559f	3	1	0	\N	\N	3	0	\N	2024-12-03 21:43:29	2024-12-04 01:43:30	baja	ja	\N	\N	0	0	0	0	0	\N
38	CBD71733053131	Anil Navis	anildriver@gmail.com	\N	\N	971	523243163	\N	c_jUDC0mTqOPR-a5KJSbae:APA91bEYVm3PKH46yg1XttPZP5M4_eNWFxYbe4GoYXVvpEMIwWgMH39lRV_m66qijjxJj1EP98GVc0K7e8Hqdb0hcUwORfW0q_lGWAosG0x_bHiRqbSaPsU	-OD14XR9O1EnPvZ5Lmdd	28|exYYCcWIAmU9FRa5XdVV5xMro6CpDOeUHXm4q2pweb6c4d64	4	1	0	1733053131674c4acb0b182.jpg	\N	3	0	\N	2024-12-01 11:58:29	2024-12-01 15:58:30	Anil	Navis	25.2869676	55.3714098	0	0	0	0	0	\N
56	CBD71733480714	Usama Shakeel	uy@gmail.com	\N	\N	971	456456456		d1aUWX9oSLCQd0PTupaFEj:APA91bGEnoA30oG2rLdttVztZJq2R3JRjX9v1aDhPfzuva1hVycYI6me7QjIoLADvwMT3U-By4CbVw7Dc6N76pVc392xdvY5kaBgInfC2vv74zrQC9gGB4U	-ODQVQR6tzZKVw0q4mot	55|SOJ2Ul38UpdIT6LiJPqG7WmarXWR4GJSQtSkW66A918d10d2	4	1	0	17334807146752d10a50ba2.jpg	\N	3	0	\N	2024-12-06 10:26:29	2024-12-06 16:46:50	Usama	Shakeel	25.1842618	55.260035	0	0	0	0	0	\N
42	CBU81733298888	anil navis	anil@dxbusinessgroup.com	\N	\N	971	8075244766	\N	abdhjef ekef kjwf wedfw	-ODFeXAkQWudcDlNab_f	32|z2FWPVGMY8scs848FrbQzE46JqEx2FzUPtwOFnbd535f93a8	3	1	0	\N	\N	3	0	\N	2024-12-04 07:54:48	2024-12-04 17:20:25	anil	navis	\N	\N	0	0	0	0	0	\N
37	CBU21732996496	Jasonn Smith	k@kk.com	\N	\N	971	124124124		dEKYiqsHTDiGkvYSK85jLW:APA91bFqtVA_kNybj6cauBBERPAIIVdf8XnVxYIVogC-_UbUm1gZCNHcz9eVNZvl2cZ2zQfvfF0BrZE1Q1LlnBSFjDSHhUfwQq7rRg-r8SoZWoXyOVW_1sQ	-OCyczwIfNvyzhms7c5P	27|jXVtnxmn3ZGhiaPGWvkhwQ18iOLr3G3Ls59mDKeu0e37fd09	3	1	0	173329642067500124a90fb.jpg	\N	2	0	\N	2024-11-30 19:54:56	2024-12-04 07:13:40	Jasonn	Smith	\N	\N	0	0	0	0	0	\N
46	CBU121733327566	abc test	test22@gmail.com	\N	\N	971	846433154545	\N	cPfFMTznukvaotEw7aqMes:APA91bE7rV_jd4fZ5dmJJ3dbObNuxYS7Tm9OSyE_zXTYqqrRMZB-_xMGduYIfRJUHCEAWYn7aTacAs99DVpcCF1QO4vGw65S_smbd5YPSWydiabUuDn3V1A	-ODHMvb0AoS0FYP_EI2M	34|EH7OBjFhrqVCJ913rROgUh4CmqFLammGYA8MhX5B211af13f	3	1	0	\N	\N	3	0	\N	2024-12-04 15:52:46	2024-12-04 19:52:47	abc	test	\N	\N	0	0	0	0	0	\N
53	CBU181733469718	Usama Shakeel	oi@gmail.com	\N	\N	971	132132132		dqliGVEwQiqi2RwG7PvDxG:APA91bEBJEfiFSvZvNBdPCfZFVhVxuG5CvJB89oSG3CrABa-2qmZ97gwN5DOu48j5PcLCY92ygXuumzaVb0oN_vKEOA3MEskfo5uP5a2VrxATgbMqFYpnG8	-ODPqBg_wzMOqosal0VG	52|FUz1whFBlrQDEwzabBs8NfZII9sixTbd4bGl9QXN8d14c45d	3	1	0	\N	\N	3	0	\N	2024-12-06 07:21:58	2024-12-06 16:16:44	Usama	Shakeel	\N	\N	0	0	-39	0	0	\N
57	CBU101733500114	abc ab	test23@gmail.com	\N	\N	971	851318454515	\N	cPfFMTznukvaotEw7aqMes:APA91bE7rV_jd4fZ5dmJJ3dbObNuxYS7Tm9OSyE_zXTYqqrRMZB-_xMGduYIfRJUHCEAWYn7aTacAs99DVpcCF1QO4vGw65S_smbd5YPSWydiabUuDn3V1A	-ODRe8Zxi8nucP4lCFiv	56|c6LD6gttYQqA1ZOWEU5VChMR4VDwRDQo2s8VbHsa6ce7ca7b	3	1	0	\N	\N	3	0	\N	2024-12-06 15:48:34	2024-12-06 19:48:35	abc	ab	\N	\N	0	0	0	0	0	\N
50	CBD21733394905	Hiba Ejaz	h@gmail.com	\N	\N	971	123456789		cuCKHz-4TY6uTpkwXKP0m3:APA91bE95fYcyc0jLSIs1hSUS3evpb8Avm4a5dg4wdTnrtnBODIYrxO-jqewMFtiJ1Gb67hvahojjcWDbNfQmQYKylbtMX0ytJMsvVaF-ZkxgKZ_l6496nc	-ODLPT1UgEDZ6YZrU66y	38|wq4J8dKL0TATlO7tvUUAuD9uhvvw53ZhcIi2EBsrfe862c8a	4	1	0	1733394905675181d957997.jpg	\N	3	0	\N	2024-12-05 10:42:20	2024-12-06 07:28:45	Hiba	Ejaz	25.184264	55.2600328	0	0	0	0	0	\N
51	CBU151733461431	Anil Navis	anil1@dxbusinessgroup.com	\N	\N	971	900900900		dqliGVEwQiqi2RwG7PvDxG:APA91bEBJEfiFSvZvNBdPCfZFVhVxuG5CvJB89oSG3CrABa-2qmZ97gwN5DOu48j5PcLCY92ygXuumzaVb0oN_vKEOA3MEskfo5uP5a2VrxATgbMqFYpnG8	-ODPL_MDpPPpGqh1SejP	39|yZQNE5dPbQQY3KlTPp4DA6prw0fcVPJDt4L3gkm4058eec4a	3	1	0	17334616636752869f1a181.jpg	\N	1	0	\N	2024-12-06 05:03:51	2024-12-06 07:30:22	Anil	Navis	\N	\N	0	0	0	0	0	\N
60	CBD201733515522	Hw Uw	test112@gmail.com	\N	\N	92	3325408401	\N	cvdiYBsfRvyJLQ0kw7szLN:APA91bGnD3dNO5aC-nL-ndYL0k0Wo2vEAMAohoiXeNQ5kIepp8lVg2fJ2dFmvLDQfUVf3ybnRrVSBbHJZJ3NL5z1iL614CLZHnEpr38tGPNLZYJrHvLlHJ4	-ODS_BXpsbahu7VJvucY	64|NHLbBL9y7kuRAI5GlBgMg0CUj16khdDMTXlUvEPAa7f62850	4	1	0	173351552267535902a6dbb.jpg	\N	3	0	\N	2024-12-06 20:06:33	2024-12-07 00:06:34	Hw	Uw	33.52455	73.11124	0	0	0	0	0	\N
59	CBD81733515092	Test Test	test111@gmail.com	\N	\N	92	3325408408	\N	cvdiYBsfRvyJLQ0kw7szLN:APA91bGnD3dNO5aC-nL-ndYL0k0Wo2vEAMAohoiXeNQ5kIepp8lVg2fJ2dFmvLDQfUVf3ybnRrVSBbHJZJ3NL5z1iL614CLZHnEpr38tGPNLZYJrHvLlHJ4	-ODSYbJfDL-vM34mV8L_	63|L6ddFfvXMIHOwR9ijqj2z5EIk7jUprKgOPuLRz2U9c70d244	4	1	0	1733515092675357541dc89.jpg	\N	3	0	\N	2024-12-06 19:59:38	2024-12-06 23:59:39	Test	Test	33.5163825	73.110782	0	0	0	0	0	\N
39	CBD21733121316	Usama Shakeel	i@gmail.com	\N	\N	971	125125125		feVJn7s-RbmiOMtbnrxVMg:APA91bG7yjyGkOAGpgBjOdPlbF4N2wxxoGnY8n_EoSJ2n4ciSZqDZPluxgAIGZukByzR-KpOVY33OLRMXwRjwOxB_LZyUfLtDKI8aJf5UAUT26PE2UnfDjo	-OD54Ts-Hkwlo6JsN3hw	49|EI2ga95LJtREx7L21ojwlquh8FbwT4izWpso5vOu83962a62	4	1	0	1733121316674d552442231.jpg	2024-12-05	1	0	\N	2024-12-02 06:36:43	2024-12-06 15:03:20	Usama	Shakeel	33.6346827	73.0578008	1	0	0	0	0	\N
58	CBD111733501700	Zain Test	driver10@gmail.com	\N	\N	92	3325408407		ejFLg_SjQCu6sA4yLO_Qfs:APA91bEvoi7yvC8hgs8_42uVtr9slQjfAzCBNwdQw0adlKvwvZ5tDV7j7wSkRmrBuRbox_G8MI7R09RlGa7IKJI5nCND8oMcRu07kQDADj2Cpng_lsEbEyM	-ODRk_GmOA1TiB2_uimv	62|FKx0ozaY4I3ONXroyKkHABWGUObcKEDHi7LT7tpf4d03e80c	4	1	0	173350170067532304e7d5e.jpg	\N	3	0	\N	2024-12-06 16:16:40	2024-12-06 23:55:28	Zain	Test	33.5164345	73.1108295	0	0	0	0	0	\N
47	CBU191733387849	Dxb Cabby	dxbcabby@gmail.com	\N	\N	971	561660133		elPoYB9kTvyAxx-DS4Sf1f:APA91bFtS7de3xzlVZy_Pzbd5cYS9ZS8SMvADmpCCWmgboJ-_jaMfcL7Ah8uUgw9Y1FUmBaN42hT8-EOkD_JI3l96YzpiVHyokJV0f-gBuONn-vB8lTHe9o	-ODKxt5ZdEeJziYj5yA6	54|Pf3o08JTH9RaPmgH1QbZrkTW9YE5WsUoN8RT7hHZ08fddec1	3	1	0	\N	\N	3	0	\N	2024-12-05 08:37:29	2024-12-06 16:25:36	Dxb	Cabby	\N	\N	0	0	0	0	0	\N
52	CBD161733469364	Usama Shakeel	op@gmail.com	\N	\N	971	126126126		eoFtrq3gQgi9A_i2jtZRiT:APA91bHTUPNdXdavsves-JwTNzLMuqIxRUUK01lgmrDeHlS3hsyp1zfryoSgloVARQY6yODQxeFFouoWZlfIWgDI1KPvybQGYxqhmSmdWOgo5ncRyIYImqs	-ODPp9qeNrcwkl4wn8hQ	60|RGh36VqsdlnXa6A7MjLTqMKvBLl9jyzmOWuDcxUad82132e0	4	1	0	17334693646752a4b488bd2.jpg	2024-12-05	1	0	\N	2024-12-06 07:17:28	2024-12-06 23:34:57	Usama	Shakeel	33.6346503	73.0578077	0	0	0	0	0	\N
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
6	Ford	17333007426750120665c4e.png	1	2024-12-04 12:24:08	2024-12-04 12:25:42	\N
\.


--
-- Data for Name: vehicle_models; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle_models (id, name, vehicle_make_id, status, created_at, updated_at, deleted_at) FROM stdin;
2	m2	2	1	2024-11-13 11:16:11	2024-11-13 11:16:11	\N
3	asda	2	0	2024-11-14 03:54:29	2024-11-14 03:54:37	2024-11-14 03:54:37
5	picnto	3	1	2024-11-22 08:45:11	2024-11-22 08:45:11	\N
6	Civic	5	1	2024-12-01 15:52:05	2024-12-01 15:52:05	\N
7	Escape	6	1	2024-12-04 12:26:47	2024-12-04 12:26:47	\N
4	2014-1111	3	1	2024-11-21 12:47:33	2024-12-04 12:27:15	2024-12-04 12:27:15
1	2015	1	1	2024-11-13 11:16:03	2024-12-05 16:40:31	2024-12-05 16:40:31
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
7	9	Max	1732957808674ad67037c52.png	1733286104674fd8d883c59.png	1	2024-11-30 13:10:08	2024-12-04 08:21:44	\N
8	8	Kids	1732957865674ad6a97398b.png	1733286087674fd8c70d55b.png	1	2024-11-30 13:11:05	2024-12-04 12:14:40	\N
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
32	37	credit	71.8	cancellation refund for the booking #CB1733294599	2024-12-04 06:44:24	2024-12-04 06:44:24
33	37	debit	71.8	used for the booking #CB1733296140	2024-12-04 07:09:01	2024-12-04 07:09:01
34	15	debit	58.4	used for the booking #CB1733307377	2024-12-04 10:16:18	2024-12-04 10:16:18
35	15	debit	58.6	used for the booking #CB1733315708	2024-12-04 12:35:09	2024-12-04 12:35:09
36	15	debit	46.4	used for the booking #CB1733327924	2024-12-04 15:58:45	2024-12-04 15:58:45
37	15	debit	47.4	used for the booking #CB1733328113	2024-12-04 16:01:54	2024-12-04 16:01:54
38	15	debit	62	used for the booking #CB1733328189	2024-12-04 16:03:09	2024-12-04 16:03:09
39	15	debit	49	used for the booking #CB1733328286	2024-12-04 16:04:47	2024-12-04 16:04:47
40	36	debit	53.6	used for the booking #CB1733328511	2024-12-04 16:08:31	2024-12-04 16:08:31
41	36	debit	41	used for the booking #CB1733328665	2024-12-04 16:11:06	2024-12-04 16:11:06
42	36	debit	41.8	used for the booking #CB1733332885	2024-12-04 17:21:26	2024-12-04 17:21:26
43	36	debit	41.8	used for the booking #CB1733333250	2024-12-04 17:27:30	2024-12-04 17:27:30
44	36	debit	62.4	used for the booking #CB1733333307	2024-12-04 17:28:28	2024-12-04 17:28:28
45	36	debit	44.8	used for the booking #CB1733333441	2024-12-04 17:30:42	2024-12-04 17:30:42
46	36	debit	53.2	used for the booking #CB1733333764	2024-12-04 17:36:05	2024-12-04 17:36:05
47	36	debit	58	used for the booking #CB1733333867	2024-12-04 17:37:48	2024-12-04 17:37:48
48	36	debit	52.6	used for the booking #CB1733379686	2024-12-05 06:21:26	2024-12-05 06:21:26
49	36	debit	46.8	used for the booking #CB1733379762	2024-12-05 06:22:42	2024-12-05 06:22:42
50	15	debit	52	used for the booking #CB1733379912	2024-12-05 06:25:13	2024-12-05 06:25:13
51	15	debit	51.4	used for the booking #CB1733380122	2024-12-05 06:28:43	2024-12-05 06:28:43
52	36	debit	59.8	used for the booking #CB1733380322	2024-12-05 06:32:02	2024-12-05 06:32:02
53	36	debit	47.6	used for the booking #CB1733381984	2024-12-05 06:59:45	2024-12-05 06:59:45
54	36	debit	145.8	used for the booking #CB1733387254	2024-12-05 08:27:34	2024-12-05 08:27:34
55	36	debit	118.4	used for the booking #CB1733387387	2024-12-05 08:29:48	2024-12-05 08:29:48
56	36	debit	118.4	used for the booking #CB1733387462	2024-12-05 08:31:02	2024-12-05 08:31:02
57	36	debit	55.6	used for the booking #CB1733389971	2024-12-05 09:12:52	2024-12-05 09:12:52
58	36	debit	48.8	used for the booking #CB1733393339	2024-12-05 10:09:00	2024-12-05 10:09:00
59	36	debit	46.8	used for the booking #CB1733394176	2024-12-05 10:22:57	2024-12-05 10:22:57
60	36	debit	64.8	used for the booking #CB1733397798	2024-12-05 11:23:19	2024-12-05 11:23:19
61	36	debit	49	used for the booking #CB1733398158	2024-12-05 11:29:18	2024-12-05 11:29:18
62	36	debit	46.8	used for the booking #CB1733398254	2024-12-05 11:30:55	2024-12-05 11:30:55
63	36	debit	294.2	used for the booking #CB1733401306	2024-12-05 12:21:46	2024-12-05 12:21:46
64	36	debit	41	used for the booking #CB1733401545	2024-12-05 12:25:45	2024-12-05 12:25:45
65	36	debit	55.6	used for the booking #CB1733401788	2024-12-05 12:29:49	2024-12-05 12:29:49
66	36	debit	63	used for the booking #CB1733401920	2024-12-05 12:32:00	2024-12-05 12:32:00
67	36	debit	53	used for the booking #CB1733401982	2024-12-05 12:33:02	2024-12-05 12:33:02
68	36	debit	58	used for the booking #CB1733402895	2024-12-05 12:48:15	2024-12-05 12:48:15
69	36	debit	45.6	used for the booking #CB1733403400	2024-12-05 12:56:41	2024-12-05 12:56:41
70	36	debit	65.8	used for the booking #CB1733403456	2024-12-05 12:57:36	2024-12-05 12:57:36
71	36	debit	56.6	used for the booking #CB1733403528	2024-12-05 12:58:48	2024-12-05 12:58:48
72	15	debit	63.6	used for the booking #CB1733403786	2024-12-05 13:03:07	2024-12-05 13:03:07
73	15	debit	43	used for the booking #CB1733403979	2024-12-05 13:06:19	2024-12-05 13:06:19
74	15	debit	54.8	used for the booking #CB1733421962	2024-12-05 18:06:03	2024-12-05 18:06:03
75	15	debit	116.4	used for the booking #CB1733422786	2024-12-05 18:19:46	2024-12-05 18:19:46
76	15	debit	54	used for the booking #CB1733462410	2024-12-06 05:20:10	2024-12-06 05:20:10
77	15	debit	64	used for the booking #CB1733465210	2024-12-06 06:06:50	2024-12-06 06:06:50
78	15	debit	44.2	used for the booking #CB1733465656	2024-12-06 06:14:16	2024-12-06 06:14:16
79	15	debit	65.8	used for the booking #CB1733468646	2024-12-06 07:04:06	2024-12-06 07:04:06
80	15	debit	45.4	used for the booking #CB1733468762	2024-12-06 07:06:02	2024-12-06 07:06:02
81	53	debit	19.5	cancellation refund deduction for the booking #CB1733477890	2024-12-06 09:39:21	2024-12-06 09:39:21
82	53	debit	19.5	cancellation refund deduction for the booking #CB1733479242	2024-12-06 10:01:11	2024-12-06 10:01:11
83	36	debit	58.4	used for the booking #CB1733486835	2024-12-06 12:07:16	2024-12-06 12:07:16
84	36	debit	58.4	used for the booking #CB1733488082	2024-12-06 12:28:03	2024-12-06 12:28:03
85	36	debit	47.4	used for the booking #CB1733488365	2024-12-06 12:32:46	2024-12-06 12:32:46
86	36	debit	53	used for the booking #CB1733490060	2024-12-06 13:01:00	2024-12-06 13:01:00
87	36	debit	19.5	cancellation refund deduction for the booking #CB1733513105	2024-12-06 19:26:26	2024-12-06 19:26:26
88	36	debit	19.5	cancellation refund deduction for the booking #CB1733518985	2024-12-06 21:03:14	2024-12-06 21:03:14
\.


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 1, false);


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_id_seq', 206, true);


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

SELECT pg_catalog.setval('public.driver_alloted_orders_id_seq', 18103, true);


--
-- Name: driver_cancel_bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.driver_cancel_bookings_id_seq', 1, false);


--
-- Name: driver_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.driver_details_id_seq', 21, true);


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

SELECT pg_catalog.setval('public.location_suggestions_id_seq', 8, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 69, true);


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

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 64, true);


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

SELECT pg_catalog.setval('public.temp_bookings_id_seq', 214, true);


--
-- Name: temp_tip_amounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_tip_amounts_id_seq', 1, false);


--
-- Name: temp_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_users_id_seq', 72, true);


--
-- Name: tip_amounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tip_amounts_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 60, true);


--
-- Name: vehicle_makes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_makes_id_seq', 6, true);


--
-- Name: vehicle_models_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_models_id_seq', 7, true);


--
-- Name: vehicle_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_types_id_seq', 8, true);


--
-- Name: wallet_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_histories_id_seq', 88, true);


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
-- Name: driver_cancel_bookings driver_cancel_bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_cancel_bookings
    ADD CONSTRAINT driver_cancel_bookings_pkey PRIMARY KEY (id);


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

