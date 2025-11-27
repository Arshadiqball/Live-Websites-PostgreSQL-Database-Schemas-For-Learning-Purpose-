--
-- mydrworldQL database dump
--

-- Dumped from database version 12.18
-- Dumped by pg_dump version 12.18

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
-- Name: articles; Type: TABLE; Schema: public; Owner: mydrworld
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


ALTER TABLE public.articles OWNER TO mydrworld;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_id_seq OWNER TO mydrworld;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: cache; Type: TABLE; Schema: public; Owner: mydrworld
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO mydrworld;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: mydrworld
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO mydrworld;

--
-- Name: contact_us_settings; Type: TABLE; Schema: public; Owner: mydrworld
--

CREATE TABLE public.contact_us_settings (
    id bigint NOT NULL,
    title_en character varying(300),
    title_ar character varying(300),
    email character varying(300),
    mobile character varying(50),
    desc_en text,
    desc_ar text,
    location text,
    latitude text,
    longitude text,
    twitter character varying(600),
    instagram character varying(600),
    facebook character varying(600),
    youtube character varying(600),
    linkedin character varying(600),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.contact_us_settings OWNER TO mydrworld;

--
-- Name: contact_us_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.contact_us_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_us_settings_id_seq OWNER TO mydrworld;

--
-- Name: contact_us_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.contact_us_settings_id_seq OWNED BY public.contact_us_settings.id;


--
-- Name: country; Type: TABLE; Schema: public; Owner: mydrworld
--

CREATE TABLE public.country (
    id bigint NOT NULL,
    name character varying(1500) NOT NULL,
    prefix character varying(20) NOT NULL,
    dial_code character varying(100) NOT NULL,
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.country OWNER TO mydrworld;

--
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_id_seq OWNER TO mydrworld;

--
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: mydrworld
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


ALTER TABLE public.failed_jobs OWNER TO mydrworld;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO mydrworld;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: faq; Type: TABLE; Schema: public; Owner: mydrworld
--

CREATE TABLE public.faq (
    id bigint NOT NULL,
    title character varying(600),
    description text,
    created_by integer DEFAULT 0 NOT NULL,
    updated_by integer DEFAULT 0 NOT NULL,
    active integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.faq OWNER TO mydrworld;

--
-- Name: faq_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.faq_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faq_id_seq OWNER TO mydrworld;

--
-- Name: faq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.faq_id_seq OWNED BY public.faq.id;


--
-- Name: help; Type: TABLE; Schema: public; Owner: mydrworld
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


ALTER TABLE public.help OWNER TO mydrworld;

--
-- Name: help_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.help_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.help_id_seq OWNER TO mydrworld;

--
-- Name: help_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.help_id_seq OWNED BY public.help.id;


--
-- Name: insurence_policies; Type: TABLE; Schema: public; Owner: mydrworld
--

CREATE TABLE public.insurence_policies (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    title_ar character varying(255),
    status integer DEFAULT 1 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    last_updated_by integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.insurence_policies OWNER TO mydrworld;

--
-- Name: insurence_policies_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.insurence_policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insurence_policies_id_seq OWNER TO mydrworld;

--
-- Name: insurence_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.insurence_policies_id_seq OWNED BY public.insurence_policies.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: mydrworld
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


ALTER TABLE public.job_batches OWNER TO mydrworld;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: mydrworld
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


ALTER TABLE public.jobs OWNER TO mydrworld;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO mydrworld;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: mydrworld
--

CREATE TABLE public.languages (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    title_ar character varying(255),
    status integer DEFAULT 1 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    last_updated_by integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.languages OWNER TO mydrworld;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO mydrworld;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- Name: licence_types; Type: TABLE; Schema: public; Owner: mydrworld
--

CREATE TABLE public.licence_types (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    title_ar character varying(255),
    status integer DEFAULT 1 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    last_updated_by integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.licence_types OWNER TO mydrworld;

--
-- Name: licence_types_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.licence_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.licence_types_id_seq OWNER TO mydrworld;

--
-- Name: licence_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.licence_types_id_seq OWNED BY public.licence_types.id;


--
-- Name: medical_conditions; Type: TABLE; Schema: public; Owner: mydrworld
--

CREATE TABLE public.medical_conditions (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    title_ar character varying(255),
    status integer DEFAULT 1 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    last_updated_by integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.medical_conditions OWNER TO mydrworld;

--
-- Name: medical_conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.medical_conditions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medical_conditions_id_seq OWNER TO mydrworld;

--
-- Name: medical_conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.medical_conditions_id_seq OWNED BY public.medical_conditions.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: mydrworld
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO mydrworld;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO mydrworld;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: mydrworld
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    ticket_number character varying(255) NOT NULL,
    user_id integer NOT NULL,
    product_id integer NOT NULL,
    drow_date date NOT NULL,
    price double precision NOT NULL,
    is_winner integer DEFAULT 0 NOT NULL,
    product_type character varying(255) DEFAULT 'daily'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.orders OWNER TO mydrworld;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO mydrworld;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: mydrworld
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    product_code character varying(255) NOT NULL,
    product_name character varying(255) NOT NULL,
    product_type character varying(255) DEFAULT 'daily'::character varying NOT NULL,
    price double precision DEFAULT '0'::double precision NOT NULL,
    description text,
    file_name text,
    drow_date integer,
    drow_time time(0) without time zone,
    product_status integer DEFAULT 1 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    updated_by integer DEFAULT 0 NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.products OWNER TO mydrworld;

--
-- Name: COLUMN products.product_type; Type: COMMENT; Schema: public; Owner: mydrworld
--

COMMENT ON COLUMN public.products.product_type IS 'daily,monthly';


--
-- Name: COLUMN products.product_status; Type: COMMENT; Schema: public; Owner: mydrworld
--

COMMENT ON COLUMN public.products.product_status IS '1-active,0-inactive';


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO mydrworld;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: profile_bios; Type: TABLE; Schema: public; Owner: mydrworld
--

CREATE TABLE public.profile_bios (
    id bigint NOT NULL,
    value character varying(900),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.profile_bios OWNER TO mydrworld;

--
-- Name: profile_bios_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.profile_bios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profile_bios_id_seq OWNER TO mydrworld;

--
-- Name: profile_bios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.profile_bios_id_seq OWNED BY public.profile_bios.id;


--
-- Name: qualifications; Type: TABLE; Schema: public; Owner: mydrworld
--

CREATE TABLE public.qualifications (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    title_ar character varying(255),
    status integer DEFAULT 1 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    last_updated_by integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.qualifications OWNER TO mydrworld;

--
-- Name: qualifications_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.qualifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qualifications_id_seq OWNER TO mydrworld;

--
-- Name: qualifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.qualifications_id_seq OWNED BY public.qualifications.id;


--
-- Name: role_permissions; Type: TABLE; Schema: public; Owner: mydrworld
--

CREATE TABLE public.role_permissions (
    id bigint NOT NULL,
    user_role_id_fk integer NOT NULL,
    module_key character varying(255) NOT NULL,
    permissions text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.role_permissions OWNER TO mydrworld;

--
-- Name: role_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.role_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_permissions_id_seq OWNER TO mydrworld;

--
-- Name: role_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.role_permissions_id_seq OWNED BY public.role_permissions.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: mydrworld
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    role character varying(255) NOT NULL,
    status smallint DEFAULT '0'::smallint,
    is_admin_role smallint DEFAULT '0'::smallint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO mydrworld;

--
-- Name: COLUMN roles.status; Type: COMMENT; Schema: public; Owner: mydrworld
--

COMMENT ON COLUMN public.roles.status IS '0=inactive, 1=active';


--
-- Name: COLUMN roles.is_admin_role; Type: COMMENT; Schema: public; Owner: mydrworld
--

COMMENT ON COLUMN public.roles.is_admin_role IS '0=not admin role, 1=admin role';


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO mydrworld;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: mydrworld
--

CREATE TABLE public.settings (
    id bigint NOT NULL,
    platform_fee double precision NOT NULL,
    referal_distribution_level_1 double precision DEFAULT '0'::double precision NOT NULL,
    referal_distribution_level_2 double precision DEFAULT '0'::double precision NOT NULL,
    referal_distribution_level_3 double precision DEFAULT '0'::double precision NOT NULL,
    lotery_distribution_level_1 double precision DEFAULT '0'::double precision NOT NULL,
    lotery_distribution_level_2 double precision DEFAULT '0'::double precision NOT NULL,
    lotery_distribution_level_3 double precision DEFAULT '0'::double precision NOT NULL,
    lotery_distribution_level_4 double precision DEFAULT '0'::double precision NOT NULL,
    lotery_distribution_level_5 double precision DEFAULT '0'::double precision NOT NULL,
    lotery_distribution_level_6 double precision DEFAULT '0'::double precision NOT NULL,
    lotery_distribution_level_7 double precision DEFAULT '0'::double precision NOT NULL,
    lotery_distribution_level_8 double precision DEFAULT '0'::double precision NOT NULL,
    lotery_distribution_level_9 double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.settings OWNER TO mydrworld;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO mydrworld;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: special_intrests; Type: TABLE; Schema: public; Owner: mydrworld
--

CREATE TABLE public.special_intrests (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    title_ar character varying(255),
    status integer DEFAULT 1 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    last_updated_by integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.special_intrests OWNER TO mydrworld;

--
-- Name: special_intrests_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.special_intrests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.special_intrests_id_seq OWNER TO mydrworld;

--
-- Name: special_intrests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.special_intrests_id_seq OWNED BY public.special_intrests.id;


--
-- Name: sub_insurence_policies; Type: TABLE; Schema: public; Owner: mydrworld
--

CREATE TABLE public.sub_insurence_policies (
    id bigint NOT NULL,
    insurence_id integer NOT NULL,
    title character varying(255) NOT NULL,
    title_ar character varying(255),
    status integer DEFAULT 1 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    last_updated_by integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.sub_insurence_policies OWNER TO mydrworld;

--
-- Name: sub_insurence_policies_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.sub_insurence_policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sub_insurence_policies_id_seq OWNER TO mydrworld;

--
-- Name: sub_insurence_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.sub_insurence_policies_id_seq OWNED BY public.sub_insurence_policies.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: mydrworld
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255),
    email character varying(255),
    dial_code character varying(255),
    phone character varying(255),
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
    deleted integer DEFAULT 0,
    role_id integer DEFAULT 0,
    active integer DEFAULT 1,
    user_code character varying(255),
    refferal_code character varying(255),
    refered_by integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.users OWNER TO mydrworld;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: mydrworld
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO mydrworld;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mydrworld
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: contact_us_settings id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.contact_us_settings ALTER COLUMN id SET DEFAULT nextval('public.contact_us_settings_id_seq'::regclass);


--
-- Name: country id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: faq id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.faq ALTER COLUMN id SET DEFAULT nextval('public.faq_id_seq'::regclass);


--
-- Name: help id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.help ALTER COLUMN id SET DEFAULT nextval('public.help_id_seq'::regclass);


--
-- Name: insurence_policies id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.insurence_policies ALTER COLUMN id SET DEFAULT nextval('public.insurence_policies_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- Name: licence_types id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.licence_types ALTER COLUMN id SET DEFAULT nextval('public.licence_types_id_seq'::regclass);


--
-- Name: medical_conditions id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.medical_conditions ALTER COLUMN id SET DEFAULT nextval('public.medical_conditions_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: profile_bios id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.profile_bios ALTER COLUMN id SET DEFAULT nextval('public.profile_bios_id_seq'::regclass);


--
-- Name: qualifications id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.qualifications ALTER COLUMN id SET DEFAULT nextval('public.qualifications_id_seq'::regclass);


--
-- Name: role_permissions id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.role_permissions ALTER COLUMN id SET DEFAULT nextval('public.role_permissions_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: special_intrests id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.special_intrests ALTER COLUMN id SET DEFAULT nextval('public.special_intrests_id_seq'::regclass);


--
-- Name: sub_insurence_policies id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.sub_insurence_policies ALTER COLUMN id SET DEFAULT nextval('public.sub_insurence_policies_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.articles (id, title_en, title_ar, status, desc_en, desc_ar, meta_title, meta_keyword, meta_description, created_at, updated_at) FROM stdin;
1	About Us	About Us	1	desc	desc	\N	\N	\N	2024-04-09 07:29:56	2024-04-09 07:29:56
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: contact_us_settings; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.contact_us_settings (id, title_en, title_ar, email, mobile, desc_en, desc_ar, location, latitude, longitude, twitter, instagram, facebook, youtube, linkedin, created_at, updated_at) FROM stdin;
1	MyDrWorld	\N	info@mydrworld.com	\N	\N	\N	673C+W8M - Dubai - United Arab Emirates	\N	\N	\N	\N	\N	\N	\N	\N	2024-04-09 07:29:14
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.country (id, name, prefix, dial_code, active, created_at, updated_at) FROM stdin;
1	Afghanistan	AF	93	1	2024-03-26 05:06:03	2024-03-26 05:06:03
2	Aland Islands	AX	358	1	2024-03-26 05:06:03	2024-03-26 05:06:03
3	Albania	AL	355	1	2024-03-26 05:06:03	2024-03-26 05:06:03
4	Algeria	DZ	213	1	2024-03-26 05:06:03	2024-03-26 05:06:03
5	AmericanSamoa	AS	1684	1	2024-03-26 05:06:03	2024-03-26 05:06:03
6	Andorra	AD	376	1	2024-03-26 05:06:03	2024-03-26 05:06:03
7	Angola	AO	244	1	2024-03-26 05:06:03	2024-03-26 05:06:03
8	Anguilla	AI	1264	1	2024-03-26 05:06:03	2024-03-26 05:06:03
9	Antarctica	AQ	672	1	2024-03-26 05:06:03	2024-03-26 05:06:03
10	Antigua and Barbuda	AG	1268	1	2024-03-26 05:06:03	2024-03-26 05:06:03
11	Argentina	AR	54	1	2024-03-26 05:06:03	2024-03-26 05:06:03
12	Armenia	AM	374	1	2024-03-26 05:06:03	2024-03-26 05:06:03
13	Aruba	AW	297	1	2024-03-26 05:06:03	2024-03-26 05:06:03
14	Australia	AU	61	1	2024-03-26 05:06:03	2024-03-26 05:06:03
15	Austria	AT	43	1	2024-03-26 05:06:03	2024-03-26 05:06:03
16	Azerbaijan	AZ	994	1	2024-03-26 05:06:03	2024-03-26 05:06:03
17	Bahamas	BS	1242	1	2024-03-26 05:06:03	2024-03-26 05:06:03
18	Bahrain	BH	973	1	2024-03-26 05:06:03	2024-03-26 05:06:03
19	Bangladesh	BD	880	1	2024-03-26 05:06:03	2024-03-26 05:06:03
20	Barbados	BB	1246	1	2024-03-26 05:06:03	2024-03-26 05:06:03
21	Belarus	BY	375	1	2024-03-26 05:06:03	2024-03-26 05:06:03
22	Belgium	BE	32	1	2024-03-26 05:06:03	2024-03-26 05:06:03
23	Belize	BZ	501	1	2024-03-26 05:06:03	2024-03-26 05:06:03
24	Benin	BJ	229	1	2024-03-26 05:06:03	2024-03-26 05:06:03
25	Bermuda	BM	1441	1	2024-03-26 05:06:03	2024-03-26 05:06:03
26	Bhutan	BT	975	1	2024-03-26 05:06:03	2024-03-26 05:06:03
27	Bolivia, Plurinational State of	BO	591	1	2024-03-26 05:06:03	2024-03-26 05:06:03
28	Bosnia and Herzegovina	BA	387	1	2024-03-26 05:06:03	2024-03-26 05:06:03
29	Botswana	BW	267	1	2024-03-26 05:06:03	2024-03-26 05:06:03
30	Brazil	BR	55	1	2024-03-26 05:06:03	2024-03-26 05:06:03
31	British Indian Ocean Territory	IO	246	1	2024-03-26 05:06:03	2024-03-26 05:06:03
32	Brunei Darussalam	BN	673	1	2024-03-26 05:06:03	2024-03-26 05:06:03
33	Bulgaria	BG	359	1	2024-03-26 05:06:03	2024-03-26 05:06:03
34	Burkina Faso	BF	226	1	2024-03-26 05:06:03	2024-03-26 05:06:03
35	Burundi	BI	257	1	2024-03-26 05:06:03	2024-03-26 05:06:03
36	Cambodia	KH	855	1	2024-03-26 05:06:03	2024-03-26 05:06:03
37	Cameroon	CM	237	1	2024-03-26 05:06:03	2024-03-26 05:06:03
38	Canada	CA	1	1	2024-03-26 05:06:03	2024-03-26 05:06:03
39	Cape Verde	CV	238	1	2024-03-26 05:06:03	2024-03-26 05:06:03
40	Cayman Islands	KY	 345	1	2024-03-26 05:06:03	2024-03-26 05:06:03
41	Central African Republic	CF	236	1	2024-03-26 05:06:03	2024-03-26 05:06:03
42	Chad	TD	235	1	2024-03-26 05:06:03	2024-03-26 05:06:03
43	Chile	CL	56	1	2024-03-26 05:06:03	2024-03-26 05:06:03
44	China	CN	86	1	2024-03-26 05:06:03	2024-03-26 05:06:03
45	Christmas Island	CX	61	1	2024-03-26 05:06:03	2024-03-26 05:06:03
46	Cocos (Keeling) Islands	CC	61	1	2024-03-26 05:06:03	2024-03-26 05:06:03
47	Colombia	CO	57	1	2024-03-26 05:06:03	2024-03-26 05:06:03
48	Comoros	KM	269	1	2024-03-26 05:06:03	2024-03-26 05:06:03
49	Congo	CG	242	1	2024-03-26 05:06:03	2024-03-26 05:06:03
50	Congo, The Democratic Republic of the Congo	CD	243	1	2024-03-26 05:06:03	2024-03-26 05:06:03
51	Cook Islands	CK	682	1	2024-03-26 05:06:03	2024-03-26 05:06:03
52	Costa Rica	CR	506	1	2024-03-26 05:06:03	2024-03-26 05:06:03
53	Cote d'Ivoire	CI	225	1	2024-03-26 05:06:03	2024-03-26 05:06:03
54	Croatia	HR	385	1	2024-03-26 05:06:03	2024-03-26 05:06:03
55	Cuba	CU	53	1	2024-03-26 05:06:03	2024-03-26 05:06:03
56	Cyprus	CY	357	1	2024-03-26 05:06:03	2024-03-26 05:06:03
57	Czech Republic	CZ	420	1	2024-03-26 05:06:03	2024-03-26 05:06:03
58	Denmark	DK	45	1	2024-03-26 05:06:03	2024-03-26 05:06:03
59	Djibouti	DJ	253	1	2024-03-26 05:06:03	2024-03-26 05:06:03
60	Dominica	DM	1767	1	2024-03-26 05:06:03	2024-03-26 05:06:03
61	Dominican Republic	DO	1849	1	2024-03-26 05:06:03	2024-03-26 05:06:03
62	Ecuador	EC	593	1	2024-03-26 05:06:03	2024-03-26 05:06:03
63	Egypt	EG	20	1	2024-03-26 05:06:03	2024-03-26 05:06:03
64	El Salvador	SV	503	1	2024-03-26 05:06:03	2024-03-26 05:06:03
65	Equatorial Guinea	GQ	240	1	2024-03-26 05:06:03	2024-03-26 05:06:03
66	Eritrea	ER	291	1	2024-03-26 05:06:03	2024-03-26 05:06:03
67	Estonia	EE	372	1	2024-03-26 05:06:03	2024-03-26 05:06:03
68	Ethiopia	ET	251	1	2024-03-26 05:06:03	2024-03-26 05:06:03
69	Falkland Islands (Malvinas)	FK	500	1	2024-03-26 05:06:03	2024-03-26 05:06:03
70	Faroe Islands	FO	298	1	2024-03-26 05:06:03	2024-03-26 05:06:03
71	Fiji	FJ	679	1	2024-03-26 05:06:03	2024-03-26 05:06:03
72	Finland	FI	358	1	2024-03-26 05:06:03	2024-03-26 05:06:03
73	France	FR	33	1	2024-03-26 05:06:03	2024-03-26 05:06:03
74	French Guiana	GF	594	1	2024-03-26 05:06:03	2024-03-26 05:06:03
75	French Polynesia	PF	689	1	2024-03-26 05:06:03	2024-03-26 05:06:03
76	Gabon	GA	241	1	2024-03-26 05:06:03	2024-03-26 05:06:03
77	Gambia	GM	220	1	2024-03-26 05:06:03	2024-03-26 05:06:03
78	Georgia	GE	995	1	2024-03-26 05:06:03	2024-03-26 05:06:03
79	Germany	DE	49	1	2024-03-26 05:06:03	2024-03-26 05:06:03
80	Ghana	GH	233	1	2024-03-26 05:06:03	2024-03-26 05:06:03
81	Gibraltar	GI	350	1	2024-03-26 05:06:03	2024-03-26 05:06:03
82	Greece	GR	30	1	2024-03-26 05:06:03	2024-03-26 05:06:03
83	Greenland	GL	299	1	2024-03-26 05:06:03	2024-03-26 05:06:03
84	Grenada	GD	1473	1	2024-03-26 05:06:03	2024-03-26 05:06:03
85	Guadeloupe	GP	590	1	2024-03-26 05:06:03	2024-03-26 05:06:03
86	Guam	GU	1671	1	2024-03-26 05:06:03	2024-03-26 05:06:03
87	Guatemala	GT	502	1	2024-03-26 05:06:03	2024-03-26 05:06:03
88	Guernsey	GG	44	1	2024-03-26 05:06:03	2024-03-26 05:06:03
89	Guinea	GN	224	1	2024-03-26 05:06:03	2024-03-26 05:06:03
90	Guinea-Bissau	GW	245	1	2024-03-26 05:06:03	2024-03-26 05:06:03
91	Guyana	GY	595	1	2024-03-26 05:06:03	2024-03-26 05:06:03
92	Haiti	HT	509	1	2024-03-26 05:06:03	2024-03-26 05:06:03
93	Holy See (Vatican City State)	VA	379	1	2024-03-26 05:06:03	2024-03-26 05:06:03
94	Honduras	HN	504	1	2024-03-26 05:06:03	2024-03-26 05:06:03
95	Hong Kong	HK	852	1	2024-03-26 05:06:03	2024-03-26 05:06:03
96	Hungary	HU	36	1	2024-03-26 05:06:03	2024-03-26 05:06:03
97	Iceland	IS	354	1	2024-03-26 05:06:03	2024-03-26 05:06:03
98	India	IN	91	1	2024-03-26 05:06:03	2024-03-26 05:06:03
99	Indonesia	ID	62	1	2024-03-26 05:06:03	2024-03-26 05:06:03
100	Iran, Islamic Republic of Persian Gulf	IR	98	1	2024-03-26 05:06:03	2024-03-26 05:06:03
101	Iraq	IQ	964	1	2024-03-26 05:06:03	2024-03-26 05:06:03
102	Ireland	IE	353	1	2024-03-26 05:06:03	2024-03-26 05:06:03
103	Isle of Man	IM	44	1	2024-03-26 05:06:03	2024-03-26 05:06:03
104	Israel	IL	972	1	2024-03-26 05:06:03	2024-03-26 05:06:03
105	Italy	IT	39	1	2024-03-26 05:06:03	2024-03-26 05:06:03
106	Jamaica	JM	1876	1	2024-03-26 05:06:03	2024-03-26 05:06:03
107	Japan	JP	81	1	2024-03-26 05:06:03	2024-03-26 05:06:03
108	Jersey	JE	44	1	2024-03-26 05:06:03	2024-03-26 05:06:03
109	Jordan	JO	962	1	2024-03-26 05:06:03	2024-03-26 05:06:03
110	Kazakhstan	KZ	77	1	2024-03-26 05:06:03	2024-03-26 05:06:03
111	Kenya	KE	254	1	2024-03-26 05:06:03	2024-03-26 05:06:03
112	Kiribati	KI	686	1	2024-03-26 05:06:03	2024-03-26 05:06:03
113	Korea, Democratic People's Republic of Korea	KP	850	1	2024-03-26 05:06:03	2024-03-26 05:06:03
114	Korea, Republic of South Korea	KR	82	1	2024-03-26 05:06:03	2024-03-26 05:06:03
115	Kuwait	KW	965	1	2024-03-26 05:06:03	2024-03-26 05:06:03
116	Kyrgyzstan	KG	996	1	2024-03-26 05:06:03	2024-03-26 05:06:03
117	Laos	LA	856	1	2024-03-26 05:06:03	2024-03-26 05:06:03
118	Latvia	LV	371	1	2024-03-26 05:06:03	2024-03-26 05:06:03
119	Lebanon	LB	961	1	2024-03-26 05:06:03	2024-03-26 05:06:03
120	Lesotho	LS	266	1	2024-03-26 05:06:03	2024-03-26 05:06:03
121	Liberia	LR	231	1	2024-03-26 05:06:03	2024-03-26 05:06:03
122	Libyan Arab Jamahiriya	LY	218	1	2024-03-26 05:06:03	2024-03-26 05:06:03
123	Liechtenstein	LI	423	1	2024-03-26 05:06:03	2024-03-26 05:06:03
124	Lithuania	LT	370	1	2024-03-26 05:06:03	2024-03-26 05:06:03
125	Luxembourg	LU	352	1	2024-03-26 05:06:03	2024-03-26 05:06:03
126	Macao	MO	853	1	2024-03-26 05:06:03	2024-03-26 05:06:03
127	Macedonia	MK	389	1	2024-03-26 05:06:03	2024-03-26 05:06:03
128	Madagascar	MG	261	1	2024-03-26 05:06:03	2024-03-26 05:06:03
129	Malawi	MW	265	1	2024-03-26 05:06:03	2024-03-26 05:06:03
130	Malaysia	MY	60	1	2024-03-26 05:06:03	2024-03-26 05:06:03
131	Maldives	MV	960	1	2024-03-26 05:06:03	2024-03-26 05:06:03
132	Mali	ML	223	1	2024-03-26 05:06:03	2024-03-26 05:06:03
133	Malta	MT	356	1	2024-03-26 05:06:03	2024-03-26 05:06:03
134	Marshall Islands	MH	692	1	2024-03-26 05:06:03	2024-03-26 05:06:03
135	Martinique	MQ	596	1	2024-03-26 05:06:03	2024-03-26 05:06:03
136	Mauritania	MR	222	1	2024-03-26 05:06:03	2024-03-26 05:06:03
137	Mauritius	MU	230	1	2024-03-26 05:06:03	2024-03-26 05:06:03
138	Mayotte	YT	262	1	2024-03-26 05:06:03	2024-03-26 05:06:03
139	Mexico	MX	52	1	2024-03-26 05:06:03	2024-03-26 05:06:03
140	Micronesia, Federated States of Micronesia	FM	691	1	2024-03-26 05:06:03	2024-03-26 05:06:03
141	Moldova	MD	373	1	2024-03-26 05:06:03	2024-03-26 05:06:03
142	Monaco	MC	377	1	2024-03-26 05:06:03	2024-03-26 05:06:03
143	Mongolia	MN	976	1	2024-03-26 05:06:03	2024-03-26 05:06:03
144	Montenegro	ME	382	1	2024-03-26 05:06:03	2024-03-26 05:06:03
145	Montserrat	MS	1664	1	2024-03-26 05:06:03	2024-03-26 05:06:03
146	Morocco	MA	212	1	2024-03-26 05:06:03	2024-03-26 05:06:03
147	Mozambique	MZ	258	1	2024-03-26 05:06:03	2024-03-26 05:06:03
148	Myanmar	MM	95	1	2024-03-26 05:06:03	2024-03-26 05:06:03
149	Namibia	NA	264	1	2024-03-26 05:06:03	2024-03-26 05:06:03
150	Nauru	NR	674	1	2024-03-26 05:06:03	2024-03-26 05:06:03
151	Nepal	NP	977	1	2024-03-26 05:06:03	2024-03-26 05:06:03
152	Netherlands	NL	31	1	2024-03-26 05:06:03	2024-03-26 05:06:03
153	Netherlands Antilles	AN	599	1	2024-03-26 05:06:03	2024-03-26 05:06:03
154	New Caledonia	NC	687	1	2024-03-26 05:06:03	2024-03-26 05:06:03
155	New Zealand	NZ	64	1	2024-03-26 05:06:03	2024-03-26 05:06:03
156	Nicaragua	NI	505	1	2024-03-26 05:06:03	2024-03-26 05:06:03
157	Niger	NE	227	1	2024-03-26 05:06:03	2024-03-26 05:06:03
158	Nigeria	NG	234	1	2024-03-26 05:06:03	2024-03-26 05:06:03
159	Niue	NU	683	1	2024-03-26 05:06:03	2024-03-26 05:06:03
160	Norfolk Island	NF	672	1	2024-03-26 05:06:03	2024-03-26 05:06:03
161	Northern Mariana Islands	MP	1670	1	2024-03-26 05:06:03	2024-03-26 05:06:03
162	Norway	NO	47	1	2024-03-26 05:06:03	2024-03-26 05:06:03
163	Oman	OM	968	1	2024-03-26 05:06:03	2024-03-26 05:06:03
164	Pakistan	PK	92	1	2024-03-26 05:06:03	2024-03-26 05:06:03
165	Palau	PW	680	1	2024-03-26 05:06:03	2024-03-26 05:06:03
166	Palestinian Territory, Occupied	PS	970	1	2024-03-26 05:06:03	2024-03-26 05:06:03
167	Panama	PA	507	1	2024-03-26 05:06:03	2024-03-26 05:06:03
168	Papua New Guinea	PG	675	1	2024-03-26 05:06:03	2024-03-26 05:06:03
169	Paraguay	PY	595	1	2024-03-26 05:06:03	2024-03-26 05:06:03
170	Peru	PE	51	1	2024-03-26 05:06:03	2024-03-26 05:06:03
171	Philippines	PH	63	1	2024-03-26 05:06:03	2024-03-26 05:06:03
172	Pitcairn	PN	872	1	2024-03-26 05:06:03	2024-03-26 05:06:03
173	Poland	PL	48	1	2024-03-26 05:06:03	2024-03-26 05:06:03
174	Portugal	PT	351	1	2024-03-26 05:06:03	2024-03-26 05:06:03
175	Puerto Rico	PR	1939	1	2024-03-26 05:06:03	2024-03-26 05:06:03
176	Qatar	QA	974	1	2024-03-26 05:06:03	2024-03-26 05:06:03
177	Romania	RO	40	1	2024-03-26 05:06:03	2024-03-26 05:06:03
178	Russia	RU	7	1	2024-03-26 05:06:03	2024-03-26 05:06:03
179	Rwanda	RW	250	1	2024-03-26 05:06:03	2024-03-26 05:06:03
180	Reunion	RE	262	1	2024-03-26 05:06:03	2024-03-26 05:06:03
181	Saint Barthelemy	BL	590	1	2024-03-26 05:06:03	2024-03-26 05:06:03
182	Saint Helena, Ascension and Tristan Da Cunha	SH	290	1	2024-03-26 05:06:03	2024-03-26 05:06:03
183	Saint Kitts and Nevis	KN	1869	1	2024-03-26 05:06:03	2024-03-26 05:06:03
184	Saint Lucia	LC	1758	1	2024-03-26 05:06:03	2024-03-26 05:06:03
185	Saint Martin	MF	590	1	2024-03-26 05:06:03	2024-03-26 05:06:03
186	Saint Pierre and Miquelon	PM	508	1	2024-03-26 05:06:03	2024-03-26 05:06:03
187	Saint Vincent and the Grenadines	VC	1784	1	2024-03-26 05:06:03	2024-03-26 05:06:03
188	Samoa	WS	685	1	2024-03-26 05:06:03	2024-03-26 05:06:03
189	San Marino	SM	378	1	2024-03-26 05:06:03	2024-03-26 05:06:03
190	Sao Tome and Principe	ST	239	1	2024-03-26 05:06:03	2024-03-26 05:06:03
191	Saudi Arabia	SA	966	1	2024-03-26 05:06:03	2024-03-26 05:06:03
192	Senegal	SN	221	1	2024-03-26 05:06:03	2024-03-26 05:06:03
193	Serbia	RS	381	1	2024-03-26 05:06:03	2024-03-26 05:06:03
194	Seychelles	SC	248	1	2024-03-26 05:06:03	2024-03-26 05:06:03
195	Sierra Leone	SL	232	1	2024-03-26 05:06:03	2024-03-26 05:06:03
196	Singapore	SG	65	1	2024-03-26 05:06:03	2024-03-26 05:06:03
197	Slovakia	SK	421	1	2024-03-26 05:06:03	2024-03-26 05:06:03
198	Slovenia	SI	386	1	2024-03-26 05:06:03	2024-03-26 05:06:03
199	Solomon Islands	SB	677	1	2024-03-26 05:06:03	2024-03-26 05:06:03
200	Somalia	SO	252	1	2024-03-26 05:06:03	2024-03-26 05:06:03
201	South Africa	ZA	27	1	2024-03-26 05:06:03	2024-03-26 05:06:03
202	South Sudan	SS	211	1	2024-03-26 05:06:03	2024-03-26 05:06:03
203	South Georgia and the South Sandwich Islands	GS	500	1	2024-03-26 05:06:03	2024-03-26 05:06:03
204	Spain	ES	34	1	2024-03-26 05:06:03	2024-03-26 05:06:03
205	Sri Lanka	LK	94	1	2024-03-26 05:06:03	2024-03-26 05:06:03
206	Sudan	SD	249	1	2024-03-26 05:06:03	2024-03-26 05:06:03
207	Suriname	SR	597	1	2024-03-26 05:06:03	2024-03-26 05:06:03
208	Svalbard and Jan Mayen	SJ	47	1	2024-03-26 05:06:03	2024-03-26 05:06:03
209	Swaziland	SZ	268	1	2024-03-26 05:06:03	2024-03-26 05:06:03
210	Sweden	SE	46	1	2024-03-26 05:06:03	2024-03-26 05:06:03
211	Switzerland	CH	41	1	2024-03-26 05:06:03	2024-03-26 05:06:03
212	Syrian Arab Republic	SY	963	1	2024-03-26 05:06:03	2024-03-26 05:06:03
213	Taiwan	TW	886	1	2024-03-26 05:06:03	2024-03-26 05:06:03
214	Tajikistan	TJ	992	1	2024-03-26 05:06:03	2024-03-26 05:06:03
215	Tanzania, United Republic of Tanzania	TZ	255	1	2024-03-26 05:06:03	2024-03-26 05:06:03
216	Thailand	TH	66	1	2024-03-26 05:06:03	2024-03-26 05:06:03
217	Timor-Leste	TL	670	1	2024-03-26 05:06:03	2024-03-26 05:06:03
218	Togo	TG	228	1	2024-03-26 05:06:03	2024-03-26 05:06:03
219	Tokelau	TK	690	1	2024-03-26 05:06:03	2024-03-26 05:06:03
220	Tonga	TO	676	1	2024-03-26 05:06:03	2024-03-26 05:06:03
221	Trinidad and Tobago	TT	1868	1	2024-03-26 05:06:03	2024-03-26 05:06:03
222	Tunisia	TN	216	1	2024-03-26 05:06:03	2024-03-26 05:06:03
223	Turkey	TR	90	1	2024-03-26 05:06:03	2024-03-26 05:06:03
224	Turkmenistan	TM	993	1	2024-03-26 05:06:03	2024-03-26 05:06:03
225	Turks and Caicos Islands	TC	1649	1	2024-03-26 05:06:03	2024-03-26 05:06:03
226	Tuvalu	TV	688	1	2024-03-26 05:06:03	2024-03-26 05:06:03
227	Uganda	UG	256	1	2024-03-26 05:06:03	2024-03-26 05:06:03
228	Ukraine	UA	380	1	2024-03-26 05:06:03	2024-03-26 05:06:03
229	United Arab Emirates	AE	971	1	2024-03-26 05:06:03	2024-03-26 05:06:03
230	United Kingdom	GB	44	1	2024-03-26 05:06:03	2024-03-26 05:06:03
231	United States	US	1	1	2024-03-26 05:06:03	2024-03-26 05:06:03
232	Uruguay	UY	598	1	2024-03-26 05:06:03	2024-03-26 05:06:03
233	Uzbekistan	UZ	998	1	2024-03-26 05:06:03	2024-03-26 05:06:03
234	Vanuatu	VU	678	1	2024-03-26 05:06:03	2024-03-26 05:06:03
235	Venezuela, Bolivarian Republic of Venezuela	VE	58	1	2024-03-26 05:06:03	2024-03-26 05:06:03
236	Vietnam	VN	84	1	2024-03-26 05:06:03	2024-03-26 05:06:03
237	Virgin Islands, British	VG	1284	1	2024-03-26 05:06:03	2024-03-26 05:06:03
238	Virgin Islands, U.S.	VI	1340	1	2024-03-26 05:06:03	2024-03-26 05:06:03
239	Wallis and Futuna	WF	681	1	2024-03-26 05:06:03	2024-03-26 05:06:03
240	Yemen	YE	967	1	2024-03-26 05:06:03	2024-03-26 05:06:03
241	Zambia	ZM	260	1	2024-03-26 05:06:03	2024-03-26 05:06:03
242	Zimbabwe	ZW	263	1	2024-03-26 05:06:03	2024-03-26 05:06:03
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: faq; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.faq (id, title, description, created_by, updated_by, active, created_at, updated_at) FROM stdin;
1	Question 1	answer	1	1	1	2024-03-25 07:08:32	2024-03-25 07:08:32
3	sda	asd	1	1	1	2024-04-09 07:30:57	2024-04-09 07:30:57
\.


--
-- Data for Name: help; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.help (id, title, description, created_by, updated_by, active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: insurence_policies; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.insurence_policies (id, title, title_ar, status, created_by, last_updated_by, created_at, updated_at, deleted_at) FROM stdin;
1	Star Helth	Star Helth	1	1	1	2024-04-11 06:13:14	2024-04-11 06:13:46	\N
2	National Helth	\N	1	1	1	2024-04-11 06:13:40	2024-04-11 06:13:52	2024-04-11 06:13:52
3	National	nationa	1	1	1	2024-04-11 08:56:15	2024-04-11 08:57:56	2024-04-11 08:57:56
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.languages (id, title, title_ar, status, created_by, last_updated_by, created_at, updated_at, deleted_at) FROM stdin;
3	Malayalam	المالايالامية	1	1	1	2024-04-11 05:26:21	2024-04-11 05:26:21	\N
1	English	إنجليزي	1	1	1	2024-04-11 05:25:23	2024-04-11 05:26:43	\N
2	Hindi	الهندية	1	1	1	2024-04-11 05:25:48	2024-04-11 05:26:58	\N
\.


--
-- Data for Name: licence_types; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.licence_types (id, title, title_ar, status, created_by, last_updated_by, created_at, updated_at, deleted_at) FROM stdin;
1	IMA Registrations	Ima reg	1	1	1	2024-04-11 04:46:10	2024-04-11 04:46:46	\N
2	MBBS	IMA Registrations	0	1	1	2024-04-11 04:47:07	2024-04-11 04:47:20	2024-04-11 04:47:20
3	cas	asda	1	1	1	2024-04-11 06:32:31	2024-04-11 06:32:38	2024-04-11 06:32:38
\.


--
-- Data for Name: medical_conditions; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.medical_conditions (id, title, title_ar, status, created_by, last_updated_by, created_at, updated_at, deleted_at) FROM stdin;
1	Allergians	الحساسية	1	1	1	2024-04-11 05:39:57	2024-04-11 05:40:43	\N
2	Allergianss	\N	1	1	1	2024-04-11 05:40:09	2024-04-11 05:40:52	2024-04-11 05:40:52
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2024_03_21_122103_add_indexes_to_tables	1
5	2024_03_25_044414_create_user_role_table	2
6	2024_03_25_044939_create_table_role-permissions	2
12	2022_08_11_065227_create_articles	3
13	2022_08_11_071259_create_faq	3
14	2022_08_14_152538_create_contact_us_settings	3
15	2022_08_14_154810_create_settings	4
16	2022_10_04_021553_create_profile_bios_table	4
17	2022_09_19_132546_create_help_table	5
22	2024_03_25_072719_create_products_table	6
23	2024_03_25_123647_alter_add_user_code_to_users	7
24	2022_07_22_072324_create_country_models_table	8
26	2024_03_26_064619_create_orders_table	9
28	2024_04_09_094109_create_qualifications_table	10
29	2024_04_11_042918_create_licence_types_table	11
30	2024_04_11_045117_create_special_intrests_table	12
31	2024_04_11_051647_create_languages_table	13
32	2024_04_11_053038_create_medical_conditions_table	14
33	2024_04_11_055604_create_insurence_policies_table	15
34	2024_04_11_082912_create_sub_insurence_policies_table	16
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.orders (id, ticket_number, user_id, product_id, drow_date, price, is_winner, product_type, created_at, updated_at) FROM stdin;
1	BLT-15656556	8	1	2024-03-26	100	0	daily	2024-03-26 12:24:06	2024-03-26 12:24:06
2	BLT-1565653	8	1	2024-03-26	100	0	monthly	2024-03-26 12:38:43	2024-03-26 12:38:43
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.products (id, product_code, product_name, product_type, price, description, file_name, drow_date, drow_time, product_status, created_by, updated_by, deleted_at, created_at, updated_at) FROM stdin;
1	BL-66016927eebd3	Daily Luto	daily	100	desc	171136848766016927ef32e.jpg	1	23:37:00	1	1	1	\N	2024-03-25 12:08:07	2024-03-25 12:08:07
2	BL-66016951d091d	MOnthly Lut	monthly	500	desc	171136852966016951d122d.png	8	06:00:00	1	1	1	\N	2024-03-25 12:08:49	2024-03-25 12:08:49
\.


--
-- Data for Name: profile_bios; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.profile_bios (id, value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: qualifications; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.qualifications (id, title, title_ar, status, created_by, last_updated_by, created_at, updated_at, deleted_at) FROM stdin;
2	MBBS2	MBBS2	1	1	1	2024-04-09 10:27:05	2024-04-09 10:28:42	2024-04-09 10:28:42
1	Ortho	Ortho	1	1	1	2024-04-09 10:23:56	2024-04-11 06:30:05	\N
3	Pediatrics	Pediatrics	1	1	1	2024-04-11 06:30:15	2024-04-11 06:30:15	\N
\.


--
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.role_permissions (id, user_role_id_fk, module_key, permissions, created_at, updated_at) FROM stdin;
13	3	settings	["c","r","u","d"]	\N	\N
48	4	dashboard	["r"]	\N	\N
49	4	customers	["r","u","d"]	\N	\N
56	5	dashboard	["r"]	\N	\N
57	5	customers	["r"]	\N	\N
58	5	cms	["r"]	\N	\N
59	5	contact_detail_settings	["d"]	\N	\N
60	5	settings	["c","r","u","d"]	\N	\N
61	2	dashboard	["r"]	\N	\N
62	2	qualifications	["c","r","u","d"]	\N	\N
63	2	licencetype	["c","r","u","d"]	\N	\N
64	2	special_intrests	["r"]	\N	\N
65	2	cms	["c","r","u","d"]	\N	\N
66	2	faq	["c","r","u","d"]	\N	\N
67	2	contact_detail_settings	["c","r","u","d"]	\N	\N
68	2	settings	["c","r","u","d"]	\N	\N
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.roles (id, role, status, is_admin_role, created_at, updated_at, deleted_at) FROM stdin;
1	Super Admin	1	1	2024-03-25 04:53:06	2024-03-25 04:53:06	\N
2	Sub Admins	1	1	2024-03-25 05:31:32	2024-03-25 05:31:49	\N
3	test	1	1	2024-03-25 05:31:59	2024-03-25 05:33:00	2024-03-25 05:33:00
4	tester	1	1	2024-04-09 06:46:52	2024-04-09 07:00:54	2024-04-09 07:00:54
5	asdadas	0	1	2024-04-09 07:01:20	2024-04-09 07:01:46	\N
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.settings (id, platform_fee, referal_distribution_level_1, referal_distribution_level_2, referal_distribution_level_3, lotery_distribution_level_1, lotery_distribution_level_2, lotery_distribution_level_3, lotery_distribution_level_4, lotery_distribution_level_5, lotery_distribution_level_6, lotery_distribution_level_7, lotery_distribution_level_8, lotery_distribution_level_9, created_at, updated_at) FROM stdin;
1	50	10	5	5	10	5	5	4	4	3	3	2	2	\N	\N
\.


--
-- Data for Name: special_intrests; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.special_intrests (id, title, title_ar, status, created_by, last_updated_by, created_at, updated_at, deleted_at) FROM stdin;
1	Ortho	ort	0	1	1	2024-04-11 05:14:56	2024-04-11 05:15:51	2024-04-11 05:15:51
2	Children	Child	1	1	1	2024-04-11 05:15:43	2024-04-11 05:25:06	\N
\.


--
-- Data for Name: sub_insurence_policies; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.sub_insurence_policies (id, insurence_id, title, title_ar, status, created_by, last_updated_by, created_at, updated_at, deleted_at) FROM stdin;
1	1	sub insure	arabiv	1	1	1	2024-04-11 08:55:00	2024-04-11 08:55:00	\N
2	3	Cardiac Care	Cariac Care	1	1	1	2024-04-11 08:56:45	2024-04-11 08:56:45	\N
3	1	Cardiac Care	asda	1	1	1	2024-04-11 08:57:00	2024-04-11 08:57:21	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: mydrworld
--

COPY public.users (id, name, email, dial_code, phone, phone_verified, password, email_verified_at, role, verified, user_type_id, first_name, last_name, user_image, user_phone_otp, remember_token, created_at, updated_at, deleted, role_id, active, user_code, refferal_code, refered_by) FROM stdin;
3	developer	developer@a2.com	\N	\N	0	$2y$12$.rs4b5JhZNF372Xi5OJkDe2VgmGjh2lwaOzHxQIg0KS2tmiS/fqce	\N	\N	0	\N	\N	\N	\N	\N	\N	2024-03-25 05:37:18	2024-03-25 05:37:18	0	0	1	\N	\N	0
4	subadmin	subadmin@gmail.com	\N	123455	0	$2y$12$5QhURKYgL9vqsNaSe4hRqOcdduFQ.95WqmjN/Y8b7HS75XSlWq53W	\N	1	1	\N	add	asda	\N	\N	\N	2024-03-25 05:45:09	2024-03-25 05:49:16	1	1	0	\N	\N	0
8	Sooraj Sabu	sooraj.a2solution@gmail.com	93	9847823799	0	$2y$12$w//jrBIM8SAliILyGTylgOAdIzL5h6GBnbAiamBIopgEkwfYDKvpa	\N	3	0	\N	Sooraj	Sabu	\N	\N	\N	2024-03-26 05:37:41	2024-03-26 05:37:41	0	0	1	BLC-66025f253f697	\N	0
12	Sooraj Sabu	sooraj.a2solutions@gmail.com	358	9847823799	0	$2y$12$rHuzbjvzLMfN4p1KNUD83..sD23kBtIm3aeUq4FXwigu3tGKegBNu	\N	3	0	\N	Sooraj	Sabu	\N	\N	\N	2024-03-26 05:46:03	2024-03-26 05:46:03	0	0	1	BLC-6602611b19026	BLC-66025f253f697	8
6	dev dev	developer@gmail.com	\N	\N	0	$2y$12$UR5BkkQQrGtgykjXde3bVe.3YZaMVR7UYwZFo2uvwyj.NQCPS4Rh6	\N	1	1	\N	dev	dev	\N	\N	\N	2024-03-25 05:53:05	2024-04-09 07:04:17	1	2	0	\N	\N	0
7	admin sub	adminsub@gmail.com	\N	\N	0	$2y$12$d3fiOttEff7UgNMU0Z9cFOsb7sFTBLRDzJBfdX2DRsAWXCdzjNNUu	\N	1	1	\N	admin	sub	\N	\N	\N	2024-04-11 06:41:52	2024-04-11 06:41:52	0	2	1	\N	\N	0
1	Admin	admin@admin.com	971	112233445566778899	0	$2y$12$nplGVHg7DQPp9uHBc3Rb7OT2Lh09Z.ORy4NihaFbir1fq/dRR2/Oi	\N	1	1	1	\N	\N	\N	\N	\N	\N	2024-03-22 12:32:29	0	1	1	\N	\N	0
\.


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.articles_id_seq', 1, true);


--
-- Name: contact_us_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.contact_us_settings_id_seq', 1, true);


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.country_id_seq', 242, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.faq_id_seq', 3, true);


--
-- Name: help_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.help_id_seq', 1, false);


--
-- Name: insurence_policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.insurence_policies_id_seq', 3, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.languages_id_seq', 3, true);


--
-- Name: licence_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.licence_types_id_seq', 3, true);


--
-- Name: medical_conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.medical_conditions_id_seq', 2, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.migrations_id_seq', 34, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.orders_id_seq', 2, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.products_id_seq', 2, true);


--
-- Name: profile_bios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.profile_bios_id_seq', 1, false);


--
-- Name: qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.qualifications_id_seq', 3, true);


--
-- Name: role_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.role_permissions_id_seq', 68, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);


--
-- Name: special_intrests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.special_intrests_id_seq', 2, true);


--
-- Name: sub_insurence_policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.sub_insurence_policies_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydrworld
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: contact_us_settings contact_us_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.contact_us_settings
    ADD CONSTRAINT contact_us_settings_pkey PRIMARY KEY (id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: faq faq_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.faq
    ADD CONSTRAINT faq_pkey PRIMARY KEY (id);


--
-- Name: help help_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.help
    ADD CONSTRAINT help_pkey PRIMARY KEY (id);


--
-- Name: insurence_policies insurence_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.insurence_policies
    ADD CONSTRAINT insurence_policies_pkey PRIMARY KEY (id);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: licence_types licence_types_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.licence_types
    ADD CONSTRAINT licence_types_pkey PRIMARY KEY (id);


--
-- Name: medical_conditions medical_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.medical_conditions
    ADD CONSTRAINT medical_conditions_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: profile_bios profile_bios_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.profile_bios
    ADD CONSTRAINT profile_bios_pkey PRIMARY KEY (id);


--
-- Name: qualifications qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.qualifications
    ADD CONSTRAINT qualifications_pkey PRIMARY KEY (id);


--
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: special_intrests special_intrests_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.special_intrests
    ADD CONSTRAINT special_intrests_pkey PRIMARY KEY (id);


--
-- Name: sub_insurence_policies sub_insurence_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.sub_insurence_policies
    ADD CONSTRAINT sub_insurence_policies_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: mydrworld
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: mydrworld
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: users_id_index; Type: INDEX; Schema: public; Owner: mydrworld
--

CREATE INDEX users_id_index ON public.users USING btree (id);


--
-- mydrworldQL database dump complete
--

