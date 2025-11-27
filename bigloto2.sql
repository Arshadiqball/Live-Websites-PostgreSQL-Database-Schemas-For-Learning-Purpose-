--
-- PostgreSQL database dump
--

-- Dumped from database version 12.19 (Ubuntu 12.19-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.7 (Ubuntu 15.7-1.pgdg20.04+1)

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
-- Name: amount_distribution_histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.amount_distribution_histories (
    id bigint NOT NULL,
    type character varying(255) NOT NULL,
    user_id integer NOT NULL,
    amount double precision DEFAULT '0'::double precision NOT NULL,
    transaction_hash text,
    earing_id integer DEFAULT 0 NOT NULL,
    smart_contract_input text,
    smart_contract_output text,
    mining_status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    mining_statuc_check_counter integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.amount_distribution_histories OWNER TO postgres;

--
-- Name: COLUMN amount_distribution_histories.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.amount_distribution_histories.type IS 'registration,lotery';


--
-- Name: amount_distribution_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.amount_distribution_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amount_distribution_histories_id_seq OWNER TO postgres;

--
-- Name: amount_distribution_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.amount_distribution_histories_id_seq OWNED BY public.amount_distribution_histories.id;


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
-- Name: contact_us_settings; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.contact_us_settings OWNER TO postgres;

--
-- Name: contact_us_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_us_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_us_settings_id_seq OWNER TO postgres;

--
-- Name: contact_us_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_us_settings_id_seq OWNED BY public.contact_us_settings.id;


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
    title character varying(600),
    description text,
    created_by integer DEFAULT 0 NOT NULL,
    updated_by integer DEFAULT 0 NOT NULL,
    active integer DEFAULT 0 NOT NULL,
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
-- Name: member_ship_histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.member_ship_histories (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    paid_amount double precision DEFAULT '0'::double precision NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.member_ship_histories OWNER TO postgres;

--
-- Name: member_ship_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.member_ship_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.member_ship_histories_id_seq OWNER TO postgres;

--
-- Name: member_ship_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.member_ship_histories_id_seq OWNED BY public.member_ship_histories.id;


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
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
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
    updated_at timestamp(0) without time zone,
    is_commission_processed integer DEFAULT 0 NOT NULL,
    winner_position integer DEFAULT 0 NOT NULL,
    winner_price double precision DEFAULT '0'::double precision NOT NULL,
    is_price_distributed integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
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
    updated_at timestamp(0) without time zone,
    price_1 double precision DEFAULT '0'::double precision NOT NULL,
    price_2 double precision DEFAULT '0'::double precision NOT NULL,
    price_3 double precision DEFAULT '0'::double precision NOT NULL,
    price_4 double precision DEFAULT '0'::double precision NOT NULL,
    price_5 double precision DEFAULT '0'::double precision NOT NULL,
    price_6 double precision DEFAULT '0'::double precision NOT NULL,
    price_7 double precision DEFAULT '0'::double precision NOT NULL,
    price_8 double precision DEFAULT '0'::double precision NOT NULL,
    price_9 double precision DEFAULT '0'::double precision NOT NULL,
    price_10 double precision DEFAULT '0'::double precision NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: COLUMN products.product_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.product_type IS 'daily,monthly';


--
-- Name: COLUMN products.product_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.product_status IS '1-active,0-inactive';


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
-- Name: profile_bios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile_bios (
    id bigint NOT NULL,
    value character varying(900),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.profile_bios OWNER TO postgres;

--
-- Name: profile_bios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profile_bios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profile_bios_id_seq OWNER TO postgres;

--
-- Name: profile_bios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profile_bios_id_seq OWNED BY public.profile_bios.id;


--
-- Name: referel_earnings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.referel_earnings (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    earned_from_user_id integer NOT NULL,
    percentage double precision NOT NULL,
    platform_fee double precision NOT NULL,
    earned_amount double precision NOT NULL,
    earning_status integer DEFAULT 0 NOT NULL,
    smart_contract_status integer DEFAULT 0 NOT NULL,
    smart_contract_input text,
    smart_contract_response text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.referel_earnings OWNER TO postgres;

--
-- Name: referel_earnings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.referel_earnings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.referel_earnings_id_seq OWNER TO postgres;

--
-- Name: referel_earnings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.referel_earnings_id_seq OWNED BY public.referel_earnings.id;


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
    status smallint DEFAULT '0'::smallint,
    is_admin_role smallint DEFAULT '0'::smallint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: COLUMN roles.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.roles.status IS '0=inactive, 1=active';


--
-- Name: COLUMN roles.is_admin_role; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.roles.is_admin_role IS '0=not admin role, 1=admin role';


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
    updated_at timestamp(0) without time zone,
    registration_to_address text,
    registration_listner_address text,
    registration_network character varying(255),
    registration_address_type character varying(255),
    registration_token_decimal character varying(255),
    daily_to_address text,
    daily_listner_address text,
    daily_network character varying(255),
    daily_address_type character varying(255),
    daily_token_decimal character varying(255),
    monthly_to_address text,
    monthly_listner_address text,
    monthly_network character varying(255),
    monthly_address_type character varying(255),
    monthly_token_decimal character varying(255)
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
-- Name: temp_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_orders (
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


ALTER TABLE public.temp_orders OWNER TO postgres;

--
-- Name: temp_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_orders_id_seq OWNER TO postgres;

--
-- Name: temp_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_orders_id_seq OWNED BY public.temp_orders.id;


--
-- Name: transaction_tracks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction_tracks (
    id bigint NOT NULL,
    user_id integer DEFAULT 0,
    event_type character varying(255),
    to_address character varying(255),
    from_address character varying(255),
    transaction_hash text,
    amount character varying(255),
    is_process_completed integer DEFAULT 0 NOT NULL,
    full_input text,
    balance_amount character varying(255),
    transaction_type character varying(255),
    remark text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.transaction_tracks OWNER TO postgres;

--
-- Name: COLUMN transaction_tracks.transaction_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.transaction_tracks.transaction_type IS 'registration,daily_lotery, monthly_lotery';


--
-- Name: transaction_tracks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_tracks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_tracks_id_seq OWNER TO postgres;

--
-- Name: transaction_tracks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_tracks_id_seq OWNED BY public.transaction_tracks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
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
    refered_by integer DEFAULT 0 NOT NULL,
    is_commission_processed integer DEFAULT 0 NOT NULL,
    wallet_address text,
    is_membership_paid integer DEFAULT 0 NOT NULL
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
-- Name: winner_price_distributions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.winner_price_distributions (
    id bigint NOT NULL,
    order_id integer NOT NULL,
    user_id integer NOT NULL,
    price_paid double precision DEFAULT '0'::double precision NOT NULL,
    distribution_status integer DEFAULT 0 NOT NULL,
    transaction_hash character varying(255),
    contract_input text,
    contract_response text,
    remark text,
    mining_statuc_check_counter integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.winner_price_distributions OWNER TO postgres;

--
-- Name: winner_price_distributions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.winner_price_distributions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.winner_price_distributions_id_seq OWNER TO postgres;

--
-- Name: winner_price_distributions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.winner_price_distributions_id_seq OWNED BY public.winner_price_distributions.id;


--
-- Name: amount_distribution_histories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amount_distribution_histories ALTER COLUMN id SET DEFAULT nextval('public.amount_distribution_histories_id_seq'::regclass);


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: contact_us_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us_settings ALTER COLUMN id SET DEFAULT nextval('public.contact_us_settings_id_seq'::regclass);


--
-- Name: country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: faq id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faq ALTER COLUMN id SET DEFAULT nextval('public.faq_id_seq'::regclass);


--
-- Name: help id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help ALTER COLUMN id SET DEFAULT nextval('public.help_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: member_ship_histories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member_ship_histories ALTER COLUMN id SET DEFAULT nextval('public.member_ship_histories_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: profile_bios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_bios ALTER COLUMN id SET DEFAULT nextval('public.profile_bios_id_seq'::regclass);


--
-- Name: referel_earnings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.referel_earnings ALTER COLUMN id SET DEFAULT nextval('public.referel_earnings_id_seq'::regclass);


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
-- Name: temp_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_orders ALTER COLUMN id SET DEFAULT nextval('public.temp_orders_id_seq'::regclass);


--
-- Name: transaction_tracks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_tracks ALTER COLUMN id SET DEFAULT nextval('public.transaction_tracks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: winner_price_distributions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.winner_price_distributions ALTER COLUMN id SET DEFAULT nextval('public.winner_price_distributions_id_seq'::regclass);


--
-- Data for Name: amount_distribution_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.amount_distribution_histories (id, type, user_id, amount, transaction_hash, earing_id, smart_contract_input, smart_contract_output, mining_status, created_at, updated_at, mining_statuc_check_counter) FROM stdin;
22	registration	38	25	0x9b786fdf9ee1525dc00cd0bf300b2d94883cd99801f015053cdc451097e082dd	18	{"toAddress":"0x99c1752834b78b994e11ee18ec5ca220d4891692","amount":25}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":46,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x0701318376"},"maxFeePerGas":{"type":"BigNumber","hex":"0x0701318376"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99a4"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb00000000000000000000000099c1752834b78b994e11ee18ec5ca220d48916920000000000000000000000000000000000000000000000000000000000000019","accessList":[],"hash":"0x9b786fdf9ee1525dc00cd0bf300b2d94883cd99801f015053cdc451097e082dd","v":1,"r":"0xa960f84863ee304b94cf32719034ec9ca2581a66c5e7a2807f8eedb880c7455e","s":"0x7db27c9db26af7bf592b44c678296c4fdf7db2fb035721bfaad454ffbd67676d","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	0	2024-05-18 09:53:13	2024-05-18 10:03:03	10
20	registration	40	50	0x629ec93cdc2d2f9b2a8d00e0b55259280195f1cd3bdfc283d946168ca65ae73e	16	{"toAddress":"0x606807226e6fcab4056fa87d3b161b71b27419fc","amount":50}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":46,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x0701650594"},"maxFeePerGas":{"type":"BigNumber","hex":"0x0701650594"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99a4"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb000000000000000000000000606807226e6fcab4056fa87d3b161b71b27419fc0000000000000000000000000000000000000000000000000000000000000032","accessList":[],"hash":"0x629ec93cdc2d2f9b2a8d00e0b55259280195f1cd3bdfc283d946168ca65ae73e","v":0,"r":"0x5d4d8318ec3dcf45b84b2e4d59c00267d2fa487b07d3b5014ec222f268e52476","s":"0x11459589bd95195526947b477ea52beb5f02ed9f4079e2f29935c92ab118d304","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	1	2024-05-18 09:53:11	2024-05-18 09:54:04	0
17	registration	38	50	0xdf1fdc5ad1e0714ec9c2f29d33c79cfebfa29416ad989ccf6d317d1683cf6937	13	{"toAddress":"0x99c1752834b78b994e11ee18ec5ca220d4891692","amount":50}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":44,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x072b93968e"},"maxFeePerGas":{"type":"BigNumber","hex":"0x072b93968e"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99a4"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb00000000000000000000000099c1752834b78b994e11ee18ec5ca220d48916920000000000000000000000000000000000000000000000000000000000000032","accessList":[],"hash":"0xdf1fdc5ad1e0714ec9c2f29d33c79cfebfa29416ad989ccf6d317d1683cf6937","v":0,"r":"0xd681e9146cdf2605b5f970f0b2861c8e2d12b6bbb514e97725da2b0811ddeea4","s":"0x7ad507b3536061fd27bbb135ada037189fff8fbf34d6cbd557277dd7947833cf","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	1	2024-05-18 09:22:03	2024-05-18 09:23:04	0
18	registration	39	50	0x4899e4d761a36afc90eb36b62030122e2a83a0509e00b910fa958aaf2d9ace86	14	{"toAddress":"0xf4918c194ca780e74fba8de4013573a18e866e74","amount":50}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":45,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x07000bf91e"},"maxFeePerGas":{"type":"BigNumber","hex":"0x07000bf91e"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99a4"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb000000000000000000000000f4918c194ca780e74fba8de4013573a18e866e740000000000000000000000000000000000000000000000000000000000000032","accessList":[],"hash":"0x4899e4d761a36afc90eb36b62030122e2a83a0509e00b910fa958aaf2d9ace86","v":0,"r":"0x3a29a8491e8aa636a87263e10fe53a84c029d560ae4087d003839d3639f75e95","s":"0x51726ac2a4223ee82535937e3f33a6ec57d27682f94c8dfd7ec8975a6b60101e","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	1	2024-05-18 09:47:12	2024-05-18 09:48:04	0
19	registration	38	25	0x65f9be1b544f48e633f1c05bbf40fce7da2c3f591372482daa9d2ff411e86d9b	15	{"toAddress":"0x99c1752834b78b994e11ee18ec5ca220d4891692","amount":25}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":45,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x06fffaebda"},"maxFeePerGas":{"type":"BigNumber","hex":"0x06fffaebda"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99a4"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb00000000000000000000000099c1752834b78b994e11ee18ec5ca220d48916920000000000000000000000000000000000000000000000000000000000000019","accessList":[],"hash":"0x65f9be1b544f48e633f1c05bbf40fce7da2c3f591372482daa9d2ff411e86d9b","v":1,"r":"0xd0c95b5b9a11daf363be7382b160710c4e3c15124f426df27b6a477ac6baea78","s":"0x1c69afae2a803af37d995d8953d37a1e6394734ef1d8ce8a1ed4a779861890b2","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	0	2024-05-18 09:47:13	2024-05-18 09:57:04	10
21	registration	39	25	0x0701e9ca81cf5e046171789c71ec431f18038f1df48ec78aacbd69cea46ad802	17	{"toAddress":"0xf4918c194ca780e74fba8de4013573a18e866e74","amount":25}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":46,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x0700922af2"},"maxFeePerGas":{"type":"BigNumber","hex":"0x0700922af2"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99a4"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb000000000000000000000000f4918c194ca780e74fba8de4013573a18e866e740000000000000000000000000000000000000000000000000000000000000019","accessList":[],"hash":"0x0701e9ca81cf5e046171789c71ec431f18038f1df48ec78aacbd69cea46ad802","v":0,"r":"0x7f7379e091fd2a90f683ae57ae2960b7a7736f33d38e03341dc5d3ecdf8bc5e2","s":"0x388e42faea85c58621b1c4810452f678216f4b45e80dfa5b48ff5dadbeac4026","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	0	2024-05-18 09:53:12	2024-05-18 10:03:04	10
23	lotery	40	10	0x17505008ff61c84db868659afab937a1e9b10c8aa539e6578230dbcd1c9c8276	14	{"toAddress":"0x606807226e6fcab4056fa87d3b161b71b27419fc","amount":10}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":47,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x07003c7c97"},"maxFeePerGas":{"type":"BigNumber","hex":"0x07003c7c97"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99a4"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb000000000000000000000000606807226e6fcab4056fa87d3b161b71b27419fc000000000000000000000000000000000000000000000000000000000000000a","accessList":[],"hash":"0x17505008ff61c84db868659afab937a1e9b10c8aa539e6578230dbcd1c9c8276","v":0,"r":"0xb090e7865b9335724f423c0edb2446b0b7dc2644c0344080524f0d7b61d52f58","s":"0x0823cfaa8e7350a2e5531cd1cffc819355e1ec9f1a9911951fc2cf118448c83f","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	1	2024-05-18 09:57:14	2024-05-18 09:59:03	1
26	registration	41	50	0xa8cee9dbb1e69fbee04aed59df527e99b865adc5ac9f7a54a5e788d4c5c4e29c	19	{"toAddress":"0xffa808bbe2025d387da3853c92f22becc16f5353","amount":50}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":49,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac32"},"maxFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac32"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99a4"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb000000000000000000000000ffa808bbe2025d387da3853c92f22becc16f53530000000000000000000000000000000000000000000000000000000000000032","accessList":[],"hash":"0xa8cee9dbb1e69fbee04aed59df527e99b865adc5ac9f7a54a5e788d4c5c4e29c","v":1,"r":"0x9bf0d88c8079929ea0c12d61f3dba0aec3daad52f60e5415349d03ae23a9769c","s":"0x48d032f42f07d330e455862b015f8845afe5fcf8728c74e9ffe7aaf20afbc0e0","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	1	2024-05-20 04:34:42	2024-05-20 04:42:02	7
24	lotery	39	5	0x250c4ff32dc13b9628b4b0612ad61952799a743771ba11f42cae99a6d439642f	14	{"toAddress":"0xf4918c194ca780e74fba8de4013573a18e866e74","amount":5}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":47,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x0700e29ede"},"maxFeePerGas":{"type":"BigNumber","hex":"0x0700e29ede"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99a4"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb000000000000000000000000f4918c194ca780e74fba8de4013573a18e866e740000000000000000000000000000000000000000000000000000000000000005","accessList":[],"hash":"0x250c4ff32dc13b9628b4b0612ad61952799a743771ba11f42cae99a6d439642f","v":1,"r":"0xad2a0f440a177e71a397cca040ed55f7bd386d94e9cf26114a92df731e24c850","s":"0x32138360be61b1ee1752e6fe5370dbc8bba1ab88e1a59cb720b3e285d4712b76","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	0	2024-05-18 09:57:15	2024-05-18 10:07:02	10
25	lotery	38	5	0x3240dbcbaabb0803685965f03090f0429135109d0f0f6ccfcb4341a7e7cd4f94	14	{"toAddress":"0x99c1752834b78b994e11ee18ec5ca220d4891692","amount":5}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":48,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x0700e15fae"},"maxFeePerGas":{"type":"BigNumber","hex":"0x0700e15fae"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99a4"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb00000000000000000000000099c1752834b78b994e11ee18ec5ca220d48916920000000000000000000000000000000000000000000000000000000000000005","accessList":[],"hash":"0x3240dbcbaabb0803685965f03090f0429135109d0f0f6ccfcb4341a7e7cd4f94","v":0,"r":"0x0a79f73803ad2f23041ba20d473a3fdef8e0016ed58c458c2d2d279d610888f0","s":"0x6a1f8cad9e9992a651c8a6412be1e44240688b973d350bb771ae909a0d1e5eec","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	1	2024-05-18 09:57:16	2024-05-18 09:59:03	1
27	registration	40	25	0x2c8fa7bca861cf771ae4a5ed1d347a69706206ae1961e3b1c25203ff0eb39946	20	{"toAddress":"0x606807226e6fcab4056fa87d3b161b71b27419fc","amount":25}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":50,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac33"},"maxFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac33"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99a4"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb000000000000000000000000606807226e6fcab4056fa87d3b161b71b27419fc0000000000000000000000000000000000000000000000000000000000000019","accessList":[],"hash":"0x2c8fa7bca861cf771ae4a5ed1d347a69706206ae1961e3b1c25203ff0eb39946","v":0,"r":"0xb50d540ea2e5d35c63e9aa0609d3711ad5cd76e14bbf76b608689d2109acea2e","s":"0x74a71568f0fc73ae14f8e845b7ac73b7edb83afa5788b458e48e880703ceb8ad","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	0	2024-05-20 04:34:43	2024-05-20 04:44:03	10
29	registration	41	50	0xbdda6aa308f918f2b425d23355dae6c60c3176211d6cc7ba8999c16785ea12bc	22	{"toAddress":"0xffa808bbe2025d387da3853c92f22becc16f5353","amount":50}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":51,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac51"},"maxFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac51"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99a4"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb000000000000000000000000ffa808bbe2025d387da3853c92f22becc16f53530000000000000000000000000000000000000000000000000000000000000032","accessList":[],"hash":"0xbdda6aa308f918f2b425d23355dae6c60c3176211d6cc7ba8999c16785ea12bc","v":1,"r":"0x3dd162ea5002fa78d5b721885fbf9aafb4f03dade1355cb7f81ed9cf1761a5a0","s":"0x5977992934169972e7cea00c78fbd1039d13532e8eefbd4cc683774d2c90163c","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	1	2024-05-20 04:48:50	2024-05-20 04:49:04	0
28	registration	39	25	0x26d7b3a0d470219f0b90dffbe950a71f91101d2365a4073dff0f69b3984c716b	21	{"toAddress":"0xf4918c194ca780e74fba8de4013573a18e866e74","amount":25}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":50,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac31"},"maxFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac31"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99a4"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb000000000000000000000000f4918c194ca780e74fba8de4013573a18e866e740000000000000000000000000000000000000000000000000000000000000019","accessList":[],"hash":"0x26d7b3a0d470219f0b90dffbe950a71f91101d2365a4073dff0f69b3984c716b","v":0,"r":"0x87b70bc09730da36809dd0c10c4e4e3f641196fc8993161e58925cc316c8f6ea","s":"0x0581bace6bdc3d8b8dbd43f97896e51e2ded3ca467ac1c03fc3c72edffee3cc5","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	1	2024-05-20 04:34:44	2024-05-20 04:42:02	7
30	registration	40	25	0xcdd00e4e2785e762767d18af0c33dd5d4e9c235019b33fda77dc3e2f4e3bcd2d	23	{"toAddress":"0x606807226e6fcab4056fa87d3b161b71b27419fc","amount":25}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":51,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac51"},"maxFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac51"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99a4"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb000000000000000000000000606807226e6fcab4056fa87d3b161b71b27419fc0000000000000000000000000000000000000000000000000000000000000019","accessList":[],"hash":"0xcdd00e4e2785e762767d18af0c33dd5d4e9c235019b33fda77dc3e2f4e3bcd2d","v":0,"r":"0x29a73d5a14c99c9b7ef68d8c05077d8540378c576952e05d85f20965f89e38d8","s":"0x72523759b13ea1a9a06f1325a55757d665ea91ca331c3a818f5f7b0af5c5232b","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	0	2024-05-20 04:48:52	2024-05-20 04:58:03	10
33	registration	40	25	0x9388b5cfa1e42e23af297bb21e764f0466bfe9e2982f2596423b23173a0500e3	26	{"toAddress":"0x606807226e6fcab4056fa87d3b161b71b27419fc","amount":25}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":54,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac40"},"maxFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac40"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99a4"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb000000000000000000000000606807226e6fcab4056fa87d3b161b71b27419fc0000000000000000000000000000000000000000000000000000000000000019","accessList":[],"hash":"0x9388b5cfa1e42e23af297bb21e764f0466bfe9e2982f2596423b23173a0500e3","v":0,"r":"0x4b3be9903b45558efcd68615b9c9ce000514bb7ae58937aa7d7ee6946a840a25","s":"0x19c5b819e66d22344d39a8ea8c586ba1bb620fd302c3a02a71a18ea8b2505a5f","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	1	2024-05-20 04:53:32	2024-05-20 04:54:04	0
31	registration	39	25	0xc55d8d0ed5e325c986108bf5612909e4de0e1cf8ca34fcc210b0c780a244e135	24	{"toAddress":"0xf4918c194ca780e74fba8de4013573a18e866e74","amount":25}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":52,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac4f"},"maxFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac4f"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99a4"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb000000000000000000000000f4918c194ca780e74fba8de4013573a18e866e740000000000000000000000000000000000000000000000000000000000000019","accessList":[],"hash":"0xc55d8d0ed5e325c986108bf5612909e4de0e1cf8ca34fcc210b0c780a244e135","v":1,"r":"0xe0e0a32c36b5c4e7be6de5b563a06b277649c4052702d4c24ef2f80b51f9f157","s":"0x2bdb0444ff5a3463b42e03c64eb4ffa0317459fb7e0cfe705d2885420acf4da5","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	1	2024-05-20 04:48:53	2024-05-20 04:50:05	1
32	registration	41	50	0x82c496d3e7513fa22c969fdc87654bb29490a26bf796ba66b5339e45b6c55514	25	{"toAddress":"0xffa808bbe2025d387da3853c92f22becc16f5353","amount":50}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":53,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac41"},"maxFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac41"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99a4"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb000000000000000000000000ffa808bbe2025d387da3853c92f22becc16f53530000000000000000000000000000000000000000000000000000000000000032","accessList":[],"hash":"0x82c496d3e7513fa22c969fdc87654bb29490a26bf796ba66b5339e45b6c55514","v":1,"r":"0xb9a9aa3772e7680e8ec3ab1190a2e44016cf3867f2f63f27d6762b88f2335b40","s":"0x42419568abdd7566a4103e139393be4eed34c25c23f5b4707f4bd3289677dd76","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	1	2024-05-20 04:53:31	2024-05-20 04:54:04	0
34	registration	39	25	0x77c4723a8777f395249da1a64e42ecc425d80f00b83e4353f14a886a08ab0db2	27	{"toAddress":"0xf4918c194ca780e74fba8de4013573a18e866e74","amount":"25"}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":55,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x06fc23adc9"},"maxFeePerGas":{"type":"BigNumber","hex":"0x06fc23adc9"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99a4"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb000000000000000000000000f4918c194ca780e74fba8de4013573a18e866e740000000000000000000000000000000000000000000000000000000000000019","accessList":[],"hash":"0x77c4723a8777f395249da1a64e42ecc425d80f00b83e4353f14a886a08ab0db2","v":1,"r":"0x1f5f7d288c2f49be472e60f41629ec83ed72d38f02acb42605a97894bda8b20a","s":"0x2f05300e476e0ac7bff9b105b88b807af593aea070590f2cdf5885efd1f15f57","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	1	2024-05-20 04:53:34	2024-05-21 09:11:02	1
35	registration	48	50	0xf3d62c43d6ce572e018ae7d9a4acbd6ae13a1b5454862b8fd4f36445070d060a	28	{"toAddress":"0x99c1752834b78b994e11ee18ec5ca220d4891634","amount":"50000000000000000000"}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":70,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x06fc277e94"},"maxFeePerGas":{"type":"BigNumber","hex":"0x06fc277e94"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0xddc7"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb00000000000000000000000099c1752834b78b994e11ee18ec5ca220d4891634000000000000000000000000000000000000000000000002b5e3af16b1880000","accessList":[],"hash":"0xf3d62c43d6ce572e018ae7d9a4acbd6ae13a1b5454862b8fd4f36445070d060a","v":0,"r":"0x7418999d129328ec8e232b653fda77ca7de15b7ffda6b78fdf267098db35bcff","s":"0x20b495ea86f0eb896a538e675cb4d649fec73bac03a0197c0cc25b6bea2ada44","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	1	2024-07-03 15:04:49	2024-07-03 15:05:04	0
36	lotery	48	10	0x3ea1e7d014bf6d89884fded2c249ae0aade51aae758ce960f64f2c1906f1d43d	26	{"toAddress":"0x99c1752834b78b994e11ee18ec5ca220d4891634","amount":10}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":72,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x06fc2cf9ba"},"maxFeePerGas":{"type":"BigNumber","hex":"0x06fc2cf9ba"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99a4"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb00000000000000000000000099c1752834b78b994e11ee18ec5ca220d4891634000000000000000000000000000000000000000000000000000000000000000a","accessList":[],"hash":"0x3ea1e7d014bf6d89884fded2c249ae0aade51aae758ce960f64f2c1906f1d43d","v":1,"r":"0xef94eb85b0f318eca56aeb11951494fe5d8b6c080785e1d657fe874322025778","s":"0x015386ed452fd99ec0576ed57f0b0ea82c078081978295feb31bf72315850b75","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	1	2024-07-03 15:07:22	2024-07-03 15:08:05	0
39	registration	48	25	0x64901931938731bc2bcff4a369a9b0313bcff14959a098cc3a7b5d6f8e321481	31	{"toAddress":"0x99c1752834b78b994e11ee18ec5ca220d4891634","amount":"25000000000000000000"}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":77,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac2e"},"maxFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac2e"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99ec"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb00000000000000000000000099c1752834b78b994e11ee18ec5ca220d48916340000000000000000000000000000000000000000000000015af1d78b58c40000","accessList":[],"hash":"0x64901931938731bc2bcff4a369a9b0313bcff14959a098cc3a7b5d6f8e321481","v":0,"r":"0x02a3640729c46a540f84aeb1bbba1dbb5b50c2c43d383cf42569b9a177526b6b","s":"0x02ce623299dcee433b5ebd93511d9a1b1ccd6e40b492e36c505719aec72326a5","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	0	2024-07-04 07:09:58	2024-07-04 07:19:05	10
38	registration	64	50	0xb8cabd2e2ed315966e89ccc032b779a98e74fcb0aa69c9a9d26152d9c3ae0cda	30	{"toAddress":"0x97209b4f565280a0cf1abcf19f18e70e23f006b5","amount":"50000000000000000000"}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":77,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac2a"},"maxFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac2a"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99ec"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb00000000000000000000000097209b4f565280a0cf1abcf19f18e70e23f006b5000000000000000000000000000000000000000000000002b5e3af16b1880000","accessList":[],"hash":"0xb8cabd2e2ed315966e89ccc032b779a98e74fcb0aa69c9a9d26152d9c3ae0cda","v":1,"r":"0xe82f1c7573042c9a6d542a94cc4c31f67d915ea5b207e079177c2ae4e1e93dd0","s":"0x456bedc7d3e747025c7a45c14f1ecb05875ea7150fce2008c293c3318d426ee8","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	0	2024-07-04 07:09:55	2024-07-04 07:19:05	10
37	registration	48	50	0x1651f9c0d6b56d86272df0ebc7bf8899ae0a771e27ed487f55fdac162bf20483	29	{"toAddress":"0x99c1752834b78b994e11ee18ec5ca220d4891634","amount":"50000000000000000000"}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":76,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac42"},"maxFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac42"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99ec"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb00000000000000000000000099c1752834b78b994e11ee18ec5ca220d4891634000000000000000000000000000000000000000000000002b5e3af16b1880000","accessList":[],"hash":"0x1651f9c0d6b56d86272df0ebc7bf8899ae0a771e27ed487f55fdac162bf20483","v":0,"r":"0xe566018992a4870e0c5b03ffba33e0039e0148bfd04e606abc789216af8abcf3","s":"0x1e8d44e950bc907590a5e8561ed61498167a91b9747dd5c2cc4340fc19e6e39e","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	1	2024-07-04 06:56:14	2024-07-04 06:57:04	0
40	lotery	48	10	0x61f9f189ca896d0a6aa63edde9567fb72338aae6b5b735db0440bcbe6c881975	27	{"toAddress":"0x99c1752834b78b994e11ee18ec5ca220d4891634","amount":10}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":78,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x06fc23cbc9"},"maxFeePerGas":{"type":"BigNumber","hex":"0x06fc23cbc9"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99a4"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb00000000000000000000000099c1752834b78b994e11ee18ec5ca220d4891634000000000000000000000000000000000000000000000000000000000000000a","accessList":[],"hash":"0x61f9f189ca896d0a6aa63edde9567fb72338aae6b5b735db0440bcbe6c881975","v":0,"r":"0x173a1201076ec92ceaede5a40803a7791d40c87c551cd2c73d6de2ddb53a3417","s":"0x1b9f09596f5fa058023a8c617f27f0b4568bf3ee06038b8e9c53e4d7978c718c","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	1	2024-07-04 07:39:08	2024-07-04 07:40:08	0
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles (id, title_en, title_ar, status, desc_en, desc_ar, meta_title, meta_keyword, meta_description, created_at, updated_at) FROM stdin;
2	Privacy	Privacy	1	<p>Privacy policy</p>	<p>Privacy policy</p>	\N	\N	\N	2024-07-01 09:41:23	2024-07-01 09:41:23
1	Terms and conditions	\N	1	<p>is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	\N	\N	\N	\N	2024-07-01 09:40:50	2024-07-01 09:57:28
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
-- Data for Name: contact_us_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_us_settings (id, title_en, title_ar, email, mobile, desc_en, desc_ar, location, latitude, longitude, twitter, instagram, facebook, youtube, linkedin, created_at, updated_at) FROM stdin;
1	BigLoto	\N	info@bigloto.com	\N	\N	\N	673C+W8M - Dubai - United Arab Emirates	\N	\N	\N	\N	\N	\N	\N	\N	2024-03-25 06:55:56
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, name, prefix, dial_code, active, created_at, updated_at) FROM stdin;
18	Bahrain	BH	973	1	2024-03-26 05:06:03	2024-03-26 05:06:03
56	Cyprus	CY	357	1	2024-03-26 05:06:03	2024-03-26 05:06:03
63	Egypt	EG	20	1	2024-03-26 05:06:03	2024-03-26 05:06:03
100	Iran, Islamic Republic of Persian Gulf	IR	98	1	2024-03-26 05:06:03	2024-03-26 05:06:03
101	Iraq	IQ	964	1	2024-03-26 05:06:03	2024-03-26 05:06:03
104	Israel	IL	972	1	2024-03-26 05:06:03	2024-03-26 05:06:03
109	Jordan	JO	962	1	2024-03-26 05:06:03	2024-03-26 05:06:03
115	Kuwait	KW	965	1	2024-03-26 05:06:03	2024-03-26 05:06:03
119	Lebanon	LB	961	1	2024-03-26 05:06:03	2024-03-26 05:06:03
163	Oman	OM	968	1	2024-03-26 05:06:03	2024-03-26 05:06:03
166	Palestinian Territory, Occupied	PS	970	1	2024-03-26 05:06:03	2024-03-26 05:06:03
176	Qatar	QA	974	1	2024-03-26 05:06:03	2024-03-26 05:06:03
191	Saudi Arabia	SA	966	1	2024-03-26 05:06:03	2024-03-26 05:06:03
212	Syrian Arab Republic	SY	963	1	2024-03-26 05:06:03	2024-03-26 05:06:03
223	Turkey	TR	90	1	2024-03-26 05:06:03	2024-03-26 05:06:03
229	United Arab Emirates	AE	971	1	2024-03-26 05:06:03	2024-03-26 05:06:03
240	Yemen	YE	967	1	2024-03-26 05:06:03	2024-03-26 05:06:03
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
1	Question 1	answer	1	1	1	2024-03-25 07:08:32	2024-03-25 07:08:32
\.


