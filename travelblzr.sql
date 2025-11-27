--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.0

-- Started on 2025-03-10 07:35:41

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 737213)
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 737220)
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 737363)
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
-- TOC entry 5120 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN challenges.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.challenges.user_id IS 'to understand whom is created';


--
-- TOC entry 5121 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN challenges.challenge_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.challenges.challenge_type IS '1 for all, 2 for company, 3 for individual';


--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN challenges.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.challenges.status IS '1 for active, 0 for inactive';


--
-- TOC entry 250 (class 1259 OID 737371)
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
-- TOC entry 249 (class 1259 OID 737370)
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
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 249
-- Name: challenges_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.challenges_companies_id_seq OWNED BY public.challenges_companies.id;


--
-- TOC entry 247 (class 1259 OID 737362)
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
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 247
-- Name: challenges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.challenges_id_seq OWNED BY public.challenges.id;


--
-- TOC entry 268 (class 1259 OID 737466)
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
-- TOC entry 267 (class 1259 OID 737465)
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
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 267
-- Name: checklists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.checklists_id_seq OWNED BY public.checklists.id;


--
-- TOC entry 242 (class 1259 OID 737340)
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
-- TOC entry 241 (class 1259 OID 737339)
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
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 241
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- TOC entry 256 (class 1259 OID 737401)
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
-- TOC entry 255 (class 1259 OID 737400)
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
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 255
-- Name: cms_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cms_pages_id_seq OWNED BY public.cms_pages.id;


--
-- TOC entry 229 (class 1259 OID 737257)
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
-- TOC entry 228 (class 1259 OID 737256)
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
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 228
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- TOC entry 270 (class 1259 OID 737484)
-- Name: cost_breakdowns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cost_breakdowns (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    journey_id bigint NOT NULL,
    item character varying(255) NOT NULL,
    price numeric(10,2) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.cost_breakdowns OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 737483)
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
-- TOC entry 5129 (class 0 OID 0)
-- Dependencies: 269
-- Name: cost_breakdowns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cost_breakdowns_id_seq OWNED BY public.cost_breakdowns.id;


--
-- TOC entry 238 (class 1259 OID 737326)
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
-- TOC entry 5130 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN countries.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.countries.status IS '0: Inactive, 1: Active';


--
-- TOC entry 5131 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN countries.dial_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.countries.dial_code IS 'Country dialing code';


--
-- TOC entry 237 (class 1259 OID 737325)
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
-- TOC entry 5132 (class 0 OID 0)
-- Dependencies: 237
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- TOC entry 240 (class 1259 OID 737333)
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
-- TOC entry 239 (class 1259 OID 737332)
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
-- TOC entry 5133 (class 0 OID 0)
-- Dependencies: 239
-- Name: emirates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emirates_id_seq OWNED BY public.emirates.id;


--
-- TOC entry 254 (class 1259 OID 737393)
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
-- TOC entry 253 (class 1259 OID 737392)
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
-- TOC entry 5134 (class 0 OID 0)
-- Dependencies: 253
-- Name: event_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_types_id_seq OWNED BY public.event_types.id;


--
-- TOC entry 260 (class 1259 OID 737422)
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
-- TOC entry 259 (class 1259 OID 737421)
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
-- TOC entry 5135 (class 0 OID 0)
-- Dependencies: 259
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- TOC entry 227 (class 1259 OID 737245)
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
-- TOC entry 226 (class 1259 OID 737244)
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
-- TOC entry 5136 (class 0 OID 0)
-- Dependencies: 226
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 258 (class 1259 OID 737412)
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
-- TOC entry 257 (class 1259 OID 737411)
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
-- TOC entry 5137 (class 0 OID 0)
-- Dependencies: 257
-- Name: faqs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faqs_id_seq OWNED BY public.faqs.id;


