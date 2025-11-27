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
-- Name: block_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.block_users (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    blocked_user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    remark text
);


ALTER TABLE public.block_users OWNER TO postgres;

--
-- Name: block_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.block_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.block_users_id_seq OWNER TO postgres;

--
-- Name: block_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.block_users_id_seq OWNED BY public.block_users.id;


--
-- Name: bookmarks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookmarks (
    id bigint NOT NULL,
    user_id bigint,
    journey_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.bookmarks OWNER TO postgres;

--
-- Name: bookmarks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bookmarks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bookmarks_id_seq OWNER TO postgres;

--
-- Name: bookmarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bookmarks_id_seq OWNED BY public.bookmarks.id;


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
-- Name: contact_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_details (
    id bigint NOT NULL,
    name character varying(255),
    value character varying(255),
    icon character varying(255),
    status integer DEFAULT 1,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.contact_details OWNER TO postgres;

--
-- Name: contact_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_details_id_seq OWNER TO postgres;

--
-- Name: contact_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_details_id_seq OWNED BY public.contact_details.id;


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
    dial_code character varying(255),
    flag character varying(255),
    description text
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
-- Name: follows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.follows (
    id bigint NOT NULL,
    follower_id bigint NOT NULL,
    followed_id bigint NOT NULL,
    status character varying(255) DEFAULT 'pending'::character varying NOT NULL,
    requested_at timestamp(0) without time zone,
    responded_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.follows OWNER TO postgres;

--
-- Name: COLUMN follows.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.follows.status IS 'pending, approved, rejected';


--
-- Name: follows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.follows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.follows_id_seq OWNER TO postgres;

--
-- Name: follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.follows_id_seq OWNED BY public.follows.id;


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
    updated_at timestamp(0) without time zone,
    is_approved integer DEFAULT 1 NOT NULL,
    is_owner integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.journey_participants OWNER TO postgres;

--
-- Name: COLUMN journey_participants.is_approved; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.journey_participants.is_approved IS '1-approved,0-rejected';


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
    small_description text,
    file_name text,
    country_id integer DEFAULT 0 NOT NULL
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
-- Name: marked_check_lists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marked_check_lists (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    journey_id integer NOT NULL,
    check_list_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.marked_check_lists OWNER TO postgres;

--
-- Name: marked_check_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.marked_check_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marked_check_lists_id_seq OWNER TO postgres;

--
-- Name: marked_check_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.marked_check_lists_id_seq OWNED BY public.marked_check_lists.id;


--
-- Name: media_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media_files (
    id bigint NOT NULL,
    media_id integer NOT NULL,
    file_name character varying(255) NOT NULL,
    height character varying(255),
    width character varying(255),
    extension character varying(255),
    duration character varying(255),
    thumb_image text,
    have_hls_url integer DEFAULT 0 NOT NULL,
    hls_url text,
    hls_cdn_url text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.media_files OWNER TO postgres;

--
-- Name: media_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_files_id_seq OWNER TO postgres;

--
-- Name: media_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.media_files_id_seq OWNED BY public.media_files.id;


--
-- Name: medias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medias (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    title text,
    destination text,
    country_id integer DEFAULT 0 NOT NULL,
    date date,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.medias OWNER TO postgres;

--
-- Name: medias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medias_id_seq OWNER TO postgres;

--
-- Name: medias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medias_id_seq OWNED BY public.medias.id;


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
-- Name: poll_votes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.poll_votes (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL,
    option_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.poll_votes OWNER TO postgres;

--
-- Name: poll_votes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.poll_votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.poll_votes_id_seq OWNER TO postgres;

--
-- Name: poll_votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.poll_votes_id_seq OWNED BY public.poll_votes.id;


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
-- Name: post_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_files (
    id bigint NOT NULL,
    post_id integer NOT NULL,
    height character varying(255),
    width character varying(255),
    extension character varying(255),
    is_default integer DEFAULT 0 NOT NULL,
    url text,
    duration character varying(255),
    thumb_image text,
    have_hls_url integer DEFAULT 0 NOT NULL,
    hls_url text,
    hls_cdn_url text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.post_files OWNER TO postgres;

--
-- Name: post_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_files_id_seq OWNER TO postgres;

--
-- Name: post_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_files_id_seq OWNED BY public.post_files.id;


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
-- Name: post_poll_options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_poll_options (
    id bigint NOT NULL,
    post_id integer NOT NULL,
    option text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.post_poll_options OWNER TO postgres;

--
-- Name: post_poll_options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_poll_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_poll_options_id_seq OWNER TO postgres;

--
-- Name: post_poll_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_poll_options_id_seq OWNED BY public.post_poll_options.id;


--
-- Name: post_reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_reports (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    reported_post_id integer NOT NULL,
    report_reason text,
    remark text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.post_reports OWNER TO postgres;

--
-- Name: post_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_reports_id_seq OWNER TO postgres;

--
-- Name: post_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_reports_id_seq OWNED BY public.post_reports.id;


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
    post_id character varying(255),
    deleted_at timestamp(0) without time zone
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
-- Name: push_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.push_requests (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    title character varying(255) NOT NULL,
    body text,
    data text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    chat_type character varying(255)
);


ALTER TABLE public.push_requests OWNER TO postgres;

--
-- Name: push_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.push_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.push_requests_id_seq OWNER TO postgres;

--
-- Name: push_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.push_requests_id_seq OWNED BY public.push_requests.id;


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
    support_email character varying(255) DEFAULT 'help@travelblzr.com'::character varying NOT NULL,
    instagream character varying(255) DEFAULT '@travelblzr'::character varying NOT NULL,
    twitter character varying(255) DEFAULT '@travelblzr'::character varying NOT NULL,
    facebook character varying(255) DEFAULT '@travelblzr'::character varying NOT NULL,
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
-- Name: temp_check_lists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_check_lists (
    id bigint NOT NULL,
    temp_id integer NOT NULL,
    description character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.temp_check_lists OWNER TO postgres;

--
-- Name: temp_check_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_check_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_check_lists_id_seq OWNER TO postgres;

--
-- Name: temp_check_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_check_lists_id_seq OWNED BY public.temp_check_lists.id;


--
-- Name: temp_cost_break_downs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_cost_break_downs (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.temp_cost_break_downs OWNER TO postgres;

--
-- Name: temp_cost_break_downs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_cost_break_downs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_cost_break_downs_id_seq OWNER TO postgres;

--
-- Name: temp_cost_break_downs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_cost_break_downs_id_seq OWNED BY public.temp_cost_break_downs.id;


--
-- Name: temp_itineraries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_itineraries (
    id bigint NOT NULL,
    temp_id integer NOT NULL,
    day_number integer NOT NULL,
    date date NOT NULL,
    time_from time(0) without time zone,
    time_to time(0) without time zone,
    description character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.temp_itineraries OWNER TO postgres;

--
-- Name: temp_itineraries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_itineraries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_itineraries_id_seq OWNER TO postgres;

--
-- Name: temp_itineraries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_itineraries_id_seq OWNED BY public.temp_itineraries.id;


--
-- Name: temp_journeys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_journeys (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    file_name text,
    title character varying(255) NOT NULL,
    destination character varying(255),
    accomodation character varying(255),
    destination_url character varying(255),
    small_description text,
    map_link text,
    start_date date NOT NULL,
    end_date date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    country_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.temp_journeys OWNER TO postgres;

--
-- Name: temp_journeys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_journeys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_journeys_id_seq OWNER TO postgres;

--
-- Name: temp_journeys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_journeys_id_seq OWNED BY public.temp_journeys.id;


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
    username text,
    country_id integer DEFAULT 0 NOT NULL
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
-- Name: user_activities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_activities (
    id bigint NOT NULL,
    user_id bigint,
    action character varying(255) NOT NULL,
    description text,
    ip_address character varying(255),
    user_agent character varying(255),
    model_type character varying(255),
    model_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    meta_data text
);


ALTER TABLE public.user_activities OWNER TO postgres;

--
-- Name: user_activities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_activities_id_seq OWNER TO postgres;

--
-- Name: user_activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_activities_id_seq OWNED BY public.user_activities.id;


--
-- Name: user_loged_devices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_loged_devices (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    token character varying(255),
    device_name character varying(255),
    last_used_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_loged_devices OWNER TO postgres;

--
-- Name: user_loged_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_loged_devices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_loged_devices_id_seq OWNER TO postgres;

--
-- Name: user_loged_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_loged_devices_id_seq OWNED BY public.user_loged_devices.id;


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
    bio text,
    last_ping_timestamp character varying(255),
    deleted integer DEFAULT 0 NOT NULL,
    is_private integer DEFAULT 0 NOT NULL,
    notify_group_message_email boolean DEFAULT true NOT NULL,
    notify_group_message_push boolean DEFAULT true NOT NULL,
    notify_message_email boolean DEFAULT true NOT NULL,
    notify_message_push boolean DEFAULT true NOT NULL,
    notify_friend_request_email boolean DEFAULT true NOT NULL,
    notify_friend_request_push boolean DEFAULT true NOT NULL,
    biometric_token character varying(255)
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
-- Name: block_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.block_users ALTER COLUMN id SET DEFAULT nextval('public.block_users_id_seq'::regclass);


--
-- Name: bookmarks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks ALTER COLUMN id SET DEFAULT nextval('public.bookmarks_id_seq'::regclass);


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
-- Name: contact_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_details ALTER COLUMN id SET DEFAULT nextval('public.contact_details_id_seq'::regclass);


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
-- Name: follows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follows ALTER COLUMN id SET DEFAULT nextval('public.follows_id_seq'::regclass);


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
-- Name: marked_check_lists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marked_check_lists ALTER COLUMN id SET DEFAULT nextval('public.marked_check_lists_id_seq'::regclass);


--
-- Name: media_files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_files ALTER COLUMN id SET DEFAULT nextval('public.media_files_id_seq'::regclass);


--
-- Name: medias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medias ALTER COLUMN id SET DEFAULT nextval('public.medias_id_seq'::regclass);


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
-- Name: poll_votes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poll_votes ALTER COLUMN id SET DEFAULT nextval('public.poll_votes_id_seq'::regclass);


--
-- Name: polls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls ALTER COLUMN id SET DEFAULT nextval('public.polls_id_seq'::regclass);


--
-- Name: post_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments ALTER COLUMN id SET DEFAULT nextval('public.post_comments_id_seq'::regclass);


--
-- Name: post_files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_files ALTER COLUMN id SET DEFAULT nextval('public.post_files_id_seq'::regclass);


--
-- Name: post_likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_likes ALTER COLUMN id SET DEFAULT nextval('public.post_likes_id_seq'::regclass);


--
-- Name: post_poll_options id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_poll_options ALTER COLUMN id SET DEFAULT nextval('public.post_poll_options_id_seq'::regclass);


--
-- Name: post_reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_reports ALTER COLUMN id SET DEFAULT nextval('public.post_reports_id_seq'::regclass);


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
-- Name: push_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_requests ALTER COLUMN id SET DEFAULT nextval('public.push_requests_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: target_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_types ALTER COLUMN id SET DEFAULT nextval('public.target_types_id_seq'::regclass);


--
-- Name: target_types_company id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_types_company ALTER COLUMN id SET DEFAULT nextval('public.target_types_company_id_seq'::regclass);


--
-- Name: temp_check_lists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_check_lists ALTER COLUMN id SET DEFAULT nextval('public.temp_check_lists_id_seq'::regclass);


--
-- Name: temp_cost_break_downs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_cost_break_downs ALTER COLUMN id SET DEFAULT nextval('public.temp_cost_break_downs_id_seq'::regclass);


--
-- Name: temp_itineraries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_itineraries ALTER COLUMN id SET DEFAULT nextval('public.temp_itineraries_id_seq'::regclass);


--
-- Name: temp_journeys id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_journeys ALTER COLUMN id SET DEFAULT nextval('public.temp_journeys_id_seq'::regclass);


--
-- Name: temp_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users ALTER COLUMN id SET DEFAULT nextval('public.temp_users_id_seq'::regclass);


--
-- Name: user_activities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activities ALTER COLUMN id SET DEFAULT nextval('public.user_activities_id_seq'::regclass);


--
-- Name: user_loged_devices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_loged_devices ALTER COLUMN id SET DEFAULT nextval('public.user_loged_devices_id_seq'::regclass);


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
220	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"ip":"103.137.24.81","description":"User updated"}	2025-05-06 08:08:09	2025-05-06 08:08:09	updated	\N
221	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"ip":"103.137.24.177","description":"User updated"}	2025-05-06 08:13:11	2025-05-06 08:13:11	updated	\N
222	user	User updated	App\\Models\\User	33	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj.a2solution@gmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj.a2solution@gmail.com","status":1},"ip":"59.98.219.141","description":"User updated"}	2025-05-06 09:33:53	2025-05-06 09:33:53	updated	\N
223	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"ABCD","last_name":"sam","email":"asdfg@gmail.com","status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":"asdfg@gmail.com","status":1},"ip":"103.137.24.126","description":"User updated"}	2025-05-06 11:06:20	2025-05-06 11:06:20	updated	\N
224	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"ABCD","last_name":"sam","email":"asdfg@gmail.com","status":1},"old":{"first_name":"ABCD","last_name":"sam","email":"asdfg@gmail.com","status":1},"ip":"103.137.24.126","description":"User updated"}	2025-05-06 11:07:06	2025-05-06 11:07:06	updated	\N
225	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"ABCD","last_name":"sam","email":"asdfg@gmail.com","status":1},"old":{"first_name":"ABCD","last_name":"sam","email":"asdfg@gmail.com","status":1},"ip":"103.137.24.26","description":"User updated"}	2025-05-06 11:15:40	2025-05-06 11:15:40	updated	\N
226	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"ABCD","last_name":"sam","email":"asdfg@gmail.com","status":1},"old":{"first_name":"ABCD","last_name":"sam","email":"asdfg@gmail.com","status":1},"ip":"103.137.24.26","description":"User updated"}	2025-05-06 11:17:34	2025-05-06 11:17:34	updated	\N
227	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"ABCD","last_name":"sam","email":"asdfg@gmail.com","status":1},"old":{"first_name":"ABCD","last_name":"sam","email":"asdfg@gmail.com","status":1},"ip":"103.137.24.158","description":"User updated"}	2025-05-06 11:21:49	2025-05-06 11:21:49	updated	\N
228	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"ABCD","last_name":"sam","email":"asdfg@gmail.com","status":1},"old":{"first_name":"ABCD","last_name":"sam","email":"asdfg@gmail.com","status":1},"ip":"103.137.24.1","description":"User updated"}	2025-05-06 11:27:38	2025-05-06 11:27:38	updated	\N
229	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"Asaf","last_name":"sam","email":"asdfg@gmail.com","status":1},"old":{"first_name":"ABCD","last_name":"sam","email":"asdfg@gmail.com","status":1},"ip":"103.137.24.107","description":"User updated"}	2025-05-06 12:00:37	2025-05-06 12:00:37	updated	\N
230	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"Asaf","last_name":"sam","email":"asdfg@gmail.com","status":1},"old":{"first_name":"Asaf","last_name":"sam","email":"asdfg@gmail.com","status":1},"ip":"103.137.24.126","description":"User updated"}	2025-05-06 12:19:03	2025-05-06 12:19:03	updated	\N
231	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"Asaf","last_name":"sam","email":"asdfg@gmail.com","status":1},"old":{"first_name":"Asaf","last_name":"sam","email":"asdfg@gmail.com","status":1},"ip":"103.137.24.26","description":"User updated"}	2025-05-06 12:21:43	2025-05-06 12:21:43	updated	\N
232	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"Asad","last_name":"sam","email":"asdfg@gmail.com","status":1},"old":{"first_name":"Asaf","last_name":"sam","email":"asdfg@gmail.com","status":1},"ip":"103.137.24.158","description":"User updated"}	2025-05-06 12:23:38	2025-05-06 12:23:38	updated	\N
233	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"Asad","last_name":"sam","email":"asdfg@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"sam","email":"asdfg@gmail.com","status":1},"ip":"103.137.24.126","description":"User updated"}	2025-05-06 12:26:46	2025-05-06 12:26:46	updated	\N
234	user	User updated	App\\Models\\User	27	\N	\N	{"attributes":{"first_name":"Asad","last_name":"sam","email":"asdfg@gmail.com","status":1},"old":{"first_name":"Asad","last_name":"sam","email":"asdfg@gmail.com","status":1},"ip":"103.137.24.26","description":"User updated"}	2025-05-06 12:29:46	2025-05-06 12:29:46	updated	\N
235	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-06 14:44:12	2025-05-06 14:44:12	updated	\N
236	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-06 14:47:37	2025-05-06 14:47:37	updated	\N
237	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-06 14:51:42	2025-05-06 14:51:42	updated	\N
238	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-06 14:55:42	2025-05-06 14:55:42	updated	\N
239	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-06 14:58:33	2025-05-06 14:58:33	updated	\N
240	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-06 15:00:42	2025-05-06 15:00:42	updated	\N
241	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-06 15:02:04	2025-05-06 15:02:04	updated	\N
242	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-06 15:09:28	2025-05-06 15:09:28	updated	\N
243	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-06 15:12:07	2025-05-06 15:12:07	updated	\N
244	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-06 15:13:47	2025-05-06 15:13:47	updated	\N
245	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-06 15:18:59	2025-05-06 15:18:59	updated	\N
246	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-06 15:22:19	2025-05-06 15:22:19	updated	\N
247	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-06 15:32:51	2025-05-06 15:32:51	updated	\N
248	user	User updated	App\\Models\\User	28	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama0@gmail.com","status":1},"ip":"182.183.2.94","description":"User updated"}	2025-05-06 17:44:36	2025-05-06 17:44:36	updated	\N
249	journey	Journey created	App\\Models\\Journey	13	App\\Models\\User	1	{"attributes":{"title":"test","description":null,"status":null},"ip":"117.244.201.185","description":"Journey created"}	2025-05-19 09:43:58	2025-05-19 09:43:58	created	\N
250	user	User updated	App\\Models\\User	12	\N	\N	{"attributes":{"first_name":"John","last_name":"David","email":"john@gmail.com","status":1},"old":{"first_name":"John","last_name":"David","email":"john@gmail.com","status":1},"ip":"117.254.2.52","description":"User updated"}	2025-05-20 11:40:32	2025-05-20 11:40:32	updated	\N
251	journey	Journey created	App\\Models\\Journey	14	\N	\N	{"attributes":{"title":"test","description":null,"status":null},"ip":"117.254.2.52","description":"Journey created"}	2025-05-20 11:42:29	2025-05-20 11:42:29	created	\N
252	user	User created	App\\Models\\User	34	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj@qw.com","status":1},"ip":"117.244.39.104","description":"User created"}	2025-05-21 07:49:37	2025-05-21 07:49:37	created	\N
253	user	User updated	App\\Models\\User	34	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj@qw.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj@qw.com","status":1},"ip":"117.244.39.104","description":"User updated"}	2025-05-21 07:49:37	2025-05-21 07:49:37	updated	\N
254	user	User updated	App\\Models\\User	34	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj@qw.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj@qw.com","status":1},"ip":"117.244.39.104","description":"User updated"}	2025-05-21 07:49:38	2025-05-21 07:49:38	updated	\N
255	user	User updated	App\\Models\\User	34	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj@qw.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj@qw.com","status":1},"ip":"117.244.39.104","description":"User updated"}	2025-05-21 07:49:38	2025-05-21 07:49:38	updated	\N
256	user	User created	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"test","last_name":"dev","email":false,"status":1},"ip":"39.38.229.209","description":"User created"}	2025-05-22 11:17:12	2025-05-22 11:17:12	created	\N
257	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"test","last_name":"dev","email":false,"status":1},"old":{"first_name":"test","last_name":"dev","email":false,"status":1},"ip":"39.38.229.209","description":"User updated"}	2025-05-22 11:17:12	2025-05-22 11:17:12	updated	\N
258	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"test","last_name":"dev","email":false,"status":1},"old":{"first_name":"test","last_name":"dev","email":false,"status":1},"ip":"39.38.229.209","description":"User updated"}	2025-05-22 11:17:12	2025-05-22 11:17:12	updated	\N
259	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"test","last_name":"dev","email":false,"status":1},"old":{"first_name":"test","last_name":"dev","email":false,"status":1},"ip":"39.38.229.209","description":"User updated"}	2025-05-22 11:17:12	2025-05-22 11:17:12	updated	\N
260	journey	Journey created	App\\Models\\Journey	15	App\\Models\\User	1	{"attributes":{"title":"Test","description":null,"status":null},"ip":"39.38.229.209","description":"Journey created"}	2025-05-23 06:33:49	2025-05-23 06:33:49	created	\N
261	journey	Journey updated	App\\Models\\Journey	15	App\\Models\\User	1	{"attributes":{"title":"Test","description":null,"status":null},"old":{"title":"Test","description":null,"status":null},"ip":"39.38.229.209","description":"Journey updated"}	2025-05-23 06:58:29	2025-05-23 06:58:29	updated	\N
262	user	User updated	App\\Models\\User	5	App\\Models\\User	1	{"attributes":{"first_name":"Darius","last_name":"Whitaker","email":false,"status":1},"old":{"first_name":"Darius","last_name":"Whitaker","email":false,"status":1},"ip":"39.38.229.209","description":"User updated"}	2025-05-23 07:11:01	2025-05-23 07:11:01	updated	\N
263	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"test","last_name":"dev","email":false,"status":1},"old":{"first_name":"test","last_name":"dev","email":false,"status":1},"ip":"39.38.229.209","description":"User updated"}	2025-05-23 07:12:39	2025-05-23 07:12:39	updated	\N
264	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"test","last_name":"dev","email":false,"status":1},"old":{"first_name":"test","last_name":"dev","email":false,"status":1},"ip":"39.38.229.209","description":"User updated"}	2025-05-23 07:12:39	2025-05-23 07:12:39	updated	\N
265	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"test","last_name":"dev","email":false,"status":1},"old":{"first_name":"test","last_name":"dev","email":false,"status":1},"ip":"39.38.229.209","description":"User updated"}	2025-05-23 07:12:40	2025-05-23 07:12:40	updated	\N
266	journey	Journey updated	App\\Models\\Journey	15	App\\Models\\User	1	{"attributes":{"title":"Test","description":null,"status":null},"old":{"title":"Test","description":null,"status":null},"ip":"39.38.229.209","description":"Journey updated"}	2025-05-23 07:22:18	2025-05-23 07:22:18	updated	\N
267	journey	Journey created	App\\Models\\Journey	16	\N	\N	{"attributes":{"title":"Test Destination","description":null,"status":null},"ip":"182.184.173.119","description":"Journey created"}	2025-05-25 12:54:02	2025-05-25 12:54:02	created	\N
268	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"anil","last_name":"navus","email":false,"status":1},"old":{"first_name":"test","last_name":"dev","email":false,"status":1},"ip":"106.76.191.194","description":"User updated"}	2025-05-26 04:48:05	2025-05-26 04:48:05	updated	\N
269	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"anil","last_name":"navus","email":false,"status":1},"old":{"first_name":"anil","last_name":"navus","email":false,"status":1},"ip":"106.76.191.194","description":"User updated"}	2025-05-26 04:48:05	2025-05-26 04:48:05	updated	\N
270	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"anil","last_name":"navus","email":false,"status":1},"old":{"first_name":"anil","last_name":"navus","email":false,"status":1},"ip":"106.76.191.194","description":"User updated"}	2025-05-26 04:48:05	2025-05-26 04:48:05	updated	\N
271	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"Tammy","last_name":"Cin","email":false,"status":1},"old":{"first_name":"anil","last_name":"navus","email":false,"status":1},"ip":"217.165.127.75","description":"User updated"}	2025-05-26 08:33:04	2025-05-26 08:33:04	updated	\N
272	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"Tammy","last_name":"Cin","email":false,"status":1},"old":{"first_name":"Tammy","last_name":"Cin","email":false,"status":1},"ip":"217.165.127.75","description":"User updated"}	2025-05-26 08:33:04	2025-05-26 08:33:04	updated	\N
273	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"Tammy","last_name":"Cin","email":false,"status":1},"old":{"first_name":"Tammy","last_name":"Cin","email":false,"status":1},"ip":"217.165.127.75","description":"User updated"}	2025-05-26 08:33:05	2025-05-26 08:33:05	updated	\N
274	journey	Journey created	App\\Models\\Journey	17	\N	\N	{"attributes":{"title":"Trip to Hunza","description":null,"status":null},"ip":"217.165.127.75","description":"Journey created"}	2025-05-26 08:45:51	2025-05-26 08:45:51	created	\N
275	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":false,"status":1},"old":{"first_name":"Tammy","last_name":"Cin","email":false,"status":1},"ip":"59.94.151.183","description":"User updated"}	2025-05-29 04:32:55	2025-05-29 04:32:55	updated	\N
276	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":false,"status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":false,"status":1},"ip":"59.94.151.183","description":"User updated"}	2025-05-29 04:32:55	2025-05-29 04:32:55	updated	\N
277	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":false,"status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":false,"status":1},"ip":"59.94.151.183","description":"User updated"}	2025-05-29 04:32:56	2025-05-29 04:32:56	updated	\N
278	user	User created	App\\Models\\User	36	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj6@yopmail.com","status":1},"ip":"59.94.151.183","description":"User created"}	2025-05-29 04:36:02	2025-05-29 04:36:02	created	\N
279	user	User updated	App\\Models\\User	36	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj6@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj6@yopmail.com","status":1},"ip":"59.94.151.183","description":"User updated"}	2025-05-29 04:36:02	2025-05-29 04:36:02	updated	\N
280	user	User updated	App\\Models\\User	36	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj6@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj6@yopmail.com","status":1},"ip":"59.94.151.183","description":"User updated"}	2025-05-29 04:36:03	2025-05-29 04:36:03	updated	\N
281	user	User updated	App\\Models\\User	36	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj6@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj6@yopmail.com","status":1},"ip":"59.88.112.123","description":"User updated"}	2025-05-31 12:32:50	2025-05-31 12:32:50	updated	\N
282	user	User created	App\\Models\\User	37	App\\Models\\User	1	{"attributes":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"ip":"119.160.57.141","description":"User created"}	2025-06-02 05:11:34	2025-06-02 05:11:34	created	\N
283	user	User updated	App\\Models\\User	37	App\\Models\\User	1	{"attributes":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"old":{"first_name":"Dev","last_name":"Test","email":false,"status":"1"},"ip":"119.160.57.141","description":"User updated"}	2025-06-02 05:11:34	2025-06-02 05:11:34	updated	\N
284	user	User updated	App\\Models\\User	37	\N	\N	{"attributes":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"old":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"ip":"119.160.57.141","description":"User updated"}	2025-06-02 05:11:57	2025-06-02 05:11:57	updated	\N
285	journey	Journey created	App\\Models\\Journey	18	\N	\N	{"attributes":{"title":"test title","description":null,"status":null},"ip":"119.160.57.141","description":"Journey created"}	2025-06-02 06:01:50	2025-06-02 06:01:50	created	\N
286	journey	Journey created	App\\Models\\Journey	19	\N	\N	{"attributes":{"title":"Journey Title","description":null,"status":null},"ip":"119.160.57.141","description":"Journey created"}	2025-06-02 06:48:23	2025-06-02 06:48:23	created	\N
287	journey	Journey created	App\\Models\\Journey	20	\N	\N	{"attributes":{"title":"journey Title two","description":null,"status":null},"ip":"118.103.229.78","description":"Journey created"}	2025-06-02 08:23:50	2025-06-02 08:23:50	created	\N
288	journey	Journey created	App\\Models\\Journey	21	\N	\N	{"attributes":{"title":"Test","description":null,"status":null},"ip":"118.103.229.78","description":"Journey created"}	2025-06-02 09:06:55	2025-06-02 09:06:55	created	\N
289	journey	Journey created	App\\Models\\Journey	22	\N	\N	{"attributes":{"title":"Journey Title Test","description":null,"status":null},"ip":"118.103.229.92","description":"Journey created"}	2025-06-03 05:15:48	2025-06-03 05:15:48	created	\N
290	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"anil","last_name":"an ch is","email":false,"status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":false,"status":1},"ip":"106.76.182.128","description":"User updated"}	2025-06-03 08:43:39	2025-06-03 08:43:39	updated	\N
291	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"anil","last_name":"an ch is","email":false,"status":1},"old":{"first_name":"anil","last_name":"an ch is","email":false,"status":1},"ip":"106.76.182.128","description":"User updated"}	2025-06-03 08:43:39	2025-06-03 08:43:39	updated	\N
292	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"anil","last_name":"an ch is","email":false,"status":1},"old":{"first_name":"anil","last_name":"an ch is","email":false,"status":1},"ip":"106.76.182.128","description":"User updated"}	2025-06-03 08:43:40	2025-06-03 08:43:40	updated	\N
293	journey	Journey created	App\\Models\\Journey	23	\N	\N	{"attributes":{"title":"Trip to Dubai","description":null,"status":null},"ip":"106.76.182.168","description":"Journey created"}	2025-06-03 09:08:29	2025-06-03 09:08:29	created	\N
294	journey	Journey created	App\\Models\\Journey	24	\N	\N	{"attributes":{"title":"test","description":null,"status":null},"ip":"118.103.229.92","description":"Journey created"}	2025-06-03 09:11:14	2025-06-03 09:11:14	created	\N
295	journey	Journey created	App\\Models\\Journey	25	\N	\N	{"attributes":{"title":"yedt","description":null,"status":null},"ip":"118.103.229.92","description":"Journey created"}	2025-06-03 09:13:11	2025-06-03 09:13:11	created	\N
296	journey	Journey created	App\\Models\\Journey	26	\N	\N	{"attributes":{"title":"yedt","description":null,"status":null},"ip":"118.103.229.92","description":"Journey created"}	2025-06-03 09:15:28	2025-06-03 09:15:28	created	\N
297	journey	Journey created	App\\Models\\Journey	27	\N	\N	{"attributes":{"title":"yedt","description":null,"status":null},"ip":"118.103.229.92","description":"Journey created"}	2025-06-03 09:24:30	2025-06-03 09:24:30	created	\N
298	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"anil","last_name":"an ch is","email":false,"status":1},"old":{"first_name":"anil","last_name":"an ch is","email":false,"status":1},"ip":"106.76.183.2","description":"User updated"}	2025-06-03 09:58:45	2025-06-03 09:58:45	updated	\N
299	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"asad","last_name":"nazir","email":false,"status":1},"old":{"first_name":"anil","last_name":"an ch is","email":false,"status":1},"ip":"103.137.24.122","description":"User updated"}	2025-06-03 10:02:47	2025-06-03 10:02:47	updated	\N
300	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"asad","last_name":"nazir","email":false,"status":1},"old":{"first_name":"asad","last_name":"nazir","email":false,"status":1},"ip":"103.137.24.122","description":"User updated"}	2025-06-03 10:02:47	2025-06-03 10:02:47	updated	\N
301	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"asad","last_name":"nazir","email":false,"status":1},"old":{"first_name":"asad","last_name":"nazir","email":false,"status":1},"ip":"103.137.24.122","description":"User updated"}	2025-06-03 10:02:48	2025-06-03 10:02:48	updated	\N
302	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"asad","last_name":"nazir","email":false,"status":1},"old":{"first_name":"asad","last_name":"nazir","email":false,"status":1},"ip":"103.137.24.170","description":"User updated"}	2025-06-03 10:32:21	2025-06-03 10:32:21	updated	\N
303	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"asad","last_name":"nazir","email":false,"status":1},"old":{"first_name":"asad","last_name":"nazir","email":false,"status":1},"ip":"103.137.24.122","description":"User updated"}	2025-06-03 10:32:31	2025-06-03 10:32:31	updated	\N
304	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"asad","last_name":"nazir","email":false,"status":1},"old":{"first_name":"asad","last_name":"nazir","email":false,"status":1},"ip":"103.137.24.122","description":"User updated"}	2025-06-03 10:32:41	2025-06-03 10:32:41	updated	\N
305	user	User created	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"ip":"59.88.115.97","description":"User created"}	2025-06-03 11:25:14	2025-06-03 11:25:14	created	\N
306	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"ip":"59.88.115.97","description":"User updated"}	2025-06-03 11:25:14	2025-06-03 11:25:14	updated	\N
307	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"ip":"59.88.115.97","description":"User updated"}	2025-06-03 11:25:15	2025-06-03 11:25:15	updated	\N
308	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"ip":"59.88.115.97","description":"User updated"}	2025-06-03 11:25:45	2025-06-03 11:25:45	updated	\N
567	journey	Journey created	App\\Models\\Journey	47	\N	\N	{"attributes":{"title":"test","description":null,"status":null},"ip":"51.158.232.49","description":"Journey created"}	2025-06-24 18:11:14	2025-06-24 18:11:14	created	\N
309	journey	Journey updated	App\\Models\\Journey	22	App\\Models\\User	1	{"attributes":{"title":"Journey Title Test","description":null,"status":null},"old":{"title":"Journey Title Test","description":null,"status":null},"ip":"118.103.229.92","description":"Journey updated"}	2025-06-03 11:32:52	2025-06-03 11:32:52	updated	\N
310	user	User updated	App\\Models\\User	31	\N	\N	{"attributes":{"first_name":"anol","last_name":"navis","email":false,"status":1},"old":{"first_name":"anol","last_name":"navis","email":false,"status":1},"ip":"59.88.115.97","description":"User updated"}	2025-06-03 11:33:23	2025-06-03 11:33:23	updated	\N
311	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"ip":"106.76.186.40","description":"User updated"}	2025-06-03 11:36:11	2025-06-03 11:36:11	updated	\N
312	user	User updated	App\\Models\\User	32	App\\Models\\User	1	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":false,"status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":false,"status":1},"ip":"118.103.229.92","description":"User updated"}	2025-06-03 11:50:59	2025-06-03 11:50:59	updated	\N
313	user	User updated	App\\Models\\User	32	App\\Models\\User	1	{"attributes":{"first_name":"Asad","last_name":"Nazir","email":false,"status":1},"old":{"first_name":"Asad","last_name":"Nazir","email":false,"status":"1"},"ip":"118.103.229.92","description":"User updated"}	2025-06-03 11:50:59	2025-06-03 11:50:59	updated	\N
314	journey	Journey updated	App\\Models\\Journey	22	App\\Models\\User	1	{"attributes":{"title":"Journey Title Test","description":null,"status":null},"old":{"title":"Journey Title Test","description":null,"status":null},"ip":"118.103.229.92","description":"Journey updated"}	2025-06-03 11:51:37	2025-06-03 11:51:37	updated	\N
315	user	User created	App\\Models\\User	39	\N	\N	{"attributes":{"first_name":"test dev","last_name":"two","email":"","status":1},"ip":"118.103.229.92","description":"User created"}	2025-06-04 04:42:34	2025-06-04 04:42:34	created	\N
316	user	User updated	App\\Models\\User	39	\N	\N	{"attributes":{"first_name":"test dev","last_name":"two","email":"","status":1},"old":{"first_name":"test dev","last_name":"two","email":"","status":1},"ip":"118.103.229.92","description":"User updated"}	2025-06-04 04:42:34	2025-06-04 04:42:34	updated	\N
317	user	User updated	App\\Models\\User	39	\N	\N	{"attributes":{"first_name":"test dev","last_name":"two","email":"","status":1},"old":{"first_name":"test dev","last_name":"two","email":"","status":1},"ip":"118.103.229.92","description":"User updated"}	2025-06-04 04:42:34	2025-06-04 04:42:34	updated	\N
318	user	User updated	App\\Models\\User	39	\N	\N	{"attributes":{"first_name":"test dev","last_name":"two","email":"","status":1},"old":{"first_name":"test dev","last_name":"two","email":"","status":1},"ip":"118.103.229.92","description":"User updated"}	2025-06-04 04:43:04	2025-06-04 04:43:04	updated	\N
319	user	User updated	App\\Models\\User	37	\N	\N	{"attributes":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"old":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"ip":"118.103.229.92","description":"User updated"}	2025-06-04 05:14:36	2025-06-04 05:14:36	updated	\N
320	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"ip":"106.76.183.147","description":"User updated"}	2025-06-04 10:47:56	2025-06-04 10:47:56	updated	\N
321	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"ip":"106.76.183.8","description":"User updated"}	2025-06-04 12:34:59	2025-06-04 12:34:59	updated	\N
322	journey	Journey created	App\\Models\\Journey	28	\N	\N	{"attributes":{"title":"Marina Dubai","description":null,"status":null},"ip":"106.76.183.8","description":"Journey created"}	2025-06-04 12:46:48	2025-06-04 12:46:48	created	\N
323	user	User created	App\\Models\\User	43	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj1171@yopmail.com","status":1},"ip":"117.244.36.85","description":"User created"}	2025-06-04 13:26:36	2025-06-04 13:26:36	created	\N
324	user	User updated	App\\Models\\User	43	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj1171@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj1171@yopmail.com","status":1},"ip":"117.244.36.85","description":"User updated"}	2025-06-04 13:26:36	2025-06-04 13:26:36	updated	\N
325	user	User updated	App\\Models\\User	43	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj1171@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj1171@yopmail.com","status":1},"ip":"117.244.36.85","description":"User updated"}	2025-06-04 13:26:37	2025-06-04 13:26:37	updated	\N
326	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":false,"status":1},"old":{"first_name":"asad","last_name":"nazir","email":false,"status":1},"ip":"117.244.36.85","description":"User updated"}	2025-06-04 13:27:49	2025-06-04 13:27:49	updated	\N
327	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":false,"status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":false,"status":1},"ip":"117.244.36.85","description":"User updated"}	2025-06-04 13:27:49	2025-06-04 13:27:49	updated	\N
328	user	User updated	App\\Models\\User	35	\N	\N	{"attributes":{"first_name":"Sabeeh Shah","last_name":"k","email":false,"status":1},"old":{"first_name":"Sabeeh Shah","last_name":"k","email":false,"status":1},"ip":"117.244.36.85","description":"User updated"}	2025-06-04 13:27:50	2025-06-04 13:27:50	updated	\N
329	user	User created	App\\Models\\User	44	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj11711@yopmail.com","status":1},"ip":"117.244.36.85","description":"User created"}	2025-06-04 13:40:28	2025-06-04 13:40:28	created	\N
330	user	User updated	App\\Models\\User	44	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj11711@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj11711@yopmail.com","status":1},"ip":"117.244.36.85","description":"User updated"}	2025-06-04 13:40:28	2025-06-04 13:40:28	updated	\N
331	user	User updated	App\\Models\\User	44	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj11711@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj11711@yopmail.com","status":1},"ip":"117.244.36.85","description":"User updated"}	2025-06-04 13:40:28	2025-06-04 13:40:28	updated	\N
332	user	User created	App\\Models\\User	45	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":false,"status":1},"ip":"117.244.36.85","description":"User created"}	2025-06-04 13:54:57	2025-06-04 13:54:57	created	\N
333	user	User updated	App\\Models\\User	45	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":false,"status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":false,"status":1},"ip":"117.244.36.85","description":"User updated"}	2025-06-04 13:54:57	2025-06-04 13:54:57	updated	\N
334	user	User updated	App\\Models\\User	45	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":false,"status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":false,"status":1},"ip":"117.244.36.85","description":"User updated"}	2025-06-04 13:54:58	2025-06-04 13:54:58	updated	\N
335	user	User updated	App\\Models\\User	45	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":false,"status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":false,"status":1},"ip":"117.244.36.85","description":"User updated"}	2025-06-04 13:54:58	2025-06-04 13:54:58	updated	\N
336	user	User updated	App\\Models\\User	37	\N	\N	{"attributes":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"old":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"ip":"118.103.229.92","description":"User updated"}	2025-06-05 05:33:27	2025-06-05 05:33:27	updated	\N
337	user	User updated	App\\Models\\User	37	\N	\N	{"attributes":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"old":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"ip":"118.103.229.92","description":"User updated"}	2025-06-05 05:33:27	2025-06-05 05:33:27	updated	\N
338	user	User updated	App\\Models\\User	37	\N	\N	{"attributes":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"old":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"ip":"118.103.229.92","description":"User updated"}	2025-06-05 05:40:09	2025-06-05 05:40:09	updated	\N
339	user	User created	App\\Models\\User	46	\N	\N	{"attributes":{"first_name":"dev three","last_name":"test","email":"testdev@gmail.com","status":1},"ip":"118.103.229.92","description":"User created"}	2025-06-05 05:51:51	2025-06-05 05:51:51	created	\N
340	user	User updated	App\\Models\\User	46	\N	\N	{"attributes":{"first_name":"dev three","last_name":"test","email":"testdev@gmail.com","status":1},"old":{"first_name":"dev three","last_name":"test","email":"testdev@gmail.com","status":1},"ip":"118.103.229.92","description":"User updated"}	2025-06-05 05:51:51	2025-06-05 05:51:51	updated	\N
341	user	User updated	App\\Models\\User	46	\N	\N	{"attributes":{"first_name":"dev three","last_name":"test","email":"testdev@gmail.com","status":1},"old":{"first_name":"dev three","last_name":"test","email":"testdev@gmail.com","status":1},"ip":"118.103.229.92","description":"User updated"}	2025-06-05 05:51:52	2025-06-05 05:51:52	updated	\N
342	user	User updated	App\\Models\\User	46	\N	\N	{"attributes":{"first_name":"dev three","last_name":"test","email":"testdev@gmail.com","status":1},"old":{"first_name":"dev three","last_name":"test","email":"testdev@gmail.com","status":1},"ip":"118.103.229.92","description":"User updated"}	2025-06-05 05:52:25	2025-06-05 05:52:25	updated	\N
343	user	User updated	App\\Models\\User	37	\N	\N	{"attributes":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"old":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"ip":"118.103.229.92","description":"User updated"}	2025-06-05 05:52:47	2025-06-05 05:52:47	updated	\N
344	journey	Journey created	App\\Models\\Journey	29	\N	\N	{"attributes":{"title":"My Journey title","description":null,"status":null},"ip":"118.103.229.92","description":"Journey created"}	2025-06-05 06:46:37	2025-06-05 06:46:37	created	\N
345	user	User updated	App\\Models\\User	46	\N	\N	{"attributes":{"first_name":"dev three","last_name":"test","email":"testdev@gmail.com","status":1},"old":{"first_name":"dev three","last_name":"test","email":"testdev@gmail.com","status":1},"ip":"118.103.229.92","description":"User updated"}	2025-06-05 11:04:49	2025-06-05 11:04:49	updated	\N
346	user	User updated	App\\Models\\User	37	\N	\N	{"attributes":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"old":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"ip":"118.103.229.92","description":"User updated"}	2025-06-05 11:05:18	2025-06-05 11:05:18	updated	\N
347	user	User created	App\\Models\\User	47	\N	\N	{"attributes":{"first_name":"test dev","last_name":"two","email":"testdev2@gmail.com","status":1},"ip":"118.103.229.92","description":"User created"}	2025-06-05 12:42:23	2025-06-05 12:42:23	created	\N
348	user	User updated	App\\Models\\User	47	\N	\N	{"attributes":{"first_name":"test dev","last_name":"two","email":"testdev2@gmail.com","status":1},"old":{"first_name":"test dev","last_name":"two","email":"testdev2@gmail.com","status":1},"ip":"118.103.229.92","description":"User updated"}	2025-06-05 12:42:23	2025-06-05 12:42:23	updated	\N
349	user	User updated	App\\Models\\User	47	\N	\N	{"attributes":{"first_name":"test dev","last_name":"two","email":"testdev2@gmail.com","status":1},"old":{"first_name":"test dev","last_name":"two","email":"testdev2@gmail.com","status":1},"ip":"118.103.229.92","description":"User updated"}	2025-06-05 12:42:24	2025-06-05 12:42:24	updated	\N
350	user	User updated	App\\Models\\User	39	\N	\N	{"attributes":{"first_name":"test dev","last_name":"two","email":"","status":1},"old":{"first_name":"test dev","last_name":"two","email":"","status":1},"ip":"118.103.229.92","description":"User updated"}	2025-06-05 12:44:42	2025-06-05 12:44:42	updated	\N
351	user	User updated	App\\Models\\User	37	\N	\N	{"attributes":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"old":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"ip":"118.103.229.92","description":"User updated"}	2025-06-05 12:45:19	2025-06-05 12:45:19	updated	\N
352	journey	Journey updated	App\\Models\\Journey	29	\N	\N	{"attributes":{"title":"My Journey title e","description":null,"status":null},"old":{"title":"My Journey title","description":null,"status":null},"ip":"118.103.229.92","description":"Journey updated"}	2025-06-05 21:20:16	2025-06-05 21:20:16	updated	\N
353	journey	Journey updated	App\\Models\\Journey	29	\N	\N	{"attributes":{"title":"My Journey title ee","description":null,"status":null},"old":{"title":"My Journey title e","description":null,"status":null},"ip":"118.103.229.92","description":"Journey updated"}	2025-06-05 21:23:22	2025-06-05 21:23:22	updated	\N
354	journey	Journey updated	App\\Models\\Journey	29	\N	\N	{"attributes":{"title":"My Journey title ee","description":null,"status":null},"old":{"title":"My Journey title ee","description":null,"status":null},"ip":"118.103.229.92","description":"Journey updated"}	2025-06-05 21:23:38	2025-06-05 21:23:38	updated	\N
355	user	User created	App\\Models\\User	48	\N	\N	{"attributes":{"first_name":"Anil","last_name":"navis","email":"anil71@gmail.com","status":1},"ip":"49.37.227.13","description":"User created"}	2025-06-06 09:28:19	2025-06-06 09:28:19	created	\N
356	user	User updated	App\\Models\\User	48	\N	\N	{"attributes":{"first_name":"Anil","last_name":"navis","email":"anil71@gmail.com","status":1},"old":{"first_name":"Anil","last_name":"navis","email":"anil71@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-06 09:28:19	2025-06-06 09:28:19	updated	\N
357	user	User updated	App\\Models\\User	48	\N	\N	{"attributes":{"first_name":"Anil","last_name":"navis","email":"anil71@gmail.com","status":1},"old":{"first_name":"Anil","last_name":"navis","email":"anil71@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-06 09:28:20	2025-06-06 09:28:20	updated	\N
358	user	User updated	App\\Models\\User	48	\N	\N	{"attributes":{"first_name":"Anil","last_name":"navis","email":"anil71@gmail.com","status":1},"old":{"first_name":"Anil","last_name":"navis","email":"anil71@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-07 06:36:21	2025-06-07 06:36:21	updated	\N
359	journey	Journey created	App\\Models\\Journey	30	\N	\N	{"attributes":{"title":"Dubai Marina","description":null,"status":null},"ip":"49.37.227.13","description":"Journey created"}	2025-06-07 06:57:13	2025-06-07 06:57:13	created	\N
360	journey	Journey updated	App\\Models\\Journey	30	\N	\N	{"attributes":{"title":"Dubai Marina","description":null,"status":null},"old":{"title":"Dubai Marina","description":null,"status":null},"ip":"49.37.227.13","description":"Journey updated"}	2025-06-07 07:25:36	2025-06-07 07:25:36	updated	\N
361	journey	Journey created	App\\Models\\Journey	31	\N	\N	{"attributes":{"title":"Desert Safari","description":null,"status":null},"ip":"49.37.227.13","description":"Journey created"}	2025-06-07 07:53:05	2025-06-07 07:53:05	created	\N
362	user	User updated	App\\Models\\User	45	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":false,"status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":false,"status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-07 09:18:56	2025-06-07 09:18:56	updated	\N
363	user	User created	App\\Models\\User	49	\N	\N	{"attributes":{"first_name":"akio","last_name":"nahis","email":"anil71@anil71.com","status":1},"ip":"49.37.227.13","description":"User created"}	2025-06-07 09:41:24	2025-06-07 09:41:24	created	\N
364	user	User updated	App\\Models\\User	49	\N	\N	{"attributes":{"first_name":"akio","last_name":"nahis","email":"anil71@anil71.com","status":1},"old":{"first_name":"akio","last_name":"nahis","email":"anil71@anil71.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-07 09:41:24	2025-06-07 09:41:24	updated	\N
365	user	User updated	App\\Models\\User	49	\N	\N	{"attributes":{"first_name":"akio","last_name":"nahis","email":"anil71@anil71.com","status":1},"old":{"first_name":"akio","last_name":"nahis","email":"anil71@anil71.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-07 09:41:24	2025-06-07 09:41:24	updated	\N
366	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"ip":"117.213.19.227","description":"User updated"}	2025-06-07 11:28:08	2025-06-07 11:28:08	updated	\N
367	journey	Journey created	App\\Models\\Journey	32	\N	\N	{"attributes":{"title":"trst","description":null,"status":null},"ip":"118.103.229.77","description":"Journey created"}	2025-06-09 05:45:42	2025-06-09 05:45:42	created	\N
368	user	User created	App\\Models\\User	50	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj66@yopmail.com","status":1},"ip":"110.39.137.35","description":"User created"}	2025-06-09 12:19:44	2025-06-09 12:19:44	created	\N
369	user	User updated	App\\Models\\User	50	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj66@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj66@yopmail.com","status":1},"ip":"110.39.137.35","description":"User updated"}	2025-06-09 12:19:44	2025-06-09 12:19:44	updated	\N
370	user	User updated	App\\Models\\User	50	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj66@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj66@yopmail.com","status":1},"ip":"110.39.137.35","description":"User updated"}	2025-06-09 12:19:45	2025-06-09 12:19:45	updated	\N
371	user	User updated	App\\Models\\User	50	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj66@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj66@yopmail.com","status":1},"ip":"110.39.137.35","description":"User updated"}	2025-06-09 12:21:44	2025-06-09 12:21:44	updated	\N
372	user	User updated	App\\Models\\User	37	\N	\N	{"attributes":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"old":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"ip":"118.103.229.77","description":"User updated"}	2025-06-09 15:28:48	2025-06-09 15:28:48	updated	\N
373	user	User updated	App\\Models\\User	37	\N	\N	{"attributes":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"old":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"ip":"118.103.229.77","description":"User updated"}	2025-06-09 15:32:27	2025-06-09 15:32:27	updated	\N
374	user	User updated	App\\Models\\User	37	\N	\N	{"attributes":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"old":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"ip":"118.103.229.77","description":"User updated"}	2025-06-09 15:54:15	2025-06-09 15:54:15	updated	\N
375	user	User created	App\\Models\\User	51	\N	\N	{"attributes":{"first_name":"anil","last_name":"nabis","email":"navis@navis.com","status":1},"ip":"106.76.183.167","description":"User created"}	2025-06-10 06:29:33	2025-06-10 06:29:33	created	\N
376	user	User updated	App\\Models\\User	51	\N	\N	{"attributes":{"first_name":"anil","last_name":"nabis","email":"navis@navis.com","status":1},"old":{"first_name":"anil","last_name":"nabis","email":"navis@navis.com","status":1},"ip":"106.76.183.167","description":"User updated"}	2025-06-10 06:29:33	2025-06-10 06:29:33	updated	\N
377	user	User updated	App\\Models\\User	51	\N	\N	{"attributes":{"first_name":"anil","last_name":"nabis","email":"navis@navis.com","status":1},"old":{"first_name":"anil","last_name":"nabis","email":"navis@navis.com","status":1},"ip":"106.76.183.167","description":"User updated"}	2025-06-10 06:29:34	2025-06-10 06:29:34	updated	\N
378	user	User updated	App\\Models\\User	51	\N	\N	{"attributes":{"first_name":"anil","last_name":"nabis","email":"navis@navis.com","status":1},"old":{"first_name":"anil","last_name":"nabis","email":"navis@navis.com","status":1},"ip":"106.76.183.167","description":"User updated"}	2025-06-10 07:04:03	2025-06-10 07:04:03	updated	\N
379	journey	Journey created	App\\Models\\Journey	33	\N	\N	{"attributes":{"title":"dtyuffgh","description":null,"status":null},"ip":"106.76.183.167","description":"Journey created"}	2025-06-10 07:37:04	2025-06-10 07:37:04	created	\N
380	user	User updated	App\\Models\\User	47	\N	\N	{"attributes":{"first_name":"test dev","last_name":"two","email":"testdev2@gmail.com","status":1},"old":{"first_name":"test dev","last_name":"two","email":"testdev2@gmail.com","status":1},"ip":"39.43.147.80","description":"User updated"}	2025-06-10 11:52:38	2025-06-10 11:52:38	updated	\N
381	user	User updated	App\\Models\\User	37	\N	\N	{"attributes":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"old":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"ip":"39.43.147.80","description":"User updated"}	2025-06-10 11:53:18	2025-06-10 11:53:18	updated	\N
382	user	User updated	App\\Models\\User	46	\N	\N	{"attributes":{"first_name":"dev three","last_name":"test","email":"testdev@gmail.com","status":1},"old":{"first_name":"dev three","last_name":"test","email":"testdev@gmail.com","status":1},"ip":"39.43.147.80","description":"User updated"}	2025-06-10 11:54:05	2025-06-10 11:54:05	updated	\N
383	user	User updated	App\\Models\\User	37	\N	\N	{"attributes":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"old":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"ip":"39.43.147.80","description":"User updated"}	2025-06-11 03:52:08	2025-06-11 03:52:08	updated	\N
384	user	User updated	App\\Models\\User	47	App\\Models\\User	1	{"attributes":{"first_name":"test dev","last_name":"two","email":false,"status":1},"old":{"first_name":"test dev","last_name":"two","email":"testdev2@gmail.com","status":1},"ip":"39.43.147.80","description":"User updated"}	2025-06-11 05:52:10	2025-06-11 05:52:10	updated	\N
385	user	User updated	App\\Models\\User	47	App\\Models\\User	1	{"attributes":{"first_name":"test dev","last_name":"two","email":false,"status":1},"old":{"first_name":"test dev","last_name":"two","email":false,"status":"1"},"ip":"39.43.147.80","description":"User updated"}	2025-06-11 05:52:10	2025-06-11 05:52:10	updated	\N
386	user	User updated	App\\Models\\User	47	\N	\N	{"attributes":{"first_name":"test dev","last_name":"two","email":false,"status":1},"old":{"first_name":"test dev","last_name":"two","email":false,"status":1},"ip":"39.43.147.80","description":"User updated"}	2025-06-11 06:23:02	2025-06-11 06:23:02	updated	\N
387	user	User updated	App\\Models\\User	47	\N	\N	{"attributes":{"first_name":"test dev","last_name":"two","email":false,"status":1},"old":{"first_name":"test dev","last_name":"two","email":false,"status":1},"ip":"39.43.147.80","description":"User updated"}	2025-06-11 06:23:09	2025-06-11 06:23:09	updated	\N
388	user	User updated	App\\Models\\User	47	\N	\N	{"attributes":{"first_name":"test dev","last_name":"two","email":false,"status":1},"old":{"first_name":"test dev","last_name":"two","email":false,"status":1},"ip":"39.43.147.80","description":"User updated"}	2025-06-11 06:36:54	2025-06-11 06:36:54	updated	\N
389	user	User updated	App\\Models\\User	46	\N	\N	{"attributes":{"first_name":"dev three","last_name":"test","email":"testdev@gmail.com","status":1},"old":{"first_name":"dev three","last_name":"test","email":"testdev@gmail.com","status":1},"ip":"39.43.147.80","description":"User updated"}	2025-06-11 06:38:35	2025-06-11 06:38:35	updated	\N
390	user	User updated	App\\Models\\User	47	\N	\N	{"attributes":{"first_name":"test dev","last_name":"two","email":false,"status":1},"old":{"first_name":"test dev","last_name":"two","email":false,"status":1},"ip":"39.43.147.80","description":"User updated"}	2025-06-11 06:39:02	2025-06-11 06:39:02	updated	\N
391	user	User created	App\\Models\\User	52	\N	\N	{"attributes":{"first_name":"testdev","last_name":"four","email":"testdevfour@gmail.com","status":1},"ip":"39.58.125.27","description":"User created"}	2025-06-11 07:56:35	2025-06-11 07:56:35	created	\N
392	user	User updated	App\\Models\\User	52	\N	\N	{"attributes":{"first_name":"testdev","last_name":"four","email":"testdevfour@gmail.com","status":1},"old":{"first_name":"testdev","last_name":"four","email":"testdevfour@gmail.com","status":1},"ip":"39.58.125.27","description":"User updated"}	2025-06-11 07:56:35	2025-06-11 07:56:35	updated	\N
393	user	User updated	App\\Models\\User	52	\N	\N	{"attributes":{"first_name":"testdev","last_name":"four","email":"testdevfour@gmail.com","status":1},"old":{"first_name":"testdev","last_name":"four","email":"testdevfour@gmail.com","status":1},"ip":"39.58.125.27","description":"User updated"}	2025-06-11 07:56:36	2025-06-11 07:56:36	updated	\N
394	user	User updated	App\\Models\\User	37	\N	\N	{"attributes":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"old":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"ip":"39.58.125.27","description":"User updated"}	2025-06-11 07:57:29	2025-06-11 07:57:29	updated	\N
395	user	User updated	App\\Models\\User	47	\N	\N	{"attributes":{"first_name":"test dev","last_name":"two","email":false,"status":1},"old":{"first_name":"test dev","last_name":"two","email":false,"status":1},"ip":"39.58.125.27","description":"User updated"}	2025-06-11 07:58:34	2025-06-11 07:58:34	updated	\N
396	user	User updated	App\\Models\\User	52	\N	\N	{"attributes":{"first_name":"testdev","last_name":"four","email":"testdevfour@gmail.com","status":1},"old":{"first_name":"testdev","last_name":"four","email":"testdevfour@gmail.com","status":1},"ip":"39.58.125.27","description":"User updated"}	2025-06-11 07:59:00	2025-06-11 07:59:00	updated	\N
397	user	User updated	App\\Models\\User	47	App\\Models\\User	1	{"attributes":{"first_name":"test dev","last_name":"two","email":false,"status":1},"old":{"first_name":"test dev","last_name":"two","email":false,"status":1},"ip":"59.88.120.43","description":"User updated"}	2025-06-11 08:12:38	2025-06-11 08:12:38	updated	\N
398	user	User updated	App\\Models\\User	46	\N	\N	{"attributes":{"first_name":"dev three","last_name":"test","email":"testdev@gmail.com","status":1},"old":{"first_name":"dev three","last_name":"test","email":"testdev@gmail.com","status":1},"ip":"39.58.125.27","description":"User updated"}	2025-06-11 08:16:20	2025-06-11 08:16:20	updated	\N
399	user	User updated	App\\Models\\User	52	\N	\N	{"attributes":{"first_name":"testdev","last_name":"four","email":"testdevfour@gmail.com","status":1},"old":{"first_name":"testdev","last_name":"four","email":"testdevfour@gmail.com","status":1},"ip":"39.58.125.27","description":"User updated"}	2025-06-11 08:17:03	2025-06-11 08:17:03	updated	\N
400	user	User created	App\\Models\\User	53	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj1517411@yopmail.com","status":1},"ip":"59.88.120.43","description":"User created"}	2025-06-11 08:18:03	2025-06-11 08:18:03	created	\N
401	user	User updated	App\\Models\\User	53	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj1517411@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj1517411@yopmail.com","status":1},"ip":"59.88.120.43","description":"User updated"}	2025-06-11 08:18:03	2025-06-11 08:18:03	updated	\N
402	user	User updated	App\\Models\\User	53	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj1517411@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj1517411@yopmail.com","status":1},"ip":"59.88.120.43","description":"User updated"}	2025-06-11 08:18:04	2025-06-11 08:18:04	updated	\N
403	user	User updated	App\\Models\\User	47	\N	\N	{"attributes":{"first_name":"test dev","last_name":"two","email":false,"status":1},"old":{"first_name":"test dev","last_name":"two","email":false,"status":1},"ip":"39.58.125.27","description":"User updated"}	2025-06-11 08:46:01	2025-06-11 08:46:01	updated	\N
404	user	User updated	App\\Models\\User	52	App\\Models\\User	1	{"attributes":{"first_name":"testdevf","last_name":"four","email":false,"status":1},"old":{"first_name":"testdev","last_name":"four","email":"testdevfour@gmail.com","status":1},"ip":"59.88.120.43","description":"User updated"}	2025-06-11 09:21:54	2025-06-11 09:21:54	updated	\N
405	user	User updated	App\\Models\\User	52	App\\Models\\User	1	{"attributes":{"first_name":"testdevf","last_name":"four","email":false,"status":1},"old":{"first_name":"testdevf","last_name":"four","email":false,"status":"1"},"ip":"59.88.120.43","description":"User updated"}	2025-06-11 09:21:55	2025-06-11 09:21:55	updated	\N
406	user	User updated	App\\Models\\User	46	\N	\N	{"attributes":{"first_name":"dev three","last_name":"test","email":"testdev@gmail.com","status":1},"old":{"first_name":"dev three","last_name":"test","email":"testdev@gmail.com","status":1},"ip":"39.58.125.27","description":"User updated"}	2025-06-11 09:27:54	2025-06-11 09:27:54	updated	\N
407	user	User updated	App\\Models\\User	46	App\\Models\\User	1	{"attributes":{"first_name":"dev three","last_name":"test","email":false,"status":1},"old":{"first_name":"dev three","last_name":"test","email":"testdev@gmail.com","status":1},"ip":"39.58.125.27","description":"User updated"}	2025-06-11 09:28:29	2025-06-11 09:28:29	updated	\N
408	user	User updated	App\\Models\\User	46	App\\Models\\User	1	{"attributes":{"first_name":"dev three","last_name":"test","email":false,"status":1},"old":{"first_name":"dev three","last_name":"test","email":false,"status":"1"},"ip":"39.58.125.27","description":"User updated"}	2025-06-11 09:28:30	2025-06-11 09:28:30	updated	\N
409	user	User updated	App\\Models\\User	37	\N	\N	{"attributes":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"old":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"ip":"39.58.125.27","description":"User updated"}	2025-06-11 09:40:11	2025-06-11 09:40:11	updated	\N
410	user	User updated	App\\Models\\User	52	\N	\N	{"attributes":{"first_name":"testdevf","last_name":"four","email":false,"status":1},"old":{"first_name":"testdevf","last_name":"four","email":false,"status":1},"ip":"39.58.125.27","description":"User updated"}	2025-06-11 10:04:35	2025-06-11 10:04:35	updated	\N
411	user	User updated	App\\Models\\User	37	\N	\N	{"attributes":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"old":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"ip":"39.58.125.27","description":"User updated"}	2025-06-11 10:23:18	2025-06-11 10:23:18	updated	\N
412	user	User updated	App\\Models\\User	37	\N	\N	{"attributes":{"first_name":"Dev","last_name":"Test one","email":false,"status":1},"old":{"first_name":"Dev","last_name":"Test","email":false,"status":1},"ip":"39.58.125.27","description":"User updated"}	2025-06-11 12:50:05	2025-06-11 12:50:05	updated	\N
413	user	User updated	App\\Models\\User	37	\N	\N	{"attributes":{"first_name":"Dev","last_name":"Test one","email":false,"status":1},"old":{"first_name":"Dev","last_name":"Test one","email":false,"status":1},"ip":"39.58.125.27","description":"User updated"}	2025-06-11 12:55:55	2025-06-11 12:55:55	updated	\N
414	user	User updated	App\\Models\\User	52	\N	\N	{"attributes":{"first_name":"testdevf","last_name":"four","email":false,"status":1},"old":{"first_name":"testdevf","last_name":"four","email":false,"status":1},"ip":"39.58.125.27","description":"User updated"}	2025-06-11 12:58:43	2025-06-11 12:58:43	updated	\N
415	user	User updated	App\\Models\\User	52	\N	\N	{"attributes":{"first_name":"testdevf","last_name":"four","email":false,"status":1},"old":{"first_name":"testdevf","last_name":"four","email":false,"status":1},"ip":"39.58.125.27","description":"User updated"}	2025-06-11 13:08:57	2025-06-11 13:08:57	updated	\N
416	user	User updated	App\\Models\\User	37	\N	\N	{"attributes":{"first_name":"Dev","last_name":"Test one","email":false,"status":1},"old":{"first_name":"Dev","last_name":"Test one","email":false,"status":1},"ip":"39.58.125.27","description":"User updated"}	2025-06-11 13:32:57	2025-06-11 13:32:57	updated	\N
417	journey	Journey created	App\\Models\\Journey	34	\N	\N	{"attributes":{"title":"Journey","description":null,"status":null},"ip":"39.58.125.27","description":"Journey created"}	2025-06-11 13:45:25	2025-06-11 13:45:25	created	\N
418	user	User created	App\\Models\\User	54	\N	\N	{"attributes":{"first_name":"anil","last_name":"navis","email":"anil007@gmail.com","status":1},"ip":"106.76.190.61","description":"User created"}	2025-06-12 03:55:24	2025-06-12 03:55:24	created	\N
419	user	User updated	App\\Models\\User	54	\N	\N	{"attributes":{"first_name":"anil","last_name":"navis","email":"anil007@gmail.com","status":1},"old":{"first_name":"anil","last_name":"navis","email":"anil007@gmail.com","status":1},"ip":"106.76.190.61","description":"User updated"}	2025-06-12 03:55:24	2025-06-12 03:55:24	updated	\N
420	user	User updated	App\\Models\\User	54	\N	\N	{"attributes":{"first_name":"anil","last_name":"navis","email":"anil007@gmail.com","status":1},"old":{"first_name":"anil","last_name":"navis","email":"anil007@gmail.com","status":1},"ip":"106.76.190.61","description":"User updated"}	2025-06-12 03:55:25	2025-06-12 03:55:25	updated	\N
421	user	User created	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.22.230","description":"User created"}	2025-06-12 03:57:03	2025-06-12 03:57:03	created	\N
422	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.22.230","description":"User updated"}	2025-06-12 03:57:03	2025-06-12 03:57:03	updated	\N
423	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.22.230","description":"User updated"}	2025-06-12 03:57:04	2025-06-12 03:57:04	updated	\N
424	user	User updated	App\\Models\\User	54	\N	\N	{"attributes":{"first_name":"anil","last_name":"navis","email":"anil007@gmail.com","status":1},"old":{"first_name":"anil","last_name":"navis","email":"anil007@gmail.com","status":1},"ip":"106.76.190.61","description":"User updated"}	2025-06-12 03:57:16	2025-06-12 03:57:16	updated	\N
425	user	User created	App\\Models\\User	56	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"ip":"212.8.248.254","description":"User created"}	2025-06-13 13:21:48	2025-06-13 13:21:48	created	\N
426	user	User updated	App\\Models\\User	56	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"ip":"212.8.248.254","description":"User updated"}	2025-06-13 13:21:49	2025-06-13 13:21:49	updated	\N
427	user	User updated	App\\Models\\User	56	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"ip":"212.8.248.254","description":"User updated"}	2025-06-13 13:21:50	2025-06-13 13:21:50	updated	\N
428	user	User updated	App\\Models\\User	56	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"ip":"212.8.248.254","description":"User updated"}	2025-06-13 13:36:22	2025-06-13 13:36:22	updated	\N
429	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.4.164","description":"User updated"}	2025-06-16 15:47:05	2025-06-16 15:47:05	updated	\N
430	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.4.164","description":"User updated"}	2025-06-16 16:27:36	2025-06-16 16:27:36	updated	\N
431	journey	Journey created	App\\Models\\Journey	35	\N	\N	{"attributes":{"title":"Hamid","description":null,"status":null},"ip":"223.123.4.164","description":"Journey created"}	2025-06-16 16:36:32	2025-06-16 16:36:32	created	\N
432	journey	Journey created	App\\Models\\Journey	36	\N	\N	{"attributes":{"title":"hello","description":null,"status":null},"ip":"223.123.4.164","description":"Journey created"}	2025-06-16 16:39:55	2025-06-16 16:39:55	created	\N
433	journey	Journey created	App\\Models\\Journey	37	\N	\N	{"attributes":{"title":"tezt","description":null,"status":null},"ip":"223.123.4.164","description":"Journey created"}	2025-06-16 16:51:02	2025-06-16 16:51:02	created	\N
434	journey	Journey updated	App\\Models\\Journey	36	\N	\N	{"attributes":{"title":"hello hamid","description":null,"status":null},"old":{"title":"hello","description":null,"status":null},"ip":"223.123.4.164","description":"Journey updated"}	2025-06-16 16:53:02	2025-06-16 16:53:02	updated	\N
435	user	User updated	App\\Models\\User	56	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"ip":"223.123.4.164","description":"User updated"}	2025-06-16 16:58:23	2025-06-16 16:58:23	updated	\N
436	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.4.164","description":"User updated"}	2025-06-16 16:59:14	2025-06-16 16:59:14	updated	\N
437	user	User updated	App\\Models\\User	56	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"ip":"223.123.4.164","description":"User updated"}	2025-06-16 17:00:27	2025-06-16 17:00:27	updated	\N
438	user	User updated	App\\Models\\User	56	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"ip":"223.123.4.164","description":"User updated"}	2025-06-16 17:03:16	2025-06-16 17:03:16	updated	\N
439	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.4.164","description":"User updated"}	2025-06-16 17:06:27	2025-06-16 17:06:27	updated	\N
440	user	User created	App\\Models\\User	57	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama@gmail.com","status":1},"ip":"154.198.88.96","description":"User created"}	2025-06-17 07:19:45	2025-06-17 07:19:45	created	\N
441	user	User updated	App\\Models\\User	57	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama@gmail.com","status":1},"ip":"154.198.88.96","description":"User updated"}	2025-06-17 07:19:46	2025-06-17 07:19:46	updated	\N
442	user	User updated	App\\Models\\User	57	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama@gmail.com","status":1},"ip":"154.198.88.96","description":"User updated"}	2025-06-17 07:19:47	2025-06-17 07:19:47	updated	\N
443	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"ip":"59.98.210.53","description":"User updated"}	2025-06-17 08:39:02	2025-06-17 08:39:02	updated	\N
444	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"ip":"117.202.123.196","description":"User updated"}	2025-06-17 08:53:36	2025-06-17 08:53:36	updated	\N
445	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"54.36.112.214","description":"User updated"}	2025-06-17 16:55:43	2025-06-17 16:55:43	updated	\N
446	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"54.36.112.214","description":"User updated"}	2025-06-17 17:55:47	2025-06-17 17:55:47	updated	\N
447	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"ip":"117.202.123.196","description":"User updated"}	2025-06-18 04:02:21	2025-06-18 04:02:21	updated	\N
448	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.12.130","description":"User updated"}	2025-06-18 04:41:19	2025-06-18 04:41:19	updated	\N
449	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.12.130","description":"User updated"}	2025-06-18 05:01:22	2025-06-18 05:01:22	updated	\N
450	user	User updated	App\\Models\\User	56	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"ip":"190.2.143.211","description":"User updated"}	2025-06-18 05:04:51	2025-06-18 05:04:51	updated	\N
451	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.12.130","description":"User updated"}	2025-06-18 07:08:17	2025-06-18 07:08:17	updated	\N
452	user	User updated	App\\Models\\User	56	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"ip":"223.123.12.130","description":"User updated"}	2025-06-18 10:59:23	2025-06-18 10:59:23	updated	\N
453	user	User created	App\\Models\\User	58	\N	\N	{"attributes":{"first_name":"Ameera","last_name":"Raza","email":"ameera@gmail.com","status":1},"ip":"223.123.12.130","description":"User created"}	2025-06-18 12:10:05	2025-06-18 12:10:05	created	\N
454	user	User updated	App\\Models\\User	58	\N	\N	{"attributes":{"first_name":"Ameera","last_name":"Raza","email":"ameera@gmail.com","status":1},"old":{"first_name":"Ameera","last_name":"Raza","email":"ameera@gmail.com","status":1},"ip":"223.123.12.130","description":"User updated"}	2025-06-18 12:10:06	2025-06-18 12:10:06	updated	\N
455	user	User updated	App\\Models\\User	58	\N	\N	{"attributes":{"first_name":"Ameera","last_name":"Raza","email":"ameera@gmail.com","status":1},"old":{"first_name":"Ameera","last_name":"Raza","email":"ameera@gmail.com","status":1},"ip":"223.123.12.130","description":"User updated"}	2025-06-18 12:10:06	2025-06-18 12:10:06	updated	\N
456	user	User created	App\\Models\\User	59	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama12@gmail.com","status":1},"ip":"182.183.57.227","description":"User created"}	2025-06-18 13:33:50	2025-06-18 13:33:50	created	\N
457	user	User updated	App\\Models\\User	59	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama12@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama12@gmail.com","status":1},"ip":"182.183.57.227","description":"User updated"}	2025-06-18 13:33:51	2025-06-18 13:33:51	updated	\N
458	user	User updated	App\\Models\\User	59	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama12@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama12@gmail.com","status":1},"ip":"182.183.57.227","description":"User updated"}	2025-06-18 13:33:52	2025-06-18 13:33:52	updated	\N
459	user	User updated	App\\Models\\User	59	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama12@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama12@gmail.com","status":1},"ip":"182.183.57.227","description":"User updated"}	2025-06-18 19:44:44	2025-06-18 19:44:44	updated	\N
460	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"ip":"117.254.8.116","description":"User updated"}	2025-06-19 02:31:37	2025-06-19 02:31:37	updated	\N
461	user	User updated	App\\Models\\User	59	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama12@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama12@gmail.com","status":1},"ip":"182.183.57.227","description":"User updated"}	2025-06-19 06:17:00	2025-06-19 06:17:00	updated	\N
462	user	User created	App\\Models\\User	60	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"ip":"182.183.57.227","description":"User created"}	2025-06-19 06:19:31	2025-06-19 06:19:31	created	\N
463	user	User updated	App\\Models\\User	60	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"ip":"182.183.57.227","description":"User updated"}	2025-06-19 06:19:31	2025-06-19 06:19:31	updated	\N
464	user	User updated	App\\Models\\User	60	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"ip":"182.183.57.227","description":"User updated"}	2025-06-19 06:19:32	2025-06-19 06:19:32	updated	\N
465	user	User created	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User created"}	2025-06-19 08:55:15	2025-06-19 08:55:15	created	\N
466	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-19 08:55:15	2025-06-19 08:55:15	updated	\N
467	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-19 08:55:16	2025-06-19 08:55:16	updated	\N
468	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-19 08:57:37	2025-06-19 08:57:37	updated	\N
469	user	User created	App\\Models\\User	62	\N	\N	{"attributes":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"ip":"86.98.14.154","description":"User created"}	2025-06-19 11:59:36	2025-06-19 11:59:36	created	\N
470	user	User updated	App\\Models\\User	62	\N	\N	{"attributes":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"old":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"ip":"86.98.14.154","description":"User updated"}	2025-06-19 11:59:36	2025-06-19 11:59:36	updated	\N
471	user	User updated	App\\Models\\User	62	\N	\N	{"attributes":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"old":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"ip":"86.98.14.154","description":"User updated"}	2025-06-19 11:59:37	2025-06-19 11:59:37	updated	\N
472	user	User updated	App\\Models\\User	62	\N	\N	{"attributes":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"old":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"ip":"86.98.14.154","description":"User updated"}	2025-06-19 12:04:37	2025-06-19 12:04:37	updated	\N
473	user	User created	App\\Models\\User	63	\N	\N	{"attributes":{"first_name":"Leena","last_name":"Meetha","email":"leena@gmail.com","status":1},"ip":"86.98.14.154","description":"User created"}	2025-06-19 12:15:40	2025-06-19 12:15:40	created	\N
474	user	User updated	App\\Models\\User	63	\N	\N	{"attributes":{"first_name":"Leena","last_name":"Meetha","email":"leena@gmail.com","status":1},"old":{"first_name":"Leena","last_name":"Meetha","email":"leena@gmail.com","status":1},"ip":"86.98.14.154","description":"User updated"}	2025-06-19 12:15:40	2025-06-19 12:15:40	updated	\N
475	user	User updated	App\\Models\\User	63	\N	\N	{"attributes":{"first_name":"Leena","last_name":"Meetha","email":"leena@gmail.com","status":1},"old":{"first_name":"Leena","last_name":"Meetha","email":"leena@gmail.com","status":1},"ip":"86.98.14.154","description":"User updated"}	2025-06-19 12:15:41	2025-06-19 12:15:41	updated	\N
476	user	User updated	App\\Models\\User	63	\N	\N	{"attributes":{"first_name":"Leena","last_name":"Meetha","email":"leena@gmail.com","status":1},"old":{"first_name":"Leena","last_name":"Meetha","email":"leena@gmail.com","status":1},"ip":"86.98.14.154","description":"User updated"}	2025-06-19 12:17:26	2025-06-19 12:17:26	updated	\N
477	journey	Journey created	App\\Models\\Journey	38	\N	\N	{"attributes":{"title":"Trip to Salalah","description":null,"status":null},"ip":"86.98.14.154","description":"Journey created"}	2025-06-19 12:29:05	2025-06-19 12:29:05	created	\N
478	user	User updated	App\\Models\\User	62	\N	\N	{"attributes":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"old":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"ip":"86.98.14.154","description":"User updated"}	2025-06-19 12:39:56	2025-06-19 12:39:56	updated	\N
479	user	User updated	App\\Models\\User	63	\N	\N	{"attributes":{"first_name":"Leena","last_name":"Meetha","email":"leena@gmail.com","status":1},"old":{"first_name":"Leena","last_name":"Meetha","email":"leena@gmail.com","status":1},"ip":"86.98.14.154","description":"User updated"}	2025-06-19 12:41:44	2025-06-19 12:41:44	updated	\N
480	journey	Journey created	App\\Models\\Journey	39	\N	\N	{"attributes":{"title":"Burj ul Arab Journey","description":null,"status":null},"ip":"86.98.14.154","description":"Journey created"}	2025-06-19 13:07:19	2025-06-19 13:07:19	created	\N
481	user	User updated	App\\Models\\User	56	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"ip":"223.123.18.135","description":"User updated"}	2025-06-20 05:20:56	2025-06-20 05:20:56	updated	\N
482	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.18.135","description":"User updated"}	2025-06-20 05:40:20	2025-06-20 05:40:20	updated	\N
483	user	User updated	App\\Models\\User	56	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"ip":"223.123.18.135","description":"User updated"}	2025-06-20 05:41:53	2025-06-20 05:41:53	updated	\N
484	journey	Journey created	App\\Models\\Journey	40	\N	\N	{"attributes":{"title":"Creater test","description":null,"status":null},"ip":"223.123.18.135","description":"Journey created"}	2025-06-20 06:53:50	2025-06-20 06:53:50	created	\N
485	journey	Journey created	App\\Models\\Journey	41	\N	\N	{"attributes":{"title":"Member test","description":null,"status":null},"ip":"223.123.18.135","description":"Journey created"}	2025-06-20 07:03:48	2025-06-20 07:03:48	created	\N
486	user	User updated	App\\Models\\User	56	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"ip":"157.51.212.151","description":"User updated"}	2025-06-20 07:46:24	2025-06-20 07:46:24	updated	\N
487	user	User updated	App\\Models\\User	56	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"ip":"157.51.212.151","description":"User updated"}	2025-06-20 07:49:57	2025-06-20 07:49:57	updated	\N
488	user	User updated	App\\Models\\User	56	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"ip":"157.51.212.151","description":"User updated"}	2025-06-20 07:50:10	2025-06-20 07:50:10	updated	\N
489	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"ip":"59.182.234.244","description":"User updated"}	2025-06-20 10:15:08	2025-06-20 10:15:08	updated	\N
490	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"ip":"59.182.234.244","description":"User updated"}	2025-06-20 10:18:51	2025-06-20 10:18:51	updated	\N
491	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"ip":"59.182.234.244","description":"User updated"}	2025-06-20 10:23:05	2025-06-20 10:23:05	updated	\N
492	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"ip":"59.182.234.244","description":"User updated"}	2025-06-20 10:24:14	2025-06-20 10:24:14	updated	\N
493	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"Developer","last_name":"sam","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"sooraj","last_name":"sabu","email":"sooraj117@yopmail.com","status":1},"ip":"59.182.234.244","description":"User updated"}	2025-06-20 10:26:14	2025-06-20 10:26:14	updated	\N
494	journey	Journey updated	App\\Models\\Journey	41	\N	\N	{"attributes":{"title":"Member test","description":null,"status":null},"old":{"title":"Member test","description":null,"status":null},"ip":"223.123.9.196","description":"Journey updated"}	2025-06-20 18:13:43	2025-06-20 18:13:43	updated	\N
495	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-21 03:00:04	2025-06-21 03:00:04	updated	\N
496	journey	Journey created	App\\Models\\Journey	42	\N	\N	{"attributes":{"title":"Dubai Tour","description":null,"status":null},"ip":"49.37.227.13","description":"Journey created"}	2025-06-21 03:10:40	2025-06-21 03:10:40	created	\N
497	journey	Journey created	App\\Models\\Journey	43	\N	\N	{"attributes":{"title":"Member test","description":null,"status":null},"ip":"223.123.10.80","description":"Journey created"}	2025-06-21 14:42:06	2025-06-21 14:42:06	created	\N
498	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-22 01:09:34	2025-06-22 01:09:34	updated	\N
499	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-22 04:18:02	2025-06-22 04:18:02	updated	\N
500	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-22 05:12:25	2025-06-22 05:12:25	updated	\N
501	journey	Journey created	App\\Models\\Journey	44	\N	\N	{"attributes":{"title":"Dubai Marina Trip","description":null,"status":null},"ip":"49.37.227.13","description":"Journey created"}	2025-06-22 05:27:14	2025-06-22 05:27:14	created	\N
502	user	User updated	App\\Models\\User	58	\N	\N	{"attributes":{"first_name":"Ameera","last_name":"Raza","email":"ameera@gmail.com","status":1},"old":{"first_name":"Ameera","last_name":"Raza","email":"ameera@gmail.com","status":1},"ip":"223.123.3.195","description":"User updated"}	2025-06-22 05:54:08	2025-06-22 05:54:08	updated	\N
503	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"51.158.244.198","description":"User updated"}	2025-06-22 15:29:38	2025-06-22 15:29:38	updated	\N
504	user	User updated	App\\Models\\User	56	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"ip":"51.158.244.198","description":"User updated"}	2025-06-22 15:33:58	2025-06-22 15:33:58	updated	\N
505	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-22 16:12:15	2025-06-22 16:12:15	updated	\N
506	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.0.166","description":"User updated"}	2025-06-23 06:16:48	2025-06-23 06:16:48	updated	\N
507	user	User updated	App\\Models\\User	56	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"ip":"223.123.0.166","description":"User updated"}	2025-06-23 06:50:29	2025-06-23 06:50:29	updated	\N
508	user	User updated	App\\Models\\User	58	\N	\N	{"attributes":{"first_name":"Ameera","last_name":"Raza","email":"ameera@gmail.com","status":1},"old":{"first_name":"Ameera","last_name":"Raza","email":"ameera@gmail.com","status":1},"ip":"223.123.0.166","description":"User updated"}	2025-06-23 06:57:47	2025-06-23 06:57:47	updated	\N
509	user	User updated	App\\Models\\User	58	\N	\N	{"attributes":{"first_name":"Ameera","last_name":"Raza","email":"ameera@gmail.com","status":1},"old":{"first_name":"Ameera","last_name":"Raza","email":"ameera@gmail.com","status":1},"ip":"223.123.0.166","description":"User updated"}	2025-06-23 07:00:18	2025-06-23 07:00:18	updated	\N
510	user	User updated	App\\Models\\User	58	\N	\N	{"attributes":{"first_name":"Ameera","last_name":"Raza","email":"ameera@gmail.com","status":1},"old":{"first_name":"Ameera","last_name":"Raza","email":"ameera@gmail.com","status":1},"ip":"223.123.0.166","description":"User updated"}	2025-06-23 07:00:33	2025-06-23 07:00:33	updated	\N
511	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.0.166","description":"User updated"}	2025-06-23 07:01:56	2025-06-23 07:01:56	updated	\N
512	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.0.166","description":"User updated"}	2025-06-23 07:03:16	2025-06-23 07:03:16	updated	\N
513	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.0.166","description":"User updated"}	2025-06-23 07:03:31	2025-06-23 07:03:31	updated	\N
514	user	User updated	App\\Models\\User	56	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"ip":"223.123.0.166","description":"User updated"}	2025-06-23 07:15:20	2025-06-23 07:15:20	updated	\N
515	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-23 10:32:35	2025-06-23 10:32:35	updated	\N
516	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-23 10:36:11	2025-06-23 10:36:11	updated	\N
517	user	User updated	App\\Models\\User	62	\N	\N	{"attributes":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"old":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"ip":"86.98.14.154","description":"User updated"}	2025-06-23 10:42:38	2025-06-23 10:42:38	updated	\N
518	user	User updated	App\\Models\\User	62	\N	\N	{"attributes":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"old":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"ip":"86.98.14.154","description":"User updated"}	2025-06-23 10:44:34	2025-06-23 10:44:34	updated	\N
519	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-23 10:46:20	2025-06-23 10:46:20	updated	\N
520	user	User updated	App\\Models\\User	63	\N	\N	{"attributes":{"first_name":"Leena","last_name":"Meetha","email":"leena@gmail.com","status":1},"old":{"first_name":"Leena","last_name":"Meetha","email":"leena@gmail.com","status":1},"ip":"86.98.14.154","description":"User updated"}	2025-06-23 10:51:20	2025-06-23 10:51:20	updated	\N
521	user	User updated	App\\Models\\User	62	\N	\N	{"attributes":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"old":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"ip":"86.98.14.154","description":"User updated"}	2025-06-23 11:13:42	2025-06-23 11:13:42	updated	\N
522	user	User updated	App\\Models\\User	58	\N	\N	{"attributes":{"first_name":"Ameera","last_name":"Raza","email":"ameera@gmail.com","status":1},"old":{"first_name":"Ameera","last_name":"Raza","email":"ameera@gmail.com","status":1},"ip":"223.123.0.166","description":"User updated"}	2025-06-23 11:43:47	2025-06-23 11:43:47	updated	\N
523	user	User updated	App\\Models\\User	62	\N	\N	{"attributes":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"old":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"ip":"86.98.14.154","description":"User updated"}	2025-06-23 12:11:17	2025-06-23 12:11:17	updated	\N
524	journey	Journey created	App\\Models\\Journey	45	\N	\N	{"attributes":{"title":"London Bridge","description":null,"status":null},"ip":"86.98.14.154","description":"Journey created"}	2025-06-23 12:18:33	2025-06-23 12:18:33	created	\N
525	user	User updated	App\\Models\\User	58	\N	\N	{"attributes":{"first_name":"Ameera","last_name":"Raza","email":"ameera@gmail.com","status":1},"old":{"first_name":"Ameera","last_name":"Raza","email":"ameera@gmail.com","status":1},"ip":"223.123.0.166","description":"User updated"}	2025-06-23 12:24:40	2025-06-23 12:24:40	updated	\N
526	user	User updated	App\\Models\\User	56	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"ip":"223.123.0.166","description":"User updated"}	2025-06-23 12:25:35	2025-06-23 12:25:35	updated	\N
527	user	User updated	App\\Models\\User	56	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"ip":"223.123.0.166","description":"User updated"}	2025-06-23 12:25:53	2025-06-23 12:25:53	updated	\N
528	user	User updated	App\\Models\\User	58	\N	\N	{"attributes":{"first_name":"Ameera","last_name":"Raza","email":"ameera@gmail.com","status":1},"old":{"first_name":"Ameera","last_name":"Raza","email":"ameera@gmail.com","status":1},"ip":"223.123.0.166","description":"User updated"}	2025-06-23 12:56:46	2025-06-23 12:56:46	updated	\N
529	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.0.166","description":"User updated"}	2025-06-23 12:57:08	2025-06-23 12:57:08	updated	\N
530	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-23 13:48:03	2025-06-23 13:48:03	updated	\N
531	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-23 15:58:27	2025-06-23 15:58:27	updated	\N
532	user	User updated	App\\Models\\User	60	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"ip":"182.183.108.187","description":"User updated"}	2025-06-23 20:10:49	2025-06-23 20:10:49	updated	\N
533	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-23 23:36:25	2025-06-23 23:36:25	updated	\N
534	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"Developer","last_name":"sam","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"Developer","last_name":"sam","email":"sooraj117@yopmail.com","status":1},"ip":"59.182.229.59","description":"User updated"}	2025-06-24 05:06:36	2025-06-24 05:06:36	updated	\N
535	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-24 05:23:13	2025-06-24 05:23:13	updated	\N
536	user	User updated	App\\Models\\User	62	\N	\N	{"attributes":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"old":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"ip":"86.98.14.154","description":"User updated"}	2025-06-24 06:06:49	2025-06-24 06:06:49	updated	\N
537	user	User updated	App\\Models\\User	63	\N	\N	{"attributes":{"first_name":"Leena","last_name":"Meetha","email":"leena@gmail.com","status":1},"old":{"first_name":"Leena","last_name":"Meetha","email":"leena@gmail.com","status":1},"ip":"86.98.14.154","description":"User updated"}	2025-06-24 06:07:21	2025-06-24 06:07:21	updated	\N
538	journey	Journey created	App\\Models\\Journey	46	\N	\N	{"attributes":{"title":"Egypt","description":null,"status":null},"ip":"86.98.14.154","description":"Journey created"}	2025-06-24 06:48:18	2025-06-24 06:48:18	created	\N
539	user	User updated	App\\Models\\User	62	\N	\N	{"attributes":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"old":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"ip":"86.98.14.154","description":"User updated"}	2025-06-24 07:45:23	2025-06-24 07:45:23	updated	\N
540	user	User updated	App\\Models\\User	62	\N	\N	{"attributes":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"old":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"ip":"86.98.14.154","description":"User updated"}	2025-06-24 08:01:11	2025-06-24 08:01:11	updated	\N
541	user	User created	App\\Models\\User	64	\N	\N	{"attributes":{"first_name":"anil","last_name":"navis","email":"bb@gh.com","status":1},"ip":"49.37.227.13","description":"User created"}	2025-06-24 09:49:50	2025-06-24 09:49:50	created	\N
542	user	User updated	App\\Models\\User	64	\N	\N	{"attributes":{"first_name":"anil","last_name":"navis","email":"bb@gh.com","status":1},"old":{"first_name":"anil","last_name":"navis","email":"bb@gh.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-24 09:49:50	2025-06-24 09:49:50	updated	\N
543	user	User updated	App\\Models\\User	64	\N	\N	{"attributes":{"first_name":"anil","last_name":"navis","email":"bb@gh.com","status":1},"old":{"first_name":"anil","last_name":"navis","email":"bb@gh.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-24 09:49:51	2025-06-24 09:49:51	updated	\N
544	user	User updated	App\\Models\\User	59	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama12@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama12@gmail.com","status":1},"ip":"182.183.108.187","description":"User updated"}	2025-06-24 10:36:14	2025-06-24 10:36:14	updated	\N
545	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-24 10:58:31	2025-06-24 10:58:31	updated	\N
546	user	User updated	App\\Models\\User	60	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"ip":"182.183.108.187","description":"User updated"}	2025-06-24 11:11:18	2025-06-24 11:11:18	updated	\N
547	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.10.244","description":"User updated"}	2025-06-24 11:34:08	2025-06-24 11:34:08	updated	\N
548	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.10.244","description":"User updated"}	2025-06-24 11:34:09	2025-06-24 11:34:09	updated	\N
549	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.10.244","description":"User updated"}	2025-06-24 11:34:10	2025-06-24 11:34:10	updated	\N
550	user	User updated	App\\Models\\User	60	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"ip":"182.183.108.187","description":"User updated"}	2025-06-24 11:49:27	2025-06-24 11:49:27	updated	\N
551	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"59.182.229.59","description":"User updated"}	2025-06-24 12:16:02	2025-06-24 12:16:02	updated	\N
552	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"59.182.229.59","description":"User updated"}	2025-06-24 12:16:04	2025-06-24 12:16:04	updated	\N
553	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"59.182.229.59","description":"User updated"}	2025-06-24 12:16:06	2025-06-24 12:16:06	updated	\N
554	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.10.244","description":"User updated"}	2025-06-24 12:17:12	2025-06-24 12:17:12	updated	\N
555	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.10.244","description":"User updated"}	2025-06-24 12:17:19	2025-06-24 12:17:19	updated	\N
556	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.10.244","description":"User updated"}	2025-06-24 12:17:25	2025-06-24 12:17:25	updated	\N
557	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.10.244","description":"User updated"}	2025-06-24 12:17:31	2025-06-24 12:17:31	updated	\N
558	user	User updated	App\\Models\\User	60	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"ip":"182.183.108.187","description":"User updated"}	2025-06-24 13:03:02	2025-06-24 13:03:02	updated	\N
559	user	User updated	App\\Models\\User	56	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"ip":"223.123.10.244","description":"User updated"}	2025-06-24 14:05:18	2025-06-24 14:05:18	updated	\N
560	user	User updated	App\\Models\\User	60	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"ip":"182.183.108.187","description":"User updated"}	2025-06-24 14:25:24	2025-06-24 14:25:24	updated	\N
561	user	User updated	App\\Models\\User	56	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamd34@gmail.com","status":1},"ip":"223.123.10.244","description":"User updated"}	2025-06-24 14:57:12	2025-06-24 14:57:12	updated	\N
562	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-24 16:47:18	2025-06-24 16:47:18	updated	\N
563	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-24 16:50:59	2025-06-24 16:50:59	updated	\N
564	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-24 16:51:01	2025-06-24 16:51:01	updated	\N
565	user	User updated	App\\Models\\User	60	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"ip":"182.183.46.164","description":"User updated"}	2025-06-24 17:51:19	2025-06-24 17:51:19	updated	\N
566	user	User updated	App\\Models\\User	60	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"ip":"182.183.46.164","description":"User updated"}	2025-06-24 18:05:34	2025-06-24 18:05:34	updated	\N
568	user	User updated	App\\Models\\User	60	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"ip":"182.183.46.164","description":"User updated"}	2025-06-24 18:12:03	2025-06-24 18:12:03	updated	\N
569	journey	Journey created	App\\Models\\Journey	48	\N	\N	{"attributes":{"title":"day test","description":null,"status":null},"ip":"51.158.232.49","description":"Journey created"}	2025-06-24 18:14:25	2025-06-24 18:14:25	created	\N
570	user	User updated	App\\Models\\User	60	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"ip":"182.183.46.164","description":"User updated"}	2025-06-24 18:53:29	2025-06-24 18:53:29	updated	\N
571	user	User updated	App\\Models\\User	59	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama12@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama12@gmail.com","status":1},"ip":"182.183.46.164","description":"User updated"}	2025-06-24 19:29:57	2025-06-24 19:29:57	updated	\N
572	user	User updated	App\\Models\\User	60	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"ip":"182.183.46.164","description":"User updated"}	2025-06-24 19:59:50	2025-06-24 19:59:50	updated	\N
573	user	User updated	App\\Models\\User	60	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"ip":"182.183.46.164","description":"User updated"}	2025-06-24 20:14:58	2025-06-24 20:14:58	updated	\N
574	user	User updated	App\\Models\\User	60	\N	\N	{"attributes":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"old":{"first_name":"Usama","last_name":"Shakeel","email":"usama22@gmail.com","status":1},"ip":"182.183.46.164","description":"User updated"}	2025-06-24 20:19:00	2025-06-24 20:19:00	updated	\N
575	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-25 02:45:20	2025-06-25 02:45:20	updated	\N
576	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-25 03:02:54	2025-06-25 03:02:54	updated	\N
577	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-25 03:02:55	2025-06-25 03:02:55	updated	\N
578	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-25 03:02:56	2025-06-25 03:02:56	updated	\N
579	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-25 03:02:57	2025-06-25 03:02:57	updated	\N
580	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-25 03:02:58	2025-06-25 03:02:58	updated	\N
581	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-25 03:02:58	2025-06-25 03:02:58	updated	\N
582	user	User updated	App\\Models\\User	61	\N	\N	{"attributes":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"old":{"first_name":"anil","last_name":"nahis","email":"anil73@gmail.com","status":1},"ip":"49.37.227.13","description":"User updated"}	2025-06-25 03:03:09	2025-06-25 03:03:09	updated	\N
583	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"Developer","last_name":"sam","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"Developer","last_name":"sam","email":"sooraj117@yopmail.com","status":1},"ip":"117.244.199.254","description":"User updated"}	2025-06-25 05:12:18	2025-06-25 05:12:18	updated	\N
584	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.9.118","description":"User updated"}	2025-06-25 05:27:40	2025-06-25 05:27:40	updated	\N
585	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.9.118","description":"User updated"}	2025-06-25 05:27:41	2025-06-25 05:27:41	updated	\N
586	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.9.118","description":"User updated"}	2025-06-25 05:27:41	2025-06-25 05:27:41	updated	\N
587	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.9.118","description":"User updated"}	2025-06-25 05:27:43	2025-06-25 05:27:43	updated	\N
588	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.9.118","description":"User updated"}	2025-06-25 05:27:43	2025-06-25 05:27:43	updated	\N
589	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.9.118","description":"User updated"}	2025-06-25 05:27:44	2025-06-25 05:27:44	updated	\N
590	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.9.118","description":"User updated"}	2025-06-25 05:27:44	2025-06-25 05:27:44	updated	\N
591	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.9.118","description":"User updated"}	2025-06-25 05:27:45	2025-06-25 05:27:45	updated	\N
592	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.9.118","description":"User updated"}	2025-06-25 05:27:46	2025-06-25 05:27:46	updated	\N
593	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.9.118","description":"User updated"}	2025-06-25 05:27:47	2025-06-25 05:27:47	updated	\N
594	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.9.118","description":"User updated"}	2025-06-25 05:27:47	2025-06-25 05:27:47	updated	\N
595	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"Developer","last_name":"sam","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"Developer","last_name":"sam","email":"sooraj117@yopmail.com","status":1},"ip":"117.244.199.254","description":"User updated"}	2025-06-25 05:44:16	2025-06-25 05:44:16	updated	\N
596	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"Developer","last_name":"sam","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"Developer","last_name":"sam","email":"sooraj117@yopmail.com","status":1},"ip":"117.244.199.254","description":"User updated"}	2025-06-25 05:50:25	2025-06-25 05:50:25	updated	\N
597	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"Developer","last_name":"sam","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"Developer","last_name":"sam","email":"sooraj117@yopmail.com","status":1},"ip":"117.244.199.254","description":"User updated"}	2025-06-25 05:51:36	2025-06-25 05:51:36	updated	\N
598	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"Developer","last_name":"sam","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"Developer","last_name":"sam","email":"sooraj117@yopmail.com","status":1},"ip":"117.244.199.254","description":"User updated"}	2025-06-25 05:54:13	2025-06-25 05:54:13	updated	\N
599	user	User updated	App\\Models\\User	62	\N	\N	{"attributes":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"old":{"first_name":"Ayesha","last_name":"Tariq","email":"hibaejaz97+2@gmail.com","status":1},"ip":"86.98.14.154","description":"User updated"}	2025-06-25 05:55:14	2025-06-25 05:55:14	updated	\N
600	user	User updated	App\\Models\\User	38	\N	\N	{"attributes":{"first_name":"Developer","last_name":"sam","email":"sooraj117@yopmail.com","status":1},"old":{"first_name":"Developer","last_name":"sam","email":"sooraj117@yopmail.com","status":1},"ip":"117.244.199.254","description":"User updated"}	2025-06-25 05:56:54	2025-06-25 05:56:54	updated	\N
601	user	User updated	App\\Models\\User	55	\N	\N	{"attributes":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"old":{"first_name":"Hamid","last_name":"Raza","email":"razahamid34@gmail.com","status":1},"ip":"223.123.9.118","description":"User updated"}	2025-06-25 05:58:10	2025-06-25 05:58:10	updated	\N
602	user	User updated	App\\Models\\User	63	\N	\N	{"attributes":{"first_name":"Leena","last_name":"Meetha","email":"leena@gmail.com","status":1},"old":{"first_name":"Leena","last_name":"Meetha","email":"leena@gmail.com","status":1},"ip":"86.98.14.154","description":"User updated"}	2025-06-25 06:00:05	2025-06-25 06:00:05	updated	\N
\.


--
-- Data for Name: block_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.block_users (id, user_id, blocked_user_id, created_at, updated_at, remark) FROM stdin;
\.


--
-- Data for Name: bookmarks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookmarks (id, user_id, journey_id, created_at, updated_at) FROM stdin;
3	37	25	\N	\N
6	37	17	\N	\N
12	37	32	\N	\N
13	37	30	\N	\N
14	37	23	\N	\N
17	54	34	\N	\N
21	56	41	\N	\N
22	56	36	\N	\N
24	58	43	\N	\N
28	60	45	\N	\N
30	60	38	\N	\N
32	38	35	2025-06-24 12:11:49	2025-06-24 12:11:49
33	38	41	2025-06-24 12:11:49	2025-06-24 12:11:49
34	38	43	2025-06-24 12:11:49	2025-06-24 12:11:49
37	55	47	\N	\N
38	61	48	\N	\N
39	62	46	\N	\N
40	62	45	\N	\N
41	60	46	\N	\N
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
15	1	13	sdf	f	2025-05-19 09:44:53	2025-05-19 09:44:53
16	1	13	sdf	f	2025-05-19 09:44:53	2025-05-19 09:44:53
17	12	14	ligheter	f	2025-05-20 11:42:29	2025-05-20 11:42:29
18	12	14	dress	f	2025-05-20 11:42:29	2025-05-20 11:42:29
23	1	15	test 1, test 2, test 3	f	2025-05-25 02:12:12	2025-05-25 02:12:12
24	1	15	test 4	f	2025-05-25 02:12:12	2025-05-25 02:12:12
25	35	16	check list 1	f	2025-05-25 12:54:02	2025-05-25 12:54:02
26	35	17	Passport 	f	2025-05-26 08:45:51	2025-05-26 08:45:51
27	35	17	Emirates Id	f	2025-05-26 08:45:51	2025-05-26 08:45:51
28	35	17	Food items like water	f	2025-05-26 08:45:51	2025-05-26 08:45:51
29	35	17	 bread	f	2025-05-26 08:45:51	2025-05-26 08:45:51
30	35	17	visa copy	f	2025-05-26 08:45:51	2025-05-26 08:45:51
31	37	18	check list 1	f	2025-06-02 06:01:50	2025-06-02 06:01:50
32	37	18	check list 2	f	2025-06-02 06:01:50	2025-06-02 06:01:50
33	37	19	check	f	2025-06-02 06:48:23	2025-06-02 06:48:23
34	37	20	checklist 1	f	2025-06-02 08:23:50	2025-06-02 08:23:50
35	37	21	check list	f	2025-06-02 09:06:55	2025-06-02 09:06:55
38	35	23	pasport	f	2025-06-03 09:08:29	2025-06-03 09:08:29
39	35	23	visa	f	2025-06-03 09:08:29	2025-06-03 09:08:29
40	35	23	medicine	f	2025-06-03 09:08:29	2025-06-03 09:08:29
41	37	24	check list 1	f	2025-06-03 09:11:14	2025-06-03 09:11:14
42	37	25	tedt check	f	2025-06-03 09:13:11	2025-06-03 09:13:11
43	37	26	tedt check	f	2025-06-03 09:15:29	2025-06-03 09:15:29
44	37	27	tedt check	f	2025-06-03 09:24:30	2025-06-03 09:24:30
49	37	22	Check list 1	f	2025-06-03 11:17:55	2025-06-03 11:17:55
50	37	22	check list 2ee	f	2025-06-03 11:17:55	2025-06-03 11:17:55
51	38	28	passport	f	2025-06-04 12:46:48	2025-06-04 12:46:48
52	38	28	visa	f	2025-06-04 12:46:48	2025-06-04 12:46:48
53	38	28	dtyy	f	2025-06-04 12:46:48	2025-06-04 12:46:48
54	37	29	Checklist 1	f	2025-06-05 06:46:37	2025-06-05 06:46:37
62	48	30	Passports	f	2025-06-07 07:23:29	2025-06-07 07:23:29
63	48	30	Visa	f	2025-06-07 07:23:29	2025-06-07 07:23:29
64	48	30	Track Suite	f	2025-06-07 07:23:29	2025-06-07 07:23:29
65	48	30	Sun screen	f	2025-06-07 07:23:29	2025-06-07 07:23:29
66	48	30	Sun Glass	f	2025-06-07 07:23:29	2025-06-07 07:23:29
67	48	30	Drinking Water 5 Bottle	f	2025-06-07 07:23:29	2025-06-07 07:23:29
68	48	30	Medicine	f	2025-06-07 07:23:29	2025-06-07 07:23:29
69	48	30	Backpack	f	2025-06-07 07:23:29	2025-06-07 07:23:29
70	48	31	passport 	f	2025-06-07 07:53:05	2025-06-07 07:53:05
71	48	31	hisa	f	2025-06-07 07:53:05	2025-06-07 07:53:05
72	37	32	checklist.	f	2025-06-09 05:45:42	2025-06-09 05:45:42
73	51	33	visa	f	2025-06-10 07:37:04	2025-06-10 07:37:04
74	51	33	passport	f	2025-06-10 07:37:04	2025-06-10 07:37:04
75	37	34	check 1	f	2025-06-11 13:45:25	2025-06-11 13:45:25
76	37	34	check 2	f	2025-06-11 13:45:25	2025-06-11 13:45:25
78	55	35	hamid	f	2025-06-16 16:37:44	2025-06-16 16:37:44
79	55	35	raza	f	2025-06-16 16:37:44	2025-06-16 16:37:44
80	55	36	hicking	f	2025-06-16 16:39:55	2025-06-16 16:39:55
81	55	37	hello	f	2025-06-16 16:51:02	2025-06-16 16:51:02
82	62	38	Passport 	f	2025-06-19 12:29:05	2025-06-19 12:29:05
83	62	38	Emirates ID	f	2025-06-19 12:29:05	2025-06-19 12:29:05
84	62	38	Hotel Booking 	f	2025-06-19 12:29:05	2025-06-19 12:29:05
85	62	38	Medicine	f	2025-06-19 12:29:05	2025-06-19 12:29:05
86	63	39	Hotel reservations 	f	2025-06-19 13:07:19	2025-06-19 13:07:19
87	63	39	Emirates ID	f	2025-06-19 13:07:19	2025-06-19 13:07:19
89	61	42	pass	f	2025-06-21 03:10:40	2025-06-21 03:10:40
90	61	42	tyuuui	f	2025-06-21 03:10:40	2025-06-21 03:10:40
91	61	42	tyyu	f	2025-06-21 03:10:40	2025-06-21 03:10:40
92	61	42	tuui	f	2025-06-21 03:10:40	2025-06-21 03:10:40
93	58	43	ch3cklist	f	2025-06-21 14:42:06	2025-06-21 14:42:06
94	58	43	one	f	2025-06-21 14:42:06	2025-06-21 14:42:06
95	58	43	tqo	f	2025-06-21 14:42:06	2025-06-21 14:42:06
96	56	41	food	f	2025-06-21 15:04:03	2025-06-21 15:04:03
97	56	41	heelo	f	2025-06-21 15:04:03	2025-06-21 15:04:03
98	61	44	Life Jacket	f	2025-06-22 05:27:14	2025-06-22 05:27:14
99	61	44	climbing rop	f	2025-06-22 05:27:14	2025-06-22 05:27:14
100	61	44	fist aid box	f	2025-06-22 05:27:14	2025-06-22 05:27:14
101	61	44	Mask	f	2025-06-22 05:27:14	2025-06-22 05:27:14
102	61	44	Sweaters	f	2025-06-22 05:27:14	2025-06-22 05:27:14
103	61	44	Sunscreen	f	2025-06-22 05:27:14	2025-06-22 05:27:14
104	61	44	Back pack	f	2025-06-22 05:27:14	2025-06-22 05:27:14
105	61	44	Mineral water 5liter	f	2025-06-22 05:27:14	2025-06-22 05:27:14
106	61	44	Passport and Visa	f	2025-06-22 05:27:14	2025-06-22 05:27:14
107	61	44	Health Insurance	f	2025-06-22 05:27:14	2025-06-22 05:27:14
108	62	45	Passport 	f	2025-06-23 12:18:33	2025-06-23 12:18:33
109	62	45	Visa 	f	2025-06-23 12:18:33	2025-06-23 12:18:33
110	62	45	Medical Insurance 	f	2025-06-23 12:18:33	2025-06-23 12:18:33
111	62	45	Medical Kit	f	2025-06-23 12:18:33	2025-06-23 12:18:33
112	62	46	Passport 	f	2025-06-24 06:48:18	2025-06-24 06:48:18
113	62	46	Visa	f	2025-06-24 06:48:18	2025-06-24 06:48:18
114	62	46	Air tickets	f	2025-06-24 06:48:18	2025-06-24 06:48:18
115	62	46	medical Insurance	f	2025-06-24 06:48:18	2025-06-24 06:48:18
116	55	47	Check one	f	2025-06-24 18:11:14	2025-06-24 18:11:14
117	55	48	passport	f	2025-06-24 18:14:25	2025-06-24 18:14:25
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
-- Data for Name: contact_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_details (id, name, value, icon, status, created_at, updated_at) FROM stdin;
1	facebook	https://facebook.com	icon.png	1	\N	\N
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
19	8	dfg	55	\N	2025-05-19 09:45:25	2025-05-19 09:45:25
20	9	Flight ticket	150-250	0	2025-05-20 11:42:29	2025-05-20 11:42:29
21	9	kochi-dubai	2	20	2025-05-20 11:42:29	2025-05-20 11:42:29
22	9	kochi-dubai	2	20	2025-05-20 11:42:29	2025-05-20 11:42:29
23	10	Hotle	250-300	0	2025-05-20 11:42:29	2025-05-20 11:42:29
24	10	Dubai	12	23	2025-05-20 11:42:29	2025-05-20 11:42:29
32	13	Item 1	200	0	2025-05-25 12:54:02	2025-05-25 12:54:02
33	13	S1	100	32	2025-05-25 12:54:02	2025-05-25 12:54:02
34	13	S11	100	32	2025-05-25 12:54:02	2025-05-25 12:54:02
35	14	flight	500-600	0	2025-05-26 08:45:51	2025-05-26 08:45:51
36	14	visa	300	35	2025-05-26 08:45:51	2025-05-26 08:45:51
37	14	food	200	35	2025-05-26 08:45:51	2025-05-26 08:45:51
38	15	Item 1	200	0	2025-06-02 06:01:50	2025-06-02 06:01:50
39	15	iitem sub 1	100	38	2025-06-02 06:01:50	2025-06-02 06:01:50
40	15	item sub 11	100	38	2025-06-02 06:01:50	2025-06-02 06:01:50
41	16	item 2	100	0	2025-06-02 06:01:50	2025-06-02 06:01:50
42	16	item sub 2	100	41	2025-06-02 06:01:50	2025-06-02 06:01:50
43	17	item 1	100	0	2025-06-02 06:48:23	2025-06-02 06:48:23
44	17	sub 1	100	43	2025-06-02 06:48:23	2025-06-02 06:48:23
45	18	cost item	200	0	2025-06-02 08:23:50	2025-06-02 08:23:50
46	19	item 1	100	0	2025-06-02 09:06:55	2025-06-02 09:06:55
47	19	subitem	100	46	2025-06-02 09:06:55	2025-06-02 09:06:55
48	20	Item 1	200	0	2025-06-03 05:15:48	2025-06-03 05:15:48
49	20	Sub item 1	100	48	2025-06-03 05:15:48	2025-06-03 05:15:48
50	20	Sub item 11	100	48	2025-06-03 05:15:48	2025-06-03 05:15:48
51	21	airpockry	45	0	2025-06-03 09:08:29	2025-06-03 09:08:29
52	21	frf	345	51	2025-06-03 09:08:29	2025-06-03 09:08:29
53	22	sdfg	57	0	2025-06-03 09:08:29	2025-06-03 09:08:29
54	23	item	100	0	2025-06-03 09:11:14	2025-06-03 09:11:14
55	23	sub	100	54	2025-06-03 09:11:14	2025-06-03 09:11:14
56	24	item	100	0	2025-06-03 09:13:11	2025-06-03 09:13:11
57	25	item	100	0	2025-06-03 09:15:29	2025-06-03 09:15:29
58	26	Test	100	\N	2025-06-03 09:17:48	2025-06-03 09:17:48
59	27	item	100	0	2025-06-03 09:24:30	2025-06-03 09:24:30
60	28	hotel	3000	0	2025-06-04 12:46:48	2025-06-04 12:46:48
61	28	food	300	60	2025-06-04 12:46:48	2025-06-04 12:46:48
62	28	accomodation	500	60	2025-06-04 12:46:48	2025-06-04 12:46:48
63	29	Item 2	200	\N	2025-06-05 06:20:54	2025-06-05 06:20:54
64	29	Sub Item 2	200	63	2025-06-05 06:20:54	2025-06-05 06:20:54
75	34	Item 1	200	0	2025-06-05 10:41:08	2025-06-05 10:41:08
76	34	Sub item 1	100	75	2025-06-05 10:41:08	2025-06-05 10:41:08
77	34	Sub item 111	100	75	2025-06-05 10:41:08	2025-06-05 10:41:08
78	35	item 2	150	0	2025-06-05 10:41:08	2025-06-05 10:41:08
79	35	Sub item 2	100	78	2025-06-05 10:41:08	2025-06-05 10:41:08
80	35	Sub item 22	50	78	2025-06-05 10:41:08	2025-06-05 10:41:08
81	36	Total	5000	0	2025-06-07 06:57:13	2025-06-07 06:57:13
82	37	Medicine	300	0	2025-06-07 06:57:13	2025-06-07 06:57:13
83	38	Accomodation	2000	0	2025-06-07 06:57:13	2025-06-07 06:57:13
84	39	Miscellaneous	500	0	2025-06-07 06:57:13	2025-06-07 06:57:13
85	39	Visa	100	84	2025-06-07 06:57:13	2025-06-07 06:57:13
86	39	Transport	50	84	2025-06-07 06:57:13	2025-06-07 06:57:13
87	39	Train Fair	10	84	2025-06-07 06:57:13	2025-06-07 06:57:13
88	40	total	1000	0	2025-06-07 07:53:05	2025-06-07 07:53:05
89	41	Test	2000 - 3000	\N	2025-06-09 05:41:57	2025-06-09 05:41:57
92	44	total cust	100 -200	0	2025-06-10 07:37:04	2025-06-10 07:37:04
93	45	tip	100	0	2025-06-10 07:37:04	2025-06-10 07:37:04
94	46	madk	2	0	2025-06-10 07:37:04	2025-06-10 07:37:04
101	53	item 1	100-200	0	2025-06-11 05:39:05	2025-06-11 05:39:05
102	54	item 2	200-300	0	2025-06-11 05:39:05	2025-06-11 05:39:05
103	55	item 1	200 - 300	0	2025-06-11 13:45:25	2025-06-11 13:45:25
104	56	food	200	0	2025-06-16 16:36:32	2025-06-16 16:36:32
105	57	food	200	0	2025-06-16 16:39:55	2025-06-16 16:39:55
106	58	hs	600	0	2025-06-16 16:51:02	2025-06-16 16:51:02
107	59	flight	699	0	2025-06-19 12:29:05	2025-06-19 12:29:05
108	60	Food	500	0	2025-06-19 12:29:05	2025-06-19 12:29:05
109	60	water	200	108	2025-06-19 12:29:05	2025-06-19 12:29:05
110	60	Cravings	300	108	2025-06-19 12:29:05	2025-06-19 12:29:05
111	61	Insurance	99	0	2025-06-19 12:29:05	2025-06-19 12:29:05
112	62	hotel reservation	66	0	2025-06-19 13:07:19	2025-06-19 13:07:19
113	63	parking	33	0	2025-06-19 13:07:19	2025-06-19 13:07:19
121	69	gy	1000	0	2025-06-21 03:12:46	2025-06-21 03:12:46
122	69	huu	60	121	2025-06-21 03:12:46	2025-06-21 03:12:46
123	70	ggy	40	0	2025-06-21 03:12:46	2025-06-21 03:12:46
128	73	food	200	0	2025-06-21 15:13:13	2025-06-21 15:13:13
129	73	slad	100	128	2025-06-21 15:13:13	2025-06-21 15:13:13
130	74	drink	1000	0	2025-06-21 15:13:13	2025-06-21 15:13:13
131	74	coka cola	100	130	2025-06-21 15:13:13	2025-06-21 15:13:13
132	75	Hrllo	500	0	2025-06-21 15:13:13	2025-06-21 15:13:13
133	76	Hotel	200	0	2025-06-22 05:27:14	2025-06-22 05:27:14
134	77	Misc	1000	0	2025-06-22 05:27:14	2025-06-22 05:27:14
135	77	food	500	134	2025-06-22 05:27:14	2025-06-22 05:27:14
136	77	medicine	500	134	2025-06-22 05:27:14	2025-06-22 05:27:14
137	78	Extra	300	0	2025-06-22 05:27:14	2025-06-22 05:27:14
138	78	tip	100	137	2025-06-22 05:27:14	2025-06-22 05:27:14
139	78	water	100	137	2025-06-22 05:27:14	2025-06-22 05:27:14
140	79	food	200	0	2025-06-23 08:19:09	2025-06-23 08:19:09
141	79	jsjs	700	140	2025-06-23 08:19:09	2025-06-23 08:19:09
142	80	hsjs	700	0	2025-06-23 08:19:09	2025-06-23 08:19:09
143	81	Air ticket	2000	0	2025-06-23 12:18:33	2025-06-23 12:18:33
144	81	visa	500	143	2025-06-23 12:18:33	2025-06-23 12:18:33
145	82	Hotel Accomodation	1000	0	2025-06-23 12:18:33	2025-06-23 12:18:33
146	83	Tour Guide	500	0	2025-06-23 12:18:33	2025-06-23 12:18:33
147	84	Flight	1500	0	2025-06-24 06:48:18	2025-06-24 06:48:18
148	84	Insurance	300	147	2025-06-24 06:48:18	2025-06-24 06:48:18
149	85	Visa	1200	0	2025-06-24 06:48:18	2025-06-24 06:48:18
150	86	food	200	0	2025-06-24 18:11:14	2025-06-24 18:11:14
151	87	food	23	0	2025-06-24 18:14:25	2025-06-24 18:14:25
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
8	13	1	2025-05-19 09:45:25	2025-05-19 09:45:25
9	14	12	2025-05-20 11:42:29	2025-05-20 11:42:29
10	14	12	2025-05-20 11:42:29	2025-05-20 11:42:29
13	16	35	2025-05-25 12:54:02	2025-05-25 12:54:02
14	17	35	2025-05-26 08:45:51	2025-05-26 08:45:51
15	18	37	2025-06-02 06:01:50	2025-06-02 06:01:50
16	18	37	2025-06-02 06:01:50	2025-06-02 06:01:50
17	19	37	2025-06-02 06:48:23	2025-06-02 06:48:23
18	20	37	2025-06-02 08:23:50	2025-06-02 08:23:50
19	21	37	2025-06-02 09:06:55	2025-06-02 09:06:55
20	22	37	2025-06-03 05:15:48	2025-06-03 05:15:48
21	23	35	2025-06-03 09:08:29	2025-06-03 09:08:29
22	23	35	2025-06-03 09:08:29	2025-06-03 09:08:29
23	24	37	2025-06-03 09:11:14	2025-06-03 09:11:14
24	25	37	2025-06-03 09:13:11	2025-06-03 09:13:11
25	26	37	2025-06-03 09:15:29	2025-06-03 09:15:29
26	15	1	2025-06-03 09:17:48	2025-06-03 09:17:48
27	27	37	2025-06-03 09:24:30	2025-06-03 09:24:30
28	28	38	2025-06-04 12:46:48	2025-06-04 12:46:48
29	22	1	2025-06-05 06:20:54	2025-06-05 06:20:54
34	29	37	2025-06-05 10:41:08	2025-06-05 10:41:08
35	29	37	2025-06-05 10:41:08	2025-06-05 10:41:08
36	30	48	2025-06-07 06:57:13	2025-06-07 06:57:13
37	30	48	2025-06-07 06:57:13	2025-06-07 06:57:13
38	30	48	2025-06-07 06:57:13	2025-06-07 06:57:13
39	30	48	2025-06-07 06:57:13	2025-06-07 06:57:13
40	31	48	2025-06-07 07:53:05	2025-06-07 07:53:05
41	31	1	2025-06-09 05:41:57	2025-06-09 05:41:57
44	33	51	2025-06-10 07:37:04	2025-06-10 07:37:04
45	33	51	2025-06-10 07:37:04	2025-06-10 07:37:04
46	33	51	2025-06-10 07:37:04	2025-06-10 07:37:04
53	32	37	2025-06-11 05:39:05	2025-06-11 05:39:05
54	32	37	2025-06-11 05:39:05	2025-06-11 05:39:05
55	34	37	2025-06-11 13:45:25	2025-06-11 13:45:25
56	35	55	2025-06-16 16:36:32	2025-06-16 16:36:32
57	36	55	2025-06-16 16:39:55	2025-06-16 16:39:55
58	37	55	2025-06-16 16:51:02	2025-06-16 16:51:02
59	38	62	2025-06-19 12:29:05	2025-06-19 12:29:05
60	38	62	2025-06-19 12:29:05	2025-06-19 12:29:05
61	38	62	2025-06-19 12:29:05	2025-06-19 12:29:05
62	39	63	2025-06-19 13:07:19	2025-06-19 13:07:19
63	39	63	2025-06-19 13:07:19	2025-06-19 13:07:19
69	42	61	2025-06-21 03:12:46	2025-06-21 03:12:46
70	42	61	2025-06-21 03:12:46	2025-06-21 03:12:46
73	43	58	2025-06-21 15:13:13	2025-06-21 15:13:13
74	43	58	2025-06-21 15:13:13	2025-06-21 15:13:13
75	43	58	2025-06-21 15:13:13	2025-06-21 15:13:13
76	44	61	2025-06-22 05:27:14	2025-06-22 05:27:14
77	44	61	2025-06-22 05:27:14	2025-06-22 05:27:14
78	44	61	2025-06-22 05:27:14	2025-06-22 05:27:14
79	41	56	2025-06-23 08:19:09	2025-06-23 08:19:09
80	41	56	2025-06-23 08:19:09	2025-06-23 08:19:09
81	45	62	2025-06-23 12:18:33	2025-06-23 12:18:33
82	45	62	2025-06-23 12:18:33	2025-06-23 12:18:33
83	45	62	2025-06-23 12:18:33	2025-06-23 12:18:33
84	46	62	2025-06-24 06:48:18	2025-06-24 06:48:18
85	46	62	2025-06-24 06:48:18	2025-06-24 06:48:18
86	47	55	2025-06-24 18:11:14	2025-06-24 18:11:14
87	48	55	2025-06-24 18:14:25	2025-06-24 18:14:25
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, name, created_at, updated_at, status, dial_code, flag, description) FROM stdin;
6	Saudi Arabia	2025-03-10 12:30:29	2025-03-10 12:30:29	1	+93	\N	\N
7	Afghanistan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+93	\N	\N
8	Albania	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+355	\N	\N
9	Algeria	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+213	\N	\N
10	Andorra	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+376	\N	\N
11	Angola	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+244	\N	\N
12	Antigua and Barbuda	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-268	\N	\N
13	Argentina	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+54	\N	\N
14	Armenia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+374	\N	\N
15	Australia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+61	\N	\N
16	Austria	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+43	\N	\N
17	Azerbaijan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+994	\N	\N
18	Bahamas	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-242	\N	\N
19	Bahrain	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+973	\N	\N
20	Bangladesh	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+880	\N	\N
21	Barbados	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-246	\N	\N
22	Belarus	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+375	\N	\N
23	Belgium	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+32	\N	\N
24	Belize	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+501	\N	\N
25	Benin	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+229	\N	\N
26	Bhutan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+975	\N	\N
27	Bolivia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+591	\N	\N
28	Bosnia and Herzegovina	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+387	\N	\N
29	Botswana	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+267	\N	\N
30	Brazil	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+55	\N	\N
31	Brunei	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+673	\N	\N
32	Bulgaria	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+359	\N	\N
33	Burkina Faso	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+226	\N	\N
34	Burundi	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+257	\N	\N
35	Cambodia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+855	\N	\N
36	Cameroon	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+237	\N	\N
37	Canada	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1	\N	\N
38	Cape Verde	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+238	\N	\N
39	Central African Republic	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+236	\N	\N
40	Chad	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+235	\N	\N
41	Chile	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+56	\N	\N
42	China	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+86	\N	\N
43	Colombia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+57	\N	\N
44	Comoros	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+269	\N	\N
45	Congo (Brazzaville)	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+242	\N	\N
46	Congo (Kinshasa)	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+243	\N	\N
47	Costa Rica	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+506	\N	\N
48	Croatia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+385	\N	\N
49	Cuba	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+53	\N	\N
50	Cyprus	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+357	\N	\N
51	Czech Republic	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+420	\N	\N
52	Denmark	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+45	\N	\N
53	Djibouti	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+253	\N	\N
54	Dominica	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-767	\N	\N
55	Dominican Republic	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-809	\N	\N
56	Ecuador	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+593	\N	\N
57	Egypt	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+20	\N	\N
58	El Salvador	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+503	\N	\N
59	Equatorial Guinea	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+240	\N	\N
60	Eritrea	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+291	\N	\N
61	Estonia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+372	\N	\N
62	Eswatini	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+268	\N	\N
63	Ethiopia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+251	\N	\N
64	Fiji	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+679	\N	\N
65	Finland	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+358	\N	\N
66	France	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+33	\N	\N
67	Gabon	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+241	\N	\N
68	Gambia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+220	\N	\N
69	Georgia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+995	\N	\N
70	Germany	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+49	\N	\N
71	Ghana	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+233	\N	\N
72	Greece	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+30	\N	\N
73	Grenada	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-473	\N	\N
74	Guatemala	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+502	\N	\N
75	Guinea	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+224	\N	\N
76	Guinea-Bissau	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+245	\N	\N
77	Guyana	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+592	\N	\N
78	Haiti	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+509	\N	\N
79	Honduras	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+504	\N	\N
80	Hungary	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+36	\N	\N
81	Iceland	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+354	\N	\N
83	Indonesia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+62	\N	\N
84	Iran	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+98	\N	\N
85	Iraq	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+964	\N	\N
86	Ireland	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+353	\N	\N
87	Israel	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+972	\N	\N
88	Italy	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+39	\N	\N
89	Jamaica	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-876	\N	\N
90	Japan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+81	\N	\N
91	Jordan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+962	\N	\N
92	Kazakhstan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+7	\N	\N
93	Kenya	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+254	\N	\N
94	Kiribati	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+686	\N	\N
95	Kuwait	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+965	\N	\N
96	Kyrgyzstan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+996	\N	\N
97	Laos	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+856	\N	\N
98	Latvia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+371	\N	\N
99	Lebanon	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+961	\N	\N
100	Lesotho	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+266	\N	\N
101	Liberia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+231	\N	\N
102	Libya	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+218	\N	\N
103	Liechtenstein	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+423	\N	\N
104	Lithuania	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+370	\N	\N
105	Luxembourg	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+352	\N	\N
106	Madagascar	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+261	\N	\N
107	Malawi	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+265	\N	\N
108	Malaysia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+60	\N	\N
109	Maldives	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+960	\N	\N
110	Mali	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+223	\N	\N
111	Malta	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+356	\N	\N
112	Marshall Islands	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+692	\N	\N
113	Mauritania	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+222	\N	\N
114	Mauritius	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+230	\N	\N
115	Mexico	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+52	\N	\N
116	Micronesia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+691	\N	\N
117	Moldova	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+373	\N	\N
118	Monaco	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+377	\N	\N
119	Mongolia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+976	\N	\N
120	Montenegro	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+382	\N	\N
121	Morocco	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+212	\N	\N
122	Mozambique	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+258	\N	\N
123	Myanmar	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+95	\N	\N
124	Namibia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+264	\N	\N
125	Nauru	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+674	\N	\N
126	Nepal	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+977	\N	\N
127	Netherlands	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+31	\N	\N
128	New Zealand	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+64	\N	\N
129	Nicaragua	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+505	\N	\N
130	Niger	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+227	\N	\N
131	Nigeria	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+234	\N	\N
132	North Korea	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+850	\N	\N
133	North Macedonia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+389	\N	\N
134	Norway	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+47	\N	\N
135	Oman	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+968	\N	\N
137	Palau	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+680	\N	\N
138	Palestine	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+970	\N	\N
139	Panama	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+507	\N	\N
140	Papua New Guinea	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+675	\N	\N
141	Paraguay	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+595	\N	\N
142	Peru	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+51	\N	\N
143	Philippines	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+63	\N	\N
144	Poland	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+48	\N	\N
145	Portugal	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+351	\N	\N
146	Qatar	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+974	\N	\N
147	Romania	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+40	\N	\N
148	Russia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+7	\N	\N
149	Rwanda	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+250	\N	\N
150	Saint Kitts and Nevis	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-869	\N	\N
151	Saint Lucia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-758	\N	\N
152	Saint Vincent and the Grenadines	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-784	\N	\N
153	Samoa	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+685	\N	\N
154	San Marino	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+378	\N	\N
155	Saudi Arabia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+966	\N	\N
156	Senegal	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+221	\N	\N
157	Serbia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+381	\N	\N
158	Seychelles	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+248	\N	\N
159	Sierra Leone	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+232	\N	\N
160	Singapore	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+65	\N	\N
161	Slovakia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+421	\N	\N
162	Slovenia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+386	\N	\N
163	Solomon Islands	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+677	\N	\N
164	Somalia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+252	\N	\N
165	South Africa	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+27	\N	\N
166	South Korea	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+82	\N	\N
167	South Sudan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+211	\N	\N
168	Spain	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+34	\N	\N
169	Sri Lanka	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+94	\N	\N
170	Sudan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+249	\N	\N
171	Suriname	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+597	\N	\N
172	Sweden	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+46	\N	\N
173	Switzerland	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+41	\N	\N
174	Syria	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+963	\N	\N
175	Taiwan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+886	\N	\N
176	Tajikistan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+992	\N	\N
177	Tanzania	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+255	\N	\N
178	Thailand	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+66	\N	\N
179	Timor-Leste	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+670	\N	\N
180	Togo	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+228	\N	\N
181	Tonga	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+676	\N	\N
182	Trinidad and Tobago	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+1-868	\N	\N
183	Tunisia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+216	\N	\N
184	Turkey	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+90	\N	\N
185	Turkmenistan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+993	\N	\N
186	Tuvalu	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+688	\N	\N
187	Uganda	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+256	\N	\N
188	Ukraine	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+380	\N	\N
192	Uruguay	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+598	\N	\N
193	Uzbekistan	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+998	\N	\N
194	Vanuatu	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+678	\N	\N
195	Vatican City	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+379	\N	\N
196	Venezuela	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+58	\N	\N
197	Vietnam	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+84	\N	\N
198	Yemen	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+967	\N	\N
199	Zambia	2025-04-26 01:03:31	2025-04-26 01:03:31	1	+260	\N	\N
200	Zimbabwe	2025-04-26 01:03:31	2025-06-24 11:01:16	1	+263	1750762876685a857c83499.jpeg	Zimbabwe is a landlocked country in southern Africa, known for its dramatic landscapes, rich wildlife, and vibrant cultural heritage. Home to one of the world’s natural wonders, Victoria Falls, and ancient sites like Great Zimbabwe, the country offers a deep connection to both history and nature. Despite economic challenges, Zimbabwe is resilient, with a strong spirit of community, a growing tourism sector, and vast agricultural potential. Its people are known for their warmth, hospitality, and artistic traditions.
136	Pakistan	2025-04-26 01:03:31	2025-06-24 10:58:56	1	+92	175067826468593af84e158.png	Pakistan is a culturally rich and geographically diverse country located in South Asia. It is known for its vibrant traditions, historical landmarks, and warm hospitality. From the towering peaks of the Himalayas in the north to the scenic beaches in the south, Pakistan offers a blend of natural beauty and cultural heritage. With a growing economy, youthful population, and strong entrepreneurial spirit, Pakistan continues to emerge as a promising player on the global stage.
1	United Arab Emirates	2025-03-09 21:04:33	2025-06-24 11:01:49	1	+971	175061810368584ff70bdf6.png	The United Arab Emirates (UAE) is a dynamic and modern country located in the Arabian Peninsula, known for its rapid development, luxurious lifestyle, and visionary leadership. Home to global cities like Dubai and Abu Dhabi, the UAE blends rich cultural heritage with futuristic innovation. With a thriving economy driven by sectors like tourism, finance, real estate, and technology, it has become a global hub for business and travel. The UAE is also recognized for its safety, diversity, and commitment to sustainability and smart infrastructure.
190	United Kingdom	2025-04-26 01:03:31	2025-06-24 11:02:14	1	+44	175062110868585bb44fe5b.png	The United Kingdom (UK) is a sovereign country made up of England, Scotland, Wales, and Northern Ireland. Known for its rich history, iconic landmarks like Big Ben and Buckingham Palace, and world-renowned institutions, the UK plays a significant role in global politics, finance, and education. It has a diverse and multicultural society, a strong legal and democratic tradition, and a creative influence seen in music, literature, and fashion. The UK remains a key player on the international stage with a blend of tradition and modern innovation.
191	United States	2025-04-26 01:03:31	2025-06-24 11:02:38	1	+1	175062105468585b7e976fe.png	The United States (US) is one of the world's most influential and diverse countries, located in North America. Known for its global leadership in technology, innovation, economy, and culture, the US is home to iconic cities like New York, Los Angeles, and Washington, D.C. With a rich history of democracy and a strong emphasis on individual freedom, it attracts people from around the world for education, business, and opportunity. From natural wonders like the Grand Canyon to cutting-edge industries in Silicon Valley, the US represents a unique blend of tradition and progress.
82	India	2025-04-26 01:03:31	2025-06-24 11:04:30	1	+91	\N	India is a vibrant and diverse country in South Asia, known for its rich history, cultural heritage, and rapid economic growth. As the world’s most populous democracy, India offers a unique blend of ancient traditions and modern innovation. From the majestic Himalayas in the north to the serene beaches of the south, and from bustling cities like Mumbai and Delhi to historic landmarks like the Taj Mahal, India is a land of contrasts and unity. With a booming tech industry, a deep-rooted spiritual tradition, and a dynamic youth population, India continues to shape the global future.
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
3	13	100-25	2025-05-19 09:46:12	2025-05-19 09:46:12
4	14	1000-1500	2025-05-20 11:42:29	2025-05-20 11:42:29
5	16	200	2025-05-25 12:54:02	2025-05-25 12:54:02
6	17	500-600	2025-05-26 08:45:51	2025-05-26 08:45:51
7	18	200	2025-06-02 06:01:50	2025-06-02 06:01:50
8	19	100	2025-06-02 06:48:23	2025-06-02 06:48:23
9	20	200	2025-06-02 08:23:50	2025-06-02 08:23:50
10	21	100	2025-06-02 09:06:55	2025-06-02 09:06:55
11	22	200	2025-06-03 05:15:48	2025-06-03 05:15:48
12	23	45	2025-06-03 09:08:29	2025-06-03 09:08:29
13	24	100	2025-06-03 09:11:14	2025-06-03 09:11:14
14	25	100	2025-06-03 09:13:11	2025-06-03 09:13:11
15	26	100.0	2025-06-03 09:15:29	2025-06-03 09:15:29
16	27	100.0	2025-06-03 09:24:30	2025-06-03 09:24:30
17	28	3000	2025-06-04 12:46:48	2025-06-04 12:46:48
20	29	350	2025-06-05 10:41:08	2025-06-05 10:41:08
21	30	7800	2025-06-07 06:57:13	2025-06-07 06:57:13
22	31	1000	2025-06-07 07:53:05	2025-06-07 07:53:05
24	33	0	2025-06-10 07:37:04	2025-06-10 07:37:04
31	32	300-500	2025-06-11 05:39:05	2025-06-11 05:39:05
32	34	200 - 300	2025-06-11 13:45:25	2025-06-11 13:45:25
33	35	500	2025-06-16 16:36:32	2025-06-16 16:36:32
34	36	7000	2025-06-16 16:39:55	2025-06-16 16:39:55
35	37	6000	2025-06-16 16:51:02	2025-06-16 16:51:02
36	38	1499	2025-06-19 12:29:05	2025-06-19 12:29:05
37	39	$99	2025-06-19 13:07:19	2025-06-19 13:07:19
41	42	100- 200	2025-06-21 03:12:46	2025-06-21 03:12:46
43	43	500	2025-06-21 15:13:13	2025-06-21 15:13:13
44	44	Estimation 1500	2025-06-22 05:27:14	2025-06-22 05:27:14
45	41	5000	2025-06-23 08:19:09	2025-06-23 08:19:09
46	45	3500	2025-06-23 12:18:33	2025-06-23 12:18:33
47	46	2999	2025-06-24 06:48:18	2025-06-24 06:48:18
48	47	500	2025-06-24 18:11:14	2025-06-24 18:11:14
49	48	500	2025-06-24 18:14:25	2025-06-24 18:14:25
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
-- Data for Name: follows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.follows (id, follower_id, followed_id, status, requested_at, responded_at, created_at, updated_at) FROM stdin;
1	37	47	approved	2025-06-11 06:20:05	2025-06-11 07:51:48	2025-06-11 06:20:05	2025-06-11 07:51:48
74	59	60	pending	2025-06-21 20:57:22	\N	2025-06-21 20:57:22	2025-06-21 20:57:22
4	47	52	approved	2025-06-11 07:58:38	2025-06-11 08:13:00	2025-06-11 07:58:38	2025-06-11 08:13:00
5	46	52	pending	2025-06-11 08:16:41	\N	2025-06-11 08:16:41	2025-06-11 08:16:41
6	52	47	pending	2025-06-11 10:21:06	\N	2025-06-11 10:21:06	2025-06-11 10:21:06
8	54	53	pending	2025-06-12 03:55:45	\N	2025-06-12 03:55:45	2025-06-12 03:55:45
9	54	51	pending	2025-06-12 03:56:11	\N	2025-06-12 03:56:11	2025-06-12 03:56:11
10	54	46	pending	2025-06-12 03:56:20	\N	2025-06-12 03:56:20	2025-06-12 03:56:20
11	55	17	pending	2025-06-12 03:57:30	\N	2025-06-12 03:57:30	2025-06-12 03:57:30
12	55	18	pending	2025-06-12 03:57:34	\N	2025-06-12 03:57:34	2025-06-12 03:57:34
7	52	37	rejected	2025-06-11 13:21:46	2025-06-12 06:44:21	2025-06-11 13:21:46	2025-06-12 06:44:21
14	56	21	pending	2025-06-13 13:50:54	\N	2025-06-13 13:50:54	2025-06-13 13:50:54
16	55	57	pending	2025-06-18 05:46:17	\N	2025-06-18 05:46:17	2025-06-18 05:46:17
17	55	52	pending	2025-06-18 07:36:21	\N	2025-06-18 07:36:21	2025-06-18 07:36:21
20	59	57	rejected	2025-06-18 13:39:13	2025-06-18 14:09:47	2025-06-18 13:39:13	2025-06-18 14:09:47
32	57	37	pending	2025-06-18 19:42:54	\N	2025-06-18 19:42:54	2025-06-18 19:42:54
34	38	59	pending	2025-06-19 02:39:45	\N	2025-06-19 02:39:45	2025-06-19 02:39:45
19	59	38	approved	2025-06-18 13:35:28	2025-06-19 02:40:04	2025-06-18 13:35:28	2025-06-19 02:40:04
36	55	60	pending	2025-06-19 06:35:18	\N	2025-06-19 06:35:18	2025-06-19 06:35:18
37	55	58	pending	2025-06-19 06:35:22	\N	2025-06-19 06:35:22	2025-06-19 06:35:22
38	55	54	pending	2025-06-19 06:35:26	\N	2025-06-19 06:35:26	2025-06-19 06:35:26
39	55	51	pending	2025-06-19 06:35:30	\N	2025-06-19 06:35:30	2025-06-19 06:35:30
40	55	49	pending	2025-06-19 06:35:32	\N	2025-06-19 06:35:32	2025-06-19 06:35:32
41	55	48	pending	2025-06-19 06:35:35	\N	2025-06-19 06:35:35	2025-06-19 06:35:35
42	55	47	pending	2025-06-19 06:35:37	\N	2025-06-19 06:35:37	2025-06-19 06:35:37
43	55	46	pending	2025-06-19 06:35:39	\N	2025-06-19 06:35:39	2025-06-19 06:35:39
77	62	61	approved	2025-06-23 11:13:53	2025-06-23 11:14:48	2025-06-23 11:13:53	2025-06-23 11:14:48
49	61	53	pending	2025-06-19 09:07:35	\N	2025-06-19 09:07:35	2025-06-19 09:07:35
44	61	55	rejected	2025-06-19 08:55:37	2025-06-19 09:12:58	2025-06-19 08:55:37	2025-06-19 09:12:58
15	55	56	approved	2025-06-16 16:28:20	2025-06-20 05:25:43	2025-06-16 16:28:20	2025-06-20 05:25:43
56	38	60	pending	2025-06-20 12:33:49	\N	2025-06-20 12:33:49	2025-06-20 12:33:49
57	38	62	pending	2025-06-20 12:34:00	\N	2025-06-20 12:34:00	2025-06-20 12:34:00
58	38	58	pending	2025-06-20 12:34:03	\N	2025-06-20 12:34:03	2025-06-20 12:34:03
60	38	57	pending	2025-06-20 12:34:07	\N	2025-06-20 12:34:07	2025-06-20 12:34:07
61	38	63	pending	2025-06-20 12:34:08	\N	2025-06-20 12:34:08	2025-06-20 12:34:08
63	38	53	pending	2025-06-20 12:34:11	\N	2025-06-20 12:34:11	2025-06-20 12:34:11
64	38	54	pending	2025-06-20 12:34:11	\N	2025-06-20 12:34:11	2025-06-20 12:34:11
65	38	52	pending	2025-06-20 12:34:13	\N	2025-06-20 12:34:13	2025-06-20 12:34:13
66	38	50	pending	2025-06-20 12:34:14	\N	2025-06-20 12:34:14	2025-06-20 12:34:14
67	61	63	pending	2025-06-21 10:56:07	\N	2025-06-21 10:56:07	2025-06-21 10:56:07
68	61	60	pending	2025-06-21 10:57:40	\N	2025-06-21 10:57:40	2025-06-21 10:57:40
105	55	63	pending	2025-06-24 12:40:57	\N	2025-06-24 12:40:57	2025-06-24 12:40:57
78	56	63	pending	2025-06-23 11:26:47	\N	2025-06-23 11:26:47	2025-06-23 11:26:47
35	38	56	approved	2025-06-19 02:39:51	2025-06-23 12:41:19	2025-06-19 02:39:51	2025-06-23 12:41:19
81	62	49	pending	2025-06-23 13:50:32	\N	2025-06-23 13:50:32	2025-06-23 13:50:32
84	61	59	pending	2025-06-23 16:25:24	\N	2025-06-23 16:25:24	2025-06-23 16:25:24
93	62	59	pending	2025-06-24 06:11:28	\N	2025-06-24 06:11:28	2025-06-24 06:11:28
95	60	63	pending	2025-06-24 08:06:49	\N	2025-06-24 08:06:49	2025-06-24 08:06:49
98	60	38	pending	2025-06-24 08:16:34	\N	2025-06-24 08:16:34	2025-06-24 08:16:34
102	64	63	pending	2025-06-24 10:34:09	\N	2025-06-24 10:34:09	2025-06-24 10:34:09
103	64	62	pending	2025-06-24 10:34:12	\N	2025-06-24 10:34:12	2025-06-24 10:34:12
104	55	64	pending	2025-06-24 12:33:22	\N	2025-06-24 12:33:22	2025-06-24 12:33:22
59	38	55	approved	2025-06-20 12:34:05	2025-06-24 12:49:14	2025-06-20 12:34:05	2025-06-24 12:49:14
75	63	62	approved	2025-06-23 11:13:07	2025-06-24 14:11:04	2025-06-23 11:13:07	2025-06-24 14:11:04
96	60	62	approved	2025-06-24 08:09:05	2025-06-24 14:11:23	2025-06-24 08:09:05	2025-06-24 14:11:23
92	61	62	approved	2025-06-23 23:39:01	2025-06-24 14:11:26	2025-06-23 23:39:01	2025-06-24 14:11:26
109	61	64	pending	2025-06-24 17:03:59	\N	2025-06-24 17:03:59	2025-06-24 17:03:59
62	38	61	rejected	2025-06-20 12:34:09	2025-06-25 05:29:07	2025-06-20 12:34:09	2025-06-25 05:29:07
\.


--
-- Data for Name: itineraries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.itineraries (id, user_id, journey_id, date, description, created_at, updated_at, start_time, end_time) FROM stdin;
90	12	14	2025-05-19	desc	2025-05-20 11:42:29	2025-05-20 11:42:29	08:10:00	10:00:00
91	12	14	2025-05-20	desc	2025-05-20 11:42:29	2025-05-20 11:42:29	08:10:00	10:00:00
8	1	1	2025-04-25	Breakfast	2025-04-22 12:14:44	2025-04-22 12:14:44	09:00:00	11:00:00
9	1	1	2025-04-25	Jogging	2025-04-22 12:14:44	2025-04-22 12:14:44	11:01:00	14:43:00
10	1	1	2025-04-26	Breakfast	2025-04-22 12:14:44	2025-04-22 12:14:44	07:43:00	11:48:00
11	1	1	2025-04-26	Tracking	2025-04-22 12:14:44	2025-04-22 12:14:44	12:00:00	17:44:00
12	1	4	2025-04-26	Breakfast	2025-04-22 13:33:16	2025-04-22 13:33:16	09:31:00	11:31:00
13	1	4	2025-04-26	Tracking	2025-04-22 13:33:16	2025-04-22 13:33:16	11:33:00	17:32:00
14	1	4	2025-04-26	Dinner	2025-04-22 13:33:16	2025-04-22 13:33:16	18:32:00	22:37:00
15	1	4	2025-04-27	Breakfast	2025-04-22 13:33:16	2025-04-22 13:33:16	09:32:00	21:32:00
16	1	4	2025-04-28	Breakfast	2025-04-22 13:33:16	2025-04-22 13:33:16	09:33:00	21:33:00
108	35	16	2025-05-25	test day 1	2025-05-25 12:54:02	2025-05-25 12:54:02	17:53:00	17:54:00
109	35	16	2025-05-26	day 2	2025-05-25 12:54:02	2025-05-25 12:54:02	17:53:00	17:54:00
113	37	18	2025-06-02	test day 1	2025-06-02 06:01:50	2025-06-02 06:01:50	10:57:00	10:58:00
114	37	18	2025-06-02	test day 11	2025-06-02 06:01:50	2025-06-02 06:01:50	10:59:00	11:00:00
115	37	18	2025-06-03	test day 2	2025-06-02 06:01:50	2025-06-02 06:01:50	10:58:00	10:59:00
118	37	20	2025-06-04	day 1	2025-06-02 08:23:50	2025-06-02 08:23:50	13:23:00	13:24:00
119	37	20	2025-06-05	day 2	2025-06-02 08:23:50	2025-06-02 08:23:50	13:23:00	13:24:00
129	35	23	2025-06-03	breakfa	2025-06-03 09:08:29	2025-06-03 09:08:29	08:32:00	08:33:00
130	35	23	2025-06-03	lunch	2025-06-03 09:08:29	2025-06-03 09:08:29	08:34:00	09:35:00
131	35	23	2025-06-04	df	2025-06-03 09:08:29	2025-06-03 09:08:29	08:33:00	08:34:00
132	35	23	2025-06-04	rrtr	2025-06-03 09:08:29	2025-06-03 09:08:29	08:35:00	09:36:00
135	37	25	2025-06-03	day 1	2025-06-03 09:13:11	2025-06-03 09:13:11	14:12:00	14:13:00
136	37	25	2025-06-04	day 2	2025-06-03 09:13:11	2025-06-03 09:13:11	14:12:00	14:13:00
139	37	27	2025-06-03	day 1	2025-06-03 09:24:30	2025-06-03 09:24:30	14:12:00	14:13:00
140	37	27	2025-06-04	day 2	2025-06-03 09:24:30	2025-06-03 09:24:30	14:12:00	14:13:00
153	48	30	2025-06-07	Break Fast	2025-06-07 06:57:13	2025-06-07 06:57:13	09:06:00	10:07:00
154	48	30	2025-06-07	Marina Sight seeing	2025-06-07 06:57:13	2025-06-07 06:57:13	10:08:00	12:30:00
155	48	30	2025-06-07	Lunch Time	2025-06-07 06:57:13	2025-06-07 06:57:13	12:31:00	13:32:00
156	48	30	2025-06-07	Marina walk	2025-06-07 06:57:13	2025-06-07 06:57:13	13:33:00	19:34:00
157	48	30	2025-06-07	Dinner	2025-06-07 06:57:13	2025-06-07 06:57:13	19:35:00	20:36:00
158	48	30	2025-06-08	Break fast	2025-06-07 06:57:13	2025-06-07 06:57:13	09:00:00	10:01:00
159	48	30	2025-06-08	trekking	2025-06-07 06:57:13	2025-06-07 06:57:13	10:02:00	13:03:00
160	48	30	2025-06-08	lunch	2025-06-07 06:57:13	2025-06-07 06:57:13	13:04:00	13:05:00
161	48	30	2025-06-08	Desert Safari	2025-06-07 06:57:13	2025-06-07 06:57:13	13:06:00	19:07:00
162	48	30	2025-06-08	Dinner	2025-06-07 06:57:13	2025-06-07 06:57:13	19:08:00	20:09:00
170	37	32	2025-06-09	test	2025-06-09 12:09:06	2025-06-09 12:09:06	10:44:00	10:45:00
171	37	32	2025-06-09	test day 11	2025-06-09 12:09:06	2025-06-09 12:09:06	10:46:00	10:47:00
172	37	32	2025-06-09	test \nday 111	2025-06-09 12:09:06	2025-06-09 12:09:06	10:48:00	\N
173	37	32	2025-06-10	tedt 2	2025-06-09 12:09:06	2025-06-09 12:09:06	10:44:00	10:45:00
177	37	34	2025-06-11	day 1	2025-06-11 13:45:25	2025-06-11 13:45:25	18:43:00	\N
178	37	34	2025-06-12	day 2	2025-06-11 13:45:25	2025-06-11 13:45:25	18:44:00	\N
187	55	36	2025-06-18	hello	2025-06-16 16:53:21	2025-06-16 16:53:21	21:39:00	\N
188	55	36	2025-06-19	hamid	2025-06-16 16:53:21	2025-06-16 16:53:21	23:59:00	\N
194	63	39	2025-07-01	breakfast	2025-06-19 13:07:19	2025-06-19 13:07:19	08:05:00	\N
195	63	39	2025-07-01	Sky observation	2025-06-19 13:07:19	2025-06-19 13:07:19	12:05:00	\N
196	63	39	2025-07-02	Breakfast	2025-06-19 13:07:19	2025-06-19 13:07:19	10:05:00	\N
197	63	39	2025-07-02	lunch	2025-06-19 13:07:19	2025-06-19 13:07:19	13:06:00	\N
198	63	39	2025-07-02	dinner	2025-06-19 13:07:19	2025-06-19 13:07:19	22:06:00	\N
202	61	42	2025-06-22	Triple threat to be a great day of the same time as a child support of the same	2025-06-21 03:10:40	2025-06-21 03:10:40	08:38:00	\N
203	61	42	2025-06-22	tula nahi hai na to be a child support of the same time as a child support of	2025-06-21 03:10:40	2025-06-21 03:10:40	09:39:00	\N
204	61	42	2025-06-23	the same time as a child support	2025-06-21 03:10:40	2025-06-21 03:10:40	10:39:00	\N
205	61	42	2025-06-24	tym ni to be in the world is the only thing we were wuw	2025-06-21 03:10:40	2025-06-21 03:10:40	09:39:00	\N
208	61	44	2025-06-22	Break fast together	2025-06-22 05:27:14	2025-06-22 05:27:14	10:49:00	\N
209	61	44	2025-06-22	Trip to Dubai Beaches and I have a great day of the same time as a great day of the same time as a great day of the same time as	2025-06-22 05:27:14	2025-06-22 05:27:14	11:49:00	\N
210	61	44	2025-06-22	Dinner with a great day of the same time as a great day of the same time as well as a great	2025-06-22 05:27:14	2025-06-22 05:27:14	17:50:00	\N
211	61	44	2025-06-23	Break fast	2025-06-22 05:27:14	2025-06-22 05:27:14	10:51:00	\N
212	61	44	2025-06-23	Trekking ga to be a great day of the same time as a great day of the same time as a great day of the same time	2025-06-22 05:27:14	2025-06-22 05:27:14	11:51:00	\N
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
105	1	15	2025-05-23	Test day 1	2025-05-25 10:43:35	2025-05-25 10:43:35	23:06:00	23:07:00
106	1	15	2025-05-23	tetggh	2025-05-25 10:43:35	2025-05-25 10:43:35	23:07:00	23:11:00
107	1	15	2025-05-24	test day 2	2025-05-25 10:43:35	2025-05-25 10:43:35	21:47:00	21:50:00
110	35	17	2025-06-01	dinner	2025-05-26 08:45:51	2025-05-26 08:45:51	22:33:00	22:34:00
111	35	17	2025-06-02	breakfast	2025-05-26 08:45:51	2025-05-26 08:45:51	09:42:00	12:43:00
112	35	17	2025-06-03	breakfast	2025-05-26 08:45:51	2025-05-26 08:45:51	09:43:00	11:44:00
116	37	19	2025-06-04	day 1	2025-06-02 06:48:23	2025-06-02 06:48:23	11:47:00	11:48:00
117	37	19	2025-06-05	day 2	2025-06-02 06:48:23	2025-06-02 06:48:23	11:47:00	11:48:00
120	37	21	2025-06-03	day 1	2025-06-02 09:06:55	2025-06-02 09:06:55	14:05:00	14:06:00
121	37	21	2025-06-04	day 2	2025-06-02 09:06:55	2025-06-02 09:06:55	14:06:00	14:07:00
122	37	21	2025-06-05	day 3	2025-06-02 09:06:55	2025-06-02 09:06:55	14:06:00	14:07:00
126	1	22	2025-06-04	Day 1	2025-06-03 08:46:29	2025-06-03 08:46:29	13:45:00	13:46:00
127	1	22	2025-06-04	Day 11	2025-06-03 08:46:29	2025-06-03 08:46:29	13:47:00	13:48:00
128	1	22	2025-06-05	Day 2	2025-06-03 08:46:29	2025-06-03 08:46:29	13:49:00	13:50:00
133	37	24	2025-06-03	day1	2025-06-03 09:11:14	2025-06-03 09:11:14	14:10:00	14:11:00
134	37	24	2025-06-04	day 2	2025-06-03 09:11:14	2025-06-03 09:11:14	14:10:00	14:11:00
137	37	26	2025-06-03	day 1	2025-06-03 09:15:28	2025-06-03 09:15:28	14:12:00	14:13:00
138	37	26	2025-06-04	day 2	2025-06-03 09:15:28	2025-06-03 09:15:28	14:12:00	14:13:00
141	38	28	2025-06-04	trip 1	2025-06-04 12:46:48	2025-06-04 12:46:48	06:12:00	15:13:00
142	38	28	2025-06-04	trip 2	2025-06-04 12:46:48	2025-06-04 12:46:48	15:14:00	18:15:00
143	38	28	2025-06-05	dfg	2025-06-04 12:46:48	2025-06-04 12:46:48	08:14:00	11:15:00
144	38	28	2025-06-06	errr	2025-06-04 12:46:48	2025-06-04 12:46:48	07:14:00	07:15:00
151	37	29	2025-06-06	Day 1	2025-06-05 08:59:25	2025-06-05 08:59:25	11:45:00	11:46:00
152	37	29	2025-06-07	Day 2	2025-06-05 08:59:25	2025-06-05 08:59:25	11:45:00	11:46:00
163	48	31	2025-06-08	Break Fast	2025-06-07 07:53:05	2025-06-07 07:53:05	05:21:00	06:22:00
164	48	31	2025-06-09	Break fast	2025-06-07 07:53:05	2025-06-07 07:53:05	08:21:00	09:22:00
174	51	33	2025-06-11	errfgcgccbcb the same as the same as I have to go uuuuuuuuuujjk to y	2025-06-10 07:37:04	2025-06-10 07:37:04	06:04:00	08:05:00
175	51	33	2025-06-11	r u in the morning and I am not sure about the same as the same time to sleep 😪😪😪😪	2025-06-10 07:37:04	2025-06-10 07:37:04	08:06:00	09:07:00
176	51	33	2025-06-12	rtryyyy huhjhi the same time as I have a flat in TVM in a uuuuuuuuuujjk year ago i will call	2025-06-10 07:37:04	2025-06-10 07:37:04	04:05:00	06:06:00
179	55	35	2025-06-16	hi	2025-06-16 16:36:32	2025-06-16 16:36:32	21:35:00	\N
180	55	35	2025-06-17	hello	2025-06-16 16:36:32	2025-06-16 16:36:32	00:35:00	\N
183	55	37	2025-06-16	hello	2025-06-16 16:51:02	2025-06-16 16:51:02	21:50:00	\N
184	55	37	2025-06-17	kdkdkdks	2025-06-16 16:51:02	2025-06-16 16:51:02	21:50:00	\N
185	55	37	2025-06-18	hi	2025-06-16 16:51:02	2025-06-16 16:51:02	21:50:00	\N
186	55	37	2025-06-19	kxdks	2025-06-16 16:51:02	2025-06-16 16:51:02	21:50:00	\N
189	62	38	2025-06-28	Breakfast	2025-06-19 12:29:05	2025-06-19 12:29:05	09:30:00	\N
190	62	38	2025-06-28	Swimming	2025-06-19 12:29:05	2025-06-19 12:29:05	11:30:00	\N
191	62	38	2025-06-29	Breakfast	2025-06-19 12:29:05	2025-06-19 12:29:05	10:25:00	\N
192	62	38	2025-06-29	lunch	2025-06-19 12:29:05	2025-06-19 12:29:05	16:25:00	\N
193	62	38	2025-06-29	dinner	2025-06-19 12:29:05	2025-06-19 12:29:05	22:25:00	\N
199	56	41	2025-06-23	fun	2025-06-20 07:03:48	2025-06-20 07:03:48	12:03:00	\N
200	56	41	2025-06-24	hello	2025-06-20 07:03:48	2025-06-20 07:03:48	12:03:00	\N
201	56	41	2025-06-25	hello 3	2025-06-20 07:03:48	2025-06-20 07:03:48	12:03:00	\N
206	58	43	2025-06-21	Day one	2025-06-21 14:42:06	2025-06-21 14:42:06	19:40:00	\N
207	58	43	2025-06-22	day two	2025-06-21 14:42:06	2025-06-21 14:42:06	19:41:00	\N
213	61	44	2025-06-24	canoe🛶 and I have a great day of the same time as a great day of the same time as a great day of the same time	2025-06-22 05:27:14	2025-06-22 05:27:14	10:52:00	\N
214	61	44	2025-06-24	the same time as a great day of the same time as a great day of the same time as a	2025-06-22 05:27:14	2025-06-22 05:27:14	11:52:00	\N
215	62	45	2025-07-18	breakfast	2025-06-23 12:18:33	2025-06-23 12:18:33	09:30:00	\N
216	62	45	2025-07-18	London Bridge tour	2025-06-23 12:18:33	2025-06-23 12:18:33	12:16:00	\N
217	62	45	2025-07-19	breakfast	2025-06-23 12:18:33	2025-06-23 12:18:33	10:16:00	\N
218	62	45	2025-07-19	lunch	2025-06-23 12:18:33	2025-06-23 12:18:33	15:16:00	\N
219	62	46	2025-07-19	Breakfast	2025-06-24 06:48:18	2025-06-24 06:48:18	10:46:00	\N
220	62	46	2025-07-19	Lunch	2025-06-24 06:48:18	2025-06-24 06:48:18	14:46:00	\N
221	62	46	2025-07-20	Breakfast	2025-06-24 06:48:18	2025-06-24 06:48:18	10:46:00	\N
222	62	46	2025-07-20	Tour	2025-06-24 06:48:18	2025-06-24 06:48:18	15:47:00	\N
223	55	47	2025-06-29	day one	2025-06-24 18:11:14	2025-06-24 18:11:14	23:10:00	\N
224	55	47	2025-06-30	day two	2025-06-24 18:11:14	2025-06-24 18:11:14	23:10:00	\N
225	55	48	2025-06-25	day ome	2025-06-24 18:14:25	2025-06-24 18:14:25	23:13:00	\N
226	55	48	2025-06-26	day two	2025-06-24 18:14:25	2025-06-24 18:14:25	23:13:00	\N
227	55	48	2025-06-27	day three	2025-06-24 18:14:25	2025-06-24 18:14:25	23:13:00	\N
228	55	48	2025-06-28	day 4	2025-06-24 18:14:25	2025-06-24 18:14:25	23:13:00	\N
229	55	48	2025-06-29	day 5	2025-06-24 18:14:25	2025-06-24 18:14:25	23:14:00	\N
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

COPY public.journey_participants (id, journey_id, user_id, created_at, updated_at, is_approved, is_owner) FROM stdin;
1	1	11	\N	\N	1	0
2	1	5	\N	\N	1	0
3	4	15	\N	\N	1	0
4	4	13	\N	\N	1	0
5	4	12	\N	\N	1	0
6	5	14	\N	\N	1	0
7	5	5	\N	\N	1	0
8	6	13	\N	\N	1	0
9	7	12	\N	\N	1	0
10	7	5	\N	\N	1	0
11	8	12	\N	\N	1	0
13	8	5	\N	\N	1	0
14	10	12	\N	\N	1	0
15	10	6	\N	\N	1	0
16	10	5	\N	\N	1	0
17	11	15	\N	\N	1	0
18	11	12	\N	\N	1	0
19	11	5	\N	\N	1	0
20	12	15	\N	\N	1	0
21	12	14	\N	\N	1	0
22	13	12	\N	\N	1	0
23	15	13	\N	\N	1	0
24	22	13	\N	\N	1	0
25	22	32	\N	\N	1	0
27	29	46	2025-06-05 11:04:57	2025-06-06 05:56:06	1	0
28	29	39	2025-06-05 12:44:50	2025-06-06 06:02:39	0	0
29	31	37	2025-06-09 07:51:32	2025-06-09 07:51:32	3	0
30	30	37	2025-06-09 10:15:34	2025-06-09 10:15:34	3	0
31	33	37	2025-06-10 11:48:13	2025-06-10 11:48:13	3	0
32	29	47	2025-06-10 11:52:52	2025-06-10 11:53:35	1	0
33	34	54	2025-06-12 03:58:11	2025-06-12 03:58:11	3	0
34	11	55	2025-06-12 03:58:35	2025-06-12 03:58:35	3	0
35	34	56	2025-06-13 13:28:33	2025-06-13 13:28:33	3	0
36	34	55	2025-06-16 16:56:05	2025-06-16 16:56:05	3	0
78	47	55	2025-06-24 18:11:14	2025-06-24 18:11:14	1	1
39	23	55	2025-06-18 05:02:24	2025-06-18 05:02:24	3	0
40	37	56	2025-06-18 05:05:44	2025-06-18 05:46:34	0	0
41	36	58	2025-06-18 12:17:59	2025-06-18 12:28:13	0	0
42	37	58	2025-06-18 14:21:07	2025-06-18 14:21:07	3	0
79	48	55	2025-06-24 18:14:25	2025-06-24 18:14:25	1	1
44	38	63	2025-06-19 12:46:54	2025-06-19 12:47:03	0	0
45	39	62	2025-06-19 13:09:18	2025-06-19 13:09:28	1	0
38	36	56	2025-06-16 17:00:37	2025-06-20 05:40:48	1	0
48	41	56	2025-06-20 07:03:48	2025-06-20 07:03:48	1	1
53	42	61	2025-06-21 03:10:40	2025-06-21 03:10:40	1	1
55	43	58	2025-06-21 14:42:06	2025-06-21 14:42:06	1	1
54	41	58	2025-06-21 14:38:42	2025-06-21 14:56:30	1	0
56	43	56	2025-06-21 15:14:02	2025-06-21 15:14:20	1	0
57	39	58	2025-06-21 19:29:21	2025-06-21 19:29:21	3	0
58	35	58	2025-06-21 19:44:40	2025-06-21 19:44:40	3	0
59	44	61	2025-06-22 05:27:14	2025-06-22 05:27:14	1	1
60	44	56	2025-06-22 05:33:22	2025-06-22 05:33:45	1	0
61	33	56	2025-06-22 05:50:54	2025-06-22 05:50:54	3	0
62	43	61	2025-06-22 05:50:58	2025-06-22 05:54:20	1	0
64	37	61	2025-06-22 18:08:44	2025-06-22 18:08:44	3	0
65	32	61	2025-06-22 18:09:33	2025-06-22 18:09:33	3	0
63	41	55	2025-06-22 15:31:09	2025-06-23 06:52:56	1	0
66	44	38	2025-06-23 05:45:51	2025-06-23 10:34:16	1	0
67	39	56	2025-06-23 09:46:42	2025-06-23 10:51:42	1	0
68	39	61	2025-06-23 10:46:30	2025-06-23 10:51:46	1	0
46	39	55	2025-06-19 18:32:56	2025-06-23 10:51:53	1	0
69	45	62	2025-06-23 12:18:33	2025-06-23 12:18:33	1	1
70	45	61	2025-06-23 23:39:55	2025-06-24 06:25:45	1	0
71	45	63	2025-06-24 06:25:53	2025-06-24 06:26:07	1	0
72	46	62	2025-06-24 06:48:18	2025-06-24 06:48:18	1	1
75	46	63	2025-06-24 07:11:54	2025-06-24 07:12:29	1	0
77	46	61	2025-06-24 11:15:56	2025-06-24 11:16:29	1	0
76	46	64	2025-06-24 10:22:18	2025-06-24 11:16:31	1	0
74	46	55	2025-06-24 06:58:14	2025-06-24 11:16:33	1	0
\.


--
-- Data for Name: journeys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journeys (id, title, destination, accommodation, accommodation_link, date, created_at, updated_at, user_id, start_date, end_date, map_link, cost, small_description, file_name, country_id) FROM stdin;
45	London Bridge	London	Paramount hotel UK	https://www.google.com/travel/hotels/s/JMQVZjT5K6wsARp98	2025-06-23	2025-06-23 12:18:33	2025-06-23 12:18:33	62	2025-07-18	2025-07-19	\N	\N	\N	17506809546859457a29907.	190
46	Egypt	Cairo, Egypt	Pyramid Hotel	https://www.google.com/travel/hotels/s/RWBjvji5hGzzZLi39	2025-06-24	2025-06-24 06:48:18	2025-06-24 06:48:18	62	2025-07-19	2025-07-20	\N	\N	\N	1750747591685a49c75f164.	57
11	Mix of Adventure, Relaxation, and Culture	Bali, Indonesia	The Seminyak Suite Private Villas	https://www.seminyaksuites.com/	2025-04-28	2025-04-28 06:30:59	2025-04-28 08:17:48	14	2025-06-01	2025-06-03	https://www.google.com/maps/place/Bali,+Indonesia	\N	\N	\N	0
13	test	pars	asd	https://dx.com	2025-05-19	2025-05-19 09:43:58	2025-05-19 09:43:58	15	2025-05-23	2025-05-31	https://dx.com	\N	sub descit	\N	0
14	test	des	acad	https://facebook.com	2025-05-20	2025-05-20 11:42:29	2025-05-20 11:42:29	12	2025-05-19	2025-05-25	\N	\N	\N	\N	0
29	My Journey title ee	Dubai	Accomodations Test	https://example.com	2025-06-05	2025-06-05 06:46:37	2025-06-05 21:23:38	37	2025-06-06	2025-06-07	\N	\N	\N	174915861768420ad9c4920.	1
15	Test	test	test accomodation	https://dxbitprojects.com/travelblzr_web/public/admin/journey/create/1	2025-05-23	2025-05-23 06:33:49	2025-05-23 07:22:18	15	2025-05-23	2025-05-24	https://dxbitprojects.com/travelblzr_web/public/admin/journey/create/1	\N	Descr dh jg jg jfjc hcgj	\N	0
16	Test Destination	Destination Address	Accommodation	https://example.com	2025-05-25	2025-05-25 12:54:02	2025-05-25 12:54:02	35	2025-05-25	2025-05-26	\N	\N	\N	1748177576683312a873433.	0
17	Trip to Hunza	Hunza	Eagle Nest Hotel	https://maps.app.goo.gl/rdAKY1Eh77neZh8U9	2025-05-26	2025-05-26 08:45:51	2025-05-26 08:45:51	35	2025-06-01	2025-06-03	\N	\N	\N	1748248827683428fb502de.	0
18	test title	destination	accomodations test	https://example.com	2025-06-02	2025-06-02 06:01:50	2025-06-02 06:01:50	37	2025-06-02	2025-06-03	\N	\N	\N	1748843855683d3d4f54579.	1
19	Journey Title	Downtown Dubai	accomodations	https://example.com	2025-06-02	2025-06-02 06:48:23	2025-06-02 06:48:23	37	2025-06-04	2025-06-05	\N	\N	\N	1748846866683d491237611.	1
20	journey Title two	Dubai	accomodations	https://example.com	2025-06-02	2025-06-02 08:23:50	2025-06-02 08:23:50	37	2025-06-04	2025-06-05	\N	\N	\N	1748852585683d5f69bc8ef.	1
21	Test	Pakistan	test accomodation	https://example.com	2025-06-02	2025-06-02 09:06:55	2025-06-02 09:06:55	37	2025-06-03	2025-06-05	\N	\N	\N	1748855152683d6970557dd.	1
23	Trip to Dubai	https://maps.google.com/?q=Dubai+Marina+-+Dubai+-+United+Arab+Emirates&ftid=0x3e5f6b5402c126e3:0xb9511e6655c46d7c&entry=gps&g_st=aw	Grand Hayat	https://g.co/kgs/2tSqBLm	2025-06-03	2025-06-03 09:08:29	2025-06-03 09:08:29	35	2025-06-03	2025-06-04	\N	\N	\N	1748941343683eba1fd78cb.	1
24	test	tedt destination	accomodations	https://example.com	2025-06-03	2025-06-03 09:11:14	2025-06-03 09:11:14	37	2025-06-03	2025-06-04	\N	\N	\N	1748941827683ebc03dd33c.	1
25	yedt	destiny	accomodations	https://example.com	2025-06-03	2025-06-03 09:13:11	2025-06-03 09:13:11	37	2025-06-03	2025-06-04	\N	\N	\N	1748941950683ebc7e59498.	1
26	yedt	destiny	accomodations	https://example.com	2025-06-03	2025-06-03 09:15:28	2025-06-03 09:15:28	37	2025-06-03	2025-06-04	\N	\N	\N	1748941950683ebc7e59498.	1
27	yedt	destiny	accomodations	https://example.com	2025-06-03	2025-06-03 09:24:30	2025-06-03 09:24:30	37	2025-06-03	2025-06-04	\N	\N	\N	1748941950683ebc7e59498.	1
22	Journey Title Test	Dubai	accomodations	https://example.com	2025-06-03	2025-06-03 05:15:48	2025-06-03 11:51:37	37	2025-06-04	2025-06-05	https://example.com	\N	Description About journey.	1748927665683e84b14e466.	1
28	Marina Dubai	https://maps.app.goo.gl/VCS8KVRWSd46kgm28	Grand Hyat	https://www.hyatt.com/grand-hyatt/en-US/dxbgh-grand-hyatt-dubai	2025-06-04	2025-06-04 12:46:48	2025-06-04 12:46:48	38	2025-06-04	2025-06-06	\N	\N	\N	174904093668403f2819b16.	1
30	Dubai Marina	https://maps.app.goo.gl/VCS8KVRWSd46kgm28	Grand Hayath	https://www.hyatt.com/grand-hyatt/en-US/dxbgh-grand-hyatt-dubai	2025-06-07	2025-06-07 06:57:13	2025-06-07 07:25:36	48	2025-06-07	2025-06-08	\N	\N	\N	17492784706843df060304d.	1
31	Desert Safari	https://maps.app.goo.gl/VCS8KVRWSd46kgm28	Grand Hayat	https://www.hyatt.com/grand-hyatt/en-US/dxbgh-grand-hyatt-dubai	2025-06-07	2025-06-07 07:53:05	2025-06-07 07:53:05	48	2025-06-08	2025-06-09	\N	\N	\N	17492826566843ef60aeaf0.	1
32	trst	destination	accomodations	https://example.com	2025-06-09	2025-06-09 05:45:42	2025-06-09 05:45:42	37	2025-06-09	2025-06-10	\N	\N	\N	1749447872684674c05762c.	1
33	dtyuffgh	rtgy	dfgh	https://www.hyatt.com/grand-hyatt/en-US/dxbgh-grand-hyatt-dubai	2025-06-10	2025-06-10 07:37:04	2025-06-10 07:37:04	51	2025-06-11	2025-06-12	\N	\N	\N	17495408506847dff2526ef.	1
34	Journey	Dubai	JBR Beach	https://example.com	2025-06-11	2025-06-11 13:45:25	2025-06-11 13:45:25	37	2025-06-11	2025-06-12	\N	\N	\N	1749649400684987f824e98.	1
35	Hamid	hello	asd	http://www.google.com	2025-06-16	2025-06-16 16:36:32	2025-06-16 16:36:32	55	2025-06-16	2025-06-17	\N	\N	\N	1750091721685047c98e803.	136
37	tezt	lahore	asd	https://www.google.com	2025-06-16	2025-06-16 16:51:02	2025-06-16 16:51:02	55	2025-06-16	2025-06-19	\N	\N	\N	175009259668504b344c236.	1
36	hello hamid	lahore	provided	http://www.google.co	2025-06-16	2025-06-16 16:39:55	2025-06-16 16:53:02	55	2025-06-18	2025-06-19	\N	\N	\N	1750091962685048ba85328.	189
38	Trip to Salalah	Salalah	Salalah Beach Resorts	https://www.google.com/travel/hotels/s/38Bs76CegzBUqMAt8	2025-06-19	2025-06-19 12:29:05	2025-06-19 12:29:05	62	2025-06-28	2025-06-29	\N	\N	\N	1750335778685401224aa59.	1
39	Burj ul Arab Journey	Dubai, UAE	Jumeirah Pine Hotel	https://www.google.com/travel/hotels/s/y2uS6mpAXL5jk1RQA	2025-06-19	2025-06-19 13:07:19	2025-06-19 13:07:19	63	2025-07-01	2025-07-02	\N	\N	\N	175033830968540b055bdef.	1
41	Member test	Lahore	yes	https://www.google.com	2025-06-20	2025-06-20 07:03:48	2025-06-20 18:13:43	56	2025-06-23	2025-06-25	\N	\N	\N	17504432236855a4d764d2e.	136
42	Dubai Tour	Dubai	Radiison Parkin Dubai	https://www.radissonhotels.com/en-us/hotels/park-inn-dubai-motor-city	2025-06-21	2025-06-21 03:10:40	2025-06-21 03:10:40	61	2025-06-22	2025-06-24	\N	\N	\N	17504753066856222a2a52b.	1
43	Member test	Lahore	Model town	https://www.google.com	2025-06-21	2025-06-21 14:42:06	2025-06-21 14:42:06	58	2025-06-21	2025-06-22	\N	\N	\N	17505168466856c46edb60a.	136
44	Dubai Marina Trip	Dubai	Grand Hayat	https://www.hyatt.com/en-US/member/enroll?icamp=woh_enrolllink_offerspage_en	2025-06-22	2025-06-22 05:27:14	2025-06-22 05:27:14	61	2025-06-22	2025-06-24	\N	\N	\N	1750569507685792238fe5e.	1
47	test	Lahore	Google	http://www.google.com	2025-06-24	2025-06-24 18:11:14	2025-06-24 18:11:14	55	2025-06-29	2025-06-30	\N	\N	\N	1750788634685aea1ac2e57.	136
48	day test	Lahore	accomodation	http://www.google.com	2025-06-24	2025-06-24 18:14:25	2025-06-24 18:14:25	55	2025-06-25	2025-06-29	\N	\N	\N	1750788816685aead05c278.	136
\.


--
-- Data for Name: marked_check_lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marked_check_lists (id, user_id, journey_id, check_list_id, created_at, updated_at) FROM stdin;
2	56	36	80	2025-06-21 05:02:40	2025-06-21 05:02:40
5	58	41	88	2025-06-21 14:59:23	2025-06-21 14:59:23
9	58	41	96	2025-06-21 15:04:42	2025-06-21 15:04:42
14	56	43	95	2025-06-21 15:14:41	2025-06-21 15:14:41
15	56	43	93	2025-06-21 15:14:41	2025-06-21 15:14:41
16	56	43	94	2025-06-21 15:14:42	2025-06-21 15:14:42
17	56	41	96	2025-06-21 17:15:03	2025-06-21 17:15:03
18	56	41	97	2025-06-21 17:15:03	2025-06-21 17:15:03
19	61	42	89	2025-06-22 05:12:44	2025-06-22 05:12:44
20	61	42	90	2025-06-22 05:12:44	2025-06-22 05:12:44
29	61	43	93	2025-06-22 18:53:53	2025-06-22 18:53:53
32	58	43	94	2025-06-22 18:56:25	2025-06-22 18:56:25
33	58	43	95	2025-06-22 18:56:25	2025-06-22 18:56:25
34	58	43	93	2025-06-22 18:56:26	2025-06-22 18:56:26
35	61	43	94	2025-06-22 18:58:17	2025-06-22 18:58:17
38	61	43	95	2025-06-22 18:58:29	2025-06-22 18:58:29
39	61	39	86	2025-06-23 11:06:03	2025-06-23 11:06:03
41	61	39	87	2025-06-23 16:40:05	2025-06-23 16:40:05
42	55	39	86	2025-06-23 20:02:13	2025-06-23 20:02:13
43	55	39	87	2025-06-23 20:02:15	2025-06-23 20:02:15
44	63	45	108	2025-06-24 06:26:34	2025-06-24 06:26:34
45	63	45	109	2025-06-24 06:26:34	2025-06-24 06:26:34
46	63	45	111	2025-06-24 06:26:34	2025-06-24 06:26:34
47	63	45	110	2025-06-24 06:26:35	2025-06-24 06:26:35
48	61	45	108	2025-06-24 11:05:22	2025-06-24 11:05:22
49	61	45	109	2025-06-24 11:05:22	2025-06-24 11:05:22
50	61	45	110	2025-06-24 11:05:34	2025-06-24 11:05:34
\.


--
-- Data for Name: media_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media_files (id, media_id, file_name, height, width, extension, duration, thumb_image, have_hls_url, hls_url, hls_cdn_url, created_at, updated_at) FROM stdin;
1	1	17506589326858ef7459e34.png	\N	\N	\N	\N	\N	0	\N	\N	2025-06-23 06:08:52	2025-06-23 06:08:52
2	1	17506589326858ef74942dd.jpg	\N	\N	\N	\N	\N	0	\N	\N	2025-06-23 06:08:52	2025-06-23 06:08:52
3	2	1750763943685a89a7e60d5.jpeg	\N	\N	\N	\N	\N	0	\N	\N	2025-06-24 11:19:04	2025-06-24 11:19:04
4	3	1750778154685ac12a71e83.mp4	\N	\N	\N	\N	\N	0	\N	\N	2025-06-24 15:15:54	2025-06-24 15:15:54
5	4	1750789832685aeec882c3a.jpg	\N	\N	\N	\N	\N	0	\N	\N	2025-06-24 18:30:32	2025-06-24 18:30:32
6	4	1750789832685aeec8c18d4.jpg	\N	\N	\N	\N	\N	0	\N	\N	2025-06-24 18:30:32	2025-06-24 18:30:32
7	5	1750795004685b02fc2d7af.jpg	\N	\N	\N	\N	\N	0	\N	\N	2025-06-24 19:56:44	2025-06-24 19:56:44
8	5	1750795004685b02fc66a25.jpg	\N	\N	\N	\N	\N	0	\N	\N	2025-06-24 19:56:44	2025-06-24 19:56:44
9	5	1750795004685b02fc82917.jpg	\N	\N	\N	\N	\N	0	\N	\N	2025-06-24 19:56:44	2025-06-24 19:56:44
10	5	1750795004685b02fc9ea11.jpg	\N	\N	\N	\N	\N	0	\N	\N	2025-06-24 19:56:44	2025-06-24 19:56:44
11	6	1750796396685b086c584c4.jpg	\N	\N	\N	\N	\N	0	\N	\N	2025-06-24 20:19:56	2025-06-24 20:19:56
12	6	1750796396685b086c88912.jpg	\N	\N	\N	\N	\N	0	\N	\N	2025-06-24 20:19:56	2025-06-24 20:19:56
13	6	1750796396685b086c97d5f.jpg	\N	\N	\N	\N	\N	0	\N	\N	2025-06-24 20:19:56	2025-06-24 20:19:56
14	6	1750796396685b086cacd06.jpg	\N	\N	\N	\N	\N	0	\N	\N	2025-06-24 20:19:56	2025-06-24 20:19:56
15	7	1750797305685b0bf909aa8.mp4	\N	\N	\N	\N	\N	0	\N	\N	2025-06-24 20:35:05	2025-06-24 20:35:05
16	7	1750797305685b0bf93a650.mp4	\N	\N	\N	\N	\N	0	\N	\N	2025-06-24 20:35:05	2025-06-24 20:35:05
17	8	1750820181685b655586aef.jpg	\N	\N	\N	\N	\N	0	\N	\N	2025-06-25 02:56:21	2025-06-25 02:56:21
18	9	1750820238685b658eb5057.jpg	\N	\N	\N	\N	\N	0	\N	\N	2025-06-25 02:57:18	2025-06-25 02:57:18
19	10	1750820307685b65d3788ab.jpg	\N	\N	\N	\N	\N	0	\N	\N	2025-06-25 02:58:27	2025-06-25 02:58:27
20	10	1750820307685b65d3a9373.jpg	\N	\N	\N	\N	\N	0	\N	\N	2025-06-25 02:58:27	2025-06-25 02:58:27
21	10	1750820307685b65d3bd064.jpg	\N	\N	\N	\N	\N	0	\N	\N	2025-06-25 02:58:27	2025-06-25 02:58:27
22	10	1750820307685b65d3cb145.jpg	\N	\N	\N	\N	\N	0	\N	\N	2025-06-25 02:58:27	2025-06-25 02:58:27
23	10	1750820307685b65d3daa61.jpg	\N	\N	\N	\N	\N	0	\N	\N	2025-06-25 02:58:27	2025-06-25 02:58:27
\.


--
-- Data for Name: medias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medias (id, user_id, title, destination, country_id, date, created_at, updated_at) FROM stdin;
1	59	frist	dubai	5	\N	2025-06-23 06:08:52	2025-06-23 06:08:52
2	60	My Media	Dubai	5	2024-07-11	2025-06-24 11:19:04	2025-06-24 11:19:04
3	60	My Media	Dubai	5	2024-07-11	2025-06-24 15:15:54	2025-06-24 15:15:54
4	60	My media images	Dubai	6	2025-06-26	2025-06-24 18:30:32	2025-06-24 18:30:32
5	59	New media	Islamabad	6	2025-06-27	2025-06-24 19:56:44	2025-06-24 19:56:44
6	60	My videos and images	Isb	6	2025-06-26	2025-06-24 20:19:56	2025-06-24 20:19:56
7	60	Videos	Dubai	6	2025-06-26	2025-06-24 20:35:05	2025-06-24 20:35:05
8	61	Dubai Hotels	aDubai	1	2025-06-25	2025-06-25 02:56:21	2025-06-25 02:56:21
9	61	Dubai	Dubai	1	2025-06-25	2025-06-25 02:57:18	2025-06-25 02:57:18
10	61	Dubai	Dubai Marina	1	2025-06-25	2025-06-25 02:58:27	2025-06-25 02:58:27
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
77	2025_05_06_090724_create_post_files_table	31
78	2025_05_19_102336_create_temp_journeys_table	32
79	2025_05_19_102855_create_temp_itineraries_table	32
80	2025_05_19_104424_create_temp_check_lists_table	32
81	2025_05_19_104943_create_temp_cost_break_downs_table	32
82	2025_05_20_072827_alter_add_file_name_to_journeys	32
83	2025_05_21_114957_alter_add_fields_to_journey_participants	33
84	2025_05_29_072434_later_add_flag_to_countries	34
85	2025_05_29_094219_create_follows_table	34
86	2025_05_29_110847_alter_add_last_ping_timestamp_to_users	34
87	2025_05_29_111259_alter_add_country_id_to_temp_users	34
88	2025_05_29_153157_create_bookmarks_table	35
89	2025_05_30_061216_alter_add_deleted_to_users	35
90	2025_05_30_113347_alter_add_country_id_to_journeys	35
91	2025_05_30_113811_alter_add_country_id_to_temp_journeys	35
92	2025_05_31_114948_create_activity_logs_table	36
93	2025_06_02_094302_add_multiple_column_to_user_table	37
94	2025_06_02_143427_add_biometric_token_to_users_table	37
95	2025_06_03_123814_create_contact_details_table	38
96	2025_06_03_154352_add_data_to_contact_detail	38
97	2025_06_11_115454_create_medias_table	39
98	2025_06_11_115646_create_media_files_table	39
99	2025_06_17_071537_create_poll_options_table	40
100	2025_06_17_071547_create_poll_votes_table	40
101	2025_06_17_084207_create_block_users_table	40
102	2025_06_17_091200_add_indexes_to_post_poll_votes_table	41
103	2025_06_17_120917_alter_add-remark_to_block_users	42
104	2025_06_17_120944_create_post_reports_table	42
105	2025_06_18_051438_create_push_requests_table	43
106	2025_06_20_061123_alter_add_is_owner_to_journey_participants	44
107	2025_06_20_103243_create_user_loged_devices_table	45
108	2025_06_21_042600_create_marked_check_lists_table	46
109	2025_06_24_045306_alter_add_soft_deletes_to_posts	47
110	2025_06_24_075428_alter_add_meta_data_to_user_activities	48
111	2025_06_24_101851_alter_add_description_to_countries	49
112	2025_06_24_131411_alter_add_chat_type_to_push_requests	50
113	2025_06_25_040726_create_settings_table	51
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
3	App\\Models\\User	37
3	App\\Models\\User	32
3	App\\Models\\User	47
3	App\\Models\\User	52
3	App\\Models\\User	46
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
116	App\\Models\\User	27	Personal Access Token	ac67c9bcef9d2e5fb6e06014a17f778de48875f92c6accfdf7102de958c6db84	["*"]	\N	\N	2025-05-06 08:08:09	2025-05-06 08:08:09
117	App\\Models\\User	27	Personal Access Token	16602051ffe58f6df9657c7805a3954aa75c7b08ce37b16f5e960d3a98e1f706	["*"]	\N	\N	2025-05-06 08:13:11	2025-05-06 08:13:11
118	App\\Models\\User	27	Personal Access Token	e5b3f7a5ebf5904d9cfa039ce6e91ff9683379e9b5a55739626cc4bbe10434f2	["*"]	\N	\N	2025-05-06 11:15:40	2025-05-06 11:15:40
119	App\\Models\\User	27	Personal Access Token	953e56eda01397e778f2d1c8a432a9d1e05da150dcb8fbe6c9d91d562c21f1c2	["*"]	\N	\N	2025-05-06 11:17:34	2025-05-06 11:17:34
120	App\\Models\\User	27	Personal Access Token	f7a4879b20cdaaf46e078a48b5ec6edaf903a9cd81e2eceaa77da4933e0d82aa	["*"]	\N	\N	2025-05-06 11:21:49	2025-05-06 11:21:49
121	App\\Models\\User	28	Personal Access Token	3c3e19689c9acfed013eebd42c75b80e3e75c85d51b921e33f61f47cca1fef00	["*"]	\N	\N	2025-05-06 14:44:12	2025-05-06 14:44:12
122	App\\Models\\User	28	Personal Access Token	6b2d10a2f41df855606a9542c029948c5cb43bc7eed070e7f74c97ecbdc7f126	["*"]	\N	\N	2025-05-06 14:47:37	2025-05-06 14:47:37
123	App\\Models\\User	28	Personal Access Token	31de4ceb6407840c6732949a7831022129de97f89afb03a3b6c731f9977f5208	["*"]	\N	\N	2025-05-06 14:51:42	2025-05-06 14:51:42
124	App\\Models\\User	28	Personal Access Token	a1f229f21ea984299982b70bb07d6851663a10a4575778ef7ba030d2671affd7	["*"]	\N	\N	2025-05-06 14:55:42	2025-05-06 14:55:42
125	App\\Models\\User	28	Personal Access Token	6f2d2ed9022768c6c6d9d00b4afe5fe3fe5b2237653505ba2ce23afa6a1c1229	["*"]	\N	\N	2025-05-06 14:58:33	2025-05-06 14:58:33
126	App\\Models\\User	28	Personal Access Token	eb3084ab16f4fe4857f07e51b6bbead1b138921087965c390550410484c924c7	["*"]	\N	\N	2025-05-06 15:00:42	2025-05-06 15:00:42
127	App\\Models\\User	28	Personal Access Token	c2f02d9d3bddb097b7b4e2ece5d19a0f26ec791b554f35b2ed3f5c7410c06b0f	["*"]	\N	\N	2025-05-06 15:02:04	2025-05-06 15:02:04
128	App\\Models\\User	28	Personal Access Token	e2af5b37059f43e85adafeb8de6742a8746c7e2e5c7c59c79ebe5a3bff7e9fb1	["*"]	\N	\N	2025-05-06 15:09:28	2025-05-06 15:09:28
129	App\\Models\\User	28	Personal Access Token	87f6e375527eb50eae7a8f5532eccc3931044aac0749bc093bb9625d166e08af	["*"]	\N	\N	2025-05-06 15:12:07	2025-05-06 15:12:07
130	App\\Models\\User	28	Personal Access Token	d4132ee2b4887ca9f9a61fd8dde6239602c923c5fe1125c3377fbbc592c2caa9	["*"]	\N	\N	2025-05-06 15:13:47	2025-05-06 15:13:47
131	App\\Models\\User	28	Personal Access Token	bd8504ecea4e9b171854453d5cefc4dcaeab712ffea3d4089c509a388f42cbed	["*"]	\N	\N	2025-05-06 15:18:59	2025-05-06 15:18:59
132	App\\Models\\User	28	Personal Access Token	5b01c9855c3e95e40c62647348f63733dafe35f3a847d306f0dd96d8e63bddaa	["*"]	\N	\N	2025-05-06 15:22:19	2025-05-06 15:22:19
133	App\\Models\\User	28	Personal Access Token	2d1af0c6979d2275e0fd09bfbb50921b695a1c5d20cd9b972f6f3ce1e022b74a	["*"]	\N	\N	2025-05-06 15:32:51	2025-05-06 15:32:51
134	App\\Models\\User	28	Personal Access Token	377952cdca54143bd3e84ba5e92e2ccabad4084c5da464fad51a696313bccccf	["*"]	\N	\N	2025-05-06 17:44:36	2025-05-06 17:44:36
135	App\\Models\\User	12	Personal Access Token	58ee23328aa023b42a3af429d75df47297fc85f099a755b9157c34d99c2e69fa	["*"]	\N	\N	2025-05-20 11:40:32	2025-05-20 11:40:32
136	App\\Models\\User	34	Personal Access Token	dc03559ef6868787f6248bb660655233763c1e420c50f7123176ad2c433fd8df	["*"]	\N	\N	2025-05-21 07:49:37	2025-05-21 07:49:37
137	App\\Models\\User	34	Personal Access Token	e218fa81f4ab9f126926289c4faead2f5392efa93c615806282c68b7b82cb470	["*"]	\N	\N	2025-05-21 07:49:38	2025-05-21 07:49:38
138	App\\Models\\User	35	Personal Access Token	f3b1ec5b95ba464be139f717b750b86bcaead1f180c0510eb5d56202125584cd	["*"]	\N	\N	2025-05-22 11:17:12	2025-05-22 11:17:12
139	App\\Models\\User	35	Personal Access Token	718fe395a2fd04d49080628cefa77305bd105736d5ccccc4b47d5ce7b188e3c6	["*"]	\N	\N	2025-05-22 11:17:12	2025-05-22 11:17:12
140	App\\Models\\User	35	Personal Access Token	126aa7d411b1a497ac0654f2e5c25051a805c092dca3788793a29dab27d6c440	["*"]	\N	\N	2025-05-23 07:12:39	2025-05-23 07:12:39
141	App\\Models\\User	35	Personal Access Token	94d93c13aab352988e4c3f7fbad401f476f728ee46bccbe7ea702e82e3d5a168	["*"]	\N	\N	2025-05-23 07:12:40	2025-05-23 07:12:40
142	App\\Models\\User	35	Personal Access Token	90d7fff634d6873161eec834a0b4110459580a6648154c0e8c0152d216d925fe	["*"]	\N	\N	2025-05-26 04:48:05	2025-05-26 04:48:05
143	App\\Models\\User	35	Personal Access Token	bbebe2b0ceb3ac17e22abad14e2db028f2b24e68be2ac84f3e11c9bd87966a22	["*"]	\N	\N	2025-05-26 04:48:05	2025-05-26 04:48:05
144	App\\Models\\User	35	Personal Access Token	f3f6034695263dde91ee669caded958aa0d3419975cdf29407352181bc00a3da	["*"]	\N	\N	2025-05-26 08:33:04	2025-05-26 08:33:04
145	App\\Models\\User	35	Personal Access Token	9b24cff5ecfba98c533ade03a45a6222265b1a5348de5ad342ffd17646947325	["*"]	\N	\N	2025-05-26 08:33:05	2025-05-26 08:33:05
146	App\\Models\\User	35	Personal Access Token	b396c9538af10983ee9cfc696fb0f68546bb579e64f43c8001db44b759c05bcd	["*"]	\N	\N	2025-05-29 04:32:55	2025-05-29 04:32:55
147	App\\Models\\User	35	Personal Access Token	abbeaaac87205e1384f22d2f45fb38afb4f1babb09576e8c7c6d35970b29160e	["*"]	\N	\N	2025-05-29 04:32:56	2025-05-29 04:32:56
148	App\\Models\\User	36	Personal Access Token	48cb02fe31e87f170652db30845411a12d03f39ce8a44ffb0412dc6e61e4f96c	["*"]	\N	\N	2025-05-29 04:36:02	2025-05-29 04:36:02
149	App\\Models\\User	36	Personal Access Token	8f3bcdc1f20ae4cbc827ad0222c71170a81ee671aa0367d9e4c5ab6b1b703150	["*"]	\N	\N	2025-05-31 12:32:50	2025-05-31 12:32:50
150	App\\Models\\User	37	Personal Access Token	0600d1ded8a14b06ef0e965b3a4fe4d998a8b84ae48ba02d135ebc2852a28226	["*"]	\N	\N	2025-06-02 05:11:57	2025-06-02 05:11:57
151	App\\Models\\User	35	Personal Access Token	d0d8b9255c6260f413769cd17555c7df7d514d98873a953e83e68850024448aa	["*"]	\N	\N	2025-06-03 08:43:39	2025-06-03 08:43:39
152	App\\Models\\User	35	Personal Access Token	8417546bef0d06623b368ff30136f48b74bfc7b76182acb66e955eaecad8d7f7	["*"]	\N	\N	2025-06-03 08:43:40	2025-06-03 08:43:40
153	App\\Models\\User	35	Personal Access Token	6bd941d5940d201d94c9520ab36b4c871b3e0177f4a8a8a313503d17f281a18d	["*"]	\N	\N	2025-06-03 10:02:47	2025-06-03 10:02:47
154	App\\Models\\User	35	Personal Access Token	221603426837be29b2cea5b7bb0fe80b8671a98805c15998cb2fbce4defd9a22	["*"]	\N	\N	2025-06-03 10:02:48	2025-06-03 10:02:48
155	App\\Models\\User	38	Personal Access Token	ff73ea35ad4776181e5e9408b399460136882508583cd67ce16d758c2ba91f6d	["*"]	\N	\N	2025-06-03 11:25:14	2025-06-03 11:25:14
156	App\\Models\\User	38	Personal Access Token	d0bf3fc16d3eab7a457537942007bbe8d3046bb4e54efef413e2cdc9e88c1e8a	["*"]	\N	\N	2025-06-03 11:25:45	2025-06-03 11:25:45
157	App\\Models\\User	31	Personal Access Token	073c3a1fa31a2ee6c3dd57a0e5e9a1a1af5b5932dba975059fa6f11c19102ab6	["*"]	\N	\N	2025-06-03 11:33:23	2025-06-03 11:33:23
158	App\\Models\\User	38	Personal Access Token	128ca93eba37da0ac3e9703b35b755837ee33b39901612d59caf2fa4229e3e52	["*"]	\N	\N	2025-06-03 11:36:11	2025-06-03 11:36:11
159	App\\Models\\User	39	Personal Access Token	4f11d378505cd4fd30d0a2d1cae8054a69c14fa944e0a164f5757b879c382c2a	["*"]	\N	\N	2025-06-04 04:42:34	2025-06-04 04:42:34
160	App\\Models\\User	39	Personal Access Token	de72805b138ba2dfe9f0aee9ca3e4821adb878922bb5364a71eb06208e228c38	["*"]	\N	\N	2025-06-04 04:43:04	2025-06-04 04:43:04
161	App\\Models\\User	37	Personal Access Token	bbc705848693de1c603a8984802215382f554e0b45a1fcd1164cd0e98b8ffed4	["*"]	\N	\N	2025-06-04 05:14:36	2025-06-04 05:14:36
162	App\\Models\\User	38	Personal Access Token	151b3470154786c444b05c7d8970c7ebb31a80dc4cab9385dfb320542867178a	["*"]	\N	\N	2025-06-04 10:47:56	2025-06-04 10:47:56
163	App\\Models\\User	38	Personal Access Token	4f660a249f48f67d2a09549efa1be6899ea97820da4f8bf0ba0bc38d58962357	["*"]	\N	\N	2025-06-04 12:34:59	2025-06-04 12:34:59
164	App\\Models\\User	43	Personal Access Token	dc34623e1d4122e118f77db284819360297e437548ee87cf22ad59d7b2e390b6	["*"]	\N	\N	2025-06-04 13:26:36	2025-06-04 13:26:36
165	App\\Models\\User	35	Personal Access Token	2b8e6aeffc182f5692771b2d0754d35acc94b55c647ca3917d6c1d1ab477c585	["*"]	\N	\N	2025-06-04 13:27:49	2025-06-04 13:27:49
166	App\\Models\\User	35	Personal Access Token	63fa642f9365e5d4e42de0b1295cd3cd0f24b6d5b230827e841eb7f28dd041a6	["*"]	\N	\N	2025-06-04 13:27:50	2025-06-04 13:27:50
167	App\\Models\\User	44	Personal Access Token	afaecc8b4fcac238b8e534b136d8b405257b8ee6ec586a6b09ef8cbdb2f3f977	["*"]	\N	\N	2025-06-04 13:40:28	2025-06-04 13:40:28
168	App\\Models\\User	45	Personal Access Token	5ee7e4fe3618805b6b045b42f29c85cf586376f9f08695628b8fe66ce8896591	["*"]	\N	\N	2025-06-04 13:54:57	2025-06-04 13:54:57
169	App\\Models\\User	45	Personal Access Token	54defbbe96c01313222fe7603f071998fdf26fa1a6568b630b0a4905586f2902	["*"]	\N	\N	2025-06-04 13:54:58	2025-06-04 13:54:58
170	App\\Models\\User	37	Personal Access Token	99a55833bc5fcf3eef3f734bf71ee0df7502e9496456dcd2e074cf70b90a766c	["*"]	\N	\N	2025-06-05 05:33:27	2025-06-05 05:33:27
171	App\\Models\\User	37	Personal Access Token	83bb85791e2b9a1010dfc722f049d5ca91aaaab5281deb430a80106a1faca3d2	["*"]	\N	\N	2025-06-05 05:40:09	2025-06-05 05:40:09
172	App\\Models\\User	46	Personal Access Token	056fd5892316cf9c92907f44c9d2137d46c0bab65215ebf35a6ec67efd890b9c	["*"]	\N	\N	2025-06-05 05:51:51	2025-06-05 05:51:51
173	App\\Models\\User	46	Personal Access Token	3bb29b7c32f3c1cfd26c62c9aa2b03fbefb4e2f141385d2c7a462b2ee1c99441	["*"]	\N	\N	2025-06-05 05:52:25	2025-06-05 05:52:25
174	App\\Models\\User	37	Personal Access Token	7423e091a812963dc75f80f1da028c0d881aa84163ed19d5009486ebbb6caa50	["*"]	\N	\N	2025-06-05 05:52:47	2025-06-05 05:52:47
175	App\\Models\\User	46	Personal Access Token	692006533064046a12bcf9dc095abc897050abd465b1828594cd2d7c683a030d	["*"]	\N	\N	2025-06-05 11:04:49	2025-06-05 11:04:49
176	App\\Models\\User	37	Personal Access Token	cdda559367396af01ff29efa3a0b66a6ec5e61147b02e60cbb4744f275df2e88	["*"]	\N	\N	2025-06-05 11:05:18	2025-06-05 11:05:18
177	App\\Models\\User	47	Personal Access Token	5326938d9ac99e4417acb4ad774c37f8fc04dd24ee1fdabfcb9974373e0ebf56	["*"]	\N	\N	2025-06-05 12:42:23	2025-06-05 12:42:23
178	App\\Models\\User	39	Personal Access Token	6467e62c5cb2efedb7a00c6bfe905903ac422eaf61c654f79c91af6f72633ba3	["*"]	\N	\N	2025-06-05 12:44:42	2025-06-05 12:44:42
179	App\\Models\\User	37	Personal Access Token	7392ade0fb31a542c613cfd61497155b19abeb43663824febb56e9d5e050b560	["*"]	\N	\N	2025-06-05 12:45:19	2025-06-05 12:45:19
180	App\\Models\\User	48	Personal Access Token	3f3406888861ce0cf0acefe283d5d25531364021ae3d337c59570e8e1488c3cc	["*"]	\N	\N	2025-06-06 09:28:19	2025-06-06 09:28:19
181	App\\Models\\User	48	Personal Access Token	e0ee36ac4cb28c07115b3b487696eb180eb453d840ed70901f58cc1fe12e7795	["*"]	\N	\N	2025-06-07 06:36:21	2025-06-07 06:36:21
182	App\\Models\\User	45	Personal Access Token	fa141da1abec4a18baeb67b758cf6ea992c7ed31ea5c30ea84ad349842a0367b	["*"]	\N	\N	2025-06-07 09:18:56	2025-06-07 09:18:56
183	App\\Models\\User	49	Personal Access Token	871a90e5ade11b631ba54974b66ab3335d353a2621e2f62143d4356d96292572	["*"]	\N	\N	2025-06-07 09:41:24	2025-06-07 09:41:24
184	App\\Models\\User	38	Personal Access Token	ac9fd8b8fdbf37ea523322a43123542b8a593c2ca9a3600932e662a4926c2a5f	["*"]	\N	\N	2025-06-07 11:28:08	2025-06-07 11:28:08
185	App\\Models\\User	50	Personal Access Token	00c77fe8fbbc74e9af316bb7fe0c3273c25ce2dd2e03f1c277218c9f1c067abb	["*"]	\N	\N	2025-06-09 12:19:44	2025-06-09 12:19:44
186	App\\Models\\User	50	Personal Access Token	7623c076e4744de96ffad9a1b7a2ec90521a2a140f46e0e9947f3ae62a248602	["*"]	\N	\N	2025-06-09 12:21:44	2025-06-09 12:21:44
187	App\\Models\\User	37	Personal Access Token	9adbf240b0204fbff579a8f51e09d6a4ec910f70317889f5f5ec57935cb0b252	["*"]	\N	\N	2025-06-09 15:28:48	2025-06-09 15:28:48
188	App\\Models\\User	37	Personal Access Token	7cfcd8299ab54549a078265168d6452b81287012b9dfc513de5a45822e403050	["*"]	\N	\N	2025-06-09 15:32:27	2025-06-09 15:32:27
189	App\\Models\\User	37	Personal Access Token	55ee5f0ebc6aa298e736d96ada0e0c615477e5481127de950550a7a9f5d01f89	["*"]	\N	\N	2025-06-09 15:54:15	2025-06-09 15:54:15
190	App\\Models\\User	51	Personal Access Token	ca2d9a320f766417f14efaa70cd35384c35f9682b7fc4847f3989f1b8f5f502e	["*"]	\N	\N	2025-06-10 06:29:33	2025-06-10 06:29:33
191	App\\Models\\User	47	Personal Access Token	1b215be28d475fa8fa857b681e7d65a783e304f38c351ae7fa972708b371fd97	["*"]	\N	\N	2025-06-10 11:52:38	2025-06-10 11:52:38
192	App\\Models\\User	37	Personal Access Token	dee659a80118e672cfe3a9503b6ccd35bd457a0a1481d71ba47aca898e061b56	["*"]	\N	\N	2025-06-10 11:53:18	2025-06-10 11:53:18
193	App\\Models\\User	46	Personal Access Token	c208a32bd63f1f0f64abf8f1805272c155613c1757614cd1358eda3e79987299	["*"]	\N	\N	2025-06-10 11:54:05	2025-06-10 11:54:05
194	App\\Models\\User	37	Personal Access Token	d9e8595e56f55c239057318b8e5cbf99ad6e36c8e694ceab0409d92d32c61bdc	["*"]	\N	\N	2025-06-11 03:52:08	2025-06-11 03:52:08
195	App\\Models\\User	47	Personal Access Token	2284bd06a7a6221c3bc768b33f3a01dd7321ab11ffa0ec1042bae7b1c26c8370	["*"]	\N	\N	2025-06-11 06:23:02	2025-06-11 06:23:02
196	App\\Models\\User	47	Personal Access Token	7631a991de198de530eb651e17c0a1ad71b3e4a09c152c5f0f27f4b1a61b0706	["*"]	\N	\N	2025-06-11 06:23:09	2025-06-11 06:23:09
197	App\\Models\\User	47	Personal Access Token	00488cc776b5e77a38db62b00ccb9cea34cef00e816840a1dcd883a04fc619e0	["*"]	\N	\N	2025-06-11 06:36:54	2025-06-11 06:36:54
198	App\\Models\\User	46	Personal Access Token	f83b6a6bc26dee3705a83f13fe8de629c0b02dc22050e669e8b0c8958edb36fd	["*"]	\N	\N	2025-06-11 06:38:35	2025-06-11 06:38:35
199	App\\Models\\User	47	Personal Access Token	4235a0a356d99ba0a73c0588e14f51f42c376b51cbbe86397169025686716bad	["*"]	\N	\N	2025-06-11 06:39:02	2025-06-11 06:39:02
200	App\\Models\\User	52	Personal Access Token	62df98551c2e63622d95c673b8960fef59569c2d7d6fd1a988499644bea3b4f8	["*"]	\N	\N	2025-06-11 07:56:35	2025-06-11 07:56:35
201	App\\Models\\User	37	Personal Access Token	cca87fd57761e4a6690f6fe78ba7ea90a717f04b4424234ade91c119d16fd080	["*"]	\N	\N	2025-06-11 07:57:29	2025-06-11 07:57:29
202	App\\Models\\User	47	Personal Access Token	2e93b360eac980bbb65b7e260b09eafa011ea5fbc1d77290c4e88d615236a019	["*"]	\N	\N	2025-06-11 07:58:34	2025-06-11 07:58:34
203	App\\Models\\User	52	Personal Access Token	3c56acccb88bb38aa3ae5a455d96941c0356b82715d41dbe6e2b5dd825ecc390	["*"]	\N	\N	2025-06-11 07:59:00	2025-06-11 07:59:00
204	App\\Models\\User	46	Personal Access Token	c7bfeff5588cd3448040615abc975885acacee1cb12797595d189be98b4595c9	["*"]	\N	\N	2025-06-11 08:16:20	2025-06-11 08:16:20
205	App\\Models\\User	52	Personal Access Token	7adb4fe5219009688741cb8de6b59eb6bea0b3e8be2b5a58e57ecc1aeae9d1aa	["*"]	\N	\N	2025-06-11 08:17:03	2025-06-11 08:17:03
206	App\\Models\\User	53	Personal Access Token	d5d1f2f4706f7eb08ece5022f64fcde4eb53563fefa33fe2a06a88aa2bfe00b6	["*"]	\N	\N	2025-06-11 08:18:03	2025-06-11 08:18:03
207	App\\Models\\User	47	Personal Access Token	938c62643f8bbf1a0bdeb3d6725ad9df2c85dc3085377610940ef7f4173686f5	["*"]	\N	\N	2025-06-11 08:46:01	2025-06-11 08:46:01
208	App\\Models\\User	46	Personal Access Token	38d2cd188cdf1f24066a461cc253fc259522e0b40ed67ef4c3ea53d6cd444114	["*"]	\N	\N	2025-06-11 09:27:54	2025-06-11 09:27:54
209	App\\Models\\User	37	Personal Access Token	af2c33b3c599da2808d3ecd5e5916f4b40e4b463a9735b35a4e206ed1ab1dc64	["*"]	\N	\N	2025-06-11 09:40:11	2025-06-11 09:40:11
210	App\\Models\\User	52	Personal Access Token	5483bc9d4d8444421b60d2a6d9823754bad95c177a396254e7762fdb6087e562	["*"]	\N	\N	2025-06-11 10:04:35	2025-06-11 10:04:35
211	App\\Models\\User	37	Personal Access Token	516f4290b709d5484e18ce2f66b6cf11ccc249c54d5b0c288d29c071fdbed84f	["*"]	\N	\N	2025-06-11 10:23:18	2025-06-11 10:23:18
212	App\\Models\\User	52	Personal Access Token	297c7699b65d6d32a64d3146876c78f9a2e1e83f53b3bd5f309f65f83bc5bbca	["*"]	\N	\N	2025-06-11 12:58:43	2025-06-11 12:58:43
213	App\\Models\\User	52	Personal Access Token	f4c432dfe420d82e8cc8bd9539cfe91ec4dc8aab12af21e6df5ce339e67db33a	["*"]	\N	\N	2025-06-11 13:08:57	2025-06-11 13:08:57
214	App\\Models\\User	37	Personal Access Token	e4f985db219879a598f0d8b01b25bce896a685024f7c6927cd24061959c5f1bb	["*"]	\N	\N	2025-06-11 13:32:57	2025-06-11 13:32:57
215	App\\Models\\User	54	Personal Access Token	b18bdf90a285e34f191f1d12f9f48e9b92921a66eec154d8610126ef333e47b5	["*"]	\N	\N	2025-06-12 03:55:24	2025-06-12 03:55:24
216	App\\Models\\User	55	Personal Access Token	dd0398eef385141b83a3eaca1a6603cb3fa8e477fd0ca685c542a67e0944a562	["*"]	\N	\N	2025-06-12 03:57:03	2025-06-12 03:57:03
217	App\\Models\\User	56	Personal Access Token	08ba967658837ab61c6f558df607bec9597c0113ceb5aea9e7790beaa3c449bc	["*"]	\N	\N	2025-06-13 13:21:48	2025-06-13 13:21:48
218	App\\Models\\User	55	Personal Access Token	5ca896ee585ebd58e440302ec94c9623919b73c1667a763afa2071be7d4dfb02	["*"]	\N	\N	2025-06-16 15:47:05	2025-06-16 15:47:05
219	App\\Models\\User	55	Personal Access Token	1746333d2b017e6594716f09862d7a5a83f4cc07315ff84fcbab3eb86951d3fd	["*"]	\N	\N	2025-06-16 16:27:36	2025-06-16 16:27:36
220	App\\Models\\User	56	Personal Access Token	ff204de8c7d1a2ce90e9b128e1a179deb4c3a87847774241e587eff51786e8c4	["*"]	\N	\N	2025-06-16 16:58:23	2025-06-16 16:58:23
221	App\\Models\\User	55	Personal Access Token	9bee86619b230149c894cb185e0cc33e2c76dafa184ba553578050fc42efe8d3	["*"]	\N	\N	2025-06-16 16:59:14	2025-06-16 16:59:14
222	App\\Models\\User	56	Personal Access Token	030e735d789f487db6e5215f6b2093f7ec2d6b1e0fdb2f06e1825d7a186b2894	["*"]	\N	\N	2025-06-16 17:00:27	2025-06-16 17:00:27
223	App\\Models\\User	56	Personal Access Token	391d07e1b646946ae91d207e340d2526234b0747ff4c0d263078eb2c6861d672	["*"]	\N	\N	2025-06-16 17:03:16	2025-06-16 17:03:16
224	App\\Models\\User	55	Personal Access Token	773fe46fc4cf5e4fa126ac20ea319b32a392dc78fd8105cff73bbd17e60c711e	["*"]	\N	\N	2025-06-16 17:06:27	2025-06-16 17:06:27
225	App\\Models\\User	57	Personal Access Token	25aee1b16798906f6742cf785955b635a10212ac16580e7072ca03868ae526d1	["*"]	\N	\N	2025-06-17 07:19:45	2025-06-17 07:19:45
226	App\\Models\\User	38	Personal Access Token	665a3127e8d8f143ef997dbc36477e2677df53bc3e96ab80c194074282b3d29e	["*"]	\N	\N	2025-06-17 08:39:02	2025-06-17 08:39:02
227	App\\Models\\User	38	Personal Access Token	d5e5208ac3a164e6907ea6bfa41f982c45c6545dea6b3632c6ad9aa7e6f46bd7	["*"]	\N	\N	2025-06-17 08:53:36	2025-06-17 08:53:36
228	App\\Models\\User	55	Personal Access Token	7fb3a9dd1ae6295bac478b60042efa003a72e2ac15684d91112eaa454d6fb61c	["*"]	\N	\N	2025-06-17 16:55:43	2025-06-17 16:55:43
229	App\\Models\\User	55	Personal Access Token	7b733ccf8ac22692a77e4b905492c1ca45b93bedee8dc8ae9062fd988dc8db6a	["*"]	\N	\N	2025-06-17 17:55:47	2025-06-17 17:55:47
230	App\\Models\\User	38	Personal Access Token	5854fc083b8bcd96975be41f1dc1f5afa3ff221c2ad16668a6b9d4ab32e66aa2	["*"]	\N	\N	2025-06-18 04:02:21	2025-06-18 04:02:21
231	App\\Models\\User	55	Personal Access Token	2ff126c64d0de466222c02fadb894b13322c74961b0f8864b01dcd4d2bd48232	["*"]	\N	\N	2025-06-18 04:41:19	2025-06-18 04:41:19
232	App\\Models\\User	55	Personal Access Token	2b68fa7308e8cb9ffca2122b483c510075001e7f66acffe84cf91fc45ead0100	["*"]	\N	\N	2025-06-18 05:01:21	2025-06-18 05:01:21
233	App\\Models\\User	56	Personal Access Token	8548a6accac2018a7f47719dc9002ff3708c003ad5d7895749229ce5de0469b2	["*"]	\N	\N	2025-06-18 05:04:51	2025-06-18 05:04:51
234	App\\Models\\User	55	Personal Access Token	624a5d6aefe24a160b8510487c630aac0ba1bccd56480d22046f605eb70d8082	["*"]	\N	\N	2025-06-18 07:08:17	2025-06-18 07:08:17
235	App\\Models\\User	56	Personal Access Token	ccf44f4fbd7e3f836ae1c2840fc3b68a6adc8560e238a50e9939d0a7e4d5f4fa	["*"]	\N	\N	2025-06-18 10:59:23	2025-06-18 10:59:23
236	App\\Models\\User	58	Personal Access Token	ddc147cc657d509d8cd489d7c0d79490f7d26cd1c929ba94688f1f1369cd3104	["*"]	\N	\N	2025-06-18 12:10:05	2025-06-18 12:10:05
237	App\\Models\\User	59	Personal Access Token	1ec0654af17543fae90fedaaa012704f94580d91dbc2a39312979a2175a83a33	["*"]	\N	\N	2025-06-18 13:33:50	2025-06-18 13:33:50
238	App\\Models\\User	59	Personal Access Token	56e1d38af103b3dba6ef6777bc486dd3d4cb729b8c64f13140bb59f4c62dee78	["*"]	\N	\N	2025-06-18 19:44:44	2025-06-18 19:44:44
239	App\\Models\\User	38	Personal Access Token	725b93e496dd7435546ac3a35afdd71b7e5b435734766e1caf9f11003a9bea28	["*"]	\N	\N	2025-06-19 02:31:37	2025-06-19 02:31:37
240	App\\Models\\User	59	Personal Access Token	6e056535f09068f7835b6b4da25f581f0034c455dc846472ef353ad323d968de	["*"]	\N	\N	2025-06-19 06:17:00	2025-06-19 06:17:00
241	App\\Models\\User	60	Personal Access Token	d3c108f3ab004753d65d9be738746a4e23dcddb0f7894f9aafa6156f7fe7d742	["*"]	\N	\N	2025-06-19 06:19:31	2025-06-19 06:19:31
242	App\\Models\\User	61	Personal Access Token	957466aff6832f08afdb1bba8cb47f85ded42de5ef605ac451158329bc5918c6	["*"]	\N	\N	2025-06-19 08:55:15	2025-06-19 08:55:15
243	App\\Models\\User	62	Personal Access Token	83c157f480ce2afee3494b94dc80efe36ad72953d572c87053c628f1a74cd0b1	["*"]	\N	\N	2025-06-19 11:59:36	2025-06-19 11:59:36
244	App\\Models\\User	63	Personal Access Token	a52dae5b951322b8a08d14443e1723498caae8febfcee1508a2e0a8d9c9a2bc7	["*"]	\N	\N	2025-06-19 12:15:40	2025-06-19 12:15:40
245	App\\Models\\User	63	Personal Access Token	07f2e7e731988ad598af82a8d7ab60526a6fbb683b4f63467f8055d9d7e48148	["*"]	\N	\N	2025-06-19 12:17:26	2025-06-19 12:17:26
246	App\\Models\\User	62	Personal Access Token	5360063904864ef28550af3a31981dc0c35cb526caf545305ea0b97f6935c2fa	["*"]	\N	\N	2025-06-19 12:39:56	2025-06-19 12:39:56
247	App\\Models\\User	56	Personal Access Token	853aaf9c46b78015338f57f302133ba97ddf7b0a503ee7d4506527679f54babd	["*"]	\N	\N	2025-06-20 05:20:56	2025-06-20 05:20:56
248	App\\Models\\User	55	Personal Access Token	e031ec5eacd378f256dda9c763b8ccaccc2391b4c1224dfd838e91ba88f50225	["*"]	\N	\N	2025-06-20 05:40:20	2025-06-20 05:40:20
249	App\\Models\\User	56	Personal Access Token	c69055155bd20e93c4827e907c078c6947b8daa95d20b60f482af3c397bbce0b	["*"]	\N	\N	2025-06-20 05:41:53	2025-06-20 05:41:53
250	App\\Models\\User	38	Personal Access Token	bb972b743f297a0078d385be2c4ec2593e5d4fdddcffcd0b2d6972c6cb8a2b48	["*"]	\N	\N	2025-06-20 10:15:08	2025-06-20 10:15:08
251	App\\Models\\User	61	Personal Access Token	44705ca27660a6b0357f4f21f6cfa988672abbe85e4976d809a47ea8d201eab1	["*"]	\N	\N	2025-06-21 03:00:04	2025-06-21 03:00:04
252	App\\Models\\User	61	Personal Access Token	cc4afb59cae7b215d4db6caf2bf17d3f9eb2df67c852f23dfcb7957d87b3e86a	["*"]	\N	\N	2025-06-22 01:09:34	2025-06-22 01:09:34
253	App\\Models\\User	61	Personal Access Token	d9ce4e1b66274df2df79715a1568d65b2ecb6ce5d3b2f36f3d86c58572c52f84	["*"]	\N	\N	2025-06-22 04:18:02	2025-06-22 04:18:02
254	App\\Models\\User	61	Personal Access Token	86eb81c35a382ed7f321f9a63d3b78c80c6e8a73a67e5a64a236b16ceb32fe39	["*"]	\N	\N	2025-06-22 05:12:25	2025-06-22 05:12:25
255	App\\Models\\User	58	Personal Access Token	d899a358f94c0c9a85b66fa684cf62569aba8fd0f21705aba3dd88ed3449415c	["*"]	\N	\N	2025-06-22 05:54:08	2025-06-22 05:54:08
256	App\\Models\\User	55	Personal Access Token	ff52fc032a3cffc9613114cdaa2bb82c2f2269a458e42a04b9ddfed9bd3ed722	["*"]	\N	\N	2025-06-22 15:29:38	2025-06-22 15:29:38
257	App\\Models\\User	56	Personal Access Token	d3c7a1d0ec1d3fe936e511a193d1b22123a6725fe6fe9c6f8dd6a04e891ccb2d	["*"]	\N	\N	2025-06-22 15:33:58	2025-06-22 15:33:58
258	App\\Models\\User	61	Personal Access Token	691a367851422e898b13bc60d3487c1ed3f4f8a40aca196d2a0c5b5eb9b10395	["*"]	\N	\N	2025-06-22 16:12:15	2025-06-22 16:12:15
259	App\\Models\\User	55	Personal Access Token	b40f15dc6cebc66fb1b96e6ea92972d0aa02fb05fb3ac87ab8c0fd923427d404	["*"]	\N	\N	2025-06-23 06:16:48	2025-06-23 06:16:48
260	App\\Models\\User	56	Personal Access Token	c97c7f119da2efbc60d5cad74d9c7049d81a2236528c04f86edf67c8bff4fa09	["*"]	\N	\N	2025-06-23 06:50:29	2025-06-23 06:50:29
261	App\\Models\\User	58	Personal Access Token	3e4245dbe514efcb717a74181b3e0e8a552ede12b8df04dd0cddeb557a45531f	["*"]	\N	\N	2025-06-23 06:57:47	2025-06-23 06:57:47
262	App\\Models\\User	55	Personal Access Token	c9aa3204d651f6aed47641c0d2ca458575b9e83e1002a0afe4ecd4ab630f8a35	["*"]	\N	\N	2025-06-23 07:01:56	2025-06-23 07:01:56
263	App\\Models\\User	56	Personal Access Token	19825ed31a22691e87cd729141137543e18bfbc4ae351119f0e993eeea9eddfc	["*"]	\N	\N	2025-06-23 07:15:20	2025-06-23 07:15:20
264	App\\Models\\User	61	Personal Access Token	940f71c8f9174f9a007b69af876c83dd3bb0c4b42ffa36fef6dd8f811365b84e	["*"]	\N	\N	2025-06-23 10:32:35	2025-06-23 10:32:35
265	App\\Models\\User	62	Personal Access Token	b983c39ffd7a1f70eb72df0023930c4735353f2b1b65ae987abec0f670cab282	["*"]	\N	\N	2025-06-23 10:42:37	2025-06-23 10:42:37
266	App\\Models\\User	62	Personal Access Token	de59c4554ec60136a0a01467a8b14569a791e0c625bf5402907f2aa8a2465199	["*"]	\N	\N	2025-06-23 10:44:34	2025-06-23 10:44:34
267	App\\Models\\User	61	Personal Access Token	07af064b10bc2f78c5c1353c77183afb04e61844934a66ed8c6072b51e4b0536	["*"]	\N	\N	2025-06-23 10:46:20	2025-06-23 10:46:20
268	App\\Models\\User	63	Personal Access Token	0bd67301081941d1a05ff94d76ef2fa01cf2d8e308bab0528515454cc84cd9cf	["*"]	\N	\N	2025-06-23 10:51:20	2025-06-23 10:51:20
269	App\\Models\\User	62	Personal Access Token	cfe761f8408f6dd1453be564eab21a003b100b46c838802dd9e11ea075ab7b38	["*"]	\N	\N	2025-06-23 11:13:42	2025-06-23 11:13:42
270	App\\Models\\User	58	Personal Access Token	6b56071590d15803b504648bbecc708bfc0bf64665f0f3778a5f1d928c1f047d	["*"]	\N	\N	2025-06-23 11:43:47	2025-06-23 11:43:47
271	App\\Models\\User	62	Personal Access Token	84e38479141354fbf8a8e4fcf2943021242d9c732ff58cdf7e72d4707f567d0a	["*"]	\N	\N	2025-06-23 12:11:17	2025-06-23 12:11:17
272	App\\Models\\User	56	Personal Access Token	cfc1688786add56592e36aff6bba23b99ce73e2aaec23a47d18d8442bd5dd9c0	["*"]	\N	\N	2025-06-23 12:25:35	2025-06-23 12:25:35
273	App\\Models\\User	58	Personal Access Token	abb27b24e1f361da8bd20a40c559f8ddd846a9f687e90aeec51ee6555105cb1f	["*"]	\N	\N	2025-06-23 12:56:46	2025-06-23 12:56:46
274	App\\Models\\User	55	Personal Access Token	5b5ea12f3b5ec3848041251ee1a36907f3983d416aded1130b373c020c6ac2fc	["*"]	\N	\N	2025-06-23 12:57:08	2025-06-23 12:57:08
275	App\\Models\\User	61	Personal Access Token	8d794115f84406751c7f2eeb94c58113218277128e849aeb1574f81733219877	["*"]	\N	\N	2025-06-23 13:48:03	2025-06-23 13:48:03
276	App\\Models\\User	61	Personal Access Token	1cebe3ced2257aaf1f6ad75fcbd504667ee69495b30768f4621754b498e72bb8	["*"]	\N	\N	2025-06-23 15:58:27	2025-06-23 15:58:27
277	App\\Models\\User	60	Personal Access Token	cde0eac12b63295285141ea552d31272742a841e2e4350f316bdca6ea6b94d63	["*"]	\N	\N	2025-06-23 20:10:49	2025-06-23 20:10:49
278	App\\Models\\User	61	Personal Access Token	6ac1e32c9e98b9fd09e805801a6a9540c5605499bf68bcf25566251df43dc5bb	["*"]	\N	\N	2025-06-23 23:36:25	2025-06-23 23:36:25
279	App\\Models\\User	38	Personal Access Token	f49d2a698952ed2808cfca6c808d8aa88f8f959f585d319b50cf02961e5ca365	["*"]	\N	\N	2025-06-24 05:06:36	2025-06-24 05:06:36
280	App\\Models\\User	61	Personal Access Token	a22af05ed79454763696420b2ffc6cfee501b40f42e3b76f571a41a1a2ff565a	["*"]	\N	\N	2025-06-24 05:23:13	2025-06-24 05:23:13
281	App\\Models\\User	62	Personal Access Token	cfdcd67ce75db4ca4b20fa1fea045a8942738cfc34ff19a242dd9090a84a41e8	["*"]	\N	\N	2025-06-24 06:06:49	2025-06-24 06:06:49
282	App\\Models\\User	63	Personal Access Token	e9310edaea6376d66b43d008bc9011cc549972b2b2aefbc22ab7122ba782d438	["*"]	\N	\N	2025-06-24 06:07:21	2025-06-24 06:07:21
283	App\\Models\\User	62	Personal Access Token	7987b29af65d1d9f807766d297e3915f3885c86c0dec1ab1c0f4a000ff8540df	["*"]	\N	\N	2025-06-24 07:45:22	2025-06-24 07:45:22
284	App\\Models\\User	62	Personal Access Token	ada7d9a8fd20f5c895f203f56cfe6e5b0975ec0165d90f2555846e59d0764913	["*"]	\N	\N	2025-06-24 08:01:11	2025-06-24 08:01:11
285	App\\Models\\User	64	Personal Access Token	a9c63c5fc380de22976f7df60fbfa84ca8b3143d3076ad21b02345f202f8a605	["*"]	\N	\N	2025-06-24 09:49:50	2025-06-24 09:49:50
286	App\\Models\\User	59	Personal Access Token	8bab0052a9d626b5f54098e432bf7194b3cbd4309d59fd2d89aff3cda72268f2	["*"]	\N	\N	2025-06-24 10:36:14	2025-06-24 10:36:14
287	App\\Models\\User	61	Personal Access Token	2e15bcb1819c2acd8d9449b98c7ba954988d7e37bba0970fd7b25dde46abe54d	["*"]	\N	\N	2025-06-24 10:58:31	2025-06-24 10:58:31
288	App\\Models\\User	60	Personal Access Token	1016f541ea14ddeef4b266797eaac2c2c5c239a87ddaa7b15d120e87ed586255	["*"]	\N	\N	2025-06-24 11:11:18	2025-06-24 11:11:18
289	App\\Models\\User	60	Personal Access Token	2135e8a4b0f6d3cf0a87756b5fdad5527adeddec10ebb34c2a278dfccf8a019d	["*"]	\N	\N	2025-06-24 13:03:02	2025-06-24 13:03:02
290	App\\Models\\User	56	Personal Access Token	dcfdf7db3a30b28de93f9ea338fa8244895a6db4d4d2f202e64dc820f63de62c	["*"]	\N	\N	2025-06-24 14:05:18	2025-06-24 14:05:18
291	App\\Models\\User	60	Personal Access Token	0804e42d1aafd8fa9e782e95aeb48c700fe67cc5e3239b14c5454add4911a5e7	["*"]	\N	\N	2025-06-24 14:25:24	2025-06-24 14:25:24
292	App\\Models\\User	61	Personal Access Token	3f48671af7eb39a48679f8afa69c4c11d19b5139fe0ac50691a6b057560aeac1	["*"]	\N	\N	2025-06-24 16:47:18	2025-06-24 16:47:18
293	App\\Models\\User	60	Personal Access Token	f96807315f502f1bc3d6b97ba923b0f7db150a20bd06d05d408a3dbbe42e0156	["*"]	\N	\N	2025-06-24 17:51:19	2025-06-24 17:51:19
294	App\\Models\\User	60	Personal Access Token	2d5a71d1557a2ca1ed04d1fc2d0fea971d67fc5151af7b4bd231e8bebec8e65e	["*"]	\N	\N	2025-06-24 18:05:34	2025-06-24 18:05:34
295	App\\Models\\User	60	Personal Access Token	71e880281dd159786a3c3381c0551fcef3ec47ebffdff7a64b59e343eea1b088	["*"]	\N	\N	2025-06-24 18:12:03	2025-06-24 18:12:03
296	App\\Models\\User	60	Personal Access Token	2908f51fdd926be13ed3445686b2e2caa71b7d4ed7d7c57fe6f469b53e607afb	["*"]	\N	\N	2025-06-24 18:53:29	2025-06-24 18:53:29
297	App\\Models\\User	59	Personal Access Token	89e738777d4d88eadbb6ec1cbbdad89c29881ac5bb9731fdae2fea203f0d7f8f	["*"]	\N	\N	2025-06-24 19:29:57	2025-06-24 19:29:57
298	App\\Models\\User	60	Personal Access Token	e708f29fdcbedf480597ad3175116e9e7e9a5abdcec9bec424cdc5bbbccd4b63	["*"]	\N	\N	2025-06-24 19:59:50	2025-06-24 19:59:50
299	App\\Models\\User	60	Personal Access Token	f11ac0f068fd736be2a788327c696a0eb377526a6d1fcf0c3321e6bf9e9c5660	["*"]	\N	\N	2025-06-24 20:14:58	2025-06-24 20:14:58
300	App\\Models\\User	60	Personal Access Token	8b32b4e57f295a4aec64ad6d48cbebf3f77498b7112b0ac91bc3727637daaa35	["*"]	\N	\N	2025-06-24 20:19:00	2025-06-24 20:19:00
301	App\\Models\\User	61	Personal Access Token	a5ff8d5fd34414a979cc57749dce5a55480890f01385463f5551dcc8329d4e1e	["*"]	\N	\N	2025-06-25 02:45:20	2025-06-25 02:45:20
302	App\\Models\\User	62	Personal Access Token	197bc0cb067845f5a9c3bc0b4b0dedb2a5c13bcce0bec93f783a483ebfc8722e	["*"]	\N	\N	2025-06-25 05:55:14	2025-06-25 05:55:14
303	App\\Models\\User	63	Personal Access Token	2aa3fd54bf87c7014624703e2fe719ccf5f39b9643b65c8bd7478eedb38b1a6d	["*"]	\N	\N	2025-06-25 06:00:05	2025-06-25 06:00:05
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
-- Data for Name: poll_votes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.poll_votes (id, user_id, post_id, option_id, created_at, updated_at) FROM stdin;
3	10	90	1	2025-06-17 10:10:19	2025-06-17 10:10:19
4	10	92	6	2025-06-17 10:21:46	2025-06-17 10:21:46
5	15	92	6	2025-06-17 10:23:27	2025-06-17 10:23:27
6	16	92	5	2025-06-17 10:28:23	2025-06-17 10:28:23
7	20	92	5	2025-06-17 10:50:51	2025-06-17 10:50:51
8	10	106	11	2025-06-23 09:00:18	2025-06-23 09:00:18
9	10	130	17	2025-06-24 06:19:58	2025-06-24 06:19:58
11	60	63	22	2025-06-24 07:52:56	2025-06-24 07:52:56
12	60	135	22	2025-06-24 08:02:05	2025-06-24 08:02:05
13	60	60	20	2025-06-24 08:58:58	2025-06-24 08:58:58
14	60	134	19	2025-06-24 09:35:47	2025-06-24 09:35:47
15	60	130	18	2025-06-24 09:45:46	2025-06-24 09:45:46
16	60	128	15	2025-06-24 10:27:38	2025-06-24 10:27:38
17	60	114	14	2025-06-24 10:30:36	2025-06-24 10:30:36
18	60	106	11	2025-06-24 10:34:19	2025-06-24 10:34:19
19	60	136	26	2025-06-24 10:35:45	2025-06-24 10:35:45
20	59	136	25	2025-06-24 10:36:19	2025-06-24 10:36:19
21	59	135	22	2025-06-24 10:36:28	2025-06-24 10:36:28
22	59	134	20	2025-06-24 10:36:31	2025-06-24 10:36:31
23	59	130	17	2025-06-24 10:36:36	2025-06-24 10:36:36
24	61	136	24	2025-06-24 16:47:26	2025-06-24 16:47:26
25	61	137	27	2025-06-24 17:40:36	2025-06-24 17:40:36
26	60	138	30	2025-06-24 17:58:46	2025-06-24 17:58:46
27	60	137	27	2025-06-24 19:08:34	2025-06-24 19:08:34
28	60	140	34	2025-06-24 20:08:10	2025-06-24 20:08:10
29	60	139	31	2025-06-24 20:08:11	2025-06-24 20:08:11
30	59	140	34	2025-06-24 20:08:17	2025-06-24 20:08:17
31	59	139	32	2025-06-24 20:08:21	2025-06-24 20:08:21
32	61	140	34	2025-06-25 02:46:10	2025-06-25 02:46:10
33	62	140	33	2025-06-25 05:55:27	2025-06-25 05:55:27
34	61	141	37	2025-06-25 05:57:32	2025-06-25 05:57:32
35	62	141	35	2025-06-25 05:58:04	2025-06-25 05:58:04
36	63	141	36	2025-06-25 06:02:24	2025-06-25 06:02:24
37	62	142	39	2025-06-25 06:06:02	2025-06-25 06:06:02
38	55	142	39	2025-06-25 06:09:52	2025-06-25 06:09:52
39	60	142	39	2025-06-25 06:29:23	2025-06-25 06:29:23
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
7	40	57	Test edited2	2025-06-17 08:54:26	2025-06-17 08:54:26
8	92	57	hi	2025-06-17 17:22:01	2025-06-17 17:22:01
9	92	57	hhh	2025-06-17 17:22:06	2025-06-17 17:22:06
10	90	57	wow	2025-06-17 17:22:33	2025-06-17 17:22:33
11	90	57	hh	2025-06-17 17:34:48	2025-06-17 17:34:48
12	90	57	nnn	2025-06-17 17:35:04	2025-06-17 17:35:04
13	91	57	hhh	2025-06-17 17:38:50	2025-06-17 17:38:50
14	92	57	aaasssfewes	2025-06-17 19:05:57	2025-06-17 19:05:57
15	92	38	Test edited2	2025-06-18 04:04:11	2025-06-18 04:04:11
16	92	57	jhhhj	2025-06-18 05:45:42	2025-06-18 05:45:42
17	90	38	h	2025-06-19 02:32:32	2025-06-19 02:32:32
18	93	38	hhg	2025-06-19 02:34:05	2025-06-19 02:34:05
19	89	61	tym ni kr rhi hu to be a	2025-06-19 09:08:29	2025-06-19 09:08:29
20	94	61	Ryyuuu	2025-06-19 11:03:19	2025-06-19 11:03:19
21	97	62	I prefer salalah	2025-06-19 12:55:34	2025-06-19 12:55:34
22	97	62	let see!!	2025-06-19 12:56:09	2025-06-19 12:56:09
23	97	63	enjoy!!!	2025-06-19 12:57:05	2025-06-19 12:57:05
24	104	55	hi	2025-06-19 18:53:29	2025-06-19 18:53:29
25	88	60	hh	2025-06-21 07:52:59	2025-06-21 07:52:59
26	103	61	the same time as a child support of the same time as a child support of the same time	2025-06-21 10:54:43	2025-06-21 10:54:43
27	103	61	Ggggghhh same time as a child support of the same time as	2025-06-21 10:55:08	2025-06-21 10:55:08
28	105	59	wow great	2025-06-21 18:50:19	2025-06-21 18:50:19
29	102	59	ssaadf	2025-06-21 21:01:53	2025-06-21 21:01:53
30	107	61	his name is a great day of the same time as a great day of the same time as	2025-06-22 08:05:20	2025-06-22 08:05:20
31	108	61	Dubai offers a wide array of attractions, blending modern marvels with rich culture and thrilling adventures. Key highlights include the iconic Burj Khalifa, the world's tallest building; the vibrant Dubai Mall, a shopper's paradise; and the Palm Jumeirah, a stunning man-made island. Desert safaris, water parks like Aquaventure, and cultural sites like the Dubai Museum also draw visitors.	2025-06-22 08:53:23	2025-06-22 08:53:23
32	105	61	y6yu	2025-06-22 08:57:11	2025-06-22 08:57:11
33	113	59	hhh	2025-06-22 15:19:32	2025-06-22 15:19:32
34	113	59	2nd comment	2025-06-22 15:19:42	2025-06-22 15:19:42
35	114	61	His name is a great day of the same time as a great day of the same time as a great day of the day	2025-06-23 10:37:41	2025-06-23 10:37:41
36	115	61	the same time as a great day of the same time as a great day of the same time as a great day of the same time as a great day of the same time as a great👍 day of the same⌚ time as well as	2025-06-23 11:00:27	2025-06-23 11:00:27
37	108	56	hi	2025-06-23 11:35:40	2025-06-23 11:35:40
38	101	59	aaa	2025-06-23 12:05:44	2025-06-23 12:05:44
39	101	59	aaa	2025-06-23 12:05:53	2025-06-23 12:05:53
40	115	59	assdfg	2025-06-23 12:07:56	2025-06-23 12:07:56
41	117	61	hi	2025-06-24 03:20:19	2025-06-24 03:20:19
42	131	63	Yayy!! nice conte	2025-06-24 06:27:11	2025-06-24 06:27:11
43	131	61	hi and I am a very happy birthday party and I have a great day of the same time as a great day of the same time⌚ as well as I can see it as a kid and checklist to a kid and checklist for the same time⌚ as a kid in the morning🌞 and the rest of	2025-06-24 06:35:19	2025-06-24 06:35:19
44	133	62	very excited to see 🙈	2025-06-24 07:12:51	2025-06-24 07:12:51
45	133	63	thanks	2025-06-24 07:13:29	2025-06-24 07:13:29
46	133	63	thanks	2025-06-24 07:13:30	2025-06-24 07:13:30
47	132	60	great place	2025-06-24 13:35:38	2025-06-24 13:35:38
48	138	59	great	2025-06-24 19:55:04	2025-06-24 19:55:04
49	140	61	ho gya tha ki baat nhi hai na to be a great day of the	2025-06-25 02:46:37	2025-06-25 02:46:37
50	133	61	5tyutygghhvnj	2025-06-25 03:01:09	2025-06-25 03:01:09
51	140	61	hi	2025-06-25 03:03:19	2025-06-25 03:03:19
\.


--
-- Data for Name: post_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_files (id, post_id, height, width, extension, is_default, url, duration, thumb_image, have_hls_url, hls_url, hls_cdn_url, created_at, updated_at) FROM stdin;
2	64	1008	756	jpg	1	posts/images/aFCIEK7jgPgEzmI5sKQ4xK4gOFchsG14JtldXk8S.jpg	0	posts/images/aFCIEK7jgPgEzmI5sKQ4xK4gOFchsG14JtldXk8S.jpg	0	\N	\N	2025-05-06 11:53:50	2025-05-06 11:53:50
3	61	1920	1080	mp4	1	posts/videos/BA4JYuocxfuQTR5Q84A6KOcONouiZDcv2S9U9Lje.mp4	12	17465335436819fca75afa6_thumb.jpg	0	\N	\N	2025-05-06 12:12:23	2025-05-06 12:12:23
4	67	1008	756	jpg	1	posts/images/uZECmtOyToP6T5uEMEN6xRECZLz6xQkbKqQ4adJ7.jpg	0	posts/images/uZECmtOyToP6T5uEMEN6xRECZLz6xQkbKqQ4adJ7.jpg	0	\N	\N	2025-05-06 12:21:51	2025-05-06 12:21:51
5	67	1008	756	jpg	1	posts/images/dUYq0dtvgHqTKvT6QTAg0lemFzkH5kAjOp1OAfBo.jpg	0	posts/images/dUYq0dtvgHqTKvT6QTAg0lemFzkH5kAjOp1OAfBo.jpg	0	\N	\N	2025-05-06 12:21:51	2025-05-06 12:21:51
6	68	1920	1080	mp4	1	posts/videos/BqpG5Wm7iO1cmr4f7snDAHBJeHImGiYHjJ7vS93t.mp4	7	posts/images/17465342386819ff5e02121_thumb.jpg	0	\N	\N	2025-05-06 12:23:58	2025-05-06 12:23:58
7	69	1344	621	jpg	1	posts/images/mnRVnayiae4oPQZQXcQ47nw1yNpqdqoo7rhN2zjK.jpg	0	posts/images/mnRVnayiae4oPQZQXcQ47nw1yNpqdqoo7rhN2zjK.jpg	0	\N	\N	2025-05-26 08:34:39	2025-05-26 08:34:39
12	70	165	340	png	1	1748694789683af705e4bd6.png	0	1748694789683af705e4bd6.png	0	\N	\N	2025-05-31 13:01:08	2025-05-31 13:01:08
13	70	720	1280	mp4	1	1748694790683af7063a985.mp4	6	1748696468683afd94b84e5_thumb.jpg	0	\N	\N	2025-05-31 13:01:09	2025-05-31 13:01:09
14	71	480	640	jpg	1	17492727326843c89c74f69.jpg	0	17492727326843c89c74f69.jpg	0	\N	\N	2025-06-07 05:05:33	2025-06-07 05:05:33
15	73	848	480	mp4	1	17492729686843c98857c31.mp4	6	17492729696843c989e442a_thumb.jpg	0	\N	\N	2025-06-07 05:09:30	2025-06-07 05:09:30
16	74	848	480	mp4	1	17492965086844257c4fba0.mp4	11	17492965096844257d3d7d5_thumb.jpg	0	\N	\N	2025-06-07 11:41:49	2025-06-07 11:41:49
17	75	480	640	jpg	1	17492967656844267d110a0.jpg	0	17492967656844267d110a0.jpg	0	\N	\N	2025-06-07 11:46:05	2025-06-07 11:46:05
18	77	165	340	png	1	17492972776844287dd597a.png	0	17492972776844287dd597a.png	0	\N	\N	2025-06-07 11:54:38	2025-06-07 11:54:38
19	78	300	300	png	1	174929783068442aa6d3b23.png	0	174929783068442aa6d3b23.png	0	\N	\N	2025-06-07 12:03:51	2025-06-07 12:03:51
20	79	165	340	png	1	174929812868442bd0732fd.png	0	174929812868442bd0732fd.png	0	\N	\N	2025-06-07 12:08:49	2025-06-07 12:08:49
21	83	640	360	mp4	1	1749451143684681876dd0f.mp4	60	17494511456846818934e81_thumb.jpg	0	\N	\N	2025-06-09 06:39:05	2025-06-09 06:39:05
22	84	640	360	mp4	1	17494528386846882668772.mp4	60	17494528396846882794f81_thumb.jpg	0	\N	\N	2025-06-09 07:07:19	2025-06-09 07:07:19
26	85	720	1280	mp4	1	1749453041684688f15c796.mp4	6	174945360968468b29e5519_thumb.jpg	0	\N	\N	2025-06-09 07:20:10	2025-06-09 07:20:10
27	86	720	1280	mp4	1	174945447768468e8dbf2cc.mp4	6	174945447868468e8ee9a2e_thumb.jpg	0	\N	\N	2025-06-09 07:34:39	2025-06-09 07:34:39
28	87	3868	1500	png	1	174945499468469092648c2.png	0	174945499468469092648c2.png	0	\N	\N	2025-06-09 07:43:14	2025-06-09 07:43:14
29	88	183	275	jpg	1	174955595768481af52511e.jpg	0	174955595768481af52511e.jpg	0	\N	\N	2025-06-10 11:45:57	2025-06-10 11:45:57
30	88	290	174	jpg	1	174955595768481af55c062.jpg	0	174955595768481af55c062.jpg	0	\N	\N	2025-06-10 11:45:58	2025-06-10 11:45:58
31	90	640	360	mp4	1	175015043968512d272794a.mp4	60	175015044068512d28d79a5_thumb.jpg	0	\N	\N	2025-06-17 08:54:01	2025-06-17 08:54:01
32	93	1920	1080	jpg	1	1750300424685377083c305.jpg	0	1750300424685377083c305.jpg	0	\N	\N	2025-06-19 02:33:44	2025-06-19 02:33:44
33	94	1024	768	jpg	1	17503235136853d139ebb82.jpg	0	17503235136853d139ebb82.jpg	0	\N	\N	2025-06-19 08:58:34	2025-06-19 08:58:34
34	95	1024	576	mp4	1	17503355016854000db6b3d.mp4	14	17503355036854000fcb318_thumb.jpg	0	\N	\N	2025-06-19 12:18:24	2025-06-19 12:18:24
35	96	720	576	mp4	1	17503355966854006c17094.mp4	19	17503355976854006d5956f_thumb.jpg	0	\N	\N	2025-06-19 12:19:57	2025-06-19 12:19:57
36	98	400	600	jpg	1	175033764168540869ad4c8.jpg	0	175033764168540869ad4c8.jpg	0	\N	\N	2025-06-19 12:54:02	2025-06-19 12:54:02
37	98	451	800	jpg	1	17503376426854086a035e3.jpg	0	17503376426854086a035e3.jpg	0	\N	\N	2025-06-19 12:54:02	2025-06-19 12:54:02
38	98	520	850	jpg	1	17503376426854086a13f50.jpg	0	17503376426854086a13f50.jpg	0	\N	\N	2025-06-19 12:54:02	2025-06-19 12:54:02
39	99	1604	720	mp4	1	175033807268540a18b159a.mp4	12	175033807368540a19e1447_thumb.jpg	0	\N	\N	2025-06-19 13:01:14	2025-06-19 13:01:14
40	100	720	576	mp4	1	1750341883685418fb121dd.mp4	19	1750341884685418fc27320_thumb.jpg	0	\N	\N	2025-06-19 14:04:44	2025-06-19 14:04:44
41	101	1024	576	mp4	1	17503419796854195bc5c53.mp4	14	17503419806854195ccd09b_thumb.jpg	0	\N	\N	2025-06-19 14:06:21	2025-06-19 14:06:21
42	102	576	768	mp4	1	175034959368543719ef49f.mp4	33	17503495956854371b051bc_thumb.jpg	0	\N	\N	2025-06-19 16:13:15	2025-06-19 16:13:15
43	103	1156	867	jpg	1	17503524306854422e2505f.jpg	0	17503524306854422e2505f.jpg	0	\N	\N	2025-06-19 17:00:30	2025-06-19 17:00:30
44	104	1156	867	jpg	1	17503524626854424e758ab.jpg	0	17503524626854424e758ab.jpg	0	\N	\N	2025-06-19 17:01:03	2025-06-19 17:01:03
45	105	2400	1080	jpg	1	17505050986856968a8ae3f.jpg	0	17505050986856968a8ae3f.jpg	0	\N	\N	2025-06-21 11:24:59	2025-06-21 11:24:59
46	105	1536	1024	jpg	1	17505050986856968abb5cc.jpg	0	17505050986856968abb5cc.jpg	0	\N	\N	2025-06-21 11:24:59	2025-06-21 11:24:59
47	107	960	540	mp4	1	17505791806857b7ec1129c.mp4	16	17505791816857b7ed8790b_thumb.jpg	0	\N	\N	2025-06-22 07:59:41	2025-06-22 07:59:41
48	108	438	701	jpg	1	17505801546857bbba570ed.jpg	0	17505801546857bbba570ed.jpg	0	\N	\N	2025-06-22 08:15:55	2025-06-22 08:15:55
49	108	452	678	jpg	1	17505801546857bbba7bd96.jpg	0	17505801546857bbba7bd96.jpg	0	\N	\N	2025-06-22 08:15:55	2025-06-22 08:15:55
50	108	415	739	jpg	1	17505801546857bbba8d6a9.jpg	0	17505801546857bbba8d6a9.jpg	0	\N	\N	2025-06-22 08:15:55	2025-06-22 08:15:55
51	108	374	600	jpg	1	17505801546857bbba94624.jpg	0	17505801546857bbba94624.jpg	0	\N	\N	2025-06-22 08:15:55	2025-06-22 08:15:55
52	108	554	554	jpg	1	17505801546857bbba9a5ec.jpg	0	17505801546857bbba9a5ec.jpg	0	\N	\N	2025-06-22 08:15:55	2025-06-22 08:15:55
53	109	1536	1024	jpg	1	17505856466857d12e0aa31.jpg	0	17505856466857d12e0aa31.jpg	0	\N	\N	2025-06-22 09:47:26	2025-06-22 09:47:26
54	110	1200	1600	jpg	1	17505951836857f66f0f811.jpg	0	17505951836857f66f0f811.jpg	0	\N	\N	2025-06-22 12:26:23	2025-06-22 12:26:23
55	111	1600	1200	jpg	1	17505952226857f696b1287.jpg	0	17505952226857f696b1287.jpg	0	\N	\N	2025-06-22 12:27:03	2025-06-22 12:27:03
56	112	1020	765	jpg	1	17505952596857f6bb6e34b.jpg	0	17505952596857f6bb6e34b.jpg	0	\N	\N	2025-06-22 12:27:40	2025-06-22 12:27:40
57	113	2560	1440	mp4	1	17505953106857f6ee6850c.mp4	7	17505953126857f6f09f496_thumb.jpg	0	\N	\N	2025-06-22 12:28:32	2025-06-22 12:28:32
58	115	1080	1920	mp4	1	17506762506859331a55913.mp4	20	17506762516859331bbce0e_thumb.jpg	0	\N	\N	2025-06-23 10:57:32	2025-06-23 10:57:32
59	116	720	1280	mp4	1	175068161968594813c1afc.mp4	12	1750681621685948151892a_thumb.jpg	0	\N	\N	2025-06-23 12:27:01	2025-06-23 12:27:01
60	117	1000	1500	jpg	1	1750682018685949a271bc0.jpg	0	1750682018685949a271bc0.jpg	0	\N	\N	2025-06-23 12:33:39	2025-06-23 12:33:39
61	117	900	1200	jpg	1	1750682018685949a2c17f4.jpg	0	1750682018685949a2c17f4.jpg	0	\N	\N	2025-06-23 12:33:39	2025-06-23 12:33:39
62	117	1604	720	jpg	1	1750682018685949a2d67a5.jpg	0	1750682018685949a2d67a5.jpg	0	\N	\N	2025-06-23 12:33:39	2025-06-23 12:33:39
63	118	215	183	jpg	1	17507046796859a2279ffec.jpg	0	17507046796859a2279ffec.jpg	0	\N	\N	2025-06-23 18:51:20	2025-06-23 18:51:20
64	118	233	198	jpg	1	17507046796859a227cda07.jpg	0	17507046796859a227cda07.jpg	0	\N	\N	2025-06-23 18:51:20	2025-06-23 18:51:20
65	118	212	180	jpg	1	17507046796859a227d3069.jpg	0	17507046796859a227d3069.jpg	0	\N	\N	2025-06-23 18:51:20	2025-06-23 18:51:20
66	129	212	180	jpg	1	1750745742685a428e418f1.jpg	0	1750745742685a428e418f1.jpg	0	\N	\N	2025-06-24 06:15:42	2025-06-24 06:15:42
67	131	1044	1044	jpg	1	1750746066685a43d2034a7.jpg	0	1750746066685a43d2034a7.jpg	0	\N	\N	2025-06-24 06:21:06	2025-06-24 06:21:06
68	131	502	754	jpg	1	1750746066685a43d23fb92.jpg	0	1750746066685a43d23fb92.jpg	0	\N	\N	2025-06-24 06:21:06	2025-06-24 06:21:06
69	132	825	1100	jpg	1	1750747874685a4ae28b646.jpg	0	1750747874685a4ae28b646.jpg	0	\N	\N	2025-06-24 06:51:15	2025-06-24 06:51:15
70	132	1200	1200	jpg	1	1750747874685a4ae2d712a.jpg	0	1750747874685a4ae2d712a.jpg	0	\N	\N	2025-06-24 06:51:15	2025-06-24 06:51:15
71	133	1080	1920	mp4	1	1750749096685a4fa8e3de7.mp4	6	1750749098685a4faa64ae6_thumb.jpg	0	\N	\N	2025-06-24 07:11:38	2025-06-24 07:11:38
\.


--
-- Data for Name: post_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_likes (id, post_id, user_id, created_at, updated_at) FROM stdin;
1	1	13	\N	\N
2	1	11	\N	\N
3	1	12	\N	\N
4	88	37	2025-06-12 06:17:39	2025-06-12 06:17:39
85	101	59	2025-06-21 20:51:51	2025-06-21 20:51:51
86	107	61	2025-06-22 08:03:27	2025-06-22 08:03:27
87	108	61	2025-06-22 08:16:37	2025-06-22 08:16:37
88	105	61	2025-06-22 08:56:57	2025-06-22 08:56:57
89	105	55	2025-06-22 15:33:11	2025-06-22 15:33:11
91	113	61	2025-06-23 10:38:01	2025-06-23 10:38:01
22	89	38	2025-06-18 04:02:57	2025-06-18 04:02:57
23	92	38	2025-06-18 04:03:34	2025-06-18 04:03:34
95	114	59	2025-06-23 11:49:59	2025-06-23 11:49:59
96	112	59	2025-06-23 11:51:16	2025-06-23 11:51:16
27	92	57	2025-06-18 06:32:59	2025-06-18 06:32:59
99	102	59	2025-06-23 11:54:40	2025-06-23 11:54:40
33	90	38	2025-06-19 02:32:20	2025-06-19 02:32:20
34	93	38	2025-06-19 02:41:55	2025-06-19 02:41:55
102	115	59	2025-06-23 11:59:20	2025-06-23 11:59:20
36	90	60	2025-06-19 06:20:22	2025-06-19 06:20:22
39	93	62	2025-06-19 12:06:06	2025-06-19 12:06:06
105	103	59	2025-06-23 15:04:51	2025-06-23 15:04:51
41	98	62	2025-06-19 12:54:38	2025-06-19 12:54:38
106	117	61	2025-06-24 03:20:04	2025-06-24 03:20:04
108	116	61	2025-06-24 03:23:00	2025-06-24 03:23:00
45	104	55	2025-06-19 18:53:22	2025-06-19 18:53:22
46	104	38	2025-06-20 10:17:08	2025-06-20 10:17:08
109	131	62	2025-06-24 06:34:51	2025-06-24 06:34:51
110	131	61	2025-06-24 06:35:28	2025-06-24 06:35:28
111	133	62	2025-06-24 07:12:56	2025-06-24 07:12:56
112	134	62	2025-06-24 07:29:41	2025-06-24 07:29:41
113	134	55	2025-06-24 07:30:58	2025-06-24 07:30:58
114	133	64	2025-06-24 09:51:10	2025-06-24 09:51:10
53	104	60	2025-06-21 07:49:45	2025-06-21 07:49:45
54	88	60	2025-06-21 07:52:19	2025-06-21 07:52:19
55	103	61	2025-06-21 10:54:23	2025-06-21 10:54:23
115	136	64	2025-06-24 10:54:33	2025-06-24 10:54:33
116	133	61	2025-06-24 17:34:08	2025-06-24 17:34:08
58	100	59	2025-06-21 11:23:49	2025-06-21 11:23:49
117	137	60	2025-06-24 20:03:17	2025-06-24 20:03:17
118	129	55	2025-06-25 05:21:36	2025-06-25 05:21:36
119	128	55	2025-06-25 05:21:38	2025-06-25 05:21:38
120	103	55	2025-06-25 05:22:18	2025-06-25 05:22:18
63	106	56	2025-06-21 15:22:08	2025-06-21 15:22:08
72	106	59	2025-06-21 19:03:18	2025-06-21 19:03:18
\.


--
-- Data for Name: post_poll_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_poll_options (id, post_id, option, created_at, updated_at) FROM stdin;
1	90	Private Car with Driver	2025-06-17 08:53:59	2025-06-17 08:53:59
2	90	Scooter Rental	2025-06-17 08:53:59	2025-06-17 08:53:59
3	91	Option 1	2025-06-17 10:05:15	2025-06-17 10:05:15
4	91	Option 2	2025-06-17 10:05:15	2025-06-17 10:05:15
5	92	Option 3	2025-06-17 10:05:52	2025-06-17 10:05:52
6	92	option 4	2025-06-17 10:05:52	2025-06-17 10:05:52
7	97	Salalah at Khareef Season	2025-06-19 12:50:46	2025-06-19 12:50:46
8	97	Thailand	2025-06-19 12:50:46	2025-06-19 12:50:46
9	97	Bali	2025-06-19 12:50:46	2025-06-19 12:50:46
10	97	Singapore	2025-06-19 12:50:46	2025-06-19 12:50:46
11	106	Yes	2025-06-21 15:22:03	2025-06-21 15:22:03
12	106	No	2025-06-21 15:22:03	2025-06-21 15:22:03
13	114	India	2025-06-22 18:14:43	2025-06-22 18:14:43
14	114	Pakistan	2025-06-22 18:14:43	2025-06-22 18:14:43
15	128	Private Car with Driver	2025-06-24 06:15:24	2025-06-24 06:15:24
16	128	Scooter Rental	2025-06-24 06:15:24	2025-06-24 06:15:24
17	130	Barcelona	2025-06-24 06:16:45	2025-06-24 06:16:45
18	130	Madrid	2025-06-24 06:16:45	2025-06-24 06:16:45
19	134	Pakistan	2025-06-24 07:20:00	2025-06-24 07:20:00
20	134	Australia	2025-06-24 07:20:00	2025-06-24 07:20:00
21	135	London Bridge - UK	2025-06-24 07:33:09	2025-06-24 07:33:09
22	135	Egypt Museum- Cairo	2025-06-24 07:33:09	2025-06-24 07:33:09
23	135	Salalah - Oman	2025-06-24 07:33:09	2025-06-24 07:33:09
24	136	Yes	2025-06-24 10:35:34	2025-06-24 10:35:34
25	136	No	2025-06-24 10:35:34	2025-06-24 10:35:34
26	136	Maybe	2025-06-24 10:35:34	2025-06-24 10:35:34
27	137	Liverpool	2025-06-24 17:38:04	2025-06-24 17:38:04
28	137	Manchester United	2025-06-24 17:38:04	2025-06-24 17:38:04
29	138	England	2025-06-24 17:51:43	2025-06-24 17:51:43
30	138	USA	2025-06-24 17:51:43	2025-06-24 17:51:43
31	139	John	2025-06-24 20:07:06	2025-06-24 20:07:06
32	139	David	2025-06-24 20:07:06	2025-06-24 20:07:06
33	140	India	2025-06-24 20:07:59	2025-06-24 20:07:59
34	140	England	2025-06-24 20:07:59	2025-06-24 20:07:59
35	141	Georgia	2025-06-25 05:56:32	2025-06-25 05:56:32
36	141	Salalah	2025-06-25 05:56:32	2025-06-25 05:56:32
37	141	United Kingdom	2025-06-25 05:56:32	2025-06-25 05:56:32
38	142	artic	2025-06-25 06:01:29	2025-06-25 06:01:29
39	142	iceland	2025-06-25 06:01:29	2025-06-25 06:01:29
40	142	greenland	2025-06-25 06:01:29	2025-06-25 06:01:29
\.


--
-- Data for Name: post_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_reports (id, user_id, reported_post_id, report_reason, remark, created_at, updated_at) FROM stdin;
1	57	92	Hate speech or symbols	report	2025-06-18 07:02:43	2025-06-18 07:02:43
2	57	89	Hate speech or symbols	\N	2025-06-18 19:43:01	2025-06-18 19:43:01
3	63	94	Violence or dangerous organizations	jdjdjjd	2025-06-19 13:01:51	2025-06-19 13:01:51
4	61	92	Hate speech or symbols	the same time as	2025-06-19 13:16:16	2025-06-19 13:16:16
5	55	104	Nudity or sexual activity	block teat	2025-06-19 18:52:39	2025-06-19 18:52:39
6	59	105	Hate speech or symbols	aaaa	2025-06-21 20:03:36	2025-06-21 20:03:36
7	59	102	Hate speech or symbols	aadd	2025-06-21 21:02:29	2025-06-21 21:02:29
8	59	101	Scam or fraud	sss	2025-06-21 21:04:36	2025-06-21 21:04:36
9	56	117	Sale of illegal or regulated goods	twst	2025-06-23 12:42:11	2025-06-23 12:42:11
10	59	117	Violence or dangerous organizations	iiii	2025-06-23 15:49:49	2025-06-23 15:49:49
11	64	62	Hate speech or symbols	the same time as a great day	2025-06-24 10:20:56	2025-06-24 10:20:56
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

COPY public.posts (id, title, description, user_id, created_at, updated_at, image, comments, post_type, postdate, post_video, poll_question, poll_options, post_id, deleted_at) FROM stdin;
11	\N	<p>7 Days in Paradise - Bali Edition</p><p>&nbsp;</p><p>From private pool villas to epic beach club nights, from sacred temples to wild waterfalls — the countdown to our Bali escape has officially begun! ✈️🌴</p><p>#TravelDiaries #BaliVibes #GroupTrip #AdventureAwaits #Seminyak #Ubud #Uluwatu #BucketList</p>	14	2025-04-28 07:52:32	2025-04-28 07:52:32	\N	0	1	2025-06-01	\N	How do you want to travel inside Bali?	["Scooter Rental","Private Car with Driver"]	0001	\N
20	\N	From private pool villas to epic beach club nights, from sacred temples to wild waterfalls — the countdown to our Bali escape has officially begun! ✈️🌴\n\n#TravelDiaries #BaliVibes #GroupTrip #AdventureAwaits #Seminyak #Ubud #Uluwatu #BucketList	17	2025-04-30 19:41:59	2025-04-30 19:41:59	\N	0	2	2025-06-01	["posts\\/videos\\/v1DTivc7wIEUY9WL8lOdZvVe8k05qPxSDxO8xuX0.mp4","posts\\/videos\\/w5g6debR36WPrtKgAZTSSm6wT4ciHbqOwkuYWlbB.mp4"]	\N	\N	0008	\N
21	\N	From private pool villas to epic beach club nights, from sacred temples to wild waterfalls — the countdown to our Bali escape has officially begun! ✈️🌴\n\n#TravelDiaries #BaliVibes #GroupTrip #AdventureAwaits #Seminyak #Ubud #Uluwatu #BucketList	17	2025-04-30 19:44:08	2025-04-30 19:44:08	["posts\\/images\\/9o2aXX4RGgFQqU1EH0NoRRD0Lr1k4Uv1CCXbJivy.jpg"]	0	3	2025-06-01	\N	\N	\N	0009	\N
22	\N	From private pool villas to epic beach club nights, from sacred temples to wild waterfalls — the countdown to our Bali escape has officially begun! ✈️🌴\n\n#TravelDiaries #BaliVibes #GroupTrip #AdventureAwaits #Seminyak #Ubud #Uluwatu #BucketList	18	2025-05-01 11:32:30	2025-05-01 11:32:30	["posts\\/images\\/l5HCL6qVqKcrT9uWS3cVB9bgetXR4PhdLVnIiYmQ.jpg"]	0	3	2025-06-01	\N	\N	\N	0010	\N
14	\N	<p>🎉 Group trip to BALI incoming!<br>✈️ August 10–17, 2025<br>🏖️ Beach. 🍲 Food. 🌾 Nature. 🕺 Fun.<br>Can't wait for sunsets, pool parties, and island adventures with the best people!<br>🌴 #BaliBound</p>	14	2025-04-29 08:40:41	2025-04-29 08:43:25	\N	0	2	2025-05-22	["posts\\/videos\\/IfH4OgCIqC2Gox51SbPKKqehTQHTAiZao3a4doWa.mp4"]	\N	\N	0004	\N
15	\N	<p>jdfiughd</p>	14	2025-04-29 08:57:24	2025-04-29 09:56:37	\N	0	2	2025-04-30	["posts\\/videos\\/UruJrgnSIGJk5r8UrON5TXkzCAoaRycKmztmzhrd.mp4"]	\N	\N	0005	\N
13	\N	<p>dsfdsfds</p>	12	2025-04-28 08:54:00	2025-04-29 09:58:33	\N	0	2	2025-04-30	["posts\\/videos\\/2uFHt2zfWStvmUQaKY8LqxB20VdKBWAFUkFe5mr4.mp4","posts\\/videos\\/f9G1NzkdJWKXGz6LekebINrxMdINLs9oZixvVzhB.mp4","posts\\/videos\\/cxyMh6BKa391n5gZo8uZrN0j7qag0uOEbMsMkhfK.mp4"]	\N	\N	0003	\N
16	\N	<p>ddscd</p>	15	2025-04-29 10:01:58	2025-04-29 10:01:58	\N	0	2	2025-04-29	["posts\\/videos\\/wsmQHi4ASsz1o6CQrFVOmPpdkKzcY3kUfFJMiChu.mp4","posts\\/videos\\/eGgp33DJ0RYzpgW73NErcXKVkjw3aVwE015Tt9ZT.mp4","posts\\/videos\\/hgXnuBTskkHlXN46WbnxMh6EUTv5z9lhw7lTVKPP.mp4"]	\N	\N	0006	\N
23	\N	Who will win?	18	2025-05-02 12:36:29	2025-05-02 12:36:29	\N	0	1	2025-05-02	\N	Who will win?	["Pakistan","South africa"]	0011	\N
12	\N	<p>Excited to recharge and get inspired by the beauty of Bali 🇮🇩 next month!<br>7 days exploring culture, beaches, and adventure with close friends.</p><p>Seminyak • Ubud • Uluwatu 🌴</p><p>✈️ A reminder to balance hard work with meaningful travel experiences!<br>#Travel #Culture #Recharge #WorkLifeBalance&nbsp;</p>	15	2025-04-28 08:03:28	2025-04-29 10:17:15	["posts\\/images\\/yscBmglXV08oZpfcTAniS0eIWZD0lcZISLhYjjtx.png"]	0	3	2025-06-02	posts/fGzwy15myI8HrGYjRsFndr4tBfY4dyALePgyUHwQ.mp4	\N	\N	0002	\N
19	\N	From private pool villas to epic beach club nights, from sacred temples to wild waterfalls — the countdown to our Bali escape has officially begun! ✈️🌴\n\n#TravelDiaries #BaliVibes #GroupTrip #AdventureAwaits #Seminyak #Ubud #Uluwatu #BucketList	17	2025-04-30 19:37:28	2025-04-30 19:37:28	\N	0	1	2025-06-01	\N	How do you want to travel inside Bali?	["Private Car with Driver","Scooter Rental"]	0007	\N
24	\N	Who will win the match	18	2025-05-02 12:49:35	2025-05-02 12:49:35	\N	0	1	2025-05-02	\N	Who will win the match	["Lahore","Karachi"]	0012	\N
25	\N	Question	18	2025-05-02 12:51:35	2025-05-02 12:51:35	\N	0	1	2025-05-02	\N	Question	["Option 1","Option 2"]	0013	\N
26	\N	asd	18	2025-05-03 05:29:55	2025-05-03 05:29:55	\N	0	1	2025-05-02	\N	asd	["afg","ahh"]	0014	\N
27	\N	My post	18	2025-05-03 05:36:56	2025-05-03 05:36:56	\N	0	3	2025-05-02	\N	\N	\N	0015	\N
28	\N	Desc	18	2025-05-03 06:05:15	2025-05-03 06:05:15	\N	0	3	2025-05-02	\N	\N	\N	0016	\N
29	\N	My image post	18	2025-05-03 06:18:17	2025-05-03 06:18:17	["posts\\/images\\/l24Qr0OoQql1g4jcI92s7949gAFRPGOkmFxzh22J.png"]	0	3	2025-05-02	\N	\N	\N	0017	\N
30	\N	asd	28	2025-05-03 08:44:45	2025-05-03 08:44:45	["posts\\/images\\/CmtNRgyaKB9UXhN7Eeub44rv5AEOxt5bG24gn7kN.jpg"]	0	3	2025-05-02	\N	\N	\N	0018	\N
31	\N	Multiple images	28	2025-05-03 09:23:38	2025-05-03 09:23:38	["posts\\/images\\/MlsOVgfrvmdVxPAObzivW6n3r3lwCvjHqidZTlnB.jpg","posts\\/images\\/f7IZtO0aBGs2M73NVyC0lauVrt8U79tQEaZr2gxf.jpg"]	0	3	2025-05-02	\N	\N	\N	0019	\N
32	\N	Caption	28	2025-05-03 10:48:04	2025-05-03 10:48:04	["posts\\/images\\/MX6F4iNybovvOTGWTFyCdhbmPeyk9IhcWwtcS65z.jpg"]	0	3	2025-05-02	\N	\N	\N	0020	\N
33	\N	Caption only	28	2025-05-03 10:53:27	2025-05-03 10:53:27	\N	0	3	2025-05-02	\N	\N	\N	0021	\N
34	\N	Who will win the match	28	2025-05-03 10:53:57	2025-05-03 10:53:57	\N	0	1	2025-05-02	\N	Who will win the match	["Lahore","Karachi","Islamabad"]	0022	\N
35	\N	Caption only post	28	2025-05-03 10:57:36	2025-05-03 10:57:36	\N	0	3	2025-05-02	\N	\N	\N	0023	\N
36	\N	Whol will win the match	28	2025-05-03 10:58:04	2025-05-03 10:58:04	\N	0	1	2025-05-02	\N	Whol will win the match	["Karachi","Lahore","Quetta"]	0024	\N
37	\N	Images post	28	2025-05-03 10:58:49	2025-05-03 10:58:49	["posts\\/images\\/jmpzzFyv2rO2akzxRHdESCBRRqxJY7jtHc6pr4b4.jpg","posts\\/images\\/5uCouHOaMmbiRmo9mKmLCYZw1i39ksQz54BXXBzy.jpg","posts\\/images\\/i6coUsjN4d1bFYRdjCbtAHLu685rkqkUSbcUgvG6.jpg"]	0	3	2025-05-02	\N	\N	\N	0025	\N
38	\N	Beach Drive	29	2025-05-03 13:10:52	2025-05-03 13:10:52	\N	0	3	2025-05-02	\N	\N	\N	0026	\N
39	\N	Best place to visit in UAE	29	2025-05-03 13:19:41	2025-05-03 13:19:41	\N	0	1	2025-05-02	\N	Best place to visit in UAE	["Dubai","Sharjah","Abudhabi"]	0027	\N
40	\N	Test	29	2025-05-03 13:22:32	2025-05-03 13:22:32	["posts\\/images\\/GWvmQ0shQtoDFsEFXFHCQREV5v8NyQL2COB68SYk.jpg"]	0	3	2025-05-02	\N	\N	\N	0028	\N
41	\N	test 2	29	2025-05-03 13:25:07	2025-05-03 13:25:07	["posts\\/images\\/3GpPfxQPZcVN2aLrknU5DOByXvMZAfKhkDVVXZNs.jpg","posts\\/images\\/wOdEJMoQVKl9AAkG9MuKv6cq25B1IsVAqn2tproz.jpg"]	0	3	2025-05-02	\N	\N	\N	0029	\N
42	\N	hgfffff	30	2025-05-03 14:55:40	2025-05-03 14:55:40	["posts\\/images\\/La6yBBL984tOilrpRcP25BS2Kaok6xyRcPvvxXj3.jpg","posts\\/images\\/GUy6Dy9dl0pxKtt6gkKDxR2yEp0ORhUnIUzOgnXX.jpg"]	0	3	2025-05-02	\N	\N	\N	0030	\N
43	\N	pak win india	30	2025-05-03 14:56:17	2025-05-03 14:56:17	\N	0	1	2025-05-02	\N	pak win india	["pak","india","Indonesia"]	0031	\N
44	\N	hello	30	2025-05-03 14:56:56	2025-05-03 14:56:56	["posts\\/images\\/mrdW9plgGKjEq3eURcvmicFRDZhlt1pClUCnVe9C.jpg","posts\\/images\\/VrI6eeIJc6WT5hBBvAOqudd3i27aGLzn33Z0xtk3.jpg"]	0	3	2025-05-02	\N	\N	\N	0032	\N
45	\N	Car image	28	2025-05-03 15:36:26	2025-05-03 15:36:26	["posts\\/images\\/x20rx1plXGKOxM05E4prYtvXBsssAqBsjDlQUwhR.jpg"]	0	3	2025-05-02	\N	\N	\N	0033	\N
46	\N	Video post	28	2025-05-03 20:07:19	2025-05-03 20:07:19	\N	0	2	2025-05-02	["posts\\/videos\\/QCTXAnMeuUouF54PhDf7d630yQLf79wAdEOV1PMF.mp4"]	\N	\N	0034	\N
47	\N	New video	28	2025-05-03 20:22:12	2025-05-03 20:22:12	\N	0	2	2025-05-02	["posts\\/videos\\/zwuj8CUsF3Yg80i2DQhfYdWgx442Q5tL8Sc2B4c7.mp4","posts\\/videos\\/aFPj3w3bkRNPNjsouGf09yBczWLLdM7bIzwmmzzh.mp4"]	\N	\N	0035	\N
48	\N	Camera video	28	2025-05-03 20:25:10	2025-05-03 20:25:10	\N	0	2	2025-05-02	["posts\\/videos\\/AxZROa1m1JA7SgkXaoVPAoXUyETBbLCQaatpUriS.mp4"]	\N	\N	0036	\N
49	\N	Test	28	2025-05-03 20:28:59	2025-05-03 20:28:59	\N	0	2	2025-05-02	["posts\\/videos\\/5Idirn1YcgsjF8kMRQVRVGH7Bwb8MFMPY0TGBzCQ.mp4"]	\N	\N	0037	\N
50	\N	Image post	28	2025-05-03 20:34:03	2025-05-03 20:34:03	["posts\\/images\\/u2s0rRFQxp8R6qQKROgainAkcQh9UQ3ewCWBkITV.jpg"]	0	3	2025-05-04	\N	\N	\N	0038	\N
51	\N	Simulator test	28	2025-05-03 20:37:10	2025-05-03 20:37:10	\N	0	2	2025-05-04	["posts\\/videos\\/C11ZJnXhOzRcCKpBMQFUgaaVFmIUS0WOZHeh5my0.mp4"]	\N	\N	0039	\N
52	\N	New post123	28	2025-05-03 20:48:09	2025-05-03 20:48:09	\N	0	2	2025-05-04	["posts\\/videos\\/QSqtXsOdhL1WIldA7QWUmDUepiOvF5W7Yyt5CTCo.mp4"]	\N	\N	0040	\N
53	\N	test 3	29	2025-05-04 08:01:14	2025-05-04 08:01:14	["posts\\/images\\/2DO0GKMO5v3pM4O4jrt83ANsQbQuTWjd74Klqn4S.jpg","posts\\/images\\/e5hMNS6nOeA3LELur9XJBUq3yJ27Ql5BCrxz85Sv.jpg","posts\\/images\\/wK3Pk0uwugjwu7FVJKeVYayddQPSbLILzuBogE0D.jpg"]	0	3	2025-05-04	\N	\N	\N	0041	\N
54	\N	test 4	29	2025-05-04 08:03:08	2025-05-04 08:03:08	["posts\\/images\\/TCTK81q828v1t16JNgG01nQpxGIPWUjUTMai6wuE.jpg","posts\\/images\\/52uwz9e613fahgKcAzOGOQLNNGcP3J7455NaGHhw.jpg","posts\\/images\\/RnTB76hdgoya7MJdVjx0wzgbIzoI4z4lhXFoHr9e.jpg"]	0	3	2025-05-04	\N	\N	\N	0042	\N
55	\N	test video	29	2025-05-04 08:04:38	2025-05-04 08:04:38	\N	0	2	2025-05-04	["posts\\/videos\\/eYVbNfLQgF6shicxkesrzvJikb5tlA2BYBR8DyRq.mp4"]	\N	\N	0043	\N
56	\N	test video	29	2025-05-04 08:08:10	2025-05-04 08:08:10	\N	0	2	2025-05-04	["posts\\/videos\\/GB8Ccd3yww0J08FXDJpmCJ9qbUMOItvVL7Lk3dR3.mp4"]	\N	\N	0044	\N
57	\N	test video 2	29	2025-05-04 08:09:55	2025-05-04 08:09:55	\N	0	2	2025-05-04	\N	\N	\N	0045	\N
58	\N	test video 2	29	2025-05-04 08:10:00	2025-05-04 08:10:00	\N	0	2	2025-05-04	\N	\N	\N	0046	\N
59	\N	test video 3	29	2025-05-04 08:11:25	2025-05-04 08:11:25	\N	0	2	2025-05-04	["posts\\/videos\\/5wTjeSD1xoMXZ285T9xErmH2dmga1PUTYD2vaNdE.mp4"]	\N	\N	0047	\N
60	\N	test video 4	29	2025-05-04 08:13:18	2025-05-04 08:13:18	\N	0	2	2025-05-04	\N	\N	\N	0048	\N
61	\N	test video 4	29	2025-05-04 08:13:37	2025-05-04 08:13:37	\N	0	2	2025-05-04	["posts\\/videos\\/BA4JYuocxfuQTR5Q84A6KOcONouiZDcv2S9U9Lje.mp4"]	\N	\N	0049	\N
62	\N	who win today's match	31	2025-05-05 04:54:12	2025-05-05 04:54:12	\N	0	1	2025-05-02	\N	who win today's match	["india","Australia"]	0050	\N
63	\N	hii 👋 the u of the day is going to be the best u r u in	31	2025-05-05 05:06:31	2025-05-05 05:06:31	["posts\\/images\\/PceRAaDYHyXrR1VL0OmfzWcZOOYE5X7qZYlJvJra.jpg","posts\\/images\\/Ax10DnEyYK1AmfpfOum7bR5nUuEZNqEVH9yEaacg.jpg","posts\\/images\\/qdyTWT7Q01osXgsZNWVBpulrPwpjnFdEVCzgTd4A.jpg"]	0	3	2025-05-02	\N	\N	\N	0051	\N
64	\N	bvcs	33	2025-05-06 07:32:41	2025-05-06 07:32:41	["posts\\/images\\/aFCIEK7jgPgEzmI5sKQ4xK4gOFchsG14JtldXk8S.jpg"]	0	3	2025-05-06	\N	\N	\N	0052	\N
65	\N	what is next	33	2025-05-06 10:31:57	2025-05-06 10:31:57	\N	0	1	2025-05-06	\N	what is next	["atk","dfn"]	0053	\N
66	\N	hello world!!	27	2025-05-06 11:18:53	2025-05-06 11:18:53	\N	0	3	2025-05-06	\N	\N	\N	0054	\N
67	\N	desc	33	2025-05-06 12:21:51	2025-05-06 12:21:51	["posts\\/images\\/uZECmtOyToP6T5uEMEN6xRECZLz6xQkbKqQ4adJ7.jpg","posts\\/images\\/dUYq0dtvgHqTKvT6QTAg0lemFzkH5kAjOp1OAfBo.jpg"]	0	3	2025-05-06	\N	\N	\N	0055	\N
68	\N	test	33	2025-05-06 12:23:56	2025-05-06 12:23:56	\N	0	2	2025-05-06	["posts\\/videos\\/BqpG5Wm7iO1cmr4f7snDAHBJeHImGiYHjJ7vS93t.mp4"]	\N	\N	0056	\N
69	\N	hello	35	2025-05-26 08:34:39	2025-05-26 08:34:39	["posts\\/images\\/mnRVnayiae4oPQZQXcQ47nw1yNpqdqoo7rhN2zjK.jpg"]	0	3	2025-05-26	\N	\N	\N	0057	\N
70	\N	From private pool villas to epic beach club nights, from sacred temples to wild waterfalls — the countdown to our Bali escape has officially begun! ✈️🌴\n\n#TravelDiaries #BaliVibes #GroupTrip #AdventureAwaits #Seminyak #Ubud #Uluwatu #BucketList	36	2025-05-31 12:33:10	2025-05-31 12:33:10	["1748694789683af705e4bd6.png"]	0	2	2025-06-01	["1748694790683af7063a985.mp4"]	\N	\N	0058	\N
71	\N	Dubai and I am not sure about the same as the same as the same as the same as the same as the same as the same as the same as the same as the same as the same as the same as the same as the same as the same as the same	48	2025-06-07 05:05:32	2025-06-07 05:05:32	["17492727326843c89c74f69.jpg"]	0	3	2025-06-07	\N	\N	\N	0059	\N
72	\N	Dubai and I am not sure about the same as the same as the same as the same as you and your family a very	48	2025-06-07 05:07:51	2025-06-07 05:07:51	\N	0	1	2025-06-07	\N	Dubai and I am not sure about the same as the same as the same as the same as you and your family a very	["Summer","Winter"]	0060	\N
73	\N	This is the same as the same as the same as	48	2025-06-07 05:09:28	2025-06-07 05:09:28	\N	0	2	2025-06-07	["17492729686843c98857c31.mp4"]	\N	\N	0061	\N
74	\N	Hi	49	2025-06-07 11:41:48	2025-06-07 11:41:48	\N	0	2	2025-06-07	["17492965086844257c4fba0.mp4"]	\N	\N	0062	\N
75	\N	Dubai Marina the same to u and your friends are not the best of my relatives	49	2025-06-07 11:46:05	2025-06-07 11:46:05	["17492967656844267d110a0.jpg"]	0	3	2025-06-07	\N	\N	\N	0063	\N
76	\N	dubai frstival	49	2025-06-07 11:49:11	2025-06-07 11:49:11	\N	0	1	2025-06-07	\N	dubai frstival	["good","bad"]	0064	\N
77	\N	From private pool villas to epic beach club nights, from sacred temples to wild waterfalls — the countdown to our Bali escape has officially begun! ✈️🌴\n\n#TravelDiaries #BaliVibes #GroupTrip #AdventureAwaits #Seminyak #Ubud #Uluwatu #BucketList	38	2025-06-07 11:54:38	2025-06-07 11:54:38	["17492972776844287dd597a.png"]	0	3	2025-06-01	\N	\N	\N	0065	\N
78	\N	From private pool villas to epic beach club nights, from sacred temples to wild waterfalls — the countdown to our Bali escape has officially begun! ✈️🌴\n\n#TravelDiaries #BaliVibes #GroupTrip #AdventureAwaits #Seminyak #Ubud #Uluwatu #BucketList	38	2025-06-07 12:03:51	2025-06-07 12:03:51	["174929783068442aa6d3b23.png"]	0	3	2025-06-01	\N	\N	\N	0066	\N
79	\N	From private pool villas to epic beach club nights, from sacred temples to wild waterfalls — the countdown to our Bali escape has officially begun! ✈️🌴\n\n#TravelDiaries #BaliVibes #GroupTrip #AdventureAwaits #Seminyak #Ubud #Uluwatu #BucketList	38	2025-06-07 12:08:48	2025-06-07 12:08:48	["174929812868442bd0732fd.png"]	0	3	2025-06-01	\N	\N	\N	0067	\N
80	\N	<p>Test</p>	37	2025-06-09 06:19:25	2025-06-09 06:19:25	\N	0	2	2025-06-09	["posts\\/videos\\/NxlKQOHY8rs0CN53cCFIAre63goqXpRqMIAoHYK8.mp4"]	\N	\N	0068	\N
81	\N	<p>Test</p>	37	2025-06-09 06:22:41	2025-06-09 06:22:41	\N	0	2	2025-06-09	["posts\\/videos\\/eZw0Jlzqg7dryIyzZy9NbyJnJk6vIU0ddPN9davG.mp4"]	\N	\N	0069	\N
82	\N	<p>Test now</p>	37	2025-06-09 06:27:57	2025-06-09 06:27:57	["posts\\/images\\/LcIJh3k7VhEjmt5C9loKbkDxWyylBBCztAdXrhIR.png"]	0	3	2025-06-09	\N	\N	\N	0070	\N
83	\N	From private pool villas to epic beach club nights, from sacred temples to wild waterfalls — the countdown to our Bali escape has officially begun! ✈️🌴\n\n#TravelDiaries #BaliVibes #GroupTrip #AdventureAwaits #Seminyak #Ubud #Uluwatu #BucketList	37	2025-06-09 06:39:03	2025-06-09 06:39:03	\N	0	3	2025-06-01	["1749451143684681876dd0f.mp4"]	\N	\N	0071	\N
84	\N	<p>test&nbsp;</p>	37	2025-06-09 07:07:18	2025-06-09 07:07:18	\N	0	2	2025-06-09	["17494528386846882668772.mp4"]	\N	\N	0072	\N
85	\N	<p>Test description</p>	37	2025-06-09 07:10:41	2025-06-09 07:10:41	\N	0	2	2025-06-09	["1749453041684688f15c796.mp4"]	\N	\N	0073	\N
86	\N	<p>New Test</p>	37	2025-06-09 07:34:37	2025-06-09 07:34:37	\N	0	2	2025-06-09	["174945447768468e8dbf2cc.mp4"]	\N	\N	0074	\N
87	\N	<p>Test</p>	37	2025-06-09 07:43:14	2025-06-09 07:43:14	["174945499468469092648c2.png"]	0	3	2025-06-09	\N	\N	\N	0075	\N
88	\N	Test post now	37	2025-06-10 11:45:57	2025-06-10 11:45:57	["174955595768481af52511e.jpg","174955595768481af55c062.jpg"]	0	3	2025-06-10	\N	\N	\N	0076	\N
89	\N	Select yes or no.	37	2025-06-12 06:47:21	2025-06-12 06:47:21	\N	0	1	2025-06-12	\N	Select yes or no.	["Yes","No"]	0077	\N
90	\N	From private pool villas to epic beach club nights, from sacred temples to wild waterfalls — the countdown to our Bali escape has officially begun! ✈️🌴\n\n#TravelDiaries #BaliVibes #GroupTrip #AdventureAwaits #Seminyak #Ubud #Uluwatu #BucketList	38	2025-06-17 08:53:59	2025-06-17 08:53:59	\N	0	1	2025-06-01	["175015043968512d272794a.mp4"]	How do you want to travel inside Bali?	["Private Car with Driver","Scooter Rental"]	0078	\N
91	\N	Poll post 1	57	2025-06-17 10:05:15	2025-06-17 10:05:15	\N	0	1	2025-06-17	\N	Poll post 1	["Option 1","Option 2"]	0079	\N
92	\N	poll post no 2	57	2025-06-17 10:05:52	2025-06-17 10:05:52	\N	0	1	2025-06-17	\N	poll post no 2	["Option 3","option 4"]	0080	\N
93	\N	testing	38	2025-06-19 02:33:44	2025-06-19 02:33:44	["1750300424685377083c305.jpg"]	0	3	2025-06-19	\N	\N	\N	0081	\N
94	\N	the same time as a child support of the year	61	2025-06-19 08:58:34	2025-06-19 08:58:34	["17503235136853d139ebb82.jpg"]	0	3	2025-06-19	\N	\N	\N	0082	\N
95	\N	cars	60	2025-06-19 12:18:22	2025-06-19 12:18:22	\N	0	2	2025-06-19	["17503355016854000db6b3d.mp4"]	\N	\N	0083	\N
97	\N	Which is the best place to visit in this summer season ?	63	2025-06-19 12:50:46	2025-06-19 12:50:46	\N	0	1	2025-06-19	\N	Which is the best place to visit in this summer season ?	["Salalah at Khareef Season","Thailand","Bali","Singapore"]	0084	\N
98	\N	France offers pleasant weather throughout the year with varying regional climates. Generally, spring (March-May) and autumn (September-November) are considered ideal for travel due to mild temperatures and fewer crowds. Summer (June-August) brings warm, sunny days, especially in the south, perfect for beach vacations. Winter (December-February) offers opportunities for skiing in the Alps and exploring festive city streets. The French Riviera is known for its warm climate year-round, particularly in cities like Marseille, Toulon, and Nice.	63	2025-06-19 12:54:02	2025-06-19 12:54:02	["175033764168540869ad4c8.jpg","17503376426854086a035e3.jpg","17503376426854086a13f50.jpg"]	0	3	2025-06-19	\N	\N	\N	0085	\N
99	\N	Handmade product	62	2025-06-19 13:01:12	2025-06-19 13:01:12	\N	0	2	2025-06-19	["175033807268540a18b159a.mp4"]	\N	\N	0086	\N
100	\N	goal	60	2025-06-19 14:04:43	2025-06-19 14:04:43	\N	0	2	2025-06-19	["1750341883685418fb121dd.mp4"]	\N	\N	0087	\N
101	\N	black car	60	2025-06-19 14:06:20	2025-06-19 14:06:20	\N	0	2	2025-06-19	["17503419796854195bc5c53.mp4"]	\N	\N	0088	\N
102	\N	psl video	60	2025-06-19 16:13:14	2025-06-19 16:13:14	\N	0	2	2025-06-19	["175034959368543719ef49f.mp4"]	\N	\N	0089	\N
103	\N	test	60	2025-06-19 17:00:30	2025-06-19 17:00:30	["17503524306854422e2505f.jpg"]	0	3	2025-06-19	\N	\N	\N	0090	\N
104	\N	image test	60	2025-06-19 17:01:02	2025-06-19 17:01:02	["17503524626854424e758ab.jpg"]	0	3	2025-06-19	\N	\N	\N	0091	\N
105	\N	multiple images	60	2025-06-21 11:24:58	2025-06-21 11:24:58	["17505050986856968a8ae3f.jpg","17505050986856968abb5cc.jpg"]	0	3	2025-06-21	\N	\N	\N	0092	\N
106	\N	this is pool test	56	2025-06-21 15:22:03	2025-06-21 15:22:03	\N	0	1	2025-06-21	\N	this is pool test	["Yes","No"]	0093	\N
107	\N	Dubai Marina	61	2025-06-22 07:59:40	2025-06-22 07:59:40	\N	0	2	2025-06-22	["17505791806857b7ec1129c.mp4"]	\N	\N	0094	\N
108	\N	Dubai Marina and I have a great day of the same time as a great day of the same time as a kid and I have a great day of the same time as a great👍 day of the same time⌚ as a great👏	61	2025-06-22 08:15:54	2025-06-22 08:15:54	["17505801546857bbba570ed.jpg","17505801546857bbba7bd96.jpg","17505801546857bbba8d6a9.jpg","17505801546857bbba94624.jpg","17505801546857bbba9a5ec.jpg"]	0	3	2025-06-22	\N	\N	\N	0095	\N
109	\N	My AI image	60	2025-06-22 09:47:26	2025-06-22 09:47:26	["17505856466857d12e0aa31.jpg"]	0	3	2025-06-22	\N	\N	\N	0096	\N
110	\N	furniture	60	2025-06-22 12:26:23	2025-06-22 12:26:23	["17505951836857f66f0f811.jpg"]	0	3	2025-06-22	\N	\N	\N	0097	\N
111	\N	Bed	60	2025-06-22 12:27:02	2025-06-22 12:27:02	["17505952226857f696b1287.jpg"]	0	3	2025-06-22	\N	\N	\N	0098	\N
112	\N	test	59	2025-06-22 12:27:39	2025-06-22 12:27:39	["17505952596857f6bb6e34b.jpg"]	0	3	2025-06-22	\N	\N	\N	0099	\N
113	\N	test video	59	2025-06-22 12:28:30	2025-06-22 12:28:30	\N	0	2	2025-06-22	["17505953106857f6ee6850c.mp4"]	\N	\N	0100	\N
114	\N	who win today's cricket 🏏 match	61	2025-06-22 18:14:43	2025-06-22 18:14:43	\N	0	1	2025-06-22	\N	who win today's cricket 🏏 match	["India","Pakistan"]	0101	\N
115	\N	Enjoy the Trip with full heart ❤️	63	2025-06-23 10:57:30	2025-06-23 10:57:30	\N	0	2	2025-06-23	["17506762506859331a55913.mp4"]	\N	\N	0102	\N
116	\N	London Bridge Welcomes you with beautiful sightseeing view	62	2025-06-23 12:27:00	2025-06-23 12:27:00	\N	0	2	2025-06-23	["175068161968594813c1afc.mp4"]	\N	\N	0103	\N
117	\N	London Visit with beautiful ❤️ views	62	2025-06-23 12:33:38	2025-06-23 12:33:38	["1750682018685949a271bc0.jpg","1750682018685949a2c17f4.jpg","1750682018685949a2d67a5.jpg"]	0	3	2025-06-23	\N	\N	\N	0104	\N
118	\N	sports cars	59	2025-06-23 18:51:19	2025-06-23 18:51:19	["17507046796859a2279ffec.jpg","17507046796859a227cda07.jpg","17507046796859a227d3069.jpg"]	0	3	2025-06-23	\N	\N	\N	0105	\N
119	\N	ggg	61	2025-06-23 23:42:11	2025-06-23 23:42:11	\N	0	3	2025-06-24	\N	\N	\N	0106	\N
120	\N	test delete	38	2025-06-24 05:07:22	2025-06-24 05:10:19	\N	0	3	2025-06-24	\N	\N	\N	0107	2025-06-24 05:10:19
128	\N	From private pool villas to epic beach club nights, from sacred temples to wild waterfalls — the countdown to our Bali escape has officially begun! ✈️🌴\n\n#TravelDiaries #BaliVibes #GroupTrip #AdventureAwaits #Seminyak #Ubud #Uluwatu #BucketList	38	2025-06-24 06:15:24	2025-06-24 06:15:24	\N	0	1	2025-06-01	\N	How do you want to travel inside Bali?	["Private Car with Driver","Scooter Rental"]	1750745724	\N
129	\N	Cars	60	2025-06-24 06:15:42	2025-06-24 06:15:42	["1750745742685a428e418f1.jpg"]	0	3	2025-06-24	\N	\N	\N	1750745742	\N
130	\N	Who will win La liga	60	2025-06-24 06:16:45	2025-06-24 06:16:45	\N	0	1	2025-06-24	\N	Who will win La liga	["Barcelona","Madrid"]	1750745805	\N
131	\N	Books 📚 are the most exciting journey of individual life	62	2025-06-24 06:21:06	2025-06-24 06:21:06	["1750746066685a43d2034a7.jpg","1750746066685a43d23fb92.jpg"]	0	3	2025-06-24	\N	\N	\N	1750746066	\N
132	\N	Cairo, Egypt’s sprawling capital, is set on the Nile River. At its heart is Tahrir Square and the vast Egyptian Museum, a trove of antiquities including royal mummies and gilded King Tutankhamun artifacts. Nearby, Giza is the site of the iconic pyramids and Great Sphinx, dating to the 26th century BC. In Gezira Island’s leafy Zamalek district, 187m Cairo Tower affords panoramic city views.	62	2025-06-24 06:51:15	2025-06-24 06:51:15	["1750747874685a4ae28b646.jpg","1750747874685a4ae2d712a.jpg"]	0	3	2025-06-24	\N	\N	\N	1750747875	\N
133	\N	Finding Nemo!!!!! New upcoming series is going to launch....	63	2025-06-24 07:11:37	2025-06-24 07:11:37	\N	0	2	2025-06-24	["1750749096685a4fa8e3de7.mp4"]	\N	\N	1750749097	\N
134	\N	Who will win the match?	60	2025-06-24 07:20:00	2025-06-24 07:20:00	\N	0	1	2025-06-24	\N	Who will win the match?	["Pakistan","Australia"]	1750749600	\N
135	\N	What Tour places you will suggest?	63	2025-06-24 07:33:09	2025-06-24 07:33:09	\N	0	1	2025-06-24	\N	What Tour places you will suggest?	["London Bridge - UK","Egypt Museum- Cairo","Salalah - Oman"]	1750750389	\N
136	\N	Are we going to win?	60	2025-06-24 10:35:34	2025-06-24 10:35:34	\N	0	1	2025-06-24	\N	Are we going to win?	["Yes","No","Maybe"]	1750761334	\N
137	\N	Who win  the today's match	61	2025-06-24 17:38:04	2025-06-24 17:38:04	\N	0	1	2025-06-24	\N	Who win  the today's match	["Liverpool","Manchester United"]	1750786684	\N
138	\N	Best Place to VISIT?	60	2025-06-24 17:51:43	2025-06-24 17:51:43	\N	0	1	2025-06-24	\N	Best Place to VISIT?	["England","USA"]	1750787503	\N
139	\N	Who will win the Race?	60	2025-06-24 20:07:06	2025-06-24 20:07:06	\N	0	1	2025-06-25	\N	Who will win the Race?	["John","David"]	1750795626	\N
140	\N	Who will win the test match?	59	2025-06-24 20:07:59	2025-06-24 20:07:59	\N	0	1	2025-06-25	\N	Who will win the test match?	["India","England"]	1750795679	\N
141	\N	place to visit for tour in summer	62	2025-06-25 05:56:32	2025-06-25 05:56:32	\N	0	1	2025-06-25	\N	place to visit for tour in summer	["Georgia","Salalah","United Kingdom"]	1750830992	\N
142	\N	coldest tuu tui amr sathe vat karu chu ka kya hua tha ki baat nhi hai na to	61	2025-06-25 06:01:29	2025-06-25 06:01:29	\N	0	1	2025-06-25	\N	coldest tuu tui amr sathe vat karu chu ka kya hua tha ki baat nhi hai na to	["artic","iceland","greenland"]	1750831289	\N
143	\N	Dubai	61	2025-06-25 06:03:38	2025-06-25 06:03:38	\N	0	3	2025-06-25	\N	\N	\N	1750831418	\N
\.


--
-- Data for Name: push_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.push_requests (id, user_id, title, body, data, created_at, updated_at, chat_type) FROM stdin;
1	55	New message from Hamid Raza	hi	"{\\"receiverId\\":\\"57\\",\\"senderId\\":\\"55\\"}"	2025-06-18 10:24:38	2025-06-18 10:24:38	\N
2	55	New message from Hamid Raza	hello	"{\\"receiverId\\":\\"57\\",\\"senderId\\":\\"55\\"}"	2025-06-18 10:29:14	2025-06-18 10:29:14	\N
3	55	New message from Hamid Raza	hi	"{\\"receiverId\\":\\"57\\",\\"senderId\\":\\"55\\"}"	2025-06-18 10:35:37	2025-06-18 10:35:37	\N
4	55	New message from Hamid Raza	hi	"{\\"receiverId\\":\\"57\\",\\"senderId\\":\\"55\\"}"	2025-06-18 10:36:57	2025-06-18 10:36:57	\N
5	55	New message from Hamid Raza	hello	"{\\"receiverId\\":\\"57\\",\\"senderId\\":\\"55\\"}"	2025-06-18 10:37:01	2025-06-18 10:37:01	\N
6	55	New message from Hamid Raza	hi hamid	"{\\"receiverId\\":\\"57\\",\\"senderId\\":\\"55\\"}"	2025-06-18 10:39:22	2025-06-18 10:39:22	\N
7	55	New message from Hamid Raza	hello	"{\\"receiverId\\":\\"53\\",\\"senderId\\":\\"55\\"}"	2025-06-18 10:39:33	2025-06-18 10:39:33	\N
8	55	New message from Hamid Raza	hi	"{\\"receiverId\\":\\"53\\",\\"senderId\\":\\"55\\"}"	2025-06-18 10:40:06	2025-06-18 10:40:06	\N
9	55	New message from Hamid Raza	sjjsjs	"{\\"receiverId\\":\\"53\\",\\"senderId\\":\\"55\\"}"	2025-06-18 10:41:09	2025-06-18 10:41:09	\N
10	55	New message from Hamid Raza	dd	"{\\"receiverId\\":\\"53\\",\\"senderId\\":\\"55\\"}"	2025-06-18 10:41:12	2025-06-18 10:41:12	\N
11	56	New message from Hamid Raza	hi	"{\\"receiverId\\":\\"55\\",\\"senderId\\":\\"56\\"}"	2025-06-18 11:01:49	2025-06-18 11:01:49	\N
12	55	New message from Hamid Raza	hi heelo	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"55\\"}"	2025-06-18 11:02:22	2025-06-18 11:02:22	\N
13	56	New message from Hamid Raza	hlo	"{\\"receiverId\\":\\"55\\",\\"senderId\\":\\"56\\"}"	2025-06-18 11:10:32	2025-06-18 11:10:32	\N
14	56	New message from Hamid Raza	hi	"{\\"receiverId\\":\\"55\\",\\"senderId\\":\\"56\\"}"	2025-06-18 11:11:52	2025-06-18 11:11:52	\N
15	55	New message from Hamid Raza	h8	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"55\\"}"	2025-06-18 11:12:20	2025-06-18 11:12:20	\N
16	57	title	descr	"{\\n\\"receiverId\\":\\"55\\",\\n\\"senderId\\":\\"57\\"\\n}"	2025-06-18 11:52:41	2025-06-18 11:52:41	\N
17	55	New message from Hamid Raza	hamid	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"55\\"}"	2025-06-18 11:52:44	2025-06-18 11:52:44	\N
18	56	New message from Hamid Raza	heello	"{\\"receiverId\\":\\"55\\",\\"senderId\\":\\"56\\"}"	2025-06-18 12:02:32	2025-06-18 12:02:32	\N
19	56	New message from Hamid Raza	hi	"{\\"receiverId\\":\\"55\\",\\"senderId\\":\\"56\\"}"	2025-06-18 12:02:53	2025-06-18 12:02:53	\N
20	55	New message from Hamid Raza	hi	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"55\\"}"	2025-06-18 12:03:04	2025-06-18 12:03:04	\N
21	56	New message from Hamid Raza	hi	"{\\"receiverId\\":\\"55\\",\\"senderId\\":\\"56\\"}"	2025-06-18 12:03:38	2025-06-18 12:03:38	\N
22	58	New message from Ameera Raza	hi hamid	"{\\"receiverId\\":\\"55\\",\\"senderId\\":\\"58\\"}"	2025-06-18 12:10:26	2025-06-18 12:10:26	\N
23	55	New message from Hamid Raza	hrllo	"{\\"receiverId\\":\\"58\\",\\"senderId\\":\\"55\\"}"	2025-06-18 12:10:43	2025-06-18 12:10:43	\N
24	55	New message from Hamid Raza	hi	"{\\"receiverId\\":\\"58\\",\\"senderId\\":\\"55\\"}"	2025-06-18 12:15:01	2025-06-18 12:15:01	\N
25	58	New message from Ameera Raza	hi	"{\\"receiverId\\":\\"55\\",\\"senderId\\":\\"58\\"}"	2025-06-18 12:15:07	2025-06-18 12:15:07	\N
26	58	New message from Ameera Raza	hi	"{\\"receiverId\\":\\"55\\",\\"senderId\\":\\"58\\"}"	2025-06-18 14:15:16	2025-06-18 14:15:16	\N
27	55	New message from Hamid Raza	hi	"{\\"receiverId\\":\\"58\\",\\"senderId\\":\\"55\\"}"	2025-06-18 14:19:22	2025-06-18 14:19:22	\N
28	55	New message from Hamid Raza	hi	"{\\"receiverId\\":\\"58\\",\\"senderId\\":\\"55\\"}"	2025-06-18 14:20:36	2025-06-18 14:20:36	\N
29	61	New message from anil nahis	hi	"{\\"receiverId\\":\\"60\\",\\"senderId\\":\\"61\\"}"	2025-06-19 08:56:03	2025-06-19 08:56:03	\N
30	55	New message from Hamid Raza	hi	"{\\"receiverId\\":\\"61\\",\\"senderId\\":\\"55\\"}"	2025-06-19 09:12:43	2025-06-19 09:12:43	\N
31	61	New message from anil nahis	hi	"{\\"receiverId\\":\\"55\\",\\"senderId\\":\\"61\\"}"	2025-06-19 09:13:02	2025-06-19 09:13:02	\N
32	55	New message from Hamid Raza	yes	"{\\"receiverId\\":\\"61\\",\\"senderId\\":\\"55\\"}"	2025-06-19 09:13:11	2025-06-19 09:13:11	\N
33	55	New message from Hamid Raza	hi	"{\\"receiverId\\":\\"31\\",\\"senderId\\":\\"55\\"}"	2025-06-19 09:13:39	2025-06-19 09:13:39	\N
34	63	New message from Leena Meetha	hello	"{\\"receiverId\\":\\"62\\",\\"senderId\\":\\"63\\"}"	2025-06-19 12:19:13	2025-06-19 12:19:13	\N
35	62	New message from Ayesha Tariq	hi	"{\\"receiverId\\":\\"63\\",\\"senderId\\":\\"62\\"}"	2025-06-19 12:19:22	2025-06-19 12:19:22	\N
36	62	New message from Ayesha Tariq	how r u	"{\\"receiverId\\":\\"63\\",\\"senderId\\":\\"62\\"}"	2025-06-19 12:19:28	2025-06-19 12:19:28	\N
37	62	New message from Ayesha Tariq	hello	"{\\"receiverId\\":\\"63\\",\\"senderId\\":\\"62\\"}"	2025-06-19 12:42:37	2025-06-19 12:42:37	\N
38	58	New message from Ameera Raza	hi	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"58\\"}"	2025-06-20 17:08:29	2025-06-20 17:08:29	\N
39	56	New message from Hamid Raza	xxbbx	"{\\"receiverId\\":\\"58\\",\\"senderId\\":\\"56\\"}"	2025-06-20 17:08:47	2025-06-20 17:08:47	\N
40	61	New message from anil nahis	hi	"{\\"receiverId\\":\\"55\\",\\"senderId\\":\\"61\\"}"	2025-06-22 05:14:02	2025-06-22 05:14:02	\N
41	61	New message from anil nahis	hi	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"61\\"}"	2025-06-22 05:34:04	2025-06-22 05:34:04	\N
42	56	New message from Hamid Raza	yes	"{\\"receiverId\\":\\"61\\",\\"senderId\\":\\"56\\"}"	2025-06-22 05:34:17	2025-06-22 05:34:17	\N
43	58	New message from Ameera Raza	hi	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"58\\"}"	2025-06-23 05:43:49	2025-06-23 05:43:49	\N
44	58	New message from Ameera Raza	hamid	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"58\\"}"	2025-06-23 05:44:34	2025-06-23 05:44:34	\N
45	58	New message from Ameera Raza	raza	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"58\\"}"	2025-06-23 05:44:53	2025-06-23 05:44:53	\N
46	58	New message from Ameera Raza	hss	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"58\\"}"	2025-06-23 05:44:54	2025-06-23 05:44:54	\N
47	58	New message from Ameera Raza	djsj	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"58\\"}"	2025-06-23 05:44:55	2025-06-23 05:44:55	\N
48	58	New message from Ameera Raza	shsh	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"58\\"}"	2025-06-23 05:44:55	2025-06-23 05:44:55	\N
49	58	New message from Ameera Raza	sshhss	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"58\\"}"	2025-06-23 05:44:56	2025-06-23 05:44:56	\N
50	58	New message from Ameera Raza	shshs	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"58\\"}"	2025-06-23 05:44:57	2025-06-23 05:44:57	\N
51	58	New message from Ameera Raza	shshs	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"58\\"}"	2025-06-23 05:44:58	2025-06-23 05:44:58	\N
52	58	New message from Ameera Raza	shshs	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"58\\"}"	2025-06-23 05:44:59	2025-06-23 05:44:59	\N
53	58	New message from Ameera Raza	shshs	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"58\\"}"	2025-06-23 05:45:00	2025-06-23 05:45:00	\N
54	58	New message from Ameera Raza	shshs	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"58\\"}"	2025-06-23 05:45:01	2025-06-23 05:45:01	\N
55	58	New message from Ameera Raza	shshs	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"58\\"}"	2025-06-23 05:45:02	2025-06-23 05:45:02	\N
56	58	New message from Ameera Raza	hsjs	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"58\\"}"	2025-06-23 05:45:02	2025-06-23 05:45:02	\N
57	58	New message from Ameera Raza	hi	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"58\\"}"	2025-06-23 05:50:59	2025-06-23 05:50:59	\N
58	58	New message from Ameera Raza	ho	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"58\\"}"	2025-06-23 05:56:04	2025-06-23 05:56:04	\N
59	58	New message from Ameera Raza	hi	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"58\\"}"	2025-06-23 06:02:04	2025-06-23 06:02:04	\N
60	58	New message from Ameera Raza	hi	"{\\"receiverId\\":\\"55\\",\\"senderId\\":\\"58\\"}"	2025-06-23 06:12:17	2025-06-23 06:12:17	\N
61	58	New message from Ameera Raza	hello	"{\\"receiverId\\":\\"55\\",\\"senderId\\":\\"58\\"}"	2025-06-23 06:12:19	2025-06-23 06:12:19	\N
62	58	New message from Ameera Raza	hh	"{\\"receiverId\\":\\"55\\",\\"senderId\\":\\"58\\"}"	2025-06-23 06:12:21	2025-06-23 06:12:21	\N
63	58	New message from Ameera Raza	hj	"{\\"receiverId\\":\\"55\\",\\"senderId\\":\\"58\\"}"	2025-06-23 06:12:22	2025-06-23 06:12:22	\N
64	56	New message from Hamid Raza	hhsss\nhshss\nshjss\nznzjz	"{\\"receiverId\\":\\"58\\",\\"senderId\\":\\"56\\"}"	2025-06-23 07:59:39	2025-06-23 07:59:39	\N
65	56	New message from Hamid Raza	hh	"{\\"receiverId\\":\\"58\\",\\"senderId\\":\\"56\\"}"	2025-06-23 10:58:50	2025-06-23 10:58:50	\N
66	56	New message from Hamid Raza	xnjx	"{\\"receiverId\\":\\"58\\",\\"senderId\\":\\"56\\"}"	2025-06-23 10:58:51	2025-06-23 10:58:51	\N
67	56	New message from Hamid Raza	xj	"{\\"receiverId\\":\\"58\\",\\"senderId\\":\\"56\\"}"	2025-06-23 10:58:54	2025-06-23 10:58:54	\N
68	56	New message from Hamid Raza	xjjx	"{\\"receiverId\\":\\"58\\",\\"senderId\\":\\"56\\"}"	2025-06-23 10:58:57	2025-06-23 10:58:57	\N
69	56	New message from Hamid Raza	xjjx	"{\\"receiverId\\":\\"58\\",\\"senderId\\":\\"56\\"}"	2025-06-23 10:58:58	2025-06-23 10:58:58	\N
70	56	New message from Hamid Raza	jxjx	"{\\"receiverId\\":\\"58\\",\\"senderId\\":\\"56\\"}"	2025-06-23 10:58:59	2025-06-23 10:58:59	\N
71	56	New message from Hamid Raza	jxjx	"{\\"receiverId\\":\\"58\\",\\"senderId\\":\\"56\\"}"	2025-06-23 10:59:00	2025-06-23 10:59:00	\N
72	56	New message from Hamid Raza	jx	"{\\"receiverId\\":\\"58\\",\\"senderId\\":\\"56\\"}"	2025-06-23 10:59:01	2025-06-23 10:59:01	\N
73	56	New message from Hamid Raza	jxjx	"{\\"receiverId\\":\\"58\\",\\"senderId\\":\\"56\\"}"	2025-06-23 10:59:02	2025-06-23 10:59:02	\N
74	56	New message from Hamid Raza	xjjx	"{\\"receiverId\\":\\"58\\",\\"senderId\\":\\"56\\"}"	2025-06-23 10:59:03	2025-06-23 10:59:03	\N
75	56	New message from Hamid Raza	jxjx	"{\\"receiverId\\":\\"58\\",\\"senderId\\":\\"56\\"}"	2025-06-23 10:59:04	2025-06-23 10:59:04	\N
76	56	New message from Hamid Raza	jxix	"{\\"receiverId\\":\\"58\\",\\"senderId\\":\\"56\\"}"	2025-06-23 10:59:05	2025-06-23 10:59:05	\N
77	63	New message from Leena Meetha	hello, you want to join my trip	"{\\"receiverId\\":\\"61\\",\\"senderId\\":\\"63\\"}"	2025-06-23 11:06:19	2025-06-23 11:06:19	\N
78	61	New message from anil nahis	hi	"{\\"receiverId\\":\\"63\\",\\"senderId\\":\\"61\\"}"	2025-06-23 11:07:24	2025-06-23 11:07:24	\N
79	61	New message from anil nahis	hi	"{\\"receiverId\\":\\"63\\",\\"senderId\\":\\"61\\"}"	2025-06-23 11:17:11	2025-06-23 11:17:11	\N
80	63	New message from Leena Meetha	hello	"{\\"receiverId\\":\\"61\\",\\"senderId\\":\\"63\\"}"	2025-06-23 11:17:29	2025-06-23 11:17:29	\N
81	63	New message from Leena Meetha	how are you	"{\\"receiverId\\":\\"61\\",\\"senderId\\":\\"63\\"}"	2025-06-23 11:17:32	2025-06-23 11:17:32	\N
82	61	New message from anil nahis	yup😊👍👍👍👍👍👍👍👍	"{\\"receiverId\\":\\"63\\",\\"senderId\\":\\"61\\"}"	2025-06-23 11:17:37	2025-06-23 11:17:37	\N
83	63	New message from Leena Meetha	hello	"{\\"receiverId\\":\\"61\\",\\"senderId\\":\\"63\\"}"	2025-06-23 11:38:24	2025-06-23 11:38:24	\N
84	61	New message from anil nahis	hi	"{\\"receiverId\\":\\"63\\",\\"senderId\\":\\"61\\"}"	2025-06-23 11:38:41	2025-06-23 11:38:41	\N
85	61	New message from anil nahis	hi	"{\\"receiverId\\":\\"59\\",\\"senderId\\":\\"61\\"}"	2025-06-23 16:17:04	2025-06-23 16:17:04	\N
86	61	New message from anil nahis	hi	"{\\"receiverId\\":\\"62\\",\\"senderId\\":\\"61\\"}"	2025-06-23 16:44:44	2025-06-23 16:44:44	\N
87	61	New message from anil nahis	the same time as a great day of the same time as a great day of the same time as a great day of the same time as a great👍👏😊 day of the same time as	"{\\"receiverId\\":\\"62\\",\\"senderId\\":\\"61\\"}"	2025-06-23 16:45:43	2025-06-23 16:45:43	\N
88	62	New message from Ayesha Tariq	Books 📚 are the most exciting journey of individual life. but when you want to come over and watch the movie with beautiful sightseeing view from the house and we can block or report my name should be there.	"{\\"receiverId\\":\\"61\\",\\"senderId\\":\\"62\\"}"	2025-06-24 06:28:24	2025-06-24 06:28:24	\N
89	62	New message from Ayesha Tariq	hi	"{\\"receiverId\\":\\"60\\",\\"senderId\\":\\"62\\"}"	2025-06-24 07:30:04	2025-06-24 07:30:04	\N
90	64	New message from anil navis	hi	"{\\"receiverId\\":\\"63\\",\\"senderId\\":\\"64\\"}"	2025-06-24 10:23:24	2025-06-24 10:23:24	\N
91	64	New message from anil navis	pls approve my request	"{\\"receiverId\\":\\"63\\",\\"senderId\\":\\"64\\"}"	2025-06-24 10:23:43	2025-06-24 10:23:43	\N
92	60	New message from Usama Shakeel	.	"{\\"receiverId\\":\\"62\\",\\"senderId\\":\\"60\\"}"	2025-06-24 11:13:34	2025-06-24 11:13:34	\N
93	61	New message from anil nahis	the same time as a great day of the same time as a great day of the same time as a great day of the same time⌚ as a great👍 day I will be a great👍 day and checklist of the	"{\\"receiverId\\":\\"55\\",\\"senderId\\":\\"61\\"}"	2025-06-24 12:02:51	2025-06-24 12:02:51	\N
94	61	New message from anil nahis	game and checklist for the same time	"{\\"receiverId\\":\\"55\\",\\"senderId\\":\\"61\\"}"	2025-06-24 12:03:03	2025-06-24 12:03:03	\N
95	62	New message from Ayesha Tariq	hello	"{\\"receiverId\\":\\"60\\",\\"senderId\\":\\"62\\"}"	2025-06-24 14:08:56	2025-06-24 14:08:56	\N
96	55	New message from Hamid Raza	hi	"{\\"receiverId\\":\\"56\\",\\"senderId\\":\\"55\\",\\"chatType\\":\\"normal\\"}"	2025-06-24 14:55:32	2025-06-24 14:55:32	\N
97	55	New message in Member test	hi	"{\\"groupId\\":\\"41\\",\\"senderId\\":\\"55\\",\\"chatType\\":\\"group\\"}"	2025-06-24 14:55:58	2025-06-24 14:55:58	\N
98	55	New message in Member test	group	"{\\"groupId\\":\\"41\\",\\"senderId\\":\\"55\\",\\"chatType\\":\\"group\\"}"	2025-06-24 14:56:46	2025-06-24 14:56:46	\N
99	55	New message in Member test	hi	"{\\"groupId\\":\\"41\\",\\"senderId\\":\\"55\\",\\"chatType\\":\\"group\\"}"	2025-06-24 14:57:19	2025-06-24 14:57:19	\N
100	61	New message in London Bridge	hi	"{\\"groupId\\":\\"45\\",\\"senderId\\":\\"61\\",\\"chatType\\":\\"group\\"}"	2025-06-24 17:33:23	2025-06-24 17:33:23	group
101	55	New message in Member test	hi	"{\\"groupId\\":\\"41\\",\\"senderId\\":\\"55\\",\\"chatType\\":\\"group\\"}"	2025-06-25 05:39:11	2025-06-25 05:39:11	group
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
Gi1XjdHTniCYvetDyJiZs8Yk8kenH1DHALKWRSL3	\N	117.244.199.254	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMGJSc2lxTzJEQTMyZHdTczA0YkoyU1FnVVg0TFlRWHRiOUR2V1dWUyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo2MzoiaHR0cHM6Ly9keGJpdHByb2plY3RzLmNvbS90cmF2ZWxibHpyX3dlYi9wdWJsaWMvYWRtaW4vZGFzaGJvYXJkIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vdHJhdmVsYmx6cl93ZWIvcHVibGljL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1750775651
9PPKTZVY5ioWNQS69BHyn96y7Sfh51slAPDIUMdz	1	86.98.14.154	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoicEJ6Rm4wWld3bmNSZFJXbnlOQTNIdlZqeXpUakNlYktWV1NkVWpmTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vdHJhdmVsYmx6cl93ZWIvcHVibGljL2FkbWluL2NvdW50cmllcyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==	1750763072
sphEIlCXK2AiJDH26hqDRRdevbmzkwnFJ7e7mcC5	1	59.182.229.59	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYTBCcEl3NzR0TzJqa2Vwa0p1dGl6Rk5nd2VmVnVMeVZIUnRqelhRaiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo2NjoiaHR0cHM6Ly9keGJpdHByb2plY3RzLmNvbS90cmF2ZWxibHpyX3dlYi9wdWJsaWMvYWRtaW4vaXRpbmVyYXJ5LzEzIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzI6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vdHJhdmVsYmx6cl93ZWIvcHVibGljL2FkbWluL2NvdW50cmllcy9lZGl0LzIwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==	1750762316
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, support_email, instagream, twitter, facebook, created_at, updated_at) FROM stdin;
1	help@travelblzr.com	@travelblzr	@travelblzr	@travelblzr	2025-06-25 04:21:17	2025-06-25 04:21:17
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
-- Data for Name: temp_check_lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_check_lists (id, temp_id, description, created_at, updated_at) FROM stdin;
1	1	ligheter	2025-05-20 11:42:13	2025-05-20 11:42:13
2	1	dress	2025-05-20 11:42:13	2025-05-20 11:42:13
3	1	ligheter	2025-05-24 17:12:59	2025-05-24 17:12:59
4	1	dress	2025-05-24 17:12:59	2025-05-24 17:12:59
5	31	test check 1	2025-05-25 02:35:56	2025-05-25 02:35:56
6	31	tedt chevk 2	2025-05-25 02:35:56	2025-05-25 02:35:56
7	31	test chevk 3	2025-05-25 02:35:56	2025-05-25 02:35:56
8	39	tett	2025-05-25 11:26:26	2025-05-25 11:26:26
9	40	test check 1	2025-05-25 12:22:25	2025-05-25 12:22:25
10	40	test check 2	2025-05-25 12:22:25	2025-05-25 12:22:25
11	41	test check 2	2025-05-25 12:27:56	2025-05-25 12:27:56
12	42	test check 2	2025-05-25 12:42:17	2025-05-25 12:42:17
13	43	check list 1	2025-05-25 12:53:33	2025-05-25 12:53:33
14	44	Passport 	2025-05-26 08:43:56	2025-05-26 08:43:56
15	44	Emirates Id	2025-05-26 08:43:56	2025-05-26 08:43:56
16	44	Food items like water	2025-05-26 08:43:56	2025-05-26 08:43:56
17	44	 bread	2025-05-26 08:43:56	2025-05-26 08:43:56
18	44	visa copy	2025-05-26 08:43:56	2025-05-26 08:43:56
19	52	check 	2025-06-02 05:51:25	2025-06-02 05:51:25
20	52	check 2	2025-06-02 05:51:25	2025-06-02 05:51:25
21	53	check list 1	2025-06-02 05:58:28	2025-06-02 05:58:28
22	53	check list 2	2025-06-02 05:58:28	2025-06-02 05:58:28
23	54	check	2025-06-02 06:48:09	2025-06-02 06:48:09
24	55	checklist 1	2025-06-02 08:23:37	2025-06-02 08:23:37
25	56	check list	2025-06-02 09:06:36	2025-06-02 09:06:36
26	57	Check list 1	2025-06-03 05:15:15	2025-06-03 05:15:15
27	57	check list 2	2025-06-03 05:15:15	2025-06-03 05:15:15
28	59	pasport	2025-06-03 09:05:27	2025-06-03 09:05:27
29	59	visa	2025-06-03 09:05:27	2025-06-03 09:05:27
30	59	medicine	2025-06-03 09:05:27	2025-06-03 09:05:27
31	60	check list 1	2025-06-03 09:10:52	2025-06-03 09:10:52
32	61	tedt check	2025-06-03 09:12:56	2025-06-03 09:12:56
33	62	passport	2025-06-04 12:45:48	2025-06-04 12:45:48
34	62	visa	2025-06-04 12:45:48	2025-06-04 12:45:48
35	62	dtyy	2025-06-04 12:45:48	2025-06-04 12:45:48
36	63	Checklist 1	2025-06-05 06:45:25	2025-06-05 06:45:25
37	64	Passports	2025-06-07 06:50:14	2025-06-07 06:50:14
38	64	Visa	2025-06-07 06:50:14	2025-06-07 06:50:14
39	64	Track Suite	2025-06-07 06:50:14	2025-06-07 06:50:14
40	64	Sun screen	2025-06-07 06:50:14	2025-06-07 06:50:14
41	64	Sun Glass	2025-06-07 06:50:14	2025-06-07 06:50:14
42	64	Drinking Water 5 Bottle	2025-06-07 06:50:14	2025-06-07 06:50:14
43	64	Medicine	2025-06-07 06:50:14	2025-06-07 06:50:14
44	65	passport 	2025-06-07 07:52:19	2025-06-07 07:52:19
45	65	hisa	2025-06-07 07:52:19	2025-06-07 07:52:19
46	66	check list	2025-06-09 05:36:06	2025-06-09 05:36:06
47	67	checklist.	2025-06-09 05:45:17	2025-06-09 05:45:17
48	74	visa	2025-06-10 07:36:05	2025-06-10 07:36:05
49	74	passport	2025-06-10 07:36:05	2025-06-10 07:36:05
50	75	check 1	2025-06-11 13:39:59	2025-06-11 13:39:59
51	75	check 2	2025-06-11 13:39:59	2025-06-11 13:39:59
52	76	check 1	2025-06-11 13:44:06	2025-06-11 13:44:06
53	76	check 2	2025-06-11 13:44:06	2025-06-11 13:44:06
54	78	hamid	2025-06-16 16:35:49	2025-06-16 16:35:49
55	79	hicking	2025-06-16 16:39:46	2025-06-16 16:39:46
56	80	hello	2025-06-16 16:50:54	2025-06-16 16:50:54
57	81	Passport 	2025-06-19 12:26:41	2025-06-19 12:26:41
58	81	Emirates ID	2025-06-19 12:26:41	2025-06-19 12:26:41
59	81	Hotel Booking 	2025-06-19 12:26:41	2025-06-19 12:26:41
60	81	Medicine	2025-06-19 12:26:41	2025-06-19 12:26:41
61	82	Hotel reservations 	2025-06-19 13:06:47	2025-06-19 13:06:47
62	82	Emirates ID	2025-06-19 13:06:47	2025-06-19 13:06:47
63	83	Food	2025-06-20 06:53:41	2025-06-20 06:53:41
64	84	food	2025-06-20 07:03:40	2025-06-20 07:03:40
65	85	pass	2025-06-21 03:10:06	2025-06-21 03:10:06
66	85	tyuuui	2025-06-21 03:10:06	2025-06-21 03:10:06
67	85	tyyu	2025-06-21 03:10:06	2025-06-21 03:10:06
68	85	tuui	2025-06-21 03:10:06	2025-06-21 03:10:06
69	87	ch3cklist	2025-06-21 14:41:22	2025-06-21 14:41:22
70	87	one	2025-06-21 14:41:22	2025-06-21 14:41:22
71	87	tqo	2025-06-21 14:41:22	2025-06-21 14:41:22
72	88	Life Jacket	2025-06-22 05:24:56	2025-06-22 05:24:56
73	88	climbing rop	2025-06-22 05:24:56	2025-06-22 05:24:56
74	88	fist aid box	2025-06-22 05:24:56	2025-06-22 05:24:56
75	88	Mask	2025-06-22 05:24:56	2025-06-22 05:24:56
76	88	Sweaters	2025-06-22 05:24:56	2025-06-22 05:24:56
77	88	Sunscreen	2025-06-22 05:24:56	2025-06-22 05:24:56
78	88	Back pack	2025-06-22 05:24:56	2025-06-22 05:24:56
79	88	Mineral water 5liter	2025-06-22 05:24:56	2025-06-22 05:24:56
80	88	Passport and Visa	2025-06-22 05:24:56	2025-06-22 05:24:56
81	88	Health Insurance	2025-06-22 05:24:56	2025-06-22 05:24:56
82	89	Passport 	2025-06-23 12:17:22	2025-06-23 12:17:22
83	89	Visa 	2025-06-23 12:17:22	2025-06-23 12:17:22
84	89	Medical Insurance 	2025-06-23 12:17:22	2025-06-23 12:17:22
85	89	Medical Kit	2025-06-23 12:17:22	2025-06-23 12:17:22
86	90	Passport 	2025-06-24 06:47:31	2025-06-24 06:47:31
87	90	Visa	2025-06-24 06:47:31	2025-06-24 06:47:31
88	90	Air tickets	2025-06-24 06:47:31	2025-06-24 06:47:31
89	90	medical Insurance	2025-06-24 06:47:31	2025-06-24 06:47:31
90	91	Check one	2025-06-24 18:11:04	2025-06-24 18:11:04
91	92	passport	2025-06-24 18:14:14	2025-06-24 18:14:14
\.


--
-- Data for Name: temp_cost_break_downs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_cost_break_downs (id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: temp_itineraries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_itineraries (id, temp_id, day_number, date, time_from, time_to, description, created_at, updated_at) FROM stdin;
1	1	1	2025-05-19	08:10:00	10:00:00	desc	2025-05-20 11:41:55	2025-05-20 11:41:55
2	1	2	2025-05-20	08:10:00	10:00:00	desc	2025-05-20 11:41:55	2025-05-20 11:41:55
3	1	1	2025-05-19	08:10:00	10:00:00	desc	2025-05-24 15:17:43	2025-05-24 15:17:43
4	1	2	2025-05-20	08:10:00	10:00:00	desc	2025-05-24 15:17:43	2025-05-24 15:17:43
5	26	1	2025-05-24	21:44:00	21:44:00	tedt day 11	2025-05-24 16:44:52	2025-05-24 16:44:52
6	26	2	2025-05-25	21:44:00	21:44:00	test day 2	2025-05-24 16:44:52	2025-05-24 16:44:52
7	27	1	2025-05-24	19:59:00	20:59:00	test day 11	2025-05-24 17:00:32	2025-05-24 17:00:32
8	27	2	2025-05-25	21:59:00	22:59:00	test day 2	2025-05-24 17:00:32	2025-05-24 17:00:32
9	28	1	2025-05-24	19:05:00	20:05:00	test day 11	2025-05-24 17:06:26	2025-05-24 17:06:26
10	28	2	2025-05-25	22:06:00	23:06:00	test day 2	2025-05-24 17:06:26	2025-05-24 17:06:26
11	28	1	2025-05-24	19:05:00	20:05:00	test day 11	2025-05-24 17:06:58	2025-05-24 17:06:58
12	28	2	2025-05-25	22:06:00	23:06:00	test day 2	2025-05-24 17:06:58	2025-05-24 17:06:58
13	30	1	2025-05-25	07:22:00	08:22:00	test 1	2025-05-25 02:22:55	2025-05-25 02:22:55
14	30	2	2025-05-26	09:22:00	10:22:00	test 2	2025-05-25 02:22:55	2025-05-25 02:22:55
15	31	1	2025-05-25	07:34:00	08:34:00	test day 1	2025-05-25 02:35:26	2025-05-25 02:35:26
16	31	2	2025-05-26	07:35:00	09:35:00	test day 2	2025-05-25 02:35:26	2025-05-25 02:35:26
17	32	1	2025-05-25	15:04:00	15:04:00	test day 1	2025-05-25 10:04:43	2025-05-25 10:04:43
18	32	2	2025-05-26	15:04:00	16:04:00	tedt day 2	2025-05-25 10:04:43	2025-05-25 10:04:43
19	33	1	2025-05-25	15:10:00	15:10:00	test day 1	2025-05-25 10:10:44	2025-05-25 10:10:44
20	33	2	2025-05-26	15:10:00	15:10:00	test 2	2025-05-25 10:10:44	2025-05-25 10:10:44
21	34	1	2025-05-25	15:19:00	15:19:00	tedt da11	2025-05-25 10:20:15	2025-05-25 10:20:15
22	34	2	2025-05-26	15:20:00	15:20:00	test day 2	2025-05-25 10:20:15	2025-05-25 10:20:15
23	37	1	2025-05-25	15:39:00	15:39:00	test	2025-05-25 10:40:18	2025-05-25 10:40:18
24	37	2	2025-05-26	15:40:00	15:40:00	teast 2	2025-05-25 10:40:18	2025-05-25 10:40:18
25	39	1	2025-05-25	16:01:00	16:02:00	test day 1	2025-05-25 11:03:19	2025-05-25 11:03:19
26	39	2	2025-05-26	16:02:00	16:03:00	test day 2	2025-05-25 11:03:19	2025-05-25 11:03:19
27	40	1	2025-05-25	17:19:00	17:20:00	test day 1	2025-05-25 12:20:51	2025-05-25 12:20:51
28	40	2	2025-05-26	17:20:00	17:21:00	test day 2	2025-05-25 12:20:51	2025-05-25 12:20:51
29	41	1	2025-05-25	17:27:00	17:28:00	day 1	2025-05-25 12:27:44	2025-05-25 12:27:44
30	41	2	2025-05-26	17:27:00	17:28:00	day 2	2025-05-25 12:27:44	2025-05-25 12:27:44
31	42	1	2025-05-25	17:41:00	17:42:00	test day 1	2025-05-25 12:42:10	2025-05-25 12:42:10
32	42	2	2025-05-26	17:42:00	17:43:00	test day 2	2025-05-25 12:42:10	2025-05-25 12:42:10
33	43	1	2025-05-25	17:53:00	17:54:00	test day 1	2025-05-25 12:53:21	2025-05-25 12:53:21
34	43	2	2025-05-26	17:53:00	17:54:00	day 2	2025-05-25 12:53:21	2025-05-25 12:53:21
35	44	1	2025-06-01	22:33:00	22:34:00	dinner	2025-05-26 08:42:52	2025-05-26 08:42:52
36	44	2	2025-06-02	09:42:00	12:43:00	breakfast	2025-05-26 08:42:52	2025-05-26 08:42:52
37	44	3	2025-06-03	09:43:00	11:44:00	breakfast	2025-05-26 08:42:52	2025-05-26 08:42:52
38	52	1	2025-06-02	10:50:00	10:51:00	day test 1	2025-06-02 05:51:06	2025-06-02 05:51:06
39	52	1	2025-06-02	10:52:00	10:53:00	day test 11	2025-06-02 05:51:06	2025-06-02 05:51:06
40	52	2	2025-06-03	10:50:00	10:51:00	day test 2	2025-06-02 05:51:06	2025-06-02 05:51:06
41	53	1	2025-06-02	10:57:00	10:58:00	test day 1	2025-06-02 05:58:11	2025-06-02 05:58:11
42	53	1	2025-06-02	10:59:00	11:00:00	test day 11	2025-06-02 05:58:11	2025-06-02 05:58:11
43	53	2	2025-06-03	10:58:00	10:59:00	test day 2	2025-06-02 05:58:11	2025-06-02 05:58:11
44	54	1	2025-06-04	11:47:00	11:48:00	day 1	2025-06-02 06:48:04	2025-06-02 06:48:04
45	54	2	2025-06-05	11:47:00	11:48:00	day 2	2025-06-02 06:48:04	2025-06-02 06:48:04
46	55	1	2025-06-04	13:23:00	13:24:00	day 1	2025-06-02 08:23:25	2025-06-02 08:23:25
47	55	2	2025-06-05	13:23:00	13:24:00	day 2	2025-06-02 08:23:25	2025-06-02 08:23:25
48	56	1	2025-06-03	14:05:00	14:06:00	day 1	2025-06-02 09:06:23	2025-06-02 09:06:23
49	56	2	2025-06-04	14:06:00	14:07:00	day 2	2025-06-02 09:06:23	2025-06-02 09:06:23
50	56	3	2025-06-05	14:06:00	14:07:00	day 3	2025-06-02 09:06:23	2025-06-02 09:06:23
51	57	1	2025-06-04	10:14:00	10:15:00	Day 1	2025-06-03 05:15:00	2025-06-03 05:15:00
52	57	1	2025-06-04	10:16:00	10:17:00	Day 11	2025-06-03 05:15:00	2025-06-03 05:15:00
53	57	2	2025-06-05	10:14:00	10:15:00	Day 2	2025-06-03 05:15:00	2025-06-03 05:15:00
54	59	1	2025-06-03	08:32:00	08:33:00	breakfa	2025-06-03 09:04:41	2025-06-03 09:04:41
55	59	1	2025-06-03	08:34:00	09:35:00	lunch	2025-06-03 09:04:41	2025-06-03 09:04:41
56	59	2	2025-06-04	08:33:00	08:34:00	df	2025-06-03 09:04:41	2025-06-03 09:04:41
57	59	2	2025-06-04	08:35:00	09:36:00	rrtr	2025-06-03 09:04:41	2025-06-03 09:04:41
58	60	1	2025-06-03	14:10:00	14:11:00	day1	2025-06-03 09:10:45	2025-06-03 09:10:45
59	60	2	2025-06-04	14:10:00	14:11:00	day 2	2025-06-03 09:10:45	2025-06-03 09:10:45
60	61	1	2025-06-03	14:12:00	14:13:00	day 1	2025-06-03 09:12:50	2025-06-03 09:12:50
61	61	2	2025-06-04	14:12:00	14:13:00	day 2	2025-06-03 09:12:50	2025-06-03 09:12:50
62	62	1	2025-06-04	06:12:00	15:13:00	trip 1	2025-06-04 12:44:36	2025-06-04 12:44:36
63	62	1	2025-06-04	15:14:00	18:15:00	trip 2	2025-06-04 12:44:36	2025-06-04 12:44:36
64	62	2	2025-06-05	08:14:00	11:15:00	dfg	2025-06-04 12:44:36	2025-06-04 12:44:36
65	62	3	2025-06-06	07:14:00	07:15:00	errr	2025-06-04 12:44:36	2025-06-04 12:44:36
66	63	1	2025-06-06	11:45:00	11:46:00	Day 1	2025-06-05 06:45:17	2025-06-05 06:45:17
67	63	2	2025-06-07	11:45:00	11:46:00	Day 2	2025-06-05 06:45:17	2025-06-05 06:45:17
68	64	1	2025-06-07	09:06:00	10:07:00	Break Fast	2025-06-07 06:47:44	2025-06-07 06:47:44
69	64	1	2025-06-07	10:08:00	12:30:00	Marina Sight seeing	2025-06-07 06:47:44	2025-06-07 06:47:44
70	64	1	2025-06-07	12:31:00	13:32:00	Lunch Time	2025-06-07 06:47:44	2025-06-07 06:47:44
71	64	1	2025-06-07	13:33:00	19:34:00	Marina walk	2025-06-07 06:47:44	2025-06-07 06:47:44
72	64	1	2025-06-07	19:35:00	20:36:00	Dinner	2025-06-07 06:47:44	2025-06-07 06:47:44
73	64	2	2025-06-08	09:00:00	10:01:00	Break fast	2025-06-07 06:47:44	2025-06-07 06:47:44
74	64	2	2025-06-08	10:02:00	13:03:00	trekking	2025-06-07 06:47:44	2025-06-07 06:47:44
75	64	2	2025-06-08	13:04:00	13:05:00	lunch	2025-06-07 06:47:44	2025-06-07 06:47:44
76	64	2	2025-06-08	13:06:00	19:07:00	Desert Safari	2025-06-07 06:47:44	2025-06-07 06:47:44
77	64	2	2025-06-08	19:08:00	20:09:00	Dinner	2025-06-07 06:47:44	2025-06-07 06:47:44
78	65	1	2025-06-08	05:21:00	06:22:00	Break Fast	2025-06-07 07:52:03	2025-06-07 07:52:03
79	65	2	2025-06-09	08:21:00	09:22:00	Break fast	2025-06-07 07:52:03	2025-06-07 07:52:03
80	66	1	2025-06-09	10:35:00	10:36:00	tedt	2025-06-09 05:35:45	2025-06-09 05:35:45
81	66	2	2025-06-10	10:35:00	10:36:00	tedt 2	2025-06-09 05:35:45	2025-06-09 05:35:45
82	67	1	2025-06-09	10:44:00	10:45:00	test	2025-06-09 05:44:53	2025-06-09 05:44:53
83	67	2	2025-06-10	10:44:00	10:45:00	tedt 2	2025-06-09 05:44:53	2025-06-09 05:44:53
84	68	1	2025-05-19	08:10:00	\N	desc	2025-06-09 11:31:20	2025-06-09 11:31:20
85	68	1	2025-05-19	08:10:00	10:00:00	desc	2025-06-09 11:31:20	2025-06-09 11:31:20
86	68	2	2025-05-20	08:10:00	10:00:00	desc	2025-06-09 11:31:20	2025-06-09 11:31:20
87	70	1	2025-06-09	16:46:00	\N	test day 1	2025-06-09 11:49:03	2025-06-09 11:49:03
88	70	1	2025-06-09	16:46:00	\N	test day 2	2025-06-09 11:49:03	2025-06-09 11:49:03
89	70	2	2025-06-10	16:48:00	\N	test day 2	2025-06-09 11:49:03	2025-06-09 11:49:03
90	74	1	2025-06-11	06:04:00	08:05:00	errfgcgccbcb the same as the same as I have to go uuuuuuuuuujjk to y	2025-06-10 07:35:45	2025-06-10 07:35:45
91	74	1	2025-06-11	08:06:00	09:07:00	r u in the morning and I am not sure about the same as the same time to sleep 😪😪😪😪	2025-06-10 07:35:45	2025-06-10 07:35:45
92	74	2	2025-06-12	04:05:00	06:06:00	rtryyyy huhjhi the same time as I have a flat in TVM in a uuuuuuuuuujjk year ago i will call	2025-06-10 07:35:45	2025-06-10 07:35:45
93	75	1	2025-06-11	18:39:00	\N	test da1	2025-06-11 13:39:50	2025-06-11 13:39:50
94	75	1	2025-06-11	18:40:00	\N	tea\nday11	2025-06-11 13:39:50	2025-06-11 13:39:50
95	75	2	2025-06-12	14:39:00	\N	day 2	2025-06-11 13:39:50	2025-06-11 13:39:50
96	76	1	2025-06-11	18:43:00	\N	day 1	2025-06-11 13:43:54	2025-06-11 13:43:54
97	76	2	2025-06-12	18:44:00	\N	day 2	2025-06-11 13:43:54	2025-06-11 13:43:54
98	78	1	2025-06-16	21:35:00	\N	hi	2025-06-16 16:35:42	2025-06-16 16:35:42
99	78	2	2025-06-17	00:35:00	\N	hello	2025-06-16 16:35:42	2025-06-16 16:35:42
100	79	1	2025-06-18	21:39:00	\N	hello	2025-06-16 16:39:40	2025-06-16 16:39:40
101	79	2	2025-06-19	23:59:00	\N	hamid	2025-06-16 16:39:40	2025-06-16 16:39:40
102	80	1	2025-06-16	21:50:00	\N	hello	2025-06-16 16:50:49	2025-06-16 16:50:49
103	80	2	2025-06-17	21:50:00	\N	kdkdkdks	2025-06-16 16:50:49	2025-06-16 16:50:49
104	80	3	2025-06-18	21:50:00	\N	hi	2025-06-16 16:50:49	2025-06-16 16:50:49
105	80	4	2025-06-19	21:50:00	\N	kxdks	2025-06-16 16:50:49	2025-06-16 16:50:49
106	81	1	2025-06-28	09:30:00	\N	Breakfast	2025-06-19 12:26:03	2025-06-19 12:26:03
107	81	1	2025-06-28	11:30:00	\N	Swimming	2025-06-19 12:26:03	2025-06-19 12:26:03
108	81	2	2025-06-29	10:25:00	\N	Breakfast	2025-06-19 12:26:03	2025-06-19 12:26:03
109	81	2	2025-06-29	16:25:00	\N	lunch	2025-06-19 12:26:03	2025-06-19 12:26:03
110	81	2	2025-06-29	22:25:00	\N	dinner	2025-06-19 12:26:03	2025-06-19 12:26:03
111	82	1	2025-07-01	08:05:00	\N	breakfast	2025-06-19 13:06:30	2025-06-19 13:06:30
112	82	1	2025-07-01	12:05:00	\N	Sky observation	2025-06-19 13:06:30	2025-06-19 13:06:30
113	82	2	2025-07-02	10:05:00	\N	Breakfast	2025-06-19 13:06:30	2025-06-19 13:06:30
114	82	2	2025-07-02	13:06:00	\N	lunch	2025-06-19 13:06:30	2025-06-19 13:06:30
115	82	2	2025-07-02	22:06:00	\N	dinner	2025-06-19 13:06:30	2025-06-19 13:06:30
116	83	1	2025-06-23	11:53:00	\N	fun	2025-06-20 06:53:34	2025-06-20 06:53:34
117	83	2	2025-06-24	23:53:00	\N	yes	2025-06-20 06:53:34	2025-06-20 06:53:34
118	83	3	2025-06-25	11:53:00	\N	yes	2025-06-20 06:53:34	2025-06-20 06:53:34
119	84	1	2025-06-23	12:03:00	\N	fun	2025-06-20 07:03:36	2025-06-20 07:03:36
120	84	2	2025-06-24	12:03:00	\N	hello	2025-06-20 07:03:36	2025-06-20 07:03:36
121	84	3	2025-06-25	12:03:00	\N	hello 3	2025-06-20 07:03:36	2025-06-20 07:03:36
122	85	1	2025-06-22	08:38:00	\N	Triple threat to be a great day of the same time as a child support of the same	2025-06-21 03:09:45	2025-06-21 03:09:45
123	85	1	2025-06-22	09:39:00	\N	tula nahi hai na to be a child support of the same time as a child support of	2025-06-21 03:09:45	2025-06-21 03:09:45
124	85	2	2025-06-23	10:39:00	\N	the same time as a child support	2025-06-21 03:09:45	2025-06-21 03:09:45
125	85	3	2025-06-24	09:39:00	\N	tym ni to be in the world is the only thing we were wuw	2025-06-21 03:09:45	2025-06-21 03:09:45
126	87	1	2025-06-21	19:40:00	\N	Day one	2025-06-21 14:41:09	2025-06-21 14:41:09
127	87	2	2025-06-22	19:41:00	\N	day two	2025-06-21 14:41:09	2025-06-21 14:41:09
128	88	1	2025-06-22	10:49:00	\N	Break fast together	2025-06-22 05:22:30	2025-06-22 05:22:30
129	88	1	2025-06-22	11:49:00	\N	Trip to Dubai Beaches and I have a great day of the same time as a great day of the same time as a great day of the same time as	2025-06-22 05:22:30	2025-06-22 05:22:30
130	88	1	2025-06-22	17:50:00	\N	Dinner with a great day of the same time as a great day of the same time as well as a great	2025-06-22 05:22:30	2025-06-22 05:22:30
131	88	2	2025-06-23	10:51:00	\N	Break fast	2025-06-22 05:22:30	2025-06-22 05:22:30
132	88	2	2025-06-23	11:51:00	\N	Trekking ga to be a great day of the same time as a great day of the same time as a great day of the same time	2025-06-22 05:22:30	2025-06-22 05:22:30
133	88	3	2025-06-24	10:52:00	\N	canoe🛶 and I have a great day of the same time as a great day of the same time as a great day of the same time	2025-06-22 05:22:30	2025-06-22 05:22:30
134	88	3	2025-06-24	11:52:00	\N	the same time as a great day of the same time as a great day of the same time as a	2025-06-22 05:22:30	2025-06-22 05:22:30
135	89	1	2025-07-18	09:30:00	\N	breakfast	2025-06-23 12:16:55	2025-06-23 12:16:55
136	89	1	2025-07-18	12:16:00	\N	London Bridge tour	2025-06-23 12:16:55	2025-06-23 12:16:55
137	89	2	2025-07-19	10:16:00	\N	breakfast	2025-06-23 12:16:55	2025-06-23 12:16:55
138	89	2	2025-07-19	15:16:00	\N	lunch	2025-06-23 12:16:55	2025-06-23 12:16:55
139	90	1	2025-07-19	10:46:00	\N	Breakfast	2025-06-24 06:47:09	2025-06-24 06:47:09
140	90	1	2025-07-19	14:46:00	\N	Lunch	2025-06-24 06:47:09	2025-06-24 06:47:09
141	90	2	2025-07-20	10:46:00	\N	Breakfast	2025-06-24 06:47:09	2025-06-24 06:47:09
142	90	2	2025-07-20	15:47:00	\N	Tour	2025-06-24 06:47:09	2025-06-24 06:47:09
143	91	1	2025-06-29	23:10:00	\N	day one	2025-06-24 18:10:55	2025-06-24 18:10:55
144	91	2	2025-06-30	23:10:00	\N	day two	2025-06-24 18:10:55	2025-06-24 18:10:55
145	92	1	2025-06-25	23:13:00	\N	day ome	2025-06-24 18:14:09	2025-06-24 18:14:09
146	92	2	2025-06-26	23:13:00	\N	day two	2025-06-24 18:14:09	2025-06-24 18:14:09
147	92	3	2025-06-27	23:13:00	\N	day three	2025-06-24 18:14:09	2025-06-24 18:14:09
148	92	4	2025-06-28	23:13:00	\N	day 4	2025-06-24 18:14:09	2025-06-24 18:14:09
149	92	5	2025-06-29	23:14:00	\N	day 5	2025-06-24 18:14:09	2025-06-24 18:14:09
\.


--
-- Data for Name: temp_journeys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_journeys (id, user_id, file_name, title, destination, accomodation, destination_url, small_description, map_link, start_date, end_date, created_at, updated_at, country_id) FROM stdin;
82	63	175033830968540b055bdef.	Burj ul Arab Journey	Dubai, UAE	Jumeirah Pine Hotel	https://www.google.com/travel/hotels/s/y2uS6mpAXL5jk1RQA	\N	\N	2025-07-01	2025-07-02	2025-06-19 13:05:09	2025-06-19 13:05:09	1
84	56	1750402995685507b3c52e7.	Member test	Lahore	yes	https://www.google.com	\N	\N	2025-06-23	2025-06-25	2025-06-20 07:03:16	2025-06-20 07:03:16	136
87	58	17505168466856c46edb60a.	Member test	Lahore	Model town	https://www.google.com	\N	\N	2025-06-21	2025-06-22	2025-06-21 14:40:47	2025-06-21 14:40:47	136
88	61	1750569507685792238fe5e.	Dubai Marina Trip	Dubai	Grand Hayat	https://www.hyatt.com/en-US/member/enroll?icamp=woh_enrolllink_offerspage_en	\N	\N	2025-06-22	2025-06-24	2025-06-22 05:18:27	2025-06-22 05:18:27	1
90	62	1750747591685a49c75f164.	Egypt	Cairo, Egypt	Pyramid Hotel	https://www.google.com/travel/hotels/s/RWBjvji5hGzzZLi39	\N	\N	2025-07-19	2025-07-20	2025-06-24 06:46:31	2025-06-24 06:46:31	57
92	55	1750788816685aead05c278.	day test	Lahore	accomodation	http://www.google.com	\N	\N	2025-06-25	2025-06-29	2025-06-24 18:13:36	2025-06-24 18:13:36	136
45	36	17484934736837e4a1bab27.png	Todays	des	acad	https://facebook.com	\N	\N	2025-05-19	2025-05-25	2025-05-29 04:37:53	2025-05-29 04:37:53	0
51	12	\N	test	des	acad	https://facebook.com	\N	\N	2025-05-19	2025-05-25	2025-06-02 05:28:23	2025-06-02 05:28:23	1
59	35	1748941343683eba1fd78cb.	Trip to Dubai	https://maps.google.com/?q=Dubai+Marina+-+Dubai+-+United+Arab+Emirates&ftid=0x3e5f6b5402c126e3:0xb9511e6655c46d7c&entry=gps&g_st=aw	Grand Hayat	https://g.co/kgs/2tSqBLm	\N	\N	2025-06-03	2025-06-04	2025-06-03 09:02:24	2025-06-03 09:02:24	1
62	38	174904093668403f2819b16.	Marina Dubai	https://maps.app.goo.gl/VCS8KVRWSd46kgm28	Grand Hyat	https://www.hyatt.com/grand-hyatt/en-US/dxbgh-grand-hyatt-dubai	\N	\N	2025-06-04	2025-06-06	2025-06-04 12:42:16	2025-06-04 12:42:16	1
65	48	17492826566843ef60aeaf0.	Desert Safari	https://maps.app.goo.gl/VCS8KVRWSd46kgm28	Grand Hayat	https://www.hyatt.com/grand-hyatt/en-US/dxbgh-grand-hyatt-dubai	\N	\N	2025-06-08	2025-06-09	2025-06-07 07:50:56	2025-06-07 07:50:56	1
74	51	17495408506847dff2526ef.	dtyuffgh	rtgy	dfgh	https://www.hyatt.com/grand-hyatt/en-US/dxbgh-grand-hyatt-dubai	\N	\N	2025-06-11	2025-06-12	2025-06-10 07:34:10	2025-06-10 07:34:10	1
76	37	1749649400684987f824e98.	Journey	Dubai	JBR Beach	https://example.com	\N	\N	2025-06-11	2025-06-12	2025-06-11 13:43:20	2025-06-11 13:43:20	1
\.


--
-- Data for Name: temp_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_users (id, name, email, dial_code, phone, phone_verified, active, email_verified, password, email_verified_at, role, first_name, last_name, user_image, user_phone_otp, user_email_otp, user_device_token, user_device_type, user_access_token, firebase_user_key, device_cart_id, created_at, updated_at, username, country_id) FROM stdin;
36	s d	sd@yopmail.com	963	159159159	0	1	1	$2y$12$OMu/8.MmBAPqTWxblfZvCu59sd9XXpRFKWxUy7j.w3q.2H4yEWzym	2025-06-04 13:31:00	\N	s	d	\N	1111	1111	cPS1LGCoRl27wQlzdeKo5F:APA91bGRE46-0i3cCTfjSadI5iyKpMa1BwfQIgc2pOU1grg_mKVSGf-RyWy6Aze4CdObkM_OfQBzAaFMvye-_v4DcgKvgYaE8IOwHxpL2G-CsggEdFcJLqw	android	\N	\N	\N	2025-06-04 13:31:00	2025-06-04 13:31:00	sd123	0
38	sooraj sabu	wQrTMnkB2Zhi/N/PpUhixWYwyxTKEuGjPCC8ykvlxsY=	91	IQYV0kDYSh7yCzHD+MFYtQ==	0	1	1	$2y$12$JxR9AlF.Os4UhZBqSBx6iOZO4SeAAF9nRvt0Xicngtj78kuITlXEu	2025-06-04 13:54:45	2	sooraj	sabu	\N	1111	1111	fcm_token	android	\N	\N	\N	2025-06-04 13:54:46	2025-06-04 13:54:46	sooraj117114	5
\.


--
-- Data for Name: user_activities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_activities (id, user_id, action, description, ip_address, user_agent, model_type, model_id, created_at, updated_at, meta_data) FROM stdin;
1	37	journey_created	New Journey created successfully	119.160.57.141	Ktor client	App\\Models\\Journey	52	2025-06-02 05:49:51	2025-06-02 05:49:51	\N
2	37	journey_created	New Journey created successfully	119.160.57.141	Ktor client	App\\Models\\Journey	53	2025-06-02 05:57:35	2025-06-02 05:57:35	\N
3	37	journey_created	New Journey created successfully	119.160.57.141	Ktor client	App\\Models\\Journey	54	2025-06-02 06:47:46	2025-06-02 06:47:46	\N
4	37	journey_created	New Journey created successfully	118.103.229.78	Ktor client	App\\Models\\Journey	55	2025-06-02 08:23:05	2025-06-02 08:23:05	\N
5	37	journey_created	New Journey created successfully	118.103.229.78	Ktor client	App\\Models\\Journey	56	2025-06-02 09:05:52	2025-06-02 09:05:52	\N
6	37	journey_created	New Journey created successfully	118.103.229.92	Ktor client	App\\Models\\Journey	57	2025-06-03 05:14:25	2025-06-03 05:14:25	\N
7	35	journey_created	New Journey created successfully	106.76.182.180	Ktor client	App\\Models\\Journey	58	2025-06-03 08:55:55	2025-06-03 08:55:55	\N
8	35	journey_created	New Journey created successfully	106.76.182.180	Ktor client	App\\Models\\Journey	59	2025-06-03 09:02:24	2025-06-03 09:02:24	\N
9	37	journey_created	New Journey created successfully	118.103.229.92	Ktor client	App\\Models\\Journey	60	2025-06-03 09:10:28	2025-06-03 09:10:28	\N
10	37	journey_created	New Journey created successfully	118.103.229.92	Ktor client	App\\Models\\Journey	61	2025-06-03 09:12:30	2025-06-03 09:12:30	\N
11	38	journey_created	New Journey created successfully	106.76.183.8	Ktor client	App\\Models\\Journey	62	2025-06-04 12:42:16	2025-06-04 12:42:16	\N
12	37	journey_created	New Journey created successfully	118.103.229.92	Ktor client	App\\Models\\Journey	63	2025-06-05 06:44:55	2025-06-05 06:44:55	\N
13	48	journey_created	New Journey created successfully	49.37.227.13	Ktor client	App\\Models\\Journey	64	2025-06-07 06:41:10	2025-06-07 06:41:10	\N
14	48	journey_created	New Journey created successfully	49.37.227.13	Ktor client	App\\Models\\Journey	65	2025-06-07 07:50:56	2025-06-07 07:50:56	\N
15	37	journey_created	New Journey created successfully	118.103.229.77	Ktor client	App\\Models\\Journey	66	2025-06-09 05:35:21	2025-06-09 05:35:21	\N
16	37	journey_created	New Journey created successfully	118.103.229.77	Ktor client	App\\Models\\Journey	67	2025-06-09 05:44:32	2025-06-09 05:44:32	\N
17	37	journey_created	New Journey created successfully	110.39.137.35	PostmanRuntime/7.44.0	App\\Models\\Journey	68	2025-06-09 11:30:29	2025-06-09 11:30:29	\N
18	37	journey_created	New Journey created successfully	110.39.137.35	Ktor client	App\\Models\\Journey	69	2025-06-09 11:41:59	2025-06-09 11:41:59	\N
19	37	journey_created	New Journey created successfully	110.39.137.35	Ktor client	App\\Models\\Journey	70	2025-06-09 11:46:00	2025-06-09 11:46:00	\N
20	37	journey_created	New Journey created successfully	110.39.137.35	Ktor client	App\\Models\\Journey	71	2025-06-09 11:51:43	2025-06-09 11:51:43	\N
21	37	journey_created	New Journey created successfully	110.39.137.35	Ktor client	App\\Models\\Journey	72	2025-06-09 11:55:48	2025-06-09 11:55:48	\N
22	37	journey_created	New Journey created successfully	110.39.137.35	Ktor client	App\\Models\\Journey	73	2025-06-09 11:59:41	2025-06-09 11:59:41	\N
23	51	journey_created	New Journey created successfully	106.76.183.167	Ktor client	App\\Models\\Journey	74	2025-06-10 07:34:10	2025-06-10 07:34:10	\N
24	37	follow_request_sent	Followed test dev two	39.43.147.80	Ktor client	App\\Models\\Follow	1	2025-06-11 06:20:05	2025-06-11 06:20:05	\N
25	47	follow_request_received	Follow request from Dev Test	39.43.147.80	Ktor client	App\\Models\\Follow	1	2025-06-11 06:20:05	2025-06-11 06:20:05	\N
26	46	follow_request_sent	Followed test dev two	39.43.147.80	Ktor client	App\\Models\\Follow	2	2025-06-11 06:38:41	2025-06-11 06:38:41	\N
27	47	follow_request_received	Follow request from dev three test	39.43.147.80	Ktor client	App\\Models\\Follow	2	2025-06-11 06:38:41	2025-06-11 06:38:41	\N
28	46	follow_request_accepted	followed request accepted by test dev two	39.58.125.27	PostmanRuntime/7.44.0	App\\Models\\Follow	2	2025-06-11 07:43:18	2025-06-11 07:43:18	\N
29	37	follow_request_accepted	followed request accepted by test dev two	39.58.125.27	Ktor client	App\\Models\\Follow	1	2025-06-11 07:51:48	2025-06-11 07:51:48	\N
30	37	follow_request_sent	Followed testdev four	39.58.125.27	Ktor client	App\\Models\\Follow	3	2025-06-11 07:58:08	2025-06-11 07:58:08	\N
31	52	follow_request_received	Follow request from Dev Test	39.58.125.27	Ktor client	App\\Models\\Follow	3	2025-06-11 07:58:08	2025-06-11 07:58:08	\N
32	47	follow_request_sent	Followed testdev four	39.58.125.27	Ktor client	App\\Models\\Follow	4	2025-06-11 07:58:38	2025-06-11 07:58:38	\N
33	52	follow_request_received	Follow request from test dev two	39.58.125.27	Ktor client	App\\Models\\Follow	4	2025-06-11 07:58:39	2025-06-11 07:58:39	\N
34	37	follow_request_accepted	followed request accepted by testdev four	39.58.125.27	Ktor client	App\\Models\\Follow	3	2025-06-11 07:59:26	2025-06-11 07:59:26	\N
35	47	follow_request_accepted	followed request accepted by testdev four	39.58.125.27	Ktor client	App\\Models\\Follow	4	2025-06-11 08:13:00	2025-06-11 08:13:00	\N
36	46	follow_request_sent	Followed testdev four	39.58.125.27	Ktor client	App\\Models\\Follow	5	2025-06-11 08:16:41	2025-06-11 08:16:41	\N
37	52	follow_request_received	Follow request from dev three test	39.58.125.27	Ktor client	App\\Models\\Follow	5	2025-06-11 08:16:41	2025-06-11 08:16:41	\N
38	46	unfollow	Unfollowed test dev two	39.58.125.27	Ktor client	App\\Models\\Follow	2	2025-06-11 09:52:55	2025-06-11 09:52:55	\N
39	52	follow_request_sent	Followed test dev two	39.58.125.27	Ktor client	App\\Models\\Follow	6	2025-06-11 10:21:06	2025-06-11 10:21:06	\N
40	47	follow_request_received	Follow request from testdevf four	39.58.125.27	Ktor client	App\\Models\\Follow	6	2025-06-11 10:21:06	2025-06-11 10:21:06	\N
41	52	follow_request_sent	Followed Dev Test	39.58.125.27	Ktor client	App\\Models\\Follow	7	2025-06-11 13:21:46	2025-06-11 13:21:46	\N
42	37	follow_request_received	Follow request from testdevf four	39.58.125.27	Ktor client	App\\Models\\Follow	7	2025-06-11 13:21:46	2025-06-11 13:21:46	\N
43	37	journey_created	New Journey created successfully	39.58.125.27	Ktor client	App\\Models\\Journey	75	2025-06-11 13:39:13	2025-06-11 13:39:13	\N
44	37	journey_created	New Journey created successfully	39.58.125.27	Ktor client	App\\Models\\Journey	76	2025-06-11 13:43:20	2025-06-11 13:43:20	\N
45	52	follow_request_accepted	followed request accepted by Dev Test	39.58.125.27	Ktor client	App\\Models\\Follow	7	2025-06-11 13:48:08	2025-06-11 13:48:08	\N
46	54	follow_request_sent	Followed sooraj sabu	106.76.190.61	Ktor client	App\\Models\\Follow	8	2025-06-12 03:55:45	2025-06-12 03:55:45	\N
47	53	follow_request_received	Follow request from anil navis	106.76.190.61	Ktor client	App\\Models\\Follow	8	2025-06-12 03:55:45	2025-06-12 03:55:45	\N
48	54	follow_request_sent	Followed anil nabis	106.76.190.61	Ktor client	App\\Models\\Follow	9	2025-06-12 03:56:11	2025-06-12 03:56:11	\N
49	51	follow_request_received	Follow request from anil navis	106.76.190.61	Ktor client	App\\Models\\Follow	9	2025-06-12 03:56:11	2025-06-12 03:56:11	\N
50	54	follow_request_sent	Followed dev three test	106.76.190.61	Ktor client	App\\Models\\Follow	10	2025-06-12 03:56:20	2025-06-12 03:56:20	\N
51	46	follow_request_received	Follow request from anil navis	106.76.190.61	Ktor client	App\\Models\\Follow	10	2025-06-12 03:56:20	2025-06-12 03:56:20	\N
52	55	follow_request_sent	Followed Sabeeh Shah k	223.123.22.230	Ktor client	App\\Models\\Follow	11	2025-06-12 03:57:30	2025-06-12 03:57:30	\N
53	17	follow_request_received	Follow request from Hamid Raza	223.123.22.230	Ktor client	App\\Models\\Follow	11	2025-06-12 03:57:30	2025-06-12 03:57:30	\N
54	55	follow_request_sent	Followed Usama Shakeel	223.123.22.230	Ktor client	App\\Models\\Follow	12	2025-06-12 03:57:34	2025-06-12 03:57:34	\N
55	18	follow_request_received	Follow request from Hamid Raza	223.123.22.230	Ktor client	App\\Models\\Follow	12	2025-06-12 03:57:34	2025-06-12 03:57:34	\N
56	37	unfollow	Unfollowed testdevf four	39.58.141.53	Ktor client	App\\Models\\Follow	3	2025-06-12 06:06:03	2025-06-12 06:06:03	\N
57	37	post_like	You Liked Dev Test Post	39.58.141.53	PostmanRuntime/7.44.0	App\\Models\\PostLike	4	2025-06-12 06:17:39	2025-06-12 06:17:39	\N
58	37	post_like	Dev Test Liked your post	39.58.141.53	PostmanRuntime/7.44.0	App\\Models\\PostLike	4	2025-06-12 06:17:39	2025-06-12 06:17:39	\N
59	52	follow_request_rejected	followed request rejected by Dev Test	39.58.141.53	Ktor client	App\\Models\\Follow	7	2025-06-12 06:44:21	2025-06-12 06:44:21	\N
60	56	follow_request_sent	Followed Hamid Raza	212.8.248.254	Ktor client	App\\Models\\Follow	13	2025-06-13 13:23:23	2025-06-13 13:23:23	\N
61	55	follow_request_received	Follow request from Hamid Raza	212.8.248.254	Ktor client	App\\Models\\Follow	13	2025-06-13 13:23:23	2025-06-13 13:23:23	\N
62	56	follow_request_sent	Followed Asad nazir	212.8.248.254	Ktor client	App\\Models\\Follow	14	2025-06-13 13:50:54	2025-06-13 13:50:54	\N
63	21	follow_request_received	Follow request from Hamid Raza	212.8.248.254	Ktor client	App\\Models\\Follow	14	2025-06-13 13:50:54	2025-06-13 13:50:54	\N
64	56	follow_request_accepted	followed request accepted by Hamid Raza	223.123.4.164	Ktor client	App\\Models\\Follow	13	2025-06-16 16:28:04	2025-06-16 16:28:04	\N
65	55	follow_request_sent	Followed Hamid Raza	223.123.4.164	Ktor client	App\\Models\\Follow	15	2025-06-16 16:28:20	2025-06-16 16:28:20	\N
66	56	follow_request_received	Follow request from Hamid Raza	223.123.4.164	Ktor client	App\\Models\\Follow	15	2025-06-16 16:28:20	2025-06-16 16:28:20	\N
67	55	journey_created	New Journey created successfully	223.123.4.164	Ktor client	App\\Models\\Journey	77	2025-06-16 16:33:55	2025-06-16 16:33:55	\N
68	55	journey_created	New Journey created successfully	223.123.4.164	Ktor client	App\\Models\\Journey	78	2025-06-16 16:35:21	2025-06-16 16:35:21	\N
69	55	journey_created	New Journey created successfully	223.123.4.164	Ktor client	App\\Models\\Journey	79	2025-06-16 16:39:22	2025-06-16 16:39:22	\N
70	55	journey_created	New Journey created successfully	223.123.4.164	Ktor client	App\\Models\\Journey	80	2025-06-16 16:49:56	2025-06-16 16:49:56	\N
71	57	post_like	You Liked Ajmala Ajm Post	154.198.88.96	PostmanRuntime/7.44.0	App\\Models\\PostLike	5	2025-06-17 08:53:58	2025-06-17 08:53:58	\N
72	29	post_like	Usama Shakeel Liked your post	154.198.88.96	PostmanRuntime/7.44.0	App\\Models\\PostLike	5	2025-06-17 08:53:58	2025-06-17 08:53:58	\N
73	57	post_like	You Liked Usama Shakeel Post	154.198.88.96	Ktor client	App\\Models\\PostLike	6	2025-06-17 10:31:48	2025-06-17 10:31:48	\N
74	57	post_like	Usama Shakeel Liked your post	154.198.88.96	Ktor client	App\\Models\\PostLike	6	2025-06-17 10:31:48	2025-06-17 10:31:48	\N
75	57	post_like	You Liked Usama Shakeel Post	154.198.88.96	Ktor client	App\\Models\\PostLike	7	2025-06-17 10:33:13	2025-06-17 10:33:13	\N
76	57	post_like	Usama Shakeel Liked your post	154.198.88.96	Ktor client	App\\Models\\PostLike	7	2025-06-17 10:33:13	2025-06-17 10:33:13	\N
77	57	post_like	You Liked Usama Shakeel Post	154.198.88.96	Ktor client	App\\Models\\PostLike	8	2025-06-17 10:33:19	2025-06-17 10:33:19	\N
78	57	post_like	Usama Shakeel Liked your post	154.198.88.96	Ktor client	App\\Models\\PostLike	8	2025-06-17 10:33:19	2025-06-17 10:33:19	\N
79	57	post_like	You Liked Usama Shakeel Post	154.198.88.96	Ktor client	App\\Models\\PostLike	9	2025-06-17 10:39:34	2025-06-17 10:39:34	\N
80	57	post_like	Usama Shakeel Liked your post	154.198.88.96	Ktor client	App\\Models\\PostLike	9	2025-06-17 10:39:34	2025-06-17 10:39:34	\N
81	57	post_like	You Liked Usama Shakeel Post	154.198.88.96	Ktor client	App\\Models\\PostLike	10	2025-06-17 10:39:38	2025-06-17 10:39:38	\N
82	57	post_like	Usama Shakeel Liked your post	154.198.88.96	Ktor client	App\\Models\\PostLike	10	2025-06-17 10:39:38	2025-06-17 10:39:38	\N
83	57	post_like	You Liked sooraj sabu Post	154.198.88.96	Ktor client	App\\Models\\PostLike	11	2025-06-17 10:39:47	2025-06-17 10:39:47	\N
84	38	post_like	Usama Shakeel Liked your post	154.198.88.96	Ktor client	App\\Models\\PostLike	11	2025-06-17 10:39:47	2025-06-17 10:39:47	\N
85	57	post_like	You Liked sooraj sabu Post	154.198.88.96	Ktor client	App\\Models\\PostLike	12	2025-06-17 10:40:38	2025-06-17 10:40:38	\N
86	38	post_like	Usama Shakeel Liked your post	154.198.88.96	Ktor client	App\\Models\\PostLike	12	2025-06-17 10:40:38	2025-06-17 10:40:38	\N
87	57	post_like	You Liked Usama Shakeel Post	154.198.88.96	Ktor client	App\\Models\\PostLike	13	2025-06-17 12:25:29	2025-06-17 12:25:29	\N
88	57	post_like	Usama Shakeel Liked your post	154.198.88.96	Ktor client	App\\Models\\PostLike	13	2025-06-17 12:25:29	2025-06-17 12:25:29	\N
89	57	post_like	You Liked Usama Shakeel Post	154.81.226.213	Ktor client	App\\Models\\PostLike	14	2025-06-17 12:59:57	2025-06-17 12:59:57	\N
90	57	post_like	Usama Shakeel Liked your post	154.81.226.213	Ktor client	App\\Models\\PostLike	14	2025-06-17 12:59:57	2025-06-17 12:59:57	\N
91	57	post_like	You Liked Usama Shakeel Post	154.81.226.213	Ktor client	App\\Models\\PostLike	15	2025-06-17 12:59:59	2025-06-17 12:59:59	\N
92	57	post_like	Usama Shakeel Liked your post	154.81.226.213	Ktor client	App\\Models\\PostLike	15	2025-06-17 12:59:59	2025-06-17 12:59:59	\N
93	57	post_like	You Liked Usama Shakeel Post	154.198.88.96	Ktor client	App\\Models\\PostLike	16	2025-06-17 15:44:51	2025-06-17 15:44:51	\N
94	57	post_like	Usama Shakeel Liked your post	154.198.88.96	Ktor client	App\\Models\\PostLike	16	2025-06-17 15:44:51	2025-06-17 15:44:51	\N
95	57	post_like	You Liked Usama Shakeel Post	154.198.88.96	Ktor client	App\\Models\\PostLike	17	2025-06-17 15:44:54	2025-06-17 15:44:54	\N
96	57	post_like	Usama Shakeel Liked your post	154.198.88.96	Ktor client	App\\Models\\PostLike	17	2025-06-17 15:44:54	2025-06-17 15:44:54	\N
97	57	post_like	You Liked Usama Shakeel Post	182.183.59.84	Ktor client	App\\Models\\PostLike	18	2025-06-17 19:05:21	2025-06-17 19:05:21	\N
98	57	post_like	Usama Shakeel Liked your post	182.183.59.84	Ktor client	App\\Models\\PostLike	18	2025-06-17 19:05:21	2025-06-17 19:05:21	\N
99	57	post_like	You Liked Usama Shakeel Post	182.183.59.84	Ktor client	App\\Models\\PostLike	19	2025-06-17 19:05:30	2025-06-17 19:05:30	\N
100	57	post_like	Usama Shakeel Liked your post	182.183.59.84	Ktor client	App\\Models\\PostLike	19	2025-06-17 19:05:30	2025-06-17 19:05:30	\N
101	57	post_like	You Liked Usama Shakeel Post	182.183.59.84	Ktor client	App\\Models\\PostLike	20	2025-06-17 19:05:45	2025-06-17 19:05:45	\N
102	57	post_like	Usama Shakeel Liked your post	182.183.59.84	Ktor client	App\\Models\\PostLike	20	2025-06-17 19:05:45	2025-06-17 19:05:45	\N
103	38	post_like	You Liked Dev Test Post	117.202.123.196	PostmanRuntime/7.44.0	App\\Models\\PostLike	21	2025-06-18 04:02:41	2025-06-18 04:02:41	\N
104	37	post_like	sooraj sabu Liked your post	117.202.123.196	PostmanRuntime/7.44.0	App\\Models\\PostLike	21	2025-06-18 04:02:41	2025-06-18 04:02:41	\N
105	38	post_like	You Liked Dev Test Post	117.202.123.196	PostmanRuntime/7.44.0	App\\Models\\PostLike	22	2025-06-18 04:02:57	2025-06-18 04:02:57	\N
106	37	post_like	sooraj sabu Liked your post	117.202.123.196	PostmanRuntime/7.44.0	App\\Models\\PostLike	22	2025-06-18 04:02:57	2025-06-18 04:02:57	\N
107	38	post_like	You Liked Usama Shakeel Post	117.202.123.196	PostmanRuntime/7.44.0	App\\Models\\PostLike	23	2025-06-18 04:03:34	2025-06-18 04:03:34	\N
108	57	post_like	sooraj sabu Liked your post	117.202.123.196	PostmanRuntime/7.44.0	App\\Models\\PostLike	23	2025-06-18 04:03:34	2025-06-18 04:03:34	\N
109	57	post_like	You Liked Usama Shakeel Post	182.183.59.84	Ktor client	App\\Models\\PostLike	24	2025-06-18 05:45:10	2025-06-18 05:45:10	\N
110	57	post_like	Usama Shakeel Liked your post	182.183.59.84	Ktor client	App\\Models\\PostLike	24	2025-06-18 05:45:10	2025-06-18 05:45:10	\N
111	57	post_like	You Liked Usama Shakeel Post	182.183.59.84	Ktor client	App\\Models\\PostLike	25	2025-06-18 05:45:11	2025-06-18 05:45:11	\N
112	57	post_like	Usama Shakeel Liked your post	182.183.59.84	Ktor client	App\\Models\\PostLike	25	2025-06-18 05:45:11	2025-06-18 05:45:11	\N
113	57	post_like	You Liked Usama Shakeel Post	182.183.59.84	Ktor client	App\\Models\\PostLike	26	2025-06-18 05:45:16	2025-06-18 05:45:16	\N
114	57	post_like	Usama Shakeel Liked your post	182.183.59.84	Ktor client	App\\Models\\PostLike	26	2025-06-18 05:45:16	2025-06-18 05:45:16	\N
115	55	follow_request_sent	Followed Usama Shakeel	223.123.12.130	Ktor client	App\\Models\\Follow	16	2025-06-18 05:46:17	2025-06-18 05:46:17	\N
116	57	follow_request_received	Follow request from Hamid Raza	223.123.12.130	Ktor client	App\\Models\\Follow	16	2025-06-18 05:46:17	2025-06-18 05:46:17	\N
117	57	post_like	You Liked Usama Shakeel Post	182.183.59.84	Ktor client	App\\Models\\PostLike	27	2025-06-18 06:32:59	2025-06-18 06:32:59	\N
118	57	post_like	Usama Shakeel Liked your post	182.183.59.84	Ktor client	App\\Models\\PostLike	27	2025-06-18 06:32:59	2025-06-18 06:32:59	\N
119	57	post_report	You Reported Usama Shakeel Post	182.183.59.84	Ktor client	App\\Models\\PostReports	1	2025-06-18 07:02:43	2025-06-18 07:02:43	\N
120	55	follow_request_sent	Followed testdevf four	223.123.12.130	Ktor client	App\\Models\\Follow	17	2025-06-18 07:36:21	2025-06-18 07:36:21	\N
121	52	follow_request_received	Follow request from Hamid Raza	223.123.12.130	Ktor client	App\\Models\\Follow	17	2025-06-18 07:36:21	2025-06-18 07:36:21	\N
122	56	unfollow	Unfollowed Hamid Raza	223.123.12.130	Ktor client	App\\Models\\Follow	13	2025-06-18 11:01:17	2025-06-18 11:01:17	\N
123	57	follow_request_sent	Followed Dev Test	182.183.57.227	PostmanRuntime/7.44.0	App\\Models\\Follow	18	2025-06-18 12:14:47	2025-06-18 12:14:47	\N
124	37	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	PostmanRuntime/7.44.0	App\\Models\\Follow	18	2025-06-18 12:14:47	2025-06-18 12:14:47	\N
125	57	post_like	You Liked Dev Test Post	182.183.57.227	Ktor client	App\\Models\\PostLike	28	2025-06-18 12:16:18	2025-06-18 12:16:18	\N
126	37	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	28	2025-06-18 12:16:18	2025-06-18 12:16:18	\N
127	57	post_like	You Liked Dev Test Post	182.183.57.227	Ktor client	App\\Models\\PostLike	29	2025-06-18 12:32:04	2025-06-18 12:32:04	\N
128	37	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	29	2025-06-18 12:32:04	2025-06-18 12:32:04	\N
129	59	follow_request_sent	Followed sooraj sabu	182.183.57.227	PostmanRuntime/7.44.0	App\\Models\\Follow	19	2025-06-18 13:35:28	2025-06-18 13:35:28	\N
130	38	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	PostmanRuntime/7.44.0	App\\Models\\Follow	19	2025-06-18 13:35:28	2025-06-18 13:35:28	\N
131	59	follow_request_sent	Followed Usama Shakeel	182.183.57.227	PostmanRuntime/7.44.0	App\\Models\\Follow	20	2025-06-18 13:39:13	2025-06-18 13:39:13	\N
132	57	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	PostmanRuntime/7.44.0	App\\Models\\Follow	20	2025-06-18 13:39:13	2025-06-18 13:39:13	\N
133	59	follow_request_accepted	followed request accepted by Usama Shakeel	182.183.57.227	PostmanRuntime/7.44.0	App\\Models\\Follow	20	2025-06-18 13:39:20	2025-06-18 13:39:20	\N
134	59	follow_request_rejected	followed request rejected by Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	20	2025-06-18 14:09:47	2025-06-18 14:09:47	\N
135	57	unfollow	Unfollowed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	18	2025-06-18 19:01:28	2025-06-18 19:01:28	\N
136	57	follow_request_sent	Followed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	21	2025-06-18 19:01:30	2025-06-18 19:01:30	\N
137	37	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	21	2025-06-18 19:01:30	2025-06-18 19:01:30	\N
138	57	unfollow	Unfollowed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	21	2025-06-18 19:01:33	2025-06-18 19:01:33	\N
139	57	follow_request_sent	Followed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	22	2025-06-18 19:01:38	2025-06-18 19:01:38	\N
140	37	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	22	2025-06-18 19:01:38	2025-06-18 19:01:38	\N
141	57	unfollow	Unfollowed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	22	2025-06-18 19:01:40	2025-06-18 19:01:40	\N
142	57	follow_request_sent	Followed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	23	2025-06-18 19:01:56	2025-06-18 19:01:56	\N
143	37	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	23	2025-06-18 19:01:56	2025-06-18 19:01:56	\N
144	57	unfollow	Unfollowed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	23	2025-06-18 19:03:00	2025-06-18 19:03:00	\N
145	57	follow_request_sent	Followed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	24	2025-06-18 19:04:26	2025-06-18 19:04:26	\N
146	37	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	24	2025-06-18 19:04:26	2025-06-18 19:04:26	\N
147	57	unfollow	Unfollowed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	24	2025-06-18 19:06:00	2025-06-18 19:06:00	\N
148	57	follow_request_sent	Followed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	25	2025-06-18 19:06:05	2025-06-18 19:06:05	\N
149	37	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	25	2025-06-18 19:06:05	2025-06-18 19:06:05	\N
150	57	unfollow	Unfollowed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	25	2025-06-18 19:06:10	2025-06-18 19:06:10	\N
151	57	follow_request_sent	Followed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	26	2025-06-18 19:06:14	2025-06-18 19:06:14	\N
152	37	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	26	2025-06-18 19:06:14	2025-06-18 19:06:14	\N
153	57	unfollow	Unfollowed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	26	2025-06-18 19:06:39	2025-06-18 19:06:39	\N
154	57	follow_request_sent	Followed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	27	2025-06-18 19:06:41	2025-06-18 19:06:41	\N
155	37	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	27	2025-06-18 19:06:41	2025-06-18 19:06:41	\N
156	57	unfollow	Unfollowed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	27	2025-06-18 19:07:07	2025-06-18 19:07:07	\N
157	57	follow_request_sent	Followed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	28	2025-06-18 19:07:09	2025-06-18 19:07:09	\N
158	37	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	28	2025-06-18 19:07:09	2025-06-18 19:07:09	\N
159	57	post_like	You Liked Dev Test Post	182.183.57.227	Ktor client	App\\Models\\PostLike	30	2025-06-18 19:10:09	2025-06-18 19:10:09	\N
160	37	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	30	2025-06-18 19:10:09	2025-06-18 19:10:09	\N
161	57	post_like	You Liked Dev Test Post	182.183.57.227	Ktor client	App\\Models\\PostLike	31	2025-06-18 19:10:10	2025-06-18 19:10:10	\N
162	37	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	31	2025-06-18 19:10:10	2025-06-18 19:10:10	\N
163	57	post_like	You Liked Dev Test Post	182.183.57.227	Ktor client	App\\Models\\PostLike	32	2025-06-18 19:10:10	2025-06-18 19:10:10	\N
164	37	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	32	2025-06-18 19:10:10	2025-06-18 19:10:10	\N
165	57	unfollow	Unfollowed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	28	2025-06-18 19:10:11	2025-06-18 19:10:11	\N
166	57	follow_request_sent	Followed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	29	2025-06-18 19:10:13	2025-06-18 19:10:13	\N
167	37	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	29	2025-06-18 19:10:13	2025-06-18 19:10:13	\N
168	57	unfollow	Unfollowed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	29	2025-06-18 19:26:45	2025-06-18 19:26:45	\N
169	57	follow_request_sent	Followed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	30	2025-06-18 19:26:47	2025-06-18 19:26:47	\N
170	37	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	30	2025-06-18 19:26:47	2025-06-18 19:26:47	\N
171	57	unfollow	Unfollowed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	30	2025-06-18 19:33:56	2025-06-18 19:33:56	\N
172	57	follow_request_sent	Followed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	31	2025-06-18 19:33:58	2025-06-18 19:33:58	\N
173	37	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	31	2025-06-18 19:33:58	2025-06-18 19:33:58	\N
174	57	unfollow	Unfollowed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	31	2025-06-18 19:33:59	2025-06-18 19:33:59	\N
175	57	follow_request_sent	Followed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	32	2025-06-18 19:42:54	2025-06-18 19:42:54	\N
176	37	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	32	2025-06-18 19:42:54	2025-06-18 19:42:54	\N
177	57	post_report	You Reported Dev Test Post	182.183.57.227	Ktor client	App\\Models\\PostReports	2	2025-06-18 19:43:01	2025-06-18 19:43:01	\N
178	59	follow_request_sent	Followed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	33	2025-06-18 20:02:02	2025-06-18 20:02:02	\N
179	37	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	33	2025-06-18 20:02:02	2025-06-18 20:02:02	\N
180	59	unfollow	Unfollowed Dev Test	182.183.57.227	Ktor client	App\\Models\\Follow	33	2025-06-18 20:02:03	2025-06-18 20:02:03	\N
181	38	post_like	You Liked sooraj sabu Post	117.254.8.116	Ktor client	App\\Models\\PostLike	33	2025-06-19 02:32:20	2025-06-19 02:32:20	\N
182	38	post_like	sooraj sabu Liked your post	117.254.8.116	Ktor client	App\\Models\\PostLike	33	2025-06-19 02:32:20	2025-06-19 02:32:20	\N
183	38	follow_request_sent	Followed Usama Shakeel	117.254.8.116	Ktor client	App\\Models\\Follow	34	2025-06-19 02:39:45	2025-06-19 02:39:45	\N
184	59	follow_request_received	Follow request from sooraj sabu	117.254.8.116	Ktor client	App\\Models\\Follow	34	2025-06-19 02:39:45	2025-06-19 02:39:45	\N
185	38	follow_request_sent	Followed Hamid Raza	117.254.8.116	Ktor client	App\\Models\\Follow	35	2025-06-19 02:39:51	2025-06-19 02:39:51	\N
186	56	follow_request_received	Follow request from sooraj sabu	117.254.8.116	Ktor client	App\\Models\\Follow	35	2025-06-19 02:39:51	2025-06-19 02:39:51	\N
187	59	follow_request_accepted	followed request accepted by sooraj sabu	117.254.8.116	Ktor client	App\\Models\\Follow	19	2025-06-19 02:40:04	2025-06-19 02:40:04	\N
188	38	post_like	You Liked sooraj sabu Post	117.254.8.116	Ktor client	App\\Models\\PostLike	34	2025-06-19 02:41:55	2025-06-19 02:41:55	\N
189	38	post_like	sooraj sabu Liked your post	117.254.8.116	Ktor client	App\\Models\\PostLike	34	2025-06-19 02:41:55	2025-06-19 02:41:55	\N
190	60	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	35	2025-06-19 06:19:52	2025-06-19 06:19:52	\N
191	57	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	35	2025-06-19 06:19:52	2025-06-19 06:19:52	\N
192	60	post_like	You Liked sooraj sabu Post	182.183.57.227	Ktor client	App\\Models\\PostLike	36	2025-06-19 06:20:22	2025-06-19 06:20:22	\N
193	38	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	36	2025-06-19 06:20:22	2025-06-19 06:20:22	\N
194	55	follow_request_sent	Followed Usama Shakeel	223.123.22.68	Ktor client	App\\Models\\Follow	36	2025-06-19 06:35:18	2025-06-19 06:35:18	\N
195	60	follow_request_received	Follow request from Hamid Raza	223.123.22.68	Ktor client	App\\Models\\Follow	36	2025-06-19 06:35:18	2025-06-19 06:35:18	\N
196	55	follow_request_sent	Followed Ameera Raza	223.123.22.68	Ktor client	App\\Models\\Follow	37	2025-06-19 06:35:22	2025-06-19 06:35:22	\N
197	58	follow_request_received	Follow request from Hamid Raza	223.123.22.68	Ktor client	App\\Models\\Follow	37	2025-06-19 06:35:22	2025-06-19 06:35:22	\N
198	55	follow_request_sent	Followed anil navis	223.123.22.68	Ktor client	App\\Models\\Follow	38	2025-06-19 06:35:26	2025-06-19 06:35:26	\N
199	54	follow_request_received	Follow request from Hamid Raza	223.123.22.68	Ktor client	App\\Models\\Follow	38	2025-06-19 06:35:26	2025-06-19 06:35:26	\N
200	55	follow_request_sent	Followed anil nabis	223.123.22.68	Ktor client	App\\Models\\Follow	39	2025-06-19 06:35:30	2025-06-19 06:35:30	\N
201	51	follow_request_received	Follow request from Hamid Raza	223.123.22.68	Ktor client	App\\Models\\Follow	39	2025-06-19 06:35:30	2025-06-19 06:35:30	\N
202	55	follow_request_sent	Followed akio nahis	223.123.22.68	Ktor client	App\\Models\\Follow	40	2025-06-19 06:35:32	2025-06-19 06:35:32	\N
203	49	follow_request_received	Follow request from Hamid Raza	223.123.22.68	Ktor client	App\\Models\\Follow	40	2025-06-19 06:35:32	2025-06-19 06:35:32	\N
204	55	follow_request_sent	Followed Anil navis	223.123.22.68	Ktor client	App\\Models\\Follow	41	2025-06-19 06:35:35	2025-06-19 06:35:35	\N
205	48	follow_request_received	Follow request from Hamid Raza	223.123.22.68	Ktor client	App\\Models\\Follow	41	2025-06-19 06:35:35	2025-06-19 06:35:35	\N
206	55	follow_request_sent	Followed test dev two	223.123.22.68	Ktor client	App\\Models\\Follow	42	2025-06-19 06:35:37	2025-06-19 06:35:37	\N
207	47	follow_request_received	Follow request from Hamid Raza	223.123.22.68	Ktor client	App\\Models\\Follow	42	2025-06-19 06:35:37	2025-06-19 06:35:37	\N
208	55	follow_request_sent	Followed dev three test	223.123.22.68	Ktor client	App\\Models\\Follow	43	2025-06-19 06:35:39	2025-06-19 06:35:39	\N
209	46	follow_request_received	Follow request from Hamid Raza	223.123.22.68	Ktor client	App\\Models\\Follow	43	2025-06-19 06:35:39	2025-06-19 06:35:39	\N
210	61	follow_request_sent	Followed Hamid Raza	49.37.227.13	Ktor client	App\\Models\\Follow	44	2025-06-19 08:55:37	2025-06-19 08:55:37	\N
211	55	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	44	2025-06-19 08:55:38	2025-06-19 08:55:38	\N
212	61	follow_request_sent	Followed sooraj sabu	49.37.227.13	Ktor client	App\\Models\\Follow	45	2025-06-19 08:59:01	2025-06-19 08:59:01	\N
213	38	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	45	2025-06-19 08:59:01	2025-06-19 08:59:01	\N
214	61	unfollow	Unfollowed sooraj sabu	49.37.227.13	Ktor client	App\\Models\\Follow	45	2025-06-19 08:59:10	2025-06-19 08:59:10	\N
215	61	follow_request_sent	Followed sooraj sabu	49.37.227.13	Ktor client	App\\Models\\Follow	46	2025-06-19 08:59:11	2025-06-19 08:59:11	\N
216	38	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	46	2025-06-19 08:59:11	2025-06-19 08:59:11	\N
217	61	unfollow	Unfollowed sooraj sabu	49.37.227.13	Ktor client	App\\Models\\Follow	46	2025-06-19 08:59:11	2025-06-19 08:59:11	\N
218	61	follow_request_sent	Followed sooraj sabu	49.37.227.13	Ktor client	App\\Models\\Follow	47	2025-06-19 08:59:13	2025-06-19 08:59:13	\N
219	38	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	47	2025-06-19 08:59:13	2025-06-19 08:59:13	\N
220	61	unfollow	Unfollowed sooraj sabu	49.37.227.13	Ktor client	App\\Models\\Follow	47	2025-06-19 08:59:14	2025-06-19 08:59:14	\N
221	61	follow_request_accepted	followed request accepted by Hamid Raza	223.123.22.68	Ktor client	App\\Models\\Follow	44	2025-06-19 09:04:10	2025-06-19 09:04:10	\N
222	61	follow_request_sent	Followed Hamid Raza	49.37.227.13	Ktor client	App\\Models\\Follow	48	2025-06-19 09:07:26	2025-06-19 09:07:26	\N
223	56	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	48	2025-06-19 09:07:26	2025-06-19 09:07:26	\N
224	61	follow_request_sent	Followed sooraj sabu	49.37.227.13	Ktor client	App\\Models\\Follow	49	2025-06-19 09:07:35	2025-06-19 09:07:35	\N
225	53	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	49	2025-06-19 09:07:35	2025-06-19 09:07:35	\N
226	61	follow_request_sent	Followed Usama Shakeel	49.37.227.13	Ktor client	App\\Models\\Follow	50	2025-06-19 09:07:56	2025-06-19 09:07:56	\N
227	57	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	50	2025-06-19 09:07:56	2025-06-19 09:07:56	\N
228	61	unfollow	Unfollowed Usama Shakeel	49.37.227.13	Ktor client	App\\Models\\Follow	50	2025-06-19 09:07:57	2025-06-19 09:07:57	\N
229	61	post_like	You Liked Usama Shakeel Post	49.37.227.13	Ktor client	App\\Models\\PostLike	37	2025-06-19 09:08:11	2025-06-19 09:08:11	\N
230	57	post_like	anil nahis Liked your post	49.37.227.13	Ktor client	App\\Models\\PostLike	37	2025-06-19 09:08:11	2025-06-19 09:08:11	\N
231	61	post_like	You Liked Usama Shakeel Post	49.37.227.13	Ktor client	App\\Models\\PostLike	38	2025-06-19 09:08:13	2025-06-19 09:08:13	\N
232	57	post_like	anil nahis Liked your post	49.37.227.13	Ktor client	App\\Models\\PostLike	38	2025-06-19 09:08:13	2025-06-19 09:08:13	\N
233	61	follow_request_rejected	followed request rejected by Hamid Raza	223.123.22.68	Ktor client	App\\Models\\Follow	44	2025-06-19 09:12:58	2025-06-19 09:12:58	\N
234	61	follow_request_sent	Followed Usama Shakeel	49.37.227.13	Ktor client	App\\Models\\Follow	51	2025-06-19 11:03:40	2025-06-19 11:03:40	\N
235	57	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	51	2025-06-19 11:03:40	2025-06-19 11:03:40	\N
236	61	unfollow	Unfollowed Usama Shakeel	49.37.227.13	Ktor client	App\\Models\\Follow	51	2025-06-19 11:03:42	2025-06-19 11:03:42	\N
237	61	follow_request_sent	Followed Usama Shakeel	49.37.227.13	Ktor client	App\\Models\\Follow	52	2025-06-19 11:03:43	2025-06-19 11:03:43	\N
238	57	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	52	2025-06-19 11:03:43	2025-06-19 11:03:43	\N
239	61	unfollow	Unfollowed Usama Shakeel	49.37.227.13	Ktor client	App\\Models\\Follow	52	2025-06-19 11:03:44	2025-06-19 11:03:44	\N
240	62	post_like	You Liked sooraj sabu Post	86.98.14.154	Ktor client	App\\Models\\PostLike	39	2025-06-19 12:06:06	2025-06-19 12:06:06	\N
241	38	post_like	Ayesha Tariq Liked your post	86.98.14.154	Ktor client	App\\Models\\PostLike	39	2025-06-19 12:06:06	2025-06-19 12:06:06	\N
242	62	follow_request_sent	Followed Leena Meetha	86.98.14.154	Ktor client	App\\Models\\Follow	53	2025-06-19 12:18:38	2025-06-19 12:18:38	\N
243	63	follow_request_received	Follow request from Ayesha Tariq	86.98.14.154	Ktor client	App\\Models\\Follow	53	2025-06-19 12:18:38	2025-06-19 12:18:38	\N
244	62	journey_created	New Journey created successfully	86.98.14.154	Ktor client	App\\Models\\Journey	81	2025-06-19 12:22:58	2025-06-19 12:22:58	\N
245	59	follow_request_sent	Followed Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	54	2025-06-19 12:27:42	2025-06-19 12:27:42	\N
246	60	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	54	2025-06-19 12:27:42	2025-06-19 12:27:42	\N
247	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	40	2025-06-19 12:27:51	2025-06-19 12:27:51	\N
248	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	40	2025-06-19 12:27:51	2025-06-19 12:27:51	\N
249	63	follow_request_sent	Followed anil nahis	86.98.14.154	Ktor client	App\\Models\\Follow	55	2025-06-19 12:49:24	2025-06-19 12:49:24	\N
250	61	follow_request_received	Follow request from Leena Meetha	86.98.14.154	Ktor client	App\\Models\\Follow	55	2025-06-19 12:49:24	2025-06-19 12:49:24	\N
251	63	unfollow	Unfollowed anil nahis	86.98.14.154	Ktor client	App\\Models\\Follow	55	2025-06-19 12:49:25	2025-06-19 12:49:25	\N
252	62	post_like	You Liked Leena Meetha Post	86.98.14.154	Ktor client	App\\Models\\PostLike	41	2025-06-19 12:54:38	2025-06-19 12:54:38	\N
253	63	post_like	Ayesha Tariq Liked your post	86.98.14.154	Ktor client	App\\Models\\PostLike	41	2025-06-19 12:54:38	2025-06-19 12:54:38	\N
254	63	post_like	You Liked Leena Meetha Post	86.98.14.154	Ktor client	App\\Models\\PostLike	42	2025-06-19 13:00:20	2025-06-19 13:00:20	\N
255	63	post_like	Leena Meetha Liked your post	86.98.14.154	Ktor client	App\\Models\\PostLike	42	2025-06-19 13:00:20	2025-06-19 13:00:20	\N
256	63	post_like	You Liked Leena Meetha Post	86.98.14.154	Ktor client	App\\Models\\PostLike	43	2025-06-19 13:00:29	2025-06-19 13:00:29	\N
257	63	post_like	Leena Meetha Liked your post	86.98.14.154	Ktor client	App\\Models\\PostLike	43	2025-06-19 13:00:29	2025-06-19 13:00:29	\N
258	63	post_report	You Reported anil nahis Post	86.98.14.154	Ktor client	App\\Models\\PostReports	3	2025-06-19 13:01:51	2025-06-19 13:01:51	\N
259	63	journey_created	New Journey created successfully	86.98.14.154	Ktor client	App\\Models\\Journey	82	2025-06-19 13:05:09	2025-06-19 13:05:09	\N
260	61	post_report	You Reported Usama Shakeel Post	49.37.227.13	Ktor client	App\\Models\\PostReports	4	2025-06-19 13:16:16	2025-06-19 13:16:16	\N
261	55	post_report	You Reported Usama Shakeel Post	223.123.0.73	Ktor client	App\\Models\\PostReports	5	2025-06-19 18:52:39	2025-06-19 18:52:39	\N
262	55	post_like	You Liked Usama Shakeel Post	223.123.0.73	Ktor client	App\\Models\\PostLike	44	2025-06-19 18:53:19	2025-06-19 18:53:19	\N
263	60	post_like	Hamid Raza Liked your post	223.123.0.73	Ktor client	App\\Models\\PostLike	44	2025-06-19 18:53:19	2025-06-19 18:53:19	\N
264	55	post_like	You Liked Usama Shakeel Post	223.123.0.73	Ktor client	App\\Models\\PostLike	45	2025-06-19 18:53:22	2025-06-19 18:53:22	\N
265	60	post_like	Hamid Raza Liked your post	223.123.0.73	Ktor client	App\\Models\\PostLike	45	2025-06-19 18:53:22	2025-06-19 18:53:22	\N
266	55	follow_request_accepted	followed request accepted by Hamid Raza	223.123.18.135	Ktor client	App\\Models\\Follow	15	2025-06-20 05:25:43	2025-06-20 05:25:43	\N
267	56	journey_created	New Journey created successfully	223.123.18.135	Ktor client	App\\Models\\Journey	83	2025-06-20 06:53:13	2025-06-20 06:53:13	\N
268	56	journey_created	New Journey created successfully	223.123.18.135	Ktor client	App\\Models\\Journey	84	2025-06-20 07:03:16	2025-06-20 07:03:16	\N
269	38	post_like	You Liked Usama Shakeel Post	59.182.234.244	Ktor client	App\\Models\\PostLike	46	2025-06-20 10:17:08	2025-06-20 10:17:08	\N
270	60	post_like	sooraj sabu Liked your post	59.182.234.244	Ktor client	App\\Models\\PostLike	46	2025-06-20 10:17:08	2025-06-20 10:17:08	\N
271	38	follow_request_sent	Followed Usama Shakeel	59.182.234.244	Ktor client	App\\Models\\Follow	56	2025-06-20 12:33:49	2025-06-20 12:33:49	\N
272	60	follow_request_received	Follow request from sooraj sabu	59.182.234.244	Ktor client	App\\Models\\Follow	56	2025-06-20 12:33:49	2025-06-20 12:33:49	\N
273	38	follow_request_sent	Followed Ayesha Tariq	59.182.234.244	Ktor client	App\\Models\\Follow	57	2025-06-20 12:34:00	2025-06-20 12:34:00	\N
274	62	follow_request_received	Follow request from sooraj sabu	59.182.234.244	Ktor client	App\\Models\\Follow	57	2025-06-20 12:34:00	2025-06-20 12:34:00	\N
275	38	follow_request_sent	Followed Ameera Raza	59.182.234.244	Ktor client	App\\Models\\Follow	58	2025-06-20 12:34:03	2025-06-20 12:34:03	\N
276	58	follow_request_received	Follow request from sooraj sabu	59.182.234.244	Ktor client	App\\Models\\Follow	58	2025-06-20 12:34:03	2025-06-20 12:34:03	\N
277	38	follow_request_sent	Followed Hamid Raza	59.182.234.244	Ktor client	App\\Models\\Follow	59	2025-06-20 12:34:05	2025-06-20 12:34:05	\N
278	55	follow_request_received	Follow request from sooraj sabu	59.182.234.244	Ktor client	App\\Models\\Follow	59	2025-06-20 12:34:05	2025-06-20 12:34:05	\N
279	38	follow_request_sent	Followed Usama Shakeel	59.182.234.244	Ktor client	App\\Models\\Follow	60	2025-06-20 12:34:07	2025-06-20 12:34:07	\N
280	57	follow_request_received	Follow request from sooraj sabu	59.182.234.244	Ktor client	App\\Models\\Follow	60	2025-06-20 12:34:07	2025-06-20 12:34:07	\N
281	38	follow_request_sent	Followed Leena Meetha	59.182.234.244	Ktor client	App\\Models\\Follow	61	2025-06-20 12:34:08	2025-06-20 12:34:08	\N
282	63	follow_request_received	Follow request from sooraj sabu	59.182.234.244	Ktor client	App\\Models\\Follow	61	2025-06-20 12:34:08	2025-06-20 12:34:08	\N
283	38	follow_request_sent	Followed anil nahis	59.182.234.244	Ktor client	App\\Models\\Follow	62	2025-06-20 12:34:09	2025-06-20 12:34:09	\N
284	61	follow_request_received	Follow request from sooraj sabu	59.182.234.244	Ktor client	App\\Models\\Follow	62	2025-06-20 12:34:09	2025-06-20 12:34:09	\N
285	38	follow_request_sent	Followed sooraj sabu	59.182.234.244	Ktor client	App\\Models\\Follow	63	2025-06-20 12:34:11	2025-06-20 12:34:11	\N
286	53	follow_request_received	Follow request from sooraj sabu	59.182.234.244	Ktor client	App\\Models\\Follow	63	2025-06-20 12:34:11	2025-06-20 12:34:11	\N
287	38	follow_request_sent	Followed anil navis	59.182.234.244	Ktor client	App\\Models\\Follow	64	2025-06-20 12:34:11	2025-06-20 12:34:11	\N
288	54	follow_request_received	Follow request from sooraj sabu	59.182.234.244	Ktor client	App\\Models\\Follow	64	2025-06-20 12:34:11	2025-06-20 12:34:11	\N
289	38	follow_request_sent	Followed testdevf four	59.182.234.244	Ktor client	App\\Models\\Follow	65	2025-06-20 12:34:13	2025-06-20 12:34:13	\N
290	52	follow_request_received	Follow request from sooraj sabu	59.182.234.244	Ktor client	App\\Models\\Follow	65	2025-06-20 12:34:13	2025-06-20 12:34:13	\N
291	38	follow_request_sent	Followed sooraj sabu	59.182.234.244	Ktor client	App\\Models\\Follow	66	2025-06-20 12:34:14	2025-06-20 12:34:14	\N
292	50	follow_request_received	Follow request from sooraj sabu	59.182.234.244	Ktor client	App\\Models\\Follow	66	2025-06-20 12:34:14	2025-06-20 12:34:14	\N
293	61	journey_created	New Journey created successfully	49.37.227.13	Ktor client	App\\Models\\Journey	85	2025-06-21 03:08:26	2025-06-21 03:08:26	\N
294	60	post_like	You Liked Dev Test Post	182.183.57.227	Ktor client	App\\Models\\PostLike	47	2025-06-21 07:49:25	2025-06-21 07:49:25	\N
295	37	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	47	2025-06-21 07:49:25	2025-06-21 07:49:25	\N
296	60	post_like	You Liked Dev Test Post	182.183.57.227	Ktor client	App\\Models\\PostLike	48	2025-06-21 07:49:25	2025-06-21 07:49:25	\N
297	37	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	48	2025-06-21 07:49:25	2025-06-21 07:49:25	\N
298	60	post_like	You Liked Dev Test Post	182.183.57.227	Ktor client	App\\Models\\PostLike	49	2025-06-21 07:49:26	2025-06-21 07:49:26	\N
299	37	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	49	2025-06-21 07:49:26	2025-06-21 07:49:26	\N
300	60	post_like	You Liked Dev Test Post	182.183.57.227	Ktor client	App\\Models\\PostLike	50	2025-06-21 07:49:27	2025-06-21 07:49:27	\N
301	37	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	50	2025-06-21 07:49:27	2025-06-21 07:49:27	\N
302	60	post_like	You Liked Dev Test Post	182.183.57.227	Ktor client	App\\Models\\PostLike	51	2025-06-21 07:49:28	2025-06-21 07:49:28	\N
303	37	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	51	2025-06-21 07:49:28	2025-06-21 07:49:28	\N
304	60	post_like	You Liked Dev Test Post	182.183.57.227	Ktor client	App\\Models\\PostLike	52	2025-06-21 07:49:29	2025-06-21 07:49:29	\N
305	37	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	52	2025-06-21 07:49:29	2025-06-21 07:49:29	\N
306	60	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	53	2025-06-21 07:49:45	2025-06-21 07:49:45	\N
307	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	53	2025-06-21 07:49:45	2025-06-21 07:49:45	\N
308	60	post_like	You Liked Dev Test Post	182.183.57.227	Ktor client	App\\Models\\PostLike	54	2025-06-21 07:52:19	2025-06-21 07:52:19	\N
309	37	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	54	2025-06-21 07:52:19	2025-06-21 07:52:19	\N
310	61	post_like	You Liked Usama Shakeel Post	49.37.227.13	Ktor client	App\\Models\\PostLike	55	2025-06-21 10:54:23	2025-06-21 10:54:23	\N
311	60	post_like	anil nahis Liked your post	49.37.227.13	Ktor client	App\\Models\\PostLike	55	2025-06-21 10:54:23	2025-06-21 10:54:23	\N
312	61	follow_request_sent	Followed Leena Meetha	49.37.227.13	Ktor client	App\\Models\\Follow	67	2025-06-21 10:56:07	2025-06-21 10:56:07	\N
313	63	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	67	2025-06-21 10:56:07	2025-06-21 10:56:07	\N
314	61	follow_request_sent	Followed Usama Shakeel	49.37.227.13	Ktor client	App\\Models\\Follow	68	2025-06-21 10:57:40	2025-06-21 10:57:40	\N
315	60	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	68	2025-06-21 10:57:40	2025-06-21 10:57:40	\N
316	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	56	2025-06-21 11:23:46	2025-06-21 11:23:46	\N
317	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	56	2025-06-21 11:23:46	2025-06-21 11:23:46	\N
318	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	57	2025-06-21 11:23:47	2025-06-21 11:23:47	\N
319	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	57	2025-06-21 11:23:47	2025-06-21 11:23:47	\N
320	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	58	2025-06-21 11:23:49	2025-06-21 11:23:49	\N
321	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	58	2025-06-21 11:23:49	2025-06-21 11:23:49	\N
322	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	59	2025-06-21 11:26:18	2025-06-21 11:26:18	\N
323	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	59	2025-06-21 11:26:18	2025-06-21 11:26:18	\N
324	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	60	2025-06-21 12:07:00	2025-06-21 12:07:00	\N
325	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	60	2025-06-21 12:07:00	2025-06-21 12:07:00	\N
326	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	61	2025-06-21 14:09:56	2025-06-21 14:09:56	\N
327	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	61	2025-06-21 14:09:56	2025-06-21 14:09:56	\N
328	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	62	2025-06-21 14:09:56	2025-06-21 14:09:56	\N
329	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	62	2025-06-21 14:09:56	2025-06-21 14:09:56	\N
330	58	journey_created	New Journey created successfully	223.123.10.80	Ktor client	App\\Models\\Journey	86	2025-06-21 14:40:37	2025-06-21 14:40:37	\N
331	58	journey_created	New Journey created successfully	223.123.10.80	Ktor client	App\\Models\\Journey	87	2025-06-21 14:40:47	2025-06-21 14:40:47	\N
332	56	post_like	You Liked Hamid Raza Post	223.123.10.80	Ktor client	App\\Models\\PostLike	63	2025-06-21 15:22:08	2025-06-21 15:22:08	\N
333	56	post_like	Hamid Raza Liked your post	223.123.10.80	Ktor client	App\\Models\\PostLike	63	2025-06-21 15:22:08	2025-06-21 15:22:08	\N
334	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	64	2025-06-21 18:59:00	2025-06-21 18:59:00	\N
335	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	64	2025-06-21 18:59:00	2025-06-21 18:59:00	\N
336	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	65	2025-06-21 19:00:14	2025-06-21 19:00:14	\N
337	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	65	2025-06-21 19:00:14	2025-06-21 19:00:14	\N
338	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	66	2025-06-21 19:00:14	2025-06-21 19:00:14	\N
339	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	66	2025-06-21 19:00:14	2025-06-21 19:00:14	\N
340	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	67	2025-06-21 19:00:15	2025-06-21 19:00:15	\N
341	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	67	2025-06-21 19:00:15	2025-06-21 19:00:15	\N
342	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	68	2025-06-21 19:02:32	2025-06-21 19:02:32	\N
343	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	68	2025-06-21 19:02:32	2025-06-21 19:02:32	\N
344	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	69	2025-06-21 19:02:34	2025-06-21 19:02:34	\N
345	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	69	2025-06-21 19:02:34	2025-06-21 19:02:34	\N
346	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	70	2025-06-21 19:02:35	2025-06-21 19:02:35	\N
347	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	70	2025-06-21 19:02:35	2025-06-21 19:02:35	\N
348	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	71	2025-06-21 19:02:35	2025-06-21 19:02:35	\N
349	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	71	2025-06-21 19:02:35	2025-06-21 19:02:35	\N
350	59	post_like	You Liked Hamid Raza Post	182.183.57.227	Ktor client	App\\Models\\PostLike	72	2025-06-21 19:03:18	2025-06-21 19:03:18	\N
351	56	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	72	2025-06-21 19:03:18	2025-06-21 19:03:18	\N
352	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	73	2025-06-21 19:06:24	2025-06-21 19:06:24	\N
353	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	73	2025-06-21 19:06:24	2025-06-21 19:06:24	\N
354	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	74	2025-06-21 19:06:25	2025-06-21 19:06:25	\N
355	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	74	2025-06-21 19:06:25	2025-06-21 19:06:25	\N
356	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	75	2025-06-21 19:06:27	2025-06-21 19:06:27	\N
357	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	75	2025-06-21 19:06:27	2025-06-21 19:06:27	\N
358	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	76	2025-06-21 19:07:04	2025-06-21 19:07:04	\N
359	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	76	2025-06-21 19:07:04	2025-06-21 19:07:04	\N
360	59	unfollow	Unfollowed Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	54	2025-06-21 19:53:54	2025-06-21 19:53:54	\N
361	59	follow_request_sent	Followed Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	69	2025-06-21 19:53:55	2025-06-21 19:53:55	\N
362	60	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	69	2025-06-21 19:53:55	2025-06-21 19:53:55	\N
363	59	unfollow	Unfollowed Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	69	2025-06-21 19:53:56	2025-06-21 19:53:56	\N
364	59	follow_request_sent	Followed Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	70	2025-06-21 20:01:45	2025-06-21 20:01:45	\N
365	60	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	70	2025-06-21 20:01:45	2025-06-21 20:01:45	\N
366	59	post_report	You Reported Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostReports	6	2025-06-21 20:03:36	2025-06-21 20:03:36	\N
367	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	77	2025-06-21 20:34:47	2025-06-21 20:34:47	\N
368	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	77	2025-06-21 20:34:47	2025-06-21 20:34:47	\N
369	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	78	2025-06-21 20:34:48	2025-06-21 20:34:48	\N
370	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	78	2025-06-21 20:34:48	2025-06-21 20:34:48	\N
371	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	79	2025-06-21 20:34:50	2025-06-21 20:34:50	\N
372	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	79	2025-06-21 20:34:50	2025-06-21 20:34:50	\N
373	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	80	2025-06-21 20:35:38	2025-06-21 20:35:38	\N
374	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	80	2025-06-21 20:35:38	2025-06-21 20:35:38	\N
375	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	81	2025-06-21 20:51:33	2025-06-21 20:51:33	\N
376	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	81	2025-06-21 20:51:33	2025-06-21 20:51:33	\N
377	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	82	2025-06-21 20:51:35	2025-06-21 20:51:35	\N
378	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	82	2025-06-21 20:51:35	2025-06-21 20:51:35	\N
379	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	83	2025-06-21 20:51:44	2025-06-21 20:51:44	\N
380	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	83	2025-06-21 20:51:44	2025-06-21 20:51:44	\N
381	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	84	2025-06-21 20:51:50	2025-06-21 20:51:50	\N
382	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	84	2025-06-21 20:51:50	2025-06-21 20:51:50	\N
383	59	post_like	You Liked Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostLike	85	2025-06-21 20:51:51	2025-06-21 20:51:51	\N
384	60	post_like	Usama Shakeel Liked your post	182.183.57.227	Ktor client	App\\Models\\PostLike	85	2025-06-21 20:51:51	2025-06-21 20:51:51	\N
385	59	unfollow	Unfollowed Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	70	2025-06-21 20:51:59	2025-06-21 20:51:59	\N
386	59	follow_request_sent	Followed Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	71	2025-06-21 20:52:02	2025-06-21 20:52:02	\N
387	60	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	71	2025-06-21 20:52:02	2025-06-21 20:52:02	\N
388	59	unfollow	Unfollowed Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	71	2025-06-21 20:52:24	2025-06-21 20:52:24	\N
389	59	follow_request_sent	Followed Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	72	2025-06-21 20:52:28	2025-06-21 20:52:28	\N
390	60	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	72	2025-06-21 20:52:28	2025-06-21 20:52:28	\N
391	59	unfollow	Unfollowed Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	72	2025-06-21 20:52:39	2025-06-21 20:52:39	\N
392	59	follow_request_sent	Followed Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	73	2025-06-21 20:52:46	2025-06-21 20:52:46	\N
393	60	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	73	2025-06-21 20:52:46	2025-06-21 20:52:46	\N
394	59	unfollow	Unfollowed Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	73	2025-06-21 20:57:16	2025-06-21 20:57:16	\N
395	59	follow_request_sent	Followed Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	74	2025-06-21 20:57:22	2025-06-21 20:57:22	\N
396	60	follow_request_received	Follow request from Usama Shakeel	182.183.57.227	Ktor client	App\\Models\\Follow	74	2025-06-21 20:57:22	2025-06-21 20:57:22	\N
397	59	post_report	You Reported Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostReports	7	2025-06-21 21:02:29	2025-06-21 21:02:29	\N
398	59	post_report	You Reported Usama Shakeel Post	182.183.57.227	Ktor client	App\\Models\\PostReports	8	2025-06-21 21:04:36	2025-06-21 21:04:36	\N
399	61	journey_created	New Journey created successfully	49.37.227.13	Ktor client	App\\Models\\Journey	88	2025-06-22 05:18:27	2025-06-22 05:18:27	\N
400	61	post_like	You Liked anil nahis Post	49.37.227.13	Ktor client	App\\Models\\PostLike	86	2025-06-22 08:03:27	2025-06-22 08:03:27	\N
401	61	post_like	anil nahis Liked your post	49.37.227.13	Ktor client	App\\Models\\PostLike	86	2025-06-22 08:03:27	2025-06-22 08:03:27	\N
402	61	post_like	You Liked anil nahis Post	49.37.227.13	Ktor client	App\\Models\\PostLike	87	2025-06-22 08:16:37	2025-06-22 08:16:37	\N
403	61	post_like	anil nahis Liked your post	49.37.227.13	Ktor client	App\\Models\\PostLike	87	2025-06-22 08:16:37	2025-06-22 08:16:37	\N
404	61	post_like	You Liked Usama Shakeel Post	49.37.227.13	Ktor client	App\\Models\\PostLike	88	2025-06-22 08:56:57	2025-06-22 08:56:57	\N
405	60	post_like	anil nahis Liked your post	49.37.227.13	Ktor client	App\\Models\\PostLike	88	2025-06-22 08:56:57	2025-06-22 08:56:57	\N
406	55	post_like	You Liked Usama Shakeel Post	51.158.244.198	Ktor client	App\\Models\\PostLike	89	2025-06-22 15:33:11	2025-06-22 15:33:11	\N
407	60	post_like	Hamid Raza Liked your post	51.158.244.198	Ktor client	App\\Models\\PostLike	89	2025-06-22 15:33:11	2025-06-22 15:33:11	\N
408	59	post_like	You Liked Usama Shakeel Post	182.183.108.187	Ktor client	App\\Models\\PostLike	90	2025-06-23 06:40:21	2025-06-23 06:40:21	\N
409	59	post_like	Usama Shakeel Liked your post	182.183.108.187	Ktor client	App\\Models\\PostLike	90	2025-06-23 06:40:21	2025-06-23 06:40:21	\N
410	61	post_like	You Liked Usama Shakeel Post	49.37.227.13	Ktor client	App\\Models\\PostLike	91	2025-06-23 10:38:01	2025-06-23 10:38:01	\N
411	59	post_like	anil nahis Liked your post	49.37.227.13	Ktor client	App\\Models\\PostLike	91	2025-06-23 10:38:01	2025-06-23 10:38:01	\N
412	61	post_like	You Liked Leena Meetha Post	49.37.227.13	Ktor client	App\\Models\\PostLike	92	2025-06-23 10:59:18	2025-06-23 10:59:18	\N
413	63	post_like	anil nahis Liked your post	49.37.227.13	Ktor client	App\\Models\\PostLike	92	2025-06-23 10:59:18	2025-06-23 10:59:18	\N
414	63	follow_request_sent	Followed Ayesha Tariq	86.98.14.154	Ktor client	App\\Models\\Follow	75	2025-06-23 11:13:07	2025-06-23 11:13:07	\N
415	62	follow_request_received	Follow request from Leena Meetha	86.98.14.154	Ktor client	App\\Models\\Follow	75	2025-06-23 11:13:07	2025-06-23 11:13:07	\N
416	61	follow_request_sent	Followed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	76	2025-06-23 11:13:20	2025-06-23 11:13:20	\N
417	62	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	76	2025-06-23 11:13:20	2025-06-23 11:13:20	\N
418	62	follow_request_sent	Followed anil nahis	86.98.14.154	Ktor client	App\\Models\\Follow	77	2025-06-23 11:13:53	2025-06-23 11:13:53	\N
419	61	follow_request_received	Follow request from Ayesha Tariq	86.98.14.154	Ktor client	App\\Models\\Follow	77	2025-06-23 11:13:53	2025-06-23 11:13:53	\N
420	62	follow_request_accepted	followed request accepted by anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	77	2025-06-23 11:14:48	2025-06-23 11:14:48	\N
421	61	follow_request_accepted	followed request accepted by Ayesha Tariq	86.98.14.154	Ktor client	App\\Models\\Follow	76	2025-06-23 11:15:09	2025-06-23 11:15:09	\N
422	56	follow_request_sent	Followed Leena Meetha	223.123.0.166	Ktor client	App\\Models\\Follow	78	2025-06-23 11:26:47	2025-06-23 11:26:47	\N
423	63	follow_request_received	Follow request from Hamid Raza	223.123.0.166	Ktor client	App\\Models\\Follow	78	2025-06-23 11:26:47	2025-06-23 11:26:47	\N
424	59	post_like	You Liked Usama Shakeel Post	182.183.108.187	Ktor client	App\\Models\\PostLike	93	2025-06-23 11:49:25	2025-06-23 11:49:25	\N
425	60	post_like	Usama Shakeel Liked your post	182.183.108.187	Ktor client	App\\Models\\PostLike	93	2025-06-23 11:49:25	2025-06-23 11:49:25	\N
426	59	post_like	You Liked Leena Meetha Post	182.183.108.187	Ktor client	App\\Models\\PostLike	94	2025-06-23 11:49:36	2025-06-23 11:49:36	\N
427	63	post_like	Usama Shakeel Liked your post	182.183.108.187	Ktor client	App\\Models\\PostLike	94	2025-06-23 11:49:36	2025-06-23 11:49:36	\N
428	59	post_like	You Liked anil nahis Post	182.183.108.187	Ktor client	App\\Models\\PostLike	95	2025-06-23 11:49:59	2025-06-23 11:49:59	\N
429	61	post_like	Usama Shakeel Liked your post	182.183.108.187	Ktor client	App\\Models\\PostLike	95	2025-06-23 11:49:59	2025-06-23 11:49:59	\N
430	59	post_like	You Liked Usama Shakeel Post	182.183.108.187	Ktor client	App\\Models\\PostLike	96	2025-06-23 11:51:16	2025-06-23 11:51:16	\N
431	59	post_like	Usama Shakeel Liked your post	182.183.108.187	Ktor client	App\\Models\\PostLike	96	2025-06-23 11:51:16	2025-06-23 11:51:16	\N
432	59	post_like	You Liked Usama Shakeel Post	182.183.108.187	Ktor client	App\\Models\\PostLike	97	2025-06-23 11:53:29	2025-06-23 11:53:29	\N
433	60	post_like	Usama Shakeel Liked your post	182.183.108.187	Ktor client	App\\Models\\PostLike	97	2025-06-23 11:53:29	2025-06-23 11:53:29	\N
434	59	post_like	You Liked Leena Meetha Post	182.183.108.187	Ktor client	App\\Models\\PostLike	98	2025-06-23 11:54:13	2025-06-23 11:54:13	\N
435	63	post_like	Usama Shakeel Liked your post	182.183.108.187	Ktor client	App\\Models\\PostLike	98	2025-06-23 11:54:13	2025-06-23 11:54:13	\N
436	59	post_like	You Liked Usama Shakeel Post	182.183.108.187	Ktor client	App\\Models\\PostLike	99	2025-06-23 11:54:40	2025-06-23 11:54:40	\N
437	60	post_like	Usama Shakeel Liked your post	182.183.108.187	Ktor client	App\\Models\\PostLike	99	2025-06-23 11:54:40	2025-06-23 11:54:40	\N
438	38	follow_request_accepted	followed request accepted by anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	62	2025-06-23 11:57:51	2025-06-23 11:57:51	\N
439	59	post_like	You Liked Leena Meetha Post	182.183.108.187	Ktor client	App\\Models\\PostLike	100	2025-06-23 11:58:47	2025-06-23 11:58:47	\N
440	63	post_like	Usama Shakeel Liked your post	182.183.108.187	Ktor client	App\\Models\\PostLike	100	2025-06-23 11:58:47	2025-06-23 11:58:47	\N
441	59	post_like	You Liked Leena Meetha Post	182.183.108.187	Ktor client	App\\Models\\PostLike	101	2025-06-23 11:58:53	2025-06-23 11:58:53	\N
442	63	post_like	Usama Shakeel Liked your post	182.183.108.187	Ktor client	App\\Models\\PostLike	101	2025-06-23 11:58:53	2025-06-23 11:58:53	\N
443	59	post_like	You Liked Leena Meetha Post	182.183.108.187	Ktor client	App\\Models\\PostLike	102	2025-06-23 11:59:20	2025-06-23 11:59:20	\N
444	63	post_like	Usama Shakeel Liked your post	182.183.108.187	Ktor client	App\\Models\\PostLike	102	2025-06-23 11:59:20	2025-06-23 11:59:20	\N
445	62	journey_created	New Journey created successfully	86.98.14.154	Ktor client	App\\Models\\Journey	89	2025-06-23 12:15:54	2025-06-23 12:15:54	\N
446	38	follow_request_accepted	followed request accepted by Hamid Raza	223.123.0.166	Ktor client	App\\Models\\Follow	35	2025-06-23 12:41:19	2025-06-23 12:41:19	\N
447	61	follow_request_accepted	followed request accepted by Hamid Raza	223.123.0.166	Ktor client	App\\Models\\Follow	48	2025-06-23 12:41:21	2025-06-23 12:41:21	\N
448	56	post_report	You Reported Ayesha Tariq Post	223.123.0.166	Ktor client	App\\Models\\PostReports	9	2025-06-23 12:42:11	2025-06-23 12:42:11	\N
449	61	unfollow	Unfollowed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	76	2025-06-23 13:49:13	2025-06-23 13:49:13	\N
450	61	follow_request_sent	Followed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	79	2025-06-23 13:49:14	2025-06-23 13:49:14	\N
451	62	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	79	2025-06-23 13:49:14	2025-06-23 13:49:14	\N
452	61	unfollow	Unfollowed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	79	2025-06-23 13:49:15	2025-06-23 13:49:15	\N
453	61	follow_request_sent	Followed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	80	2025-06-23 13:49:18	2025-06-23 13:49:18	\N
454	62	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	80	2025-06-23 13:49:18	2025-06-23 13:49:18	\N
455	61	follow_request_rejected	followed request rejected by Ayesha Tariq	86.98.14.154	Ktor client	App\\Models\\Follow	80	2025-06-23 13:49:54	2025-06-23 13:49:54	\N
456	62	follow_request_sent	Followed akio nahis	86.98.14.154	Ktor client	App\\Models\\Follow	81	2025-06-23 13:50:32	2025-06-23 13:50:32	\N
457	49	follow_request_received	Follow request from Ayesha Tariq	86.98.14.154	Ktor client	App\\Models\\Follow	81	2025-06-23 13:50:32	2025-06-23 13:50:32	\N
458	61	unfollow	Unfollowed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	80	2025-06-23 13:52:27	2025-06-23 13:52:27	\N
459	61	follow_request_sent	Followed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	82	2025-06-23 13:52:28	2025-06-23 13:52:28	\N
460	62	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	82	2025-06-23 13:52:28	2025-06-23 13:52:28	\N
461	61	unfollow	Unfollowed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	82	2025-06-23 13:52:30	2025-06-23 13:52:30	\N
462	61	follow_request_sent	Followed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	83	2025-06-23 13:53:25	2025-06-23 13:53:25	\N
463	62	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	83	2025-06-23 13:53:25	2025-06-23 13:53:25	\N
464	61	follow_request_accepted	followed request accepted by Ayesha Tariq	86.98.14.154	Ktor client	App\\Models\\Follow	83	2025-06-23 13:53:41	2025-06-23 13:53:41	\N
465	59	post_like	You Liked Usama Shakeel Post	182.183.108.187	Ktor client	App\\Models\\PostLike	103	2025-06-23 15:03:53	2025-06-23 15:03:53	\N
466	60	post_like	Usama Shakeel Liked your post	182.183.108.187	Ktor client	App\\Models\\PostLike	103	2025-06-23 15:03:53	2025-06-23 15:03:53	\N
467	59	post_like	You Liked Usama Shakeel Post	182.183.108.187	Ktor client	App\\Models\\PostLike	104	2025-06-23 15:04:37	2025-06-23 15:04:37	\N
468	60	post_like	Usama Shakeel Liked your post	182.183.108.187	Ktor client	App\\Models\\PostLike	104	2025-06-23 15:04:37	2025-06-23 15:04:37	\N
469	59	post_like	You Liked Usama Shakeel Post	182.183.108.187	Ktor client	App\\Models\\PostLike	105	2025-06-23 15:04:51	2025-06-23 15:04:51	\N
470	60	post_like	Usama Shakeel Liked your post	182.183.108.187	Ktor client	App\\Models\\PostLike	105	2025-06-23 15:04:51	2025-06-23 15:04:51	\N
471	59	post_report	You Reported Ayesha Tariq Post	182.183.108.187	Ktor client	App\\Models\\PostReports	10	2025-06-23 15:49:49	2025-06-23 15:49:49	\N
472	61	follow_request_sent	Followed Usama Shakeel	49.37.227.13	Ktor client	App\\Models\\Follow	84	2025-06-23 16:25:24	2025-06-23 16:25:24	\N
473	59	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	84	2025-06-23 16:25:24	2025-06-23 16:25:24	\N
474	61	unfollow	Unfollowed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	83	2025-06-23 17:57:54	2025-06-23 17:57:54	\N
475	61	follow_request_sent	Followed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	85	2025-06-23 17:57:57	2025-06-23 17:57:57	\N
476	62	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	85	2025-06-23 17:57:57	2025-06-23 17:57:57	\N
477	61	unfollow	Unfollowed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	85	2025-06-23 17:57:58	2025-06-23 17:57:58	\N
478	61	follow_request_sent	Followed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	86	2025-06-23 17:58:09	2025-06-23 17:58:09	\N
479	62	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	86	2025-06-23 17:58:09	2025-06-23 17:58:09	\N
480	59	follow_request_sent	Followed Ayesha Tariq	182.183.108.187	Ktor client	App\\Models\\Follow	87	2025-06-23 19:40:08	2025-06-23 19:40:08	\N
481	62	follow_request_received	Follow request from Usama Shakeel	182.183.108.187	Ktor client	App\\Models\\Follow	87	2025-06-23 19:40:08	2025-06-23 19:40:08	\N
482	59	unfollow	Unfollowed Ayesha Tariq	182.183.108.187	Ktor client	App\\Models\\Follow	87	2025-06-23 19:40:23	2025-06-23 19:40:23	\N
483	61	unfollow	Unfollowed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	86	2025-06-23 23:38:52	2025-06-23 23:38:52	\N
484	61	follow_request_sent	Followed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	88	2025-06-23 23:38:55	2025-06-23 23:38:55	\N
485	62	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	88	2025-06-23 23:38:55	2025-06-23 23:38:55	\N
486	61	unfollow	Unfollowed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	88	2025-06-23 23:38:56	2025-06-23 23:38:56	\N
487	61	follow_request_sent	Followed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	89	2025-06-23 23:38:57	2025-06-23 23:38:57	\N
488	62	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	89	2025-06-23 23:38:57	2025-06-23 23:38:57	\N
489	61	unfollow	Unfollowed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	89	2025-06-23 23:38:57	2025-06-23 23:38:57	\N
490	61	follow_request_sent	Followed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	90	2025-06-23 23:38:58	2025-06-23 23:38:58	\N
491	62	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	90	2025-06-23 23:38:58	2025-06-23 23:38:58	\N
492	61	unfollow	Unfollowed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	90	2025-06-23 23:38:59	2025-06-23 23:38:59	\N
493	61	follow_request_sent	Followed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	91	2025-06-23 23:39:00	2025-06-23 23:39:00	\N
494	62	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	91	2025-06-23 23:39:00	2025-06-23 23:39:00	\N
495	61	unfollow	Unfollowed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	91	2025-06-23 23:39:00	2025-06-23 23:39:00	\N
496	61	follow_request_sent	Followed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	92	2025-06-23 23:39:01	2025-06-23 23:39:01	\N
497	62	follow_request_received	Follow request from anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	92	2025-06-23 23:39:01	2025-06-23 23:39:01	\N
498	61	post_like	You Liked Ayesha Tariq Post	49.37.227.13	Ktor client	App\\Models\\PostLike	106	2025-06-24 03:20:04	2025-06-24 03:20:04	\N
499	62	post_like	anil nahis Liked your post	49.37.227.13	Ktor client	App\\Models\\PostLike	106	2025-06-24 03:20:04	2025-06-24 03:20:04	\N
500	61	post_like	You Liked Ayesha Tariq Post	49.37.227.13	Ktor client	App\\Models\\PostLike	107	2025-06-24 03:22:52	2025-06-24 03:22:52	\N
501	62	post_like	anil nahis Liked your post	49.37.227.13	Ktor client	App\\Models\\PostLike	107	2025-06-24 03:22:52	2025-06-24 03:22:52	\N
502	61	post_like	You Liked Ayesha Tariq Post	49.37.227.13	Ktor client	App\\Models\\PostLike	108	2025-06-24 03:23:00	2025-06-24 03:23:00	\N
503	62	post_like	anil nahis Liked your post	49.37.227.13	Ktor client	App\\Models\\PostLike	108	2025-06-24 03:23:00	2025-06-24 03:23:00	\N
504	120	post_removed	You have removed the post	59.182.229.59	PostmanRuntime/7.44.1	App\\Models\\Post	120	2025-06-24 05:10:19	2025-06-24 05:10:19	\N
505	62	follow_request_sent	Followed Usama Shakeel	86.98.14.154	Ktor client	App\\Models\\Follow	93	2025-06-24 06:11:28	2025-06-24 06:11:28	\N
506	59	follow_request_received	Follow request from Ayesha Tariq	86.98.14.154	Ktor client	App\\Models\\Follow	93	2025-06-24 06:11:28	2025-06-24 06:11:28	\N
507	62	post_like	You Liked Ayesha Tariq Post	86.98.14.154	Ktor client	App\\Models\\PostLike	109	2025-06-24 06:34:51	2025-06-24 06:34:51	\N
508	62	post_like	Ayesha Tariq Liked your post	86.98.14.154	Ktor client	App\\Models\\PostLike	109	2025-06-24 06:34:51	2025-06-24 06:34:51	\N
509	61	post_like	You Liked Ayesha Tariq Post	49.37.227.13	Ktor client	App\\Models\\PostLike	110	2025-06-24 06:35:28	2025-06-24 06:35:28	\N
510	62	post_like	anil nahis Liked your post	49.37.227.13	Ktor client	App\\Models\\PostLike	110	2025-06-24 06:35:28	2025-06-24 06:35:28	\N
511	62	journey_created	New Journey created successfully	86.98.14.154	Ktor client	App\\Models\\Journey	90	2025-06-24 06:46:31	2025-06-24 06:46:31	\N
512	62	post_like	You Liked Leena Meetha Post	86.98.14.154	Ktor client	App\\Models\\PostLike	111	2025-06-24 07:12:56	2025-06-24 07:12:56	\N
513	63	post_like	Ayesha Tariq Liked your post	86.98.14.154	Ktor client	App\\Models\\PostLike	111	2025-06-24 07:12:56	2025-06-24 07:12:56	\N
514	62	post_like	You Liked Usama Shakeel Post	86.98.14.154	Ktor client	App\\Models\\PostLike	112	2025-06-24 07:29:41	2025-06-24 07:29:41	\N
515	60	post_like	Ayesha Tariq Liked your post	86.98.14.154	Ktor client	App\\Models\\PostLike	112	2025-06-24 07:29:41	2025-06-24 07:29:41	\N
516	62	follow_request_sent	Followed Usama Shakeel	86.98.14.154	Ktor client	App\\Models\\Follow	94	2025-06-24 07:30:00	2025-06-24 07:30:00	\N
517	60	follow_request_received	Follow request from Ayesha Tariq	86.98.14.154	Ktor client	App\\Models\\Follow	94	2025-06-24 07:30:00	2025-06-24 07:30:00	\N
518	55	post_like	You Liked Usama Shakeel Post	223.123.11.192	Ktor client	App\\Models\\PostLike	113	2025-06-24 07:30:58	2025-06-24 07:30:58	\N
519	60	post_like	Hamid Raza Liked your post	223.123.11.192	Ktor client	App\\Models\\PostLike	113	2025-06-24 07:30:58	2025-06-24 07:30:58	\N
520	62	unfollow	Unfollowed Leena Meetha	86.98.14.154	Ktor client	App\\Models\\Follow	53	2025-06-24 07:34:51	2025-06-24 07:34:51	\N
521	60	follow_request_sent	Followed Leena Meetha	182.183.108.187	Ktor client	App\\Models\\Follow	95	2025-06-24 08:06:49	2025-06-24 08:06:49	\N
522	60	follow_request_sent	Followed Ayesha Tariq	182.183.108.187	Ktor client	App\\Models\\Follow	96	2025-06-24 08:09:05	2025-06-24 08:09:05	\N
523	60	follow_request_sent	Followed sooraj sabu	182.183.108.187	Ktor client	App\\Models\\Follow	97	2025-06-24 08:11:55	2025-06-24 08:11:55	\N
524	60	unfollow	Unfollowed sooraj sabu	182.183.108.187	Ktor client	App\\Models\\Follow	97	2025-06-24 08:16:33	2025-06-24 08:16:33	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/175041517368553745c42b6.png"}
525	60	follow_request_sent	Followed sooraj sabu	182.183.108.187	Ktor client	App\\Models\\Follow	98	2025-06-24 08:16:34	2025-06-24 08:16:34	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/175041517368553745c42b6.png"}
526	64	post_like	You Liked Leena Meetha Post	49.37.227.13	Ktor client	App\\Models\\PostLike	114	2025-06-24 09:51:10	2025-06-24 09:51:10	\N
527	63	post_like	anil navis Liked your post	49.37.227.13	Ktor client	App\\Models\\PostLike	114	2025-06-24 09:51:10	2025-06-24 09:51:10	\N
528	64	follow_request_sent	Followed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	99	2025-06-24 10:15:06	2025-06-24 10:15:06	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/17503346766853fcd498b8e."}
529	64	unfollow	Unfollowed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	99	2025-06-24 10:15:08	2025-06-24 10:15:08	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/17503346766853fcd498b8e."}
530	64	follow_request_sent	Followed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	100	2025-06-24 10:20:39	2025-06-24 10:20:39	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/17503346766853fcd498b8e."}
531	64	unfollow	Unfollowed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	100	2025-06-24 10:20:40	2025-06-24 10:20:40	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/17503346766853fcd498b8e."}
532	64	follow_request_sent	Followed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	101	2025-06-24 10:20:42	2025-06-24 10:20:42	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/17503346766853fcd498b8e."}
533	64	unfollow	Unfollowed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	101	2025-06-24 10:20:43	2025-06-24 10:20:43	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/17503346766853fcd498b8e."}
534	64	post_report	You Reported anol navis Post	49.37.227.13	Ktor client	App\\Models\\PostReports	11	2025-06-24 10:20:56	2025-06-24 10:20:56	\N
535	64	follow_request_sent	Followed Leena Meetha	49.37.227.13	Ktor client	App\\Models\\Follow	102	2025-06-24 10:34:09	2025-06-24 10:34:09	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/175033690368540587d06f3."}
536	64	follow_request_sent	Followed Ayesha Tariq	49.37.227.13	Ktor client	App\\Models\\Follow	103	2025-06-24 10:34:12	2025-06-24 10:34:12	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/17503346766853fcd498b8e."}
537	64	post_like	You Liked Usama Shakeel Post	49.37.227.13	Ktor client	App\\Models\\PostLike	115	2025-06-24 10:54:33	2025-06-24 10:54:33	\N
538	60	post_like	anil navis Liked your post	49.37.227.13	Ktor client	App\\Models\\PostLike	115	2025-06-24 10:54:33	2025-06-24 10:54:33	\N
539	55	follow_request_sent	Followed anil navis	223.123.10.244	Ktor client	App\\Models\\Follow	104	2025-06-24 12:33:22	2025-06-24 12:33:22	{"thumb_image":""}
540	55	follow_request_sent	Followed Leena Meetha	223.123.10.244	Ktor client	App\\Models\\Follow	105	2025-06-24 12:40:57	2025-06-24 12:40:57	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/175033690368540587d06f3."}
541	55	follow_request_sent	Followed Ayesha Tariq	223.123.10.244	Ktor client	App\\Models\\Follow	106	2025-06-24 12:48:51	2025-06-24 12:48:51	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/17503346766853fcd498b8e."}
542	55	unfollow	Unfollowed Ayesha Tariq	223.123.10.244	Ktor client	App\\Models\\Follow	106	2025-06-24 12:48:55	2025-06-24 12:48:55	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/17503346766853fcd498b8e."}
543	55	follow_request_sent	Followed anil nahis	223.123.10.244	Ktor client	App\\Models\\Follow	107	2025-06-24 12:49:03	2025-06-24 12:49:03	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/175067497168592e1b7b5f4."}
544	55	unfollow	Unfollowed anil nahis	223.123.10.244	Ktor client	App\\Models\\Follow	107	2025-06-24 12:49:09	2025-06-24 12:49:09	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/175067497168592e1b7b5f4."}
545	38	follow_request_accepted	followed request accepted by Hamid Raza	223.123.10.244	Ktor client	App\\Models\\Follow	59	2025-06-24 12:49:14	2025-06-24 12:49:14	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/17506622116858fc4397c38."}
546	62	unfollow	Unfollowed Usama Shakeel	86.98.14.154	Ktor client	App\\Models\\Follow	94	2025-06-24 12:53:05	2025-06-24 12:53:05	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/1750765767685a90c75c6fb."}
547	62	follow_request_sent	Followed Usama Shakeel	86.98.14.154	Ktor client	App\\Models\\Follow	108	2025-06-24 14:08:22	2025-06-24 14:08:22	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/1750765767685a90c75c6fb."}
548	62	unfollow	Unfollowed Usama Shakeel	86.98.14.154	Ktor client	App\\Models\\Follow	108	2025-06-24 14:09:14	2025-06-24 14:09:14	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/1750765767685a90c75c6fb."}
549	63	follow_request_accepted	followed request accepted by Ayesha Tariq	86.98.14.154	Ktor client	App\\Models\\Follow	75	2025-06-24 14:11:04	2025-06-24 14:11:04	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/17503346766853fcd498b8e."}
550	60	follow_request_accepted	followed request accepted by Ayesha Tariq	86.98.14.154	Ktor client	App\\Models\\Follow	96	2025-06-24 14:11:23	2025-06-24 14:11:23	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/17503346766853fcd498b8e."}
551	61	follow_request_accepted	followed request accepted by Ayesha Tariq	86.98.14.154	Ktor client	App\\Models\\Follow	92	2025-06-24 14:11:26	2025-06-24 14:11:26	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/17503346766853fcd498b8e."}
552	61	follow_request_sent	Followed anil navis	49.37.227.13	Ktor client	App\\Models\\Follow	109	2025-06-24 17:03:59	2025-06-24 17:03:59	{"thumb_image":""}
553	61	post_like	You Liked Leena Meetha Post	49.37.227.13	Ktor client	App\\Models\\PostLike	116	2025-06-24 17:34:08	2025-06-24 17:34:08	\N
554	63	post_like	anil nahis Liked your post	49.37.227.13	Ktor client	App\\Models\\PostLike	116	2025-06-24 17:34:08	2025-06-24 17:34:08	\N
555	60	post_like	You Liked anil nahis Post	182.183.46.164	Ktor client	App\\Models\\PostLike	117	2025-06-24 20:03:17	2025-06-24 20:03:17	\N
556	61	post_like	Usama Shakeel Liked your post	182.183.46.164	Ktor client	App\\Models\\PostLike	117	2025-06-24 20:03:17	2025-06-24 20:03:17	\N
557	55	post_like	You Liked Usama Shakeel Post	223.123.9.118	Ktor client	App\\Models\\PostLike	118	2025-06-25 05:21:36	2025-06-25 05:21:36	\N
558	60	post_like	Hamid Raza Liked your post	223.123.9.118	Ktor client	App\\Models\\PostLike	118	2025-06-25 05:21:36	2025-06-25 05:21:36	\N
559	55	post_like	You Liked sooraj sabu Post	223.123.9.118	Ktor client	App\\Models\\PostLike	119	2025-06-25 05:21:38	2025-06-25 05:21:38	\N
560	38	post_like	Hamid Raza Liked your post	223.123.9.118	Ktor client	App\\Models\\PostLike	119	2025-06-25 05:21:38	2025-06-25 05:21:38	\N
561	55	post_like	You Liked Usama Shakeel Post	223.123.9.118	Ktor client	App\\Models\\PostLike	120	2025-06-25 05:22:18	2025-06-25 05:22:18	\N
562	60	post_like	Hamid Raza Liked your post	223.123.9.118	Ktor client	App\\Models\\PostLike	120	2025-06-25 05:22:18	2025-06-25 05:22:18	\N
563	61	unfollow	Unfollowed Hamid Raza	49.37.227.13	Ktor client	App\\Models\\Follow	48	2025-06-25 05:29:01	2025-06-25 05:29:01	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/1749821782684c2956b69ec."}
564	38	follow_request_rejected	followed request rejected by anil nahis	49.37.227.13	Ktor client	App\\Models\\Follow	62	2025-06-25 05:29:07	2025-06-25 05:29:07	{"thumb_image":"https:\\/\\/dxprojects.s3.ap-southeast-1.amazonaws.com\\/travel_bz_users\\/175067497168592e1b7b5f4."}
\.


--
-- Data for Name: user_loged_devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_loged_devices (id, user_id, token, device_name, last_used_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, first_name, last_name, dial_code, phone, country_id, emirates_id, city_id, company_id, status, deleted_at, role_id, qr_code, username, profile_picture, is_social, email_verified, phone_verified, user_email_otp, user_phone_otp, user_device_type, user_device_token, trade_license, user_access_token, firebase_user_key, password_reset_code, password_reset_time, password_reset_otp, bio, last_ping_timestamp, deleted, is_private, notify_group_message_email, notify_group_message_push, notify_message_email, notify_message_push, notify_friend_request_email, notify_friend_request_push, biometric_token) FROM stdin;
1	Admin User	admin@admin.com	\N	$2y$12$62KaM707H8nJg2LBzu0BE.tjeg7X25TzxjQFi1MnqBV0fOOrarhGG	\N	2025-03-09 21:04:34	2025-03-09 21:18:50	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
16	Christine Snow	tudohiqiv@mailinator.com	\N	$2y$12$m9UqfV5xzUE3VfAfaadpquGTUPDL9jM9m0m/mh3jqfMAnDakvQ3Zi	\N	2025-04-24 06:53:40	2025-04-24 07:09:33	Christine	Snow	\N	\N	1	\N	\N	\N	1	2025-04-24 07:09:33	\N	qrcodes/user_16.svg	vyrucaguh	profile_pictures/vvO8c2YLnFnPPxkUEqM3XXHAHrIe53G6gX5HBfy8.png	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
7	Hiba Ejaz	hiba@admin.com	\N	$2y$12$m5BAUk8B8PC80c2Jbs2CqufjytO8gFXSp.jafnUnbwJOPpRGQQcMW	\N	2025-04-15 12:27:30	2025-04-21 08:58:41	Hiba	Ejaz	\N	\N	1	\N	\N	\N	1	2025-04-21 08:58:41	\N	qrcodes/user_7.svg	\N	\N	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
6	Carissa2e Middleton	lomun@mailinator.com	\N	$2y$12$DRMV7ZYfawA8NLGD75oM8.wDdQL6giY8T1nxsxL8zZJ30M2syZe9i	\N	2025-03-09 22:37:26	2025-04-21 10:22:18	Carissa2e	Middleton	\N	\N	5	\N	\N	\N	1	\N	\N	qrcodes/user_6.svg	Carissa2e	\N	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
13	Armaan Malik	armaan@hotmail.com	\N	$2y$12$G4sqoSm1Yu07D4oqxqP26eGjsbfG.4tgq9luEl.owpTHXf5p7zlP.	\N	2025-04-22 12:28:42	2025-04-24 07:12:47	Armaan	Malik	\N	\N	1	\N	\N	\N	1	\N	\N	qrcodes/user_13.svg	armaan	profile_pictures/Ljlt8KFinvROz6zIdffEBivDgM8Smq4i9UECR5h0.jpg	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
3	Adele Brown	migyhul@mailinator.com	\N	$2y$12$aHhm0hVoCxsliqfbf0ybyedDS4nT8cQqxMKcpsSfyramrj0Zp8aG6	\N	2025-03-09 22:36:48	2025-04-21 10:22:52	Adele	Brown	\N	\N	1	\N	\N	\N	1	2025-04-21 10:22:52	\N	\N	\N	\N	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
14	Leena Metha	leena@hotmail.com	\N	$2y$12$Y7ZLV9Z.p9FwZ1Z0n.Q5wuMBrXg.yhQBZ2k2MN5ZVUI7FQ.8ulE46	\N	2025-04-22 12:48:37	2025-04-24 07:18:21	Leena	Metha	\N	\N	6	\N	\N	\N	1	\N	\N	qrcodes/user_14.svg	leenametha	profile_pictures/JlpAdZEr6EHIAt6AuTSi7dAyx0cO9BP5kr1wbXQg.jpg	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
11	Karina Gibson	fawag@mailinator.com	\N	$2y$12$BKx51HbQuilPQLr/pUBv9.eLZAy3Q649WI6sA9vcAzRh5yv3K7R0C	\N	2025-04-21 14:03:00	2025-04-22 12:26:36	Karina	Gibson	\N	\N	5	\N	\N	\N	0	2025-04-22 12:26:36	\N	qrcodes/user_11.svg	timudesul	profile_pictures/PjtdNbj90rBqXRR2rkcwcJoiAmmTInT1uxESL9hw.png	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
4	Chester Valenzuela	cowytavo@mailinator.com	\N	$2y$12$ekwsnsutkfx/algSnUG2bOJMrYL/TP8s3koRDJ7sYwRT3DDO3CeMK	\N	2025-03-09 22:36:59	2025-04-22 12:26:47	Chester	Valenzuela	\N	\N	1	\N	\N	\N	1	2025-04-22 12:26:47	\N	\N	\N	\N	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
2	Charissa Ross	sajyfu@mailinator.com	\N	$2y$12$Rez1W0F2KwEs/qJpRHaQiOHMX95soah95q5hp/wuYvLSqwhR1G9M.	\N	2025-03-09 21:07:03	2025-04-22 12:26:53	Charissa	Ross	\N	\N	1	\N	\N	\N	1	2025-04-22 12:26:53	\N	\N	\N	\N	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
5	Darius Whitaker	darius@gmail.com	\N	$2y$12$cnMZTMrxoYmJaq6gzO0kheQ1it9jSYfoFh1wSyuU01tAJVxPbjUym	\N	2025-03-09 22:37:08	2025-05-23 07:11:01	Darius	Whitaker	\N	\N	1	\N	\N	\N	1	\N	\N	qrcodes/user_5.svg	Darius	\N	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
23	Sabeeh Shah k	shahsabeeh@shah.com	2025-05-03 06:49:55	$2y$12$vAJSbyLIlsWmuNHSxG6w1eRl5/ynAVLDLRzgWkiDXyT5cdTQHBzri	\N	2025-05-03 06:49:55	2025-05-03 06:50:47	Sabeeh Shah	k	971	154456	\N	\N	\N	\N	1	\N	2	\N	shahsabeeh	\N	0	1	1		1111	android	123123	\N	131e069933cc2aed12071e42f94cc7b5c0f4fafce666b526d362b3c1016edf2b	-OPJu98_zdhO7bLqfnK3	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
15	Doejohnna Halk	doe@gmail.com	\N	$2y$12$l2O3jZdtZYXy5WQwSWYYoewKp75AarEAnyp7AY1nmqJGlJStTWVme	\N	2025-04-22 13:11:54	2025-04-29 01:12:29	Doejohnna	Halk	\N	\N	1	\N	\N	\N	1	\N	\N	qrcodes/user_15.svg	doe	profile_pictures/ia82lHsDdbbgS3CNtoeso6gK7ZUWYrSr3oSd0qSO.jpg	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
21	Asad nazir	abd@gmail.com	2025-05-02 16:41:03	$2y$12$mClr4cp2OMbsRRBR1PKuzO3rEAk.2lV9yNXjzUuosuIB6VrRh2EAW	\N	2025-05-02 16:41:03	2025-05-02 16:41:04	Asad	nazir	92	3445566885	\N	\N	\N	\N	1	\N	2	\N	\N	\N	0	1	1			android	cVX2pRAaSpiJLbandchG8e:APA91bHNT93wERe_PPneVxIANeOwPPD8YFd9ZhXG-YJj9hINAPsfBTPwqRCfyGY7NoNny8ep-FcgfW_o0qv4doqTndye_9NLi-D2iPHRM4UUcSpkqaP2Iks	\N	873b714f94d549ed78e39ab35b72dfedd7de56e2df7f444f6cbe63c097d03552	-OPGrrbgZFCvXA2rSR_W	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
19	Sabeeh Shah k	sabeeh1@shah.com	2025-05-02 00:00:07	$2y$12$fAbX9KNxfD52KLMgHuiRgOJNQBOBMKM/LVZLzf2Mg6f6UnBWvm.Nu	\N	2025-05-02 00:00:07	2025-05-02 00:00:08	Sabeeh Shah	k	971	1234	\N	\N	\N	\N	1	\N	2	\N	\N	\N	0	1	1			android	123123	\N	a98a00eb9de3194ddf3373ae2999cd405f6909567afd7488297a8c0fee00df7f	-OPDHlWrtQLhJ6906EsJ	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
18	Usama Shakeel	ushakeel@gmail.com	2025-05-01 11:30:37	$2y$12$JY52r3YrIDJRlESRUNisqOGUBG5yvjOY2vDSbDgRNY.COyFFz37r6	\N	2025-05-01 11:30:37	2025-05-03 06:16:53	Usama	Shakeel	971	123123123	\N	\N	\N	\N	1	\N	2	\N	\N	\N	0	1	1		1111	android	123123	\N	b967a6af372452a70155fd25930c4e51a2c424eeef35d4f1f15d4bdf9feffe0b	-OPAbDNzy9HUzEXRF75V	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
20	Asad nazir	abs@gmail.com	2025-05-02 16:39:45	$2y$12$sWemLaUIJlyMDiW/2L4/mOtHkyK0idC2WbyIwLlGYoluVr8lLYOlW	\N	2025-05-02 16:39:45	2025-05-02 16:39:45	Asad	nazir	92	3445566886	\N	\N	\N	\N	1	\N	2	\N	\N	\N	0	1	1			android	cVX2pRAaSpiJLbandchG8e:APA91bHNT93wERe_PPneVxIANeOwPPD8YFd9ZhXG-YJj9hINAPsfBTPwqRCfyGY7NoNny8ep-FcgfW_o0qv4doqTndye_9NLi-D2iPHRM4UUcSpkqaP2Iks	\N	247df0d2e8c88588d403f2cc0ecd169273c565f8772f87f2e367c66ff8833df8	-OPGrZULZ3ttmCNvxAlG	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
17	Sabeeh Shah k	sabeeh@shah.com	2025-04-30 19:04:09	$2y$12$1I7ePAA/C0BFqLudic0LSOVz/Y8yYq8EAMW75Q4ncWaL4CYGmKafO	\N	2025-04-30 18:35:08	2025-05-03 15:28:16	Sabeeh Shah	k	971	1	\N	\N	\N	\N	1	\N	2	\N	\N	\N	0	1	1		1111	android	123123	\N	0988ffacf45d816cd473039cd32da9c02d04d444aa2bf8d0f70cd289244bebc0	-OP749E7BWZk8sJ9QJer		2025-05-03 15:27:13	0	\N	\N	0	0	t	t	t	t	t	t	\N
22	Asad Nazir	asad@gmail.com	2025-05-02 22:20:46	$2y$12$gd81hgVrYIYN.dNjRFFXF.jVisiAU2porKS5J2OdIJ8Ez234RPwH6	\N	2025-05-02 22:20:46	2025-05-03 17:31:27	Asad	Nazir	92	3441566086	\N	\N	\N	\N	1	\N	2	\N	\N	\N	0	1	1		1111	android	c_dCsluuQbmh-4ARvPurmH:APA91bGN-531a95CLkZfuZbXhdNRLHBvrelc5238up0boeQ2m9Yuk2syegdBgI8WdjpAlLc57LPvTUsoIqFbxkwragkb6G6l-lACJxo78uBmfbeZ6tzn894	\N	30eafa0b732ec5b438854d3f0e22ae676b79ff1f8f302a4765395008a21e50ca	-OPI4bxonScpzS7gTwTV		2025-05-03 17:30:58	0	\N	\N	0	0	t	t	t	t	t	t	\N
25	Sabeeh Shah k	asdf@gmail.com	2025-05-03 07:59:26	$2y$12$GvfeK9na.q2B/A16utbjM.yOQ/sXiSeRGH6Rl0cU2cC/KtsZ4HjN.	\N	2025-05-03 07:59:26	2025-05-03 07:59:27	Sabeeh Shah	k	971	03445566778	\N	\N	\N	\N	1	\N	2	\N	Asdaz14	\N	0	1	1			android	123123	\N	6bd24ca988cb1e7cb600f4b72d9b564d6ed568f1bcab7e2f7b499b6872242bb2	-OPK93ScELiUgdwfb4o-	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
26	Sabeeh Shah k	shahsabeeh12@shah.com	2025-05-03 08:12:38	$2y$12$ighRrPlTjm/JatvKrtQmN.NSlKOPV0yRnM9JJ1cyzd47qi9QJ1BFi	\N	2025-05-03 08:12:38	2025-05-05 09:17:58	ABCD	sam	971	15445666	1	\N	\N	\N	1	\N	2	\N	shahsabeeh12	\N	0	1	1		1111	android	123123	\N	e424d3a8c6a1328f054387d6ea0818600b32b146a35feb7fad4d7e6508020b8e	-OPKC4r03BsFni76Yhvc	\N	\N	\N	user info	\N	0	0	t	t	t	t	t	t	\N
27	Sabeeh Shah k	asdfg@gmail.com	2025-05-03 08:14:53	$2y$12$kn9SDEhdcXIl2aQAIuh6eOMd.ae7oObgihnfMZydowFJPwCZof/x6	\N	2025-05-03 08:14:53	2025-05-06 12:29:46	Asad	sam	971	03445566775	1	\N	\N	\N	1	\N	2	\N	Asdaz1415	\N	0	1	1		1111	android	123123	\N	f7a4879b20cdaaf46e078a48b5ec6edaf903a9cd81e2eceaa77da4933e0d82aa	-OPKCaeI4U-no2dAILKu	\N	\N	\N	Hello world	\N	0	0	t	t	t	t	t	t	\N
24	Asad nazir	abc@gmail.com	2025-05-03 07:49:11	$2y$12$Mn5lbyMu1Cs2eolA98zQYuQSNirvIUMvt9tVlrOkNr0TXoBcAMICe	\N	2025-05-03 07:49:11	2025-05-05 08:04:47	Asad	nazir	92	3441560003	\N	\N	\N	\N	1	\N	2	\N	Asadz14	\N	0	1	1		1111	android	c92a6uSIQrySGTVCsCNUeQ:APA91bG493abIDm3Pjp5zSEtFCADNXZywKeI9SLWs8BWFfhD3d7NlXs9u6Zzvxl50Ehr0-Jwp-Za8gIbUGYTx-nQrsoxOO3zulyywKjVd8q5-er6JS-WJlI	\N	83f16be80aff1e1706869c7dc33c774dcc188bdd454fefdb138315732f233449	-OPK6iIcysoLvJSJeNpH	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
12	John David	john@gmail.com	\N	$2y$12$SPKPKTWfuT/z9bXg3XRlDeYujjTGmioqTw8/Lq7lT102p0idq6DGG	\N	2025-04-22 12:27:49	2025-05-20 11:40:32	John	David	\N	\N	1	\N	\N	\N	1	\N	\N	qrcodes/user_12.svg	johndavid	\N	0	0	0	\N	1111	\N	\N	\N	58ee23328aa023b42a3af429d75df47297fc85f099a755b9157c34d99c2e69fa	\N	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
30	hiba ejaz	hibadxba@hotmail.com	2025-05-03 14:49:13	$2y$12$Rm0RX5jx78nyLlIn/n.1FO6mAinkxD5A/LIjSAOm4O64m8nBAjlua	\N	2025-05-03 14:49:13	2025-05-03 14:49:14	hiba	ejaz	971	561660152	\N	\N	\N	\N	1	\N	2	\N	hiba	\N	0	1	1			android	frnWichNRn-JBSpOWjVXDb:APA91bHZgUitE4HMT2CpZfnTrVmKK7B8mIX_m9RWxwRr0-IJNBrUjnhGxutBrDbmf0-SShJhTxvNpaCXZExTn6hQNaTt8hw-zZiNaYNeqjMMckNfichAcUY	\N	46aaedcafbf8437cbf4c708dcd7fa859641d2a8f7b7fbc0a09b1658d3f14cd36	-OPLbrBNwzsG44cHmuim	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
33	sooraj sabu	sooraj.a2solution@gmail.com	2025-05-06 07:29:41	$2y$12$LrIWn35Lr4abAPLQA07Ecelpz0C5Co9bWg3PGO.Pm5gV1siAbmaY.	\N	2025-05-06 07:29:41	2025-05-06 09:33:53	sooraj	sabu	91	9847823799	1	\N	\N	\N	1	\N	2	\N	sooraj.a2solution	\N	0	1	1			android	edEM-qqKRJ2DPeoYgB6L2N:APA91bELMR8oPeJL-v_XneJrHptz2QCH02KdRGqhAUbYJNZezXPwNzPIlsp_0IATKmoheElVPbRydCXsW8wluQL0i_X5Kk8WSX8khuNCqH7aKdIrWJGTktI	\N	529806caff817d301f918e53684ed28cbd57cb14073cd0f30c0c38cf64f51374	-OPZV0w5JrJSdkQzLg5_	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
36	sooraj sabu	mlfhEpw7tURU6TYEUrUJ/NseBYO1F2/aXg256ZLX0RU=	2025-05-29 04:36:02	$2y$12$3zHDrX/4hPOaFcBmNddWQu2RMz7B5jD8urMof9YsEz.R/kjqdg0Ui	\N	2025-05-29 04:36:02	2025-05-31 12:32:50	sooraj	sabu	971	hNZo5PDbKzXHpMjjsvxhnA==	\N	\N	\N	\N	1	\N	\N	\N	sooraj16	\N	0	1	1	\N	\N	ios	token	\N	8f3bcdc1f20ae4cbc827ad0222c71170a81ee671aa0367d9e4c5ab6b1b703150	-ORPJqai48vypVbcI5Wo	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
28	Usama Shakeel	usama0@gmail.com	2025-05-03 08:24:39	$2y$12$gNxyT6Sz5FpZVsjAuoGKrO0BvzqwNj5uVm3pr04SIdf4ZrJmQTR5q	\N	2025-05-03 08:24:39	2025-05-06 17:44:36	Usama	Shakeel	971	125125125	\N	\N	\N	\N	1	\N	2	\N	usama010	\N	0	1	1		1111	android	duBxhqvcTi2MAortG1qftf:APA91bFanEdS8wLaDeWRJkmhgk8zWL4x9eB58h9PrXvK7uSXfUXE38-ZeoYqhwsARlgDgxxUP1kUmmFxwwRpIkP9rzUdKTawTmZbVB03vhCOcSc5Y-GTf7g	\N	377952cdca54143bd3e84ba5e92e2ccabad4084c5da464fad51a696313bccccf	-OPKEphOfqYQSM33UkDt	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
29	Ajmala Ajm	farsanaajmala@gmail.com	2025-05-03 13:09:31	$2y$12$Gj7X4ipPjUxyo36GpmOokeym3y.HOxGAWcCMpaMQYeEfK/p6MvpRa	\N	2025-05-03 13:09:31	2025-05-04 08:10:20	Ajmala	Ajm	971	563869044	\N	\N	\N	\N	1	\N	2	\N	Ajmala	\N	0	1	1		1111	android	eWs6tXmkTna27uZKSPJ_jB:APA91bF3eVwLQNhtVLmLoJRoSt4M19uLKImx8u03GwRPZvA4VLROx4cQcoaNh2uRqJuj7JeUurajfgMnGvl-mGZb5G_IddP6kRyb4gSrQJKllV_HxVbGFYw	\N	201933d8ff64ec5e51d7ddf71bb6291bfd6b8c7f0aacae8abe8203d29d8530ad	-OPLG1eXlTdlNNBKv-1S	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
38	sooraj sabu	8bGMJl8Mh6JmtbL7fAFfE+uZSc8FWyEFtYZ6go9EFyg=	2025-06-03 11:25:14	$2y$12$8AJINYgw8h3EM6Spq03jyu7a0zChTc7ufIrAII8X9IHaoE2iYx2Wi	\N	2025-06-03 11:25:14	2025-06-25 05:56:54	Developer	sam	91	LUQvTQMiFECtjxvnXtdFVg==	1	\N	\N	\N	1	\N	2	qrcodes/user_38.png	sooraj117	1750831014685b8fa69004d.png	0	1	1	\N	1111	android	e324cSV9SnmC5J1jJE1mnz:APA91bFAoB3UT4-1jSRKUtaERuRMHDCQszKx-6uXAACMEpEKAVglCHbP5wZNHU8QHcWL-iOIz3IglxjglYPqu1Ob_XwCrxlS6rcAvimAe1J85MAZKBPEGsw	\N	f49d2a698952ed2808cfca6c808d8aa88f8f959f585d319b50cf02961e5ca365	-ORpXSKkAZIZXSWrKn0K	\N	\N	\N	user info	\N	0	0	t	t	t	t	t	t	\N
31	anol navis	anil@dxbusinessgroup.com	2025-05-05 04:52:04	$2y$12$.S0zwwRBKBmy0lXIXMoo6eSTP6/38Q6DWFJd2qf0KK49wACXFlcz.	\N	2025-05-05 04:52:04	2025-06-03 11:33:23	anol	navis	963	123456789	\N	\N	\N	\N	1	\N	2	\N	anil007	\N	0	1	1		1111	android	fR8RO4CcSce4ome5qz6Dyu:APA91bG-Slu1QWsPYrXBaPNF4_GdDDzmFIXmNdOaGa0zGDVN-04ZAgHzRrxVtW2WDL2RsQTz_3eeIjV0EH1tJ4KDQ3gaXVyKcKu1ILGhO8q1OwNB5_YOFEY	\N	073c3a1fa31a2ee6c3dd57a0e5e9a1a1af5b5932dba975059fa6f11c19102ab6	-OPTmMEyAfWh4GTyU9iy	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
34	sooraj sabu	sooraj@qw.com	2025-05-21 07:49:37	$2y$12$QmR3u0Yw0kinWBgO9xzr.eDwCUVqdzpPQwYhzxXOLMM5JUqoJen7u	\N	2025-05-21 07:49:37	2025-05-21 07:49:38	sooraj	sabu	91	785858524	\N	\N	\N	\N	1	\N	2	\N	sooraj123	\N	0	1	1			android	edEM-qqKRJ2DPeoYgB6L2N:APA91bELMR8oPeJL-v_XneJrHptz2QCH02KdRGqhAUbYJNZezXPwNzPIlsp_0IATKmoheElVPbRydCXsW8wluQL0i_X5Kk8WSX8khuNCqH7aKdIrWJGTktI	\N	e218fa81f4ab9f126926289c4faead2f5392efa93c615806282c68b7b82cb470	-OQloRA3fIJAywo9lCFY	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
32	Asad Nazir	asad2@gmail.com	2025-05-05 06:56:47	$2y$12$n.2x7P/UL.1fkSH8ISYD1OMAIqDXtkTnjuCaMMqItqBybp9CxTdpm	\N	2025-05-05 06:56:47	2025-06-03 11:50:59	Asad	Nazir	92	3445151554	1	\N	\N	\N	1	\N	2	qrcodes/user_32.svg	Asadz	profile_pictures/yEV73FCzYPW8pYaxMVQE31K5qjDqkpErVZtdJJGL.jpg	0	1	1			android	cnqTDk0-Q028qWepIU15Yp:APA91bHID7reZBrjTiGFQ2qUPDNkcDWFKUmP8l9DaXpTxzDeZcrvwsqbeDHKs5mZsDQaQacYh-A_u1E3Pu67m7NRAIz150L8EcMif7dtRuOSmBy-o7wBCQM	\N	1045d74ecab7db742dcfb7e083fb858477d9c74a71ff77f7b7cce422dbed4153	-OPUDuDj58BrfiHIe7aA	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
43	sooraj sabu	g/fRZ3Zohnozoz9z0UozaKLfoKBSm5IE5tf4a1EzKQU=	2025-06-04 13:26:36	$2y$12$TKZGBgeqwcf/ZRMFoJ6uIOyrGi/Hm/xZjy.Py1mpBGLUUEF/VbMBS	\N	2025-06-04 13:26:36	2025-06-04 13:26:37	sooraj	sabu	91	AvYBhpP7nbC/HeRcAwIL2g==	5	\N	\N	\N	1	\N	2	\N	sooraj1171	\N	0	1	1	\N	\N	android	fcm_token	\N	dc34623e1d4122e118f77db284819360297e437548ee87cf22ad59d7b2e390b6	-ORv6p7W4RNSZRKP5z_b	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
44	sooraj sabu	vnw0oJS9zsEM4gSisR/k2O9tgF2XHSozq+/CcnFIFdo=	2025-06-04 13:40:28	$2y$12$DiFCEEyjTxoAvK2LLAY.fuMrvwCg/g64wt5jsU3Ym8rI9ovzUIAvK	\N	2025-06-04 13:40:28	2025-06-04 13:40:28	sooraj	sabu	91	v35MMpkEyH5zviAMcFFtQQ==	5	\N	\N	\N	1	\N	2	\N	sooraj11711	\N	0	1	1	\N	\N	android	fcm_token	\N	afaecc8b4fcac238b8e534b136d8b405257b8ee6ec586a6b09ef8cbdb2f3f977	-ORvA-0H2sL5hv_4JnPf	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
35	Sabeeh Shah k	0	2025-06-04 13:27:49	$2y$12$naa8N3MYNAo4e7nTLhuo8eyhypMz0wTyf8Y9.sA71EoTyE7c5hrne	\N	2025-05-22 11:17:12	2025-06-04 13:27:50	Sabeeh Shah	k	971	0	1	\N	\N	\N	1	\N	2	\N	shahsabeehff	\N	0	1	1			android	123123q	\N	63fa642f9365e5d4e42de0b1295cd3cd0f24b6d5b230827e841eb7f28dd041a6	-OQrhXZF2WDTl5S3KmP4	\N	\N	\N	hello	\N	0	0	t	t	t	t	t	t	\N
45	sooraj sabu	sooraj117411@yopmail.com	2025-06-04 13:54:57	$2y$12$JxR9AlF.Os4UhZBqSBx6iOZO4SeAAF9nRvt0Xicngtj78kuITlXEu	\N	2025-06-04 13:54:57	2025-06-07 09:18:56	sooraj	sabu	91	984782379114	\N	\N	\N	\N	1	\N	2	\N	sooraj117114	\N	0	1	1			android	cKkO2dG1R4Gr2Jl6SEaKEu:APA91bFABZmq4Ivw9_j8O1HqXYYbMynxf8Hmldbh5vAvOAbcuz2jdvTfvGE2JeVYyAciOZsyyhoHPQvE3FKxVw8raJw0Ke9GdFFiLtZeeu-HWQntMhSu7sg	\N	fa141da1abec4a18baeb67b758cf6ea992c7ed31ea5c30ea84ad349842a0367b	-ORvDJFCJYbKAmXqKiNr	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
39	test dev two	lBi5yjmwhlxrKgsXrl0kdw==	2025-06-04 04:42:34	$2y$12$bWDt2qjBPuDHMKLHHVlM3u.qFDdBcmFe1D1MqVL6lbL8.d.vDM6ZO	\N	2025-06-04 04:42:34	2025-06-05 12:44:42	test dev	two	971	lBi5yjmwhlxrKgsXrl0kdw==	0	\N	\N	\N	1	\N	\N	\N	testdev2	\N	0	1	1	\N	1111	android	chHzo4qUSyaCpwARK8xzJ2:APA91bEZiBW681Qu5WS9RFRjG1ZLlxmQ2RacoxNvZtei7399bhwMH3-_RtDDP4B0e80QH0qv6j7hggNB8X2khWm93eYx3FQxtFmOGehz-NFNKUuhodDbZTQ	\N	6467e62c5cb2efedb7a00c6bfe905903ac422eaf61c654f79c91af6f72633ba3	-ORtEsbHAnhifNMduVc9	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
37	Dev Test	test@gmail.com	\N	$2y$12$Q3iT5HuwXji1ptyfCdwRruGQHUU2s2kibjBl.97P5i6heSZnmpCv.	\N	2025-06-02 05:11:34	2025-06-11 13:32:57	Dev	Test one	\N	\N	1	\N	\N	\N	1	\N	\N	qrcodes/user_37.svg	testdev	174964655568497cdb1d4b2.	0	0	0	\N	1111	android	chHzo4qUSyaCpwARK8xzJ2:APA91bEZiBW681Qu5WS9RFRjG1ZLlxmQ2RacoxNvZtei7399bhwMH3-_RtDDP4B0e80QH0qv6j7hggNB8X2khWm93eYx3FQxtFmOGehz-NFNKUuhodDbZTQ	\N	e4f985db219879a598f0d8b01b25bce896a685024f7c6927cd24061959c5f1bb	-ORy_6hwCROoxyR2IvaJ	\N	\N	\N	Boi my	\N	0	0	t	t	t	t	t	t	\N
46	dev three test	testdev@gmail.com	2025-06-05 05:51:51	$2y$12$MgtOhloM7.MwGR7XIdON7O/0Rp2DMxmwFkt8nofyw8kWRe9rJCbYO	\N	2025-06-05 05:51:51	2025-06-11 10:04:19	dev three	test	963	kWVBwWjrSng7Qha7vMCxBw==	1	\N	\N	\N	1	\N	2	qrcodes/user_46.svg	testdevthree	174963410968494c3dcecbd.jpg	0	1	1	\N	\N	android	chHzo4qUSyaCpwARK8xzJ2:APA91bEZiBW681Qu5WS9RFRjG1ZLlxmQ2RacoxNvZtei7399bhwMH3-_RtDDP4B0e80QH0qv6j7hggNB8X2khWm93eYx3FQxtFmOGehz-NFNKUuhodDbZTQ	\N	\N	-ORydKNGmGsYugbZXVXa	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
51	anil nabis	Srjsh2H8+uvuwvzSZt4G0g==	2025-06-10 06:29:33	$2y$12$DIrIfgJApGO4BSbSMqWntO5o0e7LQH65uldAQqyvRTIzG.hASunTm	\N	2025-06-10 06:29:33	2025-06-10 07:46:10	anil	nabis	971	5rwaZ/NkJAdc9P+ERij+yw==	1	\N	\N	\N	1	\N	2	\N	navis007	\N	0	1	1	\N	\N	android	eGzTAoZARCeeqO_Swa5UIi:APA91bEBxz6KEEDA7hQMy_cmtZFfXHh6EbkaYVv-kw1VMpIIdwQg-jkfWK8uuyarmuSBVoLClns8BtCo5x1n6s5OEIU3q41wkoAXPHhAiRUiJG5tmqO2yVg	\N	\N	-OSNWuQCUrk6dAsi-u2P	\N	\N	\N	tu hi babakutty hai kya aap ko bhi hai kya aap ko bhi hai kya aap ko bhi hai kya aap ko bhi hai kya aap ko bhi hai kya	\N	0	0	t	t	t	t	t	t	\N
48	Anil navis	Aq9asMLfvT1II5ETJ8ouSiFCEE8r0KoW7OTmYtv7GNk=	2025-06-06 09:28:19	$2y$12$zKKEjj7D5R3SGYaKzmv.vu74MguNAEdMC2jtUNVKrXN8WRMrQWgfm	\N	2025-06-06 09:28:19	2025-06-07 06:36:21	Anil	navis	971	/+8VyF4IcEns9J+y3+aAug==	1	\N	\N	\N	1	\N	2	\N	anil1971	\N	0	1	1	\N	\N	android	cKkO2dG1R4Gr2Jl6SEaKEu:APA91bFABZmq4Ivw9_j8O1HqXYYbMynxf8Hmldbh5vAvOAbcuz2jdvTfvGE2JeVYyAciOZsyyhoHPQvE3FKxVw8raJw0Ke9GdFFiLtZeeu-HWQntMhSu7sg	\N	e0ee36ac4cb28c07115b3b487696eb180eb453d840ed70901f58cc1fe12e7795	-OS3ZT69Jsc0coHuHIS-	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
49	akio nahis	lKjqZVB2RJNXor/yTu0/Bra/FlwI/wExtUpY1l4RywU=	2025-06-07 09:41:24	$2y$12$Q/Er2MK6yBeW3We38l9PVeLNiTMunVnHId6O3HCMhb5a0/wJUXPyW	\N	2025-06-07 09:41:24	2025-06-07 09:41:24	akio	nahis	971	xS7h+n6N+wn38bds6uJ1LQ==	1	\N	\N	\N	1	\N	2	\N	anil1972	\N	0	1	1	\N	\N	android	cKkO2dG1R4Gr2Jl6SEaKEu:APA91bFABZmq4Ivw9_j8O1HqXYYbMynxf8Hmldbh5vAvOAbcuz2jdvTfvGE2JeVYyAciOZsyyhoHPQvE3FKxVw8raJw0Ke9GdFFiLtZeeu-HWQntMhSu7sg	\N	871a90e5ade11b631ba54974b66ab3335d353a2621e2f62143d4356d96292572	-OS8l2I0Hmsd0lwdX8RB	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
50	sooraj sabu	Sdr/7Mfq8Q5RVaiCJGgGBXX7OnlxE5iYtNM8sQS/EyY=	2025-06-09 12:19:44	$2y$12$3k7ivg9qs1vT/upNceNdGO0YCD04b54PJg6NQ7ywUTmpFpOB8y/kq	\N	2025-06-09 12:19:44	2025-06-09 12:21:44	sooraj	sabu	971	UG925Iqsh3w36/q7Mwknvg==	5	\N	\N	\N	1	\N	2	\N	sooraj166	\N	0	1	1	\N	\N	ios	token	\N	7623c076e4744de96ffad9a1b7a2ec90521a2a140f46e0e9947f3ae62a248602	-OSJcTKIktNnw5NcYUg1	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
54	anil navis	+/ArAJTh46MNh0O1AyuAKt1uWr9RqJLoTAas6ammgCY=	2025-06-12 03:55:24	$2y$12$IZE6mcqXXvTrC.8N6jbftuHjSRn9hYooRClKlyRsubCcQeA6GS0KG	\N	2025-06-12 03:55:24	2025-06-12 03:57:16	anil	navis	971	sqv4n1YWAiNPOtdkFdpiFQ==	1	\N	\N	\N	1	\N	2	qrcodes/user_54.svg	anil008	1749700635684a501bc8f5e.	0	1	1	\N	\N	android	eoDtFbGbQCm6JveFTd2CuO:APA91bGwyGR4zYpR7EWMdC544bmjIQnFQu7RLf8lvcgLyrp4zykPXwHdi-UGOZE4wO-6Gglh501kxtx6JfSMPuxMyDQQT-qOCORGJ2eVNffQoF3kvB9F4hw	\N	b18bdf90a285e34f191f1d12f9f48e9b92921a66eec154d8610126ef333e47b5	-OSXGnraTd_cnokTgqBE	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
52	testdevf four	testdevfour@gmail.com	2025-06-11 07:56:35	$2y$12$bGNz.nHHep7QAUE.Upy1ueMK7IbmcyyDtOS2icRAtlU.JQ2j70nqO	\N	2025-06-11 07:56:35	2025-06-11 13:32:39	testdevf	four	963	ewpPnM8v3xveNpYcVn+GEg==	1	\N	\N	\N	1	\N	2	qrcodes/user_52.svg	testdevfour	\N	0	1	1	\N	\N	android	chHzo4qUSyaCpwARK8xzJ2:APA91bEZiBW681Qu5WS9RFRjG1ZLlxmQ2RacoxNvZtei7399bhwMH3-_RtDDP4B0e80QH0qv6j7hggNB8X2khWm93eYx3FQxtFmOGehz-NFNKUuhodDbZTQ	\N	\N	-OSSzQ1bYwLAhTLc3wmk	\N	\N	\N	\N	1749641650	0	0	t	t	t	t	t	t	\N
47	test dev two	tees@gmail.com	2025-06-05 12:42:23	$2y$12$M/b2RIodJi.R4qY8ZM15duFGUxI8vQR2vF/i3D8FkmMn.UYUWpYn6	\N	2025-06-05 12:42:23	2025-06-11 08:46:01	test dev	two	963	83O9V1FGoczwAEkudYvnqg==	1	\N	\N	\N	1	\N	2	qrcodes/user_47.svg	testdevtwo	174962955868493a766f386.jpeg	0	1	1	\N	\N	android	token	\N	938c62643f8bbf1a0bdeb3d6725ad9df2c85dc3085377610940ef7f4173686f5	-OS-6Hzk52Mk5nTVaEFd	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
58	Ameera Raza	foXIZPuDFn8PUJCJ29eah8iMJ0VrpdN0y9u4a9+t0TA=	2025-06-18 12:10:05	$2y$12$Zvdv7gtRQPoOVcPa1HUUvukAebYAwGIalrZT1TVSxu.97jS7I8Rq.	\N	2025-06-18 12:10:05	2025-06-23 12:56:55	Ameera	Raza	963	nQqEtDv+1Re0nT6XKjy1IQ==	136	\N	\N	\N	1	\N	2	qrcodes/user_58.svg	ameera	17506620336858fb91736b3.	0	1	1	\N	\N	android	dcPgJ5MwSFWOSMKWmNz5Hi:APA91bG3rFMzOU3Gowrum6OowQzXSfGUFZ4Q0ooRSrAraZIUBiYn-uDTs1svummDkFaMy3p475aaFQoctVn_DT747z7XN68BlzGVQZtzb014zOrneVNZ79k	\N	\N	-OT1wZmWBjYatMFEUHwu	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
53	sooraj sabu	1itMpMpib7SiQVW9Uaetf1DdC95hH5cxePOBABnv2Os=	2025-06-11 08:18:03	$2y$12$ME7.6AGEKkQMap4xSmdtlu3nQe4s.y/LqKPQhzZ7tTRH/LQBDVYk6	\N	2025-06-11 08:18:03	2025-06-11 08:18:04	sooraj	sabu	91	qj61vZqRhYjUjz7kfbLm9A==	5	\N	\N	\N	1	\N	2	qrcodes/user_53.svg	sooraj1171514	174962987268493bb00739a.png	0	1	1	\N	\N	android	fcm_token	\N	d5d1f2f4706f7eb08ece5022f64fcde4eb53563fefa33fe2a06a88aa2bfe00b6	-OST3KXo3Fp_oj8KOzt5	\N	\N	\N	\N	1749641793	0	0	t	t	t	t	t	t	\N
55	Hamid Raza	oFc1oH2QrdauaHPrkwIC9ruAeAAYiz7SF+QULoeyeUw=	2025-06-12 03:57:03	$2y$12$53kFz1axQlmwsVhilZhpsOZU7yd6nNN/8j01Pfljdz1SWiSLWwZxm	\N	2025-06-12 03:57:03	2025-06-25 05:58:10	Hamid	Raza	92	gMWilpWH1MF+crkGS2brKQ==	1	\N	\N	\N	1	\N	2	qrcodes/user_55.png	razahamid34	17506622116858fc4397c38.	0	1	1	\N	\N	android	dcPgJ5MwSFWOSMKWmNz5Hi:APA91bG3rFMzOU3Gowrum6OowQzXSfGUFZ4Q0ooRSrAraZIUBiYn-uDTs1svummDkFaMy3p475aaFQoctVn_DT747z7XN68BlzGVQZtzb014zOrneVNZ79k	\N	5b5ea12f3b5ec3848041251ee1a36907f3983d416aded1130b373c020c6ac2fc	-OSXHAvfbGQ4FevdIVs1	\N	\N	\N	my bio	\N	0	1	t	t	t	t	t	t	\N
59	Usama Shakeel	ssWfmNQ6V/caXsavbt4Vd0YZiGfqnHPfxEcwx9ok0aY=	2025-06-18 13:33:50	$2y$12$IzeNdF4z9/ASjYka.1OoweVNlCuNYOzKUUG/7xLm.KF1TcpM5DqsG	\N	2025-06-18 13:33:50	2025-06-24 19:29:57	Usama	Shakeel	963	GN4weD3Qy4YN3MbSHCMJWA==	5	\N	\N	\N	1	\N	2	qrcodes/user_59.svg	usama090	\N	0	1	1	\N	\N	android	dQ9aHAjCQUSiPjCEQP52wU:APA91bG_0s-Inr0z-Mx9o_sUeNCdgGlkzCJCF4Z_au6jxYpVHpvyqg8xo4KjKgrRYxF0ujTUvfHiNjuSQB6ZrZfDjKMC5BUjbK49WqGUmUSQ8iPiqaM5BS4	\N	89e738777d4d88eadbb6ec1cbbdad89c29881ac5bb9731fdae2fea203f0d7f8f	-OT2EjbK1m2hSx8CcgLP	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
56	Hamid Raza	3bLqksRZbnXxxN6GA1naFuMxUeUvSQrRXVRIYcgrAgE=	2025-06-13 13:21:48	$2y$12$8byQ6k1we7uLf1YoWORAYOG/U4KeIGHt3sFDOD5nEraVX58xtxKQW	\N	2025-06-13 13:21:48	2025-06-24 14:57:12	Hamid	Raza	963	gMWilpWH1MF+crkGS2brKQ==	136	\N	\N	\N	1	\N	2	qrcodes/user_56.svg	razahamd34	1749821782684c2956b69ec.	0	1	1	\N	\N	android	feFkYzxER4Sn-WfeHAk445:APA91bFaF5Iuvd1xbfBUm0-j7ooGai0dfhQHw8MjTaxjvVo8OPDVr2dyuetfBTGrKkuqzdSMY6_5VXR5EWqEOIbZKwLPZFCOQxgK1KKG7DNHjfpEbwZy6xk	\N	dcfdf7db3a30b28de93f9ea338fa8244895a6db4d4d2f202e64dc820f63de62c	-OSdS1cEJhsgb_XrcrjA	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
57	Usama Shakeel	AeC+YScseeNmn1K3SkZVKw==	2025-06-17 07:19:45	$2y$12$tJTEbvN5DTMqeYfbmajMk.ehquUTsvnsUSuWpbFO8wv6DPubh9OHK	\N	2025-06-17 07:19:45	2025-06-18 19:44:10	Usama	Shakeel	971	+5GZR8QNrTDoj35mS4aSjg==	1	\N	\N	\N	1	\N	2	qrcodes/user_57.svg	usama	\N	0	1	1	\N	\N	android	exM4AKjeTo2QueaIAVUY8I:APA91bGRNgduELSKw9w5PwlY45INn0zurV4O1Ck_bFR5anGxgGLF_h8fIqE5YXcmqzyd95bkGhW9PeURyvKK3HsZLccrWjQ4wkmCaKFGOjyl-stl5eXU5ho	\N	\N	-OSwkX6Nl2V70LSJISr0	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
61	anil nahis	4qF8P7i30wGkMwmW4kjMXvl75kRWQLZloi1mdWHtZZY=	2025-06-19 08:55:15	$2y$12$IUKCbJFlUDvWiQ7qx79MBOAe1QxiKAT9ocT5/3sdW9ojMjuNz887a	\N	2025-06-19 08:55:15	2025-06-25 03:03:09	anil	nahis	963	Vq+R3ghDUbLDLnx72rWw5g==	1	\N	\N	\N	1	\N	2	qrcodes/user_61.svg	anil73	175067497168592e1b7b5f4.	0	1	1	\N	\N	android	fB3q7wN0RxGUuEiS_8Tk3o:APA91bEnIDBhFRzlt1Xf0zpphtSwwSpF7D19kxotgLdvrd-KzKXHhm2cpmmEB-rBivmLjySNo4Vo5gpjHEx2YXrx1yVpA0XKIfZ8i4tf2r9J08V7Xs-sevE	\N	a5ff8d5fd34414a979cc57749dce5a55480890f01385463f5551dcc8329d4e1e	-OT6OZLHnZYW2TIPcYay	\N	\N	\N	\N	\N	0	0	t	t	t	f	t	t	\N
60	Usama Shakeel	af9UtcyKSRo+nfytRipO6NQlq43Qfx8qQzzOnKZoLSA=	2025-06-19 06:19:31	$2y$12$J.MHzrJXc6k9oywesT/eT.rAwByAax1rSiC.IiFGqPEP9ZsyWVF0O	\N	2025-06-19 06:19:31	2025-06-24 20:19:00	Usama	Shakeel	963	Vgv7/LPVxNmv3OkpcrGwdQ==	136	\N	\N	\N	1	\N	2	qrcodes/user_60.svg	usama007	1750765767685a90c75c6fb.	0	1	1	\N	\N	android	cCFy3UzrQJOnrji5isBS46:APA91bFaoZMsw8OwFMooS82wcTd_9rJpkRPj7LQ2LmWPMwlV6IKBtiChgT4DTa47Rm1gTfqOO85Nw1u-AiW-sjP6RFKd4H5_h9ZagGnvWWmYoowgzfiDVQ0	\N	8b32b4e57f295a4aec64ad6d48cbebf3f77498b7112b0ac91bc3727637daaa35	-OT5pv7N6C809Lw217Lt	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
62	Ayesha Tariq	mLJknRzRiHvcMENRR4EczI0/bjs22gftNI+x559QMBo=	2025-06-19 11:59:36	$2y$12$5dVjtdINudWJ7XrZNEQ0wOaBFbNQ4SIl6r5m8JTUWYzIafKMBqMsW	\N	2025-06-19 11:59:36	2025-06-25 05:55:14	Ayesha	Tariq	971	yLvuaQADQ1vJCp27/9o+Gg==	1	\N	\N	\N	1	\N	2	qrcodes/user_62.svg	Ayesha	17503346766853fcd498b8e.	0	1	1	\N	\N	android	eHSzfySxQYqnSAZqsItQHu:APA91bFBrTpEzXbcib5PCF4vFECgaTiIvn8Bp3GA1tF3GUrRQKoJciyQWqFI58BhZ3HkdNtOdiaRWJCHWnyWtl6saEeh5gvhoQaj0lrYQqOa81d8RaKyb-I	\N	197bc0cb067845f5a9c3bc0b4b0dedb2a5c13bcce0bec93f783a483ebfc8722e	-OT72kv7G74fgLbABXKT	\N	\N	\N	Aish\nNedian\nUAE😌	\N	0	0	t	t	t	t	t	t	\N
63	Leena Meetha	CRAXFDzaghbUgv8fwrCjIA==	2025-06-19 12:15:40	$2y$12$ddgbECVJ7LDQtNyIJ38Peu4mY97khbkZcN0hREBSGeKoGyM7k5n/y	\N	2025-06-19 12:15:40	2025-06-25 06:00:05	Leena	Meetha	971	LJoukgTf5ISLfA69Vomjww==	136	\N	\N	\N	1	\N	2	qrcodes/user_63.svg	Leena	175033690368540587d06f3.	0	1	1	\N	\N	android	cVIlPnNZQ6-lMLop3wOgUl:APA91bEnMmq7TG1ZaNL_PDqSghRNHTVc02wvq9zfMNEmhNqnHvoD17ROep8am0SxL460D-qOA6DYSv6a_craJ_bUC0_Ppr_B2XtkIYQVEDAaBH5-4ootlbE	\N	2aa3fd54bf87c7014624703e2fe719ccf5f39b9643b65c8bd7478eedb38b1a6d	-OT76RA8KAfo57d-_ulU	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
64	anil navis	L5wfjZjm8MkZ/tCzo+zWoA==	2025-06-24 09:49:50	$2y$12$yf6Ka8tptfd/Vfq8raZXmekbIzCETB6YnsTCh9fdwqx7YChOgbnES	\N	2025-06-24 09:49:50	2025-06-24 10:57:34	anil	navis	971	oL5Pszpp4DNgNU5g7tdCwQ==	1	\N	\N	\N	1	\N	2	qrcodes/user_64.svg	noon007	\N	0	1	1	\N	\N	android	d6Af6TtNReamD935kSrxSp:APA91bGZt0OLUv5fC2XiyB4b92YeCQIvlw-P2DeV4ixg602V7L3ScI8MpCpLnzBQTAbmJMWBQeHfzNQuFWLe0pEWVfIyWUrJ3EOZTZbi_tCkw0VeEZNfCtQ	\N	\N	-OTWL-jya90x58df4eHo	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N
\.


--
-- Name: activity_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_log_id_seq', 602, true);


--
-- Name: block_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.block_users_id_seq', 9, true);


--
-- Name: bookmarks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookmarks_id_seq', 41, true);


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

SELECT pg_catalog.setval('public.checklists_id_seq', 117, true);


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
-- Name: contact_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_details_id_seq', 1, true);


--
-- Name: cost_breakdown_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cost_breakdown_items_id_seq', 151, true);


--
-- Name: cost_breakdowns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cost_breakdowns_id_seq', 87, true);


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

SELECT pg_catalog.setval('public.est_person_cost_journeys_id_seq', 49, true);


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
-- Name: follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.follows_id_seq', 109, true);


--
-- Name: itineraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.itineraries_id_seq', 229, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: journey_participants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journey_participants_id_seq', 79, true);


--
-- Name: journeys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journeys_id_seq', 48, true);


--
-- Name: marked_check_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marked_check_lists_id_seq', 50, true);


--
-- Name: media_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_files_id_seq', 23, true);


--
-- Name: medias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medias_id_seq', 10, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 113, true);


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

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 303, true);


--
-- Name: personals_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personals_access_tokens_id_seq', 1, false);


--
-- Name: poll_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.poll_options_id_seq', 1, false);


--
-- Name: poll_votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.poll_votes_id_seq', 39, true);


--
-- Name: polls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.polls_id_seq', 1, false);


--
-- Name: post_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_comments_id_seq', 51, true);


--
-- Name: post_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_files_id_seq', 71, true);


--
-- Name: post_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_likes_id_seq', 120, true);


--
-- Name: post_poll_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_poll_options_id_seq', 40, true);


--
-- Name: post_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_reports_id_seq', 11, true);


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

SELECT pg_catalog.setval('public.posts_id_seq', 143, true);


--
-- Name: push_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.push_requests_id_seq', 101, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);


--
-- Name: target_types_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.target_types_company_id_seq', 1, false);


--
-- Name: target_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.target_types_id_seq', 1, false);


--
-- Name: temp_check_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_check_lists_id_seq', 91, true);


--
-- Name: temp_cost_break_downs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_cost_break_downs_id_seq', 1, false);


--
-- Name: temp_itineraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_itineraries_id_seq', 149, true);


--
-- Name: temp_journeys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_journeys_id_seq', 92, true);


--
-- Name: temp_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_users_id_seq', 58, true);


--
-- Name: user_activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_activities_id_seq', 564, true);


--
-- Name: user_loged_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_loged_devices_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 64, true);


--
-- Name: activity_log activity_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_log
    ADD CONSTRAINT activity_log_pkey PRIMARY KEY (id);


--
-- Name: block_users block_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.block_users
    ADD CONSTRAINT block_users_pkey PRIMARY KEY (id);


--
-- Name: bookmarks bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_pkey PRIMARY KEY (id);


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
-- Name: contact_details contact_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_details
    ADD CONSTRAINT contact_details_pkey PRIMARY KEY (id);


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
-- Name: follows follows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (id);


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
-- Name: marked_check_lists marked_check_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marked_check_lists
    ADD CONSTRAINT marked_check_lists_pkey PRIMARY KEY (id);


--
-- Name: media_files media_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_files
    ADD CONSTRAINT media_files_pkey PRIMARY KEY (id);


--
-- Name: medias medias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medias
    ADD CONSTRAINT medias_pkey PRIMARY KEY (id);


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
-- Name: poll_votes poll_votes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poll_votes
    ADD CONSTRAINT poll_votes_pkey PRIMARY KEY (id);


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
-- Name: post_files post_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_files
    ADD CONSTRAINT post_files_pkey PRIMARY KEY (id);


--
-- Name: post_likes post_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_likes
    ADD CONSTRAINT post_likes_pkey PRIMARY KEY (id);


--
-- Name: post_poll_options post_poll_options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_poll_options
    ADD CONSTRAINT post_poll_options_pkey PRIMARY KEY (id);


--
-- Name: post_reports post_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_reports
    ADD CONSTRAINT post_reports_pkey PRIMARY KEY (id);


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
-- Name: push_requests push_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_requests
    ADD CONSTRAINT push_requests_pkey PRIMARY KEY (id);


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
-- Name: temp_check_lists temp_check_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_check_lists
    ADD CONSTRAINT temp_check_lists_pkey PRIMARY KEY (id);


--
-- Name: temp_cost_break_downs temp_cost_break_downs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_cost_break_downs
    ADD CONSTRAINT temp_cost_break_downs_pkey PRIMARY KEY (id);


--
-- Name: temp_itineraries temp_itineraries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_itineraries
    ADD CONSTRAINT temp_itineraries_pkey PRIMARY KEY (id);


--
-- Name: temp_journeys temp_journeys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_journeys
    ADD CONSTRAINT temp_journeys_pkey PRIMARY KEY (id);


--
-- Name: temp_users temp_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users
    ADD CONSTRAINT temp_users_pkey PRIMARY KEY (id);


--
-- Name: user_activities user_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activities
    ADD CONSTRAINT user_activities_pkey PRIMARY KEY (id);


--
-- Name: user_loged_devices user_loged_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_loged_devices
    ADD CONSTRAINT user_loged_devices_pkey PRIMARY KEY (id);


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
-- Name: idx_post_poll_votes_post_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_post_poll_votes_post_id ON public.poll_votes USING btree (post_id);


--
-- Name: idx_post_poll_votes_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_post_poll_votes_user_id ON public.poll_votes USING btree (user_id);


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
-- Name: bookmarks bookmarks_journey_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_journey_id_foreign FOREIGN KEY (journey_id) REFERENCES public.journeys(id) ON DELETE SET NULL;


--
-- Name: bookmarks bookmarks_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: events events_event_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_event_type_id_foreign FOREIGN KEY (event_type_id) REFERENCES public.event_types(id) ON DELETE CASCADE;


--
-- Name: follows follows_followed_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_followed_id_foreign FOREIGN KEY (followed_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: follows follows_follower_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_follower_id_foreign FOREIGN KEY (follower_id) REFERENCES public.users(id) ON DELETE CASCADE;


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