--
-- Data for Name: help; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.help (id, title, description, created_by, updated_by, active, created_at, updated_at) FROM stdin;
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
-- Data for Name: member_ship_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.member_ship_histories (id, user_id, paid_amount, status, created_at, updated_at) FROM stdin;
7	38	500	0	2024-05-18 09:18:24	2024-05-18 09:18:24
8	39	500	0	2024-05-18 09:22:03	2024-05-18 09:22:03
9	40	500	0	2024-05-18 09:47:12	2024-05-18 09:47:12
10	41	500	0	2024-05-18 09:53:08	2024-05-18 09:53:08
11	42	500	0	2024-05-20 04:34:42	2024-05-20 04:34:42
12	43	500	0	2024-05-20 04:48:50	2024-05-20 04:48:50
13	44	500	0	2024-05-20 04:53:31	2024-05-20 04:53:31
14	52	500	0	2024-07-01 10:42:51	2024-07-01 10:42:51
15	62	500	0	2024-07-01 12:57:26	2024-07-01 12:57:26
16	63	500	0	2024-07-03 15:04:48	2024-07-03 15:04:48
17	64	500	0	2024-07-04 06:56:13	2024-07-04 06:56:13
18	65	500	0	2024-07-04 07:09:47	2024-07-04 07:09:47
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
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
28	2024_05_06_102627_create_referel_earnings_table	10
29	2024_05_06_104809_alter_add_commission_processed_filed_to_users	11
30	2024_05_15_041153_alter_add_listner_accounts_to_settings	12
31	2024_05_15_092406_alter_users_add_fields_to_users	13
32	2024_05_15_124419_create_temp_orders_table	14
40	2024_05_16_032200_create_transaction_tracks_table	15
41	2024_05_16_040903_alter_add_is_membership_paid_to_users	15
42	2024_05_16_040933_create_member_ship_histories_table	15
43	2024_05_17_041711_create_amount_distribution_histories_table	16
44	2024_05_17_082713_alter_add_mining_status_check_counter_to_amount_distribution_histories	17
45	2024_05_17_093639_alter_add_is_commission_procesed_to_orders	18
46	2024_06_29_094218_alter_add_price_data_to_products	19
47	2024_06_29_111700_alter_add_price_fileds_to_orders	20
50	2024_07_01_064717_create_winner_price_distributions_table	21
51	2024_07_01_085337_create_sessions_table	22
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, ticket_number, user_id, product_id, drow_date, price, is_winner, product_type, created_at, updated_at, is_commission_processed, winner_position, winner_price, is_price_distributed) FROM stdin;
19	BLT-1719830741	52	1	2024-07-02	100	1	daily	2024-07-01 10:45:41	2024-07-01 11:57:05	1	1	2000	0
20	BLT-1719836520	52	2	2024-08-08	500	0	monthly	2024-07-01 12:22:00	2024-07-01 12:22:00	1	0	0	0
21	BLT-1719837141	52	2	2024-08-08	500	0	monthly	2024-07-01 12:32:21	2024-07-01 12:32:23	1	0	0	0
22	BLT-1719837636	52	2	2024-07-08	500	0	monthly	2024-07-01 12:40:36	2024-07-01 12:40:36	1	0	0	0
23	BLT-1719838892	62	1	2024-07-02	100	1	daily	2024-07-01 13:01:32	2024-07-01 13:04:08	1	1	2000	0
24	BLT-1719840162	52	1	2024-07-02	100	0	daily	2024-07-01 13:22:42	2024-07-01 13:22:43	1	0	0	0
25	BLT-1719840389	52	1	2024-07-02	100	1	daily	2024-07-01 13:26:29	2024-07-01 13:27:59	1	2	1000	0
27	BLT-1720078745	64	1	2024-07-05	100	0	daily	2024-07-04 07:39:05	2024-07-04 07:39:10	1	0	0	0
26	BLT-1720019240	63	1	2024-07-04	100	1	daily	2024-07-03 15:07:20	2024-07-04 07:44:21	1	1	2000	0
13	BLT-1716024639	38	2	2024-06-08	500	0	monthly	2024-05-18 09:30:39	2024-05-18 09:30:39	1	0	0	0
15	BLT-1716178665	38	2	2024-06-08	500	1	monthly	2024-05-20 04:17:45	2024-06-29 12:23:15	1	3	500	0
18	BLT-1716179241	38	2	2024-06-08	500	1	monthly	2024-05-20 04:27:21	2024-07-01 06:23:18	1	4	300	0
14	BLT-1716026232	41	1	2024-05-19	100	1	daily	2024-05-18 09:57:12	2024-07-01 07:40:24	1	2	1000	0
17	BLT-1716179148	38	2	2024-06-08	500	1	monthly	2024-05-20 04:25:48	2024-07-01 07:45:39	1	3	500	0
16	BLT-1716179021	38	2	2024-06-08	500	1	monthly	2024-05-20 04:23:41	2024-07-01 07:45:39	1	3	500	0
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, product_code, product_name, product_type, price, description, file_name, drow_date, drow_time, product_status, created_by, updated_by, deleted_at, created_at, updated_at, price_1, price_2, price_3, price_4, price_5, price_6, price_7, price_8, price_9, price_10) FROM stdin;
2	BL-66016951d091d	Monthly Loto	monthly	500	desc	17114487486602a2ac950e3.png	8	06:00:00	1	1	1	\N	2024-03-25 12:08:49	2024-06-29 10:23:06	1000	700	500	300	200	150	100	80	50	25
1	BL-66016927eebd3	Daily Loto	daily	100	desc	17114487236602a293b0509.png	1	11:37:00	1	1	1	\N	2024-03-25 12:08:07	2024-06-29 10:23:54	2000	1000	800	500	300	200	100	50	25	20
\.


