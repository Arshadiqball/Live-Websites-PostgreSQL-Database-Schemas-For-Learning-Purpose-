--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15
-- Dumped by pg_dump version 12.15

-- Started on 2025-09-22 17:19:22

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
-- TOC entry 202 (class 1259 OID 24623)
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
-- TOC entry 203 (class 1259 OID 24629)
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
-- TOC entry 5267 (class 0 OID 0)
-- Dependencies: 203
-- Name: aboutus_page_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aboutus_page_settings_id_seq OWNED BY public.aboutus_page_settings.id;


--
-- TOC entry 204 (class 1259 OID 24631)
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
-- TOC entry 205 (class 1259 OID 24640)
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
-- TOC entry 5268 (class 0 OID 0)
-- Dependencies: 205
-- Name: account_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_type_id_seq OWNED BY public.account_type.id;


--
-- TOC entry 206 (class 1259 OID 24642)
-- Name: activity_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity_logs (
    id bigint NOT NULL,
    user_id bigint,
    activity character varying(255) NOT NULL,
    ip_address character varying(255),
    user_agent character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.activity_logs OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 24648)
-- Name: activity_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activity_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activity_logs_id_seq OWNER TO postgres;

--
-- TOC entry 5269 (class 0 OID 0)
-- Dependencies: 207
-- Name: activity_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activity_logs_id_seq OWNED BY public.activity_logs.id;


--
-- TOC entry 208 (class 1259 OID 24650)
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
-- TOC entry 5270 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN activity_type.availbale_for; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.activity_type.availbale_for IS '1-company,2-individual,3-both';


--
-- TOC entry 209 (class 1259 OID 24660)
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
-- TOC entry 5271 (class 0 OID 0)
-- Dependencies: 209
-- Name: activity_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activity_type_id_seq OWNED BY public.activity_type.id;


--
-- TOC entry 210 (class 1259 OID 24662)
-- Name: admin_designation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_designation (
    id bigint NOT NULL,
    name character varying(600) NOT NULL,
    is_deletd integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.admin_designation OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 24669)
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
-- TOC entry 5272 (class 0 OID 0)
-- Dependencies: 211
-- Name: admin_designation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_designation_id_seq OWNED BY public.admin_designation.id;


--
-- TOC entry 212 (class 1259 OID 24671)
-- Name: amount_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.amount_type (
    id bigint NOT NULL,
    name character varying(600) NOT NULL
);


ALTER TABLE public.amount_type OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 24677)
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
-- TOC entry 5273 (class 0 OID 0)
-- Dependencies: 213
-- Name: amount_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.amount_type_id_seq OWNED BY public.amount_type.id;


--
-- TOC entry 214 (class 1259 OID 24679)
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
    is_type_gift character varying(255),
    sort character varying(255) DEFAULT '1'::character varying
);


ALTER TABLE public.app_banners OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24696)
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
-- TOC entry 5274 (class 0 OID 0)
-- Dependencies: 215
-- Name: app_banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_banners_id_seq OWNED BY public.app_banners.id;


--
-- TOC entry 216 (class 1259 OID 24698)
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
-- TOC entry 217 (class 1259 OID 24707)
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
-- TOC entry 5275 (class 0 OID 0)
-- Dependencies: 217
-- Name: app_home_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_home_sections_id_seq OWNED BY public.app_home_sections.id;


--
-- TOC entry 218 (class 1259 OID 24709)
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
    updated_at timestamp(0) without time zone,
    shipping_price numeric(10,2) DEFAULT '0'::numeric NOT NULL
);


ALTER TABLE public.area OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24719)
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
-- TOC entry 5276 (class 0 OID 0)
-- Dependencies: 219
-- Name: area_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.area_id_seq OWNED BY public.area.id;


--
-- TOC entry 220 (class 1259 OID 24721)
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
    updated_at timestamp(0) without time zone,
    user_type character varying(255)
);


ALTER TABLE public.articles OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24728)
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
-- TOC entry 5277 (class 0 OID 0)
-- Dependencies: 221
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- TOC entry 222 (class 1259 OID 24730)
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
-- TOC entry 223 (class 1259 OID 24734)
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
-- TOC entry 5278 (class 0 OID 0)
-- Dependencies: 223
-- Name: attribute_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attribute_type_id_seq OWNED BY public.attribute_type.id;


--
-- TOC entry 224 (class 1259 OID 24736)
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
-- TOC entry 225 (class 1259 OID 24741)
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
-- TOC entry 5279 (class 0 OID 0)
-- Dependencies: 225
-- Name: attribute_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attribute_values_id_seq OWNED BY public.attribute_values.id;


--
-- TOC entry 226 (class 1259 OID 24743)
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
-- TOC entry 227 (class 1259 OID 24750)
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
-- TOC entry 5280 (class 0 OID 0)
-- Dependencies: 227
-- Name: attribute_values_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attribute_values_request_id_seq OWNED BY public.attribute_values_request.id;


--
-- TOC entry 228 (class 1259 OID 24752)
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
-- TOC entry 229 (class 1259 OID 24760)
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
-- TOC entry 5281 (class 0 OID 0)
-- Dependencies: 229
-- Name: attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attributes_id_seq OWNED BY public.attributes.id;


--
-- TOC entry 230 (class 1259 OID 24762)
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
-- TOC entry 231 (class 1259 OID 24768)
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
-- TOC entry 232 (class 1259 OID 24777)
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
-- TOC entry 5282 (class 0 OID 0)
-- Dependencies: 232
-- Name: bank_code_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_code_types_id_seq OWNED BY public.bank_code_types.id;


--
-- TOC entry 233 (class 1259 OID 24779)
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
-- TOC entry 234 (class 1259 OID 24787)
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
-- TOC entry 5283 (class 0 OID 0)
-- Dependencies: 234
-- Name: bank_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_details_id_seq OWNED BY public.bank_details.id;


--
-- TOC entry 235 (class 1259 OID 24789)
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
-- TOC entry 5284 (class 0 OID 0)
-- Dependencies: 235
-- Name: bank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_id_seq OWNED BY public.bank.id;


--
-- TOC entry 236 (class 1259 OID 24791)
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
-- TOC entry 237 (class 1259 OID 24799)
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
-- TOC entry 5285 (class 0 OID 0)
-- Dependencies: 237
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blogs_id_seq OWNED BY public.blogs.id;


--
-- TOC entry 238 (class 1259 OID 24801)
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
-- TOC entry 239 (class 1259 OID 24810)
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
-- TOC entry 5286 (class 0 OID 0)
-- Dependencies: 239
-- Name: brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brand_id_seq OWNED BY public.brand.id;


--
-- TOC entry 240 (class 1259 OID 24812)
-- Name: brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    active smallint DEFAULT '1'::smallint NOT NULL,
    deleted smallint DEFAULT '0'::smallint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    logo character varying(255)
);


ALTER TABLE public.brands OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 24820)
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brands_id_seq OWNER TO postgres;

--
-- TOC entry 5287 (class 0 OID 0)
-- Dependencies: 241
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;


--
-- TOC entry 242 (class 1259 OID 24822)
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
-- TOC entry 243 (class 1259 OID 24830)
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
-- TOC entry 5288 (class 0 OID 0)
-- Dependencies: 243
-- Name: building_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.building_type_id_seq OWNED BY public.building_type.id;


--
-- TOC entry 244 (class 1259 OID 24832)
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
    updated_at timestamp(0) without time zone,
    notes text,
    uploaded_file_path character varying(255)
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 24838)
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
-- TOC entry 5289 (class 0 OID 0)
-- Dependencies: 245
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;


--
-- TOC entry 246 (class 1259 OID 24840)
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
-- TOC entry 247 (class 1259 OID 24850)
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
-- TOC entry 5290 (class 0 OID 0)
-- Dependencies: 247
-- Name: cart_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_service_id_seq OWNED BY public.cart_service.id;


--
-- TOC entry 248 (class 1259 OID 24852)
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
    is_handmade boolean,
    is_gift character varying(255),
    show_gift_page character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 24863)
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
-- TOC entry 5291 (class 0 OID 0)
-- Dependencies: 249
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 250 (class 1259 OID 24865)
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
-- TOC entry 251 (class 1259 OID 24870)
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
-- TOC entry 5292 (class 0 OID 0)
-- Dependencies: 251
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- TOC entry 252 (class 1259 OID 24872)
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
-- TOC entry 253 (class 1259 OID 24875)
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
-- TOC entry 5293 (class 0 OID 0)
-- Dependencies: 253
-- Name: cleaning_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cleaning_services_id_seq OWNED BY public.cleaning_services.id;


--
-- TOC entry 254 (class 1259 OID 24877)
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
-- TOC entry 255 (class 1259 OID 24880)
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
-- TOC entry 5294 (class 0 OID 0)
-- Dependencies: 255
-- Name: comment_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_likes_id_seq OWNED BY public.comment_likes.id;


--
-- TOC entry 256 (class 1259 OID 24882)
-- Name: comment_taged_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment_taged_users (
    id bigint NOT NULL,
    comment_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.comment_taged_users OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 24885)
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
-- TOC entry 5295 (class 0 OID 0)
-- Dependencies: 257
-- Name: comment_taged_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_taged_users_id_seq OWNED BY public.comment_taged_users.id;


--
-- TOC entry 258 (class 1259 OID 24887)
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
-- TOC entry 259 (class 1259 OID 24893)
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
-- TOC entry 5296 (class 0 OID 0)
-- Dependencies: 259
-- Name: contact_us_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_us_id_seq OWNED BY public.contact_us.id;


--
-- TOC entry 260 (class 1259 OID 24895)
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
-- TOC entry 261 (class 1259 OID 24904)
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
-- TOC entry 5297 (class 0 OID 0)
-- Dependencies: 261
-- Name: contact_us_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_us_settings_id_seq OWNED BY public.contact_us_settings.id;


--
-- TOC entry 262 (class 1259 OID 24906)
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
-- TOC entry 263 (class 1259 OID 24912)
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
-- TOC entry 5298 (class 0 OID 0)
-- Dependencies: 263
-- Name: contracting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contracting_id_seq OWNED BY public.contracting.id;


--
-- TOC entry 264 (class 1259 OID 24914)
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
-- TOC entry 265 (class 1259 OID 24922)
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
-- TOC entry 5299 (class 0 OID 0)
-- Dependencies: 265
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;


--
-- TOC entry 266 (class 1259 OID 24924)
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
-- TOC entry 267 (class 1259 OID 24935)
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
-- TOC entry 268 (class 1259 OID 24943)
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
-- TOC entry 5300 (class 0 OID 0)
-- Dependencies: 268
-- Name: coupon_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_brand_id_seq OWNED BY public.coupon_brand.id;


--
-- TOC entry 269 (class 1259 OID 24945)
-- Name: coupon_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupon_category (
    id bigint NOT NULL,
    coupon_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.coupon_category OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 24950)
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
-- TOC entry 5301 (class 0 OID 0)
-- Dependencies: 270
-- Name: coupon_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_category_id_seq OWNED BY public.coupon_category.id;


--
-- TOC entry 271 (class 1259 OID 24952)
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
-- TOC entry 5302 (class 0 OID 0)
-- Dependencies: 271
-- Name: coupon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_id_seq OWNED BY public.coupon.id;


--
-- TOC entry 272 (class 1259 OID 24954)
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
-- TOC entry 273 (class 1259 OID 24961)
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
-- TOC entry 5303 (class 0 OID 0)
-- Dependencies: 273
-- Name: coupon_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_images_id_seq OWNED BY public.coupon_images.id;


--
-- TOC entry 274 (class 1259 OID 24963)
-- Name: coupon_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupon_products (
    id bigint NOT NULL,
    coupon_id integer DEFAULT 0 NOT NULL,
    product_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.coupon_products OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 24968)
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
-- TOC entry 5304 (class 0 OID 0)
-- Dependencies: 275
-- Name: coupon_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_products_id_seq OWNED BY public.coupon_products.id;


--
-- TOC entry 276 (class 1259 OID 24970)
-- Name: coupon_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupon_services (
    id bigint NOT NULL,
    coupon_id integer DEFAULT 0 NOT NULL,
    service_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.coupon_services OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 24975)
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
-- TOC entry 5305 (class 0 OID 0)
-- Dependencies: 277
-- Name: coupon_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_services_id_seq OWNED BY public.coupon_services.id;


--
-- TOC entry 278 (class 1259 OID 24977)
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
-- TOC entry 279 (class 1259 OID 24982)
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
-- TOC entry 5306 (class 0 OID 0)
-- Dependencies: 279
-- Name: coupon_vendor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_vendor_id_seq OWNED BY public.coupon_vendor.id;


--
-- TOC entry 280 (class 1259 OID 24984)
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
-- TOC entry 281 (class 1259 OID 24990)
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
-- TOC entry 5307 (class 0 OID 0)
-- Dependencies: 281
-- Name: coupon_vendor_service_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_vendor_service_order_id_seq OWNED BY public.coupon_vendor_service_order.id;


--
-- TOC entry 282 (class 1259 OID 24992)
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
-- TOC entry 283 (class 1259 OID 25004)
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
-- TOC entry 284 (class 1259 OID 25016)
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
-- TOC entry 5308 (class 0 OID 0)
-- Dependencies: 284
-- Name: coupons_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupons_category_id_seq OWNED BY public.coupons_category.id;


--
-- TOC entry 285 (class 1259 OID 25018)
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
-- TOC entry 5309 (class 0 OID 0)
-- Dependencies: 285
-- Name: coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupons_id_seq OWNED BY public.coupons.id;


--
-- TOC entry 286 (class 1259 OID 25020)
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
-- TOC entry 287 (class 1259 OID 25026)
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
-- TOC entry 5310 (class 0 OID 0)
-- Dependencies: 287
-- Name: cuisines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cuisines_id_seq OWNED BY public.cuisines.id;


--
-- TOC entry 288 (class 1259 OID 25028)
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
-- TOC entry 289 (class 1259 OID 25034)
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
-- TOC entry 5311 (class 0 OID 0)
-- Dependencies: 289
-- Name: currencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.currencies_id_seq OWNED BY public.currencies.id;


--
-- TOC entry 290 (class 1259 OID 25036)
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
-- TOC entry 291 (class 1259 OID 25049)
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
-- TOC entry 5312 (class 0 OID 0)
-- Dependencies: 291
-- Name: custom_banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.custom_banners_id_seq OWNED BY public.custom_banners.id;


--
-- TOC entry 292 (class 1259 OID 25051)
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
-- TOC entry 293 (class 1259 OID 25056)
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
-- TOC entry 5313 (class 0 OID 0)
-- Dependencies: 293
-- Name: designations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.designations_id_seq OWNED BY public.designations.id;


--
-- TOC entry 294 (class 1259 OID 25058)
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
-- TOC entry 295 (class 1259 OID 25064)
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
-- TOC entry 5314 (class 0 OID 0)
-- Dependencies: 295
-- Name: event_features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_features_id_seq OWNED BY public.event_features.id;


--
-- TOC entry 296 (class 1259 OID 25066)
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
-- TOC entry 297 (class 1259 OID 25073)
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
-- TOC entry 5315 (class 0 OID 0)
-- Dependencies: 297
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 298 (class 1259 OID 25075)
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
-- TOC entry 299 (class 1259 OID 25084)
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
-- TOC entry 5316 (class 0 OID 0)
-- Dependencies: 299
-- Name: faq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faq_id_seq OWNED BY public.faq.id;


--
-- TOC entry 300 (class 1259 OID 25086)
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
-- TOC entry 301 (class 1259 OID 25093)
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
-- TOC entry 5317 (class 0 OID 0)
-- Dependencies: 301
-- Name: featured_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.featured_products_id_seq OWNED BY public.featured_products.id;


--
-- TOC entry 302 (class 1259 OID 25095)
-- Name: featured_products_img; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.featured_products_img (
    id bigint NOT NULL,
    featured_product_id integer DEFAULT 0 NOT NULL,
    image character varying(600) NOT NULL
);


ALTER TABLE public.featured_products_img OWNER TO postgres;

--
-- TOC entry 303 (class 1259 OID 25102)
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
-- TOC entry 5318 (class 0 OID 0)
-- Dependencies: 303
-- Name: featured_products_img_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.featured_products_img_id_seq OWNED BY public.featured_products_img.id;


--
-- TOC entry 304 (class 1259 OID 25104)
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
-- TOC entry 305 (class 1259 OID 25109)
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
-- TOC entry 5319 (class 0 OID 0)
-- Dependencies: 305
-- Name: hair_colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hair_colors_id_seq OWNED BY public.hair_colors.id;


--
-- TOC entry 306 (class 1259 OID 25111)
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
-- TOC entry 307 (class 1259 OID 25120)
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
-- TOC entry 5320 (class 0 OID 0)
-- Dependencies: 307
-- Name: help_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.help_id_seq OWNED BY public.help.id;


--
-- TOC entry 308 (class 1259 OID 25122)
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
-- TOC entry 309 (class 1259 OID 25126)
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
-- TOC entry 5321 (class 0 OID 0)
-- Dependencies: 309
-- Name: help_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.help_topics_id_seq OWNED BY public.help_topics.id;


--
-- TOC entry 310 (class 1259 OID 25128)
-- Name: home_logos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_logos (
    id bigint NOT NULL,
    image character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted integer DEFAULT 0 NOT NULL,
    active integer DEFAULT 0 NOT NULL,
    title character varying(255),
    sub_heading text
);


ALTER TABLE public.home_logos OWNER TO postgres;

--
-- TOC entry 311 (class 1259 OID 25136)
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
-- TOC entry 5322 (class 0 OID 0)
-- Dependencies: 311
-- Name: home_logos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_logos_id_seq OWNED BY public.home_logos.id;


--
-- TOC entry 312 (class 1259 OID 25138)
-- Name: home_management; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_management (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    category_id bigint,
    product_ids json,
    banner_ids json,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    sort_order integer DEFAULT 0 NOT NULL,
    category_section_ids json,
    slider_ids json,
    type character varying(255) DEFAULT 'category'::character varying NOT NULL,
    CONSTRAINT home_management_type_check CHECK (((type)::text = ANY (ARRAY[('category'::character varying)::text, ('product'::character varying)::text, ('banner'::character varying)::text, ('category_section'::character varying)::text, ('slider'::character varying)::text, ('recently_view'::character varying)::text])))
);


ALTER TABLE public.home_management OWNER TO postgres;

--
-- TOC entry 313 (class 1259 OID 25148)
-- Name: home_management_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.home_management_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_management_id_seq OWNER TO postgres;

--
-- TOC entry 5323 (class 0 OID 0)
-- Dependencies: 313
-- Name: home_management_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_management_id_seq OWNED BY public.home_management.id;


--
-- TOC entry 314 (class 1259 OID 25150)
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
-- TOC entry 315 (class 1259 OID 25158)
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
-- TOC entry 5324 (class 0 OID 0)
-- Dependencies: 315
-- Name: hourly_rate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hourly_rate_id_seq OWNED BY public.hourly_rate.id;


--
-- TOC entry 316 (class 1259 OID 25160)
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
-- TOC entry 317 (class 1259 OID 25166)
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
-- TOC entry 5325 (class 0 OID 0)
-- Dependencies: 317
-- Name: industry_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.industry_types_id_seq OWNED BY public.industry_types.id;


--
-- TOC entry 318 (class 1259 OID 25168)
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
-- TOC entry 319 (class 1259 OID 25174)
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
-- TOC entry 5326 (class 0 OID 0)
-- Dependencies: 319
-- Name: landing_page_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.landing_page_settings_id_seq OWNED BY public.landing_page_settings.id;


--
-- TOC entry 320 (class 1259 OID 25176)
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
-- TOC entry 321 (class 1259 OID 25182)
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
-- TOC entry 5327 (class 0 OID 0)
-- Dependencies: 321
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- TOC entry 322 (class 1259 OID 25184)
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
-- TOC entry 323 (class 1259 OID 25192)
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
-- TOC entry 5328 (class 0 OID 0)
-- Dependencies: 323
-- Name: main_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_category_id_seq OWNED BY public.main_category.id;


--
-- TOC entry 324 (class 1259 OID 25194)
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
-- TOC entry 325 (class 1259 OID 25200)
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
-- TOC entry 5329 (class 0 OID 0)
-- Dependencies: 325
-- Name: maintainance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maintainance_id_seq OWNED BY public.maintainance.id;


--
-- TOC entry 326 (class 1259 OID 25202)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 327 (class 1259 OID 25205)
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
-- TOC entry 5330 (class 0 OID 0)
-- Dependencies: 327
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 328 (class 1259 OID 25207)
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
-- TOC entry 329 (class 1259 OID 25210)
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
-- TOC entry 5331 (class 0 OID 0)
-- Dependencies: 329
-- Name: moda_main_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moda_main_categories_id_seq OWNED BY public.moda_main_categories.id;


--
-- TOC entry 330 (class 1259 OID 25212)
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
-- TOC entry 5332 (class 0 OID 0)
-- Dependencies: 330
-- Name: COLUMN moda_sub_categories.gender; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.moda_sub_categories.gender IS '1.Male,2.female';


--
-- TOC entry 331 (class 1259 OID 25221)
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
-- TOC entry 5333 (class 0 OID 0)
-- Dependencies: 331
-- Name: moda_sub_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moda_sub_categories_id_seq OWNED BY public.moda_sub_categories.id;


--
-- TOC entry 332 (class 1259 OID 25223)
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
-- TOC entry 333 (class 1259 OID 25226)
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
-- TOC entry 5334 (class 0 OID 0)
-- Dependencies: 333
-- Name: my_moda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.my_moda_id_seq OWNED BY public.my_moda.id;


--
-- TOC entry 334 (class 1259 OID 25228)
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
-- TOC entry 335 (class 1259 OID 25231)
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
-- TOC entry 5335 (class 0 OID 0)
-- Dependencies: 335
-- Name: my_moda_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.my_moda_items_id_seq OWNED BY public.my_moda_items.id;


--
-- TOC entry 336 (class 1259 OID 25233)
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
-- TOC entry 337 (class 1259 OID 25241)
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
-- TOC entry 5336 (class 0 OID 0)
-- Dependencies: 337
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- TOC entry 338 (class 1259 OID 25243)
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
    vendor_id bigint DEFAULT 0,
    order_status integer DEFAULT 0 NOT NULL,
    admin_commission double precision,
    vendor_commission double precision,
    shipping_charge double precision,
    reject_reason text,
    admin_share numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    vendor_share numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    vat_amount numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    customer_notes text,
    customer_file character varying(255),
    is_muted boolean DEFAULT false NOT NULL,
    withdraw_status text DEFAULT '0'::text
);


ALTER TABLE public.order_products OWNER TO postgres;

--
-- TOC entry 339 (class 1259 OID 25261)
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
-- TOC entry 5337 (class 0 OID 0)
-- Dependencies: 339
-- Name: order_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_products_id_seq OWNED BY public.order_products.id;


--
-- TOC entry 340 (class 1259 OID 25263)
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
-- TOC entry 341 (class 1259 OID 25268)
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
-- TOC entry 5338 (class 0 OID 0)
-- Dependencies: 341
-- Name: order_request_view_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_request_view_id_seq OWNED BY public.order_request_view.id;


--
-- TOC entry 342 (class 1259 OID 25270)
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
-- TOC entry 343 (class 1259 OID 25275)
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
-- TOC entry 5339 (class 0 OID 0)
-- Dependencies: 343
-- Name: order_status_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_status_history_id_seq OWNED BY public.order_status_history.id;


--
-- TOC entry 344 (class 1259 OID 25277)
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
-- TOC entry 345 (class 1259 OID 25309)
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
-- TOC entry 5340 (class 0 OID 0)
-- Dependencies: 345
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- TOC entry 346 (class 1259 OID 25311)
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
-- TOC entry 347 (class 1259 OID 25332)
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
-- TOC entry 348 (class 1259 OID 25345)
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
-- TOC entry 5341 (class 0 OID 0)
-- Dependencies: 348
-- Name: orders_services_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_services_items_id_seq OWNED BY public.orders_services_items.id;


--
-- TOC entry 349 (class 1259 OID 25347)
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
-- TOC entry 350 (class 1259 OID 25352)
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
-- TOC entry 5342 (class 0 OID 0)
-- Dependencies: 350
-- Name: orders_services_mute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_services_mute_id_seq OWNED BY public.orders_services_mute.id;


--
-- TOC entry 351 (class 1259 OID 25354)
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
-- TOC entry 5343 (class 0 OID 0)
-- Dependencies: 351
-- Name: orders_services_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_services_order_id_seq OWNED BY public.orders_services.order_id;


--
-- TOC entry 352 (class 1259 OID 25356)
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
-- TOC entry 353 (class 1259 OID 25362)
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
-- TOC entry 5344 (class 0 OID 0)
-- Dependencies: 353
-- Name: orders_services_rejected_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_services_rejected_id_seq OWNED BY public.orders_services_rejected.id;


--
-- TOC entry 354 (class 1259 OID 25364)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- TOC entry 355 (class 1259 OID 25370)
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
-- TOC entry 356 (class 1259 OID 25380)
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
-- TOC entry 5345 (class 0 OID 0)
-- Dependencies: 356
-- Name: payment_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_report_id_seq OWNED BY public.payment_report.id;


--
-- TOC entry 357 (class 1259 OID 25382)
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
-- TOC entry 358 (class 1259 OID 25388)
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
-- TOC entry 5346 (class 0 OID 0)
-- Dependencies: 358
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 359 (class 1259 OID 25390)
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
-- TOC entry 360 (class 1259 OID 25397)
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
-- TOC entry 5347 (class 0 OID 0)
-- Dependencies: 360
-- Name: post_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_comments_id_seq OWNED BY public.post_comments.id;


--
-- TOC entry 361 (class 1259 OID 25399)
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
-- TOC entry 362 (class 1259 OID 25402)
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
-- TOC entry 5348 (class 0 OID 0)
-- Dependencies: 362
-- Name: post_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_likes_id_seq OWNED BY public.post_likes.id;


--
-- TOC entry 363 (class 1259 OID 25404)
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
-- TOC entry 364 (class 1259 OID 25407)
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
-- TOC entry 5349 (class 0 OID 0)
-- Dependencies: 364
-- Name: post_saves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_saves_id_seq OWNED BY public.post_saves.id;


--
-- TOC entry 365 (class 1259 OID 25409)
-- Name: post_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_users (
    id bigint NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.post_users OWNER TO postgres;

--
-- TOC entry 366 (class 1259 OID 25412)
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
-- TOC entry 5350 (class 0 OID 0)
-- Dependencies: 366
-- Name: post_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_users_id_seq OWNED BY public.post_users.id;


--
-- TOC entry 367 (class 1259 OID 25414)
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
-- TOC entry 368 (class 1259 OID 25423)
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
-- TOC entry 5351 (class 0 OID 0)
-- Dependencies: 368
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- TOC entry 369 (class 1259 OID 25425)
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
    product_created_by bigint DEFAULT 0,
    product_updated_by integer DEFAULT 0 NOT NULL,
    product_status integer DEFAULT 0 NOT NULL,
    product_deleted integer DEFAULT 0 NOT NULL,
    product_name character varying(900),
    product_variation_type integer DEFAULT 0 NOT NULL,
    product_taxable integer DEFAULT 1 NOT NULL,
    product_vender_id bigint DEFAULT 0,
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
    new_arrival character varying(255),
    for_you character varying(255),
    trending character varying(255),
    video character varying(255),
    thumbnail character varying(255),
    personalisation boolean DEFAULT false NOT NULL,
    fashion character varying(255),
    home_decor character varying(255),
    shipment_and_policies character varying(600),
    extra_info character varying(255),
    extra_info_title character varying(255)
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 370 (class 1259 OID 25466)
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
-- TOC entry 371 (class 1259 OID 25474)
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
-- TOC entry 5352 (class 0 OID 0)
-- Dependencies: 371
-- Name: product_attribute_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_attribute_attribute_id_seq OWNED BY public.product_attribute.attribute_id;


--
-- TOC entry 372 (class 1259 OID 25476)
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
-- TOC entry 373 (class 1259 OID 25486)
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
-- TOC entry 5353 (class 0 OID 0)
-- Dependencies: 373
-- Name: product_attribute_values_attribute_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_attribute_values_attribute_values_id_seq OWNED BY public.product_attribute_values.attribute_values_id;


--
-- TOC entry 374 (class 1259 OID 25488)
-- Name: product_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_category (
    product_category_id bigint NOT NULL,
    product_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.product_category OWNER TO postgres;

--
-- TOC entry 375 (class 1259 OID 25493)
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
-- TOC entry 5354 (class 0 OID 0)
-- Dependencies: 375
-- Name: product_category_product_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_category_product_category_id_seq OWNED BY public.product_category.product_category_id;


--
-- TOC entry 376 (class 1259 OID 25495)
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
-- TOC entry 377 (class 1259 OID 25500)
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
-- TOC entry 5355 (class 0 OID 0)
-- Dependencies: 377
-- Name: product_cuisines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_cuisines_id_seq OWNED BY public.product_cuisines.id;


--
-- TOC entry 378 (class 1259 OID 25502)
-- Name: product_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_details (
    id bigint NOT NULL,
    product_id bigint,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.product_details OWNER TO postgres;

--
-- TOC entry 379 (class 1259 OID 25505)
-- Name: product_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_details_id_seq OWNER TO postgres;

--
-- TOC entry 5356 (class 0 OID 0)
-- Dependencies: 379
-- Name: product_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_details_id_seq OWNED BY public.product_details.id;


--
-- TOC entry 380 (class 1259 OID 25507)
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
-- TOC entry 381 (class 1259 OID 25514)
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
-- TOC entry 5357 (class 0 OID 0)
-- Dependencies: 381
-- Name: product_docs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_docs_id_seq OWNED BY public.product_docs.id;


--
-- TOC entry 382 (class 1259 OID 25516)
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
-- TOC entry 383 (class 1259 OID 25522)
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
-- TOC entry 5358 (class 0 OID 0)
-- Dependencies: 383
-- Name: product_features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_features_id_seq OWNED BY public.product_features.id;


--
-- TOC entry 384 (class 1259 OID 25524)
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
-- TOC entry 5359 (class 0 OID 0)
-- Dependencies: 384
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 385 (class 1259 OID 25526)
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
-- TOC entry 386 (class 1259 OID 25532)
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
-- TOC entry 5360 (class 0 OID 0)
-- Dependencies: 386
-- Name: product_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_images_id_seq OWNED BY public.product_images.id;


--
-- TOC entry 387 (class 1259 OID 25534)
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
-- TOC entry 388 (class 1259 OID 25541)
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
-- TOC entry 5361 (class 0 OID 0)
-- Dependencies: 388
-- Name: product_items_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_items_item_id_seq OWNED BY public.product_items.item_id;


--
-- TOC entry 389 (class 1259 OID 25543)
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
-- TOC entry 390 (class 1259 OID 25546)
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
-- TOC entry 5362 (class 0 OID 0)
-- Dependencies: 390
-- Name: product_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_likes_id_seq OWNED BY public.product_likes.id;


--
-- TOC entry 391 (class 1259 OID 25548)
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
-- TOC entry 392 (class 1259 OID 25556)
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
-- TOC entry 5363 (class 0 OID 0)
-- Dependencies: 392
-- Name: product_master_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_master_id_seq OWNED BY public.product_master.id;


--
-- TOC entry 393 (class 1259 OID 25558)
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
-- TOC entry 394 (class 1259 OID 25568)
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
-- TOC entry 5364 (class 0 OID 0)
-- Dependencies: 394
-- Name: product_master_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_master_request_id_seq OWNED BY public.product_master_request.id;


--
-- TOC entry 395 (class 1259 OID 25570)
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
-- TOC entry 396 (class 1259 OID 25576)
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
-- TOC entry 5365 (class 0 OID 0)
-- Dependencies: 396
-- Name: product_product_feature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_product_feature_id_seq OWNED BY public.product_product_feature.id;


--
-- TOC entry 397 (class 1259 OID 25578)
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
-- TOC entry 398 (class 1259 OID 25592)
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
-- TOC entry 5366 (class 0 OID 0)
-- Dependencies: 398
-- Name: product_selected_attribute_list_product_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_selected_attribute_list_product_attribute_id_seq OWNED BY public.product_selected_attribute_list.product_attribute_id;


--
-- TOC entry 399 (class 1259 OID 25594)
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
-- TOC entry 400 (class 1259 OID 25600)
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
-- TOC entry 5367 (class 0 OID 0)
-- Dependencies: 400
-- Name: product_selected_attributes_product_selected_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_selected_attributes_product_selected_attributes_id_seq OWNED BY public.product_selected_attributes.product_selected_attributes_id;


--
-- TOC entry 401 (class 1259 OID 25602)
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
-- TOC entry 402 (class 1259 OID 25610)
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
-- TOC entry 5368 (class 0 OID 0)
-- Dependencies: 402
-- Name: product_specifications_prod_spec_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_specifications_prod_spec_id_seq OWNED BY public.product_specifications.prod_spec_id;


--
-- TOC entry 403 (class 1259 OID 25612)
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
-- TOC entry 404 (class 1259 OID 25620)
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
-- TOC entry 5369 (class 0 OID 0)
-- Dependencies: 404
-- Name: product_temp_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_temp_image_id_seq OWNED BY public.product_temp_image.id;


--
-- TOC entry 405 (class 1259 OID 25622)
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
-- TOC entry 406 (class 1259 OID 25629)
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
-- TOC entry 5370 (class 0 OID 0)
-- Dependencies: 406
-- Name: product_variations_product_variations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_variations_product_variations_id_seq OWNED BY public.product_variations.product_variations_id;


--
-- TOC entry 407 (class 1259 OID 25631)
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
-- TOC entry 408 (class 1259 OID 25645)
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
-- TOC entry 5371 (class 0 OID 0)
-- Dependencies: 408
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 409 (class 1259 OID 25647)
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
-- TOC entry 410 (class 1259 OID 25661)
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
-- TOC entry 5372 (class 0 OID 0)
-- Dependencies: 410
-- Name: promotion_banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promotion_banners_id_seq OWNED BY public.promotion_banners.id;


--
-- TOC entry 411 (class 1259 OID 25663)
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
-- TOC entry 412 (class 1259 OID 25676)
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
-- TOC entry 5373 (class 0 OID 0)
-- Dependencies: 412
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;


--
-- TOC entry 413 (class 1259 OID 25678)
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
-- TOC entry 414 (class 1259 OID 25686)
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
-- TOC entry 5374 (class 0 OID 0)
-- Dependencies: 414
-- Name: ratings_reply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ratings_reply_id_seq OWNED BY public.ratings_reply.id;


--
-- TOC entry 415 (class 1259 OID 25688)
-- Name: recently_viewed_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recently_viewed_products (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    product_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.recently_viewed_products OWNER TO postgres;

--
-- TOC entry 416 (class 1259 OID 25691)
-- Name: recently_viewed_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recently_viewed_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recently_viewed_products_id_seq OWNER TO postgres;

--
-- TOC entry 5375 (class 0 OID 0)
-- Dependencies: 416
-- Name: recently_viewed_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recently_viewed_products_id_seq OWNED BY public.recently_viewed_products.id;


--
-- TOC entry 417 (class 1259 OID 25693)
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
-- TOC entry 418 (class 1259 OID 25704)
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
-- TOC entry 5376 (class 0 OID 0)
-- Dependencies: 418
-- Name: ref_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ref_history_id_seq OWNED BY public.ref_history.id;


--
-- TOC entry 419 (class 1259 OID 25706)
-- Name: report_reasons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_reasons (
    id bigint NOT NULL,
    reason character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    reason_type text
);


ALTER TABLE public.report_reasons OWNER TO postgres;

--
-- TOC entry 420 (class 1259 OID 25712)
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
-- TOC entry 5377 (class 0 OID 0)
-- Dependencies: 420
-- Name: report_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_reasons_id_seq OWNED BY public.report_reasons.id;


--
-- TOC entry 421 (class 1259 OID 25714)
-- Name: reported_shops; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reported_shops (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    shop_id bigint,
    reason_id bigint,
    description text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    product_id bigint
);


ALTER TABLE public.reported_shops OWNER TO postgres;

--
-- TOC entry 422 (class 1259 OID 25720)
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
-- TOC entry 5378 (class 0 OID 0)
-- Dependencies: 422
-- Name: reported_shops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reported_shops_id_seq OWNED BY public.reported_shops.id;


--
-- TOC entry 423 (class 1259 OID 25722)
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
    feature_image character varying(255),
    to_time character varying(200),
    from_time character varying(200),
    location character varying(200),
    latitude character varying(200),
    longitude character varying(200),
    vendor_id integer
);


ALTER TABLE public.service OWNER TO postgres;

--
-- TOC entry 5379 (class 0 OID 0)
-- Dependencies: 423
-- Name: COLUMN service.service_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.service_type IS '0 for one day, 1 for week, 2 for month';


--
-- TOC entry 5380 (class 0 OID 0)
-- Dependencies: 423
-- Name: COLUMN service.contract_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.service.contract_type IS '0 for fresh, 1 for Extention';


--
-- TOC entry 424 (class 1259 OID 25736)
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
-- TOC entry 425 (class 1259 OID 25740)
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
-- TOC entry 5381 (class 0 OID 0)
-- Dependencies: 425
-- Name: service_assigned_vendors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_assigned_vendors_id_seq OWNED BY public.service_assigned_vendors.id;


--
-- TOC entry 426 (class 1259 OID 25742)
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
    order_number character varying(255),
    admin_share numeric(10,2),
    vendor_share numeric(10,2)
);


ALTER TABLE public.service_bookings OWNER TO postgres;

--
-- TOC entry 427 (class 1259 OID 25752)
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
-- TOC entry 5382 (class 0 OID 0)
-- Dependencies: 427
-- Name: service_bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_bookings_id_seq OWNED BY public.service_bookings.id;


--
-- TOC entry 428 (class 1259 OID 25754)
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
-- TOC entry 429 (class 1259 OID 25766)
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
-- TOC entry 5383 (class 0 OID 0)
-- Dependencies: 429
-- Name: service_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_category_id_seq OWNED BY public.service_category.id;


--
-- TOC entry 430 (class 1259 OID 25768)
-- Name: service_category_selected; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_category_selected (
    id bigint NOT NULL,
    service_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.service_category_selected OWNER TO postgres;

--
-- TOC entry 431 (class 1259 OID 25773)
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
-- TOC entry 5384 (class 0 OID 0)
-- Dependencies: 431
-- Name: service_category_selected_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_category_selected_id_seq OWNED BY public.service_category_selected.id;


--
-- TOC entry 432 (class 1259 OID 25775)
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
-- TOC entry 433 (class 1259 OID 25781)
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
-- TOC entry 5385 (class 0 OID 0)
-- Dependencies: 433
-- Name: service_event_feature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_event_feature_id_seq OWNED BY public.service_event_feature.id;


--
-- TOC entry 434 (class 1259 OID 25783)
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
-- TOC entry 5386 (class 0 OID 0)
-- Dependencies: 434
-- Name: service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_id_seq OWNED BY public.service.id;


--
-- TOC entry 435 (class 1259 OID 25785)
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
-- TOC entry 436 (class 1259 OID 25788)
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
-- TOC entry 5387 (class 0 OID 0)
-- Dependencies: 436
-- Name: service_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_images_id_seq OWNED BY public.service_images.id;


--
-- TOC entry 437 (class 1259 OID 25790)
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
-- TOC entry 438 (class 1259 OID 25796)
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
-- TOC entry 5388 (class 0 OID 0)
-- Dependencies: 438
-- Name: service_include_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_include_id_seq OWNED BY public.service_include.id;


--
-- TOC entry 439 (class 1259 OID 25798)
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
-- TOC entry 440 (class 1259 OID 25804)
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
-- TOC entry 5389 (class 0 OID 0)
-- Dependencies: 440
-- Name: service_order_status_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_order_status_history_id_seq OWNED BY public.service_order_status_history.id;


--
-- TOC entry 441 (class 1259 OID 25806)
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
-- TOC entry 442 (class 1259 OID 25815)
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
-- TOC entry 5390 (class 0 OID 0)
-- Dependencies: 442
-- Name: service_timings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_timings_id_seq OWNED BY public.service_timings.id;


--
-- TOC entry 443 (class 1259 OID 25817)
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
-- TOC entry 444 (class 1259 OID 25823)
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
-- TOC entry 5391 (class 0 OID 0)
-- Dependencies: 444
-- Name: service_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_type_id_seq OWNED BY public.service_type.id;


--
-- TOC entry 445 (class 1259 OID 25825)
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
-- TOC entry 446 (class 1259 OID 25831)
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
-- TOC entry 5392 (class 0 OID 0)
-- Dependencies: 446
-- Name: service_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_types_id_seq OWNED BY public.service_types.id;


--
-- TOC entry 447 (class 1259 OID 25833)
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
    service_charge double precision DEFAULT '0'::double precision NOT NULL,
    free_shipping_min numeric(10,2) DEFAULT '100'::numeric NOT NULL
);


ALTER TABLE public.settings OWNER TO postgres;

--
-- TOC entry 448 (class 1259 OID 25841)
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
-- TOC entry 5393 (class 0 OID 0)
-- Dependencies: 448
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- TOC entry 449 (class 1259 OID 25843)
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
-- TOC entry 450 (class 1259 OID 25848)
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
-- TOC entry 5394 (class 0 OID 0)
-- Dependencies: 450
-- Name: skin_colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skin_colors_id_seq OWNED BY public.skin_colors.id;


--
-- TOC entry 451 (class 1259 OID 25850)
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
-- TOC entry 452 (class 1259 OID 25855)
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
-- TOC entry 5395 (class 0 OID 0)
-- Dependencies: 452
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- TOC entry 453 (class 1259 OID 25857)
-- Name: store_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_images (
    id bigint NOT NULL,
    image character varying(900),
    store_id bigint NOT NULL
);


ALTER TABLE public.store_images OWNER TO postgres;

--
-- TOC entry 454 (class 1259 OID 25863)
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
-- TOC entry 5396 (class 0 OID 0)
-- Dependencies: 454
-- Name: store_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_images_id_seq OWNED BY public.store_images.id;


--
-- TOC entry 455 (class 1259 OID 25865)
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
-- TOC entry 456 (class 1259 OID 25868)
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
-- TOC entry 5397 (class 0 OID 0)
-- Dependencies: 456
-- Name: store_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_likes_id_seq OWNED BY public.store_likes.id;


--
-- TOC entry 457 (class 1259 OID 25870)
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
-- TOC entry 458 (class 1259 OID 25876)
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
-- TOC entry 5398 (class 0 OID 0)
-- Dependencies: 458
-- Name: store_managers_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_managers_types_id_seq OWNED BY public.store_managers_types.id;


--
-- TOC entry 459 (class 1259 OID 25878)
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
-- TOC entry 460 (class 1259 OID 25886)
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
-- TOC entry 5399 (class 0 OID 0)
-- Dependencies: 460
-- Name: store_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_type_id_seq OWNED BY public.store_type.id;


--
-- TOC entry 461 (class 1259 OID 25888)
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
    last_name character varying(255),
    delivery_type character varying(255),
    standard_delivery_text character varying(255),
    delivery_min_days integer,
    delivery_max_days integer,
    vendor_share numeric(5,2) DEFAULT '95'::numeric NOT NULL,
    admin_share numeric(5,2) DEFAULT '5'::numeric NOT NULL,
    banner character varying(255),
    tax_dial_code character varying(255)
);


ALTER TABLE public.stores OWNER TO postgres;

--
-- TOC entry 462 (class 1259 OID 25900)
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
-- TOC entry 5400 (class 0 OID 0)
-- Dependencies: 462
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stores_id_seq OWNED BY public.stores.id;


--
-- TOC entry 463 (class 1259 OID 25902)
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
-- TOC entry 464 (class 1259 OID 25905)
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
-- TOC entry 5401 (class 0 OID 0)
-- Dependencies: 464
-- Name: subscribers_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscribers_emails_id_seq OWNED BY public.subscribers_emails.id;


--
-- TOC entry 465 (class 1259 OID 25907)
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
    shipping_charge double precision,
    customer_notes text,
    customer_file character varying(255)
);


