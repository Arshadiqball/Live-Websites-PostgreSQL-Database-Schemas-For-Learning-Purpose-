--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.0

-- Started on 2025-08-02 18:03:06

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
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 282 (class 1259 OID 1166907)
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
-- TOC entry 281 (class 1259 OID 1166906)
-- Name: activity_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activity_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.activity_log_id_seq OWNER TO postgres;

--
-- TOC entry 5509 (class 0 OID 0)
-- Dependencies: 281
-- Name: activity_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activity_log_id_seq OWNED BY public.activity_log.id;


--
-- TOC entry 330 (class 1259 OID 1167146)
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
-- TOC entry 329 (class 1259 OID 1167145)
-- Name: block_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.block_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.block_users_id_seq OWNER TO postgres;

--
-- TOC entry 5510 (class 0 OID 0)
-- Dependencies: 329
-- Name: block_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.block_users_id_seq OWNED BY public.block_users.id;


--
-- TOC entry 316 (class 1259 OID 1167064)
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
-- TOC entry 315 (class 1259 OID 1167063)
-- Name: bookmarks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bookmarks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookmarks_id_seq OWNER TO postgres;

--
-- TOC entry 5511 (class 0 OID 0)
-- Dependencies: 315
-- Name: bookmarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bookmarks_id_seq OWNED BY public.bookmarks.id;


--
-- TOC entry 221 (class 1259 OID 1166570)
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 1166577)
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 1166733)
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
-- TOC entry 5512 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN challenges.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.challenges.user_id IS 'to understand whom is created';


--
-- TOC entry 5513 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN challenges.challenge_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.challenges.challenge_type IS '1 for all, 2 for company, 3 for individual';


--
-- TOC entry 5514 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN challenges.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.challenges.status IS '1 for active, 0 for inactive';


--
-- TOC entry 252 (class 1259 OID 1166741)
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
-- TOC entry 251 (class 1259 OID 1166740)
-- Name: challenges_companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.challenges_companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.challenges_companies_id_seq OWNER TO postgres;

--
-- TOC entry 5515 (class 0 OID 0)
-- Dependencies: 251
-- Name: challenges_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.challenges_companies_id_seq OWNED BY public.challenges_companies.id;


--
-- TOC entry 249 (class 1259 OID 1166732)
-- Name: challenges_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.challenges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.challenges_id_seq OWNER TO postgres;

--
-- TOC entry 5516 (class 0 OID 0)
-- Dependencies: 249
-- Name: challenges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.challenges_id_seq OWNED BY public.challenges.id;


--
-- TOC entry 270 (class 1259 OID 1166838)
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
-- TOC entry 269 (class 1259 OID 1166837)
-- Name: checklists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.checklists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.checklists_id_seq OWNER TO postgres;

--
-- TOC entry 5517 (class 0 OID 0)
-- Dependencies: 269
-- Name: checklists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.checklists_id_seq OWNED BY public.checklists.id;


--
-- TOC entry 244 (class 1259 OID 1166710)
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
-- TOC entry 243 (class 1259 OID 1166709)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cities_id_seq OWNER TO postgres;

--
-- TOC entry 5518 (class 0 OID 0)
-- Dependencies: 243
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- TOC entry 258 (class 1259 OID 1166771)
-- Name: cms_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cms_pages (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    content text,
    status character varying(255) DEFAULT 'Draft'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT cms_pages_status_check CHECK (((status)::text = ANY ((ARRAY['Draft'::character varying, 'Published'::character varying, 'Scheduled'::character varying])::text[])))
);


ALTER TABLE public.cms_pages OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 1166770)
-- Name: cms_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cms_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cms_pages_id_seq OWNER TO postgres;

--
-- TOC entry 5519 (class 0 OID 0)
-- Dependencies: 257
-- Name: cms_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cms_pages_id_seq OWNED BY public.cms_pages.id;


--
-- TOC entry 231 (class 1259 OID 1166627)
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
-- TOC entry 230 (class 1259 OID 1166626)
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.companies_id_seq OWNER TO postgres;

--
-- TOC entry 5520 (class 0 OID 0)
-- Dependencies: 230
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- TOC entry 320 (class 1259 OID 1167100)
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
-- TOC entry 319 (class 1259 OID 1167099)
-- Name: contact_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_details_id_seq OWNER TO postgres;

--
-- TOC entry 5521 (class 0 OID 0)
-- Dependencies: 319
-- Name: contact_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_details_id_seq OWNED BY public.contact_details.id;


--
-- TOC entry 290 (class 1259 OID 1166942)
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
-- TOC entry 289 (class 1259 OID 1166941)
-- Name: cost_breakdown_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cost_breakdown_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cost_breakdown_items_id_seq OWNER TO postgres;

--
-- TOC entry 5522 (class 0 OID 0)
-- Dependencies: 289
-- Name: cost_breakdown_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cost_breakdown_items_id_seq OWNED BY public.cost_breakdown_items.id;


--
-- TOC entry 288 (class 1259 OID 1166933)
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
-- TOC entry 287 (class 1259 OID 1166932)
-- Name: cost_breakdowns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cost_breakdowns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cost_breakdowns_id_seq OWNER TO postgres;

--
-- TOC entry 5523 (class 0 OID 0)
-- Dependencies: 287
-- Name: cost_breakdowns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cost_breakdowns_id_seq OWNED BY public.cost_breakdowns.id;


--
-- TOC entry 240 (class 1259 OID 1166696)
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
    description text,
    iso_code character varying(255)
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 5524 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN countries.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.countries.status IS '0: Inactive, 1: Active';


--
-- TOC entry 5525 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN countries.dial_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.countries.dial_code IS 'Country dialing code';


--
-- TOC entry 239 (class 1259 OID 1166695)
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.countries_id_seq OWNER TO postgres;

--
-- TOC entry 5526 (class 0 OID 0)
-- Dependencies: 239
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- TOC entry 242 (class 1259 OID 1166703)
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
-- TOC entry 241 (class 1259 OID 1166702)
-- Name: emirates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emirates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.emirates_id_seq OWNER TO postgres;

--
-- TOC entry 5527 (class 0 OID 0)
-- Dependencies: 241
-- Name: emirates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emirates_id_seq OWNED BY public.emirates.id;


--
-- TOC entry 292 (class 1259 OID 1166951)
-- Name: est_person_cost_journeys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.est_person_cost_journeys (
    id bigint NOT NULL,
    journey_id bigint NOT NULL,
    price_range character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    total_cost double precision DEFAULT '0'::double precision NOT NULL
);


ALTER TABLE public.est_person_cost_journeys OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 1166950)
-- Name: est_person_cost_journeys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.est_person_cost_journeys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.est_person_cost_journeys_id_seq OWNER TO postgres;

--
-- TOC entry 5528 (class 0 OID 0)
-- Dependencies: 291
-- Name: est_person_cost_journeys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.est_person_cost_journeys_id_seq OWNED BY public.est_person_cost_journeys.id;


--
-- TOC entry 256 (class 1259 OID 1166763)
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
-- TOC entry 255 (class 1259 OID 1166762)
-- Name: event_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_types_id_seq OWNER TO postgres;

--
-- TOC entry 5529 (class 0 OID 0)
-- Dependencies: 255
-- Name: event_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_types_id_seq OWNED BY public.event_types.id;


--
-- TOC entry 262 (class 1259 OID 1166792)
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
    CONSTRAINT events_status_check CHECK (((status)::text = ANY ((ARRAY['0'::character varying, '1'::character varying])::text[])))
);


ALTER TABLE public.events OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 1166791)
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.events_id_seq OWNER TO postgres;

--
-- TOC entry 5530 (class 0 OID 0)
-- Dependencies: 261
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- TOC entry 227 (class 1259 OID 1166602)
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
-- TOC entry 226 (class 1259 OID 1166601)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 5531 (class 0 OID 0)
-- Dependencies: 226
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 260 (class 1259 OID 1166782)
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
-- TOC entry 259 (class 1259 OID 1166781)
-- Name: faqs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.faqs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.faqs_id_seq OWNER TO postgres;

--
-- TOC entry 5532 (class 0 OID 0)
-- Dependencies: 259
-- Name: faqs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faqs_id_seq OWNED BY public.faqs.id;


--
-- TOC entry 284 (class 1259 OID 1166919)
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
-- TOC entry 283 (class 1259 OID 1166918)
-- Name: followers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.followers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.followers_id_seq OWNER TO postgres;

--
-- TOC entry 5533 (class 0 OID 0)
-- Dependencies: 283
-- Name: followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.followers_id_seq OWNED BY public.followers.id;


--
-- TOC entry 314 (class 1259 OID 1167045)
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
-- TOC entry 5534 (class 0 OID 0)
-- Dependencies: 314
-- Name: COLUMN follows.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.follows.status IS 'pending, approved, rejected';


--
-- TOC entry 313 (class 1259 OID 1167044)
-- Name: follows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.follows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.follows_id_seq OWNER TO postgres;

--
-- TOC entry 5535 (class 0 OID 0)
-- Dependencies: 313
-- Name: follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.follows_id_seq OWNED BY public.follows.id;


--
-- TOC entry 268 (class 1259 OID 1166829)
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
-- TOC entry 267 (class 1259 OID 1166828)
-- Name: itineraries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.itineraries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.itineraries_id_seq OWNER TO postgres;

--
-- TOC entry 5536 (class 0 OID 0)
-- Dependencies: 267
-- Name: itineraries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.itineraries_id_seq OWNED BY public.itineraries.id;


--
-- TOC entry 225 (class 1259 OID 1166594)
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
-- TOC entry 224 (class 1259 OID 1166585)
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
-- TOC entry 223 (class 1259 OID 1166584)
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO postgres;

--
-- TOC entry 5537 (class 0 OID 0)
-- Dependencies: 223
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- TOC entry 286 (class 1259 OID 1166926)
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
-- TOC entry 5538 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN journey_participants.is_approved; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.journey_participants.is_approved IS '1-approved,0-rejected';


