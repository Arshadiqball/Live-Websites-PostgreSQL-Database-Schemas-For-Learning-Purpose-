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
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    id bigint NOT NULL,
    booking_id character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    company_name character varying(255),
    country character varying(255) NOT NULL,
    street_address character varying(255) NOT NULL,
    apartment character varying(255),
    city character varying(255) NOT NULL,
    state character varying(255),
    phone character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    deliver_to_different_address boolean DEFAULT false NOT NULL,
    order_notes text,
    total_price numeric(10,2),
    price_details text,
    words_count integer,
    translation_type_price numeric(10,2),
    service_id bigint,
    recipient character varying(255),
    zipcode character varying(255),
    address character varying(255),
    appartment character varying(255),
    additional_info character varying(255),
    full_name character varying(255),
    full_email character varying(255),
    translation_from character varying(255),
    translation_to character varying(255),
    total_pagestranslation integer,
    word_counttranslation integer,
    file_names text,
    "inlineRadioOptions" character varying(255),
    addinfotextarea text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    delivery_type character varying(255),
    status character varying(255),
    confirmfile_names character varying(255),
    translation_type character varying(255),
    delivery_method character varying(255),
    CONSTRAINT bookings_status_check CHECK (((status)::text = ANY ((ARRAY['Pending'::character varying, 'Under Process'::character varying, 'Completed'::character varying, 'Ready for Delivery'::character varying])::text[])))
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
-- Name: challenges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.challenges (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    challenge_type smallint NOT NULL,
    target_type integer,
    target_value integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    status smallint DEFAULT '0'::smallint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.challenges OWNER TO postgres;

--
-- Name: COLUMN challenges.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.challenges.user_id IS 'to understand whom is created';


--
-- Name: COLUMN challenges.challenge_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.challenges.challenge_type IS '1 for all, 2 for company, 3 for individual';


--
-- Name: COLUMN challenges.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.challenges.status IS '1 for active, 0 for inactive';


--
-- Name: challenges_companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.challenges_companies (
    id bigint NOT NULL,
    challenge_id bigint NOT NULL,
    company_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.challenges_companies OWNER TO postgres;

--
-- Name: challenges_companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.challenges_companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.challenges_companies_id_seq OWNER TO postgres;

--
-- Name: challenges_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.challenges_companies_id_seq OWNED BY public.challenges_companies.id;


--
-- Name: challenges_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.challenges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.challenges_id_seq OWNER TO postgres;

--
-- Name: challenges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.challenges_id_seq OWNED BY public.challenges.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id bigint NOT NULL,
    emirate_id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    country_id integer,
    status integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: cms_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cms_pages (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    content text,
    status character varying(255) DEFAULT 'Draft'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT cms_pages_status_check CHECK (((status)::text = ANY (ARRAY[('Draft'::character varying)::text, ('Published'::character varying)::text, ('Scheduled'::character varying)::text])))
);


ALTER TABLE public.cms_pages OWNER TO postgres;

--
-- Name: cms_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cms_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_pages_id_seq OWNER TO postgres;

--
-- Name: cms_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cms_pages_id_seq OWNED BY public.cms_pages.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    name_ar character varying(255),
    brand_logo character varying(255),
    description text,
    description_ar text,
    address character varying(255),
    trade_license character varying(255),
    trade_license_expiry date,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
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
-- Name: contact_us; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_us (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    subject character varying(255),
    message text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.contact_us OWNER TO postgres;

--
-- Name: contact_us_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_us_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_us_id_seq OWNER TO postgres;

--
-- Name: contact_us_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_us_id_seq OWNED BY public.contact_us.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    status integer DEFAULT 0 NOT NULL,
    dial_code character varying(255)
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: COLUMN countries.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.countries.status IS '0: Inactive, 1: Active';


--
-- Name: COLUMN countries.dial_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.countries.dial_code IS 'Country dialing code';


--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: delivery_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_types (
    id bigint NOT NULL,
    translation_type_id bigint,
    name character varying(255) NOT NULL,
    description text,
    price_type character varying(255) DEFAULT 'fixed'::character varying NOT NULL,
    price numeric(10,2) DEFAULT '0'::numeric,
    status character varying(255) DEFAULT '1'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT delivery_types_price_type_check CHECK (((price_type)::text = ANY ((ARRAY['free'::character varying, 'fixed'::character varying])::text[]))),
    CONSTRAINT delivery_types_status_check CHECK (((status)::text = ANY ((ARRAY['0'::character varying, '1'::character varying])::text[])))
);


ALTER TABLE public.delivery_types OWNER TO postgres;

--
-- Name: delivery_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.delivery_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delivery_types_id_seq OWNER TO postgres;

--
-- Name: delivery_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.delivery_types_id_seq OWNED BY public.delivery_types.id;


--
-- Name: emirates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emirates (
    id bigint NOT NULL,
    country_id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    status integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.emirates OWNER TO postgres;

--
-- Name: emirates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emirates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emirates_id_seq OWNER TO postgres;

--
-- Name: emirates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emirates_id_seq OWNED BY public.emirates.id;


--
-- Name: event_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.event_types OWNER TO postgres;

--
-- Name: event_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_types_id_seq OWNER TO postgres;

--
-- Name: event_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_types_id_seq OWNED BY public.event_types.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    event_type_id bigint NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    status character varying(255) DEFAULT '1'::character varying NOT NULL,
    description text NOT NULL,
    images json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT events_status_check CHECK (((status)::text = ANY (ARRAY[('0'::character varying)::text, ('1'::character varying)::text])))
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


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
-- Name: faqs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faqs (
    id bigint NOT NULL,
    question character varying(255) NOT NULL,
    answer text NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.faqs OWNER TO postgres;

--
-- Name: faqs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.faqs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faqs_id_seq OWNER TO postgres;

--
-- Name: faqs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faqs_id_seq OWNED BY public.faqs.id;


--
-- Name: home_logos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_logos (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    status boolean DEFAULT true NOT NULL,
    image character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.home_logos OWNER TO postgres;

--
-- Name: home_logos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.home_logos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_logos_id_seq OWNER TO postgres;

--
-- Name: home_logos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_logos_id_seq OWNED BY public.home_logos.id;


--
-- Name: home_page_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_page_settings (
    id bigint NOT NULL,
    key character varying(255) NOT NULL,
    value text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.home_page_settings OWNER TO postgres;

--
-- Name: home_page_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.home_page_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_page_settings_id_seq OWNER TO postgres;

--
-- Name: home_page_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_page_settings_id_seq OWNED BY public.home_page_settings.id;


--
-- Name: insights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insights (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    title character varying(255),
    content text NOT NULL,
    image character varying(255),
    status boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.insights OWNER TO postgres;

--
-- Name: insights_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insights_id_seq OWNER TO postgres;

--
-- Name: insights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insights_id_seq OWNED BY public.insights.id;


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
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    translation_price numeric(8,2)
);


ALTER TABLE public.languages OWNER TO postgres;

--
-- Name: COLUMN languages.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.languages.name IS 'Language name';


--
-- Name: COLUMN languages.code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.languages.code IS 'Language code, e.g., en, fr';


--
-- Name: COLUMN languages.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.languages.status IS '0: Inactive, 1: Active';


--
-- Name: COLUMN languages.translation_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.languages.translation_price IS 'Price per word for translation';


--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


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
-- Name: packages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.packages (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    price double precision NOT NULL,
    status smallint DEFAULT '0'::smallint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.packages OWNER TO postgres;

--
-- Name: COLUMN packages.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.packages.status IS '0 - Inactive, 1 - Active';


--
-- Name: packages_addons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.packages_addons (
    id bigint NOT NULL,
    package_id bigint NOT NULL,
    title character varying(255) NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.packages_addons OWNER TO postgres;

--
-- Name: packages_addons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.packages_addons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.packages_addons_id_seq OWNER TO postgres;

--
-- Name: packages_addons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.packages_addons_id_seq OWNED BY public.packages_addons.id;


--
-- Name: packages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.packages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.packages_id_seq OWNER TO postgres;

--
-- Name: packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.packages_id_seq OWNED BY public.packages.id;


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
-- Name: quotes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quotes (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    from_lang character varying(255) NOT NULL,
    to_lang text NOT NULL,
    total_pages integer NOT NULL,
    word_count integer NOT NULL,
    service_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.quotes OWNER TO postgres;

--
-- Name: quotes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quotes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quotes_id_seq OWNER TO postgres;

--
-- Name: quotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quotes_id_seq OWNED BY public.quotes.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    status boolean DEFAULT true NOT NULL,
    review text NOT NULL,
    image character varying(255),
    designation character varying(255),
    rating numeric(2,1) DEFAULT '0'::numeric NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


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
-- Name: service_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_details (
    id bigint NOT NULL,
    service_id bigint NOT NULL,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.service_details OWNER TO postgres;

--
-- Name: service_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_details_id_seq OWNER TO postgres;

--
-- Name: service_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_details_id_seq OWNED BY public.service_details.id;


--
-- Name: service_faqs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_faqs (
    id bigint NOT NULL,
    service_id bigint NOT NULL,
    question character varying(255) NOT NULL,
    answer text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.service_faqs OWNER TO postgres;

--
-- Name: service_faqs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_faqs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_faqs_id_seq OWNER TO postgres;

--
-- Name: service_faqs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_faqs_id_seq OWNED BY public.service_faqs.id;


--
-- Name: service_pricing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_pricing (
    id bigint NOT NULL,
    service_id bigint NOT NULL,
    translation_from bigint,
    translation_to bigint,
    price numeric(10,2),
    status character varying(255) DEFAULT '1'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT service_pricing_status_check CHECK (((status)::text = ANY ((ARRAY['0'::character varying, '1'::character varying])::text[])))
);


ALTER TABLE public.service_pricing OWNER TO postgres;

--
-- Name: service_pricing_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_pricing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_pricing_id_seq OWNER TO postgres;

--
-- Name: service_pricing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_pricing_id_seq OWNED BY public.service_pricing.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    service_type_id integer NOT NULL,
    subtitle character varying(255),
    description text,
    status character varying(255) DEFAULT '1'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    background_image character varying(255),
    service_image character varying(255),
    other_image character varying(255),
    price_from real,
    price_to real,
    CONSTRAINT services_status_check CHECK (((status)::text = ANY ((ARRAY['0'::character varying, '1'::character varying])::text[])))
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: services_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services_types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    status character varying(255) DEFAULT '1'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT services_types_status_check CHECK (((status)::text = ANY ((ARRAY['0'::character varying, '1'::character varying])::text[])))
);


ALTER TABLE public.services_types OWNER TO postgres;

--
-- Name: COLUMN services_types.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.services_types.name IS 'Service type name';


--
-- Name: COLUMN services_types.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.services_types.status IS 'Status of the service type';


--
-- Name: services_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_types_id_seq OWNER TO postgres;

--
-- Name: services_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_types_id_seq OWNED BY public.services_types.id;


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
-- Name: site_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site_settings (
    id bigint NOT NULL,
    key character varying(255) NOT NULL,
    value text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.site_settings OWNER TO postgres;

--
-- Name: site_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.site_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_settings_id_seq OWNER TO postgres;

--
-- Name: site_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.site_settings_id_seq OWNED BY public.site_settings.id;


--
-- Name: slider_buttons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.slider_buttons (
    id bigint NOT NULL,
    slider_id bigint NOT NULL,
    text character varying(255) NOT NULL,
    link character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.slider_buttons OWNER TO postgres;

--
-- Name: slider_buttons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.slider_buttons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slider_buttons_id_seq OWNER TO postgres;

--
-- Name: slider_buttons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.slider_buttons_id_seq OWNED BY public.slider_buttons.id;


--
-- Name: sliders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sliders (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(255) NOT NULL,
    content text NOT NULL,
    status boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.sliders OWNER TO postgres;

--
-- Name: sliders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sliders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sliders_id_seq OWNER TO postgres;

--
-- Name: sliders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sliders_id_seq OWNED BY public.sliders.id;


--
-- Name: target_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.target_types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.target_types OWNER TO postgres;

--
-- Name: target_types_company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.target_types_company (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.target_types_company OWNER TO postgres;

--
-- Name: target_types_company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.target_types_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.target_types_company_id_seq OWNER TO postgres;

--
-- Name: target_types_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.target_types_company_id_seq OWNED BY public.target_types_company.id;


--
-- Name: target_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.target_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.target_types_id_seq OWNER TO postgres;

--
-- Name: target_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.target_types_id_seq OWNED BY public.target_types.id;


--
-- Name: translation_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.translation_types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    price_type character varying(255) DEFAULT 'free'::character varying NOT NULL,
    price numeric(10,2) DEFAULT '0'::numeric,
    percentage numeric(5,2) DEFAULT '0'::numeric,
    category character varying(255),
    status character varying(255) DEFAULT '1'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT translation_types_price_type_check CHECK (((price_type)::text = ANY ((ARRAY['free'::character varying, 'rush_fee'::character varying, 'fixed'::character varying])::text[]))),
    CONSTRAINT translation_types_status_check CHECK (((status)::text = ANY ((ARRAY['0'::character varying, '1'::character varying])::text[])))
);


ALTER TABLE public.translation_types OWNER TO postgres;

--
-- Name: COLUMN translation_types.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.translation_types.name IS 'Translation Type Name';


--
-- Name: COLUMN translation_types.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.translation_types.description IS 'Description of the Translation Type';


--
-- Name: COLUMN translation_types.price_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.translation_types.price_type IS 'Price Type';


--
-- Name: COLUMN translation_types.price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.translation_types.price IS 'Price for the translation type';


--
-- Name: COLUMN translation_types.percentage; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.translation_types.percentage IS 'Percentage for Rush Fee';


--
-- Name: COLUMN translation_types.category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.translation_types.category IS 'Category for the translation type';


--
-- Name: COLUMN translation_types.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.translation_types.status IS 'Status of the translation type';


--
-- Name: translation_types_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.translation_types_categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    status character varying(255) DEFAULT '1'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    description text,
    price_type character varying(255) DEFAULT 'free'::character varying NOT NULL,
    price numeric(10,2) DEFAULT '0'::numeric,
    percentage numeric(5,2) DEFAULT '0'::numeric,
    CONSTRAINT translation_types_categories_price_type_check CHECK (((price_type)::text = ANY ((ARRAY['free'::character varying, 'rush_fee'::character varying, 'fixed'::character varying])::text[]))),
    CONSTRAINT translation_types_categories_status_check CHECK (((status)::text = ANY ((ARRAY['0'::character varying, '1'::character varying])::text[])))
);


ALTER TABLE public.translation_types_categories OWNER TO postgres;

--
-- Name: COLUMN translation_types_categories.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.translation_types_categories.description IS 'Description of the Translation Type';


--
-- Name: COLUMN translation_types_categories.price_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.translation_types_categories.price_type IS 'Price Type';


--
-- Name: COLUMN translation_types_categories.price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.translation_types_categories.price IS 'Price for the translation type';


--
-- Name: COLUMN translation_types_categories.percentage; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.translation_types_categories.percentage IS 'Percentage for Rush Fee';


--
-- Name: translation_types_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.translation_types_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.translation_types_categories_id_seq OWNER TO postgres;

--
-- Name: translation_types_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.translation_types_categories_id_seq OWNED BY public.translation_types_categories.id;


--
-- Name: translation_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.translation_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.translation_types_id_seq OWNER TO postgres;

--
-- Name: translation_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.translation_types_id_seq OWNED BY public.translation_types.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    first_name character varying(255),
    last_name character varying(255),
    dial_code character varying(255),
    phone character varying(255),
    country_id integer,
    emirates_id integer,
    city_id integer,
    company_id integer,
    status integer DEFAULT 0,
    deleted_at timestamp(0) without time zone,
    role_id bigint
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
-- Name: why_choose_us; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.why_choose_us (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    content text NOT NULL,
    image character varying(255),
    status boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.why_choose_us OWNER TO postgres;

--
-- Name: why_choose_us_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.why_choose_us_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.why_choose_us_id_seq OWNER TO postgres;

--
-- Name: why_choose_us_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.why_choose_us_id_seq OWNED BY public.why_choose_us.id;


--
-- Name: work_process; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.work_process (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    content text,
    image character varying(255),
    status boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.work_process OWNER TO postgres;

--
-- Name: work_process_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.work_process_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_process_id_seq OWNER TO postgres;

--
-- Name: work_process_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.work_process_id_seq OWNED BY public.work_process.id;


--
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- Name: challenges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges ALTER COLUMN id SET DEFAULT nextval('public.challenges_id_seq'::regclass);


--
-- Name: challenges_companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges_companies ALTER COLUMN id SET DEFAULT nextval('public.challenges_companies_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: cms_pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cms_pages ALTER COLUMN id SET DEFAULT nextval('public.cms_pages_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: contact_us id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us ALTER COLUMN id SET DEFAULT nextval('public.contact_us_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: delivery_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_types ALTER COLUMN id SET DEFAULT nextval('public.delivery_types_id_seq'::regclass);


--
-- Name: emirates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emirates ALTER COLUMN id SET DEFAULT nextval('public.emirates_id_seq'::regclass);


--
-- Name: event_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_types ALTER COLUMN id SET DEFAULT nextval('public.event_types_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: faqs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faqs ALTER COLUMN id SET DEFAULT nextval('public.faqs_id_seq'::regclass);


--
-- Name: home_logos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_logos ALTER COLUMN id SET DEFAULT nextval('public.home_logos_id_seq'::regclass);


--
-- Name: home_page_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_page_settings ALTER COLUMN id SET DEFAULT nextval('public.home_page_settings_id_seq'::regclass);


--
-- Name: insights id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insights ALTER COLUMN id SET DEFAULT nextval('public.insights_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: packages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages ALTER COLUMN id SET DEFAULT nextval('public.packages_id_seq'::regclass);


--
-- Name: packages_addons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages_addons ALTER COLUMN id SET DEFAULT nextval('public.packages_addons_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: quotes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quotes ALTER COLUMN id SET DEFAULT nextval('public.quotes_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: service_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_details ALTER COLUMN id SET DEFAULT nextval('public.service_details_id_seq'::regclass);


--
-- Name: service_faqs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_faqs ALTER COLUMN id SET DEFAULT nextval('public.service_faqs_id_seq'::regclass);


--
-- Name: service_pricing id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pricing ALTER COLUMN id SET DEFAULT nextval('public.service_pricing_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: services_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services_types ALTER COLUMN id SET DEFAULT nextval('public.services_types_id_seq'::regclass);


--
-- Name: site_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings ALTER COLUMN id SET DEFAULT nextval('public.site_settings_id_seq'::regclass);


--
-- Name: slider_buttons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slider_buttons ALTER COLUMN id SET DEFAULT nextval('public.slider_buttons_id_seq'::regclass);


--
-- Name: sliders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sliders ALTER COLUMN id SET DEFAULT nextval('public.sliders_id_seq'::regclass);


--
-- Name: target_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_types ALTER COLUMN id SET DEFAULT nextval('public.target_types_id_seq'::regclass);


--
-- Name: target_types_company id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_types_company ALTER COLUMN id SET DEFAULT nextval('public.target_types_company_id_seq'::regclass);


--
-- Name: translation_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translation_types ALTER COLUMN id SET DEFAULT nextval('public.translation_types_id_seq'::regclass);


--
-- Name: translation_types_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translation_types_categories ALTER COLUMN id SET DEFAULT nextval('public.translation_types_categories_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: why_choose_us id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.why_choose_us ALTER COLUMN id SET DEFAULT nextval('public.why_choose_us_id_seq'::regclass);


--
-- Name: work_process id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_process ALTER COLUMN id SET DEFAULT nextval('public.work_process_id_seq'::regclass);


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (id, booking_id, first_name, last_name, company_name, country, street_address, apartment, city, state, phone, email, deliver_to_different_address, order_notes, total_price, price_details, words_count, translation_type_price, service_id, recipient, zipcode, address, appartment, additional_info, full_name, full_email, translation_from, translation_to, total_pagestranslation, word_counttranslation, file_names, "inlineRadioOptions", addinfotextarea, created_at, updated_at, delivery_type, status, confirmfile_names, translation_type, delivery_method) FROM stdin;
2	#TS863490631	Guest	hhh	RasCo	UAE	Mariam al owais building	101	Dubai	Dubai	0561660133	guesthhh@gmail.com	f	No notes for delivery	250.00	[{"from":"English","to":"French","price":250}]	50	0.00	5	Guest hhh	500001	Mariam al owais building	1st floor, 101 Apartment	\N	Guest hhh	guesthhh@gmail.com	1	["3"]	2	50	1735384938676fdf6ae0b98.pdf	no	\N	2024-12-28 11:30:35	2024-12-30 09:15:00	\N	Under Process	\N	\N	\N
1	#TS846428145	Xerxes	Coffey	Turner Swanson Plc	Maskat	Temporibus ullam con	Minim cupidatat temp	Quibusdam sit maxim	Ea aut excepteur per	+1 (417) 241-6599	zifatet@mailinator.com	t	Sed in aute nemo min	2700.00	[{"from":"Arabic","to":"English","price":2700}]	90	0.00	1	Velit et fugiat au	10909	Excepturi ut hic min	Dignissimos ipsa es	sadsadasda	Nevada Stafford	kykizito@mailinator.com	2	["1"]	12	90	1735383857676fdb31ab9d4.doc	yes	sadsadasda	2024-12-28 11:04:50	2024-12-30 09:35:45	\N	Pending	\N	\N	\N
3	#TS366124160	Guest	hhh	RasCo	UAE	Mariam al owais building	101	Dubai	Dubai	0561660133	guesthhh@gmail.com	f	hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh	450.00	[{"from":"English","to":"Tamil","price":450}]	75	0.00	5	Guest hhh	500001	Mariam al owais building	1st floor, 101 Apartment	abcdefghijklmnopqrstuvwxyz.....111111111111111111111122222222222222222222233333334567890	Guest hhh	guesthhh@gmail.com	1	["4"]	3	75	1735385881676fe31936a78.pdf	yes	abcdefghijklmnopqrstuvwxyz.....111111111111111111111122222222222222222222233333334567890	2024-12-28 11:39:50	2024-12-30 09:46:12	\N	Pending	\N	\N	\N
4	#TS123615259	sedw	wr	erew	australia	Marasi	12	23	Abudhabi	2342342342	anl@gmail.com	t	jyfjyfyutki	0.00	[]	2000	0.00	5	Anil	234242235	Almanra tower	1245	I need in details	anil	navis@gmail.com	2	["3"]	2	2000	1735616705677368c17826b.docx	yes	I need in details	2024-12-31 03:48:24	2024-12-31 03:48:24	\N	Pending	\N	\N	\N
5	#TS194452442	Guest	hhh	RasCo	UAE	Ajman Gate Tower	3rd floor, 304 Apartment	Ajman	Ajman	0561660155	guesthhh@gmail.com	f	\N	1000.00	[{"from":"French","to":"English","price":1000}]	50	0.00	8	Guest hhh	499999	Ajman Gate Tower	3rd floor, 304 Apartment	handle with care	Guest hhh	guesthhh@gmail.com	3	["1"]	2	50	17356386106773be52026bc.pdf	yes	handle with care	2024-12-31 09:52:14	2024-12-31 09:52:14	\N	Pending	\N	\N	\N
6	#TS342228452	Chelsea	Thornton	Steele and Farrell Plc	Maskat	Debitis adipisicing	Cupidatat exercitati	Quia fugiat ex sed r	Dolorem architecto i	+1 (352) 511-7305	gynycejof@mailinator.com	f	Dolore aut dolores r	24012.00	[{"from":"Arabic","to":"English","price":24000}]	120	0.00	7	Temporibus tempore	90876	Maiores sit ullam la	Fugiat fugit sequi	asdasdad	Price Chase	soto@mailinator.com	2	["1"]	12	120	17356698686774386cc3306.pdf	yes	asdasdad	2024-12-31 18:33:33	2024-12-31 18:33:33	DIGITAL & PHYSICAL COPY	Pending	\N	\N	\N
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
-- Data for Name: challenges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.challenges (id, user_id, name, challenge_type, target_type, target_value, start_date, end_date, status, created_at, updated_at, deleted_at) FROM stdin;
15	1	Testing	2	1	12	2024-12-17	2025-02-01	1	2024-12-05 21:43:13	2024-12-15 22:48:49	\N
17	1	Macon Bradford	2	3	2342	2024-12-16	2024-12-24	1	2024-12-16 00:15:33	2024-12-16 15:47:51	2024-12-16 15:47:51
13	1	Melyssa Cooke	1	2	34	2024-12-20	2024-12-26	1	2024-12-05 21:32:47	2024-12-16 15:53:25	2024-12-16 15:53:25
18	1	Abigail Snider	2	3	56	2024-12-20	2024-12-21	1	2024-12-16 15:53:48	2024-12-16 15:54:26	2024-12-16 15:54:26
19	1	Test	2	4	12	2024-12-27	2024-12-31	1	2024-12-16 15:56:52	2024-12-16 15:57:31	2024-12-16 15:57:31
14	1	Noah Wise111	2	4	45	2024-12-26	2024-12-27	1	2024-12-05 21:33:05	2024-12-18 08:04:47	\N
20	1	Test12	2	4	1	2024-12-21	2024-12-26	0	2024-12-18 08:05:16	2024-12-19 21:49:14	\N
\.


--
-- Data for Name: challenges_companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.challenges_companies (id, challenge_id, company_id, created_at, updated_at, deleted_at) FROM stdin;
16	15	23	2024-12-15 22:48:49	2024-12-15 22:48:49	\N
17	17	10	2024-12-16 00:15:33	2024-12-16 14:22:13	2024-12-16 14:22:13
19	14	23	2024-12-16 14:22:54	2024-12-16 14:22:54	\N
18	17	23	2024-12-16 14:22:13	2024-12-16 15:47:51	2024-12-16 15:47:51
20	18	23	2024-12-16 15:54:05	2024-12-16 15:54:26	2024-12-16 15:54:26
21	19	23	2024-12-16 15:56:52	2024-12-16 15:57:31	2024-12-16 15:57:31
22	20	23	2024-12-18 08:05:16	2024-12-18 08:05:16	\N
23	20	32	2024-12-19 18:03:51	2024-12-19 18:03:51	\N
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, emirate_id, name, created_at, updated_at, deleted_at, country_id, status) FROM stdin;
7	4	Ras Al Khaimah	2024-12-10 16:32:24	2024-12-10 16:32:24	\N	2	1
3	3	Ajman	2024-12-05 15:22:16	2024-12-10 16:44:50	\N	2	1
1	1	Dubai	2024-12-05 15:22:16	2024-12-13 19:09:05	\N	2	1
\.


--
-- Data for Name: cms_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cms_pages (id, title, content, status, created_at, updated_at) FROM stdin;
1	About us	<p>asdasda123asdasd</p>	Published	2024-12-10 18:35:10	2024-12-17 20:15:23
3	Privacy policy	<p>testasdas</p>	Scheduled	2024-12-10 18:43:54	2024-12-17 20:15:33
2	Terms and conditions	<p>test</p>	Scheduled	2024-12-10 18:43:49	2024-12-17 20:15:40
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (id, name, name_ar, brand_logo, description, description_ar, address, trade_license, trade_license_expiry, user_id, created_at, updated_at, deleted_at) FROM stdin;
13	Morton Ratliff LLC	Mcguire and Sandoval Associates	1734645382676496867ec33.png	Quas odit proident	Similique illum qui	Qui pariatur Qui na	1734645383676496873534e.pdf	2024-12-26	35	2024-12-19 21:56:23	2024-12-19 21:56:23	\N
\.


--
-- Data for Name: contact_us; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_us (id, name, email, subject, message, created_at, updated_at) FROM stdin;
2	Beck Moody	lyrytujeg@mailinator.com	Est excepteur in omn	Aperiam architecto a	2024-12-28 15:17:19	2024-12-28 15:17:19
3	Yes	dubaihosp@dubaihosp.com	zxczxc	zxczxczxc	2024-12-30 09:49:44	2024-12-30 09:49:44
4	anul	asf@sg.com	aa	ADd	2024-12-31 03:43:43	2024-12-31 03:43:43
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, name, created_at, updated_at, status, dial_code) FROM stdin;
4	Maskat	2024-12-10 15:28:07	2024-12-10 16:44:10	1	\N
5	sdadadad	2024-12-11 20:34:55	2024-12-11 20:34:55	1	\N
7	Cole Moon	2024-12-12 16:46:45	2024-12-12 16:46:45	1	\N
8	Camilla Benton	2024-12-12 17:20:58	2024-12-12 17:20:58	1	\N
2	UAE	2024-12-10 11:39:38	2024-12-19 21:25:09	1	+9711
9	Canada	2024-12-20 07:18:53	2024-12-20 07:21:09	1	+1
10	australia	2024-12-20 07:21:43	2024-12-20 07:21:43	1	+922
\.


--
-- Data for Name: delivery_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery_types (id, translation_type_id, name, description, price_type, price, status, created_at, updated_at) FROM stdin;
1	1	DIGITAL DELIVERY	Arrives to your email immediately when completed.	free	0.00	1	2024-12-31 18:29:50	2024-12-31 18:29:50
2	1	DIGITAL & PHYSICAL COPY	2-day express shipping via USPS. This price is for domestic shipping only, international shipping may incur a small fee.	fixed	12.00	1	2024-12-31 18:30:28	2024-12-31 18:30:28
\.


--
-- Data for Name: emirates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emirates (id, country_id, name, created_at, updated_at, deleted_at, status) FROM stdin;
1	2	Dubai	2024-12-05 15:22:16	2024-12-10 15:27:04	\N	1
4	2	Abu dubai	2024-12-10 15:34:44	2024-12-10 15:34:44	\N	1
5	2	Umm Al Qaiwain	2024-12-10 15:36:55	2024-12-10 15:36:55	\N	1
3	2	Fujairah	2024-12-05 15:22:16	2024-12-10 15:50:53	\N	1
\.


--
-- Data for Name: event_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_types (id, name, status, created_at, updated_at) FROM stdin;
2	Sports	1	2024-12-10 17:55:00	2024-12-10 17:55:00
3	Music	1	2024-12-17 19:03:21	2024-12-17 19:03:21
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, name, event_type_id, start_date, end_date, status, description, images, created_at, updated_at) FROM stdin;
5	test123	2	2024-12-18	2024-12-20	1	<p>zxcssf</p>	"[\\"\\"]"	2024-12-17 20:43:55	2024-12-17 20:43:55
2	testq	2	2024-04-20	2024-12-27	1	<p>asdd</p>	"[\\"1734335755675fdd0b842a5.jpg\\",\\"1734335763675fdd13d0457.jpg\\",\\"1734335769675fdd19d037d.png\\"]"	2024-12-11 20:51:39	2024-12-19 21:24:45
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: faqs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faqs (id, question, answer, status, created_at, updated_at) FROM stdin;
2	What is language translation?	<p>Language translation is the process of converting text or speech from one language (source language) to another (target language) while maintaining the original meaning.</p>	1	2024-12-11 10:52:14	2025-01-01 06:17:02
3	What are the challenges in translation?	<ul><li><strong>Idioms and Expressions:</strong> These often don’t translate directly.</li><li><strong>Cultural Nuances:</strong> Some words or phrases carry cultural significance that requires adaptation.</li><li><strong>Context:</strong> Words can have different meanings based on the context.</li><li><strong>Grammar and Syntax Differences:</strong> Languages follow unique structures.</li></ul>	1	2024-12-17 19:09:41	2025-01-01 06:18:59
4	What are the languages Tasheel translate?	<p>We support translation between most widely spoken languages (e.g., English, Spanish, Chinese, French, Arabic, etc.) and some lesser-known ones. Let me know what you need!</p>	1	2024-12-17 19:37:42	2025-01-01 06:20:17
\.


--
-- Data for Name: home_logos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_logos (id, name, status, image, created_at, updated_at) FROM stdin;
1	travelers	t	173569518467749b50b339a.png	2025-01-01 01:33:04	2025-01-01 01:33:04
\.


--
-- Data for Name: home_page_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_page_settings (id, key, value, created_at, updated_at) FROM stdin;
1	about_us_title	Your Tasks, Our Care	2025-01-01 01:21:27	2025-01-01 01:21:27
2	about_us_description	Tasheel is a leading provider of expert documentation and attestation services, specializing in legal attestation, translation, document processing assistance, and more. With years of experience and a commitment to accuracy and reliability, we ensure that your documents are authenticated and accepted worldwide. Our team of experts works diligently to provide efficient and hassle-free services, meeting your deadlines and exceeding your expectations. We specialize in bridging the gap between individuals, businesses, and governmental entities, providing expert legal translation, certified and notarized services, and support for embassy, consulate, municipality, and ministry processes. At Tasheel, we empower you to confidently and easily navigate legal and administrative challenges.	2025-01-01 01:21:27	2025-01-01 01:21:27
3	why_choose_us_title	Effective Solutions for Your Document Needs	2025-01-01 01:21:27	2025-01-01 01:21:27
4	why_choose_us_content	At Tasheel, we provide tailored solutions for all your legal translation and documentation needs.Our team of experts ensures accuracy and compliance, guiding you through the complexities of legal processes. We prioritize efficiency and customer satisfaction, making the handling of your documents seamless and stress-free.	2025-01-01 01:21:27	2025-01-01 01:21:27
5	work_process_title	How it Work	2025-01-01 01:21:27	2025-01-01 01:21:27
6	work_process_content	Work Process	2025-01-01 01:21:27	2025-01-01 01:21:27
7	customer_experience_title	Customers Experience	2025-01-01 01:21:27	2025-01-01 01:21:27
8	insights_title	Find Out Our	2025-01-01 01:21:27	2025-01-01 01:21:27
9	insights_content	Insights & Intelligence	2025-01-01 01:21:27	2025-01-01 01:21:27
10	youtube_video_1	https://www.youtube.com/embed/-VK0axfge4A	2025-01-01 01:21:27	2025-01-01 01:21:27
11	youtube_video_2	https://www.youtube.com/embed/-VK0axfge4A	2025-01-01 01:21:27	2025-01-01 01:21:27
\.


--
-- Data for Name: insights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insights (id, name, title, content, image, status, created_at, updated_at) FROM stdin;
1	Evan Thomas	Workplace problems in your business?	Banter! Could “workplace banter” cause problems in your business? The short answer? Yes	173569536567749c05307b9.jpg	t	2025-01-01 01:36:05	2025-01-01 01:36:05
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
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.languages (id, name, code, status, created_at, updated_at, translation_price) FROM stdin;
2	Arabic	ar	1	2024-12-26 01:48:25	2024-12-26 09:31:04	20.00
1	English	en	1	2024-12-21 09:50:53	2024-12-26 10:54:26	10.00
3	French	fr	1	2024-12-26 10:54:50	2024-12-26 10:54:50	25.00
4	Tamil	tm	1	2024-12-26 10:55:16	2024-12-26 10:55:16	12.00
5	Urdu	ur	1	2024-12-26 10:55:33	2024-12-26 10:55:33	10.00
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2024_12_04_121725_create_companies_table	1
5	2024_12_04_174007_create_permission_tables	1
6	2024_12_05_125935_create_countries_table	1
7	2024_12_05_125953_create_emirates_table	1
8	2024_12_05_130018_create_cities_table	1
11	2024_12_05_164934_create_packages_table	2
12	2024_12_05_164957_create_packages_addons_table	2
19	2024_12_05_231725_create_challenges_table	3
20	2024_12_05_232702_create_challenges_companies_table	3
21	2024_12_05_191748_add_fields_to_users_table	4
22	2024_12_10_063233_remove_columns_from_companies_table	5
23	2024_12_10_113225_add_status_to_countries_table	6
24	2024_12_10_144153_add_status_to_emirates_table	7
25	2024_12_10_155646_add_country_id_and_status_to_cities_table	8
26	2024_12_10_165027_create_target_types_table	9
27	2024_12_10_173815_create_event_types_table	10
28	2024_12_10_182826_create_pages_table	11
29	2024_12_10_094132_add_soft_deletes_to_users_table	12
30	2024_12_10_131649_add_soft_deletes_to_challenges_table	12
31	2024_12_11_102429_create_faqs_table	13
32	2024_12_11_104518_create_faqs_table	14
33	2024_12_11_190634_create_events_table	15
34	2024_12_12_171650_add_role_id_to_users_table	16
35	2024_12_16_031035_create_target_types_company_table	17
36	2024_12_16_143622_add_dial_code_to_countries_table	18
37	2024_12_21_090718_create_languages_table	19
38	2024_12_22_025151_create_site_settings_table	20
39	2024_12_22_202921_create_sliders_table	21
40	2024_12_22_202959_create_slider_buttons_table	22
41	2024_12_22_204258_create_sliders_table	23
42	2024_12_22_204302_create_slider_buttons_table	23
43	2024_12_24_110324_create_services_table	24
44	2024_12_24_110552_create_service_details_table	24
45	2024_12_24_110641_create_service_faqs_table	24
46	2024_12_25_144910_add_images_and_prices_to_services_table	24
47	2024_12_25_175336_create_quotes_table	24
48	2024_12_25_194520_add_translation_price_to_languages_table	24
49	2024_12_25_204612_create_services_types_table	24
50	2024_12_26_100307_recreate_services_types_table	25
51	2024_12_26_151334_create_service_pricing_table	26
52	2024_12_26_154043_recreate_services_types_table	26
53	2024_12_26_164628_create_translation_types_table	26
54	2024_12_27_213922_create_bookings_table	27
55	2024_12_28_091000_add_delivery_type_and_status_to_bookings_table	28
56	2024_12_28_145944_create_contact_us_table	29
57	2024_12_30_093601_create_translation_types_categories_table	30
58	2024_12_30_145932_create_delivery_types_table	31
59	2024_12_31_103127_add_columns_to_translation_types_categories_table	32
60	2024_12_31_173752_add_fields_to_bookings_table	32
61	2024_12_31_201549_create_why_choose_us_table	33
62	2024_12_31_204641_create_work_process_table	33
63	2024_12_31_224105_create_home_logos_table	33
64	2024_12_31_225708_create_reviews_table	33
65	2024_12_31_232951_create_insights_table	33
66	2024_12_31_235754_create_home_page_settings_table	33
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
2	App\\Models\\User	2
2	App\\Models\\User	3
2	App\\Models\\User	4
2	App\\Models\\User	5
2	App\\Models\\User	6
4	App\\Models\\User	7
4	App\\Models\\User	8
4	App\\Models\\User	9
4	App\\Models\\User	10
4	App\\Models\\User	11
4	App\\Models\\User	12
2	App\\Models\\User	13
2	App\\Models\\User	16
3	App\\Models\\User	22
2	App\\Models\\User	23
4	App\\Models\\User	24
4	App\\Models\\User	25
3	App\\Models\\User	26
3	App\\Models\\User	27
4	App\\Models\\User	28
4	App\\Models\\User	29
4	App\\Models\\User	30
4	App\\Models\\User	31
2	App\\Models\\User	32
4	App\\Models\\User	33
2	App\\Models\\User	34
2	App\\Models\\User	35
3	App\\Models\\User	36
\.


--
-- Data for Name: packages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.packages (id, name, price, status, created_at, updated_at, deleted_at) FROM stdin;
8	Susan Miranda	12	1	2024-12-07 03:32:13	2024-12-07 03:32:13	\N
9	Quincy Nixon	12	0	2024-12-07 03:32:39	2024-12-07 03:32:39	\N
10	Ariel Newton	12	1	2024-12-07 03:35:15	2024-12-07 03:35:15	\N
11	Beatrice Delgado	12	1	2024-12-07 03:35:30	2024-12-07 03:35:30	\N
12	Michael Benson	123	0	2024-12-07 03:35:49	2024-12-07 03:35:49	\N
13	Amir Pittman	67	0	2024-12-07 03:36:04	2024-12-07 03:36:04	\N
14	Test Package	50	0	2024-12-07 15:55:36	2024-12-07 17:56:39	\N
17	Duncan Colon	45	1	2024-12-07 17:25:54	2024-12-07 17:25:54	\N
18	Wynne Bishop	11111	1	2024-12-07 17:26:17	2024-12-07 17:26:17	\N
20	Sade Cotton	12	1	2024-12-07 18:25:50	2024-12-07 22:25:50	\N
21	Madonna Tyler	12	0	2024-12-07 18:27:28	2024-12-07 22:27:28	\N
24	Drew Hoffman	12	1	2024-12-07 18:33:52	2024-12-07 22:33:52	\N
25	April Foster	12	1	2024-12-07 18:34:39	2024-12-07 18:34:39	\N
22	Christopher Rowland	12	1	2024-12-07 18:28:41	2024-12-07 20:30:00	\N
15	Wing Tucker	25	0	2024-12-07 17:57:28	2024-12-07 20:45:17	\N
19	Malik Stanley	12	0	2024-12-07 18:24:56	2024-12-07 20:45:30	\N
16	Raju	35	1	2024-12-07 21:25:17	2024-12-07 21:10:03	\N
26	Craig Caldwell	2	1	2024-12-07 19:35:53	2024-12-12 06:49:19	\N
23	Neville Kennedy	122	1	2024-12-07 18:30:00	2024-12-16 13:52:11	\N
27	Test1q	20	1	2024-12-17 21:01:37	2024-12-19 21:24:31	\N
\.


--
-- Data for Name: packages_addons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.packages_addons (id, package_id, title, deleted_at, created_at, updated_at) FROM stdin;
3	3	Distinctio Ut qui q	\N	2024-12-05 21:31:38	2024-12-05 21:31:38
4	3	Optio elit id et n	\N	2024-12-05 21:31:38	2024-12-05 21:31:38
5	3	Possimus est amet	\N	2024-12-05 21:31:38	2024-12-05 21:31:38
6	3	Omnis veniam enim a	\N	2024-12-05 21:31:38	2024-12-05 21:31:38
7	3	Quo quia tempora quo	\N	2024-12-05 21:31:38	2024-12-05 21:31:38
8	3	Illo sit nisi animi	\N	2024-12-05 21:31:38	2024-12-05 21:31:38
9	4	Reprehenderit amet	\N	2024-12-05 21:35:25	2024-12-05 21:35:25
10	5	Cumque libero sit v	\N	2024-12-05 21:58:52	2024-12-05 21:58:52
11	6	Ex enim ducimus vol	\N	2024-12-05 22:09:23	2024-12-05 22:09:23
12	7	Consequatur distinct	\N	2024-12-05 22:09:39	2024-12-05 22:09:39
13	8	Aut officiis quos la	\N	2024-12-07 03:32:13	2024-12-07 03:32:13
14	8	Ad enim nostrud even	\N	2024-12-07 03:32:13	2024-12-07 03:32:13
15	9	Ratione aut labore o	\N	2024-12-07 03:32:39	2024-12-07 03:32:39
16	10	Cupiditate perspicia	\N	2024-12-07 03:35:15	2024-12-07 03:35:15
17	11	Labore doloribus inc	\N	2024-12-07 03:35:30	2024-12-07 03:35:30
18	12	Non qui pariatur Eu	\N	2024-12-07 03:35:49	2024-12-07 03:35:49
19	13	Accusamus repellendu	\N	2024-12-07 03:36:04	2024-12-07 03:36:04
21	14	Addon Info 2	\N	2024-12-07 15:55:36	2024-12-07 17:50:20
22	14	Addon Info 3	\N	2024-12-07 15:55:36	2024-12-07 17:50:20
23	14	Addon Info 4	\N	2024-12-07 15:55:36	2024-12-07 17:50:20
25	14	new 2	\N	2024-12-07 17:50:20	2024-12-07 17:55:57
26	14	new 3	\N	2024-12-07 17:50:20	2024-12-07 17:55:57
27	14	new 4	\N	2024-12-07 17:50:20	2024-12-07 17:55:57
34	15	New 4	\N	2024-12-07 18:57:37	2024-12-07 18:57:37
35	16	Omnis est nihil quo	\N	2024-12-07 21:25:17	2024-12-07 21:25:17
37	18	Reiciendis suscipit	\N	2024-12-07 17:26:17	2024-12-07 17:26:17
38	19	Velit earum quia aut	\N	2024-12-07 22:24:56	2024-12-07 22:24:56
39	20	Dicta aut totam nisi	\N	2024-12-07 22:25:50	2024-12-07 22:25:50
40	21	Aliquip necessitatib	\N	2024-12-07 22:27:28	2024-12-07 22:27:28
41	22	In esse facere quae	\N	2024-12-07 18:28:41	2024-12-07 18:28:41
42	23	Ad provident non en	\N	2024-12-07 18:30:00	2024-12-07 18:30:00
43	24	Voluptas quaerat ut	\N	2024-12-07 22:33:52	2024-12-07 22:33:52
44	25	Ad temporibus possim	\N	2024-12-07 18:34:39	2024-12-07 18:34:39
45	26	Ullam aliquid beatae	\N	2024-12-07 19:35:53	2024-12-07 19:35:53
36	17	gdfgdfgdf	\N	2024-12-07 17:25:54	2024-12-07 21:04:29
46	16	newwwwwwwwwwww	\N	2024-12-07 21:09:35	2024-12-07 21:09:35
47	16	Rajuuuuuuuuuuuu	\N	2024-12-07 21:10:03	2024-12-07 21:10:03
48	16	bfd	\N	2024-12-07 21:10:59	2024-12-07 21:10:59
79	27	test	\N	2024-12-17 21:01:37	2024-12-17 21:01:37
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
\.


--
-- Data for Name: quotes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quotes (id, name, email, from_lang, to_lang, total_pages, word_count, service_id, created_at, updated_at) FROM stdin;
1	test	test@gmail.com	English	Arabic	1	100	1	2024-12-26 01:52:45	2024-12-26 01:52:45
2	test	test@gmail.com	English	Arabic	1	100	1	2024-12-26 01:53:02	2024-12-26 01:53:02
3	test	test@gmail.com	English	Arabic	1	100	1	2024-12-26 01:53:32	2024-12-26 01:53:32
4	hibba	hibba@gmail.com	Arabic	English	2	20000	1	2024-12-26 06:50:21	2024-12-26 06:50:21
5	Guest hhh	guesthhh@gmail.com	English	Urdu	2	50	8	2024-12-31 07:05:52	2024-12-31 07:05:52
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, name, status, review, image, designation, rating, created_at, updated_at) FROM stdin;
1	Jacob Leonardo	t	While running an early-stage startup, everything feels hard; that's why it's been so nice to have our accounting feel easy. We recommend Qetus	173569524567749b8da04c5.png	CEO Founder	3.0	2025-01-01 01:34:05	2025-01-01 01:34:05
\.


--
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
1	Admin	web	2024-12-05 15:22:16	2024-12-05 15:22:16
2	Company	web	2024-12-05 15:22:16	2024-12-05 15:22:16
3	Individual	web	2024-12-05 15:22:16	2024-12-05 15:22:16
4	Staff	web	2024-12-05 15:22:16	2024-12-05 15:22:16
\.


--
-- Data for Name: service_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_details (id, service_id, title, content, created_at, updated_at) FROM stdin;
51	1	Background Checks	<p><span style="color: rgb(74, 78, 86); font-family: Inter, sans-serif; font-size: 16px;">These cases are perfectly simple and easy to distinguish. In a free hour when our power.</span></p>	2024-12-31 06:31:35	2024-12-31 06:31:35
52	1	Profile Assessments	<p><span style="color: rgb(74, 78, 86); font-family: Inter, sans-serif; font-size: 16px;">Indignation and men who are so beguiled and demoralized by the charms blinded.</span></p>	2024-12-31 06:31:35	2024-12-31 06:31:35
53	1	Position Description	<p>Trouble that are bound to ensue and equal blame belongs those who fail in their duty.</p>	2024-12-31 06:31:35	2024-12-31 06:31:35
54	1	HR Functions	<div class="description_box">\r\n                       <p>Nothing prevents our being able to do what we like best every pleasure is to be welcomed &amp; every pain avoided certain circumstances.</p>\r\n                    </div>\r\n                           <!--===============spacing==============-->\r\n                           <div class="pd_bottom_25"></div>\r\n                           <!--===============spacing==============-->\r\n                    <div class="content_box_cn style_one">\r\n                       <div class="txt_content">\r\n                          <h3>\r\n                             <a href="#" target="_blank" rel="nofollow">Open Communication</a>\r\n                          </h3>\r\n                          <p>Equal blame belongs to those who fail in their duty through weakness same duty.</p>\r\n                       </div>\r\n                    </div>\r\n                    \r\n                    <div class="content_box_cn  style_one">\r\n                       <div class="txt_content">\r\n                          <h3>\r\n                             <a href="#" target="_blank" rel="nofollow">Sharing a Vision</a>\r\n                          </h3>\r\n                          <p>Business it will frequently occur that pleasures have to be repudiated.</p>\r\n                       </div>\r\n                    </div>\r\n                    \r\n                    <div class="content_box_cn  style_one">\r\n                       <div class="txt_content">\r\n                          <h3>\r\n                             <a href="#" target="_blank" rel="nofollow">Recognizing Employee</a>\r\n                          </h3>\r\n                          <p>Holds in these matter to this principle selection he rejects pleasures to secure.</p>\r\n                       </div>\r\n                    </div>	2024-12-31 06:31:35	2024-12-31 06:31:35
67	8	Background Checks	<span style="color: rgb(74, 78, 86); font-family: Inter, sans-serif; font-size: 16px;">These cases are perfectly simple and easy to distinguish. In a free hour when our power.</span>	2024-12-31 20:56:34	2024-12-31 20:56:34
68	8	Profile Assessments	<span style="color: rgb(74, 78, 86); font-family: Inter, sans-serif; font-size: 16px;">Indignation and men who are so beguiled and demoralized by the charms blinded.</span>	2024-12-31 20:56:34	2024-12-31 20:56:34
69	8	Position Description	Trouble that are bound to ensue and equal blame belongs those who fail in their duty.	2024-12-31 20:56:34	2024-12-31 20:56:34
70	8	HR Functions	<div class="description_box"><p>Nothing prevents our being able to do what we like best every pleasure is to be welcomed &amp; every pain avoided certain circumstances.</p></div><div class="pd_bottom_25"></div><div class="content_box_cn style_one"><div class="txt_content"><h3 style="font-family: var(--vz-headings-font-family); font-weight: var(--vz-headings-font-weight); font-size: calc(var(--vz-font-base) * 1.75);"><a href="https://dxbitprojects.com/tasheel_web/public/admin/services/edit/1#" target="_blank" rel="nofollow">Open Communication</a></h3><p>Equal blame belongs to those who fail in their duty through weakness same duty.</p></div></div><div class="content_box_cn  style_one"><div class="txt_content"><h3 style="font-family: var(--vz-headings-font-family); font-weight: var(--vz-headings-font-weight); font-size: calc(var(--vz-font-base) * 1.75);"><a href="https://dxbitprojects.com/tasheel_web/public/admin/services/edit/1#" target="_blank" rel="nofollow" style="color: rgb(35, 82, 124); text-decoration: underline; --vz-link-color-rgb: var(--vz-link-hover-color-rgb);">Sharing a Vision</a></h3><p>Business it will frequently occur that pleasures have to be repudiated.</p></div></div><div class="content_box_cn  style_one"><div class="txt_content"><h3 style="font-family: var(--vz-headings-font-family); font-weight: var(--vz-headings-font-weight); font-size: calc(var(--vz-font-base) * 1.75);"><a href="https://dxbitprojects.com/tasheel_web/public/admin/services/edit/1#" target="_blank" rel="nofollow">Recognizing Employee</a></h3><p>Holds in these matter to this principle selection he rejects pleasures to secure.</p></div></div>	2024-12-31 20:56:34	2024-12-31 20:56:34
71	7	Background Checks	<span style="color: rgb(74, 78, 86); font-family: Inter, sans-serif; font-size: 16px;">These cases are perfectly simple and easy to distinguish. In a free hour when our power.</span>	2024-12-31 20:56:52	2024-12-31 20:56:52
72	7	Profile Assessments	<span style="color: rgb(74, 78, 86); font-family: Inter, sans-serif; font-size: 16px;">Indignation and men who are so beguiled and demoralized by the charms blinded.</span>	2024-12-31 20:56:52	2024-12-31 20:56:52
73	7	Position Description	Trouble that are bound to ensue and equal blame belongs those who fail in their duty.	2024-12-31 20:56:52	2024-12-31 20:56:52
74	7	HR Functions	<div class="description_box"><p>Nothing prevents our being able to do what we like best every pleasure is to be welcomed &amp; every pain avoided certain circumstances.</p></div><div class="pd_bottom_25"></div><div class="content_box_cn style_one"><div class="txt_content"><h3 style="font-family: var(--vz-headings-font-family); font-weight: var(--vz-headings-font-weight); font-size: calc(var(--vz-font-base) * 1.75);"><a href="https://dxbitprojects.com/tasheel_web/public/admin/services/edit/1#" target="_blank" rel="nofollow">Open Communication</a></h3><p>Equal blame belongs to those who fail in their duty through weakness same duty.</p></div></div><div class="content_box_cn  style_one"><div class="txt_content"><h3 style="font-family: var(--vz-headings-font-family); font-weight: var(--vz-headings-font-weight); font-size: calc(var(--vz-font-base) * 1.75);"><a href="https://dxbitprojects.com/tasheel_web/public/admin/services/edit/1#" target="_blank" rel="nofollow">Sharing a Vision</a></h3><p>Business it will frequently occur that pleasures have to be repudiated.</p></div></div><div class="content_box_cn  style_one"><div class="txt_content"><h3 style="font-family: var(--vz-headings-font-family); font-weight: var(--vz-headings-font-weight); font-size: calc(var(--vz-font-base) * 1.75);"><a href="https://dxbitprojects.com/tasheel_web/public/admin/services/edit/1#" target="_blank" rel="nofollow">Recognizing Employee</a></h3><p>Holds in these matter to this principle selection he rejects pleasures to secure.</p></div></div>	2024-12-31 20:56:52	2024-12-31 20:56:52
75	6	Names for the Document	<li><strong>Police Certificate</strong>: Commonly used in countries like the UK, US, and Canada.</li><li><strong>Good Conduct Certificate</strong>: Often used in Gulf countries and parts of Africa.</li><li><strong>Certificate of Non-Conviction</strong>: Refers explicitly to certifying no criminal convictions exist.</li>	2024-12-31 20:57:09	2024-12-31 20:57:09
76	6	Uses:	<li>Visa and immigration applications.</li><li>Employment applications, especially for sensitive positions.</li><li>University or educational program requirements.</li><li>Adoption processes.</li><li>Other legal or administrative purposes.</li>	2024-12-31 20:57:09	2024-12-31 20:57:09
77	6	Application Process:	Determine why you need the Police Verification Certificate (e.g., immigration, employment, education, or legal purposes). This will help you understand which type of certificate to apply for and which authority to approach..	2024-12-31 20:57:09	2024-12-31 20:57:09
78	6	Requirements	<div><b>Step 1: Identify the Purpose of the Certificate</b></div><div>Determine why you need the Police Verification Certificate (e.g., immigration, employment, education, or legal purposes). This will help you understand which type of certificate to apply for and which authority to approach.</div><div><br></div><div><b>Step 2: Check Eligibility</b></div><div>Ensure you meet the requirements for applying:</div><div><span style="background-color: var(--vz-card-bg); font-size: var(--vz-body-font-size); font-weight: var(--vz-body-font-weight); text-align: var(--vz-body-text-align);">Legal resident or citizen of the issuing country.</span><br></div><div>Valid identification documents.</div><div>Proof of residence or connection to the issuing country.</div><div>Step 3: Gather Required Documents</div><div>Commonly required documents include:</div><div><br></div><div>Identification: Passport, national ID, or driver’s license.</div><div>Address Proof: Utility bills, lease agreements, or voter ID.</div><div>Photographs: Recent passport-sized photos (check format requirements).</div><div>Purpose Proof: Letter from the requesting authority (e.g., embassy, employer).</div><div>Application Form: Available online or at the issuing office.</div><div><br></div>	2024-12-31 20:57:09	2024-12-31 20:57:09
83	5	Background Checks	<p><span style="color: rgb(74, 78, 86); font-family: Inter, sans-serif; font-size: 16px;">These cases are perfectly simple and easy to distinguish. In a free hour when our power.</span></p>	2024-12-31 20:57:34	2024-12-31 20:57:34
84	5	Profile Assessments	<p><span style="color: rgb(74, 78, 86); font-family: Inter, sans-serif; font-size: 16px;">Indignation and men who are so beguiled and demoralized by the charms blinded.</span></p>	2024-12-31 20:57:34	2024-12-31 20:57:34
85	5	Position Description	<p>Trouble that are bound to ensue and equal blame belongs those who fail in their duty.</p>	2024-12-31 20:57:34	2024-12-31 20:57:34
86	5	HR Functions	<div class="description_box">\r\n                       <p>Nothing prevents our being able to do what we like best every pleasure is to be welcomed &amp; every pain avoided certain circumstances.</p>\r\n                    </div>\r\n                           <!--===============spacing==============-->\r\n                           <div class="pd_bottom_25"></div>\r\n                           <!--===============spacing==============-->\r\n                    <div class="content_box_cn style_one">\r\n                       <div class="txt_content">\r\n                          <h3>\r\n                             <a href="#" target="_blank" rel="nofollow">Open Communication</a>\r\n                          </h3>\r\n                          <p>Equal blame belongs to those who fail in their duty through weakness same duty.</p>\r\n                       </div>\r\n                    </div>\r\n                    \r\n                    <div class="content_box_cn  style_one">\r\n                       <div class="txt_content">\r\n                          <h3>\r\n                             <a href="#" target="_blank" rel="nofollow">Sharing a Vision</a>\r\n                          </h3>\r\n                          <p>Business it will frequently occur that pleasures have to be repudiated.</p>\r\n                       </div>\r\n                    </div>\r\n                    \r\n                    <div class="content_box_cn  style_one">\r\n                       <div class="txt_content">\r\n                          <h3>\r\n                             <a href="#" target="_blank" rel="nofollow">Recognizing Employee</a>\r\n                          </h3>\r\n                          <p>Holds in these matter to this principle selection he rejects pleasures to secure.</p>\r\n                       </div>\r\n                    </div>	2024-12-31 20:57:34	2024-12-31 20:57:34
\.


--
-- Data for Name: service_faqs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_faqs (id, service_id, question, answer, created_at, updated_at) FROM stdin;
35	1	Who is Tasheel Legal Transilation?	Nor again is there anyone who loves or pursues or desires to obtain pain itself because it is pains but because occasionally circumstances occurs great pleasure take a trivial of us.	2024-12-31 06:31:35	2024-12-31 06:31:35
36	1	What recruitment services do you offer?	Serenity Is Multi-Faceted Blockchain Based Ecosystem, Energy Retailer For The People, Focusing On The Promotion Of Sustainable Living, Renewable Energy Production And Smart Energy Grid Utility Services.	2024-12-31 06:31:35	2024-12-31 06:31:35
37	1	How can I register a job?	Serenity Is Multi-Faceted Blockchain Based Ecosystem, Energy Retailer For The People, Focusing On The Promotion Of Sustainable Living, Renewable Energy Production And Smart Energy Grid Utility Services.	2024-12-31 06:31:35	2024-12-31 06:31:35
47	8	Who is Tasheel Legal Transilation?	Nor again is there anyone who loves or pursues or desires to obtain pain itself because it is pains but because occasionally circumstances occurs great pleasure take a trivial of us.	2024-12-31 20:56:34	2024-12-31 20:56:34
48	8	What recruitment services do you offer?	Serenity Is Multi-Faceted Blockchain Based Ecosystem, Energy Retailer For The People, Focusing On The Promotion Of Sustainable Living, Renewable Energy Production And Smart Energy Grid Utility Services.	2024-12-31 20:56:34	2024-12-31 20:56:34
49	8	How can I register a job?	Serenity Is Multi-Faceted Blockchain Based Ecosystem, Energy Retailer For The People, Focusing On The Promotion Of Sustainable Living, Renewable Energy Production And Smart Energy Grid Utility Services.	2024-12-31 20:56:34	2024-12-31 20:56:34
50	7	Who is Tasheel Document Attestation /Legal Translation?	Nor again is there anyone who loves or pursues or desires to obtain pain itself because it is pains but because occasionally circumstances occurs great pleasure take a trivial of us.	2024-12-31 20:56:52	2024-12-31 20:56:52
51	7	What recruitment services do you offer?	Serenity Is Multi-Faceted Blockchain Based Ecosystem, Energy Retailer For The People, Focusing On The Promotion Of Sustainable Living, Renewable Energy Production And Smart Energy Grid Utility Services.	2024-12-31 20:56:52	2024-12-31 20:56:52
52	7	How can I register a job?	Serenity Is Multi-Faceted Blockchain Based Ecosystem, Energy Retailer For The People, Focusing On The Promotion Of Sustainable Living, Renewable Energy Production And Smart Energy Grid Utility Services.	2024-12-31 20:56:52	2024-12-31 20:56:52
53	6	Verification of Criminal Record	Certifies whether an individual has a criminal record or not.\r\nActs as proof of good moral character for personal and professional purposes.	2024-12-31 20:57:09	2024-12-31 20:57:09
54	6	Immigration and Visa Applications	Mandatory for many immigration processes (e.g., permanent residency, work visas, or student visas).\r\nHelps authorities assess the applicant’s suitability for entry or residency in a foreign country.	2024-12-31 20:57:09	2024-12-31 20:57:09
58	5	Who is Tasheel Legal Transilation?	Nor again is there anyone who loves or pursues or desires to obtain pain itself because it is pains but because occasionally circumstances occurs great pleasure take a trivial of us.	2024-12-31 20:57:34	2024-12-31 20:57:34
59	5	What recruitment services do you offer?	Serenity Is Multi-Faceted Blockchain Based Ecosystem, Energy Retailer For The People, Focusing On The Promotion Of Sustainable Living, Renewable Energy Production And Smart Energy Grid Utility Services.	2024-12-31 20:57:34	2024-12-31 20:57:34
60	5	How can I register a job?	Serenity Is Multi-Faceted Blockchain Based Ecosystem, Energy Retailer For The People, Focusing On The Promotion Of Sustainable Living, Renewable Energy Production And Smart Energy Grid Utility Services.	2024-12-31 20:57:34	2024-12-31 20:57:34
\.


--
-- Data for Name: service_pricing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_pricing (id, service_id, translation_from, translation_to, price, status, created_at, updated_at) FROM stdin;
1	1	1	2	30.00	1	2024-12-27 08:56:46	2024-12-28 11:01:17
2	1	2	1	30.00	1	2024-12-28 11:03:32	2024-12-28 11:03:32
3	2	1	3	5.00	1	2024-12-28 11:21:03	2024-12-28 11:21:03
4	2	1	4	6.00	1	2024-12-28 11:21:26	2024-12-28 11:21:26
5	3	1	3	10.00	1	2024-12-28 11:21:45	2024-12-28 11:21:45
6	3	2	1	200.00	1	2024-12-30 10:16:59	2024-12-30 10:16:59
7	6	3	2	25.00	1	2024-12-31 06:02:37	2024-12-31 06:02:37
8	6	3	1	35.00	1	2024-12-31 06:02:58	2024-12-31 06:04:01
10	11	1	4	15.00	1	2024-12-31 06:56:29	2024-12-31 06:56:29
11	11	3	1	20.00	1	2024-12-31 06:56:55	2024-12-31 06:56:55
9	11	2	5	12.00	1	2024-12-31 06:56:02	2024-12-31 06:57:22
12	1	4	3	22.00	1	2024-12-31 06:58:08	2024-12-31 06:58:08
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, title, service_type_id, subtitle, description, status, created_at, updated_at, background_image, service_image, other_image, price_from, price_to) FROM stdin;
1	Legal Translation	1	Specialized translation of legal documents ensuring accuracy and compliance with legal standards.	<p>Legal translation is the process of translating legal documents, such as contracts, agreements, court rulings, patents, and other legal texts, from one language to another. This type of translation requires a high level of accuracy, as even small errors can lead to legal complications. Legal translators must have a deep understanding of both the source and target languages, as well as legal terminology and concepts in both jurisdictions. The goal is to ensure that the translated text carries the same legal meaning and implications as the original, making it crucial for use in legal proceedings, contracts, or official matter.</p>	1	2024-12-26 01:52:04	2024-12-31 06:31:35	1735177924676cb6c4c4a2b.jpg	1735177924676cb6c4c6ac1.png	1735177924676cb6c4c6c09.png	60	100
5	Certified translation	2	Specialized translation of legal documents ensuring accuracy and compliance with legal standards.	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	1	2024-12-26 07:59:37	2024-12-31 20:57:34	1735199977676d0ce9b28fd.jpg	1735199977676d0ce9b3f75.jpg	1735199977676d0ce9b4056.png	100	150
8	Notarized Translation	11	Translation verified by a notary public, providing legal authenticity for legal documents.	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	1	2024-12-31 06:55:00	2024-12-31 20:56:34	1735628100677395442583a.jpg	1735628462677396ae6a62c.png	17356281006773954426e62.jpg	10	15
7	Document Attestation/ Legalization	3	Legalize your documents worldwide	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	1	2024-12-31 06:41:25	2024-12-31 20:56:52	173562728567739215b899e.jpg	173562728567739215b9ea6.png	173562728567739215ba016.jpg	10	15
6	Police Certificate/ Good Conduct/ Non Conviction	6	Police Certificate, Good Conduct Certificate, or Certificate of Non-Conviction	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>	1	2024-12-30 11:19:59	2024-12-31 20:57:09	173555791167728317a8a20.png	1735557599677281df36e0f.jpg	1735557599677281df36ee2.jpg	100	200
\.


--
-- Data for Name: services_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services_types (id, name, status, created_at, updated_at) FROM stdin;
1	Legal Translation	1	2024-12-26 18:12:54	2024-12-26 18:12:54
2	Certified translation	1	2024-12-26 18:14:13	2024-12-26 18:14:13
3	Document Attestation/ Legalization	1	2024-12-27 08:58:44	2024-12-27 08:58:44
4	Embassies Services	1	2024-12-27 08:59:03	2024-12-27 08:59:03
5	Driving License (Local/ International)	1	2024-12-30 10:13:06	2024-12-30 10:13:06
6	Police Certificate/ Good Conduct/ Non Conviction	1	2024-12-30 10:13:24	2024-12-30 10:13:24
7	Apostille Service	1	2024-12-30 10:13:47	2024-12-30 10:13:47
8	Corporate Services	1	2024-12-30 10:14:07	2024-12-30 10:14:07
9	Municipality Services	1	2024-12-30 10:14:30	2024-12-30 10:14:30
10	Ministries Services	1	2024-12-30 10:14:48	2024-12-30 10:14:48
11	Notarized Translation	1	2024-12-30 10:15:24	2024-12-30 10:15:24
12	Professional Translation	1	2024-12-30 10:15:37	2024-12-30 10:15:37
13	Certified Translation	1	2024-12-30 10:15:52	2024-12-30 10:15:52
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
abMdWy4I3xFeB6VNDDwzIDz8a57baYptxZG5Du5Z	\N	2.49.102.162	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGdJdEIyaDVQZ1k0bE1EUXFtMTFndHNBSUhFNnNYb2Nxb2lBQXVieiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vdGFzaGVlbF93ZWIvcHVibGljL2ZhcSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1735722390
tnB8Zp5EuEPc4NHu3l4u71T4VSYE8UCQyzJQh8oM	\N	175.107.245.226	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlJwU1p0Tk91dnRLSVlsU3ptaHVsWDRQSWZIZ2tkdnBCZkQybHFpRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vdGFzaGVlbF93ZWIvcHVibGljIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1735697579
hSOTb3Q3nqM2eFSUYotsuT72CnUtn4ZLJyrzIX4k	\N	175.107.245.226	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoielFqVjZXNnRxMjF4ZXNGZU1yTGR5OWp1OHJDekNBaDdwZ3dYcnZBbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vdGFzaGVlbF93ZWIvcHVibGljL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1735697588
9rcMCcSkphFR7yeNki3YEU6F9y6ddGAHkJqVT0C1	\N	59.98.221.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzBlQWhrS3NEdWpFM3ZDV1pVRjhqWTFKTzdCZHhYTXprWllMZ0lNTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vdGFzaGVlbF93ZWIvcHVibGljL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1735722485
pL05cgcmwAnVLUr4OVWIv3z5DMerqYRGzHUdjXb7	1	175.107.245.226	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	YTo5OntzOjY6Il90b2tlbiI7czo0MDoiVVVXSExaUE14UFdiRUhZVXliSWdIamVCcnhnYjg3THAxNzBoNDEwciI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1OToiaHR0cHM6Ly9keGJpdHByb2plY3RzLmNvbS90YXNoZWVsX3dlYi9wdWJsaWMvYWRtaW4vaW5zaWdodHMiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo0NDoiaHR0cHM6Ly9keGJpdHByb2plY3RzLmNvbS90YXNoZWVsX3dlYi9wdWJsaWMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTE6InRvdGFsX3ByaWNlIjtpOjA7czoxMzoicHJpY2VfZGV0YWlscyI7TzozOToiSWxsdW1pbmF0ZVxEYXRhYmFzZVxFbG9xdWVudFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjA6e31zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fXM6MTE6IndvcmRzX2NvdW50IjtzOjM6IjEyMCI7czoyMjoidHJhbnNsYXRpb25fdHlwZV9wcmljZSI7aTowO30=	1735722751
mFOvQXLVJe7kdKcN3owlbAqYc4x5sfRxZFlqA0eX	\N	52.112.49.104	Mozilla/5.0 (Windows NT 6.1; WOW64) SkypeUriPreview Preview/0.5 skype-url-preview@microsoft.com	YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmltTnVGMjkxQ0pXRGlSQU9haGhnVGx6U3lTQ0VjNkN2V1BBY0daYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vdGFzaGVlbF93ZWIvcHVibGljL2ZhcSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1735712578
dmffO44pLHJjIYttmiIwE06R20DFJIEOszLIFlUI	\N	52.112.49.112	Mozilla/5.0 (Windows NT 6.1; WOW64) SkypeUriPreview Preview/0.5 skype-url-preview@microsoft.com	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXJvcEg3NTNlWjlFREp5ZGZqTHRKdWx1Wm4zNWpXY2ljR2FvV25FciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vdGFzaGVlbF93ZWIvcHVibGljIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1735720350
J3VtHtBfLxqaG3rqT9gJuhNBUGqb6MTkCkXbovzu	\N	2.48.69.57	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZE0zdEZjeG91aDVuOVh0MHBFR3RWZDBRcVZ6UTZ1amxYa2FZeHBBWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vdGFzaGVlbF93ZWIvcHVibGljL2ZhcSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1735721145
sFqFPXXRKMvc4Pf5AzC1d7QLhYnpo7fMvYj4oiW8	1	2.49.102.162	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36	YToxMDp7czo2OiJfdG9rZW4iO3M6NDA6Im04R0JoQ1ZiWWVSelpieEVVS3lnbUlEOTNNTVdOWFJ5Wjl1Z245bDciO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ4OiJodHRwczovL2R4Yml0cHJvamVjdHMuY29tL3Rhc2hlZWxfd2ViL3B1YmxpYy9mYXEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjExOiJ0b3RhbF9wcmljZSI7ZDoxNTEyO3M6MTM6InByaWNlX2RldGFpbHMiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjE6e2k6MDthOjM6e3M6NDoiZnJvbSI7czo2OiJBcmFiaWMiO3M6MjoidG8iO3M6NzoiRW5nbGlzaCI7czo1OiJwcmljZSI7ZDoxNTAwO319czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO31zOjExOiJ3b3Jkc19jb3VudCI7czoyOiI1MCI7czoyMjoidHJhbnNsYXRpb25fdHlwZV9wcmljZSI7aTowO3M6MTM6ImRlbGl2ZXJ5X3R5cGUiO3M6MjM6IkRJR0lUQUwgJiBQSFlTSUNBTCBDT1BZIjtzOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjY1OiJodHRwczovL2R4Yml0cHJvamVjdHMuY29tL3Rhc2hlZWxfd2ViL3B1YmxpYy9hZG1pbi9wYWdlcy9hYm91dC11cyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==	1735712516
BaNSvBa8Tre0sYgVgG7i3BJPpz3nA9v1v1ujXgVR	\N	52.112.49.112	Mozilla/5.0 (Windows NT 6.1; WOW64) SkypeUriPreview Preview/0.5 skype-url-preview@microsoft.com	YTozOntzOjY6Il90b2tlbiI7czo0MDoibmY5a1VMeWVpeUhDZVhGQk1CeU1SWWJJN2hReEQzbFQ5THJ2eU9PbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vdGFzaGVlbF93ZWIvcHVibGljL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1735720375
pe5uX5rT5IOoGjZUGOWIWZnyZ5MuSzajUFUp2aO1	\N	175.107.245.226	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1RGcjlYREdtOFRSS0RnNUcwc0FLcVBlUjBjQTFZRkdSSWxXbG1qWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vdGFzaGVlbF93ZWIvcHVibGljIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1735720972
D1PnFOkdr7PExzUZNtOwWkIRXipmzcmlaxylKkHA	\N	157.46.5.138	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGpuWWhoaTNremFZR1JQcDJvdzYyREpUdmg4Wmp1ZjJ1NjdRQXF4dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vdGFzaGVlbF93ZWIvcHVibGljL2ZhcSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1735723581
0RS1FutmKru4j8i2TnGIBKrLRHXceLbGVuvX8mB5	1	2.49.102.162	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTEpuS1pVVnBaRWlSdUxycWZ5RFB0eEFZYnpqbjRqcVJ3RUlhT21aRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vdGFzaGVlbF93ZWIvcHVibGljL2FkbWluL3doeWNob3NldXMvZWRpdC8xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo2ODoiaHR0cHM6Ly9keGJpdHByb2plY3RzLmNvbS90YXNoZWVsX3dlYi9wdWJsaWMvYWRtaW4vaG9tZV9wYWdlX2RldGFpbHMiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=	1735721506
P1F2vdnyaPczSnRRtsdzxlt17mFSt0jkWpf5GNgF	1	175.107.245.226	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTTZTMDF1ZWtrdzQ0Q2JrREFPT004cWpuRjY2aXZwNUtSNFlEYlAzViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vdGFzaGVlbF93ZWIvcHVibGljIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9	1735695768
nV9a4yU1hb3QJs39v5eJMAKPJ5eKaVn0duzS96t4	\N	175.107.245.226	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSjJhZ2V5WlA5ZVdPakFwUFU0WDVMeDltb3hoZjdTQ0FVYm5Ibm1PTCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1OToiaHR0cHM6Ly9keGJpdHByb2plY3RzLmNvbS90YXNoZWVsX3dlYi9wdWJsaWMvYWRtaW4vaW5zaWdodHMiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo1OToiaHR0cHM6Ly9keGJpdHByb2plY3RzLmNvbS90YXNoZWVsX3dlYi9wdWJsaWMvYWRtaW4vaW5zaWdodHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1735697588
fXghr2fMvQDxQZo3S3NeZdWtqb9EtsjoZxowf2A0	\N	103.148.21.31	Mozilla/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Mobile/15E148 Safari/604.1	YTozOntzOjY6Il90b2tlbiI7czo0MDoicWU3bVhIemVWWTRSY0VIUmVNZkxnWUd6cXQxaXJvaWpNblRRRDFRZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vdGFzaGVlbF93ZWIvcHVibGljIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1735697679
\.


--
-- Data for Name: site_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.site_settings (id, key, value, created_at, updated_at) FROM stdin;
1	email	info@tasheel.ps	2024-12-22 03:16:13	2024-12-22 03:19:21
2	phone_number	+972 56 220 0190	2024-12-22 03:16:13	2024-12-22 03:19:21
3	landline_number	0 229 1234	2024-12-22 03:16:13	2024-12-22 03:19:21
4	whatsapp_number	972562200190	2024-12-22 03:16:13	2024-12-22 03:19:21
5	facebook_url	https://www.facebook.com/	2024-12-22 03:16:13	2024-12-22 03:19:21
6	instagram_url	https://www.instagram.com/	2024-12-22 03:16:13	2024-12-22 03:19:21
\.


--
-- Data for Name: slider_buttons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.slider_buttons (id, slider_id, text, link, created_at, updated_at) FROM stdin;
20	1	Gaza Strip Services	https://www.google.com/	2024-12-23 07:08:39	2024-12-23 07:08:39
21	1	Palestinian Non-Resident Services	https://www.google.com/	2024-12-23 07:08:39	2024-12-23 07:08:39
22	2	Palestinian Non-Resident Services	https://www.google.com/	2024-12-23 07:11:41	2024-12-23 07:11:41
26	3	Button1	https://dx.co.ae/tasheel-html/3/index.html	2024-12-23 11:00:40	2024-12-23 11:00:40
27	3	Button2	https://dx.co.ae/tasheel-html/3/index.html	2024-12-23 11:00:40	2024-12-23 11:00:40
28	3	Button3	https://dx.co.ae/tasheel-html/3/index.html	2024-12-23 11:00:40	2024-12-23 11:00:40
\.


--
-- Data for Name: sliders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sliders (id, name, image, content, status, created_at, updated_at) FROM stdin;
1	Your Partner for Legal Docs & Translations!	173493771967690c77b4198.jpg	Our team of experts works diligently to provide efficient and hassle-free services, <br> \r\n                                       meeting your deadlines and exceeding your expectations.q	t	2024-12-22 20:45:58	2024-12-23 07:08:39
2	Your Partner for Legal Docs & Translationss!	173493790167690d2d80a64.jpg	Our team of experts works diligently to provide efficient and hassle-free services, <br> \r\n                                       meeting your deadlines and exceeding your expectations.	t	2024-12-22 21:27:50	2024-12-23 07:14:48
3	Trusted Translation, Certified $ Fast.	1734951640676942d8ed3c9.jpg	Our team of experts works diligently to provide efficient and hassle-free services, <br> \r\n                                       meeting your deadlines and exceeding your expectations.	t	2024-12-23 09:19:33	2024-12-23 11:00:40
\.


--
-- Data for Name: target_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.target_types (id, name, status, created_at, updated_at) FROM stdin;
4	Floor	1	2024-12-10 17:22:38	2024-12-16 14:21:51
3	KM1	1	2024-12-10 17:22:23	2024-12-17 19:57:14
\.


--
-- Data for Name: target_types_company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.target_types_company (id, company_id, name, status, created_at, updated_at) FROM stdin;
2	23	test1	1	2024-12-16 03:21:20	2024-12-16 03:21:20
3	23	test	1	2024-12-16 03:22:50	2024-12-16 03:22:50
\.


--
-- Data for Name: translation_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.translation_types (id, name, description, price_type, price, percentage, category, status, created_at, updated_at) FROM stdin;
1	STANDARD	1 - 2 days Monday at 7:52 PM (latest)	free	0.00	30.00	certified	1	2024-12-26 18:42:26	2024-12-30 16:04:09
2	EXPEDITED	15 - 24 hours Tomorrow at 7:52 PM (latest)	rush_fee	\N	50.00	certified	1	2024-12-26 18:43:01	2024-12-30 18:46:59
5	ONLY TRANSLATION	FOR THOSE WHO NEED ONLY PROFESSIONAL TRANSLATION.	free	0.00	\N	only_translation	1	2024-12-30 18:48:19	2024-12-30 18:48:19
6	NOTARIZED	INCLUDES AN OFFICIAL COVER PAGE WITH A RED SEAL, STAMPED WITH THE SIGNATURE OF THE LICENSED NOTARY PUBLIC.	fixed	29.50	\N	notarized	1	2024-12-30 18:50:17	2024-12-30 18:50:17
7	STANDARD	1 - 2 DAYS MONDAY AT 7:52 PM (LATEST)	free	0.00	\N	notarized	1	2024-12-30 18:55:20	2024-12-30 18:55:20
8	EXPEDITED	15 - 24 HOURS TOMORROW AT 7:52 PM (LATEST)	rush_fee	\N	30.00	notarized	1	2024-12-30 18:56:57	2024-12-30 18:56:57
9	DIGITAL DELIVERY	ARRIVES TO YOUR EMAIL IMMEDIATELY WHEN COMPLETED.	free	0.00	\N	notarized	1	2024-12-30 18:59:51	2024-12-30 18:59:51
10	STANDARD	1 - 2 DAYS MONDAY AT 7:52 PM (LATEST)	free	0.00	\N	only_translation	1	2024-12-30 19:10:05	2024-12-30 19:10:05
11	EXPEDITED	15 - 24 HOURS TOMORROW AT 7:52 PM (LATEST)	rush_fee	\N	30.00	only_translation	1	2024-12-30 19:13:42	2024-12-30 19:13:42
\.


--
-- Data for Name: translation_types_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.translation_types_categories (id, name, slug, status, created_at, updated_at, description, price_type, price, percentage) FROM stdin;
1	Certified	certified	1	2024-12-30 15:20:49	2024-12-31 18:27:38	Includes an official coversheet with the company header, stamp, and signature from a Licensed Translator, accredited by the Palestinian Ministry of Justice.	free	0.00	0.00
2	Only Translation	only_translation	1	2024-12-30 15:21:08	2024-12-31 18:27:59	For those who need only professional translation.	free	0.00	0.00
3	Notarized	notarized	1	2024-12-30 15:21:24	2024-12-31 18:28:17	Includes an official cover page with a red seal, stamped with the signature of the licensed Notary Public.	free	0.00	0.00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, first_name, last_name, dial_code, phone, country_id, emirates_id, city_id, company_id, status, deleted_at, role_id) FROM stdin;
7	Ahmed Hopper	zopeficyq@mailinator.com	\N	$2y$12$BBq4XgxNs2vj53P1g4byke8aklNVrAKAuGRzWEIVN.CGH0A3s5Oqa	\N	2024-12-05 20:21:59	2024-12-05 20:21:59	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N
8	Heather Schultz	pedalyzixa@mailinator.com	\N	$2y$12$lKQTDi4bGYpMtsUOOKH9YucUQwQqRo/.gjd.urDOFhL1A8CKZ8Yam	\N	2024-12-05 20:22:53	2024-12-05 20:22:53	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N
9	Yuli Everett	toxolo@mailinator.com	\N	$2y$12$hLDxEjynYgVwLLTAdSAcCuwX997wgoTYSzzrPNe/2tQnH1aMIQsh2	\N	2024-12-05 20:23:30	2024-12-05 20:23:30	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N
10	Dawn Acevedo	bavyxizawi@mailinator.com	\N	$2y$12$jA9v57p2MEOQP1u9Di6Sdeisut45QLZzUPN310316TyJ9tDVQqb8C	\N	2024-12-05 20:26:20	2024-12-05 20:26:20	Dawn	Acevedo	+91	8358264038	1	2	5	6	1	\N	\N
11	Joy Henderson	telagu@mailinator.com	\N	$2y$12$/FeLQPAjds6U1J0SB/ZKputaKZ5fkEKffiGLd4jLChBVxbZqMAjRK	\N	2024-12-05 20:28:51	2024-12-05 20:28:51	Joy	Henderson	+971	1633481266	1	2	5	6	1	\N	\N
12	Anthony Burke	hobafo@mailinator.com	\N	$2y$12$UOJ74BRwRcCXIIO5/X7wpu.gm2i4bbpq.zzrFc/U1eTRNz/fFP8/.	\N	2024-12-05 21:39:41	2024-12-05 21:39:41	Anthony	Burke	+91	6368074711	1	1	1	6	1	\N	\N
15	Ray and Holland Co	toqowa@mailinator.com	\N	$2y$12$R09zCd8WFkr3KKT4mcoXZ.2VcjyGp56s045nO9CuTUIsa3MrGLVEi	\N	2024-12-10 05:32:01	2024-12-10 05:32:01	\N	\N	971	4312345678	1	1	1	\N	1	\N	\N
33	Erich Lynn	tyte@mailinator.com	\N	$2y$12$B/Yqy3AKPs/pbBME.79Cre.YRT2PGS9JvRVHmlkCnBxLWEtdp5QWW	\N	2024-12-16 14:41:20	2024-12-19 19:38:37	Erich	Lynn	+971	3231231123	7	1	1	32	1	\N	\N
28	Hanna Sears	qyxavymano@mailinator.com	\N	$2y$12$J47Sq7zmbOXdeZZQ0d5KZONK4CwF8u5eY6IffDuWdT0dAKkq3hSW.	\N	2024-12-15 22:28:41	2024-12-15 22:40:43	Hanna	Sears	971	32423434	7	5	1	23	0	\N	\N
16	Asher Morton	mykoboqem@mailinator.com	\N	$2y$12$dsD4dbNnoH0Ohys4u6ftme3Jhkxm8zcPrTVyEc4.us9EWIPNc7CRG	\N	2024-12-10 06:20:04	2024-12-12 17:00:15	Asher	Morton	971	12312123	2	\N	1	2	0	2024-12-12 17:00:15	\N
17	Wade Hodge	xinozok@mailinator.com	\N	$2y$12$/1.ac8gQZZyULOdYr48KmOUQ45wnctU0UQA2sg3.1tnmaMxMLoCk.	\N	2024-12-12 17:24:24	2024-12-12 17:24:24	Wade	Hodge	\N	2313123123	2	0	0	1	1	\N	\N
18	Amy Palmer	beji@mailinator.com	\N	$2y$12$k9N7LgiLG/bAuDS9zNpbIe96E/F6kPiGWWOleqDNs8et1ekfS2aqK	\N	2024-12-12 17:27:02	2024-12-12 17:27:02	Amy	Palmer	\N	213122312	2	0	1	1	0	\N	3
13	Baldwin and Boyd LLC	fokupi@mailinator.com	\N	$2y$12$elFejuY0j6j1N0o9PCM8AerytRSeMbkCEglkV7dlvMK5cgoFRgemK	\N	2024-12-08 05:34:29	2024-12-13 18:20:46	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-12-13 18:20:46	\N
6	Rodriguez and Alford Trading	emirates@gmail.com	\N	$2y$12$Ki7Vd7xG6vQjkz3OzPClMOWnuv2n5p9ipCFmhw69tIh3v9Un2UaGy	\N	2024-12-05 18:24:50	2024-12-13 18:22:30	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-12-13 18:22:30	\N
5	Downs and Workman Trading	43543436y3@gdfgdf.kiu	\N	$2y$12$V6HnBnydTqgiGypVb6xqXuQOxkgl1LDfT.G8nI1TeUkr7vUJ7EB7u	\N	2024-12-05 15:50:01	2024-12-13 18:22:41	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-12-13 18:22:41	\N
4	Mason Peters Trading	qysewabawo@mailinator.com	\N	$2y$12$ynPkuRcVNPxiF1g3dPk6pODyf/pavc6KF7Od0RP9DR7SNT5ETH6kW	\N	2024-12-05 15:41:43	2024-12-13 18:22:47	\N	\N	\N	\N	\N	\N	\N	\N	0	2024-12-13 18:22:47	\N
3	Chen Vang LLC	diqyr@mailinator.com	\N	$2y$12$IUmiLAObBLlYUs13D4aWsewKgC53Zb62XitDG/3L1Akbq51yi..wm	\N	2024-12-05 15:39:43	2024-12-13 18:22:56	\N	\N	\N	\N	\N	\N	\N	\N	0	2024-12-13 18:22:56	\N
2	Woods and Haley Associates	gocajulevu@mailinator.com	\N	$2y$12$ov/2HliXhcRdXL3E2CrI9OdBlBPEhFtd.nT5rMccwXRqdj6x0HJkC	\N	2024-12-05 15:37:44	2024-12-13 18:23:02	\N	\N	\N	\N	\N	\N	\N	\N	0	2024-12-13 18:23:02	\N
24	Medge Patrick	sosadok@mailinator.com	\N	$2y$12$OzWKe9t6YXlG5JhRUbN5p.eukjrb.7qvNlYiCVLPUNeqNaU0jsYYi	\N	2024-12-13 19:11:02	2024-12-13 19:11:02	Medge	Patrick	971	23432433	4	4	3	9	1	\N	\N
26	Finn Pugh	xoxeqadu@mailinatorsdasdas	\N	$2y$12$q.d.cIJkhT/yJrnUbnCkNu5a.pYAc7urB6ylsshc7yXZKKFJHlU0e	\N	2024-12-15 22:17:09	2024-12-15 22:41:22	Finn	Pugh	971	34324234	8	3	7	10	1	\N	\N
25	Aspen Mullins	qagolesaru@mailinator.com	\N	$2y$12$PB14akgquQND94Uy8P8tSOllgj5EtlCHI7gEH53g7mkKLs7RG7986	\N	2024-12-13 19:19:04	2024-12-13 19:54:13	Aspen	Mullins	971	231231212	8	5	3	10	1	\N	\N
27	Quinn Walter	asddasdasdasd@sdasdasasdasdas	\N	$2y$12$2ZRsjmoitcldZCFHY2k78.feYhL2xaklIt0NyuwNpX.cycaoK0HVa	\N	2024-12-15 22:19:22	2024-12-15 22:41:26	Quinn	Walter	971	144234324	8	1	1	9	1	\N	\N
30	Isaiah Frazier	xufykukut@mailinator.com	\N	$2y$12$w8AzzEGoiG/mo33RZbckouFhmaxSU6Zl3gTWa.lxJ8hrUBZv.qTN2	\N	2024-12-15 23:17:35	2024-12-15 23:17:35	Isaiah	Frazier	+91	234234324234	2	1	1	23	1	\N	\N
31	Lacey Cantu	sapezuda@mailinator.com	\N	$2y$12$SlXTaVRI5A9oFZ.7kkPfH.gWcsze7uqogeffKuRCOEaQmtEA8Sh0q	\N	2024-12-16 04:30:58	2024-12-16 04:30:58	Lacey	Cantu	91	2423423234	4	4	7	23	0	\N	\N
32	Olsen and Johnston Inc	xeto@mailinator.com	\N	$2y$12$Ib65KlCBDfPbPgq/G78sUO9ZeeKm7VM.mz85AsQ9seg6qT7kto.5G	\N	2024-12-16 05:05:22	2024-12-19 21:54:10	\N	\N	971	143234234	2	4	7	\N	1	2024-12-19 21:54:10	\N
23	Farmer Dudley Traders	wujutavyj@mailinator.com	\N	$2y$12$a5khm/m.TuV35722ISKM7emuVe28Eq4WT7a0YI.4ipQmDy9BH3Zga	\N	2024-12-13 19:09:35	2024-12-19 21:55:04	\N	\N	\N	3534243223	2	4	7	\N	1	2024-12-19 21:55:04	\N
35	Morton Ratliff LLC	sasul@mailinator.com	\N	$2y$12$3OqqwuXWLiuemfe4fhC4c.LuLUJ5I.2DM02.mI8qwmAIol6QAry4G	\N	2024-12-19 21:56:22	2024-12-19 21:56:22	\N	\N	+9711	5434534334	2	4	7	\N	1	\N	\N
29	MacKensie Alford	xejufenuqo@mailinator.com	\N	$2y$12$RmnPDH4B5bahZ1Kktn59G.FX2dXrlyHYP7J6fxUEHAHWYBqpHxCDG	\N	2024-12-15 22:48:06	2024-12-19 21:43:20	MacKensie	Alford	91	23423423	5	5	1	23	1	\N	\N
34	Price Sutton Inc12112	mifomil@mailinator.com	\N	$2y$12$GUzu7PWwynx7SbyFrS3KTu2iVj..9zRH5HHSURKVKS2tcS8ourPAq	\N	2024-12-16 15:46:05	2024-12-19 21:50:46	\N	\N	+971	2312312312	2	1	1	\N	1	2024-12-19 21:50:46	\N
1	Admin User	admin@tasheel.com	\N	$2y$12$.yxPzTSPODYtVimFf4yPh.ldokb0K0nmvIKvCLR//AdrplJpBHebm	\N	2024-12-05 15:22:16	2024-12-05 15:22:16	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N
22	Quynnasd11 Hardy	newilapyw@mailinator.com	\N	$2y$12$T0c0LMgv.XaibDUPog.jE.b69JnNe2f87BgpmsTS1lNehELrFGHqm	\N	2024-12-13 18:42:14	2024-12-23 08:53:27	Quynnasd11	Hardy	+9711	23423423	2	4	3	35	1	\N	\N
36	Hiba User1	user1@gmail.com	\N	$2y$12$XuxWNmNgt6821jJ5NzXAnOddBVp9r0AWUTgHOukfHUW2HXfmpZ8qe	\N	2024-12-23 09:03:09	2024-12-23 09:03:09	Hiba	User1	+1	3352638322	2	1	1	35	1	\N	\N
\.


--
-- Data for Name: why_choose_us; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.why_choose_us (id, name, content, image, status, created_at, updated_at) FROM stdin;
1	Comprehensive Services	We provide a wide range of services under one roof, addressing all aspects of your documentation needs. Our comprehensive approach streamlines processes, saving you time and effort.	173569496367749a73df355.png	t	2025-01-01 01:29:23	2025-01-01 01:29:23
\.


--
-- Data for Name: work_process; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.work_process (id, name, content, image, status, created_at, updated_at) FROM stdin;
1	Find Your Requested Service	Explore our diverse range of services to quickly identify the solution that meets your needs.	173569507767749ae5f1fb1.png	t	2025-01-01 01:31:17	2025-01-01 01:31:17
\.


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_id_seq', 6, true);


--
-- Name: challenges_companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.challenges_companies_id_seq', 23, true);


--
-- Name: challenges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.challenges_id_seq', 20, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 7, true);


--
-- Name: cms_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cms_pages_id_seq', 3, true);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_id_seq', 13, true);


--
-- Name: contact_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_us_id_seq', 4, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 10, true);


--
-- Name: delivery_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.delivery_types_id_seq', 2, true);


--
-- Name: emirates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.emirates_id_seq', 5, true);


--
-- Name: event_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_types_id_seq', 3, true);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 5, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: faqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faqs_id_seq', 4, true);


--
-- Name: home_logos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_logos_id_seq', 1, true);


--
-- Name: home_page_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_page_settings_id_seq', 11, true);


--
-- Name: insights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insights_id_seq', 1, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.languages_id_seq', 5, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 66, true);


--
-- Name: packages_addons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.packages_addons_id_seq', 79, true);


--
-- Name: packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.packages_id_seq', 27, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 1, false);


--
-- Name: quotes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quotes_id_seq', 5, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- Name: service_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_details_id_seq', 86, true);


--
-- Name: service_faqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_faqs_id_seq', 60, true);


--
-- Name: service_pricing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_pricing_id_seq', 12, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_seq', 8, true);


--
-- Name: services_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_types_id_seq', 13, true);


--
-- Name: site_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.site_settings_id_seq', 6, true);


--
-- Name: slider_buttons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.slider_buttons_id_seq', 28, true);


--
-- Name: sliders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sliders_id_seq', 3, true);


--
-- Name: target_types_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.target_types_company_id_seq', 3, true);


--
-- Name: target_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.target_types_id_seq', 4, true);


--
-- Name: translation_types_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.translation_types_categories_id_seq', 3, true);


--
-- Name: translation_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.translation_types_id_seq', 11, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 36, true);


--
-- Name: why_choose_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.why_choose_us_id_seq', 1, true);


--
-- Name: work_process_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.work_process_id_seq', 1, true);


--
-- Name: bookings bookings_booking_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_booking_id_unique UNIQUE (booking_id);


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
-- Name: challenges_companies challenges_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges_companies
    ADD CONSTRAINT challenges_companies_pkey PRIMARY KEY (id);


--
-- Name: challenges challenges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges
    ADD CONSTRAINT challenges_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: cms_pages cms_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cms_pages
    ADD CONSTRAINT cms_pages_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: contact_us contact_us_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us
    ADD CONSTRAINT contact_us_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: delivery_types delivery_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_types
    ADD CONSTRAINT delivery_types_pkey PRIMARY KEY (id);


--
-- Name: emirates emirates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emirates
    ADD CONSTRAINT emirates_pkey PRIMARY KEY (id);


--
-- Name: event_types event_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_types
    ADD CONSTRAINT event_types_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


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
-- Name: faqs faqs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faqs
    ADD CONSTRAINT faqs_pkey PRIMARY KEY (id);


--
-- Name: home_logos home_logos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_logos
    ADD CONSTRAINT home_logos_pkey PRIMARY KEY (id);


--
-- Name: home_page_settings home_page_settings_key_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_page_settings
    ADD CONSTRAINT home_page_settings_key_unique UNIQUE (key);


--
-- Name: home_page_settings home_page_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_page_settings
    ADD CONSTRAINT home_page_settings_pkey PRIMARY KEY (id);


--
-- Name: insights insights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insights
    ADD CONSTRAINT insights_pkey PRIMARY KEY (id);


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
-- Name: languages languages_code_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_code_unique UNIQUE (code);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


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
-- Name: packages_addons packages_addons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages_addons
    ADD CONSTRAINT packages_addons_pkey PRIMARY KEY (id);


--
-- Name: packages packages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (id);


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
-- Name: quotes quotes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quotes
    ADD CONSTRAINT quotes_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


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
-- Name: service_details service_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_details
    ADD CONSTRAINT service_details_pkey PRIMARY KEY (id);


--
-- Name: service_faqs service_faqs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_faqs
    ADD CONSTRAINT service_faqs_pkey PRIMARY KEY (id);


--
-- Name: service_pricing service_pricing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pricing
    ADD CONSTRAINT service_pricing_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: services_types services_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services_types
    ADD CONSTRAINT services_types_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: site_settings site_settings_key_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_key_unique UNIQUE (key);


--
-- Name: site_settings site_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_pkey PRIMARY KEY (id);


--
-- Name: slider_buttons slider_buttons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slider_buttons
    ADD CONSTRAINT slider_buttons_pkey PRIMARY KEY (id);


--
-- Name: sliders sliders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sliders
    ADD CONSTRAINT sliders_pkey PRIMARY KEY (id);


--
-- Name: target_types_company target_types_company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_types_company
    ADD CONSTRAINT target_types_company_pkey PRIMARY KEY (id);


--
-- Name: target_types target_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_types
    ADD CONSTRAINT target_types_pkey PRIMARY KEY (id);


--
-- Name: translation_types_categories translation_types_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translation_types_categories
    ADD CONSTRAINT translation_types_categories_pkey PRIMARY KEY (id);


--
-- Name: translation_types_categories translation_types_categories_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translation_types_categories
    ADD CONSTRAINT translation_types_categories_slug_unique UNIQUE (slug);


--
-- Name: translation_types translation_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translation_types
    ADD CONSTRAINT translation_types_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: why_choose_us why_choose_us_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.why_choose_us
    ADD CONSTRAINT why_choose_us_pkey PRIMARY KEY (id);


--
-- Name: work_process work_process_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_process
    ADD CONSTRAINT work_process_pkey PRIMARY KEY (id);


--
-- Name: delivery_types_translation_type_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX delivery_types_translation_type_id_index ON public.delivery_types USING btree (translation_type_id);


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
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: events events_event_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_event_type_id_foreign FOREIGN KEY (event_type_id) REFERENCES public.event_types(id) ON DELETE CASCADE;


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
-- Name: quotes quotes_service_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quotes
    ADD CONSTRAINT quotes_service_id_foreign FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


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
-- Name: service_details service_details_service_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_details
    ADD CONSTRAINT service_details_service_id_foreign FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: service_faqs service_faqs_service_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_faqs
    ADD CONSTRAINT service_faqs_service_id_foreign FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: slider_buttons slider_buttons_slider_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slider_buttons
    ADD CONSTRAINT slider_buttons_slider_id_foreign FOREIGN KEY (slider_id) REFERENCES public.sliders(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

