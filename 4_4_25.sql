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
-- Name: aboutus_page_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aboutus_page_settings (
    id bigint NOT NULL,
    meta_key character varying(255) NOT NULL,
    meta_value text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.aboutus_page_settings OWNER TO postgres;

--
-- Name: aboutus_page_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aboutus_page_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aboutus_page_settings_id_seq OWNER TO postgres;

--
-- Name: aboutus_page_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aboutus_page_settings_id_seq OWNED BY public.aboutus_page_settings.id;


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
    updated_at timestamp(0) without time zone,
    subject character varying(255)
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
    transport_website_link character varying(255) DEFAULT ''::character varying,
    pinterest character varying(255),
    tiktok character varying(255),
    whatsapp character varying(255)
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
    shipment_and_policies text,
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
    order_id integer DEFAULT 0 NOT NULL,
    name character varying(255),
    email character varying(255)
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
-- Name: report_reasons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_reasons (
    id bigint NOT NULL,
    reason character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.report_reasons OWNER TO postgres;

--
-- Name: report_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_reasons_id_seq OWNER TO postgres;

--
-- Name: report_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_reasons_id_seq OWNED BY public.report_reasons.id;


--
-- Name: reported_shops; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reported_shops (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    shop_id bigint NOT NULL,
    reason_id bigint,
    description text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.reported_shops OWNER TO postgres;

--
-- Name: reported_shops_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reported_shops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reported_shops_id_seq OWNER TO postgres;

--
-- Name: reported_shops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reported_shops_id_seq OWNED BY public.reported_shops.id;


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
-- Name: vendor_followers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_followers (
    id bigint NOT NULL,
    vendor_id integer DEFAULT 0,
    user_id integer DEFAULT 0,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.vendor_followers OWNER TO postgres;

--
-- Name: vendor_followers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_followers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_followers_id_seq OWNER TO postgres;

--
-- Name: vendor_followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_followers_id_seq OWNED BY public.vendor_followers.id;


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
-- Name: vendor_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_messages (
    id bigint NOT NULL,
    name text,
    email text,
    phone text,
    subject text,
    message text,
    vendor_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    user_id character varying(255)
);


ALTER TABLE public.vendor_messages OWNER TO postgres;

--
-- Name: vendor_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_messages_id_seq OWNER TO postgres;

--
-- Name: vendor_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_messages_id_seq OWNED BY public.vendor_messages.id;


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
-- Name: wishlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wishlists (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    product_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.wishlists OWNER TO postgres;

--
-- Name: wishlists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wishlists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wishlists_id_seq OWNER TO postgres;

--
-- Name: wishlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wishlists_id_seq OWNED BY public.wishlists.id;


--
-- Name: aboutus_page_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aboutus_page_settings ALTER COLUMN id SET DEFAULT nextval('public.aboutus_page_settings_id_seq'::regclass);


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
-- Name: report_reasons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_reasons ALTER COLUMN id SET DEFAULT nextval('public.report_reasons_id_seq'::regclass);


--
-- Name: reported_shops id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reported_shops ALTER COLUMN id SET DEFAULT nextval('public.reported_shops_id_seq'::regclass);


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
-- Name: vendor_followers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_followers ALTER COLUMN id SET DEFAULT nextval('public.vendor_followers_id_seq'::regclass);


--
-- Name: vendor_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_locations ALTER COLUMN id SET DEFAULT nextval('public.vendor_locations_id_seq'::regclass);


--
-- Name: vendor_menu_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_menu_images ALTER COLUMN id SET DEFAULT nextval('public.vendor_menu_images_id_seq'::regclass);


--
-- Name: vendor_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_messages ALTER COLUMN id SET DEFAULT nextval('public.vendor_messages_id_seq'::regclass);


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
-- Name: wishlists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlists ALTER COLUMN id SET DEFAULT nextval('public.wishlists_id_seq'::regclass);


--
-- Data for Name: aboutus_page_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aboutus_page_settings (id, meta_key, meta_value, created_at, updated_at) FROM stdin;
1	about_us_title	Everyday fashion is our promise to you	2025-01-21 06:27:58	2025-01-21 06:27:58
2	about_us_description	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged</p>	2025-01-21 06:27:58	2025-01-21 06:27:58
3	founder_date	SINCE 2024	2025-01-21 06:27:58	2025-01-21 06:27:58
4	founder_title	The Founder	2025-01-21 06:27:58	2025-01-21 06:27:58
5	founder_description	<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. "de Finibus Bonorum et Malorum" by Cicero reproduced in their 1914 translation by H. Rackham.</p>\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, even slightly believable.</p>\r\n<p>All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary</p>	2025-01-21 06:27:58	2025-01-21 06:27:58
6	our_story_title	Our Story	2025-01-21 06:27:58	2025-01-21 06:27:58
7	our_story_date	Est. 2024	2025-01-21 06:27:58	2025-01-21 06:27:58
8	our_story_description	<div class="col-12 col-sm-12 col-md-6 col-lg-6">\r\n<p>Handwi comes with easy-to-use interface and outstanding support. You can implement your own design. You can easily change the store's appearance as per your requirements using our ready sections and options available.</p>\r\n<p>You can implement your own design, You can easily change the store's appearance as per your requirements using our ready sections and options available.</p>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley</p>\r\n</div>\r\n<div class="col-12 col-sm-12 col-md-6 col-lg-6">\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.</p>\r\n<p>All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced</p>\r\n</div>	2025-01-21 06:27:59	2025-01-21 06:27:59
11	founder_image	https://dxbitprojects.com/handwi/public/uploads/landing_page_images/1737440879_about-info-s1.jpg	2025-01-21 06:27:59	2025-01-21 06:27:59
9	our_vision_title	Our Vision	2025-01-21 06:27:59	2025-01-21 06:28:21
10	our_vision_description	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries remaining essentially unchanged.</p>	2025-01-21 06:27:59	2025-01-21 06:28:21
\.


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
2	Sam Banner	1741989851image0.jpeg	1	1	1	2024-12-02 10:17:12	2025-03-14 22:39:25	1	0	0	0	1	0	0	\N	\N
5	\N	174199215237687297-FC54-4CFD-8CEE-EDA836A68FBB.webp	1	1	0	2025-03-14 22:42:32	\N	4	0	0	0	1	0	0	\N	\N
6	\N	174199224474412FCD-8C93-4D63-8C71-64A867097FDE.webp	1	1	0	2025-03-14 22:44:04	\N	4	0	0	0	1	0	0	\N	\N
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
1	Privacy Policy	\N	1	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>	\N	\N	\N	\N	2025-01-20 17:04:03	2025-01-20 17:04:03
2	Terms and Conditions	\N	1	<p>Terms and Conditions</p>	\N	\N	\N	\N	2025-01-20 17:04:48	2025-01-20 17:04:48
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
4	2	David	0	101010101010	AABBCCDDEE	Ajman	/uploads/company/677cea4870442_1736239688.png	\N	1	17	2025-01-07 08:48:08	2025-01-07 08:48:08	AABB1212121212
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
20	fdsfdsfds	3232323232	0	\N	\N	\N	\N	\N	0	59	2025-01-15 09:37:34	2025-01-15 09:37:34	32323232323232323232323
1	Susan Silva	test Beneficiary	0	264213123123123	54567	Test Branch Name	\N	\N	1	4	2025-01-06 11:18:49	2025-01-21 06:31:06	asdsadasdasdasdasdasdad
3	1	test	0	876443323424234	54567	test	\N	\N	1	5	2025-01-07 07:05:51	2025-01-21 06:33:09	te644474312312312312312
2	Dubai	TomPay	0	101010101010342	AABBCCDD	Ajman	/uploads/company/677cce581abc1_1736232536.jpg	\N	1	16	2025-01-07 06:48:56	2025-01-21 06:34:59	AABB1010101010342342342
5	Dubai	Steve	0	101010101010242	AABBCCDDEE	Ajman	/uploads/company/677cec5da2828_1736240221.jpg	\N	1	18	2025-01-07 08:57:01	2025-01-21 06:37:03	AABB1212121212342342342
22	Dubai	\N	0	234234234234234	\N	\N	\N	\N	0	20	2025-01-21 06:44:53	2025-01-21 06:44:53	3asdasdasdasdasdasdasda
23	Dubai	\N	0	234242342342342	\N	\N	\N	\N	0	19	2025-01-21 06:47:10	2025-01-21 06:47:10	34234234234242424242434
24	Dubai	\N	0	423423423423423	\N	\N	\N	\N	0	29	2025-01-21 06:49:16	2025-01-21 06:49:16	42342342342342342342342
25	Dubai	\N	0	342342342342342	\N	\N	\N	\N	0	31	2025-01-21 06:50:50	2025-01-21 06:50:50	asdasdasdasdadadasdaasa
26	Dubai	\N	0	234234234234234	\N	\N	\N	\N	0	27	2025-01-21 06:53:38	2025-01-21 06:53:38	asdasdasdasdasdasdadasa
27	Dubai	\N	0	234234234234234	\N	\N	\N	\N	0	39	2025-01-21 06:55:09	2025-01-21 06:55:09	asdasdwadasdasdadaasdas
28	Dubai	\N	0	342342342342342	\N	\N	\N	\N	0	64	2025-01-21 06:56:40	2025-01-21 06:56:40	asdasdasdasdadadadadada
29	Dubai	\N	0	342342342342342	\N	\N	\N	\N	0	47	2025-01-21 06:58:09	2025-01-21 06:58:09	sadasdasdasdadasdadasas
21	aaasasasas	000000045464646	0	1111	\N	\N	\N	\N	0	62	2025-01-17 15:06:39	2025-03-19 23:42:50	00546546575756757457567
30	gfdhgfddfhgfds	987654567876543	0	111111111111111	\N	\N	\N	\N	0	91	2025-03-21 20:13:54	2025-03-28 19:23:05	98765456787654365432456
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
217	11	11	2	15	16	12d4d9f3ec83ed7c	2025-03-10 08:17:15	2025-03-10 08:17:18
126	29	30	1	65	0	327f7c636179c9b293ad91abb87b484b	2025-01-27 10:45:30	2025-01-27 10:45:30
127	29	30	1	66	0	2c241a22a8936c1e56a34d7690ddb12c	2025-01-27 11:31:34	2025-01-27 11:31:34
111	35	36	1	68	16	c948872a6eac9a75	2025-01-15 10:59:42	2025-02-12 20:40:47
231	26	27	1	88	30	6D714123-897F-4A51-8FD5-D72AE3FFC622	2025-03-11 09:30:20	2025-03-11 09:30:20
109	28	29	4	59	0	e311d18ec9c312840eaa531f0e18fb92	2025-01-15 10:28:09	2025-01-15 10:28:15
237	39	40	2	0	0	b7df55d8d48beb44e1a6ef34827b4d37	2025-03-12 08:28:28	2025-03-12 16:30:07
240	26	27	2	0	0	b7df55d8d48beb44e1a6ef34827b4d37	2025-03-12 16:29:42	2025-03-12 16:30:10
241	35	36	1	90	0	d64317e0dbbe4e77380420b3952719bd	2025-03-13 16:56:37	2025-03-13 16:56:37
242	18	18	1	0	0	b7df55d8d48beb44e1a6ef34827b4d37	2025-03-14 19:30:57	2025-03-14 19:30:57
243	29	30	1	0	0	b7df55d8d48beb44e1a6ef34827b4d37	2025-03-14 19:32:38	2025-03-14 19:32:38
244	35	36	1	0	0	02a51fc841d0d0014dd41fd32d700729	2025-03-24 05:39:40	2025-03-24 05:39:40
245	19	19	1	0	0	7d9fe5a1c2046851ff07f236e7d296ac	2025-03-24 05:41:44	2025-03-24 05:41:44
246	28	29	1	0	0	f42e2ee90dcfc009f4975614e910ec65	2025-03-24 05:50:18	2025-03-24 05:50:18
247	34	35	1	0	0	3af9fcb5b5579cd8cd90c52cd93f13cc	2025-04-03 09:44:06	2025-04-03 09:44:06
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
9	.	/uploads/category/67d4add9f194d_1741991385.png	/uploads/category/67875aebc2d66_1736923883.jpg	0	1	0	0	1	1	2025-01-13 07:17:30	2025-03-14 22:29:45	7	t	\N	\N	\N	t
17	.	/uploads/category/67d4adf331f0b_1741991411.png	\N	0	1	0	0	1	1	2025-01-15 11:04:04	2025-03-14 22:30:11	7	t	\N	\N	\N	\N
6	Baby Gift Sub	\N	\N	5	0	1	0	1	1	2024-07-02 10:55:29	2024-07-02 11:10:03	0	f	\N	\N	\N	f
13	.	/uploads/category/67d4ae0e616b0_1741991438.png	/uploads/category/67875aa01fa97_1736923808.jpg	0	1	0	0	1	1	2025-01-13 07:23:24	2025-03-14 22:30:38	7	t	\N	\N	\N	\N
2	ALL PRODUCTS	/uploads/category/677cc66ba1a4e_1736230507.png	/uploads/category/677cf04f3d67e_1736241231.jpg	0	0	1	0	1	1	2024-07-02 09:11:55	2025-01-15 05:05:04	7	t	\N	\N	\N	\N
5	NEW ARRIVAL	/uploads/category/677cc6bb17abf_1736230587.png	/uploads/category/677cf07492672_1736241268.jpg	0	0	1	0	1	1	2024-07-02 09:15:50	2025-01-15 05:05:12	7	t	\N	\N	\N	\N
7	Sama	/uploads/category/677ccbda3da34_1736231898.JPG	/uploads/category/677ccbda3e6d8_1736231898.png	2	0	1	0	1	1	2025-01-07 06:38:18	2025-01-07 09:11:58	7	f	\N	\N	\N	f
11	GIFTS FOR HIM	/uploads/category/67875b8ec13cf_1736924046.jpg	/uploads/category/67875b8ec170a_1736924046.jpg	0	1	0	0	1	1	2025-01-13 07:22:43	2025-01-15 06:54:18	7	f	\N	1	1	\N
10	VALENTINE'S GIFT	/uploads/category/67875c1e4c866_1736924190.jpg	/uploads/category/67875c1e4cc2d_1736924190.jpg	0	1	0	0	1	1	2025-01-13 07:18:05	2025-01-15 06:56:30	7	f	\N	1	1	\N
8	DECOR GIFTS	/uploads/category/67875c820761c_1736924290.jpg	/uploads/category/67875c8207a25_1736924290.jpg	0	1	0	0	1	1	2025-01-08 06:47:16	2025-01-15 06:58:10	7	f	\N	1	1	t
14	BIRTHDAY GIFTS	/uploads/category/67875d1a43d44_1736924442.jpg	/uploads/category/67875d1a4412f_1736924442.jpg	0	1	0	0	1	1	2025-01-15 07:00:42	2025-01-15 07:00:42	7	f	\N	1	1	\N
1	EXPLORE CLOTHES	/uploads/category/677e7860bb8f2_1736341600.jpg	/uploads/category/677e7860bba3e_1736341600.jpg	0	0	1	0	1	1	2024-07-02 09:11:24	2025-01-15 04:09:04	7	t	\N	\N	\N	\N
4	EXPLORE DECOR	/uploads/category/678759210bcc2_1736923425.jpg	/uploads/category/677cf0296ad04_1736241193.jpg	0	1	0	0	1	1	2024-07-02 09:15:20	2025-01-15 08:51:51	7	t	\N	\N	\N	t
15	Christmas Gift	/uploads/category/6787951c6cb40_1736938780.jpg	\N	0	1	0	0	1	1	2025-01-15 10:59:40	2025-01-15 10:59:40	7	f	\N	1	1	\N
16	Candle Treasures	/uploads/category/678795a9cc5e8_1736938921.jpg	\N	0	1	0	0	1	1	2025-01-15 11:02:01	2025-01-15 11:02:01	7	f	\N	1	1	\N
18	EXPLORE TOY ADVENTURE	/uploads/category/67879660658b0_1736939104.jpg	\N	0	1	0	0	1	1	2025-01-15 11:05:04	2025-01-15 11:05:04	7	t	\N	\N	\N	\N
3	.	/uploads/category/67d4adb31d0e1_1741991347.png	/uploads/category/677cf037205ee_1736241207.jpg	0	1	0	0	1	1	2024-07-02 09:14:22	2025-03-14 22:29:07	7	t	\N	\N	\N	\N
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

COPY public.contact_us (id, name, email, dial_code, mobile_number, message, created_at, updated_at, subject) FROM stdin;
\.


--
-- Data for Name: contact_us_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_us_settings (id, title_en, title_ar, email, mobile, desc_en, desc_ar, location, latitude, longitude, twitter, instagram, facebook, youtube, linkedin, created_at, updated_at, ref_discount, ref_discount_type, transport_website_link, pinterest, tiktok, whatsapp) FROM stdin;
1	Handwi	\N	info@example.com	+971123456789	\N	\N	55 Gallaxy Enque, 2568 steet, 23568 UAE	\N	\N	https://www.twitter.com/	https://www.instagram.com/	https://www.facebook.com/	https://www.youtube.com/	https://www.linkedin.com/	\N	2025-01-21 07:32:09	0	1	\N	https://www.pininterest.com/	https://www.tiktok.com/	+971123456789
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
5	50%OFF	50% Discount	2025-03-31 00:00:00	50	\N	\N	10	\N	10	0	1	0	50%OFF	1	2025-01-13	1	400	2025-01-13 08:33:29	2025-03-10 08:21:24
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
23	5	13
24	5	11
25	5	10
26	5	9
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
12	5	5	\N	\N
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
1	What Shipping Methods Are Available?	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.	1	1	1	2025-01-20 17:03:21	2025-01-20 17:03:21
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
124	59	I'm just starting to sell for the first time ever	2025-01-15 09:35:38	2025-01-15 09:35:38	t
125	59	Deciding what to sell	2025-01-15 09:35:38	2025-01-15 09:35:38	f
126	62	I'm just starting to sell for the first time ever	2025-01-17 14:59:51	2025-01-17 14:59:51	t
127	62	Deciding what to sell	2025-01-17 14:59:51	2025-01-17 14:59:51	f
128	63	I'm just starting to sell for the first time ever	2025-01-17 15:42:07	2025-01-17 15:42:07	t
129	63	Shop naming & branding	2025-01-17 15:42:07	2025-01-17 15:42:07	f
130	64	I'm just starting to sell for the first time ever	2025-01-18 16:32:17	2025-01-18 16:32:17	t
131	64	Selling online	2025-01-18 16:32:17	2025-01-18 16:32:17	f
132	91	I'm just starting to sell for the first time ever	2025-03-21 20:07:37	2025-03-21 20:07:37	t
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
18	best_seller_subtitle	TOP SALE IN THIS WEEK	2025-01-06 07:18:41	2025-01-06 07:18:41
21	banner_image	https://dxbitprojects.com/handwi/public/uploads/landing_page_images/1736147921_051504500003.jpg	2025-01-06 07:18:41	2025-01-06 07:18:41
22	sale_section_1_image	https://dxbitprojects.com/handwi/public/uploads/landing_page_images/1736147921_demo1-banner4.webp	2025-01-06 07:18:41	2025-01-06 07:18:41
23	sale_section_2_image	https://dxbitprojects.com/handwi/public/uploads/landing_page_images/1736147921_demo1-banner5.webp	2025-01-06 07:18:41	2025-01-06 07:18:41
17	best_seller_title	TRENDING NOW	2025-01-06 07:18:40	2025-01-15 10:32:43
19	latest_title	NEW ARRIVAL	2025-01-06 07:18:41	2025-01-15 10:32:43
20	latest_subtitle	SHOP THE LATEST	2025-01-06 07:18:41	2025-01-15 10:32:43
24	for_you_title	FOR YOU	2025-01-15 11:57:40	2025-01-15 11:57:40
25	for_you_subtitle	SHOP THE LATEST	2025-01-15 11:57:40	2025-01-15 11:57:40
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.likes (id, user_id, product_id, vendor_id, created_at, updated_at) FROM stdin;
97	74	0	4	2025-03-08 08:55:21	2025-03-08 08:55:21
100	74	37	0	2025-03-08 15:16:19	2025-03-08 15:16:19
101	76	37	0	2025-03-08 15:17:46	2025-03-08 15:17:46
105	74	0	17	2025-03-08 15:18:07	2025-03-08 15:18:07
106	74	30	0	2025-03-08 15:23:31	2025-03-08 15:23:31
12	13	21	0	2025-01-10 18:16:30	2025-01-10 18:16:30
108	72	0	17	2025-03-08 16:20:19	2025-03-08 16:20:19
109	72	37	0	2025-03-08 16:24:17	2025-03-08 16:24:17
111	72	0	18	2025-03-08 16:56:32	2025-03-08 16:56:32
112	79	19	0	2025-03-08 18:27:33	2025-03-08 18:27:33
19	33	31	0	2025-01-10 20:59:49	2025-01-10 20:59:49
21	33	30	0	2025-01-10 21:13:34	2025-01-10 21:13:34
23	33	25	0	2025-01-10 21:18:14	2025-01-10 21:18:14
26	33	15	0	2025-01-10 21:24:34	2025-01-10 21:24:34
28	33	14	0	2025-01-10 21:35:41	2025-01-10 21:35:41
30	33	29	0	2025-01-10 21:36:40	2025-01-10 21:36:40
31	33	16	0	2025-01-10 21:36:42	2025-01-10 21:36:42
32	33	28	0	2025-01-10 21:46:25	2025-01-10 21:46:25
121	79	26	0	2025-03-10 08:54:27	2025-03-10 08:54:27
123	79	16	0	2025-03-10 08:54:56	2025-03-10 08:54:56
39	15	2	0	2025-01-11 10:19:04	2025-01-11 10:19:04
40	15	16	0	2025-01-11 10:19:15	2025-01-11 10:19:15
41	15	0	50	2025-01-13 12:33:53	2025-01-13 12:33:53
44	33	0	17	2025-01-13 22:01:57	2025-01-13 22:01:57
46	15	0	17	2025-01-14 10:40:57	2025-01-14 10:40:57
47	9	0	17	2025-01-14 10:50:38	2025-01-14 10:50:38
48	58	28	0	2025-01-15 09:25:41	2025-01-15 09:25:41
49	58	29	0	2025-01-15 09:25:43	2025-01-15 09:25:43
50	58	0	30	2025-01-15 09:28:48	2025-01-15 09:28:48
51	14	0	5	2025-01-15 13:02:49	2025-01-15 13:02:49
52	14	0	30	2025-01-15 15:29:46	2025-01-15 15:29:46
53	14	38	0	2025-01-15 15:35:07	2025-01-15 15:35:07
54	14	33	0	2025-01-15 15:35:32	2025-01-15 15:35:32
55	14	32	0	2025-01-15 15:35:36	2025-01-15 15:35:36
56	68	37	0	2025-02-12 19:37:39	2025-02-12 19:37:39
57	68	30	0	2025-02-12 19:41:17	2025-02-12 19:41:17
58	68	34	0	2025-02-12 19:41:24	2025-02-12 19:41:24
64	70	38	0	2025-02-25 17:25:10	2025-02-25 17:25:10
72	70	45	0	2025-02-25 22:20:42	2025-02-25 22:20:42
73	72	30	0	2025-02-25 22:43:51	2025-02-25 22:43:51
75	70	34	0	2025-02-25 22:54:21	2025-02-25 22:54:21
76	70	43	0	2025-02-25 22:54:24	2025-02-25 22:54:24
77	70	41	0	2025-02-25 22:54:26	2025-02-25 22:54:26
80	70	44	0	2025-02-27 23:25:13	2025-02-27 23:25:13
81	70	8	0	2025-03-01 19:27:56	2025-03-01 19:27:56
84	72	0	5	2025-03-03 19:07:56	2025-03-03 19:07:56
90	70	0	17	2025-03-03 21:37:09	2025-03-03 21:37:09
91	70	0	30	2025-03-03 21:37:16	2025-03-03 21:37:16
93	14	0	4	2025-03-05 02:34:32	2025-03-05 02:34:32
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
335	2025_01_09_034309_vendor_follow	25
336	2025_03_19_090713_product_plocies2	25
337	2025_01_16_083825_create_wishlists_table	26
338	2025_01_17_160835_add_name_and_email_to_ratings_table	27
339	2025_01_20_203400_update_subject_nullable_in_contact_us_table	28
340	2025_01_21_051039_add_social_fields_to_contact_us_settings_table	29
341	2025_01_21_054129_create_aboutus_page_setting_table	29
342	2024_10_31_221947_create_report_reasons_table	30
343	2024_10_31_222021_create_reported_artists_table	30
344	2025_02_28_222021_create_vendor_messages_table	31
345	2025_03_19_090714_vendor_messages	32
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
1	hhhhlkhlhlkh	hi	1741680399Frame 1171275017.jpg	2025-03-11 08:06:00	\N	2	0
2	Public	Test	1741683415car-races-through-dark-blurred-motion-generative-ai_188544-12490.jpg	2025-03-11 08:56:00	\N	2	0
3	ljlkjlkj	lkhlhl	1741684879Frame 1171275016.jpg	2025-03-11 09:21:00	\N	2	0
4	Hello Congrates	Congrats	1741685606car-races-through-dark-blurred-motion-generative-ai_188544-12490.jpg	2025-03-11 09:33:00	\N	2	0
5	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,	Its title	1741685753Frame 1171275017.jpg	2025-03-11 09:35:00	\N	2	0
6	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,	Title	1741686230Frame 1171275015.jpg	2025-03-11 09:43:00	\N	2	0
7	Congrats Congrats Congrats Congrats Congrats	Congrats	1741687045car-races-through-dark-blurred-motion-generative-ai_188544-12490.jpg	2025-03-11 09:57:00	\N	2	0
8	Happy	Happy	1741687123car-races-through-dark-blurred-motion-generative-ai_188544-12490.jpg	2025-03-11 09:58:00	\N	2	0
9	CHappy	Happy1	1741687184car-races-through-dark-blurred-motion-generative-ai_188544-12490.jpg	2025-03-11 09:59:00	\N	2	0
10	Chapy	Chapy	1741687246car-races-through-dark-blurred-motion-generative-ai_188544-12490.jpg	2025-03-11 10:00:00	\N	2	0
11	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s	Celebrate	1741687301car-races-through-dark-blurred-motion-generative-ai_188544-12490.jpg	2025-03-11 10:01:00	\N	2	0
12	Beautiful car	Beautiful	1741687578car-races-through-dark-blurred-motion-generative-ai_188544-12490.jpg	2025-03-11 10:06:00	\N	2	0
13	Celebrations	Celebrations	1741688004car-races-through-dark-blurred-motion-generative-ai_188544-12490.jpg	2025-03-11 10:13:00	\N	2	0
14	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	Banner Notification	1741688163Frame 1171275014.jpg	2025-03-11 10:16:00	\N	2	0
\.


--
-- Data for Name: order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_products (id, order_id, product_id, product_attribute_id, product_type, quantity, price, discount, total, vendor_id, order_status, admin_commission, vendor_commission, shipping_charge) FROM stdin;
1	1	8	7	2	1	110	0	110	4	0	110	0	0
2	2	8	7	2	1	110	0	110	4	0	110	0	0
3	3	3	3	1	1	359	0	359	4	0	359	0	0
4	4	4	4	1	1	330	0	330	4	0	330	0	0
30	23	32	33	0	1	250	\N	250	0	0	\N	\N	\N
31	23	35	36	0	1	100	\N	100	0	0	\N	\N	\N
32	24	34	35	0	3	300	\N	900	0	0	\N	\N	\N
33	25	44	45	1	7	400	0	2800	5	0	2800	0	0
34	26	44	45	1	1	400	0	400	5	0	400	0	0
5	5	8	7	2	2	119	0	238	4	4	238	0	0
6	6	4	4	1	1	330	0	330	4	0	330	0	0
7	7	8	7	2	1	119	0	119	4	0	119	0	0
8	7	5	5	1	2	250	0	500	4	0	500	0	0
9	8	8	7	2	1	119	0	119	4	0	119	0	0
10	9	15	15	1	2	330	0	660	17	0	330	330	0
35	27	44	45	1	1	400	0	400	5	0	400	0	0
11	10	15	15	1	2	330	0	660	17	4	330	330	0
12	11	17	17	1	1	4000	0	4000	18	0	2000	2000	0
13	11	18	18	1	1	8000	0	8000	18	0	4000	4000	0
14	12	15	15	1	2	330	0	660	17	0	330	330	0
15	12	16	16	1	2	400	0	800	17	0	400	400	0
16	12	14	14	1	2	650	0	1300	17	0	650	650	0
17	13	20	20	1	1	7000	0	7000	18	0	3500	3500	0
40	29	26	27	1	1	500	0	500	30	0	300	200	0
19	15	21	21	2	6	85	0	510	17	4	255	255	0
41	29	29	30	1	1	250	0	250	17	0	125	125	0
42	29	27	28	1	1	500	0	500	18	0	250	250	0
43	29	28	29	1	1	250	0	250	18	0	125	125	0
18	14	13	13	1	2	300	0	600	16	4	360	240	0
20	16	18	18	1	1	8000	0	8000	18	0	4000	4000	0
21	17	33	34	0	1	250	\N	250	0	0	\N	\N	\N
22	17	27	28	0	1	500	\N	500	0	0	\N	\N	\N
23	18	32	33	0	1	250	\N	250	0	0	\N	\N	\N
24	19	17	17	1	1	4000	0	4000	18	0	2000	2000	0
44	29	20	20	1	1	7000	0	7000	18	0	3500	3500	0
45	30	44	45	1	2	400	0	800	5	0	800	0	0
46	30	32	33	1	2	250	0	500	5	0	500	0	0
47	30	38	39	1	12	1200	0	14400	30	0	8640	5760	0
48	31	29	30	1	1	250	0	250	17	0	125	125	0
49	31	28	29	1	1	250	0	250	18	0	125	125	0
25	20	15	15	1	1	330	0	330	17	4	165	165	0
26	20	20	20	1	2	7000	0	14000	18	4	7000	7000	0
50	31	27	28	1	1	500	0	500	18	0	250	250	0
27	21	32	33	0	3	250	\N	750	0	3	\N	\N	\N
54	33	48	49	1	3	400	0	1200	59	0	1200	0	0
55	33	8	7	2	1	119	0	119	4	0	119	0	0
56	33	2	2	1	1	500	0	500	4	0	500	0	0
28	22	24	25	1	1	400	0	400	30	4	240	160	0
29	22	38	39	1	1	1200	0	1200	30	4	720	480	0
57	34	44	45	1	1	400	0	400	5	0	400	0	0
58	35	30	31	1	1	250	0	250	30	0	150	100	0
59	35	26	27	1	2	500	0	1000	30	0	600	400	0
60	36	38	39	1	1	1200	0	1200	30	0	720	480	0
61	37	38	39	1	1	1200	0	1200	30	0	720	480	0
62	38	32	33	1	2	250	0	500	5	0	500	0	0
63	39	44	45	1	2	400	0	800	5	0	800	0	0
64	40	44	45	1	1	400	0	400	5	0	400	0	0
36	28	29	30	1	1	250	0	250	17	4	125	125	0
37	28	28	29	1	1	250	0	250	18	4	125	125	0
38	28	27	28	1	1	500	0	500	18	4	250	250	0
39	28	20	20	1	1	7000	0	7000	18	4	3500	3500	0
65	41	44	45	1	1	400	0	400	5	0	400	0	0
66	42	44	45	1	1	400	0	400	5	0	400	0	0
51	32	48	49	1	1	400	0	400	59	4	400	0	0
52	32	11	11	1	1	400	0	400	16	4	240	160	0
53	32	8	7	2	1	119	0	119	4	4	119	0	0
67	43	44	45	1	1	400	0	400	5	0	400	0	0
68	44	44	45	1	1	400	0	400	5	0	400	0	0
69	45	38	39	1	1	1200	0	1200	30	0	720	480	0
70	46	44	45	1	2	400	0	800	5	0	800	0	0
71	47	44	45	1	1	400	0	400	5	0	400	0	0
72	48	44	45	1	1	400	0	400	5	0	400	0	0
73	49	32	33	1	1	250	0	250	5	0	250	0	0
74	50	44	45	1	1	400	0	400	5	0	400	0	0
75	51	38	39	1	1	1200	0	1200	30	0	720	480	0
76	51	26	27	1	1	500	0	500	30	0	300	200	0
77	52	33	34	1	1	250	0	250	5	0	250	0	0
78	53	48	49	1	1	400	0	400	59	0	400	0	0
79	54	44	45	1	1	400	0	400	5	0	400	0	0
80	55	38	39	1	1	1200	0	1200	30	0	720	480	0
81	56	38	39	1	1	1200	0	1200	30	0	720	480	0
82	57	38	39	1	1	1200	0	1200	30	0	720	480	0
83	58	4	4	1	1	330	0	330	4	0	330	0	0
84	59	30	31	1	2	250	0	500	30	0	300	200	0
85	59	31	32	1	1	400	0	400	5	0	400	0	0
86	60	38	39	1	1	1200	0	1200	30	0	720	480	0
87	61	39	40	1	1	750	0	750	17	0	375	375	0
88	62	11	11	1	1	400	0	400	16	0	240	160	0
89	62	39	40	1	1	750	0	750	17	0	375	375	0
90	63	38	39	1	1	1200	0	1200	30	0	720	480	0
92	65	38	39	1	1	1200	0	1200	30	0	720	480	0
93	65	26	27	1	1	500	0	500	30	0	300	200	0
94	66	26	27	1	1	500	0	500	30	0	300	200	0
91	64	39	40	1	2	750	0	1500	17	4	750	750	0
95	67	39	40	1	1	750	0	750	17	0	375	375	0
96	67	34	35	1	3	300	0	900	5	0	900	0	0
97	68	32	33	1	1	250	0	250	5	0	250	0	0
98	68	34	35	1	1	300	0	300	5	0	300	0	0
99	68	26	27	1	1	500	0	500	30	0	300	200	0
100	68	11	11	1	1	400	0	400	16	0	240	160	0
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
23	22	1	2025-01-15 09:32:18	2025-01-15 09:32:18
24	22	2	2025-01-15 09:32:32	2025-01-15 09:32:32
25	22	3	2025-01-15 09:32:44	2025-01-15 09:32:44
26	22	4	2025-01-15 09:32:55	2025-01-15 09:32:55
27	28	1	2025-03-07 22:37:21	2025-03-07 22:37:21
28	28	2	2025-03-07 22:38:06	2025-03-07 22:38:06
29	28	3	2025-03-07 22:38:20	2025-03-07 22:38:20
30	28	4	2025-03-07 22:38:31	2025-03-07 22:38:31
31	32	1	2025-03-07 22:40:42	2025-03-07 22:40:42
32	32	2	2025-03-07 22:41:15	2025-03-07 22:41:15
33	32	3	2025-03-07 22:44:28	2025-03-07 22:44:28
34	32	4	2025-03-07 22:44:38	2025-03-07 22:44:38
35	64	1	2025-03-11 08:09:28	2025-03-11 08:09:28
36	64	2	2025-03-11 08:09:43	2025-03-11 08:09:43
37	64	3	2025-03-11 08:09:51	2025-03-11 08:09:51
38	64	4	2025-03-11 08:09:59	2025-03-11 08:09:59
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, invoice_id, user_id, address_id, total, vat, discount, grand_total, payment_mode, status, booking_date, total_qty, total_items_qty, oder_type, admin_commission, vendor_commission, shipping_charge, created_at, updated_at, is_muted, refund_method, refund_requested, refund_requested_date, order_no, ref_history_id, ref_code, withdraw_status, withdraw_request_at, vendor_id, admin_commission_per, vendor_commission_per, admin_commission_percentage, vendor_commission_percentage, activity_id, order_type, order_number, pick_up_date, pick_up_time, service_charge) FROM stdin;
11	15677d13a279d361736250274	15	7	12000	0	6000	6040	2	0	2025-01-07 11:44:55	2	2	0	3000	3000	40	2025-01-07 11:44:55	2025-01-16 04:15:12	0	0	0	\N	LC2025010711	0		0	\N	18	3000	3000	50	50	7	0	LC2025010711			0
1	9677bd27707f461736168055	9	2	110	0	0	110	2	0	2025-01-06 12:54:58	1	1	0	0	110	0	2025-01-06 12:54:58	2025-01-16 04:15:12	0	0	0	\N	LC202501061	0		0	\N	4	0	110	0	100	7	0	LC202501061			0
7	14677ce440be13b1736238144	14	10	619	0	0	619	2	0	2025-01-07 08:22:48	2	3	0	0	619	0	2025-01-07 08:22:48	2025-01-16 04:15:12	0	0	0	\N	LC202501077	0		0	\N	4	0	619	0	100	7	0	LC202501077			0
2	9677c0f48498181736183624	9	4	110	0	0	110	2	0	2025-01-06 17:14:02	1	1	0	0	110	0	2025-01-06 17:14:02	2025-01-16 04:15:12	0	0	0	\N	LC202501062	0		0	\N	4	0	110	0	100	7	0	LC202501062			0
3	9677c11db35d141736184283	9	4	359	0	0	359	2	0	2025-01-06 17:25:00	1	1	0	0	359	0	2025-01-06 17:25:00	2025-01-16 04:15:12	0	0	0	\N	LC202501063	0		0	\N	4	0	359	0	100	7	0	LC202501063			0
8	9677cec30d70ec1736240176	9	9	119	0	11.9	107.1	2	0	2025-01-07 08:56:33	1	1	0	0	107	0	2025-01-07 08:56:33	2025-01-16 04:15:12	0	0	0	\N	LC202501078	0		0	\N	4	0	107	0	100	7	0	LC202501078			0
21	\N	1	1	250	0	0	750	2	3	\N	0	0	0	0	0	0	2025-01-14 13:12:51	2025-01-16 04:15:12	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	1	678662d32ce67	2025-01-14 13:12:51	13:12	0
4	9677c1213cfb3b1736184339	9	4	330	0	0	330	2	0	2025-01-06 17:26:08	1	1	0	0	330	0	2025-01-06 17:26:08	2025-01-16 04:15:12	0	0	0	\N	LC202501064	0		0	\N	4	0	330	0	100	7	0	LC202501064			0
12	15677d1a8e85dda1736252046	15	11	2760	0	0	2785	2	0	2025-01-07 12:14:31	3	6	0	1380	1380	25	2025-01-07 12:14:31	2025-01-16 04:15:12	0	0	0	\N	LC2025010712	0		0	\N	17	1380	1380	50	50	7	0	LC2025010712			0
9	9677ced5c7acf01736240476	9	9	660	0	0	685	2	0	2025-01-07 09:01:32	1	2	0	330	330	25	2025-01-07 09:01:32	2025-01-16 04:15:12	0	0	0	\N	LC202501079	0		0	\N	17	330	330	50	50	7	0	LC202501079			0
15	9677e407c0829a1736327292	9	9	510	25.5	0	560.5	2	4	2025-01-08 09:09:00	1	6	0	255	280	25	2025-01-08 09:09:00	2025-01-16 04:15:12	0	0	0	\N	LC2025010815	0		0	\N	17	255	280	50	50	7	0	LC2025010815			0
20	967864fdb067a11736855515	9	9	14330	716.5	0	15046.5	2	4	2025-01-14 11:52:12	2	3	0	7165	7881	0	2025-01-14 11:52:12	2025-01-16 04:15:12	0	0	0	\N	LC2025011420	0		0	\N	18	7165	7881	50	50	7	0	LC2025011420			0
13	9677df7605bf3f1736308576	9	9	7000	350	700	6690	2	0	2025-01-08 03:56:34	1	1	0	3150	3500	40	2025-01-08 03:56:34	2025-01-16 04:15:12	0	0	0	\N	LC2025010813	0		0	\N	18	3150	3500	50	50	7	0	LC2025010813			0
5	15677cddd2a68e81736236498	15	7	238	0	0	238	2	4	2025-01-07 07:55:15	1	2	0	0	238	0	2025-01-07 07:55:15	2025-01-16 04:15:12	0	0	0	\N	LC202501075	0		0	\N	4	0	238	0	100	7	0	LC202501075			0
19	967863c44610021736850500	9	9	4000	200	0	4200	2	0	2025-01-14 10:28:38	1	1	0	2000	2200	0	2025-01-14 10:28:38	2025-01-16 04:15:12	0	0	0	\N	LC2025011419	0		0	\N	18	2000	2200	50	50	7	0	LC2025011419			0
6	15677ce391d45b31736237969	15	7	330	0	0	330	2	0	2025-01-07 08:19:52	1	1	0	0	330	0	2025-01-07 08:19:52	2025-01-16 04:15:12	0	0	0	\N	LC202501076	0		0	\N	4	0	330	0	100	7	0	LC202501076			0
10	9677cee303cd941736240688	9	9	660	0	0	685	2	4	2025-01-07 09:05:04	1	2	0	330	330	25	2025-01-07 09:05:04	2025-01-16 04:15:12	0	0	0	\N	LC2025010710	0		0	\N	17	330	330	50	50	7	0	LC2025010710			0
14	15677e14501b5d51736315984	15	11	600	30	0	680	2	4	2025-01-08 06:00:40	1	2	0	240	390	50	2025-01-08 06:00:40	2025-01-16 04:15:12	0	0	0	\N	LC2025010814	0		0	\N	16	240	390	40	60	7	0	LC2025010814			0
16	156784ffbbe6fdf1736769467	15	11	8000	400	0	8440	2	0	2025-01-13 11:58:05	1	1	0	4000	4400	40	2025-01-13 11:58:05	2025-01-16 04:15:12	0	0	0	\N	LC2025011316	0		0	\N	18	4000	4400	50	50	7	0	LC2025011316			0
17	\N	55	1	750	0	0	750	2	1	\N	0	0	0	0	0	0	2025-01-14 07:14:21	2025-01-16 04:15:12	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	1	67860ecd5bdb7	2025-01-14 07:14:21	07:14	0
18	\N	55	13	250	0	0	250	2	1	\N	0	0	0	0	0	0	2025-01-14 07:54:24	2025-01-16 04:15:12	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	1	67861830aa235	2025-01-14 07:54:24	07:54	0
22	5867877e05e64501736932869	58	15	1600	80	0	1680	2	4	2025-01-15 09:21:29	2	2	0	640	1040	0	2025-01-15 09:21:29	2025-01-16 04:15:12	0	0	0	\N	LC2025011522	0		0	\N	30	640	1040	40	60	7	0	LC2025011522			0
23	\N	58	15	350	17.5	0	367.5	2	1	\N	0	0	0	0	0	0	2025-01-15 09:43:58	2025-01-16 04:15:12	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	1	6787835eeb2e3	2025-01-15 09:43:58	09:43	0
24	\N	60	17	300	15	0	915	2	1	\N	0	0	0	0	0	0	2025-01-15 15:00:49	2025-01-16 04:15:12	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	1	6787cda17a623	2025-01-15 15:00:49	15:00	0
31	7067c784b28b8d71741128882	70	20	1000	50	0	1050	2	0	2025-03-04 22:55:00	3	3	0	500	550	0	2025-03-04 22:55:00	2025-03-14 21:51:02	0	0	0	\N	HA2025030431	0		0	\N	18	500	550	50	50	7	0	HA2025030431			0
25	7067c2405c267871740783708	70	21	2800	140	0	2940	2	0	2025-02-28 23:02:12	1	7	0	0	2940	0	2025-02-28 23:02:12	2025-03-14 21:51:02	0	0	0	\N	HA2025022825	0		0	\N	5	0	2940	0	100	7	0	HA2025022825			0
44	8467cce0634117d1741480035	84	33	400	20	0	420	2	0	2025-03-09 00:27:32	1	1	0	0	420	0	2025-03-09 00:27:32	2025-03-14 21:51:02	0	0	0	\N	HA2025030944	0		0	\N	5	0	420	0	100	7	0	HA2025030944			0
66	8867cfe2524c3311741677138	88	38	500	25	0	525	2	0	2025-03-11 07:12:38	1	1	0	200	325	0	2025-03-11 07:12:38	2025-03-14 21:51:02	0	0	0	\N	HA2025031166	0		0	\N	30	200	325	40	60	7	0	HA2025031166			0
67	8967d0012629d891741685030	89	39	1650	82.5	0	1732.5	2	0	2025-03-11 09:24:15	2	4	0	0	1732	0	2025-03-11 09:24:15	2025-03-14 21:51:02	0	0	0	\N	HA2025031167	0		0	\N	5	0	1732	0	100	7	0	HA2025031167			0
68	8967d02af96011e1741695737	89	39	1450	72.5	0	1522.5	2	0	2025-03-11 12:22:35	4	4	0	580	942	0	2025-03-11 12:22:35	2025-03-14 21:51:02	0	0	0	\N	HA2025031168	0		0	\N	16	580	942	40	60	7	0	HA2025031168			0
32	7067c8851bb863d1741194523	70	20	919	45.95	0	964.95	2	4	2025-03-05 17:09:04	3	3	0	0	964	0	2025-03-05 17:09:04	2025-03-24 06:28:19	1	0	0	\N	HA2025030532	0		0	\N	4	0	964	0	100	7	0	HA2025030532			0
28	7267c5fef6e71901741029110	72	18	8000	400	0	8400	2	4	2025-03-03 19:12:06	4	4	0	4000	4400	0	2025-03-03 19:12:06	2025-03-14 21:51:02	0	0	0	\N	HA2025030328	0		0	\N	18	4000	4400	50	50	7	0	HA2025030328			0
26	7367c361dc243281740857820	73	23	400	20	0	420	2	0	2025-03-01 19:37:20	1	1	0	0	420	0	2025-03-01 19:37:20	2025-03-14 21:51:02	0	0	0	\N	HA2025030126	0		0	\N	5	0	420	0	100	7	0	HA2025030126			0
30	7067c62bcaee4531741040586	70	21	15700	785	0	16485	2	0	2025-03-03 22:23:27	3	16	0	6280	10205	0	2025-03-03 22:23:27	2025-03-14 21:51:02	0	0	0	\N	HA2025030330	0		0	\N	30	6280	10205	40	60	7	0	HA2025030330			0
27	7267c5fe52bb5a31741028946	72	18	400	20	0	420	2	0	2025-03-03 19:10:56	1	1	0	0	420	0	2025-03-03 19:10:56	2025-03-14 21:51:02	0	0	0	\N	HA2025030327	0		0	\N	5	0	420	0	100	7	0	HA2025030327			0
29	7067c60db0acb811741032880	70	21	8500	425	0	8925	2	0	2025-03-03 20:14:59	5	5	0	4250	4675	0	2025-03-03 20:14:59	2025-03-14 21:51:02	0	0	0	\N	HA2025030329	0		0	\N	18	4250	4675	50	50	7	0	HA2025030329			0
34	7867c8b0f6c68511741205750	78	25	400	20	0	420	2	0	2025-03-05 20:16:06	1	1	0	0	420	0	2025-03-05 20:16:06	2025-03-14 21:51:02	0	0	0	\N	HA2025030534	0		0	\N	5	0	420	0	100	7	0	HA2025030534			0
35	7467c92067c96df1741234279	74	28	1250	62.5	0	1312.5	2	0	2025-03-06 04:11:36	2	3	0	500	812	0	2025-03-06 04:11:36	2025-03-14 21:51:02	0	0	0	\N	HA2025030635	0		0	\N	30	500	812	40	60	7	0	HA2025030635			0
36	7667c921fc149381741234684	76	29	1200	60	0	1260	2	0	2025-03-06 04:18:23	1	1	0	480	780	0	2025-03-06 04:18:23	2025-03-14 21:51:02	0	0	0	\N	HA2025030636	0		0	\N	30	480	780	40	60	7	0	HA2025030636			0
37	8167cc75cdf20c31741452749	81	30	1200	60	0	1260	2	0	2025-03-08 16:52:49	1	1	0	480	780	0	2025-03-08 16:52:49	2025-03-14 21:51:02	0	0	0	\N	HA2025030837	0		0	\N	30	480	780	40	60	7	0	HA2025030837			0
38	1567cc9ceedc6801741462766	15	7	500	25	0	525	2	0	2025-03-08 19:39:45	1	2	0	0	525	0	2025-03-08 19:39:45	2025-03-14 21:51:02	0	0	0	\N	HA2025030838	0		0	\N	5	0	525	0	100	7	0	HA2025030838			0
45	8567cce100982dc1741480192	85	34	1200	60	0	1260	2	0	2025-03-09 00:30:10	1	1	0	480	780	0	2025-03-09 00:30:10	2025-03-14 21:51:02	0	0	0	\N	HA2025030945	0		0	\N	30	480	780	40	60	7	0	HA2025030945			0
39	1567cc9d7bea6f41741462907	15	7	800	40	0	840	2	0	2025-03-08 19:42:05	1	2	0	0	840	0	2025-03-08 19:42:05	2025-03-14 21:51:02	0	0	0	\N	HA2025030839	0		0	\N	5	0	840	0	100	7	0	HA2025030839			0
59	7967cea4f4d1d271741595892	79	31	900	45	450	495	2	0	2025-03-10 08:38:37	2	3	0	0	495	0	2025-03-10 08:38:37	2025-03-14 21:51:02	0	0	0	\N	HA2025031059	0		0	\N	5	0	495	0	100	7	0	HA2025031059			0
40	8367ccd2469cd1e1741476422	83	32	400	20	0	420	2	0	2025-03-08 23:27:19	1	1	0	0	420	0	2025-03-08 23:27:19	2025-03-14 21:51:02	0	0	0	\N	HA2025030840	0		0	\N	5	0	420	0	100	7	0	HA2025030840			0
50	8167cce62506d051741481509	81	30	400	20	0	420	2	0	2025-03-09 00:52:07	1	1	0	0	420	0	2025-03-09 00:52:07	2025-03-14 21:51:02	0	0	0	\N	HA2025030950	0		0	\N	5	0	420	0	100	7	0	HA2025030950			0
46	8667cce4c27a94d1741481154	86	35	800	40	0	840	2	0	2025-03-09 00:46:11	1	2	0	0	840	0	2025-03-09 00:46:11	2025-03-14 21:51:02	0	0	0	\N	HA2025030946	0		0	\N	5	0	840	0	100	7	0	HA2025030946			0
41	8367ccdf1e5268d1741479710	83	32	400	20	0	420	2	0	2025-03-09 00:22:12	1	1	0	0	420	0	2025-03-09 00:22:12	2025-03-14 21:51:02	0	0	0	\N	HA2025030941	0		0	\N	5	0	420	0	100	7	0	HA2025030941			0
42	8367ccdf792daed1741479801	83	32	400	20	0	420	2	0	2025-03-09 00:23:38	1	1	0	0	420	0	2025-03-09 00:23:38	2025-03-14 21:51:02	0	0	0	\N	HA2025030942	0		0	\N	5	0	420	0	100	7	0	HA2025030942			0
47	8667cce50e0828b1741481230	86	35	400	20	0	420	2	0	2025-03-09 00:47:30	1	1	0	0	420	0	2025-03-09 00:47:30	2025-03-14 21:51:02	0	0	0	\N	HA2025030947	0		0	\N	5	0	420	0	100	7	0	HA2025030947			0
43	8367ccdfb3e3ddf1741479859	83	32	400	20	0	420	2	0	2025-03-09 00:24:45	1	1	0	0	420	0	2025-03-09 00:24:45	2025-03-14 21:51:02	0	0	0	\N	HA2025030943	0		0	\N	5	0	420	0	100	7	0	HA2025030943			0
54	8167ce3787483e71741567879	81	30	400	20	0	420	2	0	2025-03-10 00:51:52	1	1	0	0	420	0	2025-03-10 00:51:52	2025-03-14 21:51:02	0	0	0	\N	HA2025031054	0		0	\N	5	0	420	0	100	7	0	HA2025031054			0
51	5867cd105f7e1151741492319	58	15	1700	85	0	1785	2	0	2025-03-09 03:52:16	2	2	0	680	1105	0	2025-03-09 03:52:16	2025-03-14 21:51:02	0	0	0	\N	HA2025030951	0		0	\N	30	680	1105	40	60	7	0	HA2025030951			0
48	8667cce55437e2e1741481300	86	36	400	20	0	420	2	0	2025-03-09 00:48:37	1	1	0	0	420	0	2025-03-09 00:48:37	2025-03-14 21:51:02	0	0	0	\N	HA2025030948	0		0	\N	5	0	420	0	100	7	0	HA2025030948			0
56	8167ce68b0690e71741580464	81	30	1200	60	0	1260	2	0	2025-03-10 04:26:11	1	1	0	480	780	0	2025-03-10 04:26:11	2025-03-14 21:51:02	0	0	0	\N	HA2025031056	0		0	\N	30	480	780	40	60	7	0	HA2025031056			0
49	8667cce5babfb041741481402	86	36	250	12.5	0	262.5	2	0	2025-03-09 00:50:21	1	1	0	0	262	0	2025-03-09 00:50:21	2025-03-14 21:51:02	0	0	0	\N	HA2025030949	0		0	\N	5	0	262	0	100	7	0	HA2025030949			0
52	5867cd1105aeac11741492485	58	15	250	12.5	0	262.5	2	0	2025-03-09 03:55:06	1	1	0	0	262	0	2025-03-09 03:55:06	2025-03-14 21:51:02	0	0	0	\N	HA2025030952	0		0	\N	5	0	262	0	100	7	0	HA2025030952			0
55	8167ce6204bea4d1741578756	81	30	1200	60	0	1260	2	0	2025-03-10 03:54:04	1	1	0	480	780	0	2025-03-10 03:54:04	2025-03-14 21:51:02	0	0	0	\N	HA2025031055	0		0	\N	30	480	780	40	60	7	0	HA2025031055			0
58	8767ce7327b98121741583143	87	37	330	16.5	0	346.5	2	0	2025-03-10 05:06:02	1	1	0	0	346	0	2025-03-10 05:06:02	2025-03-14 21:51:02	0	0	0	\N	HA2025031058	0		0	\N	4	0	346	0	100	7	0	HA2025031058			0
57	8367ce6c311115d1741581361	83	32	1200	60	0	1260	2	0	2025-03-10 04:36:29	1	1	0	480	780	0	2025-03-10 04:36:29	2025-03-14 21:51:02	0	0	0	\N	HA2025031057	0		0	\N	30	480	780	40	60	7	0	HA2025031057			0
62	7467cfbcbc569061741667516	74	28	1150	57.5	0	1207.5	2	0	2025-03-11 04:32:16	2	2	0	575	632	0	2025-03-11 04:32:16	2025-03-14 21:51:02	0	0	0	\N	HA2025031162	0		0	\N	17	575	632	50	50	7	0	HA2025031162			0
60	8367ceb015237c01741598741	83	32	1200	60	0	1260	2	0	2025-03-10 09:26:00	1	1	0	480	780	0	2025-03-10 09:26:00	2025-03-14 21:51:02	0	0	0	\N	HA2025031060	0		0	\N	30	480	780	40	60	7	0	HA2025031060			0
61	8367cf4f654bd5a1741639525	83	32	750	37.5	0	787.5	2	0	2025-03-10 20:45:49	1	1	0	375	412	0	2025-03-10 20:45:49	2025-03-14 21:51:02	0	0	0	\N	HA2025031061	0		0	\N	17	375	412	50	50	7	0	HA2025031061			0
63	8367cfcef60d0431741672182	83	32	1200	60	0	1260	2	0	2025-03-11 05:50:09	1	1	0	480	780	0	2025-03-11 05:50:09	2025-03-14 21:51:02	0	0	0	\N	HA2025031163	0		0	\N	30	480	780	40	60	7	0	HA2025031163			0
64	7467cfd9510b7651741674833	74	28	1500	75	0	1575	2	4	2025-03-11 06:34:10	1	2	0	750	825	0	2025-03-11 06:34:10	2025-03-14 21:51:02	0	0	0	\N	HA2025031164	0		0	\N	17	750	825	50	50	7	0	HA2025031164			0
65	8867cfe0b2c91631741676722	88	38	1700	85	0	1785	2	0	2025-03-11 07:05:44	2	2	0	680	1105	0	2025-03-11 07:05:44	2025-03-14 21:51:02	0	0	0	\N	HA2025031165	0		0	\N	30	680	1105	40	60	7	0	HA2025031165			0
53	5867cd1131479b81741492529	58	15	400	20	0	420	2	0	2025-03-09 03:55:45	1	1	0	0	420	0	2025-03-09 03:55:45	2025-03-24 06:28:19	1	0	0	\N	HA2025030953	0		0	\N	59	0	420	0	100	0	0	HA2025030953			0
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
31	5867877e05e64501736932869	A	58	5867877e05e64501736932869	1680.00	1	80.00	0.00	2025-01-15 09:21:10	2025-01-15 09:21:29
32	7067c23c3cc1eb21740782652	P	70	7067c23c3cc1eb21740782652	420.00	1	20.00	0.00	2025-02-28 22:44:13	\N
33	7067c2405c267871740783708	A	70	7067c2405c267871740783708	2940.00	1	140.00	0.00	2025-02-28 23:01:48	2025-02-28 23:02:12
34	7067c35fce323531740857294	P	70	7067c35fce323531740857294	249.90	1	11.90	0.00	2025-03-01 19:28:14	\N
35	7367c361dc243281740857820	A	73	7367c361dc243281740857820	420.00	1	20.00	0.00	2025-03-01 19:37:00	2025-03-01 19:37:20
36	7267c5fe52bb5a31741028946	A	72	7267c5fe52bb5a31741028946	420.00	1	20.00	0.00	2025-03-03 19:09:07	2025-03-03 19:10:56
37	7267c5fef6e71901741029110	A	72	7267c5fef6e71901741029110	8400.00	1	400.00	0.00	2025-03-03 19:11:51	2025-03-03 19:12:06
38	7067c60db0acb811741032880	A	70	7067c60db0acb811741032880	8925.00	1	425.00	0.00	2025-03-03 20:14:41	2025-03-03 20:14:59
39	7067c62bcaee4531741040586	A	70	7067c62bcaee4531741040586	16485.00	1	785.00	0.00	2025-03-03 22:23:07	2025-03-03 22:23:27
40	7267c78241de4891741128257	P	72	7267c78241de4891741128257	420.00	1	20.00	0.00	2025-03-04 22:44:18	\N
41	7067c784b28b8d71741128882	A	70	7067c784b28b8d71741128882	1050.00	1	50.00	0.00	2025-03-04 22:54:43	2025-03-04 22:55:00
42	1467c8188fccafd1741166735	P	14	1467c8188fccafd1741166735	1260.00	1	60.00	0.00	2025-03-05 09:25:36	\N
43	7067c8851bb863d1741194523	A	70	7067c8851bb863d1741194523	964.95	1	45.95	0.00	2025-03-05 17:08:44	2025-03-05 17:09:04
44	7767c8b064a8bd61741205604	A	77	7767c8b064a8bd61741205604	1909.95	1	90.95	0.00	2025-03-05 20:13:25	2025-03-05 20:13:41
45	7867c8b0f6c68511741205750	A	78	7867c8b0f6c68511741205750	420.00	1	20.00	0.00	2025-03-05 20:15:51	2025-03-05 20:16:06
46	7467c91b838e46e1741233027	P	74	7467c91b838e46e1741233027	1312.50	1	62.50	0.00	2025-03-06 03:50:28	\N
47	7467c91b9b6cf931741233051	P	74	7467c91b9b6cf931741233051	1312.50	1	62.50	0.00	2025-03-06 03:50:51	\N
48	7467c92067c96df1741234279	A	74	7467c92067c96df1741234279	1312.50	1	62.50	0.00	2025-03-06 04:11:20	2025-03-06 04:11:36
49	7667c921fc149381741234684	A	76	7667c921fc149381741234684	1260.00	1	60.00	0.00	2025-03-06 04:18:04	2025-03-06 04:18:23
50	8167cc75cdf20c31741452749	A	81	8167cc75cdf20c31741452749	1260.00	1	60.00	0.00	2025-03-08 16:52:30	2025-03-08 16:52:49
51	7967cc75ef24e1e1741452783	P	79	7967cc75ef24e1e1741452783	210.00	1	10.00	0.00	2025-03-08 16:53:03	\N
52	7267cc762dbaacb1741452845	P	72	7267cc762dbaacb1741452845	945.00	1	45.00	0.00	2025-03-08 16:54:06	\N
53	7267cc7642da9631741452866	P	72	7267cc7642da9631741452866	210.00	1	10.00	0.00	2025-03-08 16:54:27	\N
54	7967cc8c345f86f1741458484	P	79	7967cc8c345f86f1741458484	16800.00	1	800.00	0.00	2025-03-08 18:28:04	\N
55	1567cc9ceedc6801741462766	A	15	1567cc9ceedc6801741462766	525.00	1	25.00	0.00	2025-03-08 19:39:27	2025-03-08 19:39:45
56	1567cc9d7bea6f41741462907	A	15	1567cc9d7bea6f41741462907	840.00	1	40.00	0.00	2025-03-08 19:41:48	2025-03-08 19:42:05
57	8367ccd2469cd1e1741476422	A	83	8367ccd2469cd1e1741476422	420.00	1	20.00	0.00	2025-03-08 23:27:03	2025-03-08 23:27:19
58	8367ccdf1e5268d1741479710	A	83	8367ccdf1e5268d1741479710	420.00	1	20.00	0.00	2025-03-09 00:21:50	2025-03-09 00:22:12
59	8367ccdf792daed1741479801	A	83	8367ccdf792daed1741479801	420.00	1	20.00	0.00	2025-03-09 00:23:21	2025-03-09 00:23:38
60	8367ccdfb3e3ddf1741479859	A	83	8367ccdfb3e3ddf1741479859	420.00	1	20.00	0.00	2025-03-09 00:24:20	2025-03-09 00:24:45
61	8467cce0634117d1741480035	A	84	8467cce0634117d1741480035	420.00	1	20.00	0.00	2025-03-09 00:27:15	2025-03-09 00:27:32
62	8567cce100982dc1741480192	A	85	8567cce100982dc1741480192	1260.00	1	60.00	0.00	2025-03-09 00:29:53	2025-03-09 00:30:10
63	8667cce4c27a94d1741481154	A	86	8667cce4c27a94d1741481154	840.00	1	40.00	0.00	2025-03-09 00:45:54	2025-03-09 00:46:11
64	8667cce50e0828b1741481230	A	86	8667cce50e0828b1741481230	420.00	1	20.00	0.00	2025-03-09 00:47:10	2025-03-09 00:47:30
65	8667cce55437e2e1741481300	A	86	8667cce55437e2e1741481300	420.00	1	20.00	0.00	2025-03-09 00:48:20	2025-03-09 00:48:37
66	8667cce5babfb041741481402	A	86	8667cce5babfb041741481402	262.50	1	12.50	0.00	2025-03-09 00:50:03	2025-03-09 00:50:21
67	8167cce62506d051741481509	A	81	8167cce62506d051741481509	420.00	1	20.00	0.00	2025-03-09 00:51:49	2025-03-09 00:52:07
68	5867cd105f7e1151741492319	A	58	5867cd105f7e1151741492319	1785.00	1	85.00	0.00	2025-03-09 03:51:59	2025-03-09 03:52:16
69	5867cd1105aeac11741492485	A	58	5867cd1105aeac11741492485	262.50	1	12.50	0.00	2025-03-09 03:54:46	2025-03-09 03:55:06
70	5867cd1131479b81741492529	A	58	5867cd1131479b81741492529	420.00	1	20.00	0.00	2025-03-09 03:55:29	2025-03-09 03:55:45
71	7467cd2ddf7a5661741499871	P	74	7467cd2ddf7a5661741499871	420.00	1	20.00	0.00	2025-03-09 05:57:51	\N
72	7467cd2ded4777f1741499885	P	74	7467cd2ded4777f1741499885	420.00	1	20.00	0.00	2025-03-09 05:58:05	\N
73	8167ce3787483e71741567879	A	81	8167ce3787483e71741567879	420.00	1	20.00	0.00	2025-03-10 00:51:19	2025-03-10 00:51:52
74	8167ce6204bea4d1741578756	A	81	8167ce6204bea4d1741578756	1260.00	1	60.00	0.00	2025-03-10 03:52:37	2025-03-10 03:54:04
75	8167ce62a0870281741578912	P	81	8167ce62a0870281741578912	1260.00	1	60.00	0.00	2025-03-10 03:55:13	\N
76	8167ce68b0690e71741580464	A	81	8167ce68b0690e71741580464	1260.00	1	60.00	0.00	2025-03-10 04:21:04	2025-03-10 04:26:11
77	8367ce6c311115d1741581361	A	83	8367ce6c311115d1741581361	1260.00	1	60.00	0.00	2025-03-10 04:36:01	2025-03-10 04:36:29
78	8767ce7327b98121741583143	A	87	8767ce7327b98121741583143	346.50	1	16.50	0.00	2025-03-10 05:05:44	2025-03-10 05:06:02
79	7967cea4f4d1d271741595892	A	79	7967cea4f4d1d271741595892	495.00	1	45.00	0.00	2025-03-10 08:38:13	2025-03-10 08:38:37
80	8367ceb015237c01741598741	A	83	8367ceb015237c01741598741	1260.00	1	60.00	0.00	2025-03-10 09:25:41	2025-03-10 09:26:00
81	8367cf4f654bd5a1741639525	A	83	8367cf4f654bd5a1741639525	787.50	1	37.50	0.00	2025-03-10 20:45:25	2025-03-10 20:45:49
82	7467cfbcbc569061741667516	A	74	7467cfbcbc569061741667516	1207.50	1	57.50	0.00	2025-03-11 04:31:56	2025-03-11 04:32:16
83	8367cfcef60d0431741672182	A	83	8367cfcef60d0431741672182	1260.00	1	60.00	0.00	2025-03-11 05:49:42	2025-03-11 05:50:09
84	7467cfd9510b7651741674833	A	74	7467cfd9510b7651741674833	1575.00	1	75.00	0.00	2025-03-11 06:33:53	2025-03-11 06:34:10
85	8867cfe0b2c91631741676722	A	88	8867cfe0b2c91631741676722	1785.00	1	85.00	0.00	2025-03-11 07:05:23	2025-03-11 07:05:44
86	8867cfe2524c3311741677138	A	88	8867cfe2524c3311741677138	525.00	1	25.00	0.00	2025-03-11 07:12:18	2025-03-11 07:12:38
87	8967d0012629d891741685030	A	89	8967d0012629d891741685030	1732.50	1	82.50	0.00	2025-03-11 09:23:51	2025-03-11 09:24:15
88	8967d02af96011e1741695737	A	89	8967d02af96011e1741695737	1522.50	1	72.50	0.00	2025-03-11 12:22:17	2025-03-11 12:22:35
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
120	App\\Models\\User	15	Personal Access Token	9e0138c81370f469e921da0da5f3bbfc0e0e35699406ca99014a38174e507d68	["*"]	\N	2025-01-15 09:08:50	2025-01-15 09:08:50
121	App\\Models\\User	58	Personal Access Token	e410ef3b29c10a90f7050773f10e4664e348974e8c1887db213036cb70aaebcf	["*"]	\N	2025-01-15 09:18:43	2025-01-15 09:18:43
122	App\\Models\\User	58	Personal Access Token	b204f66a7046acb2ed531c27445ab2e3c987ff2139d60988e380868842384727	["*"]	\N	2025-01-15 09:18:44	2025-01-15 09:18:44
123	App\\Models\\User	9	Personal Access Token	492bfcde1ebba0b89eeecf2f4ddc68bb1e69ced79e79da59dbbe9b253f4a3db5	["*"]	\N	2025-01-15 10:26:15	2025-01-15 10:26:15
124	App\\Models\\User	15	Personal Access Token	72b2b9e0e7a1ac3b25895e3e2ed1091e6244a0abaa5549fa8d5aaeaa55dae5b3	["*"]	\N	2025-01-15 11:23:07	2025-01-15 11:23:07
125	App\\Models\\User	15	Personal Access Token	f31c116ca7e47f2add28927e6633bf34ee1eee840114e60912c17bf483f392e9	["*"]	\N	2025-01-15 12:50:15	2025-01-15 12:50:15
126	App\\Models\\User	15	Personal Access Token	210ce316144dae807bd941f38b02f8054139609a6ddba39a36747e5c2551641b	["*"]	\N	2025-01-15 12:55:43	2025-01-15 12:55:43
127	App\\Models\\User	14	Personal Access Token	f2285a952769ee60eb68617655b031112ef875e4616109fcc26035e3c0f7c0c4	["*"]	\N	2025-01-15 13:01:57	2025-01-15 13:01:57
128	App\\Models\\User	9	Personal Access Token	05265212021cc6842d9d598dedd5a6f215ff181ce388ce5f6510e33f0e3474f9	["*"]	\N	2025-01-15 15:41:19	2025-01-15 15:41:19
129	App\\Models\\User	9	Personal Access Token	5eb8829415272fecfd9d66ffb8ddc522a4140799271dee56a0ba804d8fd1a2bf	["*"]	\N	2025-01-16 06:52:07	2025-01-16 06:52:07
130	App\\Models\\User	15	Personal Access Token	6280ee36a112f3eddc1b6e25ae69731783176fbab43ccdb556f9eb64030e63e8	["*"]	\N	2025-01-16 07:50:31	2025-01-16 07:50:31
131	App\\Models\\User	13	Personal Access Token	88d67f8c28f5b71554cafbff069de77b0bc6e74fcfe2b5986f00dad42e042a6d	["*"]	\N	2025-01-16 15:19:22	2025-01-16 15:19:22
132	App\\Models\\User	67	Personal Access Token	8bcf328a98d7858f24bd61b646e049f2abc494117f13f40ec57ed6490cbf5468	["*"]	\N	2025-02-07 15:57:27	2025-02-07 15:57:27
133	App\\Models\\User	67	Personal Access Token	e77e4d5f72e8942b930db5c84e1c558918fc9d8a21c9d5dc9ed8e70c6b7adbb3	["*"]	\N	2025-02-07 15:57:28	2025-02-07 15:57:28
134	App\\Models\\User	67	Personal Access Token	2e86923508544b7abc2e68f3b0403d340f86bc2054b0255656f28596b7c6a198	["*"]	\N	2025-02-07 15:57:58	2025-02-07 15:57:58
135	App\\Models\\User	12	Personal Access Token	fe0587a64d713e27f9a4cb0fdf01dfead62ce9ec045d7f92cf24c964529c2d7e	["*"]	\N	2025-02-11 08:14:18	2025-02-11 08:14:18
136	App\\Models\\User	68	Personal Access Token	b1237e6652a1c39616fc17f3f98188f0a7c497a36f526b6bad29ecc3240760b7	["*"]	\N	2025-02-11 19:22:36	2025-02-11 19:22:36
137	App\\Models\\User	68	Personal Access Token	3e69b84e99163029d0a07ce0b079412edb25567de472235dbb3a2aa6bab1e108	["*"]	\N	2025-02-11 19:22:37	2025-02-11 19:22:37
138	App\\Models\\User	69	Personal Access Token	baa7705461bb65c23c8aadb3c0a081b0a1167c71677dcfa9883e308ac8dd4677	["*"]	\N	2025-02-11 19:28:36	2025-02-11 19:28:36
139	App\\Models\\User	69	Personal Access Token	abd38aa3d25869009cda6d2a0163242b45962685b6e55c73a1f5cd21aa0bc319	["*"]	\N	2025-02-11 19:28:37	2025-02-11 19:28:37
140	App\\Models\\User	68	Personal Access Token	69615e9754fed017f95ead4a4f083ac821ba5727feb2b69f925cc05f5dd1cedc	["*"]	\N	2025-02-12 19:35:06	2025-02-12 19:35:06
141	App\\Models\\User	68	Personal Access Token	f2c65798325d2e64561a309497cec47ee5c5fd1a536fcf4e29c3c9b124079199	["*"]	\N	2025-02-12 20:40:47	2025-02-12 20:40:47
142	App\\Models\\User	68	Personal Access Token	7c8198c07c5a49c0254571a03abd50a1001df3addda5d566f716c0cc6633e550	["*"]	\N	2025-02-12 20:58:03	2025-02-12 20:58:03
143	App\\Models\\User	68	Personal Access Token	4c8f86ba5bbf8525d631069e2d6d80efd3baee6498bd0b7b3221c1ea68f61c90	["*"]	\N	2025-02-13 08:28:12	2025-02-13 08:28:12
144	App\\Models\\User	15	Personal Access Token	6ad93d3ae274d7599554929ea415cf72925814421f488dcd69baeb00f70528ac	["*"]	\N	2025-02-13 08:33:27	2025-02-13 08:33:27
145	App\\Models\\User	70	Personal Access Token	c1ffedf81eee4305e6707c1e8e7ca315dc8fde13cb852d0cc2895dc18d69a633	["*"]	\N	2025-02-13 08:39:50	2025-02-13 08:39:50
146	App\\Models\\User	70	Personal Access Token	2b9019f610ea6c1088cb3f0cf0e55f21cc92e7ce7479c38d36b1f39606dbe71b	["*"]	\N	2025-02-13 08:39:50	2025-02-13 08:39:50
147	App\\Models\\User	71	Personal Access Token	224559ce94ef6810cc13f7fb8d5dd12e3671dbef43e2096d9cc3120b2548daa1	["*"]	\N	2025-02-14 14:04:22	2025-02-14 14:04:22
148	App\\Models\\User	71	Personal Access Token	6f2fdaa86adb028486918b057aec7d3c7a526ad0da77d6cc0a99b66f37745c02	["*"]	\N	2025-02-14 14:04:22	2025-02-14 14:04:22
149	App\\Models\\User	70	Personal Access Token	48b0c92207e33aca71238921ad04f2fd368a33731e13f6f8ae989cbde4367006	["*"]	\N	2025-02-25 15:52:44	2025-02-25 15:52:44
150	App\\Models\\User	70	Personal Access Token	2729acdeec7f83c93125705af7fa887dcb09920ef257a80035fd54cee6352713	["*"]	\N	2025-02-25 16:21:43	2025-02-25 16:21:43
151	App\\Models\\User	72	Personal Access Token	d29cfaa11e8e84d70960028f1b6836b3f81410dc28cb630fae35c8e350b5c071	["*"]	\N	2025-02-25 16:34:32	2025-02-25 16:34:32
152	App\\Models\\User	72	Personal Access Token	cda463d2b933f1bc89607c4b224e5b8b86dcd40d257506e4fa51f04a9cfa8668	["*"]	\N	2025-02-25 16:34:32	2025-02-25 16:34:32
153	App\\Models\\User	70	Personal Access Token	aae5302eae5c65f4760b11fd584254001de1632d43299ef485530a5799bd29d5	["*"]	\N	2025-02-25 22:05:25	2025-02-25 22:05:25
154	App\\Models\\User	70	Personal Access Token	df3f66cd4e73be5137966af9bdde833315308cb291cb6631ef989779594e2eed	["*"]	\N	2025-02-26 08:06:59	2025-02-26 08:06:59
155	App\\Models\\User	70	Personal Access Token	2a12630693ef719af65ef88cf475d1e27caac3e600b733456f843e4b425898af	["*"]	\N	2025-02-26 16:37:13	2025-02-26 16:37:13
156	App\\Models\\User	70	Personal Access Token	e86d8ae0b18059a60143b6ca67298944cc25818906e91af2996252e857e574bc	["*"]	\N	2025-02-26 22:06:36	2025-02-26 22:06:36
157	App\\Models\\User	70	Personal Access Token	c60d0a855ebdb627609fe4149bfb834e714d3f59947fdbe7763189eea4b6767e	["*"]	\N	2025-02-27 15:39:41	2025-02-27 15:39:41
158	App\\Models\\User	70	Personal Access Token	739c5e4d3f68fc92a110ff667692a25deaae0e7f1f43021cb77bd84c947a66a3	["*"]	\N	2025-02-27 23:08:31	2025-02-27 23:08:31
159	App\\Models\\User	70	Personal Access Token	0041b29ba7d6c0d4adcb8798b172a9c2f50e947bffae187543bd6ed1f3ee6fab	["*"]	\N	2025-02-28 21:06:02	2025-02-28 21:06:02
160	App\\Models\\User	70	Personal Access Token	927254cbe3cc875f028bc06be9819d06daf5def0943106c6054aedbe239897da	["*"]	\N	2025-02-28 23:07:18	2025-02-28 23:07:18
161	App\\Models\\User	70	Personal Access Token	96bf8776ca3ea43b012a732223cec3cf3344d2f7d02cf25a08f0d9bf482fbbc2	["*"]	\N	2025-03-01 19:22:14	2025-03-01 19:22:14
162	App\\Models\\User	73	Personal Access Token	e98c0b9e3986765dfb4a4dba6a9ee96a73e158c2072ca5425dad088d0e8bd55d	["*"]	\N	2025-03-01 19:35:03	2025-03-01 19:35:03
163	App\\Models\\User	73	Personal Access Token	8719853e2c44246f660c372dbeb817267b0639edd5198229857dd9a437f58819	["*"]	\N	2025-03-01 19:35:03	2025-03-01 19:35:03
164	App\\Models\\User	70	Personal Access Token	e0e675067a302fb429d5d8d3046e9f4e2a6aeacbfccb89f0e5bce18e48e4b5ba	["*"]	\N	2025-03-03 19:08:30	2025-03-03 19:08:30
165	App\\Models\\User	70	Personal Access Token	f9cbed18b166826c4e5a85e5b3394621b943d8bdf87ba106c20238938e3b2750	["*"]	\N	2025-03-03 22:24:37	2025-03-03 22:24:37
166	App\\Models\\User	70	Personal Access Token	619be70a98219e4741ab83ad2bc3f51bb96bb130277a9dfd3c647c731af3d0a3	["*"]	\N	2025-03-03 22:25:17	2025-03-03 22:25:17
167	App\\Models\\User	70	Personal Access Token	fb246b94993ac3517ac80235998960590dad14eb51d04a842f653c2c71e17f1c	["*"]	\N	2025-03-03 22:30:14	2025-03-03 22:30:14
168	App\\Models\\User	74	Personal Access Token	f5509687d9af592f6a728f9bd36eb4797f767f1547c9dbb2a714119b2a26afc9	["*"]	\N	2025-03-04 02:46:53	2025-03-04 02:46:53
169	App\\Models\\User	74	Personal Access Token	c0b6fe03cab55dd0d667e1d000a315d0dfd5ec4c9011ac11f16dacddeee95f65	["*"]	\N	2025-03-04 02:46:53	2025-03-04 02:46:53
170	App\\Models\\User	74	Personal Access Token	3834167b804e776b91c2506591dbb718af9f80c32c584dad947fda43401863f0	["*"]	\N	2025-03-04 02:51:26	2025-03-04 02:51:26
171	App\\Models\\User	75	Personal Access Token	21e33bcc1461b9e601d83c5744353387900358fde8c97a805465a17beb6034e1	["*"]	\N	2025-03-04 18:40:26	2025-03-04 18:40:26
172	App\\Models\\User	75	Personal Access Token	6f45f5c31f0ab9aa9c12b26b9a3656538a389849fc9a0f84c72e3a10fedaff7f	["*"]	\N	2025-03-04 18:40:26	2025-03-04 18:40:26
173	App\\Models\\User	72	Personal Access Token	733f3b0b306d49d80d9ae0bfa34e229ed00f6c1d9f03023b1c169d6b9c374f21	["*"]	\N	2025-03-04 18:54:03	2025-03-04 18:54:03
174	App\\Models\\User	70	Personal Access Token	21ebb7319935a6815c41a598771f05faf3b4adf93dd5ca3c42b1f387f05ebe1b	["*"]	\N	2025-03-04 22:18:09	2025-03-04 22:18:09
175	App\\Models\\User	74	Personal Access Token	1769b51899aa76baee98acf086755c3087e2be98615737f0982997b4d89c6944	["*"]	\N	2025-03-05 08:38:23	2025-03-05 08:38:23
176	App\\Models\\User	76	Personal Access Token	e1936d8949abbfb194c26d08490c41000ed18a039774498c5b296a4953c6f4ac	["*"]	\N	2025-03-05 09:27:24	2025-03-05 09:27:24
177	App\\Models\\User	76	Personal Access Token	fe18390561865ca0b283d58c07f0d63530741d4f6d947ada9e87101afaf6b287	["*"]	\N	2025-03-05 09:27:24	2025-03-05 09:27:24
178	App\\Models\\User	77	Personal Access Token	e1fc07d1ce986e3dd5dafabce7f2e4781344408e0d4c90afbedf02f312f2bfed	["*"]	\N	2025-03-05 20:07:23	2025-03-05 20:07:23
179	App\\Models\\User	77	Personal Access Token	32e9d986d4b547dada2de0059bc0c7ecb69a3cbaba861cc28892322f6ab223ca	["*"]	\N	2025-03-05 20:07:23	2025-03-05 20:07:23
180	App\\Models\\User	78	Personal Access Token	b49e77bba05625db1368b91e08cc65ec447d32bd4f8c6ce2765a3424db54a70e	["*"]	\N	2025-03-05 20:15:03	2025-03-05 20:15:03
181	App\\Models\\User	78	Personal Access Token	412a362bb65e48ff841c07c4ceb65542f46669f9c77fcb5d039ab3965ec4e391	["*"]	\N	2025-03-05 20:15:04	2025-03-05 20:15:04
182	App\\Models\\User	74	Personal Access Token	a165b168120ae60eb945e3d638c41b4af3c8f4279307851a0f37f28c58db460c	["*"]	\N	2025-03-06 03:48:41	2025-03-06 03:48:41
183	App\\Models\\User	15	Personal Access Token	e693a46f3075e9f43db8ee5ab2d6c6c89b1df90bb3df7ee274fa8ca21aba21c5	["*"]	\N	2025-03-06 06:14:18	2025-03-06 06:14:18
184	App\\Models\\User	71	Personal Access Token	89c20d6b8808c15a0fb84777132eaee58bd692fce85be4664d4f1f877199b2c8	["*"]	\N	2025-03-06 18:25:10	2025-03-06 18:25:10
185	App\\Models\\User	70	Personal Access Token	484a9270488dcf428c9bcd6fda1e7b6c8909ac43e501caccaf800985a45748d3	["*"]	\N	2025-03-07 10:04:28	2025-03-07 10:04:28
186	App\\Models\\User	72	Personal Access Token	65e0d1140665ae661e3f943510051376429c14e69e71643330c506887e087c49	["*"]	\N	2025-03-07 10:05:55	2025-03-07 10:05:55
187	App\\Models\\User	72	Personal Access Token	cb0b30605ae67059879ece51831fea137a25885226b9bca7b70982473547e72b	["*"]	\N	2025-03-07 18:30:22	2025-03-07 18:30:22
188	App\\Models\\User	70	Personal Access Token	6cbeef583c0e92acdc95d985631706f9dc23c5c89371dd46bd9ceade94d08c3c	["*"]	\N	2025-03-07 18:31:38	2025-03-07 18:31:38
189	App\\Models\\User	72	Personal Access Token	a89621733d2f815a4769c1caaa017a0bbd97080cf115ecd4a1ff1a19856719df	["*"]	\N	2025-03-07 18:55:53	2025-03-07 18:55:53
190	App\\Models\\User	72	Personal Access Token	c69313ffa597253334f2b057f316068dd4299cedaf8502353d01ff278ba4ff40	["*"]	\N	2025-03-07 21:21:43	2025-03-07 21:21:43
191	App\\Models\\User	72	Personal Access Token	b116b42764e172ca07a3a74711f9f533c8fda28aaadc7c86eea5fa01047631ec	["*"]	\N	2025-03-07 21:24:51	2025-03-07 21:24:51
192	App\\Models\\User	70	Personal Access Token	9ef7380555c8bca295b3622435e22c1168cb0488a156c9fc5b8cdd1e7982ee32	["*"]	\N	2025-03-07 21:29:24	2025-03-07 21:29:24
193	App\\Models\\User	72	Personal Access Token	d7b1c78784bd1e801892fc829be9c36b7c626f15955c37f059f7126abc440299	["*"]	\N	2025-03-07 21:31:02	2025-03-07 21:31:02
194	App\\Models\\User	74	Personal Access Token	82cdbc11f66ac468662de2e5dafc1e391b6e79b90b0aeb86c361529c4baf0d81	["*"]	\N	2025-03-08 08:55:18	2025-03-08 08:55:18
195	App\\Models\\User	70	Personal Access Token	5696bd5ab6936563a60a14e3b735cb21a1cbcdeccfcf8193a1cc322053a336f1	["*"]	\N	2025-03-08 11:47:15	2025-03-08 11:47:15
196	App\\Models\\User	79	Personal Access Token	34aad9ad6002a787a50f43d11d18042c4fc6721edc1d4c4754e3940767737327	["*"]	\N	2025-03-08 12:04:42	2025-03-08 12:04:42
197	App\\Models\\User	79	Personal Access Token	98ae200168147d6a11e6de79b7c17fb06691609596cb49419ceb139973fd97e8	["*"]	\N	2025-03-08 12:04:43	2025-03-08 12:04:43
198	App\\Models\\User	11	Personal Access Token	813cff6297ffb36a6ce5d90400bf2c194f61833706b224a4db13cf84bfe4077e	["*"]	\N	2025-03-08 12:08:22	2025-03-08 12:08:22
199	App\\Models\\User	80	Personal Access Token	e1473aa9e792f50284428221cba0469b4734a7e014403e54fc195d8bb95ddc40	["*"]	\N	2025-03-08 12:12:42	2025-03-08 12:12:42
200	App\\Models\\User	80	Personal Access Token	43f4158c632107002f694a3dea28079ccf0db67b45d4f5d78473cfbdae111336	["*"]	\N	2025-03-08 12:12:43	2025-03-08 12:12:43
201	App\\Models\\User	72	Personal Access Token	8ffe7cd769adc6bac245fce724d88b79534896c0f407e3cd377ddf1e5bfaaf7c	["*"]	\N	2025-03-08 14:24:26	2025-03-08 14:24:26
202	App\\Models\\User	81	Personal Access Token	12f44dc39fae4eae1cba8972529c38080af26d2cc7c734ab95118a6365ef160b	["*"]	\N	2025-03-08 14:34:49	2025-03-08 14:34:49
203	App\\Models\\User	81	Personal Access Token	5587cde8fb868dd8e54b1d322d4b6394ecc3ab3a3226ec1e592b1c9c941be5c4	["*"]	\N	2025-03-08 14:34:49	2025-03-08 14:34:49
204	App\\Models\\User	81	Personal Access Token	fe65b0258ccb72f32ba796688b1583b973cfc35f9283c505d06f09d803aea46b	["*"]	\N	2025-03-08 14:37:06	2025-03-08 14:37:06
205	App\\Models\\User	72	Personal Access Token	d0653b54e58e6dc8406900b83bfd8bf2cd98bff1e5bc75436ef05be98c14d802	["*"]	\N	2025-03-08 14:38:44	2025-03-08 14:38:44
206	App\\Models\\User	81	Personal Access Token	e881c4f5dca36cf7f14f2b18c169c0310399fa8c6eefc2fb83f6d81a4724402f	["*"]	\N	2025-03-08 14:42:52	2025-03-08 14:42:52
207	App\\Models\\User	72	Personal Access Token	58355a48efe7c383162cf16e80f36168e9d208e5c5c8552dcfbcc34ca305adc3	["*"]	\N	2025-03-08 14:46:27	2025-03-08 14:46:27
208	App\\Models\\User	82	Personal Access Token	c5b1a6df096ea623c36e23ae1744329be761b172cdaa6ddfd0c437b562b112b9	["*"]	\N	2025-03-08 14:47:19	2025-03-08 14:47:19
209	App\\Models\\User	82	Personal Access Token	31ea531a562248e171332367269202b136bc85fbab35c05cb8d20975a7b08583	["*"]	\N	2025-03-08 14:47:20	2025-03-08 14:47:20
210	App\\Models\\User	72	Personal Access Token	8cfd8816e848210c8ed1f145695362457c34c72000c7a5160db3a660f525c634	["*"]	\N	2025-03-08 14:51:28	2025-03-08 14:51:28
211	App\\Models\\User	74	Personal Access Token	48e08345b793a6bfbb3175cc886a9dc6b46cd4ab8e6f809c4d8164a954b65976	["*"]	\N	2025-03-08 15:14:58	2025-03-08 15:14:58
212	App\\Models\\User	72	Personal Access Token	53a8024bc10da0a97160407e1c3b635b1fb7c8cc3470ba224a3d2d30e856b585	["*"]	\N	2025-03-08 15:23:22	2025-03-08 15:23:22
213	App\\Models\\User	72	Personal Access Token	652a76bca19fe88da67661b77d4c039736ccb0af93cada7279153e30bc1fff0f	["*"]	\N	2025-03-08 16:19:28	2025-03-08 16:19:28
214	App\\Models\\User	72	Personal Access Token	7392a4b9ad373a4fd86d7ca0b8cf3e8704073a6fedbf373e06218727a3568528	["*"]	\N	2025-03-08 16:48:01	2025-03-08 16:48:01
215	App\\Models\\User	81	Personal Access Token	5a1ea615e4ceecd3256ddd1dd009850e8283d5c32ac689cb591b9b7cd9c9bb69	["*"]	\N	2025-03-08 16:51:41	2025-03-08 16:51:41
216	App\\Models\\User	81	Personal Access Token	e4bd0382bc42e1df8c5eb869e6b139503e0983a3bebda9d5433d726d8b45f290	["*"]	\N	2025-03-08 17:01:34	2025-03-08 17:01:34
217	App\\Models\\User	79	Personal Access Token	755c5d60da4ac0759b07dad9f182b3b6ae6fcb792654820fc7340ef9c2c87425	["*"]	\N	2025-03-08 18:17:38	2025-03-08 18:17:38
218	App\\Models\\User	74	Personal Access Token	a054cac56a357df413573a77efb0021883661146f2647b9ab309781183c72d32	["*"]	\N	2025-03-08 19:17:07	2025-03-08 19:17:07
219	App\\Models\\User	72	Personal Access Token	3381de9c88497a648215d76c914c3bb9388bfacee7af8e307124c270e4acd9de	["*"]	\N	2025-03-08 19:28:11	2025-03-08 19:28:11
220	App\\Models\\User	15	Personal Access Token	e6d11023ea9b5d5e56305c11de890045c99580cd08245eb4f061a89c9c646afc	["*"]	\N	2025-03-08 19:37:32	2025-03-08 19:37:32
221	App\\Models\\User	79	Personal Access Token	323e6ad205ed868bfe0be36251584ffc1d11105430e987a7d97e3000214746ba	["*"]	\N	2025-03-08 19:43:30	2025-03-08 19:43:30
222	App\\Models\\User	83	Personal Access Token	1e719ead9d6186a7f0a81fa83437f89cef2d711beb090ba08f770dc48cbb7a57	["*"]	\N	2025-03-08 23:26:11	2025-03-08 23:26:11
223	App\\Models\\User	83	Personal Access Token	9e16dbbf1b65245c62b7e5e835687e3a9144db952e499da48b0590b92a610756	["*"]	\N	2025-03-08 23:26:12	2025-03-08 23:26:12
224	App\\Models\\User	84	Personal Access Token	2d28df5472584700235cd525bc45448baa38ed1b882ff516dde79976044cc837	["*"]	\N	2025-03-09 00:26:28	2025-03-09 00:26:28
225	App\\Models\\User	84	Personal Access Token	32f8f090221d45fb51a7c74191a489192d6d2a682c2a6401c98d4f8fb727cd87	["*"]	\N	2025-03-09 00:26:29	2025-03-09 00:26:29
226	App\\Models\\User	85	Personal Access Token	9faca89b46aa4cc601c2fb694717d99015616fa0ea0e632ae65bebdea1dc8fcf	["*"]	\N	2025-03-09 00:29:14	2025-03-09 00:29:14
227	App\\Models\\User	85	Personal Access Token	94cddfe406c4a0d034a8a11aa558a43ff5316eec1189a1b296228017efd9aa7d	["*"]	\N	2025-03-09 00:29:14	2025-03-09 00:29:14
228	App\\Models\\User	86	Personal Access Token	ecbdb7eae47b532101ea1e88e59903f300f3bf3032eb79bd944f0b83015a488e	["*"]	\N	2025-03-09 00:45:01	2025-03-09 00:45:01
229	App\\Models\\User	86	Personal Access Token	9984253a3998a7730d56b0d929a4b249899d00671b4d8e221a967c23471d42a8	["*"]	\N	2025-03-09 00:45:02	2025-03-09 00:45:02
230	App\\Models\\User	86	Personal Access Token	de0dd329d2bdd4686597fa200f757240211a821520641ff21d060983ed8e8c4b	["*"]	\N	2025-03-09 00:49:46	2025-03-09 00:49:46
231	App\\Models\\User	81	Personal Access Token	7cc6794646d848cb68801ec4529d533626b0c59cd56cdeef3c52e3be71c974e1	["*"]	\N	2025-03-09 00:51:29	2025-03-09 00:51:29
232	App\\Models\\User	58	Personal Access Token	cb770626db1f83f4b74969ce46699c39c34bb4df0bca631fbde00adf12916348	["*"]	\N	2025-03-09 03:51:37	2025-03-09 03:51:37
233	App\\Models\\User	74	Personal Access Token	a5ffb005fb68a89666326fb1a2903fdfbc4081928c0ff1345b83f63bbba99a80	["*"]	\N	2025-03-09 05:57:12	2025-03-09 05:57:12
234	App\\Models\\User	74	Personal Access Token	673762ce47cd8683f7768fd41cc0ae1ea7171ee405228157be2fbf3c259fe673	["*"]	\N	2025-03-09 06:03:16	2025-03-09 06:03:16
235	App\\Models\\User	83	Personal Access Token	6ce032fdda9ab3f9262ec6e4db62ab35a7c88b1624f9a10e460a36161fc1ba06	["*"]	\N	2025-03-10 04:35:46	2025-03-10 04:35:46
236	App\\Models\\User	71	Personal Access Token	144cd096ce39aa53b918116ebd3392aa6ba438f85d730cb50ba266a6bfccc963	["*"]	\N	2025-03-10 04:41:44	2025-03-10 04:41:44
237	App\\Models\\User	83	Personal Access Token	2dc8e0fc0e95658ad5809a1e75ab92bee0699e27ba3de1867885ff2e239b803d	["*"]	\N	2025-03-10 04:58:45	2025-03-10 04:58:45
238	App\\Models\\User	87	Personal Access Token	2a500d2df9e71aa1f99f189938eda84d94f7c81e928a613185d17d145cba5075	["*"]	\N	2025-03-10 05:04:19	2025-03-10 05:04:19
239	App\\Models\\User	87	Personal Access Token	6e434e324664f5d00ea98a51f074d19e9a49df09054d5fb7d3e16d42723888c2	["*"]	\N	2025-03-10 05:04:19	2025-03-10 05:04:19
240	App\\Models\\User	71	Personal Access Token	5b7da380e3e83929e08f8c96519d58c6e91bc671cefd4c6e642fd6f3c97971ac	["*"]	\N	2025-03-10 05:32:51	2025-03-10 05:32:51
241	App\\Models\\User	87	Personal Access Token	20088c2a92c01ef4526ad94a74431ab8ec311efa38f89a25908ab17e9c4f173e	["*"]	\N	2025-03-10 05:50:47	2025-03-10 05:50:47
242	App\\Models\\User	83	Personal Access Token	b274e557229fac0b116c3a31c44ec783176e8af41a9e28f66f0b13e2837cc2d9	["*"]	\N	2025-03-10 05:51:16	2025-03-10 05:51:16
243	App\\Models\\User	88	Personal Access Token	cb6bf722a710e31c3de41b3d016398f3fc67eba0417faaf1f2178c0d86338a41	["*"]	\N	2025-03-10 06:06:47	2025-03-10 06:06:47
244	App\\Models\\User	88	Personal Access Token	849b0731aead2c34e7123745fe0b4ce48e3ae7bfff7848d05352605aeec98562	["*"]	\N	2025-03-10 06:06:47	2025-03-10 06:06:47
245	App\\Models\\User	15	Personal Access Token	ba1a814893fda3322d3983e43b8d4510c1974ac9960bff5f7b52e2ee7130685a	["*"]	\N	2025-03-10 07:38:46	2025-03-10 07:38:46
246	App\\Models\\User	79	Personal Access Token	9cc87844628af3f9f6c0fea8a149dad3b02b785d91eb3138f211e4618b1f47a3	["*"]	\N	2025-03-10 07:46:46	2025-03-10 07:46:46
247	App\\Models\\User	79	Personal Access Token	83c92759a396509e1adef7f943c946b62386631739bc8b423a97ed265a523289	["*"]	\N	2025-03-10 08:10:39	2025-03-10 08:10:39
248	App\\Models\\User	15	Personal Access Token	0ca485b5b2be1f8c37557c3434e7cff8db32653b560069d95bba6ef180f04024	["*"]	\N	2025-03-10 08:17:06	2025-03-10 08:17:06
249	App\\Models\\User	89	Personal Access Token	d1f42f2303f9015e845783794f89fd7fa4efa6aba17ad6e9d5c13dd62d589255	["*"]	\N	2025-03-10 14:17:11	2025-03-10 14:17:11
250	App\\Models\\User	89	Personal Access Token	8c7c19a289cc8ae97117e46675b90321a031fc0fcfa47040aa1ecf214eb561a9	["*"]	\N	2025-03-10 14:17:11	2025-03-10 14:17:11
251	App\\Models\\User	89	Personal Access Token	0f430b1fb206e6d005b9fea1309f57b5f5d8c41eb7626a1b73eb99387f59f4d2	["*"]	\N	2025-03-10 14:19:28	2025-03-10 14:19:28
252	App\\Models\\User	88	Personal Access Token	0f5753257f9190a78e735424243bfe98101a8b9fbdba30cd6afa8617f55caf04	["*"]	\N	2025-03-10 14:53:14	2025-03-10 14:53:14
253	App\\Models\\User	83	Personal Access Token	139f8e0194148660cfeb45c82e6a24f3856da4a8b8174ed8325e5cc4e05847c2	["*"]	\N	2025-03-10 20:17:40	2025-03-10 20:17:40
254	App\\Models\\User	74	Personal Access Token	30e7f622bc61ce2c150c8352bf9a886792c346ea2d366294ff367d3f58e92b50	["*"]	\N	2025-03-11 04:23:19	2025-03-11 04:23:19
255	App\\Models\\User	88	Personal Access Token	72da5e4c07cfda98aaf912ecfe959829e899514c94c7937b1058dde2af9a25d7	["*"]	\N	2025-03-11 07:01:07	2025-03-11 07:01:07
256	App\\Models\\User	89	Personal Access Token	ed540f3b55ce47c5bdeb96589e17f2d60ed62877923945dff407a594d2ce8af0	["*"]	\N	2025-03-11 09:07:43	2025-03-11 09:07:43
257	App\\Models\\User	89	Personal Access Token	e9a78605a5b2b2b0c0626ab72a0ffd143b0ed383d1fb7048b27045080b4d953f	["*"]	\N	2025-03-11 11:49:26	2025-03-11 11:49:26
258	App\\Models\\User	59	Personal Access Token	065e7daedbb51ec8eaf116a00eb8fac122c31f084a646a6ed0fcf11e5ce530e8	["*"]	\N	2025-03-24 06:28:05	2025-03-24 06:28:05
259	App\\Models\\User	71	Personal Access Token	0c51d172079d51ce863b0fe3b0a991bb3095c09a3484a574c7688cc30cc9620a	["*"]	\N	2025-03-24 17:29:17	2025-03-24 17:29:17
260	App\\Models\\User	61	Personal Access Token	1f23d55d42cc6646d9172abf83f25771e72c1ca37f83d6fce40b7dcf28971270	["*"]	\N	2025-03-25 09:05:05	2025-03-25 09:05:05
261	App\\Models\\User	61	Personal Access Token	c540ee9aa7da3d56a25d0a9fd7967f6ed887484cd52032c1e3951d4e62fb156b	["*"]	\N	2025-03-25 09:05:53	2025-03-25 09:05:53
262	App\\Models\\User	61	Personal Access Token	195f9d62bd57ecdb2e8c2852641956d75666f074c8ef705c5dd825b18b71a3d9	["*"]	\N	2025-03-25 12:48:07	2025-03-25 12:48:07
263	App\\Models\\User	61	Personal Access Token	3f31a3180944bae58f681e02e7edd8d8c5525fe06626c8544c771b6c0de2ed82	["*"]	\N	2025-03-26 05:27:37	2025-03-26 05:27:37
264	App\\Models\\User	61	Personal Access Token	3f2c34aa8d8bea2591ac61fa5240cc2e5d10d080471f7f23ac5f7a9f4f31568a	["*"]	\N	2025-03-26 06:37:13	2025-03-26 06:37:13
265	App\\Models\\User	61	Personal Access Token	183d20a1706dcb9820add48a2b750b09cadf294cb9438cd01e504c3fb1d5dc8c	["*"]	\N	2025-03-26 11:35:29	2025-03-26 11:35:29
266	App\\Models\\User	61	Personal Access Token	336480adc8db4f0e0c6b1d053b4312a03c8a460224b3260d7d13c91814e944fd	["*"]	\N	2025-03-26 11:53:44	2025-03-26 11:53:44
267	App\\Models\\User	61	Personal Access Token	8d09ce0c5ca85f8a79915527e652a7548057c01bfee89471706952088068511b	["*"]	\N	2025-03-26 11:57:49	2025-03-26 11:57:49
268	App\\Models\\User	61	Personal Access Token	1d63be6a495026f8fec93f4693b6fd5a9f37cadec5053091e9eeb9b2f0b6e7b4	["*"]	\N	2025-03-26 11:57:58	2025-03-26 11:57:58
269	App\\Models\\User	61	Personal Access Token	f1e42a57bddf63d79a7173937a963b9ff5eff312bc7f5e5765abfb5b3c67853e	["*"]	\N	2025-03-26 12:00:43	2025-03-26 12:00:43
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
18	1	Vivid Interiors\r\nVivid Interiors is a décor brand that brings vibrant and colorful designs to life.	Vivid Interiors\r\nVivid Interiors is a décor brand that brings vibrant and colorful designs to life.	\N	\N	\N	\N	18	18	1	0	Wall Decor	1	1	18	\N	28972654	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	18	2025-01-07 09:00:55	2025-01-15 10:42:46	\N	0	0	0	0	0	0	7	0	\N	\N	\N	1	\N
9	2	\N	\N	\N	\N	\N	\N	4	0	1	0	Test	1	1	4	\N	340323432	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	1	9	2025-01-06 10:43:55	\N	\N	0	0	0	0	0	0	7	0	\N	\N	\N	\N	\N
12	1	Premium quality clothing, focusing on high-end fabrics and sophisticated designs.	Premium quality clothing, focusing on high-end fabrics and sophisticated designs.	\N	\N	\N	\N	16	0	1	0	Luxe Loom	1	1	16	\N	768797289	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	7	12	2025-01-07 08:32:44	\N	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
4	1	Crown & Brim is a premium hat and cap brand known for its impeccable craftsmanship and stylish designs. Combining modern trends with classic styles, Crown & Brim offers a diverse collection of hats and caps that cater to various occasions, from casual wear to formal events. Each piece is made from high-quality materials to ensure comfort, durability, and a perfect fit.	Crown & Brim is a premium hat and cap brand known for its impeccable craftsmanship and stylish designs. Combining modern trends with classic styles, Crown & Brim offers a diverse collection of hats and caps that cater to various occasions, from casual wear to formal events. Each piece is made from high-quality materials to ensure comfort, durability, and a perfect fit.	\N	\N	\N	\N	4	4	1	0	Crown & Brim	1	1	4	\N	660606078	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	4	2024-07-02 11:38:59	2025-01-15 07:10:39	\N	0	0	0	0	0	0	7	0	4.7	Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage.	\N	\N	\N
15	1	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty.	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty.	\N	\N	\N	\N	17	17	1	0	Arabic jewels	1	1	17	\N	291665267	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	15	2025-01-07 08:51:09	2025-01-15 10:37:50	\N	0	0	0	0	0	0	7	0	3	\N	\N	1	\N
13	1	Modern, city-inspired clothing for a trendy, on-the-go lifestyle.	Modern, city-inspired clothing for a trendy, on-the-go lifestyle.	\N	\N	\N	\N	16	0	1	0	Urban Weave	1	1	16	\N	802142357	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	7	13	2025-01-07 08:33:32	\N	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
14	1	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty. The word "Gleaming" suggests a radiant, shining quality, symbolizing the brilliance of fine jewelry. "Grace" adds an element of elegance and timeless appeal, evoking the delicate craftsmanship and refined designs that the brand offers.	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty. The word "Gleaming" suggests a radiant, shining quality, symbolizing the brilliance of fine jewelry. "Grace" adds an element of elegance and timeless appeal, evoking the delicate craftsmanship and refined designs that the brand offers.	\N	\N	\N	\N	17	17	1	0	Persian Diamond	1	1	17	\N	831094520	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	14	2025-01-07 08:49:53	2025-01-15 07:17:46	\N	0	0	0	0	0	0	7	0	\N	\N	\N	\N	\N
5	1	Handmade Brown Textured Ceramic Lamp | Bedroom & Livingroom Lightning | Unique, Minimalist Designed	Handmade Brown Textured Ceramic Lamp | Bedroom & Livingroom Lightning | Unique, Minimalist Designed	\N	\N	\N	\N	4	4	1	0	Handmade Brown Textured Ceramic Lamp	1	1	4	\N	683252426	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	1	5	2024-07-02 11:55:08	2025-01-06 08:54:46	\N	0	0	0	1	0	0	7	1	\N	\N	\N	\N	\N
17	1	Vivid Interiors\r\nVivid Interiors is a décor brand that brings vibrant and colorful designs to life.	Vivid Interiors\r\nVivid Interiors is a décor brand that brings vibrant and colorful designs to life.	\N	\N	\N	\N	18	18	1	0	Drawing Room	1	1	18	\N	817807687	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	17	2025-01-07 09:00:08	2025-01-15 07:40:20	\N	0	0	0	0	0	0	7	0	\N	\N	\N	\N	\N
16	1	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty.	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty.	\N	\N	\N	\N	17	17	1	0	Golden Envy	1	1	17	\N	640877598	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	16	2025-01-07 08:52:24	2025-01-15 07:40:37	\N	0	0	0	0	0	0	7	0	\N	\N	\N	\N	\N
10	2	\N	\N	\N	\N	\N	\N	5	5	1	0	Test	1	1	5	\N	562815623	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	1	10	2025-01-06 11:40:20	2025-01-07 07:51:43	\N	0	0	0	0	0	0	7	0	\N	\N	\N	\N	\N
6	1	Painters Palette, Floral Paint Palette, Botanical decorReal ,Pressed Flowers, Creative Artist Gift, Art lover tool, Mothers Day	Painters Palette, Floral Paint Palette, Botanical decorReal ,Pressed Flowers, Creative Artist Gift, Art lover tool, Mothers Day	\N	\N	\N	\N	4	4	1	0	Painters Palette, Floral Paint Palette	1	1	4	\N	545180046	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	5	6	2024-07-02 11:56:57	2025-01-06 08:55:17	\N	0	0	0	1	0	0	7	1	\N	\N	\N	\N	\N
27	1	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N	\N	\N	\N	18	18	1	0	Art & Craft	1	1	18	\N	974146296	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	28	2025-01-08 13:40:26	2025-01-15 10:41:52	\N	0	0	0	0	0	0	7	0	\N	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N	\N	\N
28	1	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N	\N	\N	\N	18	18	1	0	Photo frames	1	1	18	\N	509305287	4	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	29	2025-01-08 13:43:21	2025-01-15 07:41:24	\N	0	0	0	0	0	0	7	0	\N	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N	\N	\N
19	1	Opal & Oak combines nature-inspired designs with elegant craftsmanship.	Opal & Oak combines nature-inspired designs with elegant craftsmanship.	\N	\N	\N	\N	18	18	1	0	Opal & Oak Light	1	1	18	\N	346196067	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	19	2025-01-07 09:02:07	2025-01-15 10:37:15	\N	0	0	0	0	0	0	7	0	\N	\N	\N	\N	1
29	1	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N	\N	\N	\N	17	17	1	0	Drawing Frames	1	1	17	\N	675506466	4	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	30	2025-01-08 13:44:34	2025-01-15 07:41:11	\N	0	0	0	0	0	0	7	0	\N	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	1	\N	\N
26	1	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N	\N	\N	\N	30	30	1	0	Loom & Luxe Jewels	1	1	30	\N	401391550	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	27	2025-01-08 07:18:32	2025-01-15 07:33:07	\N	0	0	0	0	0	0	7	0	2	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N	1	\N
21	2	\N	\N	\N	\N	\N	\N	17	17	1	0	Luxe Jewelers	1	1	17	\N	787150137	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	14	22	2025-01-07 09:30:06	2025-01-15 07:34:21	\N	0	0	0	0	0	0	7	0	\N	Shipment And Policies Shipment And Policies Shipment And Policies Shipment And Policies	\N	\N	1
23	1	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N	\N	\N	\N	30	30	1	0	Scarves & Shawls	1	1	30	\N	547271237	5	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	24	2025-01-08 07:11:12	2025-01-15 07:20:15	\N	0	0	0	0	0	0	7	0	\N	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	1	\N	\N
20	1	Modern Nest\r\nModern Nest specializes in sleek, contemporary décor pieces that blend functionality and style.	Modern Nest\r\nModern Nest specializes in sleek, contemporary décor pieces that blend functionality and style.	\N	\N	\N	\N	18	18	1	0	Opal Storage	1	1	18	\N	307917027	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	20	2025-01-07 09:17:05	2025-01-15 07:37:52	\N	0	0	0	0	0	0	7	0	2.5	\N	1	\N	\N
34	1	Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine.	Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine.	\N	\N	\N	\N	5	5	1	0	Fiorentina Infinity Set	1	1	5	\N	885522180	6	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	9	35	2025-01-13 07:44:46	2025-01-15 06:17:34	\N	0	0	0	0	0	0	7	0	\N	Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine.	\N	\N	1
2	1	Vibrant Vibes is a fashion brand that embodies elegance, sophistication, and timeless beauty. Specializing in meticulously crafted garments and accessories, the brand focuses on using delicate, high-quality fabrics to create designs that exude a sense of lightness and grace.	Vibrant Vibes is a fashion brand that embodies elegance, sophistication, and timeless beauty. Specializing in meticulously crafted garments and accessories, the brand focuses on using delicate, high-quality fabrics to create designs that exude a sense of lightness and grace.	\N	\N	\N	\N	4	4	1	0	Vibrant Vibes	1	1	4	\N	679226087	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	2	2024-07-02 11:26:46	2025-01-15 07:45:33	\N	0	0	0	0	0	0	7	0	\N	Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage.	\N	\N	\N
32	1	Little Bundles has the cutest personalised gifts for newborn baby boys & baby girls in UAE.	Little Bundles has the cutest personalised gifts for newborn baby boys & baby girls in UAE.	\N	\N	\N	\N	5	5	1	0	Valentine's Gift	1	1	5	\N	929459235	5	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	33	2025-01-13 07:35:48	2025-01-15 07:43:45	\N	0	0	0	0	0	0	7	0	3.3	This page summarises how to return a product to us, our IKEA return policy and making a claim at IKEA.	\N	1	\N
31	1	The best housewarming gifts last longer than your visits\r\nBetter sound, cleaner air or smarter lighting. Nothing says welcome home like new home electronics. And with these practical housewarming gifts, you can help them find new ways to make the most of their life at home – every day.	The best housewarming gifts last longer than your visits\r\nBetter sound, cleaner air or smarter lighting. Nothing says welcome home like new home electronics. And with these practical housewarming gifts, you can help them find new ways to make the most of their life at home – every day.	\N	\N	\N	\N	5	5	1	0	Personalized Basket	1	1	5	\N	532380448	4	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	32	2025-01-13 07:34:09	2025-01-15 07:42:52	\N	0	0	0	0	0	0	7	0	\N	This page summarises how to return a product to us, our IKEA return policy and making a claim at IKEA.	\N	\N	1
30	1	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N	\N	\N	\N	30	30	1	0	FERRERO ROCHER Basket	1	1	30	\N	510572943	4	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	31	2025-01-08 13:45:37	2025-01-15 09:09:42	\N	0	0	0	0	0	0	7	0	3.3	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	1	\N	\N
33	1	Everyday essentials: A quality wallet, a stylish watch, or a comfortable backpack. Self-care: Grooming products, gym membership, or a subscription box.	Everyday essentials: A quality wallet, a stylish watch, or a comfortable backpack. Self-care: Grooming products, gym membership, or a subscription box.	\N	\N	\N	\N	5	5	1	0	Polo air Belt Wallet Card Holder Keychain Tan Set	1	1	5	\N	806195042	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	34	2025-01-13 07:41:57	2025-01-15 10:36:51	\N	0	0	0	0	0	0	7	0	\N	Everyday essentials: A quality wallet, a stylish watch, or a comfortable backpack. Self-care: Grooming products, gym membership, or a subscription box.	\N	\N	\N
3	1	A custom wall light is a tailored lighting fixture designed to meet specific aesthetic and functional preferences. These lights can be made to fit any interior style, whether modern, rustic, or contemporary, and can be crafted in various shapes, sizes, and materials. Custom wall lights are often designed to complement the unique features of a space, providing both ambient and accent lighting.	A custom wall light is a tailored lighting fixture designed to meet specific aesthetic and functional preferences. These lights can be made to fit any interior style, whether modern, rustic, or contemporary, and can be crafted in various shapes, sizes, and materials. Custom wall lights are often designed to complement the unique features of a space, providing both ambient and accent lighting.	\N	\N	\N	\N	4	4	1	0	Custom Wall Lights	1	1	4	\N	526230169	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	3	2024-07-02 11:38:44	2025-01-15 07:06:47	\N	0	0	0	0	0	0	7	0	\N	Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage.	\N	\N	\N
8	2	\N	\N	\N	\N	\N	\N	4	4	1	0	Cotton Luxe	1	1	4	\N	121945084	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	7	2024-08-29 15:31:13	2025-01-15 10:34:51	\N	0	0	0	0	0	 	7	0	\N	Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage.	\N	\N	1
11	1	Classic Stitch Collection\r\nTimeless elegance in every thread. The Classic Stitch Collection features versatile, wardrobe-staple pieces designed to last. From tailored blazers to sleek trousers, these items are perfect for those who appreciate enduring style and quality craftsmanship.	Classic Stitch Collection\r\nTimeless elegance in every thread. The Classic Stitch Collection features versatile, wardrobe-staple pieces designed to last. From tailored blazers to sleek trousers, these items are perfect for those who appreciate enduring style and quality craftsmanship.	\N	\N	\N	\N	16	16	1	0	Classic Stitch Collection	1	1	16	\N	921777335	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	11	2025-01-07 08:24:37	2025-01-15 07:44:37	\N	0	0	0	0	0	0	7	0	\N	Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage.	\N	\N	\N
24	1	This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.	This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.	\N	\N	\N	\N	30	30	1	0	Handmade Gloves	1	1	30	\N	895698902	5	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	25	2025-01-08 07:13:21	2025-01-15 07:23:11	\N	0	0	0	0	0	0	7	0	\N	Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage.	\N	1	\N
22	2	\N	\N	\N	\N	\N	\N	30	30	1	0	Handmade Bags	1	1	30	\N	7209457	5	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	14	23	2025-01-08 07:00:54	2025-01-15 07:24:42	\N	0	0	0	0	0	0	7	0	\N	Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage.	1	1	\N
36	2	\N	\N	\N	\N	\N	\N	5	5	1	0	Handmade Bags	1	1	5	\N	506583233	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	14	37	2025-01-15 07:29:48	2025-01-15 07:30:23	\N	0	0	0	0	0	0	7	0	\N	Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage.	\N	\N	\N
35	1	KKT is a premium hat and cap brand known for its impeccable craftsmanship and stylish designs. Combining modern trends with classic styles, Crown & Brim offers a diverse collection of hats and caps that cater to various occasions, from casual wear to formal events. Each piece is made from high-quality materials to ensure comfort, durability, and a perfect fit.	KKT is a premium hat and cap brand known for its impeccable craftsmanship and stylish designs. Combining modern trends with classic styles, Crown & Brim offers a diverse collection of hats and caps that cater to various occasions, from casual wear to formal events. Each piece is made from high-quality materials to ensure comfort, durability, and a perfect fit.	\N	\N	\N	\N	16	16	1	0	Handmade Hats	1	1	16	\N	36258394	5	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	36	2025-01-15 07:22:51	2025-01-15 10:35:34	\N	0	0	0	0	0	0	7	0	\N	Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage.	\N	\N	1
37	1	Ethereal Threads offers a collection that seamlessly blends contemporary style with classic allure, making it the perfect choice for those seeking refined, ethereal fashion that makes a statement.	Ethereal Threads offers a collection that seamlessly blends contemporary style with classic allure, making it the perfect choice for those seeking refined, ethereal fashion that makes a statement.	\N	\N	\N	\N	17	0	1	0	Handmade Bags	1	1	17	\N	77279860	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	38	2025-01-15 07:32:05	\N	\N	0	0	0	0	0	0	7	0	\N	Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage.	1	\N	\N
25	1	This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.	This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.	\N	\N	\N	\N	30	30	1	0	Chic Rings	1	1	30	\N	566301039	5	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	26	2025-01-08 07:17:17	2025-01-15 07:32:47	\N	0	0	0	0	0	0	7	0	\N	This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.	\N	\N	\N
38	1	Ethereal Threads offers a collection that seamlessly blends contemporary style with classic allure, making it the perfect choice for those seeking refined, ethereal fashion that makes a statement.	Ethereal Threads offers a collection that seamlessly blends contemporary style with classic allure, making it the perfect choice for those seeking refined, ethereal fashion that makes a statement.	\N	\N	\N	\N	30	0	1	0	Luxe Jewelers	1	1	30	\N	742743318	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	39	2025-01-15 07:37:10	\N	\N	0	0	0	0	0	0	7	0	\N	Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage.	\N	\N	\N
1	1	Ethereal Threads is a fashion brand that embodies elegance, sophistication, and timeless beauty. Specializing in meticulously crafted garments and accessories, the brand focuses on using delicate, high-quality fabrics to create designs that exude a sense of lightness and grace.	Ethereal Threads is a fashion brand that embodies elegance, sophistication, and timeless beauty. Specializing in meticulously crafted garments and accessories, the brand focuses on using delicate, high-quality fabrics to create designs that exude a sense of lightness and grace.	\N	\N	\N	\N	4	4	1	0	Ethereal Threads	1	1	4	\N	432347888	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	1	2024-07-02 11:20:49	2025-01-15 10:34:18	\N	0	0	0	0	0	0	7	0	\N	Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage.	\N	\N	\N
39	1	Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development to fill empty spaces in a layout that does not yet have content.Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development to fill empty spaces in a layout that does not yet have content.	Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development to fill empty spaces in a layout that does not yet have content.Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development to fill empty spaces in a layout that does not yet have content.	\N	\N	\N	\N	17	17	1	0	Infant Essentials	1	1	17	\N	758157439	6	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	40	2025-01-15 11:08:52	2025-03-10 09:38:36	\N	0	0	0	0	0	0	7	0	\N	A shipping policy is a set of terms created by an online retailer that describes how orders are shipped to the customer. Shipping policies typically include domestic and international shipping speed options, delivery times, return policies, payment terms, shipping charges, and estimates for order processing time.	1	\N	\N
41	1	Playtopia is a vibrant and innovative toy brand dedicated to sparking creativity, learning, and fun for children of all ages. Our toys are thoughtfully designed to inspire imagination and encourage developmental growth, from educational puzzles to interactive playsets. With a focus on safety, quality, and sustainability, Playtopia ensures every toy is made with non-toxic materials and built to last.	Playtopia is a vibrant and innovative toy brand dedicated to sparking creativity, learning, and fun for children of all ages. Our toys are thoughtfully designed to inspire imagination and encourage developmental growth, from educational puzzles to interactive playsets. With a focus on safety, quality, and sustainability, Playtopia ensures every toy is made with non-toxic materials and built to last.	\N	\N	\N	\N	5	5	1	0	Playtopia	1	1	5	\N	788058173	5	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	42	2025-01-15 11:13:18	2025-01-15 11:15:22	\N	0	0	0	0	0	0	7	0	\N	Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage.	\N	\N	\N
42	1	ToyWhiz is a dynamic toy brand that brings joy and excitement to children by offering a wide range of high-quality, innovative toys. Designed to entertain, educate, and inspire, ToyWhiz products cater to various age groups and developmental stages, ensuring there’s something for every child. From creative building sets to interactive learning toys, we prioritize safety and durability, using eco-friendly materials that are kind to both kids and the planet.	ToyWhiz is a dynamic toy brand that brings joy and excitement to children by offering a wide range of high-quality, innovative toys. Designed to entertain, educate, and inspire, ToyWhiz products cater to various age groups and developmental stages, ensuring there’s something for every child. From creative building sets to interactive learning toys, we prioritize safety and durability, using eco-friendly materials that are kind to both kids and the planet.	\N	\N	\N	\N	17	0	1	0	ToyWhiz	1	1	17	\N	428629879	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	43	2025-01-15 11:15:07	\N	\N	0	0	0	0	0	0	7	0	\N	Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage.	\N	\N	\N
44	1	uxe Flame is a high-end candle brand dedicated to elevating your home with premium scents and elegant designs. Each candle is expertly crafted using eco-friendly waxes and infused with carefully selected fragrances to create a soothing, luxurious atmosphere. Whether it's the warm glow of a vanilla bean or the refreshing aroma of ocean breeze, Luxe Flame offers a diverse collection that adds sophistication and serenity to any space.	uxe Flame is a high-end candle brand dedicated to elevating your home with premium scents and elegant designs. Each candle is expertly crafted using eco-friendly waxes and infused with carefully selected fragrances to create a soothing, luxurious atmosphere. Whether it's the warm glow of a vanilla bean or the refreshing aroma of ocean breeze, Luxe Flame offers a diverse collection that adds sophistication and serenity to any space.	\N	\N	\N	\N	5	0	1	0	Luxe Flame	1	1	5	\N	860851640	5	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	45	2025-01-15 11:18:00	\N	\N	0	0	0	0	0	0	7	0	\N	Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage.	\N	1	\N
43	1	Enchanted Wick is a luxury candle brand that transforms any space into a serene and inviting haven. Crafted with the finest ingredients, each candle is hand-poured and infused with unique, captivating scents that evoke a sense of tranquility and warmth. From soothing lavender to refreshing citrus blends, Enchanted Wick offers a range of premium candles that cater to every mood and occasion.	Enchanted Wick is a luxury candle brand that transforms any space into a serene and inviting haven. Crafted with the finest ingredients, each candle is hand-poured and infused with unique, captivating scents that evoke a sense of tranquility and warmth. From soothing lavender to refreshing citrus blends, Enchanted Wick offers a range of premium candles that cater to every mood and occasion.	\N	\N	\N	\N	5	5	1	0	Enchanted Wick	1	1	5	\N	785073986	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	44	2025-01-15 11:16:38	2025-01-15 11:18:18	\N	0	0	0	0	0	0	7	0	\N	Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage.	\N	\N	\N
45	1	Joyful Treasures is a holiday-focused gift brand that specializes in curating the perfect Christmas gifts to spread cheer and warmth. From personalized keepsakes and festive décor to cozy apparel and unique stocking stuffers, we offer a wide selection of thoughtfully crafted items for all ages.	Joyful Treasures is a holiday-focused gift brand that specializes in curating the perfect Christmas gifts to spread cheer and warmth. From personalized keepsakes and festive décor to cozy apparel and unique stocking stuffers, we offer a wide selection of thoughtfully crafted items for all ages.	\N	\N	\N	\N	4	0	1	0	Joyful Treasures	1	1	4	\N	277981405	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	46	2025-01-15 11:20:47	\N	\N	0	0	0	0	0	0	7	0	\N	Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage.	\N	\N	\N
47	1	Shipment And Policies	Shipment And Policies	\N	\N	\N	\N	59	0	1	0	sab Maribe	1	1	59	\N	243728389	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	0	48	2025-01-15 13:25:10	\N	\N	0	0	0	0	0	0	0	0	\N	Shipment And Policies	1	1	1
40	1	Cherished Beginnings is a premium baby gift brand dedicated to providing thoughtful and high-quality gifts for newborns and their families. Our carefully curated collection features a range of adorable and practical items, from soft blankets and plush toys to personalized keepsakes and essentials.	Cherished Beginnings is a premium baby gift brand dedicated to providing thoughtful and high-quality gifts for newborns and their families. Our carefully curated collection features a range of adorable and practical items, from soft blankets and plush toys to personalized keepsakes and essentials.	\N	\N	\N	\N	16	16	1	0	Cherished Beginnings	1	1	16	\N	310909408	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	41	2025-01-15 11:11:47	2025-01-15 11:24:41	\N	0	0	0	0	0	0	7	0	\N	Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage.	\N	\N	\N
46	1	Merry Moments is a Christmas gift brand dedicated to making the holiday season even more magical. Our curated collection features a wide range of festive gifts, from charming ornaments and personalized stockings to cozy winter essentials and luxurious holiday treats. Each item is selected to bring warmth, joy, and a touch of holiday spirit to every celebration.	Merry Moments is a Christmas gift brand dedicated to making the holiday season even more magical. Our curated collection features a wide range of festive gifts, from charming ornaments and personalized stockings to cozy winter essentials and luxurious holiday treats. Each item is selected to bring warmth, joy, and a touch of holiday spirit to every celebration.	\N	\N	\N	\N	17	17	1	0	Merry Moments	1	1	17	\N	426861049	4	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	14	47	2025-01-15 11:22:06	2025-01-20 14:36:05	\N	0	0	0	0	0	0	7	0	\N	Delivery Dispatch: Within 24 Hours Free shipping across all products on a minimum purchase of $50. International delivery time - 7-10 business days Cash on delivery might be available Easy 30 days returns and exchanges Returns Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Shipping There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage.	\N	\N	\N
48	1	mmmm	mmmm	\N	\N	\N	\N	59	59	1	0	Testing	1	1	59	\N	924654054	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	49	2025-01-15 14:06:59	2025-01-15 14:58:51	\N	0	0	0	0	0	0	0	0	3.7	yyyy	\N	\N	\N
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
3	1	XL		1	\N	\N	\N	\N	0	0	#ffffff
2	2	Black		1	\N	\N	\N	\N	0	0	#ffffff
4	2	Multicolor		1	\N	\N	\N	\N	0	0	#ffffff
5	2	Brown		1	\N	\N	\N	\N	0	0	#ffffff
6	2	White		1	\N	\N	\N	\N	0	0	#ffffff
7	2	Silver		1	\N	\N	\N	\N	0	0	#ffffff
\.


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_category (product_category_id, product_id, category_id) FROM stdin;
158	22	9
160	36	9
161	37	9
162	25	3
163	26	3
164	21	9
165	38	3
166	20	4
170	17	4
171	16	3
173	29	8
174	29	4
175	28	8
176	28	4
20	5	3
21	6	3
23	9	1
178	31	10
179	32	14
180	32	11
181	11	13
28	7	1
30	10	1
183	2	13
34	12	1
35	13	1
186	30	11
187	1	13
188	8	13
189	35	9
190	33	11
191	19	4
192	15	3
194	27	4
195	18	4
144	34	9
147	3	4
148	4	14
151	14	3
199	42	18
200	41	18
154	23	9
202	44	16
203	43	16
157	24	9
204	45	15
207	40	17
208	47	14
209	47	16
226	48	13
228	46	15
229	39	17
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
142	2	3	2025-01-15 07:45:33	2025-01-15 07:45:33	Woolen
143	1	3	2025-01-15 10:34:18	2025-01-15 10:34:18	Cotton
144	19	7	2025-01-15 10:37:15	2025-01-15 10:37:15	\N
145	19	3	2025-01-15 10:37:15	2025-01-15 10:37:15	Glass, Wood
146	18	3	2025-01-15 10:42:46	2025-01-15 10:42:46	Wood, Metal, Parachute
147	18	5	2025-01-15 10:42:46	2025-01-15 10:42:46	Home box
150	42	6	2025-01-15 11:15:07	2025-01-15 11:15:07	\N
151	42	2	2025-01-15 11:15:07	2025-01-15 11:15:07	\N
152	47	2	2025-01-15 13:25:10	2025-01-15 13:25:10	Washs
153	47	3	2025-01-15 13:25:10	2025-01-15 13:25:10	Master Name
156	48	2	2025-01-15 14:58:51	2025-01-15 14:58:51	Washs
157	48	4	2025-01-15 14:58:51	2025-01-15 14:58:51	Plates
158	48	7	2025-01-15 14:58:51	2025-01-15 14:58:51	Recycle
159	46	3	2025-01-20 14:36:05	2025-01-20 14:36:05	Cotton, Velvet
160	46	3	2025-01-20 14:36:05	2025-01-20 14:36:05	Cotton, Velvet
161	46	8	2025-01-20 14:36:05	2025-01-20 14:36:05	5 cm
162	39	2	2025-03-10 09:38:36	2025-03-10 09:38:36	\N
107	4	3	2025-01-15 07:10:39	2025-01-15 07:10:39	Jute
108	4	2	2025-01-15 07:10:39	2025-01-15 07:10:39	\N
109	4	7	2025-01-15 07:10:39	2025-01-15 07:10:39	\N
110	4	5	2025-01-15 07:10:39	2025-01-15 07:10:39	Unique
163	39	3	2025-03-10 09:38:36	2025-03-10 09:38:36	Soft Cotton
164	39	8	2025-03-10 09:38:36	2025-03-10 09:38:36	20 cm
117	23	3	2025-01-15 07:20:15	2025-01-15 07:20:15	Cotton, linen
118	23	5	2025-01-15 07:20:15	2025-01-15 07:20:15	Cross
121	24	3	2025-01-15 07:23:11	2025-01-15 07:23:11	Jute, Parachute
122	24	5	2025-01-15 07:23:11	2025-01-15 07:23:11	Unique
123	22	3	2025-01-15 07:24:42	2025-01-15 07:24:42	Jute, Parachute
124	22	6	2025-01-15 07:24:42	2025-01-15 07:24:42	\N
125	26	7	2025-01-15 07:33:07	2025-01-15 07:33:07	\N
126	26	3	2025-01-15 07:33:07	2025-01-15 07:33:07	Zircoon, Gold
127	21	3	2025-01-15 07:34:21	2025-01-15 07:34:21	Gold, Rose Gold, Silver, Platinum
128	21	5	2025-01-15 07:34:21	2025-01-15 07:34:21	Persian
129	20	3	2025-01-15 07:37:52	2025-01-15 07:37:52	Wood
134	17	3	2025-01-15 07:40:20	2025-01-15 07:40:20	Wood
135	17	8	2025-01-15 07:40:20	2025-01-15 07:40:20	King
136	29	4	2025-01-15 07:41:11	2025-01-15 07:41:11	Recycled metal. Item may include additional materials or use methods that aren't considered sustainable features on our site.
137	29	3	2025-01-15 07:41:11	2025-01-15 07:41:11	Cotton, Velvet
138	31	5	2025-01-15 07:42:52	2025-01-15 07:42:52	Unique
139	11	3	2025-01-15 07:44:37	2025-01-15 07:44:37	Woolen
140	11	8	2025-01-15 07:44:37	2025-01-15 07:44:37	32
\.


--
-- Data for Name: product_selected_attribute_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_selected_attribute_list (product_attribute_id, product_id, manage_stock, stock_quantity, allow_back_order, stock_status, sold_individually, weight, length, height, width, shipping_class, sale_price, regular_price, taxable, image, shipping_note, title, rating, rated_users, image_temp, barcode, image_action, pr_code, product_desc, product_full_descr, size_chart) FROM stdin;
12	12	0	6	0	0	0	\N	\N	\N	\N	0	200	200	1	677ce6ac3f87b1736238764.jpg,677ce6ac3f9a31736238764.jpg,677ce6ac3fa551736238764.jpg,677ce6ac3faf81736238764.jpg	\N	\N	\N	0	\N	\N	\N	\N	Premium quality clothing, focusing on high-end fabrics and sophisticated designs.	Luxe Loom\r\nIndulge in luxury with the Luxe Loom collection. This line offers high-end fabrics and sophisticated designs for those who seek a touch of elegance in their everyday wear. Perfect for both formal occasions and upscale casual looks.	\N
3	3	0	563	0	0	0	\N	\N	\N	\N	0	359	600	1	6786bcb9c18d81736883385.jpg,6786bcb9c1cb41736883385.jpg	\N	\N	\N	0	\N	\N	\N	000000000	A custom wall light is a tailored lighting fixture designed to meet specific aesthetic and functional preferences. These lights can be made to fit any interior style, whether modern, rustic, or contemporary, and can be crafted in various shapes, sizes, and materials. Custom wall lights are often designed to complement the unique features of a space, providing both ambient and accent lighting.	A custom wall light is a tailored lighting fixture designed to meet specific aesthetic and functional preferences. These lights can be made to fit any interior style, whether modern, rustic, or contemporary, and can be crafted in various shapes, sizes, and materials. Custom wall lights are often designed to complement the unique features of a space, providing both ambient and accent lighting.	\N
14	14	0	13	0	0	0	\N	\N	\N	\N	0	600	650	1	6786b959c42661736882521.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty. The word "Gleaming" suggests a radiant, shining quality, symbolizing the brilliance of fine jewelry. "Grace" adds an element of elegance and timeless appeal, evoking the delicate craftsmanship and refined designs that the brand offers.	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty. The word "Gleaming" suggests a radiant, shining quality, symbolizing the brilliance of fine jewelry. "Grace" adds an element of elegance and timeless appeal, evoking the delicate craftsmanship and refined designs that the brand offers.	\N
6	6	0	456	0	0	0	\N	\N	\N	\N	0	559	600	1	677b9a75797e11736153717.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Painters Palette, Floral Paint Palette, Botanical decorReal ,Pressed Flowers, Creative Artist Gift, Art lover tool, Mothers Day	High-quality dried flowers: Our natural dried flowers are organic, non-toxic and tasteless.\r\nA resin palette is the ideal addition to your creative equipment, as resin is relatively easy to clean (though it is advisable to clean while the paint is wet - as you’ll need less water and time). Transparent resin also provides us with an excellent canvas to decorate for your aesthetic pleasure. This, in turn, allows you to paint your own canvas with beautiful equipment at hand.	\N
5	5	0	6542	0	0	0	\N	\N	\N	\N	0	250	400	1	677b9a56720fd1736153686.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Handmade Brown Textured Ceramic Lamp | Bedroom & Livingroom Lightning | Unique, Minimalist Designed	"Rocca Lamp" This piece will bring the minimalist attitude of nature into your home.\r\n•This unique ceramic lamp is made from high quality brown stoneware clay using hand building techniques only. Fired at high temperature (1240°C)\r\n•Will add value to your home with its organic texture and minimalist shape.	\N
8	8	0	15	0	0	0	0	0	0	0	0	180	200	1	6787602add37d1736925226.jpg,,	\N	\N	\N	0	\N		\N		Experience the ultimate in comfort with the Cotton Luxe collection. Soft, breathable cotton meets luxurious designs in this line, providing the perfect balance of relaxed style and high-end quality.	Experience the ultimate in comfort with the Cotton Luxe collection. Soft, breathable cotton meets luxurious designs in this line, providing the perfect balance of relaxed style and high-end quality.	\N
4	4	0	442	0	0	0	\N	\N	\N	\N	0	330	500	1	67875f6f60dca1736925039.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Crown & Brim is a premium hat and cap brand known for its impeccable craftsmanship and stylish designs. Combining modern trends with classic styles, Crown & Brim offers a diverse collection of hats and caps that cater to various occasions, from casual wear to formal events. Each piece is made from high-quality materials to ensure comfort, durability, and a perfect fit.	Crown & Brim is a premium hat and cap brand known for its impeccable craftsmanship and stylish designs. Combining modern trends with classic styles, Crown & Brim offers a diverse collection of hats and caps that cater to various occasions, from casual wear to formal events. Each piece is made from high-quality materials to ensure comfort, durability, and a perfect fit.	\N
2	2	0	54643	0	0	0	\N	\N	\N	\N	0	500	600	1	67875e441c2cd1736924740.jpg,6787679d386691736927133.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Vibrant Vibes is a fashion brand that embodies elegance, sophistication, and timeless beauty. Specializing in meticulously crafted garments and accessories, the brand focuses on using delicate, high-quality fabrics to create designs that exude a sense of lightness and grace.	Vibrant Vibes is a fashion brand that embodies elegance, sophistication, and timeless beauty. Specializing in meticulously crafted garments and accessories, the brand focuses on using delicate, high-quality fabrics to create designs that exude a sense of lightness and grace.	\N
9	9	0	10	0	0	0	0	0	0	0	0	100	100	1	677bb3eb488771736160235.png	\N	\N	\N	0	\N		\N		Some Short DEscription	Some Long DEscription	\N
13	13	0	6	0	0	0	\N	\N	\N	\N	0	300	300	1	677ce6dc9bad41736238812.jpg,677ce6dc9bf421736238812.jpg	\N	\N	\N	0	\N	\N	\N	\N	Modern, city-inspired clothing for a trendy, on-the-go lifestyle.	Designed for the modern city dweller, the Urban Weave collection blends contemporary designs with comfort and practicality. From sharp jackets to casual tees, these pieces are perfect for navigating the fast-paced urban lifestyle with style.	\N
10	10	0	10	0	0	0	0	0	0	0	0	100	100	1	677bc12405c2a1736163620.png,,,,	\N	\N	\N	0	\N		\N		Test Short Description 1	Test Long Description 1	\N
16	16	0	8	0	0	0	\N	\N	\N	\N	0	400	400	1	6786b8fdaaba11736882429.jpg,6786b8fdaaf941736882429.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty.	This name would be perfect for a jewelry vendor focused on high-quality, exquisite pieces that emphasize both beauty and grace. It suggests a brand that appeals to those who appreciate both luxury and understated elegance, making it a great fit for products such as diamond jewelry, fine gemstones, or elegant gold pieces.	\N
18	18	0	3	0	0	0	\N	\N	\N	\N	0	1200	2000	1	6786bb7c5d9f01736883068.jpg,6786bb7c5dff91736883068.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Vivid Interiors\r\nVivid Interiors is a décor brand that brings vibrant and colorful designs to life.	Vivid Interiors\r\nVivid Interiors is a décor brand that brings vibrant and colorful designs to life. Whether you're looking for bold statement pieces or subtle accents, Vivid Interiors ensures that every corner of your home radiates with energy and style.	\N
20	20	0	2	0	0	0	\N	\N	\N	\N	0	7000	8000	1	6786bb1dd59da1736882973.jpg,6786bb1dd605b1736882973.jpg,6786bcfe377881736883454.jpg,6786bcfe37a701736883454.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Modern Nest\r\nModern Nest specializes in sleek, contemporary décor pieces that blend functionality and style.	Modern Nest\r\nModern Nest specializes in sleek, contemporary décor pieces that blend functionality and style. With an eye for cutting-edge trends, Modern Nest is perfect for those looking to create a fresh, stylish atmosphere in their homes.	\N
7	8	0	4	0	0	0	0	0	0	0	0	119	120	1	678767c132a181736927169.jpg,	\N	\N	\N	0	\N		\N		Experience the ultimate in comfort with the Cotton Luxe collection. Soft, breathable cotton meets luxurious designs in this line, providing the perfect balance of relaxed style and high-end quality.	Experience the ultimate in comfort with the Cotton Luxe collection. Soft, breathable cotton meets luxurious designs in this line, providing the perfect balance of relaxed style and high-end quality.	\N
17	17	0	3	0	0	0	\N	\N	\N	\N	0	4000	4000	1	6786bbd90afe51736883161.jpg,6786bbf903db81736883193.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Vivid Interiors\r\nVivid Interiors is a décor brand that brings vibrant and colorful designs to life.	Vivid Interiors\r\nVivid Interiors is a décor brand that brings vibrant and colorful designs to life. Whether you're looking for bold statement pieces or subtle accents, Vivid Interiors ensures that every corner of your home radiates with energy and style.	\N
19	19	0	7	0	0	0	\N	\N	\N	\N	0	8000	8000	1	6786bad93d61d1736882905.jpg,67876612e4be51736926738.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Opal & Oak combines nature-inspired designs with elegant craftsmanship.	Opal & Oak combines nature-inspired designs with elegant craftsmanship. The brand offers décor that incorporates natural materials like wood and stone, creating a harmonious and earthy aesthetic that elevates any home.	\N
15	15	0	1	0	0	0	\N	\N	\N	\N	0	330	330	1	6786b922db0a81736882466.jpg,6786b922db5d01736882466.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty.	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty. The word "Gleaming" suggests a radiant, shining quality, symbolizing the brilliance of fine jewelry. "Grace" adds an element of elegance and timeless appeal, evoking the delicate craftsmanship and refined designs that the brand offers.	\N
26	25	0	45	0	0	0	\N	\N	\N	\N	0	400	450	1	6786b8b3ba8a71736882355.jpg	\N	\N	\N	0	\N	\N	\N	000000000	This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.	This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.	\N
27	26	0	13	0	0	0	\N	\N	\N	\N	0	500	500	1	6786b84fb91681736882255.jpg,6786b84fb97621736882255.jpg	\N	\N	\N	0	\N	\N	\N	000000000	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N
25	24	0	39	0	0	0	\N	\N	\N	\N	0	400	400	1	678761578a0921736925527.jpg,6787625f019fd1736925791.jpg	\N	\N	\N	0	\N	\N	\N	000000000	This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.	This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design.	\N
24	23	0	35	0	0	0	\N	\N	\N	\N	0	350	350	1	6787618ecdac21736925582.jpg	\N	\N	\N	0	\N	\N	\N	000000000	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N
30	29	0	12	0	0	0	\N	\N	\N	\N	0	250	250	1	6786b78eb2eb41736882062.jpg	\N	\N	\N	0	\N	\N	\N	000000000	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N
29	28	0	12	0	0	0	\N	\N	\N	\N	0	250	250	1	6786b7e56f2841736882149.jpg	\N	\N	\N	0	\N	\N	\N	000000000	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N	\N
28	27	0	17	0	0	0	\N	\N	\N	\N	0	500	500	1	6786b8054e6421736882181.jpg	\N	\N	\N	0	\N	\N	\N	000000000	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	By registering, you agree to pay in full to secure your spot. The workshop covers painting and drawing techniques, and materials are provided (you may bring your own). Cancellations made 48 hours in advance receive a full refund; 50% refund is given for cancellations within 24-48 hours. No refunds for cancellations within 24 hours or no-shows. Participants must follow all safety guidelines and are responsible for their belongings. Photos and videos may be taken for promotional purposes. Disruptive behavior will result in removal without refund. Organizers are not liable for personal injury or property damage.	\N
31	30	0	12	0	0	0	\N	\N	\N	\N	0	250	250	1	6786b742955981736881986.jpg	\N	\N	\N	0	\N	\N	\N	000000000	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	This name combines the essence of craftsmanship (Thread) with modern fashion (Trend), making it ideal for a brand offering handmade bags, wallets, scarves, and more.	\N
38	37	0	\N	0	0	0	\N	\N	\N	\N	0	480	500	1	678764753586b1736926325.jpg,6787647535e3c1736926325.jpg	\N	\N	\N	0	\N	\N	\N	\N	Ethereal Threads offers a collection that seamlessly blends contemporary style with classic allure, making it the perfect choice for those seeking refined, ethereal fashion that makes a statement.	Ethereal Threads offers a collection that seamlessly blends contemporary style with classic allure, making it the perfect choice for those seeking refined, ethereal fashion that makes a statement.	\N
36	35	0	12	0	0	0	\N	\N	\N	\N	0	100	150	1	6787624bed32f1736925771.jpg,6787624bedbf11736925771.jpg	\N	\N	\N	0	\N	\N	\N	000000000	KKT is a premium hat and cap brand known for its impeccable craftsmanship and stylish designs. Combining modern trends with classic styles, Crown & Brim offers a diverse collection of hats and caps that cater to various occasions, from casual wear to formal events. Each piece is made from high-quality materials to ensure comfort, durability, and a perfect fit.	KKT is a premium hat and cap brand known for its impeccable craftsmanship and stylish designs. Combining modern trends with classic styles, Crown & Brim offers a diverse collection of hats and caps that cater to various occasions, from casual wear to formal events. Each piece is made from high-quality materials to ensure comfort, durability, and a perfect fit.	\N
39	38	0	27	0	0	0	\N	\N	\N	\N	0	1200	1500	1	678765a6295e11736926630.jpg,678765a6298991736926630.jpg	\N	\N	\N	0	\N	\N	\N	\N	Ethereal Threads offers a collection that seamlessly blends contemporary style with classic allure, making it the perfect choice for those seeking refined, ethereal fashion that makes a statement.	Ethereal Threads offers a collection that seamlessly blends contemporary style with classic allure, making it the perfect choice for those seeking refined, ethereal fashion that makes a statement.	\N
33	32	0	19	0	0	0	\N	\N	\N	\N	0	250	250	1	6786b5329f38c1736881458.jpg,6787673164ce91736927025.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Little Bundles has the cutest personalised gifts for newborn baby boys & baby girls in UAE.	Little Bundles has the cutest personalised gifts for newborn baby boys & baby girls in UAE. There are adorable options from Sophie La Giraffe, Citron and our own Mamas & Papas range to choose from.	\N
34	33	0	24	0	0	0	\N	\N	\N	\N	0	250	250	1	6786b4a22cdd21736881314.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Everyday essentials: A quality wallet, a stylish watch, or a comfortable backpack. Self-care: Grooming products, gym membership, or a subscription box.	Practical Gifts: Everyday essentials: A quality wallet, a stylish watch, or a comfortable backpack. Self-care: Grooming products, gym membership, or a subscription box. The most important thing is to choose a gift that comes from the heart and shows him how much you care.	\N
1	1	0	67656	0	0	0	\N	\N	\N	\N	0	449	500	1	677e7f8dc5d9d1736343437.jpg,67876785df5441736927109.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Ethereal Threads is a fashion brand that embodies elegance, sophistication, and timeless beauty. Specializing in meticulously crafted garments and accessories, the brand focuses on using delicate, high-quality fabrics to create designs that exude a sense of lightness and grace.	Ethereal Threads is a fashion brand that embodies elegance, sophistication, and timeless beauty. Specializing in meticulously crafted garments and accessories, the brand focuses on using delicate, high-quality fabrics to create designs that exude a sense of lightness and grace.	\N
11	11	0	7	0	0	0	\N	\N	\N	\N	0	400	450	1	67876765887f11736927077.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Classic Stitch Collection\r\nTimeless elegance in every thread. The Classic Stitch Collection features versatile, wardrobe-staple pieces designed to last. From tailored blazers to sleek trousers, these items are perfect for those who appreciate enduring style and quality craftsmanship.	Classic Stitch Collection\r\nTimeless elegance in every thread. The Classic Stitch Collection features versatile, wardrobe-staple pieces designed to last. From tailored blazers to sleek trousers, these items are perfect for those who appreciate enduring style and quality craftsmanship.	\N
35	34	0	6	0	0	0	\N	\N	\N	\N	0	300	300	1	67863001c24151736847361.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine.	Celebrate this Season of Love with Passion and style. It’s time to recognize the person of your dreams as your true valentine. Check out the Best Collections of Valentine’s day Gifts all across UAE and Surprise your Valentine with joy and romance. Take a look into Personalized cakes, Heart shaped caked, red velvet strawberry cakes, flowers, and sweets. Happy Valentines day! with loads of Love from GDO.	\N
41	40	0	15	0	0	0	\N	\N	\N	\N	0	600	700	1	67879acd4a0d11736940237.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Cherished Beginnings is a premium baby gift brand dedicated to providing thoughtful and high-quality gifts for newborns and their families. Our carefully curated collection features a range of adorable and practical items, from soft blankets and plush toys to personalized keepsakes and essentials.	Cherished Beginnings is a premium baby gift brand dedicated to providing thoughtful and high-quality gifts for newborns and their families. Our carefully curated collection features a range of adorable and practical items, from soft blankets and plush toys to personalized keepsakes and essentials.	\N
32	31	0	14	0	0	0	\N	\N	\N	\N	0	400	500	1	6786b4bf63e201736881343.jpg	\N	\N	\N	0	\N	\N	\N	000000000	The best housewarming gifts last longer than your visits\r\nBetter sound, cleaner air or smarter lighting. Nothing says welcome home like new home electronics. And with these practical housewarming gifts, you can help them find new ways to make the most of their life at home – every day.	The best housewarming gifts last longer than your visits\r\nBetter sound, cleaner air or smarter lighting. Nothing says welcome home like new home electronics. And with these practical housewarming gifts, you can help them find new ways to make the most of their life at home – every day.	\N
40	39	0	95	0	0	0	\N	\N	\N	\N	0	750	750	1	67879744054ca1736939332.jpg,6787974405a6d1736939332.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development to fill empty spaces in a layout that does not yet have content.Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development to fill empty spaces in a layout that does not yet have content.	Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development to fill empty spaces in a layout that does not yet have content.	\N
43	42	0	20	0	0	0	\N	\N	\N	\N	0	250	350	1	678798bb034ca1736939707.jpg	\N	\N	\N	0	\N	\N	\N	\N	ToyWhiz is a dynamic toy brand that brings joy and excitement to children by offering a wide range of high-quality, innovative toys. Designed to entertain, educate, and inspire, ToyWhiz products cater to various age groups and developmental stages, ensuring there’s something for every child. From creative building sets to interactive learning toys, we prioritize safety and durability, using eco-friendly materials that are kind to both kids and the planet.	ToyWhiz is a dynamic toy brand that brings joy and excitement to children by offering a wide range of high-quality, innovative toys. Designed to entertain, educate, and inspire, ToyWhiz products cater to various age groups and developmental stages, ensuring there’s something for every child. From creative building sets to interactive learning toys, we prioritize safety and durability, using eco-friendly materials that are kind to both kids and the planet.	\N
42	41	0	50	0	0	0	\N	\N	\N	\N	0	350	450	1	6787984e7658c1736939598.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Playtopia is a vibrant and innovative toy brand dedicated to sparking creativity, learning, and fun for children of all ages. Our toys are thoughtfully designed to inspire imagination and encourage developmental growth, from educational puzzles to interactive playsets. With a focus on safety, quality, and sustainability, Playtopia ensures every toy is made with non-toxic materials and built to last.	Playtopia is a vibrant and innovative toy brand dedicated to sparking creativity, learning, and fun for children of all ages. Our toys are thoughtfully designed to inspire imagination and encourage developmental growth, from educational puzzles to interactive playsets. With a focus on safety, quality, and sustainability, Playtopia ensures every toy is made with non-toxic materials and built to last.	\N
44	43	0	40	0	0	0	\N	\N	\N	\N	0	550	600	1	678799161b3e01736939798.jpg,6787997a2d3191736939898.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Enchanted Wick is a luxury candle brand that transforms any space into a serene and inviting haven. Crafted with the finest ingredients, each candle is hand-poured and infused with unique, captivating scents that evoke a sense of tranquility and warmth. From soothing lavender to refreshing citrus blends, Enchanted Wick offers a range of premium candles that cater to every mood and occasion.	Enchanted Wick is a luxury candle brand that transforms any space into a serene and inviting haven. Crafted with the finest ingredients, each candle is hand-poured and infused with unique, captivating scents that evoke a sense of tranquility and warmth. From soothing lavender to refreshing citrus blends, Enchanted Wick offers a range of premium candles that cater to every mood and occasion.	\N
46	45	0	40	0	0	0	\N	\N	\N	\N	0	500	750	1	67879a0f6a23e1736940047.jpg,67879a0f6a81c1736940047.jpg	\N	\N	\N	0	\N	\N	\N	\N	Joyful Treasures is a holiday-focused gift brand that specializes in curating the perfect Christmas gifts to spread cheer and warmth. From personalized keepsakes and festive décor to cozy apparel and unique stocking stuffers, we offer a wide selection of thoughtfully crafted items for all ages.	Joyful Treasures is a holiday-focused gift brand that specializes in curating the perfect Christmas gifts to spread cheer and warmth. From personalized keepsakes and festive décor to cozy apparel and unique stocking stuffers, we offer a wide selection of thoughtfully crafted items for all ages.	\N
48	47	0	10	0	0	0	\N	\N	\N	\N	0	123	123	1	6787b73629fa21736947510.jpg	\N	\N	\N	0	\N	\N	\N	\N	Shipment And Policies	Shipment And Policies	\N
47	46	0	20	0	0	0	\N	\N	\N	\N	0	350	450	1	67879a5e8318c1736940126.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Merry Moments is a Christmas gift brand dedicated to making the holiday season even more magical. Our curated collection features a wide range of festive gifts, from charming ornaments and personalized stockings to cozy winter essentials and luxurious holiday treats. Each item is selected to bring warmth, joy, and a touch of holiday spirit to every celebration.	Merry Moments is a Christmas gift brand dedicated to making the holiday season even more magical. Our curated collection features a wide range of festive gifts, from charming ornaments and personalized stockings to cozy winter essentials and luxurious holiday treats. Each item is selected to bring warmth, joy, and a touch of holiday spirit to every celebration.	\N
49	48	0	15	0	0	0	\N	\N	\N	\N	0	400	500	1	6787c1037f7f91736950019.jpg	\N	\N	\N	0	\N	\N	\N	0000000000	mmmm	mmmm	\N
45	44	0	25	0	0	0	\N	\N	\N	\N	0	400	650	1	6787996874c361736939880.jpg	\N	\N	\N	0	\N	\N	\N	\N	uxe Flame is a high-end candle brand dedicated to elevating your home with premium scents and elegant designs. Each candle is expertly crafted using eco-friendly waxes and infused with carefully selected fragrances to create a soothing, luxurious atmosphere. Whether it's the warm glow of a vanilla bean or the refreshing aroma of ocean breeze, Luxe Flame offers a diverse collection that adds sophistication and serenity to any space.	uxe Flame is a high-end candle brand dedicated to elevating your home with premium scents and elegant designs. Each candle is expertly crafted using eco-friendly waxes and infused with carefully selected fragrances to create a soothing, luxurious atmosphere. Whether it's the warm glow of a vanilla bean or the refreshing aroma of ocean breeze, Luxe Flame offers a diverse collection that adds sophistication and serenity to any space.	\N
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
8	2	5	36
\.


--
-- Data for Name: product_specifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_specifications (prod_spec_id, product_id, spec_title, spec_descp, lang, spec_title_arabic, spec_descp_arabic) FROM stdin;
145	29	\N	\N	1	\N	\N
146	29	\N	\N	1	\N	\N
147	31	\N	\N	1	\N	\N
148	11	\N	\N	1	\N	\N
149	11	\N	\N	1	\N	\N
151	2	\N	\N	1	\N	\N
152	1	\N	\N	1	\N	\N
12	9	\N	\N	1	\N	\N
153	19	\N	\N	1	\N	\N
14	7	\N	\N	1	\N	\N
15	7	\N	\N	1	\N	\N
154	19	\N	\N	1	\N	\N
155	18	\N	\N	1	\N	\N
156	18	\N	\N	1	\N	\N
159	48	\N	\N	1	\N	\N
160	48	\N	\N	1	\N	\N
161	48	\N	\N	1	\N	\N
162	46	\N	\N	1	\N	\N
163	46	\N	\N	1	\N	\N
164	46	\N	\N	1	\N	\N
165	39	\N	\N	1	\N	\N
166	39	\N	\N	1	\N	\N
167	39	\N	\N	1	\N	\N
116	4	\N	\N	1	\N	\N
117	4	\N	\N	1	\N	\N
118	4	\N	\N	1	\N	\N
119	4	\N	\N	1	\N	\N
126	23	\N	\N	1	\N	\N
127	23	\N	\N	1	\N	\N
130	24	\N	\N	1	\N	\N
131	24	\N	\N	1	\N	\N
132	22	\N	\N	1	\N	\N
133	22	\N	\N	1	\N	\N
134	26	\N	\N	1	\N	\N
135	26	\N	\N	1	\N	\N
136	21	\N	\N	1	\N	\N
137	21	\N	\N	1	\N	\N
138	20	\N	\N	1	\N	\N
143	17	\N	\N	1	\N	\N
144	17	\N	\N	1	\N	\N
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

COPY public.ratings (id, type, user_id, product_id, product_varient_id, service_id, vendor_id, rating, title, comment, created_at, updated_at, order_id, name, email) FROM stdin;
1	1	15	4	4	0	0	5	Quality	test	2025-01-13 17:45:06	2025-01-13 17:45:06	12	\N	\N
2	1	15	4	4	0	0	4	Delivery	test	2025-01-13 17:45:06	2025-01-13 17:45:06	12	\N	\N
3	1	15	4	4	0	0	5	Overl All	test	2025-01-13 17:45:06	2025-01-13 17:45:06	12	\N	\N
4	1	9	20	20	0	0	2.5	Quality	test	2025-01-14 10:31:37	2025-01-14 10:31:37	13	\N	\N
5	1	9	20	20	0	0	2.5	Delivery	test	2025-01-14 10:31:37	2025-01-14 10:31:37	13	\N	\N
6	1	9	20	20	0	0	2.5	Overl All	test	2025-01-14 10:31:37	2025-01-14 10:31:37	13	\N	\N
7	1	9	15	15	0	0	3	Quality	test review.	2025-01-14 12:33:37	2025-01-14 12:33:37	20	\N	\N
8	1	9	15	15	0	0	3	Delivery	test review.	2025-01-14 12:33:37	2025-01-14 12:33:37	20	\N	\N
9	1	9	15	15	0	0	3	Overl All	test review.	2025-01-14 12:33:37	2025-01-14 12:33:37	20	\N	\N
10	3	9	0	0	14	0	2	Quality	test workshop	2025-01-14 17:30:06	2025-01-14 17:30:06	17	\N	\N
11	3	9	0	0	14	0	3	Delivery	test workshop	2025-01-14 17:30:06	2025-01-14 17:30:06	17	\N	\N
12	3	9	0	0	14	0	2.5	Overl All	test workshop	2025-01-14 17:30:06	2025-01-14 17:30:06	17	\N	\N
13	2	9	0	0	0	17	3	Quality	test	2025-01-14 18:27:58	2025-01-14 18:27:58	20	\N	\N
14	2	9	0	0	0	17	2	Delivery	test	2025-01-14 18:27:58	2025-01-14 18:27:58	20	\N	\N
15	2	9	0	0	0	17	2.5	Overl All	test	2025-01-14 18:27:58	2025-01-14 18:27:58	20	\N	\N
16	2	9	0	0	0	18	2.5	Quality	tedtshjs	2025-01-14 18:35:19	2025-01-14 18:35:19	20	\N	\N
17	2	9	0	0	0	18	2.5	Delivery	tedtshjs	2025-01-14 18:35:19	2025-01-14 18:35:19	20	\N	\N
18	2	9	0	0	0	18	2.5	Overl All	tedtshjs	2025-01-14 18:35:19	2025-01-14 18:35:19	20	\N	\N
19	3	9	0	0	15	0	4	Quality	test	2025-01-14 19:09:05	2025-01-14 19:09:05	18	\N	\N
20	3	9	0	0	15	0	2	Delivery	test	2025-01-14 19:09:05	2025-01-14 19:09:05	18	\N	\N
21	3	9	0	0	15	0	3	Overl All	test	2025-01-14 19:09:05	2025-01-14 19:09:05	18	\N	\N
22	2	9	0	0	0	16	2	Quality	tedt store	2025-01-14 19:09:30	2025-01-14 19:09:30	18	\N	\N
23	2	9	0	0	0	16	3	Delivery	tedt store	2025-01-14 19:09:30	2025-01-14 19:09:30	18	\N	\N
24	2	9	0	0	0	16	2.5	Overl All	tedt store	2025-01-14 19:09:30	2025-01-14 19:09:30	18	\N	\N
25	3	58	0	0	15	0	5	Quality	gghhhj	2025-01-15 09:23:46	2025-01-15 09:23:46	20	\N	\N
26	3	58	0	0	15	0	4.5	Delivery	gghhhj	2025-01-15 09:23:46	2025-01-15 09:23:46	20	\N	\N
27	3	58	0	0	15	0	4.5	Overl All	gghhhj	2025-01-15 09:23:46	2025-01-15 09:23:46	20	\N	\N
28	2	58	0	0	0	16	5	Quality	gghhj	2025-01-15 09:23:54	2025-01-15 09:23:54	20	\N	\N
29	2	58	0	0	0	16	4.5	Delivery	gghhj	2025-01-15 09:23:54	2025-01-15 09:23:54	20	\N	\N
30	2	58	0	0	0	16	4.5	Overl All	gghhj	2025-01-15 09:23:54	2025-01-15 09:23:54	20	\N	\N
31	1	0	30	1	0	0	4	Accusantium dolor co	Sit lorem ut aut vo	2025-01-17 17:19:12	2025-01-17 17:19:12	0	Whoopi Cabrera	xege@mailinator.com
32	1	0	34	1	0	0	1	good	ghyoyoyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy	2025-01-18 03:58:15	2025-01-18 03:58:15	0	khkjg	anil@dxbusinessgroup.com
33	1	1	8	1	0	0	5	Good Color and Quantity	lorem ipsum lorem ipsum lorem ipsum	2025-01-18 14:55:18	2025-01-18 14:55:18	0	Hiba User	hibauser@gmail.com
34	1	1	8	1	0	0	4	Culpa dolor ut prae	Eos quam ea velit	2025-01-18 16:16:14	2025-01-18 16:16:14	0	Igor Curry	wiqyn@mailinator.com
35	1	1	8	1	0	0	1	Voluptate sed nemo i	Fuga Anim voluptati	2025-01-18 16:16:37	2025-01-18 16:16:37	0	Joel Montoya	qyrune@mailinator.com
36	3	72	0	0	29	0	5	Quality		2025-03-07 21:15:56	2025-03-07 21:15:56	29	\N	\N
37	3	72	0	0	29	0	4	Delivery		2025-03-07 21:15:56	2025-03-07 21:15:56	29	\N	\N
38	3	72	0	0	29	0	3	Overl All		2025-03-07 21:15:56	2025-03-07 21:15:56	29	\N	\N
39	3	72	0	0	15	0	0.5	Quality	Test	2025-03-07 21:22:25	2025-03-07 21:22:25	29	\N	\N
40	3	72	0	0	15	0	3.5	Delivery	Test	2025-03-07 21:22:25	2025-03-07 21:22:25	29	\N	\N
41	3	72	0	0	15	0	2	Overl All	Test	2025-03-07 21:22:25	2025-03-07 21:22:25	29	\N	\N
42	3	70	0	0	45	0	3	Quality		2025-03-07 21:42:25	2025-03-07 21:42:25	45	\N	\N
43	3	70	0	0	45	0	4	Delivery		2025-03-07 21:42:25	2025-03-07 21:42:25	45	\N	\N
44	3	70	0	0	45	0	3	Overl All		2025-03-07 21:42:25	2025-03-07 21:42:25	45	\N	\N
45	2	72	0	0	0	16	4.5	Quality	test	2025-03-07 21:43:06	2025-03-07 21:43:06	46	\N	\N
46	2	72	0	0	0	16	3.5	Delivery	test	2025-03-07 21:43:06	2025-03-07 21:43:06	46	\N	\N
47	2	72	0	0	0	16	4	Overl All	test	2025-03-07 21:43:06	2025-03-07 21:43:06	46	\N	\N
48	3	70	0	0	15	0	3	Quality	test	2025-03-07 21:57:07	2025-03-07 21:57:07	45	\N	\N
49	3	70	0	0	15	0	5	Delivery	test	2025-03-07 21:57:07	2025-03-07 21:57:07	45	\N	\N
50	3	70	0	0	15	0	4	Overl All	test	2025-03-07 21:57:07	2025-03-07 21:57:07	45	\N	\N
51	2	70	0	0	0	16	2	Quality	test	2025-03-07 22:05:14	2025-03-07 22:05:14	47	\N	\N
52	2	70	0	0	0	16	5	Delivery	test	2025-03-07 22:05:14	2025-03-07 22:05:14	47	\N	\N
53	2	70	0	0	0	16	4	Overl All	test	2025-03-07 22:05:14	2025-03-07 22:05:14	47	\N	\N
54	1	70	53	7	0	0	2	Quality	test review	2025-03-08 00:02:51	2025-03-08 00:02:51	32	\N	\N
55	1	70	53	7	0	0	3	Delivery	test review	2025-03-08 00:02:51	2025-03-08 00:02:51	32	\N	\N
56	1	70	53	7	0	0	3	Overl All	test review	2025-03-08 00:02:51	2025-03-08 00:02:51	32	\N	\N
57	1	70	51	49	0	0	2	Quality	test	2025-03-08 00:05:47	2025-03-08 00:05:47	32	\N	\N
58	1	70	51	49	0	0	4	Delivery	test	2025-03-08 00:05:47	2025-03-08 00:05:47	32	\N	\N
59	1	70	51	49	0	0	5	Overl All	test	2025-03-08 00:05:47	2025-03-08 00:05:47	32	\N	\N
60	1	70	48	49	0	0	3	Quality	test	2025-03-08 00:10:08	2025-03-08 00:10:08	32	\N	\N
61	1	70	48	49	0	0	5	Delivery	test	2025-03-08 00:10:08	2025-03-08 00:10:08	32	\N	\N
62	1	70	48	49	0	0	3	Overl All	test	2025-03-08 00:10:08	2025-03-08 00:10:08	32	\N	\N
63	3	74	0	0	15	0	3	Quality	The first time the two sides agreed to meet	2025-03-08 09:03:12	2025-03-08 09:03:12	48	\N	\N
64	3	74	0	0	15	0	4	Delivery	The first time the two sides agreed to meet	2025-03-08 09:03:12	2025-03-08 09:03:12	48	\N	\N
65	3	74	0	0	15	0	0	Overl All	The first time the two sides agreed to meet	2025-03-08 09:03:12	2025-03-08 09:03:12	48	\N	\N
66	2	74	0	0	0	16	2	Quality	Cabin	2025-03-08 09:03:23	2025-03-08 09:03:23	48	\N	\N
67	2	74	0	0	0	16	3	Delivery	Cabin	2025-03-08 09:03:23	2025-03-08 09:03:23	48	\N	\N
68	2	74	0	0	0	16	4	Overl All	Cabin	2025-03-08 09:03:23	2025-03-08 09:03:23	48	\N	\N
69	1	74	30	31	0	0	4	Quality	The first time the two sides agreed to meet on	2025-03-08 15:22:01	2025-03-08 15:22:01	35	\N	\N
70	1	74	30	31	0	0	3	Delivery	The first time the two sides agreed to meet on	2025-03-08 15:22:01	2025-03-08 15:22:01	35	\N	\N
71	1	74	30	31	0	0	2	Overl All	The first time the two sides agreed to meet on	2025-03-08 15:22:01	2025-03-08 15:22:01	35	\N	\N
72	1	74	26	27	0	0	3	Quality	It’s a good ornament	2025-03-08 15:22:39	2025-03-08 15:22:39	35	\N	\N
73	1	74	26	27	0	0	2	Delivery	It’s a good ornament	2025-03-08 15:22:39	2025-03-08 15:22:39	35	\N	\N
74	1	74	26	27	0	0	1	Overl All	It’s a good ornament	2025-03-08 15:22:39	2025-03-08 15:22:39	35	\N	\N
75	1	15	32	33	0	0	3	Quality	Good job	2025-03-08 19:40:21	2025-03-08 19:40:21	38	\N	\N
76	1	15	32	33	0	0	3	Delivery	Good job	2025-03-08 19:40:21	2025-03-08 19:40:21	38	\N	\N
77	1	15	32	33	0	0	4	Overl All	Good job	2025-03-08 19:40:21	2025-03-08 19:40:21	38	\N	\N
78	3	83	0	0	16	0	0	Quality	Test	2025-03-10 05:55:11	2025-03-10 05:55:11	64	\N	\N
79	3	83	0	0	16	0	0	Delivery	Test	2025-03-10 05:55:11	2025-03-10 05:55:11	64	\N	\N
80	3	83	0	0	16	0	0	Overl All	Test	2025-03-10 05:55:11	2025-03-10 05:55:11	64	\N	\N
81	3	79	0	0	12	0	3	Quality	Good job	2025-03-10 08:37:43	2025-03-10 08:37:43	60	\N	\N
82	3	79	0	0	12	0	4	Delivery	Good job	2025-03-10 08:37:43	2025-03-10 08:37:43	60	\N	\N
83	3	79	0	0	12	0	5	Overl All	Good job	2025-03-10 08:37:43	2025-03-10 08:37:43	60	\N	\N
84	3	74	0	0	16	0	4	Quality	Heineken	2025-03-11 04:24:03	2025-03-11 04:24:03	58	\N	\N
85	3	74	0	0	16	0	2	Delivery	Heineken	2025-03-11 04:24:03	2025-03-11 04:24:03	58	\N	\N
86	3	74	0	0	16	0	0	Overl All	Heineken	2025-03-11 04:24:03	2025-03-11 04:24:03	58	\N	\N
\.


--
-- Data for Name: ratings_reply; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings_reply (id, rating_id, message, user_id, created_at, updated_at) FROM stdin;
1	11	test	1	2025-01-17 15:13:51	2025-01-17 15:13:51
\.


--
-- Data for Name: ref_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_history (id, sender_id, accepted_user_id, name, ref_code, status, discount, discount_type, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: report_reasons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_reasons (id, reason, created_at, updated_at) FROM stdin;
1	Sale of illegal or regulated goods	\N	\N
2	Hate speech or symbols	\N	\N
3	Scam or fraud	\N	\N
4	Violence or dangerous organizations	\N	\N
5	Bullying or harassment	\N	\N
\.


--
-- Data for Name: reported_shops; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reported_shops (id, user_id, shop_id, reason_id, description, created_at, updated_at) FROM stdin;
1	71	1	4	This person cheated on me	2025-03-06 18:28:04	2025-03-06 18:28:04
2	71	64	3	I want some information	2025-03-10 05:33:41	2025-03-10 05:33:41
3	88	30	1	Test	2025-03-10 06:56:56	2025-03-10 06:56:56
4	88	30	1	\N	2025-03-10 06:57:04	2025-03-10 06:57:04
5	79	30	1	Bad	2025-03-10 08:34:00	2025-03-10 08:34:00
6	89	16	2	The you’re	2025-03-10 14:23:21	2025-03-10 14:23:21
\.


--
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service (id, name, image, service_price, active, deleted, "order", description, created_at, updated_at, included, service_user_id, building_type, service_type, contract_type, duration, building_type_id, "time", document, order_count, service_price_type, activity_id, price_label, sort_order, from_date, to_date, seats, term_and_condition, work_shop_details, to_time, from_time, location, latitude, longitude, vendor_id, feature_image) FROM stdin;
5	Vendor Event	1736285259677d9c4b18414.jpg	12	0	1	0	\N	2025-01-07 21:27:39	2025-01-15 08:01:48	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-09	2025-01-16	20	Here are our conditions	\N	\N	\N	2HRR+VG2 - Dubai - United Arab Emirates	25.0421408	55.5912693	\N	173673551567847b1bb3dcd.jpg
1	Next	1736238076677ce3fc84db2.JPG	200	0	1	0	give	2025-01-07 08:21:16	2025-01-08 06:31:40	\N	\N	\N	\N	\N	300	\N	\N	\N	0	\N	0	200	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	Tesla1	1736287391677da49f65395.jpg	60	0	1	0	\N	2025-01-07 22:03:11	2025-01-15 08:01:55	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-30	2025-02-01	20	given	\N	06:06	11:22	Mulberry 2 building B1 - دبي - United Arab Emirates	25.1093069	55.2487733	\N	173673548467847afc34758.jpg
6	Egypt	1736287067677da35b2833a.jpg	20	0	1	0	\N	2025-01-07 21:57:47	2025-01-15 08:02:04	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-09	2025-01-09	20	AVailable AVailableAVailable AVailableAVailable AVailableAVailable AVailableAVailable AVailableAVailable AVailable	\N	22:02	11:33	465W+8R4 - Dubai - United Arab Emirates	25.1084406	55.2469174	\N	173673550067847b0c73a8d.jpg
2	Pottery Worskhop	1736247725677d09ad197f7.png	100	1	0	0	\N	2025-01-07 08:52:58	2025-01-15 13:39:04	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	\N	\N	15	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.	\N	\N	\N	Dubai International Airport (DXB) - Dubai - United Arab Emirates	25.2566932	55.36431779999999	17	\N
3	Next2	1736245273677d00196a04a.JPG	200	0	1	0	Term And ConditionsTerm And ConditionsTerm And ConditionsTerm And Conditions	2025-01-07 10:21:13	2025-01-13 02:32:05	\N	\N	\N	\N	\N	300	\N	\N	\N	0	\N	0	\N	0	2025-01-08	2025-01-10	20	Term And ConditionsTerm And ConditionsTerm And ConditionsTerm And Conditions Term And ConditionsTerm And ConditionsTerm And ConditionsTerm And Conditions	Term And ConditionsTerm And ConditionsTerm And ConditionsTerm And Conditions	\N	\N	\N	\N	\N	\N	\N
8	Test 1	1736288286677da81eb6eb0.png	80	0	1	0	\N	2025-01-07 22:18:06	2025-01-15 08:01:35	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-07	2025-01-31	12	Test Terms	\N	15:17	15:17	سابقا - 673C+W8J - Dubai - United Arab Emirates	25.204819000000008	55.27075933862303	\N	173673546767847aeb13ce6.jpg
10	Crafted Dimensions	173692798767876af30c491.jpg	20	1	0	0	\N	2025-01-08 10:33:48	2025-01-15 13:38:09	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-09	2025-01-09	20	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.	\N	22:22	11:01	3MQ3+R22, Makhdum Rashid, Multan, Punjab, Pakistan	30.0895212	71.65250259999999	4	\N
9	Stonecraft Studios	173692808767876b57202a6.jpg	100	1	0	0	\N	2025-01-07 22:20:36	2025-01-15 13:38:24	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-07	2025-02-20	15	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.	\N	15:20	15:19	673C+W8J - سابقا - Dubai - United Arab Emirates	25.204624852707955	55.27080225396727	18	\N
13	Artistry in Stone	173692777467876a1e5b58e.jpg	80	1	0	0	\N	2025-01-08 19:24:37	2025-01-15 13:37:17	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-08	2025-02-27	14	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.	\N	12:22	12:22	673C+P8 - Dubai - United Arab Emirates	25.204819	55.270931	5	\N
16	Yadawei Ceramic Studio Workshop	174144314367cc504782268.jpg	100	1	0	0	\N	2025-03-08 14:12:23	2025-03-08 14:12:23	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-03-08	2025-03-17	12	Yadawei: handmade, handcrafted, created by people who appreciate the time and effort that goes into making something truly unique. This is the ethos we live by, and we’re inspired to share this passion with others. As pottery and ceramics enthusiasts based in Dubai, we have come together to create a community space for everyone to explore this art form. And as pottery has always been a community activity, we’ve created a ‘members’ studio where we seek to provide inspiration	\N	17:27	09:30	karama Center - 109 Kuwait St - Al Karama - Dubai - United Arab Emirates	25.2453653	55.30314370000001	16	174144314367cc504782f81.jpg
12	Sculpture Workshop	173692762267876986d3599.jpg	300	1	0	0	\N	2025-01-08 14:25:03	2025-01-15 13:37:35	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-08	2025-03-30	20	By registering, you agree to pay in full to secure your spot. The workshop covers painting and drawing techniques, and materials are provided (you may bring your own). Cancellations made 48 hours in advance receive a full refund; 50% refund is given for cancellations within 24-48 hours. No refunds for cancellations within 24 hours or no-shows. Participants must follow all safety guidelines and are responsible for their belongings. Photos and videos may be taken for promotional purposes. Disruptive behavior will result in removal without refund. Organizers are not liable for personal injury or property damage.	\N	18:23	18:23	Level 14, Boulevard Plaza Tower 1 - Sheikh Mohammed bin Rashid Blvd - Downtown Dubai - Burj Residence Phase I & II - Dubai - United Arab Emirates	25.193402613114053	55.2730767672119	17	\N
11	Drawing & Painting	1736927673678769b9e05ea.jpg	500	1	0	0	\N	2025-01-08 14:22:29	2025-01-15 13:37:50	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-08	2025-03-30	20	By registering, you agree to pay in full to secure your spot. The workshop covers painting and drawing techniques, and materials are provided (you may bring your own). Cancellations made 48 hours in advance receive a full refund; 50% refund is given for cancellations within 24-48 hours. No refunds for cancellations within 24 hours or no-shows. Participants must follow all safety guidelines and are responsible for their belongings. Photos and videos may be taken for promotional purposes. Disruptive behavior will result in removal without refund. Organizers are not liable for personal injury or property damage.	\N	19:22	18:21	7 27th St - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates	25.201168979102967	55.241662735229475	18	\N
15	Form & Shape	173692789667876a98dcacc.jpg	30	1	0	0	\N	2025-01-14 17:34:50	2025-01-15 13:36:49	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-22	2025-01-30	30	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.	\N	04:44	11:22	14 39b St - Za'abeel - Za'abeel 2 - Dubai - United Arab Emirates	25.202100909735144	55.28869795251463	16	\N
14	Molded Masterpieces	173692782967876a55e23b8.jpg	45	1	0	0	\N	2025-01-08 19:28:53	2025-01-15 13:37:05	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-08	2025-01-16	12	\N	\N	12:27	12:27	673C+W8J - سابقا - Dubai - United Arab Emirates	25.204751048482994	55.27058767724608	16	\N
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
19	15	57	0	2,3	confirmed	1	30	\N	\N	1.5	63	\N	2025-01-15 07:15:38	2025-01-15 07:15:38	2	6787609a5344f
20	15	58	16	4,10,5,11	1	1	120	0	30	24	144	15	2025-01-15 09:22:10	2025-01-15 09:22:33	4	67877e4245f25
21	14	58	16	10	1	1	45	0	45	2.25	47.25	14	2025-01-15 09:24:32	2025-01-15 09:24:50	1	67877ed0407a0
22	11	60	0	1,2	confirmed	1	500	\N	\N	25	1050	\N	2025-01-15 15:03:01	2025-01-15 15:03:01	2	6787ce254be58
23	15	15	16	14,15	1	1	60	0	30	6	66	15	2025-01-15 15:08:24	2025-01-15 15:08:42	2	6787cf68f3242
24	15	14	16	9,8	pending	1	60	0	30	6	66	15	2025-01-15 15:16:24	2025-01-15 15:16:24	2	6787d1488a381
25	12	52	17	4,10	pending	1	600	0	300	60	660	12	2025-01-17 06:42:37	2025-01-17 06:42:37	2	6789fbdd97ea7
26	13	55	0	2,3,4	confirmed	1	80	\N	\N	12	252	\N	2025-01-17 17:37:35	2025-01-17 17:37:35	3	678a955fa56fe
27	15	72	16	16,20,26,27,30,24,23,12,18,8,22,19,17,29,28,25	pending	1	480	0	30	384	864	15	2025-03-04 23:57:06	2025-03-04 23:57:06	16	67c79352cb08a
28	15	72	16	16,20,26,27,30,24,23,12,18,8,22,19,17,29,28,25	pending	1	480	0	30	384	864	15	2025-03-04 23:57:06	2025-03-04 23:57:06	16	67c79352dc74e
29	15	72	16	16,20,26,27,30,24,23,12,18,8,22,19,17,29,28,25	1	1	480	0	30	384	864	15	2025-03-04 23:57:06	2025-03-04 23:58:13	16	67c79352e837a
30	10	70	4	11	pending	1	20	0	20	1	21	10	2025-03-05 19:23:12	2025-03-05 19:23:12	1	67c8a4a0301ea
31	15	70	16	2,3	pending	1	60	0	30	6	66	15	2025-03-05 19:30:32	2025-03-05 19:30:32	2	67c8a658dcb27
32	15	70	16	3	pending	1	30	0	30	1.5	31.5	15	2025-03-05 19:32:47	2025-03-05 19:32:47	1	67c8a6df66aa6
33	15	70	16	3	pending	1	30	0	30	1.5	31.5	15	2025-03-05 19:34:47	2025-03-05 19:34:47	1	67c8a7575e4c5
34	15	70	16	3	pending	1	30	0	30	1.5	31.5	15	2025-03-05 19:34:57	2025-03-05 19:34:57	1	67c8a7619368f
35	15	70	16	3	pending	1	30	0	30	1.5	31.5	15	2025-03-05 19:36:30	2025-03-05 19:36:30	1	67c8a7be45d42
36	15	70	16	3	pending	1	30	0	30	1.5	31.5	15	2025-03-05 19:36:50	2025-03-05 19:36:50	1	67c8a7d266aab
37	15	70	16	2	pending	1	30	0	30	1.5	31.5	15	2025-03-05 19:40:37	2025-03-05 19:40:37	1	67c8a8b5610ae
38	15	78	16	3,9,6	pending	1	90	0	30	13.5	103.5	15	2025-03-07 09:29:26	2025-03-07 09:29:26	3	67cabc76f13ea
39	15	78	16	3,9,6	pending	1	90	0	30	13.5	103.5	15	2025-03-07 09:29:50	2025-03-07 09:29:50	3	67cabc8eb88ca
40	14	78	16	1	pending	1	45	0	45	2.25	47.25	14	2025-03-07 09:30:02	2025-03-07 09:30:02	1	67cabc9a4ddde
41	14	78	16	1	pending	1	45	0	45	2.25	47.25	14	2025-03-07 09:30:20	2025-03-07 09:30:20	1	67cabcacc3310
42	14	72	16	1	1	1	45	0	45	2.25	47.25	14	2025-03-07 21:31:27	2025-03-07 21:31:46	1	67cb65afc673d
43	15	70	16	2,9	pending	1	60	0	30	6	66	15	2025-03-07 21:32:31	2025-03-07 21:32:31	2	67cb65efa6f95
44	15	70	16	2,9	pending	1	60	0	30	6	66	15	2025-03-07 21:32:51	2025-03-07 21:32:51	2	67cb660387e52
45	15	70	16	3,9	1	1	60	0	30	6	66	15	2025-03-07 21:40:22	2025-03-07 21:40:41	2	67cb67c6742ae
46	15	72	16	3,9	1	1	60	0	30	6	66	15	2025-03-07 21:40:25	2025-03-07 21:40:53	2	67cb67c98e9e6
47	15	70	16	2	1	1	30	0	30	1.5	31.5	15	2025-03-07 22:04:04	2025-03-07 22:04:25	1	67cb6d547a4c0
48	15	74	16	6,21	1	1	60	0	30	6	66	15	2025-03-08 09:00:08	2025-03-08 09:00:26	2	67cc071819ce5
49	15	76	16	7,13	1	1	60	0	30	6	66	15	2025-03-08 09:01:48	2025-03-08 09:02:16	2	67cc077c47aa3
50	16	52	16	1	pending	1	100	0	100	5	105	16	2025-03-08 14:13:15	2025-03-08 14:13:15	1	67cc507b445d1
51	16	52	16	1	pending	1	100	0	100	5	105	16	2025-03-08 14:13:26	2025-03-08 14:13:26	1	67cc50862ac84
52	16	52	16	1,2	pending	1	200	0	100	20	220	16	2025-03-08 14:13:47	2025-03-08 14:13:47	2	67cc509b5f0cf
53	16	52	16	1,2	pending	1	200	0	100	20	220	16	2025-03-08 14:13:51	2025-03-08 14:13:51	2	67cc509fa325b
54	16	52	16	1,2	pending	1	200	0	100	20	220	16	2025-03-08 14:13:56	2025-03-08 14:13:56	2	67cc50a42c855
55	16	52	16	1	pending	1	100	0	100	5	105	16	2025-03-08 14:14:01	2025-03-08 14:14:01	1	67cc50a97d174
56	16	52	16	1	pending	1	100	0	100	5	105	16	2025-03-08 14:14:08	2025-03-08 14:14:08	1	67cc50b0585ab
57	16	52	16	1,2	pending	1	200	0	100	20	220	16	2025-03-08 14:14:59	2025-03-08 14:14:59	2	67cc50e3db7b7
58	16	74	16	1	1	1	100	0	100	5	105	16	2025-03-08 16:15:41	2025-03-08 16:16:01	1	67cc6d2dceb58
59	16	72	16	2,3	1	1	200	0	100	20	220	16	2025-03-08 16:45:22	2025-03-08 16:45:41	2	67cc74228f90f
60	12	79	17	14,13	1	1	600	0	300	60	660	12	2025-03-08 18:21:35	2025-03-08 18:21:53	2	67cc8aaf282b4
61	16	15	16	11,12	1	1	200	0	100	20	220	16	2025-03-08 19:41:15	2025-03-08 19:41:31	2	67cc9d5b686e3
62	16	58	16	4,10	1	1	200	0	100	20	220	16	2025-03-09 03:53:45	2025-03-09 03:54:02	2	67cd10c973226
63	16	81	16	5	1	1	100	0	100	5	105	16	2025-03-10 00:52:55	2025-03-10 00:53:14	1	67ce37e75d2e1
64	16	83	16	6	1	1	100	0	100	5	105	16	2025-03-10 04:41:32	2025-03-10 04:41:50	1	67ce6d7cbc932
65	16	52	16	9	pending	1	100	0	100	5	105	16	2025-03-10 11:59:35	2025-03-10 11:59:35	1	67ced4270c44a
66	16	52	16	9	pending	1	100	0	100	5	105	16	2025-03-10 11:59:40	2025-03-10 11:59:40	1	67ced42ce2f42
67	16	89	16	9	1	1	100	0	100	5	105	16	2025-03-10 14:19:31	2025-03-10 14:19:49	1	67cef4f3755d7
68	16	83	16	8	1	1	100	0	100	5	105	16	2025-03-10 21:16:49	2025-03-10 21:17:07	1	67cf56c166853
69	16	74	16	7	1	1	100	0	100	5	105	16	2025-03-11 06:42:18	2025-03-11 06:42:35	1	67cfdb4a211cf
70	2	88	17	1	1	1	100	0	100	5	105	2	2025-03-11 07:18:14	2025-03-11 07:18:40	1	67cfe3b6002c8
71	2	88	17	2	1	1	100	0	100	5	105	2	2025-03-11 07:25:27	2025-03-11 07:26:34	1	67cfe567f08a9
72	2	88	17	3	1	1	100	0	100	5	105	2	2025-03-11 07:50:56	2025-03-11 07:51:18	1	67cfeb6052d09
73	9	88	18	1	1	1	100	0	100	5	105	9	2025-03-11 07:53:42	2025-03-11 07:54:07	1	67cfec0634435
74	9	88	18	2	1	1	100	0	100	5	105	9	2025-03-11 07:58:30	2025-03-11 07:58:51	1	67cfed2629eff
75	9	88	18	3	1	1	100	0	100	5	105	9	2025-03-11 08:04:15	2025-03-11 08:04:39	1	67cfee7fef863
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
20	8	1	2025-01-13 02:31:07	2025-01-13 02:31:07	\N
21	7	1	2025-01-13 02:31:24	2025-01-13 02:31:24	\N
22	6	1	2025-01-13 02:31:40	2025-01-13 02:31:40	\N
23	5	1	2025-01-13 02:31:55	2025-01-13 02:31:55	\N
32	15	2	2025-01-15 13:36:49	2025-01-15 13:36:49	Za'abeel - Za'abeel 2 - Dubai
33	14	1	2025-01-15 13:37:05	2025-01-15 13:37:05	English
34	13	1	2025-01-15 13:37:17	2025-01-15 13:37:17	Dubai
35	12	1	2025-01-15 13:37:35	2025-01-15 13:37:35	English, Urdu, Arabic
36	9	1	2025-01-15 13:38:24	2025-01-15 13:38:24	Business Bay
\.


--
-- Data for Name: service_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_images (id, service_id, image, created_at, updated_at) FROM stdin;
2	12	173692762267876986d59d2.jpg	2025-01-15 07:53:42	2025-01-15 07:53:42
3	11	1736927673678769b9e2bda.jpg	2025-01-15 07:54:33	2025-01-15 07:54:33
4	13	173692777467876a1e5dd01.jpg	2025-01-15 07:56:14	2025-01-15 07:56:14
5	14	173692782967876a55e42f1.jpg	2025-01-15 07:57:09	2025-01-15 07:57:09
6	15	173692789667876a98df415.jpg	2025-01-15 07:58:16	2025-01-15 07:58:16
7	10	173692798767876af30eb46.jpg	2025-01-15 07:59:47	2025-01-15 07:59:47
8	16	174144314367cc50478468f.jpg	2025-03-08 14:12:23	2025-03-08 14:12:23
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
23	59	0	Ajesh Store	ajeshkumarcd@gmail.com	\N	\N	Its a store	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/Ir5xP7AO0AneBU32CAHfxsSiL43M62lhMq84Yr5J.webp	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-15 09:37:34	2025-01-15 09:37:34	\N	323232323232323	fdsfds	fdsdsdsdf	fdfdsfds	dsffd	323232	323232323232323	1	2	1	8	11	2007	aed	English	Ajesh	Kumar
24	61	0	Ajesh Shop	ajeshkumarcd@gmail.com	\N	\N	\N	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/xhll1bcyjbk8tlRSsObR5f8l2hKLsXDrozkS4cDj.jpg	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-15 10:16:59	2025-01-15 10:16:59	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	\N	aed	English	Ajesh	Kumar
25	17	0	Gleaming Grace	david@gmail.com	\N	\N	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	dubai	\N	\N	\N	\N	1	1	1	453453	logos/ex7p3aAT0v1pIoXBecvRCjlCDVX3slfZKftxwOZe.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-16 07:28:20	2025-01-16 07:28:20	\N	434534535345345	dubai	dubai	dubai	dubai	434534	564564564564654	1	\N	1	2	2	2006	aed	English	David	Grace
26	62	0	gold nickels	khalshamsi42@gmail.com	\N	\N	Make hand made products	R	\N	\N	\N	\N	1	1	1	00000	logos/IxeSgbfbuNuMSCYZnI3GtV3L3jiDMYmL4OKPOAet.jpg	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-17 15:06:39	2025-03-19 23:42:50	\N	004565464567547	1123	123srdsd	Alain aassdf	Tn ffgdfgfd	00	050000000000000	1	1	1	8	1	1992	aed	English	Khalifa	Alshamsi
27	4	0	Vaughan Mueller	mubija@mailinator.com	\N	\N	Eos eiusmod id non	At maxime voluptatem	\N	\N	\N	\N	1	1	3	234123	logos/4nRpsjVzvri3R4397NpGRPK2b07Q3e5jfR6g1Eb9.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-21 06:31:06	2025-01-21 06:31:06	\N	612234242342342	Recusandae Ad qui q	Nesciunt voluptates	Et eum non placeat	Reiciendis commodi o	234234	145550999642342	1	\N	1	10	9	1985	aed	Spanish	Robin	Case
28	5	0	Gift Palce	v2@mailinator.com	\N	\N	Gift Palce	dubai	\N	\N	\N	\N	1	1	1	234234	logos/rg3RR9WwnyrMEpeMRSXHFevUmkgdxAGrZ1iimRYD.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-21 06:33:09	2025-01-21 06:33:09	\N	213412312312312	dubai	dubai	dubai	dubai	342342	234234234234243	1	\N	1	3	3	2005	aed	English	Gift Palce	Gift Palce
29	16	0	Thread & Trend	tompay@gmail.com	\N	\N	Thread & Trend	dubai	\N	\N	\N	\N	1	1	1	234234	logos/sB8lw59F2wT6fZarnbhDDfR2zEaXqc21flNO0204.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-21 06:34:59	2025-01-21 06:34:59	\N	342342342342342	Dubai	Dubai	Dubai	Dubai	234234	342342423424234	1	\N	1	5	4	2003	aed	English	Thread	Trend
30	18	0	Steve	steve@gmail.com	\N	\N	Steve	dubai	\N	\N	\N	\N	1	1	1	234234	logos/38r54cHLFOhfhX0amhU8csAo4BaqP5WdmduWpPva.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-21 06:37:03	2025-01-21 06:37:03	\N	342342342342342	Dubai	Dubai	Dubai	Dubai	342423	423423423423424	1	\N	1	4	3	2006	aed	English	Steve	Steve
31	20	0	Clare	wigeholy@mailinator.com	\N	\N	Clare	Dubai	\N	\N	\N	\N	1	1	1	342342	logos/5ZnnaUAE0fZCnZ4BzW7GbX4X8ZRegI1dPZHS39pG.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-21 06:44:53	2025-01-21 06:44:53	\N	324234234242423	Dubai	Dubai	Dubai	Dubai	234234	234234234234234	1	\N	1	4	3	2005	aed	English	Clare	wigeholy
32	19	0	Anil	anz@anz.com	\N	\N	Anil	dubai	\N	\N	\N	\N	1	1	1	342342	logos/B1CUEpDc9OAkZ1rZF0WOlTMDhCGTCQobocRgS5Vi.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-21 06:47:10	2025-01-21 06:47:10	\N	342342342342342	Dubai	Dubai	Dubai	Dubai	234234	234234234234234	1	\N	1	3	5	1993	aed	Arabic	Anil	Anz
33	29	0	Store Shop	xcczxcxzczx@dcss.ds	\N	\N	Store Shop	Dubai	\N	\N	\N	\N	1	1	1	232342	\N	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-21 06:49:16	2025-01-21 06:49:16	\N	342342342342342	Dubai	Dubai	Dubai	Dubai	342342	234242342342422	1	\N	1	5	4	2004	aed	English	Store Shop	Store Shop
34	31	0	Randall	asda@asdasd.com	\N	\N	Randall	Dubai	\N	\N	\N	\N	1	1	1	342342	logos/rvljUYFRCyizc5kVny2BJvKkryFlaxWz0WrRyJpf.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-21 06:50:50	2025-01-21 06:50:50	\N	324234234234234	Dubai	Dubai	Dubai	Dubai	343242	342342342342342	1	\N	1	3	3	2004	aed	Arabic	Randall	Randall
35	27	0	Brianna	joqiqoryvo@mailinator.com	\N	\N	Brianna	Dubai	\N	\N	\N	\N	1	1	1	342342	logos/aGgOgCFJYmsZLbrf9V47UrQjezm1jg7b2AsW3Y5V.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-21 06:53:38	2025-01-21 06:53:38	\N	342423423423424	Dubai	Dubai	Dubai	Dubai	342342	234234234234244	1	\N	1	4	3	2006	aed	Arabic	Brianna	Brianna
36	39	0	Pearl	telinatyki@mailinator.com	\N	\N	Pearl	Dubai	\N	\N	\N	\N	1	1	1	342342	logos/ooaBTjTA0yryQrSg8PXOuqaMe2ZPTHoAsguiHfKn.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-21 06:55:09	2025-01-21 06:55:09	\N	323423423423423	Dubai	Dubai	Dubai	Dubai	342342	342423423424234	1	\N	1	3	4	2007	aed	Arabic	Pearl	Pearl
37	64	0	Abdullah	recoba-92@hotmail.com	\N	\N	Abdullah	Dubai	\N	\N	\N	\N	1	1	2	342423	logos/PKSCtSpfwn2wZivywYAu4XcaNLvY1vTwNJfewe6S.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-21 06:56:40	2025-01-21 06:56:40	\N	423424234234234	Dubai	Dubai	Dubai	Dubai	342342	242342342342342	1	\N	1	4	3	2003	aed	English	Abdullah	Abdullah
38	47	0	Valentine	wahal@mailinator.com	\N	\N	Valentine	Dubai	\N	\N	\N	\N	1	1	1	342423	logos/mmYRhe0AUtHvTYz9YUpb9TjCGZbz0rgdeWmyCndV.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-21 06:58:09	2025-01-21 06:58:09	\N	342342342342342	Dubai	Dubai	Dubai	Dubai	334234	342423424234223	1	\N	1	3	5	2004	aed	Arabic	Valentine	Valentine
39	91	0	habibhoodies	habib@gmail.com	\N	\N	aaaaaaaaaa	st 12	\N	\N	\N	\N	1	1	1	765432	logos/UrWz40ZQxHVauDUIbXXH1x7g5YHayBbzu0eie6fs.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-03-21 20:13:54	2025-04-01 14:32:12	\N	233233322233223	deefefef	house 37	alain	Tennesse	765434	765765676545676	1	1	1	17	12	1994	aed	English	hhhhh	hhhh
\.


--
-- Data for Name: subscribers_emails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscribers_emails (id, email, created_at, updated_at) FROM stdin;
1	test@gmail.com	\N	\N
\.


--
-- Data for Name: temp_order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_order_products (id, order_id, product_id, product_attribute_id, product_type, quantity, price, discount, total, vendor_id, admin_commission, vendor_commission, shipping_charge) FROM stdin;
98	59	38	39	1	1	1200	0	1200	30	720	480	0
102	62	35	36	1	2	100	0	200	16	120	80	0
104	64	32	33	1	2	250	0	500	5	500	0	0
105	65	44	45	1	2	400	0	800	5	800	0	0
106	66	44	45	1	1	400	0	400	5	400	0	0
11	10	8	7	2	1	119	0	119	4	119	0	0
12	10	5	5	1	2	250	0	500	4	500	0	0
107	67	44	45	1	1	400	0	400	5	400	0	0
108	68	44	45	1	1	400	0	400	5	400	0	0
109	69	44	45	1	1	400	0	400	5	400	0	0
16	14	15	15	1	2	330	0	660	17	330	330	0
110	70	44	45	1	1	400	0	400	5	400	0	0
111	71	38	39	1	1	1200	0	1200	30	720	480	0
112	72	44	45	1	2	400	0	800	5	800	0	0
20	17	17	17	1	1	4000	0	4000	18	2000	2000	0
113	73	44	45	1	1	400	0	400	5	400	0	0
114	74	44	45	1	1	400	0	400	5	400	0	0
115	75	32	33	1	1	250	0	250	5	250	0	0
116	76	44	45	1	1	400	0	400	5	400	0	0
117	77	38	39	1	1	1200	0	1200	30	720	480	0
118	77	26	27	1	1	500	0	500	30	300	200	0
119	78	33	34	1	1	250	0	250	5	250	0	0
28	21	20	20	1	1	7000	0	7000	18	3500	3500	0
29	22	13	13	1	2	300	0	600	16	360	240	0
30	23	21	21	2	6	85	0	510	17	255	255	0
31	24	18	18	1	1	8000	0	8000	18	4000	4000	0
120	79	48	49	1	1	400	0	400	59	400	0	0
123	82	44	45	1	1	400	0	400	5	400	0	0
124	83	38	39	1	1	1200	0	1200	30	720	480	0
126	85	38	39	1	1	1200	0	1200	30	720	480	0
127	86	38	39	1	1	1200	0	1200	30	720	480	0
128	87	4	4	1	1	330	0	330	4	330	0	0
129	88	30	31	1	2	250	0	500	30	300	200	0
130	88	31	32	1	1	400	0	400	5	400	0	0
131	89	38	39	1	1	1200	0	1200	30	720	480	0
132	90	39	40	1	1	750	0	750	17	375	375	0
133	91	11	11	1	1	400	0	400	16	240	160	0
134	91	39	40	1	1	750	0	750	17	375	375	0
135	92	38	39	1	1	1200	0	1200	30	720	480	0
136	93	39	40	1	2	750	0	1500	17	750	750	0
137	94	38	39	1	1	1200	0	1200	30	720	480	0
138	94	26	27	1	1	500	0	500	30	300	200	0
139	95	26	27	1	1	500	0	500	30	300	200	0
140	96	39	40	1	1	750	0	750	17	375	375	0
141	96	34	35	1	3	300	0	900	5	900	0	0
55	36	20	20	1	2	7000	0	14000	18	7000	7000	0
142	97	32	33	1	1	250	0	250	5	250	0	0
143	97	34	35	1	1	300	0	300	5	300	0	0
144	97	26	27	1	1	500	0	500	30	300	200	0
145	97	11	11	1	1	400	0	400	16	240	160	0
63	42	44	45	1	7	400	0	2800	5	2800	0	0
80	50	29	30	1	1	250	0	250	17	125	125	0
81	50	28	29	1	1	250	0	250	18	125	125	0
84	52	48	49	1	1	400	0	400	59	400	0	0
149	99	29	30	0	1	250	\N	250	0	\N	\N	\N
150	99	39	40	0	2	750	\N	1500	0	\N	\N	\N
151	99	26	27	0	2	500	\N	1000	0	\N	\N	\N
\.


--
-- Data for Name: temp_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_orders (id, invoice_id, user_id, address_id, total, vat, discount, grand_total, payment_mode, admin_commission, vendor_commission, shipping_charge, temp_id, ref_history_id, ref_code, admin_commission_percentage, vendor_commission_percentage, order_type, pick_up_date, pick_up_time, service_charge) FROM stdin;
62	\N	72	19	200	10	0	210	2	80	130	0	7267cc7642da9631741452866	0		40	60	0			0
99	\N	65	40	1500	75	0	2825	2	0	0	0	67d34b13bbf5e	0		0	0	1			0
51	\N	14	10	1200	60	0	1260	2	480	780	0	1467c8188fccafd1741166735	0		40	60	0			0
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
20	test test	test23@gmail.com	971	828282822828	0	1	1	$2y$10$YytJeorLG489dMGDF8o0e.Kq8PFakphMJPdikTGnoq55hTxiVYuK6	2025-02-11 19:20:59	2	test	test		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	11E545E6-CE73-44D1-AB5A-E3F0DC5B74F8	2025-02-11 19:20:59	2025-02-11 19:20:59
11	test dev two	test2@gmail.com	971	3213698744	0	1	1	$2y$10$nq4fPOaEdxeJ3at79dYp4eL./VYaVj4L3iIdFl9xQUBb6/VUdSzau	2025-01-08 10:41:05	2	test	dev two		1111	1111	cR0bfnAeSdyt0drSADtjDp:APA91bEx_HGUo4G4-njIw95ywCdiz1OTMFsKUqjubI5mjCn0jKHrNG5U4nJ0qE39PAjcgOj-Fywq4X1IQ6s0Zs30sYsiKiE8e3tRZA16SDVPMFVBTyJezFM	ANDROID	\N	\N	c948872a6eac9a75	2025-01-08 10:07:48	2025-01-08 10:41:05
12	Ajesh Kumar	ajeshcd@gmail.com	971	505041860	0	1	1	$2y$10$81AOcnDkVKLFdPyvouvFpucwMvHzopsB6NJo1qyELjw.O2IFS6706	2025-01-15 09:18:37	2	Ajesh	Kumar		1111	1111	chZdpwJtQ4efOD8ChJVMPd:APA91bHEovPflqdsjn60y9LGi01vaQDofrotIMTTqgF1nK3KhJz5DzDiLEGZF0F4PhKCV7U6dqO8G_PvbcLsnDDgczIOweB9OnTjT4rRqUn5-m0uWBYZSsw	ANDROID	\N	\N	956a025e9c17369b	2025-01-15 09:18:37	2025-01-15 09:18:37
2	hunain dev 	hunain88@gmail.com	971	123456789	0	1	1	$2y$10$M9ms4LialUzuBX1uNTz/TONq9itxzPF4pRaV3zbRqZ9.HnFwMl.Ma	2024-11-30 11:31:52	2	hunain dev	\N		1111	1111	ad	ANDROID	\N	\N	c948872a6eac9a75	2024-11-30 11:00:33	2024-11-30 11:31:52
1	Aamir .	aamir2.dxbapps@gmail.com	92	302806688	0	1	1	$2y$10$O3Pom0cF9t/c43viI6dPze.aPD0KPqfQnPA04IvbRRJlOUlsHYMk2	2025-02-07 15:56:57	2	Aamir	.		1111	1111	1111	smap	\N	\N	cart_a	2024-11-30 05:18:29	2025-02-07 15:56:57
24	Test User	testuser@gmail.com	971	646191461616	0	1	1	$2y$10$Sg5FVSuE063pvV3UeK23qeQkz.5/eAp0aT6XU3ske9ytPTawx3hqm	2025-02-25 16:34:27	2	Test	User		1111	1111	czQCD7nRQqKS8zSPn9WTSs:APA91bF7eEVfu2QllRDOpRo6_iKf69eKSYQ5YUx1qlb043sk4jdoXQRdJq8aiWUTwUUOpjNxVmJ4nPbooIuB0x44H6VuTJ-_HGs2t_UuBB8fe5oi3lHIGrg	ANDROID	\N	\N	48707bfacf764172	2025-02-25 16:34:27	2025-02-25 16:34:27
3	s login 	new_social1@gmail.com	92	3095555555	0	1	1	$2y$10$Ch0H1uVSxO/gNvhETynaDe8ePjT0Ws9EhOHU3rd5.ZEzPJPlNfxHq	2024-12-02 09:21:39	2	s login	\N	\N	1111	1111	1111	andriod	\N	\N	cart_a	2024-12-02 09:09:32	2024-12-02 09:21:39
4	s login 	new_social2@gmail.com	92	3095555556	0	1	1	$2y$10$c3u4EHtwPF.Cl2Y6NEDPE.GhKflO8vbJnoKYdmuuk89e34x0ZJ1Ea	2024-12-02 09:28:18	2	s login	\N	\N	1111	1111	1111	andriod	\N	\N	cart_a	2024-12-02 09:24:17	2024-12-02 09:28:18
10	test dev	test@gmail.com	971	364948464649	0	1	1	$2y$10$0XhR49oPZ97njO6IfHFEf.TKlYyR0hr8bMOYr07LDBpMlVD4f6of2	2025-02-11 16:32:56	2	test	dev		1111	1111	cR0bfnAeSdyt0drSADtjDp:APA91bEMal_fACVXP5m97PhpU380G1QvQu1W_1HwQ7wTLZVSx5hDiE39OFiWwwz1gjFefTIHg3kUgLlDrGhjRdktsW3qp29M-fcv3kkTXDtUzoSEhjyNdoE	ANDROID	\N	\N	c948872a6eac9a75	2025-01-08 09:01:49	2025-02-11 16:32:56
14	test test	test10@gmail.com	971	818272727272	0	1	1	$2y$10$umcjzLDdL/XVlgUA0paEA.UY.4KvHzk9CE7H0Z378GuWYtqyb1RRC	2025-02-11 17:42:47	2	test	test		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	11E545E6-CE73-44D1-AB5A-E3F0DC5B74F8	2025-02-11 17:42:47	2025-02-11 17:42:47
15	test ha	test11@gmail.com	44	8282822882	0	1	1	$2y$10$Z62MQDkOJblzr2tARca5OeloXTfoFA5Wu6fNXh.jbHamXlgTpZLRu	2025-02-11 17:48:53	2	test	ha		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	11E545E6-CE73-44D1-AB5A-E3F0DC5B74F8	2025-02-11 17:48:53	2025-02-11 17:48:53
16	Aamir .	aamir4.dxbapps@gmail.com	92	302806687	0	1	1	$2y$10$Rg74fd5NGt8N.G4GDpS2W.03wnPG52SgzKsf1.fYJA2odGjpb7d2K	2025-02-11 17:52:15	2	Aamir	.		1111	1111	1111	smap	\N	\N	cart_a	2025-02-11 17:52:15	2025-02-11 17:52:15
6	ragadxb 	ragadxb@gmail.com	971	123456489	0	1	1	$2y$10$aOU7pv9521zJrGNvaAQfW.siDZjhjVq98L8rNKTK1NJ3L3Luf.Hly	2024-12-02 21:48:43	2	ragadxb	\N	\N	1111	1111	fs3DpSFkQteL0pWepAU7uA:APA91bHqw-5EDCZMcGO_f1wjG6lFKNQo3ra0dQTeu16XZuudLwgiA2dbzQTM5CUAM0xKtGnDI1h6uq81FqJcKnlWVK5A-g61FcTnouNjDh4fX-czNOlGrJs	ANDROID	\N	\N	e19e10ee2b97a91c	2024-12-02 21:48:30	2024-12-02 21:48:43
7	Asad 	asadnazir289@gmail.com	971	3441560349	0	1	1	$2y$10$IA2FaaEjOUO/denwhnSAC.3ffpfNakaYUUSj6DWsqHF72Wr0qgqnu	2025-01-06 22:22:05	2	Asad	\N		1111	1111	cr_Htg3pQdeU4WTjORg00M:APA91bGNQqtc9SniC8uUYcMPu6jkd-SLQDB05UZIqY8MXvfm-c95A3ale7rvIHxk-90S9V-18m_x5Rf2jXd-P6Ls6F_KOTdoWk_x2lHhcLskOGcjTYp5fuc	ANDROID	\N	\N	7812fe4f9424cf17	2025-01-06 22:21:57	2025-01-06 22:22:05
21	tet tes	test24@gmail.com	971	181818118282	0	1	1	$2y$10$Ma70Ar2Wz9lLILYLSGuJ4.ih4qOBG800L03Z9bnYpW1K/BacjyIvy	2025-02-11 19:28:23	2	tet	tes		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	5E2712C8-8DE0-4799-8159-082C8EBED509	2025-02-11 19:28:23	2025-02-11 19:28:23
8	anilnavis 	anil@dxbusinessgroup.com	971	899566995	0	1	1	$2y$10$Gf6FAyl1oInlwx/l60Cl1.lxuuop0PR5pFI91ajE/1qTSqMjCk3Ka	2025-01-07 04:05:09	2	anilnavis	\N		1111	1111	eZ7T5pAoSmmS_Qn_LiEWer:APA91bHGtJQol32rWtFEWj2_ZbtYTGS77qXgJxPzOddDKFm7ha7gdmd-lzoU5aeal0eM-V0nR2Z3HUN7tA8t21hBAXevnCdOexT_hqoCp3S4TO0zcb-OSms	ANDROID	\N	\N	0012e1f9e605c504	2025-01-07 04:05:09	2025-01-07 04:05:09
17	test test	test12@gmail.com	971	812828282282	0	1	1	$2y$10$Gn.RFD1xAB/Cuvy0Qg0xGO.OQwMSflxi2dkTeU8PDUoIHRuBuC.UW	2025-02-11 17:55:44	2	test	test		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	11E545E6-CE73-44D1-AB5A-E3F0DC5B74F8	2025-02-11 17:55:44	2025-02-11 17:55:44
18	test test	test21@gmail.com	971	665544444444	0	1	1	$2y$10$I2XLyHMF.drvq7ewZ.h/q.FlgAWNoPYUshQf.GS1ZAjCPVqLnryYm	2025-02-11 19:12:10	2	test	test		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	11E545E6-CE73-44D1-AB5A-E3F0DC5B74F8	2025-02-11 19:12:11	2025-02-11 19:12:11
19	test test	test22@gmail.com	971	812278217	0	1	1	$2y$10$XT6Xa4wMikmaj2KYadSL5ef4mUkQatmwaOUWneI/IM4hxeVDRAMl2	2025-02-11 19:16:36	2	test	test		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	11E545E6-CE73-44D1-AB5A-E3F0DC5B74F8	2025-02-11 19:16:36	2025-02-11 19:16:36
22	hiba testuser	hibatestuser@gmail.com	971	561660198	0	1	1	$2y$10$LmcCsk5w9Wz2ifzjw68JQ.bNb6wc2PlgZh2kMwZVxCeNblc4FcwVy	2025-02-13 08:39:45	2	hiba	testuser		1111	1111	c8twPepeQPGF-DTAsEnsvi:APA91bGIWpH0-gAYN1ShCpsZIY2ZGHaxsFYVC945WoPtZHw8JDNZ-d9TSyYP1elhTfV4VRG8l87MQnRu6WLJ6TXwRSpWKtk1wZhf6U9OulTentCj4SgZpaM	ANDROID	\N	\N	12d4d9f3ec83ed7c	2025-02-13 08:39:45	2025-02-13 08:39:45
23	Aamir .	aamir.dxbapps@gmail.com	92	302806664	0	1	1	$2y$10$z8fIyia5ZFP/IQ8HNQ7YReMlay5ZCUFvjKk496z6iQmzXTS7Mt/He	2025-02-14 14:03:41	2	Aamir	.		1111	1111	1111	smap	\N	\N	cart_a	2025-02-14 14:03:41	2025-02-14 14:03:41
25	Test User	pl@gmail.com	971	845161884	0	1	1	$2y$10$ZnKDxC3cqSRJgc.C14PBtOfplc/C/PDxAlZ/HJjhkpzIF//4LQXBm	2025-03-01 19:34:47	2	Test	User		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	821B47BC-1F58-4CD8-ABD2-72412302F48A	2025-03-01 19:34:47	2025-03-01 19:34:47
26	anil navis	anilnavis@gmail.com	971	534005096	0	1	1	$2y$10$Yf34EAp9AJye/FM.eelYMuUoFr3HxEvMviQPebNYuHJzIqR0nC/5O	2025-03-04 02:45:35	2	anil	navis		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	2A4D7E6C-A01E-4AC1-8F06-44ADF49A0E6B	2025-03-04 02:45:35	2025-03-04 02:45:35
27	Nas Test	ui@gmail.com	971	545645466	0	1	1	$2y$10$aLDxpmo9VxH.5LCnQiSYWe9ytV81d1bHrU6aes9qk3NaJR07IDAk6	2025-03-04 18:28:47	2	Nas	Test		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	2DA4DC7E-ABAB-46A9-B3DF-7830B0554A72	2025-03-04 18:28:47	2025-03-04 18:28:47
28	ty hh	nas@gmail.com	971	676766767	0	1	1	$2y$10$aS/N27k/T7yUfRFFTWr/J.aPRLUYzWpikGXeaEpPWm8sCIQyR5Wsa	2025-03-04 18:32:28	2	ty	hh		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	2DA4DC7E-ABAB-46A9-B3DF-7830B0554A72	2025-03-04 18:30:32	2025-03-04 18:32:28
29	hhh bh	hjj@gmail.com	971	585828588	0	1	1	$2y$10$WKpge5Jse/csov173hsqN.s1hCw/78XMNTgbIFwAqXbVuvPcRxUIC	2025-03-04 18:35:34	2	hhh	bh		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	2DA4DC7E-ABAB-46A9-B3DF-7830B0554A72	2025-03-04 18:35:34	2025-03-04 18:35:34
30	jaj hjz	ibbbii@gmail.com	971	6464666499	0	1	1	$2y$10$nmEFRYXWGnDOTwQjcklrB.xsNBGdzclDwyCqUnv.IzDOo8S5.Ud0y	2025-03-04 18:38:45	2	jaj	hjz		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	2DA4DC7E-ABAB-46A9-B3DF-7830B0554A72	2025-03-04 18:38:45	2025-03-04 18:38:45
31	hzj hzu	fet@gmail.com	971	766464679	0	1	1	$2y$10$bV9zeabAF/PVa8fhunSkcuBd4EmnCOMYiRXxxGAek63oJCAaIjTcG	2025-03-04 18:40:06	2	hzj	hzu		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	2DA4DC7E-ABAB-46A9-B3DF-7830B0554A72	2025-03-04 18:40:06	2025-03-04 18:40:06
32	anil navis	anil@anil.com	971	5466484646	0	1	1	$2y$10$f9fFDpT7Sx3K9X4rsVgZr.pUB2vnrrf4wKkVLnANSAypIHJOqbNKi	2025-03-05 09:27:17	2	anil	navis		1111	1111	eRt1vZ-ZSoCThgoF6Smx4P:APA91bGFrHB_eYb_L8QGblbaPut0ZHmEZks26RYHrZIl5ycZgljrpeQ34GWjb3D6sroD1d2kSE6JmAQ-EONqp3L0OWdbwvoEbW7PxtwVzQJ0fhPPXa2prK4	ANDROID	\N	\N	0012e1f9e605c504	2025-03-05 09:27:17	2025-03-05 09:27:17
34	Nas Test	io@gmail.com	971	4848848484	0	1	1	$2y$10$Xnl33AVEur9vUxnTvpBD4.1s6LUmnO/VYz05AJBQLHWTC2usEUT62	2025-03-05 20:14:59	2	Nas	Test		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	2DA4DC7E-ABAB-46A9-B3DF-7830B0554A72	2025-03-05 20:14:59	2025-03-05 20:14:59
13	Hiba Ejaz 	hibaejaz97@gmail.com	971	561660157	0	1	1	$2y$10$JDrd0.3j8.PHqexBFPyny.HiygDrsc827bQikrCCRR2D9OjuIVzOO	2025-03-08 12:04:35	2	Hiba Ejaz	\N		1111	1111	c8twPepeQPGF-DTAsEnsvi:APA91bGIWpH0-gAYN1ShCpsZIY2ZGHaxsFYVC945WoPtZHw8JDNZ-d9TSyYP1elhTfV4VRG8l87MQnRu6WLJ6TXwRSpWKtk1wZhf6U9OulTentCj4SgZpaM	ANDROID	\N	\N	12d4d9f3ec83ed7c	2025-02-11 08:12:03	2025-03-08 12:04:35
33	Nas Test	jk@gmail.com	971	548484848	0	1	1	$2y$10$Po8hkMd4jA5xOVKJdXjd1eShVFx7AbtKkUXwLctpgDz6ZgNYAYFou	2025-03-08 23:26:07	2	Nas	Test		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	47D677F1-6688-4D54-B112-4A2B8307A2EF	2025-03-05 20:07:18	2025-03-08 23:26:07
38	Nas Test	nk@gmail.com	971	48484848848	0	1	1	$2y$10$CP3VJ9SxHraZpBmPgxk2e.tpCmvH3jsg9GBT67cmKDMA4V3KiY6UO	2025-03-09 00:26:24	2	Nas	Test		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	47D677F1-6688-4D54-B112-4A2B8307A2EF	2025-03-09 00:26:24	2025-03-09 00:26:24
39	Nas Test	kl@gmail.com	971	4555455457	0	1	1	$2y$10$32nkP6m5AaO6Yw1q7wAjz.zxxCp8DnvY7iVZDmvGxcNH.oIg8euI2	2025-03-09 00:29:10	2	Nas	Test		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	47D677F1-6688-4D54-B112-4A2B8307A2EF	2025-03-09 00:29:10	2025-03-09 00:29:10
40	Test User	newtest@gmail.com	971	4848848787	0	1	1	$2y$10$DyV7tjF6zb9zpOSkcysfeeQEzjrhmTtTuvpxpzg8YBPVGBacnwX0K	2025-03-09 00:44:56	2	Test	User		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	47D677F1-6688-4D54-B112-4A2B8307A2EF	2025-03-09 00:44:57	2025-03-09 00:44:57
42	Riana 	riananil2009@gmail.com	971	546646646	0	1	1	$2y$10$TEebQWPAWTOO//492.gpPORgwWHZob/CT5VwUmRt3rphIqbJc0j8S	2025-03-10 14:17:04	2	Riana	\N	\N	1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	2A4D7E6C-A01E-4AC1-8F06-44ADF49A0E6B	2025-03-10 11:28:05	2025-03-10 14:17:04
35	Nasrullah khan 	nasrulahpitafi@gmail.com	971	558885666625	0	1	1	$2y$10$zPvMD0c2igsIxVsrNGVs2OQynhbcbAi0Uk.UqVdQlNkApb8RFP0Je	2025-03-08 14:34:31	2	Nasrullah khan	\N	\N	1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	2DA4DC7E-ABAB-46A9-B3DF-7830B0554A72	2025-03-08 14:17:30	2025-03-08 14:34:31
36	Nas Test	gh@gmail.com	971	45455454848	0	1	1	$2y$10$O9otZSWgOfuGupcQ/Pe1x.5gUWyUl4P9Jd4.K2KtKt1Mt8Vb0ih3.	2025-03-08 14:47:14	2	Nas	Test		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	2DA4DC7E-ABAB-46A9-B3DF-7830B0554A72	2025-03-08 14:47:14	2025-03-08 14:47:14
41	s login 	new_social@gmail.com	92	3028066311	0	1	1	$2y$10$pJ6pEuWQhsA4Wpi/nc0Pv.SM5XWRy9b5zecob9fPJLabDBhb1NdtG	2025-03-10 04:59:59	2	s login	\N	\N	1111	1111	1111	andriod	\N	\N	cart_a	2025-03-10 04:43:18	2025-03-10 05:00:00
37	Lamees Fatima 	lameeskhanpitafi@gmail.com	971	8484887788	0	1	1	$2y$10$s08Ky.ooWetJRROkNgoQduJtngB4VqDHkbKo1LvRn.VONNLM81/PK	2025-03-10 05:04:14	2	Lamees Fatima	\N	\N	1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	47D677F1-6688-4D54-B112-4A2B8307A2EF	2025-03-08 14:47:52	2025-03-10 05:04:14
5	zain 	z.falak777@gmail.com	971	546454545455	0	1	1	$2y$10$bynFGxYkOFf4wWOwSvEUE.N2iNvXxYbwI84/0BhBE80Up4f4/sl46	2025-03-10 06:06:36	2	zain	\N	\N	1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	F22246DD-1097-45CB-9D01-F13E7E9ADBDB	2024-12-02 09:46:52	2025-03-10 06:06:36
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
1	9	Aamir .	92	3028066329	address n	1	0	1	Home	0	0	2024-12-20 11:31:48	2025-01-15 11:00:15	\N	B1	11	11	Calicut Airport	1	A1	S1
2	9	Aamir .	92	3028066329	address n	1	0	1	Home	0	0	2025-01-06 11:27:35	2025-01-15 11:00:15	Test Land	B1	25.1808127	55.3132194	Calicut Airport	1	A1	S1
4	9	Aamir New.	92	3028066329	address n	1	0	1	0	0	0	2025-01-06 17:00:09	2025-01-15 11:00:15	Test Land	B1	25.1809515	55.3149132	Calicut Airport	1	A1	S1
3	9	Aamir .	92	3028066329	address n	1	0	1	0	0	0	2025-01-06 16:00:17	2025-01-15 11:00:15	Test Land	B1	25.1809515	55.3149132	Calicut Airport	1	A1	S1
10	14	anilnavis	971	899566995	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	1	0	1	0	1	1	2025-01-07 08:21:18	2025-01-07 08:21:18	\N	tu14	25.184234531783282	55.26004895567894	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	1	\N	\N
20	70	hiba testuser	971	561660198	Bahria Heights 5, Expressway, Islamabad, Pakistan	1	0	1	0	1	1	2025-02-26 20:27:31	2025-03-04 22:54:39	icicle	land mark	33.518359476420116	73.11308663338423	Bahria Heights 5, Expressway, Islamabad, Pakistan	1	\N	Bahria Heights 5, Expressway, Islamabad, Pakistan
19	72	Test User	971	646191461616	G486+WGH, Islamabad, Pakistan,	1	0	1	0	1	0	2025-02-26 16:36:24	2025-03-08 16:41:58	\N	suiit	33.51706751286358	73.11189942061901	G486+WGH, Islamabad, Pakistan,	1	\N	\N
18	72	Test User	971	646191461616	Bahria Heights 5, Expressway, Islamabad, Pakistan,	1	0	1	0	1	0	2025-02-26 16:35:30	2025-03-08 16:41:58	\N	suit	33.516416212799214	73.11082150787115	Bahria Heights 5, Expressway, Islamabad, Pakistan,	1	\N	\N
5	9	hunain dev	971	123456789	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	1	0	1	0	0	0	2025-01-06 23:35:22	2025-01-15 11:00:15	\N	Apt 1	33.516418169502025	73.11079904437065	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	1	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,
6	9	hunain dev	971	123456789	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	1	0	1	0	0	0	2025-01-06 23:39:36	2025-01-15 11:00:15	\N	Apt1	33.516422921494396	73.11076920479536	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	1	\N	\N
8	9	hunain dev	971	123456789	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	1	0	1	0	0	0	2025-01-07 07:54:30	2025-01-15 11:00:15	\N	apt1	33.56680088238352	73.13682921230793	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	1	\N	\N
9	9	hunain dev	971	123456789	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	1	0	1	0	0	0	2025-01-07 08:01:26	2025-01-15 11:00:15	\N	apt1	33.566805910972626	73.13681814819574	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	1	\N	\N
16	9	hunain dev	971	123456789	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	1	0	1	0	1	1	2025-01-15 11:00:15	2025-01-15 11:00:15	\N	a1	33.566801161749595	73.1368101015687	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	1	\N	\N
12	13	Asad	971	3441560349	9FGG+WQ, Muzaffarabad,	1	0	1	0	1	1	2025-01-08 08:44:42	2025-01-08 08:44:42	\N	mzd	34.37904488161153	73.47675025463104	9FGG+WQ, Muzaffarabad,	1	\N	\N
11	15	hiba	971	561660155	57P6+23F - Business Bay - Dubai - United Arab Emirates,	1	0	1	0	1	0	2025-01-07 12:04:36	2025-01-15 11:26:39	\N	812	25.185139589051296	55.25988031178713	57P6+23F - Business Bay - Dubai - United Arab Emirates,	1	\N	\N
7	15	hiba	971	561660133	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	1	0	1	0	1	1	2025-01-07 07:52:33	2025-01-15 11:26:39	\N	304	25.184269726894854	55.26005566120148	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	1	\N	\N
17	60	Guest hhh	50	0561660155	Ajman Gate Tower	1	1	1	Home	1	0	2025-01-15 14:52:17	2025-01-15 14:52:17	\N	\N	\N	\N	\N			
13	55	Price Chase1	921	54534534545345	ghfghfghf	1	1	1	Home	1	0	2025-01-14 06:12:17	2025-01-14 08:00:48	\N	\N	\N	\N	\N			
14	55	gfdghfghfghfg	921	567657657657	dfghfghfghfhh	1	1	2	Home	1	1	2025-01-14 08:00:38	2025-01-14 08:00:48	\N	\N	\N	\N	\N			
15	58	Ajesh Kumar	971	505041860	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	1	0	1	0	1	1	2025-01-15 09:20:59	2025-01-15 09:20:59	\N	vhbb	25.184267906458302	55.26004895567894	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	1	\N	\N
21	70	hiba testuser	971	561660198	1717 Rd B-9, Phase 7 Islamabad, Pakistan	1	0	1	0	1	0	2025-02-26 20:49:21	2025-03-04 22:54:39	PIN code	Suit apt	33.527430630363305	73.12413029372692	1717 Rd B-9, Phase 7 Islamabad, Pakistan	1	\N	1717 Rd B-9, Phase 7 Islamabad, Pakistan
32	83	Nas Test	971	548484848	31 Street 5, Soan Gardens Block H Islamabad, Pakistan	1	0	1	0	1	1	2025-03-08 23:26:51	2025-03-09 00:22:22	123	apt suit	33.55370773363346	73.15698995385294	31 Street 5, Soan Gardens Block H Islamabad, Pakistan	1	\N	31 Street 5, Soan Gardens Block H Islamabad, Pakistan
23	73	Test User	971	845161884	G486+WGH, Islamabad, Pakistan	1	0	1	0	1	1	2025-03-01 19:36:27	2025-03-01 19:36:27	pin	Apt	33.51743676707395	73.11181794852018	G486+WGH, Islamabad, Pakistan	1	\N	G486+WGH, Islamabad, Pakistan
39	89	Riana navis	971	546646646	57Q6+7WQ - Al Khaleej Al Tejari 1 St - Business Bay - Dubai - United Arab Emirates	1	0	1	0	1	1	2025-03-11 09:23:44	2025-03-11 09:23:44	25373	526	25.188260361849288	55.26269730180501	57Q6+7WQ - Al Khaleej Al Tejari 1 St - Business Bay - Dubai - United Arab Emirates	1	\N	57Q6+7WQ - Al Khaleej Al Tejari 1 St - Business Bay - Dubai - United Arab Emirates
40	65	Rizwan Mirza	ewer	02423423423	test address\r\nuae	0	0	0	Home	1	0	2025-03-13 21:14:19	2025-03-13 21:14:19	\N	\N	\N	\N	\N			
22	70	hiba testuser	971	561660198	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, 46000, Pakistan	1	0	1	0	1	0	2025-02-26 22:07:33	2025-03-04 22:54:39	test	suite	33.516057843927825	73.11081527770732	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, 46000, Pakistan	1	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, 46000, Pakistan
33	84	Nas Test	971	48484848848	31 Street 5, Soan Gardens Block H Islamabad, Pakistan	1	0	1	0	1	1	2025-03-09 00:27:05	2025-03-09 00:28:08	test	suit	33.55370773363346	73.15698995385294	31 Street 5, Soan Gardens Block H Islamabad, Pakistan	1	\N	31 Street 5, Soan Gardens Block H Islamabad, Pakistan
25	78	Nas Test	971	4848848484	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, 46000, Pakistan	1	0	1	0	1	0	2025-03-05 20:15:44	2025-03-05 20:18:00	test	suit	33.516975828000874	73.11122216284275	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, 46000, Pakistan	1	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, 46000, Pakistan
26	78	Nas Test	971	4848848484	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, 46000, Pakistan	1	0	1	0	1	0	2025-03-05 20:16:40	2025-03-05 20:18:00	pin	apt	33.51749239266623	73.11232455074787	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, 46000, Pakistan	1	\N	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, 46000, Pakistan
27	78	Nas Test	971	4848848484	G487+GRQ, Islamabad, Pakistan	1	0	1	0	1	1	2025-03-05 20:18:00	2025-03-05 20:18:00	test	apt	33.51704934361498	73.11297297477721	G487+GRQ, Islamabad, Pakistan	1	\N	G487+GRQ, Islamabad, Pakistan
28	74	anil navis	971	534005096	57M6+P43 - Business Bay - Dubai - United Arab Emirates	1	0	1	0	1	1	2025-03-06 03:50:09	2025-03-06 03:50:09	537383	56gj	25.19780513423987	55.277098417282104	57M6+P43 - Business Bay - Dubai - United Arab Emirates	1	\N	57M6+P43 - Business Bay - Dubai - United Arab Emirates
29	76	anil navis	971	5466484646	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	1	0	1	0	1	1	2025-03-06 04:17:59	2025-03-06 04:17:59	\N	45	25.184244847592886	55.260059684515	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	1	\N	\N
30	81	Nasrullah khan	971	558885666625	J5V8+Q4F, Taramri, Islamabad, Pakistan	1	0	1	0	1	1	2025-03-08 16:52:24	2025-03-08 16:52:24	123	Test Suit	33.64441241411183	73.1646542665149	J5V8+Q4F, Taramri, Islamabad, Pakistan	1	\N	J5V8+Q4F, Taramri, Islamabad, Pakistan
31	79	Hiba Ejaz	971	561660157	35 420 Rd - Al Warqa - Al Warqa 4 - Dubai - United Arab Emirates,	1	0	1	0	1	1	2025-03-08 16:52:59	2025-03-08 16:52:59	\N	54	25.191364064954136	55.44729396700859	35 420 Rd - Al Warqa - Al Warqa 4 - Dubai - United Arab Emirates,	1	\N	\N
34	85	Nas Test	971	4555455457	31 Street 5, Soan Gardens Block H Islamabad, Pakistan	1	0	1	0	1	1	2025-03-09 00:29:48	2025-03-09 00:29:48	test	auit	33.55370773363346	73.15698995385294	31 Street 5, Soan Gardens Block H Islamabad, Pakistan	1	\N	31 Street 5, Soan Gardens Block H Islamabad, Pakistan
35	86	Test User	971	4848848787	31 Street 5, Soan Gardens Block H Islamabad, Pakistan	1	0	1	0	1	0	2025-03-09 00:45:36	2025-03-09 00:48:08	pincode	suit	33.5558655227687	73.16138181835413	31 Street 5, Soan Gardens Block H Islamabad, Pakistan	1	\N	31 Street 5, Soan Gardens Block H Islamabad, Pakistan
36	86	Test User	971	4848848787	H559+5H6, Gagri, Islamabad, Pakistan	1	0	1	0	1	1	2025-03-09 00:48:08	2025-03-09 00:48:08	test	suit	33.5589897332136	73.16871833056211	H559+5H6, Gagri, Islamabad, Pakistan	1	\N	H559+5H6, Gagri, Islamabad, Pakistan
37	87	Lamees Fatima	971	8484887788	1 Street 1, Soan Gardens Block H Rawalpindi, 44000, Pakistan	1	0	1	0	1	1	2025-03-10 05:05:39	2025-03-10 05:05:39	pin	suit	33.55594878435886	73.15953645855188	1 Street 1, Soan Gardens Block H Rawalpindi, 44000, Pakistan	1	\N	1 Street 1, Soan Gardens Block H Rawalpindi, 44000, Pakistan
38	88	zain	971	546454545455	Dubai Airport,Dubai, United Arab Emirates	1	0	1	0	1	1	2025-03-11 07:05:19	2025-03-11 07:05:19	46000	test	25.2620809	55.3736962	Dubai Airport,Dubai, United Arab Emirates	1	\N	Dubai Airport,Dubai, United Arab Emirates
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
12	ragadxb 	ragadxb@gmail.com	971	123456489	1	$2y$10$aOU7pv9521zJrGNvaAQfW.siDZjhjVq98L8rNKTK1NJ3L3Luf.Hly	2024-12-02 21:48:49	2	ragadxb	\N	\N		fey1dkwtSDmoK2uZswaeoA:APA91bFWiI68QhdNB_bXC42MjTOKlx_heXhOfy9x3NtX4d8IgfrvZ_ZbQYmZp9zD-BM9-AuvcBqAXFuAbGRJozxjooq1fIBp49OTrD9HNruesEq6SqqPZKw	ANDROID	fe0587a64d713e27f9a4cb0fdf01dfead62ce9ec045d7f92cf24c964529c2d7e	-OD8LEenh4QHGNFQdkI_	\N	2024-12-02 21:48:49	2025-02-11 08:14:18	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N	2024120212	0	0		0	0	\N	\N
52	\N	hibaejaz97@gmail.com_deleted_mail	\N	_deleted_mobile	0	$2y$10$6Q4YcqMY9yr3vLV1MQe4n.KJjI3vxGhMWbn8dtfOrhLj44k1q/OZu	\N	3	Hiba	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 09:31:55	2025-01-10 09:45:17	0	0	0	0	0	1	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	enabled
3	\N	test@yopmail.com_deleted_mail	971	555555555_deleted_mobile	0	$2y$10$BpeueI3YtidDFC0xMvef0e/QAYFzALbWPP/1G2CTojNChbwg.eVFK	\N	3	test	test	\N	\N	\N	\N	\N	\N	\N	2024-06-28 06:24:24	\N	1	0	1	0	0	1	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	7			\N		0	0		0	0	\N	\N
6	\N	m@m.com	\N	123455	0	$2y$10$PdomyeXOLOrlSh7Xb8c4wurVAHhY3TeZBM4iwgrtaz8IxfnoXFq3m	\N	1	Khalifa	Alian	\N	\N	\N	\N	\N	\N	\N	2024-07-04 15:04:04	\N	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0	manager	0	0	\N	\N
46	\N	hibaejaz97@gmail.com_deleted_mail	\N	_deleted_mobile	0	$2y$10$.pe4lzE4Lj440.J2.dihoe8SX26G61JgtAq2Uzz7mE2pNGfdDHlrq	\N	3	Hiba	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-09 15:14:47	2025-01-09 15:14:47	0	0	0	0	0	1	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		1	0	\N	\N
21	\N	nivuj@mailinator.com	\N	\N	0	$2y$10$uTxli3soF3UE6AG74jh6Du420PNGOdTDV02gZXmz2cPKOpOjvTidi	\N	3	Serina	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-07 14:06:20	2025-01-07 14:06:20	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
2	RUSVIN K	rusvinmerak@gmail.com	971	7034526952	1	$2y$10$yvUq0wjrEekXZoGO7K3KPOI02.VAxrNgQakGbD5BQB6HI3xFiadii	\N	2	RUSVIN	K	/uploads/company/667d446ad4466_1719485546.jpg	\N	1111	\N	63dc7012a98074adeddabf75dfcb10f93c3226b7999f6fe47cd91ff66261c9a5	-OEYPEBELYhVl2-wz_y0	\N	2024-06-27 10:48:19	2024-12-20 09:32:06	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	202412202	0	0		0	0	\N	\N
1	Admin	admin@admin.com	971	112233445566778899	0	$2y$10$4CKClSnfh0w959jNrsJyl.8/oowWbizHIg4FrOlXxfgtYYBU6Y6jK	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
15	hiba user	hibadxba@hotmail.com	971	561660133	1	$2y$10$w5sBJoeody7Mny/EWGM3z.UTouRygkw39ghpplp1wDtISY9NJnYDa	2025-01-07 06:04:34	2	hiba	user	/uploads/company/677e11d258aa3_1736315346.png		c8twPepeQPGF-DTAsEnsvi:APA91bGIWpH0-gAYN1ShCpsZIY2ZGHaxsFYVC945WoPtZHw8JDNZ-d9TSyYP1elhTfV4VRG8l87MQnRu6WLJ6TXwRSpWKtk1wZhf6U9OulTentCj4SgZpaM	ANDROID	0ca485b5b2be1f8c37557c3434e7cff8db32653b560069d95bba6ef180f04024	-OFzMLtcP864xGDgKYO1	\N	2025-01-07 06:04:34	2025-03-10 08:17:06	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	100	\N	\N	0	\N	\N	0	\N			\N	2025010715	0	0		0	0	\N	\N
10	s login 	new_social1@gmail.com	92	3095555555	1	$2y$10$Ch0H1uVSxO/gNvhETynaDe8ePjT0Ws9EhOHU3rd5.ZEzPJPlNfxHq	2024-12-02 09:21:57	2	s login	\N	\N		1111	andriod	92b0eb24679ddc74d37b09ccc0fe9cecdd47ead372248048e12db12b8516b4f8	-OD5fIArJzZ9WkRHLkQV	\N	2024-12-02 09:21:57	2024-12-02 09:25:13	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N	2024120210	0	0		0	0	\N	\N
23	\N	admin@adasdmin.com	\N	\N	0	$2y$10$MYXxvxnN3DaVKHDrIlnpQuo1ULCYRtDiqSdQh0rra12RE/oVv59nC	\N	3	asdfsdf	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-07 15:59:19	2025-01-07 16:02:37	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		1	0	\N	\N
22	\N	anz1@anz1.com	\N	\N	0	$2y$10$gjN3VcAnQHy/3Bw6nBFjZuFI0zsak3BrlRnx11wEqe0JAnbhnubp6	\N	3	Anil	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-07 14:15:48	2025-01-07 14:15:48	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		1	0	\N	\N
20	\N	wigeholy@mailinator.com	\N	\N	0	$2y$10$y5H3zMzFyyWzM839oCZ6ZOBfmxQxq5JyhLx3OhYJsfphIgRfbBJ/6	\N	3	Clare	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-07 14:05:12	2025-01-21 06:44:53	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	disabled
18	\N	steve@gmail.com	971	561660166	0	$2y$10$uYwgr/WWSHi2b4LRcgV9JuzIwaDHnLG2GT82hYeuKN3X17mZ/dDVS	\N	3	Stive	Pie	\N	\N	\N	\N	\N	\N	\N	2025-01-07 08:57:01	2025-01-21 06:37:03	1	0	1	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	7			250		0	0		1	40	\N	disabled
16	\N	tompay@gmail.com	971	5616601344	0	$2y$10$3b11EZExJkzica5es0f7ge72ZO5zmtijWpRCeurykRVMPqWAJ/LhG	\N	3	Tom	Pay	\N	\N	\N	\N	\N	\N	\N	2025-01-07 06:48:56	2025-01-21 06:34:59	1	0	2	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	7			200		0	0		1	50	\N	disabled
4	\N	mubija@mailinator.com	971	98765543212	0	$2y$10$FS3Tj504l0AztKLxUho.GudbeNUR.SmLMPTQlGLJk/VanjGNDokaC	\N	3	Quon	Hub	\N	\N	\N	\N	\N	\N	\N	2024-07-02 04:33:39	2025-01-21 06:31:06	1	0	1	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	7			0		0	0		1	0	\N	disabled
11	Hunain Ahmad. 	hunainahmad12345@gmail.com__deleted_account11	971	987654321__deleted_account11	1	$2y$10$/6ei8XQDoioTvlFHIG4mg.YFEwuKZ96SK/wqDCyM4e9nbzkSHjqGy	2024-12-02 09:56:40	2	Hunain Ahmad.	\N	\N			ANDROID		-OD5nEoNNKMnhqVzS5qR	\N	2024-12-02 09:56:40	2025-03-08 12:10:57	0	0	0	0	1	1	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N	2024120211	0	0		0	0	\N	\N
5	\N	v2@mailinator.com	971	76666666565	0	$2y$10$MfA6hbpHAbNhN9gZ66t2juLLVeuB.1irp84jNEVbYEdoxYcAj8s5m	\N	3	Gift	Palace	\N	\N	\N	\N	\N	\N	\N	2024-07-02 04:35:46	2025-01-21 06:33:09	1	0	1	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	7			0		0	0		1	0	\N	disabled
51	\N	favupapan@mailinator.com	\N	\N	0	$2y$10$ATXJ.Li2W1xwVQpfAJmRxegyy1GUL7Uiw4nrNPVuPM8ARqYgdeDlG	\N	3	Stephen	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 09:27:35	2025-01-10 09:29:53	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	disabled
17	\N	david@gmail.com	971	561660155	0	$2y$10$iXZDqPPo2VwY0mPAOaRXf.mqkIkkb9iOJ6A051meq4mhNoZOJ5sf2	\N	3	David	Agarwal	\N	\N	\N	\N	\N	\N	\N	2025-01-07 08:48:08	2025-01-16 07:28:20	1	0	1	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	7			500		0	0		1	25	\N	disabled
19	\N	anz@anz.com	\N	\N	0	$2y$10$2HmXwF4VdnHN8VWYeDVpGOkFjwtkRVkpsjM1FsDEhsm7aBqFiVH.i	\N	3	Anil	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-07 13:53:10	2025-01-21 06:47:10	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		1	0	\N	disabled
14	anilnavis 	anil@dxbusinessgroup.com	971	899566995	1	$2y$10$Gf6FAyl1oInlwx/l60Cl1.lxuuop0PR5pFI91ajE/1qTSqMjCk3Ka	2025-01-07 04:05:16	2	anilnavis	\N	\N			ANDROID	f2285a952769ee60eb68617655b031112ef875e4616109fcc26035e3c0f7c0c4	-OFyw2F-AGStHGYYeoAi	\N	2025-01-07 04:05:16	2025-03-05 09:26:07	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N	2025010714	0	0		0	0	\N	\N
24	\N	bilokece@mailinator.com	\N	\N	0	$2y$10$dhyphEq9FoSU/J7HqADiquKjX/bTOXbdf.YjMO5asumqaOTMv2iZu	\N	3	Drew	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-07 17:56:06	2025-01-07 17:56:58	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
25	\N	anz2@anz1.com	\N	\N	0	$2y$10$afs/WR31ORtUyuN8BLEwheAs2qsg.RmSyv4mYjf/4hHz8xcmqCncK	\N	3	Anil	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-07 18:03:25	2025-01-07 18:12:25	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
37	\N	is@sdg.com	\N	\N	0	$2y$10$SbwTqt8O6aXIPUwNfr3EJ.EDfgdlebhI9Mtm/WeP4CnLb3i0tYMgq	\N	3	anil	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 10:34:31	2025-01-08 10:40:55	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
27	\N	joqiqoryvo@mailinator.com	\N	\N	0	$2y$10$LK45I6J0PRisRoIZ0ij2pu5idZfXxaKfd3L5mMnFs3XPuWU43Lhlq	\N	3	Brianna	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 04:42:31	2025-01-21 06:53:38	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	disabled
26	\N	vahufad@mailinator.com	\N	\N	0	$2y$10$hVYVN9LQ8ZqJwAeI3hnaD.SgQGXr.F32SDgQ4urJGVvd.86NUSqhS	\N	3	Louis	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 04:19:15	2025-01-08 04:20:21	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
28	\N	kafefawu@mailinator.com	\N	\N	0	$2y$10$k1V1cN6sXHkGHUphd0INSe2E/tSVytSXi3ZaJgW8EH6EIgXEqTp1C	\N	3	Sydney	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 04:45:57	2025-01-08 04:52:11	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
32	\N	anz3@anz1.com	\N	\N	0	$2y$10$Rqi2NBbL6ozp6nUBV4F7mOQDqQu0Kqb7.iXabPE9yukn6nMbWPi22	\N	3	Anil	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 07:59:31	2025-01-08 08:09:32	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		1	0	\N	\N
34	\N	noripa@mailinator.com	\N	\N	0	$2y$10$N2mgFydwSoIL53n9OiKW0.7TND9D.i8eAQjgyC7hhgGrR7Jgc/Lb2	\N	3	Latifah	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 09:03:10	2025-01-08 09:03:56	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
35	\N	csacs@cds.ss	\N	\N	0	$2y$10$YNf1Rtn8/XQwm/U8KCF.2ObcSGqREQrQYBA3rhmZvvDDtM5tAWXy.	\N	3	csdvsd	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 09:22:37	2025-01-08 09:22:37	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
36	\N	vdvds@vdd.sds	\N	\N	0	$2y$10$tA3U.c2D33Oyn4xBFIi0keHgF9wqusBUGEpGyQcEJFSat7oLx5ere	\N	3	vsdvds	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 09:23:10	2025-01-08 09:23:10	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		1	0	\N	\N
40	\N	natifihi@mailinator.com	\N	\N	0	$2y$10$0wpMF4VteB7ywDKExgIve.mVkuxAChwKxxpHpUXa4VYWKCjYVQZnS	\N	3	Deacon	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 14:11:19	2025-01-08 14:11:19	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
41	\N	rufoqih@mailinator.com	\N	\N	0	$2y$10$0zDcFVAWrnLRMt6i.Gvgi.aasUhyqdBCjXgtb7cI3wHzTEtYHGXN.	\N	3	Marsden	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 16:22:26	2025-01-08 16:24:37	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		1	0	\N	\N
43	\N	ddd@sdg.com	\N	\N	0	$2y$10$qj4GbZUe12Tc76dgIikJi.eSH3GIPAlDJpHNly88qbA2XucMJ.sh6	\N	3	ai	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-09 07:46:10	2025-01-09 07:46:10	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
38	test dev two	test2@gmail.com	971	3213698744	1	$2y$10$nq4fPOaEdxeJ3at79dYp4eL./VYaVj4L3iIdFl9xQUBb6/VUdSzau	2025-01-08 10:41:12	2	test	dev two	\N			ANDROID	4910bf08752f555e86553d6c7ee98349b374b6b24f752992f7577a2502f0394a	-OG4VFigX-8YaQYAcl3s	\N	2025-01-08 10:41:12	2025-01-09 12:23:11	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025010838	0	0		0	0	\N	\N
44	\N	anil@anil1.com	\N	\N	0	$2y$10$.tJ4A3o99CrLRk8tD1/oGOT7QGfLck7tDmhXCZ8uGU3xbm6DyeUXy	\N	3	anil	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-09 14:36:44	2025-01-09 14:36:44	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
42	\N	liwuriryfy@mailinator.com	\N	\N	0	$2y$10$4/VUWNk5vClDPPdiKsJXUuilgFAGpwq9JJQLpaQWgdpcpJ90sCxUe	\N	3	Leo	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 16:31:25	2025-01-08 16:43:22	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		1	0	\N	\N
30	\N	marthurcheng@gmail.com	971	561660188	0	$2y$10$8LkTaz6xO4Tpr4mVRJfPCe49Mlo1eDy5yJeDDD7VJcg.GJzIZnZMy	\N	3	Marthur	Cheng	\N	\N	\N	\N	\N	\N	\N	2025-01-08 06:55:40	\N	1	0	1	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	7			200		0	0		1	20	\N	\N
29	\N	xcczxcxzczx@dcss.ds	\N	\N	0	$2y$10$LDzPhqDJSiHgASw7x6/6qOxVxIBTED4w3W26QftsY5EaoU1akmu4q	\N	3	Store	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 04:53:14	2025-01-21 06:49:16	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	disabled
45	\N	sfsaf@f.com	\N	\N	0	$2y$10$wLju5ObQn11Sq.TZfLwkV.vqXk6L6ajYl3JYnG5gsg1qEr0xgWQlS	\N	3	anil	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-09 14:51:52	2025-01-09 15:02:08	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		1	0	\N	\N
48	\N	puqeqocona@mailinator.com	\N	\N	0	$2y$10$I4RWAJSrxKBg48pNxAg9cuStGfyaKlUX7Lf3cDoluUlfNVH3PWLbS	\N	3	Sierra	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 06:50:05	2025-01-10 06:50:05	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
49	\N	puqeqocona@mailinator.com	\N	\N	0	$2y$10$KlWTN3NJ2Ekf5GuZdkkR2upkkHon1.ok04qxVKLm.OB4vbXtidULy	\N	3	Sierra	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 06:50:05	2025-01-10 06:50:05	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
50	\N	mozu@mailinator.com	\N	\N	0	$2y$10$F06LgAFi9X1WnN9pHDiaceNjwFv/7BPVxXwREXnf54TuuuzUCQv6e	\N	3	Troy	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 09:10:30	2025-01-10 09:12:23	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	enabled
31	\N	asda@asdasd.com	\N	\N	0	$2y$10$1aaVsXk8icfxaMv3v1TbOeIx87dhxSkxfw.HGxUztGW/ALoEyvjQ.	\N	3	Randall	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 07:21:34	2025-01-21 06:50:50	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		1	0	\N	disabled
39	\N	telinatyki@mailinator.com	\N	\N	0	$2y$10$4u1vN2Hkhcq5avWjB4gRVe4uxDRNRSXVyPBzpXfVdnQZVfQeAYc2y	\N	3	Pearl	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-08 11:20:40	2025-01-21 06:55:09	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	disabled
47	\N	wahal@mailinator.com	\N	\N	0	$2y$10$rrhuWz1Gh9mosqKTf55YYezp/oyD6cjCjfd7srslW1WmSKkCrFkEG	\N	3	Valentine	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 06:17:33	2025-01-21 06:58:09	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	disabled
73	Test User	pl@gmail.com	971	845161884	1	$2y$10$ZnKDxC3cqSRJgc.C14PBtOfplc/C/PDxAlZ/HJjhkpzIF//4LQXBm	2025-03-01 19:35:03	2	Test	User	\N		abdhjef ekef kjwf wedfw	iOS	8719853e2c44246f660c372dbeb817267b0639edd5198229857dd9a437f58819	-OKIC6oyT1CQ-c_hhPBL	\N	2025-03-01 19:35:03	2025-03-01 19:35:03	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025030173	0	0		0	0	\N	\N
71	Aamir .	aamir.dxbapps@gmail.com	92	302806664	1	$2y$10$z8fIyia5ZFP/IQ8HNQ7YReMlay5ZCUFvjKk496z6iQmzXTS7Mt/He	2025-02-14 14:04:22	2	Aamir	.	\N		1111	smap	0c51d172079d51ce863b0fe3b0a991bb3095c09a3484a574c7688cc30cc9620a	-OJ3l_YxzUHlyv3S5BjG	\N	2025-02-14 14:04:22	2025-03-24 17:29:17	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025021471	0	0		0	0	\N	\N
65	Rzwan Mirza	rizwan.3d@gmail.com	\N	03005336906	0	$2y$10$zXwZnnJ6vPg9ZEBw7Z/1AeczuiLzKKwKbx9Eb.OhImGqivIMzzE26	\N	2	Rzwan	Mirza	\N	\N	\N	\N	\N	\N	\N	2025-01-27 05:43:40	2025-01-27 05:43:40	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
56	\N	xzczxxzc@cvcx.ds	\N	\N	0	$2y$10$gbX8IyFBRZJuYhIBy/lnb.VeTY5dZ5NCHujxZCrjAdpZbqK2ucrQW	\N	3	dsfsdfsdffds	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-15 05:06:00	2025-01-15 05:06:00	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
57	\N	dxbiftikhar1@gmail.com	\N	34242342342	0	$2y$10$un1Ec59rRmSHFaxyF5OG5ORMQRXBK0fo0XHtuBbEB6mk9DDu7B12m	\N	2	dxb	iftikhar	\N	\N	\N	\N	\N	\N	\N	2025-01-15 07:14:18	2025-01-15 07:14:18	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
53	\N	lapunyc@mailinator.com	\N	\N	0	$2y$10$sG5ugWtpY.u5i6eIpJxPJeytXO9j1U.exSr.KsXDpOsMNznEIViaG	\N	3	Alexa	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 13:48:26	2025-01-10 13:48:26	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
60	\N	guesthhh@gmail.com	\N	0561660155	0	$2y$10$NDHjxsXg6Y3i/z1RRzy7/OzYYPEkE0.b1lZYWeODg8u6jeJromzEa	\N	2	Guest	hhh	\N	\N	\N	\N	\N	\N	\N	2025-01-15 09:48:06	2025-01-15 09:48:06	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
66	Guest hhh	guest@gmail.com	\N	0561660155	0	$2y$10$6fiyA7Hfct/zXxbyoFn2MehPkwKcoqo55dlCw1iNfbGiEQHWo.E9.	\N	2	Guest	hhh	\N	\N	\N	\N	\N	\N	\N	2025-01-27 06:01:10	2025-01-27 06:01:10	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
54	\N	hiba@gmail.com_deleted_mail	\N	_deleted_mobile	0	$2y$10$kKqhBdyQQtw13AuhiQJwiusa6NYmR/a2gGywxUrfZ19LnGvf4ABCq	\N	3	hhh	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 15:09:05	2025-01-10 15:09:05	0	0	0	0	0	1	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
55	\N	dxbiftikhar@gmail.com	\N	757656756567576	0	$2y$10$vLvwo5zZaUN0ftLsEx7dKO5.3e437SoriSCd8JxeTcLbrwzRMWgEW	\N	2	dxb	iftikhar	\N	\N	\N	\N	\N	\N	\N	2025-01-14 06:03:32	2025-01-14 06:03:32	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
58	Ajesh Kumar	ajeshcd@gmail.com	971	505041860	1	$2y$10$81AOcnDkVKLFdPyvouvFpucwMvHzopsB6NJo1qyELjw.O2IFS6706	2025-01-15 09:18:43	2	Ajesh	Kumar	\N		abdhjef ekef kjwf wedfw	ANDROID	cb770626db1f83f4b74969ce46699c39c34bb4df0bca631fbde00adf12916348	-OGdFVnVVTZqyg56Z7KA	\N	2025-01-15 09:18:43	2025-03-09 03:51:37	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N	2025011558	0	0		0	0	\N	\N
13	Asad nazir	asadnazir289@gmail.com	971	3441560349	1	$2y$10$c2oHLdQkil2Ao7AISKLxUefUtBB9xGcwVgP3zJdCM6L15IYCs.Rt6	2025-01-06 22:22:11	2	Asad	nazir	/uploads/company/67892434b57b9_1737040948.jpg		eufJNcZa8E8N5Kwvs2yBL8:APA91bH1k3W57vn3pxEnykSleW3KQhzUHX8sRLiurEIMnMXbJkagYCp_fRIhhzIuHGewMD475n_chKUreIChmDBNavWeDt_MZwDj7XxI5CtWCHq4farFXvE	ANDROID	88d67f8c28f5b71554cafbff069de77b0bc6e74fcfe2b5986f00dad42e042a6d	-OFxhWdfgqKK_9a7jQ9h	\N	2025-01-06 22:22:11	2025-01-16 15:22:28	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	2010		2025-01-10 13:01:55	0	\N	0	0	\N			\N	2025010613	0	0		0	0	\N	\N
64	\N	recoba-92@hotmail.com	\N	\N	0	$2y$10$Md8S8ovnTPVs6e0qoWk7ou64oUQRhY8KV7YEYUEoMgc5GxgVbuKKC	\N	3	Abdullah	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-18 16:32:17	2025-04-03 10:49:49	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	disabled
69	tet tes	test24@gmail.com	971	181818118282	1	$2y$10$Ma70Ar2Wz9lLILYLSGuJ4.ih4qOBG800L03Z9bnYpW1K/BacjyIvy	2025-02-11 19:28:36	2	tet	tes	\N		abdhjef ekef kjwf wedfw	iOS	abd38aa3d25869009cda6d2a0163242b45962685b6e55c73a1f5cd21aa0bc319	-OIqU0u4JwKmKyjeNX06	\N	2025-02-11 19:28:36	2025-02-11 19:28:37	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025021169	0	0		0	0	\N	\N
63	\N	drbal3in@hotmail.com	\N	\N	0	$2y$10$GvPV68Vt33ZASgMxlotHoutryyZ8b4Cm7j6qHf4VUQgk0Cnk5obWa	\N	3	Mohammed	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-17 15:42:07	2025-01-17 15:42:07	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
67	Aamir .	aamir2.dxbapps@gmail.com	92	302806688	1	$2y$10$O3Pom0cF9t/c43viI6dPze.aPD0KPqfQnPA04IvbRRJlOUlsHYMk2	2025-02-07 15:57:27	2	Aamir	.	\N		1111	smap	2e86923508544b7abc2e68f3b0403d340f86bc2054b0255656f28596b7c6a198	-OIW7KrP_92PQIdm4PyX	\N	2025-02-07 15:57:27	2025-02-07 17:26:55	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	0bec63c587a7933b9d96c8f802a47c02577545bbd6488d9bb813cfca5666a921	2025-02-07 17:23:23	0	\N	1111	0	\N			\N	2025020767	0	0		0	0	\N	\N
9	hunain dev	hunain88@gmail.com	971	123456789	1	$2y$10$oMOk2VEOuBYI8FCX6J4zuuw3oXDbM/WxmRD5F0qCy06KqOVT95cjK	2024-11-30 11:33:34	2	hunain	dev	/uploads/company/6784d5cdf03dc_1736758733.jpg			ANDROID	5eb8829415272fecfd9d66ffb8ddc522a4140799271dee56a0ba804d8fd1a2bf	-OCwqEiORwtIfFZt9P2d	\N	2024-11-30 11:33:34	2025-02-11 16:07:01	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0		2024-11-30 12:22:30	0	\N	0	0	\N			\N	202411309	0	0		0	0	\N	\N
68	test test	test23@gmail.com	971	828282822828	1	$2y$10$YytJeorLG489dMGDF8o0e.Kq8PFakphMJPdikTGnoq55hTxiVYuK6	2025-02-11 19:22:36	2	test	test	\N			iOS	4c8f86ba5bbf8525d631069e2d6d80efd3baee6498bd0b7b3221c1ea68f61c90	-OIqSe0lX4qs2RzcejEu	\N	2025-02-11 19:22:36	2025-02-13 08:32:05	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	ba6a9ef7f204dcfc716d50be3c29ea9739ba03efef7302c70b68bad2628dd76c	2025-02-11 19:58:22	0	\N	1111	0	\N			\N	2025021168	0	0		0	0	\N	\N
70	hiba user	hibatestuser@gmail.com	971	561660198	1	$2y$10$knoNGEU1A4VDhGUwFTwnN.Jls16l3Hl8SMNVuC8tIAC7UE2qzkxpa	2025-02-13 08:39:50	2	hiba	user	/uploads/company/67cb4067beaf5_1741373543.jpg			ANDROID	5696bd5ab6936563a60a14e3b735cb21a1cbcdeccfcf8193a1cc322053a336f1	-OIyShvIiG-gqkN3l9iG	\N	2025-02-13 08:39:50	2025-03-08 12:45:17	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	20	\N	\N	0	\N	\N	0	\N			\N	2025021370	0	0		0	0	\N	\N
62	\N	khalshamsi42@gmail.com	\N	\N	0	$2y$10$URKGuIjIL7fKkDSmsQ0AZulhJgTYFn3ApWvbribRe774w38SOX62e	\N	3	Khalifa	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-17 14:59:51	2025-03-19 23:42:50	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	disabled
61	\N	ajeshkumarcd@gmail.com	\N	\N	0	$2y$10$peH6pOtruM6fz9O4k94Y0O4lZDJNdtKF1frswyHt.H4hVqNxKvr/u	\N	3	Ajesh	\N	\N	\N	dTMvyDChRWuWmMRyJkitgl:APA91bF_alX0Dfpo4XTiQan-VG9C0AK2r4YofxDZRLQ8BIQ0LgXtBlSkc_AuayRqV9qZNZsWIhQe0fYHnHQz_78iGsGORGr3HAlCfUYUGZxFFH6co8TSogY	\N	\N	\N	\N	2025-01-15 10:16:59	2025-03-26 12:00:43	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0		2025-03-25 09:03:53	0	\N	0	0	\N			\N		0	0		0	0	\N	disabled
76	anil navis	anil@anil.com	971	5466484646	1	$2y$10$f9fFDpT7Sx3K9X4rsVgZr.pUB2vnrrf4wKkVLnANSAypIHJOqbNKi	2025-03-05 09:27:24	2	anil	navis	\N		eRt1vZ-ZSoCThgoF6Smx4P:APA91bGFrHB_eYb_L8QGblbaPut0ZHmEZks26RYHrZIl5ycZgljrpeQ34GWjb3D6sroD1d2kSE6JmAQ-EONqp3L0OWdbwvoEbW7PxtwVzQJ0fhPPXa2prK4	ANDROID	fe18390561865ca0b283d58c07f0d63530741d4f6d947ada9e87101afaf6b287	-OK_cOgjM-TuSfCdDSTc	\N	2025-03-05 09:27:24	2025-03-06 04:23:32	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	200	\N	\N	0	\N	\N	0	\N			\N	2025030576	0	0		0	0	\N	\N
78	Nas Test	io@gmail.com	971	4848848484	1	$2y$10$Xnl33AVEur9vUxnTvpBD4.1s6LUmnO/VYz05AJBQLHWTC2usEUT62	2025-03-05 20:15:03	2	Nas	Test	\N			iOS	412a362bb65e48ff841c07c4ceb65542f46669f9c77fcb5d039ab3965ec4e391	-OKbwcriCbo7nxKvtqWb	\N	2025-03-05 20:15:03	2025-03-07 09:46:11	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025030578	0	0		0	0	\N	\N
80	Hunain Ahmad. 	hunainahmad12345@gmail.com__deleted_account80	971	36521788636__deleted_account80	1	$2y$10$zekXYT65oKrdlNnB.U0/AOJrqxbo9t.Lt3FLLEFWdHEe6MQIUNste	2025-03-08 12:12:42	2	Hunain Ahmad.	\N	\N			ANDROID		-OKpf-SUuar56IpbGfAg	\N	2025-03-08 12:12:42	2025-03-08 12:15:55	0	0	0	0	1	1	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N	2025030880	0	0		0	0	\N	\N
82	Nas Test	gh@gmail.com	971	45455454848	1	$2y$10$O9otZSWgOfuGupcQ/Pe1x.5gUWyUl4P9Jd4.K2KtKt1Mt8Vb0ih3.	2025-03-08 14:47:19	2	Nas	Test	\N			iOS	31ea531a562248e171332367269202b136bc85fbab35c05cb8d20975a7b08583	-OKqDOKkxI4YMLtGFdvP	\N	2025-03-08 14:47:19	2025-03-08 14:47:26	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025030882	0	0		0	0	\N	\N
85	Nas Test	kl@gmail.com	971	4555455457	1	$2y$10$32nkP6m5AaO6Yw1q7wAjz.zxxCp8DnvY7iVZDmvGxcNH.oIg8euI2	2025-03-09 00:29:14	2	Nas	Test	\N			iOS	94cddfe406c4a0d034a8a11aa558a43ff5316eec1189a1b296228017efd9aa7d	-OKsI_Lt6HkLp-zWV96G	\N	2025-03-09 00:29:14	2025-03-09 00:44:18	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025030985	0	0		0	0	\N	\N
81	Nasrullah khan 	nasrulahpitafi@gmail.com	971	558885666625	1	$2y$10$zPvMD0c2igsIxVsrNGVs2OQynhbcbAi0Uk.UqVdQlNkApb8RFP0Je	2025-03-08 14:34:49	2	Nasrullah khan	\N	\N			iOS	7cc6794646d848cb68801ec4529d533626b0c59cd56cdeef3c52e3be71c974e1	-OKqAX7LhBm0gKdXeM1F	\N	2025-03-08 14:34:49	2025-03-10 04:28:01	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	150	\N	\N	0	\N	\N	1	\N			\N	2025030881	0	0		0	0	\N	\N
75	hzj hzu	fet@gmail.com	971	766464679	1	$2y$10$bV9zeabAF/PVa8fhunSkcuBd4EmnCOMYiRXxxGAek63oJCAaIjTcG	2025-03-04 18:40:26	2	hzj	hzu	\N			iOS	6f45f5c31f0ab9aa9c12b26b9a3656538a389849fc9a0f84c72e3a10fedaff7f	-OKXSO1bruK3J_O7P66S	\N	2025-03-04 18:40:26	2025-03-04 22:18:04	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025030475	0	0		0	0	\N	\N
84	Nas Test	nk@gmail.com	971	48484848848	1	$2y$10$CP3VJ9SxHraZpBmPgxk2e.tpCmvH3jsg9GBT67cmKDMA4V3KiY6UO	2025-03-09 00:26:28	2	Nas	Test	\N			iOS	32f8f090221d45fb51a7c74191a489192d6d2a682c2a6401c98d4f8fb727cd87	-OKsHx0SD3qTNYr0BKQE	\N	2025-03-09 00:26:28	2025-03-09 00:28:34	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025030984	0	0		0	0	\N	\N
74	anil navis	anilnavis@gmail.com	971	534005096	1	$2y$10$cqtoVmMRWnSqnfykwkST0OSB5cndVyETMVI22vQ8iF65QiYL8aQRa	2025-03-04 02:46:53	2	anil	navis	\N			iOS	30e7f622bc61ce2c150c8352bf9a886792c346ea2d366294ff367d3f58e92b50	-OKU27xqVWxCIz-5SSE0	\N	2025-03-04 02:46:53	2025-03-11 09:07:24	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0		2025-03-06 03:47:17	0	\N	0	0	\N			\N	2025030474	0	0		0	0	\N	\N
91	\N	habib@gmail.com	\N	\N	0	$2y$10$k1BQ20xe8AuLoIGpp1FFvOq/08NTWsfzr/O7AP4.sJLCWOGV3j/m.	\N	3	habib	\N	\N	\N	\N	\N	\N	\N	\N	2025-03-21 20:07:37	2025-04-01 14:32:12	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	disabled
90	Rizwan Mirza	mr.rizwan@hotmail.com	\N	0923005336906	0	$2y$10$HOuuUIJswU2FcPYnQzMeyOoPn60SHxItqg3rRhOidczI3AaEmHTrG	\N	2	Rizwan	Mirza	\N	\N	\N	\N	\N	\N	\N	2025-03-13 16:55:59	2025-03-13 16:55:59	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
86	Test User	newtest@gmail.com	971	4848848787	1	$2y$10$DyV7tjF6zb9zpOSkcysfeeQEzjrhmTtTuvpxpzg8YBPVGBacnwX0K	2025-03-09 00:45:01	2	Test	User	\N			iOS	de0dd329d2bdd4686597fa200f757240211a821520641ff21d060983ed8e8c4b	-OKsMBj_Q9LufkryXmmz	\N	2025-03-09 00:45:01	2025-03-09 00:50:46	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025030986	0	0		0	0	\N	\N
87	Lamees Fatima	lameeskhanpitafi@gmail.com	971	8484887788	1	$2y$10$s08Ky.ooWetJRROkNgoQduJtngB4VqDHkbKo1LvRn.VONNLM81/PK	2025-03-10 05:04:19	2	Lamees	Fatima	/uploads/company/67ce773ca4fde_1741584188.jpg			iOS	20088c2a92c01ef4526ad94a74431ab8ec311efa38f89a25908ab17e9c4f173e	-OKyR7bhzJWkqQhGpP9U	\N	2025-03-10 05:04:19	2025-03-10 05:50:54	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N	2025031087	0	0		0	0	\N	\N
72	Test User	testuser@gmail.com	971	646191461616	1	$2y$10$uNeOc9hmtcS6kKZDCqNLkOuGu4U.naPTRJ2y5/Y7zVz4bM.iZbDki	2025-02-25 16:34:32	2	Test	User	\N		abdhjef ekef kjwf wedfw	ANDROID	3381de9c88497a648215d76c914c3bb9388bfacee7af8e307124c270e4acd9de	-OJxxRWE2UvGm-JiQNfS	\N	2025-02-25 16:34:32	2025-03-27 07:03:03	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	50	21aafdea2593bd1f3a6a19d6c1f77c466a2d7b3ba1017d49ad96b1b532150012	2025-03-27 07:03:03	0	\N	1111	0	\N			\N	2025022572	0	0		0	0	\N	\N
79	Hiba Ejaz 	hibaejaz97@gmail.com	971	561660157	1	$2y$10$JDrd0.3j8.PHqexBFPyny.HiygDrsc827bQikrCCRR2D9OjuIVzOO	2025-03-08 12:04:42	2	Hiba Ejaz	\N	\N		abdhjef ekef kjwf wedfw	ANDROID	83c92759a396509e1adef7f943c946b62386631739bc8b423a97ed265a523289	-OKpdABQ6KLdbaPuKD5-	\N	2025-03-08 12:04:42	2025-03-10 08:35:33	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	5000	\N	\N	0	\N	\N	1	\N			\N	2025030879	0	0		0	0	\N	\N
88	zain 	z.falak777@gmail.com	971	546454545455	1	$2y$10$bynFGxYkOFf4wWOwSvEUE.N2iNvXxYbwI84/0BhBE80Up4f4/sl46	2025-03-10 06:06:47	2	zain	\N	\N		cosdNM2QLkYoiadoFJjbQE:APA91bEtjjcgVstWrq2xAbOIqqrzlHoKXiDlOrOGH_MTD42TdN4IVWV_B7GoEhDn3nQfabKLEOKsObSM8KRcml1GyfZ-_p-lylwhmWfiXSnSdPk8NTad6yY	iOS	72da5e4c07cfda98aaf912ecfe959829e899514c94c7937b1058dde2af9a25d7	-OKyeQkEVAFKR36WxaU0	\N	2025-03-10 06:06:47	2025-03-11 07:01:07	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N	2025031088	0	0		0	0	\N	\N
89	Riana navis	riananil2009@gmail.com	971	546646646	1	$2y$10$TEebQWPAWTOO//492.gpPORgwWHZob/CT5VwUmRt3rphIqbJc0j8S	2025-03-10 14:17:11	2	Riana	navis	/uploads/company/67cef49a423c7_1741616282.jpg		fTOIyaTJPETJt9zs0FX8_4:APA91bFqY8OF2Wr5GQDI5LcxnnrVWL5A4JRm6J0uu6LCu1eVRtYIiHhkcg3tcDxzq_NJTsZLTjsys4v8Eekx0Bdragm2urZorSjF5yNhXZ5VOByLIh3NriM	iOS	e9a78605a5b2b2b0c0626ab72a0ffd143b0ed383d1fb7048b27045080b4d953f	-OL-PfL5ndnb2i51kxy5	\N	2025-03-10 14:17:11	2025-03-11 11:49:26	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N	2025031089	0	0		0	0	\N	\N
83	Nas Test	jk@gmail.com	971	548484848	1	$2y$10$Po8hkMd4jA5xOVKJdXjd1eShVFx7AbtKkUXwLctpgDz6ZgNYAYFou	2025-03-08 23:26:11	2	Nas	Test	\N			iOS	139f8e0194148660cfeb45c82e6a24f3856da4a8b8174ed8325e5cc4e05847c2	-OKs48uG5oOux5IBKrT2	\N	2025-03-08 23:26:11	2025-03-27 06:59:32	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025030883	0	0		0	0	\N	\N
59	\N	ajeshkumarcd@gmail.com	\N	\N	0	$2y$10$Oo802rzygY6/8pgTKYbt.O7gth2Bc2/Vajci5OceTGdlojbI.yLpi	\N	3	Ajesh Store	\N	\N	\N	d5bTINYlQeqA5GRogSFLWL:APA91bG0tbCIqosnhkju_Jx2nnJX8xRzNZzN0Gdi-t6JTfEHXuuMbDZ-4uEreQvPUy-pQ6Z7rT6yJu_Lyd5pUbq3Kjgmq1yjQjXO1lkiaVzVfNW2clozACA	\N	065e7daedbb51ec8eaf116a00eb8fac122c31f084a646a6ed0fcf11e5ce530e8	-OM5pZCRYS219cTJEnKi	\N	2025-01-15 09:35:38	2025-03-25 08:35:08	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	eb079e605d81442eddae4f9a9442fcf308c497957ff22da4df22a373695b183d	2025-03-25 08:35:08	0	\N	1111	0	\N			\N		0	0		0	0	\N	disabled
92	\N	habibbalochi8660@gmail.com	\N	123455	0	$2y$10$IPtnUy/rgJQ/v7axUPTUlOgqZ8GDnjKqTsre93ZaO54SSblh1CVpm	\N	1	habib	haboob	\N	\N	\N	\N	\N	\N	\N	2025-03-28 19:26:12	2025-03-28 19:29:09	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	{"dashboard_view":"1","customers_view":"1","vendor_view":"1","vendor_earning":"1","orders_view":"1","services_view":"1","products_view":"1","service_request_view":"1","masters_view":"1","banners_view":"1","coupon_category_view":"1","coupon_brand_view":"1","transport_view":"1","coupon_view":"1","cms_pages_view":"1","faqs_view":"1","contact_detail_settings_view":"1","settings_view":"1","rating_view":"1","reports_view":"1","notification_view":"1"}	\N	0	\N			\N		0	0	mod	0	0	\N	\N
93	khalifa alshamsi	test@handwi.com	971	111111	1	$2y$10$PPtiKwsYTUJWqvGltrKYoOpZdx/Khp.1tTN7sQCFNNCGasa4ml72K	\N	2	khalifa	alshamsi	\N	\N	\N	\N	\N	\N	\N	2025-04-03 11:10:22	\N	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
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
18	1	\N	0	0	Handwi	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-17 15:06:39	2025-01-17 15:06:39	0	62	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	1	1	R	Fdfdfdsfdsfds 121	1	00000	0507188834
7	1	/uploads/company/677cec5da1611_1736240221.png	0	0	Vivid Interiors	\N	\N	\N	AABB5566	2025-03-12 00:00:00	\N	\N	Mariam al owais building	\N	Industrial area 2	00000	/uploads/company/677cec5da1be0_1736240221.jpg	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-07 08:57:01	2025-01-21 06:37:03	0	18	0	58X6+JC - Al Jaddaf - Dubai - United Arab Emirates	58X6+JC - Al Jaddaf - Dubai - United Arab Emirates	25.200392364793725	55.31067060876463	\N	\N	50	0	\N	\N	Vivid Interiors is a décor brand that brings vibrant and colorful designs to life. Whether you're looking for bold statement pieces or subtle accents, Vivid Interiors ensures that every corner of your home radiates with energy and style.	/uploads/company/677cec5da1b1b_1736240221.jpg	1	1	dubai	dubai	1	234234	2342342342
5	1	/uploads/company/677cce5819122_1736232536.jpg	0	0	Thread & Trend	\N	\N	\N	AABB1122	2025-02-28 00:00:00	\N	\N	Ajman Gate Tower	Ajman	Industrial area 2	00000	/uploads/company/677cce5819e1c_1736232536.jpg	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-07 06:48:56	2025-01-21 06:34:59	0	16	0	9FG5+CP5 - Sheikh Zayed Street - Ajman Industrial 2 - Ajman - United Arab Emirates	9FG5+CP5 - Sheikh Zayed Street - Ajman Industrial 2 - Ajman - United Arab Emirates	25.3764521	55.45897369999999	\N	\N	40	0	\N	\N	Thread & Trend is a clothing brand name that combines two essential elements of fashion: "Thread," representing the materials and craftsmanship that go into creating clothing, and "Trend," symbolizing style, modernity, and staying current with fashion.\r\n\r\nThis name suggests a blend of quality fabric with contemporary, fashionable designs, making it an appealing choice for a clothing vendor aiming to attract customers who appreciate both craftsmanship and the latest trends. It evokes the idea of high-quality garments that are fashionable and timeless.	/uploads/company/677cce5819d59_1736232536.jpg	1	1	dubai	dubai	1	234234	2343242342
19	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-21 06:44:53	2025-01-21 06:44:53	0	20	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	1	1	Dubai	Dubai	1	342342	3242342342
3	1	/uploads/company/677db8eeab55c_1736292590.png	0	0	Gift Hub	\N	\N	\N	76456456464	2024-07-31 00:00:00	\N	\N	Hatta Center	\N	1/2 Street	76575	/uploads/company/66838323cec5f_1719894819.png	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2024-07-02 04:33:39	2025-01-21 06:31:06	2	4	0	Abu Dhabi UAE	Abu Dhabi UAE	25.205608871677928	55.288703590818336	\N	\N	0	0	\N	\N	test	\N	1	3	At maxime voluptatem	Labore similique rem	1	234123	1339392491
8	1	/uploads/company/6784d5cdf03dc_1736758733.jpg	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-07 10:20:06	2025-01-13 08:58:53	1	9	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0
20	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-21 06:47:10	2025-01-21 06:47:10	0	19	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	1	1	dubai	Dubai	1	342342	3424342422
9	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-08 05:49:06	2025-01-08 05:49:06	1	15	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0
10	1	/uploads/company/677e216c75cb9_1736319340.jpg	0	0	Ember & Lace	\N	\N	\N	AABB7788	2025-03-30 00:00:00	\N	\N	8th floor, 812 Apartment	\N	Industrial area 2	00000	/uploads/company/677e216c7671a_1736319340.png	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-08 06:55:40	2025-01-08 06:55:40	0	30	0	58M2+4H Dubai - United Arab Emirates	58M2+4H Dubai - United Arab Emirates	25.182761887707354	55.30148672509764	\N	\N	40	0	\N	\N	This name reflects both the craftsmanship (stitch) and the fashion-forward appeal (style) of handmade accessories such as bags, wallets, scarves, hats, and gloves. It conveys a sense of quality, attention to detail, and trendy design. Suggesting warmth and delicate detailing, this name could be fitting for handmade bags, scarves, and elegant accessories.	/uploads/company/677e216c762c0_1736319340.jpg	0	0	0	0	0	0	0
11	1	\N	0	0	Anne	\N	\N	\N	\N	\N	\N	\N	Vielka	\N	Pandora	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-08 16:43:01	2025-01-08 16:43:01	0	42	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0
12	1	\N	0	0	Anne	\N	\N	\N	\N	\N	\N	\N	Vielka	\N	Pandora	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-08 16:43:22	2025-01-08 16:43:22	0	42	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0
13	1	\N	0	0	dddee	\N	\N	\N	\N	\N	\N	\N	wet	\N	werwer	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-09 15:02:08	2025-01-09 15:02:08	0	45	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0
14	1	\N	0	0	Madeline	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-10 09:12:23	2025-01-10 09:12:23	0	50	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	1	1	asdasdasdada	adadasda	1	123123	2423423423
15	1	\N	0	0	Elijah	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-10 09:29:53	2025-01-10 09:29:53	0	51	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	1	1	sadasdasdasd	asdasdasdad	1	213123	2131231313
17	1	\N	0	0	Ajesh Store	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-15 09:37:34	2025-01-15 09:37:34	0	59	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	1	1	aeae	dsds	1	233232	3232323232
6	1	/uploads/company/677cea486f1af_1736239688.jpg	0	0	Gleaming Grace	\N	\N	\N	AABB3344	2025-03-28 00:00:00	\N	\N	Mariam al owais building	\N	Industrial area 2	00000	/uploads/company/677cea486f8e2_1736239688.png	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-07 08:48:08	2025-01-16 07:28:20	0	17	0	10 27th St - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates	10 27th St - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates	25.20093599533033	55.241662735229475	\N	\N	50	0	\N	\N	Gleaming Grace is a refined and elegant name for a jewelry brand that conveys both sophistication and beauty. The word "Gleaming" suggests a radiant, shining quality, symbolizing the brilliance of fine jewelry. "Grace" adds an element of elegance and timeless appeal, evoking the delicate craftsmanship and refined designs that the brand offers.\r\n\r\nThis name would be perfect for a jewelry vendor focused on high-quality, exquisite pieces that emphasize both beauty and grace. It suggests a brand that appeals to those who appreciate both luxury and understated elegance, making it a great fit for products such as diamond jewelry, fine gemstones, or elegant gold pieces.	/uploads/company/677cea486f816_1736239688.jpg	1	1	dubai	dubai	1	453453	4534534534
4	1	/uploads/company/668383a277971_1719894946.jpeg	0	0	Gift Palace	\N	\N	\N	56675756756	2024-07-31 00:00:00	\N	\N	1/2 Hatta Center	\N	1/2 Street	56755	/uploads/company/668383a277a95_1719894946.jpeg	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2024-07-02 04:35:46	2025-01-21 06:33:09	2	5	0	673C+VFH - Dubai - United Arab Emirates	673C+VFH - Dubai - United Arab Emirates	25.204819	55.270931	\N	\N	0	0	\N	\N	test	\N	1	1	dubai	dubai	1	234234	3423423423
21	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-21 06:49:16	2025-01-21 06:49:16	0	29	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	1	1	Dubai	Dubai	1	232342	4234234234
22	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-21 06:50:50	2025-01-21 06:50:50	0	31	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	1	1	Dubai	Dubai	1	342342	2342423423
23	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-21 06:53:38	2025-01-21 06:53:38	0	27	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	1	1	Dubai	Dubai	1	342342	4234234234
24	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-21 06:55:09	2025-01-21 06:55:09	0	39	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	1	1	Dubai	Dubai	1	342342	3424234234
25	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-21 06:56:40	2025-01-21 06:56:40	0	64	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	1	2	Dubai	Dubai	1	342423	4242342342
26	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-21 06:58:09	2025-01-21 06:58:09	0	47	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	1	1	Dubai	Dubai	1	342423	2342342342
27	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-03-08 16:18:06	2025-03-08 16:18:06	1	72	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0
28	1	\N	0	0	habibhoodies	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-03-21 20:13:54	2025-03-21 20:13:54	0	91	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	1	1	st 12	house 37	1	765432	8765456787
29	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-04-03 11:10:22	2025-04-03 11:10:22	1	93	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0
\.


--
-- Data for Name: vendor_followers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_followers (id, vendor_id, user_id, created_at, updated_at) FROM stdin;
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
-- Data for Name: vendor_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_messages (id, name, email, phone, subject, message, vendor_id, created_at, updated_at, user_id) FROM stdin;
1	John	John@gmail.com	+97133889900	I want some information	I want some information before purchase	16	2025-03-07 07:43:25	2025-03-07 07:43:25	\N
2	John	John@gmail.com	+97133889900	I want some information	I want some information before purchase	16	2025-03-07 07:44:44	2025-03-07 07:44:44	\N
3	test	test@gmail.com	9711124321124	abc	Test	30	2025-03-08 15:57:17	2025-03-08 15:57:17	\N
4	est	test@gmail.com	9711221212121212	test	Test	30	2025-03-08 16:00:30	2025-03-08 16:00:30	\N
5	Sara we	tests@gmail.com	971121212121212	wrest	D	30	2025-03-08 16:13:51	2025-03-08 16:13:51	\N
6	Hiba	hibadxba@hotmail.com	971561660133	cotton luxe suit	Loren iosum	4	2025-03-08 18:26:52	2025-03-08 18:26:52	\N
7	Hiba	hiba@gmail.com	971561660122	test	Testuser	5	2025-03-08 19:38:15	2025-03-08 19:38:15	\N
8	gg	b@hj.com	97151646846555	casinos	Him	30	2025-03-09 06:03:52	2025-03-09 06:03:52	\N
9	John	John@gmail.com	+97133889900	I want some information	I want some information before purchase	64	2025-03-10 06:40:07	2025-03-10 06:40:07	\N
10	John	John@gmail.com	+97133889900	I want some information	I want some information before purchase	64	2025-03-10 08:01:14	2025-03-10 08:01:14	71
11	zain	test@gmail.com	971845454545454	abc	Test	30	2025-03-10 08:08:41	2025-03-10 08:08:41	88
12	tes	test@gmail.com	971846464661616	test	Bajajajjsjans bsnsnsjsjssnajaj jajajsjajaj\nBananajsjsj	30	2025-03-10 08:57:38	2025-03-10 08:57:38	88
13	abx	test@gmail.com	97185225554488	test	Abxfg	30	2025-03-10 09:43:00	2025-03-10 09:43:00	88
14	Ember & Lace	twrt@gmail.com	971885445455	test	Tedt	30	2025-03-10 09:53:39	2025-03-10 09:53:39	88
15	Thread & Trend	anilnavis@gmail.com	971213136161	Products that are not	The first time the two sides agreed to meet on a single day was when they agreed on the first date for a new peace treaty in Jiji City on March twenty ninth that will take effect on March thirty	16	2025-03-10 14:24:52	2025-03-10 14:24:52	89
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
5	15	100	credited	Wallet Top up (via App)	2025-01-11 10:05:00	2025-01-11 10:05:00	2
6	76	200	credited	Wallet Top up (via App)	2025-03-06 04:23:00	2025-03-06 04:23:00	2
7	72	50	credited	Wallet Top up (via App)	2025-03-07 18:30:00	2025-03-07 18:30:00	2
8	70	20	credited	Wallet Top up (via App)	2025-03-08 01:17:00	2025-03-08 01:17:00	1
9	81	150	credited	Wallet Top up (via App)	2025-03-10 01:09:00	2025-03-10 01:09:00	1
10	79	5000	credited	Wallet Top up (via App)	2025-03-10 08:35:00	2025-03-10 08:35:00	1
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
6	7667c92334b1e291741234996	A	76	pi_3QzVxoJGFNSKSXql0gyK2GgE	200.00	2	2025-03-06 04:23:16	2025-03-06 04:23:32
7	7267cb3b4d23a7a1741372237	A	72	pi_3R05fMJGFNSKSXql1lvDomWV	50.00	2	2025-03-07 18:30:37	2025-03-07 18:30:57
8	7067cb9a912c3871741396625	A	70	pi_3R0C0iJGFNSKSXql09bxDkNL	20.00	1	2025-03-08 01:17:05	2025-03-08 01:17:23
9	8167ce3baeb1ebd1741568942	A	81	pi_3R0uq2JGFNSKSXql1lJFEKei	150.00	1	2025-03-10 01:09:02	2025-03-10 01:09:23
10	7967cea443777211741595715	A	79	pi_3R11nrJGFNSKSXql0ibsMOLh	5000.00	1	2025-03-10 08:35:15	2025-03-10 08:35:33
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
-- Data for Name: wishlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wishlists (id, user_id, product_id, created_at, updated_at) FROM stdin;
3	66	37	2025-01-27 08:31:25	2025-01-27 08:31:25
4	66	23	2025-01-27 08:31:28	2025-01-27 08:31:28
\.


--
-- Name: aboutus_page_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aboutus_page_settings_id_seq', 11, true);


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

SELECT pg_catalog.setval('public.app_banners_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.articles_id_seq', 2, true);


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

SELECT pg_catalog.setval('public.bank_details_id_seq', 30, true);


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

SELECT pg_catalog.setval('public.cart_id_seq', 247, true);


--
-- Name: cart_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_service_id_seq', 1, false);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 18, true);


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

SELECT pg_catalog.setval('public.coupon_category_id_seq', 26, true);


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

SELECT pg_catalog.setval('public.coupon_vendor_id_seq', 12, true);


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

SELECT pg_catalog.setval('public.faq_id_seq', 1, true);


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

SELECT pg_catalog.setval('public.help_topics_id_seq', 132, true);


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

SELECT pg_catalog.setval('public.landing_page_settings_id_seq', 25, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.likes_id_seq', 124, true);


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

SELECT pg_catalog.setval('public.migrations_id_seq', 345, true);


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

SELECT pg_catalog.setval('public.notifications_id_seq', 15, true);


--
-- Name: order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_products_id_seq', 100, true);


--
-- Name: order_request_view_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_request_view_id_seq', 1, false);


--
-- Name: order_status_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_status_history_id_seq', 38, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 68, true);


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

SELECT pg_catalog.setval('public.payment_report_id_seq', 88, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 269, true);


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

SELECT pg_catalog.setval('public.product_attribute_values_attribute_values_id_seq', 7, true);


--
-- Name: product_category_product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_category_product_category_id_seq', 229, true);


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

SELECT pg_catalog.setval('public.product_id_seq', 48, true);


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

SELECT pg_catalog.setval('public.product_product_feature_id_seq', 164, true);


--
-- Name: product_selected_attribute_list_product_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_selected_attribute_list_product_attribute_id_seq', 49, true);


--
-- Name: product_selected_attributes_product_selected_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_selected_attributes_product_selected_attributes_id_seq', 8, true);


--
-- Name: product_specifications_prod_spec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_specifications_prod_spec_id_seq', 167, true);


--
-- Name: product_temp_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_temp_image_id_seq', 1, false);


--
-- Name: product_variations_product_variations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_variations_product_variations_id_seq', 8, true);


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

SELECT pg_catalog.setval('public.ratings_id_seq', 86, true);


--
-- Name: ratings_reply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ratings_reply_id_seq', 1, true);


--
-- Name: ref_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_history_id_seq', 1, false);


--
-- Name: report_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_reasons_id_seq', 5, true);


--
-- Name: reported_shops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reported_shops_id_seq', 6, true);


--
-- Name: service_assigned_vendors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_assigned_vendors_id_seq', 1, false);


--
-- Name: service_bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_bookings_id_seq', 75, true);


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

SELECT pg_catalog.setval('public.service_event_feature_id_seq', 36, true);


--
-- Name: service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_id_seq', 16, true);


--
-- Name: service_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_images_id_seq', 8, true);


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

SELECT pg_catalog.setval('public.stores_id_seq', 39, true);


--
-- Name: subscribers_emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscribers_emails_id_seq', 1, true);


--
-- Name: temp_order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_order_products_id_seq', 151, true);


--
-- Name: temp_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_orders_id_seq', 99, true);


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

SELECT pg_catalog.setval('public.temp_users_id_seq', 42, true);


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

SELECT pg_catalog.setval('public.user_address_id_seq', 40, true);


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

SELECT pg_catalog.setval('public.users_id_seq', 93, true);


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

SELECT pg_catalog.setval('public.vendor_details_id_seq', 29, true);


--
-- Name: vendor_followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_followers_id_seq', 1, false);


--
-- Name: vendor_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_locations_id_seq', 9, true);


--
-- Name: vendor_menu_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_menu_images_id_seq', 1, false);


--
-- Name: vendor_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_messages_id_seq', 15, true);


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

SELECT pg_catalog.setval('public.wallet_histories_id_seq', 10, true);


--
-- Name: wallet_payment_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_payment_report_id_seq', 10, true);


--
-- Name: web_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.web_banners_id_seq', 2, true);


--
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.websockets_statistics_entries_id_seq', 1, false);


--
-- Name: wishlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wishlists_id_seq', 4, true);


--
-- Name: aboutus_page_settings aboutus_page_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aboutus_page_settings
    ADD CONSTRAINT aboutus_page_settings_pkey PRIMARY KEY (id);


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
-- Name: report_reasons report_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_reasons
    ADD CONSTRAINT report_reasons_pkey PRIMARY KEY (id);


--
-- Name: reported_shops reported_shops_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reported_shops
    ADD CONSTRAINT reported_shops_pkey PRIMARY KEY (id);


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
-- Name: vendor_followers vendor_followers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_followers
    ADD CONSTRAINT vendor_followers_pkey PRIMARY KEY (id);


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
-- Name: vendor_messages vendor_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_messages
    ADD CONSTRAINT vendor_messages_pkey PRIMARY KEY (id);


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
-- Name: wishlists wishlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlists
    ADD CONSTRAINT wishlists_pkey PRIMARY KEY (id);


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