--
-- TOC entry 266 (class 1259 OID 737457)
-- Name: itineraries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.itineraries (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    journey_id bigint NOT NULL,
    date date NOT NULL,
    description text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.itineraries OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 737456)
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
-- TOC entry 5138 (class 0 OID 0)
-- Dependencies: 265
-- Name: itineraries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.itineraries_id_seq OWNED BY public.itineraries.id;


--
-- TOC entry 225 (class 1259 OID 737237)
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
-- TOC entry 224 (class 1259 OID 737228)
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
-- TOC entry 223 (class 1259 OID 737227)
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
-- TOC entry 5139 (class 0 OID 0)
-- Dependencies: 223
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- TOC entry 264 (class 1259 OID 737448)
-- Name: journeys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journeys (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    destination character varying(255) NOT NULL,
    accommodation character varying(255) NOT NULL,
    accommodation_link character varying(255),
    date date NOT NULL,
    itinerary text NOT NULL,
    checklist text NOT NULL,
    flight_cost numeric(10,2) NOT NULL,
    accommodation_cost numeric(10,2) NOT NULL,
    excursion_cost numeric(10,2) NOT NULL,
    food_cost numeric(10,2) NOT NULL,
    misc_cost numeric(10,2) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    user_id bigint,
    total numeric(10,2) DEFAULT '0'::numeric NOT NULL
);


ALTER TABLE public.journeys OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 737447)
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
-- TOC entry 5140 (class 0 OID 0)
-- Dependencies: 263
-- Name: journeys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journeys_id_seq OWNED BY public.journeys.id;


--
-- TOC entry 216 (class 1259 OID 737180)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 737179)
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
-- TOC entry 5141 (class 0 OID 0)
-- Dependencies: 215
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 234 (class 1259 OID 737288)
-- Name: model_has_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_permissions OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 737299)
-- Name: model_has_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_roles OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 737347)
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
-- TOC entry 5142 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN packages.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.packages.status IS '0 - Inactive, 1 - Active';


--
-- TOC entry 246 (class 1259 OID 737355)
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
-- TOC entry 245 (class 1259 OID 737354)
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
-- TOC entry 5143 (class 0 OID 0)
-- Dependencies: 245
-- Name: packages_addons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.packages_addons_id_seq OWNED BY public.packages_addons.id;


--
-- TOC entry 243 (class 1259 OID 737346)
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
-- TOC entry 5144 (class 0 OID 0)
-- Dependencies: 243
-- Name: packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.packages_id_seq OWNED BY public.packages.id;


--
-- TOC entry 219 (class 1259 OID 737197)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 737267)
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
-- TOC entry 230 (class 1259 OID 737266)
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
-- TOC entry 5145 (class 0 OID 0)
-- Dependencies: 230
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- TOC entry 272 (class 1259 OID 737492)
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    title character varying(255),
    description text NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    image character varying(255),
    comments bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 737491)
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
-- TOC entry 5146 (class 0 OID 0)
-- Dependencies: 271
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- TOC entry 236 (class 1259 OID 737310)
-- Name: role_has_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_has_permissions OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 737278)
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
-- TOC entry 232 (class 1259 OID 737277)
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
-- TOC entry 5147 (class 0 OID 0)
-- Dependencies: 232
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 220 (class 1259 OID 737204)
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
-- TOC entry 252 (class 1259 OID 737385)
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
-- TOC entry 262 (class 1259 OID 737438)
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
-- TOC entry 261 (class 1259 OID 737437)
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
-- TOC entry 5148 (class 0 OID 0)
-- Dependencies: 261
-- Name: target_types_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.target_types_company_id_seq OWNED BY public.target_types_company.id;


--
-- TOC entry 251 (class 1259 OID 737384)
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
-- TOC entry 5149 (class 0 OID 0)
-- Dependencies: 251
-- Name: target_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.target_types_id_seq OWNED BY public.target_types.id;