--
-- TOC entry 285 (class 1259 OID 1166925)
-- Name: journey_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.journey_participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.journey_participants_id_seq OWNER TO postgres;

--
-- TOC entry 5539 (class 0 OID 0)
-- Dependencies: 285
-- Name: journey_participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journey_participants_id_seq OWNED BY public.journey_participants.id;


--
-- TOC entry 266 (class 1259 OID 1166820)
-- Name: journeys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journeys (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    destination character varying(255),
    accommodation character varying(255),
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
-- TOC entry 265 (class 1259 OID 1166819)
-- Name: journeys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.journeys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.journeys_id_seq OWNER TO postgres;

--
-- TOC entry 5540 (class 0 OID 0)
-- Dependencies: 265
-- Name: journeys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journeys_id_seq OWNED BY public.journeys.id;


--
-- TOC entry 338 (class 1259 OID 1167185)
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
-- TOC entry 337 (class 1259 OID 1167184)
-- Name: marked_check_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.marked_check_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.marked_check_lists_id_seq OWNER TO postgres;

--
-- TOC entry 5541 (class 0 OID 0)
-- Dependencies: 337
-- Name: marked_check_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.marked_check_lists_id_seq OWNED BY public.marked_check_lists.id;


--
-- TOC entry 324 (class 1259 OID 1167120)
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
-- TOC entry 323 (class 1259 OID 1167119)
-- Name: media_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.media_files_id_seq OWNER TO postgres;

--
-- TOC entry 5542 (class 0 OID 0)
-- Dependencies: 323
-- Name: media_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.media_files_id_seq OWNED BY public.media_files.id;


--
-- TOC entry 322 (class 1259 OID 1167110)
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
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.medias OWNER TO postgres;

--
-- TOC entry 321 (class 1259 OID 1167109)
-- Name: medias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.medias_id_seq OWNER TO postgres;

--
-- TOC entry 5543 (class 0 OID 0)
-- Dependencies: 321
-- Name: medias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medias_id_seq OWNED BY public.medias.id;


--
-- TOC entry 216 (class 1259 OID 1166537)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 1166536)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 5544 (class 0 OID 0)
-- Dependencies: 215
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 236 (class 1259 OID 1166658)
-- Name: model_has_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_permissions OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 1166669)
-- Name: model_has_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_roles OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 1166898)
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
-- TOC entry 279 (class 1259 OID 1166897)
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_id_seq OWNER TO postgres;

--
-- TOC entry 5545 (class 0 OID 0)
-- Dependencies: 279
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- TOC entry 246 (class 1259 OID 1166717)
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
-- TOC entry 5546 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN packages.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.packages.status IS '0 - Inactive, 1 - Active';


--
-- TOC entry 248 (class 1259 OID 1166725)
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
-- TOC entry 247 (class 1259 OID 1166724)
-- Name: packages_addons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.packages_addons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.packages_addons_id_seq OWNER TO postgres;

--
-- TOC entry 5547 (class 0 OID 0)
-- Dependencies: 247
-- Name: packages_addons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.packages_addons_id_seq OWNED BY public.packages_addons.id;


--
-- TOC entry 245 (class 1259 OID 1166716)
-- Name: packages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.packages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.packages_id_seq OWNER TO postgres;

--
-- TOC entry 5548 (class 0 OID 0)
-- Dependencies: 245
-- Name: packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.packages_id_seq OWNED BY public.packages.id;


--
-- TOC entry 219 (class 1259 OID 1166554)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 1166637)
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
-- TOC entry 232 (class 1259 OID 1166636)
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissions_id_seq OWNER TO postgres;

--
-- TOC entry 5549 (class 0 OID 0)
-- Dependencies: 232
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- TOC entry 278 (class 1259 OID 1166886)
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
-- TOC entry 277 (class 1259 OID 1166885)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 5550 (class 0 OID 0)
-- Dependencies: 277
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 302 (class 1259 OID 1166991)
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
-- TOC entry 301 (class 1259 OID 1166990)
-- Name: personals_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personals_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personals_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 5551 (class 0 OID 0)
-- Dependencies: 301
-- Name: personals_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personals_access_tokens_id_seq OWNED BY public.personals_access_tokens.id;


--
-- TOC entry 276 (class 1259 OID 1166873)
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
-- TOC entry 275 (class 1259 OID 1166872)
-- Name: poll_options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.poll_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.poll_options_id_seq OWNER TO postgres;

--
-- TOC entry 5552 (class 0 OID 0)
-- Dependencies: 275
-- Name: poll_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.poll_options_id_seq OWNED BY public.poll_options.id;


--
-- TOC entry 328 (class 1259 OID 1167139)
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
-- TOC entry 327 (class 1259 OID 1167138)
-- Name: poll_votes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.poll_votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.poll_votes_id_seq OWNER TO postgres;

--
-- TOC entry 5553 (class 0 OID 0)
-- Dependencies: 327
-- Name: poll_votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.poll_votes_id_seq OWNED BY public.poll_votes.id;


--
-- TOC entry 274 (class 1259 OID 1166864)
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
-- TOC entry 273 (class 1259 OID 1166863)
-- Name: polls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.polls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.polls_id_seq OWNER TO postgres;

--
-- TOC entry 5554 (class 0 OID 0)
-- Dependencies: 273
-- Name: polls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.polls_id_seq OWNED BY public.polls.id;


--
-- TOC entry 298 (class 1259 OID 1166975)
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
-- TOC entry 297 (class 1259 OID 1166974)
-- Name: post_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_comments_id_seq OWNER TO postgres;

--
-- TOC entry 5555 (class 0 OID 0)
-- Dependencies: 297
-- Name: post_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_comments_id_seq OWNED BY public.post_comments.id;


--
-- TOC entry 304 (class 1259 OID 1167003)
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
-- TOC entry 303 (class 1259 OID 1167002)
-- Name: post_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_files_id_seq OWNER TO postgres;

--
-- TOC entry 5556 (class 0 OID 0)
-- Dependencies: 303
-- Name: post_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_files_id_seq OWNED BY public.post_files.id;


--
-- TOC entry 296 (class 1259 OID 1166968)
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
-- TOC entry 295 (class 1259 OID 1166967)
-- Name: post_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_likes_id_seq OWNER TO postgres;

--
-- TOC entry 5557 (class 0 OID 0)
-- Dependencies: 295
-- Name: post_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_likes_id_seq OWNED BY public.post_likes.id;


--
-- TOC entry 326 (class 1259 OID 1167130)
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
-- TOC entry 325 (class 1259 OID 1167129)
-- Name: post_poll_options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_poll_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_poll_options_id_seq OWNER TO postgres;

--
-- TOC entry 5558 (class 0 OID 0)
-- Dependencies: 325
-- Name: post_poll_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_poll_options_id_seq OWNED BY public.post_poll_options.id;


--
-- TOC entry 332 (class 1259 OID 1167157)
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
-- TOC entry 331 (class 1259 OID 1167156)
-- Name: post_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_reports_id_seq OWNER TO postgres;

--
-- TOC entry 5559 (class 0 OID 0)
-- Dependencies: 331
-- Name: post_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_reports_id_seq OWNED BY public.post_reports.id;


--
-- TOC entry 300 (class 1259 OID 1166984)
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
-- TOC entry 299 (class 1259 OID 1166983)
-- Name: post_shares_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_shares_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_shares_id_seq OWNER TO postgres;

--
-- TOC entry 5560 (class 0 OID 0)
-- Dependencies: 299
-- Name: post_shares_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_shares_id_seq OWNED BY public.post_shares.id;


--
-- TOC entry 294 (class 1259 OID 1166958)
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
-- TOC entry 293 (class 1259 OID 1166957)
-- Name: post_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_types_id_seq OWNER TO postgres;

--
-- TOC entry 5561 (class 0 OID 0)
-- Dependencies: 293
-- Name: post_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_types_id_seq OWNED BY public.post_types.id;


--
-- TOC entry 272 (class 1259 OID 1166854)
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
-- TOC entry 271 (class 1259 OID 1166853)
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posts_id_seq OWNER TO postgres;

--
-- TOC entry 5562 (class 0 OID 0)
-- Dependencies: 271
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- TOC entry 334 (class 1259 OID 1167166)
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
-- TOC entry 333 (class 1259 OID 1167165)
-- Name: push_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.push_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.push_requests_id_seq OWNER TO postgres;

--
-- TOC entry 5563 (class 0 OID 0)
-- Dependencies: 333
-- Name: push_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.push_requests_id_seq OWNED BY public.push_requests.id;


--
-- TOC entry 238 (class 1259 OID 1166680)
-- Name: role_has_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_has_permissions OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 1166648)
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
-- TOC entry 234 (class 1259 OID 1166647)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 5564 (class 0 OID 0)
-- Dependencies: 234
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 220 (class 1259 OID 1166561)
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
-- TOC entry 340 (class 1259 OID 1167192)
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
-- TOC entry 339 (class 1259 OID 1167191)
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.settings_id_seq OWNER TO postgres;

--
-- TOC entry 5565 (class 0 OID 0)
-- Dependencies: 339
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- TOC entry 254 (class 1259 OID 1166755)
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
-- TOC entry 264 (class 1259 OID 1166808)
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
-- TOC entry 263 (class 1259 OID 1166807)
-- Name: target_types_company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.target_types_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.target_types_company_id_seq OWNER TO postgres;

--
-- TOC entry 5566 (class 0 OID 0)
-- Dependencies: 263
-- Name: target_types_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.target_types_company_id_seq OWNED BY public.target_types_company.id;


--
-- TOC entry 253 (class 1259 OID 1166754)
-- Name: target_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.target_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.target_types_id_seq OWNER TO postgres;

--
-- TOC entry 5567 (class 0 OID 0)
-- Dependencies: 253
-- Name: target_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.target_types_id_seq OWNED BY public.target_types.id;