ALTER TABLE public.temp_order_products OWNER TO postgres;

--
-- TOC entry 466 (class 1259 OID 25919)
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
-- TOC entry 5402 (class 0 OID 0)
-- Dependencies: 466
-- Name: temp_order_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_order_products_id_seq OWNED BY public.temp_order_products.id;


--
-- TOC entry 467 (class 1259 OID 25921)
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
    service_charge double precision DEFAULT '0'::double precision NOT NULL,
    coupon_code boolean DEFAULT false NOT NULL
);


ALTER TABLE public.temp_orders OWNER TO postgres;

--
-- TOC entry 468 (class 1259 OID 25946)
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
-- TOC entry 5403 (class 0 OID 0)
-- Dependencies: 468
-- Name: temp_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_orders_id_seq OWNED BY public.temp_orders.id;


--
-- TOC entry 469 (class 1259 OID 25948)
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
-- TOC entry 470 (class 1259 OID 25959)
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
-- TOC entry 5404 (class 0 OID 0)
-- Dependencies: 470
-- Name: temp_service_order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_service_order_items_id_seq OWNED BY public.temp_service_order_items.id;


--
-- TOC entry 471 (class 1259 OID 25961)
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
-- TOC entry 472 (class 1259 OID 25973)
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
-- TOC entry 5405 (class 0 OID 0)
-- Dependencies: 472
-- Name: temp_service_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_service_orders_id_seq OWNED BY public.temp_service_orders.id;


--
-- TOC entry 473 (class 1259 OID 25975)
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
-- TOC entry 474 (class 1259 OID 25978)
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
-- TOC entry 5406 (class 0 OID 0)
-- Dependencies: 474
-- Name: temp_user_account_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_user_account_types_id_seq OWNED BY public.temp_user_account_types.id;


--
-- TOC entry 475 (class 1259 OID 25980)
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
    password character varying(255),
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
    is_social bigint DEFAULT '0'::bigint
);


ALTER TABLE public.temp_users OWNER TO postgres;

--
-- TOC entry 476 (class 1259 OID 25990)
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
-- TOC entry 5407 (class 0 OID 0)
-- Dependencies: 476
-- Name: temp_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_users_id_seq OWNED BY public.temp_users.id;


--
-- TOC entry 477 (class 1259 OID 25992)
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
-- TOC entry 478 (class 1259 OID 26001)
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
-- TOC entry 5408 (class 0 OID 0)
-- Dependencies: 478
-- Name: tesimonial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tesimonial_id_seq OWNED BY public.tesimonial.id;


--
-- TOC entry 479 (class 1259 OID 26003)
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
-- TOC entry 480 (class 1259 OID 26010)
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
-- TOC entry 5409 (class 0 OID 0)
-- Dependencies: 480
-- Name: transport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transport_id_seq OWNED BY public.transport.id;


--
-- TOC entry 481 (class 1259 OID 26012)
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
-- TOC entry 482 (class 1259 OID 26015)
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
-- TOC entry 5410 (class 0 OID 0)
-- Dependencies: 482
-- Name: user_account_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_account_types_id_seq OWNED BY public.user_account_types.id;


--
-- TOC entry 483 (class 1259 OID 26017)
-- Name: user_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_address (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    full_name character varying(255),
    dial_code character varying(5) NOT NULL,
    phone character varying(20) NOT NULL,
    address character varying(255),
    country_id integer DEFAULT 0 NOT NULL,
    state_id integer DEFAULT 0 NOT NULL,
    city_id integer DEFAULT 0 NOT NULL,
    address_type character varying(255) DEFAULT 'Home'::character varying,
    status integer DEFAULT 1 NOT NULL,
    is_default integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    land_mark character varying(600),
    building_name character varying(600),
    latitude character varying(600),
    longitude character varying(600),
    location character varying(255),
    area_id character varying(255) DEFAULT ''::character varying,
    apartment character varying(255) DEFAULT ''::character varying,
    street character varying(255) DEFAULT ''::character varying,
    email character varying(255)
);


ALTER TABLE public.user_address OWNER TO postgres;

--
-- TOC entry 484 (class 1259 OID 26032)
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
-- TOC entry 5411 (class 0 OID 0)
-- Dependencies: 484
-- Name: user_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_address_id_seq OWNED BY public.user_address.id;


--
-- TOC entry 485 (class 1259 OID 26034)
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
-- TOC entry 486 (class 1259 OID 26037)
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
-- TOC entry 5412 (class 0 OID 0)
-- Dependencies: 486
-- Name: user_follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_follows_id_seq OWNED BY public.user_follows.id;


--
-- TOC entry 487 (class 1259 OID 26039)
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
-- TOC entry 488 (class 1259 OID 26046)
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
-- TOC entry 5413 (class 0 OID 0)
-- Dependencies: 488
-- Name: user_privileges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_privileges_id_seq OWNED BY public.user_privileges.id;


--
-- TOC entry 489 (class 1259 OID 26048)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255),
    email character varying(255),
    dial_code character varying(255),
    phone character varying(255),
    phone_verified integer DEFAULT 0 NOT NULL,
    password character varying(255),
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
    two_factor_auth character varying(255),
    two_factor_code text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 490 (class 1259 OID 26079)
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
-- TOC entry 5414 (class 0 OID 0)
-- Dependencies: 490
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 491 (class 1259 OID 26081)
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
-- TOC entry 492 (class 1259 OID 26084)
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
-- TOC entry 5415 (class 0 OID 0)
-- Dependencies: 492
-- Name: users_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_role_id_seq OWNED BY public.users_role.id;


--
-- TOC entry 493 (class 1259 OID 26086)
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
-- TOC entry 494 (class 1259 OID 26091)
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
-- TOC entry 5416 (class 0 OID 0)
-- Dependencies: 494
-- Name: vendor_cuisines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_cuisines_id_seq OWNED BY public.vendor_cuisines.id;


--
-- TOC entry 495 (class 1259 OID 26093)
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
-- TOC entry 496 (class 1259 OID 26117)
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
-- TOC entry 5417 (class 0 OID 0)
-- Dependencies: 496
-- Name: vendor_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_details_id_seq OWNED BY public.vendor_details.id;


--
-- TOC entry 497 (class 1259 OID 26119)
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
-- TOC entry 498 (class 1259 OID 26124)
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
-- TOC entry 5418 (class 0 OID 0)
-- Dependencies: 498
-- Name: vendor_followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_followers_id_seq OWNED BY public.vendor_followers.id;


--
-- TOC entry 499 (class 1259 OID 26126)
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
-- TOC entry 500 (class 1259 OID 26133)
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
-- TOC entry 5419 (class 0 OID 0)
-- Dependencies: 500
-- Name: vendor_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_locations_id_seq OWNED BY public.vendor_locations.id;


--
-- TOC entry 501 (class 1259 OID 26135)
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
-- TOC entry 502 (class 1259 OID 26140)
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
-- TOC entry 5420 (class 0 OID 0)
-- Dependencies: 502
-- Name: vendor_menu_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_menu_images_id_seq OWNED BY public.vendor_menu_images.id;


--
-- TOC entry 503 (class 1259 OID 26142)
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
-- TOC entry 504 (class 1259 OID 26148)
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
-- TOC entry 5421 (class 0 OID 0)
-- Dependencies: 504
-- Name: vendor_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_messages_id_seq OWNED BY public.vendor_messages.id;


--
-- TOC entry 505 (class 1259 OID 26150)
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
-- TOC entry 506 (class 1259 OID 26165)
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
-- TOC entry 5422 (class 0 OID 0)
-- Dependencies: 506
-- Name: vendor_service_timings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_service_timings_id_seq OWNED BY public.vendor_service_timings.id;


--
-- TOC entry 507 (class 1259 OID 26167)
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
-- TOC entry 508 (class 1259 OID 26170)
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
-- TOC entry 5423 (class 0 OID 0)
-- Dependencies: 508
-- Name: vendor_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_services_id_seq OWNED BY public.vendor_services.id;


--
-- TOC entry 509 (class 1259 OID 26172)
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
-- TOC entry 510 (class 1259 OID 26179)
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
-- TOC entry 5424 (class 0 OID 0)
-- Dependencies: 510
-- Name: vendor_timings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_timings_id_seq OWNED BY public.vendor_timings.id;


--
-- TOC entry 511 (class 1259 OID 26181)
-- Name: vendor_videos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_videos (
    id bigint NOT NULL,
    user_id bigint,
    vendor_id bigint,
    title character varying(255),
    "desc" text,
    url character varying(255),
    likes bigint,
    messages bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.vendor_videos OWNER TO postgres;

--
-- TOC entry 512 (class 1259 OID 26187)
-- Name: vendor_videos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_videos_id_seq OWNER TO postgres;

--
-- TOC entry 5425 (class 0 OID 0)
-- Dependencies: 512
-- Name: vendor_videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_videos_id_seq OWNED BY public.vendor_videos.id;


--
-- TOC entry 513 (class 1259 OID 26189)
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
-- TOC entry 514 (class 1259 OID 26197)
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
-- TOC entry 5426 (class 0 OID 0)
-- Dependencies: 514
-- Name: wallet_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallet_histories_id_seq OWNED BY public.wallet_histories.id;


--
-- TOC entry 515 (class 1259 OID 26199)
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
-- TOC entry 516 (class 1259 OID 26207)
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
-- TOC entry 5427 (class 0 OID 0)
-- Dependencies: 516
-- Name: wallet_payment_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallet_payment_report_id_seq OWNED BY public.wallet_payment_report.id;


--
-- TOC entry 517 (class 1259 OID 26209)
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
    applies_to smallint DEFAULT '0'::smallint NOT NULL,
    category_id bigint,
    product_id bigint
);


ALTER TABLE public.web_banners OWNER TO postgres;

--
-- TOC entry 5428 (class 0 OID 0)
-- Dependencies: 517
-- Name: COLUMN web_banners.applies_to; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.web_banners.applies_to IS '0=none,1=category,2=product';


--
-- TOC entry 518 (class 1259 OID 26218)
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
-- TOC entry 5429 (class 0 OID 0)
-- Dependencies: 518
-- Name: web_banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.web_banners_id_seq OWNED BY public.web_banners.id;


--
-- TOC entry 519 (class 1259 OID 26220)
-- Name: website_banners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.website_banners (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    banner_image character varying(255),
    button_text character varying(255) NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    applies_to character varying(255),
    category_id bigint DEFAULT '0'::bigint NOT NULL,
    product_id bigint DEFAULT '0'::bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.website_banners OWNER TO postgres;

--
-- TOC entry 520 (class 1259 OID 26230)
-- Name: website_banners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.website_banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.website_banners_id_seq OWNER TO postgres;

--
-- TOC entry 5430 (class 0 OID 0)
-- Dependencies: 520
-- Name: website_banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.website_banners_id_seq OWNED BY public.website_banners.id;


--
-- TOC entry 521 (class 1259 OID 26232)
-- Name: website_home_management; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.website_home_management (
    id bigint NOT NULL,
    name character varying(255),
    type character varying(255),
    category_id bigint DEFAULT '0'::bigint NOT NULL,
    product_ids json,
    banner_ids json,
    category_section_ids json,
    slider_ids json,
    sort_order integer DEFAULT 0 NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    cbsc_category_ids json,
    cbsc_banner_id bigint,
    cbsc_shipping_banner_ids json,
    html_content text,
    heading character varying(255)
);


ALTER TABLE public.website_home_management OWNER TO postgres;

--
-- TOC entry 522 (class 1259 OID 26241)
-- Name: website_home_management_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.website_home_management_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.website_home_management_id_seq OWNER TO postgres;

--
-- TOC entry 5431 (class 0 OID 0)
-- Dependencies: 522
-- Name: website_home_management_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.website_home_management_id_seq OWNED BY public.website_home_management.id;


--
-- TOC entry 523 (class 1259 OID 26243)
-- Name: website_sliders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.website_sliders (
    id bigint NOT NULL,
    banner_title character varying(255),
    banner_type character varying(255),
    logo character varying(255),
    banner_image character varying(255),
    description text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    category bigint DEFAULT '0'::bigint NOT NULL,
    product bigint DEFAULT '0'::bigint NOT NULL,
    active boolean DEFAULT true NOT NULL,
    type character varying(255),
    url character varying(255),
    button_text character varying(255)
);


ALTER TABLE public.website_sliders OWNER TO postgres;

--
-- TOC entry 524 (class 1259 OID 26252)
-- Name: website_sliders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.website_sliders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.website_sliders_id_seq OWNER TO postgres;

--
-- TOC entry 5432 (class 0 OID 0)
-- Dependencies: 524
-- Name: website_sliders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.website_sliders_id_seq OWNED BY public.website_sliders.id;


--
-- TOC entry 525 (class 1259 OID 26254)
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
-- TOC entry 526 (class 1259 OID 26257)
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
-- TOC entry 5433 (class 0 OID 0)
-- Dependencies: 526
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.websockets_statistics_entries_id_seq OWNED BY public.websockets_statistics_entries.id;


--
-- TOC entry 527 (class 1259 OID 26259)
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
-- TOC entry 528 (class 1259 OID 26262)
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
-- TOC entry 5434 (class 0 OID 0)
-- Dependencies: 528
-- Name: wishlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wishlists_id_seq OWNED BY public.wishlists.id;


--
-- TOC entry 3771 (class 2604 OID 26264)
-- Name: aboutus_page_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aboutus_page_settings ALTER COLUMN id SET DEFAULT nextval('public.aboutus_page_settings_id_seq'::regclass);


--
-- TOC entry 3775 (class 2604 OID 26265)
-- Name: account_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_type ALTER COLUMN id SET DEFAULT nextval('public.account_type_id_seq'::regclass);


--
-- TOC entry 3776 (class 2604 OID 26266)
-- Name: activity_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_logs ALTER COLUMN id SET DEFAULT nextval('public.activity_logs_id_seq'::regclass);


--
-- TOC entry 3781 (class 2604 OID 26267)
-- Name: activity_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_type ALTER COLUMN id SET DEFAULT nextval('public.activity_type_id_seq'::regclass);


--
-- TOC entry 3783 (class 2604 OID 26268)
-- Name: admin_designation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_designation ALTER COLUMN id SET DEFAULT nextval('public.admin_designation_id_seq'::regclass);


--
-- TOC entry 3784 (class 2604 OID 26269)
-- Name: amount_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amount_type ALTER COLUMN id SET DEFAULT nextval('public.amount_type_id_seq'::regclass);


--
-- TOC entry 3796 (class 2604 OID 26270)
-- Name: app_banners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_banners ALTER COLUMN id SET DEFAULT nextval('public.app_banners_id_seq'::regclass);


--
-- TOC entry 3800 (class 2604 OID 26271)
-- Name: app_home_sections id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_home_sections ALTER COLUMN id SET DEFAULT nextval('public.app_home_sections_id_seq'::regclass);


--
-- TOC entry 3805 (class 2604 OID 26272)
-- Name: area id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area ALTER COLUMN id SET DEFAULT nextval('public.area_id_seq'::regclass);


--
-- TOC entry 3806 (class 2604 OID 26273)
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- TOC entry 3808 (class 2604 OID 26274)
-- Name: attribute_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_type ALTER COLUMN id SET DEFAULT nextval('public.attribute_type_id_seq'::regclass);


--
-- TOC entry 3812 (class 2604 OID 26275)
-- Name: attribute_values id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_values ALTER COLUMN id SET DEFAULT nextval('public.attribute_values_id_seq'::regclass);


--
-- TOC entry 3813 (class 2604 OID 26276)
-- Name: attribute_values_request id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_values_request ALTER COLUMN id SET DEFAULT nextval('public.attribute_values_request_id_seq'::regclass);


--
-- TOC entry 3820 (class 2604 OID 26277)
-- Name: attributes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attributes ALTER COLUMN id SET DEFAULT nextval('public.attributes_id_seq'::regclass);


--
-- TOC entry 3821 (class 2604 OID 26278)
-- Name: bank id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank ALTER COLUMN id SET DEFAULT nextval('public.bank_id_seq'::regclass);


--
-- TOC entry 3825 (class 2604 OID 26279)
-- Name: bank_code_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_code_types ALTER COLUMN id SET DEFAULT nextval('public.bank_code_types_id_seq'::regclass);


--
-- TOC entry 3828 (class 2604 OID 26280)
-- Name: bank_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_details ALTER COLUMN id SET DEFAULT nextval('public.bank_details_id_seq'::regclass);


--
-- TOC entry 3831 (class 2604 OID 26281)
-- Name: blogs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq'::regclass);


--
-- TOC entry 3835 (class 2604 OID 26282)
-- Name: brand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand ALTER COLUMN id SET DEFAULT nextval('public.brand_id_seq'::regclass);


--
-- TOC entry 3838 (class 2604 OID 26283)
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);


--
-- TOC entry 3841 (class 2604 OID 26284)
-- Name: building_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.building_type ALTER COLUMN id SET DEFAULT nextval('public.building_type_id_seq'::regclass);


--
-- TOC entry 3842 (class 2604 OID 26285)
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);


--
-- TOC entry 3847 (class 2604 OID 26286)
-- Name: cart_service id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_service ALTER COLUMN id SET DEFAULT nextval('public.cart_service_id_seq'::regclass);


--
-- TOC entry 3853 (class 2604 OID 26287)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3856 (class 2604 OID 26288)
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- TOC entry 3857 (class 2604 OID 26289)
-- Name: cleaning_services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cleaning_services ALTER COLUMN id SET DEFAULT nextval('public.cleaning_services_id_seq'::regclass);


--
-- TOC entry 3858 (class 2604 OID 26290)
-- Name: comment_likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_likes ALTER COLUMN id SET DEFAULT nextval('public.comment_likes_id_seq'::regclass);


--
-- TOC entry 3859 (class 2604 OID 26291)
-- Name: comment_taged_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_taged_users ALTER COLUMN id SET DEFAULT nextval('public.comment_taged_users_id_seq'::regclass);


--
-- TOC entry 3860 (class 2604 OID 26292)
-- Name: contact_us id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us ALTER COLUMN id SET DEFAULT nextval('public.contact_us_id_seq'::regclass);


--
-- TOC entry 3864 (class 2604 OID 26293)
-- Name: contact_us_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us_settings ALTER COLUMN id SET DEFAULT nextval('public.contact_us_settings_id_seq'::regclass);


--
-- TOC entry 3865 (class 2604 OID 26294)
-- Name: contracting id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracting ALTER COLUMN id SET DEFAULT nextval('public.contracting_id_seq'::regclass);


--
-- TOC entry 3868 (class 2604 OID 26295)
-- Name: country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- TOC entry 3874 (class 2604 OID 26296)
-- Name: coupon id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon ALTER COLUMN id SET DEFAULT nextval('public.coupon_id_seq'::regclass);


--
-- TOC entry 3877 (class 2604 OID 26297)
-- Name: coupon_brand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_brand ALTER COLUMN id SET DEFAULT nextval('public.coupon_brand_id_seq'::regclass);


--
-- TOC entry 3880 (class 2604 OID 26298)
-- Name: coupon_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_category ALTER COLUMN id SET DEFAULT nextval('public.coupon_category_id_seq'::regclass);


--
-- TOC entry 3881 (class 2604 OID 26299)
-- Name: coupon_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_images ALTER COLUMN id SET DEFAULT nextval('public.coupon_images_id_seq'::regclass);


--
-- TOC entry 3885 (class 2604 OID 26300)
-- Name: coupon_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_products ALTER COLUMN id SET DEFAULT nextval('public.coupon_products_id_seq'::regclass);


--
-- TOC entry 3888 (class 2604 OID 26301)
-- Name: coupon_services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_services ALTER COLUMN id SET DEFAULT nextval('public.coupon_services_id_seq'::regclass);


--
-- TOC entry 3891 (class 2604 OID 26302)
-- Name: coupon_vendor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_vendor ALTER COLUMN id SET DEFAULT nextval('public.coupon_vendor_id_seq'::regclass);


--
-- TOC entry 3895 (class 2604 OID 26303)
-- Name: coupon_vendor_service_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_vendor_service_order ALTER COLUMN id SET DEFAULT nextval('public.coupon_vendor_service_order_id_seq'::regclass);


--
-- TOC entry 3902 (class 2604 OID 26304)
-- Name: coupons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons ALTER COLUMN id SET DEFAULT nextval('public.coupons_id_seq'::regclass);


--
-- TOC entry 3909 (class 2604 OID 26305)
-- Name: coupons_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons_category ALTER COLUMN id SET DEFAULT nextval('public.coupons_category_id_seq'::regclass);


--
-- TOC entry 3913 (class 2604 OID 26306)
-- Name: cuisines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuisines ALTER COLUMN id SET DEFAULT nextval('public.cuisines_id_seq'::regclass);


--
-- TOC entry 3914 (class 2604 OID 26307)
-- Name: currencies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currencies ALTER COLUMN id SET DEFAULT nextval('public.currencies_id_seq'::regclass);


--
-- TOC entry 3922 (class 2604 OID 26308)
-- Name: custom_banners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_banners ALTER COLUMN id SET DEFAULT nextval('public.custom_banners_id_seq'::regclass);


--
-- TOC entry 3925 (class 2604 OID 26309)
-- Name: designations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.designations ALTER COLUMN id SET DEFAULT nextval('public.designations_id_seq'::regclass);


--
-- TOC entry 3926 (class 2604 OID 26310)
-- Name: event_features id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_features ALTER COLUMN id SET DEFAULT nextval('public.event_features_id_seq'::regclass);


--
-- TOC entry 3927 (class 2604 OID 26311)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 3932 (class 2604 OID 26312)
-- Name: faq id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faq ALTER COLUMN id SET DEFAULT nextval('public.faq_id_seq'::regclass);


--
-- TOC entry 3933 (class 2604 OID 26313)
-- Name: featured_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.featured_products ALTER COLUMN id SET DEFAULT nextval('public.featured_products_id_seq'::regclass);


--
-- TOC entry 3935 (class 2604 OID 26314)
-- Name: featured_products_img id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.featured_products_img ALTER COLUMN id SET DEFAULT nextval('public.featured_products_img_id_seq'::regclass);


--
-- TOC entry 3939 (class 2604 OID 26315)
-- Name: hair_colors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hair_colors ALTER COLUMN id SET DEFAULT nextval('public.hair_colors_id_seq'::regclass);


--
-- TOC entry 3943 (class 2604 OID 26316)
-- Name: help id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help ALTER COLUMN id SET DEFAULT nextval('public.help_id_seq'::regclass);


--
-- TOC entry 3944 (class 2604 OID 26317)
-- Name: help_topics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help_topics ALTER COLUMN id SET DEFAULT nextval('public.help_topics_id_seq'::regclass);


--
-- TOC entry 3948 (class 2604 OID 26318)
-- Name: home_logos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_logos ALTER COLUMN id SET DEFAULT nextval('public.home_logos_id_seq'::regclass);


--
-- TOC entry 3952 (class 2604 OID 26319)
-- Name: home_management id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_management ALTER COLUMN id SET DEFAULT nextval('public.home_management_id_seq'::regclass);


--
-- TOC entry 3956 (class 2604 OID 26320)
-- Name: hourly_rate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hourly_rate ALTER COLUMN id SET DEFAULT nextval('public.hourly_rate_id_seq'::regclass);


--
-- TOC entry 3960 (class 2604 OID 26321)
-- Name: industry_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industry_types ALTER COLUMN id SET DEFAULT nextval('public.industry_types_id_seq'::regclass);


--
-- TOC entry 3961 (class 2604 OID 26322)
-- Name: landing_page_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.landing_page_settings ALTER COLUMN id SET DEFAULT nextval('public.landing_page_settings_id_seq'::regclass);


--
-- TOC entry 3965 (class 2604 OID 26323)
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- TOC entry 3968 (class 2604 OID 26324)
-- Name: main_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_category ALTER COLUMN id SET DEFAULT nextval('public.main_category_id_seq'::regclass);


--
-- TOC entry 3969 (class 2604 OID 26325)
-- Name: maintainance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintainance ALTER COLUMN id SET DEFAULT nextval('public.maintainance_id_seq'::regclass);


--
-- TOC entry 3970 (class 2604 OID 26326)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3971 (class 2604 OID 26327)
-- Name: moda_main_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moda_main_categories ALTER COLUMN id SET DEFAULT nextval('public.moda_main_categories_id_seq'::regclass);


--
-- TOC entry 3975 (class 2604 OID 26328)
-- Name: moda_sub_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moda_sub_categories ALTER COLUMN id SET DEFAULT nextval('public.moda_sub_categories_id_seq'::regclass);


--
-- TOC entry 3976 (class 2604 OID 26329)
-- Name: my_moda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.my_moda ALTER COLUMN id SET DEFAULT nextval('public.my_moda_id_seq'::regclass);


--
-- TOC entry 3977 (class 2604 OID 26330)
-- Name: my_moda_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.my_moda_items ALTER COLUMN id SET DEFAULT nextval('public.my_moda_items_id_seq'::regclass);


--
-- TOC entry 3980 (class 2604 OID 26331)
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- TOC entry 3993 (class 2604 OID 26332)
-- Name: order_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products ALTER COLUMN id SET DEFAULT nextval('public.order_products_id_seq'::regclass);


--
-- TOC entry 3996 (class 2604 OID 26333)
-- Name: order_request_view id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_request_view ALTER COLUMN id SET DEFAULT nextval('public.order_request_view_id_seq'::regclass);


--
-- TOC entry 3999 (class 2604 OID 26334)
-- Name: order_status_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_history ALTER COLUMN id SET DEFAULT nextval('public.order_status_history_id_seq'::regclass);


--
-- TOC entry 4026 (class 2604 OID 26335)
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- TOC entry 4042 (class 2604 OID 26336)
-- Name: orders_services order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services ALTER COLUMN order_id SET DEFAULT nextval('public.orders_services_order_id_seq'::regclass);


--
-- TOC entry 4050 (class 2604 OID 26337)
-- Name: orders_services_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services_items ALTER COLUMN id SET DEFAULT nextval('public.orders_services_items_id_seq'::regclass);


--
-- TOC entry 4053 (class 2604 OID 26338)
-- Name: orders_services_mute id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services_mute ALTER COLUMN id SET DEFAULT nextval('public.orders_services_mute_id_seq'::regclass);


--
-- TOC entry 4057 (class 2604 OID 26339)
-- Name: orders_services_rejected id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services_rejected ALTER COLUMN id SET DEFAULT nextval('public.orders_services_rejected_id_seq'::regclass);


--
-- TOC entry 4062 (class 2604 OID 26340)
-- Name: payment_report id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_report ALTER COLUMN id SET DEFAULT nextval('public.payment_report_id_seq'::regclass);


--
-- TOC entry 4063 (class 2604 OID 26341)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 4064 (class 2604 OID 26342)
-- Name: post_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments ALTER COLUMN id SET DEFAULT nextval('public.post_comments_id_seq'::regclass);


--
-- TOC entry 4066 (class 2604 OID 26343)
-- Name: post_likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_likes ALTER COLUMN id SET DEFAULT nextval('public.post_likes_id_seq'::regclass);


--
-- TOC entry 4067 (class 2604 OID 26344)
-- Name: post_saves id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_saves ALTER COLUMN id SET DEFAULT nextval('public.post_saves_id_seq'::regclass);


--
-- TOC entry 4068 (class 2604 OID 26345)
-- Name: post_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_users ALTER COLUMN id SET DEFAULT nextval('public.post_users_id_seq'::regclass);


--
-- TOC entry 4072 (class 2604 OID 26346)
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- TOC entry 4108 (class 2604 OID 26347)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 4111 (class 2604 OID 26348)
-- Name: product_attribute attribute_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_attribute ALTER COLUMN attribute_id SET DEFAULT nextval('public.product_attribute_attribute_id_seq'::regclass);


--
-- TOC entry 4116 (class 2604 OID 26349)
-- Name: product_attribute_values attribute_values_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_attribute_values ALTER COLUMN attribute_values_id SET DEFAULT nextval('public.product_attribute_values_attribute_values_id_seq'::regclass);


--
-- TOC entry 4119 (class 2604 OID 26350)
-- Name: product_category product_category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category ALTER COLUMN product_category_id SET DEFAULT nextval('public.product_category_product_category_id_seq'::regclass);


--
-- TOC entry 4122 (class 2604 OID 26351)
-- Name: product_cuisines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cuisines ALTER COLUMN id SET DEFAULT nextval('public.product_cuisines_id_seq'::regclass);