--
-- TOC entry 218 (class 1259 OID 737187)
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
-- TOC entry 217 (class 1259 OID 737186)
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
-- TOC entry 5150 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4804 (class 2604 OID 737366)
-- Name: challenges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges ALTER COLUMN id SET DEFAULT nextval('public.challenges_id_seq'::regclass);


--
-- TOC entry 4806 (class 2604 OID 737374)
-- Name: challenges_companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges_companies ALTER COLUMN id SET DEFAULT nextval('public.challenges_companies_id_seq'::regclass);


--
-- TOC entry 4822 (class 2604 OID 737469)
-- Name: checklists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checklists ALTER COLUMN id SET DEFAULT nextval('public.checklists_id_seq'::regclass);


--
-- TOC entry 4799 (class 2604 OID 737343)
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- TOC entry 4811 (class 2604 OID 737404)
-- Name: cms_pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cms_pages ALTER COLUMN id SET DEFAULT nextval('public.cms_pages_id_seq'::regclass);


--
-- TOC entry 4792 (class 2604 OID 737260)
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- TOC entry 4824 (class 2604 OID 737487)
-- Name: cost_breakdowns id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_breakdowns ALTER COLUMN id SET DEFAULT nextval('public.cost_breakdowns_id_seq'::regclass);


--
-- TOC entry 4795 (class 2604 OID 737329)
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- TOC entry 4797 (class 2604 OID 737336)
-- Name: emirates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emirates ALTER COLUMN id SET DEFAULT nextval('public.emirates_id_seq'::regclass);


--
-- TOC entry 4809 (class 2604 OID 737396)
-- Name: event_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_types ALTER COLUMN id SET DEFAULT nextval('public.event_types_id_seq'::regclass);


--
-- TOC entry 4815 (class 2604 OID 737425)
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- TOC entry 4790 (class 2604 OID 737248)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 4813 (class 2604 OID 737415)
-- Name: faqs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faqs ALTER COLUMN id SET DEFAULT nextval('public.faqs_id_seq'::regclass);


--
-- TOC entry 4821 (class 2604 OID 737460)
-- Name: itineraries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itineraries ALTER COLUMN id SET DEFAULT nextval('public.itineraries_id_seq'::regclass);


--
-- TOC entry 4789 (class 2604 OID 737231)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 4819 (class 2604 OID 737451)
-- Name: journeys id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journeys ALTER COLUMN id SET DEFAULT nextval('public.journeys_id_seq'::regclass);


--
-- TOC entry 4786 (class 2604 OID 737183)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 4801 (class 2604 OID 737350)
-- Name: packages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages ALTER COLUMN id SET DEFAULT nextval('public.packages_id_seq'::regclass);


--
-- TOC entry 4803 (class 2604 OID 737358)
-- Name: packages_addons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages_addons ALTER COLUMN id SET DEFAULT nextval('public.packages_addons_id_seq'::regclass);


--
-- TOC entry 4793 (class 2604 OID 737270)
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- TOC entry 4825 (class 2604 OID 737495)
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- TOC entry 4794 (class 2604 OID 737281)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 4807 (class 2604 OID 737388)
-- Name: target_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_types ALTER COLUMN id SET DEFAULT nextval('public.target_types_id_seq'::regclass);


--
-- TOC entry 4817 (class 2604 OID 737441)
-- Name: target_types_company id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_types_company ALTER COLUMN id SET DEFAULT nextval('public.target_types_company_id_seq'::regclass);


