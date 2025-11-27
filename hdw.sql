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
-- Name: account_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_type (
    id bigint NOT NULL,
    name character varying(600),
    description character varying(600),
    sort_order integer DEFAULT 0 NOT NULL,
    status boolean DEFAULT true NOT NULL,
    indvidual_name character varying(255),
    indvidual_image text,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.account_type OWNER TO postgres;

--
-- Name: account_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_type_id_seq OWNER TO postgres;

--
-- Name: account_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_type_id_seq OWNED BY public.account_type.id;


--
-- Name: activity_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity_type (
    id bigint NOT NULL,
    account_id integer,
    name character varying(600),
    description character varying(600),
    logo character varying(255),
    sort_order integer DEFAULT 0 NOT NULL,
    status boolean DEFAULT true NOT NULL,
    availbale_for integer DEFAULT 3 NOT NULL,
    indvidual_name character varying(255),
    indvidual_logo text,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    banner_image character varying(600)
);


ALTER TABLE public.activity_type OWNER TO postgres;

--
-- Name: COLUMN activity_type.availbale_for; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.activity_type.availbale_for IS '1-company,2-individual,3-both';


--
-- Name: activity_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activity_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activity_type_id_seq OWNER TO postgres;

--
-- Name: activity_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activity_type_id_seq OWNED BY public.activity_type.id;


--
-- Name: admin_designation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_designation (
    id bigint NOT NULL,
    name character varying(600) NOT NULL,
    is_deletd integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.admin_designation OWNER TO postgres;

--
-- Name: admin_designation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_designation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_designation_id_seq OWNER TO postgres;

--
-- Name: admin_designation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_designation_id_seq OWNED BY public.admin_designation.id;


--
-- Name: amount_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.amount_type (
    id bigint NOT NULL,
    name character varying(600) NOT NULL
);


ALTER TABLE public.amount_type OWNER TO postgres;

--
-- Name: amount_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.amount_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amount_type_id_seq OWNER TO postgres;

--
-- Name: amount_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.amount_type_id_seq OWNED BY public.amount_type.id;


--
-- Name: app_banners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_banners (
    id bigint NOT NULL,
    banner_title character varying(600),
    banner_image character varying(600),
    active integer DEFAULT 1,
    created_by integer DEFAULT 0,
    updated_by integer DEFAULT 0,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    type integer DEFAULT 0 NOT NULL,
    category integer DEFAULT 0 NOT NULL,
    product integer DEFAULT 0 NOT NULL,
    service integer DEFAULT 0 NOT NULL,
    banner_type integer DEFAULT 0 NOT NULL,
    activity integer DEFAULT 0 NOT NULL,
    store integer DEFAULT 0 NOT NULL,
    url character varying(1600),
    is_type_gift character varying(255)
);


ALTER TABLE public.app_banners OWNER TO postgres;

--
-- Name: app_banners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_banners_id_seq OWNER TO postgres;

--
-- Name: app_banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_banners_id_seq OWNED BY public.app_banners.id;


--
-- Name: app_home_sections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_home_sections (
    id bigint NOT NULL,
    type character varying(255) NOT NULL,
    entity_id integer DEFAULT 0 NOT NULL,
    title character varying(255),
    status integer DEFAULT 1 NOT NULL,
    sort_order integer DEFAULT 999 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.app_home_sections OWNER TO postgres;

--
-- Name: app_home_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_home_sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_home_sections_id_seq OWNER TO postgres;

--
-- Name: app_home_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_home_sections_id_seq OWNED BY public.app_home_sections.id;


--
-- Name: area; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.area (
    id bigint NOT NULL,
    country_id bigint DEFAULT '0'::bigint NOT NULL,
    city_id bigint DEFAULT '0'::bigint NOT NULL,
    name character varying(255),
    status integer DEFAULT 0 NOT NULL,
    latitude character varying(255),
    longitude character varying(255),
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.area OWNER TO postgres;

--
-- Name: area_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.area_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.area_id_seq OWNER TO postgres;

--
-- Name: area_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.area_id_seq OWNED BY public.area.id;


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
-- Name: attribute_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attribute_type (
    id bigint NOT NULL,
    attribute_type_name character varying(255) NOT NULL,
    attribute_type_uid character varying(50) NOT NULL,
    attribute_type_status integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.attribute_type OWNER TO postgres;

--
-- Name: attribute_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attribute_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attribute_type_id_seq OWNER TO postgres;

--
-- Name: attribute_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attribute_type_id_seq OWNED BY public.attribute_type.id;


--
-- Name: attribute_values; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attribute_values (
    id bigint NOT NULL,
    attribute_id integer NOT NULL,
    attribute_values character varying(255) NOT NULL,
    attribute_value_in integer DEFAULT 1 NOT NULL,
    attribute_value_color character varying(30),
    deleted integer DEFAULT 0 NOT NULL,
    created_uid integer NOT NULL,
    updated_uid integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.attribute_values OWNER TO postgres;

--
-- Name: attribute_values_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attribute_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attribute_values_id_seq OWNER TO postgres;

--
-- Name: attribute_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attribute_values_id_seq OWNED BY public.attribute_values.id;


--
-- Name: attribute_values_request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attribute_values_request (
    id bigint NOT NULL,
    request_id integer DEFAULT 0 NOT NULL,
    attribute character varying(600) NOT NULL,
    value character varying(1600) NOT NULL
);


ALTER TABLE public.attribute_values_request OWNER TO postgres;

--
-- Name: attribute_values_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attribute_values_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attribute_values_request_id_seq OWNER TO postgres;

--
-- Name: attribute_values_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attribute_values_request_id_seq OWNED BY public.attribute_values_request.id;


--
-- Name: attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attributes (
    id bigint NOT NULL,
    attribute_name character varying(255) NOT NULL,
    active integer DEFAULT 1 NOT NULL,
    attribute_type integer NOT NULL,
    industry_type integer NOT NULL,
    company_id integer DEFAULT 0 NOT NULL,
    store_id integer DEFAULT 0 NOT NULL,
    is_common integer DEFAULT 1 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_uid integer NOT NULL,
    updated_uid integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.attributes OWNER TO postgres;

--
-- Name: attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attributes_id_seq OWNER TO postgres;

--
-- Name: attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attributes_id_seq OWNED BY public.attributes.id;


--
-- Name: bank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bank (
    id bigint NOT NULL,
    name character varying(600) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.bank OWNER TO postgres;

--
-- Name: bank_code_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bank_code_types (
    id bigint NOT NULL,
    name character varying(500),
    country_id integer DEFAULT 0 NOT NULL,
    active integer DEFAULT 0 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.bank_code_types OWNER TO postgres;

--
-- Name: bank_code_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bank_code_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bank_code_types_id_seq OWNER TO postgres;

--
-- Name: bank_code_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_code_types_id_seq OWNED BY public.bank_code_types.id;


--
-- Name: bank_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bank_details (
    id bigint NOT NULL,
    bank_name character varying(600),
    company_account character varying(600),
    code_type integer DEFAULT 0 NOT NULL,
    account_no character varying(600),
    branch_code character varying(300),
    branch_name character varying(300),
    bank_statement_doc character varying(600),
    credit_card_sta_doc character varying(600),
    country integer DEFAULT 0 NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    iban character varying(600)
);


ALTER TABLE public.bank_details OWNER TO postgres;

--
-- Name: bank_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bank_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bank_details_id_seq OWNER TO postgres;

--
-- Name: bank_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_details_id_seq OWNED BY public.bank_details.id;


--
-- Name: bank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bank_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bank_id_seq OWNER TO postgres;

--
-- Name: bank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_id_seq OWNED BY public.bank.id;


--
-- Name: blogs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blogs (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    blog_image character varying(255),
    active boolean DEFAULT false NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.blogs OWNER TO postgres;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_id_seq OWNER TO postgres;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blogs_id_seq OWNED BY public.blogs.id;


--
-- Name: brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand (
    id bigint NOT NULL,
    name character varying(600),
    industry_type integer DEFAULT 0 NOT NULL,
    image character varying(600),
    active integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted integer DEFAULT 0 NOT NULL,
    activity_id bigint
);


ALTER TABLE public.brand OWNER TO postgres;

--
-- Name: brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brand_id_seq OWNER TO postgres;

--
-- Name: brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brand_id_seq OWNED BY public.brand.id;


--
-- Name: building_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.building_type (
    id bigint NOT NULL,
    name character varying(255),
    description text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    active integer DEFAULT 1 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.building_type OWNER TO postgres;

--
-- Name: building_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.building_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.building_type_id_seq OWNER TO postgres;

--
-- Name: building_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.building_type_id_seq OWNED BY public.building_type.id;


--
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id bigint NOT NULL,
    product_id integer NOT NULL,
    product_attribute_id integer NOT NULL,
    quantity integer NOT NULL,
    user_id integer NOT NULL,
    store_id integer NOT NULL,
    device_cart_id character varying(500),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_id_seq OWNER TO postgres;

--
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;


--
-- Name: cart_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_service (
    id bigint NOT NULL,
    service_id integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    device_cart_id character varying(600),
    booked_time character varying(600),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    building_type_id integer,
    text character varying(600),
    hourly_rate double precision DEFAULT '0'::double precision NOT NULL,
    task_description text,
    doc character varying(600),
    qty integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.cart_service OWNER TO postgres;

--
-- Name: cart_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_service_id_seq OWNER TO postgres;

--
-- Name: cart_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_service_id_seq OWNED BY public.cart_service.id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(1500),
    banner_image character varying(1500),
    parent_id integer DEFAULT 0 NOT NULL,
    active integer DEFAULT 1 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    created_uid integer NOT NULL,
    updated_uid integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    activity_id bigint,
    home_page boolean DEFAULT false NOT NULL,
    sub_title character varying(255),
    is_gift character varying(255),
    show_gift_page character varying(255),
    is_handmade boolean
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    active smallint DEFAULT '1'::smallint NOT NULL,
    country_id integer NOT NULL,
    state_id integer NOT NULL,
    created_uid bigint,
    updated_uid bigint,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
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
-- Name: cleaning_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cleaning_services (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.cleaning_services OWNER TO postgres;

--
-- Name: cleaning_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cleaning_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cleaning_services_id_seq OWNER TO postgres;

--
-- Name: cleaning_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cleaning_services_id_seq OWNED BY public.cleaning_services.id;


--
-- Name: comment_likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment_likes (
    id bigint NOT NULL,
    comment_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.comment_likes OWNER TO postgres;

--
-- Name: comment_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_likes_id_seq OWNER TO postgres;

--
-- Name: comment_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_likes_id_seq OWNED BY public.comment_likes.id;


--
-- Name: comment_taged_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment_taged_users (
    id bigint NOT NULL,
    comment_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.comment_taged_users OWNER TO postgres;

--
-- Name: comment_taged_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_taged_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_taged_users_id_seq OWNER TO postgres;

--
-- Name: comment_taged_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_taged_users_id_seq OWNED BY public.comment_taged_users.id;


--
-- Name: contact_us; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_us (
    id bigint NOT NULL,
    name character varying(600),
    email character varying(600),
    dial_code character varying(600),
    mobile_number character varying(600),
    message text,
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
    updated_at timestamp(0) without time zone,
    ref_discount integer DEFAULT 0,
    ref_discount_type character varying(255) DEFAULT '1'::character varying,
    transport_website_link character varying(255) DEFAULT ''::character varying
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
-- Name: contracting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contracting (
    id bigint NOT NULL,
    title character varying(255),
    description character varying(255),
    building_type integer,
    contract_type integer,
    file character varying(255),
    deleted integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    user_id integer,
    status integer,
    price double precision,
    qoutation_file character varying(255),
    transaction_id character varying(255),
    payment_ref character varying(255)
);


ALTER TABLE public.contracting OWNER TO postgres;

--
-- Name: contracting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contracting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contracting_id_seq OWNER TO postgres;

--
-- Name: contracting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contracting_id_seq OWNED BY public.contracting.id;


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
    updated_at timestamp(0) without time zone,
    deleted smallint DEFAULT '0'::smallint NOT NULL
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
-- Name: coupon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupon (
    id bigint NOT NULL,
    coupon_title character varying(600),
    coupon_description text,
    coupon_end_date timestamp(0) without time zone,
    coupon_amount double precision,
    coupon_minimum_spend double precision,
    coupon_max_spend double precision,
    coupon_usage_percoupon double precision,
    coupon_usage_perx double precision,
    coupon_usage_peruser double precision,
    coupon_vender_id integer DEFAULT 0 NOT NULL,
    coupon_status integer DEFAULT 0 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    coupon_code character varying(100),
    amount_type integer DEFAULT 0 NOT NULL,
    start_date character varying(600),
    applied_to integer DEFAULT 0 NOT NULL,
    minimum_amount double precision,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.coupon OWNER TO postgres;

--
-- Name: coupon_brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupon_brand (
    id bigint NOT NULL,
    name character varying(600),
    image character varying(600),
    active integer DEFAULT 0 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.coupon_brand OWNER TO postgres;

--
-- Name: coupon_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupon_brand_id_seq OWNER TO postgres;

--
-- Name: coupon_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_brand_id_seq OWNED BY public.coupon_brand.id;


--
-- Name: coupon_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupon_category (
    id bigint NOT NULL,
    coupon_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.coupon_category OWNER TO postgres;

--
-- Name: coupon_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupon_category_id_seq OWNER TO postgres;

--
-- Name: coupon_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_category_id_seq OWNED BY public.coupon_category.id;


--
-- Name: coupon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupon_id_seq OWNER TO postgres;

--
-- Name: coupon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_id_seq OWNED BY public.coupon.id;


--
-- Name: coupon_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupon_images (
    id bigint NOT NULL,
    coupon_id integer DEFAULT 0 NOT NULL,
    image character varying(600),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.coupon_images OWNER TO postgres;

--
-- Name: coupon_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupon_images_id_seq OWNER TO postgres;

--
-- Name: coupon_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_images_id_seq OWNED BY public.coupon_images.id;


--
-- Name: coupon_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupon_products (
    id bigint NOT NULL,
    coupon_id integer DEFAULT 0 NOT NULL,
    product_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.coupon_products OWNER TO postgres;

--
-- Name: coupon_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupon_products_id_seq OWNER TO postgres;

--
-- Name: coupon_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_products_id_seq OWNED BY public.coupon_products.id;


--
-- Name: coupon_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupon_services (
    id bigint NOT NULL,
    coupon_id integer DEFAULT 0 NOT NULL,
    service_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.coupon_services OWNER TO postgres;

--
-- Name: coupon_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupon_services_id_seq OWNER TO postgres;

--
-- Name: coupon_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_services_id_seq OWNED BY public.coupon_services.id;


--
-- Name: coupon_vendor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupon_vendor (
    id bigint NOT NULL,
    vendor integer DEFAULT 0 NOT NULL,
    coupon_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.coupon_vendor OWNER TO postgres;

--
-- Name: coupon_vendor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_vendor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupon_vendor_id_seq OWNER TO postgres;

--
-- Name: coupon_vendor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_vendor_id_seq OWNED BY public.coupon_vendor.id;


--
-- Name: coupon_vendor_service_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupon_vendor_service_order (
    id bigint NOT NULL,
    vendor_id integer DEFAULT 0 NOT NULL,
    coupon_id integer DEFAULT 0 NOT NULL,
    order_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.coupon_vendor_service_order OWNER TO postgres;

--
-- Name: coupon_vendor_service_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_vendor_service_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupon_vendor_service_order_id_seq OWNER TO postgres;

--
-- Name: coupon_vendor_service_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_vendor_service_order_id_seq OWNED BY public.coupon_vendor_service_order.id;


--
-- Name: coupons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupons (
    id bigint NOT NULL,
    title character varying(600),
    title_ar character varying(600),
    brand_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL,
    coupon_code character varying(600),
    active integer DEFAULT 0 NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    trending integer DEFAULT 0 NOT NULL,
    hot_deal integer DEFAULT 0 NOT NULL,
    description text,
    description_ar text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    start_date character varying(600),
    coupon_end_date character varying(600)
);


ALTER TABLE public.coupons OWNER TO postgres;

--
-- Name: coupons_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupons_category (
    id bigint NOT NULL,
    name character varying(600),
    image character varying(600),
    banner_image character varying(600),
    parent_id integer DEFAULT 0 NOT NULL,
    active integer DEFAULT 0 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    created_uid integer DEFAULT 0 NOT NULL,
    updated_uid integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.coupons_category OWNER TO postgres;

--
-- Name: coupons_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupons_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupons_category_id_seq OWNER TO postgres;

--
-- Name: coupons_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupons_category_id_seq OWNED BY public.coupons_category.id;


--
-- Name: coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupons_id_seq OWNER TO postgres;

--
-- Name: coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupons_id_seq OWNED BY public.coupons.id;


--
-- Name: cuisines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuisines (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.cuisines OWNER TO postgres;

--
-- Name: cuisines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cuisines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cuisines_id_seq OWNER TO postgres;

--
-- Name: cuisines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cuisines_id_seq OWNED BY public.cuisines.id;


--
-- Name: currencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currencies (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.currencies OWNER TO postgres;

--
-- Name: currencies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.currencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.currencies_id_seq OWNER TO postgres;

--
-- Name: currencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.currencies_id_seq OWNED BY public.currencies.id;


--
-- Name: custom_banners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.custom_banners (
    id bigint NOT NULL,
    banner_title character varying(255),
    banner_image text NOT NULL,
    active integer DEFAULT 1 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    updated_by integer DEFAULT 0 NOT NULL,
    type integer DEFAULT 1,
    category text,
    product text,
    service text,
    banner_type integer DEFAULT 1,
    activity integer DEFAULT 0 NOT NULL,
    store integer DEFAULT 0 NOT NULL,
    url text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.custom_banners OWNER TO postgres;

--
-- Name: custom_banners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.custom_banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_banners_id_seq OWNER TO postgres;

--
-- Name: custom_banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.custom_banners_id_seq OWNED BY public.custom_banners.id;


--
-- Name: designations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.designations (
    id bigint NOT NULL,
    user_id bigint,
    user_type integer DEFAULT 0 NOT NULL,
    designation character varying(255) NOT NULL,
    status smallint DEFAULT '1'::smallint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.designations OWNER TO postgres;

--
-- Name: designations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.designations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.designations_id_seq OWNER TO postgres;

--
-- Name: designations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.designations_id_seq OWNED BY public.designations.id;


--
-- Name: event_features; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_features (
    id bigint NOT NULL,
    name character varying(255),
    image_path character varying(255),
    description character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.event_features OWNER TO postgres;

--
-- Name: event_features_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_features_id_seq OWNER TO postgres;

--
-- Name: event_features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_features_id_seq OWNED BY public.event_features.id;


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
-- Name: featured_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.featured_products (
    id bigint NOT NULL,
    master_product integer DEFAULT 0 NOT NULL,
    description character varying(600) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.featured_products OWNER TO postgres;

--
-- Name: featured_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.featured_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.featured_products_id_seq OWNER TO postgres;

--
-- Name: featured_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.featured_products_id_seq OWNED BY public.featured_products.id;


--
-- Name: featured_products_img; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.featured_products_img (
    id bigint NOT NULL,
    featured_product_id integer DEFAULT 0 NOT NULL,
    image character varying(600) NOT NULL
);


ALTER TABLE public.featured_products_img OWNER TO postgres;

--
-- Name: featured_products_img_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.featured_products_img_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.featured_products_img_id_seq OWNER TO postgres;

--
-- Name: featured_products_img_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.featured_products_img_id_seq OWNED BY public.featured_products_img.id;


--
-- Name: hair_colors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hair_colors (
    id bigint NOT NULL,
    name character varying(255),
    color character varying(30) NOT NULL,
    active smallint DEFAULT '1'::smallint NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.hair_colors OWNER TO postgres;

--
-- Name: hair_colors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hair_colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hair_colors_id_seq OWNER TO postgres;

--
-- Name: hair_colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hair_colors_id_seq OWNED BY public.hair_colors.id;


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
-- Name: help_topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.help_topics (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    topic character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_survey_topic boolean DEFAULT false NOT NULL
);


ALTER TABLE public.help_topics OWNER TO postgres;

--
-- Name: help_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.help_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.help_topics_id_seq OWNER TO postgres;

--
-- Name: help_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.help_topics_id_seq OWNED BY public.help_topics.id;


--
-- Name: home_logos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_logos (
    id bigint NOT NULL,
    image character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted integer DEFAULT 0 NOT NULL,
    active integer DEFAULT 0 NOT NULL
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
-- Name: hourly_rate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hourly_rate (
    id bigint NOT NULL,
    text character varying(600),
    hourly_rate double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    service_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.hourly_rate OWNER TO postgres;

--
-- Name: hourly_rate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hourly_rate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hourly_rate_id_seq OWNER TO postgres;

--
-- Name: hourly_rate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hourly_rate_id_seq OWNED BY public.hourly_rate.id;


--
-- Name: industry_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.industry_types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    active integer DEFAULT 1 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    created_uid integer NOT NULL,
    updated_uid integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.industry_types OWNER TO postgres;

--
-- Name: industry_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.industry_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.industry_types_id_seq OWNER TO postgres;

--
-- Name: industry_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.industry_types_id_seq OWNED BY public.industry_types.id;


--
-- Name: landing_page_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.landing_page_settings (
    id bigint NOT NULL,
    meta_key character varying(255) NOT NULL,
    meta_value text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.landing_page_settings OWNER TO postgres;

--
-- Name: landing_page_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.landing_page_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.landing_page_settings_id_seq OWNER TO postgres;

--
-- Name: landing_page_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.landing_page_settings_id_seq OWNED BY public.landing_page_settings.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.likes (
    id bigint NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    product_id integer DEFAULT 0 NOT NULL,
    vendor_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.likes OWNER TO postgres;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.likes_id_seq OWNER TO postgres;

--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: main_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_category (
    id bigint NOT NULL,
    name character varying(255),
    sub_title character varying(255),
    image character varying(255),
    button_link character varying(255),
    deleted integer DEFAULT 0 NOT NULL,
    active integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    banner_image character varying(255)
);


ALTER TABLE public.main_category OWNER TO postgres;

--
-- Name: main_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_category_id_seq OWNER TO postgres;

--
-- Name: main_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_category_id_seq OWNED BY public.main_category.id;


--
-- Name: maintainance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maintainance (
    id bigint NOT NULL,
    title character varying(255),
    description character varying(255),
    building_type integer,
    file character varying(255),
    deleted integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    user_id integer,
    status integer,
    price double precision,
    qoutation_file character varying(255),
    transaction_id character varying(255),
    payment_ref character varying(255)
);


ALTER TABLE public.maintainance OWNER TO postgres;

--
-- Name: maintainance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maintainance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maintainance_id_seq OWNER TO postgres;

--
-- Name: maintainance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maintainance_id_seq OWNED BY public.maintainance.id;


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
-- Name: moda_main_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moda_main_categories (
    id bigint NOT NULL,
    name character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.moda_main_categories OWNER TO postgres;

--
-- Name: moda_main_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moda_main_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moda_main_categories_id_seq OWNER TO postgres;

--
-- Name: moda_main_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moda_main_categories_id_seq OWNED BY public.moda_main_categories.id;


--
-- Name: moda_sub_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moda_sub_categories (
    id bigint NOT NULL,
    main_category integer NOT NULL,
    name character varying(255),
    gender integer NOT NULL,
    image character varying(900),
    active smallint DEFAULT '1'::smallint NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.moda_sub_categories OWNER TO postgres;

--
-- Name: COLUMN moda_sub_categories.gender; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.moda_sub_categories.gender IS '1.Male,2.female';


--
-- Name: moda_sub_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moda_sub_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moda_sub_categories_id_seq OWNER TO postgres;

--
-- Name: moda_sub_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moda_sub_categories_id_seq OWNED BY public.moda_sub_categories.id;


--
-- Name: my_moda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.my_moda (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    date date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.my_moda OWNER TO postgres;

--
-- Name: my_moda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.my_moda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.my_moda_id_seq OWNER TO postgres;

--
-- Name: my_moda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.my_moda_id_seq OWNED BY public.my_moda.id;


--
-- Name: my_moda_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.my_moda_items (
    id bigint NOT NULL,
    my_moda_id integer NOT NULL,
    product_id integer NOT NULL,
    product_attribute_id integer NOT NULL,
    moda_sub_category integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.my_moda_items OWNER TO postgres;

--
-- Name: my_moda_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.my_moda_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.my_moda_items_id_seq OWNER TO postgres;

--
-- Name: my_moda_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.my_moda_items_id_seq OWNED BY public.my_moda_items.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    description character varying(600),
    title character varying(600),
    image character varying(600),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    user_type integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL
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
-- Name: order_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_products (
    id bigint NOT NULL,
    order_id integer DEFAULT 0 NOT NULL,
    product_id integer DEFAULT 0 NOT NULL,
    product_attribute_id integer DEFAULT 0 NOT NULL,
    product_type integer DEFAULT 0 NOT NULL,
    quantity integer DEFAULT 0 NOT NULL,
    price double precision,
    discount double precision,
    total double precision,
    vendor_id integer DEFAULT 0 NOT NULL,
    order_status integer DEFAULT 0 NOT NULL,
    admin_commission double precision,
    vendor_commission double precision,
    shipping_charge double precision
);


ALTER TABLE public.order_products OWNER TO postgres;

--
-- Name: order_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_products_id_seq OWNER TO postgres;

--
-- Name: order_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_products_id_seq OWNED BY public.order_products.id;


--
-- Name: order_request_view; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_request_view (
    id bigint NOT NULL,
    vendor integer DEFAULT 0 NOT NULL,
    service_order integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.order_request_view OWNER TO postgres;

--
-- Name: order_request_view_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_request_view_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_request_view_id_seq OWNER TO postgres;

--
-- Name: order_request_view_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_request_view_id_seq OWNED BY public.order_request_view.id;


--
-- Name: order_status_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_status_history (
    id bigint NOT NULL,
    order_id integer DEFAULT 0 NOT NULL,
    status_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.order_status_history OWNER TO postgres;

--
-- Name: order_status_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_status_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_status_history_id_seq OWNER TO postgres;

--
-- Name: order_status_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_status_history_id_seq OWNED BY public.order_status_history.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id bigint NOT NULL,
    invoice_id character varying(100),
    user_id integer DEFAULT 0 NOT NULL,
    address_id integer DEFAULT 0 NOT NULL,
    total double precision DEFAULT '0'::double precision,
    vat double precision DEFAULT '0'::double precision,
    discount double precision DEFAULT '0'::double precision,
    grand_total double precision DEFAULT '0'::double precision,
    payment_mode integer DEFAULT 0 NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    booking_date timestamp(0) without time zone,
    total_qty integer DEFAULT 0 NOT NULL,
    total_items_qty integer DEFAULT 0 NOT NULL,
    oder_type integer DEFAULT 0 NOT NULL,
    admin_commission double precision DEFAULT '0'::double precision,
    vendor_commission double precision DEFAULT '0'::double precision,
    shipping_charge double precision DEFAULT '0'::double precision,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_muted integer DEFAULT 0 NOT NULL,
    refund_method integer DEFAULT 0 NOT NULL,
    refund_requested integer DEFAULT 0 NOT NULL,
    refund_requested_date character varying(600),
    order_no character varying(600),
    ref_history_id character varying(255) DEFAULT '0'::character varying,
    ref_code character varying(255) DEFAULT ''::character varying,
    withdraw_status integer,
    withdraw_request_at timestamp(0) without time zone,
    vendor_id character varying(255),
    admin_commission_per character varying(255),
    vendor_commission_per character varying(255),
    admin_commission_percentage character varying(255) DEFAULT '0'::character varying,
    vendor_commission_percentage character varying(255) DEFAULT '0'::character varying,
    activity_id integer DEFAULT 0,
    order_type integer DEFAULT 0 NOT NULL,
    order_number text,
    pick_up_date character varying(255) DEFAULT ''::character varying,
    pick_up_time character varying(255) DEFAULT ''::character varying,
    service_charge double precision DEFAULT '0'::double precision NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- Name: orders_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_services (
    order_id bigint NOT NULL,
    invoice_id character varying(600),
    user_id integer DEFAULT 0 NOT NULL,
    address_id integer DEFAULT 0 NOT NULL,
    total double precision,
    vat double precision,
    discount double precision,
    grand_total double precision,
    payment_mode integer DEFAULT 0 NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    booking_date character varying(600),
    admin_commission double precision,
    vendor_commission double precision,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_mute integer DEFAULT 0 NOT NULL,
    refund_method integer DEFAULT 0 NOT NULL,
    refund_requested integer DEFAULT 0 NOT NULL,
    refund_accepted integer DEFAULT 0 NOT NULL,
    refund_requested_date character varying(600),
    refund_accepted_date character varying(600),
    order_no character varying(600),
    coupon_id integer DEFAULT 0 NOT NULL,
    coupon_vender_id integer DEFAULT 0 NOT NULL,
    read_admin integer DEFAULT 0 NOT NULL,
    accepted_vendor integer DEFAULT 0 NOT NULL,
    accepted_date timestamp(0) without time zone,
    ref_history_id integer DEFAULT 0 NOT NULL,
    ref_code character varying(600),
    activity_id integer DEFAULT 0 NOT NULL,
    user_latitude text,
    user_longitude text,
    service_charge double precision DEFAULT '0'::double precision NOT NULL,
    task_description character varying(600),
    doc character varying(600)
);


ALTER TABLE public.orders_services OWNER TO postgres;

--
-- Name: orders_services_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_services_items (
    id bigint NOT NULL,
    order_id integer DEFAULT 0 NOT NULL,
    service_id integer DEFAULT 0 NOT NULL,
    price double precision,
    discount double precision,
    total double precision,
    order_status double precision,
    admin_commission double precision,
    vendor_commission double precision,
    booking_date character varying(600),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    accepted_vendor integer DEFAULT 0 NOT NULL,
    accepted_date character varying(600),
    text character varying(600),
    hourly_rate double precision DEFAULT '0'::double precision NOT NULL,
    task_description text,
    doc character varying(600),
    qty integer DEFAULT 0 NOT NULL,
    withdraw_status integer DEFAULT 0 NOT NULL,
    withdraw_request_at timestamp(0) without time zone,
    vat double precision DEFAULT '0'::double precision NOT NULL,
    vendor_comment character varying(600),
    vendor_doc character varying(600)
);


ALTER TABLE public.orders_services_items OWNER TO postgres;

--
-- Name: orders_services_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_services_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_services_items_id_seq OWNER TO postgres;

--
-- Name: orders_services_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_services_items_id_seq OWNED BY public.orders_services_items.id;


--
-- Name: orders_services_mute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_services_mute (
    id bigint NOT NULL,
    vendor_id integer DEFAULT 0 NOT NULL,
    service_order_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.orders_services_mute OWNER TO postgres;

--
-- Name: orders_services_mute_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_services_mute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_services_mute_id_seq OWNER TO postgres;

--
-- Name: orders_services_mute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_services_mute_id_seq OWNED BY public.orders_services_mute.id;


--
-- Name: orders_services_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_services_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_services_order_id_seq OWNER TO postgres;

--
-- Name: orders_services_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_services_order_id_seq OWNED BY public.orders_services.order_id;


--
-- Name: orders_services_rejected; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_services_rejected (
    id bigint NOT NULL,
    vendor_id integer DEFAULT 0 NOT NULL,
    service_order_id integer DEFAULT 0 NOT NULL,
    service_order_item_id bigint DEFAULT '0'::bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.orders_services_rejected OWNER TO postgres;

--
-- Name: orders_services_rejected_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_services_rejected_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_services_rejected_id_seq OWNER TO postgres;

--
-- Name: orders_services_rejected_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_services_rejected_id_seq OWNED BY public.orders_services_rejected.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- Name: payment_report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_report (
    id bigint NOT NULL,
    transaction_id character varying(255),
    payment_status character varying(255),
    user_id integer DEFAULT 0 NOT NULL,
    ref_id character varying(255),
    amount numeric(8,2) NOT NULL,
    method_type integer DEFAULT 1 NOT NULL,
    vat numeric(8,2) DEFAULT '0'::numeric NOT NULL,
    wallet_amount_used numeric(8,2) DEFAULT '0'::numeric NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.payment_report OWNER TO postgres;

--
-- Name: payment_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_report_id_seq OWNER TO postgres;

--
-- Name: payment_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_report_id_seq OWNED BY public.payment_report.id;


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
-- Name: post_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_comments (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL,
    parent_id integer DEFAULT 0 NOT NULL,
    comment text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    comment_node_id text
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
    post_id integer NOT NULL,
    user_id integer NOT NULL,
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
-- Name: post_saves; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_saves (
    id bigint NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.post_saves OWNER TO postgres;

--
-- Name: post_saves_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_saves_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_saves_id_seq OWNER TO postgres;

--
-- Name: post_saves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_saves_id_seq OWNED BY public.post_saves.id;


--
-- Name: post_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_users (
    id bigint NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.post_users OWNER TO postgres;

--
-- Name: post_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_users_id_seq OWNER TO postgres;

--
-- Name: post_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_users_id_seq OWNED BY public.post_users.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    caption character varying(2500),
    file_type integer DEFAULT 1 NOT NULL,
    file text,
    location_name text,
    lattitude character varying(250),
    longitude character varying(250),
    post_firebase_node_id character varying(250),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    active integer DEFAULT 1 NOT NULL,
    visibility character varying(20) DEFAULT 'public'::character varying NOT NULL,
    extra_file_names text
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
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id bigint NOT NULL,
    product_type integer DEFAULT 0 NOT NULL,
    product_desc_full text,
    product_desc_short text,
    product_sale_from character varying(200),
    product_sale_to character varying(200),
    product_featured_image character varying(600),
    product_tag character varying(600),
    product_created_by integer DEFAULT 0 NOT NULL,
    product_updated_by integer DEFAULT 0 NOT NULL,
    product_status integer DEFAULT 0 NOT NULL,
    product_deleted integer DEFAULT 0 NOT NULL,
    product_name character varying(900),
    product_variation_type integer DEFAULT 0 NOT NULL,
    product_taxable integer DEFAULT 1 NOT NULL,
    product_vender_id integer DEFAULT 0 NOT NULL,
    product_image character varying(200),
    product_unique_iden character varying(200),
    product_brand_id integer DEFAULT 0 NOT NULL,
    product_name_arabic character varying(900),
    product_desc_full_arabic text,
    product_desc_short_arabic text,
    cash_points integer DEFAULT 0 NOT NULL,
    offer_enabled integer DEFAULT 0 NOT NULL,
    deal_enabled integer DEFAULT 0 NOT NULL,
    is_today_offer integer DEFAULT 0 NOT NULL,
    today_offer_date character varying(200),
    thanku_perc double precision,
    custom_status integer,
    meta_title text,
    meta_keyword text,
    meta_description text,
    product_vendor_status integer DEFAULT 0 NOT NULL,
    product_gender character varying(100),
    is_kandora integer DEFAULT 0 NOT NULL,
    collection_id integer DEFAULT 0 NOT NULL,
    hot_offer_enabled integer DEFAULT 0 NOT NULL,
    trending_enabled integer DEFAULT 0 NOT NULL,
    offers_list integer DEFAULT 0 NOT NULL,
    zero_quantity_orders integer DEFAULT 0 NOT NULL,
    product_code character varying(300),
    product_tags character varying(1000),
    sort_order integer DEFAULT 0 NOT NULL,
    offer_for_short integer DEFAULT 0 NOT NULL,
    hot_offer_sort_order integer DEFAULT 0 NOT NULL,
    new_trending_sort_order integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    default_category_id integer DEFAULT 0 NOT NULL,
    default_attribute_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    brand character varying(600),
    store_id integer DEFAULT 0 NOT NULL,
    moda_main_category integer DEFAULT 0 NOT NULL,
    moda_sub_category integer DEFAULT 0 NOT NULL,
    featured integer DEFAULT 0 NOT NULL,
    master_product integer DEFAULT 0 NOT NULL,
    boxcount character varying(100),
    activity_id bigint,
    recommended integer DEFAULT 0 NOT NULL,
    rating_avg double precision,
    shipment_and_policies character varying(600),
    new_arrival character varying(255),
    for_you character varying(255),
    trending character varying(255)
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_attribute (
    attribute_id bigint NOT NULL,
    attribute_name character varying(400),
    attribute_status integer DEFAULT 0 NOT NULL,
    attribute_created_date timestamp(0) without time zone,
    attribute_name_arabic character varying(600),
    attribute_type integer,
    is_deleted integer DEFAULT 0
);


ALTER TABLE public.product_attribute OWNER TO postgres;

--
-- Name: product_attribute_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_attribute_attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_attribute_attribute_id_seq OWNER TO postgres;

--
-- Name: product_attribute_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_attribute_attribute_id_seq OWNED BY public.product_attribute.attribute_id;


--
-- Name: product_attribute_values; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_attribute_values (
    attribute_values_id bigint NOT NULL,
    attribute_id integer DEFAULT 0 NOT NULL,
    attribute_values character varying(600),
    attribute_values_arabic character varying(600) NOT NULL,
    attribute_value_in integer DEFAULT 1 NOT NULL,
    attribute_value_color character varying(600),
    attribute_value_label character varying(600),
    attribute_value_label_arabic character varying(600),
    attribute_value_image character varying(600),
    is_deleted integer DEFAULT 0 NOT NULL,
    attribute_value_sort_order integer DEFAULT 0 NOT NULL,
    attribute_color character varying(600)
);


ALTER TABLE public.product_attribute_values OWNER TO postgres;

--
-- Name: product_attribute_values_attribute_values_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_attribute_values_attribute_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_attribute_values_attribute_values_id_seq OWNER TO postgres;

--
-- Name: product_attribute_values_attribute_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_attribute_values_attribute_values_id_seq OWNED BY public.product_attribute_values.attribute_values_id;


--
-- Name: product_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_category (
    product_category_id bigint NOT NULL,
    product_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.product_category OWNER TO postgres;

--
-- Name: product_category_product_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_category_product_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_category_product_category_id_seq OWNER TO postgres;

--
-- Name: product_category_product_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_category_product_category_id_seq OWNED BY public.product_category.product_category_id;


--
-- Name: product_cuisines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cuisines (
    id bigint NOT NULL,
    product_id integer DEFAULT 0 NOT NULL,
    cuisine_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.product_cuisines OWNER TO postgres;

--
-- Name: product_cuisines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_cuisines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_cuisines_id_seq OWNER TO postgres;

--
-- Name: product_cuisines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_cuisines_id_seq OWNED BY public.product_cuisines.id;


--
-- Name: product_docs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_docs (
    id bigint NOT NULL,
    product_id integer DEFAULT 0 NOT NULL,
    title character varying(600),
    doc_path character varying(600)
);


ALTER TABLE public.product_docs OWNER TO postgres;

--
-- Name: product_docs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_docs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_docs_id_seq OWNER TO postgres;

--
-- Name: product_docs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_docs_id_seq OWNED BY public.product_docs.id;


--
-- Name: product_features; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_features (
    id bigint NOT NULL,
    name character varying(255),
    image_path character varying(255),
    description character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.product_features OWNER TO postgres;

--
-- Name: product_features_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_features_id_seq OWNER TO postgres;

--
-- Name: product_features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_features_id_seq OWNED BY public.product_features.id;


--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- Name: product_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_images (
    id bigint NOT NULL,
    product_id integer NOT NULL,
    image_name text NOT NULL,
    product_attribute_id integer NOT NULL
);


ALTER TABLE public.product_images OWNER TO postgres;

--
-- Name: product_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_images_id_seq OWNER TO postgres;

--
-- Name: product_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_images_id_seq OWNED BY public.product_images.id;


--
-- Name: product_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_items (
    item_id bigint NOT NULL,
    product_id integer DEFAULT 0 NOT NULL,
    name character varying(255),
    image_path character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.product_items OWNER TO postgres;

--
-- Name: product_items_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_items_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_items_item_id_seq OWNER TO postgres;

--
-- Name: product_items_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_items_item_id_seq OWNED BY public.product_items.item_id;


--
-- Name: product_likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_likes (
    id bigint NOT NULL,
    product_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.product_likes OWNER TO postgres;

--
-- Name: product_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_likes_id_seq OWNER TO postgres;

--
-- Name: product_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_likes_id_seq OWNED BY public.product_likes.id;


--
-- Name: product_master; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_master (
    id bigint NOT NULL,
    name character varying(600),
    active integer DEFAULT 0 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.product_master OWNER TO postgres;

--
-- Name: product_master_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_master_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_master_id_seq OWNER TO postgres;

--
-- Name: product_master_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_master_id_seq OWNED BY public.product_master.id;


--
-- Name: product_master_request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_master_request (
    id bigint NOT NULL,
    name character varying(600),
    description character varying(600),
    vendor_id integer DEFAULT 0 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    accepted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    product_type integer DEFAULT 0 NOT NULL,
    category character varying(600)
);


ALTER TABLE public.product_master_request OWNER TO postgres;

--
-- Name: product_master_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_master_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_master_request_id_seq OWNER TO postgres;

--
-- Name: product_master_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_master_request_id_seq OWNED BY public.product_master_request.id;


--
-- Name: product_product_feature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_product_feature (
    id bigint NOT NULL,
    product_id integer,
    product_feature_id integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    feature_title character varying(600)
);


ALTER TABLE public.product_product_feature OWNER TO postgres;

--
-- Name: product_product_feature_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_product_feature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_product_feature_id_seq OWNER TO postgres;

--
-- Name: product_product_feature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_product_feature_id_seq OWNED BY public.product_product_feature.id;


--
-- Name: product_selected_attribute_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_selected_attribute_list (
    product_attribute_id bigint NOT NULL,
    product_id integer DEFAULT 0 NOT NULL,
    manage_stock integer DEFAULT 0 NOT NULL,
    stock_quantity double precision,
    allow_back_order integer DEFAULT 0 NOT NULL,
    stock_status integer DEFAULT 0 NOT NULL,
    sold_individually integer DEFAULT 0 NOT NULL,
    weight double precision,
    length double precision,
    height double precision,
    width double precision,
    shipping_class integer DEFAULT 0 NOT NULL,
    sale_price double precision,
    regular_price double precision,
    taxable integer DEFAULT 0 NOT NULL,
    image character varying(600),
    shipping_note character varying(600),
    title character varying(600),
    rating double precision,
    rated_users integer DEFAULT 0 NOT NULL,
    image_temp character varying(600),
    barcode character varying(600),
    image_action character varying(600),
    pr_code character varying(600),
    product_desc text,
    product_full_descr text,
    size_chart character varying(600)
);


ALTER TABLE public.product_selected_attribute_list OWNER TO postgres;

--
-- Name: product_selected_attribute_list_product_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_selected_attribute_list_product_attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_selected_attribute_list_product_attribute_id_seq OWNER TO postgres;

--
-- Name: product_selected_attribute_list_product_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_selected_attribute_list_product_attribute_id_seq OWNED BY public.product_selected_attribute_list.product_attribute_id;


--
-- Name: product_selected_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_selected_attributes (
    product_selected_attributes_id bigint NOT NULL,
    attribute_id integer DEFAULT 0 NOT NULL,
    attribute_values_id integer DEFAULT 0 NOT NULL,
    product_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.product_selected_attributes OWNER TO postgres;

--
-- Name: product_selected_attributes_product_selected_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_selected_attributes_product_selected_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_selected_attributes_product_selected_attributes_id_seq OWNER TO postgres;

--
-- Name: product_selected_attributes_product_selected_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_selected_attributes_product_selected_attributes_id_seq OWNED BY public.product_selected_attributes.product_selected_attributes_id;


--
-- Name: product_specifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_specifications (
    prod_spec_id bigint NOT NULL,
    product_id integer DEFAULT 0 NOT NULL,
    spec_title text,
    spec_descp text,
    lang integer DEFAULT 1,
    spec_title_arabic text,
    spec_descp_arabic text
);


ALTER TABLE public.product_specifications OWNER TO postgres;

--
-- Name: product_specifications_prod_spec_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_specifications_prod_spec_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_specifications_prod_spec_id_seq OWNER TO postgres;

--
-- Name: product_specifications_prod_spec_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_specifications_prod_spec_id_seq OWNED BY public.product_specifications.prod_spec_id;


--
-- Name: product_temp_image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_temp_image (
    id bigint NOT NULL,
    product_id integer DEFAULT 0 NOT NULL,
    product_attribute_id integer DEFAULT 0 NOT NULL,
    image character varying(600),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.product_temp_image OWNER TO postgres;

--
-- Name: product_temp_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_temp_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_temp_image_id_seq OWNER TO postgres;

--
-- Name: product_temp_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_temp_image_id_seq OWNED BY public.product_temp_image.id;


--
-- Name: product_variations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_variations (
    product_variations_id bigint NOT NULL,
    attribute_id integer DEFAULT 0 NOT NULL,
    attribute_values_id integer DEFAULT 0 NOT NULL,
    product_attribute_id integer DEFAULT 0 NOT NULL,
    product_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.product_variations OWNER TO postgres;

--
-- Name: product_variations_product_variations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_variations_product_variations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_variations_product_variations_id_seq OWNER TO postgres;

--
-- Name: product_variations_product_variations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_variations_product_variations_id_seq OWNED BY public.product_variations.product_variations_id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    product_type integer DEFAULT 1 NOT NULL,
    name character varying(2500) NOT NULL,
    active integer DEFAULT 1 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    updated_by integer DEFAULT 0 NOT NULL,
    company_id integer DEFAULT 0 NOT NULL,
    store_id integer DEFAULT 0 NOT NULL,
    description text NOT NULL,
    featured integer DEFAULT 0 NOT NULL,
    meta_title text,
    meta_description text,
    meta_keywords text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.products OWNER TO postgres;

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
-- Name: promotion_banners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotion_banners (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    image_name text NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    url character varying(1600),
    type integer DEFAULT 0 NOT NULL,
    product integer DEFAULT 0 NOT NULL,
    service integer DEFAULT 0 NOT NULL,
    banner_type integer DEFAULT 0 NOT NULL,
    activity integer DEFAULT 0 NOT NULL,
    store integer DEFAULT 0 NOT NULL,
    category integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.promotion_banners OWNER TO postgres;

--
-- Name: promotion_banners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promotion_banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promotion_banners_id_seq OWNER TO postgres;

--
-- Name: promotion_banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promotion_banners_id_seq OWNED BY public.promotion_banners.id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratings (
    id bigint NOT NULL,
    type integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    product_id integer DEFAULT 0 NOT NULL,
    product_varient_id integer DEFAULT 0 NOT NULL,
    service_id integer DEFAULT 0 NOT NULL,
    vendor_id integer DEFAULT 0 NOT NULL,
    rating double precision,
    title text,
    comment text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    order_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.ratings OWNER TO postgres;

--
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ratings_id_seq OWNER TO postgres;

--
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;


--
-- Name: ratings_reply; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratings_reply (
    id bigint NOT NULL,
    rating_id integer DEFAULT 0 NOT NULL,
    message character varying(600),
    user_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.ratings_reply OWNER TO postgres;

--
-- Name: ratings_reply_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ratings_reply_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ratings_reply_id_seq OWNER TO postgres;

--
-- Name: ratings_reply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ratings_reply_id_seq OWNED BY public.ratings_reply.id;


--
-- Name: ref_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_history (
    id bigint NOT NULL,
    sender_id bigint DEFAULT '0'::bigint NOT NULL,
    accepted_user_id bigint DEFAULT '0'::bigint NOT NULL,
    name character varying(255),
    ref_code character varying(255),
    status integer DEFAULT 0 NOT NULL,
    discount integer DEFAULT 0,
    discount_type character varying(255) DEFAULT '1'::character varying,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.ref_history OWNER TO postgres;

--
-- Name: ref_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ref_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_history_id_seq OWNER TO postgres;

--
-- Name: ref_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ref_history_id_seq OWNED BY public.ref_history.id;


--
-- Name: service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service (
    id bigint NOT NULL,
    name character varying(600),
    image character varying(600),
    service_price double precision,
    active integer DEFAULT 0 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    "order" integer DEFAULT 0 NOT NULL,
    description text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    included text,
    service_user_id bigint,
    building_type character varying(255),
    service_type character varying(255),
    contract_type character varying(255),
    duration text DEFAULT '0'::text NOT NULL,
    building_type_id integer,
    "time" character varying(255),
    document character varying(255),
    order_count integer DEFAULT 0 NOT NULL,
    service_price_type text DEFAULT 'Hourly'::text,
    activity_id integer DEFAULT 0 NOT NULL,
    price_label character varying(600),
    sort_order integer DEFAULT 0 NOT NULL,
    from_date character varying(200),
    to_date character varying(200),
    seats character varying(200),
    term_and_condition text,
    work_shop_details character varying(200),
    to_time character varying(200),
    from_time character varying(200),
    location character varying(200),
    latitude character varying(200),
    longitude character varying(200),
    vendor_id integer,
    feature_image character varying(255)
);


ALTER TABLE public.service OWNER TO postgres;

--
-- Name: COLUMN service.service_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.service_type IS '0 for one day, 1 for week, 2 for month';


--
-- Name: COLUMN service.contract_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.contract_type IS '0 for fresh, 1 for Extention';


--
-- Name: service_assigned_vendors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_assigned_vendors (
    id bigint NOT NULL,
    vendor_user_id integer NOT NULL,
    order_id integer NOT NULL,
    service_status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.service_assigned_vendors OWNER TO postgres;

--
-- Name: service_assigned_vendors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_assigned_vendors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_assigned_vendors_id_seq OWNER TO postgres;

--
-- Name: service_assigned_vendors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_assigned_vendors_id_seq OWNED BY public.service_assigned_vendors.id;


--
-- Name: service_bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_bookings (
    id bigint NOT NULL,
    service_id integer DEFAULT 0,
    user_id integer DEFAULT 0,
    vendor_id integer DEFAULT 0,
    seat_no character varying(600) DEFAULT '0'::character varying,
    status character varying(255),
    payment_type character varying(255),
    price character varying(255),
    service_charge character varying(255),
    "Workshop_price" character varying(255),
    tax character varying(255),
    grand_total character varying(255),
    ref_id character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    number_of_seats character varying(255),
    order_number character varying(255)
);


ALTER TABLE public.service_bookings OWNER TO postgres;

--
-- Name: service_bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_bookings_id_seq OWNER TO postgres;

--
-- Name: service_bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_bookings_id_seq OWNED BY public.service_bookings.id;


--
-- Name: service_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_category (
    id bigint NOT NULL,
    name character varying(600),
    image character varying(600),
    banner_image character varying(600),
    parent_id integer DEFAULT 0 NOT NULL,
    active integer DEFAULT 0 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    "order" integer DEFAULT 0 NOT NULL,
    description character varying(600),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    activity_id integer DEFAULT 0 NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.service_category OWNER TO postgres;

--
-- Name: service_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_category_id_seq OWNER TO postgres;

--
-- Name: service_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_category_id_seq OWNED BY public.service_category.id;


--
-- Name: service_category_selected; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_category_selected (
    id bigint NOT NULL,
    service_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.service_category_selected OWNER TO postgres;

--
-- Name: service_category_selected_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_category_selected_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_category_selected_id_seq OWNER TO postgres;

--
-- Name: service_category_selected_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_category_selected_id_seq OWNED BY public.service_category_selected.id;


--
-- Name: service_event_feature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_event_feature (
    id bigint NOT NULL,
    service_id integer,
    event_feature_id integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    feature_title character varying(600)
);


ALTER TABLE public.service_event_feature OWNER TO postgres;

--
-- Name: service_event_feature_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_event_feature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_event_feature_id_seq OWNER TO postgres;

--
-- Name: service_event_feature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_event_feature_id_seq OWNED BY public.service_event_feature.id;


--
-- Name: service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_id_seq OWNER TO postgres;

--
-- Name: service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_id_seq OWNED BY public.service.id;


--
-- Name: service_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_images (
    id bigint NOT NULL,
    service_id bigint NOT NULL,
    image character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.service_images OWNER TO postgres;

--
-- Name: service_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_images_id_seq OWNER TO postgres;

--
-- Name: service_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_images_id_seq OWNED BY public.service_images.id;


--
-- Name: service_include; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_include (
    id bigint NOT NULL,
    service_id integer,
    title character varying(255),
    description text,
    icon character varying(600),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.service_include OWNER TO postgres;

--
-- Name: service_include_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_include_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_include_id_seq OWNER TO postgres;

--
-- Name: service_include_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_include_id_seq OWNED BY public.service_include.id;


--
-- Name: service_order_status_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_order_status_history (
    id bigint NOT NULL,
    order_id integer DEFAULT 0 NOT NULL,
    order_item_id integer DEFAULT 0 NOT NULL,
    status_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.service_order_status_history OWNER TO postgres;

--
-- Name: service_order_status_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_order_status_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_order_status_history_id_seq OWNER TO postgres;

--
-- Name: service_order_status_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_order_status_history_id_seq OWNED BY public.service_order_status_history.id;


--
-- Name: service_timings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_timings (
    id bigint NOT NULL,
    vendor_id integer DEFAULT 0 NOT NULL,
    has_24_hour integer DEFAULT 0 NOT NULL,
    service_id integer DEFAULT 0 NOT NULL,
    day character varying(255) NOT NULL,
    time_from character varying(255),
    time_to character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.service_timings OWNER TO postgres;

--
-- Name: service_timings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_timings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_timings_id_seq OWNER TO postgres;

--
-- Name: service_timings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_timings_id_seq OWNED BY public.service_timings.id;


--
-- Name: service_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_type (
    id bigint NOT NULL,
    name character varying(255),
    description text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.service_type OWNER TO postgres;

--
-- Name: service_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_type_id_seq OWNER TO postgres;

--
-- Name: service_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_type_id_seq OWNED BY public.service_type.id;


--
-- Name: service_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.service_types OWNER TO postgres;

--
-- Name: service_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_types_id_seq OWNER TO postgres;

--
-- Name: service_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_types_id_seq OWNED BY public.service_types.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    id bigint NOT NULL,
    admin_commission double precision NOT NULL,
    shipping_charge double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    tax_percentage double precision DEFAULT '0'::double precision NOT NULL,
    store_radius double precision DEFAULT '20'::double precision NOT NULL,
    service_radius double precision DEFAULT '20'::double precision NOT NULL,
    service_charge double precision DEFAULT '0'::double precision NOT NULL
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
-- Name: skin_colors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skin_colors (
    id bigint NOT NULL,
    name character varying(255),
    color character varying(30) NOT NULL,
    active smallint DEFAULT '1'::smallint NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.skin_colors OWNER TO postgres;

--
-- Name: skin_colors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skin_colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skin_colors_id_seq OWNER TO postgres;

--
-- Name: skin_colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skin_colors_id_seq OWNED BY public.skin_colors.id;


--
-- Name: states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.states (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    active smallint DEFAULT '1'::smallint NOT NULL,
    country_id integer,
    created_uid integer,
    updated_uid integer,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.states OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.states_id_seq OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- Name: store_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_images (
    id bigint NOT NULL,
    image character varying(900),
    store_id bigint NOT NULL
);


ALTER TABLE public.store_images OWNER TO postgres;

--
-- Name: store_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_images_id_seq OWNER TO postgres;

--
-- Name: store_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_images_id_seq OWNED BY public.store_images.id;


--
-- Name: store_likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_likes (
    id bigint NOT NULL,
    store_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.store_likes OWNER TO postgres;

--
-- Name: store_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_likes_id_seq OWNER TO postgres;

--
-- Name: store_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_likes_id_seq OWNED BY public.store_likes.id;


--
-- Name: store_managers_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_managers_types (
    id bigint NOT NULL,
    name character varying(600) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    vendor_id bigint
);


ALTER TABLE public.store_managers_types OWNER TO postgres;

--
-- Name: store_managers_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_managers_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_managers_types_id_seq OWNER TO postgres;

--
-- Name: store_managers_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_managers_types_id_seq OWNED BY public.store_managers_types.id;


--
-- Name: store_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_type (
    id bigint NOT NULL,
    name character varying(600) NOT NULL,
    banner_image character varying(600),
    active integer DEFAULT 0 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.store_type OWNER TO postgres;

--
-- Name: store_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_type_id_seq OWNER TO postgres;

--
-- Name: store_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_type_id_seq OWNED BY public.store_type.id;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stores (
    id bigint NOT NULL,
    vendor_id bigint NOT NULL,
    industry_type integer DEFAULT 0,
    store_name character varying(1000),
    business_email character varying(250),
    dial_code character varying(5),
    mobile character varying(20),
    description text,
    location character varying(1500) NOT NULL,
    latitude character varying(255),
    longitude character varying(255),
    address_line1 character varying(900),
    address_line2 character varying(255),
    country_id bigint NOT NULL,
    state_id bigint,
    city_id bigint,
    zip character varying(10),
    logo character varying(900),
    cover_image character varying(900),
    license_number character varying(100),
    license_doc character varying(900),
    vat_cert_number character varying(100),
    vat_cert_doc character varying(900),
    active smallint DEFAULT '1'::smallint NOT NULL,
    verified smallint DEFAULT '0'::smallint NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_uid bigint,
    updated_uid bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    commission double precision,
    tax_number character varying(15),
    tax_street character varying(255),
    tax_address_line_2 character varying(255),
    tax_city character varying(100),
    tax_state character varying(100),
    tax_post_code character varying(10),
    tax_phone character varying(15),
    bank_country character varying(255),
    tax_seller_type character varying(255),
    residence_country character varying(255),
    dob_day character varying(255),
    dob_month character varying(255),
    dob_year character varying(255),
    shop_currency character varying(255),
    shop_language character varying(255),
    first_name character varying(255),
    last_name character varying(255)
);


ALTER TABLE public.stores OWNER TO postgres;

--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_id_seq OWNER TO postgres;

--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stores_id_seq OWNED BY public.stores.id;


--
-- Name: subscribers_emails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscribers_emails (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.subscribers_emails OWNER TO postgres;

--
-- Name: subscribers_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscribers_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscribers_emails_id_seq OWNER TO postgres;

--
-- Name: subscribers_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscribers_emails_id_seq OWNED BY public.subscribers_emails.id;


--
-- Name: temp_order_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_order_products (
    id bigint NOT NULL,
    order_id integer DEFAULT 0 NOT NULL,
    product_id integer DEFAULT 0 NOT NULL,
    product_attribute_id integer DEFAULT 0 NOT NULL,
    product_type integer DEFAULT 0 NOT NULL,
    quantity integer DEFAULT 0 NOT NULL,
    price double precision,
    discount double precision,
    total double precision,
    vendor_id integer DEFAULT 0 NOT NULL,
    admin_commission double precision,
    vendor_commission double precision,
    shipping_charge double precision
);


ALTER TABLE public.temp_order_products OWNER TO postgres;

--
-- Name: temp_order_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_order_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_order_products_id_seq OWNER TO postgres;

--
-- Name: temp_order_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_order_products_id_seq OWNED BY public.temp_order_products.id;


--
-- Name: temp_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_orders (
    id bigint NOT NULL,
    invoice_id character varying(100),
    user_id integer DEFAULT 0 NOT NULL,
    address_id integer DEFAULT 0 NOT NULL,
    total double precision DEFAULT '0'::double precision,
    vat double precision DEFAULT '0'::double precision,
    discount double precision DEFAULT '0'::double precision,
    grand_total double precision DEFAULT '0'::double precision,
    payment_mode integer DEFAULT 0 NOT NULL,
    admin_commission double precision DEFAULT '0'::double precision,
    vendor_commission double precision DEFAULT '0'::double precision,
    shipping_charge double precision DEFAULT '0'::double precision,
    temp_id character varying(255) NOT NULL,
    ref_history_id character varying(255) DEFAULT '0'::character varying,
    ref_code character varying(255) DEFAULT ''::character varying,
    admin_commission_percentage character varying(255) DEFAULT '0'::character varying,
    vendor_commission_percentage character varying(255) DEFAULT '0'::character varying,
    order_type integer DEFAULT 0 NOT NULL,
    pick_up_date character varying(255) DEFAULT ''::character varying,
    pick_up_time character varying(255) DEFAULT ''::character varying,
    service_charge double precision DEFAULT '0'::double precision NOT NULL
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
-- Name: temp_service_order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_service_order_items (
    id bigint NOT NULL,
    order_id integer DEFAULT 0 NOT NULL,
    service_id integer DEFAULT 0 NOT NULL,
    price double precision NOT NULL,
    discount double precision NOT NULL,
    total double precision NOT NULL,
    admin_commission double precision NOT NULL,
    vendor_commission double precision NOT NULL,
    booking_date character varying(600),
    text character varying(600),
    hourly_rate double precision DEFAULT '0'::double precision NOT NULL,
    task_description text,
    doc character varying(600),
    qty integer DEFAULT 0 NOT NULL,
    vat double precision DEFAULT '0'::double precision NOT NULL
);


ALTER TABLE public.temp_service_order_items OWNER TO postgres;

--
-- Name: temp_service_order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_service_order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_service_order_items_id_seq OWNER TO postgres;

--
-- Name: temp_service_order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_service_order_items_id_seq OWNED BY public.temp_service_order_items.id;


--
-- Name: temp_service_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_service_orders (
    id bigint NOT NULL,
    invoice_id character varying(600),
    user_id integer DEFAULT 0 NOT NULL,
    address_id integer DEFAULT 0 NOT NULL,
    total double precision,
    vat double precision,
    discount double precision,
    grand_total double precision,
    payment_mode integer DEFAULT 0 NOT NULL,
    admin_commission double precision,
    vendor_commission double precision,
    temp_id character varying(600),
    booking_date character varying(600),
    coupon_id integer DEFAULT 0 NOT NULL,
    ref_history_id integer DEFAULT 0 NOT NULL,
    ref_code character varying(600),
    user_latitude text,
    user_longitude text,
    service_charge double precision DEFAULT '0'::double precision NOT NULL,
    task_description character varying(600),
    doc character varying(600)
);


ALTER TABLE public.temp_service_orders OWNER TO postgres;

--
-- Name: temp_service_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_service_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_service_orders_id_seq OWNER TO postgres;

--
-- Name: temp_service_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_service_orders_id_seq OWNED BY public.temp_service_orders.id;


--
-- Name: temp_user_account_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_user_account_types (
    id bigint NOT NULL,
    temp_user_id integer NOT NULL,
    account_type_id integer NOT NULL,
    activity_type_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.temp_user_account_types OWNER TO postgres;

--
-- Name: temp_user_account_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_user_account_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_user_account_types_id_seq OWNER TO postgres;

--
-- Name: temp_user_account_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_user_account_types_id_seq OWNED BY public.temp_user_account_types.id;


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
    updated_at timestamp(0) without time zone
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
-- Name: tesimonial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tesimonial (
    id bigint NOT NULL,
    name character varying(255),
    designation character varying(255),
    comment text,
    rating double precision DEFAULT '0'::double precision NOT NULL,
    user_image character varying(255),
    deleted integer DEFAULT 0 NOT NULL,
    active integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.tesimonial OWNER TO postgres;

--
-- Name: tesimonial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tesimonial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tesimonial_id_seq OWNER TO postgres;

--
-- Name: tesimonial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tesimonial_id_seq OWNED BY public.tesimonial.id;


--
-- Name: transport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transport (
    id bigint NOT NULL,
    title character varying(600),
    description character varying(600),
    url character varying(1600),
    image character varying(600),
    active integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.transport OWNER TO postgres;

--
-- Name: transport_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transport_id_seq OWNER TO postgres;

--
-- Name: transport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transport_id_seq OWNED BY public.transport.id;


--
-- Name: user_account_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_account_types (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    account_type_id integer NOT NULL,
    activity_type_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_account_types OWNER TO postgres;

--
-- Name: user_account_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_account_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_account_types_id_seq OWNER TO postgres;

--
-- Name: user_account_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_account_types_id_seq OWNED BY public.user_account_types.id;


--
-- Name: user_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_address (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    full_name character varying(255) NOT NULL,
    dial_code character varying(5) NOT NULL,
    phone character varying(20) NOT NULL,
    address text NOT NULL,
    country_id integer DEFAULT 0 NOT NULL,
    state_id integer DEFAULT 0 NOT NULL,
    city_id integer DEFAULT 0 NOT NULL,
    address_type character varying(255) DEFAULT 'Home'::character varying NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    is_default integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    land_mark character varying(600),
    building_name character varying(600),
    latitude character varying(600),
    longitude character varying(600),
    location character varying(1600),
    area_id character varying(255) DEFAULT ''::character varying,
    apartment character varying(255) DEFAULT ''::character varying,
    street character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.user_address OWNER TO postgres;

--
-- Name: user_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_address_id_seq OWNER TO postgres;

--
-- Name: user_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_address_id_seq OWNED BY public.user_address.id;


--
-- Name: user_follows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_follows (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    follow_user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_follows OWNER TO postgres;

--
-- Name: user_follows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_follows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_follows_id_seq OWNER TO postgres;

--
-- Name: user_follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_follows_id_seq OWNED BY public.user_follows.id;


--
-- Name: user_privileges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_privileges (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    designation_id bigint NOT NULL,
    privileges character varying(1600),
    status smallint DEFAULT '1'::smallint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_privileges OWNER TO postgres;

--
-- Name: user_privileges_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_privileges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_privileges_id_seq OWNER TO postgres;

--
-- Name: user_privileges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_privileges_id_seq OWNED BY public.user_privileges.id;


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
    first_name character varying(255),
    last_name character varying(255),
    user_image character varying(255),
    user_phone_otp character varying(255),
    user_device_token character varying(255),
    user_device_type character varying(255),
    user_access_token character varying(255),
    firebase_user_key character varying(255),
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    country_id integer DEFAULT 0 NOT NULL,
    state_id integer DEFAULT 0 NOT NULL,
    city_id integer DEFAULT 0 NOT NULL,
    area integer DEFAULT 0 NOT NULL,
    active integer DEFAULT 0 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    display_name character varying(600),
    business_name character varying(600),
    email_verified integer DEFAULT 0 NOT NULL,
    user_email_otp character varying(255),
    dob date,
    vendor integer DEFAULT 0 NOT NULL,
    store integer DEFAULT 0 NOT NULL,
    previllege integer DEFAULT 0 NOT NULL,
    about_me text,
    verified integer DEFAULT 0 NOT NULL,
    designation_id bigint,
    is_private_profile integer DEFAULT 0 NOT NULL,
    user_name character varying(150),
    gender integer DEFAULT 1 NOT NULL,
    website character varying(2500),
    wallet_amount double precision DEFAULT '0'::double precision NOT NULL,
    password_reset_code character varying(600),
    password_reset_time character varying(600),
    approve integer DEFAULT 0 NOT NULL,
    user_permissions text,
    password_reset_otp character varying(600),
    is_social character varying(255) DEFAULT '0'::character varying,
    activity_id bigint,
    temp_dial_code character varying(255) DEFAULT ''::character varying,
    temp_mobile character varying(255) DEFAULT ''::character varying,
    minimum_order_amount double precision,
    ref_code character varying(255) DEFAULT ''::character varying,
    is_dinein integer DEFAULT 0 NOT NULL,
    is_delivery integer DEFAULT 0 NOT NULL,
    designation_name character varying(255) DEFAULT ''::character varying,
    admin_viewed integer DEFAULT 0 NOT NULL,
    delivery_charge integer DEFAULT 0 NOT NULL,
    location character varying(255),
    two_factor_auth character varying(255)
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
-- Name: users_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_role (
    id bigint NOT NULL,
    role_name character varying(200) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users_role OWNER TO postgres;

--
-- Name: users_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_role_id_seq OWNER TO postgres;

--
-- Name: users_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_role_id_seq OWNED BY public.users_role.id;


--
-- Name: vendor_cuisines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_cuisines (
    id bigint NOT NULL,
    vendor_id integer DEFAULT 0 NOT NULL,
    cuisine_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.vendor_cuisines OWNER TO postgres;

--
-- Name: vendor_cuisines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_cuisines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_cuisines_id_seq OWNER TO postgres;

--
-- Name: vendor_cuisines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_cuisines_id_seq OWNED BY public.vendor_cuisines.id;


--
-- Name: vendor_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_details (
    id bigint NOT NULL,
    homedelivery integer DEFAULT 1 NOT NULL,
    logo character varying(600),
    key_control integer DEFAULT 0 NOT NULL,
    branches integer DEFAULT 0 NOT NULL,
    company_name character varying(600),
    company_brand character varying(600),
    legal_staus character varying(600),
    reg_date timestamp(0) without time zone,
    trade_license character varying(600),
    trade_license_expiry timestamp(0) without time zone,
    vat_reg_number character varying(600),
    vat_reg_expiry timestamp(0) without time zone,
    address1 character varying(600),
    address2 character varying(600),
    street character varying(600),
    zip character varying(300),
    trade_license_doc character varying(600),
    chamber_of_commerce_doc character varying(600),
    share_certificate_doc character varying(600),
    power_attorny_doc character varying(600),
    vat_reg_doc character varying(600),
    signed_agreement_doc character varying(600),
    identy1_type integer DEFAULT 0 NOT NULL,
    identy1_doc character varying(600),
    identy2_type integer DEFAULT 0 NOT NULL,
    identy2_doc character varying(600),
    company_identy1_type integer DEFAULT 0 NOT NULL,
    company_identy1_doc character varying(600),
    company_identy2_type integer DEFAULT 0 NOT NULL,
    company_identy2_doc character varying(600),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    industry_type integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    store_type integer DEFAULT 0 NOT NULL,
    txt_location character varying(600),
    location character varying(600),
    latitude character varying(600),
    longitude character varying(600),
    area character varying(600),
    pharmacycommission double precision,
    servicecommission double precision,
    featured_flag integer DEFAULT 0 NOT NULL,
    open_time character varying(600),
    close_time character varying(600),
    description text,
    cover_image character varying(600),
    country character varying(255) DEFAULT '0'::character varying,
    city character varying(255) DEFAULT '0'::character varying,
    street1 character varying(255) DEFAULT '0'::character varying,
    street2 character varying(255) DEFAULT '0'::character varying,
    state character varying(255) DEFAULT '0'::character varying,
    postal_code character varying(255) DEFAULT '0'::character varying,
    phone_number character varying(255) DEFAULT '0'::character varying
);


ALTER TABLE public.vendor_details OWNER TO postgres;

--
-- Name: vendor_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_details_id_seq OWNER TO postgres;

--
-- Name: vendor_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_details_id_seq OWNED BY public.vendor_details.id;


--
-- Name: vendor_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_locations (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    location text,
    latitude character varying(255),
    longitude character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_default integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.vendor_locations OWNER TO postgres;

--
-- Name: vendor_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_locations_id_seq OWNER TO postgres;

--
-- Name: vendor_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_locations_id_seq OWNED BY public.vendor_locations.id;


--
-- Name: vendor_menu_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_menu_images (
    id bigint NOT NULL,
    vendor_id integer DEFAULT 0 NOT NULL,
    image character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.vendor_menu_images OWNER TO postgres;

--
-- Name: vendor_menu_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_menu_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_menu_images_id_seq OWNER TO postgres;

--
-- Name: vendor_menu_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_menu_images_id_seq OWNED BY public.vendor_menu_images.id;


--
-- Name: vendor_service_timings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_service_timings (
    id bigint NOT NULL,
    service_id integer DEFAULT 0 NOT NULL,
    vendor integer DEFAULT 0 NOT NULL,
    sunday integer DEFAULT 0 NOT NULL,
    sun_from character varying(255),
    sun_to character varying(255),
    monday integer DEFAULT 0 NOT NULL,
    mon_from character varying(255),
    mon_to character varying(255),
    tuesday integer DEFAULT 0 NOT NULL,
    tues_from character varying(255),
    tues_to character varying(255),
    wednesday integer DEFAULT 0 NOT NULL,
    wed_from character varying(255),
    wed_to character varying(255),
    thursday integer DEFAULT 0 NOT NULL,
    thurs_from character varying(255),
    thurs_to character varying(255),
    friday integer DEFAULT 0 NOT NULL,
    fri_from character varying(255),
    fri_to character varying(255),
    saturday integer DEFAULT 0 NOT NULL,
    sat_from character varying(255),
    sat_to character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.vendor_service_timings OWNER TO postgres;

--
-- Name: vendor_service_timings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_service_timings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_service_timings_id_seq OWNER TO postgres;

--
-- Name: vendor_service_timings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_service_timings_id_seq OWNED BY public.vendor_service_timings.id;


--
-- Name: vendor_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_services (
    id bigint NOT NULL,
    vendor_id bigint NOT NULL,
    service_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.vendor_services OWNER TO postgres;

--
-- Name: vendor_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_services_id_seq OWNER TO postgres;

--
-- Name: vendor_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_services_id_seq OWNED BY public.vendor_services.id;


--
-- Name: vendor_timings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_timings (
    id bigint NOT NULL,
    vendor_id integer NOT NULL,
    has_24_hour integer DEFAULT 0 NOT NULL,
    service_id integer NOT NULL,
    day character varying(255) NOT NULL,
    time_from character varying(255),
    time_to character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.vendor_timings OWNER TO postgres;

--
-- Name: vendor_timings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_timings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_timings_id_seq OWNER TO postgres;

--
-- Name: vendor_timings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_timings_id_seq OWNED BY public.vendor_timings.id;


--
-- Name: wallet_histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallet_histories (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    wallet_amount double precision DEFAULT '0'::double precision NOT NULL,
    pay_type character varying(255) NOT NULL,
    description character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    pay_method integer DEFAULT 0 NOT NULL
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
-- Name: wallet_payment_report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallet_payment_report (
    id bigint NOT NULL,
    transaction_id character varying(255),
    payment_status character varying(255),
    user_id integer DEFAULT 0 NOT NULL,
    ref_id character varying(255),
    amount numeric(8,2) NOT NULL,
    method_type integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.wallet_payment_report OWNER TO postgres;

--
-- Name: wallet_payment_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wallet_payment_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wallet_payment_report_id_seq OWNER TO postgres;

--
-- Name: wallet_payment_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallet_payment_report_id_seq OWNED BY public.wallet_payment_report.id;


--
-- Name: web_banners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.web_banners (
    id bigint NOT NULL,
    name character varying(255),
    description text,
    banner_image character varying(600),
    button_link character varying(255),
    active integer DEFAULT 1,
    deleted integer DEFAULT 0,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.web_banners OWNER TO postgres;

--
-- Name: web_banners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.web_banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_banners_id_seq OWNER TO postgres;

--
-- Name: web_banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.web_banners_id_seq OWNED BY public.web_banners.id;


--
-- Name: websockets_statistics_entries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.websockets_statistics_entries (
    id integer NOT NULL,
    app_id character varying(255) NOT NULL,
    peak_connection_count integer NOT NULL,
    websocket_message_count integer NOT NULL,
    api_message_count integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.websockets_statistics_entries OWNER TO postgres;

--
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.websockets_statistics_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.websockets_statistics_entries_id_seq OWNER TO postgres;

--
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.websockets_statistics_entries_id_seq OWNED BY public.websockets_statistics_entries.id;


--
-- Name: account_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_type ALTER COLUMN id SET DEFAULT nextval('public.account_type_id_seq'::regclass);


--
-- Name: activity_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_type ALTER COLUMN id SET DEFAULT nextval('public.activity_type_id_seq'::regclass);


--
-- Name: admin_designation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_designation ALTER COLUMN id SET DEFAULT nextval('public.admin_designation_id_seq'::regclass);


--
-- Name: amount_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amount_type ALTER COLUMN id SET DEFAULT nextval('public.amount_type_id_seq'::regclass);


--
-- Name: app_banners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_banners ALTER COLUMN id SET DEFAULT nextval('public.app_banners_id_seq'::regclass);


--
-- Name: app_home_sections id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_home_sections ALTER COLUMN id SET DEFAULT nextval('public.app_home_sections_id_seq'::regclass);


--
-- Name: area id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area ALTER COLUMN id SET DEFAULT nextval('public.area_id_seq'::regclass);


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: attribute_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_type ALTER COLUMN id SET DEFAULT nextval('public.attribute_type_id_seq'::regclass);


--
-- Name: attribute_values id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_values ALTER COLUMN id SET DEFAULT nextval('public.attribute_values_id_seq'::regclass);


--
-- Name: attribute_values_request id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_values_request ALTER COLUMN id SET DEFAULT nextval('public.attribute_values_request_id_seq'::regclass);


--
-- Name: attributes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attributes ALTER COLUMN id SET DEFAULT nextval('public.attributes_id_seq'::regclass);


--
-- Name: bank id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank ALTER COLUMN id SET DEFAULT nextval('public.bank_id_seq'::regclass);


--
-- Name: bank_code_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_code_types ALTER COLUMN id SET DEFAULT nextval('public.bank_code_types_id_seq'::regclass);


--
-- Name: bank_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_details ALTER COLUMN id SET DEFAULT nextval('public.bank_details_id_seq'::regclass);


--
-- Name: blogs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq'::regclass);


--
-- Name: brand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand ALTER COLUMN id SET DEFAULT nextval('public.brand_id_seq'::regclass);


--
-- Name: building_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.building_type ALTER COLUMN id SET DEFAULT nextval('public.building_type_id_seq'::regclass);


--
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);


--
-- Name: cart_service id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_service ALTER COLUMN id SET DEFAULT nextval('public.cart_service_id_seq'::regclass);


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: cleaning_services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cleaning_services ALTER COLUMN id SET DEFAULT nextval('public.cleaning_services_id_seq'::regclass);


--
-- Name: comment_likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_likes ALTER COLUMN id SET DEFAULT nextval('public.comment_likes_id_seq'::regclass);


--
-- Name: comment_taged_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_taged_users ALTER COLUMN id SET DEFAULT nextval('public.comment_taged_users_id_seq'::regclass);


--
-- Name: contact_us id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us ALTER COLUMN id SET DEFAULT nextval('public.contact_us_id_seq'::regclass);


--
-- Name: contact_us_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us_settings ALTER COLUMN id SET DEFAULT nextval('public.contact_us_settings_id_seq'::regclass);


--
-- Name: contracting id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracting ALTER COLUMN id SET DEFAULT nextval('public.contracting_id_seq'::regclass);


--
-- Name: country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- Name: coupon id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon ALTER COLUMN id SET DEFAULT nextval('public.coupon_id_seq'::regclass);


--
-- Name: coupon_brand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_brand ALTER COLUMN id SET DEFAULT nextval('public.coupon_brand_id_seq'::regclass);


--
-- Name: coupon_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_category ALTER COLUMN id SET DEFAULT nextval('public.coupon_category_id_seq'::regclass);


--
-- Name: coupon_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_images ALTER COLUMN id SET DEFAULT nextval('public.coupon_images_id_seq'::regclass);


--
-- Name: coupon_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_products ALTER COLUMN id SET DEFAULT nextval('public.coupon_products_id_seq'::regclass);


--
-- Name: coupon_services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_services ALTER COLUMN id SET DEFAULT nextval('public.coupon_services_id_seq'::regclass);


--
-- Name: coupon_vendor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_vendor ALTER COLUMN id SET DEFAULT nextval('public.coupon_vendor_id_seq'::regclass);


--
-- Name: coupon_vendor_service_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_vendor_service_order ALTER COLUMN id SET DEFAULT nextval('public.coupon_vendor_service_order_id_seq'::regclass);


--
-- Name: coupons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons ALTER COLUMN id SET DEFAULT nextval('public.coupons_id_seq'::regclass);


--
-- Name: coupons_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons_category ALTER COLUMN id SET DEFAULT nextval('public.coupons_category_id_seq'::regclass);


--
-- Name: cuisines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuisines ALTER COLUMN id SET DEFAULT nextval('public.cuisines_id_seq'::regclass);


--
-- Name: currencies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currencies ALTER COLUMN id SET DEFAULT nextval('public.currencies_id_seq'::regclass);


--
-- Name: custom_banners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_banners ALTER COLUMN id SET DEFAULT nextval('public.custom_banners_id_seq'::regclass);


--
-- Name: designations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.designations ALTER COLUMN id SET DEFAULT nextval('public.designations_id_seq'::regclass);


--
-- Name: event_features id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_features ALTER COLUMN id SET DEFAULT nextval('public.event_features_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: faq id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faq ALTER COLUMN id SET DEFAULT nextval('public.faq_id_seq'::regclass);


--
-- Name: featured_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.featured_products ALTER COLUMN id SET DEFAULT nextval('public.featured_products_id_seq'::regclass);


--
-- Name: featured_products_img id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.featured_products_img ALTER COLUMN id SET DEFAULT nextval('public.featured_products_img_id_seq'::regclass);


--
-- Name: hair_colors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hair_colors ALTER COLUMN id SET DEFAULT nextval('public.hair_colors_id_seq'::regclass);


--
-- Name: help id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help ALTER COLUMN id SET DEFAULT nextval('public.help_id_seq'::regclass);


--
-- Name: help_topics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help_topics ALTER COLUMN id SET DEFAULT nextval('public.help_topics_id_seq'::regclass);


--
-- Name: home_logos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_logos ALTER COLUMN id SET DEFAULT nextval('public.home_logos_id_seq'::regclass);


--
-- Name: hourly_rate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hourly_rate ALTER COLUMN id SET DEFAULT nextval('public.hourly_rate_id_seq'::regclass);


--
-- Name: industry_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industry_types ALTER COLUMN id SET DEFAULT nextval('public.industry_types_id_seq'::regclass);


--
-- Name: landing_page_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.landing_page_settings ALTER COLUMN id SET DEFAULT nextval('public.landing_page_settings_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: main_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_category ALTER COLUMN id SET DEFAULT nextval('public.main_category_id_seq'::regclass);


--
-- Name: maintainance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintainance ALTER COLUMN id SET DEFAULT nextval('public.maintainance_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: moda_main_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moda_main_categories ALTER COLUMN id SET DEFAULT nextval('public.moda_main_categories_id_seq'::regclass);


--
-- Name: moda_sub_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moda_sub_categories ALTER COLUMN id SET DEFAULT nextval('public.moda_sub_categories_id_seq'::regclass);


--
-- Name: my_moda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.my_moda ALTER COLUMN id SET DEFAULT nextval('public.my_moda_id_seq'::regclass);


--
-- Name: my_moda_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.my_moda_items ALTER COLUMN id SET DEFAULT nextval('public.my_moda_items_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: order_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products ALTER COLUMN id SET DEFAULT nextval('public.order_products_id_seq'::regclass);


--
-- Name: order_request_view id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_request_view ALTER COLUMN id SET DEFAULT nextval('public.order_request_view_id_seq'::regclass);


--
-- Name: order_status_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_history ALTER COLUMN id SET DEFAULT nextval('public.order_status_history_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: orders_services order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services ALTER COLUMN order_id SET DEFAULT nextval('public.orders_services_order_id_seq'::regclass);


--
-- Name: orders_services_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services_items ALTER COLUMN id SET DEFAULT nextval('public.orders_services_items_id_seq'::regclass);


--
-- Name: orders_services_mute id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services_mute ALTER COLUMN id SET DEFAULT nextval('public.orders_services_mute_id_seq'::regclass);


--
-- Name: orders_services_rejected id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services_rejected ALTER COLUMN id SET DEFAULT nextval('public.orders_services_rejected_id_seq'::regclass);


--
-- Name: payment_report id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_report ALTER COLUMN id SET DEFAULT nextval('public.payment_report_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: post_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments ALTER COLUMN id SET DEFAULT nextval('public.post_comments_id_seq'::regclass);


--
-- Name: post_likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_likes ALTER COLUMN id SET DEFAULT nextval('public.post_likes_id_seq'::regclass);


--
-- Name: post_saves id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_saves ALTER COLUMN id SET DEFAULT nextval('public.post_saves_id_seq'::regclass);


--
-- Name: post_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_users ALTER COLUMN id SET DEFAULT nextval('public.post_users_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- Name: product_attribute attribute_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_attribute ALTER COLUMN attribute_id SET DEFAULT nextval('public.product_attribute_attribute_id_seq'::regclass);


--
-- Name: product_attribute_values attribute_values_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_attribute_values ALTER COLUMN attribute_values_id SET DEFAULT nextval('public.product_attribute_values_attribute_values_id_seq'::regclass);


--
-- Name: product_category product_category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category ALTER COLUMN product_category_id SET DEFAULT nextval('public.product_category_product_category_id_seq'::regclass);


--
-- Name: product_cuisines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cuisines ALTER COLUMN id SET DEFAULT nextval('public.product_cuisines_id_seq'::regclass);


--
-- Name: product_docs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_docs ALTER COLUMN id SET DEFAULT nextval('public.product_docs_id_seq'::regclass);


--
-- Name: product_features id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_features ALTER COLUMN id SET DEFAULT nextval('public.product_features_id_seq'::regclass);


--
-- Name: product_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images ALTER COLUMN id SET DEFAULT nextval('public.product_images_id_seq'::regclass);


--
-- Name: product_items item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_items ALTER COLUMN item_id SET DEFAULT nextval('public.product_items_item_id_seq'::regclass);


--
-- Name: product_likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_likes ALTER COLUMN id SET DEFAULT nextval('public.product_likes_id_seq'::regclass);


--
-- Name: product_master id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_master ALTER COLUMN id SET DEFAULT nextval('public.product_master_id_seq'::regclass);


--
-- Name: product_master_request id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_master_request ALTER COLUMN id SET DEFAULT nextval('public.product_master_request_id_seq'::regclass);


--
-- Name: product_product_feature id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_product_feature ALTER COLUMN id SET DEFAULT nextval('public.product_product_feature_id_seq'::regclass);


--
-- Name: product_selected_attribute_list product_attribute_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_selected_attribute_list ALTER COLUMN product_attribute_id SET DEFAULT nextval('public.product_selected_attribute_list_product_attribute_id_seq'::regclass);


--
-- Name: product_selected_attributes product_selected_attributes_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_selected_attributes ALTER COLUMN product_selected_attributes_id SET DEFAULT nextval('public.product_selected_attributes_product_selected_attributes_id_seq'::regclass);


--
-- Name: product_specifications prod_spec_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_specifications ALTER COLUMN prod_spec_id SET DEFAULT nextval('public.product_specifications_prod_spec_id_seq'::regclass);


--
-- Name: product_temp_image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_temp_image ALTER COLUMN id SET DEFAULT nextval('public.product_temp_image_id_seq'::regclass);


--
-- Name: product_variations product_variations_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variations ALTER COLUMN product_variations_id SET DEFAULT nextval('public.product_variations_product_variations_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: promotion_banners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_banners ALTER COLUMN id SET DEFAULT nextval('public.promotion_banners_id_seq'::regclass);


--
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- Name: ratings_reply id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings_reply ALTER COLUMN id SET DEFAULT nextval('public.ratings_reply_id_seq'::regclass);


--
-- Name: ref_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_history ALTER COLUMN id SET DEFAULT nextval('public.ref_history_id_seq'::regclass);


--
-- Name: service id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service ALTER COLUMN id SET DEFAULT nextval('public.service_id_seq'::regclass);


--
-- Name: service_assigned_vendors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_assigned_vendors ALTER COLUMN id SET DEFAULT nextval('public.service_assigned_vendors_id_seq'::regclass);


--
-- Name: service_bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_bookings ALTER COLUMN id SET DEFAULT nextval('public.service_bookings_id_seq'::regclass);


--
-- Name: service_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_category ALTER COLUMN id SET DEFAULT nextval('public.service_category_id_seq'::regclass);


--
-- Name: service_category_selected id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_category_selected ALTER COLUMN id SET DEFAULT nextval('public.service_category_selected_id_seq'::regclass);


--
-- Name: service_event_feature id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_event_feature ALTER COLUMN id SET DEFAULT nextval('public.service_event_feature_id_seq'::regclass);


--
-- Name: service_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_images ALTER COLUMN id SET DEFAULT nextval('public.service_images_id_seq'::regclass);


--
-- Name: service_include id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_include ALTER COLUMN id SET DEFAULT nextval('public.service_include_id_seq'::regclass);


--
-- Name: service_order_status_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_order_status_history ALTER COLUMN id SET DEFAULT nextval('public.service_order_status_history_id_seq'::regclass);


--
-- Name: service_timings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_timings ALTER COLUMN id SET DEFAULT nextval('public.service_timings_id_seq'::regclass);


--
-- Name: service_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_type ALTER COLUMN id SET DEFAULT nextval('public.service_type_id_seq'::regclass);


--
-- Name: service_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_types ALTER COLUMN id SET DEFAULT nextval('public.service_types_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: skin_colors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin_colors ALTER COLUMN id SET DEFAULT nextval('public.skin_colors_id_seq'::regclass);


--
-- Name: states id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- Name: store_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_images ALTER COLUMN id SET DEFAULT nextval('public.store_images_id_seq'::regclass);


--
-- Name: store_likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_likes ALTER COLUMN id SET DEFAULT nextval('public.store_likes_id_seq'::regclass);


--
-- Name: store_managers_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_managers_types ALTER COLUMN id SET DEFAULT nextval('public.store_managers_types_id_seq'::regclass);


--
-- Name: store_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_type ALTER COLUMN id SET DEFAULT nextval('public.store_type_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores ALTER COLUMN id SET DEFAULT nextval('public.stores_id_seq'::regclass);


--
-- Name: subscribers_emails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscribers_emails ALTER COLUMN id SET DEFAULT nextval('public.subscribers_emails_id_seq'::regclass);


--
-- Name: temp_order_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_order_products ALTER COLUMN id SET DEFAULT nextval('public.temp_order_products_id_seq'::regclass);


--
-- Name: temp_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_orders ALTER COLUMN id SET DEFAULT nextval('public.temp_orders_id_seq'::regclass);


--
-- Name: temp_service_order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_service_order_items ALTER COLUMN id SET DEFAULT nextval('public.temp_service_order_items_id_seq'::regclass);


--
-- Name: temp_service_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_service_orders ALTER COLUMN id SET DEFAULT nextval('public.temp_service_orders_id_seq'::regclass);


--
-- Name: temp_user_account_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_user_account_types ALTER COLUMN id SET DEFAULT nextval('public.temp_user_account_types_id_seq'::regclass);


--
-- Name: temp_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users ALTER COLUMN id SET DEFAULT nextval('public.temp_users_id_seq'::regclass);


--
-- Name: tesimonial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tesimonial ALTER COLUMN id SET DEFAULT nextval('public.tesimonial_id_seq'::regclass);


--
-- Name: transport id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transport ALTER COLUMN id SET DEFAULT nextval('public.transport_id_seq'::regclass);


--
-- Name: user_account_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account_types ALTER COLUMN id SET DEFAULT nextval('public.user_account_types_id_seq'::regclass);


--
-- Name: user_address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address ALTER COLUMN id SET DEFAULT nextval('public.user_address_id_seq'::regclass);


--
-- Name: user_follows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_follows ALTER COLUMN id SET DEFAULT nextval('public.user_follows_id_seq'::regclass);


--
-- Name: user_privileges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_privileges ALTER COLUMN id SET DEFAULT nextval('public.user_privileges_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_role ALTER COLUMN id SET DEFAULT nextval('public.users_role_id_seq'::regclass);


--
-- Name: vendor_cuisines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_cuisines ALTER COLUMN id SET DEFAULT nextval('public.vendor_cuisines_id_seq'::regclass);


--
-- Name: vendor_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_details ALTER COLUMN id SET DEFAULT nextval('public.vendor_details_id_seq'::regclass);


--
-- Name: vendor_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_locations ALTER COLUMN id SET DEFAULT nextval('public.vendor_locations_id_seq'::regclass);


--
-- Name: vendor_menu_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_menu_images ALTER COLUMN id SET DEFAULT nextval('public.vendor_menu_images_id_seq'::regclass);


--
-- Name: vendor_service_timings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_service_timings ALTER COLUMN id SET DEFAULT nextval('public.vendor_service_timings_id_seq'::regclass);


--
-- Name: vendor_services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_services ALTER COLUMN id SET DEFAULT nextval('public.vendor_services_id_seq'::regclass);


--
-- Name: vendor_timings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_timings ALTER COLUMN id SET DEFAULT nextval('public.vendor_timings_id_seq'::regclass);


--
-- Name: wallet_histories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_histories ALTER COLUMN id SET DEFAULT nextval('public.wallet_histories_id_seq'::regclass);


--
-- Name: wallet_payment_report id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_payment_report ALTER COLUMN id SET DEFAULT nextval('public.wallet_payment_report_id_seq'::regclass);


--
-- Name: web_banners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.web_banners ALTER COLUMN id SET DEFAULT nextval('public.web_banners_id_seq'::regclass);


--
-- Name: websockets_statistics_entries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.websockets_statistics_entries ALTER COLUMN id SET DEFAULT nextval('public.websockets_statistics_entries_id_seq'::regclass);


--
-- Data for Name: account_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_type (id, name, description, sort_order, status, indvidual_name, indvidual_image, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: activity_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activity_type (id, account_id, name, description, logo, sort_order, status, availbale_for, indvidual_name, indvidual_logo, deleted, created_at, updated_at, banner_image) FROM stdin;
\.


--
-- Data for Name: admin_designation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_designation (id, name, is_deletd) FROM stdin;
\.


--
-- Data for Name: amount_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.amount_type (id, name) FROM stdin;
1	%
2	Amount
\.


--
-- Data for Name: app_banners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_banners (id, banner_title, banner_image, active, created_by, updated_by, created_at, updated_at, type, category, product, service, banner_type, activity, store, url, is_type_gift) FROM stdin;
2	Sam Banner	1736229753Frame 1171275012.png	1	1	1	2024-12-02 10:17:12	2025-01-07 06:02:33	1	0	0	0	1	0	0	\N	\N
3	\N	1736229728Frame 1171275008.png	1	1	1	2024-12-02 10:53:54	2025-01-11 09:55:04	1	0	0	0	1	0	0	\N	1
\.


--
-- Data for Name: app_home_sections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_home_sections (id, type, entity_id, title, status, sort_order, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: area; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.area (id, country_id, city_id, name, status, latitude, longitude, deleted_at, created_at, updated_at) FROM stdin;
1	1	1	International City	1	\N	\N	\N	2024-12-20 11:34:47	2024-12-20 11:34:47
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles (id, title_en, title_ar, status, desc_en, desc_ar, meta_title, meta_keyword, meta_description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: attribute_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attribute_type (id, attribute_type_name, attribute_type_uid, attribute_type_status) FROM stdin;
1	Dropdown	dropdown	1
2	Button	radio	1
3	Image Selection	radio_image	1
4	Color Box	radio_button_group	1
\.


--
-- Data for Name: attribute_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attribute_values (id, attribute_id, attribute_values, attribute_value_in, attribute_value_color, deleted, created_uid, updated_uid, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: attribute_values_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attribute_values_request (id, request_id, attribute, value) FROM stdin;
\.


--
-- Data for Name: attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attributes (id, attribute_name, active, attribute_type, industry_type, company_id, store_id, is_common, deleted, created_uid, updated_uid, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank (id, name, created_at, updated_at) FROM stdin;
1	Test	2025-01-06 11:17:48	\N
2	RAK	2025-01-07 06:49:19	\N
\.


--
-- Data for Name: bank_code_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank_code_types (id, name, country_id, active, deleted, created_at, updated_at) FROM stdin;
1	IFSC (India)	0	0	0	\N	\N
2	SORT CODE (UK)	0	0	0	\N	\N
3	SWIFT CODE	0	0	0	\N	\N
\.


--
-- Data for Name: bank_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank_details (id, bank_name, company_account, code_type, account_no, branch_code, branch_name, bank_statement_doc, credit_card_sta_doc, country, user_id, created_at, updated_at, iban) FROM stdin;
1	1	test Beneficiary	0	98765432223	54567	Test Branch Name	\N	\N	1	4	2025-01-06 11:18:49	2025-01-06 11:18:49	98764f6656
2	2	TomPay	0	101010101010	AABBCCDD	Ajman	/uploads/company/677cce581abc1_1736232536.jpg	\N	1	16	2025-01-07 06:48:56	2025-01-07 06:52:54	AABB1010101010
3	1	test	0	8764433	54567	test	\N	\N	1	5	2025-01-07 07:05:51	2025-01-07 07:05:51	te644474
4	2	David	0	101010101010	AABBCCDDEE	Ajman	/uploads/company/677cea4870442_1736239688.png	\N	1	17	2025-01-07 08:48:08	2025-01-07 08:48:08	AABB1212121212
5	2	Steve	0	101010101010	AABBCCDDEE	Ajman	/uploads/company/677cec5da2828_1736240221.jpg	\N	1	18	2025-01-07 08:57:01	2025-01-07 08:57:01	AABB1212121212
6	2	Marthur	0	101010101010	AABBCCDD	Ajman	/uploads/company/677e216c77291_1736319340.jpg	\N	1	30	2025-01-08 06:55:40	2025-01-08 06:55:40	AABB10101010
7	India	111111111111111	0	\N	\N	\N	\N	\N	0	41	2025-01-08 16:23:12	2025-01-08 16:23:12	11111111111111111111111
8	India	111111111111111	0	\N	\N	\N	\N	\N	0	41	2025-01-08 16:23:23	2025-01-08 16:23:23	11111111111111111111111
9	India	111111111111111	0	\N	\N	\N	\N	\N	0	41	2025-01-08 16:24:37	2025-01-08 16:24:37	11111111111111111111111
10	Aladdin	111111111111111	0	\N	\N	\N	\N	\N	0	42	2025-01-08 16:32:13	2025-01-08 16:32:13	11111111111111111111111
11	Aladdin	111111111111111	0	\N	\N	\N	\N	\N	0	42	2025-01-08 16:32:30	2025-01-08 16:32:30	11111111111111111111111
12	Aladdin	111111111111111	0	\N	\N	\N	\N	\N	0	42	2025-01-08 16:38:05	2025-01-08 16:38:05	11111111111111111111111
13	Aladdin	111111111111111	0	\N	\N	\N	\N	\N	0	42	2025-01-08 16:41:15	2025-01-08 16:41:15	11111111111111111111111
14	Aladdin	111111111111111	0	\N	\N	\N	\N	\N	0	42	2025-01-08 16:43:01	2025-01-08 16:43:01	11111111111111111111111
15	Aladdin	111111111111111	0	\N	\N	\N	\N	\N	0	42	2025-01-08 16:43:22	2025-01-08 16:43:22	11111111111111111111111
16	rak bank	111111111111111	0	\N	\N	\N	\N	\N	0	45	2025-01-09 15:02:08	2025-01-09 15:02:08	123rwrqwrwrrqw235255235
17	adadadasda	231312313131231	0	\N	\N	\N	\N	\N	0	50	2025-01-10 09:12:23	2025-01-10 09:12:23	asdsasdadasdadasdasdada
18	asdasdasdas	231231231231231	0	\N	\N	\N	\N	\N	0	51	2025-01-10 09:29:53	2025-01-10 09:29:53	asdadasdsadasdasdasdasd
19	Rak Bank	110011001100110	0	\N	\N	\N	\N	\N	0	52	2025-01-10 09:45:17	2025-01-10 09:45:17	AABB1100110011001100110
\.


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blogs (id, name, description, blog_image, active, deleted, created_at, updated_at) FROM stdin;
1	Unique Designs, Unique You	<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or rand..</p>	1736344430post-1.jpg	t	0	2025-01-08 13:53:50	2025-01-08 13:53:50
2	Intelligent beautiful HTML template	<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or rand...</p>	1736344473post-2.jpg	t	0	2025-01-08 13:54:33	2025-01-08 13:54:33
3	Creative, flexible and affordable	<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or rand...</p>	1736344517post-3.jpg	t	0	2025-01-08 13:55:17	2025-01-08 13:55:17
\.


--
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brand (id, name, industry_type, image, active, created_at, updated_at, deleted, activity_id) FROM stdin;
1	Native	0	\N	1	2024-07-02 09:16:22	2024-07-02 11:09:20	0	7
2	Malabar	0	/uploads/brand/677d09ef2e1fe_1736247791.jpg	1	2025-01-07 11:03:11	2025-01-07 11:03:11	0	7
3	Joyalukkas	0	/uploads/brand/677d0a0095ba8_1736247808.jpg	1	2025-01-07 11:03:28	2025-01-07 11:03:28	0	7
4	Pan	0	/uploads/brand/677d0a11cf261_1736247825.jpg	1	2025-01-07 11:03:45	2025-01-07 11:03:45	0	7
5	Splash	0	/uploads/brand/677d0a2007995_1736247840.jpg	1	2025-01-07 11:04:00	2025-01-07 11:04:00	0	7
6	Max	0	/uploads/brand/677d0a320a140_1736247858.jpg	1	2025-01-07 11:04:18	2025-01-07 11:04:18	0	7
\.


--
-- Data for Name: building_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.building_type (id, name, description, created_at, updated_at, active, deleted) FROM stdin;
\.


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, product_id, product_attribute_id, quantity, user_id, store_id, device_cart_id, created_at, updated_at) FROM stdin;
97	31	32	1	0	0	e00448f245d1212e01b976be02b3e8e3	2025-01-14 13:49:30	2025-01-14 13:49:30
91	18	18	2	15	18	12d4d9f3ec83ed7c	2025-01-14 10:38:23	2025-01-15 05:15:07
96	26	27	3	1	0	4ba7c267218642e5f46ce63441f201c5	2025-01-14 13:16:45	2025-01-15 06:04:55
\.


--
-- Data for Name: cart_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_service (id, service_id, user_id, device_cart_id, booked_time, created_at, updated_at, building_type_id, text, hourly_rate, task_description, doc, qty) FROM stdin;
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name, image, banner_image, parent_id, active, deleted, sort_order, created_uid, updated_uid, created_at, updated_at, activity_id, home_page, sub_title, is_gift, show_gift_page, is_handmade) FROM stdin;
10	Top	/uploads/category/678741b23aff7_1736917426.jpg	/uploads/category/6784be2d218cc_1736752685.jpg	0	1	0	0	1	1	2025-01-13 07:18:05	2025-01-15 05:03:46	7	f	\N	1	1	t
9	Accessories	/uploads/category/678741d4b08a8_1736917460.jpg	/uploads/category/6784be0a476dd_1736752650.jpg	0	1	0	0	1	1	2025-01-13 07:17:30	2025-01-15 05:04:20	7	f	\N	1	1	\N
6	Baby Gift Sub	\N	\N	5	0	1	0	1	1	2024-07-02 10:55:29	2024-07-02 11:10:03	0	f	\N	\N	\N	f
8	Top	/uploads/category/678741f726fd0_1736917495.jpg	/uploads/category/677e1f746bdda_1736318836.jpg	0	1	0	0	1	1	2025-01-08 06:47:16	2025-01-15 05:04:55	7	t	\N	\N	\N	t
2	ALL PRODUCTS	/uploads/category/677cc66ba1a4e_1736230507.png	/uploads/category/677cf04f3d67e_1736241231.jpg	0	0	1	0	1	1	2024-07-02 09:11:55	2025-01-15 05:05:04	7	t	\N	\N	\N	\N
5	NEW ARRIVAL	/uploads/category/677cc6bb17abf_1736230587.png	/uploads/category/677cf07492672_1736241268.jpg	0	0	1	0	1	1	2024-07-02 09:15:50	2025-01-15 05:05:12	7	t	\N	\N	\N	\N
3	JEWELRY	/uploads/category/6787421d811e0_1736917533.jpg	/uploads/category/677cf037205ee_1736241207.jpg	0	1	0	0	1	1	2024-07-02 09:14:22	2025-01-15 05:05:33	7	t	\N	\N	\N	\N
4	EXPLORE DECOR	/uploads/category/677ceffdcbb22_1736241149.jpg	/uploads/category/677cf0296ad04_1736241193.jpg	0	1	0	0	1	1	2024-07-02 09:15:20	2025-01-13 10:29:18	7	t	\N	\N	\N	\N
7	Sama	/uploads/category/677ccbda3da34_1736231898.JPG	/uploads/category/677ccbda3e6d8_1736231898.png	2	0	1	0	1	1	2025-01-07 06:38:18	2025-01-07 09:11:58	7	f	\N	\N	\N	f
1	EXPLORE CLOTHES	/uploads/category/677e7860bb8f2_1736341600.jpg	/uploads/category/677e7860bba3e_1736341600.jpg	0	0	1	0	1	1	2024-07-02 09:11:24	2025-01-15 04:09:04	7	t	\N	\N	\N	\N
13	Ladies	/uploads/category/6787417d26cd3_1736917373.jpg	/uploads/category/6784bf6cd5755_1736753004.jpg	0	1	0	0	1	1	2025-01-13 07:23:24	2025-01-15 05:02:53	7	f	\N	1	1	\N
11	Leather	/uploads/category/6787419da3c8a_1736917405.jpg	/uploads/category/6784bf43b2efd_1736752963.jpg	0	1	0	0	1	1	2025-01-13 07:22:43	2025-01-15 05:03:25	7	f	\N	1	1	t
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name, active, country_id, state_id, created_uid, updated_uid, deleted, created_at, updated_at) FROM stdin;
1	Dubai	1	1	0	1	\N	0	2024-06-28 06:21:35	2024-06-28 06:21:35
2	Ajman	1	1	0	1	\N	0	2025-01-07 06:49:38	2025-01-07 06:49:38
3	Ras Al Khaimah	1	1	0	1	\N	0	2025-01-07 06:49:50	2025-01-07 06:49:50
\.


--
-- Data for Name: cleaning_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cleaning_services (id, title, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: comment_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment_likes (id, comment_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: comment_taged_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment_taged_users (id, comment_id, user_id) FROM stdin;
\.


--
-- Data for Name: contact_us; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_us (id, name, email, dial_code, mobile_number, message, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: contact_us_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_us_settings (id, title_en, title_ar, email, mobile, desc_en, desc_ar, location, latitude, longitude, twitter, instagram, facebook, youtube, linkedin, created_at, updated_at, ref_discount, ref_discount_type, transport_website_link) FROM stdin;
1	LC	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	1	
\.


--
-- Data for Name: contracting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contracting (id, title, description, building_type, contract_type, file, deleted, created_at, updated_at, user_id, status, price, qoutation_file, transaction_id, payment_ref) FROM stdin;
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, name, prefix, dial_code, active, created_at, updated_at, deleted) FROM stdin;
1	United Arab Emirates	971	971	1	2024-06-27 10:47:37	\N	0
\.


--
-- Data for Name: coupon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon (id, coupon_title, coupon_description, coupon_end_date, coupon_amount, coupon_minimum_spend, coupon_max_spend, coupon_usage_percoupon, coupon_usage_perx, coupon_usage_peruser, coupon_vender_id, coupon_status, deleted, coupon_code, amount_type, start_date, applied_to, minimum_amount, created_at, updated_at) FROM stdin;
3	Test	Test Coupon Description	2025-02-20 00:00:00	10	\N	\N	0	\N	10	0	1	0	Test001	1	2025-01-07	3	\N	2025-01-07 08:35:56	\N
5	50%OFF	50% Discount	2025-03-31 00:00:00	50	\N	\N	10	\N	10	0	1	0	50%OFF	2	2025-01-13	1	400	2025-01-13 08:33:29	2025-01-13 09:48:40
\.


--
-- Data for Name: coupon_brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_brand (id, name, image, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: coupon_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_category (id, coupon_id, category_id) FROM stdin;
1	4	4
19	5	10
20	5	9
21	5	11
22	5	13
\.


--
-- Data for Name: coupon_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_images (id, coupon_id, image, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: coupon_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_products (id, coupon_id, product_id) FROM stdin;
\.


--
-- Data for Name: coupon_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_services (id, coupon_id, service_id) FROM stdin;
\.


--
-- Data for Name: coupon_vendor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_vendor (id, vendor, coupon_id, created_at, updated_at) FROM stdin;
2	4	2	\N	\N
3	4	3	\N	\N
4	4	1	\N	\N
5	18	4	\N	\N
11	5	5	\N	\N
\.


--
-- Data for Name: coupon_vendor_service_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_vendor_service_order (id, vendor_id, coupon_id, order_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: coupons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupons (id, title, title_ar, brand_id, category_id, coupon_code, active, sort_order, trending, hot_deal, description, description_ar, created_at, updated_at, start_date, coupon_end_date) FROM stdin;
\.


--
-- Data for Name: coupons_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupons_category (id, name, image, banner_image, parent_id, active, deleted, sort_order, created_uid, updated_uid, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cuisines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuisines (id, name, status, deleted, sort_order, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: currencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currencies (id, name, code, created_at, updated_at) FROM stdin;
1	AED	aed	\N	\N
\.


--
-- Data for Name: custom_banners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.custom_banners (id, banner_title, banner_image, active, created_by, updated_by, type, category, product, service, banner_type, activity, store, url, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: designations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.designations (id, user_id, user_type, designation, status, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: event_features; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_features (id, name, image_path, description, created_at, updated_at) FROM stdin;
1	Test	1736271415677d6637b37c8.jpg	Small	2025-01-07 17:36:55	2025-01-07 17:36:55
2	Location	1736271730677d6772a340a.png	\N	2025-01-07 17:42:10	2025-01-07 17:42:10
3	Date	1736271812677d67c4a354b.png	\N	2025-01-07 17:43:32	2025-01-07 17:43:32
4	Language	1736271827677d67d3d5adf.png	\N	2025-01-07 17:43:47	2025-01-07 17:43:47
5	Level	1736271859677d67f3966b8.png	\N	2025-01-07 17:44:19	2025-01-07 17:44:19
6	Includes	1736271888677d6810b9cca.png	\N	2025-01-07 17:44:48	2025-01-07 17:44:48
7	Community	1736271930677d683a1998b.png	\N	2025-01-07 17:45:30	2025-01-07 17:45:30
8	Certificate	1736271962677d685a5db15.png	\N	2025-01-07 17:46:02	2025-01-07 17:46:02
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
\.


--
-- Data for Name: featured_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.featured_products (id, master_product, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: featured_products_img; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.featured_products_img (id, featured_product_id, image) FROM stdin;
\.


--
-- Data for Name: hair_colors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hair_colors (id, name, color, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: help; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.help (id, title, description, created_by, updated_by, active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: help_topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.help_topics (id, user_id, topic, created_at, updated_at, is_survey_topic) FROM stdin;
1	19	I'm mainly here to explore	2025-01-07 13:53:10	2025-01-07 13:53:10	t
2	19	Deciding what to sell	2025-01-07 13:53:10	2025-01-07 13:53:10	f
3	19	Shop naming & branding	2025-01-07 13:53:10	2025-01-07 13:53:10	f
4	20	I want to expand my online business by selling on Handwi, too	2025-01-07 14:05:12	2025-01-07 14:05:12	t
5	20	Selling online	2025-01-07 14:05:12	2025-01-07 14:05:12	f
6	20	Getting discovered in search	2025-01-07 14:05:12	2025-01-07 14:05:12	f
7	21	I want to expand my online business by selling on Handwi, too	2025-01-07 14:06:20	2025-01-07 14:06:20	t
8	21	Selling online	2025-01-07 14:06:20	2025-01-07 14:06:20	f
9	21	Getting discovered in search	2025-01-07 14:06:20	2025-01-07 14:06:20	f
10	22	I'm mainly here to explore	2025-01-07 14:15:48	2025-01-07 14:15:48	t
11	22	Deciding what to sell	2025-01-07 14:15:48	2025-01-07 14:15:48	f
12	22	Shop naming & branding	2025-01-07 14:15:48	2025-01-07 14:15:48	f
13	23	I'm just starting to sell for the first time ever	2025-01-07 15:59:19	2025-01-07 15:59:19	t
14	23	Getting discovered in search	2025-01-07 15:59:19	2025-01-07 15:59:19	f
15	23	Packing and shipping	2025-01-07 15:59:19	2025-01-07 15:59:19	f
16	24	I'm mainly here to explore	2025-01-07 17:56:06	2025-01-07 17:56:06	t
17	24	Getting discovered in search	2025-01-07 17:56:06	2025-01-07 17:56:06	f
18	24	Packing and shipping	2025-01-07 17:56:06	2025-01-07 17:56:06	f
19	25	I'm mainly here to explore	2025-01-07 18:03:25	2025-01-07 18:03:25	t
20	25	Deciding what to sell	2025-01-07 18:03:25	2025-01-07 18:03:25	f
21	25	Shop naming & branding	2025-01-07 18:03:25	2025-01-07 18:03:25	f
22	26	I'm just starting to sell for the first time ever	2025-01-08 04:19:15	2025-01-08 04:19:15	t
23	26	Getting discovered in search	2025-01-08 04:19:15	2025-01-08 04:19:15	f
24	26	Packing and shipping	2025-01-08 04:19:15	2025-01-08 04:19:15	f
25	27	I'm mainly here to explore	2025-01-08 04:42:31	2025-01-08 04:42:31	t
26	27	Getting discovered in search	2025-01-08 04:42:31	2025-01-08 04:42:31	f
27	27	Packing and shipping	2025-01-08 04:42:31	2025-01-08 04:42:31	f
28	28	I'm just starting to sell for the first time ever	2025-01-08 04:45:57	2025-01-08 04:45:57	t
29	28	Getting discovered in search	2025-01-08 04:45:57	2025-01-08 04:45:57	f
30	28	Packing and shipping	2025-01-08 04:45:57	2025-01-08 04:45:57	f
31	29	I have a business and want to sell online for the first time	2025-01-08 04:53:14	2025-01-08 04:53:14	t
32	29	Deciding what to sell	2025-01-08 04:53:14	2025-01-08 04:53:14	f
33	29	Taking photos of items	2025-01-08 04:53:14	2025-01-08 04:53:14	f
34	29	Getting discovered in search	2025-01-08 04:53:14	2025-01-08 04:53:14	f
35	31	I'm just starting to sell for the first time ever	2025-01-08 07:21:34	2025-01-08 07:21:34	t
36	32	I'm just starting to sell for the first time ever	2025-01-08 07:59:31	2025-01-08 07:59:31	t
37	32	Deciding what to sell	2025-01-08 07:59:31	2025-01-08 07:59:31	f
38	32	Shop naming & branding	2025-01-08 07:59:31	2025-01-08 07:59:31	f
39	32	Selling online	2025-01-08 07:59:31	2025-01-08 07:59:31	f
40	32	Taking photos of items	2025-01-08 07:59:31	2025-01-08 07:59:31	f
41	34	I'm just starting to sell for the first time ever	2025-01-08 09:03:10	2025-01-08 09:03:10	t
42	34	Packing and shipping	2025-01-08 09:03:10	2025-01-08 09:03:10	f
43	35	I'm just starting to sell for the first time ever	2025-01-08 09:22:37	2025-01-08 09:22:37	t
44	36	I have a business and want to sell online for the first time	2025-01-08 09:23:10	2025-01-08 09:23:10	t
45	36	Deciding what to sell	2025-01-08 09:23:10	2025-01-08 09:23:10	f
46	36	Taking photos of items	2025-01-08 09:23:10	2025-01-08 09:23:10	f
47	36	Getting discovered in search	2025-01-08 09:23:10	2025-01-08 09:23:10	f
48	37	I have a business and want to sell online for the first time	2025-01-08 10:34:31	2025-01-08 10:34:31	t
49	37	Deciding what to sell	2025-01-08 10:34:31	2025-01-08 10:34:31	f
50	37	Shop naming & branding	2025-01-08 10:34:31	2025-01-08 10:34:31	f
51	39	I'm just starting to sell for the first time ever	2025-01-08 11:20:40	2025-01-08 11:20:40	t
52	39	Selling online	2025-01-08 11:20:40	2025-01-08 11:20:40	f
53	39	Taking photos of items	2025-01-08 11:20:40	2025-01-08 11:20:40	f
54	40	I want to expand my online business by selling on Handwi, too	2025-01-08 14:11:19	2025-01-08 14:11:19	t
55	40	Getting discovered in search	2025-01-08 14:11:19	2025-01-08 14:11:19	f
56	40	Packing and shipping	2025-01-08 14:11:19	2025-01-08 14:11:19	f
57	41	I have a business and want to sell online for the first time	2025-01-08 16:22:26	2025-01-08 16:22:26	t
58	41	Selling online	2025-01-08 16:22:26	2025-01-08 16:22:26	f
59	41	Taking photos of items	2025-01-08 16:22:26	2025-01-08 16:22:26	f
60	42	I'm just starting to sell for the first time ever	2025-01-08 16:31:25	2025-01-08 16:31:25	t
61	42	Selling online	2025-01-08 16:31:25	2025-01-08 16:31:25	f
62	42	Taking photos of items	2025-01-08 16:31:25	2025-01-08 16:31:25	f
63	43	I'm just starting to sell for the first time ever	2025-01-09 07:46:10	2025-01-09 07:46:10	t
64	43	Deciding what to sell	2025-01-09 07:46:10	2025-01-09 07:46:10	f
65	43	Shop naming & branding	2025-01-09 07:46:10	2025-01-09 07:46:10	f
66	43	Selling online	2025-01-09 07:46:10	2025-01-09 07:46:10	f
67	44	I have a business and want to sell online for the first time	2025-01-09 14:36:44	2025-01-09 14:36:44	t
68	44	Deciding what to sell	2025-01-09 14:36:44	2025-01-09 14:36:44	f
69	44	Shop naming & branding	2025-01-09 14:36:44	2025-01-09 14:36:44	f
70	44	Selling online	2025-01-09 14:36:44	2025-01-09 14:36:44	f
71	44	Taking photos of items	2025-01-09 14:36:44	2025-01-09 14:36:44	f
72	45	I want to expand my online business by selling on Handwi, too	2025-01-09 14:51:52	2025-01-09 14:51:52	t
73	45	Deciding what to sell	2025-01-09 14:51:52	2025-01-09 14:51:52	f
74	45	Shop naming & branding	2025-01-09 14:51:52	2025-01-09 14:51:52	f
75	45	Selling online	2025-01-09 14:51:52	2025-01-09 14:51:52	f
76	45	Taking photos of items	2025-01-09 14:51:52	2025-01-09 14:51:52	f
77	46	I'm just starting to sell for the first time ever	2025-01-09 15:14:47	2025-01-09 15:14:47	t
78	46	Deciding what to sell	2025-01-09 15:14:47	2025-01-09 15:14:47	f
79	46	Shop naming & branding	2025-01-09 15:14:47	2025-01-09 15:14:47	f
80	46	Selling online	2025-01-09 15:14:47	2025-01-09 15:14:47	f
81	46	Taking photos of items	2025-01-09 15:14:47	2025-01-09 15:14:47	f
82	47	I have a business and want to sell online for the first time	2025-01-10 06:17:33	2025-01-10 06:17:33	t
83	47	Deciding what to sell	2025-01-10 06:17:33	2025-01-10 06:17:33	f
84	47	Shop naming & branding	2025-01-10 06:17:33	2025-01-10 06:17:33	f
85	47	Taking photos of items	2025-01-10 06:17:33	2025-01-10 06:17:33	f
86	48	I have a business and want to sell online for the first time	2025-01-10 06:50:05	2025-01-10 06:50:05	t
87	48	Deciding what to sell	2025-01-10 06:50:05	2025-01-10 06:50:05	f
88	48	Shop naming & branding	2025-01-10 06:50:05	2025-01-10 06:50:05	f
89	48	Selling online	2025-01-10 06:50:05	2025-01-10 06:50:05	f
90	48	Taking photos of items	2025-01-10 06:50:05	2025-01-10 06:50:05	f
91	49	I have a business and want to sell online for the first time	2025-01-10 06:50:05	2025-01-10 06:50:05	t
92	49	Deciding what to sell	2025-01-10 06:50:05	2025-01-10 06:50:05	f
93	49	Shop naming & branding	2025-01-10 06:50:05	2025-01-10 06:50:05	f
94	49	Selling online	2025-01-10 06:50:05	2025-01-10 06:50:05	f
95	49	Taking photos of items	2025-01-10 06:50:05	2025-01-10 06:50:05	f
96	50	I have a business and want to sell online for the first time	2025-01-10 09:10:30	2025-01-10 09:10:30	t
97	50	Deciding what to sell	2025-01-10 09:10:30	2025-01-10 09:10:30	f
98	50	Selling online	2025-01-10 09:10:30	2025-01-10 09:10:30	f
99	50	Getting discovered in search	2025-01-10 09:10:30	2025-01-10 09:10:30	f
100	50	Pricing items	2025-01-10 09:10:30	2025-01-10 09:10:30	f
101	51	I want to expand my online business by selling on Handwi, too	2025-01-10 09:27:35	2025-01-10 09:27:35	t
102	51	Deciding what to sell	2025-01-10 09:27:35	2025-01-10 09:27:35	f
103	51	Shop naming & branding	2025-01-10 09:27:35	2025-01-10 09:27:35	f
104	51	Selling online	2025-01-10 09:27:35	2025-01-10 09:27:35	f
105	51	Taking photos of items	2025-01-10 09:27:35	2025-01-10 09:27:35	f
106	51	Getting discovered in search	2025-01-10 09:27:35	2025-01-10 09:27:35	f
107	51	Packing and shipping	2025-01-10 09:27:35	2025-01-10 09:27:35	f
108	52	I want to expand my online business by selling on Handwi, too	2025-01-10 09:31:55	2025-01-10 09:31:55	t
109	52	Selling online	2025-01-10 09:31:55	2025-01-10 09:31:55	f
110	52	Taking photos of items	2025-01-10 09:31:55	2025-01-10 09:31:55	f
111	52	Getting discovered in search	2025-01-10 09:31:55	2025-01-10 09:31:55	f
112	52	Packing and shipping	2025-01-10 09:31:55	2025-01-10 09:31:55	f
113	53	I have a business and want to sell online for the first time	2025-01-10 13:48:26	2025-01-10 13:48:26	t
114	53	Deciding what to sell	2025-01-10 13:48:26	2025-01-10 13:48:26	f
115	53	Shop naming & branding	2025-01-10 13:48:26	2025-01-10 13:48:26	f
116	54	I'm just starting to sell for the first time ever	2025-01-10 15:09:05	2025-01-10 15:09:05	t
117	54	Deciding what to sell	2025-01-10 15:09:05	2025-01-10 15:09:05	f
118	54	Selling online	2025-01-10 15:09:05	2025-01-10 15:09:05	f
119	56	I have a business and want to sell online for the first time	2025-01-15 05:06:00	2025-01-15 05:06:00	t
120	56	Deciding what to sell	2025-01-15 05:06:00	2025-01-15 05:06:00	f
121	56	Taking photos of items	2025-01-15 05:06:00	2025-01-15 05:06:00	f
122	56	Getting discovered in search	2025-01-15 05:06:00	2025-01-15 05:06:00	f
123	56	Pricing items	2025-01-15 05:06:00	2025-01-15 05:06:00	f
\.


--
-- Data for Name: home_logos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_logos (id, image, created_at, updated_at, deleted, active) FROM stdin;
1	1736344208brandlogo1.png	2025-01-08 13:50:08	\N	0	1
2	1736344231brandlogo2.png	2025-01-08 13:50:31	\N	0	1
3	1736344244brandlogo3.png	2025-01-08 13:50:44	\N	0	1
4	1736344258brandlogo4.png	2025-01-08 13:50:58	\N	0	1
5	1736344272brandlogo5.png	2025-01-08 13:51:12	\N	0	1
6	1736344284brandlogo6.png	2025-01-08 13:51:24	\N	0	1
7	1736344297brandlogo7.png	2025-01-08 13:51:37	\N	0	1
\.


--
-- Data for Name: hourly_rate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hourly_rate (id, text, hourly_rate, created_at, updated_at, service_id) FROM stdin;
1	1	10	2025-01-07 08:21:16	2025-01-07 08:21:16	1
\.


--
-- Data for Name: industry_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.industry_types (id, name, active, deleted, sort_order, created_uid, updated_uid, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: landing_page_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.landing_page_settings (id, meta_key, meta_value, created_at, updated_at) FROM stdin;
1	banner_title	Handmade with Heart, <br> Delivered with Care.	2025-01-06 07:18:40	2025-01-06 07:18:40
2	banner_description	<p>Crafting Connections, One Handmade <br />Treasure at a Time.</p>	2025-01-06 07:18:40	2025-01-06 07:18:40
3	shipping_title	Free Shipping &amp; Return	2025-01-06 07:18:40	2025-01-06 07:18:40
4	shipping_description	<p>Free shipping on all US orders</p>	2025-01-06 07:18:40	2025-01-06 07:18:40
5	money_title	Money Guarantee	2025-01-06 07:18:40	2025-01-06 07:18:40
6	money_description	<p>30 days money back guarantee</p>	2025-01-06 07:18:40	2025-01-06 07:18:40
7	support_title	Online Support	2025-01-06 07:18:40	2025-01-06 07:18:40
8	support_description	<p>We support online 24/7 on day</p>	2025-01-06 07:18:40	2025-01-06 07:18:40
9	payment_title	Payment Security	2025-01-06 07:18:40	2025-01-06 07:18:40
10	payment_description	<p>More than 8 different secure</p>	2025-01-06 07:18:40	2025-01-06 07:18:40
11	sale_section_1_title	NEW COLLECTION	2025-01-06 07:18:40	2025-01-06 07:18:40
12	sale_section_1_description	<p>STREETSTYLE</p>	2025-01-06 07:18:40	2025-01-06 07:18:40
13	sale_section_1_button_text	Shop now	2025-01-06 07:18:40	2025-01-06 07:18:40
14	sale_section_2_title	SUMMER SALE OFFERS	2025-01-06 07:18:40	2025-01-06 07:18:40
15	sale_section_2_description	<p>70% OFF</p>	2025-01-06 07:18:40	2025-01-06 07:18:40
16	sale_section_2_button_text	Shop the collection	2025-01-06 07:18:40	2025-01-06 07:18:40
17	best_seller_title	BEST SELLER	2025-01-06 07:18:40	2025-01-06 07:18:40
18	best_seller_subtitle	TOP SALE IN THIS WEEK	2025-01-06 07:18:41	2025-01-06 07:18:41
19	latest_title	Spring Summer	2025-01-06 07:18:41	2025-01-06 07:18:41
20	latest_subtitle	Shop The Latest	2025-01-06 07:18:41	2025-01-06 07:18:41
21	banner_image	https://dxbitprojects.com/handwi/public/uploads/landing_page_images/1736147921_051504500003.jpg	2025-01-06 07:18:41	2025-01-06 07:18:41
22	sale_section_1_image	https://dxbitprojects.com/handwi/public/uploads/landing_page_images/1736147921_demo1-banner4.webp	2025-01-06 07:18:41	2025-01-06 07:18:41
23	sale_section_2_image	https://dxbitprojects.com/handwi/public/uploads/landing_page_images/1736147921_demo1-banner5.webp	2025-01-06 07:18:41	2025-01-06 07:18:41
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.likes (id, user_id, product_id, vendor_id, created_at, updated_at) FROM stdin;
12	13	21	0	2025-01-10 18:16:30	2025-01-10 18:16:30
19	33	31	0	2025-01-10 20:59:49	2025-01-10 20:59:49
21	33	30	0	2025-01-10 21:13:34	2025-01-10 21:13:34
23	33	25	0	2025-01-10 21:18:14	2025-01-10 21:18:14
26	33	15	0	2025-01-10 21:24:34	2025-01-10 21:24:34
28	33	14	0	2025-01-10 21:35:41	2025-01-10 21:35:41
30	33	29	0	2025-01-10 21:36:40	2025-01-10 21:36:40
31	33	16	0	2025-01-10 21:36:42	2025-01-10 21:36:42
32	33	28	0	2025-01-10 21:46:25	2025-01-10 21:46:25
39	15	2	0	2025-01-11 10:19:04	2025-01-11 10:19:04
40	15	16	0	2025-01-11 10:19:15	2025-01-11 10:19:15
41	15	0	50	2025-01-13 12:33:53	2025-01-13 12:33:53
44	33	0	17	2025-01-13 22:01:57	2025-01-13 22:01:57
46	15	0	17	2025-01-14 10:40:57	2025-01-14 10:40:57
47	9	0	17	2025-01-14 10:50:38	2025-01-14 10:50:38
\.


--
-- Data for Name: main_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_category (id, name, sub_title, image, button_link, deleted, active, created_at, updated_at, banner_image) FROM stdin;
2	Handmade	CHILL TO THE MAX	/uploads/category/67865637495f6_1736857143.jpg	https://dxbitprojects.com/handwi/public/handmade	0	1	2025-01-09 09:09:27	2025-01-14 13:29:45	/uploads/category/678666c936a16_1736861385.jpg
3	Workshop	BE THE MOST YOU	/uploads/category/67865beb765f4_1736858603.jpg	https://dxbitprojects.com/handwi/public/workshops	0	1	2025-01-09 09:11:19	2025-01-14 13:37:59	/uploads/category/678668b78b34d_1736861879.jpg
1	Gifts	AHEAD OF THE TREND	/uploads/category/67865c3b86989_1736858683.jpg	https://dxbitprojects.com/handwi/public/gifts	0	1	2025-01-09 09:07:43	2025-01-14 13:38:14	/uploads/category/678668c63a0c8_1736861894.jpg
\.


--
-- Data for Name: maintainance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maintainance (id, title, description, building_type, file, deleted, created_at, updated_at, user_id, status, price, qoutation_file, transaction_id, payment_ref) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0000_00_00_000000_create_websockets_statistics_entries_table	1
2	2014_10_12_000000_create_users_table	1
3	2014_10_12_100000_create_password_resets_table	1
4	2019_08_19_000000_create_failed_jobs_table	1
5	2019_12_14_000001_create_personal_access_tokens_table	1
6	2022_07_22_072324_create_country_models_table	1
7	2022_07_28_095424_create_category_table	1
8	2022_07_29_113349_create_products_table	1
9	2022_07_29_115922_create_product_attributes_table	1
10	2022_07_29_121226_create_product_images_table	1
11	2022_08_01_044301_add_deleted_to_country_table	1
12	2022_08_01_052546_create_industry_types_table	1
13	2022_08_01_072954_create_attributes_table	1
14	2022_08_01_081612_create_attribute_type_table	1
15	2022_08_01_105755_create_attribute_values_table	1
16	2022_08_03_162220_create_users_role_table	1
17	2022_08_04_085250_create_states_table	1
18	2022_08_04_085323_create_cities_table	1
19	2022_08_04_102446_create_stores_table	1
20	2022_08_04_153341_update_users_table	1
21	2022_08_05_041320_create_vendor_details	1
22	2022_08_05_044559_create_bank_details	1
23	2022_08_05_055145_create_store_images_table	1
24	2022_08_05_162828_add_active_to_users	1
25	2022_08_05_165055_add_deleted_to_users	1
26	2022_08_06_042655_add_industry_type_to_vendor_details	1
27	2022_08_06_052804_update_vendor_details_table	1
28	2022_08_06_053808_alter_table_vendor_details_change_chamber_of_commerce_doc	1
29	2022_08_06_071210_alter_product_attribute_add_extra	1
30	2022_08_06_072956_alter_product_images_add_attribute_id	1
31	2022_08_06_155049_update_bank_details_table	1
32	2022_08_10_034617_alter_table_vendor_details_change_homedelivery	1
33	2022_08_10_153155_create_app_banners	1
34	2022_08_11_065227_create_articles	1
35	2022_08_11_071259_create_faq	1
36	2022_08_11_162220_create_bank	1
37	2022_08_14_152538_create_contact_us_settings	1
38	2022_08_14_154810_create_settings	1
39	2022_08_14_160604_create_notifications	1
40	2022_08_16_151905_create_product	1
41	2022_08_16_160300_add_display_name_to_users	1
42	2022_08_16_160422_add_business_name_to_users	1
43	2022_08_16_163007_create_product_attribute	1
44	2022_08_16_163708_create_product_attribute_values	1
45	2022_08_17_105931_create_product_category	1
46	2022_08_17_111528_drop_product_attributes	1
47	2022_08_17_113326_create_product_selected_attribute_list	1
48	2022_08_17_114730_create_product_docs	1
49	2022_08_17_143257_create_order_products	1
50	2022_08_17_144802_create_product_specifications	1
51	2022_08_17_145318_create_product_variations	1
52	2022_08_19_041937_create_brand	1
53	2022_08_19_042907_add_deleted_to_brand	1
54	2022_08_19_103034_alter_table_product_attribute_change_attribute_type	1
55	2022_08_19_103645_alter_table_product_attribute_change_is_deleted	1
56	2022_08_19_121718_alter_table_product_attribute_values_change_attribute_value_color	1
57	2022_08_19_121948_alter_table_product_attribute_values_change_attribute_value_label	1
58	2022_08_19_124250_create_product_selected_attributes_table	1
59	2022_08_20_050413_add_brand_to_product	1
60	2022_08_23_124030_create_bank_code_types	1
61	2022_08_24_035518_create_store_managers_types	1
62	2022_08_24_081624_add_columns_to_users_table	1
63	2022_08_25_093923_create_posts_table	1
64	2022_08_25_102809_create_post_users_table	1
65	2022_08_26_075605_create_post_likes_table	1
66	2022_08_26_083919_create_post_comments_table	1
67	2022_08_26_094609_create_comment_taged_users_table	1
68	2022_08_26_120123_alter_post_commets_add_extra	1
69	2022_08_26_131152_create_comment_likes_table	1
70	2022_08_27_182018_add_store_id_to_product	1
71	2022_08_29_020455_add_vendor_to_users	1
72	2022_08_30_023652_add_commission_to_stores	1
73	2022_08_30_035602_create_store_likes_table	1
74	2022_08_30_035706_create_product_likes_table	1
75	2022_08_30_053123_create_user_follows_table	1
76	2022_08_30_083554_add_vendor_id_column_to_store_managers_types	1
77	2022_08_30_110300_alter_user_add_about_me	1
78	2022_08_30_113554_alter_post_add_post_status	1
79	2022_08_31_175858_add_verified_to_users	1
80	2022_09_02_042305_create_amount_type	1
81	2022_09_02_070349_create_designation_table	1
82	2022_09_02_105714_add_columns_to_user_table	1
83	2022_09_02_151343_create_coupon_category	1
84	2022_09_02_162532_create_user_privileges_table	1
85	2022_09_03_060222_create_product_temp_image	1
86	2022_09_03_093842_alter_product_attribute_change_attribute_type	1
87	2022_09_04_035948_create_admin_designation	1
88	2022_09_04_144626_create_cart_table	1
89	2022_09_05_073828_add_tax_percentage_to_settings_table	1
90	2022_09_05_094102_remove_unique_phone_from_users_table	1
91	2022_09_06_011715_create_orders	1
92	2022_09_08_010349_create_user_adresses_table	1
93	2022_09_08_024755_create_temp_order_products_table	1
94	2022_09_08_024821_create_temp_orders_table	1
95	2022_09_08_035231_alter_order_products	1
96	2022_09_08_042318_create_payment_report_table	1
97	2022_09_12_124711_drop_amount_type	1
98	2022_09_12_124846_amount_type	1
99	2022_09_13_043222_create_moda_main_categories_table	1
100	2022_09_13_043731_create_moda_sub_categories_table	1
101	2022_09_13_063112_create_hair_colors_table	1
102	2022_09_13_063148_create_skin_colors_table	1
103	2022_09_13_094928_alter_product_add_moda_categories	1
104	2022_09_13_100148_alter_users_add_extra	1
105	2022_09_14_052904_create_store_type_table	1
106	2022_09_14_072323_create_wallet_histories_table	1
107	2022_09_14_072738_alter_users_add_wallet_amount	1
108	2022_09_14_102301_create_my_moda_table	1
109	2022_09_14_104738_create_my_moda_items_table	1
110	2022_09_16_045220_create_post_saves_table	1
111	2022_09_17_060127_alter_posts_add_visibity	1
112	2022_09_19_041614_add_password_reset_code	1
113	2022_09_19_132546_create_help_table	1
114	2022_09_19_141934_add_land_mark	1
115	2022_09_20_094958_add_size_chart	1
116	2022_09_20_114010_add_store_type	1
117	2022_09_21_044300_alter_table_user_privileges_change_user_privileges	1
118	2022_09_21_063311_alter_post_add_extra_image_names	1
119	2022_09_23_125130_alter_table_store_type_change_banner_image	1
120	2022_09_23_135257_add_txt_location	1
121	2022_09_24_034810_add_approve	1
122	2022_10_10_144757_create_service_category	1
123	2022_10_11_053449_create_service	1
124	2022_10_22_112559_create_service_category_selected	1
125	2022_10_22_122802_drop_category_from_service	1
126	2022_10_25_030016_create_vendor_services_table	1
127	2022_10_25_051258_drop_area_from_vendor_details	1
128	2022_10_25_051355_add_area	1
129	2022_10_27_061349_drop_coupon	1
130	2022_10_27_062118_create_coupon	1
131	2022_10_27_063447_create_coupon_products	1
132	2022_10_27_071451_add_featured	1
133	2022_10_27_102343_add_user_permissions_column	1
134	2022_10_27_103447_add_password_reset_otp	1
135	2022_10_28_054725_add_pharmacycommission	1
136	2022_10_28_055919_add_featured_flag	1
137	2022_10_29_165317_create_product_master	1
138	2022_10_30_102118_add_master_product	1
139	2022_10_31_070219_create_likes	1
140	2022_10_31_072641_add_description	1
141	2022_11_02_050059_add_location	1
142	2022_11_02_052609_create_wallet_payment_report	1
143	2022_11_03_064022_create_ratings	1
144	2022_11_04_123322_create_featured_products	1
145	2022_11_04_123438_create_featured_products_img	1
146	2022_11_07_115737_create_cart_service	1
147	2022_11_09_042245_add_iban	1
148	2022_11_09_053111_create_contact_us	1
149	2022_11_10_052857_create_temp_service_orders	1
150	2022_11_10_053649_create_temp_service_order_items	1
151	2022_11_10_065916_create_orders_services_items	1
152	2022_11_10_071401_add_booking_date	1
153	2022_11_10_072709_create_orders_services	1
154	2022_11_10_074136_create_product_master_request	1
155	2022_11_10_120556_add_product_type	1
156	2022_11_10_121824_create_attribute_values_request	1
157	2022_11_11_043038_create_coupon_services	1
158	2022_11_11_100549_add_cover_image	1
159	2022_11_14_045017_add_pay_method	1
160	2022_11_17_040539_add_boxcount	1
161	2022_11_18_122709_add_is_muted	1
162	2022_11_19_070928_add_is_mute	1
163	2022_11_19_090748_add_accepted_vendor	1
164	2022_11_22_034939_add_user_type	1
165	2022_11_22_055216_create_orders_services_rejected	1
166	2022_11_23_044220_add_refund_method	1
167	2022_11_25_085834_add_refund_requested	1
168	2022_11_29_040327_add_order_no	1
169	2022_11_29_040445_add_order_nos	1
170	2022_12_23_113750_add_included_to_service_table	1
171	2022_12_23_130421_add_service_user_id_to_service	1
172	2022_12_26_091623_create_cleaning_services_table	1
173	2022_12_27_081044_add_building_type_to_service	1
174	2022_12_28_115650_add_service_type_to_service_table	1
175	2022_12_28_122912_add_contract_type_to_service_table	1
176	2023_01_04_000001_create_service_include_table	1
177	2023_01_04_000002_create_service_type_table	1
178	2023_01_05_000003_create_building_type_table	1
179	2023_01_05_000004_add_active_building-type	1
180	2023_01_05_000005_add_duration_service	1
181	2023_01_05_000006_add_building_type_service	1
182	2023_01_05_103804_add_time_to_service	1
183	2023_01_06_070205_add_document_to_service	1
184	2023_01_25_113910_create_contracting_table	1
185	2023_01_25_113942_create_maintainance_table	1
186	2023_01_26_071211_add_user_id_to_notification	1
187	2023_02_02_080127_add_booking_date_to_temp_service_order	1
188	2023_02_03_101419_change_city_id_to_building_type_id_to_cart_service	1
189	2023_02_09_065114_create_columns_in_contracting	1
190	2023_02_09_065153_create_columns_in_maintainance	1
191	2023_02_15_104221_create_price_to_contracting	1
192	2023_02_15_104241_create_price_to_maintainance	1
193	2023_02_21_115000_add_payment_columns_to_contracting_table	1
194	2023_02_21_131838_add_columns_to_maintainance_table	1
195	2023_03_21_064807_add_order_id	1
196	2023_03_23_035747_alter_service_change_description	1
197	2023_11_24_144501_create_activity_type	1
198	2023_11_24_150537_create_account_type	1
199	2023_11_24_152800_add_category_activity_id_in_category	1
200	2023_11_27_092900_add_activity_id_in_brand	1
201	2023_11_29_084619_create_temp_users	1
202	2023_12_05_052346_recommended	1
203	2023_12_05_091212_add_activity_in_users	1
204	2023_12_06_093940_hourly_rate	1
205	2023_12_06_094342_service_id	1
206	2023_12_06_121531_add_temp_col_in_users	1
207	2023_12_11_052731_text	1
208	2023_12_11_081103_add_area_id_in_user_address	1
209	2023_12_11_083412_create_area	1
210	2023_12_11_101852_vendor_service_timings	1
211	2023_12_11_104030_add_street_in_user_address	1
212	2023_12_11_135103_minimum_order_amount	1
213	2023_12_12_094534_qty	1
214	2023_12_13_064625_coupon_vendor	1
215	2023_12_13_064910_coupon_id	1
216	2023_12_13_071851_text2	1
217	2023_12_13_072234_text3	1
218	2023_12_14_023804_type	1
219	2023_12_14_061742_banner_type	1
220	2023_12_15_033117_coupon_id1	1
221	2023_12_15_035625_read_admin	1
222	2023_12_15_044654_coupon_vendor_service_order	1
223	2023_12_15_045739_order_request_view	1
224	2023_12_15_050023_orders_services_mute	1
225	2023_12_15_062046_add_referal_code_in_users	1
226	2023_12_16_080322_add_history_id_in_temp_orders	1
227	2023_12_18_063400_activity	1
228	2023_12_19_034213_accepted_vendor	1
229	2023_12_19_135838_add_transport_website_link_in_contact_us_settings	1
230	2023_12_20_101407_banner_image	1
231	2023_12_20_134558_add_widthdraw_column_in_orders	1
232	2023_12_20_141855_add_col_in_orders	1
233	2023_12_27_093808_accepted_date	1
234	2023_12_29_124743_add_per_cols_in_temp_orders	1
235	2023_12_30_064915_withdraw_status	1
236	2023_12_30_130908_vat	1
237	2024_01_01_061043_ref_history_id	1
238	2024_01_01_061125_ref_history_id1	1
239	2024_01_01_064010_discount	1
240	2024_01_01_083444_vendor_comment	1
241	2024_01_02_033624_order_count	1
242	2024_01_02_134206_add_activity_id_in_orders	1
243	2024_01_04_044422_activity_id	1
244	2024_01_06_055346_activity_id2	1
245	2024_01_06_073218_create_dinein_details_tabel	1
246	2024_01_06_100422_sort_order	1
247	2024_01_09_061140_coupon_category	1
248	2024_01_09_085036_coupon_brand	1
249	2024_01_09_092540_coupons	1
250	2024_01_09_115024_coupon_images	1
251	2024_01_10_080721_add_col_in_products	1
252	2024_01_16_095930_transport	1
253	2024_01_17_122311_create_product_cuisins	1
254	2024_01_22_155423_add_designation_in_users	1
255	2024_02_06_085524_create_vendor_locations_table	1
256	2024_02_06_130554_create_vendor_timings_table	1
257	2024_02_07_122730_create_service_timings_table	1
258	2024_02_13_084904_order_status_history	1
259	2024_02_13_095213_service_order_status_history	1
260	2024_02_15_052504_alter_add_fields_to_service	1
261	2024_02_16_143959_add_activity_id_in_services	1
262	2024_02_19_101458_alter_settings_add_to_settings	1
263	2024_02_19_132115_add_order_type_in_orders	1
264	2024_02_20_054329_alter_add_fields_to_temp_service_orders	1
265	2024_02_20_054835_alter_add_fields_to_orders_services	1
266	2024_02_20_061421_create_service_assigned_vendors_table	1
267	2024_02_20_115848_alter_add_order_number_to_orders	1
268	2024_02_20_134313_add_time_col_in_orders	1
269	2024_02_22_051810_tesimonial	1
270	2024_02_23_051302_admin_viewed	1
271	2024_02_23_053722_create_promotion_banners_table	1
272	2024_02_23_094731_create_subscribers_emails_table	1
273	2024_02_26_143808_create_landing_page_settings_table	1
274	2024_02_27_055419_price_label	1
275	2024_02_27_060530_start_date	1
276	2024_02_27_063601_sort_order2	1
277	2024_02_29_055153_ratings_reply	1
278	2024_03_02_033453_url	1
279	2024_03_02_130435_url2	1
280	2024_03_04_040737_add_categorypro	1
281	2024_03_07_031014_delivery_charge	1
282	2024_03_08_024704_service_charge	1
283	2024_03_08_034030_service_charge1	1
284	2024_03_08_035315_service_charge2	1
285	2024_03_08_093338_alter_add_is_default_key_to_vendor_locations	1
286	2024_03_09_062838_service_charge3	1
287	2024_03_09_062943_service_charge4	1
288	2024_03_19_090426_task_description1	1
289	2024_03_19_090713_task_description2	1
290	2024_03_20_043848_create_app_home_sections_table	1
291	2024_03_20_075350_create_custom_banners_table	1
292	2024_12_20_165612_create_product_items_table	2
293	2025_01_06_065824_add_home_page_column_to_category_table	3
294	2025_01_06_070849_add_sub_title_column_to_category_table	4
295	2024_03_09_062943_service_dates	5
296	2025_01_07_062618_create_help_topics_table	6
297	2025_01_07_072131_make_phone_nullable_in_users_table	6
298	2025_01_07_072620_add_is_survey_topic_to_help_topics_table	6
299	2025_01_07_075530_create_currencies_table	6
300	2025_01_07_081018_add_missing_columns_to_stores_table	6
301	2025_01_07_120940_make_fields_nullable_in_stores_table	6
302	2024_10_12_100000_create_event_features_table	7
303	2024_10_12_100000_create_product_features_table	7
304	2024_10_12_100000_create_product_product_feature_table	7
305	2024_10_12_100000_create_service_event_feature_table	7
306	2025_03_19_090713_product_plocies	8
307	2025_03_19_090713_service25	9
308	2025_01_06_191158_create_home_logos_table	10
309	2025_01_06_191458_add_deleted_to_home_logos_table	10
310	2025_01_06_192141_add_active_to_home_logos_table	10
311	2025_01_07_141424_create_blogs_table	10
312	2025_03_19_090713_event_feature_title	11
313	2025_03_19_090713_feature_title	11
314	2025_01_08_104625_add_tax_address_columns_to_stores_table	12
315	2025_03_19_090713_service26	12
316	2025_01_08_214128_add_location_to_users_table	13
317	2025_01_09_024536_create_main_category_table	13
318	2025_01_09_034309_create_web_banners_table	13
319	2025_03_19_090713_product_checks	14
320	2025_03_19_090713_category22	15
321	2025_03_19_090713_category23	16
322	2025_01_10_074013_add_two_factor_auth_to_users_table	17
323	2025_01_10_074748_add_additional_fields_to_stores_table	17
324	2025_01_10_080006_add_first_and_last_name_to_stores_table	17
325	2025_01_10_080705_update_vendor_details_columns	17
326	2025_03_19_090714_Banner1	18
327	2025_01_09_034309_create_service_booking_table	19
328	2025_03_19_090714_service_booking1	20
329	2025_01_12_013804_add_banner_image_to_main_category_table	21
330	2025_01_12_014459_add_is_handmade_to_category_table	21
331	2025_01_12_234703_create_service_images_table	22
332	2025_01_13_012752_add_feature_image_to_services_table	22
333	2025_03_19_090714_service_booking2	23
334	2025_01_13_092050_update_is_handmade_column_nullable_in_category_table	24
\.


--
-- Data for Name: moda_main_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moda_main_categories (id, name, created_at, updated_at) FROM stdin;
1	Head	2024-06-27 10:45:56	\N
2	Upper Body	2024-06-27 10:45:56	\N
3	Lower Body	2024-06-27 10:45:56	\N
4	Footwear	2024-06-27 10:45:56	\N
5	Makeup	2024-06-27 10:45:56	\N
6	Accessories	2024-06-27 10:45:56	\N
\.


--
-- Data for Name: moda_sub_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moda_sub_categories (id, main_category, name, gender, image, active, sort_order, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: my_moda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.my_moda (id, user_id, date, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: my_moda_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.my_moda_items (id, my_moda_id, product_id, product_attribute_id, moda_sub_category, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, description, title, image, created_at, updated_at, user_type, user_id) FROM stdin;
\.


--
-- Data for Name: order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_products (id, order_id, product_id, product_attribute_id, product_type, quantity, price, discount, total, vendor_id, order_status, admin_commission, vendor_commission, shipping_charge) FROM stdin;
1	1	8	7	2	1	110	0	110	4	0	110	0	0
2	2	8	7	2	1	110	0	110	4	0	110	0	0
3	3	3	3	1	1	359	0	359	4	0	359	0	0
4	4	4	4	1	1	330	0	330	4	0	330	0	0
5	5	8	7	2	2	119	0	238	4	4	238	0	0
6	6	4	4	1	1	330	0	330	4	0	330	0	0
7	7	8	7	2	1	119	0	119	4	0	119	0	0
8	7	5	5	1	2	250	0	500	4	0	500	0	0
9	8	8	7	2	1	119	0	119	4	0	119	0	0
10	9	15	15	1	2	330	0	660	17	0	330	330	0
11	10	15	15	1	2	330	0	660	17	4	330	330	0
12	11	17	17	1	1	4000	0	4000	18	0	2000	2000	0
13	11	18	18	1	1	8000	0	8000	18	0	4000	4000	0
14	12	15	15	1	2	330	0	660	17	0	330	330	0
15	12	16	16	1	2	400	0	800	17	0	400	400	0
16	12	14	14	1	2	650	0	1300	17	0	650	650	0
17	13	20	20	1	1	7000	0	7000	18	0	3500	3500	0
19	15	21	21	2	6	85	0	510	17	4	255	255	0
18	14	13	13	1	2	300	0	600	16	4	360	240	0
20	16	18	18	1	1	8000	0	8000	18	0	4000	4000	0
21	17	33	34	0	1	250	\N	250	0	0	\N	\N	\N
22	17	27	28	0	1	500	\N	500	0	0	\N	\N	\N
23	18	32	33	0	1	250	\N	250	0	0	\N	\N	\N
24	19	17	17	1	1	4000	0	4000	18	0	2000	2000	0
25	20	15	15	1	1	330	0	330	17	4	165	165	0
26	20	20	20	1	2	7000	0	14000	18	4	7000	7000	0
27	21	32	33	0	3	250	\N	750	0	3	\N	\N	\N
\.


--
-- Data for Name: order_request_view; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_request_view (id, vendor, service_order, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: order_status_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_status_history (id, order_id, status_id, created_at, updated_at) FROM stdin;
1	5	1	2025-01-07 08:09:16	2025-01-07 08:09:16
2	5	2	2025-01-07 08:09:26	2025-01-07 08:09:26
3	5	3	2025-01-07 08:09:34	2025-01-07 08:09:34
4	5	4	2025-01-07 08:09:40	2025-01-07 08:09:40
5	10	1	2025-01-07 11:01:48	2025-01-07 11:01:48
6	10	2	2025-01-07 11:01:55	2025-01-07 11:01:55
7	10	3	2025-01-07 11:02:00	2025-01-07 11:02:00
8	10	4	2025-01-07 11:02:07	2025-01-07 11:02:07
9	15	1	2025-01-09 15:55:53	2025-01-09 15:55:53
10	15	2	2025-01-09 16:02:59	2025-01-09 16:02:59
11	15	3	2025-01-09 16:03:10	2025-01-09 16:03:10
12	15	4	2025-01-09 16:03:24	2025-01-09 16:03:24
13	14	1	2025-01-11 10:24:33	2025-01-11 10:24:33
14	14	2	2025-01-11 10:25:20	2025-01-11 10:25:20
15	14	3	2025-01-11 10:26:21	2025-01-11 10:26:21
16	14	4	2025-01-11 10:26:27	2025-01-11 10:26:27
17	20	1	2025-01-14 11:59:35	2025-01-14 11:59:35
18	20	2	2025-01-14 11:59:40	2025-01-14 11:59:40
19	20	3	2025-01-14 11:59:45	2025-01-14 11:59:45
20	20	4	2025-01-14 11:59:50	2025-01-14 11:59:50
21	21	2	2025-01-14 18:39:13	2025-01-14 18:39:13
22	21	3	2025-01-14 18:39:25	2025-01-14 18:39:25
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, invoice_id, user_id, address_id, total, vat, discount, grand_total, payment_mode, status, booking_date, total_qty, total_items_qty, oder_type, admin_commission, vendor_commission, shipping_charge, created_at, updated_at, is_muted, refund_method, refund_requested, refund_requested_date, order_no, ref_history_id, ref_code, withdraw_status, withdraw_request_at, vendor_id, admin_commission_per, vendor_commission_per, admin_commission_percentage, vendor_commission_percentage, activity_id, order_type, order_number, pick_up_date, pick_up_time, service_charge) FROM stdin;
11	15677d13a279d361736250274	15	7	12000	0	6000	6040	2	0	2025-01-07 11:44:55	2	2	0	3000	3000	40	2025-01-07 11:44:55	2025-01-07 11:44:55	0	0	0	\N	LC2025010711	0		\N	\N	18	3000	3000	50	50	7	0	LC2025010711			0
1	9677bd27707f461736168055	9	2	110	0	0	110	2	0	2025-01-06 12:54:58	1	1	0	0	110	0	2025-01-06 12:54:58	2025-01-06 12:54:59	0	0	0	\N	LC202501061	0		\N	\N	4	0	110	0	100	7	0	LC202501061			0
7	14677ce440be13b1736238144	14	10	619	0	0	619	2	0	2025-01-07 08:22:48	2	3	0	0	619	0	2025-01-07 08:22:48	2025-01-07 08:22:48	0	0	0	\N	LC202501077	0		\N	\N	4	0	619	0	100	7	0	LC202501077			0
2	9677c0f48498181736183624	9	4	110	0	0	110	2	0	2025-01-06 17:14:02	1	1	0	0	110	0	2025-01-06 17:14:02	2025-01-06 17:14:02	0	0	0	\N	LC202501062	0		\N	\N	4	0	110	0	100	7	0	LC202501062			0
3	9677c11db35d141736184283	9	4	359	0	0	359	2	0	2025-01-06 17:25:00	1	1	0	0	359	0	2025-01-06 17:25:00	2025-01-06 17:25:00	0	0	0	\N	LC202501063	0		\N	\N	4	0	359	0	100	7	0	LC202501063			0
8	9677cec30d70ec1736240176	9	9	119	0	11.9	107.1	2	0	2025-01-07 08:56:33	1	1	0	0	107	0	2025-01-07 08:56:33	2025-01-07 08:56:33	0	0	0	\N	LC202501078	0		\N	\N	4	0	107	0	100	7	0	LC202501078			0
4	9677c1213cfb3b1736184339	9	4	330	0	0	330	2	0	2025-01-06 17:26:08	1	1	0	0	330	0	2025-01-06 17:26:08	2025-01-06 17:26:09	0	0	0	\N	LC202501064	0		\N	\N	4	0	330	0	100	7	0	LC202501064			0
12	15677d1a8e85dda1736252046	15	11	2760	0	0	2785	2	0	2025-01-07 12:14:31	3	6	0	1380	1380	25	2025-01-07 12:14:31	2025-01-07 12:14:32	0	0	0	\N	LC2025010712	0		\N	\N	17	1380	1380	50	50	7	0	LC2025010712			0
9	9677ced5c7acf01736240476	9	9	660	0	0	685	2	0	2025-01-07 09:01:32	1	2	0	330	330	25	2025-01-07 09:01:32	2025-01-07 09:01:33	0	0	0	\N	LC202501079	0		\N	\N	17	330	330	50	50	7	0	LC202501079			0
15	9677e407c0829a1736327292	9	9	510	25.5	0	560.5	2	4	2025-01-08 09:09:00	1	6	0	255	280	25	2025-01-08 09:09:00	2025-01-09 16:03:24	0	0	0	\N	LC2025010815	0		\N	\N	17	255	280	50	50	7	0	LC2025010815			0
20	967864fdb067a11736855515	9	9	14330	716.5	0	15046.5	2	4	2025-01-14 11:52:12	2	3	0	7165	7881	0	2025-01-14 11:52:12	2025-01-14 11:59:50	0	0	0	\N	LC2025011420	0		\N	\N	18	7165	7881	50	50	7	0	LC2025011420			0
13	9677df7605bf3f1736308576	9	9	7000	350	700	6690	2	0	2025-01-08 03:56:34	1	1	0	3150	3500	40	2025-01-08 03:56:34	2025-01-08 03:56:35	0	0	0	\N	LC2025010813	0		\N	\N	18	3150	3500	50	50	7	0	LC2025010813			0
5	15677cddd2a68e81736236498	15	7	238	0	0	238	2	4	2025-01-07 07:55:15	1	2	0	0	238	0	2025-01-07 07:55:15	2025-01-07 08:10:14	0	0	0	\N	LC202501075	0		\N	\N	4	0	238	0	100	7	0	LC202501075			0
19	967863c44610021736850500	9	9	4000	200	0	4200	2	0	2025-01-14 10:28:38	1	1	0	2000	2200	0	2025-01-14 10:28:38	2025-01-14 10:28:38	0	0	0	\N	LC2025011419	0		\N	\N	18	2000	2200	50	50	7	0	LC2025011419			0
6	15677ce391d45b31736237969	15	7	330	0	0	330	2	0	2025-01-07 08:19:52	1	1	0	0	330	0	2025-01-07 08:19:52	2025-01-07 08:19:53	0	0	0	\N	LC202501076	0		\N	\N	4	0	330	0	100	7	0	LC202501076			0
10	9677cee303cd941736240688	9	9	660	0	0	685	2	4	2025-01-07 09:05:04	1	2	0	330	330	25	2025-01-07 09:05:04	2025-01-07 11:02:07	0	0	0	\N	LC2025010710	0		\N	\N	17	330	330	50	50	7	0	LC2025010710			0
14	15677e14501b5d51736315984	15	11	600	30	0	680	2	4	2025-01-08 06:00:40	1	2	0	240	390	50	2025-01-08 06:00:40	2025-01-11 10:26:27	0	0	0	\N	LC2025010814	0		\N	\N	16	240	390	40	60	7	0	LC2025010814			0
21	\N	1	1	250	0	0	750	2	3	\N	0	0	0	0	0	0	2025-01-14 13:12:51	2025-01-14 18:39:25	0	0	0	\N	\N	0		\N	\N	\N	\N	\N	0	0	0	1	678662d32ce67	2025-01-14 13:12:51	13:12	0
16	156784ffbbe6fdf1736769467	15	11	8000	400	0	8440	2	0	2025-01-13 11:58:05	1	1	0	4000	4400	40	2025-01-13 11:58:05	2025-01-13 11:58:05	0	0	0	\N	LC2025011316	0		\N	\N	18	4000	4400	50	50	7	0	LC2025011316			0
17	\N	55	1	750	0	0	750	2	1	\N	0	0	0	0	0	0	2025-01-14 07:14:21	2025-01-14 07:14:21	0	0	0	\N	\N	0		\N	\N	\N	\N	\N	0	0	0	1	67860ecd5bdb7	2025-01-14 07:14:21	07:14	0
18	\N	55	13	250	0	0	250	2	1	\N	0	0	0	0	0	0	2025-01-14 07:54:24	2025-01-14 07:54:24	0	0	0	\N	\N	0		\N	\N	\N	\N	\N	0	0	0	1	67861830aa235	2025-01-14 07:54:24	07:54	0
\.


--
-- Data for Name: orders_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_services (order_id, invoice_id, user_id, address_id, total, vat, discount, grand_total, payment_mode, status, booking_date, admin_commission, vendor_commission, created_at, updated_at, is_mute, refund_method, refund_requested, refund_accepted, refund_requested_date, refund_accepted_date, order_no, coupon_id, coupon_vender_id, read_admin, accepted_vendor, accepted_date, ref_history_id, ref_code, activity_id, user_latitude, user_longitude, service_charge, task_description, doc) FROM stdin;
\.


--
-- Data for Name: orders_services_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_services_items (id, order_id, service_id, price, discount, total, order_status, admin_commission, vendor_commission, booking_date, created_at, updated_at, accepted_vendor, accepted_date, text, hourly_rate, task_description, doc, qty, withdraw_status, withdraw_request_at, vat, vendor_comment, vendor_doc) FROM stdin;
\.


--
-- Data for Name: orders_services_mute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_services_mute (id, vendor_id, service_order_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: orders_services_rejected; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_services_rejected (id, vendor_id, service_order_id, service_order_item_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: payment_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_report (id, transaction_id, payment_status, user_id, ref_id, amount, method_type, vat, wallet_amount_used, created_at, updated_at) FROM stdin;
1	9677bd27707f461736168055	A	9	9677bd27707f461736168055	110.00	1	0.00	0.00	2025-01-06 12:54:15	2025-01-06 12:54:58
2	9677c0a91e623e1736182417	P	9	9677c0a91e623e1736182417	110.00	1	0.00	0.00	2025-01-06 16:53:38	\N
3	9677c0cb83eb8d1736182968	P	9	9677c0cb83eb8d1736182968	110.00	1	0.00	0.00	2025-01-06 17:02:48	\N
4	9677c0f48498181736183624	A	9	9677c0f48498181736183624	110.00	1	0.00	0.00	2025-01-06 17:13:44	2025-01-06 17:14:02
5	9677c11db35d141736184283	A	9	9677c11db35d141736184283	359.00	1	0.00	0.00	2025-01-06 17:24:43	2025-01-06 17:25:00
6	9677c1213cfb3b1736184339	A	9	9677c1213cfb3b1736184339	330.00	1	0.00	0.00	2025-01-06 17:25:40	2025-01-06 17:26:08
7	15677cddd2a68e81736236498	A	15	15677cddd2a68e81736236498	238.00	1	0.00	0.00	2025-01-07 07:54:59	2025-01-07 07:55:15
8	15677ce391d45b31736237969	A	15	15677ce391d45b31736237969	330.00	1	0.00	0.00	2025-01-07 08:19:30	2025-01-07 08:19:52
9	14677ce40dd8fc91736238093	P	14	14677ce40dd8fc91736238093	619.00	1	0.00	0.00	2025-01-07 08:21:34	\N
10	14677ce440be13b1736238144	A	14	14677ce440be13b1736238144	619.00	1	0.00	0.00	2025-01-07 08:22:25	2025-01-07 08:22:48
11	9677ce8d9dfc621736239321	P	9	9677ce8d9dfc621736239321	119.00	1	0.00	0.00	2025-01-07 08:42:02	\N
12	9677ce94a0cf4f1736239434	P	9	9677ce94a0cf4f1736239434	119.00	1	0.00	0.00	2025-01-07 08:43:54	\N
13	9677cec30d70ec1736240176	A	9	9677cec30d70ec1736240176	107.10	1	0.00	0.00	2025-01-07 08:56:17	2025-01-07 08:56:33
14	9677ced5c7acf01736240476	A	9	9677ced5c7acf01736240476	685.00	1	0.00	0.00	2025-01-07 09:01:17	2025-01-07 09:01:32
15	9677cee303cd941736240688	A	9	9677cee303cd941736240688	685.00	1	0.00	0.00	2025-01-07 09:04:48	2025-01-07 09:05:04
16	15677d138c0919f1736250252	P	15	15677d138c0919f1736250252	12040.00	1	0.00	0.00	2025-01-07 11:44:12	\N
17	15677d13a279d361736250274	A	15	15677d13a279d361736250274	6040.00	1	0.00	0.00	2025-01-07 11:44:34	2025-01-07 11:44:55
18	15677d1a8e85dda1736252046	A	15	15677d1a8e85dda1736252046	2785.00	1	0.00	0.00	2025-01-07 12:14:07	2025-01-07 12:14:31
19	9677d20156eb7d1736253461	P	9	9677d20156eb7d1736253461	8040.00	1	0.00	0.00	2025-01-07 12:37:41	\N
20	9677dd5699076b1736299881	P	9	9677dd5699076b1736299881	7440.00	1	0.00	0.00	2025-01-08 01:31:22	\N
21	9677df7605bf3f1736308576	A	9	9677df7605bf3f1736308576	6690.00	1	350.00	0.00	2025-01-08 03:56:16	2025-01-08 03:56:34
22	15677e14501b5d51736315984	A	15	15677e14501b5d51736315984	680.00	1	30.00	0.00	2025-01-08 05:59:44	2025-01-08 06:00:40
23	9677e407c0829a1736327292	A	9	9677e407c0829a1736327292	560.50	1	25.50	0.00	2025-01-08 09:08:12	2025-01-08 09:09:00
24	156784ffbbe6fdf1736769467	A	15	156784ffbbe6fdf1736769467	8440.00	1	400.00	0.00	2025-01-13 11:57:48	2025-01-13 11:58:05
25	15678523943ee9d1736778644	P	15	15678523943ee9d1736778644	787.50	1	37.50	0.00	2025-01-13 14:30:44	\N
26	15678523b6140791736778678	P	15	15678523b6140791736778678	1102.50	1	52.50	0.00	2025-01-13 14:31:18	\N
27	15678523cc5f4821736778700	P	15	15678523cc5f4821736778700	945.00	1	45.00	0.00	2025-01-13 14:31:40	\N
28	15678617d91898c1736841177	P	15	15678617d91898c1736841177	5145.00	1	245.00	0.00	2025-01-14 07:52:57	\N
29	967863c44610021736850500	A	9	967863c44610021736850500	4200.00	1	200.00	0.00	2025-01-14 10:28:20	2025-01-14 10:28:38
30	967864fdb067a11736855515	A	9	967864fdb067a11736855515	15046.50	1	716.50	0.00	2025-01-14 11:51:55	2025-01-14 11:52:12
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, created_at, updated_at) FROM stdin;
1	App\\Models\\User	7	Personal Access Token	015348c7de1918b7ef51982710dbd7494386afabc00f0fad35e28d1edddd2972	["*"]	\N	2024-11-30 05:21:25	2024-11-30 05:21:25
2	App\\Models\\User	7	Personal Access Token	4a40a3efb988de185539715964d6edb96af6e1850dd5e7deade36ab346fbd8ad	["*"]	\N	2024-11-30 05:21:26	2024-11-30 05:21:26
3	App\\Models\\User	7	Personal Access Token	22b672ad74ac4026a24a2aa205492dd5273445119efa1b50958fb7e4ddc47970	["*"]	\N	2024-11-30 05:40:35	2024-11-30 05:40:35
4	App\\Models\\User	7	Personal Access Token	ac29dab75cd1be2b9ce853e428eaee8570a1f82fa27f29addc2f993f7668a171	["*"]	\N	2024-11-30 07:58:43	2024-11-30 07:58:43
5	App\\Models\\User	8	Personal Access Token	fd69825cc8261218c33c93af2fe23e807792d42c7e76e82ae1f71914fd8475d1	["*"]	\N	2024-11-30 10:14:09	2024-11-30 10:14:09
6	App\\Models\\User	8	Personal Access Token	bd25d73b9e7531995bd1aa277ea8af310267a4114ee26cd2cb7bdf33e89b8bcc	["*"]	\N	2024-11-30 10:14:10	2024-11-30 10:14:10
7	App\\Models\\User	9	Personal Access Token	06019dffccbb436b84b10223b0aeacaa1fc5146efbc3d3640dfbef1f25f92b23	["*"]	\N	2024-11-30 11:33:34	2024-11-30 11:33:34
8	App\\Models\\User	9	Personal Access Token	0dcf0d7d6f870db7cf548d07dd55ac8daa19cf81823354792a90e78fcd45eb6c	["*"]	\N	2024-11-30 11:33:35	2024-11-30 11:33:35
9	App\\Models\\User	9	Personal Access Token	0168f42f9cef6df105138e9012b2970650a8b3e876a5cd4dd933dcefb641c5d7	["*"]	\N	2024-11-30 11:49:20	2024-11-30 11:49:20
10	App\\Models\\User	9	Personal Access Token	84c63355bb961147913f980657c5cc20096167244ecc6b63368ae9613c5152bd	["*"]	\N	2024-11-30 12:25:08	2024-11-30 12:25:08
11	App\\Models\\User	9	Personal Access Token	40dae69d4c7a803976c0b08bee12e24075b62f3fbaa94c151ec4c2123da1abfe	["*"]	\N	2024-12-02 08:35:22	2024-12-02 08:35:22
12	App\\Models\\User	10	Personal Access Token	870675b584608129ee1ef41e45cfe9d3bc2352e1fd343537c02d8c64c0b3d289	["*"]	\N	2024-12-02 09:21:57	2024-12-02 09:21:57
13	App\\Models\\User	10	Personal Access Token	1aa4a0cea71cf66f144c0a42cd883be3735bef35808fbdf5a7dab1bb0292b69a	["*"]	\N	2024-12-02 09:21:58	2024-12-02 09:21:58
14	App\\Models\\User	10	Personal Access Token	dc0877f8bde785ee704eba6419051c16ba70de9abd024d58159ed3ea58eed3e1	["*"]	\N	2024-12-02 09:22:03	2024-12-02 09:22:03
15	App\\Models\\User	10	Personal Access Token	f01dd28317ab608d120cf72e6391f39b48ce3cd6a6ba48301dcc4346d755b1bd	["*"]	\N	2024-12-02 09:23:45	2024-12-02 09:23:45
16	App\\Models\\User	10	Personal Access Token	92b0eb24679ddc74d37b09ccc0fe9cecdd47ead372248048e12db12b8516b4f8	["*"]	\N	2024-12-02 09:25:13	2024-12-02 09:25:13
17	App\\Models\\User	11	Personal Access Token	f2be01b540bf2974ed7d60046626efeb29312b3fe6d675abe4d8efaa61a569f3	["*"]	\N	2024-12-02 09:56:40	2024-12-02 09:56:40
18	App\\Models\\User	11	Personal Access Token	197d0bd1d6fc76e96b3ad55b914d85139b3ed81e27b47599398323381fc917df	["*"]	\N	2024-12-02 09:56:41	2024-12-02 09:56:41
19	App\\Models\\User	11	Personal Access Token	ad852278e1f32f11b740e12704fa06b219e3c5f27a6b577a44f501a1a61156eb	["*"]	\N	2024-12-02 10:05:29	2024-12-02 10:05:29
20	App\\Models\\User	9	Personal Access Token	12def0f454b209bcb8f31a8c5aa59154012fb5f96e873ca2381d96a54b6e4887	["*"]	\N	2024-12-02 10:08:36	2024-12-02 10:08:36
21	App\\Models\\User	12	Personal Access Token	c097ba8be80b6d9e6db2265e7916703baf1802cc13c5c86051a715ad00c50225	["*"]	\N	2024-12-02 21:48:49	2024-12-02 21:48:49
22	App\\Models\\User	12	Personal Access Token	3253403a852385de02aa5ee5bd925693b9a95108b215220cc133b7ca559372cf	["*"]	\N	2024-12-02 21:48:50	2024-12-02 21:48:50
23	App\\Models\\User	9	Personal Access Token	37b56bb78e3715223250930a095a73a19bf47c0af71d9dc2542124f1d9bfd2af	["*"]	\N	2024-12-03 15:37:06	2024-12-03 15:37:06
24	App\\Models\\User	2	Personal Access Token	e32a07c077afe85d31eea4b80fd5e64bc2170de52f26c594b55f21b091b4dd42	["*"]	\N	2024-12-20 09:08:34	2024-12-20 09:08:34
25	App\\Models\\User	9	Personal Access Token	f4783b1552b4b2776bbc478d7decd971f99695b64f0a427c9623dca64b793f63	["*"]	\N	2024-12-20 09:10:06	2024-12-20 09:10:06
26	App\\Models\\User	2	Personal Access Token	d49d31bafcd4bdbab23f94dd2e72306268c143f65bf22671a0e395e718d3db35	["*"]	\N	2024-12-20 09:17:09	2024-12-20 09:17:09
27	App\\Models\\User	9	Personal Access Token	bad01c64bab3cd3c9eb1e0c4104712fee718ff2646dcbfa1c36c74f3a6ed8fe2	["*"]	\N	2024-12-20 09:20:16	2024-12-20 09:20:16
28	App\\Models\\User	9	Personal Access Token	b6584dc4db80aefbe975f8f42ef13df8fb1856d3f238b75c4df3850d0d990efc	["*"]	\N	2024-12-20 09:20:20	2024-12-20 09:20:20
29	App\\Models\\User	2	Personal Access Token	f533d03224debff130c7499a25b09891694284faccee52e016154852676fe46a	["*"]	\N	2024-12-20 09:21:41	2024-12-20 09:21:41
30	App\\Models\\User	2	Personal Access Token	1b0354eed0c8192fc5abf77184fbc990c3e5a9f0fef06adc598dbea16eeb6628	["*"]	\N	2024-12-20 09:24:28	2024-12-20 09:24:28
31	App\\Models\\User	2	Personal Access Token	6542907ad2c741e2315021fb1049af4510157277020f4637214c3a35379eb755	["*"]	\N	2024-12-20 09:26:13	2024-12-20 09:26:13
32	App\\Models\\User	2	Personal Access Token	b7d14869187997e5c3d628d2888dec0d58ed5f0fdd185759b004db1521b0e102	["*"]	\N	2024-12-20 09:27:05	2024-12-20 09:27:05
33	App\\Models\\User	2	Personal Access Token	c5d5dd321c272d7d629f88e3426017a9226d1c9df46ed7498a43a0fae48c5cab	["*"]	\N	2024-12-20 09:28:34	2024-12-20 09:28:34
34	App\\Models\\User	2	Personal Access Token	5add1e5576a12e478e9d3194589e82c0b92d02804d66a094a224dd99f90808a4	["*"]	\N	2024-12-20 09:28:44	2024-12-20 09:28:44
35	App\\Models\\User	2	Personal Access Token	e3e8fcfed6eb0722ce9393a21048ce337615dd7e948ad4e616cd5692951d652c	["*"]	\N	2024-12-20 09:30:28	2024-12-20 09:30:28
36	App\\Models\\User	2	Personal Access Token	63dc7012a98074adeddabf75dfcb10f93c3226b7999f6fe47cd91ff66261c9a5	["*"]	\N	2024-12-20 09:32:05	2024-12-20 09:32:05
37	App\\Models\\User	9	Personal Access Token	5da423d47cadec89bcf1912ddca59f0f56adb42285a257353de40b851527a161	["*"]	\N	2024-12-20 09:35:22	2024-12-20 09:35:22
38	App\\Models\\User	9	Personal Access Token	67d19ca53016df790a2b09dcd3a306d77ad9333415aaef4f89dd77556d736ca1	["*"]	\N	2025-01-06 15:35:14	2025-01-06 15:35:14
39	App\\Models\\User	13	Personal Access Token	28d65ee9dc70390f15a1cec640cf2ebacf0fa44e55c33fce39f8963f363ffe1c	["*"]	\N	2025-01-06 22:22:11	2025-01-06 22:22:11
40	App\\Models\\User	13	Personal Access Token	6c6b63b06c7d6e886789fa42aabaa5cf5ce67aa2b3cbd7d2a1119c585ce2f7ee	["*"]	\N	2025-01-06 22:22:12	2025-01-06 22:22:12
41	App\\Models\\User	13	Personal Access Token	0d9409469d6f94500a2c61dab248ad36e3b622d84e74e9fb3791eb7f442e0518	["*"]	\N	2025-01-06 22:33:39	2025-01-06 22:33:39
42	App\\Models\\User	13	Personal Access Token	69129757334e07afeb9f27654b0e7761124e283ed66cc6a3a74ca2117cf09744	["*"]	\N	2025-01-06 22:37:17	2025-01-06 22:37:17
43	App\\Models\\User	9	Personal Access Token	ebad33481d0962557fb2e4bbce9075d8873412ac7051b0735636032836352190	["*"]	\N	2025-01-07 01:01:47	2025-01-07 01:01:47
44	App\\Models\\User	14	Personal Access Token	1e7d324a2cf094cedd023af79f6a4fd572f96fe5e69c29129e0ae2511abb895e	["*"]	\N	2025-01-07 04:05:16	2025-01-07 04:05:16
45	App\\Models\\User	14	Personal Access Token	a5df0ffaafdaa09e728cd2d5c8794d77c6f666194315e5b0f5ec84ee38483c14	["*"]	\N	2025-01-07 04:05:17	2025-01-07 04:05:17
46	App\\Models\\User	15	Personal Access Token	35a76d4e4396e7daa1c8fb6abb8e1a5714ff9e970ed1e60a58c21110474cdd03	["*"]	\N	2025-01-07 06:04:34	2025-01-07 06:04:34
47	App\\Models\\User	15	Personal Access Token	00fc3c20ecbcdca9fa8c8cbd21e022193fc07455939f017cb3ff1fa3e83ded79	["*"]	\N	2025-01-07 06:04:35	2025-01-07 06:04:35
48	App\\Models\\User	15	Personal Access Token	b1200f6e68511bf46bab83bbe5874ccf958d47ac551126ebb0a3d736ca6f6ef9	["*"]	\N	2025-01-07 11:07:17	2025-01-07 11:07:17
49	App\\Models\\User	9	Personal Access Token	f11fb4c6c209a269e80a2d5b92a789993c5cd9f2b16194f5367f45b8a265538f	["*"]	\N	2025-01-07 15:39:57	2025-01-07 15:39:57
50	App\\Models\\User	9	Personal Access Token	88258f5583080c76d6f1aaf5d133eddf9c5ec4403ab3564c275a0720ebdfbe5c	["*"]	\N	2025-01-07 16:18:33	2025-01-07 16:18:33
51	App\\Models\\User	9	Personal Access Token	01140d87dc2dc3ac2560f92f5fc6fca6a35236c6d1a6a0b71df41cd448064ec0	["*"]	\N	2025-01-08 01:28:31	2025-01-08 01:28:31
52	App\\Models\\User	15	Personal Access Token	c904f872b53032ed3b2e62d370633451e07bec2afdb3b41e8e2c2f007f9af99f	["*"]	\N	2025-01-08 05:52:43	2025-01-08 05:52:43
53	App\\Models\\User	9	Personal Access Token	70ce7cd37cb02bc2e09ae874dc43619c2521068430751e6fbe2ed873e95a71b0	["*"]	\N	2025-01-08 07:25:49	2025-01-08 07:25:49
54	App\\Models\\User	13	Personal Access Token	bfca87c029e9dacc72248a7073812a2d2633b04b914df3d2eb00b53ea3303219	["*"]	\N	2025-01-08 08:29:35	2025-01-08 08:29:35
55	App\\Models\\User	13	Personal Access Token	3c51be982a4b32bdfff7baf08bbce22bfefb6c3d0fc6a8cbdb465ff57fae2f58	["*"]	\N	2025-01-08 08:40:32	2025-01-08 08:40:32
56	App\\Models\\User	33	Personal Access Token	e7430f603def28e448c5d34c1079c4c04302a4968c1a6bbc500798506256e251	["*"]	\N	2025-01-08 09:01:55	2025-01-08 09:01:55
57	App\\Models\\User	33	Personal Access Token	930b58416090d0ce4777dad6ad64715e78ef1c9f3b853bb56ad851fd85a41994	["*"]	\N	2025-01-08 09:01:56	2025-01-08 09:01:56
58	App\\Models\\User	9	Personal Access Token	20002c6ed7fc9eaaab7a183247309fc88eceda9569abb9451d6bcae9a86c067d	["*"]	\N	2025-01-08 09:03:11	2025-01-08 09:03:11
59	App\\Models\\User	9	Personal Access Token	b9fbba27fe4395058aa212f38c1ab9365a8d68ce67bfc33b844495aea8e8b38f	["*"]	\N	2025-01-08 09:41:07	2025-01-08 09:41:07
60	App\\Models\\User	33	Personal Access Token	313f0b790d6ffbeef12707745c08c68120a9f8684c6ea55f22fd229ae76e406b	["*"]	\N	2025-01-08 09:44:43	2025-01-08 09:44:43
61	App\\Models\\User	33	Personal Access Token	978273c0bc6a54e3c4c1bb42b9d04835c1237c5866170fc9d412601bcd455142	["*"]	\N	2025-01-08 09:48:41	2025-01-08 09:48:41
62	App\\Models\\User	33	Personal Access Token	664bed29606ac81d0b48af356307b6a4e50222589862258d3a4fa7eaab91b68c	["*"]	\N	2025-01-08 09:53:03	2025-01-08 09:53:03
63	App\\Models\\User	33	Personal Access Token	e7ee254cace33fd9dc162a2339c9d843e29e8af2d2f5674c19f0bb5564c8e30f	["*"]	\N	2025-01-08 09:56:09	2025-01-08 09:56:09
64	App\\Models\\User	9	Personal Access Token	4394727f9961b65529c005404d779726e4b5848fdad5177264ccf55f948a42e3	["*"]	\N	2025-01-08 09:56:40	2025-01-08 09:56:40
65	App\\Models\\User	33	Personal Access Token	0ea3320db8238156500094a103177ced5ac1e829d99fb067625bc1f68e7939a3	["*"]	\N	2025-01-08 10:38:17	2025-01-08 10:38:17
66	App\\Models\\User	33	Personal Access Token	1069b689154d882dbfe6fe9f30c672a4101442646143a08570e019de25e8cd6d	["*"]	\N	2025-01-08 10:40:14	2025-01-08 10:40:14
67	App\\Models\\User	38	Personal Access Token	c6e93b03f64e653c0ebb337b91f174f39a3d3725b70b590f35f3defacd38881f	["*"]	\N	2025-01-08 10:41:12	2025-01-08 10:41:12
68	App\\Models\\User	38	Personal Access Token	ea13cc45c5ed4b3ff4bef8671f76b36e1b2ad3ecb314074d49fd1b6feb26db95	["*"]	\N	2025-01-08 10:41:12	2025-01-08 10:41:12
69	App\\Models\\User	33	Personal Access Token	3dc5fce70271711cbd4f92e78f7cfc0555e1d1ccb0556ce4f557e7ec24893670	["*"]	\N	2025-01-08 10:59:20	2025-01-08 10:59:20
70	App\\Models\\User	33	Personal Access Token	cf9fbbdd1581346502442734c9bf9c80c481cee8b5f5554dfe7bac9ff072761f	["*"]	\N	2025-01-08 11:44:33	2025-01-08 11:44:33
71	App\\Models\\User	33	Personal Access Token	26f8fb43dc2408fc005f107ba841ed77c9dc329aa0773076406884d2a80e5f8c	["*"]	\N	2025-01-08 15:17:56	2025-01-08 15:17:56
72	App\\Models\\User	13	Personal Access Token	090d4ec31cc1b82dc7d5241c7253c10a4a6ba8e2812fa4804111f3b435015059	["*"]	\N	2025-01-08 17:03:00	2025-01-08 17:03:00
73	App\\Models\\User	9	Personal Access Token	f7c000b1975d9aecb4cbc558685d036f127dc9822c71d9e06ee1720817a90e3b	["*"]	\N	2025-01-08 17:28:04	2025-01-08 17:28:04
74	App\\Models\\User	33	Personal Access Token	557f29ac544234c0094f5c3427e1ed3458669478f50c0d342251d038eb203848	["*"]	\N	2025-01-08 17:32:15	2025-01-08 17:32:15
75	App\\Models\\User	9	Personal Access Token	4074a9f3afd56a92fcc03953c59f1a2d923298205bde88cf63df6b337f223d91	["*"]	\N	2025-01-08 17:43:17	2025-01-08 17:43:17
76	App\\Models\\User	13	Personal Access Token	6fc1664b4f35569685f2663bb6cb943017521a7ddcd46b6753c87c4e8a5f63bf	["*"]	\N	2025-01-08 18:35:45	2025-01-08 18:35:45
77	App\\Models\\User	9	Personal Access Token	524adce55e3a6fca5c1389c2e20f41536dbfc4ab7abfbc2fecf8deea39f6dbbd	["*"]	\N	2025-01-08 20:02:05	2025-01-08 20:02:05
78	App\\Models\\User	33	Personal Access Token	1983db73ab8bffd242a59e0610813249d3a1ff330c5a5ae054e88b17738249c1	["*"]	\N	2025-01-09 07:12:54	2025-01-09 07:12:54
79	App\\Models\\User	38	Personal Access Token	4910bf08752f555e86553d6c7ee98349b374b6b24f752992f7577a2502f0394a	["*"]	\N	2025-01-09 08:17:32	2025-01-09 08:17:32
80	App\\Models\\User	33	Personal Access Token	63f845713cf320202991c402bf8a11383009b82125820fed0e3e53f3f5462b6e	["*"]	\N	2025-01-09 15:34:09	2025-01-09 15:34:09
81	App\\Models\\User	9	Personal Access Token	3496648c5cdd53be45125ca53834903ebed5ecd352f89ab6be4db64557d96e7a	["*"]	\N	2025-01-09 15:44:21	2025-01-09 15:44:21
82	App\\Models\\User	11	Personal Access Token	e1a3a1c6f366ca4a4b19f4e28315830b92c797a2315555f1703169d7cf5fd4b0	["*"]	\N	2025-01-09 16:27:15	2025-01-09 16:27:15
83	App\\Models\\User	9	Personal Access Token	dd13d6ff2d366efe7e82f24648c29d189ee921176818d783b86bd8925b093f11	["*"]	\N	2025-01-09 16:28:48	2025-01-09 16:28:48
84	App\\Models\\User	13	Personal Access Token	a17ca3b328e7e557fa9068dbc025d696d3a474c0d893f38a42c65ea0f2d6d193	["*"]	\N	2025-01-10 13:05:17	2025-01-10 13:05:17
85	App\\Models\\User	9	Personal Access Token	744ec82a754fb56786d738a63e521265f2e1fdbf38a2d75032f8575ca38ded2f	["*"]	\N	2025-01-10 13:55:24	2025-01-10 13:55:24
86	App\\Models\\User	13	Personal Access Token	cfdc4ecfe66048c7b378b32963e68ca50682da0458274c15dcab4ef8fb585603	["*"]	\N	2025-01-10 14:23:31	2025-01-10 14:23:31
87	App\\Models\\User	33	Personal Access Token	4c4d129b7b69c244a754abda7444ef4b61614e8b9866a92d1100c8c178f9e6bf	["*"]	\N	2025-01-10 15:24:15	2025-01-10 15:24:15
88	App\\Models\\User	13	Personal Access Token	f550db6a56e7ee553da7d3911b4c203af0fd8edeb83b6d494bbdd1f60f739e3d	["*"]	\N	2025-01-10 17:37:11	2025-01-10 17:37:11
89	App\\Models\\User	13	Personal Access Token	f7a17a082560767cbcf550164224160ce72477e157f25cc78ce32eb37fd609c9	["*"]	\N	2025-01-10 17:39:17	2025-01-10 17:39:17
90	App\\Models\\User	33	Personal Access Token	239f963b23904048547f65c39b037d0fe6b1feba1b28c34784328bdc99328fb4	["*"]	\N	2025-01-10 21:56:45	2025-01-10 21:56:45
91	App\\Models\\User	33	Personal Access Token	f8f0e268af1a3fd48c77526aecfa9ce5b0e7d5bb79b7dd2c8cc971d70e5ec34a	["*"]	\N	2025-01-10 21:57:29	2025-01-10 21:57:29
92	App\\Models\\User	33	Personal Access Token	83aa785090275a38b19aa4b4774ec2379c3ec541556561be141560c342b1eec6	["*"]	\N	2025-01-10 22:09:27	2025-01-10 22:09:27
93	App\\Models\\User	9	Personal Access Token	3fb5aee3e3388ef8f76f28267ef4f1f1a4c2dac2a091237e5ac6a39087316751	["*"]	\N	2025-01-11 06:17:25	2025-01-11 06:17:25
94	App\\Models\\User	13	Personal Access Token	e922f517e8e5e01b83db973db7456331f40cdf0a466230208458b1888a08c82c	["*"]	\N	2025-01-11 08:00:38	2025-01-11 08:00:38
95	App\\Models\\User	15	Personal Access Token	03355c160229acc4e37555f612e748d7a8f55f0cf5b486591574cdc9575355d0	["*"]	\N	2025-01-11 09:52:14	2025-01-11 09:52:14
96	App\\Models\\User	15	Personal Access Token	8c57a171e2f598e439470524c055b29ae2283afc570890b51150dae7ed331ddc	["*"]	\N	2025-01-11 11:04:15	2025-01-11 11:04:15
97	App\\Models\\User	15	Personal Access Token	d85ae5792f56bb06649304621bc576d995eba95ecb8f6f02dbdc074de1ad5339	["*"]	\N	2025-01-11 11:17:32	2025-01-11 11:17:32
98	App\\Models\\User	15	Personal Access Token	aaf20301ffafc5a5a07a4c4d99db81ada2b5a2c68016f815a70f3c0aec28d1e6	["*"]	\N	2025-01-11 11:19:07	2025-01-11 11:19:07
99	App\\Models\\User	13	Personal Access Token	0fedd695e6c0d20bd01ad2590b04951da25106aeef59fcb0e9e93f76e385d71c	["*"]	\N	2025-01-11 13:19:15	2025-01-11 13:19:15
100	App\\Models\\User	13	Personal Access Token	620c6f1659a219f77672826f77555c00031f423ea5d639de4689575d7b1d9289	["*"]	\N	2025-01-11 14:16:22	2025-01-11 14:16:22
101	App\\Models\\User	15	Personal Access Token	127de44032908818b27d398cc1225abcae849f82ed6f85aeae619daf9ef91cb9	["*"]	\N	2025-01-13 06:45:22	2025-01-13 06:45:22
102	App\\Models\\User	15	Personal Access Token	36485ed3355468ed1d92ae0ee6511f1f525de00f7838a1780819c83acf0e4b60	["*"]	\N	2025-01-13 07:56:48	2025-01-13 07:56:48
103	App\\Models\\User	15	Personal Access Token	beaf39d8a99dbbcfa64c842c551ae8d6f5ca7f67405a2b21f095fe77289ff2cf	["*"]	\N	2025-01-13 08:06:34	2025-01-13 08:06:34
104	App\\Models\\User	15	Personal Access Token	8ceba43a2249d3a91fb2294d81c5babee1d7f9ea3244c03214dcb384314f5efe	["*"]	\N	2025-01-13 08:14:33	2025-01-13 08:14:33
105	App\\Models\\User	15	Personal Access Token	44bff2d361661812a17ac5b4f07ad0f9de35259b8b24467a503f29096e252f8b	["*"]	\N	2025-01-13 09:28:26	2025-01-13 09:28:26
106	App\\Models\\User	15	Personal Access Token	b7aa175943298676b51e10d50817791dc6ee59d0feac23f153594a701da933cb	["*"]	\N	2025-01-13 12:29:04	2025-01-13 12:29:04
107	App\\Models\\User	33	Personal Access Token	b87f9eec2de6e37850044707eb0481985ead2cdf402893fef8bf62c15b189a2c	["*"]	\N	2025-01-13 12:43:00	2025-01-13 12:43:00
108	App\\Models\\User	33	Personal Access Token	d0f69e4eb9f936527276ec5779ce3018c49a58c8dbf1cb3b7edf45ef2e9bbeb3	["*"]	\N	2025-01-13 13:07:13	2025-01-13 13:07:13
109	App\\Models\\User	15	Personal Access Token	96729b30e344bee5fe8fdaac3cfc2786c515aab9fb9c1595a2b06644674604aa	["*"]	\N	2025-01-13 14:29:37	2025-01-13 14:29:37
110	App\\Models\\User	33	Personal Access Token	f2f777f9d4a3b6c8b8abf9effa900fc3ef5f5d956cf40c8565b50251b3eae59a	["*"]	\N	2025-01-13 15:39:50	2025-01-13 15:39:50
111	App\\Models\\User	15	Personal Access Token	f9fb084059d8b11bfccfec09b996424bfa21ffd26435bcc523d019ce3605b001	["*"]	\N	2025-01-13 17:43:32	2025-01-13 17:43:32
112	App\\Models\\User	15	Personal Access Token	3574557ef37bb127cded487fe3586cbea362318ac02bfce84fa67215014f6964	["*"]	\N	2025-01-14 07:47:57	2025-01-14 07:47:57
113	App\\Models\\User	15	Personal Access Token	2268d9857590b5fac8275b902a51a2e409f8b3daf7050a47216a4c6580e498a0	["*"]	\N	2025-01-14 07:57:44	2025-01-14 07:57:44
114	App\\Models\\User	15	Personal Access Token	5d80a890e4ef36340f909c6c4562961290497a57fc3f2e586310f96183ff866a	["*"]	\N	2025-01-14 10:20:33	2025-01-14 10:20:33
115	App\\Models\\User	9	Personal Access Token	92bac6bf7d72d39ed17f0347700e3d22890b185325bb6b1e7e6aa170de6af7ee	["*"]	\N	2025-01-14 10:27:33	2025-01-14 10:27:33
116	App\\Models\\User	9	Personal Access Token	3eddd64b69ed7770c3e9e3631b10bc85395dd2e9cdb511d922004566c45b1478	["*"]	\N	2025-01-14 10:36:29	2025-01-14 10:36:29
117	App\\Models\\User	9	Personal Access Token	e4e78f0588f3defa376c1f0046bbf611679da16dcb54627c0815f7523ff1f505	["*"]	\N	2025-01-14 16:10:49	2025-01-14 16:10:49
118	App\\Models\\User	15	Personal Access Token	e07921f0ddf57b42d3ae67fa44af6639c576664b1155e042a91ea2abe13794dc	["*"]	\N	2025-01-14 18:01:17	2025-01-14 18:01:17
119	App\\Models\\User	15	Personal Access Token	051f975f110003101cfbd96d9ef61b14b5ae267c1586e2cd7e7516467d1e04d2	["*"]	\N	2025-01-15 05:15:07	2025-01-15 05:15:07
\.


--
-- Data for Name: post_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_comments (id, user_id, post_id, parent_id, comment, created_at, updated_at, comment_node_id) FROM stdin;
\.


--
-- Data for Name: post_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_likes (id, post_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: post_saves; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_saves (id, post_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: post_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_users (id, post_id, user_id) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, user_id, caption, file_type, file, location_name, lattitude, longitude, post_firebase_node_id, created_at, updated_at, active, visibility, extra_file_names) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, product_type, product_desc_full, product_desc_short, product_sale_from, product_sale_to, product_featured_image, product_tag, product_created_by, product_updated_by, product_status, product_deleted, product_name, product_variation_type, product_taxable, product_vender_id, product_image, product_unique_iden, product_brand_id, product_name_arabic, product_desc_full_arabic, product_desc_short_arabic, cash_points, offer_enabled, deal_enabled, is_today_offer, today_offer_date, thanku_perc, custom_status, meta_title, meta_keyword, meta_description, product_vendor_status, product_gender, is_kandora, collection_id, hot_offer_enabled, trending_enabled, offers_list, zero_quantity_orders, product_code, product_tags, sort_order, offer_for_short, hot_offer_sort_order, new_trending_sort_order, author_id, deleted, default_category_id, default_attribute_id, created_at, updated_at, brand, store_id, moda_main_category, moda_sub_category, featured, master_product, boxcount, activity_id, recommended, rating_avg, shipment_and_policies, new_arrival, for_you, trending) FROM stdin;
7	2	\N	\N	\N	\N	\N	\N	4	4	1	0	cccxz	1	1	4	\N	149499832	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	5	0	2024-07-04 15:10:21	2025-01-07 07:33:09	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
15	1	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty.	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty.	\N	\N	\N	\N	17	17	1	0	Arabic jewels	1	1	17	\N	291665267	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	15	2025-01-07 08:51:09	2025-01-14 19:21:06	\N	0	0	0	0	0	0	7	0	3	\N	\N	\N	\N
9	2	\N	\N	\N	\N	\N	\N	4	0	1	0	Test	1	1	4	\N	340323432	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	1	9	2025-01-06 10:43:55	\N	\N	0	0	0	0	0	0	7	0	\N	\N	\N	\N	\N
8	2	\N	\N	\N	\N	\N	\N	4	4	1	0	Cotton Luxe	1	1	4	\N	121945084	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	7	2024-08-29 15:31:13	2025-01-07 08:35:28	\N	0	0	0	0	0	 	7	0	\N	\N	\N	\N	\N
3	1	Custom Birthstone Bracelet, Initial Bracelet, Unbiological Sister Bracelets Birthstone Jewelry Birthday Gift Friendship Bracelet for Women	Custom Birthstone Bracelet, Initial Bracelet, Unbiological Sister Bracelets Birthstone Jewelry Birthday Gift Friendship Bracelet for Women	\N	\N	\N	\N	4	4	1	0	Custom Wall Lights	1	1	4	\N	526230169	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	3	2024-07-02 11:38:44	2025-01-14 19:36:25	\N	0	0	0	0	0	0	7	0	\N	\N	\N	\N	\N
16	1	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty.	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty.	\N	\N	\N	\N	17	17	1	0	Golden Envy	1	1	17	\N	640877598	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	16	2025-01-07 08:52:24	2025-01-14 19:20:29	\N	0	0	0	0	0	0	7	0	\N	\N	\N	\N	\N
14	1	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty.	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty.	\N	\N	\N	\N	17	17	1	0	Persian Diamond	1	1	17	\N	831094520	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	14	2025-01-07 08:49:53	2025-01-14 19:22:01	\N	0	0	0	0	0	0	7	0	\N	\N	\N	\N	\N
2	1	Personalized Baby Name Puzzle with Pegs, First Christmas Gift, Wooden Montessori Toys for Toddler	Personalized Baby Name Puzzle with Pegs, First Christmas Gift, Wooden Montessori Toys for Toddler	\N	\N	\N	\N	4	4	1	0	Vibrant Vibes	1	1	4	\N	679226087	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	2	2024-07-02 11:26:46	2025-01-07 09:10:27	\N	0	0	0	1	0	0	7	1	\N	\N	\N	\N	\N
5	1	Handmade Brown Textured Ceramic Lamp | Bedroom & Livingroom Lightning | Unique, Minimalist Designed	Handmade Brown Textured Ceramic Lamp | Bedroom & Livingroom Lightning | Unique, Minimalist Designed	\N	\N	\N	\N	4	4	1	0	Handmade Brown Textured Ceramic Lamp	1	1	4	\N	683252426	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	1	5	2024-07-02 11:55:08	2025-01-06 08:54:46	\N	0	0	0	1	0	0	7	1	\N	\N	\N	\N	\N
11	1	A timeless line of garments that never go out of style.	A timeless line of garments that never go out of style.	\N	\N	\N	\N	16	16	1	0	Classic Stitch Collection	1	1	16	\N	921777335	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	11	2025-01-07 08:24:37	2025-01-08 13:36:41	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
12	1	Premium quality clothing, focusing on high-end fabrics and sophisticated designs.	Premium quality clothing, focusing on high-end fabrics and sophisticated designs.	\N	\N	\N	\N	16	0	1	0	Luxe Loom	1	1	16	\N	768797289	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	7	12	2025-01-07 08:32:44	\N	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
13	1	Modern, city-inspired clothing for a trendy, on-the-go lifestyle.	Modern, city-inspired clothing for a trendy, on-the-go lifestyle.	\N	\N	\N	\N	16	0	1	0	Urban Weave	1	1	16	\N	802142357	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	7	13	2025-01-07 08:33:32	\N	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
10	2	\N	\N	\N	\N	\N	\N	5	5	1	0	Test	1	1	5	\N	562815623	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	1	10	2025-01-06 11:40:20	2025-01-07 07:51:43	\N	0	0	0	0	0	0	7	0	\N	\N	\N	\N	\N
4	1	Personalised 60th Birthday Map Print | Bespoke Favourite Memories Illustration | Personalised Milestone Birthday Gift | 60th Birthday Gift	Personalised 60th Birthday Map Print | Bespoke Favourite Memories Illustration | Personalised Milestone Birthday Gift | 60th Birthday Gift	\N	\N	\N	\N	4	4	1	0	Personalised 60th Birthday Map Print	1	1	4	\N	660606078	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	4	2024-07-02 11:38:59	2025-01-06 08:54:05	\N	0	0	0	1	0	0	7	1	4.7	\N	\N	\N	\N
18	1	Vivid Interiors\r\nVivid Interiors is a décor brand that brings vibrant and colorful designs to life.	Vivid Interiors\r\nVivid Interiors is a décor brand that brings vibrant and colorful designs to life.	\N	\N	\N	\N	18	18	1	0	Wall Decor	1	1	18	\N	28972654	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	18	2025-01-07 09:00:55	2025-01-14 19:31:08	\N	0	0	0	0	0	0	7	0	\N	\N	\N	\N	\N
17	1	Vivid Interiors\r\nVivid Interiors is a décor brand that brings vibrant and colorful designs to life.	Vivid Interiors\r\nVivid Interiors is a décor brand that brings vibrant and colorful designs to life.	\N	\N	\N	\N	18	18	1	0	Drawing Room	1	1	18	\N	817807687	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	17	2025-01-07 09:00:08	2025-01-14 19:33:13	\N	0	0	0	0	0	0	7	0	\N	\N	\N	\N	\N
1	1	Baby shower personalized gift basket, baby Gift Basket Rope Cotton Basket Baby Gift Basket Toy Basket Storage Basket Baby Name Gift	Baby shower personalized gift basket, baby Gift Basket Rope Cotton Basket Baby Gift Basket Toy Basket Storage Basket Baby Name Gift	\N	\N	\N	\N	4	4	1	0	Ethereal Threads	1	1	4	\N	432347888	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	1	2024-07-02 11:20:49	2025-01-11 10:35:19	\N	0	0	0	0	0	0	7	0	\N	\N	\N	\N	1
6	1	Painters Palette, Floral Paint Palette, Botanical decorReal ,Pressed Flowers, Creative Artist Gift, Art lover tool, Mothers Day	Painters Palette, Floral Paint Palette, Botanical decorReal ,Pressed Flowers, Creative Artist Gift, Art lover tool, Mothers Day	\N	\N	\N	\N	4	4	1	0	Painters Palette, Floral Paint Palette	1	1	4	\N	545180046	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	5	6	2024-07-02 11:56:57	2025-01-06 08:55:17	\N	0	0	0	1	0	0	7	1	\N	\N	\N	\N	\N
20	1	Modern Nest\r\nModern Nest specializes in sleek, contemporary décor pieces that blend functionality and style.	Modern Nest\r\nModern Nest specializes in sleek, contemporary décor pieces that blend functionality and style.	\N	\N	\N	\N	18	18	1	0	Opal Storage	1	1	18	\N	307917027	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	20	2025-01-07 09:17:05	2025-01-14 19:37:34	\N	0	0	0	0	0	0	7	0	2.5	\N	1	\N	\N
27	1	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N	\N	\N	\N	18	18	1	0	Art & Craft	1	1	18	\N	974146296	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	28	2025-01-08 13:40:26	2025-01-14 19:16:21	\N	0	0	0	0	0	0	7	0	\N	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N	\N	\N
19	1	Opal & Oak combines nature-inspired designs with elegant craftsmanship.	Opal & Oak combines nature-inspired designs with elegant craftsmanship.	\N	\N	\N	\N	18	18	1	0	Opal & Oak Light	1	1	18	\N	346196067	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	19	2025-01-07 09:02:07	2025-01-14 19:28:47	\N	0	0	0	0	0	0	7	0	\N	\N	\N	1	\N
24	1	This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.	This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.	\N	\N	\N	\N	30	30	1	0	Handmade Hats & Gloves	1	1	30	\N	895698902	5	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	25	2025-01-08 07:13:21	2025-01-11 10:30:46	\N	0	0	0	0	0	0	7	0	\N	This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.	\N	1	\N
28	1	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N	\N	\N	\N	18	18	1	0	Photo frames	1	1	18	\N	509305287	4	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	29	2025-01-08 13:43:21	2025-01-14 19:15:49	\N	0	0	0	0	0	0	7	0	\N	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N	\N	\N
21	2	\N	\N	\N	\N	\N	\N	17	17	1	0	Luxe Jewelers	1	1	17	\N	787150137	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	22	2025-01-07 09:30:06	2025-01-14 19:19:57	\N	0	0	0	0	0	0	7	0	\N	Shipment And Policies Shipment And Policies Shipment And Policies Shipment And Policies	\N	\N	1
22	2	\N	\N	\N	\N	\N	\N	30	30	1	0	Handmade Bags	1	1	30	\N	7209457	5	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	23	2025-01-08 07:00:54	2025-01-08 13:20:16	\N	0	0	0	1	0	0	7	0	\N	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N	\N	\N
26	1	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N	\N	\N	\N	30	30	1	0	Loom & Luxe Jewels	1	1	30	\N	401391550	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	27	2025-01-08 07:18:32	2025-01-14 19:17:54	\N	0	0	0	0	0	0	7	0	\N	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N	1	\N
23	1	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N	\N	\N	\N	30	30	1	0	Scarves & Shawls	1	1	30	\N	547271237	5	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	24	2025-01-08 07:11:12	2025-01-11 10:36:56	\N	0	0	0	0	0	0	7	0	\N	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	1	\N	\N
29	1	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N	\N	\N	\N	17	17	1	0	Drawing Frames	1	1	17	\N	675506466	4	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	30	2025-01-08 13:44:34	2025-01-14 19:14:22	\N	0	0	0	0	0	0	7	0	\N	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	1	\N	\N
32	1	Little Bundles has the cutest personalised gifts for newborn baby boys & baby girls in UAE.	Little Bundles has the cutest personalised gifts for newborn baby boys & baby girls in UAE.	\N	\N	\N	\N	5	5	1	0	Valentine's Gift	1	1	5	\N	929459235	5	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	33	2025-01-13 07:35:48	2025-01-14 19:10:29	\N	0	0	0	0	0	0	7	0	\N	This page summarises how to return a product to us, our IKEA return policy and making a claim at IKEA.	\N	1	\N
33	1	Everyday essentials: A quality wallet, a stylish watch, or a comfortable backpack. Self-care: Grooming products, gym membership, or a subscription box.	Everyday essentials: A quality wallet, a stylish watch, or a comfortable backpack. Self-care: Grooming products, gym membership, or a subscription box.	\N	\N	\N	\N	5	5	1	0	Polo air Belt Wallet Card Holder Keychain Tan Set	1	1	5	\N	806195042	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	34	2025-01-13 07:41:57	2025-01-14 19:01:54	\N	0	0	0	0	0	0	7	0	\N	Everyday essentials: A quality wallet, a stylish watch, or a comfortable backpack. Self-care: Grooming products, gym membership, or a subscription box.	1	\N	\N
31	1	The best housewarming gifts last longer than your visits\r\nBetter sound, cleaner air or smarter lighting. Nothing says welcome home like new home electronics. And with these practical housewarming gifts, you can help them find new ways to make the most of their life at home – every day.	The best housewarming gifts last longer than your visits\r\nBetter sound, cleaner air or smarter lighting. Nothing says welcome home like new home electronics. And with these practical housewarming gifts, you can help them find new ways to make the most of their life at home – every day.	\N	\N	\N	\N	5	5	1	0	Personalized Basket	1	1	5	\N	532380448	4	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	32	2025-01-13 07:34:09	2025-01-14 19:02:23	\N	0	0	0	0	0	0	7	0	\N	This page summarises how to return a product to us, our IKEA return policy and making a claim at IKEA.	\N	\N	1
34	1	Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine.	Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine.	\N	\N	\N	\N	5	5	1	0	Fiorentina Infinity Set	1	1	5	\N	885522180	6	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	35	2025-01-13 07:44:46	2025-01-14 19:03:40	\N	0	0	0	0	0	0	7	0	\N	Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine.	\N	\N	1
30	1	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N	\N	\N	\N	30	30	1	0	FERRERO ROCHER Basket	1	1	30	\N	510572943	4	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	31	2025-01-08 13:45:37	2025-01-14 19:13:06	\N	0	0	0	0	0	0	7	0	\N	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	1	1	1
25	1	This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.	This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.	\N	\N	\N	\N	30	30	1	0	Chic Rings	1	1	30	\N	566301039	5	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	2	26	2025-01-08 07:17:17	2025-01-14 19:19:15	\N	0	0	0	0	0	0	7	0	\N	This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.	1	\N	\N
\.


--
-- Data for Name: product_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_attribute (attribute_id, attribute_name, attribute_status, attribute_created_date, attribute_name_arabic, attribute_type, is_deleted) FROM stdin;
1	Size	1	\N		1	0
2	Color	1	\N		1	0
\.


--
-- Data for Name: product_attribute_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_attribute_values (attribute_values_id, attribute_id, attribute_values, attribute_values_arabic, attribute_value_in, attribute_value_color, attribute_value_label, attribute_value_label_arabic, attribute_value_image, is_deleted, attribute_value_sort_order, attribute_color) FROM stdin;
1	2	Red		1	\N	\N	\N	\N	0	0	#ffffff
2	2	Orange		1	\N	\N	\N	\N	0	0	#ffffff
3	1	XL		1	\N	\N	\N	\N	0	0	#ffffff
\.


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_category (product_category_id, product_id, category_id) FROM stdin;
100	1	5
101	23	8
19	4	1
20	5	3
21	6	3
23	9	1
28	7	1
30	10	1
119	33	13
120	31	9
121	34	9
34	12	1
35	13	1
36	8	1
123	32	11
124	30	8
125	29	4
43	2	5
126	28	4
127	27	8
129	26	8
130	25	8
131	21	2
132	16	3
133	15	3
134	14	3
136	19	4
138	18	4
140	17	4
141	3	1
142	20	2
75	22	8
83	11	1
94	24	8
\.


--
-- Data for Name: product_cuisines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_cuisines (id, product_id, cuisine_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product_docs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_docs (id, product_id, title, doc_path) FROM stdin;
\.


--
-- Data for Name: product_features; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_features (id, name, image_path, description, created_at, updated_at) FROM stdin;
2	Handmade item	1736270610677d6312b67ed.png	\N	2025-01-07 17:23:30	2025-01-07 17:23:30
3	Materials	1736270671677d634f3ae55.png	\N	2025-01-07 17:24:31	2025-01-07 17:24:31
4	Sustainable features:	1736270709677d63758cdc1.png	\N	2025-01-07 17:25:09	2025-01-07 17:25:09
5	Style	1736270734677d638eb1694.png	\N	2025-01-07 17:25:34	2025-01-07 17:25:34
6	personalized	1736270768677d63b028218.png	\N	2025-01-07 17:26:08	2025-01-07 17:26:08
7	Recycled	1736270823677d63e7a6c28.png	\N	2025-01-07 17:27:03	2025-01-07 17:27:03
8	Length	1736270853677d64052a1f8.png	\N	2025-01-07 17:27:33	2025-01-07 17:27:33
9	Availability	1736270888677d642898c78.png	\N	2025-01-07 17:28:08	2025-01-07 17:28:08
\.


--
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_images (id, product_id, image_name, product_attribute_id) FROM stdin;
\.


--
-- Data for Name: product_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_items (item_id, product_id, name, image_path, created_at, updated_at) FROM stdin;
10	9	Test Item	products//1736160235_Frame 1526390.png	\N	\N
11	9	Test Item	products//1736160235_Frame 1526390.png	\N	\N
13	7	\N	\N	\N	\N
14	11	\N	\N	\N	\N
15	11	\N	\N	\N	\N
16	11	\N	\N	\N	\N
17	11	\N	\N	\N	\N
18	8	\N	\N	\N	\N
\.


--
-- Data for Name: product_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_likes (id, product_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product_master; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_master (id, name, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product_master_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_master_request (id, name, description, vendor_id, deleted, accepted, created_at, updated_at, product_type, category) FROM stdin;
\.


--
-- Data for Name: product_product_feature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_product_feature (id, product_id, product_feature_id, created_at, updated_at, feature_title) FROM stdin;
89	26	7	2025-01-14 19:17:54	2025-01-14 19:17:54	\N
90	26	3	2025-01-14 19:17:54	2025-01-14 19:17:54	Zircoon, Gold
91	21	3	2025-01-14 19:19:57	2025-01-14 19:19:57	Gold, Rose Gold, Silver, Platinum
92	21	5	2025-01-14 19:19:57	2025-01-14 19:19:57	Persian
95	19	7	2025-01-14 19:28:47	2025-01-14 19:28:47	\N
96	19	3	2025-01-14 19:28:47	2025-01-14 19:28:47	Glass, Wood
98	18	3	2025-01-14 19:31:08	2025-01-14 19:31:08	Wood, Metal, Parachute
99	18	5	2025-01-14 19:31:08	2025-01-14 19:31:08	Home box
102	17	3	2025-01-14 19:33:13	2025-01-14 19:33:13	Wood
103	17	8	2025-01-14 19:33:13	2025-01-14 19:33:13	King
104	20	3	2025-01-14 19:37:34	2025-01-14 19:37:34	Wood
38	22	3	2025-01-08 13:20:16	2025-01-08 13:20:16	Jute, Parachute
39	22	6	2025-01-08 13:20:16	2025-01-08 13:20:16	\N
46	11	3	2025-01-08 13:36:41	2025-01-08 13:36:41	Woolen
47	11	8	2025-01-08 13:36:41	2025-01-08 13:36:41	32
57	24	3	2025-01-11 10:30:46	2025-01-11 10:30:46	Jute, Parachute
58	24	5	2025-01-11 10:30:46	2025-01-11 10:30:46	Unique
64	1	3	2025-01-11 10:35:19	2025-01-11 10:35:19	Cotton
65	23	3	2025-01-11 10:36:56	2025-01-11 10:36:56	Cotton, linen
66	23	5	2025-01-11 10:36:56	2025-01-11 10:36:56	Cross
82	31	5	2025-01-14 19:02:23	2025-01-14 19:02:23	Unique
83	29	4	2025-01-14 19:14:22	2025-01-14 19:14:22	Recycled metal. Item may include additional materials or use methods that aren't considered sustainable features on our site.
84	29	3	2025-01-14 19:14:22	2025-01-14 19:14:22	Cotton, Velvet
\.


--
-- Data for Name: product_selected_attribute_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_selected_attribute_list (product_attribute_id, product_id, manage_stock, stock_quantity, allow_back_order, stock_status, sold_individually, weight, length, height, width, shipping_class, sale_price, regular_price, taxable, image, shipping_note, title, rating, rated_users, image_temp, barcode, image_action, pr_code, product_desc, product_full_descr, size_chart) FROM stdin;
12	12	0	6	0	0	0	\N	\N	\N	\N	0	200	200	1	677ce6ac3f87b1736238764.jpg,677ce6ac3f9a31736238764.jpg,677ce6ac3fa551736238764.jpg,677ce6ac3faf81736238764.jpg	\N	\N	\N	0	\N	\N	\N	\N	Premium quality clothing, focusing on high-end fabrics and sophisticated designs.	Luxe Loom\r\nIndulge in luxury with the Luxe Loom collection. This line offers high-end fabrics and sophisticated designs for those who seek a touch of elegance in their everyday wear. Perfect for both formal occasions and upscale casual looks.	\N
1	1	0	67656	0	0	0	\N	\N	\N	\N	0	449	500	1	677e7f8dc5d9d1736343437.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Baby shower personalized gift basket, baby Gift Basket Rope Cotton Basket Baby Gift Basket Toy Basket Storage Basket Baby Name Gift	Our delicate personalized baby shower rope cotton baskets are designed to add a touch of practicality and organization to your baby's nursery. These delicate baskets are perfect for organizing and storing essential items while adding a personalized touch to your space.\r\nEach basket is carefully crafted with attention to detail, using high-quality cotton rope and feature sturdy handles for easy carrying and convenient usage.\r\nYou can choose to have the baby's name, initials, creating a unique and memorable keepsake.	\N
14	14	0	13	0	0	0	\N	\N	\N	\N	0	650	650	1	6786b959c3ecf1736882521.jpg,6786b959c42661736882521.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty.	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty. The word "Gleaming" suggests a radiant, shining quality, symbolizing the brilliance of fine jewelry. "Grace" adds an element of elegance and timeless appeal, evoking the delicate craftsmanship and refined designs that the brand offers.	\N
4	4	0	443	0	0	0	\N	\N	\N	\N	0	330	500	1	677b9a2d7b72d1736153645.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Personalised 60th Birthday Map Print | Bespoke Favourite Memories Illustration | Personalised Milestone Birthday Gift | 60th Birthday Gift	A totally unique personalised hand-drawn map, illustrated with all of your special memories leading up to that milestone birthday.\r\n\r\nThis makes the perfect gift for loved ones who are celebrating that BIG 60th birthday! Illustrated from scratch, we will hand-draw a 'map' of up to 14 of your favourite memories of that person. Maybe they have been on some amazing holidays with loved ones and have some memorable personal highlights.	\N
6	6	0	456	0	0	0	\N	\N	\N	\N	0	559	600	1	677b9a75797e11736153717.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Painters Palette, Floral Paint Palette, Botanical decorReal ,Pressed Flowers, Creative Artist Gift, Art lover tool, Mothers Day	High-quality dried flowers: Our natural dried flowers are organic, non-toxic and tasteless.\r\nA resin palette is the ideal addition to your creative equipment, as resin is relatively easy to clean (though it is advisable to clean while the paint is wet - as you’ll need less water and time). Transparent resin also provides us with an excellent canvas to decorate for your aesthetic pleasure. This, in turn, allows you to paint your own canvas with beautiful equipment at hand.	\N
5	5	0	6542	0	0	0	\N	\N	\N	\N	0	250	400	1	677b9a56720fd1736153686.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Handmade Brown Textured Ceramic Lamp | Bedroom & Livingroom Lightning | Unique, Minimalist Designed	"Rocca Lamp" This piece will bring the minimalist attitude of nature into your home.\r\n•This unique ceramic lamp is made from high quality brown stoneware clay using hand building techniques only. Fired at high temperature (1240°C)\r\n•Will add value to your home with its organic texture and minimalist shape.	\N
3	3	0	563	0	0	0	\N	\N	\N	\N	0	359	600	1	6786bcb9c18d81736883385.jpg,6786bcb9c1cb41736883385.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Custom Birthstone Bracelet, Initial Bracelet, Unbiological Sister Bracelets Birthstone Jewelry Birthday Gift Friendship Bracelet for Women	Custom Birthstone Bracelet, Initial Bracelet, Unbiological Sister Bracelets Birthstone Jewelry Birthday Gift Friendship Bracelet for Women\r\nKeep your special dates in a unique, elegant and minimalist disc bracelet, embrace your siblings love with this perfect gift. It comes with a high quality plated diamond cut chain, which will shine	\N
2	2	0	54644	0	0	0	\N	\N	\N	\N	0	500	600	1	677b99f4081761736153588.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Personalized Baby Name Puzzle with Pegs, First Christmas Gift, Wooden Montessori Toys for Toddler	Looking for Personalized Baby Name Puzzle with Pegs, First Christmas Gift idea or any other day of the year? Here it's - the pastel name puzzle is a simple and nice toy for kids that helps them develop motor skills, starting to speak and compose their first own words with their parents.	\N
8	8	0	0	0	0	0	0	0	0	0	0	0	0	1		\N	\N	\N	0	\N		\N				\N
9	9	0	10	0	0	0	0	0	0	0	0	100	100	1	677bb3eb488771736160235.png	\N	\N	\N	0	\N		\N		Some Short DEscription	Some Long DEscription	\N
13	13	0	6	0	0	0	\N	\N	\N	\N	0	300	300	1	677ce6dc9bad41736238812.jpg,677ce6dc9bf421736238812.jpg	\N	\N	\N	0	\N	\N	\N	\N	Modern, city-inspired clothing for a trendy, on-the-go lifestyle.	Designed for the modern city dweller, the Urban Weave collection blends contemporary designs with comfort and practicality. From sharp jackets to casual tees, these pieces are perfect for navigating the fast-paced urban lifestyle with style.	\N
11	11	0	10	0	0	0	\N	\N	\N	\N	0	250	250	1	677e7ce3a715f1736342755.jpg,677e7ce3a72171736342755.jpg,677e7ce3a72c31736342755.jpg,677e7ce3a739b1736342755.jpg	\N	\N	\N	0	\N	\N	\N	000000000	A timeless line of garments that never go out of style.	Classic Stitch Collection\r\nTimeless elegance in every thread. The Classic Stitch Collection features versatile, wardrobe-staple pieces designed to last. From tailored blazers to sleek trousers, these items are perfect for those who appreciate enduring style and quality craftsmanship.	\N
10	10	0	10	0	0	0	0	0	0	0	0	100	100	1	677bc12405c2a1736163620.png,,,,	\N	\N	\N	0	\N		\N		Test Short Description 1	Test Long Description 1	\N
7	8	0	6	0	0	0	0	0	0	0	0	119	120	1	677b9a98e2d631736153752.jpg,,	\N	\N	\N	0	\N		\N		Soft, comfortable, yet high-quality cotton-based clothing.	Experience the ultimate in comfort with the Cotton Luxe collection. Soft, breathable cotton meets luxurious designs in this line, providing the perfect balance of relaxed style and high-end quality.	\N
19	19	0	7	0	0	0	\N	\N	\N	\N	0	8000	8000	1	6786bad93d61d1736882905.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Opal & Oak combines nature-inspired designs with elegant craftsmanship.	Opal & Oak combines nature-inspired designs with elegant craftsmanship. The brand offers décor that incorporates natural materials like wood and stone, creating a harmonious and earthy aesthetic that elevates any home.	\N
15	15	0	1	0	0	0	\N	\N	\N	\N	0	330	330	1	6786b922db0a81736882466.jpg,6786b922db5d01736882466.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty.	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty. The word "Gleaming" suggests a radiant, shining quality, symbolizing the brilliance of fine jewelry. "Grace" adds an element of elegance and timeless appeal, evoking the delicate craftsmanship and refined designs that the brand offers.	\N
18	18	0	3	0	0	0	\N	\N	\N	\N	0	1200	2000	1	6786bb7c5d9f01736883068.jpg,6786bb7c5dff91736883068.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Vivid Interiors\r\nVivid Interiors is a décor brand that brings vibrant and colorful designs to life.	Vivid Interiors\r\nVivid Interiors is a décor brand that brings vibrant and colorful designs to life. Whether you're looking for bold statement pieces or subtle accents, Vivid Interiors ensures that every corner of your home radiates with energy and style.	\N
17	17	0	3	0	0	0	\N	\N	\N	\N	0	4000	4000	1	6786bbd90afe51736883161.jpg,6786bbf9037a81736883193.jpg,6786bbf903db81736883193.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Vivid Interiors\r\nVivid Interiors is a décor brand that brings vibrant and colorful designs to life.	Vivid Interiors\r\nVivid Interiors is a décor brand that brings vibrant and colorful designs to life. Whether you're looking for bold statement pieces or subtle accents, Vivid Interiors ensures that every corner of your home radiates with energy and style.	\N
20	20	0	4	0	0	0	\N	\N	\N	\N	0	7000	8000	1	6786bb1dd59da1736882973.jpg,6786bb1dd605b1736882973.jpg,6786bcfe377881736883454.jpg,6786bcfe37a701736883454.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Modern Nest\r\nModern Nest specializes in sleek, contemporary décor pieces that blend functionality and style.	Modern Nest\r\nModern Nest specializes in sleek, contemporary décor pieces that blend functionality and style. With an eye for cutting-edge trends, Modern Nest is perfect for those looking to create a fresh, stylish atmosphere in their homes.	\N
16	16	0	8	0	0	0	\N	\N	\N	\N	0	400	400	1	6786b8fdaaba11736882429.jpg,6786b8fdaaf941736882429.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty.	This name would be perfect for a jewelry vendor focused on high-quality, exquisite pieces that emphasize both beauty and grace. It suggests a brand that appeals to those who appreciate both luxury and understated elegance, making it a great fit for products such as diamond jewelry, fine gemstones, or elegant gold pieces.	\N
27	26	0	20	0	0	0	\N	\N	\N	\N	0	500	500	1	6786b84fb91681736882255.jpg,6786b84fb97621736882255.jpg	\N	\N	\N	0	\N	\N	\N	000000000	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N
25	24	0	40	0	0	0	\N	\N	\N	\N	0	400	400	1	677e2591abaf11736320401.jpg,677e7a90beef71736342160.jpg,677e7a90bf0b41736342160.jpeg,677e7a9f5cf011736342175.jpg	\N	\N	\N	0	\N	\N	\N	000000000	This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.	This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.	\N
26	25	0	45	0	0	0	\N	\N	\N	\N	0	450	450	1	6786b8b3ba8a71736882355.jpg	\N	\N	\N	0	\N	\N	\N	000000000	This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.	This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.	\N
24	23	0	35	0	0	0	\N	\N	\N	\N	0	350	350	1	677e25108142d1736320272.jpg,677e7b48c8e5f1736342344.jpg,677e7b48c90091736342344.jpg,677e7b48c92491736342344.jpg,677e7b48c92f51736342344.jpg	\N	\N	\N	0	\N	\N	\N	000000000	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N
22	21	0	9	0	0	0	0	0	0	0	0	90	90	1	677cf41e1e6b71736242206.jpg,677cf41e1e7701736242206.jpg,677cf41e1e80f1736242206.jpg,,,,,,,,,,,,,,,	\N	\N	\N	0	\N		\N		Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty. The word "Gleaming" suggests a radiant, shining quality, symbolizing the brilliance of fine jewelry.	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty. The word "Gleaming" suggests a radiant, shining quality, symbolizing the brilliance of fine jewelry. "Grace" adds an element of elegance and timeless appeal, evoking the delicate craftsmanship and refined designs that the brand offers.\r\n\r\nThis name would be perfect for a jewelry vendor focused on high-quality, exquisite pieces that emphasize both beauty and grace. It suggests a brand that appeals to those who appreciate both luxury and understated elegance, making it a great fit for products such as diamond jewelry, fine gemstones, or elegant gold pieces.	\N
23	22	0	25	0	0	0	0	0	0	0	0	250	250	1	677e22a6763191736319654.jpg,677e22a6763dc1736319654.jpg,677e7b90ae4ec1736342416.jpg,677e7b90ae64e1736342416.jpg,677e7b90ae70d1736342416.jpg	\N	\N	\N	0	\N		\N		This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N
31	30	0	15	0	0	0	\N	\N	\N	\N	0	250	250	1	6786b742955981736881986.jpg	\N	\N	\N	0	\N	\N	\N	000000000	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N
30	29	0	15	0	0	0	\N	\N	\N	\N	0	250	250	1	6786b78eb2eb41736882062.jpg	\N	\N	\N	0	\N	\N	\N	000000000	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N
29	28	0	15	0	0	0	\N	\N	\N	\N	0	250	250	1	6786b7e56f2841736882149.jpg	\N	\N	\N	0	\N	\N	\N	000000000	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N	\N
28	27	0	20	0	0	0	\N	\N	\N	\N	0	500	500	1	6786b8054e6421736882181.jpg	\N	\N	\N	0	\N	\N	\N	000000000	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	By registering, you agree to pay in full to secure your spot. The workshop covers painting and drawing techniques, and materials are provided (you may bring your own). Cancellations made 48 hours in advance receive a full refund; 50% refund is given for cancellations within 24-48 hours. No refunds for cancellations within 24 hours or no-shows. Participants must follow all safety guidelines and are responsible for their belongings. Photos and videos may be taken for promotional purposes. Disruptive behavior will result in removal without refund. Organizers are not liable for personal injury or property damage.	\N
34	33	0	25	0	0	0	\N	\N	\N	\N	0	250	250	1	6786b4a22cdd21736881314.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Everyday essentials: A quality wallet, a stylish watch, or a comfortable backpack. Self-care: Grooming products, gym membership, or a subscription box.	Practical Gifts: Everyday essentials: A quality wallet, a stylish watch, or a comfortable backpack. Self-care: Grooming products, gym membership, or a subscription box. The most important thing is to choose a gift that comes from the heart and shows him how much you care.	\N
21	21	0	2	0	0	0	0	0	0	0	0	85	85	1	6786b8dd25bf81736882397.jpg,6786b8dd263fe1736882397.jpg	\N	\N	\N	0	\N		\N		Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty. The word "Gleaming" suggests a radiant, shining quality, symbolizing the brilliance of fine jewelry.	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty. The word "Gleaming" suggests a radiant, shining quality, symbolizing the brilliance of fine jewelry. "Grace" adds an element of elegance and timeless appeal, evoking the delicate craftsmanship and refined designs that the brand offers.\r\n\r\nThis name would be perfect for a jewelry vendor focused on high-quality, exquisite pieces that emphasize both beauty and grace. It suggests a brand that appeals to those who appreciate both luxury and understated elegance, making it a great fit for products such as diamond jewelry, fine gemstones, or elegant gold pieces.	\N
32	31	0	15	0	0	0	\N	\N	\N	\N	0	150	150	1	6786b4bf63e201736881343.jpg	\N	\N	\N	0	\N	\N	\N	000000000	The best housewarming gifts last longer than your visits\r\nBetter sound, cleaner air or smarter lighting. Nothing says welcome home like new home electronics. And with these practical housewarming gifts, you can help them find new ways to make the most of their life at home – every day.	The best housewarming gifts last longer than your visits\r\nBetter sound, cleaner air or smarter lighting. Nothing says welcome home like new home electronics. And with these practical housewarming gifts, you can help them find new ways to make the most of their life at home – every day.	\N
35	34	0	10	0	0	0	\N	\N	\N	\N	0	300	300	1	67863001c24151736847361.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine.	Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Check out the Best Collections of Valentine’s day Gifts all across UAE and Surprise your Valentine with joy and romance. Take a look into Personalized cakes, Heart shaped caked, red velvet strawberry cakes, flowers, and sweets. Happy Valentines day! with loads of Love from GDO.	\N
33	32	0	25	0	0	0	\N	\N	\N	\N	0	250	250	1	6786b5329f38c1736881458.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Little Bundles has the cutest personalised gifts for newborn baby boys & baby girls in UAE.	Little Bundles has the cutest personalised gifts for newborn baby boys & baby girls in UAE. There are adorable options from Sophie La Giraffe, Citron and our own Mamas & Papas range to choose from.	\N
\.


--
-- Data for Name: product_selected_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_selected_attributes (product_selected_attributes_id, attribute_id, attribute_values_id, product_id) FROM stdin;
1	2	1	8
2	2	2	8
3	1	3	9
4	2	2	10
5	2	1	21
6	2	2	21
7	2	1	22
\.


--
-- Data for Name: product_specifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_specifications (prod_spec_id, product_id, spec_title, spec_descp, lang, spec_title_arabic, spec_descp_arabic) FROM stdin;
91	31	\N	\N	1	\N	\N
92	29	\N	\N	1	\N	\N
93	29	\N	\N	1	\N	\N
12	9	\N	\N	1	\N	\N
14	7	\N	\N	1	\N	\N
15	7	\N	\N	1	\N	\N
18	8	\N	\N	1	\N	\N
98	26	\N	\N	1	\N	\N
99	26	\N	\N	1	\N	\N
100	21	\N	\N	1	\N	\N
101	21	\N	\N	1	\N	\N
104	19	\N	\N	1	\N	\N
105	19	\N	\N	1	\N	\N
107	18	\N	\N	1	\N	\N
108	18	\N	\N	1	\N	\N
111	17	\N	\N	1	\N	\N
112	17	\N	\N	1	\N	\N
113	20	\N	\N	1	\N	\N
48	22	\N	\N	1	\N	\N
49	22	\N	\N	1	\N	\N
56	11	\N	\N	1	\N	\N
57	11	\N	\N	1	\N	\N
67	24	\N	\N	1	\N	\N
68	24	\N	\N	1	\N	\N
74	1	\N	\N	1	\N	\N
75	23	\N	\N	1	\N	\N
76	23	\N	\N	1	\N	\N
\.


--
-- Data for Name: product_temp_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_temp_image (id, product_id, product_attribute_id, image, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product_variations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variations (product_variations_id, attribute_id, attribute_values_id, product_attribute_id, product_id) FROM stdin;
1	2	1	7	8
2	2	2	8	8
3	1	3	9	9
4	2	2	10	10
5	2	1	21	21
6	2	2	22	21
7	2	1	23	22
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, product_type, name, active, deleted, created_by, updated_by, company_id, store_id, description, featured, meta_title, meta_description, meta_keywords, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: promotion_banners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotion_banners (id, title, image_name, status, created_at, updated_at, url, type, product, service, banner_type, activity, store, category) FROM stdin;
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings (id, type, user_id, product_id, product_varient_id, service_id, vendor_id, rating, title, comment, created_at, updated_at, order_id) FROM stdin;
1	1	15	4	4	0	0	5	Quality	test	2025-01-13 17:45:06	2025-01-13 17:45:06	12
2	1	15	4	4	0	0	4	Delivery	test	2025-01-13 17:45:06	2025-01-13 17:45:06	12
3	1	15	4	4	0	0	5	Overl All	test	2025-01-13 17:45:06	2025-01-13 17:45:06	12
4	1	9	20	20	0	0	2.5	Quality	test	2025-01-14 10:31:37	2025-01-14 10:31:37	13
5	1	9	20	20	0	0	2.5	Delivery	test	2025-01-14 10:31:37	2025-01-14 10:31:37	13
6	1	9	20	20	0	0	2.5	Overl All	test	2025-01-14 10:31:37	2025-01-14 10:31:37	13
7	1	9	15	15	0	0	3	Quality	test review.	2025-01-14 12:33:37	2025-01-14 12:33:37	20
8	1	9	15	15	0	0	3	Delivery	test review.	2025-01-14 12:33:37	2025-01-14 12:33:37	20
9	1	9	15	15	0	0	3	Overl All	test review.	2025-01-14 12:33:37	2025-01-14 12:33:37	20
10	3	9	0	0	14	0	2	Quality	test workshop	2025-01-14 17:30:06	2025-01-14 17:30:06	17
11	3	9	0	0	14	0	3	Delivery	test workshop	2025-01-14 17:30:06	2025-01-14 17:30:06	17
12	3	9	0	0	14	0	2.5	Overl All	test workshop	2025-01-14 17:30:06	2025-01-14 17:30:06	17
13	2	9	0	0	0	17	3	Quality	test	2025-01-14 18:27:58	2025-01-14 18:27:58	20
14	2	9	0	0	0	17	2	Delivery	test	2025-01-14 18:27:58	2025-01-14 18:27:58	20
15	2	9	0	0	0	17	2.5	Overl All	test	2025-01-14 18:27:58	2025-01-14 18:27:58	20
16	2	9	0	0	0	18	2.5	Quality	tedtshjs	2025-01-14 18:35:19	2025-01-14 18:35:19	20
17	2	9	0	0	0	18	2.5	Delivery	tedtshjs	2025-01-14 18:35:19	2025-01-14 18:35:19	20
18	2	9	0	0	0	18	2.5	Overl All	tedtshjs	2025-01-14 18:35:19	2025-01-14 18:35:19	20
19	3	9	0	0	15	0	4	Quality	test	2025-01-14 19:09:05	2025-01-14 19:09:05	18
20	3	9	0	0	15	0	2	Delivery	test	2025-01-14 19:09:05	2025-01-14 19:09:05	18
21	3	9	0	0	15	0	3	Overl All	test	2025-01-14 19:09:05	2025-01-14 19:09:05	18
22	2	9	0	0	0	16	2	Quality	tedt store	2025-01-14 19:09:30	2025-01-14 19:09:30	18
23	2	9	0	0	0	16	3	Delivery	tedt store	2025-01-14 19:09:30	2025-01-14 19:09:30	18
24	2	9	0	0	0	16	2.5	Overl All	tedt store	2025-01-14 19:09:30	2025-01-14 19:09:30	18
\.


--
-- Data for Name: ratings_reply; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings_reply (id, rating_id, message, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ref_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_history (id, sender_id, accepted_user_id, name, ref_code, status, discount, discount_type, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service (id, name, image, service_price, active, deleted, "order", description, created_at, updated_at, included, service_user_id, building_type, service_type, contract_type, duration, building_type_id, "time", document, order_count, service_price_type, activity_id, price_label, sort_order, from_date, to_date, seats, term_and_condition, work_shop_details, to_time, from_time, location, latitude, longitude, vendor_id, feature_image) FROM stdin;
1	Next	1736238076677ce3fc84db2.JPG	200	0	1	0	give	2025-01-07 08:21:16	2025-01-08 06:31:40	\N	\N	\N	\N	\N	300	\N	\N	\N	0	\N	0	200	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	Next	1736332428677e548ca2834.jpg	20	1	0	0	\N	2025-01-08 10:33:48	2025-01-13 02:30:33	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-09	2025-01-09	20	Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions Term And Conditions	\N	22:22	11:01	3MQ3+R22, Makhdum Rashid, Multan, Punjab, Pakistan	30.0895212	71.65250259999999	\N	173673543367847ac96194b.jpg
9	Test 2	1736288436677da8b4de5d1.png	100	1	0	0	\N	2025-01-07 22:20:36	2025-01-13 02:30:48	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-07	2025-02-20	15	Test	\N	15:20	15:19	673C+W8J - سابقا - Dubai - United Arab Emirates	25.204624852707955	55.27080225396727	\N	173673544867847ad852b14.jpg
8	Test 1	1736288286677da81eb6eb0.png	80	1	0	0	\N	2025-01-07 22:18:06	2025-01-13 02:31:07	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-07	2025-01-31	12	Test Terms	\N	15:17	15:17	سابقا - 673C+W8J - Dubai - United Arab Emirates	25.204819000000008	55.27075933862303	\N	173673546767847aeb13ce6.jpg
7	Tesla1	1736287391677da49f65395.jpg	60	1	0	0	\N	2025-01-07 22:03:11	2025-01-13 02:31:24	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-30	2025-02-01	20	given	\N	06:06	11:22	Mulberry 2 building B1 - دبي - United Arab Emirates	25.1093069	55.2487733	\N	173673548467847afc34758.jpg
6	Egypt	1736287067677da35b2833a.jpg	20	1	0	0	\N	2025-01-07 21:57:47	2025-01-13 02:31:40	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-09	2025-01-09	20	AVailable AVailableAVailable AVailableAVailable AVailableAVailable AVailableAVailable AVailableAVailable AVailable	\N	22:02	11:33	465W+8R4 - Dubai - United Arab Emirates	25.1084406	55.2469174	\N	173673550067847b0c73a8d.jpg
5	Vendor Event	1736285259677d9c4b18414.jpg	12	1	0	0	\N	2025-01-07 21:27:39	2025-01-13 02:31:55	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-09	2025-01-16	20	Here are our conditions	\N	\N	\N	2HRR+VG2 - Dubai - United Arab Emirates	25.0421408	55.5912693	\N	173673551567847b1bb3dcd.jpg
3	Next2	1736245273677d00196a04a.JPG	200	0	1	0	Term And ConditionsTerm And ConditionsTerm And ConditionsTerm And Conditions	2025-01-07 10:21:13	2025-01-13 02:32:05	\N	\N	\N	\N	\N	300	\N	\N	\N	0	\N	0	\N	0	2025-01-08	2025-01-10	20	Term And ConditionsTerm And ConditionsTerm And ConditionsTerm And Conditions Term And ConditionsTerm And ConditionsTerm And ConditionsTerm And Conditions	Term And ConditionsTerm And ConditionsTerm And ConditionsTerm And Conditions	\N	\N	\N	\N	\N	\N	\N
2	Pottery Worskhop	1736247725677d09ad197f7.png	100	1	0	0	\N	2025-01-07 08:52:58	2025-01-13 02:32:39	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	\N	\N	15	\N	\N	\N	\N	Dubai International Airport (DXB) - Dubai - United Arab Emirates	25.2566932	55.36431779999999	\N	173673555967847b47423f9.jpg
11	Drawing & Painting	173686333267866e641e84e.jpg	500	1	0	0	\N	2025-01-08 14:22:29	2025-01-14 14:02:12	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-08	2025-03-30	20	By registering, you agree to pay in full to secure your spot. The workshop covers painting and drawing techniques, and materials are provided (you may bring your own). Cancellations made 48 hours in advance receive a full refund; 50% refund is given for cancellations within 24-48 hours. No refunds for cancellations within 24 hours or no-shows. Participants must follow all safety guidelines and are responsible for their belongings. Photos and videos may be taken for promotional purposes. Disruptive behavior will result in removal without refund. Organizers are not liable for personal injury or property damage.	\N	19:22	18:21	7 27th St - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates	25.201168979102967	55.241662735229475	\N	173673541867847abac8071.jpg
15	Offline Contest	17368760906786a03a1c5f2.JPG	30	1	0	0	\N	2025-01-14 17:34:50	2025-01-14 17:34:50	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-22	2025-01-30	30	Applied	\N	04:44	11:22	14 39b St - Za'abeel - Za'abeel 2 - Dubai - United Arab Emirates	25.202100909735144	55.28869795251463	16	17368760906786a03a1db22.jpg
14	Test 4	1736364533677ed1f577142.png	45	1	0	0	\N	2025-01-08 19:28:53	2025-01-13 02:29:33	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-08	2025-01-16	12	\N	\N	12:27	12:27	673C+W8J - سابقا - Dubai - United Arab Emirates	25.204751048482994	55.27058767724608	\N	173673537367847a8d391c6.jpg
13	Test 3	1736364277677ed0f5e050f.png	80	1	0	0	\N	2025-01-08 19:24:37	2025-01-13 02:29:47	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-08	2025-02-27	14	Test	\N	12:22	12:22	673C+P8 - Dubai - United Arab Emirates	25.204314216396668	55.2705018465576	\N	173673538767847a9bcc66b.jpg
12	Card Workshop	1736346303677e8abf586df.jpg	300	1	0	0	\N	2025-01-08 14:25:03	2025-01-13 02:30:03	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-08	2025-03-30	20	By registering, you agree to pay in full to secure your spot. The workshop covers painting and drawing techniques, and materials are provided (you may bring your own). Cancellations made 48 hours in advance receive a full refund; 50% refund is given for cancellations within 24-48 hours. No refunds for cancellations within 24 hours or no-shows. Participants must follow all safety guidelines and are responsible for their belongings. Photos and videos may be taken for promotional purposes. Disruptive behavior will result in removal without refund. Organizers are not liable for personal injury or property damage.	\N	18:23	18:23	Level 14, Boulevard Plaza Tower 1 - Sheikh Mohammed bin Rashid Blvd - Downtown Dubai - Burj Residence Phase I & II - Dubai - United Arab Emirates	25.193402613114053	55.2730767672119	\N	173673540367847aab745be.jpg
\.


--
-- Data for Name: service_assigned_vendors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_assigned_vendors (id, vendor_user_id, order_id, service_status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: service_bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_bookings (id, service_id, user_id, vendor_id, seat_no, status, payment_type, price, service_charge, "Workshop_price", tax, grand_total, ref_id, created_at, updated_at, number_of_seats, order_number) FROM stdin;
1	14	15	18	\N	pending	1	45	0	45	2.25	47.25	14	2025-01-11 11:43:09	2025-01-11 11:43:09	\N	\N
2	14	15	18	11	pending	1	45	0	45	2.25	47.25	14	2025-01-11 11:45:51	2025-01-11 11:45:51	\N	\N
3	14	15	18	11	1	1	45	0	45	2.25	47.25	14	2025-01-11 11:50:02	2025-01-11 11:58:44	\N	\N
4	14	15	18	12	1	1	45	0	45	2.25	47.25	14	2025-01-11 12:00:50	2025-01-11 12:01:16	\N	\N
5	14	13	18	20	1	1	45	0	45	2.25	47.25	14	2025-01-11 14:05:19	2025-01-11 14:13:42	\N	\N
6	14	13	18	13	1	1	45	0	45	2.25	47.25	14	2025-01-11 14:28:32	2025-01-11 15:07:56	\N	\N
7	14	15	18	6,7	1	1	45	0	90	9	198	14	2025-01-11 16:15:29	2025-01-11 16:15:50	\N	\N
8	14	15	18	2,3	1	1	45	0	90	9	198	14	2025-01-11 16:21:52	2025-01-11 16:22:20	2	\N
9	14	15	18	7,8	1	1	90	0	45	9	99	14	2025-01-11 16:25:37	2025-01-11 16:25:50	2	\N
10	13	15	\N	7,8	1	1	80	0	160	16	176	13	2025-01-11 16:27:48	2025-01-11 16:28:08	2	\N
11	14	15	18	1	pending	1	45	0	45	2.25	47.25	14	2025-01-11 20:43:25	2025-01-11 20:43:25	1	\N
12	14	9	18	4,5	1	1	90	0	45	9	99	14	2025-01-11 20:54:46	2025-01-11 20:55:21	2	\N
13	12	9	\N	3,9,17,5	1	1	1200	0	300	240	1440	12	2025-01-11 23:00:37	2025-01-11 23:01:00	4	\N
14	6	9	\N	4,3	1	1	40	0	20	4	44	6	2025-01-13 08:36:33	2025-01-13 08:36:58	2	6784d09173eb9
15	12	15	\N	2,8	1	1	600	0	300	60	660	12	2025-01-13 10:03:47	2025-01-13 10:04:15	2	6784e5036c681
16	11	15	\N	16,17,18	1	1	1500	0	500	225	1725	11	2025-01-13 12:02:31	2025-01-13 12:02:50	3	678500d7e5b78
17	14	9	\N	9	1	1	45	0	45	2.25	47.25	14	2025-01-14 16:33:17	2025-01-14 16:33:33	1	678691cd32c31
18	15	9	16	1	1	1	30	0	30	1.5	31.5	15	2025-01-14 18:37:07	2025-01-14 18:37:23	1	6786aed38c3e3
\.


--
-- Data for Name: service_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_category (id, name, image, banner_image, parent_id, active, deleted, "order", description, created_at, updated_at, activity_id, sort_order) FROM stdin;
1	Event Category	1736237862677ce3267e26c.jpg	1736237862677ce3267fc4c.JPG	0	1	0	0	done	2025-01-07 08:17:42	2025-01-07 08:17:42	6	0
\.


--
-- Data for Name: service_category_selected; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_category_selected (id, service_id, category_id) FROM stdin;
1	1	1
2	2	1
\.


--
-- Data for Name: service_event_feature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_event_feature (id, service_id, event_feature_id, created_at, updated_at, feature_title) FROM stdin;
16	14	1	2025-01-13 02:29:33	2025-01-13 02:29:33	English
17	13	1	2025-01-13 02:29:47	2025-01-13 02:29:47	Dubai
18	12	1	2025-01-13 02:30:03	2025-01-13 02:30:03	Wedding card, Birthday card
19	9	1	2025-01-13 02:30:48	2025-01-13 02:30:48	\N
20	8	1	2025-01-13 02:31:07	2025-01-13 02:31:07	\N
21	7	1	2025-01-13 02:31:24	2025-01-13 02:31:24	\N
22	6	1	2025-01-13 02:31:40	2025-01-13 02:31:40	\N
23	5	1	2025-01-13 02:31:55	2025-01-13 02:31:55	\N
24	15	1	2025-01-14 17:34:50	2025-01-14 17:34:50	Washs
\.


--
-- Data for Name: service_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_images (id, service_id, image, created_at, updated_at) FROM stdin;
1	15	17368760906786a03a1f31f.jpg	2025-01-14 17:34:50	2025-01-14 17:34:50
\.


--
-- Data for Name: service_include; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_include (id, service_id, title, description, icon, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: service_order_status_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_order_status_history (id, order_id, order_item_id, status_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: service_timings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_timings (id, vendor_id, has_24_hour, service_id, day, time_from, time_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: service_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_type (id, name, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: service_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_types (id, name, status, deleted, sort_order, created_at, updated_at) FROM stdin;
1	Sa	1	0	0	2025-01-01 17:53:23	2025-01-01 17:53:23
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, admin_commission, shipping_charge, created_at, updated_at, tax_percentage, store_radius, service_radius, service_charge) FROM stdin;
1	0	0	\N	\N	5	0	0	0
\.


--
-- Data for Name: skin_colors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skin_colors (id, name, color, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.states (id, name, active, country_id, created_uid, updated_uid, deleted, created_at, updated_at) FROM stdin;
1	UAE	1	\N	\N	\N	0	\N	\N
\.


--
-- Data for Name: store_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_images (id, image, store_id) FROM stdin;
\.


--
-- Data for Name: store_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_likes (id, store_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: store_managers_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_managers_types (id, name, created_at, updated_at, vendor_id) FROM stdin;
\.


--
-- Data for Name: store_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_type (id, name, banner_image, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stores (id, vendor_id, industry_type, store_name, business_email, dial_code, mobile, description, location, latitude, longitude, address_line1, address_line2, country_id, state_id, city_id, zip, logo, cover_image, license_number, license_doc, vat_cert_number, vat_cert_doc, active, verified, deleted, created_uid, updated_uid, created_at, updated_at, commission, tax_number, tax_street, tax_address_line_2, tax_city, tax_state, tax_post_code, tax_phone, bank_country, tax_seller_type, residence_country, dob_day, dob_month, dob_year, shop_currency, shop_language, first_name, last_name) FROM stdin;
1	22	0	Anilcompany	anz1@anz1.com	\N	\N	dgdgdf hfhfh dfhdf	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/hzTfNAZ5KaPgKteAkkWQ8B7R582SQlOVDhM3UwfZ.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-07 14:28:51	2025-01-07 14:28:51	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	23	0	Stephanie56sdfdfdgdf	admin@adasdmin.com	\N	\N	Autem fugiat soluta	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/VTw0Iz98CZ8xVFNVbKbLXhfxl3elahTezKeh1nr9.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-07 16:02:37	2025-01-07 16:02:37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	24	0	Kirk	bilokece@mailinator.com	\N	\N	Asperiores aut repel	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/CLSpl46hraCvCFDcDLFTpVDDuUSwyTMiqGWparqC.jpg	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-07 17:56:58	2025-01-07 17:56:58	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	25	0	Almanara	anz2@anz1.com	\N	\N	The Dubai Municipality guides Dubai's urban growth with a focus on innovation and sustainability, handling urban planning, waste management, public health	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/iPRZjcluku4TnIlQ7g65x4Eehw51p2mWb3awsfOC.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-07 18:12:25	2025-01-07 18:12:25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	26	0	Sage	vahufad@mailinator.com	\N	\N	Suscipit veniam cup	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/DRRIiapPPltv0IIkxx4hO0aLEGDXEYoQjhzKLDFz.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-08 04:20:21	2025-01-08 04:20:21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	28	0	Kato	kafefawu@mailinator.com	\N	\N	Voluptatem aut amet	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/ABTG5fB4t7TfkHNJDgjaByMwOoD0qSDURI3BHiTM.jpg	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-08 04:52:11	2025-01-08 04:52:11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	32	0	jhjk	anz3@anz1.com	\N	\N	hjjhhtetycjf kjggkg	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/HscZyQfqG3EUhPEwYEB1ACzKvh3di3ISPdAvbMmZ.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-08 08:09:32	2025-01-08 08:09:32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	34	0	Catherine	noripa@mailinator.com	\N	\N	Voluptas dolor archi	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/aQf6X3kXoa3Phb7bq3ZHqqwIKGPvrQfBFj3pj9CO.jpg	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-08 09:03:56	2025-01-08 09:03:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	37	0	sssss	is@sdg.com	\N	\N	Sasdaasddasda	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/dBkBGqkX09Z1WdNtg8EDeI8SbkBZzAFegS3BXNhc.jpg	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-08 10:40:55	2025-01-08 10:40:55	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	51	0	Elijah	favupapan@mailinator.com	\N	\N	Veniam aperiam opti	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/DEW2g2QNIpk1yBkn1uocw3D3dwqr4aX03D3AyprW.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-10 09:29:53	2025-01-10 09:29:53	\N	234234234234242	dasdadadasaas	asdasdadaasdasd	asdasdasdasa	adadasd	123123	231231313131123	1	2	1	16	8	1995	aed	English	asdasda	asdada
12	41	0	Rajah	rufoqih@mailinator.com	\N	\N	Amet voluptas ut do	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/rN750pe9SSfQZs7zfUCYZ4V4OZrHAZ5u5IChf1CY.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-08 16:24:37	2025-01-08 16:24:37	\N	111111111111111	Karly	Shelley	Sasha	William	111111	111111111111111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	42	0	Anne	liwuriryfy@mailinator.com	\N	\N	Ut consectetur exer	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/a9kqjMF3GDSMvoCicMdPgt2Tg6h119e9AJYQQ2km.jpg	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-08 16:32:13	2025-01-08 16:32:13	\N	111111111111111	Maxwell	Nasim	Castor	Madison	111111	111111111111111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	42	0	Anne	liwuriryfy@mailinator.com	\N	\N	Ut consectetur exer	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/ubzCqbzbYXcpuklgHinXNzh7dZ39pK1RcruA9v9v.jpg	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-08 16:32:30	2025-01-08 16:32:30	\N	111111111111111	Maxwell	Nasim	Castor	Madison	111111	111111111111111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	42	0	Anne	liwuriryfy@mailinator.com	\N	\N	Ut consectetur exer	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/uIZkVwPZhtAYSCM69COSCOw4LaTZgCcLyBFKO68p.jpg	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-08 16:38:05	2025-01-08 16:38:05	\N	111111111111111	Maxwell	Nasim	Castor	Madison	111111	111111111111111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	42	0	Anne	liwuriryfy@mailinator.com	\N	\N	Ut consectetur exer	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/4SRqABbZkNCAXGBCdz9tzRAHt5lKGzfJRORb3RTL.jpg	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-08 16:41:15	2025-01-08 16:41:15	\N	111111111111111	Maxwell	Nasim	Castor	Madison	111111	111111111111111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	42	0	Anne	liwuriryfy@mailinator.com	\N	\N	Ut consectetur exer	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/nbsFvhIM8Xe8IlEdmFZtbh5e6UOOmyx6eJRbunIL.jpg	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-08 16:43:01	2025-01-08 16:43:01	\N	111111111111111	Maxwell	Nasim	Castor	Madison	111111	111111111111111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	42	0	Anne	liwuriryfy@mailinator.com	\N	\N	Ut consectetur exer	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/tTeSvFsBoPCHa7XT5GZQ6h2i7AVUdh9sb9GycMc7.jpg	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-08 16:43:22	2025-01-08 16:43:22	\N	111111111111111	Maxwell	Nasim	Castor	Madison	111111	111111111111111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	45	0	dddee	sfsaf@f.com	\N	\N	zffsfasfafsasf	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/CWJpdaxlfHvBN6YoxYrPWpaUaKtsIWQGLb8XzGAE.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-09 15:02:08	2025-01-09 15:02:08	\N	666666666666666	t25235	35235	35352	wwwww	525253	4535352352353	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	50	0	Madeline	mozu@mailinator.com	\N	\N	Dolores vel voluptatDolores vel voluptatDolores vel voluptatDolores vel voluptatDolores vel voluptatDolores vel voluptatDolores vel voluptatDolores vel voluptatDolores vel voluptatDolores vel voluptatDolores vel voluptatDolores vel voluptatDolores vel voluptat	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/796rc2LFLT9q5jStMYtOBgblPc1fxg6NGHCnWpAw.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-10 09:12:23	2025-01-10 09:12:23	\N	312312312313123	dasdasdada	sdadadasad	adadasdadaadsad	adadasasads	123123	231231231231313	1	2	1	\N	\N	\N	aed	Arabic	asdad	adada
22	52	0	DXBAPPs	hibaejaz97@gmail.com	\N	\N	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/VFsvnSGUxZ7p5LyOXsZtpUpUz3RoxoyrvETZtomd.jpg	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-10 09:45:17	2025-01-10 09:45:17	\N	112233000000000	Slicon oasis	building 102	Dubai	Dubai	500001	056166013322222	1	2	1	30	12	1998	aed	English	Hiba	Ejaz
\.


--
-- Data for Name: subscribers_emails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscribers_emails (id, email, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: temp_order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_order_products (id, order_id, product_id, product_attribute_id, product_type, quantity, price, discount, total, vendor_id, admin_commission, vendor_commission, shipping_charge) FROM stdin;
11	10	8	7	2	1	119	0	119	4	119	0	0
12	10	5	5	1	2	250	0	500	4	500	0	0
16	14	15	15	1	2	330	0	660	17	330	330	0
20	17	17	17	1	1	4000	0	4000	18	2000	2000	0
28	21	20	20	1	1	7000	0	7000	18	3500	3500	0
29	22	13	13	1	2	300	0	600	16	360	240	0
30	23	21	21	2	6	85	0	510	17	255	255	0
31	24	18	18	1	1	8000	0	8000	18	4000	4000	0
50	33	17	17	1	1	4000	0	4000	18	2000	2000	0
51	33	34	35	1	3	300	0	900	5	900	0	0
53	35	17	17	1	1	4000	0	4000	18	2000	2000	0
54	36	15	15	1	1	330	0	330	17	165	165	0
55	36	20	20	1	2	7000	0	14000	18	7000	7000	0
\.


--
-- Data for Name: temp_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_orders (id, invoice_id, user_id, address_id, total, vat, discount, grand_total, payment_mode, admin_commission, vendor_commission, shipping_charge, temp_id, ref_history_id, ref_code, admin_commission_percentage, vendor_commission_percentage, order_type, pick_up_date, pick_up_time, service_charge) FROM stdin;
33	\N	15	11	4900	245	0	5145	2	0	5145	0	15678617d91898c1736841177	0		0	100	0			0
\.


--
-- Data for Name: temp_service_order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_service_order_items (id, order_id, service_id, price, discount, total, admin_commission, vendor_commission, booking_date, text, hourly_rate, task_description, doc, qty, vat) FROM stdin;
\.


--
-- Data for Name: temp_service_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_service_orders (id, invoice_id, user_id, address_id, total, vat, discount, grand_total, payment_mode, admin_commission, vendor_commission, temp_id, booking_date, coupon_id, ref_history_id, ref_code, user_latitude, user_longitude, service_charge, task_description, doc) FROM stdin;
\.


--
-- Data for Name: temp_user_account_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_user_account_types (id, temp_user_id, account_type_id, activity_type_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: temp_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_users (id, name, email, dial_code, phone, phone_verified, active, email_verified, password, email_verified_at, role, first_name, last_name, user_image, user_phone_otp, user_email_otp, user_device_token, user_device_type, user_access_token, firebase_user_key, device_cart_id, created_at, updated_at) FROM stdin;
9	hiba 	hibadxba@hotmail.com	971	561660133	0	1	1	$2y$10$YS4/FdXdGkoFlnIUxXK.OeBPNl0UaM8iMukcbDkI7LcJpPeSdOe86	2025-01-07 06:04:26	2	hiba	\N		1111	1111	fhdj8EbMROy8zpwUSqKOMp:APA91bHsqcne89vYhEvkRA6Pys0B6X36QbAZdLuiQeSXIdRp_2FSxWOKU9i7WfMBGb7WvG_ilE8A6PQYrXbXBdIhOQ5QKpkQPQk-PpGwon0guwVv-GztzLw	ANDROID	\N	\N	12d4d9f3ec83ed7c	2025-01-07 06:04:27	2025-01-07 06:04:27
1	Aamir .	aamir.dxbapps@gmail.com	92	302806688	0	1	1	$2y$10$KDc9BUiX1xEcFp3tQgDiZOD5Y.dFvnUUYT.ePm/QcJhxZIROHfBsO	2025-01-07 10:20:18	2	Aamir	.		1111	1111	1111	smap	\N	\N	cart_a	2024-11-30 05:18:29	2025-01-07 10:20:19
10	test dev	test@gmail.com	971	321654789	0	1	1	$2y$10$8Gyulfr/6PN1DsBZrc8NlO/GI6h9DEQsPukIHmSMbPf9nQOmO2Glu	2025-01-08 09:01:49	2	test	dev		1111	1111	cR0bfnAeSdyt0drSADtjDp:APA91bEx_HGUo4G4-njIw95ywCdiz1OTMFsKUqjubI5mjCn0jKHrNG5U4nJ0qE39PAjcgOj-Fywq4X1IQ6s0Zs30sYsiKiE8e3tRZA16SDVPMFVBTyJezFM	ANDROID	\N	\N	c948872a6eac9a75	2025-01-08 09:01:49	2025-01-08 09:01:49
11	test dev two	test2@gmail.com	971	3213698744	0	1	1	$2y$10$nq4fPOaEdxeJ3at79dYp4eL./VYaVj4L3iIdFl9xQUBb6/VUdSzau	2025-01-08 10:41:05	2	test	dev two		1111	1111	cR0bfnAeSdyt0drSADtjDp:APA91bEx_HGUo4G4-njIw95ywCdiz1OTMFsKUqjubI5mjCn0jKHrNG5U4nJ0qE39PAjcgOj-Fywq4X1IQ6s0Zs30sYsiKiE8e3tRZA16SDVPMFVBTyJezFM	ANDROID	\N	\N	c948872a6eac9a75	2025-01-08 10:07:48	2025-01-08 10:41:05
2	hunain dev 	hunain88@gmail.com	971	123456789	0	1	1	$2y$10$M9ms4LialUzuBX1uNTz/TONq9itxzPF4pRaV3zbRqZ9.HnFwMl.Ma	2024-11-30 11:31:52	2	hunain dev	\N		1111	1111	ad	ANDROID	\N	\N	c948872a6eac9a75	2024-11-30 11:00:33	2024-11-30 11:31:52
3	s login 	new_social1@gmail.com	92	3095555555	0	1	1	$2y$10$Ch0H1uVSxO/gNvhETynaDe8ePjT0Ws9EhOHU3rd5.ZEzPJPlNfxHq	2024-12-02 09:21:39	2	s login	\N	\N	1111	1111	1111	andriod	\N	\N	cart_a	2024-12-02 09:09:32	2024-12-02 09:21:39
4	s login 	new_social2@gmail.com	92	3095555556	0	1	1	$2y$10$c3u4EHtwPF.Cl2Y6NEDPE.GhKflO8vbJnoKYdmuuk89e34x0ZJ1Ea	2024-12-02 09:28:18	2	s login	\N	\N	1111	1111	1111	andriod	\N	\N	cart_a	2024-12-02 09:24:17	2024-12-02 09:28:18
5	Hunain Ahmad. 	hunainahmad12345@gmail.com	971	987654321	0	1	1	$2y$10$/6ei8XQDoioTvlFHIG4mg.YFEwuKZ96SK/wqDCyM4e9nbzkSHjqGy	2024-12-02 09:55:22	2	Hunain Ahmad.	\N	\N	1111	1111	ad	ANDROID	\N	\N	c948872a6eac9a75	2024-12-02 09:46:52	2024-12-02 09:55:22
6	ragadxb 	ragadxb@gmail.com	971	123456489	0	1	1	$2y$10$aOU7pv9521zJrGNvaAQfW.siDZjhjVq98L8rNKTK1NJ3L3Luf.Hly	2024-12-02 21:48:43	2	ragadxb	\N	\N	1111	1111	fs3DpSFkQteL0pWepAU7uA:APA91bHqw-5EDCZMcGO_f1wjG6lFKNQo3ra0dQTeu16XZuudLwgiA2dbzQTM5CUAM0xKtGnDI1h6uq81FqJcKnlWVK5A-g61FcTnouNjDh4fX-czNOlGrJs	ANDROID	\N	\N	e19e10ee2b97a91c	2024-12-02 21:48:30	2024-12-02 21:48:43
7	Asad 	asadnazir289@gmail.com	971	3441560349	0	1	1	$2y$10$IA2FaaEjOUO/denwhnSAC.3ffpfNakaYUUSj6DWsqHF72Wr0qgqnu	2025-01-06 22:22:05	2	Asad	\N		1111	1111	cr_Htg3pQdeU4WTjORg00M:APA91bGNQqtc9SniC8uUYcMPu6jkd-SLQDB05UZIqY8MXvfm-c95A3ale7rvIHxk-90S9V-18m_x5Rf2jXd-P6Ls6F_KOTdoWk_x2lHhcLskOGcjTYp5fuc	ANDROID	\N	\N	7812fe4f9424cf17	2025-01-06 22:21:57	2025-01-06 22:22:05
8	anilnavis 	anil@dxbusinessgroup.com	971	899566995	0	1	1	$2y$10$Gf6FAyl1oInlwx/l60Cl1.lxuuop0PR5pFI91ajE/1qTSqMjCk3Ka	2025-01-07 04:05:09	2	anilnavis	\N		1111	1111	eZ7T5pAoSmmS_Qn_LiEWer:APA91bHGtJQol32rWtFEWj2_ZbtYTGS77qXgJxPzOddDKFm7ha7gdmd-lzoU5aeal0eM-V0nR2Z3HUN7tA8t21hBAXevnCdOexT_hqoCp3S4TO0zcb-OSms	ANDROID	\N	\N	0012e1f9e605c504	2025-01-07 04:05:09	2025-01-07 04:05:09
\.


--
-- Data for Name: tesimonial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tesimonial (id, name, designation, comment, rating, user_image, deleted, active, created_at, updated_at) FROM stdin;
1	Kollision	Shetty Jamie	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.	3.5	1736323054testimonial-photo1.jpg	0	1	2025-01-08 07:57:34	2025-01-08 07:57:34
2	Sara Colinton	Pel	Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software PageMaker including versions readable content page.	1.5	1736323187testimonial-photo2.jpg	0	1	2025-01-08 07:59:47	2025-01-08 07:59:47
3	Hamlet Tuong	OPL	Scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic of remaining essentially 1960s.	5	1736323237testimonial-photo3.jpg	0	1	2025-01-08 08:00:37	2025-01-08 08:00:37
\.


--
-- Data for Name: transport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transport (id, title, description, url, image, active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_account_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_account_types (id, user_id, account_type_id, activity_type_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_address (id, user_id, full_name, dial_code, phone, address, country_id, state_id, city_id, address_type, status, is_default, created_at, updated_at, land_mark, building_name, latitude, longitude, location, area_id, apartment, street) FROM stdin;
1	9	Aamir .	92	3028066329	address n	1	0	1	Home	0	0	2024-12-20 11:31:48	2025-01-07 08:48:15	\N	B1	11	11	Calicut Airport	1	A1	S1
2	9	Aamir .	92	3028066329	address n	1	0	1	Home	0	0	2025-01-06 11:27:35	2025-01-07 08:48:15	Test Land	B1	25.1808127	55.3132194	Calicut Airport	1	A1	S1
4	9	Aamir New.	92	3028066329	address n	1	0	1	0	0	0	2025-01-06 17:00:09	2025-01-07 08:48:15	Test Land	B1	25.1809515	55.3149132	Calicut Airport	1	A1	S1
3	9	Aamir .	92	3028066329	address n	1	0	1	0	0	0	2025-01-06 16:00:17	2025-01-07 08:48:15	Test Land	B1	25.1809515	55.3149132	Calicut Airport	1	A1	S1
10	14	anilnavis	971	899566995	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	1	0	1	0	1	1	2025-01-07 08:21:18	2025-01-07 08:21:18	\N	tu14	25.184234531783282	55.26004895567894	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	1	\N	\N
5	9	hunain dev	971	123456789	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	1	0	1	0	0	0	2025-01-06 23:35:22	2025-01-07 08:48:15	\N	Apt 1	33.516418169502025	73.11079904437065	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	1	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,
6	9	hunain dev	971	123456789	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	1	0	1	0	0	0	2025-01-06 23:39:36	2025-01-07 08:48:15	\N	Apt1	33.516422921494396	73.11076920479536	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	1	\N	\N
8	9	hunain dev	971	123456789	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	1	0	1	0	0	0	2025-01-07 07:54:30	2025-01-07 08:48:15	\N	apt1	33.56680088238352	73.13682921230793	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	1	\N	\N
9	9	hunain dev	971	123456789	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	1	0	1	0	1	1	2025-01-07 08:01:26	2025-01-07 08:48:15	\N	apt1	33.566805910972626	73.13681814819574	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	1	\N	\N
7	15	hiba	971	561660133	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	1	0	1	0	1	0	2025-01-07 07:52:33	2025-01-07 12:04:40	\N	304	25.184269726894854	55.26005566120148	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	1	\N	\N
11	15	hiba	971	561660155	57P6+23F - Business Bay - Dubai - United Arab Emirates,	1	0	1	0	1	1	2025-01-07 12:04:36	2025-01-07 12:04:40	\N	812	25.185139589051296	55.25988031178713	57P6+23F - Business Bay - Dubai - United Arab Emirates,	1	\N	\N
12	13	Asad	971	3441560349	9FGG+WQ, Muzaffarabad,	1	0	1	0	1	1	2025-01-08 08:44:42	2025-01-08 08:44:42	\N	mzd	34.37904488161153	73.47675025463104	9FGG+WQ, Muzaffarabad,	1	\N	\N
13	55	Price Chase1	921	54534534545345	ghfghfghf	1	1	1	Home	1	0	2025-01-14 06:12:17	2025-01-14 08:00:48	\N	\N	\N	\N	\N			
14	55	gfdghfghfghfg	921	567657657657	dfghfghfghfhh	1	1	2	Home	1	1	2025-01-14 08:00:38	2025-01-14 08:00:48	\N	\N	\N	\N	\N			
\.


--
-- Data for Name: user_follows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_follows (id, user_id, follow_user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_privileges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_privileges (id, user_id, designation_id, privileges, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, dial_code, phone, phone_verified, password, email_verified_at, role, first_name, last_name, user_image, user_phone_otp, user_device_token, user_device_type, user_access_token, firebase_user_key, remember_token, created_at, updated_at, country_id, state_id, city_id, area, active, deleted, display_name, business_name, email_verified, user_email_otp, dob, vendor, store, previllege, about_me, verified, designation_id, is_private_profile, user_name, gender, website, wallet_amount, password_reset_code, password_reset_time, approve, user_permissions, password_reset_otp, is_social, activity_id, temp_dial_code, temp_mobile, minimum_order_amount, ref_code, is_dinein, is_delivery, designation_name, admin_viewed, delivery_charge, location, two_factor_auth) FROM stdin;
12	ragadxb 	ragadxb@gmail.com	971	123456489	1	$2y$10$aOU7pv9521zJrGNvaAQfW.siDZjhjVq98L8rNKTK1NJ3L3Luf.Hly	2024-12-02 21:48:49	2	ragadxb	\N	\N		fs3DpSFkQteL0pWepAU7uA:APA91bHqw-5EDCZMcGO_f1wjG6lFKNQo3ra0dQTeu16XZuudLwgiA2dbzQTM5CUAM0xKtGnDI1h6uq81FqJcKnlWVK5A-g61FcTnouNjDh4fX-czNOlGrJs	ANDROID	3253403a852385de02aa5ee5bd925693b9a95108b215220cc133b7ca559372cf	-OD8LEenh4QHGNFQdkI_	\N	2024-12-02 21:48:49	2024-12-02 21:48:50	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N	2024120212	0	0		0	0	\N	\N
15	hiba user	hibadxba@hotmail.com	971	561660133	1	$2y$10$ECC3eQMjTt79toCRsrO3rO2WHWkWjWFEdqzjZvQxSAt7HqmhDzqPu	2025-01-07 06:04:34	2	hiba	user	/uploads/company/677e11d258aa3_1736315346.png		dgID1HJcQwC7-JNiRlqUUy:APA91bEkZ_wGJMjHXNXXDUR5wTRhrHUIREywgWUb_do6cIqD_r4ZOfTDDoCdXRZ3qsehPeykYG3q2DnstBjx35PO3f4wyZ71WnXbKuxZ9VIc3Su8iOL2KEM	ANDROID	051f975f110003101cfbd96d9ef61b14b5ae267c1586e2cd7e7516467d1e04d2	-OFzMLtcP864xGDgKYO1	\N	2025-01-07 06:04:34	2025-01-15 05:15:07	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	100	\N	\N	0	\N	\N	0	\N			\N	2025010715	0	0		0	0	\N	\N
3	\N	test@yopmail.com_deleted_mail	971	555555555_deleted_mobile	0	$2y$10$BpeueI3YtidDFC0xMvef0e/QAYFzALbWPP/1G2CTojNChbwg.eVFK	\N	3	test	test	\N	\N	\N	\N	\N	\N	\N	2024-06-28 06:24:24	\N	1	0	1	0	0	1	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	7			\N		0	0		0	0	\N	\N
6	\N	m@m.com	\N	123455	0	$2y$10$PdomyeXOLOrlSh7Xb8c4wurVAHhY3TeZBM4iwgrtaz8IxfnoXFq3m	\N	1	Khalifa	Alian	\N	\N	\N	\N	\N	\N	\N	2024-07-04 15:04:04	\N	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0	manager	0	0	\N	\N
46	\N	hibaejaz97@gmail.com_deleted_mail	\N	_deleted_mobile	0	$2y$10$.pe4lzE4Lj440.J2.dihoe8SX26G61JgtAq2Uzz7mE2pNGfdDHlrq	\N	3	Hiba	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-09 15:14:47	2025-01-09 15:14:47	0	0	0	0	0	1	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		1	0	\N	\N
21	\N	nivuj@mailinator.com	\N	\N	0	$2y$10$uTxli3soF3UE6AG74jh6Du420PNGOdTDV02gZXmz2cPKOpOjvTidi	\N	3	Serina	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-07 14:06:20	2025-01-07 14:06:20	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
2	RUSVIN K	rusvinmerak@gmail.com	971	7034526952	1	$2y$10$yvUq0wjrEekXZoGO7K3KPOI02.VAxrNgQakGbD5BQB6HI3xFiadii	\N	2	RUSVIN	K	/uploads/company/667d446ad4466_1719485546.jpg	\N	1111	\N	63dc7012a98074adeddabf75dfcb10f93c3226b7999f6fe47cd91ff66261c9a5	-OEYPEBELYhVl2-wz_y0	\N	2024-06-27 10:48:19	2024-12-20 09:32:06	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	202412202	0	0		0	0	\N	\N
1	Admin	admin@admin.com	971	112233445566778899	0	$2y$10$4CKClSnfh0w959jNrsJyl.8/oowWbizHIg4FrOlXxfgtYYBU6Y6jK	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
14	anilnavis 	anil@dxbusinessgroup.com	971	899566995	1	$2y$10$Gf6FAyl1oInlwx/l60Cl1.lxuuop0PR5pFI91ajE/1qTSqMjCk3Ka	2025-01-07 04:05:16	2	anilnavis	\N	\N		eZ7T5pAoSmmS_Qn_LiEWer:APA91bHGtJQol32rWtFEWj2_ZbtYTGS77qXgJxPzOddDKFm7ha7gdmd-lzoU5aeal0eM-V0nR2Z3HUN7tA8t21hBAXevnCdOexT_hqoCp3S4TO0zcb-OSms	ANDROID	a5df0ffaafdaa09e728cd2d5c8794d77c6f666194315e5b0f5ec84ee38483c14	-OFyw2F-AGStHGYYeoAi	\N	2025-01-07 04:05:16	2025-01-07 04:05:17	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025010714	0	0		0	0	\N	\N
10	s login 	new_social1@gmail.com	92	3095555555	1	$2y$10$Ch0H1uVSxO/gNvhETynaDe8ePjT0Ws9EhOHU3rd5.ZEzPJPlNfxHq	2024-12-02 09:21:57	2	s login	\N	\N		1111	andriod	92b0eb24679ddc74d37b09ccc0fe9cecdd47ead372248048e12db12b8516b4f8	-OD5fIArJzZ9WkRHLkQV	\N	2024-12-02 09:21:57	2024-12-02 09:25:13	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N	2024120210	0	0		0	0	\N	\N
23	\N	admin@adasdmin.com	\N	\N	0	$2y$10$MYXxvxnN3DaVKHDrIlnpQuo1ULCYRtDiqSdQh0rra12RE/oVv59nC	\N	3	asdfsdf	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-07 15:59:19	2025-01-07 16:02:37	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		1	0	\N	\N
22	\N	anz1@anz1.com	\N	\N	0	$2y$10$gjN3VcAnQHy/3Bw6nBFjZuFI0zsak3BrlRnx11wEqe0JAnbhnubp6	\N	3	Anil	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-07 14:15:48	2025-01-07 14:15:48	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		1	0	\N	\N
18	\N	steve@gmail.com	971	561660166	0	$2y$10$uYwgr/WWSHi2b4LRcgV9JuzIwaDHnLG2GT82hYeuKN3X17mZ/dDVS	\N	3	Stive	Pie	\N	\N	\N	\N	\N	\N	\N	2025-01-07 08:57:01	2025-01-07 11:20:26	1	0	1	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	7			250		0	0		1	40	\N	\N
16	\N	tompay@gmail.com	971	5616601344	0	$2y$10$3b11EZExJkzica5es0f7ge72ZO5zmtijWpRCeurykRVMPqWAJ/LhG	\N	3	Tom	Pay	\N	\N	\N	\N	\N	\N	\N	2025-01-07 06:48:56	2025-01-07 06:53:17	1	0	2	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	7			200		0	0		1	50	\N	\N
5	\N	v2@mailinator.com	971	76666666565	0	$2y$10$MfA6hbpHAbNhN9gZ66t2juLLVeuB.1irp84jNEVbYEdoxYcAj8s5m	\N	3	Gift	Palace	\N	\N	\N	\N	\N	\N	\N	2024-07-02 04:35:46	2025-01-07 07:05:51	1	0	1	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	7			0		0	0		1	0	\N	\N
11	Hunain Ahmad. 	hunainahmad12345@gmail.com	971	987654321	1	$2y$10$/6ei8XQDoioTvlFHIG4mg.YFEwuKZ96SK/wqDCyM4e9nbzkSHjqGy	2024-12-02 09:56:40	2	Hunain Ahmad.	\N	\N			ANDROID	e1a3a1c6f366ca4a4b19f4e28315830b92c797a2315555f1703169d7cf5fd4b0	-OD5nEoNNKMnhqVzS5qR	\N	2024-12-02 09:56:40	2025-01-09 16:27:22	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N	2024120211	0	0		0	0	\N	\N
20	\N	wigeholy@mailinator.com	\N	\N	0	$2y$10$y5H3zMzFyyWzM839oCZ6ZOBfmxQxq5JyhLx3OhYJsfphIgRfbBJ/6	\N	3	Clare	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-07 14:05:12	2025-01-07 14:05:12	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
17	\N	david@gmail.com	971	561660155	0	$2y$10$iXZDqPPo2VwY0mPAOaRXf.mqkIkkb9iOJ6A051meq4mhNoZOJ5sf2	\N	3	David	Agarwal	\N	\N	\N	\N	\N	\N	\N	2025-01-07 08:48:08	2025-01-08 09:07:18	1	0	1	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	7			500		0	0		1	25	\N	\N
19	\N	anz@anz.com	\N	\N	0	$2y$10$2HmXwF4VdnHN8VWYeDVpGOkFjwtkRVkpsjM1FsDEhsm7aBqFiVH.i	\N	3	Anil	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-07 13:53:10	2025-01-07 13:53:10	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		1	0	\N	\N
4	\N	v1@mailinator.com	971	98765543212	0	$2y$10$QYVRbwZ2WiGwGf.p9GXYyuPXpDHfFenJMpLWhqi8toha/gSSaxlxu	\N	3	Gift	Hub	\N	\N	\N	\N	\N	\N	\N	2024-07-02 04:33:39	2025-01-07 23:29:50	1	0	1	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	7			0		0	0		1	0	\N	\N
51	\N	favupapan@mailinator.com	\N	\N	0	$2y$10$ATXJ.Li2W1xwVQpfAJmRxegyy1GUL7Uiw4nrNPVuPM8ARqYgdeDlG	\N	3	Stephen	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 09:27:35	2025-01-10 09:29:53	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	disabled
52	\N	hibaejaz97@gmail.com	\N	\N	0	$2y$10$6Q4YcqMY9yr3vLV1MQe4n.KJjI3vxGhMWbn8dtfOrhLj44k1q/OZu	\N	3	Hiba	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 09:31:55	2025-01-10 09:45:17	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	enabled
29	\N	xcczxcxzczx@dcss.ds	\N	\N	0	$2y$10$LDzPhqDJSiHgASw7x6/6qOxVxIBTED4w3W26QftsY5EaoU1akmu4q	\N	3	fdsfdssdffsd	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 04:53:14	2025-01-08 04:53:14	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
24	\N	bilokece@mailinator.com	\N	\N	0	$2y$10$dhyphEq9FoSU/J7HqADiquKjX/bTOXbdf.YjMO5asumqaOTMv2iZu	\N	3	Drew	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-07 17:56:06	2025-01-07 17:56:58	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
25	\N	anz2@anz1.com	\N	\N	0	$2y$10$afs/WR31ORtUyuN8BLEwheAs2qsg.RmSyv4mYjf/4hHz8xcmqCncK	\N	3	Anil	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-07 18:03:25	2025-01-07 18:12:25	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
37	\N	is@sdg.com	\N	\N	0	$2y$10$SbwTqt8O6aXIPUwNfr3EJ.EDfgdlebhI9Mtm/WeP4CnLb3i0tYMgq	\N	3	anil	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 10:34:31	2025-01-08 10:40:55	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
31	\N	asda@asdasd.com	\N	\N	0	$2y$10$1aaVsXk8icfxaMv3v1TbOeIx87dhxSkxfw.HGxUztGW/ALoEyvjQ.	\N	3	Randall	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 07:21:34	2025-01-08 07:21:34	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		1	0	\N	\N
26	\N	vahufad@mailinator.com	\N	\N	0	$2y$10$hVYVN9LQ8ZqJwAeI3hnaD.SgQGXr.F32SDgQ4urJGVvd.86NUSqhS	\N	3	Louis	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 04:19:15	2025-01-08 04:20:21	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
27	\N	joqiqoryvo@mailinator.com	\N	\N	0	$2y$10$LK45I6J0PRisRoIZ0ij2pu5idZfXxaKfd3L5mMnFs3XPuWU43Lhlq	\N	3	Brianna	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 04:42:31	2025-01-08 04:42:31	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
28	\N	kafefawu@mailinator.com	\N	\N	0	$2y$10$k1V1cN6sXHkGHUphd0INSe2E/tSVytSXi3ZaJgW8EH6EIgXEqTp1C	\N	3	Sydney	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 04:45:57	2025-01-08 04:52:11	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
33	test dev	test@gmail.com	971	321654789	1	$2y$10$IDnRHwX5rQqXcKLsZ3w1SOnajtcyWy0q2ze2tPhvzq0fN1aXB/6IS	2025-01-08 09:01:55	2	test	dev	\N			ANDROID	f2f777f9d4a3b6c8b8abf9effa900fc3ef5f5d956cf40c8565b50251b3eae59a	-OG48XUZStdwXaEt5sjB	\N	2025-01-08 09:01:55	2025-01-14 10:27:15	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	100		2025-01-08 10:39:36	0	\N	0	0	\N			\N	2025010833	0	0		0	0	\N	\N
32	\N	anz3@anz1.com	\N	\N	0	$2y$10$Rqi2NBbL6ozp6nUBV4F7mOQDqQu0Kqb7.iXabPE9yukn6nMbWPi22	\N	3	Anil	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 07:59:31	2025-01-08 08:09:32	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		1	0	\N	\N
34	\N	noripa@mailinator.com	\N	\N	0	$2y$10$N2mgFydwSoIL53n9OiKW0.7TND9D.i8eAQjgyC7hhgGrR7Jgc/Lb2	\N	3	Latifah	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 09:03:10	2025-01-08 09:03:56	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
35	\N	csacs@cds.ss	\N	\N	0	$2y$10$YNf1Rtn8/XQwm/U8KCF.2ObcSGqREQrQYBA3rhmZvvDDtM5tAWXy.	\N	3	csdvsd	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 09:22:37	2025-01-08 09:22:37	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
36	\N	vdvds@vdd.sds	\N	\N	0	$2y$10$tA3U.c2D33Oyn4xBFIi0keHgF9wqusBUGEpGyQcEJFSat7oLx5ere	\N	3	vsdvds	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 09:23:10	2025-01-08 09:23:10	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		1	0	\N	\N
40	\N	natifihi@mailinator.com	\N	\N	0	$2y$10$0wpMF4VteB7ywDKExgIve.mVkuxAChwKxxpHpUXa4VYWKCjYVQZnS	\N	3	Deacon	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 14:11:19	2025-01-08 14:11:19	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
41	\N	rufoqih@mailinator.com	\N	\N	0	$2y$10$0zDcFVAWrnLRMt6i.Gvgi.aasUhyqdBCjXgtb7cI3wHzTEtYHGXN.	\N	3	Marsden	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 16:22:26	2025-01-08 16:24:37	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		1	0	\N	\N
39	\N	telinatyki@mailinator.com	\N	\N	0	$2y$10$4u1vN2Hkhcq5avWjB4gRVe4uxDRNRSXVyPBzpXfVdnQZVfQeAYc2y	\N	3	Pearl	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 11:20:40	2025-01-08 11:20:40	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
43	\N	ddd@sdg.com	\N	\N	0	$2y$10$qj4GbZUe12Tc76dgIikJi.eSH3GIPAlDJpHNly88qbA2XucMJ.sh6	\N	3	ai	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-09 07:46:10	2025-01-09 07:46:10	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
38	test dev two	test2@gmail.com	971	3213698744	1	$2y$10$nq4fPOaEdxeJ3at79dYp4eL./VYaVj4L3iIdFl9xQUBb6/VUdSzau	2025-01-08 10:41:12	2	test	dev two	\N			ANDROID	4910bf08752f555e86553d6c7ee98349b374b6b24f752992f7577a2502f0394a	-OG4VFigX-8YaQYAcl3s	\N	2025-01-08 10:41:12	2025-01-09 12:23:11	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025010838	0	0		0	0	\N	\N
44	\N	anil@anil1.com	\N	\N	0	$2y$10$.tJ4A3o99CrLRk8tD1/oGOT7QGfLck7tDmhXCZ8uGU3xbm6DyeUXy	\N	3	anil	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-09 14:36:44	2025-01-09 14:36:44	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
42	\N	liwuriryfy@mailinator.com	\N	\N	0	$2y$10$4/VUWNk5vClDPPdiKsJXUuilgFAGpwq9JJQLpaQWgdpcpJ90sCxUe	\N	3	Leo	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 16:31:25	2025-01-08 16:43:22	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		1	0	\N	\N
30	\N	marthurcheng@gmail.com	971	561660188	0	$2y$10$8LkTaz6xO4Tpr4mVRJfPCe49Mlo1eDy5yJeDDD7VJcg.GJzIZnZMy	\N	3	Marthur	Cheng	\N	\N	\N	\N	\N	\N	\N	2025-01-08 06:55:40	\N	1	0	1	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	7			200		0	0		1	20	\N	\N
45	\N	sfsaf@f.com	\N	\N	0	$2y$10$wLju5ObQn11Sq.TZfLwkV.vqXk6L6ajYl3JYnG5gsg1qEr0xgWQlS	\N	3	anil	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-09 14:51:52	2025-01-09 15:02:08	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		1	0	\N	\N
47	\N	wahal@mailinator.com	\N	\N	0	$2y$10$rrhuWz1Gh9mosqKTf55YYezp/oyD6cjCjfd7srslW1WmSKkCrFkEG	\N	3	Valentine	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 06:17:33	2025-01-10 06:17:33	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
48	\N	puqeqocona@mailinator.com	\N	\N	0	$2y$10$I4RWAJSrxKBg48pNxAg9cuStGfyaKlUX7Lf3cDoluUlfNVH3PWLbS	\N	3	Sierra	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 06:50:05	2025-01-10 06:50:05	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
49	\N	puqeqocona@mailinator.com	\N	\N	0	$2y$10$KlWTN3NJ2Ekf5GuZdkkR2upkkHon1.ok04qxVKLm.OB4vbXtidULy	\N	3	Sierra	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 06:50:05	2025-01-10 06:50:05	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
50	\N	mozu@mailinator.com	\N	\N	0	$2y$10$F06LgAFi9X1WnN9pHDiaceNjwFv/7BPVxXwREXnf54TuuuzUCQv6e	\N	3	Troy	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 09:10:30	2025-01-10 09:12:23	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	enabled
9	hunain dev	hunain88@gmail.com	971	123456789	1	$2y$10$oMOk2VEOuBYI8FCX6J4zuuw3oXDbM/WxmRD5F0qCy06KqOVT95cjK	2024-11-30 11:33:34	2	hunain	dev	/uploads/company/6784d5cdf03dc_1736758733.jpg		e6hibBYnRWGJsNSXxKLCAc:APA91bFLNUmL1AzeZy1aelj2rBs_s6bSz0aWNNgG7vZmXncVj0coNZaN2V51yCLceOvIHECo0P1Lqjr9dy0qC8cwfIoUCjju3tN6TsVYhiti58HZFQVonAw	ANDROID	e4e78f0588f3defa376c1f0046bbf611679da16dcb54627c0815f7523ff1f505	-OCwqEiORwtIfFZt9P2d	\N	2024-11-30 11:33:34	2025-01-14 16:10:49	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0		2024-11-30 12:22:30	0	\N	0	0	\N			\N	202411309	0	0		0	0	\N	\N
56	\N	xzczxxzc@cvcx.ds	\N	\N	0	$2y$10$gbX8IyFBRZJuYhIBy/lnb.VeTY5dZ5NCHujxZCrjAdpZbqK2ucrQW	\N	3	dsfsdfsdffds	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-15 05:06:00	2025-01-15 05:06:00	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
53	\N	lapunyc@mailinator.com	\N	\N	0	$2y$10$sG5ugWtpY.u5i6eIpJxPJeytXO9j1U.exSr.KsXDpOsMNznEIViaG	\N	3	Alexa	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 13:48:26	2025-01-10 13:48:26	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
13	Asad 	asadnazir289@gmail.com	971	3441560349	1	$2y$10$c2oHLdQkil2Ao7AISKLxUefUtBB9xGcwVgP3zJdCM6L15IYCs.Rt6	2025-01-06 22:22:11	2	Asad	\N	\N		1111	ANDROID	620c6f1659a219f77672826f77555c00031f423ea5d639de4689575d7b1d9289	-OFxhWdfgqKK_9a7jQ9h	\N	2025-01-06 22:22:11	2025-01-11 14:16:22	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	2010		2025-01-10 13:01:55	0	\N	0	0	\N			\N	2025010613	0	0		0	0	\N	\N
54	\N	hiba@gmail.com_deleted_mail	\N	_deleted_mobile	0	$2y$10$kKqhBdyQQtw13AuhiQJwiusa6NYmR/a2gGywxUrfZ19LnGvf4ABCq	\N	3	hhh	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 15:09:05	2025-01-10 15:09:05	0	0	0	0	0	1	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
55	\N	dxbiftikhar@gmail.com	\N	757656756567576	0	$2y$10$vLvwo5zZaUN0ftLsEx7dKO5.3e437SoriSCd8JxeTcLbrwzRMWgEW	\N	2	dxb	iftikhar	\N	\N	\N	\N	\N	\N	\N	2025-01-14 06:03:32	2025-01-14 06:03:32	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
\.


--
-- Data for Name: users_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_role (id, role_name, created_at, updated_at) FROM stdin;
1	admin	2024-06-27 10:45:55	2024-06-27 10:45:55
2	users	2024-06-27 10:45:55	2024-06-27 10:45:55
3	vendors	2024-06-27 10:45:55	2024-06-27 10:45:55
\.


--
-- Data for Name: vendor_cuisines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_cuisines (id, vendor_id, cuisine_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: vendor_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_details (id, homedelivery, logo, key_control, branches, company_name, company_brand, legal_staus, reg_date, trade_license, trade_license_expiry, vat_reg_number, vat_reg_expiry, address1, address2, street, zip, trade_license_doc, chamber_of_commerce_doc, share_certificate_doc, power_attorny_doc, vat_reg_doc, signed_agreement_doc, identy1_type, identy1_doc, identy2_type, identy2_doc, company_identy1_type, company_identy1_doc, company_identy2_type, company_identy2_doc, created_at, updated_at, industry_type, user_id, store_type, txt_location, location, latitude, longitude, area, pharmacycommission, servicecommission, featured_flag, open_time, close_time, description, cover_image, country, city, street1, street2, state, postal_code, phone_number) FROM stdin;
1	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2024-06-27 10:52:26	2024-06-27 10:52:26	1	2	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0
2	1	/uploads/company/667e571830476_1719555864.jpg	0	0	Testttt	\N	\N	\N	84444842947664	2025-06-28 00:00:00	\N	\N	dsdsd	dsdsd	dsdsd	585220	/uploads/company/667e57183064f_1719555864.jpg	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2024-06-28 06:24:24	2024-06-28 06:24:24	2	3	0	\N	673C+VFH - Dubai - United Arab Emirates	25.204819	55.270931	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0
16	1	\N	0	0	DXBAPPs	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-10 09:45:17	2025-01-10 09:45:17	0	52	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	1	1	Ajman industrial area 2	building 304	1	500001	5616601444
6	1	/uploads/company/677cea486f1af_1736239688.jpg	0	0	Gleaming Grace	\N	\N	\N	AABB3344	2025-03-28 00:00:00	\N	\N	Mariam al owais building	\N	Industrial area 2	00000	/uploads/company/677cea486f8e2_1736239688.png	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-07 08:48:08	2025-01-08 09:07:18	0	17	0	10 27th St - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates	10 27th St - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates	25.20093599533033	55.241662735229475	\N	\N	50	0	\N	\N	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty. The word "Gleaming" suggests a radiant, shining quality, symbolizing the brilliance of fine jewelry. "Grace" adds an element of elegance and timeless appeal, evoking the delicate craftsmanship and refined designs that the brand offers.\r\n\r\nThis name would be perfect for a jewelry vendor focused on high-quality, exquisite pieces that emphasize both beauty and grace. It suggests a brand that appeals to those who appreciate both luxury and understated elegance, making it a great fit for products such as diamond jewelry, fine gemstones, or elegant gold pieces.	/uploads/company/677cea486f816_1736239688.jpg	0	0	0	0	0	0	0
5	1	/uploads/company/677cce5819122_1736232536.jpg	0	0	Thread & Trend	\N	\N	\N	AABB1122	2025-02-28 00:00:00	\N	\N	Ajman Gate Tower	Ajman	Industrial area 2	00000	/uploads/company/677cce5819e1c_1736232536.jpg	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-07 06:48:56	2025-01-07 06:53:17	0	16	0	9FG5+CP5 - Sheikh Zayed Street - Ajman Industrial 2 - Ajman - United Arab Emirates	9FG5+CP5 - Sheikh Zayed Street - Ajman Industrial 2 - Ajman - United Arab Emirates	25.3764521	55.45897369999999	\N	\N	40	0	\N	\N	Thread & Trend is a clothing brand name that combines two essential elements of fashion: "Thread," representing the materials and craftsmanship that go into creating clothing, and "Trend," symbolizing style, modernity, and staying current with fashion.\r\n\r\nThis name suggests a blend of quality fabric with contemporary, fashionable designs, making it an appealing choice for a clothing vendor aiming to attract customers who appreciate both craftsmanship and the latest trends. It evokes the idea of high-quality garments that are fashionable and timeless.	/uploads/company/677cce5819d59_1736232536.jpg	0	0	0	0	0	0	0
4	1	/uploads/company/668383a277971_1719894946.jpeg	0	0	Gift Palace	\N	\N	\N	56675756756	2024-07-31 00:00:00	\N	\N	1/2 Hatta Center	\N	1/2 Street	56755	/uploads/company/668383a277a95_1719894946.jpeg	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2024-07-02 04:35:46	2025-01-07 07:05:51	2	5	0	673C+VFH - Dubai - United Arab Emirates	673C+VFH - Dubai - United Arab Emirates	25.204819	55.270931	\N	\N	0	0	\N	\N	test	\N	0	0	0	0	0	0	0
7	1	/uploads/company/677cec5da1611_1736240221.png	0	0	Vivid Interiors	\N	\N	\N	AABB5566	2025-03-12 00:00:00	\N	\N	Mariam al owais building	\N	Industrial area 2	00000	/uploads/company/677cec5da1be0_1736240221.jpg	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-07 08:57:01	2025-01-07 11:20:26	0	18	0	58X6+JC - Al Jaddaf - Dubai - United Arab Emirates	58X6+JC - Al Jaddaf - Dubai - United Arab Emirates	25.200392364793725	55.31067060876463	\N	\N	50	0	\N	\N	Vivid Interiors is a décor brand that brings vibrant and colorful designs to life. Whether you're looking for bold statement pieces or subtle accents, Vivid Interiors ensures that every corner of your home radiates with energy and style.	/uploads/company/677cec5da1b1b_1736240221.jpg	0	0	0	0	0	0	0
8	1	/uploads/company/6784d5cdf03dc_1736758733.jpg	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-07 10:20:06	2025-01-13 08:58:53	1	9	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0
3	1	/uploads/company/677db8eeab55c_1736292590.png	0	0	Gift Hub	\N	\N	\N	76456456464	2024-07-31 00:00:00	\N	\N	Hatta Center	\N	1/2 Street	76575	/uploads/company/66838323cec5f_1719894819.png	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2024-07-02 04:33:39	2025-01-07 23:29:50	2	4	0	Abu Dhabi UAE	Abu Dhabi UAE	25.205608871677928	55.288703590818336	\N	\N	0	0	\N	\N	test	\N	0	0	0	0	0	0	0
9	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-08 05:49:06	2025-01-08 05:49:06	1	15	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0
10	1	/uploads/company/677e216c75cb9_1736319340.jpg	0	0	Ember & Lace	\N	\N	\N	AABB7788	2025-03-30 00:00:00	\N	\N	8th floor, 812 Apartment	\N	Industrial area 2	00000	/uploads/company/677e216c7671a_1736319340.png	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-08 06:55:40	2025-01-08 06:55:40	0	30	0	58M2+4H Dubai - United Arab Emirates	58M2+4H Dubai - United Arab Emirates	25.182761887707354	55.30148672509764	\N	\N	40	0	\N	\N	This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design. Suggesting warmth and delicate detailing, this name could be fitting for handmade bags, scarves, and elegant accessories.	/uploads/company/677e216c762c0_1736319340.jpg	0	0	0	0	0	0	0
11	1	\N	0	0	Anne	\N	\N	\N	\N	\N	\N	\N	Vielka	\N	Pandora	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-08 16:43:01	2025-01-08 16:43:01	0	42	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0
12	1	\N	0	0	Anne	\N	\N	\N	\N	\N	\N	\N	Vielka	\N	Pandora	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-08 16:43:22	2025-01-08 16:43:22	0	42	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0
13	1	\N	0	0	dddee	\N	\N	\N	\N	\N	\N	\N	wet	\N	werwer	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-09 15:02:08	2025-01-09 15:02:08	0	45	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0
14	1	\N	0	0	Madeline	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-10 09:12:23	2025-01-10 09:12:23	0	50	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	1	1	asdasdasdada	adadasda	1	123123	2423423423
15	1	\N	0	0	Elijah	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-10 09:29:53	2025-01-10 09:29:53	0	51	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	1	1	sadasdasdasd	asdasdasdad	1	213123	2131231313
\.


--
-- Data for Name: vendor_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_locations (id, user_id, location, latitude, longitude, created_at, updated_at, is_default) FROM stdin;
1	3	673C+VFH - Dubai - United Arab Emirates	25.204819	55.270931	2024-06-28 06:24:24	2024-06-28 06:24:24	1
4	4	51 58a St - Al Wasl - Dubai - United Arab Emirates	25.199397661153014	55.26431966945836	2024-08-29 15:10:13	2024-08-29 15:10:13	0
5	4	3 19th St - Al Wasl - Dubai - United Arab Emirates	25.202644532643	55.25479483056639	2024-08-30 18:03:51	2024-08-30 18:03:51	0
6	16	9FG5+CP5 - Sheikh Zayed Street - Ajman Industrial 2 - Ajman - United Arab Emirates	25.3764521	55.45897369999999	2025-01-07 06:48:56	2025-01-07 06:53:17	1
3	5	673C+VFH - Dubai - United Arab Emirates	25.204819	55.270931	2024-07-02 04:35:46	2025-01-07 07:05:51	1
8	18	58X6+JC - Al Jaddaf - Dubai - United Arab Emirates	25.200392364793725	55.31067060876463	2025-01-07 08:57:01	2025-01-07 11:20:26	1
2	4	Abu Dhabi UAE	25.205608871677928	55.288703590818336	2024-07-02 04:33:39	2025-01-07 23:29:50	1
9	30	58M2+4H Dubai - United Arab Emirates	25.182761887707354	55.30148672509764	2025-01-08 06:55:40	2025-01-08 06:55:40	1
7	17	10 27th St - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates	25.20093599533033	55.241662735229475	2025-01-07 08:48:08	2025-01-08 09:07:18	1
\.


--
-- Data for Name: vendor_menu_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_menu_images (id, vendor_id, image, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: vendor_service_timings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_service_timings (id, service_id, vendor, sunday, sun_from, sun_to, monday, mon_from, mon_to, tuesday, tues_from, tues_to, wednesday, wed_from, wed_to, thursday, thurs_from, thurs_to, friday, fri_from, fri_to, saturday, sat_from, sat_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: vendor_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_services (id, vendor_id, service_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: vendor_timings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_timings (id, vendor_id, has_24_hour, service_id, day, time_from, time_to, created_at, updated_at) FROM stdin;
10	16	0	2	monday	12:00 AM	09:00 AM	2025-01-07 06:53:17	2025-01-07 06:53:17
11	16	0	2	tuesday	12:00 AM	09:00 PM	2025-01-07 06:53:17	2025-01-07 06:53:17
12	16	0	2	wednesday	12:00 AM	09:00 PM	2025-01-07 06:53:17	2025-01-07 06:53:17
13	16	0	2	thursday	12:00 AM	09:00 PM	2025-01-07 06:53:17	2025-01-07 06:53:17
14	16	0	2	friday	12:00 AM	02:00 PM	2025-01-07 06:53:17	2025-01-07 06:53:17
15	16	0	2	saturday	12:00 AM	11:00 PM	2025-01-07 06:53:17	2025-01-07 06:53:17
16	5	1	2	tuesday	00:00 AM	12:59 PM	2025-01-07 07:05:51	2025-01-07 07:05:51
18	18	1	2	sunday	00:00 AM	12:59 PM	2025-01-07 11:20:26	2025-01-07 11:20:26
19	18	1	2	monday	00:00 AM	12:59 PM	2025-01-07 11:20:26	2025-01-07 11:20:26
20	18	1	2	tuesday	00:00 AM	12:59 PM	2025-01-07 11:20:26	2025-01-07 11:20:26
21	18	1	2	wednesday	00:00 AM	12:59 PM	2025-01-07 11:20:26	2025-01-07 11:20:26
22	18	1	2	thursday	00:00 AM	12:59 PM	2025-01-07 11:20:26	2025-01-07 11:20:26
23	18	1	2	friday	00:00 AM	12:59 PM	2025-01-07 11:20:26	2025-01-07 11:20:26
24	18	1	2	saturday	00:00 AM	12:59 PM	2025-01-07 11:20:26	2025-01-07 11:20:26
25	4	1	2	monday	00:00 AM	12:59 PM	2025-01-07 23:29:50	2025-01-07 23:29:50
26	4	1	2	tuesday	00:00 AM	12:59 PM	2025-01-07 23:29:50	2025-01-07 23:29:50
27	17	1	2	tuesday	00:00 AM	12:59 PM	2025-01-08 09:07:18	2025-01-08 09:07:18
28	17	1	2	wednesday	00:00 AM	12:59 PM	2025-01-08 09:07:18	2025-01-08 09:07:18
29	17	1	2	thursday	00:00 AM	12:59 PM	2025-01-08 09:07:18	2025-01-08 09:07:18
30	17	1	2	friday	00:00 AM	12:59 PM	2025-01-08 09:07:18	2025-01-08 09:07:18
31	17	1	2	saturday	00:00 AM	12:59 PM	2025-01-08 09:07:18	2025-01-08 09:07:18
\.


--
-- Data for Name: wallet_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_histories (id, user_id, wallet_amount, pay_type, description, created_at, updated_at, pay_method) FROM stdin;
1	13	1000	credited	Wallet Top up (via App)	2025-01-10 13:12:00	2025-01-10 13:12:00	2
2	13	1000	credited	Wallet Top up (via App)	2025-01-10 13:16:00	2025-01-10 13:16:00	2
3	13	10	credited	Wallet Top up (via App)	2025-01-10 17:21:00	2025-01-10 17:21:00	2
4	33	100	credited	Wallet Top up (via App)	2025-01-10 22:34:00	2025-01-10 22:34:00	2
5	15	100	credited	Wallet Top up (via App)	2025-01-11 10:05:00	2025-01-11 10:05:00	2
\.


--
-- Data for Name: wallet_payment_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_payment_report (id, transaction_id, payment_status, user_id, ref_id, amount, method_type, created_at, updated_at) FROM stdin;
1	1367811b5d9e7a91736514397	A	13	pi_3Qfhv7JGFNSKSXql0Rq256po	1000.00	2	2025-01-10 13:06:37	2025-01-10 13:12:21
2	1367811d7540d011736514933	A	13	pi_3Qfi3lJGFNSKSXql1j0MQltS	1000.00	2	2025-01-10 13:15:33	2025-01-10 13:16:32
3	13678156f532b581736529653	A	13	pi_3QfltBJGFNSKSXql0sVWFwV8	10.00	2	2025-01-10 17:20:53	2025-01-10 17:21:34
4	336781a07ac9d921736548474	A	33	pi_3QfqmkJGFNSKSXql1MHIW3sx	100.00	2	2025-01-10 22:34:34	2025-01-10 22:34:57
5	156782424f241f81736589903	A	15	pi_3Qg1YwJGFNSKSXql0f6U5XXm	100.00	2	2025-01-11 10:05:03	2025-01-11 10:05:21
\.


--
-- Data for Name: web_banners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.web_banners (id, name, description, banner_image, button_link, active, deleted, created_at, updated_at) FROM stdin;
1	Handmade with Heart, <br> Delivered with Care.	<p>Crafting Connections, One Handmade <br />Treasure at a Time.</p>	1736413528051504500003.jpg	https://dxbitprojects.com/handwi/public/	1	0	2025-01-09 09:05:28	2025-01-09 09:05:28
2	Delivered with Care	<p>Crafting Connections, One Handmade <br />Treasure at a Time.</p>	1736413579051504500003.jpg	https://dxbitprojects.com/handwi/public/	1	0	2025-01-09 09:06:19	2025-01-09 09:06:19
\.


--
-- Data for Name: websockets_statistics_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.websockets_statistics_entries (id, app_id, peak_connection_count, websocket_message_count, api_message_count, created_at, updated_at) FROM stdin;
\.


--
-- Name: account_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_type_id_seq', 1, false);


--
-- Name: activity_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_type_id_seq', 1, false);


--
-- Name: admin_designation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_designation_id_seq', 1, false);


--
-- Name: amount_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.amount_type_id_seq', 2, true);


--
-- Name: app_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_banners_id_seq', 3, true);


--
-- Name: app_home_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_home_sections_id_seq', 1, false);


--
-- Name: area_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.area_id_seq', 1, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articles_id_seq', 1, false);


--
-- Name: attribute_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attribute_type_id_seq', 4, true);


--
-- Name: attribute_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attribute_values_id_seq', 1, false);


--
-- Name: attribute_values_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attribute_values_request_id_seq', 1, false);


--
-- Name: attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attributes_id_seq', 1, false);


--
-- Name: bank_code_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_code_types_id_seq', 3, true);


--
-- Name: bank_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_details_id_seq', 19, true);


--
-- Name: bank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_id_seq', 2, true);


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blogs_id_seq', 3, true);


--
-- Name: brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_id_seq', 6, true);


--
-- Name: building_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.building_type_id_seq', 1, false);


--
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 98, true);


--
-- Name: cart_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_service_id_seq', 1, false);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 13, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 3, true);


--
-- Name: cleaning_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cleaning_services_id_seq', 1, false);


--
-- Name: comment_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_likes_id_seq', 1, false);


--
-- Name: comment_taged_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_taged_users_id_seq', 1, false);


--
-- Name: contact_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_us_id_seq', 1, false);


--
-- Name: contact_us_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_us_settings_id_seq', 1, true);


--
-- Name: contracting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contracting_id_seq', 1, false);


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_seq', 1, true);


--
-- Name: coupon_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_brand_id_seq', 1, false);


--
-- Name: coupon_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_category_id_seq', 22, true);


--
-- Name: coupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_id_seq', 5, true);


--
-- Name: coupon_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_images_id_seq', 1, false);


--
-- Name: coupon_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_products_id_seq', 1, false);


--
-- Name: coupon_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_services_id_seq', 1, true);


--
-- Name: coupon_vendor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_vendor_id_seq', 11, true);


--
-- Name: coupon_vendor_service_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_vendor_service_order_id_seq', 1, false);


--
-- Name: coupons_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupons_category_id_seq', 1, false);


--
-- Name: coupons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupons_id_seq', 1, false);


--
-- Name: cuisines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuisines_id_seq', 1, false);


--
-- Name: currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.currencies_id_seq', 1, true);


--
-- Name: custom_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.custom_banners_id_seq', 1, false);


--
-- Name: designations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.designations_id_seq', 1, false);


--
-- Name: event_features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_features_id_seq', 8, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faq_id_seq', 1, false);


--
-- Name: featured_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.featured_products_id_seq', 1, false);


--
-- Name: featured_products_img_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.featured_products_img_id_seq', 1, false);


--
-- Name: hair_colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hair_colors_id_seq', 1, false);


--
-- Name: help_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.help_id_seq', 1, false);


--
-- Name: help_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.help_topics_id_seq', 123, true);


--
-- Name: home_logos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_logos_id_seq', 7, true);


--
-- Name: hourly_rate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hourly_rate_id_seq', 3, true);


--
-- Name: industry_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.industry_types_id_seq', 1, false);


--
-- Name: landing_page_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.landing_page_settings_id_seq', 23, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.likes_id_seq', 47, true);


--
-- Name: main_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_category_id_seq', 3, true);


--
-- Name: maintainance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maintainance_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 334, true);


--
-- Name: moda_main_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moda_main_categories_id_seq', 6, true);


--
-- Name: moda_sub_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moda_sub_categories_id_seq', 1, false);


--
-- Name: my_moda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.my_moda_id_seq', 1, false);


--
-- Name: my_moda_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.my_moda_items_id_seq', 1, false);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 1, false);


--
-- Name: order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_products_id_seq', 27, true);


--
-- Name: order_request_view_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_request_view_id_seq', 1, false);


--
-- Name: order_status_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_status_history_id_seq', 22, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 21, true);


--
-- Name: orders_services_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_services_items_id_seq', 1, false);


--
-- Name: orders_services_mute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_services_mute_id_seq', 1, false);


--
-- Name: orders_services_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_services_order_id_seq', 1, false);


--
-- Name: orders_services_rejected_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_services_rejected_id_seq', 1, false);


--
-- Name: payment_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_report_id_seq', 30, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 119, true);


--
-- Name: post_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_comments_id_seq', 1, false);


--
-- Name: post_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_likes_id_seq', 1, false);


--
-- Name: post_saves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_saves_id_seq', 1, false);


--
-- Name: post_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_users_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- Name: product_attribute_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_attribute_attribute_id_seq', 2, true);


--
-- Name: product_attribute_values_attribute_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_attribute_values_attribute_values_id_seq', 3, true);


--
-- Name: product_category_product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_category_product_category_id_seq', 142, true);


--
-- Name: product_cuisines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cuisines_id_seq', 1, false);


--
-- Name: product_docs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_docs_id_seq', 1, false);


--
-- Name: product_features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_features_id_seq', 9, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 34, true);


--
-- Name: product_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_images_id_seq', 1, false);


--
-- Name: product_items_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_items_item_id_seq', 20, true);


--
-- Name: product_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_likes_id_seq', 1, false);


--
-- Name: product_master_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_master_id_seq', 1, false);


--
-- Name: product_master_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_master_request_id_seq', 1, false);


--
-- Name: product_product_feature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_product_feature_id_seq', 104, true);


--
-- Name: product_selected_attribute_list_product_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_selected_attribute_list_product_attribute_id_seq', 35, true);


--
-- Name: product_selected_attributes_product_selected_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_selected_attributes_product_selected_attributes_id_seq', 7, true);


--
-- Name: product_specifications_prod_spec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_specifications_prod_spec_id_seq', 113, true);


--
-- Name: product_temp_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_temp_image_id_seq', 1, false);


--
-- Name: product_variations_product_variations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_variations_product_variations_id_seq', 7, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: promotion_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promotion_banners_id_seq', 1, false);


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ratings_id_seq', 24, true);


--
-- Name: ratings_reply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ratings_reply_id_seq', 1, false);


--
-- Name: ref_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_history_id_seq', 1, false);


--
-- Name: service_assigned_vendors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_assigned_vendors_id_seq', 1, false);


--
-- Name: service_bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_bookings_id_seq', 18, true);


--
-- Name: service_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_category_id_seq', 2, true);


--
-- Name: service_category_selected_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_category_selected_id_seq', 2, true);


--
-- Name: service_event_feature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_event_feature_id_seq', 24, true);


--
-- Name: service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_id_seq', 15, true);


--
-- Name: service_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_images_id_seq', 1, true);


--
-- Name: service_include_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_include_id_seq', 1, false);


--
-- Name: service_order_status_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_order_status_history_id_seq', 1, false);


--
-- Name: service_timings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_timings_id_seq', 1, false);


--
-- Name: service_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_type_id_seq', 1, false);


--
-- Name: service_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_types_id_seq', 1, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);


--
-- Name: skin_colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skin_colors_id_seq', 1, false);


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.states_id_seq', 1, true);


--
-- Name: store_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_images_id_seq', 1, false);


--
-- Name: store_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_likes_id_seq', 1, false);


--
-- Name: store_managers_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_managers_types_id_seq', 1, false);


--
-- Name: store_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_type_id_seq', 1, false);


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stores_id_seq', 22, true);


--
-- Name: subscribers_emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscribers_emails_id_seq', 1, false);


--
-- Name: temp_order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_order_products_id_seq', 56, true);


--
-- Name: temp_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_orders_id_seq', 37, true);


--
-- Name: temp_service_order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_service_order_items_id_seq', 1, false);


--
-- Name: temp_service_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_service_orders_id_seq', 1, false);


--
-- Name: temp_user_account_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_user_account_types_id_seq', 1, false);


--
-- Name: temp_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_users_id_seq', 11, true);


--
-- Name: tesimonial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tesimonial_id_seq', 3, true);


--
-- Name: transport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transport_id_seq', 1, false);


--
-- Name: user_account_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_account_types_id_seq', 1, false);


--
-- Name: user_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_address_id_seq', 14, true);


--
-- Name: user_follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_follows_id_seq', 1, false);


--
-- Name: user_privileges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_privileges_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 56, true);


--
-- Name: users_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_role_id_seq', 3, true);


--
-- Name: vendor_cuisines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_cuisines_id_seq', 1, false);


--
-- Name: vendor_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_details_id_seq', 16, true);


--
-- Name: vendor_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_locations_id_seq', 9, true);


--
-- Name: vendor_menu_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_menu_images_id_seq', 1, false);


--
-- Name: vendor_service_timings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_service_timings_id_seq', 1, false);


--
-- Name: vendor_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_services_id_seq', 1, false);


--
-- Name: vendor_timings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_timings_id_seq', 31, true);


--
-- Name: wallet_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_histories_id_seq', 5, true);


--
-- Name: wallet_payment_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_payment_report_id_seq', 5, true);


--
-- Name: web_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.web_banners_id_seq', 2, true);


--
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.websockets_statistics_entries_id_seq', 1, false);


--
-- Name: account_type account_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_type
    ADD CONSTRAINT account_type_pkey PRIMARY KEY (id);


--
-- Name: activity_type activity_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_type
    ADD CONSTRAINT activity_type_pkey PRIMARY KEY (id);


--
-- Name: admin_designation admin_designation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_designation
    ADD CONSTRAINT admin_designation_pkey PRIMARY KEY (id);


--
-- Name: amount_type amount_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amount_type
    ADD CONSTRAINT amount_type_pkey PRIMARY KEY (id);


--
-- Name: app_banners app_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_banners
    ADD CONSTRAINT app_banners_pkey PRIMARY KEY (id);


--
-- Name: app_home_sections app_home_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_home_sections
    ADD CONSTRAINT app_home_sections_pkey PRIMARY KEY (id);


--
-- Name: area area_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT area_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: attribute_type attribute_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_type
    ADD CONSTRAINT attribute_type_pkey PRIMARY KEY (id);


--
-- Name: attribute_values attribute_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_values
    ADD CONSTRAINT attribute_values_pkey PRIMARY KEY (id);


--
-- Name: attribute_values_request attribute_values_request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_values_request
    ADD CONSTRAINT attribute_values_request_pkey PRIMARY KEY (id);


--
-- Name: attributes attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attributes
    ADD CONSTRAINT attributes_pkey PRIMARY KEY (id);


--
-- Name: bank_code_types bank_code_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_code_types
    ADD CONSTRAINT bank_code_types_pkey PRIMARY KEY (id);


--
-- Name: bank_details bank_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_details
    ADD CONSTRAINT bank_details_pkey PRIMARY KEY (id);


--
-- Name: bank bank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank
    ADD CONSTRAINT bank_pkey PRIMARY KEY (id);


--
-- Name: blogs blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (id);


--
-- Name: building_type building_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.building_type
    ADD CONSTRAINT building_type_pkey PRIMARY KEY (id);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- Name: cart_service cart_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_service
    ADD CONSTRAINT cart_service_pkey PRIMARY KEY (id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: cleaning_services cleaning_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cleaning_services
    ADD CONSTRAINT cleaning_services_pkey PRIMARY KEY (id);


--
-- Name: comment_likes comment_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT comment_likes_pkey PRIMARY KEY (id);


--
-- Name: comment_taged_users comment_taged_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_taged_users
    ADD CONSTRAINT comment_taged_users_pkey PRIMARY KEY (id);


--
-- Name: contact_us contact_us_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us
    ADD CONSTRAINT contact_us_pkey PRIMARY KEY (id);


--
-- Name: contact_us_settings contact_us_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us_settings
    ADD CONSTRAINT contact_us_settings_pkey PRIMARY KEY (id);


--
-- Name: contracting contracting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracting
    ADD CONSTRAINT contracting_pkey PRIMARY KEY (id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: coupon_brand coupon_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_brand
    ADD CONSTRAINT coupon_brand_pkey PRIMARY KEY (id);


--
-- Name: coupon_category coupon_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_category
    ADD CONSTRAINT coupon_category_pkey PRIMARY KEY (id);


--
-- Name: coupon_images coupon_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_images
    ADD CONSTRAINT coupon_images_pkey PRIMARY KEY (id);


--
-- Name: coupon coupon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon
    ADD CONSTRAINT coupon_pkey PRIMARY KEY (id);


--
-- Name: coupon_products coupon_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_products
    ADD CONSTRAINT coupon_products_pkey PRIMARY KEY (id);


--
-- Name: coupon_services coupon_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_services
    ADD CONSTRAINT coupon_services_pkey PRIMARY KEY (id);


--
-- Name: coupon_vendor coupon_vendor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_vendor
    ADD CONSTRAINT coupon_vendor_pkey PRIMARY KEY (id);


--
-- Name: coupon_vendor_service_order coupon_vendor_service_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_vendor_service_order
    ADD CONSTRAINT coupon_vendor_service_order_pkey PRIMARY KEY (id);


--
-- Name: coupons_category coupons_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons_category
    ADD CONSTRAINT coupons_category_pkey PRIMARY KEY (id);


--
-- Name: coupons coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);


--
-- Name: cuisines cuisines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuisines
    ADD CONSTRAINT cuisines_pkey PRIMARY KEY (id);


--
-- Name: currencies currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (id);


--
-- Name: custom_banners custom_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_banners
    ADD CONSTRAINT custom_banners_pkey PRIMARY KEY (id);


--
-- Name: designations designations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT designations_pkey PRIMARY KEY (id);


--
-- Name: event_features event_features_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_features
    ADD CONSTRAINT event_features_pkey PRIMARY KEY (id);


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
-- Name: featured_products_img featured_products_img_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.featured_products_img
    ADD CONSTRAINT featured_products_img_pkey PRIMARY KEY (id);


--
-- Name: featured_products featured_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.featured_products
    ADD CONSTRAINT featured_products_pkey PRIMARY KEY (id);


--
-- Name: hair_colors hair_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hair_colors
    ADD CONSTRAINT hair_colors_pkey PRIMARY KEY (id);


--
-- Name: help help_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help
    ADD CONSTRAINT help_pkey PRIMARY KEY (id);


--
-- Name: help_topics help_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help_topics
    ADD CONSTRAINT help_topics_pkey PRIMARY KEY (id);


--
-- Name: home_logos home_logos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_logos
    ADD CONSTRAINT home_logos_pkey PRIMARY KEY (id);


--
-- Name: hourly_rate hourly_rate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hourly_rate
    ADD CONSTRAINT hourly_rate_pkey PRIMARY KEY (id);


--
-- Name: industry_types industry_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industry_types
    ADD CONSTRAINT industry_types_pkey PRIMARY KEY (id);


--
-- Name: landing_page_settings landing_page_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.landing_page_settings
    ADD CONSTRAINT landing_page_settings_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: main_category main_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_category
    ADD CONSTRAINT main_category_pkey PRIMARY KEY (id);


--
-- Name: maintainance maintainance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintainance
    ADD CONSTRAINT maintainance_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: moda_main_categories moda_main_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moda_main_categories
    ADD CONSTRAINT moda_main_categories_pkey PRIMARY KEY (id);


--
-- Name: moda_sub_categories moda_sub_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moda_sub_categories
    ADD CONSTRAINT moda_sub_categories_pkey PRIMARY KEY (id);


--
-- Name: my_moda_items my_moda_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.my_moda_items
    ADD CONSTRAINT my_moda_items_pkey PRIMARY KEY (id);


--
-- Name: my_moda my_moda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.my_moda
    ADD CONSTRAINT my_moda_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: order_products order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (id);


--
-- Name: order_request_view order_request_view_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_request_view
    ADD CONSTRAINT order_request_view_pkey PRIMARY KEY (id);


--
-- Name: order_status_history order_status_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_history
    ADD CONSTRAINT order_status_history_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: orders_services_items orders_services_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services_items
    ADD CONSTRAINT orders_services_items_pkey PRIMARY KEY (id);


--
-- Name: orders_services_mute orders_services_mute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services_mute
    ADD CONSTRAINT orders_services_mute_pkey PRIMARY KEY (id);


--
-- Name: orders_services orders_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services
    ADD CONSTRAINT orders_services_pkey PRIMARY KEY (order_id);


--
-- Name: orders_services_rejected orders_services_rejected_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services_rejected
    ADD CONSTRAINT orders_services_rejected_pkey PRIMARY KEY (id);


--
-- Name: payment_report payment_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_report
    ADD CONSTRAINT payment_report_pkey PRIMARY KEY (id);


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
-- Name: post_saves post_saves_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_saves
    ADD CONSTRAINT post_saves_pkey PRIMARY KEY (id);


--
-- Name: post_users post_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_users
    ADD CONSTRAINT post_users_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: product_attribute product_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_attribute
    ADD CONSTRAINT product_attribute_pkey PRIMARY KEY (attribute_id);


--
-- Name: product_attribute_values product_attribute_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_attribute_values
    ADD CONSTRAINT product_attribute_values_pkey PRIMARY KEY (attribute_values_id);


--
-- Name: product_category product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (product_category_id);


--
-- Name: product_cuisines product_cuisines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cuisines
    ADD CONSTRAINT product_cuisines_pkey PRIMARY KEY (id);


--
-- Name: product_docs product_docs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_docs
    ADD CONSTRAINT product_docs_pkey PRIMARY KEY (id);


--
-- Name: product_features product_features_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_features
    ADD CONSTRAINT product_features_pkey PRIMARY KEY (id);


--
-- Name: product_images product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (id);


--
-- Name: product_items product_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_items
    ADD CONSTRAINT product_items_pkey PRIMARY KEY (item_id);


--
-- Name: product_likes product_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_likes
    ADD CONSTRAINT product_likes_pkey PRIMARY KEY (id);


--
-- Name: product_master product_master_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_master
    ADD CONSTRAINT product_master_pkey PRIMARY KEY (id);


--
-- Name: product_master_request product_master_request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_master_request
    ADD CONSTRAINT product_master_request_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: product_product_feature product_product_feature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_product_feature
    ADD CONSTRAINT product_product_feature_pkey PRIMARY KEY (id);


--
-- Name: product_selected_attribute_list product_selected_attribute_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_selected_attribute_list
    ADD CONSTRAINT product_selected_attribute_list_pkey PRIMARY KEY (product_attribute_id);


--
-- Name: product_selected_attributes product_selected_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_selected_attributes
    ADD CONSTRAINT product_selected_attributes_pkey PRIMARY KEY (product_selected_attributes_id);


--
-- Name: product_specifications product_specifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_specifications
    ADD CONSTRAINT product_specifications_pkey PRIMARY KEY (prod_spec_id);


--
-- Name: product_temp_image product_temp_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_temp_image
    ADD CONSTRAINT product_temp_image_pkey PRIMARY KEY (id);


--
-- Name: product_variations product_variations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variations
    ADD CONSTRAINT product_variations_pkey PRIMARY KEY (product_variations_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: promotion_banners promotion_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_banners
    ADD CONSTRAINT promotion_banners_pkey PRIMARY KEY (id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- Name: ratings_reply ratings_reply_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings_reply
    ADD CONSTRAINT ratings_reply_pkey PRIMARY KEY (id);


--
-- Name: ref_history ref_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_history
    ADD CONSTRAINT ref_history_pkey PRIMARY KEY (id);


--
-- Name: service_assigned_vendors service_assigned_vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_assigned_vendors
    ADD CONSTRAINT service_assigned_vendors_pkey PRIMARY KEY (id);


--
-- Name: service_bookings service_bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_bookings
    ADD CONSTRAINT service_bookings_pkey PRIMARY KEY (id);


--
-- Name: service_category service_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_category
    ADD CONSTRAINT service_category_pkey PRIMARY KEY (id);


--
-- Name: service_category_selected service_category_selected_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_category_selected
    ADD CONSTRAINT service_category_selected_pkey PRIMARY KEY (id);


--
-- Name: service_event_feature service_event_feature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_event_feature
    ADD CONSTRAINT service_event_feature_pkey PRIMARY KEY (id);


--
-- Name: service_images service_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_images
    ADD CONSTRAINT service_images_pkey PRIMARY KEY (id);


--
-- Name: service_include service_include_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_include
    ADD CONSTRAINT service_include_pkey PRIMARY KEY (id);


--
-- Name: service_order_status_history service_order_status_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_order_status_history
    ADD CONSTRAINT service_order_status_history_pkey PRIMARY KEY (id);


--
-- Name: service service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);


--
-- Name: service_timings service_timings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_timings
    ADD CONSTRAINT service_timings_pkey PRIMARY KEY (id);


--
-- Name: service_type service_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_type
    ADD CONSTRAINT service_type_pkey PRIMARY KEY (id);


--
-- Name: service_types service_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_types
    ADD CONSTRAINT service_types_pkey PRIMARY KEY (id);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: skin_colors skin_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin_colors
    ADD CONSTRAINT skin_colors_pkey PRIMARY KEY (id);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: store_images store_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_images
    ADD CONSTRAINT store_images_pkey PRIMARY KEY (id);


--
-- Name: store_likes store_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_likes
    ADD CONSTRAINT store_likes_pkey PRIMARY KEY (id);


--
-- Name: store_managers_types store_managers_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_managers_types
    ADD CONSTRAINT store_managers_types_pkey PRIMARY KEY (id);


--
-- Name: store_type store_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_type
    ADD CONSTRAINT store_type_pkey PRIMARY KEY (id);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: subscribers_emails subscribers_emails_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscribers_emails
    ADD CONSTRAINT subscribers_emails_email_unique UNIQUE (email);


--
-- Name: subscribers_emails subscribers_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscribers_emails
    ADD CONSTRAINT subscribers_emails_pkey PRIMARY KEY (id);


--
-- Name: temp_order_products temp_order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_order_products
    ADD CONSTRAINT temp_order_products_pkey PRIMARY KEY (id);


--
-- Name: temp_orders temp_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_orders
    ADD CONSTRAINT temp_orders_pkey PRIMARY KEY (id);


--
-- Name: temp_service_order_items temp_service_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_service_order_items
    ADD CONSTRAINT temp_service_order_items_pkey PRIMARY KEY (id);


--
-- Name: temp_service_orders temp_service_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_service_orders
    ADD CONSTRAINT temp_service_orders_pkey PRIMARY KEY (id);


--
-- Name: temp_user_account_types temp_user_account_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_user_account_types
    ADD CONSTRAINT temp_user_account_types_pkey PRIMARY KEY (id);


--
-- Name: temp_users temp_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users
    ADD CONSTRAINT temp_users_pkey PRIMARY KEY (id);


--
-- Name: tesimonial tesimonial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tesimonial
    ADD CONSTRAINT tesimonial_pkey PRIMARY KEY (id);


--
-- Name: transport transport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transport
    ADD CONSTRAINT transport_pkey PRIMARY KEY (id);


--
-- Name: user_account_types user_account_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account_types
    ADD CONSTRAINT user_account_types_pkey PRIMARY KEY (id);


--
-- Name: user_address user_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address
    ADD CONSTRAINT user_address_pkey PRIMARY KEY (id);


--
-- Name: user_follows user_follows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_follows
    ADD CONSTRAINT user_follows_pkey PRIMARY KEY (id);


--
-- Name: user_privileges user_privileges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_privileges
    ADD CONSTRAINT user_privileges_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_role users_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_role
    ADD CONSTRAINT users_role_pkey PRIMARY KEY (id);


--
-- Name: vendor_cuisines vendor_cuisines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_cuisines
    ADD CONSTRAINT vendor_cuisines_pkey PRIMARY KEY (id);


--
-- Name: vendor_details vendor_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_details
    ADD CONSTRAINT vendor_details_pkey PRIMARY KEY (id);


--
-- Name: vendor_locations vendor_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_locations
    ADD CONSTRAINT vendor_locations_pkey PRIMARY KEY (id);


--
-- Name: vendor_menu_images vendor_menu_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_menu_images
    ADD CONSTRAINT vendor_menu_images_pkey PRIMARY KEY (id);


--
-- Name: vendor_service_timings vendor_service_timings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_service_timings
    ADD CONSTRAINT vendor_service_timings_pkey PRIMARY KEY (id);


--
-- Name: vendor_services vendor_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_services
    ADD CONSTRAINT vendor_services_pkey PRIMARY KEY (id);


--
-- Name: vendor_timings vendor_timings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_timings
    ADD CONSTRAINT vendor_timings_pkey PRIMARY KEY (id);


--
-- Name: wallet_histories wallet_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_histories
    ADD CONSTRAINT wallet_histories_pkey PRIMARY KEY (id);


--
-- Name: wallet_payment_report wallet_payment_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_payment_report
    ADD CONSTRAINT wallet_payment_report_pkey PRIMARY KEY (id);


--
-- Name: web_banners web_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.web_banners
    ADD CONSTRAINT web_banners_pkey PRIMARY KEY (id);


--
-- Name: websockets_statistics_entries websockets_statistics_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.websockets_statistics_entries
    ADD CONSTRAINT websockets_statistics_entries_pkey PRIMARY KEY (id);


--
-- Name: des_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX des_user_id ON public.designations USING btree (user_id);


--
-- Name: designation_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX designation_id ON public.users USING btree (designation_id);


--
-- Name: man_vendor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX man_vendor_id ON public.store_managers_types USING btree (vendor_id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: user_designation_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_designation_id ON public.user_privileges USING btree (designation_id);


--
-- Name: user_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_user_id ON public.user_privileges USING btree (user_id);


--
-- Name: bank_details bank_details_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_details
    ADD CONSTRAINT bank_details_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: comment_likes comment_likes_comment_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT comment_likes_comment_id_foreign FOREIGN KEY (comment_id) REFERENCES public.post_comments(id) ON DELETE CASCADE;


--
-- Name: comment_likes comment_likes_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT comment_likes_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: comment_taged_users comment_taged_users_comment_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_taged_users
    ADD CONSTRAINT comment_taged_users_comment_id_foreign FOREIGN KEY (comment_id) REFERENCES public.post_comments(id) ON DELETE CASCADE;


--
-- Name: comment_taged_users comment_taged_users_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_taged_users
    ADD CONSTRAINT comment_taged_users_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: designations designations_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT designations_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: help_topics help_topics_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help_topics
    ADD CONSTRAINT help_topics_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: order_products order_products_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: orders orders_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: post_comments post_comments_post_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT post_comments_post_id_foreign FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: post_comments post_comments_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT post_comments_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: post_saves post_saves_post_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_saves
    ADD CONSTRAINT post_saves_post_id_foreign FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: post_saves post_saves_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_saves
    ADD CONSTRAINT post_saves_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: post_users post_users_post_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_users
    ADD CONSTRAINT post_users_post_id_foreign FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: post_users post_users_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_users
    ADD CONSTRAINT post_users_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: product_docs product_docs_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_docs
    ADD CONSTRAINT product_docs_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: product_images product_images_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: product_items product_items_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_items
    ADD CONSTRAINT product_items_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: product_selected_attributes product_selected_attributes_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_selected_attributes
    ADD CONSTRAINT product_selected_attributes_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: product_specifications product_specifications_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_specifications
    ADD CONSTRAINT product_specifications_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: product_variations product_variations_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variations
    ADD CONSTRAINT product_variations_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: service_images service_images_service_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_images
    ADD CONSTRAINT service_images_service_id_foreign FOREIGN KEY (service_id) REFERENCES public.service(id) ON DELETE CASCADE;


--
-- Name: service service_service_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_service_user_id_foreign FOREIGN KEY (service_user_id) REFERENCES public.users(id);


--
-- Name: store_managers_types store_managers_types_vendor_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_managers_types
    ADD CONSTRAINT store_managers_types_vendor_id_foreign FOREIGN KEY (vendor_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: temp_order_products temp_order_products_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_order_products
    ADD CONSTRAINT temp_order_products_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: temp_orders temp_orders_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_orders
    ADD CONSTRAINT temp_orders_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_address user_address_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address
    ADD CONSTRAINT user_address_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_follows user_follows_follow_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_follows
    ADD CONSTRAINT user_follows_follow_user_id_foreign FOREIGN KEY (follow_user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_follows user_follows_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_follows
    ADD CONSTRAINT user_follows_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: vendor_details vendor_details_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_details
    ADD CONSTRAINT vendor_details_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: wallet_histories wallet_histories_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_histories
    ADD CONSTRAINT wallet_histories_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