--
-- TOC entry 4123 (class 2604 OID 26352)
-- Name: product_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_details ALTER COLUMN id SET DEFAULT nextval('public.product_details_id_seq'::regclass);


--
-- TOC entry 4124 (class 2604 OID 26353)
-- Name: product_docs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_docs ALTER COLUMN id SET DEFAULT nextval('public.product_docs_id_seq'::regclass);


--
-- TOC entry 4126 (class 2604 OID 26354)
-- Name: product_features id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_features ALTER COLUMN id SET DEFAULT nextval('public.product_features_id_seq'::regclass);


--
-- TOC entry 4127 (class 2604 OID 26355)
-- Name: product_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images ALTER COLUMN id SET DEFAULT nextval('public.product_images_id_seq'::regclass);


--
-- TOC entry 4128 (class 2604 OID 26356)
-- Name: product_items item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_items ALTER COLUMN item_id SET DEFAULT nextval('public.product_items_item_id_seq'::regclass);


--
-- TOC entry 4130 (class 2604 OID 26357)
-- Name: product_likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_likes ALTER COLUMN id SET DEFAULT nextval('public.product_likes_id_seq'::regclass);


--
-- TOC entry 4133 (class 2604 OID 26358)
-- Name: product_master id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_master ALTER COLUMN id SET DEFAULT nextval('public.product_master_id_seq'::regclass);


--
-- TOC entry 4138 (class 2604 OID 26359)
-- Name: product_master_request id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_master_request ALTER COLUMN id SET DEFAULT nextval('public.product_master_request_id_seq'::regclass);


--
-- TOC entry 4139 (class 2604 OID 26360)
-- Name: product_product_feature id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_product_feature ALTER COLUMN id SET DEFAULT nextval('public.product_product_feature_id_seq'::regclass);


--
-- TOC entry 4148 (class 2604 OID 26361)
-- Name: product_selected_attribute_list product_attribute_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_selected_attribute_list ALTER COLUMN product_attribute_id SET DEFAULT nextval('public.product_selected_attribute_list_product_attribute_id_seq'::regclass);


--
-- TOC entry 4152 (class 2604 OID 26362)
-- Name: product_selected_attributes product_selected_attributes_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_selected_attributes ALTER COLUMN product_selected_attributes_id SET DEFAULT nextval('public.product_selected_attributes_product_selected_attributes_id_seq'::regclass);


--
-- TOC entry 4155 (class 2604 OID 26363)
-- Name: product_specifications prod_spec_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_specifications ALTER COLUMN prod_spec_id SET DEFAULT nextval('public.product_specifications_prod_spec_id_seq'::regclass);


--
-- TOC entry 4158 (class 2604 OID 26364)
-- Name: product_temp_image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_temp_image ALTER COLUMN id SET DEFAULT nextval('public.product_temp_image_id_seq'::regclass);


--
-- TOC entry 4163 (class 2604 OID 26365)
-- Name: product_variations product_variations_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variations ALTER COLUMN product_variations_id SET DEFAULT nextval('public.product_variations_product_variations_id_seq'::regclass);


--
-- TOC entry 4172 (class 2604 OID 26366)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 4181 (class 2604 OID 26367)
-- Name: promotion_banners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_banners ALTER COLUMN id SET DEFAULT nextval('public.promotion_banners_id_seq'::regclass);


--
-- TOC entry 4189 (class 2604 OID 26368)
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- TOC entry 4192 (class 2604 OID 26369)
-- Name: ratings_reply id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings_reply ALTER COLUMN id SET DEFAULT nextval('public.ratings_reply_id_seq'::regclass);


--
-- TOC entry 4193 (class 2604 OID 26370)
-- Name: recently_viewed_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recently_viewed_products ALTER COLUMN id SET DEFAULT nextval('public.recently_viewed_products_id_seq'::regclass);


--
-- TOC entry 4199 (class 2604 OID 26371)
-- Name: ref_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_history ALTER COLUMN id SET DEFAULT nextval('public.ref_history_id_seq'::regclass);


--
-- TOC entry 4200 (class 2604 OID 26372)
-- Name: report_reasons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_reasons ALTER COLUMN id SET DEFAULT nextval('public.report_reasons_id_seq'::regclass);


--
-- TOC entry 4201 (class 2604 OID 26373)
-- Name: reported_shops id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reported_shops ALTER COLUMN id SET DEFAULT nextval('public.reported_shops_id_seq'::regclass);


--
-- TOC entry 4210 (class 2604 OID 26374)
-- Name: service id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service ALTER COLUMN id SET DEFAULT nextval('public.service_id_seq'::regclass);


--
-- TOC entry 4211 (class 2604 OID 26375)
-- Name: service_assigned_vendors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_assigned_vendors ALTER COLUMN id SET DEFAULT nextval('public.service_assigned_vendors_id_seq'::regclass);


--
-- TOC entry 4217 (class 2604 OID 26376)
-- Name: service_bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_bookings ALTER COLUMN id SET DEFAULT nextval('public.service_bookings_id_seq'::regclass);


--
-- TOC entry 4224 (class 2604 OID 26377)
-- Name: service_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_category ALTER COLUMN id SET DEFAULT nextval('public.service_category_id_seq'::regclass);


--
-- TOC entry 4227 (class 2604 OID 26378)
-- Name: service_category_selected id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_category_selected ALTER COLUMN id SET DEFAULT nextval('public.service_category_selected_id_seq'::regclass);


--
-- TOC entry 4228 (class 2604 OID 26379)
-- Name: service_event_feature id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_event_feature ALTER COLUMN id SET DEFAULT nextval('public.service_event_feature_id_seq'::regclass);


--
-- TOC entry 4229 (class 2604 OID 26380)
-- Name: service_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_images ALTER COLUMN id SET DEFAULT nextval('public.service_images_id_seq'::regclass);


--
-- TOC entry 4230 (class 2604 OID 26381)
-- Name: service_include id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_include ALTER COLUMN id SET DEFAULT nextval('public.service_include_id_seq'::regclass);


--
-- TOC entry 4234 (class 2604 OID 26382)
-- Name: service_order_status_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_order_status_history ALTER COLUMN id SET DEFAULT nextval('public.service_order_status_history_id_seq'::regclass);


--
-- TOC entry 4238 (class 2604 OID 26383)
-- Name: service_timings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_timings ALTER COLUMN id SET DEFAULT nextval('public.service_timings_id_seq'::regclass);


--
-- TOC entry 4239 (class 2604 OID 26384)
-- Name: service_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_type ALTER COLUMN id SET DEFAULT nextval('public.service_type_id_seq'::regclass);


--
-- TOC entry 4243 (class 2604 OID 26385)
-- Name: service_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_types ALTER COLUMN id SET DEFAULT nextval('public.service_types_id_seq'::regclass);


--
-- TOC entry 4249 (class 2604 OID 26386)
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- TOC entry 4252 (class 2604 OID 26387)
-- Name: skin_colors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin_colors ALTER COLUMN id SET DEFAULT nextval('public.skin_colors_id_seq'::regclass);


--
-- TOC entry 4255 (class 2604 OID 26388)
-- Name: states id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- TOC entry 4256 (class 2604 OID 26389)
-- Name: store_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_images ALTER COLUMN id SET DEFAULT nextval('public.store_images_id_seq'::regclass);


--
-- TOC entry 4257 (class 2604 OID 26390)
-- Name: store_likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_likes ALTER COLUMN id SET DEFAULT nextval('public.store_likes_id_seq'::regclass);


--
-- TOC entry 4258 (class 2604 OID 26391)
-- Name: store_managers_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_managers_types ALTER COLUMN id SET DEFAULT nextval('public.store_managers_types_id_seq'::regclass);


--
-- TOC entry 4261 (class 2604 OID 26392)
-- Name: store_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_type ALTER COLUMN id SET DEFAULT nextval('public.store_type_id_seq'::regclass);


--
-- TOC entry 4268 (class 2604 OID 26393)
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores ALTER COLUMN id SET DEFAULT nextval('public.stores_id_seq'::regclass);


--
-- TOC entry 4269 (class 2604 OID 26394)
-- Name: subscribers_emails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscribers_emails ALTER COLUMN id SET DEFAULT nextval('public.subscribers_emails_id_seq'::regclass);


--
-- TOC entry 4276 (class 2604 OID 26395)
-- Name: temp_order_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_order_products ALTER COLUMN id SET DEFAULT nextval('public.temp_order_products_id_seq'::regclass);


--
-- TOC entry 4296 (class 2604 OID 26396)
-- Name: temp_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_orders ALTER COLUMN id SET DEFAULT nextval('public.temp_orders_id_seq'::regclass);


--
-- TOC entry 4302 (class 2604 OID 26397)
-- Name: temp_service_order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_service_order_items ALTER COLUMN id SET DEFAULT nextval('public.temp_service_order_items_id_seq'::regclass);


--
-- TOC entry 4309 (class 2604 OID 26398)
-- Name: temp_service_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_service_orders ALTER COLUMN id SET DEFAULT nextval('public.temp_service_orders_id_seq'::regclass);


--
-- TOC entry 4310 (class 2604 OID 26399)
-- Name: temp_user_account_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_user_account_types ALTER COLUMN id SET DEFAULT nextval('public.temp_user_account_types_id_seq'::regclass);


--
-- TOC entry 4315 (class 2604 OID 26400)
-- Name: temp_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users ALTER COLUMN id SET DEFAULT nextval('public.temp_users_id_seq'::regclass);


--
-- TOC entry 4319 (class 2604 OID 26401)
-- Name: tesimonial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tesimonial ALTER COLUMN id SET DEFAULT nextval('public.tesimonial_id_seq'::regclass);


--
-- TOC entry 4320 (class 2604 OID 26402)
-- Name: transport id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transport ALTER COLUMN id SET DEFAULT nextval('public.transport_id_seq'::regclass);


--
-- TOC entry 4322 (class 2604 OID 26403)
-- Name: user_account_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account_types ALTER COLUMN id SET DEFAULT nextval('public.user_account_types_id_seq'::regclass);


--
-- TOC entry 4332 (class 2604 OID 26404)
-- Name: user_address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address ALTER COLUMN id SET DEFAULT nextval('public.user_address_id_seq'::regclass);


--
-- TOC entry 4333 (class 2604 OID 26405)
-- Name: user_follows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_follows ALTER COLUMN id SET DEFAULT nextval('public.user_follows_id_seq'::regclass);


--
-- TOC entry 4334 (class 2604 OID 26406)
-- Name: user_privileges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_privileges ALTER COLUMN id SET DEFAULT nextval('public.user_privileges_id_seq'::regclass);


--
-- TOC entry 4361 (class 2604 OID 26407)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4362 (class 2604 OID 26408)
-- Name: users_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_role ALTER COLUMN id SET DEFAULT nextval('public.users_role_id_seq'::regclass);


--
-- TOC entry 4365 (class 2604 OID 26409)
-- Name: vendor_cuisines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_cuisines ALTER COLUMN id SET DEFAULT nextval('public.vendor_cuisines_id_seq'::regclass);


--
-- TOC entry 4384 (class 2604 OID 26410)
-- Name: vendor_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_details ALTER COLUMN id SET DEFAULT nextval('public.vendor_details_id_seq'::regclass);


--
-- TOC entry 4387 (class 2604 OID 26411)
-- Name: vendor_followers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_followers ALTER COLUMN id SET DEFAULT nextval('public.vendor_followers_id_seq'::regclass);


--
-- TOC entry 4388 (class 2604 OID 26412)
-- Name: vendor_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_locations ALTER COLUMN id SET DEFAULT nextval('public.vendor_locations_id_seq'::regclass);


--
-- TOC entry 4392 (class 2604 OID 26413)
-- Name: vendor_menu_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_menu_images ALTER COLUMN id SET DEFAULT nextval('public.vendor_menu_images_id_seq'::regclass);


--
-- TOC entry 4393 (class 2604 OID 26414)
-- Name: vendor_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_messages ALTER COLUMN id SET DEFAULT nextval('public.vendor_messages_id_seq'::regclass);


--
-- TOC entry 4403 (class 2604 OID 26415)
-- Name: vendor_service_timings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_service_timings ALTER COLUMN id SET DEFAULT nextval('public.vendor_service_timings_id_seq'::regclass);


--
-- TOC entry 4404 (class 2604 OID 26416)
-- Name: vendor_services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_services ALTER COLUMN id SET DEFAULT nextval('public.vendor_services_id_seq'::regclass);


--
-- TOC entry 4405 (class 2604 OID 26417)
-- Name: vendor_timings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_timings ALTER COLUMN id SET DEFAULT nextval('public.vendor_timings_id_seq'::regclass);


--
-- TOC entry 4407 (class 2604 OID 26418)
-- Name: vendor_videos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_videos ALTER COLUMN id SET DEFAULT nextval('public.vendor_videos_id_seq'::regclass);


--
-- TOC entry 4410 (class 2604 OID 26419)
-- Name: wallet_histories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_histories ALTER COLUMN id SET DEFAULT nextval('public.wallet_histories_id_seq'::regclass);


--
-- TOC entry 4413 (class 2604 OID 26420)
-- Name: wallet_payment_report id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_payment_report ALTER COLUMN id SET DEFAULT nextval('public.wallet_payment_report_id_seq'::regclass);


--
-- TOC entry 4417 (class 2604 OID 26421)
-- Name: web_banners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.web_banners ALTER COLUMN id SET DEFAULT nextval('public.web_banners_id_seq'::regclass);


--
-- TOC entry 4422 (class 2604 OID 26422)
-- Name: website_banners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.website_banners ALTER COLUMN id SET DEFAULT nextval('public.website_banners_id_seq'::regclass);


--
-- TOC entry 4426 (class 2604 OID 26423)
-- Name: website_home_management id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.website_home_management ALTER COLUMN id SET DEFAULT nextval('public.website_home_management_id_seq'::regclass);


--
-- TOC entry 4430 (class 2604 OID 26424)
-- Name: website_sliders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.website_sliders ALTER COLUMN id SET DEFAULT nextval('public.website_sliders_id_seq'::regclass);


--
-- TOC entry 4431 (class 2604 OID 26425)
-- Name: websockets_statistics_entries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.websockets_statistics_entries ALTER COLUMN id SET DEFAULT nextval('public.websockets_statistics_entries_id_seq'::regclass);


--
-- TOC entry 4432 (class 2604 OID 26426)
-- Name: wishlists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlists ALTER COLUMN id SET DEFAULT nextval('public.wishlists_id_seq'::regclass);