--
-- Data for Name: profile_bios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile_bios (id, value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: referel_earnings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.referel_earnings (id, user_id, earned_from_user_id, percentage, platform_fee, earned_amount, earning_status, smart_contract_status, smart_contract_input, smart_contract_response, created_at, updated_at) FROM stdin;
13	38	39	10	500	50	0	0	\N	\N	2024-05-18 09:22:03	2024-05-18 09:22:03
14	39	40	10	500	50	0	0	\N	\N	2024-05-18 09:47:12	2024-05-18 09:47:12
15	38	40	5	500	25	0	0	\N	\N	2024-05-18 09:47:13	2024-05-18 09:47:13
16	40	41	10	500	50	0	0	\N	\N	2024-05-18 09:53:10	2024-05-18 09:53:10
17	39	41	5	500	25	0	0	\N	\N	2024-05-18 09:53:12	2024-05-18 09:53:12
18	38	41	5	500	25	0	0	\N	\N	2024-05-18 09:53:13	2024-05-18 09:53:13
19	41	42	10	500	50	0	0	\N	\N	2024-05-20 04:34:42	2024-05-20 04:34:42
20	40	42	5	500	25	0	0	\N	\N	2024-05-20 04:34:43	2024-05-20 04:34:43
21	39	42	5	500	25	0	0	\N	\N	2024-05-20 04:34:44	2024-05-20 04:34:44
22	41	43	10	500	50	0	0	\N	\N	2024-05-20 04:48:50	2024-05-20 04:48:50
23	40	43	5	500	25	0	0	\N	\N	2024-05-20 04:48:52	2024-05-20 04:48:52
24	39	43	5	500	25	0	0	\N	\N	2024-05-20 04:48:53	2024-05-20 04:48:53
25	41	44	10	500	50	0	0	\N	\N	2024-05-20 04:53:31	2024-05-20 04:53:31
26	40	44	5	500	25	0	0	\N	\N	2024-05-20 04:53:32	2024-05-20 04:53:32
27	39	44	5	500	25	0	0	\N	\N	2024-05-20 04:53:34	2024-05-20 04:53:34
28	48	63	10	500	50	0	0	\N	\N	2024-07-03 15:04:49	2024-07-03 15:04:49
29	48	64	10	500	50	0	0	\N	\N	2024-07-04 06:56:14	2024-07-04 06:56:14
30	64	65	10	500	50	0	0	\N	\N	2024-07-04 07:09:55	2024-07-04 07:09:55
31	48	65	5	500	25	0	0	\N	\N	2024-07-04 07:09:58	2024-07-04 07:09:58
\.


--
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_permissions (id, user_role_id_fk, module_key, permissions, created_at, updated_at) FROM stdin;
13	3	settings	["c","r","u","d"]	\N	\N
42	2	dashboard	["r"]	\N	\N
43	2	cms	["c","r","u","d"]	\N	\N
44	2	faq	["c","r","u","d"]	\N	\N
45	2	help	["c","r"]	\N	\N
46	2	contact_detail_settings	["c","r","u","d"]	\N	\N
47	2	settings	["c","r","u","d"]	\N	\N
48	4	dashboard	["r"]	\N	\N
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, role, status, is_admin_role, created_at, updated_at, deleted_at) FROM stdin;
1	Super Admin	1	1	2024-03-25 04:53:06	2024-03-25 04:53:06	\N
2	Sub Admins	1	1	2024-03-25 05:31:32	2024-03-25 05:31:49	\N
3	test	1	1	2024-03-25 05:31:59	2024-03-25 05:33:00	2024-03-25 05:33:00
4	Test	1	1	2024-03-26 07:54:47	2024-03-26 07:54:47	\N
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
1bTpo44Mcf9J5vJrG3xjBS3sMxCGnMnZTn8ptwLO	1	59.96.240.118	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	YTo3OntzOjY6Il90b2tlbiI7czo0MDoiN1pQdndlQm56VGM3SFVSZnB2cWkxREVQOExMNW9FUDVwOGpBTm82eiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjc6InVzZXJfaWQiO2k6MTtzOjEzOiJ1c2VyX3RpbWV6b25lIjtzOjEzOiJBc2lhL0NhbGN1dHRhIjtzOjE2OiJ1c2VyX3Blcm1pc3Npb25zIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo1NjoiaHR0cHM6Ly9keGJpdHByb2plY3RzLmNvbS9iaWdsb3RvL3B1YmxpYy9hZG1pbi9kYXNoYm9hcmQiO319	1720952776
D6wfomiEvQllM0sKd58RhbG1TmUqQJTfvqHwRNId	\N	117.202.127.35	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	YToyOntzOjY6Il90b2tlbiI7czo0MDoidlduUmZhSUJHM1c0bmJEclpxelN3cXl2RFFNQUVCalVxZzhycXREOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1721446544
JGoqfnyDRkjSamO7YdOEA9rFIq3MG4UBztCfsiIM	\N	117.254.11.108	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiRlB0TERZcFh6ZWJRZXhzQ253ZVBZNzVBRXNqRWZQUm1LV0hibGhxZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vYmlnbG90by9wdWJsaWMvYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1721619087
ZHfNuGawNUJebfgnutVqyli265QugQisjkepvqym	\N	31.218.135.235	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiM2xVTDNkNWVXcTRBNlNsYUxLZTBDNk9sSlgxNk5Eb0k0U0lYeks2OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vYmlnbG90by9wdWJsaWMvcmVnaXN0ZXI/cmVmPUVOVk5OIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1720512945
iGi8DwRAoowlCEEcwSdOjHOdq5nTe6HEf9nrPVI3	\N	31.219.100.46	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNDJMS2t1c3hXV0dMM2ozaGJ3UTUwc3BMYVBBNEFYTFM2ZXJGQ2xleiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vYmlnbG90by9wdWJsaWMvcmVnaXN0ZXI/cmVmPUVOVk5OIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1720712336
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, platform_fee, referal_distribution_level_1, referal_distribution_level_2, referal_distribution_level_3, lotery_distribution_level_1, lotery_distribution_level_2, lotery_distribution_level_3, lotery_distribution_level_4, lotery_distribution_level_5, lotery_distribution_level_6, lotery_distribution_level_7, lotery_distribution_level_8, lotery_distribution_level_9, created_at, updated_at, registration_to_address, registration_listner_address, registration_network, registration_address_type, registration_token_decimal, daily_to_address, daily_listner_address, daily_network, daily_address_type, daily_token_decimal, monthly_to_address, monthly_listner_address, monthly_network, monthly_address_type, monthly_token_decimal) FROM stdin;
1	500	10	5	5	10	5	5	4	4	3	3	2	2	\N	\N	0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15	0x76d8C71d1a3d65Abb33448F287071922DB7F0f43	matic	erc20	1e18	0x99C1752834B78B994E11ee18Ec5CA220d4891692	0x76d8C71d1a3d65Abb33448F287071922DB7F0f43	matic	erc20	1e18	0xF4918C194cA780e74fBa8dE4013573A18E866E74	0x76d8C71d1a3d65Abb33448F287071922DB7F0f43	matic	erc20	1e18
\.


