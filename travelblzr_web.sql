--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-2.pgdg20.04+1)
-- Dumped by pg_dump version 15.12 (Ubuntu 15.12-1.pgdg20.04+1)

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
-- Name: activity_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity_log (
    id bigint NOT NULL,
    log_name character varying(255),
    description text NOT NULL,
    subject_type character varying(255),
    subject_id bigint,
    causer_type character varying(255),
    causer_id bigint,
    properties json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    event character varying(255),
    batch_uuid uuid
);


ALTER TABLE public.activity_log OWNER TO postgres;

--
-- Name: activity_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activity_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activity_log_id_seq OWNER TO postgres;

--
-- Name: activity_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activity_log_id_seq OWNED BY public.activity_log.id;


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
-- Name: checklists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.checklists (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    journey_id bigint NOT NULL,
    item character varying(255) NOT NULL,
    is_checked boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.checklists OWNER TO postgres;

--
-- Name: checklists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.checklists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checklists_id_seq OWNER TO postgres;

--
-- Name: checklists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.checklists_id_seq OWNED BY public.checklists.id;


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
-- Name: cost_breakdown_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cost_breakdown_items (
    id bigint NOT NULL,
    cost_breakdown_id bigint NOT NULL,
    item character varying(255) NOT NULL,
    price character varying(255) NOT NULL,
    parent_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.cost_breakdown_items OWNER TO postgres;

--
-- Name: cost_breakdown_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cost_breakdown_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cost_breakdown_items_id_seq OWNER TO postgres;

--
-- Name: cost_breakdown_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cost_breakdown_items_id_seq OWNED BY public.cost_breakdown_items.id;


--
-- Name: cost_breakdowns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cost_breakdowns (
    id bigint NOT NULL,
    journey_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.cost_breakdowns OWNER TO postgres;

--
-- Name: cost_breakdowns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cost_breakdowns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cost_breakdowns_id_seq OWNER TO postgres;

--
-- Name: cost_breakdowns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cost_breakdowns_id_seq OWNED BY public.cost_breakdowns.id;


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
-- Name: est_person_cost_journeys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.est_person_cost_journeys (
    id bigint NOT NULL,
    journey_id bigint NOT NULL,
    price_range character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.est_person_cost_journeys OWNER TO postgres;

--
-- Name: est_person_cost_journeys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.est_person_cost_journeys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.est_person_cost_journeys_id_seq OWNER TO postgres;

--
-- Name: est_person_cost_journeys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.est_person_cost_journeys_id_seq OWNED BY public.est_person_cost_journeys.id;


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
-- Name: followers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.followers (
    id bigint NOT NULL,
    follower_id bigint NOT NULL,
    followed_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.followers OWNER TO postgres;

--
-- Name: followers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.followers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.followers_id_seq OWNER TO postgres;

--
-- Name: followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.followers_id_seq OWNED BY public.followers.id;


--
-- Name: itineraries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.itineraries (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    journey_id bigint NOT NULL,
    date date NOT NULL,
    description text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    start_time time(0) without time zone,
    end_time time(0) without time zone
);


ALTER TABLE public.itineraries OWNER TO postgres;

--
-- Name: itineraries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.itineraries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itineraries_id_seq OWNER TO postgres;

--
-- Name: itineraries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.itineraries_id_seq OWNED BY public.itineraries.id;


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
-- Name: journey_participants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journey_participants (
    id bigint NOT NULL,
    journey_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.journey_participants OWNER TO postgres;

--
-- Name: journey_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.journey_participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journey_participants_id_seq OWNER TO postgres;

--
-- Name: journey_participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journey_participants_id_seq OWNED BY public.journey_participants.id;


--
-- Name: journeys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journeys (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    destination character varying(255) NOT NULL,
    accommodation character varying(255) NOT NULL,
    accommodation_link text,
    date date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    user_id bigint,
    start_date date,
    end_date date,
    map_link text,
    cost numeric(8,2),
    small_description text
);


ALTER TABLE public.journeys OWNER TO postgres;

--
-- Name: journeys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.journeys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journeys_id_seq OWNER TO postgres;

--
-- Name: journeys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journeys_id_seq OWNED BY public.journeys.id;


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
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    image character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_id_seq OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


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
-- Name: personals_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personals_access_tokens (
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


ALTER TABLE public.personals_access_tokens OWNER TO postgres;

--
-- Name: personals_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personals_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personals_access_tokens_id_seq OWNER TO postgres;

--
-- Name: personals_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personals_access_tokens_id_seq OWNED BY public.personals_access_tokens.id;


--
-- Name: poll_options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.poll_options (
    id bigint NOT NULL,
    poll_id bigint NOT NULL,
    option_text character varying(255) NOT NULL,
    votes integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.poll_options OWNER TO postgres;

--
-- Name: poll_options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.poll_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.poll_options_id_seq OWNER TO postgres;

--
-- Name: poll_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.poll_options_id_seq OWNED BY public.poll_options.id;


--
-- Name: polls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.polls (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    journey_id bigint NOT NULL,
    question text NOT NULL,
    date date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.polls OWNER TO postgres;

--
-- Name: polls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.polls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.polls_id_seq OWNER TO postgres;

--
-- Name: polls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.polls_id_seq OWNED BY public.polls.id;


--
-- Name: post_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_comments (
    id bigint NOT NULL,
    post_id bigint NOT NULL,
    user_id bigint NOT NULL,
    comment text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.post_comments OWNER TO postgres;

--
-- Name: post_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_comments_id_seq OWNER TO postgres;

--
-- Name: post_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_comments_id_seq OWNED BY public.post_comments.id;


--
-- Name: post_likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_likes (
    id bigint NOT NULL,
    post_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.post_likes OWNER TO postgres;

--
-- Name: post_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_likes_id_seq OWNER TO postgres;

--
-- Name: post_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_likes_id_seq OWNED BY public.post_likes.id;


--
-- Name: post_shares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_shares (
    id bigint NOT NULL,
    post_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.post_shares OWNER TO postgres;

--
-- Name: post_shares_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_shares_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_shares_id_seq OWNER TO postgres;

--
-- Name: post_shares_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_shares_id_seq OWNED BY public.post_shares.id;


--
-- Name: post_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    status boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.post_types OWNER TO postgres;

--
-- Name: post_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_types_id_seq OWNER TO postgres;

--
-- Name: post_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_types_id_seq OWNED BY public.post_types.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    title character varying(255),
    description text NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    image text,
    comments bigint DEFAULT '0'::bigint NOT NULL,
    post_type bigint,
    postdate date,
    post_video text,
    poll_question text,
    poll_options json,
    post_id character varying(255)
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


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
-- Name: target_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.target_types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    company_id bigint
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
-- Name: temp_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_users (
    id bigint NOT NULL,
    name character varying(255),
    email character varying(255),
    dial_code character varying(255),
    phone character varying(255),
    phone_verified integer DEFAULT 0 NOT NULL,
    active integer DEFAULT 0 NOT NULL,
    email_verified integer DEFAULT 0 NOT NULL,
    password character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    role character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    user_image character varying(255),
    user_phone_otp character varying(255),
    user_email_otp character varying(255),
    user_device_token character varying(255),
    user_device_type character varying(255),
    user_access_token character varying(255),
    firebase_user_key character varying(255),
    device_cart_id character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    username text
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
    role_id bigint,
    qr_code character varying(255),
    username character varying(255),
    profile_picture character varying(255),
    is_social character varying(255) DEFAULT '0'::character varying,
    email_verified character varying(255) DEFAULT '0'::character varying NOT NULL,
    phone_verified character varying(255) DEFAULT '0'::character varying NOT NULL,
    user_email_otp character varying(255),
    user_phone_otp character varying(255),
    user_device_type character varying(255),
    user_device_token character varying(255),
    trade_license text,
    user_access_token text,
    firebase_user_key text,
    password_reset_code text,
    password_reset_time text,
    password_reset_otp text,
    bio text
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
-- Name: activity_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_log ALTER COLUMN id SET DEFAULT nextval('public.activity_log_id_seq'::regclass);


--
-- Name: challenges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges ALTER COLUMN id SET DEFAULT nextval('public.challenges_id_seq'::regclass);


--
-- Name: challenges_companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges_companies ALTER COLUMN id SET DEFAULT nextval('public.challenges_companies_id_seq'::regclass);


--
-- Name: checklists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checklists ALTER COLUMN id SET DEFAULT nextval('public.checklists_id_seq'::regclass);


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
-- Name: cost_breakdown_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_breakdown_items ALTER COLUMN id SET DEFAULT nextval('public.cost_breakdown_items_id_seq'::regclass);


--
-- Name: cost_breakdowns id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_breakdowns ALTER COLUMN id SET DEFAULT nextval('public.cost_breakdowns_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: emirates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emirates ALTER COLUMN id SET DEFAULT nextval('public.emirates_id_seq'::regclass);


--
-- Name: est_person_cost_journeys id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.est_person_cost_journeys ALTER COLUMN id SET DEFAULT nextval('public.est_person_cost_journeys_id_seq'::regclass);


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
-- Name: followers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.followers ALTER COLUMN id SET DEFAULT nextval('public.followers_id_seq'::regclass);


--
-- Name: itineraries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itineraries ALTER COLUMN id SET DEFAULT nextval('public.itineraries_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: journey_participants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journey_participants ALTER COLUMN id SET DEFAULT nextval('public.journey_participants_id_seq'::regclass);


--
-- Name: journeys id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journeys ALTER COLUMN id SET DEFAULT nextval('public.journeys_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


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
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: personals_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personals_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personals_access_tokens_id_seq'::regclass);


--
-- Name: poll_options id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poll_options ALTER COLUMN id SET DEFAULT nextval('public.poll_options_id_seq'::regclass);


--
-- Name: polls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls ALTER COLUMN id SET DEFAULT nextval('public.polls_id_seq'::regclass);


--
-- Name: post_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments ALTER COLUMN id SET DEFAULT nextval('public.post_comments_id_seq'::regclass);


--
-- Name: post_likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_likes ALTER COLUMN id SET DEFAULT nextval('public.post_likes_id_seq'::regclass);


--
-- Name: post_shares id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_shares ALTER COLUMN id SET DEFAULT nextval('public.post_shares_id_seq'::regclass);


--
-- Name: post_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_types ALTER COLUMN id SET DEFAULT nextval('public.post_types_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: target_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_types ALTER COLUMN id SET DEFAULT nextval('public.target_types_id_seq'::regclass);


--
-- Name: target_types_company id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_types_company ALTER COLUMN id SET DEFAULT nextval('public.target_types_company_id_seq'::regclass);


--
-- Name: temp_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users ALTER COLUMN id SET DEFAULT nextval('public.temp_users_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: activity_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activity_log (id, log_name, description, subject_type, subject_id, causer_type, causer_id, properties, created_at, updated_at, event, batch_uuid) FROM stdin;
1	user	updated	App\\Models\\User	6	App\\Models\\User	1	{"attributes":{"first_name":"Carissa2","last_name":"Middleton","email":"lomun@mailinator.com","status":1},"old":{"first_name":"Carissa","last_name":"Middleton","email":"lomun@mailinator.com","status":1}}	2025-04-21 09:21:24	2025-04-21 09:21:24	updated	\N
2	user	User updated	App\\Models\\User	6	App\\Models\\User	1	{"attributes":{"first_name":"Carissa2e","last_name":"Middleton","email":"lomun@mailinator.com","status":1},"old":{"first_name":"Carissa2","last_name":"Middleton","email":"lomun@mailinator.com","status":1},"ip":"101.53.247.10","description":"User updated"}	2025-04-21 10:22:18	2025-04-21 10:22:18	updated	\N
3	user	User updated	App\\Models\\User	5	App\\Models\\User	1	{"attributes":{"first_name":"Darius","last_name":"Whitaker","email":"jazybugij@mailinator.com","status":1},"old":{"first_name":"Darius","last_name":"Whitaker","email":"jazybugij@mailinator.com","status":1},"ip":"101.53.247.10","description":"User updated"}	2025-04-21 10:22:37	2025-04-21 10:22:37	updated	\N
4	user	User updated	App\\Models\\User	5	App\\Models\\User	1	{"attributes":{"first_name":"Darius","last_name":"Whitaker","email":"jazybugij@mailinator.com","status":1},"old":{"first_name":"Darius","last_name":"Whitaker","email":"jazybugij@mailinator.com","status":"1"},"ip":"101.53.247.10","description":"User updated"}	2025-04-21 10:22:37	2025-04-21 10:22:37	updated	\N
5	user	User deleted	App\\Models\\User	3	App\\Models\\User	1	{"old":{"first_name":"Adele","last_name":"Brown","email":"migyhul@mailinator.com","status":1},"ip":"101.53.247.10","description":"User deleted"}	2025-04-21 10:22:52	2025-04-21 10:22:52	deleted	\N
6	user	User created	App\\Models\\User	11	App\\Models\\User	1	{"attributes":{"first_name":"Karina","last_name":"Gibson","email":"fawag@mailinator.com","status":0},"ip":"154.192.155.231","description":"User created"}	2025-04-21 14:03:00	2025-04-21 14:03:00	created	\N
7	user	User updated	App\\Models\\User	11	App\\Models\\User	1	{"attributes":{"first_name":"Karina","last_name":"Gibson","email":"fawag@mailinator.com","status":0},"old":{"first_name":"Karina","last_name":"Gibson","email":"fawag@mailinator.com","status":"0"},"ip":"154.192.155.231","description":"User updated"}	2025-04-21 14:03:00	2025-04-21 14:03:00	updated	\N
8	user	User deleted	App\\Models\\User	11	App\\Models\\User	1	{"old":{"first_name":"Karina","last_name":"Gibson","email":"fawag@mailinator.com","status":0},"ip":"217.165.127.57","description":"User deleted"}	2025-04-22 12:26:36	2025-04-22 12:26:36	deleted	\N
9	user	User deleted	App\\Models\\User	4	App\\Models\\User	1	{"old":{"first_name":"Chester","last_name":"Valenzuela","email":"cowytavo@mailinator.com","status":1},"ip":"217.165.127.57","description":"User deleted"}	2025-04-22 12:26:47	2025-04-22 12:26:47	deleted	\N
10	user	User deleted	App\\Models\\User	2	App\\Models\\User	1	{"old":{"first_name":"Charissa","last_name":"Ross","email":"sajyfu@mailinator.com","status":1},"ip":"217.165.127.57","description":"User deleted"}	2025-04-22 12:26:53	2025-04-22 12:26:53	deleted	\N
11	user	User created	App\\Models\\User	12	App\\Models\\User	1	{"attributes":{"first_name":"John","last_name":"David","email":"john@gmail.com","status":1},"ip":"217.165.127.57","description":"User created"}	2025-04-22 12:27:49	2025-04-22 12:27:49	created	\N
12	user	User updated	App\\Models\\User	12	App\\Models\\User	1	{"attributes":{"first_name":"John","last_name":"David","email":"john@gmail.com","status":1},"old":{"first_name":"John","last_name":"David","email":"john@gmail.com","status":"1"},"ip":"217.165.127.57","description":"User updated"}	2025-04-22 12:27:49	2025-04-22 12:27:49	updated	\N
13	user	User created	App\\Models\\User	13	App\\Models\\User	1	{"attributes":{"first_name":"Armaan","last_name":"Malik","email":"armaan@hotmail.com","status":1},"ip":"217.165.127.57","description":"User created"}	2025-04-22 12:28:42	2025-04-22 12:28:42	created	\N
14	user	User updated	App\\Models\\User	13	App\\Models\\User	1	{"attributes":{"first_name":"Armaan","last_name":"Malik","email":"armaan@hotmail.com","status":1},"old":{"first_name":"Armaan","last_name":"Malik","email":"armaan@hotmail.com","status":"1"},"ip":"217.165.127.57","description":"User updated"}	2025-04-22 12:28:42	2025-04-22 12:28:42	updated	\N
15	user	User created	App\\Models\\User	14	App\\Models\\User	1	{"attributes":{"first_name":"Leena","last_name":"Metha","email":"leena@hotmail.com","status":1},"ip":"217.165.127.57","description":"User created"}	2025-04-22 12:48:37	2025-04-22 12:48:37	created	\N
16	user	User updated	App\\Models\\User	14	App\\Models\\User	1	{"attributes":{"first_name":"Leena","last_name":"Metha","email":"leena@hotmail.com","status":1},"old":{"first_name":"Leena","last_name":"Metha","email":"leena@hotmail.com","status":"1"},"ip":"217.165.127.57","description":"User updated"}	2025-04-22 12:48:37	2025-04-22 12:48:37	updated	\N
17	user	User updated	App\\Models\\User	14	App\\Models\\User	1	{"attributes":{"first_name":"Leena","last_name":"Metha","email":"leena@hotmail.com","status":1},"old":{"first_name":"Leena","last_name":"Metha","email":"leena@hotmail.com","status":1},"ip":"217.165.127.57","description":"User updated"}	2025-04-22 12:48:52	2025-04-22 12:48:52	updated	\N
18	user	User created	App\\Models\\User	15	App\\Models\\User	1	{"attributes":{"first_name":"Doe","last_name":"Halk","email":"doe@gmail.com","status":1},"ip":"217.165.127.57","description":"User created"}	2025-04-22 13:11:54	2025-04-22 13:11:54	created	\N
19	user	User updated	App\\Models\\User	15	App\\Models\\User	1	{"attributes":{"first_name":"Doe","last_name":"Halk","email":"doe@gmail.com","status":1},"old":{"first_name":"Doe","last_name":"Halk","email":"doe@gmail.com","status":"1"},"ip":"217.165.127.57","description":"User updated"}	2025-04-22 13:11:54	2025-04-22 13:11:54	updated	\N
20	user	User updated	App\\Models\\User	14	App\\Models\\User	1	{"attributes":{"first_name":"Leenaa","last_name":"Metha","email":"leena@hotmail.com","status":1},"old":{"first_name":"Leena","last_name":"Metha","email":"leena@hotmail.com","status":1},"ip":"124.29.227.220","description":"User updated"}	2025-04-24 04:59:22	2025-04-24 04:59:22	updated	\N
21	user	User updated	App\\Models\\User	14	App\\Models\\User	1	{"attributes":{"first_name":"Leena","last_name":"Metha","email":"leena@hotmail.com","status":1},"old":{"first_name":"Leenaa","last_name":"Metha","email":"leena@hotmail.com","status":1},"ip":"124.29.227.220","description":"User updated"}	2025-04-24 05:01:00	2025-04-24 05:01:00	updated	\N
22	user	User updated	App\\Models\\User	15	App\\Models\\User	1	{"attributes":{"first_name":"Doejohn","last_name":"Halk","email":"doe@gmail.com","status":1},"old":{"first_name":"Doe","last_name":"Halk","email":"doe@gmail.com","status":1},"ip":"124.29.227.220","description":"User updated"}	2025-04-24 05:05:39	2025-04-24 05:05:39	updated	\N
23	user	User created	App\\Models\\User	16	App\\Models\\User	1	{"attributes":{"first_name":"Christine","last_name":"Snow","email":"tudohiqiv@mailinator.com","status":1},"ip":"124.29.227.220","description":"User created"}	2025-04-24 06:53:40	2025-04-24 06:53:40	created	\N
24	user	User updated	App\\Models\\User	16	App\\Models\\User	1	{"attributes":{"first_name":"Christine","last_name":"Snow","email":"tudohiqiv@mailinator.com","status":1},"old":{"first_name":"Christine","last_name":"Snow","email":"tudohiqiv@mailinator.com","status":"1"},"ip":"124.29.227.220","description":"User updated"}	2025-04-24 06:53:40	2025-04-24 06:53:40	updated	\N
25	user	User deleted	App\\Models\\User	16	App\\Models\\User	1	{"old":{"first_name":"Christine","last_name":"Snow","email":"tudohiqiv@mailinator.com","status":1},"ip":"217.165.127.57","description":"User deleted"}	2025-04-24 07:09:33	2025-04-24 07:09:33	deleted	\N
26	user	User updated	App\\Models\\User	15	App\\Models\\User	1	{"attributes":{"first_name":"Doejohnn","last_name":"Halk","email":"doe@gmail.com","status":1},"old":{"first_name":"Doejohn","last_name":"Halk","email":"doe@gmail.com","status":1},"ip":"124.29.227.220","description":"User updated"}	2025-04-24 07:11:18	2025-04-24 07:11:18	updated	\N
27	user	User updated	App\\Models\\User	13	App\\Models\\User	1	{"attributes":{"first_name":"Armaan","last_name":"Malik","email":"armaan@hotmail.com","status":1},"old":{"first_name":"Armaan","last_name":"Malik","email":"armaan@hotmail.com","status":1},"ip":"217.165.127.57","description":"User updated"}	2025-04-24 07:12:47	2025-04-24 07:12:47	updated	\N
28	user	User updated	App\\Models\\User	14	App\\Models\\User	1	{"attributes":{"first_name":"Leena","last_name":"Metha","email":"leena@hotmail.com","status":1},"old":{"first_name":"Leena","last_name":"Metha","email":"leena@hotmail.com","status":1},"ip":"217.165.127.57","description":"User updated"}	2025-04-24 07:18:21	2025-04-24 07:18:21	updated	\N
29	journey	Journey updated	App\\Models\\Journey	5	App\\Models\\User	1	{"attributes":{"title":"Expo April","description":null,"status":null},"old":{"title":"Expo April","description":null,"status":null}}	2025-04-24 07:33:36	2025-04-24 07:33:36	updated	\N
30	journey	Journey updated	App\\Models\\Journey	5	App\\Models\\User	1	{"attributes":{"title":"Expo April","description":null,"status":null},"old":{"title":"Expo April","description":null,"status":null},"ip":"124.29.227.220","description":"Journey updated"}	2025-04-24 07:53:20	2025-04-24 07:53:20	updated	\N
31	journey	Journey created	App\\Models\\Journey	6	App\\Models\\User	1	{"attributes":{"title":"Dubai","description":null,"status":null},"ip":"124.29.227.220","description":"Journey created"}	2025-04-27 05:01:41	2025-04-27 05:01:41	created	\N
32	journey	Journey updated	App\\Models\\Journey	6	App\\Models\\User	1	{"attributes":{"title":"Abu Dubai","description":null,"status":null},"old":{"title":"Dubai","description":null,"status":null},"ip":"124.29.227.220","description":"Journey updated"}	2025-04-27 05:03:28	2025-04-27 05:03:28	updated	\N
33	journey	Journey created	App\\Models\\Journey	7	App\\Models\\User	1	{"attributes":{"title":"Dubai","description":null,"status":null},"ip":"124.29.227.220","description":"Journey created"}	2025-04-27 05:12:00	2025-04-27 05:12:00	created	\N
34	journey	Journey created	App\\Models\\Journey	8	App\\Models\\User	1	{"attributes":{"title":"Dessert Safari","description":null,"status":null},"ip":"124.29.227.220","description":"Journey created"}	2025-04-27 05:24:26	2025-04-27 05:24:26	created	\N
35	journey	Journey updated	App\\Models\\Journey	8	App\\Models\\User	1	{"attributes":{"title":"Dessert Safari","description":null,"status":null},"old":{"title":"Dessert Safari","description":null,"status":null},"ip":"124.29.227.220","description":"Journey updated"}	2025-04-27 05:24:48	2025-04-27 05:24:48	updated	\N
36	journey	Journey created	App\\Models\\Journey	10	App\\Models\\User	1	{"attributes":{"title":"Desert Safari","description":null,"status":null},"ip":"49.37.234.44","description":"Journey created"}	2025-04-27 05:55:27	2025-04-27 05:55:27	created	\N
37	journey	Journey deleted	App\\Models\\Journey	4	App\\Models\\User	1	{"old":{"title":"Expo 2025","description":null,"status":null},"ip":"217.165.127.57","description":"Journey deleted"}	2025-04-28 05:51:26	2025-04-28 05:51:26	deleted	\N
38	journey	Journey deleted	App\\Models\\Journey	5	App\\Models\\User	1	{"old":{"title":"Expo April","description":null,"status":null},"ip":"217.165.127.57","description":"Journey deleted"}	2025-04-28 05:51:48	2025-04-28 05:51:48	deleted	\N
39	journey	Journey deleted	App\\Models\\Journey	6	App\\Models\\User	1	{"old":{"title":"Abu Dubai","description":null,"status":null},"ip":"217.165.127.57","description":"Journey deleted"}	2025-04-28 06:13:34	2025-04-28 06:13:34	deleted	\N
40	journey	Journey deleted	App\\Models\\Journey	7	App\\Models\\User	1	{"old":{"title":"Dubai","description":null,"status":null},"ip":"217.165.127.57","description":"Journey deleted"}	2025-04-28 06:13:40	2025-04-28 06:13:40	deleted	\N
41	journey	Journey deleted	App\\Models\\Journey	8	App\\Models\\User	1	{"old":{"title":"Dessert Safari","description":null,"status":null},"ip":"217.165.127.57","description":"Journey deleted"}	2025-04-28 06:14:48	2025-04-28 06:14:48	deleted	\N
42	journey	Journey deleted	App\\Models\\Journey	10	App\\Models\\User	1	{"old":{"title":"Desert Safari","description":null,"status":null},"ip":"217.165.127.57","description":"Journey deleted"}	2025-04-28 06:14:56	2025-04-28 06:14:56	deleted	\N
43	journey	Journey created	App\\Models\\Journey	11	App\\Models\\User	1	{"attributes":{"title":"Mix of Adventure, Relaxation, and Culture","description":null,"status":null},"ip":"217.165.127.57","description":"Journey created"}	2025-04-28 06:30:59	2025-04-28 06:30:59	created	\N
44	journey	Journey updated	App\\Models\\Journey	11	App\\Models\\User	1	{"attributes":{"title":"Mix of Adventure, Relaxation, and Culture","description":null,"status":null},"old":{"title":"Mix of Adventure, Relaxation, and Culture","description":null,"status":null},"ip":"217.165.127.57","description":"Journey updated"}	2025-04-28 06:41:45	2025-04-28 06:41:45	updated	\N
45	journey	Journey updated	App\\Models\\Journey	11	App\\Models\\User	1	{"attributes":{"title":"Mix of Adventure, Relaxation, and Culture","description":null,"status":null},"old":{"title":"Mix of Adventure, Relaxation, and Culture","description":null,"status":null},"ip":"217.165.127.57","description":"Journey updated"}	2025-04-28 06:43:33	2025-04-28 06:43:33	updated	\N
46	journey	Journey created	App\\Models\\Journey	12	App\\Models\\User	1	{"attributes":{"title":"tertr","description":null,"status":null},"ip":"217.165.127.57","description":"Journey created"}	2025-04-28 07:37:26	2025-04-28 07:37:26	created	\N
47	journey	Journey deleted	App\\Models\\Journey	12	App\\Models\\User	1	{"old":{"title":"tertr","description":null,"status":null},"ip":"217.165.127.57","description":"Journey deleted"}	2025-04-28 07:39:16	2025-04-28 07:39:16	deleted	\N
48	journey	Journey updated	App\\Models\\Journey	11	App\\Models\\User	1	{"attributes":{"title":"Mix of Adventure, Relaxation, and Culture","description":null,"status":null},"old":{"title":"Mix of Adventure, Relaxation, and Culture","description":null,"status":null},"ip":"217.165.127.57","description":"Journey updated"}	2025-04-28 08:17:48	2025-04-28 08:17:48	updated	\N
49	user	User updated	App\\Models\\User	15	App\\Models\\User	1	{"attributes":{"first_name":"Doejohnn","last_name":"Halk","email":"doe@gmail.com","status":0},"old":{"first_name":"Doejohnn","last_name":"Halk","email":"doe@gmail.com","status":1},"ip":"217.165.127.57","description":"User updated"}	2025-04-28 15:25:50	2025-04-28 15:25:50	updated	\N
50	user	User updated	App\\Models\\User	15	App\\Models\\User	1	{"attributes":{"first_name":"Doejohnna","last_name":"Halk","email":"doe@gmail.com","status":1},"old":{"first_name":"Doejohnn","last_name":"Halk","email":"doe@gmail.com","status":0},"ip":"124.29.227.220","description":"User updated"}	2025-04-29 01:12:29	2025-04-29 01:12:29	updated	\N
51	user	User created	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User created"}	2025-04-30 18:35:08	2025-04-30 18:35:08	created	\N
52	user	User updated	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-04-30 18:37:52	2025-04-30 18:37:52	updated	\N
53	user	User updated	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-04-30 18:39:26	2025-04-30 18:39:26	updated	\N
54	user	User updated	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-04-30 18:42:05	2025-04-30 18:42:05	updated	\N
55	user	User updated	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-04-30 18:42:05	2025-04-30 18:42:05	updated	\N
56	user	User updated	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-04-30 19:01:12	2025-04-30 19:01:12	updated	\N
57	user	User updated	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-04-30 19:01:12	2025-04-30 19:01:12	updated	\N
58	user	User updated	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-04-30 19:02:55	2025-04-30 19:02:55	updated	\N
59	user	User updated	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-04-30 19:02:55	2025-04-30 19:02:55	updated	\N
60	user	User updated	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-04-30 19:02:56	2025-04-30 19:02:56	updated	\N
61	user	User updated	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-04-30 19:03:21	2025-04-30 19:03:21	updated	\N
62	user	User updated	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-04-30 19:03:21	2025-04-30 19:03:21	updated	\N
63	user	User updated	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-04-30 19:03:21	2025-04-30 19:03:21	updated	\N
64	user	User updated	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-04-30 19:04:03	2025-04-30 19:04:03	updated	\N
65	user	User updated	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-04-30 19:04:03	2025-04-30 19:04:03	updated	\N
66	user	User updated	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-04-30 19:04:03	2025-04-30 19:04:03	updated	\N
67	user	User updated	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-04-30 19:04:09	2025-04-30 19:04:09	updated	\N
68	user	User updated	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-04-30 19:04:09	2025-04-30 19:04:09	updated	\N
69	user	User updated	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-04-30 19:04:10	2025-04-30 19:04:10	updated	\N
70	user	User updated	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-04-30 19:07:02	2025-04-30 19:07:02	updated	\N
71	user	User updated	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-05-01 09:11:13	2025-05-01 09:11:13	updated	\N
72	user	User created	App\\Models\\User	18	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"ip":"182.183.31.33","description":"User created"}	2025-05-01 11:30:37	2025-05-01 11:30:37	created	\N
73	user	User updated	App\\Models\\User	18	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"ip":"182.183.31.33","description":"User updated"}	2025-05-01 11:30:37	2025-05-01 11:30:37	updated	\N
74	user	User updated	App\\Models\\User	18	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"ip":"182.183.31.33","description":"User updated"}	2025-05-01 11:30:37	2025-05-01 11:30:37	updated	\N
75	user	User updated	App\\Models\\User	18	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"ip":"182.183.31.33","description":"User updated"}	2025-05-01 11:30:37	2025-05-01 11:30:37	updated	\N
76	user	User created	App\\Models\\User	19	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh1@shah.com","status":1},"ip":"59.103.207.200","description":"User created"}	2025-05-02 00:00:07	2025-05-02 00:00:07	created	\N
77	user	User updated	App\\Models\\User	19	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh1@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh1@shah.com","status":1},"ip":"59.103.207.200","description":"User updated"}	2025-05-02 00:00:07	2025-05-02 00:00:07	updated	\N
78	user	User updated	App\\Models\\User	19	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh1@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh1@shah.com","status":1},"ip":"59.103.207.200","description":"User updated"}	2025-05-02 00:00:08	2025-05-02 00:00:08	updated	\N
79	user	User updated	App\\Models\\User	19	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh1@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh1@shah.com","status":1},"ip":"59.103.207.200","description":"User updated"}	2025-05-02 00:00:08	2025-05-02 00:00:08	updated	\N
80	user	User created	App\\Models\\User	20	\N	\N	{"attributes":{"first_name":"Asad","last_name":"nazir","email":"abs@gmail.com","status":1},"ip":"39.49.222.13","description":"User created"}	2025-05-02 16:39:45	2025-05-02 16:39:45	created	\N
81	user	User updated	App\\Models\\User	20	\N	\N	{"attributes":{"first_name":"Asad","last_name":"nazir","email":"abs@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"nazir","email":"abs@gmail.com","status":1},"ip":"39.49.222.13","description":"User updated"}	2025-05-02 16:39:45	2025-05-02 16:39:45	updated	\N
82	user	User updated	App\\Models\\User	20	\N	\N	{"attributes":{"first_name":"Asad","last_name":"nazir","email":"abs@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"nazir","email":"abs@gmail.com","status":1},"ip":"39.49.222.13","description":"User updated"}	2025-05-02 16:39:45	2025-05-02 16:39:45	updated	\N
83	user	User updated	App\\Models\\User	20	\N	\N	{"attributes":{"first_name":"Asad","last_name":"nazir","email":"abs@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"nazir","email":"abs@gmail.com","status":1},"ip":"39.49.222.13","description":"User updated"}	2025-05-02 16:39:45	2025-05-02 16:39:45	updated	\N
84	user	User created	App\\Models\\User	21	\N	\N	{"attributes":{"first_name":"Asad","last_name":"nazir","email":"abd@gmail.com","status":1},"ip":"39.49.222.13","description":"User created"}	2025-05-02 16:41:03	2025-05-02 16:41:03	created	\N
85	user	User updated	App\\Models\\User	21	\N	\N	{"attributes":{"first_name":"Asad","last_name":"nazir","email":"abd@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"nazir","email":"abd@gmail.com","status":1},"ip":"39.49.222.13","description":"User updated"}	2025-05-02 16:41:03	2025-05-02 16:41:03	updated	\N
86	user	User updated	App\\Models\\User	21	\N	\N	{"attributes":{"first_name":"Asad","last_name":"nazir","email":"abd@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"nazir","email":"abd@gmail.com","status":1},"ip":"39.49.222.13","description":"User updated"}	2025-05-02 16:41:04	2025-05-02 16:41:04	updated	\N
87	user	User updated	App\\Models\\User	21	\N	\N	{"attributes":{"first_name":"Asad","last_name":"nazir","email":"abd@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"nazir","email":"abd@gmail.com","status":1},"ip":"39.49.222.13","description":"User updated"}	2025-05-02 16:41:04	2025-05-02 16:41:04	updated	\N
88	user	User created	App\\Models\\User	22	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"ip":"39.49.222.13","description":"User created"}	2025-05-02 22:20:46	2025-05-02 22:20:46	created	\N
89	user	User updated	App\\Models\\User	22	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"ip":"39.49.222.13","description":"User updated"}	2025-05-02 22:20:46	2025-05-02 22:20:46	updated	\N
90	user	User updated	App\\Models\\User	22	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"ip":"39.49.222.13","description":"User updated"}	2025-05-02 22:20:47	2025-05-02 22:20:47	updated	\N
91	user	User updated	App\\Models\\User	22	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"ip":"39.49.222.13","description":"User updated"}	2025-05-02 22:20:47	2025-05-02 22:20:47	updated	\N
92	user	User updated	App\\Models\\User	22	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"ip":"39.49.222.13","description":"User updated"}	2025-05-02 22:22:46	2025-05-02 22:22:46	updated	\N
93	user	User updated	App\\Models\\User	22	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"ip":"39.49.222.13","description":"User updated"}	2025-05-02 22:24:42	2025-05-02 22:24:42	updated	\N
94	user	User updated	App\\Models\\User	22	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"ip":"39.49.222.13","description":"User updated"}	2025-05-02 22:25:20	2025-05-02 22:25:20	updated	\N
95	user	User updated	App\\Models\\User	22	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"ip":"39.49.222.13","description":"User updated"}	2025-05-02 22:52:26	2025-05-02 22:52:26	updated	\N
96	user	User updated	App\\Models\\User	18	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 05:20:43	2025-05-03 05:20:43	updated	\N
97	user	User updated	App\\Models\\User	18	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 05:22:27	2025-05-03 05:22:27	updated	\N
98	user	User updated	App\\Models\\User	18	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 05:24:36	2025-05-03 05:24:36	updated	\N
99	user	User updated	App\\Models\\User	18	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 05:27:34	2025-05-03 05:27:34	updated	\N
100	user	User updated	App\\Models\\User	18	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 05:29:39	2025-05-03 05:29:39	updated	\N
101	user	User updated	App\\Models\\User	18	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 05:36:40	2025-05-03 05:36:40	updated	\N
102	user	User updated	App\\Models\\User	18	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 05:47:34	2025-05-03 05:47:34	updated	\N
103	user	User updated	App\\Models\\User	18	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 05:52:02	2025-05-03 05:52:02	updated	\N
104	user	User updated	App\\Models\\User	18	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 06:04:53	2025-05-03 06:04:53	updated	\N
105	user	User updated	App\\Models\\User	18	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"ushakeel@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 06:16:53	2025-05-03 06:16:53	updated	\N
106	user	User created	App\\Models\\User	23	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User created"}	2025-05-03 06:49:55	2025-05-03 06:49:55	created	\N
107	user	User updated	App\\Models\\User	23	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-05-03 06:49:55	2025-05-03 06:49:55	updated	\N
108	user	User updated	App\\Models\\User	23	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-05-03 06:49:56	2025-05-03 06:49:56	updated	\N
109	user	User updated	App\\Models\\User	23	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-05-03 06:49:56	2025-05-03 06:49:56	updated	\N
110	user	User updated	App\\Models\\User	23	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-05-03 06:50:47	2025-05-03 06:50:47	updated	\N
111	user	User created	App\\Models\\User	24	\N	\N	{"attributes":{"first_name":"Asad","last_name":"nazir","email":"abc@gmail.com","status":1},"ip":"182.188.89.104","description":"User created"}	2025-05-03 07:49:11	2025-05-03 07:49:11	created	\N
112	user	User updated	App\\Models\\User	24	\N	\N	{"attributes":{"first_name":"Asad","last_name":"nazir","email":"abc@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"nazir","email":"abc@gmail.com","status":1},"ip":"182.188.89.104","description":"User updated"}	2025-05-03 07:49:11	2025-05-03 07:49:11	updated	\N
113	user	User updated	App\\Models\\User	24	\N	\N	{"attributes":{"first_name":"Asad","last_name":"nazir","email":"abc@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"nazir","email":"abc@gmail.com","status":1},"ip":"182.188.89.104","description":"User updated"}	2025-05-03 07:49:12	2025-05-03 07:49:12	updated	\N
114	user	User updated	App\\Models\\User	24	\N	\N	{"attributes":{"first_name":"Asad","last_name":"nazir","email":"abc@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"nazir","email":"abc@gmail.com","status":1},"ip":"182.188.89.104","description":"User updated"}	2025-05-03 07:49:12	2025-05-03 07:49:12	updated	\N
115	user	User created	App\\Models\\User	25	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdf@gmail.com","status":1},"ip":"182.188.89.104","description":"User created"}	2025-05-03 07:59:26	2025-05-03 07:59:26	created	\N
116	user	User updated	App\\Models\\User	25	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdf@gmail.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdf@gmail.com","status":1},"ip":"182.188.89.104","description":"User updated"}	2025-05-03 07:59:26	2025-05-03 07:59:26	updated	\N
117	user	User updated	App\\Models\\User	25	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdf@gmail.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdf@gmail.com","status":1},"ip":"182.188.89.104","description":"User updated"}	2025-05-03 07:59:27	2025-05-03 07:59:27	updated	\N
118	user	User updated	App\\Models\\User	25	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdf@gmail.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdf@gmail.com","status":1},"ip":"182.188.89.104","description":"User updated"}	2025-05-03 07:59:27	2025-05-03 07:59:27	updated	\N
119	user	User created	App\\Models\\User	26	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh12@shah.com","status":1},"ip":"59.103.108.48","description":"User created"}	2025-05-03 08:12:38	2025-05-03 08:12:38	created	\N
120	user	User updated	App\\Models\\User	26	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh12@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh12@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-05-03 08:12:38	2025-05-03 08:12:38	updated	\N
121	user	User updated	App\\Models\\User	26	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh12@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh12@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-05-03 08:12:39	2025-05-03 08:12:39	updated	\N
122	user	User updated	App\\Models\\User	26	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh12@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh12@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-05-03 08:12:39	2025-05-03 08:12:39	updated	\N
123	user	User updated	App\\Models\\User	26	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh12@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh12@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-05-03 08:13:04	2025-05-03 08:13:04	updated	\N
124	user	User created	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"ip":"182.188.89.104","description":"User created"}	2025-05-03 08:14:53	2025-05-03 08:14:53	created	\N
125	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"ip":"182.188.89.104","description":"User updated"}	2025-05-03 08:14:53	2025-05-03 08:14:53	updated	\N
126	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"ip":"182.188.89.104","description":"User updated"}	2025-05-03 08:14:53	2025-05-03 08:14:53	updated	\N
127	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"ip":"182.188.89.104","description":"User updated"}	2025-05-03 08:14:53	2025-05-03 08:14:53	updated	\N
128	user	User updated	App\\Models\\User	26	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh12@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh12@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-05-03 08:19:13	2025-05-03 08:19:13	updated	\N
129	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"ip":"182.188.89.104","description":"User updated"}	2025-05-03 08:19:19	2025-05-03 08:19:19	updated	\N
130	user	User updated	App\\Models\\User	24	\N	\N	{"attributes":{"first_name":"Asad","last_name":"nazir","email":"abc@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"nazir","email":"abc@gmail.com","status":1},"ip":"182.188.89.104","description":"User updated"}	2025-05-03 08:21:20	2025-05-03 08:21:20	updated	\N
131	user	User created	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User created"}	2025-05-03 08:24:39	2025-05-03 08:24:39	created	\N
132	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 08:24:39	2025-05-03 08:24:39	updated	\N
133	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 08:24:39	2025-05-03 08:24:39	updated	\N
134	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 08:24:39	2025-05-03 08:24:39	updated	\N
135	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 09:20:52	2025-05-03 09:20:52	updated	\N
136	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 10:44:53	2025-05-03 10:44:53	updated	\N
137	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 10:47:41	2025-05-03 10:47:41	updated	\N
138	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 10:51:15	2025-05-03 10:51:15	updated	\N
139	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 10:53:04	2025-05-03 10:53:04	updated	\N
140	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 10:57:17	2025-05-03 10:57:17	updated	\N
141	user	User created	App\\Models\\User	29	\N	\N	{"attributes":{"first_name":"Ajmala","last_name":"Ajm","email":"farsanaajmala@gmail.com","status":1},"ip":"92.98.18.232","description":"User created"}	2025-05-03 13:09:31	2025-05-03 13:09:31	created	\N
142	user	User updated	App\\Models\\User	29	\N	\N	{"attributes":{"first_name":"Ajmala","last_name":"Ajm","email":"farsanaajmala@gmail.com","status":1},"old":{"first_name":"Ajmala","last_name":"Ajm","email":"farsanaajmala@gmail.com","status":1},"ip":"92.98.18.232","description":"User updated"}	2025-05-03 13:09:31	2025-05-03 13:09:31	updated	\N
143	user	User updated	App\\Models\\User	29	\N	\N	{"attributes":{"first_name":"Ajmala","last_name":"Ajm","email":"farsanaajmala@gmail.com","status":1},"old":{"first_name":"Ajmala","last_name":"Ajm","email":"farsanaajmala@gmail.com","status":1},"ip":"92.98.18.232","description":"User updated"}	2025-05-03 13:09:32	2025-05-03 13:09:32	updated	\N
144	user	User updated	App\\Models\\User	29	\N	\N	{"attributes":{"first_name":"Ajmala","last_name":"Ajm","email":"farsanaajmala@gmail.com","status":1},"old":{"first_name":"Ajmala","last_name":"Ajm","email":"farsanaajmala@gmail.com","status":1},"ip":"92.98.18.232","description":"User updated"}	2025-05-03 13:09:32	2025-05-03 13:09:32	updated	\N
145	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 14:37:30	2025-05-03 14:37:30	updated	\N
146	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 14:40:47	2025-05-03 14:40:47	updated	\N
147	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 14:46:52	2025-05-03 14:46:52	updated	\N
148	user	User created	App\\Models\\User	30	\N	\N	{"attributes":{"first_name":"hiba","last_name":"ejaz","email":"hibadxba@hotmail.com","status":1},"ip":"31.218.147.68","description":"User created"}	2025-05-03 14:49:13	2025-05-03 14:49:13	created	\N
149	user	User updated	App\\Models\\User	30	\N	\N	{"attributes":{"first_name":"hiba","last_name":"ejaz","email":"hibadxba@hotmail.com","status":1},"old":{"first_name":"hiba","last_name":"ejaz","email":"hibadxba@hotmail.com","status":1},"ip":"31.218.147.68","description":"User updated"}	2025-05-03 14:49:13	2025-05-03 14:49:13	updated	\N
150	user	User updated	App\\Models\\User	30	\N	\N	{"attributes":{"first_name":"hiba","last_name":"ejaz","email":"hibadxba@hotmail.com","status":1},"old":{"first_name":"hiba","last_name":"ejaz","email":"hibadxba@hotmail.com","status":1},"ip":"31.218.147.68","description":"User updated"}	2025-05-03 14:49:14	2025-05-03 14:49:14	updated	\N
151	user	User updated	App\\Models\\User	30	\N	\N	{"attributes":{"first_name":"hiba","last_name":"ejaz","email":"hibadxba@hotmail.com","status":1},"old":{"first_name":"hiba","last_name":"ejaz","email":"hibadxba@hotmail.com","status":1},"ip":"31.218.147.68","description":"User updated"}	2025-05-03 14:49:14	2025-05-03 14:49:14	updated	\N
152	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 14:55:28	2025-05-03 14:55:28	updated	\N
153	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 15:25:58	2025-05-03 15:25:58	updated	\N
154	user	User updated	App\\Models\\User	17	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"sabeeh@shah.com","status":1},"ip":"39.43.149.24","description":"User updated"}	2025-05-03 15:28:16	2025-05-03 15:28:16	updated	\N
155	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 15:29:26	2025-05-03 15:29:26	updated	\N
156	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 15:33:25	2025-05-03 15:33:25	updated	\N
157	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 15:36:04	2025-05-03 15:36:04	updated	\N
158	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 15:47:16	2025-05-03 15:47:16	updated	\N
159	user	User updated	App\\Models\\User	22	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"ip":"39.43.149.24","description":"User updated"}	2025-05-03 16:40:06	2025-05-03 16:40:06	updated	\N
160	user	User updated	App\\Models\\User	22	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"ip":"39.43.149.24","description":"User updated"}	2025-05-03 16:43:47	2025-05-03 16:43:47	updated	\N
161	user	User updated	App\\Models\\User	22	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"ip":"39.43.149.24","description":"User updated"}	2025-05-03 17:01:04	2025-05-03 17:01:04	updated	\N
162	user	User updated	App\\Models\\User	22	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"ip":"39.43.149.24","description":"User updated"}	2025-05-03 17:04:24	2025-05-03 17:04:24	updated	\N
163	user	User updated	App\\Models\\User	22	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"ip":"39.43.149.24","description":"User updated"}	2025-05-03 17:06:28	2025-05-03 17:06:28	updated	\N
164	user	User updated	App\\Models\\User	22	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"ip":"39.43.149.24","description":"User updated"}	2025-05-03 17:23:08	2025-05-03 17:23:08	updated	\N
165	user	User updated	App\\Models\\User	22	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"ip":"39.43.149.24","description":"User updated"}	2025-05-03 17:23:45	2025-05-03 17:23:45	updated	\N
166	user	User updated	App\\Models\\User	22	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"ip":"39.43.149.24","description":"User updated"}	2025-05-03 17:25:08	2025-05-03 17:25:08	updated	\N
167	user	User updated	App\\Models\\User	22	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"ip":"39.43.149.24","description":"User updated"}	2025-05-03 17:26:40	2025-05-03 17:26:40	updated	\N
168	user	User updated	App\\Models\\User	22	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":"asad@gmail.com","status":1},"ip":"39.43.149.24","description":"User updated"}	2025-05-03 17:31:27	2025-05-03 17:31:27	updated	\N
169	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 18:21:34	2025-05-03 18:21:34	updated	\N
170	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 18:23:22	2025-05-03 18:23:22	updated	\N
171	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 18:56:39	2025-05-03 18:56:39	updated	\N
172	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 19:02:12	2025-05-03 19:02:12	updated	\N
173	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 19:03:47	2025-05-03 19:03:47	updated	\N
174	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 19:06:39	2025-05-03 19:06:39	updated	\N
175	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 19:10:09	2025-05-03 19:10:09	updated	\N
176	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 19:13:53	2025-05-03 19:13:53	updated	\N
177	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 19:17:04	2025-05-03 19:17:04	updated	\N
178	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 19:22:26	2025-05-03 19:22:26	updated	\N
179	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 19:26:09	2025-05-03 19:26:09	updated	\N
180	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 19:33:45	2025-05-03 19:33:45	updated	\N
181	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 19:39:45	2025-05-03 19:39:45	updated	\N
182	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 19:48:21	2025-05-03 19:48:21	updated	\N
183	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 19:49:41	2025-05-03 19:49:41	updated	\N
184	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 20:06:15	2025-05-03 20:06:15	updated	\N
185	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 20:06:53	2025-05-03 20:06:53	updated	\N
186	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 20:17:52	2025-05-03 20:17:52	updated	\N
187	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 20:20:48	2025-05-03 20:20:48	updated	\N
188	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 20:24:28	2025-05-03 20:24:28	updated	\N
189	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 20:28:08	2025-05-03 20:28:08	updated	\N
190	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 20:33:33	2025-05-03 20:33:33	updated	\N
191	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 20:36:29	2025-05-03 20:36:29	updated	\N
192	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 20:40:11	2025-05-03 20:40:11	updated	\N
193	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 20:42:41	2025-05-03 20:42:41	updated	\N
194	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-03 20:47:27	2025-05-03 20:47:27	updated	\N
195	user	User updated	App\\Models\\User	29	\N	\N	{"attributes":{"first_name":"Ajmala","last_name":"Ajm","email":"farsanaajmala@gmail.com","status":1},"old":{"first_name":"Ajmala","last_name":"Ajm","email":"farsanaajmala@gmail.com","status":1},"ip":"92.98.18.232","description":"User updated"}	2025-05-04 07:57:55	2025-05-04 07:57:55	updated	\N
196	user	User updated	App\\Models\\User	29	\N	\N	{"attributes":{"first_name":"Ajmala","last_name":"Ajm","email":"farsanaajmala@gmail.com","status":1},"old":{"first_name":"Ajmala","last_name":"Ajm","email":"farsanaajmala@gmail.com","status":1},"ip":"92.98.18.232","description":"User updated"}	2025-05-04 08:07:42	2025-05-04 08:07:42	updated	\N
197	user	User updated	App\\Models\\User	29	\N	\N	{"attributes":{"first_name":"Ajmala","last_name":"Ajm","email":"farsanaajmala@gmail.com","status":1},"old":{"first_name":"Ajmala","last_name":"Ajm","email":"farsanaajmala@gmail.com","status":1},"ip":"92.98.18.232","description":"User updated"}	2025-05-04 08:10:20	2025-05-04 08:10:20	updated	\N
198	user	User created	App\\Models\\User	31	\N	\N	{"attributes":{"first_name":"anol","last_name":"navis","email":"anil@dxbusinessgroup.com","status":1},"ip":"42.107.196.207","description":"User created"}	2025-05-05 04:52:04	2025-05-05 04:52:04	created	\N
199	user	User updated	App\\Models\\User	31	\N	\N	{"attributes":{"first_name":"anol","last_name":"navis","email":"anil@dxbusinessgroup.com","status":1},"old":{"first_name":"anol","last_name":"navis","email":"anil@dxbusinessgroup.com","status":1},"ip":"42.107.196.207","description":"User updated"}	2025-05-05 04:52:04	2025-05-05 04:52:04	updated	\N
200	user	User updated	App\\Models\\User	31	\N	\N	{"attributes":{"first_name":"anol","last_name":"navis","email":"anil@dxbusinessgroup.com","status":1},"old":{"first_name":"anol","last_name":"navis","email":"anil@dxbusinessgroup.com","status":1},"ip":"42.107.196.207","description":"User updated"}	2025-05-05 04:52:04	2025-05-05 04:52:04	updated	\N
201	user	User updated	App\\Models\\User	31	\N	\N	{"attributes":{"first_name":"anol","last_name":"navis","email":"anil@dxbusinessgroup.com","status":1},"old":{"first_name":"anol","last_name":"navis","email":"anil@dxbusinessgroup.com","status":1},"ip":"42.107.196.207","description":"User updated"}	2025-05-05 04:52:04	2025-05-05 04:52:04	updated	\N
202	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-05 05:11:19	2025-05-05 05:11:19	updated	\N
203	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"ip":"103.137.24.27","description":"User updated"}	2025-05-05 06:51:27	2025-05-05 06:51:27	updated	\N
204	user	User created	App\\Models\\User	32	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asadpk@gmail.com","status":1},"ip":"103.137.24.8","description":"User created"}	2025-05-05 06:56:47	2025-05-05 06:56:47	created	\N
205	user	User updated	App\\Models\\User	32	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asadpk@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":"asadpk@gmail.com","status":1},"ip":"103.137.24.8","description":"User updated"}	2025-05-05 06:56:47	2025-05-05 06:56:47	updated	\N
206	user	User updated	App\\Models\\User	32	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asadpk@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":"asadpk@gmail.com","status":1},"ip":"103.137.24.8","description":"User updated"}	2025-05-05 06:56:48	2025-05-05 06:56:48	updated	\N
207	user	User updated	App\\Models\\User	32	\N	\N	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":"asadpk@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":"asadpk@gmail.com","status":1},"ip":"103.137.24.8","description":"User updated"}	2025-05-05 06:56:48	2025-05-05 06:56:48	updated	\N
208	user	User updated	App\\Models\\User	26	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh12@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh12@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-05-05 07:34:22	2025-05-05 07:34:22	updated	\N
209	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-05 07:52:54	2025-05-05 07:52:54	updated	\N
210	user	User updated	App\\Models\\User	24	\N	\N	{"attributes":{"first_name":"Asad","last_name":"nazir","email":"abc@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"nazir","email":"abc@gmail.com","status":1},"ip":"103.137.24.114","description":"User updated"}	2025-05-05 08:04:47	2025-05-05 08:04:47	updated	\N
211	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"ip":"103.137.24.178","description":"User updated"}	2025-05-05 08:09:56	2025-05-05 08:09:56	updated	\N
212	user	User updated	App\\Models\\User	26	\N	\N	{"attributes":{"first_name":"ABCD","last_name":"sam","email":"shahsabeeh12@shah.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"shahsabeeh12@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-05-05 08:11:10	2025-05-05 08:11:10	updated	\N
213	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"ip":"103.137.24.8","description":"User updated"}	2025-05-05 08:11:42	2025-05-05 08:11:42	updated	\N
214	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"ip":"103.137.24.8","description":"User updated"}	2025-05-05 08:16:27	2025-05-05 08:16:27	updated	\N
215	user	User updated	App\\Models\\User	26	\N	\N	{"attributes":{"first_name":"ABCD","last_name":"sam","email":"shahsabeeh12@shah.com","status":1},"old":{"first_name":"ABCD","last_name":"sam","email":"shahsabeeh12@shah.com","status":1},"ip":"59.103.108.48","description":"User updated"}	2025-05-05 09:17:58	2025-05-05 09:17:58	updated	\N
216	user	User created	App\\Models\\User	33	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj.a2solution@gmail.com","status":1},"ip":"117.196.11.160","description":"User created"}	2025-05-06 07:29:41	2025-05-06 07:29:41	created	\N
217	user	User updated	App\\Models\\User	33	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj.a2solution@gmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj.a2solution@gmail.com","status":1},"ip":"117.196.11.160","description":"User updated"}	2025-05-06 07:29:41	2025-05-06 07:29:41	updated	\N
218	user	User updated	App\\Models\\User	33	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj.a2solution@gmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj.a2solution@gmail.com","status":1},"ip":"117.196.11.160","description":"User updated"}	2025-05-06 07:29:42	2025-05-06 07:29:42	updated	\N
219	user	User updated	App\\Models\\User	33	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj.a2solution@gmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj.a2solution@gmail.com","status":1},"ip":"117.196.11.160","description":"User updated"}	2025-05-06 07:29:42	2025-05-06 07:29:42	updated	\N
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
\.


--
-- Data for Name: challenges_companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.challenges_companies (id, challenge_id, company_id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: checklists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.checklists (id, user_id, journey_id, item, is_checked, created_at, updated_at) FROM stdin;
1	2	1	Passport	t	\N	\N
2	2	1	Sunscreen	f	\N	\N
3	2	1	Swimsuit	f	\N	\N
4	1	4	Passport	f	2025-04-22 13:33:57	2025-04-22 13:33:57
5	1	4	Emirates ID	f	2025-04-22 13:34:56	2025-04-22 13:34:56
6	1	4	Umbrella	f	2025-04-22 13:35:16	2025-04-22 13:35:16
7	1	4	Swimming costume	f	2025-04-22 13:35:29	2025-04-22 13:35:29
8	1	5	Passport	f	2025-04-24 12:19:38	2025-04-24 12:19:38
9	1	11	Passport (valid 6+ months)	f	2025-04-28 07:19:10	2025-04-28 07:19:10
10	1	11	Visa (if needed)	f	2025-04-28 07:19:27	2025-04-28 07:19:27
11	1	11	Travel insurance	f	2025-04-28 07:19:42	2025-04-28 07:19:42
12	1	11	Flight tickets	f	2025-04-28 07:24:23	2025-04-28 07:24:23
13	1	11	Hotel bookings	f	2025-04-28 07:24:37	2025-04-28 07:24:37
14	1	11	Sunscreen	f	2025-04-28 07:28:23	2025-04-28 07:28:56
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, emirate_id, name, created_at, updated_at, deleted_at, country_id, status) FROM stdin;
1	1	Dubai	2025-03-09 21:04:33	2025-03-09 21:04:33	\N	\N	0
2	2	Sharjah	2025-03-09 21:04:33	2025-03-09 21:04:33	\N	\N	0
3	3	Ajman	2025-03-09 21:04:33	2025-03-09 21:04:33	\N	\N	0
4	1	Hatta	2025-03-09 21:04:33	2025-03-09 21:04:33	\N	\N	0
5	2	Kalba	2025-03-09 21:04:33	2025-03-09 21:04:33	\N	\N	0
6	2	Dibba Al-Hisn	2025-03-09 21:04:33	2025-03-09 21:04:33	\N	\N	0
7	4	Dubai	2025-03-09 21:16:01	2025-03-09 21:16:01	\N	\N	0
8	5	Sharjah	2025-03-09 21:16:01	2025-03-09 21:16:01	\N	\N	0
9	6	Ajman	2025-03-09 21:16:01	2025-03-09 21:16:01	\N	\N	0
10	4	Hatta	2025-03-09 21:16:01	2025-03-09 21:16:01	\N	\N	0
11	5	Kalba	2025-03-09 21:16:01	2025-03-09 21:16:01	\N	\N	0
12	5	Dibba Al-Hisn	2025-03-09 21:16:01	2025-03-09 21:16:01	\N	\N	0
13	7	Dubai	2025-03-09 21:16:24	2025-03-09 21:16:24	\N	\N	0
14	8	Sharjah	2025-03-09 21:16:24	2025-03-09 21:16:24	\N	\N	0
15	9	Ajman	2025-03-09 21:16:24	2025-03-09 21:16:24	\N	\N	0
16	7	Hatta	2025-03-09 21:16:24	2025-03-09 21:16:24	\N	\N	0
17	8	Kalba	2025-03-09 21:16:24	2025-03-09 21:16:24	\N	\N	0
18	8	Dibba Al-Hisn	2025-03-09 21:16:24	2025-03-09 21:16:24	\N	\N	0
19	10	Dubai	2025-03-09 21:18:49	2025-03-09 21:18:49	\N	\N	0
20	11	Sharjah	2025-03-09 21:18:49	2025-03-09 21:18:49	\N	\N	0
21	12	Ajman	2025-03-09 21:18:49	2025-03-09 21:18:49	\N	\N	0
22	10	Hatta	2025-03-09 21:18:49	2025-03-09 21:18:49	\N	\N	0
23	11	Kalba	2025-03-09 21:18:49	2025-03-09 21:18:49	\N	\N	0
24	11	Dibba Al-Hisn	2025-03-09 21:18:49	2025-03-09 21:18:49	\N	\N	0
\.


--
-- Data for Name: cms_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cms_pages (id, title, content, status, created_at, updated_at) FROM stdin;
1	About us		Draft	2025-03-10 02:33:43	2025-03-10 02:33:43
3	Privacy policy		Draft	2025-03-10 02:33:48	2025-03-10 02:33:48
2	Terms and conditions	<p>ds</p>	Draft	2025-03-10 02:33:46	2025-04-24 05:32:14
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (id, name, name_ar, brand_logo, description, description_ar, address, trade_license, trade_license_expiry, user_id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: cost_breakdown_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cost_breakdown_items (id, cost_breakdown_id, item, price, parent_id, created_at, updated_at) FROM stdin;
4	2	Food	200-300	\N	2025-04-24 11:44:41	2025-04-24 11:44:41
5	2	Fast food	50	4	2025-04-24 11:44:41	2025-04-24 11:44:41
6	2	drink	20	4	2025-04-24 11:44:41	2025-04-24 11:44:41
7	3	title	200	\N	2025-04-24 11:48:13	2025-04-24 11:48:13
8	3	sub value 1	400	7	2025-04-24 11:48:13	2025-04-24 11:48:13
9	3	sub value 3	600	7	2025-04-24 11:48:13	2025-04-24 11:48:13
10	1	test	100 - 200	\N	2025-04-24 16:52:51	2025-04-24 16:52:51
12	5	Accommodation	200-300	\N	2025-04-28 07:32:58	2025-04-28 07:32:58
14	6	Food	100	\N	2025-04-28 07:33:48	2025-04-28 07:33:48
15	6	Drinks	50	14	2025-04-28 07:33:48	2025-04-28 07:33:48
16	7	Activities & Entry Fees	200-300	\N	2025-04-28 07:34:10	2025-04-28 07:34:10
17	4	Roundtrip Flight	600-700	\N	2025-04-29 10:11:22	2025-04-29 10:11:22
18	4	1 dest	50	17	2025-04-29 10:11:22	2025-04-29 10:11:22
\.


--
-- Data for Name: cost_breakdowns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cost_breakdowns (id, journey_id, user_id, created_at, updated_at) FROM stdin;
1	5	1	2025-04-24 11:11:33	2025-04-24 11:11:33
2	5	1	2025-04-24 11:44:41	2025-04-24 11:44:41
3	5	1	2025-04-24 11:48:13	2025-04-24 11:48:13
4	11	1	2025-04-28 07:32:19	2025-04-28 07:32:19
5	11	1	2025-04-28 07:32:58	2025-04-28 07:32:58
6	11	1	2025-04-28 07:33:48	2025-04-28 07:33:48
7	11	1	2025-04-28 07:34:10	2025-04-28 07:34:10
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, name, created_at, updated_at, status, dial_code) FROM stdin;
1	United Arab Emirates	2025-03-09 21:04:33	2025-03-09 21:06:33	1	\N
5	India	2025-03-10 12:29:58	2025-03-10 12:29:58	1	+91
6	Saudi Arabia	2025-03-10 12:30:29	2025-03-10 12:30:29	1	+93
7	Afghanistan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+93
8	Albania	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+355
9	Algeria	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+213
10	Andorra	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+376
11	Angola	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+244
12	Antigua and Barbuda	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-268
13	Argentina	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+54
14	Armenia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+374
15	Australia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+61
16	Austria	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+43
17	Azerbaijan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+994
18	Bahamas	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-242
19	Bahrain	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+973
20	Bangladesh	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+880
21	Barbados	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-246
22	Belarus	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+375
23	Belgium	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+32
24	Belize	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+501
25	Benin	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+229
26	Bhutan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+975
27	Bolivia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+591
28	Bosnia and Herzegovina	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+387
29	Botswana	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+267
30	Brazil	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+55
31	Brunei	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+673
32	Bulgaria	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+359
33	Burkina Faso	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+226
34	Burundi	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+257
35	Cambodia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+855
36	Cameroon	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+237
37	Canada	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1
38	Cape Verde	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+238
39	Central African Republic	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+236
40	Chad	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+235
41	Chile	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+56
42	China	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+86
43	Colombia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+57
44	Comoros	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+269
45	Congo (Brazzaville)	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+242
46	Congo (Kinshasa)	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+243
47	Costa Rica	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+506
48	Croatia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+385
49	Cuba	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+53
50	Cyprus	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+357
51	Czech Republic	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+420
52	Denmark	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+45
53	Djibouti	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+253
54	Dominica	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-767
55	Dominican Republic	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-809
56	Ecuador	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+593
57	Egypt	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+20
58	El Salvador	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+503
59	Equatorial Guinea	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+240
60	Eritrea	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+291
61	Estonia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+372
62	Eswatini	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+268
63	Ethiopia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+251
64	Fiji	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+679
65	Finland	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+358
66	France	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+33
67	Gabon	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+241
68	Gambia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+220
69	Georgia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+995
70	Germany	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+49
71	Ghana	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+233
72	Greece	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+30
73	Grenada	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-473
74	Guatemala	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+502
75	Guinea	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+224
76	Guinea-Bissau	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+245
77	Guyana	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+592
78	Haiti	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+509
79	Honduras	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+504
80	Hungary	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+36
81	Iceland	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+354
82	India	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+91
83	Indonesia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+62
84	Iran	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+98
85	Iraq	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+964
86	Ireland	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+353
87	Israel	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+972
88	Italy	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+39
89	Jamaica	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-876
90	Japan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+81
91	Jordan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+962
92	Kazakhstan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+7
93	Kenya	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+254
94	Kiribati	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+686
95	Kuwait	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+965
96	Kyrgyzstan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+996
97	Laos	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+856
98	Latvia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+371
99	Lebanon	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+961
100	Lesotho	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+266
101	Liberia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+231
102	Libya	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+218
103	Liechtenstein	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+423
104	Lithuania	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+370
105	Luxembourg	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+352
106	Madagascar	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+261
107	Malawi	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+265
108	Malaysia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+60
109	Maldives	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+960
110	Mali	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+223
111	Malta	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+356
112	Marshall Islands	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+692
113	Mauritania	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+222
114	Mauritius	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+230
115	Mexico	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+52
116	Micronesia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+691
117	Moldova	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+373
118	Monaco	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+377
119	Mongolia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+976
120	Montenegro	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+382
121	Morocco	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+212
122	Mozambique	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+258
123	Myanmar	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+95
124	Namibia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+264
125	Nauru	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+674
126	Nepal	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+977
127	Netherlands	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+31
128	New Zealand	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+64
129	Nicaragua	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+505
130	Niger	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+227
131	Nigeria	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+234
132	North Korea	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+850
133	North Macedonia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+389
134	Norway	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+47
135	Oman	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+968
136	Pakistan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+92
137	Palau	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+680
138	Palestine	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+970
139	Panama	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+507
140	Papua New Guinea	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+675
141	Paraguay	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+595
142	Peru	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+51
143	Philippines	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+63
144	Poland	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+48
145	Portugal	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+351
146	Qatar	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+974
147	Romania	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+40
148	Russia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+7
149	Rwanda	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+250
150	Saint Kitts and Nevis	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-869
151	Saint Lucia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-758
152	Saint Vincent and the Grenadines	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-784
153	Samoa	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+685
154	San Marino	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+378
155	Saudi Arabia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+966
156	Senegal	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+221
157	Serbia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+381
158	Seychelles	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+248
159	Sierra Leone	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+232
160	Singapore	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+65
161	Slovakia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+421
162	Slovenia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+386
163	Solomon Islands	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+677
164	Somalia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+252
165	South Africa	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+27
166	South Korea	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+82
167	South Sudan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+211
168	Spain	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+34
169	Sri Lanka	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+94
170	Sudan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+249
171	Suriname	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+597
172	Sweden	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+46
173	Switzerland	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+41
174	Syria	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+963
175	Taiwan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+886
176	Tajikistan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+992
177	Tanzania	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+255
178	Thailand	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+66
179	Timor-Leste	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+670
180	Togo	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+228
181	Tonga	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+676
182	Trinidad and Tobago	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-868
183	Tunisia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+216
184	Turkey	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+90
185	Turkmenistan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+993
186	Tuvalu	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+688
187	Uganda	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+256
188	Ukraine	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+380
189	United Arab Emirates	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+971
190	United Kingdom	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+44
191	United States	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1
192	Uruguay	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+598
193	Uzbekistan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+998
194	Vanuatu	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+678
195	Vatican City	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+379
196	Venezuela	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+58
197	Vietnam	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+84
198	Yemen	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+967
199	Zambia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+260
200	Zimbabwe	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+263
\.


--
-- Data for Name: emirates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emirates (id, country_id, name, created_at, updated_at, deleted_at, status) FROM stdin;
1	1	Dubai	2025-03-09 21:04:33	2025-03-09 21:04:33	\N	0
2	1	Sharjah	2025-03-09 21:04:33	2025-03-09 21:04:33	\N	0
3	1	Ajman	2025-03-09 21:04:33	2025-03-09 21:04:33	\N	0
4	2	Dubai	2025-03-09 21:16:01	2025-03-09 21:16:01	\N	0
5	2	Sharjah	2025-03-09 21:16:01	2025-03-09 21:16:01	\N	0
6	2	Ajman	2025-03-09 21:16:01	2025-03-09 21:16:01	\N	0
7	3	Dubai	2025-03-09 21:16:24	2025-03-09 21:16:24	\N	0
8	3	Sharjah	2025-03-09 21:16:24	2025-03-09 21:16:24	\N	0
9	3	Ajman	2025-03-09 21:16:24	2025-03-09 21:16:24	\N	0
10	4	Dubai	2025-03-09 21:18:49	2025-03-09 21:18:49	\N	0
11	4	Sharjah	2025-03-09 21:18:49	2025-03-09 21:18:49	\N	0
12	4	Ajman	2025-03-09 21:18:49	2025-03-09 21:18:49	\N	0
\.


--
-- Data for Name: est_person_cost_journeys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.est_person_cost_journeys (id, journey_id, price_range, created_at, updated_at) FROM stdin;
1	5	1000-12000	2025-04-24 11:42:12	2025-04-24 16:58:48
2	11	1500-1600	2025-04-28 07:36:30	2025-04-28 07:36:30
\.


--
-- Data for Name: event_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_types (id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, name, event_type_id, start_date, end_date, status, description, images, created_at, updated_at) FROM stdin;
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
1	cfcfc	<p>fcfcfc</p>	1	2025-05-01 12:51:04	2025-05-01 12:51:04
\.


--
-- Data for Name: followers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.followers (id, follower_id, followed_id, created_at, updated_at) FROM stdin;
1	6	11	\N	\N
2	15	14	\N	\N
\.


--
-- Data for Name: itineraries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.itineraries (id, user_id, journey_id, date, description, created_at, updated_at, start_time, end_time) FROM stdin;
8	1	1	2025-04-25	Breakfast	2025-04-22 12:14:44	2025-04-22 12:14:44	09:00:00	11:00:00
9	1	1	2025-04-25	Jogging	2025-04-22 12:14:44	2025-04-22 12:14:44	11:01:00	14:43:00
10	1	1	2025-04-26	Breakfast	2025-04-22 12:14:44	2025-04-22 12:14:44	07:43:00	11:48:00
11	1	1	2025-04-26	Tracking	2025-04-22 12:14:44	2025-04-22 12:14:44	12:00:00	17:44:00
12	1	4	2025-04-26	Breakfast	2025-04-22 13:33:16	2025-04-22 13:33:16	09:31:00	11:31:00
13	1	4	2025-04-26	Tracking	2025-04-22 13:33:16	2025-04-22 13:33:16	11:33:00	17:32:00
14	1	4	2025-04-26	Dinner	2025-04-22 13:33:16	2025-04-22 13:33:16	18:32:00	22:37:00
15	1	4	2025-04-27	Breakfast	2025-04-22 13:33:16	2025-04-22 13:33:16	09:32:00	21:32:00
16	1	4	2025-04-28	Breakfast	2025-04-22 13:33:16	2025-04-22 13:33:16	09:33:00	21:33:00
73	1	11	2025-06-01	Flight and Arrival at Bali (DPS Airport)	2025-04-28 08:32:18	2025-04-28 08:32:18	09:03:00	11:03:00
74	1	11	2025-06-01	Airport transfer to Seminyak	2025-04-28 08:32:18	2025-04-28 08:32:18	12:00:00	13:00:00
75	1	11	2025-06-01	Check-in + Welcome drinks	2025-04-28 08:32:18	2025-04-28 08:32:18	13:00:00	15:00:00
76	1	11	2025-06-01	Relax at the villa	2025-04-28 08:32:18	2025-04-28 08:32:18	15:00:00	17:00:00
77	1	11	2025-06-01	Walk to Seminyak Beach	2025-04-28 08:32:18	2025-04-28 08:32:18	17:00:00	19:00:00
78	1	11	2025-06-01	Dinner at beachfront cafe	2025-04-28 08:32:18	2025-04-28 08:32:18	19:00:00	21:00:00
79	1	11	2025-06-02	Breakfast at villa	2025-04-28 08:32:18	2025-04-28 08:32:18	08:00:00	09:00:00
80	1	11	2025-06-02	Shopping at Seminyak Square + boutiques	2025-04-28 08:32:18	2025-04-28 08:32:18	09:00:00	12:00:00
81	1	11	2025-06-02	Lunch at Sisterfields Café	2025-04-28 08:32:18	2025-04-28 08:32:18	12:00:00	14:00:00
82	1	11	2025-06-02	Spa and Balinese Massage	2025-04-28 08:32:18	2025-04-28 08:32:18	14:00:00	16:00:00
83	1	11	2025-06-02	Beach chill or Water activities	2025-04-28 08:32:18	2025-04-28 08:32:18	16:00:00	18:00:00
84	1	11	2025-06-03	Breakfast at villa	2025-04-28 08:32:18	2025-04-28 08:32:18	09:00:00	10:30:00
85	1	11	2025-06-03	Check-out & drive to Ubud (1.5 hrs)	2025-04-28 08:32:18	2025-04-28 08:32:18	10:31:00	12:00:00
86	1	11	2025-06-03	Check-in at Alaya Resort	2025-04-28 08:32:18	2025-04-28 08:32:18	12:01:00	14:30:00
87	1	11	2025-06-03	Visit Tegallalang Rice Terraces	2025-04-28 08:32:18	2025-04-28 08:32:18	14:31:00	17:30:00
88	1	11	2025-06-03	Coffee tasting at Bali Pulina	2025-04-28 08:32:18	2025-04-28 08:32:18	18:30:00	21:30:00
89	1	11	2025-06-03	DInner at Ubud	2025-04-28 08:32:18	2025-04-28 08:32:18	21:31:00	23:59:00
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
-- Data for Name: journey_participants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journey_participants (id, journey_id, user_id, created_at, updated_at) FROM stdin;
1	1	11	\N	\N
2	1	5	\N	\N
3	4	15	\N	\N
4	4	13	\N	\N
5	4	12	\N	\N
6	5	14	\N	\N
7	5	5	\N	\N
8	6	13	\N	\N
9	7	12	\N	\N
10	7	5	\N	\N
11	8	12	\N	\N
13	8	5	\N	\N
14	10	12	\N	\N
15	10	6	\N	\N
16	10	5	\N	\N
17	11	15	\N	\N
18	11	12	\N	\N
19	11	5	\N	\N
20	12	15	\N	\N
21	12	14	\N	\N
\.


--
-- Data for Name: journeys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journeys (id, title, destination, accommodation, accommodation_link, date, created_at, updated_at, user_id, start_date, end_date, map_link, cost, small_description) FROM stdin;
11	Mix of Adventure, Relaxation, and Culture	Bali, Indonesia	The Seminyak Suite Private Villas	https://www.seminyaksuites.com/	2025-04-28	2025-04-28 06:30:59	2025-04-28 08:17:48	14	2025-06-01	2025-06-03	https://www.google.com/maps/place/Bali,+Indonesia	\N	\N
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
9	2024_12_05_164934_create_packages_table	1
10	2024_12_05_164957_create_packages_addons_table	1
11	2024_12_05_191748_add_fields_to_users_table	1
12	2024_12_05_231725_create_challenges_table	1
13	2024_12_05_232702_create_challenges_companies_table	1
14	2024_12_10_063233_remove_columns_from_companies_table	1
15	2024_12_10_094132_add_soft_deletes_to_users_table	1
16	2024_12_10_113225_add_status_to_countries_table	1
17	2024_12_10_131649_add_soft_deletes_to_challenges_table	1
18	2024_12_10_144153_add_status_to_emirates_table	1
19	2024_12_10_155646_add_country_id_and_status_to_cities_table	1
20	2024_12_10_165027_create_target_types_table	1
21	2024_12_10_173815_create_event_types_table	1
22	2024_12_10_182826_create_pages_table	1
23	2024_12_11_104518_create_faqs_table	1
24	2024_12_11_190634_create_events_table	1
25	2024_12_12_171650_add_role_id_to_users_table	1
26	2024_12_16_031035_create_target_types_company_table	1
27	2024_12_16_143622_add_dial_code_to_countries_table	1
28	2024_12_23_113726_add_company_id_to_target_types_table	1
29	2025_03_09_163238_create_journeys_table	1
30	2025_03_09_163715_add_user_id_to_journeys_table	1
31	2025_03_09_200844_create_itineraries_table	1
32	2025_03_09_200857_create_checklists_table	1
33	2025_03_09_200907_create_cost_breakdowns_table	1
34	2025_03_09_220525_create_cost_breakdowns_table	2
35	2025_03_09_221357_add_total_to_journeys_table	3
36	2025_03_10_012551_create_posts_table	4
37	2025_03_10_020955_update_posts_table	5
38	2025_03_10_053410_create_polls_and_poll_options_tables	6
39	2025_04_12_070435_create_personal_access_tokens_table	6
40	2025_04_14_082504_add_qr_code_to_users_table	6
41	2025_04_21_081948_create_notifications_table	7
42	2025_04_21_091030_create_activity_log_table	8
43	2025_04_21_091031_add_event_column_to_activity_log_table	8
44	2025_04_21_091032_add_batch_uuid_column_to_activity_log_table	8
45	2025_04_21_094835_add_username_to_users_table	9
46	2025_04_21_121547_create_followers_table	10
47	2025_04_21_133143_add_profile_picture_to_users_table	10
48	2025_04_22_063251_add_extra_fields_to_journeys_table	11
49	2025_04_22_063841_create_journey_participants_table	11
50	2025_04_22_064730_remove_extra_columns_from_journeys_table	11
51	2025_04_22_065217_add_cost_to_journeys_table	11
52	2025_04_22_073524_add_start_end_time_to_itineraries_table	12
53	2025_04_24_102344_create_cost_breakdowns_table	13
54	2025_04_24_102440_create_cost_breakdown_items_table	13
55	2025_04_24_104419_remove_item_and_price_from_cost_breakdowns	13
56	2025_04_24_112841_create_est_person_cost_journeys_table	14
57	2025_04_25_233352_create_post_types_table	15
58	2025_04_26_002944_add_post_type_to_posts_table	15
59	2025_04_26_074916_add_video_and_poll_columns_to_posts_table	16
60	2025_04_26_080441_add_pos_id_to_posts_table	16
61	2025_04_27_052114_change_accommodation_link_and_map_link_to_text_in_journeys_table	17
62	2025_04_28_115309_add_small_description_to_journeys_table	18
63	2025_04_28_173915_create_post_likes_table	19
64	2025_04_28_174000_create_post_comments_table	19
65	2025_04_28_174727_create_post_shares_table	19
66	2025_04_29_025920_change_image_and_video_to_text_in_posts_table	20
67	2023_11_29_084619_create_temp_users	21
68	2024_12_16_143622_add_missing_to_users_table	22
69	2025_04_16_143622_add_access_token_to_users_table	23
70	2025_04_16_143622_add_firbase_key_to_users_table	24
71	2025_04_16_143622_add_password_reset_code_to_users_table	25
72	2025_04_16_143622_add_password_reset_time_to_users_table	26
73	2025_04_16_143622_add_password_reset_otp_to_users_table	27
74	2025_04_28_115309_add_username_to_temp_users_table	28
75	2025_04_28_115309_add_bio_to_users_table	29
76	2025_04_30_183711_create_personal_access_tokens_table	30
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
3	App\\Models\\User	2
3	App\\Models\\User	3
3	App\\Models\\User	4
3	App\\Models\\User	5
3	App\\Models\\User	6
3	App\\Models\\User	7
3	App\\Models\\User	11
3	App\\Models\\User	12
3	App\\Models\\User	13
3	App\\Models\\User	14
3	App\\Models\\User	15
3	App\\Models\\User	16
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, user_id, title, description, image, created_at, updated_at) FROM stdin;
1	15	test	test	notifications/5GD6kGL0wclBL4AotQIECdrjpey1hnQkUfcAUwQP.png	2025-04-25 04:10:58	2025-04-25 04:10:58
\.


--
-- Data for Name: packages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.packages (id, name, price, status, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: packages_addons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.packages_addons (id, package_id, title, deleted_at, created_at, updated_at) FROM stdin;
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
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
1	App\\Models\\User	17	Personal Access Token	ab9d0d5fbf7ee054d4346a77deb1203071f3566b723045408b03ca726561016d	["*"]	\N	\N	2025-04-30 18:39:26	2025-04-30 18:39:26
2	App\\Models\\User	17	Personal Access Token	2a1dc02bbd0f3e7e6e480d4ac8ceca6fe685b1d4182c69288f79e5b827ceaf45	["*"]	\N	\N	2025-04-30 18:42:05	2025-04-30 18:42:05
3	App\\Models\\User	17	Personal Access Token	26d8a525982687bae955015150f6fe32769f48fd934ac4cb19e766e5077d5bdd	["*"]	\N	\N	2025-04-30 19:01:12	2025-04-30 19:01:12
4	App\\Models\\User	17	Personal Access Token	c8ca67164823bd19c85f182b69161047ed453f88448cc5b8487d3bcdabb7eba8	["*"]	\N	\N	2025-04-30 19:02:55	2025-04-30 19:02:55
5	App\\Models\\User	17	Personal Access Token	c2ce2023cb18832389d33ddbdfc07e852dff00e87d2b0739b89606841f52eb43	["*"]	\N	\N	2025-04-30 19:02:56	2025-04-30 19:02:56
6	App\\Models\\User	17	Personal Access Token	0b17bc3ce46df91d0ddcbe55245008dd04cbf159e0d9726060b6eeb7fba8b9b6	["*"]	\N	\N	2025-04-30 19:03:21	2025-04-30 19:03:21
7	App\\Models\\User	17	Personal Access Token	d87b21810df68c27e7d16aeaf9a1eb4b7b6bae24b0a568b5964df020bbe14ebb	["*"]	\N	\N	2025-04-30 19:03:21	2025-04-30 19:03:21
8	App\\Models\\User	17	Personal Access Token	9d20600ee797497c64b014b9169026a9d14b8d301d5ce8d5a6b62447a54578a6	["*"]	\N	\N	2025-04-30 19:04:03	2025-04-30 19:04:03
9	App\\Models\\User	17	Personal Access Token	79558186b4a4314a6ac9a8ae0b1a3ae4b9e89861ef4cf920b16b89138083b5d1	["*"]	\N	\N	2025-04-30 19:04:03	2025-04-30 19:04:03
10	App\\Models\\User	17	Personal Access Token	c06dfe6e4ffad8d830c0c20d2b2e1c2111cfe10699a0783ed8347ecfee4dd031	["*"]	\N	\N	2025-04-30 19:04:09	2025-04-30 19:04:09
11	App\\Models\\User	17	Personal Access Token	329c7371cc3d2e8bc88f4b91e3465eb3eba1091055f6a6fd95299508b8f0e189	["*"]	\N	\N	2025-04-30 19:04:10	2025-04-30 19:04:10
12	App\\Models\\User	17	Personal Access Token	0988ffacf45d816cd473039cd32da9c02d04d444aa2bf8d0f70cd289244bebc0	["*"]	\N	\N	2025-04-30 19:07:02	2025-04-30 19:07:02
13	App\\Models\\User	18	Personal Access Token	110ef57dec148cb3afaf35d7ccc4594895c92f7d45b7a4a0e8f072e5e92e7527	["*"]	\N	\N	2025-05-01 11:30:37	2025-05-01 11:30:37
14	App\\Models\\User	18	Personal Access Token	915db4cc45202768b4972f2b4a9fbacf7f7ef6b1c26742fbdfdc384b01cad16f	["*"]	\N	\N	2025-05-01 11:30:37	2025-05-01 11:30:37
15	App\\Models\\User	19	Personal Access Token	ebf3cce81cc8b33031a01a530d1f614b89661c0d677730feac505d77678e7625	["*"]	\N	\N	2025-05-02 00:00:07	2025-05-02 00:00:07
16	App\\Models\\User	19	Personal Access Token	a98a00eb9de3194ddf3373ae2999cd405f6909567afd7488297a8c0fee00df7f	["*"]	\N	\N	2025-05-02 00:00:08	2025-05-02 00:00:08
17	App\\Models\\User	20	Personal Access Token	db25e786322929c0778a4430df8b7632ff56d5a09c10a2ee6eee29620952a5f7	["*"]	\N	\N	2025-05-02 16:39:45	2025-05-02 16:39:45
18	App\\Models\\User	20	Personal Access Token	247df0d2e8c88588d403f2cc0ecd169273c565f8772f87f2e367c66ff8833df8	["*"]	\N	\N	2025-05-02 16:39:45	2025-05-02 16:39:45
19	App\\Models\\User	21	Personal Access Token	660a99d28d1b97ef62243ac14a6dfe581fa3881c2753d2a45ffacbc6be04408d	["*"]	\N	\N	2025-05-02 16:41:03	2025-05-02 16:41:03
20	App\\Models\\User	21	Personal Access Token	873b714f94d549ed78e39ab35b72dfedd7de56e2df7f444f6cbe63c097d03552	["*"]	\N	\N	2025-05-02 16:41:04	2025-05-02 16:41:04
21	App\\Models\\User	22	Personal Access Token	dddd9c87b943d43d449abf8bd361c43b32423394e0df75f6efb3fd9d223d6725	["*"]	\N	\N	2025-05-02 22:20:46	2025-05-02 22:20:46
22	App\\Models\\User	22	Personal Access Token	72fbadd0687eb9f4e4ecdd59ead07f61d42b9e9d306917d0d1d7a4e8ae41c943	["*"]	\N	\N	2025-05-02 22:20:47	2025-05-02 22:20:47
23	App\\Models\\User	22	Personal Access Token	ae9e8db9c3d9cf40d70af82170df92b9f394ac5df25c6377f328598dfdd5f4bd	["*"]	\N	\N	2025-05-02 22:22:46	2025-05-02 22:22:46
24	App\\Models\\User	22	Personal Access Token	02c236661cba27658f38772e04093b92f75582fc63b55b1169e7b3abd9c8d532	["*"]	\N	\N	2025-05-02 22:24:42	2025-05-02 22:24:42
25	App\\Models\\User	22	Personal Access Token	ffe79c019d291f8a863770a862d0ac324e94f688d4207d39b148ae36365cc9de	["*"]	\N	\N	2025-05-02 22:25:20	2025-05-02 22:25:20
26	App\\Models\\User	22	Personal Access Token	30eafa0b732ec5b438854d3f0e22ae676b79ff1f8f302a4765395008a21e50ca	["*"]	\N	\N	2025-05-02 22:52:26	2025-05-02 22:52:26
27	App\\Models\\User	18	Personal Access Token	981604a2d84233e945aed2d71281cfc459919a1a288e6bedf43f94a3369dc905	["*"]	\N	\N	2025-05-03 05:20:43	2025-05-03 05:20:43
28	App\\Models\\User	18	Personal Access Token	85dbb4962cffeaeed81e00a5fc61e3aaebc7c90dea032a2eb9849d79e12b2184	["*"]	\N	\N	2025-05-03 05:22:27	2025-05-03 05:22:27
29	App\\Models\\User	18	Personal Access Token	a5e4c86c0786e46d8722b1a2b58f7f89f2bd829a8af7af3e3234acbf97713d36	["*"]	\N	\N	2025-05-03 05:24:36	2025-05-03 05:24:36
30	App\\Models\\User	18	Personal Access Token	a6b8fb94df6331690ece3fcfc5f78b2f248dccacacd6e2bf7df71a93ebf75be1	["*"]	\N	\N	2025-05-03 05:27:34	2025-05-03 05:27:34
31	App\\Models\\User	18	Personal Access Token	4a2f20e9b546d5e7fa9b6d598df09e42f98b76602910f4559066c22d75f03479	["*"]	\N	\N	2025-05-03 05:29:39	2025-05-03 05:29:39
32	App\\Models\\User	18	Personal Access Token	c412e12ea2f4de22a69471abca21e8be2cbc27f29166458a6a52a8a57b187975	["*"]	\N	\N	2025-05-03 05:36:40	2025-05-03 05:36:40
33	App\\Models\\User	18	Personal Access Token	ec3cdfd9b30cf8d8fadde2bf19071330d173fcb25517a47ec8347c91c4ffbf24	["*"]	\N	\N	2025-05-03 05:47:34	2025-05-03 05:47:34
34	App\\Models\\User	18	Personal Access Token	7aa9140ce75be24e4cf0b4973e0479844e41f404d4479e08607fa000e6ab0b81	["*"]	\N	\N	2025-05-03 05:52:02	2025-05-03 05:52:02
35	App\\Models\\User	18	Personal Access Token	5b12216bebae795e0cf5c15e038c10db0fcd364805541af8327f0c542c981e8d	["*"]	\N	\N	2025-05-03 06:04:53	2025-05-03 06:04:53
36	App\\Models\\User	18	Personal Access Token	b967a6af372452a70155fd25930c4e51a2c424eeef35d4f1f15d4bdf9feffe0b	["*"]	\N	\N	2025-05-03 06:16:53	2025-05-03 06:16:53
37	App\\Models\\User	23	Personal Access Token	158dab21e80e426915f1183a3ca8e5a9700ccd1f5f41fd5e4959c8d85e9d49e7	["*"]	\N	\N	2025-05-03 06:49:55	2025-05-03 06:49:55
38	App\\Models\\User	23	Personal Access Token	ee96f1e167de620c98f2c80977cc891eabc3d6e239e7aae868919d6af25a1962	["*"]	\N	\N	2025-05-03 06:49:56	2025-05-03 06:49:56
39	App\\Models\\User	23	Personal Access Token	131e069933cc2aed12071e42f94cc7b5c0f4fafce666b526d362b3c1016edf2b	["*"]	\N	\N	2025-05-03 06:50:47	2025-05-03 06:50:47
40	App\\Models\\User	24	Personal Access Token	348b766c652b9dd86d615a77551ba98b694fe9bdca0cb3acc46c0d83efaca654	["*"]	\N	\N	2025-05-03 07:49:11	2025-05-03 07:49:11
41	App\\Models\\User	24	Personal Access Token	928072cea13c79c50e34478057c141816c701e6d87db1c20e31f46678eb44eb8	["*"]	\N	\N	2025-05-03 07:49:12	2025-05-03 07:49:12
42	App\\Models\\User	25	Personal Access Token	7d5bed82d9d25a2e41f09fa3b329e0cbc809562f4ca75602cd517bbbd39adab5	["*"]	\N	\N	2025-05-03 07:59:26	2025-05-03 07:59:26
43	App\\Models\\User	25	Personal Access Token	6bd24ca988cb1e7cb600f4b72d9b564d6ed568f1bcab7e2f7b499b6872242bb2	["*"]	\N	\N	2025-05-03 07:59:27	2025-05-03 07:59:27
44	App\\Models\\User	26	Personal Access Token	94b3698396de22ba9d037a0959428a92c8485a36e54b2c1aaaee6341b867c580	["*"]	\N	\N	2025-05-03 08:12:38	2025-05-03 08:12:38
45	App\\Models\\User	26	Personal Access Token	4dbb4f2a808b6af4450918ec744e5990aaf6d37a7ce96292b8a6acd47e031e54	["*"]	\N	\N	2025-05-03 08:12:39	2025-05-03 08:12:39
46	App\\Models\\User	26	Personal Access Token	f9fc09560c614aaafc0cd753f4fef5ef72a7cd1c6551ee682d72662328c19b5a	["*"]	\N	\N	2025-05-03 08:13:03	2025-05-03 08:13:03
47	App\\Models\\User	27	Personal Access Token	9c2e20a8c2675aebf94418b4e95ee44c86cbabb5a3f70fde4c9191cba27b6a6c	["*"]	\N	\N	2025-05-03 08:14:53	2025-05-03 08:14:53
48	App\\Models\\User	27	Personal Access Token	59a0dff0e38f5d3310a07eda07b56f5587ec852ef31603dbee6057763bc02133	["*"]	\N	\N	2025-05-03 08:14:53	2025-05-03 08:14:53
49	App\\Models\\User	26	Personal Access Token	707015ff250e739cdcd7f320ca84bb7767eb99954014be8b5928a896b32ef807	["*"]	\N	\N	2025-05-03 08:19:13	2025-05-03 08:19:13
50	App\\Models\\User	27	Personal Access Token	5aa3883da6ecaa8adf156f865830b6dedd7fce7b20673194d004cac502021641	["*"]	\N	\N	2025-05-03 08:19:19	2025-05-03 08:19:19
51	App\\Models\\User	24	Personal Access Token	ea66bde9381d3ec9c052d996e4e9e5ea5b581283b42e48a8320d5471d1d15104	["*"]	\N	\N	2025-05-03 08:21:20	2025-05-03 08:21:20
52	App\\Models\\User	28	Personal Access Token	7900669dc8a1ad59ad456c1663af7485385ec4145535fd5dab4b3e19a1c63424	["*"]	\N	\N	2025-05-03 08:24:39	2025-05-03 08:24:39
53	App\\Models\\User	28	Personal Access Token	3acda43d13be488b454c83fa765b51622adecc44a7f644218882a8bd1dbb5b99	["*"]	\N	\N	2025-05-03 08:24:39	2025-05-03 08:24:39
54	App\\Models\\User	28	Personal Access Token	f1f89cc7b3c780962c6292ff349f8d8526c853012eaa91119f4c2de09f732a70	["*"]	\N	\N	2025-05-03 09:20:52	2025-05-03 09:20:52
55	App\\Models\\User	28	Personal Access Token	33df77fb5d3f211f5e784d5e9fdd6e51ee8d5909b8327dbf61d24c66fbfcd6f4	["*"]	\N	\N	2025-05-03 10:44:53	2025-05-03 10:44:53
56	App\\Models\\User	28	Personal Access Token	bb344baa71fe1237e5dcd9ba8391aa8c8b03851849ea9d66d18bc3e78cfae550	["*"]	\N	\N	2025-05-03 10:47:41	2025-05-03 10:47:41
57	App\\Models\\User	28	Personal Access Token	2e6521a41a126085f297229c9d886370108553a4d091f0f011ba15eb76fccb84	["*"]	\N	\N	2025-05-03 10:51:15	2025-05-03 10:51:15
58	App\\Models\\User	28	Personal Access Token	02ba11f13229e67995d9705ad2425be9829d1383e91a52a565571a72afb8a5f9	["*"]	\N	\N	2025-05-03 10:53:04	2025-05-03 10:53:04
59	App\\Models\\User	28	Personal Access Token	981f7e0e69fb49234d56881a8a0891f672dd59e30e345a7e7378bd979c7ac9f6	["*"]	\N	\N	2025-05-03 10:57:17	2025-05-03 10:57:17
60	App\\Models\\User	29	Personal Access Token	417ce89eb9396888917f8244b52ece8c99d5eef3961142607438b53c252669aa	["*"]	\N	\N	2025-05-03 13:09:31	2025-05-03 13:09:31
61	App\\Models\\User	29	Personal Access Token	b0f3b875b5128c77b925ff260c567f816a306e1d158c7bb0a86f2e6659c98872	["*"]	\N	\N	2025-05-03 13:09:32	2025-05-03 13:09:32
62	App\\Models\\User	28	Personal Access Token	f11cc15b8539a78fe8ea6c1f824391c8bd737357593a80c6f79e2ed11f314122	["*"]	\N	\N	2025-05-03 14:37:30	2025-05-03 14:37:30
63	App\\Models\\User	28	Personal Access Token	218371c50678044733cb45acad44c92a8fc37bd3673dd6840b4fe344e7116af3	["*"]	\N	\N	2025-05-03 14:40:47	2025-05-03 14:40:47
64	App\\Models\\User	28	Personal Access Token	28a68d922636adc86417955ccf4fd5fc8d47171666dea63b309cc37a1c110a6f	["*"]	\N	\N	2025-05-03 14:46:52	2025-05-03 14:46:52
65	App\\Models\\User	30	Personal Access Token	214600e52f59072abf0a48a6495c3c90da2ee6dce129812c606ac3535e2e8c3d	["*"]	\N	\N	2025-05-03 14:49:13	2025-05-03 14:49:13
66	App\\Models\\User	30	Personal Access Token	46aaedcafbf8437cbf4c708dcd7fa859641d2a8f7b7fbc0a09b1658d3f14cd36	["*"]	\N	\N	2025-05-03 14:49:14	2025-05-03 14:49:14
67	App\\Models\\User	28	Personal Access Token	adc666ae17d2cc50e844800bf1d816b72b47d83460cfd7283f6385ee0532f9ec	["*"]	\N	\N	2025-05-03 14:55:28	2025-05-03 14:55:28
68	App\\Models\\User	28	Personal Access Token	bd79bf7a8a53ec543269e11d1258638dbcabba9c4c552d8ee3094ef4ecaf3f01	["*"]	\N	\N	2025-05-03 15:25:58	2025-05-03 15:25:58
69	App\\Models\\User	28	Personal Access Token	1e2d53613d37519dd9505e71e5a84f9a461250319febe713a00efeec61757fff	["*"]	\N	\N	2025-05-03 15:29:26	2025-05-03 15:29:26
70	App\\Models\\User	28	Personal Access Token	b18b00a21b4430dba8e68908948c1662cd4896cb432481f3515017f4bb2cc9ad	["*"]	\N	\N	2025-05-03 15:33:25	2025-05-03 15:33:25
71	App\\Models\\User	28	Personal Access Token	2d088c884d6dd2bacefe5fa529403960542c1d5d3a8b96b7fb7dce207411782f	["*"]	\N	\N	2025-05-03 15:36:04	2025-05-03 15:36:04
72	App\\Models\\User	28	Personal Access Token	2aa020760d43c61505adb38ae457edf10a3e798818124277a16ca3c001edf011	["*"]	\N	\N	2025-05-03 15:47:16	2025-05-03 15:47:16
73	App\\Models\\User	28	Personal Access Token	035d04fea29eb1e30e5e1a86b1b73c5d5aadb109c3846439ab901684cf31d745	["*"]	\N	\N	2025-05-03 18:21:34	2025-05-03 18:21:34
74	App\\Models\\User	28	Personal Access Token	eb69af193039e282e815f54b29e032fef16ee15f0a1661d51e173bbf9493f7b2	["*"]	\N	\N	2025-05-03 18:23:22	2025-05-03 18:23:22
75	App\\Models\\User	28	Personal Access Token	f44d9e3a6f68337fca92a3144faa5c6b835f6d27d029b68c0a072dc1c2359129	["*"]	\N	\N	2025-05-03 18:56:39	2025-05-03 18:56:39
76	App\\Models\\User	28	Personal Access Token	0e274a8f885dacb741a51e50d3d6c478368dbb8aa45a45e56f6676262abfc84e	["*"]	\N	\N	2025-05-03 19:02:12	2025-05-03 19:02:12
77	App\\Models\\User	28	Personal Access Token	d80e1b6b683691adf33eb111135e7c3d164ef96cf074893486bfe90b68045d46	["*"]	\N	\N	2025-05-03 19:03:47	2025-05-03 19:03:47
78	App\\Models\\User	28	Personal Access Token	aad3606d7cab021b37b0ddff7cee9f9acec1b64f95fae949c83995a292ed46b8	["*"]	\N	\N	2025-05-03 19:06:39	2025-05-03 19:06:39
79	App\\Models\\User	28	Personal Access Token	b0344b8799fe4ee18f348dc734158e134753deb5f10987ff1bb21416696ab278	["*"]	\N	\N	2025-05-03 19:10:09	2025-05-03 19:10:09
80	App\\Models\\User	28	Personal Access Token	63089f15223d42a29c9de3d63cb22780b4bf7df20c8341aa2a8c5c52c2d88032	["*"]	\N	\N	2025-05-03 19:13:53	2025-05-03 19:13:53
81	App\\Models\\User	28	Personal Access Token	c090b1976405120fb27514af58d169c21fdb13983918d90c6fef8326d8cdf334	["*"]	\N	\N	2025-05-03 19:17:04	2025-05-03 19:17:04
82	App\\Models\\User	28	Personal Access Token	0a7cd472d3f8426534fae7b051d27c2f463ede5b1629cf765abea90436e89cc8	["*"]	\N	\N	2025-05-03 19:22:26	2025-05-03 19:22:26
83	App\\Models\\User	28	Personal Access Token	99af32e787aa72f7d6b702fe2fee90792b549fec28fd026f54fd7f500a398142	["*"]	\N	\N	2025-05-03 19:26:09	2025-05-03 19:26:09
84	App\\Models\\User	28	Personal Access Token	805e30e4c85eb0eb7eb04571912eae2503a005c9fb4e75a1dbe7a6142f59c01a	["*"]	\N	\N	2025-05-03 19:33:45	2025-05-03 19:33:45
85	App\\Models\\User	28	Personal Access Token	1bba53676d14d247bc902f91759d6d9c196962dc42839f9389b9222604968ae0	["*"]	\N	\N	2025-05-03 19:39:45	2025-05-03 19:39:45
86	App\\Models\\User	28	Personal Access Token	b639896eba6316782fbd513c05ecc8edc8a13c98926889b45de2864f1446154e	["*"]	\N	\N	2025-05-03 19:48:21	2025-05-03 19:48:21
87	App\\Models\\User	28	Personal Access Token	411e677a591b0e1599dea4be9e6f57a8fd3beb1a3c9cbb7fb966d382948d4972	["*"]	\N	\N	2025-05-03 19:49:41	2025-05-03 19:49:41
88	App\\Models\\User	28	Personal Access Token	301b9979bf856e331d326200d79f6e2aba4a92af1fd41436f667b84beedb95d1	["*"]	\N	\N	2025-05-03 20:06:15	2025-05-03 20:06:15
89	App\\Models\\User	28	Personal Access Token	9010ea91a20da75ac1b7762b27f7c702ed3a1aefaf15a68fcb9d451360dd1912	["*"]	\N	\N	2025-05-03 20:06:53	2025-05-03 20:06:53
90	App\\Models\\User	28	Personal Access Token	de81497e2ac9b716a45b20bce9ca42ce9ba659eff009fdd809ab74ce66dea912	["*"]	\N	\N	2025-05-03 20:17:52	2025-05-03 20:17:52
91	App\\Models\\User	28	Personal Access Token	156bb2c4d9a914aa377bef453ee85f114a5380a890c63a9676efe95226f4b2b2	["*"]	\N	\N	2025-05-03 20:20:48	2025-05-03 20:20:48
92	App\\Models\\User	28	Personal Access Token	e3d83677e681d80830bcbfa038793a6c92178e664507cdd05d907e107f1e7ebc	["*"]	\N	\N	2025-05-03 20:24:28	2025-05-03 20:24:28
93	App\\Models\\User	28	Personal Access Token	b63d512b2d89292b4026d668d75b7959bc326cc57d3068bfca5cdfa0705cd9b7	["*"]	\N	\N	2025-05-03 20:28:08	2025-05-03 20:28:08
94	App\\Models\\User	28	Personal Access Token	ff87731263f2ad3196ec96b0c44d817526e14d23ccbb861e314630c606fc693e	["*"]	\N	\N	2025-05-03 20:33:33	2025-05-03 20:33:33
95	App\\Models\\User	28	Personal Access Token	813e0515b9b68ed96b3bfb29bdeb9523b385d7f3b6a9f47fa0deb8301f7a7b46	["*"]	\N	\N	2025-05-03 20:36:29	2025-05-03 20:36:29
96	App\\Models\\User	28	Personal Access Token	b26dd25b92fe0e80d06e79a6ad209e532099d452eadb59419b39870a2e432a2d	["*"]	\N	\N	2025-05-03 20:40:11	2025-05-03 20:40:11
97	App\\Models\\User	28	Personal Access Token	6e407d06b54dbe8a66b6bc143ca61dfc477f905d7345ea1b550210c0d8056f0e	["*"]	\N	\N	2025-05-03 20:42:41	2025-05-03 20:42:41
98	App\\Models\\User	28	Personal Access Token	277ff8c86a98da5fc0ef2303663ac86481fc66387214b1ed90ba17e8e59e7925	["*"]	\N	\N	2025-05-03 20:47:27	2025-05-03 20:47:27
99	App\\Models\\User	29	Personal Access Token	2ff96c8188bec19736602aaf99c4db702561ee835493b04d80427020da02ea78	["*"]	\N	\N	2025-05-04 07:57:55	2025-05-04 07:57:55
100	App\\Models\\User	29	Personal Access Token	648472dccd92d0bf2e3b2c0786ff2919f71d57642a73e7350b4655d96968086b	["*"]	\N	\N	2025-05-04 08:07:42	2025-05-04 08:07:42
101	App\\Models\\User	29	Personal Access Token	201933d8ff64ec5e51d7ddf71bb6291bfd6b8c7f0aacae8abe8203d29d8530ad	["*"]	\N	\N	2025-05-04 08:10:20	2025-05-04 08:10:20
102	App\\Models\\User	31	Personal Access Token	de4e3201d5cd54ad3d9b57d6b6fba5ba3aa9f21d0be36ca025a98617fb2ef02d	["*"]	\N	\N	2025-05-05 04:52:04	2025-05-05 04:52:04
103	App\\Models\\User	31	Personal Access Token	a1b2d20a135a9da4a1b1afaf9590d778525ec1b8a9638ca9b958c62470037de9	["*"]	\N	\N	2025-05-05 04:52:04	2025-05-05 04:52:04
104	App\\Models\\User	28	Personal Access Token	97ade2ba4934f61c4e77f55dba8267f42e81637a40840ecf5090823bcb4aaa07	["*"]	\N	\N	2025-05-05 05:11:19	2025-05-05 05:11:19
105	App\\Models\\User	27	Personal Access Token	f5427d60a765fab02dd9ed9b0b70a15a48a0f5394feed5e357938b0d9bb4791b	["*"]	\N	\N	2025-05-05 06:51:27	2025-05-05 06:51:27
106	App\\Models\\User	32	Personal Access Token	2392b5a066233483099363eecc435dc781d9159e5ac3653668e06f36471a067c	["*"]	\N	\N	2025-05-05 06:56:47	2025-05-05 06:56:47
107	App\\Models\\User	32	Personal Access Token	1045d74ecab7db742dcfb7e083fb858477d9c74a71ff77f7b7cce422dbed4153	["*"]	\N	\N	2025-05-05 06:56:48	2025-05-05 06:56:48
108	App\\Models\\User	26	Personal Access Token	e424d3a8c6a1328f054387d6ea0818600b32b146a35feb7fad4d7e6508020b8e	["*"]	\N	\N	2025-05-05 07:34:22	2025-05-05 07:34:22
109	App\\Models\\User	28	Personal Access Token	73192e6075d6e9f71ccab0fcec3c76e1f1e8a965ed48c574afe040b6ef111afc	["*"]	\N	\N	2025-05-05 07:52:54	2025-05-05 07:52:54
110	App\\Models\\User	24	Personal Access Token	83f16be80aff1e1706869c7dc33c774dcc188bdd454fefdb138315732f233449	["*"]	\N	\N	2025-05-05 08:04:47	2025-05-05 08:04:47
111	App\\Models\\User	27	Personal Access Token	ffc915234ea7cc0f8cf63f6e837711c369b5a4fa8e51613b963cf97a565a6d3e	["*"]	\N	\N	2025-05-05 08:09:56	2025-05-05 08:09:56
112	App\\Models\\User	27	Personal Access Token	8c7f9cd245278879621a6233a506b4167ce1da4e453ad19a54a340ade23394d2	["*"]	\N	\N	2025-05-05 08:11:42	2025-05-05 08:11:42
113	App\\Models\\User	27	Personal Access Token	bbc40ae0ca7dabc35e9a8d5c139e04c68eda8a8ebf78e3ee9c807819661c5c0b	["*"]	\N	\N	2025-05-05 08:16:27	2025-05-05 08:16:27
114	App\\Models\\User	33	Personal Access Token	d258e8cf0ef77a5dfcd013ffb8de27f8e8f1de953f0d7bb98cb8722c1bf47856	["*"]	\N	\N	2025-05-06 07:29:41	2025-05-06 07:29:41
115	App\\Models\\User	33	Personal Access Token	529806caff817d301f918e53684ed28cbd57cb14073cd0f30c0c38cf64f51374	["*"]	\N	\N	2025-05-06 07:29:42	2025-05-06 07:29:42
\.


--
-- Data for Name: personals_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personals_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: poll_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.poll_options (id, poll_id, option_text, votes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: polls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.polls (id, user_id, journey_id, question, date, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: post_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_comments (id, post_id, user_id, comment, created_at, updated_at) FROM stdin;
1	1	11	Great post!	\N	\N
2	1	12	Interesting perspective.	\N	\N
3	1	13	I love this post!	\N	\N
4	2	14	Thanks for sharing!	\N	\N
5	3	12	I agree with this post.	\N	\N
6	3	11	Great job on this!	\N	\N
\.


--
-- Data for Name: post_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_likes (id, post_id, user_id, created_at, updated_at) FROM stdin;
1	1	13	\N	\N
2	1	11	\N	\N
3	1	12	\N	\N
\.


--
-- Data for Name: post_shares; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_shares (id, post_id, user_id, created_at, updated_at) FROM stdin;
1	1	13	\N	\N
2	1	11	\N	\N
3	1	12	\N	\N
\.


--
-- Data for Name: post_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_types (id, name, status, created_at, updated_at) FROM stdin;
1	Poll	t	2025-04-26 01:04:32	2025-04-26 01:04:32
2	Short Video	t	2025-04-26 08:27:03	2025-04-26 08:27:03
3	Image	t	2025-04-26 08:27:19	2025-04-26 08:27:19
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, title, description, user_id, created_at, updated_at, image, comments, post_type, postdate, post_video, poll_question, poll_options, post_id) FROM stdin;
11	\N	<p>7 Days in Paradise - Bali Edition</p><p>&nbsp;</p><p>From private pool villas to epic beach club nights, from sacred temples to wild waterfalls — the countdown to our Bali escape has officially begun! ✈️🌴</p><p>#TravelDiaries #BaliVibes #GroupTrip #AdventureAwaits #Seminyak #Ubud #Uluwatu #BucketList</p>	14	2025-04-28 07:52:32	2025-04-28 07:52:32	\N	0	1	2025-06-01	\N	How do you want to travel inside Bali?	["Scooter Rental","Private Car with Driver"]	0001
20	\N	From private pool villas to epic beach club nights, from sacred temples to wild waterfalls — the countdown to our Bali escape has officially begun! ✈️🌴\n\n#TravelDiaries #BaliVibes #GroupTrip #AdventureAwaits #Seminyak #Ubud #Uluwatu #BucketList	17	2025-04-30 19:41:59	2025-04-30 19:41:59	\N	0	2	2025-06-01	["posts\\/videos\\/v1DTivc7wIEUY9WL8lOdZvVe8k05qPxSDxO8xuX0.mp4","posts\\/videos\\/w5g6debR36WPrtKgAZTSSm6wT4ciHbqOwkuYWlbB.mp4"]	\N	\N	0008
21	\N	From private pool villas to epic beach club nights, from sacred temples to wild waterfalls — the countdown to our Bali escape has officially begun! ✈️🌴\n\n#TravelDiaries #BaliVibes #GroupTrip #AdventureAwaits #Seminyak #Ubud #Uluwatu #BucketList	17	2025-04-30 19:44:08	2025-04-30 19:44:08	["posts\\/images\\/9o2aXX4RGgFQqU1EH0NoRRD0Lr1k4Uv1CCXbJivy.jpg"]	0	3	2025-06-01	\N	\N	\N	0009
22	\N	From private pool villas to epic beach club nights, from sacred temples to wild waterfalls — the countdown to our Bali escape has officially begun! ✈️🌴\n\n#TravelDiaries #BaliVibes #GroupTrip #AdventureAwaits #Seminyak #Ubud #Uluwatu #BucketList	18	2025-05-01 11:32:30	2025-05-01 11:32:30	["posts\\/images\\/l5HCL6qVqKcrT9uWS3cVB9bgetXR4PhdLVnIiYmQ.jpg"]	0	3	2025-06-01	\N	\N	\N	0010
14	\N	<p>🎉 Group trip to BALI incoming!<br>✈️ August 10–17, 2025<br>🏖️ Beach. 🍲 Food. 🌾 Nature. 🕺 Fun.<br>Can't wait for sunsets, pool parties, and island adventures with the best people!<br>🌴 #BaliBound</p>	14	2025-04-29 08:40:41	2025-04-29 08:43:25	\N	0	2	2025-05-22	["posts\\/videos\\/IfH4OgCIqC2Gox51SbPKKqehTQHTAiZao3a4doWa.mp4"]	\N	\N	0004
15	\N	<p>jdfiughd</p>	14	2025-04-29 08:57:24	2025-04-29 09:56:37	\N	0	2	2025-04-30	["posts\\/videos\\/UruJrgnSIGJk5r8UrON5TXkzCAoaRycKmztmzhrd.mp4"]	\N	\N	0005
13	\N	<p>dsfdsfds</p>	12	2025-04-28 08:54:00	2025-04-29 09:58:33	\N	0	2	2025-04-30	["posts\\/videos\\/2uFHt2zfWStvmUQaKY8LqxB20VdKBWAFUkFe5mr4.mp4","posts\\/videos\\/f9G1NzkdJWKXGz6LekebINrxMdINLs9oZixvVzhB.mp4","posts\\/videos\\/cxyMh6BKa391n5gZo8uZrN0j7qag0uOEbMsMkhfK.mp4"]	\N	\N	0003
16	\N	<p>ddscd</p>	15	2025-04-29 10:01:58	2025-04-29 10:01:58	\N	0	2	2025-04-29	["posts\\/videos\\/wsmQHi4ASsz1o6CQrFVOmPpdkKzcY3kUfFJMiChu.mp4","posts\\/videos\\/eGgp33DJ0RYzpgW73NErcXKVkjw3aVwE015Tt9ZT.mp4","posts\\/videos\\/hgXnuBTskkHlXN46WbnxMh6EUTv5z9lhw7lTVKPP.mp4"]	\N	\N	0006
23	\N	Who will win?	18	2025-05-02 12:36:29	2025-05-02 12:36:29	\N	0	1	2025-05-02	\N	Who will win?	["Pakistan","South africa"]	0011
12	\N	<p>Excited to recharge and get inspired by the beauty of Bali 🇮🇩 next month!<br>7 days exploring culture, beaches, and adventure with close friends.</p><p>Seminyak • Ubud • Uluwatu 🌴</p><p>✈️ A reminder to balance hard work with meaningful travel experiences!<br>#Travel #Culture #Recharge #WorkLifeBalance&nbsp;</p>	15	2025-04-28 08:03:28	2025-04-29 10:17:15	["posts\\/images\\/yscBmglXV08oZpfcTAniS0eIWZD0lcZISLhYjjtx.png"]	0	3	2025-06-02	posts/fGzwy15myI8HrGYjRsFndr4tBfY4dyALePgyUHwQ.mp4	\N	\N	0002
19	\N	From private pool villas to epic beach club nights, from sacred temples to wild waterfalls — the countdown to our Bali escape has officially begun! ✈️🌴\n\n#TravelDiaries #BaliVibes #GroupTrip #AdventureAwaits #Seminyak #Ubud #Uluwatu #BucketList	17	2025-04-30 19:37:28	2025-04-30 19:37:28	\N	0	1	2025-06-01	\N	How do you want to travel inside Bali?	["Private Car with Driver","Scooter Rental"]	0007
24	\N	Who will win the match	18	2025-05-02 12:49:35	2025-05-02 12:49:35	\N	0	1	2025-05-02	\N	Who will win the match	["Lahore","Karachi"]	0012
25	\N	Question	18	2025-05-02 12:51:35	2025-05-02 12:51:35	\N	0	1	2025-05-02	\N	Question	["Option 1","Option 2"]	0013
26	\N	asd	18	2025-05-03 05:29:55	2025-05-03 05:29:55	\N	0	1	2025-05-02	\N	asd	["afg","ahh"]	0014
27	\N	My post	18	2025-05-03 05:36:56	2025-05-03 05:36:56	\N	0	3	2025-05-02	\N	\N	\N	0015
28	\N	Desc	18	2025-05-03 06:05:15	2025-05-03 06:05:15	\N	0	3	2025-05-02	\N	\N	\N	0016
29	\N	My image post	18	2025-05-03 06:18:17	2025-05-03 06:18:17	["posts\\/images\\/l24Qr0OoQql1g4jcI92s7949gAFRPGOkmFxzh22J.png"]	0	3	2025-05-02	\N	\N	\N	0017
30	\N	asd	28	2025-05-03 08:44:45	2025-05-03 08:44:45	["posts\\/images\\/CmtNRgyaKB9UXhN7Eeub44rv5AEOxt5bG24gn7kN.jpg"]	0	3	2025-05-02	\N	\N	\N	0018
31	\N	Multiple images	28	2025-05-03 09:23:38	2025-05-03 09:23:38	["posts\\/images\\/MlsOVgfrvmdVxPAObzivW6n3r3lwCvjHqidZTlnB.jpg","posts\\/images\\/f7IZtO0aBGs2M73NVyC0lauVrt8U79tQEaZr2gxf.jpg"]	0	3	2025-05-02	\N	\N	\N	0019
32	\N	Caption	28	2025-05-03 10:48:04	2025-05-03 10:48:04	["posts\\/images\\/MX6F4iNybovvOTGWTFyCdhbmPeyk9IhcWwtcS65z.jpg"]	0	3	2025-05-02	\N	\N	\N	0020
33	\N	Caption only	28	2025-05-03 10:53:27	2025-05-03 10:53:27	\N	0	3	2025-05-02	\N	\N	\N	0021
34	\N	Who will win the match	28	2025-05-03 10:53:57	2025-05-03 10:53:57	\N	0	1	2025-05-02	\N	Who will win the match	["Lahore","Karachi","Islamabad"]	0022
35	\N	Caption only post	28	2025-05-03 10:57:36	2025-05-03 10:57:36	\N	0	3	2025-05-02	\N	\N	\N	0023
36	\N	Whol will win the match	28	2025-05-03 10:58:04	2025-05-03 10:58:04	\N	0	1	2025-05-02	\N	Whol will win the match	["Karachi","Lahore","Quetta"]	0024
37	\N	Images post	28	2025-05-03 10:58:49	2025-05-03 10:58:49	["posts\\/images\\/jmpzzFyv2rO2akzxRHdESCBRRqxJY7jtHc6pr4b4.jpg","posts\\/images\\/5uCouHOaMmbiRmo9mKmLCYZw1i39ksQz54BXXBzy.jpg","posts\\/images\\/i6coUsjN4d1bFYRdjCbtAHLu685rkqkUSbcUgvG6.jpg"]	0	3	2025-05-02	\N	\N	\N	0025
38	\N	Beach Drive	29	2025-05-03 13:10:52	2025-05-03 13:10:52	\N	0	3	2025-05-02	\N	\N	\N	0026
39	\N	Best place to visit in UAE	29	2025-05-03 13:19:41	2025-05-03 13:19:41	\N	0	1	2025-05-02	\N	Best place to visit in UAE	["Dubai","Sharjah","Abudhabi"]	0027
40	\N	Test	29	2025-05-03 13:22:32	2025-05-03 13:22:32	["posts\\/images\\/GWvmQ0shQtoDFsEFXFHCQREV5v8NyQL2COB68SYk.jpg"]	0	3	2025-05-02	\N	\N	\N	0028
41	\N	test 2	29	2025-05-03 13:25:07	2025-05-03 13:25:07	["posts\\/images\\/3GpPfxQPZcVN2aLrknU5DOByXvMZAfKhkDVVXZNs.jpg","posts\\/images\\/wOdEJMoQVKl9AAkG9MuKv6cq25B1IsVAqn2tproz.jpg"]	0	3	2025-05-02	\N	\N	\N	0029
42	\N	hgfffff	30	2025-05-03 14:55:40	2025-05-03 14:55:40	["posts\\/images\\/La6yBBL984tOilrpRcP25BS2Kaok6xyRcPvvxXj3.jpg","posts\\/images\\/GUy6Dy9dl0pxKtt6gkKDxR2yEp0ORhUnIUzOgnXX.jpg"]	0	3	2025-05-02	\N	\N	\N	0030
43	\N	pak win india	30	2025-05-03 14:56:17	2025-05-03 14:56:17	\N	0	1	2025-05-02	\N	pak win india	["pak","india","Indonesia"]	0031
44	\N	hello	30	2025-05-03 14:56:56	2025-05-03 14:56:56	["posts\\/images\\/mrdW9plgGKjEq3eURcvmicFRDZhlt1pClUCnVe9C.jpg","posts\\/images\\/VrI6eeIJc6WT5hBBvAOqudd3i27aGLzn33Z0xtk3.jpg"]	0	3	2025-05-02	\N	\N	\N	0032
45	\N	Car image	28	2025-05-03 15:36:26	2025-05-03 15:36:26	["posts\\/images\\/x20rx1plXGKOxM05E4prYtvXBsssAqBsjDlQUwhR.jpg"]	0	3	2025-05-02	\N	\N	\N	0033
46	\N	Video post	28	2025-05-03 20:07:19	2025-05-03 20:07:19	\N	0	2	2025-05-02	["posts\\/videos\\/QCTXAnMeuUouF54PhDf7d630yQLf79wAdEOV1PMF.mp4"]	\N	\N	0034
47	\N	New video	28	2025-05-03 20:22:12	2025-05-03 20:22:12	\N	0	2	2025-05-02	["posts\\/videos\\/zwuj8CUsF3Yg80i2DQhfYdWgx442Q5tL8Sc2B4c7.mp4","posts\\/videos\\/aFPj3w3bkRNPNjsouGf09yBczWLLdM7bIzwmmzzh.mp4"]	\N	\N	0035
48	\N	Camera video	28	2025-05-03 20:25:10	2025-05-03 20:25:10	\N	0	2	2025-05-02	["posts\\/videos\\/AxZROa1m1JA7SgkXaoVPAoXUyETBbLCQaatpUriS.mp4"]	\N	\N	0036
49	\N	Test	28	2025-05-03 20:28:59	2025-05-03 20:28:59	\N	0	2	2025-05-02	["posts\\/videos\\/5Idirn1YcgsjF8kMRQVRVGH7Bwb8MFMPY0TGBzCQ.mp4"]	\N	\N	0037
50	\N	Image post	28	2025-05-03 20:34:03	2025-05-03 20:34:03	["posts\\/images\\/u2s0rRFQxp8R6qQKROgainAkcQh9UQ3ewCWBkITV.jpg"]	0	3	2025-05-04	\N	\N	\N	0038
51	\N	Simulator test	28	2025-05-03 20:37:10	2025-05-03 20:37:10	\N	0	2	2025-05-04	["posts\\/videos\\/C11ZJnXhOzRcCKpBMQFUgaaVFmIUS0WOZHeh5my0.mp4"]	\N	\N	0039
52	\N	New post123	28	2025-05-03 20:48:09	2025-05-03 20:48:09	\N	0	2	2025-05-04	["posts\\/videos\\/QSqtXsOdhL1WIldA7QWUmDUepiOvF5W7Yyt5CTCo.mp4"]	\N	\N	0040
53	\N	test 3	29	2025-05-04 08:01:14	2025-05-04 08:01:14	["posts\\/images\\/2DO0GKMO5v3pM4O4jrt83ANsQbQuTWjd74Klqn4S.jpg","posts\\/images\\/e5hMNS6nOeA3LELur9XJBUq3yJ27Ql5BCrxz85Sv.jpg","posts\\/images\\/wK3Pk0uwugjwu7FVJKeVYayddQPSbLILzuBogE0D.jpg"]	0	3	2025-05-04	\N	\N	\N	0041
54	\N	test 4	29	2025-05-04 08:03:08	2025-05-04 08:03:08	["posts\\/images\\/TCTK81q828v1t16JNgG01nQpxGIPWUjUTMai6wuE.jpg","posts\\/images\\/52uwz9e613fahgKcAzOGOQLNNGcP3J7455NaGHhw.jpg","posts\\/images\\/RnTB76hdgoya7MJdVjx0wzgbIzoI4z4lhXFoHr9e.jpg"]	0	3	2025-05-04	\N	\N	\N	0042
55	\N	test video	29	2025-05-04 08:04:38	2025-05-04 08:04:38	\N	0	2	2025-05-04	["posts\\/videos\\/eYVbNfLQgF6shicxkesrzvJikb5tlA2BYBR8DyRq.mp4"]	\N	\N	0043
56	\N	test video	29	2025-05-04 08:08:10	2025-05-04 08:08:10	\N	0	2	2025-05-04	["posts\\/videos\\/GB8Ccd3yww0J08FXDJpmCJ9qbUMOItvVL7Lk3dR3.mp4"]	\N	\N	0044
57	\N	test video 2	29	2025-05-04 08:09:55	2025-05-04 08:09:55	\N	0	2	2025-05-04	\N	\N	\N	0045
58	\N	test video 2	29	2025-05-04 08:10:00	2025-05-04 08:10:00	\N	0	2	2025-05-04	\N	\N	\N	0046
59	\N	test video 3	29	2025-05-04 08:11:25	2025-05-04 08:11:25	\N	0	2	2025-05-04	["posts\\/videos\\/5wTjeSD1xoMXZ285T9xErmH2dmga1PUTYD2vaNdE.mp4"]	\N	\N	0047
60	\N	test video 4	29	2025-05-04 08:13:18	2025-05-04 08:13:18	\N	0	2	2025-05-04	\N	\N	\N	0048
61	\N	test video 4	29	2025-05-04 08:13:37	2025-05-04 08:13:37	\N	0	2	2025-05-04	["posts\\/videos\\/BA4JYuocxfuQTR5Q84A6KOcONouiZDcv2S9U9Lje.mp4"]	\N	\N	0049
62	\N	who win today's match	31	2025-05-05 04:54:12	2025-05-05 04:54:12	\N	0	1	2025-05-02	\N	who win today's match	["india","Australia"]	0050
63	\N	hii 👋 the u of the day is going to be the best u r u in	31	2025-05-05 05:06:31	2025-05-05 05:06:31	["posts\\/images\\/PceRAaDYHyXrR1VL0OmfzWcZOOYE5X7qZYlJvJra.jpg","posts\\/images\\/Ax10DnEyYK1AmfpfOum7bR5nUuEZNqEVH9yEaacg.jpg","posts\\/images\\/qdyTWT7Q01osXgsZNWVBpulrPwpjnFdEVCzgTd4A.jpg"]	0	3	2025-05-02	\N	\N	\N	0051
64	\N	bvcs	33	2025-05-06 07:32:41	2025-05-06 07:32:41	["posts\\/images\\/aFCIEK7jgPgEzmI5sKQ4xK4gOFchsG14JtldXk8S.jpg"]	0	3	2025-05-06	\N	\N	\N	0052
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
1	Admin	web	2025-03-09 21:04:33	2025-03-09 21:04:33
2	Company	web	2025-03-09 21:04:33	2025-03-09 21:04:33
3	Individual	web	2025-03-09 21:04:33	2025-03-09 21:04:33
4	Staff	web	2025-03-09 21:04:33	2025-03-09 21:04:33
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
isjEfTSdXCDN67xeLCc0Lb3t5YJsasCXqHTbHnPP	\N	86.98.15.94	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQlB5OE5xaERCczJoQ1F0VkFGM25iaW5Vek1taDhQR243RzlYU2VWUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1OToiaHR0cHM6Ly9keGJpdHByb2plY3RzLmNvbS90cmF2ZWxibHpyX3dlYi9wdWJsaWMvYWRtaW4vdXNlcnMiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo1OToiaHR0cHM6Ly9keGJpdHByb2plY3RzLmNvbS90cmF2ZWxibHpyX3dlYi9wdWJsaWMvYWRtaW4vbG9naW4iO319	1746449554
V40NnfUhkFaNS0X1tRnHZNsGLdoT8gVjyo0VYaAz	\N	59.103.108.48	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUtUVGlXMUpYMGZDR0JIRWowaWIzc2x3ZnY3M1FZTDBaRzd3WEpnNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vdHJhdmVsYmx6cl93ZWIvcHVibGljL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1746513332
l443qVbaVDklPkdyFREButE9WZYYVmuT7vhyVXO3	\N	3.231.193.38	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot) Chrome/119.0.6045.214 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVBwT2FYNE94MkpQaHVtZXJxVHdWVlRaYjQyNVI0UWJVZWh4UXVNYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly9keGJpdHByb2plY3RzLmNvbS90cmF2ZWxibHpyX3dlYi9wdWJsaWMvYWRtaW4vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746484548
TkA5t2H6AAEZrRqBVXI8oe6Y8Wu8PXEdrU1fmvmC	\N	117.196.11.160	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjFRRXhtc0lUVld4eTFNbmd3MXBZNk10UkFrVVp0QzJWeHUxZlJXeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vdHJhdmVsYmx6cl93ZWIvcHVibGljL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1746513351
FJcPBGPSjR2r1pcXnmGibQnbc6cEUwiCAvwfV7Ug	\N	86.98.15.94	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWEFrNFlBWEFIcHZodVBEcFF2aGk1enNObDROWms0WE1zanRIUjNLSyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1OToiaHR0cHM6Ly9keGJpdHByb2plY3RzLmNvbS90cmF2ZWxibHpyX3dlYi9wdWJsaWMvYWRtaW4vcG9zdHMiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo1OToiaHR0cHM6Ly9keGJpdHByb2plY3RzLmNvbS90cmF2ZWxibHpyX3dlYi9wdWJsaWMvYWRtaW4vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746443084
\.


--
-- Data for Name: target_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.target_types (id, name, status, created_at, updated_at, company_id) FROM stdin;
\.


--
-- Data for Name: target_types_company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.target_types_company (id, company_id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: temp_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_users (id, name, email, dial_code, phone, phone_verified, active, email_verified, password, email_verified_at, role, first_name, last_name, user_image, user_phone_otp, user_email_otp, user_device_token, user_device_type, user_access_token, firebase_user_key, device_cart_id, created_at, updated_at, username) FROM stdin;
1	Sabeeh Shah k	sabeeh@shah.com	971	1	0	1	1	$2y$12$XXg8lSL3CuzRzRDiLQGjHO/fTePNnWZ1nuMTWGgqE/PJ75UNRllwm	2025-04-30 18:33:09	\N	Sabeeh Shah	k	\N	1111	1111	123123	android	\N	\N	\N	2025-04-30 18:31:25	2025-04-30 18:33:10	\N
2	Usama Shakeel	ushakeel@gmail.com	971	123123123	0	1	1	$2y$12$JY52r3YrIDJRlESRUNisqOGUBG5yvjOY2vDSbDgRNY.COyFFz37r6	2025-05-01 11:30:16	\N	Usama	Shakeel	\N	1111	1111	123123	android	\N	\N	\N	2025-05-01 11:30:16	2025-05-01 11:30:16	\N
3	Sabeeh Shah k	sabeeh1@shah.com	971	1234	0	1	1	$2y$12$fAbX9KNxfD52KLMgHuiRgOJNQBOBMKM/LVZLzf2Mg6f6UnBWvm.Nu	2025-05-01 23:59:17	\N	Sabeeh Shah	k	\N	1111	1111	123123	android	\N	\N	\N	2025-05-01 23:59:17	2025-05-01 23:59:17	\N
4	Sabeeh Shah k	sabeeh123@shah.com	971	123412	0	1	1	$2y$12$YiyV6ebgv1o0s8R.9Onrle6DOdhRV00qmZ6Se7z1hKjXBYRitumYm	2025-05-02 16:09:57	\N	Sabeeh Shah	k	\N	1111	1111	123123	android	\N	\N	\N	2025-05-02 16:09:57	2025-05-02 16:09:57	\N
5	Asad nazir	abs@gmail.com	92	3445566886	0	1	1	$2y$12$sWemLaUIJlyMDiW/2L4/mOtHkyK0idC2WbyIwLlGYoluVr8lLYOlW	2025-05-02 16:39:34	\N	Asad	nazir	\N	1111	1111	cVX2pRAaSpiJLbandchG8e:APA91bHNT93wERe_PPneVxIANeOwPPD8YFd9ZhXG-YJj9hINAPsfBTPwqRCfyGY7NoNny8ep-FcgfW_o0qv4doqTndye_9NLi-D2iPHRM4UUcSpkqaP2Iks	android	\N	\N	\N	2025-05-02 16:39:34	2025-05-02 16:39:34	\N
6	Asad nazir	abd@gmail.com	92	3445566885	0	1	1	$2y$12$mClr4cp2OMbsRRBR1PKuzO3rEAk.2lV9yNXjzUuosuIB6VrRh2EAW	2025-05-02 16:40:45	\N	Asad	nazir	\N	1111	1111	cVX2pRAaSpiJLbandchG8e:APA91bHNT93wERe_PPneVxIANeOwPPD8YFd9ZhXG-YJj9hINAPsfBTPwqRCfyGY7NoNny8ep-FcgfW_o0qv4doqTndye_9NLi-D2iPHRM4UUcSpkqaP2Iks	android	\N	\N	\N	2025-05-02 16:40:45	2025-05-02 16:40:45	\N
7	Asad Nazir	asad@gmail.com	92	3441566086	0	1	1	$2y$12$3eaJVE5GYztJW9/ZFvlHMelhS0.PwY.OWbCdzfA6pavMF75PUaJpG	2025-05-02 22:20:40	\N	Asad	Nazir	\N	1111	1111	c_dCsluuQbmh-4ARvPurmH:APA91bGN-531a95CLkZfuZbXhdNRLHBvrelc5238up0boeQ2m9Yuk2syegdBgI8WdjpAlLc57LPvTUsoIqFbxkwragkb6G6l-lACJxo78uBmfbeZ6tzn894	android	\N	\N	\N	2025-05-02 22:20:40	2025-05-02 22:20:40	\N
8	Sabeeh Shah k	shahsabeeh@shah.com	971	154456	0	1	1	$2y$12$vAJSbyLIlsWmuNHSxG6w1eRl5/ynAVLDLRzgWkiDXyT5cdTQHBzri	2025-05-03 06:49:33	\N	Sabeeh Shah	k	\N	1111	1111	123123	android	\N	\N	\N	2025-05-03 06:49:33	2025-05-03 06:49:33	shahsabeeh
9	Asad nazir	abc@gmail.com	92	3441560003	0	1	1	$2y$12$Mn5lbyMu1Cs2eolA98zQYuQSNirvIUMvt9tVlrOkNr0TXoBcAMICe	2025-05-03 07:49:04	\N	Asad	nazir	\N	1111	1111	c92a6uSIQrySGTVCsCNUeQ:APA91bG493abIDm3Pjp5zSEtFCADNXZywKeI9SLWs8BWFfhD3d7NlXs9u6Zzvxl50Ehr0-Jwp-Za8gIbUGYTx-nQrsoxOO3zulyywKjVd8q5-er6JS-WJlI	android	\N	\N	\N	2025-05-03 07:49:04	2025-05-03 07:49:04	Asadz14
10	Sabeeh Shah k	asdf@gmail.com	971	03445566778	0	1	1	$2y$12$GvfeK9na.q2B/A16utbjM.yOQ/sXiSeRGH6Rl0cU2cC/KtsZ4HjN.	2025-05-03 07:58:54	\N	Sabeeh Shah	k	\N	1111	1111	123123	android	\N	\N	\N	2025-05-03 07:58:55	2025-05-03 07:58:55	Asdaz14
11	Sabeeh Shah k	shahsabeeh12@shah.com	971	15445666	0	1	1	$2y$12$ighRrPlTjm/JatvKrtQmN.NSlKOPV0yRnM9JJ1cyzd47qi9QJ1BFi	2025-05-03 08:12:22	\N	Sabeeh Shah	k	\N	1111	1111	123123	android	\N	\N	\N	2025-05-03 08:12:22	2025-05-03 08:12:22	shahsabeeh12
12	Sabeeh Shah k	asdfg@gmail.com	971	03445566775	0	1	1	$2y$12$kn9SDEhdcXIl2aQAIuh6eOMd.ae7oObgihnfMZydowFJPwCZof/x6	2025-05-03 08:14:35	\N	Sabeeh Shah	k	\N	1111	1111	123123	android	\N	\N	\N	2025-05-03 08:14:35	2025-05-03 08:14:35	Asdaz1415
13	Usama Shakeel	usama0@gmail.com	971	125125125	0	1	1	$2y$12$gNxyT6Sz5FpZVsjAuoGKrO0BvzqwNj5uVm3pr04SIdf4ZrJmQTR5q	2025-05-03 08:24:35	\N	Usama	Shakeel	\N	1111	1111	duBxhqvcTi2MAortG1qftf:APA91bFanEdS8wLaDeWRJkmhgk8zWL4x9eB58h9PrXvK7uSXfUXE38-ZeoYqhwsARlgDgxxUP1kUmmFxwwRpIkP9rzUdKTawTmZbVB03vhCOcSc5Y-GTf7g	android	\N	\N	\N	2025-05-03 08:24:35	2025-05-03 08:24:35	usama010
14	Ajmala Ajm	farsanaajmala@gmail.com	971	563869044	0	1	1	$2y$12$Gj7X4ipPjUxyo36GpmOokeym3y.HOxGAWcCMpaMQYeEfK/p6MvpRa	2025-05-03 13:09:26	\N	Ajmala	Ajm	\N	1111	1111	eWs6tXmkTna27uZKSPJ_jB:APA91bF3eVwLQNhtVLmLoJRoSt4M19uLKImx8u03GwRPZvA4VLROx4cQcoaNh2uRqJuj7JeUurajfgMnGvl-mGZb5G_IddP6kRyb4gSrQJKllV_HxVbGFYw	android	\N	\N	\N	2025-05-03 13:06:29	2025-05-03 13:09:26	Ajmala
15	hiba ejaz	hibadxba@hotmail.com	971	561660152	0	1	1	$2y$12$Rm0RX5jx78nyLlIn/n.1FO6mAinkxD5A/LIjSAOm4O64m8nBAjlua	2025-05-03 14:49:09	\N	hiba	ejaz	\N	1111	1111	frnWichNRn-JBSpOWjVXDb:APA91bHZgUitE4HMT2CpZfnTrVmKK7B8mIX_m9RWxwRr0-IJNBrUjnhGxutBrDbmf0-SShJhTxvNpaCXZExTn6hQNaTt8hw-zZiNaYNeqjMMckNfichAcUY	android	\N	\N	\N	2025-05-03 14:49:09	2025-05-03 14:49:09	hiba
16	anol navis	anil@dxbusinessgroup.com	963	123456789	0	1	1	$2y$12$.S0zwwRBKBmy0lXIXMoo6eSTP6/38Q6DWFJd2qf0KK49wACXFlcz.	2025-05-05 04:51:55	\N	anol	navis	\N	1111	1111	fR8RO4CcSce4ome5qz6Dyu:APA91bG-Slu1QWsPYrXBaPNF4_GdDDzmFIXmNdOaGa0zGDVN-04ZAgHzRrxVtW2WDL2RsQTz_3eeIjV0EH1tJ4KDQ3gaXVyKcKu1ILGhO8q1OwNB5_YOFEY	android	\N	\N	\N	2025-05-05 04:51:55	2025-05-05 04:51:55	anil007
17	Asad Nazir	asadpk@gmail.com	92	3445151554	0	1	1	$2y$12$n.2x7P/UL.1fkSH8ISYD1OMAIqDXtkTnjuCaMMqItqBybp9CxTdpm	2025-05-05 06:56:42	\N	Asad	Nazir	\N	1111	1111	cnqTDk0-Q028qWepIU15Yp:APA91bHID7reZBrjTiGFQ2qUPDNkcDWFKUmP8l9DaXpTxzDeZcrvwsqbeDHKs5mZsDQaQacYh-A_u1E3Pu67m7NRAIz150L8EcMif7dtRuOSmBy-o7wBCQM	android	\N	\N	\N	2025-05-05 06:56:43	2025-05-05 06:56:43	Asadz
18	sooraj sabu	sooraj.a2solution@gmail.com	91	9847823799	0	1	1	$2y$12$LrIWn35Lr4abAPLQA07Ecelpz0C5Co9bWg3PGO.Pm5gV1siAbmaY.	2025-05-06 07:29:36	\N	sooraj	sabu	\N	1111	1111	edEM-qqKRJ2DPeoYgB6L2N:APA91bELMR8oPeJL-v_XneJrHptz2QCH02KdRGqhAUbYJNZezXPwNzPIlsp_0IATKmoheElVPbRydCXsW8wluQL0i_X5Kk8WSX8khuNCqH7aKdIrWJGTktI	android	\N	\N	\N	2025-05-06 07:29:36	2025-05-06 07:29:36	sooraj.a2solution
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, first_name, last_name, dial_code, phone, country_id, emirates_id, city_id, company_id, status, deleted_at, role_id, qr_code, username, profile_picture, is_social, email_verified, phone_verified, user_email_otp, user_phone_otp, user_device_type, user_device_token, trade_license, user_access_token, firebase_user_key, password_reset_code, password_reset_time, password_reset_otp, bio) FROM stdin;
1	Admin User	admin@admin.com	\N	$2y$12$62KaM707H8nJg2LBzu0BE.tjeg7X25TzxjQFi1MnqBV0fOOrarhGG	\N	2025-03-09 21:04:34	2025-03-09 21:18:50	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	Christine Snow	tudohiqiv@mailinator.com	\N	$2y$12$m9UqfV5xzUE3VfAfaadpquGTUPDL9jM9m0m/mh3jqfMAnDakvQ3Zi	\N	2025-04-24 06:53:40	2025-04-24 07:09:33	Christine	Snow	\N	\N	1	\N	\N	\N	1	2025-04-24 07:09:33	\N	qrcodes/user_16.svg	vyrucaguh	profile_pictures/vvO8c2YLnFnPPxkUEqM3XXHAHrIe53G6gX5HBfy8.png	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	Hiba Ejaz	hiba@admin.com	\N	$2y$12$m5BAUk8B8PC80c2Jbs2CqufjytO8gFXSp.jafnUnbwJOPpRGQQcMW	\N	2025-04-15 12:27:30	2025-04-21 08:58:41	Hiba	Ejaz	\N	\N	1	\N	\N	\N	1	2025-04-21 08:58:41	\N	qrcodes/user_7.svg	\N	\N	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	Carissa2e Middleton	lomun@mailinator.com	\N	$2y$12$DRMV7ZYfawA8NLGD75oM8.wDdQL6giY8T1nxsxL8zZJ30M2syZe9i	\N	2025-03-09 22:37:26	2025-04-21 10:22:18	Carissa2e	Middleton	\N	\N	5	\N	\N	\N	1	\N	\N	qrcodes/user_6.svg	Carissa2e	\N	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	Armaan Malik	armaan@hotmail.com	\N	$2y$12$G4sqoSm1Yu07D4oqxqP26eGjsbfG.4tgq9luEl.owpTHXf5p7zlP.	\N	2025-04-22 12:28:42	2025-04-24 07:12:47	Armaan	Malik	\N	\N	1	\N	\N	\N	1	\N	\N	qrcodes/user_13.svg	armaan	profile_pictures/Ljlt8KFinvROz6zIdffEBivDgM8Smq4i9UECR5h0.jpg	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	Darius Whitaker	jazybugij@mailinator.com	\N	$2y$12$hMAlgJJG2wjnWRY0w8wDre1DOmNwbxdegNPb/J6Ewe0J4l4jUR.2O	\N	2025-03-09 22:37:08	2025-04-21 10:22:37	Darius	Whitaker	\N	\N	1	\N	\N	\N	1	\N	\N	qrcodes/user_5.svg	Darius	\N	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	Adele Brown	migyhul@mailinator.com	\N	$2y$12$aHhm0hVoCxsliqfbf0ybyedDS4nT8cQqxMKcpsSfyramrj0Zp8aG6	\N	2025-03-09 22:36:48	2025-04-21 10:22:52	Adele	Brown	\N	\N	1	\N	\N	\N	1	2025-04-21 10:22:52	\N	\N	\N	\N	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	Leena Metha	leena@hotmail.com	\N	$2y$12$Y7ZLV9Z.p9FwZ1Z0n.Q5wuMBrXg.yhQBZ2k2MN5ZVUI7FQ.8ulE46	\N	2025-04-22 12:48:37	2025-04-24 07:18:21	Leena	Metha	\N	\N	6	\N	\N	\N	1	\N	\N	qrcodes/user_14.svg	leenametha	profile_pictures/JlpAdZEr6EHIAt6AuTSi7dAyx0cO9BP5kr1wbXQg.jpg	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	Karina Gibson	fawag@mailinator.com	\N	$2y$12$BKx51HbQuilPQLr/pUBv9.eLZAy3Q649WI6sA9vcAzRh5yv3K7R0C	\N	2025-04-21 14:03:00	2025-04-22 12:26:36	Karina	Gibson	\N	\N	5	\N	\N	\N	0	2025-04-22 12:26:36	\N	qrcodes/user_11.svg	timudesul	profile_pictures/PjtdNbj90rBqXRR2rkcwcJoiAmmTInT1uxESL9hw.png	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	Chester Valenzuela	cowytavo@mailinator.com	\N	$2y$12$ekwsnsutkfx/algSnUG2bOJMrYL/TP8s3koRDJ7sYwRT3DDO3CeMK	\N	2025-03-09 22:36:59	2025-04-22 12:26:47	Chester	Valenzuela	\N	\N	1	\N	\N	\N	1	2025-04-22 12:26:47	\N	\N	\N	\N	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	Charissa Ross	sajyfu@mailinator.com	\N	$2y$12$Rez1W0F2KwEs/qJpRHaQiOHMX95soah95q5hp/wuYvLSqwhR1G9M.	\N	2025-03-09 21:07:03	2025-04-22 12:26:53	Charissa	Ross	\N	\N	1	\N	\N	\N	1	2025-04-22 12:26:53	\N	\N	\N	\N	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	John David	john@gmail.com	\N	$2y$12$SPKPKTWfuT/z9bXg3XRlDeYujjTGmioqTw8/Lq7lT102p0idq6DGG	\N	2025-04-22 12:27:49	2025-04-22 12:27:49	John	David	\N	\N	1	\N	\N	\N	1	\N	\N	qrcodes/user_12.svg	johndavid	\N	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	Sabeeh Shah k	shahsabeeh@shah.com	2025-05-03 06:49:55	$2y$12$vAJSbyLIlsWmuNHSxG6w1eRl5/ynAVLDLRzgWkiDXyT5cdTQHBzri	\N	2025-05-03 06:49:55	2025-05-03 06:50:47	Sabeeh Shah	k	971	154456	\N	\N	\N	\N	1	\N	2	\N	shahsabeeh	\N	0	1	1		1111	android	123123	\N	131e069933cc2aed12071e42f94cc7b5c0f4fafce666b526d362b3c1016edf2b	-OPJu98_zdhO7bLqfnK3	\N	\N	\N	\N
15	Doejohnna Halk	doe@gmail.com	\N	$2y$12$l2O3jZdtZYXy5WQwSWYYoewKp75AarEAnyp7AY1nmqJGlJStTWVme	\N	2025-04-22 13:11:54	2025-04-29 01:12:29	Doejohnna	Halk	\N	\N	1	\N	\N	\N	1	\N	\N	qrcodes/user_15.svg	doe	profile_pictures/ia82lHsDdbbgS3CNtoeso6gK7ZUWYrSr3oSd0qSO.jpg	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	Asad nazir	abd@gmail.com	2025-05-02 16:41:03	$2y$12$mClr4cp2OMbsRRBR1PKuzO3rEAk.2lV9yNXjzUuosuIB6VrRh2EAW	\N	2025-05-02 16:41:03	2025-05-02 16:41:04	Asad	nazir	92	3445566885	\N	\N	\N	\N	1	\N	2	\N	\N	\N	0	1	1			android	cVX2pRAaSpiJLbandchG8e:APA91bHNT93wERe_PPneVxIANeOwPPD8YFd9ZhXG-YJj9hINAPsfBTPwqRCfyGY7NoNny8ep-FcgfW_o0qv4doqTndye_9NLi-D2iPHRM4UUcSpkqaP2Iks	\N	873b714f94d549ed78e39ab35b72dfedd7de56e2df7f444f6cbe63c097d03552	-OPGrrbgZFCvXA2rSR_W	\N	\N	\N	\N
19	Sabeeh Shah k	sabeeh1@shah.com	2025-05-02 00:00:07	$2y$12$fAbX9KNxfD52KLMgHuiRgOJNQBOBMKM/LVZLzf2Mg6f6UnBWvm.Nu	\N	2025-05-02 00:00:07	2025-05-02 00:00:08	Sabeeh Shah	k	971	1234	\N	\N	\N	\N	1	\N	2	\N	\N	\N	0	1	1			android	123123	\N	a98a00eb9de3194ddf3373ae2999cd405f6909567afd7488297a8c0fee00df7f	-OPDHlWrtQLhJ6906EsJ	\N	\N	\N	\N
18	Usama Shakeel	ushakeel@gmail.com	2025-05-01 11:30:37	$2y$12$JY52r3YrIDJRlESRUNisqOGUBG5yvjOY2vDSbDgRNY.COyFFz37r6	\N	2025-05-01 11:30:37	2025-05-03 06:16:53	Usama	Shakeel	971	123123123	\N	\N	\N	\N	1	\N	2	\N	\N	\N	0	1	1		1111	android	123123	\N	b967a6af372452a70155fd25930c4e51a2c424eeef35d4f1f15d4bdf9feffe0b	-OPAbDNzy9HUzEXRF75V	\N	\N	\N	\N
20	Asad nazir	abs@gmail.com	2025-05-02 16:39:45	$2y$12$sWemLaUIJlyMDiW/2L4/mOtHkyK0idC2WbyIwLlGYoluVr8lLYOlW	\N	2025-05-02 16:39:45	2025-05-02 16:39:45	Asad	nazir	92	3445566886	\N	\N	\N	\N	1	\N	2	\N	\N	\N	0	1	1			android	cVX2pRAaSpiJLbandchG8e:APA91bHNT93wERe_PPneVxIANeOwPPD8YFd9ZhXG-YJj9hINAPsfBTPwqRCfyGY7NoNny8ep-FcgfW_o0qv4doqTndye_9NLi-D2iPHRM4UUcSpkqaP2Iks	\N	247df0d2e8c88588d403f2cc0ecd169273c565f8772f87f2e367c66ff8833df8	-OPGrZULZ3ttmCNvxAlG	\N	\N	\N	\N
17	Sabeeh Shah k	sabeeh@shah.com	2025-04-30 19:04:09	$2y$12$1I7ePAA/C0BFqLudic0LSOVz/Y8yYq8EAMW75Q4ncWaL4CYGmKafO	\N	2025-04-30 18:35:08	2025-05-03 15:28:16	Sabeeh Shah	k	971	1	\N	\N	\N	\N	1	\N	2	\N	\N	\N	0	1	1		1111	android	123123	\N	0988ffacf45d816cd473039cd32da9c02d04d444aa2bf8d0f70cd289244bebc0	-OP749E7BWZk8sJ9QJer		2025-05-03 15:27:13	0	\N
22	Asad Nazir	asad@gmail.com	2025-05-02 22:20:46	$2y$12$gd81hgVrYIYN.dNjRFFXF.jVisiAU2porKS5J2OdIJ8Ez234RPwH6	\N	2025-05-02 22:20:46	2025-05-03 17:31:27	Asad	Nazir	92	3441566086	\N	\N	\N	\N	1	\N	2	\N	\N	\N	0	1	1		1111	android	c_dCsluuQbmh-4ARvPurmH:APA91bGN-531a95CLkZfuZbXhdNRLHBvrelc5238up0boeQ2m9Yuk2syegdBgI8WdjpAlLc57LPvTUsoIqFbxkwragkb6G6l-lACJxo78uBmfbeZ6tzn894	\N	30eafa0b732ec5b438854d3f0e22ae676b79ff1f8f302a4765395008a21e50ca	-OPI4bxonScpzS7gTwTV		2025-05-03 17:30:58	0	\N
25	Sabeeh Shah k	asdf@gmail.com	2025-05-03 07:59:26	$2y$12$GvfeK9na.q2B/A16utbjM.yOQ/sXiSeRGH6Rl0cU2cC/KtsZ4HjN.	\N	2025-05-03 07:59:26	2025-05-03 07:59:27	Sabeeh Shah	k	971	03445566778	\N	\N	\N	\N	1	\N	2	\N	Asdaz14	\N	0	1	1			android	123123	\N	6bd24ca988cb1e7cb600f4b72d9b564d6ed568f1bcab7e2f7b499b6872242bb2	-OPK93ScELiUgdwfb4o-	\N	\N	\N	\N
26	Sabeeh Shah k	shahsabeeh12@shah.com	2025-05-03 08:12:38	$2y$12$ighRrPlTjm/JatvKrtQmN.NSlKOPV0yRnM9JJ1cyzd47qi9QJ1BFi	\N	2025-05-03 08:12:38	2025-05-05 09:17:58	ABCD	sam	971	15445666	1	\N	\N	\N	1	\N	2	\N	shahsabeeh12	\N	0	1	1		1111	android	123123	\N	e424d3a8c6a1328f054387d6ea0818600b32b146a35feb7fad4d7e6508020b8e	-OPKC4r03BsFni76Yhvc	\N	\N	\N	user info
27	Sabeeh Shah k	asdfg@gmail.com	2025-05-03 08:14:53	$2y$12$kn9SDEhdcXIl2aQAIuh6eOMd.ae7oObgihnfMZydowFJPwCZof/x6	\N	2025-05-03 08:14:53	2025-05-05 08:16:27	Sabeeh Shah	k	971	03445566775	\N	\N	\N	\N	1	\N	2	\N	Asdaz1415	\N	0	1	1		1111	android	123123	\N	bbc40ae0ca7dabc35e9a8d5c139e04c68eda8a8ebf78e3ee9c807819661c5c0b	-OPKCaeI4U-no2dAILKu	\N	\N	\N	\N
24	Asad nazir	abc@gmail.com	2025-05-03 07:49:11	$2y$12$Mn5lbyMu1Cs2eolA98zQYuQSNirvIUMvt9tVlrOkNr0TXoBcAMICe	\N	2025-05-03 07:49:11	2025-05-05 08:04:47	Asad	nazir	92	3441560003	\N	\N	\N	\N	1	\N	2	\N	Asadz14	\N	0	1	1		1111	android	c92a6uSIQrySGTVCsCNUeQ:APA91bG493abIDm3Pjp5zSEtFCADNXZywKeI9SLWs8BWFfhD3d7NlXs9u6Zzvxl50Ehr0-Jwp-Za8gIbUGYTx-nQrsoxOO3zulyywKjVd8q5-er6JS-WJlI	\N	83f16be80aff1e1706869c7dc33c774dcc188bdd454fefdb138315732f233449	-OPK6iIcysoLvJSJeNpH	\N	\N	\N	\N
30	hiba ejaz	hibadxba@hotmail.com	2025-05-03 14:49:13	$2y$12$Rm0RX5jx78nyLlIn/n.1FO6mAinkxD5A/LIjSAOm4O64m8nBAjlua	\N	2025-05-03 14:49:13	2025-05-03 14:49:14	hiba	ejaz	971	561660152	\N	\N	\N	\N	1	\N	2	\N	hiba	\N	0	1	1			android	frnWichNRn-JBSpOWjVXDb:APA91bHZgUitE4HMT2CpZfnTrVmKK7B8mIX_m9RWxwRr0-IJNBrUjnhGxutBrDbmf0-SShJhTxvNpaCXZExTn6hQNaTt8hw-zZiNaYNeqjMMckNfichAcUY	\N	46aaedcafbf8437cbf4c708dcd7fa859641d2a8f7b7fbc0a09b1658d3f14cd36	-OPLbrBNwzsG44cHmuim	\N	\N	\N	\N
31	anol navis	anil@dxbusinessgroup.com	2025-05-05 04:52:04	$2y$12$.S0zwwRBKBmy0lXIXMoo6eSTP6/38Q6DWFJd2qf0KK49wACXFlcz.	\N	2025-05-05 04:52:04	2025-05-05 04:52:04	anol	navis	963	123456789	\N	\N	\N	\N	1	\N	2	\N	anil007	\N	0	1	1			android	fR8RO4CcSce4ome5qz6Dyu:APA91bG-Slu1QWsPYrXBaPNF4_GdDDzmFIXmNdOaGa0zGDVN-04ZAgHzRrxVtW2WDL2RsQTz_3eeIjV0EH1tJ4KDQ3gaXVyKcKu1ILGhO8q1OwNB5_YOFEY	\N	a1b2d20a135a9da4a1b1afaf9590d778525ec1b8a9638ca9b958c62470037de9	-OPTmMEyAfWh4GTyU9iy	\N	\N	\N	\N
32	Asad Nazir	asadpk@gmail.com	2025-05-05 06:56:47	$2y$12$n.2x7P/UL.1fkSH8ISYD1OMAIqDXtkTnjuCaMMqItqBybp9CxTdpm	\N	2025-05-05 06:56:47	2025-05-05 06:56:48	Asad	Nazir	92	3445151554	\N	\N	\N	\N	1	\N	2	\N	Asadz	\N	0	1	1			android	cnqTDk0-Q028qWepIU15Yp:APA91bHID7reZBrjTiGFQ2qUPDNkcDWFKUmP8l9DaXpTxzDeZcrvwsqbeDHKs5mZsDQaQacYh-A_u1E3Pu67m7NRAIz150L8EcMif7dtRuOSmBy-o7wBCQM	\N	1045d74ecab7db742dcfb7e083fb858477d9c74a71ff77f7b7cce422dbed4153	-OPUDuDj58BrfiHIe7aA	\N	\N	\N	\N
28	Usama Shakeel	usama0@gmail.com	2025-05-03 08:24:39	$2y$12$gNxyT6Sz5FpZVsjAuoGKrO0BvzqwNj5uVm3pr04SIdf4ZrJmQTR5q	\N	2025-05-03 08:24:39	2025-05-05 07:52:54	Usama	Shakeel	971	125125125	\N	\N	\N	\N	1	\N	2	\N	usama010	\N	0	1	1		1111	android	duBxhqvcTi2MAortG1qftf:APA91bFanEdS8wLaDeWRJkmhgk8zWL4x9eB58h9PrXvK7uSXfUXE38-ZeoYqhwsARlgDgxxUP1kUmmFxwwRpIkP9rzUdKTawTmZbVB03vhCOcSc5Y-GTf7g	\N	73192e6075d6e9f71ccab0fcec3c76e1f1e8a965ed48c574afe040b6ef111afc	-OPKEphOfqYQSM33UkDt	\N	\N	\N	\N
29	Ajmala Ajm	farsanaajmala@gmail.com	2025-05-03 13:09:31	$2y$12$Gj7X4ipPjUxyo36GpmOokeym3y.HOxGAWcCMpaMQYeEfK/p6MvpRa	\N	2025-05-03 13:09:31	2025-05-04 08:10:20	Ajmala	Ajm	971	563869044	\N	\N	\N	\N	1	\N	2	\N	Ajmala	\N	0	1	1		1111	android	eWs6tXmkTna27uZKSPJ_jB:APA91bF3eVwLQNhtVLmLoJRoSt4M19uLKImx8u03GwRPZvA4VLROx4cQcoaNh2uRqJuj7JeUurajfgMnGvl-mGZb5G_IddP6kRyb4gSrQJKllV_HxVbGFYw	\N	201933d8ff64ec5e51d7ddf71bb6291bfd6b8c7f0aacae8abe8203d29d8530ad	-OPLG1eXlTdlNNBKv-1S	\N	\N	\N	\N
33	sooraj sabu	sooraj.a2solution@gmail.com	2025-05-06 07:29:41	$2y$12$LrIWn35Lr4abAPLQA07Ecelpz0C5Co9bWg3PGO.Pm5gV1siAbmaY.	\N	2025-05-06 07:29:41	2025-05-06 07:29:42	sooraj	sabu	91	9847823799	\N	\N	\N	\N	1	\N	2	\N	sooraj.a2solution	\N	0	1	1			android	edEM-qqKRJ2DPeoYgB6L2N:APA91bELMR8oPeJL-v_XneJrHptz2QCH02KdRGqhAUbYJNZezXPwNzPIlsp_0IATKmoheElVPbRydCXsW8wluQL0i_X5Kk8WSX8khuNCqH7aKdIrWJGTktI	\N	529806caff817d301f918e53684ed28cbd57cb14073cd0f30c0c38cf64f51374	-OPZV0w5JrJSdkQzLg5_	\N	\N	\N	\N
\.


--
-- Name: activity_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_log_id_seq', 219, true);


--
-- Name: challenges_companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.challenges_companies_id_seq', 1, false);


--
-- Name: challenges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.challenges_id_seq', 1, false);


--
-- Name: checklists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.checklists_id_seq', 14, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 24, true);


--
-- Name: cms_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cms_pages_id_seq', 3, true);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_id_seq', 1, false);


--
-- Name: cost_breakdown_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cost_breakdown_items_id_seq', 18, true);


--
-- Name: cost_breakdowns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cost_breakdowns_id_seq', 7, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 200, true);


--
-- Name: emirates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.emirates_id_seq', 12, true);


--
-- Name: est_person_cost_journeys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.est_person_cost_journeys_id_seq', 2, true);


--
-- Name: event_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_types_id_seq', 1, false);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 1, false);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: faqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faqs_id_seq', 1, true);


--
-- Name: followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.followers_id_seq', 2, true);


--
-- Name: itineraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.itineraries_id_seq', 89, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: journey_participants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journey_participants_id_seq', 21, true);


--
-- Name: journeys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journeys_id_seq', 12, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 76, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 1, true);


--
-- Name: packages_addons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.packages_addons_id_seq', 1, false);


--
-- Name: packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.packages_id_seq', 1, false);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 1, false);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 115, true);


--
-- Name: personals_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personals_access_tokens_id_seq', 1, false);


--
-- Name: poll_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.poll_options_id_seq', 1, false);


--
-- Name: polls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.polls_id_seq', 1, false);


--
-- Name: post_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_comments_id_seq', 6, true);


--
-- Name: post_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_likes_id_seq', 3, true);


--
-- Name: post_shares_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_shares_id_seq', 3, true);


--
-- Name: post_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_types_id_seq', 3, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 64, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- Name: target_types_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.target_types_company_id_seq', 1, false);


--
-- Name: target_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.target_types_id_seq', 1, false);


--
-- Name: temp_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_users_id_seq', 18, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 33, true);


--
-- Name: activity_log activity_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_log
    ADD CONSTRAINT activity_log_pkey PRIMARY KEY (id);


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
-- Name: checklists checklists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checklists
    ADD CONSTRAINT checklists_pkey PRIMARY KEY (id);


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
-- Name: cost_breakdown_items cost_breakdown_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_breakdown_items
    ADD CONSTRAINT cost_breakdown_items_pkey PRIMARY KEY (id);


--
-- Name: cost_breakdowns cost_breakdowns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_breakdowns
    ADD CONSTRAINT cost_breakdowns_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: emirates emirates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emirates
    ADD CONSTRAINT emirates_pkey PRIMARY KEY (id);


--
-- Name: est_person_cost_journeys est_person_cost_journeys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.est_person_cost_journeys
    ADD CONSTRAINT est_person_cost_journeys_pkey PRIMARY KEY (id);


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
-- Name: followers followers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_pkey PRIMARY KEY (id);


--
-- Name: itineraries itineraries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itineraries
    ADD CONSTRAINT itineraries_pkey PRIMARY KEY (id);


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
-- Name: journey_participants journey_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journey_participants
    ADD CONSTRAINT journey_participants_pkey PRIMARY KEY (id);


--
-- Name: journeys journeys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journeys
    ADD CONSTRAINT journeys_pkey PRIMARY KEY (id);


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
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


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
-- Name: personals_access_tokens personals_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personals_access_tokens
    ADD CONSTRAINT personals_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personals_access_tokens personals_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personals_access_tokens
    ADD CONSTRAINT personals_access_tokens_token_unique UNIQUE (token);


--
-- Name: poll_options poll_options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poll_options
    ADD CONSTRAINT poll_options_pkey PRIMARY KEY (id);


--
-- Name: polls polls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls
    ADD CONSTRAINT polls_pkey PRIMARY KEY (id);


--
-- Name: post_comments post_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT post_comments_pkey PRIMARY KEY (id);


--
-- Name: post_likes post_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_likes
    ADD CONSTRAINT post_likes_pkey PRIMARY KEY (id);


--
-- Name: post_shares post_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_shares
    ADD CONSTRAINT post_shares_pkey PRIMARY KEY (id);


--
-- Name: post_types post_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_types
    ADD CONSTRAINT post_types_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: posts posts_post_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_post_id_unique UNIQUE (post_id);


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
-- Name: temp_users temp_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users
    ADD CONSTRAINT temp_users_pkey PRIMARY KEY (id);


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
-- Name: activity_log_log_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activity_log_log_name_index ON public.activity_log USING btree (log_name);


--
-- Name: causer; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX causer ON public.activity_log USING btree (causer_type, causer_id);


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
-- Name: personals_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personals_access_tokens_tokenable_type_tokenable_id_index ON public.personals_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: subject; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX subject ON public.activity_log USING btree (subject_type, subject_id);


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
-- Name: poll_options poll_options_poll_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poll_options
    ADD CONSTRAINT poll_options_poll_id_foreign FOREIGN KEY (poll_id) REFERENCES public.polls(id) ON DELETE CASCADE;


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

