--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15 (Ubuntu 12.15-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.3 (Ubuntu 15.3-1.pgdg20.04+1)

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
    name character varying(600),
    description character varying(600),
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    account_id integer
);


ALTER TABLE public.activity_type OWNER TO postgres;

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
-- Name: ad_banners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ad_banners (
    id bigint NOT NULL,
    banner_title character varying(600),
    banner_image character varying(600),
    category integer DEFAULT 0 NOT NULL,
    active integer DEFAULT 0 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    updated_by integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    product integer DEFAULT 0 NOT NULL,
    place integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.ad_banners OWNER TO postgres;

--
-- Name: ad_banners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ad_banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ad_banners_id_seq OWNER TO postgres;

--
-- Name: ad_banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ad_banners_id_seq OWNED BY public.ad_banners.id;


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
    category integer DEFAULT 0 NOT NULL,
    product integer DEFAULT 0 NOT NULL
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
-- Name: bad_words; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bad_words (
    id bigint NOT NULL,
    word text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.bad_words OWNER TO postgres;

--
-- Name: bad_words_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bad_words_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bad_words_id_seq OWNER TO postgres;

--
-- Name: bad_words_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bad_words_id_seq OWNED BY public.bad_words.id;


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
    iban_code integer
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
-- Name: block_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.block_users (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    blocked_user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
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
    deleted integer DEFAULT 0 NOT NULL
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
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id bigint NOT NULL,
    product_id integer NOT NULL,
    product_attribute_id integer NOT NULL,
    quantity integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    store_id integer NOT NULL,
    device_cart_id character varying(500),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    influencer_id integer DEFAULT 0 NOT NULL,
    influencer_qty integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: cart_food; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_food (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    quantity integer NOT NULL,
    user_id bigint DEFAULT '0'::bigint NOT NULL,
    store_id bigint NOT NULL,
    device_cart_id character varying(500),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.cart_food OWNER TO postgres;

--
-- Name: cart_food_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_food_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_food_id_seq OWNER TO postgres;

--
-- Name: cart_food_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_food_id_seq OWNED BY public.cart_food.id;


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
    updated_at timestamp(0) without time zone
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
    coupon_id bigint NOT NULL,
    coupon_title character varying(600),
    coupon_description text,
    coupon_end_date timestamp(0) without time zone,
    coupon_amount double precision,
    coupon_minimum_spend double precision,
    coupon_maximum_spend double precision,
    coupon_usage_percoupon double precision,
    coupon_usage_perx double precision,
    coupon_usage_peruser double precision,
    coupon_created_date timestamp(0) without time zone,
    coupon_vender_id integer DEFAULT 0 NOT NULL,
    coupon_code character varying(100),
    coupon_status integer DEFAULT 0 NOT NULL,
    individual_use integer DEFAULT 0 NOT NULL,
    amount_type integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    applied_to integer DEFAULT 0 NOT NULL,
    start_date timestamp(0) without time zone,
    minimum_amount double precision
);


ALTER TABLE public.coupon OWNER TO postgres;

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
-- Name: coupon_coupon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_coupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupon_coupon_id_seq OWNER TO postgres;

--
-- Name: coupon_coupon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_coupon_id_seq OWNED BY public.coupon.coupon_id;


--
-- Name: coupon_histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupon_histories (
    id bigint NOT NULL,
    order_id integer NOT NULL,
    coupon_id integer NOT NULL,
    user_id integer NOT NULL,
    coupon_code character varying(255) NOT NULL,
    discount double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.coupon_histories OWNER TO postgres;

--
-- Name: coupon_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupon_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupon_histories_id_seq OWNER TO postgres;

--
-- Name: coupon_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupon_histories_id_seq OWNED BY public.coupon_histories.id;


--
-- Name: coupon_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupon_products (
    id bigint NOT NULL,
    product_id integer NOT NULL,
    coupon_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
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
-- Name: deligates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deligates (
    id bigint NOT NULL,
    deligate_name character varying(255) NOT NULL,
    deligate_icon character varying(255) NOT NULL,
    deligate_status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    shipping_charge double precision DEFAULT '0'::double precision NOT NULL
);


ALTER TABLE public.deligates OWNER TO postgres;

--
-- Name: deligates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deligates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deligates_id_seq OWNER TO postgres;

--
-- Name: deligates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deligates_id_seq OWNED BY public.deligates.id;


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
-- Name: facilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facilities (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.facilities OWNER TO postgres;

--
-- Name: facilities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facilities_id_seq OWNER TO postgres;

--
-- Name: facilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facilities_id_seq OWNED BY public.facilities.id;


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
-- Name: favourite_moda_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favourite_moda_items (
    id bigint NOT NULL,
    fav_id integer NOT NULL,
    product_id integer NOT NULL,
    product_attribute_id integer NOT NULL,
    moda_sub_category integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    moda_category integer NOT NULL
);


ALTER TABLE public.favourite_moda_items OWNER TO postgres;

--
-- Name: favourite_moda_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.favourite_moda_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favourite_moda_items_id_seq OWNER TO postgres;

--
-- Name: favourite_moda_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favourite_moda_items_id_seq OWNED BY public.favourite_moda_items.id;


--
-- Name: favourite_modas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favourite_modas (
    id bigint NOT NULL,
    moda_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.favourite_modas OWNER TO postgres;

--
-- Name: favourite_modas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.favourite_modas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favourite_modas_id_seq OWNER TO postgres;

--
-- Name: favourite_modas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favourite_modas_id_seq OWNED BY public.favourite_modas.id;


--
-- Name: food_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    image text,
    banner_image text,
    parent_id integer DEFAULT 0 NOT NULL,
    active integer DEFAULT 1 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    created_uid integer NOT NULL,
    updated_uid integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.food_categories OWNER TO postgres;

--
-- Name: food_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_categories_id_seq OWNER TO postgres;

--
-- Name: food_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_categories_id_seq OWNED BY public.food_categories.id;


--
-- Name: food_category_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_category_products (
    id bigint NOT NULL,
    food_category_id bigint NOT NULL,
    food_product_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.food_category_products OWNER TO postgres;

--
-- Name: food_category_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_category_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_category_products_id_seq OWNER TO postgres;

--
-- Name: food_category_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_category_products_id_seq OWNED BY public.food_category_products.id;


--
-- Name: food_coupon_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_coupon_categories (
    id bigint NOT NULL,
    coupon_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.food_coupon_categories OWNER TO postgres;

--
-- Name: food_coupon_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_coupon_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_coupon_categories_id_seq OWNER TO postgres;

--
-- Name: food_coupon_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_coupon_categories_id_seq OWNED BY public.food_coupon_categories.id;


--
-- Name: food_coupon_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_coupon_products (
    id bigint NOT NULL,
    coupon_id integer DEFAULT 0 NOT NULL,
    product_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.food_coupon_products OWNER TO postgres;

--
-- Name: food_coupon_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_coupon_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_coupon_products_id_seq OWNER TO postgres;

--
-- Name: food_coupon_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_coupon_products_id_seq OWNED BY public.food_coupon_products.id;


--
-- Name: food_headings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_headings (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    active smallint DEFAULT '1'::smallint NOT NULL,
    deleted smallint DEFAULT '0'::smallint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.food_headings OWNER TO postgres;

--
-- Name: food_headings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_headings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_headings_id_seq OWNER TO postgres;

--
-- Name: food_headings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_headings_id_seq OWNED BY public.food_headings.id;


--
-- Name: food_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_items (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    active smallint DEFAULT '1'::smallint NOT NULL,
    deleted smallint DEFAULT '0'::smallint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.food_items OWNER TO postgres;

--
-- Name: food_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_items_id_seq OWNER TO postgres;

--
-- Name: food_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_items_id_seq OWNED BY public.food_items.id;


--
-- Name: food_menu_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_menu_products (
    id bigint NOT NULL,
    food_menu_id bigint,
    food_product_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.food_menu_products OWNER TO postgres;

--
-- Name: food_menu_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_menu_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_menu_products_id_seq OWNER TO postgres;

--
-- Name: food_menu_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_menu_products_id_seq OWNED BY public.food_menu_products.id;


--
-- Name: food_product_combo_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_product_combo_items (
    id bigint NOT NULL,
    food_product_combo_id bigint NOT NULL,
    food_item_id bigint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    extra_price double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.food_product_combo_items OWNER TO postgres;

--
-- Name: food_product_combo_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_product_combo_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_product_combo_items_id_seq OWNER TO postgres;

--
-- Name: food_product_combo_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_product_combo_items_id_seq OWNED BY public.food_product_combo_items.id;


--
-- Name: food_product_combos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_product_combos (
    id bigint NOT NULL,
    food_product_id bigint NOT NULL,
    food_heading_id bigint NOT NULL,
    is_required boolean DEFAULT false NOT NULL,
    min_select integer,
    max_select integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.food_product_combos OWNER TO postgres;

--
-- Name: food_product_combos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_product_combos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_product_combos_id_seq OWNER TO postgres;

--
-- Name: food_product_combos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_product_combos_id_seq OWNED BY public.food_product_combos.id;


--
-- Name: food_product_likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_product_likes (
    id bigint NOT NULL,
    product_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.food_product_likes OWNER TO postgres;

--
-- Name: food_product_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_product_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_product_likes_id_seq OWNER TO postgres;

--
-- Name: food_product_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_product_likes_id_seq OWNED BY public.food_product_likes.id;


--
-- Name: food_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_products (
    id bigint NOT NULL,
    vendor_id bigint,
    shared_product boolean DEFAULT false NOT NULL,
    store_id bigint,
    is_editable_by_outlets boolean DEFAULT false NOT NULL,
    product_name character varying(255),
    regular_price double precision,
    sale_price double precision,
    is_veg smallint DEFAULT '0'::smallint NOT NULL,
    promotion smallint DEFAULT '0'::smallint NOT NULL,
    product_images text,
    description text,
    deleted integer DEFAULT 0 NOT NULL,
    product_status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    pieces integer DEFAULT 0
);


ALTER TABLE public.food_products OWNER TO postgres;

--
-- Name: COLUMN food_products.is_veg; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.food_products.is_veg IS '0: Non-Veg, 1: Veg, 2: Egg';


--
-- Name: COLUMN food_products.promotion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.food_products.promotion IS '0: No, 1: Buy 1 Get 1, 2: Buy 2 Get 1';


--
-- Name: food_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_products_id_seq OWNER TO postgres;

--
-- Name: food_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_products_id_seq OWNED BY public.food_products.id;


--
-- Name: gym_subscription_packages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gym_subscription_packages (
    id bigint NOT NULL,
    store_id integer NOT NULL,
    package_name character varying(255) NOT NULL,
    package_description text NOT NULL,
    price double precision DEFAULT '0'::double precision NOT NULL,
    no_of_days integer NOT NULL,
    service_charge double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.gym_subscription_packages OWNER TO postgres;

--
-- Name: gym_subscription_packages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gym_subscription_packages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gym_subscription_packages_id_seq OWNER TO postgres;

--
-- Name: gym_subscription_packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gym_subscription_packages_id_seq OWNED BY public.gym_subscription_packages.id;


--
-- Name: gym_subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gym_subscriptions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    store_id integer NOT NULL,
    package_id integer NOT NULL,
    subscription_title character varying(255) NOT NULL,
    subscription_no_of_days integer NOT NULL,
    subscription_end_date date NOT NULL,
    subscription_status integer DEFAULT 0 NOT NULL,
    full_name character varying(255) NOT NULL,
    dial_code character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    age character varying(255) NOT NULL,
    gender character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    sub_total double precision DEFAULT '0'::double precision NOT NULL,
    tax double precision DEFAULT '0'::double precision NOT NULL,
    service_charge double precision DEFAULT '0'::double precision NOT NULL,
    grand_total double precision DEFAULT '0'::double precision NOT NULL,
    subscription_invoice_id character varying(255) NOT NULL,
    subscription_number character varying(255),
    note text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.gym_subscriptions OWNER TO postgres;

--
-- Name: gym_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gym_subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gym_subscriptions_id_seq OWNER TO postgres;

--
-- Name: gym_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gym_subscriptions_id_seq OWNED BY public.gym_subscriptions.id;


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
-- Name: hash_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hash_tags (
    id bigint NOT NULL,
    tag character varying(500),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.hash_tags OWNER TO postgres;

--
-- Name: hash_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hash_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hash_tags_id_seq OWNER TO postgres;

--
-- Name: hash_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hash_tags_id_seq OWNED BY public.hash_tags.id;


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
-- Name: hide_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hide_posts (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.hide_posts OWNER TO postgres;

--
-- Name: hide_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hide_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hide_posts_id_seq OWNER TO postgres;

--
-- Name: hide_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hide_posts_id_seq OWNED BY public.hide_posts.id;


--
-- Name: hide_stories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hide_stories (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    hidden_user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.hide_stories OWNER TO postgres;

--
-- Name: hide_stories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hide_stories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hide_stories_id_seq OWNER TO postgres;

--
-- Name: hide_stories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hide_stories_id_seq OWNED BY public.hide_stories.id;


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
-- Name: menu_item_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_item_types (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.menu_item_types OWNER TO postgres;

--
-- Name: menu_item_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_item_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_item_types_id_seq OWNER TO postgres;

--
-- Name: menu_item_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_item_types_id_seq OWNED BY public.menu_item_types.id;


--
-- Name: menu_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_items (
    id bigint NOT NULL,
    menu_id integer NOT NULL,
    menu_item_type_id integer NOT NULL,
    title character varying(255) NOT NULL,
    image character varying(255),
    description text,
    price character varying(255),
    quantity character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.menu_items OWNER TO postgres;

--
-- Name: menu_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_items_id_seq OWNER TO postgres;

--
-- Name: menu_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_items_id_seq OWNED BY public.menu_items.id;


--
-- Name: menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menus (
    id bigint NOT NULL,
    vendor_id integer NOT NULL,
    about character varying(255),
    subtitle character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.menus OWNER TO postgres;

--
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menus_id_seq OWNER TO postgres;

--
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menus_id_seq OWNED BY public.menus.id;


--
-- Name: message_privacies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message_privacies (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    privacy_id integer DEFAULT 999999 NOT NULL,
    show_nottifcation integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.message_privacies OWNER TO postgres;

--
-- Name: message_privacies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.message_privacies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.message_privacies_id_seq OWNER TO postgres;

--
-- Name: message_privacies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.message_privacies_id_seq OWNED BY public.message_privacies.id;


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
-- Name: mute_stories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mute_stories (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    mute_user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.mute_stories OWNER TO postgres;

--
-- Name: mute_stories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mute_stories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mute_stories_id_seq OWNER TO postgres;

--
-- Name: mute_stories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mute_stories_id_seq OWNED BY public.mute_stories.id;


--
-- Name: my_moda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.my_moda (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    date date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    hair_color character varying(20),
    skin_color character varying(20)
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
-- Name: nottification_tracks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nottification_tracks (
    id bigint NOT NULL,
    type character varying(255) NOT NULL,
    from_user_id integer DEFAULT 0 NOT NULL,
    to_user_id integer DEFAULT 0 NOT NULL,
    firebase_node_id character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    key_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.nottification_tracks OWNER TO postgres;

--
-- Name: nottification_tracks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nottification_tracks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nottification_tracks_id_seq OWNER TO postgres;

--
-- Name: nottification_tracks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nottification_tracks_id_seq OWNED BY public.nottification_tracks.id;


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
    shipping_charge double precision,
    delivered_on date,
    is_returned integer DEFAULT 0 NOT NULL,
    ret_status integer DEFAULT 0 NOT NULL,
    returned_on date,
    ret_reason text,
    ret_status_changed_on timestamp(0) without time zone,
    ret_status_changed_by integer DEFAULT 0 NOT NULL,
    influencer_id integer DEFAULT 0 NOT NULL,
    influencer_qty integer DEFAULT 0 NOT NULL
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
-- Name: order_status_histroys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_status_histroys (
    id bigint NOT NULL,
    order_id integer NOT NULL,
    order_status integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.order_status_histroys OWNER TO postgres;

--
-- Name: order_status_histroys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_status_histroys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_status_histroys_id_seq OWNER TO postgres;

--
-- Name: order_status_histroys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_status_histroys_id_seq OWNED BY public.order_status_histroys.id;


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
    coupon_code character varying(255),
    coupon_id integer DEFAULT 0,
    store_id integer DEFAULT 0 NOT NULL,
    request_deligate integer DEFAULT 0 NOT NULL,
    order_otp character varying(255),
    driver_id integer DEFAULT 0 NOT NULL,
    driver_rating double precision DEFAULT '0'::double precision NOT NULL,
    driver_review text,
    store_rating double precision DEFAULT '0'::double precision NOT NULL,
    store_review text,
    store_viewed integer DEFAULT 0 NOT NULL,
    driver_viewed integer DEFAULT 0 NOT NULL,
    delivery_date timestamp(0) without time zone,
    type smallint DEFAULT '0'::smallint NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: COLUMN orders.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.orders.type IS '0 normal order, 1 - food orders';


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
    updated_at timestamp(0) without time zone,
    payment_response text
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
-- Name: photos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.photos (
    id bigint NOT NULL,
    vendor_id integer NOT NULL,
    image text,
    active smallint DEFAULT '1'::smallint NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.photos OWNER TO postgres;

--
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photos_id_seq OWNER TO postgres;

--
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.photos_id_seq OWNED BY public.photos.id;


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
    comment_node_id text,
    bad_words text,
    is_bad_word_exist integer DEFAULT 0 NOT NULL,
    active integer DEFAULT 1 NOT NULL
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
    height character varying(255) NOT NULL,
    width character varying(255) NOT NULL,
    extension character varying(255) NOT NULL,
    is_default integer DEFAULT 0 NOT NULL,
    url text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    duration character varying(255) DEFAULT ''::character varying NOT NULL,
    thumb_image text,
    have_hls_url integer DEFAULT 0 NOT NULL,
    hls_url text,
    hls_cdn_url text
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
-- Name: post_reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_reports (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL,
    reason text NOT NULL,
    problem_id integer DEFAULT 1 NOT NULL,
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
-- Name: post_view_insights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_view_insights (
    id bigint NOT NULL,
    post_id integer NOT NULL,
    viewed_user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.post_view_insights OWNER TO postgres;

--
-- Name: post_view_insights_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_view_insights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_view_insights_id_seq OWNER TO postgres;

--
-- Name: post_view_insights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_view_insights_id_seq OWNED BY public.post_view_insights.id;


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
    extra_file_names text,
    is_bad_word_exist integer DEFAULT 0 NOT NULL,
    bad_words text,
    dissable_comment integer DEFAULT 0 NOT NULL,
    thumb_image text
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
    store_id integer DEFAULT 0 NOT NULL,
    moda_main_category integer DEFAULT 0 NOT NULL,
    moda_sub_category integer DEFAULT 0 NOT NULL,
    brand integer DEFAULT 0 NOT NULL,
    ret_applicable integer DEFAULT 0 NOT NULL,
    ret_policy_days integer DEFAULT 0 NOT NULL,
    ret_policy text,
    account_id integer,
    activity_id integer
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
-- Name: product_likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_likes (
    id bigint NOT NULL,
    product_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    product_attribute_id integer DEFAULT 0 NOT NULL
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
    size_chart character varying(600),
    unit integer DEFAULT 0 NOT NULL,
    minimum_qty character varying(600),
    thickness double precision,
    materials character varying(1600),
    flash_sale integer DEFAULT 0 NOT NULL,
    featured integer DEFAULT 0 NOT NULL
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
-- Name: provider_package_subscription_histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provider_package_subscription_histories (
    id bigint NOT NULL,
    invoice_id character varying(255) NOT NULL,
    user_id integer NOT NULL,
    package_id integer NOT NULL,
    no_of_days integer NOT NULL,
    package_ending_date date NOT NULL,
    grand_total double precision DEFAULT '0'::double precision NOT NULL,
    tax double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.provider_package_subscription_histories OWNER TO postgres;

--
-- Name: provider_package_subscription_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.provider_package_subscription_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provider_package_subscription_histories_id_seq OWNER TO postgres;

--
-- Name: provider_package_subscription_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.provider_package_subscription_histories_id_seq OWNED BY public.provider_package_subscription_histories.id;


--
-- Name: provider_packages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provider_packages (
    id bigint NOT NULL,
    package_name character varying(255) NOT NULL,
    no_of_days integer DEFAULT 1 NOT NULL,
    price double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    description text
);


ALTER TABLE public.provider_packages OWNER TO postgres;

--
-- Name: provider_packages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.provider_packages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provider_packages_id_seq OWNER TO postgres;

--
-- Name: provider_packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.provider_packages_id_seq OWNED BY public.provider_packages.id;


--
-- Name: public_business_infos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.public_business_infos (
    id bigint NOT NULL,
    title character varying(300),
    active smallint DEFAULT '1'::smallint NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.public_business_infos OWNER TO postgres;

--
-- Name: public_business_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.public_business_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.public_business_infos_id_seq OWNER TO postgres;

--
-- Name: public_business_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.public_business_infos_id_seq OWNED BY public.public_business_infos.id;


--
-- Name: reservation_bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation_bookings (
    id bigint NOT NULL,
    booking_id character varying(255),
    user_id integer,
    reservation_product_id integer,
    activity_type_id integer,
    booking_price double precision DEFAULT '0'::double precision NOT NULL,
    service_charges double precision DEFAULT '0'::double precision NOT NULL,
    tax_charges double precision DEFAULT '0'::double precision NOT NULL,
    total_amount double precision DEFAULT '0'::double precision NOT NULL,
    start_date_time timestamp(0) without time zone,
    end_date_time timestamp(0) without time zone,
    status character varying(255) NOT NULL,
    is_paid character varying(255) NOT NULL,
    user_code character varying(255),
    vendor_code character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT reservation_bookings_is_paid_check CHECK (((is_paid)::text = ANY ((ARRAY['0'::character varying, '1'::character varying])::text[]))),
    CONSTRAINT reservation_bookings_status_check CHECK (((status)::text = ANY ((ARRAY['waiting_for_confirmation'::character varying, 'booking_confirmed'::character varying, 'wait_for_schedule'::character varying, 'reserved'::character varying, 'completed'::character varying, 'rejected'::character varying])::text[])))
);


ALTER TABLE public.reservation_bookings OWNER TO postgres;

--
-- Name: reservation_bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservation_bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservation_bookings_id_seq OWNER TO postgres;

--
-- Name: reservation_bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservation_bookings_id_seq OWNED BY public.reservation_bookings.id;


--
-- Name: reservation_product_contents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation_product_contents (
    id bigint NOT NULL,
    reservation_product_id integer,
    content_type character varying(255),
    content character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT reservation_product_contents_content_type_check CHECK (((content_type)::text = ANY ((ARRAY['image'::character varying, 'video'::character varying])::text[])))
);


ALTER TABLE public.reservation_product_contents OWNER TO postgres;

--
-- Name: reservation_product_contents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservation_product_contents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservation_product_contents_id_seq OWNER TO postgres;

--
-- Name: reservation_product_contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservation_product_contents_id_seq OWNED BY public.reservation_product_contents.id;


--
-- Name: reservation_product_ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation_product_ratings (
    id bigint NOT NULL,
    reservation_product_id integer,
    ratings integer,
    review text,
    user_id integer,
    status character varying(255) DEFAULT '0'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT reservation_product_ratings_status_check CHECK (((status)::text = ANY ((ARRAY['0'::character varying, '1'::character varying])::text[])))
);


ALTER TABLE public.reservation_product_ratings OWNER TO postgres;

--
-- Name: reservation_product_ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservation_product_ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservation_product_ratings_id_seq OWNER TO postgres;

--
-- Name: reservation_product_ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservation_product_ratings_id_seq OWNED BY public.reservation_product_ratings.id;


--
-- Name: reservation_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation_products (
    id bigint NOT NULL,
    name character varying(255),
    address character varying(255),
    primary_image character varying(255),
    cover_image character varying(255),
    price_type character varying(255),
    price integer,
    description text,
    currency character varying(255),
    account_type_id integer,
    activity_type_id integer,
    vendor_id integer,
    latitude character varying(255),
    longitude character varying(255),
    status character varying(255) DEFAULT '0'::character varying NOT NULL,
    facilities text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    service_charges double precision DEFAULT '0'::double precision NOT NULL,
    tax_charges double precision DEFAULT '0'::double precision NOT NULL,
    CONSTRAINT reservation_products_price_type_check CHECK (((price_type)::text = ANY ((ARRAY['per_hour'::character varying, 'per_day'::character varying, 'per_week'::character varying, 'per_month'::character varying, 'per_year'::character varying, 'fixed'::character varying])::text[]))),
    CONSTRAINT reservation_products_status_check CHECK (((status)::text = ANY ((ARRAY['0'::character varying, '1'::character varying])::text[])))
);


ALTER TABLE public.reservation_products OWNER TO postgres;

--
-- Name: reservation_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservation_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservation_products_id_seq OWNER TO postgres;

--
-- Name: reservation_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservation_products_id_seq OWNED BY public.reservation_products.id;


--
-- Name: service_request_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_request_images (
    id bigint NOT NULL,
    service_request_id integer NOT NULL,
    image text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.service_request_images OWNER TO postgres;

--
-- Name: service_request_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_request_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_request_images_id_seq OWNER TO postgres;

--
-- Name: service_request_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_request_images_id_seq OWNED BY public.service_request_images.id;


--
-- Name: service_request_status_descriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_request_status_descriptions (
    id bigint NOT NULL,
    service_request_id integer NOT NULL,
    status character varying(255) NOT NULL,
    description text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.service_request_status_descriptions OWNER TO postgres;

--
-- Name: service_request_status_descriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_request_status_descriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_request_status_descriptions_id_seq OWNER TO postgres;

--
-- Name: service_request_status_descriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_request_status_descriptions_id_seq OWNED BY public.service_request_status_descriptions.id;


--
-- Name: service_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_requests (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    store_id integer NOT NULL,
    description text NOT NULL,
    status character varying(255) DEFAULT '0'::character varying NOT NULL,
    is_completed integer DEFAULT 0 NOT NULL,
    accept_note text,
    amount double precision,
    service_charges double precision,
    tax double precision,
    total_amount double precision,
    address text,
    latitude text,
    longitude text,
    payment_method character varying(255),
    payment_status character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    service_date date,
    service_time time(0) without time zone,
    location_name text,
    service_invoice_id text,
    complete_note text,
    completed_on timestamp(0) without time zone,
    rating double precision DEFAULT '0'::double precision NOT NULL,
    review text,
    payment_note text
);


ALTER TABLE public.service_requests OWNER TO postgres;

--
-- Name: service_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_requests_id_seq OWNER TO postgres;

--
-- Name: service_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_requests_id_seq OWNED BY public.service_requests.id;


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
    moda_commission double precision DEFAULT '0'::double precision NOT NULL
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
    banner_image character varying(600) NOT NULL,
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
    latitude character varying(50) NOT NULL,
    longitude character varying(50) NOT NULL,
    address_line1 character varying(900),
    address_line2 character varying(255),
    country_id bigint NOT NULL,
    state_id bigint NOT NULL,
    city_id bigint NOT NULL,
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
    ret_policy_title character varying(200),
    ret_policy_description text,
    ret_policy_doc character varying(900),
    sort_order integer DEFAULT 999999 NOT NULL
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
-- Name: stories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stories (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    caption character varying(2500),
    path text NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    is_blocked integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_live integer DEFAULT 0 NOT NULL,
    live_url text,
    channel_id character varying(255),
    zoom character varying(255),
    width character varying(255),
    height character varying(255),
    channel_key character varying(255)
);


ALTER TABLE public.stories OWNER TO postgres;

--
-- Name: stories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stories_id_seq OWNER TO postgres;

--
-- Name: stories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stories_id_seq OWNED BY public.stories.id;


--
-- Name: story_likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.story_likes (
    id bigint NOT NULL,
    story_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.story_likes OWNER TO postgres;

--
-- Name: story_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.story_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.story_likes_id_seq OWNER TO postgres;

--
-- Name: story_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.story_likes_id_seq OWNED BY public.story_likes.id;


--
-- Name: story_mentions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.story_mentions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    story_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.story_mentions OWNER TO postgres;

--
-- Name: story_mentions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.story_mentions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.story_mentions_id_seq OWNER TO postgres;

--
-- Name: story_mentions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.story_mentions_id_seq OWNED BY public.story_mentions.id;


--
-- Name: story_reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.story_reports (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    story_id integer NOT NULL,
    reason text NOT NULL,
    problem_id integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.story_reports OWNER TO postgres;

--
-- Name: story_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.story_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.story_reports_id_seq OWNER TO postgres;

--
-- Name: story_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.story_reports_id_seq OWNED BY public.story_reports.id;


--
-- Name: story_views; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.story_views (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    story_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.story_views OWNER TO postgres;

--
-- Name: story_views_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.story_views_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.story_views_id_seq OWNER TO postgres;

--
-- Name: story_views_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.story_views_id_seq OWNED BY public.story_views.id;


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
    shipping_charge double precision,
    influencer_id integer DEFAULT 0 NOT NULL,
    influencer_qty integer DEFAULT 0 NOT NULL
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
    coupon_code character varying(255),
    coupon_id integer DEFAULT 0,
    store_id integer DEFAULT 0 NOT NULL,
    request_deligate integer DEFAULT 0 NOT NULL
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
-- Name: units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.units (
    id bigint NOT NULL,
    name character varying(1500) NOT NULL,
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.units OWNER TO postgres;

--
-- Name: units_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.units_id_seq OWNER TO postgres;

--
-- Name: units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.units_id_seq OWNED BY public.units.id;


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
    flat_no character varying(255),
    postcode character varying(255)
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
-- Name: user_favorites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_favorites (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    fav_user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_favorites OWNER TO postgres;

--
-- Name: user_favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_favorites_id_seq OWNER TO postgres;

--
-- Name: user_favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_favorites_id_seq OWNED BY public.user_favorites.id;


--
-- Name: user_follows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_follows (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    follow_user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    request_accept_status integer DEFAULT 1 NOT NULL
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
-- Name: user_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_locations (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    lattitude character varying(255) NOT NULL,
    longitude character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    location_name text
);


ALTER TABLE public.user_locations OWNER TO postgres;

--
-- Name: user_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_locations_id_seq OWNER TO postgres;

--
-- Name: user_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_locations_id_seq OWNED BY public.user_locations.id;


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
-- Name: user_profile_view_insights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_profile_view_insights (
    id bigint NOT NULL,
    viewed_user_id integer NOT NULL,
    viewed_profile_user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_profile_view_insights OWNER TO postgres;

--
-- Name: user_profile_view_insights_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_profile_view_insights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_profile_view_insights_id_seq OWNER TO postgres;

--
-- Name: user_profile_view_insights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_profile_view_insights_id_seq OWNED BY public.user_profile_view_insights.id;


--
-- Name: user_reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_reports (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    reported_user_id integer NOT NULL,
    reason text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    problem_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.user_reports OWNER TO postgres;

--
-- Name: user_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_reports_id_seq OWNER TO postgres;

--
-- Name: user_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_reports_id_seq OWNED BY public.user_reports.id;


--
-- Name: user_vehicle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_vehicle (
    id bigint NOT NULL,
    vehicle_type integer,
    user_id integer,
    vehicle_front character varying(600),
    vehicle_back character varying(600),
    vehicle_registration character varying(600),
    driving_license character varying(600),
    deleted integer DEFAULT 0,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_vehicle OWNER TO postgres;

--
-- Name: user_vehicle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_vehicle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_vehicle_id_seq OWNER TO postgres;

--
-- Name: user_vehicle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_vehicle_id_seq OWNED BY public.user_vehicle.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255),
    email character varying(255),
    dial_code character varying(255),
    phone character varying(255) NOT NULL,
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
    password_reset_otp integer,
    privacy_id integer DEFAULT 999999 NOT NULL,
    send_notification integer DEFAULT 1 NOT NULL,
    mute_message integer DEFAULT 0 NOT NULL,
    commission double precision,
    public_business_info integer DEFAULT 0 NOT NULL,
    facebook_url character varying(600),
    instagram_url character varying(600),
    linkedin_url character varying(600),
    is_social integer DEFAULT 0 NOT NULL,
    twitter_url character varying(600),
    tiktok_url character varying(600),
    user_type_id integer,
    activity_type_id integer,
    commercial_license text,
    commercial_reg_no character varying(600),
    associated_license text,
    res_dial_code integer,
    res_phone character varying(30),
    address character varying(600),
    business_type_id bigint,
    admin_commission_perc double precision DEFAULT '0'::double precision NOT NULL,
    residence_no character varying(600),
    nationality character varying(600),
    rating double precision DEFAULT '0'::double precision NOT NULL,
    rated_users integer DEFAULT 0 NOT NULL,
    banner_image text,
    hide_profile integer DEFAULT 0 NOT NULL,
    active_package_id integer DEFAULT 0 NOT NULL,
    pacakge_end_date date,
    active_gym_package_id integer DEFAULT 0 NOT NULL,
    gym_end_date date
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
    state integer DEFAULT 0 NOT NULL,
    city integer DEFAULT 0 NOT NULL,
    area integer DEFAULT 0 NOT NULL,
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
    store_type integer DEFAULT 0 NOT NULL
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
-- Name: videos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.videos (
    id bigint NOT NULL,
    vendor_id integer NOT NULL,
    video text,
    active smallint DEFAULT '1'::smallint NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.videos OWNER TO postgres;

--
-- Name: videos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.videos_id_seq OWNER TO postgres;

--
-- Name: videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.videos_id_seq OWNED BY public.videos.id;


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
    pay_method integer DEFAULT 0
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
-- Name: wholesale_order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wholesale_order_items (
    id bigint NOT NULL,
    wholesale_order_id integer NOT NULL,
    menu_item_id integer NOT NULL,
    quantity character varying(255) NOT NULL,
    price character varying(255) NOT NULL,
    total_amount character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.wholesale_order_items OWNER TO postgres;

--
-- Name: wholesale_order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wholesale_order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wholesale_order_items_id_seq OWNER TO postgres;

--
-- Name: wholesale_order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wholesale_order_items_id_seq OWNED BY public.wholesale_order_items.id;


--
-- Name: wholesale_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wholesale_orders (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    vendor_id integer NOT NULL,
    status_id integer NOT NULL,
    approved integer DEFAULT '-1'::integer NOT NULL,
    order_number character varying(255),
    total_quantity character varying(255) NOT NULL,
    total_amount character varying(255) NOT NULL,
    shipping_address character varying(255),
    delivery_option integer,
    payment_method character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    admin_commission double precision DEFAULT '0'::double precision NOT NULL
);


ALTER TABLE public.wholesale_orders OWNER TO postgres;

--
-- Name: wholesale_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wholesale_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wholesale_orders_id_seq OWNER TO postgres;

--
-- Name: wholesale_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wholesale_orders_id_seq OWNED BY public.wholesale_orders.id;


--
-- Name: account_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_type ALTER COLUMN id SET DEFAULT nextval('public.account_type_id_seq'::regclass);


--
-- Name: activity_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_type ALTER COLUMN id SET DEFAULT nextval('public.activity_type_id_seq'::regclass);


--
-- Name: ad_banners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ad_banners ALTER COLUMN id SET DEFAULT nextval('public.ad_banners_id_seq'::regclass);


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
-- Name: attributes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attributes ALTER COLUMN id SET DEFAULT nextval('public.attributes_id_seq'::regclass);


--
-- Name: bad_words id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bad_words ALTER COLUMN id SET DEFAULT nextval('public.bad_words_id_seq'::regclass);


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
-- Name: block_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.block_users ALTER COLUMN id SET DEFAULT nextval('public.block_users_id_seq'::regclass);


--
-- Name: brand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand ALTER COLUMN id SET DEFAULT nextval('public.brand_id_seq'::regclass);


--
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);


--
-- Name: cart_food id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_food ALTER COLUMN id SET DEFAULT nextval('public.cart_food_id_seq'::regclass);


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: comment_likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_likes ALTER COLUMN id SET DEFAULT nextval('public.comment_likes_id_seq'::regclass);


--
-- Name: comment_taged_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_taged_users ALTER COLUMN id SET DEFAULT nextval('public.comment_taged_users_id_seq'::regclass);


--
-- Name: contact_us_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us_settings ALTER COLUMN id SET DEFAULT nextval('public.contact_us_settings_id_seq'::regclass);


--
-- Name: country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- Name: coupon coupon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon ALTER COLUMN coupon_id SET DEFAULT nextval('public.coupon_coupon_id_seq'::regclass);


--
-- Name: coupon_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_category ALTER COLUMN id SET DEFAULT nextval('public.coupon_category_id_seq'::regclass);


--
-- Name: coupon_histories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_histories ALTER COLUMN id SET DEFAULT nextval('public.coupon_histories_id_seq'::regclass);


--
-- Name: coupon_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_products ALTER COLUMN id SET DEFAULT nextval('public.coupon_products_id_seq'::regclass);


--
-- Name: deligates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deligates ALTER COLUMN id SET DEFAULT nextval('public.deligates_id_seq'::regclass);


--
-- Name: designations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.designations ALTER COLUMN id SET DEFAULT nextval('public.designations_id_seq'::regclass);


--
-- Name: facilities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facilities ALTER COLUMN id SET DEFAULT nextval('public.facilities_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: faq id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faq ALTER COLUMN id SET DEFAULT nextval('public.faq_id_seq'::regclass);


--
-- Name: favourite_moda_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourite_moda_items ALTER COLUMN id SET DEFAULT nextval('public.favourite_moda_items_id_seq'::regclass);


--
-- Name: favourite_modas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourite_modas ALTER COLUMN id SET DEFAULT nextval('public.favourite_modas_id_seq'::regclass);


--
-- Name: food_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_categories ALTER COLUMN id SET DEFAULT nextval('public.food_categories_id_seq'::regclass);


--
-- Name: food_category_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_category_products ALTER COLUMN id SET DEFAULT nextval('public.food_category_products_id_seq'::regclass);


--
-- Name: food_coupon_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_coupon_categories ALTER COLUMN id SET DEFAULT nextval('public.food_coupon_categories_id_seq'::regclass);


--
-- Name: food_coupon_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_coupon_products ALTER COLUMN id SET DEFAULT nextval('public.food_coupon_products_id_seq'::regclass);


--
-- Name: food_headings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_headings ALTER COLUMN id SET DEFAULT nextval('public.food_headings_id_seq'::regclass);


--
-- Name: food_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_items ALTER COLUMN id SET DEFAULT nextval('public.food_items_id_seq'::regclass);


--
-- Name: food_menu_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_menu_products ALTER COLUMN id SET DEFAULT nextval('public.food_menu_products_id_seq'::regclass);


--
-- Name: food_product_combo_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_product_combo_items ALTER COLUMN id SET DEFAULT nextval('public.food_product_combo_items_id_seq'::regclass);


--
-- Name: food_product_combos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_product_combos ALTER COLUMN id SET DEFAULT nextval('public.food_product_combos_id_seq'::regclass);


--
-- Name: food_product_likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_product_likes ALTER COLUMN id SET DEFAULT nextval('public.food_product_likes_id_seq'::regclass);


--
-- Name: food_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_products ALTER COLUMN id SET DEFAULT nextval('public.food_products_id_seq'::regclass);


--
-- Name: gym_subscription_packages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gym_subscription_packages ALTER COLUMN id SET DEFAULT nextval('public.gym_subscription_packages_id_seq'::regclass);


--
-- Name: gym_subscriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gym_subscriptions ALTER COLUMN id SET DEFAULT nextval('public.gym_subscriptions_id_seq'::regclass);


--
-- Name: hair_colors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hair_colors ALTER COLUMN id SET DEFAULT nextval('public.hair_colors_id_seq'::regclass);


--
-- Name: hash_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hash_tags ALTER COLUMN id SET DEFAULT nextval('public.hash_tags_id_seq'::regclass);


--
-- Name: help id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help ALTER COLUMN id SET DEFAULT nextval('public.help_id_seq'::regclass);


--
-- Name: hide_posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hide_posts ALTER COLUMN id SET DEFAULT nextval('public.hide_posts_id_seq'::regclass);


--
-- Name: hide_stories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hide_stories ALTER COLUMN id SET DEFAULT nextval('public.hide_stories_id_seq'::regclass);


--
-- Name: industry_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industry_types ALTER COLUMN id SET DEFAULT nextval('public.industry_types_id_seq'::regclass);


--
-- Name: menu_item_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_item_types ALTER COLUMN id SET DEFAULT nextval('public.menu_item_types_id_seq'::regclass);


--
-- Name: menu_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items ALTER COLUMN id SET DEFAULT nextval('public.menu_items_id_seq'::regclass);


--
-- Name: menus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus ALTER COLUMN id SET DEFAULT nextval('public.menus_id_seq'::regclass);


--
-- Name: message_privacies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_privacies ALTER COLUMN id SET DEFAULT nextval('public.message_privacies_id_seq'::regclass);


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
-- Name: mute_stories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mute_stories ALTER COLUMN id SET DEFAULT nextval('public.mute_stories_id_seq'::regclass);


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
-- Name: nottification_tracks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nottification_tracks ALTER COLUMN id SET DEFAULT nextval('public.nottification_tracks_id_seq'::regclass);


--
-- Name: order_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products ALTER COLUMN id SET DEFAULT nextval('public.order_products_id_seq'::regclass);


--
-- Name: order_status_histroys id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_histroys ALTER COLUMN id SET DEFAULT nextval('public.order_status_histroys_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: payment_report id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_report ALTER COLUMN id SET DEFAULT nextval('public.payment_report_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: photos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos ALTER COLUMN id SET DEFAULT nextval('public.photos_id_seq'::regclass);


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
-- Name: post_reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_reports ALTER COLUMN id SET DEFAULT nextval('public.post_reports_id_seq'::regclass);


--
-- Name: post_saves id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_saves ALTER COLUMN id SET DEFAULT nextval('public.post_saves_id_seq'::regclass);


--
-- Name: post_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_users ALTER COLUMN id SET DEFAULT nextval('public.post_users_id_seq'::regclass);


--
-- Name: post_view_insights id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_view_insights ALTER COLUMN id SET DEFAULT nextval('public.post_view_insights_id_seq'::regclass);


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
-- Name: product_docs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_docs ALTER COLUMN id SET DEFAULT nextval('public.product_docs_id_seq'::regclass);


--
-- Name: product_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images ALTER COLUMN id SET DEFAULT nextval('public.product_images_id_seq'::regclass);


--
-- Name: product_likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_likes ALTER COLUMN id SET DEFAULT nextval('public.product_likes_id_seq'::regclass);


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
-- Name: profile_bios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_bios ALTER COLUMN id SET DEFAULT nextval('public.profile_bios_id_seq'::regclass);


--
-- Name: provider_package_subscription_histories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provider_package_subscription_histories ALTER COLUMN id SET DEFAULT nextval('public.provider_package_subscription_histories_id_seq'::regclass);


--
-- Name: provider_packages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provider_packages ALTER COLUMN id SET DEFAULT nextval('public.provider_packages_id_seq'::regclass);


--
-- Name: public_business_infos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.public_business_infos ALTER COLUMN id SET DEFAULT nextval('public.public_business_infos_id_seq'::regclass);


--
-- Name: reservation_bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation_bookings ALTER COLUMN id SET DEFAULT nextval('public.reservation_bookings_id_seq'::regclass);


--
-- Name: reservation_product_contents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation_product_contents ALTER COLUMN id SET DEFAULT nextval('public.reservation_product_contents_id_seq'::regclass);


--
-- Name: reservation_product_ratings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation_product_ratings ALTER COLUMN id SET DEFAULT nextval('public.reservation_product_ratings_id_seq'::regclass);


--
-- Name: reservation_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation_products ALTER COLUMN id SET DEFAULT nextval('public.reservation_products_id_seq'::regclass);


--
-- Name: service_request_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_request_images ALTER COLUMN id SET DEFAULT nextval('public.service_request_images_id_seq'::regclass);


--
-- Name: service_request_status_descriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_request_status_descriptions ALTER COLUMN id SET DEFAULT nextval('public.service_request_status_descriptions_id_seq'::regclass);


--
-- Name: service_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_requests ALTER COLUMN id SET DEFAULT nextval('public.service_requests_id_seq'::regclass);


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
-- Name: stories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stories ALTER COLUMN id SET DEFAULT nextval('public.stories_id_seq'::regclass);


--
-- Name: story_likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.story_likes ALTER COLUMN id SET DEFAULT nextval('public.story_likes_id_seq'::regclass);


--
-- Name: story_mentions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.story_mentions ALTER COLUMN id SET DEFAULT nextval('public.story_mentions_id_seq'::regclass);


--
-- Name: story_reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.story_reports ALTER COLUMN id SET DEFAULT nextval('public.story_reports_id_seq'::regclass);


--
-- Name: story_views id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.story_views ALTER COLUMN id SET DEFAULT nextval('public.story_views_id_seq'::regclass);


--
-- Name: temp_order_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_order_products ALTER COLUMN id SET DEFAULT nextval('public.temp_order_products_id_seq'::regclass);


--
-- Name: temp_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_orders ALTER COLUMN id SET DEFAULT nextval('public.temp_orders_id_seq'::regclass);


--
-- Name: units id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units ALTER COLUMN id SET DEFAULT nextval('public.units_id_seq'::regclass);


--
-- Name: user_address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address ALTER COLUMN id SET DEFAULT nextval('public.user_address_id_seq'::regclass);


--
-- Name: user_favorites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_favorites ALTER COLUMN id SET DEFAULT nextval('public.user_favorites_id_seq'::regclass);


--
-- Name: user_follows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_follows ALTER COLUMN id SET DEFAULT nextval('public.user_follows_id_seq'::regclass);


--
-- Name: user_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_locations ALTER COLUMN id SET DEFAULT nextval('public.user_locations_id_seq'::regclass);


--
-- Name: user_privileges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_privileges ALTER COLUMN id SET DEFAULT nextval('public.user_privileges_id_seq'::regclass);


--
-- Name: user_profile_view_insights id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile_view_insights ALTER COLUMN id SET DEFAULT nextval('public.user_profile_view_insights_id_seq'::regclass);


--
-- Name: user_reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_reports ALTER COLUMN id SET DEFAULT nextval('public.user_reports_id_seq'::regclass);


--
-- Name: user_vehicle id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_vehicle ALTER COLUMN id SET DEFAULT nextval('public.user_vehicle_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_role ALTER COLUMN id SET DEFAULT nextval('public.users_role_id_seq'::regclass);


--
-- Name: vendor_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_details ALTER COLUMN id SET DEFAULT nextval('public.vendor_details_id_seq'::regclass);


--
-- Name: videos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.videos ALTER COLUMN id SET DEFAULT nextval('public.videos_id_seq'::regclass);


--
-- Name: wallet_histories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_histories ALTER COLUMN id SET DEFAULT nextval('public.wallet_histories_id_seq'::regclass);


--
-- Name: wallet_payment_report id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_payment_report ALTER COLUMN id SET DEFAULT nextval('public.wallet_payment_report_id_seq'::regclass);


--
-- Name: websockets_statistics_entries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.websockets_statistics_entries ALTER COLUMN id SET DEFAULT nextval('public.websockets_statistics_entries_id_seq'::regclass);


--
-- Name: wholesale_order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wholesale_order_items ALTER COLUMN id SET DEFAULT nextval('public.wholesale_order_items_id_seq'::regclass);


--
-- Name: wholesale_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wholesale_orders ALTER COLUMN id SET DEFAULT nextval('public.wholesale_orders_id_seq'::regclass);


--
-- Data for Name: account_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_type (id, name, description, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: activity_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activity_type (id, name, description, deleted, created_at, updated_at, account_id) FROM stdin;
\.


--
-- Data for Name: ad_banners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ad_banners (id, banner_title, banner_image, category, active, created_by, updated_by, created_at, updated_at, product, place) FROM stdin;
11	square cube tile	647d7a844c09d_1685944964.png	3	1	1	0	2023-06-08 09:11:27	2023-06-08 09:11:27	12	2
9	Rectangular Tiles	647d75eb14d5a_1685943787.png	7	1	1	0	2023-06-05 05:43:07	2023-06-05 05:43:07	13	1
\.


--
-- Data for Name: admin_designation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_designation (id, name, is_deletd) FROM stdin;
1	Manager	0
2	General Manager	0
3	Team Lead	0
4	hi	1
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

COPY public.app_banners (id, banner_title, banner_image, active, created_by, updated_by, created_at, updated_at, category, product) FROM stdin;
6	Kerb Stone	647d78a260f34_1685944482.png	1	1	0	2023-06-05 05:54:42	\N	7	0
7	Blocks	647d79539ce48_1685944659.png	1	1	0	2023-06-05 05:57:39	\N	3	0
8	Paving tiles	647d79c0960bf_1685944768.png	1	1	1	2023-06-05 05:59:28	2023-06-08 08:56:00	5	9
2	Banner Block	647d78d844f8b_1685944536.png	1	1	1	2023-05-19 12:28:48	2023-06-08 12:01:42	3	5
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles (id, title_en, title_ar, status, desc_en, desc_ar, meta_title, meta_keyword, meta_description, created_at, updated_at) FROM stdin;
3	Privacy Policy	\N	1	<p>about us</p>	<p>about us</p>	\N	\N	\N	2023-05-25 04:11:31	2023-05-25 04:13:29
1	About us	Arabic Title	1	<p style="box-sizing: border-box; margin: 30px 0px 0px; padding: 0px; font-size: 18px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-stretch: inherit; line-height: 1.7; font-family: proxima_nova_rgregular; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: #33475b; max-width: 100%; text-align: justify;"><span style="color: #03002f; font-family: FKGrotesk, Helvetica, Arial, sans-serif; text-align: start;">Take the visitors on your website to a trip down memory lane, and give them an insight to the history behind your store. Here, you can show them where, how, and when you started, and everything your business has accomplished on the way. <br />This is your chance to share your relevant milestones and achievements relating to your business in an engaging way.</span></p>	<p>English&nbsp; Description</p>	\N	\N	\N	2023-05-24 16:59:38	2023-06-06 12:52:25
4	Terms And Conditions	\N	1	<p>Terms &amp; Conditions</p>	<p>Privacy Policy</p>	\N	\N	\N	2023-05-25 04:12:36	2023-06-07 07:39:02
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
-- Data for Name: attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attributes (id, attribute_name, active, attribute_type, industry_type, company_id, store_id, is_common, deleted, created_uid, updated_uid, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bad_words; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bad_words (id, word, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank (id, name, created_at, updated_at) FROM stdin;
1	SBI	2023-05-10 07:05:25	\N
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

COPY public.bank_details (id, bank_name, company_account, code_type, account_no, branch_code, branch_name, bank_statement_doc, credit_card_sta_doc, country, user_id, created_at, updated_at, iban_code) FROM stdin;
2	\N	\N	0	\N	\N	\N	\N	\N	0	48	2023-05-29 12:35:30	2023-05-29 12:35:30	\N
\.


--
-- Data for Name: block_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.block_users (id, user_id, blocked_user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brand (id, name, industry_type, image, active, created_at, updated_at, deleted) FROM stdin;
1	Johnson	1	6476e9e0c3395_1685514720.png	1	2023-05-31 06:32:00	2023-05-31 06:32:00	0
\.


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, product_id, product_attribute_id, quantity, user_id, store_id, device_cart_id, created_at, updated_at, influencer_id, influencer_qty) FROM stdin;
280	11	11	50	15	1	b9f686d90de58a17	2023-06-06 14:36:40	2023-06-06 14:36:40	0	0
67	1	1	501	0	1	08B62DF3-E20C-4897-ADF8-A8949419CC67	2023-05-30 20:40:42	2023-05-30 22:10:02	0	0
69	10	10	556	0	1	08B62DF3-E20C-4897-ADF8-A8949419CC67	2023-05-30 22:10:24	2023-05-30 22:10:24	0	0
34	15	15	23	0	1	e19e10ee2b97a91c	2023-05-25 06:54:50	2023-05-25 06:54:50	0	0
68	16	16	5	0	1	08B62DF3-E20C-4897-ADF8-A8949419CC67	2023-05-30 22:03:28	2023-05-30 22:10:55	0	0
71	16	16	13	56	3	fe3h4gsfd	2023-05-31 07:20:50	2023-05-31 07:20:50	0	0
282	16	16	25	15	1	4B44A6EE-C4D4-4D12-BDD1-C3F796C657434	2023-06-06 14:38:54	2023-06-06 14:39:25	0	0
196	34	34	21	81	1	741E4FA5-CD83-47F5-804A-073432D2B41F	2023-06-04 18:40:03	2023-06-04 18:51:19	0	0
197	14	14	21	81	1	741E4FA5-CD83-47F5-804A-073432D2B41F	2023-06-04 18:51:26	2023-06-04 18:51:26	0	0
78	33	33	12	39	1	507c25ffbc01d8ae	2023-05-31 11:31:39	2023-06-15 08:59:55	0	0
31	1	1	4	39	1	507c25ffbc01d8ae	2023-05-24 22:23:20	2023-06-15 08:59:55	0	0
190	34	34	20	39	1	507c25ffbc01d8ae	2023-06-04 12:20:44	2023-06-15 08:59:55	0	0
367	16	16	25	39	1	507c25ffbc01d8ae	2023-06-08 12:21:21	2023-06-15 08:59:55	0	0
376	11	11	100	39	1	507c25ffbc01d8ae	2023-06-08 13:17:32	2023-06-15 08:59:55	0	0
200	33	33	10	0	1	6DB204B7-BB55-4999-922D-E601CDD81612	2023-06-05 03:32:11	2023-06-05 03:32:11	0	0
387	16	16	50	147	1	7F333B27-93A9-496E-8F71-177CF9A8D278	2023-06-12 12:01:16	2023-06-16 07:05:19	0	0
50	15	15	500	0	1	2870cfa9d5899dc7	2023-05-29 20:52:31	2023-05-29 20:52:31	0	0
222	10	10	50	0	1	6DB204B7-BB55-4999-922D-E601CDD81612	2023-06-05 12:20:27	2023-06-05 12:20:27	0	0
62	4	4	504	49	1	3852ebc2bc915c8f	2023-05-30 17:08:49	2023-05-30 19:11:43	0	0
64	3	3	501	49	1	3852ebc2bc915c8f	2023-05-30 19:12:03	2023-05-30 19:12:03	0	0
173	34	34	25	0	1	5873BE5D-6344-4F60-8D34-704703AAB110	2023-06-03 08:35:46	2023-06-03 08:35:46	0	0
65	2	2	6000	49	1	F88D7DC7-2399-4BFA-8369-C1914DA0773C	2023-05-30 20:13:26	2023-05-30 20:13:26	0	0
25	9	9	12	46	1	577a132e59c70de2	2023-05-24 13:12:37	2023-05-24 13:12:37	0	0
26	15	15	3	46	1	577a132e59c70de2	2023-05-24 13:13:22	2023-05-24 14:00:17	0	0
138	33	33	11	47	1	3852ebc2bc915c8f	2023-06-01 19:57:38	2023-06-01 19:57:38	0	0
225	16	16	25	0	3	11111	2023-06-05 12:41:11	2023-06-05 12:42:37	0	0
70	15	15	50	0	1	5873BE5D-6344-4F60-8D34-704703AAB110	2023-05-31 03:08:17	2023-06-02 03:02:07	0	0
63	15	15	6	49	1	3852ebc2bc915c8f	2023-05-30 17:17:00	2023-05-31 20:16:08	0	0
97	3	3	502	0	1	476474BC-8B2B-4E2E-BCCF-3530F07053A6	2023-05-31 20:24:01	2023-05-31 20:24:22	0	0
66	1	1	48	49	1	F88D7DC7-2399-4BFA-8369-C1914DA0773C	2023-05-30 20:16:11	2023-05-30 22:00:27	0	0
101	33	33	11	63	1	5768E82C-7C6C-476F-8474-D7C8733D0C63	2023-05-31 23:05:38	2023-05-31 23:05:38	0	0
383	11	11	50	145	1	4E57FF57-A726-43D5-8152-9CC6782E5CEA	2023-06-09 03:57:07	2023-06-09 03:57:07	0	0
206	15	15	15	0	1	8F7E9300-C02C-436D-BEF7-108F86828894	2023-06-05 06:54:07	2023-06-05 06:54:07	0	0
241	16	16	26	67	1	3852ebc2bc915c8f	2023-06-05 19:19:25	2023-06-05 19:19:25	0	0
156	33	33	11	0	1	fbf562894f8e8656	2023-06-02 21:14:28	2023-06-02 21:14:28	0	0
159	33	33	11	0	1	D6CFDB1B-F66E-4ED1-B74A-528D260A0AB3	2023-06-02 22:07:51	2023-06-02 22:07:51	0	0
160	33	33	11	69	1	D6CFDB1B-F66E-4ED1-B74A-528D260A0AB3	2023-06-02 22:30:55	2023-06-02 22:30:55	0	0
275	16	16	25	0	1	b9f686d90de58a17	2023-06-06 13:23:38	2023-06-06 13:23:38	0	0
211	11	11	50	88	1	6DB204B7-BB55-4999-922D-E601CDD81612	2023-06-05 08:19:54	2023-06-05 08:20:28	0	0
182	14	14	39	73	1	9E51FF30-4418-4368-AC19-F95356E2D4BF	2023-06-03 12:33:02	2023-06-06 07:21:59	0	0
259	11	11	50	73	1	498F4E5E-EF7F-45A6-8C8B-23DA1E275AB1	2023-06-06 07:22:07	2023-06-06 07:22:07	0	0
329	14	14	55	47	1	3852ebc2bc915c8f	2023-06-07 20:07:58	2023-06-07 20:08:13	0	0
\.


--
-- Data for Name: cart_food; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_food (id, product_id, quantity, user_id, store_id, device_cart_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name, image, banner_image, parent_id, active, deleted, sort_order, created_uid, updated_uid, created_at, updated_at) FROM stdin;
7	Kerb Stones	6471d5e651b26_1685181926.png	\N	0	1	0	0	1	1	2023-05-17 12:17:22	2023-05-27 10:34:56
5	Paving Tiles	6471d6767c1ac_1685182070.png	\N	0	1	0	0	1	1	2023-05-17 12:16:29	2023-05-27 10:35:13
3	Blocks	6471d682e5513_1685182082.png	\N	0	1	0	0	1	1	2023-05-10 13:30:44	2023-05-27 10:35:26
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name, active, country_id, state_id, created_uid, updated_uid, deleted, created_at, updated_at) FROM stdin;
1	Dubai	1	1	1	1	\N	0	2023-05-09 14:24:54	2023-05-09 14:24:54
2	Karama	1	1	1	1	\N	0	2023-05-27 13:29:13	2023-05-27 13:29:13
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
-- Data for Name: contact_us_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_us_settings (id, title_en, title_ar, email, mobile, desc_en, desc_ar, location, latitude, longitude, twitter, instagram, facebook, youtube, linkedin, created_at, updated_at) FROM stdin;
1	BUILD MART	\N	rusvinaroor@gmail.com	987654321	test	\N	673C+W8X - Dubai - United Arab Emirates	\N	\N	\N	\N	\N	\N	\N	\N	2023-05-31 10:53:20
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, name, prefix, dial_code, active, created_at, updated_at, deleted) FROM stdin;
1	United Arab Emirates	971	971	1	2023-05-09 14:24:24	\N	0
\.


--
-- Data for Name: coupon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon (coupon_id, coupon_title, coupon_description, coupon_end_date, coupon_amount, coupon_minimum_spend, coupon_maximum_spend, coupon_usage_percoupon, coupon_usage_perx, coupon_usage_peruser, coupon_created_date, coupon_vender_id, coupon_code, coupon_status, individual_use, amount_type, created_at, updated_at, applied_to, start_date, minimum_amount) FROM stdin;
1	Code 01	10 % OFF on First Booking	2023-12-31 00:00:00	10	\N	\N	500	\N	500	\N	0	CODEBP01	1	0	1	2023-06-03 12:35:06	2023-06-04 16:26:37	1	2023-06-02 00:00:00	1000
\.


--
-- Data for Name: coupon_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_category (id, coupon_id, category_id) FROM stdin;
3	1	3
4	1	5
\.


--
-- Data for Name: coupon_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_histories (id, order_id, coupon_id, user_id, coupon_code, discount, created_at, updated_at) FROM stdin;
1	71	1	39	CODEBP01	610	2023-06-04 04:52:49	2023-06-04 04:52:49
2	81	1	94	CODEBP01	2900	2023-06-05 12:59:40	2023-06-05 12:59:40
3	95	1	123	CODEBP01	1000	2023-06-06 12:57:48	2023-06-06 12:57:48
4	133	1	123	CODEBP01	2891	2023-06-12 11:43:27	2023-06-12 11:43:27
\.


--
-- Data for Name: coupon_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_products (id, product_id, coupon_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: deligates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deligates (id, deligate_name, deligate_icon, deligate_status, created_at, updated_at, shipping_charge) FROM stdin;
\.


--
-- Data for Name: designations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.designations (id, user_id, user_type, designation, status, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: facilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facilities (id, name, icon, status, created_at, updated_at) FROM stdin;
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
3	What are the available Payment methods in Our Service ?	Debit/Credit cart, Apple Pay	1	1	1	2023-06-06 12:36:36	2023-06-06 12:36:36
4	Do we provide home delivery ?	We don't have any delivery partner.	1	1	1	2023-06-06 12:39:01	2023-06-06 12:39:01
2	DO we offer cash on delivery ?	Currently we are not offering cash on delivery.	1	1	1	2023-05-24 17:02:51	2023-06-06 12:40:34
1	Do we provide logistic support ?	Yes, we provide the logistic support but taking delivery charge for that.	1	1	1	2023-05-12 14:11:37	2023-06-06 12:42:27
5	Do we provide construction engineers or labour ?	No, currently we are not providing any construction engineers or labour but in future we will provide that.	1	1	1	2023-06-06 12:44:38	2023-06-06 12:44:38
\.


--
-- Data for Name: favourite_moda_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favourite_moda_items (id, fav_id, product_id, product_attribute_id, moda_sub_category, user_id, created_at, updated_at, moda_category) FROM stdin;
\.


--
-- Data for Name: favourite_modas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favourite_modas (id, moda_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: food_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_categories (id, name, image, banner_image, parent_id, active, deleted, sort_order, created_uid, updated_uid, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: food_category_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_category_products (id, food_category_id, food_product_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: food_coupon_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_coupon_categories (id, coupon_id, category_id) FROM stdin;
\.


--
-- Data for Name: food_coupon_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_coupon_products (id, coupon_id, product_id) FROM stdin;
\.


--
-- Data for Name: food_headings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_headings (id, name, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: food_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_items (id, name, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: food_menu_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_menu_products (id, food_menu_id, food_product_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: food_product_combo_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_product_combo_items (id, food_product_combo_id, food_item_id, is_default, extra_price, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: food_product_combos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_product_combos (id, food_product_id, food_heading_id, is_required, min_select, max_select, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: food_product_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_product_likes (id, product_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: food_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_products (id, vendor_id, shared_product, store_id, is_editable_by_outlets, product_name, regular_price, sale_price, is_veg, promotion, product_images, description, deleted, product_status, created_at, updated_at, pieces) FROM stdin;
\.


--
-- Data for Name: gym_subscription_packages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gym_subscription_packages (id, store_id, package_name, package_description, price, no_of_days, service_charge, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: gym_subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gym_subscriptions (id, user_id, store_id, package_id, subscription_title, subscription_no_of_days, subscription_end_date, subscription_status, full_name, dial_code, phone, age, gender, email, sub_total, tax, service_charge, grand_total, subscription_invoice_id, subscription_number, note, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: hair_colors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hair_colors (id, name, color, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: hash_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hash_tags (id, tag, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: help; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.help (id, title, description, created_by, updated_by, active, created_at, updated_at) FROM stdin;
1	What are the available Payment methods in Our Service ?	Debit/Credit Card, Google Pay, Apple Pay	1	1	1	2023-05-31 10:52:36	2023-05-31 10:52:36
\.


--
-- Data for Name: hide_posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hide_posts (id, user_id, post_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: hide_stories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hide_stories (id, user_id, hidden_user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: industry_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.industry_types (id, name, active, deleted, sort_order, created_uid, updated_uid, created_at, updated_at) FROM stdin;
1	Bussiness	1	0	0	1	1	2023-05-10 07:04:24	2023-05-10 07:04:24
\.


--
-- Data for Name: menu_item_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_item_types (id, title, is_active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_items (id, menu_id, menu_item_type_id, title, image, description, price, quantity, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menus (id, vendor_id, about, subtitle, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: message_privacies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.message_privacies (id, user_id, privacy_id, show_nottifcation, created_at, updated_at) FROM stdin;
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
80	2022_09_01_093209_create_coupon	1
81	2022_09_02_042305_create_amount_type	1
82	2022_09_02_062335_add_applied_to_coupon	1
83	2022_09_02_070349_create_designation_table	1
84	2022_09_02_105714_add_columns_to_user_table	1
85	2022_09_02_151343_create_coupon_category	1
86	2022_09_02_162532_create_user_privileges_table	1
87	2022_09_03_060222_create_product_temp_image	1
88	2022_09_03_093842_alter_product_attribute_change_attribute_type	1
89	2022_09_04_035948_create_admin_designation	1
90	2022_09_04_144626_create_cart_table	1
91	2022_09_05_073828_add_tax_percentage_to_settings_table	1
92	2022_09_05_094102_remove_unique_phone_from_users_table	1
93	2022_09_06_011715_create_orders	1
94	2022_09_07_014840_add_start_date_coupon	1
95	2022_09_07_015521_add_minimum_amount_coupon	1
96	2022_09_08_010349_create_user_adresses_table	1
97	2022_09_08_024755_create_temp_order_products_table	1
98	2022_09_08_024821_create_temp_orders_table	1
99	2022_09_08_035231_alter_order_products	1
100	2022_09_08_042318_create_payment_report_table	1
101	2022_09_12_124711_drop_amount_type	1
102	2022_09_12_124846_amount_type	1
103	2022_09_13_043222_create_moda_main_categories_table	1
104	2022_09_13_043731_create_moda_sub_categories_table	1
105	2022_09_13_063112_create_hair_colors_table	1
106	2022_09_13_063148_create_skin_colors_table	1
107	2022_09_13_094928_alter_product_add_moda_categories	1
108	2022_09_13_100148_alter_users_add_extra	1
109	2022_09_14_052904_create_store_type_table	1
110	2022_09_14_072323_create_wallet_histories_table	1
111	2022_09_14_072738_alter_users_add_wallet_amount	1
112	2022_09_14_102301_create_my_moda_table	1
113	2022_09_14_104738_create_my_moda_items_table	1
114	2022_09_16_045220_create_post_saves_table	1
115	2022_09_17_060127_alter_posts_add_visibity	1
116	2022_09_19_041614_add_password_reset_code	1
117	2022_09_19_132546_create_help_table	1
118	2022_09_19_141934_add_land_mark	1
119	2022_09_20_094958_add_size_chart	1
120	2022_09_20_114010_add_store_type	1
121	2022_09_21_044300_alter_table_user_privileges_change_user_privileges	1
122	2022_09_21_063311_alter_post_add_extra_image_names	1
123	2022_09_22_062135_create_hide_posts_table	1
124	2022_09_23_043209_drop_brand_from_product	1
125	2022_09_23_043512_add_brand	1
126	2022_09_27_010402_alter_user_add_reset_otp	1
127	2022_09_29_082451_create_wallet_payment_report_table	1
128	2022_09_29_092516_alter_wallet_histories_table_add_pay_method	1
129	2022_10_04_014612_add_return_policy_fields_to_store_table	1
130	2022_10_04_021553_create_profile_bios_table	1
131	2022_10_06_050146_create_favourite_modas_table	1
132	2022_10_06_050331_create_favourite_moda_items_table	1
133	2022_10_06_051237_add_category_to_favourite_moda_items	1
134	2022_10_13_022919_create_coupon_histories_table	1
135	2022_10_13_023759_add_coupon_code_to_temp_order	1
136	2022_10_13_023815_add_coupon_code_to_order	1
137	2022_10_13_041211_alter_user_follows_add_request_status	1
138	2022_10_15_085230_create_stories_table	1
139	2022_10_15_093357_create_story_mentionsses_table	1
140	2022_10_17_092929_create_bad_words_table	1
141	2022_10_17_094023_alter_posts_add_is_exist_bad_word_details	1
142	2022_10_18_040929_create_hide_stories_table	1
143	2022_10_18_044111_create_block_users_table	1
144	2022_10_18_090055_create_user_reports_table	1
145	2022_10_18_123905_create_message_privacies_table	1
146	2022_10_18_124906_alter_user_add_message_privacy_settings	1
147	2022_10_21_013915_add_influencer_det_to_cart	1
148	2022_10_24_090639_create_story_likes_table	1
149	2022_10_24_100922_create_mute_stories_table	1
150	2022_10_28_013453_add_commission_to_users	1
151	2022_11_03_171934_alter_user_reports_add_problem_id	1
152	2022_11_04_125618_alter_stories_add_live_details	1
153	2022_11_05_032320_alter_product_add_return_fields	1
154	2022_11_07_024859_alter_settings_add_moda_commission	1
155	2022_11_08_013231_create_public_business_infos_table	1
156	2022_11_08_013303_create_hash_tags_table	1
157	2022_11_08_014755_add_public_business_info_to_user	1
158	2022_11_15_034933_alter_order_products_add_cols	1
159	2022_11_15_052452_alter_order_products_add_cols2	1
160	2022_11_15_083639_alter_post_comments_add_bad_words_col	1
161	2022_11_17_110723_create_user_locations	1
162	2022_11_17_112757_alter_posts_add_disable_comment	1
163	2022_11_22_010927_add_social_links_in_user	1
164	2022_11_22_012635_add_is_social_to_user	1
165	2022_11_22_013629_add_twitter_url_to_user	1
166	2022_11_23_162258_add_colors_to_my_moda	1
167	2022_11_23_170754_create_post_reports_table	1
168	2022_11_24_035925_create_story_views_table	1
169	2022_11_29_091420_create_post_files_table	1
170	2022_11_29_112711_create_user_favorites_table	1
171	2022_12_03_041816_create_nottification_tracks_table	1
172	2022_12_03_063824_alter_nottification_track_add_key_id	1
173	2022_12_06_010546_add_tiktok_url_to_user	1
174	2022_12_08_011010_create_story_reports_table	1
175	2022_12_12_033723_add_location_name_to_user_locations	1
176	2022_12_13_014746_add_influencer_det_to_temp_order_products	1
177	2022_12_13_014815_add_influencer_det_to_order_products	1
178	2022_12_13_142001_alter_stores_add_sort_order	1
179	2022_12_13_153929_alter_post_files_add_duration	1
180	2022_12_16_093416_create_user_profile_view_insights_table	1
181	2022_12_16_105646_create_post_view_insights_table	1
182	2022_12_27_082326_add_thumb_image_to_posts	1
183	2022_12_27_125550_update_user_address_table	1
184	2022_12_29_024630_alter_post_files_add_thumb_image	1
185	2023_01_03_052708_alter_post_files_add_hls	1
186	2023_01_21_074705_create_account_type_table	1
187	2023_01_21_075655_add_user_type_id_to_users_table	1
188	2023_01_21_094955_add_iban_code_to_bank_details	1
189	2023_01_23_075655_add_activity_type_id_to_users_table	1
190	2023_01_23_131043_create_activity_type_table	1
191	2023_01_24_032855_add_fields_to_user	1
192	2023_01_24_040319_add_address_to_users	1
193	2023_01_24_045910_create_user_vehicle_table	1
194	2023_02_22_075208_add_business_type_id_in_users_table	1
195	2023_02_22_190842_create_menus_table	1
196	2023_02_22_191206_create_menu_item_types_table	1
197	2023_02_22_191212_create_menu_items_table	1
198	2023_02_23_095622_create_wholesale_orders_table	1
199	2023_02_23_100849_create_wholesale_order_items_table	1
200	2023_02_24_053308_create_service_requests_table	1
201	2023_02_24_054539_create_service_request_images_table	1
202	2023_02_24_073249_create_service_request_status_descriptions_table	1
203	2023_02_24_102047_add_activity_id_in_activity_types_table	1
204	2023_03_03_013517_create_videos_table	1
205	2023_03_03_014631_create_photos_table	1
206	2023_03_04_005326_alter_wholesale_orders_add_admin_commission	1
207	2023_03_04_005543_alter_users_add_admin_commission_perc	1
208	2023_03_04_021943_alter_users_change_res_phone	1
209	2023_03_09_124202_add_residence_no	1
210	2023_04_05_041742_alter_table_users_add_rating_rated_count	1
211	2023_04_05_054716_alter_cart_add_user_id_default_value	1
212	2023_04_06_063001_create_coupon_products_table	1
213	2023_04_06_093320_alter_table_temp_orders_add_deligate	1
214	2023_04_10_064941_alter_orders_add_store_id	1
215	2023_04_11_115718_add_account_id_and_activity_id_columns	1
216	2023_04_13_055543_create_deligates_table	1
217	2023_04_13_074120_create_update_account_types	1
218	2023_04_14_090012_alter_order_and_temporder_add_deligate_to_integer	1
219	2023_04_17_050655_create_order_status_histroys_table	1
220	2023_04_17_115907_alter_payment_report_add_extra	1
221	2023_04_18_045607_alter_orders_add_order_otp	1
222	2023_04_19_042326_ater_product_likes_add_product_attribute_id	1
223	2023_04_19_051420_alter_orders_add_rating_fields	1
224	2023_04_20_131036_alter_user_add_banner_image	1
225	2023_04_27_061440_create_food_categories_table	1
226	2023_04_27_081152_create_food_products_table	1
227	2023_04_27_110429_create_food_category_products_table	1
228	2023_04_27_110441_create_food_menu_products_table	1
229	2023_04_28_055018_create_food_headings_table	1
230	2023_04_28_055056_create_food_items_table	1
231	2023_04_28_071321_alter_users_add_hide_profile	1
232	2023_04_28_111835_create_food_product_combos_table	1
233	2023_04_28_111843_create_food_product_combo_items_table	1
234	2023_04_29_104338_alter_orders_add_driver_muted	1
235	2023_04_29_123035_change_food_product_combo_items_constraint	1
236	2023_05_02_120501_create_facilities_table	1
237	2023_05_02_123034_alter_deligates_add_shipping_charge	1
238	2023_05_02_143837_create_reservation_products	1
239	2023_05_02_143926_create_reservation_product_contents	1
240	2023_05_03_054833_alter_service_request_add_extra	1
241	2023_05_03_062139_add_pieces_to_food_products_table	1
242	2023_05_03_072823_create_cart_food_table	1
243	2023_05_03_192616_alter_column_reservation_products_change_data_type	1
244	2023_05_04_093924_alter_service_requests_add_complete_note	1
245	2023_05_04_095135_alter_order_add_delivery_date	1
246	2023_05_04_112427_alter_serivice_requst_add_ex	1
247	2023_05_04_164908_create_reservation_product_ratings	1
248	2023_05_04_171454_add_charges_column_reservation_product	1
249	2023_05_04_192322_create_reservation_bookings	1
250	2023_05_05_101818_create_food_product_likes_table	1
251	2023_05_05_113346_create_provider_packages_table	1
252	2023_05_06_053738_create_food_coupon_categories_table	1
253	2023_05_06_053743_create_food_coupon_products_table	1
254	2023_05_06_060059_alter_provider_packages_add_description	1
255	2023_05_06_060545_alter_user_add_package_details	1
256	2023_05_06_061500_create_provider_package_subscription_histories_table	1
257	2023_05_08_070303_add_type_in_orders_table	1
258	2023_05_08_074139_drop_foreign_constraint_in_order_products_table	1
259	2023_05_09_062152_create_gym_subscription_packages_table	1
260	2023_05_09_102656_create_gym_subscriptions_table	1
261	2023_05_09_114735_alter_user_add_gym_end_date	1
262	2023_05_10_091652_add_unit	2
263	2023_05_10_170202_create_units_table	2
264	2023_05_11_035825_add_thickness	3
265	2023_05_20_025117_ad_banners	4
266	2023_06_01_123205_add_category	5
267	2023_06_01_125806_add_product	5
268	2023_06_01_131434_add_product1	5
269	2023_06_03_060322_add_place	6
270	2023_06_03_094115_add_flash_sale	7
\.


--
-- Data for Name: moda_main_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moda_main_categories (id, name, created_at, updated_at) FROM stdin;
1	Head	2023-05-09 13:36:43	\N
2	Upper Body	2023-05-09 13:36:43	\N
3	Lower Body	2023-05-09 13:36:43	\N
4	Footwear	2023-05-09 13:36:43	\N
5	Makeup	2023-05-09 13:36:43	\N
6	Accessories	2023-05-09 13:36:43	\N
\.


--
-- Data for Name: moda_sub_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moda_sub_categories (id, main_category, name, gender, image, active, sort_order, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mute_stories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mute_stories (id, user_id, mute_user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: my_moda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.my_moda (id, user_id, date, created_at, updated_at, hair_color, skin_color) FROM stdin;
\.


--
-- Data for Name: my_moda_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.my_moda_items (id, my_moda_id, product_id, product_attribute_id, moda_sub_category, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, description, title, image, created_at, updated_at) FROM stdin;
11	Dev 5	Dev 5		2023-05-26 17:38:51	\N
12	Test 45	Test		2023-05-26 18:56:47	\N
13	Test 44 343	test 44		2023-05-26 19:06:02	\N
14	hun	hun	1685359118Group 1525521.png	2023-05-29 11:18:38	\N
15	image	test	64748df533f03_1685360117.png	2023-05-29 11:35:17	\N
16	image	test 2	64748e8c7ea7f_1685360268.jpg	2023-05-29 11:37:48	\N
17	zxdsds	test	647491787468f_1685361016.png	2023-05-29 11:50:16	\N
18	Dev Test Description	Dev Test	6474c0f89dcbf_1685373176.png	2023-05-29 15:12:56	\N
19	Dev Test 4 Description	Dev Test 4	6474c58ae38ea_1685374346.png	2023-05-29 15:32:26	\N
20	Nb Description text...	Admin Push 01		2023-06-03 12:03:46	\N
21	Now you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved.Now you can browse privately, and other people who use this device won’t see your activity. \r\nHowever, downloads, bookmarks and reading list items will be saved.	New Asian Tiles Offer		2023-06-03 12:10:18	\N
22	Now you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved.Now you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved.	Marble OFFER		2023-06-03 12:50:14	\N
23	ow you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved.Now you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved.	Marble OFFER		2023-06-03 12:54:12	\N
24	test image	test image	647b3843b911c_1685796931.jpg	2023-06-03 12:55:31	\N
25	Tesing Dev Description	DEV Test	647c78b91851c_1685878969.png	2023-06-04 11:42:49	\N
26	Test Dev	Testing Dev	647c7be1ca36b_1685879777.png	2023-06-04 11:56:17	\N
27	Now you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved.Now you can browse privately, and other people who use this device won’t see your activity.	Admin Push Notification		2023-06-04 16:35:51	\N
28	Now you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved.Now you can browse privately, and other people who use this device won’t see your activity.	Admin Push 02		2023-06-04 16:36:26	\N
29	Now you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved.Now you can browse privately, and other people who use this device won’t see your activity.	Admin Push 03	647cbdac1a79d_1685896620.jpg	2023-06-04 16:37:00	\N
30	Now you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved.Now you can browse privately, and other people who use this device won’t see your activity.	Admin Push -07/06		2023-06-07 05:59:00	\N
31	Now you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved.Now you can browse privately, and other people who use this device won’t see your activity.	Admin push 07/06  Again		2023-06-07 06:01:30	\N
32	Now you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved.Now you can browse privately, and other people who use this device won’t see your activity.	Admin Push 07/06 3		2023-06-07 06:03:10	\N
33	Now you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved.Now you can browse privately, and other people who use this device won’t see your activity.	Dev Test 2		2023-06-07 06:05:09	\N
34	Testing	Test	64801f3a891c0_1686118202.png	2023-06-07 06:10:02	\N
35	Test Description	Test		2023-06-07 06:38:18	\N
36	Done	Admin Push		2023-06-07 13:33:43	\N
\.


--
-- Data for Name: nottification_tracks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nottification_tracks (id, type, from_user_id, to_user_id, firebase_node_id, created_at, updated_at, key_id) FROM stdin;
\.


--
-- Data for Name: order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_products (id, order_id, product_id, product_attribute_id, product_type, quantity, price, discount, total, vendor_id, order_status, admin_commission, vendor_commission, shipping_charge, delivered_on, is_returned, ret_status, returned_on, ret_reason, ret_status_changed_on, ret_status_changed_by, influencer_id, influencer_qty) FROM stdin;
1	1	1	1	1	10	100	0	1000	3	1	0	0	0	\N	0	0	\N	\N	\N	0	0	0
2	2	16	16	1	13	300	0	3900	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
3	3	16	16	1	13	300	0	3900	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
4	4	16	16	1	13	300	0	3900	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
5	5	16	16	1	13	300	0	3900	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
6	6	16	16	1	26	300	0	7800	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
7	7	15	15	1	5	300	0	1500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
8	8	15	15	1	2	300	0	600	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
9	9	16	16	1	13	300	0	3900	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
10	9	10	10	1	13	90	0	1170	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
11	10	15	15	1	2	300	0	600	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
12	11	1	1	1	2	100	0	200	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
13	12	1	1	1	22	100	0	2200	1	1	0	0	0	\N	0	0	\N	\N	\N	0	0	0
14	13	1	1	1	2	100	0	200	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
15	13	16	16	1	2	300	0	600	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
16	14	1	1	1	4	100	0	400	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
19	16	15	15	1	1	300	0	300	1	1	0	0	0	\N	0	0	\N	\N	\N	0	0	0
21	18	1	1	1	1	100	0	100	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
28	24	16	16	1	1	300	0	300	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
20	17	1	1	1	4	100	0	400	1	5	0	0	0	\N	0	0	\N	\N	\N	0	0	0
22	19	1	1	1	2	100	0	200	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
23	20	15	15	1	1	300	0	300	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
35	29	33	33	1	15	25	0	375	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
36	29	34	34	1	25	30.5	0	762.5	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
25	22	1	1	1	1	100	0	100	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
37	30	33	33	1	196	25	0	4900	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
38	30	34	34	1	526	30.5	0	16043	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
39	31	3	3	1	5000	100	0	500000	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
26	23	6	6	1	1	130	0	130	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
27	23	1	1	1	1	100	0	100	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
30	26	16	16	1	1	300	0	300	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
24	21	5	5	1	1	125	0	125	1	1	0	0	0	\N	0	0	\N	\N	\N	0	0	0
29	25	15	15	1	1	300	0	300	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
40	32	33	33	1	12	25	0	300	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
41	33	33	33	1	11	25	0	275	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
43	35	33	33	1	15	25	0	375	1	1	0	0	0	\N	0	0	\N	\N	\N	0	0	0
17	15	1	1	1	2	100	0	200	1	5	0	0	0	\N	0	0	\N	\N	\N	0	0	0
18	15	15	15	1	2	300	0	600	1	5	0	0	0	\N	0	0	\N	\N	\N	0	0	0
31	27	15	15	1	2	300	0	600	1	1	0	0	0	\N	0	0	\N	\N	\N	0	0	0
32	27	8	8	1	3	120	0	360	1	1	0	0	0	\N	0	0	\N	\N	\N	0	0	0
42	34	34	34	1	25	30.5	0	762.5	1	3	0	0	0	\N	0	0	\N	\N	\N	0	0	0
44	36	16	16	1	39	300	0	11700	3	1	0	0	0	\N	0	0	\N	\N	\N	0	0	0
45	37	16	16	1	13	300	0	3900	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
46	38	16	16	1	13	300	0	3900	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
48	40	16	16	1	13	300	0	3900	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
49	41	16	16	1	13	300	0	3900	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
50	42	16	16	1	13	300	0	3900	3	1	0	0	0	\N	0	0	\N	\N	\N	0	0	0
51	42	10	10	1	13	90	0	1170	3	1	0	0	0	\N	0	0	\N	\N	\N	0	0	0
53	44	12	12	1	13	100	0	1300	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
54	44	10	10	1	13	90	0	1170	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
52	43	10	10	1	13	90	0	1170	3	1	0	0	0	\N	0	0	\N	\N	\N	0	0	0
47	39	16	16	1	13	300	0	3900	3	3	0	0	0	\N	0	0	\N	\N	\N	0	0	0
55	44	11	11	1	13	130	0	1690	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
56	45	12	12	1	13	100	0	1300	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
57	45	10	10	1	13	90	0	1170	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
58	45	11	11	1	13	130	0	1690	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
59	46	13	13	1	13	\N	0	0	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
60	46	12	12	1	13	100	0	1300	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
61	46	11	11	1	13	130	0	1690	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
88	67	33	33	1	10	25	0	250	1	5	0	0	0	\N	0	0	\N	\N	\N	0	0	0
89	67	34	34	1	20	30.5	0	610	1	5	0	0	0	\N	0	0	\N	\N	\N	0	0	0
90	67	14	14	1	20	500	0	10000	1	5	0	0	0	\N	0	0	\N	\N	\N	0	0	0
62	47	13	13	1	13	\N	0	0	3	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
63	47	12	12	1	13	100	0	1300	3	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
66	49	33	33	1	11	25	0	275	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
67	50	33	33	1	12	25	0	300	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
68	51	33	33	1	11	25	0	275	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
69	52	33	33	1	11	25	0	275	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
70	53	33	33	1	11	25	0	275	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
71	54	33	33	1	11	25	0	275	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
72	55	33	33	1	11	25	0	275	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
73	56	33	33	1	11	25	0	275	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
74	57	33	33	1	11	25	0	275	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
75	58	33	33	1	11	25	0	275	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
76	59	33	33	1	11	25	0	275	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
77	60	33	33	1	11	25	0	275	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
78	61	33	33	1	11	25	0	275	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
79	62	33	33	1	11	25	0	275	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
80	63	33	33	1	11	25	0	275	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
81	64	33	33	1	15	25	0	375	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
82	64	34	34	1	20	30.5	0	610	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
83	64	16	16	1	25	300	0	7500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
84	65	33	33	1	15	25	0	375	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
85	65	34	34	1	20	30.5	0	610	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
86	65	16	16	1	25	300	0	7500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
87	66	34	34	1	20	30.5	0	610	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
65	48	34	34	1	21	30.5	0	640.5	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
96	71	34	34	1	200	30.5	610	6100	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
94	69	34	34	1	33	30.5	0	1006.5	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
91	68	33	33	1	10	25	0	250	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
99	74	34	34	1	20	30.5	0	610	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
92	68	34	34	1	20	30.5	0	610	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
95	70	34	34	1	20	30.5	0	610	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
93	68	14	14	1	20	500	0	10000	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
97	72	14	14	1	75	500	0	37500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
33	28	1	1	1	48	100	0	4800	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
34	28	2	2	1	4999	10	0	49990	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
100	75	10	10	1	1	90	0	90	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
101	76	16	16	1	25	300	0	7500	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
102	77	33	33	1	11	25	0	275	1	1	0	0	0	\N	0	0	\N	\N	\N	0	0	0
103	77	34	34	1	20	30.5	0	610	1	1	0	0	0	\N	0	0	\N	\N	\N	0	0	0
104	78	34	34	1	20	30.5	0	610	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
98	73	33	33	1	10	25	0	250	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
132	97	8	8	1	900	120	0	108000	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
137	100	14	14	1	21	500	0	10500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
127	93	16	16	1	64	300	0	19200	3	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
105	79	16	16	1	25	300	0	7500	1	5	0	0	0	\N	0	0	\N	\N	\N	0	0	0
106	79	14	14	1	20	500	0	10000	1	5	0	0	0	\N	0	0	\N	\N	\N	0	0	0
107	79	15	15	1	15	300	0	4500	1	5	0	0	0	\N	0	0	\N	\N	\N	0	0	0
108	79	11	11	1	50	130	0	6500	1	5	0	0	0	\N	0	0	\N	\N	\N	0	0	0
109	80	15	15	1	18	300	0	5400	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
110	80	13	13	1	31	200	0	6200	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
111	80	12	12	1	201	100	0	20100	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
64	47	11	11	1	13	130	0	1690	3	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
128	94	14	14	1	21	500	0	10500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
129	94	11	11	1	50	130	0	6500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
112	81	14	14	1	40	500	2000	20000	1	3	0	0	0	\N	0	0	\N	\N	\N	0	0	0
113	81	15	15	1	30	300	900	9000	1	3	0	0	0	\N	0	0	\N	\N	\N	0	0	0
114	82	14	14	1	23	500	0	11500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
115	83	14	14	1	20	500	0	10000	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
116	84	15	15	1	16	300	0	4800	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
117	85	15	15	1	16	300	0	4800	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
118	86	16	16	1	26	300	0	7800	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
119	87	15	15	1	16	300	0	4800	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
120	88	15	15	1	17	300	0	5100	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
138	100	11	11	1	555	130	0	72150	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
139	101	16	16	1	26	300	0	7800	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
121	89	9	9	1	81	115	0	9315	1	5	0	0	0	\N	0	0	\N	\N	\N	0	0	0
122	90	14	14	1	1100	500	0	550000	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
123	91	14	14	1	1100	500	0	550000	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
140	101	14	14	1	21	500	0	10500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
130	95	14	14	1	20	500	1000	10000	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
131	96	16	16	1	26	300	0	7800	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
133	98	14	14	1	20	500	0	10000	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
124	92	10	10	1	56	90	0	5040	1	5	0	0	0	\N	0	0	\N	\N	\N	0	0	0
125	92	13	13	1	30	200	0	6000	1	5	0	0	0	\N	0	0	\N	\N	\N	0	0	0
126	92	11	11	1	51	130	0	6630	1	5	0	0	0	\N	0	0	\N	\N	\N	0	0	0
141	102	14	14	1	20	500	0	10000	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
142	103	16	16	1	26	300	0	7800	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
143	104	14	14	1	21	500	0	10500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
134	99	10	10	1	50	90	0	4500	1	3	0	0	0	\N	0	0	\N	\N	\N	0	0	0
135	99	4	4	1	500	100	0	50000	1	3	0	0	0	\N	0	0	\N	\N	\N	0	0	0
136	99	9	9	1	65	115	0	7475	1	3	0	0	0	\N	0	0	\N	\N	\N	0	0	0
144	105	14	14	1	21	500	0	10500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
152	109	16	16	1	26	300	0	7800	1	1	0	0	0	\N	0	0	\N	\N	\N	0	0	0
145	106	11	11	1	55	130	0	7150	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
146	107	16	16	1	25	300	0	7500	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
147	107	9	9	1	69	115	0	7935	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
153	110	16	16	1	26	300	0	7800	1	5	0	0	0	\N	0	0	\N	\N	\N	0	0	0
148	108	16	16	1	27	300	0	8100	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
149	108	16	16	1	331	300	0	99300	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
150	108	14	14	1	21	500	0	10500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
151	108	15	15	1	161	300	0	48300	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
154	111	6	6	1	500	130	0	65000	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
155	112	11	11	1	51	130	0	6630	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
156	113	16	16	1	25	300	0	7500	1	1	0	0	0	\N	0	0	\N	\N	\N	0	0	0
157	114	16	16	1	25	300	0	7500	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
158	115	16	16	1	25	300	0	7500	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
159	116	16	16	1	25	300	0	7500	3	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
160	117	16	16	1	55	300	0	16500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
161	117	14	14	1	20	500	0	10000	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
162	118	16	16	1	55	300	0	16500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
163	118	15	15	1	15	300	0	4500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
164	119	16	16	1	25	300	0	7500	3	1	0	0	0	\N	0	0	\N	\N	\N	0	0	0
165	120	16	16	1	25	300	0	7500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
166	120	14	14	1	20	500	0	10000	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
167	121	12	12	1	200	100	0	20000	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
168	122	16	16	1	25	300	0	7500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
169	123	10	10	1	50	90	0	4500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
170	123	14	14	1	20	500	0	10000	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
171	123	15	15	1	15	300	0	4500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
172	123	13	13	1	30	200	0	6000	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
173	124	9	9	1	65	115	0	7475	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
174	125	11	11	1	50	130	0	6500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
186	132	16	16	1	25	300	0	7500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
187	133	10	10	1	50	90	450	4500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
188	133	9	9	1	134	115	1541	15410	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
189	133	15	15	1	30	300	900	9000	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
190	133	13	13	1	30	200	0	6000	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
191	134	6	6	1	501	130	0	65130	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
175	126	10	10	1	200	90	0	18000	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
176	126	12	12	1	2000	100	0	200000	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
177	127	11	11	1	50	130	0	6500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
192	134	16	16	1	25	300	0	7500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
193	135	16	16	1	26	300	0	7800	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
178	128	16	16	1	25	300	0	7500	1	3	0	0	0	\N	0	0	\N	\N	\N	0	0	0
179	128	9	9	1	65	115	0	7475	1	3	0	0	0	\N	0	0	\N	\N	\N	0	0	0
180	129	11	11	1	50	130	0	6500	1	1	0	0	0	\N	0	0	\N	\N	\N	0	0	0
181	130	10	10	1	50	90	0	4500	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
182	130	9	9	1	66	115	0	7590	1	0	0	0	0	\N	0	0	\N	\N	\N	0	0	0
183	131	16	16	1	26	300	0	7800	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
184	131	10	10	1	50	90	0	4500	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
185	131	11	11	1	50	130	0	6500	1	6	0	0	0	\N	0	0	\N	\N	\N	0	0	0
\.


--
-- Data for Name: order_status_histroys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_status_histroys (id, order_id, order_status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, invoice_id, user_id, address_id, total, vat, discount, grand_total, payment_mode, status, booking_date, total_qty, total_items_qty, oder_type, admin_commission, vendor_commission, shipping_charge, created_at, updated_at, coupon_code, coupon_id, store_id, request_deligate, order_otp, driver_id, driver_rating, driver_review, store_rating, store_review, store_viewed, driver_viewed, delivery_date, type) FROM stdin;
16	BM-391685035830	39	6	300	0	0	300	2	1	2023-05-25 17:31:27	1	1	0	0	0	0	2023-05-25 17:31:27	2023-05-25 19:13:55	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
1	BM-151684562364	15	1	1000	0	0	1000	2	1	2023-05-20 05:59:36	1	10	0	0	0	0	2023-05-20 05:59:36	2023-05-20 05:59:48	\N	0	3	1	\N	0	0	\N	0	\N	0	0	\N	0
2	BM-151684574944	15	1	3900	0	0	3900	2	0	2023-05-20 09:29:13	1	13	0	0	0	0	2023-05-20 09:29:13	2023-05-20 09:29:13	\N	0	3	1	\N	0	0	\N	0	\N	0	0	\N	0
3	BM-151684575632	15	1	3900	0	0	3900	2	0	2023-05-20 09:40:39	1	13	0	0	0	0	2023-05-20 09:40:39	2023-05-20 09:40:39	\N	0	3	1	\N	0	0	\N	0	\N	0	0	\N	0
4	BM-151684575850	15	1	3900	0	0	3900	2	0	2023-05-20 09:44:20	1	13	0	0	0	0	2023-05-20 09:44:20	2023-05-20 09:44:20	\N	0	3	1	\N	0	0	\N	0	\N	0	0	\N	0
5	BM-151684728113	15	1	3900	0	0	3900	2	0	2023-05-22 04:02:01	1	13	0	0	0	0	2023-05-22 04:02:01	2023-05-22 04:02:01	\N	0	3	1	\N	0	0	\N	0	\N	0	0	\N	0
6	BM-151684834874	15	1	7800	0	0	7800	2	0	2023-05-23 09:41:34	1	26	0	0	0	0	2023-05-23 09:41:34	2023-05-23 09:41:34	\N	0	3	0	\N	0	0	\N	0	\N	0	0	\N	0
7	BM-151684848679	15	1	1500	0	0	1500	2	0	2023-05-23 13:33:16	1	5	0	0	0	0	2023-05-23 13:33:16	2023-05-23 13:33:16	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
8	BM-151684906120	15	1	600	0	0	600	2	0	2023-05-24 05:29:07	1	2	0	0	0	0	2023-05-24 05:29:07	2023-05-24 05:29:07	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
9	BM-151684911742	15	1	5070	0	0	5070	2	0	2023-05-24 07:02:29	2	26	0	0	0	0	2023-05-24 07:02:29	2023-05-24 07:02:29	\N	0	3	0	\N	0	0	\N	0	\N	0	0	\N	0
10	BM-391684934115	39	6	600	0	0	600	2	0	2023-05-24 13:16:23	1	2	0	0	0	0	2023-05-24 13:16:23	2023-05-24 13:16:23	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
11	BM-391684950574	39	6	200	0	0	200	2	0	2023-05-24 17:49:59	1	2	0	0	0	0	2023-05-24 17:49:59	2023-05-24 17:49:59	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
12	BM-391684959016	39	6	2200	0	0	2200	2	1	2023-05-24 20:10:50	1	22	0	0	0	0	2023-05-24 20:10:50	2023-05-25 05:29:49	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
13	BM-391684999608	39	6	800	0	0	800	2	0	2023-05-25 07:27:15	2	4	0	0	0	0	2023-05-25 07:27:15	2023-05-25 07:27:15	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
14	BM-391685012767	39	6	400	0	0	400	2	0	2023-05-25 11:09:03	1	4	0	0	0	0	2023-05-25 11:09:03	2023-05-25 11:09:03	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
27	BM-151685517746	15	1	960	48	0	1008	2	1	2023-05-31 07:22:34	2	5	0	0	0	0	2023-05-31 07:22:34	2023-05-31 07:22:59	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
23	BM-391685207447	39	6	230	11.5	0	241.5	2	6	2023-05-27 17:11:26	2	2	0	0	0	0	2023-05-27 17:11:26	2023-05-29 16:30:53	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
22	BM-471685122125	47	7	100	0	0	100	2	6	2023-05-26 17:29:07	1	1	0	0	0	0	2023-05-26 17:29:07	2023-05-27 13:20:48	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
18	BM-471685081933	47	7	100	0	0	100	2	0	2023-05-26 06:19:12	1	1	0	0	0	0	2023-05-26 06:19:12	2023-05-26 06:19:12	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
21	BM-471685121873	47	7	125	0	0	125	2	1	2023-05-26 17:24:58	1	1	0	0	0	0	2023-05-26 17:24:58	2023-05-30 06:57:19	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
17	BM-471685080557	47	7	400	0	0	400	2	5	2023-05-26 05:56:24	1	4	0	0	0	0	2023-05-26 05:56:24	2023-05-26 16:14:40	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
19	BM-471685120622	47	7	200	0	0	200	2	0	2023-05-26 17:04:17	1	2	0	0	0	0	2023-05-26 17:04:17	2023-05-26 17:04:17	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
20	BM-471685121595	47	7	300	0	0	300	2	0	2023-05-26 17:20:31	1	1	0	0	0	0	2023-05-26 17:20:31	2023-05-26 17:20:31	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
28	BM-391685528265	39	6	54790	2739.5	0	57529.5	2	6	2023-05-31 10:18:03	2	5047	0	0	0	0	2023-05-31 10:18:03	2023-06-04 09:07:45	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
15	BM-391685035097	39	6	800	0	0	800	2	5	2023-05-25 17:19:00	2	4	0	0	0	0	2023-05-25 17:19:00	2023-05-30 07:04:29	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
24	BM-391685207996	39	6	300	15	0	315	2	6	2023-05-27 17:20:17	1	1	0	0	0	0	2023-05-27 17:20:17	2023-05-29 16:23:49	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
26	BM-391685360435	39	6	300	15	0	315	2	6	2023-05-29 11:40:54	1	1	0	0	0	0	2023-05-29 11:40:54	2023-05-29 16:01:20	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
30	BM-571685536844	57	8	20943	1047.15	0	21997.15	2	0	2023-05-31 12:41:04	2	722	0	0	0	7	2023-05-31 12:41:04	2023-05-31 12:41:04	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
25	BM-391685208543	39	6	300	15	0	315	2	6	2023-05-27 17:29:24	1	1	0	0	0	0	2023-05-27 17:29:24	2023-05-29 16:06:05	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
29	BM-601685536757	60	1	1137.5	56.875	0	1201.375	2	0	2023-05-31 12:39:59	2	40	0	0	0	7	2023-05-31 12:39:59	2023-05-31 12:39:59	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
31	BM-361685569039	36	14	500000	25000	0	525007	2	0	2023-05-31 21:39:13	1	5000	0	0	0	7	2023-05-31 21:39:13	2023-05-31 21:39:13	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
32	BM-361685569484	36	14	300	15	0	322	2	0	2023-05-31 21:45:04	1	12	0	0	0	7	2023-05-31 21:45:04	2023-05-31 21:45:04	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
33	BM-631685574204	63	17	275	13.75	0	295.75	2	0	2023-05-31 23:03:42	1	11	0	0	0	7	2023-05-31 23:03:42	2023-05-31 23:03:42	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
35	BM-571685597510	57	18	375	18.75	0	400.75	2	1	2023-06-01 05:32:09	1	15	0	0	0	7	2023-06-01 05:32:09	2023-06-01 05:35:40	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
34	BM-571685595981	57	8	762.5	38.125	0	807.625	2	3	2023-06-01 05:06:42	1	25	0	0	0	7	2023-06-01 05:06:42	2023-06-01 05:36:09	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
36	BM-151685597762	15	1	11700	585	0	12292	2	1	2023-06-01 05:36:09	1	39	0	0	0	7	2023-06-01 05:36:09	2023-06-01 05:38:20	\N	0	3	0	\N	0	0	\N	0	\N	0	0	\N	0
37	BM-151685612998	15	1	3900	195	0	4102	2	0	2023-06-01 09:50:05	1	13	0	0	0	7	2023-06-01 09:50:05	2023-06-01 09:50:05	\N	0	3	0	\N	0	0	\N	0	\N	0	0	\N	0
38	BM-151685615817	15	1	3900	195	0	4102	2	0	2023-06-01 10:37:04	1	13	0	0	0	7	2023-06-01 10:37:04	2023-06-01 10:37:04	\N	0	3	0	\N	0	0	\N	0	\N	0	0	\N	0
39	BM-151685616762	15	1	3900	195	0	4102	2	3	2023-06-01 10:52:48	1	13	0	0	0	7	2023-06-01 10:52:48	2023-06-06 07:38:57	\N	0	3	0	\N	0	0	\N	0	\N	0	0	\N	0
40	BM-151685616928	15	1	3900	195	0	4102	2	0	2023-06-01 10:55:38	1	13	0	0	0	7	2023-06-01 10:55:38	2023-06-01 10:55:38	\N	0	3	0	\N	0	0	\N	0	\N	0	0	\N	0
41	BM-151685617326	15	1	3900	195	0	4102	2	0	2023-06-01 11:02:13	1	13	0	0	0	7	2023-06-01 11:02:13	2023-06-01 11:02:13	\N	0	3	0	\N	0	0	\N	0	\N	0	0	\N	0
51	BM-361685720952	36	21	275	13.75	0	295.75	2	0	2023-06-02 15:49:29	1	11	0	0	0	7	2023-06-02 15:49:29	2023-06-02 15:49:29	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
42	BM-151685617517	15	1	5070	253.5	0	5330.5	2	1	2023-06-01 11:05:24	2	26	0	0	0	7	2023-06-01 11:05:24	2023-06-01 11:13:15	\N	0	3	0	\N	0	0	\N	0	\N	0	0	\N	0
44	BM-151685619065	15	1	4160	208	0	4375	2	0	2023-06-01 11:31:12	3	39	0	0	0	7	2023-06-01 11:31:12	2023-06-01 11:31:12	\N	0	3	0	\N	0	0	\N	0	\N	0	0	\N	0
45	BM-151685620808	15	1	4160	208	0	4375	2	0	2023-06-01 12:00:15	3	39	0	0	0	7	2023-06-01 12:00:15	2023-06-01 12:00:15	\N	0	3	0	\N	0	0	\N	0	\N	0	0	\N	0
46	BM-151685621360	15	1	2990	149.5	0	3146.5	2	0	2023-06-01 12:09:28	3	39	0	0	0	7	2023-06-01 12:09:28	2023-06-01 12:09:28	\N	0	3	0	\N	0	0	\N	0	\N	0	0	\N	0
52	BM-671685721599	67	23	275	13.75	0	295.75	2	0	2023-06-02 16:00:15	1	11	0	0	0	7	2023-06-02 16:00:15	2023-06-02 16:00:15	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
47	BM-151685621664	15	1	2990	149.5	0	3146.5	2	6	2023-06-01 12:14:32	3	39	0	0	0	7	2023-06-01 12:14:32	2023-06-06 09:53:55	\N	0	3	0	\N	0	0	\N	0	\N	0	0	\N	0
48	BM-391685636267	39	19	640.5	32.025	0	679.525	2	6	2023-06-01 16:18:03	1	21	0	0	0	7	2023-06-01 16:18:03	2023-06-04 08:24:09	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
49	BM-661685659247	66	22	275	13.75	0	295.75	2	0	2023-06-01 22:41:07	1	11	0	0	0	7	2023-06-01 22:41:07	2023-06-01 22:41:07	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
50	BM-361685720805	36	21	300	15	0	322	2	0	2023-06-02 15:47:07	1	12	0	0	0	7	2023-06-02 15:47:07	2023-06-02 15:47:07	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
53	BM-691685724900	69	24	275	13.75	0	295.75	2	0	2023-06-02 16:55:20	1	11	0	0	0	7	2023-06-02 16:55:20	2023-06-02 16:55:20	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
54	BM-691685725934	69	24	275	13.75	0	295.75	2	0	2023-06-02 17:12:31	1	11	0	0	0	7	2023-06-02 17:12:31	2023-06-02 17:12:31	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
55	BM-691685726044	69	24	275	13.75	0	295.75	2	0	2023-06-02 17:14:17	1	11	0	0	0	7	2023-06-02 17:14:17	2023-06-02 17:14:17	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
56	BM-691685726395	69	24	275	13.75	0	295.75	2	0	2023-06-02 17:20:09	1	11	0	0	0	7	2023-06-02 17:20:09	2023-06-02 17:20:09	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
57	BM-701685726602	70	25	275	13.75	0	295.75	2	0	2023-06-02 17:23:35	1	11	0	0	0	7	2023-06-02 17:23:35	2023-06-02 17:23:35	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
58	BM-701685727222	70	25	275	13.75	0	295.75	2	0	2023-06-02 17:33:56	1	11	0	0	0	7	2023-06-02 17:33:56	2023-06-02 17:33:56	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
59	BM-701685727450	70	25	275	13.75	0	295.75	2	0	2023-06-02 17:37:44	1	11	0	0	0	7	2023-06-02 17:37:44	2023-06-02 17:37:44	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
60	BM-701685727875	70	25	275	13.75	0	295.75	2	0	2023-06-02 17:44:50	1	11	0	0	0	7	2023-06-02 17:44:50	2023-06-02 17:44:50	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
61	BM-711685733293	71	26	275	13.75	0	295.75	2	0	2023-06-02 19:15:14	1	11	0	0	0	7	2023-06-02 19:15:14	2023-06-02 19:15:14	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
62	BM-721685743053	72	27	275	13.75	0	295.75	2	0	2023-06-02 21:57:48	1	11	0	0	0	7	2023-06-02 21:57:48	2023-06-02 21:57:48	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
63	BM-691685743693	69	24	275	13.75	0	295.75	2	0	2023-06-02 22:08:29	1	11	0	0	0	7	2023-06-02 22:08:29	2023-06-02 22:08:29	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
64	BM-731685788862	73	35	8485	424.25	0	8916.25	2	0	2023-06-03 10:41:27	3	60	0	0	0	7	2023-06-03 10:41:27	2023-06-03 10:41:27	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
65	BM-571685788984	57	32	8485	424.25	0	8916.25	2	0	2023-06-03 10:43:26	3	60	0	0	0	7	2023-06-03 10:43:26	2023-06-03 10:43:26	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
66	BM-731685789033	73	35	610	30.5	0	647.5	2	0	2023-06-03 10:44:08	1	20	0	0	0	7	2023-06-03 10:44:08	2023-06-03 10:44:08	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
43	BM-151685618937	15	1	1170	58.5	0	1235.5	2	1	2023-06-01 11:29:04	1	13	0	0	0	7	2023-06-01 11:29:04	2023-06-08 05:03:22	\N	0	3	0	\N	0	0	\N	0	\N	0	0	\N	0
67	BM-731685792681	73	36	10860	543	0	11410	2	5	2023-06-03 11:44:55	3	50	0	0	0	7	2023-06-03 11:44:55	2023-06-03 11:58:11	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
69	BM-391685796615	39	19	1006.5	50.325	0	1063.825	2	6	2023-06-03 12:50:40	1	33	0	0	0	7	2023-06-03 12:50:40	2023-06-04 07:53:37	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
70	BM-391685853505	39	19	610	30.5	0	647.5	2	6	2023-06-04 04:38:41	1	20	0	0	0	7	2023-06-04 04:38:41	2023-06-04 06:41:45	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
68	BM-571685793029	57	34	10860	543	0	11410	2	6	2023-06-03 11:50:48	3	50	0	0	0	7	2023-06-03 11:50:48	2023-06-04 07:54:35	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
98	BM-1231686117118	123	49	10000	500	0	10507	2	0	2023-06-07 05:52:15	1	20	0	0	0	7	2023-06-07 05:52:15	2023-06-07 05:52:15	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
79	BM-571685948938	57	37	28500	1425	0	29932	2	5	2023-06-05 07:09:17	4	110	0	0	0	7	2023-06-05 07:09:17	2023-06-05 07:10:48	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
71	BM-391685854328	39	19	6100	305	610	5802	2	6	2023-06-04 04:52:49	1	200	0	0	0	7	2023-06-04 04:52:49	2023-06-04 06:38:21	CODEBP01	1	1	0	\N	0	0	\N	0	\N	0	0	\N	0
72	BM-391685867681	39	19	37500	1875	0	39382	2	0	2023-06-04 08:34:56	1	75	0	0	0	7	2023-06-04 08:34:56	2023-06-04 08:34:56	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
97	BM-821686106577	82	39	108000	5400	0	113407	2	6	2023-06-07 02:56:37	1	900	0	0	0	7	2023-06-07 02:56:37	2023-06-07 06:32:10	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
80	BM-361685964130	36	11	31700	1585	0	33292	2	0	2023-06-05 11:22:33	3	250	0	0	0	7	2023-06-05 11:22:33	2023-06-05 11:22:33	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
95	BM-1231686056250	123	49	10000	500	1000	9507	2	6	2023-06-06 12:57:48	1	20	0	0	0	7	2023-06-06 12:57:48	2023-06-06 12:59:06	CODEBP01	1	1	0	\N	0	0	\N	0	\N	0	0	\N	0
74	BM-391685869433	39	19	610	30.5	0	647.5	2	6	2023-06-04 09:04:09	1	20	0	0	0	7	2023-06-04 09:04:09	2023-06-04 09:31:49	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
89	BM-821686025028	82	39	9315	465.75	0	9787.75	2	5	2023-06-06 04:17:26	1	81	0	0	0	7	2023-06-06 04:17:26	2023-06-06 07:35:03	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
81	BM-941685969960	94	43	29000	1450	2900	27557	2	3	2023-06-05 12:59:40	2	70	0	0	0	7	2023-06-05 12:59:40	2023-06-05 15:16:11	CODEBP01	1	1	0	\N	0	0	\N	0	\N	0	0	\N	0
82	BM-361685992164	36	11	11500	575	0	12082	2	0	2023-06-05 19:09:43	1	23	0	0	0	7	2023-06-05 19:09:43	2023-06-05 19:09:43	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
75	BM-391685870946	39	19	90	4.5	0	101.5	2	6	2023-06-04 09:29:26	1	1	0	0	0	7	2023-06-04 09:29:26	2023-06-04 11:35:49	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
83	BM-671685992168	67	23	10000	500	0	10507	2	0	2023-06-05 19:10:09	1	20	0	0	0	7	2023-06-05 19:10:09	2023-06-05 19:10:09	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
76	BM-391685871778	39	19	7500	375	0	7882	2	6	2023-06-04 09:43:15	1	25	0	0	0	7	2023-06-04 09:43:15	2023-06-04 11:41:50	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
84	BM-361685992520	36	11	4800	240	0	5047	2	0	2023-06-05 19:15:34	1	16	0	0	0	7	2023-06-05 19:15:34	2023-06-05 19:15:34	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
77	BM-571685896182	57	37	885	44.25	0	936.25	2	1	2023-06-04 16:29:58	2	31	0	0	0	7	2023-06-04 16:29:58	2023-06-04 16:30:34	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
78	BM-821685928644	82	39	610	30.5	0	647.5	2	0	2023-06-05 01:31:05	1	20	0	0	0	7	2023-06-05 01:31:05	2023-06-05 01:31:05	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
85	BM-361685992612	36	11	4800	240	0	5047	2	0	2023-06-05 19:17:09	1	16	0	0	0	7	2023-06-05 19:17:09	2023-06-05 19:17:09	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
86	BM-1031686005199	103	45	7800	390	0	8197	2	0	2023-06-05 22:46:53	1	26	0	0	0	7	2023-06-05 22:46:53	2023-06-05 22:46:53	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
87	BM-1041686005267	104	44	4800	240	0	5047	2	0	2023-06-05 22:48:04	1	16	0	0	0	7	2023-06-05 22:48:04	2023-06-05 22:48:04	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
88	BM-1061686008427	106	46	5100	255	0	5362	2	0	2023-06-05 23:40:40	1	17	0	0	0	7	2023-06-05 23:40:40	2023-06-05 23:40:40	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
90	BM-1251686039050	125	47	550000	27500	0	577507	2	0	2023-06-06 08:11:03	1	1100	0	0	0	7	2023-06-06 08:11:03	2023-06-06 08:11:03	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
91	BM-1251686039364	125	47	550000	27500	0	577507	2	0	2023-06-06 08:16:20	1	1100	0	0	0	7	2023-06-06 08:16:20	2023-06-06 08:16:20	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
93	BM-151686044938	15	1	19200	960	0	20167	2	6	2023-06-06 09:49:08	1	64	0	0	0	7	2023-06-06 09:49:08	2023-06-06 09:50:29	\N	0	3	0	\N	0	0	\N	0	\N	0	0	\N	0
92	BM-1261686042791	126	48	17670	883.5	0	18560.5	2	5	2023-06-06 09:13:31	3	137	0	0	0	7	2023-06-06 09:13:31	2023-06-06 09:15:58	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
94	BM-601686049888	60	9	17000	850	0	17857	2	0	2023-06-06 11:11:44	2	71	0	0	0	7	2023-06-06 11:11:44	2023-06-06 11:11:44	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
96	BM-1321686069682	132	50	7800	390	0	8197	2	0	2023-06-06 16:41:35	1	26	0	0	0	7	2023-06-06 16:41:35	2023-06-06 16:41:35	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
100	BM-1051686119777	105	56	82650	4132.5	0	86789.5	2	0	2023-06-07 06:36:29	2	576	0	0	0	7	2023-06-07 06:36:29	2023-06-07 06:36:29	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
99	BM-1231686117388	123	49	61975	3098.75	0	65080.75	2	3	2023-06-07 05:56:45	3	615	0	0	0	7	2023-06-07 05:56:45	2023-06-07 05:58:23	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
101	BM-361686128405	36	51	18300	915	0	19222	2	0	2023-06-07 09:00:18	2	47	0	0	0	7	2023-06-07 09:00:18	2023-06-07 09:00:18	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
102	BM-891686128596	89	57	10000	500	0	10507	2	0	2023-06-07 09:03:32	1	20	0	0	0	7	2023-06-07 09:03:32	2023-06-07 09:03:32	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
103	BM-1391686128647	139	58	7800	390	0	8197	2	0	2023-06-07 09:04:26	1	26	0	0	0	7	2023-06-07 09:04:26	2023-06-07 09:04:26	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
104	BM-1241686128996	124	59	10500	525	0	11032	2	0	2023-06-07 09:10:12	1	21	0	0	0	7	2023-06-07 09:10:12	2023-06-07 09:10:12	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
73	BM-391685867860	39	19	250	12.5	0	269.5	2	6	2023-06-04 08:37:55	1	10	0	0	0	7	2023-06-04 08:37:55	2023-06-08 09:45:02	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
105	BM-1241686129461	124	59	10500	525	0	11032	2	0	2023-06-07 09:17:56	1	21	0	0	0	7	2023-06-07 09:17:56	2023-06-07 09:17:56	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
106	BM-1241686129610	124	59	7150	357.5	0	7514.5	2	0	2023-06-07 09:20:24	1	55	0	0	0	7	2023-06-07 09:20:24	2023-06-07 09:20:24	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
117	BM-1201686201307	120	74	26500	1325	0	27832	2	0	2023-06-08 05:15:24	2	75	0	0	0	7	2023-06-08 05:15:24	2023-06-08 05:15:24	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
118	BM-601686202256	60	72	21000	1050	0	22057	2	0	2023-06-08 05:32:51	2	70	0	0	0	7	2023-06-08 05:32:51	2023-06-08 05:32:51	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
107	BM-601686144437	60	54	15435	771.75	0	16213.75	2	6	2023-06-07 13:27:33	2	94	0	0	0	7	2023-06-07 13:27:33	2023-06-07 13:33:14	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
108	BM-361686175518	36	66	166200	8310	0	174517	2	0	2023-06-07 22:05:32	4	540	0	0	0	7	2023-06-07 22:05:32	2023-06-07 22:05:32	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
131	BM-1051686251940	105	89	18800	940	0	19747	2	6	2023-06-08 19:19:18	3	126	0	0	0	7	2023-06-08 19:19:18	2023-06-09 03:18:11	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
109	BM-361686177905	36	66	7800	390	0	8197	2	1	2023-06-07 22:45:21	1	26	0	0	0	7	2023-06-07 22:45:21	2023-06-07 22:45:47	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
119	BM-1341686203542	134	1	7500	375	0	7882	2	1	2023-06-08 05:52:29	1	25	0	0	0	7	2023-06-08 05:52:29	2023-06-08 05:53:14	\N	0	3	0	\N	0	0	\N	0	\N	0	0	\N	0
120	BM-1201686203897	120	74	17500	875	0	18382	2	0	2023-06-08 05:59:01	2	45	0	0	0	7	2023-06-08 05:59:01	2023-06-08 05:59:01	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
110	BM-1411686178103	141	67	7800	390	0	8197	2	5	2023-06-07 22:48:37	1	26	0	0	0	7	2023-06-07 22:48:37	2023-06-07 23:04:36	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
111	BM-1421686181192	142	68	65000	3250	0	68257	2	0	2023-06-07 23:40:05	1	500	0	0	0	7	2023-06-07 23:40:05	2023-06-07 23:40:05	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
112	BM-821686192413	82	39	6630	331.5	0	6968.5	2	0	2023-06-08 02:47:17	1	51	0	0	0	7	2023-06-08 02:47:17	2023-06-08 02:47:17	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
113	BM-1261686193782	126	69	7500	375	0	7882	2	1	2023-06-08 03:10:00	1	25	0	0	0	7	2023-06-08 03:10:00	2023-06-08 04:53:18	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
114	BM-1341686200682	134	1	7500	375	0	7882	2	0	2023-06-08 05:04:53	1	25	0	0	0	7	2023-06-08 05:04:53	2023-06-08 05:04:53	\N	0	3	0	\N	0	0	\N	0	\N	0	0	\N	0
115	BM-1341686200716	134	1	7500	375	0	7882	2	0	2023-06-08 05:05:22	1	25	0	0	0	7	2023-06-08 05:05:22	2023-06-08 05:05:22	\N	0	3	0	\N	0	0	\N	0	\N	0	0	\N	0
116	BM-1341686200873	134	1	7500	375	0	7882	2	0	2023-06-08 05:08:00	1	25	0	0	0	7	2023-06-08 05:08:00	2023-06-08 05:08:00	\N	0	3	0	\N	0	0	\N	0	\N	0	0	\N	0
121	BM-1271686205450	127	75	20000	1000	0	21007	2	0	2023-06-08 06:24:32	1	200	0	0	0	7	2023-06-08 06:24:32	2023-06-08 06:24:32	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
122	BM-1271686205646	127	75	7500	375	0	7882	2	0	2023-06-08 06:27:44	1	25	0	0	0	7	2023-06-08 06:27:44	2023-06-08 06:27:44	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
123	BM-1161686209384	116	77	25000	1250	0	26257	2	0	2023-06-08 07:30:03	4	115	0	0	0	7	2023-06-08 07:30:03	2023-06-08 07:30:03	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
124	BM-1161686210205	116	77	7475	373.75	0	7855.75	2	0	2023-06-08 07:43:56	1	65	0	0	0	7	2023-06-08 07:43:56	2023-06-08 07:43:56	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
125	BM-1161686210362	116	77	6500	325	0	6832	2	0	2023-06-08 07:46:30	1	50	0	0	0	7	2023-06-08 07:46:30	2023-06-08 07:46:30	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
129	BM-831686228729	83	53	6500	325	0	6832	2	1	2023-06-08 12:52:30	1	50	0	0	0	7	2023-06-08 12:52:30	2023-06-08 12:52:39	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
130	BM-1071686241672	107	87	12090	604.5	0	12701.5	2	0	2023-06-08 16:28:07	2	116	0	0	0	7	2023-06-08 16:28:07	2023-06-08 16:28:07	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
126	BM-1441686214120	144	78	218000	10900	0	228907	2	6	2023-06-08 08:48:59	2	2200	0	0	0	7	2023-06-08 08:48:59	2023-06-08 08:51:48	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
127	BM-1451686226451	145	83	6500	325	0	6832	2	0	2023-06-08 12:14:27	1	50	0	0	0	7	2023-06-08 12:14:27	2023-06-08 12:14:27	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
128	BM-601686228576	60	73	14975	748.75	0	15730.75	2	3	2023-06-08 12:49:51	2	90	0	0	0	7	2023-06-08 12:49:51	2023-06-08 12:50:49	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
132	BM-1471686568435	147	91	7500	375	0	7882	2	0	2023-06-12 11:14:13	1	25	0	0	0	7	2023-06-12 11:14:13	2023-06-12 11:14:13	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
133	BM-1231686570176	123	49	34910	1745.5	2891	33771.5	2	0	2023-06-12 11:43:27	4	244	0	0	0	7	2023-06-12 11:43:27	2023-06-12 11:43:27	CODEBP01	1	1	0	\N	0	0	\N	0	\N	0	0	\N	0
134	BM-361686821887	36	65	72630	3631.5	0	76268.5	2	0	2023-06-15 09:38:27	2	526	0	0	0	7	2023-06-15 09:38:27	2023-06-15 09:38:27	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
135	BM-361686821989	36	65	7800	390	0	8197	2	0	2023-06-15 09:40:05	1	26	0	0	0	7	2023-06-15 09:40:05	2023-06-15 09:40:05	\N	0	1	0	\N	0	0	\N	0	\N	0	0	\N	0
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: payment_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_report (id, transaction_id, payment_status, user_id, ref_id, amount, method_type, vat, wallet_amount_used, created_at, updated_at, payment_response) FROM stdin;
1	BM-151684562364	I	15	pi_3N9ip6BjsMxFtgBe1V4lsMYg	1000.00	1	0.00	0.00	2023-05-20 05:59:25	2023-05-20 05:59:36	\N
2	BM-151684574944	I	15	pi_3N9m60BjsMxFtgBe0aNoKxZE	3900.00	1	0.00	0.00	2023-05-20 09:29:04	2023-05-20 09:29:13	\N
3	BM-151684575632	I	15	pi_3N9mH7BjsMxFtgBe1mtxj6tx	3900.00	1	0.00	0.00	2023-05-20 09:40:33	2023-05-20 09:40:39	\N
4	BM-151684575850	I	15	pi_3N9mKcBjsMxFtgBe19rNdejt	3900.00	1	0.00	0.00	2023-05-20 09:44:10	2023-05-20 09:44:20	\N
5	BM-151684728113	I	15	pi_3NAPwUBjsMxFtgBe0WSaaXqz	3900.00	1	0.00	0.00	2023-05-22 04:01:54	2023-05-22 04:02:01	\N
6	BM-151684834612	P	15	pi_3NAreCBjsMxFtgBe1sVd6Lb1	7800.00	1	0.00	0.00	2023-05-23 09:36:52	\N	\N
7	BM-151684834648	P	15	pi_3NAremBjsMxFtgBe012ry07R	7800.00	1	0.00	0.00	2023-05-23 09:37:29	\N	\N
8	BM-151684834814	P	15	pi_3NArhSBjsMxFtgBe1puxup2W	7800.00	1	0.00	0.00	2023-05-23 09:40:14	\N	\N
9	BM-151684834874	I	15	pi_3NAriQBjsMxFtgBe1moePPl3	7800.00	1	0.00	0.00	2023-05-23 09:41:14	2023-05-23 09:41:34	\N
10	BM-151684848679	I	15	pi_3NAvJ6BjsMxFtgBe1jN44Npq	1500.00	1	0.00	0.00	2023-05-23 13:31:20	2023-05-23 13:33:16	\N
11	BM-151684906120	I	15	pi_3NBAFYBjsMxFtgBe1aL1GLN4	600.00	1	0.00	0.00	2023-05-24 05:28:40	2023-05-24 05:29:07	\N
12	BM-151684911742	I	15	pi_3NBBiEBjsMxFtgBe0zr1x2kn	5070.00	1	0.00	0.00	2023-05-24 07:02:22	2023-05-24 07:02:29	\N
13	BM-391684932300	P	39	pi_3NBH3oBjsMxFtgBe045LP9T3	600.00	1	0.00	0.00	2023-05-24 12:45:01	\N	\N
14	BM-391684932329	P	39	pi_3NBH4HBjsMxFtgBe14ubHIT0	600.00	1	0.00	0.00	2023-05-24 12:45:29	\N	\N
15	BM-391684934115	I	39	pi_3NBHX5BjsMxFtgBe0077t6FH	600.00	1	0.00	0.00	2023-05-24 13:15:15	2023-05-24 13:16:23	\N
16	BM-391684950574	I	39	pi_3NBLoYBjsMxFtgBe1ALvfmmP	200.00	1	0.00	0.00	2023-05-24 17:49:34	2023-05-24 17:49:59	\N
17	BM-391684959016	I	39	pi_3NBO0jBjsMxFtgBe1wFwehgc	2200.00	1	0.00	0.00	2023-05-24 20:10:17	2023-05-24 20:10:50	\N
18	BM-391684969180	P	39	pi_3NBQeeBjsMxFtgBe1wV5OoMi	200.00	1	0.00	0.00	2023-05-24 22:59:41	\N	\N
19	BM-391684969236	P	39	pi_3NBQfYBjsMxFtgBe1iqPcQ3F	200.00	1	0.00	0.00	2023-05-24 23:00:36	\N	\N
20	BM-391684969404	P	39	pi_3NBQiHBjsMxFtgBe1XkpXR7X	200.00	1	0.00	0.00	2023-05-24 23:03:25	\N	\N
21	BM-391684999608	I	39	pi_3NBYZRBjsMxFtgBe0QNlYapx	800.00	1	0.00	0.00	2023-05-25 07:26:49	2023-05-25 07:27:15	\N
22	BM-391685012767	I	39	pi_3NBbzfBjsMxFtgBe0314Fvwj	400.00	1	0.00	0.00	2023-05-25 11:06:07	2023-05-25 11:09:03	\N
23	BM-391685035097	I	39	pi_3NBhnpBjsMxFtgBe1eIbRd8J	800.00	1	0.00	0.00	2023-05-25 17:18:17	2023-05-25 17:19:00	\N
24	BM-391685035830	I	39	pi_3NBhzfBjsMxFtgBe1ENDecUb	300.00	1	0.00	0.00	2023-05-25 17:30:31	2023-05-25 17:31:27	\N
25	BM-471685080557	I	47	pi_3NBtd4BjsMxFtgBe1tQ8Yacr	400.00	1	0.00	0.00	2023-05-26 05:55:58	2023-05-26 05:56:24	\N
26	BM-471685081933	I	47	pi_3NBtzFBjsMxFtgBe10gKqwIt	100.00	1	0.00	0.00	2023-05-26 06:18:54	2023-05-26 06:19:12	\N
27	BM-471685120622	I	47	pi_3NC43GBjsMxFtgBe1YuzZfxr	200.00	1	0.00	0.00	2023-05-26 17:03:42	2023-05-26 17:04:17	\N
28	BM-471685121595	I	47	pi_3NC4IxBjsMxFtgBe0GYDlO58	300.00	1	0.00	0.00	2023-05-26 17:19:55	2023-05-26 17:20:31	\N
29	BM-471685121873	I	47	pi_3NC4NRBjsMxFtgBe11IbDXVc	125.00	1	0.00	0.00	2023-05-26 17:24:33	2023-05-26 17:24:58	\N
30	BM-471685122125	I	47	pi_3NC4RVBjsMxFtgBe1hjG1iZn	100.00	1	0.00	0.00	2023-05-26 17:28:45	2023-05-26 17:29:07	\N
31	BM-391685207447	I	39	pi_3NCQdfBjsMxFtgBe0vJLmGNW	241.50	1	11.50	0.00	2023-05-27 17:10:47	2023-05-27 17:11:26	\N
32	BM-391685207996	I	39	pi_3NCQmXBjsMxFtgBe1Nk0SEHY	315.00	1	15.00	0.00	2023-05-27 17:19:57	2023-05-27 17:20:17	\N
33	BM-391685208543	I	39	pi_3NCQvLBjsMxFtgBe1Lx76JfT	315.00	1	15.00	0.00	2023-05-27 17:29:03	2023-05-27 17:29:24	\N
34	BM-391685360435	I	39	pi_3ND4RDBjsMxFtgBe0WhU6GVW	315.00	1	15.00	0.00	2023-05-29 11:40:35	2023-05-29 11:40:54	\N
35	BM-151685517746	I	15	pi_3NDjMUBjsMxFtgBe0zeqnkX3	1008.00	1	48.00	0.00	2023-05-31 07:22:26	2023-05-31 07:22:34	\N
36	BM-391685528265	I	39	pi_3NDm6ABjsMxFtgBe1vPETWQu	57529.50	1	2739.50	0.00	2023-05-31 10:17:46	2023-05-31 10:18:03	\N
37	BM-151685534162	P	15	pi_3NDndHBjsMxFtgBe1s2x8ovR	8197.00	1	390.00	0.00	2023-05-31 11:56:03	\N	\N
38	BM-151685534169	P	15	pi_3NDndNBjsMxFtgBe0ROsSpga	8197.00	1	390.00	0.00	2023-05-31 11:56:09	\N	\N
39	BM-471685535808	P	47	pi_3NDo3oBjsMxFtgBe1ttfXRB6	295.75	1	13.75	0.00	2023-05-31 12:23:28	\N	\N
40	BM-391685536651	P	39	pi_3NDoHPBjsMxFtgBe0R6t8SI4	52612.00	1	2505.00	0.00	2023-05-31 12:37:31	\N	\N
42	BM-391685536798	P	39	pi_3NDoJmBjsMxFtgBe0xGTPXpn	679.53	1	32.03	0.00	2023-05-31 12:39:59	\N	\N
41	BM-601685536757	I	60	pi_3NDoJ7BjsMxFtgBe0pPgxOot	1201.38	1	56.88	0.00	2023-05-31 12:39:17	2023-05-31 12:39:59	\N
44	BM-391685536861	P	39	pi_3NDoKnBjsMxFtgBe19QkBNt4	262507.00	1	12500.00	0.00	2023-05-31 12:41:02	\N	\N
43	BM-571685536844	I	57	pi_3NDoKWBjsMxFtgBe1QjSFVjD	21997.15	1	1047.15	0.00	2023-05-31 12:40:45	2023-05-31 12:41:04	\N
45	BM-391685549188	P	39	pi_3NDrXcBjsMxFtgBe1afG8hD4	1288.00	1	61.00	0.00	2023-05-31 16:06:28	\N	\N
46	BM-361685568449	P	36	pi_3NDwYHBjsMxFtgBe1VBx2aqN	525007.00	1	25000.00	0.00	2023-05-31 21:27:29	\N	\N
47	BM-361685569039	I	36	pi_3NDwhoBjsMxFtgBe09ptKWxq	525007.00	1	25000.00	0.00	2023-05-31 21:37:20	2023-05-31 21:39:13	\N
48	BM-361685569271	P	36	pi_3NDwlYBjsMxFtgBe0uIYiFbd	322.00	1	15.00	0.00	2023-05-31 21:41:12	\N	\N
49	BM-361685569320	P	36	pi_3NDwmKBjsMxFtgBe0w7xpMKj	322.00	1	15.00	0.00	2023-05-31 21:42:00	\N	\N
50	BM-361685569451	P	36	pi_3NDwoSBjsMxFtgBe1D8pCTGw	322.00	1	15.00	0.00	2023-05-31 21:44:12	\N	\N
51	BM-361685569473	P	36	pi_3NDwonBjsMxFtgBe0cJzx4Zy	322.00	1	15.00	0.00	2023-05-31 21:44:33	\N	\N
52	BM-361685569484	I	36	pi_3NDwoyBjsMxFtgBe09DLqYOB	322.00	1	15.00	0.00	2023-05-31 21:44:44	2023-05-31 21:45:04	\N
53	BM-361685573478	P	36	pi_3NDxrOBjsMxFtgBe0VvakEKe	295.75	1	13.75	0.00	2023-05-31 22:51:18	\N	\N
54	BM-361685573485	P	36	pi_3NDxrVBjsMxFtgBe0KiO3PvG	295.75	1	13.75	0.00	2023-05-31 22:51:25	\N	\N
55	BM-361685573489	P	36	pi_3NDxrZBjsMxFtgBe1emBVPrZ	295.75	1	13.75	0.00	2023-05-31 22:51:30	\N	\N
56	BM-631685574204	I	63	pi_3NDy36BjsMxFtgBe0N5Bk95b	295.75	1	13.75	0.00	2023-05-31 23:03:24	2023-05-31 23:03:42	\N
57	BM-571685595981	I	57	pi_3NE3iMBjsMxFtgBe01hUEtg1	807.63	1	38.13	0.00	2023-06-01 05:06:22	2023-06-01 05:06:42	\N
58	BM-571685597510	I	57	pi_3NE470BjsMxFtgBe0KU51dEo	400.75	1	18.75	0.00	2023-06-01 05:31:50	2023-06-01 05:32:09	\N
59	BM-151685597762	I	15	pi_3NE4B4BjsMxFtgBe1iHRR52I	12292.00	1	585.00	0.00	2023-06-01 05:36:02	2023-06-01 05:36:09	\N
60	BM-151685612998	I	15	pi_3NE88oBjsMxFtgBe1qedv7xf	4102.00	1	195.00	0.00	2023-06-01 09:49:59	2023-06-01 09:50:05	\N
61	BM-151685615817	I	15	pi_3NE8sHBjsMxFtgBe1Gbkhhkm	4102.00	1	195.00	0.00	2023-06-01 10:36:57	2023-06-01 10:37:04	\N
62	BM-151685616762	I	15	pi_3NE97WBjsMxFtgBe1rVu0EP6	4102.00	1	195.00	0.00	2023-06-01 10:52:42	2023-06-01 10:52:48	\N
63	BM-151685616928	I	15	pi_3NE9ACBjsMxFtgBe1tq2RXoX	4102.00	1	195.00	0.00	2023-06-01 10:55:29	2023-06-01 10:55:38	\N
64	BM-151685617326	I	15	pi_3NE9GcBjsMxFtgBe0gsaa2K2	4102.00	1	195.00	0.00	2023-06-01 11:02:06	2023-06-01 11:02:13	\N
65	BM-151685617517	I	15	pi_3NE9JhBjsMxFtgBe1dYUyn70	5330.50	1	253.50	0.00	2023-06-01 11:05:17	2023-06-01 11:05:24	\N
66	BM-151685618937	I	15	pi_3NE9gbBjsMxFtgBe1prej2Ng	1235.50	1	58.50	0.00	2023-06-01 11:28:57	2023-06-01 11:29:04	\N
67	BM-151685619065	I	15	pi_3NE9igBjsMxFtgBe0D36E3oj	4375.00	1	208.00	0.00	2023-06-01 11:31:06	2023-06-01 11:31:12	\N
68	BM-151685619588	P	15	pi_3NE9r6BjsMxFtgBe1x3xSH5K	4375.00	1	208.00	0.00	2023-06-01 11:39:48	\N	\N
69	BM-151685620633	P	15	pi_3NEA7xBjsMxFtgBe18IYMd4t	4375.00	1	208.00	0.00	2023-06-01 11:57:14	\N	\N
70	BM-151685620808	I	15	pi_3NEAAmBjsMxFtgBe0WrOQgfF	4375.00	1	208.00	0.00	2023-06-01 12:00:08	2023-06-01 12:00:15	\N
71	BM-151685621360	I	15	pi_3NEAJgBjsMxFtgBe188LcyXC	3146.50	1	149.50	0.00	2023-06-01 12:09:20	2023-06-01 12:09:28	\N
72	BM-151685621664	I	15	pi_3NEAOaBjsMxFtgBe1rzVu1z8	3146.50	1	149.50	0.00	2023-06-01 12:14:24	2023-06-01 12:14:32	\N
73	BM-391685636267	I	39	pi_3NEEC7BjsMxFtgBe11LQcEFw	679.53	1	32.03	0.00	2023-06-01 16:17:47	2023-06-01 16:18:03	\N
74	BM-661685659247	I	66	pi_3NEKAlBjsMxFtgBe1G91OHcn	295.75	1	13.75	0.00	2023-06-01 22:40:47	2023-06-01 22:41:07	\N
75	BM-361685720805	I	36	pi_3NEaBdBjsMxFtgBe1N89HIGu	322.00	1	15.00	0.00	2023-06-02 15:46:45	2023-06-02 15:47:07	\N
76	BM-361685720952	I	36	pi_3NEaE0BjsMxFtgBe0i4vrJ37	295.75	1	13.75	0.00	2023-06-02 15:49:13	2023-06-02 15:49:29	\N
77	BM-671685721599	I	67	pi_3NEaORBjsMxFtgBe0cHQcBr6	295.75	1	13.75	0.00	2023-06-02 15:59:59	2023-06-02 16:00:15	\N
78	BM-691685724900	I	69	pi_3NEbFgBjsMxFtgBe0GIDaXIc	295.75	1	13.75	0.00	2023-06-02 16:55:00	2023-06-02 16:55:20	\N
79	BM-691685725934	I	69	pi_3NEbWMBjsMxFtgBe0NRlRZHJ	295.75	1	13.75	0.00	2023-06-02 17:12:14	2023-06-02 17:12:31	\N
80	BM-691685726044	I	69	pi_3NEbY8BjsMxFtgBe1VbQw4Rh	295.75	1	13.75	0.00	2023-06-02 17:14:04	2023-06-02 17:14:17	\N
81	BM-691685726395	I	69	pi_3NEbdnBjsMxFtgBe05iCwBJL	295.75	1	13.75	0.00	2023-06-02 17:19:56	2023-06-02 17:20:09	\N
82	BM-701685726602	I	70	pi_3NEbh8BjsMxFtgBe0zqeh6oV	295.75	1	13.75	0.00	2023-06-02 17:23:22	2023-06-02 17:23:35	\N
83	BM-701685727222	I	70	pi_3NEbr9BjsMxFtgBe0jbEg4nw	295.75	1	13.75	0.00	2023-06-02 17:33:43	2023-06-02 17:33:56	\N
84	BM-701685727450	I	70	pi_3NEbupBjsMxFtgBe0c8jurx7	295.75	1	13.75	0.00	2023-06-02 17:37:31	2023-06-02 17:37:44	\N
85	BM-701685727875	I	70	pi_3NEc1gBjsMxFtgBe1nifzvDK	295.75	1	13.75	0.00	2023-06-02 17:44:36	2023-06-02 17:44:50	\N
86	BM-711685733293	I	71	pi_3NEdR3BjsMxFtgBe0dLbEnyu	295.75	1	13.75	0.00	2023-06-02 19:14:54	2023-06-02 19:15:14	\N
87	BM-721685743053	I	72	pi_3NEfyUBjsMxFtgBe1nATN3nV	295.75	1	13.75	0.00	2023-06-02 21:57:34	2023-06-02 21:57:48	\N
88	BM-691685743693	I	69	pi_3NEg8nBjsMxFtgBe1jyVxIwW	295.75	1	13.75	0.00	2023-06-02 22:08:13	2023-06-02 22:08:29	\N
89	BM-731685788862	I	73	pi_3NErtKBjsMxFtgBe0dCwfKnA	8916.25	1	424.25	0.00	2023-06-03 10:41:03	2023-06-03 10:41:27	\N
90	BM-571685788984	I	57	pi_3NErvIBjsMxFtgBe0QszQ02H	8916.25	1	424.25	0.00	2023-06-03 10:43:04	2023-06-03 10:43:26	\N
91	BM-731685789033	I	73	pi_3NErw5BjsMxFtgBe0RMJoCbW	647.50	1	30.50	0.00	2023-06-03 10:43:53	2023-06-03 10:44:08	\N
92	BM-731685792681	I	73	pi_3NEssvBjsMxFtgBe0PbuzB7j	11410.00	1	543.00	0.00	2023-06-03 11:44:41	2023-06-03 11:44:55	\N
93	BM-571685793029	I	57	pi_3NEsyXBjsMxFtgBe1BfRH1ej	11410.00	1	543.00	0.00	2023-06-03 11:50:29	2023-06-03 11:50:48	\N
94	BM-391685796615	I	39	pi_3NEtuNBjsMxFtgBe0biKa4nY	1063.83	1	50.33	0.00	2023-06-03 12:50:15	2023-06-03 12:50:40	\N
95	BM-391685853505	I	39	pi_3NF8hxBjsMxFtgBe0zLVbYqW	647.50	1	30.50	0.00	2023-06-04 04:38:25	2023-06-04 04:38:41	\N
96	BM-391685854297	P	39	pi_3NF8ukBjsMxFtgBe1g875AMo	6412.00	1	305.00	0.00	2023-06-04 04:51:38	\N	\N
97	BM-391685854318	P	39	pi_3NF8v4BjsMxFtgBe1qlRGeDX	6412.00	1	305.00	0.00	2023-06-04 04:51:58	\N	\N
98	BM-391685854328	I	39	pi_3NF8vEBjsMxFtgBe1bmxaJFe	5802.00	1	305.00	0.00	2023-06-04 04:52:08	2023-06-04 04:52:49	\N
99	BM-391685854491	P	39	pi_3NF8xrBjsMxFtgBe1EREdjsA	39382.00	1	1875.00	0.00	2023-06-04 04:54:51	\N	\N
100	BM-391685867681	I	39	pi_3NFCObBjsMxFtgBe0y5pm1s8	39382.00	1	1875.00	0.00	2023-06-04 08:34:41	2023-06-04 08:34:56	\N
101	BM-391685867860	I	39	pi_3NFCRVBjsMxFtgBe1zlOT9lG	269.50	1	12.50	0.00	2023-06-04 08:37:41	2023-06-04 08:37:55	\N
102	BM-391685869433	I	39	pi_3NFCqsBjsMxFtgBe0YZAlUP0	647.50	1	30.50	0.00	2023-06-04 09:03:54	2023-06-04 09:04:09	\N
103	BM-391685870946	I	39	pi_3NFDFGBjsMxFtgBe0gPaEkqo	101.50	1	4.50	0.00	2023-06-04 09:29:06	2023-06-04 09:29:26	\N
104	BM-391685871778	I	39	pi_3NFDSgBjsMxFtgBe0KUbbe49	7882.00	1	375.00	0.00	2023-06-04 09:42:58	2023-06-04 09:43:15	\N
105	BM-571685895840	P	57	pi_3NFJimBjsMxFtgBe1JMOfaNw	1041.25	1	49.25	0.00	2023-06-04 16:24:00	\N	\N
106	BM-571685896182	I	57	pi_3NFJoJBjsMxFtgBe00zAFyqJ	936.25	1	44.25	0.00	2023-06-04 16:29:43	2023-06-04 16:29:58	\N
107	BM-821685928644	I	82	pi_3NFSFsBjsMxFtgBe0hnNdmGt	647.50	1	30.50	0.00	2023-06-05 01:30:44	2023-06-05 01:31:05	\N
108	BM-821685939505	P	82	pi_3NFV53BjsMxFtgBe1wqC0ylq	9667.00	1	460.00	0.00	2023-06-05 04:31:46	\N	\N
109	BM-391685942108	P	39	pi_3NFVl3BjsMxFtgBe199goEMM	10507.00	1	500.00	0.00	2023-06-05 05:15:09	\N	\N
110	BM-571685948938	I	57	pi_3NFXXCBjsMxFtgBe09y1L01m	29932.00	1	1425.00	0.00	2023-06-05 07:08:59	2023-06-05 07:09:17	\N
111	BM-361685964072	P	36	pi_3NFbTIBjsMxFtgBe0S8ClIeK	5677.00	1	270.00	0.00	2023-06-05 11:21:12	\N	\N
112	BM-361685964130	I	36	pi_3NFbUEBjsMxFtgBe07A3JzX7	33292.00	1	1585.00	0.00	2023-06-05 11:22:11	2023-06-05 11:22:33	\N
113	BM-941685969960	I	94	pi_3NFd0GBjsMxFtgBe1wuJ8Cl1	27557.00	1	1450.00	0.00	2023-06-05 12:59:20	2023-06-05 12:59:40	\N
114	BM-361685992164	I	36	pi_3NFimOBjsMxFtgBe0hBIZC33	12082.00	1	575.00	0.00	2023-06-05 19:09:25	2023-06-05 19:09:43	\N
115	BM-671685992168	I	67	pi_3NFimTBjsMxFtgBe1ebIoOgp	10507.00	1	500.00	0.00	2023-06-05 19:09:29	2023-06-05 19:10:09	\N
116	BM-361685992520	I	36	pi_3NFis8BjsMxFtgBe0hJsLvzL	5047.00	1	240.00	0.00	2023-06-05 19:15:20	2023-06-05 19:15:34	\N
117	BM-361685992612	I	36	pi_3NFitcBjsMxFtgBe0OKV8DgP	5047.00	1	240.00	0.00	2023-06-05 19:16:52	2023-06-05 19:17:09	\N
118	BM-361685993312	P	36	pi_3NFj4uBjsMxFtgBe0AKZ6Iof	11032.00	1	525.00	0.00	2023-06-05 19:28:32	\N	\N
119	BM-1031686005199	I	103	pi_3NFmAdBjsMxFtgBe1xIxgT2Z	8197.00	1	390.00	0.00	2023-06-05 22:46:39	2023-06-05 22:46:53	\N
120	BM-1041686005267	I	104	pi_3NFmBjBjsMxFtgBe0Rq5pcHC	5047.00	1	240.00	0.00	2023-06-05 22:47:48	2023-06-05 22:48:04	\N
121	BM-1061686008427	I	106	pi_3NFn0hBjsMxFtgBe1PbqleD4	5362.00	1	255.00	0.00	2023-06-05 23:40:28	2023-06-05 23:40:40	\N
122	BM-821686025028	I	82	pi_3NFrKTBjsMxFtgBe0YHBAdL8	9787.75	1	465.75	0.00	2023-06-06 04:17:09	2023-06-06 04:17:26	\N
123	BM-1251686039050	I	125	pi_3NFuycBjsMxFtgBe1L8vfs1a	577507.00	1	27500.00	0.00	2023-06-06 08:10:51	2023-06-06 08:11:03	\N
124	BM-1251686039364	I	125	pi_3NFv3gBjsMxFtgBe0uXRCUf8	577507.00	1	27500.00	0.00	2023-06-06 08:16:05	2023-06-06 08:16:20	\N
125	BM-1261686042791	I	126	pi_3NFvwxBjsMxFtgBe0xxG5F17	18560.50	1	883.50	0.00	2023-06-06 09:13:11	2023-06-06 09:13:31	\N
126	BM-151686044938	I	15	pi_3NFwVaBjsMxFtgBe0KlPxU2I	20167.00	1	960.00	0.00	2023-06-06 09:48:58	2023-06-06 09:49:08	\N
127	BM-601686049888	I	60	pi_3NFxnRBjsMxFtgBe1WAtnZLy	17857.00	1	850.00	0.00	2023-06-06 11:11:29	2023-06-06 11:11:44	\N
128	BM-1231686056250	I	123	pi_3NFzS2BjsMxFtgBe1p9sOkAZ	9507.00	1	500.00	0.00	2023-06-06 12:57:30	2023-06-06 12:57:48	\N
129	BM-1321686069682	I	132	pi_3NG2whBjsMxFtgBe0lJsjkcR	8197.00	1	390.00	0.00	2023-06-06 16:41:23	2023-06-06 16:41:35	\N
130	BM-821686106577	I	82	pi_3NGCXlBjsMxFtgBe08OpmvG0	113407.00	1	5400.00	0.00	2023-06-07 02:56:18	2023-06-07 02:56:37	\N
131	BM-831686116989	P	83	pi_3NGFFhBjsMxFtgBe1zSFERNQ	15682.00	1	825.00	0.00	2023-06-07 05:49:50	\N	\N
132	BM-1231686117118	I	123	pi_3NGFHnBjsMxFtgBe0RgdCh31	10507.00	1	500.00	0.00	2023-06-07 05:51:59	2023-06-07 05:52:15	\N
133	BM-1231686117388	I	123	pi_3NGFM8BjsMxFtgBe1pzxHL7K	65080.75	1	3098.75	0.00	2023-06-07 05:56:28	2023-06-07 05:56:45	\N
134	BM-1051686119777	I	105	pi_3NGFyfBjsMxFtgBe1wkWi0Qd	86789.50	1	4132.50	0.00	2023-06-07 06:36:17	2023-06-07 06:36:29	\N
135	BM-361686128405	I	36	pi_3NGIDpBjsMxFtgBe0rtaeDLG	19222.00	1	915.00	0.00	2023-06-07 09:00:05	2023-06-07 09:00:18	\N
136	BM-891686128596	I	89	pi_3NGIGuBjsMxFtgBe0mpLpqmi	10507.00	1	500.00	0.00	2023-06-07 09:03:17	2023-06-07 09:03:32	\N
137	BM-1391686128647	I	139	pi_3NGIHjBjsMxFtgBe1hVxHmX7	8197.00	1	390.00	0.00	2023-06-07 09:04:07	2023-06-07 09:04:26	\N
138	BM-1241686128996	I	124	pi_3NGINMBjsMxFtgBe0lPMXkYr	11032.00	1	525.00	0.00	2023-06-07 09:09:56	2023-06-07 09:10:12	\N
139	BM-1241686129461	I	124	pi_3NGIUsBjsMxFtgBe0ZWaDm1T	11032.00	1	525.00	0.00	2023-06-07 09:17:42	2023-06-07 09:17:56	\N
140	BM-1241686129610	I	124	pi_3NGIXGBjsMxFtgBe0D9z52bU	7514.50	1	357.50	0.00	2023-06-07 09:20:10	2023-06-07 09:20:24	\N
141	BM-601686144437	I	60	pi_3NGMOPBjsMxFtgBe0pkN0Uu5	16213.75	1	771.75	0.00	2023-06-07 13:27:18	2023-06-07 13:27:33	\N
142	BM-361686175518	I	36	pi_3NGUTiBjsMxFtgBe0FQswaxX	174517.00	1	8310.00	0.00	2023-06-07 22:05:19	2023-06-07 22:05:32	\N
143	BM-361686177905	I	36	pi_3NGV6DBjsMxFtgBe15kkyZ57	8197.00	1	390.00	0.00	2023-06-07 22:45:05	2023-06-07 22:45:21	\N
144	BM-1411686178103	I	141	pi_3NGV9PBjsMxFtgBe0g41TdUE	8197.00	1	390.00	0.00	2023-06-07 22:48:23	2023-06-07 22:48:37	\N
145	BM-1411686180986	P	141	pi_3NGVtuBjsMxFtgBe0dpVJrFQ	6968.50	1	331.50	0.00	2023-06-07 23:36:26	\N	\N
146	BM-1421686181192	I	142	pi_3NGVxEBjsMxFtgBe0eXB9jqA	68257.00	1	3250.00	0.00	2023-06-07 23:39:52	2023-06-07 23:40:05	\N
147	BM-821686192413	I	82	pi_3NGYsEBjsMxFtgBe1PFpDGzS	6968.50	1	331.50	0.00	2023-06-08 02:46:54	2023-06-08 02:47:17	\N
148	BM-1261686193782	I	126	pi_3NGZEIBjsMxFtgBe05BTajCs	7882.00	1	375.00	0.00	2023-06-08 03:09:42	2023-06-08 03:10:00	\N
149	BM-1341686200682	I	134	pi_3NGb1aBjsMxFtgBe0ZyO5yO1	7882.00	1	375.00	0.00	2023-06-08 05:04:42	2023-06-08 05:04:53	\N
150	BM-1341686200716	I	134	pi_3NGb28BjsMxFtgBe1iS9dHu5	7882.00	1	375.00	0.00	2023-06-08 05:05:16	2023-06-08 05:05:22	\N
151	BM-1341686200873	I	134	pi_3NGb4gBjsMxFtgBe1TGxGEXx	7882.00	1	375.00	0.00	2023-06-08 05:07:54	2023-06-08 05:08:00	\N
152	BM-1201686201307	I	120	pi_3NGbBfBjsMxFtgBe1XProoHi	27832.00	1	1325.00	0.00	2023-06-08 05:15:08	2023-06-08 05:15:24	\N
153	BM-601686202256	I	60	pi_3NGbQyBjsMxFtgBe0RhJKIIR	22057.00	1	1050.00	0.00	2023-06-08 05:30:56	2023-06-08 05:32:51	\N
154	BM-1341686203542	I	134	pi_3NGbljBjsMxFtgBe1IGqCm77	7882.00	1	375.00	0.00	2023-06-08 05:52:23	2023-06-08 05:52:29	\N
155	BM-1201686203897	I	120	pi_3NGbrSBjsMxFtgBe0y5wuqbq	18382.00	1	875.00	0.00	2023-06-08 05:58:18	2023-06-08 05:59:01	\N
156	BM-1271686205450	I	127	pi_3NGcGVBjsMxFtgBe1cLdVvvM	21007.00	1	1000.00	0.00	2023-06-08 06:24:11	2023-06-08 06:24:32	\N
157	BM-1271686205646	I	127	pi_3NGcJeBjsMxFtgBe1ftEKC68	7882.00	1	375.00	0.00	2023-06-08 06:27:27	2023-06-08 06:27:44	\N
158	BM-1161686209384	I	116	pi_3NGdHxBjsMxFtgBe05MBZB9U	26257.00	1	1250.00	0.00	2023-06-08 07:29:45	2023-06-08 07:30:03	\N
159	BM-1161686210205	I	116	pi_3NGdVBBjsMxFtgBe0b6wHXH9	7855.75	1	373.75	0.00	2023-06-08 07:43:25	2023-06-08 07:43:56	\N
160	BM-1161686210362	I	116	pi_3NGdXiBjsMxFtgBe04jy0aUI	6832.00	1	325.00	0.00	2023-06-08 07:46:02	2023-06-08 07:46:30	\N
161	BM-1441686214120	I	144	pi_3NGeWKBjsMxFtgBe1KEA8jJz	228907.00	1	10900.00	0.00	2023-06-08 08:48:40	2023-06-08 08:48:59	\N
162	BM-1451686226451	I	145	pi_3NGhjDBjsMxFtgBe1zNqyFQ3	6832.00	1	325.00	0.00	2023-06-08 12:14:11	2023-06-08 12:14:27	\N
163	BM-601686228576	I	60	pi_3NGiHVBjsMxFtgBe0E5E1Pbz	15730.75	1	748.75	0.00	2023-06-08 12:49:37	2023-06-08 12:49:51	\N
164	BM-831686228729	I	83	pi_3NGiJyBjsMxFtgBe0GgeOEIK	6832.00	1	325.00	0.00	2023-06-08 12:52:10	2023-06-08 12:52:30	\N
165	BM-1071686241672	I	107	pi_3NGlgjBjsMxFtgBe12psYk1d	12701.50	1	604.50	0.00	2023-06-08 16:27:53	2023-06-08 16:28:07	\N
166	BM-1051686251940	I	105	pi_3NGoMKBjsMxFtgBe0E7MSzxi	19747.00	1	940.00	0.00	2023-06-08 19:19:01	2023-06-08 19:19:18	\N
167	BM-1471686568431	P	147	pi_3NI8h1BjsMxFtgBe1uumwmxT	7882.00	1	375.00	0.00	2023-06-12 11:13:51	\N	\N
168	BM-1471686568435	I	147	pi_3NI8h5BjsMxFtgBe05kJNe9K	7882.00	1	375.00	0.00	2023-06-12 11:13:56	2023-06-12 11:14:13	\N
169	BM-1231686570176	I	123	pi_3NI99ABjsMxFtgBe0VKJsvef	33771.50	1	1745.50	0.00	2023-06-12 11:42:57	2023-06-12 11:43:27	\N
170	BM-1471686571290	P	147	pi_3NI9R8BjsMxFtgBe1WYYCByU	7882.00	1	375.00	0.00	2023-06-12 12:01:30	\N	\N
171	BM-1471686571483	P	147	pi_3NI9UFBjsMxFtgBe1xmkHmSY	7882.00	1	375.00	0.00	2023-06-12 12:04:43	\N	\N
172	BM-361686821887	I	36	pi_3NJCd1KUF8h9soYr1vVZpAQH	76268.50	1	3631.50	0.00	2023-06-15 09:38:07	2023-06-15 09:38:27	\N
173	BM-361686821989	I	36	pi_3NJCefKUF8h9soYr17qkUAI2	8197.00	1	390.00	0.00	2023-06-15 09:39:49	2023-06-15 09:40:05	\N
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, created_at, updated_at) FROM stdin;
1	App\\Models\\User	1	1Adminadmin@admin.com	42fa85cdd3e5806dd6120ff787b7b34b32cbb14d854fd08be88a1a3aa1416a07	["*"]	\N	2023-05-15 06:00:20	2023-05-15 06:00:20
2	App\\Models\\User	1	1Adminadmin@admin.com	362fa151d491b2f7aa14fb52949aefb2337c751e36595aa578f293bcb0d31b69	["*"]	\N	2023-05-15 06:00:25	2023-05-15 06:00:25
3	App\\Models\\User	14	Personal Access Token	8a890ade3e1ed75f35d88cb7b2a292272053470755c59c66faaf827c49cfaa98	["*"]	\N	2023-05-18 07:08:33	2023-05-18 07:08:33
4	App\\Models\\User	14	14rusvin krusvinmerak@gmail.com	ac88b912bc8648cd2c8b446987b408e1abcaf3f7a1ac42bb46e6d6a6cb1b5115	["*"]	\N	2023-05-18 07:08:44	2023-05-18 07:08:44
5	App\\Models\\User	15	Personal Access Token	708339a90193e33750051b8f534b7c5688dc9b184f2c902cf85def820e5a162a	["*"]	\N	2023-05-18 07:24:23	2023-05-18 07:24:23
6	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	600b940f0f3028b084d27e6b8e274485be7fb8e15a6f63c2517ab59c697851e0	["*"]	\N	2023-05-18 07:25:05	2023-05-18 07:25:05
7	App\\Models\\User	16	Personal Access Token	9a5d301c5ab86fe58b5cc33658c3f7db1b8be1b716ad6db28026710effb6cbec	["*"]	\N	2023-05-18 07:29:49	2023-05-18 07:29:49
8	App\\Models\\User	17	Personal Access Token	a1a8093482a9696130dc505324bc5041b177017cdd9b7f8b20b4dec93bf63601	["*"]	\N	2023-05-18 07:31:07	2023-05-18 07:31:07
9	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	17a2163c8b199ccf4a991ce42d04cd49f9e8ab53778e7eebaa8f433f34234ebc	["*"]	\N	2023-05-18 08:42:45	2023-05-18 08:42:45
10	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	7314d80c6b44772c310ae27a0a73b81cf32d1a788a81213091416195ef5aab8a	["*"]	\N	2023-05-18 08:43:59	2023-05-18 08:43:59
11	App\\Models\\User	18	Personal Access Token	5d0f15df7d4122310bc8ecec21463a841d9d0f280743e5b35d95cf716a1b8141	["*"]	\N	2023-05-18 10:45:22	2023-05-18 10:45:22
12	App\\Models\\User	19	Personal Access Token	c2d9f52fbad61d371809e923c52d477b9aebe49e1a6b636f73c3c8244223da10	["*"]	\N	2023-05-18 12:32:40	2023-05-18 12:32:40
13	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	de8635ca23aee0d10eb7ee90f3d8f3e7838c8d56c278b979531071c919d296d7	["*"]	\N	2023-05-18 14:13:11	2023-05-18 14:13:11
14	App\\Models\\User	20	Personal Access Token	d86f3d685a4711e4573dfbd93af0b046454706d665ad668ddfe9fcccf2e6a36e	["*"]	\N	2023-05-18 14:31:43	2023-05-18 14:31:43
15	App\\Models\\User	21	Personal Access Token	b2d75ba3b1992e5256e39cf2b34bbeb1bf275ec2a65f427773641989b7245290	["*"]	\N	2023-05-18 14:34:45	2023-05-18 14:34:45
16	App\\Models\\User	22	Personal Access Token	d0d7c8aecc2efaf641b39863d680dfe3fdf0b592fefd816268a5af88402045a3	["*"]	\N	2023-05-18 14:36:24	2023-05-18 14:36:24
17	App\\Models\\User	23	Personal Access Token	b9e65406edf7144bbb365e6598a285e7dd661b57c4ce0961f822cd2f46466ed8	["*"]	\N	2023-05-18 14:38:49	2023-05-18 14:38:49
18	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	65505e5dca4022a2c7cbd966e84d36f5bd632892d55df85cb8bf74d204def5e1	["*"]	\N	2023-05-18 14:51:35	2023-05-18 14:51:35
19	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	7f98e49eee4cbdd260d9dda7c6ccb70c1bfc21e42411688873ae25f1ddf73ec0	["*"]	\N	2023-05-19 05:22:12	2023-05-19 05:22:12
20	App\\Models\\User	24	Personal Access Token	2fa6109d00a4ea2628cf9f9c1fdbb08d6710d724ccd58349c6d5ebf011cae04e	["*"]	\N	2023-05-19 06:07:46	2023-05-19 06:07:46
21	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	aa64d79acfa19bceb750e6d6d6d607bd78de9ca6d3a57dd1c091168c200fb4ff	["*"]	\N	2023-05-19 06:49:43	2023-05-19 06:49:43
22	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	525419724668c83ac3b2f323844ad094570c3ca5679fb4beaa6f05a336bcbf33	["*"]	\N	2023-05-19 10:21:07	2023-05-19 10:21:07
23	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	faaf8fe74294960008296960399c1cc528e727ef1f6c2b6a53535ed2d47f97a9	["*"]	\N	2023-05-19 11:29:46	2023-05-19 11:29:46
24	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	ad66452aca7158327c3eb28f142e30f9b31cb8d2f3d755d9b12415acd6baba72	["*"]	\N	2023-05-19 12:02:12	2023-05-19 12:02:12
25	App\\Models\\User	25	Personal Access Token	a662393bc739c39f32e3f9db485cb9ee296b66c33aa857fcd96dad9447da8aff	["*"]	\N	2023-05-20 04:32:22	2023-05-20 04:32:22
26	App\\Models\\User	26	Personal Access Token	674699e968b2df9432c75d0e873d0c6f114e9175db4ab40c6f77232a1200e162	["*"]	\N	2023-05-20 04:34:41	2023-05-20 04:34:41
27	App\\Models\\User	27	Personal Access Token	c1d9820b1672b1c284052b97e295bfae6d7bbd0d0743dc961812ef270b03bbd9	["*"]	\N	2023-05-20 04:35:03	2023-05-20 04:35:03
28	App\\Models\\User	28	Personal Access Token	2d4d89f31e956dad8eb154f7642f09acfd85a33aae41d435ba3ef50004a2b083	["*"]	\N	2023-05-20 04:36:02	2023-05-20 04:36:02
29	App\\Models\\User	29	Personal Access Token	47e81836ea092c15adf1f6aeb5ae6f5f1bf5fae8d3c7d865f003edbe8558a502	["*"]	\N	2023-05-20 04:51:22	2023-05-20 04:51:22
30	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	919807a6a8681169cdd38360d58d6683c59ff93340eb02a476f14072cd2d623b	["*"]	\N	2023-05-20 05:06:20	2023-05-20 05:06:20
31	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	3011c90cf3401f22a572c1ae0096da110e424d07f2825a52e26f09de47532032	["*"]	\N	2023-05-20 05:29:15	2023-05-20 05:29:15
32	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	8a067baa2d700ae01534ef5da3f80cad4a23fbbd1f78d44fcb3e495e27046ccb	["*"]	\N	2023-05-20 05:58:07	2023-05-20 05:58:07
33	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	cfbf5152fb63f72b128bf4135368828de04aa404f39a55abdc630775c788a87c	["*"]	\N	2023-05-22 04:00:48	2023-05-22 04:00:48
34	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	e0d786d91973bbfb764754035d1d8960b45acfdb1c80d4f6136903d226da6801	["*"]	\N	2023-05-22 12:36:15	2023-05-22 12:36:15
35	App\\Models\\User	30	Personal Access Token	83dd43732b4aca99cc707d531e3cc4c1c3d713d864e11dd9847c5dbd4cfa4b81	["*"]	\N	2023-05-22 12:40:57	2023-05-22 12:40:57
36	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	1e81f3530c538f03fc6733ae2d6b665fff267bca27bb8a15d88f9b653e321e8f	["*"]	\N	2023-05-23 05:36:15	2023-05-23 05:36:15
37	App\\Models\\User	31	Personal Access Token	f431ec0b1f247ab9554bd11289d8121a502c5557619946895b662f3f14e05a2c	["*"]	\N	2023-05-23 05:37:53	2023-05-23 05:37:53
38	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	6dd0dafefd27217844900743349a485ac7b23513423f02839b94ce26b2ed2aca	["*"]	\N	2023-05-23 06:21:13	2023-05-23 06:21:13
39	App\\Models\\User	32	Personal Access Token	44e0da7245e20585e0ef1727e2cc93ae904de1b9f9156c112516bbf255823ab4	["*"]	\N	2023-05-23 07:03:46	2023-05-23 07:03:46
40	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	2da3e18bc1beca90956cb2cccf609b8be99be25e6d0890d244d2e9e312cf8413	["*"]	\N	2023-05-23 07:04:18	2023-05-23 07:04:18
41	App\\Models\\User	33	Personal Access Token	6e44da02422d7af566ad9fd07229be04ec5c869143425984f21e2008512da845	["*"]	\N	2023-05-23 07:30:59	2023-05-23 07:30:59
42	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	11c1929387132a1b6dbdfc694c2f991886b6332c509857185fd6bc6a20ebb7b2	["*"]	\N	2023-05-23 07:32:14	2023-05-23 07:32:14
43	App\\Models\\User	34	Personal Access Token	f4ecf26d3b5f2a41a5f286b025b3f07bb5074a0699dbe3a49c0afd1144e272d1	["*"]	\N	2023-05-23 07:32:40	2023-05-23 07:32:40
44	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	bd89d000d4b35f64900e56688a86feb5f3b92e7f4f76a87cffba9247fbc6df3e	["*"]	\N	2023-05-23 08:38:11	2023-05-23 08:38:11
45	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	e4d95b79391e358b83049ebf7879094d5eaf81e0753771d7c985ec1ae0578da9	["*"]	\N	2023-05-23 09:36:25	2023-05-23 09:36:25
46	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	f740006f812ccb37227d7def66340d7aaf94f01c2bae443bd71c488cc6bd8321	["*"]	\N	2023-05-23 09:40:31	2023-05-23 09:40:31
47	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	d2580a33be2c9f56016a6a5175acdbb6a8513f737236c27a123199da951682a3	["*"]	\N	2023-05-23 09:41:03	2023-05-23 09:41:03
48	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	e66478a878a45a8707664f51e07d899fa5ac8b44a3da48ba5e2ba0a239c49468	["*"]	\N	2023-05-23 11:12:01	2023-05-23 11:12:01
49	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	b04e44c2c4f663bb41663b18f54d1b4a019de32a22cc09c59545d53498c9e544	["*"]	\N	2023-05-23 12:55:55	2023-05-23 12:55:55
50	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	6f9b94df6f380592f4e03622c398acf53f0b4db5f4b08e77a2257a09a7f27b9c	["*"]	\N	2023-05-23 13:13:33	2023-05-23 13:13:33
51	App\\Models\\User	35	Personal Access Token	0fac67e1bafbec770695abfba10b1c94dd8d70f29717d506ea63276daa2d2cf1	["*"]	\N	2023-05-23 13:21:02	2023-05-23 13:21:02
52	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	f604fbd77ea1fc3b1c51d63900ca7297687520ab5e39c166b5b4256758e5ee17	["*"]	\N	2023-05-23 13:29:22	2023-05-23 13:29:22
53	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	24d2c5ad846dabf1f191120ac7011e9b5c422a7efeac6e1aa399bfaf264c5042	["*"]	\N	2023-05-23 13:30:37	2023-05-23 13:30:37
54	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	aff16a560248b06d8a4283afb2663865c28cc9e458d22460043da816f276dc45	["*"]	\N	2023-05-23 16:24:32	2023-05-23 16:24:32
55	App\\Models\\User	36	Personal Access Token	3f689b34e167cf13c165afd29b2d302806c6e9c636ab75f588fcef2fbc83863f	["*"]	\N	2023-05-23 16:34:14	2023-05-23 16:34:14
56	App\\Models\\User	36	36Test Usertestuser@gmail.com	f584500dfe240752d724fc521df7f16eabf0dc216675c3cec9377e46356192e9	["*"]	\N	2023-05-23 17:41:02	2023-05-23 17:41:02
57	App\\Models\\User	36	36Test Usertestuser@gmail.com	2c029da3ecff674b78d8af918bfcacd1478c903fdf8775138e55df3d67415470	["*"]	\N	2023-05-23 17:42:32	2023-05-23 17:42:32
58	App\\Models\\User	36	36Test Usertestuser@gmail.com	8c24adb6361b38879b8b9a496a760ba3e8f983e6a3b22493727d12346d138926	["*"]	\N	2023-05-23 17:47:25	2023-05-23 17:47:25
59	App\\Models\\User	37	Personal Access Token	6ebaf99bf99271ebd9b6b33d6caa3486599a325468635d6d23f337e45a299900	["*"]	\N	2023-05-23 19:45:32	2023-05-23 19:45:32
60	App\\Models\\User	38	Personal Access Token	f9ae4ab2fca8859a9559667242cfa24638c02c3d09e1074ac930d446c1d62e63	["*"]	\N	2023-05-23 19:48:35	2023-05-23 19:48:35
61	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	7dfb9ada1305f2a1028ba70657d8b17208b4ccc37964db6ed0561f9abe8a4ea8	["*"]	\N	2023-05-24 05:28:05	2023-05-24 05:28:05
62	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	b8e4611e206421c0539d52ad2d6464cc5194a12da0e595b6ad3f71d8538c7316	["*"]	\N	2023-05-24 06:21:00	2023-05-24 06:21:00
63	App\\Models\\User	39	Personal Access Token	5b7ea5376d14f5add8f8e31bf0e232f63de109b6d9ede020d22fcff2dc29fde6	["*"]	\N	2023-05-24 06:27:28	2023-05-24 06:27:28
64	App\\Models\\User	15	15rusvin krusvinmerak@gmail.com	067c49d8fee061afb0af8956c6bea3111fed69313f8c14a4d45ae6445231ecb8	["*"]	\N	2023-05-24 07:01:28	2023-05-24 07:01:28
65	App\\Models\\User	40	Personal Access Token	d4ceee49cdc267481fa0513bd97de02a7a726519d16080466054d7a52306f3e4	["*"]	\N	2023-05-24 07:38:09	2023-05-24 07:38:09
66	App\\Models\\User	41	Personal Access Token	da820a8db7cb5223df16c85ff0014d3672ffe78ce64645a337e60d984c439e06	["*"]	\N	2023-05-24 07:45:41	2023-05-24 07:45:41
67	App\\Models\\User	42	Personal Access Token	e279b08112d47e7933a4aa5021fae4ba358d204bf2452ae679b26e642994e1ea	["*"]	\N	2023-05-24 07:47:35	2023-05-24 07:47:35
68	App\\Models\\User	43	Personal Access Token	36b217320c1fbf2041df0bd8973b9cc78177af08cbe2c675df73d99744a151dd	["*"]	\N	2023-05-24 07:51:02	2023-05-24 07:51:02
69	App\\Models\\User	44	Personal Access Token	024cb8cd5c60b517b4743c2d2f704569709d02808d2e45aa8adb76b2e0e4d46d	["*"]	\N	2023-05-24 07:52:25	2023-05-24 07:52:25
70	App\\Models\\User	44	44nasar testnasar123@gmail.com	311811c5063ed4be72a8ba4e61b30910171b204547e2007d2f365a2335e643e4	["*"]	\N	2023-05-24 07:52:35	2023-05-24 07:52:35
71	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	1d735aa0a5e61e0599ef5e420bfbd247ae3843464ed27aee49804e52e931a6f6	["*"]	\N	2023-05-24 07:53:00	2023-05-24 07:53:00
72	App\\Models\\User	36	36Test Usertestuser@gmail.com	465b441d5215a98b5445b9886dc2418d7a4795c49c054751fafd38af7567ae2a	["*"]	\N	2023-05-24 07:53:57	2023-05-24 07:53:57
73	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	147b96a1d94ae300a893ef8257e9281c9a83e024e263de8a129d30c4eb0bc306	["*"]	\N	2023-05-24 08:15:29	2023-05-24 08:15:29
74	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	e77933a2ab192618e44dd5c1f1d7f185109d45a4acddd81d010220ade5fb473e	["*"]	\N	2023-05-24 10:49:51	2023-05-24 10:49:51
75	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	7211cf792d6dd6030446f56d4288f4fd347fc8b24712c26fc9ae384b6c5abbd5	["*"]	\N	2023-05-24 11:03:00	2023-05-24 11:03:00
76	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	1967465ad0804c80d5f0d81668224f22712b5c3abf81483f2a80d5bcfe97ba5e	["*"]	\N	2023-05-24 11:08:55	2023-05-24 11:08:55
77	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	47497c913af07084b38fe44caed19737c0ce69f74706b9c419e18d099439c28a	["*"]	\N	2023-05-24 11:17:37	2023-05-24 11:17:37
78	App\\Models\\User	45	Personal Access Token	62649fdb11922e5da0e67f9d5f36a39740e25effa66ed18594f42802b6f332c3	["*"]	\N	2023-05-24 11:23:01	2023-05-24 11:23:01
79	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	62723bfb00ba8d31d44e767a31613f037fb20c1d317ab7058f03a41285740748	["*"]	\N	2023-05-24 11:23:08	2023-05-24 11:23:08
80	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	7495c86e589b57ef7d14bd7594c484b8f5966df513dff32d877f7793877f7750	["*"]	\N	2023-05-24 11:42:32	2023-05-24 11:42:32
81	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	81b94ee90c76302f223e7eb25932d4dd8e10223a0c6f765ffe31e506b572240b	["*"]	\N	2023-05-24 12:38:33	2023-05-24 12:38:33
82	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	56edea5293180845dac2dd0c3e2a47ca7cd86660d1f05bcda3c0a3857d332d02	["*"]	\N	2023-05-24 12:44:02	2023-05-24 12:44:02
83	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	734d8c9897edb6ecb240215962bfe3ae7e0fc3227f799353c1d4810c412d5d52	["*"]	\N	2023-05-24 12:46:52	2023-05-24 12:46:52
84	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	98b2261b903216f2ad97baf8d290b8a334473b880723a8bcaf959cf0c62448ab	["*"]	\N	2023-05-24 13:01:54	2023-05-24 13:01:54
85	App\\Models\\User	46	Personal Access Token	acb3955955db053d41de3e4c7d7b0e6df1068208edb63286e3b838e0f1993f28	["*"]	\N	2023-05-24 13:11:36	2023-05-24 13:11:36
86	App\\Models\\User	46	46sadiya zehrasahlanissar41@gmail.com	cc2d18761dfcfa26b4889bb6ef2e6374678ada90b44320372f222d7741ee846a	["*"]	\N	2023-05-24 13:14:54	2023-05-24 13:14:54
87	App\\Models\\User	46	46sadiya zehrasahlanissar41@gmail.com	5c6da5e5f10bc1ef7a17bcbbc499c1b58a8c1a40e3618ac4b9fd517ba0b2aed4	["*"]	\N	2023-05-24 13:43:18	2023-05-24 13:43:18
88	App\\Models\\User	46	46sadiya zehrasahlanissar41@gmail.com	5f83f1ddcd596569de1e65b0e06740afeb2204485cfd7175fbeeb71019fdf69f	["*"]	\N	2023-05-24 13:59:48	2023-05-24 13:59:48
89	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	8c677f34619c56be2f735ac9c370b4d0ccded7dcd6e054feac5055a8ddd27fa6	["*"]	\N	2023-05-24 14:09:21	2023-05-24 14:09:21
90	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	c3efb48f831c1d6b3a2a11a79479ff2103dd04491a30b66a0058f8b6dbf7f8a0	["*"]	\N	2023-05-24 14:25:11	2023-05-24 14:25:11
91	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	f013461b24caaf39d70afe57b24125e713492358dea11b0d7798d08cafd79cf9	["*"]	\N	2023-05-24 14:40:37	2023-05-24 14:40:37
92	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	92404431de241d4ee418a37910cf6f43faa7f51aef292df8a453dac7177cfbc4	["*"]	\N	2023-05-24 14:41:29	2023-05-24 14:41:29
93	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	7601b51b8d6a26d0c91cb11c8efdf624bb5fe509fa0f5659c9cfdc2faf28616f	["*"]	\N	2023-05-24 14:50:05	2023-05-24 14:50:05
94	App\\Models\\User	39	39hunain dev testhunain88@gmail.com	592824a3e8375b46471ee426c5155987778d91d84000fb69ed4b1248eb1c896d	["*"]	\N	2023-05-24 15:24:01	2023-05-24 15:24:01
95	App\\Models\\User	39	39hunain devhunain88@gmail.com	3191473eb29b0aecd7efc40aaf31b037a7352ff3ca6fee8de45b5f911a03dcc6	["*"]	\N	2023-05-24 17:48:26	2023-05-24 17:48:26
96	App\\Models\\User	39	39hunain devhunain88@gmail.com	64ccf0c4ad0d3a3fa5f07d63a9018c47c84ff483a4dd6b05fdbee7d3e9656e3d	["*"]	\N	2023-05-24 20:06:47	2023-05-24 20:06:47
97	App\\Models\\User	39	39hunain devhunain88@gmail.com	975a5ff2b863a4f5fd9799e0429f5fe0a9f1af2a1eb7f7373594f086d3f2c777	["*"]	\N	2023-05-24 21:16:17	2023-05-24 21:16:17
98	App\\Models\\User	47	Personal Access Token	f2b8f0d24d07db27669964228a45f9445094f30e03392d760015a1d9cc3cad9e	["*"]	\N	2023-05-24 21:31:44	2023-05-24 21:31:44
99	App\\Models\\User	39	39hunain devhunain88@gmail.com	42f80c2017dd6d00550894cc57359efbbbeda0d118f4d66d6e4330ee928a1a06	["*"]	\N	2023-05-24 22:43:39	2023-05-24 22:43:39
100	App\\Models\\User	47	47hunain ninehunain99@gmail.com	53b7f9cefbb28ffbc0636da1d0b03de7654855828fd87a26d674fbfcd3cd3092	["*"]	\N	2023-05-24 22:44:10	2023-05-24 22:44:10
101	App\\Models\\User	39	39hunain devhunain88@gmail.com	a9834fe4e7095380c5a8bb7e49bdc5bd1507e756b44c595d5ec646194cae0ccc	["*"]	\N	2023-05-24 22:44:50	2023-05-24 22:44:50
102	App\\Models\\User	39	39hunain devhunain88@gmail.com	50232cbd6a2a000b734b10f36c8924580f528c0bcaa6bbadd563c964350bc32a	["*"]	\N	2023-05-25 05:28:55	2023-05-25 05:28:55
103	App\\Models\\User	39	39hunain devhunain88@gmail.com	028451d307ff18fe823fcaca4d1f0562131dd0516d99bf7d9ea825e3854ea443	["*"]	\N	2023-05-25 07:26:09	2023-05-25 07:26:09
104	App\\Models\\User	39	39hunain devhunain88@gmail.com	334cb5fc65de7eb2334a10172b97be000eec57b2df7d33ba421ae07dca28d35e	["*"]	\N	2023-05-25 11:01:17	2023-05-25 11:01:17
105	App\\Models\\User	39	39hunain devhunain88@gmail.com	d2c24d62936ae1a9d6f2688c3a3a53725fac7eeb0181420d259870afa0beef86	["*"]	\N	2023-05-25 17:48:48	2023-05-25 17:48:48
106	App\\Models\\User	39	39hunain devhunain88@gmail.com	a8d96076f4f8a1efb579252358538cf37e78c2de17ef0d157174c76e6a08e455	["*"]	\N	2023-05-25 20:23:48	2023-05-25 20:23:48
107	App\\Models\\User	39	39hunain devhunain88@gmail.com	500f3473529aeaa6d452d94858e5eefd9ee60e43c434da105ef6a5650f1f84a2	["*"]	\N	2023-05-25 20:24:52	2023-05-25 20:24:52
108	App\\Models\\User	39	39hunain devhunain88@gmail.com	7d39a8c84692441706b6f7f6c885c416f155be391a30e97a940f82d6d62ef1c2	["*"]	\N	2023-05-25 20:59:07	2023-05-25 20:59:07
109	App\\Models\\User	47	47hunain ninehunain99@gmail.com	1930097a000e5ae6b833fd056dbd8030007336aa22af46caac96078392fef9c4	["*"]	\N	2023-05-26 05:55:24	2023-05-26 05:55:24
110	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	a11d0085afcc9953aafff9fbd7a3c6c3c5584bf2bbc3def54a47f966a36c0c4d	["*"]	\N	2023-05-26 06:15:28	2023-05-26 06:15:28
111	App\\Models\\User	39	39hunain devhunain88@gmail.com	ca943df7f2ef04b2b8b50c3d47ee21a54992e9e635044c425e041437c0a75134	["*"]	\N	2023-05-29 05:23:47	2023-05-29 05:23:47
112	App\\Models\\User	39	39hunain devhunain88@gmail.com	babe309279e2e148e4fb5eadffa0183115f2a0e0e5daeb1af1497ac80fbda453	["*"]	\N	2023-05-29 06:10:57	2023-05-29 06:10:57
113	App\\Models\\User	39	39hunain devhunain88@gmail.com	514de31f4c099bebecf0e7f233e2bb279729609a8b9e7726c3cbd8bffa9620a4	["*"]	\N	2023-05-29 11:29:38	2023-05-29 11:29:38
114	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	fb5616baa60b54322de9039c1de51d4b79f55511ef54e3853a3bc890d44289a7	["*"]	\N	2023-05-29 12:36:03	2023-05-29 12:36:03
115	App\\Models\\User	49	Personal Access Token	72e1fddf16d6bde2668114dea22fce3ed4cd964b7cfa7b206388b990ed6bf411	["*"]	\N	2023-05-29 15:29:52	2023-05-29 15:29:52
116	App\\Models\\User	49	49test usertestuser1234@gmail.com	8eee0453416e9573e10ce3b3686af04abdf641c6f432118d3b9081d8812c34ee	["*"]	\N	2023-05-29 15:30:05	2023-05-29 15:30:05
117	App\\Models\\User	50	Personal Access Token	63e661edf63fc8977b43249bb454dc757446d5467cbbba438dddc3f744b98aac	["*"]	\N	2023-05-29 15:35:17	2023-05-29 15:35:17
118	App\\Models\\User	50	50test usertestuser231@gmail.com	57aca08b10fe393ed68b8ba228d768235ec380ef0359fab8c074c4f975b8f108	["*"]	\N	2023-05-29 15:36:00	2023-05-29 15:36:00
119	App\\Models\\User	49	49test usertestuser1234@gmail.com	ee63dd5eeeb8a092b0ce13c8fc4936c1f0bbfa351f325a1cd15275a02aefa80c	["*"]	\N	2023-05-29 15:36:52	2023-05-29 15:36:52
120	App\\Models\\User	39	39hunain devhunain88@gmail.com	af4b0636f0e445b44cb712a1cad3cade81d752db5c9070e999a6e209bffb5897	["*"]	\N	2023-05-29 16:48:18	2023-05-29 16:48:18
121	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	36e12e1c75177dde2c5118eb20b2c06728b9ab8613c6665149de6c882a2506ac	["*"]	\N	2023-05-29 19:50:47	2023-05-29 19:50:47
122	App\\Models\\User	39	39hunain devhunain88@gmail.com	775f9148bc95a26d6ca355b498c338178c554e5db9c7014939188904696fd298	["*"]	\N	2023-05-29 19:50:49	2023-05-29 19:50:49
123	App\\Models\\User	51	Personal Access Token	c4dfd257fa779c3e8e9cb8ab7d5b2356740b83910078c5212c1ff0dc631e63e4	["*"]	\N	2023-05-29 19:57:50	2023-05-29 19:57:50
124	App\\Models\\User	36	36Test Usertestuser@gmail.com	9442fea84f37800a2be219e8725e2df8aa45d8b028e9e967d52d2f9d0ddda56a	["*"]	\N	2023-05-29 20:02:12	2023-05-29 20:02:12
125	App\\Models\\User	49	49test usertestuser1234@gmail.com	724e2569a021abaa4fe4bd131ee70fb08632f4b6d1f1f21ec1f84cf0f9d3bef7	["*"]	\N	2023-05-29 20:13:35	2023-05-29 20:13:35
126	App\\Models\\User	39	39hunain devhunain88@gmail.com	e6fb8ca2ea8c590da38ab1c0b78bf7baf3f5c2f3df327b1c82220723bdb8309a	["*"]	\N	2023-05-29 20:18:44	2023-05-29 20:18:44
127	App\\Models\\User	36	36Test Usertestuser@gmail.com	63b12840aa66fe0645de0b68f0b898082eb7267f9ca9eaaef712acdc892fb8d6	["*"]	\N	2023-05-29 21:01:49	2023-05-29 21:01:49
128	App\\Models\\User	52	Personal Access Token	3efee412e3b1d9620e7cc219bf5f8b994d95a7ab16b449b4127beda24c4adb1b	["*"]	\N	2023-05-29 21:49:54	2023-05-29 21:49:54
129	App\\Models\\User	53	Personal Access Token	cd5b242a0c7e8014e5f2bca43b88e2b7bc5b5a5f74b6e2253bb86d53399fa799	["*"]	\N	2023-05-29 21:54:08	2023-05-29 21:54:08
130	App\\Models\\User	53	53newuser testnewtest123@gmail.com	a844be2f991704615413cdb490056cf0c04d297a005ba198fc21f27aa796eb3d	["*"]	\N	2023-05-29 21:54:15	2023-05-29 21:54:15
131	App\\Models\\User	53	53newuser testnewtest123@gmail.com	5939d8f6a24e44ce8f8e8edf58b10312f80a19898a94cc5cfb3975a884542d8c	["*"]	\N	2023-05-29 21:54:44	2023-05-29 21:54:44
132	App\\Models\\User	36	36Test Usertestuser@gmail.com	5738880188ed35ff7a4110f043ce38f9425c48340e393d392e5dbe82d4c59326	["*"]	\N	2023-05-29 22:37:25	2023-05-29 22:37:25
133	App\\Models\\User	54	Personal Access Token	c35a2b61729b673e65676abed2c5aa926a8759c97739f80f076b77133d8a5e1c	["*"]	\N	2023-05-29 22:38:16	2023-05-29 22:38:16
134	App\\Models\\User	54	54new testnas1234@gmail.com	774934742dbdffeb9a220d12e2c2078f5727e567c062d884ee7cbf2fce6eee1b	["*"]	\N	2023-05-29 22:38:21	2023-05-29 22:38:21
135	App\\Models\\User	54	54new testnas1234@gmail.com	c76203d499ceef15b93be5b30ea104b0473a6d17bca2fd9f1c521490b9e6c897	["*"]	\N	2023-05-29 22:39:34	2023-05-29 22:39:34
136	App\\Models\\User	36	36Test Usertestuser@gmail.com	cbd08cd7d5ec40eccbdb9b8d63193c9bc728e8f3a7856b89e4d60e47e450ce7b	["*"]	\N	2023-05-29 22:54:13	2023-05-29 22:54:13
137	App\\Models\\User	39	39hunain devhunain88@gmail.com	7f3c498d5c978072dcf1ca9c26b8a1e310eeb3c47fa212d5cd943831abe66fa4	["*"]	\N	2023-05-30 04:37:31	2023-05-30 04:37:31
138	App\\Models\\User	39	39hunain devhunain88@gmail.com	c07f191a898b6818cfeaf220e2fb0859c6f7b54f4080c4c0826e941fb4823d75	["*"]	\N	2023-05-30 04:58:04	2023-05-30 04:58:04
139	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	3e47e2b75189d102113278e711bf9f63b4b8e96018d1046a42106df704a12778	["*"]	\N	2023-05-30 05:30:10	2023-05-30 05:30:10
140	App\\Models\\User	39	39hunain devhunain88@gmail.com	469e85726b062cac9b674ad8e3ef66932c6d4acbdc3850562e4a2b47b1f9f553	["*"]	\N	2023-05-30 07:33:57	2023-05-30 07:33:57
141	App\\Models\\User	39	39hunain devhunain88@gmail.com	de6eeb7d188e3c09aa1c1f46d95462fea0bfefce8a47d64401d3ec28b82e95f0	["*"]	\N	2023-05-30 08:40:33	2023-05-30 08:40:33
142	App\\Models\\User	49	49test usertestuser1234@gmail.com	3e4034e323f3505e70b35c5e5e3b8d9d39a97ca71adca22c7bb41d22b016e791	["*"]	\N	2023-05-30 15:39:09	2023-05-30 15:39:09
143	App\\Models\\User	36	36Test Usertestuser@gmail.com	dafc56e083d44543d724d857085b40fe3df80d2ba75736703ad0723d439bcbd7	["*"]	\N	2023-05-30 15:43:19	2023-05-30 15:43:19
144	App\\Models\\User	49	49test usertestuser1234@gmail.com	3e12945ff51247c8e9cc178ff508845622694dc47b0e17a158a62cdafcd0b414	["*"]	\N	2023-05-30 19:24:43	2023-05-30 19:24:43
145	App\\Models\\User	49	49test usertestuser1234@gmail.com	d8c538f9c9902e5eff513fb57d2238b7995410cb47a578f230e53b4e3b57066b	["*"]	\N	2023-05-30 19:38:28	2023-05-30 19:38:28
146	App\\Models\\User	49	49test usertestuser1234@gmail.com	2b8d7fd19df3488893f2d4086f1d64ca1e87a0f9a4853e5e66b278ee93967e50	["*"]	\N	2023-05-30 20:36:53	2023-05-30 20:36:53
147	App\\Models\\User	55	Personal Access Token	566d2f5a31e536077d001ea57521e48ed725c7fce61020315d7073f84bb81426	["*"]	\N	2023-05-31 05:39:16	2023-05-31 05:39:16
148	App\\Models\\User	55	Personal Access Token	76a4f43707e1747a2e144111d7f5a845057174afd78a4301048ce149edd394ca	["*"]	\N	2023-05-31 05:57:07	2023-05-31 05:57:07
149	App\\Models\\User	56	Personal Access Token	e54fb57e5f656ec8eb7493f032a4909838a139c006b0e8b7c9e006265aa1fa48	["*"]	\N	2023-05-31 06:24:37	2023-05-31 06:24:37
150	App\\Models\\User	56	Personal Access Token	8e7f41563d38a4c235745423552514925b8c7f43971cbbe94595a38bd853fe14	["*"]	\N	2023-05-31 06:38:44	2023-05-31 06:38:44
151	App\\Models\\User	57	Personal Access Token	15a11bd9d58ffe6deed3faff28c4726ca615acceb1d2bc3691c5b040a65bd416	["*"]	\N	2023-05-31 07:05:40	2023-05-31 07:05:40
152	App\\Models\\User	58	Personal Access Token	e958eb6149bba77cdf3181ef7c8c7fe355985e2412e51b87c7aba9c2714a5ab4	["*"]	\N	2023-05-31 07:13:11	2023-05-31 07:13:11
153	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	1376b6aa8e9696a9f203d23c6285cb877e9c9c6d24ae5c534cb1161a8d8adbe9	["*"]	\N	2023-05-31 07:17:39	2023-05-31 07:17:39
154	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	0c7849090a5cd830e5a005cfce33ca1525043bc599d6cfe00b0cc186380da031	["*"]	\N	2023-05-31 07:18:38	2023-05-31 07:18:38
155	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	253041676986bde9d6fb6c5a2e125f02826d72e9f01cd87d59e45b046b6cc068	["*"]	\N	2023-05-31 07:20:55	2023-05-31 07:20:55
156	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	2a887710effa4217ecfa34e799208aea37a08388818e0952deba28ba9699bb0d	["*"]	\N	2023-05-31 07:21:57	2023-05-31 07:21:57
157	App\\Models\\User	55	Personal Access Token	cd86c905f6e704601e30e33c7f6d6ca9f0cbcf96a8c7df45c035b42149afbc8f	["*"]	\N	2023-05-31 07:30:13	2023-05-31 07:30:13
158	App\\Models\\User	59	Personal Access Token	3e6e8ca7717b127ee33f85c4cc163b6bfb4e2bf28d092a6ebdaf0505efc83ca4	["*"]	\N	2023-05-31 07:36:34	2023-05-31 07:36:34
159	App\\Models\\User	59	Personal Access Token	948cc2386f39dec968e12ad47298cfbe10c80f027002c33c50f1f2c2499612d1	["*"]	\N	2023-05-31 07:37:57	2023-05-31 07:37:57
160	App\\Models\\User	59	Personal Access Token	12d1d145e400a16a7c3bd24856dbeea929a8ee46a263e6d535ea3f3081200bdb	["*"]	\N	2023-05-31 07:41:11	2023-05-31 07:41:11
161	App\\Models\\User	59	Personal Access Token	37d792442cc9ee581b7f1618dd6ec3a9bf07dc2b5dfb40feb3fb131fb8e8b129	["*"]	\N	2023-05-31 07:43:09	2023-05-31 07:43:09
162	App\\Models\\User	59	Personal Access Token	58c49de93bdd9f4968bab81e80f5a6df5991b0660fe7adbd68b517ef8f1d8c0d	["*"]	\N	2023-05-31 07:43:49	2023-05-31 07:43:49
163	App\\Models\\User	59	Personal Access Token	a0ead8b8ec0aef57bb10105a015e8494802acbcdcd4ba75235cd7957bbec18f9	["*"]	\N	2023-05-31 07:58:32	2023-05-31 07:58:32
164	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	510d268b1e6deb7164fe56a35e51b991982c70001d740e032e7266d98b0a0250	["*"]	\N	2023-05-31 08:58:55	2023-05-31 08:58:55
165	App\\Models\\User	39	39hunain devhunain88@gmail.com	61ebf9c7a6dc63154a130ec0784823e6f4a93018cc6ff62f972c7fa134a50059	["*"]	\N	2023-05-31 10:17:27	2023-05-31 10:17:27
166	App\\Models\\User	59	Personal Access Token	9ab510272de4558e95354beb5fd920a170793ea3827fbdaecc631db03a74d92a	["*"]	\N	2023-05-31 10:44:02	2023-05-31 10:44:02
167	App\\Models\\User	39	39hunain devhunain88@gmail.com	3bf36711cc5bd9e42aebd4c9e42e5605e9c736eb95ec1fdfa42cfbc7c2f5a2d7	["*"]	\N	2023-05-31 11:34:24	2023-05-31 11:34:24
168	App\\Models\\User	39	39hunain devhunain88@gmail.com	6450d951feb2fbef8f08578ab2f6b8b1ef15d2b05231950b94b632c57cb02f02	["*"]	\N	2023-05-31 11:51:19	2023-05-31 11:51:19
169	App\\Models\\User	39	39hunain devhunain88@gmail.com	21fe6a10eff7b2f8eb17795f8e3d01170b89c67999dd1b6d0e43a65610cc8f0a	["*"]	\N	2023-05-31 11:53:34	2023-05-31 11:53:34
170	App\\Models\\User	60	Personal Access Token	ea379e179931f135e21783ccfc964dd7ceb249c591918a592e603924919df18b	["*"]	\N	2023-05-31 12:09:53	2023-05-31 12:09:53
171	App\\Models\\User	47	47hunain ninehunain99@gmail.com	712d0cb5fb93a7f30478f96c9c01289ba7d9f10c8164f4ec17949dc317889239	["*"]	\N	2023-05-31 12:22:33	2023-05-31 12:22:33
172	App\\Models\\User	60	Personal Access Token	2ff96359e2e5e27544fcbf62ec4643f35a6f548a03cd9cb60d44967f4412cadc	["*"]	\N	2023-05-31 12:24:31	2023-05-31 12:24:31
173	App\\Models\\User	59	Personal Access Token	8d2b6080037dcf81bf70355591bdf3cd24071f81738fe88674446cf541a7f7e2	["*"]	\N	2023-05-31 12:24:58	2023-05-31 12:24:58
174	App\\Models\\User	39	39hunain devhunain88@gmail.com	0e246ed39cfbe403da9288c0f6899d268c1cbbeec8a31a66f124d2891c6f7e8a	["*"]	\N	2023-05-31 12:27:39	2023-05-31 12:27:39
175	App\\Models\\User	59	Personal Access Token	3aab41beb3ef64004f1a85505b649526916eab230dfbf99760fb78d27d8f4386	["*"]	\N	2023-05-31 12:30:44	2023-05-31 12:30:44
176	App\\Models\\User	39	39hunain devhunain88@gmail.com	2a78af357c5ba2a74727d45261a3373e4a9fe1ad1a66e00269c0c2831abfb248	["*"]	\N	2023-05-31 12:34:13	2023-05-31 12:34:13
177	App\\Models\\User	60	Personal Access Token	fa7331504096033c85d3ac80f153cff74dd0120a79ce7ba6f1fe196dc1b50032	["*"]	\N	2023-05-31 12:35:29	2023-05-31 12:35:29
178	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	e15ee8ab56e1d34586b7ebeaa48965c276779ddb991932be7dd7c4e4ea1b27ce	["*"]	\N	2023-05-31 12:40:30	2023-05-31 12:40:30
179	App\\Models\\User	47	47hunain ninehunain99@gmail.com	c7098e326a1fc541d8693fe19d5b17e1aad691cf2ad46bcbe80fe890e808682e	["*"]	\N	2023-05-31 15:11:43	2023-05-31 15:11:43
180	App\\Models\\User	47	47hunain ninehunain99@gmail.com	4995864eb4935e693112537482e8b23cf8cc91f2f546b480adc46c204c450856	["*"]	\N	2023-05-31 15:29:49	2023-05-31 15:29:49
181	App\\Models\\User	49	49test usertestuser1234@gmail.com	534c0fa8df8de44bbf5052a8aedcb0e2240f84822b443c97b3f478581108565e	["*"]	\N	2023-05-31 15:34:40	2023-05-31 15:34:40
182	App\\Models\\User	47	47hunain ninehunain99@gmail.com	ef49fd7bb9c388ff5976630983c54cf95779c421d08af666ee9a8032f905d884	["*"]	\N	2023-05-31 15:41:33	2023-05-31 15:41:33
183	App\\Models\\User	47	47hunain ninehunain99@gmail.com	7b201497bc2d4b4e762f555e49a2a2214ce1bd3b10a771f8c5d4293e357303ee	["*"]	\N	2023-05-31 15:52:03	2023-05-31 15:52:03
184	App\\Models\\User	39	39hunain devhunain88@gmail.com	e9bb84d12dacdf1abf38cc092ee7b2bb8b44187465a1c12fb24384dd55921e6c	["*"]	\N	2023-05-31 16:05:40	2023-05-31 16:05:40
185	App\\Models\\User	49	49test usertestuser1234@gmail.com	3a0c5f5c2dd32783d853eefaff2e3359bb1b810fbadd9a0dedf4d32d0b65cf20	["*"]	\N	2023-05-31 16:19:28	2023-05-31 16:19:28
186	App\\Models\\User	36	36Test Usertestuser@gmail.com	b39b39e4b71b2b9df7de91f89268e64e607c62d84ac33ab105da5889b3623b07	["*"]	\N	2023-05-31 17:15:15	2023-05-31 17:15:15
187	App\\Models\\User	59	Personal Access Token	3a29fe3ef25e41b13cbc1589be8eb8a2868e84178939bf9a45b796d30d8e7032	["*"]	\N	2023-05-31 17:16:14	2023-05-31 17:16:14
188	App\\Models\\User	36	36Test Usertestuser@gmail.com	3bc0a4a58eafa344dfbb3931b2c0979256226c92f5b2a26a6ea82cfd1c289a07	["*"]	\N	2023-05-31 17:29:02	2023-05-31 17:29:02
189	App\\Models\\User	36	36Test Usertestuser@gmail.com	b69579f4dee712b3f07ce6f027cbf69c909cbf88c873ebdb421cc27b92482bae	["*"]	\N	2023-05-31 19:34:38	2023-05-31 19:34:38
190	App\\Models\\User	36	36Test Usertestuser@gmail.com	8dc6c735f6a65f6f64e1b66133384f0c2d3b89ef2755227502f7c233e4d6ac7c	["*"]	\N	2023-05-31 20:27:48	2023-05-31 20:27:48
191	App\\Models\\User	36	36Test Usertestuser@gmail.com	63522ecf6e9815b8f62c772cd33a05301fe56d533e26057b83c7c70602e8a646	["*"]	\N	2023-05-31 21:51:38	2023-05-31 21:51:38
192	App\\Models\\User	61	Personal Access Token	d0730bb3d8ef5eda6dcede8627769af25c40e8f670c829b9d827529829975b3f	["*"]	\N	2023-05-31 22:36:01	2023-05-31 22:36:01
193	App\\Models\\User	62	Personal Access Token	042d628ea4b2e9b24e01f7d4cea392a82f0b31c23ac0ba669268e04bbb3a9289	["*"]	\N	2023-05-31 22:55:56	2023-05-31 22:55:56
194	App\\Models\\User	63	Personal Access Token	a0fbbcb40c85c250c5e1ad4798b69f73c3d640ec4d0a680bb5f60573259c1cf2	["*"]	\N	2023-05-31 22:59:51	2023-05-31 22:59:51
195	App\\Models\\User	63	63nasar testtest11@gmail.com	94ca73191df95e4ee06f3c96ea254bf9859e34813d8369af76e421a8e83c12ca	["*"]	\N	2023-05-31 23:00:02	2023-05-31 23:00:02
196	App\\Models\\User	64	Personal Access Token	84ea58724e2ccff04f6ba425b7a062e185427d095ec4cec1de0ea797da99f6a6	["*"]	\N	2023-06-01 04:24:49	2023-06-01 04:24:49
197	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	16d6587e76655b6cad53efd3ed8cd99c7869a4ea13b4a5968f03426516145889	["*"]	\N	2023-06-01 04:27:59	2023-06-01 04:27:59
198	App\\Models\\User	39	39hunain devhunain88@gmail.com	5b808dab6bf08ac9f7bef4345db5c5c5ec9131a24df4d02b7e1240e268161d4a	["*"]	\N	2023-06-01 04:58:39	2023-06-01 04:58:39
199	App\\Models\\User	64	64Ali Mohammadnbz02@mailinator.com	f3d30cd8be147b1ff253157dbfab51268da9ad4c76bbfa09fb08230621555d11	["*"]	\N	2023-06-01 05:24:24	2023-06-01 05:24:24
200	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	863b5d941415504a99c439e46a648a342c82e0d834d4abc55f3c90f4671e383e	["*"]	\N	2023-06-01 05:28:19	2023-06-01 05:28:19
201	App\\Models\\User	65	Personal Access Token	2ce49818760ed7e9732cbf964f2d1bb810bdf8379a50ce462fea723d36e2238b	["*"]	\N	2023-06-01 05:32:02	2023-06-01 05:32:02
202	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	2ad5940eafe550b6e65162a75a5d880a7332ff9c310ac82fe7baf5fc9656176c	["*"]	\N	2023-06-01 05:35:39	2023-06-01 05:35:39
203	App\\Models\\User	39	39hunain devhunain88@gmail.com	8769c2a1dea5118d05add0caaaec2bf655c6c34bf18154ebef2ce1969de0e4a1	["*"]	\N	2023-06-01 06:28:08	2023-06-01 06:28:08
204	App\\Models\\User	39	39hunain devhunain88@gmail.com	708729b685664d42dff36d238ea014023a32e37f135c90d37ca2a551e6a92077	["*"]	\N	2023-06-01 09:15:06	2023-06-01 09:15:06
205	App\\Models\\User	39	39hunain devhunain88@gmail.com	a833adebab837079c70a2ca7e13603fec02554f58942701696ef1eef5b866d1d	["*"]	\N	2023-06-01 10:17:50	2023-06-01 10:17:50
206	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	c523ee28ae7bee31c2deb96af0e88aaedaeb9ce2de434783a0fd7613d444953d	["*"]	\N	2023-06-01 10:20:34	2023-06-01 10:20:34
207	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	4577fd150705bed127a5fa8f5ced808e460fa7f4c255c8941eca0ddb4bee0185	["*"]	\N	2023-06-01 10:36:31	2023-06-01 10:36:31
208	App\\Models\\User	39	39hunain devhunain88@gmail.com	f10dca5e330fb81df016fca6d4a459ae394a9326ee247d3c79a05d194a670821	["*"]	\N	2023-06-01 10:40:42	2023-06-01 10:40:42
209	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	a9d87587fe4e70b35fe23327d556ba9ec179c8a91f1d3c0294cc1e515b1cd0f6	["*"]	\N	2023-06-01 15:49:26	2023-06-01 15:49:26
210	App\\Models\\User	47	47hunain Tenhunain99@gmail.com	99af156060a390c631aef3f23417a0dda20418d2bd9e5f1dd11493ca4c407bda	["*"]	\N	2023-06-01 16:26:25	2023-06-01 16:26:25
211	App\\Models\\User	39	39hunain devhunain88@gmail.com	92288baae46cfefaed6c35ec93e237462217c9faeeb9f3ba81900baff3d8c4e0	["*"]	\N	2023-06-01 16:28:22	2023-06-01 16:28:22
212	App\\Models\\User	47	47hunain Tenhunain99@gmail.com	d6f0921f531e4282416c7461201fd75e9ae704cedbc414846d220d99fcc6a56e	["*"]	\N	2023-06-01 16:29:32	2023-06-01 16:29:32
213	App\\Models\\User	36	36Test Usertestuser@gmail.com	c04793b56f95921074e628d9139bb51650bdc8ab172801f8b06f30cf1aaec21c	["*"]	\N	2023-06-01 16:36:54	2023-06-01 16:36:54
214	App\\Models\\User	39	39hunain devhunain88@gmail.com	5c8e0059b5b54e66dd2b31f9bb52496d2e580a96fe68a1383d53782dbd9d8be5	["*"]	\N	2023-06-01 17:16:13	2023-06-01 17:16:13
215	App\\Models\\User	36	36Test Usertestuser@gmail.com	92e308cc729e71e17114daedb5325873956d98364556f1ceb24ac1a0297eac14	["*"]	\N	2023-06-01 21:41:18	2023-06-01 21:41:18
216	App\\Models\\User	36	36Test Usertestuser@gmail.com	446ed78a5eea099b86203139121897c3ea2073ef75cca08516e37790ce1930b0	["*"]	\N	2023-06-01 21:45:27	2023-06-01 21:45:27
217	App\\Models\\User	66	Personal Access Token	261d64ea5f1055f42d749b3b3a6df693455c425d7057cfcf554a92e20ee6c887	["*"]	\N	2023-06-01 22:23:58	2023-06-01 22:23:58
218	App\\Models\\User	66	66zain falakzain@gmail.com	4050c65b63480e3e98a8139b3659e08e6e45d8c98ace703c833988db2ba46b60	["*"]	\N	2023-06-01 22:33:09	2023-06-01 22:33:09
219	App\\Models\\User	39	39hunain devhunain88@gmail.com	9f64702fbf9b6fd0dfb3783e95b985230f2acdfc9cce13b2802c30b8024ef382	["*"]	\N	2023-06-01 22:58:43	2023-06-01 22:58:43
220	App\\Models\\User	39	39hunain devhunain88@gmail.com	c42038886eb85507787269c1d7c16f98af52ba087aacf660aee3ea0e703103fb	["*"]	\N	2023-06-02 05:36:20	2023-06-02 05:36:20
221	App\\Models\\User	36	36Test Usertestuser@gmail.com	84e970ebd7b65dfeed17102dc9bca7406d696894bc79a1f6f788430ca9cb139c	["*"]	\N	2023-06-02 15:46:36	2023-06-02 15:46:36
222	App\\Models\\User	36	36Test Usertestuser@gmail.com	dcf065f2a27a32bd7d5ad28412c55ae5b4ea91b6f52ac99542e27b54505bb164	["*"]	\N	2023-06-02 15:48:54	2023-06-02 15:48:54
223	App\\Models\\User	67	Personal Access Token	613600236dc993c196771fa0ba94654b87c85d0f6dc675469e7157645d5e4cf2	["*"]	\N	2023-06-02 15:58:58	2023-06-02 15:58:58
224	App\\Models\\User	67	67usman testusman@gmail.com	420fd67323728284bf755972b1ce2c23687223a8cf3b81f07d927eb9995ac31a	["*"]	\N	2023-06-02 15:59:02	2023-06-02 15:59:02
225	App\\Models\\User	39	39hunain devhunain88@gmail.com	7881ba7e6770cf8ca6c314e63ff90dcd5d94f8b8d795312466a260e4e786a32a	["*"]	\N	2023-06-02 16:02:20	2023-06-02 16:02:20
226	App\\Models\\User	36	36Test Usertestuser@gmail.com	20687b1f1c9c4f2bc68157fae880b5c76d475679e318515b15e70375f929933a	["*"]	\N	2023-06-02 16:12:52	2023-06-02 16:12:52
227	App\\Models\\User	67	67usman testusman@gmail.com	b350cbc6d505e0625c9df96d8a6819bfa3bfb438d281dd44a59bf2a8d0854bbe	["*"]	\N	2023-06-02 16:18:14	2023-06-02 16:18:14
228	App\\Models\\User	68	Personal Access Token	7a4b9e801a012e1e6e1ad60e99333cb614185883e6930d740e7a208098fffad0	["*"]	\N	2023-06-02 16:20:19	2023-06-02 16:20:19
229	App\\Models\\User	68	68test useruser123@gmail.com	4e8f8563217eb296ba016a6f613729d021ec6fe2d81b92448213c9674c419057	["*"]	\N	2023-06-02 16:20:25	2023-06-02 16:20:25
230	App\\Models\\User	69	Personal Access Token	b3b16c50891bf06c2ea37171a594be60571f97602a8992c82d9669f2fe848e37	["*"]	\N	2023-06-02 16:50:23	2023-06-02 16:50:23
231	App\\Models\\User	69	69david testdavid@gmail.com	ac2f3978f3aca968678b4eeed55258a0406a7093eef4879dbbac6dac789aa6f4	["*"]	\N	2023-06-02 16:50:27	2023-06-02 16:50:27
232	App\\Models\\User	69	69david testdavid@gmail.com	484157d1c9e3bc72ac5f3e993c24a7bd8e8a79c6c9ec135dbd926eedc275b506	["*"]	\N	2023-06-02 17:11:47	2023-06-02 17:11:47
233	App\\Models\\User	69	69david testdavid@gmail.com	8ac8fce40b15755630340d572042602c23cd4dde9b9cbdf939a1e334a452f600	["*"]	\N	2023-06-02 17:13:28	2023-06-02 17:13:28
234	App\\Models\\User	69	69david testdavid@gmail.com	bc72be5b9339077e3cf165a93954a648e47c1a9a1743991e87f9c2452ccaec4a	["*"]	\N	2023-06-02 17:19:42	2023-06-02 17:19:42
235	App\\Models\\User	70	Personal Access Token	96b63c29f399044bc4e990c4aa0c869492872b833d8b09a6e38618dc4ce7486b	["*"]	\N	2023-06-02 17:22:19	2023-06-02 17:22:19
236	App\\Models\\User	70	70dxb testtestdxb@gmail.com	c227bb6ebc233cd2cc58f6a85857a673419ebb9dd31e56ba1a3966e53a4e4353	["*"]	\N	2023-06-02 17:22:26	2023-06-02 17:22:26
237	App\\Models\\User	71	Personal Access Token	ab24b6e4285c0f3a09cd2c1be09bf832ee9fdbe92327d17434fca23fc306fc38	["*"]	\N	2023-06-02 19:11:03	2023-06-02 19:11:03
238	App\\Models\\User	69	69david testdavid@gmail.com	b0235cbef3b58fd16f52acc5359da4f09650a694531275cd622898cde2cd76a1	["*"]	\N	2023-06-02 19:17:07	2023-06-02 19:17:07
239	App\\Models\\User	69	69david testdavid@gmail.com	bcc4378e67db2c71abb598e187ef1dde55c7fd6c7578eaffecff66b9011bcef4	["*"]	\N	2023-06-02 20:33:56	2023-06-02 20:33:56
240	App\\Models\\User	69	69david testdavid@gmail.com	10fff423256c1096e95115a9561ede4a678734d071338311ca7d50c1e1190f81	["*"]	\N	2023-06-02 21:18:26	2023-06-02 21:18:26
241	App\\Models\\User	69	69david testdavid@gmail.com	c4b7fd6e515616e8511cf4731d1ecef44fdaa929457631547ead20814d243d50	["*"]	\N	2023-06-02 21:18:47	2023-06-02 21:18:47
242	App\\Models\\User	72	Personal Access Token	332ea47124520ac45b6033091e646fc9ae7b2e0c5e567eedaba439fc0cfdf4ab	["*"]	\N	2023-06-02 21:51:38	2023-06-02 21:51:38
243	App\\Models\\User	72	72frank testfrank@gmail.com	e6e90fb48b223e4a4f6c244be1da3c15fa0838c55c0d2be90c5cc67e6e5912dd	["*"]	\N	2023-06-02 21:51:45	2023-06-02 21:51:45
244	App\\Models\\User	69	69david testdavid@gmail.com	d363ed46209f852309705ed4f72d075862b7b9bafe92423158487fd1a2dda602	["*"]	\N	2023-06-02 22:08:04	2023-06-02 22:08:04
245	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	e8bc016b1d54e3ebf0524a50cbc3a752276d3db970bceff7872a253a183bf5ee	["*"]	\N	2023-06-03 05:19:49	2023-06-03 05:19:49
246	App\\Models\\User	73	Personal Access Token	e75bf094b14659abccd24418c96ec92691e2aec2fb61e98196950bb4a2d8ea43	["*"]	\N	2023-06-03 05:40:37	2023-06-03 05:40:37
247	App\\Models\\User	73	73Abdul Rahimnbz03@mailinator.com	bc32ec4c3750ae11f0d83dc3b7c6e77233d15595fea07fa02034e90e9cb7d55d	["*"]	\N	2023-06-03 06:14:33	2023-06-03 06:14:33
248	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	5f51516d19c4459f55fac7f614e876a06cb3f9e63526b8aa340ab28413830a43	["*"]	\N	2023-06-03 06:15:31	2023-06-03 06:15:31
249	App\\Models\\User	73	73Abdul Rahimnbz03@mailinator.com	acabec81e28dacfdc579c281df234110f211de0e4a51f64c280fe9b11e991d4f	["*"]	\N	2023-06-03 10:53:52	2023-06-03 10:53:52
250	App\\Models\\User	73	73Abdul Rahimnbz03@mailinator.com	6fd4df122434e78e0b7a698470ddef679cc83be74371645a4028e34c55474f27	["*"]	\N	2023-06-03 11:02:38	2023-06-03 11:02:38
251	App\\Models\\User	39	39hunain devhunain88@gmail.com	0a6635096e7e64d3bb449adcb40e12ab321efdbce09df6fac8581a78ae9f3a91	["*"]	\N	2023-06-04 03:11:21	2023-06-04 03:11:21
252	App\\Models\\User	39	39hunain devhunain88@gmail.com	fffb4d430352ada09cacb0769a04406b1b91d52903910366ecdfbb51363296cb	["*"]	\N	2023-06-04 03:38:57	2023-06-04 03:38:57
253	App\\Models\\User	47	47hunain Tenhunain99@gmail.com	619f5385ee25efa545d1b68c61fdd649aa94a66625e829ce31babcd93d82887f	["*"]	\N	2023-06-04 05:42:39	2023-06-04 05:42:39
254	App\\Models\\User	47	47hunain Tenhunain99@gmail.com	ee264e00ebf6b120708e02cc13117f32b8b90625487aca293cd5c59112ac1688	["*"]	\N	2023-06-04 05:43:21	2023-06-04 05:43:21
255	App\\Models\\User	39	39hunain devhunain88@gmail.com	1453eb532813e663341b82d7765c881b78a8018c32eca187d481a55f75b8c973	["*"]	\N	2023-06-04 05:47:29	2023-06-04 05:47:29
256	App\\Models\\User	39	39hunain devhunain88@gmail.com	08cd8c9c3c9ece5d357ad88e8d3545c349b079c07eec740876a5e78e76f0278a	["*"]	\N	2023-06-04 08:29:46	2023-06-04 08:29:46
257	App\\Models\\User	39	39hunain devhunain88@gmail.com	37f2fae892f4d403c2e802622e9aaaa0ed3e0c04455856abc4d279c75ea4091c	["*"]	\N	2023-06-04 09:03:39	2023-06-04 09:03:39
258	App\\Models\\User	74	Personal Access Token	c53fccc46f10f66606fc01b728ea4368753ee04a788d10fab4af6cca673cf368	["*"]	\N	2023-06-04 09:03:52	2023-06-04 09:03:52
259	App\\Models\\User	75	Personal Access Token	89b55e0277d44bec75682d5e90a99b991ee1c251a80023624ce6f2803f5e6a3a	["*"]	\N	2023-06-04 09:06:19	2023-06-04 09:06:19
260	App\\Models\\User	76	Personal Access Token	961875870dcec6a9f23b27824a1d19c1c86b005dd2ed3c75a79857a06a838c66	["*"]	\N	2023-06-04 09:16:04	2023-06-04 09:16:04
261	App\\Models\\User	76	76new testtesttest@gmail.com	be3f6a75c1800a2f5e56c4bbfc2ae582186b9cbae94567002bffbbefb4ee8da7	["*"]	\N	2023-06-04 09:16:33	2023-06-04 09:16:33
262	App\\Models\\User	39	39hunain devhunain88@gmail.com	831111bd4ac7a2f25781fc328ca25018758114b7bc9b555efdf033cd2a355ccb	["*"]	\N	2023-06-04 09:28:26	2023-06-04 09:28:26
263	App\\Models\\User	77	Personal Access Token	2c343673fff1ed97ac5915240aa4c3503bc7efc4fc5ed54306f4a77f7ad9dece	["*"]	\N	2023-06-04 09:31:14	2023-06-04 09:31:14
264	App\\Models\\User	39	39hunain devhunain88@gmail.com	8b4490f7e2596b8a545e7ddd825ba71d4a175b6fa1a042b115739e3edac6e67c	["*"]	\N	2023-06-04 09:31:41	2023-06-04 09:31:41
265	App\\Models\\User	39	39hunain devhunain88@gmail.com	c251cf3d6397e1ad8f82312445efc9213d121af7fdfff9085e7155b8d5ee3005	["*"]	\N	2023-06-04 09:42:29	2023-06-04 09:42:29
266	App\\Models\\User	78	Personal Access Token	472b1f70acadec77b076491434a745b66dc3cef92f9522c572c58bb69fb709cd	["*"]	\N	2023-06-04 09:53:24	2023-06-04 09:53:24
267	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	d3bc5dfd18c0344f9b013df078383ffde7ecd2ef33a28c04b01554e401c5b2cc	["*"]	\N	2023-06-04 16:08:27	2023-06-04 16:08:27
268	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	a3d9006eb898d69551dfe6ef46bcfef294df9f48d5b817575857dee69f8c3ab8	["*"]	\N	2023-06-04 16:14:41	2023-06-04 16:14:41
269	App\\Models\\User	79	Personal Access Token	14ae0dd9cb8f6538fe396a3322429ebf039d3abe9e014d481c061c53c9189d27	["*"]	\N	2023-06-04 17:02:00	2023-06-04 17:02:00
270	App\\Models\\User	80	Personal Access Token	1748e899691783c4c4756cd3f5ecbcc156b9c35efa991aaabae71afd53a523e7	["*"]	\N	2023-06-04 17:04:36	2023-06-04 17:04:36
271	App\\Models\\User	81	Personal Access Token	384c419cf2395d31da9ad35561e1c4e6ac37bb4caaf5140ee0bb3986211d2927	["*"]	\N	2023-06-04 17:07:08	2023-06-04 17:07:08
272	App\\Models\\User	81	81new nasarnewnasar@gmail.com	854431d30ecb760f3e880574cb3a585d9bb98349c263be0c095aa1637638e6b8	["*"]	\N	2023-06-04 17:07:14	2023-06-04 17:07:14
273	App\\Models\\User	82	Personal Access Token	4263413b0a42d0f9302f17e0626f4504b68977199cb6f74e8115ed9c0c9689b4	["*"]	\N	2023-06-05 01:27:14	2023-06-05 01:27:14
274	App\\Models\\User	82	82anil naveianilnavis@gmail.com	f0b379992dbb4ca5aa09dd3ea5e9520a4fb4c8acd3e7efc7359ff5e6bc109364	["*"]	\N	2023-06-05 01:28:00	2023-06-05 01:28:00
275	App\\Models\\User	83	Personal Access Token	99318bfec2e2654d6839291e7249fe284e210bc5033a08db13183846d7b74ad7	["*"]	\N	2023-06-05 03:43:10	2023-06-05 03:43:10
276	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	928b60ca64ab30d4ffc30f54b3e379c5224737ba345e1c4acb786105b7c9befb	["*"]	\N	2023-06-05 04:15:43	2023-06-05 04:15:43
277	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	324d0bb5cbec8f55b2ecf1a2c7c2ba2c2a97f50dff1a3e307802adf424862752	["*"]	\N	2023-06-05 04:21:42	2023-06-05 04:21:42
278	App\\Models\\User	82	Personal Access Token	8044c0f56c49fbcb430a8f510ee83b5e9ea9ad7a0b5db5f74a2f623f8da328c9	["*"]	\N	2023-06-05 04:28:04	2023-06-05 04:28:04
279	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	1119ec45501dd9c387990bbccbc0659100625f4985db51cd71a05eb6b7d3f8b2	["*"]	\N	2023-06-05 04:42:40	2023-06-05 04:42:40
280	App\\Models\\User	84	Personal Access Token	f4dccc412138bad40ace820c5862005e5b03563239c9a0a57ced0d42b5addbd1	["*"]	\N	2023-06-05 04:47:46	2023-06-05 04:47:46
281	App\\Models\\User	85	Personal Access Token	4b9bb931374a32b5a18b1d815132a58d2d7aefc51c040471357bb7e228c5f13c	["*"]	\N	2023-06-05 04:50:03	2023-06-05 04:50:03
282	App\\Models\\User	39	39hunain devhunain88@gmail.com	4a53b88d04eee51eba8749a444361a39b90a8648effacef4fa6819a5345649d4	["*"]	\N	2023-06-05 05:14:09	2023-06-05 05:14:09
283	App\\Models\\User	86	Personal Access Token	19dc4cc962654660263daf59d37253895ae66d3decb106c5a926f2a85c3ab822	["*"]	\N	2023-06-05 05:29:49	2023-06-05 05:29:49
284	App\\Models\\User	36	36Test Usertestuser@gmail.com	990a9a0242be472c9dba5c19309e28a99437e7850df66c8a339d357df43ee93f	["*"]	\N	2023-06-05 05:30:23	2023-06-05 05:30:23
285	App\\Models\\User	64	64Ali Mohammadnbz02@mailinator.com	52d5f5bff5d77602a4578fa59cd193f088c5ab75374aba3f52b82c6f8efc754e	["*"]	\N	2023-06-05 05:30:59	2023-06-05 05:30:59
286	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	96780fde288578e9a658e83ef1d8a20fae5950cfc458f86a2cf5b436528dfd67	["*"]	\N	2023-06-05 05:34:02	2023-06-05 05:34:02
287	App\\Models\\User	86	Personal Access Token	fc63e957693671d1c55be1556dd77b534e3c40f7ba5736e0e729ef91ca2ebcfc	["*"]	\N	2023-06-05 05:35:02	2023-06-05 05:35:02
288	App\\Models\\User	86	Personal Access Token	cecd1060b768261dfdd09b4cc6a01672a0976f059a3163386ec878b074097cae	["*"]	\N	2023-06-05 05:42:40	2023-06-05 05:42:40
289	App\\Models\\User	86	Personal Access Token	b02c5ee32de51c91b2c979c225bdf42fed6d74b017062eea2ff076a6d043e298	["*"]	\N	2023-06-05 05:47:31	2023-06-05 05:47:31
290	App\\Models\\User	87	Personal Access Token	34d4495eaa6bab2f8b9b164ef8f62efcc4d538b12dce0d05a9a0f5e3cbb4ddcd	["*"]	\N	2023-06-05 06:34:55	2023-06-05 06:34:55
291	App\\Models\\User	87	87John Doedenewe5059@gmail.com	ac65c694602ea391dd99b97f9790a0535620267ad8f75c4a311660296c7ab97c	["*"]	\N	2023-06-05 06:35:56	2023-06-05 06:35:56
292	App\\Models\\User	39	39hunain devhunain88@gmail.com	f62c71e23406bb68c172cc3db25ef9c7d2d7767351831ff7c6fecbe09ec392bf	["*"]	\N	2023-06-05 06:41:56	2023-06-05 06:41:56
293	App\\Models\\User	36	36Test Usertestuser@gmail.com	80ce0fe7d01ad70c27d3b7a034462ad0938b6d20231144d05587439403e3d622	["*"]	\N	2023-06-05 06:59:09	2023-06-05 06:59:09
294	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	15d7a8ff69df30c696705f7bf91b51d0a01c4591f478989386ec4be9e3e0413e	["*"]	\N	2023-06-05 07:07:24	2023-06-05 07:07:24
295	App\\Models\\User	88	Personal Access Token	64bc1defdb629d9f0bc793156bc910b5f9d0dfbcc1342c76bc0c43ec8d8e6373	["*"]	\N	2023-06-05 07:19:15	2023-06-05 07:19:15
296	App\\Models\\User	88	88Arka Ballalnbz06@mailinator.com	3fc3b4899897b0483478446e7daba66982051a0138eca1c0ade9014953ac9bb4	["*"]	\N	2023-06-05 07:19:32	2023-06-05 07:19:32
297	App\\Models\\User	83	Personal Access Token	16b3f6a439bf492232670152a0663fcea7b29b57839ec30ca32c4cd4815062dc	["*"]	\N	2023-06-05 07:21:42	2023-06-05 07:21:42
298	App\\Models\\User	83	Personal Access Token	118fc67801c795f252bcac50ba0af889635949573b3d0e10ec5c24d7b01a8e24	["*"]	\N	2023-06-05 07:22:19	2023-06-05 07:22:19
299	App\\Models\\User	83	Personal Access Token	45bb92e4f845c6c6cf0b87cb5363949baf658e474ce7823df9daee977d23722b	["*"]	\N	2023-06-05 07:23:08	2023-06-05 07:23:08
300	App\\Models\\User	83	Personal Access Token	24f3f552c3611fb19347127e958afd8dc224024f6d2ea85d2515bfb856b04b6a	["*"]	\N	2023-06-05 07:23:35	2023-06-05 07:23:35
301	App\\Models\\User	56	Personal Access Token	ec17fc7c5e648505e509dd5d7455aa0fde29a73f06aa55810ef17ada3d5909f5	["*"]	\N	2023-06-05 07:27:43	2023-06-05 07:27:43
302	App\\Models\\User	60	Personal Access Token	8aca5c9bdddfee4f70eed1e805cdb0e3a10229f92489a2c8ac346ffbf9d8dcd2	["*"]	\N	2023-06-05 07:29:06	2023-06-05 07:29:06
303	App\\Models\\User	59	Personal Access Token	a90f35b598412509b70bddcbae852b78934296be88f7c44000fefde94673a5d3	["*"]	\N	2023-06-05 07:29:40	2023-06-05 07:29:40
304	App\\Models\\User	89	Personal Access Token	1ab2aa9d13d748b25505e09f8dfef2d1bfb7be8014f781e3714e9bd961424e2b	["*"]	\N	2023-06-05 07:29:54	2023-06-05 07:29:54
305	App\\Models\\User	89	Personal Access Token	f753b7058e30112c3eb4d0df1a199af538d0607d2a82e1de3d7a6dfd873179b2	["*"]	\N	2023-06-05 07:30:19	2023-06-05 07:30:19
306	App\\Models\\User	89	Personal Access Token	48263da0dd6c09ad2d25baa70f1945a97a116ef8d687876fd34dcfa7ee7af7bd	["*"]	\N	2023-06-05 07:31:43	2023-06-05 07:31:43
307	App\\Models\\User	39	39hunain devhunain88@gmail.com	7a1a99597187722450f5f18683b96efe76901f820648aecf93cc273404457def	["*"]	\N	2023-06-05 07:32:21	2023-06-05 07:32:21
308	App\\Models\\User	36	36Test Usertestuser@gmail.com	47883d2d7bcf41031d43274e9b54368698ac22fc2e7e0f7b1eb7a94dc76f4c71	["*"]	\N	2023-06-05 07:41:30	2023-06-05 07:41:30
309	App\\Models\\User	88	88Arka Ballalnbz06@mailinator.com	f080558fa53702bb68817142a69ea888675d0b32a8e5b4a8b7b901e6083dd096	["*"]	\N	2023-06-05 07:41:48	2023-06-05 07:41:48
310	App\\Models\\User	39	39hunain devhunain88@gmail.com	e98e41bc78372abcaef5532abbc78e5eec52cdcb121bb3fc046082f8f61d154c	["*"]	\N	2023-06-05 07:51:42	2023-06-05 07:51:42
311	App\\Models\\User	36	36Test Usertestuser@gmail.com	d5752472a8404146e9db8ae87d4341380943c830b8d4c60a2de1597a47d439f7	["*"]	\N	2023-06-05 07:55:35	2023-06-05 07:55:35
312	App\\Models\\User	39	39hunain devhunain88@gmail.com	240b7771a9aa0c2e7136176751f8cdb63f03fb6a47fe7a3b1cefa6b74f28769b	["*"]	\N	2023-06-05 07:55:58	2023-06-05 07:55:58
313	App\\Models\\User	39	39hunain devhunain88@gmail.com	96bf9f10b0c5761fc9b31ff299f1a62070223c56c81469927fbd5459abf70649	["*"]	\N	2023-06-05 07:56:31	2023-06-05 07:56:31
314	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	9766b792edf35b9c38c5def9ca19125e5a853872d5f274514b28082030a9aa34	["*"]	\N	2023-06-05 08:11:29	2023-06-05 08:11:29
315	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	20d2b219e22491b1039757f7d1695974ab52dfd2019ca61816edad30e86f6c5c	["*"]	\N	2023-06-05 08:16:15	2023-06-05 08:16:15
316	App\\Models\\User	88	88Arka Ballalnbz06@mailinator.com	ee53c019d32b9039da0f3786e8ae3b0ccdd58336aad8853a08d00ef8b2b6c71b	["*"]	\N	2023-06-05 08:19:48	2023-06-05 08:19:48
317	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	895ef18dbdcd77a1cf4cfef96b6ddfb54902cae0cef21abc10e5345672106ee0	["*"]	\N	2023-06-05 08:40:38	2023-06-05 08:40:38
318	App\\Models\\User	39	39hunain devhunain88@gmail.com	0001a4e7d5adeaa8fb61b89df227b045bd42ecf3a2f4887e590dcfa0fc73cf7d	["*"]	\N	2023-06-05 08:42:14	2023-06-05 08:42:14
319	App\\Models\\User	90	Personal Access Token	ffc684fadeb590c80f7432c2e65d30d24a18316326ae2565028de4f206b5b2f4	["*"]	\N	2023-06-05 08:44:52	2023-06-05 08:44:52
320	App\\Models\\User	39	39hunain devhunain88@gmail.com	ab44739ed52acda5bdf60722e7f29c8d86e9259fef017316dc201e8be8868cb3	["*"]	\N	2023-06-05 08:49:03	2023-06-05 08:49:03
321	App\\Models\\User	91	Personal Access Token	95a2852dc0ab5d1f9bbd9a5ecaa2c1272ad4bbf5ecbdd7d9d0aae815e4888f5f	["*"]	\N	2023-06-05 08:52:51	2023-06-05 08:52:51
322	App\\Models\\User	92	Personal Access Token	803fac8de5fd29ca3d55b8c1dfacf740169eda66f9834e53782af5742c4cd8ba	["*"]	\N	2023-06-05 08:55:27	2023-06-05 08:55:27
323	App\\Models\\User	39	39hunain devhunain88@gmail.com	887bed00b8537bb4b951bce5bb2e8a33a84dfbbec3a890fbcb1a6545a1a9c9e6	["*"]	\N	2023-06-05 08:58:39	2023-06-05 08:58:39
324	App\\Models\\User	92	92huna Devhunain999@gmail.com	56db6164995bb1669540a4c499896f73a1546db383ada5eaae68df5cfe74ddeb	["*"]	\N	2023-06-05 09:00:05	2023-06-05 09:00:05
325	App\\Models\\User	39	39hunain devhunain88@gmail.com	3cec87d422766da69872bc518b65d724b2131d473f46c3992a13d6a42c2109f8	["*"]	\N	2023-06-05 09:00:31	2023-06-05 09:00:31
326	App\\Models\\User	89	Personal Access Token	3fb32ae5ebb35051f73f43bf8cf7696d09e027c542320c679346aef6c5822643	["*"]	\N	2023-06-05 09:07:03	2023-06-05 09:07:03
327	App\\Models\\User	39	39hunain devhunain88@gmail.com	e863b65bd875e15f2f3bfb57a2f56072cf84a059c2509ec21389de9baff00b88	["*"]	\N	2023-06-05 09:07:43	2023-06-05 09:07:43
328	App\\Models\\User	93	Personal Access Token	24231ca75edce38da57f08d31751690d2e58a6907c5f66a2e5289cf98209457d	["*"]	\N	2023-06-05 09:37:03	2023-06-05 09:37:03
329	App\\Models\\User	92	92huna Devhunain999@gmail.com	65ab18f520101250aa759055a72e30f8a9049b82c0ef2fd2c28bfb35cb2f42cd	["*"]	\N	2023-06-05 09:53:10	2023-06-05 09:53:10
330	App\\Models\\User	93	Personal Access Token	035c15876bd5a73ee88e5224f4648c3d9a45e4a943df8aa49bc385e16171347c	["*"]	\N	2023-06-05 10:15:49	2023-06-05 10:15:49
331	App\\Models\\User	93	Personal Access Token	cca9b5499d1a65f703e86cb85a1f75f1016bc6d70e8a260927a6dd82db1a4ca1	["*"]	\N	2023-06-05 10:17:42	2023-06-05 10:17:42
332	App\\Models\\User	93	Personal Access Token	abd0d880b2628915c6e6cece479f311b75bae9c67a4871a9b78995d992ed222d	["*"]	\N	2023-06-05 10:21:06	2023-06-05 10:21:06
333	App\\Models\\User	93	Personal Access Token	0484a36917cabac0c9bdc9e4f5ac9cedcc485e9cbb5a0f92c2eda6106009f949	["*"]	\N	2023-06-05 10:23:14	2023-06-05 10:23:14
334	App\\Models\\User	93	Personal Access Token	1faee543a51899f29b485f0005a1d2c1e0a3bad1928ea064bae26ce084a8e246	["*"]	\N	2023-06-05 10:26:33	2023-06-05 10:26:33
335	App\\Models\\User	93	Personal Access Token	81b673437351bf32468cb7e8b489a8e1e4900ad05001e92b9585be55abb2df05	["*"]	\N	2023-06-05 10:27:10	2023-06-05 10:27:10
336	App\\Models\\User	93	Personal Access Token	6a398628331ef151d776718f92729401abf3e5a6a668eb5a5b9491dc50370dbe	["*"]	\N	2023-06-05 10:30:26	2023-06-05 10:30:26
337	App\\Models\\User	39	39hunain devhunain88@gmail.com	7cdc9b02fcddf4641522fb89d07b00d1333c0679b9d3f1ed653c57d212dbccd9	["*"]	\N	2023-06-05 10:30:57	2023-06-05 10:30:57
338	App\\Models\\User	93	Personal Access Token	0adef812f69b6427083f0bf54ac57e4e3244ebbf2c7c534dbeb7b54b7e4de883	["*"]	\N	2023-06-05 10:31:48	2023-06-05 10:31:48
339	App\\Models\\User	47	47hunain Tenhunain99@gmail.com	1ee8eb0f594a6b82d3c8cd42230efc6f83bb415579da1420235dd6ec4861c3a3	["*"]	\N	2023-06-05 10:38:06	2023-06-05 10:38:06
340	App\\Models\\User	92	92huna Devhunain999@gmail.com	18b741e9b8eea870c910aa8ddbdf568d9afd6a3e07d66d8a40c75d2010eafb8d	["*"]	\N	2023-06-05 10:45:03	2023-06-05 10:45:03
341	App\\Models\\User	39	39hunain devhunain88@gmail.com	3cfc4acd8aafc924f14ab943802b1aa083510bcdf1265b2b328bd000c77a39d6	["*"]	\N	2023-06-05 11:05:41	2023-06-05 11:05:41
342	App\\Models\\User	93	Personal Access Token	6615da865f8ca7d74c6f173e55d75db1c46cd24fb001afcab1ca326ae1288efe	["*"]	\N	2023-06-05 11:36:54	2023-06-05 11:36:54
343	App\\Models\\User	93	Personal Access Token	01c8c44093e047eddf43180cbfa2df21a45789edd5767f207e4186bc0a0e75f5	["*"]	\N	2023-06-05 11:37:44	2023-06-05 11:37:44
344	App\\Models\\User	93	Personal Access Token	ab19e2c319a87c94e9424999a08c52f397f9953e679d4d188b4d0c585fbb1224	["*"]	\N	2023-06-05 11:38:30	2023-06-05 11:38:30
345	App\\Models\\User	93	Personal Access Token	981cbf74de668622240ed4ad6b8d2305e94591d0ace7804d95cd3d94325c85db	["*"]	\N	2023-06-05 11:41:31	2023-06-05 11:41:31
346	App\\Models\\User	93	Personal Access Token	5ebbcda91046e73ce8e329fbefab7586d08a69e5b66718a0682bb27587452510	["*"]	\N	2023-06-05 11:43:20	2023-06-05 11:43:20
347	App\\Models\\User	93	Personal Access Token	bfba56fa051921ee768ab47bc588afe61d534e466424d3c30728f70f7c9da990	["*"]	\N	2023-06-05 11:48:55	2023-06-05 11:48:55
348	App\\Models\\User	93	Personal Access Token	ab1ba3f113cd62cc9c6cc524c6a318d3b49ce34296623bf9d4cdf24fe2c33b3f	["*"]	\N	2023-06-05 11:50:36	2023-06-05 11:50:36
349	App\\Models\\User	60	Personal Access Token	0c4f9fffda6983bfd66dddeb36f2db7f7dd7fd158a95c8a37ec0ab197c5ec83a	["*"]	\N	2023-06-05 11:58:13	2023-06-05 11:58:13
350	App\\Models\\User	60	Personal Access Token	c77e63809ee128f0df9401ba4134f4366ae288a32b028725078d9f3df21a2e33	["*"]	\N	2023-06-05 11:59:04	2023-06-05 11:59:04
351	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	7f8cb6860bae1e1cb017b28eb0fa0c8bf3888f414eeefd84059dd39cf2c06fc6	["*"]	\N	2023-06-05 12:04:35	2023-06-05 12:04:35
352	App\\Models\\User	73	73Abdul Rahimnbz03@mailinator.com	a825eaabb635ec4edbc64f6f2a3d5bbac44d7c10d22011a2d7e3651a6435e712	["*"]	\N	2023-06-05 12:09:16	2023-06-05 12:09:16
353	App\\Models\\User	93	Personal Access Token	057e81dfee6f9c4e2ddee641ae04a3612d8c57896779c992e69d94218e485a30	["*"]	\N	2023-06-05 12:13:20	2023-06-05 12:13:20
354	App\\Models\\User	39	39hunain devhunain88@gmail.com	158f9f0d186bb5585a8b421ad3b9178b9958e0ec9c1279dfb97539925dd3406f	["*"]	\N	2023-06-05 12:15:12	2023-06-05 12:15:12
355	App\\Models\\User	93	Personal Access Token	597698b5d4d743ab6e8a12f7393a51671406ca7df046030606a717926a3004b1	["*"]	\N	2023-06-05 12:16:09	2023-06-05 12:16:09
356	App\\Models\\User	93	Personal Access Token	3452c202833a3a4a983a8af819d3260beab1ccbae38648341fc98a9841814e9b	["*"]	\N	2023-06-05 12:18:48	2023-06-05 12:18:48
357	App\\Models\\User	73	73Abdul Rahimnbz03@mailinator.com	438ef802d48158f17f831ab1af85a512fe1d45bf12147d9e47a2f06004ae7fa5	["*"]	\N	2023-06-05 12:22:37	2023-06-05 12:22:37
358	App\\Models\\User	93	Personal Access Token	d3a78418fb5a5317b774d4a2056b7d2136ab27b3ca8eebaacc9d3789957d6486	["*"]	\N	2023-06-05 12:25:17	2023-06-05 12:25:17
359	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	eb974fe47627b28e7e0974327c9fddda4ab8a16386971442ed854ad1313ba512	["*"]	\N	2023-06-05 12:26:53	2023-06-05 12:26:53
360	App\\Models\\User	39	39hunain devhunain88@gmail.com	f1fbcb91cfcee0b650514eecef820bd74cace0cbd6acf75496069af7bad67cf1	["*"]	\N	2023-06-05 12:28:44	2023-06-05 12:28:44
361	App\\Models\\User	92	92huna Devhunain999@gmail.com	fd36ab30bb8697d06202f6bc8cef9beae145f4900da8e9a0a6a4c7040fae5947	["*"]	\N	2023-06-05 12:29:50	2023-06-05 12:29:50
362	App\\Models\\User	73	73Abdul Rahimnbz03@mailinator.com	2abf3a71badcb5c681793b9331c4202281d9d3f566afbbd99396b8c415ae76cf	["*"]	\N	2023-06-05 12:31:18	2023-06-05 12:31:18
363	App\\Models\\User	73	73Abdul Rahimnbz03@mailinator.com	50399f7749c0ce54ed80b26d1ef6743a4b5f0e8c62b1035ab3a4146818d53e94	["*"]	\N	2023-06-05 12:32:44	2023-06-05 12:32:44
364	App\\Models\\User	64	64Ali Mohammadnbz02@mailinator.com	d09228c7bcc5fc7d855cf758a69c4963b3ead88fb61c8516f457a6ab637703ed	["*"]	\N	2023-06-05 12:46:32	2023-06-05 12:46:32
365	App\\Models\\User	93	Personal Access Token	53bdee071383c67e0d1759d32dccaffbe2379edad08a6bec4f3032512d4493b6	["*"]	\N	2023-06-05 12:49:27	2023-06-05 12:49:27
366	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	3fec76480ee1aad331be729013641b579958c28f8e363cfb522483e711075dff	["*"]	\N	2023-06-05 12:52:13	2023-06-05 12:52:13
367	App\\Models\\User	94	Personal Access Token	67514c1173f8b1c83607b2fb58fabda2956efaa900900c4772e7f6b1bd15e12d	["*"]	\N	2023-06-05 12:54:11	2023-06-05 12:54:11
368	App\\Models\\User	39	39hunain devhunain88@gmail.com	c1c579c1d29f8d9615245338189c4da00622b1d9d62833e7202026645725646e	["*"]	\N	2023-06-05 12:54:19	2023-06-05 12:54:19
369	App\\Models\\User	93	Personal Access Token	ad56ab8621b777c484ac0e84434008d94ab583a08079181a0e9fa27c1b5b0ed7	["*"]	\N	2023-06-05 12:55:29	2023-06-05 12:55:29
370	App\\Models\\User	56	Personal Access Token	27323a7759bedc02483c199605f298552762e5135500f2385fb362ef9ae60b86	["*"]	\N	2023-06-05 13:05:55	2023-06-05 13:05:55
371	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	cb2c6be75b15aec14e958e7cf7ab6dd59130b5d87539c06f741e67b97f094a8c	["*"]	\N	2023-06-05 13:06:14	2023-06-05 13:06:14
372	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	30d60c66237a3c329d1be61bb0dd91afaef0bb79976192fb1b03d6daeaf32868	["*"]	\N	2023-06-05 13:06:21	2023-06-05 13:06:21
373	App\\Models\\User	56	Personal Access Token	6998cc3abb5fdebc1b4188b65365cf7a9b1f918b33a81183f182afd0d70cf287	["*"]	\N	2023-06-05 13:06:24	2023-06-05 13:06:24
374	App\\Models\\User	39	39hunain devhunain88@gmail.com	1ae8711b65f3f47c4b7625f024186840bc48b8ab22a8dee719e344d01bd170e7	["*"]	\N	2023-06-05 13:07:39	2023-06-05 13:07:39
375	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	24304279b2210f58897ed047d375be3d26a3cd6beae9922fff6063bb6e1e4108	["*"]	\N	2023-06-05 13:15:04	2023-06-05 13:15:04
376	App\\Models\\User	93	Personal Access Token	c59a3624c73326060079ff6927dca33d6c87641c025146215263990e52b4cf49	["*"]	\N	2023-06-05 13:20:16	2023-06-05 13:20:16
377	App\\Models\\User	93	Personal Access Token	37b70d2c0dba9b2b10ce09f598ece39d30fe019b2dce73793e4b2684fa4172bf	["*"]	\N	2023-06-05 13:20:46	2023-06-05 13:20:46
378	App\\Models\\User	95	Personal Access Token	ff20055abef870fb32d41526e2a712c5fb459787f09573faa105688075438a41	["*"]	\N	2023-06-05 13:38:05	2023-06-05 13:38:05
379	App\\Models\\User	95	Personal Access Token	044423d0bcd5a3fb3cb828fce4ed84fc77b2c49165c73e63aaa41b5c389a8578	["*"]	\N	2023-06-05 13:39:10	2023-06-05 13:39:10
380	App\\Models\\User	95	Personal Access Token	7af615e5229ae55489257a0d1d90f17bf6067a38a9e91dededc92ea820ba9dfb	["*"]	\N	2023-06-05 13:41:38	2023-06-05 13:41:38
381	App\\Models\\User	95	Personal Access Token	c80e5536590efb304f03799c71cbd3de36a3aaca164bee61d75505d8a6b77778	["*"]	\N	2023-06-05 13:43:09	2023-06-05 13:43:09
382	App\\Models\\User	95	Personal Access Token	0567876464a3c96d62318fc767448ef54587d52dfc86b5afac84d4c1cb00e4e4	["*"]	\N	2023-06-05 13:44:54	2023-06-05 13:44:54
383	App\\Models\\User	96	Personal Access Token	e834f8f07f3c16d2c675d9b50cd46abbc3847bcf5a54f53719f9c030dd433b58	["*"]	\N	2023-06-05 13:45:10	2023-06-05 13:45:10
384	App\\Models\\User	96	Personal Access Token	435d32617a6421b944fc5437bf49bb1b053d64a0d51584ac1d2c5cb22fb6195c	["*"]	\N	2023-06-05 14:00:55	2023-06-05 14:00:55
385	App\\Models\\User	96	Personal Access Token	7f09e6027e90912ec08c639c7150e232f6e4780a1b037672c81b646a9c17cd4d	["*"]	\N	2023-06-05 14:07:01	2023-06-05 14:07:01
386	App\\Models\\User	96	Personal Access Token	48cef4d29d69c5f41a50523e192890d01f7f473c140b1987cea8e0ff520d279d	["*"]	\N	2023-06-05 14:07:53	2023-06-05 14:07:53
387	App\\Models\\User	97	Personal Access Token	ddef8761d1e7c32ae6d798019141fa49660763908ffe541783638900c7e2c0f4	["*"]	\N	2023-06-05 14:20:23	2023-06-05 14:20:23
388	App\\Models\\User	97	Personal Access Token	01d003d78c0cea5d5268a731811f805c64d6c06a6ac8b9adfb73bb1f8ae0d346	["*"]	\N	2023-06-05 14:23:18	2023-06-05 14:23:18
389	App\\Models\\User	96	Personal Access Token	80542f465dbbcbfec44e962fac1b31adf8e13bce05018f70c44d2cc88d4806a6	["*"]	\N	2023-06-05 14:25:10	2023-06-05 14:25:10
390	App\\Models\\User	96	Personal Access Token	2360cef03e0013c95ddf2c6acde507ec504a3ab26e01b68f3cdd765042d40a1d	["*"]	\N	2023-06-05 14:26:19	2023-06-05 14:26:19
391	App\\Models\\User	98	Personal Access Token	5c7d6a4ac616fc39cb25be95430f2c49513bfc5d646769004205ddc9b3af2949	["*"]	\N	2023-06-05 14:30:44	2023-06-05 14:30:44
392	App\\Models\\User	99	Personal Access Token	c6e0ca32044e86d467d8f9aa7b7d2dbd8cbd0a0be578ba1cb7565626924cfa25	["*"]	\N	2023-06-05 14:44:57	2023-06-05 14:44:57
393	App\\Models\\User	99	Personal Access Token	0dca53b7112c0f57276ab7825d11ea92a092826ee3a22bf3f84d3862e9a60557	["*"]	\N	2023-06-05 14:45:21	2023-06-05 14:45:21
394	App\\Models\\User	96	Personal Access Token	be590dcb1f504040274c5af67badb4153a7c25bcb978a3d20a0bde47dc8e13f9	["*"]	\N	2023-06-05 15:04:43	2023-06-05 15:04:43
395	App\\Models\\User	96	Personal Access Token	f33c3678c207ffcaee666fdbce5d25fc0769b44d51309542bd3e4fc22f966c9d	["*"]	\N	2023-06-05 15:05:30	2023-06-05 15:05:30
396	App\\Models\\User	100	Personal Access Token	31ae49d95e98ee2d0edc9be27b675add25d1a49584be1c787e4a5682561fe587	["*"]	\N	2023-06-05 15:07:08	2023-06-05 15:07:08
397	App\\Models\\User	100	Personal Access Token	cc2ce5c95e79cad15b6d15389811dd377a38272ca5b26a93408cb7f11d9916e1	["*"]	\N	2023-06-05 15:16:18	2023-06-05 15:16:18
398	App\\Models\\User	100	Personal Access Token	0d441d481c15c3822d7882418c99d954e61be6f48718d8efece4aa8420fef000	["*"]	\N	2023-06-05 15:16:45	2023-06-05 15:16:45
399	App\\Models\\User	101	Personal Access Token	032804714ddb41523523b81f505a688606e7394908da2d45e29cd317f72d6178	["*"]	\N	2023-06-05 15:21:30	2023-06-05 15:21:30
400	App\\Models\\User	102	Personal Access Token	22b118522ccd077a1f6205ed3f805bb26fab47dde3de6ca592d4c6d1a64a6928	["*"]	\N	2023-06-05 15:29:39	2023-06-05 15:29:39
401	App\\Models\\User	102	102Test Uservevexij525@vaband.com	85c83881e13a1caf045d4edeae091ab5330c4e95ef04f055c5d6ab4a929927f3	["*"]	\N	2023-06-05 15:30:09	2023-06-05 15:30:09
402	App\\Models\\User	102	102Test Uservevexij525@vaband.com	200e0e2753e837ee4bac78664502d55dfdd5e34256c2b69401199e2fbcace322	["*"]	\N	2023-06-05 15:30:54	2023-06-05 15:30:54
403	App\\Models\\User	36	36Testtestuser@gmail.com	d9535ec3979a56ca41ddf870875e81173a5f47c8be1a4efae26bd4ba24b07223	["*"]	\N	2023-06-05 16:50:13	2023-06-05 16:50:13
404	App\\Models\\User	103	Personal Access Token	57b86341ff4bbafa7d0e180801d91407da50d081e1022c3cc0db6ae3e9a8aa13	["*"]	\N	2023-06-05 22:13:20	2023-06-05 22:13:20
405	App\\Models\\User	103	103new user testtestnew@gmail.com	fe49a2b3b0cd372c897cda2c71d6abbbf626d44f26db1fb35d0c107e5a9c6178	["*"]	\N	2023-06-05 22:20:28	2023-06-05 22:20:28
406	App\\Models\\User	104	Personal Access Token	06f0781718d8acc43dbc91d853e564fe582f1c61fe39af9b3459159cb6c94d3d	["*"]	\N	2023-06-05 22:21:58	2023-06-05 22:21:58
407	App\\Models\\User	105	Personal Access Token	3257d2c784bdec9b5a4712046812cc82fe95a91e52dc1b135b745a2e1d1abfbe	["*"]	\N	2023-06-05 22:58:37	2023-06-05 22:58:37
408	App\\Models\\User	106	Personal Access Token	9bb91b8abda44ec95e2f328d832bb8f8545e21c47212077128e437df919db8dc	["*"]	\N	2023-06-05 23:39:35	2023-06-05 23:39:35
409	App\\Models\\User	106	106mew newnnmtest@gmail.com	5860b48660fdbc77d5907e3d868b1316b8a6b83a6a38ba1c6491cde84aeb63b5	["*"]	\N	2023-06-05 23:39:39	2023-06-05 23:39:39
410	App\\Models\\User	105	Personal Access Token	6ee3974f20ddb508217aca6832640ed1f159b9972eb0651663472f0cbb72a6f6	["*"]	\N	2023-06-06 01:04:00	2023-06-06 01:04:00
411	App\\Models\\User	86	Personal Access Token	c5483b0f5413e6429c4ef936d83ef934ee0fc38a25c70d7e3273c676e6b0d872	["*"]	\N	2023-06-06 01:04:19	2023-06-06 01:04:19
412	App\\Models\\User	105	Personal Access Token	cc75d2a73b5338f306d6b42c4b9aea507727e237f961545960169bbebc37439b	["*"]	\N	2023-06-06 01:11:40	2023-06-06 01:11:40
413	App\\Models\\User	107	Personal Access Token	7743bbbd0b21d0b9ae0b3a1caa323c5da8a1b4d220898f7e43ea19662905552a	["*"]	\N	2023-06-06 01:15:23	2023-06-06 01:15:23
414	App\\Models\\User	107	Personal Access Token	9794cd58be651f17dccbc116e9d43bac567672a5fba9fcb5c607f2d72edc3d02	["*"]	\N	2023-06-06 01:18:27	2023-06-06 01:18:27
415	App\\Models\\User	107	Personal Access Token	2d991f9013c74d1131c910ec1f66cb0ebf43cf76ddb05759f7853fa7a4b3dcf2	["*"]	\N	2023-06-06 01:19:11	2023-06-06 01:19:11
416	App\\Models\\User	108	Personal Access Token	6ee6af97c214d456d2531462d24ea63fb20318c960f27b5c5b2cae2ae438be69	["*"]	\N	2023-06-06 03:22:07	2023-06-06 03:22:07
417	App\\Models\\User	99	Personal Access Token	21e9f63d81883c66f7fbf83a111071fcfd9c0056c441e56fa883f59d21ee4ca3	["*"]	\N	2023-06-06 03:45:14	2023-06-06 03:45:14
418	App\\Models\\User	109	Personal Access Token	bf6ec7a8c24917ae2f2935e8b1a71c930bd7cac32a375899f87542f34093e6f5	["*"]	\N	2023-06-06 03:46:37	2023-06-06 03:46:37
419	App\\Models\\User	109	Personal Access Token	01495fc75446d51b336cc2bc8d33231e33c22fabdfd736d398645b5cc9f0a45f	["*"]	\N	2023-06-06 03:52:41	2023-06-06 03:52:41
420	App\\Models\\User	109	Personal Access Token	76f8116ced533ce43ba97237616463d47b89f165569efacae98e5722a13edbbe	["*"]	\N	2023-06-06 03:54:36	2023-06-06 03:54:36
421	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	aeddbbaf0b3f6c5e3a09979653bb80fa1162c018bcf026dd3cc6e42a98f5126b	["*"]	\N	2023-06-06 03:55:35	2023-06-06 03:55:35
422	App\\Models\\User	110	Personal Access Token	2557d9800438bee8f09b699372aac799b443a61288b40c0a833c27610e0de363	["*"]	\N	2023-06-06 03:57:44	2023-06-06 03:57:44
423	App\\Models\\User	94	Personal Access Token	69f994cb0c99da0cc67f6244f9c5ac82e2e1a057d54580df9134c94636487b6f	["*"]	\N	2023-06-06 03:58:04	2023-06-06 03:58:04
424	App\\Models\\User	111	Personal Access Token	0d159ec0d711b7bf84205a44910c85f0e51cfd084c781ec49b5da62697c3520f	["*"]	\N	2023-06-06 03:58:12	2023-06-06 03:58:12
425	App\\Models\\User	60	Personal Access Token	370d72105fb00be4419aa586c0ade9a448d23102a6b120c5639f2492de2f55f6	["*"]	\N	2023-06-06 03:59:06	2023-06-06 03:59:06
426	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	77c502b2040a73622f0624aa5bb500c4c2689fa5e9d021c57d664910f7c5f40c	["*"]	\N	2023-06-06 04:00:53	2023-06-06 04:00:53
427	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	50cd0115dcda510c684bb3a5115d9fef0bae8407a724c35e9ba7040288091624	["*"]	\N	2023-06-06 04:03:33	2023-06-06 04:03:33
428	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	0a9ab84987c25fc4552673130949fbd1f14fe77eb0fde0e7f84ca2697bf2331c	["*"]	\N	2023-06-06 04:03:48	2023-06-06 04:03:48
429	App\\Models\\User	73	73Abdul Rahimnbz03@mailinator.com	de00558975cabb2b44728e3e96c173ef0d8976b7a2adf0f0359116d187c39ff4	["*"]	\N	2023-06-06 04:03:49	2023-06-06 04:03:49
430	App\\Models\\User	73	73Abdul Rahimnbz03@mailinator.com	7d48a7700c2102c97a26d8f00d2c82fe4d279c67c696e5c09789c79f0c7ab864	["*"]	\N	2023-06-06 04:03:52	2023-06-06 04:03:52
431	App\\Models\\User	73	73Abdul Rahimnbz03@mailinator.com	118aa24efecfc0660e1d6bb25eab483049a9381bac2e972561665f5f5e472ada	["*"]	\N	2023-06-06 04:04:05	2023-06-06 04:04:05
432	App\\Models\\User	73	73Abdul Rahimnbz03@mailinator.com	2570ad328bb41a5c516d5c4f5aa8aa2145024833aa210148b7efbf2304c712a1	["*"]	\N	2023-06-06 04:04:07	2023-06-06 04:04:07
433	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	ea7d8eb8f4241b7c5cc4e94200d00ec19a46d76efed05954ab787e0fdc9add0a	["*"]	\N	2023-06-06 04:05:30	2023-06-06 04:05:30
434	App\\Models\\User	60	Personal Access Token	53336f7dde259923eea5ca83c669b3e8319de847a4dedd1ff1ab9ee48194b461	["*"]	\N	2023-06-06 04:08:12	2023-06-06 04:08:12
435	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	90917f63d4c7905f6bcfa47e407f3b8e8c791fc1ddb75e502096474a1fda4c24	["*"]	\N	2023-06-06 04:09:11	2023-06-06 04:09:11
436	App\\Models\\User	60	Personal Access Token	373e0cd7f13369d5905fdd1c14b54dc4c9f1b494b5bd4f429f1e743a998bee55	["*"]	\N	2023-06-06 04:09:14	2023-06-06 04:09:14
437	App\\Models\\User	73	73Abdul Rahimnbz03@mailinator.com	221c596447eb67f8649c14e053133adeed12324b467246a33af571b820267354	["*"]	\N	2023-06-06 04:09:45	2023-06-06 04:09:45
438	App\\Models\\User	109	Personal Access Token	57a9c0aa0ef9b0a094089154cc5268283ea8ddf99cc32aae513946f35df8026a	["*"]	\N	2023-06-06 04:11:29	2023-06-06 04:11:29
439	App\\Models\\User	60	Personal Access Token	6f44fb4ac206c059e0aca1dd418602872eec5650629a73b045af9335a67b31cc	["*"]	\N	2023-06-06 04:15:42	2023-06-06 04:15:42
440	App\\Models\\User	94	Personal Access Token	743d6ce22c8dfef0268ac8e1aaaf4596015be5a8cf3c42bcce9a6347bd552a1e	["*"]	\N	2023-06-06 04:15:56	2023-06-06 04:15:56
441	App\\Models\\User	82	Personal Access Token	fae9d5fd6ede1b1a88ca0a0894d5483f88e37767157eac2a2266928b2c3fb2e7	["*"]	\N	2023-06-06 04:16:39	2023-06-06 04:16:39
442	App\\Models\\User	112	Personal Access Token	6b7e04dac1b352a819f54fc00673e7b087e9209285d06d6c4867b7315acafa3c	["*"]	\N	2023-06-06 04:18:59	2023-06-06 04:18:59
443	App\\Models\\User	113	Personal Access Token	5076f5754b43298c62589b220c6ebf1fd0e6b20d0b94b3fb4baaba038bf3079d	["*"]	\N	2023-06-06 04:22:38	2023-06-06 04:22:38
444	App\\Models\\User	60	Personal Access Token	ce8a5a29083d68005ec8b8fee11f5495e21e79f0eff969a6a93ffa2b928ed410	["*"]	\N	2023-06-06 04:32:47	2023-06-06 04:32:47
445	App\\Models\\User	83	Personal Access Token	04ec945ca863c4d25abed899aa11d22678455815a66b5e6a94ffc68e04ebe45f	["*"]	\N	2023-06-06 04:33:06	2023-06-06 04:33:06
446	App\\Models\\User	60	Personal Access Token	036e5b01fa67e15a7f4f0f42e5588ccddc52891706c631f8caeedbb786844385	["*"]	\N	2023-06-06 04:37:32	2023-06-06 04:37:32
447	App\\Models\\User	100	Personal Access Token	70a224c4938ed99c01489bc38341a0b6b67df1cccdab0a06cb5ba2659c38a84b	["*"]	\N	2023-06-06 04:42:56	2023-06-06 04:42:56
448	App\\Models\\User	56	Personal Access Token	24ed75758a0f571a109b2214aeaca5e295e019e71655968bd46082a30c3f654b	["*"]	\N	2023-06-06 04:51:02	2023-06-06 04:51:02
449	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	10ab09270c8aa56af5a3d675799ce2a9202cc1b4d132576ac7d178f6ce2ccbbf	["*"]	\N	2023-06-06 04:53:15	2023-06-06 04:53:15
450	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	2704c32ea4758d25c9732ad5c6acbcec10d9169885dceb161fc4622449d0c008	["*"]	\N	2023-06-06 04:54:42	2023-06-06 04:54:42
451	App\\Models\\User	95	Personal Access Token	5c44b57731fe394d73886b9ec95d1c81c44fb6d91066231728fc8c0f5aac58bb	["*"]	\N	2023-06-06 04:57:40	2023-06-06 04:57:40
452	App\\Models\\User	56	Personal Access Token	8be80dfcc90eab66e160395786aa03af86a87e096521b8b5a9f1c81838745ac3	["*"]	\N	2023-06-06 05:04:14	2023-06-06 05:04:14
453	App\\Models\\User	114	Personal Access Token	fe59fa3338e8a2b4bff2d9080085faa902d46443647f51dbb70aa3c705cbf1fe	["*"]	\N	2023-06-06 05:04:22	2023-06-06 05:04:22
454	App\\Models\\User	115	Personal Access Token	b7f6df7c9edd30c7e0922c95552de8851698038d1330902bee2216e7704292a9	["*"]	\N	2023-06-06 05:13:10	2023-06-06 05:13:10
455	App\\Models\\User	115	Personal Access Token	d1da1985afe8269b469f03aaf2b1ec482fbedeb23f47d9889a40bffc0992d6b1	["*"]	\N	2023-06-06 05:13:21	2023-06-06 05:13:21
456	App\\Models\\User	115	Personal Access Token	70e0a4fe342d31bf2d0718c9b89d6543eabadc46be86b9d481629735b5740ea0	["*"]	\N	2023-06-06 05:13:23	2023-06-06 05:13:23
457	App\\Models\\User	56	Personal Access Token	7b0c3a9a31c8ba59cc5df3aeb5cdf9a8aae55117fa8dcbdbf966501c3fa166f0	["*"]	\N	2023-06-06 05:13:28	2023-06-06 05:13:28
458	App\\Models\\User	116	Personal Access Token	1d11e5e07e768d74897f3d1b6a6af31347bc2e892d790734598bc7f8e6bcf229	["*"]	\N	2023-06-06 05:30:21	2023-06-06 05:30:21
459	App\\Models\\User	116	Personal Access Token	e04fa7280a5bae514982adbe00420c9d0276ec6b441338a98315101a2573037e	["*"]	\N	2023-06-06 05:32:39	2023-06-06 05:32:39
460	App\\Models\\User	116	Personal Access Token	8bd23972bf12b4f7400a7ec2d9495b960a1b52e3b54154120c07921094543d6f	["*"]	\N	2023-06-06 05:34:46	2023-06-06 05:34:46
461	App\\Models\\User	56	Personal Access Token	045b96a749542e80275ef6756ca8f4f1bdea4e698a9412b5691d3eed2120f609	["*"]	\N	2023-06-06 05:35:03	2023-06-06 05:35:03
462	App\\Models\\User	56	Personal Access Token	a13a9cf7ade4a987bf6e43d9ac1db990ad3ba9d31751904513d3d2db0d7bf20f	["*"]	\N	2023-06-06 05:35:08	2023-06-06 05:35:08
463	App\\Models\\User	56	Personal Access Token	37c1242b74af0c5743e676b338ebb76ecd8b90d22cb121e8346498aa48ed1c76	["*"]	\N	2023-06-06 05:38:07	2023-06-06 05:38:07
464	App\\Models\\User	56	Personal Access Token	a30d1014051e2abe9b7ccc5a6a59813cd26ebbf97ebacf84fccaff8795fab5ab	["*"]	\N	2023-06-06 05:38:10	2023-06-06 05:38:10
465	App\\Models\\User	56	Personal Access Token	ff4cbc604561c56fd770369375144bcef60303ef6d70409eadd57e37c0bc2deb	["*"]	\N	2023-06-06 05:39:07	2023-06-06 05:39:07
466	App\\Models\\User	56	Personal Access Token	cdbd18acfe5cf7355b9659217e4fbdb6bfa990af17f68977641fbeff2326fd9e	["*"]	\N	2023-06-06 05:40:02	2023-06-06 05:40:02
467	App\\Models\\User	56	Personal Access Token	d2f3a204ace69978e42a1274004133d149c3bb439a331a18ffdcdd78e5a14217	["*"]	\N	2023-06-06 05:40:46	2023-06-06 05:40:46
468	App\\Models\\User	56	Personal Access Token	26486dba70858451fbc567ff44a576f72e8061bbd0d03a6b72cbaddba3095a66	["*"]	\N	2023-06-06 05:41:14	2023-06-06 05:41:14
469	App\\Models\\User	117	Personal Access Token	35c1b861ab8e89cbe0a72c9db005d8a22b8440b110f2dc395975b659d2bdcfa6	["*"]	\N	2023-06-06 05:41:28	2023-06-06 05:41:28
470	App\\Models\\User	116	Personal Access Token	3035698d233e3d31114f3d1b6a06f86d0a3ea620b11f91fee478eb15c888fad2	["*"]	\N	2023-06-06 05:45:29	2023-06-06 05:45:29
471	App\\Models\\User	118	Personal Access Token	77e84a4a6bf6bd48303f8b7ba0ee971fca114b4a61c63acfa9b30d87580849ee	["*"]	\N	2023-06-06 05:45:49	2023-06-06 05:45:49
472	App\\Models\\User	118	Personal Access Token	96dd609b21b28bbe60a1a11011933ad1441ff246e643396988cd487c756ecde9	["*"]	\N	2023-06-06 05:50:06	2023-06-06 05:50:06
473	App\\Models\\User	119	Personal Access Token	c7a22540d6c27a35f3935d5ec6e920d75f1d09006ae2c79e5f52cc9ce9a65840	["*"]	\N	2023-06-06 05:51:17	2023-06-06 05:51:17
474	App\\Models\\User	39	39hunain devhunain88@gmail.com	296dd4c3302b31d6ac2ca2f7630b2adc839c32b1b3e7f87e03de12f402577c78	["*"]	\N	2023-06-06 05:51:31	2023-06-06 05:51:31
475	App\\Models\\User	120	Personal Access Token	af1aaef2366ede54518f256e7c1e228edefe78cca8b59482a3536d32ce8c3614	["*"]	\N	2023-06-06 06:02:18	2023-06-06 06:02:18
476	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	a5e234545f8d5bf1477b11c4185404d025f8b7fa028678c59c6ffe3d30f332d8	["*"]	\N	2023-06-06 06:05:29	2023-06-06 06:05:29
477	App\\Models\\User	121	Personal Access Token	d6230beee85550855c09289731c1c38b13eb5b3ed6d5ab635f3fc5866fbd973c	["*"]	\N	2023-06-06 06:17:40	2023-06-06 06:17:40
478	App\\Models\\User	122	Personal Access Token	916d48409e9a7089997b0c8e0517f6f870280ff597e35fbb3067bbb571ae1f0c	["*"]	\N	2023-06-06 06:20:42	2023-06-06 06:20:42
479	App\\Models\\User	123	Personal Access Token	a275014163fd22e18d7bf55b2d5b14103fab3174e518fc2f5f2ef07e1205df77	["*"]	\N	2023-06-06 06:24:43	2023-06-06 06:24:43
480	App\\Models\\User	123	123Piu Nigernbz08@mailinator.com	ce7e2c1f6a92aca5b93d8cee3b97d769bdf4cbe1b816be7c988e5f1d0c6b5857	["*"]	\N	2023-06-06 06:24:54	2023-06-06 06:24:54
481	App\\Models\\User	60	Personal Access Token	8c9ba3909bb057081ac65482ea8195e7abd14f2d01954cc17baf59d4133c6cee	["*"]	\N	2023-06-06 06:37:12	2023-06-06 06:37:12
482	App\\Models\\User	123	123Piu Nigernbz08@mailinator.com	ce21b7075de0bb4e2d419e5a1914555db74872be9d4e75132c3b8ec164192f1c	["*"]	\N	2023-06-06 06:37:40	2023-06-06 06:37:40
483	App\\Models\\User	60	Personal Access Token	e15d1ea7c65a146b97d0c05c12fc3f953d4e3553bc0551de6ab37622edd49a14	["*"]	\N	2023-06-06 06:37:45	2023-06-06 06:37:45
484	App\\Models\\User	116	Personal Access Token	2ea487528dc566ab95477bb10eb8b4a7169380756a3b78d643a9fecd20c3b207	["*"]	\N	2023-06-06 06:44:13	2023-06-06 06:44:13
485	App\\Models\\User	60	Personal Access Token	ae76bbd5d9b6a41dc5b101e4bc3ee8637a2accae50560db46b8254cd19628a9a	["*"]	\N	2023-06-06 06:46:56	2023-06-06 06:46:56
486	App\\Models\\User	83	Personal Access Token	96fda10430353fb923ba46d79713e885484d3fa0f16ce413bac4b3ba8d16e90e	["*"]	\N	2023-06-06 06:47:29	2023-06-06 06:47:29
487	App\\Models\\User	124	Personal Access Token	b9247590e503bc57112e6de773a24527597612bebda3dc6d72d3d27ef287abf1	["*"]	\N	2023-06-06 06:54:20	2023-06-06 06:54:20
488	App\\Models\\User	125	Personal Access Token	075ccc213be5b2cb3312b90bea9a101aa7e6b0b2bdd565062e8a214fe007f29a	["*"]	\N	2023-06-06 06:55:34	2023-06-06 06:55:34
489	App\\Models\\User	125	125test testtesthy@gmail.com	ca8240c1f3a7b4ba87e9ff3a1ea2c2406ea1ffc0485f460dbe1cf220014ae7b5	["*"]	\N	2023-06-06 06:55:39	2023-06-06 06:55:39
490	App\\Models\\User	116	Personal Access Token	50ba716c90ba325f4f01c311f3c73c3015e7c3a74a0c81cb398265ac7c119653	["*"]	\N	2023-06-06 06:57:12	2023-06-06 06:57:12
491	App\\Models\\User	116	Personal Access Token	38db0df1f130d2ddba04ddc74993c86952f9f95059fecf4dfca28ce80061440f	["*"]	\N	2023-06-06 07:17:21	2023-06-06 07:17:21
492	App\\Models\\User	73	73Abdul Rahimnbz03@mailinator.com	b85f4cf95f0db140b6eeb2d0e6765ab73caa9519d66e3a6bdf697226b3d82a2a	["*"]	\N	2023-06-06 07:18:16	2023-06-06 07:18:16
493	App\\Models\\User	116	Personal Access Token	c3ad4276c90b0f401e3fa2a53eb6adb129352185b01391f48ae54ab1f2ca1486	["*"]	\N	2023-06-06 08:22:32	2023-06-06 08:22:32
494	App\\Models\\User	36	36Testtestuser@gmail.com	8eb60d27bd6c62d6655c6b7dd2021e17755fc81aa925a82ad6788435fca43934	["*"]	\N	2023-06-06 08:23:52	2023-06-06 08:23:52
495	App\\Models\\User	60	Personal Access Token	196d822367bceea269086b0fd616e0468612235e61d17655a4ba7ad787d42cde	["*"]	\N	2023-06-06 08:41:09	2023-06-06 08:41:09
496	App\\Models\\User	126	Personal Access Token	70ff8ef01ef7b7361ecb99b315085cb47f20ea68a377437476a4c43dcac3dec8	["*"]	\N	2023-06-06 09:01:54	2023-06-06 09:01:54
497	App\\Models\\User	126	126anil pixelanil@dxbusinessgroup.com	c279017f2e57b8a4f8a1d6c6af77499702d8e85485474f79b744ea087af57baa	["*"]	\N	2023-06-06 09:06:04	2023-06-06 09:06:04
498	App\\Models\\User	60	Personal Access Token	e3ad54c4c7b4588417e84c923cad5148d9aff8cfc30bfc98eef2594614265ae6	["*"]	\N	2023-06-06 09:09:02	2023-06-06 09:09:02
499	App\\Models\\User	119	Personal Access Token	fb20e4897cdf584995edf5a19fa369f438be584544f97a2522ca2da1bee5a35e	["*"]	\N	2023-06-06 09:16:10	2023-06-06 09:16:10
500	App\\Models\\User	109	Personal Access Token	81a0edc41bfc9a022f338c496a70de205d9fdd5f775a52b3055f0cc86c52f436	["*"]	\N	2023-06-06 09:21:03	2023-06-06 09:21:03
501	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	8bcf43b6733a3e43f2e91d0657b1e6a06140f96e8eee337ea19b17057e5c52cb	["*"]	\N	2023-06-06 09:22:01	2023-06-06 09:22:01
502	App\\Models\\User	127	Personal Access Token	2094b6dc35060fd69b51476d474386854ec8d1f3946ea11aae91c243082ac905	["*"]	\N	2023-06-06 09:26:01	2023-06-06 09:26:01
503	App\\Models\\User	127	127hunain Ttthunain00@gmail.com	4432321982b20fdb03efe186f08fa8ddca69e7a1f6a2a2f510710a259c4424b0	["*"]	\N	2023-06-06 09:26:42	2023-06-06 09:26:42
504	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	adb4ade2828be3139f2440456e58d3a0e42be1575b972c6bc4fee8e4e06df02c	["*"]	\N	2023-06-06 09:40:32	2023-06-06 09:40:32
505	App\\Models\\User	123	123Piu Nigernbz08@mailinator.com	c634e589b9d3d6334ebc8482302374e47261d367fc5bb4bdb44c64ebe5e62556	["*"]	\N	2023-06-06 09:43:12	2023-06-06 09:43:12
506	App\\Models\\User	127	127hunain Ttthunain00@gmail.com	40f99d3fd525c635c8034b783b948e137ec8ffbd5534d585f5fd3c7269aac5cf	["*"]	\N	2023-06-06 09:45:14	2023-06-06 09:45:14
507	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	b280931c058d45aa61557eadd13f8ad9a9b5c47c668fa5255bb99bcf8e3207e4	["*"]	\N	2023-06-06 09:47:42	2023-06-06 09:47:42
508	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	ca1e59a5d1387b1d7fbee7da9a272a09f02686cbc833b6b0bf5e0e09ab7e5d4b	["*"]	\N	2023-06-06 09:48:25	2023-06-06 09:48:25
509	App\\Models\\User	128	Personal Access Token	6a9cd88b3cef329a4b0849ac6642e0494500293074d5222f47205234855ed72a	["*"]	\N	2023-06-06 10:58:16	2023-06-06 10:58:16
510	App\\Models\\User	128	128Test Userpoyexa91644@vaband.com	c89a6b7674857ffbad91b2eb7be554ba709d76c64f10f374fef77d5400b0ad1d	["*"]	\N	2023-06-06 10:58:33	2023-06-06 10:58:33
511	App\\Models\\User	116	Personal Access Token	51e79d24ced197676323eadef559352b29bfcddf03b603c4c6906e8ca4b41d80	["*"]	\N	2023-06-06 11:09:54	2023-06-06 11:09:54
512	App\\Models\\User	116	Personal Access Token	426aa90c63059548667799b632420f2bdafb92fca5eb760756ecbe13988f9e59	["*"]	\N	2023-06-06 11:24:47	2023-06-06 11:24:47
513	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	b871cbcba1c0479679ae151e0dc71de87b0ed040fddd5f76af02016ad772640f	["*"]	\N	2023-06-06 11:29:38	2023-06-06 11:29:38
514	App\\Models\\User	116	Personal Access Token	0b896fff9555faf17a61d4a348625b26e46ee8371b96a0d3b5faa8f937baf457	["*"]	\N	2023-06-06 11:30:49	2023-06-06 11:30:49
515	App\\Models\\User	129	Personal Access Token	88786d9a6e7ff467d974f0ac68bc2ff661789c1a194dad09d79f1e1874f8eca4	["*"]	\N	2023-06-06 11:32:43	2023-06-06 11:32:43
516	App\\Models\\User	116	Personal Access Token	1c61bc8e225d5ed655c0d39bc0c67eadca24dc029027a43093ac44d2181759f1	["*"]	\N	2023-06-06 11:52:16	2023-06-06 11:52:16
517	App\\Models\\User	123	123Piu Nigernbz08@mailinator.com	a03ae511dc651709b77440d5626605731f2280d18e3190b5003c52820f1f5476	["*"]	\N	2023-06-06 11:55:45	2023-06-06 11:55:45
518	App\\Models\\User	123	123Piu Nigernbz08@mailinator.com	c53d43c87716d5780f8cd4c3ffe1d2314505e072ee7cbbcc7b11e7d31fb74bb2	["*"]	\N	2023-06-06 11:56:27	2023-06-06 11:56:27
519	App\\Models\\User	116	Personal Access Token	6fa78a528177c995bcc3d9ccd9001122e2232dffa358a7c3916e2c1f6416deb1	["*"]	\N	2023-06-06 11:57:53	2023-06-06 11:57:53
520	App\\Models\\User	123	123Piu Nigernbz08@mailinator.com	98758a39461b70c884301a7cc4625b517c3fc6799cfb1d03219703d29fe67e50	["*"]	\N	2023-06-06 12:00:00	2023-06-06 12:00:00
521	App\\Models\\User	116	Personal Access Token	b314ab2c61ad87f779d9b418bc5367084066d19caa85cba6b8c482aac713ef9a	["*"]	\N	2023-06-06 12:03:23	2023-06-06 12:03:23
522	App\\Models\\User	73	73Abdul Rahimnbz03@mailinator.com	cb3a1afed53ff66025fc6ad796dfe5940301c52e04a952a3d818c77bf0ebb386	["*"]	\N	2023-06-06 12:17:54	2023-06-06 12:17:54
523	App\\Models\\User	39	39hunain devhunain88@gmail.com	edc7c257b7d44e12b56ad459cf4c15092e0305998bd66413c0e7258ce745f050	["*"]	\N	2023-06-06 12:23:01	2023-06-06 12:23:01
524	App\\Models\\User	130	Personal Access Token	16b91ad366bf6bb5d31af234be24029f2a69b8f387c125b337847d8aad13da55	["*"]	\N	2023-06-06 12:26:33	2023-06-06 12:26:33
525	App\\Models\\User	131	Personal Access Token	5e63d2b8fc3fc81d68e9dd3fa9f62b5370aba4876b57f89cf67d52a25ced3fa0	["*"]	\N	2023-06-06 12:52:40	2023-06-06 12:52:40
526	App\\Models\\User	131	131john doejivina4457@soremap.com	9abf1306e839e84743a30c8cdf4ef91cae285469fe3cf4c4880565b302ce4e16	["*"]	\N	2023-06-06 12:55:19	2023-06-06 12:55:19
527	App\\Models\\User	123	123Piu Nigernbz08@mailinator.com	fddb3f0c3599614e5d4d329635d5e31f38e23558caebfb8061ed66949dd45048	["*"]	\N	2023-06-06 12:56:12	2023-06-06 12:56:12
528	App\\Models\\User	109	Personal Access Token	0825afb3c0b343c7ecb24d5497a58075fd8287d826fa91868c5bb2cee2bf05fc	["*"]	\N	2023-06-06 13:06:18	2023-06-06 13:06:18
529	App\\Models\\User	109	Personal Access Token	845974a8c72c9ec4e296e72b4cc8efaa9a55555690247b3d97c1d167bd0966b9	["*"]	\N	2023-06-06 13:07:53	2023-06-06 13:07:53
530	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	85f96b16c08fb3630da231e06a38b2285892a8db1f0c85715fceb185030bb521	["*"]	\N	2023-06-06 13:08:21	2023-06-06 13:08:21
531	App\\Models\\User	109	Personal Access Token	b5ef94aba06533607e3773fe60951fd9aee9de82c1bbb83a5c1223d409c10e43	["*"]	\N	2023-06-06 13:23:57	2023-06-06 13:23:57
532	App\\Models\\User	109	Personal Access Token	e8329553d6da0a8bbd8703bcb61fd60ce07abeeacb9ddec7d7d85d4b9ecf05ca	["*"]	\N	2023-06-06 13:29:01	2023-06-06 13:29:01
533	App\\Models\\User	116	Personal Access Token	a978eefe7702fbc6e038d4582b88614c56201fef4db3e1cd8bb41a837f6905ee	["*"]	\N	2023-06-06 13:31:26	2023-06-06 13:31:26
534	App\\Models\\User	116	Personal Access Token	c4d2b7faebf6e3f43671e81c8b74347b2591d4056d04f8ed26a4510749b1e5f8	["*"]	\N	2023-06-06 13:31:46	2023-06-06 13:31:46
535	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	eabb3461ce966b165023f9f4618323d6b71875e3431922652bc35925e48c0035	["*"]	\N	2023-06-06 13:32:05	2023-06-06 13:32:05
536	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	8d2c2f3edd3f6ad4c93e9dece30a6fb5f968485417de084cb644747a73c631ba	["*"]	\N	2023-06-06 14:02:59	2023-06-06 14:02:59
537	App\\Models\\User	116	Personal Access Token	fe4cef7624a8f26c8c19089eab1fa31503c8bc01d677888e247d6286a51e1034	["*"]	\N	2023-06-06 14:04:50	2023-06-06 14:04:50
538	App\\Models\\User	109	Personal Access Token	0213fc93f89eb7cf48ac1135c3d26a1931aea23ad29e42b5fed5c96eda9429ca	["*"]	\N	2023-06-06 14:06:59	2023-06-06 14:06:59
539	App\\Models\\User	109	Personal Access Token	b2e744d035e6212b89dddd16bf3adba6642ed546b171092f6d253dd6d2649d48	["*"]	\N	2023-06-06 14:10:38	2023-06-06 14:10:38
540	App\\Models\\User	116	Personal Access Token	f76e9a83689959890857904cef1559e0b79eba4411c739f85cb5c7f9416c490e	["*"]	\N	2023-06-06 14:14:27	2023-06-06 14:14:27
541	App\\Models\\User	109	Personal Access Token	bbde4e4f0726f6f0bd6b323fdea8eac62747fb1c5091b9b3453c96b30025bdac	["*"]	\N	2023-06-06 14:16:56	2023-06-06 14:16:56
542	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	34ed2dadc94f285013d56a2554c6d242f724df6bc29ac1d61796084891b69001	["*"]	\N	2023-06-06 14:18:04	2023-06-06 14:18:04
543	App\\Models\\User	131	131john doejivina4457@soremap.com	c9893bcec8f245361d5ce44547ab3fdfe4b4dece4ab495998285ce5229123a25	["*"]	\N	2023-06-06 14:18:11	2023-06-06 14:18:11
544	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	63712d83969a3d94cf1b38ec3d2249d6da4bd5514d604b8c1a8439599642f63b	["*"]	\N	2023-06-06 14:21:52	2023-06-06 14:21:52
545	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	a1060854381980a25f83cc0d2b36660bdd7df454cefe3b3585f1e0dce87b3532	["*"]	\N	2023-06-06 14:22:15	2023-06-06 14:22:15
546	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	59b2e77505cfb70fa74f0f5748a9ec6598c980e5b45aa31a436b3db02bb62840	["*"]	\N	2023-06-06 14:22:26	2023-06-06 14:22:26
547	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	c42eab9ea7988d241c615980fb4ff25b06f1c4b6f0c46c34a5a571afe870036a	["*"]	\N	2023-06-06 14:22:55	2023-06-06 14:22:55
548	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	79f2d79034b18ee9f94a917ae0fc4cd91397c0a5817fea259fbb1be6c04d6e4e	["*"]	\N	2023-06-06 14:23:19	2023-06-06 14:23:19
549	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	9dab9a59f10f8c6b0b9bfcf58e7b50a2787ea5d0fce629879c0cf8353c3f392d	["*"]	\N	2023-06-06 14:24:29	2023-06-06 14:24:29
550	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	8ce06ae200f13b59baa8ec240cae6c74c90bbec0acd2d1b3d76c5b0ace60b050	["*"]	\N	2023-06-06 14:26:12	2023-06-06 14:26:12
551	App\\Models\\User	109	Personal Access Token	0ad78d0ee9e150dee62873b69741a7e96cba3b6ed4c597fee5ee818c9d6ad20f	["*"]	\N	2023-06-06 14:29:16	2023-06-06 14:29:16
552	App\\Models\\User	109	Personal Access Token	ce28b3d113f8129b0f9a9bd9479a6e6390876840c7017e3cf2ef6f9604e31c50	["*"]	\N	2023-06-06 14:32:01	2023-06-06 14:32:01
553	App\\Models\\User	109	Personal Access Token	35494b6f14a55b08daad3c21079847af5667ad2f256acc3e1bbe87b5f8a807fc	["*"]	\N	2023-06-06 14:33:41	2023-06-06 14:33:41
554	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	af5d1ce77ebdad5857e172566ba6254a8749af7125515d7c7ec6b0e1703d414f	["*"]	\N	2023-06-06 14:35:09	2023-06-06 14:35:09
555	App\\Models\\User	109	Personal Access Token	c0402bfdebb79884e9414f7621b7b1e13a326ea7a35d64631e72436bbe0385fa	["*"]	\N	2023-06-06 14:38:02	2023-06-06 14:38:02
556	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	fd97a8c311aeb6a8be15b66703f0db914a8ac0434a700e98602ce366f5162a95	["*"]	\N	2023-06-06 14:39:18	2023-06-06 14:39:18
557	App\\Models\\User	15	15Rusvinrusvinmerak@gmail.com	6ea2cbc6ae4ddec3dc90b1437ced3783b2314c083b579fa2bb3e8f3c29d5173b	["*"]	\N	2023-06-06 14:39:25	2023-06-06 14:39:25
558	App\\Models\\User	116	Personal Access Token	d56dd3625f825ff0fd6604707f8831f05d292d1d2baca823c58a5b8200691596	["*"]	\N	2023-06-06 14:49:42	2023-06-06 14:49:42
559	App\\Models\\User	109	Personal Access Token	e1792e56157ebc5b57837e55a462f7320270fc80952f94d02920fbf85a636807	["*"]	\N	2023-06-06 14:51:45	2023-06-06 14:51:45
560	App\\Models\\User	109	Personal Access Token	d6ff01886db09682cf8ad8394dbff422e0d9adc837b8da56e2dab01fe6fd9d26	["*"]	\N	2023-06-06 14:55:19	2023-06-06 14:55:19
561	App\\Models\\User	116	Personal Access Token	5166cee3f4f869be688731b10e9316f67fc31c24d0fd3f18e2ef4618dc1ce9d2	["*"]	\N	2023-06-06 14:55:48	2023-06-06 14:55:48
562	App\\Models\\User	116	Personal Access Token	79ef40f5228036b3af25674488808c7c0ae38635c548a18071207e92d46bbc81	["*"]	\N	2023-06-06 14:59:54	2023-06-06 14:59:54
563	App\\Models\\User	116	Personal Access Token	48583c2e80d181f36364bab0f754dd362d883139ff9c0d596e7a31a0233feb3c	["*"]	\N	2023-06-06 15:02:23	2023-06-06 15:02:23
564	App\\Models\\User	116	Personal Access Token	75d45f86b43b2a6f1601eb8d3279a3209fa5ff9cd880c0818a893306a553a207	["*"]	\N	2023-06-06 15:03:44	2023-06-06 15:03:44
565	App\\Models\\User	116	Personal Access Token	69995f0ba484f10d660fccaa2544920d629f531649e53362209558ee8b2c4e1c	["*"]	\N	2023-06-06 15:07:38	2023-06-06 15:07:38
566	App\\Models\\User	116	Personal Access Token	3e103117970f8d0e0974365b4e54af2baec99bc13b05711faced4bcc4e0f7830	["*"]	\N	2023-06-06 15:08:56	2023-06-06 15:08:56
567	App\\Models\\User	131	131john doejivina4457@soremap.com	e65740e1504c566d9f44af617590bdc20432c0b2a27917fbcc6ea9e7bb761682	["*"]	\N	2023-06-06 15:12:16	2023-06-06 15:12:16
568	App\\Models\\User	132	Personal Access Token	130519de784548a7588338685d859e70a4106c3720a2eb932a640c6702366d76	["*"]	\N	2023-06-06 15:44:52	2023-06-06 15:44:52
569	App\\Models\\User	132	132testnew usertestnewuser@gmail.com	8f7dcbd6b023c26a4c23a52d19a0645899774b59783c9a543f0b85e6b331be3a	["*"]	\N	2023-06-06 15:44:59	2023-06-06 15:44:59
570	App\\Models\\User	39	39hunain devhunain88@gmail.com	2bf544d314109034d6d756d756237bfb2233d8a8186568552459250556cc696f	["*"]	\N	2023-06-06 15:48:56	2023-06-06 15:48:56
571	App\\Models\\User	133	Personal Access Token	bd79559490a45c82ca852ef8f057338d9b0e4038f1547cd26a13bb37f320642b	["*"]	\N	2023-06-06 16:39:41	2023-06-06 16:39:41
572	App\\Models\\User	39	39hunain devhunain88@gmail.com	92b7bea6cf9b0b0c9abb4404136bf5ebb888bd75be3c19f77655e93ba8cb0d80	["*"]	\N	2023-06-06 16:55:18	2023-06-06 16:55:18
573	App\\Models\\User	39	39hunain devhunain88@gmail.com	47b81dd8dde9841b542805cdbcf77aa682214fb2d4e0d8dbd2fa546406ee5a66	["*"]	\N	2023-06-06 17:00:46	2023-06-06 17:00:46
574	App\\Models\\User	39	39hunain devhunain88@gmail.com	9bfaa74f035241cdb1f4ba1098fb4c8a45e2cf08896e5f7cb683aa35e6cc8a62	["*"]	\N	2023-06-06 17:09:17	2023-06-06 17:09:17
575	App\\Models\\User	36	36Testtestuser@gmail.com	66f3350d8871a60311741138c50be081e67e549adae5c9d90f29a0ee5ab60602	["*"]	\N	2023-06-07 00:48:38	2023-06-07 00:48:38
576	App\\Models\\User	124	Personal Access Token	bb8b39e0eb93033611c4abf238bb044ca4879a568901f640e18fe6333634255e	["*"]	\N	2023-06-07 01:46:40	2023-06-07 01:46:40
577	App\\Models\\User	82	Personal Access Token	028685047456d3168aecd3a45f0619d1cd0aea432b250ba465915a5709bc4ee9	["*"]	\N	2023-06-07 02:54:17	2023-06-07 02:54:17
578	App\\Models\\User	134	Personal Access Token	d2be4b1b98e6ada676b15bf839caf5bee0ac38af149559c2ebc9826b0e42680e	["*"]	\N	2023-06-07 03:24:28	2023-06-07 03:24:28
579	App\\Models\\User	134	Personal Access Token	6c6fad0f18417530c0fba3b12cbef3fe092c8dd8ed428a844d988b5976b8bad0	["*"]	\N	2023-06-07 03:29:04	2023-06-07 03:29:04
580	App\\Models\\User	114	Personal Access Token	1074454515120070740d83926296e7e701973155a4ef75db96854b88dd9f5ea0	["*"]	\N	2023-06-07 03:30:06	2023-06-07 03:30:06
581	App\\Models\\User	114	Personal Access Token	48442a3e9b32c62f8d1d486a27cdb093fb26f109195a2042fa449eaad15cbad7	["*"]	\N	2023-06-07 03:32:12	2023-06-07 03:32:12
582	App\\Models\\User	134	Personal Access Token	d4808c2127f5655d33a5ca4b11cf882b95d3d1355adb613544cfcdbea09311fb	["*"]	\N	2023-06-07 03:37:19	2023-06-07 03:37:19
583	App\\Models\\User	60	Personal Access Token	fd2fa379d84663ec39d65f451442f4b06a2a6570abc5dfa350c64f53449da8cb	["*"]	\N	2023-06-07 04:11:31	2023-06-07 04:11:31
584	App\\Models\\User	135	Personal Access Token	69e2c3fa0a0c35d3678c2e3af133d487336eabd64c089bbc5780cc7230e071ee	["*"]	\N	2023-06-07 04:13:46	2023-06-07 04:13:46
585	App\\Models\\User	135	135Abhishek Tripathinbz10@mailinator.com	1c905f484c42ed3555c839154fa8f12554c204b9cd5be1ac507e166e3ee67f70	["*"]	\N	2023-06-07 04:13:54	2023-06-07 04:13:54
586	App\\Models\\User	83	Personal Access Token	a0e273ceb7f7171554adfc9a9947be9d702fcf42f8820eddd0ffbc66bbd489f3	["*"]	\N	2023-06-07 04:22:35	2023-06-07 04:22:35
587	App\\Models\\User	60	Personal Access Token	15137a28ce84132b0fb2669a1bac8e138251dc21c3e942bd0fc2f08c2436bb45	["*"]	\N	2023-06-07 05:42:47	2023-06-07 05:42:47
588	App\\Models\\User	60	Personal Access Token	71a6edcbaee4b0c906c9f6f1cb43208dff7852b0c64db6f8c8c81b5e908ffa23	["*"]	\N	2023-06-07 05:49:11	2023-06-07 05:49:11
589	App\\Models\\User	123	123Piu Nigernbz08@mailinator.com	2442e0698d57c349c2b2af1ebcec86e129e6760fd5678a3565c0d459a203fe16	["*"]	\N	2023-06-07 05:51:24	2023-06-07 05:51:24
590	App\\Models\\User	123	123Piu Nigernbz08@mailinator.com	546264c761e22abf0145f70247d5244779e9e21b26cc9ce90ee5331ebe120063	["*"]	\N	2023-06-07 05:53:27	2023-06-07 05:53:27
591	App\\Models\\User	60	Personal Access Token	b0e182b913d8ad1c5346be4d54e4741d3736a2790988ca8a6ae2d7e9809f65c3	["*"]	\N	2023-06-07 05:53:53	2023-06-07 05:53:53
592	App\\Models\\User	60	Personal Access Token	21d4158abbf1b0688dd0a22a23d4a62f48c3413ae2479cd678bacb82de8fb7e1	["*"]	\N	2023-06-07 05:54:34	2023-06-07 05:54:34
593	App\\Models\\User	123	123Piu Nigernbz08@mailinator.com	1f5e1048b7fd135555bf71df79f49008e1f536bb5a740fb4f181588919017941	["*"]	\N	2023-06-07 05:56:09	2023-06-07 05:56:09
594	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	1c95724a0380a7049efc8412b4d3bdfb2608e524f47d916bc996f0322aac0f43	["*"]	\N	2023-06-07 06:02:06	2023-06-07 06:02:06
595	App\\Models\\User	136	Personal Access Token	0088d834dda13671d7fa97ef0944471f961e826cfa9a88945fd37d25c74715ae	["*"]	\N	2023-06-07 06:17:42	2023-06-07 06:17:42
596	App\\Models\\User	136	136test testnewtestttyru@gmai.com	ffe108e4aa8e4cae6e496cc7032ecc815f3dfcd3bd718dd3b1b79aa566e5df01	["*"]	\N	2023-06-07 06:17:47	2023-06-07 06:17:47
597	App\\Models\\User	36	36Testtestuser@gmail.com	c1448223319b8ea0010b9da2758ad6a597ef04ccb9fbf732dd80ed952a552aa4	["*"]	\N	2023-06-07 06:31:33	2023-06-07 06:31:33
598	App\\Models\\User	105	Personal Access Token	fbd9b2a996911bc1e5fb8f56d35f9ade790ce1a397c7b2fc7357b24ca91ecac4	["*"]	\N	2023-06-07 06:34:57	2023-06-07 06:34:57
599	App\\Models\\User	60	Personal Access Token	cccf647c8231b5aea6bd90c7fe3e66eb9548d12dadbafccf6c86eb053758cab0	["*"]	\N	2023-06-07 07:33:06	2023-06-07 07:33:06
600	App\\Models\\User	60	Personal Access Token	b07defa792769c70e6c591039ea615ca09e8ad839e967a78ae0d48131846d4d2	["*"]	\N	2023-06-07 07:33:46	2023-06-07 07:33:46
601	App\\Models\\User	83	Personal Access Token	6c0a5909d0f061ca1dfa2c43a85f9896f24465dc01793b7aebfb6f5e6355cf8c	["*"]	\N	2023-06-07 07:35:49	2023-06-07 07:35:49
602	App\\Models\\User	137	Personal Access Token	cc171bbc4539caf17a82d06fd71eecd95a8631bcf65a13df12b2137d71fe91cd	["*"]	\N	2023-06-07 07:37:43	2023-06-07 07:37:43
603	App\\Models\\User	138	Personal Access Token	73599fdf2f1c2260f6c13ad6261b6fa320c215cf41b8f5f0cb6e299d35a6c5e0	["*"]	\N	2023-06-07 07:39:09	2023-06-07 07:39:09
604	App\\Models\\User	105	Personal Access Token	b86acd60674a1b24902fd86143b6527f70b381189e56357d33b206f24941296d	["*"]	\N	2023-06-07 08:39:30	2023-06-07 08:39:30
605	App\\Models\\User	105	Personal Access Token	aa8382f6a51023060a10b96124ab3f2793315fa58f70387bb64398aef08f73c6	["*"]	\N	2023-06-07 08:41:47	2023-06-07 08:41:47
606	App\\Models\\User	105	Personal Access Token	e38679d59c3b6daa2812dbe05c6b7d5791610793a141a8915a33bec2eb689ee6	["*"]	\N	2023-06-07 08:43:48	2023-06-07 08:43:48
607	App\\Models\\User	127	127hunain Ttthunain00@gmail.com	a0bd3662d20e0d98ab787567192b4a4dc5d6f4c59b1f92717060f05c5c80e021	["*"]	\N	2023-06-07 08:48:37	2023-06-07 08:48:37
608	App\\Models\\User	105	Personal Access Token	c2e3bf3e567b1da4bf171fad7c05dee9ab41760897e5d2bb7bc450bdd7a8299a	["*"]	\N	2023-06-07 08:49:47	2023-06-07 08:49:47
609	App\\Models\\User	124	Personal Access Token	9425a30312ce8f6aba34b20d8c85e71289a5635e85f4c4c7ecfd3adede1934f1	["*"]	\N	2023-06-07 08:50:52	2023-06-07 08:50:52
610	App\\Models\\User	39	39hunain devhunain88@gmail.com	333a385c1452c8aecacb5383553fd1f67efb6dc1efbf270eef70f500f7cd725e	["*"]	\N	2023-06-07 08:51:04	2023-06-07 08:51:04
611	App\\Models\\User	124	Personal Access Token	01747aedc3f8c51c9e5eab636cc2df7f1d652951fed60ad55fbf2bfd7cbc5bbb	["*"]	\N	2023-06-07 08:53:13	2023-06-07 08:53:13
612	App\\Models\\User	107	Personal Access Token	1c4f69893766c7c46d4617320fcaa373c1158d1da62dff8ae43ec77f085f4d81	["*"]	\N	2023-06-07 08:54:33	2023-06-07 08:54:33
613	App\\Models\\User	107	Personal Access Token	1a2f70075b88c3051ae635b74922784d8feaa617b1b42fe4507cc7cc22516185	["*"]	\N	2023-06-07 08:58:20	2023-06-07 08:58:20
614	App\\Models\\User	36	36Testtestuser@gmail.com	6c7e459c663e134abca303e58fc7a486ed217f5de37f2c9403223df4a71abc3e	["*"]	\N	2023-06-07 08:59:00	2023-06-07 08:59:00
615	App\\Models\\User	36	36Testtestuser@gmail.com	400422a493b2dfeaeb7b10a1e98769d2526a5189ac9535c8346cf17a6c881361	["*"]	\N	2023-06-07 08:59:37	2023-06-07 08:59:37
616	App\\Models\\User	36	36Testtestuser@gmail.com	488f0f04eac9ff1a7b43d8be0b1021a0aa9f484a951a6645aaaf772ed6a14b14	["*"]	\N	2023-06-07 09:01:31	2023-06-07 09:01:31
617	App\\Models\\User	89	Personal Access Token	d71862c1e484c54ab2fbc388b125c2466fb0928d13d8653cb1a831608952efc3	["*"]	\N	2023-06-07 09:01:40	2023-06-07 09:01:40
618	App\\Models\\User	139	Personal Access Token	511974ae53a902c0a02045a49d07a12e8c2b33bf3187bff4d38ec89ad284d52d	["*"]	\N	2023-06-07 09:03:19	2023-06-07 09:03:19
619	App\\Models\\User	139	139new user test testnewnasarkhan@gmail.com	d0e31dab1a591b17bf1a660785a1337c0d6dc579d7cea50188ecc706cea67a32	["*"]	\N	2023-06-07 09:03:24	2023-06-07 09:03:24
620	App\\Models\\User	39	39hunain devhunain88@gmail.com	af50176563cccf92e1041b27445561defed8af88031c0cf88b2b8152e5b8970a	["*"]	\N	2023-06-07 09:04:58	2023-06-07 09:04:58
621	App\\Models\\User	124	Personal Access Token	92f73fd909fa855a440589f598c6c5e1704534023d239f530c753d0c9405594e	["*"]	\N	2023-06-07 09:08:53	2023-06-07 09:08:53
622	App\\Models\\User	36	36Test Newtestuser@gmail.com	fd9ecda55e797634296cb342e5595021230b30edff2372ff1cce74ee5605f3ac	["*"]	\N	2023-06-07 09:24:04	2023-06-07 09:24:04
623	App\\Models\\User	36	36Test Newtestuser@gmail.com	bbe21ab7620f3143e27a4578e9422395e11da018cdd9c88a4380b7b048f8ac6e	["*"]	\N	2023-06-07 09:35:51	2023-06-07 09:35:51
624	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	16e31fa158721c6e57ac9d09127680c9946577db4e39df937bfd3d11483cbc68	["*"]	\N	2023-06-07 12:30:14	2023-06-07 12:30:14
625	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	c81a01f8f12b2e0819b6b25ef63439b1722b870ebe65a11a963da7e3ebe1ad6d	["*"]	\N	2023-06-07 12:31:36	2023-06-07 12:31:36
626	App\\Models\\User	60	Personal Access Token	c73e540f0f3cb24d76237c17a4647a7dc4523a8a211942e6902761dae1f8eb4a	["*"]	\N	2023-06-07 12:32:12	2023-06-07 12:32:12
627	App\\Models\\User	83	Personal Access Token	757a9452ff634f13bd03b187ddc22ef9af986e270be4dcfd304abaa0510bac44	["*"]	\N	2023-06-07 12:33:29	2023-06-07 12:33:29
628	App\\Models\\User	39	39hunain devhunain88@gmail.com	d9696b11e5d137a9758627fdde7c51d17ae06e980031ef1b812780f3069ce319	["*"]	\N	2023-06-07 12:33:34	2023-06-07 12:33:34
629	App\\Models\\User	129	129Anima Moryenbz09@mailinator.com	62133544da7f3a31bc41116f74ae4ed406a742bcfb2a1ae9fa8479d81653b4e0	["*"]	\N	2023-06-07 12:34:58	2023-06-07 12:34:58
630	App\\Models\\User	123	123Piu Nigernbz08@mailinator.com	b87e9cf6429b0b59a869299f37083d57aac803ed782267aa03c20effd70aec32	["*"]	\N	2023-06-07 12:38:07	2023-06-07 12:38:07
631	App\\Models\\User	73	73Abdul Rahimnbz03@mailinator.com	908beaf5bc60276099b197200204a9633ce3bf33de919aaa877cb0b1b59f4312	["*"]	\N	2023-06-07 12:40:19	2023-06-07 12:40:19
632	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	1bcc268b47dfb3cfa8f655d6b0e01b35a9f91585cc204a93b9aa7228e3a54d78	["*"]	\N	2023-06-07 12:41:15	2023-06-07 12:41:15
633	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	36c4058c48b64620ed484c9d36a89a65410d69fe278920d0490e8ed5c47c03d0	["*"]	\N	2023-06-07 12:46:11	2023-06-07 12:46:11
634	App\\Models\\User	60	Personal Access Token	26f4e45610bc76343673ab76b1c99aa7567015e01dd22925d7a4857118cfa705	["*"]	\N	2023-06-07 12:46:52	2023-06-07 12:46:52
635	App\\Models\\User	60	Personal Access Token	a2a5a3382ec234147c4a6d7d7d23523bdb217703d31e1b90d21faed60b7bd73e	["*"]	\N	2023-06-07 12:48:04	2023-06-07 12:48:04
636	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	e40b0c962a66f79a7e5b311f2ddc0187fce25a99655f0623bfa9e4b6dde6f5c6	["*"]	\N	2023-06-07 12:51:30	2023-06-07 12:51:30
637	App\\Models\\User	39	39hunain devhunain88@gmail.com	b6f7926ac341b6fa3c5d18ef4ecf21fafcd9efa6bbd4e63ec4471fe6784705f7	["*"]	\N	2023-06-07 12:59:26	2023-06-07 12:59:26
638	App\\Models\\User	140	Personal Access Token	63a68add2212fb495cdee5c92ed5a1fe9793f8044d2be9b5999866680829fe89	["*"]	\N	2023-06-07 13:47:24	2023-06-07 13:47:24
639	App\\Models\\User	140	140Anima Bosenbz12@mailinator.com	7459d964fc8d42cfe05abfc01e26dd263b2492ee88f6506d44f0fe41f91d6c65	["*"]	\N	2023-06-07 13:47:41	2023-06-07 13:47:41
640	App\\Models\\User	57	57Nemai Biswasnbz01@mailinator.com	7ca8348130a7f4ecf617cb4fdcdb437a12d43b2087e69939eafa322edc0ff32a	["*"]	\N	2023-06-07 13:51:06	2023-06-07 13:51:06
641	App\\Models\\User	116	Personal Access Token	c9215fc648d579c2fee57bb10d1d4388a3f7f6fef1f2e02adb4f3a90c807a366	["*"]	\N	2023-06-07 16:05:18	2023-06-07 16:05:18
642	App\\Models\\User	36	36Test Newtestuser@gmail.com	22b28b4def9c5671bfb9828795dc710a01f9dd9ab5f18e596fe5d96b8629c9f8	["*"]	\N	2023-06-07 17:56:37	2023-06-07 17:56:37
643	App\\Models\\User	47	47hunain Tenhunain99@gmail.com	db38ab3e4d48f129f398f8a46d8569713170662ddab384d88af54b243adc3a15	["*"]	\N	2023-06-07 17:59:16	2023-06-07 17:59:16
644	App\\Models\\User	36	36Test Newtestuser@gmail.com	ea8fcb571919c31c97e6137ae6ebb558cc4d5f3e7140f984702bbfce4bfa18a5	["*"]	\N	2023-06-07 20:24:04	2023-06-07 20:24:04
645	App\\Models\\User	141	Personal Access Token	43c979fb63d7a4ff6aad596a9444edd5f41d4ee76d3c6dde1396490fe5114bf3	["*"]	\N	2023-06-07 22:47:38	2023-06-07 22:47:38
646	App\\Models\\User	141	141admin testadmintest1@gmail.com	1c220e96031d88cbba43c72eea9f6ea1daf47681bc0b9f4af4c044a8b17f03a7	["*"]	\N	2023-06-07 22:47:44	2023-06-07 22:47:44
647	App\\Models\\User	142	Personal Access Token	e72501f80352756de6dc3b1b3d9fa39bd2de1cd844a61a29fff1eb26dd12b307	["*"]	\N	2023-06-07 23:37:34	2023-06-07 23:37:34
648	App\\Models\\User	142	Personal Access Token	58cc9a14aa662f6da1207f60b37d7aecd2a1d26323838dd352d8d77f199bf4be	["*"]	\N	2023-06-07 23:38:36	2023-06-07 23:38:36
649	App\\Models\\User	82	Personal Access Token	ebfff9708259092c91bd89ecd0c878df3dc0cfd67588514578f62ab904dc7e7b	["*"]	\N	2023-06-08 02:45:59	2023-06-08 02:45:59
650	App\\Models\\User	82	Personal Access Token	f54866d93b396f2f16f74c37b821e1962fbdb83e6889524eaf9a8572ac379a49	["*"]	\N	2023-06-08 02:59:09	2023-06-08 02:59:09
651	App\\Models\\User	126	126anil pixelanil@dxbusinessgroup.com	35cec92037442ddc9b905e21a3caf3dd5962a0a957cbcdf07cf3bac202276570	["*"]	\N	2023-06-08 03:05:32	2023-06-08 03:05:32
652	App\\Models\\User	60	Personal Access Token	be6e6902dfee310a0095aff81287638b0702e0e74f402ac444de0d8d3f0d9f71	["*"]	\N	2023-06-08 04:23:21	2023-06-08 04:23:21
653	App\\Models\\User	120	Personal Access Token	90c1f96a1ed390818a50c8b990ecd55614c378f12408c94fd1357c904064b3c7	["*"]	\N	2023-06-08 04:32:04	2023-06-08 04:32:04
654	App\\Models\\User	15	Personal Access Token	d985d45b617c8f1ca690c129414c5e73ac617e68a56edea7dbdd5506c67c91ba	["*"]	\N	2023-06-08 04:35:28	2023-06-08 04:35:28
655	App\\Models\\User	60	Personal Access Token	07036ceaf1b0447b203f303ea9aed2c1f8dcbcaed7882bd67092a193e00fbceb	["*"]	\N	2023-06-08 04:46:11	2023-06-08 04:46:11
656	App\\Models\\User	120	Personal Access Token	93c2248d926543389c4f57ee76c09841fb2533207c3c7c2f1baacc3a45e0e82a	["*"]	\N	2023-06-08 04:46:53	2023-06-08 04:46:53
657	App\\Models\\User	120	Personal Access Token	46221831c04649340ad8d4fdf530ecce1fb087e5b517eea10e101bd413e206d1	["*"]	\N	2023-06-08 05:55:54	2023-06-08 05:55:54
658	App\\Models\\User	127	127hunain Ttthunain00@gmail.com	cd0eaccb5d47fca821f6532e77afd082d32d8941dd8af3bf7fd60535d84fbd60	["*"]	\N	2023-06-08 06:16:51	2023-06-08 06:16:51
659	App\\Models\\User	116	Personal Access Token	04470b5eac79af952452314a3aaa50e0a3233825bc8932743cdd493d408803ee	["*"]	\N	2023-06-08 06:19:55	2023-06-08 06:19:55
660	App\\Models\\User	143	Personal Access Token	f5b4a396650edfc5aa4e36e9a6f9b6ab933ad8f4d5bd811c30a92a6f2a774e11	["*"]	\N	2023-06-08 06:40:50	2023-06-08 06:40:50
661	App\\Models\\User	143	Personal Access Token	d5b9b1785d8d482c0fe8e9c68dee788223a2552403c852a98198be5015804c33	["*"]	\N	2023-06-08 06:42:45	2023-06-08 06:42:45
662	App\\Models\\User	143	Personal Access Token	74fc1c59b5a382f1196ed6dc3e3ea2b355a5488b752151d80dddc6892d3c031a	["*"]	\N	2023-06-08 06:47:25	2023-06-08 06:47:25
663	App\\Models\\User	116	Personal Access Token	2dcbd72e283fbb10e61c00615e16883caef6de66727a60f7d28759cd2bac313b	["*"]	\N	2023-06-08 06:52:36	2023-06-08 06:52:36
664	App\\Models\\User	60	Personal Access Token	1bc1460bbc9bc02e3bff82798610f51ff34270d943e8cb83e442897be4095563	["*"]	\N	2023-06-08 07:21:53	2023-06-08 07:21:53
665	App\\Models\\User	83	Personal Access Token	ef1bf6cf773a1a6a9c728138114f9ac466fdb255a11b2c7ee94ff787b84f6f43	["*"]	\N	2023-06-08 07:22:08	2023-06-08 07:22:08
666	App\\Models\\User	144	Personal Access Token	7477407a229ff4488c2d2bae5a8919a4cf9a77a918fc00d36816c44d2a564390	["*"]	\N	2023-06-08 08:17:39	2023-06-08 08:17:39
667	App\\Models\\User	145	Personal Access Token	b05e29f9c3b09751885379d3b2942baccca94375d1b400e31433efd6d40a35f2	["*"]	\N	2023-06-08 08:43:15	2023-06-08 08:43:15
668	App\\Models\\User	60	Personal Access Token	bac1022fc26e2d45f3aae449bbe6a5bb8650a0c915a32a827ddf6d5dc0a40909	["*"]	\N	2023-06-08 08:43:34	2023-06-08 08:43:34
669	App\\Models\\User	144	Personal Access Token	32b7098e4ca8d67daa8162bf18c14b267d59b4fbc2d8f92a7d501790c6ddde7e	["*"]	\N	2023-06-08 08:47:08	2023-06-08 08:47:08
670	App\\Models\\User	39	39hunain devhunain88@gmail.com	9e610c7f47c29fc557ad4a4b4c8903aeb74c0c5eae89397a22563a7134a930b4	["*"]	\N	2023-06-08 09:38:48	2023-06-08 09:38:48
671	App\\Models\\User	146	Personal Access Token	527848347736ea0ce54b8609f730841db5b1591448cac59b054c97cd8a12f72d	["*"]	\N	2023-06-08 09:47:07	2023-06-08 09:47:07
672	App\\Models\\User	146	146Test Userxididi5690@ratedane.com	06835ebd34449b400f74a001dc4fed1b5fc594d07514c58da88c6b0c891c694e	["*"]	\N	2023-06-08 09:47:17	2023-06-08 09:47:17
673	App\\Models\\User	124	Personal Access Token	0508e49798bf9eb55a6ea27c9e73f08d895ce0afde854227c2a63c515ff11bad	["*"]	\N	2023-06-08 10:12:38	2023-06-08 10:12:38
674	App\\Models\\User	127	127hunain TTThunain00@gmail.com	11e3540d18fa0c3cd93eaf422b290147880807d4213d4edf4cdba3314482e37e	["*"]	\N	2023-06-08 10:23:06	2023-06-08 10:23:06
675	App\\Models\\User	60	Personal Access Token	00654f102cd6b9af0678ac13bba63f8a792fa7254805d34e58e3fcc116e007ac	["*"]	\N	2023-06-08 11:53:13	2023-06-08 11:53:13
676	App\\Models\\User	144	Personal Access Token	0f7e66c9bc820149bcd22994f6bf8ac2e77e4e2600d8a3befc6443cef1df3ac7	["*"]	\N	2023-06-08 11:54:43	2023-06-08 11:54:43
677	App\\Models\\User	145	Personal Access Token	1aa6e9abc276c2abb22a781876371ba3dc231580d2ec5ebe3329432eff67bd35	["*"]	\N	2023-06-08 11:55:31	2023-06-08 11:55:31
678	App\\Models\\User	145	Personal Access Token	9906e96e9174df555fbfdfe947015237cc875a658078fafb70e782ea80b2db77	["*"]	\N	2023-06-08 12:10:37	2023-06-08 12:10:37
679	App\\Models\\User	60	Personal Access Token	f029197244bb789cb0c571eb2cdf13382a45b9913ab798b64214556abc106333	["*"]	\N	2023-06-08 12:25:41	2023-06-08 12:25:41
680	App\\Models\\User	145	Personal Access Token	1b62d8f1acb8e5b15fe661911ab1df9d9199624984c02f68b4f4512969e57e34	["*"]	\N	2023-06-08 12:26:14	2023-06-08 12:26:14
681	App\\Models\\User	83	Personal Access Token	8c8c368682d61a990a53adfbde58cec755f59c0e0c1d92104054ea11b5195112	["*"]	\N	2023-06-08 12:31:49	2023-06-08 12:31:49
682	App\\Models\\User	39	39hunain devhunain88@gmail.com	b5f98e2ab6e72ec291c897c9a3e4ce66d0405fc202bf750b623e7ad54d5030f2	["*"]	\N	2023-06-08 12:32:31	2023-06-08 12:32:31
683	App\\Models\\User	145	Personal Access Token	273149118df920987eb04242939710cecd9be4a79acd645740875353bdb5bbf1	["*"]	\N	2023-06-08 12:33:26	2023-06-08 12:33:26
684	App\\Models\\User	73	73Abdul Rahimnbz03@mailinator.com	d6cd3157c30997c06053f029bf954c999c74bf58d21ba5d5e91b9b76bbda7845	["*"]	\N	2023-06-08 12:44:26	2023-06-08 12:44:26
685	App\\Models\\User	60	Personal Access Token	2332c5afd2b3fc4f333e0991a1acf0f186dc5822a31f46629c5d864f4ffdfc15	["*"]	\N	2023-06-08 12:49:31	2023-06-08 12:49:31
686	App\\Models\\User	83	Personal Access Token	dbd7f379bb055c9b10ec5a189bf18c2f7b3580637802c49f84d897fa5d7ae0cd	["*"]	\N	2023-06-08 12:49:59	2023-06-08 12:49:59
687	App\\Models\\User	145	Personal Access Token	5211a16c65285f9cce96e2beb72a0f8f0c81e0abfaa03fab62d452863e0f9754	["*"]	\N	2023-06-08 12:54:25	2023-06-08 12:54:25
688	App\\Models\\User	145	Personal Access Token	16fefd8daafdca14fde31bc4c75e82b1eaaf66932e7a5b3a5a33d85a4970d161	["*"]	\N	2023-06-08 12:57:45	2023-06-08 12:57:45
689	App\\Models\\User	39	39hunain devhunain88@gmail.com	cec9c189f4fdb3244b6b65a651b8f5c57b276ab36b2de2c10d226d52ca74237a	["*"]	\N	2023-06-08 13:02:47	2023-06-08 13:02:47
690	App\\Models\\User	116	Personal Access Token	fd8ae2f1e81eb9a931402f252c74ffd8eff3ca41d90bfc3b3a7f7432a70cec29	["*"]	\N	2023-06-08 13:12:44	2023-06-08 13:12:44
691	App\\Models\\User	39	39hunain devhunain88@gmail.com	672c21d880ffa5b0a46e4d28fdf84545de9b3a4b4fce348c8f265ac47ad87756	["*"]	\N	2023-06-08 13:17:46	2023-06-08 13:17:46
692	App\\Models\\User	39	39hunain devhunain88@gmail.com	c73c4af367316ba5c85efbb2a858c3dd256d3d42bd805677052f2820638e4d82	["*"]	\N	2023-06-08 13:18:05	2023-06-08 13:18:05
693	App\\Models\\User	107	Personal Access Token	f2bf2f807273997c1d4b6b867ee47b5e781dcea986750b0263517bd52b90e986	["*"]	\N	2023-06-08 15:23:30	2023-06-08 15:23:30
694	App\\Models\\User	127	127hunain TTThunain00@gmail.com	3d1848794ca02634187aef7d8c3afe43e3eff0b82ffae4e01a1f1ac20ed37fe3	["*"]	\N	2023-06-08 17:04:26	2023-06-08 17:04:26
695	App\\Models\\User	36	36Test Newtestuser@gmail.com	072d78e9539fb906c8a09dd0155f6c64708babf07fc8f14f66c81cfadc01d369	["*"]	\N	2023-06-08 17:29:34	2023-06-08 17:29:34
696	App\\Models\\User	105	Personal Access Token	3af4e210290095657e4f00ffb91c87dd5f273dfa8965d1711e2b7ea5146e8219	["*"]	\N	2023-06-08 19:13:18	2023-06-08 19:13:18
697	App\\Models\\User	145	Personal Access Token	2dfe3a61f3d30554d20e5237fc252050a1bf250fba5d6d48fd7022a526af395b	["*"]	\N	2023-06-09 03:55:55	2023-06-09 03:55:55
698	App\\Models\\User	60	Personal Access Token	fb3c9c022478b4ab38b5210f26a89eead81cd11e12116ca9748deda64c3081a4	["*"]	\N	2023-06-09 04:32:45	2023-06-09 04:32:45
699	App\\Models\\User	60	Personal Access Token	8785f57be0506d39c1a763b565cbce72500576bfd7093baf41dafa4430f52266	["*"]	\N	2023-06-09 04:36:51	2023-06-09 04:36:51
700	App\\Models\\User	39	39hunain devhunain88@gmail.com	0647e3ede2d90eb77b3cc46003cd8230fd66a0113c5a2bba5957ed02f7715602	["*"]	\N	2023-06-10 15:52:24	2023-06-10 15:52:24
701	App\\Models\\User	144	Personal Access Token	df6bb28a7ea6be21e21bbc02624cc2dd1b10874e07d223fbef26f2cf33e76aa1	["*"]	\N	2023-06-12 11:12:18	2023-06-12 11:12:18
702	App\\Models\\User	147	Personal Access Token	a20a7ea2146c188c8e8cdecf1a35527b8fbbe9130b63ef86a7534727a19daedb	["*"]	\N	2023-06-12 11:12:43	2023-06-12 11:12:43
703	App\\Models\\User	60	Personal Access Token	893a3d61a34999427ebd0466f89702d4e8f23fbae5f9459a742cfec83ab03dac	["*"]	\N	2023-06-12 11:38:58	2023-06-12 11:38:58
704	App\\Models\\User	148	Personal Access Token	7dba954796b7aa9efd611f1c0d5a1e1ba282131f5f239edfeaa46b80e0cfeb4d	["*"]	\N	2023-06-12 11:39:23	2023-06-12 11:39:23
705	App\\Models\\User	148	Personal Access Token	68c10879cdbc063f15f999662cc04dd3e855ee877fbccb2834e5f763ec4eacbe	["*"]	\N	2023-06-12 11:40:05	2023-06-12 11:40:05
706	App\\Models\\User	123	123Piu Nigernbz08@mailinator.com	dd5323ef75f193010e389882800786c93cbfff519693bd8759326d31ba2f1c85	["*"]	\N	2023-06-12 11:40:31	2023-06-12 11:40:31
707	App\\Models\\User	123	123Piu Nigernbz08@mailinator.com	a814723a6ac3d3677a23330d4c3a13fc0eaeb6a910526fe8a2ae10a2d2961da7	["*"]	\N	2023-06-12 11:41:51	2023-06-12 11:41:51
708	App\\Models\\User	39	39hunain devhunain88@gmail.com	ba0c72215fb920de4444752d9c99234ddf46b5283270a8904f30bcb78f4923cb	["*"]	\N	2023-06-15 08:59:55	2023-06-15 08:59:55
709	App\\Models\\User	36	36Test Newtestuser@gmail.com	56b3ccd118f4d7eb7ba777e2dd591bdee9c08fc83d40cdf17b001d7ccdd67ac3	["*"]	\N	2023-06-15 09:37:48	2023-06-15 09:37:48
\.


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.photos (id, vendor_id, image, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: post_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_comments (id, user_id, post_id, parent_id, comment, created_at, updated_at, comment_node_id, bad_words, is_bad_word_exist, active) FROM stdin;
\.


--
-- Data for Name: post_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_files (id, post_id, height, width, extension, is_default, url, created_at, updated_at, duration, thumb_image, have_hls_url, hls_url, hls_cdn_url) FROM stdin;
\.


--
-- Data for Name: post_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_likes (id, post_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: post_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_reports (id, user_id, post_id, reason, problem_id, created_at, updated_at) FROM stdin;
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
-- Data for Name: post_view_insights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_view_insights (id, post_id, viewed_user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, user_id, caption, file_type, file, location_name, lattitude, longitude, post_firebase_node_id, created_at, updated_at, active, visibility, extra_file_names, is_bad_word_exist, bad_words, dissable_comment, thumb_image) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, product_type, product_desc_full, product_desc_short, product_sale_from, product_sale_to, product_featured_image, product_tag, product_created_by, product_updated_by, product_status, product_deleted, product_name, product_variation_type, product_taxable, product_vender_id, product_image, product_unique_iden, product_brand_id, product_name_arabic, product_desc_full_arabic, product_desc_short_arabic, cash_points, offer_enabled, deal_enabled, is_today_offer, today_offer_date, thanku_perc, custom_status, meta_title, meta_keyword, meta_description, product_vendor_status, product_gender, is_kandora, collection_id, hot_offer_enabled, trending_enabled, offers_list, zero_quantity_orders, product_code, product_tags, sort_order, offer_for_short, hot_offer_sort_order, new_trending_sort_order, author_id, deleted, default_category_id, default_attribute_id, created_at, updated_at, store_id, moda_main_category, moda_sub_category, brand, ret_applicable, ret_policy_days, ret_policy, account_id, activity_id) FROM stdin;
17	1	hello	test	\N	\N	\N	\N	0	0	1	0	Test excel	1	1	0	\N	121	0	Test excel	hello	test	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	6	17	2023-05-22 03:19:47	\N	0	0	0	0	0	0	\N	\N	\N
8	1	\N	\N	\N	\N	\N	\N	1	1	1	0	Solid Masonry Block 8”	1	1	1	\N	32897660	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	8	2023-05-17 12:40:22	2023-06-05 05:49:48	1	0	0	0	0	0	\N	\N	\N
12	1	\N	\N	\N	\N	\N	\N	1	1	1	0	LaPlaza	1	1	1	\N	348715368	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	12	2023-05-19 11:41:59	2023-06-05 04:03:05	1	0	0	1	0	0	\N	\N	\N
18	1	hello	test	\N	\N	\N	\N	0	0	1	0	Test excel	1	1	0	\N	121	0	Test excel	hello	test	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	6	18	2023-05-22 03:19:50	\N	0	0	0	0	0	0	\N	\N	\N
5	1	\N	\N	\N	\N	\N	\N	1	1	1	0	Hollow Masonry Block 8	1	1	1	\N	479107181	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	5	2023-05-17 12:32:19	2023-06-05 06:03:58	1	0	0	0	0	0	\N	\N	\N
19	1	hello	test	\N	\N	\N	\N	0	0	1	0	Test excel	1	1	0	\N	121	0	Test excel	hello	test	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	6	19	2023-05-22 03:19:54	\N	0	0	0	0	0	0	\N	\N	\N
14	1	\N	\N	\N	\N	\N	\N	1	1	0	0	Rectangular Tiles	1	1	1	\N	500072777	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	14	2023-05-19 11:45:27	2023-06-08 08:46:02	1	0	0	1	0	0	\N	\N	\N
3	1	\N	\N	\N	\N	\N	\N	1	1	1	0	Hollow Masonry Block 4”	1	1	1	\N	474613693	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	3	2023-05-17 12:20:25	2023-06-05 05:48:48	1	0	0	0	0	0	\N	\N	\N
7	1	\N	\N	\N	\N	\N	\N	1	1	1	0	Thermal Masonry Block 8”	1	1	1	\N	548533764	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	7	2023-05-17 12:38:41	2023-06-05 06:03:12	1	0	0	0	0	0	\N	\N	\N
1	1	\N	\N	\N	\N	\N	\N	1	1	0	0	BRICK	1	1	1	\N	735907084	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	1	2023-05-12 14:07:12	2023-05-30 04:43:47	1	0	0	0	0	0	\N	\N	\N
20	1	hello	test	\N	\N	\N	\N	0	0	1	0	Test excel	1	1	0	\N	121	0	Test excel	hello	test	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	6	20	2023-05-22 03:19:58	\N	0	0	0	0	0	0	\N	\N	\N
21	1	hello	test	\N	\N	\N	\N	0	0	1	0	Test excel	1	1	0	\N	121	0	Test excel	hello	test	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	6	21	2023-05-22 03:20:02	\N	0	0	0	0	0	0	\N	\N	\N
16	1	\N	\N	\N	\N	\N	\N	1	1	1	0	Square Tiles	1	1	1	\N	461016523	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	16	2023-05-19 11:50:32	2023-06-06 05:03:20	1	0	0	1	0	0	\N	\N	\N
11	1	\N	\N	\N	\N	\N	\N	1	1	1	0	Rectanguler Tiles	1	1	1	\N	901372901	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	11	2023-05-17 13:06:52	2023-06-05 04:03:55	1	0	0	1	0	0	\N	\N	\N
10	1	\N	\N	\N	\N	\N	\N	1	1	1	0	Rectanguler Tiles	1	1	1	\N	346399521	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	10	2023-05-17 12:47:50	2023-06-05 06:06:17	1	0	0	1	0	0	\N	\N	\N
4	1	\N	\N	\N	\N	\N	\N	1	1	1	0	Hollow Masonry Block 6''	1	1	1	\N	315374018	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	4	2023-05-17 12:28:59	2023-06-05 05:48:04	1	0	0	0	0	0	\N	\N	\N
6	1	\N	\N	\N	\N	\N	\N	1	1	1	0	Solid Masonry Block 8”	1	1	1	\N	74331697	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	6	2023-05-17 12:37:05	2023-06-05 05:45:26	1	0	0	0	0	0	\N	\N	\N
15	1	\N	\N	\N	\N	\N	\N	1	1	1	0	Square Block	1	1	1	\N	464781548	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	15	2023-05-19 11:48:47	2023-06-05 04:00:37	1	0	0	1	0	0	\N	\N	\N
2	1	\N	\N	\N	\N	\N	\N	1	1	1	0	Squared Cube	1	1	1	\N	725821428	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	2	2023-05-17 12:13:01	2023-06-05 06:01:34	1	0	0	0	0	0	\N	\N	\N
32	1	hello	test	\N	\N	\N	\N	0	0	1	0	Test excel	1	1	0	\N	121	0	Test excel	hello	test	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	6	32	2023-05-22 03:20:50	\N	0	0	0	0	0	0	\N	\N	\N
13	1	\N	\N	\N	\N	\N	\N	1	1	1	0	Rectanguler Tiles	1	1	1	\N	797297923	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	13	2023-05-19 11:44:04	2023-06-05 04:02:03	1	0	0	1	0	0	\N	\N	\N
23	1	hello	test	\N	\N	\N	\N	0	0	1	0	Test excel	1	1	0	\N	121	0	Test excel	hello	test	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	6	23	2023-05-22 03:20:10	\N	0	0	0	0	0	0	\N	\N	\N
24	1	hello	test	\N	\N	\N	\N	0	0	1	0	Test excel	1	1	0	\N	121	0	Test excel	hello	test	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	6	24	2023-05-22 03:20:14	\N	0	0	0	0	0	0	\N	\N	\N
25	1	hello	test	\N	\N	\N	\N	0	0	1	0	Test excel	1	1	0	\N	121	0	Test excel	hello	test	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	6	25	2023-05-22 03:20:24	\N	0	0	0	0	0	0	\N	\N	\N
26	1	hello	test	\N	\N	\N	\N	0	0	1	0	Test excel	1	1	0	\N	121	0	Test excel	hello	test	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	6	26	2023-05-22 03:20:28	\N	0	0	0	0	0	0	\N	\N	\N
27	1	hello	test	\N	\N	\N	\N	0	0	1	0	Test excel	1	1	0	\N	121	0	Test excel	hello	test	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	6	27	2023-05-22 03:20:32	\N	0	0	0	0	0	0	\N	\N	\N
28	1	hello	test	\N	\N	\N	\N	0	0	1	0	Test excel	1	1	0	\N	121	0	Test excel	hello	test	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	6	28	2023-05-22 03:20:35	\N	0	0	0	0	0	0	\N	\N	\N
29	1	hello	test	\N	\N	\N	\N	0	0	1	0	Test excel	1	1	0	\N	121	0	Test excel	hello	test	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	6	29	2023-05-22 03:20:39	\N	0	0	0	0	0	0	\N	\N	\N
30	1	hello	test	\N	\N	\N	\N	0	0	1	0	Test excel	1	1	0	\N	121	0	Test excel	hello	test	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	6	30	2023-05-22 03:20:43	\N	0	0	0	0	0	0	\N	\N	\N
31	1	hello	test	\N	\N	\N	\N	0	0	1	0	Test excel	1	1	0	\N	121	0	Test excel	hello	test	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	6	31	2023-05-22 03:20:46	\N	0	0	0	0	0	0	\N	\N	\N
22	1	hello	test	\N	\N	\N	\N	0	0	1	0	Test excel	1	1	0	\N	121	0	Test excel	hello	test	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	6	22	2023-05-22 03:20:06	\N	0	0	0	0	0	0	\N	\N	\N
9	1	\N	\N	\N	\N	\N	\N	1	1	1	0	Uni Paving Tiles	1	1	1	\N	721488501	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	9	2023-05-17 12:44:06	2023-06-05 04:05:27	1	0	0	1	0	0	\N	\N	\N
33	1	\N	\N	\N	\N	\N	\N	1	1	0	0	Johnson Tiles	1	1	1	\N	608724106	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	33	2023-05-31 06:42:17	2023-06-03 07:10:10	1	0	0	1	0	0	\N	\N	\N
34	1	\N	\N	\N	\N	\N	\N	1	1	0	0	Johnson Marble the Asian marble premium	1	1	1	\N	781230703	0	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	34	2023-05-31 06:45:34	2023-06-08 09:21:05	1	0	0	0	0	0	\N	\N	\N
\.


--
-- Data for Name: product_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_attribute (attribute_id, attribute_name, attribute_status, attribute_created_date, attribute_name_arabic, attribute_type, is_deleted) FROM stdin;
\.


--
-- Data for Name: product_attribute_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_attribute_values (attribute_values_id, attribute_id, attribute_values, attribute_values_arabic, attribute_value_in, attribute_value_color, attribute_value_label, attribute_value_label_arabic, attribute_value_image, is_deleted, attribute_value_sort_order, attribute_color) FROM stdin;
\.


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_category (product_category_id, product_id, category_id) FROM stdin;
101	33	5
102	33	3
109	15	3
110	13	7
111	12	3
112	11	5
113	11	3
115	9	5
119	6	7
120	4	5
121	3	5
122	8	3
123	2	5
124	7	3
125	5	3
37	17	4
38	18	4
39	19	4
40	20	4
41	21	4
42	22	4
43	23	4
44	24	4
45	25	4
46	26	4
47	27	4
48	28	4
49	29	4
50	30	4
51	31	4
52	32	4
127	10	5
128	16	7
129	14	5
130	34	5
67	1	5
\.


--
-- Data for Name: product_docs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_docs (id, product_id, title, doc_path) FROM stdin;
\.


--
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_images (id, product_id, image_name, product_attribute_id) FROM stdin;
\.


--
-- Data for Name: product_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_likes (id, product_id, user_id, created_at, updated_at, product_attribute_id) FROM stdin;
3	11	15	2023-05-24 11:25:09	2023-05-24 11:25:09	18
66	34	57	2023-06-01 04:34:32	2023-06-01 04:34:32	34
67	33	47	2023-06-01 16:55:10	2023-06-01 16:55:10	33
6	15	15	2023-05-24 12:46:56	2023-05-24 12:46:56	15
70	33	73	2023-06-03 06:52:57	2023-06-03 06:52:57	33
71	34	73	2023-06-03 07:01:17	2023-06-03 07:01:17	34
72	33	57	2023-06-03 07:12:20	2023-06-03 07:12:20	33
12	1	47	2023-05-25 05:12:14	2023-05-25 05:12:14	1
74	34	39	2023-06-03 11:41:26	2023-06-03 11:41:26	34
18	16	49	2023-05-29 20:41:07	2023-05-29 20:41:07	16
20	16	53	2023-05-29 21:54:23	2023-05-29 21:54:23	16
21	15	53	2023-05-29 21:54:49	2023-05-29 21:54:49	15
78	15	39	2023-06-05 13:15:07	2023-06-05 13:15:07	15
80	9	108	2023-06-06 03:23:21	2023-06-06 03:23:21	9
81	15	60	2023-06-06 04:49:12	2023-06-06 04:49:12	15
83	12	83	2023-06-06 04:49:19	2023-06-06 04:49:19	12
88	14	83	2023-06-06 04:54:31	2023-06-06 04:54:31	14
33	8	54	2023-05-29 22:50:16	2023-05-29 22:50:16	8
34	7	54	2023-05-29 22:50:18	2023-05-29 22:50:18	7
99	14	123	2023-06-06 07:25:54	2023-06-06 07:25:54	14
105	16	132	2023-06-06 19:36:12	2023-06-06 19:36:12	16
106	16	133	2023-06-06 19:36:23	2023-06-06 19:36:23	16
107	15	133	2023-06-06 19:36:41	2023-06-06 19:36:41	15
108	15	132	2023-06-06 19:43:32	2023-06-06 19:43:32	15
111	12	82	2023-06-07 03:00:01	2023-06-07 03:00:01	12
112	16	135	2023-06-07 05:22:02	2023-06-07 05:22:02	16
115	11	105	2023-06-07 07:44:29	2023-06-07 07:44:29	11
116	16	124	2023-06-07 09:16:32	2023-06-07 09:16:32	16
120	16	57	2023-06-07 14:02:43	2023-06-07 14:02:43	16
122	14	36	2023-06-07 22:43:24	2023-06-07 22:43:24	14
123	14	82	2023-06-08 02:54:37	2023-06-08 02:54:37	14
124	16	60	2023-06-08 04:51:50	2023-06-08 04:51:50	16
127	10	60	2023-06-08 04:52:28	2023-06-08 04:52:28	10
128	11	60	2023-06-08 04:52:34	2023-06-08 04:52:34	11
131	15	120	2023-06-08 05:44:16	2023-06-08 05:44:16	15
134	16	144	2023-06-08 08:50:03	2023-06-08 08:50:03	16
135	15	144	2023-06-08 08:51:06	2023-06-08 08:51:06	15
138	15	107	2023-06-08 15:30:28	2023-06-08 15:30:28	15
139	12	107	2023-06-08 15:30:41	2023-06-08 15:30:41	12
140	16	107	2023-06-08 15:30:51	2023-06-08 15:30:51	16
152	15	147	2023-06-12 11:26:25	2023-06-12 11:26:25	15
153	13	147	2023-06-12 11:26:27	2023-06-12 11:26:27	13
154	10	123	2023-06-12 11:43:49	2023-06-12 11:43:49	10
155	11	123	2023-06-12 11:43:51	2023-06-12 11:43:51	11
\.


--
-- Data for Name: product_selected_attribute_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_selected_attribute_list (product_attribute_id, product_id, manage_stock, stock_quantity, allow_back_order, stock_status, sold_individually, weight, length, height, width, shipping_class, sale_price, regular_price, taxable, image, shipping_note, title, rating, rated_users, image_temp, barcode, image_action, pr_code, product_desc, product_full_descr, size_chart, unit, minimum_qty, thickness, materials, flash_sale, featured) FROM stdin;
6	6	0	50000	0	0	0	32	16	\N	8	0	130	150	0	6464ca71d5de4_1684327025.jpg	\N	\N	\N	0	\N	\N	\N	25236	\N	Solid Masonry Block 8” (400X200X200)	\N	1	500	8	Cement, Rock Powder	1	0
1	1	0	50200	0	0	0	12	121	\N	\N	0	100	100	0		\N	\N	\N	0	\N	\N	\N	12121	\N	2323	\N	1	50	\N	\N	0	0
34	34	0	500000	0	0	0	20	30	2	15	0	30.5	50	0	6476ed0ec387e_1685515534.jpeg	\N	\N	\N	0	\N	\N	\N	65633	\N	Johnson is known for making marblethat are ideal for interior walls and have a modern appearance. They sell floor and wall ceramic tiles that last for a long	\N	2	20	5	Rock Powder	1	1
2	2	0	50000	0	0	0	2.5	10	\N	10	0	10	12	0	6464c4cdf3738_1684325581.jpg	\N	\N	\N	0	\N	\N	\N	\N	\N	Cube 100x100 60mm 80mm	\N	1	5000	10	Cement, Rock Powder	0	0
33	33	0	500000	0	0	0	15	30	2	10	0	25	40	0	6476ec496d9c2_1685515337.jpg,6476ec496e75b_1685515337.jpg,6476ec496ea29_1685515337.jpeg	\N	\N	\N	0	\N	\N	\N	555	\N	Johnson is known for making tiles that are ideal for interior walls and have a modern appearance. They sell floor and wall ceramic tiles that last for a long	\N	4	10	3	Cement, Rock Powder	0	0
7	7	0	50000	0	0	0	3.2	40	\N	20	0	130	150	0	6464cad164911_1684327121.jpg	\N	\N	\N	0	\N	\N	\N	54585	\N	Thermal Masonry Block 8” (400X200X200/ Insert 60mm)	\N	1	500	20	Cement, Rock Powder	0	0
16	16	0	50000	0	0	0	50	40	\N	40	0	300	350	0	64676288ca2ff_1684497032.png	\N	\N	\N	0	\N	\N	\N	55	\N	Square 400X400 60 mm	\N	1	25	6	Cement, Rock Powder	1	0
10	10	0	5000	0	0	0	50	200	\N	100	0	90	100	0	6464ccf61dcf1_1684327670.jpg	\N	\N	\N	0	\N	\N	\N	8558	\N	Rectanguler 200x100 60mm 80mm	\N	1	50	80	Cement, Rock Powder	1	1
4	4	0	50000	0	0	0	24	40	\N	20	0	100	120	0	6464c88b63d58_1684326539.jpg	\N	\N	\N	0	\N	\N	\N	1202	\N	Hollow Masonry Block 6” (400X150X200)	\N	1	500	15	Cement, Rock Powder	0	0
14	14	0	50000	0	0	0	50	300	\N	200	0	500	550	0	6475bfd7b0623_1685438423.png,6475bfff92eda_1685438463.png,6475c01bd8881_1685438491.png	\N	\N	\N	0	\N	\N	\N	453	\N	Rectangular 300X200 60mm	\N	4	20	6	Cement, Rock Powder	1	1
9	9	0	50000	0	0	0	60	80	\N	60	0	115	125	0	6464cc1664081_1684327446.jpg	\N	\N	\N	0	\N	\N	\N	24574	\N	Uni Paving Tiles 60mm X 80mm	\N	1	65	45	Cement, Rock Powder	1	1
3	3	0	50000	0	0	0	15	40	\N	20	0	100	100	0	6464c8240bd56_1684326436.jpg	\N	\N	\N	0	\N	\N	\N	1212	\N	Hollow Masonry Block 4” (400X100X200)	\N	1	500	10	Cement, Rock Powder	0	0
15	15	0	50000	0	0	0	50	200	\N	200	0	300	330	0	6467621f629ff_1684496927.png,646afb70b0ea8_1684732784.jpg,646afb70b1b4e_1684732784.jpg,646afb70b1c1c_1684732784.jpg,646afb8fedb96_1684732815.jpg	\N	\N	\N	0	\N	\N	\N	43634	\N	Square 200X200 60mm/80mm	\N	2	15	60	Cement, Rock Powder	1	1
8	8	0	50000	0	0	0	25	40	\N	20	0	120	130	0	6464cb369152e_1684327222.jpg	\N	\N	\N	0	\N	\N	\N	1523	\N	Solid Masonry Block 8” (400X200X200)	\N	2	500	20	Cement, Rock Powder	1	1
5	5	0	50000	0	0	0	3	40	\N	20	0	125	130	0	6464c95385a00_1684326739.jpg	\N	\N	\N	0	\N	\N	\N	02795	\N	Hollow Masonry Block 8” (400X200X200)	\N	1	500	20	Cement, Rock Powder	0	0
17	17	0	1000	1	0	0	\N	\N	\N	\N	0	100	100	0	\N	\N	\N	\N	0	\N	121212	\N	\N	test	hello	\N	0	\N	\N	\N	0	0
18	18	0	1000	1	0	0	\N	\N	\N	\N	0	100	100	0	\N	\N	\N	\N	0	\N	121212	\N	\N	test	hello	\N	0	\N	\N	\N	0	0
19	19	0	1000	1	0	0	\N	\N	\N	\N	0	100	100	0	\N	\N	\N	\N	0	\N	121212	\N	\N	test	hello	\N	0	\N	\N	\N	0	0
20	20	0	1000	1	0	0	\N	\N	\N	\N	0	100	100	0	\N	\N	\N	\N	0	\N	121212	\N	\N	test	hello	\N	0	\N	\N	\N	0	0
21	21	0	1000	1	0	0	\N	\N	\N	\N	0	100	100	0	\N	\N	\N	\N	0	\N	121212	\N	\N	test	hello	\N	0	\N	\N	\N	0	0
22	22	0	1000	1	0	0	\N	\N	\N	\N	0	100	100	0	\N	\N	\N	\N	0	\N	121212	\N	\N	test	hello	\N	0	\N	\N	\N	0	0
23	23	0	1000	1	0	0	\N	\N	\N	\N	0	100	100	0	\N	\N	\N	\N	0	\N	121212	\N	\N	test	hello	\N	0	\N	\N	\N	0	0
24	24	0	1000	1	0	0	\N	\N	\N	\N	0	100	100	0	\N	\N	\N	\N	0	\N	121212	\N	\N	test	hello	\N	0	\N	\N	\N	0	0
25	25	0	1000	1	0	0	\N	\N	\N	\N	0	100	100	0	\N	\N	\N	\N	0	\N	121212	\N	\N	test	hello	\N	0	\N	\N	\N	0	0
26	26	0	1000	1	0	0	\N	\N	\N	\N	0	100	100	0	\N	\N	\N	\N	0	\N	121212	\N	\N	test	hello	\N	0	\N	\N	\N	0	0
27	27	0	1000	1	0	0	\N	\N	\N	\N	0	100	100	0	\N	\N	\N	\N	0	\N	121212	\N	\N	test	hello	\N	0	\N	\N	\N	0	0
28	28	0	1000	1	0	0	\N	\N	\N	\N	0	100	100	0	\N	\N	\N	\N	0	\N	121212	\N	\N	test	hello	\N	0	\N	\N	\N	0	0
29	29	0	1000	1	0	0	\N	\N	\N	\N	0	100	100	0	\N	\N	\N	\N	0	\N	121212	\N	\N	test	hello	\N	0	\N	\N	\N	0	0
30	30	0	1000	1	0	0	\N	\N	\N	\N	0	100	100	0	\N	\N	\N	\N	0	\N	121212	\N	\N	test	hello	\N	0	\N	\N	\N	0	0
31	31	0	1000	1	0	0	\N	\N	\N	\N	0	100	100	0	\N	\N	\N	\N	0	\N	121212	\N	\N	test	hello	\N	0	\N	\N	\N	0	0
32	32	0	1000	1	0	0	\N	\N	\N	\N	0	100	100	0	\N	\N	\N	\N	0	\N	121212	\N	\N	test	hello	\N	0	\N	\N	\N	0	0
13	13	0	50000	0	0	0	50	400	\N	200	0	200	250	0	64676104e052e_1684496644.png	\N	\N	\N	0	\N	\N	\N	6546	\N	Rectanguler 400X200 60mm	\N	2	30	60	Cement, Rock Powder	1	1
12	12	0	50000	0	0	0	50	250	\N	200	0	100	150	0	6467608734d58_1684496519.png	\N	\N	\N	0	\N	\N	\N	5858	\N	LaPlaza 60mm	\N	1	200	60	Cement, Rock Powder	1	1
11	11	0	5000	0	0	0	50	400	\N	300	0	130	150	0	6464d16c3bb4d_1684328812.jpg	\N	\N	\N	0	\N	\N	\N	5465	\N	Rectanguler400x300 60mm	\N	1	50	60	Cement, Rock Powder	1	1
\.


--
-- Data for Name: product_selected_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_selected_attributes (product_selected_attributes_id, attribute_id, attribute_values_id, product_id) FROM stdin;
\.


--
-- Data for Name: product_specifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_specifications (prod_spec_id, product_id, spec_title, spec_descp, lang, spec_title_arabic, spec_descp_arabic) FROM stdin;
1	17			1	\N	\N
2	18			1	\N	\N
3	19			1	\N	\N
4	20			1	\N	\N
5	21			1	\N	\N
6	22			1	\N	\N
7	23			1	\N	\N
8	24			1	\N	\N
9	25			1	\N	\N
10	26			1	\N	\N
11	27			1	\N	\N
12	28			1	\N	\N
13	29			1	\N	\N
14	30			1	\N	\N
15	31			1	\N	\N
16	32			1	\N	\N
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
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, product_type, name, active, deleted, created_by, updated_by, company_id, store_id, description, featured, meta_title, meta_description, meta_keywords, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: profile_bios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile_bios (id, value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: provider_package_subscription_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provider_package_subscription_histories (id, invoice_id, user_id, package_id, no_of_days, package_ending_date, grand_total, tax, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: provider_packages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provider_packages (id, package_name, no_of_days, price, created_at, updated_at, deleted_at, description) FROM stdin;
\.


--
-- Data for Name: public_business_infos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.public_business_infos (id, title, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: reservation_bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservation_bookings (id, booking_id, user_id, reservation_product_id, activity_type_id, booking_price, service_charges, tax_charges, total_amount, start_date_time, end_date_time, status, is_paid, user_code, vendor_code, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: reservation_product_contents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservation_product_contents (id, reservation_product_id, content_type, content, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: reservation_product_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservation_product_ratings (id, reservation_product_id, ratings, review, user_id, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: reservation_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservation_products (id, name, address, primary_image, cover_image, price_type, price, description, currency, account_type_id, activity_type_id, vendor_id, latitude, longitude, status, facilities, created_at, updated_at, service_charges, tax_charges) FROM stdin;
\.


--
-- Data for Name: service_request_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_request_images (id, service_request_id, image, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: service_request_status_descriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_request_status_descriptions (id, service_request_id, status, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: service_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_requests (id, user_id, store_id, description, status, is_completed, accept_note, amount, service_charges, tax, total_amount, address, latitude, longitude, payment_method, payment_status, created_at, updated_at, service_date, service_time, location_name, service_invoice_id, complete_note, completed_on, rating, review, payment_note) FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, admin_commission, shipping_charge, created_at, updated_at, tax_percentage, moda_commission) FROM stdin;
1	0	7	\N	\N	5	0
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
1	Dubai	1	1	1	\N	0	2023-05-09 14:24:37	2023-05-09 14:24:37
2	Ajman	1	1	1	\N	0	2023-05-27 13:28:18	2023-05-27 13:28:18
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
1	Mart	645b41cf43a76_1683702223.jpg	1	0	2023-05-10 07:03:43	2023-05-10 07:03:43
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stores (id, vendor_id, industry_type, store_name, business_email, dial_code, mobile, description, location, latitude, longitude, address_line1, address_line2, country_id, state_id, city_id, zip, logo, cover_image, license_number, license_doc, vat_cert_number, vat_cert_doc, active, verified, deleted, created_uid, updated_uid, created_at, updated_at, commission, ret_policy_title, ret_policy_description, ret_policy_doc, sort_order) FROM stdin;
\.


--
-- Data for Name: stories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stories (id, user_id, caption, path, status, is_blocked, created_at, updated_at, is_live, live_url, channel_id, zoom, width, height, channel_key) FROM stdin;
\.


--
-- Data for Name: story_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.story_likes (id, story_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: story_mentions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.story_mentions (id, user_id, story_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: story_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.story_reports (id, user_id, story_id, reason, problem_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: story_views; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.story_views (id, user_id, story_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: temp_order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_order_products (id, order_id, product_id, product_attribute_id, product_type, quantity, price, discount, total, vendor_id, admin_commission, vendor_commission, shipping_charge, influencer_id, influencer_qty) FROM stdin;
72	59	34	34	1	21	30.5	0	640.5	1	0	0	0	0	0
169	130	34	34	1	20	30.5	0	610	1	0	0	0	0	0
77	63	33	33	1	15	25	0	375	1	0	0	0	0	0
78	63	34	34	1	25	30.5	0	762.5	1	0	0	0	0	0
16	15	10	10	1	13	90	0	1170	3	0	0	0	0	0
21	20	1	1	1	22	100	0	2200	1	0	0	0	0	0
92	76	33	33	1	12	25	0	300	1	0	0	0	0	0
191	146	9	9	1	81	115	0	9315	1	0	0	0	0	0
39	35	16	16	1	1	300	0	300	1	0	0	0	0	0
40	36	15	15	1	1	300	0	300	1	0	0	0	0	0
42	38	15	15	1	2	300	0	600	1	0	0	0	0	0
43	38	8	8	1	3	120	0	360	1	0	0	0	0	0
194	149	10	10	1	56	90	0	5040	1	0	0	0	0	0
195	149	13	13	1	30	200	0	6000	1	0	0	0	0	0
48	41	1	1	1	48	100	0	4800	1	0	0	0	0	0
49	41	2	2	1	4999	10	0	49990	1	0	0	0	0	0
198	151	14	14	1	21	500	0	10500	1	0	0	0	0	0
199	151	11	11	1	50	130	0	6500	1	0	0	0	0	0
200	152	14	14	1	20	500	1000	10000	1	0	0	0	0	0
201	153	16	16	1	26	300	0	7800	1	0	0	0	0	0
202	154	8	8	1	900	120	0	108000	1	0	0	0	0	0
120	95	13	13	1	13	\N	0	0	3	0	0	0	0	0
121	95	12	12	1	13	100	0	1300	3	0	0	0	0	0
123	96	13	13	1	13	\N	0	0	3	0	0	0	0	0
129	100	33	33	1	11	25	0	275	1	0	0	0	0	0
132	103	33	33	1	11	25	0	275	1	0	0	0	0	0
133	104	33	33	1	11	25	0	275	1	0	0	0	0	0
135	106	33	33	1	11	25	0	275	1	0	0	0	0	0
142	113	33	33	1	15	25	0	375	1	0	0	0	0	0
155	118	34	34	1	33	30.5	0	1006.5	1	0	0	0	0	0
205	156	14	14	1	20	500	0	10000	1	0	0	0	0	0
206	157	10	10	1	50	90	0	4500	1	0	0	0	0	0
207	157	4	4	1	500	100	0	50000	1	0	0	0	0	0
208	157	9	9	1	65	115	0	7475	1	0	0	0	0	0
209	158	14	14	1	21	500	0	10500	1	0	0	0	0	0
210	158	11	11	1	555	130	0	72150	1	0	0	0	0	0
211	159	16	16	1	26	300	0	7800	1	0	0	0	0	0
212	159	14	14	1	21	500	0	10500	1	0	0	0	0	0
213	160	14	14	1	20	500	0	10000	1	0	0	0	0	0
214	161	16	16	1	26	300	0	7800	1	0	0	0	0	0
215	162	14	14	1	21	500	0	10500	1	0	0	0	0	0
216	163	14	14	1	21	500	0	10500	1	0	0	0	0	0
217	164	11	11	1	55	130	0	7150	1	0	0	0	0	0
218	165	16	16	1	25	300	0	7500	1	0	0	0	0	0
219	165	9	9	1	69	115	0	7935	1	0	0	0	0	0
220	166	16	16	1	27	300	0	8100	1	0	0	0	0	0
221	166	16	16	1	331	300	0	99300	1	0	0	0	0	0
222	166	14	14	1	21	500	0	10500	1	0	0	0	0	0
223	166	15	15	1	161	300	0	48300	1	0	0	0	0	0
224	167	16	16	1	26	300	0	7800	1	0	0	0	0	0
225	168	16	16	1	26	300	0	7800	1	0	0	0	0	0
226	169	11	11	1	51	130	0	6630	1	0	0	0	0	0
227	170	6	6	1	500	130	0	65000	1	0	0	0	0	0
228	171	11	11	1	51	130	0	6630	1	0	0	0	0	0
229	172	16	16	1	25	300	0	7500	1	0	0	0	0	0
230	173	16	16	1	25	300	0	7500	3	0	0	0	0	0
231	174	16	16	1	25	300	0	7500	3	0	0	0	0	0
232	175	16	16	1	25	300	0	7500	3	0	0	0	0	0
233	176	16	16	1	55	300	0	16500	1	0	0	0	0	0
234	176	14	14	1	20	500	0	10000	1	0	0	0	0	0
235	177	16	16	1	55	300	0	16500	1	0	0	0	0	0
236	177	15	15	1	15	300	0	4500	1	0	0	0	0	0
237	178	16	16	1	25	300	0	7500	3	0	0	0	0	0
238	179	16	16	1	25	300	0	7500	1	0	0	0	0	0
239	179	14	14	1	20	500	0	10000	1	0	0	0	0	0
240	180	12	12	1	200	100	0	20000	1	0	0	0	0	0
241	181	16	16	1	25	300	0	7500	1	0	0	0	0	0
242	182	10	10	1	50	90	0	4500	1	0	0	0	0	0
243	182	14	14	1	20	500	0	10000	1	0	0	0	0	0
244	182	15	15	1	15	300	0	4500	1	0	0	0	0	0
245	182	13	13	1	30	200	0	6000	1	0	0	0	0	0
246	183	9	9	1	65	115	0	7475	1	0	0	0	0	0
247	184	11	11	1	50	130	0	6500	1	0	0	0	0	0
248	185	10	10	1	200	90	0	18000	1	0	0	0	0	0
249	185	12	12	1	2000	100	0	200000	1	0	0	0	0	0
250	186	11	11	1	50	130	0	6500	1	0	0	0	0	0
251	187	16	16	1	25	300	0	7500	1	0	0	0	0	0
252	187	9	9	1	65	115	0	7475	1	0	0	0	0	0
253	188	11	11	1	50	130	0	6500	1	0	0	0	0	0
254	189	10	10	1	50	90	0	4500	1	0	0	0	0	0
255	189	9	9	1	66	115	0	7590	1	0	0	0	0	0
256	190	16	16	1	26	300	0	7800	1	0	0	0	0	0
257	190	10	10	1	50	90	0	4500	1	0	0	0	0	0
258	190	11	11	1	50	130	0	6500	1	0	0	0	0	0
260	192	16	16	1	25	300	0	7500	1	0	0	0	0	0
261	193	10	10	1	50	90	450	4500	1	0	0	0	0	0
262	193	9	9	1	134	115	1541	15410	1	0	0	0	0	0
263	193	15	15	1	30	300	900	9000	1	0	0	0	0	0
264	193	13	13	1	30	200	0	6000	1	0	0	0	0	0
266	195	16	16	1	25	300	0	7500	1	0	0	0	0	0
267	196	6	6	1	501	130	0	65130	1	0	0	0	0	0
268	196	16	16	1	25	300	0	7500	1	0	0	0	0	0
269	197	16	16	1	26	300	0	7800	1	0	0	0	0	0
\.


--
-- Data for Name: temp_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_orders (id, invoice_id, user_id, address_id, total, vat, discount, grand_total, payment_mode, admin_commission, vendor_commission, shipping_charge, temp_id, coupon_code, coupon_id, store_id, request_deligate) FROM stdin;
59	\N	47	7	990.5	49.525	0	1047.025	2	0	0	7	BM-471685535846	\N	0	1	0
169	\N	141	67	6630	331.5	0	6968.5	3	0	0	7	BM-1411686180986	\N	0	1	0
133	\N	39	19	10000	500	0	10507	2	0	0	7	BM-391685942108	\N	0	1	0
195	\N	147	91	7500	375	0	7882	2	0	0	7	BM-1471686571483	\N	0	1	0
\.


--
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.units (id, name, active, created_at, updated_at) FROM stdin;
1	PCs	1	2023-05-10 11:19:35	2023-05-31 12:31:59
2	Sq.ft	1	2023-05-10 11:19:45	2023-06-01 05:43:32
4	Sq.m	1	2023-05-31 12:34:05	2023-06-01 05:43:40
\.


--
-- Data for Name: user_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_address (id, user_id, full_name, dial_code, phone, address, country_id, state_id, city_id, address_type, status, is_default, created_at, updated_at, land_mark, building_name, latitude, longitude, flat_no, postcode) FROM stdin;
2	39	Mohammed Irfan	91	9633049957	a1	98	0	0		0	0	2023-05-24 07:19:43	2023-06-08 13:21:50	asdad	b1	55.2555	25.2255	f1	673638
3	39	Sooraj sabu	91	9633049957	Unnamed Road - International City - England Cluster - Dubai - United Arab Emirates,	91	0	0		1	0	2023-05-24 07:50:46	2023-06-08 13:21:50	Home	b2	25.173683125171156	55.40494356304407	f2.0	673637
1	134	Sooraj sabu	91	9633049957	Olavattor Post, Aroor 673638	98	0	0		1	0	2023-05-20 05:59:15	2023-06-08 13:32:54	\N	b2	12121	12121	f2	0
4	134	Sooraj sabu	91	9633049957	Olavattor Post, Aroor 673638	98	0	0	Work address	1	0	2023-05-24 11:36:38	2023-06-08 13:32:54	\N	b2	12121	12121	f2	0
20	47	nick.name	92	349499118	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	92	0	0		0	0	2023-06-01 20:13:45	2023-06-07 20:23:31	Work	building	33.5163963662396	73.11081513762474	flat no	post code
7	47	hun	91	147852369	street 7	91	0	0		0	0	2023-05-25 00:44:42	2023-06-07 20:23:31	land H	building 7	33.5668109	73.1368036	f7.2	12345
15	59	devTest1	93	1234567890	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	93	0	0		1	1	2023-05-31 21:50:40	2023-05-31 22:03:49	Work	B10	33.5164189	73.1108478	F10	4575
6	39	Hunain	91	1470852369	S 999	91	0	0		1	0	2023-05-24 12:40:16	2023-06-08 13:21:50	land H	B 99	33.5668232	73.1367825	flat 9.0	4575
5	39	Hunain	91	1470852369	S 999, H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,, H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	91	0	0		1	0	2023-05-24 12:16:56	2023-06-08 13:21:50	land H	B 99	33.5668232	73.1367825	flat 9.2	4575
17	63	name	+92	461616161	cit test	0	0	0		1	1	2023-05-31 23:01:33	2023-05-31 23:01:33	emirate	building	33.516083323100254	73.11078494716119	test	4423424
19	39	Dev	358	0987456321	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	358	0	0		1	0	2023-06-01 15:46:12	2023-06-08 13:21:50	Home	Building 9	33.5164301	73.1108965	Flat 9	0
16	36	nik	+971	885655	test	0	0	0		0	0	2023-05-31 22:17:13	2023-06-08 19:10:49	land mark	trst	33.516075751248586	73.11080635450266	test	4423424
14	36	nick name test	+971	546161619	streer@test	0	0	0		0	0	2023-05-31 19:59:16	2023-06-08 19:10:49	land test	building twst	33.51606314146476	73.1107986470934	test apartment	4423424
11	36	nickname	+971	84846646463	streer	0	0	0		0	0	2023-05-31 19:10:59	2023-06-08 19:10:49	landmark	builsing	33.51609191545986	73.11078624151509	apartment	4423424
13	36	nickname	+971	6464645151	sttreet name	0	0	0		0	0	2023-05-31 19:55:49	2023-06-08 19:10:49	land mark	building no	33.516074452887665	73.11082298324635	apartment no	4423424
9	60	N Biswas	91	9638520852	Regent Estate	91	0	0		0	0	2023-05-31 12:14:59	2023-06-09 04:38:04	\N	TDW Apartment	22.4898294	88.3703208	53/B	700032
10	49	home	92	99846161	street	92	0	0		1	0	2023-05-31 16:22:33	2023-05-31 21:56:48	\N	building	33.5164099	73.1109602	flat	post128
12	49	nickname	91	486161819	street	91	0	0		1	1	2023-05-31 19:46:37	2023-05-31 21:56:48	landmark	building	33.5164115	73.1108067	flat	1233
8	57	Nemai	91	98563998	Regent Estate	91	0	0		0	0	2023-05-31 09:55:21	2023-06-05 12:52:30	\N	building	22.4898316	88.370323	52/B	700032
18	57	Amila	971	65528888	57M6+W4R - Business Bay - Dubai - United Arab Emirates,	971	0	0		0	0	2023-06-01 05:14:52	2023-06-05 12:52:30	Work	Hog	25.184848320935696	55.26009891182184	54/D	434566
32	57	nb	971	85666655	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	971	0	0		0	0	2023-06-03 08:41:44	2023-06-05 12:52:30	Home	Gg	22.4898368	88.3703196	52	986545
34	57	Guri Raheman	971	695588896	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	971	0	0		0	0	2023-06-03 08:56:06	2023-06-05 12:52:30	Work	AUR Apartment	22.4898349	88.3703225	12/F	976556
37	57	Near Bose club	+1684	9832831811	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India	0	0	0		0	0	2023-06-04 16:25:29	2023-06-06 09:40:51	\N	Tre Apartment	22.489846307768204	88.37032219614326	52/G	700032
41	39	HunainDev	971	14523658078	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	971	0	0		1	1	2023-06-05 06:02:32	2023-06-08 13:21:50	Tehzeeb Bakers	Building 44	33.5668111	73.1368111	Flat 44	0
22	66	nick	+92	6461661616	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	0	0	0		1	1	2023-06-01 22:33:40	2023-06-01 22:33:40	\N	buolsin	33.51607814008135	73.11080926650321	flat@	poat
23	67	yesto	+92	348161613	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	0	0	0		1	1	2023-06-02 15:59:51	2023-06-02 15:59:51	\N	bukldong	33.51608726746504	73.11080930001648	flat	post
25	70	nick name	+92	461611896	G466+M3 Islamabad, Pakistan	0	0	0		1	1	2023-06-02 17:23:09	2023-06-02 17:23:09	\N	building	33.511626630734774	73.11020292341708	flat	post
26	71	nick	92	996616148	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	92	0	0		1	1	2023-06-02 19:14:38	2023-06-02 19:14:38	Home	Buildings	33.516436338883224	73.11085972934961	flat	Post
27	72	test	+92	3335451815	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	0	0	0		1	1	2023-06-02 21:52:50	2023-06-02 21:52:50	\N	buildingp	33.51608310093434	73.11082989251844	flat	post
38	81	nick	+92	3232333	1800 Ellis St, San Francisco, CA 94115, USA	0	0	0		1	1	2023-06-04 19:08:36	2023-06-04 19:08:36	\N	buildint	37.785834	-122.406417	flat	post
39	82	bsbjd	+971	845464	7HVFRPRG+VP	0	0	0		1	1	2023-06-05 01:30:26	2023-06-05 01:30:26	\N	gdh	25.28708984835137	55.37121884847206	yeys	637383
40	82	cvghh	971	5566866	801, 8th Floor, Al Manara Building, Al Abraj Street - الخليج التجاري - دبي - United Arab Emirates,	971	0	0		1	0	2023-06-05 04:41:08	2023-06-05 04:41:08	Home	fhhui	25.184263	55.2599335	fghhhh	46657
24	69	nick	+92	3354851106	G3FJ+77 DHA Phase 4, Rawalpindi, Pakistan	0	0	0		0	0	2023-06-02 16:54:54	2023-06-02 22:51:31	\N	building	33.51610852327674	73.11077554128683	flat	poat
28	69	nick namep	+92	8849991163	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	0	0	0		0	0	2023-06-02 22:30:35	2023-06-02 22:51:31	\N	new buildinf	33.51603392312411	73.11082390079417	newflat	post
33	73	Biswas	+971	6852666	52, Ananda Pally, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India	0	0	0		0	0	2023-06-03 08:52:58	2023-06-03 11:13:58	\N	ATR	22.489871811142645	88.3703673352379	5U	9655788
29	69	njcj	+970	545161	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	0	0	0		0	0	2023-06-02 22:50:45	2023-06-02 22:51:31	\N	test	33.51605918421001	73.11081286090598	flat no	post
30	69	nivk	+970	45516161	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	0	0	0		0	0	2023-06-02 22:51:16	2023-06-02 22:51:33	\N	test 233	33.51607024227324	73.11083553646866	flat	11672
31	73	Nemai	+971	852963852	52/B, Ananda Pally, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India	0	0	0		0	0	2023-06-03 08:23:47	2023-06-03 11:13:58	\N	Dohu	22.489935639335297	88.37034923032705	52	9764467
35	73	BIswad	+971	852963147	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India	0	0	0		1	0	2023-06-03 10:37:55	2023-06-03 11:13:58	\N	ATR	22.489846426867274	88.37032016534776	53	96444456
52	135	Office	+971	985255566	52, Ananda Pally, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India	0	0	0		1	1	2023-06-07 05:31:32	2023-06-07 05:31:32	\N	AvR Apartment	22.489880210031817	88.37036740781313	52/F	Near BS
36	73	Nemai Biswas	+971	8525666	52, Ananda Pally, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India	0	0	0		1	1	2023-06-03 11:13:58	2023-06-03 11:13:58	\N	South Block	22.489830614088557	88.37037529804591	56	245677
43	94	Hu	376	963288966	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	376	0	0		1	1	2023-06-05 12:58:56	2023-06-05 12:58:56	Near FS	Building	22.4898343	88.3703187	53/G	0
44	104	nicknam3	92	33648181	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	92	0	0		1	1	2023-06-05 22:36:44	2023-06-05 22:36:44	lamdmaek	building	33.5164061	73.1108041	flat	0
45	103	nickname	+92	331188118	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	0	0	0		1	1	2023-06-05 22:46:32	2023-06-05 22:46:32	\N	building	33.516143392087606	73.11077624559402	flat	landmark
46	106	nick	+92	54616118	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	0	0	0		1	1	2023-06-05 23:40:16	2023-06-05 23:40:16	\N	build	33.51604506135336	73.11066291678468	flat	lando
42	64	Dolu	355	9856669855	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	355	0	0		1	1	2023-06-05 12:48:32	2023-06-05 12:48:58	Near FS	Building 5A	22.489836	88.3703263	53/G	0
47	125	nicknamep	+92	64681815	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan	0	0	0		1	1	2023-06-06 08:02:32	2023-06-06 08:02:32	\N	bulding	33.56681315216926	73.13668596513664	flat no	landmark
49	123	Office	971	662387442	52, Ananda Pally, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	971	0	0		1	1	2023-06-06 12:19:51	2023-06-06 12:19:51	Near BC club	Ayt Apartment	22.4898459	88.3703831	59/S	0
48	126	myhome	+971	5454664493	6 7th St - Za'abeel - Za'abeel 2 - Dubai - United Arab Emirates	0	0	0		0	0	2023-06-06 09:12:45	2023-06-08 03:09:15	\N	gshsh	25.217717171922686	55.29034249484539	5373	hshsjs
50	132	ncik	+92	3161815	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	0	0	0		1	1	2023-06-06 16:40:55	2023-06-06 16:41:17	\N	building	33.51610309191834	73.11083889753431	flat	lamdnark
53	83	Office	971	962588666	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	971	0	0		1	1	2023-06-07 05:32:44	2023-06-07 05:32:44	Near BS	Avs Apartment	22.4898356	88.3703212	52/G	0
59	124	nicknameo	+92	64619181	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan	0	0	0		0	0	2023-06-07 09:09:48	2023-06-08 10:25:05	\N	bhldog	33.56681315216926	73.13668596513664	flatp	landamek
57	89	Test Dev	971	0874596321	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	971	0	0		1	1	2023-06-07 09:02:48	2023-06-07 09:02:48	Bakery	Building 22	33.5667962	73.1368032	flat 22	0
58	139	nckkname	+92	616118116	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan	0	0	0		1	1	2023-06-07 09:04:01	2023-06-07 09:04:01	\N	building	33.56681317448965	73.13668604940176	flat	land
60	47	nickname	92	331815156	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	92	0	0		1	0	2023-06-07 20:02:29	2023-06-07 20:23:31	landmark	buildings	33.5164321	73.1107803	flat	0
61	47	nickname	92	61619161	Booking Office House 5B, Old Firing Range Drive, Main Islamabad, Korang Rd, Bani Gala, Islamabad, Islamabad Capital Territory, Pakistan,	92	0	0		1	1	2023-06-07 20:23:31	2023-06-07 20:23:31	land	bykdihr	33.715474114943525	73.17071255296469	flat	0
21	36	nick namw	+971	8461616163	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	0	0	0		0	0	2023-06-01 22:10:34	2023-06-08 19:10:49	\N	buoldinf	33.51605623139044	73.11082337267412	flat no	poat@xoeekl
51	36	nick	+92	616181818	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan	0	0	0		0	0	2023-06-07 01:40:01	2023-06-08 19:10:49	\N	bulding	33.56681315216926	73.13668596513664	flat	landmark
64	36	vv	+971	225	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	0	0	0		0	0	2023-06-07 21:14:47	2023-06-08 19:10:49	\N	vv	33.51603923154494	73.11080102369141	bb	vvv
63	36	vvf	+971	55222	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	0	0	0		0	0	2023-06-07 21:12:44	2023-06-08 19:10:49	\N	tr	33.51603923154494	73.11080102369141	hut	gg
56	105	nic	+92	6461981	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan	0	0	0		0	0	2023-06-07 06:36:03	2023-06-08 19:18:48	\N	bulding	33.56681315216926	73.13668596513664	flat	land
55	60	hhh	+971	8855	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India	0	0	0		0	0	2023-06-07 05:46:54	2023-06-09 04:38:04	\N	vvb	22.489875792546652	88.37032618009333	bbb	ggg
54	60	bhh	+971	8525445	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India	0	0	0		0	0	2023-06-07 05:46:36	2023-06-09 04:38:04	\N	hhg	22.489875792546652	88.37032618009333	ggg	bbb
83	145	vbh	+971	5552888	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India	0	0	0		1	1	2023-06-08 12:13:49	2023-06-09 03:59:01	\N	ggg	22.489846426867274	88.37032016534776	bb	hhh
67	141	nickname	+92	316186113	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	0	0	0		1	1	2023-06-07 22:48:16	2023-06-07 22:48:16	\N	bulsin	33.51603923154494	73.11080102369141	flat	land
68	142	nickname	+92	546616161	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	0	0	0		1	1	2023-06-07 23:39:42	2023-06-07 23:39:42	\N	bulidlnf	33.51603923154494	73.11080102369141	flat	landmark
69	126	Dubai Home	+971	54564846	29 5th St - Al Qusais - Al Qusais 2 - Dubai - United Arab Emirates	0	0	0		1	1	2023-06-08 03:09:15	2023-06-08 03:09:15	\N	Lootah	25.26828905722043	55.38481995463371	801	Near.Biriyaniwala
81	124	nick	+92	846691961	LabAddress Sky View Emaar Square Area Downtown - Dubai - United Arab Emirate	0	0	0		0	1	2023-06-08 10:25:05	2023-06-08 11:29:05	\N	buildin	33.56681317448965	73.13668604940176	flat	lag
84	134	Sooraj sabu	91	9633049957	Olavattor Post, Aroor 673638	98	0	0	Work address	1	1	2023-06-08 13:05:54	2023-06-08 13:32:54	\N	b2	12121	12121	f2	0
88	127	Dev11	971	1470852369	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	971	0	0	Others	1	1	2023-06-08 17:22:41	2023-06-08 17:26:35	Bakery	Building 11	33.5164008	73.1108299	Flat 11	0
62	36	bbv	+971	2555522	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	0	0	0		0	0	2023-06-07 21:10:53	2023-06-08 19:10:49	\N	cc	33.51603923154494	73.11080102369141	vvtt	vv
73	60	Other	244	852369855	52, Ananda Pally, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	244	0	0	Others	1	0	2023-06-08 05:10:45	2023-06-09 04:38:04	hhh	G76	22.48984524050959	88.37037756115977	78/G	0
77	116	Home	+971	524125412535	81- G Street No5, Rawalpindi, Punjab, Pakistan	0	0	0		1	1	2023-06-08 07:29:38	2023-06-08 07:29:38	\N	123	33.51880090405366	73.05306371737888	123	0
78	144	fhhh	+971	5536886	Souk Al Bahar - 57VG+WPH - Downtown Dubai - Dubai - United Arab Emirates	0	0	0		1	1	2023-06-08 08:48:17	2023-06-08 08:48:17	\N	ghhh	25.19471767441106	55.27687881141901	vhhh	ghhj
91	147	addresss	+971	505041860	57M6+P43 - Business Bay - Dubai - United Arab Emirates	0	0	0	Home	1	1	2023-06-12 11:13:33	2023-06-12 11:13:33	\N	cv	25.184074177969393	55.26036805997123	445	cvvv
74	120	Office	971	987123456	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	971	0	0		1	1	2023-06-08 05:15:01	2023-06-08 05:15:01	Near Golu	Apartment	22.4898367	88.3703201	59/G	0
66	36	nick	+92	555852363	G4R7+JP4, Islamabad, Punjab, Pakistan	0	0	0		1	0	2023-06-07 22:05:09	2023-06-08 19:10:49	\N	building	33.54164365700691	73.11380814760923	flat	land
85	39	Mohammed Irfan	91	9633049957	a1	98	0	0		1	0	2023-06-08 13:21:26	2023-06-08 13:21:50	asdad	b1	55.2555	25.2255	f1	0
79	124	nick	+92	848611613	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan	0	0	0		0	0	2023-06-08 10:13:42	2023-06-08 10:25:05	\N	building	33.56681315216926	73.13668596513664	flat	lamd
65	36	vvv	+971	88885	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	0	0	0		1	1	2023-06-07 21:23:23	2023-06-08 19:10:49	\N	vv	33.51603923154494	73.11080102369141	bb	gg
89	105	nicknamep	+92	61618161	LabAddress Sky View Emaar Square Area Downtown - Dubai - United Arab Emirate	0	0	0	Work	1	1	2023-06-08 19:18:48	2023-06-08 19:18:48	\N	building	33.516012851545256	73.11077121645211	flat	lamdmark
72	60	Office	971	852357	52, Ananda Pally, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	971	0	0	Work	1	0	2023-06-08 05:09:28	2023-06-09 04:38:04	bjj	AT Apartment	22.48984524050959	88.37037756115977	52/G	0
76	134	Mohammed Irfan	91	9633049957	a1	98	0	0		1	0	2023-06-08 07:25:21	2023-06-08 13:32:54	asdad	b1	55.2555	25.2255	f1	0
86	107	nick	+92	646461616	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	0	0	0		0	0	2023-06-08 15:44:07	2023-06-08 16:27:48	\N	tesho	33.516082734087085	73.1107983738184	testo	kamdo
87	107	nickname	+92	616161313	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	0	0	0	Others	1	1	2023-06-08 15:48:28	2023-06-08 16:27:48	\N	building	33.51603248569065	73.11072703781308	flat	landmaerk
82	127	hunakn	971	1470852369	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	971	0	0		0	0	2023-06-08 10:25:37	2023-06-08 17:26:35	Home	Building 10	33.5667983	73.1368005	Flat 10	0
75	127	dev	971	14593657280	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	971	0	0		0	0	2023-06-08 06:23:58	2023-06-08 17:26:35	Bakery	B66	33.5668061	73.136791	S66	0
80	127	Hunain	971	1478052399	118 Street 28, PWD Housing Society Sector C PWD Society, Islamabad, Islamabad Capital Territory, Pakistan,	971	0	0		0	0	2023-06-08 10:24:00	2023-06-08 17:26:35	home	Build 10	33.5692119	73.1443647	flat 10	0
90	145	hhh	+971	885266544	52, Ananda Pally, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India	0	0	0	Work	1	0	2023-06-09 03:57:58	2023-06-09 03:59:01	\N	hhh	22.48983979227253	88.37038091392104	hhh	bbb
71	60	Home	+244	9874265	52, Ananda Pally, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India	0	0	0		0	0	2023-06-08 05:08:10	2023-06-09 04:38:04	\N	building	22.48984524050959	88.37037756115977	Dolu	near bg
70	60	Office	+971	852963357	52, Ananda Pally, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India	0	0	0		0	0	2023-06-08 05:07:32	2023-06-09 04:38:04	\N	Apartment	22.489872942699574	88.37041628555242	52/B	Near BS
\.


--
-- Data for Name: user_favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_favorites (id, user_id, fav_user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_follows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_follows (id, user_id, follow_user_id, created_at, updated_at, request_accept_status) FROM stdin;
\.


--
-- Data for Name: user_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_locations (id, user_id, lattitude, longitude, created_at, updated_at, location_name) FROM stdin;
\.


--
-- Data for Name: user_privileges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_privileges (id, user_id, designation_id, privileges, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_profile_view_insights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_profile_view_insights (id, viewed_user_id, viewed_profile_user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_reports (id, user_id, reported_user_id, reason, created_at, updated_at, problem_id) FROM stdin;
\.


--
-- Data for Name: user_vehicle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_vehicle (id, vehicle_type, user_id, vehicle_front, vehicle_back, vehicle_registration, driving_license, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, dial_code, phone, phone_verified, password, email_verified_at, role, first_name, last_name, user_image, user_phone_otp, user_device_token, user_device_type, user_access_token, firebase_user_key, remember_token, created_at, updated_at, country_id, state_id, city_id, area, active, deleted, display_name, business_name, email_verified, user_email_otp, dob, vendor, store, previllege, about_me, verified, designation_id, is_private_profile, user_name, gender, website, wallet_amount, password_reset_code, password_reset_time, password_reset_otp, privacy_id, send_notification, mute_message, commission, public_business_info, facebook_url, instagram_url, linkedin_url, is_social, twitter_url, tiktok_url, user_type_id, activity_type_id, commercial_license, commercial_reg_no, associated_license, res_dial_code, res_phone, address, business_type_id, admin_commission_perc, residence_no, nationality, rating, rated_users, banner_image, hide_profile, active_package_id, pacakge_end_date, active_gym_package_id, gym_end_date) FROM stdin;
20	Ajay Kumar	ajay@13.com	971	9871161611	0	$2y$10$Qkjt0pYFGGSVNLZvVWfNT.H9VldHMHNbRh5M/LG/gqsCS4W1v8p/C	\N	2	Ajay	Kumar	\N	1111	fcm_token	android	d86f3d685a4711e4573dfbd93af0b046454706d665ad668ddfe9fcccf2e6a36e	-NVjGWb4jRR5l_9iCEyE	\N	2023-05-18 14:31:42	2023-05-18 14:31:43	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
3	subadmin	subadmin@gmail.com	\N	123455	0	$2y$10$gUXsOLSlBL9o6g2yyEwKmuAQCOEwyAvx7CuREeKlMIqh6VegdUfiK	\N	1	sub	admin	\N	\N	\N	\N	\N	\N	\N	2023-05-13 11:14:32	\N	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	1	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
1	Admin	admin@admin.com	971	112233445566778899	0	$2y$10$eXDN41X2tKT9s3P2d/W8aeBH4QgCw/8NPQ59FI4/iH5Ojk/I0Pxri	\N	1	\N	\N	\N	\N		android		-NVSzhczWFLI3vMt9P9p	\N	\N	2023-05-15 06:02:30	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
4	Sadiyaa	sadiya@gmail.com	\N	123455	0	$2y$10$x0fo58i.hbrzeO7uvrI/pOvE7KtbeCqJoV3cUHCkF6j0ZH8Zt5cQu	\N	1	Sadiya	Zehra	\N	\N	\N	\N	\N	\N	\N	2023-05-17 14:01:34	2023-05-17 14:01:45	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	1	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
5	anil	anil@gmail.com	\N	123455	0	$2y$10$AJHld/OCt/xmPbWM4Nc7SOgRNRMiUg1WiQUx0dPyxjF0pRoOkl9Fi	\N	1	anil	navis	\N	\N	\N	\N	\N	\N	\N	2023-05-17 14:03:15	\N	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	1	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
19	Ajay Sharma	ajay@12.com	971	9745454541	0	$2y$10$Y8ETn.1E5/YawCipRjl4BObVdwkZKuIfYvRtF2MCw5zQ0Oj4950Bm	\N	2	Ajay	Sharma	\N	1111	fcm_token	android	c2d9f52fbad61d371809e923c52d477b9aebe49e1a6b636f73c3c8244223da10	-NViqGhI7btupONlaDsM	\N	2023-05-18 12:32:39	2023-05-18 12:32:40	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
18	rusvin k	rusvinmerak2@gmail.com	91	9847823799	1	$2y$10$vN9bVLOMJIu4EtIkb4Wu4eQ8hBqsM8TOJeoDOWz1chY0I5Z12NCvC	\N	2	rusvin	k	\N		121212	android	5d0f15df7d4122310bc8ecec21463a841d9d0f280743e5b35d95cf716a1b8141	-NViShtquWdglPzIlvpS	\N	2023-05-18 10:45:21	2023-05-18 14:11:21	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
22	Ajay Kumar	ajay11@gmail.com	971	9748484848	0	$2y$10$KqtZRFZ3eA95WX/oZaC4JuF5NNgiaulXJtjo9ubIYmkBVglqhIaeS	\N	2	Ajay	Kumar	\N	1111	fcm_token	android	d0d7c8aecc2efaf641b39863d680dfe3fdf0b592fefd816268a5af88402045a3	-NVjHaHw7UyDNf9JTjfo	\N	2023-05-18 14:36:24	2023-05-18 14:36:24	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
32	nasar k	nasrullah1@gmail.com	92	7705053	0	$2y$10$iOfM1sx1dROr.mog29U9kuvU8jnr6pZcRc4NLLHBBR8f7RPSccoZG	\N	2	nasar	k	\N	1111	121212	ios	44e0da7245e20585e0ef1727e2cc93ae904de1b9f9156c112516bbf255823ab4	-NW6PwbaHeiT8Jt38poH	\N	2023-05-23 07:03:46	2023-05-23 07:03:46	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
23	Ajay Kumar	ajay14@gmail.com	971	948484848	0	$2y$10$tC7cjYW21CqvFTR1A4zdBOCiarcPMvwudH38wt.UvhU6xtYyAQsni	\N	2	Ajay	Kumar	\N	1111	fcm_token	android	b9e65406edf7144bbb365e6598a285e7dd661b57c4ce0961f822cd2f46466ed8	-NVjI8iwt-SHXBVRMaXp	\N	2023-05-18 14:38:49	2023-05-18 14:38:49	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
24	Ajay Kumar	ajay15@gmail.com	971	94848455454	1	$2y$10$kGxkMEz./y94MWfd39A.zOFN/D8LU3joz0W7Ew7BqF4.n7a7Wmsh.	\N	2	Ajay	Kumar	\N		fcm_token	android	2fa6109d00a4ea2628cf9f9c1fdbb08d6710d724ccd58349c6d5ebf011cae04e	-NVmblFd7SHFymnTtarf	\N	2023-05-19 06:07:45	2023-05-19 06:07:51	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
30	sadiya zeha	sadiyadxb@hotmail.com	971	523243163	1	$2y$10$VYo7tAnUGc68lrl46ME0lOFGwjZsq1YlzKafv.Wfki31IUY7/gH6W	\N	2	sadiya	zeha	\N		fcm_token	android	83dd43732b4aca99cc707d531e3cc4c1c3d713d864e11dd9847c5dbd4cfa4b81	-NW2TXAP0bhlOUF7Ym48	\N	2023-05-22 12:40:57	2023-05-22 12:41:04	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
34	nasar k	nasrullah11@gmail.com	92	77050555	0	$2y$10$wbE29FVjqD67LdQHD9PcJORxH5KiWtRlXrdx8mJTpSVAuFYwDuu72	\N	2	nasar	k	\N	1111	121212	ios	f4ecf26d3b5f2a41a5f286b025b3f07bb5074a0699dbe3a49c0afd1144e272d1	-NW6WYvHsBeTd2QKBr2T	\N	2023-05-23 07:32:39	2023-05-23 07:32:40	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
15	Rusvin	rusvinmerak@gmail.com	91	9847823799	1	$2y$10$2qv5ZlZ8auPqavttgGdzOO15KeX7USzoB6ts.37.ie15D3CVruRPa	\N	2	rusvin	k	1684913732646dbe4459287.jpg		e70Y-l9_R2moOmFEF0wMme:APA91bG1yF79c9nIXcDkwiNMeOJjk5xJDeJUMWTocHn40EmVUX29j2_AAXpWYRxRUZRl3lROsOw0CXcruc5wEvMhCx3M725lb64xN9xW8K9qf0fQihd2zqJazlb7RBkqfc4IRLx7LLlc	android	d985d45b617c8f1ca690c129414c5e73ac617e68a56edea7dbdd5506c67c91ba	-NVhjhwbw8CCqO15CMsF	\N	2023-05-18 07:24:23	2023-06-08 04:35:28	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	0	\N	0	28be6e9e8bcaad6037ddbfb7f25a1da8d3c6dde6389326c2e29da4513548c89e	2023-06-06 03:36:02	1111	999999	1	0	\N	0				1			\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
31	nasar k	nasrullah@gmail.com	92	3357705054	1	$2y$10$Vfe6YtK5oTuuOYb7k8.1ceQGr41phDF5tWN9DbG6GrsIeT/Kilu2q	\N	2	nasar	k	\N		121212	ios	f431ec0b1f247ab9554bd11289d8121a502c5557619946895b662f3f14e05a2c	-NW66HTFKxhUHOO1vqL3	\N	2023-05-23 05:37:52	2023-06-06 01:00:58	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
35	Ajay Kumar	ajay20@gmail.com	971	948545774	1	$2y$10$Xj9PkKDV1Pu7jEjNfk48LOJVC7JmoBk9wrxBR266cZM.5FxjpS9EK	\N	2	Ajay	Kumar	\N		fcm_token	android	0fac67e1bafbec770695abfba10b1c94dd8d70f29717d506ea63276daa2d2cf1	-NW7lHvL59NX0W44Il-9	\N	2023-05-23 13:21:01	2023-05-23 13:21:06	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
36	Test New	testuser@gmail.com	92	3313851811	1	$2y$10$GESM8o89hsqXfocYXu.qCOFIZrvo0Qc.KLi.24J/UEHsCdFxxi.4q	\N	2	Test	User	16861285116480477f1817e.jpg		507DE523-774B-423E-B6FA-379810BFD36E	\N	709|Wcl0WNJr2ZhqI5sk7GaczYSaCsydgg2HBLmx2Blz	-NW8SW-E_SehKmMHMbHH	\N	2023-05-23 16:34:13	2023-06-15 09:37:48	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	0	\N	0		2023-06-02 16:12:16	0	999999	1	0	\N	0				0			\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
37	test test	testuser123@gmail.com	92	3357705043	0	$2y$10$u2ul2qv8qSq7h/6NSN6wmuK43hMPcDrsg90JEA2Qct3fo8G3rDhYW	\N	2	test	test	\N	1111	cJRfR-gOBUmxsBlM1FWMef:APA91bE9SNww6En1NBafbs9_ihfZwTcwa0fYBpUocZZH6mhYAv04Ru5hEAXT9c0OIhZhvSESQJ2ag_YOqmCauAPdtBVnLR7Umk8Z9Tz2moaRPT2yrmhdDkAXmlRZQNqhpxUfQfn46X4F	iOS	6ebaf99bf99271ebd9b6b33d6caa3486599a325468635d6d23f337e45a299900	-NW98ICpie6sN4D5RsWV	\N	2023-05-23 19:45:31	2023-05-23 19:45:32	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
40	rusvin k	rusvinaroor@gmail.com	91	703452695	0	$2y$10$/2yJg5mlETaOBX8Teut7fOOYIq8GC58B3eEw9Ym2lDhhq5oAaqUr6	\N	2	rusvin	k	\N	1111	121212	android	d4ceee49cdc267481fa0513bd97de02a7a726519d16080466054d7a52306f3e4	-NWBgOzRnl_BaguuMDU8	\N	2023-05-24 07:38:08	2023-05-24 07:38:09	0	0	0	0	0	1	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
38	test user	test12345@gmail.com	92	33318890908	0	$2y$10$hfQrizc9jJ.WwnS8k/7XHuWL4Wm1T8jIrwJp6M97TozubX2ZwtV7K	\N	2	test	user	\N	1111	cJRfR-gOBUmxsBlM1FWMef:APA91bE9SNww6En1NBafbs9_ihfZwTcwa0fYBpUocZZH6mhYAv04Ru5hEAXT9c0OIhZhvSESQJ2ag_YOqmCauAPdtBVnLR7Umk8Z9Tz2moaRPT2yrmhdDkAXmlRZQNqhpxUfQfn46X4F	iOS	f9ae4ab2fca8859a9559667242cfa24638c02c3d09e1074ac930d446c1d62e63	-NW99--vq8QP3q-nodaj	\N	2023-05-23 19:48:35	2023-05-23 19:48:35	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
50	test user	testuser231@gmail.com	+92	335880810	1	$2y$10$LLcV.GMakddudaPAEKZmV.qe0iMUwoAwG99O/zav7tqWnyHdvXbbW	\N	2	test	user	\N		eo_aiC4ttENVolfLtFE-rO:APA91bEfnP__E0bVW8-odIqIJ4tQW_yvs0jbSwRYhMtqtfSM-yA2OXFQMup4WJ6m29JztHnOH4lrYA6bxOG_WzBPU1LIu5-fMX3AAei7tGluoLdDmFynKVmia2R5-ww1YddrfZt6jwKl	iOS	118|uKLgbRHhfgNwpeYWLJkBByj82L898ahAwV0mKjBr	-NWc8Z8_UfQWvmh6SIE6	\N	2023-05-29 15:35:17	2023-05-29 15:36:00	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
49	test user	testuser1234@gmail.com	+92	558051213	1	$2y$10$GLCl8xiXCLUKF4oRcsqxIO8QpSxEOB8KSy.gjsfOh7yYyZYu2d.hy	\N	2	test	user	\N		eOGzzXmIQ5aqiAfCiD5_x_:APA91bGoepC_ipdyy4BEh8wdfh09niihB7K95ruhs9lhCfcViUyrsBwI_vQbRtWPf30P0uRqwidVT_cr73LNf0lLGNWp2yl_knMCKjkYHlgqHTA51zTtoJODQmuEyirGlMrq9Rv-l2o1	android	185|jnqSbckLxe4WGw6PNvQi3ACvRiCRe0SYPda73J0z	-NWc7Jmf2SZvzXs20rky	\N	2023-05-29 15:29:52	2023-05-31 16:19:28	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
41	faisal khan	faisal@gmail.com	92	33455787	0	$2y$10$lOjgb1zzvQwduKjXF2SByuMaZL8Jd3Mw.C1dr8Q.J5DQ2wz.3T1Ee	\N	2	faisal	khan	\N	1111	fg9ywEWqEUsdp9PxO_c0TY:APA91bHLbF3s6Of6EIqs9cm_5E8Sj0IUTnNga6Yc6uNXJzSUOeqsVbIH_c97k2cHjJztY4F5opcTR3SrvGef2DyEYJDbi5SEo-UTV1ez_rJtgmzaJu98WnBenWG7NIjAM5dtB-datJ_R	iOS	da820a8db7cb5223df16c85ff0014d3672ffe78ce64645a337e60d984c439e06	-NWBi7SizcQpaK2NxZGD	\N	2023-05-24 07:45:41	2023-05-24 07:45:41	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
46	sadiya zehra	sahlanissar41@gmail.com	971	564005096	1	$2y$10$hjF8IpJzak1oIbzOk4QkpeKEs3jmcY50oi2ct7DP0bW3KT/wyBC5O	\N	2	sadiya	zehra	\N		fcm_token	android	88|AovRe2eMCliOCQAnbiGsKpiNBko3Ch6t9zAyBhxa	-NWCsiWYIoYMZ2dJ7h-g	\N	2023-05-24 13:11:35	2023-05-24 13:59:48	0	0	0	0	0	1	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
45	rusvin k	rusvinaroor124@gmail.com	91	70345269521	0	$2y$10$cc9KSzMNtCpJ4yqSXR9k3uFbPkUzZ5LbZrE1Cm6VIFqJKx0P.6k42	\N	2	rusvin	k	\N	1111	121212	android	62649fdb11922e5da0e67f9d5f36a39740e25effa66ed18594f42802b6f332c3	-NWCUrrd3l8ZrvCqzujg	\N	2023-05-24 11:23:00	2023-05-24 11:23:01	0	0	0	0	0	1	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
44	nasar test	nasar123@gmail.com	+92	334224557	1	$2y$10$WTWbUBerSgoFoMbgZ6TreuQgMd4eEQNRigW1f8e8z//6R1NDjaP3S	\N	2	nasar	test	\N		fg9ywEWqEUsdp9PxO_c0TY:APA91bHLbF3s6Of6EIqs9cm_5E8Sj0IUTnNga6Yc6uNXJzSUOeqsVbIH_c97k2cHjJztY4F5opcTR3SrvGef2DyEYJDbi5SEo-UTV1ez_rJtgmzaJu98WnBenWG7NIjAM5dtB-datJ_R	iOS	70|73Kw73rCOhy4DbUydR3sWNsZYeY2UzgJtDyaBQH3	-NWBjf4IBpgTFaIZfw1w	\N	2023-05-24 07:52:25	2023-05-24 07:52:35	0	0	0	0	0	1	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
48	rusvin	rusvinaroork@gmail.com	971	7034526952	0	$2y$10$lAqwj1/Q6IHgSkfgHKSXf.3d.JSiIW2JvLgnynwB7pXJ.PQx.DQsy	\N	2	\N	k	64749c127fea3_1685363730.png	\N	\N	\N	\N	\N	\N	2023-05-29 12:35:30	\N	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	rusvin	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
42	test test	nas@gmail.com	92	3345509087	0	$2y$10$QsxvAwiW6TIngHnQEa1maOzR1rBWTMK4tLKTwXKj9/cy0zAhiR01q	\N	2	test	test	\N	1111	fg9ywEWqEUsdp9PxO_c0TY:APA91bHLbF3s6Of6EIqs9cm_5E8Sj0IUTnNga6Yc6uNXJzSUOeqsVbIH_c97k2cHjJztY4F5opcTR3SrvGef2DyEYJDbi5SEo-UTV1ez_rJtgmzaJu98WnBenWG7NIjAM5dtB-datJ_R	iOS	e279b08112d47e7933a4aa5021fae4ba358d204bf2452ae679b26e642994e1ea	-NWBiZITXW7MvJ0fkIXf	\N	2023-05-24 07:47:35	2023-05-24 07:47:35	0	0	0	0	0	1	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
39	hunain dev	hunain88@gmail.com	971	1470852369	1	$2y$10$76UY5oaLvbTnfwN/5Ym5/OrHchW1bD3oJQ13AjAjw/.b97mU/a0tC	\N	2	hunain	dev	16855292136477227d498d5.jpg		c46TQX8ySgSJa-yEiPZjXw:APA91bFQpC_0iKgG55H5LNYRxbmEYdjcoTfbDkpriT7oxc8BObwCCEW2gmam4lqFXxRtV_TdxbMIzEljVRiQq7yAeCPzbYu1WrYVmicVG-AqeteoXE7IRED4RD2z9MsD93jnURaz4IKT	android	708|78q40bReWn1LuL7HwZL6byPcgHf7Oou1dkw5TtKA	-NWBRD_MZJesPFSiP4kF	\N	2023-05-24 06:27:27	2023-06-15 08:59:55	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	0	\N	0	0db6edf51b62ada3985b1818450b14e85476408330e11f405766310076ea6cda	2023-06-06 12:21:12	1111	999999	1	0	\N	0				0			\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
51	rusvin k	rusvinaroor321@gmail.com	91	7034526953342	0	$2y$10$MrFgNK9gKKs8F4zq0LAJ3uzqno7Ea5TEXYHBbQUR14Bl9/8ij9EB.	\N	2	rusvin	k	\N	1111	121212	android	c4dfd257fa779c3e8e9cb8ab7d5b2356740b83910078c5212c1ff0dc631e63e4	-NWd4e1xJHykMPbIcy_G	\N	2023-05-29 19:57:50	2023-05-29 19:57:50	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
47	hunain Ten	hunain99@gmail.com	971	14708523596	1	$2y$10$Psly72SYSUMq8AGZoKD3JenSqfpCpMuo5kaI4xIT0SpMOIFTvp1.K	\N	2	hunain	nine	\N		egEiJCiBQW61l-yJMbfhcS:APA91bEoCmfer-o-j-8UhLTrmVI7ozLLTYttFJOvHRP5UaPL4oMeGqZv0sBlFZyWzuM8Q4gqW_loDS2JiMHkf6_JObWMVCsMYLvYGwIUu-L7mmD4OgBm-IaR7ZwxNTESjWxOM5qnAlIt	android	643|JvaKXWaJ8AgnDZlOdh6qt29lpLWB8dxbUwnNLxXr	-NWEfBnt2tvEJ8jqDmwy	\N	2023-05-24 21:31:44	2023-06-07 17:59:16	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	0	\N	0	\N	\N	\N	999999	1	0	\N	0				0			\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
52	new user	testest@gmail.com	92	335480851	0	$2y$10$5Um3QbMBe662jviIMxZsBui4rnYPMzWvatKCUcdlVEc.a0IBKGTcC	\N	2	new	user	\N	1111	eo_aiC4ttENVolfLtFE-rO:APA91bEfnP__E0bVW8-odIqIJ4tQW_yvs0jbSwRYhMtqtfSM-yA2OXFQMup4WJ6m29JztHnOH4lrYA6bxOG_WzBPU1LIu5-fMX3AAei7tGluoLdDmFynKVmia2R5-ww1YddrfZt6jwKl	iOS	3efee412e3b1d9620e7cc219bf5f8b994d95a7ab16b449b4127beda24c4adb1b	-NWdUIYtCYSfPm9-fPEJ	\N	2023-05-29 21:49:53	2023-05-29 21:49:54	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
56	social login	nasr1ulahpqqqitafi1@gmail.com	91	3425623423	1	$2y$10$.wZwcnedPeHb7fpCy5dqIeQ8KiSsfNRWoZNSCeEuRmZTNlwNOqkJG	2023-05-31 06:24:37	2	\N	\N	\N		223232332323	andorid	26486dba70858451fbc567ff44a576f72e8061bbd0d03a6b72cbaddba3095a66	-NWkThHLJowpeLMf5vQh	\N	2023-05-31 06:24:37	2023-06-06 05:41:14	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	nasr1ulahpqqqitafi1	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
60	DX App	appdx0911@gmail.com	91	629623026	1	$2y$10$jHLpHaaLBAs.5F.Nu82OXezFquwi8fZbni.iqLHd8i3CFLcecNHuW	2023-05-31 12:09:53	2	\N	\N	\N			android		-NWlhj-r2bwb-wvurlpM	\N	2023-05-31 12:09:53	2023-06-12 11:39:09	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	appdx0911	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
54	new test	nas1234@gmail.com	+92	654485121	1	$2y$10$c705B4WCCwugKxIH2RI7UO0rdjf1cco1xSTI1tnfs42XcDq7IHIii	\N	2	new	test	\N			iOS		-NWdeN11AHdIn5ywfzV-	\N	2023-05-29 22:38:15	2023-05-29 22:53:43	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
53	newuser test	newtest123@gmail.com	+92	3308058465	1	$2y$10$LAXuF3oRmM08JAHZHqr8NOa5OJ/8gTe6SN8OyUMlcgrQfUklnlmjS	\N	2	newuser	test	\N			iOS		-NWdVG_vAOXOULUCNdwk	\N	2023-05-29 21:54:07	2023-05-29 21:57:53	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	19da01f471a82fc915c73ca3786a928d884512e7f4472e9cc182b009c95f0e8f	2023-05-29 21:57:53	1111	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
55	tet	test@gmail.com	\N	0	0	$2y$10$5/fDMcWHSykF/gbZIe/LCOS7d1fldZe7zwYC/dIcFBC9cdwydjIG2	2023-05-31 05:39:16	2	\N	\N	\N	1111	223232332323	andorid	cd86c905f6e704601e30e33c7f6d6ca9f0cbcf96a8c7df45c035b42149afbc8f	-NWkJJqonDeD-q1153_y	\N	2023-05-31 05:39:16	2023-05-31 07:30:14	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	test	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
63	nasar test	test11@gmail.com	+92	546461198	1	$2y$10$FbPnsHCrKAfXgzTBo.01WeNz6t.PqocoI4Rmo.YYbLDO.5/uEDkq2	\N	2	nasar	test	\N		e7vGe-7Hd0_TuydVIUE0Iv:APA91bEaV-OtvVTceSKYglWhMUaOtvG17lFcQ81T_Dhj5g30OctF4L62RIHsTEDNCOFMQQa1KVY8hlvMKaojA3kDf3wd1M2oqgkaxP2AtPsL62It9o9X0denBMKgh69jzEjneba0HfXz	iOS	195|sh7kbmca3tb7aPzNBRdKu5YH8CPt9knouhBSqc8T	-NWo1UeYA3TbnU2UL2Js	\N	2023-05-31 22:59:50	2023-05-31 23:00:02	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
57	Nemai Biswas	nbz01@mailinator.com	91	9832831811	1	$2y$10$DqQcrJXruoCFL65xuRh9/.YSVVVQRYdckBjNnYjEsBDKUWp9DF3.2	\N	2	Nemai	Biswas	1685529004647721acc19a8.jpg		dep_UBDUQBmDZ15mmepb0P:APA91bEbFOW715n9_IYNa7o1ES71dHPsr3ftyR42tvvRYSl24oVZZEhYqtIXyalKe5TxYF4JnVOSc2r5ef6E4A9VDR4WKjYG9Dsd5lHD9GKGffc1ztXU1UZ25_9WNNeoOS3j16owYQbt	android	640|LKA3vSq81Rkr018Byw5QF0KrVV6lb43fujomciDE	-NWkc5ULMdWlVbrq7ikG	\N	2023-05-31 07:05:40	2023-06-07 13:51:07	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	0	\N	0	dfab6bc1455b1ef24a4a639d25afe76ca7c0f453e3e2a98bcdc42f11f5514d24	2023-06-06 06:19:06	1111	999999	1	0	\N	0				0			\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
66	zain falak	zain@gmail.com	92	46119196	1	$2y$10$.oAAovKYCALJ2PSZTggGA.F7E.m0fb0jBM052.2z5qhsFL5Pin0wq	\N	2	zain	falak	\N		esN9QfJST_CrXPhknBHfZf:APA91bEgVAGzBWPXY92dHivk29xCpybuSfdkFqppMlH0Y1eav3H888Ibr_gM4KgSSUyzsyp5nXI0vnhG3q_6lS7UzajBcopWQhP4R7dZ-AmbKP7YdE3PbQAlCAJVB5RdiEdFWyJ85kRu	android	218|M129GhbM8SsLNeHvbqdGDStfSa2eCh7In0EajkSe	-NWt2rjIYsvesv3LMGkE	\N	2023-06-01 22:23:57	2023-06-01 22:33:09	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
59	more more	testdxbuae@gmail.com	971	0852147963	1	$2y$10$9HyUump.3rsam4SI3.Zh0u1jOsiJ.qiMKAWiOrRDGNViYHQ5lVYoq	2023-05-31 07:36:34	2	\N	\N	\N			android		-NWkjAIRJ7d4NGnin8EL	\N	2023-05-31 07:36:34	2023-06-05 07:29:48	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	testdxbuae	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
62	hun chh	hunain223@gmail.com	971	0852369741	1	$2y$10$ljwx7a1rOSoqS6ZsWHDjMO1UOEoVZOJ1aRLhbjcavI/LxrRO00p/u	\N	2	hun	chh	\N			android		-NWo0aMnBPqTpBh6N-P5	\N	2023-05-31 22:55:56	2023-06-01 04:58:29	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
65	rusvin k	buildmartabudhabi@gmail.com	91	70345269511	1	$2y$10$1b0Jjl.w7F1183N1NL3FauJUrGyDngR49m3rA0dIIyFP4TALd0xdW	\N	2	rusvin	k	\N		1212121	android	2ce49818760ed7e9732cbf964f2d1bb810bdf8379a50ce462fea723d36e2238b	-NWpRFXOmZT7V2CXIzGO	\N	2023-06-01 05:32:01	2023-06-01 05:33:53	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
67	usman test	usman@gmail.com	+92	335401515	1	$2y$10$BswZPBZ4aKTF3Nr5.dP0B.vA9wzHToA5nFJw1UnGguQODrA9al4E.	\N	2	usman	test	\N		f_Q39e4WSz-Hl_vJYSYEo1:APA91bGTz9aN-CyZgUEJyr-dI6CicCcMCQ9kKl20B1M-2GcujPLjjj55gdnUMYCcXgiENjlmABJ6-u8M5kM6tzaS_IiUz5lII9nzWTOEgl7mDjFrBIYQlBhW6JcCxgbVFs63d3hNuAK2	android	227|eyazX7TLYSOp2gDoThS2AqFICquiswNSLxGYoM4I	-NWwpKwXQbrrS1QL6Z0U	\N	2023-06-02 15:58:57	2023-06-02 16:18:14	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0		2023-06-02 16:17:35	0	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
68	test user	user123@gmail.com	+92	78786580	1	$2y$10$e9S7MAZuIhDdLute7Oq.Su7nXY68tN/75jjaV2btPu5lni2AGr8hu	\N	2	test	user	\N			iOS		-NWwuDlWytqKfYwhc1SA	\N	2023-06-02 16:20:19	2023-06-02 16:49:06	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
76	new test	testtest@gmail.com	+92	213231312312	1	$2y$10$wSrA4gJpTmavWXiYMy2ZAOjZzchls6SSo/sMrLXXtogJI82WEUHiG	\N	2	new	test	\N			iOS		-NX4gIZzIF08lN4gokrs	\N	2023-06-04 09:16:03	2023-06-04 09:24:21	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
75	test fasr	newtest12345@gmail.com	376	5555555555555555555555555555555	0	$2y$10$HuDMizFNlSgMHlufF4RSkO/AdKAhwRRois/WMh0zhJ5Y8yCOLQJYu	\N	2	test	fasr	\N	1111	dWZxURTe00IHohhpTYsul1:APA91bGiVmg2AjTMojuRYqyAZD7NL6FH7QsuERgNiZN819TRlzYV4nm8gSo5N20uVpfdD2oquwyN0PJreZIuc-8a_79e7W29ohKRdnsUhcP9-IiosMHaaajMP42WtWcGzlRqcLlUiXf4	iOS	89b55e0277d44bec75682d5e90a99b991ee1c251a80023624ce6f2803f5e6a3a	-NX4e3o9ytKiw_zT9U2S	\N	2023-06-04 09:06:19	2023-06-04 09:06:19	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
70	dxb test	testdxb@gmail.com	+92	31816131	1	$2y$10$lZqDVDLofT25tM7xV4PpreI26U.N9HVUm9n7BgjkKpAPe0OSju5WW	\N	2	dxb	test	\N			iOS		-NWx7PtjlgbUBRC4iOGe	\N	2023-06-02 17:22:18	2023-06-02 19:16:46	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
79	t3e erew	newtwst@gmail.com	92	324234234	0	$2y$10$dFKhjT/oLWc/bL.Wm30gVOxgyB0Yxv8lqFSim9mjVArHhkz30wBDq	\N	2	t3e	erew	\N	1111	dWZxURTe00IHohhpTYsul1:APA91bGiVmg2AjTMojuRYqyAZD7NL6FH7QsuERgNiZN819TRlzYV4nm8gSo5N20uVpfdD2oquwyN0PJreZIuc-8a_79e7W29ohKRdnsUhcP9-IiosMHaaajMP42WtWcGzlRqcLlUiXf4	iOS	14ae0dd9cb8f6538fe396a3322429ebf039d3abe9e014d481c061c53c9189d27	-NX6LwseB97MkReBZ39h	\N	2023-06-04 17:02:00	2023-06-04 17:02:00	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
72	frank test	frank@gmail.com	+92	335401518	1	$2y$10$1Mdvclcpm3k3unGdi5C0Su3H4pO4DMGFtmlOVoXtNz3.iCL83HZSu	\N	2	frank	test	\N			iOS		-NWy52xplNQJCxAzmPqN	\N	2023-06-02 21:51:37	2023-06-02 21:58:44	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
77	build test	buildmart@gmail.com	92	938983923333	0	$2y$10$p18sIUpCvobMscoQ2oqMyOQqS0JAmi2hc4jcoU3.MNTm1rEe3Zdw.	\N	2	build	test	\N	1111	dWZxURTe00IHohhpTYsul1:APA91bGiVmg2AjTMojuRYqyAZD7NL6FH7QsuERgNiZN819TRlzYV4nm8gSo5N20uVpfdD2oquwyN0PJreZIuc-8a_79e7W29ohKRdnsUhcP9-IiosMHaaajMP42WtWcGzlRqcLlUiXf4	iOS	2c343673fff1ed97ac5915240aa4c3503bc7efc4fc5ed54306f4a77f7ad9dece	-NX4jlfs3m9fC4_DBfFD	\N	2023-06-04 09:31:13	2023-06-04 09:31:14	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
69	david test	david@gmail.com	+92	355488518	1	$2y$10$5zo7qp/KsONWSpmMYuP.5eK8W4bu2xyrBeD7QQS8XutM2vhSOzKMy	\N	2	david	test	\N			iOS	244|uSnf0viEiZGuz6C5F35WrnmWY8b0UEfe9IU44P28	-NWx06ELeXE8LpM7qbZu	\N	2023-06-02 16:50:23	2023-06-02 22:08:04	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
71	Test Test	nastest@gmail.com	92	3646941916	1	$2y$10$fRzQxvFDXOVZGfPXTVrsPunrY9dpKY80WOctMgQU7zL9HfU7NMxg6	\N	2	Test	Test	\N			android		-NWxWIZCRzr3xfhE-qYN	\N	2023-06-02 19:11:02	2023-06-02 21:14:05	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
78	test fds	test231312@gmail.com	92	312313123	0	$2y$10$PJI7kv..nriXWd.mmmrLsOVsvuB9JJ6uj.0tPGmsD0kPtvD6vzvgq	\N	2	test	fds	\N	1111	dWZxURTe00IHohhpTYsul1:APA91bGiVmg2AjTMojuRYqyAZD7NL6FH7QsuERgNiZN819TRlzYV4nm8gSo5N20uVpfdD2oquwyN0PJreZIuc-8a_79e7W29ohKRdnsUhcP9-IiosMHaaajMP42WtWcGzlRqcLlUiXf4	iOS	472b1f70acadec77b076491434a745b66dc3cef92f9522c572c58bb69fb709cd	-NX4oqT-Tpjjdb5Fxv0G	\N	2023-06-04 09:53:23	2023-06-04 09:53:24	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
82	anil navei	anilnavis@gmail.com	+971	5464640	1	$2y$10$CVnEoZ8U3eckzKjLuocrmOuMuxzyDIDg019TWfOy8sYNy4NeLKBSO	\N	2	anil	navei	168619317064814412e4644.jpg			iOS		-NX89__k_HxQuSc2asnH	\N	2023-06-05 01:27:13	2023-06-08 03:03:14	0	0	0	0	1	0	\N	\N	1	1111	\N	0	0	0	\N	0	\N	0	\N	0	\N	0	\N	\N	\N	999999	1	0	\N	0				1			\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
81	new nasar	newnasar@gmail.com	+92	3231313	1	$2y$10$OGrv2WbaEO.448IRGJdNhuUBqtj2v0o2to1bCRu.kasCY7qNkEskC	\N	2	new	nasar	\N		dWZxURTe00IHohhpTYsul1:APA91bGiVmg2AjTMojuRYqyAZD7NL6FH7QsuERgNiZN819TRlzYV4nm8gSo5N20uVpfdD2oquwyN0PJreZIuc-8a_79e7W29ohKRdnsUhcP9-IiosMHaaajMP42WtWcGzlRqcLlUiXf4	iOS	272|siNJmL6qVVoNhLpfwNsdFjawebeSwlhsPCk83rXP	-NX6N6u5IckcKSKG0no-	\N	2023-06-04 17:07:07	2023-06-04 17:07:14	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
83	Nemai Biswas II Software Tester	nemai@dxbusinessgroup.com	+93	963852963338	1	$2y$10$4wODJVO8AWjq0dAlQjtfn.n5qAztQ15FQv0ktTHztAnYZkS5sO0uy	2023-06-05 03:43:10	2	\N	\N	\N		eetyGavGQI-BduOguVoB5Z:APA91bF4RJVzO7ZSqP9n_Lp8OdUEkpWcbOP89BN1WxVDQ-DD-VfE8bP8SdciFYzJ9MSjyQL0VkvoSUEIGxDxGCdd2EaIM6HxMM8ukkXBnStHbWOxcHlkXK2F5n-rUn4FpNA5eszVfz8H	android	dbd7f379bb055c9b10ec5a189bf18c2f7b3580637802c49f84d897fa5d7ae0cd	-NX8dh7dHG1ny3ARLv7T	\N	2023-06-05 03:43:10	2023-06-08 12:49:59	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	nemai	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
84	Budhha Lamba	nbz04@mailinator.com	971	963852147	1	$2y$10$tWu2hPL6bnRTbLFKeoEJvu.CXLf4MlDyfYTbmweKCclktdYYmcCNa	\N	2	Budhha	Lamba	\N			android		-NX8sU6xTWsqWmnGeW5n	\N	2023-06-05 04:47:45	2023-06-05 04:48:52	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
85	Dolu Lamba	nbz05@mailinator.com	91	9883239126	1	$2y$10$QsO4zeF/zFkgoJvXk8sjI.0YCsVlchHBZNPmKehNERVKy4Z2mRDeO	\N	2	Dolu	Lamba	\N			android		-NX8t-XtIrBTgmrDmTGx	\N	2023-06-05 04:50:02	2023-06-05 05:29:51	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
73	Abdul Rahim	nbz03@mailinator.com	+374	852654725856	1	$2y$10$/jH8aZiWSnvUCUZqASwzwOFd4bUU0KyWUx8isy8T2dKvSBBjF3z5C	\N	2	Abdul	Rahim	\N			\N		-NWzlOxq3dUKkQ1hniR-	\N	2023-06-03 05:40:37	2023-06-08 12:49:24	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	b27793a864413995a0a111a0871bccf14473ba015f493fbfb5f8b1ff69cb508a	2023-06-06 04:36:56	1111	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
98	Muneeb Irshad	muneeb.huqqqqssain2927@gmail.com	+971	52555555555	1	$2y$10$JAClhZ.1NWbMkbpweBulfeCaWY1XoWqAFlOnuPf0aVy4WV8kGpbb.	2023-06-05 14:30:44	2	\N	\N	\N		fGn8QZPGN0hrsDPsM-kXat:APA91bFEhcj-s-ZMjMekEfrrTfvbwVCfr-O7eidwRE8pr-A7x_942gRcgGZEkhUfiDhzk9rH1o5nBy93T-oIATtWKbxTmrBTvYdkDtVqur9iU23WUyvY-Y4Uy_ipXf1l5DPMBxTqU_1e	iOS	5c7d6a4ac616fc39cb25be95430f2c49513bfc5d646769004205ddc9b3af2949	-NXAxuqNcUr1F7vpsajI	\N	2023-06-05 14:30:44	2023-06-05 14:30:59	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	muneeb.hussain2927	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
87	John Doe	denewe5059@gmail.com	+971	542454545	1	$2y$10$ereel2l9WNIpCXu7Z/YAj.i9IgvZhtXf7X1WEC1UeuVYo37KrRq9i	\N	2	John	Doe	\N			iOS		-NX9G-gZpB3-yigHQrqa	\N	2023-06-05 06:34:54	2023-06-05 06:45:43	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
91	hunain dev	hunain661@gmail.com	971	0789654199	1	$2y$10$B/r8sHpIaDXtfUuC1euh2Oij6VvZRJcaaqQ5zfnmsbORUbKoaew4W	\N	2	hunain	dev	\N			android		-NX9k_Jzi70Jk98f8iUM	\N	2023-06-05 08:52:51	2023-06-05 08:54:43	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
86	Nasrullah khan	nasrulahpitafi@gmail.com	+92	3368805854	1	$2y$10$r0Vbu69S2.CbC3iip3L.DeepSfoVTUPcg4Bl8.cVWFb2lT418R.cu	2023-06-05 05:29:49	2	\N	\N	\N		c_jtliLVfUgAnzpccaHGU4:APA91bFa16fptc9dkfUh5sTFnw2jv4X6vY0lqT9qKYXW9MrNOEbq4mQ8qjwfMbhBqzE-vWNQFExVc3xzibYuTbvm6LrTx0sSs_5kv_I-cbRdK_Prypttab-qFgFWqcBlBLsLFTe1Ddfr	iOS	c5483b0f5413e6429c4ef936d83ef934ee0fc38a25c70d7e3273c676e6b0d872	-NX916AVJO0J0CQFka5D	\N	2023-06-05 05:29:49	2023-06-06 01:05:10	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	nasrulahpitafi	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
89	test test	testingfordxb@gmail.com	971	14708523669	1	$2y$10$qljZM.ORZOadaekLd9BGYePMJaADU/QFCmGy80L4huJ.LZcG0yK06	2023-06-05 07:29:54	2	\N	\N	\N			android		-NX9SaOVA6xQbuXHdcao	\N	2023-06-05 07:29:54	2023-06-07 09:04:47	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	testingfordxb	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
64	Ali Mohammad	nbz02@mailinator.com	91	9883239120	1	$2y$10$mRsa85lECs.mkZBJbGBUae/.Y9NYyMSbIAIPEvbxcPCLyBzNHfYBm	\N	2	Ali	Mohammad	168559710464782bb0997bf.jpg			android		-NWpBrt_xrmDrNeBuXhG	\N	2023-06-01 04:24:48	2023-06-05 12:53:49	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	0	\N	0	05bf73466fb92c04f0f5519a4ae80a329030fd714fcf9bcd867a1fdec9915cbe	2023-06-05 06:30:54	1111	999999	1	0	\N	0				0			\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
90	hunain dev	hunain77@gmail.com	971	0789654123	1	$2y$10$P.pOBTbie/D4QajVFzOLAexGgaYgbI6uHIixCj3TFZH5uNNWO405G	\N	2	hunain	dev	\N			android		-NX9ikCqxJmyHINLT4qy	\N	2023-06-05 08:44:51	2023-06-05 08:46:45	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
93	Muneeb	muneeb.irshassssssd106@gmail.com	+971	555555555	1	$2y$10$s0/xnWaJ0TYpBT/BZ6L7huj9oGJ2ap/kitYUGN0NfM5jlxJrPBiay	2023-06-05 09:37:03	2	\N	\N	\N			iOS		-NX9uguhDJxmdw7i1zdm	\N	2023-06-05 09:37:03	2023-06-05 13:20:58	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	muneeb.irshad106	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
92	huna Dev	hunain999@gmail.com	971	3571592840	1	$2y$10$iWX47zEqc0GBbiJ.EMheQOSLk20OO59JHeDjdbFdQaApnkDJ5gYsK	\N	2	huna	Dev	\N			android		-NX9lAOY8lKEGiXfzeI6	\N	2023-06-05 08:55:27	2023-06-05 12:29:55	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
88	Arka Ballal	nbz06@mailinator.com	+971	963258741885	1	$2y$10$jdJT3A8zCI0GjxVx7b40vujmM5Mhx9/ZYgmEw0ne1Mi1S9/O23h1K	\N	2	Arka	Ballal	\N			iOS		-NX9Q9B2tCMgIfZtn4AD	\N	2023-06-05 07:19:15	2023-06-05 09:20:17	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
100	Muneeb Irshad Hussain	munaaaeeb.irshad106@gmail.com	+971	55585288	1	$2y$10$qba9OsfEFmfzui37oqHDvO7IGeht9WTcksTX9.9JaURxeLfKcdOuG	2023-06-05 15:07:08	2	\N	\N	\N			iOS		-NXB5FA-FqcRAG2kcWt8	\N	2023-06-05 15:07:08	2023-06-06 04:56:16	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	muneeb.irshad106-2	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
97	shehroze71	shehroze.irshad01@gmail.com	+971	524155852	1	$2y$10$sKz3aRsu7dX03ccvic5iJeKXataTmaT5uiXUBbirlOFK3AE4lv13a	2023-06-05 14:20:23	2	\N	\N	\N		fGn8QZPGN0hrsDPsM-kXat:APA91bFEhcj-s-ZMjMekEfrrTfvbwVCfr-O7eidwRE8pr-A7x_942gRcgGZEkhUfiDhzk9rH1o5nBy93T-oIATtWKbxTmrBTvYdkDtVqur9iU23WUyvY-Y4Uy_ipXf1l5DPMBxTqU_1e	iOS	01d003d78c0cea5d5268a731811f805c64d6c06a6ac8b9adfb73bb1f8ae0d346	-NXAvYGNK3krWJ-aTD-Y	\N	2023-06-05 14:20:23	2023-06-05 14:23:44	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	shehroze.irshad01	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
94	N Biswas	nemai.biswas56@gmail.com	971	982685269	1	$2y$10$/mUbZmIGqasVUn.x06QZjO2SJG4mqs.TuqH0wX2G4hWTfJfY2QfFi	2023-06-05 12:54:11	2	\N	\N	\N			android		-NXAboW-CjIc1k70DkHC	\N	2023-06-05 12:54:11	2023-06-06 04:18:46	0	0	0	0	0	1	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	nemai.biswas56	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
96	Muneeb Irshad Hussain	mun3333434eeb.irshad106@gmail.com	+971	542543484	1	$2y$10$ckpCOcW1cPOVTWdqNrVm8uvZe80TbffojIA/XCMB4Ek0WpQXWr9HK	2023-06-05 13:45:10	2	\N	\N	\N			iOS		-NXAnUH0C9Q2lUyx8VhY	\N	2023-06-05 13:45:10	2023-06-05 15:05:44	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	muneeb.irshad106-1	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
99	Rusvin K	rusvinar2222oor@gmail.com	971	7034526953	1	$2y$10$om8cn74iYgNLPygNsBB5zOVjwj3ktATcdJjOVbMq9InJLvOmRwnmS	2023-06-05 14:44:57	2	\N	\N	\N		223232332323	android	21e9f63d81883c66f7fbf83a111071fcfd9c0056c441e56fa883f59d21ee4ca3	-NXB0ADJPkDfiaix3tM0	\N	2023-06-05 14:44:57	2023-06-06 03:45:14	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	rusvinaroor	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
95	Muneeb Irshad	moongosssod4u@gmail.com	+971	54215454554	1	$2y$10$mQDWVByS0LkSSXsiJPYxAuFndHZZ1xHb.n/vpFtQWs9hkwumglG5.	2023-06-05 13:38:05	2	\N	\N	\N			iOS		-NXAlrgBMGvju68zjxqf	\N	2023-06-05 13:38:05	2023-06-06 04:57:55	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	moongood4u	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
106	mew new	nnmtest@gmail.com	+92	361818181	1	$2y$10$dt4VqHHk50v0ZgkUZ1WiNuKHXk1s1s0emT1lJOhE8PKaAwb88/ZLO	\N	2	mew	new	\N			iOS		-NXCvXP-f-UfMkSc6KmO	\N	2023-06-05 23:39:34	2023-06-06 01:03:51	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
101	test user	fofodo4037@ratedane.com	+971	543454604	1	$2y$10$8E1dn3BHmPuOg6ttz8dHle4jU.Yz0T1W.ruWuCwolsbynAT.KgToK	\N	2	test	user	\N		fGn8QZPGN0hrsDPsM-kXat:APA91bFEhcj-s-ZMjMekEfrrTfvbwVCfr-O7eidwRE8pr-A7x_942gRcgGZEkhUfiDhzk9rH1o5nBy93T-oIATtWKbxTmrBTvYdkDtVqur9iU23WUyvY-Y4Uy_ipXf1l5DPMBxTqU_1e	iOS	032804714ddb41523523b81f505a688606e7394908da2d45e29cd317f72d6178	-NXB8XFTGN0tbt1XZkxD	\N	2023-06-05 15:21:29	2023-06-05 15:21:46	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
113	N Biswas	nemai.bsssiswas56@gmail.com	971	963288666	1	$2y$10$NvJmzc.68Zl.7/3UKsejRuBq1MpP9KOddqu3wKd3is2k/vpKfGfRq	2023-06-06 04:22:38	2	\N	\N	\N		eG2J1djFQcqnDXCwvT34C8:APA91bHBMkSlIKWy4ve6JPJUx00f59i2J36_-95bkOzya4xCA5w3-ASD-M6zffwS6tlbe3jMRJ_rmY4bQyIoFnuLVhG40T5K7F7g7q331S_fkJD0x_hsf_Srn94ld_HpXqxZUp2Zu396	android	5076f5754b43298c62589b220c6ebf1fd0e6b20d0b94b3fb4baaba038bf3079d	-NXDwJw1PC9gSzy8yxaJ	\N	2023-06-06 04:22:38	2023-06-06 04:22:55	0	0	0	0	0	1	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	nemai.biswas56-2	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
104	new test	testest11@gmail.com	92	385161018	1	$2y$10$czKXtwIPOKhnYvq5fRDee.Lv0XkzjbbvFiieDSsvBQyosYYsBskpO	\N	2	new	test	\N			android		-NXCdlbHLo_dL_iSfcm9	\N	2023-06-05 22:21:58	2023-06-05 23:01:39	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
108	Srijaul Gazi	srijaul1@gmail.com	91	6296323804	1	$2y$10$oRj/cb7Zc.aERhohzvVUlOkFGkmDLFjG1GY09Xwg17zFww9URX4a2	2023-06-06 03:22:07	2	\N	\N	1686021895647ea70745899.jpg		eq2FIY3QRbaLmoNhkHFvaf:APA91bGEQWUCJ_gsYWa8PkQKfwFPVmaFRiscVcYBHkd9OIV6Ik2u2yjt9f43y7FHtzIIxpPB6ZpUdyUOrluFj4BMrCgY03oxUcQCJ7u_FfYkQnEDF7aAeCZYFBPWKCFTmNBBPmdLTWeH	android	6ee6af97c214d456d2531462d24ea63fb20318c960f27b5c5b2cae2ae438be69	-NXDiTPk0Yog_N9xtjyc	\N	2023-06-06 03:22:07	2023-06-06 03:24:55	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	\N	0	\N	0	\N	\N	\N	999999	1	0	\N	0				1			\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
103	new user test	testnew@gmail.com	92	33564581987	1	$2y$10$TOwvocMsAdT8Kn4F39c.z.KrEQJWFdENDWeqluVD.oCW.J5jmE6.G	\N	2	new user	test	\N			android		-NXCbn-sbaFqLH3GT7XT	\N	2023-06-05 22:13:19	2023-06-05 22:50:49	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
102	Test User	vevexij525@vaband.com	+971	542456484	1	$2y$10$vE40HIHQo2cPWjaaVjnb..vQOtifhV.GiyJjHC/LbTxuwJSCyr.1q	\N	2	Test	User	\N			iOS		-NXBAOfnYf-GIU9aH60P	\N	2023-06-05 15:29:38	2023-06-05 15:31:11	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
105	Nasrullah Khan	nasrulahpitafi1@gmail.com	+92	3313851812	1	$2y$10$.Bqgj4wxjWa/WSenainUfewR0Lc0WWvoJUhTBnQPKkr0Cvwhg91wq	2023-06-05 22:58:37	2	\N	\N	168612571064803c8e22f4b.jpg		c7agGOdxIUVMgdJXyAzy55:APA91bGA7b-qNwDuKgjYjzbwhTsh_csLSfmyi7qGxBdE4WZ_O5d8ooN5_1jgflwRJ7FTi72p5EOoRQJwFcFK-Zc1JpU79rMDIeuuIxPAnowUjvpzlclMwV4wVD1fO47ACmoGO8hwZE0F	iOS	3af4e210290095657e4f00ffb91c87dd5f273dfa8965d1711e2b7ea5146e8219	-NXCm9eHrtqdNoBW0EAw	\N	2023-06-05 22:58:37	2023-06-08 19:19:51	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	\N	0	\N	0	\N	\N	\N	999999	1	0	\N	0				1			\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
109	social login	11121211212@gmail.com	91	342562334	1	$2y$10$jw5UKk5hoLgwXeGTAfiJmOfQ3xctaAFI2aVeesGzpUgUJQvQnmygu	2023-06-06 03:46:37	2	\N	\N	\N		223232332323	andorid	d6ff01886db09682cf8ad8394dbff422e0d9adc837b8da56e2dab01fe6fd9d26	-NXDo4LMlKcymWPzlyf_	\N	2023-06-06 03:46:37	2023-06-06 14:55:19	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	rusvinaroor-1	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
112	N Biswas	nemai.biswas56@gmail.com	+971	852963258	1	$2y$10$sPKUh2K2PK8mlYQEFbW32ufdTsJFayK2DHIzdkbfrm9gTukUJio7.	2023-06-06 04:18:59	2	\N	\N	\N		etSIAM27AUHwhXJwFud64K:APA91bFyddosQrVqrP22Zb9JV5zGpVr5XThqBSLiuxhnorbG8FLDlx74ew83zEh2Yt4qP5NSenQHlt1OTjh2qCqdwopXbpv3HzedvWpTy8M0TUMlVfXnFLWvqiy6uV76v2h-04oJAEEg	iOS	6b7e04dac1b352a819f54fc00673e7b087e9209285d06d6c4867b7315acafa3c	-NXDvUJa9Bq94hzTntXj	\N	2023-06-06 04:18:59	2023-06-06 04:20:23	0	0	0	0	0	1	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	nemai.biswas56-1	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
114	rusvin k	rusvinaroor123@gmail.com	91	3425623436	1	$2y$10$v93AfNos0jWMiUv4G.Q/3uuYdFC0zVd4DmwmZPXeawpn01wA.QFq2	\N	2	rusvin	k	\N		223232332323	android	48442a3e9b32c62f8d1d486a27cdb093fb26f109195a2042fa449eaad15cbad7	-NXE4s8rbszZSMuQcmyu	\N	2023-06-06 05:04:22	2023-06-07 03:36:37	0	0	0	0	1	0	\N	\N	1	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
115	social login	nasr1ulahpqqqitafi111@gmail.com	\N	0	0	$2y$10$lAUcDo0.1KuKctFMQTxkceNxjD.LOnjf72aCBKB0I7Xg67GXm408m	2023-06-06 05:13:10	2	\N	\N	\N	\N	223232332323	andorid	70e0a4fe342d31bf2d0718c9b89d6543eabadc46be86b9d481629735b5740ea0	-NXE6t9G0QLWN3GWoPrQ	\N	2023-06-06 05:13:10	2023-06-06 05:13:23	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	nasr1ulahpqqqitafi111	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
107	Nasrullah Khan	hp7289gzgs@privaterelay.appleid.com	+92	688856322	1	$2y$10$ZnjmxhPxSUztYwqR6X83QOQ5ueLd7Cqx8aSQK6zepYv4HxINgKwyC	2023-06-06 01:15:23	2	\N	\N	\N			iOS		-NXDGSwKqjo2wVwzOKuX	\N	2023-06-06 01:15:23	2023-06-15 09:29:45	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	hp7289gzgs	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
117	social login	nasr1ulahpqqqitawwwwfi1@gmail.com	\N	0	0	$2y$10$kc/omiMFOUQDSqYMJI9mXuAM7AIKVu6FoGrTOeIgczJHX0p.oCH3m	2023-06-06 05:41:28	2	\N	\N	\N	\N	223232332323	andorid	35c1b861ab8e89cbe0a72c9db005d8a22b8440b110f2dc395975b659d2bdcfa6	-NXEDMjHWoaUHxVaGsoK	\N	2023-06-06 05:41:28	2023-06-06 05:41:29	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	nasr1ulahpqqqitawwwwfi1	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
116	Muneeb Irshad Hussain	muneeb.irshad106@gmail.com	+971	558458411111	1	$2y$10$yTfM1faZCLcYVVYl1KxEjuJAC2PiPh0aSJ1fAvoQvRJQjZfgr5OuC	2023-06-06 05:30:21	2	\N	\N	\N		fhNYD5SgZUdYkZKVpN5DZK:APA91bH2sF6bMm-n-OlnbPAYrvud5ahH4M1twiUVCvXqoXhZdWpLapkBP64EF1QBZU5Li1Kc1nb-knGM7kwkmjDz5OuwxHZdWFg4M7uaCqcKZd5dMd69-D6_H6t0y3wKn1J8lrx5AQhE	iOS	fd8ae2f1e81eb9a931402f252c74ffd8eff3ca41d90bfc3b3a7f7432a70cec29	-NXEAotpyKeAbUwra0kP	\N	2023-06-06 05:30:21	2023-06-08 13:12:44	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	muneeb.irshad106-3	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
123	Piu Niger	nbz08@mailinator.com	+971	852963741	1	$2y$10$aJwtEIqYlGSjp/v/anfJvOCuGV42j0nE4CMOVgUg1wWNt0p.eUkTS	\N	2	Piu	Niger	\N		eVYK5BpHTdu2WrbWEg712M:APA91bGHe6r6Xci_Po6g2IdbXIac18GNifDV1FM_fnF6o7CdHzDMSrcT_hBcZ47WTa4-_w5VPwkNhWJkPX6ZgS_pi28OE4LBDkpv70VmlbqT3tSNtHxvA300bQ5YGR_P-yRwi-IQsGTt	android	707|aScnrWMpL4hyHbQp1B55p6dwFd6R2woB3ksDbUZd	-NXENG7nIy5aYSHM3ehe	\N	2023-06-06 06:24:43	2023-06-12 11:41:51	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0		2023-06-12 11:41:02	0	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
128	Test User	poyexa91644@vaband.com	+971	542466484	1	$2y$10$zsdwHYQbSeT.5q7ZOuQBfeazldGaYkFyBvwmsfPMgj8FFS/M4A1bK	\N	2	Test	User	\N			iOS		-NXFLsFCDDn1i7UEyNgV	\N	2023-06-06 10:58:16	2023-06-06 11:02:33	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
118	Muneeb Irshad	moongood4u@gmail.com	+971	5728464545	1	$2y$10$aY1FYss1EtoRcrClkE2kE.Rkap8zlh0wLqMDyGk2w5pVRmHQ8diPy	2023-06-06 05:45:49	2	\N	\N	\N			iOS		-NXEEMLeReY8VB0A5cig	\N	2023-06-06 05:45:49	2023-06-06 05:50:10	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	moongood4u-1	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
121	Test User	urbanwave@soopltryler.com	971	542453448	0	$2y$10$AkvM65m3NdjL7KVhbPwi/.QURvEp/ASUgoNZh6YRxT/VOaoGCQM2m	\N	2	Test	User	\N	1111	fGn8QZPGN0hrsDPsM-kXat:APA91bFEhcj-s-ZMjMekEfrrTfvbwVCfr-O7eidwRE8pr-A7x_942gRcgGZEkhUfiDhzk9rH1o5nBy93T-oIATtWKbxTmrBTvYdkDtVqur9iU23WUyvY-Y4Uy_ipXf1l5DPMBxTqU_1e	iOS	d6230beee85550855c09289731c1c38b13eb5b3ed6d5ab635f3fc5866fbd973c	-NXELdhcdSjgMUO-F45Y	\N	2023-06-06 06:17:39	2023-06-06 06:17:40	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
122	Aninda Bala	nbz07@mailinator.com	971	985368852	0	$2y$10$xn.a.CkHWnbdmLZTJe7Wa.T7WbqE2h9Nb3Ga7IvSL.zKD2E7nxSYm	\N	2	Aninda	Bala	\N	1111	d3zLS-5VTuidV377H9-zAa:APA91bFMZtzoJOpwUF-NB7EAuTJwmk1UT8JfS6sAtrUdcygt9jlf5Tc1wEKBMUuqeI47iEUWw20nsyPwPLK9XRSPlM8i4G750zfyttdCsudItHrx4FUhXtB8N8oT2tZyFTGZaNXOB3aL	android	916d48409e9a7089997b0c8e0517f6f870280ff597e35fbb3067bbb571ae1f0c	-NXEML84DZzqqmDFtiEp	\N	2023-06-06 06:20:41	2023-06-06 06:20:42	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
120	N Biswas	nemai.baaaaiswas56@gmail.com	91	9832831812	1	$2y$10$c8kVQ8LQP4toyqqG5WbgCuQUY.Quq5tbC0Foet3fre7PYL6Fjx1iy	2023-06-06 06:02:18	2	\N	\N	\N		fNkyIUXwSXqQzrd479pz-l:APA91bHK6i8RiE2GID4_hSb97tIOCGHVwgOle7sk_SUXfZo7clxUAyL_ElCEu6bRvANL8DgTPUVbJ1G2tWfSAI7c7_b7sMCnxbV2S28iioikDw-bZRW_Hqar61HJ3P1yTrHAqOXEfoUn	android	46221831c04649340ad8d4fdf530ecce1fb087e5b517eea10e101bd413e206d1	-NXEI7xoCVw75uM0KcRG	\N	2023-06-06 06:02:18	2023-06-08 05:55:54	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	nemai.biswas56-3	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
125	test test	testhy@gmail.com	+92	334811815	1	$2y$10$JvQrcQ4vkF6TPmo2jR4pxOIo7jFUYkJXBnWy/BLOx3t11T7j.EZXS	\N	2	test	test	\N			iOS		-NXEUK4t3pv_zXO6W6Ia	\N	2023-06-06 06:55:34	2023-06-06 08:23:22	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
130	John Doe	jeroxob286@vaband.com	971	543454845	0	$2y$10$sQ0/fXB3rqh1DBz4po7uuelYrLTd8HfJfsgvQCEobNDil2o9XXhJG	\N	2	John	Doe	\N	1111	fGn8QZPGN0hrsDPsM-kXat:APA91bFEhcj-s-ZMjMekEfrrTfvbwVCfr-O7eidwRE8pr-A7x_942gRcgGZEkhUfiDhzk9rH1o5nBy93T-oIATtWKbxTmrBTvYdkDtVqur9iU23WUyvY-Y4Uy_ipXf1l5DPMBxTqU_1e	iOS	16b91ad366bf6bb5d31af234be24029f2a69b8f387c125b337847d8aad13da55	-NXFf4QGkYyl8uZq3TfR	\N	2023-06-06 12:26:33	2023-06-06 12:26:33	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
119	Muneeb Irshad	muneeb.hussain2927@gmail.com	+971	5257412566	1	$2y$10$BQ/KXWNijlFNNvfH0iIEaum4YxEOOdjN2X6srWhik8ccPmNe5x1ji	2023-06-06 05:51:17	2	\N	\N	\N			iOS		-NXEFb_dpZ62VkbBJXKH	\N	2023-06-06 05:51:17	2023-06-06 10:26:03	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	muneeb.hussain2927-1	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
129	Anima Morye	nbz09@mailinator.com	971	8465844889	1	$2y$10$wLqLo0.OmYLSeHYN1KKMvubeQzcmF3C8KqWKdH6S1o9t.b9AwGVm2	\N	2	Anima	Morye	\N			\N		-NXFTkmmEdPnGhRPmNZr	\N	2023-06-06 11:32:42	2023-06-07 12:35:31	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	49e1872634e9974ef1ca3d7d7b90a33f7ddb76e9f4eb1ee4325a7d6d677e920a	2023-06-07 12:34:17	1111	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
126	anil pixelhehd	anil@dxbusinessgroup.com	+971	5464648	1	$2y$10$j/k4rNTM9ONJxTWAMNSUp.3q92XzbXtAz6Znnz9/isZMHvrrjRte6	\N	2	anil	pixel	1686196943648152cf6979b.jpg			\N		-NXEwEdBswjrPggU04Cw	\N	2023-06-06 09:01:54	2023-06-08 08:17:28	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	0	\N	0	154d44f87b1ee17d41a1dfa8e0b1970f0e126806d9a8003a5cd6e24b044d3480	2023-06-06 11:51:02	1111	999999	1	0	\N	0				0			\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
131	john doe	jivina4457@soremap.com	+971	57243344884	1	$2y$10$NXABX3Wy6ULoD7U3u4RLQuV0sULEpWyUmflmQsQw71H6f/WVscjo6	\N	2	john	doe	\N		4B44A6EE-C4D4-4D12-BDD1-C3F796C6574A	\N	567|8VYoM2efpDtYWHUXqT0u3GBdBy2z1qP93BNbBM0H	-NXFl2sls5wOA6eKWS7-	\N	2023-06-06 12:52:39	2023-06-06 15:12:17	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	978f334b9664b17502863c365d57d579ccf7ee0349f76c724889311ddb246276	2023-06-06 13:35:04	1111	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
132	testnew user	testnewuser@gmail.com	+92	349818118	1	$2y$10$Pv6IrHIWMLGXr5nFTlfvh.roiT7/3f9.eG3V31R1ufqS/WTOhw/I2	\N	2	testnew	user	\N		c_jtliLVfUgAnzpccaHGU4:APA91bFa16fptc9dkfUh5sTFnw2jv4X6vY0lqT9qKYXW9MrNOEbq4mQ8qjwfMbhBqzE-vWNQFExVc3xzibYuTbvm6LrTx0sSs_5kv_I-cbRdK_Prypttab-qFgFWqcBlBLsLFTe1Ddfr	iOS	569|pwK1ejzUL5Ek0oqTfrRwmt61zJIhoQAyTPtD5Ipk	-NXGNTJf6qYSUSpTau7O	\N	2023-06-06 15:44:51	2023-06-06 15:44:59	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
133	test name	franktest@gmail.com	92	616111819	1	$2y$10$Om6Icyj75BPMauyCWT6U3Okv2Haj9KEPUZ18u014eb1pGSA0ynXE6	\N	2	test	name	\N		\N	android	bd79559490a45c82ca852ef8f057338d9b0e4038f1547cd26a13bb37f320642b	-NXG_0HH5ibqQjN19zlL	\N	2023-06-06 16:39:40	2023-06-06 16:40:00	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
135	Abhishek Tripathi	nbz10@mailinator.com	+971	85208523	1	$2y$10$e4WDaEj/nPxcSHLk3els2eJBR.z1MOLQIdn4F/j..a.8TebKTtBFC	\N	2	Abhishek	Tripathi	\N			iOS		-NXJ2sj8svsWVdD47TJZ	\N	2023-06-07 04:13:46	2023-06-07 05:42:17	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
146	Test User	xididi5690@ratedane.com	+971	542543484548	1	$2y$10$EX7vbwtIfaezdEVGKfxXuOFKk731xXlYjbzLq9TVpU0MtTbjAgTJe	\N	2	Test	User	\N			iOS		-NXPOlWJvYuVioM7hMgx	\N	2023-06-08 09:47:07	2023-06-08 13:12:26	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
138	Lili Aadam	nbz11@mailinator.com	91	988555563	1	$2y$10$cXqqRGuGkX9KvgWGgXzsIeuu/2usDmmf2lRnIcC9PRyCvNOYTZn7y	\N	2	Lili	Aadam	\N		cgSVtCGXTIeK35xhTph6tX:APA91bG8YxNgTbCMyTwvw_MASiHNGZ8azZU5b2b3Wah00zjjt0Hr8Ldkh1UwECtjcZx_Pb-z1mHZKerLA10oUZ2EW-3c7HsnlOK__KQOl00WaAYawvae5KBPP0cnwXk49wv3iIjrAIUb	android	73599fdf2f1c2260f6c13ad6261b6fa320c215cf41b8f5f0cb6e299d35a6c5e0	-NXJmt7kBqWdahZQRDVM	\N	2023-06-07 07:39:08	2023-06-07 07:39:14	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
136	test test	newtestttyru@gmai.com	+92	366451515	1	$2y$10$VtQn3pUqR6rODmW0uSX8m.c.WEusOf6WZENAqaaERozjdo2niQJiu	\N	2	test	test	\N			iOS		-NXJVEzS5BpClqfwMR5M	\N	2023-06-07 06:17:41	2023-06-07 06:30:57	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
134	Rusvin	rusvinaroor@gmail.com	91	3425623445	0	$2y$10$c0/csnYj8ZTOB9tNRPadmeaxWMNcI4NlbTLLYSXdnTxFyxIHAiUPC	2023-06-07 03:24:28	2	\N	\N	\N	1111	223232332323	andorid	d4808c2127f5655d33a5ca4b11cf882b95d3d1355adb613544cfcdbea09311fb	-NXIsa_T-gW3dMBTZ1Oo	\N	2023-06-07 03:24:28	2023-06-08 06:17:23	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	\N	0	\N	0	\N	\N	\N	999999	1	0	\N	0				1			\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
139	new user test test	newnasarkhan@gmail.com	+92	313181518	1	$2y$10$2HJakpuYclInlhq.Mrnz..dJ75MXDcpiTR/Xmc8vq0TAf/LtyozbO	\N	2	new user	test test	\N			iOS		-NXK598X1f9HyV28fDuJ	\N	2023-06-07 09:03:19	2023-06-07 09:08:46	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
143	Nemai Biswas	vb2hfsjccccp4s@privaterelay.appleid.com	+971	985266335856655555665557425	1	$2y$10$sEe8I/6EqIxkJNwYfCTPjueQnWLykJRTwhWV1snobCir1D/17aLI6	2023-06-08 06:40:50	2	\N	\N	\N			iOS		-NXOj7tdUrbPLTqoyXMA	\N	2023-06-08 06:40:50	2023-06-08 07:21:38	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	vb2hfsjp4s	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
141	admin test	admintest1@gmail.com	+92	361881515	1	$2y$10$ZQQh3k6A2.o77DSAxV/P0ua.sMWxqMmMVLHk5Gnbf4iAMEG.hilUa	\N	2	admin	test	\N			iOS		-NXN1p17w3Z5IS1oPQoh	\N	2023-06-07 22:47:38	2023-06-07 23:37:24	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
140	Anima Bose	nbz12@mailinator.com	+971	852963177	1	$2y$10$WYQ2NV7tuU9XZERdAx/bhe.qiZUm3OXZ740nXn1lzJdoFVH6rTbhW	\N	2	Anima	Bose	\N			iOS		-NXL6AUvoOcHqoCN8WjG	\N	2023-06-07 13:47:24	2023-06-07 13:47:53	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
124	Nasar Test	testnasar@gmail.com	+92	3554818121	1	$2y$10$.ee.gKRMGyeGZjaHXmo0QeSoONZjjYFBr9LA2pAiM1HjHybjM3/hi	2023-06-06 06:54:20	2	\N	\N	168612966764804c037abde.jpg			iOS		-NXEU2FpOC5s_PVTU4s1	\N	2023-06-06 06:54:20	2023-06-08 15:23:16	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	\N	0	\N	0	\N	\N	\N	999999	1	0	\N	0				1			\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
142	Zain Falak	z.falak777@gmail.com	+92	335815015	1	$2y$10$2VeJ7Hh7CKMPwDd7wgvovevBkUwg1/ynPpE15iZNqCkV/v5fffSmq	2023-06-07 23:37:33	2	\N	\N	\N			iOS		-NXNDFUQ7_oi3Vd521ce	\N	2023-06-07 23:37:33	2023-06-07 23:40:35	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	z.falak777	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
127	hunain TTT	hunain00@gmail.com	358	15427583606	1	$2y$10$KdW.dofLpXreYc5DbMn8JOwTuZ1e2B/BTXzXXU4WwGzWbeDU3kxT2	\N	2	hunain	Ttt	\N			android		-NXF0kqKZiY3CH1Xc0J1	\N	2023-06-06 09:26:00	2023-06-10 15:05:12	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	0	\N	0	\N	\N	\N	999999	1	0	\N	0				0			\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
145	Nemai Biswas	vb2hfsjp4s@privaterelay.appleid.com	+971	852336655	1	$2y$10$ZnctBfilBDvzyRg0S7D0.ehiy1QgllLdeQGFwYg6I8LE/LzgB8dH6	2023-06-08 08:43:15	2	\N	\N	\N		erfuX9ciAE9snhVvokOoRe:APA91bEDymjmxspKgiSHrVFXt7n71KSSNzR9KWBkI5wP7IMNl7OuWSA9jdc6IQvN1oM-w1vuil_oDNgrl294ESj0fhdlSW-e0FJd3xCwd8WAgYqTxFQ12U_irfC2A3BYpZRrxVmMlSi8	iOS	2dfe3a61f3d30554d20e5237fc252050a1bf250fba5d6d48fd7022a526af395b	-NXPA8v5QBbl4SBDN-Ke	\N	2023-06-08 08:43:15	2023-06-09 03:55:55	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	vb2hfsjp4s-1	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
144	Anil Navis	navisanil@gmail.com	+971	2422463433	1	$2y$10$ToIyn/LYq/C/0N/JbRS3fOPHhyjCSN2J7Gw49OYvKyu7pf0cDY/8i	2023-06-08 08:17:39	2	\N	\N	\N		eRryVx-DAkSvtAVvdymafF:APA91bFBDHEsOXzkfgULPbl4mdExpG2B4s97Pp-S472ZLIbYGDiHMDL-fX0UxI1mWdQuO_UHQRiJzWlXRpNknT8ZLsbclMEqbJGxKlLjyVe1dHNQuoDvF0YPwg5fqn2Fg5PiWnvfTTs7	iOS	df6bb28a7ea6be21e21bbc02624cc2dd1b10874e07d223fbef26f2cf33e76aa1	-NXP4I5xSOL6XgXWd972	\N	2023-06-08 08:17:39	2023-06-12 11:12:18	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	navisanil	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
147	AJESHKUMAR CHEMPANKULAM DIVAKARAN	ajeshkumarcd@hotmail.com	+971	505041860	1	$2y$10$biFqMPBSPOk2M9w50hye0uslKYFGQsRyzeWGtwg.1hXnhRt57.CZO	2023-06-12 11:12:43	2	\N	\N	\N		dxszmyTWRkJPkztdzaZWPU:APA91bEwhz3cErmi9RwiBh4sw-wcRCinFGnq30GXaOM-H6fTQPt4F05RwBzZVjsqzV9us3rJGPQ9nfqLe254I27KSshabSRxn0PTH90AWV-t955cCenFfkQw46aBfl0wtYNXe9RrpghX	iOS	a20a7ea2146c188c8e8cdecf1a35527b8fbbe9130b63ef86a7534727a19daedb	-NXjIiM6_vwbLU6Ib6X2	\N	2023-06-12 11:12:43	2023-06-12 11:12:53	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	ajeshkumarcd	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
148	N Biswas	nemai.biswas56@gmail.com	91	9822831811	1	$2y$10$6cyzSk4R6PwsdWuPTuDDNOpPuuPigXbtqcd6qS4xCtkeqOMBXVkV6	2023-06-12 11:39:23	2	\N	\N	\N			android		-NXjOp9JKzBgM4icqwwv	\N	2023-06-12 11:39:23	2023-06-12 11:40:14	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	nemai.biswas56-4	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N	0	\N
\.


--
-- Data for Name: users_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_role (id, role_name, created_at, updated_at) FROM stdin;
1	admin	2023-05-09 13:36:43	2023-05-09 13:36:43
2	users	2023-05-09 13:36:43	2023-05-09 13:36:43
3	vendors	2023-05-09 13:36:43	2023-05-09 13:36:43
\.


--
-- Data for Name: vendor_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_details (id, homedelivery, logo, key_control, branches, company_name, company_brand, legal_staus, reg_date, trade_license, trade_license_expiry, vat_reg_number, vat_reg_expiry, address1, address2, street, state, city, area, zip, trade_license_doc, chamber_of_commerce_doc, share_certificate_doc, power_attorny_doc, vat_reg_doc, signed_agreement_doc, identy1_type, identy1_doc, identy2_type, identy2_doc, company_identy1_type, company_identy1_doc, company_identy2_type, company_identy2_doc, created_at, updated_at, industry_type, user_id, store_type) FROM stdin;
\.


--
-- Data for Name: videos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.videos (id, vendor_id, video, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: wallet_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_histories (id, user_id, wallet_amount, pay_type, description, created_at, updated_at, pay_method) FROM stdin;
\.


--
-- Data for Name: wallet_payment_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_payment_report (id, transaction_id, payment_status, user_id, ref_id, amount, method_type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: websockets_statistics_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.websockets_statistics_entries (id, app_id, peak_connection_count, websocket_message_count, api_message_count, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: wholesale_order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wholesale_order_items (id, wholesale_order_id, menu_item_id, quantity, price, total_amount, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: wholesale_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wholesale_orders (id, user_id, vendor_id, status_id, approved, order_number, total_quantity, total_amount, shipping_address, delivery_option, payment_method, created_at, updated_at, admin_commission) FROM stdin;
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
-- Name: ad_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ad_banners_id_seq', 13, true);


--
-- Name: admin_designation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_designation_id_seq', 4, true);


--
-- Name: amount_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.amount_type_id_seq', 2, true);


--
-- Name: app_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_banners_id_seq', 8, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articles_id_seq', 4, true);


--
-- Name: attribute_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attribute_type_id_seq', 4, true);


--
-- Name: attribute_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attribute_values_id_seq', 1, false);


--
-- Name: attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attributes_id_seq', 1, false);


--
-- Name: bad_words_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bad_words_id_seq', 1, false);


--
-- Name: bank_code_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_code_types_id_seq', 3, true);


--
-- Name: bank_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_details_id_seq', 2, true);


--
-- Name: bank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_id_seq', 1, true);


--
-- Name: block_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.block_users_id_seq', 1, false);


--
-- Name: brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_id_seq', 1, true);


--
-- Name: cart_food_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_food_id_seq', 1, false);


--
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 389, true);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 11, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 2, true);


--
-- Name: comment_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_likes_id_seq', 1, false);


--
-- Name: comment_taged_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_taged_users_id_seq', 1, false);


--
-- Name: contact_us_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_us_settings_id_seq', 1, true);


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_seq', 1, true);


--
-- Name: coupon_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_category_id_seq', 4, true);


--
-- Name: coupon_coupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_coupon_id_seq', 1, true);


--
-- Name: coupon_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_histories_id_seq', 4, true);


--
-- Name: coupon_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_products_id_seq', 1, false);


--
-- Name: deligates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deligates_id_seq', 1, false);


--
-- Name: designations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.designations_id_seq', 1, false);


--
-- Name: facilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facilities_id_seq', 1, false);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faq_id_seq', 5, true);


--
-- Name: favourite_moda_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favourite_moda_items_id_seq', 1, false);


--
-- Name: favourite_modas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favourite_modas_id_seq', 1, false);


--
-- Name: food_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_categories_id_seq', 1, false);


--
-- Name: food_category_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_category_products_id_seq', 1, false);


--
-- Name: food_coupon_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_coupon_categories_id_seq', 1, false);


--
-- Name: food_coupon_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_coupon_products_id_seq', 1, false);


--
-- Name: food_headings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_headings_id_seq', 1, false);


--
-- Name: food_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_items_id_seq', 1, false);


--
-- Name: food_menu_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_menu_products_id_seq', 1, false);


--
-- Name: food_product_combo_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_product_combo_items_id_seq', 1, false);


--
-- Name: food_product_combos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_product_combos_id_seq', 1, false);


--
-- Name: food_product_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_product_likes_id_seq', 1, false);


--
-- Name: food_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_products_id_seq', 1, false);


--
-- Name: gym_subscription_packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gym_subscription_packages_id_seq', 1, false);


--
-- Name: gym_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gym_subscriptions_id_seq', 1, false);


--
-- Name: hair_colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hair_colors_id_seq', 1, false);


--
-- Name: hash_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hash_tags_id_seq', 1, false);


--
-- Name: help_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.help_id_seq', 1, true);


--
-- Name: hide_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hide_posts_id_seq', 1, false);


--
-- Name: hide_stories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hide_stories_id_seq', 1, false);


--
-- Name: industry_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.industry_types_id_seq', 1, true);


--
-- Name: menu_item_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_item_types_id_seq', 1, false);


--
-- Name: menu_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_items_id_seq', 1, false);


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menus_id_seq', 1, false);


--
-- Name: message_privacies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.message_privacies_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 270, true);


--
-- Name: moda_main_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moda_main_categories_id_seq', 6, true);


--
-- Name: moda_sub_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moda_sub_categories_id_seq', 1, false);


--
-- Name: mute_stories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mute_stories_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.notifications_id_seq', 36, true);


--
-- Name: nottification_tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nottification_tracks_id_seq', 1, false);


--
-- Name: order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_products_id_seq', 193, true);


--
-- Name: order_status_histroys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_status_histroys_id_seq', 1, false);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 135, true);


--
-- Name: payment_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_report_id_seq', 173, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 709, true);


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.photos_id_seq', 1, false);


--
-- Name: post_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_comments_id_seq', 1, false);


--
-- Name: post_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_files_id_seq', 1, false);


--
-- Name: post_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_likes_id_seq', 1, false);


--
-- Name: post_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_reports_id_seq', 1, false);


--
-- Name: post_saves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_saves_id_seq', 1, false);


--
-- Name: post_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_users_id_seq', 1, false);


--
-- Name: post_view_insights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_view_insights_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- Name: product_attribute_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_attribute_attribute_id_seq', 1, false);


--
-- Name: product_attribute_values_attribute_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_attribute_values_attribute_values_id_seq', 1, false);


--
-- Name: product_category_product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_category_product_category_id_seq', 130, true);


--
-- Name: product_docs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_docs_id_seq', 1, false);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 34, true);


--
-- Name: product_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_images_id_seq', 1, false);


--
-- Name: product_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_likes_id_seq', 155, true);


--
-- Name: product_selected_attribute_list_product_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_selected_attribute_list_product_attribute_id_seq', 34, true);


--
-- Name: product_selected_attributes_product_selected_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_selected_attributes_product_selected_attributes_id_seq', 1, false);


--
-- Name: product_specifications_prod_spec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_specifications_prod_spec_id_seq', 16, true);


--
-- Name: product_temp_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_temp_image_id_seq', 1, false);


--
-- Name: product_variations_product_variations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_variations_product_variations_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: profile_bios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profile_bios_id_seq', 1, false);


--
-- Name: provider_package_subscription_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provider_package_subscription_histories_id_seq', 1, false);


--
-- Name: provider_packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provider_packages_id_seq', 1, false);


--
-- Name: public_business_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.public_business_infos_id_seq', 1, false);


--
-- Name: reservation_bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservation_bookings_id_seq', 1, false);


--
-- Name: reservation_product_contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservation_product_contents_id_seq', 1, false);


--
-- Name: reservation_product_ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservation_product_ratings_id_seq', 1, false);


--
-- Name: reservation_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservation_products_id_seq', 1, false);


--
-- Name: service_request_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_request_images_id_seq', 1, false);


--
-- Name: service_request_status_descriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_request_status_descriptions_id_seq', 1, false);


--
-- Name: service_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_requests_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.states_id_seq', 2, true);


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

SELECT pg_catalog.setval('public.store_type_id_seq', 1, true);


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stores_id_seq', 1, false);


--
-- Name: stories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stories_id_seq', 1, false);


--
-- Name: story_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.story_likes_id_seq', 1, false);


--
-- Name: story_mentions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.story_mentions_id_seq', 1, false);


--
-- Name: story_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.story_reports_id_seq', 1, false);


--
-- Name: story_views_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.story_views_id_seq', 1, false);


--
-- Name: temp_order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_order_products_id_seq', 269, true);


--
-- Name: temp_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_orders_id_seq', 197, true);


--
-- Name: units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.units_id_seq', 4, true);


--
-- Name: user_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_address_id_seq', 91, true);


--
-- Name: user_favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_favorites_id_seq', 1, false);


--
-- Name: user_follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_follows_id_seq', 1, false);


--
-- Name: user_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_locations_id_seq', 1, false);


--
-- Name: user_privileges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_privileges_id_seq', 1, false);


--
-- Name: user_profile_view_insights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_profile_view_insights_id_seq', 1, false);


--
-- Name: user_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_reports_id_seq', 1, false);


--
-- Name: user_vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_vehicle_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 148, true);


--
-- Name: users_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_role_id_seq', 3, true);


--
-- Name: vendor_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_details_id_seq', 1, false);


--
-- Name: videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.videos_id_seq', 1, false);


--
-- Name: wallet_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_histories_id_seq', 1, false);


--
-- Name: wallet_payment_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_payment_report_id_seq', 1, false);


--
-- Name: websockets_statistics_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.websockets_statistics_entries_id_seq', 1, false);


--
-- Name: wholesale_order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wholesale_order_items_id_seq', 1, false);


--
-- Name: wholesale_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wholesale_orders_id_seq', 1, false);


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
-- Name: ad_banners ad_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ad_banners
    ADD CONSTRAINT ad_banners_pkey PRIMARY KEY (id);


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
-- Name: attributes attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attributes
    ADD CONSTRAINT attributes_pkey PRIMARY KEY (id);


--
-- Name: bad_words bad_words_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bad_words
    ADD CONSTRAINT bad_words_pkey PRIMARY KEY (id);


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
-- Name: block_users block_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.block_users
    ADD CONSTRAINT block_users_pkey PRIMARY KEY (id);


--
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (id);


--
-- Name: cart_food cart_food_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_food
    ADD CONSTRAINT cart_food_pkey PRIMARY KEY (id);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


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
-- Name: coupon_category coupon_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_category
    ADD CONSTRAINT coupon_category_pkey PRIMARY KEY (id);


--
-- Name: coupon_histories coupon_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_histories
    ADD CONSTRAINT coupon_histories_pkey PRIMARY KEY (id);


--
-- Name: coupon coupon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon
    ADD CONSTRAINT coupon_pkey PRIMARY KEY (coupon_id);


--
-- Name: coupon_products coupon_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupon_products
    ADD CONSTRAINT coupon_products_pkey PRIMARY KEY (id);


--
-- Name: deligates deligates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deligates
    ADD CONSTRAINT deligates_pkey PRIMARY KEY (id);


--
-- Name: designations designations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT designations_pkey PRIMARY KEY (id);


--
-- Name: facilities facilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facilities
    ADD CONSTRAINT facilities_pkey PRIMARY KEY (id);


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
-- Name: favourite_moda_items favourite_moda_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourite_moda_items
    ADD CONSTRAINT favourite_moda_items_pkey PRIMARY KEY (id);


--
-- Name: favourite_modas favourite_modas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourite_modas
    ADD CONSTRAINT favourite_modas_pkey PRIMARY KEY (id);


--
-- Name: food_categories food_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_categories
    ADD CONSTRAINT food_categories_pkey PRIMARY KEY (id);


--
-- Name: food_category_products food_category_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_category_products
    ADD CONSTRAINT food_category_products_pkey PRIMARY KEY (id);


--
-- Name: food_coupon_categories food_coupon_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_coupon_categories
    ADD CONSTRAINT food_coupon_categories_pkey PRIMARY KEY (id);


--
-- Name: food_coupon_products food_coupon_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_coupon_products
    ADD CONSTRAINT food_coupon_products_pkey PRIMARY KEY (id);


--
-- Name: food_headings food_headings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_headings
    ADD CONSTRAINT food_headings_pkey PRIMARY KEY (id);


--
-- Name: food_items food_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_items
    ADD CONSTRAINT food_items_pkey PRIMARY KEY (id);


--
-- Name: food_menu_products food_menu_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_menu_products
    ADD CONSTRAINT food_menu_products_pkey PRIMARY KEY (id);


--
-- Name: food_product_combo_items food_product_combo_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_product_combo_items
    ADD CONSTRAINT food_product_combo_items_pkey PRIMARY KEY (id);


--
-- Name: food_product_combos food_product_combos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_product_combos
    ADD CONSTRAINT food_product_combos_pkey PRIMARY KEY (id);


--
-- Name: food_product_likes food_product_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_product_likes
    ADD CONSTRAINT food_product_likes_pkey PRIMARY KEY (id);


--
-- Name: food_products food_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_products
    ADD CONSTRAINT food_products_pkey PRIMARY KEY (id);


--
-- Name: gym_subscription_packages gym_subscription_packages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gym_subscription_packages
    ADD CONSTRAINT gym_subscription_packages_pkey PRIMARY KEY (id);


--
-- Name: gym_subscriptions gym_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gym_subscriptions
    ADD CONSTRAINT gym_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: hair_colors hair_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hair_colors
    ADD CONSTRAINT hair_colors_pkey PRIMARY KEY (id);


--
-- Name: hash_tags hash_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hash_tags
    ADD CONSTRAINT hash_tags_pkey PRIMARY KEY (id);


--
-- Name: help help_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help
    ADD CONSTRAINT help_pkey PRIMARY KEY (id);


--
-- Name: hide_posts hide_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hide_posts
    ADD CONSTRAINT hide_posts_pkey PRIMARY KEY (id);


--
-- Name: hide_stories hide_stories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hide_stories
    ADD CONSTRAINT hide_stories_pkey PRIMARY KEY (id);


--
-- Name: industry_types industry_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industry_types
    ADD CONSTRAINT industry_types_pkey PRIMARY KEY (id);


--
-- Name: menu_item_types menu_item_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_item_types
    ADD CONSTRAINT menu_item_types_pkey PRIMARY KEY (id);


--
-- Name: menu_items menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- Name: menus menus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- Name: message_privacies message_privacies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_privacies
    ADD CONSTRAINT message_privacies_pkey PRIMARY KEY (id);


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
-- Name: mute_stories mute_stories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mute_stories
    ADD CONSTRAINT mute_stories_pkey PRIMARY KEY (id);


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
-- Name: nottification_tracks nottification_tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nottification_tracks
    ADD CONSTRAINT nottification_tracks_pkey PRIMARY KEY (id);


--
-- Name: order_products order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (id);


--
-- Name: order_status_histroys order_status_histroys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_histroys
    ADD CONSTRAINT order_status_histroys_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


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
-- Name: photos photos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


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
-- Name: post_reports post_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_reports
    ADD CONSTRAINT post_reports_pkey PRIMARY KEY (id);


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
-- Name: post_view_insights post_view_insights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_view_insights
    ADD CONSTRAINT post_view_insights_pkey PRIMARY KEY (id);


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
-- Name: product_docs product_docs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_docs
    ADD CONSTRAINT product_docs_pkey PRIMARY KEY (id);


--
-- Name: product_images product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (id);


--
-- Name: product_likes product_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_likes
    ADD CONSTRAINT product_likes_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


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
-- Name: profile_bios profile_bios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_bios
    ADD CONSTRAINT profile_bios_pkey PRIMARY KEY (id);


--
-- Name: provider_package_subscription_histories provider_package_subscription_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provider_package_subscription_histories
    ADD CONSTRAINT provider_package_subscription_histories_pkey PRIMARY KEY (id);


--
-- Name: provider_packages provider_packages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provider_packages
    ADD CONSTRAINT provider_packages_pkey PRIMARY KEY (id);


--
-- Name: public_business_infos public_business_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.public_business_infos
    ADD CONSTRAINT public_business_infos_pkey PRIMARY KEY (id);


--
-- Name: reservation_bookings reservation_bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation_bookings
    ADD CONSTRAINT reservation_bookings_pkey PRIMARY KEY (id);


--
-- Name: reservation_product_contents reservation_product_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation_product_contents
    ADD CONSTRAINT reservation_product_contents_pkey PRIMARY KEY (id);


--
-- Name: reservation_product_ratings reservation_product_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation_product_ratings
    ADD CONSTRAINT reservation_product_ratings_pkey PRIMARY KEY (id);


--
-- Name: reservation_products reservation_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation_products
    ADD CONSTRAINT reservation_products_pkey PRIMARY KEY (id);


--
-- Name: service_request_images service_request_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_request_images
    ADD CONSTRAINT service_request_images_pkey PRIMARY KEY (id);


--
-- Name: service_request_status_descriptions service_request_status_descriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_request_status_descriptions
    ADD CONSTRAINT service_request_status_descriptions_pkey PRIMARY KEY (id);


--
-- Name: service_requests service_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_requests
    ADD CONSTRAINT service_requests_pkey PRIMARY KEY (id);


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
-- Name: stories stories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stories
    ADD CONSTRAINT stories_pkey PRIMARY KEY (id);


--
-- Name: story_likes story_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.story_likes
    ADD CONSTRAINT story_likes_pkey PRIMARY KEY (id);


--
-- Name: story_mentions story_mentions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.story_mentions
    ADD CONSTRAINT story_mentions_pkey PRIMARY KEY (id);


--
-- Name: story_reports story_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.story_reports
    ADD CONSTRAINT story_reports_pkey PRIMARY KEY (id);


--
-- Name: story_views story_views_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.story_views
    ADD CONSTRAINT story_views_pkey PRIMARY KEY (id);


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
-- Name: units units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);


--
-- Name: user_address user_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address
    ADD CONSTRAINT user_address_pkey PRIMARY KEY (id);


--
-- Name: user_favorites user_favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_favorites
    ADD CONSTRAINT user_favorites_pkey PRIMARY KEY (id);


--
-- Name: user_follows user_follows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_follows
    ADD CONSTRAINT user_follows_pkey PRIMARY KEY (id);


--
-- Name: user_locations user_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_locations
    ADD CONSTRAINT user_locations_pkey PRIMARY KEY (id);


--
-- Name: user_privileges user_privileges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_privileges
    ADD CONSTRAINT user_privileges_pkey PRIMARY KEY (id);


--
-- Name: user_profile_view_insights user_profile_view_insights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile_view_insights
    ADD CONSTRAINT user_profile_view_insights_pkey PRIMARY KEY (id);


--
-- Name: user_reports user_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_reports
    ADD CONSTRAINT user_reports_pkey PRIMARY KEY (id);


--
-- Name: user_vehicle user_vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_vehicle
    ADD CONSTRAINT user_vehicle_pkey PRIMARY KEY (id);


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
-- Name: vendor_details vendor_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_details
    ADD CONSTRAINT vendor_details_pkey PRIMARY KEY (id);


--
-- Name: videos videos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.videos
    ADD CONSTRAINT videos_pkey PRIMARY KEY (id);


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
-- Name: websockets_statistics_entries websockets_statistics_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.websockets_statistics_entries
    ADD CONSTRAINT websockets_statistics_entries_pkey PRIMARY KEY (id);


--
-- Name: wholesale_order_items wholesale_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wholesale_order_items
    ADD CONSTRAINT wholesale_order_items_pkey PRIMARY KEY (id);


--
-- Name: wholesale_orders wholesale_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wholesale_orders
    ADD CONSTRAINT wholesale_orders_pkey PRIMARY KEY (id);


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
-- Name: block_users block_users_blocked_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.block_users
    ADD CONSTRAINT block_users_blocked_user_id_foreign FOREIGN KEY (blocked_user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: block_users block_users_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.block_users
    ADD CONSTRAINT block_users_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


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
-- Name: food_category_products food_category_products_food_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_category_products
    ADD CONSTRAINT food_category_products_food_category_id_foreign FOREIGN KEY (food_category_id) REFERENCES public.food_categories(id) ON DELETE CASCADE;


--
-- Name: food_category_products food_category_products_food_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_category_products
    ADD CONSTRAINT food_category_products_food_product_id_foreign FOREIGN KEY (food_product_id) REFERENCES public.food_products(id) ON DELETE CASCADE;


--
-- Name: food_menu_products food_menu_products_food_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_menu_products
    ADD CONSTRAINT food_menu_products_food_product_id_foreign FOREIGN KEY (food_product_id) REFERENCES public.food_products(id) ON DELETE CASCADE;


--
-- Name: food_product_combo_items food_product_combo_items_food_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_product_combo_items
    ADD CONSTRAINT food_product_combo_items_food_item_id_foreign FOREIGN KEY (food_item_id) REFERENCES public.food_items(id) ON DELETE CASCADE;


--
-- Name: food_product_combo_items food_product_combo_items_food_product_combo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_product_combo_items
    ADD CONSTRAINT food_product_combo_items_food_product_combo_id_foreign FOREIGN KEY (food_product_combo_id) REFERENCES public.food_product_combos(id) ON DELETE CASCADE;


--
-- Name: food_product_combos food_product_combos_food_heading_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_product_combos
    ADD CONSTRAINT food_product_combos_food_heading_id_foreign FOREIGN KEY (food_heading_id) REFERENCES public.food_headings(id);


--
-- Name: food_product_combos food_product_combos_food_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_product_combos
    ADD CONSTRAINT food_product_combos_food_product_id_foreign FOREIGN KEY (food_product_id) REFERENCES public.food_products(id) ON DELETE CASCADE;


--
-- Name: hide_posts hide_posts_post_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hide_posts
    ADD CONSTRAINT hide_posts_post_id_foreign FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: hide_posts hide_posts_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hide_posts
    ADD CONSTRAINT hide_posts_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: hide_stories hide_stories_hidden_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hide_stories
    ADD CONSTRAINT hide_stories_hidden_user_id_foreign FOREIGN KEY (hidden_user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: hide_stories hide_stories_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hide_stories
    ADD CONSTRAINT hide_stories_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: menu_items menu_items_menu_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES public.menus(id) ON DELETE CASCADE;


--
-- Name: menu_items menu_items_menu_item_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_menu_item_type_id_foreign FOREIGN KEY (menu_item_type_id) REFERENCES public.menu_item_types(id) ON DELETE CASCADE;


--
-- Name: message_privacies message_privacies_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_privacies
    ADD CONSTRAINT message_privacies_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: mute_stories mute_stories_mute_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mute_stories
    ADD CONSTRAINT mute_stories_mute_user_id_foreign FOREIGN KEY (mute_user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: mute_stories mute_stories_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mute_stories
    ADD CONSTRAINT mute_stories_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


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
-- Name: post_reports post_reports_post_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_reports
    ADD CONSTRAINT post_reports_post_id_foreign FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: post_reports post_reports_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_reports
    ADD CONSTRAINT post_reports_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


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
-- Name: store_managers_types store_managers_types_vendor_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_managers_types
    ADD CONSTRAINT store_managers_types_vendor_id_foreign FOREIGN KEY (vendor_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: stories stories_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stories
    ADD CONSTRAINT stories_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: story_likes story_likes_story_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.story_likes
    ADD CONSTRAINT story_likes_story_id_foreign FOREIGN KEY (story_id) REFERENCES public.stories(id) ON DELETE CASCADE;


--
-- Name: story_likes story_likes_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.story_likes
    ADD CONSTRAINT story_likes_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: story_mentions story_mentions_story_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.story_mentions
    ADD CONSTRAINT story_mentions_story_id_foreign FOREIGN KEY (story_id) REFERENCES public.stories(id) ON DELETE CASCADE;


--
-- Name: story_mentions story_mentions_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.story_mentions
    ADD CONSTRAINT story_mentions_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: story_reports story_reports_story_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.story_reports
    ADD CONSTRAINT story_reports_story_id_foreign FOREIGN KEY (story_id) REFERENCES public.stories(id) ON DELETE CASCADE;


--
-- Name: story_reports story_reports_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.story_reports
    ADD CONSTRAINT story_reports_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: story_views story_views_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.story_views
    ADD CONSTRAINT story_views_id_foreign FOREIGN KEY (id) REFERENCES public.stories(id) ON DELETE CASCADE;


--
-- Name: story_views story_views_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.story_views
    ADD CONSTRAINT story_views_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


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
-- Name: user_favorites user_favorites_fav_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_favorites
    ADD CONSTRAINT user_favorites_fav_user_id_foreign FOREIGN KEY (fav_user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_favorites user_favorites_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_favorites
    ADD CONSTRAINT user_favorites_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


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
-- Name: user_locations user_locations_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_locations
    ADD CONSTRAINT user_locations_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_reports user_reports_reported_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_reports
    ADD CONSTRAINT user_reports_reported_user_id_foreign FOREIGN KEY (reported_user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_reports user_reports_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_reports
    ADD CONSTRAINT user_reports_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: vendor_details vendor_details_industry_type_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_details
    ADD CONSTRAINT vendor_details_industry_type_foreign FOREIGN KEY (industry_type) REFERENCES public.industry_types(id);


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