--
-- TOC entry 4787 (class 2604 OID 737190)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5062 (class 0 OID 737213)
-- Dependencies: 221
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- TOC entry 5063 (class 0 OID 737220)
-- Dependencies: 222
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- TOC entry 5089 (class 0 OID 737363)
-- Dependencies: 248
-- Data for Name: challenges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.challenges (id, user_id, name, challenge_type, target_type, target_value, start_date, end_date, status, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 5091 (class 0 OID 737371)
-- Dependencies: 250
-- Data for Name: challenges_companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.challenges_companies (id, challenge_id, company_id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 5109 (class 0 OID 737466)
-- Dependencies: 268
-- Data for Name: checklists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.checklists (id, user_id, journey_id, item, is_checked, created_at, updated_at) FROM stdin;
1	2	1	Passport	t	\N	\N
2	2	1	Sunscreen	f	\N	\N
3	2	1	Swimsuit	f	\N	\N
\.


--
-- TOC entry 5083 (class 0 OID 737340)
-- Dependencies: 242
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
-- TOC entry 5097 (class 0 OID 737401)
-- Dependencies: 256
-- Data for Name: cms_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cms_pages (id, title, content, status, created_at, updated_at) FROM stdin;
1	About us		Draft	2025-03-10 02:33:43	2025-03-10 02:33:43
2	Terms and conditions		Draft	2025-03-10 02:33:46	2025-03-10 02:33:46
3	Privacy policy		Draft	2025-03-10 02:33:48	2025-03-10 02:33:48
\.


--
-- TOC entry 5070 (class 0 OID 737257)
-- Dependencies: 229
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (id, name, name_ar, brand_logo, description, description_ar, address, trade_license, trade_license_expiry, user_id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 5111 (class 0 OID 737484)
-- Dependencies: 270
-- Data for Name: cost_breakdowns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cost_breakdowns (id, user_id, journey_id, item, price, created_at, updated_at) FROM stdin;
1	1	1	Flight	500.00	\N	\N
6	2	2	Excursions	200.00	\N	\N
2	1	1	Accomodation	300.00	\N	\N
3	1	1	Taxi/Transportation	100.00	\N	\N
4	2	1	Food	700.00	\N	\N
5	2	1	Misc	400.00	\N	\N
\.


--
-- TOC entry 5079 (class 0 OID 737326)
-- Dependencies: 238
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, name, created_at, updated_at, status, dial_code) FROM stdin;
1	United Arab Emirates	2025-03-09 21:04:33	2025-03-09 21:06:33	1	\N
2	United Arab Emirates	2025-03-09 21:16:01	2025-03-09 21:16:01	0	\N
3	United Arab Emirates	2025-03-09 21:16:24	2025-03-09 21:16:24	0	\N
4	United Arab Emirates	2025-03-09 21:18:49	2025-03-09 21:18:49	0	\N
\.


--
-- TOC entry 5081 (class 0 OID 737333)
-- Dependencies: 240
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
-- TOC entry 5095 (class 0 OID 737393)
-- Dependencies: 254
-- Data for Name: event_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_types (id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5101 (class 0 OID 737422)
-- Dependencies: 260
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, name, event_type_id, start_date, end_date, status, description, images, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5068 (class 0 OID 737245)
-- Dependencies: 227
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 5099 (class 0 OID 737412)
-- Dependencies: 258
-- Data for Name: faqs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faqs (id, question, answer, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5107 (class 0 OID 737457)
-- Dependencies: 266
-- Data for Name: itineraries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.itineraries (id, user_id, journey_id, date, description, created_at, updated_at) FROM stdin;
1	2	1	2025-07-10	Visit the world's tallest lounge and view a stunning cityscape	2025-03-10 00:00:00	\N
2	2	1	2025-09-15	Marvel at the beauty of the dancing fountains	2025-03-10 00:00:00	\N
3	2	1	2025-11-20	See the city from an elevated glass slide, bridge or tower-encircling ledge	2025-03-10 00:00:00	\N
\.


--
-- TOC entry 5066 (class 0 OID 737237)
-- Dependencies: 225
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- TOC entry 5065 (class 0 OID 737228)
-- Dependencies: 224
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- TOC entry 5105 (class 0 OID 737448)
-- Dependencies: 264
-- Data for Name: journeys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journeys (id, title, destination, accommodation, accommodation_link, date, itinerary, checklist, flight_cost, accommodation_cost, excursion_cost, food_cost, misc_cost, created_at, updated_at, user_id, total) FROM stdin;
1	 Iconic Views of Sharjah with Premium Beverages	Dubai	Burj Al Arab	https://insideburjalarab.com/en/tour-booking/tour-plus-access-to-25th-floor-observation-lounge?csrt=3947874899349091956	2025-07-10	Day 1: Beach relaxation, Day 2: Scuba diving, Day 3: Sunset cruise	Passport, Sunscreen, Swimsuit	600.00	900.00	350.00	250.00	120.00	2025-03-10 00:00:00	\N	2	0.00
2	 Iconic Views of Abu Dubaiwith Premium Beverages	Dubai	Burj Al Arab	https://insideburjalarab.com/en/tour-booking/tour-plus-access-to-25th-floor-observation-lounge?csrt=3947874899349091956	2025-09-15	Day 1: Eiffel Tower, Day 2: Louvre Museum, Day 3: Seine River Cruise	Travel documents, Camera, Comfortable shoes	700.00	1200.00	500.00	400.00	150.00	2025-03-10 00:00:00	\N	2	0.00
3	 Iconic Views of Dubai with Premium Beverages	Dubai	Burj Al Arab	https://insideburjalarab.com/en/tour-booking/tour-plus-access-to-25th-floor-observation-lounge?csrt=3947874899349091956	2025-11-20	Day 1: Game drive, Day 2: Hot air balloon safari, Day 3: Cultural tour	Safari gear, Binoculars, Insect repellent	800.00	1100.00	600.00	350.00	200.00	2025-03-10 00:00:00	\N	2	0.00
\.


--
-- TOC entry 5057 (class 0 OID 737180)
-- Dependencies: 216
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
\.


--
-- TOC entry 5075 (class 0 OID 737288)
-- Dependencies: 234
-- Data for Name: model_has_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
\.


--
-- TOC entry 5076 (class 0 OID 737299)
-- Dependencies: 235
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
1	App\\Models\\User	1
3	App\\Models\\User	2
3	App\\Models\\User	3
3	App\\Models\\User	4
3	App\\Models\\User	5
3	App\\Models\\User	6
\.


--
-- TOC entry 5085 (class 0 OID 737347)
-- Dependencies: 244
-- Data for Name: packages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.packages (id, name, price, status, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 5087 (class 0 OID 737355)
-- Dependencies: 246
-- Data for Name: packages_addons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.packages_addons (id, package_id, title, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5060 (class 0 OID 737197)
-- Dependencies: 219
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 5072 (class 0 OID 737267)
-- Dependencies: 231
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (id, name, guard_name, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5113 (class 0 OID 737492)
-- Dependencies: 272
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, title, description, user_id, created_at, updated_at, image, comments) FROM stdin;
3	First Post	Discover Dubai's best Ramadan markets packed with special products and entertaining activities for all ages.	3	2025-03-10 02:16:40	2025-03-10 02:16:40	dubai.png	0
4	Second Post	Discover Dubai's best Ramadan markets packed with special products and entertaining activities for all ages.	2	2025-03-10 02:16:40	2025-03-10 02:16:40	dubai.png	0
\.


--
-- TOC entry 5077 (class 0 OID 737310)
-- Dependencies: 236
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
\.


--
-- TOC entry 5074 (class 0 OID 737278)
-- Dependencies: 233
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
1	Admin	web	2025-03-09 21:04:33	2025-03-09 21:04:33
2	Company	web	2025-03-09 21:04:33	2025-03-09 21:04:33
3	Individual	web	2025-03-09 21:04:33	2025-03-09 21:04:33
4	Staff	web	2025-03-09 21:04:33	2025-03-09 21:04:33
\.


--
-- TOC entry 5061 (class 0 OID 737204)
-- Dependencies: 220
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
e6mjbGrEzP7ulwNtb6HXTbWRNj7GbuXOB6sBxhxL	1	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoicGpPY3dxanpZVTZIaFZzdFNoTnNGTEZ1ZGpiNGswQzUwZDFzQ2gzZCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1MDoiaHR0cDovL2xvY2FsaG9zdC90cmF2ZWxibHpyX3dlYi9wdWJsaWMvYWRtaW4vdXNlcnMiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo1MDoiaHR0cDovL2xvY2FsaG9zdC90cmF2ZWxibHpyX3dlYi9wdWJsaWMvYWRtaW4vdXNlcnMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=	1741561141
eDI6GRqvzWdSI5bPjhLIjyDqrW33R2u9ViWYd7vP	1	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZGJTN0FJOTFBaGlURXVVOEkzUXJnSU9zSDRBTWZIRWhrcU5jZERPRCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1MjoiaHR0cDovL2xvY2FsaG9zdC90cmF2ZWxibHpyX3dlYi9wdWJsaWMvYWRtaW4vam91cm5leSI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjUyOiJodHRwOi8vbG9jYWxob3N0L3RyYXZlbGJsenJfd2ViL3B1YmxpYy9hZG1pbi9qb3VybmV5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9	1741574044
\.


--
-- TOC entry 5093 (class 0 OID 737385)
-- Dependencies: 252
-- Data for Name: target_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.target_types (id, name, status, created_at, updated_at, company_id) FROM stdin;
\.


--
-- TOC entry 5103 (class 0 OID 737438)
-- Dependencies: 262
-- Data for Name: target_types_company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.target_types_company (id, company_id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5059 (class 0 OID 737187)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, first_name, last_name, dial_code, phone, country_id, emirates_id, city_id, company_id, status, deleted_at, role_id) FROM stdin;
2	Charissa Ross	sajyfu@mailinator.com	\N	$2y$12$Rez1W0F2KwEs/qJpRHaQiOHMX95soah95q5hp/wuYvLSqwhR1G9M.	\N	2025-03-09 21:07:03	2025-03-09 21:07:03	Charissa	Ross	\N	\N	1	\N	\N	\N	1	\N	\N
1	Admin User	admin@admin.com	\N	$2y$12$62KaM707H8nJg2LBzu0BE.tjeg7X25TzxjQFi1MnqBV0fOOrarhGG	\N	2025-03-09 21:04:34	2025-03-09 21:18:50	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N
3	Adele Brown	migyhul@mailinator.com	\N	$2y$12$aHhm0hVoCxsliqfbf0ybyedDS4nT8cQqxMKcpsSfyramrj0Zp8aG6	\N	2025-03-09 22:36:48	2025-03-09 22:36:48	Adele	Brown	\N	\N	1	\N	\N	\N	1	\N	\N
5	Darius Whitaker	jazybugij@mailinator.com	\N	$2y$12$hMAlgJJG2wjnWRY0w8wDre1DOmNwbxdegNPb/J6Ewe0J4l4jUR.2O	\N	2025-03-09 22:37:08	2025-03-09 22:37:15	Darius	Whitaker	\N	\N	1	\N	\N	\N	1	\N	\N
4	Chester Valenzuela	cowytavo@mailinator.com	\N	$2y$12$ekwsnsutkfx/algSnUG2bOJMrYL/TP8s3koRDJ7sYwRT3DDO3CeMK	\N	2025-03-09 22:36:59	2025-03-09 22:37:19	Chester	Valenzuela	\N	\N	1	\N	\N	\N	1	\N	\N
6	Carissa Middleton	lomun@mailinator.com	\N	$2y$12$DRMV7ZYfawA8NLGD75oM8.wDdQL6giY8T1nxsxL8zZJ30M2syZe9i	\N	2025-03-09 22:37:26	2025-03-09 22:59:01	Carissa	Middleton	\N	\N	1	\N	\N	\N	1	\N	\N
\.


--
-- TOC entry 5151 (class 0 OID 0)
-- Dependencies: 249
-- Name: challenges_companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.challenges_companies_id_seq', 1, false);


--
-- TOC entry 5152 (class 0 OID 0)
-- Dependencies: 247
-- Name: challenges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.challenges_id_seq', 1, false);


--
-- TOC entry 5153 (class 0 OID 0)
-- Dependencies: 267
-- Name: checklists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.checklists_id_seq', 3, true);


--
-- TOC entry 5154 (class 0 OID 0)
-- Dependencies: 241
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 24, true);


--
-- TOC entry 5155 (class 0 OID 0)
-- Dependencies: 255
-- Name: cms_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cms_pages_id_seq', 3, true);


--
-- TOC entry 5156 (class 0 OID 0)
-- Dependencies: 228
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_id_seq', 1, false);


--
-- TOC entry 5157 (class 0 OID 0)
-- Dependencies: 269
-- Name: cost_breakdowns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cost_breakdowns_id_seq', 6, true);


--
-- TOC entry 5158 (class 0 OID 0)
-- Dependencies: 237
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 4, true);


--
-- TOC entry 5159 (class 0 OID 0)
-- Dependencies: 239
-- Name: emirates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.emirates_id_seq', 12, true);


--
-- TOC entry 5160 (class 0 OID 0)
-- Dependencies: 253
-- Name: event_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_types_id_seq', 1, false);


--
-- TOC entry 5161 (class 0 OID 0)
-- Dependencies: 259
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 1, false);


--
-- TOC entry 5162 (class 0 OID 0)
-- Dependencies: 226
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 5163 (class 0 OID 0)
-- Dependencies: 257
-- Name: faqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faqs_id_seq', 1, false);


--
-- TOC entry 5164 (class 0 OID 0)
-- Dependencies: 265
-- Name: itineraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.itineraries_id_seq', 3, true);


--
-- TOC entry 5165 (class 0 OID 0)
-- Dependencies: 223
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 5166 (class 0 OID 0)
-- Dependencies: 263
-- Name: journeys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journeys_id_seq', 3, true);


--
-- TOC entry 5167 (class 0 OID 0)
-- Dependencies: 215
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 37, true);


--
-- TOC entry 5168 (class 0 OID 0)
-- Dependencies: 245
-- Name: packages_addons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.packages_addons_id_seq', 1, false);


--
-- TOC entry 5169 (class 0 OID 0)
-- Dependencies: 243
-- Name: packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.packages_id_seq', 1, false);


--
-- TOC entry 5170 (class 0 OID 0)
-- Dependencies: 230
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 1, false);


--
-- TOC entry 5171 (class 0 OID 0)
-- Dependencies: 271
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 4, true);


