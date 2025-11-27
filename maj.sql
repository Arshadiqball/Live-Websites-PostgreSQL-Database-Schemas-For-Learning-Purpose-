--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.0

-- Started on 2025-03-01 09:50:33

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
-- TOC entry 215 (class 1259 OID 647068)
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
-- TOC entry 216 (class 1259 OID 647073)
-- Name: aboutus_page_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aboutus_page_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aboutus_page_settings_id_seq OWNER TO postgres;

--
-- TOC entry 6806 (class 0 OID 0)
-- Dependencies: 216
-- Name: aboutus_page_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aboutus_page_settings_id_seq OWNED BY public.aboutus_page_settings.id;


--
-- TOC entry 217 (class 1259 OID 647074)
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
-- TOC entry 218 (class 1259 OID 647082)
-- Name: account_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.account_type_id_seq OWNER TO postgres;

--
-- TOC entry 6807 (class 0 OID 0)
-- Dependencies: 218
-- Name: account_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_type_id_seq OWNED BY public.account_type.id;


--
-- TOC entry 219 (class 1259 OID 647083)
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
-- TOC entry 6808 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN activity_type.availbale_for; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.activity_type.availbale_for IS '1-company,2-individual,3-both';


--
-- TOC entry 220 (class 1259 OID 647092)
-- Name: activity_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activity_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.activity_type_id_seq OWNER TO postgres;

--
-- TOC entry 6809 (class 0 OID 0)
-- Dependencies: 220
-- Name: activity_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activity_type_id_seq OWNED BY public.activity_type.id;


--
-- TOC entry 221 (class 1259 OID 647093)
-- Name: admin_designation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_designation (
    id bigint NOT NULL,
    name character varying(600) NOT NULL,
    is_deletd integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.admin_designation OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 647099)
-- Name: admin_designation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_designation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_designation_id_seq OWNER TO postgres;

--
-- TOC entry 6810 (class 0 OID 0)
-- Dependencies: 222
-- Name: admin_designation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_designation_id_seq OWNED BY public.admin_designation.id;


--
-- TOC entry 223 (class 1259 OID 647100)
-- Name: amount_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.amount_type (
    id bigint NOT NULL,
    name character varying(600) NOT NULL
);


ALTER TABLE public.amount_type OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 647105)
-- Name: amount_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.amount_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.amount_type_id_seq OWNER TO postgres;

--
-- TOC entry 6811 (class 0 OID 0)
-- Dependencies: 224
-- Name: amount_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.amount_type_id_seq OWNED BY public.amount_type.id;


--
-- TOC entry 225 (class 1259 OID 647106)
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
-- TOC entry 226 (class 1259 OID 647121)
-- Name: app_banners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_banners_id_seq OWNER TO postgres;

--
-- TOC entry 6812 (class 0 OID 0)
-- Dependencies: 226
-- Name: app_banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_banners_id_seq OWNED BY public.app_banners.id;


--
-- TOC entry 227 (class 1259 OID 647122)
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
-- TOC entry 228 (class 1259 OID 647130)
-- Name: app_home_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_home_sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_home_sections_id_seq OWNER TO postgres;

--
-- TOC entry 6813 (class 0 OID 0)
-- Dependencies: 228
-- Name: app_home_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_home_sections_id_seq OWNED BY public.app_home_sections.id;


--
-- TOC entry 229 (class 1259 OID 647131)
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
-- TOC entry 230 (class 1259 OID 647139)
-- Name: area_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.area_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.area_id_seq OWNER TO postgres;

--
-- TOC entry 6814 (class 0 OID 0)
-- Dependencies: 230
-- Name: area_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.area_id_seq OWNED BY public.area.id;


--
-- TOC entry 231 (class 1259 OID 647140)
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
-- TOC entry 232 (class 1259 OID 647146)
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.articles_id_seq OWNER TO postgres;

--
-- TOC entry 6815 (class 0 OID 0)
-- Dependencies: 232
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- TOC entry 233 (class 1259 OID 647147)
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
-- TOC entry 234 (class 1259 OID 647151)
-- Name: attribute_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attribute_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attribute_type_id_seq OWNER TO postgres;

--
-- TOC entry 6816 (class 0 OID 0)
-- Dependencies: 234
-- Name: attribute_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attribute_type_id_seq OWNED BY public.attribute_type.id;


--
-- TOC entry 235 (class 1259 OID 647152)
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
-- TOC entry 236 (class 1259 OID 647157)
-- Name: attribute_values_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attribute_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attribute_values_id_seq OWNER TO postgres;

--
-- TOC entry 6817 (class 0 OID 0)
-- Dependencies: 236
-- Name: attribute_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attribute_values_id_seq OWNED BY public.attribute_values.id;


--
-- TOC entry 237 (class 1259 OID 647158)
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
-- TOC entry 238 (class 1259 OID 647164)
-- Name: attribute_values_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attribute_values_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attribute_values_request_id_seq OWNER TO postgres;

--
-- TOC entry 6818 (class 0 OID 0)
-- Dependencies: 238
-- Name: attribute_values_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attribute_values_request_id_seq OWNED BY public.attribute_values_request.id;


--
-- TOC entry 239 (class 1259 OID 647165)
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
-- TOC entry 240 (class 1259 OID 647173)
-- Name: attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attributes_id_seq OWNER TO postgres;

--
-- TOC entry 6819 (class 0 OID 0)
-- Dependencies: 240
-- Name: attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attributes_id_seq OWNED BY public.attributes.id;


--
-- TOC entry 241 (class 1259 OID 647174)
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
-- TOC entry 242 (class 1259 OID 647179)
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
-- TOC entry 243 (class 1259 OID 647187)
-- Name: bank_code_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bank_code_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bank_code_types_id_seq OWNER TO postgres;

--
-- TOC entry 6820 (class 0 OID 0)
-- Dependencies: 243
-- Name: bank_code_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_code_types_id_seq OWNED BY public.bank_code_types.id;


--
-- TOC entry 244 (class 1259 OID 647188)
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
-- TOC entry 245 (class 1259 OID 647195)
-- Name: bank_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bank_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bank_details_id_seq OWNER TO postgres;

--
-- TOC entry 6821 (class 0 OID 0)
-- Dependencies: 245
-- Name: bank_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_details_id_seq OWNED BY public.bank_details.id;


--
-- TOC entry 246 (class 1259 OID 647196)
-- Name: bank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bank_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bank_id_seq OWNER TO postgres;

--
-- TOC entry 6822 (class 0 OID 0)
-- Dependencies: 246
-- Name: bank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_id_seq OWNED BY public.bank.id;


--
-- TOC entry 247 (class 1259 OID 647197)
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
-- TOC entry 248 (class 1259 OID 647204)
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blogs_id_seq OWNER TO postgres;

--
-- TOC entry 6823 (class 0 OID 0)
-- Dependencies: 248
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blogs_id_seq OWNED BY public.blogs.id;


--
-- TOC entry 249 (class 1259 OID 647205)
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
-- TOC entry 250 (class 1259 OID 647213)
-- Name: brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.brand_id_seq OWNER TO postgres;

--
-- TOC entry 6824 (class 0 OID 0)
-- Dependencies: 250
-- Name: brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brand_id_seq OWNED BY public.brand.id;


--
-- TOC entry 251 (class 1259 OID 647214)
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
-- TOC entry 252 (class 1259 OID 647221)
-- Name: building_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.building_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.building_type_id_seq OWNER TO postgres;

--
-- TOC entry 6825 (class 0 OID 0)
-- Dependencies: 252
-- Name: building_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.building_type_id_seq OWNED BY public.building_type.id;


--
-- TOC entry 253 (class 1259 OID 647222)
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
-- TOC entry 254 (class 1259 OID 647227)
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_id_seq OWNER TO postgres;

--
-- TOC entry 6826 (class 0 OID 0)
-- Dependencies: 254
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;


--
-- TOC entry 255 (class 1259 OID 647228)
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
-- TOC entry 256 (class 1259 OID 647237)
-- Name: cart_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_service_id_seq OWNER TO postgres;

--
-- TOC entry 6827 (class 0 OID 0)
-- Dependencies: 256
-- Name: cart_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_service_id_seq OWNED BY public.cart_service.id;


--
-- TOC entry 257 (class 1259 OID 647238)
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
    is_handmade boolean,
    background_image character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 647248)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 6828 (class 0 OID 0)
-- Dependencies: 258
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 259 (class 1259 OID 647249)
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
-- TOC entry 260 (class 1259 OID 647254)
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
-- TOC entry 6829 (class 0 OID 0)
-- Dependencies: 260
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- TOC entry 261 (class 1259 OID 647255)
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
-- TOC entry 262 (class 1259 OID 647258)
-- Name: cleaning_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cleaning_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cleaning_services_id_seq OWNER TO postgres;

--
-- TOC entry 6830 (class 0 OID 0)
-- Dependencies: 262
-- Name: cleaning_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cleaning_services_id_seq OWNED BY public.cleaning_services.id;


--
-- TOC entry 263 (class 1259 OID 647259)
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
-- TOC entry 264 (class 1259 OID 647262)
-- Name: comment_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comment_likes_id_seq OWNER TO postgres;

--
-- TOC entry 6831 (class 0 OID 0)
-- Dependencies: 264
-- Name: comment_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_likes_id_seq OWNED BY public.comment_likes.id;


--
-- TOC entry 265 (class 1259 OID 647263)
-- Name: comment_taged_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment_taged_users (
    id bigint NOT NULL,
    comment_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.comment_taged_users OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 647266)
-- Name: comment_taged_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_taged_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comment_taged_users_id_seq OWNER TO postgres;

--
-- TOC entry 6832 (class 0 OID 0)
-- Dependencies: 266
-- Name: comment_taged_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_taged_users_id_seq OWNED BY public.comment_taged_users.id;


--
-- TOC entry 267 (class 1259 OID 647267)
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
-- TOC entry 268 (class 1259 OID 647272)
-- Name: contact_us_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_us_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_us_id_seq OWNER TO postgres;

--
-- TOC entry 6833 (class 0 OID 0)
-- Dependencies: 268
-- Name: contact_us_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_us_id_seq OWNED BY public.contact_us.id;


--
-- TOC entry 269 (class 1259 OID 647273)
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
-- TOC entry 270 (class 1259 OID 647281)
-- Name: contact_us_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_us_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_us_settings_id_seq OWNER TO postgres;

--
-- TOC entry 6834 (class 0 OID 0)
-- Dependencies: 270
-- Name: contact_us_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_us_settings_id_seq OWNED BY public.contact_us_settings.id;


--
-- TOC entry 271 (class 1259 OID 647282)
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
-- TOC entry 272 (class 1259 OID 647287)
-- Name: contracting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contracting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contracting_id_seq OWNER TO postgres;

--
-- TOC entry 6835 (class 0 OID 0)
-- Dependencies: 272
-- Name: contracting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contracting_id_seq OWNED BY public.contracting.id;


--
-- TOC entry 273 (class 1259 OID 647288)
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
-- TOC entry 274 (class 1259 OID 647295)
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.country_id_seq OWNER TO postgres;

--
-- TOC entry 6836 (class 0 OID 0)
-- Dependencies: 274
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;


--
-- TOC entry 275 (class 1259 OID 647296)
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
-- TOC entry 276 (class 1259 OID 647306)
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
-- TOC entry 277 (class 1259 OID 647313)
-- Name: coupon_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coupon_brand_id_seq OWNER TO postgres;

--
-- TOC entry 6837 (class 0 OID 0)
-- Dependencies: 277
-- Name: coupon_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_brand_id_seq OWNED BY public.coupon_brand.id;


--
-- TOC entry 278 (class 1259 OID 647314)
-- Name: coupon_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupon_category (
    id bigint NOT NULL,
    coupon_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.coupon_category OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 647319)
-- Name: coupon_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coupon_category_id_seq OWNER TO postgres;

--
-- TOC entry 6838 (class 0 OID 0)
-- Dependencies: 279
-- Name: coupon_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_category_id_seq OWNED BY public.coupon_category.id;


--
-- TOC entry 280 (class 1259 OID 647320)
-- Name: coupon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coupon_id_seq OWNER TO postgres;

--
-- TOC entry 6839 (class 0 OID 0)
-- Dependencies: 280
-- Name: coupon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_id_seq OWNED BY public.coupon.id;


--
-- TOC entry 281 (class 1259 OID 647321)
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
-- TOC entry 282 (class 1259 OID 647327)
-- Name: coupon_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coupon_images_id_seq OWNER TO postgres;

--
-- TOC entry 6840 (class 0 OID 0)
-- Dependencies: 282
-- Name: coupon_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_images_id_seq OWNED BY public.coupon_images.id;


--
-- TOC entry 283 (class 1259 OID 647328)
-- Name: coupon_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupon_products (
    id bigint NOT NULL,
    coupon_id integer DEFAULT 0 NOT NULL,
    product_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.coupon_products OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 647333)
-- Name: coupon_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coupon_products_id_seq OWNER TO postgres;

--
-- TOC entry 6841 (class 0 OID 0)
-- Dependencies: 284
-- Name: coupon_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_products_id_seq OWNED BY public.coupon_products.id;


--
-- TOC entry 285 (class 1259 OID 647334)
-- Name: coupon_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupon_services (
    id bigint NOT NULL,
    coupon_id integer DEFAULT 0 NOT NULL,
    service_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.coupon_services OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 647339)
-- Name: coupon_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coupon_services_id_seq OWNER TO postgres;

--
-- TOC entry 6842 (class 0 OID 0)
-- Dependencies: 286
-- Name: coupon_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_services_id_seq OWNED BY public.coupon_services.id;


--
-- TOC entry 287 (class 1259 OID 647340)
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
-- TOC entry 288 (class 1259 OID 647345)
-- Name: coupon_vendor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_vendor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coupon_vendor_id_seq OWNER TO postgres;

--
-- TOC entry 6843 (class 0 OID 0)
-- Dependencies: 288
-- Name: coupon_vendor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_vendor_id_seq OWNED BY public.coupon_vendor.id;


--
-- TOC entry 289 (class 1259 OID 647346)
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
-- TOC entry 290 (class 1259 OID 647352)
-- Name: coupon_vendor_service_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_vendor_service_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coupon_vendor_service_order_id_seq OWNER TO postgres;

--
-- TOC entry 6844 (class 0 OID 0)
-- Dependencies: 290
-- Name: coupon_vendor_service_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_vendor_service_order_id_seq OWNED BY public.coupon_vendor_service_order.id;


--
-- TOC entry 291 (class 1259 OID 647353)
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
-- TOC entry 292 (class 1259 OID 647364)
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
-- TOC entry 293 (class 1259 OID 647375)
-- Name: coupons_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupons_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coupons_category_id_seq OWNER TO postgres;

--
-- TOC entry 6845 (class 0 OID 0)
-- Dependencies: 293
-- Name: coupons_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupons_category_id_seq OWNED BY public.coupons_category.id;


--
-- TOC entry 294 (class 1259 OID 647376)
-- Name: coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coupons_id_seq OWNER TO postgres;

--
-- TOC entry 6846 (class 0 OID 0)
-- Dependencies: 294
-- Name: coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupons_id_seq OWNED BY public.coupons.id;


--
-- TOC entry 295 (class 1259 OID 647377)
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
-- TOC entry 296 (class 1259 OID 647383)
-- Name: cuisines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cuisines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cuisines_id_seq OWNER TO postgres;

--
-- TOC entry 6847 (class 0 OID 0)
-- Dependencies: 296
-- Name: cuisines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cuisines_id_seq OWNED BY public.cuisines.id;


--
-- TOC entry 297 (class 1259 OID 647384)
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
-- TOC entry 298 (class 1259 OID 647389)
-- Name: currencies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.currencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.currencies_id_seq OWNER TO postgres;

--
-- TOC entry 6848 (class 0 OID 0)
-- Dependencies: 298
-- Name: currencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.currencies_id_seq OWNED BY public.currencies.id;


--
-- TOC entry 299 (class 1259 OID 647390)
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
-- TOC entry 300 (class 1259 OID 647402)
-- Name: custom_banners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.custom_banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.custom_banners_id_seq OWNER TO postgres;

--
-- TOC entry 6849 (class 0 OID 0)
-- Dependencies: 300
-- Name: custom_banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.custom_banners_id_seq OWNED BY public.custom_banners.id;


--
-- TOC entry 301 (class 1259 OID 647403)
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
-- TOC entry 302 (class 1259 OID 647408)
-- Name: designations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.designations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.designations_id_seq OWNER TO postgres;

--
-- TOC entry 6850 (class 0 OID 0)
-- Dependencies: 302
-- Name: designations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.designations_id_seq OWNED BY public.designations.id;


--
-- TOC entry 303 (class 1259 OID 647409)
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
-- TOC entry 304 (class 1259 OID 647414)
-- Name: event_features_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_features_id_seq OWNER TO postgres;

--
-- TOC entry 6851 (class 0 OID 0)
-- Dependencies: 304
-- Name: event_features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_features_id_seq OWNED BY public.event_features.id;


--
-- TOC entry 305 (class 1259 OID 647415)
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
-- TOC entry 306 (class 1259 OID 647421)
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
-- TOC entry 6852 (class 0 OID 0)
-- Dependencies: 306
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 307 (class 1259 OID 647422)
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
-- TOC entry 308 (class 1259 OID 647430)
-- Name: faq_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.faq_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.faq_id_seq OWNER TO postgres;

--
-- TOC entry 6853 (class 0 OID 0)
-- Dependencies: 308
-- Name: faq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faq_id_seq OWNED BY public.faq.id;


--
-- TOC entry 309 (class 1259 OID 647431)
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
-- TOC entry 310 (class 1259 OID 647437)
-- Name: featured_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.featured_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.featured_products_id_seq OWNER TO postgres;

--
-- TOC entry 6854 (class 0 OID 0)
-- Dependencies: 310
-- Name: featured_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.featured_products_id_seq OWNED BY public.featured_products.id;


--
-- TOC entry 311 (class 1259 OID 647438)
-- Name: featured_products_img; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.featured_products_img (
    id bigint NOT NULL,
    featured_product_id integer DEFAULT 0 NOT NULL,
    image character varying(600) NOT NULL
);


ALTER TABLE public.featured_products_img OWNER TO postgres;

--
-- TOC entry 312 (class 1259 OID 647444)
-- Name: featured_products_img_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.featured_products_img_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.featured_products_img_id_seq OWNER TO postgres;

--
-- TOC entry 6855 (class 0 OID 0)
-- Dependencies: 312
-- Name: featured_products_img_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.featured_products_img_id_seq OWNED BY public.featured_products_img.id;


--
-- TOC entry 313 (class 1259 OID 647445)
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
-- TOC entry 314 (class 1259 OID 647450)
-- Name: hair_colors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hair_colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hair_colors_id_seq OWNER TO postgres;

--
-- TOC entry 6856 (class 0 OID 0)
-- Dependencies: 314
-- Name: hair_colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hair_colors_id_seq OWNED BY public.hair_colors.id;


--
-- TOC entry 315 (class 1259 OID 647451)
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
-- TOC entry 316 (class 1259 OID 647459)
-- Name: help_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.help_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.help_id_seq OWNER TO postgres;

--
-- TOC entry 6857 (class 0 OID 0)
-- Dependencies: 316
-- Name: help_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.help_id_seq OWNED BY public.help.id;


--
-- TOC entry 317 (class 1259 OID 647460)
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
-- TOC entry 318 (class 1259 OID 647464)
-- Name: help_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.help_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.help_topics_id_seq OWNER TO postgres;

--
-- TOC entry 6858 (class 0 OID 0)
-- Dependencies: 318
-- Name: help_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.help_topics_id_seq OWNED BY public.help_topics.id;


--
-- TOC entry 319 (class 1259 OID 647465)
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
-- TOC entry 320 (class 1259 OID 647470)
-- Name: home_logos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.home_logos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_logos_id_seq OWNER TO postgres;

--
-- TOC entry 6859 (class 0 OID 0)
-- Dependencies: 320
-- Name: home_logos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_logos_id_seq OWNED BY public.home_logos.id;


--
-- TOC entry 321 (class 1259 OID 647471)
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
-- TOC entry 322 (class 1259 OID 647478)
-- Name: hourly_rate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hourly_rate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hourly_rate_id_seq OWNER TO postgres;

--
-- TOC entry 6860 (class 0 OID 0)
-- Dependencies: 322
-- Name: hourly_rate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hourly_rate_id_seq OWNED BY public.hourly_rate.id;


--
-- TOC entry 323 (class 1259 OID 647479)
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
-- TOC entry 324 (class 1259 OID 647485)
-- Name: industry_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.industry_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.industry_types_id_seq OWNER TO postgres;

--
-- TOC entry 6861 (class 0 OID 0)
-- Dependencies: 324
-- Name: industry_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.industry_types_id_seq OWNED BY public.industry_types.id;


--
-- TOC entry 325 (class 1259 OID 647486)
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
-- TOC entry 326 (class 1259 OID 647491)
-- Name: landing_page_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.landing_page_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.landing_page_settings_id_seq OWNER TO postgres;

--
-- TOC entry 6862 (class 0 OID 0)
-- Dependencies: 326
-- Name: landing_page_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.landing_page_settings_id_seq OWNED BY public.landing_page_settings.id;


--
-- TOC entry 327 (class 1259 OID 647492)
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
-- TOC entry 328 (class 1259 OID 647498)
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.likes_id_seq OWNER TO postgres;

--
-- TOC entry 6863 (class 0 OID 0)
-- Dependencies: 328
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- TOC entry 329 (class 1259 OID 647499)
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
-- TOC entry 330 (class 1259 OID 647506)
-- Name: main_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_category_id_seq OWNER TO postgres;

--
-- TOC entry 6864 (class 0 OID 0)
-- Dependencies: 330
-- Name: main_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_category_id_seq OWNED BY public.main_category.id;


--
-- TOC entry 331 (class 1259 OID 647507)
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
-- TOC entry 332 (class 1259 OID 647512)
-- Name: maintainance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maintainance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.maintainance_id_seq OWNER TO postgres;

--
-- TOC entry 6865 (class 0 OID 0)
-- Dependencies: 332
-- Name: maintainance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maintainance_id_seq OWNED BY public.maintainance.id;


--
-- TOC entry 333 (class 1259 OID 647513)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 334 (class 1259 OID 647516)
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
-- TOC entry 6866 (class 0 OID 0)
-- Dependencies: 334
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 335 (class 1259 OID 647517)
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
-- TOC entry 336 (class 1259 OID 647520)
-- Name: moda_main_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moda_main_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.moda_main_categories_id_seq OWNER TO postgres;

--
-- TOC entry 6867 (class 0 OID 0)
-- Dependencies: 336
-- Name: moda_main_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moda_main_categories_id_seq OWNED BY public.moda_main_categories.id;


--
-- TOC entry 337 (class 1259 OID 647521)
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
-- TOC entry 6868 (class 0 OID 0)
-- Dependencies: 337
-- Name: COLUMN moda_sub_categories.gender; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.moda_sub_categories.gender IS '1.Male,2.female';


--
-- TOC entry 338 (class 1259 OID 647529)
-- Name: moda_sub_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moda_sub_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.moda_sub_categories_id_seq OWNER TO postgres;

--
-- TOC entry 6869 (class 0 OID 0)
-- Dependencies: 338
-- Name: moda_sub_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moda_sub_categories_id_seq OWNED BY public.moda_sub_categories.id;


--
-- TOC entry 339 (class 1259 OID 647530)
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
-- TOC entry 340 (class 1259 OID 647533)
-- Name: my_moda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.my_moda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.my_moda_id_seq OWNER TO postgres;

--
-- TOC entry 6870 (class 0 OID 0)
-- Dependencies: 340
-- Name: my_moda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.my_moda_id_seq OWNED BY public.my_moda.id;


--
-- TOC entry 341 (class 1259 OID 647534)
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
-- TOC entry 342 (class 1259 OID 647537)
-- Name: my_moda_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.my_moda_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.my_moda_items_id_seq OWNER TO postgres;

--
-- TOC entry 6871 (class 0 OID 0)
-- Dependencies: 342
-- Name: my_moda_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.my_moda_items_id_seq OWNED BY public.my_moda_items.id;


--
-- TOC entry 343 (class 1259 OID 647538)
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
-- TOC entry 344 (class 1259 OID 647545)
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
-- TOC entry 6872 (class 0 OID 0)
-- Dependencies: 344
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- TOC entry 345 (class 1259 OID 647546)
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
-- TOC entry 346 (class 1259 OID 647556)
-- Name: order_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_products_id_seq OWNER TO postgres;

--
-- TOC entry 6873 (class 0 OID 0)
-- Dependencies: 346
-- Name: order_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_products_id_seq OWNED BY public.order_products.id;


--
-- TOC entry 347 (class 1259 OID 647557)
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
-- TOC entry 348 (class 1259 OID 647562)
-- Name: order_request_view_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_request_view_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_request_view_id_seq OWNER TO postgres;

--
-- TOC entry 6874 (class 0 OID 0)
-- Dependencies: 348
-- Name: order_request_view_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_request_view_id_seq OWNED BY public.order_request_view.id;


--
-- TOC entry 349 (class 1259 OID 647563)
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
-- TOC entry 350 (class 1259 OID 647568)
-- Name: order_status_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_status_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_status_history_id_seq OWNER TO postgres;

--
-- TOC entry 6875 (class 0 OID 0)
-- Dependencies: 350
-- Name: order_status_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_status_history_id_seq OWNED BY public.order_status_history.id;


--
-- TOC entry 351 (class 1259 OID 647569)
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
-- TOC entry 352 (class 1259 OID 647600)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_order_id_seq OWNER TO postgres;

--
-- TOC entry 6876 (class 0 OID 0)
-- Dependencies: 352
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- TOC entry 353 (class 1259 OID 647601)
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
-- TOC entry 354 (class 1259 OID 647621)
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
-- TOC entry 355 (class 1259 OID 647633)
-- Name: orders_services_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_services_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_services_items_id_seq OWNER TO postgres;

--
-- TOC entry 6877 (class 0 OID 0)
-- Dependencies: 355
-- Name: orders_services_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_services_items_id_seq OWNED BY public.orders_services_items.id;


--
-- TOC entry 356 (class 1259 OID 647634)
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
-- TOC entry 357 (class 1259 OID 647639)
-- Name: orders_services_mute_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_services_mute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_services_mute_id_seq OWNER TO postgres;

--
-- TOC entry 6878 (class 0 OID 0)
-- Dependencies: 357
-- Name: orders_services_mute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_services_mute_id_seq OWNED BY public.orders_services_mute.id;


--
-- TOC entry 358 (class 1259 OID 647640)
-- Name: orders_services_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_services_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_services_order_id_seq OWNER TO postgres;

--
-- TOC entry 6879 (class 0 OID 0)
-- Dependencies: 358
-- Name: orders_services_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_services_order_id_seq OWNED BY public.orders_services.order_id;


--
-- TOC entry 359 (class 1259 OID 647641)
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
-- TOC entry 360 (class 1259 OID 647647)
-- Name: orders_services_rejected_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_services_rejected_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_services_rejected_id_seq OWNER TO postgres;

--
-- TOC entry 6880 (class 0 OID 0)
-- Dependencies: 360
-- Name: orders_services_rejected_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_services_rejected_id_seq OWNED BY public.orders_services_rejected.id;


--
-- TOC entry 361 (class 1259 OID 647648)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- TOC entry 362 (class 1259 OID 647653)
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
-- TOC entry 363 (class 1259 OID 647662)
-- Name: payment_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_report_id_seq OWNER TO postgres;

--
-- TOC entry 6881 (class 0 OID 0)
-- Dependencies: 363
-- Name: payment_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_report_id_seq OWNED BY public.payment_report.id;


--
-- TOC entry 364 (class 1259 OID 647663)
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
-- TOC entry 365 (class 1259 OID 647668)
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
-- TOC entry 6882 (class 0 OID 0)
-- Dependencies: 365
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 366 (class 1259 OID 647669)
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
-- TOC entry 367 (class 1259 OID 647675)
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
-- TOC entry 6883 (class 0 OID 0)
-- Dependencies: 367
-- Name: post_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_comments_id_seq OWNED BY public.post_comments.id;


--
-- TOC entry 368 (class 1259 OID 647676)
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
-- TOC entry 369 (class 1259 OID 647679)
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
-- TOC entry 6884 (class 0 OID 0)
-- Dependencies: 369
-- Name: post_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_likes_id_seq OWNED BY public.post_likes.id;


--
-- TOC entry 370 (class 1259 OID 647680)
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
-- TOC entry 371 (class 1259 OID 647683)
-- Name: post_saves_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_saves_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_saves_id_seq OWNER TO postgres;

--
-- TOC entry 6885 (class 0 OID 0)
-- Dependencies: 371
-- Name: post_saves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_saves_id_seq OWNED BY public.post_saves.id;