--
-- TOC entry 310 (class 1259 OID 1167030)
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
-- TOC entry 309 (class 1259 OID 1167029)
-- Name: temp_check_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_check_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.temp_check_lists_id_seq OWNER TO postgres;

--
-- TOC entry 5568 (class 0 OID 0)
-- Dependencies: 309
-- Name: temp_check_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_check_lists_id_seq OWNED BY public.temp_check_lists.id;


--
-- TOC entry 312 (class 1259 OID 1167037)
-- Name: temp_cost_break_downs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_cost_break_downs (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.temp_cost_break_downs OWNER TO postgres;

--
-- TOC entry 311 (class 1259 OID 1167036)
-- Name: temp_cost_break_downs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_cost_break_downs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.temp_cost_break_downs_id_seq OWNER TO postgres;

--
-- TOC entry 5569 (class 0 OID 0)
-- Dependencies: 311
-- Name: temp_cost_break_downs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_cost_break_downs_id_seq OWNED BY public.temp_cost_break_downs.id;


--
-- TOC entry 308 (class 1259 OID 1167023)
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
-- TOC entry 307 (class 1259 OID 1167022)
-- Name: temp_itineraries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_itineraries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.temp_itineraries_id_seq OWNER TO postgres;

--
-- TOC entry 5570 (class 0 OID 0)
-- Dependencies: 307
-- Name: temp_itineraries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_itineraries_id_seq OWNED BY public.temp_itineraries.id;


--
-- TOC entry 306 (class 1259 OID 1167014)
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
    start_date date,
    end_date date,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    country_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.temp_journeys OWNER TO postgres;

--
-- TOC entry 305 (class 1259 OID 1167013)
-- Name: temp_journeys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_journeys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.temp_journeys_id_seq OWNER TO postgres;

--
-- TOC entry 5571 (class 0 OID 0)
-- Dependencies: 305
-- Name: temp_journeys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_journeys_id_seq OWNED BY public.temp_journeys.id;


--
-- TOC entry 229 (class 1259 OID 1166614)
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
-- TOC entry 228 (class 1259 OID 1166613)
-- Name: temp_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.temp_users_id_seq OWNER TO postgres;

--
-- TOC entry 5572 (class 0 OID 0)
-- Dependencies: 228
-- Name: temp_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_users_id_seq OWNED BY public.temp_users.id;


--
-- TOC entry 318 (class 1259 OID 1167085)
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
-- TOC entry 317 (class 1259 OID 1167084)
-- Name: user_activities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_activities_id_seq OWNER TO postgres;

--
-- TOC entry 5573 (class 0 OID 0)
-- Dependencies: 317
-- Name: user_activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_activities_id_seq OWNED BY public.user_activities.id;


--
-- TOC entry 336 (class 1259 OID 1167176)
-- Name: user_loged_devices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_loged_devices (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    token character varying(255),
    device_name character varying(255),
    last_used_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    device_type character varying(255),
    user_device_token text
);


ALTER TABLE public.user_loged_devices OWNER TO postgres;

--
-- TOC entry 335 (class 1259 OID 1167175)
-- Name: user_loged_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_loged_devices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_loged_devices_id_seq OWNER TO postgres;

--
-- TOC entry 5574 (class 0 OID 0)
-- Dependencies: 335
-- Name: user_loged_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_loged_devices_id_seq OWNED BY public.user_loged_devices.id;


--
-- TOC entry 218 (class 1259 OID 1166544)
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
    is_social character varying(255) DEFAULT '0'::character varying,
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
    email_verified character varying(255) DEFAULT '0'::character varying NOT NULL,
    phone_verified character varying(255) DEFAULT '0'::character varying NOT NULL,
    user_email_otp character varying(255),
    user_phone_otp character varying(255),
    user_device_type character varying(255),
    user_device_token character varying(255),
    trade_license text,
    qr_code character varying(255),
    user_access_token text,
    firebase_user_key text,
    password_reset_code text,
    password_reset_otp text,
    password_reset_time text,
    username character varying(255),
    profile_picture character varying(255),
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
    biometric_token character varying(255),
    destination character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 1166543)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5575 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 5017 (class 2604 OID 1166910)
-- Name: activity_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_log ALTER COLUMN id SET DEFAULT nextval('public.activity_log_id_seq'::regclass);


--
-- TOC entry 5052 (class 2604 OID 1167149)
-- Name: block_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.block_users ALTER COLUMN id SET DEFAULT nextval('public.block_users_id_seq'::regclass);


--
-- TOC entry 5042 (class 2604 OID 1167067)
-- Name: bookmarks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks ALTER COLUMN id SET DEFAULT nextval('public.bookmarks_id_seq'::regclass);


--
-- TOC entry 4990 (class 2604 OID 1166736)
-- Name: challenges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges ALTER COLUMN id SET DEFAULT nextval('public.challenges_id_seq'::regclass);


--
-- TOC entry 4992 (class 2604 OID 1166744)
-- Name: challenges_companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges_companies ALTER COLUMN id SET DEFAULT nextval('public.challenges_companies_id_seq'::regclass);


--
-- TOC entry 5008 (class 2604 OID 1166841)
-- Name: checklists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checklists ALTER COLUMN id SET DEFAULT nextval('public.checklists_id_seq'::regclass);


--
-- TOC entry 4985 (class 2604 OID 1166713)
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- TOC entry 4997 (class 2604 OID 1166774)
-- Name: cms_pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cms_pages ALTER COLUMN id SET DEFAULT nextval('public.cms_pages_id_seq'::regclass);


--
-- TOC entry 4978 (class 2604 OID 1166630)
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- TOC entry 5044 (class 2604 OID 1167103)
-- Name: contact_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_details ALTER COLUMN id SET DEFAULT nextval('public.contact_details_id_seq'::regclass);


--
-- TOC entry 5023 (class 2604 OID 1166945)
-- Name: cost_breakdown_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_breakdown_items ALTER COLUMN id SET DEFAULT nextval('public.cost_breakdown_items_id_seq'::regclass);


--
-- TOC entry 5022 (class 2604 OID 1166936)
-- Name: cost_breakdowns id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_breakdowns ALTER COLUMN id SET DEFAULT nextval('public.cost_breakdowns_id_seq'::regclass);


--
-- TOC entry 4981 (class 2604 OID 1166699)
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- TOC entry 4983 (class 2604 OID 1166706)
-- Name: emirates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emirates ALTER COLUMN id SET DEFAULT nextval('public.emirates_id_seq'::regclass);


--
-- TOC entry 5024 (class 2604 OID 1166954)
-- Name: est_person_cost_journeys id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.est_person_cost_journeys ALTER COLUMN id SET DEFAULT nextval('public.est_person_cost_journeys_id_seq'::regclass);


--
-- TOC entry 4995 (class 2604 OID 1166766)
-- Name: event_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_types ALTER COLUMN id SET DEFAULT nextval('public.event_types_id_seq'::regclass);


--
-- TOC entry 5001 (class 2604 OID 1166795)
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- TOC entry 4971 (class 2604 OID 1166605)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 4999 (class 2604 OID 1166785)
-- Name: faqs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faqs ALTER COLUMN id SET DEFAULT nextval('public.faqs_id_seq'::regclass);


--
-- TOC entry 5018 (class 2604 OID 1166922)
-- Name: followers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.followers ALTER COLUMN id SET DEFAULT nextval('public.followers_id_seq'::regclass);


--
-- TOC entry 5040 (class 2604 OID 1167048)
-- Name: follows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follows ALTER COLUMN id SET DEFAULT nextval('public.follows_id_seq'::regclass);


--
-- TOC entry 5007 (class 2604 OID 1166832)
-- Name: itineraries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itineraries ALTER COLUMN id SET DEFAULT nextval('public.itineraries_id_seq'::regclass);


--
-- TOC entry 4970 (class 2604 OID 1166588)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 5019 (class 2604 OID 1166929)
-- Name: journey_participants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journey_participants ALTER COLUMN id SET DEFAULT nextval('public.journey_participants_id_seq'::regclass);


--
-- TOC entry 5005 (class 2604 OID 1166823)
-- Name: journeys id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journeys ALTER COLUMN id SET DEFAULT nextval('public.journeys_id_seq'::regclass);


--
-- TOC entry 5056 (class 2604 OID 1167188)
-- Name: marked_check_lists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marked_check_lists ALTER COLUMN id SET DEFAULT nextval('public.marked_check_lists_id_seq'::regclass);


--
-- TOC entry 5048 (class 2604 OID 1167123)
-- Name: media_files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_files ALTER COLUMN id SET DEFAULT nextval('public.media_files_id_seq'::regclass);


--
-- TOC entry 5046 (class 2604 OID 1167113)
-- Name: medias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medias ALTER COLUMN id SET DEFAULT nextval('public.medias_id_seq'::regclass);


--
-- TOC entry 4956 (class 2604 OID 1166540)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 5016 (class 2604 OID 1166901)
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- TOC entry 4987 (class 2604 OID 1166720)
-- Name: packages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages ALTER COLUMN id SET DEFAULT nextval('public.packages_id_seq'::regclass);


--
-- TOC entry 4989 (class 2604 OID 1166728)
-- Name: packages_addons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages_addons ALTER COLUMN id SET DEFAULT nextval('public.packages_addons_id_seq'::regclass);


--
-- TOC entry 4979 (class 2604 OID 1166640)
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- TOC entry 5015 (class 2604 OID 1166889)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 5031 (class 2604 OID 1166994)
-- Name: personals_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personals_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personals_access_tokens_id_seq'::regclass);


--
-- TOC entry 5013 (class 2604 OID 1166876)
-- Name: poll_options id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poll_options ALTER COLUMN id SET DEFAULT nextval('public.poll_options_id_seq'::regclass);


--
-- TOC entry 5051 (class 2604 OID 1167142)
-- Name: poll_votes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poll_votes ALTER COLUMN id SET DEFAULT nextval('public.poll_votes_id_seq'::regclass);