--
-- Data for Name: temp_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_orders (id, ticket_number, user_id, product_id, drow_date, price, is_winner, product_type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: transaction_tracks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction_tracks (id, user_id, event_type, to_address, from_address, transaction_hash, amount, is_process_completed, full_input, balance_amount, transaction_type, remark, created_at, updated_at) FROM stdin;
42	38	ERC20Transfer	0xF4918C194cA780e74fBa8dE4013573A18E866E74	0x99C1752834B78B994E11ee18Ec5CA220d4891692	0x61a6ec32df356b16e0d3b23c5d77e491073f657b3bb3555881133c80d60608a5	500	1	{"eventType":"ERC20Transfer","fromAddress":"0x99C1752834B78B994E11ee18Ec5CA220d4891692","toAddress":"0xF4918C194cA780e74fBa8dE4013573A18E866E74","amount":"500","transactionHash":"0x61a6ec32df356b16e0d3b23c5d77e491073f657b3bb3555881133c80d60608a5","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	monthly_lotery	Monthly Lotery Purchased	2024-05-20 04:17:45	2024-05-20 04:17:45
35	0	ERC20Transfer	0x99C1752834B78B994E11ee18Ec5CA220d4891692	0xBE27e478d1cD341368955F3F6a267ba158369DbF	0xdf1fdc5ad1e0714ec9c2f29d33c79cfebfa29416ad989ccf6d317d1683cf6937	0.00000000000000005	0	{"eventType":"ERC20Transfer","fromAddress":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","toAddress":"0x99C1752834B78B994E11ee18Ec5CA220d4891692","amount":"0.00000000000000005","transactionHash":"0xdf1fdc5ad1e0714ec9c2f29d33c79cfebfa29416ad989ccf6d317d1683cf6937","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	\N	daily_lotery	User Not Found	2024-05-18 09:22:15	2024-05-18 13:22:15
33	38	ERC20Transfer	0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15	0x99C1752834B78B994E11ee18Ec5CA220d4891692	0xb4bb19d5e8d7d5933b35a8877a6e63b3ffab1906ebf772231a80dd478c26e809	500	1	{"eventType":"ERC20Transfer","fromAddress":"0x99C1752834B78B994E11ee18Ec5CA220d4891692","toAddress":"0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15","amount":"500","transactionHash":"0xb4bb19d5e8d7d5933b35a8877a6e63b3ffab1906ebf772231a80dd478c26e809","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	registration	Membership Purchase Completed	2024-05-18 09:18:24	2024-05-18 13:18:24
37	40	ERC20Transfer	0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15	0x606807226E6fcab4056FA87d3B161b71B27419fC	0x2cdbd79963534de69b8f66f9f7e35b59fefa5299df084a29915ab1ae4dcd108d	500	1	{"eventType":"ERC20Transfer","fromAddress":"0x606807226E6fcab4056FA87d3B161b71B27419fC","toAddress":"0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15","amount":"500","transactionHash":"0x2cdbd79963534de69b8f66f9f7e35b59fefa5299df084a29915ab1ae4dcd108d","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	registration	Membership Purchase Completed	2024-05-18 09:47:12	2024-05-18 13:47:12
36	38	ERC20Transfer	0xF4918C194cA780e74fBa8dE4013573A18E866E74	0x99C1752834B78B994E11ee18Ec5CA220d4891692	0x7068566eaffb2998b3817c88f699d3de79358d8808c6152e0df035b1a8e93603	2000	1	{"eventType":"ERC20Transfer","fromAddress":"0x99C1752834B78B994E11ee18Ec5CA220d4891692","toAddress":"0xF4918C194cA780e74fBa8dE4013573A18E866E74","amount":"2000","transactionHash":"0x7068566eaffb2998b3817c88f699d3de79358d8808c6152e0df035b1a8e93603","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	1500	monthly_lotery	Monthly Lotery Purchased	2024-05-18 09:30:39	2024-05-18 09:30:39
34	39	ERC20Transfer	0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15	0xF4918C194cA780e74fBa8dE4013573A18E866E74	0x99dccf77d2593f2788e6df9a7134d5dc12f8c3601550064f56b74e93090dac7a	500	1	{"eventType":"ERC20Transfer","fromAddress":"0xF4918C194cA780e74fBa8dE4013573A18E866E74","toAddress":"0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15","amount":"500","transactionHash":"0x99dccf77d2593f2788e6df9a7134d5dc12f8c3601550064f56b74e93090dac7a","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	registration	Membership Purchase Completed	2024-05-18 09:22:03	2024-05-18 13:22:03
41	0	ERC20Transfer	0x99C1752834B78B994E11ee18Ec5CA220d4891692	0xBE27e478d1cD341368955F3F6a267ba158369DbF	0x3240dbcbaabb0803685965f03090f0429135109d0f0f6ccfcb4341a7e7cd4f94	0.000000000000000005	0	{"eventType":"ERC20Transfer","fromAddress":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","toAddress":"0x99C1752834B78B994E11ee18Ec5CA220d4891692","amount":"0.000000000000000005","transactionHash":"0x3240dbcbaabb0803685965f03090f0429135109d0f0f6ccfcb4341a7e7cd4f94","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	\N	daily_lotery	User Not Found	2024-05-18 09:58:44	2024-05-18 13:58:44
40	41	ERC20Transfer	0x99C1752834B78B994E11ee18Ec5CA220d4891692	0xFfA808BBE2025D387da3853C92f22BECC16F5353	0x0855a553128845cdd0817732494c5fcd57edfb10a2dd32d7ae9bc2d4694086ca	100	1	{"eventType":"ERC20Transfer","fromAddress":"0xFfA808BBE2025D387da3853C92f22BECC16F5353","toAddress":"0x99C1752834B78B994E11ee18Ec5CA220d4891692","amount":"100","transactionHash":"0x0855a553128845cdd0817732494c5fcd57edfb10a2dd32d7ae9bc2d4694086ca","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	daily_lotery	Daily Lotery Purchased	2024-05-18 09:57:12	2024-05-18 09:57:12
39	41	ERC20Transfer	0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15	0xFfA808BBE2025D387da3853C92f22BECC16F5353	0xfed4197312eca55848f562331d444dcb75d857274aefc1006041c54a4a71f625	500	1	{"eventType":"ERC20Transfer","fromAddress":"0xFfA808BBE2025D387da3853C92f22BECC16F5353","toAddress":"0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15","amount":"500","transactionHash":"0xfed4197312eca55848f562331d444dcb75d857274aefc1006041c54a4a71f625","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	registration	Membership Purchase Completed	2024-05-18 09:53:08	2024-05-18 13:53:08
38	0	ERC20Transfer	0xF4918C194cA780e74fBa8dE4013573A18E866E74	0xBE27e478d1cD341368955F3F6a267ba158369DbF	0x4899e4d761a36afc90eb36b62030122e2a83a0509e00b910fa958aaf2d9ace86	0.00000000000000005	0	{"eventType":"ERC20Transfer","fromAddress":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","toAddress":"0xF4918C194cA780e74fBa8dE4013573A18E866E74","amount":"0.00000000000000005","transactionHash":"0x4899e4d761a36afc90eb36b62030122e2a83a0509e00b910fa958aaf2d9ace86","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	\N	monthly_lotery	User Not Found	2024-05-18 09:47:19	2024-05-18 09:47:20
43	38	ERC20Transfer	0xF4918C194cA780e74fBa8dE4013573A18E866E74	0x99C1752834B78B994E11ee18Ec5CA220d4891692	0x53a77a8d38d36f4a54826558f070a4307a608391ea287521c752b89718bc6ebf	500	1	{"eventType":"ERC20Transfer","fromAddress":"0x99C1752834B78B994E11ee18Ec5CA220d4891692","toAddress":"0xF4918C194cA780e74fBa8dE4013573A18E866E74","amount":"500","transactionHash":"0x53a77a8d38d36f4a54826558f070a4307a608391ea287521c752b89718bc6ebf","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	monthly_lotery	Monthly Lotery Purchased	2024-05-20 04:23:41	2024-05-20 04:23:41
44	38	ERC20Transfer	0xF4918C194cA780e74fBa8dE4013573A18E866E74	0x99C1752834B78B994E11ee18Ec5CA220d4891692	0x8df48d32d8dd4019ddc87a6d12c4bde139889f32b4d4659f902b0e0f13172366	500	1	{"eventType":"ERC20Transfer","fromAddress":"0x99C1752834B78B994E11ee18Ec5CA220d4891692","toAddress":"0xF4918C194cA780e74fBa8dE4013573A18E866E74","amount":"500","transactionHash":"0x8df48d32d8dd4019ddc87a6d12c4bde139889f32b4d4659f902b0e0f13172366","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	monthly_lotery	Monthly Lotery Purchased	2024-05-20 04:25:48	2024-05-20 04:25:48
47	0	ERC20Transfer	0xF4918C194cA780e74fBa8dE4013573A18E866E74	0xBE27e478d1cD341368955F3F6a267ba158369DbF	0x26d7b3a0d470219f0b90dffbe950a71f91101d2365a4073dff0f69b3984c716b	0.000000000000000025	0	{"eventType":"ERC20Transfer","fromAddress":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","toAddress":"0xF4918C194cA780e74fBa8dE4013573A18E866E74","amount":"0.000000000000000025","transactionHash":"0x26d7b3a0d470219f0b90dffbe950a71f91101d2365a4073dff0f69b3984c716b","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	\N	monthly_lotery	User Not Found	2024-05-20 04:42:05	2024-05-20 08:42:05
45	38	ERC20Transfer	0xF4918C194cA780e74fBa8dE4013573A18E866E74	0x99C1752834B78B994E11ee18Ec5CA220d4891692	0x890fa25ab6ad64b2f76ee73fd21fa5e039574dca3ba4fa73bc80ab9270c9b085	500	1	{"eventType":"ERC20Transfer","fromAddress":"0x99C1752834B78B994E11ee18Ec5CA220d4891692","toAddress":"0xF4918C194cA780e74fBa8dE4013573A18E866E74","amount":"500","transactionHash":"0x890fa25ab6ad64b2f76ee73fd21fa5e039574dca3ba4fa73bc80ab9270c9b085","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	monthly_lotery	Monthly Lotery Purchased	2024-05-20 04:27:21	2024-05-20 04:27:22
49	0	ERC20Transfer	0xF4918C194cA780e74fBa8dE4013573A18E866E74	0xBE27e478d1cD341368955F3F6a267ba158369DbF	0xc55d8d0ed5e325c986108bf5612909e4de0e1cf8ca34fcc210b0c780a244e135	0.000000000000000025	0	{"eventType":"ERC20Transfer","fromAddress":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","toAddress":"0xF4918C194cA780e74fBa8dE4013573A18E866E74","amount":"0.000000000000000025","transactionHash":"0xc55d8d0ed5e325c986108bf5612909e4de0e1cf8ca34fcc210b0c780a244e135","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	\N	monthly_lotery	User Not Found	2024-05-20 04:49:38	2024-05-20 08:49:38
52	0	ERC20Transfer	0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15	0x150dFEB9Ab5FD44D6117c945A12B96540Dc77527	0xf887edd6069b5ac317dd2ea0e78254b27b560cc758cb8f44665d598eae78dc6f	500	0	{"eventType":"ERC20Transfer","fromAddress":"0x150dFEB9Ab5FD44D6117c945A12B96540Dc77527","toAddress":"0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15","amount":"500","transactionHash":"0xf887edd6069b5ac317dd2ea0e78254b27b560cc758cb8f44665d598eae78dc6f","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	\N	registration	User Not Found	2024-05-22 12:23:23	2024-05-22 16:23:23
46	42	ERC20Transfer	0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15	0x99C1752834B78B994E11ee18Ec5CA220d4891692	0x696ae7985dabf39c8ad18907ad3dd3193605acd15b3be1c422360c0ee78b61fc	500	1	{"eventType":"ERC20Transfer","fromAddress":"0x99C1752834B78B994E11ee18Ec5CA220d4891692","toAddress":"0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15","amount":"500","transactionHash":"0x696ae7985dabf39c8ad18907ad3dd3193605acd15b3be1c422360c0ee78b61fc","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	registration	Membership Purchase Completed	2024-05-20 04:34:42	2024-05-20 08:34:42
48	43	ERC20Transfer	0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15	0x99C1752834B78B994E11ee18Ec5CA220d4891692	0x8f905d31dfbc293c9f4ba874e9e7f9d84d3c1bf5e301b7d3430172cac0801079	500	1	{"eventType":"ERC20Transfer","fromAddress":"0x99C1752834B78B994E11ee18Ec5CA220d4891692","toAddress":"0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15","amount":"500","transactionHash":"0x8f905d31dfbc293c9f4ba874e9e7f9d84d3c1bf5e301b7d3430172cac0801079","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	registration	Membership Purchase Completed	2024-05-20 04:48:50	2024-05-20 08:48:50
51	0	ERC20Transfer	0xF4918C194cA780e74fBa8dE4013573A18E866E74	0xBE27e478d1cD341368955F3F6a267ba158369DbF	0x77c4723a8777f395249da1a64e42ecc425d80f00b83e4353f14a886a08ab0db2	0.000000000000000025	0	{"eventType":"ERC20Transfer","fromAddress":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","toAddress":"0xF4918C194cA780e74fBa8dE4013573A18E866E74","amount":"0.000000000000000025","transactionHash":"0x77c4723a8777f395249da1a64e42ecc425d80f00b83e4353f14a886a08ab0db2","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	\N	monthly_lotery	User Not Found	2024-05-21 09:10:38	2024-05-21 13:10:38
54	52	ERC20Transfer	0x99C1752834B78B994E11ee18Ec5CA220d4891692	0x9F0Ee8f1E0DCcd2C2c5D7e29d920a382fBb71fd2	0x15f580273e473b0a53661ad143c517911ed6e11dfd69f9fee812cc55af6490ca	100	1	{"eventType":"ERC20Transfer","fromAddress":"0x9F0Ee8f1E0DCcd2C2c5D7e29d920a382fBb71fd2","toAddress":"0x99C1752834B78B994E11ee18Ec5CA220d4891692","amount":"100","transactionHash":"0x15f580273e473b0a53661ad143c517911ed6e11dfd69f9fee812cc55af6490ca","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	daily_lotery	Daily Lotery Purchased	2024-07-01 10:45:41	2024-07-01 10:45:41
50	44	ERC20Transfer	0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15	0x99C1752834B78B994E11ee18Ec5CA220d4891692	0xfc274a1cdbfe940ebb45674a827ad0c1d49e4dd227e4f8f3f84e80a6457e9e7e	500	1	{"eventType":"ERC20Transfer","fromAddress":"0x99C1752834B78B994E11ee18Ec5CA220d4891692","toAddress":"0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15","amount":"500","transactionHash":"0xfc274a1cdbfe940ebb45674a827ad0c1d49e4dd227e4f8f3f84e80a6457e9e7e","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	registration	Membership Purchase Completed	2024-05-20 04:53:31	2024-05-20 08:53:31
53	52	ERC20Transfer	0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15	0x9F0Ee8f1E0DCcd2C2c5D7e29d920a382fBb71fd2	0xda50b4bb2530063abeb4832d0a0e0ebbdf44a1fd61953560679a7f634413b238	500	1	{"eventType":"ERC20Transfer","fromAddress":"0x9F0Ee8f1E0DCcd2C2c5D7e29d920a382fBb71fd2","toAddress":"0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15","amount":"500","transactionHash":"0xda50b4bb2530063abeb4832d0a0e0ebbdf44a1fd61953560679a7f634413b238","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	registration	Membership Purchase Completed	2024-07-01 10:42:51	2024-07-01 14:42:51
55	52	ERC20Transfer	0xF4918C194cA780e74fBa8dE4013573A18E866E74	0x9F0Ee8f1E0DCcd2C2c5D7e29d920a382fBb71fd2	0x13778001731e8dcbc303f6a71fa3319d01df34c1bec29504cfce2efa28c5cdc9	500	1	{"eventType":"ERC20Transfer","fromAddress":"0x9F0Ee8f1E0DCcd2C2c5D7e29d920a382fBb71fd2","toAddress":"0xF4918C194cA780e74fBa8dE4013573A18E866E74","amount":"500","transactionHash":"0x13778001731e8dcbc303f6a71fa3319d01df34c1bec29504cfce2efa28c5cdc9","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	monthly_lotery	Monthly Lotery Purchased	2024-07-01 12:22:00	2024-07-01 12:22:00
56	52	ERC20Transfer	0xF4918C194cA780e74fBa8dE4013573A18E866E74	0x9F0Ee8f1E0DCcd2C2c5D7e29d920a382fBb71fd2	0xbcf016e19509635338b186f5ddf3afd476417d4b2e9a732248772d6f6e5dfdcb	500	1	{"eventType":"ERC20Transfer","fromAddress":"0x9F0Ee8f1E0DCcd2C2c5D7e29d920a382fBb71fd2","toAddress":"0xF4918C194cA780e74fBa8dE4013573A18E866E74","amount":"500","transactionHash":"0xbcf016e19509635338b186f5ddf3afd476417d4b2e9a732248772d6f6e5dfdcb","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	monthly_lotery	Monthly Lotery Purchased	2024-07-01 12:32:21	2024-07-01 12:32:21
59	62	ERC20Transfer	0x99C1752834B78B994E11ee18Ec5CA220d4891692	0xBE27e478d1cD341368955F3F6a267ba158369DbF	0x5a7c71b39b8da81076f08a96c8852b3e0ca0a66a30aa6d4a6127c6c6dea9c379	100	1	{"eventType":"ERC20Transfer","fromAddress":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","toAddress":"0x99C1752834B78B994E11ee18Ec5CA220d4891692","amount":"100","transactionHash":"0x5a7c71b39b8da81076f08a96c8852b3e0ca0a66a30aa6d4a6127c6c6dea9c379","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	daily_lotery	Daily Lotery Purchased	2024-07-01 13:01:32	2024-07-01 13:01:32
57	52	ERC20Transfer	0xF4918C194cA780e74fBa8dE4013573A18E866E74	0x9F0Ee8f1E0DCcd2C2c5D7e29d920a382fBb71fd2	0x3a9ca502c6888c8182adf1006c446f262f3f7d2a8a852064135c8bfa3fd3bc53	500	1	{"eventType":"ERC20Transfer","fromAddress":"0x9F0Ee8f1E0DCcd2C2c5D7e29d920a382fBb71fd2","toAddress":"0xF4918C194cA780e74fBa8dE4013573A18E866E74","amount":"500","transactionHash":"0x3a9ca502c6888c8182adf1006c446f262f3f7d2a8a852064135c8bfa3fd3bc53","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	monthly_lotery	Monthly Lotery Purchased	2024-07-01 12:40:36	2024-07-01 12:40:36
66	64	ERC20Transfer	0x99C1752834B78B994E11ee18Ec5CA220d4891692	0x97209B4F565280A0CF1abcf19f18E70E23f006b5	0x50cd560620d40446fc66158657f191fe0b10882be31570fe68300bf00fac82f8	100	1	{"eventType":"ERC20Transfer","fromAddress":"0x97209B4F565280A0CF1abcf19f18E70E23f006b5","toAddress":"0x99C1752834B78B994E11ee18Ec5CA220d4891692","amount":"100","transactionHash":"0x50cd560620d40446fc66158657f191fe0b10882be31570fe68300bf00fac82f8","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	daily_lotery	Daily Lotery Purchased	2024-07-04 07:39:05	2024-07-04 07:39:06
60	52	ERC20Transfer	0x99C1752834B78B994E11ee18Ec5CA220d4891692	0x9F0Ee8f1E0DCcd2C2c5D7e29d920a382fBb71fd2	0x19f223db266e7d2c26596fc211bc713c9deb079a94669e58860c9462c6848a5a	100	1	{"eventType":"ERC20Transfer","fromAddress":"0x9F0Ee8f1E0DCcd2C2c5D7e29d920a382fBb71fd2","toAddress":"0x99C1752834B78B994E11ee18Ec5CA220d4891692","amount":"100","transactionHash":"0x19f223db266e7d2c26596fc211bc713c9deb079a94669e58860c9462c6848a5a","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	daily_lotery	Daily Lotery Purchased	2024-07-01 13:22:42	2024-07-01 13:22:42
58	62	ERC20Transfer	0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15	0xBE27e478d1cD341368955F3F6a267ba158369DbF	0xe5dd51042d61acfacb94d4fb07055189846176185932759e46186cc4ff66fc68	500	1	{"eventType":"ERC20Transfer","fromAddress":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","toAddress":"0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15","amount":"500","transactionHash":"0xe5dd51042d61acfacb94d4fb07055189846176185932759e46186cc4ff66fc68","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	registration	Membership Purchase Completed	2024-07-01 12:57:26	2024-07-01 16:57:26
63	63	ERC20Transfer	0x99C1752834B78B994E11ee18Ec5CA220d4891692	0x12D7d0a86b2E55DF62f2e830B732d1367dfCd2eF	0xb6aabec71f61404dd8a3d78d2c0e3a88acf713d6018f7810498bb89f663db459	100	1	{"eventType":"ERC20Transfer","fromAddress":"0x12D7d0a86b2E55DF62f2e830B732d1367dfCd2eF","toAddress":"0x99C1752834B78B994E11ee18Ec5CA220d4891692","amount":"100","transactionHash":"0xb6aabec71f61404dd8a3d78d2c0e3a88acf713d6018f7810498bb89f663db459","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	daily_lotery	Daily Lotery Purchased	2024-07-03 15:07:20	2024-07-03 15:07:20
62	63	ERC20Transfer	0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15	0x12D7d0a86b2E55DF62f2e830B732d1367dfCd2eF	0x3abe7ddc79ff3f59d023522f4fa3d927eef6eda34ce5d23559bd8ebb7240cefa	500	1	{"eventType":"ERC20Transfer","fromAddress":"0x12D7d0a86b2E55DF62f2e830B732d1367dfCd2eF","toAddress":"0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15","amount":"500","transactionHash":"0x3abe7ddc79ff3f59d023522f4fa3d927eef6eda34ce5d23559bd8ebb7240cefa","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	registration	Membership Purchase Completed	2024-07-03 15:04:48	2024-07-03 19:04:48
61	52	ERC20Transfer	0x99C1752834B78B994E11ee18Ec5CA220d4891692	0x9F0Ee8f1E0DCcd2C2c5D7e29d920a382fBb71fd2	0x7a29121e02eb41d93b77085011cab9ddd8de9b72a5179689ab36e5cc24ebd7be	100	1	{"eventType":"ERC20Transfer","fromAddress":"0x9F0Ee8f1E0DCcd2C2c5D7e29d920a382fBb71fd2","toAddress":"0x99C1752834B78B994E11ee18Ec5CA220d4891692","amount":"100","transactionHash":"0x7a29121e02eb41d93b77085011cab9ddd8de9b72a5179689ab36e5cc24ebd7be","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	daily_lotery	Daily Lotery Purchased	2024-07-01 13:26:29	2024-07-01 13:26:29
64	64	ERC20Transfer	0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15	0x97209B4F565280A0CF1abcf19f18E70E23f006b5	0xdecd0052bd734c223bf5fd39b8dbb573ee20bf045c010f6b0ccdc0903e4d14c7	500	1	{"eventType":"ERC20Transfer","fromAddress":"0x97209B4F565280A0CF1abcf19f18E70E23f006b5","toAddress":"0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15","amount":"500","transactionHash":"0xdecd0052bd734c223bf5fd39b8dbb573ee20bf045c010f6b0ccdc0903e4d14c7","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	registration	Membership Purchase Completed	2024-07-04 06:56:13	2024-07-04 10:56:13
65	65	ERC20Transfer	0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15	0xEc4A3d416Ad63765D135369d2dFa0FDB73CfBB8F	0x6adc5ed80dfb10a41fecc9034539f118f99e87848ec34365a984ead09518504f	500	1	{"eventType":"ERC20Transfer","fromAddress":"0xEc4A3d416Ad63765D135369d2dFa0FDB73CfBB8F","toAddress":"0x0384aEFb4aF6a89073Df18486cb2F2C22F003C15","amount":"500","transactionHash":"0x6adc5ed80dfb10a41fecc9034539f118f99e87848ec34365a984ead09518504f","network":"matic","tokenAddress":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43"}	0	registration	Membership Purchase Completed	2024-07-04 07:09:47	2024-07-04 11:09:47
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, dial_code, phone, phone_verified, password, email_verified_at, role, verified, user_type_id, first_name, last_name, user_image, user_phone_otp, remember_token, created_at, updated_at, deleted, role_id, active, user_code, refferal_code, refered_by, is_commission_processed, wallet_address, is_membership_paid) FROM stdin;
51	sooraj sooraj	sooraj@m2.com	971	505056522	0	$2y$12$n/B/j7ceVaU59I5ZqIizIeSrxghqciWk7Xh4MwPu2Ibr2puo4f816	\N	3	0	\N	sooraj	sooraj	\N	\N	\N	2024-07-01 08:15:06	2024-07-01 08:15:06	0	0	1	NWTJF	\N	0	0	0x9f0ee8f1e0dccd2c2c5d7e29d920a382fbb71fd3	0
44	developer dev	dev2@yopmail.com	93	7895455	0	$2y$12$qMNQ0mrPXtNU5I5Rb.cDGu1Az5L/AlQioFZePAMynAGL5QBFTjrei	\N	3	0	\N	developer	dev	1716186093664aebed0fb25.jpg	\N	\N	2024-05-20 04:52:23	2024-05-20 06:21:33	0	0	1	BLC-664ad707a5ee9	BLC-66487a2d64f4a	41	1	0x99c1752834b78b994e11ee18ec5ca220d4891692	1
39	sooraj moziall	sooraj@mozilla.com	93	35434653	0	$2y$12$021Jn7heqZHP6j77D4gdQeFJqA.SuKkmOi89r580zyUT4C4sFyPXC	\N	3	0	\N	sooraj	moziall	\N	\N	\N	2024-05-18 09:20:02	2024-05-18 09:22:05	0	0	1	BLC-664872c2724fb	BLC-664871cf8504a	38	1	0xf4918c194ca780e74fba8de4013573a18e866e74	1
38	Sooraj sabu	sooraj@metamask.com	93	984782655	0	$2y$12$t4420.wad2lg/mJFwjd4T.BnYRGxbr/fHxWCJOCXVS26OXndOj/nq	\N	3	0	\N	Sooraj	sabu	\N	\N	\N	2024-05-18 09:15:59	2024-05-18 09:18:25	0	0	1	BLC-664871cf8504a	\N	0	1	0x99c1752834b78b994e11ee18ec5ca220d4891693	1
40	Nemai Biswas	u0@mailinator.com	91	9832831812	0	$2y$12$4L2hFEr8.tc9orqJjcR4D.ym6QlH8KvfOqsLTiL7vmL222S.r0l2C	\N	3	0	\N	Nemai	Biswas	\N	\N	\N	2024-05-18 09:42:13	2024-05-18 09:47:14	0	0	1	BLC-664877f5e8809	BLC-664872c2724fb	39	1	0x606807226e6fcab4056fa87d3b161b71b27419fc	1
1	Admin	admin@admin.com	971	112233445566778899	0	$2y$12$6O5j1TtlfXF7/I74pxeTJeew7fGwMFsGSL0yB9b/SywCtzRhKbPNS	\N	1	1	1	\N	\N	\N	\N	\N	\N	2024-03-22 12:32:29	0	0	1	\N	\N	0	0	\N	0
41	Iamen Sawsib	u1@mailinator.com	91	983237656	0	$2y$12$tql.87zM/6zs3HPYBlsL1eo6SKPKd7mdLyboDIgvMg7ZYsvS/KUr.	\N	3	0	\N	Iamen	Sawsib	\N	\N	\N	2024-05-18 09:51:41	2024-05-18 09:53:14	0	0	1	BLC-66487a2d64f4a	BLC-664877f5e8809	40	1	0xffa808bbe2025d387da3853c92f22becc16f5353	1
53	soor ss	sooraj.cc@mc.com	971	505058655	0	$2y$12$.E/2KWBKJn7weakE28DAlOv32bPf9IN24sUfoZWrIO3nteQuT/BCa	\N	3	0	\N	soor	ss	\N	\N	\N	2024-07-01 08:25:00	2024-07-01 08:25:00	0	0	1	AVLGY	\N	0	0	0x9f0ee8f1e0dccd2c2c5d7e29d920a382fbb71fdf	0
54	soo as	soo.cc.@c.com	971	50555425	0	$2y$12$W0bUvBHXaphjKQzZ59R0F.mbdlxTrLz5BCdvX3GiBpkhWrt.C1Ggu	\N	3	0	\N	soo	as	\N	\N	\N	2024-07-01 08:29:12	2024-07-01 08:29:12	0	0	1	AOVPS	\N	0	0	0x9f0eg8f1e0dccd2c2c5d7e29d920a382fbb71fd2	0
45	Shibin NV	shibin.nayanaveetil@gmail.com__deleted_account_app45__deleted_account_app45	91	9656645593__deleted_account_app45__deleted_account_app45	0	$2y$12$De97DrnoDTsm6usldvNyTuhIZ3Ub4J0jKs08tWsRP6bhpb4hhPGE2	\N	3	0	\N	Shibin	NV	\N	\N	\N	2024-05-22 11:57:47	2024-05-22 12:01:21	1	0	0	BLC-664dddbbb1d20	\N	0	0	0x76d8c71d1a3d65abb33448f287071922db7f0f43	0
42	tester test	tester@yopmail.com	93	2523523	0	$2y$12$ZDdh6JZgJATLvm4.Wyjrhu45E5HZnQVAIJe2pWFqkJe1TuDDQGcBq	\N	3	0	\N	tester	test	\N	\N	\N	2024-05-20 04:33:18	2024-05-20 04:34:46	0	0	1	BLC-664ad28e60920	BLC-66487a2d64f4a	41	1	0x99c1752834b78b994e11ee18ec5ca220d4891695	1
46	Shibin NV	shibin.nayanaveetil@gmail.com	91	9656645593	0	$2y$12$DOk4.JwXRa.5m/fM8fo5VeVrPPquXdYkoYV83fPzU2aOx14VY8Svi	\N	3	0	\N	Shibin	NV	\N	\N	\N	2024-05-22 12:07:06	2024-05-22 12:07:06	0	0	1	BLC-664ddfea82f6d	BLC-664ad707a5ee9	44	0	0x97cbaf5afec3d5f5902894650d86ae932502c16f	0
43	dev de	dev@yopmail.com	93	235352	0	$2y$12$sR1pQQrNJFUZ.dKsw6c03e1JEox232EBIlvlfANOvZ1B.M5U/TAmi	\N	3	0	\N	dev	de	\N	\N	\N	2024-05-20 04:47:01	2024-05-20 04:48:54	0	0	1	BLC-664ad5c587af9	BLC-66487a2d64f4a	41	1	0x99c1752834b78b994e11ee18ec5ca220d4891612	1
47	Prasanth Kumar	pk254492@gmail.com	91	9061516071	0	$2y$12$0l1xQmYNI3866p7fsbS7puZvYkXbGfpZHJ/nQGMRbYMAYS3opNAoS	\N	3	0	\N	Prasanth	Kumar	1716380887664de4d717692.jpg	\N	\N	2024-05-22 12:13:11	2024-05-22 12:28:07	0	0	1	BLC-664de157430a3	BLC-664ddfea82f6d	46	0	0x163e02fd0d3862282cb3584fadaa51fffb36363c	0
48	dsadsa dsadsads	ajeshcd@gmail.com1	93	32323232	0	$2y$12$KBkXc7DlrRMKIw0/w31GdOJpPZRdlqD9I4fAEmAWP8fbpUU9u8gXi	\N	3	0	\N	dsadsa	dsadsads	\N	\N	\N	2024-06-29 05:49:33	2024-06-29 05:49:33	0	0	1	BLC-667fa06dd3e90	\N	0	0	0x99c1752834b78b994e11ee18ec5ca220d4891634	0
55	ss sss	soo.cc@mcf.com	971	505048665	0	$2y$12$DKyuQTqcYi4AR1j6NUMo9u/XoECEo5d7mJWWopYUnSE9x7BvULHkO	\N	3	0	\N	ss	sss	\N	\N	\N	2024-07-01 08:34:01	2024-07-01 08:34:01	0	0	1	TRAZW	\N	0	0	0x9f0eg8f1e0dfdd2c2c5d7e29d920a382fbb71fd2	0
49	new tst ss	s@yopmail.com	93	78958455	0	$2y$12$ykRA/97Dllr7VTMdLseRr.cMvXY5soRoZxsMOvNJQQHZRmHehYhVW	\N	3	0	\N	new tst	ss	\N	\N	\N	2024-06-29 06:56:59	2024-06-29 06:56:59	0	0	1	HFZBF	BLC-664871cf8504a	38	0	0x99c1752834b87b994e11ee18ec5ca220d4891692	0
56	ss ss	s@cc.com	971	505048555	0	$2y$12$f/H1EEglOTx.32O9C4zSq.f1O3meftk7UUiCkQuILOinSYwXQSjKW	\N	3	0	\N	ss	ss	\N	\N	\N	2024-07-01 08:37:28	2024-07-01 08:37:28	0	0	1	KJNZD	\N	0	0	0x9g0eg8f1e0dfdd2c2c5d7e29d920a382fbb71fd2	0
57	ss ss	so@gg.com	971	505048955	0	$2y$12$21Ay5yausaEwrh/lv69oC.kXKStMVYk6XNT1vwQ7FNEJPHHWG8sze	\N	3	0	\N	ss	ss	\N	\N	\N	2024-07-01 08:55:20	2024-07-01 08:55:20	0	0	1	VACDP	\N	0	0	0x9f0ee8f1e0dccd2c2c5d7e98d920a382fbb71fd2	0
58	ss ss	soo.c@gmail.com	971	5050879855	0	$2y$12$Wvt1bUtIeL09emA6TRCI9eY3rKHH0LzuLAkfmM0KslnxJJg903N86	\N	3	0	\N	ss	ss	\N	\N	\N	2024-07-01 09:20:50	2024-07-01 09:20:50	0	0	1	OMYDL	\N	0	0	0x9f0ee8f1e0dccd2c2c5de729d920a382fbb71fd2	0
50	dev dev	devme@yopmail.com	964	505086055	0	$2y$12$QOH5iLrw8z2IL/yVANksNOwdYMS0gn6vkB9P.dTDRqkYEZ9IXlDxy	\N	3	0	\N	dev	dev	\N	\N	\N	2024-06-29 08:16:59	2024-06-29 09:15:59	0	0	1	HTIET	BLC-664871cf8504a	38	0	0x99c1752834b76b994e11ee18ec5ca220d4891692	0
59	s s	soo@tt.com	971	5050879546	0	$2y$12$mS/7r/uYLulmmoWcNylDBOrrhijxGz8/xIONUfaDLogBerq6.6tZy	\N	3	0	\N	s	s	\N	\N	\N	2024-07-01 09:23:24	2024-07-01 09:23:24	0	0	1	TBIAF	\N	0	0	0x9f0ee8f1e9dccd2c2c5d7e29d920a382fbb71fd2	0
60	s s	soo@tttf.com	971	505054684655	0	$2y$12$PL0q90hzc.5QSv1JqDEhRe6gJaNDvtecjd7OVtMI.YrXxoa9j.xqa	\N	3	0	\N	s	s	\N	\N	\N	2024-07-01 09:26:52	2024-07-01 09:26:52	0	0	1	ZCVGN	\N	0	0	0x9f0ee8f1e0dccd2c2c5d7e2929d0a382fbb71fd2	0
61	sooraj new	sooraj@mew.com	971	5050894652	0	$2y$12$lg.x6qtuv1JHp5pmBKFcFuI5uBcXNy5CashqBlyXcTMGpdIIIAXNG	\N	3	0	\N	sooraj	new	\N	\N	\N	2024-07-01 10:00:22	2024-07-01 10:00:22	0	0	1	WNTNE	\N	0	0	0x9f0ee8f1e0dccd2c2c5d7e29d920a382fbb71ff2	0
52	soroaj s	sooraj@m3.com	971	505048965	0	$2y$12$5hTsmA/7HeEO18YEvgs3VuS6jxek/A90sxmC.UI8cnXJKnUPzoQ86	\N	3	0	\N	soroaj	s	\N	\N	\N	2024-07-01 08:17:52	2024-07-01 10:42:52	0	0	1	XFVAS	\N	0	1	0x9f0ee8f1e0dccd2c2c5d7e29d920a382fbb71fd2	1
62	Ajesh Kumar	ajeshcd@mail.com	971	5050418601	0	$2y$12$NY0nBDiOi3qlFp76o0ZrZedmS9aeC01l1ykzmyU71kD8MCnxpg2ZK	\N	3	0	\N	Ajesh	Kumar	\N	\N	\N	2024-07-01 12:56:38	2024-07-01 12:57:27	0	0	1	HFALK	\N	0	1	0xbe27e478d1cd341368955f3f6a267ba158369dbf	1
63	Ram Kumar	ajeshkumarcd@gmail.com	971	505041862	0	$2y$12$v0J.VmTN4G20xrPSRq53DeX1zjzIjjGCcR7455uFjPKQE5.G84COO	\N	3	0	\N	Ram	Kumar	\N	\N	\N	2024-07-03 15:02:38	2024-07-03 15:04:50	0	0	1	SUSPE	BLC-667fa06dd3e90	48	1	0x12d7d0a86b2e55df62f2e830b732d1367dfcd2ef	1
64	Shibin NV	shibin.nv1990@gmail.com	971	542521589	0	$2y$12$5RwaHPdl5ct2qOm8EddDyOnovlIX/Ia/uQHf1cBp6/Lmu5w.OqjCq	\N	3	0	\N	Shibin	NV	\N	\N	\N	2024-07-04 06:32:37	2024-07-04 06:56:15	0	0	1	ENVNN	BLC-667fa06dd3e90	48	1	0x97209b4f565280a0cf1abcf19f18e70e23f006b5	1
65	Ajesh Kumar	ajesh@dxbapps.com	971	3223433	0	$2y$12$hMY79QrzOGOBYKjF0tGKr.55xbyUAUv6q2vmxikg29/QjIKpgwMA6	\N	3	0	\N	Ajesh	Kumar	\N	\N	\N	2024-07-04 07:08:33	2024-07-04 07:10:01	0	0	1	CCFUC	ENVNN	64	1	0xec4a3d416ad63765d135369d2dfa0fdb73cfbb8f	1
\.


--
-- Data for Name: winner_price_distributions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.winner_price_distributions (id, order_id, user_id, price_paid, distribution_status, transaction_hash, contract_input, contract_response, remark, mining_statuc_check_counter, created_at, updated_at) FROM stdin;
1	18	38	300	2	0x1179c70d820da3172fed925b49e9c30c0348cabd30e67babd9bbf1497ee3717c	{"toAddress":"0x99c1752834b78b994e11ee18ec5ca220d4891693","amount":"300"}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":56,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x07097c87c1"},"maxFeePerGas":{"type":"BigNumber","hex":"0x07097c87c1"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0xdd8b"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb00000000000000000000000099c1752834b78b994e11ee18ec5ca220d4891693000000000000000000000000000000000000000000000000000000000000012c","accessList":[],"hash":"0x1179c70d820da3172fed925b49e9c30c0348cabd30e67babd9bbf1497ee3717c","v":0,"r":"0x35eafd88beea2fe61f4f7af618b0f0f5d737876b426ceb6420e60b55c7a2bb9d","s":"0x2651c7e36fe95a706bebfb10e9d4741ac444de7403b768ab2e7d65d91193088a","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	Transaction initirated	0	2024-07-01 07:13:59	2024-07-01 07:20:06
4	17	38	500	2	0xeb5b44bcf6ac6fcf9ee432a0b5a1ddd61d2da7d9aa9001d93343a28af25f0a58	{"toAddress":"0x99c1752834b78b994e11ee18ec5ca220d4891693","amount":"500"}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":58,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x072d3b19e3"},"maxFeePerGas":{"type":"BigNumber","hex":"0x072d3b19e3"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99b0"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb00000000000000000000000099c1752834b78b994e11ee18ec5ca220d489169300000000000000000000000000000000000000000000000000000000000001f4","accessList":[],"hash":"0xeb5b44bcf6ac6fcf9ee432a0b5a1ddd61d2da7d9aa9001d93343a28af25f0a58","v":1,"r":"0x472e15aaaf76755f72e9317408f3450985fc92485a067f118c63319f4bc28580","s":"0x03d334aa848ccc7dbcb8a048df4e7fba8a8ba58623657235a01aa3c6dfc162d3","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	Transaction initirated	2	2024-07-01 07:45:40	2024-07-01 07:48:04
2	14	41	1000	2	0x0ab0b5fa068171d3aaeeca17df08bff6a869af6916470b01ca62686942ce0df5	{"toAddress":"0xffa808bbe2025d387da3853c92f22becc16f5353","amount":"1000"}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":57,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x07210375ed"},"maxFeePerGas":{"type":"BigNumber","hex":"0x07210375ed"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99b0"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb000000000000000000000000ffa808bbe2025d387da3853c92f22becc16f535300000000000000000000000000000000000000000000000000000000000003e8","accessList":[],"hash":"0x0ab0b5fa068171d3aaeeca17df08bff6a869af6916470b01ca62686942ce0df5","v":1,"r":"0x9a5be584859025c29888daedb3b3380e32f20e3be37d60dc31b6ac59f0064ec0","s":"0x0d3355bb8df3ac183d6a255a87c0d419e97b01198dd1dec4cef9d06ccc4a169b","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	Transaction initirated	0	2024-07-01 07:40:25	2024-07-01 07:41:02
3	16	38	500	0	0x5fa50234756f831985a88efd768e84b66244b92994fd2c2601ed8a61f4138f85	{"toAddress":"0x99c1752834b78b994e11ee18ec5ca220d4891693","amount":"500000000000000000000"}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":66,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac27"},"maxFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac27"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99ec"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb00000000000000000000000099c1752834b78b994e11ee18ec5ca220d489169300000000000000000000000000000000000000000000001b1ae4d6e2ef500000","accessList":[],"hash":"0x5fa50234756f831985a88efd768e84b66244b92994fd2c2601ed8a61f4138f85","v":1,"r":"0x031b63ae9fe1cf0b88f73615c4ebfde26a96334cfdb58a8dea46a908f516d447","s":"0x6a6207a8affcbcbf806ab67acd24ba835f5fe7f8e46bce380159fdd374947b6b","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	\N	0	2024-07-01 07:45:40	2024-07-01 13:05:48
8	26	63	2000	2	0xd34f4f7feeb4fb84118fb3b4dacf19bd3539b34dc95d10835dd601cae9e4feec	{"toAddress":"0x12d7d0a86b2e55df62f2e830b732d1367dfcd2ef","amount":"2000000000000000000000"}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":79,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x06fc240fc2"},"maxFeePerGas":{"type":"BigNumber","hex":"0x06fc240fc2"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99ec"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb00000000000000000000000012d7d0a86b2e55df62f2e830b732d1367dfcd2ef00000000000000000000000000000000000000000000006c6b935b8bbd400000","accessList":[],"hash":"0xd34f4f7feeb4fb84118fb3b4dacf19bd3539b34dc95d10835dd601cae9e4feec","v":1,"r":"0x17b404bfadda25c5aaca27c0c4eda67de72d924ca1ca54085061e9fdbe5403fa","s":"0x58f4ef3c709ed1ea7734bdbec96e5737e08d8f6c03eb41214bb5f935dd51f4a5","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	Transaction initirated	4	2024-07-04 07:44:23	2024-07-04 07:49:04
6	23	62	2000	2	0x6fa15bd224ba96a5d77169a44b0d763fd7fe57108995074078fc9ff3f0fd9f72	{"toAddress":"0xbe27e478d1cd341368955f3f6a267ba158369dbf","amount":"2000000000000000000000"}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":65,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac23"},"maxFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac23"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x87ec"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb000000000000000000000000be27e478d1cd341368955f3f6a267ba158369dbf00000000000000000000000000000000000000000000006c6b935b8bbd400000","accessList":[],"hash":"0x6fa15bd224ba96a5d77169a44b0d763fd7fe57108995074078fc9ff3f0fd9f72","v":1,"r":"0x1a1ed2d46f9cdae7f4060e1aa93095223186c063a9ecf9bdac96c4674b8aee79","s":"0x2bcd2e7b7512e4291d9084d18d5f0c31f7162dca228566b63a9cef14bd741a35","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	Transaction initirated	0	2024-07-01 13:04:10	2024-07-01 13:05:05
5	19	52	2000	2	0xc80b2d264c9f10113242afded08646639f51045163aa8196a3665c2b81e21a80	{"toAddress":"0x9f0ee8f1e0dccd2c2c5d7e29d920a382fbb71fd2","amount":"2000000000000000000000"}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":62,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac25"},"maxFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac25"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99ec"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb0000000000000000000000009f0ee8f1e0dccd2c2c5d7e29d920a382fbb71fd200000000000000000000000000000000000000000000006c6b935b8bbd400000","accessList":[],"hash":"0xc80b2d264c9f10113242afded08646639f51045163aa8196a3665c2b81e21a80","v":1,"r":"0x2b89af5c1a4aae6e861f5abf5ce49d760b30ea92c3b6e3a2fdcb031c255fac0c","s":"0x2c3ca464469ae9ee1f427b613bf12d02373351ead21bb7ee1cb013e0e60561bd","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	Transaction initirated	0	2024-07-01 11:57:06	2024-07-01 11:58:03
7	25	52	1000	2	0xe1407735b1977c081afe5fa51d013d20b639fd3307cf76f4ddcd501ee3ed9efa	{"toAddress":"0x9f0ee8f1e0dccd2c2c5d7e29d920a382fbb71fd2","amount":"1000000000000000000000"}	{"status":1,"message":"Amount transfered, waiting for mining","tx":{"type":2,"chainId":137,"nonce":67,"maxPriorityFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac20"},"maxFeePerGas":{"type":"BigNumber","hex":"0x06fc23ac20"},"gasPrice":null,"gasLimit":{"type":"BigNumber","hex":"0x99ec"},"to":"0x76d8C71d1a3d65Abb33448F287071922DB7F0f43","value":{"type":"BigNumber","hex":"0x00"},"data":"0xa9059cbb0000000000000000000000009f0ee8f1e0dccd2c2c5d7e29d920a382fbb71fd200000000000000000000000000000000000000000000003635c9adc5dea00000","accessList":[],"hash":"0xe1407735b1977c081afe5fa51d013d20b639fd3307cf76f4ddcd501ee3ed9efa","v":0,"r":"0x8d87f54de5673ff2feb0830e91c45b150d99bf305ba81b2c2db15e913e48d397","s":"0x3bce96771bb34dab5ac02dc129275b9682270b3b17773050703b1a64a6971721","from":"0xBE27e478d1cD341368955F3F6a267ba158369DbF","confirmations":0}}	Transaction initirated	0	2024-07-01 13:28:00	2024-07-01 13:28:05
\.


--
-- Name: amount_distribution_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.amount_distribution_histories_id_seq', 40, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articles_id_seq', 2, true);


--
-- Name: contact_us_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_us_settings_id_seq', 1, true);


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_seq', 242, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faq_id_seq', 2, true);


--
-- Name: help_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.help_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: member_ship_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.member_ship_histories_id_seq', 18, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 51, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 27, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 2, true);


--
-- Name: profile_bios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profile_bios_id_seq', 1, false);


--
-- Name: referel_earnings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.referel_earnings_id_seq', 31, true);


--
-- Name: role_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_permissions_id_seq', 48, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);


--
-- Name: temp_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_orders_id_seq', 1, false);


--
-- Name: transaction_tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_tracks_id_seq', 66, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 65, true);


--
-- Name: winner_price_distributions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.winner_price_distributions_id_seq', 8, true);


--
-- Name: amount_distribution_histories amount_distribution_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amount_distribution_histories
    ADD CONSTRAINT amount_distribution_histories_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


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
-- Name: contact_us_settings contact_us_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us_settings
    ADD CONSTRAINT contact_us_settings_pkey PRIMARY KEY (id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


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
-- Name: member_ship_histories member_ship_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member_ship_histories
    ADD CONSTRAINT member_ship_histories_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: profile_bios profile_bios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_bios
    ADD CONSTRAINT profile_bios_pkey PRIMARY KEY (id);


--
-- Name: referel_earnings referel_earnings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.referel_earnings
    ADD CONSTRAINT referel_earnings_pkey PRIMARY KEY (id);


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
-- Name: temp_orders temp_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_orders
    ADD CONSTRAINT temp_orders_pkey PRIMARY KEY (id);


--
-- Name: transaction_tracks transaction_tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_tracks
    ADD CONSTRAINT transaction_tracks_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: winner_price_distributions winner_price_distributions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.winner_price_distributions
    ADD CONSTRAINT winner_price_distributions_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: users_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_id_index ON public.users USING btree (id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