--
-- TOC entry 372 (class 1259 OID 647684)
-- Name: post_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_users (
    id bigint NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.post_users OWNER TO postgres;

--
-- TOC entry 373 (class 1259 OID 647687)
-- Name: post_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_users_id_seq OWNER TO postgres;

--
-- TOC entry 6886 (class 0 OID 0)
-- Dependencies: 373
-- Name: post_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_users_id_seq OWNED BY public.post_users.id;


--
-- TOC entry 374 (class 1259 OID 647688)
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
-- TOC entry 375 (class 1259 OID 647696)
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
-- TOC entry 6887 (class 0 OID 0)
-- Dependencies: 375
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- TOC entry 376 (class 1259 OID 647697)
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
-- TOC entry 377 (class 1259 OID 647736)
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
-- TOC entry 378 (class 1259 OID 647743)
-- Name: product_attribute_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_attribute_attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_attribute_attribute_id_seq OWNER TO postgres;

--
-- TOC entry 6888 (class 0 OID 0)
-- Dependencies: 378
-- Name: product_attribute_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_attribute_attribute_id_seq OWNED BY public.product_attribute.attribute_id;


--
-- TOC entry 379 (class 1259 OID 647744)
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
-- TOC entry 380 (class 1259 OID 647753)
-- Name: product_attribute_values_attribute_values_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_attribute_values_attribute_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_attribute_values_attribute_values_id_seq OWNER TO postgres;

--
-- TOC entry 6889 (class 0 OID 0)
-- Dependencies: 380
-- Name: product_attribute_values_attribute_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_attribute_values_attribute_values_id_seq OWNED BY public.product_attribute_values.attribute_values_id;


--
-- TOC entry 381 (class 1259 OID 647754)
-- Name: product_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_category (
    product_category_id bigint NOT NULL,
    product_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.product_category OWNER TO postgres;

--
-- TOC entry 382 (class 1259 OID 647759)
-- Name: product_category_product_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_category_product_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_category_product_category_id_seq OWNER TO postgres;

--
-- TOC entry 6890 (class 0 OID 0)
-- Dependencies: 382
-- Name: product_category_product_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_category_product_category_id_seq OWNED BY public.product_category.product_category_id;


--
-- TOC entry 383 (class 1259 OID 647760)
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
-- TOC entry 384 (class 1259 OID 647765)
-- Name: product_cuisines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_cuisines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_cuisines_id_seq OWNER TO postgres;

--
-- TOC entry 6891 (class 0 OID 0)
-- Dependencies: 384
-- Name: product_cuisines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_cuisines_id_seq OWNED BY public.product_cuisines.id;


--
-- TOC entry 385 (class 1259 OID 647766)
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
-- TOC entry 386 (class 1259 OID 647772)
-- Name: product_docs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_docs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_docs_id_seq OWNER TO postgres;

--
-- TOC entry 6892 (class 0 OID 0)
-- Dependencies: 386
-- Name: product_docs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_docs_id_seq OWNED BY public.product_docs.id;


--
-- TOC entry 387 (class 1259 OID 647773)
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
-- TOC entry 388 (class 1259 OID 647778)
-- Name: product_features_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_features_id_seq OWNER TO postgres;

--
-- TOC entry 6893 (class 0 OID 0)
-- Dependencies: 388
-- Name: product_features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_features_id_seq OWNED BY public.product_features.id;


--
-- TOC entry 389 (class 1259 OID 647779)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 6894 (class 0 OID 0)
-- Dependencies: 389
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 390 (class 1259 OID 647780)
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
-- TOC entry 391 (class 1259 OID 647785)
-- Name: product_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_images_id_seq OWNER TO postgres;

--
-- TOC entry 6895 (class 0 OID 0)
-- Dependencies: 391
-- Name: product_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_images_id_seq OWNED BY public.product_images.id;


--
-- TOC entry 392 (class 1259 OID 647786)
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
-- TOC entry 393 (class 1259 OID 647792)
-- Name: product_items_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_items_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_items_item_id_seq OWNER TO postgres;

--
-- TOC entry 6896 (class 0 OID 0)
-- Dependencies: 393
-- Name: product_items_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_items_item_id_seq OWNED BY public.product_items.item_id;


--
-- TOC entry 394 (class 1259 OID 647793)
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
-- TOC entry 395 (class 1259 OID 647796)
-- Name: product_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_likes_id_seq OWNER TO postgres;

--
-- TOC entry 6897 (class 0 OID 0)
-- Dependencies: 395
-- Name: product_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_likes_id_seq OWNED BY public.product_likes.id;


--
-- TOC entry 396 (class 1259 OID 647797)
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
-- TOC entry 397 (class 1259 OID 647804)
-- Name: product_master_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_master_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_master_id_seq OWNER TO postgres;

--
-- TOC entry 6898 (class 0 OID 0)
-- Dependencies: 397
-- Name: product_master_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_master_id_seq OWNED BY public.product_master.id;


--
-- TOC entry 398 (class 1259 OID 647805)
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
-- TOC entry 399 (class 1259 OID 647814)
-- Name: product_master_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_master_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_master_request_id_seq OWNER TO postgres;

--
-- TOC entry 6899 (class 0 OID 0)
-- Dependencies: 399
-- Name: product_master_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_master_request_id_seq OWNED BY public.product_master_request.id;


--
-- TOC entry 400 (class 1259 OID 647815)
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
-- TOC entry 401 (class 1259 OID 647820)
-- Name: product_product_feature_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_product_feature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_product_feature_id_seq OWNER TO postgres;

--
-- TOC entry 6900 (class 0 OID 0)
-- Dependencies: 401
-- Name: product_product_feature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_product_feature_id_seq OWNED BY public.product_product_feature.id;


--
-- TOC entry 402 (class 1259 OID 647821)
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
-- TOC entry 403 (class 1259 OID 647834)
-- Name: product_selected_attribute_list_product_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_selected_attribute_list_product_attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_selected_attribute_list_product_attribute_id_seq OWNER TO postgres;

--
-- TOC entry 6901 (class 0 OID 0)
-- Dependencies: 403
-- Name: product_selected_attribute_list_product_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_selected_attribute_list_product_attribute_id_seq OWNED BY public.product_selected_attribute_list.product_attribute_id;


--
-- TOC entry 404 (class 1259 OID 647835)
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
-- TOC entry 405 (class 1259 OID 647841)
-- Name: product_selected_attributes_product_selected_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_selected_attributes_product_selected_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_selected_attributes_product_selected_attributes_id_seq OWNER TO postgres;

--
-- TOC entry 6902 (class 0 OID 0)
-- Dependencies: 405
-- Name: product_selected_attributes_product_selected_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_selected_attributes_product_selected_attributes_id_seq OWNED BY public.product_selected_attributes.product_selected_attributes_id;


--
-- TOC entry 406 (class 1259 OID 647842)
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
-- TOC entry 407 (class 1259 OID 647849)
-- Name: product_specifications_prod_spec_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_specifications_prod_spec_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_specifications_prod_spec_id_seq OWNER TO postgres;

--
-- TOC entry 6903 (class 0 OID 0)
-- Dependencies: 407
-- Name: product_specifications_prod_spec_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_specifications_prod_spec_id_seq OWNED BY public.product_specifications.prod_spec_id;


--
-- TOC entry 408 (class 1259 OID 647850)
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
-- TOC entry 409 (class 1259 OID 647857)
-- Name: product_temp_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_temp_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_temp_image_id_seq OWNER TO postgres;

--
-- TOC entry 6904 (class 0 OID 0)
-- Dependencies: 409
-- Name: product_temp_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_temp_image_id_seq OWNED BY public.product_temp_image.id;


--
-- TOC entry 410 (class 1259 OID 647858)
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
-- TOC entry 411 (class 1259 OID 647865)
-- Name: product_variations_product_variations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_variations_product_variations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_variations_product_variations_id_seq OWNER TO postgres;

--
-- TOC entry 6905 (class 0 OID 0)
-- Dependencies: 411
-- Name: product_variations_product_variations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_variations_product_variations_id_seq OWNED BY public.product_variations.product_variations_id;


--
-- TOC entry 412 (class 1259 OID 647866)
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
-- TOC entry 413 (class 1259 OID 647879)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 6906 (class 0 OID 0)
-- Dependencies: 413
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 414 (class 1259 OID 647880)
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
-- TOC entry 415 (class 1259 OID 647893)
-- Name: promotion_banners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promotion_banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promotion_banners_id_seq OWNER TO postgres;

--
-- TOC entry 6907 (class 0 OID 0)
-- Dependencies: 415
-- Name: promotion_banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promotion_banners_id_seq OWNED BY public.promotion_banners.id;


--
-- TOC entry 416 (class 1259 OID 647894)
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
-- TOC entry 417 (class 1259 OID 647906)
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ratings_id_seq OWNER TO postgres;

--
-- TOC entry 6908 (class 0 OID 0)
-- Dependencies: 417
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;


--
-- TOC entry 418 (class 1259 OID 647907)
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
-- TOC entry 419 (class 1259 OID 647914)
-- Name: ratings_reply_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ratings_reply_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ratings_reply_id_seq OWNER TO postgres;

--
-- TOC entry 6909 (class 0 OID 0)
-- Dependencies: 419
-- Name: ratings_reply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ratings_reply_id_seq OWNED BY public.ratings_reply.id;


--
-- TOC entry 420 (class 1259 OID 647915)
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
-- TOC entry 421 (class 1259 OID 647925)
-- Name: ref_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ref_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ref_history_id_seq OWNER TO postgres;

--
-- TOC entry 6910 (class 0 OID 0)
-- Dependencies: 421
-- Name: ref_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ref_history_id_seq OWNED BY public.ref_history.id;


--
-- TOC entry 422 (class 1259 OID 647926)
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
-- TOC entry 6911 (class 0 OID 0)
-- Dependencies: 422
-- Name: COLUMN service.service_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.service_type IS '0 for one day, 1 for week, 2 for month';


--
-- TOC entry 6912 (class 0 OID 0)
-- Dependencies: 422
-- Name: COLUMN service.contract_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.contract_type IS '0 for fresh, 1 for Extention';


--
-- TOC entry 423 (class 1259 OID 647939)
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
-- TOC entry 424 (class 1259 OID 647943)
-- Name: service_assigned_vendors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_assigned_vendors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.service_assigned_vendors_id_seq OWNER TO postgres;

--
-- TOC entry 6913 (class 0 OID 0)
-- Dependencies: 424
-- Name: service_assigned_vendors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_assigned_vendors_id_seq OWNED BY public.service_assigned_vendors.id;


--
-- TOC entry 425 (class 1259 OID 647944)
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
-- TOC entry 426 (class 1259 OID 647953)
-- Name: service_bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.service_bookings_id_seq OWNER TO postgres;

--
-- TOC entry 6914 (class 0 OID 0)
-- Dependencies: 426
-- Name: service_bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_bookings_id_seq OWNED BY public.service_bookings.id;


--
-- TOC entry 427 (class 1259 OID 647954)
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
-- TOC entry 428 (class 1259 OID 647965)
-- Name: service_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.service_category_id_seq OWNER TO postgres;

--
-- TOC entry 6915 (class 0 OID 0)
-- Dependencies: 428
-- Name: service_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_category_id_seq OWNED BY public.service_category.id;


--
-- TOC entry 429 (class 1259 OID 647966)
-- Name: service_category_selected; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_category_selected (
    id bigint NOT NULL,
    service_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.service_category_selected OWNER TO postgres;

--
-- TOC entry 430 (class 1259 OID 647971)
-- Name: service_category_selected_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_category_selected_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.service_category_selected_id_seq OWNER TO postgres;

--
-- TOC entry 6916 (class 0 OID 0)
-- Dependencies: 430
-- Name: service_category_selected_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_category_selected_id_seq OWNED BY public.service_category_selected.id;


--
-- TOC entry 431 (class 1259 OID 647972)
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
-- TOC entry 432 (class 1259 OID 647977)
-- Name: service_event_feature_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_event_feature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.service_event_feature_id_seq OWNER TO postgres;

--
-- TOC entry 6917 (class 0 OID 0)
-- Dependencies: 432
-- Name: service_event_feature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_event_feature_id_seq OWNED BY public.service_event_feature.id;


--
-- TOC entry 433 (class 1259 OID 647978)
-- Name: service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.service_id_seq OWNER TO postgres;

--
-- TOC entry 6918 (class 0 OID 0)
-- Dependencies: 433
-- Name: service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_id_seq OWNED BY public.service.id;


--
-- TOC entry 434 (class 1259 OID 647979)
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
-- TOC entry 435 (class 1259 OID 647982)
-- Name: service_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.service_images_id_seq OWNER TO postgres;

--
-- TOC entry 6919 (class 0 OID 0)
-- Dependencies: 435
-- Name: service_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_images_id_seq OWNED BY public.service_images.id;


--
-- TOC entry 436 (class 1259 OID 647983)
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
-- TOC entry 437 (class 1259 OID 647988)
-- Name: service_include_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_include_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.service_include_id_seq OWNER TO postgres;

--
-- TOC entry 6920 (class 0 OID 0)
-- Dependencies: 437
-- Name: service_include_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_include_id_seq OWNED BY public.service_include.id;


--
-- TOC entry 438 (class 1259 OID 647989)
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
-- TOC entry 439 (class 1259 OID 647995)
-- Name: service_order_status_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_order_status_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.service_order_status_history_id_seq OWNER TO postgres;

--
-- TOC entry 6921 (class 0 OID 0)
-- Dependencies: 439
-- Name: service_order_status_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_order_status_history_id_seq OWNED BY public.service_order_status_history.id;


--
-- TOC entry 440 (class 1259 OID 647996)
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
-- TOC entry 441 (class 1259 OID 648004)
-- Name: service_timings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_timings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.service_timings_id_seq OWNER TO postgres;

--
-- TOC entry 6922 (class 0 OID 0)
-- Dependencies: 441
-- Name: service_timings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_timings_id_seq OWNED BY public.service_timings.id;


--
-- TOC entry 442 (class 1259 OID 648005)
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
-- TOC entry 443 (class 1259 OID 648010)
-- Name: service_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.service_type_id_seq OWNER TO postgres;

--
-- TOC entry 6923 (class 0 OID 0)
-- Dependencies: 443
-- Name: service_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_type_id_seq OWNED BY public.service_type.id;


--
-- TOC entry 444 (class 1259 OID 648011)
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
-- TOC entry 445 (class 1259 OID 648017)
-- Name: service_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.service_types_id_seq OWNER TO postgres;

--
-- TOC entry 6924 (class 0 OID 0)
-- Dependencies: 445
-- Name: service_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_types_id_seq OWNED BY public.service_types.id;


--
-- TOC entry 446 (class 1259 OID 648018)
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
-- TOC entry 447 (class 1259 OID 648025)
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
-- TOC entry 6925 (class 0 OID 0)
-- Dependencies: 447
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- TOC entry 448 (class 1259 OID 648026)
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
-- TOC entry 449 (class 1259 OID 648031)
-- Name: skin_colors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skin_colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.skin_colors_id_seq OWNER TO postgres;

--
-- TOC entry 6926 (class 0 OID 0)
-- Dependencies: 449
-- Name: skin_colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skin_colors_id_seq OWNED BY public.skin_colors.id;


--
-- TOC entry 450 (class 1259 OID 648032)
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
-- TOC entry 451 (class 1259 OID 648037)
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.states_id_seq OWNER TO postgres;

--
-- TOC entry 6927 (class 0 OID 0)
-- Dependencies: 451
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- TOC entry 452 (class 1259 OID 648038)
-- Name: store_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_images (
    id bigint NOT NULL,
    image character varying(900),
    store_id bigint NOT NULL
);


ALTER TABLE public.store_images OWNER TO postgres;

--
-- TOC entry 453 (class 1259 OID 648043)
-- Name: store_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.store_images_id_seq OWNER TO postgres;

--
-- TOC entry 6928 (class 0 OID 0)
-- Dependencies: 453
-- Name: store_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_images_id_seq OWNED BY public.store_images.id;


--
-- TOC entry 454 (class 1259 OID 648044)
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
-- TOC entry 455 (class 1259 OID 648047)
-- Name: store_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.store_likes_id_seq OWNER TO postgres;

--
-- TOC entry 6929 (class 0 OID 0)
-- Dependencies: 455
-- Name: store_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_likes_id_seq OWNED BY public.store_likes.id;


--
-- TOC entry 456 (class 1259 OID 648048)
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
-- TOC entry 457 (class 1259 OID 648053)
-- Name: store_managers_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_managers_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.store_managers_types_id_seq OWNER TO postgres;

--
-- TOC entry 6930 (class 0 OID 0)
-- Dependencies: 457
-- Name: store_managers_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_managers_types_id_seq OWNED BY public.store_managers_types.id;


--
-- TOC entry 458 (class 1259 OID 648054)
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
-- TOC entry 459 (class 1259 OID 648061)
-- Name: store_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.store_type_id_seq OWNER TO postgres;

--
-- TOC entry 6931 (class 0 OID 0)
-- Dependencies: 459
-- Name: store_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_type_id_seq OWNED BY public.store_type.id;


--
-- TOC entry 460 (class 1259 OID 648062)
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
-- TOC entry 461 (class 1259 OID 648071)
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stores_id_seq OWNER TO postgres;

--
-- TOC entry 6932 (class 0 OID 0)
-- Dependencies: 461
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stores_id_seq OWNED BY public.stores.id;


--
-- TOC entry 462 (class 1259 OID 648072)
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
-- TOC entry 463 (class 1259 OID 648075)
-- Name: subscribers_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscribers_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subscribers_emails_id_seq OWNER TO postgres;

--
-- TOC entry 6933 (class 0 OID 0)
-- Dependencies: 463
-- Name: subscribers_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscribers_emails_id_seq OWNED BY public.subscribers_emails.id;


--
-- TOC entry 464 (class 1259 OID 648076)
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
-- TOC entry 465 (class 1259 OID 648085)
-- Name: temp_order_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_order_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.temp_order_products_id_seq OWNER TO postgres;

--
-- TOC entry 6934 (class 0 OID 0)
-- Dependencies: 465
-- Name: temp_order_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_order_products_id_seq OWNED BY public.temp_order_products.id;


--
-- TOC entry 466 (class 1259 OID 648086)
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
-- TOC entry 467 (class 1259 OID 648109)
-- Name: temp_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.temp_orders_id_seq OWNER TO postgres;

--
-- TOC entry 6935 (class 0 OID 0)
-- Dependencies: 467
-- Name: temp_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_orders_id_seq OWNED BY public.temp_orders.id;


--
-- TOC entry 468 (class 1259 OID 648110)
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
-- TOC entry 469 (class 1259 OID 648120)
-- Name: temp_service_order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_service_order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.temp_service_order_items_id_seq OWNER TO postgres;

--
-- TOC entry 6936 (class 0 OID 0)
-- Dependencies: 469
-- Name: temp_service_order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_service_order_items_id_seq OWNED BY public.temp_service_order_items.id;


--
-- TOC entry 470 (class 1259 OID 648121)
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
-- TOC entry 471 (class 1259 OID 648132)
-- Name: temp_service_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_service_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.temp_service_orders_id_seq OWNER TO postgres;

--
-- TOC entry 6937 (class 0 OID 0)
-- Dependencies: 471
-- Name: temp_service_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_service_orders_id_seq OWNED BY public.temp_service_orders.id;


--
-- TOC entry 472 (class 1259 OID 648133)
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
-- TOC entry 473 (class 1259 OID 648136)
-- Name: temp_user_account_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_user_account_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.temp_user_account_types_id_seq OWNER TO postgres;

--
-- TOC entry 6938 (class 0 OID 0)
-- Dependencies: 473
-- Name: temp_user_account_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_user_account_types_id_seq OWNED BY public.temp_user_account_types.id;


--
-- TOC entry 474 (class 1259 OID 648137)
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
-- TOC entry 475 (class 1259 OID 648145)
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
-- TOC entry 6939 (class 0 OID 0)
-- Dependencies: 475
-- Name: temp_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_users_id_seq OWNED BY public.temp_users.id;


--
-- TOC entry 476 (class 1259 OID 648146)
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
-- TOC entry 477 (class 1259 OID 648154)
-- Name: tesimonial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tesimonial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tesimonial_id_seq OWNER TO postgres;

--
-- TOC entry 6940 (class 0 OID 0)
-- Dependencies: 477
-- Name: tesimonial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tesimonial_id_seq OWNED BY public.tesimonial.id;


--
-- TOC entry 478 (class 1259 OID 648155)
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
-- TOC entry 479 (class 1259 OID 648161)
-- Name: transport_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transport_id_seq OWNER TO postgres;

--
-- TOC entry 6941 (class 0 OID 0)
-- Dependencies: 479
-- Name: transport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transport_id_seq OWNED BY public.transport.id;


--
-- TOC entry 480 (class 1259 OID 648162)
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
-- TOC entry 481 (class 1259 OID 648165)
-- Name: user_account_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_account_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_account_types_id_seq OWNER TO postgres;

--
-- TOC entry 6942 (class 0 OID 0)
-- Dependencies: 481
-- Name: user_account_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_account_types_id_seq OWNED BY public.user_account_types.id;


--
-- TOC entry 482 (class 1259 OID 648166)
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
-- TOC entry 483 (class 1259 OID 648180)
-- Name: user_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_address_id_seq OWNER TO postgres;

--
-- TOC entry 6943 (class 0 OID 0)
-- Dependencies: 483
-- Name: user_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_address_id_seq OWNED BY public.user_address.id;


--
-- TOC entry 484 (class 1259 OID 648181)
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
-- TOC entry 485 (class 1259 OID 648184)
-- Name: user_follows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_follows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_follows_id_seq OWNER TO postgres;

--
-- TOC entry 6944 (class 0 OID 0)
-- Dependencies: 485
-- Name: user_follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_follows_id_seq OWNED BY public.user_follows.id;


--
-- TOC entry 486 (class 1259 OID 648185)
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
-- TOC entry 487 (class 1259 OID 648191)
-- Name: user_privileges_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_privileges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_privileges_id_seq OWNER TO postgres;

--
-- TOC entry 6945 (class 0 OID 0)
-- Dependencies: 487
-- Name: user_privileges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_privileges_id_seq OWNED BY public.user_privileges.id;


--
-- TOC entry 488 (class 1259 OID 648192)
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
-- TOC entry 489 (class 1259 OID 648222)
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
-- TOC entry 6946 (class 0 OID 0)
-- Dependencies: 489
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 490 (class 1259 OID 648223)
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
-- TOC entry 491 (class 1259 OID 648226)
-- Name: users_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_role_id_seq OWNER TO postgres;

--
-- TOC entry 6947 (class 0 OID 0)
-- Dependencies: 491
-- Name: users_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_role_id_seq OWNED BY public.users_role.id;


--
-- TOC entry 492 (class 1259 OID 648227)
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
-- TOC entry 493 (class 1259 OID 648232)
-- Name: vendor_cuisines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_cuisines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendor_cuisines_id_seq OWNER TO postgres;

--
-- TOC entry 6948 (class 0 OID 0)
-- Dependencies: 493
-- Name: vendor_cuisines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_cuisines_id_seq OWNED BY public.vendor_cuisines.id;


--
-- TOC entry 494 (class 1259 OID 648233)
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
-- TOC entry 495 (class 1259 OID 648256)
-- Name: vendor_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendor_details_id_seq OWNER TO postgres;

--
-- TOC entry 6949 (class 0 OID 0)
-- Dependencies: 495
-- Name: vendor_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_details_id_seq OWNED BY public.vendor_details.id;


--
-- TOC entry 496 (class 1259 OID 648257)
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
-- TOC entry 497 (class 1259 OID 648262)
-- Name: vendor_followers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_followers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendor_followers_id_seq OWNER TO postgres;

--
-- TOC entry 6950 (class 0 OID 0)
-- Dependencies: 497
-- Name: vendor_followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_followers_id_seq OWNED BY public.vendor_followers.id;


--
-- TOC entry 498 (class 1259 OID 648263)
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
-- TOC entry 499 (class 1259 OID 648269)
-- Name: vendor_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendor_locations_id_seq OWNER TO postgres;

--
-- TOC entry 6951 (class 0 OID 0)
-- Dependencies: 499
-- Name: vendor_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_locations_id_seq OWNED BY public.vendor_locations.id;


--
-- TOC entry 500 (class 1259 OID 648270)
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
-- TOC entry 501 (class 1259 OID 648275)
-- Name: vendor_menu_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_menu_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendor_menu_images_id_seq OWNER TO postgres;

--
-- TOC entry 6952 (class 0 OID 0)
-- Dependencies: 501
-- Name: vendor_menu_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_menu_images_id_seq OWNED BY public.vendor_menu_images.id;


--
-- TOC entry 502 (class 1259 OID 648276)
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
-- TOC entry 503 (class 1259 OID 648290)
-- Name: vendor_service_timings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_service_timings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendor_service_timings_id_seq OWNER TO postgres;

--
-- TOC entry 6953 (class 0 OID 0)
-- Dependencies: 503
-- Name: vendor_service_timings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_service_timings_id_seq OWNED BY public.vendor_service_timings.id;


--
-- TOC entry 504 (class 1259 OID 648291)
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
-- TOC entry 505 (class 1259 OID 648294)
-- Name: vendor_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendor_services_id_seq OWNER TO postgres;

--
-- TOC entry 6954 (class 0 OID 0)
-- Dependencies: 505
-- Name: vendor_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_services_id_seq OWNED BY public.vendor_services.id;


--
-- TOC entry 506 (class 1259 OID 648295)
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
-- TOC entry 507 (class 1259 OID 648301)
-- Name: vendor_timings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_timings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendor_timings_id_seq OWNER TO postgres;

--
-- TOC entry 6955 (class 0 OID 0)
-- Dependencies: 507
-- Name: vendor_timings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_timings_id_seq OWNED BY public.vendor_timings.id;


--
-- TOC entry 508 (class 1259 OID 648302)
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
-- TOC entry 509 (class 1259 OID 648309)
-- Name: wallet_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wallet_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wallet_histories_id_seq OWNER TO postgres;

--
-- TOC entry 6956 (class 0 OID 0)
-- Dependencies: 509
-- Name: wallet_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallet_histories_id_seq OWNED BY public.wallet_histories.id;


--
-- TOC entry 510 (class 1259 OID 648310)
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
-- TOC entry 511 (class 1259 OID 648317)
-- Name: wallet_payment_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wallet_payment_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wallet_payment_report_id_seq OWNER TO postgres;

--
-- TOC entry 6957 (class 0 OID 0)
-- Dependencies: 511
-- Name: wallet_payment_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallet_payment_report_id_seq OWNED BY public.wallet_payment_report.id;


--
-- TOC entry 512 (class 1259 OID 648318)
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
    updated_at timestamp(0) without time zone,
    heading character varying(255)
);


ALTER TABLE public.web_banners OWNER TO postgres;

--
-- TOC entry 513 (class 1259 OID 648325)
-- Name: web_banners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.web_banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.web_banners_id_seq OWNER TO postgres;

--
-- TOC entry 6958 (class 0 OID 0)
-- Dependencies: 513
-- Name: web_banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.web_banners_id_seq OWNED BY public.web_banners.id;


--
-- TOC entry 514 (class 1259 OID 648326)
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
-- TOC entry 515 (class 1259 OID 648329)
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.websockets_statistics_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.websockets_statistics_entries_id_seq OWNER TO postgres;

--
-- TOC entry 6959 (class 0 OID 0)
-- Dependencies: 515
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.websockets_statistics_entries_id_seq OWNED BY public.websockets_statistics_entries.id;


--
-- TOC entry 516 (class 1259 OID 648330)
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
-- TOC entry 517 (class 1259 OID 648333)
-- Name: wishlists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wishlists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wishlists_id_seq OWNER TO postgres;

--
-- TOC entry 6960 (class 0 OID 0)
-- Dependencies: 517
-- Name: wishlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wishlists_id_seq OWNED BY public.wishlists.id;


--
-- TOC entry 5388 (class 2604 OID 648334)
-- Name: aboutus_page_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aboutus_page_settings ALTER COLUMN id SET DEFAULT nextval('public.aboutus_page_settings_id_seq'::regclass);


--
-- TOC entry 5389 (class 2604 OID 648335)
-- Name: account_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_type ALTER COLUMN id SET DEFAULT nextval('public.account_type_id_seq'::regclass);


--
-- TOC entry 5393 (class 2604 OID 648336)
-- Name: activity_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_type ALTER COLUMN id SET DEFAULT nextval('public.activity_type_id_seq'::regclass);


--
-- TOC entry 5398 (class 2604 OID 648337)
-- Name: admin_designation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_designation ALTER COLUMN id SET DEFAULT nextval('public.admin_designation_id_seq'::regclass);


--
-- TOC entry 5400 (class 2604 OID 648338)
-- Name: amount_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amount_type ALTER COLUMN id SET DEFAULT nextval('public.amount_type_id_seq'::regclass);


--
-- TOC entry 5401 (class 2604 OID 648339)
-- Name: app_banners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_banners ALTER COLUMN id SET DEFAULT nextval('public.app_banners_id_seq'::regclass);


--
-- TOC entry 5412 (class 2604 OID 648340)
-- Name: app_home_sections id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_home_sections ALTER COLUMN id SET DEFAULT nextval('public.app_home_sections_id_seq'::regclass);


--
-- TOC entry 5416 (class 2604 OID 648341)
-- Name: area id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area ALTER COLUMN id SET DEFAULT nextval('public.area_id_seq'::regclass);


--
-- TOC entry 5420 (class 2604 OID 648342)
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- TOC entry 5422 (class 2604 OID 648343)
-- Name: attribute_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_type ALTER COLUMN id SET DEFAULT nextval('public.attribute_type_id_seq'::regclass);


--
-- TOC entry 5424 (class 2604 OID 648344)
-- Name: attribute_values id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_values ALTER COLUMN id SET DEFAULT nextval('public.attribute_values_id_seq'::regclass);


--
-- TOC entry 5427 (class 2604 OID 648345)
-- Name: attribute_values_request id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_values_request ALTER COLUMN id SET DEFAULT nextval('public.attribute_values_request_id_seq'::regclass);


--
-- TOC entry 5429 (class 2604 OID 648346)
-- Name: attributes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attributes ALTER COLUMN id SET DEFAULT nextval('public.attributes_id_seq'::regclass);


--
-- TOC entry 5435 (class 2604 OID 648347)
-- Name: bank id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank ALTER COLUMN id SET DEFAULT nextval('public.bank_id_seq'::regclass);


--
-- TOC entry 5436 (class 2604 OID 648348)
-- Name: bank_code_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_code_types ALTER COLUMN id SET DEFAULT nextval('public.bank_code_types_id_seq'::regclass);


--
-- TOC entry 5440 (class 2604 OID 648349)
-- Name: bank_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_details ALTER COLUMN id SET DEFAULT nextval('public.bank_details_id_seq'::regclass);


--
-- TOC entry 5443 (class 2604 OID 648350)
-- Name: blogs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq'::regclass);


--
-- TOC entry 5446 (class 2604 OID 648351)
-- Name: brand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand ALTER COLUMN id SET DEFAULT nextval('public.brand_id_seq'::regclass);


--
-- TOC entry 5450 (class 2604 OID 648352)
-- Name: building_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.building_type ALTER COLUMN id SET DEFAULT nextval('public.building_type_id_seq'::regclass);


--
-- TOC entry 5453 (class 2604 OID 648353)
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);


--
-- TOC entry 5454 (class 2604 OID 648354)
-- Name: cart_service id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_service ALTER COLUMN id SET DEFAULT nextval('public.cart_service_id_seq'::regclass);


--
-- TOC entry 5459 (class 2604 OID 648355)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 5465 (class 2604 OID 648356)
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- TOC entry 5468 (class 2604 OID 648357)
-- Name: cleaning_services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cleaning_services ALTER COLUMN id SET DEFAULT nextval('public.cleaning_services_id_seq'::regclass);


--
-- TOC entry 5469 (class 2604 OID 648358)
-- Name: comment_likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_likes ALTER COLUMN id SET DEFAULT nextval('public.comment_likes_id_seq'::regclass);


--
-- TOC entry 5470 (class 2604 OID 648359)
-- Name: comment_taged_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_taged_users ALTER COLUMN id SET DEFAULT nextval('public.comment_taged_users_id_seq'::regclass);


--
-- TOC entry 5471 (class 2604 OID 648360)
-- Name: contact_us id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us ALTER COLUMN id SET DEFAULT nextval('public.contact_us_id_seq'::regclass);


--
-- TOC entry 5472 (class 2604 OID 648361)
-- Name: contact_us_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us_settings ALTER COLUMN id SET DEFAULT nextval('public.contact_us_settings_id_seq'::regclass);


--
-- TOC entry 5476 (class 2604 OID 648362)
-- Name: contracting id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracting ALTER COLUMN id SET DEFAULT nextval('public.contracting_id_seq'::regclass);


--
-- TOC entry 5477 (class 2604 OID 648363)
-- Name: country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- TOC entry 5480 (class 2604 OID 648364)
-- Name: coupon id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon ALTER COLUMN id SET DEFAULT nextval('public.coupon_id_seq'::regclass);


--
-- TOC entry 5486 (class 2604 OID 648365)
-- Name: coupon_brand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_brand ALTER COLUMN id SET DEFAULT nextval('public.coupon_brand_id_seq'::regclass);


--
-- TOC entry 5489 (class 2604 OID 648366)
-- Name: coupon_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_category ALTER COLUMN id SET DEFAULT nextval('public.coupon_category_id_seq'::regclass);


--
-- TOC entry 5492 (class 2604 OID 648367)
-- Name: coupon_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_images ALTER COLUMN id SET DEFAULT nextval('public.coupon_images_id_seq'::regclass);


--
-- TOC entry 5494 (class 2604 OID 648368)
-- Name: coupon_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_products ALTER COLUMN id SET DEFAULT nextval('public.coupon_products_id_seq'::regclass);


--
-- TOC entry 5497 (class 2604 OID 648369)
-- Name: coupon_services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_services ALTER COLUMN id SET DEFAULT nextval('public.coupon_services_id_seq'::regclass);


--
-- TOC entry 5500 (class 2604 OID 648370)
-- Name: coupon_vendor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_vendor ALTER COLUMN id SET DEFAULT nextval('public.coupon_vendor_id_seq'::regclass);


--
-- TOC entry 5503 (class 2604 OID 648371)
-- Name: coupon_vendor_service_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_vendor_service_order ALTER COLUMN id SET DEFAULT nextval('public.coupon_vendor_service_order_id_seq'::regclass);


--
-- TOC entry 5507 (class 2604 OID 648372)
-- Name: coupons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons ALTER COLUMN id SET DEFAULT nextval('public.coupons_id_seq'::regclass);


--
-- TOC entry 5514 (class 2604 OID 648373)
-- Name: coupons_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons_category ALTER COLUMN id SET DEFAULT nextval('public.coupons_category_id_seq'::regclass);


--
-- TOC entry 5521 (class 2604 OID 648374)
-- Name: cuisines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuisines ALTER COLUMN id SET DEFAULT nextval('public.cuisines_id_seq'::regclass);


--
-- TOC entry 5525 (class 2604 OID 648375)
-- Name: currencies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currencies ALTER COLUMN id SET DEFAULT nextval('public.currencies_id_seq'::regclass);


--
-- TOC entry 5526 (class 2604 OID 648376)
-- Name: custom_banners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_banners ALTER COLUMN id SET DEFAULT nextval('public.custom_banners_id_seq'::regclass);


--
-- TOC entry 5534 (class 2604 OID 648377)
-- Name: designations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.designations ALTER COLUMN id SET DEFAULT nextval('public.designations_id_seq'::regclass);


--
-- TOC entry 5537 (class 2604 OID 648378)
-- Name: event_features id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_features ALTER COLUMN id SET DEFAULT nextval('public.event_features_id_seq'::regclass);


--
-- TOC entry 5538 (class 2604 OID 648379)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 5540 (class 2604 OID 648380)
-- Name: faq id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faq ALTER COLUMN id SET DEFAULT nextval('public.faq_id_seq'::regclass);


--
-- TOC entry 5544 (class 2604 OID 648381)
-- Name: featured_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.featured_products ALTER COLUMN id SET DEFAULT nextval('public.featured_products_id_seq'::regclass);


--
-- TOC entry 5546 (class 2604 OID 648382)
-- Name: featured_products_img id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.featured_products_img ALTER COLUMN id SET DEFAULT nextval('public.featured_products_img_id_seq'::regclass);


--
-- TOC entry 5548 (class 2604 OID 648383)
-- Name: hair_colors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hair_colors ALTER COLUMN id SET DEFAULT nextval('public.hair_colors_id_seq'::regclass);


--
-- TOC entry 5551 (class 2604 OID 648384)
-- Name: help id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help ALTER COLUMN id SET DEFAULT nextval('public.help_id_seq'::regclass);


--
-- TOC entry 5555 (class 2604 OID 648385)
-- Name: help_topics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help_topics ALTER COLUMN id SET DEFAULT nextval('public.help_topics_id_seq'::regclass);


--
-- TOC entry 5557 (class 2604 OID 648386)
-- Name: home_logos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_logos ALTER COLUMN id SET DEFAULT nextval('public.home_logos_id_seq'::regclass);


--
-- TOC entry 5560 (class 2604 OID 648387)
-- Name: hourly_rate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hourly_rate ALTER COLUMN id SET DEFAULT nextval('public.hourly_rate_id_seq'::regclass);


--
-- TOC entry 5563 (class 2604 OID 648388)
-- Name: industry_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industry_types ALTER COLUMN id SET DEFAULT nextval('public.industry_types_id_seq'::regclass);


--
-- TOC entry 5567 (class 2604 OID 648389)
-- Name: landing_page_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.landing_page_settings ALTER COLUMN id SET DEFAULT nextval('public.landing_page_settings_id_seq'::regclass);


--
-- TOC entry 5568 (class 2604 OID 648390)
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- TOC entry 5572 (class 2604 OID 648391)
-- Name: main_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_category ALTER COLUMN id SET DEFAULT nextval('public.main_category_id_seq'::regclass);


--
-- TOC entry 5575 (class 2604 OID 648392)
-- Name: maintainance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintainance ALTER COLUMN id SET DEFAULT nextval('public.maintainance_id_seq'::regclass);


--
-- TOC entry 5576 (class 2604 OID 648393)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 5577 (class 2604 OID 648394)
-- Name: moda_main_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moda_main_categories ALTER COLUMN id SET DEFAULT nextval('public.moda_main_categories_id_seq'::regclass);


--
-- TOC entry 5578 (class 2604 OID 648395)
-- Name: moda_sub_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moda_sub_categories ALTER COLUMN id SET DEFAULT nextval('public.moda_sub_categories_id_seq'::regclass);


--
-- TOC entry 5582 (class 2604 OID 648396)
-- Name: my_moda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.my_moda ALTER COLUMN id SET DEFAULT nextval('public.my_moda_id_seq'::regclass);


--
-- TOC entry 5583 (class 2604 OID 648397)
-- Name: my_moda_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.my_moda_items ALTER COLUMN id SET DEFAULT nextval('public.my_moda_items_id_seq'::regclass);


--
-- TOC entry 5584 (class 2604 OID 648398)
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- TOC entry 5587 (class 2604 OID 648399)
-- Name: order_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products ALTER COLUMN id SET DEFAULT nextval('public.order_products_id_seq'::regclass);


--
-- TOC entry 5595 (class 2604 OID 648400)
-- Name: order_request_view id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_request_view ALTER COLUMN id SET DEFAULT nextval('public.order_request_view_id_seq'::regclass);


--
-- TOC entry 5598 (class 2604 OID 648401)
-- Name: order_status_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_history ALTER COLUMN id SET DEFAULT nextval('public.order_status_history_id_seq'::regclass);


--
-- TOC entry 5601 (class 2604 OID 648402)
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- TOC entry 5628 (class 2604 OID 648403)
-- Name: orders_services order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services ALTER COLUMN order_id SET DEFAULT nextval('public.orders_services_order_id_seq'::regclass);


--
-- TOC entry 5644 (class 2604 OID 648404)
-- Name: orders_services_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services_items ALTER COLUMN id SET DEFAULT nextval('public.orders_services_items_id_seq'::regclass);


--
-- TOC entry 5652 (class 2604 OID 648405)
-- Name: orders_services_mute id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services_mute ALTER COLUMN id SET DEFAULT nextval('public.orders_services_mute_id_seq'::regclass);


--
-- TOC entry 5655 (class 2604 OID 648406)
-- Name: orders_services_rejected id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services_rejected ALTER COLUMN id SET DEFAULT nextval('public.orders_services_rejected_id_seq'::regclass);


--
-- TOC entry 5659 (class 2604 OID 648407)
-- Name: payment_report id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_report ALTER COLUMN id SET DEFAULT nextval('public.payment_report_id_seq'::regclass);


--
-- TOC entry 5664 (class 2604 OID 648408)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 5665 (class 2604 OID 648409)
-- Name: post_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments ALTER COLUMN id SET DEFAULT nextval('public.post_comments_id_seq'::regclass);


--
-- TOC entry 5667 (class 2604 OID 648410)
-- Name: post_likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_likes ALTER COLUMN id SET DEFAULT nextval('public.post_likes_id_seq'::regclass);


--
-- TOC entry 5668 (class 2604 OID 648411)
-- Name: post_saves id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_saves ALTER COLUMN id SET DEFAULT nextval('public.post_saves_id_seq'::regclass);


--
-- TOC entry 5669 (class 2604 OID 648412)
-- Name: post_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_users ALTER COLUMN id SET DEFAULT nextval('public.post_users_id_seq'::regclass);


--
-- TOC entry 5670 (class 2604 OID 648413)
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- TOC entry 5674 (class 2604 OID 648414)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 5709 (class 2604 OID 648415)
-- Name: product_attribute attribute_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_attribute ALTER COLUMN attribute_id SET DEFAULT nextval('public.product_attribute_attribute_id_seq'::regclass);


--
-- TOC entry 5712 (class 2604 OID 648416)
-- Name: product_attribute_values attribute_values_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_attribute_values ALTER COLUMN attribute_values_id SET DEFAULT nextval('public.product_attribute_values_attribute_values_id_seq'::regclass);


--
-- TOC entry 5717 (class 2604 OID 648417)
-- Name: product_category product_category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category ALTER COLUMN product_category_id SET DEFAULT nextval('public.product_category_product_category_id_seq'::regclass);


--
-- TOC entry 5720 (class 2604 OID 648418)
-- Name: product_cuisines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cuisines ALTER COLUMN id SET DEFAULT nextval('public.product_cuisines_id_seq'::regclass);


--
-- TOC entry 5723 (class 2604 OID 648419)
-- Name: product_docs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_docs ALTER COLUMN id SET DEFAULT nextval('public.product_docs_id_seq'::regclass);


--
-- TOC entry 5725 (class 2604 OID 648420)
-- Name: product_features id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_features ALTER COLUMN id SET DEFAULT nextval('public.product_features_id_seq'::regclass);


--
-- TOC entry 5726 (class 2604 OID 648421)
-- Name: product_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images ALTER COLUMN id SET DEFAULT nextval('public.product_images_id_seq'::regclass);


--
-- TOC entry 5727 (class 2604 OID 648422)
-- Name: product_items item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_items ALTER COLUMN item_id SET DEFAULT nextval('public.product_items_item_id_seq'::regclass);


--
-- TOC entry 5729 (class 2604 OID 648423)
-- Name: product_likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_likes ALTER COLUMN id SET DEFAULT nextval('public.product_likes_id_seq'::regclass);


--
-- TOC entry 5730 (class 2604 OID 648424)
-- Name: product_master id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_master ALTER COLUMN id SET DEFAULT nextval('public.product_master_id_seq'::regclass);


--
-- TOC entry 5733 (class 2604 OID 648425)
-- Name: product_master_request id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_master_request ALTER COLUMN id SET DEFAULT nextval('public.product_master_request_id_seq'::regclass);


--
-- TOC entry 5738 (class 2604 OID 648426)
-- Name: product_product_feature id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_product_feature ALTER COLUMN id SET DEFAULT nextval('public.product_product_feature_id_seq'::regclass);


--
-- TOC entry 5739 (class 2604 OID 648427)
-- Name: product_selected_attribute_list product_attribute_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_selected_attribute_list ALTER COLUMN product_attribute_id SET DEFAULT nextval('public.product_selected_attribute_list_product_attribute_id_seq'::regclass);


--
-- TOC entry 5748 (class 2604 OID 648428)
-- Name: product_selected_attributes product_selected_attributes_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_selected_attributes ALTER COLUMN product_selected_attributes_id SET DEFAULT nextval('public.product_selected_attributes_product_selected_attributes_id_seq'::regclass);


--
-- TOC entry 5752 (class 2604 OID 648429)
-- Name: product_specifications prod_spec_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_specifications ALTER COLUMN prod_spec_id SET DEFAULT nextval('public.product_specifications_prod_spec_id_seq'::regclass);


--
-- TOC entry 5755 (class 2604 OID 648430)
-- Name: product_temp_image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_temp_image ALTER COLUMN id SET DEFAULT nextval('public.product_temp_image_id_seq'::regclass);


--
-- TOC entry 5758 (class 2604 OID 648431)
-- Name: product_variations product_variations_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variations ALTER COLUMN product_variations_id SET DEFAULT nextval('public.product_variations_product_variations_id_seq'::regclass);


--
-- TOC entry 5763 (class 2604 OID 648432)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 5772 (class 2604 OID 648433)
-- Name: promotion_banners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_banners ALTER COLUMN id SET DEFAULT nextval('public.promotion_banners_id_seq'::regclass);


--
-- TOC entry 5781 (class 2604 OID 648434)
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- TOC entry 5789 (class 2604 OID 648435)
-- Name: ratings_reply id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings_reply ALTER COLUMN id SET DEFAULT nextval('public.ratings_reply_id_seq'::regclass);


--
-- TOC entry 5792 (class 2604 OID 648436)
-- Name: ref_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_history ALTER COLUMN id SET DEFAULT nextval('public.ref_history_id_seq'::regclass);


--
-- TOC entry 5798 (class 2604 OID 648437)
-- Name: service id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service ALTER COLUMN id SET DEFAULT nextval('public.service_id_seq'::regclass);


--
-- TOC entry 5807 (class 2604 OID 648438)
-- Name: service_assigned_vendors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_assigned_vendors ALTER COLUMN id SET DEFAULT nextval('public.service_assigned_vendors_id_seq'::regclass);


--
-- TOC entry 5809 (class 2604 OID 648439)
-- Name: service_bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_bookings ALTER COLUMN id SET DEFAULT nextval('public.service_bookings_id_seq'::regclass);


--
-- TOC entry 5814 (class 2604 OID 648440)
-- Name: service_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_category ALTER COLUMN id SET DEFAULT nextval('public.service_category_id_seq'::regclass);


--
-- TOC entry 5821 (class 2604 OID 648441)
-- Name: service_category_selected id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_category_selected ALTER COLUMN id SET DEFAULT nextval('public.service_category_selected_id_seq'::regclass);


--
-- TOC entry 5824 (class 2604 OID 648442)
-- Name: service_event_feature id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_event_feature ALTER COLUMN id SET DEFAULT nextval('public.service_event_feature_id_seq'::regclass);


--
-- TOC entry 5825 (class 2604 OID 648443)
-- Name: service_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_images ALTER COLUMN id SET DEFAULT nextval('public.service_images_id_seq'::regclass);


--
-- TOC entry 5826 (class 2604 OID 648444)
-- Name: service_include id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_include ALTER COLUMN id SET DEFAULT nextval('public.service_include_id_seq'::regclass);


--
-- TOC entry 5827 (class 2604 OID 648445)
-- Name: service_order_status_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_order_status_history ALTER COLUMN id SET DEFAULT nextval('public.service_order_status_history_id_seq'::regclass);


--
-- TOC entry 5831 (class 2604 OID 648446)
-- Name: service_timings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_timings ALTER COLUMN id SET DEFAULT nextval('public.service_timings_id_seq'::regclass);


--
-- TOC entry 5835 (class 2604 OID 648447)
-- Name: service_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_type ALTER COLUMN id SET DEFAULT nextval('public.service_type_id_seq'::regclass);


--
-- TOC entry 5836 (class 2604 OID 648448)
-- Name: service_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_types ALTER COLUMN id SET DEFAULT nextval('public.service_types_id_seq'::regclass);


--
-- TOC entry 5840 (class 2604 OID 648449)
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- TOC entry 5845 (class 2604 OID 648450)
-- Name: skin_colors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin_colors ALTER COLUMN id SET DEFAULT nextval('public.skin_colors_id_seq'::regclass);


--
-- TOC entry 5848 (class 2604 OID 648451)
-- Name: states id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- TOC entry 5851 (class 2604 OID 648452)
-- Name: store_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_images ALTER COLUMN id SET DEFAULT nextval('public.store_images_id_seq'::regclass);


--
-- TOC entry 5852 (class 2604 OID 648453)
-- Name: store_likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_likes ALTER COLUMN id SET DEFAULT nextval('public.store_likes_id_seq'::regclass);


--
-- TOC entry 5853 (class 2604 OID 648454)
-- Name: store_managers_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_managers_types ALTER COLUMN id SET DEFAULT nextval('public.store_managers_types_id_seq'::regclass);


--
-- TOC entry 5854 (class 2604 OID 648455)
-- Name: store_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_type ALTER COLUMN id SET DEFAULT nextval('public.store_type_id_seq'::regclass);


--
-- TOC entry 5857 (class 2604 OID 648456)
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores ALTER COLUMN id SET DEFAULT nextval('public.stores_id_seq'::regclass);


--
-- TOC entry 5862 (class 2604 OID 648457)
-- Name: subscribers_emails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscribers_emails ALTER COLUMN id SET DEFAULT nextval('public.subscribers_emails_id_seq'::regclass);


--
-- TOC entry 5863 (class 2604 OID 648458)
-- Name: temp_order_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_order_products ALTER COLUMN id SET DEFAULT nextval('public.temp_order_products_id_seq'::regclass);


--
-- TOC entry 5870 (class 2604 OID 648459)
-- Name: temp_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_orders ALTER COLUMN id SET DEFAULT nextval('public.temp_orders_id_seq'::regclass);


--
-- TOC entry 5889 (class 2604 OID 648460)
-- Name: temp_service_order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_service_order_items ALTER COLUMN id SET DEFAULT nextval('public.temp_service_order_items_id_seq'::regclass);


--
-- TOC entry 5895 (class 2604 OID 648461)
-- Name: temp_service_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_service_orders ALTER COLUMN id SET DEFAULT nextval('public.temp_service_orders_id_seq'::regclass);


--
-- TOC entry 5902 (class 2604 OID 648462)
-- Name: temp_user_account_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_user_account_types ALTER COLUMN id SET DEFAULT nextval('public.temp_user_account_types_id_seq'::regclass);


--
-- TOC entry 5903 (class 2604 OID 648463)
-- Name: temp_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users ALTER COLUMN id SET DEFAULT nextval('public.temp_users_id_seq'::regclass);


--
-- TOC entry 5907 (class 2604 OID 648464)
-- Name: tesimonial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tesimonial ALTER COLUMN id SET DEFAULT nextval('public.tesimonial_id_seq'::regclass);


--
-- TOC entry 5911 (class 2604 OID 648465)
-- Name: transport id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transport ALTER COLUMN id SET DEFAULT nextval('public.transport_id_seq'::regclass);


--
-- TOC entry 5913 (class 2604 OID 648466)
-- Name: user_account_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account_types ALTER COLUMN id SET DEFAULT nextval('public.user_account_types_id_seq'::regclass);


--
-- TOC entry 5914 (class 2604 OID 648467)
-- Name: user_address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address ALTER COLUMN id SET DEFAULT nextval('public.user_address_id_seq'::regclass);


--
-- TOC entry 5924 (class 2604 OID 648468)
-- Name: user_follows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_follows ALTER COLUMN id SET DEFAULT nextval('public.user_follows_id_seq'::regclass);


--
-- TOC entry 5925 (class 2604 OID 648469)
-- Name: user_privileges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_privileges ALTER COLUMN id SET DEFAULT nextval('public.user_privileges_id_seq'::regclass);


--
-- TOC entry 5927 (class 2604 OID 648470)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5953 (class 2604 OID 648471)
-- Name: users_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_role ALTER COLUMN id SET DEFAULT nextval('public.users_role_id_seq'::regclass);


--
-- TOC entry 5954 (class 2604 OID 648472)
-- Name: vendor_cuisines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_cuisines ALTER COLUMN id SET DEFAULT nextval('public.vendor_cuisines_id_seq'::regclass);


--
-- TOC entry 5957 (class 2604 OID 648473)
-- Name: vendor_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_details ALTER COLUMN id SET DEFAULT nextval('public.vendor_details_id_seq'::regclass);


--
-- TOC entry 5976 (class 2604 OID 648474)
-- Name: vendor_followers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_followers ALTER COLUMN id SET DEFAULT nextval('public.vendor_followers_id_seq'::regclass);


--
-- TOC entry 5979 (class 2604 OID 648475)
-- Name: vendor_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_locations ALTER COLUMN id SET DEFAULT nextval('public.vendor_locations_id_seq'::regclass);


--
-- TOC entry 5981 (class 2604 OID 648476)
-- Name: vendor_menu_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_menu_images ALTER COLUMN id SET DEFAULT nextval('public.vendor_menu_images_id_seq'::regclass);


--
-- TOC entry 5984 (class 2604 OID 648477)
-- Name: vendor_service_timings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_service_timings ALTER COLUMN id SET DEFAULT nextval('public.vendor_service_timings_id_seq'::regclass);


--
-- TOC entry 5994 (class 2604 OID 648478)
-- Name: vendor_services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_services ALTER COLUMN id SET DEFAULT nextval('public.vendor_services_id_seq'::regclass);


--
-- TOC entry 5995 (class 2604 OID 648479)
-- Name: vendor_timings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_timings ALTER COLUMN id SET DEFAULT nextval('public.vendor_timings_id_seq'::regclass);


--
-- TOC entry 5997 (class 2604 OID 648480)
-- Name: wallet_histories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_histories ALTER COLUMN id SET DEFAULT nextval('public.wallet_histories_id_seq'::regclass);


--
-- TOC entry 6000 (class 2604 OID 648481)
-- Name: wallet_payment_report id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_payment_report ALTER COLUMN id SET DEFAULT nextval('public.wallet_payment_report_id_seq'::regclass);


--
-- TOC entry 6003 (class 2604 OID 648482)
-- Name: web_banners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.web_banners ALTER COLUMN id SET DEFAULT nextval('public.web_banners_id_seq'::regclass);


--
-- TOC entry 6006 (class 2604 OID 648483)
-- Name: websockets_statistics_entries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.websockets_statistics_entries ALTER COLUMN id SET DEFAULT nextval('public.websockets_statistics_entries_id_seq'::regclass);


--
-- TOC entry 6007 (class 2604 OID 648484)
-- Name: wishlists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlists ALTER COLUMN id SET DEFAULT nextval('public.wishlists_id_seq'::regclass);


--
-- TOC entry 6497 (class 0 OID 647068)
-- Dependencies: 215
-- Data for Name: aboutus_page_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aboutus_page_settings (id, meta_key, meta_value, created_at, updated_at) FROM stdin;
1	about_us_title	Everyday fashion is our promise to you	2025-01-21 05:57:03	2025-01-21 05:57:03
2	about_us_description	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged</p>	2025-01-21 05:57:03	2025-01-21 05:57:03
4	title	\N	2025-01-21 05:57:03	2025-01-21 05:57:03
5	description	\N	2025-01-21 05:57:03	2025-01-21 05:57:03
7	date	\N	2025-01-21 05:57:03	2025-01-21 05:57:03
6	our_story_title	Our Story	2025-01-21 05:57:03	2025-01-21 06:03:48
10	our_story_date	Est. 2024	2025-01-21 06:03:48	2025-01-21 06:03:48
11	our_story_description	<div class="col-12 col-sm-12 col-md-6 col-lg-6">\r\n<p>Handwi comes with easy-to-use interface and outstanding support. You can implement your own design. You can easily change the store's appearance as per your requirements using our ready sections and options available.</p>\r\n<p>You can implement your own design, You can easily change the store's appearance as per your requirements using our ready sections and options available.</p>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley</p>\r\n</div>\r\n<div class="col-12 col-sm-12 col-md-6 col-lg-6">\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.</p>\r\n<p>All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced</p>\r\n</div>	2025-01-21 06:03:48	2025-01-21 06:05:25
8	our_vision_title	Our Vision	2025-01-21 05:57:03	2025-01-21 06:05:25
9	our_vision_description	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries remaining essentially unchanged.</p>	2025-01-21 05:57:03	2025-01-21 06:05:25
3	founder_date	SINCE 2024	2025-01-21 05:57:03	2025-01-21 06:10:04
12	founder_title	The Founder	2025-01-21 06:10:04	2025-01-21 06:10:04
13	founder_description	<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. "de Finibus Bonorum et Malorum" by Cicero reproduced in their 1914 translation by H. Rackham.</p>\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, even slightly believable.</p>\r\n<p>All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary</p>	2025-01-21 06:10:04	2025-01-21 06:10:04
14	founder_image	http://localhost/handwi_2024/public/uploads/landing_page_images/1737439804_about-info-s1.jpg	2025-01-21 06:10:04	2025-01-21 06:10:04
\.


--
-- TOC entry 6499 (class 0 OID 647074)
-- Dependencies: 217
-- Data for Name: account_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_type (id, name, description, sort_order, status, indvidual_name, indvidual_image, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6501 (class 0 OID 647083)
-- Dependencies: 219
-- Data for Name: activity_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activity_type (id, account_id, name, description, logo, sort_order, status, availbale_for, indvidual_name, indvidual_logo, deleted, created_at, updated_at, banner_image) FROM stdin;
\.


--
-- TOC entry 6503 (class 0 OID 647093)
-- Dependencies: 221
-- Data for Name: admin_designation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_designation (id, name, is_deletd) FROM stdin;
\.


--
-- TOC entry 6505 (class 0 OID 647100)
-- Dependencies: 223
-- Data for Name: amount_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.amount_type (id, name) FROM stdin;
1	%
2	Amount
\.


--
-- TOC entry 6507 (class 0 OID 647106)
-- Dependencies: 225
-- Data for Name: app_banners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_banners (id, banner_title, banner_image, active, created_by, updated_by, created_at, updated_at, type, category, product, service, banner_type, activity, store, url, is_type_gift) FROM stdin;
2	Sam Banner	1733134632Rectangle 17888.png	1	1	0	2024-12-02 10:17:12	\N	4	0	0	0	1	0	0	\N	\N
3	Sam Banner	1733136834Rectangle 17888.png	1	1	0	2024-12-02 10:53:54	\N	4	0	0	0	1	0	0	\N	\N
\.


--
-- TOC entry 6509 (class 0 OID 647122)
-- Dependencies: 227
-- Data for Name: app_home_sections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_home_sections (id, type, entity_id, title, status, sort_order, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6511 (class 0 OID 647131)
-- Dependencies: 229
-- Data for Name: area; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.area (id, country_id, city_id, name, status, latitude, longitude, deleted_at, created_at, updated_at) FROM stdin;
1	1	1	International City	1	\N	\N	\N	2024-12-20 11:34:47	2024-12-20 11:34:47
\.


--
-- TOC entry 6513 (class 0 OID 647140)
-- Dependencies: 231
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles (id, title_en, title_ar, status, desc_en, desc_ar, meta_title, meta_keyword, meta_description, created_at, updated_at) FROM stdin;
1	Privacy Policy	\N	1	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>	\N	\N	\N	\N	2025-01-20 16:18:00	2025-01-20 16:18:00
2	Terms and Conditions	\N	1	<ul style="box-sizing: border-box; padding: 0px; margin: 0px; list-style: none; color: #222222; font-family: 'DM Sans', sans-serif; font-size: 13px; letter-spacing: 0.26px; background-color: #f5f5f5;">\r\n<li style="box-sizing: border-box; margin: 5px 0px;"><strong style="margin: 0px; padding: 0px; color: #000000; font-family: 'Open Sans', Arial, sans-serif; font-size: 14px; letter-spacing: normal; text-align: justify; background-color: #ffffff;">Lorem Ipsum</strong><span style="color: #000000; font-family: 'Open Sans', Arial, sans-serif; font-size: 14px; letter-spacing: normal; text-align: justify; background-color: #ffffff;">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span></li>\r\n</ul>	\N	\N	\N	\N	2025-01-20 16:18:54	2025-01-20 16:18:54
\.


--
-- TOC entry 6515 (class 0 OID 647147)
-- Dependencies: 233
-- Data for Name: attribute_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attribute_type (id, attribute_type_name, attribute_type_uid, attribute_type_status) FROM stdin;
1	Dropdown	dropdown	1
2	Button	radio	1
3	Image Selection	radio_image	1
4	Color Box	radio_button_group	1
\.


--
-- TOC entry 6517 (class 0 OID 647152)
-- Dependencies: 235
-- Data for Name: attribute_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attribute_values (id, attribute_id, attribute_values, attribute_value_in, attribute_value_color, deleted, created_uid, updated_uid, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6519 (class 0 OID 647158)
-- Dependencies: 237
-- Data for Name: attribute_values_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attribute_values_request (id, request_id, attribute, value) FROM stdin;
\.


--
-- TOC entry 6521 (class 0 OID 647165)
-- Dependencies: 239
-- Data for Name: attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attributes (id, attribute_name, active, attribute_type, industry_type, company_id, store_id, is_common, deleted, created_uid, updated_uid, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6523 (class 0 OID 647174)
-- Dependencies: 241
-- Data for Name: bank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank (id, name, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6524 (class 0 OID 647179)
-- Dependencies: 242
-- Data for Name: bank_code_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank_code_types (id, name, country_id, active, deleted, created_at, updated_at) FROM stdin;
1	IFSC (India)	0	0	0	\N	\N
2	SORT CODE (UK)	0	0	0	\N	\N
3	SWIFT CODE	0	0	0	\N	\N
\.


--
-- TOC entry 6526 (class 0 OID 647188)
-- Dependencies: 244
-- Data for Name: bank_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank_details (id, bank_name, company_account, code_type, account_no, branch_code, branch_name, bank_statement_doc, credit_card_sta_doc, country, user_id, created_at, updated_at, iban) FROM stdin;
1	bank bank	234242342342342	0	\N	\N	\N	\N	\N	0	23	2025-01-09 14:58:52	2025-01-09 14:58:52	sdfsdfsdfsdfsdfsdfsdfsf
2	bank bank	234242342342342	0	\N	\N	\N	\N	\N	0	23	2025-01-09 14:58:58	2025-01-09 14:58:58	sdfsdfsdfsdfsdfsdfsdfsf
3	bank bank	234242342342342	0	\N	\N	\N	\N	\N	0	23	2025-01-09 14:59:02	2025-01-09 14:59:02	sdfsdfsdfsdfsdfsdfsdfsf
4	Xyla	303424234234234	0	\N	\N	\N	\N	\N	0	25	2025-01-09 16:38:27	2025-01-09 16:38:27	asddasdasfsafsfsdfsdfsd
5	Naida	453123123123123	0	\N	\N	\N	\N	\N	0	28	2025-01-10 08:19:29	2025-01-10 08:19:29	asddadasdadasdaadadadas
6	Mari Velez	\N	0	135342342342342	\N	\N	\N	\N	0	40	2025-01-15 09:20:30	2025-01-15 09:20:30	Eligendimodinatusasdasd
7	Magee Hawkins	\N	0	342423423423423	\N	\N	\N	\N	0	41	2025-01-15 09:53:36	2025-01-15 09:53:36	Eosanimexpeditaauasdasd
8	Louis Mcneil	\N	0	234234234234234	\N	\N	\N	\N	0	42	2025-01-15 10:10:58	2025-01-15 10:10:58	Nisidignissimosconasdas
\.


--
-- TOC entry 6529 (class 0 OID 647197)
-- Dependencies: 247
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blogs (id, name, description, blog_image, active, deleted, created_at, updated_at) FROM stdin;
1	Unique Designs, Unique You	<p class="exceprt">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or rand...</p>	1736261483post-1.jpg	t	0	2025-01-07 14:51:23	2025-01-07 14:53:03
2	Intelligent beautiful HTML template	<p class="exceprt">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or rand...</p>	1736262610post-2.jpg	t	0	2025-01-07 15:10:10	2025-01-07 15:10:51
\.


--
-- TOC entry 6531 (class 0 OID 647205)
-- Dependencies: 249
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brand (id, name, industry_type, image, active, created_at, updated_at, deleted, activity_id) FROM stdin;
1	Native	0	\N	1	2024-07-02 09:16:22	2024-07-02 11:09:20	0	7
\.


--
-- TOC entry 6533 (class 0 OID 647214)
-- Dependencies: 251
-- Data for Name: building_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.building_type (id, name, description, created_at, updated_at, active, deleted) FROM stdin;
\.


--
-- TOC entry 6535 (class 0 OID 647222)
-- Dependencies: 253
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, product_id, product_attribute_id, quantity, user_id, store_id, device_cart_id, created_at, updated_at) FROM stdin;
1	2	1	5	2	4	cart_a	2024-12-20 12:14:04	2024-12-20 12:14:04
\.


--
-- TOC entry 6537 (class 0 OID 647228)
-- Dependencies: 255
-- Data for Name: cart_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_service (id, service_id, user_id, device_cart_id, booked_time, created_at, updated_at, building_type_id, text, hourly_rate, task_description, doc, qty) FROM stdin;
\.


--
-- TOC entry 6539 (class 0 OID 647238)
-- Dependencies: 257
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name, image, banner_image, parent_id, active, deleted, sort_order, created_uid, updated_uid, created_at, updated_at, activity_id, home_page, sub_title, is_gift, show_gift_page, is_handmade, background_image) FROM stdin;
6	Baby Gift Sub	\N	\N	5	0	1	0	1	1	2024-07-02 10:55:29	2024-07-02 11:10:03	0	f	\N	\N	\N	f	\N
1	Birthday Gifts	/uploads/category/678328658ab34_1736648805.jpg	\N	0	0	1	0	1	1	2024-07-02 09:11:24	2025-02-28 17:53:19	7	f	\N	1	\N	t	\N
2	Wedding Gifts	/uploads/category/67832858cee34_1736648792.jpg	\N	0	0	1	0	1	1	2024-07-02 09:11:55	2025-02-28 17:53:27	7	f	\N	1	\N	t	\N
3	Home Gifts	/uploads/category/6783284b9a4bc_1736648779.jpg	\N	0	0	1	0	1	1	2024-07-02 09:14:22	2025-02-28 17:53:33	7	t	\N	\N	\N	f	\N
4	Floral Gifts	/uploads/category/6783283f91fd5_1736648767.jpg	\N	2	0	1	0	1	1	2024-07-02 09:15:20	2025-02-28 17:53:44	7	t	\N	1	\N	f	\N
5	Necklace	/uploads/category/67c1fd6f769f1_1740766575.jpg	/uploads/category/67c1fd6f773cf_1740766575.png	0	1	0	0	1	1	2024-07-02 09:15:50	2025-02-28 18:16:15	7	t	\N	1	\N	\N	/uploads/category/67c1fd6f77fea_1740766575.jpg
7	Rings	/uploads/category/67c1fdfeba297_1740766718.jpg	/uploads/category/67c1fdfebab49_1740766718.png	0	1	0	0	1	1	2025-02-28 18:18:38	2025-02-28 18:18:38	7	t	\N	\N	\N	\N	/uploads/category/67c1fdfebb5b2_1740766718.jpg
8	Bracelet	/uploads/category/67c1fe4965726_1740766793.jpg	/uploads/category/67c1fe4965d1b_1740766793.png	0	1	0	0	1	1	2025-02-28 18:19:53	2025-02-28 18:19:53	7	t	\N	\N	\N	\N	/uploads/category/67c1fe49665e8_1740766793.jpg
9	Pendants	/uploads/category/67c1fe8edabd8_1740766862.jpg	/uploads/category/67c1fe8edb313_1740766862.png	0	1	0	0	1	1	2025-02-28 18:21:02	2025-02-28 18:21:02	7	t	\N	\N	\N	\N	/uploads/category/67c1fe8edbd09_1740766862.jpg
10	Earrings	/uploads/category/67c1fecf52a24_1740766927.jpg	/uploads/category/67c1fecf5308e_1740766927.png	0	1	0	0	1	1	2025-02-28 18:22:07	2025-02-28 18:22:07	7	t	\N	\N	\N	\N	/uploads/category/67c1fecf53948_1740766927.jpg
11	JEWELRY	/uploads/category/67c2247d7d056_1740776573.jpg	/uploads/category/67c2247d7db91_1740776573.png	5	1	0	0	1	1	2025-02-28 21:02:53	2025-02-28 21:02:53	7	f	\N	\N	\N	\N	/uploads/category/67c2247d7f1ff_1740776573.jpg
\.


--
-- TOC entry 6541 (class 0 OID 647249)
-- Dependencies: 259
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name, active, country_id, state_id, created_uid, updated_uid, deleted, created_at, updated_at) FROM stdin;
1	Dubai	1	1	0	1	\N	0	2024-06-28 06:21:35	2024-06-28 06:21:35
\.


--
-- TOC entry 6543 (class 0 OID 647255)
-- Dependencies: 261
-- Data for Name: cleaning_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cleaning_services (id, title, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6545 (class 0 OID 647259)
-- Dependencies: 263
-- Data for Name: comment_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment_likes (id, comment_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6547 (class 0 OID 647263)
-- Dependencies: 265
-- Data for Name: comment_taged_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment_taged_users (id, comment_id, user_id) FROM stdin;
\.


--
-- TOC entry 6549 (class 0 OID 647267)
-- Dependencies: 267
-- Data for Name: contact_us; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_us (id, name, email, dial_code, mobile_number, message, created_at, updated_at, subject) FROM stdin;
1	Alfreda Burns	lawyjuhare@mailinator.com	\N	3424234242	Voluptate ratione se	\N	\N	\N
2	Wallace Dudley	doguqole@mailinator.com	\N	12312312312	Nobis doloremque vol	\N	\N	\N
3	Isaac Johnson	piwelovawu@mailinator.com	\N	2323131313112	Reiciendis illo volu	\N	\N	\N
4	Hall Buckley	doquhejobe@mailinator.com	\N	2312313131	Doloribus commodi id	\N	\N	Omnis nisi vero cum
\.


--
-- TOC entry 6551 (class 0 OID 647273)
-- Dependencies: 269
-- Data for Name: contact_us_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_us_settings (id, title_en, title_ar, email, mobile, desc_en, desc_ar, location, latitude, longitude, twitter, instagram, facebook, youtube, linkedin, created_at, updated_at, ref_discount, ref_discount_type, transport_website_link, pinterest, tiktok, whatsapp) FROM stdin;
1	Handwi	\N	info@example.com	+971123456789	\N	\N	55 Gallaxy Enque, 2568 steet, 23568 UAE	\N	\N	https://www.twitter.com/	https://www.instagram.com/	https://www.facebook.com/	https://www.youtube.com/	https://www.linkedin.com/	\N	2025-01-21 05:18:46	0	1	\N	https://www.pininterest.com/	https://www.tiktok.com/	+971123456789
\.


--
-- TOC entry 6553 (class 0 OID 647282)
-- Dependencies: 271
-- Data for Name: contracting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contracting (id, title, description, building_type, contract_type, file, deleted, created_at, updated_at, user_id, status, price, qoutation_file, transaction_id, payment_ref) FROM stdin;
\.


--
-- TOC entry 6555 (class 0 OID 647288)
-- Dependencies: 273
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, name, prefix, dial_code, active, created_at, updated_at, deleted) FROM stdin;
1	United Arab Emirates	971	971	1	2024-06-27 10:47:37	\N	0
\.


--
-- TOC entry 6557 (class 0 OID 647296)
-- Dependencies: 275
-- Data for Name: coupon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon (id, coupon_title, coupon_description, coupon_end_date, coupon_amount, coupon_minimum_spend, coupon_max_spend, coupon_usage_percoupon, coupon_usage_perx, coupon_usage_peruser, coupon_vender_id, coupon_status, deleted, coupon_code, amount_type, start_date, applied_to, minimum_amount, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6558 (class 0 OID 647306)
-- Dependencies: 276
-- Data for Name: coupon_brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_brand (id, name, image, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6560 (class 0 OID 647314)
-- Dependencies: 278
-- Data for Name: coupon_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_category (id, coupon_id, category_id) FROM stdin;
\.


--
-- TOC entry 6563 (class 0 OID 647321)
-- Dependencies: 281
-- Data for Name: coupon_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_images (id, coupon_id, image, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6565 (class 0 OID 647328)
-- Dependencies: 283
-- Data for Name: coupon_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_products (id, coupon_id, product_id) FROM stdin;
\.


--
-- TOC entry 6567 (class 0 OID 647334)
-- Dependencies: 285
-- Data for Name: coupon_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_services (id, coupon_id, service_id) FROM stdin;
1	1	1
\.


--
-- TOC entry 6569 (class 0 OID 647340)
-- Dependencies: 287
-- Data for Name: coupon_vendor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_vendor (id, vendor, coupon_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6571 (class 0 OID 647346)
-- Dependencies: 289
-- Data for Name: coupon_vendor_service_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_vendor_service_order (id, vendor_id, coupon_id, order_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6573 (class 0 OID 647353)
-- Dependencies: 291
-- Data for Name: coupons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupons (id, title, title_ar, brand_id, category_id, coupon_code, active, sort_order, trending, hot_deal, description, description_ar, created_at, updated_at, start_date, coupon_end_date) FROM stdin;
\.


--
-- TOC entry 6574 (class 0 OID 647364)
-- Dependencies: 292
-- Data for Name: coupons_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupons_category (id, name, image, banner_image, parent_id, active, deleted, sort_order, created_uid, updated_uid, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6577 (class 0 OID 647377)
-- Dependencies: 295
-- Data for Name: cuisines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuisines (id, name, status, deleted, sort_order, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6579 (class 0 OID 647384)
-- Dependencies: 297
-- Data for Name: currencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currencies (id, name, code, created_at, updated_at) FROM stdin;
1	AED	aed	\N	\N
\.


--
-- TOC entry 6581 (class 0 OID 647390)
-- Dependencies: 299
-- Data for Name: custom_banners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.custom_banners (id, banner_title, banner_image, active, created_by, updated_by, type, category, product, service, banner_type, activity, store, url, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6583 (class 0 OID 647403)
-- Dependencies: 301
-- Data for Name: designations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.designations (id, user_id, user_type, designation, status, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 6585 (class 0 OID 647409)
-- Dependencies: 303
-- Data for Name: event_features; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_features (id, name, image_path, description, created_at, updated_at) FROM stdin;
1	SM RESIDENCE- MEYDAN AVENNUE OPPISITE MEYDAN HOTEL	1736655235678341832cc04.png	SM RESIDENCE- MEYDAN AVENNUE OPPISITE MEYDAN HOTEL - Dubai - United Arab Emirates	2025-01-12 04:13:55	2025-01-12 04:13:55
2	Sat, July 13 2024, 02:00 PM (IST)	1736655268678341a435a7f.png	Sat, July 13 2024, 02:00 PM (IST)	2025-01-12 04:14:28	2025-01-12 04:14:28
3	Arabic/English (Our Community Manager is present to Help Live Translate)	1736655295678341bfa81ba.png	Arabic/English (Our Community Manager is present to Help Live Translate)	2025-01-12 04:14:55	2025-01-12 04:14:55
\.


--
-- TOC entry 6587 (class 0 OID 647415)
-- Dependencies: 305
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 6589 (class 0 OID 647422)
-- Dependencies: 307
-- Data for Name: faq; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faq (id, title, description, created_by, updated_by, active, created_at, updated_at) FROM stdin;
1	What Shipping Methods Are Available?	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.	1	1	1	2025-01-20 08:17:18	2025-01-20 08:17:18
2	What Shipping Methods Are Available?	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.	1	1	1	2025-01-20 08:17:18	2025-01-20 08:17:18
3	What Shipping Methods Are Available?	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.	1	1	1	2025-01-20 08:17:18	2025-01-20 08:17:18
4	What Shipping Methods Are Available?	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.	1	1	1	2025-01-20 08:17:18	2025-01-20 08:17:18
\.


--
-- TOC entry 6591 (class 0 OID 647431)
-- Dependencies: 309
-- Data for Name: featured_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.featured_products (id, master_product, description, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6593 (class 0 OID 647438)
-- Dependencies: 311
-- Data for Name: featured_products_img; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.featured_products_img (id, featured_product_id, image) FROM stdin;
\.


--
-- TOC entry 6595 (class 0 OID 647445)
-- Dependencies: 313
-- Data for Name: hair_colors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hair_colors (id, name, color, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6597 (class 0 OID 647451)
-- Dependencies: 315
-- Data for Name: help; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.help (id, title, description, created_by, updated_by, active, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6599 (class 0 OID 647460)
-- Dependencies: 317
-- Data for Name: help_topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.help_topics (id, user_id, topic, created_at, updated_at, is_survey_topic) FROM stdin;
1	23	I want to expand my online business by selling on Handwi, too	2025-01-09 14:54:28	2025-01-09 14:54:28	t
2	23	Deciding what to sell	2025-01-09 14:54:28	2025-01-09 14:54:28	f
3	23	Selling online	2025-01-09 14:54:28	2025-01-09 14:54:28	f
4	23	Getting discovered in search	2025-01-09 14:54:28	2025-01-09 14:54:28	f
5	23	Pricing items	2025-01-09 14:54:28	2025-01-09 14:54:28	f
6	24	I'm just starting to sell for the first time ever	2025-01-09 16:31:22	2025-01-09 16:31:22	t
7	24	Deciding what to sell	2025-01-09 16:31:22	2025-01-09 16:31:22	f
8	24	Shop naming & branding	2025-01-09 16:31:22	2025-01-09 16:31:22	f
9	24	Selling online	2025-01-09 16:31:22	2025-01-09 16:31:22	f
10	24	Taking photos of items	2025-01-09 16:31:22	2025-01-09 16:31:22	f
11	25	I have a business and want to sell online for the first time	2025-01-09 16:35:36	2025-01-09 16:35:36	t
12	25	Selling online	2025-01-09 16:35:36	2025-01-09 16:35:36	f
13	25	Taking photos of items	2025-01-09 16:35:36	2025-01-09 16:35:36	f
14	25	Getting discovered in search	2025-01-09 16:35:36	2025-01-09 16:35:36	f
15	26	I'm just starting to sell for the first time ever	2025-01-09 16:38:58	2025-01-09 16:38:58	t
16	26	Selling online	2025-01-09 16:38:58	2025-01-09 16:38:58	f
17	26	Taking photos of items	2025-01-09 16:38:58	2025-01-09 16:38:58	f
18	27	I'm just starting to sell for the first time ever	2025-01-09 18:01:39	2025-01-09 18:01:39	t
19	28	I have a business and want to sell online for the first time	2025-01-10 08:17:05	2025-01-10 08:17:05	t
20	28	Deciding what to sell	2025-01-10 08:17:05	2025-01-10 08:17:05	f
21	28	Shop naming & branding	2025-01-10 08:17:05	2025-01-10 08:17:05	f
22	28	Selling online	2025-01-10 08:17:05	2025-01-10 08:17:05	f
23	28	Taking photos of items	2025-01-10 08:17:05	2025-01-10 08:17:05	f
24	28	Getting discovered in search	2025-01-10 08:17:05	2025-01-10 08:17:05	f
25	28	Packing and shipping	2025-01-10 08:17:05	2025-01-10 08:17:05	f
26	29	I have a business and want to sell online for the first time	2025-01-10 09:14:52	2025-01-10 09:14:52	t
27	29	Deciding what to sell	2025-01-10 09:14:52	2025-01-10 09:14:52	f
28	29	Selling online	2025-01-10 09:14:52	2025-01-10 09:14:52	f
29	29	Getting discovered in search	2025-01-10 09:14:52	2025-01-10 09:14:52	f
\.


--
-- TOC entry 6601 (class 0 OID 647465)
-- Dependencies: 319
-- Data for Name: home_logos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_logos (id, image, created_at, updated_at, deleted, active) FROM stdin;
1	1736192491brandlogo2.png	2025-01-06 19:38:41	2025-01-06 19:44:38	0	1
2	1736263290brandlogo1.png	2025-01-07 15:21:30	\N	0	1
3	1736263300brandlogo7.png	2025-01-07 15:21:40	2025-01-07 15:23:07	0	1
\.


--
-- TOC entry 6603 (class 0 OID 647471)
-- Dependencies: 321
-- Data for Name: hourly_rate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hourly_rate (id, text, hourly_rate, created_at, updated_at, service_id) FROM stdin;
\.


--
-- TOC entry 6605 (class 0 OID 647479)
-- Dependencies: 323
-- Data for Name: industry_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.industry_types (id, name, active, deleted, sort_order, created_uid, updated_uid, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6607 (class 0 OID 647486)
-- Dependencies: 325
-- Data for Name: landing_page_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.landing_page_settings (id, meta_key, meta_value, created_at, updated_at) FROM stdin;
4	shipping_title	Free Shipping &amp; Return	2025-01-05 17:19:07	2025-01-05 17:19:07
5	shipping_description	<p>Free shipping on all US orders</p>	2025-01-05 17:19:07	2025-01-05 17:19:07
6	money_title	Money Guarantee	2025-01-05 17:22:30	2025-01-05 17:22:30
7	money_description	<p>30 days money back guarantee</p>	2025-01-05 17:22:30	2025-01-05 17:22:30
8	support_title	Online Support	2025-01-05 17:28:09	2025-01-05 17:28:09
9	support_description	<p>We support online 24/7 on day</p>	2025-01-05 17:28:09	2025-01-05 17:28:09
10	payment_title	Payment Security	2025-01-05 17:30:48	2025-01-05 17:30:48
11	payment_description	<p>More than 8 different secure</p>	2025-01-05 17:30:48	2025-01-05 17:30:48
12	sale_section_1_title	NEW COLLECTION	2025-01-05 20:54:15	2025-01-05 20:54:15
13	sale_section_1_description	<p>STREETSTYLE</p>	2025-01-05 20:54:15	2025-01-05 20:54:15
14	sale_section_1_button_text	Shop now	2025-01-05 20:54:15	2025-01-05 20:54:15
18	best_seller_title	BEST SELLER	2025-01-05 20:54:15	2025-01-05 20:54:15
19	best_seller_subtitle	TOP SALE IN THIS WEEK	2025-01-05 20:54:15	2025-01-05 20:54:15
20	latest_title	Spring Summer	2025-01-05 20:54:15	2025-01-05 20:54:15
21	latest_subtitle	Shop The Latest	2025-01-05 20:54:15	2025-01-05 20:54:15
15	sale_section_2_title	SUMMER SALE OFFERS	2025-01-05 20:54:15	2025-01-05 21:15:21
16	sale_section_2_description	<p>70% OFF</p>	2025-01-05 20:54:15	2025-01-05 21:15:21
17	sale_section_2_button_text	Shop the collection	2025-01-05 20:54:15	2025-01-05 21:15:21
23	sale_section_2_image	http://localhost/handwi_2024/public/uploads/landing_page_images/1736115561_demo1-banner5.webp	2025-01-05 20:56:50	2025-01-05 22:19:21
22	sale_section_1_image	http://localhost/handwi_2024/public/uploads/landing_page_images/1736115580_demo1-banner4.webp	2025-01-05 20:54:15	2025-01-05 22:19:40
24	for_you_title	FOR YOU	2025-01-15 11:15:59	2025-01-15 11:15:59
25	for_you_subtitle	Shop The Latest	2025-01-15 11:15:59	2025-01-15 11:15:59
1	banner_title	Deal of the week	2025-01-03 05:37:44	2025-02-28 19:08:28
26	banner_button_text	Shop Now	2025-02-28 19:08:28	2025-02-28 19:08:28
27	banner_button_link	https://dxbitprojects.com/	2025-02-28 19:08:28	2025-02-28 19:08:28
2	banner_description	<p>Summer Collection</p>	2025-01-03 05:37:44	2025-02-28 19:08:28
3	banner_image	http://localhost/maj/public/uploads/landing_page_images/1740769708_025458.jpg	2025-01-03 05:37:44	2025-02-28 19:08:28
28	last_section_title	#majstyle	2025-02-28 19:29:04	2025-02-28 19:29:04
29	last_section_description	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sed maecenas a, massa odio est pellentesque sodales.</p>	2025-02-28 19:29:04	2025-02-28 19:29:04
30	last_section_image_1	http://localhost/maj/public/uploads/landing_page_images/1740770944_instagram1.jpg	2025-02-28 19:29:04	2025-02-28 19:29:04
31	last_section_image_2	http://localhost/maj/public/uploads/landing_page_images/1740770983_instagram2.jpg	2025-02-28 19:29:43	2025-02-28 19:29:43
32	last_section_image_3	http://localhost/maj/public/uploads/landing_page_images/1740770983_instagram3.jpg	2025-02-28 19:29:43	2025-02-28 19:29:43
33	last_section_image_4	http://localhost/maj/public/uploads/landing_page_images/1740770983_instagram4.jpg	2025-02-28 19:29:43	2025-02-28 19:29:43
34	last_section_image_5	http://localhost/maj/public/uploads/landing_page_images/1740770983_instagram5.jpg	2025-02-28 19:29:43	2025-02-28 19:29:43
35	last_section_image_url_1	https://dxbitprojects.com/	2025-02-28 19:43:37	2025-02-28 19:47:18
36	last_section_image_url_2	https://dxbitprojects.com/	2025-02-28 19:43:37	2025-02-28 19:47:18
37	last_section_image_url_3	https://dxbitprojects.com/	2025-02-28 19:43:37	2025-02-28 19:47:18
38	last_section_image_url_4	https://dxbitprojects.com/	2025-02-28 19:43:37	2025-02-28 19:47:18
39	last_section_image_url_5	https://dxbitprojects.com/	2025-02-28 19:43:37	2025-02-28 19:47:18
\.


--
-- TOC entry 6609 (class 0 OID 647492)
-- Dependencies: 327
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.likes (id, user_id, product_id, vendor_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6611 (class 0 OID 647499)
-- Dependencies: 329
-- Data for Name: main_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_category (id, name, sub_title, image, button_link, deleted, active, created_at, updated_at, banner_image) FROM stdin;
3	Workshop	BE THE MOST YOU	/uploads/category/67831d3dae7c0_1736645949.webp	https://dxbitprojects.com/handwi/public/	0	1	2025-01-12 01:39:09	2025-01-12 01:39:09	/uploads/category/67831d3daf2e4_1736645949.jpg
2	Handmade	CHILL TO THE MAX	/uploads/category/677f3e646ed54_1736392292.jpg	https://dxbitprojects.com/handwi/public/	0	1	2025-01-09 03:11:32	2025-01-12 01:39:30	/uploads/category/67831d5216f4c_1736645970.jpg
1	Gifts	AHEAD OF THE TREND	/uploads/category/677f3d46352b9_1736392006.jpg	https://dxbitprojects.com/handwi/public/	0	1	2025-01-09 03:06:46	2025-01-12 01:39:44	/uploads/category/67831d60bb6d4_1736645984.jpg
\.


--
-- TOC entry 6613 (class 0 OID 647507)
-- Dependencies: 331
-- Data for Name: maintainance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maintainance (id, title, description, building_type, file, deleted, created_at, updated_at, user_id, status, price, qoutation_file, transaction_id, payment_ref) FROM stdin;
\.


--
-- TOC entry 6615 (class 0 OID 647513)
-- Dependencies: 333
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
293	2025_01_03_060334_add_home_page_to_categories_table	3
294	2025_01_03_062854_add_sub_title_to_categories_table	4
295	2025_01_06_065342_add_home_page_column_to_category_table	5
296	2025_01_06_065824_add_home_page_column_to_category_table	6
297	2025_01_06_070849_add_sub_title_column_to_category_table	7
298	2025_01_06_191158_create_home_logos_table	8
299	2025_01_06_191458_add_deleted_to_home_logos_table	9
300	2025_01_06_192141_add_active_to_home_logos_table	10
301	2025_01_07_141424_create_blogs_table	11
302	2024_03_09_062943_service_dates	12
303	2024_10_12_100000_create_event_features_table	12
304	2024_10_12_100000_create_product_features_table	12
305	2024_10_12_100000_create_product_product_feature_table	12
306	2024_10_12_100000_create_service_event_feature_table	12
307	2025_01_07_062618_create_help_topics_table	12
308	2025_01_07_072131_make_phone_nullable_in_users_table	12
309	2025_01_07_072620_add_is_survey_topic_to_help_topics_table	12
310	2025_01_07_075530_create_currencies_table	12
311	2025_01_07_081018_add_missing_columns_to_stores_table	12
312	2025_01_07_120940_make_fields_nullable_in_stores_table	12
313	2025_01_08_104625_add_tax_address_columns_to_stores_table	12
314	2025_01_08_214128_add_location_to_users_table	12
315	2025_03_19_090713_event_feature_title	12
316	2025_03_19_090713_feature_title	12
317	2025_03_19_090713_product_plocies	12
318	2025_03_19_090713_service25	12
319	2025_03_19_090713_service26	12
320	2025_01_09_024536_create_main_category_table	13
321	2025_01_09_032244_create_web_banners_table	14
322	2025_01_09_034309_create_web_banners_table	15
323	2025_03_19_090713_category22	16
324	2025_03_19_090713_category23	16
325	2025_03_19_090713_product_checks	16
326	2025_01_10_074013_add_two_factor_auth_to_users_table	17
327	2025_01_10_074748_add_additional_fields_to_stores_table	18
328	2025_01_10_080006_add_first_and_last_name_to_stores_table	19
329	2025_01_10_080705_update_vendor_details_columns	20
330	2025_01_09_034309_create_service_booking_table	21
331	2025_01_12_013804_add_banner_image_to_main_category_table	21
332	2025_03_19_090714_Banner1	21
333	2025_03_19_090714_service_booking1	21
334	2025_01_12_014459_add_is_handmade_to_category_table	22
335	2025_01_12_234703_create_service_images_table	23
336	2025_01_13_012752_add_feature_image_to_services_table	24
337	2025_01_13_090236_update_is_handmade_column_in_category_table	25
338	2025_01_13_092050_update_is_handmade_column_nullable_in_category_table	26
339	2025_03_19_090714_service_booking2	26
340	2025_01_09_034309_vendor_follow	27
341	2025_01_16_083825_create_wishlists_table	27
342	2025_03_19_090713_product_plocies2	27
343	2025_01_17_160835_add_name_and_email_to_ratings_table	28
344	2025_01_20_203400_update_subject_nullable_in_contact_us_table	29
345	2025_01_21_051039_add_social_fields_to_contact_us_settings_table	30
346	2025_01_21_054129_create_aboutus_page_setting_table	31
347	2025_02_28_172933_add_heading_to_web_banners_table	32
348	2025_02_28_181050_add_background_image_to_category_table	33
\.


--
-- TOC entry 6617 (class 0 OID 647517)
-- Dependencies: 335
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
-- TOC entry 6619 (class 0 OID 647521)
-- Dependencies: 337
-- Data for Name: moda_sub_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moda_sub_categories (id, main_category, name, gender, image, active, sort_order, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6621 (class 0 OID 647530)
-- Dependencies: 339
-- Data for Name: my_moda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.my_moda (id, user_id, date, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6623 (class 0 OID 647534)
-- Dependencies: 341
-- Data for Name: my_moda_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.my_moda_items (id, my_moda_id, product_id, product_attribute_id, moda_sub_category, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6625 (class 0 OID 647538)
-- Dependencies: 343
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, description, title, image, created_at, updated_at, user_type, user_id) FROM stdin;
\.


--
-- TOC entry 6627 (class 0 OID 647546)
-- Dependencies: 345
-- Data for Name: order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_products (id, order_id, product_id, product_attribute_id, product_type, quantity, price, discount, total, vendor_id, order_status, admin_commission, vendor_commission, shipping_charge) FROM stdin;
2	11	48	15	0	1	12	\N	12	0	0	\N	\N	\N
3	12	48	15	0	1	12	\N	12	0	0	\N	\N	\N
4	13	6	6	0	1	559	\N	559	0	0	\N	\N	\N
5	14	10	10	0	1	12	\N	12	0	0	\N	\N	\N
6	15	49	14	0	1	12	\N	12	0	0	\N	\N	\N
7	16	10	10	0	2	12	\N	24	0	0	\N	\N	\N
8	17	10	10	0	1	12	\N	12	0	0	\N	\N	\N
9	17	13	12	0	3	12	\N	36	0	0	\N	\N	\N
10	17	49	14	0	8	12	\N	96	0	0	\N	\N	\N
\.


--
-- TOC entry 6629 (class 0 OID 647557)
-- Dependencies: 347
-- Data for Name: order_request_view; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_request_view (id, vendor, service_order, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6631 (class 0 OID 647563)
-- Dependencies: 349
-- Data for Name: order_status_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_status_history (id, order_id, status_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6633 (class 0 OID 647569)
-- Dependencies: 351
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, invoice_id, user_id, address_id, total, vat, discount, grand_total, payment_mode, status, booking_date, total_qty, total_items_qty, oder_type, admin_commission, vendor_commission, shipping_charge, created_at, updated_at, is_muted, refund_method, refund_requested, refund_requested_date, order_no, ref_history_id, ref_code, withdraw_status, withdraw_request_at, vendor_id, admin_commission_per, vendor_commission_per, admin_commission_percentage, vendor_commission_percentage, activity_id, order_type, order_number, pick_up_date, pick_up_time, service_charge) FROM stdin;
1	\N	22	0	12	0	0	12	0	1	\N	0	0	0	0	0	0	2025-01-14 04:11:12	2025-02-25 19:09:32	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	0	6785e3e0e70a6			0
2	\N	22	0	12	0	0	12	0	1	\N	0	0	0	0	0	0	2025-01-14 04:15:09	2025-02-25 19:09:32	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	0	6785e4cd57c1d			0
3	\N	22	0	12	0	0	12	0	1	\N	0	0	0	0	0	0	2025-01-14 04:17:26	2025-02-25 19:09:32	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	0	6785e55633017			0
4	\N	22	1	12	0	0	12	0	1	\N	0	0	0	0	0	0	2025-01-14 04:21:09	2025-02-25 19:09:32	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	0	6785e6359c644			0
5	\N	22	1	12	0	0	12	0	1	\N	0	0	0	0	0	0	2025-01-14 04:22:56	2025-02-25 19:09:32	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	0	6785e6a049693			0
6	\N	22	1	12	0	0	12	0	1	\N	0	0	0	0	0	0	2025-01-14 04:26:36	2025-02-25 19:09:32	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	0	6785e77c54991	2025-01-14 04:26:36	04:26	0
7	\N	22	1	12	0	0	12	0	1	\N	0	0	0	0	0	0	2025-01-14 04:30:30	2025-02-25 19:09:32	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	0	6785e86659262	2025-01-14 04:30:30	04:30	0
8	\N	22	1	12	0	0	12	0	1	\N	0	0	0	0	0	0	2025-01-14 04:36:04	2025-02-25 19:09:32	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	1	6785e9b41af7e	2025-01-14 04:36:04	04:36	0
9	\N	22	1	12	0	0	12	0	1	\N	0	0	0	0	0	0	2025-01-14 04:36:23	2025-02-25 19:09:32	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	1	6785e9c75f1d6	2025-01-14 04:36:23	04:36	0
10	\N	22	1	12	0	0	12	0	1	\N	0	0	0	0	0	0	2025-01-14 04:37:34	2025-02-25 19:09:32	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	1	6785ea0eea419	2025-01-14 04:37:34	04:37	0
11	\N	22	1	12	0	0	12	0	1	\N	0	0	0	0	0	0	2025-01-14 04:37:54	2025-02-25 19:09:32	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	1	6785ea22ce657	2025-01-14 04:37:54	04:37	0
12	\N	22	1	12	0	0	12	0	1	\N	0	0	0	0	0	0	2025-01-14 04:44:24	2025-02-25 19:09:32	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	1	6785eba81832f	2025-01-14 04:44:24	04:44	0
13	\N	22	2	559	0	0	559	0	1	\N	0	0	0	0	0	0	2025-01-14 05:00:39	2025-02-25 19:09:32	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	1	6785ef772235f	2025-01-14 05:00:39	05:00	0
14	\N	22	2	12	0	0	12	2	1	\N	0	0	0	0	0	0	2025-01-14 06:57:48	2025-02-25 19:09:32	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	1	67860aecd0190	2025-01-14 06:57:48	06:57	0
15	\N	22	2	12	0	0	12	2	1	\N	0	0	0	0	0	0	2025-01-14 07:00:50	2025-02-25 19:09:32	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	1	67860ba2e4d97	2025-01-14 07:00:50	07:00	0
16	\N	22	2	12	0.6	0	44.6	2	1	\N	0	0	0	0	0	20	2025-01-14 20:05:56	2025-02-25 19:09:32	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	1	6786c3a4bb00d	2025-01-14 20:05:56	20:05	0
17	\N	22	2	36	1.8	0	165.8	2	1	\N	0	0	0	0	0	20	2025-01-15 19:28:02	2025-02-25 19:09:32	0	0	0	\N	\N	0		0	\N	\N	\N	\N	0	0	0	1	67880c4265128	2025-01-15 19:28:02	19:28	0
\.


--
-- TOC entry 6635 (class 0 OID 647601)
-- Dependencies: 353
-- Data for Name: orders_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_services (order_id, invoice_id, user_id, address_id, total, vat, discount, grand_total, payment_mode, status, booking_date, admin_commission, vendor_commission, created_at, updated_at, is_mute, refund_method, refund_requested, refund_accepted, refund_requested_date, refund_accepted_date, order_no, coupon_id, coupon_vender_id, read_admin, accepted_vendor, accepted_date, ref_history_id, ref_code, activity_id, user_latitude, user_longitude, service_charge, task_description, doc) FROM stdin;
\.


--
-- TOC entry 6636 (class 0 OID 647621)
-- Dependencies: 354
-- Data for Name: orders_services_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_services_items (id, order_id, service_id, price, discount, total, order_status, admin_commission, vendor_commission, booking_date, created_at, updated_at, accepted_vendor, accepted_date, text, hourly_rate, task_description, doc, qty, withdraw_status, withdraw_request_at, vat, vendor_comment, vendor_doc) FROM stdin;
\.


--
-- TOC entry 6638 (class 0 OID 647634)
-- Dependencies: 356
-- Data for Name: orders_services_mute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_services_mute (id, vendor_id, service_order_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6641 (class 0 OID 647641)
-- Dependencies: 359
-- Data for Name: orders_services_rejected; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_services_rejected (id, vendor_id, service_order_id, service_order_item_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6643 (class 0 OID 647648)
-- Dependencies: 361
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 6644 (class 0 OID 647653)
-- Dependencies: 362
-- Data for Name: payment_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_report (id, transaction_id, payment_status, user_id, ref_id, amount, method_type, vat, wallet_amount_used, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6646 (class 0 OID 647663)
-- Dependencies: 364
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
\.


--
-- TOC entry 6648 (class 0 OID 647669)
-- Dependencies: 366
-- Data for Name: post_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_comments (id, user_id, post_id, parent_id, comment, created_at, updated_at, comment_node_id) FROM stdin;
\.


--
-- TOC entry 6650 (class 0 OID 647676)
-- Dependencies: 368
-- Data for Name: post_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_likes (id, post_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6652 (class 0 OID 647680)
-- Dependencies: 370
-- Data for Name: post_saves; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_saves (id, post_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6654 (class 0 OID 647684)
-- Dependencies: 372
-- Data for Name: post_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_users (id, post_id, user_id) FROM stdin;
\.


--
-- TOC entry 6656 (class 0 OID 647688)
-- Dependencies: 374
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, user_id, caption, file_type, file, location_name, lattitude, longitude, post_firebase_node_id, created_at, updated_at, active, visibility, extra_file_names) FROM stdin;
\.


--
-- TOC entry 6658 (class 0 OID 647697)
-- Dependencies: 376
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, product_type, product_desc_full, product_desc_short, product_sale_from, product_sale_to, product_featured_image, product_tag, product_created_by, product_updated_by, product_status, product_deleted, product_name, product_variation_type, product_taxable, product_vender_id, product_image, product_unique_iden, product_brand_id, product_name_arabic, product_desc_full_arabic, product_desc_short_arabic, cash_points, offer_enabled, deal_enabled, is_today_offer, today_offer_date, thanku_perc, custom_status, meta_title, meta_keyword, meta_description, product_vendor_status, product_gender, is_kandora, collection_id, hot_offer_enabled, trending_enabled, offers_list, zero_quantity_orders, product_code, product_tags, sort_order, offer_for_short, hot_offer_sort_order, new_trending_sort_order, author_id, deleted, default_category_id, default_attribute_id, created_at, updated_at, brand, store_id, moda_main_category, moda_sub_category, featured, master_product, boxcount, activity_id, recommended, rating_avg, shipment_and_policies, new_arrival, for_you, trending) FROM stdin;
7	2	dsdsa	dsdsa	\N	\N	\N	\N	4	0	1	0	cccxz	1	1	4	\N	149499832	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	0	2024-07-04 15:10:21	\N	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
1	1	Baby shower personalized gift basket, baby Gift Basket Rope Cotton Basket Baby Gift Basket Toy Basket Storage Basket Baby Name Gift	Baby shower personalized gift basket, baby Gift Basket Rope Cotton Basket Baby Gift Basket Toy Basket Storage Basket Baby Name Gift	\N	\N	\N	\N	4	4	1	0	Baby shower personalized gift basket	1	1	4	\N	432347888	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	1	2024-07-02 11:20:49	2024-12-03 13:23:02	\N	0	0	0	1	0	0	7	1	\N	\N	\N	\N	\N
11	1	dscsd	dscsd	\N	\N	\N	\N	4	4	1	0	testttt	1	1	4	\N	887724603	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	0	2024-12-20 17:04:55	2025-01-16 01:58:14	\N	0	0	0	0	0	0	7	0	\N	\N	\N	\N	\N
3	1	Custom Birthstone Bracelet, Initial Bracelet, Unbiological Sister Bracelets Birthstone Jewelry Birthday Gift Friendship Bracelet for Women	Custom Birthstone Bracelet, Initial Bracelet, Unbiological Sister Bracelets Birthstone Jewelry Birthday Gift Friendship Bracelet for Women	\N	\N	\N	\N	4	4	1	0	Custom Birthstone Bracelet, Initial Bracelet	1	1	4	\N	526230169	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	3	2024-07-02 11:38:44	2025-01-16 02:08:49	\N	0	0	0	0	0	0	7	0	\N	\N	\N	\N	\N
18	1	sdasdasda	sdasdasda	\N	\N	\N	\N	4	4	1	0	sadasdasd	1	1	4	\N	384542642	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	11	2024-12-20 17:14:17	2025-01-05 23:53:59	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
19	1	sadas	sadas	\N	\N	\N	\N	5	5	1	0	sadasdasdq	1	1	5	\N	307634217	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	12	2024-12-20 18:09:03	2025-01-05 23:53:18	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
20	2	dsdsa	dsdsa	\N	\N	\N	\N	4	0	1	0	cccxz	1	1	4	\N	149499832	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	0	2024-07-04 15:10:21	\N	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
21	1	asdas	asdas	\N	\N	\N	\N	4	4	1	0	testttt	1	1	4	\N	712180440	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	9	2024-12-20 17:00:11	2025-01-05 23:57:08	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
12	1	sdasdasda	sdasdasda	\N	\N	\N	\N	4	4	1	0	sadasdasd	1	1	4	\N	384542642	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	11	2024-12-20 17:14:17	2025-01-05 23:53:59	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
10	1	asdasd	asdasd	\N	\N	\N	\N	4	4	1	0	testttt	1	1	4	\N	944690816	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	10	2024-12-20 17:01:44	2025-01-05 23:55:43	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
9	1	asdas	asdas	\N	\N	\N	\N	4	4	1	0	testttt	1	1	4	\N	712180440	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	9	2024-12-20 17:00:11	2025-01-05 23:57:08	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
22	1	asdasd	asdasd	\N	\N	\N	\N	4	4	1	0	testttt	1	1	4	\N	944690816	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	10	2024-12-20 17:01:44	2025-01-05 23:55:43	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
2	1	Personalized Baby Name Puzzle with Pegs, First Christmas Gift, Wooden Montessori Toys for Toddler	Personalized Baby Name Puzzle with Pegs, First Christmas Gift, Wooden Montessori Toys for Toddler	\N	\N	\N	\N	4	4	1	0	Personalized Baby Name Puzzle with Pegs, First Christmas Gift, Wooden Montessori Toys for Toddler	1	1	4	\N	679226087	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	2	2024-07-02 11:26:46	2025-01-05 16:19:28	\N	0	0	0	1	0	0	7	1	\N	\N	\N	\N	\N
14	2	dsdsa	dsdsa	\N	\N	\N	\N	4	0	1	0	cccxz	1	1	4	\N	149499832	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	0	2024-07-04 15:10:21	\N	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
23	1	dscsd	dscsd	\N	\N	\N	\N	4	4	1	0	testttt	1	1	4	\N	887724603	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	0	2024-12-20 17:04:55	2025-01-05 23:55:01	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
15	1	asdas	asdas	\N	\N	\N	\N	4	4	1	0	testttt	1	1	4	\N	712180440	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	9	2024-12-20 17:00:11	2025-01-05 23:57:08	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
16	1	asdasd	asdasd	\N	\N	\N	\N	4	4	1	0	testttt	1	1	4	\N	944690816	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	10	2024-12-20 17:01:44	2025-01-05 23:55:43	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
17	1	dscsd	dscsd	\N	\N	\N	\N	4	4	1	0	testttt	1	1	4	\N	887724603	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	0	2024-12-20 17:04:55	2025-01-05 23:55:01	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
24	1	sdasdasda	sdasdasda	\N	\N	\N	\N	4	4	1	0	sadasdasd	1	1	4	\N	384542642	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	11	2024-12-20 17:14:17	2025-01-05 23:53:59	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
25	1	sadas	sadas	\N	\N	\N	\N	5	5	1	0	sadasdasdq	1	1	5	\N	307634217	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	12	2024-12-20 18:09:03	2025-01-05 23:53:18	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
26	2	dsdsa	dsdsa	\N	\N	\N	\N	4	0	1	0	cccxz	1	1	4	\N	149499832	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	0	2024-07-04 15:10:21	\N	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
5	1	Handmade Brown Textured Ceramic Lamp | Bedroom & Livingroom Lightning | Unique, Minimalist Designed	Handmade Brown Textured Ceramic Lamp | Bedroom & Livingroom Lightning | Unique, Minimalist Designed	\N	\N	\N	\N	4	4	1	0	Handmade Brown Textured Ceramic Lamp	1	1	4	\N	683252426	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	5	2024-07-02 11:55:08	2025-01-12 03:20:54	\N	0	0	0	0	0	0	7	0	\N	\N	\N	\N	\N
6	1	Painters Palette, Floral Paint Palette, Botanical decorReal ,Pressed Flowers, Creative Artist Gift, Art lover tool, Mothers Day	Painters Palette, Floral Paint Palette, Botanical decorReal ,Pressed Flowers, Creative Artist Gift, Art lover tool, Mothers Day	\N	\N	\N	\N	4	4	1	0	Painters Palette, Floral Paint Palette	1	1	4	\N	545180046	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	6	2024-07-02 11:56:57	2025-01-12 03:21:20	\N	0	0	0	0	0	0	7	0	\N	\N	\N	\N	\N
8	2	\N	\N	\N	\N	\N	\N	4	4	0	0	ss	1	1	4	\N	121945084	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	8	2024-08-29 15:31:13	2025-01-16 01:52:00	\N	0	0	0	0	0	 	7	0	\N	\N	\N	\N	\N
27	1	asdas	asdas	\N	\N	\N	\N	4	4	1	0	testttt	1	1	4	\N	712180440	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	9	2024-12-20 17:00:11	2025-01-05 23:57:08	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
28	1	asdasd	asdasd	\N	\N	\N	\N	4	4	1	0	testttt	1	1	4	\N	944690816	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	10	2024-12-20 17:01:44	2025-01-05 23:55:43	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
29	1	dscsd	dscsd	\N	\N	\N	\N	4	4	1	0	testttt	1	1	4	\N	887724603	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	0	2024-12-20 17:04:55	2025-01-05 23:55:01	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
30	1	sdasdasda	sdasdasda	\N	\N	\N	\N	4	4	1	0	sadasdasd	1	1	4	\N	384542642	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	11	2024-12-20 17:14:17	2025-01-05 23:53:59	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
31	1	sadas	sadas	\N	\N	\N	\N	5	5	1	0	sadasdasdq	1	1	5	\N	307634217	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	12	2024-12-20 18:09:03	2025-01-05 23:53:18	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
32	2	dsdsa	dsdsa	\N	\N	\N	\N	4	0	1	0	cccxz	1	1	4	\N	149499832	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	0	2024-07-04 15:10:21	\N	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
33	1	asdas	asdas	\N	\N	\N	\N	4	4	1	0	testttt	1	1	4	\N	712180440	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	9	2024-12-20 17:00:11	2025-01-05 23:57:08	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
34	1	asdasd	asdasd	\N	\N	\N	\N	4	4	1	0	testttt	1	1	4	\N	944690816	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	10	2024-12-20 17:01:44	2025-01-05 23:55:43	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
35	1	dscsd	dscsd	\N	\N	\N	\N	4	4	1	0	testttt	1	1	4	\N	887724603	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	0	2024-12-20 17:04:55	2025-01-05 23:55:01	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
36	1	sdasdasda	sdasdasda	\N	\N	\N	\N	4	4	1	0	sadasdasd	1	1	4	\N	384542642	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	11	2024-12-20 17:14:17	2025-01-05 23:53:59	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
37	1	sadas	sadas	\N	\N	\N	\N	5	5	1	0	sadasdasdq	1	1	5	\N	307634217	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	12	2024-12-20 18:09:03	2025-01-05 23:53:18	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
38	2	dsdsa	dsdsa	\N	\N	\N	\N	4	0	1	0	cccxz	1	1	4	\N	149499832	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	0	2024-07-04 15:10:21	\N	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
39	1	asdas	asdas	\N	\N	\N	\N	4	4	1	0	testttt	1	1	4	\N	712180440	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	9	2024-12-20 17:00:11	2025-01-05 23:57:08	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
40	1	asdasd	asdasd	\N	\N	\N	\N	4	4	1	0	testttt	1	1	4	\N	944690816	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	10	2024-12-20 17:01:44	2025-01-05 23:55:43	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
41	1	dscsd	dscsd	\N	\N	\N	\N	4	4	1	0	testttt	1	1	4	\N	887724603	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	0	2024-12-20 17:04:55	2025-01-05 23:55:01	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
42	1	sdasdasda	sdasdasda	\N	\N	\N	\N	4	4	1	0	sadasdasd	1	1	4	\N	384542642	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	11	2024-12-20 17:14:17	2025-01-05 23:53:59	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
43	1	sadas	sadas	\N	\N	\N	\N	5	5	1	0	sadasdasdq	1	1	5	\N	307634217	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	12	2024-12-20 18:09:03	2025-01-05 23:53:18	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
44	2	dsdsa	dsdsa	\N	\N	\N	\N	4	0	1	0	cccxz	1	1	4	\N	149499832	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	0	2024-07-04 15:10:21	\N	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
47	1	dscsd	dscsd	\N	\N	\N	\N	4	4	1	0	testttt	1	1	4	\N	887724603	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	0	2024-12-20 17:04:55	2025-01-12 01:48:02	\N	0	0	0	0	0	0	7	0	\N	\N	1	1	1
48	1	sdasdasda	sdasdasda	\N	\N	\N	\N	4	4	1	0	sadasdasd	1	1	4	\N	384542642	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	11	2024-12-20 17:14:17	2025-01-06 00:05:34	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
46	1	asdasd	asdasd	\N	\N	\N	\N	4	4	1	0	testttt	1	1	4	\N	944690816	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	10	2024-12-20 17:01:44	2025-01-06 00:06:20	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
45	1	asdas	asdas	\N	\N	\N	\N	4	4	1	0	testttt	1	1	4	\N	712180440	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	9	2024-12-20 17:00:11	2025-01-06 00:06:41	\N	0	0	0	1	0	0	7	0	\N	\N	\N	\N	\N
4	1	Personalised 60th Birthday Map Print | Bespoke Favourite Memories Illustration | Personalised Milestone Birthday Gift | 60th Birthday Gift	Personalised 60th Birthday Map Print | Bespoke Favourite Memories Illustration | Personalised Milestone Birthday Gift | 60th Birthday Gift	\N	\N	\N	\N	4	4	1	0	Personalised 60th Birthday Map Print	1	1	4	\N	660606078	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	4	2024-07-02 11:38:59	2025-01-12 03:20:28	\N	0	0	0	0	0	0	7	0	\N	\N	\N	\N	\N
13	1	sadas	sadas	\N	\N	\N	\N	5	5	1	0	sadasdasdq	1	1	5	\N	307634217	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	12	2024-12-20 18:09:03	2025-01-14 01:01:44	\N	0	0	0	0	0	0	7	0	\N	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum	\N	\N	\N
49	1	sadas	sadas	\N	\N	\N	\N	5	5	1	0	sadasdasdq	1	1	5	\N	307634217	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	5	12	2024-12-20 18:09:03	2025-01-16 01:51:25	\N	0	0	0	0	0	0	7	0	\N	\N	1	1	1
\.


--
-- TOC entry 6659 (class 0 OID 647736)
-- Dependencies: 377
-- Data for Name: product_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_attribute (attribute_id, attribute_name, attribute_status, attribute_created_date, attribute_name_arabic, attribute_type, is_deleted) FROM stdin;
1	Size	1	\N		1	0
2	Color	1	\N		1	0
\.


--
-- TOC entry 6661 (class 0 OID 647744)
-- Dependencies: 379
-- Data for Name: product_attribute_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_attribute_values (attribute_values_id, attribute_id, attribute_values, attribute_values_arabic, attribute_value_in, attribute_value_color, attribute_value_label, attribute_value_label_arabic, attribute_value_image, is_deleted, attribute_value_sort_order, attribute_color) FROM stdin;
1	2	Red		1	\N	\N	\N	\N	0	0	#ffffff
2	2	Orange		1	\N	\N	\N	\N	0	0	#ffffff
3	1	XL		1	\N	\N	\N	\N	0	0	#ffffff
\.


--
-- TOC entry 6663 (class 0 OID 647754)
-- Dependencies: 381
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_category (product_category_id, product_id, category_id) FROM stdin;
85	48	5
7	7	1
87	46	5
88	45	5
91	47	5
92	4	1
93	5	3
94	6	3
96	13	5
103	49	5
104	8	1
105	11	5
106	11	1
107	11	4
108	3	1
55	10	1
56	9	1
58	10	1
59	9	1
61	10	1
62	9	1
65	9	1
73	10	5
74	9	5
76	10	5
77	9	5
79	10	5
80	9	5
9	9	5
39	10	5
49	12	3
51	14	5
52	15	5
53	16	5
64	10	5
67	10	5
68	9	5
70	10	5
71	9	5
78	20	5
81	17	5
82	18	5
83	19	5
\.


--
-- TOC entry 6665 (class 0 OID 647760)
-- Dependencies: 383
-- Data for Name: product_cuisines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_cuisines (id, product_id, cuisine_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6667 (class 0 OID 647766)
-- Dependencies: 385
-- Data for Name: product_docs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_docs (id, product_id, title, doc_path) FROM stdin;
\.


--
-- TOC entry 6669 (class 0 OID 647773)
-- Dependencies: 387
-- Data for Name: product_features; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_features (id, name, image_path, description, created_at, updated_at) FROM stdin;
1	Handmade item	17368144906785af9a74b29.png	Handmade item	2025-01-14 00:28:10	2025-01-14 00:28:10
2	Materials:	17368145366785afc86f59b.png	Materials: Gold, Rose gold, Silver, White gold	2025-01-14 00:28:56	2025-01-14 00:29:40
3	Sustainable features	17368146166785b018db322.png	recycled metal. Items may include additional materials or use methods that aren't considered sustainable features on our site.	2025-01-14 00:30:16	2025-01-14 00:30:16
\.


--
-- TOC entry 6672 (class 0 OID 647780)
-- Dependencies: 390
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_images (id, product_id, image_name, product_attribute_id) FROM stdin;
\.


--
-- TOC entry 6674 (class 0 OID 647786)
-- Dependencies: 392
-- Data for Name: product_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_items (item_id, product_id, name, image_path, created_at, updated_at) FROM stdin;
11	13	\N	\N	\N	\N
\.


--
-- TOC entry 6676 (class 0 OID 647793)
-- Dependencies: 394
-- Data for Name: product_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_likes (id, product_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6678 (class 0 OID 647797)
-- Dependencies: 396
-- Data for Name: product_master; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_master (id, name, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6680 (class 0 OID 647805)
-- Dependencies: 398
-- Data for Name: product_master_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_master_request (id, name, description, vendor_id, deleted, accepted, created_at, updated_at, product_type, category) FROM stdin;
\.


--
-- TOC entry 6682 (class 0 OID 647815)
-- Dependencies: 400
-- Data for Name: product_product_feature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_product_feature (id, product_id, product_feature_id, created_at, updated_at, feature_title) FROM stdin;
4	13	1	2025-01-14 01:01:44	2025-01-14 01:01:44	Hand made
5	13	2	2025-01-14 01:01:44	2025-01-14 01:01:44	Material
6	13	3	2025-01-14 01:01:44	2025-01-14 01:01:44	Sustainable Feature
\.


--
-- TOC entry 6684 (class 0 OID 647821)
-- Dependencies: 402
-- Data for Name: product_selected_attribute_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_selected_attribute_list (product_attribute_id, product_id, manage_stock, stock_quantity, allow_back_order, stock_status, sold_individually, weight, length, height, width, shipping_class, sale_price, regular_price, taxable, image, shipping_note, title, rating, rated_users, image_temp, barcode, image_action, pr_code, product_desc, product_full_descr, size_chart) FROM stdin;
1	1	0	67656	0	0	0	\N	\N	\N	\N	0	449	500	1	6683e2918ab971719919249.jpg,6683e2918ae1b1719919249.jpg,6683e2918afcc1719919249.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Baby shower personalized gift basket, baby Gift Basket Rope Cotton Basket Baby Gift Basket Toy Basket Storage Basket Baby Name Gift	Our delicate personalized baby shower rope cotton baskets are designed to add a touch of practicality and organization to your baby's nursery. These delicate baskets are perfect for organizing and storing essential items while adding a personalized touch to your space.\r\nEach basket is carefully crafted with attention to detail, using high-quality cotton rope and feature sturdy handles for easy carrying and convenient usage.\r\nYou can choose to have the baby's name, initials, creating a unique and memorable keepsake.	\N
8	8	0	0	0	0	0	0	0	0	0	0	0	0	1		\N	\N	\N	0	\N		\N				\N
3	3	0	564	0	0	0	\N	\N	\N	\N	0	359	600	1	67886a31c3e871736993329.jpg,67886a31c44731736993329.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Custom Birthstone Bracelet, Initial Bracelet, Unbiological Sister Bracelets Birthstone Jewelry Birthday Gift Friendship Bracelet for Women	Custom Birthstone Bracelet, Initial Bracelet, Unbiological Sister Bracelets Birthstone Jewelry Birthday Gift Friendship Bracelet for Women\r\nKeep your special dates in a unique, elegant and minimalist disc bracelet, embrace your siblings love with this perfect gift. It comes with a high quality plated diamond cut chain, which will shine	\N
18	45	0	\N	0	0	0	\N	\N	\N	\N	0	22	22	1	677b1e91734251736122001.jpg	\N	\N	\N	0	\N	\N	\N	000000000	asdas	\N	\N
4	4	0	445	0	0	0	\N	\N	\N	\N	0	330	500	1	678334fce5dd21736652028.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Personalised 60th Birthday Map Print | Bespoke Favourite Memories Illustration | Personalised Milestone Birthday Gift | 60th Birthday Gift	A totally unique personalised hand-drawn map, illustrated with all of your special memories leading up to that milestone birthday.\r\n\r\nThis makes the perfect gift for loved ones who are celebrating that BIG 60th birthday! Illustrated from scratch, we will hand-draw a 'map' of up to 14 of your favourite memories of that person. Maybe they have been on some amazing holidays with loved ones and have some memorable personal highlights.	\N
11	12	0	12	0	0	0	\N	\N	\N	\N	0	12	12	1	677b1b971e3cf1736121239.jpg,677b1b971e9ba1736121239.jpg,677b1b971f0111736121239.jpg	\N	\N	\N	0	\N	\N	\N	000000000	sdasdasda	asdasda	\N
13	11	0	\N	0	0	0	\N	\N	\N	\N	0	\N	\N	1	678867b6428761736992694.jpg,678867b642f151736992694.jpg,678867b6435091736992694.jpg	\N	\N	\N	0	\N	\N	\N	000000000	dscsd	\N	\N
16	47	0	\N	0	0	0	\N	\N	\N	\N	0	22	22	1	677b1e665e76f1736121958.jpg	\N	\N	\N	0	\N	\N	\N	000000000	dscsd	\N	\N
10	10	0	12	0	0	0	\N	\N	\N	\N	0	12	12	1	677b1bff07a581736121343.jpg,677b1bff080ba1736121343.jpg,677b1bff086b81736121343.jpg,677b1bff08cd61736121343.jpg	\N	\N	\N	0	\N	\N	\N	000000000	asdasd	asdad	\N
2	2	0	54644	0	0	0	\N	\N	\N	\N	0	500	600	1	677ab11085e041736093968.jpg,677ab11086d011736093968.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Personalized Baby Name Puzzle with Pegs, First Christmas Gift, Wooden Montessori Toys for Toddler	Looking for Personalized Baby Name Puzzle with Pegs, First Christmas Gift idea or any other day of the year? Here it's - the pastel name puzzle is a simple and nice toy for kids that helps them develop motor skills, starting to speak and compose their first own words with their parents.	\N
6	6	0	456	0	0	0	\N	\N	\N	\N	0	559	600	1	67833530e0b881736652080.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Painters Palette, Floral Paint Palette, Botanical decorReal ,Pressed Flowers, Creative Artist Gift, Art lover tool, Mothers Day	High-quality dried flowers: Our natural dried flowers are organic, non-toxic and tasteless.\r\nA resin palette is the ideal addition to your creative equipment, as resin is relatively easy to clean (though it is advisable to clean while the paint is wet - as you’ll need less water and time). Transparent resin also provides us with an excellent canvas to decorate for your aesthetic pleasure. This, in turn, allows you to paint your own canvas with beautiful equipment at hand.	\N
5	5	0	6544	0	0	0	\N	\N	\N	\N	0	250	400	1	678335169a8601736652054.jpg	\N	\N	\N	0	\N	\N	\N	000000000	Handmade Brown Textured Ceramic Lamp | Bedroom & Livingroom Lightning | Unique, Minimalist Designed	"Rocca Lamp" This piece will bring the minimalist attitude of nature into your home.\r\n•This unique ceramic lamp is made from high quality brown stoneware clay using hand building techniques only. Fired at high temperature (1240°C)\r\n•Will add value to your home with its organic texture and minimalist shape.	\N
9	9	0	12	0	0	0	\N	\N	\N	\N	0	12	12	1	677b1c54dedcf1736121428.jpg,677b1c54df3b91736121428.jpg,677b1c54dfa0f1736121428.jpg	\N	\N	\N	0	\N	\N	\N	000000000	asdas	ada	\N
15	48	0	2	0	0	0	\N	\N	\N	\N	0	12	12	1	677b1e4ec3f841736121934.jpg	\N	\N	\N	0	\N	\N	\N	000000000	sdasdasda	\N	\N
17	46	0	22	0	0	0	\N	\N	\N	\N	0	22	22	1	677b1e7cac1b81736121980.jpg	\N	\N	\N	0	\N	\N	\N	000000000	asdasd	\N	\N
14	49	0	12	0	0	0	\N	\N	\N	\N	0	12	12	1	677b1e0ec70cb1736121870.jpg,677d5ce525d401736269029.jpg,677d5ce5265f01736269029.jpg	\N	\N	\N	0	\N	\N	\N	000000000	sadas	\N	\N
12	13	0	21	0	0	0	\N	\N	\N	\N	0	12	12	1	677b1b6ea95d41736121198.jpg,677b1b6ea9e7e1736121198.jpg	\N	\N	\N	0	\N	\N	\N	000000000	sadas	asda	\N
7	8	0	0	0	0	0	0	0	0	0	0	0	0	1	6788664028c9f1736992320.jpg,67886640293cb1736992320.jpg,6788664029a011736992320.jpg	\N	\N	\N	0	\N		\N				\N
\.


--
-- TOC entry 6686 (class 0 OID 647835)
-- Dependencies: 404
-- Data for Name: product_selected_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_selected_attributes (product_selected_attributes_id, attribute_id, attribute_values_id, product_id) FROM stdin;
1	2	1	8
2	2	2	8
\.


--
-- TOC entry 6688 (class 0 OID 647842)
-- Dependencies: 406
-- Data for Name: product_specifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_specifications (prod_spec_id, product_id, spec_title, spec_descp, lang, spec_title_arabic, spec_descp_arabic) FROM stdin;
1	7	\N	\N	1	\N	\N
2	7	\N	\N	1	\N	\N
4	1	Test	Test Unit	1	\N	\N
16	12	\N	\N	1	\N	\N
17	12	\N	\N	1	\N	\N
21	13	\N	\N	1	\N	\N
22	13	\N	\N	1	\N	\N
23	13	\N	\N	1	\N	\N
\.


--
-- TOC entry 6690 (class 0 OID 647850)
-- Dependencies: 408
-- Data for Name: product_temp_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_temp_image (id, product_id, product_attribute_id, image, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6692 (class 0 OID 647858)
-- Dependencies: 410
-- Data for Name: product_variations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variations (product_variations_id, attribute_id, attribute_values_id, product_attribute_id, product_id) FROM stdin;
1	2	1	7	8
2	2	2	8	8
\.


--
-- TOC entry 6694 (class 0 OID 647866)
-- Dependencies: 412
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, product_type, name, active, deleted, created_by, updated_by, company_id, store_id, description, featured, meta_title, meta_description, meta_keywords, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6696 (class 0 OID 647880)
-- Dependencies: 414
-- Data for Name: promotion_banners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotion_banners (id, title, image_name, status, created_at, updated_at, url, type, product, service, banner_type, activity, store, category) FROM stdin;
\.


--
-- TOC entry 6698 (class 0 OID 647894)
-- Dependencies: 416
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings (id, type, user_id, product_id, product_varient_id, service_id, vendor_id, rating, title, comment, created_at, updated_at, order_id, name, email) FROM stdin;
1	0	0	49	1	0	0	5	test	\N	2025-01-17 16:10:49	2025-01-17 16:10:49	0	test	test@gmail.com
2	0	0	49	1	0	0	5	test	test	2025-01-17 16:21:21	2025-01-17 16:21:21	0	test	test@gmail.com
3	0	0	49	1	0	0	5	test	test	2025-01-17 16:21:46	2025-01-17 16:21:46	0	test	test@gmail.com
4	0	1	49	1	0	0	5	test	test	2025-01-17 16:24:36	2025-01-17 16:24:36	0	test	test@gmail.com
5	1	1	49	1	0	0	5	test	test	2025-01-17 16:29:16	2025-01-17 16:29:16	0	test	test@gmail.com
6	1	0	49	1	0	0	5	test	test	2025-01-17 16:30:01	2025-01-17 16:30:01	0	test	test@gmail.com
7	1	1	49	1	0	0	1	Soluta saepe at volu	Et possimus veniam	2025-01-17 16:36:05	2025-01-17 16:36:05	0	Lisandra Hull	bepokyjuhe@mailinator.com
8	1	0	49	1	0	0	4	In elit exercitatio	Est reprehenderit p	2025-01-17 16:39:31	2025-01-17 16:39:31	0	Kirby Armstrong	juratusyh@mailinator.com
9	3	1	0	0	9	0	4	testt	testttt	2025-01-17 16:46:19	2025-01-17 16:46:19	0	test	test@gmail.com
10	3	1	0	0	8	0	4	Amet assumenda quid	Incididunt sit ratio	2025-01-17 16:48:54	2025-01-17 16:48:54	0	Lamar Morales	gaked@mailinator.com
11	1	0	49	1	0	0	1	Eius est nisi est a	Doloribus et nesciun	2025-01-18 16:21:37	2025-01-18 16:21:37	0	Riley Levine	decaziloz@mailinator.com
12	3	0	0	0	3	0	2	Similique dolores re	Consequatur Maxime	2025-01-18 16:26:33	2025-01-18 16:26:33	0	Palmer Brady	qicy@mailinator.com
13	3	0	0	0	3	0	5	Quae ut quaerat mini	Similique labore qui	2025-01-18 16:26:51	2025-01-18 16:26:51	0	Willow Hanson	gogory@mailinator.com
14	1	1	45	1	0	0	5	Reprehenderit dolore	Ipsa totam est Nam	2025-01-20 21:42:35	2025-01-20 21:42:35	0	Kamal Hall	hodugo@mailinator.com
15	1	1	12	1	0	0	4	Ut eaque labore et e	Cillum vitae qui nul	2025-01-20 21:57:19	2025-01-20 21:57:19	0	Mohammad Carrillo	jebuhazitu@mailinator.com
16	1	1	12	1	0	0	5	sdasdasdasd	asdadadasd	2025-01-20 22:01:08	2025-01-20 22:01:08	0	Admin	admin@admin.com
17	1	1	47	1	0	0	4	asdad	adasdadas	2025-01-20 22:02:33	2025-01-20 22:02:33	0	Admin	admin@admin.com
\.


--
-- TOC entry 6700 (class 0 OID 647907)
-- Dependencies: 418
-- Data for Name: ratings_reply; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings_reply (id, rating_id, message, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6702 (class 0 OID 647915)
-- Dependencies: 420
-- Data for Name: ref_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_history (id, sender_id, accepted_user_id, name, ref_code, status, discount, discount_type, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6704 (class 0 OID 647926)
-- Dependencies: 422
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service (id, name, image, service_price, active, deleted, "order", description, created_at, updated_at, included, service_user_id, building_type, service_type, contract_type, duration, building_type_id, "time", document, order_count, service_price_type, activity_id, price_label, sort_order, from_date, to_date, seats, term_and_condition, work_shop_details, to_time, from_time, location, latitude, longitude, vendor_id, feature_image) FROM stdin;
7	Pottery Workshop 3	17366551476783412b8c490.jpg	2000	1	0	0	\N	2025-01-12 04:12:27	2025-01-13 00:35:39	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-19	2025-01-17	20	<h4 class="pt-2 text-uppercase">Terms</h4>\r\n                                <ul>\r\n                                    <li>Dispatch: Within 24 Hours</li>\r\n                                    <li>Free shipping across all products on a minimum purchase of $50.</li>\r\n                                    <li>International delivery time - 7-10 business days</li>\r\n                                    <li>Cash on delivery might be available</li>\r\n                                    <li>Easy 30 days returns and exchanges</li>\r\n                                </ul>\r\n                                <h4 class="pt-2 text-uppercase">Policy</h4>\r\n                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>	\N	09:10	09:10	73 Financial Center Rd - Downtown Dubai - Dubai - United Arab Emirates	25.1972295	55.27974699999999	4	173673212767846ddf18c65.jpg
9	Pottery Workshop1	17366551476783412b8c490.jpg	2000	1	0	0	\N	2025-01-12 04:12:27	2025-01-15 11:38:29	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-19	2025-01-17	20	<h4 class="pt-2 text-uppercase">Terms</h4>\r\n                                <ul>\r\n                                    <li>Dispatch: Within 24 Hours</li>\r\n                                    <li>Free shipping across all products on a minimum purchase of $50.</li>\r\n                                    <li>International delivery time - 7-10 business days</li>\r\n                                    <li>Cash on delivery might be available</li>\r\n                                    <li>Easy 30 days returns and exchanges</li>\r\n                                </ul>\r\n                                <h4 class="pt-2 text-uppercase">Policy</h4>\r\n                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>	\N	09:10	09:10	73 Financial Center Rd - Downtown Dubai - Dubai - United Arab Emirates	25.1972295	55.27974699999999	\N	\N
3	Pottery Workshop	17366551476783412b8c490.jpg	2000	1	0	0	\N	2025-01-12 04:12:27	2025-01-12 04:15:34	\N	\N	\N	\N	\N	0	\N	\N	\N	0	Hourly	0	\N	0	2025-01-19	2025-01-30	20	<h4 class="pt-2 text-uppercase">Terms</h4>\r\n                                <ul>\r\n                                    <li>Dispatch: Within 24 Hours</li>\r\n                                    <li>Free shipping across all products on a minimum purchase of $50.</li>\r\n                                    <li>International delivery time - 7-10 business days</li>\r\n                                    <li>Cash on delivery might be available</li>\r\n                                    <li>Easy 30 days returns and exchanges</li>\r\n                                </ul>\r\n                                <h4 class="pt-2 text-uppercase">Policy</h4>\r\n                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>	\N	09:10	09:10	73 Financial Center Rd - Downtown Dubai - Dubai - United Arab Emirates	25.1972295	55.27974699999999	\N	173673212767846ddf18c65.jpg
8	Pottery Workshop 2	17366551476783412b8c490.jpg	2000	1	0	0	\N	2025-01-12 04:12:27	2025-01-15 11:40:03	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-19	2025-01-17	20	<h4 class="pt-2 text-uppercase">Terms</h4>\r\n                                <ul>\r\n                                    <li>Dispatch: Within 24 Hours</li>\r\n                                    <li>Free shipping across all products on a minimum purchase of $50.</li>\r\n                                    <li>International delivery time - 7-10 business days</li>\r\n                                    <li>Cash on delivery might be available</li>\r\n                                    <li>Easy 30 days returns and exchanges</li>\r\n                                </ul>\r\n                                <h4 class="pt-2 text-uppercase">Policy</h4>\r\n                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>	\N	09:10	09:10	73 Financial Center Rd - Downtown Dubai - Dubai - United Arab Emirates	25.1972295	55.27974699999999	\N	\N
1	Pottery Workshop	17366551476783412b8c490.jpg	2000	1	0	0	\N	2025-01-12 04:12:27	2025-01-12 04:15:34	\N	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	0	2025-01-19	2025-01-30	20	<h4 class="pt-2 text-uppercase">Terms</h4>\r\n                                <ul>\r\n                                    <li>Dispatch: Within 24 Hours</li>\r\n                                    <li>Free shipping across all products on a minimum purchase of $50.</li>\r\n                                    <li>International delivery time - 7-10 business days</li>\r\n                                    <li>Cash on delivery might be available</li>\r\n                                    <li>Easy 30 days returns and exchanges</li>\r\n                                </ul>\r\n                                <h4 class="pt-2 text-uppercase">Policy</h4>\r\n                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>	\N	09:10	09:10	73 Financial Center Rd - Downtown Dubai - Dubai - United Arab Emirates	25.1972295	55.27974699999999	\N	173673212767846ddf18c65.jpg
4	Pottery Workshop	17366551476783412b8c490.jpg	2000	1	0	0	\N	2025-01-12 04:12:27	2025-01-12 04:15:34	\N	\N	\N	\N	\N	0	\N	\N	\N	0	Hourly	0	\N	0	2025-01-19	2025-01-17	20	<h4 class="pt-2 text-uppercase">Terms</h4>\r\n                                <ul>\r\n                                    <li>Dispatch: Within 24 Hours</li>\r\n                                    <li>Free shipping across all products on a minimum purchase of $50.</li>\r\n                                    <li>International delivery time - 7-10 business days</li>\r\n                                    <li>Cash on delivery might be available</li>\r\n                                    <li>Easy 30 days returns and exchanges</li>\r\n                                </ul>\r\n                                <h4 class="pt-2 text-uppercase">Policy</h4>\r\n                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>	\N	09:10	09:10	73 Financial Center Rd - Downtown Dubai - Dubai - United Arab Emirates	25.1972295	55.27974699999999	\N	173673212767846ddf18c65.jpg
5	Pottery Workshop	17366551476783412b8c490.jpg	2000	1	0	0	\N	2025-01-12 04:12:27	2025-01-12 04:15:34	\N	\N	\N	\N	\N	0	\N	\N	\N	0	Hourly	0	\N	0	2025-01-19	2025-01-17	20	<h4 class="pt-2 text-uppercase">Terms</h4>\r\n                                <ul>\r\n                                    <li>Dispatch: Within 24 Hours</li>\r\n                                    <li>Free shipping across all products on a minimum purchase of $50.</li>\r\n                                    <li>International delivery time - 7-10 business days</li>\r\n                                    <li>Cash on delivery might be available</li>\r\n                                    <li>Easy 30 days returns and exchanges</li>\r\n                                </ul>\r\n                                <h4 class="pt-2 text-uppercase">Policy</h4>\r\n                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>	\N	09:10	09:10	73 Financial Center Rd - Downtown Dubai - Dubai - United Arab Emirates	25.1972295	55.27974699999999	\N	173673212767846ddf18c65.jpg
6	Pottery Workshop	17366551476783412b8c490.jpg	2000	1	0	0	\N	2025-01-12 04:12:27	2025-01-12 04:15:34	\N	\N	\N	\N	\N	0	\N	\N	\N	0	Hourly	0	\N	0	2025-01-19	2025-01-17	20	<h4 class="pt-2 text-uppercase">Terms</h4>\r\n                                <ul>\r\n                                    <li>Dispatch: Within 24 Hours</li>\r\n                                    <li>Free shipping across all products on a minimum purchase of $50.</li>\r\n                                    <li>International delivery time - 7-10 business days</li>\r\n                                    <li>Cash on delivery might be available</li>\r\n                                    <li>Easy 30 days returns and exchanges</li>\r\n                                </ul>\r\n                                <h4 class="pt-2 text-uppercase">Policy</h4>\r\n                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>	\N	09:10	09:10	73 Financial Center Rd - Downtown Dubai - Dubai - United Arab Emirates	25.1972295	55.27974699999999	\N	173673212767846ddf18c65.jpg
2	Pottery Workshop	17366551476783412b8c490.jpg	2000	1	0	0	\N	2025-01-12 04:12:27	2025-01-12 04:15:34	\N	\N	\N	\N	\N	0	\N	\N	\N	0	Hourly	0	\N	0	2025-01-19	2025-01-30	20	<h4 class="pt-2 text-uppercase">Terms</h4>\r\n                                <ul>\r\n                                    <li>Dispatch: Within 24 Hours</li>\r\n                                    <li>Free shipping across all products on a minimum purchase of $50.</li>\r\n                                    <li>International delivery time - 7-10 business days</li>\r\n                                    <li>Cash on delivery might be available</li>\r\n                                    <li>Easy 30 days returns and exchanges</li>\r\n                                </ul>\r\n                                <h4 class="pt-2 text-uppercase">Policy</h4>\r\n                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>	\N	09:10	09:10	73 Financial Center Rd - Downtown Dubai - Dubai - United Arab Emirates	25.1972295	55.27974699999999	\N	173673212767846ddf18c65.jpg
\.


--
-- TOC entry 6705 (class 0 OID 647939)
-- Dependencies: 423
-- Data for Name: service_assigned_vendors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_assigned_vendors (id, vendor_user_id, order_id, service_status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6707 (class 0 OID 647944)
-- Dependencies: 425
-- Data for Name: service_bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_bookings (id, service_id, user_id, vendor_id, seat_no, status, payment_type, price, service_charge, "Workshop_price", tax, grand_total, ref_id, created_at, updated_at, number_of_seats, order_number) FROM stdin;
1	7	22	0	1,2,3	confirmed	1	2000	\N	\N	100	6300	\N	2025-01-14 17:18:38	2025-01-14 17:18:38	3	67869c6ea72e4
2	7	22	0	1,2,3,4	confirmed	1	2000	\N	\N	100	8400	\N	2025-01-14 17:20:11	2025-01-14 17:20:11	4	67869ccbbd6d5
3	7	22	0	2,3,1	confirmed	1	2000	\N	\N	100	6300	\N	2025-01-14 17:23:56	2025-01-14 17:23:56	3	67869dac1283f
4	7	22	0	5,6,7,8	confirmed	1	2000	\N	\N	100	8400	\N	2025-01-15 19:15:18	2025-01-15 19:15:18	4	6788094635d35
5	8	22	0	1,2,3	confirmed	1	2000	\N	\N	100	6300	\N	2025-01-16 11:53:53	2025-01-16 11:53:53	3	6788f3515e28e
6	4	22	0	18,17,16,15,14,13,7,8,9,10	confirmed	1	2000	\N	\N	1000	21000	\N	2025-01-16 11:56:00	2025-01-16 11:56:00	10	6788f3d0cfea9
\.


--
-- TOC entry 6709 (class 0 OID 647954)
-- Dependencies: 427
-- Data for Name: service_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_category (id, name, image, banner_image, parent_id, active, deleted, "order", description, created_at, updated_at, activity_id, sort_order) FROM stdin;
\.


--
-- TOC entry 6711 (class 0 OID 647966)
-- Dependencies: 429
-- Data for Name: service_category_selected; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_category_selected (id, service_id, category_id) FROM stdin;
\.


--
-- TOC entry 6713 (class 0 OID 647972)
-- Dependencies: 431
-- Data for Name: service_event_feature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_event_feature (id, service_id, event_feature_id, created_at, updated_at, feature_title) FROM stdin;
1	1	1	2025-01-12 04:15:34	2025-01-12 04:15:34	Testtt
2	1	1	2025-01-12 04:15:34	2025-01-12 04:15:34	Test
9	9	1	2025-01-13 01:35:27	2025-01-13 01:35:27	feature 3
\.


--
-- TOC entry 6716 (class 0 OID 647979)
-- Dependencies: 434
-- Data for Name: service_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_images (id, service_id, image, created_at, updated_at) FROM stdin;
7	9	173672774767845cc3067e3.jpg	2025-01-13 00:22:27	2025-01-13 00:22:27
8	9	173672774767845cc30936d.jpg	2025-01-13 00:22:27	2025-01-13 00:22:27
9	9	173672774767845cc309cf2.jpg	2025-01-13 00:22:27	2025-01-13 00:22:27
10	8	173672851867845fc63b37a.jpg	2025-01-13 00:35:18	2025-01-13 00:35:18
11	7	173672853967845fdbcd826.jpg	2025-01-13 00:35:39	2025-01-13 00:35:39
\.


--
-- TOC entry 6718 (class 0 OID 647983)
-- Dependencies: 436
-- Data for Name: service_include; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_include (id, service_id, title, description, icon, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6720 (class 0 OID 647989)
-- Dependencies: 438
-- Data for Name: service_order_status_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_order_status_history (id, order_id, order_item_id, status_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6722 (class 0 OID 647996)
-- Dependencies: 440
-- Data for Name: service_timings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_timings (id, vendor_id, has_24_hour, service_id, day, time_from, time_to, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6724 (class 0 OID 648005)
-- Dependencies: 442
-- Data for Name: service_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_type (id, name, description, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6726 (class 0 OID 648011)
-- Dependencies: 444
-- Data for Name: service_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_types (id, name, status, deleted, sort_order, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6728 (class 0 OID 648018)
-- Dependencies: 446
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, admin_commission, shipping_charge, created_at, updated_at, tax_percentage, store_radius, service_radius, service_charge) FROM stdin;
1	0	20	\N	\N	5	20	20	0
\.


--
-- TOC entry 6730 (class 0 OID 648026)
-- Dependencies: 448
-- Data for Name: skin_colors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skin_colors (id, name, color, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6732 (class 0 OID 648032)
-- Dependencies: 450
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.states (id, name, active, country_id, created_uid, updated_uid, deleted, created_at, updated_at) FROM stdin;
1	dubai	1	1	1	\N	0	\N	\N
\.


--
-- TOC entry 6734 (class 0 OID 648038)
-- Dependencies: 452
-- Data for Name: store_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_images (id, image, store_id) FROM stdin;
\.


--
-- TOC entry 6736 (class 0 OID 648044)
-- Dependencies: 454
-- Data for Name: store_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_likes (id, store_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6738 (class 0 OID 648048)
-- Dependencies: 456
-- Data for Name: store_managers_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_managers_types (id, name, created_at, updated_at, vendor_id) FROM stdin;
\.


--
-- TOC entry 6740 (class 0 OID 648054)
-- Dependencies: 458
-- Data for Name: store_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_type (id, name, banner_image, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6742 (class 0 OID 648062)
-- Dependencies: 460
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stores (id, vendor_id, industry_type, store_name, business_email, dial_code, mobile, description, location, latitude, longitude, address_line1, address_line2, country_id, state_id, city_id, zip, logo, cover_image, license_number, license_doc, vat_cert_number, vat_cert_doc, active, verified, deleted, created_uid, updated_uid, created_at, updated_at, commission, tax_number, tax_street, tax_address_line_2, tax_city, tax_state, tax_post_code, tax_phone, bank_country, tax_seller_type, residence_country, dob_day, dob_month, dob_year, shop_currency, shop_language, first_name, last_name) FROM stdin;
2	23	0	Kelsie	burosut@mailinator.com	\N	\N	Recusandae Quas ess	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/kuLTxN5oS3EUoJwf7a3WTUl4MTETBrUrCHRe3r45.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-09 14:58:58	2025-01-09 14:58:58	\N	324235345345342	sdadad	sdasads	asdada	test	231231	123123132133231	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	23	0	Kelsie	burosut@mailinator.com	\N	\N	Recusandae Quas ess	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/XexZ8kdlfAjefCQiFciOD3UXeyABobo9kV7Zt3mg.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-09 14:59:02	2025-01-09 14:59:02	\N	324235345345342	sdadad	sdasads	asdada	test	231231	123123132133231	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	25	0	Chaim	savacotu@mailinator.com	\N	\N	Est magnam quo veri	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/8B7EMDdPPCUDgNga1HaU5muzAEv8auWbd3He3b6Z.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-09 16:38:27	2025-01-09 16:38:27	\N	324234234234232	Prescott	Brady	August	312312	232342	342342342342342	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	28	0	Sonia	qegywav@mailinator.com	\N	\N	Et sed recusandae E	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/PzL4QZ2WtxCSD4rvBwRWJhoRCFdd2Mtc1ADBj5Pr.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-10 08:19:29	2025-01-10 08:19:29	\N	588342342342342	Rayasdasdasasdas	Kirsten	Penelope	Denton	232313	231312312312312	1	1	1	\N	\N	\N	aed	Arabic	Hedwig	Rinah
6	29	0	asdasasda	vudof@mailinator.com	\N	\N	asdasadasdasdas	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/KvaPTlxcrvoQCMAd0BtuTjj4TJgeAtAskKoCIZXL.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-10 09:17:31	2025-01-10 09:17:31	\N	\N	\N	\N	\N	\N	\N	\N	1	2	1	\N	\N	\N	aed	Arabic	asdasd	asdsa
7	30	0	Lamar Ware	lywumaz@mailinator.com	\N	\N	\N	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/58KvswIr6s4zstO2Va8uCtMyQBbMJ2n3R2IjflGh.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-10 15:27:35	2025-01-10 15:27:35	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	\N	aed	French	Serina	Boyd
8	31	0	Wendy Rios	wavuqajyh@mailinator.com	\N	\N	\N	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/anOkUpvmAGyFaF2Dw0eETqxe87jUM2sp00eASTQC.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-10 15:33:00	2025-01-10 15:33:00	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	\N	aed	French	Shaeleigh	Mcdonald
9	32	0	Dexter Payne	sovyx@mailinator.com	\N	\N	\N	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/TzXGOXhHN61xNc81eBw1RKJQzQHQffeCP3dGL9sc.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-10 15:40:33	2025-01-10 15:40:33	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	\N	aed	Spanish	Zachery	Herring
10	33	0	August Stokes	tihat@mailinator.com	\N	\N	\N	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/U1xGp2R56jA2t4StFLMkUJHejvcn9y5h2yL7Zdr3.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-10 15:59:09	2025-01-10 15:59:09	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	\N	aed	French	Kirsten	Meyers
11	34	0	Rylee Waters	pyfolymep@mailinator.com	\N	\N	\N	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/j3TKm5xiNU4iOTOmyzmfP6ctBLwzOJ5m8BNHGLc1.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-15 07:44:37	2025-01-15 07:44:37	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	1	25	1	1995	aed	French	Lara	\N
12	35	0	Hamilton Sanders	bupud@mailinator.com	\N	\N	Deserunt dolore labosad	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/4AwrJAirJApR0CsCq6AwTPZA36yXmdH0rQnay41w.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-15 08:54:51	2025-01-15 08:54:51	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	1	15	5	1972	aed	Arabic	Chastity	\N
13	37	0	Chanda Sims	lolygubuz@mailinator.com	\N	\N	Quis ad est iste dolasd	Ad dolor ad minim qu	\N	\N	\N	\N	1	1	1	242342	logos/HvO3cVEjvytjTrDeyeOT3oXN1QncQ2J0OTJSrHGz.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-15 09:15:00	2025-01-15 09:15:00	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	1	7	1	2006	aed	Spanish	\N	\N
14	38	0	Chanda Sims	lolygubu1z@mailinator.com	\N	\N	Quis ad est iste dolasd	Ad dolor ad minim qu	\N	\N	\N	\N	1	1	1	242342	logos/IPW0EbjLoBtJ48Tsbv01MgT8lsoWReDDORHVC9XT.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-15 09:17:15	2025-01-15 09:17:15	\N	817234234234234	Ut officia aut quod	Laudantium quos Nam	Duis rerum unde repu	Quas incididunt mini	242342	131974214463424	1	\N	1	7	1	2006	aed	Spanish	\N	\N
15	39	0	Chanda Sims	lolygubu1z1@mailinator.com	\N	\N	Quis ad est iste dolasd	Ad dolor ad minim qu	\N	\N	\N	\N	1	1	1	242342	logos/2KamqdidWrrDfDHCmJ2zDAqWVKx40y5FD5tnpsvc.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-15 09:19:37	2025-01-15 09:19:37	\N	817234234234234	Ut officia aut quod	Laudantium quos Nam	Duis rerum unde repu	Quas incididunt mini	242342	131974214463424	1	\N	1	7	1	2006	aed	Spanish	\N	\N
16	40	0	Chanda Sims	lolygubu1z12@mailinator.com	\N	\N	Quis ad est iste dolasd	Ad dolor ad minim qu	\N	\N	\N	\N	1	1	1	242342	logos/GgBSVQtjveJDnz2RLEFQBCoUoPIz82nYYCinQK7Q.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-15 09:20:30	2025-01-15 09:20:30	\N	817234234234234	Ut officia aut quod	Laudantium quos Nam	Duis rerum unde repu	Quas incididunt mini	242342	131974214463424	1	\N	1	7	1	2006	aed	Spanish	\N	\N
17	41	0	Maris Bray	jyruhypuq@mailinator.com	\N	\N	Qui saepe dolores co	Optio dolore rerum	\N	\N	\N	\N	1	1	1	342342	\N	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-15 09:53:36	2025-01-15 09:53:36	\N	959324234234234	Nesciunt non autem	Voluptas fugiat eiu	Labore totam cillum	Irure non rerum quae	324234	234234234234234	1	\N	1	28	5	1975	aed	Arabic	Dolan	Dawson
1	22	0	Kelsie	burosut@mailinator.com	\N	\N	Recusandae Quas ess	Unknown	\N	\N	\N	\N	1	\N	\N	\N	logos/tQUaCspiyxEWRJEcTyZXeNpAZiob8KTFMCWA61rv.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-09 14:58:52	2025-01-09 14:58:52	\N	324235345345342	sdadad	sdasads	asdada	test	231231	123123132133231	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	4	0	Carol Larson	qitaponuh@mailinator.com	\N	\N	Sunt veritatis do ex	Autem sunt aut repre	\N	\N	\N	\N	1	1	1	242342	logos/BQQsXxqK9QB7jRS3ERIp5zNTS4srZP9qySfF6qfO.png	\N	\N	\N	\N	\N	1	0	0	\N	\N	2025-01-15 10:10:58	2025-01-15 10:10:58	\N	932342342342342	Sed eius in aspernat	Voluptate amet sint	Quae voluptas volupt	Consequatur dolor co	242342	121941735822342	1	\N	1	9	9	1998	aed	Arabic	Elton	Keith
\.


--
-- TOC entry 6744 (class 0 OID 648072)
-- Dependencies: 462
-- Data for Name: subscribers_emails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscribers_emails (id, email, created_at, updated_at) FROM stdin;
1	test@gmail.com	\N	\N
2	test1@gmail.com	\N	\N
3	soto@mailinator.com	\N	\N
4	test123@gmail.com	\N	\N
\.


--
-- TOC entry 6746 (class 0 OID 648076)
-- Dependencies: 464
-- Data for Name: temp_order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_order_products (id, order_id, product_id, product_attribute_id, product_type, quantity, price, discount, total, vendor_id, admin_commission, vendor_commission, shipping_charge) FROM stdin;
\.


--
-- TOC entry 6748 (class 0 OID 648086)
-- Dependencies: 466
-- Data for Name: temp_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_orders (id, invoice_id, user_id, address_id, total, vat, discount, grand_total, payment_mode, admin_commission, vendor_commission, shipping_charge, temp_id, ref_history_id, ref_code, admin_commission_percentage, vendor_commission_percentage, order_type, pick_up_date, pick_up_time, service_charge) FROM stdin;
\.


--
-- TOC entry 6750 (class 0 OID 648110)
-- Dependencies: 468
-- Data for Name: temp_service_order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_service_order_items (id, order_id, service_id, price, discount, total, admin_commission, vendor_commission, booking_date, text, hourly_rate, task_description, doc, qty, vat) FROM stdin;
\.


--
-- TOC entry 6752 (class 0 OID 648121)
-- Dependencies: 470
-- Data for Name: temp_service_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_service_orders (id, invoice_id, user_id, address_id, total, vat, discount, grand_total, payment_mode, admin_commission, vendor_commission, temp_id, booking_date, coupon_id, ref_history_id, ref_code, user_latitude, user_longitude, service_charge, task_description, doc) FROM stdin;
\.


--
-- TOC entry 6754 (class 0 OID 648133)
-- Dependencies: 472
-- Data for Name: temp_user_account_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_user_account_types (id, temp_user_id, account_type_id, activity_type_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6756 (class 0 OID 648137)
-- Dependencies: 474
-- Data for Name: temp_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_users (id, name, email, dial_code, phone, phone_verified, active, email_verified, password, email_verified_at, role, first_name, last_name, user_image, user_phone_otp, user_email_otp, user_device_token, user_device_type, user_access_token, firebase_user_key, device_cart_id, created_at, updated_at) FROM stdin;
1	Aamir 	aamir.dxbapps@gmail.com	92	302806688	0	1	1	$2y$10$HqvpWV9Zh89mt0oi5wGSR.g3PTUfS9bMvc/AdcQ3eOuB2TjCd4O5i	2024-11-30 10:15:05	2	Aamir	\N		1111	1111	{{fcm_token}}	{{device_type}}	\N	\N	cart_a	2024-11-30 05:18:29	2024-11-30 10:15:05
2	hunain dev 	hunain88@gmail.com	971	123456789	0	1	1	$2y$10$M9ms4LialUzuBX1uNTz/TONq9itxzPF4pRaV3zbRqZ9.HnFwMl.Ma	2024-11-30 11:31:52	2	hunain dev	\N		1111	1111	ad	ANDROID	\N	\N	c948872a6eac9a75	2024-11-30 11:00:33	2024-11-30 11:31:52
3	s login 	new_social1@gmail.com	92	3095555555	0	1	1	$2y$10$Ch0H1uVSxO/gNvhETynaDe8ePjT0Ws9EhOHU3rd5.ZEzPJPlNfxHq	2024-12-02 09:21:39	2	s login	\N	\N	1111	1111	1111	andriod	\N	\N	cart_a	2024-12-02 09:09:32	2024-12-02 09:21:39
4	s login 	new_social2@gmail.com	92	3095555556	0	1	1	$2y$10$c3u4EHtwPF.Cl2Y6NEDPE.GhKflO8vbJnoKYdmuuk89e34x0ZJ1Ea	2024-12-02 09:28:18	2	s login	\N	\N	1111	1111	1111	andriod	\N	\N	cart_a	2024-12-02 09:24:17	2024-12-02 09:28:18
5	Hunain Ahmad. 	hunainahmad12345@gmail.com	971	987654321	0	1	1	$2y$10$/6ei8XQDoioTvlFHIG4mg.YFEwuKZ96SK/wqDCyM4e9nbzkSHjqGy	2024-12-02 09:55:22	2	Hunain Ahmad.	\N	\N	1111	1111	ad	ANDROID	\N	\N	c948872a6eac9a75	2024-12-02 09:46:52	2024-12-02 09:55:22
6	ragadxb 	ragadxb@gmail.com	971	123456489	0	1	1	$2y$10$aOU7pv9521zJrGNvaAQfW.siDZjhjVq98L8rNKTK1NJ3L3Luf.Hly	2024-12-02 21:48:43	2	ragadxb	\N	\N	1111	1111	fs3DpSFkQteL0pWepAU7uA:APA91bHqw-5EDCZMcGO_f1wjG6lFKNQo3ra0dQTeu16XZuudLwgiA2dbzQTM5CUAM0xKtGnDI1h6uq81FqJcKnlWVK5A-g61FcTnouNjDh4fX-czNOlGrJs	ANDROID	\N	\N	e19e10ee2b97a91c	2024-12-02 21:48:30	2024-12-02 21:48:43
\.


--
-- TOC entry 6758 (class 0 OID 648146)
-- Dependencies: 476
-- Data for Name: tesimonial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tesimonial (id, name, designation, comment, rating, user_image, deleted, active, created_at, updated_at) FROM stdin;
1	Malik Morton	Est aut reprehender	Est aspernatur perf	2.5	1736084780testimonial-photo1.jpg	0	1	2025-01-05 13:46:20	2025-01-05 13:46:20
4	Malik Morton	Est aut reprehender	Est aspernatur perf	2.5	1736084780testimonial-photo1.jpg	0	1	2025-01-05 13:46:20	2025-01-05 13:46:20
5	Malik Morton	Est aut reprehender	Est aspernatur perf	2.5	1736084780testimonial-photo1.jpg	0	1	2025-01-05 13:46:20	2025-01-05 13:46:20
2	Malik Morton	Est aut reprehender	Est aspernatur perf	5	1736084780testimonial-photo1.jpg	0	1	2025-01-05 13:46:20	2025-01-05 13:46:20
3	Malik Morton	Est aut reprehender	Est aspernatur perf	4.5	1736084780testimonial-photo1.jpg	0	1	2025-01-05 13:46:20	2025-01-05 13:46:20
6	Malik Morton1	Est aut reprehender	Est aspernatur perf	3	1736322660testimonial-photo1.jpg	0	1	2025-01-05 13:46:20	2025-01-08 07:51:00
\.


--
-- TOC entry 6760 (class 0 OID 648155)
-- Dependencies: 478
-- Data for Name: transport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transport (id, title, description, url, image, active, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6762 (class 0 OID 648162)
-- Dependencies: 480
-- Data for Name: user_account_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_account_types (id, user_id, account_type_id, activity_type_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6764 (class 0 OID 648166)
-- Dependencies: 482
-- Data for Name: user_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_address (id, user_id, full_name, dial_code, phone, address, country_id, state_id, city_id, address_type, status, is_default, created_at, updated_at, land_mark, building_name, latitude, longitude, location, area_id, apartment, street) FROM stdin;
1	9	Aamir .	92	3028066329	address n	1	0	1	Home	0	0	2024-12-20 11:31:48	2024-12-20 11:32:09	\N	B1	11	11	Calicut Airport	1	A1	S1
4	22	Freya Trujillo	971	+1 (144) 992-7768	Fugit laborum Ut a	1	1	1	Office	1	0	2025-01-14 07:37:13	2025-01-14 07:52:36	\N	\N	\N	\N	\N			
3	22	Walker Kirk	321	+1 (489) 656-9782	asdadasdas	1	1	1	Office	1	0	2025-01-09 02:28:25	2025-01-14 07:52:36	\N	\N	\N	\N	\N			
2	22	iftikhar dxba	921	addd	sdasd	1	1	1	Office	1	1	2025-01-09 02:22:05	2025-01-14 07:52:36	\N	\N	\N	\N	\N			
\.


--
-- TOC entry 6766 (class 0 OID 648181)
-- Dependencies: 484
-- Data for Name: user_follows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_follows (id, user_id, follow_user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6768 (class 0 OID 648185)
-- Dependencies: 486
-- Data for Name: user_privileges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_privileges (id, user_id, designation_id, privileges, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6770 (class 0 OID 648192)
-- Dependencies: 488
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, dial_code, phone, phone_verified, password, email_verified_at, role, first_name, last_name, user_image, user_phone_otp, user_device_token, user_device_type, user_access_token, firebase_user_key, remember_token, created_at, updated_at, country_id, state_id, city_id, area, active, deleted, display_name, business_name, email_verified, user_email_otp, dob, vendor, store, previllege, about_me, verified, designation_id, is_private_profile, user_name, gender, website, wallet_amount, password_reset_code, password_reset_time, approve, user_permissions, password_reset_otp, is_social, activity_id, temp_dial_code, temp_mobile, minimum_order_amount, ref_code, is_dinein, is_delivery, designation_name, admin_viewed, delivery_charge, location, two_factor_auth) FROM stdin;
12	ragadxb 	ragadxb@gmail.com	971	123456489	1	$2y$10$aOU7pv9521zJrGNvaAQfW.siDZjhjVq98L8rNKTK1NJ3L3Luf.Hly	2024-12-02 21:48:49	2	ragadxb	\N	\N		fs3DpSFkQteL0pWepAU7uA:APA91bHqw-5EDCZMcGO_f1wjG6lFKNQo3ra0dQTeu16XZuudLwgiA2dbzQTM5CUAM0xKtGnDI1h6uq81FqJcKnlWVK5A-g61FcTnouNjDh4fX-czNOlGrJs	ANDROID	3253403a852385de02aa5ee5bd925693b9a95108b215220cc133b7ca559372cf	-OD8LEenh4QHGNFQdkI_	\N	2024-12-02 21:48:49	2024-12-02 21:48:50	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N	2024120212	0	0		0	0	\N	\N
4	\N	v1@mailinator.com	971	98765543212	0	$2y$10$QYVRbwZ2WiGwGf.p9GXYyuPXpDHfFenJMpLWhqi8toha/gSSaxlxu	\N	3	Gift	Hub	\N	\N	\N	\N	\N	\N	\N	2024-07-02 04:33:39	\N	1	0	1	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	7			\N		0	0		0	0	\N	\N
5	\N	v2@mailinator.com	971	76666666565	0	$2y$10$MfA6hbpHAbNhN9gZ66t2juLLVeuB.1irp84jNEVbYEdoxYcAj8s5m	\N	3	Gift	Palace	\N	\N	\N	\N	\N	\N	\N	2024-07-02 04:35:46	\N	1	0	1	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	7			\N		0	0		0	0	\N	\N
3	\N	test@yopmail.com_deleted_mail	971	555555555_deleted_mobile	0	$2y$10$BpeueI3YtidDFC0xMvef0e/QAYFzALbWPP/1G2CTojNChbwg.eVFK	\N	3	test	test	\N	\N	\N	\N	\N	\N	\N	2024-06-28 06:24:24	\N	1	0	1	0	0	1	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	7			\N		0	0		0	0	\N	\N
6	\N	m@m.com	\N	123455	0	$2y$10$PdomyeXOLOrlSh7Xb8c4wurVAHhY3TeZBM4iwgrtaz8IxfnoXFq3m	\N	1	Khalifa	Alian	\N	\N	\N	\N	\N	\N	\N	2024-07-04 15:04:04	\N	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0	manager	0	0	\N	\N
11	Hunain Ahmad. 	hunainahmad12345@gmail.com	971	987654321	1	$2y$10$/6ei8XQDoioTvlFHIG4mg.YFEwuKZ96SK/wqDCyM4e9nbzkSHjqGy	2024-12-02 09:56:40	2	Hunain Ahmad.	\N	\N			ANDROID	ad852278e1f32f11b740e12704fa06b219e3c5f27a6b577a44f501a1a61156eb	-OD5nEoNNKMnhqVzS5qR	\N	2024-12-02 09:56:40	2024-12-02 10:05:33	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N	2024120211	0	0		0	0	\N	\N
2	RUSVIN K	rusvinmerak@gmail.com	971	7034526952	1	$2y$10$yvUq0wjrEekXZoGO7K3KPOI02.VAxrNgQakGbD5BQB6HI3xFiadii	\N	2	RUSVIN	K	/uploads/company/667d446ad4466_1719485546.jpg	\N	1111	\N	63dc7012a98074adeddabf75dfcb10f93c3226b7999f6fe47cd91ff66261c9a5	-OEYPEBELYhVl2-wz_y0	\N	2024-06-27 10:48:19	2024-12-20 09:32:06	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	202412202	0	0		0	0	\N	\N
9	hunain dev 	hunain88@gmail.com	971	123456789	1	$2y$10$bOi6Ca6Oo0YgkYRrwBxH7eFvWBtqpbu/bd8SU/niFT7ijjlkLYJue	2024-11-30 11:33:34	2	hunain dev	\N	\N		cR0bfnAeSdyt0drSADtjDp:APA91bGN9xJbPjv56VOXUtVDWMgrxB9Wwu3dBOnJgqOWDdZJn_MbwoUcRWckqFp6s-fCOVF4GlUfO7wy75bxGCWI7NTb19CeSIAGaZgfp32Ak3V9Htv0R90	ANDROID	5da423d47cadec89bcf1912ddca59f0f56adb42285a257353de40b851527a161	-OCwqEiORwtIfFZt9P2d	\N	2024-11-30 11:33:34	2024-12-20 09:35:22	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0		2024-11-30 12:22:30	0	\N	0	0	\N			\N	202411309	0	0		0	0	\N	\N
10	s login 	new_social1@gmail.com	92	3095555555	1	$2y$10$Ch0H1uVSxO/gNvhETynaDe8ePjT0Ws9EhOHU3rd5.ZEzPJPlNfxHq	2024-12-02 09:21:57	2	s login	\N	\N		1111	andriod	92b0eb24679ddc74d37b09ccc0fe9cecdd47ead372248048e12db12b8516b4f8	-OD5fIArJzZ9WkRHLkQV	\N	2024-12-02 09:21:57	2024-12-02 09:25:13	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N	2024120210	0	0		0	0	\N	\N
15	\N	maviji@mailinator.com	\N	231231132123	0	$2y$10$LMlpzCqiW3ep70WM6G6GHO/iRhbAd.sHRhY86.b4btdI3nn9Va3bq	\N	2	Leroy	Leonard	\N	\N	\N	\N	\N	\N	\N	2025-01-08 19:05:16	2025-01-08 19:05:16	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
16	\N	jizebi@mailinator.com	\N	2322423423234	0	$2y$10$DKHpQ/FgQHwHqu6n7mpr0eRgUO6ajW5TFbJ/OE3uJueovYEivWjpa	\N	2	Pamela	Haynes	\N	\N	\N	\N	\N	\N	\N	2025-01-08 19:19:33	2025-01-08 19:19:33	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
17	\N	jizebi11@mailinator.com	\N	2322423423234	0	$2y$10$lQCN2wO7Ss5vW0A4dNuj1eE75gxecOBK5d9pqtvpNS4ntjvGejCbK	\N	2	Pamela	Haynes	\N	\N	\N	\N	\N	\N	\N	2025-01-08 19:20:25	2025-01-08 19:20:25	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
18	\N	savebaq@mailinator.com	\N	12345678934	0	$2y$10$gVI.AlY.aYafJcbJJmxPNu0lFxknoWCkqujZiIHvuiQkN9xfKsAL.	\N	2	Honorato	Jacobs	\N	\N	\N	\N	\N	\N	\N	2025-01-08 19:35:25	2025-01-08 19:35:25	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
19	\N	jaqe@mailinator.com	\N	23423423423	0	$2y$10$ABhX1T/m5TZ2I7p5g2gNee8ciqFKDAGp1joh0xSOslka8.IAcPZja	\N	2	Belle	Mueller	\N	\N	\N	\N	\N	\N	\N	2025-01-08 19:41:59	2025-01-08 19:41:59	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
20	\N	jaqe1@mailinator.com	\N	23423423423	0	$2y$10$1suv2gd4Ved6g1ji33m0m.LH/6mTtI5p5gohrFEsXqrnM6zgnp.s2	\N	2	Belle	Mueller	\N	\N	\N	\N	\N	\N	\N	2025-01-08 19:42:13	2025-01-08 19:42:13	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
21	\N	totyvul@mailinator.com	\N	23242342343	0	$2y$10$RGICJPDf5feJ.fGI/Po8p.Jvp64xJgcjmDDTNar8xLonvPxSQpwza	\N	2	Uma	Francis	\N	\N	\N	\N	\N	\N	\N	2025-01-08 19:44:55	2025-01-08 19:44:55	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
22	\N	iftikhardxba@gmail.com	\N	21312313123131	0	$2y$10$odDb2X9tGCWh2PJRJfECROo2TnI8Zq13TGVEddxBpvQZtT6ExP/BS	\N	2	iftikhar	dxba	\N	\N	\N	\N	\N	\N	\N	2025-01-08 19:59:31	2025-01-08 21:51:40	0	0	0	0	0	0	\N	\N	0	\N	2025-01-09	0	0	0	asdad	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	asdad	\N
23	\N	burosut@mailinator.com	\N	\N	0	$2y$10$JS8YtRaeP2MpBGfnatT96uDlvh63aWKOk9sBw8SqAJ5pGmbFhLqnK	\N	3	Preston	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-09 14:54:28	2025-01-09 14:54:28	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
24	\N	qopitosoru@mailinator.com	\N	\N	0	$2y$10$3LaiFNqfQTFPH0krzewqcudTOzB0/gn2tlIEoUrOAf3aisD582TCG	\N	3	Bree	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-09 16:31:22	2025-01-09 16:31:22	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
27	\N	jozonisaz@mailinator.com	\N	\N	0	$2y$10$925JQUyO/ki8.IWLSu6k.OVStA/YZ.3.HVT2Fvd7zUFGowMCuGpui	\N	3	Lilah	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-09 18:01:39	2025-01-09 18:01:39	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
25	\N	savacotu@mailinator.com	\N	\N	0	$2y$10$OUbFlJ/iDwgnPuR9vwcjBecf/sMoh0nMH6EdV82Z8rk8tA1IlAtHW	\N	3	Xena	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-09 16:35:36	2025-01-09 16:38:27	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
26	\N	zagusokux@mailinator.com	\N	\N	0	$2y$10$Ffu.ohnbyN4OhVQNspp9sOzDc0E.MdDVUpOjxyET7wWcPm/4VjUYu	\N	3	Portia	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-09 16:38:58	2025-01-09 16:38:58	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
28	\N	qegywav@mailinator.com	\N	\N	0	$2y$10$Bk.dTl/UQQA0oOF.aOaM8epCimBZgXfn6TRmaOeio/UEof7bDj7kG	\N	3	Eliana	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 08:17:05	2025-01-10 08:19:29	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	enabled
29	\N	vudof@mailinator.com	\N	\N	0	$2y$10$aYTV8cvJ2Ps/deQZjxbHu.rq6MrdtB4cpPk0orCCUZvdHlUw0zd7.	\N	3	Kirk	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 09:14:52	2025-01-10 09:14:52	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
30	\N	lywumaz@mailinator.com	\N	\N	0	$2y$10$XE8118Kqr0IBak39.VlaSO4FgsnumAhAWyf3YQSurjigSjrDh12Lq	\N	3	Serina	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 15:27:34	2025-01-10 15:27:34	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		1	0	\N	\N
1	Admin	admin@admin.com	971	112233445566778899	0	$2y$10$4CKClSnfh0w959jNrsJyl.8/oowWbizHIg4FrOlXxfgtYYBU6Y6jK	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 15:27:35	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	disabled
31	\N	wavuqajyh@mailinator.com	\N	\N	0	$2y$10$nTW1.xwJ2ZTWYZFZcH2d/uwFuZ4UIDIchKeSa9K76XcTLYoWqSYyO	\N	3	Shaeleigh	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 15:33:00	2025-01-10 15:33:00	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	disabled
32	\N	sovyx@mailinator.com	\N	\N	0	$2y$10$6GtiJ5sW8BKHZu8.BUF2/uSpGoO4Q71FlRX8.DtXyHAaiB4XCPuH2	\N	3	Zachery	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 15:40:33	2025-01-10 15:40:33	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	disabled
33	\N	tihat@mailinator.com	\N	\N	0	$2y$10$1cVb9fmgOVgQde2xjIGDvOLn5JXkbEFCpXvMhCM9q536KLIVX6xQ6	\N	3	Kirsten	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-10 15:59:09	2025-01-10 15:59:09	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	enabled
34	\N	pyfolymep@mailinator.com	\N	\N	0	$2y$10$kSAvt9baoGS.qqzPGqDIZ.BvplGPpVi8z468nDhy1Z77Wh/sCKwk6	\N	3	Lara	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-15 07:44:37	2025-01-15 07:44:37	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	enabled
35	\N	bupud@mailinator.com	\N	\N	0	$2y$10$wzbd4unEZet00OYC06sMmuPbwHFXUBjD2yxIr2W8GvRGEO9dhEDZy	\N	3	Chastity	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-15 08:54:51	2025-01-15 08:54:51	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	enabled
36	\N	womih@mailinator.com	\N	\N	0	$2y$10$1An.fCrDw2kZPEiAXr1e/.aYUKjxNGA6Z0tFCgcKjezoDhx7zgUHW	\N	3	Asher	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-15 09:12:57	2025-01-15 09:12:57	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	disabled
37	\N	lolygubuz@mailinator.com	\N	\N	0	$2y$10$Y3o7yAVkZEWzgNpaKXMxa.M/sKsz2f4BCvGW3CKCN6cCRbhHy0l.a	\N	3	Whilemina	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-15 09:15:00	2025-01-15 09:15:00	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	enabled
38	\N	lolygubu1z@mailinator.com	\N	\N	0	$2y$10$lQaopzemyA2V1zgUrXro8uQaPky4U2MKmy8Bq3K6flmw04euEn4Eu	\N	3	Whilemina	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-15 09:17:15	2025-01-15 09:17:15	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	enabled
39	\N	lolygubu1z1@mailinator.com	\N	\N	0	$2y$10$ZGy6h6aME6TQjXRNGPdzmeMxXww9QEkFmOAmh3IyPNiVOu2mhjZla	\N	3	Whilemina	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-15 09:19:37	2025-01-15 09:19:37	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	enabled
40	\N	lolygubu1z12@mailinator.com	\N	\N	0	$2y$10$A1U60KCJx5CAqSjyqmcPz.AbHDsc6r59p7qk5SasrtA0RTbfp9sVK	\N	3	Whilemina	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-15 09:20:30	2025-01-15 09:20:30	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	enabled
41	\N	jyruhypuq@mailinator.com	\N	\N	0	$2y$10$ip7rQ3H0Y1zSZ2.T.KKBBeoCAcUvpL5Exf74MnKgwe7RifHWnL1QK	\N	3	Denton	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-15 09:53:36	2025-01-15 10:01:24	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	disabled
42	\N	qitaponuh@mailinator.com	\N	\N	0	$2y$10$7Z8oXqD.TI7nY3fvNewaEewNU7aRMShxuX54d40aye92a1PKaGgb6	\N	3	Amelia	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-15 10:10:58	2025-01-15 10:10:58	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	disabled
43	Avram Bradford	kemulo@mailinator.com	\N	231231231231	0	$2y$10$1jvJCGdWNzMuQp4FL7GWJ..fB3cCp4J/CEuTZDNF44q7TJ9vrO2eO	\N	2	Avram	Bradford	\N	\N	\N	\N	\N	\N	\N	2025-01-18 16:35:30	2025-01-18 16:40:20	0	0	0	0	0	0	\N	\N	0	\N	2025-01-17	0	0	0	asdasdasd	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	asdadasd	\N
44	Seth Dyer	figywuvo@mailinator.com	\N	2222222222	0	$2y$10$UaU9WtKMb/WA6U/1jrXcae.86IEmV4qOgxTFGUXzT5G8OD1.gz0R2	\N	2	Seth	Dyer	\N	\N	\N	\N	\N	\N	\N	2025-01-18 16:44:49	2025-01-18 16:44:49	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N
\.


--
-- TOC entry 6772 (class 0 OID 648223)
-- Dependencies: 490
-- Data for Name: users_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_role (id, role_name, created_at, updated_at) FROM stdin;
1	admin	2024-06-27 10:45:55	2024-06-27 10:45:55
2	users	2024-06-27 10:45:55	2024-06-27 10:45:55
3	vendors	2024-06-27 10:45:55	2024-06-27 10:45:55
\.


--
-- TOC entry 6774 (class 0 OID 648227)
-- Dependencies: 492
-- Data for Name: vendor_cuisines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_cuisines (id, vendor_id, cuisine_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6776 (class 0 OID 648233)
-- Dependencies: 494
-- Data for Name: vendor_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_details (id, homedelivery, logo, key_control, branches, company_name, company_brand, legal_staus, reg_date, trade_license, trade_license_expiry, vat_reg_number, vat_reg_expiry, address1, address2, street, zip, trade_license_doc, chamber_of_commerce_doc, share_certificate_doc, power_attorny_doc, vat_reg_doc, signed_agreement_doc, identy1_type, identy1_doc, identy2_type, identy2_doc, company_identy1_type, company_identy1_doc, company_identy2_type, company_identy2_doc, created_at, updated_at, industry_type, user_id, store_type, txt_location, location, latitude, longitude, area, pharmacycommission, servicecommission, featured_flag, open_time, close_time, description, cover_image, country, city, street1, street2, state, postal_code, phone_number) FROM stdin;
1	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2024-06-27 10:52:26	2024-06-27 10:52:26	1	2	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0
2	1	/uploads/company/667e571830476_1719555864.jpg	0	0	Testttt	\N	\N	\N	84444842947664	2025-06-28 00:00:00	\N	\N	dsdsd	dsdsd	dsdsd	585220	/uploads/company/667e57183064f_1719555864.jpg	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2024-06-28 06:24:24	2024-06-28 06:24:24	2	3	0	\N	673C+VFH - Dubai - United Arab Emirates	25.204819	55.270931	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0
3	1	/uploads/company/66838323ceb5e_1719894819.png	0	0	Gift Hub	\N	\N	\N	76456456464	2024-07-31 00:00:00	\N	\N	Hatta Center	\N	1/2 Street	76575	/uploads/company/66838323cec5f_1719894819.png	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2024-07-02 04:33:39	2024-07-02 04:33:39	2	4	0	\N	Abu Dhabi UAE	25.205608871677928	55.288703590818336	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0
4	1	/uploads/company/668383a277971_1719894946.jpeg	0	0	Gift Palace	\N	\N	\N	56675756756	2024-07-31 00:00:00	\N	\N	1/2 Hatta Center	\N	1/2 Street	56755	/uploads/company/668383a277a95_1719894946.jpeg	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2024-07-02 04:35:46	2024-07-02 04:35:46	2	5	0	\N	673C+VFH - Dubai - United Arab Emirates	25.204819	55.270931	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0
5	1	\N	0	0	Chaim	\N	\N	\N	\N	\N	\N	\N	sdadadadasd	\N	asdsdadas	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-09 16:38:27	2025-01-09 16:38:27	0	25	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	0	0	0	0	0	0	0
6	1	\N	0	0	Sonia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-10 08:19:29	2025-01-10 08:19:29	0	28	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	1	1	asdasda	asdadasd	1	231231	1231231231
7	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-15 09:20:30	2025-01-15 09:20:30	0	40	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	1	1	Ad dolor ad minim qu	Labore dicta veniam	1	242342	1485567317
8	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-15 09:53:36	2025-01-15 09:53:36	0	41	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	1	1	Optio dolore rerum	Aut ex sunt autem n	1	342342	1652458657
9	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	0	\N	0	\N	2025-01-15 10:10:58	2025-01-15 10:10:58	0	42	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	1	1	Autem sunt aut repre	Omnis minima et veli	1	242342	1623574899
\.


--
-- TOC entry 6778 (class 0 OID 648257)
-- Dependencies: 496
-- Data for Name: vendor_followers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_followers (id, vendor_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6780 (class 0 OID 648263)
-- Dependencies: 498
-- Data for Name: vendor_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_locations (id, user_id, location, latitude, longitude, created_at, updated_at, is_default) FROM stdin;
1	3	673C+VFH - Dubai - United Arab Emirates	25.204819	55.270931	2024-06-28 06:24:24	2024-06-28 06:24:24	1
2	4	Abu Dhabi UAE	25.205608871677928	55.288703590818336	2024-07-02 04:33:39	2024-07-02 04:33:39	1
3	5	673C+VFH - Dubai - United Arab Emirates	25.204819	55.270931	2024-07-02 04:35:46	2024-07-02 04:35:46	1
4	4	51 58a St - Al Wasl - Dubai - United Arab Emirates	25.199397661153014	55.26431966945836	2024-08-29 15:10:13	2024-08-29 15:10:13	0
5	4	3 19th St - Al Wasl - Dubai - United Arab Emirates	25.202644532643	55.25479483056639	2024-08-30 18:03:51	2024-08-30 18:03:51	0
\.


--
-- TOC entry 6782 (class 0 OID 648270)
-- Dependencies: 500
-- Data for Name: vendor_menu_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_menu_images (id, vendor_id, image, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6784 (class 0 OID 648276)
-- Dependencies: 502
-- Data for Name: vendor_service_timings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_service_timings (id, service_id, vendor, sunday, sun_from, sun_to, monday, mon_from, mon_to, tuesday, tues_from, tues_to, wednesday, wed_from, wed_to, thursday, thurs_from, thurs_to, friday, fri_from, fri_to, saturday, sat_from, sat_to, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6786 (class 0 OID 648291)
-- Dependencies: 504
-- Data for Name: vendor_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_services (id, vendor_id, service_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6788 (class 0 OID 648295)
-- Dependencies: 506
-- Data for Name: vendor_timings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_timings (id, vendor_id, has_24_hour, service_id, day, time_from, time_to, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6790 (class 0 OID 648302)
-- Dependencies: 508
-- Data for Name: wallet_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_histories (id, user_id, wallet_amount, pay_type, description, created_at, updated_at, pay_method) FROM stdin;
\.


--
-- TOC entry 6792 (class 0 OID 648310)
-- Dependencies: 510
-- Data for Name: wallet_payment_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_payment_report (id, transaction_id, payment_status, user_id, ref_id, amount, method_type, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6794 (class 0 OID 648318)
-- Dependencies: 512
-- Data for Name: web_banners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.web_banners (id, name, description, banner_image, button_link, active, deleted, created_at, updated_at, heading) FROM stdin;
2	Newest Arrivals	<p>Lorem ipsum dolor sit amet, consectetur elit.<br />Odio pulvinar in ipsum amet.</p>	17407642752515037.jpg	https://dxbitprojects.com/	1	0	2025-01-09 03:54:24	2025-02-28 17:37:55	LATEST TRENDS
1	Newest Arrival	<p>Lorem ipsum dolor sit amet, consectetur elit.<br />Odio pulvinar in ipsum amet</p>	1740764805500540.jpg	https://dxbitprojects.com/	1	0	2025-01-09 03:52:40	2025-02-28 17:46:45	LATEST TRENDS
\.


--
-- TOC entry 6796 (class 0 OID 648326)
-- Dependencies: 514
-- Data for Name: websockets_statistics_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.websockets_statistics_entries (id, app_id, peak_connection_count, websocket_message_count, api_message_count, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 6798 (class 0 OID 648330)
-- Dependencies: 516
-- Data for Name: wishlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wishlists (id, user_id, product_id, created_at, updated_at) FROM stdin;
20	22	9	2025-01-16 10:30:21	2025-01-16 10:30:21
21	22	49	2025-01-16 12:19:07	2025-01-16 12:19:07
\.


--
-- TOC entry 6961 (class 0 OID 0)
-- Dependencies: 216
-- Name: aboutus_page_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aboutus_page_settings_id_seq', 14, true);


--
-- TOC entry 6962 (class 0 OID 0)
-- Dependencies: 218
-- Name: account_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_type_id_seq', 1, false);


--
-- TOC entry 6963 (class 0 OID 0)
-- Dependencies: 220
-- Name: activity_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_type_id_seq', 1, false);


--
-- TOC entry 6964 (class 0 OID 0)
-- Dependencies: 222
-- Name: admin_designation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_designation_id_seq', 1, false);


--
-- TOC entry 6965 (class 0 OID 0)
-- Dependencies: 224
-- Name: amount_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.amount_type_id_seq', 2, true);


--
-- TOC entry 6966 (class 0 OID 0)
-- Dependencies: 226
-- Name: app_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_banners_id_seq', 3, true);


--
-- TOC entry 6967 (class 0 OID 0)
-- Dependencies: 228
-- Name: app_home_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_home_sections_id_seq', 1, false);


--
-- TOC entry 6968 (class 0 OID 0)
-- Dependencies: 230
-- Name: area_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.area_id_seq', 1, true);


--
-- TOC entry 6969 (class 0 OID 0)
-- Dependencies: 232
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articles_id_seq', 2, true);


--
-- TOC entry 6970 (class 0 OID 0)
-- Dependencies: 234
-- Name: attribute_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attribute_type_id_seq', 4, true);


--
-- TOC entry 6971 (class 0 OID 0)
-- Dependencies: 236
-- Name: attribute_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attribute_values_id_seq', 1, false);


--
-- TOC entry 6972 (class 0 OID 0)
-- Dependencies: 238
-- Name: attribute_values_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attribute_values_request_id_seq', 1, false);


--
-- TOC entry 6973 (class 0 OID 0)
-- Dependencies: 240
-- Name: attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attributes_id_seq', 1, false);


--
-- TOC entry 6974 (class 0 OID 0)
-- Dependencies: 243
-- Name: bank_code_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_code_types_id_seq', 3, true);


--
-- TOC entry 6975 (class 0 OID 0)
-- Dependencies: 245
-- Name: bank_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_details_id_seq', 8, true);


--
-- TOC entry 6976 (class 0 OID 0)
-- Dependencies: 246
-- Name: bank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_id_seq', 1, false);


--
-- TOC entry 6977 (class 0 OID 0)
-- Dependencies: 248
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blogs_id_seq', 2, true);


--
-- TOC entry 6978 (class 0 OID 0)
-- Dependencies: 250
-- Name: brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_id_seq', 1, true);


--
-- TOC entry 6979 (class 0 OID 0)
-- Dependencies: 252
-- Name: building_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.building_type_id_seq', 1, false);


--
-- TOC entry 6980 (class 0 OID 0)
-- Dependencies: 254
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 31, true);


--
-- TOC entry 6981 (class 0 OID 0)
-- Dependencies: 256
-- Name: cart_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_service_id_seq', 1, false);


--
-- TOC entry 6982 (class 0 OID 0)
-- Dependencies: 258
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 43, true);


--
-- TOC entry 6983 (class 0 OID 0)
-- Dependencies: 260
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 1, true);


--
-- TOC entry 6984 (class 0 OID 0)
-- Dependencies: 262
-- Name: cleaning_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cleaning_services_id_seq', 1, false);


--
-- TOC entry 6985 (class 0 OID 0)
-- Dependencies: 264
-- Name: comment_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_likes_id_seq', 1, false);


--
-- TOC entry 6986 (class 0 OID 0)
-- Dependencies: 266
-- Name: comment_taged_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_taged_users_id_seq', 1, false);


--
-- TOC entry 6987 (class 0 OID 0)
-- Dependencies: 268
-- Name: contact_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_us_id_seq', 4, true);


--
-- TOC entry 6988 (class 0 OID 0)
-- Dependencies: 270
-- Name: contact_us_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_us_settings_id_seq', 1, true);


--
-- TOC entry 6989 (class 0 OID 0)
-- Dependencies: 272
-- Name: contracting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contracting_id_seq', 1, false);


--
-- TOC entry 6990 (class 0 OID 0)
-- Dependencies: 274
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_seq', 1, true);


--
-- TOC entry 6991 (class 0 OID 0)
-- Dependencies: 277
-- Name: coupon_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_brand_id_seq', 1, false);


--
-- TOC entry 6992 (class 0 OID 0)
-- Dependencies: 279
-- Name: coupon_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_category_id_seq', 1, false);


--
-- TOC entry 6993 (class 0 OID 0)
-- Dependencies: 280
-- Name: coupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_id_seq', 1, false);


--
-- TOC entry 6994 (class 0 OID 0)
-- Dependencies: 282
-- Name: coupon_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_images_id_seq', 1, false);


--
-- TOC entry 6995 (class 0 OID 0)
-- Dependencies: 284
-- Name: coupon_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_products_id_seq', 1, false);


--
-- TOC entry 6996 (class 0 OID 0)
-- Dependencies: 286
-- Name: coupon_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_services_id_seq', 1, true);


--
-- TOC entry 6997 (class 0 OID 0)
-- Dependencies: 288
-- Name: coupon_vendor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_vendor_id_seq', 1, false);


--
-- TOC entry 6998 (class 0 OID 0)
-- Dependencies: 290
-- Name: coupon_vendor_service_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_vendor_service_order_id_seq', 1, false);


--
-- TOC entry 6999 (class 0 OID 0)
-- Dependencies: 293
-- Name: coupons_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupons_category_id_seq', 1, false);


--
-- TOC entry 7000 (class 0 OID 0)
-- Dependencies: 294
-- Name: coupons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupons_id_seq', 1, false);


--
-- TOC entry 7001 (class 0 OID 0)
-- Dependencies: 296
-- Name: cuisines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuisines_id_seq', 1, false);


--
-- TOC entry 7002 (class 0 OID 0)
-- Dependencies: 298
-- Name: currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.currencies_id_seq', 1, true);


--
-- TOC entry 7003 (class 0 OID 0)
-- Dependencies: 300
-- Name: custom_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.custom_banners_id_seq', 1, false);


--
-- TOC entry 7004 (class 0 OID 0)
-- Dependencies: 302
-- Name: designations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.designations_id_seq', 1, false);


--
-- TOC entry 7005 (class 0 OID 0)
-- Dependencies: 304
-- Name: event_features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_features_id_seq', 3, true);


--
-- TOC entry 7006 (class 0 OID 0)
-- Dependencies: 306
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 7007 (class 0 OID 0)
-- Dependencies: 308
-- Name: faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faq_id_seq', 4, true);


--
-- TOC entry 7008 (class 0 OID 0)
-- Dependencies: 310
-- Name: featured_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.featured_products_id_seq', 1, false);


--
-- TOC entry 7009 (class 0 OID 0)
-- Dependencies: 312
-- Name: featured_products_img_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.featured_products_img_id_seq', 1, false);


--
-- TOC entry 7010 (class 0 OID 0)
-- Dependencies: 314
-- Name: hair_colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hair_colors_id_seq', 1, false);


--
-- TOC entry 7011 (class 0 OID 0)
-- Dependencies: 316
-- Name: help_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.help_id_seq', 1, false);


--
-- TOC entry 7012 (class 0 OID 0)
-- Dependencies: 318
-- Name: help_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.help_topics_id_seq', 29, true);


--
-- TOC entry 7013 (class 0 OID 0)
-- Dependencies: 320
-- Name: home_logos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_logos_id_seq', 3, true);


--
-- TOC entry 7014 (class 0 OID 0)
-- Dependencies: 322
-- Name: hourly_rate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hourly_rate_id_seq', 1, false);


--
-- TOC entry 7015 (class 0 OID 0)
-- Dependencies: 324
-- Name: industry_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.industry_types_id_seq', 1, false);


--
-- TOC entry 7016 (class 0 OID 0)
-- Dependencies: 326
-- Name: landing_page_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.landing_page_settings_id_seq', 39, true);


--
-- TOC entry 7017 (class 0 OID 0)
-- Dependencies: 328
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.likes_id_seq', 1, false);


--
-- TOC entry 7018 (class 0 OID 0)
-- Dependencies: 330
-- Name: main_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_category_id_seq', 3, true);


--
-- TOC entry 7019 (class 0 OID 0)
-- Dependencies: 332
-- Name: maintainance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maintainance_id_seq', 1, false);


--
-- TOC entry 7020 (class 0 OID 0)
-- Dependencies: 334
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 348, true);


--
-- TOC entry 7021 (class 0 OID 0)
-- Dependencies: 336
-- Name: moda_main_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moda_main_categories_id_seq', 6, true);


--
-- TOC entry 7022 (class 0 OID 0)
-- Dependencies: 338
-- Name: moda_sub_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moda_sub_categories_id_seq', 1, false);


--
-- TOC entry 7023 (class 0 OID 0)
-- Dependencies: 340
-- Name: my_moda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.my_moda_id_seq', 1, false);


--
-- TOC entry 7024 (class 0 OID 0)
-- Dependencies: 342
-- Name: my_moda_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.my_moda_items_id_seq', 1, false);


--
-- TOC entry 7025 (class 0 OID 0)
-- Dependencies: 344
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 1, false);


--
-- TOC entry 7026 (class 0 OID 0)
-- Dependencies: 346
-- Name: order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_products_id_seq', 10, true);


--
-- TOC entry 7027 (class 0 OID 0)
-- Dependencies: 348
-- Name: order_request_view_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_request_view_id_seq', 1, false);


--
-- TOC entry 7028 (class 0 OID 0)
-- Dependencies: 350
-- Name: order_status_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_status_history_id_seq', 1, false);


--
-- TOC entry 7029 (class 0 OID 0)
-- Dependencies: 352
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 17, true);


--
-- TOC entry 7030 (class 0 OID 0)
-- Dependencies: 355
-- Name: orders_services_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_services_items_id_seq', 1, false);


--
-- TOC entry 7031 (class 0 OID 0)
-- Dependencies: 357
-- Name: orders_services_mute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_services_mute_id_seq', 1, false);


--
-- TOC entry 7032 (class 0 OID 0)
-- Dependencies: 358
-- Name: orders_services_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_services_order_id_seq', 1, false);


--
-- TOC entry 7033 (class 0 OID 0)
-- Dependencies: 360
-- Name: orders_services_rejected_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_services_rejected_id_seq', 1, false);


--
-- TOC entry 7034 (class 0 OID 0)
-- Dependencies: 363
-- Name: payment_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_report_id_seq', 1, false);


--
-- TOC entry 7035 (class 0 OID 0)
-- Dependencies: 365
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 37, true);


--
-- TOC entry 7036 (class 0 OID 0)
-- Dependencies: 367
-- Name: post_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_comments_id_seq', 1, false);


--
-- TOC entry 7037 (class 0 OID 0)
-- Dependencies: 369
-- Name: post_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_likes_id_seq', 1, false);


--
-- TOC entry 7038 (class 0 OID 0)
-- Dependencies: 371
-- Name: post_saves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_saves_id_seq', 1, false);


--
-- TOC entry 7039 (class 0 OID 0)
-- Dependencies: 373
-- Name: post_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_users_id_seq', 1, false);


--
-- TOC entry 7040 (class 0 OID 0)
-- Dependencies: 375
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- TOC entry 7041 (class 0 OID 0)
-- Dependencies: 378
-- Name: product_attribute_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_attribute_attribute_id_seq', 2, true);


--
-- TOC entry 7042 (class 0 OID 0)
-- Dependencies: 380
-- Name: product_attribute_values_attribute_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_attribute_values_attribute_values_id_seq', 3, true);


--
-- TOC entry 7043 (class 0 OID 0)
-- Dependencies: 382
-- Name: product_category_product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_category_product_category_id_seq', 108, true);


--
-- TOC entry 7044 (class 0 OID 0)
-- Dependencies: 384
-- Name: product_cuisines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cuisines_id_seq', 1, false);


--
-- TOC entry 7045 (class 0 OID 0)
-- Dependencies: 386
-- Name: product_docs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_docs_id_seq', 1, false);


--
-- TOC entry 7046 (class 0 OID 0)
-- Dependencies: 388
-- Name: product_features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_features_id_seq', 3, true);


--
-- TOC entry 7047 (class 0 OID 0)
-- Dependencies: 389
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 49, true);


--
-- TOC entry 7048 (class 0 OID 0)
-- Dependencies: 391
-- Name: product_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_images_id_seq', 1, false);


--
-- TOC entry 7049 (class 0 OID 0)
-- Dependencies: 393
-- Name: product_items_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_items_item_id_seq', 11, true);


--
-- TOC entry 7050 (class 0 OID 0)
-- Dependencies: 395
-- Name: product_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_likes_id_seq', 1, false);


--
-- TOC entry 7051 (class 0 OID 0)
-- Dependencies: 397
-- Name: product_master_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_master_id_seq', 1, false);


--
-- TOC entry 7052 (class 0 OID 0)
-- Dependencies: 399
-- Name: product_master_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_master_request_id_seq', 1, false);


--
-- TOC entry 7053 (class 0 OID 0)
-- Dependencies: 401
-- Name: product_product_feature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_product_feature_id_seq', 6, true);


--
-- TOC entry 7054 (class 0 OID 0)
-- Dependencies: 403
-- Name: product_selected_attribute_list_product_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_selected_attribute_list_product_attribute_id_seq', 18, true);


--
-- TOC entry 7055 (class 0 OID 0)
-- Dependencies: 405
-- Name: product_selected_attributes_product_selected_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_selected_attributes_product_selected_attributes_id_seq', 2, true);


--
-- TOC entry 7056 (class 0 OID 0)
-- Dependencies: 407
-- Name: product_specifications_prod_spec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_specifications_prod_spec_id_seq', 23, true);


--
-- TOC entry 7057 (class 0 OID 0)
-- Dependencies: 409
-- Name: product_temp_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_temp_image_id_seq', 1, false);


--
-- TOC entry 7058 (class 0 OID 0)
-- Dependencies: 411
-- Name: product_variations_product_variations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_variations_product_variations_id_seq', 2, true);


--
-- TOC entry 7059 (class 0 OID 0)
-- Dependencies: 413
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- TOC entry 7060 (class 0 OID 0)
-- Dependencies: 415
-- Name: promotion_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promotion_banners_id_seq', 1, false);


--
-- TOC entry 7061 (class 0 OID 0)
-- Dependencies: 417
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ratings_id_seq', 48, true);


--
-- TOC entry 7062 (class 0 OID 0)
-- Dependencies: 419
-- Name: ratings_reply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ratings_reply_id_seq', 1, false);


--
-- TOC entry 7063 (class 0 OID 0)
-- Dependencies: 421
-- Name: ref_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_history_id_seq', 1, false);


--
-- TOC entry 7064 (class 0 OID 0)
-- Dependencies: 424
-- Name: service_assigned_vendors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_assigned_vendors_id_seq', 1, false);


--
-- TOC entry 7065 (class 0 OID 0)
-- Dependencies: 426
-- Name: service_bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_bookings_id_seq', 6, true);


--
-- TOC entry 7066 (class 0 OID 0)
-- Dependencies: 428
-- Name: service_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_category_id_seq', 1, false);


--
-- TOC entry 7067 (class 0 OID 0)
-- Dependencies: 430
-- Name: service_category_selected_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_category_selected_id_seq', 1, false);


--
-- TOC entry 7068 (class 0 OID 0)
-- Dependencies: 432
-- Name: service_event_feature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_event_feature_id_seq', 9, true);


--
-- TOC entry 7069 (class 0 OID 0)
-- Dependencies: 433
-- Name: service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_id_seq', 9, true);


--
-- TOC entry 7070 (class 0 OID 0)
-- Dependencies: 435
-- Name: service_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_images_id_seq', 11, true);


--
-- TOC entry 7071 (class 0 OID 0)
-- Dependencies: 437
-- Name: service_include_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_include_id_seq', 1, false);


--
-- TOC entry 7072 (class 0 OID 0)
-- Dependencies: 439
-- Name: service_order_status_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_order_status_history_id_seq', 1, false);


--
-- TOC entry 7073 (class 0 OID 0)
-- Dependencies: 441
-- Name: service_timings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_timings_id_seq', 1, false);


--
-- TOC entry 7074 (class 0 OID 0)
-- Dependencies: 443
-- Name: service_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_type_id_seq', 1, false);


--
-- TOC entry 7075 (class 0 OID 0)
-- Dependencies: 445
-- Name: service_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_types_id_seq', 1, false);


--
-- TOC entry 7076 (class 0 OID 0)
-- Dependencies: 447
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);


--
-- TOC entry 7077 (class 0 OID 0)
-- Dependencies: 449
-- Name: skin_colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skin_colors_id_seq', 1, false);


--
-- TOC entry 7078 (class 0 OID 0)
-- Dependencies: 451
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.states_id_seq', 1, true);


--
-- TOC entry 7079 (class 0 OID 0)
-- Dependencies: 453
-- Name: store_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_images_id_seq', 1, false);


--
-- TOC entry 7080 (class 0 OID 0)
-- Dependencies: 455
-- Name: store_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_likes_id_seq', 1, false);


--
-- TOC entry 7081 (class 0 OID 0)
-- Dependencies: 457
-- Name: store_managers_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_managers_types_id_seq', 1, false);


--
-- TOC entry 7082 (class 0 OID 0)
-- Dependencies: 459
-- Name: store_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_type_id_seq', 1, false);


--
-- TOC entry 7083 (class 0 OID 0)
-- Dependencies: 461
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stores_id_seq', 18, true);


--
-- TOC entry 7084 (class 0 OID 0)
-- Dependencies: 463
-- Name: subscribers_emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscribers_emails_id_seq', 4, true);


--
-- TOC entry 7085 (class 0 OID 0)
-- Dependencies: 465
-- Name: temp_order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_order_products_id_seq', 31, true);


--
-- TOC entry 7086 (class 0 OID 0)
-- Dependencies: 467
-- Name: temp_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_orders_id_seq', 31, true);


--
-- TOC entry 7087 (class 0 OID 0)
-- Dependencies: 469
-- Name: temp_service_order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_service_order_items_id_seq', 1, false);


--
-- TOC entry 7088 (class 0 OID 0)
-- Dependencies: 471
-- Name: temp_service_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_service_orders_id_seq', 1, false);


--
-- TOC entry 7089 (class 0 OID 0)
-- Dependencies: 473
-- Name: temp_user_account_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_user_account_types_id_seq', 1, false);


--
-- TOC entry 7090 (class 0 OID 0)
-- Dependencies: 475
-- Name: temp_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_users_id_seq', 6, true);


--
-- TOC entry 7091 (class 0 OID 0)
-- Dependencies: 477
-- Name: tesimonial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tesimonial_id_seq', 6, true);


--
-- TOC entry 7092 (class 0 OID 0)
-- Dependencies: 479
-- Name: transport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transport_id_seq', 1, false);


--
-- TOC entry 7093 (class 0 OID 0)
-- Dependencies: 481
-- Name: user_account_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_account_types_id_seq', 1, false);


--
-- TOC entry 7094 (class 0 OID 0)
-- Dependencies: 483
-- Name: user_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_address_id_seq', 4, true);


--
-- TOC entry 7095 (class 0 OID 0)
-- Dependencies: 485
-- Name: user_follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_follows_id_seq', 1, false);


--
-- TOC entry 7096 (class 0 OID 0)
-- Dependencies: 487
-- Name: user_privileges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_privileges_id_seq', 1, false);


--
-- TOC entry 7097 (class 0 OID 0)
-- Dependencies: 489
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 44, true);


--
-- TOC entry 7098 (class 0 OID 0)
-- Dependencies: 491
-- Name: users_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_role_id_seq', 3, true);


--
-- TOC entry 7099 (class 0 OID 0)
-- Dependencies: 493
-- Name: vendor_cuisines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_cuisines_id_seq', 1, false);


--
-- TOC entry 7100 (class 0 OID 0)
-- Dependencies: 495
-- Name: vendor_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_details_id_seq', 9, true);


--
-- TOC entry 7101 (class 0 OID 0)
-- Dependencies: 497
-- Name: vendor_followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_followers_id_seq', 1, false);


--
-- TOC entry 7102 (class 0 OID 0)
-- Dependencies: 499
-- Name: vendor_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_locations_id_seq', 5, true);


--
-- TOC entry 7103 (class 0 OID 0)
-- Dependencies: 501
-- Name: vendor_menu_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_menu_images_id_seq', 1, false);


--
-- TOC entry 7104 (class 0 OID 0)
-- Dependencies: 503
-- Name: vendor_service_timings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_service_timings_id_seq', 1, false);


--
-- TOC entry 7105 (class 0 OID 0)
-- Dependencies: 505
-- Name: vendor_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_services_id_seq', 1, false);


--
-- TOC entry 7106 (class 0 OID 0)
-- Dependencies: 507
-- Name: vendor_timings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_timings_id_seq', 1, false);


--
-- TOC entry 7107 (class 0 OID 0)
-- Dependencies: 509
-- Name: wallet_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_histories_id_seq', 1, false);


--
-- TOC entry 7108 (class 0 OID 0)
-- Dependencies: 511
-- Name: wallet_payment_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_payment_report_id_seq', 1, false);


--
-- TOC entry 7109 (class 0 OID 0)
-- Dependencies: 513
-- Name: web_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.web_banners_id_seq', 2, true);


--
-- TOC entry 7110 (class 0 OID 0)
-- Dependencies: 515
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.websockets_statistics_entries_id_seq', 1, false);


--
-- TOC entry 7111 (class 0 OID 0)
-- Dependencies: 517
-- Name: wishlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wishlists_id_seq', 21, true);


--
-- TOC entry 6009 (class 2606 OID 648486)
-- Name: aboutus_page_settings aboutus_page_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aboutus_page_settings
    ADD CONSTRAINT aboutus_page_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 6011 (class 2606 OID 648488)
-- Name: account_type account_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_type
    ADD CONSTRAINT account_type_pkey PRIMARY KEY (id);


--
-- TOC entry 6013 (class 2606 OID 648490)
-- Name: activity_type activity_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_type
    ADD CONSTRAINT activity_type_pkey PRIMARY KEY (id);


--
-- TOC entry 6015 (class 2606 OID 648492)
-- Name: admin_designation admin_designation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_designation
    ADD CONSTRAINT admin_designation_pkey PRIMARY KEY (id);


--
-- TOC entry 6017 (class 2606 OID 648494)
-- Name: amount_type amount_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amount_type
    ADD CONSTRAINT amount_type_pkey PRIMARY KEY (id);


--
-- TOC entry 6019 (class 2606 OID 648496)
-- Name: app_banners app_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_banners
    ADD CONSTRAINT app_banners_pkey PRIMARY KEY (id);


--
-- TOC entry 6021 (class 2606 OID 648498)
-- Name: app_home_sections app_home_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_home_sections
    ADD CONSTRAINT app_home_sections_pkey PRIMARY KEY (id);


--
-- TOC entry 6023 (class 2606 OID 648500)
-- Name: area area_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT area_pkey PRIMARY KEY (id);


--
-- TOC entry 6025 (class 2606 OID 648502)
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- TOC entry 6027 (class 2606 OID 648504)
-- Name: attribute_type attribute_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_type
    ADD CONSTRAINT attribute_type_pkey PRIMARY KEY (id);


--
-- TOC entry 6029 (class 2606 OID 648506)
-- Name: attribute_values attribute_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_values
    ADD CONSTRAINT attribute_values_pkey PRIMARY KEY (id);


--
-- TOC entry 6031 (class 2606 OID 648508)
-- Name: attribute_values_request attribute_values_request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_values_request
    ADD CONSTRAINT attribute_values_request_pkey PRIMARY KEY (id);


--
-- TOC entry 6033 (class 2606 OID 648510)
-- Name: attributes attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attributes
    ADD CONSTRAINT attributes_pkey PRIMARY KEY (id);


--
-- TOC entry 6037 (class 2606 OID 648512)
-- Name: bank_code_types bank_code_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_code_types
    ADD CONSTRAINT bank_code_types_pkey PRIMARY KEY (id);


--
-- TOC entry 6039 (class 2606 OID 648514)
-- Name: bank_details bank_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_details
    ADD CONSTRAINT bank_details_pkey PRIMARY KEY (id);


--
-- TOC entry 6035 (class 2606 OID 648516)
-- Name: bank bank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank
    ADD CONSTRAINT bank_pkey PRIMARY KEY (id);


--
-- TOC entry 6041 (class 2606 OID 648518)
-- Name: blogs blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- TOC entry 6043 (class 2606 OID 648520)
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (id);


--
-- TOC entry 6045 (class 2606 OID 648522)
-- Name: building_type building_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.building_type
    ADD CONSTRAINT building_type_pkey PRIMARY KEY (id);


--
-- TOC entry 6047 (class 2606 OID 648524)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- TOC entry 6049 (class 2606 OID 648526)
-- Name: cart_service cart_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_service
    ADD CONSTRAINT cart_service_pkey PRIMARY KEY (id);


--
-- TOC entry 6051 (class 2606 OID 648528)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 6053 (class 2606 OID 648530)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 6055 (class 2606 OID 648532)
-- Name: cleaning_services cleaning_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cleaning_services
    ADD CONSTRAINT cleaning_services_pkey PRIMARY KEY (id);


--
-- TOC entry 6057 (class 2606 OID 648534)
-- Name: comment_likes comment_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT comment_likes_pkey PRIMARY KEY (id);


--
-- TOC entry 6059 (class 2606 OID 648536)
-- Name: comment_taged_users comment_taged_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_taged_users
    ADD CONSTRAINT comment_taged_users_pkey PRIMARY KEY (id);


--
-- TOC entry 6061 (class 2606 OID 648538)
-- Name: contact_us contact_us_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us
    ADD CONSTRAINT contact_us_pkey PRIMARY KEY (id);


--
-- TOC entry 6063 (class 2606 OID 648540)
-- Name: contact_us_settings contact_us_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us_settings
    ADD CONSTRAINT contact_us_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 6065 (class 2606 OID 648542)
-- Name: contracting contracting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracting
    ADD CONSTRAINT contracting_pkey PRIMARY KEY (id);


--
-- TOC entry 6067 (class 2606 OID 648544)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- TOC entry 6071 (class 2606 OID 648546)
-- Name: coupon_brand coupon_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_brand
    ADD CONSTRAINT coupon_brand_pkey PRIMARY KEY (id);


--
-- TOC entry 6073 (class 2606 OID 648548)
-- Name: coupon_category coupon_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_category
    ADD CONSTRAINT coupon_category_pkey PRIMARY KEY (id);


--
-- TOC entry 6075 (class 2606 OID 648550)
-- Name: coupon_images coupon_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_images
    ADD CONSTRAINT coupon_images_pkey PRIMARY KEY (id);


--
-- TOC entry 6069 (class 2606 OID 648552)
-- Name: coupon coupon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon
    ADD CONSTRAINT coupon_pkey PRIMARY KEY (id);


--
-- TOC entry 6077 (class 2606 OID 648554)
-- Name: coupon_products coupon_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_products
    ADD CONSTRAINT coupon_products_pkey PRIMARY KEY (id);


--
-- TOC entry 6079 (class 2606 OID 648556)
-- Name: coupon_services coupon_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_services
    ADD CONSTRAINT coupon_services_pkey PRIMARY KEY (id);


--
-- TOC entry 6081 (class 2606 OID 648558)
-- Name: coupon_vendor coupon_vendor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_vendor
    ADD CONSTRAINT coupon_vendor_pkey PRIMARY KEY (id);


--
-- TOC entry 6083 (class 2606 OID 648560)
-- Name: coupon_vendor_service_order coupon_vendor_service_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_vendor_service_order
    ADD CONSTRAINT coupon_vendor_service_order_pkey PRIMARY KEY (id);


--
-- TOC entry 6087 (class 2606 OID 648562)
-- Name: coupons_category coupons_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons_category
    ADD CONSTRAINT coupons_category_pkey PRIMARY KEY (id);


--
-- TOC entry 6085 (class 2606 OID 648564)
-- Name: coupons coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);


--
-- TOC entry 6089 (class 2606 OID 648566)
-- Name: cuisines cuisines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuisines
    ADD CONSTRAINT cuisines_pkey PRIMARY KEY (id);


--
-- TOC entry 6091 (class 2606 OID 648568)
-- Name: currencies currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (id);


--
-- TOC entry 6093 (class 2606 OID 648570)
-- Name: custom_banners custom_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_banners
    ADD CONSTRAINT custom_banners_pkey PRIMARY KEY (id);


--
-- TOC entry 6096 (class 2606 OID 648572)
-- Name: designations designations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT designations_pkey PRIMARY KEY (id);


--
-- TOC entry 6098 (class 2606 OID 648574)
-- Name: event_features event_features_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_features
    ADD CONSTRAINT event_features_pkey PRIMARY KEY (id);


--
-- TOC entry 6100 (class 2606 OID 648576)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 6102 (class 2606 OID 648578)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 6104 (class 2606 OID 648580)
-- Name: faq faq_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faq
    ADD CONSTRAINT faq_pkey PRIMARY KEY (id);


--
-- TOC entry 6108 (class 2606 OID 648582)
-- Name: featured_products_img featured_products_img_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.featured_products_img
    ADD CONSTRAINT featured_products_img_pkey PRIMARY KEY (id);


--
-- TOC entry 6106 (class 2606 OID 648584)
-- Name: featured_products featured_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.featured_products
    ADD CONSTRAINT featured_products_pkey PRIMARY KEY (id);


--
-- TOC entry 6110 (class 2606 OID 648586)
-- Name: hair_colors hair_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hair_colors
    ADD CONSTRAINT hair_colors_pkey PRIMARY KEY (id);


--
-- TOC entry 6112 (class 2606 OID 648588)
-- Name: help help_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help
    ADD CONSTRAINT help_pkey PRIMARY KEY (id);


--
-- TOC entry 6114 (class 2606 OID 648590)
-- Name: help_topics help_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help_topics
    ADD CONSTRAINT help_topics_pkey PRIMARY KEY (id);


--
-- TOC entry 6116 (class 2606 OID 648592)
-- Name: home_logos home_logos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_logos
    ADD CONSTRAINT home_logos_pkey PRIMARY KEY (id);


--
-- TOC entry 6118 (class 2606 OID 648594)
-- Name: hourly_rate hourly_rate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hourly_rate
    ADD CONSTRAINT hourly_rate_pkey PRIMARY KEY (id);


--
-- TOC entry 6120 (class 2606 OID 648596)
-- Name: industry_types industry_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industry_types
    ADD CONSTRAINT industry_types_pkey PRIMARY KEY (id);


--
-- TOC entry 6122 (class 2606 OID 648598)
-- Name: landing_page_settings landing_page_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.landing_page_settings
    ADD CONSTRAINT landing_page_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 6124 (class 2606 OID 648600)
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- TOC entry 6126 (class 2606 OID 648602)
-- Name: main_category main_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_category
    ADD CONSTRAINT main_category_pkey PRIMARY KEY (id);


--
-- TOC entry 6128 (class 2606 OID 648604)
-- Name: maintainance maintainance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintainance
    ADD CONSTRAINT maintainance_pkey PRIMARY KEY (id);


--
-- TOC entry 6130 (class 2606 OID 648606)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 6132 (class 2606 OID 648608)
-- Name: moda_main_categories moda_main_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moda_main_categories
    ADD CONSTRAINT moda_main_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 6134 (class 2606 OID 648610)
-- Name: moda_sub_categories moda_sub_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moda_sub_categories
    ADD CONSTRAINT moda_sub_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 6138 (class 2606 OID 648612)
-- Name: my_moda_items my_moda_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.my_moda_items
    ADD CONSTRAINT my_moda_items_pkey PRIMARY KEY (id);


--
-- TOC entry 6136 (class 2606 OID 648614)
-- Name: my_moda my_moda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.my_moda
    ADD CONSTRAINT my_moda_pkey PRIMARY KEY (id);


--
-- TOC entry 6140 (class 2606 OID 648616)
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 6142 (class 2606 OID 648618)
-- Name: order_products order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (id);


--
-- TOC entry 6144 (class 2606 OID 648620)
-- Name: order_request_view order_request_view_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_request_view
    ADD CONSTRAINT order_request_view_pkey PRIMARY KEY (id);


--
-- TOC entry 6146 (class 2606 OID 648622)
-- Name: order_status_history order_status_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_history
    ADD CONSTRAINT order_status_history_pkey PRIMARY KEY (id);


--
-- TOC entry 6148 (class 2606 OID 648624)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 6152 (class 2606 OID 648626)
-- Name: orders_services_items orders_services_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services_items
    ADD CONSTRAINT orders_services_items_pkey PRIMARY KEY (id);


--
-- TOC entry 6154 (class 2606 OID 648628)
-- Name: orders_services_mute orders_services_mute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services_mute
    ADD CONSTRAINT orders_services_mute_pkey PRIMARY KEY (id);


--
-- TOC entry 6150 (class 2606 OID 648630)
-- Name: orders_services orders_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services
    ADD CONSTRAINT orders_services_pkey PRIMARY KEY (order_id);


--
-- TOC entry 6156 (class 2606 OID 648632)
-- Name: orders_services_rejected orders_services_rejected_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services_rejected
    ADD CONSTRAINT orders_services_rejected_pkey PRIMARY KEY (id);


--
-- TOC entry 6159 (class 2606 OID 648634)
-- Name: payment_report payment_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_report
    ADD CONSTRAINT payment_report_pkey PRIMARY KEY (id);


--
-- TOC entry 6161 (class 2606 OID 648636)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 6163 (class 2606 OID 648638)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 6166 (class 2606 OID 648640)
-- Name: post_comments post_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT post_comments_pkey PRIMARY KEY (id);


--
-- TOC entry 6168 (class 2606 OID 648642)
-- Name: post_likes post_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_likes
    ADD CONSTRAINT post_likes_pkey PRIMARY KEY (id);


--
-- TOC entry 6170 (class 2606 OID 648644)
-- Name: post_saves post_saves_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_saves
    ADD CONSTRAINT post_saves_pkey PRIMARY KEY (id);


--
-- TOC entry 6172 (class 2606 OID 648646)
-- Name: post_users post_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_users
    ADD CONSTRAINT post_users_pkey PRIMARY KEY (id);


--
-- TOC entry 6174 (class 2606 OID 648648)
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- TOC entry 6178 (class 2606 OID 648650)
-- Name: product_attribute product_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_attribute
    ADD CONSTRAINT product_attribute_pkey PRIMARY KEY (attribute_id);


--
-- TOC entry 6180 (class 2606 OID 648652)
-- Name: product_attribute_values product_attribute_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_attribute_values
    ADD CONSTRAINT product_attribute_values_pkey PRIMARY KEY (attribute_values_id);


--
-- TOC entry 6182 (class 2606 OID 648654)
-- Name: product_category product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (product_category_id);


--
-- TOC entry 6184 (class 2606 OID 648656)
-- Name: product_cuisines product_cuisines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cuisines
    ADD CONSTRAINT product_cuisines_pkey PRIMARY KEY (id);


--
-- TOC entry 6186 (class 2606 OID 648658)
-- Name: product_docs product_docs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_docs
    ADD CONSTRAINT product_docs_pkey PRIMARY KEY (id);


--
-- TOC entry 6188 (class 2606 OID 648660)
-- Name: product_features product_features_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_features
    ADD CONSTRAINT product_features_pkey PRIMARY KEY (id);


--
-- TOC entry 6190 (class 2606 OID 648662)
-- Name: product_images product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (id);


--
-- TOC entry 6192 (class 2606 OID 648664)
-- Name: product_items product_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_items
    ADD CONSTRAINT product_items_pkey PRIMARY KEY (item_id);


--
-- TOC entry 6194 (class 2606 OID 648666)
-- Name: product_likes product_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_likes
    ADD CONSTRAINT product_likes_pkey PRIMARY KEY (id);


--
-- TOC entry 6196 (class 2606 OID 648668)
-- Name: product_master product_master_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_master
    ADD CONSTRAINT product_master_pkey PRIMARY KEY (id);


--
-- TOC entry 6198 (class 2606 OID 648670)
-- Name: product_master_request product_master_request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_master_request
    ADD CONSTRAINT product_master_request_pkey PRIMARY KEY (id);


--
-- TOC entry 6176 (class 2606 OID 648672)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 6200 (class 2606 OID 648674)
-- Name: product_product_feature product_product_feature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_product_feature
    ADD CONSTRAINT product_product_feature_pkey PRIMARY KEY (id);


--
-- TOC entry 6202 (class 2606 OID 648676)
-- Name: product_selected_attribute_list product_selected_attribute_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_selected_attribute_list
    ADD CONSTRAINT product_selected_attribute_list_pkey PRIMARY KEY (product_attribute_id);


--
-- TOC entry 6204 (class 2606 OID 648678)
-- Name: product_selected_attributes product_selected_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_selected_attributes
    ADD CONSTRAINT product_selected_attributes_pkey PRIMARY KEY (product_selected_attributes_id);


--
-- TOC entry 6206 (class 2606 OID 648680)
-- Name: product_specifications product_specifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_specifications
    ADD CONSTRAINT product_specifications_pkey PRIMARY KEY (prod_spec_id);


--
-- TOC entry 6208 (class 2606 OID 648682)
-- Name: product_temp_image product_temp_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_temp_image
    ADD CONSTRAINT product_temp_image_pkey PRIMARY KEY (id);


--
-- TOC entry 6210 (class 2606 OID 648684)
-- Name: product_variations product_variations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variations
    ADD CONSTRAINT product_variations_pkey PRIMARY KEY (product_variations_id);


--
-- TOC entry 6212 (class 2606 OID 648686)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 6214 (class 2606 OID 648688)
-- Name: promotion_banners promotion_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_banners
    ADD CONSTRAINT promotion_banners_pkey PRIMARY KEY (id);


--
-- TOC entry 6216 (class 2606 OID 648690)
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- TOC entry 6218 (class 2606 OID 648692)
-- Name: ratings_reply ratings_reply_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings_reply
    ADD CONSTRAINT ratings_reply_pkey PRIMARY KEY (id);


--
-- TOC entry 6220 (class 2606 OID 648694)
-- Name: ref_history ref_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_history
    ADD CONSTRAINT ref_history_pkey PRIMARY KEY (id);


--
-- TOC entry 6224 (class 2606 OID 648696)
-- Name: service_assigned_vendors service_assigned_vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_assigned_vendors
    ADD CONSTRAINT service_assigned_vendors_pkey PRIMARY KEY (id);


--
-- TOC entry 6226 (class 2606 OID 648698)
-- Name: service_bookings service_bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_bookings
    ADD CONSTRAINT service_bookings_pkey PRIMARY KEY (id);


--
-- TOC entry 6228 (class 2606 OID 648700)
-- Name: service_category service_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_category
    ADD CONSTRAINT service_category_pkey PRIMARY KEY (id);


--
-- TOC entry 6230 (class 2606 OID 648702)
-- Name: service_category_selected service_category_selected_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_category_selected
    ADD CONSTRAINT service_category_selected_pkey PRIMARY KEY (id);


--
-- TOC entry 6232 (class 2606 OID 648704)
-- Name: service_event_feature service_event_feature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_event_feature
    ADD CONSTRAINT service_event_feature_pkey PRIMARY KEY (id);


--
-- TOC entry 6234 (class 2606 OID 648706)
-- Name: service_images service_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_images
    ADD CONSTRAINT service_images_pkey PRIMARY KEY (id);


--
-- TOC entry 6236 (class 2606 OID 648708)
-- Name: service_include service_include_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_include
    ADD CONSTRAINT service_include_pkey PRIMARY KEY (id);


--
-- TOC entry 6238 (class 2606 OID 648710)
-- Name: service_order_status_history service_order_status_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_order_status_history
    ADD CONSTRAINT service_order_status_history_pkey PRIMARY KEY (id);


--
-- TOC entry 6222 (class 2606 OID 648712)
-- Name: service service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);


--
-- TOC entry 6240 (class 2606 OID 648714)
-- Name: service_timings service_timings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_timings
    ADD CONSTRAINT service_timings_pkey PRIMARY KEY (id);


--
-- TOC entry 6242 (class 2606 OID 648716)
-- Name: service_type service_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_type
    ADD CONSTRAINT service_type_pkey PRIMARY KEY (id);


--
-- TOC entry 6244 (class 2606 OID 648718)
-- Name: service_types service_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_types
    ADD CONSTRAINT service_types_pkey PRIMARY KEY (id);


--
-- TOC entry 6246 (class 2606 OID 648720)
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- TOC entry 6248 (class 2606 OID 648722)
-- Name: skin_colors skin_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin_colors
    ADD CONSTRAINT skin_colors_pkey PRIMARY KEY (id);


--
-- TOC entry 6250 (class 2606 OID 648724)
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- TOC entry 6252 (class 2606 OID 648726)
-- Name: store_images store_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_images
    ADD CONSTRAINT store_images_pkey PRIMARY KEY (id);


--
-- TOC entry 6254 (class 2606 OID 648728)
-- Name: store_likes store_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_likes
    ADD CONSTRAINT store_likes_pkey PRIMARY KEY (id);


--
-- TOC entry 6257 (class 2606 OID 648730)
-- Name: store_managers_types store_managers_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_managers_types
    ADD CONSTRAINT store_managers_types_pkey PRIMARY KEY (id);


--
-- TOC entry 6259 (class 2606 OID 648732)
-- Name: store_type store_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_type
    ADD CONSTRAINT store_type_pkey PRIMARY KEY (id);


--
-- TOC entry 6261 (class 2606 OID 648734)
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- TOC entry 6263 (class 2606 OID 648736)
-- Name: subscribers_emails subscribers_emails_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscribers_emails
    ADD CONSTRAINT subscribers_emails_email_unique UNIQUE (email);


--
-- TOC entry 6265 (class 2606 OID 648738)
-- Name: subscribers_emails subscribers_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscribers_emails
    ADD CONSTRAINT subscribers_emails_pkey PRIMARY KEY (id);


--
-- TOC entry 6267 (class 2606 OID 648740)
-- Name: temp_order_products temp_order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_order_products
    ADD CONSTRAINT temp_order_products_pkey PRIMARY KEY (id);


--
-- TOC entry 6269 (class 2606 OID 648742)
-- Name: temp_orders temp_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_orders
    ADD CONSTRAINT temp_orders_pkey PRIMARY KEY (id);


--
-- TOC entry 6271 (class 2606 OID 648744)
-- Name: temp_service_order_items temp_service_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_service_order_items
    ADD CONSTRAINT temp_service_order_items_pkey PRIMARY KEY (id);


--
-- TOC entry 6273 (class 2606 OID 648746)
-- Name: temp_service_orders temp_service_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_service_orders
    ADD CONSTRAINT temp_service_orders_pkey PRIMARY KEY (id);


--
-- TOC entry 6275 (class 2606 OID 648748)
-- Name: temp_user_account_types temp_user_account_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_user_account_types
    ADD CONSTRAINT temp_user_account_types_pkey PRIMARY KEY (id);


--
-- TOC entry 6277 (class 2606 OID 648750)
-- Name: temp_users temp_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users
    ADD CONSTRAINT temp_users_pkey PRIMARY KEY (id);


--
-- TOC entry 6279 (class 2606 OID 648752)
-- Name: tesimonial tesimonial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tesimonial
    ADD CONSTRAINT tesimonial_pkey PRIMARY KEY (id);


--
-- TOC entry 6281 (class 2606 OID 648754)
-- Name: transport transport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transport
    ADD CONSTRAINT transport_pkey PRIMARY KEY (id);


--
-- TOC entry 6283 (class 2606 OID 648756)
-- Name: user_account_types user_account_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account_types
    ADD CONSTRAINT user_account_types_pkey PRIMARY KEY (id);


--
-- TOC entry 6285 (class 2606 OID 648758)
-- Name: user_address user_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address
    ADD CONSTRAINT user_address_pkey PRIMARY KEY (id);


--
-- TOC entry 6287 (class 2606 OID 648760)
-- Name: user_follows user_follows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_follows
    ADD CONSTRAINT user_follows_pkey PRIMARY KEY (id);


--
-- TOC entry 6290 (class 2606 OID 648762)
-- Name: user_privileges user_privileges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_privileges
    ADD CONSTRAINT user_privileges_pkey PRIMARY KEY (id);


--
-- TOC entry 6294 (class 2606 OID 648764)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 6296 (class 2606 OID 648766)
-- Name: users_role users_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_role
    ADD CONSTRAINT users_role_pkey PRIMARY KEY (id);


--
-- TOC entry 6298 (class 2606 OID 648768)
-- Name: vendor_cuisines vendor_cuisines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_cuisines
    ADD CONSTRAINT vendor_cuisines_pkey PRIMARY KEY (id);


--
-- TOC entry 6300 (class 2606 OID 648770)
-- Name: vendor_details vendor_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_details
    ADD CONSTRAINT vendor_details_pkey PRIMARY KEY (id);


--
-- TOC entry 6302 (class 2606 OID 648772)
-- Name: vendor_followers vendor_followers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_followers
    ADD CONSTRAINT vendor_followers_pkey PRIMARY KEY (id);


--
-- TOC entry 6304 (class 2606 OID 648774)
-- Name: vendor_locations vendor_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_locations
    ADD CONSTRAINT vendor_locations_pkey PRIMARY KEY (id);


--
-- TOC entry 6306 (class 2606 OID 648776)
-- Name: vendor_menu_images vendor_menu_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_menu_images
    ADD CONSTRAINT vendor_menu_images_pkey PRIMARY KEY (id);


--
-- TOC entry 6308 (class 2606 OID 648778)
-- Name: vendor_service_timings vendor_service_timings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_service_timings
    ADD CONSTRAINT vendor_service_timings_pkey PRIMARY KEY (id);


--
-- TOC entry 6310 (class 2606 OID 648780)
-- Name: vendor_services vendor_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_services
    ADD CONSTRAINT vendor_services_pkey PRIMARY KEY (id);


--
-- TOC entry 6312 (class 2606 OID 648782)
-- Name: vendor_timings vendor_timings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_timings
    ADD CONSTRAINT vendor_timings_pkey PRIMARY KEY (id);


--
-- TOC entry 6314 (class 2606 OID 648784)
-- Name: wallet_histories wallet_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_histories
    ADD CONSTRAINT wallet_histories_pkey PRIMARY KEY (id);


--
-- TOC entry 6316 (class 2606 OID 648786)
-- Name: wallet_payment_report wallet_payment_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_payment_report
    ADD CONSTRAINT wallet_payment_report_pkey PRIMARY KEY (id);


--
-- TOC entry 6318 (class 2606 OID 648788)
-- Name: web_banners web_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.web_banners
    ADD CONSTRAINT web_banners_pkey PRIMARY KEY (id);


--
-- TOC entry 6320 (class 2606 OID 648790)
-- Name: websockets_statistics_entries websockets_statistics_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.websockets_statistics_entries
    ADD CONSTRAINT websockets_statistics_entries_pkey PRIMARY KEY (id);


--
-- TOC entry 6322 (class 2606 OID 648792)
-- Name: wishlists wishlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlists
    ADD CONSTRAINT wishlists_pkey PRIMARY KEY (id);


--
-- TOC entry 6094 (class 1259 OID 648793)
-- Name: des_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX des_user_id ON public.designations USING btree (user_id);


--
-- TOC entry 6292 (class 1259 OID 648794)
-- Name: designation_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX designation_id ON public.users USING btree (designation_id);


--
-- TOC entry 6255 (class 1259 OID 648795)
-- Name: man_vendor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX man_vendor_id ON public.store_managers_types USING btree (vendor_id);


--
-- TOC entry 6157 (class 1259 OID 648796)
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- TOC entry 6164 (class 1259 OID 648797)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 6288 (class 1259 OID 648798)
-- Name: user_designation_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_designation_id ON public.user_privileges USING btree (designation_id);


--
-- TOC entry 6291 (class 1259 OID 648799)
-- Name: user_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_user_id ON public.user_privileges USING btree (user_id);


--
-- TOC entry 6323 (class 2606 OID 648800)
-- Name: bank_details bank_details_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_details
    ADD CONSTRAINT bank_details_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 6324 (class 2606 OID 648805)
-- Name: comment_likes comment_likes_comment_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT comment_likes_comment_id_foreign FOREIGN KEY (comment_id) REFERENCES public.post_comments(id) ON DELETE CASCADE;


--
-- TOC entry 6325 (class 2606 OID 648810)
-- Name: comment_likes comment_likes_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT comment_likes_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 6326 (class 2606 OID 648815)
-- Name: comment_taged_users comment_taged_users_comment_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_taged_users
    ADD CONSTRAINT comment_taged_users_comment_id_foreign FOREIGN KEY (comment_id) REFERENCES public.post_comments(id) ON DELETE CASCADE;


--
-- TOC entry 6327 (class 2606 OID 648820)
-- Name: comment_taged_users comment_taged_users_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_taged_users
    ADD CONSTRAINT comment_taged_users_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 6328 (class 2606 OID 648825)
-- Name: designations designations_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT designations_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 6329 (class 2606 OID 648830)
-- Name: help_topics help_topics_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help_topics
    ADD CONSTRAINT help_topics_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 6330 (class 2606 OID 648835)
-- Name: order_products order_products_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- TOC entry 6331 (class 2606 OID 648840)
-- Name: orders orders_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 6332 (class 2606 OID 648845)
-- Name: post_comments post_comments_post_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT post_comments_post_id_foreign FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- TOC entry 6333 (class 2606 OID 648850)
-- Name: post_comments post_comments_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT post_comments_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 6334 (class 2606 OID 648855)
-- Name: post_saves post_saves_post_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_saves
    ADD CONSTRAINT post_saves_post_id_foreign FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- TOC entry 6335 (class 2606 OID 648860)
-- Name: post_saves post_saves_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_saves
    ADD CONSTRAINT post_saves_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 6336 (class 2606 OID 648865)
-- Name: post_users post_users_post_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_users
    ADD CONSTRAINT post_users_post_id_foreign FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- TOC entry 6337 (class 2606 OID 648870)
-- Name: post_users post_users_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_users
    ADD CONSTRAINT post_users_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 6338 (class 2606 OID 648875)
-- Name: product_docs product_docs_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_docs
    ADD CONSTRAINT product_docs_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- TOC entry 6339 (class 2606 OID 648880)
-- Name: product_images product_images_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 6340 (class 2606 OID 648885)
-- Name: product_items product_items_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_items
    ADD CONSTRAINT product_items_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- TOC entry 6341 (class 2606 OID 648890)
-- Name: product_selected_attributes product_selected_attributes_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_selected_attributes
    ADD CONSTRAINT product_selected_attributes_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- TOC entry 6342 (class 2606 OID 648895)
-- Name: product_specifications product_specifications_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_specifications
    ADD CONSTRAINT product_specifications_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- TOC entry 6343 (class 2606 OID 648900)
-- Name: product_variations product_variations_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variations
    ADD CONSTRAINT product_variations_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- TOC entry 6345 (class 2606 OID 648905)
-- Name: service_images service_images_service_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_images
    ADD CONSTRAINT service_images_service_id_foreign FOREIGN KEY (service_id) REFERENCES public.service(id) ON DELETE CASCADE;


--
-- TOC entry 6344 (class 2606 OID 648910)
-- Name: service service_service_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_service_user_id_foreign FOREIGN KEY (service_user_id) REFERENCES public.users(id);


--
-- TOC entry 6346 (class 2606 OID 648915)
-- Name: store_managers_types store_managers_types_vendor_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_managers_types
    ADD CONSTRAINT store_managers_types_vendor_id_foreign FOREIGN KEY (vendor_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 6347 (class 2606 OID 648920)
-- Name: temp_order_products temp_order_products_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_order_products
    ADD CONSTRAINT temp_order_products_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- TOC entry 6348 (class 2606 OID 648925)
-- Name: temp_orders temp_orders_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_orders
    ADD CONSTRAINT temp_orders_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 6349 (class 2606 OID 648930)
-- Name: user_address user_address_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address
    ADD CONSTRAINT user_address_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 6350 (class 2606 OID 648935)
-- Name: user_follows user_follows_follow_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_follows
    ADD CONSTRAINT user_follows_follow_user_id_foreign FOREIGN KEY (follow_user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 6351 (class 2606 OID 648940)
-- Name: user_follows user_follows_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_follows
    ADD CONSTRAINT user_follows_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 6352 (class 2606 OID 648945)
-- Name: vendor_details vendor_details_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_details
    ADD CONSTRAINT vendor_details_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 6353 (class 2606 OID 648950)
-- Name: wallet_histories wallet_histories_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_histories
    ADD CONSTRAINT wallet_histories_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 6805 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2025-03-01 09:50:33

--
-- PostgreSQL database dump complete
--