--
-- TOC entry 5172 (class 0 OID 0)
-- Dependencies: 232
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- TOC entry 5173 (class 0 OID 0)
-- Dependencies: 261
-- Name: target_types_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.target_types_company_id_seq', 1, false);


--
-- TOC entry 5174 (class 0 OID 0)
-- Dependencies: 251
-- Name: target_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.target_types_id_seq', 1, false);


--
-- TOC entry 5175 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- TOC entry 4844 (class 2606 OID 737226)
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- TOC entry 4842 (class 2606 OID 737219)
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- TOC entry 4885 (class 2606 OID 737376)
-- Name: challenges_companies challenges_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges_companies
    ADD CONSTRAINT challenges_companies_pkey PRIMARY KEY (id);


--
-- TOC entry 4883 (class 2606 OID 737369)
-- Name: challenges challenges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges
    ADD CONSTRAINT challenges_pkey PRIMARY KEY (id);


--
-- TOC entry 4903 (class 2606 OID 737472)
-- Name: checklists checklists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checklists
    ADD CONSTRAINT checklists_pkey PRIMARY KEY (id);


--
-- TOC entry 4877 (class 2606 OID 737345)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 4891 (class 2606 OID 737410)
-- Name: cms_pages cms_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cms_pages
    ADD CONSTRAINT cms_pages_pkey PRIMARY KEY (id);


