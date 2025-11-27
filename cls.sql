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

--
-- Name: ad_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ad_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ad_fields_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ad_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ad_fields (
    id bigint DEFAULT nextval('public.ad_fields_id_seq'::regclass) NOT NULL,
    ad_id bigint NOT NULL,
    field_id bigint NOT NULL,
    field_label character varying(255),
    value text NOT NULL,
    field_label_ar character varying(255),
    value_ar text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.ad_fields OWNER TO postgres;

--
-- Name: ad_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ad_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ad_plans_id_seq OWNER TO postgres;

--
-- Name: ad_plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ad_plans (
    id bigint DEFAULT nextval('public.ad_plans_id_seq'::regclass) NOT NULL,
    pricing_plan_id bigint NOT NULL,
    ad_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    duration character varying(255) NOT NULL,
    price character varying(255) NOT NULL,
    currency character varying(255) NOT NULL,
    tax character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.ad_plans OWNER TO postgres;

--
-- Name: ads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ads_id_seq OWNER TO postgres;

--
-- Name: ads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ads (
    id bigint DEFAULT nextval('public.ads_id_seq'::regclass) NOT NULL,
    ad_number character varying(255),
    user_id bigint NOT NULL,
    category_id bigint NOT NULL,
    city_id bigint NOT NULL,
    status character varying(255) NOT NULL,
    total_amount double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_featured bigint DEFAULT 0,
    CONSTRAINT ads_status_check CHECK (((status)::text = ANY (ARRAY[('Draft'::character varying)::text, ('Payment Pending'::character varying)::text, ('Rejected'::character varying)::text, ('Expired'::character varying)::text, ('Live'::character varying)::text, ('Under Review'::character varying)::text])))
);


ALTER TABLE public.ads OWNER TO postgres;

--
-- Name: badges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.badges (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    name_ar character varying(255) NOT NULL,
    description text NOT NULL,
    description_ar text NOT NULL,
    icon character varying(255),
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.badges OWNER TO postgres;

--
-- Name: badges_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.badges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.badges_id_seq OWNER TO postgres;

--
-- Name: badges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.badges_id_seq OWNED BY public.badges.id;


--
-- Name: banners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banners (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    parent_category_id bigint NOT NULL,
    category_id bigint NOT NULL,
    image character varying(255) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    ad_id bigint
);


ALTER TABLE public.banners OWNER TO postgres;

--
-- Name: banners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.banners_id_seq OWNER TO postgres;

--
-- Name: banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banners_id_seq OWNED BY public.banners.id;


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
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    id bigint DEFAULT nextval('public.bookings_id_seq'::regclass) NOT NULL,
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
    delivery_method_price numeric(10,2) DEFAULT '0'::numeric,
    delivery_type_price numeric(10,2) DEFAULT '0'::numeric,
    vat_amount numeric(10,2),
    CONSTRAINT bookings_status_check CHECK (((status)::text = ANY (ARRAY[('Pending'::character varying)::text, ('Under Process'::character varying)::text, ('Completed'::character varying)::text, ('Ready for Delivery'::character varying)::text])))
);


ALTER TABLE public.bookings OWNER TO postgres;

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
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint DEFAULT nextval('public.categories_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    name_ar character varying(255) NOT NULL,
    description text,
    description_ar text,
    status character varying(255) DEFAULT '1'::character varying NOT NULL,
    parent_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT categories_status_check CHECK (((status)::text = ANY (ARRAY[('0'::character varying)::text, ('1'::character varying)::text])))
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: category_atributes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_atributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_atributes_id_seq OWNER TO postgres;

--
-- Name: category_atributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category_atributes (
    id bigint DEFAULT nextval('public.category_atributes_id_seq'::regclass) NOT NULL,
    category_id integer NOT NULL,
    name character varying(255) NOT NULL,
    name_ar character varying(255) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.category_atributes OWNER TO postgres;

--
-- Name: category_atributes_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_atributes_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_atributes_value_id_seq OWNER TO postgres;

--
-- Name: category_atributes_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category_atributes_value (
    id bigint DEFAULT nextval('public.category_atributes_value_id_seq'::regclass) NOT NULL,
    category_id integer NOT NULL,
    attribute_id integer NOT NULL,
    name character varying(255) NOT NULL,
    name_ar character varying(255) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.category_atributes_value OWNER TO postgres;

--
-- Name: category_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_fields_id_seq OWNER TO postgres;

--
-- Name: category_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category_fields (
    id bigint DEFAULT nextval('public.category_fields_id_seq'::regclass) NOT NULL,
    category_id bigint NOT NULL,
    type character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    label_ar character varying(255) NOT NULL,
    name_ar character varying(255) NOT NULL,
    options text,
    attribute_id bigint,
    file_types character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    "order" bigint,
    field_id bigint
);


ALTER TABLE public.category_fields OWNER TO postgres;

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
-- Name: challenges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.challenges (
    id bigint DEFAULT nextval('public.challenges_id_seq'::regclass) NOT NULL,
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
-- Name: challenges_companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.challenges_companies (
    id bigint DEFAULT nextval('public.challenges_companies_id_seq'::regclass) NOT NULL,
    challenge_id bigint NOT NULL,
    company_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.challenges_companies OWNER TO postgres;

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
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id bigint DEFAULT nextval('public.cities_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    name_ar character varying(255) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    country_id bigint
);


ALTER TABLE public.cities OWNER TO postgres;

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
-- Name: cms_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cms_pages (
    id bigint DEFAULT nextval('public.cms_pages_id_seq'::regclass) NOT NULL,
    title character varying(255) NOT NULL,
    content text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    sub_title_2 text,
    flag_logo text,
    flag_title_1 text,
    flag_title_2 text,
    about_image text,
    about_video text,
    slogan text,
    our_business_title text,
    our_business_sub_title text,
    our_business_left_image text,
    our_business_right_image text,
    our_mission_title text,
    our_mission_logo text,
    our_mission_description text,
    our_vission_title text,
    our_vission_logo text,
    our_vission_description text,
    our_core_value_title text,
    our_core_value_logo text,
    our_core_value_description text,
    our_core_li_1 text,
    our_core_li_2 text,
    our_core_li_3 text,
    our_core_li_4 text,
    our_core_li_5 text,
    evalution_title text,
    evalution_sub_title text,
    team_title text,
    team_sub_title text,
    team_description text,
    about_video_image text,
    content_ar text,
    status integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.cms_pages OWNER TO postgres;

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
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    id bigint DEFAULT nextval('public.companies_id_seq'::regclass) NOT NULL,
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
-- Name: contact_us; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_us (
    id bigint DEFAULT nextval('public.contact_us_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    subject character varying(255),
    message text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.contact_us OWNER TO postgres;

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
    name_ar character varying(255),
    flag_icon character varying(255)
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
-- Name: delivery_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_types (
    id bigint DEFAULT nextval('public.delivery_types_id_seq'::regclass) NOT NULL,
    translation_type_id bigint,
    name character varying(255) NOT NULL,
    description text,
    price_type character varying(255) DEFAULT 'fixed'::character varying NOT NULL,
    price numeric(10,2) DEFAULT '0'::numeric,
    status character varying(255) DEFAULT '1'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT delivery_types_price_type_check CHECK (((price_type)::text = ANY (ARRAY[('free'::character varying)::text, ('fixed'::character varying)::text]))),
    CONSTRAINT delivery_types_status_check CHECK (((status)::text = ANY (ARRAY[('0'::character varying)::text, ('1'::character varying)::text])))
);


ALTER TABLE public.delivery_types OWNER TO postgres;

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
-- Name: event_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_types (
    id bigint DEFAULT nextval('public.event_types_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.event_types OWNER TO postgres;

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
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id bigint DEFAULT nextval('public.events_id_seq'::regclass) NOT NULL,
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
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint DEFAULT nextval('public.failed_jobs_id_seq'::regclass) NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

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
-- Name: faqs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faqs (
    id bigint DEFAULT nextval('public.faqs_id_seq'::regclass) NOT NULL,
    question character varying(255) NOT NULL,
    answer text NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.faqs OWNER TO postgres;

--
-- Name: field_conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.field_conditions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.field_conditions_id_seq OWNER TO postgres;

--
-- Name: field_conditions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.field_conditions (
    id bigint DEFAULT nextval('public.field_conditions_id_seq'::regclass) NOT NULL,
    category_id bigint NOT NULL,
    attribute_id bigint,
    operator character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    field_id character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    target_field_id bigint
);


ALTER TABLE public.field_conditions OWNER TO postgres;

--
-- Name: home_element_ads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_element_ads (
    id bigint NOT NULL,
    ad_id bigint NOT NULL,
    element_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.home_element_ads OWNER TO postgres;

--
-- Name: home_element_ads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.home_element_ads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_element_ads_id_seq OWNER TO postgres;

--
-- Name: home_element_ads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_element_ads_id_seq OWNED BY public.home_element_ads.id;


--
-- Name: home_elements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_elements (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    name_ar character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    item_id bigint NOT NULL,
    sort_order integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.home_elements OWNER TO postgres;

--
-- Name: home_elements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.home_elements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_elements_id_seq OWNER TO postgres;

--
-- Name: home_elements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_elements_id_seq OWNED BY public.home_elements.id;


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
-- Name: home_logos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_logos (
    id bigint DEFAULT nextval('public.home_logos_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    status boolean DEFAULT true NOT NULL,
    image character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.home_logos OWNER TO postgres;

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
-- Name: home_page_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_page_settings (
    id bigint DEFAULT nextval('public.home_page_settings_id_seq'::regclass) NOT NULL,
    key character varying(255) NOT NULL,
    value text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.home_page_settings OWNER TO postgres;

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
-- Name: insights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insights (
    id bigint DEFAULT nextval('public.insights_id_seq'::regclass) NOT NULL,
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
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint DEFAULT nextval('public.jobs_id_seq'::regclass) NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

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
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
    id bigint DEFAULT nextval('public.languages_id_seq'::regclass) NOT NULL,
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
-- Name: looking_ads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.looking_ads (
    id bigint NOT NULL,
    ad_id bigint NOT NULL,
    category_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.looking_ads OWNER TO postgres;

--
-- Name: looking_ads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.looking_ads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.looking_ads_id_seq OWNER TO postgres;

--
-- Name: looking_ads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.looking_ads_id_seq OWNED BY public.looking_ads.id;


--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer DEFAULT nextval('public.migrations_id_seq'::regclass) NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

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
-- Name: nationalities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nationalities (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    name_ar character varying(255) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.nationalities OWNER TO postgres;

--
-- Name: nationalities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nationalities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nationalities_id_seq OWNER TO postgres;

--
-- Name: nationalities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nationalities_id_seq OWNED BY public.nationalities.id;


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
-- Name: packages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.packages (
    id bigint DEFAULT nextval('public.packages_id_seq'::regclass) NOT NULL,
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
-- Name: packages_addons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.packages_addons (
    id bigint DEFAULT nextval('public.packages_addons_id_seq'::regclass) NOT NULL,
    package_id bigint NOT NULL,
    title character varying(255) NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.packages_addons OWNER TO postgres;

--
-- Name: parent_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parent_categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    name_ar character varying(255) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    icon character varying(255),
    sort_order integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.parent_categories OWNER TO postgres;

--
-- Name: parent_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.parent_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parent_categories_id_seq OWNER TO postgres;

--
-- Name: parent_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parent_categories_id_seq OWNED BY public.parent_categories.id;


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
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id bigint DEFAULT nextval('public.permissions_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- Name: plan_durations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plan_durations (
    id bigint NOT NULL,
    pricing_plan_id bigint NOT NULL,
    duration character varying(255) NOT NULL,
    price character varying(255) NOT NULL,
    status character varying(255) DEFAULT '1'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT plan_durations_status_check CHECK (((status)::text = ANY ((ARRAY['0'::character varying, '1'::character varying])::text[])))
);


ALTER TABLE public.plan_durations OWNER TO postgres;

--
-- Name: plan_durations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plan_durations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plan_durations_id_seq OWNER TO postgres;

--
-- Name: plan_durations_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plan_durations_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plan_durations_id_seq1 OWNER TO postgres;

--
-- Name: plan_durations_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plan_durations_id_seq1 OWNED BY public.plan_durations.id;


--
-- Name: popular_ads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.popular_ads (
    id bigint NOT NULL,
    ad_id bigint NOT NULL,
    category_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.popular_ads OWNER TO postgres;

--
-- Name: popular_ads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.popular_ads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.popular_ads_id_seq OWNER TO postgres;

--
-- Name: popular_ads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.popular_ads_id_seq OWNED BY public.popular_ads.id;


--
-- Name: pricing_plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pricing_plans (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    name_ar character varying(255) NOT NULL,
    duration character varying(255) NOT NULL,
    price character varying(255) NOT NULL,
    currency character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    description_ar character varying(255) NOT NULL,
    status character varying(255) DEFAULT '1'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT pricing_plans_status_check CHECK (((status)::text = ANY ((ARRAY['0'::character varying, '1'::character varying])::text[])))
);


ALTER TABLE public.pricing_plans OWNER TO postgres;

--
-- Name: pricing_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pricing_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pricing_plans_id_seq OWNER TO postgres;

--
-- Name: pricing_plans_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pricing_plans_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pricing_plans_id_seq1 OWNER TO postgres;

--
-- Name: pricing_plans_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pricing_plans_id_seq1 OWNED BY public.pricing_plans.id;


--
-- Name: promo_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promo_codes (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    value integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    total_limit integer,
    user_limit integer DEFAULT 0 NOT NULL,
    daily_limit integer DEFAULT 0 NOT NULL,
    status character varying(255) DEFAULT '1'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT promo_codes_status_check CHECK (((status)::text = ANY ((ARRAY['0'::character varying, '1'::character varying])::text[]))),
    CONSTRAINT promo_codes_type_check CHECK (((type)::text = ANY ((ARRAY['percentage'::character varying, 'fixed'::character varying])::text[])))
);


ALTER TABLE public.promo_codes OWNER TO postgres;

--
-- Name: promo_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promo_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promo_codes_id_seq OWNER TO postgres;

--
-- Name: promo_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promo_codes_id_seq OWNED BY public.promo_codes.id;


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
-- Name: quotes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quotes (
    id bigint DEFAULT nextval('public.quotes_id_seq'::regclass) NOT NULL,
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
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id bigint DEFAULT nextval('public.reviews_id_seq'::regclass) NOT NULL,
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
-- Name: role_has_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_has_permissions OWNER TO postgres;

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
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint DEFAULT nextval('public.roles_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: service_atributes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_atributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_atributes_id_seq OWNER TO postgres;

--
-- Name: service_atributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_atributes (
    id bigint DEFAULT nextval('public.service_atributes_id_seq'::regclass) NOT NULL,
    service_id integer NOT NULL,
    name character varying(255) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.service_atributes OWNER TO postgres;

--
-- Name: service_atributes_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_atributes_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_atributes_value_id_seq OWNER TO postgres;

--
-- Name: service_atributes_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_atributes_value (
    id bigint DEFAULT nextval('public.service_atributes_value_id_seq'::regclass) NOT NULL,
    service_id integer NOT NULL,
    attribute_id integer NOT NULL,
    name character varying(255) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    price numeric(10,2) DEFAULT '0'::numeric NOT NULL
);


ALTER TABLE public.service_atributes_value OWNER TO postgres;

--
-- Name: service_booking_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_booking_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_booking_fields_id_seq OWNER TO postgres;

--
-- Name: service_booking_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_booking_fields (
    id bigint DEFAULT nextval('public.service_booking_fields_id_seq'::regclass) NOT NULL,
    service_id bigint NOT NULL,
    type character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    options text,
    attribute_id bigint,
    file_types character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    field_id bigint
);


ALTER TABLE public.service_booking_fields OWNER TO postgres;

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
-- Name: service_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_details (
    id bigint DEFAULT nextval('public.service_details_id_seq'::regclass) NOT NULL,
    service_id bigint NOT NULL,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.service_details OWNER TO postgres;

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
-- Name: service_faqs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_faqs (
    id bigint DEFAULT nextval('public.service_faqs_id_seq'::regclass) NOT NULL,
    service_id bigint NOT NULL,
    question character varying(255) NOT NULL,
    answer text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.service_faqs OWNER TO postgres;

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
-- Name: service_pricing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_pricing (
    id bigint DEFAULT nextval('public.service_pricing_id_seq'::regclass) NOT NULL,
    service_id bigint NOT NULL,
    translation_from bigint,
    translation_to bigint,
    price numeric(10,2),
    status character varying(255) DEFAULT '1'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT service_pricing_status_check CHECK (((status)::text = ANY (ARRAY[('0'::character varying)::text, ('1'::character varying)::text])))
);


ALTER TABLE public.service_pricing OWNER TO postgres;

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
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id bigint DEFAULT nextval('public.services_id_seq'::regclass) NOT NULL,
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
    CONSTRAINT services_status_check CHECK (((status)::text = ANY (ARRAY[('0'::character varying)::text, ('1'::character varying)::text])))
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: services_bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_bookings_id_seq OWNER TO postgres;

--
-- Name: services_bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services_bookings (
    id bigint DEFAULT nextval('public.services_bookings_id_seq'::regclass) NOT NULL,
    service_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    booking_id character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    company_name character varying(255),
    country character varying(255),
    street_address character varying(255),
    apartment character varying(255),
    city character varying(255),
    state character varying(255),
    phone character varying(255),
    email character varying(255),
    file_namesconfirm character varying(255),
    order_notes text,
    total numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    status character varying(255) DEFAULT 'Pending'::character varying NOT NULL,
    CONSTRAINT services_bookings_status_check CHECK (((status)::text = ANY (ARRAY[('Pending'::character varying)::text, ('Under Process'::character varying)::text, ('Completed'::character varying)::text, ('Ready for Delivery'::character varying)::text])))
);


ALTER TABLE public.services_bookings OWNER TO postgres;

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
-- Name: services_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services_types (
    id bigint DEFAULT nextval('public.services_types_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    status character varying(255) DEFAULT '1'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT services_types_status_check CHECK (((status)::text = ANY (ARRAY[('0'::character varying)::text, ('1'::character varying)::text])))
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
-- Name: site_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site_settings (
    id bigint DEFAULT nextval('public.site_settings_id_seq'::regclass) NOT NULL,
    key character varying(255) NOT NULL,
    value text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.site_settings OWNER TO postgres;

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
-- Name: slider_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.slider_items (
    id bigint NOT NULL,
    slider_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(255) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.slider_items OWNER TO postgres;

--
-- Name: slider_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.slider_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slider_items_id_seq OWNER TO postgres;

--
-- Name: slider_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.slider_items_id_seq OWNED BY public.slider_items.id;


--
-- Name: sliders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sliders (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    parent_category_id bigint NOT NULL,
    category_id bigint NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
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
-- Name: sliders_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sliders_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sliders_id_seq1 OWNER TO postgres;

--
-- Name: sliders_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sliders_id_seq1 OWNED BY public.sliders.id;


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
-- Name: target_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.target_types (
    id bigint DEFAULT nextval('public.target_types_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.target_types OWNER TO postgres;

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
-- Name: target_types_company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.target_types_company (
    id bigint DEFAULT nextval('public.target_types_company_id_seq'::regclass) NOT NULL,
    company_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.target_types_company OWNER TO postgres;

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
-- Name: translation_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.translation_types (
    id bigint DEFAULT nextval('public.translation_types_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    price_type character varying(255) DEFAULT 'free'::character varying NOT NULL,
    price numeric(10,2) DEFAULT '0'::numeric,
    percentage numeric(5,2) DEFAULT '0'::numeric,
    category character varying(255),
    status character varying(255) DEFAULT '1'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT translation_types_price_type_check CHECK (((price_type)::text = ANY (ARRAY[('free'::character varying)::text, ('rush_fee'::character varying)::text, ('fixed'::character varying)::text]))),
    CONSTRAINT translation_types_status_check CHECK (((status)::text = ANY (ARRAY[('0'::character varying)::text, ('1'::character varying)::text])))
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
-- Name: translation_types_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.translation_types_categories (
    id bigint DEFAULT nextval('public.translation_types_categories_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    status character varying(255) DEFAULT '1'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    description text,
    price_type character varying(255) DEFAULT 'free'::character varying NOT NULL,
    price numeric(10,2) DEFAULT '0'::numeric,
    percentage numeric(5,2) DEFAULT '0'::numeric,
    CONSTRAINT translation_types_categories_price_type_check CHECK (((price_type)::text = ANY (ARRAY[('free'::character varying)::text, ('rush_fee'::character varying)::text, ('fixed'::character varying)::text]))),
    CONSTRAINT translation_types_categories_status_check CHECK (((status)::text = ANY (ARRAY[('0'::character varying)::text, ('1'::character varying)::text])))
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
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint DEFAULT nextval('public.users_id_seq'::regclass) NOT NULL,
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
    gender character varying(255),
    country character varying(255),
    profile_image character varying(255),
    dob date,
    is_verified integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: verification_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.verification_requests (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    remarks text,
    status character varying(255) DEFAULT 'pending'::character varying NOT NULL,
    licence_file character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT verification_requests_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'approved'::character varying, 'rejected'::character varying])::text[])))
);


ALTER TABLE public.verification_requests OWNER TO postgres;

--
-- Name: verification_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.verification_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.verification_requests_id_seq OWNER TO postgres;

--
-- Name: verification_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.verification_requests_id_seq OWNED BY public.verification_requests.id;


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
-- Name: why_choose_us; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.why_choose_us (
    id bigint DEFAULT nextval('public.why_choose_us_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    content text NOT NULL,
    image character varying(255),
    status boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.why_choose_us OWNER TO postgres;

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
-- Name: work_process; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.work_process (
    id bigint DEFAULT nextval('public.work_process_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    content text,
    image character varying(255),
    status boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.work_process OWNER TO postgres;

--
-- Name: badges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.badges ALTER COLUMN id SET DEFAULT nextval('public.badges_id_seq'::regclass);


--
-- Name: banners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banners ALTER COLUMN id SET DEFAULT nextval('public.banners_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: home_element_ads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_element_ads ALTER COLUMN id SET DEFAULT nextval('public.home_element_ads_id_seq'::regclass);


--
-- Name: home_elements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_elements ALTER COLUMN id SET DEFAULT nextval('public.home_elements_id_seq'::regclass);


--
-- Name: looking_ads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.looking_ads ALTER COLUMN id SET DEFAULT nextval('public.looking_ads_id_seq'::regclass);


--
-- Name: nationalities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nationalities ALTER COLUMN id SET DEFAULT nextval('public.nationalities_id_seq'::regclass);


--
-- Name: parent_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parent_categories ALTER COLUMN id SET DEFAULT nextval('public.parent_categories_id_seq'::regclass);


--
-- Name: plan_durations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan_durations ALTER COLUMN id SET DEFAULT nextval('public.plan_durations_id_seq1'::regclass);


--
-- Name: popular_ads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.popular_ads ALTER COLUMN id SET DEFAULT nextval('public.popular_ads_id_seq'::regclass);


--
-- Name: pricing_plans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pricing_plans ALTER COLUMN id SET DEFAULT nextval('public.pricing_plans_id_seq1'::regclass);


--
-- Name: promo_codes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo_codes ALTER COLUMN id SET DEFAULT nextval('public.promo_codes_id_seq'::regclass);


--
-- Name: slider_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slider_items ALTER COLUMN id SET DEFAULT nextval('public.slider_items_id_seq'::regclass);


--
-- Name: sliders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sliders ALTER COLUMN id SET DEFAULT nextval('public.sliders_id_seq1'::regclass);


--
-- Name: verification_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification_requests ALTER COLUMN id SET DEFAULT nextval('public.verification_requests_id_seq'::regclass);


--
-- Data for Name: ad_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ad_fields (id, ad_id, field_id, field_label, value, field_label_ar, value_ar, created_at, updated_at) FROM stdin;
1	4	61	Ads Title	Car for sale	عنوان الإعلانات	سيارة للبيع	\N	\N
5	4	62	Moke & Model	13	الوضع والنموذج	13	\N	\N
6	4	63	Regional Specs	4	المواصفات الإقليمية	4	\N	\N
7	4	64	Year	5	سنة	5	\N	\N
8	4	65	Kilometers	20000	كيلومترات	20000	\N	\N
9	4	66	Body Type	7	نوع الجسم	7	\N	\N
10	4	67	Is your car insured in Syria	9	هل سيارتك مؤمنة في سوريا؟	9	\N	\N
11	4	68	Price	6000	سعر	6000	\N	\N
12	4	69	Phone Number	0511234567	رقم التليفون	0511234567	\N	\N
13	4	70	images	uploads/images.jpeg,uploads/toyota-supra.webp	الصور	image.png	\N	\N
\.


--
-- Data for Name: ad_plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ad_plans (id, pricing_plan_id, ad_id, name, duration, price, currency, tax, created_at, updated_at) FROM stdin;
1	1	4	Free	30	0	SYP	0	\N	\N
\.


--
-- Data for Name: ads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ads (id, ad_number, user_id, category_id, city_id, status, total_amount, created_at, updated_at, is_featured) FROM stdin;
4	#AD-000001	35	5	1	Payment Pending	0	2025-03-19 17:18:40	2025-03-25 04:33:47	0
\.


--
-- Data for Name: badges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.badges (id, name, name_ar, description, description_ar, icon, status, created_at, updated_at, deleted_at) FROM stdin;
1	Get a verified badge yet?	هل حصلت على شارة تم التحقق منها حتى الآن؟	Get more visibility\r\nEnhance your credibility!	احصل على مزيد من الظهور\r\nعزز مصداقيتك	AWnW7MP9ZQJX22vsiiICcEe8QtOncUCRta0fJkgS.png	1	2025-03-26 06:11:32	2025-03-26 06:11:32	\N
\.


--
-- Data for Name: banners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banners (id, name, parent_category_id, category_id, image, status, created_at, updated_at, deleted_at, ad_id) FROM stdin;
1	Car Banner	1	5	MTgHjZLF7Vsp0uiy2nS6krPMBPuZkMAhlmegg4xi.png	1	2025-03-26 06:12:07	2025-03-26 06:12:07	\N	\N
2	Some Banner	1	5	foySzLnygF5xbqmrZm0DhSvE6GywmGK5BWVWjGw5.png	1	2025-03-27 04:44:01	2025-03-27 04:44:01	\N	\N
\.


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (id, booking_id, first_name, last_name, company_name, country, street_address, apartment, city, state, phone, email, deliver_to_different_address, order_notes, total_price, price_details, words_count, translation_type_price, service_id, recipient, zipcode, address, appartment, additional_info, full_name, full_email, translation_from, translation_to, total_pagestranslation, word_counttranslation, file_names, "inlineRadioOptions", addinfotextarea, created_at, updated_at, delivery_type, status, confirmfile_names, translation_type, delivery_method, delivery_method_price, delivery_type_price, vat_amount) FROM stdin;
1	taslI36pNqHr1nRw	Mollie	Ramirez	Maynard and Townsend Inc	portuguese	Eligendi debitis nec	Laboris saepe sint b	Delectus officiis a	Eu dicta repellendus	+1 (271) 497-6385	lozob@mailinator.com	t	Harum ullamco error	1440.00	[{"from":"English","to":"Hindi","price":1440}]	12	0.00	5	asdas	2312	adas	dsaad	asdasdasd	test	test@gmail.com	1	["4"]	12	12	1735331985676f109199e17.doc	yes	asdasdasd	2024-12-27 22:08:21	2024-12-27 22:08:21	\N	Pending	\N	\N	\N	0.00	0.00	\N
2	tasl5qegPsdSlHCH	Wing	Whitaker	Webster and Livingston Co	spanish	Quia impedit conseq	Cupiditate nulla eni	Ab aliquam ad occaec	Quia cumque commodo	+1 (913) 992-8828	vasysidyzo@mailinator.com	f	Et asperiores quia e	1440.00	[{"from":"English","to":"Hindi","price":1440}]	12	0.00	5	asdas	2312	adas	dsaad	asdasdasd	test	test@gmail.com	1	["4"]	12	12	1735331985676f109199e17.doc	yes	asdasdasd	2024-12-27 22:17:15	2024-12-27 22:17:15	\N	Pending	\N	\N	\N	0.00	0.00	\N
3	taslBlMRWtGsZKYb	Wing	Whitaker	Webster and Livingston Co	spanish	Quia impedit conseq	Cupiditate nulla eni	Ab aliquam ad occaec	Quia cumque commodo	+1 (913) 992-8828	vasysidyzo@mailinator.com	f	Et asperiores quia e	1440.00	[{"from":"English","to":"Hindi","price":1440}]	12	0.00	5	asdas	2312	adas	dsaad	asdasdasd	test	test@gmail.com	1	["4"]	12	12	1735331985676f109199e17.doc	yes	asdasdasd	2024-12-27 22:17:58	2024-12-30 12:01:33	\N	Under Process	\N	\N	\N	0.00	0.00	\N
4	tasloFylx2unbomg	Wing	Whitaker	Webster and Livingston Co	spanish	Quia impedit conseq	Cupiditate nulla eni	Ab aliquam ad occaec	Quia cumque commodo	+1 (913) 992-8828	vasysidyzo@mailinator.com	f	Et asperiores quia e	1440.00	[{"from":"English","to":"Hindi","price":1440}]	12	0.00	5	asdas	2312	adas	dsaad	asdasdasd	test	test@gmail.com	1	["4"]	12	12	1735331985676f109199e17.doc	yes	asdasdasd	2024-12-27 22:18:23	2024-12-30 11:39:07	\N	Ready for Delivery	\N	\N	\N	0.00	0.00	\N
5	tasltDqbHcpZWmdc	Reagan	Malone	Keith and Mendez Co	arabic	Dolor dolore neque e	Perspiciatis magna	Deserunt consequatur	Inventore molestias	+1 (747) 437-9291	dihalemuve@mailinator.com	f	Tenetur omnis sint e	1440.00	[{"from":"English","to":"Hindi","price":1440}]	12	0.00	5	asdas	2312	adas	dsaad	asdasdasd	test	test@gmail.com	1	["4"]	12	12	1735331985676f109199e17.doc	yes	asdasdasd	2024-12-27 22:20:04	2024-12-30 12:02:24	\N	Ready for Delivery	\N	\N	\N	0.00	0.00	\N
6	#TS590262215	Angela	Franco	Herman Vasquez Trading	UAE1	Dolor nobis voluptat	Enim quae ullamco pa	Nisi quidem autem to	Ut amet velit aut	+1 (553) 184-1752	sopih@mailinator.com	t	Nihil doloribus vel	12000.00	[{"from":"English","to":"Hindi","price":12000}]	100	0.00	5	Sed id inventore dol	83779	In sequi sit rem ven	Enim sunt et dolor s	sadasdas	test	test@gmail.com	1	["4"]	12	100	1735373492676fb2b4bedb8.doc,1735373511676fb2c750ebd.pdf	yes	sadasdas	2024-12-28 08:12:31	2024-12-30 11:24:13	\N	Ready for Delivery	\N	\N	\N	0.00	0.00	\N
7	#TS887226235	Linda	Montgomery	Mullins and Davenport Co	UAE1	Soluta obcaecati eum	Dolores quae deserun	Magna ut ad enim nec	Iste eu labore lorem	+1 (676) 936-3872	lesa@mailinator.com	f	Nulla ut vel quisqua	12000.00	[{"from":"English","to":"Hindi","price":12000}]	100	0.00	5	Ut illum aliqua Do	39770	Similique laborum et	Sunt incididunt accu	sadasda	test	test@gmail.com	1	["4"]	12	100	1735374821676fb7e52fd21.doc	yes	sadasda	2024-12-28 08:34:17	2024-12-30 11:21:50	\N	Under Process	\N	\N	\N	0.00	0.00	\N
8	#TS765295191	Phoebe	Stewart	Clark Byers Traders	Cole Moon	Quibusdam accusantiu	Saepe omnis sapiente	Ex neque quia ration	Atque modi veniam f	+1 (596) 621-6162	gose@mailinator.com	t	Eligendi dolore odit	132000.00	[{"from":"English","to":"Hindi","price":120000},{"from":"English","to":"Arabic1","price":12000}]	1000	0.00	5	Vitae non dicta aspe	79313	Officiis alias qui f	Doloremque earum vol	asdadasdas	test	test@gmail.com	1	["4","5"]	10	1000	1735376658676fbf12da90a.pdf,1735376663676fbf17c0ea2.doc	yes	asdadasdas	2024-12-28 09:05:18	2024-12-28 15:37:26	\N	Under Process	\N	\N	\N	0.00	0.00	\N
9	#TS252816621	Herman	Nash	Aguirre and Dixon Plc	Maskat	Tempora sed quia sin	Irure beatae aut dol	Ut dolor neque amet	Eos irure facilis e	+1 (845) 326-6792	mawi@mailinator.com	f	Beatae nesciunt rep	14400.00	[{"from":"English","to":"Hindi","price":14400}]	120	0.00	5	Mollit occaecat quo	98420	Nobis vitae vel quis	Et et vel dolorum nu	sadasdas	test	test@gmail.com	1	["4"]	12	120	173555264067726e808a2d4.pdf	yes	sadasdas	2024-12-30 09:57:44	2024-12-30 10:52:54	\N	Ready for Delivery	\N	\N	\N	0.00	0.00	\N
10	#TS791786095	Ivory	Patton	Obrien and Leon Co	Maskat	In quis ut ut ducimu	Nisi et id voluptate	Reprehenderit porro	Officia minus beatae	+1 (675) 887-7292	metugid@mailinator.com	f	Ut quaerat voluptas	12000.00	[{"from":"English","to":"Hindi","price":12000}]	100	0.00	5	Ducimus quo itaque	15498	Maxime labore debiti	Dolorem aut excepteu	asdasdad	Uriel Willis	joqeja@mailinator.com	1	["4"]	12	100	17356357786773b342831a0.pdf	yes	asdasdad	2024-12-31 09:11:46	2024-12-31 09:11:46	\N	Pending	\N	\N	\N	0.00	0.00	\N
11	#TS104832976	Yael	Hoover	Hyde and Townsend Plc	Canada	Dolor laboriosam au	Pariatur Totam id v	Necessitatibus debit	Culpa iste quibusda	+1 (832) 836-6017	kenameh@mailinator.com	f	Ipsa incididunt nos	12000.00	[{"from":"English","to":"Hindi","price":12000}]	100	0.00	5	Tempore esse ipsa	80239	Tempor sint possimu	Sit voluptatum culp	sdasd	Wylie Kline	cijytif@mailinator.com	1	["4"]	10	100	17356367136773b6e9cf8da.pdf	yes	sdasd	2024-12-31 09:19:06	2024-12-31 09:19:06	\N	Pending	\N	\N	\N	0.00	0.00	\N
12	#TS210980678	Driscoll	Collier	Collier and Velasquez Inc	UAE1	Quo quia veniam per	Labore et quas nulla	Incidunt hic suscip	Modi ipsum perferend	+1 (467) 972-1346	firu@mailinator.com	t	Commodi a exercitati	14412.00	[{"from":"English","to":"Hindi","price":14400}]	120	0.00	5	asdad	2323	adads	asdas	sdadads	Orlando Wade	nepejo@mailinator.com	1	["4"]	12	120	17356680256774313910bf7.pdf	yes	sdadads	2024-12-31 18:08:57	2024-12-31 18:08:57	DIGITAL & PHYSICAL COPY	Pending	\N	\N	\N	0.00	0.00	\N
13	#TS715256215	Ronan	Mcmahon	Gomez Boyer Inc	Maskat	Autem consequatur r	Tenetur quia tempor	Eum quas quaerat qui	Expedita suscipit cu	+1 (828) 647-8394	jypokoceky@mailinator.com	f	Aliquid et sunt et o	14412.00	[{"from":"English","to":"Hindi","price":14400}]	120	0.00	5	asdad	2323	adads	asdas	sdadads	Orlando Wade	nepejo@mailinator.com	1	["4"]	12	120	17356680256774313910bf7.pdf	yes	sdadads	2024-12-31 18:09:03	2024-12-31 18:09:03	DIGITAL & PHYSICAL COPY	Pending	\N	\N	\N	0.00	0.00	\N
14	#TS576096700	Alea	Johnston	Rios Duke Plc	Canada	Totam voluptas dolor	Voluptatum sint quis	Et odio animi velit	In reprehenderit ess	+1 (833) 268-8845	jopekap@mailinator.com	f	Qui nobis consequat	14400.00	[{"from":"English","to":"Hindi","price":14400}]	120	0.00	5	Nesciunt nobis repr	53949	Omnis minus vitae ma	Exercitation ex aliq	asdadas	Kiara Best	favokumigi@mailinator.com	1	["4"]	12	120	173567040467743a8417a32.pdf	yes	asdadas	2024-12-31 18:42:51	2024-12-31 18:42:51	Karly Pennington	Pending	\N	CERTIFIED	STANDARD	0.00	0.00	\N
15	#TS942903861	Otto	Frederick	Serrano and Wiggins Co	UAE1	Dolorum beatae incid	Sint fugit autem cu	Aut velit assumenda	Asperiores nulla qui	+1 (869) 895-3478	qofemov@mailinator.com	f	Possimus ut dolore	1440.00	[{"from":"English","to":"Arabic1","price":1440}]	120	0.00	5	Qui fugiat tenetur	12939	Eos eaque aut tempor	Magnam consequatur d	sdasdas	Jameson Coffey	mibip@mailinator.com	1	["5"]	12	120	173574229667755358bc49a.pdf	yes	sdasdas	2025-01-01 14:38:45	2025-01-01 14:38:45	Ciara Hull	Pending	17357423216775537113fe6.pdf	CERTIFIED	STANDARD	0.00	0.00	\N
16	#TS914462411	Brody	Simpson	Pitts and Roy Associates	Canada	In rerum non duis re	Tempore qui dolorib	Tempore incidunt a	Ex nisi dolore elige	+1 (944) 577-2294	jywik@mailinator.com	f	Consectetur ratione	2412.00	[{"from":"English","to":"Arabic1","price":2400}]	200	0.00	5	Quis deleniti minima	99099	Deserunt voluptas si	Sed voluptas accusam	asdasdasd	Cain Jacobs	bugu@mailinator.com	1	["5"]	12	200	17357435336775582d4eb5e.pdf	yes	asdasdasd	2025-01-01 15:00:13	2025-01-01 15:00:13	DIGITAL & PHYSICAL COPY	Pending	17357436106775587a0cc24.pdf	CERTIFIED	EXPEDITED	0.00	0.00	\N
17	#TS595444421	Keith	Sexton	Pearson Skinner Plc	Canada	Qui ut aperiam tempo	Praesentium eum vita	Do culpa totam liber	Autem atque nostrum	+1 (918) 282-5262	xofemahuv@mailinator.com	f	Laborum Est delenit	59.01	[{"from":"English","to":"Arabic1","price":24}]	2	25.00	5	Nostrud maxime liber	55860	In ut aut sed fugiat	Enim id explicabo F	asdasd	Joshua Dyer	vuxis@mailinator.com	1	["5"]	12	2	17357622996775a17bc0990.pdf	yes	asdasd	2025-01-01 20:12:03	2025-01-01 20:12:03	DIGITAL DELIVERY	Pending	\N	NOTARIZED	EXPEDITED	0.00	0.00	\N
18	#TS639969622	Herman	Hunter	Simmons and Morales LLC	Canada	Culpa sunt voluptas	Est et et dolore ea	Eligendi magnam repr	Sed tempora amet ex	+1 (998) 524-8918	buzisicoqi@mailinator.com	f	Nihil placeat nisi	12.60	[{"from":"English","to":"Arabic1","price":12}]	1	0.00	5	Dolorem incididunt e	43033	Pariatur Animi acc	Officia itaque commo	asdas	Alfreda David	kiki@mailinator.com	1	["5"]	1	1	17357636816775a6e19de0e.pdf	yes	asdas	2025-01-01 20:41:16	2025-02-11 13:25:10	DIGITAL DELIVERY	Under Process	17357637096775a6fd985ea.pdf	ONLY TRANSLATION	STANDARD	0.00	0.00	0.60
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
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, name_ar, description, description_ar, status, parent_id, created_at, updated_at) FROM stdin;
5	Cars	سيارات	This is category of cars.	هذه هي فئة السيارات.	1	1	2025-03-18 05:38:01	2025-03-20 15:04:03
2	2 BD Apartment	2 BD Apartment	2 BD Apartment	2 BD Apartment	1	2	2025-03-20 08:02:34	2025-03-20 15:04:13
\.


--
-- Data for Name: category_atributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category_atributes (id, category_id, name, name_ar, status, created_at, updated_at, deleted_at) FROM stdin;
1	5	Make & Model	يصنع	1	2025-03-18 05:44:13	2025-03-18 11:17:07	\N
2	5	Regional Specs	المواصفات الإقليمية	1	2025-03-18 11:24:06	2025-03-18 11:24:06	\N
3	5	Year	سنة	1	2025-03-18 11:24:45	2025-03-18 11:24:45	\N
4	5	Body Type	نوع الجسم	1	2025-03-18 11:25:27	2025-03-18 11:25:27	\N
5	5	Insurance	تأمين	1	2025-03-18 11:26:47	2025-03-18 11:26:47	\N
6	5	Fuel Type	نوع الوقود	1	2025-03-18 11:28:06	2025-03-20 08:09:34	\N
7	5	Exterior Color	اللون الخارجي	1	2025-03-20 08:41:06	2025-03-20 08:41:06	\N
8	2	Property Type	Property Type	1	2025-03-20 09:33:07	2025-03-20 09:33:07	\N
9	2	Housing Category	Housing Category	1	2025-03-20 09:37:22	2025-03-20 09:37:22	\N
10	2	Is it furnished?	Is it furnished?	1	2025-03-20 09:43:55	2025-03-20 09:43:55	\N
11	2	Facilities	Facilities	1	2025-03-20 09:49:54	2025-03-20 09:49:54	\N
13	5	sdfs	sdfd	1	2025-03-25 04:18:03	2025-03-25 04:18:03	\N
\.


--
-- Data for Name: category_atributes_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category_atributes_value (id, category_id, attribute_id, name, name_ar, status, created_at, updated_at, deleted_at) FROM stdin;
1	5	1	Honda Civic X Turbo RS 1.5	هوندا سيفيك X توربو RS 1.5	1	2025-03-18 05:51:53	2025-03-18 11:19:53	\N
2	5	1	Toyota Corolla Altis 1.8 Grande	تويوتا كورولا ألتيس 1.8 غراندي	1	2025-03-18 11:18:57	2025-03-18 11:18:57	\N
3	5	2	GCC Specs	GCC Specs	1	2025-03-18 11:28:56	2025-03-18 11:28:56	\N
4	5	2	Tropical Specs	المواصفات الاستوائية	1	2025-03-18 11:29:32	2025-03-18 11:29:32	\N
5	5	3	2025	2025	1	2025-03-18 11:30:13	2025-03-18 11:30:13	\N
6	5	3	2024	2024	1	2025-03-18 11:30:36	2025-03-18 11:30:36	\N
7	5	4	Sedan	سيدان	1	2025-03-18 11:31:10	2025-03-18 11:31:10	\N
8	5	4	SUV	سيارات الدفع الرباعي	1	2025-03-18 11:31:37	2025-03-18 11:31:37	\N
9	5	5	Yes	نعم	1	2025-03-18 11:32:28	2025-03-18 11:32:28	\N
10	5	5	No	لا	1	2025-03-18 11:32:59	2025-03-18 11:32:59	\N
11	5	6	Petrol	بنزين	1	2025-03-18 11:34:39	2025-03-18 11:34:39	\N
12	5	6	Diesel	ديزل	1	2025-03-18 11:35:21	2025-03-18 11:35:21	\N
13	5	1	Toyota Supra	تويوتا سوبرا	1	2025-03-19 15:06:31	2025-03-19 15:06:31	\N
14	2	8	Residential	Residential	1	2025-03-20 10:42:01	2025-03-20 10:42:01	\N
15	2	8	Commercial	Commercial	1	2025-03-20 10:57:32	2025-03-20 10:57:32	\N
16	2	9	Villa	Villa	1	2025-03-20 10:57:52	2025-03-20 10:57:52	\N
17	2	9	Apartment	Apartment	1	2025-03-20 10:58:14	2025-03-20 10:58:14	\N
18	2	9	Staff Accommodation	Staff Accommodation	1	2025-03-20 10:59:12	2025-03-20 10:59:12	\N
19	2	10	Furnished	Furnished	1	2025-03-20 11:00:06	2025-03-20 11:00:06	\N
20	2	10	Unfurnished	Unfurnished	1	2025-03-20 11:00:28	2025-03-20 11:00:28	\N
21	2	11	Maids Room	Maids Room	1	2025-03-20 11:00:54	2025-03-20 11:00:54	\N
22	2	11	Private Pool	Private Pool	1	2025-03-20 11:01:19	2025-03-20 11:01:19	\N
23	2	11	Balcony	Balcony	1	2025-03-20 11:01:40	2025-03-20 11:01:40	\N
24	2	11	Private Garden	Private Garden	1	2025-03-20 11:02:00	2025-03-20 11:02:00	\N
25	5	1	Aston Martin DB9	Aston Martin DB9	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
26	5	1	Aston Martin Vantage	Aston Martin Vantage	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
27	5	1	Audi A1	Audi A1	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
28	5	1	Audi A3	Audi A3	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
29	5	1	Audi A5	Audi A5	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
30	5	1	Audi A6	Audi A6	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
31	5	1	Audi A7	Audi A7	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
32	5	1	Audi A8	Audi A8	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
33	5	1	Audi Audi TT	Audi Audi TT	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
34	5	1	Audi Q3	Audi Q3	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
35	5	1	Audi Q5	Audi Q5	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
36	5	1	Audi Q7	Audi Q7	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
37	5	1	Audi R8	Audi R8	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
38	5	1	Audi RS4	Audi RS4	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
39	5	1	Audi RS5	Audi RS5	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
40	5	1	Audi RS6	Audi RS6	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
41	5	1	Audi RS7	Audi RS7	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
42	5	1	Audi S3	Audi S3	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
43	5	1	Audi S5	Audi S5	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
44	5	1	Audi S6	Audi S6	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
45	5	1	Audi S7	Audi S7	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
46	5	1	Audi S8	Audi S8	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
47	5	1	Bentley Arnage	Bentley Arnage	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
48	5	1	Bentley Continental	Bentley Continental	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
49	5	1	Bentley Continental GT	Bentley Continental GT	1	2025-04-07 15:01:42	2025-04-07 15:01:42	\N
50	5	1	Bentley Continental GTC	Bentley Continental GTC	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
51	5	1	Bentley Flying Spur	Bentley Flying Spur	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
52	5	1	Bentley Mulsanne	Bentley Mulsanne	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
53	5	1	BMW 1-Series	BMW 1-Series	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
54	5	1	BMW 2-Series	BMW 2-Series	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
55	5	1	Alfa Romeo 146	Alfa Romeo 146	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
56	5	1	Alfa Romeo 147	Alfa Romeo 147	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
57	5	1	Alfa Romeo 156	Alfa Romeo 156	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
58	5	1	Alfa Romeo 166	Alfa Romeo 166	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
59	5	1	Alfa Romeo 33	Alfa Romeo 33	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
60	5	1	Alfa Romeo 4C	Alfa Romeo 4C	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
61	5	1	Alfa Romeo 8C Competizione	Alfa Romeo 8C Competizione	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
62	5	1	Alfa Romeo 8C Competizione Coupe	Alfa Romeo 8C Competizione Coupe	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
63	5	1	Alfa Romeo 8C Spider	Alfa Romeo 8C Spider	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
64	5	1	Alfa Romeo 90	Alfa Romeo 90	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
65	5	1	Baic A1	Baic A1	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
66	5	1	Audi A2	Audi A2	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
67	5	1	Audi A3 E-Tron	Audi A3 E-Tron	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
68	5	1	Audi A4 All Road Quattro	Audi A4 All Road Quattro	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
69	5	1	Audi A4 All Road Quattro	Audi A4 All Road Quattro	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
70	5	1	Baic A5	Baic A5	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
71	5	1	Audi A6 All Road Quattro	Audi A6 All Road Quattro	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
72	5	1	Bentley Azure	Bentley Azure	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
73	5	1	Alpina B10	Alpina B10	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
74	5	1	Alpina B3	Alpina B3	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
75	5	1	Alpina B3 (2007)	Alpina B3 (2007)	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
76	5	1	Alpina B3 (2013)	Alpina B3 (2013)	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
77	5	1	Alpina B4	Alpina B4	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
78	5	1	Alpina B5	Alpina B5	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
79	5	1	Alpina B5 (2010)	Alpina B5 (2010)	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
80	5	1	Alpina B6	Alpina B6	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
81	5	1	Alpina B6 (2012)	Alpina B6 (2012)	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
82	5	1	Alpina B7	Alpina B7	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
83	5	1	Alpina B7 (2009)	Alpina B7 (2009)	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
84	5	1	Alfa Romeo Brera	Alfa Romeo Brera	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
85	5	1	Bentley Brooklands	Bentley Brooklands	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
86	5	1	Bentley Continental Flying Spur	Bentley Continental Flying Spur	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
87	5	1	Bentley Continental Super Sports	Bentley Continental Super Sports	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
88	5	1	Alpina D10	Alpina D10	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
89	5	1	Aston Martin Cygnet	Aston Martin Cygnet	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
90	5	1	Alpina D3	Alpina D3	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
91	5	1	Alpina D3 (2013)	Alpina D3 (2013)	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
92	5	1	Alpina D4	Alpina D4	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
93	5	1	Alpina D5	Alpina D5	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
94	5	1	Aston Martin DB7	Aston Martin DB7	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
95	5	1	Aston Martin DBS	Aston Martin DBS	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
96	5	1	Ashok Falcon	Ashok Falcon	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
97	5	1	Artega GT	Artega GT	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
98	5	1	Alfa Romeo GT	Alfa Romeo GT	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
99	5	1	Alfa Romeo GTV	Alfa Romeo GTV	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
100	5	1	Ashok Leyland	Ashok Leyland	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
101	5	1	Alfa Romeo Mito	Alfa Romeo Mito	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
102	5	1	Bentley New Continental GT	Bentley New Continental GT	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
103	5	1	Bentley New Continental GTC	Bentley New Continental GTC	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
104	5	1	Aston Martin ONE-77	Aston Martin ONE-77	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
105	5	1	Alpina Roadster	Alpina Roadster	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
106	5	1	Alpina Roadster S	Alpina Roadster S	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
107	5	1	Audi RS3	Audi RS3	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
108	5	1	Audi RS8	Audi RS8	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
109	5	1	Audi S4	Audi S4	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
110	5	1	Alfa Romeo Spider	Alfa Romeo Spider	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
111	5	1	Audi TT	Audi TT	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
112	5	1	Audi TTS	Audi TTS	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
113	5	1	Bentley Turbo	Bentley Turbo	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
114	5	1	Aston Martin V12 Vantage	Aston Martin V12 Vantage	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
115	5	1	Aston Martin V8 Vantage	Aston Martin V8 Vantage	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
116	5	1	Aston Martin Virage	Aston Martin Virage	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
117	5	1	Alpina XD3	Alpina XD3	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
118	5	1	Aston Martin Zagato	Aston Martin Zagato	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
119	5	1	Aston Martin Rapide	Aston Martin Rapide	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
120	5	1	Aston Martin Vanquish	Aston Martin Vanquish	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
121	5	1	BMW 3-Series	BMW 3-Series	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
122	5	1	BMW 4-Series	BMW 4-Series	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
123	5	1	BMW 5-Series	BMW 5-Series	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
124	5	1	BMW 6-Series	BMW 6-Series	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
125	5	1	BMW 7-Series	BMW 7-Series	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
126	5	1	BMW M2	BMW M2	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
127	5	1	BMW M3	BMW M3	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
128	5	1	BMW M4	BMW M4	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
129	5	1	BMW M5	BMW M5	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
130	5	1	BMW M6	BMW M6	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
131	5	1	BMW X 4	BMW X 4	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
132	5	1	BMW X1	BMW X1	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
133	5	1	BMW X3	BMW X3	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
134	5	1	BMW X4	BMW X4	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
135	5	1	BMW X5	BMW X5	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
136	5	1	BMW X5 M	BMW X5 M	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
137	5	1	BMW X6	BMW X6	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
138	5	1	BMW X6 M	BMW X6 M	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
139	5	1	Cadillac ATS	Cadillac ATS	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
140	5	1	Cadillac ATS-V	Cadillac ATS-V	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
141	5	1	Cadillac CTS	Cadillac CTS	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
142	5	1	Cadillac CTS-V	Cadillac CTS-V	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
143	5	1	Cadillac Escalade	Cadillac Escalade	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
144	5	1	Cadillac XTS	Cadillac XTS	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
145	5	1	Chevrolet Camaro	Chevrolet Camaro	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
146	5	1	Chevrolet Caprice	Chevrolet Caprice	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
147	5	1	Chevrolet Captiva	Chevrolet Captiva	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
148	5	1	BMW 2er Gran Tourer	BMW 2er Gran Tourer	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
149	5	1	BMW 3er GT	BMW 3er GT	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
150	5	1	BMW 5er GT	BMW 5er GT	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
151	5	1	Cadillac 62	Cadillac 62	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
152	5	1	BMW 8-Series	BMW 8-Series	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
153	5	1	Chery A11 WindCloud	Chery A11 WindCloud	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
154	5	1	Chery Arrizo 7	Chery Arrizo 7	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
155	5	1	Chevrolet Astro	Chevrolet Astro	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
156	5	1	Chevrolet Avalanche	Chevrolet Avalanche	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
157	5	1	Chevrolet Aveo	Chevrolet Aveo	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
158	5	1	Chevrolet Aveo5	Chevrolet Aveo5	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
159	5	1	Chevrolet Barina	Chevrolet Barina	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
160	5	1	Chevrolet Blazer	Chevrolet Blazer	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
161	5	1	Cadillac BLS	Cadillac BLS	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
162	5	1	Brilliance BS4	Brilliance BS4	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
163	5	1	Brilliance BS6	Brilliance BS6	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
164	5	1	Chevrolet Caravan	Chevrolet Caravan	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
165	5	1	Cadillac Catera	Cadillac Catera	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
166	5	1	Chevrolet Cavalier	Chevrolet Cavalier	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
167	5	1	Buick Century	Buick Century	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
168	5	1	Caterham Classic 7	Caterham Classic 7	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
169	5	1	Changan CS35	Changan CS35	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
170	5	1	Changan CS75	Changan CS75	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
171	5	1	Cadillac Deville	Cadillac Deville	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
172	5	1	Cadillac DTS	Cadillac DTS	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
173	5	1	Chery E5	Chery E5	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
174	5	1	Chery E8	Chery E8	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
175	5	1	Changan EADO	Changan EADO	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
176	5	1	Cadillac Eldorado	Cadillac Eldorado	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
177	5	1	Buick Enclave	Buick Enclave	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
178	5	1	Cadillac ESV	Cadillac ESV	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
179	5	1	BYD F3	BYD F3	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
180	5	1	BYD F3-AT	BYD F3-AT	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
181	5	1	BYD F3R	BYD F3R	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
182	5	1	BYD F6	BYD F6	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
183	5	1	Brilliance FSV	Brilliance FSV	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
184	5	1	Brilliance FRV Cross	Brilliance FRV Cross	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
185	5	1	Brilliance FRV	Brilliance FRV	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
186	5	1	Bugatti Grand Sport	Bugatti Grand Sport	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
187	5	1	Brilliance H530	Brilliance H530	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
188	5	1	BMW I3	BMW I3	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
189	5	1	BMW I8	BMW I8	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
190	5	1	Brilliance Jinbei Hammer Head	Brilliance Jinbei Hammer Head	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
191	5	1	Buick Lacrosse	Buick Lacrosse	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
192	5	1	Buick Lesabre	Buick Lesabre	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
193	5	1	Buick Park Avenue	Buick Park Avenue	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
194	5	1	Buick Rainier	Buick Rainier	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
195	5	1	Buick Regal	Buick Regal	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
196	5	1	Chery S11 QQ	Chery S11 QQ	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
197	5	1	BYD S6	BYD S6	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
198	5	1	Caterham Seven	Caterham Seven	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
199	5	1	Cadillac Seville	Cadillac Seville	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
200	5	1	Cadillac SLS	Cadillac SLS	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
201	5	1	Caterham Super 7	Caterham Super 7	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
202	5	1	Cadillac STS	Cadillac STS	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
203	5	1	Cadillac STS-V	Cadillac STS-V	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
204	5	1	Buick Super-Series	Buick Super-Series	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
205	5	1	Bugatti Super Sport	Bugatti Super Sport	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
206	5	1	Chery T11 Tiggo	Chery T11 Tiggo	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
207	5	1	Chery Tiggo 5	Chery Tiggo 5	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
208	5	1	Chery Tiggo	Chery Tiggo	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
209	5	1	Brilliance V5	Brilliance V5	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
210	5	1	Chery V5 Crossover	Chery V5 Crossover	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
211	5	1	Bugatti Veyron	Bugatti Veyron	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
212	5	1	Bugatti Vitesse	Bugatti Vitesse	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
213	5	1	Cadillac XLR	Cadillac XLR	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
214	5	1	Cadillac XLR-V	Cadillac XLR-V	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
215	5	1	BMW Z3	BMW Z3	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
216	5	1	BMW Z4	BMW Z4	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
217	5	1	BMW Z8	BMW Z8	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
218	5	1	Chevrolet Corvette	Chevrolet Corvette	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
219	5	1	Chevrolet Cruze	Chevrolet Cruze	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
220	5	1	Chevrolet Impala	Chevrolet Impala	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
221	5	1	Chevrolet Malibu	Chevrolet Malibu	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
222	5	1	Chevrolet Silverado	Chevrolet Silverado	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
223	5	1	Chevrolet Sonic	Chevrolet Sonic	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
224	5	1	Chevrolet Spark	Chevrolet Spark	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
225	5	1	Chevrolet Suburban	Chevrolet Suburban	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
226	5	1	Chevrolet Tahoe	Chevrolet Tahoe	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
227	5	1	Chevrolet Traverse	Chevrolet Traverse	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
228	5	1	Chevrolet Trax	Chevrolet Trax	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
229	5	1	Chrysler 200	Chrysler 200	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
230	5	1	Chrysler 200C	Chrysler 200C	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
231	5	1	Chrysler 300C	Chrysler 300C	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
232	5	1	Chrysler 300M	Chrysler 300M	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
387	5	1	Ferrari LA	Ferrari LA	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
233	5	1	Chrysler 300 M	Chrysler 300 M	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
234	5	1	Chrysler Aspen	Chrysler Aspen	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
235	5	1	Chrysler Avenger	Chrysler Avenger	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
236	5	1	Citroen AX	Citroen AX	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
237	5	1	Citroen Axel	Citroen Axel	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
238	5	1	Citroen Berlingo PKW	Citroen Berlingo PKW	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
239	5	1	Citroen Berlingo	Citroen Berlingo	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
240	5	1	Citroen C1	Citroen C1	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
241	5	1	Citroen C2	Citroen C2	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
242	5	1	Citroen C3	Citroen C3	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
243	5	1	Citroen C3 Picasso	Citroen C3 Picasso	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
244	5	1	Citroen C4	Citroen C4	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
245	5	1	Citroen C4 AirCross	Citroen C4 AirCross	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
246	5	1	Citroen C4 Cactus	Citroen C4 Cactus	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
247	5	1	Citroen C4 Picasso	Citroen C4 Picasso	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
248	5	1	Citroen C5	Citroen C5	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
249	5	1	Citroen C6	Citroen C6	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
250	5	1	Citroen C-Crosser	Citroen C-Crosser	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
251	5	1	China Automobile CEO	China Automobile CEO	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
252	5	1	Citroen C-Elysee	Citroen C-Elysee	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
253	5	1	Chrysler Centura	Chrysler Centura	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
254	5	1	Chrysler Charger	Chrysler Charger	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
255	5	1	Chevrolet Chevy	Chevrolet Chevy	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
256	5	1	Chevrolet Cobalt	Chevrolet Cobalt	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
257	5	1	Chevrolet Colorado	Chevrolet Colorado	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
258	5	1	Chrysler Concorde	Chrysler Concorde	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
259	5	1	Chrysler Cordoba	Chrysler Cordoba	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
260	5	1	Chrysler Crossfire	Chrysler Crossfire	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
261	5	1	Chevrolet CSV	Chevrolet CSV	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
262	5	1	Citroen C-Zero	Citroen C-Zero	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
263	5	1	Dacia Dokker	Dacia Dokker	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
264	5	1	Citroen DS3	Citroen DS3	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
265	5	1	Citroen DS4	Citroen DS4	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
266	5	1	Citroen DS5	Citroen DS5	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
267	5	1	Chevrolet Elcamino	Chevrolet Elcamino	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
268	5	1	Chevrolet Epica	Chevrolet Epica	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
269	5	1	Chevrolet Equinox	Chevrolet Equinox	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
270	5	1	Chevrolet Evanda	Chevrolet Evanda	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
271	5	1	Chevrolet Explorer	Chevrolet Explorer	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
272	5	1	Chevrolet Express	Chevrolet Express	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
273	5	1	Chrysler Grand Voyager	Chrysler Grand Voyager	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
274	5	1	Chevrolet HHR	Chevrolet HHR	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
275	5	1	Chrysler Intrepid	Chrysler Intrepid	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
276	5	1	Chevrolet Kalos	Chevrolet Kalos	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
277	5	1	Chevrolet Lacetti	Chevrolet Lacetti	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
278	5	1	Chrysler Lebaron	Chrysler Lebaron	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
279	5	1	Chrysler LHS	Chrysler LHS	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
280	5	1	Dacia Lodgy	Dacia Lodgy	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
281	5	1	Chevrolet Lumina	Chevrolet Lumina	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
282	5	1	Chevrolet Matiz	Chevrolet Matiz	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
283	5	1	Citroen Nemo PKW	Citroen Nemo PKW	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
284	5	1	Chrysler Neon	Chrysler Neon	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
285	5	1	Chrysler Newport	Chrysler Newport	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
286	5	1	Chevrolet Nubira	Chevrolet Nubira	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
287	5	1	Chevrolet Optra	Chevrolet Optra	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
288	5	1	Chevrolet Orlando	Chevrolet Orlando	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
289	5	1	Chrysler Pacifica	Chrysler Pacifica	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
290	5	1	Citroen Picasso	Citroen Picasso	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
291	5	1	Chrysler Pick Up	Chrysler Pick Up	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
292	5	1	Chevrolet Pick Up	Chevrolet Pick Up	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
293	5	1	Citroen Pluriel	Citroen Pluriel	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
294	5	1	Chrysler Prowler	Chrysler Prowler	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
295	5	1	Chrysler PT Cruiser	Chrysler PT Cruiser	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
296	5	1	Chevrolet Rezzo	Chevrolet Rezzo	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
297	5	1	Citroen Saxo	Citroen Saxo	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
298	5	1	Chrysler Sebring	Chrysler Sebring	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
299	5	1	Chevrolet SSR	Chevrolet SSR	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
300	5	1	Chrysler Stratus	Chrysler Stratus	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
301	5	1	Chevrolet Terrain	Chevrolet Terrain	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
302	5	1	Chrysler Town	Chrysler Town	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
303	5	1	Chevrolet Tracker	Chevrolet Tracker	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
304	5	1	Chevrolet Trans Sport	Chevrolet Trans Sport	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
305	5	1	Chevrolet T-Series	Chevrolet T-Series	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
306	5	1	China Automobile UFO	China Automobile UFO	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
307	5	1	Chevrolet Uplander	Chevrolet Uplander	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
469	5	1	Ford Megastar	Ford Megastar	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
308	5	1	Chevrolet Venture	Chevrolet Venture	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
309	5	1	CMC Veryca	CMC Veryca	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
310	5	1	Chevrolet Volt	Chevrolet Volt	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
311	5	1	Chrysler Voyager	Chrysler Voyager	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
312	5	1	Citroen Xsara	Citroen Xsara	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
313	5	1	Citroen Xsara Picasso	Citroen Xsara Picasso	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
314	5	1	CMC Z7	CMC Z7	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
315	5	1	Daihatsu Materia	Daihatsu Materia	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
316	5	1	Daihatsu Sirion	Daihatsu Sirion	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
317	5	1	Daihatsu Terios	Daihatsu Terios	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
318	5	1	Dodge Challenger	Dodge Challenger	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
319	5	1	Dodge Charger	Dodge Charger	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
320	5	1	Dodge Durango	Dodge Durango	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
321	5	1	Ferrari 488	Ferrari 488	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
322	5	1	Fiat 500	Fiat 500	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
323	5	1	Ferrari 126	Ferrari 126	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
324	5	1	Fiat 127	Fiat 127	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
325	5	1	Fiat 131	Fiat 131	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
326	5	1	Fiat 132	Fiat 132	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
327	5	1	Fiat 133	Fiat 133	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
328	5	1	Fiat 1400	Fiat 1400	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
329	5	1	Ferrari 206	Ferrari 206	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
330	5	1	Ferrari 306	Ferrari 306	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
331	5	1	Ferrari 308	Ferrari 308	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
332	5	1	Ferrari 355	Ferrari 355	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
333	5	1	Ferrari 360	Ferrari 360	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
334	5	1	Ferrari 360 Modena F1	Ferrari 360 Modena F1	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
335	5	1	Ferrari 430	Ferrari 430	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
336	5	1	Ferrari 456	Ferrari 456	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
337	5	1	Ferrari 458	Ferrari 458	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
338	5	1	Fiat 500L	Fiat 500L	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
339	5	1	Ferrari 512	Ferrari 512	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
340	5	1	Ferrari 550 Barchetta	Ferrari 550 Barchetta	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
341	5	1	Ferrari 550 Maranello	Ferrari 550 Maranello	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
342	5	1	Ferrari 575	Ferrari 575	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
343	5	1	Ferrari 575M	Ferrari 575M	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
344	5	1	Ferrari 599	Ferrari 599	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
345	5	1	Ferrari 599 GTB	Ferrari 599 GTB	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
346	5	1	Ferrari 612	Ferrari 612	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
347	5	1	Fiat Abarth	Fiat Abarth	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
348	5	1	Daihatsu Applause	Daihatsu Applause	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
349	5	1	Dodge Avenger	Dodge Avenger	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
350	5	1	Fiat Barchrtta	Fiat Barchrtta	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
351	5	1	Fiat Brava	Fiat Brava	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
352	5	1	Fiat Bravo	Fiat Bravo	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
353	5	1	Dodge Caliber	Dodge Caliber	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
354	5	1	Ferrari California	Ferrari California	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
355	5	1	Ferrari California T	Ferrari California T	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
356	5	1	Dodge Caravan	Dodge Caravan	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
357	5	1	Daihatsu Charade	Daihatsu Charade	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
358	5	1	Daewoo Cielo	Daewoo Cielo	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
359	5	1	Daihatsu Copen	Daihatsu Copen	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
360	5	1	Fiat Croma	Fiat Croma	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
361	5	1	Eicher Cruiser	Eicher Cruiser	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
362	5	1	Daihatsu Cuore	Daihatsu Cuore	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
363	5	1	Dodge Dakota	Dodge Dakota	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
364	5	1	Dodge Dart	Dodge Dart	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
365	5	1	Daihatsu Deluxe	Daihatsu Deluxe	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
366	5	1	Fiat Doblo	Fiat Doblo	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
367	5	1	Fiat Doblo Neu	Fiat Doblo Neu	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
368	5	1	Fiat Ducato	Fiat Ducato	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
369	5	1	Fiat Duna	Fiat Duna	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
370	5	1	Ferrari Enzo	Ferrari Enzo	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
371	5	1	Daewoo Espero	Daewoo Espero	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
372	5	1	Daewoo Evanda	Daewoo Evanda	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
373	5	1	Ferrari F12	Ferrari F12	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
374	5	1	Ferrari F40	Ferrari F40	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
375	5	1	Ferrari F430	Ferrari F430	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
376	5	1	Ferrari F50	Ferrari F50	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
377	5	1	Ferrari F575M F1	Ferrari F575M F1	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
378	5	1	Ferrari F575 SuperAmerica	Ferrari F575 SuperAmerica	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
379	5	1	Ferrari FF	Ferrari FF	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
380	5	1	Fiat Fiorino	Fiat Fiorino	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
381	5	1	Fiat Grande Punto	Fiat Grande Punto	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
382	5	1	Daihatsu Gran Max	Daihatsu Gran Max	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
383	5	1	Ferrari GTO	Ferrari GTO	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
384	5	1	Dongfeng H30 Cross	Dongfeng H30 Cross	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
385	5	1	Dodge Journey	Dodge Journey	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
386	5	1	Daewoo Kalos	Daewoo Kalos	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
388	5	1	Daewoo Lacetti	Daewoo Lacetti	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
389	5	1	Daewoo Lanos	Daewoo Lanos	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
390	5	1	Dodge Laramie	Dodge Laramie	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
391	5	1	Daewoo Leganza	Daewoo Leganza	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
392	5	1	Dacia Logan	Dacia Logan	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
393	5	1	Dacia Logan MCV	Dacia Logan MCV	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
394	5	1	Dodge Magnum	Dodge Magnum	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
395	5	1	Daewoo Matiz	Daewoo Matiz	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
396	5	1	Daihatsu Mira	Daihatsu Mira	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
397	5	1	Daewoo Musso	Daewoo Musso	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
398	5	1	Dodge Neon	Dodge Neon	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
399	5	1	Daewoo Nova	Daewoo Nova	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
400	5	1	Daewoo Nubira	Daewoo Nubira	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
401	5	1	Daewoo Racer	Daewoo Racer	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
402	5	1	Dodge Ram	Dodge Ram	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
403	5	1	Daewoo Rexton	Daewoo Rexton	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
404	5	1	Daewoo Rezzo	Daewoo Rezzo	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
405	5	1	Daihatsu Rocky	Daihatsu Rocky	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
406	5	1	Dongfeng S30	Dongfeng S30	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
407	5	1	Dacia Sandero	Dacia Sandero	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
408	5	1	Ferrari SuperAmerica	Ferrari SuperAmerica	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
409	5	1	Daewoo Tacuma	Daewoo Tacuma	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
410	5	1	Daihatsu Trevis	Daihatsu Trevis	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
411	5	1	Dodge Viper	Dodge Viper	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
412	5	1	Daihatsu YRV	Daihatsu YRV	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
413	5	1	Fiat LINEA	Fiat LINEA	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
414	5	1	Ford Eco Sport	Ford Eco Sport	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
415	5	1	Ford Edge	Ford Edge	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
416	5	1	Ford Escape	Ford Escape	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
417	5	1	Ford Expedition	Ford Expedition	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
418	5	1	Ford Explorer	Ford Explorer	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
419	5	1	Ford F150	Ford F150	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
420	5	1	Ford Fiesta	Ford Fiesta	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
421	5	1	Ford Figo	Ford Figo	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
422	5	1	Ford Flex	Ford Flex	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
423	5	1	Ford Focus	Ford Focus	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
424	5	1	Ford Fusion	Ford Fusion	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
425	5	1	Ford Mustang	Ford Mustang	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
426	5	1	Ford Ranger	Ford Ranger	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
427	5	1	Ford Taurus	Ford Taurus	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
428	5	1	GMC Acadia	GMC Acadia	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
429	5	1	GMC Sierra 1500	GMC Sierra 1500	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
430	5	1	GMC Yukon	GMC Yukon	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
431	5	1	Ford B-Max	Ford B-Max	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
432	5	1	Ford Bronco	Ford Bronco	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
433	5	1	GMC Canyon	GMC Canyon	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
434	5	1	Geely CK	Geely CK	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
435	5	1	Ford C-Max	Ford C-Max	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
436	5	1	Ford Contour	Ford Contour	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
437	5	1	Ford Crown Victoria	Ford Crown Victoria	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
438	5	1	Great Wall Deer	Great Wall Deer	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
439	5	1	GMC Denali	GMC Denali	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
440	5	1	Geely Emgrand 8	Geely Emgrand 8	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
441	5	1	Geely Emgrand X7	Geely Emgrand X7	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
442	5	1	GMC Envoy	GMC Envoy	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
443	5	1	Ford Escort	Ford Escort	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
444	5	1	Ford Everest	Ford Everest	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
445	5	1	Ford Excursion	Ford Excursion	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
446	5	1	Ford Expedition EL	Ford Expedition EL	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
447	5	1	Ford Fairlane	Ford Fairlane	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
448	5	1	Ford Five Hundred	Ford Five Hundred	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
449	5	1	Ford Focus C-Max	Ford Focus C-Max	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
450	5	1	Ford Focus Electric	Ford Focus Electric	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
451	5	1	Ford Freestar	Ford Freestar	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
452	5	1	Ford F-Series	Ford F-Series	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
453	5	1	GAC GA3	GAC GA3	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
454	5	1	GAC GA5	GAC GA5	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
455	5	1	Ford Galaxy	Ford Galaxy	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
456	5	1	Geely GC2	Geely GC2	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
457	5	1	Geely GC6	Geely GC6	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
458	5	1	Geely GC7	Geely GC7	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
459	5	1	Ford Granada	Ford Granada	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
460	5	1	GAC GS5	GAC GS5	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
461	5	1	Geely GX2	Geely GX2	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
462	5	1	Fiat IDEA	Fiat IDEA	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
463	5	1	GMC Jimmy	GMC Jimmy	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
464	5	1	Ford KA	Ford KA	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
465	5	1	Fisker Karma	Fisker Karma	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
466	5	1	Ford Kuga	Ford Kuga	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
467	5	1	Fiat Marea	Fiat Marea	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
468	5	1	Ford Maverick	Ford Maverick	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
470	5	1	Ford Monarch	Ford Monarch	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
471	5	1	Ford Mondeo	Ford Mondeo	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
472	5	1	Fiat Multipla	Fiat Multipla	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
473	5	1	Ford Mustang GT	Ford Mustang GT	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
474	5	1	Ford Orion	Ford Orion	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
475	5	1	Fiat Other	Fiat Other	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
476	5	1	Fiat Palio	Fiat Palio	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
477	5	1	Fiat Panda	Fiat Panda	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
478	5	1	Ford PickUp	Ford PickUp	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
479	5	1	Ford Probe	Ford Probe	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
480	5	1	Fiat Punto	Fiat Punto	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
481	5	1	Fiat Punto Evo	Fiat Punto Evo	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
482	5	1	Fiat Qubo	Fiat Qubo	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
483	5	1	Fiat Regata	Fiat Regata	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
484	5	1	Fiat Ritmo	Fiat Ritmo	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
485	5	1	GMC Safari	GMC Safari	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
486	5	1	GMC Savana	GMC Savana	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
487	5	1	Fiat Sedici	Fiat Sedici	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
488	5	1	Fiat Seicento	Fiat Seicento	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
489	5	1	Fiat Siena	Fiat Siena	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
490	5	1	GMC Sierra	GMC Sierra	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
491	5	1	Ford Sierra	Ford Sierra	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
492	5	1	Ford S-Max	Ford S-Max	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
493	5	1	Fiat Stilo	Fiat Stilo	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
494	5	1	Ford Sport Trac	Ford Sport Trac	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
495	5	1	Ford Streetka	Ford Streetka	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
496	5	1	Foton SUP	Foton SUP	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
497	5	1	GMC Suburban	GMC Suburban	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
498	5	1	Ford Tempo	Ford Tempo	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
499	5	1	Fiat Tempra	Fiat Tempra	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
500	5	1	Ford Thunderbird	Ford Thunderbird	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
501	5	1	Ford Tourneo Connect	Ford Tourneo Connect	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
502	5	1	Ford Tourneo Courier	Ford Tourneo Courier	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
503	5	1	Ford Transit	Ford Transit	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
504	5	1	Foton Tunland	Foton Tunland	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
505	5	1	Fiat UNO	Fiat UNO	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
506	5	1	Foton View C1 Minibus	Foton View C1 Minibus	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
507	5	1	Ford Windstar	Ford Windstar	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
508	5	1	GMC Yukon Xl	GMC Yukon Xl	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
509	5	1	GMC Terrain	GMC Terrain	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
510	5	1	Honda Accord	Honda Accord	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
511	5	1	Honda CR-V	Honda CR-V	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
512	5	1	Honda Jazz	Honda Jazz	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
513	5	1	Honda Pilot	Honda Pilot	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
514	5	1	Hyundai Accent	Hyundai Accent	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
515	5	1	Hyundai Azera	Hyundai Azera	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
516	5	1	Hyundai Centennial	Hyundai Centennial	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
517	5	1	Hyundai Elantra	Hyundai Elantra	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
518	5	1	Hyundai Genesis	Hyundai Genesis	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
519	5	1	Hyundai Grand i10	Hyundai Grand i10	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
520	5	1	Hyundai Grand Santa Fe	Hyundai Grand Santa Fe	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
521	5	1	Hyundai i10	Hyundai i10	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
522	5	1	Hyundai i30	Hyundai i30	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
523	5	1	Hyundai i40	Hyundai i40	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
524	5	1	Hyundai Santa Fe	Hyundai Santa Fe	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
525	5	1	Hyundai Sonata	Hyundai Sonata	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
526	5	1	Hyundai Tucson	Hyundai Tucson	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
527	5	1	Infiniti FX35	Infiniti FX35	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
528	5	1	Infiniti FX37	Infiniti FX37	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
529	5	1	Infiniti FX50	Infiniti FX50	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
530	5	1	Infiniti G	Infiniti G	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
531	5	1	Infiniti Q30	Infiniti Q30	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
532	5	1	Infiniti Q50	Infiniti Q50	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
533	5	1	Infiniti Q60	Infiniti Q60	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
534	5	1	Infiniti Q70	Infiniti Q70	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
535	5	1	Infiniti QX50	Infiniti QX50	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
536	5	1	Infiniti QX56	Infiniti QX56	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
537	5	1	Infiniti QX60	Infiniti QX60	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
538	5	1	Infiniti QX70	Infiniti QX70	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
539	5	1	Infiniti QX80	Infiniti QX80	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
540	5	1	Hyundai Atos Prime	Hyundai Atos Prime	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
541	5	1	Honda City	Honda City	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
542	5	1	Honda Civic Hybrid	Honda Civic Hybrid	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
543	5	1	Honda Civic IMA	Honda Civic IMA	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
544	5	1	Hyundai County	Hyundai County	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
545	5	1	Hyundai Coupe	Hyundai Coupe	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
546	5	1	Honda CR-X	Honda CR-X	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
547	5	1	Hyundai Crete	Hyundai Crete	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
548	5	1	Honda CR-Z	Honda CR-Z	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
549	5	1	Honda Crosstour	Honda Crosstour	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
550	5	1	Honda Element	Honda Element	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
551	5	1	Infiniti EX	Infiniti EX	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
552	5	1	Infiniti EX35	Infiniti EX35	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
553	5	1	Hyundai Excel	Hyundai Excel	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
554	5	1	Great Wall Florid	Great Wall Florid	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
555	5	1	Honda FR-V	Honda FR-V	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
556	5	1	Infiniti FX	Infiniti FX	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
557	5	1	Infiniti FX45	Infiniti FX45	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
558	5	1	Infiniti G35	Infiniti G35	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
559	5	1	Infiniti G37	Infiniti G37	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
560	5	1	Hyundai Galloper	Hyundai Galloper	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
561	5	1	Hyundai Getz	Hyundai Getz	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
562	5	1	Hyundai Grandeur	Hyundai Grandeur	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
563	5	1	Infiniti G-Series	Infiniti G-Series	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
564	5	1	Hummer H1	Hummer H1	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
565	5	1	Hummer H2	Hummer H2	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
566	5	1	Hummer H3	Hummer H3	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
567	5	1	Hummer H3T	Hummer H3T	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
568	5	1	Hummer HX	Hummer HX	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
569	5	1	Honda HRV	Honda HRV	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
570	5	1	Hyundai i20	Hyundai i20	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
571	5	1	Infiniti i30	Infiniti i30	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
572	5	1	Infiniti i35	Infiniti i35	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
573	5	1	Honda Insight	Honda Insight	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
574	5	1	Hyundai iX20	Hyundai iX20	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
575	5	1	Hyundai iX35	Hyundai iX35	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
576	5	1	Hyundai iX55	Hyundai iX55	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
577	5	1	Infiniti J30	Infiniti J30	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
578	5	1	Infiniti JX	Infiniti JX	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
579	5	1	Honda Legend	Honda Legend	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
580	5	1	Infiniti M	Infiniti M	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
581	5	1	Hyundai Matrix	Hyundai Matrix	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
582	5	1	Honda MR-V	Honda MR-V	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
583	5	1	Honda NSX	Honda NSX	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
584	5	1	Honda Odyssey	Honda Odyssey	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
585	5	1	Honda Passport	Honda Passport	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
586	5	1	Hyundai Pony	Hyundai Pony	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
587	5	1	Honda Prelude	Honda Prelude	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
588	5	1	Infiniti Q45	Infiniti Q45	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
589	5	1	Infiniti QX35	Infiniti QX35	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
590	5	1	Infiniti QX4	Infiniti QX4	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
591	5	1	Honda Ridgeline	Honda Ridgeline	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
592	5	1	Honda S2000	Honda S2000	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
593	5	1	Honda Stream	Honda Stream	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
594	5	1	Honda S500	Honda S500	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
595	5	1	Hyundai Terracan	Hyundai Terracan	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
596	5	1	Hyundai Tiburon	Hyundai Tiburon	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
597	5	1	Hyundai Trajet	Hyundai Trajet	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
598	5	1	Hyundai Veloster	Hyundai Veloster	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
599	5	1	Hyundai Veracruz	Hyundai Veracruz	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
600	5	1	Hyundai Verna	Hyundai Verna	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
601	5	1	Honda Vezel	Honda Vezel	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
602	5	1	Honda Vigor	Honda Vigor	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
603	5	1	Great Wall Wingle	Great Wall Wingle	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
604	5	1	Infiniti X35	Infiniti X35	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
605	5	1	Hyundai XG 30	Hyundai XG 30	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
606	5	1	Hyundai XG300	Hyundai XG300	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
607	5	1	Hyundai XG350	Hyundai XG350	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
608	5	1	Honda Z	Honda Z	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
609	5	1	Jaguar F-Type	Jaguar F-Type	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
610	5	1	Jaguar S-Type	Jaguar S-Type	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
611	5	1	Jaguar XE	Jaguar XE	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
612	5	1	Jaguar XF	Jaguar XF	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
613	5	1	Jaguar XJ	Jaguar XJ	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
614	5	1	Jeep Cherokee	Jeep Cherokee	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
615	5	1	Jeep Compass	Jeep Compass	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
616	5	1	Jeep Grand Cherokee	Jeep Grand Cherokee	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
617	5	1	Jeep Renegade	Jeep Renegade	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
618	5	1	Jeep Wrangler	Jeep Wrangler	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
619	5	1	Kia Candenza	Kia Candenza	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
620	5	1	Kia Carens	Kia Carens	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
621	5	1	Kia Carnival	Kia Carnival	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
622	5	1	Kia Cerato	Kia Cerato	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
623	5	1	Kia Clarus	Kia Clarus	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
624	5	1	Kia Mohave	Kia Mohave	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
625	5	1	Kia Optima	Kia Optima	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
626	5	1	Kia Picanto	Kia Picanto	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
627	5	1	Kia Quoris	Kia Quoris	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
628	5	1	Kia Rio	Kia Rio	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
629	5	1	Kia Sorento	Kia Sorento	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
630	5	1	Kia Soul	Kia Soul	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
631	5	1	Lada 111	Lada 111	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
632	5	1	Lada 1117	Lada 1117	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
633	5	1	Lada 1118	Lada 1118	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
634	5	1	Lada 1119	Lada 1119	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
635	5	1	Lada 112	Lada 112	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
636	5	1	Lamborghini 350	Lamborghini 350	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
637	5	1	Koenigsegg Agera	Koenigsegg Agera	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
638	5	1	Isuzu Amigo	Isuzu Amigo	1	2025-04-07 15:01:43	2025-04-07 15:01:43	\N
639	5	1	Isuzu Ascender	Isuzu Ascender	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
640	5	1	Lamborghini Aventador	Lamborghini Aventador	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
641	5	1	Isuzu Axiom	Isuzu Axiom	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
642	5	1	Kia Borrego	Kia Borrego	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
643	5	1	Kia Carnival II	Kia Carnival II	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
644	5	1	Koenigsegg CCX	Koenigsegg CCX	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
645	5	1	Kia Ceed	Kia Ceed	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
646	5	1	Jeep Commanche	Jeep Commanche	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
647	5	1	Jeep Commander	Jeep Commander	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
648	5	1	Lamborghini Countach	Lamborghini Countach	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
649	5	1	Iveco Daily	Iveco Daily	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
650	5	1	Isuzu D-Max	Isuzu D-Max	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
651	5	1	Kia Forte	Kia Forte	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
652	5	1	Jaguar F-Pace	Jaguar F-Pace	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
653	5	1	Jeep Grand Wagoneer	Jeep Grand Wagoneer	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
654	5	1	Lada Granta	Lada Granta	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
655	5	1	Jinbei H2	Jinbei H2	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
656	5	1	Isuzu i Mark	Isuzu i Mark	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
657	5	1	Isuzu Impulse	Isuzu Impulse	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
658	5	1	JAC J5	JAC J5	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
659	5	1	JAC J4	JAC J4	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
660	5	1	JAC J6	JAC J6	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
661	5	1	Lada Kalina II	Lada Kalina II	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
662	5	1	Kia Koup	Kia Koup	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
663	5	1	JAC LCV	JAC LCV	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
664	5	1	JAC M1	JAC M1	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
665	5	1	JAC M5	JAC M5	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
666	5	1	Kia Magentis	Kia Magentis	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
667	5	1	Iveco Massif	Iveco Massif	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
668	5	1	King Long Mini Van	King Long Mini Van	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
669	5	1	International  MXT	International  MXT	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
670	5	1	Lada Niva	Lada Niva	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
671	5	1	Isuzu NPR	Isuzu NPR	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
672	5	1	Isuzu Oasis	Isuzu Oasis	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
673	5	1	Kia Opirus	Kia Opirus	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
674	5	1	Jeep Patriot	Jeep Patriot	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
675	5	1	Lada Priora	Lada Priora	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
676	5	1	Kia Pride	Kia Pride	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
677	5	1	Isuzu Reward-NP	Isuzu Reward-NP	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
678	5	1	Isuzu Revert-NP	Isuzu Revert-NP	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
679	5	1	Isuzu Rodeo	Isuzu Rodeo	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
680	5	1	Jeep Rubicon	Jeep Rubicon	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
681	5	1	JAC S3	JAC S3	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
682	5	1	Kia Sephia	Kia Sephia	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
683	5	1	Kia Shuma II	Kia Shuma II	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
684	5	1	Kia Soul EV	Kia Soul EV	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
685	5	1	Jaguar Sovereign	Jaguar Sovereign	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
686	5	1	Kia Spectra	Kia Spectra	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
687	5	1	Isuzu Stylus	Isuzu Stylus	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
688	5	1	Kia Sportage	Kia Sportage	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
689	5	1	Jinbei SY6483	Jinbei SY6483	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
690	5	1	Lada Taiga	Lada Taiga	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
691	5	1	Isuzu Trooper	Isuzu Trooper	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
692	5	1	Kia Venga	Kia Venga	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
693	5	1	Jeep Wagoneer	Jeep Wagoneer	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
694	5	1	Jeep Wrangler Unlimited	Jeep Wrangler Unlimited	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
695	5	1	KTM X-BOW	KTM X-BOW	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
696	5	1	Jaguar XFR	Jaguar XFR	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
697	5	1	Jaguar XFR-S	Jaguar XFR-S	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
698	5	1	Jaguar XF-Type	Jaguar XF-Type	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
699	5	1	Jaguar XJR	Jaguar XJR	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
700	5	1	Jaguar XJ-Type	Jaguar XJ-Type	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
701	5	1	Jaguar XK	Jaguar XK	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
702	5	1	Jaguar XKR	Jaguar XKR	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
703	5	1	Jaguar XKR-S	Jaguar XKR-S	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
704	5	1	Jaguar XK-Type	Jaguar XK-Type	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
705	5	1	Jaguar X - Type	Jaguar X - Type	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
706	5	1	Jaguar X-Type	Jaguar X-Type	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
707	5	1	Land Rover Range Rover	Land Rover Range Rover	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
708	5	1	Land Rover Range Rover Evoque	Land Rover Range Rover Evoque	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
709	5	1	Land Rover Range Rover Sport	Land Rover Range Rover Sport	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
710	5	1	Lexus ES	Lexus ES	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
711	5	1	Lexus IS	Lexus IS	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
712	5	1	Lexus LS	Lexus LS	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
713	5	1	Lexus LX	Lexus LX	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
714	5	1	Lexus RX	Lexus RX	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
715	5	1	Lincoln Continential	Lincoln Continential	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
716	5	1	Lincoln MKC	Lincoln MKC	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
717	5	1	Lincoln MKX	Lincoln MKX	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
718	5	1	Lincoln MKZ	Lincoln MKZ	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
719	5	1	Lincoln Navigator	Lincoln Navigator	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
720	5	1	Maserati Granturismo	Maserati Granturismo	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
721	5	1	Maserati Quattroporte	Maserati Quattroporte	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
722	5	1	Mazda 2	Mazda 2	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
723	5	1	Mazda 3	Mazda 3	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
724	5	1	Mazda 6	Mazda 6	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
725	5	1	Mazda CX-3	Mazda CX-3	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
726	5	1	Mazda CX-5	Mazda CX-5	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
727	5	1	Mazda CX-9	Mazda CX-9	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
728	5	1	Maybach 57	Maybach 57	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
729	5	1	Maybach 62	Maybach 62	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
730	5	1	Mazda 626	Mazda 626	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
731	5	1	Mazda 6 Ultra	Mazda 6 Ultra	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
732	5	1	Luxgen 7	Luxgen 7	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
733	5	1	Mazda 929	Mazda 929	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
734	5	1	Mahindra Armada	Mahindra Armada	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
735	5	1	Lincoln Avaitor	Lincoln Avaitor	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
736	5	1	Mazda B-Series	Mazda B-Series	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
737	5	1	Mazda BT-50	Mazda BT-50	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
738	5	1	Maserati Coupe	Maserati Coupe	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
739	5	1	Maserati Coupe / Spyder	Maserati Coupe / Spyder	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
740	5	1	Lexus CT	Lexus CT	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
741	5	1	Lexus CT 200H	Lexus CT 200H	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
742	5	1	Landwind CV-9	Landwind CV-9	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
743	5	1	Mazda CX-7	Mazda CX-7	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
744	5	1	Land Rover Defender	Land Rover Defender	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
745	5	1	Lancia Delta	Lancia Delta	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
746	5	1	Mazda Demio	Mazda Demio	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
747	5	1	Lamborghini Diablo	Lamborghini Diablo	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
748	5	1	Land Rover Discovery Sport	Land Rover Discovery Sport	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
749	5	1	Mazda E2000	Mazda E2000	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
750	5	1	Lotus Elan	Lotus Elan	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
751	5	1	Lotus Elise	Lotus Elise	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
752	5	1	Lotus Esprit	Lotus Esprit	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
753	5	1	Lotus Europa	Lotus Europa	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
754	5	1	Lotus Evora	Lotus Evora	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
755	5	1	Lotus Exige	Lotus Exige	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
756	5	1	Lancia Flavia	Lancia Flavia	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
757	5	1	Land Rover Freelander	Land Rover Freelander	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
758	5	1	Land Rover Freelander V6	Land Rover Freelander V6	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
759	5	1	Lancia FX-Series	Lancia FX-Series	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
760	5	1	Lamborghini Gallardo	Lamborghini Gallardo	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
761	5	1	Maserati Grancabrio	Maserati Grancabrio	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
762	5	1	Maserati Ghibli	Maserati Ghibli	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
763	5	1	Maserati Gransport	Maserati Gransport	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
764	5	1	Lexus GS	Lexus GS	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
765	5	1	Lamborghini Huracan	Lamborghini Huracan	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
766	5	1	Land Rover HSE V8	Land Rover HSE V8	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
767	5	1	Lexus IS-C	Lexus IS-C	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
768	5	1	Lexus IS-F	Lexus IS-F	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
769	5	1	Lexus LFA	Lexus LFA	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
770	5	1	Lamborghini LM	Lamborghini LM	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
771	5	1	Land Rover LR2	Land Rover LR2	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
772	5	1	Land Rover LR3	Land Rover LR3	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
773	5	1	Land Rover LR4	Land Rover LR4	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
774	5	1	Lancia Lybra	Lancia Lybra	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
775	5	1	Lincoln LS	Lincoln LS	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
776	5	1	Maserati MC12	Maserati MC12	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
777	5	1	Mazda Miata	Mazda Miata	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
778	5	1	Lamborghini Miura	Lamborghini Miura	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
779	5	1	Lincoln MKS	Lincoln MKS	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
780	5	1	Lincoln MKT	Lincoln MKT	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
781	5	1	Lincoln MK-T	Lincoln MK-T	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
782	5	1	Lamborghini Murcielago	Lamborghini Murcielago	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
783	5	1	Mazda MPV	Mazda MPV	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
784	5	1	Lancia Musa	Lancia Musa	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
785	5	1	Mazda MX-3	Mazda MX-3	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
786	5	1	Mazda MX-5	Mazda MX-5	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
787	5	1	Mazda MX-6	Mazda MX-6	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
788	5	1	Mazda Navajo	Mazda Navajo	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
789	5	1	Lexus NX	Lexus NX	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
790	5	1	Lancia Phedra	Lancia Phedra	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
791	5	1	Mazda Premacy	Mazda Premacy	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
792	5	1	Lexus RC	Lexus RC	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
793	5	1	Lexus RC F	Lexus RC F	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
794	5	1	Landwind S	Landwind S	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
795	5	1	Luxgen S5	Luxgen S5	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
796	5	1	Lexus SC	Lexus SC	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
797	5	1	Mahindra Scorpio	Mahindra Scorpio	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
798	5	1	Maserati Spyder	Maserati Spyder	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
799	5	1	Lancia Thema	Lancia Thema	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
800	5	1	Lancia Thesis	Lancia Thesis	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
801	5	1	Lincoln Town Car	Lincoln Town Car	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
802	5	1	Luxgen U6	Luxgen U6	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
803	5	1	Lancia Voyager	Lancia Voyager	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
804	5	1	Lancia Y	Lancia Y	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
805	5	1	Mercedes-Benz C 63 AMG	Mercedes-Benz C 63 AMG	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
806	5	1	Mercedes-Benz C-Class	Mercedes-Benz C-Class	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
807	5	1	Mercedes-Benz E 63 AMG	Mercedes-Benz E 63 AMG	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
808	5	1	Mercedes-Benz E-Class	Mercedes-Benz E-Class	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
809	5	1	Mercedes-Benz G-Class	Mercedes-Benz G-Class	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
810	5	1	Mercedes-Benz GL-Class	Mercedes-Benz GL-Class	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
811	5	1	Mercedes-Benz ML 63 AMG	Mercedes-Benz ML 63 AMG	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
812	5	1	Mercedes-Benz S 63 AMG	Mercedes-Benz S 63 AMG	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
813	5	1	Mercedes-Benz S-Class	Mercedes-Benz S-Class	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
814	5	1	Mercedes-Benz Sl-Class	Mercedes-Benz Sl-Class	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
815	5	1	Mini Cooper	Mini Cooper	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
816	5	1	Mini Cooper Clubman	Mini Cooper Clubman	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
817	5	1	Mini Cooper Countryman	Mini Cooper Countryman	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
818	5	1	Mercedes-Benz 190	Mercedes-Benz 190	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
819	5	1	Mercedes-Benz 240/260/280	Mercedes-Benz 240/260/280	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
820	5	1	MG 3	MG 3	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
821	5	1	Mercedes-Benz 300/350/380	Mercedes-Benz 300/350/380	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
822	5	1	MG 350	MG 350	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
823	5	1	Mercedes-Benz 400/420	Mercedes-Benz 400/420	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
824	5	1	MG 5	MG 5	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
825	5	1	Mercedes-Benz 500/560	Mercedes-Benz 500/560	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
826	5	1	Mclaren 540C	Mclaren 540C	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
827	5	1	Mclaren 570S	Mclaren 570S	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
828	5	1	Mclaren 650S	Mclaren 650S	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
829	5	1	MG 6	MG 6	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
830	5	1	Mclaren 675LT	Mclaren 675LT	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
831	5	1	MG 750	MG 750	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
832	5	1	Mercedes-Benz A 45 AMG	Mercedes-Benz A 45 AMG	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
833	5	1	Mercedes-Benz A-Class	Mercedes-Benz A-Class	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
834	5	1	Mercedes-Benz B-Klasse Electric Drive	Mercedes-Benz B-Klasse Electric Drive	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
835	5	1	Mercedes-Benz CLA-Klasse	Mercedes-Benz CLA-Klasse	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
836	5	1	Mercedes-Benz CLC-Class	Mercedes-Benz CLC-Class	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
837	5	1	Mercedes-Benz CL-Class	Mercedes-Benz CL-Class	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
838	5	1	Mercedes-Benz CLK-Class	Mercedes-Benz CLK-Class	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
839	5	1	Mercedes-Benz CLS 63 AMG	Mercedes-Benz CLS 63 AMG	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
840	5	1	Mercedes-Benz CLS-Class	Mercedes-Benz CLS-Class	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
841	5	1	Mercedes-Benz CLS Shooting Brake	Mercedes-Benz CLS Shooting Brake	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
842	5	1	Mini Cooper S	Mini Cooper S	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
843	5	1	Mercury Cougar	Mercury Cougar	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
844	5	1	Mini Coupe	Mini Coupe	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
845	5	1	Mercedes-Benz E-Series	Mercedes-Benz E-Series	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
846	5	1	Mclaren F1	Mclaren F1	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
847	5	1	Mercedes-Benz G 63 AMG	Mercedes-Benz G 63 AMG	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
848	5	1	Mercedes-Benz G 65 AMG	Mercedes-Benz G 65 AMG	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
849	5	1	Mercedes-Benz GLA-Class	Mercedes-Benz GLA-Class	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
850	5	1	Mercedes-Benz GLA-Klasse	Mercedes-Benz GLA-Klasse	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
851	5	1	Mercedes-Benz GLC-Class	Mercedes-Benz GLC-Class	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
852	5	1	Mercedes-Benz GLE	Mercedes-Benz GLE	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
853	5	1	Mercedes-Benz GLE 63 AMG	Mercedes-Benz GLE 63 AMG	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
854	5	1	Mercedes-Benz GLE-Class	Mercedes-Benz GLE-Class	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
855	5	1	Mercedes-Benz GLE-Coupe	Mercedes-Benz GLE-Coupe	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
856	5	1	Mercedes-Benz GLK-Class	Mercedes-Benz GLK-Class	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
857	5	1	Mercury Grand Marquis	Mercury Grand Marquis	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
858	5	1	MG GS	MG GS	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
859	5	1	Mercedes-Benz G-Series	Mercedes-Benz G-Series	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
860	5	1	Mercury Marauder	Mercury Marauder	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
861	5	1	Mercury Marquis	Mercury Marquis	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
862	5	1	Mercury Mariner	Mercury Mariner	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
863	5	1	Mercedes-Benz M-Class	Mercedes-Benz M-Class	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
864	5	1	MG MG TF	MG MG TF	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
865	5	1	MG MG ZR	MG MG ZR	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
866	5	1	MG MG ZS	MG MG ZS	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
867	5	1	MG Midget	MG Midget	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
868	5	1	Mercury Milan	Mercury Milan	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
869	5	1	Mercury Montego	Mercury Montego	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
870	5	1	Mercury Mountaineer	Mercury Mountaineer	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
871	5	1	Mclaren MP4-12C	Mclaren MP4-12C	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
872	5	1	Mclaren P1	Mclaren P1	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
873	5	1	Mini Paceman	Mini Paceman	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
874	5	1	Mazda Protege	Mazda Protege	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
875	5	1	Mercedes-Benz R-Class	Mercedes-Benz R-Class	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
876	5	1	Mini Roadster	Mini Roadster	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
877	5	1	Mazda RX-6	Mazda RX-6	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
878	5	1	Mazda RX-7	Mazda RX-7	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
879	5	1	Mazda RX-8	Mazda RX-8	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
880	5	1	Mercedes-Benz S 65 AMG	Mercedes-Benz S 65 AMG	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
881	5	1	Mercury Sable	Mercury Sable	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
882	5	1	Mercedes-Benz S-Class Maybach	Mercedes-Benz S-Class Maybach	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
883	5	1	Mclaren SLR	Mclaren SLR	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
884	5	1	Mercedes-Benz SL 65 AMG	Mercedes-Benz SL 65 AMG	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
885	5	1	Mercedes-Benz SLR	Mercedes-Benz SLR	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
886	5	1	Mercedes-Benz SLR McLaren	Mercedes-Benz SLR McLaren	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
887	5	1	Mercedes-Benz SLS	Mercedes-Benz SLS	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
888	5	1	Mercedes-Benz SLS AMG	Mercedes-Benz SLS AMG	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
889	5	1	Mercedes-Benz SLS AMG Elektro	Mercedes-Benz SLS AMG Elektro	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
890	5	1	Mercedes-Benz SLS AMG Roadster	Mercedes-Benz SLS AMG Roadster	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
891	5	1	Mercedes-Benz Sprinter	Mercedes-Benz Sprinter	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
892	5	1	Mazda T 3500	Mazda T 3500	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
893	5	1	Mazda Tribute	Mazda Tribute	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
894	5	1	Mercedes-Benz Vaneo	Mercedes-Benz Vaneo	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
895	5	1	Mercedes-Benz Viano	Mercedes-Benz Viano	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
896	5	1	Mercedes-Benz Vito	Mercedes-Benz Vito	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
897	5	1	Mercedes-Benz V-Klasse	Mercedes-Benz V-Klasse	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
898	5	1	Mazda Xedos	Mazda Xedos	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
899	5	1	Mazda Xedos 9	Mazda Xedos 9	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
900	5	1	Mercury Zephyr	Mercury Zephyr	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
901	5	1	Mitsubishi ASX	Mitsubishi ASX	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
902	5	1	Mitsubishi Lancer	Mitsubishi Lancer	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
903	5	1	Mitsubishi Lancer EX	Mitsubishi Lancer EX	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
904	5	1	Mitsubishi Outlander	Mitsubishi Outlander	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
905	5	1	Mitsubishi Pajero	Mitsubishi Pajero	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
906	5	1	Nissan Altima	Nissan Altima	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
907	5	1	Nissan Patrol	Nissan Patrol	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
908	5	1	Nissan Juke	Nissan Juke	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
909	5	1	Nissan 370Z	Nissan 370Z	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
910	5	1	Nissan Armada	Nissan Armada	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
911	5	1	Nissan GT-R	Nissan GT-R	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
912	5	1	Nissan Maxima	Nissan Maxima	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
913	5	1	Nissan Murano	Nissan Murano	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
914	5	1	Nissan Pathfinder	Nissan Pathfinder	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
915	5	1	Nissan Patrol Safari	Nissan Patrol Safari	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
916	5	1	Nissan Sentra	Nissan Sentra	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
917	5	1	Nissan Sunny	Nissan Sunny	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
918	5	1	Nissan Tiida	Nissan Tiida	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
919	5	1	Nissan Xterra	Nissan Xterra	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
920	5	1	Nissan Xtrail	Nissan Xtrail	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
921	5	1	Nissan 300Z	Nissan 300Z	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
922	5	1	Nissan 350Z	Nissan 350Z	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
923	5	1	Morgan 3-Wheeler	Morgan 3-Wheeler	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
924	5	1	Morgan 4-Apr	Morgan 4-Apr	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
925	5	1	Morgan Aero 8	Morgan Aero 8	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
926	5	1	Morgan Aero Coupe	Morgan Aero Coupe	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
927	5	1	Nissan Almera	Nissan Almera	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
928	5	1	Nissan Almera Tino	Nissan Almera Tino	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
929	5	1	Mitsubishi Attrage	Mitsubishi Attrage	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
930	5	1	Nissan Atleon 140	Nissan Atleon 140	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
931	5	1	Nissan Bluebird	Nissan Bluebird	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
932	5	1	Nissan Cabstar	Nissan Cabstar	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
933	5	1	Mitsubishi Canter	Mitsubishi Canter	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
934	5	1	Mitsubishi Carisma	Mitsubishi Carisma	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
935	5	1	Nissan Cedric	Nissan Cedric	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
936	5	1	Mitsubishi Celeste	Mitsubishi Celeste	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
937	5	1	Nissan Civilian	Nissan Civilian	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
938	5	1	Mitsubishi Colt	Mitsubishi Colt	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
939	5	1	Mitsubishi Colt Neu	Mitsubishi Colt Neu	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
940	5	1	Mitsubishi Cordia	Mitsubishi Cordia	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
941	5	1	Mini (BMW) Countryman	Mini (BMW) Countryman	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
942	5	1	Nissan Cube	Nissan Cube	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
943	5	1	Oldsmobile Cutlass	Oldsmobile Cutlass	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
944	5	1	Mitsubishi Delica	Mitsubishi Delica	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
945	5	1	Mitsubishi Eclipse	Mitsubishi Eclipse	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
946	5	1	Mitsubishi Electric Vehicle	Mitsubishi Electric Vehicle	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
947	5	1	Mitsubishi Endeavor	Mitsubishi Endeavor	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
948	5	1	Mitsubishi Evolution	Mitsubishi Evolution	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
949	5	1	Mitsubishi Fortis	Mitsubishi Fortis	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
950	5	1	Mitsubishi Galant	Mitsubishi Galant	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
951	5	1	Nissan Gloria	Nissan Gloria	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
952	5	1	Mitsubishi Grandis	Mitsubishi Grandis	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
953	5	1	Mitsubishi I-Miev	Mitsubishi I-Miev	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
954	5	1	Mitsubishi L200	Mitsubishi L200	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
955	5	1	Mitsubishi L300	Mitsubishi L300	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
956	5	1	Mitsubishi Lancer Evolution	Mitsubishi Lancer Evolution	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
957	5	1	Mitsubishi Lancer Fortis	Mitsubishi Lancer Fortis	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
958	5	1	Nissan LEAF	Nissan LEAF	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
959	5	1	Noble M400	Noble M400	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
960	5	1	Noble M600	Noble M600	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
961	5	1	Mitsubishi Magna	Mitsubishi Magna	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
962	5	1	Nissan Micra	Nissan Micra	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
963	5	1	Mini (BMW) Mini II	Mini (BMW) Mini II	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
964	5	1	Nissan Minivan	Nissan Minivan	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
965	5	1	Mitsubishi Minivan	Mitsubishi Minivan	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
966	5	1	Mitsubishi Mirage	Mitsubishi Mirage	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
967	5	1	Mitsubishi Nativa	Mitsubishi Nativa	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
968	5	1	Nissan Navara	Nissan Navara	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
969	5	1	Nissan Note	Nissan Note	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
970	5	1	Mini (BMW) Paceman	Mini (BMW) Paceman	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
971	5	1	Mitsubishi Pajero Pinin	Mitsubishi Pajero Pinin	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
972	5	1	Nissan Pathfinder Classic	Nissan Pathfinder Classic	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
973	5	1	Nissan Patrol GR	Nissan Patrol GR	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
974	5	1	Nissan Pickup	Nissan Pickup	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
975	5	1	Mitsubishi PickUp	Mitsubishi PickUp	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
976	5	1	Nissan Pixo	Nissan Pixo	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
977	5	1	Morgan Plus 4	Morgan Plus 4	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
978	5	1	Morgan Plus 8	Morgan Plus 8	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
979	5	1	Nissan Primera	Nissan Primera	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
980	5	1	Nissan Pulsar	Nissan Pulsar	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
981	5	1	Nissan Qashqai	Nissan Qashqai	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
982	5	1	Nissan Quest	Nissan Quest	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
983	5	1	Mitsubishi Rosa	Mitsubishi Rosa	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
984	5	1	Nissan S130	Nissan S130	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
985	5	1	Mitsubishi Sapporo	Mitsubishi Sapporo	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
986	5	1	Oldsmobile Silhouette	Oldsmobile Silhouette	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
987	5	1	Nissan Skyline	Nissan Skyline	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
988	5	1	Mitsubishi Space Star	Mitsubishi Space Star	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
989	5	1	Mitsubishi SpaceWagon	Mitsubishi SpaceWagon	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
990	5	1	Mitsubishi Space Wagon	Mitsubishi Space Wagon	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
991	5	1	Nissan TEANA	Nissan TEANA	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
992	5	1	Nissan Terrano	Nissan Terrano	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
993	5	1	Oldsmobile Toronado	Oldsmobile Toronado	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
994	5	1	Nissan Titan	Nissan Titan	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
995	5	1	Nissan UD	Nissan UD	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
996	5	1	Nissan Urvan	Nissan Urvan	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
997	5	1	Nissan Versa	Nissan Versa	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
998	5	1	Peugeot 2008	Peugeot 2008	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
999	5	1	Peugeot 208	Peugeot 208	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1000	5	1	Peugeot 3008	Peugeot 3008	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1001	5	1	Peugeot 301	Peugeot 301	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1002	5	1	Peugeot 308	Peugeot 308	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1003	5	1	Peugeot 5008	Peugeot 5008	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1004	5	1	Peugeot 508	Peugeot 508	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1005	5	1	Peugeot RCZ	Peugeot RCZ	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1006	5	1	Porsche Boxster	Porsche Boxster	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1007	5	1	Porsche Cayenne	Porsche Cayenne	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1008	5	1	Porsche Cayman	Porsche Cayman	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1009	5	1	Porsche Panamera	Porsche Panamera	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1010	5	1	Peugeot 106	Peugeot 106	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1011	5	1	Peugeot 107	Peugeot 107	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1012	5	1	Peugeot 108	Peugeot 108	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1013	5	1	RAM 1500	RAM 1500	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1014	5	1	Peugeot 205	Peugeot 205	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1015	5	1	Peugeot 206	Peugeot 206	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1016	5	1	Peugeot 207	Peugeot 207	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1017	5	1	Peugeot 306	Peugeot 306	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1018	5	1	Peugeot 307	Peugeot 307	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1019	5	1	Peugeot 4007	Peugeot 4007	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1020	5	1	Peugeot 4008	Peugeot 4008	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1021	5	1	Peugeot 406	Peugeot 406	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1022	5	1	Peugeot 407	Peugeot 407	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1023	5	1	Peugeot 408	Peugeot 408	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1024	5	1	Peugeot 504	Peugeot 504	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1025	5	1	Peugeot 505	Peugeot 505	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1026	5	1	Peugeot 604	Peugeot 604	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1027	5	1	Peugeot 605	Peugeot 605	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1028	5	1	Peugeot 607	Peugeot 607	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1029	5	1	Peugeot 807	Peugeot 807	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1030	5	1	Porsche 911 Carrera	Porsche 911 Carrera	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1031	5	1	Porsche 911 Carrera 4	Porsche 911 Carrera 4	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1032	5	1	Porsche 911 Carrera 4 GTS	Porsche 911 Carrera 4 GTS	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1033	5	1	Porsche 911 Carrera 4S	Porsche 911 Carrera 4S	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1034	5	1	Porsche 911 Carrera GTS	Porsche 911 Carrera GTS	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1035	5	1	Porsche 911 Carrera S	Porsche 911 Carrera S	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1036	5	1	Porsche 911 GT2	Porsche 911 GT2	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1037	5	1	Porsche 911 GT3	Porsche 911 GT3	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1038	5	1	Porsche 911 GT3 RS	Porsche 911 GT3 RS	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1039	5	1	Porsche 911 Speedster	Porsche 911 Speedster	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1040	5	1	Porsche 911 Targa 4	Porsche 911 Targa 4	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1041	5	1	Porsche 911 Targa 4S	Porsche 911 Targa 4S	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1042	5	1	Porsche 911 Targa GTS	Porsche 911 Targa GTS	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1043	5	1	Porsche 911 Turbo	Porsche 911 Turbo	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1044	5	1	Porsche 911 Turbo S	Porsche 911 Turbo S	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1045	5	1	Porsche 918	Porsche 918	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1046	5	1	Porsche 928	Porsche 928	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1047	5	1	Porsche 944	Porsche 944	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1048	5	1	Porsche 968	Porsche 968	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1049	5	1	Porsche 9FF	Porsche 9FF	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1050	5	1	Opel Adam	Opel Adam	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1051	5	1	Opel Agila	Opel Agila	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1052	5	1	Opel Ampera	Opel Ampera	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1053	5	1	Opel Antara	Opel Antara	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1054	5	1	Opel Astra OPC	Opel Astra OPC	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1055	5	1	Opel Astra	Opel Astra	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1056	5	1	Peugeot Bipper	Peugeot Bipper	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1057	5	1	Peugeot Boxer	Peugeot Boxer	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1058	5	1	Opel Cascada	Opel Cascada	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1059	5	1	Opel Combo	Opel Combo	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1060	5	1	Opel Corsa	Opel Corsa	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1061	5	1	Peugeot Expert	Peugeot Expert	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1062	5	1	Opel Frontera	Opel Frontera	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1063	5	1	Proton Gen-2	Proton Gen-2	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1064	5	1	Pontiac Grand AM	Pontiac Grand AM	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1065	5	1	Opel GT	Opel GT	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1066	5	1	Pontiac GTO	Pontiac GTO	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1067	5	1	Pagani Huayra	Pagani Huayra	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1068	5	1	Opel Insignia	Opel Insignia	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1069	5	1	Opel Insignia Country Tourer	Opel Insignia Country Tourer	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1070	5	1	Peugeot Ion	Peugeot Ion	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1071	5	1	Opel Kadett	Opel Kadett	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1072	5	1	Opel Karl	Opel Karl	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1073	5	1	Porsche Macan	Porsche Macan	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1074	5	1	Opel Meriva	Opel Meriva	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1075	5	1	Opel Mokka	Opel Mokka	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1076	5	1	Opel Omega	Opel Omega	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1077	5	1	Peugeot Partner	Peugeot Partner	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1078	5	1	Peugeot RC7	Peugeot RC7	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1079	5	1	Proton Savvy	Proton Savvy	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1080	5	1	Opel Signum	Opel Signum	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1081	5	1	Pontiac Solstice	Pontiac Solstice	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1082	5	1	PGO Speedster	PGO Speedster	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1083	5	1	Opel Speedster	Opel Speedster	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1084	5	1	Oullim Spirra	Oullim Spirra	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1085	5	1	Opel Tigra	Opel Tigra	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1086	5	1	Opel Tigra Twin Top	Opel Tigra Twin Top	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1087	5	1	Opel Vectra	Opel Vectra	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1088	5	1	Opel Vita	Opel Vita	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1089	5	1	Proton Waja	Proton Waja	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1090	5	1	Pontiac Wave	Pontiac Wave	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1091	5	1	Proton Wira	Proton Wira	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1092	5	1	Peugeot X Line	Peugeot X Line	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1093	5	1	Opel Zafira	Opel Zafira	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1094	5	1	Pagani Zonda	Pagani Zonda	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1095	5	1	Renault Captur	Renault Captur	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1096	5	1	Renault Duster	Renault Duster	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1097	5	1	Renault Koleos	Renault Koleos	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1098	5	1	Renault Megane	Renault Megane	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1099	5	1	Renault Symbol	Renault Symbol	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1100	5	1	Rolls Royce Ghost	Rolls Royce Ghost	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1101	5	1	Rolls Royce Phantom	Rolls Royce Phantom	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1102	5	1	Rolls Royce Wraith	Rolls Royce Wraith	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1103	5	1	SAAB 900	SAAB 900	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1104	5	1	SAAB 9000	SAAB 9000	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1105	5	1	SAAB 3-Sep	SAAB 3-Sep	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1106	5	1	SAAB 5-Sep	SAAB 5-Sep	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1107	5	1	SAAB 9-7X	SAAB 9-7X	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1108	5	1	Ssangyong Actyon	Ssangyong Actyon	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1109	5	1	Seat Alhambra	Seat Alhambra	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1110	5	1	Seat Altea	Seat Altea	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1111	5	1	Seat Arosa	Seat Arosa	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1112	5	1	Subaru B9 Tribeca	Subaru B9 Tribeca	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1113	5	1	Subaru BRZ	Subaru BRZ	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1114	5	1	Spyker C8	Spyker C8	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1115	5	1	Skoda Citigo	Skoda Citigo	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1116	5	1	Renault Clio	Renault Clio	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1117	5	1	Renault Clio RS	Renault Clio RS	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1118	5	1	Seat Cordoba	Seat Cordoba	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1119	5	1	Rolls Royce Corniche	Rolls Royce Corniche	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1120	5	1	Spyker D12	Spyker D12	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1121	5	1	Renault Dokker	Renault Dokker	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1122	5	1	Rolls Royce Drophead	Rolls Royce Drophead	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1123	5	1	Renault Espace	Renault Espace	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1124	5	1	Seat Exeo	Seat Exeo	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1125	5	1	Skoda Fabia	Skoda Fabia	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1126	5	1	Skoda Felicia	Skoda Felicia	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1127	5	1	Renault Fluence	Renault Fluence	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1128	5	1	Renault Fluence Elektro	Renault Fluence Elektro	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1129	5	1	Subaru Forester	Subaru Forester	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1130	5	1	Smart Forfour	Smart Forfour	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1131	5	1	Smart Fortwo	Smart Fortwo	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1132	5	1	Seat Ibiza	Seat Ibiza	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1133	5	1	Subaru Impreza	Subaru Impreza	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1134	5	1	Seat Inca	Seat Inca	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1135	5	1	Subaru Justy	Subaru Justy	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1136	5	1	Subaru Justy G3X	Subaru Justy G3X	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1137	5	1	Renault Kadjar	Renault Kadjar	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1138	5	1	Ssangyong Korando	Ssangyong Korando	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1139	5	1	Ssangyong Kyron	Ssangyong Kyron	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1140	5	1	Renault Kangoo	Renault Kangoo	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1141	5	1	Renault Laguna	Renault Laguna	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1142	5	1	Renault Latitude	Renault Latitude	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1143	5	1	Rover Land	Rover Land	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1144	5	1	Subaru Legacy	Subaru Legacy	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1145	5	1	Seat Leon	Seat Leon	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1146	5	1	Renault Logan	Renault Logan	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1147	5	1	Renault Master	Renault Master	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1148	5	1	Seat Mii	Seat Mii	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1149	5	1	Renault Modus	Renault Modus	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1150	5	1	Ssangyong Musso	Ssangyong Musso	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1151	5	1	Skoda Octavia	Skoda Octavia	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1152	5	1	Rolls Royce Park Ward	Rolls Royce Park Ward	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1153	5	1	Rolls Royce Phantom Series II	Rolls Royce Phantom Series II	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1154	5	1	Renault R12	Renault R12	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1155	5	1	Renault R19	Renault R19	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1156	5	1	Renault R9	Renault R9	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1157	5	1	Skoda Rapid	Skoda Rapid	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1158	5	1	Ssangyong Rexton	Ssangyong Rexton	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1159	5	1	Ssangyong Rodius	Ssangyong Rodius	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1160	5	1	Skoda Roomster	Skoda Roomster	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1161	5	1	Rover Rover 25	Rover Rover 25	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1162	5	1	Rover Rover 45	Rover Rover 45	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1163	5	1	Rover Rover 75	Rover Rover 75	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1164	5	1	Rover Rover Streetwise	Rover Rover Streetwise	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1165	5	1	SAAB Saab 9-3 X	SAAB Saab 9-3 X	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1166	5	1	SAAB Saab 9-4X	SAAB Saab 9-4X	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1167	5	1	Renault Safrane	Renault Safrane	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1168	5	1	Renault Sandero	Renault Sandero	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1323	5	1	Ferrari 812	Ferrari 812	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1169	5	1	Renault Scenic	Renault Scenic	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1170	5	1	Rolls Royce Silver Cloud	Rolls Royce Silver Cloud	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1171	5	1	Rolls Royce Silver Race	Rolls Royce Silver Race	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1172	5	1	Rolls Royce Silver Seraph	Rolls Royce Silver Seraph	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1173	5	1	Rolls Royce Silver Shadow II	Rolls Royce Silver Shadow II	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1174	5	1	Rolls Royce Silver Shadow One	Rolls Royce Silver Shadow One	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1175	5	1	Rolls Royce Silver Spur	Rolls Royce Silver Spur	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1176	5	1	Rolls Royce Silver Spur II	Rolls Royce Silver Spur II	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1177	5	1	Rolls Royce Silver Wraith	Rolls Royce Silver Wraith	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1178	5	1	Smart Smart Fortwo Elektro	Smart Smart Fortwo Elektro	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1179	5	1	Smart Smart roadster	Smart Smart roadster	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1180	5	1	Skoda Superb	Skoda Superb	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1181	5	1	Ssangyong Tivoli	Ssangyong Tivoli	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1182	5	1	Seat Toledo	Seat Toledo	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1183	5	1	Renault Trafic	Renault Trafic	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1184	5	1	Subaru Trezia	Subaru Trezia	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1185	5	1	Renault Twingo	Renault Twingo	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1186	5	1	Renault Twizy	Renault Twizy	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1187	5	1	Rover VL 75	Rover VL 75	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1188	5	1	Renault Wind	Renault Wind	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1189	5	1	Skoda Yeti	Skoda Yeti	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1190	5	1	Renault ZOE	Renault ZOE	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1191	5	1	Renault ZOE	Renault ZOE	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1192	5	1	Suzuki APV	Suzuki APV	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1193	5	1	Suzuki Carry	Suzuki Carry	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1194	5	1	Suzuki Celerio	Suzuki Celerio	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1195	5	1	Suzuki Ertiga	Suzuki Ertiga	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1196	5	1	Suzuki Grand Vitara	Suzuki Grand Vitara	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1197	5	1	Suzuki Jimny	Suzuki Jimny	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1198	5	1	Suzuki Kizashi	Suzuki Kizashi	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1199	5	1	Toyota 86	Toyota 86	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1200	5	1	Toyota Avalon	Toyota Avalon	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1201	5	1	Toyota Camry	Toyota Camry	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1202	5	1	Toyota Corolla	Toyota Corolla	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1203	5	1	Toyota FJ Cruiser	Toyota FJ Cruiser	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1204	5	1	Toyota Fortuner	Toyota Fortuner	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1205	5	1	Toyota Innova	Toyota Innova	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1206	5	1	Toyota Land Cruiser	Toyota Land Cruiser	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1207	5	1	Toyota Prado	Toyota Prado	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1208	5	1	Toyota Previa	Toyota Previa	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1209	5	1	Toyota Prius	Toyota Prius	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1210	5	1	Toyota RAV4	Toyota RAV4	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1211	5	1	Toyota Yaris	Toyota Yaris	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1212	5	1	Volkswagen Beetle	Volkswagen Beetle	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1213	5	1	Volkswagen Golf	Volkswagen Golf	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1214	5	1	Volkswagen Golf R	Volkswagen Golf R	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1215	5	1	Volkswagen Jetta	Volkswagen Jetta	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1216	5	1	TATA 1618	TATA 1618	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1217	5	1	Toyota 4Runner	Toyota 4Runner	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1218	5	1	Suzuki Alto	Suzuki Alto	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1219	5	1	Suzuki APV Van	Suzuki APV Van	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1220	5	1	Volkswagen Amarok	Volkswagen Amarok	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1221	5	1	Toyota Aurion	Toyota Aurion	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1222	5	1	Toyota Auris	Toyota Auris	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1223	5	1	Toyota Avanza	Toyota Avanza	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1224	5	1	Toyota Avensis	Toyota Avensis	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1225	5	1	Toyota Avensis Verso	Toyota Avensis Verso	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1226	5	1	Toyota Aygo	Toyota Aygo	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1227	5	1	Suzuki Baleno	Suzuki Baleno	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1228	5	1	Volkswagen Bora	Volkswagen Bora	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1229	5	1	Volkswagen Cabrio	Volkswagen Cabrio	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1230	5	1	Volkswagen Caddy	Volkswagen Caddy	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1231	5	1	Toyota Carina	Toyota Carina	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1232	5	1	Volkswagen CC	Volkswagen CC	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1233	5	1	Toyota Celica	Toyota Celica	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1234	5	1	Suzuki Ciaz	Suzuki Ciaz	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1235	5	1	Toyota Coaster	Toyota Coaster	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1236	5	1	Toyota Corolla Verso	Toyota Corolla Verso	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1237	5	1	Toyota Corona	Toyota Corona	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1238	5	1	Volkswagen Crafter	Volkswagen Crafter	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1239	5	1	Toyota Cressida	Toyota Cressida	1	2025-04-07 15:01:44	2025-04-07 15:01:44	\N
1240	5	1	Toyota Crown	Toyota Crown	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1241	5	1	Toyota Echo	Toyota Echo	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1242	5	1	Volkswagen EOS	Volkswagen EOS	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1243	5	1	Volkswagen Eurovan	Volkswagen Eurovan	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1244	5	1	Volkswagen Golf Plus	Volkswagen Golf Plus	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1245	5	1	Volkswagen Golf R32	Volkswagen Golf R32	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1246	5	1	Toyota GT86	Toyota GT86	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1247	5	1	Volkswagen GTI	Volkswagen GTI	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1248	5	1	Toyota Hiace	Toyota Hiace	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1249	5	1	Toyota Hilux	Toyota Hilux	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1250	5	1	Suzuki Ignis	Suzuki Ignis	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1251	5	1	TATA Indica	TATA Indica	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1252	5	1	Toyota IQ	Toyota IQ	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1253	5	1	Toyota Land Cruiser 70	Toyota Land Cruiser 70	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1254	5	1	Toyota Land Cruiser V8	Toyota Land Cruiser V8	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1255	5	1	Suzuki Liana	Suzuki Liana	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1256	5	1	TATA Manza	TATA Manza	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1257	5	1	Toyota MR2	Toyota MR2	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1258	5	1	Toyota MR 2	Toyota MR 2	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1259	5	1	Toyota Prius+	Toyota Prius+	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1260	5	1	TATA Safari	TATA Safari	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1261	5	1	Toyota Scion	Toyota Scion	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1262	5	1	Toyota Sequoia	Toyota Sequoia	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1263	5	1	Toyota Sienna	Toyota Sienna	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1264	5	1	Toyota Solara	Toyota Solara	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1265	5	1	Suzuki Splash	Suzuki Splash	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1266	5	1	Toyota Starlet	Toyota Starlet	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1267	5	1	Toyota Supra	Toyota Supra	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1268	5	1	Suzuki SX4	Suzuki SX4	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1269	5	1	Suzuki Swift	Suzuki Swift	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1270	5	1	Suzuki SX4 S-Cross	Suzuki SX4 S-Cross	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1271	5	1	TATA Telcoline	TATA Telcoline	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1272	5	1	Toyota Tacoma	Toyota Tacoma	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1273	5	1	Toyota Tercel	Toyota Tercel	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1274	5	1	UAZ Tigr	UAZ Tigr	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1275	5	1	Subaru Tribeca	Subaru Tribeca	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1276	5	1	Toyota Tundra	Toyota Tundra	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1277	5	1	Toyota Urban Cruiser	Toyota Urban Cruiser	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1278	5	1	Toyota Venza	Toyota Venza	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1279	5	1	Suzuki Verona	Suzuki Verona	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1280	5	1	Toyota Verso	Toyota Verso	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1281	5	1	Toyota Verso S	Toyota Verso S	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1282	5	1	Suzuki Vitara	Suzuki Vitara	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1283	5	1	Suzuki Wagon R+	Suzuki Wagon R+	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1284	5	1	Subaru WRX	Subaru WRX	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1285	5	1	Subaru WRX STI	Subaru WRX STI	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1286	5	1	Toyota XA	Toyota XA	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1287	5	1	TATA Xenon	TATA Xenon	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1288	5	1	Suzuki XL7	Suzuki XL7	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1289	5	1	Subaru XV	Subaru XV	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1290	5	1	Toyota Zalas	Toyota Zalas	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1291	5	1	Volkswagen Passat	Volkswagen Passat	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1292	5	1	Volkswagen Scirocco	Volkswagen Scirocco	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1293	5	1	Volkswagen Tiguan	Volkswagen Tiguan	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1294	5	1	Volkswagen Touareg	Volkswagen Touareg	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1295	5	1	Volvo 960	Volvo 960	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1296	5	1	Volvo S90	Volvo S90	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1297	5	1	Volvo V90	Volvo V90	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1298	5	1	Volvo XC60	Volvo XC60	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1299	5	1	Volvo XC90	Volvo XC90	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1300	5	1	Audi A4	Audi A4	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1301	5	1	Ashok tst	Ashok tst	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1302	5	1	Artega dfadsfdfd	Artega dfadsfdfd	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1303	5	1	Alpina ewetet	Alpina ewetet	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1304	5	1	Wiesmann GT	Wiesmann GT	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1305	5	1	Alfa Romeo 145	Alfa Romeo 145	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1306	5	1	Alpina test	Alpina test	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1307	5	1	Alpina test	Alpina test	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1308	5	1	Aston Martin DB11	Aston Martin DB11	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1309	5	1	Aston Martin DB11 Volante	Aston Martin DB11 Volante	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1310	5	1	Lincoln Continental	Lincoln Continental	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1311	5	1	Aston Martin DB9 Volante	Aston Martin DB9 Volante	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1312	5	1	Audi A5 Sportback	Audi A5 Sportback	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1313	5	1	Bentley Bentayga	Bentley Bentayga	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1314	5	1	Infiniti G	Infiniti G	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1315	5	1	BMW 4-Series Convertible	BMW 4-Series Convertible	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1316	5	1	BMW M4 Convertible	BMW M4 Convertible	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1317	5	1	Cadillac ATS Coupe	Cadillac ATS Coupe	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1318	5	1	Cadillac ATS V Coupe	Cadillac ATS V Coupe	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1319	5	1	Cadillac CT6	Cadillac CT6	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1320	5	1	Mercedes-Benz ML 350	Mercedes-Benz ML 350	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1321	5	1	Cadillac XT5	Cadillac XT5	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1322	5	1	Cadillac XTS V	Cadillac XTS V	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1324	5	1	Ferrari GTC4	Ferrari GTC4	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1325	5	1	Ferrari PORTIFINO	Ferrari PORTIFINO	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1326	5	1	Mercedes-Benz ML 500	Mercedes-Benz ML 500	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1327	5	1	Renault Talisman	Renault Talisman	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1328	5	1	Volkswagen Scirocco r	Volkswagen Scirocco r	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1329	5	1	Volkswagen Touran	Volkswagen Touran	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1330	5	1	GMC Terrain	GMC Terrain	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1331	5	1	Volvo V940	Volvo V940	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1332	5	1	Peugeot 1007	Peugeot 1007	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1333	5	1	Lada 110	Lada 110	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1334	5	1	Ferrari 125	Ferrari 125	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1335	5	1	Fiat 128	Fiat 128	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1336	5	1	Mclaren 12C	Mclaren 12C	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1337	5	1	Alfa Romeo 159	Alfa Romeo 159	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1338	5	1	Rover 200	Rover 200	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1339	5	1	BMW 2er Active Tourer	BMW 2er Active Tourer	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1340	5	1	Chrysler 300	Chrysler 300	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1341	5	1	Mitsubishi 3000GT	Mitsubishi 3000GT	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1342	5	1	Volvo 745	Volvo 745	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1343	5	1	Volvo 850	Volvo 850	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1344	5	1	Volvo C30	Volvo C30	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1345	5	1	Volvo C70	Volvo C70	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1346	5	1	Cadillac ATS V Coupe	Cadillac ATS V Coupe	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1347	5	1	TATA Indigo	TATA Indigo	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1348	5	1	Volkswagen LT	Volkswagen LT	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1349	5	1	Volkswagen Lupo	Volkswagen Lupo	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1350	5	1	Wiesmann MF3	Wiesmann MF3	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1351	5	1	Wiesmann MF4	Wiesmann MF4	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1352	5	1	Wiesmann MF5	Wiesmann MF5	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1353	5	1	Tesla Model S	Tesla Model S	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1354	5	1	Tesla Model X	Tesla Model X	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1355	5	1	Volkswagen Multivan	Volkswagen Multivan	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1356	5	1	ZNA Oting	ZNA Oting	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1357	5	1	Volkswagen Passat Variant	Volkswagen Passat Variant	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1358	5	1	Volkswagen Phaeton	Volkswagen Phaeton	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1359	5	1	Volkswagen Polo	Volkswagen Polo	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1360	5	1	Volkswagen Rabbit	Volkswagen Rabbit	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1361	5	1	ZNA Rich	ZNA Rich	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1362	5	1	Volvo S40	Volvo S40	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1363	5	1	Volvo S60	Volvo S60	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1364	5	1	Volvo S70	Volvo S70	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1365	5	1	Volvo S80	Volvo S80	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1366	5	1	Volkswagen Santana	Volkswagen Santana	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1367	5	1	Volkswagen Sharan	Volkswagen Sharan	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1368	5	1	Ford Shelby GT500	Ford Shelby GT500	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1369	5	1	Volkswagen SpaceFox	Volkswagen SpaceFox	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1370	5	1	GMC Terrain	GMC Terrain	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1371	5	1	Volkswagen Transporter	Volkswagen Transporter	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1372	5	1	Volvo V40	Volvo V40	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1373	5	1	Volvo V 40 (2012)	Volvo V 40 (2012)	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1374	5	1	Volvo V 40 Cross Country	Volvo V 40 Cross Country	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1375	5	1	Volvo V50	Volvo V50	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1376	5	1	Volvo V60	Volvo V60	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1377	5	1	Volvo V 60 Cross Country	Volvo V 60 Cross Country	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1378	5	1	Volvo V70	Volvo V70	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1379	5	1	Volkswagen Vento	Volkswagen Vento	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1380	5	1	Volvo XC70	Volvo XC70	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1381	5	1	Volvo XC90 (2014)	Volvo XC90 (2014)	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1382	5	1	ZNA Yumsun	ZNA Yumsun	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1383	5	1	GMC Terrain	GMC Terrain	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1384	5	1	Mazda 323	Mazda 323	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1385	5	1	Peugeot 405	Peugeot 405	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1386	5	1	Mazda 5	Mazda 5	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1387	5	1	Fiat 500X	Fiat 500X	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1388	5	1	MG 550	MG 550	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1389	5	1	Volvo 740	Volvo 740	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1390	5	1	Porsche 911 GT2 RS	Porsche 911 GT2 RS	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1391	5	1	Morgan Aero Coupe	Morgan Aero Coupe	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1392	5	1	Ford Aerostar	Ford Aerostar	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1393	5	1	Audi All Road Quattro	Audi All Road Quattro	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1394	5	1	Hyundai Atos	Hyundai Atos	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1395	5	1	Renault Avantime	Renault Avantime	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1396	5	1	Chery B11 Oriental Son	Chery B11 Oriental Son	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1397	5	1	Kia Bongo III	Kia Bongo III	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1398	5	1	Citroen C8	Citroen C8	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1399	5	1	Volkswagen Cabriolet	Volkswagen Cabriolet	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1400	5	1	PGO Cevennes	PGO Cevennes	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1401	5	1	Honda Civic	Honda Civic	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1402	5	1	Daihatsu Delta	Daihatsu Delta	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1403	5	1	Mitsubishi Diamante	Mitsubishi Diamante	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1404	5	1	Land Rover Discovery	Land Rover Discovery	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1405	5	1	Dacia Duster	Dacia Duster	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1406	5	1	Mercedes-Benz E 55 AMG	Mercedes-Benz E 55 AMG	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1407	5	1	Geely Emgrand 7	Geely Emgrand 7	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1408	5	1	Cadillac Fleetwood	Cadillac Fleetwood	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1409	5	1	Seat FR Series	Seat FR Series	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1410	5	1	Fiat Freemont	Fiat Freemont	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1411	5	1	Alfa Romeo Giulietta	Alfa Romeo Giulietta	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1412	5	1	Maserati Gransport Spyder	Maserati Gransport Spyder	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1413	5	1	Ford GT	Ford GT	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1414	5	1	Hyundai H1	Hyundai H1	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1415	5	1	Toyota Highlander	Toyota Highlander	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1416	5	1	Infiniti G	Infiniti G	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1417	5	1	Jeep Liberty	Jeep Liberty	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1418	5	1	MG MG ZT	MG MG ZT	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1419	5	1	Mitsubishi Montero	Mitsubishi Montero	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1420	5	1	Ford Mustang Shelby GT500	Ford Mustang Shelby GT500	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1421	5	1	Chrysler New Yorker	Chrysler New Yorker	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1422	5	1	Dodge Nitro	Dodge Nitro	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1423	5	1	Honda Odyssey J	Honda Odyssey J	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1424	5	1	Subaru Outback	Subaru Outback	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1425	5	1	Mazda Persona	Mazda Persona	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1426	5	1	Morgan Roadster	Morgan Roadster	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1427	5	1	Volvo S 60 Cross Country	Volvo S 60 Cross Country	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1428	5	1	Proton Saga	Proton Saga	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1429	5	1	Kia Sedona	Kia Sedona	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1430	5	1	Rolls Royce Seraph	Rolls Royce Seraph	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1431	5	1	Mercedes-Benz SL 63 AMG	Mercedes-Benz SL 63 AMG	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1432	5	1	Cadillac SRX	Cadillac SRX	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1433	5	1	Suzuki Swift Dzire	Suzuki Swift Dzire	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1434	5	1	Chevrolet Trail Blazer	Chevrolet Trail Blazer	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1435	5	1	Fiat Ulysse	Fiat Ulysse	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1436	5	1	Aston Martin Vanquish My 2014	Aston Martin Vanquish My 2014	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1437	5	1	Renault Vel Satis	Renault Vel Satis	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1438	5	1	Great Wall Wingle 3	Great Wall Wingle 3	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1439	5	1	Jaguar XJS	Jaguar XJS	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1440	5	1	Lancia Ypsilon	Lancia Ypsilon	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1441	5	1	Opel Zafira Tourer	Opel Zafira Tourer	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
1442	5	1	Tesla Model S	Tesla Model S	1	2025-04-07 15:01:45	2025-04-07 15:01:45	\N
\.


--
-- Data for Name: category_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category_fields (id, category_id, type, label, name, label_ar, name_ar, options, attribute_id, file_types, created_at, updated_at, "order", field_id) FROM stdin;
61	5	text	Ads Title	Ads Title	عنوان الإعلانات	عنوان الإعلانات	\N	\N	\N	2025-03-19 14:57:57	2025-03-19 14:57:57	0	0
62	5	select	Moke & Model	Moke & Model	الوضع والنموذج	الوضع والنموذج	\N	1	\N	2025-03-19 14:57:57	2025-03-19 14:57:57	1	1
63	5	select	Regional Specs	Regional Specs	المواصفات الإقليمية	المواصفات الإقليمية	\N	2	\N	2025-03-19 14:57:57	2025-03-19 14:57:57	2	2
64	5	select	Year	Year	سنة	سنة	\N	3	\N	2025-03-19 14:57:57	2025-03-19 14:57:57	3	3
65	5	text	Kilometers	Kilometers	كيلومترات	كيلومترات	\N	\N	\N	2025-03-19 14:57:57	2025-03-19 14:57:57	4	4
66	5	select	Body Type	Body Type	نوع الجسم	نوع الجسم	\N	4	\N	2025-03-19 14:57:57	2025-03-19 14:57:57	5	5
67	5	select	Is your car insured in Syria	Is your car insured in Syria	هل سيارتك مؤمنة في سوريا؟	هل سيارتك مؤمنة في سوريا؟	\N	5	\N	2025-03-19 14:57:57	2025-03-19 14:57:57	6	6
68	5	text	Price	Price	سعر	سعر	\N	\N	\N	2025-03-19 14:57:57	2025-03-19 14:57:57	7	7
69	5	text	Phone Number	Phone Number	رقم التليفون	رقم التليفون	\N	\N	\N	2025-03-19 14:57:57	2025-03-19 14:57:57	8	8
70	5	file	images	images	الصور	الصور	\N	\N	.jpg,.png	2025-03-19 14:57:57	2025-03-19 14:57:57	9	9
8	2	text	Title	Title	Title	Title	\N	\N	\N	2025-03-20 11:16:04	2025-03-20 11:16:04	\N	0
9	2	select	Property Type	Property Type	Property Type	Property Type	\N	8	\N	2025-03-20 11:16:04	2025-03-20 11:16:04	1	7
10	2	select	Housing Category	Housing Category	Housing Category	Housing Category	\N	9	\N	2025-03-20 11:16:04	2025-03-20 11:16:04	2	8
11	2	select	Is it furnished?	Is it furnished?	Is it furnished?	Is it furnished?	\N	10	\N	2025-03-20 11:16:04	2025-03-20 11:16:04	3	9
12	2	text	Phone number	Phone number	Phone number	Phone number	\N	\N	\N	2025-03-20 11:16:04	2025-03-20 11:16:04	\N	1
13	2	text	Price	Price	Price	Price	\N	\N	\N	2025-03-20 11:16:04	2025-03-20 11:16:04	\N	2
14	2	text	Describe your property	Describe your property	Describe your property	Describe your property	\N	\N	\N	2025-03-20 11:16:04	2025-03-20 11:16:04	\N	3
15	2	text	Size	Size	Size	Size	\N	\N	\N	2025-03-20 11:16:04	2025-03-20 11:16:04	\N	4
16	2	text	Developer	Developer	Developer	Developer	\N	\N	\N	2025-03-20 11:16:04	2025-03-20 11:16:04	\N	5
17	2	text	Annual Community Field	Annual Community Field	Annual Community Field	Annual Community Field	\N	\N	\N	2025-03-20 11:16:04	2025-03-20 11:16:04	\N	6
\.


--
-- Data for Name: challenges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.challenges (id, user_id, name, challenge_type, target_type, target_value, start_date, end_date, status, created_at, updated_at, deleted_at) FROM stdin;
13	1	Melyssa Cooke	1	2	34	2024-12-20	2024-12-26	1	2024-12-05 21:32:47	2024-12-16 15:53:25	2024-12-16 15:53:25
14	1	Noah Wise111	2	4	45	2024-12-26	2024-12-27	1	2024-12-05 21:33:05	2024-12-18 08:04:47	\N
15	1	Testing	2	1	12	2024-12-17	2025-02-01	1	2024-12-05 21:43:13	2024-12-15 22:48:49	\N
17	1	Macon Bradford	2	3	2342	2024-12-16	2024-12-24	1	2024-12-16 00:15:33	2024-12-16 15:47:51	2024-12-16 15:47:51
18	1	Abigail Snider	2	3	56	2024-12-20	2024-12-21	1	2024-12-16 15:53:48	2024-12-16 15:54:26	2024-12-16 15:54:26
19	1	Test	2	4	12	2024-12-27	2024-12-31	1	2024-12-16 15:56:52	2024-12-16 15:57:31	2024-12-16 15:57:31
20	1	Test12	2	4	1	2024-12-21	2024-12-26	0	2024-12-18 08:05:16	2024-12-19 21:49:14	\N
\.


--
-- Data for Name: challenges_companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.challenges_companies (id, challenge_id, company_id, created_at, updated_at, deleted_at) FROM stdin;
16	15	23	2024-12-15 22:48:49	2024-12-15 22:48:49	\N
17	17	10	2024-12-16 00:15:33	2024-12-16 14:22:13	2024-12-16 14:22:13
18	17	23	2024-12-16 14:22:13	2024-12-16 15:47:51	2024-12-16 15:47:51
19	14	23	2024-12-16 14:22:54	2024-12-16 14:22:54	\N
20	18	23	2024-12-16 15:54:05	2024-12-16 15:54:26	2024-12-16 15:54:26
21	19	23	2024-12-16 15:56:52	2024-12-16 15:57:31	2024-12-16 15:57:31
22	20	23	2024-12-18 08:05:16	2024-12-18 08:05:16	\N
23	20	32	2024-12-19 18:03:51	2024-12-19 18:03:51	\N
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name, name_ar, status, created_at, updated_at, deleted_at, country_id) FROM stdin;
3	Dubaii	دبي	1	2025-03-24 11:53:17	2025-03-24 11:53:17	\N	1
2	Dubai	دبي	1	2025-03-24 11:52:45	2025-03-24 11:52:45	\N	1
1	Abu Dubai	ابو دبي	1	2025-03-19 11:01:35	2025-03-19 11:01:35	\N	1
\.


--
-- Data for Name: cms_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cms_pages (id, title, content, created_at, updated_at, sub_title_2, flag_logo, flag_title_1, flag_title_2, about_image, about_video, slogan, our_business_title, our_business_sub_title, our_business_left_image, our_business_right_image, our_mission_title, our_mission_logo, our_mission_description, our_vission_title, our_vission_logo, our_vission_description, our_core_value_title, our_core_value_logo, our_core_value_description, our_core_li_1, our_core_li_2, our_core_li_3, our_core_li_4, our_core_li_5, evalution_title, evalution_sub_title, team_title, team_sub_title, team_description, about_video_image, content_ar, status) FROM stdin;
2	Terms and conditions	<p>test</p>	2024-12-10 18:43:49	2024-12-17 20:15:40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
3	Privacy policy	<p>testasdas</p>	2024-12-10 18:43:54	2024-12-17 20:15:33	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0
1	About us	<p>asdasda123asdasd</p>	2024-12-10 18:35:10	2025-03-20 15:14:27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	<p>1112312312312312</p>	0
4	Video guide	<p>xdfasdfas</p>	2025-03-28 17:11:41	2025-03-28 17:12:07	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	<p>asdfasdfasd</p>	1
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
1	Alexandra Baker	mativyli@mailinator.com	Sit do in sint ratio	Magni doloribus non	2024-12-28 15:03:43	2024-12-28 15:03:43
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, name, created_at, updated_at, status, dial_code, name_ar, flag_icon) FROM stdin;
1	United Arab Emirates	2025-03-22 06:00:51	2025-03-24 11:52:09	1	+971	الإمارات العربية المتحدة	\N
\.


--
-- Data for Name: delivery_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery_types (id, translation_type_id, name, description, price_type, price, status, created_at, updated_at) FROM stdin;
1	9	Standard	Standard	free	0.00	1	2024-12-30 15:01:54	2024-12-30 15:08:33
2	8	DIGITAL DELIVERY	Arrives to your email immediately when completed.	free	0.00	1	2024-12-31 09:44:51	2024-12-31 14:48:17
3	7	Ciara Hull	Iure ipsam minima qu	free	0.00	1	2024-12-31 09:45:06	2024-12-31 09:45:26
4	7	Karly Pennington	Minus quis sunt dol	fixed	0.00	1	2024-12-31 09:45:15	2024-12-31 09:45:21
5	8	DIGITAL & PHYSICAL COPY	2-day express shipping via USPS. This price is for domestic shipping only, international shipping may incur a small fee.	fixed	12.00	1	2024-12-31 14:48:53	2024-12-31 14:48:53
6	11	DIGITAL DELIVERY	Arrives to your email immediately when completed.	free	0.00	1	2024-12-31 14:50:28	2024-12-31 14:50:28
7	11	DIGITAL & PHYSICAL COPY	2-day express shipping via USPS. This price is for domestic shipping only, international shipping may incur a small fee.	fixed	12.00	1	2024-12-31 14:50:54	2024-12-31 14:50:54
8	5	DIGITAL DELIVERY	Arrives to your email immediately when completed.	free	0.00	1	2024-12-31 14:51:37	2024-12-31 14:51:37
9	5	DIGITAL & PHYSICAL COPY	2-day express shipping via USPS. This price is for domestic shipping only, international shipping may incur a small fee.	fixed	12.00	1	2024-12-31 14:52:01	2024-12-31 14:52:01
10	4	DIGITAL DELIVERY	Arrives to your email immediately when completed.	free	0.00	1	2024-12-31 14:56:19	2024-12-31 14:56:19
11	3	DIGITAL DELIVERY	Arrives to your email immediately when completed.	free	0.00	1	2024-12-31 14:56:47	2024-12-31 14:56:47
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
2	testq	2	2024-04-20	2024-12-27	1	<p>asdd</p>	"[\\"1734335755675fdd0b842a5.jpg\\",\\"1734335763675fdd13d0457.jpg\\",\\"1734335769675fdd19d037d.png\\"]"	2024-12-11 20:51:39	2024-12-19 21:24:45
5	test123	2	2024-12-18	2024-12-20	1	<p>zxcssf</p>	"[\\"\\"]"	2024-12-17 20:43:55	2024-12-17 20:43:55
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
2	Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>	1	2024-12-11 10:52:14	2024-12-11 10:52:14
3	Test	<h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.Where does it come from?</p><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.Where does it come from?</p><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.Where does it come from?</p><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.Where does it come from?</p><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.Where does it come from?</p><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.adas</p>	1	2024-12-17 19:09:41	2024-12-17 19:25:53
4	asdasdas	<p>asdada</p>	1	2024-12-17 19:37:42	2024-12-17 19:37:42
5	Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>	1	2024-12-11 10:52:14	2024-12-11 10:52:14
6	Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>	1	2024-12-11 10:52:14	2024-12-11 10:52:14
7	Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>	1	2024-12-11 10:52:14	2024-12-11 10:52:14
8	Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>	1	2024-12-11 10:52:14	2024-12-11 10:52:14
9	Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>	1	2024-12-11 10:52:14	2024-12-11 10:52:14
10	Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>	1	2024-12-11 10:52:14	2024-12-11 10:52:14
11	Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>	1	2024-12-11 10:52:14	2024-12-11 10:52:14
12	Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>	1	2024-12-11 10:52:14	2024-12-11 10:52:14
13	Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>	1	2024-12-11 10:52:14	2024-12-11 10:52:14
14	Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>	1	2024-12-11 10:52:14	2024-12-11 10:52:14
15	Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>	1	2024-12-11 10:52:14	2024-12-11 10:52:14
16	Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>	1	2024-12-11 10:52:14	2024-12-11 10:52:14
17	Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>	1	2024-12-11 10:52:14	2024-12-11 10:52:14
18	Question 1, Lorem Ipsum is simply dummy text of the printing and typesetting industry ?	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>	1	2024-12-11 10:52:14	2024-12-11 10:52:14
\.


--
-- Data for Name: field_conditions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.field_conditions (id, category_id, attribute_id, operator, value, field_id, created_at, updated_at, target_field_id) FROM stdin;
\.


--
-- Data for Name: home_element_ads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_element_ads (id, ad_id, element_id, created_at, updated_at) FROM stdin;
1	4	3	\N	\N
\.


--
-- Data for Name: home_elements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_elements (id, name, name_ar, type, item_id, sort_order, created_at, updated_at) FROM stdin;
1	Badge For Verification	شارة للتحقق	badge	1	1	2025-03-26 19:16:15	2025-03-26 19:16:15
2	Popular Category Car	فئة السيارات الشعبية	popular-category	5	2	2025-03-26 19:16:15	2025-03-26 19:16:15
3	Popular car	Popular car	section	2	3	2025-04-07 08:48:54	2025-04-07 08:48:54
\.


--
-- Data for Name: home_logos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_logos (id, name, status, image, created_at, updated_at) FROM stdin;
1	travelers1	t	173568542567747531b2036.png	2024-12-31 22:50:26	2024-12-31 22:52:33
\.


--
-- Data for Name: home_page_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_page_settings (id, key, value, created_at, updated_at) FROM stdin;
1	why_choose_us_title	Effective Solutions for Your Document Needs	2025-01-01 00:05:20	2025-01-01 00:05:20
2	why_choose_us_content	At Tasheel, we provide tailored solutions for all your legal translation and documentation needs.Our team of experts ensures accuracy and compliance, guiding you through the complexities of legal processes. We prioritize efficiency and customer satisfaction, making the handling of your documents seamless and stress-free.	2025-01-01 00:05:20	2025-01-01 00:06:04
3	work_process_title	How it Work	2025-01-01 00:05:20	2025-01-01 00:08:46
4	work_process_content	Work Process	2025-01-01 00:05:20	2025-01-01 00:08:46
5	customer_experience_title	Customers Experience	2025-01-01 00:05:20	2025-01-01 00:08:46
6	insights_title	Find Out Our	2025-01-01 00:05:20	2025-01-01 00:08:46
7	insights_content	Insights & Intelligence	2025-01-01 00:05:20	2025-01-01 00:08:46
8	youtube_video_1	https://www.youtube.com/embed/-VK0axfge4A	2025-01-01 00:05:20	2025-01-01 00:31:06
9	youtube_video_2	https://www.youtube.com/embed/-VK0axfge4A	2025-01-01 00:05:20	2025-01-01 00:31:06
10	about_us_title	Your Tasks, Our Care	2025-01-01 01:11:28	2025-01-01 01:11:28
11	about_us_description	Tasheel is a leading provider of expert documentation and attestation services, specializing in legal attestation, translation, document processing assistance, and more. With years of experience and a commitment to accuracy and reliability, we ensure that your documents are authenticated and accepted worldwide. Our team of experts works diligently to provide efficient and hassle-free services, meeting your deadlines and exceeding your expectations. We specialize in bridging the gap between individuals, businesses, and governmental entities, providing expert legal translation, certified and notarized services, and support for embassy, consulate, municipality, and ministry processes. At Tasheel, we empower you to confidently and easily navigate legal and administrative challenges.	2025-01-01 01:11:28	2025-01-01 01:11:28
\.


--
-- Data for Name: insights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insights (id, name, title, content, image, status, created_at, updated_at) FROM stdin;
1	Evan Thomas	Workplace problems in your business?	Banter! Could “workplace banter” cause problems in your business? The short answer? Yes	1735688410677480dace1da.jpg	t	2024-12-31 23:40:10	2024-12-31 23:40:23
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
1	English	en	1	2024-12-21 09:50:53	2024-12-25 19:57:32	10.00
3	Spanish	es	1	2024-12-25 21:49:07	2024-12-25 21:49:07	10.00
4	Hindi	hi	1	2024-12-25 21:49:24	2024-12-25 21:49:24	10.00
5	Arabic1	ar	1	2024-12-25 21:49:50	2024-12-26 11:16:57	20.00
6	Punjabi	pn	1	2024-12-26 11:17:12	2024-12-26 11:17:12	\N
\.


--
-- Data for Name: looking_ads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.looking_ads (id, ad_id, category_id, created_at, updated_at) FROM stdin;
1	4	5	2025-03-27 04:31:48	2025-03-27 04:31:48
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
7	2024_12_05_125953_create_emirates_table	1
11	2024_12_05_164934_create_packages_table	2
12	2024_12_05_164957_create_packages_addons_table	2
19	2024_12_05_231725_create_challenges_table	3
20	2024_12_05_232702_create_challenges_companies_table	3
21	2024_12_05_191748_add_fields_to_users_table	4
22	2024_12_10_063233_remove_columns_from_companies_table	5
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
37	2024_12_21_090718_create_languages_table	19
38	2024_12_22_025151_create_site_settings_table	20
39	2024_12_22_202921_create_sliders_table	21
40	2024_12_22_202959_create_slider_buttons_table	22
41	2024_12_22_204258_create_sliders_table	23
42	2024_12_22_204302_create_slider_buttons_table	23
43	2024_12_24_110324_create_services_table	24
44	2024_12_24_110552_create_service_details_table	25
45	2024_12_24_110641_create_service_faqs_table	26
46	2024_12_25_144910_add_images_and_prices_to_services_table	27
47	2024_12_25_175336_create_quotes_table	28
48	2024_12_25_194520_add_translation_price_to_languages_table	29
49	2024_12_25_203316_create_services_types_table	30
50	2024_12_25_204612_create_services_types_table	31
51	2024_12_26_100307_recreate_services_types_table	32
52	2024_12_26_142627_create_service_pricing_table	33
53	2024_12_26_144059_create_service_pricing_table	34
54	2024_12_26_151334_create_service_pricing_table	35
55	2024_12_26_154043_recreate_services_types_table	36
56	2024_12_26_164628_create_translation_types_table	37
57	2024_12_27_213922_create_bookings_table	38
58	2024_12_28_091000_add_delivery_type_and_status_to_bookings_table	39
59	2024_12_28_145944_create_contact_us_table	40
60	2024_12_30_093601_create_translation_types_categories_table	41
61	2024_12_30_142149_create_delivery_types_table	42
62	2024_12_30_145032_create_delivery_types_table	43
63	2024_12_30_145523_create_delivery_types_table	44
64	2024_12_30_145932_create_delivery_types_table	45
65	2024_12_31_103127_add_columns_to_translation_types_categories_table	46
66	2024_12_31_173752_add_fields_to_bookings_table	47
67	2024_12_31_201549_create_why_choose_us_table	48
68	2024_12_31_204641_create_work_process_table	49
69	2024_12_31_224105_create_home_logos_table	50
70	2024_12_31_225708_create_reviews_table	51
71	2024_12_31_232951_create_insights_table	52
72	2024_12_31_235754_create_home_page_settings_table	53
73	2025_01_01_104657_alter_add_fileds_to_cms_pages	54
74	2025_01_01_115229_alter_add_fileds_to_cms_pages	54
76	2025_01_01_203806_add_delivery_method_price_and_vat_columns_to_bookings_table	55
77	2025_01_29_095444_create_service_atributes_table	56
78	2025_01_29_101737_create_service_atributes_table	57
79	2025_01_31_013415_create_service_atributes_value_table	58
84	2025_02_01_083459_add_bigint_field_id_to_service_booking_fields	63
85	2025_02_03_080934_add_target_field_id_to_field_conditions_table	64
86	2025_02_04_091806_create_services_bookings_table	65
88	2025_02_05_161345_modify_value_nullable_in_services_booking_fields	66
89	2025_02_05_162722_add_field_label_to_services_booking_fields	67
90	2025_02_05_163749_add_booking_id_to_services_bookings	68
91	2025_02_08_110950_add_billing_details_to_services_bookings	69
92	2025_02_08_145535_add_total_to_services_bookings_table	70
93	2025_02_11_144933_add_price_to_service_atributes_values	71
94	2025_02_11_153928_add_status_to_services_booking_table	72
98	2025_03_17_104054_create_categories_table	76
99	2025_01_29_101737_create_category_atributes_table	77
100	2025_01_31_013415_create_category_atributes_value_table	78
101	2025_01_31_031313_create_category_fields_table	79
102	2025_01_31_172442_create_field_conditions_table	80
105	2024_12_05_130018_create_cities_table	81
106	2025_03_19_110943_create_ads_table	82
107	2025_02_04_091921_create_ad_fields_table	83
110	2025_03_19_161754_create_ad_plans_table	86
111	2025_03_20_105759_create_promo_codes_table	87
112	2025_03_19_161432_create_pricing_plans_table	88
113	2025_03_19_161456_create_plan_durations_table	89
114	2024_12_05_125935_create_countries_table	90
115	2024_12_10_113225_add_status_to_countries_table	91
116	2024_12_16_143622_add_dial_code_to_countries_table	92
117	2025_03_22_123445_add_fields_in_users_table	93
118	2025_03_24_054249_create_nationalities_table	94
119	2025_03_24_074100_add_icon_field_in_parent_categories_table	95
120	2025_03_24_083100_alter_field_in_pages_table	96
121	2025_03_24_104842_add_field_in_cities_table	97
122	2025_03_24_105241_add_field_in_countries_table	98
123	2025_03_24_130954_add_field_in_parent_categories_table	99
124	2025_03_25_090533_create_badges_tables	100
125	2025_03_25_090550_create_popular_ads_tables	101
132	2025_03_25_090629_create_banners_table	102
133	2025_03_25_142837_create_sliders_table	103
134	2025_03_25_144456_create_slider_items_table	104
135	2025_03_26_121739_create_looking_ads_table	105
136	2025_03_26_183358_create_home_elements_table	106
137	2025_03_27_150718_add_field_in_banners_table	107
138	2025_03_27_161216_create_home_element_ads_table	108
139	2025_03_28_153919_create_verification_requests_table	109
140	2025_03_28_154516_add_field_in_users_table	110
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
2	App\\Models\\User	13
2	App\\Models\\User	16
2	App\\Models\\User	23
2	App\\Models\\User	32
2	App\\Models\\User	34
2	App\\Models\\User	35
2	App\\Models\\User	36
\.


--
-- Data for Name: nationalities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nationalities (id, name, name_ar, status, created_at, updated_at) FROM stdin;
1	Afghanistan	أفغانستان	1	2025-03-24 10:45:51	2025-03-24 10:45:51
2	Åland Islands	جزر أولاند	1	2025-03-24 10:45:51	2025-03-24 10:45:51
3	Albania	ألبانيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
4	Algeria	الجزائر	1	2025-03-24 10:45:51	2025-03-24 10:45:51
5	American Samoa	ساموا الأمريكية	1	2025-03-24 10:45:51	2025-03-24 10:45:51
6	Andorra	أندورا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
7	Angola	أنغولا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
8	Anguilla	أنغويلا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
9	Antarctica	القارة القطبية الجنوبية	1	2025-03-24 10:45:51	2025-03-24 10:45:51
10	Antigua and Barbuda	أنتيغوا وبربودا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
11	Argentina	الأرجنتين	1	2025-03-24 10:45:51	2025-03-24 10:45:51
12	Armenia	أرمينيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
13	Aruba	أروبا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
14	Australia	أستراليا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
15	Austria	النمسا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
16	Azerbaijan	أذربيجان	1	2025-03-24 10:45:51	2025-03-24 10:45:51
17	Bahamas	باهاماس	1	2025-03-24 10:45:51	2025-03-24 10:45:51
18	Bahrain	البحرين	1	2025-03-24 10:45:51	2025-03-24 10:45:51
19	Bangladesh	بنغلاديش	1	2025-03-24 10:45:51	2025-03-24 10:45:51
20	Barbados	بربادوس	1	2025-03-24 10:45:51	2025-03-24 10:45:51
21	Belarus	بيلاروسيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
22	Belgium	بلجيكا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
23	Belize	بليز	1	2025-03-24 10:45:51	2025-03-24 10:45:51
24	Benin	بنين	1	2025-03-24 10:45:51	2025-03-24 10:45:51
25	Bermuda	برمودا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
26	Bhutan	بوتان	1	2025-03-24 10:45:51	2025-03-24 10:45:51
27	Bolivia	بوليفيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
28	Bosnia and Herzegovina	البوسنة والهرسك	1	2025-03-24 10:45:51	2025-03-24 10:45:51
29	Botswana	بوتسوانا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
30	Bouvet Island	جزيرة بوفيه	1	2025-03-24 10:45:51	2025-03-24 10:45:51
31	Brazil	البرازيل	1	2025-03-24 10:45:51	2025-03-24 10:45:51
32	British Indian Ocean Territory	إقليم المحيط الهندي البريطاني	1	2025-03-24 10:45:51	2025-03-24 10:45:51
33	British Virgin Islands	جزر العذراء البريطانية	1	2025-03-24 10:45:51	2025-03-24 10:45:51
34	Brunei	بروناي	1	2025-03-24 10:45:51	2025-03-24 10:45:51
35	Bulgaria	بلغاريا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
36	Burkina Faso	بوركينا فاسو	1	2025-03-24 10:45:51	2025-03-24 10:45:51
37	Burundi	بوروندي	1	2025-03-24 10:45:51	2025-03-24 10:45:51
38	Cabo Verde	كابو فيردي	1	2025-03-24 10:45:51	2025-03-24 10:45:51
39	Cambodia	كمبوديا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
40	Cameroon	الكاميرون	1	2025-03-24 10:45:51	2025-03-24 10:45:51
41	Canada	كندا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
42	Caribbean Netherlands	الجزر الكاريبية الهولندية	1	2025-03-24 10:45:51	2025-03-24 10:45:51
43	Cayman Islands	جزر كايمان	1	2025-03-24 10:45:51	2025-03-24 10:45:51
44	Central African Republic	جمهورية أفريقيا الوسطى	1	2025-03-24 10:45:51	2025-03-24 10:45:51
45	Chad	تشاد	1	2025-03-24 10:45:51	2025-03-24 10:45:51
46	Chile	تشيلي	1	2025-03-24 10:45:51	2025-03-24 10:45:51
47	China	الصين	1	2025-03-24 10:45:51	2025-03-24 10:45:51
48	Christmas Island	جزيرة الكريسماس	1	2025-03-24 10:45:51	2025-03-24 10:45:51
49	Cocos (Keeling) Islands	جزر كوكوس	1	2025-03-24 10:45:51	2025-03-24 10:45:51
50	Colombia	كولومبيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
51	Comoros	جزر القمر	1	2025-03-24 10:45:51	2025-03-24 10:45:51
52	Congo Republic	جمهورية الكونغو	1	2025-03-24 10:45:51	2025-03-24 10:45:51
53	Cook Islands	جزر كوك	1	2025-03-24 10:45:51	2025-03-24 10:45:51
54	Costa Rica	كوستاريكا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
55	Croatia	كرواتيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
56	Cuba	كوبا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
57	Curaçao	كوراساو	1	2025-03-24 10:45:51	2025-03-24 10:45:51
58	Cyprus	قبرص	1	2025-03-24 10:45:51	2025-03-24 10:45:51
59	Czechia	التشيك	1	2025-03-24 10:45:51	2025-03-24 10:45:51
60	Denmark	الدنمارك	1	2025-03-24 10:45:51	2025-03-24 10:45:51
61	Djibouti	جيبوتي	1	2025-03-24 10:45:51	2025-03-24 10:45:51
62	Dominica	دومينيكا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
63	Dominican Republic	جمهورية الدومينيكان	1	2025-03-24 10:45:51	2025-03-24 10:45:51
64	DR Congo	جمهورية الكونغو الديمقراطية	1	2025-03-24 10:45:51	2025-03-24 10:45:51
65	Ecuador	الاكوادور	1	2025-03-24 10:45:51	2025-03-24 10:45:51
66	Egypt	مصر	1	2025-03-24 10:45:51	2025-03-24 10:45:51
67	El Salvador	السلفادور	1	2025-03-24 10:45:51	2025-03-24 10:45:51
68	Equatorial Guinea	غينيا الاستوائية	1	2025-03-24 10:45:51	2025-03-24 10:45:51
69	Eritrea	إريتريا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
70	Estonia	إستونيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
71	Eswatini	إسواتيني	1	2025-03-24 10:45:51	2025-03-24 10:45:51
72	Ethiopia	إثيوبيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
73	Falkland Islands	جزر فوكلاند	1	2025-03-24 10:45:51	2025-03-24 10:45:51
74	Faroe Islands	جزر فارو	1	2025-03-24 10:45:51	2025-03-24 10:45:51
75	Fiji	فيجي	1	2025-03-24 10:45:51	2025-03-24 10:45:51
76	Finland	فنلندا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
77	France	فرنسا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
78	French Guiana	غويانا الفرنسية	1	2025-03-24 10:45:51	2025-03-24 10:45:51
79	French Polynesia	بولينزيا الفرنسية	1	2025-03-24 10:45:51	2025-03-24 10:45:51
80	French Southern Territories	أراض فرنسية جنوبية	1	2025-03-24 10:45:51	2025-03-24 10:45:51
81	Gabon	الجابون	1	2025-03-24 10:45:51	2025-03-24 10:45:51
82	Gambia	غامبيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
83	Georgia	‫جورجيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
84	Germany	ألمانيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
85	Ghana	غانا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
86	Gibraltar	جبل طارق	1	2025-03-24 10:45:51	2025-03-24 10:45:51
87	Greece	اليونان	1	2025-03-24 10:45:51	2025-03-24 10:45:51
88	Greenland	جرينلاند	1	2025-03-24 10:45:51	2025-03-24 10:45:51
89	Grenada	غرينادا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
90	Guadeloupe	غوادلوب	1	2025-03-24 10:45:51	2025-03-24 10:45:51
91	Guam	غوام	1	2025-03-24 10:45:51	2025-03-24 10:45:51
92	Guatemala	غواتيمالا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
93	Guernsey	غيرنزي	1	2025-03-24 10:45:51	2025-03-24 10:45:51
94	Guinea	غينيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
95	Guinea-Bissau	غينيا بيساو	1	2025-03-24 10:45:51	2025-03-24 10:45:51
96	Guyana	غيانا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
97	Haiti	هايتي	1	2025-03-24 10:45:51	2025-03-24 10:45:51
98	Heard Island and McDonald Islands	جزيرة هيرد وجزر ماكدونالد	1	2025-03-24 10:45:51	2025-03-24 10:45:51
99	Honduras	هندوراس	1	2025-03-24 10:45:51	2025-03-24 10:45:51
100	Hong Kong	هونج كونج	1	2025-03-24 10:45:51	2025-03-24 10:45:51
101	Hungary	هنجاريا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
102	Iceland	آيسلندا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
103	India	الهند	1	2025-03-24 10:45:51	2025-03-24 10:45:51
104	Indonesia	أندونيسيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
105	Iran	إيران	1	2025-03-24 10:45:51	2025-03-24 10:45:51
106	Iraq	العراق	1	2025-03-24 10:45:51	2025-03-24 10:45:51
107	Ireland	أيرلندا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
108	Isle of Man	جزيرة مان	1	2025-03-24 10:45:51	2025-03-24 10:45:51
109	Italy	إيطاليا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
110	Ivory Coast	ساحل العاج	1	2025-03-24 10:45:51	2025-03-24 10:45:51
111	Jamaica	جامايكا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
112	Japan	اليابان	1	2025-03-24 10:45:51	2025-03-24 10:45:51
113	Jersey	جيرسي	1	2025-03-24 10:45:51	2025-03-24 10:45:51
114	Jordan	الأردن	1	2025-03-24 10:45:51	2025-03-24 10:45:51
115	Kazakhstan	كازاخستان	1	2025-03-24 10:45:51	2025-03-24 10:45:51
116	Kenya	كينيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
117	Kiribati	كيريباتي	1	2025-03-24 10:45:51	2025-03-24 10:45:51
118	Kosovo	كوسوفو	1	2025-03-24 10:45:51	2025-03-24 10:45:51
119	Kuwait	الكويت	1	2025-03-24 10:45:51	2025-03-24 10:45:51
120	Kyrgyzstan	قيرغيزستان	1	2025-03-24 10:45:51	2025-03-24 10:45:51
121	Laos	لاوس	1	2025-03-24 10:45:51	2025-03-24 10:45:51
122	Latvia	لاتفيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
123	Lebanon	لبنان	1	2025-03-24 10:45:51	2025-03-24 10:45:51
124	Lesotho	ليسوتو	1	2025-03-24 10:45:51	2025-03-24 10:45:51
125	Liberia	ليبيريا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
126	Libya	ليبيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
127	Liechtenstein	ليختنشتاين	1	2025-03-24 10:45:51	2025-03-24 10:45:51
128	Lithuania	ليتوانيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
129	Luxembourg	لوكسمبورغ	1	2025-03-24 10:45:51	2025-03-24 10:45:51
130	Macao	ماكاو	1	2025-03-24 10:45:51	2025-03-24 10:45:51
131	Madagascar	مدغشقر	1	2025-03-24 10:45:51	2025-03-24 10:45:51
132	Malawi	مالاوي	1	2025-03-24 10:45:51	2025-03-24 10:45:51
133	Malaysia	ماليزيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
134	Maldives	المالديف	1	2025-03-24 10:45:51	2025-03-24 10:45:51
135	Mali	مالي	1	2025-03-24 10:45:51	2025-03-24 10:45:51
136	Malta	مالطا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
137	Marshall Islands	جزر مارشال	1	2025-03-24 10:45:51	2025-03-24 10:45:51
138	Martinique	مارتينيك	1	2025-03-24 10:45:51	2025-03-24 10:45:51
139	Mauritania	موريتانيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
140	Mauritius	موريشيوس	1	2025-03-24 10:45:51	2025-03-24 10:45:51
141	Mayotte	مايوت	1	2025-03-24 10:45:51	2025-03-24 10:45:51
142	Mexico	المكسيك	1	2025-03-24 10:45:51	2025-03-24 10:45:51
143	Micronesia	ولايات ميكرونيسيا المتحدة	1	2025-03-24 10:45:51	2025-03-24 10:45:51
144	Moldova	مولدوفا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
145	Monaco	موناكو	1	2025-03-24 10:45:51	2025-03-24 10:45:51
146	Mongolia	منغوليا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
147	Montenegro	مونتينيغرو	1	2025-03-24 10:45:51	2025-03-24 10:45:51
148	Montserrat	مونتسرات	1	2025-03-24 10:45:51	2025-03-24 10:45:51
149	Morocco	المغرب	1	2025-03-24 10:45:51	2025-03-24 10:45:51
150	Mozambique	موزمبيق	1	2025-03-24 10:45:51	2025-03-24 10:45:51
151	Myanmar	ميانمار	1	2025-03-24 10:45:51	2025-03-24 10:45:51
152	Namibia	ناميبيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
153	Nauru	ناورو	1	2025-03-24 10:45:51	2025-03-24 10:45:51
154	Nepal	نيبال	1	2025-03-24 10:45:51	2025-03-24 10:45:51
155	Netherlands	هولندا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
156	Netherlands Antilles	جزر الأنتيل الهولندية	1	2025-03-24 10:45:51	2025-03-24 10:45:51
157	New Caledonia	كاليدونيا الجديدة	1	2025-03-24 10:45:51	2025-03-24 10:45:51
158	New Zealand	نيوزيلندا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
159	Nicaragua	نيكاراغوا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
160	Niger	النيجر	1	2025-03-24 10:45:51	2025-03-24 10:45:51
161	Nigeria	نيجيريا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
162	Niue	نييوي	1	2025-03-24 10:45:51	2025-03-24 10:45:51
163	Norfolk Island	جزيرة نورفولك	1	2025-03-24 10:45:51	2025-03-24 10:45:51
164	North Korea	كوريا الشمالية	1	2025-03-24 10:45:51	2025-03-24 10:45:51
165	North Macedonia	مقدونيا الشمالية	1	2025-03-24 10:45:51	2025-03-24 10:45:51
166	Northern Mariana Islands	جزر ماريانا الشمالية	1	2025-03-24 10:45:51	2025-03-24 10:45:51
167	Norway	النرويج	1	2025-03-24 10:45:51	2025-03-24 10:45:51
168	Oman	سلطنة عمان	1	2025-03-24 10:45:51	2025-03-24 10:45:51
169	Pakistan	باكستان	1	2025-03-24 10:45:51	2025-03-24 10:45:51
170	Palau	بالاو	1	2025-03-24 10:45:51	2025-03-24 10:45:51
171	Palestine	فلسطين	1	2025-03-24 10:45:51	2025-03-24 10:45:51
172	Panama	بنما	1	2025-03-24 10:45:51	2025-03-24 10:45:51
173	Papua New Guinea	بابوا غينيا الجديدة	1	2025-03-24 10:45:51	2025-03-24 10:45:51
174	Paraguay	باراغواي	1	2025-03-24 10:45:51	2025-03-24 10:45:51
175	Peru	بيرو	1	2025-03-24 10:45:51	2025-03-24 10:45:51
176	Philippines	الفلبين	1	2025-03-24 10:45:51	2025-03-24 10:45:51
177	Pitcairn Islands	جزر بيتكيرن	1	2025-03-24 10:45:51	2025-03-24 10:45:51
178	Poland	بولندا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
179	Portugal	البرتغال	1	2025-03-24 10:45:51	2025-03-24 10:45:51
180	Puerto Rico	بورتوريكو	1	2025-03-24 10:45:51	2025-03-24 10:45:51
181	Qatar	قطر	1	2025-03-24 10:45:51	2025-03-24 10:45:51
182	Réunion	ريونيون	1	2025-03-24 10:45:51	2025-03-24 10:45:51
183	Romania	رومانيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
184	Russia	روسيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
185	Rwanda	رواندا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
186	Saint Barthélemy	سان بارتيلمي	1	2025-03-24 10:45:51	2025-03-24 10:45:51
187	Saint Helena	سانت هيلينا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
188	Saint Kitts and Nevis	سانت كيتس ونيفيس	1	2025-03-24 10:45:51	2025-03-24 10:45:51
189	Saint Lucia	سانت لوسيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
190	Saint Martin	سانت مارتن	1	2025-03-24 10:45:51	2025-03-24 10:45:51
191	Saint Pierre and Miquelon	سان بيير وميكلون	1	2025-03-24 10:45:51	2025-03-24 10:45:51
192	Saint Vincent and the Grenadines	سانت فينسنت والغرينادين	1	2025-03-24 10:45:51	2025-03-24 10:45:51
193	Samoa	ساموا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
194	San Marino	سان مارينو	1	2025-03-24 10:45:51	2025-03-24 10:45:51
195	São Tomé and Príncipe	ساو تومي وبرينسيب	1	2025-03-24 10:45:51	2025-03-24 10:45:51
196	Saudi Arabia	السعودية	1	2025-03-24 10:45:51	2025-03-24 10:45:51
197	Senegal	السنغال	1	2025-03-24 10:45:51	2025-03-24 10:45:51
198	Serbia	صربيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
199	Seychelles	سيشل	1	2025-03-24 10:45:51	2025-03-24 10:45:51
200	Sierra Leone	سيراليون	1	2025-03-24 10:45:51	2025-03-24 10:45:51
201	Singapore	سنغافورة	1	2025-03-24 10:45:51	2025-03-24 10:45:51
202	Sint Maarten	سانت مارتن	1	2025-03-24 10:45:51	2025-03-24 10:45:51
203	Slovakia	سلوفاكيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
204	Slovenia	سلوفينيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
205	Solomon Islands	جزر سليمان	1	2025-03-24 10:45:51	2025-03-24 10:45:51
206	Somalia	الصومال	1	2025-03-24 10:45:51	2025-03-24 10:45:51
207	South Africa	جنوب أفريقيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
208	South Georgia and South Sandwich Islands	جورجيا الجنوبية وجزر ساندويتش الجنوبية	1	2025-03-24 10:45:51	2025-03-24 10:45:51
209	South Korea	كوريا الجنوبية	1	2025-03-24 10:45:51	2025-03-24 10:45:51
210	South Sudan	جنوب السودان	1	2025-03-24 10:45:51	2025-03-24 10:45:51
211	Spain	إسبانيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
212	Sri Lanka	سريلانكا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
213	Sudan	السودان	1	2025-03-24 10:45:51	2025-03-24 10:45:51
214	Suriname	سورينام	1	2025-03-24 10:45:51	2025-03-24 10:45:51
215	Svalbard and Jan Mayen	سفالبارد ويان ماين	1	2025-03-24 10:45:51	2025-03-24 10:45:51
216	Sweden	السويد	1	2025-03-24 10:45:51	2025-03-24 10:45:51
217	Switzerland	سويسرا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
218	Syria	سوريا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
219	Taiwan	تايوان	1	2025-03-24 10:45:51	2025-03-24 10:45:51
220	Tajikistan	طاجيكستان	1	2025-03-24 10:45:51	2025-03-24 10:45:51
221	Tanzania	تنزانيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
222	Thailand	تايلاند	1	2025-03-24 10:45:51	2025-03-24 10:45:51
223	Timor-Leste	تيمور الشرقية	1	2025-03-24 10:45:51	2025-03-24 10:45:51
224	Togo	توجو	1	2025-03-24 10:45:51	2025-03-24 10:45:51
225	Tokelau	توكيلاو	1	2025-03-24 10:45:51	2025-03-24 10:45:51
226	Tonga	تونغا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
227	Trinidad and Tobago	ترينيداد وتوباغو	1	2025-03-24 10:45:51	2025-03-24 10:45:51
228	Tunisia	تونس	1	2025-03-24 10:45:51	2025-03-24 10:45:51
229	Turkey	تركيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
230	Turkmenistan	تركمانستان	1	2025-03-24 10:45:51	2025-03-24 10:45:51
231	Turks and Caicos Islands	جزر توركس وكايكوس	1	2025-03-24 10:45:51	2025-03-24 10:45:51
232	Tuvalu	توفالو	1	2025-03-24 10:45:51	2025-03-24 10:45:51
233	U.S. Minor Outlying Islands	جزر الولايات المتحدة الصغيرة النائية	1	2025-03-24 10:45:51	2025-03-24 10:45:51
234	U.S. Virgin Islands	جزر العذراء الأمريكية	1	2025-03-24 10:45:51	2025-03-24 10:45:51
235	Uganda	أوغندا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
236	Ukraine	أوكرانيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
237	United Arab Emirates	الإمارات العربية المتحدة	1	2025-03-24 10:45:51	2025-03-24 10:45:51
238	United Kingdom	المملكة المتحدة	1	2025-03-24 10:45:51	2025-03-24 10:45:51
239	United States of America	الولايات المتحدة الأمريكية	1	2025-03-24 10:45:51	2025-03-24 10:45:51
240	Uruguay	أوروغواي	1	2025-03-24 10:45:51	2025-03-24 10:45:51
241	Uzbekistan	أوزبكستان	1	2025-03-24 10:45:51	2025-03-24 10:45:51
242	Vanuatu	فانواتو	1	2025-03-24 10:45:51	2025-03-24 10:45:51
243	Vatican City	مدينة الفاتيكان	1	2025-03-24 10:45:51	2025-03-24 10:45:51
244	Venezuela	فنزويلا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
245	Vietnam	فيتنام	1	2025-03-24 10:45:51	2025-03-24 10:45:51
246	Wallis and Futuna	واليس وفوتونا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
247	Western Sahara	الصحراء الغربية	1	2025-03-24 10:45:51	2025-03-24 10:45:51
248	Yemen	اليمن	1	2025-03-24 10:45:51	2025-03-24 10:45:51
249	Zambia	زامبيا	1	2025-03-24 10:45:51	2025-03-24 10:45:51
250	Zimbabwe	زيمبابوي	1	2025-03-24 10:45:51	2025-03-24 10:45:51
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
15	Wing Tucker	25	0	2024-12-07 17:57:28	2024-12-07 20:45:17	\N
16	Raju	35	1	2024-12-07 21:25:17	2024-12-07 21:10:03	\N
17	Duncan Colon	45	1	2024-12-07 17:25:54	2024-12-07 17:25:54	\N
18	Wynne Bishop	11111	1	2024-12-07 17:26:17	2024-12-07 17:26:17	\N
19	Malik Stanley	12	0	2024-12-07 18:24:56	2024-12-07 20:45:30	\N
20	Sade Cotton	12	1	2024-12-07 18:25:50	2024-12-07 22:25:50	\N
21	Madonna Tyler	12	0	2024-12-07 18:27:28	2024-12-07 22:27:28	\N
22	Christopher Rowland	12	1	2024-12-07 18:28:41	2024-12-07 20:30:00	\N
23	Neville Kennedy	122	1	2024-12-07 18:30:00	2024-12-16 13:52:11	\N
24	Drew Hoffman	12	1	2024-12-07 18:33:52	2024-12-07 22:33:52	\N
25	April Foster	12	1	2024-12-07 18:34:39	2024-12-07 18:34:39	\N
26	Craig Caldwell	2	1	2024-12-07 19:35:53	2024-12-12 06:49:19	\N
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
36	17	gdfgdfgdf	\N	2024-12-07 17:25:54	2024-12-07 21:04:29
37	18	Reiciendis suscipit	\N	2024-12-07 17:26:17	2024-12-07 17:26:17
38	19	Velit earum quia aut	\N	2024-12-07 22:24:56	2024-12-07 22:24:56
39	20	Dicta aut totam nisi	\N	2024-12-07 22:25:50	2024-12-07 22:25:50
40	21	Aliquip necessitatib	\N	2024-12-07 22:27:28	2024-12-07 22:27:28
41	22	In esse facere quae	\N	2024-12-07 18:28:41	2024-12-07 18:28:41
42	23	Ad provident non en	\N	2024-12-07 18:30:00	2024-12-07 18:30:00
43	24	Voluptas quaerat ut	\N	2024-12-07 22:33:52	2024-12-07 22:33:52
44	25	Ad temporibus possim	\N	2024-12-07 18:34:39	2024-12-07 18:34:39
45	26	Ullam aliquid beatae	\N	2024-12-07 19:35:53	2024-12-07 19:35:53
46	16	newwwwwwwwwwww	\N	2024-12-07 21:09:35	2024-12-07 21:09:35
47	16	Rajuuuuuuuuuuuu	\N	2024-12-07 21:10:03	2024-12-07 21:10:03
48	16	bfd	\N	2024-12-07 21:10:59	2024-12-07 21:10:59
79	27	test	\N	2024-12-17 21:01:37	2024-12-17 21:01:37
\.


--
-- Data for Name: parent_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parent_categories (id, name, name_ar, status, created_at, updated_at, icon, sort_order) FROM stdin;
1	Motors	محرك	1	2025-03-20 15:03:14	2025-03-24 10:58:10	3XsGczmV0bPIJBchBP2rZ3UbYy6Ibx2tYaFrSbIi.png	0
2	Property For Rent	عقار للإيجار	1	2025-03-20 15:03:45	2025-03-24 11:00:54	XQYccOdIC5WajZTmXPidwz33W3kQqpzo8jFH0Pg5.png	0
3	Property For Sale	عقار للبيع	1	2025-03-24 11:02:15	2025-03-24 11:02:15	\N	0
4	Classified	مبوب	1	2025-03-24 12:03:27	2025-03-24 12:03:27	hir0euzvvH5LCBhfSoxC1ysXh8TXPiJp0PKMzYXa.png	0
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
-- Data for Name: plan_durations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plan_durations (id, pricing_plan_id, duration, price, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: popular_ads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.popular_ads (id, ad_id, category_id, created_at, updated_at) FROM stdin;
1	4	5	2025-03-27 04:32:07	2025-03-27 04:32:07
\.


--
-- Data for Name: pricing_plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pricing_plans (id, name, name_ar, duration, price, currency, description, description_ar, status, created_at, updated_at) FROM stdin;
1	Free	حر	30	0	SYP	Free	حر	1	2025-03-22 05:18:01	2025-03-22 05:18:01
2	One month	One month	30 days	100	AED	Its one month plan	Its one month plan	1	2025-04-07 14:20:29	2025-04-07 14:20:29
\.


--
-- Data for Name: promo_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promo_codes (id, code, type, value, start_date, end_date, total_limit, user_limit, daily_limit, status, created_at, updated_at) FROM stdin;
1	50PERCENT	percentage	50	2025-03-20	2025-03-31	100	2	1	1	2025-03-20 15:15:07	2025-03-20 15:15:07
\.


--
-- Data for Name: quotes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quotes (id, name, email, from_lang, to_lang, total_pages, word_count, service_id, created_at, updated_at) FROM stdin;
1	John Doe	john@example.com	english	spanish	10	2000	5	2024-12-25 18:01:37	2024-12-25 18:01:37
2	tsttt	test@gmail.com	arabic	chinese	12	4	5	2024-12-25 18:05:07	2024-12-25 18:05:07
3	tsttt	test@gmail.com	arabic	chinese	12	4	5	2024-12-25 18:06:33	2024-12-25 18:06:33
4	asda	admin@hadify.com	arabic	chinese	12	12	5	2024-12-25 18:06:55	2024-12-25 18:06:55
7	asda	admin@tasheel.com	english	english	12	1234	5	2024-12-25 18:15:04	2024-12-25 18:15:04
8	asdad	admin@hadify.com	english	chinese	12	21	5	2024-12-25 18:15:55	2024-12-25 18:15:55
11	asdas	admin@admin.com	arabic	chinese	21	21	5	2024-12-25 18:21:56	2024-12-25 18:21:56
12	asdas	test@gmail.com	english	hindi	12	123	5	2024-12-25 18:24:26	2024-12-25 18:24:26
13	asdasd	admin@hadify.com	arabic	chinese	21	22	5	2024-12-25 18:26:24	2024-12-25 18:26:24
14	asda	admin@admin.com	english	chinese	21	22	5	2024-12-25 19:00:07	2024-12-25 19:00:07
15	testtttdesc	test@gmail.com	arabic	english,chinese	11	100	5	2024-12-25 21:05:10	2024-12-25 21:05:10
16	asdad	admin@admin.com	english	chinese,spanish	120	222222	9	2024-12-25 21:30:46	2024-12-25 21:30:46
17	testtstst	testing@gmail.com	Hindi	Spanish,Arabic	11	2222	9	2024-12-25 22:04:43	2024-12-25 22:04:43
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, name, status, review, image, designation, rating, created_at, updated_at) FROM stdin;
1	Jacob Leonardo1	t	While running an early-stage startup, everything feels hard; that's why it's been so nice to have our accounting feel easy. We recommend Qetus	173568679567747a8b0bae6.png	CEO Founder	4.0	2024-12-31 23:12:17	2024-12-31 23:14:54
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
2	Customer	web	2024-12-05 15:22:16	2024-12-05 15:22:16
\.


--
-- Data for Name: service_atributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_atributes (id, service_id, name, status, created_at, updated_at, deleted_at) FROM stdin;
2	10	test	1	2025-01-29 10:50:25	2025-01-29 10:50:25	\N
3	10	test2	1	2025-01-31 01:59:15	2025-01-31 01:59:15	\N
4	10	test3	1	2025-01-31 01:59:30	2025-01-31 01:59:30	\N
5	9	test1	1	2025-01-31 02:00:22	2025-01-31 02:00:22	\N
6	9	test2	1	2025-01-31 02:00:57	2025-01-31 02:00:57	\N
7	11	Licence Type	1	2025-01-31 06:55:18	2025-01-31 06:55:18	\N
8	11	Region	1	2025-01-31 06:56:43	2025-01-31 06:56:43	\N
\.


--
-- Data for Name: service_atributes_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_atributes_value (id, service_id, attribute_id, name, status, created_at, updated_at, deleted_at, price) FROM stdin;
1	10	2	test	1	2025-01-31 01:52:54	2025-01-31 01:52:54	\N	0.00
2	9	5	test	1	2025-01-31 02:01:49	2025-01-31 02:02:11	\N	0.00
3	11	7	Local	1	2025-01-31 06:55:37	2025-01-31 06:55:37	\N	0.00
4	11	7	International	1	2025-01-31 06:55:55	2025-01-31 06:55:55	\N	0.00
5	11	8	West Branch	1	2025-01-31 06:57:31	2025-01-31 06:57:31	\N	0.00
6	11	8	Gaza	1	2025-01-31 06:57:46	2025-01-31 06:57:46	\N	0.00
7	11	7	Dubai	1	2025-02-11 14:55:07	2025-02-11 14:55:34	\N	13.01
\.


--
-- Data for Name: service_booking_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_booking_fields (id, service_id, type, label, name, options, attribute_id, file_types, created_at, updated_at, field_id) FROM stdin;
37	11	text	Full Name	Full Name	\N	\N	\N	2025-02-07 10:39:59	2025-02-07 10:39:59	0
38	11	text	Email	Email	\N	\N	\N	2025-02-07 10:39:59	2025-02-07 10:39:59	1
39	11	text	Phone	Phone	\N	\N	\N	2025-02-07 10:39:59	2025-02-07 10:39:59	2
40	11	text	City	City	\N	\N	\N	2025-02-07 10:39:59	2025-02-07 10:39:59	3
41	11	select	Region	Region	\N	8	\N	2025-02-07 10:39:59	2025-02-07 10:39:59	4
42	11	select	Licence Type	Licence Type	\N	7	\N	2025-02-07 10:39:59	2025-02-07 10:39:59	5
43	11	text	Year Validity	Year Validity	\N	\N	\N	2025-02-07 10:39:59	2025-02-07 10:39:59	6
44	11	file	Upload Licence	Upload Licence	\N	\N	png,pdf	2025-02-07 10:39:59	2025-02-07 10:39:59	7
\.


--
-- Data for Name: service_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_details (id, service_id, title, content, created_at, updated_at) FROM stdin;
35	9	asdasda	asdasdas	2024-12-26 18:03:14	2024-12-26 18:03:14
36	9	asdada	asdadadas	2024-12-26 18:03:14	2024-12-26 18:03:14
37	9	asdasda	adasdas	2024-12-26 18:03:14	2024-12-26 18:03:14
38	9	adasdas	asdasdadsasd	2024-12-26 18:03:14	2024-12-26 18:03:14
43	5	Background Checks	These cases are perfectly simple and easy to distinguish. In a free hour when our power.	2024-12-27 13:41:24	2024-12-27 13:41:24
44	5	Profile Assessments	Indignation and men who are so beguiled and demoralized by the charms blinded.	2024-12-27 13:41:24	2024-12-27 13:41:24
45	5	Position Description	Trouble that are bound to ensue and equal blame belongs those who fail in their duty.	2024-12-27 13:41:24	2024-12-27 13:41:24
46	5	HR Functions	<div class="description_box">\r\n                       <p>Nothing prevents our being able to do what we like best every pleasure is to be welcomed &amp; every pain avoided certain circumstances.</p>\r\n                    </div>\r\n                           <!--===============spacing==============-->\r\n                           <div class="pd_bottom_25"></div>\r\n                           <!--===============spacing==============-->\r\n                    <div class="content_box_cn style_one">\r\n                       <div class="txt_content">\r\n                          <h3>\r\n                             <a href="#" target="_blank" rel="nofollow">Open Communication</a>\r\n                          </h3>\r\n                          <p>Equal blame belongs to those who fail in their duty through weakness same duty.</p>\r\n                       </div>\r\n                    </div>\r\n                    \r\n                    <div class="content_box_cn  style_one">\r\n                       <div class="txt_content">\r\n                          <h3>\r\n                             <a href="#" target="_blank" rel="nofollow">Sharing a Vision</a>\r\n                          </h3>\r\n                          <p>Business it will frequently occur that pleasures have to be repudiated.</p>\r\n                       </div>\r\n                    </div>\r\n                    \r\n                    <div class="content_box_cn  style_one">\r\n                       <div class="txt_content">\r\n                          <h3>\r\n                             <a href="#" target="_blank" rel="nofollow">Recognizing Employee</a>\r\n                          </h3>\r\n                          <p>Holds in these matter to this principle selection he rejects pleasures to secure.</p>\r\n                       </div>\r\n                    </div>	2024-12-27 13:41:24	2024-12-27 13:41:24
47	10	asdasdasd	asdasdasasdads	2024-12-30 17:19:09	2024-12-30 17:19:09
48	10	asdasdas	adadasd	2024-12-30 17:19:09	2024-12-30 17:19:09
49	10	asdasdasd	adasdasdssas	2024-12-30 17:19:09	2024-12-30 17:19:09
50	10	adada	asdasdasd	2024-12-30 17:19:09	2024-12-30 17:19:09
51	11	asdasd	asdas	2025-01-31 06:54:00	2025-01-31 06:54:00
52	11	sdasd	asdas	2025-01-31 06:54:00	2025-01-31 06:54:00
53	11	sdas	asdasd	2025-01-31 06:54:00	2025-01-31 06:54:00
54	11	asdas	asdasdad	2025-01-31 06:54:00	2025-01-31 06:54:00
\.


--
-- Data for Name: service_faqs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_faqs (id, service_id, question, answer, created_at, updated_at) FROM stdin;
32	9	adadas	adasdas	2024-12-26 18:03:14	2024-12-26 18:03:14
33	9	adasd	adasdsa	2024-12-26 18:03:14	2024-12-26 18:03:14
36	5	Who is Tasheel Legal Transilation?1	Nor again is there anyone who loves or pursues or desires to obtain\r\n                                       pain itself because it is pains but because occasionally circumstances\r\n                                       occurs great pleasure take a trivial of us.	2024-12-27 13:41:24	2024-12-27 13:41:24
37	5	What recruitment services do you offer?	Serenity Is Multi-Faceted Blockchain Based Ecosystem, Energy Retailer For The People, Focusing On The Promotion Of Sustainable Living, Renewable Energy Production And Smart Energy Grid Utility Services.	2024-12-27 13:41:24	2024-12-27 13:41:24
38	5	How can I register a job?	Serenity Is Multi-Faceted Blockchain Based Ecosystem, Energy Retailer For The People, Focusing On The Promotion Of Sustainable Living, Renewable Energy Production And Smart Energy Grid Utility Services.	2024-12-27 13:41:24	2024-12-27 13:41:24
39	10	asdas	adasda	2024-12-30 17:19:09	2024-12-30 17:19:09
40	10	adad	adasdasds	2024-12-30 17:19:09	2024-12-30 17:19:09
41	11	sdasdas	sdasda	2025-01-31 06:54:00	2025-01-31 06:54:00
42	11	sdasd	sdas	2025-01-31 06:54:00	2025-01-31 06:54:00
\.


--
-- Data for Name: service_pricing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_pricing (id, service_id, translation_from, translation_to, price, status, created_at, updated_at) FROM stdin;
1	2	3	5	12.00	1	2024-12-26 15:20:56	2024-12-26 17:46:05
2	2	1	4	120.00	1	2024-12-27 13:40:43	2024-12-27 13:40:43
3	2	1	5	12.00	1	2024-12-27 13:41:04	2024-12-27 13:41:04
4	5	5	4	20.00	1	2025-01-31 07:30:06	2025-01-31 07:30:06
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, title, service_type_id, subtitle, description, status, created_at, updated_at, background_image, service_image, other_image, price_from, price_to) FROM stdin;
5	Legal Translation	2	Specialized translation of legal documents ensuring accuracy and compliance with legal standards.	<p><span style="color: rgb(74, 78, 86); font-family: Inter, sans-serif; font-size: 16px;">Our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty.<br></span><span style="color: rgb(74, 78, 86); font-family: Inter, sans-serif; font-size: 16px;">Our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty.<br></span><span style="color: rgb(74, 78, 86); font-family: Inter, sans-serif; font-size: 16px;">Our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty.</span><span style="color: rgb(74, 78, 86); font-family: Inter, sans-serif; font-size: 16px;"></span><span style="color: rgb(74, 78, 86); font-family: Inter, sans-serif; font-size: 16px;"></span></p>	1	2024-12-24 11:56:22	2024-12-27 13:41:24	1735143740676c313cd5177.jpg	1735143741676c313da2f92.jpg	1735143741676c313da32d3.jpg	20	60
9	Certified Translation	3	Specialized translation of legal documents ensuring accuracy and compliance with legal standards.	<p><span style="color: rgb(74, 78, 86); font-family: Inter, sans-serif; font-size: 16px;">Our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty.</span></p>	1	2024-12-25 21:28:53	2024-12-26 18:03:14	1735162133676c79155404a.jpg	1735166702676c8aeea206a.jpg	1735162133676c791556ffc.jpg	10	1000
10	Police verification	4	asdasdada	<p>dsasdasdasdasdasdasdasdadads</p>	1	2024-12-26 17:58:48	2024-12-30 17:19:09	1735235927676d9957b92a2.jpg	1735235928676d995883e55.jpg	1735235928676d995884186.png	12	123
11	Driving License (Local/ International)	5	Driving License (Local/ International)	<p><span style="color: rgb(33, 37, 41); font-family: Poppins, sans-serif; text-wrap-mode: nowrap;">Driving License (Local/ International)</span></p>	1	2025-01-31 06:54:00	2025-01-31 06:54:00	1738306439679c7387490c7.jpg	1738306440679c738802f0c.png	1738306440679c7388032f5.jpg	12	120
\.


--
-- Data for Name: services_bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services_bookings (id, service_id, created_at, updated_at, booking_id, first_name, last_name, company_name, country, street_address, apartment, city, state, phone, email, file_namesconfirm, order_notes, total, status) FROM stdin;
21	11	2025-02-05 16:33:15	2025-02-05 16:33:15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	Pending
22	11	2025-02-05 16:39:55	2025-02-05 16:39:55	#TS437031098	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	Pending
23	11	2025-02-07 06:56:19	2025-02-07 06:56:19	#TS630711806	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	Pending
24	11	2025-02-07 06:57:08	2025-02-07 06:57:08	#TS773525448	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	Pending
25	11	2025-02-08 11:26:14	2025-02-08 11:26:14	#TS562287691	Shay	Stanton	Hubbard Delaney Inc	UAE1	Eos do unde ut arch	Excepteur commodo ma	Est voluptas quia ac	Culpa eaque fuga B	+1 (714) 523-4407	wypacyje@mailinator.com	\N	Non ipsa dolore opt	0.00	Pending
26	11	2025-02-08 11:38:30	2025-02-08 11:38:30	#TS269568670	Simone	Wood	Lott Mckay Co	Maskat	Nihil est rerum dol	Odio sit inventore	Rerum est ad quam q	Dolore voluptate fug	+1 (997) 255-9662	zupujugix@mailinator.com	\N	Dolore ut et est cup	0.00	Pending
27	11	2025-02-08 11:39:36	2025-02-08 11:39:36	#TS285620534	Darrel	Todd	Burch Rocha Inc	Maskat	Aut veniam similiqu	Sed eum qui eos sunt	Ea sunt sunt aut et	Eos iure aliquam ass	+1 (805) 183-6762	lupavub@mailinator.com	\N	Ipsa sint voluptate	0.00	Pending
28	11	2025-02-08 11:41:42	2025-02-08 11:41:42	#TS498467896	Ivy	Barrera	Lewis Frederick LLC	UAE1	Qui nemo saepe offic	Esse ut omnis sunt e	Impedit odio eaque	Obcaecati possimus	+1 (564) 226-3612	nypera@mailinator.com	\N	Architecto deserunt	0.00	Pending
29	11	2025-02-08 11:44:18	2025-02-08 11:44:18	#TS260540127	Sopoline	Snyder	Emerson Snyder Plc	Camilla Benton	Doloremque nemo sint	Quidem ab exercitati	Neque ad sed consequ	Natus proident ipsu	+1 (747) 326-3428	qypixuzym@mailinator.com	\N	Tenetur sint cupidit	0.00	Pending
30	11	2025-02-08 11:47:21	2025-02-08 11:47:21	#TS809715464	Miranda	Gates	Holloway and Mcdowell Inc	Canada	Sed eu qui officiis	Eos in cupiditate pr	Lorem repellendus D	Pariatur A neque as	+1 (212) 482-6149	cahily@mailinator.com	\N	Quisquam et ipsa co	0.00	Pending
31	11	2025-02-11 15:41:54	2025-02-11 15:41:54	#TS448681406	Griffith	Duffy	Mann Simon LLC	Canada	Enim quibusdam occae	Laboris nihil conseq	A blanditiis quibusd	Aliquip ut fugit ip	+1 (736) 859-3897	nymogujig@mailinator.com	\N	Incididunt do quia a	13.01	Pending
32	11	2025-02-11 15:45:12	2025-02-11 15:59:47	#TS753416093	Kiona	Keith	Byers and Mueller LLC	Maskat	Qui ipsum qui eaque	Labore ut incidunt	Odio praesentium ips	Culpa reprehenderit	+1 (102) 366-3044	guqelupek@mailinator.com	\N	Dolorem sed culpa do	13.01	Ready for Delivery
\.


--
-- Data for Name: services_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services_types (id, name, status, created_at, updated_at) FROM stdin;
2	Legal Translation	1	2024-12-26 15:48:42	2024-12-26 17:43:28
3	Certified Translation	1	2024-12-26 17:43:45	2024-12-26 17:43:45
4	Police verification	1	2024-12-30 17:18:41	2024-12-30 17:18:41
5	Driving License (Local/ International)	1	2025-01-31 06:52:08	2025-01-31 06:52:08
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
TeyZOtWiwici3iBQCwRWQgc1ilw4F0slaqI3DFSH	1	83.110.22.157	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUU5tWlZkRTk1aVEwNDFGSkE5clpCZ1l0Wk4yT3hGVmF3V2c5bGNibyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1ODoiaHR0cHM6Ly9keGJpdHByb2plY3RzLmNvbS9jbGFzaWZpZWQvcHVibGljL2FkbWluL2Rhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODE6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vY2xhc2lmaWVkL3B1YmxpYy9hZG1pbi9jYXRlZ29yeV9hdHJpYnV0ZXNfdmFsdWUvZWRpdC80MSI7fX0=	1744038524
MLeVY68hMZxaqQ06Lrj4MwDSbTI20BLXahgGTdC7	\N	52.112.49.156	Mozilla/5.0 (Windows NT 6.1; WOW64) SkypeUriPreview Preview/0.5 skype-url-preview@microsoft.com	YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjFCUHN0TzBMNkVPdjdOWm52WXN1YnQ1ZVhIVDZnVzNVVHlvcVl1RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vY2xhc2lmaWVkL3B1YmxpYy9hZG1pbi9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1744086378
JoS9EiUXjGrNwtrmZGjZ8JpuvZiIDdYBSBjmKmeR	\N	117.196.8.64	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkt1bWk1YWJpNjFTNktvSlp4MHdDdkl4NEZjSVBRR0xYVFdxTXJqeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vY2xhc2lmaWVkL3B1YmxpYy9hZG1pbi9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1744086383
vDDyaaAc5VoPkl6gRCS3g19WhsKv7BxEhlEtOCbe	\N	83.110.22.157	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoibmRYckRYa0p4SkF3M1RJell3bHlNQWNnSG51N2Vab0E2ZFI1T3l6bCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1ODoiaHR0cHM6Ly9keGJpdHByb2plY3RzLmNvbS9jbGFzaWZpZWQvcHVibGljL2FkbWluL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjU0OiJodHRwczovL2R4Yml0cHJvamVjdHMuY29tL2NsYXNpZmllZC9wdWJsaWMvYWRtaW4vbG9naW4iO319	1744086359
6imyjbocT0AyQ6I1uShDIu5ytWMDC5d1F8EaUyP1	1	103.235.79.186	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYmxOakJVVG1CQ1RPNHZKOUhIckNDMHBOV2VBaExqZ2x2TUpTbVJqaCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1ODoiaHR0cHM6Ly9keGJpdHByb2plY3RzLmNvbS9jbGFzaWZpZWQvcHVibGljL2FkbWluL2Rhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzM6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vY2xhc2lmaWVkL3B1YmxpYy9hZG1pbi9jYXRlZ29yeV9hdHJpYnV0ZXNfdmFsdWUiO319	1744038172
VxIKalOjU4oqEOsG3Pgz9fdzSO0zj6BTmvrqzF6G	1	83.110.22.157	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZG5xR1lvZWN4Sm44ejFsMkowRjBYTzI5TFFmM1A2aGF4WTJnVEU5biI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzI6Imh0dHBzOi8vZHhiaXRwcm9qZWN0cy5jb20vY2xhc2lmaWVkL3B1YmxpYy9hZG1pbi9jYXRlZ29yaWVzL2Zvcm1maWVsZHMvNSI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==	1744034483
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
-- Data for Name: slider_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.slider_items (id, slider_id, name, image, status, created_at, updated_at, deleted_at) FROM stdin;
1	1	Page 1	UpvZHP7lY0rKEMLYy0KSIZpXR8l7uWO1KJugDIg4.png	1	2025-03-26 06:12:52	2025-03-26 06:12:52	\N
\.


--
-- Data for Name: sliders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sliders (id, name, parent_category_id, category_id, status, created_at, updated_at, deleted_at) FROM stdin;
1	Main Page	1	5	1	2025-03-26 06:12:32	2025-03-26 06:12:32	\N
\.


--
-- Data for Name: target_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.target_types (id, name, status, created_at, updated_at) FROM stdin;
3	KM1	1	2024-12-10 17:22:23	2024-12-17 19:57:14
4	Floor	1	2024-12-10 17:22:38	2024-12-16 14:21:51
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
1	test	testsada	rush_fee	\N	30.00	default-category	1	2024-12-26 16:53:41	2024-12-26 16:53:41
3	EXPEDITED	15 - 24 hours Tomorrow at 7:52 PM (latest)	rush_fee	\N	30.00	only_translation	1	2024-12-26 17:12:44	2024-12-27 19:07:15
4	EXPEDITED	15 - 24 hours Tomorrow at 7:52 PM (latest)	rush_fee	\N	30.00	notarized	1	2024-12-26 17:13:03	2024-12-30 10:28:50
5	STANDARD	1 - 2 days Monday at 7:52 PM (latest)	free	0.00	\N	notarized	1	2024-12-26 17:31:22	2024-12-27 19:23:44
7	STANDARD	1 - 2 days Monday at 7:52 PM (latest)	free	0.00	\N	certified	1	2024-12-26 17:33:22	2024-12-27 19:00:22
8	EXPEDITED	15 - 24 hours Tomorrow at 7:52 PM (latest)	rush_fee	\N	30.00	certified	1	2024-12-27 19:00:53	2024-12-27 20:02:30
11	STANDARD	1 - 2 days Monday at 7:52 PM (latest)	free	0.00	\N	only_translation	1	2024-12-27 19:02:53	2024-12-27 19:02:53
\.


--
-- Data for Name: translation_types_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.translation_types_categories (id, name, slug, status, created_at, updated_at, description, price_type, price, percentage) FROM stdin;
2	CERTIFIED	certified	1	2024-12-30 10:26:55	2024-12-31 10:34:42	Includes an official coversheet with the company header, stamp, and signature from a Licensed Translator, accredited by the Palestinian Ministry of Justice.	free	0.00	0.00
3	ONLY TRANSLATION	only_translation	1	2024-12-30 10:27:33	2024-12-31 10:35:30	For those who need only professional translation.	free	0.00	0.00
5	NOTARIZED	notarized	1	2024-12-30 10:31:48	2024-12-31 10:35:55	Includes an official cover page with a red seal, stamped with the signature of the licensed Notary Public.	fixed	25.00	0.00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, first_name, last_name, dial_code, phone, country_id, emirates_id, city_id, company_id, status, deleted_at, role_id, gender, country, profile_image, dob, is_verified) FROM stdin;
2	Woods and Haley Associates	gocajulevu@mailinator.com	\N	$2y$12$ov/2HliXhcRdXL3E2CrI9OdBlBPEhFtd.nT5rMccwXRqdj6x0HJkC	\N	2024-12-05 15:37:44	2024-12-13 18:23:02	\N	\N	\N	\N	\N	\N	\N	\N	0	2024-12-13 18:23:02	\N	\N	\N	\N	\N	0
3	Chen Vang LLC	diqyr@mailinator.com	\N	$2y$12$IUmiLAObBLlYUs13D4aWsewKgC53Zb62XitDG/3L1Akbq51yi..wm	\N	2024-12-05 15:39:43	2024-12-13 18:22:56	\N	\N	\N	\N	\N	\N	\N	\N	0	2024-12-13 18:22:56	\N	\N	\N	\N	\N	0
4	Mason Peters Trading	qysewabawo@mailinator.com	\N	$2y$12$ynPkuRcVNPxiF1g3dPk6pODyf/pavc6KF7Od0RP9DR7SNT5ETH6kW	\N	2024-12-05 15:41:43	2024-12-13 18:22:47	\N	\N	\N	\N	\N	\N	\N	\N	0	2024-12-13 18:22:47	\N	\N	\N	\N	\N	0
5	Downs and Workman Trading	43543436y3@gdfgdf.kiu	\N	$2y$12$V6HnBnydTqgiGypVb6xqXuQOxkgl1LDfT.G8nI1TeUkr7vUJ7EB7u	\N	2024-12-05 15:50:01	2024-12-13 18:22:41	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-12-13 18:22:41	\N	\N	\N	\N	\N	0
6	Rodriguez and Alford Trading	emirates@gmail.com	\N	$2y$12$Ki7Vd7xG6vQjkz3OzPClMOWnuv2n5p9ipCFmhw69tIh3v9Un2UaGy	\N	2024-12-05 18:24:50	2024-12-13 18:22:30	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-12-13 18:22:30	\N	\N	\N	\N	\N	0
7	Ahmed Hopper	zopeficyq@mailinator.com	\N	$2y$12$BBq4XgxNs2vj53P1g4byke8aklNVrAKAuGRzWEIVN.CGH0A3s5Oqa	\N	2024-12-05 20:21:59	2024-12-05 20:21:59	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0
8	Heather Schultz	pedalyzixa@mailinator.com	\N	$2y$12$lKQTDi4bGYpMtsUOOKH9YucUQwQqRo/.gjd.urDOFhL1A8CKZ8Yam	\N	2024-12-05 20:22:53	2024-12-05 20:22:53	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0
9	Yuli Everett	toxolo@mailinator.com	\N	$2y$12$hLDxEjynYgVwLLTAdSAcCuwX997wgoTYSzzrPNe/2tQnH1aMIQsh2	\N	2024-12-05 20:23:30	2024-12-05 20:23:30	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0
10	Dawn Acevedo	bavyxizawi@mailinator.com	\N	$2y$12$jA9v57p2MEOQP1u9Di6Sdeisut45QLZzUPN310316TyJ9tDVQqb8C	\N	2024-12-05 20:26:20	2024-12-05 20:26:20	Dawn	Acevedo	+91	8358264038	1	2	5	6	1	\N	\N	\N	\N	\N	\N	0
11	Joy Henderson	telagu@mailinator.com	\N	$2y$12$/FeLQPAjds6U1J0SB/ZKputaKZ5fkEKffiGLd4jLChBVxbZqMAjRK	\N	2024-12-05 20:28:51	2024-12-05 20:28:51	Joy	Henderson	+971	1633481266	1	2	5	6	1	\N	\N	\N	\N	\N	\N	0
12	Anthony Burke	hobafo@mailinator.com	\N	$2y$12$UOJ74BRwRcCXIIO5/X7wpu.gm2i4bbpq.zzrFc/U1eTRNz/fFP8/.	\N	2024-12-05 21:39:41	2024-12-05 21:39:41	Anthony	Burke	+91	6368074711	1	1	1	6	1	\N	\N	\N	\N	\N	\N	0
13	Baldwin and Boyd LLC	fokupi@mailinator.com	\N	$2y$12$elFejuY0j6j1N0o9PCM8AerytRSeMbkCEglkV7dlvMK5cgoFRgemK	\N	2024-12-08 05:34:29	2024-12-13 18:20:46	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-12-13 18:20:46	\N	\N	\N	\N	\N	0
15	Ray and Holland Co	toqowa@mailinator.com	\N	$2y$12$R09zCd8WFkr3KKT4mcoXZ.2VcjyGp56s045nO9CuTUIsa3MrGLVEi	\N	2024-12-10 05:32:01	2024-12-10 05:32:01	\N	\N	971	4312345678	1	1	1	\N	1	\N	\N	\N	\N	\N	\N	0
16	Asher Morton	mykoboqem@mailinator.com	\N	$2y$12$dsD4dbNnoH0Ohys4u6ftme3Jhkxm8zcPrTVyEc4.us9EWIPNc7CRG	\N	2024-12-10 06:20:04	2024-12-12 17:00:15	Asher	Morton	971	12312123	2	\N	1	2	0	2024-12-12 17:00:15	\N	\N	\N	\N	\N	0
17	Wade Hodge	xinozok@mailinator.com	\N	$2y$12$/1.ac8gQZZyULOdYr48KmOUQ45wnctU0UQA2sg3.1tnmaMxMLoCk.	\N	2024-12-12 17:24:24	2024-12-12 17:24:24	Wade	Hodge	\N	2313123123	2	0	0	1	1	\N	\N	\N	\N	\N	\N	0
18	Amy Palmer	beji@mailinator.com	\N	$2y$12$k9N7LgiLG/bAuDS9zNpbIe96E/F6kPiGWWOleqDNs8et1ekfS2aqK	\N	2024-12-12 17:27:02	2024-12-12 17:27:02	Amy	Palmer	\N	213122312	2	0	1	1	0	\N	3	\N	\N	\N	\N	0
22	Quynnasd11 Hardy	newilapyw@mailinator.com	\N	$2y$12$T0c0LMgv.XaibDUPog.jE.b69JnNe2f87BgpmsTS1lNehELrFGHqm	\N	2024-12-13 18:42:14	2024-12-20 06:45:25	Quynnasd11	Hardy	+9711	23423423	2	4	3	35	1	\N	\N	\N	\N	\N	\N	0
23	Farmer Dudley Traders	wujutavyj@mailinator.com	\N	$2y$12$a5khm/m.TuV35722ISKM7emuVe28Eq4WT7a0YI.4ipQmDy9BH3Zga	\N	2024-12-13 19:09:35	2024-12-19 21:55:04	\N	\N	\N	3534243223	2	4	7	\N	1	2024-12-19 21:55:04	\N	\N	\N	\N	\N	0
24	Medge Patrick	sosadok@mailinator.com	\N	$2y$12$OzWKe9t6YXlG5JhRUbN5p.eukjrb.7qvNlYiCVLPUNeqNaU0jsYYi	\N	2024-12-13 19:11:02	2024-12-13 19:11:02	Medge	Patrick	971	23432433	4	4	3	9	1	\N	\N	\N	\N	\N	\N	0
25	Aspen Mullins	qagolesaru@mailinator.com	\N	$2y$12$PB14akgquQND94Uy8P8tSOllgj5EtlCHI7gEH53g7mkKLs7RG7986	\N	2024-12-13 19:19:04	2024-12-13 19:54:13	Aspen	Mullins	971	231231212	8	5	3	10	1	\N	\N	Male	\N	\N	\N	0
26	Finn Pugh	xoxeqadu@mailinatorsdasdas	\N	$2y$12$q.d.cIJkhT/yJrnUbnCkNu5a.pYAc7urB6ylsshc7yXZKKFJHlU0e	\N	2024-12-15 22:17:09	2024-12-15 22:41:22	Finn	Pugh	971	34324234	8	3	7	10	1	\N	\N	\N	\N	\N	\N	0
27	Quinn Walter	asddasdasdasd@sdasdasasdasdas	\N	$2y$12$2ZRsjmoitcldZCFHY2k78.feYhL2xaklIt0NyuwNpX.cycaoK0HVa	\N	2024-12-15 22:19:22	2024-12-15 22:41:26	Quinn	Walter	971	144234324	8	1	1	9	1	\N	\N	\N	\N	\N	\N	0
28	Hanna Sears	qyxavymano@mailinator.com	\N	$2y$12$J47Sq7zmbOXdeZZQ0d5KZONK4CwF8u5eY6IffDuWdT0dAKkq3hSW.	\N	2024-12-15 22:28:41	2024-12-15 22:40:43	Hanna	Sears	971	32423434	7	5	1	23	0	\N	\N	\N	\N	\N	\N	0
29	MacKensie Alford	xejufenuqo@mailinator.com	\N	$2y$12$RmnPDH4B5bahZ1Kktn59G.FX2dXrlyHYP7J6fxUEHAHWYBqpHxCDG	\N	2024-12-15 22:48:06	2024-12-19 21:43:20	MacKensie	Alford	91	23423423	5	5	1	23	1	\N	\N	\N	\N	\N	\N	0
30	Isaiah Frazier	xufykukut@mailinator.com	\N	$2y$12$w8AzzEGoiG/mo33RZbckouFhmaxSU6Zl3gTWa.lxJ8hrUBZv.qTN2	\N	2024-12-15 23:17:35	2024-12-15 23:17:35	Isaiah	Frazier	+91	234234324234	2	1	1	23	1	\N	\N	\N	\N	\N	\N	0
31	Lacey Cantu	sapezuda@mailinator.com	\N	$2y$12$SlXTaVRI5A9oFZ.7kkPfH.gWcsze7uqogeffKuRCOEaQmtEA8Sh0q	\N	2024-12-16 04:30:58	2024-12-16 04:30:58	Lacey	Cantu	91	2423423234	4	4	7	23	0	\N	\N	\N	\N	\N	\N	0
32	Olsen and Johnston Inc	xeto@mailinator.com	\N	$2y$12$Ib65KlCBDfPbPgq/G78sUO9ZeeKm7VM.mz85AsQ9seg6qT7kto.5G	\N	2024-12-16 05:05:22	2024-12-19 21:54:10	\N	\N	971	143234234	2	4	7	\N	1	2024-12-19 21:54:10	\N	\N	\N	\N	\N	0
33	Erich Lynn	tyte@mailinator.com	\N	$2y$12$B/Yqy3AKPs/pbBME.79Cre.YRT2PGS9JvRVHmlkCnBxLWEtdp5QWW	\N	2024-12-16 14:41:20	2024-12-19 19:38:37	Erich	Lynn	+971	3231231123	7	1	1	32	1	\N	\N	\N	\N	\N	\N	0
34	Price Sutton Inc12112	mifomil@mailinator.com	\N	$2y$12$GUzu7PWwynx7SbyFrS3KTu2iVj..9zRH5HHSURKVKS2tcS8ourPAq	\N	2024-12-16 15:46:05	2024-12-19 21:50:46	\N	\N	+971	2312312312	2	1	1	\N	1	2024-12-19 21:50:46	\N	\N	United Arab Emirates	\N	\N	0
35	Anil Navis	sasul@mailinator.com	\N	$2y$12$3OqqwuXWLiuemfe4fhC4c.LuLUJ5I.2DM02.mI8qwmAIol6QAry4G	\N	2024-12-19 21:56:22	2025-03-24 11:28:07	Anil	Navis	+971	5434534331	1	4	7	\N	1	\N	2	Male	United Arab Emirates	qXzYzPlftRsbm3zFGMx5jObhsqieMxxrZjyST6Cc.jpg	2025-03-21	0
36	Mudassar Zahid	uae@classifieds.com	\N	$2y$12$tgSR/D4EX5NfCvhmIbgPquC5vKzYKU41eG0dA.Tx2bewHF2tKCuiG	\N	2025-03-25 05:32:50	2025-03-25 05:33:18	Mudassar	Zahid	+971	501234567	169	\N	\N	\N	1	\N	2	Male	\N	JFm8zQCvQncicza7P6FNNLZbIaRc2XzXno5Y1aoH.png	1994-05-25	0
1	Admin User	admin@classifieds.com	\N	$2y$12$BKYtYY5PMsyNgtWRe7krvunYE1m/ibOyPob7vfRmTomaFmABx5p72	\N	2024-12-05 15:22:16	2024-12-05 15:22:16	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0
\.


--
-- Data for Name: verification_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.verification_requests (id, user_id, name, email, remarks, status, licence_file, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: why_choose_us; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.why_choose_us (id, name, content, image, status, created_at, updated_at) FROM stdin;
1	Comprehensive Services	We provide a wide range of services under one roof, addressing all aspects of your documentation needs. Our comprehensive approach streamlines processes, saving you time and effort.	17356770326774546824d2a.png	t	2024-12-31 20:22:58	2024-12-31 20:30:32
2	Comprehensive Services 1	We provide a wide range of services under one roof, addressing all aspects of your documentation needs. Our comprehensive approach streamlines processes, saving you time and effort.	17356772606774554c66883.png	t	2024-12-31 20:34:20	2024-12-31 20:39:30
\.


--
-- Data for Name: work_process; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.work_process (id, name, content, image, status, created_at, updated_at) FROM stdin;
1	Find Your Requested Service	Explore our diverse range of services to quickly identify the solution that meets your needs.	173567910967745c859cd66.png	t	2024-12-31 21:05:09	2024-12-31 21:05:25
\.


--
-- Name: ad_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ad_fields_id_seq', 1, false);


--
-- Name: ad_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ad_plans_id_seq', 1, false);


--
-- Name: ads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ads_id_seq', 1, false);


--
-- Name: badges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.badges_id_seq', 1, true);


--
-- Name: banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banners_id_seq', 2, true);


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_id_seq', 1, false);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 2, true);


--
-- Name: category_atributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_atributes_id_seq', 13, true);


--
-- Name: category_atributes_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_atributes_value_id_seq', 1442, true);


--
-- Name: category_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_fields_id_seq', 17, true);


--
-- Name: challenges_companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.challenges_companies_id_seq', 1, false);


--
-- Name: challenges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.challenges_id_seq', 1, false);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 3, true);


--
-- Name: cms_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cms_pages_id_seq', 4, true);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_id_seq', 1, false);


--
-- Name: contact_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_us_id_seq', 1, false);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 1, true);


--
-- Name: delivery_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.delivery_types_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.faqs_id_seq', 1, false);


--
-- Name: field_conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.field_conditions_id_seq', 1, false);


--
-- Name: home_element_ads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_element_ads_id_seq', 1, true);


--
-- Name: home_elements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_elements_id_seq', 3, true);


--
-- Name: home_logos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_logos_id_seq', 1, false);


--
-- Name: home_page_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_page_settings_id_seq', 1, false);


--
-- Name: insights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insights_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.languages_id_seq', 1, false);


--
-- Name: looking_ads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.looking_ads_id_seq', 1, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 140, true);


--
-- Name: nationalities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nationalities_id_seq', 250, true);


--
-- Name: packages_addons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.packages_addons_id_seq', 1, false);


--
-- Name: packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.packages_id_seq', 1, false);


--
-- Name: parent_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parent_categories_id_seq', 4, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 1, false);


--
-- Name: plan_durations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plan_durations_id_seq', 1, false);


--
-- Name: plan_durations_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plan_durations_id_seq1', 1, false);


--
-- Name: popular_ads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.popular_ads_id_seq', 1, true);


--
-- Name: pricing_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pricing_plans_id_seq', 1, false);


--
-- Name: pricing_plans_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pricing_plans_id_seq1', 2, true);


--
-- Name: promo_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promo_codes_id_seq', 1, true);


--
-- Name: quotes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quotes_id_seq', 1, false);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- Name: service_atributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_atributes_id_seq', 1, false);


--
-- Name: service_atributes_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_atributes_value_id_seq', 1, false);


--
-- Name: service_booking_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_booking_fields_id_seq', 1, false);


--
-- Name: service_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_details_id_seq', 1, false);


--
-- Name: service_faqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_faqs_id_seq', 1, false);


--
-- Name: service_pricing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_pricing_id_seq', 1, false);


--
-- Name: services_bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_bookings_id_seq', 1, false);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_seq', 1, false);


--
-- Name: services_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_types_id_seq', 1, false);


--
-- Name: site_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.site_settings_id_seq', 1, false);


--
-- Name: slider_buttons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.slider_buttons_id_seq', 1, false);


--
-- Name: slider_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.slider_items_id_seq', 1, true);


--
-- Name: sliders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sliders_id_seq', 1, false);


--
-- Name: sliders_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sliders_id_seq1', 1, true);


--
-- Name: target_types_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.target_types_company_id_seq', 1, false);


--
-- Name: target_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.target_types_id_seq', 1, false);


--
-- Name: translation_types_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.translation_types_categories_id_seq', 1, false);


--
-- Name: translation_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.translation_types_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 36, true);


--
-- Name: verification_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.verification_requests_id_seq', 1, false);


--
-- Name: why_choose_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.why_choose_us_id_seq', 1, false);


--
-- Name: work_process_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.work_process_id_seq', 1, false);


--
-- Name: ad_fields ad_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ad_fields
    ADD CONSTRAINT ad_fields_pkey PRIMARY KEY (id);


--
-- Name: ad_plans ad_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ad_plans
    ADD CONSTRAINT ad_plans_pkey PRIMARY KEY (id);


--
-- Name: ads ads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads
    ADD CONSTRAINT ads_pkey PRIMARY KEY (id);


--
-- Name: badges badges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.badges
    ADD CONSTRAINT badges_pkey PRIMARY KEY (id);


--
-- Name: banners banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY (id);


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
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: category_atributes category_atributes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_atributes
    ADD CONSTRAINT category_atributes_pkey PRIMARY KEY (id);


--
-- Name: category_atributes_value category_atributes_value_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_atributes_value
    ADD CONSTRAINT category_atributes_value_pkey PRIMARY KEY (id);


--
-- Name: category_fields category_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_fields
    ADD CONSTRAINT category_fields_pkey PRIMARY KEY (id);


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
-- Name: faqs faqs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faqs
    ADD CONSTRAINT faqs_pkey PRIMARY KEY (id);


--
-- Name: field_conditions field_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.field_conditions
    ADD CONSTRAINT field_conditions_pkey PRIMARY KEY (id);


--
-- Name: home_element_ads home_element_ads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_element_ads
    ADD CONSTRAINT home_element_ads_pkey PRIMARY KEY (id);


--
-- Name: home_elements home_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_elements
    ADD CONSTRAINT home_elements_pkey PRIMARY KEY (id);


--
-- Name: home_logos home_logos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_logos
    ADD CONSTRAINT home_logos_pkey PRIMARY KEY (id);


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
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: looking_ads looking_ads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.looking_ads
    ADD CONSTRAINT looking_ads_pkey PRIMARY KEY (id);


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
-- Name: nationalities nationalities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nationalities
    ADD CONSTRAINT nationalities_pkey PRIMARY KEY (id);


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
-- Name: parent_categories parent_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parent_categories
    ADD CONSTRAINT parent_categories_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: plan_durations plan_durations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan_durations
    ADD CONSTRAINT plan_durations_pkey PRIMARY KEY (id);


--
-- Name: popular_ads popular_ads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.popular_ads
    ADD CONSTRAINT popular_ads_pkey PRIMARY KEY (id);


--
-- Name: pricing_plans pricing_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pricing_plans
    ADD CONSTRAINT pricing_plans_pkey PRIMARY KEY (id);


--
-- Name: promo_codes promo_codes_code_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo_codes
    ADD CONSTRAINT promo_codes_code_unique UNIQUE (code);


--
-- Name: promo_codes promo_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo_codes
    ADD CONSTRAINT promo_codes_pkey PRIMARY KEY (id);


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
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: service_atributes service_atributes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_atributes
    ADD CONSTRAINT service_atributes_pkey PRIMARY KEY (id);


--
-- Name: service_atributes_value service_atributes_value_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_atributes_value
    ADD CONSTRAINT service_atributes_value_pkey PRIMARY KEY (id);


--
-- Name: service_booking_fields service_booking_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_booking_fields
    ADD CONSTRAINT service_booking_fields_pkey PRIMARY KEY (id);


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
-- Name: services_bookings services_bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services_bookings
    ADD CONSTRAINT services_bookings_pkey PRIMARY KEY (id);


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
-- Name: site_settings site_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_pkey PRIMARY KEY (id);


--
-- Name: slider_items slider_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slider_items
    ADD CONSTRAINT slider_items_pkey PRIMARY KEY (id);


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
-- Name: translation_types translation_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translation_types
    ADD CONSTRAINT translation_types_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: verification_requests verification_requests_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification_requests
    ADD CONSTRAINT verification_requests_email_unique UNIQUE (email);


--
-- Name: verification_requests verification_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification_requests
    ADD CONSTRAINT verification_requests_pkey PRIMARY KEY (id);


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
-- Name: bookings_booking_id_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX bookings_booking_id_unique ON public.bookings USING btree (booking_id);


--
-- Name: delivery_types_translation_type_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX delivery_types_translation_type_id_index ON public.delivery_types USING btree (translation_type_id);


--
-- Name: failed_jobs_uuid_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX failed_jobs_uuid_unique ON public.failed_jobs USING btree (uuid);


--
-- Name: home_page_settings_key_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX home_page_settings_key_unique ON public.home_page_settings USING btree (key);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: languages_code_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX languages_code_unique ON public.languages USING btree (code);


--
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);


--
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


--
-- Name: permissions_name_guard_name_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX permissions_name_guard_name_unique ON public.permissions USING btree (name, guard_name);


--
-- Name: roles_name_guard_name_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX roles_name_guard_name_unique ON public.roles USING btree (name, guard_name);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: site_settings_key_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX site_settings_key_unique ON public.site_settings USING btree (key);


--
-- Name: translation_types_categories_slug_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX translation_types_categories_slug_unique ON public.translation_types_categories USING btree (slug);


--
-- Name: users_email_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_email_unique ON public.users USING btree (email);


--
-- Name: events events_event_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_event_type_id_fkey FOREIGN KEY (event_type_id) REFERENCES public.event_types(id) ON DELETE CASCADE;


--
-- Name: model_has_permissions model_has_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: model_has_roles model_has_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: quotes quotes_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quotes
    ADD CONSTRAINT quotes_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: service_details service_details_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_details
    ADD CONSTRAINT service_details_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: service_faqs service_faqs_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_faqs
    ADD CONSTRAINT service_faqs_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