--
-- TOC entry 5012 (class 2604 OID 1166867)
-- Name: polls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls ALTER COLUMN id SET DEFAULT nextval('public.polls_id_seq'::regclass);


--
-- TOC entry 5029 (class 2604 OID 1166978)
-- Name: post_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments ALTER COLUMN id SET DEFAULT nextval('public.post_comments_id_seq'::regclass);


--
-- TOC entry 5032 (class 2604 OID 1167006)
-- Name: post_files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_files ALTER COLUMN id SET DEFAULT nextval('public.post_files_id_seq'::regclass);


--
-- TOC entry 5028 (class 2604 OID 1166971)
-- Name: post_likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_likes ALTER COLUMN id SET DEFAULT nextval('public.post_likes_id_seq'::regclass);


--
-- TOC entry 5050 (class 2604 OID 1167133)
-- Name: post_poll_options id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_poll_options ALTER COLUMN id SET DEFAULT nextval('public.post_poll_options_id_seq'::regclass);


--
-- TOC entry 5053 (class 2604 OID 1167160)
-- Name: post_reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_reports ALTER COLUMN id SET DEFAULT nextval('public.post_reports_id_seq'::regclass);


--
-- TOC entry 5030 (class 2604 OID 1166987)
-- Name: post_shares id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_shares ALTER COLUMN id SET DEFAULT nextval('public.post_shares_id_seq'::regclass);


--
-- TOC entry 5026 (class 2604 OID 1166961)
-- Name: post_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_types ALTER COLUMN id SET DEFAULT nextval('public.post_types_id_seq'::regclass);


--
-- TOC entry 5010 (class 2604 OID 1166857)
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- TOC entry 5054 (class 2604 OID 1167169)
-- Name: push_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_requests ALTER COLUMN id SET DEFAULT nextval('public.push_requests_id_seq'::regclass);


--
-- TOC entry 4980 (class 2604 OID 1166651)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 5057 (class 2604 OID 1167195)
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- TOC entry 4993 (class 2604 OID 1166758)
-- Name: target_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_types ALTER COLUMN id SET DEFAULT nextval('public.target_types_id_seq'::regclass);


--
-- TOC entry 5003 (class 2604 OID 1166811)
-- Name: target_types_company id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_types_company ALTER COLUMN id SET DEFAULT nextval('public.target_types_company_id_seq'::regclass);


--
-- TOC entry 5038 (class 2604 OID 1167033)
-- Name: temp_check_lists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_check_lists ALTER COLUMN id SET DEFAULT nextval('public.temp_check_lists_id_seq'::regclass);


--
-- TOC entry 5039 (class 2604 OID 1167040)
-- Name: temp_cost_break_downs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_cost_break_downs ALTER COLUMN id SET DEFAULT nextval('public.temp_cost_break_downs_id_seq'::regclass);


--
-- TOC entry 5037 (class 2604 OID 1167026)
-- Name: temp_itineraries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_itineraries ALTER COLUMN id SET DEFAULT nextval('public.temp_itineraries_id_seq'::regclass);


--
-- TOC entry 5035 (class 2604 OID 1167017)
-- Name: temp_journeys id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_journeys ALTER COLUMN id SET DEFAULT nextval('public.temp_journeys_id_seq'::regclass);


--
-- TOC entry 4973 (class 2604 OID 1166617)
-- Name: temp_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users ALTER COLUMN id SET DEFAULT nextval('public.temp_users_id_seq'::regclass);


--
-- TOC entry 5043 (class 2604 OID 1167088)
-- Name: user_activities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activities ALTER COLUMN id SET DEFAULT nextval('public.user_activities_id_seq'::regclass);


--
-- TOC entry 5055 (class 2604 OID 1167179)
-- Name: user_loged_devices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_loged_devices ALTER COLUMN id SET DEFAULT nextval('public.user_loged_devices_id_seq'::regclass);


--
-- TOC entry 4957 (class 2604 OID 1166547)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5444 (class 0 OID 1166907)
-- Dependencies: 282
-- Data for Name: activity_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activity_log (id, log_name, description, subject_type, subject_id, causer_type, causer_id, properties, created_at, updated_at, event, batch_uuid) FROM stdin;
1	user	User created	App\\Models\\User	1	\N	\N	{"attributes":{"first_name":null,"last_name":null,"email":false,"status":0},"ip":"127.0.0.1","description":"User created"}	2025-08-02 12:38:14	2025-08-02 12:38:14	created	\N
\.


--
-- TOC entry 5492 (class 0 OID 1167146)
-- Dependencies: 330
-- Data for Name: block_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.block_users (id, user_id, blocked_user_id, created_at, updated_at, remark) FROM stdin;
\.