--
-- TOC entry 4855 (class 2606 OID 737265)
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- TOC entry 4905 (class 2606 OID 737489)
-- Name: cost_breakdowns cost_breakdowns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_breakdowns
    ADD CONSTRAINT cost_breakdowns_pkey PRIMARY KEY (id);


--
-- TOC entry 4873 (class 2606 OID 737331)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 4875 (class 2606 OID 737338)
-- Name: emirates emirates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emirates
    ADD CONSTRAINT emirates_pkey PRIMARY KEY (id);


--
-- TOC entry 4889 (class 2606 OID 737399)
-- Name: event_types event_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_types
    ADD CONSTRAINT event_types_pkey PRIMARY KEY (id);


--
-- TOC entry 4895 (class 2606 OID 737431)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 4851 (class 2606 OID 737253)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4853 (class 2606 OID 737255)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 4893 (class 2606 OID 737420)
-- Name: faqs faqs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faqs
    ADD CONSTRAINT faqs_pkey PRIMARY KEY (id);


--
-- TOC entry 4901 (class 2606 OID 737464)
-- Name: itineraries itineraries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itineraries
    ADD CONSTRAINT itineraries_pkey PRIMARY KEY (id);


--
-- TOC entry 4849 (class 2606 OID 737243)
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 4846 (class 2606 OID 737235)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4899 (class 2606 OID 737455)
-- Name: journeys journeys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journeys
    ADD CONSTRAINT journeys_pkey PRIMARY KEY (id);