--
-- TOC entry 4935 (class 0 OID 24623)
-- Dependencies: 202
-- Data for Name: aboutus_page_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aboutus_page_settings (id, meta_key, meta_value, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4937 (class 0 OID 24631)
-- Dependencies: 204
-- Data for Name: account_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_type (id, name, description, sort_order, status, indvidual_name, indvidual_image, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4939 (class 0 OID 24642)
-- Dependencies: 206
-- Data for Name: activity_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activity_logs (id, user_id, activity, ip_address, user_agent, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4941 (class 0 OID 24650)
-- Dependencies: 208
-- Data for Name: activity_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activity_type (id, account_id, name, description, logo, sort_order, status, availbale_for, indvidual_name, indvidual_logo, deleted, created_at, updated_at, banner_image) FROM stdin;
\.


--
-- TOC entry 4943 (class 0 OID 24662)
-- Dependencies: 210
-- Data for Name: admin_designation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_designation (id, name, is_deletd) FROM stdin;
\.


--
-- TOC entry 4945 (class 0 OID 24671)
-- Dependencies: 212
-- Data for Name: amount_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.amount_type (id, name) FROM stdin;
\.


--
-- TOC entry 4947 (class 0 OID 24679)
-- Dependencies: 214
-- Data for Name: app_banners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_banners (id, banner_title, banner_image, active, created_by, updated_by, created_at, updated_at, type, category, product, service, banner_type, activity, store, url, is_type_gift, sort) FROM stdin;
\.


--
-- TOC entry 4949 (class 0 OID 24698)
-- Dependencies: 216
-- Data for Name: app_home_sections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_home_sections (id, type, entity_id, title, status, sort_order, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4951 (class 0 OID 24709)
-- Dependencies: 218
-- Data for Name: area; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.area (id, country_id, city_id, name, status, latitude, longitude, deleted_at, created_at, updated_at, shipping_price) FROM stdin;
\.


--
-- TOC entry 4953 (class 0 OID 24721)
-- Dependencies: 220
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles (id, title_en, title_ar, status, desc_en, desc_ar, meta_title, meta_keyword, meta_description, created_at, updated_at, user_type) FROM stdin;
\.


--
-- TOC entry 4955 (class 0 OID 24730)
-- Dependencies: 222
-- Data for Name: attribute_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attribute_type (id, attribute_type_name, attribute_type_uid, attribute_type_status) FROM stdin;
\.


--
-- TOC entry 4957 (class 0 OID 24736)
-- Dependencies: 224
-- Data for Name: attribute_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attribute_values (id, attribute_id, attribute_values, attribute_value_in, attribute_value_color, deleted, created_uid, updated_uid, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4959 (class 0 OID 24743)
-- Dependencies: 226
-- Data for Name: attribute_values_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attribute_values_request (id, request_id, attribute, value) FROM stdin;
\.


--
-- TOC entry 4961 (class 0 OID 24752)
-- Dependencies: 228
-- Data for Name: attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attributes (id, attribute_name, active, attribute_type, industry_type, company_id, store_id, is_common, deleted, created_uid, updated_uid, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4963 (class 0 OID 24762)
-- Dependencies: 230
-- Data for Name: bank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank (id, name, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4964 (class 0 OID 24768)
-- Dependencies: 231
-- Data for Name: bank_code_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank_code_types (id, name, country_id, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4966 (class 0 OID 24779)
-- Dependencies: 233
-- Data for Name: bank_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank_details (id, bank_name, company_account, code_type, account_no, branch_code, branch_name, bank_statement_doc, credit_card_sta_doc, country, user_id, created_at, updated_at, iban) FROM stdin;
\.


--
-- TOC entry 4969 (class 0 OID 24791)
-- Dependencies: 236
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blogs (id, name, description, blog_image, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4971 (class 0 OID 24801)
-- Dependencies: 238
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brand (id, name, industry_type, image, active, created_at, updated_at, deleted, activity_id) FROM stdin;
\.


--
-- TOC entry 4973 (class 0 OID 24812)
-- Dependencies: 240
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brands (id, name, slug, active, deleted, created_at, updated_at, logo) FROM stdin;
\.


--
-- TOC entry 4975 (class 0 OID 24822)
-- Dependencies: 242
-- Data for Name: building_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.building_type (id, name, description, created_at, updated_at, active, deleted) FROM stdin;
\.


--
-- TOC entry 4977 (class 0 OID 24832)
-- Dependencies: 244
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, product_id, product_attribute_id, quantity, user_id, store_id, device_cart_id, created_at, updated_at, notes, uploaded_file_path) FROM stdin;
\.


--
-- TOC entry 4979 (class 0 OID 24840)
-- Dependencies: 246
-- Data for Name: cart_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_service (id, service_id, user_id, device_cart_id, booked_time, created_at, updated_at, building_type_id, text, hourly_rate, task_description, doc, qty) FROM stdin;
\.


--
-- TOC entry 4981 (class 0 OID 24852)
-- Dependencies: 248
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name, image, banner_image, parent_id, active, deleted, sort_order, created_uid, updated_uid, created_at, updated_at, activity_id, home_page, sub_title, is_handmade, is_gift, show_gift_page) FROM stdin;
\.


--
-- TOC entry 4983 (class 0 OID 24865)
-- Dependencies: 250
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name, active, country_id, state_id, created_uid, updated_uid, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4985 (class 0 OID 24872)
-- Dependencies: 252
-- Data for Name: cleaning_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cleaning_services (id, title, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4987 (class 0 OID 24877)
-- Dependencies: 254
-- Data for Name: comment_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment_likes (id, comment_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4989 (class 0 OID 24882)
-- Dependencies: 256
-- Data for Name: comment_taged_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment_taged_users (id, comment_id, user_id) FROM stdin;
\.


--
-- TOC entry 4991 (class 0 OID 24887)
-- Dependencies: 258
-- Data for Name: contact_us; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_us (id, name, email, dial_code, mobile_number, message, created_at, updated_at, subject) FROM stdin;
\.


--
-- TOC entry 4993 (class 0 OID 24895)
-- Dependencies: 260
-- Data for Name: contact_us_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_us_settings (id, title_en, title_ar, email, mobile, desc_en, desc_ar, location, latitude, longitude, twitter, instagram, facebook, youtube, linkedin, created_at, updated_at, ref_discount, ref_discount_type, transport_website_link, pinterest, tiktok, whatsapp) FROM stdin;
\.


--
-- TOC entry 4995 (class 0 OID 24906)
-- Dependencies: 262
-- Data for Name: contracting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contracting (id, title, description, building_type, contract_type, file, deleted, created_at, updated_at, user_id, status, price, qoutation_file, transaction_id, payment_ref) FROM stdin;
\.


--
-- TOC entry 4997 (class 0 OID 24914)
-- Dependencies: 264
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, name, prefix, dial_code, active, created_at, updated_at, deleted) FROM stdin;
\.


--
-- TOC entry 4999 (class 0 OID 24924)
-- Dependencies: 266
-- Data for Name: coupon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon (id, coupon_title, coupon_description, coupon_end_date, coupon_amount, coupon_minimum_spend, coupon_max_spend, coupon_usage_percoupon, coupon_usage_perx, coupon_usage_peruser, coupon_vender_id, coupon_status, deleted, coupon_code, amount_type, start_date, applied_to, minimum_amount, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5000 (class 0 OID 24935)
-- Dependencies: 267
-- Data for Name: coupon_brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_brand (id, name, image, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5002 (class 0 OID 24945)
-- Dependencies: 269
-- Data for Name: coupon_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_category (id, coupon_id, category_id) FROM stdin;
\.


--
-- TOC entry 5005 (class 0 OID 24954)
-- Dependencies: 272
-- Data for Name: coupon_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_images (id, coupon_id, image, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5007 (class 0 OID 24963)
-- Dependencies: 274
-- Data for Name: coupon_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_products (id, coupon_id, product_id) FROM stdin;
\.


--
-- TOC entry 5009 (class 0 OID 24970)
-- Dependencies: 276
-- Data for Name: coupon_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_services (id, coupon_id, service_id) FROM stdin;
\.


--
-- TOC entry 5011 (class 0 OID 24977)
-- Dependencies: 278
-- Data for Name: coupon_vendor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_vendor (id, vendor, coupon_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5013 (class 0 OID 24984)
-- Dependencies: 280
-- Data for Name: coupon_vendor_service_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_vendor_service_order (id, vendor_id, coupon_id, order_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5015 (class 0 OID 24992)
-- Dependencies: 282
-- Data for Name: coupons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupons (id, title, title_ar, brand_id, category_id, coupon_code, active, sort_order, trending, hot_deal, description, description_ar, created_at, updated_at, start_date, coupon_end_date) FROM stdin;
\.


--
-- TOC entry 5016 (class 0 OID 25004)
-- Dependencies: 283
-- Data for Name: coupons_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupons_category (id, name, image, banner_image, parent_id, active, deleted, sort_order, created_uid, updated_uid, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5019 (class 0 OID 25020)
-- Dependencies: 286
-- Data for Name: cuisines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuisines (id, name, status, deleted, sort_order, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5021 (class 0 OID 25028)
-- Dependencies: 288
-- Data for Name: currencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currencies (id, name, code, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5023 (class 0 OID 25036)
-- Dependencies: 290
-- Data for Name: custom_banners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.custom_banners (id, banner_title, banner_image, active, created_by, updated_by, type, category, product, service, banner_type, activity, store, url, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5025 (class 0 OID 25051)
-- Dependencies: 292
-- Data for Name: designations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.designations (id, user_id, user_type, designation, status, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 5027 (class 0 OID 25058)
-- Dependencies: 294
-- Data for Name: event_features; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_features (id, name, image_path, description, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5029 (class 0 OID 25066)
-- Dependencies: 296
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 5031 (class 0 OID 25075)
-- Dependencies: 298
-- Data for Name: faq; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faq (id, title, description, created_by, updated_by, active, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5033 (class 0 OID 25086)
-- Dependencies: 300
-- Data for Name: featured_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.featured_products (id, master_product, description, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5035 (class 0 OID 25095)
-- Dependencies: 302
-- Data for Name: featured_products_img; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.featured_products_img (id, featured_product_id, image) FROM stdin;
\.


--
-- TOC entry 5037 (class 0 OID 25104)
-- Dependencies: 304
-- Data for Name: hair_colors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hair_colors (id, name, color, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5039 (class 0 OID 25111)
-- Dependencies: 306
-- Data for Name: help; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.help (id, title, description, created_by, updated_by, active, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5041 (class 0 OID 25122)
-- Dependencies: 308
-- Data for Name: help_topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.help_topics (id, user_id, topic, created_at, updated_at, is_survey_topic) FROM stdin;
\.


--
-- TOC entry 5043 (class 0 OID 25128)
-- Dependencies: 310
-- Data for Name: home_logos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_logos (id, image, created_at, updated_at, deleted, active, title, sub_heading) FROM stdin;
\.


--
-- TOC entry 5045 (class 0 OID 25138)
-- Dependencies: 312
-- Data for Name: home_management; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_management (id, name, category_id, product_ids, banner_ids, active, created_at, updated_at, sort_order, category_section_ids, slider_ids, type) FROM stdin;
\.


--
-- TOC entry 5047 (class 0 OID 25150)
-- Dependencies: 314
-- Data for Name: hourly_rate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hourly_rate (id, text, hourly_rate, created_at, updated_at, service_id) FROM stdin;
\.


--
-- TOC entry 5049 (class 0 OID 25160)
-- Dependencies: 316
-- Data for Name: industry_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.industry_types (id, name, active, deleted, sort_order, created_uid, updated_uid, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5051 (class 0 OID 25168)
-- Dependencies: 318
-- Data for Name: landing_page_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.landing_page_settings (id, meta_key, meta_value, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5053 (class 0 OID 25176)
-- Dependencies: 320
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.likes (id, user_id, product_id, vendor_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5055 (class 0 OID 25184)
-- Dependencies: 322
-- Data for Name: main_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_category (id, name, sub_title, image, button_link, deleted, active, created_at, updated_at, banner_image) FROM stdin;
\.


--
-- TOC entry 5057 (class 0 OID 25194)
-- Dependencies: 324
-- Data for Name: maintainance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maintainance (id, title, description, building_type, file, deleted, created_at, updated_at, user_id, status, price, qoutation_file, transaction_id, payment_ref) FROM stdin;
\.


--
-- TOC entry 5059 (class 0 OID 25202)
-- Dependencies: 326
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
288	2024_03_09_062943_service_dates	1
289	2024_03_19_090426_task_description1	1
290	2024_03_19_090713_task_description2	1
291	2024_03_20_043848_create_app_home_sections_table	1
292	2024_03_20_075350_create_custom_banners_table	1
293	2024_10_12_100000_create_event_features_table	1
294	2024_10_12_100000_create_product_features_table	1
295	2024_10_12_100000_create_product_product_feature_table	1
296	2024_10_12_100000_create_service_event_feature_table	1
297	2024_10_31_221947_create_report_reasons_table	1
298	2024_10_31_222021_create_reported_artists_table	1
299	2024_12_20_165612_create_product_items_table	1
300	2025_01_06_065824_add_home_page_column_to_category_table	1
301	2025_01_06_070849_add_sub_title_column_to_category_table	1
302	2025_01_06_191158_create_home_logos_table	1
303	2025_01_06_191458_add_deleted_to_home_logos_table	1
304	2025_01_06_192141_add_active_to_home_logos_table	1
305	2025_01_07_062618_create_help_topics_table	1
306	2025_01_07_072131_make_phone_nullable_in_users_table	1
307	2025_01_07_072620_add_is_survey_topic_to_help_topics_table	1
308	2025_01_07_075530_create_currencies_table	1
309	2025_01_07_081018_add_missing_columns_to_stores_table	1
310	2025_01_07_120940_make_fields_nullable_in_stores_table	1
311	2025_01_07_141424_create_blogs_table	1
312	2025_01_08_104625_add_tax_address_columns_to_stores_table	1
313	2025_01_08_214128_add_location_to_users_table	1
314	2025_01_09_024536_create_main_category_table	1
315	2025_01_09_034309_create_service_booking_table	1
316	2025_01_09_034309_create_web_banners_table	1
317	2025_01_09_034309_vendor_follow	1
318	2025_01_10_074013_add_two_factor_auth_to_users_table	1
319	2025_01_10_074748_add_additional_fields_to_stores_table	1
320	2025_01_10_080006_add_first_and_last_name_to_stores_table	1
321	2025_01_10_080705_update_vendor_details_columns	1
322	2025_01_12_013804_add_banner_image_to_main_category_table	1
323	2025_01_12_014459_add_is_handmade_to_category_table	1
324	2025_01_12_234703_create_service_images_table	1
325	2025_01_13_012752_add_feature_image_to_services_table	1
326	2025_01_13_092050_update_is_handmade_column_nullable_in_category_table	1
327	2025_01_16_083825_create_wishlists_table	1
328	2025_01_17_160835_add_name_and_email_to_ratings_table	1
329	2025_01_20_203400_update_subject_nullable_in_contact_us_table	1
330	2025_01_21_051039_add_social_fields_to_contact_us_settings_table	1
331	2025_01_21_054129_create_aboutus_page_setting_table	1
332	2025_02_28_222021_create_vendor_messages_table	1
333	2025_03_19_090713_category22	1
334	2025_03_19_090713_category23	1
335	2025_03_19_090713_event_feature_title	1
336	2025_03_19_090713_feature_title	1
337	2025_03_19_090713_product_checks	1
338	2025_03_19_090713_product_plocies	1
339	2025_03_19_090713_product_plocies2	1
340	2025_03_19_090713_service25	1
341	2025_03_19_090713_service26	1
342	2025_03_19_090714_Banner1	1
343	2025_03_19_090714_service_booking1	1
344	2025_03_19_090714_service_booking2	1
345	2025_03_19_090714_vendor_messages	1
346	2025_04_07_080315_create_vendor_videos_table	1
347	2025_05_02_040800_create_recently_viewed_products_table	1
348	2025_05_02_055202_add_notes_and_file_to_carts_table	1
349	2025_05_05_085328_add_video_to_products_table	1
350	2025_05_05_133222_add_video_thumnail_to_products_table	1
351	2025_05_06_075657_add_delivery_fields_to_stores_table	1
352	2025_05_07_114839_create_activity_logs_table	1
353	2025_05_07_124552_add_reject_reason_to_order_products_table	1
354	2025_05_07_124552_add_vendor_and_admin_share_to_stores_table	1
355	2025_05_08_111955_add_is_personalizable_to_products_table	1
356	2025_05_09_110049_add_admin_vendor_share_to_order_products_table	1
357	2025_05_09_162823_add_two_factor_code_to_users_table	1
358	2025_05_09_162823_add_vat_amount_to_order_products_table	1
359	2025_05_10_104848_add_commission_columns_to_service_bookings_table	1
360	2025_05_20_055720_add_extra_info_title_to_product_table	1
361	2025_05_20_055720_add_extra_info_to_product_table	1
362	2025_05_20_055720_add_fashion_and_home_decor_to_product_table	1
363	2025_05_20_055720_add_fashion_and_home_decor_to_reported_shops_table	1
364	2025_05_23_142108_add_email_to_user_address_table	1
365	2025_05_23_161048_add_customer_fields_to_order_and_temp_order_products_tables	1
366	2025_05_23_161624_add_coupon_code_to_temp_orders_table	1
367	2025_05_23_161624_add_is_muted_to_order_products_table	1
368	2025_05_24_031314_add_user_type_to_articles_table	1
369	2025_05_26_113702_add_banner_to_stores_table	1
370	2025_05_29_084619_temp_users_update	1
371	2025_06_09_084619_order_products_update	1
372	2025_06_09_143845_add_fields_in_banner_table	1
373	2025_06_09_143845_add_fields_in_dial_code_stors_table	1
374	2025_07_07_100430_make_product_vender_id_nullable	2
375	2025_07_07_100613_make_product_created_by_nullable	2
376	2025_07_08_115545_create_home_management_models_table	3
377	2025_07_10_090844_create_home_management_table	3
378	2025_07_11_120847_add_sort_order_to_home_management_table	4
379	2025_07_11_124537_add_category_section_ids_and_slider_ids_to_home_management_table	4
380	2025_07_11_125405_update_home_management_table	4
381	2025_07_14_081258_create_product_details_table	5
382	2025_07_14_101815_modify_type_column_in_home_management_table	6
383	2025_07_22_223025_add_applies_to_columns_to_web_banners_table	7
384	2025_07_28_161305_create_website_banners_table	8
385	2025_07_29_093142_create_website_sliders_table	8
386	2025_07_29_103653_add_category_and_product_to_website_sliders_table	8
387	2025_07_29_103818_add_active_to_website_sliders_table	8
388	2025_07_29_104004_add_type_to_website_sliders_table	8
389	2025_07_29_104112_add_url_to_website_sliders_table	8
390	2025_07_29_105909_create_website_home_management_table	8
391	2025_07_29_113724_add_button_text_to_website_sliders_table	8
392	2025_07_29_121501_add_cbsc_fields_to_website_home_management_table	9
393	2025_07_30_234327_add_title_and_sub_heading_to_home_logos_table	10
394	2025_08_17_030720_alter_vendor_id_nullable_in_order_products_table	11
395	2025_08_18_112724_alter_temp_users_make_password_nullable	12
396	2025_08_18_123000_alter_users_password_nullable	12
397	2025_08_20_202504_update_user_addresses_nullable_columns	13
398	2025_08_22_054359_add_html_content_to_website_home_management_table	14
399	2025_08_22_060425_add_heading_to_website_home_management_table	14
400	2025_09_03_232310_add_shipping_price_to_areas_table	15
401	2025_09_04_030445_add_free_shipping_min_to_settings_table	16
402	2025_09_13_113214_create_brands_table	17
403	2025_09_15_120542_add_logo_to_brands_table	18
405	2025_09_13_121126_add_product_brand_id_to_product_table	5
\.


--
-- TOC entry 5061 (class 0 OID 25207)
-- Dependencies: 328
-- Data for Name: moda_main_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moda_main_categories (id, name, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5063 (class 0 OID 25212)
-- Dependencies: 330
-- Data for Name: moda_sub_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moda_sub_categories (id, main_category, name, gender, image, active, sort_order, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5065 (class 0 OID 25223)
-- Dependencies: 332
-- Data for Name: my_moda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.my_moda (id, user_id, date, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5067 (class 0 OID 25228)
-- Dependencies: 334
-- Data for Name: my_moda_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.my_moda_items (id, my_moda_id, product_id, product_attribute_id, moda_sub_category, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5069 (class 0 OID 25233)
-- Dependencies: 336
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, description, title, image, created_at, updated_at, user_type, user_id) FROM stdin;
\.


--
-- TOC entry 5071 (class 0 OID 25243)
-- Dependencies: 338
-- Data for Name: order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_products (id, order_id, product_id, product_attribute_id, product_type, quantity, price, discount, total, vendor_id, order_status, admin_commission, vendor_commission, shipping_charge, reject_reason, admin_share, vendor_share, vat_amount, customer_notes, customer_file, is_muted, withdraw_status) FROM stdin;
\.


--
-- TOC entry 5073 (class 0 OID 25263)
-- Dependencies: 340
-- Data for Name: order_request_view; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_request_view (id, vendor, service_order, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5075 (class 0 OID 25270)
-- Dependencies: 342
-- Data for Name: order_status_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_status_history (id, order_id, status_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5077 (class 0 OID 25277)
-- Dependencies: 344
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, invoice_id, user_id, address_id, total, vat, discount, grand_total, payment_mode, status, booking_date, total_qty, total_items_qty, oder_type, admin_commission, vendor_commission, shipping_charge, created_at, updated_at, is_muted, refund_method, refund_requested, refund_requested_date, order_no, ref_history_id, ref_code, withdraw_status, withdraw_request_at, vendor_id, admin_commission_per, vendor_commission_per, admin_commission_percentage, vendor_commission_percentage, activity_id, order_type, order_number, pick_up_date, pick_up_time, service_charge) FROM stdin;
\.


--
-- TOC entry 5079 (class 0 OID 25311)
-- Dependencies: 346
-- Data for Name: orders_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_services (order_id, invoice_id, user_id, address_id, total, vat, discount, grand_total, payment_mode, status, booking_date, admin_commission, vendor_commission, created_at, updated_at, is_mute, refund_method, refund_requested, refund_accepted, refund_requested_date, refund_accepted_date, order_no, coupon_id, coupon_vender_id, read_admin, accepted_vendor, accepted_date, ref_history_id, ref_code, activity_id, user_latitude, user_longitude, service_charge, task_description, doc) FROM stdin;
\.


--
-- TOC entry 5080 (class 0 OID 25332)
-- Dependencies: 347
-- Data for Name: orders_services_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_services_items (id, order_id, service_id, price, discount, total, order_status, admin_commission, vendor_commission, booking_date, created_at, updated_at, accepted_vendor, accepted_date, text, hourly_rate, task_description, doc, qty, withdraw_status, withdraw_request_at, vat, vendor_comment, vendor_doc) FROM stdin;
\.


--
-- TOC entry 5082 (class 0 OID 25347)
-- Dependencies: 349
-- Data for Name: orders_services_mute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_services_mute (id, vendor_id, service_order_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5085 (class 0 OID 25356)
-- Dependencies: 352
-- Data for Name: orders_services_rejected; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_services_rejected (id, vendor_id, service_order_id, service_order_item_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5087 (class 0 OID 25364)
-- Dependencies: 354
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 5088 (class 0 OID 25370)
-- Dependencies: 355
-- Data for Name: payment_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_report (id, transaction_id, payment_status, user_id, ref_id, amount, method_type, vat, wallet_amount_used, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5090 (class 0 OID 25382)
-- Dependencies: 357
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, created_at, updated_at) FROM stdin;
1	App\\Models\\User	2	Personal Access Token	ed68ca4f63a2c5bd08f612ab69478f6b40590a7f581775510f6ee37c48436982	["*"]	\N	2025-07-14 12:18:12	2025-07-14 12:18:12
2	App\\Models\\User	3	Personal Access Token	b83ae6fb2a38117dc39f2bf9b4fdc016e9f4aa73a44ceb9447a54739f74f8040	["*"]	\N	2025-07-14 12:19:03	2025-07-14 12:19:03
3	App\\Models\\User	3	Personal Access Token	d02cc59a0c59c489b065871649db8227ff065c1161d326c3b184e065b9367a79	["*"]	\N	2025-07-14 12:19:42	2025-07-14 12:19:42
4	App\\Models\\User	3	Personal Access Token	0d001d05e04df1cbefb69d00a085834d8ad2c9eca9c0e13e2b2c11631d475566	["*"]	\N	2025-07-14 12:19:59	2025-07-14 12:19:59
5	App\\Models\\User	3	Personal Access Token	4820fd2734b04d70d09e4b1cfd99b39b9da655776468e4eb02df442b523430eb	["*"]	\N	2025-07-14 12:20:12	2025-07-14 12:20:12
6	App\\Models\\User	3	Personal Access Token	829b8a35711f605cde9c16c75f59806e988454ea3ee34e0052911db9eb8e62a5	["*"]	\N	2025-07-14 12:20:12	2025-07-14 12:20:12
7	App\\Models\\User	3	Personal Access Token	ba4ab5070d866968d391d3bd097679dc6eefe4545456473868feec9d9fff7984	["*"]	\N	2025-07-14 12:21:26	2025-07-14 12:21:26
8	App\\Models\\User	3	Personal Access Token	18f8214491ea6e8f4e8064415857b2529605e08ae849cfe6944057aee4aa4087	["*"]	\N	2025-07-14 12:21:49	2025-07-14 12:21:49
9	App\\Models\\User	3	Personal Access Token	f889684c78d1e7ab085cd185a2824d91440ffdb28b7f166e99c633574914e451	["*"]	\N	2025-07-14 12:23:14	2025-07-14 12:23:14
10	App\\Models\\User	3	Personal Access Token	ae8e86528b690548912876fe1dc3f01c3587ca35328332fe1bf1c5a415bd7142	["*"]	\N	2025-07-14 12:23:15	2025-07-14 12:23:15
11	App\\Models\\User	4	Personal Access Token	35bccf9d2c9cc463d7baa89523c846408f65ac60e9c5e8f4661bb5d7fbf0cf60	["*"]	\N	2025-07-14 12:41:47	2025-07-14 12:41:47
12	App\\Models\\User	4	Personal Access Token	298974025a25e2160071e32a706916cf7391ae5a60071a518f176a8077f0191d	["*"]	\N	2025-07-14 12:41:48	2025-07-14 12:41:48
13	App\\Models\\User	4	Personal Access Token	22d9df7456efdd4b65d6835209d458d6d9d914a1acb779502fdb041883ff9955	["*"]	\N	2025-07-14 12:44:52	2025-07-14 12:44:52
14	App\\Models\\User	4	Personal Access Token	f9a1b0b8cba06ecab0ec04993b300cb1764663214f65aeeeb6bbe19b3573680c	["*"]	\N	2025-07-14 12:44:53	2025-07-14 12:44:53
15	App\\Models\\User	4	Personal Access Token	bb286e831616e097046b21111cfa23fb9d59bcf235521c0aa9cd5ed4fcc4d160	["*"]	\N	2025-07-14 12:45:23	2025-07-14 12:45:23
16	App\\Models\\User	4	Personal Access Token	ae55299c1b198b9a4e59d370b2d874a6151fc45ed552ba85b605959224f2b181	["*"]	\N	2025-07-14 12:45:24	2025-07-14 12:45:24
17	App\\Models\\User	5	Personal Access Token	9952a6cdb9d0e0f85b818f17be6958196b116957f18d41b92e74886f43577564	["*"]	\N	2025-07-14 12:51:34	2025-07-14 12:51:34
18	App\\Models\\User	5	Personal Access Token	7ee600eb7d899ee80d0b12eca04f8949da32da0d30eb0c92ed387a1c531e1b60	["*"]	\N	2025-07-14 12:51:34	2025-07-14 12:51:34
19	App\\Models\\User	6	Personal Access Token	ba45260b920c5d6c148b4ca54a966cc848386844765e84f908f2abd97bcf862e	["*"]	\N	2025-07-14 20:53:53	2025-07-14 20:53:53
20	App\\Models\\User	6	Personal Access Token	f950c65377858ba33f0bec70d14c68a1b9e4d7d53cb99c85d4f3551d51fe46aa	["*"]	\N	2025-07-14 20:53:53	2025-07-14 20:53:53
21	App\\Models\\User	7	Personal Access Token	d58d40dd249eaa501f288de174b05018cd12f2e35591b4cdf0618c8f5ff88cc3	["*"]	\N	2025-07-14 21:15:45	2025-07-14 21:15:45
22	App\\Models\\User	7	Personal Access Token	702b15ba701650a19a5b791377cf38196e39ce25e64226cc9a8e514860b1da3e	["*"]	\N	2025-07-14 21:15:46	2025-07-14 21:15:46
23	App\\Models\\User	8	Personal Access Token	8c4d5465a55f7f4813d98d8a538611829cf76c12cdc3085ca6cb30e393b67d1c	["*"]	\N	2025-07-14 22:01:04	2025-07-14 22:01:04
24	App\\Models\\User	8	Personal Access Token	b51cf21f62fe59fa2db472117448cd0534844b3d5e79aca00ffce551675797fe	["*"]	\N	2025-07-14 22:01:13	2025-07-14 22:01:13
25	App\\Models\\User	8	Personal Access Token	c22eb001a4f7b5a18e3d0c4fc15eca8756143208b3b7b5d2e9c3c93f4ed6e036	["*"]	\N	2025-07-14 22:01:13	2025-07-14 22:01:13
26	App\\Models\\User	8	Personal Access Token	ad1a8d835cb5933d025c8409a989d73c826d86d7bfccd3f3f29d251453ff8da4	["*"]	\N	2025-07-14 22:01:15	2025-07-14 22:01:15
27	App\\Models\\User	9	Personal Access Token	c7fdae9f908bd59b5132c5300ff9c9aa72233c9a290e1441e4f4c8d75df93a3a	["*"]	\N	2025-07-15 07:39:34	2025-07-15 07:39:34
28	App\\Models\\User	9	Personal Access Token	7902a2c0e9da110417a483eb9053513c5f3e00fae897f0e9e58a7dd0def23826	["*"]	\N	2025-07-15 07:39:34	2025-07-15 07:39:34
29	App\\Models\\User	10	Personal Access Token	7d5e99d33c715ad9ee5c6ad5462df331d4c12fd56937e45907a2d305ed7b5f81	["*"]	\N	2025-07-15 07:48:14	2025-07-15 07:48:14
30	App\\Models\\User	10	Personal Access Token	74e962fa97f89c621064bd1fe9a08e82cb24f404c313b5869b4f9750e0b53c7e	["*"]	\N	2025-07-15 07:48:14	2025-07-15 07:48:14
31	App\\Models\\User	11	Personal Access Token	50ec3eec55213f722657901b632055fe965c0323553c921b7c5dffe91dc82bd7	["*"]	\N	2025-07-15 07:51:00	2025-07-15 07:51:00
32	App\\Models\\User	11	Personal Access Token	3ace60566b35619559912d0addf91bf6938c5205f2c90cc210c01318887494a1	["*"]	\N	2025-07-15 07:51:00	2025-07-15 07:51:00
33	App\\Models\\User	12	Personal Access Token	89f838c5d48e5e7df61614d4d88c9236bc47591888964bf05088509951a36f1c	["*"]	\N	2025-07-15 08:04:50	2025-07-15 08:04:50
34	App\\Models\\User	12	Personal Access Token	5caf29af46776f4f6d42a2c436574f3c15b1ecc633a5a27eff9026c283e5ed7a	["*"]	\N	2025-07-15 08:04:51	2025-07-15 08:04:51
35	App\\Models\\User	13	Personal Access Token	7f41f98639ad0cda83e6d583274c76d7677866971484b3f642fe2b4475b2ab8d	["*"]	\N	2025-07-15 08:13:49	2025-07-15 08:13:49
36	App\\Models\\User	13	Personal Access Token	25a1de23562fdf966e65ba41272df054d969c8e6aee6acbb726d5edbb602cc21	["*"]	\N	2025-07-15 08:13:50	2025-07-15 08:13:50
37	App\\Models\\User	14	Personal Access Token	d1de2231424b93ff45709ec7b87302a089fa2578c1ad23bccf0fb4e0cefa34f9	["*"]	\N	2025-07-16 11:42:56	2025-07-16 11:42:56
38	App\\Models\\User	14	Personal Access Token	964b12fd81034cb03f1f1560eb25699b5b572fe170ac06881397831c85fece09	["*"]	\N	2025-07-16 11:42:57	2025-07-16 11:42:57
39	App\\Models\\User	11	Personal Access Token	6998b806a051bac42b8b4035518b4e744e2cbdf14db65286c301fa1a03ae9b8d	["*"]	\N	2025-07-17 21:05:50	2025-07-17 21:05:50
40	App\\Models\\User	15	Personal Access Token	3053cd7940fb5b580d2ed475473f124bd9c3e7f0b1424a32ed07941d8dfb70bb	["*"]	\N	2025-07-17 21:39:52	2025-07-17 21:39:52
41	App\\Models\\User	15	Personal Access Token	c36223b59caa3543b4df06519f1b17193f59b41fce33a3bde188532eb7ff8d0a	["*"]	\N	2025-07-17 21:39:53	2025-07-17 21:39:53
42	App\\Models\\User	15	Personal Access Token	031d0061d0974cd86bed0fff7a49ec8a5356299402b1ce2e262d09c5b5ccf670	["*"]	\N	2025-07-17 21:40:10	2025-07-17 21:40:10
43	App\\Models\\User	16	Personal Access Token	e93a20dcba2aac5b284ac0a0bb40cba01136d1a33a9f56a2518d3c99ff983030	["*"]	\N	2025-07-18 13:53:04	2025-07-18 13:53:04
44	App\\Models\\User	16	Personal Access Token	f684a5ae7b62403d6fbd441c2cadc6d949aaa78b05435386acc25d0f45ff0a36	["*"]	\N	2025-07-18 13:53:04	2025-07-18 13:53:04
45	App\\Models\\User	15	Personal Access Token	748f03d261fbbaa9ba5a7e13a15ff937531021cea8313e5e8b2a3d0236f704d4	["*"]	\N	2025-07-23 10:28:17	2025-07-23 10:28:17
46	App\\Models\\User	17	Personal Access Token	0c3f320605fcf8d163f56e5e77024641312f6394ac844c856d740bcbf7c3a277	["*"]	\N	2025-07-23 11:27:22	2025-07-23 11:27:22
47	App\\Models\\User	17	Personal Access Token	10fa0b212139d758554e8c7716c48fa2d3cdfd1e1f4bf007c0f0c4c61f7fd684	["*"]	\N	2025-07-23 11:27:23	2025-07-23 11:27:23
48	App\\Models\\User	18	Personal Access Token	d34932041233007b32c57bdcc8771d96ade9e8f5397427294908088f7b77fb7e	["*"]	\N	2025-07-23 12:16:12	2025-07-23 12:16:12
49	App\\Models\\User	18	Personal Access Token	6a49e4ab73156defb48fd7f9b0c9a98754343a0b7e14d3aef5251e554c47e850	["*"]	\N	2025-07-23 12:16:13	2025-07-23 12:16:13
50	App\\Models\\User	19	Personal Access Token	955987948d4e8be59bb61ca84fd6f4518fa8fded19ced2c7346db25a712ad85e	["*"]	\N	2025-07-23 22:10:53	2025-07-23 22:10:53
51	App\\Models\\User	19	Personal Access Token	469c94252a0e1222d3eae56efb6a8e6bf06b721bef743463f130805a516c36bf	["*"]	\N	2025-07-23 22:10:53	2025-07-23 22:10:53
52	App\\Models\\User	20	Personal Access Token	72f399e8faef2af8d908e8f44b9a4b0d9ec27a818b9d8c9dec567037e0819aba	["*"]	\N	2025-07-25 04:38:59	2025-07-25 04:38:59
53	App\\Models\\User	20	Personal Access Token	214d11a472cec565057ab3ded64822e42194717d4f2b69a3f90275debca5ef7b	["*"]	\N	2025-07-25 04:38:59	2025-07-25 04:38:59
54	App\\Models\\User	17	Personal Access Token	eb5e0d1cb0b1061eaa2fbd249e3153c8c22828d4d6f10aa1ec1f6da6546a22f5	["*"]	\N	2025-07-25 05:41:52	2025-07-25 05:41:52
55	App\\Models\\User	20	Personal Access Token	6a8850ef9110cda40bcab83cc10532d425575102351ce2fdd2941203c0120273	["*"]	\N	2025-07-25 06:05:31	2025-07-25 06:05:31
56	App\\Models\\User	22	Personal Access Token	1fbc71bdb613291254077075737a497659f9323fff724a1d13336a1086355542	["*"]	\N	2025-07-25 12:11:50	2025-07-25 12:11:50
57	App\\Models\\User	22	Personal Access Token	bc54fd160c5a39a3ff36dfc68d40d5a0791d7a51f0422c4ea3992874c2aad580	["*"]	\N	2025-07-25 12:11:51	2025-07-25 12:11:51
58	App\\Models\\User	23	Personal Access Token	126b2f09d55019f76d4b9baaf04297534063bb7896c76e57f17ec056e6caad3b	["*"]	\N	2025-07-25 19:03:56	2025-07-25 19:03:56
59	App\\Models\\User	23	Personal Access Token	8c07eb6726f1c85b249fd67f9d51392d3f50caf86b328d5c1ab9568e4b3015f1	["*"]	\N	2025-07-25 19:03:57	2025-07-25 19:03:57
60	App\\Models\\User	24	Personal Access Token	93550d81d8563769422780d3cfaa42c4b28ad11da2ca2f6efa7753da4f0a4dd0	["*"]	\N	2025-07-26 05:05:47	2025-07-26 05:05:47
61	App\\Models\\User	24	Personal Access Token	e02e3cfeebdabd9b5b4ac0059ec56adfeb3b80b6fbf773a6926dad471c5b473b	["*"]	\N	2025-07-26 05:05:47	2025-07-26 05:05:47
62	App\\Models\\User	25	Personal Access Token	327ada1f19246817386a6e4cbf037fe5b2e9554fe76d58789134d7e0472b7cd2	["*"]	\N	2025-07-27 12:44:03	2025-07-27 12:44:03
63	App\\Models\\User	25	Personal Access Token	f0153bb74f303ffab60e0fdac483d5679fc5f8da917e67414f399aaa917303f5	["*"]	\N	2025-07-27 12:44:04	2025-07-27 12:44:04
64	App\\Models\\User	26	Personal Access Token	eb6cd7677d204273135fe221b4a1ae66ec7e6e43f0a332a05604770dcbfe89a2	["*"]	\N	2025-07-28 09:20:26	2025-07-28 09:20:26
65	App\\Models\\User	26	Personal Access Token	dada20eb1e7d7f494ea4bc454975930fc9f90394e681f6f8609c25ad8948893b	["*"]	\N	2025-07-28 09:20:27	2025-07-28 09:20:27
66	App\\Models\\User	27	Personal Access Token	a7efa496710f9d9e4c8a4e1cdd32fb329cb9dcf5d3f1aa7b42c2168c094e4bf5	["*"]	\N	2025-07-28 11:26:59	2025-07-28 11:26:59
67	App\\Models\\User	27	Personal Access Token	d2d8d7740c9cf02404aa6d0730921f213ca51ce94d54b5f5e47ea23d457ceaf0	["*"]	\N	2025-07-28 11:26:59	2025-07-28 11:26:59
68	App\\Models\\User	28	Personal Access Token	5b9b085f924731d876320136a6406a36a92f930355277d2120c7a117bdfe6851	["*"]	\N	2025-07-28 14:06:15	2025-07-28 14:06:15
69	App\\Models\\User	28	Personal Access Token	0cbbdb03ab3b0bde13cb63cdc89da3219ad8a6b2c54fc1033912c3f1dcb7ef1f	["*"]	\N	2025-07-28 14:06:16	2025-07-28 14:06:16
70	App\\Models\\User	28	Personal Access Token	87d4f20de56fc323c725fae935255c7ed0a8481139afe33d39a055be7db317a0	["*"]	\N	2025-07-28 14:24:29	2025-07-28 14:24:29
71	App\\Models\\User	28	Personal Access Token	fc4b52eff73b513a7628a5f8e732a3bd6049584c779480960ed75bc2124e50e0	["*"]	\N	2025-07-28 14:24:42	2025-07-28 14:24:42
72	App\\Models\\User	28	Personal Access Token	96c347bd32b272a9dbe5aca41ef6b1aecdd6c57bb27611ed4a4a044127b63d10	["*"]	\N	2025-07-28 16:35:10	2025-07-28 16:35:10
73	App\\Models\\User	29	Personal Access Token	59c46b63a3a286fc2e5261c20dfa05b45d29af8f666d26c31ced5ee2b62aee65	["*"]	\N	2025-07-28 17:39:33	2025-07-28 17:39:33
74	App\\Models\\User	29	Personal Access Token	fbd3b6e7246e2a92032444edfcb1d591240f30a77d21420bfe6d0ce3865acf46	["*"]	\N	2025-07-28 17:39:33	2025-07-28 17:39:33
75	App\\Models\\User	30	Personal Access Token	ad79b9e9f89eb8f15624e243faad6019c36de4543e0ff35366519e60debdf99b	["*"]	\N	2025-07-28 18:34:39	2025-07-28 18:34:39
76	App\\Models\\User	30	Personal Access Token	461bad6bbc6ce8c851ca5f47bbd2e5f3244bfe8f54c8a89ddb136b96ee0fb67b	["*"]	\N	2025-07-28 18:34:40	2025-07-28 18:34:40
77	App\\Models\\User	31	Personal Access Token	52d8a4936722d211969a69e9b156194f5743641db9de48089ce863b76670db76	["*"]	\N	2025-07-29 10:41:26	2025-07-29 10:41:26
78	App\\Models\\User	31	Personal Access Token	79c8a6c188b3c04685b339774bb9c3326154989a09dc745746def3b4f4e29a85	["*"]	\N	2025-07-29 10:41:26	2025-07-29 10:41:26
79	App\\Models\\User	32	Personal Access Token	3f5ae41e06dda568e6e69000a40816f65872c8615e07b5d643a44af53f87e66b	["*"]	\N	2025-07-29 11:20:10	2025-07-29 11:20:10
80	App\\Models\\User	32	Personal Access Token	35b469cfb65bf631964732ecd5aa9727318db97307d59b48bc075eeaef9eb2a4	["*"]	\N	2025-07-29 11:20:10	2025-07-29 11:20:10
81	App\\Models\\User	33	Personal Access Token	16f926a370d5186085994bcafb54a719a6dec7934ec491ee9dc7a5abcd978bc0	["*"]	\N	2025-07-29 12:34:34	2025-07-29 12:34:34
82	App\\Models\\User	33	Personal Access Token	797234fb43b843875dfc05cbd3beb62f081ab3c1cd553933e3f85e402358d89f	["*"]	\N	2025-07-29 12:34:35	2025-07-29 12:34:35
83	App\\Models\\User	34	Personal Access Token	8f5953e0f50a3d1bcd8a684cba1ee61267db2f48e5d7abe9935a4732024d432b	["*"]	\N	2025-08-01 04:28:18	2025-08-01 04:28:18
84	App\\Models\\User	34	Personal Access Token	c42c2a8dd2e76a4e1fe69cc4b6005cb8536a284e972c7f95e38ab1b4066b2252	["*"]	\N	2025-08-01 04:28:19	2025-08-01 04:28:19
85	App\\Models\\User	35	Personal Access Token	dc787fa85b8229a3f59a31046ea852bf2fd66d652b4bc43d03fa1fab834e8d71	["*"]	\N	2025-08-01 06:40:18	2025-08-01 06:40:18
86	App\\Models\\User	35	Personal Access Token	fa8140a3add05d6bc9b1f9ef4529f6d8ec5bf00ed5e7404c74314d8fade8693e	["*"]	\N	2025-08-01 06:40:18	2025-08-01 06:40:18
87	App\\Models\\User	36	Personal Access Token	02802a96d7b6506ea49691c21d664f311866fbdeede478ee0615b7359c775418	["*"]	\N	2025-08-01 15:38:34	2025-08-01 15:38:34
88	App\\Models\\User	36	Personal Access Token	ee4990562430eed52ecbf01839881b097b389b55cf2bad9b162d331493c8c2a4	["*"]	\N	2025-08-01 15:38:35	2025-08-01 15:38:35
89	App\\Models\\User	37	Personal Access Token	99738a9b1f37d4e6af979f97cd0a79614b641238b2341731f4a747c6641f3dce	["*"]	\N	2025-08-01 15:42:30	2025-08-01 15:42:30
90	App\\Models\\User	37	Personal Access Token	0398b8613c1da3b228d93cf398005af5355ad969d3e4cd93ec120627755b36cf	["*"]	\N	2025-08-01 15:42:31	2025-08-01 15:42:31
91	App\\Models\\User	38	Personal Access Token	62ee621f0e1b5392eae752e29fff7c2104789a51214b887d19a0c2c03ec2d4c0	["*"]	\N	2025-08-01 17:09:36	2025-08-01 17:09:36
92	App\\Models\\User	38	Personal Access Token	56f5bf96db0164118d8cca9a17e7d6469580feb8e344a4ea3d99f24fee51d228	["*"]	\N	2025-08-01 17:09:37	2025-08-01 17:09:37
93	App\\Models\\User	39	Personal Access Token	ca2fc7e2a3b13e2a5aff06a5607230a7d6d7d65659d5ddc39027dfb33b723830	["*"]	\N	2025-08-02 07:29:54	2025-08-02 07:29:54
94	App\\Models\\User	39	Personal Access Token	30ae2bd6d330db4a165940df32975d43bb53750df3451e35cf8cb50afa76b478	["*"]	\N	2025-08-02 07:29:55	2025-08-02 07:29:55
95	App\\Models\\User	40	Personal Access Token	5423a598f932f415dd996e7b0d42ba5346e0fb12a8c586d8035def0e10bb005b	["*"]	\N	2025-08-02 11:26:27	2025-08-02 11:26:27
96	App\\Models\\User	40	Personal Access Token	8dc960b99995b02bd66adfc2c3e3e4867b9b2827028a1af0096f90653cc1b14c	["*"]	\N	2025-08-02 11:26:28	2025-08-02 11:26:28
97	App\\Models\\User	41	Personal Access Token	0e89570a868a146693753f5ef8963f393f96f1f26b37db0d1ca885cde526443b	["*"]	\N	2025-08-02 11:26:28	2025-08-02 11:26:28
98	App\\Models\\User	41	Personal Access Token	32219f65c04cfb898e105379549bd781968b710e9c721f4a57123e2bc272cad5	["*"]	\N	2025-08-02 11:26:28	2025-08-02 11:26:28
99	App\\Models\\User	42	Personal Access Token	3df11df8de01a851412a947183d92fd4f03a6406ed950887c924ace09956fabc	["*"]	\N	2025-08-02 12:11:30	2025-08-02 12:11:30
100	App\\Models\\User	42	Personal Access Token	64f8348d330ff1b40917dcd85356fd3d4200657556206f05c2d6bea687cc8140	["*"]	\N	2025-08-02 12:11:30	2025-08-02 12:11:30
101	App\\Models\\User	43	Personal Access Token	c97658f72dcc69b4463fc212b66b1c10a08901167b411e876f16380ffcc2caa8	["*"]	\N	2025-08-02 12:14:00	2025-08-02 12:14:00
102	App\\Models\\User	43	Personal Access Token	568b9e1cf29cea2003784096c7f407cdd8cec3203cb31b025bfa64100f343513	["*"]	\N	2025-08-02 12:14:01	2025-08-02 12:14:01
103	App\\Models\\User	44	Personal Access Token	ede0ee937509c59ed0e04e2e32a4af5588cc3404970e65ff87744de1d12466b5	["*"]	\N	2025-08-02 12:15:28	2025-08-02 12:15:28
104	App\\Models\\User	44	Personal Access Token	a0ec72b6cee2a605cf8da869adb871c3eb7ce0afd25974f150c3796e6fdfd1e0	["*"]	\N	2025-08-02 12:15:29	2025-08-02 12:15:29
105	App\\Models\\User	45	Personal Access Token	427e12cecc24d576e03de58c3ba670e3466424100e67347495e25f121a35b9d1	["*"]	\N	2025-08-02 12:23:15	2025-08-02 12:23:15
106	App\\Models\\User	45	Personal Access Token	5e9acdf8e2e0f66048cd0ad0fe881611dd919da8415454272b0f7fdaa67971f7	["*"]	\N	2025-08-02 12:23:15	2025-08-02 12:23:15
107	App\\Models\\User	46	Personal Access Token	18ae4edf104fab99b75aaa35e663dcb6d5c53e5cbd9ad85365dd6861393cd482	["*"]	\N	2025-08-02 13:01:48	2025-08-02 13:01:48
108	App\\Models\\User	46	Personal Access Token	5a76a0db3bfbd65ababbba80872a023fcdf4a90dbbde311b08cd9bcb7926db37	["*"]	\N	2025-08-02 13:01:48	2025-08-02 13:01:48
109	App\\Models\\User	47	Personal Access Token	52e8156c848c91ae2228d36319e9d0afa694cb9e9c8c206598f0dc1e937ee786	["*"]	\N	2025-08-02 13:08:11	2025-08-02 13:08:11
110	App\\Models\\User	47	Personal Access Token	27df12c750e1a183ef342ffb8665104e77c1c9d3a06fe40b57b699821b68443d	["*"]	\N	2025-08-02 13:08:12	2025-08-02 13:08:12
111	App\\Models\\User	48	Personal Access Token	ce0206b021b48ff5eb63d18a7f3d8eaf06541445f34063c1d041dfb42ef3f2d4	["*"]	\N	2025-08-02 19:34:49	2025-08-02 19:34:49
112	App\\Models\\User	48	Personal Access Token	14d387dabfeb3ec92413652944d5e1e85311067496a14f271ad9a8d1b65180d6	["*"]	\N	2025-08-02 19:34:50	2025-08-02 19:34:50
113	App\\Models\\User	49	Personal Access Token	00d110fea651124863e9562c04e52f234be2385cc5ec5f66f99274046cf703db	["*"]	\N	2025-08-02 19:35:26	2025-08-02 19:35:26
114	App\\Models\\User	49	Personal Access Token	cd407ab8e62826c17452689a8efd64515d27c56fdaa7c011caecd98848731285	["*"]	\N	2025-08-02 19:35:26	2025-08-02 19:35:26
115	App\\Models\\User	50	Personal Access Token	70c3b0f1255295124528e60fd274384e622116e8172a2efc2270403fda5e3eb2	["*"]	\N	2025-08-04 20:52:24	2025-08-04 20:52:24
116	App\\Models\\User	50	Personal Access Token	e36d582053d3755dd5cf996502e3be2eff7e16273cf5b18757a18b38cd83a84c	["*"]	\N	2025-08-04 20:52:24	2025-08-04 20:52:24
117	App\\Models\\User	51	Personal Access Token	d309094f0a6495bd16480a8069ff2692b5c9f3cba94b83a6727a8641b53f5e90	["*"]	\N	2025-08-11 10:15:17	2025-08-11 10:15:17
118	App\\Models\\User	51	Personal Access Token	341f22a7bc82fa61937508c42cc74785da859f4241ba211a4f143800851851b6	["*"]	\N	2025-08-11 10:15:17	2025-08-11 10:15:17
119	App\\Models\\User	52	Personal Access Token	06ba1aef6aff55e60f151cdfd5d0c382b49c37ad078cac4d0993f2e195572a8c	["*"]	\N	2025-08-11 10:19:39	2025-08-11 10:19:39
120	App\\Models\\User	52	Personal Access Token	c85c5140193555f4b10102757f77da34fb2f3af12f4ad0ce9824f365bbde2a74	["*"]	\N	2025-08-11 10:19:40	2025-08-11 10:19:40
121	App\\Models\\User	45	Personal Access Token	8aca8d1c3e2567afb97d17950128280de6c5accfb44307ac62400ca02da2d4ce	["*"]	\N	2025-08-11 10:39:27	2025-08-11 10:39:27
122	App\\Models\\User	45	Personal Access Token	2fdfd1eb6fa276127e9dceaee1c61746a7ad9b309737ed4cc959dde0197175b8	["*"]	\N	2025-08-11 14:49:38	2025-08-11 14:49:38
123	App\\Models\\User	53	Personal Access Token	f5f7fbe910968fd5e906c646dc5492e0b7e9050739dfa96adde22e2bf4d7b00a	["*"]	\N	2025-08-11 15:37:52	2025-08-11 15:37:52
124	App\\Models\\User	53	Personal Access Token	3d72e95a54ed67fed9b590ca096ce103dfedd406cc53c2950bff48490303f609	["*"]	\N	2025-08-11 15:37:53	2025-08-11 15:37:53
125	App\\Models\\User	45	Personal Access Token	240112e59c4da81801d0a141a61cc892ce008022fdee567530b604f75af2c490	["*"]	\N	2025-08-11 16:00:53	2025-08-11 16:00:53
126	App\\Models\\User	54	Personal Access Token	9b1c78703ec33cb22ba6259293970bc2cbc2b9b8fb4e59c3424f8c0ddcc9bbe1	["*"]	\N	2025-08-11 16:03:56	2025-08-11 16:03:56
127	App\\Models\\User	54	Personal Access Token	52d71ee178563d53911c0827e2fbc20d378cb04d8d0aedeb556bce3882550009	["*"]	\N	2025-08-11 16:03:57	2025-08-11 16:03:57
128	App\\Models\\User	55	Personal Access Token	2a10e0c82c3656695820c4f4fcb020a195b0063d10dd4506ff6be62667af2967	["*"]	\N	2025-08-11 20:29:25	2025-08-11 20:29:25
129	App\\Models\\User	55	Personal Access Token	d1e334a94ba611fd49acc7acc3605d31b2613e55680833b8cb20be6a58dadae6	["*"]	\N	2025-08-11 20:29:25	2025-08-11 20:29:25
130	App\\Models\\User	56	Personal Access Token	fb58fe9061d1b373837a72554ff85d3d944ba3a420024e55ac6246bbce5b1a78	["*"]	\N	2025-08-12 05:24:04	2025-08-12 05:24:04
131	App\\Models\\User	56	Personal Access Token	f9e5bc1d708e6e048330cff445e4fe7e584ef4fe0d105045565c756da5437c8e	["*"]	\N	2025-08-12 05:24:04	2025-08-12 05:24:04
132	App\\Models\\User	57	Personal Access Token	36eec69a31a8d32c1eacea220a9fe70413221e73280a24c391ec329348d443fd	["*"]	\N	2025-08-12 06:16:55	2025-08-12 06:16:55
133	App\\Models\\User	57	Personal Access Token	2cd266a2210cf0f966d8fe7386e9ff269910522bf56db8612304469399fb91c6	["*"]	\N	2025-08-12 06:16:55	2025-08-12 06:16:55
134	App\\Models\\User	58	Personal Access Token	18158bf7f833a8213b5b4a8c816c9c28426b9f8926346cd18a58007e30129b4c	["*"]	\N	2025-08-12 08:39:56	2025-08-12 08:39:56
135	App\\Models\\User	58	Personal Access Token	c956b5405578e557b22cff02f407373c2a7a8220237515a3dd33e69db0388e48	["*"]	\N	2025-08-12 08:39:56	2025-08-12 08:39:56
136	App\\Models\\User	28	Personal Access Token	2ca67e7746dd7bf337c38e2a505506cfb2488d1dbf1b4f888e6640dd2767e107	["*"]	\N	2025-08-16 17:26:57	2025-08-16 17:26:57
137	App\\Models\\User	63	Personal Access Token	7a87315530b027adb32cf9c352d4fcc09f2d1cb34866d460d880a0c0bb49d293	["*"]	\N	2025-08-17 03:43:16	2025-08-17 03:43:16
138	App\\Models\\User	63	Personal Access Token	7f93a9368fdbcf283e2c8b2c64677c97b06f2eea82bff46945cd7292fb2546bd	["*"]	\N	2025-08-17 03:43:16	2025-08-17 03:43:16
139	App\\Models\\User	64	Personal Access Token	827a02845aea499e4e7774191e658fcb02a335914d1d8954db2e3ab4570eed47	["*"]	\N	2025-08-18 00:02:14	2025-08-18 00:02:14
140	App\\Models\\User	64	Personal Access Token	4c0db858080d0ef8abd982203ca95eec936ead9d2243c7008af554dc4a6f6466	["*"]	\N	2025-08-18 00:02:14	2025-08-18 00:02:14
141	App\\Models\\User	65	Personal Access Token	73f8dad860a5a43adf5fa1255f2f185f71ae7033a81de4b4d3667ddf681e51ea	["*"]	\N	2025-08-18 07:41:44	2025-08-18 07:41:44
142	App\\Models\\User	65	Personal Access Token	6d92563111f807e9dccd79d572ca4ac63d95d178000ee04a4cd715f06057c633	["*"]	\N	2025-08-18 07:41:45	2025-08-18 07:41:45
143	App\\Models\\User	28	Personal Access Token	7d54ae373807333c3afec869e804dc9b123b64b99bd52edd474108be916eb537	["*"]	\N	2025-08-18 19:37:56	2025-08-18 19:37:56
144	App\\Models\\User	28	Personal Access Token	722d2648b6fe6120f973ef427c04ffbe147667b6df68b12228207daac72409ae	["*"]	\N	2025-08-18 20:13:04	2025-08-18 20:13:04
145	App\\Models\\User	28	Personal Access Token	7fedd453d799108d1a06dabf81a50486eed2eed25d04307cd44c857f805619d0	["*"]	\N	2025-08-18 20:13:19	2025-08-18 20:13:19
146	App\\Models\\User	28	Personal Access Token	4d6d3ed78bd4ce00188e5ea38a0382afec9886bbad697dd7619c56c75427ffbd	["*"]	\N	2025-08-18 20:13:31	2025-08-18 20:13:31
147	App\\Models\\User	28	Personal Access Token	317cf13792424c49beba8ad51609f1cb14f272fba6256aedace590454fefd541	["*"]	\N	2025-08-18 20:31:19	2025-08-18 20:31:19
148	App\\Models\\User	69	Personal Access Token	ce1b7a9a8dc065b4e9ce7eb77bcc2a24f1f12815f63aea108f9a9d319d76fc96	["*"]	\N	2025-08-19 12:11:55	2025-08-19 12:11:55
149	App\\Models\\User	69	Personal Access Token	50fd0e59f88468358e769ad40951a2f170a538f0141edbc753b385d7b1a1b9be	["*"]	\N	2025-08-19 12:11:56	2025-08-19 12:11:56
150	App\\Models\\User	28	Personal Access Token	bfe45eba68269c95118c7592364169479e14023f0e59703274bbb635b9b0b34d	["*"]	\N	2025-08-19 13:30:15	2025-08-19 13:30:15
151	App\\Models\\User	70	Personal Access Token	cdd01915c9985fcae45b02b2f6e8adc9865334f10a0091292f9188649e6b64c5	["*"]	\N	2025-08-19 19:22:24	2025-08-19 19:22:24
152	App\\Models\\User	70	Personal Access Token	3726bfc889cfec1155697eb9d5212cc96a248c29a60035b14b6354327ec85578	["*"]	\N	2025-08-19 19:22:24	2025-08-19 19:22:24
153	App\\Models\\User	28	Personal Access Token	d26efb50378e08f5438d11fec5a8dc6e45ee425cd9c382df4265c45104207d85	["*"]	\N	2025-08-19 19:51:27	2025-08-19 19:51:27
154	App\\Models\\User	28	Personal Access Token	6461458a22674773cd0fc88dc838d97feeb479ecdaaa26faa59bb675365cdb6b	["*"]	\N	2025-08-19 22:12:11	2025-08-19 22:12:11
155	App\\Models\\User	71	Personal Access Token	958b5b790416598d41f91d61549163a9c6e7a0693bbcceed32423c004013dfc3	["*"]	\N	2025-08-20 05:31:24	2025-08-20 05:31:24
156	App\\Models\\User	71	Personal Access Token	b2e67cf8702267e1cd745c97e4264fafa41b83e5e26439b3b8977c679d54fd35	["*"]	\N	2025-08-20 05:31:24	2025-08-20 05:31:24
157	App\\Models\\User	28	Personal Access Token	c9a2afb60c3f034d6ad65d47a2552741f5b0e6866a6c12b86832227eed60f37b	["*"]	\N	2025-08-20 19:25:52	2025-08-20 19:25:52
158	App\\Models\\User	79	Personal Access Token	90dd3fe9b17dc83b4b5c4257bc709420f1383bdd2517624c2d5d27bc78e3e719	["*"]	\N	2025-08-20 20:38:30	2025-08-20 20:38:30
159	App\\Models\\User	79	Personal Access Token	99b047496897de63a578afa1d2ee593b7315e53fe62e0fcce3d4570e8c47ee24	["*"]	\N	2025-08-20 20:38:31	2025-08-20 20:38:31
160	App\\Models\\User	28	Personal Access Token	797ff7f292eba44296bc9f12e35f81b0c1c2dd162e0b13a72fbb51eafe06fbab	["*"]	\N	2025-08-20 20:52:34	2025-08-20 20:52:34
161	App\\Models\\User	28	Personal Access Token	2a205070766455a4844df518389845a6d481395c39e7d0ebe15536927f1a0552	["*"]	\N	2025-08-20 21:01:44	2025-08-20 21:01:44
162	App\\Models\\User	81	Personal Access Token	30f8d3d1aeb437481beba5c343f3aa5e8468f6d531311d7a8ae0df418cbf855f	["*"]	\N	2025-08-20 21:18:54	2025-08-20 21:18:54
163	App\\Models\\User	81	Personal Access Token	54765e6935b2e2c5834ecb88cd1bb35729526937b7e7b113c52f9b7112ec83d2	["*"]	\N	2025-08-20 21:18:54	2025-08-20 21:18:54
164	App\\Models\\User	28	Personal Access Token	9383f070016bbfdc65b7d298b531248dd988c64d5b95731eea5fb3414bebe141	["*"]	\N	2025-08-20 21:22:42	2025-08-20 21:22:42
165	App\\Models\\User	82	Personal Access Token	dfbf957c040ba0fef9cebb948d42bab8f35f61a61d35701bf24d52483377b234	["*"]	\N	2025-08-20 21:34:15	2025-08-20 21:34:15
166	App\\Models\\User	82	Personal Access Token	fcdb18fed0d948ed1dbe08b08c878ad5e5a04b5d012dbd4b879e0ec1bac890db	["*"]	\N	2025-08-20 21:34:16	2025-08-20 21:34:16
167	App\\Models\\User	83	Personal Access Token	28554c80be0ab03ec16f980b560fdb72b2d75d4f5b5b7a9666d786e19a78ec2e	["*"]	\N	2025-08-20 21:51:09	2025-08-20 21:51:09
168	App\\Models\\User	83	Personal Access Token	5f7edbd35ae783b1ad92e3bcb91fb715e90fcb9aa6b726ca0273f08d663c9b22	["*"]	\N	2025-08-20 21:51:10	2025-08-20 21:51:10
169	App\\Models\\User	84	Personal Access Token	e5bb113054d9c8d1079140130f9c3a095e91d456f267b5a91d1994daa4747f04	["*"]	\N	2025-08-20 22:09:24	2025-08-20 22:09:24
170	App\\Models\\User	84	Personal Access Token	41843b7ee7c3241af921c2d1454ae4bc4ccce91e824199a1f7a714f0cef5aea7	["*"]	\N	2025-08-20 22:09:25	2025-08-20 22:09:25
171	App\\Models\\User	28	Personal Access Token	beda6139c51da53f780266b7c4d2dfdb577a27012fe69f3006fe4cbef0ddc759	["*"]	\N	2025-08-20 22:20:30	2025-08-20 22:20:30
172	App\\Models\\User	87	Personal Access Token	f39ed93ff576cb51234574304d448b10d0acd70f7399ecc4c9c664f86968de7a	["*"]	\N	2025-08-22 08:47:23	2025-08-22 08:47:23
173	App\\Models\\User	88	Personal Access Token	f06c84c9af2a74a204017bb27e655f0dcaca6c0911c8e16e4566dacb1b986e58	["*"]	\N	2025-08-22 08:48:02	2025-08-22 08:48:02
174	App\\Models\\User	88	Personal Access Token	d60a9d997a2f8ccd1947843677c37f7826074dc2f0bbfee59561483aecc3e4c0	["*"]	\N	2025-08-22 08:48:03	2025-08-22 08:48:03
175	App\\Models\\User	89	Personal Access Token	d5afa7017543d4c2461ef028a511f153b03af6b8958fbb35ac63502e5099b25e	["*"]	\N	2025-08-29 13:59:50	2025-08-29 13:59:50
176	App\\Models\\User	89	Personal Access Token	f69cc611ac5f41d0f8fa94136171434e4094fe9ec0fc9d0e67dc97bfe590853b	["*"]	\N	2025-08-29 13:59:50	2025-08-29 13:59:50
177	App\\Models\\User	90	Personal Access Token	0096b53522fe1e4b84727ad4c0dafd8c285f0fd40073d900f9ac8ca8ba0ee402	["*"]	\N	2025-08-30 06:58:14	2025-08-30 06:58:14
178	App\\Models\\User	90	Personal Access Token	fe82be4534fb211f40e069ff0182c7836e5907c4700702cb905307f29a444570	["*"]	\N	2025-08-30 06:58:14	2025-08-30 06:58:14
179	App\\Models\\User	91	Personal Access Token	9dcd952e09561d23ff44d50a5cfa92d4f5abb56939d619713ce1676a70f0db33	["*"]	\N	2025-08-30 09:27:28	2025-08-30 09:27:28
180	App\\Models\\User	91	Personal Access Token	df94901a4a3568d24844f46fa1b286ab4f8e6b0ad937b63f0790fa3ba2cffdcc	["*"]	\N	2025-08-30 09:27:28	2025-08-30 09:27:28
181	App\\Models\\User	92	Personal Access Token	ae43e3865366495c8e61560f745e97250988865ed8811821f4c7cff81fa7719d	["*"]	\N	2025-08-30 10:32:55	2025-08-30 10:32:55
182	App\\Models\\User	92	Personal Access Token	525a9802ad0c109a8d839f013d36e2aae219aa574b0c049e5142cbbf107c9ddc	["*"]	\N	2025-08-30 10:32:56	2025-08-30 10:32:56
183	App\\Models\\User	24	Personal Access Token	e036d27a027effa1e08552aa708705156a1544fa854290da921a1ed4c0286a89	["*"]	\N	2025-08-30 11:02:12	2025-08-30 11:02:12
184	App\\Models\\User	93	Personal Access Token	f8b325ce05b272f44703e1523eb31b5e1ce62e33c630e174176d878338db344c	["*"]	\N	2025-09-03 02:23:49	2025-09-03 02:23:49
185	App\\Models\\User	93	Personal Access Token	9643e08897f23d990c2ab835d1d3cb76b7c818bc026c843dac64fdd61dc9657e	["*"]	\N	2025-09-03 02:23:50	2025-09-03 02:23:50
186	App\\Models\\User	28	Personal Access Token	c206456c361a9d145d471fce9f54d94d8edfacd4ce17948ca2d86e02c97b7b50	["*"]	\N	2025-09-03 07:48:11	2025-09-03 07:48:11
187	App\\Models\\User	95	Personal Access Token	76bb83b1d4109307d7ae0ceda1529db20200633c0efee8367ff037c1d8cc108f	["*"]	\N	2025-09-04 20:44:29	2025-09-04 20:44:29
188	App\\Models\\User	95	Personal Access Token	47a58a6a833000fec411760fa6bf131e2d85482d0927f322b69c8894abc1f188	["*"]	\N	2025-09-04 20:44:30	2025-09-04 20:44:30
189	App\\Models\\User	97	Personal Access Token	f7c63b0a5d3973a868a3850590ca88bbf800ceba89b5ff569e33008e5d07e626	["*"]	\N	2025-09-11 06:20:41	2025-09-11 06:20:41
190	App\\Models\\User	97	Personal Access Token	eaa5695776af864d5d7628cca8325728f306dfbaf0b528b382b5b469323d1a51	["*"]	\N	2025-09-11 06:20:41	2025-09-11 06:20:41
191	App\\Models\\User	98	Personal Access Token	fb022f7595efdd54a7e9d563b7f896cb69144894cffbbf26b956b1483568c8e4	["*"]	\N	2025-09-16 11:15:27	2025-09-16 11:15:27
192	App\\Models\\User	98	Personal Access Token	91f07bf2a5e8db65315df3d9ba5a4b4d80616a0ba3c1109f70e7f0d4a5bbdfa2	["*"]	\N	2025-09-16 11:16:05	2025-09-16 11:16:05
193	App\\Models\\User	98	Personal Access Token	158ecfe813190115a205c9cbfca73d657cad008642cb16d37bfa350414cf28bf	["*"]	\N	2025-09-16 11:16:40	2025-09-16 11:16:40
\.


--
-- TOC entry 5092 (class 0 OID 25390)
-- Dependencies: 359
-- Data for Name: post_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_comments (id, user_id, post_id, parent_id, comment, created_at, updated_at, comment_node_id) FROM stdin;
\.


--
-- TOC entry 5094 (class 0 OID 25399)
-- Dependencies: 361
-- Data for Name: post_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_likes (id, post_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5096 (class 0 OID 25404)
-- Dependencies: 363
-- Data for Name: post_saves; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_saves (id, post_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5098 (class 0 OID 25409)
-- Dependencies: 365
-- Data for Name: post_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_users (id, post_id, user_id) FROM stdin;
\.


--
-- TOC entry 5100 (class 0 OID 25414)
-- Dependencies: 367
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, user_id, caption, file_type, file, location_name, lattitude, longitude, post_firebase_node_id, created_at, updated_at, active, visibility, extra_file_names) FROM stdin;
\.


--
-- TOC entry 5102 (class 0 OID 25425)
-- Dependencies: 369
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, product_type, product_desc_full, product_desc_short, product_sale_from, product_sale_to, product_featured_image, product_tag, product_created_by, product_updated_by, product_status, product_deleted, product_name, product_variation_type, product_taxable, product_vender_id, product_image, product_unique_iden, product_brand_id, product_name_arabic, product_desc_full_arabic, product_desc_short_arabic, cash_points, offer_enabled, deal_enabled, is_today_offer, today_offer_date, thanku_perc, custom_status, meta_title, meta_keyword, meta_description, product_vendor_status, product_gender, is_kandora, collection_id, hot_offer_enabled, trending_enabled, offers_list, zero_quantity_orders, product_code, product_tags, sort_order, offer_for_short, hot_offer_sort_order, new_trending_sort_order, author_id, deleted, default_category_id, default_attribute_id, created_at, updated_at, brand, store_id, moda_main_category, moda_sub_category, featured, master_product, boxcount, activity_id, recommended, rating_avg, new_arrival, for_you, trending, video, thumbnail, personalisation, fashion, home_decor, shipment_and_policies, extra_info, extra_info_title) FROM stdin;
\.


--
-- TOC entry 5103 (class 0 OID 25466)
-- Dependencies: 370
-- Data for Name: product_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_attribute (attribute_id, attribute_name, attribute_status, attribute_created_date, attribute_name_arabic, attribute_type, is_deleted) FROM stdin;
\.


--
-- TOC entry 5105 (class 0 OID 25476)
-- Dependencies: 372
-- Data for Name: product_attribute_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_attribute_values (attribute_values_id, attribute_id, attribute_values, attribute_values_arabic, attribute_value_in, attribute_value_color, attribute_value_label, attribute_value_label_arabic, attribute_value_image, is_deleted, attribute_value_sort_order, attribute_color) FROM stdin;
\.


--
-- TOC entry 5107 (class 0 OID 25488)
-- Dependencies: 374
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_category (product_category_id, product_id, category_id) FROM stdin;
\.


--
-- TOC entry 5109 (class 0 OID 25495)
-- Dependencies: 376
-- Data for Name: product_cuisines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_cuisines (id, product_id, cuisine_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5111 (class 0 OID 25502)
-- Dependencies: 378
-- Data for Name: product_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_details (id, product_id, name, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5113 (class 0 OID 25507)
-- Dependencies: 380
-- Data for Name: product_docs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_docs (id, product_id, title, doc_path) FROM stdin;
\.


--
-- TOC entry 5115 (class 0 OID 25516)
-- Dependencies: 382
-- Data for Name: product_features; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_features (id, name, image_path, description, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5118 (class 0 OID 25526)
-- Dependencies: 385
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_images (id, product_id, image_name, product_attribute_id) FROM stdin;
\.


--
-- TOC entry 5120 (class 0 OID 25534)
-- Dependencies: 387
-- Data for Name: product_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_items (item_id, product_id, name, image_path, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5122 (class 0 OID 25543)
-- Dependencies: 389
-- Data for Name: product_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_likes (id, product_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5124 (class 0 OID 25548)
-- Dependencies: 391
-- Data for Name: product_master; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_master (id, name, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5126 (class 0 OID 25558)
-- Dependencies: 393
-- Data for Name: product_master_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_master_request (id, name, description, vendor_id, deleted, accepted, created_at, updated_at, product_type, category) FROM stdin;
\.


--
-- TOC entry 5128 (class 0 OID 25570)
-- Dependencies: 395
-- Data for Name: product_product_feature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_product_feature (id, product_id, product_feature_id, created_at, updated_at, feature_title) FROM stdin;
\.


--
-- TOC entry 5130 (class 0 OID 25578)
-- Dependencies: 397
-- Data for Name: product_selected_attribute_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_selected_attribute_list (product_attribute_id, product_id, manage_stock, stock_quantity, allow_back_order, stock_status, sold_individually, weight, length, height, width, shipping_class, sale_price, regular_price, taxable, image, shipping_note, title, rating, rated_users, image_temp, barcode, image_action, pr_code, product_desc, product_full_descr, size_chart) FROM stdin;
\.


--
-- TOC entry 5132 (class 0 OID 25594)
-- Dependencies: 399
-- Data for Name: product_selected_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_selected_attributes (product_selected_attributes_id, attribute_id, attribute_values_id, product_id) FROM stdin;
\.


--
-- TOC entry 5134 (class 0 OID 25602)
-- Dependencies: 401
-- Data for Name: product_specifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_specifications (prod_spec_id, product_id, spec_title, spec_descp, lang, spec_title_arabic, spec_descp_arabic) FROM stdin;
\.


--
-- TOC entry 5136 (class 0 OID 25612)
-- Dependencies: 403
-- Data for Name: product_temp_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_temp_image (id, product_id, product_attribute_id, image, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5138 (class 0 OID 25622)
-- Dependencies: 405
-- Data for Name: product_variations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variations (product_variations_id, attribute_id, attribute_values_id, product_attribute_id, product_id) FROM stdin;
\.


--
-- TOC entry 5140 (class 0 OID 25631)
-- Dependencies: 407
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, product_type, name, active, deleted, created_by, updated_by, company_id, store_id, description, featured, meta_title, meta_description, meta_keywords, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5142 (class 0 OID 25647)
-- Dependencies: 409
-- Data for Name: promotion_banners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotion_banners (id, title, image_name, status, created_at, updated_at, url, type, product, service, banner_type, activity, store, category) FROM stdin;
\.


--
-- TOC entry 5144 (class 0 OID 25663)
-- Dependencies: 411
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings (id, type, user_id, product_id, product_varient_id, service_id, vendor_id, rating, title, comment, created_at, updated_at, order_id, name, email) FROM stdin;
\.


--
-- TOC entry 5146 (class 0 OID 25678)
-- Dependencies: 413
-- Data for Name: ratings_reply; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings_reply (id, rating_id, message, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5148 (class 0 OID 25688)
-- Dependencies: 415
-- Data for Name: recently_viewed_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recently_viewed_products (id, user_id, product_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5150 (class 0 OID 25693)
-- Dependencies: 417
-- Data for Name: ref_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_history (id, sender_id, accepted_user_id, name, ref_code, status, discount, discount_type, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5152 (class 0 OID 25706)
-- Dependencies: 419
-- Data for Name: report_reasons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_reasons (id, reason, created_at, updated_at, reason_type) FROM stdin;
\.


--
-- TOC entry 5154 (class 0 OID 25714)
-- Dependencies: 421
-- Data for Name: reported_shops; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reported_shops (id, user_id, shop_id, reason_id, description, created_at, updated_at, product_id) FROM stdin;
\.


--
-- TOC entry 5156 (class 0 OID 25722)
-- Dependencies: 423
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service (id, name, image, service_price, active, deleted, "order", description, created_at, updated_at, included, service_user_id, building_type, service_type, contract_type, duration, building_type_id, "time", document, order_count, service_price_type, activity_id, price_label, sort_order, from_date, to_date, seats, term_and_condition, work_shop_details, feature_image, to_time, from_time, location, latitude, longitude, vendor_id) FROM stdin;
\.


--
-- TOC entry 5157 (class 0 OID 25736)
-- Dependencies: 424
-- Data for Name: service_assigned_vendors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_assigned_vendors (id, vendor_user_id, order_id, service_status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5159 (class 0 OID 25742)
-- Dependencies: 426
-- Data for Name: service_bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_bookings (id, service_id, user_id, vendor_id, seat_no, status, payment_type, price, service_charge, "Workshop_price", tax, grand_total, ref_id, created_at, updated_at, number_of_seats, order_number, admin_share, vendor_share) FROM stdin;
\.


--
-- TOC entry 5161 (class 0 OID 25754)
-- Dependencies: 428
-- Data for Name: service_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_category (id, name, image, banner_image, parent_id, active, deleted, "order", description, created_at, updated_at, activity_id, sort_order) FROM stdin;
\.


--
-- TOC entry 5163 (class 0 OID 25768)
-- Dependencies: 430
-- Data for Name: service_category_selected; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_category_selected (id, service_id, category_id) FROM stdin;
\.


--
-- TOC entry 5165 (class 0 OID 25775)
-- Dependencies: 432
-- Data for Name: service_event_feature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_event_feature (id, service_id, event_feature_id, created_at, updated_at, feature_title) FROM stdin;
\.


--
-- TOC entry 5168 (class 0 OID 25785)
-- Dependencies: 435
-- Data for Name: service_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_images (id, service_id, image, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5170 (class 0 OID 25790)
-- Dependencies: 437
-- Data for Name: service_include; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_include (id, service_id, title, description, icon, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5172 (class 0 OID 25798)
-- Dependencies: 439
-- Data for Name: service_order_status_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_order_status_history (id, order_id, order_item_id, status_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5174 (class 0 OID 25806)
-- Dependencies: 441
-- Data for Name: service_timings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_timings (id, vendor_id, has_24_hour, service_id, day, time_from, time_to, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5176 (class 0 OID 25817)
-- Dependencies: 443
-- Data for Name: service_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_type (id, name, description, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5178 (class 0 OID 25825)
-- Dependencies: 445
-- Data for Name: service_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_types (id, name, status, deleted, sort_order, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5180 (class 0 OID 25833)
-- Dependencies: 447
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, admin_commission, shipping_charge, created_at, updated_at, tax_percentage, store_radius, service_radius, service_charge, free_shipping_min) FROM stdin;
\.


--
-- TOC entry 5182 (class 0 OID 25843)
-- Dependencies: 449
-- Data for Name: skin_colors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skin_colors (id, name, color, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5184 (class 0 OID 25850)
-- Dependencies: 451
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.states (id, name, active, country_id, created_uid, updated_uid, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5186 (class 0 OID 25857)
-- Dependencies: 453
-- Data for Name: store_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_images (id, image, store_id) FROM stdin;
\.


--
-- TOC entry 5188 (class 0 OID 25865)
-- Dependencies: 455
-- Data for Name: store_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_likes (id, store_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5190 (class 0 OID 25870)
-- Dependencies: 457
-- Data for Name: store_managers_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_managers_types (id, name, created_at, updated_at, vendor_id) FROM stdin;
\.


--
-- TOC entry 5192 (class 0 OID 25878)
-- Dependencies: 459
-- Data for Name: store_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_type (id, name, banner_image, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5194 (class 0 OID 25888)
-- Dependencies: 461
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stores (id, vendor_id, industry_type, store_name, business_email, dial_code, mobile, description, location, latitude, longitude, address_line1, address_line2, country_id, state_id, city_id, zip, logo, cover_image, license_number, license_doc, vat_cert_number, vat_cert_doc, active, verified, deleted, created_uid, updated_uid, created_at, updated_at, commission, tax_number, tax_street, tax_address_line_2, tax_city, tax_state, tax_post_code, tax_phone, bank_country, tax_seller_type, residence_country, dob_day, dob_month, dob_year, shop_currency, shop_language, first_name, last_name, delivery_type, standard_delivery_text, delivery_min_days, delivery_max_days, vendor_share, admin_share, banner, tax_dial_code) FROM stdin;
\.


--
-- TOC entry 5196 (class 0 OID 25902)
-- Dependencies: 463
-- Data for Name: subscribers_emails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscribers_emails (id, email, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5198 (class 0 OID 25907)
-- Dependencies: 465
-- Data for Name: temp_order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_order_products (id, order_id, product_id, product_attribute_id, product_type, quantity, price, discount, total, vendor_id, admin_commission, vendor_commission, shipping_charge, customer_notes, customer_file) FROM stdin;
\.


--
-- TOC entry 5200 (class 0 OID 25921)
-- Dependencies: 467
-- Data for Name: temp_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_orders (id, invoice_id, user_id, address_id, total, vat, discount, grand_total, payment_mode, admin_commission, vendor_commission, shipping_charge, temp_id, ref_history_id, ref_code, admin_commission_percentage, vendor_commission_percentage, order_type, pick_up_date, pick_up_time, service_charge, coupon_code) FROM stdin;
\.


--
-- TOC entry 5202 (class 0 OID 25948)
-- Dependencies: 469
-- Data for Name: temp_service_order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_service_order_items (id, order_id, service_id, price, discount, total, admin_commission, vendor_commission, booking_date, text, hourly_rate, task_description, doc, qty, vat) FROM stdin;
\.


--
-- TOC entry 5204 (class 0 OID 25961)
-- Dependencies: 471
-- Data for Name: temp_service_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_service_orders (id, invoice_id, user_id, address_id, total, vat, discount, grand_total, payment_mode, admin_commission, vendor_commission, temp_id, booking_date, coupon_id, ref_history_id, ref_code, user_latitude, user_longitude, service_charge, task_description, doc) FROM stdin;
\.


--
-- TOC entry 5206 (class 0 OID 25975)
-- Dependencies: 473
-- Data for Name: temp_user_account_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_user_account_types (id, temp_user_id, account_type_id, activity_type_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5208 (class 0 OID 25980)
-- Dependencies: 475
-- Data for Name: temp_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_users (id, name, email, dial_code, phone, phone_verified, active, email_verified, password, email_verified_at, role, first_name, last_name, user_image, user_phone_otp, user_email_otp, user_device_token, user_device_type, user_access_token, firebase_user_key, device_cart_id, created_at, updated_at, is_social) FROM stdin;
\.


--
-- TOC entry 5210 (class 0 OID 25992)
-- Dependencies: 477
-- Data for Name: tesimonial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tesimonial (id, name, designation, comment, rating, user_image, deleted, active, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5212 (class 0 OID 26003)
-- Dependencies: 479
-- Data for Name: transport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transport (id, title, description, url, image, active, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5214 (class 0 OID 26012)
-- Dependencies: 481
-- Data for Name: user_account_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_account_types (id, user_id, account_type_id, activity_type_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5216 (class 0 OID 26017)
-- Dependencies: 483
-- Data for Name: user_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_address (id, user_id, full_name, dial_code, phone, address, country_id, state_id, city_id, address_type, status, is_default, created_at, updated_at, land_mark, building_name, latitude, longitude, location, area_id, apartment, street, email) FROM stdin;
\.


--
-- TOC entry 5218 (class 0 OID 26034)
-- Dependencies: 485
-- Data for Name: user_follows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_follows (id, user_id, follow_user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5220 (class 0 OID 26039)
-- Dependencies: 487
-- Data for Name: user_privileges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_privileges (id, user_id, designation_id, privileges, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5222 (class 0 OID 26048)
-- Dependencies: 489
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, dial_code, phone, phone_verified, password, email_verified_at, role, first_name, last_name, user_image, user_phone_otp, user_device_token, user_device_type, user_access_token, firebase_user_key, remember_token, created_at, updated_at, country_id, state_id, city_id, area, active, deleted, display_name, business_name, email_verified, user_email_otp, dob, vendor, store, previllege, about_me, verified, designation_id, is_private_profile, user_name, gender, website, wallet_amount, password_reset_code, password_reset_time, approve, user_permissions, password_reset_otp, is_social, activity_id, temp_dial_code, temp_mobile, minimum_order_amount, ref_code, is_dinein, is_delivery, designation_name, admin_viewed, delivery_charge, location, two_factor_auth, two_factor_code) FROM stdin;
6	Aamir .	dev21.ahmad28@gmail.com	92	3028066800	1	$2y$10$ykwIUtS8U2yGR1wrYq4ivuVKPqy0gIzwr79dRcllDBhEaOBcNYAUq	2025-07-14 20:53:53	2	Aamir	.	\N		1111	smap	f950c65377858ba33f0bec70d14c68a1b9e4d7d53cb99c85d4f3551d51fe46aa	-OV9hmn0KWcio2T5jFTJ	\N	2025-07-14 20:53:53	2025-07-14 20:53:53	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N	202507146	0	0		0	0	\N	\N	\N
5	Aamir .	dev2122.ahmad28@gmail.com	92	30280668923	1	$2y$10$9Gof89nEeZWZ6tigWlTVb.9TpanjmB5TLJ.wFr4i0Y4NwpV1oZzAK	2025-07-24 07:22:52	2	Aamir	.	\N	\N	1111	smap	7ee600eb7d899ee80d0b12eca04f8949da32da0d30eb0c92ed387a1c531e1b60	-OV7zObhAZYlcM9Htaba	\N	2025-07-14 12:51:34	2025-07-24 07:22:52	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	202507145	0	0		0	0	\N	\N	\N
4	Aamir .	dev212.ahmad28@gmail.com	92	3028066899	1	$2y$10$KC3pO5/MKbGbHQ.tNzw0a.QbjC7Xqd35QCz97cPZgetHWgxRkC/He	2025-07-14 12:45:23	2	Aamir	.	\N		1111	smap	ae55299c1b198b9a4e59d370b2d874a6151fc45ed552ba85b605959224f2b181	-OV7x9R7L-uNLEJxd59N	\N	2025-07-14 12:41:47	2025-07-14 12:45:24	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	202507144	0	0		0	0	\N	\N	\N
17	Hiba Dxb	hirasheikh652d@gmail.com	92	3129061806	1	$2y$10$3PgjJTT1q5wEuuGS/XZIyeEC2X6tJWL4DzPOj6jr/82yW7dxCi7hS	2025-07-23 23:06:19	2	Hiba	Dxb	688170f62c9d7_1753313526.	\N		android	eb5e0d1cb0b1061eaa2fbd249e3153c8c22828d4d6f10aa1ec1f6da6546a22f5	-OVr1R7Zeu1mHh-5Qo0t	\N	2025-07-23 11:27:22	2025-07-25 05:42:00	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N	2025072317	0	0		0	0	\N	\N	\N
13	Asad N	asadz@gmail.com	971	3441560319	1	$2y$10$DwHGQLh67vZy442RrkkktObecfj6xq2.yFU9UjV7Ze7RSzpxdEn4a	2025-08-06 23:27:55	2	Asad	N	687eb4d429bd1_1753134292.png	\N		android	25a1de23562fdf966e65ba41272df054d969c8e6aee6acbb726d5edbb602cc21	-OVC8Px3oaHZnVoIAa-2	\N	2025-07-15 08:13:49	2025-08-13 13:55:46	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025071513	0	0		0	0	\N	\N	\N
15	Eshaal Ahmad	eshaalahmad33a@gmail.com	971	3441560318	1	$2y$10$7If9S4ulVOkQvu2M10TlNO5WMYeS5fKzWwcD8u4kb1I57zm4d2LVa	2025-07-17 21:39:52	2	Eshaal	Ahmad	\N			android	748f03d261fbbaa9ba5a7e13a15ff937531021cea8313e5e8b2a3d0236f704d4	-OVPK4oWGTCNXkjiNTeU	\N	2025-07-17 21:39:52	2025-07-23 10:28:28	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N		0	0		0	0	\N	\N	\N
22	Usama Shakeel	ushakeel@gmail.com__deleted_account22	971	123123123__deleted_account22	1	$2y$10$PiJoLj6cvq9T4uAXuIkL7uSatxjKl2u7v0Syg.oZjANDe3F1qwa6.	2025-07-28 11:13:43	2	Usama	Shakeel	\N	\N		ios		-OW0Umx1IWue80UfgUzZ	\N	2025-07-25 12:11:50	2025-07-28 11:26:34	0	0	0	0	1	1	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025072522	0	0		0	0	\N	\N	\N
18	Asad Nazir	asadz14@gmail.com	92	3449061806	1	$2y$10$fyt5Tjw81.fNMGSlB1V.CeyathJ.QT0dAQgPY1HTI3bGJS4A4ZWD6	2025-07-23 12:16:12	2	Asad	Nazir	\N			android	6a49e4ab73156defb48fd7f9b0c9a98754343a0b7e14d3aef5251e554c47e850	-OVrCbWeNrbdhKXRXKL5	\N	2025-07-23 12:16:12	2025-07-23 12:16:24	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
12	Asad Nazir	Abc@gmail.com	92	3441560319	1	$2y$10$XTc83xjaudERnVh5ANNjMONJursQTQIStf.QWbfmcPF1HWQZpfcja	2025-09-02 15:32:49	2	Asad	Nazir	\N	\N	cvDO266TR1mq2qZ3zcvuEY:APA91bH0Ca5PI73APvLp7XC8ArY9BH05HzWuRMqUiKsSFjuxYdgZOODn-9kG2XPM70mxLnSfPqv11eXmg9xres9umaCzQ3iZnMMLGZLE2jVw7Pemc69KBA0	android	5caf29af46776f4f6d42a2c436574f3c15b1ecc633a5a27eff9026c283e5ed7a	-OVC6MJjzM01uEKwkyZi	\N	2025-07-15 08:04:50	2025-09-02 15:32:49	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025071512	0	0		0	0	\N	\N	\N
20	ANIL NAVIS	anil@dxbusinessgroup.com	971	4564664688	1	$2y$10$L5rC0tq1EUVBew6Z46Y7eOR63ox81Xw.HaNPkadv34A7ZEYT.vp6i	2025-07-25 04:38:59	2	ANIL	NAVIS	68830a7c09865_1753418364.			android	6a8850ef9110cda40bcab83cc10532d425575102351ce2fdd2941203c0120273	-OVzs8J_uqztbUbBFuQg	\N	2025-07-25 04:38:59	2025-08-02 07:29:27	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N		0	0		0	0	\N	\N	\N
11	Aamir .	asadnazir289@gmail.com	92	3028066802	1	$2y$10$CsUNaqbvu9pB5PIjNnieK.NWXM/qTLXnDTXzH391BCfy0/kXl8qPe	2025-07-15 07:51:00	2	Aamir	.	\N	1111		smap	6998b806a051bac42b8b4035518b4e744e2cbdf14db65286c301fa1a03ae9b8d	-OVC3BZksBkHufZqteN3	\N	2025-07-15 07:51:00	2025-07-17 21:06:01	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N	2025071511	0	0		0	0	\N	\N	\N
16	Hiba Ejaz	hibaejaz97@gmail.com	971	8955477445	1	$2y$10$b.YLjoBTNHPPip7S0f7vOuXdWK3zN8jcdOc/NAcYluVxyqm9UJbvy	2025-07-31 10:30:49	2	Hiba	Ejaz	\N	\N	1111	android	f684a5ae7b62403d6fbd441c2cadc6d949aaa78b05435386acc25d0f45ff0a36	-OVSnpYk0pW69kjitKxT	\N	2025-07-18 13:53:04	2025-07-31 10:30:49	0	0	0	0	0	1	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025072416	0	0		0	0	\N	\N	\N
19	Asad Nazir	asadpk@gmail.com	971	3129059099	1	$2y$10$ZHT90FGc.S7MPcwicD7e1OVuiW.MdZRcJhLmkucE429NSLK.EfIjm	2025-07-23 22:10:53	2	Asad	Nazir	68816a606d768_1753311840.			android	469c94252a0e1222d3eae56efb6a8e6bf06b721bef743463f130805a516c36bf	-OVtKiX0fQV8HtkMvzTm	\N	2025-07-23 22:10:53	2025-07-23 23:04:41	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
21	\N	hiba@admin.com	\N	123455	0	$2y$10$VwCQI/M28eNuLfzyvTbTxuSxdAV2BNKBf2wa87TROONzFDKpP8SV2	\N	1	Hiba	Ejaz	\N	\N	\N	\N	\N	\N	\N	2025-07-25 08:15:46	\N	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0	manager	0	0	\N	\N	\N
1	Admin	admin@admin.com	971	112233445566778899	0	$2y$10$r7vaIM2efL03KANsuKs4SO7vsLBidcdQy2VlYIawpRNoP3GKsoqiC	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
24	ajesh Kumar	ajeshcd@gmail.com	971	505041860	1	$2y$10$M1CDJ/1rFanjOoK03xaq1uVaIJdMToCal4xLd6BgLp7MKdKgoC4Ke	2025-08-01 17:14:36	2	ajesh	Kumar	\N	\N	d5Prbi-DRUh7qP-4ZcSD2c:APA91bEwYQ_Bf8vGhsQdt8EVoyW5thlvi0PIDv8HVkb35uu94uB9U30h8Qub5nhg9Nbkeg4aJiZaE8-O-IXpASemJXIohAfu6pgxloYpau5QwQKFgGULpkA	ios	e036d27a027effa1e08552aa708705156a1544fa854290da921a1ed4c0286a89	-OW46rcLLQnsnVTcb7FB	\N	2025-07-26 05:05:47	2025-08-30 11:02:12	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N	2025072624	0	0		0	0	\N	\N	\N
23	Anol Nabis	anilnavis@gmail.com	971	564005096	1	$2y$10$q7FR2FleXHt9PUfgSJYpt.aOrUUwc9lEXLyBnc4filynlp90ekV1m	2025-07-27 12:43:09	2	Anol	Nabis	\N	\N		ios	8c07eb6726f1c85b249fd67f9d51392d3f50caf86b328d5c1ab9568e4b3015f1	-OW1y6gIyW3bgdje5BMF	\N	2025-07-25 19:03:56	2025-07-27 12:43:14	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025072723	0	0		0	0	\N	\N	\N
39	Fgggh Fff	fg@ggh.com	971	5566666666	1	$2y$10$NhI4xUoDPN6YXszkAf8Kc.0jRguUOyyxymPTYfjslgN030rcpKwm.	2025-08-02 07:29:54	2	Fgggh	Fff	\N			android	30ae2bd6d330db4a165940df32975d43bb53750df3451e35cf8cb50afa76b478	-OWdfz7HX7pwA0LJO7oI	\N	2025-08-02 07:29:54	2025-08-02 11:24:34	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
25	Vegw Gegge	vh@hhj.con	971	564005896	1	$2y$10$XX9QAC6UeQ/O3Z9/wW82jezGBpHWg8vXb5.dyKF5E1xjJ4ZtChVri	2025-07-27 12:44:03	2	Vegw	Gegge	\N		\N	ios	f0153bb74f303ffab60e0fdac483d5679fc5f8da917e67414f399aaa917303f5	-OWAuLQpUL59EmJCBFp4	\N	2025-07-27 12:44:03	2025-07-27 12:44:04	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
30	Anil Navis	aj@hj.com	971	8075244766	1	$2y$10$AWTXwhjqC7rfSJApJoCiEOhPpP3HvmBS49HTSdt.4XGOAp3OTGiP.	2025-07-28 18:34:39	2	Anil	Navis	6887c5e2abf4c_1753728482.		\N	ios	461bad6bbc6ce8c851ca5f47bbd2e5f3244bfe8f54c8a89ddb136b96ee0fb67b	-OWHJAw6MNJOsXRPdKJz	\N	2025-07-28 18:34:39	2025-07-28 18:48:03	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
26	Usama Shakeel	ushakeel123@gmail.com__deleted_account26	971	124124124__deleted_account26	1	$2y$10$tJEjC9twi6erjTiGiz1fCOQnLvrJxyFhDZO/pYG8bT5ycBFQG/Mru	2025-07-28 09:20:26	2	Usama	Shakeel	688756f69c581_1753700086.			ios		-OWFKKY8II26rIWbEFjD	\N	2025-07-28 09:20:26	2025-07-28 11:09:58	0	0	0	0	1	1	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
32	Alpga Jalloh	jj@gn.com	971	775846393	1	$2y$10$kDyPCT2niRinv32W8BeaF.PlVDxx6ylbqxAk6hbsPnaaen0AHLT82	2025-07-29 11:20:10	2	Alpga	Jalloh	6888b847a8794_1753790535.		\N	ios	35b469cfb65bf631964732ecd5aa9727318db97307d59b48bc075eeaef9eb2a4	-OWKuK2OLfVmork2_bmz	\N	2025-07-29 11:20:10	2025-07-29 12:02:15	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
33	Gy Gge	ggg@ghh.com	231	5151661661	1	$2y$10$dzykHrt0d5JBI4PkAr3r0uTLLLWAxU1uswSLRRNrVhXtKZlD1oHXK	2025-07-29 12:34:34	2	Gy	Gge	\N		\N	ios	797234fb43b843875dfc05cbd3beb62f081ab3c1cd553933e3f85e402358d89f	-OWLAM-jDOXeRLeVna2u	\N	2025-07-29 12:34:34	2025-07-29 12:34:35	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
14	Hiba Ejaz	hibaejaz97+1@gmail.com	971	561660157	1	$2y$10$jr0NVqAEkazJMqITlseZvOb9r5DXZ.0HcWeqDNGH3Kha2DdA38cMS	2025-08-01 15:24:23	2	Hiba	Ejaz	688cdcc86e895_1754062024.	\N	fi509BALTzytFtYUctckiF:APA91bEEAFZzG0TCFIbe0KA_qENOorOKQDfbS84vXS3JdqVgo40Y2IeYdnn04nKPb0eUWC7QKxersrmJTO1xnewuS__8S50bQrdlYlGWy6ExjzZ6Xh10-Wc	android	964b12fd81034cb03f1f1560eb25699b5b572fe170ac06881397831c85fece09	-OVI1rwcik4vbl_5AUBI	\N	2025-07-16 11:42:56	2025-08-29 10:45:00	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025071614	0	0		0	0	\N	\N	\N
31	Anil Navis	navisanil@gmail.com	971	8485456464	1	$2y$10$upCuAg61TKI6vXjr3RV2xuPHdlD384mr/oX1NWKJl.UwRbspGgMu6	2025-07-29 10:41:26	2	Anil	Navis	\N		\N	ios	79c8a6c188b3c04685b339774bb9c3326154989a09dc745746def3b4f4e29a85	-OWKlSd9sRHJhxFseLvN	\N	2025-07-29 10:41:26	2025-07-29 10:41:26	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
35	Hamid Raza	razahamid35@gmail.com	+92	3441562556	1	$2y$10$jSyuB9dK4AHStMRy5Yhe/eMkL2SuCTYFTpwb9xigayuMOZiOx.BuW	2025-08-01 13:16:26	2	Hamid	Raza	688c7456c6a5f_1754035286.	\N	fRrw_tUhekH6hHfGthguMr:APA91bFfXQSz81DeiUg0UEVcmNTX8okycTYvmKXuJjORR4iFLpm5dO-rPoSa-KSqIy4MuFHrlwdGT_2ogPzVFREQ4Es8LIQs0jB3dR3L2AYL5H1Lh6ZBZv4	ios	fa8140a3add05d6bc9b1f9ef4529f6d8ec5bf00ed5e7404c74314d8fade8693e	-OWZM1dJ-AQUoAdiladz	\N	2025-08-01 06:40:18	2025-08-11 16:16:17	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N	+92	3441562556	\N	2025080135	0	0		0	0	\N	\N	\N
27	Usama Shakeel	usama@gmail.com	971	123123123	1	$2y$10$v48VjocJmDQZeyQj0dVQYOqzMVK9m6ucwF6rHWHyVTohudgPxOwnm	2025-08-20 10:08:34	2	Usama	Shakeel	68a06d1cc638a_1755344156.	\N		ios	d2d8d7740c9cf02404aa6d0730921f213ca51ce94d54b5f5e47ea23d457ceaf0	-OWFmI3uHXQYDu-BjIcp	\N	2025-07-28 11:26:59	2025-09-05 05:47:26	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025072827	0	0		0	0	\N	\N	\N
36	Hehuiwi Huueue	bhh@hjdj.com	231	5516613331	1	$2y$10$S5cA9z.9ifituH9uY46eg.hpEJWiFMIO1G6MmXT2RNVg7m1XeEX1u	2025-08-01 15:38:34	2	Hehuiwi	Huueue	\N			ios	ee4990562430eed52ecbf01839881b097b389b55cf2bad9b162d331493c8c2a4	-OWaHE_8DUDHclLXh6h5	\N	2025-08-01 15:38:34	2025-08-01 15:42:02	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
37	Gggwhyw Gwhhw	gh@hjdj.com	231	5131333133	1	$2y$10$FZ8EXod7DOM7raUpwTqlRO4ExWAFGUHAzsateTONTXX3h4ByODXqK	2025-08-01 15:42:30	2	Gggwhyw	Gwhhw	\N		\N	ios	0398b8613c1da3b228d93cf398005af5355ad969d3e4cd93ec120627755b36cf	-OWaI87W9ZvH_SQO11gL	\N	2025-08-01 15:42:30	2025-08-01 15:42:31	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
93	Vsbe Yysy	hh@xhh.com	231	8481661613	1	$2y$10$H7PgSQJLCOwC/IL.UnGK9.lr/ajag4S5rBIx/e7vYz3/xT7W0eZLy	2025-09-03 02:23:49	2	Vsbe	Yysy	\N		eVwhvNtUzE3OtWSULuTLOZ:APA91bFctuUDxMxWmLaODXvgzDjuY3ac1EK_zackWkpnhouytQmvkCLUyMTORV41MfubfUe-fJsHam8IXBdiG8fkt4QolrTAWxHosE_O5cWYNLQ49KyNWEg	ios	9643e08897f23d990c2ab835d1d3cb76b7c818bc026c843dac64fdd61dc9657e	-OZCNnT3S7VzZfTIYXim	\N	2025-09-03 02:23:49	2025-09-03 02:23:50	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025090393	0	0		0	0	\N	\N	\N
38	Gahwhhe Teyw	ggeh@hhsjd.xom	231	5640005668	1	$2y$10$aUdAkKVXXucfaLkMvNc0e.OGjhLa6hQX2O1UIfnkq2QvOQ6qrc.cK	2025-08-01 17:09:36	2	Gahwhhe	Teyw	688cf4e65b452_1754068198.		\N	ios	56f5bf96db0164118d8cca9a17e7d6469580feb8e344a4ea3d99f24fee51d228	-OWab468K7ynrdhOfukE	\N	2025-08-01 17:09:36	2025-08-01 17:09:58	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
40	Sam Cotlin	hibaejaz97+3@gmail.com	+231	561660158	1	$2y$10$QARnBT2loZrDqVu4OxjRfO3I2EpBSPzM4X9YHneQWav1.vE2JrZ7W	2025-08-02 11:26:27	2	Sam	Cotlin	\N	\N	c7SKf_dEQVaEwcc1yB7u8a:APA91bEFIMjA-z7TiD-qm7nix5HVZK-P1gMahOeECcHSfiM6YebwT3GDDIytXMeWOAz_4wP8P-ywicRWGdCfKsYT0ks_JpIrCooA0GqH-jnNsSlKnzutFSU	android	8dc960b99995b02bd66adfc2c3e3e4867b9b2827028a1af0096f90653cc1b14c	-OWeX79Nipu61GnugpxQ	\N	2025-08-02 11:26:27	2025-08-02 11:29:50	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N	+231	561660158	\N	2025080240	0	0		0	0	\N	\N	\N
29	Alpha Jalloh	jj@gmail.com__deleted_account29	231	775846393__deleted_account29	1	$2y$10$GPzvNPBKAPLwqwkqCNyV8.SrB4iIJUbNye.wvGrujMqHos0SkOjd.	2025-08-01 17:42:29	2	Alpha	Jalloh	\N	\N		android		-OWH6Zf_TH5W_PV2I823	\N	2025-07-28 17:39:33	2025-08-02 19:34:15	0	0	0	0	1	1	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025073129	0	0		0	0	\N	\N	\N
43	Hiba Ejaz	hibaejaz97@gmail.com	231	561660177	1	$2y$10$st0fQbSu8sLfdEdxZE84lOmuYdmA94O8JkRRP6OEhw2KnfC5A.hFq	2025-08-02 12:14:00	2	Hiba	Ejaz	\N			android	568b9e1cf29cea2003784096c7f407cdd8cec3203cb31b025bfa64100f343513	-OWeh-iDP4feBg9TtR_a	\N	2025-08-02 12:14:00	2025-08-22 08:40:37	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025080243	0	0		0	0	\N	\N	\N
41	Ghhh Fghhh	hhh@ghh.com	+231	566686677	1	$2y$10$TaBAcHJUZ0rWi27rcr2zO.UCTHfwMUotCYlqwQ8qkFudU4GV9dQv6	2025-08-02 11:26:28	2	Ghhh	Fghhh	\N	\N	c0m5fasbRgi_vySbIrY89P:APA91bER8-kGFO9tyrq1nh-yrRkwl8GmhTEnszRTkj_lTaUEzt4lz50tKvW6YzPMv3rk3yWOA6pw471Uo6XnPQ4W4cBCNKLCs1fjXyRQsumevO1VF9zfEhE	android	32219f65c04cfb898e105379549bd781968b710e9c721f4a57123e2bc272cad5	-OWeX7HBF8GdBFpS_74k	\N	2025-08-02 11:26:28	2025-08-02 11:29:46	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N	+231	566686677	\N	2025080241	0	0		0	0	\N	\N	\N
45	Hamid Raza Goraya	razahamid34@gmail.com	231	3464646464	1	$2y$10$smXm2fDXN6nI.hwWO9YEG.HUKy/aRjxM1lENjI6JpAfv6mHfuqkvK	2025-08-02 12:23:15	2	Hamid	Raza Goraya	\N		f49wdyklS7W96gHhGEl_So:APA91bHRMGEZLUqdqMIN6QzyMzvtrUXyBScqe0nDZkVdysk17RNDwH2nLPkInW35KviywVswliqOG2oGfaOqc89-OHuiUvb3QNIAiBeRqfYsi8ofWTuTr48	android	240112e59c4da81801d0a141a61cc892ce008022fdee567530b604f75af2c490	-OWej79QqD860AgmGNRB	\N	2025-08-02 12:23:15	2025-08-11 16:00:53	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N			\N	2025080245	0	0		0	0	\N	\N	\N
50	Heeu Yeyye	hh@ghh.com	231	5456343646	1	$2y$10$BBYaT09hfQT0o4XCU.W2Te0HDr2ksjEN9eHuUzLridl.p7uKIOZHK	2025-08-04 20:52:24	2	Heeu	Yeyye	\N		di66VGeEhUpDplcBpg0rhd:APA91bH1uGegyc3WayZp4v0DutYA42QxM194JPj2URW9ITH77BjtcspUzug_E8TPBGqWPxCR-stKEDBSJ_bRXYaGsRc6ADSRHiMjs3y0ptQZMKFxAcZZZs8	ios	e36d582053d3755dd5cf996502e3be2eff7e16273cf5b18757a18b38cd83a84c	-OWqqpsXyCC1c7z1BG5m	\N	2025-08-04 20:52:24	2025-08-04 20:52:24	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025080450	0	0		0	0	\N	\N	\N
86	tes teet	test@sdsds.xom	231	22222222	0	\N	\N	2	tes	teet	\N	\N	\N	\N	\N	\N	\N	2025-08-21 14:05:09	2025-08-21 14:05:09	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
42	Tommy Hilfiger	tom@gmail.com	231	561660157	1	$2y$10$M4BfZ3chsW/qJayjdev9PuUVT2WRjuvamIZ6l22CeeFznRZ7kR5Ja	2025-08-02 12:11:30	2	Tommy	Hilfiger	688e00b2d00da_1754136754.			android	64f8348d330ff1b40917dcd85356fd3d4200657556206f05c2d6bea687cc8140	-OWegQxF-NwIoEMfB3dg	\N	2025-08-02 12:11:30	2025-08-02 12:13:44	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025080242	0	0		0	0	\N	\N	\N
47	Bbh Ggg	bbh@vh.com	231	5156131331	1	$2y$10$QqvdtUcjjH.3guihOK9Vzugx7XQAY0F5/f8jsZtnoSQdtU//VudFa	2025-08-02 13:08:11	2	Bbh	Ggg	688e10e7874f8_1754140903.		f8GKP4v3LUQsu72SB-PlFK:APA91bHxCLEXoJWtXC3q3aj6hLB6py4ujJ9mXxX6niFChJFFtuXJKjmTpTC6GRZMnePuBUkr0B39OWDSXkqlWBhodnjHWMbsUrMdbEm_AIVAD41QCQsoyeM	ios	27df12c750e1a183ef342ffb8665104e77c1c9d3a06fe40b57b699821b68443d	-OWetPTkJlVENpBW4v5z	\N	2025-08-02 13:08:11	2025-08-02 13:21:43	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025080247	0	0		0	0	\N	\N	\N
46	Hehhehe Ghhh	hhh@hhj.com	231	8466469466	1	$2y$10$4B4VS/hT4HnyuB2oBp.mz.WaLYcIVzBH0ZrrgwDiEsqfv.NOV3hrO	2025-08-02 13:01:47	2	Hehhehe	Ghhh	\N		e0TcSkKQRj6HUXnIcv8Mzb:APA91bHBfZBD84-m-bhMf473K-RaWI6gKe247-mTla9IukNEqDoqkgKiLRvotDSaEzW0RgIpQFSy0TBdGKtBvc-j6aXJUKDo9fXngsmARMXLfu0wjiqDaa4	android	5a76a0db3bfbd65ababbba80872a023fcdf4a90dbbde311b08cd9bcb7926db37	-OWerwjOvxaICsDTM5rk	\N	2025-08-02 13:01:47	2025-08-02 13:01:48	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025080246	0	0		0	0	\N	\N	\N
44	Hamid Raza	razahamid35@gmail.com	+92	3441562557	1	$2y$10$oFaJY5sMXrys.1NDlPBCKOADl//T8vnKLg5XSsp1bVgW2El3Kfghe	2025-08-02 12:15:28	2	Hamid	Raza	\N	\N		android	a0ec72b6cee2a605cf8da869adb871c3eb7ce0afd25974f150c3796e6fdfd1e0	-OWehLAx-eHJHuv3hF3v	\N	2025-08-02 12:15:28	2025-08-02 12:16:09	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N	+92	3441562557	\N	2025080244	0	0		0	0	\N	\N	\N
49	Baillo Bah	ba@gm.com	231	0775846393	1	$2y$10$nWBA7LZqwu0ao2mNu5zNMudZSWWHspOZ3tYInSgpEAfGbY2Q6ugT6	2025-08-02 19:35:26	2	Baillo	Bah	\N		\N	ios	cd407ab8e62826c17452689a8efd64515d27c56fdaa7c011caecd98848731285	-OWgH1wdWf1pCtIW8KC9	\N	2025-08-02 19:35:26	2025-08-02 19:35:26	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
51	Vsbshshhhsh Hshs	hdj@hj.com	231	5456464664	1	$2y$10$bwQeD3RUoBb1o953sujdQemn2WZV5CQaL9TlYahq9pHEVMb0PoVAG	2025-08-11 10:15:17	2	Vsbshshhhsh	Hshs	\N			ios	341f22a7bc82fa61937508c42cc74785da859f4241ba211a4f143800851851b6	-OXNc8Ldl8hipu7CAPOG	\N	2025-08-11 10:15:17	2025-08-11 10:19:22	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025081151	0	0		0	0	\N	\N	\N
53	Cc Fr	ff@cf.com	231	555555555	1	$2y$10$nDUa/fqh3o/hmFINskOb9eRu95cZJwOSI9ijHcC1qj4snhci2CVO6	2025-08-11 15:37:52	2	Cc	Fr	\N		dbQ5T-l9QRGnO8VZnU9mDl:APA91bHd3uY6x80ACa3KtQjp043OnsUZsw8jjB4f6tdtURq8jTX6-pt0ITZkHoAdjBEHdw5-oImR3qBdt_vrqn4n3sVHBtUD-OrbfROCaSjyXHITHGAxpc0	android	3d72e95a54ed67fed9b590ca096ce103dfedd406cc53c2950bff48490303f609	-OXOlyoXfD-D06aCQshv	\N	2025-08-11 15:37:52	2025-08-11 15:37:53	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025081153	0	0		0	0	\N	\N	\N
52	Gehueuie Gheh	vh@hh.com	231	515516666	1	$2y$10$g3S/gkEUgJzP4z8yQeK3..D40fWidTCVD1R0ABq73w9rseU9tu9J.	2025-08-11 10:19:39	2	Gehueuie	Gheh	\N		ccs8kq7guE8kr5avXYJzat:APA91bHkAoCgcWwimSBjbV3tKYVDz94iuugl7yuX7HMmDPKFZcdANRZHM47sE7kz0MfsYvosHvVtJZVUt6NfmCj0_0V218xSFWpXra7mucuF-incOqAHOkU	ios	c85c5140193555f4b10102757f77da34fb2f3af12f4ad0ce9824f365bbde2a74	-OXNd8Q_W2dpFIDl5lAc	\N	2025-08-11 10:19:39	2025-08-11 10:19:40	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025081152	0	0		0	0	\N	\N	\N
54	Hehr Gege	v@v.xom	231	6166266266	1	$2y$10$wZKY4VZC4//nyG9GfanasOSIY6L6TDuZj9.IRE9.a0hY78M4Wnsk.	2025-08-11 16:03:56	2	Hehr	Gege	\N		eeLy_lDQRFazSlfE1C7EJY:APA91bEjw_xfpg92lLMI6Ab-nPpsGDTg60Sw2KOWdOdYiO4SIvsHI4Eg6senNw93F0_fZ_REckeeh_7kg3TzkPaGqBYhueU9cSJh4vgqMioiMTe0Cfm6Tt8	android	52d71ee178563d53911c0827e2fbc20d378cb04d8d0aedeb556bce3882550009	-OXOrwgjPS5heok2Z4x0	\N	2025-08-11 16:03:56	2025-08-11 16:03:57	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025081154	0	0		0	0	\N	\N	\N
55	Anil Vv	bb@vh.com	231	5155133131	1	$2y$10$XUeJTChaJWEsFjxLOwCvceCkxxQbhPtGtJliTxrxmLCMqnh0N2EMq	2025-08-11 20:29:25	2	Anil	Vv	\N		cmDTRxFm9En7jWGA8YMTr6:APA91bFieYDJuUKXS3zRLYLSFV7eDZmGlfdsS4OK_mRkL-swMtu-f08D-0bY09WeuolUS5fspCJZc3JaoivYNOIW1j-tZOI2HozEd9hvUCPv4r0Nn-9rl3U	ios	d1e334a94ba611fd49acc7acc3605d31b2613e55680833b8cb20be6a58dadae6	-OXPohTZ5w7CcNE_pSiB	\N	2025-08-11 20:29:25	2025-08-11 20:29:25	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025081155	0	0		0	0	\N	\N	\N
59	Hiba Ejaz	hiba@gmail.com	\N	\N	0	$2y$10$0VBoNuDE9bke83K86WKFmOxymQJcmk8k.vYggtQbKhoUIvPzTFPM.	\N	2	Hiba	Ejaz	\N	\N	\N	\N	\N	\N	\N	2025-08-13 07:14:19	2025-08-13 07:14:19	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
56	Anikm Nabjs	vv@vv.com	231	5225565566	1	$2y$10$Zh0nPXwUK8rox3uzkPL1kuRGmNw11F6mCY8t4gD/Srm50/7TVISoq	2025-08-12 05:24:04	2	Anikm	Nabjs	\N		euOnd0y3TUuriyJtfAtZDN:APA91bFNd-1jVRR9ORcdfV-i78KdB33v_o-sXOeiTNhumOi1wQ8iJ42zebyYSXS4ooUyjmOxjtl2JNROkGgIkt-4Lph37TGcDolwuN7_idbOteenrdZaKjE	android	f9e5bc1d708e6e048330cff445e4fe7e584ef4fe0d105045565c756da5437c8e	-OXRj4DGKEgJUlG8Binu	\N	2025-08-12 05:24:04	2025-08-12 05:24:04	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025081256	0	0		0	0	\N	\N	\N
60	Anil Navis	abcd@abcd.com	\N	\N	0	$2y$10$kcXxPMYDyACMngAtoyyU1udm.lc/7BYxZkEIQ9v2lvveLER.T1S9S	\N	2	Anil	Navis	\N	\N	\N	\N	\N	\N	\N	2025-08-13 12:57:34	2025-08-13 12:57:34	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
61	Hiba Ejaz	hiba@yahoo.com	\N	\N	0	$2y$10$YQuzTaOpjgpB165bk/ERfenMFax.Daj8jMC7tNsPS0VukQOaZkIte	\N	2	Hiba	Ejaz	\N	\N	\N	\N	\N	\N	\N	2025-08-15 06:39:10	2025-08-15 06:39:10	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
62	iftikhar dxba	iftikhardxba@hotmail.com	\N	\N	0	$2y$10$caMZKLqlfXMRzXBrRA1p.ueVjzJyhkfrhSt9ImjyjjtH.KmgSfHTG	\N	2	iftikhar	dxba	\N	\N	\N	\N	\N	\N	\N	2025-08-17 03:18:39	2025-08-17 03:18:39	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
57	Ggggh Rt	gg@cf.com	231	5565565566	1	$2y$10$oGRotevYP7NhxdNMBxyOGu9z4N/qrQjp8B/ZcOmXSTMtUGlm/uTA6	2025-08-12 06:16:55	2	Ggggh	Rt	\N		dDC5yiJFSuaptmn85_it2L:APA91bEQZkOTDW2Bwun5jkGpzhHifCZI8nmUBpbpq-YxJjNjaEX-Iy16czlTa_12ueG1DHossr9hXnLXF0bAI7lqx4azUA41tPZi4aIEUgWybaOm9zRvTSA	android	2cd266a2210cf0f966d8fe7386e9ff269910522bf56db8612304469399fb91c6	-OXRvALAliHs4D3IwmJc	\N	2025-08-12 06:16:55	2025-08-12 06:16:55	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025081257	0	0		0	0	\N	\N	\N
67	dxba dubai	dxbauser@mail.com	231	123409876	0	\N	\N	2	dxba	dubai	\N	\N	\N	\N	\N	\N	\N	2025-08-18 16:01:31	2025-08-18 16:01:31	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
68	dvvcxxcv cxvvxccx	cxxcxc@fdsd.sfds	231	123547025	0	\N	\N	2	dvvcxxcv	cxvvxccx	\N	\N	\N	\N	\N	\N	\N	2025-08-19 04:20:07	2025-08-19 04:20:07	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
58	Gehe Syyeuu	ghej@jdn.com	231	5451611661	1	$2y$10$qgOog6VVIKnJdqxRL1zPMuQmeKrWhTu.R.SJIFqxYthDBnFxUHley	2025-08-12 08:39:56	2	Gehe	Syyeuu	\N		e82qUuUrI0XcrZz-vbcmCE:APA91bFMWyUnajXaeixEAmsSvc0Cm062z9yt--5RvEN_U-veigEoCn6KGM0--XKtdjP12t1QZ-mIn5x3NI6B2n0OHfJeLM0lLb2zOoX3bNJrx-og_4QpvFQ	ios	c956b5405578e557b22cff02f407373c2a7a8220237515a3dd33e69db0388e48	-OXSQuJT7psPYmXrQTEi	\N	2025-08-12 08:39:56	2025-08-12 08:39:56	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025081258	0	0		0	0	\N	\N	\N
64	Teyyeuueu Geye	g@hehj.com	231	5152133135	1	$2y$10$s5ryG725ztvHYlBOp5ehYOMFPrB5Qmk2x6HCj6X3uoBxOCneqCkN2	2025-08-18 00:02:14	2	Teyyeuueu	Geye	\N			ios	4c0db858080d0ef8abd982203ca95eec936ead9d2243c7008af554dc4a6f6466	-OXuTxK1n4tm5ONk2Auc	\N	2025-08-18 00:02:14	2025-08-18 05:15:12	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025081864	0	0		0	0	\N	\N	\N
63	Getyeye Gyeye	b@b.com	231	5454334331	1	$2y$10$ewNNOUoAqbKFKvhl2SUtAOAXwUf1B3SqnKcwHPyfJgSCfIQCXtSWe	2025-08-17 03:43:16	2	Getyeye	Gyeye	\N		cW5VAh6DkUr7vw7vHB0C6e:APA91bFAp-SWtwlMh-LRYqc3g-hffRLXivkTsnN1z3QUZxApy83VOwe41OBwh0eXeIZDXiNsGsRXWEDjC9Z0naZZKmE_B1l0PzMxS66i6r-IcicuZNQaxAk	ios	7f93a9368fdbcf283e2c8b2c64677c97b06f2eea82bff46945cd7292fb2546bd	-OXq6xTGcUdAUf1G0h-X	\N	2025-08-17 03:43:16	2025-08-17 12:06:36	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025081763	0	0		0	0	\N	\N	\N
71	Gsvs Twy	G@hj.com	231	8485156161	1	$2y$10$0EUGOfqZNN87frMaDTJISuNiaZHHclGTZOHBvjS9KiryT5tBMskM6	2025-08-20 05:31:24	2	Gsvs	Twy	\N	\N	cwhLu9JXqkMmpSJQkvkujv:APA91bGksY3_OS6HkoA6aK8blj5wOiyT0neGN1aDz5Uqk3fDnJ2_HMlQBfmROUvQy4BgbnNjpSfkX4iF5VwalFbv4W-nvKh6fkpg4Hl7GNX6lY_Y3zZqS2c	ios	b2e67cf8702267e1cd745c97e4264fafa41b83e5e26439b3b8977c679d54fd35	-OY4xTeQyW9S-8Jx_9VW	\N	2025-08-20 05:31:24	2025-08-20 19:42:45	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025082071	0	0		0	0	\N	\N	\N
73	Anil Navis	Bb@bb.com	231	455556666	0	\N	\N	2	Anil	Navis	\N	\N	\N	\N	\N	\N	\N	2025-08-20 09:24:21	2025-08-20 09:24:21	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
69	Usama Shakeel	usama88@gmail.com	971	222333666	1	$2y$10$q8I7hc.mOMcAUXEXgwCroef7DnZ.s5IFCRpsOVrRYzQbn.89hMK0a	2025-08-19 13:25:53	2	Usama	Shakeel	\N	\N	ck_4eL82SsiKAOQID7c3S1:APA91bG2qwNJKgwiphqCrms3jf2svX5e6FM73J6uY0nHcEQGQSM1EOLphoXN8lkq4BejSGP-N-WNMaqWK04Bj8w6G-RXWlIrVZn_qs9T5ZqpelTz6Ois1VU	android	50fd0e59f88468358e769ad40951a2f170a538f0141edbc753b385d7b1a1b9be	-OY1EYzt0iXnDKqFz8FX	\N	2025-08-19 12:11:55	2025-08-19 19:12:45	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025081969	0	0		0	0	\N	\N	\N
48	Alpha Jalloh	alph@gmail.com	231	775846393	1	$2y$10$j2OpaRlG9uEZyk042eNEougUDYEFMGRolSAtRzT7Y8SnOkg3swIfa	2025-09-01 23:48:14	2	Alpha	Jalloh	\N	\N	fctWgpUehU3aoIXpJxZEDR:APA91bEjYmeS8btFGhZ7R9n-X5Ems-gFGZzuT4QZKAmTrAPzSVTTANUhNJ7Wq9PYVHKuWGmHhVX6YPijoSyJdbli4mLoi9VscgTKCdfABS2VNtkb3F8_EWI	ios	14d387dabfeb3ec92413652944d5e1e85311067496a14f271ad9a8d1b65180d6	-OWgGu1QDmL5b_hS8d9A	\N	2025-08-02 19:34:49	2025-09-01 23:48:14	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025081248	0	0		0	0	\N	\N	\N
65	Csv Feh	hh@hus.com	231	5155161631	1	$2y$10$4I9eAgitIhJx9ktq4D5Xz.7LaEcn5VMfq2fdJaqOIN58fjAwStAym	2025-08-18 07:41:44	2	Csv	Feh	\N			ios	6d92563111f807e9dccd79d572ca4ac63d95d178000ee04a4cd715f06057c633	-OXw77VSVyU28-hlNHm_	\N	2025-08-18 07:41:44	2025-08-18 15:01:35	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025081865	0	0		0	0	\N	\N	\N
66	Flicks Tim	hibaejaz97+5@gmail.com	231	999999999	1	\N	\N	2	Flicks	Tim	68a3291b7ea5b_1755523355.jpg	\N	\N	\N	\N	\N	\N	2025-08-18 13:16:29	2025-08-21 19:59:46	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
74	Gegge Gey	hh@hhj.com	231	537738883	0	\N	\N	2	Gegge	Gey	68a59778decd4_1755682680.jpeg	\N	\N	\N	\N	\N	\N	2025-08-20 09:28:17	2025-08-20 09:38:01	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
76	Test Test	teessss@gmail.con	231	2222222222	0	\N	\N	2	Test	Test	\N	\N	\N	\N	\N	\N	\N	2025-08-20 09:47:50	2025-08-20 09:47:50	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
75	habeeb test	test@gmail.com	231	2222222	1	\N	\N	2	habeeb	test	\N	\N	\N	\N	\N	\N	\N	2025-08-20 09:31:27	2025-08-20 11:39:01	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
72	Andy fast	andy@gmaail.com	231	999999999	1	\N	\N	2	Andy	fast	\N	\N	\N	\N	\N	\N	\N	2025-08-20 06:19:52	2025-08-21 20:00:59	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
70	Usama Dxb	usamadxb@gmail.com	231	222333666	0	$2y$10$nLp7qWf1Q1g2HavZEy0wnOR3mD2q7URL86TIdFRMrz8maECoPm1/e	2025-08-19 19:31:22	2	Usama	Dxb	\N	1111	fvvCt7-yT8KtNefk8Q2aNK:APA91bGRHCNOgR2k1N0ZUt34RL7w_bthFEAMB0ibJt-1Ehn_c-QY9kjr4npTGDC2RDdhx6mrjRave7S6TybfsrXxs3dW487gdBHnFHI9KtlnqIrwS1q1kUw	android	3726bfc889cfec1155697eb9d5212cc96a248c29a60035b14b6354327ec85578	-OY2m4hi0DKYCVLi_BDo	\N	2025-08-19 19:22:24	2025-08-20 10:08:06	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N	+231	222333669	\N	2025081970	0	0		0	0	\N	\N	\N
77	anil navus	jf@jygfj.cpom	231	878696986999	0	\N	\N	2	anil	navus	\N	\N	\N	\N	\N	\N	\N	2025-08-20 11:29:27	2025-08-20 11:29:27	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
78	Kgfsdgbhg Hfdvjyff	jgghjtf@gmail.com	231	222222222	1	\N	\N	2	Kgfsdgbhg	Hfdvjyff	\N	\N	\N	\N	\N	\N	\N	2025-08-20 17:28:37	2025-08-20 17:35:06	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
89	Dev Test	hunain@gmail.com	231	369369369	1	$2y$10$0AEeyxSanut1YyZyX5JM2uYKEo1Mc/acYCpEymuyfV1qQUzAzqW1S	2025-08-29 20:59:21	2	Dev	Test	\N	\N	c2AwIZ8jQCiU4ScLXz-LIE:APA91bHPhpL6MQFNB_yTrFxjsPY9rhvRYBBmUG05jpShXGK7g2oJ5QFjyAQolhOQ8DfmheFSyEJdETwfofz5BM968L2v3JGPlpc4UZdxAGcimT-RcV7vwX8	android	f69cc611ac5f41d0f8fa94136171434e4094fe9ec0fc9d0e67dc97bfe590853b	-OYq798BtzrL34HYYpHO	\N	2025-08-29 13:59:50	2025-08-29 20:59:21	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025082989	0	0		0	0	\N	\N	\N
34	Gha Yysu	yy@hh.com	231	564005096	1	$2y$10$SKzsExKzswzoo4jkh1q5d.WZUUFcg6XwrFIy7vkzekL0EhX9EolGm	2025-08-20 23:57:44	2	Gha	Yysu	68a6ed27aa8c5_1755770151.jpg	\N	cC2qoQHr608QoOmWbRkS4G:APA91bHKWN7xqRvCm1QyLhc_wUtEqczlJD6L2L5MXbdOntbA1GqSLo3Jw4jomMm7Cvi9ARDzx_eTo627bOazsvBcYqE8wYpzQgHQwuv_Piu1XWdOQrtLB6U	ios	c42c2a8dd2e76a4e1fe69cc4b6005cb8536a284e972c7f95e38ab1b4066b2252	-OWYsp90WztR0_oPb5KU	\N	2025-08-01 04:28:18	2025-08-21 17:20:49	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025080134	0	0		0	0	\N	\N	\N
79	Gjgdghii Hfswthb	gddd@gmail.com	971	3214569874	1	$2y$10$CzNn7vxfxe3FKxmj7L3JE.oSpF1i4Q5Vkp7Ges4i5n5iyx0sCbFJq	2025-08-20 20:38:30	2	Gjgdghii	Hfswthb	\N		\N	android	99b047496897de63a578afa1d2ee593b7315e53fe62e0fcce3d4570e8c47ee24	-OY8C5NClajWZWe8Bm-1	\N	2025-08-20 20:38:30	2025-08-20 20:38:31	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
80	Anil Davis	anilsdavis@gmail.com	231	637388383	1	\N	\N	2	Anil	Davis	\N	\N	\N	\N	\N	\N	\N	2025-08-20 21:13:46	2025-08-20 21:16:40	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
81	Usama Dxb	dxb@gmail.com	231	333444555	1	$2y$10$FfMLQgngnN9QLIJ3U5Ro/O4F15znkzZJ1o6WLe39YyGkrYexeGcOW	2025-08-20 21:18:54	2	Usama	Dxb	\N		ezAZb2N2Q0iglMNHYadc-P:APA91bEI9y9gyU41QhF84fxjH4Co3NuWcdqAu5dvqI0r-yHpBQ7T8Vvm6goUwYPfNWnroEdaVwFDF70I1smNO15nORgPK2VuDSCqz-hj3aPYIaAnwZHq0VM	ios	54765e6935b2e2c5834ecb88cd1bb35729526937b7e7b113c52f9b7112ec83d2	-OY8LL-i5IHSJzr3Id1m	\N	2025-08-20 21:18:54	2025-08-20 21:18:54	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025082081	0	0		0	0	\N	\N	\N
84	Usama Usama	usama@kmail.com__deleted_account84	+231	333444998__deleted_account84	1	$2y$10$hH5veoIINDecI7/M3i9qN.3vJ63hmHKgnefd5UpUflWWXKhyraWH.	2025-08-20 22:09:24	2	Usama	Usama	\N	\N		ios		-OY8WtuLBD5S_NfGQ1rC	\N	2025-08-20 22:09:24	2025-08-20 22:10:33	0	0	0	0	1	1	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N	+231	333444998	\N	2025082084	0	0		0	0	\N	\N	\N
83	Usama Shakeel	io@gmail.com	231	222777000	1	$2y$10$XR3KM6YnWsdzKbChTz33oOTDGr5xJv4Ovyp0C5nVBfF2E6Ota7QsC	2025-09-04 21:20:54	2	Usama	Shakeel	\N	\N	1111	ios	5f7edbd35ae783b1ad92e3bcb91fb715e90fcb9aa6b726ca0273f08d663c9b22	-OY8SiXCFeFnf8mwYyzI	\N	2025-08-20 21:51:09	2025-09-04 21:20:54	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025082083	0	0		0	0	\N	\N	\N
85	Ggg Vgh	d@hh.xom	231	5337738838	0	\N	\N	2	Ggg	Vgh	\N	\N	\N	\N	\N	\N	\N	2025-08-20 22:22:03	2025-08-20 22:22:03	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
90	Anil Navus	gg@gg.com	231	5664668666	1	$2y$10$mb0Xqdh.Wt.ssgBelt2XjeyWL5Pff48fVGYoeovgHGr6kDpApY2p6	2025-08-30 06:58:14	2	Anil	Navus	\N		exTJRjOuSh-VwsUSwoQZr8:APA91bGxmiRvsKoW-B2xlQWpjkoUsdF81lPDMleptOHBpaIPSiJQreRcDV_sr5Ipi86vpp_5zjS3ZyUgpQsS9WDSSklJsh84-2k34lhSgL6ECzeHjO30apc	android	fe82be4534fb211f40e069ff0182c7836e5907c4700702cb905307f29a444570	-OYtlF4uJWo_Q9Ua7lGo	\N	2025-08-30 06:58:14	2025-08-30 06:58:14	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025083090	0	0		0	0	\N	\N	\N
88	Rabi Khan	rabi@gmail.com	231	5555555555	1	$2y$10$JKpbWVQUp1TJ6VKh.Cdkeev5cm3VRBM1fNJ8Ux5Gjy91VF3uiJB4q	2025-08-22 08:48:02	2	Rabi	Khan	\N	\N	eSz2wOYkT-SbTogkwiTCCA:APA91bG3Ed9J4qyvyuRitWBNY14ZVKz_RuTXUkeU1gRkH8Cof-8iScnmSYM5PO4zaYl290D8NEDe3fPj5y70V0I9_14y6IDpLeq8tx2hsM2PliBmpgbY9L8	android	d60a9d997a2f8ccd1947843677c37f7826074dc2f0bbfee59561483aecc3e4c0	-OYFxebxjE3SZc6A7-F2	\N	2025-08-22 08:48:02	2025-09-11 07:17:30	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N	+231	5555555888	\N	2025082288	0	0		0	0	\N	\N	\N
91	Hhs Shhe	bh@hsh.com	231	5454664616	1	$2y$10$b8RaJROJ0S79myevP7LTLuQvYR5XOgWuGnV7eEx6mWptM21m36i2O	2025-08-30 09:27:28	2	Hhs	Shhe	\N		d6LxXM9OgkNimsMtyWFaBa:APA91bFcXXejjE6VX3qLwBO74_3GY1MlhtupNonRWUx64-UjwqAGJ-Gz3F1NDHQj6Ig7qJzRLI3srLZRAveCDWs-x1BDY8d-3259oUVsWgH53020t5xp4YU	ios	df94901a4a3568d24844f46fa1b286ab4f8e6b0ad937b63f0790fa3ba2cffdcc	-OYuIP64kxQ0iHojPuZp	\N	2025-08-30 09:27:28	2025-08-30 09:27:28	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025083091	0	0		0	0	\N	\N	\N
92	Gshss Hh	hh@hh.com	231	2425644334	1	$2y$10$vDTlF/8eYzgY3SxUO6O58.HcsqIaK6yP1BRSbnir7WPS97Ct8lkF6	2025-08-30 10:32:55	2	Gshss	Hh	\N		eVwhvNtUzE3OtWSULuTLOZ:APA91bFctuUDxMxWmLaODXvgzDjuY3ac1EK_zackWkpnhouytQmvkCLUyMTORV41MfubfUe-fJsHam8IXBdiG8fkt4QolrTAWxHosE_O5cWYNLQ49KyNWEg	ios	525a9802ad0c109a8d839f013d36e2aae219aa574b0c049e5142cbbf107c9ddc	-OYuXO1lrifGffgh-M2q	\N	2025-08-30 10:32:55	2025-08-30 10:32:56	0	0	0	0	0	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025083092	0	0		0	0	\N	\N	\N
94	kgukg lh	nh@jhf.com	231	875858758	0	\N	\N	2	kgukg	lh	\N	\N	\N	\N	\N	\N	\N	2025-09-03 07:31:28	2025-09-03 07:31:28	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
28	Usamaa Shakeell	ushakeel010@gmail.com	+971	333666996	1	$2y$10$VgAqjOt553sF9pq1kklF8ewFD8nbAUwbVrDeR13rrafPrV7su9uI2	2025-07-28 14:06:15	2	Usamaa	Shakeell	68a08b39e7ab2_1755351865.	\N	ezAZb2N2Q0iglMNHYadc-P:APA91bEI9y9gyU41QhF84fxjH4Co3NuWcdqAu5dvqI0r-yHpBQ7T8Vvm6goUwYPfNWnroEdaVwFDF70I1smNO15nORgPK2VuDSCqz-hj3aPYIaAnwZHq0VM	ios	c206456c361a9d145d471fce9f54d94d8edfacd4ce17948ca2d86e02c97b7b50	-OWGLkFbm_vAwmQAuVPj	\N	2025-07-28 14:06:15	2025-09-03 07:48:11	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	1	\N	+971	333666996	\N		0	0		0	0	\N	\N	\N
95	Gehe Yue	yu@hj.com	231	1516616163	1	$2y$10$sQjKitEINImKmYAEvcY9berteZRpyyduE9NHEc9oIJHvtiXkbipGa	2025-09-05 05:47:45	2	Gehe	Yue	\N	\N	deplcSoEh0QsgpzLNjIvvQ:APA91bHEp-36n0wuuBEwJ1dH7qlD6MAPjau4onaXWc7zy3PaYw0-dSkqItoGxul0b0YYuNaaJRwu2qYm0Bv525O5poNO_TmMmOHDPCz_fZ-es0_dB_Mi8F8	ios	47a58a6a833000fec411760fa6bf131e2d85482d0927f322b69c8894abc1f188	-OZLTJIHrJQrxPpCdUZP	\N	2025-09-04 20:44:29	2025-09-05 12:31:31	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025090495	0	0		0	0	\N	\N	\N
97	Vege Yeyye	hhj@hhj.com	231	5456163133	1	$2y$10$Bqf.UohFpGUKWtUiNVyO6eYC01TjfVVQA6xj6yrYH5KzaIbGYNUUa	2025-09-11 06:20:41	2	Vege	Yeyye	\N		daSvr94pjkI7pQg85ERh8N:APA91bHxwhz3of0rlRqp6o3n9Fbyth3qRblVMIcX3iuMxLltpTGO78Neu1rMHY67Vb-n0j7pVOKDDHhA16gOlWkP6E1EFNMWmy46UmFC9ThbW87C4DF4Jxw	ios	eaa5695776af864d5d7628cca8325728f306dfbaf0b528b382b5b469323d1a51	-OZrQj49YIxz0AuyT9O8	\N	2025-09-11 06:20:41	2025-09-11 06:20:41	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025091197	0	0		0	0	\N	\N	\N
96	s dd	j@yu.com	231	8758595989	0	\N	\N	2	s	dd	\N	\N	\N	\N	\N	\N	\N	2025-09-05 11:47:06	2025-09-05 11:47:06	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N		0	0		0	0	\N	\N	\N
87	tesxt dxvbaa	testttdxba@gmail.com	231	123456789	1	\N	2025-08-29 13:59:07	2	tesxt	dxvbaa	\N	\N	ftOtBroJRZWn1vW1nh9J2b:APA91bEWZaZXjjLoqv1hisNjKXHVm9Xdu_kWsDtq_h5wgbOLIQXPqk_ZMxFAndfaRnpQ4K2wPwhiLgaEGcUqC3ERtylDYDOv_ieWOGFCHXGbGXLhZNoqczA	\N	f39ed93ff576cb51234574304d448b10d0acd70f7399ecc4c9c664f86968de7a	-OYFxVx4c2ZtsD3bvERP	\N	2025-08-22 07:06:57	2025-09-05 11:51:32	0	0	0	0	0	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025082287	0	0		0	0	\N	\N	\N
82	hamzaJahangir hashmi	dxb@ymail.com	+971	501234567	1	$2y$10$DtmiBQQcqVOHSMkPZqI29esZT.faTLnpzIWmkfkBqq3Pm8Lxkwuqm	2025-09-16 11:17:59	2	hamzaJahangir	hashmi	\N	1111		ios	fcdb18fed0d948ed1dbe08b08c878ad5e5a04b5d012dbd4b879e0ec1bac890db	-OY8OqykUvUm4YL7ri2y	\N	2025-08-20 21:34:15	2025-09-16 11:32:20	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025082082	0	0		0	0	\N	\N	\N
98	hamza hashmi	hamzahashmi640@gmail.com	92	3406372828	1	$2y$10$vgMT8me58PeWXFZla7aazOH2JeH0g5.dvM18vCkoUCYENaiWYh1Zy	2025-09-16 11:16:40	2	hamza	hashmi	\N		1111	smap	158ecfe813190115a205c9cbfca73d657cad008642cb16d37bfa350414cf28bf	\N	\N	2025-09-16 11:15:27	2025-09-16 11:16:40	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	0	\N	\N	0	\N			\N	2025091698	0	0		0	0	\N	\N	\N
\.


--
-- TOC entry 5224 (class 0 OID 26081)
-- Dependencies: 491
-- Data for Name: users_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_role (id, role_name, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5226 (class 0 OID 26086)
-- Dependencies: 493
-- Data for Name: vendor_cuisines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_cuisines (id, vendor_id, cuisine_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5228 (class 0 OID 26093)
-- Dependencies: 495
-- Data for Name: vendor_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_details (id, homedelivery, logo, key_control, branches, company_name, company_brand, legal_staus, reg_date, trade_license, trade_license_expiry, vat_reg_number, vat_reg_expiry, address1, address2, street, zip, trade_license_doc, chamber_of_commerce_doc, share_certificate_doc, power_attorny_doc, vat_reg_doc, signed_agreement_doc, identy1_type, identy1_doc, identy2_type, identy2_doc, company_identy1_type, company_identy1_doc, company_identy2_type, company_identy2_doc, created_at, updated_at, industry_type, user_id, store_type, txt_location, location, latitude, longitude, area, pharmacycommission, servicecommission, featured_flag, open_time, close_time, description, cover_image, country, city, street1, street2, state, postal_code, phone_number) FROM stdin;
\.


--
-- TOC entry 5230 (class 0 OID 26119)
-- Dependencies: 497
-- Data for Name: vendor_followers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_followers (id, vendor_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5232 (class 0 OID 26126)
-- Dependencies: 499
-- Data for Name: vendor_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_locations (id, user_id, location, latitude, longitude, created_at, updated_at, is_default) FROM stdin;
\.


--
-- TOC entry 5234 (class 0 OID 26135)
-- Dependencies: 501
-- Data for Name: vendor_menu_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_menu_images (id, vendor_id, image, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5236 (class 0 OID 26142)
-- Dependencies: 503
-- Data for Name: vendor_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_messages (id, name, email, phone, subject, message, vendor_id, created_at, updated_at, user_id) FROM stdin;
\.


--
-- TOC entry 5238 (class 0 OID 26150)
-- Dependencies: 505
-- Data for Name: vendor_service_timings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_service_timings (id, service_id, vendor, sunday, sun_from, sun_to, monday, mon_from, mon_to, tuesday, tues_from, tues_to, wednesday, wed_from, wed_to, thursday, thurs_from, thurs_to, friday, fri_from, fri_to, saturday, sat_from, sat_to, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5240 (class 0 OID 26167)
-- Dependencies: 507
-- Data for Name: vendor_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_services (id, vendor_id, service_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5242 (class 0 OID 26172)
-- Dependencies: 509
-- Data for Name: vendor_timings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_timings (id, vendor_id, has_24_hour, service_id, day, time_from, time_to, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5244 (class 0 OID 26181)
-- Dependencies: 511
-- Data for Name: vendor_videos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_videos (id, user_id, vendor_id, title, "desc", url, likes, messages, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5246 (class 0 OID 26189)
-- Dependencies: 513
-- Data for Name: wallet_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_histories (id, user_id, wallet_amount, pay_type, description, created_at, updated_at, pay_method) FROM stdin;
\.


--
-- TOC entry 5248 (class 0 OID 26199)
-- Dependencies: 515
-- Data for Name: wallet_payment_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_payment_report (id, transaction_id, payment_status, user_id, ref_id, amount, method_type, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5250 (class 0 OID 26209)
-- Dependencies: 517
-- Data for Name: web_banners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.web_banners (id, name, description, banner_image, button_link, active, deleted, created_at, updated_at, applies_to, category_id, product_id) FROM stdin;
\.


--
-- TOC entry 5252 (class 0 OID 26220)
-- Dependencies: 519
-- Data for Name: website_banners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.website_banners (id, name, description, banner_image, button_text, active, deleted, applies_to, category_id, product_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5254 (class 0 OID 26232)
-- Dependencies: 521
-- Data for Name: website_home_management; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.website_home_management (id, name, type, category_id, product_ids, banner_ids, category_section_ids, slider_ids, sort_order, active, created_at, updated_at, cbsc_category_ids, cbsc_banner_id, cbsc_shipping_banner_ids, html_content, heading) FROM stdin;
\.


--
-- TOC entry 5256 (class 0 OID 26243)
-- Dependencies: 523
-- Data for Name: website_sliders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.website_sliders (id, banner_title, banner_type, logo, banner_image, description, created_at, updated_at, category, product, active, type, url, button_text) FROM stdin;
\.


--
-- TOC entry 5258 (class 0 OID 26254)
-- Dependencies: 525
-- Data for Name: websockets_statistics_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.websockets_statistics_entries (id, app_id, peak_connection_count, websocket_message_count, api_message_count, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5260 (class 0 OID 26259)
-- Dependencies: 527
-- Data for Name: wishlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wishlists (id, user_id, product_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5435 (class 0 OID 0)
-- Dependencies: 203
-- Name: aboutus_page_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aboutus_page_settings_id_seq', 1, false);


--
-- TOC entry 5436 (class 0 OID 0)
-- Dependencies: 205
-- Name: account_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_type_id_seq', 1, false);


--
-- TOC entry 5437 (class 0 OID 0)
-- Dependencies: 207
-- Name: activity_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_logs_id_seq', 1, false);


--
-- TOC entry 5438 (class 0 OID 0)
-- Dependencies: 209
-- Name: activity_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_type_id_seq', 1, false);


--
-- TOC entry 5439 (class 0 OID 0)
-- Dependencies: 211
-- Name: admin_designation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_designation_id_seq', 1, false);


--
-- TOC entry 5440 (class 0 OID 0)
-- Dependencies: 213
-- Name: amount_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.amount_type_id_seq', 1, false);


--
-- TOC entry 5441 (class 0 OID 0)
-- Dependencies: 215
-- Name: app_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_banners_id_seq', 1, false);


--
-- TOC entry 5442 (class 0 OID 0)
-- Dependencies: 217
-- Name: app_home_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_home_sections_id_seq', 1, false);


--
-- TOC entry 5443 (class 0 OID 0)
-- Dependencies: 219
-- Name: area_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.area_id_seq', 1, false);


--
-- TOC entry 5444 (class 0 OID 0)
-- Dependencies: 221
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articles_id_seq', 1, false);


--
-- TOC entry 5445 (class 0 OID 0)
-- Dependencies: 223
-- Name: attribute_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attribute_type_id_seq', 1, false);


--
-- TOC entry 5446 (class 0 OID 0)
-- Dependencies: 225
-- Name: attribute_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attribute_values_id_seq', 1, false);


--
-- TOC entry 5447 (class 0 OID 0)
-- Dependencies: 227
-- Name: attribute_values_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attribute_values_request_id_seq', 1, false);


--
-- TOC entry 5448 (class 0 OID 0)
-- Dependencies: 229
-- Name: attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attributes_id_seq', 1, true);


--
-- TOC entry 5449 (class 0 OID 0)
-- Dependencies: 232
-- Name: bank_code_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_code_types_id_seq', 1, false);


--
-- TOC entry 5450 (class 0 OID 0)
-- Dependencies: 234
-- Name: bank_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_details_id_seq', 1, false);


--
-- TOC entry 5451 (class 0 OID 0)
-- Dependencies: 235
-- Name: bank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_id_seq', 1, false);


--
-- TOC entry 5452 (class 0 OID 0)
-- Dependencies: 237
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blogs_id_seq', 1, false);


--
-- TOC entry 5453 (class 0 OID 0)
-- Dependencies: 239
-- Name: brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_id_seq', 1, false);


--
-- TOC entry 5454 (class 0 OID 0)
-- Dependencies: 241
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_id_seq', 1, false);


--
-- TOC entry 5455 (class 0 OID 0)
-- Dependencies: 243
-- Name: building_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.building_type_id_seq', 1, false);


--
-- TOC entry 5456 (class 0 OID 0)
-- Dependencies: 245
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 1, false);


--
-- TOC entry 5457 (class 0 OID 0)
-- Dependencies: 247
-- Name: cart_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_service_id_seq', 1, false);


--
-- TOC entry 5458 (class 0 OID 0)
-- Dependencies: 249
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 1, false);


--
-- TOC entry 5459 (class 0 OID 0)
-- Dependencies: 251
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 1, false);


--
-- TOC entry 5460 (class 0 OID 0)
-- Dependencies: 253
-- Name: cleaning_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cleaning_services_id_seq', 1, false);


--
-- TOC entry 5461 (class 0 OID 0)
-- Dependencies: 255
-- Name: comment_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_likes_id_seq', 1, false);


--
-- TOC entry 5462 (class 0 OID 0)
-- Dependencies: 257
-- Name: comment_taged_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_taged_users_id_seq', 1, false);


--
-- TOC entry 5463 (class 0 OID 0)
-- Dependencies: 259
-- Name: contact_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_us_id_seq', 1, false);


--
-- TOC entry 5464 (class 0 OID 0)
-- Dependencies: 261
-- Name: contact_us_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_us_settings_id_seq', 1, false);


--
-- TOC entry 5465 (class 0 OID 0)
-- Dependencies: 263
-- Name: contracting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contracting_id_seq', 1, false);


--
-- TOC entry 5466 (class 0 OID 0)
-- Dependencies: 265
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_seq', 1, false);


--
-- TOC entry 5467 (class 0 OID 0)
-- Dependencies: 268
-- Name: coupon_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_brand_id_seq', 1, false);


--
-- TOC entry 5468 (class 0 OID 0)
-- Dependencies: 270
-- Name: coupon_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_category_id_seq', 1, false);


--
-- TOC entry 5469 (class 0 OID 0)
-- Dependencies: 271
-- Name: coupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_id_seq', 1, false);


--
-- TOC entry 5470 (class 0 OID 0)
-- Dependencies: 273
-- Name: coupon_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_images_id_seq', 1, false);


--
-- TOC entry 5471 (class 0 OID 0)
-- Dependencies: 275
-- Name: coupon_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_products_id_seq', 1, false);


--
-- TOC entry 5472 (class 0 OID 0)
-- Dependencies: 277
-- Name: coupon_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_services_id_seq', 1, true);


--
-- TOC entry 5473 (class 0 OID 0)
-- Dependencies: 279
-- Name: coupon_vendor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_vendor_id_seq', 1, false);


--
-- TOC entry 5474 (class 0 OID 0)
-- Dependencies: 281
-- Name: coupon_vendor_service_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_vendor_service_order_id_seq', 1, false);


--
-- TOC entry 5475 (class 0 OID 0)
-- Dependencies: 284
-- Name: coupons_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupons_category_id_seq', 1, false);


--
-- TOC entry 5476 (class 0 OID 0)
-- Dependencies: 285
-- Name: coupons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupons_id_seq', 1, false);


--
-- TOC entry 5477 (class 0 OID 0)
-- Dependencies: 287
-- Name: cuisines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuisines_id_seq', 1, false);


--
-- TOC entry 5478 (class 0 OID 0)
-- Dependencies: 289
-- Name: currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.currencies_id_seq', 1, false);


--
-- TOC entry 5479 (class 0 OID 0)
-- Dependencies: 291
-- Name: custom_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.custom_banners_id_seq', 1, false);


--
-- TOC entry 5480 (class 0 OID 0)
-- Dependencies: 293
-- Name: designations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.designations_id_seq', 1, false);


--
-- TOC entry 5481 (class 0 OID 0)
-- Dependencies: 295
-- Name: event_features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_features_id_seq', 1, false);


--
-- TOC entry 5482 (class 0 OID 0)
-- Dependencies: 297
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 5483 (class 0 OID 0)
-- Dependencies: 299
-- Name: faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faq_id_seq', 1, false);


--
-- TOC entry 5484 (class 0 OID 0)
-- Dependencies: 301
-- Name: featured_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.featured_products_id_seq', 1, false);


--
-- TOC entry 5485 (class 0 OID 0)
-- Dependencies: 303
-- Name: featured_products_img_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.featured_products_img_id_seq', 1, false);


--
-- TOC entry 5486 (class 0 OID 0)
-- Dependencies: 305
-- Name: hair_colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hair_colors_id_seq', 1, false);


--
-- TOC entry 5487 (class 0 OID 0)
-- Dependencies: 307
-- Name: help_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.help_id_seq', 1, false);


--
-- TOC entry 5488 (class 0 OID 0)
-- Dependencies: 309
-- Name: help_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.help_topics_id_seq', 1, false);


--
-- TOC entry 5489 (class 0 OID 0)
-- Dependencies: 311
-- Name: home_logos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_logos_id_seq', 1, false);


--
-- TOC entry 5490 (class 0 OID 0)
-- Dependencies: 313
-- Name: home_management_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_management_id_seq', 1, false);


--
-- TOC entry 5491 (class 0 OID 0)
-- Dependencies: 315
-- Name: hourly_rate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hourly_rate_id_seq', 1, false);


--
-- TOC entry 5492 (class 0 OID 0)
-- Dependencies: 317
-- Name: industry_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.industry_types_id_seq', 1, false);


--
-- TOC entry 5493 (class 0 OID 0)
-- Dependencies: 319
-- Name: landing_page_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.landing_page_settings_id_seq', 1, false);


--
-- TOC entry 5494 (class 0 OID 0)
-- Dependencies: 321
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.likes_id_seq', 1, false);


--
-- TOC entry 5495 (class 0 OID 0)
-- Dependencies: 323
-- Name: main_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_category_id_seq', 1, false);


--
-- TOC entry 5496 (class 0 OID 0)
-- Dependencies: 325
-- Name: maintainance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maintainance_id_seq', 1, false);


--
-- TOC entry 5497 (class 0 OID 0)
-- Dependencies: 327
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 405, true);


--
-- TOC entry 5498 (class 0 OID 0)
-- Dependencies: 329
-- Name: moda_main_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moda_main_categories_id_seq', 1, false);


--
-- TOC entry 5499 (class 0 OID 0)
-- Dependencies: 331
-- Name: moda_sub_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moda_sub_categories_id_seq', 1, false);


--
-- TOC entry 5500 (class 0 OID 0)
-- Dependencies: 333
-- Name: my_moda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.my_moda_id_seq', 1, false);


--
-- TOC entry 5501 (class 0 OID 0)
-- Dependencies: 335
-- Name: my_moda_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.my_moda_items_id_seq', 1, false);


--
-- TOC entry 5502 (class 0 OID 0)
-- Dependencies: 337
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 1, false);


--
-- TOC entry 5503 (class 0 OID 0)
-- Dependencies: 339
-- Name: order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_products_id_seq', 1, false);


--
-- TOC entry 5504 (class 0 OID 0)
-- Dependencies: 341
-- Name: order_request_view_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_request_view_id_seq', 1, false);


--
-- TOC entry 5505 (class 0 OID 0)
-- Dependencies: 343
-- Name: order_status_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_status_history_id_seq', 1, false);


--
-- TOC entry 5506 (class 0 OID 0)
-- Dependencies: 345
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 1, false);


--
-- TOC entry 5507 (class 0 OID 0)
-- Dependencies: 348
-- Name: orders_services_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_services_items_id_seq', 1, false);


--
-- TOC entry 5508 (class 0 OID 0)
-- Dependencies: 350
-- Name: orders_services_mute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_services_mute_id_seq', 1, false);


--
-- TOC entry 5509 (class 0 OID 0)
-- Dependencies: 351
-- Name: orders_services_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_services_order_id_seq', 1, false);


--
-- TOC entry 5510 (class 0 OID 0)
-- Dependencies: 353
-- Name: orders_services_rejected_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_services_rejected_id_seq', 1, false);


--
-- TOC entry 5511 (class 0 OID 0)
-- Dependencies: 356
-- Name: payment_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_report_id_seq', 1, false);


--
-- TOC entry 5512 (class 0 OID 0)
-- Dependencies: 358
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 193, true);


--
-- TOC entry 5513 (class 0 OID 0)
-- Dependencies: 360
-- Name: post_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_comments_id_seq', 1, false);


--
-- TOC entry 5514 (class 0 OID 0)
-- Dependencies: 362
-- Name: post_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_likes_id_seq', 1, false);


--
-- TOC entry 5515 (class 0 OID 0)
-- Dependencies: 364
-- Name: post_saves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_saves_id_seq', 1, false);


--
-- TOC entry 5516 (class 0 OID 0)
-- Dependencies: 366
-- Name: post_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_users_id_seq', 1, false);


--
-- TOC entry 5517 (class 0 OID 0)
-- Dependencies: 368
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- TOC entry 5518 (class 0 OID 0)
-- Dependencies: 371
-- Name: product_attribute_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_attribute_attribute_id_seq', 1, false);


--
-- TOC entry 5519 (class 0 OID 0)
-- Dependencies: 373
-- Name: product_attribute_values_attribute_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_attribute_values_attribute_values_id_seq', 1, false);


--
-- TOC entry 5520 (class 0 OID 0)
-- Dependencies: 375
-- Name: product_category_product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_category_product_category_id_seq', 1, false);


--
-- TOC entry 5521 (class 0 OID 0)
-- Dependencies: 377
-- Name: product_cuisines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cuisines_id_seq', 1, false);


--
-- TOC entry 5522 (class 0 OID 0)
-- Dependencies: 379
-- Name: product_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_details_id_seq', 1, false);


--
-- TOC entry 5523 (class 0 OID 0)
-- Dependencies: 381
-- Name: product_docs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_docs_id_seq', 1, false);


--
-- TOC entry 5524 (class 0 OID 0)
-- Dependencies: 383
-- Name: product_features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_features_id_seq', 1, false);


--
-- TOC entry 5525 (class 0 OID 0)
-- Dependencies: 384
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 1, false);


--
-- TOC entry 5526 (class 0 OID 0)
-- Dependencies: 386
-- Name: product_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_images_id_seq', 1, false);


--
-- TOC entry 5527 (class 0 OID 0)
-- Dependencies: 388
-- Name: product_items_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_items_item_id_seq', 1, false);


--
-- TOC entry 5528 (class 0 OID 0)
-- Dependencies: 390
-- Name: product_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_likes_id_seq', 1, false);


--
-- TOC entry 5529 (class 0 OID 0)
-- Dependencies: 392
-- Name: product_master_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_master_id_seq', 1, false);


--
-- TOC entry 5530 (class 0 OID 0)
-- Dependencies: 394
-- Name: product_master_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_master_request_id_seq', 1, false);


--
-- TOC entry 5531 (class 0 OID 0)
-- Dependencies: 396
-- Name: product_product_feature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_product_feature_id_seq', 1, false);


--
-- TOC entry 5532 (class 0 OID 0)
-- Dependencies: 398
-- Name: product_selected_attribute_list_product_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_selected_attribute_list_product_attribute_id_seq', 1, false);


--
-- TOC entry 5533 (class 0 OID 0)
-- Dependencies: 400
-- Name: product_selected_attributes_product_selected_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_selected_attributes_product_selected_attributes_id_seq', 1, false);


--
-- TOC entry 5534 (class 0 OID 0)
-- Dependencies: 402
-- Name: product_specifications_prod_spec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_specifications_prod_spec_id_seq', 1, false);


--
-- TOC entry 5535 (class 0 OID 0)
-- Dependencies: 404
-- Name: product_temp_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_temp_image_id_seq', 1, false);


--
-- TOC entry 5536 (class 0 OID 0)
-- Dependencies: 406
-- Name: product_variations_product_variations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_variations_product_variations_id_seq', 1, false);


--
-- TOC entry 5537 (class 0 OID 0)
-- Dependencies: 408
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- TOC entry 5538 (class 0 OID 0)
-- Dependencies: 410
-- Name: promotion_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promotion_banners_id_seq', 1, false);


--
-- TOC entry 5539 (class 0 OID 0)
-- Dependencies: 412
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ratings_id_seq', 1, false);


--
-- TOC entry 5540 (class 0 OID 0)
-- Dependencies: 414
-- Name: ratings_reply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ratings_reply_id_seq', 1, false);


--
-- TOC entry 5541 (class 0 OID 0)
-- Dependencies: 416
-- Name: recently_viewed_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recently_viewed_products_id_seq', 1, false);


--
-- TOC entry 5542 (class 0 OID 0)
-- Dependencies: 418
-- Name: ref_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_history_id_seq', 1, false);


--
-- TOC entry 5543 (class 0 OID 0)
-- Dependencies: 420
-- Name: report_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_reasons_id_seq', 1, false);


--
-- TOC entry 5544 (class 0 OID 0)
-- Dependencies: 422
-- Name: reported_shops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reported_shops_id_seq', 1, false);


--
-- TOC entry 5545 (class 0 OID 0)
-- Dependencies: 425
-- Name: service_assigned_vendors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_assigned_vendors_id_seq', 1, false);


--
-- TOC entry 5546 (class 0 OID 0)
-- Dependencies: 427
-- Name: service_bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_bookings_id_seq', 1, false);


--
-- TOC entry 5547 (class 0 OID 0)
-- Dependencies: 429
-- Name: service_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_category_id_seq', 1, false);


--
-- TOC entry 5548 (class 0 OID 0)
-- Dependencies: 431
-- Name: service_category_selected_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_category_selected_id_seq', 1, false);


--
-- TOC entry 5549 (class 0 OID 0)
-- Dependencies: 433
-- Name: service_event_feature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_event_feature_id_seq', 1, false);


--
-- TOC entry 5550 (class 0 OID 0)
-- Dependencies: 434
-- Name: service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_id_seq', 1, false);


--
-- TOC entry 5551 (class 0 OID 0)
-- Dependencies: 436
-- Name: service_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_images_id_seq', 1, false);


--
-- TOC entry 5552 (class 0 OID 0)
-- Dependencies: 438
-- Name: service_include_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_include_id_seq', 1, false);


--
-- TOC entry 5553 (class 0 OID 0)
-- Dependencies: 440
-- Name: service_order_status_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_order_status_history_id_seq', 1, false);


--
-- TOC entry 5554 (class 0 OID 0)
-- Dependencies: 442
-- Name: service_timings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_timings_id_seq', 1, false);


--
-- TOC entry 5555 (class 0 OID 0)
-- Dependencies: 444
-- Name: service_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_type_id_seq', 1, false);


--
-- TOC entry 5556 (class 0 OID 0)
-- Dependencies: 446
-- Name: service_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_types_id_seq', 1, false);


--
-- TOC entry 5557 (class 0 OID 0)
-- Dependencies: 448
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, false);


--
-- TOC entry 5558 (class 0 OID 0)
-- Dependencies: 450
-- Name: skin_colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skin_colors_id_seq', 1, false);


--
-- TOC entry 5559 (class 0 OID 0)
-- Dependencies: 452
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.states_id_seq', 1, false);


--
-- TOC entry 5560 (class 0 OID 0)
-- Dependencies: 454
-- Name: store_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_images_id_seq', 1, false);


--
-- TOC entry 5561 (class 0 OID 0)
-- Dependencies: 456
-- Name: store_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_likes_id_seq', 1, false);


--
-- TOC entry 5562 (class 0 OID 0)
-- Dependencies: 458
-- Name: store_managers_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_managers_types_id_seq', 1, false);


--
-- TOC entry 5563 (class 0 OID 0)
-- Dependencies: 460
-- Name: store_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_type_id_seq', 1, false);


--
-- TOC entry 5564 (class 0 OID 0)
-- Dependencies: 462
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stores_id_seq', 1, false);


--
-- TOC entry 5565 (class 0 OID 0)
-- Dependencies: 464
-- Name: subscribers_emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscribers_emails_id_seq', 1, false);


--
-- TOC entry 5566 (class 0 OID 0)
-- Dependencies: 466
-- Name: temp_order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_order_products_id_seq', 1, false);


--
-- TOC entry 5567 (class 0 OID 0)
-- Dependencies: 468
-- Name: temp_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_orders_id_seq', 1, false);


--
-- TOC entry 5568 (class 0 OID 0)
-- Dependencies: 470
-- Name: temp_service_order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_service_order_items_id_seq', 1, false);


--
-- TOC entry 5569 (class 0 OID 0)
-- Dependencies: 472
-- Name: temp_service_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_service_orders_id_seq', 1, false);


--
-- TOC entry 5570 (class 0 OID 0)
-- Dependencies: 474
-- Name: temp_user_account_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_user_account_types_id_seq', 1, false);


--
-- TOC entry 5571 (class 0 OID 0)
-- Dependencies: 476
-- Name: temp_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_users_id_seq', 1, false);


--
-- TOC entry 5572 (class 0 OID 0)
-- Dependencies: 478
-- Name: tesimonial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tesimonial_id_seq', 1, false);


--
-- TOC entry 5573 (class 0 OID 0)
-- Dependencies: 480
-- Name: transport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transport_id_seq', 1, false);


--
-- TOC entry 5574 (class 0 OID 0)
-- Dependencies: 482
-- Name: user_account_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_account_types_id_seq', 1, false);


--
-- TOC entry 5575 (class 0 OID 0)
-- Dependencies: 484
-- Name: user_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_address_id_seq', 1, false);


--
-- TOC entry 5576 (class 0 OID 0)
-- Dependencies: 486
-- Name: user_follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_follows_id_seq', 1, false);


--
-- TOC entry 5577 (class 0 OID 0)
-- Dependencies: 488
-- Name: user_privileges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_privileges_id_seq', 1, false);


--
-- TOC entry 5578 (class 0 OID 0)
-- Dependencies: 490
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 98, true);


--
-- TOC entry 5579 (class 0 OID 0)
-- Dependencies: 492
-- Name: users_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_role_id_seq', 1, false);


--
-- TOC entry 5580 (class 0 OID 0)
-- Dependencies: 494
-- Name: vendor_cuisines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_cuisines_id_seq', 1, false);


--
-- TOC entry 5581 (class 0 OID 0)
-- Dependencies: 496
-- Name: vendor_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_details_id_seq', 1, false);


--
-- TOC entry 5582 (class 0 OID 0)
-- Dependencies: 498
-- Name: vendor_followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_followers_id_seq', 1, false);


--
-- TOC entry 5583 (class 0 OID 0)
-- Dependencies: 500
-- Name: vendor_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_locations_id_seq', 1, false);


--
-- TOC entry 5584 (class 0 OID 0)
-- Dependencies: 502
-- Name: vendor_menu_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_menu_images_id_seq', 1, false);


--
-- TOC entry 5585 (class 0 OID 0)
-- Dependencies: 504
-- Name: vendor_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_messages_id_seq', 1, false);


--
-- TOC entry 5586 (class 0 OID 0)
-- Dependencies: 506
-- Name: vendor_service_timings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_service_timings_id_seq', 1, false);


--
-- TOC entry 5587 (class 0 OID 0)
-- Dependencies: 508
-- Name: vendor_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_services_id_seq', 1, false);


--
-- TOC entry 5588 (class 0 OID 0)
-- Dependencies: 510
-- Name: vendor_timings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_timings_id_seq', 1, false);


--
-- TOC entry 5589 (class 0 OID 0)
-- Dependencies: 512
-- Name: vendor_videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_videos_id_seq', 1, false);


--
-- TOC entry 5590 (class 0 OID 0)
-- Dependencies: 514
-- Name: wallet_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_histories_id_seq', 1, false);


--
-- TOC entry 5591 (class 0 OID 0)
-- Dependencies: 516
-- Name: wallet_payment_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_payment_report_id_seq', 1, false);


--
-- TOC entry 5592 (class 0 OID 0)
-- Dependencies: 518
-- Name: web_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.web_banners_id_seq', 1, false);


--
-- TOC entry 5593 (class 0 OID 0)
-- Dependencies: 520
-- Name: website_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.website_banners_id_seq', 1, false);


--
-- TOC entry 5594 (class 0 OID 0)
-- Dependencies: 522
-- Name: website_home_management_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.website_home_management_id_seq', 1, false);


--
-- TOC entry 5595 (class 0 OID 0)
-- Dependencies: 524
-- Name: website_sliders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.website_sliders_id_seq', 1, false);


--
-- TOC entry 5596 (class 0 OID 0)
-- Dependencies: 526
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.websockets_statistics_entries_id_seq', 1, false);


--
-- TOC entry 5597 (class 0 OID 0)
-- Dependencies: 528
-- Name: wishlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wishlists_id_seq', 1, false);


--
-- TOC entry 4434 (class 2606 OID 26431)
-- Name: aboutus_page_settings aboutus_page_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aboutus_page_settings
    ADD CONSTRAINT aboutus_page_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 4436 (class 2606 OID 26433)
-- Name: account_type account_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_type
    ADD CONSTRAINT account_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4438 (class 2606 OID 26435)
-- Name: activity_logs activity_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_logs
    ADD CONSTRAINT activity_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 4440 (class 2606 OID 26437)
-- Name: activity_type activity_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_type
    ADD CONSTRAINT activity_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4442 (class 2606 OID 26439)
-- Name: admin_designation admin_designation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_designation
    ADD CONSTRAINT admin_designation_pkey PRIMARY KEY (id);


--
-- TOC entry 4444 (class 2606 OID 26441)
-- Name: amount_type amount_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amount_type
    ADD CONSTRAINT amount_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4446 (class 2606 OID 26443)
-- Name: app_banners app_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_banners
    ADD CONSTRAINT app_banners_pkey PRIMARY KEY (id);


--
-- TOC entry 4448 (class 2606 OID 26445)
-- Name: app_home_sections app_home_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_home_sections
    ADD CONSTRAINT app_home_sections_pkey PRIMARY KEY (id);


--
-- TOC entry 4450 (class 2606 OID 26447)
-- Name: area area_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT area_pkey PRIMARY KEY (id);


--
-- TOC entry 4452 (class 2606 OID 26449)
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- TOC entry 4454 (class 2606 OID 26451)
-- Name: attribute_type attribute_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_type
    ADD CONSTRAINT attribute_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4456 (class 2606 OID 26453)
-- Name: attribute_values attribute_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_values
    ADD CONSTRAINT attribute_values_pkey PRIMARY KEY (id);


--
-- TOC entry 4458 (class 2606 OID 26455)
-- Name: attribute_values_request attribute_values_request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute_values_request
    ADD CONSTRAINT attribute_values_request_pkey PRIMARY KEY (id);


--
-- TOC entry 4460 (class 2606 OID 26457)
-- Name: attributes attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attributes
    ADD CONSTRAINT attributes_pkey PRIMARY KEY (id);


--
-- TOC entry 4464 (class 2606 OID 26459)
-- Name: bank_code_types bank_code_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_code_types
    ADD CONSTRAINT bank_code_types_pkey PRIMARY KEY (id);


--
-- TOC entry 4466 (class 2606 OID 26461)
-- Name: bank_details bank_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_details
    ADD CONSTRAINT bank_details_pkey PRIMARY KEY (id);


--
-- TOC entry 4462 (class 2606 OID 26463)
-- Name: bank bank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank
    ADD CONSTRAINT bank_pkey PRIMARY KEY (id);


--
-- TOC entry 4468 (class 2606 OID 26465)
-- Name: blogs blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- TOC entry 4470 (class 2606 OID 26467)
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (id);


--
-- TOC entry 4472 (class 2606 OID 26469)
-- Name: brands brands_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_name_unique UNIQUE (name);


--
-- TOC entry 4474 (class 2606 OID 26471)
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- TOC entry 4476 (class 2606 OID 26473)
-- Name: brands brands_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_slug_unique UNIQUE (slug);


--
-- TOC entry 4478 (class 2606 OID 26475)
-- Name: building_type building_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.building_type
    ADD CONSTRAINT building_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4480 (class 2606 OID 26477)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- TOC entry 4482 (class 2606 OID 26479)
-- Name: cart_service cart_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_service
    ADD CONSTRAINT cart_service_pkey PRIMARY KEY (id);


--
-- TOC entry 4484 (class 2606 OID 26481)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 4486 (class 2606 OID 26483)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 4488 (class 2606 OID 26485)
-- Name: cleaning_services cleaning_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cleaning_services
    ADD CONSTRAINT cleaning_services_pkey PRIMARY KEY (id);


--
-- TOC entry 4490 (class 2606 OID 26487)
-- Name: comment_likes comment_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT comment_likes_pkey PRIMARY KEY (id);


--
-- TOC entry 4492 (class 2606 OID 26489)
-- Name: comment_taged_users comment_taged_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_taged_users
    ADD CONSTRAINT comment_taged_users_pkey PRIMARY KEY (id);


--
-- TOC entry 4494 (class 2606 OID 26491)
-- Name: contact_us contact_us_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us
    ADD CONSTRAINT contact_us_pkey PRIMARY KEY (id);


--
-- TOC entry 4496 (class 2606 OID 26493)
-- Name: contact_us_settings contact_us_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us_settings
    ADD CONSTRAINT contact_us_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 4498 (class 2606 OID 26495)
-- Name: contracting contracting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracting
    ADD CONSTRAINT contracting_pkey PRIMARY KEY (id);


--
-- TOC entry 4500 (class 2606 OID 26497)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- TOC entry 4504 (class 2606 OID 26499)
-- Name: coupon_brand coupon_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_brand
    ADD CONSTRAINT coupon_brand_pkey PRIMARY KEY (id);


--
-- TOC entry 4506 (class 2606 OID 26501)
-- Name: coupon_category coupon_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_category
    ADD CONSTRAINT coupon_category_pkey PRIMARY KEY (id);


--
-- TOC entry 4508 (class 2606 OID 26503)
-- Name: coupon_images coupon_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_images
    ADD CONSTRAINT coupon_images_pkey PRIMARY KEY (id);


--
-- TOC entry 4502 (class 2606 OID 26505)
-- Name: coupon coupon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon
    ADD CONSTRAINT coupon_pkey PRIMARY KEY (id);


--
-- TOC entry 4510 (class 2606 OID 26507)
-- Name: coupon_products coupon_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_products
    ADD CONSTRAINT coupon_products_pkey PRIMARY KEY (id);


--
-- TOC entry 4512 (class 2606 OID 26509)
-- Name: coupon_services coupon_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_services
    ADD CONSTRAINT coupon_services_pkey PRIMARY KEY (id);


--
-- TOC entry 4514 (class 2606 OID 26511)
-- Name: coupon_vendor coupon_vendor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_vendor
    ADD CONSTRAINT coupon_vendor_pkey PRIMARY KEY (id);


--
-- TOC entry 4516 (class 2606 OID 26513)
-- Name: coupon_vendor_service_order coupon_vendor_service_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_vendor_service_order
    ADD CONSTRAINT coupon_vendor_service_order_pkey PRIMARY KEY (id);


--
-- TOC entry 4520 (class 2606 OID 26515)
-- Name: coupons_category coupons_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons_category
    ADD CONSTRAINT coupons_category_pkey PRIMARY KEY (id);


--
-- TOC entry 4518 (class 2606 OID 26517)
-- Name: coupons coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);


--
-- TOC entry 4522 (class 2606 OID 26519)
-- Name: cuisines cuisines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuisines
    ADD CONSTRAINT cuisines_pkey PRIMARY KEY (id);


--
-- TOC entry 4524 (class 2606 OID 26521)
-- Name: currencies currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (id);


--
-- TOC entry 4526 (class 2606 OID 26523)
-- Name: custom_banners custom_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_banners
    ADD CONSTRAINT custom_banners_pkey PRIMARY KEY (id);


--
-- TOC entry 4529 (class 2606 OID 26525)
-- Name: designations designations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT designations_pkey PRIMARY KEY (id);


--
-- TOC entry 4531 (class 2606 OID 26527)
-- Name: event_features event_features_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_features
    ADD CONSTRAINT event_features_pkey PRIMARY KEY (id);


--
-- TOC entry 4533 (class 2606 OID 26529)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4535 (class 2606 OID 26531)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 4537 (class 2606 OID 26533)
-- Name: faq faq_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faq
    ADD CONSTRAINT faq_pkey PRIMARY KEY (id);


--
-- TOC entry 4541 (class 2606 OID 26535)
-- Name: featured_products_img featured_products_img_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.featured_products_img
    ADD CONSTRAINT featured_products_img_pkey PRIMARY KEY (id);


--
-- TOC entry 4539 (class 2606 OID 26537)
-- Name: featured_products featured_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.featured_products
    ADD CONSTRAINT featured_products_pkey PRIMARY KEY (id);


--
-- TOC entry 4543 (class 2606 OID 26539)
-- Name: hair_colors hair_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hair_colors
    ADD CONSTRAINT hair_colors_pkey PRIMARY KEY (id);


--
-- TOC entry 4545 (class 2606 OID 26541)
-- Name: help help_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help
    ADD CONSTRAINT help_pkey PRIMARY KEY (id);


--
-- TOC entry 4547 (class 2606 OID 26543)
-- Name: help_topics help_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help_topics
    ADD CONSTRAINT help_topics_pkey PRIMARY KEY (id);


--
-- TOC entry 4549 (class 2606 OID 26545)
-- Name: home_logos home_logos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_logos
    ADD CONSTRAINT home_logos_pkey PRIMARY KEY (id);


--
-- TOC entry 4551 (class 2606 OID 26547)
-- Name: home_management home_management_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_management
    ADD CONSTRAINT home_management_pkey PRIMARY KEY (id);


--
-- TOC entry 4553 (class 2606 OID 26549)
-- Name: hourly_rate hourly_rate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hourly_rate
    ADD CONSTRAINT hourly_rate_pkey PRIMARY KEY (id);


--
-- TOC entry 4555 (class 2606 OID 26551)
-- Name: industry_types industry_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industry_types
    ADD CONSTRAINT industry_types_pkey PRIMARY KEY (id);


--
-- TOC entry 4557 (class 2606 OID 26553)
-- Name: landing_page_settings landing_page_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.landing_page_settings
    ADD CONSTRAINT landing_page_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 4559 (class 2606 OID 26555)
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- TOC entry 4561 (class 2606 OID 26557)
-- Name: main_category main_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_category
    ADD CONSTRAINT main_category_pkey PRIMARY KEY (id);


--
-- TOC entry 4563 (class 2606 OID 26559)
-- Name: maintainance maintainance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintainance
    ADD CONSTRAINT maintainance_pkey PRIMARY KEY (id);


--
-- TOC entry 4565 (class 2606 OID 26561)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4567 (class 2606 OID 26563)
-- Name: moda_main_categories moda_main_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moda_main_categories
    ADD CONSTRAINT moda_main_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4569 (class 2606 OID 26565)
-- Name: moda_sub_categories moda_sub_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moda_sub_categories
    ADD CONSTRAINT moda_sub_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4573 (class 2606 OID 26567)
-- Name: my_moda_items my_moda_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.my_moda_items
    ADD CONSTRAINT my_moda_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4571 (class 2606 OID 26569)
-- Name: my_moda my_moda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.my_moda
    ADD CONSTRAINT my_moda_pkey PRIMARY KEY (id);


--
-- TOC entry 4575 (class 2606 OID 26571)
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 4577 (class 2606 OID 26573)
-- Name: order_products order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (id);


--
-- TOC entry 4579 (class 2606 OID 26575)
-- Name: order_request_view order_request_view_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_request_view
    ADD CONSTRAINT order_request_view_pkey PRIMARY KEY (id);


--
-- TOC entry 4581 (class 2606 OID 26577)
-- Name: order_status_history order_status_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_history
    ADD CONSTRAINT order_status_history_pkey PRIMARY KEY (id);


--
-- TOC entry 4583 (class 2606 OID 26579)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 4587 (class 2606 OID 26581)
-- Name: orders_services_items orders_services_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services_items
    ADD CONSTRAINT orders_services_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4589 (class 2606 OID 26583)
-- Name: orders_services_mute orders_services_mute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services_mute
    ADD CONSTRAINT orders_services_mute_pkey PRIMARY KEY (id);


--
-- TOC entry 4585 (class 2606 OID 26585)
-- Name: orders_services orders_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services
    ADD CONSTRAINT orders_services_pkey PRIMARY KEY (order_id);


--
-- TOC entry 4591 (class 2606 OID 26587)
-- Name: orders_services_rejected orders_services_rejected_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_services_rejected
    ADD CONSTRAINT orders_services_rejected_pkey PRIMARY KEY (id);


--
-- TOC entry 4594 (class 2606 OID 26589)
-- Name: payment_report payment_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_report
    ADD CONSTRAINT payment_report_pkey PRIMARY KEY (id);


--
-- TOC entry 4596 (class 2606 OID 26591)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4598 (class 2606 OID 26593)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 4601 (class 2606 OID 26595)
-- Name: post_comments post_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT post_comments_pkey PRIMARY KEY (id);


--
-- TOC entry 4603 (class 2606 OID 26597)
-- Name: post_likes post_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_likes
    ADD CONSTRAINT post_likes_pkey PRIMARY KEY (id);


--
-- TOC entry 4605 (class 2606 OID 26599)
-- Name: post_saves post_saves_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_saves
    ADD CONSTRAINT post_saves_pkey PRIMARY KEY (id);


--
-- TOC entry 4607 (class 2606 OID 26601)
-- Name: post_users post_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_users
    ADD CONSTRAINT post_users_pkey PRIMARY KEY (id);


--
-- TOC entry 4609 (class 2606 OID 26603)
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- TOC entry 4613 (class 2606 OID 26605)
-- Name: product_attribute product_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_attribute
    ADD CONSTRAINT product_attribute_pkey PRIMARY KEY (attribute_id);


--
-- TOC entry 4615 (class 2606 OID 26607)
-- Name: product_attribute_values product_attribute_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_attribute_values
    ADD CONSTRAINT product_attribute_values_pkey PRIMARY KEY (attribute_values_id);


--
-- TOC entry 4617 (class 2606 OID 26609)
-- Name: product_category product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (product_category_id);


--
-- TOC entry 4619 (class 2606 OID 26611)
-- Name: product_cuisines product_cuisines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cuisines
    ADD CONSTRAINT product_cuisines_pkey PRIMARY KEY (id);


--
-- TOC entry 4621 (class 2606 OID 26613)
-- Name: product_details product_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_details
    ADD CONSTRAINT product_details_pkey PRIMARY KEY (id);


--
-- TOC entry 4623 (class 2606 OID 26615)
-- Name: product_docs product_docs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_docs
    ADD CONSTRAINT product_docs_pkey PRIMARY KEY (id);


--
-- TOC entry 4625 (class 2606 OID 26617)
-- Name: product_features product_features_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_features
    ADD CONSTRAINT product_features_pkey PRIMARY KEY (id);


--
-- TOC entry 4627 (class 2606 OID 26619)
-- Name: product_images product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (id);


--
-- TOC entry 4629 (class 2606 OID 26621)
-- Name: product_items product_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_items
    ADD CONSTRAINT product_items_pkey PRIMARY KEY (item_id);


--
-- TOC entry 4631 (class 2606 OID 26623)
-- Name: product_likes product_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_likes
    ADD CONSTRAINT product_likes_pkey PRIMARY KEY (id);


--
-- TOC entry 4633 (class 2606 OID 26625)
-- Name: product_master product_master_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_master
    ADD CONSTRAINT product_master_pkey PRIMARY KEY (id);


--
-- TOC entry 4635 (class 2606 OID 26627)
-- Name: product_master_request product_master_request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_master_request
    ADD CONSTRAINT product_master_request_pkey PRIMARY KEY (id);


--
-- TOC entry 4611 (class 2606 OID 26629)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 4637 (class 2606 OID 26631)
-- Name: product_product_feature product_product_feature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_product_feature
    ADD CONSTRAINT product_product_feature_pkey PRIMARY KEY (id);


--
-- TOC entry 4639 (class 2606 OID 26633)
-- Name: product_selected_attribute_list product_selected_attribute_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_selected_attribute_list
    ADD CONSTRAINT product_selected_attribute_list_pkey PRIMARY KEY (product_attribute_id);


--
-- TOC entry 4641 (class 2606 OID 26635)
-- Name: product_selected_attributes product_selected_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_selected_attributes
    ADD CONSTRAINT product_selected_attributes_pkey PRIMARY KEY (product_selected_attributes_id);


--
-- TOC entry 4643 (class 2606 OID 26637)
-- Name: product_specifications product_specifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_specifications
    ADD CONSTRAINT product_specifications_pkey PRIMARY KEY (prod_spec_id);


--
-- TOC entry 4645 (class 2606 OID 26639)
-- Name: product_temp_image product_temp_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_temp_image
    ADD CONSTRAINT product_temp_image_pkey PRIMARY KEY (id);


--
-- TOC entry 4647 (class 2606 OID 26641)
-- Name: product_variations product_variations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variations
    ADD CONSTRAINT product_variations_pkey PRIMARY KEY (product_variations_id);


--
-- TOC entry 4649 (class 2606 OID 26643)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 4651 (class 2606 OID 26645)
-- Name: promotion_banners promotion_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_banners
    ADD CONSTRAINT promotion_banners_pkey PRIMARY KEY (id);


--
-- TOC entry 4653 (class 2606 OID 26647)
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- TOC entry 4655 (class 2606 OID 26649)
-- Name: ratings_reply ratings_reply_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings_reply
    ADD CONSTRAINT ratings_reply_pkey PRIMARY KEY (id);


--
-- TOC entry 4657 (class 2606 OID 26651)
-- Name: recently_viewed_products recently_viewed_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recently_viewed_products
    ADD CONSTRAINT recently_viewed_products_pkey PRIMARY KEY (id);


--
-- TOC entry 4659 (class 2606 OID 26653)
-- Name: ref_history ref_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_history
    ADD CONSTRAINT ref_history_pkey PRIMARY KEY (id);


--
-- TOC entry 4661 (class 2606 OID 26655)
-- Name: report_reasons report_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_reasons
    ADD CONSTRAINT report_reasons_pkey PRIMARY KEY (id);


--
-- TOC entry 4663 (class 2606 OID 26657)
-- Name: reported_shops reported_shops_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reported_shops
    ADD CONSTRAINT reported_shops_pkey PRIMARY KEY (id);


--
-- TOC entry 4667 (class 2606 OID 26659)
-- Name: service_assigned_vendors service_assigned_vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_assigned_vendors
    ADD CONSTRAINT service_assigned_vendors_pkey PRIMARY KEY (id);


--
-- TOC entry 4669 (class 2606 OID 26661)
-- Name: service_bookings service_bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_bookings
    ADD CONSTRAINT service_bookings_pkey PRIMARY KEY (id);


--
-- TOC entry 4671 (class 2606 OID 26663)
-- Name: service_category service_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_category
    ADD CONSTRAINT service_category_pkey PRIMARY KEY (id);


--
-- TOC entry 4673 (class 2606 OID 26665)
-- Name: service_category_selected service_category_selected_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_category_selected
    ADD CONSTRAINT service_category_selected_pkey PRIMARY KEY (id);


--
-- TOC entry 4675 (class 2606 OID 26667)
-- Name: service_event_feature service_event_feature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_event_feature
    ADD CONSTRAINT service_event_feature_pkey PRIMARY KEY (id);


--
-- TOC entry 4677 (class 2606 OID 26669)
-- Name: service_images service_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_images
    ADD CONSTRAINT service_images_pkey PRIMARY KEY (id);


--
-- TOC entry 4679 (class 2606 OID 26671)
-- Name: service_include service_include_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_include
    ADD CONSTRAINT service_include_pkey PRIMARY KEY (id);


--
-- TOC entry 4681 (class 2606 OID 26673)
-- Name: service_order_status_history service_order_status_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_order_status_history
    ADD CONSTRAINT service_order_status_history_pkey PRIMARY KEY (id);


--
-- TOC entry 4665 (class 2606 OID 26675)
-- Name: service service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);


--
-- TOC entry 4683 (class 2606 OID 26677)
-- Name: service_timings service_timings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_timings
    ADD CONSTRAINT service_timings_pkey PRIMARY KEY (id);


--
-- TOC entry 4685 (class 2606 OID 26679)
-- Name: service_type service_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_type
    ADD CONSTRAINT service_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4687 (class 2606 OID 26681)
-- Name: service_types service_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_types
    ADD CONSTRAINT service_types_pkey PRIMARY KEY (id);


--
-- TOC entry 4689 (class 2606 OID 26683)
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- TOC entry 4691 (class 2606 OID 26685)
-- Name: skin_colors skin_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin_colors
    ADD CONSTRAINT skin_colors_pkey PRIMARY KEY (id);


--
-- TOC entry 4693 (class 2606 OID 26687)
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- TOC entry 4695 (class 2606 OID 26689)
-- Name: store_images store_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_images
    ADD CONSTRAINT store_images_pkey PRIMARY KEY (id);


--
-- TOC entry 4697 (class 2606 OID 26691)
-- Name: store_likes store_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_likes
    ADD CONSTRAINT store_likes_pkey PRIMARY KEY (id);


--
-- TOC entry 4700 (class 2606 OID 26693)
-- Name: store_managers_types store_managers_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_managers_types
    ADD CONSTRAINT store_managers_types_pkey PRIMARY KEY (id);


--
-- TOC entry 4702 (class 2606 OID 26695)
-- Name: store_type store_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_type
    ADD CONSTRAINT store_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4704 (class 2606 OID 26697)
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- TOC entry 4706 (class 2606 OID 26699)
-- Name: subscribers_emails subscribers_emails_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscribers_emails
    ADD CONSTRAINT subscribers_emails_email_unique UNIQUE (email);


--
-- TOC entry 4708 (class 2606 OID 26701)
-- Name: subscribers_emails subscribers_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscribers_emails
    ADD CONSTRAINT subscribers_emails_pkey PRIMARY KEY (id);


--
-- TOC entry 4710 (class 2606 OID 26703)
-- Name: temp_order_products temp_order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_order_products
    ADD CONSTRAINT temp_order_products_pkey PRIMARY KEY (id);


--
-- TOC entry 4712 (class 2606 OID 26705)
-- Name: temp_orders temp_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_orders
    ADD CONSTRAINT temp_orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4714 (class 2606 OID 26707)
-- Name: temp_service_order_items temp_service_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_service_order_items
    ADD CONSTRAINT temp_service_order_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4716 (class 2606 OID 26709)
-- Name: temp_service_orders temp_service_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_service_orders
    ADD CONSTRAINT temp_service_orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4718 (class 2606 OID 26711)
-- Name: temp_user_account_types temp_user_account_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_user_account_types
    ADD CONSTRAINT temp_user_account_types_pkey PRIMARY KEY (id);


--
-- TOC entry 4720 (class 2606 OID 26713)
-- Name: temp_users temp_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users
    ADD CONSTRAINT temp_users_pkey PRIMARY KEY (id);


--
-- TOC entry 4722 (class 2606 OID 26715)
-- Name: tesimonial tesimonial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tesimonial
    ADD CONSTRAINT tesimonial_pkey PRIMARY KEY (id);


--
-- TOC entry 4724 (class 2606 OID 26717)
-- Name: transport transport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transport
    ADD CONSTRAINT transport_pkey PRIMARY KEY (id);


--
-- TOC entry 4726 (class 2606 OID 26719)
-- Name: user_account_types user_account_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account_types
    ADD CONSTRAINT user_account_types_pkey PRIMARY KEY (id);


--
-- TOC entry 4728 (class 2606 OID 26721)
-- Name: user_address user_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address
    ADD CONSTRAINT user_address_pkey PRIMARY KEY (id);


--
-- TOC entry 4730 (class 2606 OID 26723)
-- Name: user_follows user_follows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_follows
    ADD CONSTRAINT user_follows_pkey PRIMARY KEY (id);


--
-- TOC entry 4733 (class 2606 OID 26725)
-- Name: user_privileges user_privileges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_privileges
    ADD CONSTRAINT user_privileges_pkey PRIMARY KEY (id);


--
-- TOC entry 4737 (class 2606 OID 26727)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4739 (class 2606 OID 26729)
-- Name: users_role users_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_role
    ADD CONSTRAINT users_role_pkey PRIMARY KEY (id);


--
-- TOC entry 4741 (class 2606 OID 26731)
-- Name: vendor_cuisines vendor_cuisines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_cuisines
    ADD CONSTRAINT vendor_cuisines_pkey PRIMARY KEY (id);


--
-- TOC entry 4743 (class 2606 OID 26733)
-- Name: vendor_details vendor_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_details
    ADD CONSTRAINT vendor_details_pkey PRIMARY KEY (id);


--
-- TOC entry 4745 (class 2606 OID 26735)
-- Name: vendor_followers vendor_followers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_followers
    ADD CONSTRAINT vendor_followers_pkey PRIMARY KEY (id);


--
-- TOC entry 4747 (class 2606 OID 26737)
-- Name: vendor_locations vendor_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_locations
    ADD CONSTRAINT vendor_locations_pkey PRIMARY KEY (id);


--
-- TOC entry 4749 (class 2606 OID 26739)
-- Name: vendor_menu_images vendor_menu_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_menu_images
    ADD CONSTRAINT vendor_menu_images_pkey PRIMARY KEY (id);


--
-- TOC entry 4751 (class 2606 OID 26741)
-- Name: vendor_messages vendor_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_messages
    ADD CONSTRAINT vendor_messages_pkey PRIMARY KEY (id);


--
-- TOC entry 4753 (class 2606 OID 26743)
-- Name: vendor_service_timings vendor_service_timings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_service_timings
    ADD CONSTRAINT vendor_service_timings_pkey PRIMARY KEY (id);


--
-- TOC entry 4755 (class 2606 OID 26745)
-- Name: vendor_services vendor_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_services
    ADD CONSTRAINT vendor_services_pkey PRIMARY KEY (id);


--
-- TOC entry 4757 (class 2606 OID 26747)
-- Name: vendor_timings vendor_timings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_timings
    ADD CONSTRAINT vendor_timings_pkey PRIMARY KEY (id);


--
-- TOC entry 4759 (class 2606 OID 26749)
-- Name: vendor_videos vendor_videos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_videos
    ADD CONSTRAINT vendor_videos_pkey PRIMARY KEY (id);


--
-- TOC entry 4761 (class 2606 OID 26751)
-- Name: wallet_histories wallet_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_histories
    ADD CONSTRAINT wallet_histories_pkey PRIMARY KEY (id);


--
-- TOC entry 4763 (class 2606 OID 26753)
-- Name: wallet_payment_report wallet_payment_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_payment_report
    ADD CONSTRAINT wallet_payment_report_pkey PRIMARY KEY (id);


--
-- TOC entry 4765 (class 2606 OID 26755)
-- Name: web_banners web_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.web_banners
    ADD CONSTRAINT web_banners_pkey PRIMARY KEY (id);


--
-- TOC entry 4767 (class 2606 OID 26757)
-- Name: website_banners website_banners_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.website_banners
    ADD CONSTRAINT website_banners_name_unique UNIQUE (name);


--
-- TOC entry 4769 (class 2606 OID 26759)
-- Name: website_banners website_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.website_banners
    ADD CONSTRAINT website_banners_pkey PRIMARY KEY (id);


--
-- TOC entry 4771 (class 2606 OID 26761)
-- Name: website_home_management website_home_management_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.website_home_management
    ADD CONSTRAINT website_home_management_pkey PRIMARY KEY (id);


--
-- TOC entry 4773 (class 2606 OID 26763)
-- Name: website_sliders website_sliders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.website_sliders
    ADD CONSTRAINT website_sliders_pkey PRIMARY KEY (id);


--
-- TOC entry 4775 (class 2606 OID 26765)
-- Name: websockets_statistics_entries websockets_statistics_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.websockets_statistics_entries
    ADD CONSTRAINT websockets_statistics_entries_pkey PRIMARY KEY (id);


--
-- TOC entry 4777 (class 2606 OID 26767)
-- Name: wishlists wishlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlists
    ADD CONSTRAINT wishlists_pkey PRIMARY KEY (id);


--
-- TOC entry 4527 (class 1259 OID 26768)
-- Name: des_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX des_user_id ON public.designations USING btree (user_id);


--
-- TOC entry 4735 (class 1259 OID 26769)
-- Name: designation_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX designation_id ON public.users USING btree (designation_id);


--
-- TOC entry 4698 (class 1259 OID 26770)
-- Name: man_vendor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX man_vendor_id ON public.store_managers_types USING btree (vendor_id);


--
-- TOC entry 4592 (class 1259 OID 26771)
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- TOC entry 4599 (class 1259 OID 26772)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 4731 (class 1259 OID 26773)
-- Name: user_designation_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_designation_id ON public.user_privileges USING btree (designation_id);


--
-- TOC entry 4734 (class 1259 OID 26774)
-- Name: user_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_user_id ON public.user_privileges USING btree (user_id);


--
-- TOC entry 4778 (class 2606 OID 26775)
-- Name: bank_details bank_details_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_details
    ADD CONSTRAINT bank_details_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4779 (class 2606 OID 26780)
-- Name: comment_likes comment_likes_comment_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT comment_likes_comment_id_foreign FOREIGN KEY (comment_id) REFERENCES public.post_comments(id) ON DELETE CASCADE;


--
-- TOC entry 4780 (class 2606 OID 26785)
-- Name: comment_likes comment_likes_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT comment_likes_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4781 (class 2606 OID 26790)
-- Name: comment_taged_users comment_taged_users_comment_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_taged_users
    ADD CONSTRAINT comment_taged_users_comment_id_foreign FOREIGN KEY (comment_id) REFERENCES public.post_comments(id) ON DELETE CASCADE;


--
-- TOC entry 4782 (class 2606 OID 26795)
-- Name: comment_taged_users comment_taged_users_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_taged_users
    ADD CONSTRAINT comment_taged_users_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4783 (class 2606 OID 26800)
-- Name: designations designations_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT designations_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4784 (class 2606 OID 26805)
-- Name: help_topics help_topics_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help_topics
    ADD CONSTRAINT help_topics_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4785 (class 2606 OID 26810)
-- Name: order_products order_products_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- TOC entry 4786 (class 2606 OID 26815)
-- Name: orders orders_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4787 (class 2606 OID 26820)
-- Name: post_comments post_comments_post_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT post_comments_post_id_foreign FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- TOC entry 4788 (class 2606 OID 26825)
-- Name: post_comments post_comments_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT post_comments_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4789 (class 2606 OID 26830)
-- Name: post_saves post_saves_post_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_saves
    ADD CONSTRAINT post_saves_post_id_foreign FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- TOC entry 4790 (class 2606 OID 26835)
-- Name: post_saves post_saves_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_saves
    ADD CONSTRAINT post_saves_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4791 (class 2606 OID 26840)
-- Name: post_users post_users_post_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_users
    ADD CONSTRAINT post_users_post_id_foreign FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- TOC entry 4792 (class 2606 OID 26845)
-- Name: post_users post_users_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_users
    ADD CONSTRAINT post_users_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4793 (class 2606 OID 26850)
-- Name: product_docs product_docs_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_docs
    ADD CONSTRAINT product_docs_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- TOC entry 4794 (class 2606 OID 26855)
-- Name: product_images product_images_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 4795 (class 2606 OID 26860)
-- Name: product_items product_items_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_items
    ADD CONSTRAINT product_items_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- TOC entry 4796 (class 2606 OID 26865)
-- Name: product_selected_attributes product_selected_attributes_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_selected_attributes
    ADD CONSTRAINT product_selected_attributes_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- TOC entry 4797 (class 2606 OID 26870)
-- Name: product_specifications product_specifications_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_specifications
    ADD CONSTRAINT product_specifications_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- TOC entry 4798 (class 2606 OID 26875)
-- Name: product_variations product_variations_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variations
    ADD CONSTRAINT product_variations_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- TOC entry 4800 (class 2606 OID 26880)
-- Name: service_images service_images_service_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_images
    ADD CONSTRAINT service_images_service_id_foreign FOREIGN KEY (service_id) REFERENCES public.service(id) ON DELETE CASCADE;


--
-- TOC entry 4799 (class 2606 OID 26885)
-- Name: service service_service_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_service_user_id_foreign FOREIGN KEY (service_user_id) REFERENCES public.users(id);


--
-- TOC entry 4801 (class 2606 OID 26890)
-- Name: store_managers_types store_managers_types_vendor_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_managers_types
    ADD CONSTRAINT store_managers_types_vendor_id_foreign FOREIGN KEY (vendor_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4802 (class 2606 OID 26895)
-- Name: temp_order_products temp_order_products_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_order_products
    ADD CONSTRAINT temp_order_products_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- TOC entry 4803 (class 2606 OID 26900)
-- Name: temp_orders temp_orders_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_orders
    ADD CONSTRAINT temp_orders_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4804 (class 2606 OID 26905)
-- Name: user_address user_address_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address
    ADD CONSTRAINT user_address_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4805 (class 2606 OID 26910)
-- Name: user_follows user_follows_follow_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_follows
    ADD CONSTRAINT user_follows_follow_user_id_foreign FOREIGN KEY (follow_user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4806 (class 2606 OID 26915)
-- Name: user_follows user_follows_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_follows
    ADD CONSTRAINT user_follows_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4807 (class 2606 OID 26920)
-- Name: vendor_details vendor_details_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_details
    ADD CONSTRAINT vendor_details_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4808 (class 2606 OID 26925)
-- Name: wallet_histories wallet_histories_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_histories
    ADD CONSTRAINT wallet_histories_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2025-09-22 17:19:23

--
-- PostgreSQL database dump complete
--