--
-- TOC entry 5478 (class 0 OID 1167064)
-- Dependencies: 316
-- Data for Name: bookmarks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookmarks (id, user_id, journey_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5383 (class 0 OID 1166570)
-- Dependencies: 221
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
spatie.permission.cache	a:3:{s:5:"alias";a:4:{s:1:"a";s:2:"id";s:1:"b";s:4:"name";s:1:"c";s:10:"guard_name";s:1:"r";s:5:"roles";}s:11:"permissions";a:13:{i:0;a:4:{s:1:"a";i:1;s:1:"b";s:9:"dashboard";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:1;a:4:{s:1:"a";i:2;s:1:"b";s:5:"users";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:2;a:4:{s:1:"a";i:3;s:1:"b";s:9:"subadmins";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:3;a:4:{s:1:"a";i:4;s:1:"b";s:8:"journeys";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:4;a:4:{s:1:"a";i:5;s:1:"b";s:5:"posts";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:5;a:4:{s:1:"a";i:6;s:1:"b";s:7:"country";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:6;a:4:{s:1:"a";i:7;s:1:"b";s:9:"post_type";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:7;a:4:{s:1:"a";i:8;s:1:"b";s:7:"aboutus";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:8;a:4:{s:1:"a";i:9;s:1:"b";s:17:"termsandcondition";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:9;a:4:{s:1:"a";i:10;s:1:"b";s:13:"privacypolicy";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:10;a:4:{s:1:"a";i:11;s:1:"b";s:3:"faq";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:11;a:4:{s:1:"a";i:12;s:1:"b";s:13:"notifications";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:12;a:4:{s:1:"a";i:13;s:1:"b";s:7:"reports";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}}s:5:"roles";a:1:{i:0;a:3:{s:1:"a";i:1;s:1:"b";s:5:"Admin";s:1:"c";s:3:"web";}}}	1754224707
\.


--
-- TOC entry 5384 (class 0 OID 1166577)
-- Dependencies: 222
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- TOC entry 5412 (class 0 OID 1166733)
-- Dependencies: 250
-- Data for Name: challenges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.challenges (id, user_id, name, challenge_type, target_type, target_value, start_date, end_date, status, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 5414 (class 0 OID 1166741)
-- Dependencies: 252
-- Data for Name: challenges_companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.challenges_companies (id, challenge_id, company_id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 5432 (class 0 OID 1166838)
-- Dependencies: 270
-- Data for Name: checklists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.checklists (id, user_id, journey_id, item, is_checked, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5406 (class 0 OID 1166710)
-- Dependencies: 244
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, emirate_id, name, created_at, updated_at, deleted_at, country_id, status) FROM stdin;
1	1	Dubai	2025-08-02 12:38:14	2025-08-02 12:38:14	\N	\N	0
2	2	Sharjah	2025-08-02 12:38:14	2025-08-02 12:38:14	\N	\N	0
3	3	Ajman	2025-08-02 12:38:14	2025-08-02 12:38:14	\N	\N	0
4	1	Hatta	2025-08-02 12:38:14	2025-08-02 12:38:14	\N	\N	0
5	2	Kalba	2025-08-02 12:38:14	2025-08-02 12:38:14	\N	\N	0
6	2	Dibba Al-Hisn	2025-08-02 12:38:14	2025-08-02 12:38:14	\N	\N	0
\.


--
-- TOC entry 5420 (class 0 OID 1166771)
-- Dependencies: 258
-- Data for Name: cms_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cms_pages (id, title, content, status, created_at, updated_at) FROM stdin;
1	About us		Draft	2025-08-02 12:47:38	2025-08-02 12:47:38
\.


--
-- TOC entry 5393 (class 0 OID 1166627)
-- Dependencies: 231
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (id, name, name_ar, brand_logo, description, description_ar, address, trade_license, trade_license_expiry, user_id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 5482 (class 0 OID 1167100)
-- Dependencies: 320
-- Data for Name: contact_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_details (id, name, value, icon, status, created_at, updated_at) FROM stdin;
1	facebook	https://facebook.com	icon.png	1	\N	\N
\.


--
-- TOC entry 5452 (class 0 OID 1166942)
-- Dependencies: 290
-- Data for Name: cost_breakdown_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cost_breakdown_items (id, cost_breakdown_id, item, price, parent_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5450 (class 0 OID 1166933)
-- Dependencies: 288
-- Data for Name: cost_breakdowns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cost_breakdowns (id, journey_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5402 (class 0 OID 1166696)
-- Dependencies: 240
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, name, created_at, updated_at, status, dial_code, flag, description, iso_code) FROM stdin;
1	United Arab Emirates	2025-08-02 12:38:14	2025-08-02 12:38:14	0	\N	\N	\N	\N
\.


--
-- TOC entry 5404 (class 0 OID 1166703)
-- Dependencies: 242
-- Data for Name: emirates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emirates (id, country_id, name, created_at, updated_at, deleted_at, status) FROM stdin;
1	1	Dubai	2025-08-02 12:38:14	2025-08-02 12:38:14	\N	0
2	1	Sharjah	2025-08-02 12:38:14	2025-08-02 12:38:14	\N	0
3	1	Ajman	2025-08-02 12:38:14	2025-08-02 12:38:14	\N	0
\.


--
-- TOC entry 5454 (class 0 OID 1166951)
-- Dependencies: 292
-- Data for Name: est_person_cost_journeys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.est_person_cost_journeys (id, journey_id, price_range, created_at, updated_at, total_cost) FROM stdin;
\.


--
-- TOC entry 5418 (class 0 OID 1166763)
-- Dependencies: 256
-- Data for Name: event_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_types (id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5424 (class 0 OID 1166792)
-- Dependencies: 262
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, name, event_type_id, start_date, end_date, status, description, images, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5389 (class 0 OID 1166602)
-- Dependencies: 227
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 5422 (class 0 OID 1166782)
-- Dependencies: 260
-- Data for Name: faqs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faqs (id, question, answer, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5446 (class 0 OID 1166919)
-- Dependencies: 284
-- Data for Name: followers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.followers (id, follower_id, followed_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5476 (class 0 OID 1167045)
-- Dependencies: 314
-- Data for Name: follows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.follows (id, follower_id, followed_id, status, requested_at, responded_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5430 (class 0 OID 1166829)
-- Dependencies: 268
-- Data for Name: itineraries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.itineraries (id, user_id, journey_id, date, description, created_at, updated_at, start_time, end_time) FROM stdin;
\.


--
-- TOC entry 5387 (class 0 OID 1166594)
-- Dependencies: 225
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- TOC entry 5386 (class 0 OID 1166585)
-- Dependencies: 224
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- TOC entry 5448 (class 0 OID 1166926)
-- Dependencies: 286
-- Data for Name: journey_participants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journey_participants (id, journey_id, user_id, created_at, updated_at, is_approved, is_owner) FROM stdin;
\.


--
-- TOC entry 5428 (class 0 OID 1166820)
-- Dependencies: 266
-- Data for Name: journeys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journeys (id, title, destination, accommodation, accommodation_link, date, created_at, updated_at, user_id, start_date, end_date, map_link, cost, small_description, file_name, country_id) FROM stdin;
\.


--
-- TOC entry 5500 (class 0 OID 1167185)
-- Dependencies: 338
-- Data for Name: marked_check_lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marked_check_lists (id, user_id, journey_id, check_list_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5486 (class 0 OID 1167120)
-- Dependencies: 324
-- Data for Name: media_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media_files (id, media_id, file_name, height, width, extension, duration, thumb_image, have_hls_url, hls_url, hls_cdn_url, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5484 (class 0 OID 1167110)
-- Dependencies: 322
-- Data for Name: medias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medias (id, user_id, title, destination, country_id, date, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 5378 (class 0 OID 1166537)
-- Dependencies: 216
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2023_11_29_084619_create_temp_users	1
5	2024_12_04_121725_create_companies_table	1
6	2024_12_04_174007_create_permission_tables	1
7	2024_12_05_125935_create_countries_table	1
8	2024_12_05_125953_create_emirates_table	1
9	2024_12_05_130018_create_cities_table	1
10	2024_12_05_164934_create_packages_table	1
11	2024_12_05_164957_create_packages_addons_table	1
12	2024_12_05_191748_add_fields_to_users_table	1
13	2024_12_05_231725_create_challenges_table	1
14	2024_12_05_232702_create_challenges_companies_table	1
15	2024_12_10_063233_remove_columns_from_companies_table	1
16	2024_12_10_094132_add_soft_deletes_to_users_table	1
17	2024_12_10_113225_add_status_to_countries_table	1
18	2024_12_10_131649_add_soft_deletes_to_challenges_table	1
19	2024_12_10_144153_add_status_to_emirates_table	1
20	2024_12_10_155646_add_country_id_and_status_to_cities_table	1
21	2024_12_10_165027_create_target_types_table	1
22	2024_12_10_173815_create_event_types_table	1
23	2024_12_10_182826_create_pages_table	1
24	2024_12_11_104518_create_faqs_table	1
25	2024_12_11_190634_create_events_table	1
26	2024_12_12_171650_add_role_id_to_users_table	1
27	2024_12_16_031035_create_target_types_company_table	1
28	2024_12_16_143622_add_dial_code_to_countries_table	1
29	2024_12_16_143622_add_missing_to_users_table	1
30	2024_12_23_113726_add_company_id_to_target_types_table	1
31	2025_03_09_163238_create_journeys_table	1
32	2025_03_09_163715_add_user_id_to_journeys_table	1
33	2025_03_09_200844_create_itineraries_table	1
34	2025_03_09_200857_create_checklists_table	1
35	2025_03_09_220525_create_cost_breakdowns_table	1
36	2025_03_09_221357_add_total_to_journeys_table	1
37	2025_03_10_012551_create_posts_table	1
38	2025_03_10_020955_update_posts_table	1
39	2025_03_10_053410_create_polls_and_poll_options_tables	1
40	2025_04_12_070435_create_personal_access_tokens_table	1
41	2025_04_14_082504_add_qr_code_to_users_table	1
42	2025_04_16_143622_add_access_token_to_users_table	1
43	2025_04_16_143622_add_firbase_key_to_users_table	1
44	2025_04_16_143622_add_password_reset_code_to_users_table	1
45	2025_04_16_143622_add_password_reset_otp_to_users_table	1
46	2025_04_16_143622_add_password_reset_time_to_users_table	1
47	2025_04_21_081948_create_notifications_table	1
48	2025_04_21_091030_create_activity_log_table	1
49	2025_04_21_091031_add_event_column_to_activity_log_table	1
50	2025_04_21_091032_add_batch_uuid_column_to_activity_log_table	1
51	2025_04_21_094835_add_username_to_users_table	1
52	2025_04_21_121547_create_followers_table	1
53	2025_04_21_133143_add_profile_picture_to_users_table	1
54	2025_04_22_063251_add_extra_fields_to_journeys_table	1
55	2025_04_22_063841_create_journey_participants_table	1
56	2025_04_22_064730_remove_extra_columns_from_journeys_table	1
57	2025_04_22_065217_add_cost_to_journeys_table	1
58	2025_04_22_073524_add_start_end_time_to_itineraries_table	1
59	2025_04_24_102344_create_cost_breakdowns_table	1
60	2025_04_24_102440_create_cost_breakdown_items_table	1
61	2025_04_24_104419_remove_item_and_price_from_cost_breakdowns	1
62	2025_04_24_112841_create_est_person_cost_journeys_table	1
63	2025_04_25_233352_create_post_types_table	1
64	2025_04_26_002944_add_post_type_to_posts_table	1
65	2025_04_26_074916_add_video_and_poll_columns_to_posts_table	1
66	2025_04_26_080441_add_pos_id_to_posts_table	1
67	2025_04_27_052114_change_accommodation_link_and_map_link_to_text_in_journeys_table	1
68	2025_04_28_115309_add_bio_to_users_table	1
69	2025_04_28_115309_add_small_description_to_journeys_table	1
70	2025_04_28_115309_add_username_to_temp_users_table	1
71	2025_04_28_173915_create_post_likes_table	1
72	2025_04_28_174000_create_post_comments_table	1
73	2025_04_28_174727_create_post_shares_table	1
74	2025_04_29_025920_change_image_and_video_to_text_in_posts_table	1
75	2025_04_30_183711_create_personal_access_tokens_table	1
76	2025_05_06_090724_create_post_files_table	1
77	2025_05_19_102336_create_temp_journeys_table	1
78	2025_05_19_102855_create_temp_itineraries_table	1
79	2025_05_19_104424_create_temp_check_lists_table	1
80	2025_05_19_104943_create_temp_cost_break_downs_table	1
81	2025_05_20_072827_alter_add_file_name_to_journeys	1
82	2025_05_21_114957_alter_add_fields_to_journey_participants	1
83	2025_05_29_072434_later_add_flag_to_countries	1
84	2025_05_29_094219_create_follows_table	1
85	2025_05_29_110847_alter_add_last_ping_timestamp_to_users	1
86	2025_05_29_111259_alter_add_country_id_to_temp_users	1
87	2025_05_29_153157_create_bookmarks_table	1
88	2025_05_30_061216_alter_add_deleted_to_users	1
89	2025_05_30_113347_alter_add_country_id_to_journeys	1
90	2025_05_30_113811_alter_add_country_id_to_temp_journeys	1
91	2025_05_31_114948_create_activity_logs_table	1
92	2025_06_02_094302_add_multiple_column_to_user_table	1
93	2025_06_02_143427_add_biometric_token_to_users_table	1
94	2025_06_03_123814_create_contact_details_table	1
95	2025_06_03_154352_add_data_to_contact_detail	1
96	2025_06_11_115454_create_medias_table	1
97	2025_06_11_115646_create_media_files_table	1
98	2025_06_17_071537_create_poll_options_table	1
99	2025_06_17_071547_create_poll_votes_table	1
100	2025_06_17_084207_create_block_users_table	1
101	2025_06_17_091200_add_indexes_to_post_poll_votes_table	1
102	2025_06_17_120917_alter_add-remark_to_block_users	1
103	2025_06_17_120944_create_post_reports_table	1
104	2025_06_18_051438_create_push_requests_table	1
105	2025_06_20_061123_alter_add_is_owner_to_journey_participants	1
106	2025_06_20_103243_create_user_loged_devices_table	1
107	2025_06_21_042600_create_marked_check_lists_table	1
108	2025_06_24_045306_alter_add_soft_deletes_to_posts	1
109	2025_06_24_075428_alter_add_meta_data_to_user_activities	1
110	2025_06_24_101851_alter_add_description_to_countries	1
111	2025_06_24_131411_alter_add_chat_type_to_push_requests	1
112	2025_06_25_040726_create_settings_table	1
113	2025_06_26_071516_alter_add_soft_deletes_to_medias	1
114	2025_07_04_061609_alter_add_iso_code_to_countries	1
115	2025_07_05_072155_alter_add_device_type_to_user_loged_devices	1
116	2025_07_07_105558_alter_add_new_filed_to_user_loged_devices	1
117	2025_07_07_124617_alter_add_total_trip_cost_to_est_person_cost_journeys	1
118	2025_07_10_114558_alter_add_add_fildes_nullable_to_temp_journeys	1
119	2025_07_26_113941_add_destination_to_users_table	1
\.


--
-- TOC entry 5398 (class 0 OID 1166658)
-- Dependencies: 236
-- Data for Name: model_has_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
\.


--
-- TOC entry 5399 (class 0 OID 1166669)
-- Dependencies: 237
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
1	App\\Models\\User	1
\.


--
-- TOC entry 5442 (class 0 OID 1166898)
-- Dependencies: 280
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, user_id, title, description, image, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5408 (class 0 OID 1166717)
-- Dependencies: 246
-- Data for Name: packages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.packages (id, name, price, status, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 5410 (class 0 OID 1166725)
-- Dependencies: 248
-- Data for Name: packages_addons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.packages_addons (id, package_id, title, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5381 (class 0 OID 1166554)
-- Dependencies: 219
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 5395 (class 0 OID 1166637)
-- Dependencies: 233
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (id, name, guard_name, created_at, updated_at) FROM stdin;
1	dashboard	web	2025-08-02 12:38:14	2025-08-02 12:38:14
2	users	web	2025-08-02 12:38:14	2025-08-02 12:38:14
3	subadmins	web	2025-08-02 12:38:14	2025-08-02 12:38:14
4	journeys	web	2025-08-02 12:38:14	2025-08-02 12:38:14
5	posts	web	2025-08-02 12:38:14	2025-08-02 12:38:14
6	country	web	2025-08-02 12:38:14	2025-08-02 12:38:14
7	post_type	web	2025-08-02 12:38:14	2025-08-02 12:38:14
8	aboutus	web	2025-08-02 12:38:14	2025-08-02 12:38:14
9	termsandcondition	web	2025-08-02 12:38:14	2025-08-02 12:38:14
10	privacypolicy	web	2025-08-02 12:38:14	2025-08-02 12:38:14
11	faq	web	2025-08-02 12:38:14	2025-08-02 12:38:14
12	notifications	web	2025-08-02 12:38:14	2025-08-02 12:38:14
13	reports	web	2025-08-02 12:38:14	2025-08-02 12:38:14
\.


--
-- TOC entry 5440 (class 0 OID 1166886)
-- Dependencies: 278
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5464 (class 0 OID 1166991)
-- Dependencies: 302
-- Data for Name: personals_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personals_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5438 (class 0 OID 1166873)
-- Dependencies: 276
-- Data for Name: poll_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.poll_options (id, poll_id, option_text, votes, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5490 (class 0 OID 1167139)
-- Dependencies: 328
-- Data for Name: poll_votes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.poll_votes (id, user_id, post_id, option_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5436 (class 0 OID 1166864)
-- Dependencies: 274
-- Data for Name: polls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.polls (id, user_id, journey_id, question, date, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5460 (class 0 OID 1166975)
-- Dependencies: 298
-- Data for Name: post_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_comments (id, post_id, user_id, comment, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5466 (class 0 OID 1167003)
-- Dependencies: 304
-- Data for Name: post_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_files (id, post_id, height, width, extension, is_default, url, duration, thumb_image, have_hls_url, hls_url, hls_cdn_url, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5458 (class 0 OID 1166968)
-- Dependencies: 296
-- Data for Name: post_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_likes (id, post_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5488 (class 0 OID 1167130)
-- Dependencies: 326
-- Data for Name: post_poll_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_poll_options (id, post_id, option, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5494 (class 0 OID 1167157)
-- Dependencies: 332
-- Data for Name: post_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_reports (id, user_id, reported_post_id, report_reason, remark, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5462 (class 0 OID 1166984)
-- Dependencies: 300
-- Data for Name: post_shares; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_shares (id, post_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5456 (class 0 OID 1166958)
-- Dependencies: 294
-- Data for Name: post_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_types (id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5434 (class 0 OID 1166854)
-- Dependencies: 272
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, title, description, user_id, created_at, updated_at, image, comments, post_type, postdate, post_video, poll_question, poll_options, post_id, deleted_at) FROM stdin;
\.


--
-- TOC entry 5496 (class 0 OID 1167166)
-- Dependencies: 334
-- Data for Name: push_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.push_requests (id, user_id, title, body, data, created_at, updated_at, chat_type) FROM stdin;
\.


--
-- TOC entry 5400 (class 0 OID 1166680)
-- Dependencies: 238
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
\.


--
-- TOC entry 5397 (class 0 OID 1166648)
-- Dependencies: 235
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
1	Admin	web	2025-08-02 12:38:14	2025-08-02 12:38:14
2	Sub Admin	web	2025-08-02 12:38:14	2025-08-02 12:38:14
3	Company	web	2025-08-02 12:38:14	2025-08-02 12:38:14
4	Individual	web	2025-08-02 12:38:14	2025-08-02 12:38:14
5	Staff	web	2025-08-02 12:38:14	2025-08-02 12:38:14
\.


--
-- TOC entry 5382 (class 0 OID 1166561)
-- Dependencies: 220
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
Mt6MqUmjEZcaET6JDDPs1MRQ5QP1ajOSXkEF52y6	1	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoidkpWMkF0dlZFTUlHZ01qQWQwRlM1M0xudmhLQUUwZTBIMlFaOWJ6aiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo2MToiaHR0cDovL2xvY2FsaG9zdC91YWVfc3R1ZGVudF9mb3J1bV9hcHAvcHVibGljL2FkbWluL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjY4OiJodHRwOi8vbG9jYWxob3N0L3VhZV9zdHVkZW50X2ZvcnVtX2FwcC9wdWJsaWMvYWRtaW4vY291bnRyaWVzL2NyZWF0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==	1754138868
\.


--
-- TOC entry 5502 (class 0 OID 1167192)
-- Dependencies: 340
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, support_email, instagream, twitter, facebook, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5416 (class 0 OID 1166755)
-- Dependencies: 254
-- Data for Name: target_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.target_types (id, name, status, created_at, updated_at, company_id) FROM stdin;
\.


--
-- TOC entry 5426 (class 0 OID 1166808)
-- Dependencies: 264
-- Data for Name: target_types_company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.target_types_company (id, company_id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5472 (class 0 OID 1167030)
-- Dependencies: 310
-- Data for Name: temp_check_lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_check_lists (id, temp_id, description, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5474 (class 0 OID 1167037)
-- Dependencies: 312
-- Data for Name: temp_cost_break_downs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_cost_break_downs (id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5470 (class 0 OID 1167023)
-- Dependencies: 308
-- Data for Name: temp_itineraries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_itineraries (id, temp_id, day_number, date, time_from, time_to, description, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5468 (class 0 OID 1167014)
-- Dependencies: 306
-- Data for Name: temp_journeys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_journeys (id, user_id, file_name, title, destination, accomodation, destination_url, small_description, map_link, start_date, end_date, created_at, updated_at, country_id) FROM stdin;
\.


--
-- TOC entry 5391 (class 0 OID 1166614)
-- Dependencies: 229
-- Data for Name: temp_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_users (id, name, email, dial_code, phone, phone_verified, active, email_verified, password, email_verified_at, role, first_name, last_name, user_image, user_phone_otp, user_email_otp, user_device_token, user_device_type, user_access_token, firebase_user_key, device_cart_id, created_at, updated_at, username, country_id) FROM stdin;
\.


--
-- TOC entry 5480 (class 0 OID 1167085)
-- Dependencies: 318
-- Data for Name: user_activities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_activities (id, user_id, action, description, ip_address, user_agent, model_type, model_id, created_at, updated_at, meta_data) FROM stdin;
\.


--
-- TOC entry 5498 (class 0 OID 1167176)
-- Dependencies: 336
-- Data for Name: user_loged_devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_loged_devices (id, user_id, token, device_name, last_used_at, created_at, updated_at, device_type, user_device_token) FROM stdin;
\.


--
-- TOC entry 5380 (class 0 OID 1166544)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, is_social, first_name, last_name, dial_code, phone, country_id, emirates_id, city_id, company_id, status, deleted_at, role_id, email_verified, phone_verified, user_email_otp, user_phone_otp, user_device_type, user_device_token, trade_license, qr_code, user_access_token, firebase_user_key, password_reset_code, password_reset_otp, password_reset_time, username, profile_picture, bio, last_ping_timestamp, deleted, is_private, notify_group_message_email, notify_group_message_push, notify_message_email, notify_message_push, notify_friend_request_email, notify_friend_request_push, biometric_token, destination) FROM stdin;
1	Admin User	admin@admin.com	\N	$2y$12$64iUVAKb..DLajxNZeh6RONJljUTLx5nv9M3Pb7MBwRJlf8kZVC4C	\N	2025-08-02 12:38:14	2025-08-02 12:38:14	0	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	t	t	t	t	t	t	\N	\N
\.


--
-- TOC entry 5576 (class 0 OID 0)
-- Dependencies: 281
-- Name: activity_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_log_id_seq', 1, true);


--
-- TOC entry 5577 (class 0 OID 0)
-- Dependencies: 329
-- Name: block_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.block_users_id_seq', 1, false);


--
-- TOC entry 5578 (class 0 OID 0)
-- Dependencies: 315
-- Name: bookmarks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookmarks_id_seq', 1, false);


--
-- TOC entry 5579 (class 0 OID 0)
-- Dependencies: 251
-- Name: challenges_companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.challenges_companies_id_seq', 1, false);


--
-- TOC entry 5580 (class 0 OID 0)
-- Dependencies: 249
-- Name: challenges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.challenges_id_seq', 1, false);


--
-- TOC entry 5581 (class 0 OID 0)
-- Dependencies: 269
-- Name: checklists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.checklists_id_seq', 1, false);


--
-- TOC entry 5582 (class 0 OID 0)
-- Dependencies: 243
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 6, true);


--
-- TOC entry 5583 (class 0 OID 0)
-- Dependencies: 257
-- Name: cms_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cms_pages_id_seq', 1, true);


--
-- TOC entry 5584 (class 0 OID 0)
-- Dependencies: 230
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_id_seq', 1, false);


--
-- TOC entry 5585 (class 0 OID 0)
-- Dependencies: 319
-- Name: contact_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_details_id_seq', 1, true);


--
-- TOC entry 5586 (class 0 OID 0)
-- Dependencies: 289
-- Name: cost_breakdown_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cost_breakdown_items_id_seq', 1, false);


--
-- TOC entry 5587 (class 0 OID 0)
-- Dependencies: 287
-- Name: cost_breakdowns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cost_breakdowns_id_seq', 1, false);


--
-- TOC entry 5588 (class 0 OID 0)
-- Dependencies: 239
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 1, true);


--
-- TOC entry 5589 (class 0 OID 0)
-- Dependencies: 241
-- Name: emirates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.emirates_id_seq', 3, true);


--
-- TOC entry 5590 (class 0 OID 0)
-- Dependencies: 291
-- Name: est_person_cost_journeys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.est_person_cost_journeys_id_seq', 1, false);


--
-- TOC entry 5591 (class 0 OID 0)
-- Dependencies: 255
-- Name: event_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_types_id_seq', 1, false);


--
-- TOC entry 5592 (class 0 OID 0)
-- Dependencies: 261
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 1, false);


--
-- TOC entry 5593 (class 0 OID 0)
-- Dependencies: 226
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 5594 (class 0 OID 0)
-- Dependencies: 259
-- Name: faqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faqs_id_seq', 1, false);


--
-- TOC entry 5595 (class 0 OID 0)
-- Dependencies: 283
-- Name: followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.followers_id_seq', 1, false);


--
-- TOC entry 5596 (class 0 OID 0)
-- Dependencies: 313
-- Name: follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.follows_id_seq', 1, false);


--
-- TOC entry 5597 (class 0 OID 0)
-- Dependencies: 267
-- Name: itineraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.itineraries_id_seq', 1, false);


--
-- TOC entry 5598 (class 0 OID 0)
-- Dependencies: 223
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 5599 (class 0 OID 0)
-- Dependencies: 285
-- Name: journey_participants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journey_participants_id_seq', 1, false);


--
-- TOC entry 5600 (class 0 OID 0)
-- Dependencies: 265
-- Name: journeys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journeys_id_seq', 1, false);


--
-- TOC entry 5601 (class 0 OID 0)
-- Dependencies: 337
-- Name: marked_check_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marked_check_lists_id_seq', 1, false);


--
-- TOC entry 5602 (class 0 OID 0)
-- Dependencies: 323
-- Name: media_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_files_id_seq', 1, false);


--
-- TOC entry 5603 (class 0 OID 0)
-- Dependencies: 321
-- Name: medias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medias_id_seq', 1, false);


--
-- TOC entry 5604 (class 0 OID 0)
-- Dependencies: 215
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 119, true);


--
-- TOC entry 5605 (class 0 OID 0)
-- Dependencies: 279
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 1, false);


--
-- TOC entry 5606 (class 0 OID 0)
-- Dependencies: 247
-- Name: packages_addons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.packages_addons_id_seq', 1, false);


--
-- TOC entry 5607 (class 0 OID 0)
-- Dependencies: 245
-- Name: packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.packages_id_seq', 1, false);


--
-- TOC entry 5608 (class 0 OID 0)
-- Dependencies: 232
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 13, true);


--
-- TOC entry 5609 (class 0 OID 0)
-- Dependencies: 277
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 5610 (class 0 OID 0)
-- Dependencies: 301
-- Name: personals_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personals_access_tokens_id_seq', 1, false);


--
-- TOC entry 5611 (class 0 OID 0)
-- Dependencies: 275
-- Name: poll_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.poll_options_id_seq', 1, false);


--
-- TOC entry 5612 (class 0 OID 0)
-- Dependencies: 327
-- Name: poll_votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.poll_votes_id_seq', 1, false);


--
-- TOC entry 5613 (class 0 OID 0)
-- Dependencies: 273
-- Name: polls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.polls_id_seq', 1, false);


--
-- TOC entry 5614 (class 0 OID 0)
-- Dependencies: 297
-- Name: post_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_comments_id_seq', 1, false);


--
-- TOC entry 5615 (class 0 OID 0)
-- Dependencies: 303
-- Name: post_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_files_id_seq', 1, false);


--
-- TOC entry 5616 (class 0 OID 0)
-- Dependencies: 295
-- Name: post_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_likes_id_seq', 1, false);


--
-- TOC entry 5617 (class 0 OID 0)
-- Dependencies: 325
-- Name: post_poll_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_poll_options_id_seq', 1, false);


--
-- TOC entry 5618 (class 0 OID 0)
-- Dependencies: 331
-- Name: post_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_reports_id_seq', 1, false);


--
-- TOC entry 5619 (class 0 OID 0)
-- Dependencies: 299
-- Name: post_shares_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_shares_id_seq', 1, false);


--
-- TOC entry 5620 (class 0 OID 0)
-- Dependencies: 293
-- Name: post_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_types_id_seq', 1, false);


--
-- TOC entry 5621 (class 0 OID 0)
-- Dependencies: 271
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- TOC entry 5622 (class 0 OID 0)
-- Dependencies: 333
-- Name: push_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.push_requests_id_seq', 1, false);


--
-- TOC entry 5623 (class 0 OID 0)
-- Dependencies: 234
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- TOC entry 5624 (class 0 OID 0)
-- Dependencies: 339
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, false);


--
-- TOC entry 5625 (class 0 OID 0)
-- Dependencies: 263
-- Name: target_types_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.target_types_company_id_seq', 1, false);


--
-- TOC entry 5626 (class 0 OID 0)
-- Dependencies: 253
-- Name: target_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.target_types_id_seq', 1, false);


--
-- TOC entry 5627 (class 0 OID 0)
-- Dependencies: 309
-- Name: temp_check_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_check_lists_id_seq', 1, false);


--
-- TOC entry 5628 (class 0 OID 0)
-- Dependencies: 311
-- Name: temp_cost_break_downs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_cost_break_downs_id_seq', 1, false);


--
-- TOC entry 5629 (class 0 OID 0)
-- Dependencies: 307
-- Name: temp_itineraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_itineraries_id_seq', 1, false);


--
-- TOC entry 5630 (class 0 OID 0)
-- Dependencies: 305
-- Name: temp_journeys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_journeys_id_seq', 1, false);


--
-- TOC entry 5631 (class 0 OID 0)
-- Dependencies: 228
-- Name: temp_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_users_id_seq', 1, false);


--
-- TOC entry 5632 (class 0 OID 0)
-- Dependencies: 317
-- Name: user_activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_activities_id_seq', 1, false);


--
-- TOC entry 5633 (class 0 OID 0)
-- Dependencies: 335
-- Name: user_loged_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_loged_devices_id_seq', 1, false);


--
-- TOC entry 5634 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- TOC entry 5158 (class 2606 OID 1166914)
-- Name: activity_log activity_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_log
    ADD CONSTRAINT activity_log_pkey PRIMARY KEY (id);


--
-- TOC entry 5213 (class 2606 OID 1167151)
-- Name: block_users block_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.block_users
    ADD CONSTRAINT block_users_pkey PRIMARY KEY (id);


--
-- TOC entry 5197 (class 2606 OID 1167069)
-- Name: bookmarks bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_pkey PRIMARY KEY (id);


--
-- TOC entry 5079 (class 2606 OID 1166583)
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- TOC entry 5077 (class 2606 OID 1166576)
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- TOC entry 5122 (class 2606 OID 1166746)
-- Name: challenges_companies challenges_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges_companies
    ADD CONSTRAINT challenges_companies_pkey PRIMARY KEY (id);


--
-- TOC entry 5120 (class 2606 OID 1166739)
-- Name: challenges challenges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges
    ADD CONSTRAINT challenges_pkey PRIMARY KEY (id);


--
-- TOC entry 5140 (class 2606 OID 1166844)
-- Name: checklists checklists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checklists
    ADD CONSTRAINT checklists_pkey PRIMARY KEY (id);


--
-- TOC entry 5114 (class 2606 OID 1166715)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 5128 (class 2606 OID 1166780)
-- Name: cms_pages cms_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cms_pages
    ADD CONSTRAINT cms_pages_pkey PRIMARY KEY (id);


--
-- TOC entry 5092 (class 2606 OID 1166635)
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- TOC entry 5201 (class 2606 OID 1167108)
-- Name: contact_details contact_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_details
    ADD CONSTRAINT contact_details_pkey PRIMARY KEY (id);


--
-- TOC entry 5168 (class 2606 OID 1166949)
-- Name: cost_breakdown_items cost_breakdown_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_breakdown_items
    ADD CONSTRAINT cost_breakdown_items_pkey PRIMARY KEY (id);


--
-- TOC entry 5166 (class 2606 OID 1166940)
-- Name: cost_breakdowns cost_breakdowns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_breakdowns
    ADD CONSTRAINT cost_breakdowns_pkey PRIMARY KEY (id);


--
-- TOC entry 5110 (class 2606 OID 1166701)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 5112 (class 2606 OID 1166708)
-- Name: emirates emirates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emirates
    ADD CONSTRAINT emirates_pkey PRIMARY KEY (id);


--
-- TOC entry 5170 (class 2606 OID 1166956)
-- Name: est_person_cost_journeys est_person_cost_journeys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.est_person_cost_journeys
    ADD CONSTRAINT est_person_cost_journeys_pkey PRIMARY KEY (id);


--
-- TOC entry 5126 (class 2606 OID 1166769)
-- Name: event_types event_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_types
    ADD CONSTRAINT event_types_pkey PRIMARY KEY (id);


--
-- TOC entry 5132 (class 2606 OID 1166801)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 5086 (class 2606 OID 1166610)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 5088 (class 2606 OID 1166612)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 5130 (class 2606 OID 1166790)
-- Name: faqs faqs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faqs
    ADD CONSTRAINT faqs_pkey PRIMARY KEY (id);


--
-- TOC entry 5162 (class 2606 OID 1166924)
-- Name: followers followers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_pkey PRIMARY KEY (id);


--
-- TOC entry 5195 (class 2606 OID 1167051)
-- Name: follows follows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (id);


--
-- TOC entry 5138 (class 2606 OID 1166836)
-- Name: itineraries itineraries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itineraries
    ADD CONSTRAINT itineraries_pkey PRIMARY KEY (id);


--
-- TOC entry 5084 (class 2606 OID 1166600)
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 5081 (class 2606 OID 1166592)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 5164 (class 2606 OID 1166931)
-- Name: journey_participants journey_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journey_participants
    ADD CONSTRAINT journey_participants_pkey PRIMARY KEY (id);


--
-- TOC entry 5136 (class 2606 OID 1166827)
-- Name: journeys journeys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journeys
    ADD CONSTRAINT journeys_pkey PRIMARY KEY (id);


--
-- TOC entry 5221 (class 2606 OID 1167190)
-- Name: marked_check_lists marked_check_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marked_check_lists
    ADD CONSTRAINT marked_check_lists_pkey PRIMARY KEY (id);


--
-- TOC entry 5205 (class 2606 OID 1167128)
-- Name: media_files media_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_files
    ADD CONSTRAINT media_files_pkey PRIMARY KEY (id);


--
-- TOC entry 5203 (class 2606 OID 1167118)
-- Name: medias medias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medias
    ADD CONSTRAINT medias_pkey PRIMARY KEY (id);


--
-- TOC entry 5065 (class 2606 OID 1166542)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 5103 (class 2606 OID 1166668)
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- TOC entry 5106 (class 2606 OID 1166679)
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- TOC entry 5155 (class 2606 OID 1166905)
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 5118 (class 2606 OID 1166730)
-- Name: packages_addons packages_addons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages_addons
    ADD CONSTRAINT packages_addons_pkey PRIMARY KEY (id);


--
-- TOC entry 5116 (class 2606 OID 1166723)
-- Name: packages packages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (id);


--
-- TOC entry 5071 (class 2606 OID 1166560)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 5094 (class 2606 OID 1166646)
-- Name: permissions permissions_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);


--
-- TOC entry 5096 (class 2606 OID 1166644)
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 5150 (class 2606 OID 1166893)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 5152 (class 2606 OID 1166896)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 5180 (class 2606 OID 1166998)
-- Name: personals_access_tokens personals_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personals_access_tokens
    ADD CONSTRAINT personals_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 5182 (class 2606 OID 1167001)
-- Name: personals_access_tokens personals_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personals_access_tokens
    ADD CONSTRAINT personals_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 5148 (class 2606 OID 1166879)
-- Name: poll_options poll_options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poll_options
    ADD CONSTRAINT poll_options_pkey PRIMARY KEY (id);


--
-- TOC entry 5211 (class 2606 OID 1167144)
-- Name: poll_votes poll_votes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poll_votes
    ADD CONSTRAINT poll_votes_pkey PRIMARY KEY (id);


--
-- TOC entry 5146 (class 2606 OID 1166871)
-- Name: polls polls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls
    ADD CONSTRAINT polls_pkey PRIMARY KEY (id);


--
-- TOC entry 5176 (class 2606 OID 1166982)
-- Name: post_comments post_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT post_comments_pkey PRIMARY KEY (id);


--
-- TOC entry 5185 (class 2606 OID 1167012)
-- Name: post_files post_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_files
    ADD CONSTRAINT post_files_pkey PRIMARY KEY (id);


--
-- TOC entry 5174 (class 2606 OID 1166973)
-- Name: post_likes post_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_likes
    ADD CONSTRAINT post_likes_pkey PRIMARY KEY (id);


--
-- TOC entry 5207 (class 2606 OID 1167137)
-- Name: post_poll_options post_poll_options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_poll_options
    ADD CONSTRAINT post_poll_options_pkey PRIMARY KEY (id);


--
-- TOC entry 5215 (class 2606 OID 1167164)
-- Name: post_reports post_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_reports
    ADD CONSTRAINT post_reports_pkey PRIMARY KEY (id);


--
-- TOC entry 5178 (class 2606 OID 1166989)
-- Name: post_shares post_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_shares
    ADD CONSTRAINT post_shares_pkey PRIMARY KEY (id);


--
-- TOC entry 5172 (class 2606 OID 1166964)
-- Name: post_types post_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_types
    ADD CONSTRAINT post_types_pkey PRIMARY KEY (id);


--
-- TOC entry 5142 (class 2606 OID 1166861)
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- TOC entry 5144 (class 2606 OID 1166966)
-- Name: posts posts_post_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_post_id_unique UNIQUE (post_id);


--
-- TOC entry 5217 (class 2606 OID 1167173)
-- Name: push_requests push_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_requests
    ADD CONSTRAINT push_requests_pkey PRIMARY KEY (id);


--
-- TOC entry 5108 (class 2606 OID 1166694)
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- TOC entry 5098 (class 2606 OID 1166657)
-- Name: roles roles_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);


--
-- TOC entry 5100 (class 2606 OID 1166655)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 5074 (class 2606 OID 1166567)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 5223 (class 2606 OID 1167203)
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- TOC entry 5134 (class 2606 OID 1166814)
-- Name: target_types_company target_types_company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_types_company
    ADD CONSTRAINT target_types_company_pkey PRIMARY KEY (id);


--
-- TOC entry 5124 (class 2606 OID 1166761)
-- Name: target_types target_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_types
    ADD CONSTRAINT target_types_pkey PRIMARY KEY (id);


--
-- TOC entry 5191 (class 2606 OID 1167035)
-- Name: temp_check_lists temp_check_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_check_lists
    ADD CONSTRAINT temp_check_lists_pkey PRIMARY KEY (id);


--
-- TOC entry 5193 (class 2606 OID 1167042)
-- Name: temp_cost_break_downs temp_cost_break_downs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_cost_break_downs
    ADD CONSTRAINT temp_cost_break_downs_pkey PRIMARY KEY (id);


--
-- TOC entry 5189 (class 2606 OID 1167028)
-- Name: temp_itineraries temp_itineraries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_itineraries
    ADD CONSTRAINT temp_itineraries_pkey PRIMARY KEY (id);


--
-- TOC entry 5187 (class 2606 OID 1167021)
-- Name: temp_journeys temp_journeys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_journeys
    ADD CONSTRAINT temp_journeys_pkey PRIMARY KEY (id);


--
-- TOC entry 5090 (class 2606 OID 1166624)
-- Name: temp_users temp_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users
    ADD CONSTRAINT temp_users_pkey PRIMARY KEY (id);


--
-- TOC entry 5199 (class 2606 OID 1167092)
-- Name: user_activities user_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activities
    ADD CONSTRAINT user_activities_pkey PRIMARY KEY (id);


--
-- TOC entry 5219 (class 2606 OID 1167183)
-- Name: user_loged_devices user_loged_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_loged_devices
    ADD CONSTRAINT user_loged_devices_pkey PRIMARY KEY (id);


--
-- TOC entry 5067 (class 2606 OID 1166553)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 5069 (class 2606 OID 1166551)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 5156 (class 1259 OID 1166917)
-- Name: activity_log_log_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activity_log_log_name_index ON public.activity_log USING btree (log_name);


--
-- TOC entry 5159 (class 1259 OID 1166916)
-- Name: causer; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX causer ON public.activity_log USING btree (causer_type, causer_id);


--
-- TOC entry 5208 (class 1259 OID 1167152)
-- Name: idx_post_poll_votes_post_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_post_poll_votes_post_id ON public.poll_votes USING btree (post_id);


--
-- TOC entry 5209 (class 1259 OID 1167153)
-- Name: idx_post_poll_votes_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_post_poll_votes_user_id ON public.poll_votes USING btree (user_id);


--
-- TOC entry 5082 (class 1259 OID 1166593)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- TOC entry 5101 (class 1259 OID 1166661)
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);


--
-- TOC entry 5104 (class 1259 OID 1166672)
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


--
-- TOC entry 5153 (class 1259 OID 1166894)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 5183 (class 1259 OID 1166999)
-- Name: personals_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personals_access_tokens_tokenable_type_tokenable_id_index ON public.personals_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 5072 (class 1259 OID 1166569)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 5075 (class 1259 OID 1166568)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- TOC entry 5160 (class 1259 OID 1166915)
-- Name: subject; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX subject ON public.activity_log USING btree (subject_type, subject_id);


--
-- TOC entry 5232 (class 2606 OID 1167075)
-- Name: bookmarks bookmarks_journey_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_journey_id_foreign FOREIGN KEY (journey_id) REFERENCES public.journeys(id) ON DELETE SET NULL;


--
-- TOC entry 5233 (class 2606 OID 1167070)
-- Name: bookmarks bookmarks_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- TOC entry 5228 (class 2606 OID 1166802)
-- Name: events events_event_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_event_type_id_foreign FOREIGN KEY (event_type_id) REFERENCES public.event_types(id) ON DELETE CASCADE;


--
-- TOC entry 5230 (class 2606 OID 1167057)
-- Name: follows follows_followed_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_followed_id_foreign FOREIGN KEY (followed_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5231 (class 2606 OID 1167052)
-- Name: follows follows_follower_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_follower_id_foreign FOREIGN KEY (follower_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5224 (class 2606 OID 1166662)
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- TOC entry 5225 (class 2606 OID 1166673)
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 5229 (class 2606 OID 1166880)
-- Name: poll_options poll_options_poll_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poll_options
    ADD CONSTRAINT poll_options_poll_id_foreign FOREIGN KEY (poll_id) REFERENCES public.polls(id) ON DELETE CASCADE;


--
-- TOC entry 5226 (class 2606 OID 1166683)
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- TOC entry 5227 (class 2606 OID 1166688)
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 5508 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2025-08-02 18:03:06

--
-- PostgreSQL database dump complete
--