--
-- TOC entry 4830 (class 2606 OID 737185)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4866 (class 2606 OID 737298)
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- TOC entry 4869 (class 2606 OID 737309)
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- TOC entry 4881 (class 2606 OID 737360)
-- Name: packages_addons packages_addons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages_addons
    ADD CONSTRAINT packages_addons_pkey PRIMARY KEY (id);


--
-- TOC entry 4879 (class 2606 OID 737353)
-- Name: packages packages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (id);


--
-- TOC entry 4836 (class 2606 OID 737203)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 4857 (class 2606 OID 737276)
-- Name: permissions permissions_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);


--
-- TOC entry 4859 (class 2606 OID 737274)
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4907 (class 2606 OID 737499)
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- TOC entry 4871 (class 2606 OID 737324)
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- TOC entry 4861 (class 2606 OID 737287)
-- Name: roles roles_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);


--
-- TOC entry 4863 (class 2606 OID 737285)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4839 (class 2606 OID 737210)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 4897 (class 2606 OID 737444)
-- Name: target_types_company target_types_company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_types_company
    ADD CONSTRAINT target_types_company_pkey PRIMARY KEY (id);


--
-- TOC entry 4887 (class 2606 OID 737391)
-- Name: target_types target_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_types
    ADD CONSTRAINT target_types_pkey PRIMARY KEY (id);


--
-- TOC entry 4832 (class 2606 OID 737196)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 4834 (class 2606 OID 737194)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4847 (class 1259 OID 737236)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- TOC entry 4864 (class 1259 OID 737291)
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);


--
-- TOC entry 4867 (class 1259 OID 737302)
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


--
-- TOC entry 4837 (class 1259 OID 737212)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 4840 (class 1259 OID 737211)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- TOC entry 4912 (class 2606 OID 737432)
-- Name: events events_event_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_event_type_id_foreign FOREIGN KEY (event_type_id) REFERENCES public.event_types(id) ON DELETE CASCADE;


--
-- TOC entry 4908 (class 2606 OID 737292)
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- TOC entry 4909 (class 2606 OID 737303)
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 4910 (class 2606 OID 737313)
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- TOC entry 4911 (class 2606 OID 737318)
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2025-03-10 07:35:41

--
-- PostgreSQL database dump complete
--

