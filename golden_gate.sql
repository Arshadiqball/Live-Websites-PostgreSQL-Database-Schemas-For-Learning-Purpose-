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
    updated_at timestamp(0) without time zone
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
-- Name: bag_carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bag_carts (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    collection_point_id integer NOT NULL,
    total_weight character varying(255) NOT NULL,
    category_id integer NOT NULL,
    images text,
    barcode character varying(255) NOT NULL,
    remark text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.bag_carts OWNER TO postgres;

--
-- Name: bag_carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bag_carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bag_carts_id_seq OWNER TO postgres;

--
-- Name: bag_carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bag_carts_id_seq OWNED BY public.bag_carts.id;


--
-- Name: bag_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bag_types (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    active smallint DEFAULT '1'::smallint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.bag_types OWNER TO postgres;

--
-- Name: bag_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bag_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bag_types_id_seq OWNER TO postgres;

--
-- Name: bag_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bag_types_id_seq OWNED BY public.bag_types.id;


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
-- Name: collection_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection_items (
    id bigint NOT NULL,
    collection_id integer NOT NULL,
    total_weight character varying(255) NOT NULL,
    category_id integer NOT NULL,
    images text,
    barcode character varying(255) NOT NULL,
    remark text,
    item_status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    verified_by integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.collection_items OWNER TO postgres;

--
-- Name: collection_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collection_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collection_items_id_seq OWNER TO postgres;

--
-- Name: collection_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collection_items_id_seq OWNED BY public.collection_items.id;


--
-- Name: collection_points; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection_points (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255),
    dial_code character varying(255),
    phone character varying(255),
    location_name character varying(255) NOT NULL,
    lattitude character varying(255) NOT NULL,
    longitude character varying(255) NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    unique_code character varying(255) NOT NULL,
    image text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.collection_points OWNER TO postgres;

--
-- Name: collection_points_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collection_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collection_points_id_seq OWNER TO postgres;

--
-- Name: collection_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collection_points_id_seq OWNED BY public.collection_points.id;


--
-- Name: collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collections (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    collection_point_id integer NOT NULL,
    collection_status integer DEFAULT 0 NOT NULL,
    signature text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.collections OWNER TO postgres;

--
-- Name: collections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collections_id_seq OWNER TO postgres;

--
-- Name: collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collections_id_seq OWNED BY public.collections.id;


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
    failed_at timestamp(0) without time zone DEFAULT now() NOT NULL
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
    migration character varying(255) NOT NULL,
    batch integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

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
    materials character varying(1600)
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
    CONSTRAINT reservation_bookings_is_paid_check CHECK (((is_paid)::text = ANY (ARRAY[('0'::character varying)::text, ('1'::character varying)::text]))),
    CONSTRAINT reservation_bookings_status_check CHECK (((status)::text = ANY (ARRAY[('waiting_for_confirmation'::character varying)::text, ('booking_confirmed'::character varying)::text, ('wait_for_schedule'::character varying)::text, ('reserved'::character varying)::text, ('completed'::character varying)::text, ('rejected'::character varying)::text])))
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
    CONSTRAINT reservation_product_contents_content_type_check CHECK (((content_type)::text = ANY (ARRAY[('image'::character varying)::text, ('video'::character varying)::text])))
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
    CONSTRAINT reservation_product_ratings_status_check CHECK (((status)::text = ANY (ARRAY[('0'::character varying)::text, ('1'::character varying)::text])))
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
    CONSTRAINT reservation_products_price_type_check CHECK (((price_type)::text = ANY (ARRAY[('per_hour'::character varying)::text, ('per_day'::character varying)::text, ('per_week'::character varying)::text, ('per_month'::character varying)::text, ('per_year'::character varying)::text, ('fixed'::character varying)::text]))),
    CONSTRAINT reservation_products_status_check CHECK (((status)::text = ANY (ARRAY[('0'::character varying)::text, ('1'::character varying)::text])))
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
    pacakge_end_date date
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
-- Name: bag_carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bag_carts ALTER COLUMN id SET DEFAULT nextval('public.bag_carts_id_seq'::regclass);


--
-- Name: bag_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bag_types ALTER COLUMN id SET DEFAULT nextval('public.bag_types_id_seq'::regclass);


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
-- Name: collection_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_items ALTER COLUMN id SET DEFAULT nextval('public.collection_items_id_seq'::regclass);


--
-- Name: collection_points id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_points ALTER COLUMN id SET DEFAULT nextval('public.collection_points_id_seq'::regclass);


--
-- Name: collections id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections ALTER COLUMN id SET DEFAULT nextval('public.collections_id_seq'::regclass);


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
-- Data for Name: admin_designation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_designation (id, name, is_deletd) FROM stdin;
1	Staff	0
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

COPY public.app_banners (id, banner_title, banner_image, active, created_by, updated_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles (id, title_en, title_ar, status, desc_en, desc_ar, meta_title, meta_keyword, meta_description, created_at, updated_at) FROM stdin;
3	Privacy Policy	\N	1	<ul style="margin: 0px; padding: 0px; list-style: outside none; color: #4d5156; font-family: Roboto, 'helvetica neue', helvetica, arial, sans-serif; font-size: 13px;" role="region" aria-label="carousel">\r\n<li class="va-top mb-8 fz-m" style="margin: 0px 0px 8px; padding: 0px; font-size: 16px; line-height: 1.25; vertical-align: top; overflow: auto;" role="group" aria-label="Item 1 of 1">\r\n<div class=" lh-22 d-b " style="margin: 0px; padding: 0px; line-height: 22px;">Lorem ipsum&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.&nbsp;Lorem ipsum&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.</div>\r\n</li>\r\n</ul>	\N	\N	\N	\N	2023-05-20 11:46:19	2023-05-23 06:15:49
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
-- Data for Name: bag_carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bag_carts (id, user_id, collection_point_id, total_weight, category_id, images, barcode, remark, created_at, updated_at) FROM stdin;
103	3	3	25	2	1685345446647454a6b88f3.jpg	12152035	everything	2023-05-29 07:30:46	2023-05-29 07:30:46
107	12	9	99	1	1685345943647456978b1e3.jpg	55446677889	testing	2023-05-29 07:39:03	2023-05-29 07:39:03
108	12	9	300	2	1685346010647456da77511.jpg	554466	demo	2023-05-29 07:40:10	2023-05-29 07:40:10
\.


--
-- Data for Name: bag_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bag_types (id, name, active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank (id, name, created_at, updated_at) FROM stdin;
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
1	\N	\N	0	\N	\N	\N	\N	\N	0	2	2023-05-18 02:16:59	2023-05-18 02:16:59	\N
2	\N	\N	0	\N	\N	\N	\N	\N	0	3	2023-05-18 09:30:34	2023-05-18 09:30:34	\N
3	\N	\N	0	\N	\N	\N	\N	\N	0	4	2023-05-18 12:18:48	2023-05-18 12:18:48	\N
4	\N	\N	0	\N	\N	\N	\N	\N	0	5	2023-05-20 07:29:17	2023-05-20 07:29:17	\N
5	\N	\N	0	\N	\N	\N	\N	\N	0	7	2023-05-20 14:06:28	2023-05-20 14:06:28	\N
6	\N	\N	0	\N	\N	\N	\N	\N	0	8	2023-05-21 19:33:47	2023-05-21 19:33:47	\N
7	\N	\N	0	\N	\N	\N	\N	\N	0	9	2023-05-22 11:01:34	2023-05-22 11:01:34	\N
8	\N	\N	0	\N	\N	\N	\N	\N	0	10	2023-05-22 12:14:15	2023-05-22 12:14:15	\N
9	\N	\N	0	\N	\N	\N	\N	\N	0	11	2023-05-22 12:15:58	2023-05-22 12:15:58	\N
10	\N	\N	0	\N	\N	\N	\N	\N	0	12	2023-05-23 15:57:43	2023-05-23 15:57:43	\N
11	\N	\N	0	\N	\N	\N	\N	\N	0	14	2023-06-30 15:04:55	2023-06-30 15:04:55	\N
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
\.


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, product_id, product_attribute_id, quantity, user_id, store_id, device_cart_id, created_at, updated_at, influencer_id, influencer_qty) FROM stdin;
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
4	asda	\N	\N	0	0	1	0	1	1	2023-05-18 09:37:19	2023-05-20 04:51:32
1	Plastic Materials	\N	\N	0	1	0	0	1	1	2023-05-18 09:35:19	2023-05-23 06:10:40
2	Food materials	\N	\N	0	1	0	1	1	1	2023-05-18 09:35:46	2023-05-23 06:10:40
3	Hospital Waste	\N	\N	0	1	0	2	1	1	2023-05-18 09:37:08	2023-05-23 06:10:40
5	Needle Waste	\N	\N	0	1	0	0	1	1	2023-05-23 06:10:53	2023-05-23 06:10:53
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name, active, country_id, state_id, created_uid, updated_uid, deleted, created_at, updated_at) FROM stdin;
1	Dubai	1	1	1	1	\N	0	2023-05-18 02:16:25	2023-05-18 02:16:25
\.


--
-- Data for Name: collection_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collection_items (id, collection_id, total_weight, category_id, images, barcode, remark, item_status, created_at, updated_at, verified_by) FROM stdin;
8	1	10	3	16844066616466018530bcd.png,16844066616466018530bda.jpg	6465ec051f0391684401157	first test	0	2023-05-18 12:10:48	2023-05-18 12:10:48	0
9	1	10	3		6465ec051f0391684401157	first test	0	2023-05-18 12:10:48	2023-05-18 12:10:48	0
10	2	10 kg	3	1684408242646607b2291fd.webp,1684408242646607b25ae81.jpg,16844119376466162170c96.webp,1684411937646616217268c.jpg	6465ec051f0391684401157	edited	0	2023-05-18 12:12:31	2023-05-18 12:12:31	0
11	2	10	3	16844119166466160c5c2cb.webp,16844119166466160c5daa7.jpg	6465ec051f0391684401157	first test	0	2023-05-18 12:12:31	2023-05-18 12:12:31	0
13	3	10	3	16844155696466245141299.webp,16844155696466245141fdd.jpg	6465ec051f0391684401157	first test	0	2023-05-19 09:55:47	2023-05-19 09:55:47	0
14	4	10	1	1684490484646748f484b17.png	6465ec051f0391684401157	secondtest	0	2023-05-19 10:03:05	2023-05-19 10:03:05	0
15	5	3.5	2	168449795764676625d0bc8.jpg	6465ec051f0391684401157	my remarks	0	2023-05-19 12:06:19	2023-05-19 12:06:19	0
16	5	2.5	2	168449611064675eeeef126.jpg	6465ec051f0391684401157	my remarks	0	2023-05-19 12:06:19	2023-05-19 12:06:19	0
2	1	10	3	168440780964660601f1fd0.webp,168440780964660601f40b3.jpg	6465ec051f0391684401157	first test	1	2023-05-18 12:10:48	2023-05-19 15:03:45	4
3	1	10	3	1684407783646605e7a579a.webp,1684407783646605e7a80dc.jpg	6465ec051f0391684401157	first test	1	2023-05-18 12:10:48	2023-05-19 15:10:30	4
17	6	90	2	1684562256646861507a32b.jpg	6465ec051f0391684401157	my remarks	0	2023-05-20 05:57:52	2023-05-20 05:57:52	0
18	7	50	2	168457376164688e41b5ced.jpg	6465ec051f0391684401157	my remar	0	2023-05-20 09:18:18	2023-05-20 09:18:18	0
19	8	500	2	1684697230646a708e8404f.jpg,1684697230646a708e8501e.jpg	6465ec051f0391684401157	testinf	0	2023-05-21 19:29:37	2023-05-21 19:29:37	0
20	9	20	2	1684734911646b03bfe0c66.jpg	6465ec051f0391684401157	my remarks	0	2023-05-22 05:55:23	2023-05-22 05:55:23	0
4	1	10	3	16844071166466034c41e2c.webp,16844071166466034c465c7.jpg	6465ec051f0391684401157	first test	1	2023-05-18 12:10:48	2023-05-22 06:03:13	4
5	1	10	3	1684407095646603373edd5.jpg	6465ec051f0391684401157	first test	1	2023-05-18 12:10:48	2023-05-22 06:38:33	4
6	1	10	3	168440706064660314b0aa9.jpg	6465ec051f0391684401157	first test	1	2023-05-18 12:10:48	2023-05-22 06:40:03	4
21	10	60	2	1684738607646b122f21aa3.jpg	6465ec051f0391684401157	my	0	2023-05-22 06:56:52	2023-05-22 06:56:52	0
7	1	10	3		6465ec051f0391684401157	first test	1	2023-05-18 12:10:48	2023-05-22 07:02:21	4
39	23	300	3	1684837542646c94a67fa84.jpg	ooobb	3rd bag	1	2023-05-23 10:28:19	2023-05-23 10:56:29	8
45	26	25	5	1684846382646cb72e28632.jpg	last test	cvvb	1	2023-05-23 12:53:47	2023-05-23 12:56:00	11
22	11	50	3	1684740110646b180e91f1a.jpg	6465ec051f0391684401157	ok	1	2023-05-22 07:21:56	2023-05-23 10:56:34	4
25	14	500	1	1684755285646b5355b5c59.jpg	192598303455	test	1	2023-05-22 11:34:52	2023-05-22 11:39:07	8
26	15	25	1	1684756296646b5748bd436.jpg	test	testing	1	2023-05-22 11:51:46	2023-05-22 11:54:31	8
27	16	600	3	1684756689646b58d111c65.jpg	mock	remark	1	2023-05-22 11:58:18	2023-05-22 12:01:01	8
28	17	200	2	1684764352646b76c08165d.jpg	9780201379624	texr	0	2023-05-22 14:06:13	2023-05-22 14:06:13	0
12	3	10	3	1684416373646627752bde8.png	6465ec051f0391684401157	first test	1	2023-05-19 09:55:47	2023-05-23 11:09:53	4
29	18	100	2	1684780946646bb79277d38.jpg	ABC-abc-1234	enter	0	2023-05-22 18:43:43	2023-05-22 18:43:43	0
30	18	300	2	1684780914646bb772028e3.jpg	ABC-abc-1234	remark	0	2023-05-22 18:43:43	2023-05-22 18:43:43	0
23	12	200	1	1684750195646b3f73b2ce6.jpg,1684750195646b3f73b3c24.jpg,1684750195646b3f73b4da7.jpg,1684750195646b3f73b4f9d.jpg	192598303455	test	1	2023-05-22 10:20:41	2023-05-22 11:30:44	8
24	13	500	1	1684753158646b4b06b96e9.jpg	192598303455	testing	1	2023-05-22 10:59:30	2023-05-22 11:33:04	8
32	18	200.1	3	1684780736646bb6c045cc8.jpg,1684780736646bb6c0471ac.jpg,1684780736646bb6c048446.jpg	abcdg	this is iknowledge, skill, and development gained from study or practice. : the field of study that deals knowledge, skill, and development gained from study or practice. : the field of study that deals mainly with methods and problems of teaching..knowledge, skill, and development gained from study or practice. : the field of study that deals mainly with methods and problems of teaching.	0	2023-05-22 18:43:43	2023-05-22 18:43:43	0
31	18	300	2	1684780873646bb74952616.jpg	ABC-abc-1234	here	1	2023-05-22 18:43:43	2023-05-22 18:49:19	11
33	19	200	1	1684819536646c4e5060353.jpg	1234	remark	0	2023-05-23 05:26:31	2023-05-23 05:26:31	0
34	20	500	3	1684819830646c4f760c200.jpg	sahla	Full of hospital waste	0	2023-05-23 05:31:33	2023-05-23 05:31:33	0
1	1	10 kg	3	1684408242646607b2291fd.webp,1684408242646607b25ae81.jpg,168441021364660f6586eb1.webp,168441021364660f6587e67.jpg	6465ec051f0391684401157	edited	1	2023-05-18 12:10:48	2023-05-23 13:30:30	4
44	26	6980	2	1684846416646cb75066ca6.jpg	04926715	ccvgg	0	2023-05-23 12:53:47	2023-05-23 12:53:47	0
35	21	100	3	1684820418646c51c26389a.jpg	sahla1234	test from sahla	1	2023-05-23 05:42:02	2023-05-23 06:03:42	11
36	22	555	1	1684821992646c57e8ef629.jpg	sahlademo	Plastic Waste	1	2023-05-23 06:06:54	2023-05-23 06:07:50	11
40	23	300	1	1684837479646c9467c978e.jpg	oooaa	2nd bag	0	2023-05-23 10:28:19	2023-05-23 10:28:19	0
37	23	650	2	1684837668646c95240801e.jpg	ooodd	5th	1	2023-05-23 10:28:19	2023-05-23 10:36:15	8
38	23	200	3	1684837590646c94d6d53f6.jpg	ooocc	4th	1	2023-05-23 10:28:19	2023-05-23 10:46:04	8
41	23	200	1	1684837416646c9428d092a.jpg	ooo	this is our 1st bag	1	2023-05-23 10:28:19	2023-05-23 10:52:23	8
42	24	500	3	1684839904646c9de0ef19d.jpg	testing123	testing	0	2023-05-23 11:05:39	2023-05-23 11:05:39	0
43	25	200	1	1684842168646ca6b83a3f9.jpg	code	remark	1	2023-05-23 11:43:05	2023-05-23 11:43:48	8
48	27	200	1	1684857645646ce32d19634.jpg,1684857645646ce32d1a74c.jpg	maash	bag 1	1	2023-05-23 16:15:34	2023-05-23 16:18:46	11
46	27	300	5	1684858429646ce63dae7f2.jpg	maash	3rd	0	2023-05-23 16:15:34	2023-05-23 16:15:34	0
47	27	300	3	1684857744646ce390318dd.jpg	maash	bag 2	0	2023-05-23 16:15:34	2023-05-23 16:15:34	0
49	28	300	5	1684858976646ce860e02d3.jpg	maash123	2	1	2023-05-23 16:23:30	2023-05-23 16:25:21	8
50	28	500	1	1684858914646ce822bc85a.jpg	maash1234	1	1	2023-05-23 16:23:30	2023-05-23 16:36:54	8
51	29	200	5	1684908920646dab781ffc6.jpg	yellow cod e	here	1	2023-05-24 06:15:40	2023-05-24 06:16:31	11
52	30	999	5	1684909472646dada061f5c.jpg	yell	here	0	2023-05-24 07:05:19	2023-05-24 07:05:19	0
53	31	200	2	1684912061646db7bd36cd2.jpg	hai1	bag2	0	2023-05-24 07:08:06	2023-05-24 07:08:06	0
54	31	200	1	1684912012646db78ced2cc.jpg	hai	bag1	0	2023-05-24 07:08:06	2023-05-24 07:08:06	0
55	32	600	2	1684918367646dd05f1ee4c.jpg	DXB2	bag3	0	2023-05-24 08:53:00	2023-05-24 08:53:00	0
56	32	200	5	1684918303646dd01ff1916.jpg	DXB1	bag2	0	2023-05-24 08:53:00	2023-05-24 08:53:00	0
57	32	200	5	1684918217646dcfc971a33.jpg	DXB	bag 1	1	2023-05-24 08:53:00	2023-05-24 08:54:47	8
58	33	58	2	1684923064646de2b824927.jpg	AAAA111	vbbbjn	1	2023-05-24 10:11:09	2023-05-24 10:13:02	11
59	33	25	1	1684922963646de25350718.jpg	AAAA	vggh	1	2023-05-24 10:11:09	2023-05-24 10:13:36	11
61	34	200	1	1684929714646dfcb2aebc4.jpg	yyyy	bag 1	0	2023-05-24 12:03:17	2023-05-24 12:03:17	0
60	34	200	1	1684929782646dfcf60794c.jpg	zzzz	bag2	1	2023-05-24 12:03:17	2023-05-24 12:04:19	11
62	35	556	3	1684933522646e0b926eb9f.jpg	tttt	here	0	2023-05-24 13:05:32	2023-05-24 13:05:32	0
63	35	600	2	1684933492646e0b74a51f2.jpg	kkkk	remark	0	2023-05-24 13:05:32	2023-05-24 13:05:32	0
64	35	555	1	1684930013646dfddd41e5c.jpg	zzzz99	here	0	2023-05-24 13:05:32	2023-05-24 13:05:32	0
65	36	208	5	1684933840646e0cd011092.jpg,1684933840646e0cd01246d.jpg,1684933840646e0cd012bf5.jpg	ghgh	test	0	2023-05-24 13:10:45	2023-05-24 13:10:45	0
66	37	99	1	1684935118646e11ced9949.jpg	qqqq	bdb	0	2023-05-24 13:32:07	2023-05-24 13:32:07	0
68	38	99	5	168534371764744de51749d.jpg	jkljjhfyfd	testing	0	2023-05-29 07:04:45	2023-05-29 07:04:45	0
67	38	99	5	168534386064744e7490a26.jpg	jkljjhfyf6667	renark	1	2023-05-29 07:04:45	2023-05-29 07:05:42	11
69	39	369	3	16853442866474501eb3ba4.jpg	BARCODE	cvgh	0	2023-05-29 07:11:43	2023-05-29 07:11:43	0
70	39	369	3	168534424964744ff986950.jpg	9781234567897	testing	1	2023-05-29 07:11:43	2023-05-29 07:12:58	8
71	40	258	3	1685344686647451aed5809.jpg	5763637441947	vvvvhvb hhhh	0	2023-05-29 07:18:14	2023-05-29 07:18:14	0
72	40	258	3	16853446376474517dc36a7.jpg	56324419	ghhhh	0	2023-05-29 07:18:14	2023-05-29 07:18:14	0
73	41	369	3	1685345190647453a6b492c.jpg	59041313	cvvvh	0	2023-05-29 07:26:39	2023-05-29 07:26:39	0
74	41	369	3	168534515564745383e226b.jpg	ABC-abc-1234gfgfghghhg	ghhh	1	2023-05-29 07:26:39	2023-05-29 07:30:42	8
75	42	369	3	1685345570647455225edf3.jpg	323232326788	cvghh ghh	1	2023-05-29 07:32:56	2023-05-29 07:33:37	8
77	43	200	1	16853456076474554728981.jpg	87128888	testing	0	2023-05-29 07:33:40	2023-05-29 07:33:40	0
76	42	369	3	168534553664745500496ca.jpg	32323232	gghh	1	2023-05-29 07:32:56	2023-05-29 07:33:59	8
78	44	36	3	16853464156474586f95542.jpg	32323232123412	2	1	2023-05-29 07:47:07	2023-05-29 07:47:42	8
79	44	25	3	16853463826474584ebcfaf.jpg	323232321234	1	1	2023-05-29 07:47:07	2023-05-29 07:47:58	8
80	45	32	5	16866344866487fff67da5d.jpg	12345678	qqq	0	2023-06-13 05:35:00	2023-06-13 05:35:00	0
81	45	47	3	16866344416487ffc9e4c68.jpg	ABC-1234	1 bag	1	2023-06-13 05:35:00	2023-06-13 07:07:55	8
83	46	21	3		99514877	dr	0	2023-06-14 13:11:17	2023-06-14 13:11:17	0
82	46	26	3	16867482666489bc6a290de.jpg	GGHWT23061408	medical waste	1	2023-06-14 13:11:17	2023-06-14 13:13:11	8
84	47	30	3	1688123646649eb8fe6b4aa.jpg	GOLDENGATE-0201	medical waste	0	2023-06-30 11:14:27	2023-06-30 11:14:27	0
85	47	20	3	1688123579649eb8bbea214.jpg	GOLDENGATE-0101	medica waste	0	2023-06-30 11:14:27	2023-06-30 11:14:27	0
86	48	15	3	1688124237649ebb4d8665c.jpg	GOLDENGATE-0202	mw	0	2023-06-30 11:24:22	2023-06-30 11:24:22	0
87	49	2.5	3	1688190507649fbe2b5bbb1.jpg	GOLDENGATE-010704	mw	0	2023-07-01 05:48:49	2023-07-01 05:48:49	0
88	49	3.1	3	1688190465649fbe01b6a24.jpg	GOLDENGATE-010703	mw	0	2023-07-01 05:48:49	2023-07-01 05:48:49	0
89	49	3.1	3	1688190416649fbdd0a7b4f.jpg	GOLDENGATE-010702	mw	0	2023-07-01 05:48:49	2023-07-01 05:48:49	0
90	49	1.1	3	1688190374649fbda682485.jpg	GOLDENGATE-010701	mw	0	2023-07-01 05:48:49	2023-07-01 05:48:49	0
91	50	4.6	3	1688196555649fd5cb3b4b9.jpg	GOLDENGATE-010705	mw	0	2023-07-01 07:29:33	2023-07-01 07:29:33	0
92	51	6.7	3	1688199874649fe2c27eb97.jpg	GOLDENGATE-010708	mw	0	2023-07-01 08:25:23	2023-07-01 08:25:23	0
93	51	3.80	3	1688199834649fe29a31f56.jpg	GOLDENGATE-010707	mw	0	2023-07-01 08:25:23	2023-07-01 08:25:23	0
94	51	3.3	3	1688199793649fe27149bf6.jpg	GOLDENGATE-010706	mw	0	2023-07-01 08:25:23	2023-07-01 08:25:23	0
95	52	1.6	3	1688201099649fe78bd14cb.jpg	GOLDENGATE-010714	mw	0	2023-07-01 08:45:20	2023-07-01 08:45:20	0
96	52	1.1	3	1688201056649fe7604c287.jpg	GOLDENGATE-010713	mw	0	2023-07-01 08:45:20	2023-07-01 08:45:20	0
97	52	1.2	3	1688201006649fe72e2a271.jpg	GOLDENGATE-010712	mw	0	2023-07-01 08:45:20	2023-07-01 08:45:20	0
98	52	1.8	3	1688200945649fe6f1a6248.jpg	GOLDENGATE-010711	mw	0	2023-07-01 08:45:20	2023-07-01 08:45:20	0
99	52	1.4	3	1688200904649fe6c835c44.jpg	GOLDENGATE-010710	mw	0	2023-07-01 08:45:20	2023-07-01 08:45:20	0
100	52	1.7	3	1688200854649fe696d1fc3.jpg	GOLDENGATE-010709	mw	0	2023-07-01 08:45:20	2023-07-01 08:45:20	0
101	53	7.1	3	1688202965649feed56b4c3.jpg	GOLDENGATE-010715	mw	0	2023-07-01 09:16:26	2023-07-01 09:16:26	0
102	54	5.2	3	1688204573649ff51dd914c.jpg	GOLDENGATE-010716	mw	0	2023-07-01 09:43:43	2023-07-01 09:43:43	0
103	55	1.8	3	168820913564a006efcdef0.jpg	GOLDENGATE-010721	mw	0	2023-07-01 10:59:09	2023-07-01 10:59:09	0
104	55	3.3	3	168820908464a006bce6f94.jpg	GOLDENGATE-010720	mw	0	2023-07-01 10:59:09	2023-07-01 10:59:09	0
105	55	1.4	3	168820905464a0069e3a6f0.jpg	GOLDENGATE-010719	mw	0	2023-07-01 10:59:09	2023-07-01 10:59:09	0
106	55	3.4	3	168820898564a00659f2010.jpg	GOLDENGATE-010718	mw	0	2023-07-01 10:59:09	2023-07-01 10:59:09	0
107	55	4.1	3	168820895564a0063b31b62.jpg	GOLDENGATE-010717	mw	0	2023-07-01 10:59:09	2023-07-01 10:59:09	0
108	56	15	3	168821763764a0282529149.jpg	GOLDENGATE-0103	Mww	0	2023-07-01 13:20:54	2023-07-01 13:20:54	0
109	56	12	3	168821759764a027fde16b2.jpg	GOLDENGATE-0102	Mww	0	2023-07-01 13:20:54	2023-07-01 13:20:54	0
110	57	5.70	3	168826986764a0f42baad00.jpg	GOLDENGATE-010756	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
111	57	1.20	3	168826982864a0f404c9f50.jpg	GOLDENGATE-010771	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
112	57	1.20	3	168826979364a0f3e123e51.jpg	GOLDENGATE-010765	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
113	57	2.70	3	168826976464a0f3c4c1325.jpg	GOLDENGATE-010766	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
114	57	3.90	3	168826972464a0f39c13048.jpg	GOLDENGATE-010772	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
115	57	4.70	3	168826968964a0f3790ce65.jpg	GOLDENGATE-010755	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
116	57	2.80	3	168826964564a0f34ddbe37.jpg	GOLDENGATE-010751	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
117	57	2.60	3	168826961064a0f32a4e0e8.jpg	GOLDENGATE-010738	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
118	57	1	3	168826957864a0f30a60375.jpg	GOLDENGATE-010750	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
119	57	2.80	3	168826953264a0f2dc84a93.jpg	GOLDENGATE-010749	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
120	57	4.60	3	168826949964a0f2bb03b3f.jpg	GOLDENGATE-010759	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
121	57	3.40	3	168826944064a0f28083a78.jpg	GOLDENGATE-010758	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
122	57	1.40	3	168826938464a0f248700e1.jpg	GOLDENGATE-010757	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
123	57	3.80	3	168826934764a0f223f1668.jpg	GOLDENGATE-010752	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
124	57	1	3	168826931564a0f2032d9de.jpg	GOLDENGATE-010754	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
125	57	5	3	168826927764a0f1dd10c5e.jpg	GOLDENGATE-010744	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
126	57	4.10	3	168826924464a0f1bc72b81.jpg	GOLDENGATE-010753	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
127	57	5	3	168826919864a0f18e3f71a.jpg	GOLDENGATE-010760	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
128	57	1.10	3	168826915564a0f1632ca64.jpg	10472781	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
129	57	2.70	3	168826911564a0f13b2539c.jpg	14256837	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
130	57	2.30	3	168826907864a0f1167e3b8.jpg	GOLDENGATE-010739	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
131	57	2.40	3	168826903564a0f0ebd154c.jpg	GOLDENGATE-010745	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
132	57	3.80	3	168826901264a0f0d42a840.jpg	GOLDENGATE-010746	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
133	57	4.40	3	168826898464a0f0b8954ce.jpg	GOLDENGATE-010740	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
134	57	4.70	3	168826894364a0f08f33637.jpg	04976455	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
135	57	3.10	3	168826890764a0f06b796f0.jpg	GOLDENGATE-010741	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
136	57	5.60	3	168826886364a0f03f475fb.jpg	GOLDENGATE-010742	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
137	57	6.20	3	168826883064a0f01eb291d.jpg	GOLDENGATE-010748	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
138	57	1.10	3	168826874864a0efcc9ff0c.jpg	GOLDENGATE-010729	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
139	57	3.20	3	168826871864a0efaebd51c.jpg	GOLDENGATE-010730	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
140	57	2.90	3	168826866664a0ef7a43637.jpg	GOLDENGATE-010736	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
141	57	1.30	3	168826862964a0ef55dff1f.jpg	GOLDENGATE-010735	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
142	57	4.10	3	168826859864a0ef3697dfb.jpg	GOLDENGATE-010734	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
143	57	6.70	3	168826855864a0ef0edbe73.jpg	GOLDENGATE-010728	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
144	57	2.20	3	168826850164a0eed5c23c5.jpg	GOLDENGATE-010733	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
145	57	2.80	3	168826847064a0eeb6d161b.jpg	GOLDENGATE-010727	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
146	57	4.50	3	168826844264a0ee9a565ae.jpg	GOLDENGATE-010726	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
147	57	2	3	168826835264a0ee408b299.jpg	GOLDENGATE-010732	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
148	57	3.20	3	168826828164a0edf9d2cf8.jpg	GOLDENGATE-010725	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
149	57	4.40	3	168826824064a0edd03cb93.jpg	GOLDENGATE-010731	Mw	0	2023-07-02 03:51:37	2023-07-02 03:51:37	0
150	58	0.80	3	168827062664a0f7221e8f4.jpg	11612674	Mw	0	2023-07-02 04:07:18	2023-07-02 04:07:18	0
151	58	3	3	168827058964a0f6fd3a5ab.jpg	61252738	Mw	0	2023-07-02 04:07:18	2023-07-02 04:07:18	0
152	58	6.80	3	168827055064a0f6d6281a5.jpg	GOLDENGATE-010764	Mw	0	2023-07-02 04:07:18	2023-07-02 04:07:18	0
153	59	4.20	3	168827712264a11082bb3e7.jpg	GOLDENGATE-010773	Mw	0	2023-07-02 05:53:16	2023-07-02 05:53:16	0
154	60	7.60	3	168827912864a11858c906b.jpg	GOLDENGATE-010722	Mw	0	2023-07-02 06:26:30	2023-07-02 06:26:30	0
155	61	6.20	3	168828039064a11d4641e25.jpg	GOLDENGATE-010778	Mw	0	2023-07-02 06:48:18	2023-07-02 06:48:18	0
156	62	3.20	3	168828284364a126db83c41.jpg	GOLDENGATE-010762	Mw	0	2023-07-02 07:29:03	2023-07-02 07:29:03	0
157	62	3.65	3	168828278164a1269db2a27.jpg	GOLDENGATE-010763	Mw	0	2023-07-02 07:29:03	2023-07-02 07:29:03	0
158	63	2.10	3	168828461364a12dc56d11d.jpg	GOLDENGATE-010775	Mw	0	2023-07-02 07:57:21	2023-07-02 07:57:21	0
159	63	1.80	3	168828454164a12d7dc0eb6.jpg	GOLDENGATE-010774	Mw	0	2023-07-02 07:57:21	2023-07-02 07:57:21	0
160	63	2.40	3	168828449464a12d4e51994.jpg	GOLDENGATE-010779	Mw	0	2023-07-02 07:57:21	2023-07-02 07:57:21	0
161	63	1.50	3	168828434564a12cb984e93.jpg	GOLDENGATE-010761	Mw	0	2023-07-02 07:57:21	2023-07-02 07:57:21	0
162	63	1.70	3	168828429564a12c87cd876.jpg	GOLDENGATE-010767	Mw	0	2023-07-02 07:57:21	2023-07-02 07:57:21	0
163	63	0.58	3	168828423864a12c4e9652b.jpg	GOLDENGATE-010768	Mw	0	2023-07-02 07:57:21	2023-07-02 07:57:21	0
164	64	5.50	3	168828580764a1326f696c7.jpg	GOLDENGATE-010781	Mw	0	2023-07-02 08:18:56	2023-07-02 08:18:56	0
165	64	3.40	3	168828577664a1325068a69.jpg	GOLDENGATE-010777	Mw	0	2023-07-02 08:18:56	2023-07-02 08:18:56	0
166	64	4.60	3	168828573064a1322239ecd.jpg	GOLDENGATE-010776	Mw	0	2023-07-02 08:18:56	2023-07-02 08:18:56	0
167	64	4.60	3	168828566064a131dcf19b5.jpg	GOLDENGATE-010780	Mw	0	2023-07-02 08:18:56	2023-07-02 08:18:56	0
168	65	11.10	3	168835537864a2423224676.jpg	GOLDENGATE-0107142	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
169	65	9.90	3	168835534064a2420c816f8.jpg	GOLDENGATE-0107135	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
170	65	11	3	168835531264a241f044fb3.jpg	GOLDENGATE-0107136	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
171	65	4.50	3	168835527664a241cc432ed.jpg	GOLDENGATE-0107137	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
172	65	5.20	3	168835524364a241ab5156a.jpg	GOLDENGATE-0107143	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
173	65	3.80	3	168835520864a241884b4d9.jpg	GOLDENGATE-0107139	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
174	65	1.50	3	168835517464a24166af56f.jpg	GOLDENGATE-0107149	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
175	65	4.90	3	168835514064a24144c373c.jpg	GOLDENGATE-0107134	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
176	65	1.70	3	168835506464a240f85387d.jpg	GOLDENGATE-0107141	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
177	65	6.50	3	168835501364a240c55e329.jpg	GOLDENGATE-0107140	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
178	65	9.10	3	168835497864a240a2c2fb4.jpg	03102886	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
179	65	7.70	3	168835492864a24070e1503.jpg	GOLDENGATE-0107131	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
180	65	3.10	3	168835489464a2404ebe84b.jpg	GOLDENGATE-0107133	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
181	65	2	3	168835485764a24029c5c51.jpg	GOLDENGATE-0107138	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
182	65	5.30	3	168835481564a23fffe4689.jpg	GOLDENGATE-0107130	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
183	65	0.50	3	168835478864a23fe40fd6e.jpg	GOLDENGATE-0107125	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
184	65	4.80	3	168835474664a23fba37e2f.jpg	GOLDENGATE-0107124	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
185	65	3.40	3	168835471864a23f9e43a59.jpg	GOLDENGATE-0107129	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
186	65	3.80	3	168835465864a23f6204a75.jpg	GOLDENGATE-0107121	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
187	65	2.50	3	168835462464a23f4067851.jpg	GOLDENGATE-0107120	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
188	65	4.30	3	168835459464a23f22aeaf0.jpg	GOLDENGATE-0107122	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
189	65	2.30	3	168835456664a23f06bb6d0.jpg	GOLDENGATE-0107123	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
190	65	1.40	3	168835452264a23edacf608.jpg	GOLDENGATE-0107128	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
191	65	0.90	3	168835449364a23ebdb548c.jpg	GOLDENGATE-0107127	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
192	65	0.80	3	168835445764a23e99c4d0c.jpg	6437821627187	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
193	65	1.90	3	168835441764a23e715bed9.jpg	GOLDENGATE-010796	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
194	65	2.40	3	168835438364a23e4f6fc22.jpg	GOLDENGATE-0107104	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
195	65	5.10	3	168835434064a23e2414a11.jpg	GOLDENGATE-0107103	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
196	65	0.50	3	168835431264a23e084d43f.jpg	GOLDENGATE-0107110	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
197	65	1.20	3	168835427864a23de68d5a8.jpg	GOLDENGATE-0107113	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
198	65	3.80	3	168835424464a23dc48e6eb.jpg	GOLDENGATE-0107106	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
199	65	1.40	3	168835419764a23d9572945.jpg	GOLDENGATE-0107107	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
200	65	3.80	3	168835414964a23d6553082.jpg	GOLDENGATE-0107105	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
201	65	5.40	3	168835410064a23d34d21ed.jpg	GOLDENGATE-0107102	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
202	65	4.60	3	168835406564a23d110e003.jpg	GOLDENGATE-0107118	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
203	65	3.30	3	168835403264a23cf04d1c1.jpg	21128882	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
204	65	4.90	3	168835399864a23cce92643.jpg	GOLDENGATE-0107116	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
205	65	0.40	3	168835397064a23cb20c7f3.jpg	GOLDENGATE-0107109	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
206	65	3.50	3	168835394064a23c9436ede.jpg	GOLDENGATE-010799	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
207	65	2.50	3	168835390364a23c6f88a43.jpg	GOLDENGATE-010798	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
208	65	3.10	3	168835387464a23c5255620.jpg	GOLDENGATE-0107101	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
209	65	2.80	3	168835381764a23c1939b4d.jpg	GOLDENGATE-010797	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
210	65	3.40	3	168835377264a23beca697f.jpg	GOLDENGATE-0107100	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
211	65	4.30	3	168835373464a23bc66c953.jpg	GOLDENGATE-0107115	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
212	65	3.90	3	168835368864a23b982149e.jpg	GOLDENGATE-0107114	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
213	65	1.10	3	168835362264a23b56bb4e3.jpg	GOLDENGATE-0107108	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
214	65	1.70	3	168835358064a23b2c3a189.jpg	GOLDENGATE-0107117	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
215	65	3.80	3	168835354064a23b04e1896.jpg	GOLDENGATE-0107111	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
216	65	5	3	168835350664a23ae2a2b77.jpg	GOLDENGATE-0107112	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
217	65	1.60	3	168835347464a23ac2b6978.jpg	GOLDENGATE-010782	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
218	65	6.70	3	168835342464a23a90d0376.jpg	GOLDENGATE-0107119	Mw	0	2023-07-03 03:37:24	2023-07-03 03:37:24	0
219	66	1	3	168835621864a2457a922f7.jpg	GOLDENGATE-0107151	Mw	0	2023-07-03 03:50:51	2023-07-03 03:50:51	0
220	66	0.80	3	168835619064a2455e89031.jpg	GOLDENGATE-0107145	Mw	0	2023-07-03 03:50:51	2023-07-03 03:50:51	0
221	66	3.20	3	168835615164a24537868c1.jpg	GOLDENGATE-0107146	Mw	0	2023-07-03 03:50:51	2023-07-03 03:50:51	0
222	66	7.60	3	168835609464a244fee2718.jpg	10226827	Mw	0	2023-07-03 03:50:51	2023-07-03 03:50:51	0
223	66	5.90	3	168835605064a244d278f0e.jpg	GOLDENGATE-0107150	Mw	0	2023-07-03 03:50:51	2023-07-03 03:50:51	0
224	67	3.90	3	168836359064a2624619e96.jpg	GOLDENGATE-0107147	Mw	0	2023-07-03 05:54:27	2023-07-03 05:54:27	0
225	67	2.80	3	168836354964a2621d51581.jpg	GOLDENGATE-010784	Mw	0	2023-07-03 05:54:27	2023-07-03 05:54:27	0
226	67	2.30	3	168836347964a261d7cd140.jpg	GOLDENGATE-0107148	Mw	0	2023-07-03 05:54:27	2023-07-03 05:54:27	0
227	67	2.30	3		GOLDENGATE-0107154	Mw	0	2023-07-03 05:54:27	2023-07-03 05:54:27	0
228	67	4.30	3	168836311264a26068a4e3d.jpg	GOLDENGATE-0107153	Mw	0	2023-07-03 05:54:27	2023-07-03 05:54:27	0
229	67	3	3		GOLDENGATE-0107152	Mw	0	2023-07-03 05:54:27	2023-07-03 05:54:27	0
230	68	9.30	3	168836493864a2678a3e65c.jpg	GOLDENGATE-010785	Mw	0	2023-07-03 06:17:42	2023-07-03 06:17:42	0
231	69	1.80	3	168836779964a272b7d9728.jpg	GOLDENGATE-010790	Mw	0	2023-07-03 07:03:52	2023-07-03 07:03:52	0
232	69	3.50	3	168836775664a2728c6b547.jpg	GOLDENGATE-010792	Mw	0	2023-07-03 07:03:52	2023-07-03 07:03:52	0
233	69	4.20	3	168836772964a2727129291.jpg	GOLDENGATE-010791	Mw	0	2023-07-03 07:03:52	2023-07-03 07:03:52	0
234	70	2	3	168836886164a276dd37efc.jpg	GOLDENGATE-010786	Mw	0	2023-07-03 07:22:01	2023-07-03 07:22:01	0
235	70	5.60	3	168836882964a276bda82fd.jpg	GOLDENGATE-010793	Mw	0	2023-07-03 07:22:01	2023-07-03 07:22:01	0
236	71	3.50	3	168837113064a27fba65138.jpg	GOLDENGATE-010787	Mw	0	2023-07-03 08:00:23	2023-07-03 08:00:23	0
237	71	8.80	3	168837109364a27f9533b4b.jpg	GOLDENGATE-010788	Mw	0	2023-07-03 08:00:23	2023-07-03 08:00:23	0
238	72	1.10	3	168844168764a3935738a49.jpg	GOLDENGATE-0107187	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
239	72	1.10	3	168844163364a39321b4c86.jpg	GOLDENGATE-0107158	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
240	72	1	3	168844160064a393000fba2.jpg	GOLDENGATE-0107238	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
241	72	2.80	3	168844156164a392d9b8784.jpg	GOLDENGATE-0107232	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
242	72	4	3	168844153064a392ba07304.jpg	GOLDENGATE-0107236	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
243	72	1.20	3	168844149064a3929278fae.jpg	GOLDENGATE-0107186	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
244	72	3.80	3	168844146064a39274d6b8b.jpg	GOLDENGATE-0107228	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
245	72	2.60	3	168844143164a392571cd18.jpg	GOLDENGATE-0107160	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
246	72	0.60	3	168844139564a3923382da3.jpg	GOLDENGATE-0107179	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
247	72	1.30	3	168844136164a3921143182.jpg	14991172	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
248	72	1.40	3	168844131664a391e4e201c.jpg	GOLDENGATE-0107235	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
249	72	6.10	3	168844126864a391b42d4b3.jpg	GOLDENGATE-0107157	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
250	72	8.20	3	168844122464a3918870cb2.jpg	GOLDENGATE-0107178	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
251	72	2.90	3	168844117864a3915ae9c4e.jpg	GOLDENGATE-0107229	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
252	72	5.80	3	168844114864a3913cd344a.jpg	GOLDENGATE-0107156	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
253	72	7.70	3	168844109164a39103b6f26.jpg	GOLDENGATE-0107237	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
254	72	1.50	3	168844102164a390bd3a4cc.jpg	GOLDENGATE-0107180	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
255	72	2	3	168844098764a3909ba0926.jpg	GOLDENGATE-0107185	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
256	72	6.10	3	168844094564a39071a03f4.jpg	GOLDENGATE-0107233	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
257	72	2.60	3	168844088664a390368435e.jpg	GOLDENGATE-0107231	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
258	72	4.70	3	168844084864a39010ab944.jpg	GOLDENGATE-0107230	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
259	72	1.60	3	168844081164a38feb0cc83.jpg	GOLDENGATE-0107234	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
260	72	3.40	3	168844077664a38fc895af6.jpg	GOLDENGATE-0107227	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
261	72	2.80	3	168844074664a38faa08e84.jpg	GOLDENGATE-0107161	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
262	72	3.80	3	168844069964a38f7b1cdbc.jpg	GOLDENGATE-0107155	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
263	72	6.40	3	168844065364a38f4d143ce.jpg	GOLDENGATE-0107162	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
264	72	1.40	3	168844061864a38f2ae15c8.jpg	GOLDENGATE-0107163	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
265	72	2.90	3	168844059164a38f0f3a9a4.jpg	GOLDENGATE-0107164	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
266	72	2.70	3	168844055464a38eeae6a1c.jpg	GOLDENGATE-0107159	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
267	72	2.60	3	168844052264a38ecad2a22.jpg	GOLDENGATE-0107166	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
268	72	4.60	3	168844048464a38ea475c92.jpg	GOLDENGATE-0107172	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
269	72	2.50	3	168844044364a38e7b07131.jpg	GOLDENGATE-0107167	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
270	72	4.30	3	168844041364a38e5ddf4f5.jpg	GOLDENGATE-010789	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
271	72	3.80	3	168844036764a38e2fbacd9.jpg	GOLDENGATE-010795	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
272	72	6.10	3	168844034264a38e1607b9b.jpg	GOLDENGATE-0107175	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
273	72	5.30	3	168844028264a38dda960d2.jpg	3190604876686	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
274	72	2.40	3	168844025064a38dba8478f.jpg	GOLDENGATE-0107170	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
275	72	2.80	3	168844021564a38d97a058b.jpg	GOLDENGATE-0107173	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
276	72	2.10	3	168844017464a38d6e8c825.jpg	GOLDENGATE-0107174	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
277	72	2.60	3	168844013264a38d447daa0.jpg	GOLDENGATE-0107169	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
278	72	3.70	3	168844010064a38d242e6e5.jpg	11079781	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
279	72	3.60	3	168844005964a38cfbe20f0.jpg	6582302333856	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
280	72	8.40	3	168844000264a38cc2be792.jpg	GOLDENGATE-0107176	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
281	72	3.10	3	168843994964a38c8d47e89.jpg	11635185	Mw	0	2023-07-04 03:36:41	2023-07-04 03:36:41	0
282	73	1	3	168844254764a396b39591d.jpg	GOLDENGATE-0107182	Mw	0	2023-07-04 03:49:44	2023-07-04 03:49:44	0
283	73	0.80	3	168844251864a396967e55e.jpg	11271731	Mw	0	2023-07-04 03:49:44	2023-07-04 03:49:44	0
284	73	3.60	3	168844248264a39672c5cb7.jpg	GOLDENGATE-0107183	Mw	0	2023-07-04 03:49:44	2023-07-04 03:49:44	0
285	73	6.10	3	168844232564a395d5db5f4.jpg	11274631	Mw	0	2023-07-04 03:49:44	2023-07-04 03:49:44	0
286	73	3	3	168844228264a395aa757c1.jpg	GOLDENGATE-0107181	Mw	0	2023-07-04 03:49:44	2023-07-04 03:49:44	0
287	74	3.50	3	168844865564a3ae8f890f4.jpg	GOLDENGATE-0107184	Mw	0	2023-07-04 05:32:17	2023-07-04 05:32:17	0
288	74	2.20	3	168844861964a3ae6b6cbeb.jpg	GOLDENGATE-0107190	Mw	0	2023-07-04 05:32:17	2023-07-04 05:32:17	0
289	75	3.10	3	168844998064a3b3bc80ea1.jpg	01891734	Mw	0	2023-07-04 05:53:17	2023-07-04 05:53:17	0
290	75	2.80	3	168844995464a3b3a2cc65c.jpg	GOLDENGATE-0107195	Mw	0	2023-07-04 05:53:17	2023-07-04 05:53:17	0
291	75	2.10	3	168844990864a3b374489a8.jpg	GOLDENGATE-0107201	Mw	0	2023-07-04 05:53:17	2023-07-04 05:53:17	0
292	75	3.90	3	168844987064a3b34e9678f.jpg	GOLDENGATE-0107202	Mw	0	2023-07-04 05:53:17	2023-07-04 05:53:17	0
293	75	2.80	3	168844983164a3b3278db9f.jpg	GOLDENGATE-0107196	Mw	0	2023-07-04 05:53:17	2023-07-04 05:53:17	0
294	76	5.70	3	168845126464a3b8c081b25.jpg	GOLDENGATE-0107193	Mw	0	2023-07-04 06:15:26	2023-07-04 06:15:26	0
295	77	1.70	3	168845325964a3c08b00524.jpg	GOLDENGATE-0107194	Mw	0	2023-07-04 06:47:59	2023-07-04 06:47:59	0
296	77	5.20	3	168845320564a3c05564306.jpg	GOLDENGATE-0107199	Mw	0	2023-07-04 06:47:59	2023-07-04 06:47:59	0
297	78	2	3	168845514764a3c7ebdc0e1.jpg	GOLDENGATE-0107197	Mw	0	2023-07-04 07:21:44	2023-07-04 07:21:44	0
298	78	1.30	3	168845511864a3c7cef078f.jpg	GOLDENGATE-0107191	Mw	0	2023-07-04 07:21:44	2023-07-04 07:21:44	0
299	78	1.40	3	168845508264a3c7aaf0064.jpg	GOLDENGATE-0107198	Mw	0	2023-07-04 07:21:44	2023-07-04 07:21:44	0
300	78	1.70	3	168845504764a3c7873094f.jpg	GOLDENGATE-0107192	Mw	0	2023-07-04 07:21:44	2023-07-04 07:21:44	0
301	79	1.60	3	168845847064a3d4e6b3e0a.jpg	GOLDENGATE-0107221	Mw	0	2023-07-04 08:16:18	2023-07-04 08:16:18	0
302	79	3.80	3	168845825564a3d40f576a4.jpg	GOLDENGATE-0107214	Mw	0	2023-07-04 08:16:18	2023-07-04 08:16:18	0
303	79	2.90	3	168845822364a3d3ef88615.jpg	GOLDENGATE-0107208	Mw	0	2023-07-04 08:16:18	2023-07-04 08:16:18	0
304	79	3.40	3	168845818964a3d3cdeb255.jpg	07427169	Mw	0	2023-07-04 08:16:18	2023-07-04 08:16:18	0
305	79	2.30	3	168845816364a3d3b341dda.jpg	GOLDENGATE-0107205	Mw	0	2023-07-04 08:16:18	2023-07-04 08:16:18	0
306	79	2.80	3	168845812564a3d38d2da9f.jpg	GOLDENGATE-0107206	Mw	0	2023-07-04 08:16:18	2023-07-04 08:16:18	0
307	79	3.40	3	168845809664a3d37013be7.jpg	GOLDENGATE-0107203	Mw	0	2023-07-04 08:16:18	2023-07-04 08:16:18	0
308	79	3.10	3	168845806064a3d34c95c4a.jpg	GOLDENGATE-0107213	Mw	0	2023-07-04 08:16:18	2023-07-04 08:16:18	0
309	79	2.50	3	168845803464a3d33216bdd.jpg	GOLDENGATE-0107210	Mw	0	2023-07-04 08:16:18	2023-07-04 08:16:18	0
310	79	0.80	3	168845799964a3d30fc7df2.jpg	GOLDENGATE-0107211	Mw	0	2023-07-04 08:16:18	2023-07-04 08:16:18	0
311	79	6.10	3	168845796964a3d2f16b341.jpg	GOLDENGATE-0107212	Mw	0	2023-07-04 08:16:18	2023-07-04 08:16:18	0
312	79	3.60	3	168845793464a3d2ce96e68.jpg	GOLDENGATE-0107204	Mw	0	2023-07-04 08:16:18	2023-07-04 08:16:18	0
313	79	5.20	3	168845790664a3d2b2c3625.jpg	GOLDENGATE-0107209	Mw	0	2023-07-04 08:16:18	2023-07-04 08:16:18	0
314	80	1.80	3	168846250464a3e4a8a78a0.jpg	GOLDENGATE-0107215	Mw	0	2023-07-04 09:23:41	2023-07-04 09:23:41	0
315	81	3.70	3	168847638164a41add1c345.jpg	GOLDENGATE-0107216	Mw	0	2023-07-04 13:15:03	2023-07-04 13:15:03	0
316	82	090	3	168852896764a4e847a1efc.jpg	GOLDENGATE-0107264	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
317	82	3.80	3	168852894064a4e82cd62fa.jpg	GOLDENGATE-0107265	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
318	82	4.10	3	168852888664a4e7f6ce7c0.jpg	GOLDENGATE-0107263	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
319	82	2.90	3	168852885764a4e7d9ba36f.jpg	GOLDENGATE-0107258	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
320	82	2.70	3	168852881564a4e7afc5ce7.jpg	GOLDENGATE-0107260	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
321	82	5.20	3	168852878264a4e78e4c1a3.jpg	GOLDENGATE-0107257	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
322	82	8.50	3	168852874864a4e76c04035.jpg	GOLDENGATE-0107262	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
323	82	2	3	168852870564a4e74111c91.jpg	GOLDENGATE-0107261	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
324	82	3.10	3	168852867064a4e71e7b6f6.jpg	GOLDENGATE-0107259	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
325	82	4.10	3	168852862964a4e6f5c9af9.jpg	GOLDENGATE-0107256	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
326	82	5.30	3	168852857264a4e6bc91334.jpg	GOLDENGATE-0107254	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
327	82	3.30	3	168852852464a4e68c7e0de.jpg	GOLDENGATE-0107255	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
328	82	4	3	168852848864a4e668ab204.jpg	GOLDENGATE-0107253	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
329	82	2.60	3	168852844264a4e63a7caf3.jpg	08009614	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
330	82	4.10	3	168852840764a4e61776c35.jpg	GOLDENGATE-0107251	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
331	82	4	3	168852836564a4e5ed6269f.jpg	GOLDENGATE-0107249	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
332	82	4.10	3	168852833164a4e5cb63aa3.jpg	15753348	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
333	82	2.40	3	168852829864a4e5aa1d305.jpg	GOLDENGATE-0107246	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
334	82	3.60	3	168852824964a4e579832f7.jpg	01118037	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
335	82	3	3	168852821164a4e553be39c.jpg	GOLDENGATE-0107247	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
336	82	4	3	168852818364a4e53726332.jpg	GOLDENGATE-0107250	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
337	82	3.10	3	168852813664a4e50833171.jpg	GOLDENGATE-0107244	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
338	82	3.10	3	168852808964a4e4d9bfb08.jpg	GOLDENGATE-0107243	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
339	82	0.90	3	168852805264a4e4b42687f.jpg	GOLDENGATE-0107242	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
340	82	4.20	3	168852801464a4e48e07a1a.jpg	GOLDENGATE-0107241	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
341	82	4.10	3	168852795264a4e4504c07a.jpg	GOLDENGATE-0107240	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
342	82	3.90	3	168852789864a4e41af3acd.jpg	GOLDENGATE-0107239	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
343	82	3.10	3	168852754364a4e2b716521.jpg	GOLDENGATE-0107219	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
344	82	4.90	3	168852750464a4e29041c9e.jpg	GOLDENGATE-0107226	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
345	82	5.80	3	168852745564a4e25fc4453.jpg	GOLDENGATE-0107225	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
346	82	5.80	3	168852735664a4e1fc66a25.jpg	GOLDENGATE-0107222	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
347	82	1	3	168852727164a4e1a7dd1ef.jpg	GOLDENGATE-0107224	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
348	82	2.40	3	168852724264a4e18a929e2.jpg	17624735	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
349	82	3.50	3	168852720564a4e165bdc40.jpg	GOLDENGATE-0107218	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
350	82	0.80	3	168852716964a4e14131487.jpg	GOLDENGATE-0107223	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
351	82	1.90	3	168852713664a4e1205c511.jpg	GOLDENGATE-0107217	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
352	82	4.70	3	168852708964a4e0f190da7.jpg	GOLDENGATE-0107220	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
353	82	2.40	3	168852702364a4e0afb68a2.jpg	11567172	Mw	0	2023-07-05 03:49:41	2023-07-05 03:49:41	0
354	83	3.50	3	168852978964a4eb7d2eff3.jpg	GOLDENGATE-0107268	Mw	0	2023-07-05 04:03:43	2023-07-05 04:03:43	0
355	83	0.90	3	168852976364a4eb6318510.jpg	GOLDENGATE-0107269	Mw	0	2023-07-05 04:03:43	2023-07-05 04:03:43	0
356	83	7.20	3	168852972464a4eb3c8c3d9.jpg	GOLDENGATE-0107267	Mw	0	2023-07-05 04:03:43	2023-07-05 04:03:43	0
357	83	0.80	3	168852968964a4eb1941ed0.jpg	GOLDENGATE-0107266	Mw	0	2023-07-05 04:03:43	2023-07-05 04:03:43	0
358	84	4.20	3	168853651464a505c2e0f7a.jpg	19439813	Mw	0	2023-07-05 05:57:30	2023-07-05 05:57:30	0
359	84	3.40	3	168853644064a50578d0cdf.jpg	GOLDENGATE-0107281	Mw	0	2023-07-05 05:57:30	2023-07-05 05:57:30	0
360	84	2.90	3	168853639564a5054b101a3.jpg	GOLDENGATE-0107280	Mw	0	2023-07-05 05:57:30	2023-07-05 05:57:30	0
361	84	3.20	3	168853635564a5052334b9e.jpg	GOLDENGATE-0107279	Mw	0	2023-07-05 05:57:30	2023-07-05 05:57:30	0
362	84	1.90	3	168853629864a504eab91b5.jpg	GOLDENGATE-0107278	Mw	0	2023-07-05 05:57:30	2023-07-05 05:57:30	0
363	84	1.30	3	168853626164a504c5e7eb3.jpg	GOLDENGATE-0107277	Mw	0	2023-07-05 05:57:30	2023-07-05 05:57:30	0
364	84	1.50	3	168853621164a50493c2ed4.jpg	GOLDENGATE-0107276	Mw	0	2023-07-05 05:57:30	2023-07-05 05:57:30	0
365	84	1.60	3	168853616164a504612334d.jpg	GOLDENGATE-0107275	Mw	0	2023-07-05 05:57:30	2023-07-05 05:57:30	0
366	85	4.60	3	168853814364a50c1f06d87.jpg	GOLDENGATE-0107285	Mw	0	2023-07-05 06:23:33	2023-07-05 06:23:33	0
367	85	3.80	3	168853810464a50bf8c8572.jpg	GOLDENGATE-0107284	Mw	0	2023-07-05 06:23:33	2023-07-05 06:23:33	0
368	85	5.90	3	168853806164a50bcd78e32.jpg	GOLDENGATE-0107283	Mw	0	2023-07-05 06:23:33	2023-07-05 06:23:33	0
369	85	6	3	168853800864a50b9831867.jpg	GOLDENGATE-0107286	Mw	0	2023-07-05 06:23:33	2023-07-05 06:23:33	0
370	86	5.40	3	168853892864a50f30e1325.jpg	GOLDENGATE-0107287	Mw	0	2023-07-05 06:35:44	2023-07-05 06:35:44	0
371	87	1.40	3	168854049164a5154b8456c.jpg	GOLDENGATE-0107392	Mw	0	2023-07-05 07:02:52	2023-07-05 07:02:52	0
372	87	5	3	168854044564a5151dd5d75.jpg	GOLDENGATE-0107394	Mw	0	2023-07-05 07:02:52	2023-07-05 07:02:52	0
373	87	3.60	3	168854042364a515074318f.jpg	GOLDENGATE-0107393	Mw	0	2023-07-05 07:02:52	2023-07-05 07:02:52	0
374	87	6.20	3	168854039264a514e866214.jpg	GOLDENGATE-0107388	Mw	0	2023-07-05 07:02:52	2023-07-05 07:02:52	0
375	87	5.20	3	168854035164a514bf43bbd.jpg	GOLDENGATE-0107387	Mw	0	2023-07-05 07:02:52	2023-07-05 07:02:52	0
376	87	6.10	3	168854029064a51482aed6e.jpg	GOLDENGATE-0107385	Mw	0	2023-07-05 07:02:52	2023-07-05 07:02:52	0
377	87	6.10	3	168854025364a5145dc1e4b.jpg	GOLDENGATE-0107386	Mw	0	2023-07-05 07:02:52	2023-07-05 07:02:52	0
378	87	4.90	3	168854021464a514368ad7f.jpg	GOLDENGATE-0107384	Mw	0	2023-07-05 07:02:52	2023-07-05 07:02:52	0
379	87	5.60	3	168854017264a5140c4f83b.jpg	GOLDENGATE-0107383	Mw	0	2023-07-05 07:02:52	2023-07-05 07:02:52	0
380	88	4.60	3	168854212864a51bb0b3bc1.jpg	GOLDENGATE-0107389	Mw	0	2023-07-05 07:29:10	2023-07-05 07:29:10	0
381	88	6.20	3	168854203664a51b5412b1e.jpg	GOLDENGATE-0107390	Mw	0	2023-07-05 07:29:10	2023-07-05 07:29:10	0
382	88	1.90	3	168854197764a51b19d3a54.jpg	18229363	Mw	0	2023-07-05 07:29:10	2023-07-05 07:29:10	0
383	89	2.80	3	168854381364a522457f3f2.jpg	14263156	Mw	0	2023-07-05 07:57:17	2023-07-05 07:57:17	0
384	89	3	3	168854377764a5222122962.jpg	GOLDENGATE-0107326	Mw	0	2023-07-05 07:57:17	2023-07-05 07:57:17	0
385	89	2.90	3	168854374364a521ffd5531.jpg	GOLDENGATE-0107325	Mw	0	2023-07-05 07:57:17	2023-07-05 07:57:17	0
386	89	2.20	3	168854366564a521b1db0e8.jpg	GOLDENGATE-0107324	Mw	0	2023-07-05 07:57:17	2023-07-05 07:57:17	0
387	89	3.30	3	168854362464a52188d6941.jpg	GOLDENGATE-0107323	Mw	0	2023-07-05 07:57:17	2023-07-05 07:57:17	0
388	90	1.70	3	168854420264a523cad32f0.jpg	GOLDENGATE-0107328	Mw	0	2023-07-05 08:03:42	2023-07-05 08:03:42	0
389	91	3.20	3	168854579664a52a048eeff.jpg	GOLDENGATE-0107331	Mw	0	2023-07-05 08:30:57	2023-07-05 08:30:57	0
390	91	5.90	3	168854574364a529cf1feb4.jpg	GOLDENGATE-0107330	Mw	0	2023-07-05 08:30:57	2023-07-05 08:30:57	0
391	91	5.50	3	168854567064a52986ab126.jpg	GOLDENGATE-0107329	Mw	0	2023-07-05 08:30:57	2023-07-05 08:30:57	0
392	92	1.80	3	168854841064a5343a579e6.jpg	GOLDENGATE-0107372	Mw	0	2023-07-05 09:14:16	2023-07-05 09:14:16	0
393	92	5.10	3	168854830964a533d5b580b.jpg	GOLDENGATE-0107377	Mw	0	2023-07-05 09:14:16	2023-07-05 09:14:16	0
394	92	5	3	168854827164a533af16bd9.jpg	GOLDENGATE-0107371	Mw	0	2023-07-05 09:14:16	2023-07-05 09:14:16	0
395	92	2.70	3	168854824064a533900be79.jpg	GOLDENGATE-0107333	Mw	0	2023-07-05 09:14:16	2023-07-05 09:14:16	0
396	92	3	3	168854819164a5335ff401c.jpg	GOLDENGATE-0107334	Mw	0	2023-07-05 09:14:16	2023-07-05 09:14:16	0
397	92	3.40	3	168854814264a5332e6615a.jpg	GOLDENGATE-0107332	Mw	0	2023-07-05 09:14:16	2023-07-05 09:14:16	0
398	93	3	3	168855251664a544444bdff.jpg	GOLDENGATE-0107374	Mw	0	2023-07-05 10:23:22	2023-07-05 10:23:22	0
399	93	4.30	3	168855247864a5441ecde1a.jpg	GOLDENGATE-0107380	Mw	0	2023-07-05 10:23:22	2023-07-05 10:23:22	0
400	93	1.20	3	168855243864a543f6d0f6c.jpg	GOLDENGATE-0107301	Mw	0	2023-07-05 10:23:22	2023-07-05 10:23:22	0
401	93	1	3	168855238264a543bedfd0a.jpg	GOLDENGATE-0107299	Mw	0	2023-07-05 10:23:22	2023-07-05 10:23:22	0
402	93	0.90	3	168855235364a543a1df19f.jpg	GOLDENGATE-0107300	Mw	0	2023-07-05 10:23:22	2023-07-05 10:23:22	0
403	93	4.70	3	168855225964a54343da73b.jpg	GOLDENGATE-0107381	Mw	0	2023-07-05 10:23:22	2023-07-05 10:23:22	0
404	93	4	3	168855220764a5430fa4894.jpg	GOLDENGATE-0107376	Mw	0	2023-07-05 10:23:22	2023-07-05 10:23:22	0
405	93	4.70	3	168855216464a542e4641a6.jpg	GOLDENGATE-0107375	Mw	0	2023-07-05 10:23:22	2023-07-05 10:23:22	0
406	93	4	3	168855212564a542bdb4869.jpg	GOLDENGATE-0107382	Mw	0	2023-07-05 10:23:22	2023-07-05 10:23:22	0
407	93	1.30	3	168855204964a5427121fbb.jpg	11610134	Mw	0	2023-07-05 10:23:22	2023-07-05 10:23:22	0
408	93	1.10	3	168855201864a54252d0183.jpg	GOLDENGATE-0107373	Mw	0	2023-07-05 10:23:22	2023-07-05 10:23:22	0
409	93	1.40	3	168855198664a5423251497.jpg	GOLDENGATE-0107378	Mw	0	2023-07-05 10:23:22	2023-07-05 10:23:22	0
410	94	5.30	3	168861451564a6367333af2.jpg	GOLDENGATE-0107369	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
411	94	3.70	3	168861448464a636543c824.jpg	GOLDENGATE-0107368	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
412	94	6.90	3	168861444064a6362814c7d.jpg	GOLDENGATE-0107367	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
413	94	7	3	168861439164a635f7e7d56.jpg	GOLDENGATE-0107366	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
414	94	5.60	3	168861434864a635cc994f7.jpg	70854404	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
415	94	5	3	168861430764a635a34447b.jpg	GOLDENGATE-0107364	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
416	94	6.40	3	168861426964a6357d491f1.jpg	GOLDENGATE-0107363	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
417	94	4.90	3	168861423864a6355ee166a.jpg	GOLDENGATE-0107362	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
418	94	1	3	168861420364a6353b85b92.jpg	10116760	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
419	94	4	3	168861417564a6351f1e908.jpg	GOLDENGATE-0107360	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
420	94	4.30	3	168861413764a634f9223ef.jpg	GOLDENGATE-0107346	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
421	94	4.20	3	168861410464a634d856c38.jpg	03630976	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
422	94	4.40	3	168861406064a634ac54328.jpg	GOLDENGATE-0107345	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
423	94	2.20	3	168861400564a634751a550.jpg	GOLDENGATE-0107344	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
424	94	3.70	3	168861396464a6344c15705.jpg	GOLDENGATE-0107343	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
425	94	4.80	3	168861393564a6342f12ff3.jpg	15851864	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
426	94	3.50	3	168861387764a633f5427f4.jpg	GOLDENGATE-0107341	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
427	94	1.40	3	168861383964a633cf8f0ac.jpg	12521388	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
428	94	2.80	3	168861377564a6338f1c36b.jpg	GOLDENGATE-0107339	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
429	94	1.80	3	168861374264a6336e9d6ed.jpg	GOLDENGATE-0107338	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
430	94	2.30	3	168861371164a6334fc2e4b.jpg	GOLDENGATE-0107337	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
431	94	4.40	3	168861367264a63328bffb8.jpg	GOLDENGATE-0107336	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
432	94	4.30	3	168861362964a632fd1f3b9.jpg	GOLDENGATE-0107335	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
433	94	3.10	3	168861360464a632e4decec.jpg	GOLDENGATE-0107322	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
434	94	4.80	3	168861354764a632abb1ab5.jpg	GOLDENGATE-0107321	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
435	94	5.60	3	168861349764a63279c021c.jpg	GOLDENGATE-0107320	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
436	94	9.30	3	168861334964a631e5acd52.jpg	GOLDENGATE-0107318	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
437	94	7.40	3	168861330564a631b9435f4.jpg	GOLDENGATE-0107317	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
438	94	4.40	3	168861326164a6318d56a14.jpg	GOLDENGATE-0107316	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
439	94	1.20	3	168861321464a6315ef0140.jpg	GOLDENGATE-0107315	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
440	94	3.50	3	168861318264a6313e330f9.jpg	GOLDENGATE-0107314	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
441	94	3.20	3	168861314364a631174082d.jpg	GOLDENGATE-0107313	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
442	94	3.80	3	168861308564a630dd76dff.jpg	GOLDENGATE-0107312	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
443	94	3.70	3	168861303564a630ab959e5.jpg	GOLDENGATE-0107311	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
444	94	6.90	3	168861300564a6308d25f78.jpg	GOLDENGATE-0107310	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
445	94	2.40	3	168861297364a6306d926a7.jpg	GOLDENGATE-0107305	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
446	94	5.90	3	168861293164a63043e8b20.jpg	GOLDENGATE-0107309	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
447	94	2.70	3	168861290164a63025c0260.jpg	GOLDENGATE-0107307	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
448	94	7.40	3	168861285864a62ffae54fb.jpg	GOLDENGATE-0107304	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
449	94	2.	3	168861280364a62fc38a25b.jpg	GOLDENGATE-0107308	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
450	94	2.10	3	168861276864a62fa0a15d7.jpg	GOLDENGATE-0107306	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
451	94	4.40	3	168861274064a62f845fad4.jpg	GOLDENGATE-0107303	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
452	94	5.40	3	168861270864a62f64de780.jpg	GOLDENGATE-0107302	Mw	0	2023-07-06 03:35:53	2023-07-06 03:35:53	0
453	95	4.30	3	168861498264a63846570b7.jpg	GOLDENGATE-0107348	Mw	0	2023-07-06 03:47:05	2023-07-06 03:47:05	0
454	95	5.90	3	168861494464a6382032377.jpg	GOLDENGATE-0107347	Mw	0	2023-07-06 03:47:05	2023-07-06 03:47:05	0
455	95	5.40	3	168861489864a637f27c704.jpg	GOLDENGATE-0107370	Mw	0	2023-07-06 03:47:05	2023-07-06 03:47:05	0
456	96	2.60	3	168861736564a64195c3631.jpg	GOLDENGATE-0107403	Mw	0	2023-07-06 04:23:29	2023-07-06 04:23:29	0
457	96	3.30	3	168861730264a64156c37a2.jpg	GOLDENGATE-0107402	Mw	0	2023-07-06 04:23:29	2023-07-06 04:23:29	0
458	96	5.10	3	168861726364a6412f4cf81.jpg	GOLDENGATE-0107401	Mw	0	2023-07-06 04:23:29	2023-07-06 04:23:29	0
459	96	4.30	3	168861721964a641035f6b4.jpg	GOLDENGATE-0107400	Mw	0	2023-07-06 04:23:29	2023-07-06 04:23:29	0
460	96	5.30	3	168861718064a640dc53190.jpg	45123085	Mw	0	2023-07-06 04:23:29	2023-07-06 04:23:29	0
461	96	4.60	3	168861712064a640a060c13.jpg	GOLDENGATE-0107398	Mw	0	2023-07-06 04:23:29	2023-07-06 04:23:29	0
462	96	4.60	3	168861706464a64068dfeb9.jpg	GOLDENGATE-0107397	Mw	0	2023-07-06 04:23:29	2023-07-06 04:23:29	0
463	96	5.60	3	168861701864a6403a7f2fa.jpg	GOLDENGATE-0107396	Mw	0	2023-07-06 04:23:29	2023-07-06 04:23:29	0
464	96	4.70	3	168861696064a64000002e9.jpg	GOLDENGATE-0107395	Mw	0	2023-07-06 04:23:29	2023-07-06 04:23:29	0
465	96	4.	3	168861672364a63f13954bd.jpg	GOLDENGATE-0107358	Mw	0	2023-07-06 04:23:29	2023-07-06 04:23:29	0
466	96	5.40	3	168861666864a63edc91774.jpg	GOLDENGATE-0107353	Mw	0	2023-07-06 04:23:29	2023-07-06 04:23:29	0
467	96	4.70	3	168861661064a63ea2b22e3.jpg	GOLDENGATE-0107357	Mw	0	2023-07-06 04:23:29	2023-07-06 04:23:29	0
468	96	4.30	3	168861656164a63e711179d.jpg	GOLDENGATE-0107356	Mw	0	2023-07-06 04:23:29	2023-07-06 04:23:29	0
469	96	5.90	3	168861651364a63e414ac13.jpg	GOLDENGATE-0107351	Mw	0	2023-07-06 04:23:29	2023-07-06 04:23:29	0
470	96	7.40	3	168861647364a63e191d416.jpg	GOLDENGATE-0107350	Mw	0	2023-07-06 04:23:29	2023-07-06 04:23:29	0
471	96	4.80	3	168861642864a63dec75689.jpg	GOLDENGATE-0107349	Mw	0	2023-07-06 04:23:29	2023-07-06 04:23:29	0
472	97	3.40	3	168862177464a652ceb921f.jpg	GOLDENGATE-0107404	Mw	0	2023-07-06 05:36:24	2023-07-06 05:36:24	0
473	98	4.50	3	168862425964a65c8305e76.jpg	GOLDENGATE-0107406	Mw	0	2023-07-06 06:22:43	2023-07-06 06:22:43	0
474	99	7.20	3	168862552764a661777134f.jpg	GOLDENGATE-0107407	Mw	0	2023-07-06 06:39:45	2023-07-06 06:39:45	0
475	100	4.70	3	168862604264a6637a5eb08.jpg	GOLDENGATE-0107413	Mw	0	2023-07-06 06:47:55	2023-07-06 06:47:55	0
476	101	4.10	3	168862811164a66b8f8c8ef.jpg	03207154	Mw	0	2023-07-06 07:23:12	2023-07-06 07:23:12	0
477	101	2.90	3	168862807164a66b67024a5.jpg	9188282368733	Mw	0	2023-07-06 07:23:12	2023-07-06 07:23:12	0
478	101	3.10	3	168862803964a66b47a91c6.jpg	10207123	Mw	0	2023-07-06 07:23:12	2023-07-06 07:23:12	0
479	101	2.60	3	168862801664a66b3043df7.jpg	GOLDENGATE-0107409	Mw	0	2023-07-06 07:23:12	2023-07-06 07:23:12	0
480	101	3	3	168862799064a66b16106f3.jpg	GOLDENGATE-0107408	Mw	0	2023-07-06 07:23:12	2023-07-06 07:23:12	0
481	102	6.70	3	168862965264a67194c8afc.jpg	GOLDENGATE-0107415	Mw	0	2023-07-06 07:55:53	2023-07-06 07:55:53	0
482	102	4.20	3	168862961164a6716bc916a.jpg	GOLDENGATE-0107414	Mw	0	2023-07-06 07:55:53	2023-07-06 07:55:53	0
483	103	2.40	3	168869963364a782f18b22c.jpg	502915766687	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
484	103	6.90	3	168869960164a782d178632.jpg	GOLDENGATE-0107449	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
485	103	2.40	3	168869955364a782a118e8c.jpg	GOLDENGATE-0107448	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
486	103	5	3	168869949564a782673a760.jpg	GOLDENGATE-0107447	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
487	103	5.30	3	168869946864a7824c5f45b.jpg	GOLDENGATE-0107446	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
488	103	3.80	3	168869943864a7822ebc65d.jpg	GOLDENGATE-0107445	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
489	103	4.40	3	168869940664a7820e8001c.jpg	GOLDENGATE-0107444	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
490	103	5.30	3	168869937164a781eb6e833.jpg	GOLDENGATE-0107443	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
491	103	2.60	3	168869933864a781caec5ef.jpg	GOLDENGATE-0107442	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
492	103	8.30	3	168869930864a781ac4fd23.jpg	GOLDENGATE-0107441	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
493	103	2.40	3	168869927864a7818e4b81f.jpg	12523887	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
494	103	6.50	3	168869924764a7816f54517.jpg	GOLDENGATE-0107439	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
495	103	3.90	3	168869921664a781504a6b8.jpg	GOLDENGATE-0107438	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
496	103	5.40	3	168869918364a7812fb3f06.jpg	GOLDENGATE-0107437	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
497	103	4	3	168869915564a78113af30f.jpg	GOLDENGATE-0107436	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
498	103	2.50	3	168869912264a780f2b97e8.jpg	GOLDENGATE-0107435	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
499	103	8.40	3	168869908964a780d1de63e.jpg	11976172	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
500	103	3.50	3	168869906564a780b92c050.jpg	GOLDENGATE-0107433	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
501	103	6.30	3	168869903464a7809a8e199.jpg	GOLDENGATE-0107432	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
502	103	5.60	3	168869899964a78077c8fe8.jpg	GOLDENGATE-0107431	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
503	103	3.60	3	168869897064a7805a473c6.jpg	GOLDENGATE-0107430	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
504	103	7.40	3	168869894364a7803fe07f7.jpg	18125184	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
505	103	5.10	3	168869891864a78026b7e96.jpg	GOLDENGATE-0107428	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
506	103	6.50	3	168869888064a78000ac8c9.jpg	GOLDENGATE-0107427	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
507	103	3.60	3	168869883864a77fd6bd62e.jpg	GOLDENGATE-0107426	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
508	103	5.40	3	168869880764a77fb7d6a1a.jpg	GOLDENGATE-0107425	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
509	103	7.20	3	168869877764a77f9965bb4.jpg	GOLDENGATE-0107424	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
510	103	8.30	3	168869874064a77f742f9c6.jpg	GOLDENGATE-0107423	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
511	103	2.40	3	168869871264a77f582cd90.jpg	GOLDENGATE-0107422	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
512	103	4.30	3	168869868564a77f3d8598c.jpg	GOLDENGATE-0107421	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
513	103	3.80	3	168869865464a77f1e15abc.jpg	GOLDENGATE-0107420	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
514	103	4.30	3	168869861064a77ef265a8d.jpg	GOLDENGATE-0107419	Mw	0	2023-07-07 03:15:17	2023-07-07 03:15:17	0
515	104	1.80	3	168870003664a7848476e30.jpg	GOLDENGATE-0107453	Mw	0	2023-07-07 03:23:36	2023-07-07 03:23:36	0
516	104	4.20	3	168869998964a784555ddab.jpg	GOLDENGATE-0107452	Mw	0	2023-07-07 03:23:36	2023-07-07 03:23:36	0
517	104	7.30	3	168869995764a784355e410.jpg	GOLDENGATE-0107451	Mw	0	2023-07-07 03:23:36	2023-07-07 03:23:36	0
518	105	5.50	3	168870134464a789a0b11d1.jpg	GOLDENGATE-0107457	Mw	0	2023-07-07 03:43:00	2023-07-07 03:43:00	0
519	105	6.60	3	168870129264a7896c0d51a.jpg	19760319	Mw	0	2023-07-07 03:43:00	2023-07-07 03:43:00	0
520	105	2.80	3		25212716	Mw	0	2023-07-07 03:43:00	2023-07-07 03:43:00	0
521	105	4.20	3	168870115464a788e21736d.jpg	GOLDENGATE-0107455	Mw	0	2023-07-07 03:43:00	2023-07-07 03:43:00	0
522	106	3.80	3	168870289764a78fb181632.jpg	GOLDENGATE-0107460	Mw	0	2023-07-07 04:09:26	2023-07-07 04:09:26	0
523	106	4.40	3	168870284964a78f81f2487.jpg	GOLDENGATE-0107461	Mw	0	2023-07-07 04:09:26	2023-07-07 04:09:26	0
524	106	4.20	3	168870279164a78f479cc43.jpg	GOLDENGATE-0107466	Mw	0	2023-07-07 04:09:26	2023-07-07 04:09:26	0
525	106	4.30	3	168870275264a78f2073543.jpg	GOLDENGATE-0107459	Mw	0	2023-07-07 04:09:26	2023-07-07 04:09:26	0
526	106	4.60	3	168870270664a78ef2b4e7d.jpg	9436039703437	Mw	0	2023-07-07 04:09:26	2023-07-07 04:09:26	0
527	107	3.60	3	168870879164a7a6b784fd6.jpg	GOLDENGATE-0107465	Mw	0	2023-07-07 05:47:34	2023-07-07 05:47:34	0
528	107	5.40	3	168870875264a7a6906062d.jpg	GOLDENGATE-0107462	Mw	0	2023-07-07 05:47:34	2023-07-07 05:47:34	0
529	108	4.60	3	168870953664a7a9a0b7902.jpg	GOLDENGATE-0107464	Mw	0	2023-07-07 06:00:29	2023-07-07 06:00:29	0
530	109	1.20	3	168871204964a7b3710a5d0.jpg	GOLDENGATE-0107487	Mw	0	2023-07-07 06:41:36	2023-07-07 06:41:36	0
531	109	2.20	3	168871198964a7b3355b016.jpg	05527991	Mw	0	2023-07-07 06:41:36	2023-07-07 06:41:36	0
532	109	1.70	3	168871192264a7b2f200c65.jpg	GOLDENGATE-0107485	Mw	0	2023-07-07 06:41:36	2023-07-07 06:41:36	0
533	109	1.50	3	168871186164a7b2b5b0a1a.jpg	GOLDENGATE-0107484	Mw	0	2023-07-07 06:41:36	2023-07-07 06:41:36	0
534	109	2.70	3	168871181864a7b28a537d5.jpg	GOLDENGATE-0107483	Mw	0	2023-07-07 06:41:36	2023-07-07 06:41:36	0
535	109	1	3	168871177664a7b260f16a4.jpg	GOLDENGATE-0107482	Mw	0	2023-07-07 06:41:36	2023-07-07 06:41:36	0
536	109	2	3	168871173964a7b23b58d50.jpg	GOLDENGATE-0107481	Mw	0	2023-07-07 06:41:36	2023-07-07 06:41:36	0
537	109	2.80	3	168871168264a7b20247968.jpg	GOLDENGATE-0107480	Mw	0	2023-07-07 06:41:36	2023-07-07 06:41:36	0
538	110	6	3	168871378564a7ba394ab4c.jpg	GOLDENGATE-0107488	Mw	0	2023-07-07 07:10:48	2023-07-07 07:10:48	0
539	110	7.40	3	168871373664a7ba0870f87.jpg	GOLDENGATE-0107463	Mw	0	2023-07-07 07:10:48	2023-07-07 07:10:48	0
540	111	6.10	3	168871558664a7c142773a4.jpg	GOLDENGATE-0107497	Mw	0	2023-07-07 07:40:31	2023-07-07 07:40:31	0
541	111	3.40	3	168871554464a7c1182f68d.jpg	GOLDENGATE-0107491	Mw	0	2023-07-07 07:40:31	2023-07-07 07:40:31	0
542	111	5.60	3	168871546964a7c0cd12ce6.jpg	GOLDENGATE-0107490	Mw	0	2023-07-07 07:40:31	2023-07-07 07:40:31	0
543	111	4.10	3	168871544164a7c0b19c269.jpg	GOLDENGATE-0107489	Mw	0	2023-07-07 07:40:31	2023-07-07 07:40:31	0
544	112	5.50	3	168871697664a7c6b085e89.jpg	GOLDENGATE-0107494	Mw	0	2023-07-07 08:03:51	2023-07-07 08:03:51	0
545	112	5	3	168871694664a7c692c7a43.jpg	GOLDENGATE-0107495	Mw	0	2023-07-07 08:03:51	2023-07-07 08:03:51	0
546	112	4.10	3	168871691164a7c66f78a09.jpg	GOLDENGATE-0107498	Mw	0	2023-07-07 08:03:51	2023-07-07 08:03:51	0
547	112	4.60	3	168871687064a7c64613989.jpg	GOLDENGATE-0107499	Mw	0	2023-07-07 08:03:51	2023-07-07 08:03:51	0
548	112	4.70	3	168871684464a7c62c338d1.jpg	13844248	Mw	0	2023-07-07 08:03:51	2023-07-07 08:03:51	0
549	112	4.90	3	168871680164a7c6019c13a.jpg	GOLDENGATE-0107492	Mw	0	2023-07-07 08:03:51	2023-07-07 08:03:51	0
550	113	3.	3	168878585064a8d3ba3d47f.jpg	00707831	Mw	0	2023-07-08 03:11:14	2023-07-08 03:11:14	0
551	113	6.30	3	168878581264a8d3941afb5.jpg	GOLDENGATE-0107534	Mw	0	2023-07-08 03:11:14	2023-07-08 03:11:14	0
552	113	4.50	3	168878576564a8d365208a1.jpg	GOLDENGATE-0107533	Mw	0	2023-07-08 03:11:14	2023-07-08 03:11:14	0
553	113	2.10	3	168878573664a8d34845ac6.jpg	GOLDENGATE-0107532	Mw	0	2023-07-08 03:11:14	2023-07-08 03:11:14	0
554	113	4.90	3	168878562964a8d2dd96757.jpg	GOLDENGATE-0107531	Mw	0	2023-07-08 03:11:14	2023-07-08 03:11:14	0
555	113	2.70	3	168878559664a8d2bc8e066.jpg	GOLDENGATE-0107530	Mw	0	2023-07-08 03:11:14	2023-07-08 03:11:14	0
556	113	6.90	3	168878556564a8d29de4afa.jpg	GOLDENGATE-0107529	Mw	0	2023-07-08 03:11:14	2023-07-08 03:11:14	0
557	113	4.20	3	168878553764a8d281b8be8.jpg	GOLDENGATE-0107528	Mw	0	2023-07-08 03:11:14	2023-07-08 03:11:14	0
558	113	4.20	3	168878549864a8d25a37af4.jpg	GOLDENGATE-0107527	Mw	0	2023-07-08 03:11:14	2023-07-08 03:11:14	0
559	113	2.90	3	168878546964a8d23d1d1ac.jpg	GOLDENGATE-0107526	Mw	0	2023-07-08 03:11:14	2023-07-08 03:11:14	0
560	113	1.20	3	168878541264a8d204a4756.jpg	GOLDENGATE-0107525	Mw	0	2023-07-08 03:11:14	2023-07-08 03:11:14	0
561	113	5.80	3	168878538164a8d1e539398.jpg	GOLDENGATE-0107524	Mw	0	2023-07-08 03:11:14	2023-07-08 03:11:14	0
562	113	3.80	3	168878531964a8d1a7f3b07.jpg	GOLDENGATE-0107523	Mw	0	2023-07-08 03:11:14	2023-07-08 03:11:14	0
563	113	2.90	3	168878528064a8d180a1506.jpg	GOLDENGATE-0107522	Mw	0	2023-07-08 03:11:14	2023-07-08 03:11:14	0
564	113	2.90	3	168878524864a8d160cf50a.jpg	GOLDENGATE-0107521	Mw	0	2023-07-08 03:11:14	2023-07-08 03:11:14	0
565	113	4.60	3	168878521164a8d13bf1c3a.jpg	GOLDENGATE-0107520	Mw	0	2023-07-08 03:11:14	2023-07-08 03:11:14	0
566	113	2.10	3	168878518364a8d11f0ef2d.jpg	GOLDENGATE-0107519	Mw	0	2023-07-08 03:11:14	2023-07-08 03:11:14	0
567	113	3.60	3	168878515764a8d1056ad72.jpg	GOLDENGATE-0107518	Mw	0	2023-07-08 03:11:14	2023-07-08 03:11:14	0
568	113	3.80	3	168878511564a8d0db77b4d.jpg	GOLDENGATE-0107517	Mw	0	2023-07-08 03:11:14	2023-07-08 03:11:14	0
569	113	2.40	3	168878508164a8d0b924079.jpg	GOLDENGATE-0107516	Mw	0	2023-07-08 03:11:14	2023-07-08 03:11:14	0
570	113	2.80	3	168878504864a8d09851a53.jpg	GOLDENGATE-0107515	Mw	0	2023-07-08 03:11:14	2023-07-08 03:11:14	0
571	114	4.70	3	168878642664a8d5fa81318.jpg	GOLDENGATE-0107537	Mw	0	2023-07-08 03:22:55	2023-07-08 03:22:55	0
572	114	6.70	3	168878639764a8d5dd64b1e.jpg	GOLDENGATE-0107536	Mw	0	2023-07-08 03:22:55	2023-07-08 03:22:55	0
573	115	6.30	3	168879124764a8e8cf299ae.jpg	GOLDENGATE-0107546	Mw	0	2023-07-08 04:41:18	2023-07-08 04:41:18	0
574	115	6.90	3	168879120564a8e8a53bcda.jpg	GOLDENGATE-0107545	Mw	0	2023-07-08 04:41:18	2023-07-08 04:41:18	0
575	115	7	3	168879115464a8e872d62f9.jpg	GOLDENGATE-0107544	Mw	0	2023-07-08 04:41:18	2023-07-08 04:41:18	0
576	115	6	3	168879109664a8e8385650d.jpg	GOLDENGATE-0107542	Mw	0	2023-07-08 04:41:18	2023-07-08 04:41:18	0
577	115	6.50	3	168879104964a8e809b9e16.jpg	GOLDENGATE-0107541	Mw	0	2023-07-08 04:41:18	2023-07-08 04:41:18	0
578	115	6.20	3	168879101564a8e7e7e7ac1.jpg	GOLDENGATE-0107540	Mw	0	2023-07-08 04:41:18	2023-07-08 04:41:18	0
579	115	5.90	3	168879097964a8e7c3d9738.jpg	GOLDENGATE-0107539	Mw	0	2023-07-08 04:41:18	2023-07-08 04:41:18	0
580	115	5.60	3	168879093764a8e79923ab7.jpg	GOLDENGATE-0107538	Mw	0	2023-07-08 04:41:18	2023-07-08 04:41:18	0
581	116	2.10	3	168879363064a8f21eb06ec.jpg	GOLDENGATE-0107543	Mw	0	2023-07-08 05:22:09	2023-07-08 05:22:09	0
582	117	3.70	3	168879505364a8f7ad89706.jpg	GOLDENGATE-0107548	Mw	0	2023-07-08 05:45:39	2023-07-08 05:45:39	0
583	117	4.70	3	168879500264a8f77a95682.jpg	GOLDENGATE-0107547	Mw	0	2023-07-08 05:45:39	2023-07-08 05:45:39	0
584	118	3.80	3	168879923764a9080522da4.jpg	GOLDENGATE-0107470	Mw	0	2023-07-08 06:54:39	2023-07-08 06:54:39	0
585	118	3.20	3	168879918364a907cf84714.jpg	4971980976783	Mw	0	2023-07-08 06:54:39	2023-07-08 06:54:39	0
586	118	1.60	3	168879910064a9077c15c4c.jpg	3327491713828	Mw	0	2023-07-08 06:54:39	2023-07-08 06:54:39	0
587	118	0.90	3	168879904664a9074683652.jpg	GOLDENGATE-0107467	Mw	0	2023-07-08 06:54:39	2023-07-08 06:54:39	0
588	118	1.80	3	168879896864a906f8e821e.jpg	GOLDENGATE-0107549	Mw	0	2023-07-08 06:54:39	2023-07-08 06:54:39	0
589	119	5.30	3	168880074964a90ded7cd0e.jpg	GOLDENGATE-0107471	Mw	0	2023-07-08 07:20:21	2023-07-08 07:20:21	0
590	120	6	3	168880178264a911f60fca6.jpg	GOLDENGATE-0107472	Mw	0	2023-07-08 07:36:54	2023-07-08 07:36:54	0
591	121	3.20	3	168880308664a9170e63167.jpg	GOLDENGATE-0107473	Mw	0	2023-07-08 07:58:59	2023-07-08 07:58:59	0
592	122	3.40	3	168880502164a91e9dbebf6.jpg	GOLDENGATE-0107475	Mw	0	2023-07-08 08:32:15	2023-07-08 08:32:15	0
593	122	5	3	168880497664a91e704fc0f.jpg	GOLDENGATE-0107474	Mw	0	2023-07-08 08:32:15	2023-07-08 08:32:15	0
594	123	3.40	3	168880704664a9268617b3b.jpg	GOLDENGATE-0107550	Mw	0	2023-07-08 09:04:51	2023-07-08 09:04:51	0
595	123	4.90	3	168880698464a92648b5598.jpg	GOLDENGATE-0107478	Mw	0	2023-07-08 09:04:51	2023-07-08 09:04:51	0
596	123	5.50	3	168880692764a9260f47865.jpg	GOLDENGATE-0107477	Mw	0	2023-07-08 09:04:51	2023-07-08 09:04:51	0
597	123	5	3	168880688964a925e9de7f5.jpg	GOLDENGATE-0107476	Mw	0	2023-07-08 09:04:51	2023-07-08 09:04:51	0
598	124	3.60	3	168880979464a93142b94f7.jpg	50298587	Mw	0	2023-07-08 09:50:55	2023-07-08 09:50:55	0
599	125	9.30	3	168887274964aa272d389af.jpg	GOLDENGATE-0107596	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
600	125	6.10	3	168887266164aa26d514c79.jpg	GOLDENGATE-0107595	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
601	125	9.30	3	168887261764aa26a9c590b.jpg	GOLDENGATE-0107594	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
602	125	4.70	3	168887256564aa267526299.jpg	GOLDENGATE-0107593	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
603	125	7.30	3	168887253464aa265662602.jpg	GOLDENGATE-0107592	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
604	125	6	3	168887249564aa262f6a944.jpg	GOLDENGATE-0107591	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
605	125	3.80	3	168887245464aa260617599.jpg	GOLDENGATE-0107590	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
606	125	3.20	3	168887241364aa25dd5aa2b.jpg	GOLDENGATE-0107589	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
607	125	3.40	3	168887231164aa25777a9d4.jpg	GOLDENGATE-0107588	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
608	125	5.90	3	168887227564aa2553f3189.jpg	GOLDENGATE-0107587	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
609	125	6	3	168887223764aa252dcbe5b.jpg	GOLDENGATE-0107586	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
610	125	9	3	168887218364aa24f73d4af.jpg	GOLDENGATE-0107585	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
611	125	7.50	3	168887214464aa24d0789ea.jpg	GOLDENGATE-0107584	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
612	125	7	3	168887210364aa24a7ba90a.jpg	GOLDENGATE-0107583	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
613	125	7.80	3	168887207264aa24880488c.jpg	GOLDENGATE-0107582	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
614	125	3.10	3	168887203264aa246022fde.jpg	GOLDENGATE-0107581	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
615	125	8.10	3	168887199364aa24398b932.jpg	GOLDENGATE-0107580	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
616	125	7.20	3	168887194064aa24046b98f.jpg	GOLDENGATE-0107579	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
617	125	7.10	3	168887190164aa23dd64429.jpg	GOLDENGATE-0107578	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
618	125	4.50	3	168887184964aa23a941b81.jpg	GOLDENGATE-0107577	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
619	125	5.70	3	168887180164aa237970a2f.jpg	GOLDENGATE-0107576	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
620	125	5.30	3	168887174864aa23442c977.jpg	GOLDENGATE-0107575	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
621	125	18.70	3	168887167864aa22fee5728.jpg	GOLDENGATE-0107574	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
622	125	8.20	3	168887157564aa2297b0118.jpg	GOLDENGATE-0107573	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
623	125	4.40	3	168887154064aa22745ff9f.jpg	GOLDENGATE-0107572	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
624	125	7.40	3	168887148864aa224044cbe.jpg	GOLDENGATE-0107571	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
625	125	6.10	3	168887145864aa2222d438b.jpg	GOLDENGATE-0107570	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
626	125	5.	3	168887130664aa218a76eaa.jpg	GOLDENGATE-0107569	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
627	125	7.40	3	168887127164aa2167ddbf6.jpg	GOLDENGATE-0107568	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
628	125	2.60	3	168887122864aa213c89439.jpg	GOLDENGATE-0107567	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
629	125	3.20	3	168887120364aa21233c1cf.jpg	GOLDENGATE-0107566	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
630	125	3.40	3	168887117464aa210617941.jpg	GOLDENGATE-0107565	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
631	125	2.90	3	168887113264aa20dc26646.jpg	GOLDENGATE-0107564	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
632	125	4.50	3	168887110164aa20bd3287c.jpg	GOLDENGATE-0107563	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
633	125	6.80	3	168887104164aa2081c79e4.jpg	GOLDENGATE-0107562	Mw	0	2023-07-09 03:19:48	2023-07-09 03:19:48	0
634	126	4.70	3	168887321764aa290144f59.jpg	GOLDENGATE-0107599	Mw	0	2023-07-09 03:32:18	2023-07-09 03:32:18	0
635	126	6.70	3	168887316364aa28cb5d509.jpg	GOLDENGATE-0107598	Mw	0	2023-07-09 03:32:18	2023-07-09 03:32:18	0
636	127	3.90	3	168887411064aa2c7eb4f92.jpg	GOLDENGATE-0107603	Mw	0	2023-07-09 03:42:38	2023-07-09 03:42:38	0
637	127	3.10	3	168887406464aa2c50ed898.jpg	GOLDENGATE-0107602	Mw	0	2023-07-09 03:42:38	2023-07-09 03:42:38	0
638	127	3.80	3	168887402164aa2c25366e7.jpg	34151327	Mw	0	2023-07-09 03:42:38	2023-07-09 03:42:38	0
639	127	2.80	3	168887395464aa2be2785ac.jpg	8367605491322	Mw	0	2023-07-09 03:42:38	2023-07-09 03:42:38	0
640	128	3.40	3	168887946564aa41695c632.jpg	GOLDENGATE-0107609	Mw	0	2023-07-09 05:12:21	2023-07-09 05:12:21	0
641	129	1	3	168888069464aa463640dbc.jpg	GOLDENGATE-0107607	Mw	0	2023-07-09 05:32:09	2023-07-09 05:32:09	0
642	129	3.70	3	168888063564aa45fb1bdba.jpg	GOLDENGATE-0107608	Mw	0	2023-07-09 05:32:09	2023-07-09 05:32:09	0
643	130	2.90	3	168888186064aa4ac4adb8e.jpg	GOLDENGATE-0107610	Mw	0	2023-07-09 05:51:13	2023-07-09 05:51:13	0
644	130	4.30	3	168888183064aa4aa6cf304.jpg	GOLDENGATE-0107604	Mw	0	2023-07-09 05:51:13	2023-07-09 05:51:13	0
645	130	3.80	3	168888180764aa4a8f6c240.jpg	GOLDENGATE-0107605	Mw	0	2023-07-09 05:51:13	2023-07-09 05:51:13	0
646	130	5	3	168888177664aa4a7014784.jpg	GOLDENGATE-0107606	Mw	0	2023-07-09 05:51:13	2023-07-09 05:51:13	0
647	131	1.60	3	168888399064aa53168b955.jpg	GOLDENGATE-0107613	Mw	0	2023-07-09 06:28:01	2023-07-09 06:28:01	0
648	131	7	3	168888394664aa52ea9400c.jpg	GOLDENGATE-0107612	Mw	0	2023-07-09 06:28:01	2023-07-09 06:28:01	0
649	132	7.80	3	168888570764aa59cb0bddf.jpg	6030321703537	Mw	0	2023-07-09 06:55:27	2023-07-09 06:55:27	0
650	133	2.90	3	168888731864aa60164ae8e.jpg	14142413	Mw	0	2023-07-09 07:22:31	2023-07-09 07:22:31	0
651	133	4.10	3	168888727464aa5fea71339.jpg	09265238	Mw	0	2023-07-09 07:22:31	2023-07-09 07:22:31	0
652	134	4.45	3	168888814364aa634fdc242.jpg	GOLDENGATE-0107620	Mw	0	2023-07-09 07:36:03	2023-07-09 07:36:03	0
653	135	7.80	3	168889047364aa6c69d804d.jpg	GOLDENGATE-0107617	Mw	0	2023-07-09 08:15:45	2023-07-09 08:15:45	0
654	135	5.40	3	168889041464aa6c2e726fc.jpg	GOLDENGATE-0107618	Mw	0	2023-07-09 08:15:45	2023-07-09 08:15:45	0
655	136	4.50	3	168889191464aa720a24321.jpg	GOLDENGATE-0107616	Mw	0	2023-07-09 08:40:23	2023-07-09 08:40:23	0
656	137	7.10	3	168895863864ab76ae78f18.jpg	GOLDENGATE-0107640	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
657	137	5	3	168895858664ab767ac721a.jpg	GOLDENGATE-0107639	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
658	137	5.70	3	168895856364ab7663ee631.jpg	GOLDENGATE-0107638	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
659	137	5.70	3	168895852664ab763e01db9.jpg	GOLDENGATE-0107637	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
660	137	10.60	3	168895849164ab761b2ecf4.jpg	GOLDENGATE-0107636	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
661	137	13.10	3	168895841764ab75d15010b.jpg	GOLDENGATE-0107635	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
662	137	4.90	3	168895838364ab75af1e498.jpg	GOLDENGATE-0107634	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
663	137	7.90	3	168895832964ab757997487.jpg	GOLDENGATE-0107633	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
664	137	3	3	168895827964ab7547464ff.jpg	GOLDENGATE-0107632	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
665	137	3.70	3	168895822264ab750e0ac97.jpg	GOLDENGATE-0107631	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
666	137	3	3	168895819364ab74f1f17eb.jpg	GOLDENGATE-0107630	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
667	137	6.50	3	168895815864ab74cece6e0.jpg	GOLDENGATE-0107629	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
668	137	3.90	3	168895812464ab74ac8228a.jpg	GOLDENGATE-0107628	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
669	137	4.20	3	168895808564ab7485d4075.jpg	GOLDENGATE-0107627	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
670	137	4.20	3	168895803564ab74537d996.jpg	GOLDENGATE-0107626	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
671	137	5.30	3	168895799764ab742dd3e18.jpg	GOLDENGATE-0107625	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
672	137	3.80	3	168895795664ab740485926.jpg	GOLDENGATE-0107624	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
673	137	4.60	3	168895792564ab73e59bb21.jpg	GOLDENGATE-0107623	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
674	137	6.70	3	168895788964ab73c1e4a1e.jpg	GOLDENGATE-0107622	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
675	137	2.70	3	168895785464ab739e606fe.jpg	GOLDENGATE-0107621	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
676	137	3	3	168895780364ab736bb3377.jpg	GOLDENGATE-0107514	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
677	137	6.20	3	168895775564ab733bd89fd.jpg	GOLDENGATE-0107513	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
678	137	7.60	3	168895770564ab7309048a3.jpg	GOLDENGATE-0107512	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
679	137	3.40	3	168895766764ab72e379e0f.jpg	GOLDENGATE-0107511	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
680	137	5	3	168895762764ab72bb50d10.jpg	GOLDENGATE-0107510	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
681	137	4.30	3	168895759564ab729b23edb.jpg	GOLDENGATE-0107509	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
682	137	4.50	3	168895750964ab72450e5d2.jpg	GOLDENGATE-0107508	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
683	137	3.10	3	168895746764ab721b090a3.jpg	GOLDENGATE-0107507	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
684	137	3.40	3	168895742264ab71ee88cce.jpg	34159071	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
685	137	2.80	3	168895736964ab71b9037d6.jpg	GOLDENGATE-0107505	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
686	137	4.10	3	168895732864ab71907db1b.jpg	GOLDENGATE-0107504	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
687	137	6.60	3	168895729664ab7170120a1.jpg	GOLDENGATE-0107503	Mw	0	2023-07-10 03:11:12	2023-07-10 03:11:12	0
688	138	4.90	3	168895913464ab789e59b3c.jpg	GOLDENGATE-0107644	Mw	0	2023-07-10 03:22:25	2023-07-10 03:22:25	0
689	138	5.70	3	168895909364ab787583f6e.jpg	GOLDENGATE-0107643	Mw	0	2023-07-10 03:22:25	2023-07-10 03:22:25	0
690	138	6.40	3	168895905164ab784b35c3f.jpg	GOLDENGATE-0107642	Mw	0	2023-07-10 03:22:25	2023-07-10 03:22:25	0
691	138	7.10	3	168895901964ab782b3001f.jpg	GOLDENGATE-0107641	Mw	0	2023-07-10 03:22:25	2023-07-10 03:22:25	0
692	139	5.20	3	168896172764ab82bfb67af.jpg	GOLDENGATE-0107668	Mw	0	2023-07-10 04:02:34	2023-07-10 04:02:34	0
693	139	5.80	3	168896167364ab828945f60.jpg	GOLDENGATE-0107660	Mw	0	2023-07-10 04:02:34	2023-07-10 04:02:34	0
694	139	6.10	3	168896163164ab825fc18df.jpg	GOLDENGATE-0107658	Mw	0	2023-07-10 04:02:34	2023-07-10 04:02:34	0
695	139	6.90	3	168896158464ab823047422.jpg	GOLDENGATE-0107657	Mw	0	2023-07-10 04:02:34	2023-07-10 04:02:34	0
696	139	8.20	3	168896154264ab8206b9b65.jpg	GOLDENGATE-0107656	Mw	0	2023-07-10 04:02:34	2023-07-10 04:02:34	0
697	139	6.40	3	168896148864ab81d0d8ed8.jpg	GOLDENGATE-0107664	Mw	0	2023-07-10 04:02:34	2023-07-10 04:02:34	0
698	139	3.60	3	168896144664ab81a6278d7.jpg	GOLDENGATE-0107663	Mw	0	2023-07-10 04:02:34	2023-07-10 04:02:34	0
699	139	5.70	3	168896138664ab816a535db.jpg	GOLDENGATE-0107650	Mw	0	2023-07-10 04:02:34	2023-07-10 04:02:34	0
700	139	7.60	3	168896133264ab8134d2f6a.jpg	GOLDENGATE-0107655	Mw	0	2023-07-10 04:02:34	2023-07-10 04:02:34	0
701	139	6.10	3	168896127864ab80fe85e9c.jpg	GOLDENGATE-0107659	Mw	0	2023-07-10 04:02:34	2023-07-10 04:02:34	0
702	139	5.80	3	168896123464ab80d2c5c3e.jpg	GOLDENGATE-0107661	Mw	0	2023-07-10 04:02:34	2023-07-10 04:02:34	0
703	139	5.70	3	168896118464ab80a0cb56e.jpg	GOLDENGATE-0107662	Mw	0	2023-07-10 04:02:34	2023-07-10 04:02:34	0
704	139	5.40	3	168896112664ab8066d9dd3.jpg	GOLDENGATE-0107653	Mw	0	2023-07-10 04:02:34	2023-07-10 04:02:34	0
705	139	9.40	3	168896107864ab8036e9055.jpg	GOLDENGATE-0107652	Mw	0	2023-07-10 04:02:34	2023-07-10 04:02:34	0
706	139	5.50	3	168896103464ab800a053c9.jpg	GOLDENGATE-0107651	Mw	0	2023-07-10 04:02:34	2023-07-10 04:02:34	0
707	139	7.60	3	168896098064ab7fd4d0f85.jpg	GOLDENGATE-0107654	Mw	0	2023-07-10 04:02:34	2023-07-10 04:02:34	0
708	139	5.70	3	168896093664ab7fa8cb3db.jpg	GOLDENGATE-0107647	Mw	0	2023-07-10 04:02:34	2023-07-10 04:02:34	0
709	139	5.90	3	168896088764ab7f7780926.jpg	GOLDENGATE-0107648	Mw	0	2023-07-10 04:02:34	2023-07-10 04:02:34	0
710	139	4.90	3	168896085364ab7f5501625.jpg	GOLDENGATE-0107649	Mw	0	2023-07-10 04:02:34	2023-07-10 04:02:34	0
711	139	10.60	3	168896079164ab7f1781b1e.jpg	GOLDENGATE-0107645	Mw	0	2023-07-10 04:02:34	2023-07-10 04:02:34	0
712	140	5.10	3	168896574364ab926fa3c0b.jpg	GOLDENGATE-0107665	Mw	0	2023-07-10 05:09:26	2023-07-10 05:09:26	0
713	140	2.90	3	168896570664ab924ac2a06.jpg	GOLDENGATE-0107666	Mw	0	2023-07-10 05:09:26	2023-07-10 05:09:26	0
714	140	3.40	3	168896567664ab922c134af.jpg	GOLDENGATE-0107667	Mw	0	2023-07-10 05:09:26	2023-07-10 05:09:26	0
715	141	8.30	3	168896700064ab975825817.jpg	GOLDENGATE-0107740	Mw	0	2023-07-10 05:30:22	2023-07-10 05:30:22	0
716	142	15	3	168896814564ab9bd137681.jpg	GOLDENGATE-0107739	Mw	0	2023-07-10 05:50:18	2023-07-10 05:50:18	0
717	143	10.40	3	168896943064aba0d62e1c7.jpg	GOLDENGATE-0107737	Mw	0	2023-07-10 06:11:42	2023-07-10 06:11:42	0
718	143	5.80	3	168896937764aba0a1df55c.jpg	GOLDENGATE-0107738	Mw	0	2023-07-10 06:11:42	2023-07-10 06:11:42	0
719	144	7.80	3	168897450864abb4acc0b4a.jpg	GOLDENGATE-0107746	Mw	0	2023-07-10 07:35:49	2023-07-10 07:35:49	0
720	144	4.80	3	168897444464abb46c4e721.jpg	GOLDENGATE-0107752	Mw	0	2023-07-10 07:35:49	2023-07-10 07:35:49	0
721	145	2.61	3	168897538464abb818dac6d.jpg	GOLDENGATE-0107750	Mw	0	2023-07-10 07:51:17	2023-07-10 07:51:17	0
722	145	4.46	3	168897531164abb7cfde0a7.jpg	77732736	Mw	0	2023-07-10 07:51:17	2023-07-10 07:51:17	0
723	146	2.20	3	168897939964abc7c7ddcfb.jpg	GOLDENGATE-0107731	Mw	0	2023-07-10 08:57:06	2023-07-10 08:57:06	0
724	146	4.45	3	168897934064abc78cee707.jpg	GOLDENGATE-0107734	Mw	0	2023-07-10 08:57:06	2023-07-10 08:57:06	0
725	146	6.65	3	168897928964abc75995e55.jpg	02426860	Mw	0	2023-07-10 08:57:06	2023-07-10 08:57:06	0
726	147	3.60	3	168904625864acccf239d4f.jpg	GOLDENGATE-0107695	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
727	147	3	3	168904620864acccc06329b.jpg	GOLDENGATE-0107694	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
728	147	6.50	3	168904618464accca860740.jpg	GOLDENGATE-0107693	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
729	147	4.80	3	168904614664accc82f20c6.jpg	GOLDENGATE-0107687	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
730	147	4.20	3	168904611664accc6488da7.jpg	GOLDENGATE-0107688	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
731	147	3.60	3	168904607964accc3fbf856.jpg	GOLDENGATE-0107689	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
732	147	6.40	3	168904605264accc24e26ee.jpg	GOLDENGATE-0107690	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
733	147	3.90	3	168904601364accbfd0434a.jpg	GOLDENGATE-0107691	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
734	147	3.60	3	168904597564accbd7dd9b2.jpg	GOLDENGATE-0107692	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
735	147	8	3	168904589964accb8bb7406.jpg	GOLDENGATE-0107686	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
736	147	3.60	3	168904585764accb611238b.jpg	02112886	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
737	147	5.90	3	168904582464accb4086e34.jpg	GOLDENGATE-0107684	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
738	147	4.30	3	168904579964accb2787273.jpg	GOLDENGATE-0107683	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
739	147	5.60	3	168904574664accaf2b3d84.jpg	GOLDENGATE-0107682	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
740	147	3.70	3	168904571064accacee4a1f.jpg	GOLDENGATE-0107681	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
741	147	4.10	3	168904567164accaa778efc.jpg	GOLDENGATE-0107680	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
742	147	5.70	3	168904563564acca838e822.jpg	GOLDENGATE-0107679	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
743	147	5.40	3	168904558164acca4d89133.jpg	GOLDENGATE-0107678	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
744	147	5.20	3	168904554064acca2461382.jpg	GOLDENGATE-0107677	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
745	147	4.10	3	168904550264acc9fe31262.jpg	GOLDENGATE-0107676	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
746	147	8.20	3	168904546764acc9dbaef97.jpg	GOLDENGATE-0107675	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
747	147	2.90	3	168904542764acc9b39666d.jpg	GOLDENGATE-0107674	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
748	147	7.20	3	168904539564acc9931deb1.jpg	GOLDENGATE-0107673	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
749	147	4.70	3	168904536664acc97681ac4.jpg	GOLDENGATE-0107672	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
750	147	4.60	3	168904533464acc9560c9fd.jpg	GOLDENGATE-0107671	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
751	147	3.80	3	168904530264acc936a159c.jpg	GOLDENGATE-0107670	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
752	147	6.50	3	168904526964acc91564823.jpg	3148134766687	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
753	147	4.10	3	168904522464acc8e8b6b67.jpg	GOLDENGATE-0107743	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
754	147	8.40	3	168904517364acc8b5549fc.jpg	GOLDENGATE-0107747	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
755	147	5.40	3	168904511564acc87b41092.jpg	GOLDENGATE-0107742	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
756	147	2.70	3	168904508564acc85d3080d.jpg	GOLDENGATE-0107748	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
757	147	3	3	168904503764acc82dbbc84.jpg	GOLDENGATE-0107745	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
758	147	6.50	3	168904496664acc7e6b77f5.jpg	GOLDENGATE-0107744	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
759	147	3.90	3	168904493764acc7c92e171.jpg	GOLDENGATE-0107741	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
760	147	3.80	3	168904480564acc74555e17.jpg	GOLDENGATE-0107749	Mw	0	2023-07-11 03:34:54	2023-07-11 03:34:54	0
761	148	4	3	168904715164acd06f03e50.jpg	GOLDENGATE-0107698	Mw	0	2023-07-11 03:46:04	2023-07-11 03:46:04	0
762	148	6.20	3	168904712164acd05120275.jpg	GOLDENGATE-0107697	Mw	0	2023-07-11 03:46:04	2023-07-11 03:46:04	0
763	148	2.30	3	168904709564acd03773ffa.jpg	GOLDENGATE-0107696	Mw	0	2023-07-11 03:46:04	2023-07-11 03:46:04	0
764	149	2.80	3	168904774064acd2bc55688.jpg	GOLDENGATE-0107703	Mw	0	2023-07-11 03:55:59	2023-07-11 03:55:59	0
765	149	2.40	3	168904770564acd299d6020.jpg	GOLDENGATE-0107702	Mw	0	2023-07-11 03:55:59	2023-07-11 03:55:59	0
766	149	5.20	3	168904763164acd24fc1201.jpg	GOLDENGATE-0107701	Mw	0	2023-07-11 03:55:59	2023-07-11 03:55:59	0
767	149	2.90	3	168904760464acd2341c596.jpg	GOLDENGATE-0107700	Mw	0	2023-07-11 03:55:59	2023-07-11 03:55:59	0
768	149	7.30	3	168904752064acd1e08b7d3.jpg	GOLDENGATE-0107699	Mw	0	2023-07-11 03:55:59	2023-07-11 03:55:59	0
769	150	4.90	3	168904909164acd803eb578.jpg	GOLDENGATE-0107708	Mw	0	2023-07-11 04:18:31	2023-07-11 04:18:31	0
770	150	4.10	3	168904905964acd7e36ad38.jpg	GOLDENGATE-0107707	Mw	0	2023-07-11 04:18:31	2023-07-11 04:18:31	0
771	150	4.50	3	168904902464acd7c0a0690.jpg	GOLDENGATE-0107709	Mw	0	2023-07-11 04:18:31	2023-07-11 04:18:31	0
772	150	6.30	3	168904900164acd7a918a46.jpg	GOLDENGATE-0107705	Mw	0	2023-07-11 04:18:31	2023-07-11 04:18:31	0
773	150	3.90	3	168904897164acd78b78d22.jpg	GOLDENGATE-0107706	Mw	0	2023-07-11 04:18:31	2023-07-11 04:18:31	0
774	150	4.50	3	168904893564acd7677a1e8.jpg	GOLDENGATE-0107710	Mw	0	2023-07-11 04:18:31	2023-07-11 04:18:31	0
775	151	.096	3	168905279864ace67e13b89.jpg	GOLDENGATE-0107713	Mw	0	2023-07-11 05:20:52	2023-07-11 05:20:52	0
776	151	3.71	3	168905274064ace644247c9.jpg	GOLDENGATE-0107712	Mw	0	2023-07-11 05:20:52	2023-07-11 05:20:52	0
777	151	4.56	3	168905270464ace6205787f.jpg	GOLDENGATE-0107711	Mw	0	2023-07-11 05:20:52	2023-07-11 05:20:52	0
778	152	4.65	3	168905365964ace9db214a3.jpg	GOLDENGATE-0107716	Mw	0	2023-07-11 05:34:41	2023-07-11 05:34:41	0
779	152	1.30	3	168905360564ace9a5bbc80.jpg	GOLDENGATE-0107715	Mw	0	2023-07-11 05:34:41	2023-07-11 05:34:41	0
780	152	6.20	3	168905355864ace976054cf.jpg	02579283	Mw	0	2023-07-11 05:34:41	2023-07-11 05:34:41	0
781	153	11.09	3		GOLDENGATE-0107717	Mw	0	2023-07-11 05:51:47	2023-07-11 05:51:47	0
782	154	7.42	3	168905568764acf1c77a36b.jpg	GOLDENGATE-0107718	Mw	0	2023-07-11 06:10:57	2023-07-11 06:10:57	0
783	155	2.36	3	168905795464acfaa295534.jpg	11616146	Mw	0	2023-07-11 06:47:11	2023-07-11 06:47:11	0
784	155	7	3	168905790464acfa7073fdd.jpg	GOLDENGATE-0107719	Mw	0	2023-07-11 06:47:11	2023-07-11 06:47:11	0
785	156	4.98	3	168905918364acff6f407b4.jpg	GOLDENGATE-0107722	Mw	0	2023-07-11 07:06:56	2023-07-11 07:06:56	0
786	156	3.35	3	168905914364acff471290e.jpg	GOLDENGATE-0107723	Mw	0	2023-07-11 07:06:56	2023-07-11 07:06:56	0
787	156	3.46	3	168905910564acff212d74c.jpg	GOLDENGATE-0107721	Mw	0	2023-07-11 07:06:56	2023-07-11 07:06:56	0
788	157	13.95	3	168905984964ad0209bba94.jpg	GOLDENGATE-0107724	Mw	0	2023-07-11 07:17:43	2023-07-11 07:17:43	0
789	158	1.83	3	168906156964ad08c139be9.jpg	GOLDENGATE-0107727	Mw	0	2023-07-11 07:46:25	2023-07-11 07:46:25	0
790	158	4.60	3	168906151264ad08887cfec.jpg	GOLDENGATE-0107726	Mw	0	2023-07-11 07:46:25	2023-07-11 07:46:25	0
791	158	4.65	3	168906129764ad07b1468a0.jpg	GOLDENGATE-0107725	Mw	0	2023-07-11 07:46:25	2023-07-11 07:46:25	0
792	159	4	3	168906270664ad0d32e2b57.jpg	GOLDENGATE-010914	Mw	0	2023-07-11 08:05:19	2023-07-11 08:05:19	0
793	159	4.90	3	168906265364ad0cfd3b1a5.jpg	GOLDENGATE-010913	Mw	0	2023-07-11 08:05:19	2023-07-11 08:05:19	0
794	159	5.80	3	168906262964ad0ce57cebc.jpg	GOLDENGATE-010912	Mw	0	2023-07-11 08:05:19	2023-07-11 08:05:19	0
795	159	8.40	3	168906259364ad0cc19fe8e.jpg	GOLDENGATE-010911	Mw	0	2023-07-11 08:05:19	2023-07-11 08:05:19	0
796	160	1.80	3	168906346864ad102c222b8.jpg	GOLDENGATE-0107921	Mw	0	2023-07-11 08:18:21	2023-07-11 08:18:21	0
797	160	6.20	3	168906343764ad100d40c81.jpg	GOLDENGATE-0107922	Mw	0	2023-07-11 08:18:21	2023-07-11 08:18:21	0
798	160	6.10	3	168906338264ad0fd6b4595.jpg	GOLDENGATE-010916	Mw	0	2023-07-11 08:18:21	2023-07-11 08:18:21	0
799	160	4.40	3	168906335064ad0fb6c5d84.jpg	GOLDENGATE-010915	Mw	0	2023-07-11 08:18:21	2023-07-11 08:18:21	0
800	161	100	3		GOLDENGATE-0107918	Bech	0	2023-07-11 10:39:34	2023-07-11 10:39:34	0
801	162	7.40	3	168913189664ae1b7815653.jpg	GOLDENGATE-010904	Mw	0	2023-07-12 03:18:21	2023-07-12 03:18:21	0
802	162	7.80	3	168913185764ae1b511e643.jpg	GOLDENGATE-010903	Mw	0	2023-07-12 03:18:21	2023-07-12 03:18:21	0
803	162	6.60	3	168913182264ae1b2e07c15.jpg	GOLDENGATE-010902	Mw	0	2023-07-12 03:18:21	2023-07-12 03:18:21	0
804	162	6.10	3	168913174164ae1addd3fcc.jpg	GOLDENGATE-010901	Mw	0	2023-07-12 03:18:21	2023-07-12 03:18:21	0
805	162	11	3	168913167764ae1a9d9bf0f.jpg	GOLDENGATE-010900	Mw	0	2023-07-12 03:18:21	2023-07-12 03:18:21	0
806	162	14.40	3	168913163964ae1a774154b.jpg	GOLDENGATE-010899	Mw	0	2023-07-12 03:18:21	2023-07-12 03:18:21	0
807	162	4.40	3	168913157664ae1a3883dbe.jpg	GOLDENGATE-0107898	Mw	0	2023-07-12 03:18:21	2023-07-12 03:18:21	0
808	162	3.90	3	168913146764ae19cba601e.jpg	GOLDENGATE-0107897	Mw	0	2023-07-12 03:18:21	2023-07-12 03:18:21	0
809	162	8.10	3	168913142964ae19a56d118.jpg	GOLDENGATE-0107896	Mw	0	2023-07-12 03:18:21	2023-07-12 03:18:21	0
810	162	11.30	3	168913139064ae197edb0e4.jpg	GOLDENGATE-0107895	Mw	0	2023-07-12 03:18:21	2023-07-12 03:18:21	0
811	162	7	3	168913134264ae194ee80d1.jpg	GOLDENGATE-0107894	Mw	0	2023-07-12 03:18:21	2023-07-12 03:18:21	0
812	162	7	3	168913130264ae1926ef8d5.jpg	GOLDENGATE-0107893	Mw	0	2023-07-12 03:18:21	2023-07-12 03:18:21	0
813	162	4.60	3	168913123964ae18e754b20.jpg	GOLDENGATE-010892	Mw	0	2023-07-12 03:18:21	2023-07-12 03:18:21	0
814	162	4.70	3	168913117664ae18a8de63d.jpg	GOLDENGATE-010891	Mw	0	2023-07-12 03:18:21	2023-07-12 03:18:21	0
815	162	9.20	3	168913114264ae18868c9df.jpg	GOLDENGATE-010890	Mw	0	2023-07-12 03:18:21	2023-07-12 03:18:21	0
816	162	4.80	3	168913107064ae183e049ef.jpg	GOLDENGATE-010889	Mw	0	2023-07-12 03:18:21	2023-07-12 03:18:21	0
817	162	5.20	3	168913103464ae181a19b00.jpg	GOLDENGATE-010888	Mw	0	2023-07-12 03:18:21	2023-07-12 03:18:21	0
818	162	5.10	3	168913098164ae17e5a5ef5.jpg	GOLDENGATE-010887	Mw	0	2023-07-12 03:18:21	2023-07-12 03:18:21	0
819	162	13.80	3	168913094364ae17bfc8358.jpg	GOLDENGATE-0107920	Mw	0	2023-07-12 03:18:21	2023-07-12 03:18:21	0
820	162	4	3	168913089064ae178aa9ed1.jpg	GOLDENGATE-0107919	Mw	0	2023-07-12 03:18:21	2023-07-12 03:18:21	0
821	162	2.90	3	168913085364ae1765f29a5.jpg	GOLDENGATE-0107917	Mw	0	2023-07-12 03:18:21	2023-07-12 03:18:21	0
822	163	11	3	168913233764ae1d31afb68.jpg	GOLDENGATE-0107906	Mw	0	2023-07-12 03:30:59	2023-07-12 03:30:59	0
823	163	7.40	3	168913230364ae1d0f1bac9.jpg	GOLDENGATE-0107905	Mw	0	2023-07-12 03:30:59	2023-07-12 03:30:59	0
824	164	3.20	3	168914196764ae42cf11275.jpg	GOLDENGATE-0107908	Mw	0	2023-07-12 06:06:39	2023-07-12 06:06:39	0
825	164	8.90	3	168914189864ae428a1377d.jpg	GOLDENGATE-0107907	Mw	0	2023-07-12 06:06:39	2023-07-12 06:06:39	0
826	164	8.60	3	168914186464ae42688dcbd.jpg	GOLDENGATE-0107728	Mw	0	2023-07-12 06:06:39	2023-07-12 06:06:39	0
827	165	4.40	3	168914239764ae447dae17c.jpg	GOLDENGATE-0107909	Mw	0	2023-07-12 06:15:05	2023-07-12 06:15:05	0
828	166	6.40	3	168914476364ae4dbba0a57.jpg	GOLDENGATE-0107778	Mw	0	2023-07-12 06:53:26	2023-07-12 06:53:26	0
829	166	6.70	3	168914472564ae4d9542a4e.jpg	GOLDENGATE-0107777	Mw	0	2023-07-12 06:53:26	2023-07-12 06:53:26	0
830	167	1.05	3	168914800964ae5a69a9658.jpg	GOLDENGATE-0107910	Mw	0	2023-07-12 07:47:02	2023-07-12 07:47:02	0
831	168	4.30	3	168915245864ae6bca59b1f.jpg	GOLDENGATE-0107776	Mw	0	2023-07-12 09:01:15	2023-07-12 09:01:15	0
832	169	7.90	3	168915429164ae72f392ba6.jpg	GOLDENGATE-0107774	Mw	0	2023-07-12 09:31:49	2023-07-12 09:31:49	0
833	170	8.40	3	168921918764af707325e6c.jpg	GOLDENGATE-010876	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
834	170	7.60	3	168921913264af703ce7d54.jpg	GOLDENGATE-010875	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
835	170	8.20	3	168921907664af7004e5f0f.jpg	GOLDENGATE-0107874	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
836	170	8.50	3	168921902164af6fcd410ae.jpg	GOLDENGATE-0107872	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
837	170	6.60	3	168921897364af6f9d94c00.jpg	GOLDENGATE-0107871	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
838	170	12	3	168921882564af6f0998331.jpg	GOLDENGATE-0107870	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
839	170	7.70	3	168921879164af6ee752e9a.jpg	GOLDENGATE-0107869	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
840	170	5.40	3	168921872964af6ea95eaa3.jpg	GOLDENGATE-010868	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
841	170	9.20	3	168921866764af6e6b91544.jpg	GOLDENGATE-010867	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
842	170	5	3	168921862164af6e3d09394.jpg	GOLDENGATE-010866	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
843	170	4.40	3	168921856364af6e0346eb0.jpg	GOLDENGATE-010865	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
844	170	6.70	3	168921852464af6ddcb8483.jpg	GOLDENGATE-010864	MW	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
845	170	10.10	3	168921846964af6da5061cc.jpg	GOLDENGATE-010863	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
846	170	8.60	3	168921838864af6d5422d00.jpg	GOLDENGATE-0107862	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
847	170	5.70	3	168921834964af6d2d0cf2b.jpg	GOLDENGATE-0107861	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
848	170	10.50	3	168921831064af6d064026f.jpg	GOLDENGATE-0107860	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
849	170	5.40	3	168921825664af6cd0cb13e.jpg	GOLDENGATE-0107859	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
850	170	6.30	3	168921821864af6caaa1034.jpg	GOLDENGATE-0107858	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
851	170	4.40	3	168921818364af6c87af388.jpg	GOLDENGATE-0107857	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
852	170	4.20	3	168921814464af6c60921b6.jpg	GOLDENGATE-010856	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
853	170	6.60	3	168921808664af6c263c68d.jpg	GOLDENGATE-010855	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
854	170	5.30	3	168921804964af6c0170877.jpg	GOLDENGATE-010853	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
855	170	7.30	3	168921801464af6bde92e3f.jpg	GOLDENGATE-010854	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
856	170	4.10	3	168921798264af6bbe7fac9.jpg	GOLDENGATE-010851	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
857	170	4.20	3	168921794964af6b9ddced1.jpg	GOLDENGATE-010852	Mw	0	2023-07-13 03:33:20	2023-07-13 03:33:20	0
858	171	5.80	3	168921953364af71cda44ac.jpg	GOLDENGATE-010877	Mw	0	2023-07-13 03:39:40	2023-07-13 03:39:40	0
859	171	5	3	168921950864af71b4aa6fe.jpg	GOLDENGATE-0107881	Mw	0	2023-07-13 03:39:40	2023-07-13 03:39:40	0
860	172	2.50	3	168922012664af741e095c5.jpg	GOLDENGATE-0107883	Mw	0	2023-07-13 03:49:34	2023-07-13 03:49:34	0
861	172	3.90	3	168922009764af7401b97eb.jpg	GOLDENGATE-010880	Mw	0	2023-07-13 03:49:34	2023-07-13 03:49:34	0
862	172	4.30	3	168922004964af73d14c942.jpg	GOLDENGATE-0107882	Mw	0	2023-07-13 03:49:34	2023-07-13 03:49:34	0
863	172	2.80	3	168921996264af737a36ae5.jpg	GOLDENGATE-010879	Mw	0	2023-07-13 03:49:34	2023-07-13 03:49:34	0
864	172	3.40	3	168921992964af735912397.jpg	GOLDENGATE-010878	Mw	0	2023-07-13 03:49:34	2023-07-13 03:49:34	0
865	173	4.70	3	168922166664af7a2237710.jpg	GOLDENGATE-010842	Mw	0	2023-07-13 04:15:51	2023-07-13 04:15:51	0
866	173	4.50	3	168922160764af79e74e982.jpg	GOLDENGATE-0107884	Mw	0	2023-07-13 04:15:51	2023-07-13 04:15:51	0
867	173	4.60	3	168922157964af79cb91f75.jpg	61079694	Mw	0	2023-07-13 04:15:51	2023-07-13 04:15:51	0
868	173	5.70	3	168922155264af79b09912e.jpg	GOLDENGATE-010839	Mw	0	2023-07-13 04:15:51	2023-07-13 04:15:51	0
869	173	4.20	3	168922151864af798e70816.jpg	GOLDENGATE-0107885	Mw	0	2023-07-13 04:15:51	2023-07-13 04:15:51	0
870	173	4.20	3	168922148164af796966e9f.jpg	GOLDENGATE-0107886	Mw	0	2023-07-13 04:15:51	2023-07-13 04:15:51	0
871	173	6.90	3	168922145664af7950a7e36.jpg	GOLDENGATE-010840	Mw	0	2023-07-13 04:15:51	2023-07-13 04:15:51	0
872	173	5.70	3	168922142364af792f5aa64.jpg	GOLDENGATE-0107850	Mw	0	2023-07-13 04:15:51	2023-07-13 04:15:51	0
873	174	2.90	3	168922507164af876f5e5fc.jpg	GOLDENGATE-0107846	Mw	0	2023-07-13 05:11:23	2023-07-13 05:11:23	0
874	175	6.90	3	168922587464af8a92618aa.jpg	14170300	Mw	0	2023-07-13 05:27:12	2023-07-13 05:27:12	0
875	176	7.60	3	168922726264af8ffe59a91.jpg	GOLDENGATE-010843	Mw	0	2023-07-13 06:06:40	2023-07-13 06:06:40	0
876	177	1.60	3	168923142764afa043be83a.jpg	GOLDENGATE-0107849	Mw	0	2023-07-13 06:57:37	2023-07-13 06:57:37	0
877	177	4.70	3	168923138764afa01b93eb0.jpg	GOLDENGATE-0107848	Mw	0	2023-07-13 06:57:37	2023-07-13 06:57:37	0
878	177	2.70	3	168923074964af9d9d24310.jpg	GOLDENGATE-0107847	Mw	0	2023-07-13 06:57:37	2023-07-13 06:57:37	0
879	178	1.90	3	168923284964afa5d10b129.jpg	GOLDENGATE-010829	Mw	0	2023-07-13 07:21:23	2023-07-13 07:21:23	0
880	178	7.40	3	168923282264afa5b60ddbd.jpg	GOLDENGATE-010828	Mw	0	2023-07-13 07:21:23	2023-07-13 07:21:23	0
881	178	5.60	3	168923279364afa599b5a60.jpg	GOLDENGATE-010827	Mw	0	2023-07-13 07:21:23	2023-07-13 07:21:23	0
882	178	6.30	3	168923261464afa4e6a3090.jpg	GOLDENGATE-0107773	Mw	0	2023-07-13 07:21:23	2023-07-13 07:21:23	0
883	179	2.60	3	168923414264afaade5bd9f.jpg	GOLDENGATE-010830	Mw	0	2023-07-13 07:42:56	2023-07-13 07:42:56	0
\.


--
-- Data for Name: collection_points; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collection_points (id, name, email, dial_code, phone, location_name, lattitude, longitude, status, unique_code, image, created_at, updated_at, deleted_at) FROM stdin;
22	Muzeria Medical Centre	shams@alshamsmedical.com	971	506327323	R2WQ+9J3 - Ajman - United Arab Emirates	24.8458851	56.0390585	1	649ee43b896831688134715	1688134715649ee43b896d8.jpg	2023-06-30 14:18:35	2023-06-30 14:18:35	\N
23	Kholood Dental Clinic LLC	sudheer.shams@gmail.com	971	506431104	101, First floor, City Mart Building, Near Lulu - البستان - ليوارة 1 - عجمان - United Arab Emirates	25.4075702	55.4436619	1	649ee480553d01688134784	1688134784649ee4805541b.jpg	2023-06-30 14:19:44	2023-06-30 14:19:44	\N
24	Relief Medical centre	mail@rmcgcc.com	971	547065362	كورنيش عجمان - بنايات الديوان، مكتب رقم 1305 - Al Owan - Al Nakhil 2 - Ajman - United Arab Emirates	25.4165056	55.4419489	1	649ee4e6670e41688134886	1688134886649ee4e66712e.jpg	2023-06-30 14:21:26	2023-06-30 14:21:26	\N
25	Prestige Dental Clinic	info@prestige-clinics.com	971	552300272	49 Sheikh Ammar Bin Humaid St - Ajman - United Arab Emirates	25.3861235	55.506165	1	649ee57584d5c1688135029	1688135029649ee57584da7.jpg	2023-06-30 14:23:49	2023-06-30 14:23:49	\N
6	Aster Clinic	sas@gmail.com	971	54354354353	Jumeirah Village Circle - قرية جميرا - دبي - United Arab Emirates	25.204819	55.270931	1	646b55cc3ee791684755916	1684755916646b55cc3e255.jpg	2023-05-22 11:44:15	2023-05-22 11:45:16	\N
7	testtime	test@yopmail.com	971	45345345	7938+777 ATC TOWER, Dubai Airport, Dubai International Airport - Dubai - United Arab Emirates	25.2531745	55.36567280000001	0	646b58ca1068b1684756682	1684756682646b58ca106d2.jpg	2023-05-22 11:58:02	2023-05-22 18:33:57	\N
5	Saudi German Hospital	saudi@gmail.com	971	76567687	57WH+VV - Downtown Dubai - Dubai - United Arab Emirates	25.204819	55.270931	0	646a6d6e15f7b1684696430	16845897696468ccc9405d7.jpg	2023-05-20 13:36:09	2023-05-22 18:34:02	\N
3	Aster Medicity	acter@tst.com	971	56465488	57WH+VV - Downtown Dubai - Dubai - United Arab Emirates	25.1972295	55.27974699999999	0	6465ec051f0391684401157	16844011576465ec051d406.webp	2023-05-18 09:12:37	2023-05-22 18:34:06	\N
4	Aster Medcity	ss@test.com	971	234234233	7938+777 ATC TOWER, Dubai Airport, Dubai International Airport - Dubai - United Arab Emirates	25.204819	55.270931	0	646852c9940311684558537	16844068316466022fe14ee.jpg	2023-05-18 10:47:11	2023-05-22 18:34:09	\N
8	Rashid Hospital	rashid@gmail.com	971	23432432432	57WH+VV - Downtown Dubai - Dubai - United Arab Emirates	25.1972295	55.27974699999999	1	646c93812730a1684837249	1684837249646c938127356.png	2023-05-23 10:20:49	2023-05-23 10:20:49	\N
9	Emirates Hospital Clinic	hospital@gmail.com	971	32434234323	446Q+XH Dubai - United Arab Emirates	25.1124317	55.13897799999999	1	646cfc7028a4c1684864112	1684864112646cfc7028a94.jpg	2023-05-23 17:48:32	2023-05-23 17:48:32	\N
10	Amina Hospital	info@amina-hospitals.com	971	568089366	CC3R+GGG - Al Quds St - Al Rashidiya 3 - Ajman - United Arab Emirates	25.40370519999999	55.4413418	1	649eb80d6c43b1688123405	1688123405649eb80d6c484.jpg	2023-06-30 11:10:05	2023-06-30 11:10:05	\N
11	Amina Medical Centre	info@amina-hospitals.com	971	80026462	CG83+9MQ - Al Jerf 1 - Ajman - United Arab Emirates	25.416076	55.50436869999999	1	649eddc36ddfd1688133059	1688133059649eddc36de47.jpg	2023-06-30 13:50:59	2023-06-30 13:50:59	\N
12	Ibn Sina Medical Centre	info@amina-hospitals.com	971	80026462	CC3R+PG3 - Al Rashidiya 3 - Ajman - United Arab Emirates	25.4042943	55.441264	1	649eded685bbc1688133334	1688133334649eded685c06.jpg	2023-06-30 13:55:34	2023-06-30 13:55:34	\N
13	New Ibn Sina Medical Centre	info@amina-hospitals.com	971	80026462	CGHC+H38 - Al Jerf Industrial 1 - Ajman - United Arab Emirates	25.4281803	55.5204871	1	649edf2daf8901688133421	1688133421649edf2daf8d6.jpg	2023-06-30 13:57:01	2023-06-30 13:57:01	\N
14	Family Medical Centre	info@amina-hospitals.com	971	80026462	9FRV+RM7 - Ajman Industrial 1 - Ajman - United Arab Emirates	25.39197330000001	55.49416999999999	1	649edf81cb0681688133505	1688133505649edf81cb0ad.jpg	2023-06-30 13:58:25	2023-06-30 13:58:25	\N
15	Al Amal Clinic	amjad1957@gmail.com	971	0529943911	Liwara2 - Al Bustan - ليوارة 2 - Ajman - United Arab Emirates	25.4071686	55.4462099	1	649edfef638321688133615	1688133615649edfef6387d.jpg	2023-06-30 14:00:15	2023-06-30 14:00:15	\N
16	Al jamiaa Medical Centre	aljamiaamc@gmail.com	971	67480255	building no. 3, Al Jurf, murur signal - AL JURF - الحميدية 1 - عجمان - United Arab Emirates	25.4097895	55.5096059	1	649ee06e3a4231688133742	1688133742649ee06e3a46d.jpg	2023-06-30 14:02:22	2023-06-30 14:02:22	\N
17	Metro Medical Centre	suresh.accounts@metromedicalcentre.com	971	67469694	Al Nuaimiyah, Near Nuaimiyah Tower - Al Nuaimia 1 - Ajman - United Arab Emirates	25.3887934	55.4595565	1	649ee1450cc7b1688133957	1688133957649ee1450ccc5.jpg	2023-06-30 14:05:57	2023-06-30 14:05:57	\N
18	Al madar Medical Centre	almadarcenterajman2007@yahoo.com	971	67412202	9CRM+VQC - 3 Al Nuaimia - Ajman - United Arab Emirates	25.3921616	55.4343201	1	649ee1c6ef2061688134086	1688134086649ee1c6ef256.jpg	2023-06-30 14:08:06	2023-06-30 14:08:06	\N
19	Maple Medical Centre LLC	receptionist.maple@gmail.com	971	65955921	193 Munah St - Al Rawda 3 - Ajman - United Arab Emirates	25.3878192	55.4953444	1	649ee2464398b1688134214	1688134214649ee246439d7.jpg	2023-06-30 14:10:14	2023-06-30 14:10:14	\N
20	Red Maple medical centre	receptionist.maple@gmail.com	971	585988677	CHFF+93G - Al Bahia - Ajman - United Arab Emirates	25.4232864	55.5726443	1	649ee29817a6f1688134296	1688134296649ee29817ab4.jpg	2023-06-30 14:11:36	2023-06-30 14:11:36	\N
21	Arabian Medical centre	ajmanamc@yahoo.com	971	585216113	CG47+3FJ - Al Hamidiya 1 - Ajman - United Arab Emirates	25.4052347	55.51361869999999	1	649ee395b255b1688134549	1688134549649ee395b25ad.jpg	2023-06-30 14:15:49	2023-06-30 14:15:49	\N
26	Jebal Sina Medical Centre	zayid@jabalsina.ae	971	67114435	CC3Q+5RR - شارع مسقط - Al Rashidiya 3 - Ajman - United Arab Emirates	25.4029392	55.4395112	1	649ee5df2ebbb1688135135	1688135135649ee5df2ec08.jpg	2023-06-30 14:25:35	2023-06-30 14:25:35	\N
27	Al Sultan Medical Center	Alsultan_medicalcenter@hotmail.com	971	67444188	44 شارع أبو فراس الحمداني - Meshairef - Ajman - United Arab Emirates	25.4086665	55.4644182	1	649ee641259011688135233	1688135233649ee6412594c.jpg	2023-06-30 14:27:13	2023-06-30 14:27:13	\N
28	Al Rawi Medical Centre	alrawimc2012@gmail.com	971	505716863	93 Sheikh Rashid Bin Humeed St - Al Rashidiya 3 - Ajman - United Arab Emirates	25.4038216	55.4404648	1	649ee6a8a871f1688135336	1688135336649ee6a8a876b.jpg	2023-06-30 14:28:56	2023-06-30 14:28:56	\N
29	Al Jurf Medical Centre	jmed.hr@gmail.com	971	508578386	CG23+5FP - Al Jerf 2 - Ajman - United Arab Emirates	25.4004616	55.5037108	1	649ee7bbcfacc1688135611	1688135611649ee7bbcfb20.jpg	2023-06-30 14:33:31	2023-06-30 14:33:31	\N
30	ZAIN DENTAL CLINIC L.L.C	007najmu@gmail.com	971	523844476	9FWX+PRX - Al Rawda 3 - Ajman - United Arab Emirates	25.3971824	55.4992624	1	649ee81aae6971688135706	1688135706649ee81aae6e0.jpg	2023-06-30 14:35:06	2023-06-30 14:35:06	\N
31	Dr Ashis Medical Centre	drasishajmanreception@gmail.com	971	67435070	9FWF+4XP - Al Jerf 2 - Ajman - United Arab Emirates	25.3953564	55.4749442	1	649ee89d8e2781688135837	1688135837649ee89d8e2c2.jpg	2023-06-30 14:37:17	2023-06-30 14:37:17	\N
32	Al Jamal  Beauty Medical Centre	Beautymedical105@gmail.com	971	505884402	Off :105 - شارع الشيخ راشد بن حميد - الوان - النخيل 2 - عجمان - United Arab Emirates	25.4163409	55.4408779	1	649ee90ec571c1688135950	1688135950649ee90ec5769.jpg	2023-06-30 14:39:10	2023-06-30 14:39:10	\N
33	al basma dental clinic	albasmadental@gmail.com	971	67460088	12/1 610 Street - شارع الشيخ جابر الصباح - النعيمية 1 - عجمان - United Arab Emirates	25.3835419	55.4631945	1	649ee989c70151688136073	1688136073649ee989c7061.jpg	2023-06-30 14:41:13	2023-06-30 14:41:13	\N
34	DR SHAMNAS MEDICAL CLINIC L.L.C	shamnas.clinic@gmail.com	971	557616612	33 شارع بغداد - Al Rawda 2 - Ajman - United Arab Emirates	25.3984034	55.51053179999999	1	649ee9d4c39131688136148	1688136148649ee9d4c395e.jpg	2023-06-30 14:42:28	2023-06-30 14:42:28	\N
35	Aster Specialty Clinic	thilak.bu@eurohealth.ae	971	561165116	9CXM+76 Ajman - United Arab Emirates	25.3981904	55.433057	1	649eebcb50ac71688136651	1688136651649eebcb50b17.jpg	2023-06-30 14:50:51	2023-06-30 14:50:51	\N
36	Aster Clinic Numiah Ajman	ali.askar@asterclinics.com	971	566884038	Opposite ADNOC Petrol Station and Ramada Hotel Sheikh Khalifa Bin Zayed - Street - النعيمية 1 - عجمان - United Arab Emirates	25.3886813	55.46064500000001	1	649eec4faf7e91688136783	1688136783649eec4faf837.jpg	2023-06-30 14:53:03	2023-06-30 14:53:03	\N
37	Thumbay University Hopital	thameem@purchase.thumbay.com	971	67705555	CG92+G33 - Al Jerf 1 - Ajman - United Arab Emirates	25.4187375	55.5000668	1	649eee45afd7a1688137285	1688137285649eee45afdc5.jpg	2023-06-30 15:01:25	2023-06-30 15:01:25	\N
38	Oriana Medical Centre	dr.anil@orianahospital.ae	971	65918889	CGM9+FVP - Al Jerf Industrial 1 - Ajman - United Arab Emirates	25.4337952	55.5198263	1	64a01f960b97f1688215446	168821544664a01f960b9c6.jpg	2023-07-01 12:44:06	2023-07-01 12:44:06	\N
39	Al Hemaya General Clinic LLC	hemayagc786@gmail.com	971	585947261	CGMG+FRG - Al Jerf Industrial 1 - Ajman - United Arab Emirates	25.4336865	55.52708699999999	1	64a2a9d7731821688381911	168838191164a2a9d7731d9.jpg	2023-07-03 10:58:31	2023-07-03 10:58:31	\N
40	Al Nahrain Specialty Medical Center – Nuaimiya 1	accounts@alnahreen.ae	971	0508334715	9FQ2+WG Ajman - United Arab Emirates	25.3897983	55.451299	1	64a2aa6e927f81688382062	168838206264a2aa6e92840.jpg	2023-07-03 11:01:02	2023-07-03 11:01:02	\N
41	Al Nahrain Medical Center 1 – Al Helio 2.	accounts@alnahreen.ae	971	0508334715	9JJ3+F23 - Helio 2 - Ajman - United Arab Emirates	25.3803804	55.6030121	1	64a2aab1113671688382129	168838212964a2aab1113ae.jpg	2023-07-03 11:02:09	2023-07-03 11:02:09	\N
42	Northern Al Ahliah Medical Center	ajmanamc@ahaliagroup.ae	971	565119392	48FX+286 - Al ‘Uwaid - Fujairah - United Arab Emirates	25.12263069999999	56.34826899999999	1	64a2ab117f0101688382225	168838222564a2ab117f077.jpg	2023-07-03 11:03:45	2023-07-03 11:03:45	\N
43	Ahaliah Medical Center	ajmanamc@ahaliagroup.ae	971	561998469	9FP9+VG7 - Ajman Industrial 2 - Ajman - United Arab Emirates	25.3871005	55.4686209	1	64a2ab61818851688382305	168838230564a2ab61818cc.jpg	2023-07-03 11:05:05	2023-07-03 11:05:05	\N
44	Berlin Dental Clinic	berlindentalclinic2007@gmail.com	971	553899887	9CRM+VJC - 3 Al Nuaimia - Ajman - United Arab Emirates	25.3921721	55.4340949	1	64a2abb3084271688382387	168838238764a2abb30846f.jpg	2023-07-03 11:06:27	2023-07-03 11:06:27	\N
45	Al Yasmine Specialist Dental Center	alyasminemc@gmail.com	971	0502437325	43 University St - Al Jerf 1 - Ajman - United Arab Emirates	25.4139156	55.5002046	1	64a2ad5c2260d1688382812	168838281264a2ad5c22656.jpg	2023-07-03 11:13:32	2023-07-03 11:13:32	\N
46	Al Sanaiya Clinic – Jurf, Ajman	raja.mohamed@righthealth.ae	971	502188278	CGMH+MR3 - Al Jerf Industrial 1 - Ajman - United Arab Emirates	25.4340617	55.5295195	1	64a2af266aee01688383270	168838327064a2af266af28.jpg	2023-07-03 11:21:10	2023-07-03 11:21:10	\N
47	Right Health Medical Center – Jurf 1, Ajman	Raja.mohamed@righthealth.ae	971	502188278	Jurf opposite mosque Next right from Jerf Jail - الجرف الصناعية 2 - عجمان - United Arab Emirates	25.439828	55.5457867	1	64a2b038792e11688383544	168838354464a2b0387932a.jpg	2023-07-03 11:25:44	2023-07-03 11:25:44	\N
49	National Clinic – New Ind Area, Ajman	raja.mohamed@righthealth.ae	971	502188278	New Sanaiya, Ajman industrial 2 opp. lucky roundabout - عجمان الصناعية 2 - عجمان - United Arab Emirates	25.3753783	55.4767966	1	64a2b0c1da76d1688383681	168838368164a2b0c1da7b4.jpg	2023-07-03 11:28:01	2023-07-03 11:28:01	\N
48	Al Nuaimia Clinic – New Ind Area, Ajman	raja.mohamed@righthealth.ae	971	502188278	37 Hassan Bin Haitham St - Ajman Industrial 2 - Ajman - United Arab Emirates	25.204819	55.270931	1	64a2b07c388d31688383612	168838361264a2b07c3891b.jpg	2023-07-03 11:26:52	2023-07-03 11:29:06	\N
50	Dear Helath Medical Centre	dearhealth15@gmail.com	971	505300187	93 Sheikh Rashid Bin Humeed St - Ajman - United Arab Emirates	25.40413449999999	55.44038819999999	1	64a3a80ad6e3c1688446986	168844698664a3a80ad6e82.jpg	2023-07-04 05:03:06	2023-07-04 05:03:06	\N
51	City Medical Laboratory	citylabml@gmail.com	971	506061232	CC4V+F6W - Al Rashidiya 3 - Ajman - United Arab Emirates	25.4061744	55.44312739999999	1	64a4fa0136f7d1688533505	168853350564a4fa0136fc7.jpg	2023-07-05 05:05:05	2023-07-05 05:05:05	\N
52	Al Ihsan Medical Centre	medical@alihsan.ae	971	567002081	CC4P+MW8 - Al Nakhil - Al Rumailah 1 - Ajman - United Arab Emirates	25.406582	55.43747510000001	1	64a554f7229db1688556791	168855679164a554f722a2f.jpg	2023-07-05 11:33:11	2023-07-05 11:33:11	\N
53	Care Plus Medical Centre	careplus.ajman@gmail.com	971	67473341	Flat No 211, 2nd Floor, al Tameer Building - above KM Trading - عجمان - United Arab Emirates	25.4062695	55.4433415	1	64a5557970bed1688556921	168855692164a5557970c33.jpg	2023-07-05 11:35:21	2023-07-05 11:35:21	\N
54	Fathima Dental Centre	sameerpangadan@gmail.com	971	0504229742	108 شارع الاتحاد - Al Bustan - ليوارة 2 - Ajman - United Arab Emirates	25.4046564	55.4457215	1	64a6430dcdfbe1688617741	168861774164a6430dce006.jpg	2023-07-06 04:29:01	2023-07-06 04:29:01	\N
55	Charisma General Dental Clinic LLC	charisma.dent.clinic@gmail.com	971	566289589	Charisma General ajman	25.204819	55.270931	1	64a797c677c3e1688704966	168870496664a797c677c85.jpg	2023-07-07 04:42:46	2023-07-07 04:42:46	\N
56	Medicare Medical Centre	medicareajman@gmail.com	971	67475171	M. City Mart Building - near Lulu Hypermarket - البستان - عجمان - United Arab Emirates	25.4076605	55.4438922	1	64a7981ae20671688705050	168870505064a7981ae20cb.jpg	2023-07-07 04:44:10	2023-07-07 04:44:10	\N
57	Derma art clinic	dermaartclinic@gmail.com	971	543712072	CF9Q+P93 - Al Ittihad St - الزورا - Ajman - United Arab Emirates	25.204819	55.270931	1	64a79951a4c6a1688705361	168870536164a79951a4cb2.jpg	2023-07-07 04:49:21	2023-07-07 04:49:39	\N
58	Khalid lala Medical Centre	khalidlala@yahoo.com	971	509829105	CHQ2+HV9 - Al Jerf Industrial 2 - Ajman - United Arab Emirates	25.4389194	55.55223299999999	1	64a79a11321a31688705553	168870555364a79a11321e9.jpg	2023-07-07 04:52:33	2023-07-07 04:52:33	\N
59	Balsam Dental Clinic	balsam.clinic@outlook.com	971	67474704	93 Sheikh Jaber Al-Sabah St - Al Nuaimia 1 - Ajman - United Arab Emirates	25.385875	55.457671	1	64a79a842fa7c1688705668	168870566864a79a842facf.jpg	2023-07-07 04:54:28	2023-07-07 04:54:28	\N
60	Al Durra Dental Clinic	dr_ammar2011@hotmail.com	971	67313544	CC4X+44F - Al Bustan - ليوارة 2 - Ajman - United Arab Emirates	25.4053322	55.4478507	1	64a79ae0bf9ff1688705760	168870576064a79ae0bfa47.jpg	2023-07-07 04:56:00	2023-07-07 04:56:00	\N
61	Berries Medical Centre	samaelsherif772@gmail.com	971	588603300	R Holding Tower - Sheikh Khalifa Bin Zayed St - Ajman - United Arab Emirates	25.392855	55.4359993	1	64a79b7e2f5811688705918	168870591864a79b7e2f5cb.jpg	2023-07-07 04:58:38	2023-07-07 04:58:38	\N
62	Al Ain Medical Centre	jomyalainmedicalfinance@gmail.com	971	525594669	9FJ5+2GV - Al Nuaimia 1 - Ajman - United Arab Emirates	25.3799972	55.45894999999999	1	64a79bda1b1eb1688706010	168870601064a79bda1b239.jpg	2023-07-07 05:00:10	2023-07-07 05:00:10	\N
63	Rashid Medical Center	rashidmedical94@gmail.com	971	67444272	CC6V+XF5 - Al Owan - Al Nakhil 1 - Ajman - United Arab Emirates	25.4122988	55.4438224	1	64aba7066fbd81688971014	168897101464aba7066fc22.jpg	2023-07-10 06:36:54	2023-07-10 06:36:54	\N
64	Palma Medical Centre	moxowais1@gmail.com	971	522021940	jurf 1 - Al Jerf Industrial 1 - Ajman - United Arab Emirates	25.4332683	55.5203549	1	64abc9c8159971688979912	168897991264abc9c8159e2.jpg	2023-07-10 09:05:12	2023-07-10 09:05:12	\N
65	Yaseen Medical Centre	yaseenmedic@yahoo.com	971	67474491	CC7V+29V - Al Owan - Al Nakhil 1 - Ajman - United Arab Emirates	25.4126093	55.4434154	1	64abca2f18b611688980015	168898001564abca2f18bac.jpg	2023-07-10 09:06:55	2023-07-10 09:06:55	\N
66	Al Helal Medical Centre	alhelalmc@yahoo.com	971	506653618	CC6R+CXP - Al Owan - Al Nakhil 1 - Ajman - United Arab Emirates	25.411081	55.44246399999999	1	64abcaa973ba41688980137	168898013764abcaa973c15.jpg	2023-07-10 09:08:57	2023-07-10 09:08:57	\N
67	Al Nejah Vet Lab LLC	alnejahvetlabajman@gmail.com	971	509443149	9JJ3+GG7 - Helio 2 - Ajman - United Arab Emirates	25.3806281	55.60329170000001	1	64abd818189581688983576	168898357664abd818189a2.jpg	2023-07-10 10:06:16	2023-07-10 10:06:16	\N
68	Aura Medical Centre LLC	auramedicenter@gmail.com	971	65265455	CGRR+XQ3 - Al Jerf Industrial 2 - Ajman - United Arab Emirates	25.442615	55.5418527	1	64abd9e4b90c61688984036	168898403664abd9e4b9111.jpg	2023-07-10 10:13:56	2023-07-10 10:13:56	\N
69	Al Dhuha medical Centre	aldhohamedicalcenter@gmail.com	971	67405633	Al Shorafa Tower 1 - 28 - 3 شارع الشيخ راشد بن حميد - الرميلة - الرميلة 3 - عجمان - United Arab Emirates	25.3963395	55.42968219999999	1	64ad4224c2e131689076260	168907626064ad4224c2e5d.jpg	2023-07-11 11:51:00	2023-07-11 11:51:00	\N
70	Oxygen Medical Centre	mahmood_r84@hotmail.com	971	502709595	9 شارع هارون الرشيد - Al Rumailah - Al Rumailah 3 - Sharjah - United Arab Emirates	25.3950365	55.4264608	1	64ad43183191e1689076504	168907650464ad431831968.jpg	2023-07-11 11:55:04	2023-07-11 11:55:04	\N
71	Basmat Bagdad Medical Centre	basmaaljuboori1986@yahoo.com	971	555565682	9CRQ+J7X - Sheikh Khalifa Bin Zayed St - 3 Al Nuaimia - Ajman - United Arab Emirates	25.3916148	55.43825589999999	1	64ae65f46fe821689150964	168915096464ae65f46fec7.jpg	2023-07-12 08:36:04	2023-07-12 08:36:04	\N
\.


--
-- Data for Name: collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collections (id, user_id, collection_point_id, collection_status, signature, created_at, updated_at, deleted_at) FROM stdin;
1	3	3	0	1684411848646615c81b904.jpg	2023-05-18 12:10:48	2023-05-18 12:10:48	\N
2	3	3	0	16844119516466162fcbaac.jpg	2023-05-18 12:12:31	2023-05-18 12:12:31	\N
3	3	3	0	1684490147646747a320800.jpg	2023-05-19 09:55:47	2023-05-19 09:55:47	\N
4	3	3	0	1684490585646749591dbd2.jpg	2023-05-19 10:03:05	2023-05-19 10:03:05	\N
5	3	3	0	16844979796467663b045ca.jpg	2023-05-19 12:06:19	2023-05-19 12:06:19	\N
6	3	3	0	1684562272646861603c434.jpg	2023-05-20 05:57:52	2023-05-20 05:57:52	\N
7	3	3	0	16845742986468905af242c.jpg	2023-05-20 09:18:18	2023-05-20 09:18:18	\N
8	7	5	0	1684697377646a712120819.jpg	2023-05-21 19:29:37	2023-05-21 19:29:37	\N
9	3	3	0	1684734923646b03cb6defd.jpg	2023-05-22 05:55:23	2023-05-22 05:55:23	\N
10	3	3	0	1684738612646b1234b5d5a.jpg	2023-05-22 06:56:52	2023-05-22 06:56:52	\N
53	10	34	0	1688202986649feeea864ea.jpg	2023-07-01 09:16:26	2023-07-01 09:16:26	\N
54	10	30	0	1688204623649ff54fb1154.jpg	2023-07-01 09:43:43	2023-07-01 09:43:43	\N
55	10	20	0	168820914964a006fd1ab43.jpg	2023-07-01 10:59:09	2023-07-01 10:59:09	\N
56	10	38	0	168821765464a02836a34ed.jpg	2023-07-01 13:20:54	2023-07-01 13:20:54	\N
57	10	10	0	168826989764a0f4498d93a.jpg	2023-07-02 03:51:37	2023-07-02 03:51:37	\N
12	7	5	1	1684750841646b41f995122.jpg	2023-05-22 10:20:41	2023-05-22 11:30:44	\N
13	7	5	1	1684753170646b4b12cea10.jpg	2023-05-22 10:59:30	2023-05-22 11:33:04	\N
58	10	13	0	168827083864a0f7f661f7f.jpg	2023-07-02 04:07:18	2023-07-02 04:07:18	\N
59	10	18	0	168827719664a110cccbbd8.jpg	2023-07-02 05:53:16	2023-07-02 05:53:16	\N
60	10	17	0	168827919064a1189668d4b.jpg	2023-07-02 06:26:30	2023-07-02 06:26:30	\N
14	7	5	1	1684755292646b535cce005.jpg	2023-05-22 11:34:52	2023-05-22 11:39:07	\N
15	9	6	1	1684756306646b5752f051f.jpg	2023-05-22 11:51:46	2023-05-22 11:54:31	\N
16	9	6	1	1684756698646b58daf2269.jpg	2023-05-22 11:58:18	2023-05-22 12:01:01	\N
61	10	36	0	168828049864a11db279e68.jpg	2023-07-02 06:48:18	2023-07-02 06:48:18	\N
62	10	31	0	168828294364a1273fa92e5.jpg	2023-07-02 07:29:03	2023-07-02 07:29:03	\N
17	10	7	0	1684764373646b76d592529.jpg	2023-05-22 14:06:13	2023-05-22 14:06:13	\N
18	10	6	0	1684781023646bb7dfed19e.jpg	2023-05-22 18:43:43	2023-05-22 18:43:43	\N
19	7	6	0	1684819591646c4e87c0df2.jpg	2023-05-23 05:26:31	2023-05-23 05:26:31	\N
20	7	6	0	1684819893646c4fb514fc9.jpg	2023-05-23 05:31:33	2023-05-23 05:31:33	\N
63	10	38	0	168828464164a12de1d2424.jpg	2023-07-02 07:57:21	2023-07-02 07:57:21	\N
21	7	6	1	1684820522646c522a873e2.jpg	2023-05-23 05:42:02	2023-05-23 06:03:42	\N
22	10	6	1	1684822014646c57fea385b.jpg	2023-05-23 06:06:54	2023-05-23 06:07:50	\N
64	10	13	0	168828593664a132f0206fd.jpg	2023-07-02 08:18:56	2023-07-02 08:18:56	\N
65	10	10	0	168835544464a2427409e37.jpg	2023-07-03 03:37:24	2023-07-03 03:37:24	\N
23	10	8	0	1684837699646c954311c35.jpg	2023-05-23 10:28:19	2023-05-23 10:28:19	\N
11	3	3	1	1684740116646b18141bd2d.jpg	2023-05-22 07:21:56	2023-05-23 10:56:34	\N
24	10	8	0	1684839939646c9e034449e.jpg	2023-05-23 11:05:39	2023-05-23 11:05:39	\N
25	10	8	1	1684842185646ca6c90f0c9.jpg	2023-05-23 11:43:05	2023-05-23 11:43:48	\N
26	10	8	0	1684846427646cb75b159e7.jpg	2023-05-23 12:53:47	2023-05-23 12:53:47	\N
27	12	6	0	1684858534646ce6a69a249.jpg	2023-05-23 16:15:34	2023-05-23 16:15:34	\N
66	10	12	0	168835625164a2459b48877.jpg	2023-07-03 03:50:51	2023-07-03 03:50:51	\N
28	12	6	1	1684859010646ce88276529.jpg	2023-05-23 16:23:30	2023-05-23 16:36:54	\N
29	10	9	1	1684908940646dab8c6bf68.jpg	2023-05-24 06:15:40	2023-05-24 06:16:31	\N
30	10	9	0	1684911919646db72f07f48.jpg	2023-05-24 07:05:19	2023-05-24 07:05:19	\N
31	10	9	0	1684912086646db7d6adc3a.jpg	2023-05-24 07:08:06	2023-05-24 07:08:06	\N
32	10	9	0	1684918380646dd06cbf2b4.jpg	2023-05-24 08:53:00	2023-05-24 08:53:00	\N
33	10	9	1	1684923069646de2bdbb447.jpg	2023-05-24 10:11:09	2023-05-24 10:13:36	\N
34	10	9	0	1684929797646dfd059f357.jpg	2023-05-24 12:03:17	2023-05-24 12:03:17	\N
35	10	9	0	1684933532646e0b9ce3ca9.jpg	2023-05-24 13:05:32	2023-05-24 13:05:32	\N
36	10	9	0	1684933845646e0cd5e1975.jpg	2023-05-24 13:10:45	2023-05-24 13:10:45	\N
37	10	9	0	1684935127646e11d7c633d.jpg	2023-05-24 13:32:07	2023-05-24 13:32:07	\N
38	9	9	0	168534388564744e8db70db.jpg	2023-05-29 07:04:45	2023-05-29 07:04:45	\N
39	10	9	0	16853443036474502fc221b.jpg	2023-05-29 07:11:43	2023-05-29 07:11:43	\N
40	10	9	0	1685344694647451b674481.jpg	2023-05-29 07:18:14	2023-05-29 07:18:14	\N
41	10	9	0	1685345199647453af3702f.jpg	2023-05-29 07:26:39	2023-05-29 07:26:39	\N
43	12	9	0	16853456206474555495103.jpg	2023-05-29 07:33:40	2023-05-29 07:33:40	\N
42	10	9	1	1685345576647455286bd05.jpg	2023-05-29 07:32:56	2023-05-29 07:33:59	\N
44	10	9	1	16853464276474587b8e35d.jpg	2023-05-29 07:47:07	2023-05-29 07:47:59	\N
45	10	8	0	1686634500648800047c19f.jpg	2023-06-13 05:35:00	2023-06-13 05:35:00	\N
46	10	9	0	16867482776489bc75cc1b4.jpg	2023-06-14 13:11:17	2023-06-14 13:11:17	\N
47	10	10	0	1688123667649eb913e736b.jpg	2023-06-30 11:14:27	2023-06-30 11:14:27	\N
48	10	10	0	1688124262649ebb662d175.jpg	2023-06-30 11:24:22	2023-06-30 11:24:22	\N
49	10	26	0	1688190529649fbe41a4c7b.jpg	2023-07-01 05:48:49	2023-07-01 05:48:49	\N
50	10	33	0	1688196573649fd5dd393df.jpg	2023-07-01 07:29:33	2023-07-01 07:29:33	\N
51	10	14	0	1688199923649fe2f32ac33.jpg	2023-07-01 08:25:23	2023-07-01 08:25:23	\N
52	10	19	0	1688201120649fe7a05d1b6.jpg	2023-07-01 08:45:20	2023-07-01 08:45:20	\N
67	10	26	0	168836366764a2629353b81.jpg	2023-07-03 05:54:27	2023-07-03 05:54:27	\N
68	10	35	0	168836506264a268062eeee.jpg	2023-07-03 06:17:42	2023-07-03 06:17:42	\N
69	10	25	0	168836783264a272d8103de.jpg	2023-07-03 07:03:52	2023-07-03 07:03:52	\N
70	10	14	0	168836892164a27719b9da6.jpg	2023-07-03 07:22:01	2023-07-03 07:22:01	\N
71	10	29	0	168837122364a28017c9e74.jpg	2023-07-03 08:00:23	2023-07-03 08:00:23	\N
72	10	10	0	168844180164a393c940ae1.jpg	2023-07-04 03:36:41	2023-07-04 03:36:41	\N
73	10	12	0	168844258464a396d837313.jpg	2023-07-04 03:49:44	2023-07-04 03:49:44	\N
74	10	50	0	168844873764a3aee15334b.jpg	2023-07-04 05:32:17	2023-07-04 05:32:17	\N
75	10	42	0	168844999764a3b3cd7d018.jpg	2023-07-04 05:53:17	2023-07-04 05:53:17	\N
76	10	36	0	168845132664a3b8fe9c26a.jpg	2023-07-04 06:15:26	2023-07-04 06:15:26	\N
77	10	18	0	168845327964a3c09f43a5b.jpg	2023-07-04 06:47:59	2023-07-04 06:47:59	\N
78	10	40	0	168845530464a3c88882877.jpg	2023-07-04 07:21:44	2023-07-04 07:21:44	\N
79	10	43	0	168845857864a3d552344a9.jpg	2023-07-04 08:16:18	2023-07-04 08:16:18	\N
80	10	23	0	168846262164a3e51d5fb16.jpg	2023-07-04 09:23:41	2023-07-04 09:23:41	\N
81	10	32	0	168847650364a41b574137c.jpg	2023-07-04 13:15:03	2023-07-04 13:15:03	\N
82	10	10	0	168852898164a4e85552991.jpg	2023-07-05 03:49:41	2023-07-05 03:49:41	\N
83	10	12	0	168852982364a4eb9f32ac4.jpg	2023-07-05 04:03:43	2023-07-05 04:03:43	\N
84	10	51	0	168853665064a5064aad264.jpg	2023-07-05 05:57:30	2023-07-05 05:57:30	\N
85	10	17	0	168853821364a50c65cee73.jpg	2023-07-05 06:23:33	2023-07-05 06:23:33	\N
86	10	36	0	168853894464a50f40821f4.jpg	2023-07-05 06:35:44	2023-07-05 06:35:44	\N
87	10	27	0	168854057264a5159cb4872.jpg	2023-07-05 07:02:52	2023-07-05 07:02:52	\N
88	10	46	0	168854215064a51bc60a321.jpg	2023-07-05 07:29:10	2023-07-05 07:29:10	\N
89	10	16	0	168854383764a5225d3c5a6.jpg	2023-07-05 07:57:17	2023-07-05 07:57:17	\N
90	10	29	0	168854422264a523deb2f86.jpg	2023-07-05 08:03:42	2023-07-05 08:03:42	\N
91	10	47	0	168854585764a52a4165098.jpg	2023-07-05 08:30:57	2023-07-05 08:30:57	\N
92	10	26	0	168854845664a53468cd17f.jpg	2023-07-05 09:14:16	2023-07-05 09:14:16	\N
93	10	41	0	168855260264a5449a11be4.jpg	2023-07-05 10:23:22	2023-07-05 10:23:22	\N
94	10	10	0	168861455364a63699dfc18.jpg	2023-07-06 03:35:53	2023-07-06 03:35:53	\N
95	10	12	0	168861522564a639395fe81.jpg	2023-07-06 03:47:05	2023-07-06 03:47:05	\N
96	10	27	0	168861740964a641c1eabf6.jpg	2023-07-06 04:23:29	2023-07-06 04:23:29	\N
97	10	54	0	168862178464a652d82f6a7.jpg	2023-07-06 05:36:24	2023-07-06 05:36:24	\N
98	10	28	0	168862456364a65db3ad8ce.jpg	2023-07-06 06:22:43	2023-07-06 06:22:43	\N
99	10	17	0	168862558564a661b1c8186.jpg	2023-07-06 06:39:45	2023-07-06 06:39:45	\N
100	10	36	0	168862607564a6639b32d3a.jpg	2023-07-06 06:47:55	2023-07-06 06:47:55	\N
101	10	11	0	168862819264a66be03f13c.jpg	2023-07-06 07:23:12	2023-07-06 07:23:12	\N
102	10	14	0	168863015364a67389ae7e6.jpg	2023-07-06 07:55:53	2023-07-06 07:55:53	\N
103	10	10	0	168869971764a7834505f2c.jpg	2023-07-07 03:15:17	2023-07-07 03:15:17	\N
104	10	12	0	168870021664a78538ddaeb.jpg	2023-07-07 03:23:36	2023-07-07 03:23:36	\N
105	10	26	0	168870138064a789c4db7be.jpg	2023-07-07 03:43:00	2023-07-07 03:43:00	\N
106	10	27	0	168870296664a78ff627d12.jpg	2023-07-07 04:09:26	2023-07-07 04:09:26	\N
107	10	17	0	168870885464a7a6f6128b1.jpg	2023-07-07 05:47:34	2023-07-07 05:47:34	\N
108	10	36	0	168870962964a7a9fd260bb.jpg	2023-07-07 06:00:29	2023-07-07 06:00:29	\N
109	10	40	0	168871209664a7b3a03fdcd.jpg	2023-07-07 06:41:36	2023-07-07 06:41:36	\N
110	10	62	0	168871384864a7ba78d4aba.jpg	2023-07-07 07:10:48	2023-07-07 07:10:48	\N
111	10	48	0	168871563164a7c16f6587b.jpg	2023-07-07 07:40:31	2023-07-07 07:40:31	\N
112	10	49	0	168871703164a7c6e7145ac.jpg	2023-07-07 08:03:51	2023-07-07 08:03:51	\N
113	10	10	0	168878587464a8d3d2afce3.jpg	2023-07-08 03:11:14	2023-07-08 03:11:14	\N
114	10	12	0	168878657564a8d68f1357f.jpg	2023-07-08 03:22:55	2023-07-08 03:22:55	\N
115	10	27	0	168879127864a8e8eee375c.jpg	2023-07-08 04:41:18	2023-07-08 04:41:18	\N
116	10	61	0	168879372964a8f28134dbd.jpg	2023-07-08 05:22:09	2023-07-08 05:22:09	\N
117	10	17	0	168879513964a8f80322cdc.jpg	2023-07-08 05:45:39	2023-07-08 05:45:39	\N
118	10	19	0	168879927964a9082f9b445.jpg	2023-07-08 06:54:39	2023-07-08 06:54:39	\N
119	10	31	0	168880082164a90e356954b.jpg	2023-07-08 07:20:21	2023-07-08 07:20:21	\N
120	10	14	0	168880181464a912166bca0.jpg	2023-07-08 07:36:54	2023-07-08 07:36:54	\N
121	10	11	0	168880313964a917430a07f.jpg	2023-07-08 07:58:59	2023-07-08 07:58:59	\N
122	10	20	0	168880513564a91f0f677de.jpg	2023-07-08 08:32:15	2023-07-08 08:32:15	\N
123	10	59	0	168880709164a926b3c24d0.jpg	2023-07-08 09:04:51	2023-07-08 09:04:51	\N
124	10	60	0	168880985564a9317f99052.jpg	2023-07-08 09:50:55	2023-07-08 09:50:55	\N
125	10	10	0	168887278864aa2754a1333.jpg	2023-07-09 03:19:48	2023-07-09 03:19:48	\N
126	10	12	0	168887353864aa2a4232e85.jpg	2023-07-09 03:32:18	2023-07-09 03:32:18	\N
127	10	26	0	168887415864aa2cae8637f.jpg	2023-07-09 03:42:38	2023-07-09 03:42:38	\N
128	10	56	0	168887954164aa41b58cf7f.jpg	2023-07-09 05:12:21	2023-07-09 05:12:21	\N
129	10	50	0	168888072964aa4659d9aca.jpg	2023-07-09 05:32:09	2023-07-09 05:32:09	\N
130	10	18	0	168888187364aa4ad11fd1e.jpg	2023-07-09 05:51:13	2023-07-09 05:51:13	\N
131	10	34	0	168888408164aa53710e02c.jpg	2023-07-09 06:28:01	2023-07-09 06:28:01	\N
132	10	57	0	168888572764aa59df59655.jpg	2023-07-09 06:55:27	2023-07-09 06:55:27	\N
133	10	58	0	168888735164aa60376ebba.jpg	2023-07-09 07:22:31	2023-07-09 07:22:31	\N
134	10	39	0	168888816364aa6363e661e.jpg	2023-07-09 07:36:03	2023-07-09 07:36:03	\N
135	10	43	0	168889054564aa6cb1cdcf3.jpg	2023-07-09 08:15:45	2023-07-09 08:15:45	\N
136	10	41	0	168889202364aa7277a9062.jpg	2023-07-09 08:40:23	2023-07-09 08:40:23	\N
137	10	10	0	168895867264ab76d048373.jpg	2023-07-10 03:11:12	2023-07-10 03:11:12	\N
138	10	12	0	168895934564ab797153147.jpg	2023-07-10 03:22:25	2023-07-10 03:22:25	\N
139	10	27	0	168896175464ab82da40006.jpg	2023-07-10 04:02:34	2023-07-10 04:02:34	\N
140	10	42	0	168896576664ab92869dc49.jpg	2023-07-10 05:09:26	2023-07-10 05:09:26	\N
141	10	24	0	168896702264ab976e5e17a.jpg	2023-07-10 05:30:22	2023-07-10 05:30:22	\N
142	10	35	0	168896821864ab9c1a685ef.jpg	2023-07-10 05:50:18	2023-07-10 05:50:18	\N
143	10	26	0	168896950264aba11e7efd2.jpg	2023-07-10 06:11:42	2023-07-10 06:11:42	\N
144	10	29	0	168897454964abb4d51a890.jpg	2023-07-10 07:35:49	2023-07-10 07:35:49	\N
145	10	11	0	168897547764abb875f01b2.jpg	2023-07-10 07:51:17	2023-07-10 07:51:17	\N
146	10	49	0	168897942664abc7e257d6b.jpg	2023-07-10 08:57:06	2023-07-10 08:57:06	\N
147	10	10	0	168904649464accdde6aa75.jpg	2023-07-11 03:34:54	2023-07-11 03:34:54	\N
148	10	12	0	168904716464acd07c7182c.jpg	2023-07-11 03:46:04	2023-07-11 03:46:04	\N
149	10	26	0	168904775964acd2cfa7102.jpg	2023-07-11 03:55:59	2023-07-11 03:55:59	\N
150	10	27	0	168904911164acd817388d6.jpg	2023-07-11 04:18:31	2023-07-11 04:18:31	\N
151	10	63	0	168905285264ace6b42a815.jpg	2023-07-11 05:20:52	2023-07-11 05:20:52	\N
152	10	66	0	168905368164ace9f1682a4.jpg	2023-07-11 05:34:41	2023-07-11 05:34:41	\N
153	10	65	0	168905470764acedf37f2fb.jpg	2023-07-11 05:51:47	2023-07-11 05:51:47	\N
154	10	51	0	168905585764acf2718ee0b.jpg	2023-07-11 06:10:57	2023-07-11 06:10:57	\N
155	10	36	0	168905803164acfaef3e248.jpg	2023-07-11 06:47:11	2023-07-11 06:47:11	\N
156	10	13	0	168905921664acff909c352.jpg	2023-07-11 07:06:56	2023-07-11 07:06:56	\N
157	10	38	0	168905986364ad0217472b5.jpg	2023-07-11 07:17:43	2023-07-11 07:17:43	\N
158	10	46	0	168906158564ad08d161aca.jpg	2023-07-11 07:46:25	2023-07-11 07:46:25	\N
159	10	47	0	168906271964ad0d3f61408.jpg	2023-07-11 08:05:19	2023-07-11 08:05:19	\N
160	10	68	0	168906350164ad104dde97f.jpg	2023-07-11 08:18:21	2023-07-11 08:18:21	\N
161	10	10	0	168907197464ad3166686fa.jpg	2023-07-11 10:39:34	2023-07-11 10:39:34	\N
162	10	10	0	168913190164ae1b7d5022c.jpg	2023-07-12 03:18:21	2023-07-12 03:18:21	\N
163	10	12	0	168913265964ae1e737df1a.jpg	2023-07-12 03:30:59	2023-07-12 03:30:59	\N
164	10	17	0	168914199964ae42ef5416e.jpg	2023-07-12 06:06:39	2023-07-12 06:06:39	\N
165	10	36	0	168914250564ae44e94fc29.jpg	2023-07-12 06:15:05	2023-07-12 06:15:05	\N
166	10	14	0	168914480664ae4de677863.jpg	2023-07-12 06:53:26	2023-07-12 06:53:26	\N
167	10	69	0	168914802264ae5a76d3d1b.jpg	2023-07-12 07:47:02	2023-07-12 07:47:02	\N
168	10	33	0	168915247564ae6bdb1d176.jpg	2023-07-12 09:01:15	2023-07-12 09:01:15	\N
169	10	67	0	168915430964ae7305640e8.jpg	2023-07-12 09:31:49	2023-07-12 09:31:49	\N
170	10	10	0	168921920064af7080b7fc2.jpg	2023-07-13 03:33:20	2023-07-13 03:33:20	\N
171	10	12	0	168921958064af71fc23985.jpg	2023-07-13 03:39:40	2023-07-13 03:39:40	\N
172	10	26	0	168922017464af744e486a6.jpg	2023-07-13 03:49:34	2023-07-13 03:49:34	\N
173	10	27	0	168922175164af7a77c51a9.jpg	2023-07-13 04:15:51	2023-07-13 04:15:51	\N
174	10	54	0	168922508364af877b3f473.jpg	2023-07-13 05:11:23	2023-07-13 05:11:23	\N
175	10	28	0	168922603264af8b3093417.jpg	2023-07-13 05:27:12	2023-07-13 05:27:12	\N
176	10	17	0	168922840064af94709db78.jpg	2023-07-13 06:06:40	2023-07-13 06:06:40	\N
177	10	19	0	168923145764afa06119701.jpg	2023-07-13 06:57:37	2023-07-13 06:57:37	\N
178	10	48	0	168923288364afa5f3e9bf9.jpg	2023-07-13 07:21:23	2023-07-13 07:21:23	\N
179	10	59	0	168923417664afab001f78d.jpg	2023-07-13 07:42:56	2023-07-13 07:42:56	\N
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
1	MODA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, name, prefix, dial_code, active, created_at, updated_at, deleted) FROM stdin;
1	United Arab Emirates	971	971	1	2023-05-18 02:16:03	\N	0
\.


--
-- Data for Name: coupon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon (coupon_id, coupon_title, coupon_description, coupon_end_date, coupon_amount, coupon_minimum_spend, coupon_maximum_spend, coupon_usage_percoupon, coupon_usage_perx, coupon_usage_peruser, coupon_created_date, coupon_vender_id, coupon_code, coupon_status, individual_use, amount_type, created_at, updated_at, applied_to, start_date, minimum_amount) FROM stdin;
\.


--
-- Data for Name: coupon_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_category (id, coupon_id, category_id) FROM stdin;
\.


--
-- Data for Name: coupon_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_histories (id, order_id, coupon_id, user_id, coupon_code, discount, created_at, updated_at) FROM stdin;
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

COPY public.migrations (migration, batch, id) FROM stdin;
0000_00_00_000000_create_websockets_statistics_entries_table	1	1
2014_10_12_000000_create_users_table	1	2
2014_10_12_100000_create_password_resets_table	1	3
2019_08_19_000000_create_failed_jobs_table	1	4
2019_12_14_000001_create_personal_access_tokens_table	1	5
2022_07_22_072324_create_country_models_table	1	6
2022_07_28_095424_create_category_table	1	7
2022_07_29_113349_create_products_table	1	8
2022_07_29_115922_create_product_attributes_table	1	9
2022_07_29_121226_create_product_images_table	1	10
2022_08_01_044301_add_deleted_to_country_table	1	11
2022_08_01_052546_create_industry_types_table	1	12
2022_08_01_072954_create_attributes_table	1	13
2022_08_01_081612_create_attribute_type_table	1	14
2022_08_01_105755_create_attribute_values_table	1	15
2022_08_03_162220_create_users_role_table	1	16
2022_08_04_085250_create_states_table	1	17
2022_08_04_085323_create_cities_table	1	18
2022_08_04_102446_create_stores_table	1	19
2022_08_04_153341_update_users_table	1	20
2022_08_05_041320_create_vendor_details	1	21
2022_08_05_044559_create_bank_details	1	22
2022_08_05_055145_create_store_images_table	1	23
2022_08_05_162828_add_active_to_users	1	24
2022_08_05_165055_add_deleted_to_users	1	25
2022_08_06_042655_add_industry_type_to_vendor_details	1	26
2022_08_06_052804_update_vendor_details_table	1	27
2022_08_06_053808_alter_table_vendor_details_change_chamber_of_commerce_doc	1	28
2022_08_06_071210_alter_product_attribute_add_extra	1	29
2022_08_06_072956_alter_product_images_add_attribute_id	1	30
2022_08_06_155049_update_bank_details_table	1	31
2022_08_10_034617_alter_table_vendor_details_change_homedelivery	1	32
2022_08_10_153155_create_app_banners	1	33
2022_08_11_065227_create_articles	1	34
2022_08_11_071259_create_faq	1	35
2022_08_11_162220_create_bank	1	36
2022_08_14_152538_create_contact_us_settings	1	37
2022_08_14_154810_create_settings	1	38
2022_08_14_160604_create_notifications	1	39
2022_08_16_151905_create_product	1	40
2022_08_16_160300_add_display_name_to_users	1	41
2022_08_16_160422_add_business_name_to_users	1	42
2022_08_16_163007_create_product_attribute	1	43
2022_08_16_163708_create_product_attribute_values	1	44
2022_08_17_105931_create_product_category	1	45
2022_08_17_111528_drop_product_attributes	1	46
2022_08_17_113326_create_product_selected_attribute_list	1	47
2022_08_17_114730_create_product_docs	1	48
2022_08_17_143257_create_order_products	1	49
2022_08_17_144802_create_product_specifications	1	50
2022_08_17_145318_create_product_variations	1	51
2022_08_19_041937_create_brand	1	52
2022_08_19_042907_add_deleted_to_brand	1	53
2022_08_19_103034_alter_table_product_attribute_change_attribute_type	1	54
2022_08_19_103645_alter_table_product_attribute_change_is_deleted	1	55
2022_08_19_121718_alter_table_product_attribute_values_change_attribute_value_color	1	56
2022_08_19_121948_alter_table_product_attribute_values_change_attribute_value_label	1	57
2022_08_19_124250_create_product_selected_attributes_table	1	58
2022_08_20_050413_add_brand_to_product	1	59
2022_08_23_124030_create_bank_code_types	1	60
2022_08_24_035518_create_store_managers_types	1	61
2022_08_24_081624_add_columns_to_users_table	1	62
2022_08_25_093923_create_posts_table	1	63
2022_08_25_102809_create_post_users_table	1	64
2022_08_26_075605_create_post_likes_table	1	65
2022_08_26_083919_create_post_comments_table	1	66
2022_08_26_094609_create_comment_taged_users_table	1	67
2022_08_26_120123_alter_post_commets_add_extra	1	68
2022_08_26_131152_create_comment_likes_table	1	69
2022_08_27_182018_add_store_id_to_product	1	70
2022_08_29_020455_add_vendor_to_users	1	71
2022_08_30_023652_add_commission_to_stores	1	72
2022_08_30_035602_create_store_likes_table	1	73
2022_08_30_035706_create_product_likes_table	1	74
2022_08_30_053123_create_user_follows_table	1	75
2022_08_30_083554_add_vendor_id_column_to_store_managers_types	1	76
2022_08_30_110300_alter_user_add_about_me	1	77
2022_08_30_113554_alter_post_add_post_status	1	78
2022_08_31_175858_add_verified_to_users	1	79
2022_09_01_093209_create_coupon	1	80
2022_09_02_042305_create_amount_type	1	81
2022_09_02_062335_add_applied_to_coupon	1	82
2022_09_02_070349_create_designation_table	1	83
2022_09_02_105714_add_columns_to_user_table	1	84
2022_09_02_151343_create_coupon_category	1	85
2022_09_02_162532_create_user_privileges_table	1	86
2022_09_03_060222_create_product_temp_image	1	87
2022_09_03_093842_alter_product_attribute_change_attribute_type	1	88
2022_09_04_035948_create_admin_designation	1	89
2022_09_04_144626_create_cart_table	1	90
2022_09_05_073828_add_tax_percentage_to_settings_table	1	91
2022_09_05_094102_remove_unique_phone_from_users_table	1	92
2022_09_06_011715_create_orders	1	93
2022_09_07_014840_add_start_date_coupon	1	94
2022_09_07_015521_add_minimum_amount_coupon	1	95
2022_09_08_010349_create_user_adresses_table	1	96
2022_09_08_024755_create_temp_order_products_table	1	97
2022_09_08_024821_create_temp_orders_table	1	98
2022_09_08_035231_alter_order_products	1	99
2022_09_08_042318_create_payment_report_table	1	100
2022_09_12_124711_drop_amount_type	1	101
2022_09_12_124846_amount_type	1	102
2022_09_13_043222_create_moda_main_categories_table	1	103
2022_09_13_043731_create_moda_sub_categories_table	1	104
2022_09_13_063112_create_hair_colors_table	1	105
2022_09_13_063148_create_skin_colors_table	1	106
2022_09_13_094928_alter_product_add_moda_categories	1	107
2022_09_13_100148_alter_users_add_extra	1	108
2022_09_14_052904_create_store_type_table	1	109
2022_09_14_072323_create_wallet_histories_table	1	110
2022_09_14_072738_alter_users_add_wallet_amount	1	111
2022_09_14_102301_create_my_moda_table	1	112
2022_09_14_104738_create_my_moda_items_table	1	113
2022_09_16_045220_create_post_saves_table	1	114
2022_09_17_060127_alter_posts_add_visibity	1	115
2022_09_19_041614_add_password_reset_code	1	116
2022_09_19_132546_create_help_table	1	117
2022_09_19_141934_add_land_mark	1	118
2022_09_20_094958_add_size_chart	1	119
2022_09_20_114010_add_store_type	1	120
2022_09_21_044300_alter_table_user_privileges_change_user_privileges	1	121
2022_09_21_063311_alter_post_add_extra_image_names	1	122
2022_09_22_062135_create_hide_posts_table	1	123
2022_09_23_043209_drop_brand_from_product	1	124
2022_09_23_043512_add_brand	1	125
2022_09_27_010402_alter_user_add_reset_otp	1	126
2022_09_29_082451_create_wallet_payment_report_table	1	127
2022_09_29_092516_alter_wallet_histories_table_add_pay_method	1	128
2022_10_04_014612_add_return_policy_fields_to_store_table	1	129
2022_10_04_021553_create_profile_bios_table	1	130
2022_10_06_050146_create_favourite_modas_table	1	131
2022_10_06_050331_create_favourite_moda_items_table	1	132
2022_10_06_051237_add_category_to_favourite_moda_items	1	133
2022_10_13_022919_create_coupon_histories_table	1	134
2022_10_13_023759_add_coupon_code_to_temp_order	1	135
2022_10_13_023815_add_coupon_code_to_order	1	136
2022_10_13_041211_alter_user_follows_add_request_status	1	137
2022_10_15_085230_create_stories_table	1	138
2022_10_15_093357_create_story_mentionsses_table	1	139
2022_10_17_092929_create_bad_words_table	1	140
2022_10_17_094023_alter_posts_add_is_exist_bad_word_details	1	141
2022_10_18_040929_create_hide_stories_table	1	142
2022_10_18_044111_create_block_users_table	1	143
2022_10_18_090055_create_user_reports_table	1	144
2022_10_18_123905_create_message_privacies_table	1	145
2022_10_18_124906_alter_user_add_message_privacy_settings	1	146
2022_10_21_013915_add_influencer_det_to_cart	1	147
2022_10_24_090639_create_story_likes_table	1	148
2022_10_24_100922_create_mute_stories_table	1	149
2022_10_28_013453_add_commission_to_users	1	150
2022_11_03_171934_alter_user_reports_add_problem_id	1	151
2022_11_04_125618_alter_stories_add_live_details	1	152
2022_11_05_032320_alter_product_add_return_fields	1	153
2022_11_07_024859_alter_settings_add_moda_commission	1	154
2022_11_08_013231_create_public_business_infos_table	1	155
2022_11_08_013303_create_hash_tags_table	1	156
2022_11_08_014755_add_public_business_info_to_user	1	157
2022_11_15_034933_alter_order_products_add_cols	1	158
2022_11_15_052452_alter_order_products_add_cols2	1	159
2022_11_15_083639_alter_post_comments_add_bad_words_col	1	160
2022_11_17_110723_create_user_locations	1	161
2022_11_17_112757_alter_posts_add_disable_comment	1	162
2022_11_22_010927_add_social_links_in_user	1	163
2022_11_22_012635_add_is_social_to_user	1	164
2022_11_22_013629_add_twitter_url_to_user	1	165
2022_11_23_162258_add_colors_to_my_moda	1	166
2022_11_23_170754_create_post_reports_table	1	167
2022_11_24_035925_create_story_views_table	1	168
2022_11_29_091420_create_post_files_table	1	169
2022_11_29_112711_create_user_favorites_table	1	170
2022_12_03_041816_create_nottification_tracks_table	1	171
2022_12_03_063824_alter_nottification_track_add_key_id	1	172
2022_12_06_010546_add_tiktok_url_to_user	1	173
2022_12_08_011010_create_story_reports_table	1	174
2022_12_12_033723_add_location_name_to_user_locations	1	175
2022_12_13_014746_add_influencer_det_to_temp_order_products	1	176
2022_12_13_014815_add_influencer_det_to_order_products	1	177
2022_12_13_142001_alter_stores_add_sort_order	1	178
2022_12_13_153929_alter_post_files_add_duration	1	179
2022_12_16_093416_create_user_profile_view_insights_table	1	180
2022_12_16_105646_create_post_view_insights_table	1	181
2022_12_27_082326_add_thumb_image_to_posts	1	182
2022_12_27_125550_update_user_address_table	1	183
2022_12_29_024630_alter_post_files_add_thumb_image	1	184
2023_01_03_052708_alter_post_files_add_hls	1	185
2023_01_21_074705_create_account_type_table	1	186
2023_01_21_075655_add_user_type_id_to_users_table	1	187
2023_01_21_094955_add_iban_code_to_bank_details	1	188
2023_01_23_075655_add_activity_type_id_to_users_table	1	189
2023_01_23_131043_create_activity_type_table	1	190
2023_01_24_032855_add_fields_to_user	1	191
2023_01_24_040319_add_address_to_users	1	192
2023_01_24_045910_create_user_vehicle_table	1	193
2023_02_22_075208_add_business_type_id_in_users_table	1	194
2023_02_22_190842_create_menus_table	1	195
2023_02_22_191206_create_menu_item_types_table	1	196
2023_02_22_191212_create_menu_items_table	1	197
2023_02_23_095622_create_wholesale_orders_table	1	198
2023_02_23_100849_create_wholesale_order_items_table	1	199
2023_02_24_053308_create_service_requests_table	1	200
2023_02_24_054539_create_service_request_images_table	1	201
2023_02_24_073249_create_service_request_status_descriptions_table	1	202
2023_02_24_102047_add_activity_id_in_activity_types_table	1	203
2023_03_03_013517_create_videos_table	1	204
2023_03_03_014631_create_photos_table	1	205
2023_03_04_005326_alter_wholesale_orders_add_admin_commission	1	206
2023_03_04_005543_alter_users_add_admin_commission_perc	1	207
2023_03_04_021943_alter_users_change_res_phone	1	208
2023_03_09_124202_add_residence_no	1	209
2023_04_05_041742_alter_table_users_add_rating_rated_count	1	210
2023_04_05_054716_alter_cart_add_user_id_default_value	1	211
2023_04_06_063001_create_coupon_products_table	1	212
2023_04_06_093320_alter_table_temp_orders_add_deligate	1	213
2023_04_10_064941_alter_orders_add_store_id	1	214
2023_04_11_115718_add_account_id_and_activity_id_columns	1	215
2023_04_13_055543_create_deligates_table	1	216
2023_04_13_074120_create_update_account_types	1	217
2023_04_14_090012_alter_order_and_temporder_add_deligate_to_integer	1	218
2023_04_17_050655_create_order_status_histroys_table	1	219
2023_04_17_115907_alter_payment_report_add_extra	1	220
2023_04_18_045607_alter_orders_add_order_otp	1	221
2023_04_19_042326_ater_product_likes_add_product_attribute_id	1	222
2023_04_19_051420_alter_orders_add_rating_fields	1	223
2023_04_20_131036_alter_user_add_banner_image	1	224
2023_04_27_061440_create_food_categories_table	1	225
2023_04_27_081152_create_food_products_table	1	226
2023_04_27_110429_create_food_category_products_table	1	227
2023_04_27_110441_create_food_menu_products_table	1	228
2023_04_28_055018_create_food_headings_table	1	229
2023_04_28_055056_create_food_items_table	1	230
2023_04_28_071321_alter_users_add_hide_profile	1	231
2023_04_28_111835_create_food_product_combos_table	1	232
2023_04_28_111843_create_food_product_combo_items_table	1	233
2023_04_29_104338_alter_orders_add_driver_muted	1	234
2023_04_29_123035_change_food_product_combo_items_constraint	1	235
2023_05_02_120501_create_facilities_table	1	236
2023_05_02_123034_alter_deligates_add_shipping_charge	1	237
2023_05_02_143837_create_reservation_products	1	238
2023_05_02_143926_create_reservation_product_contents	1	239
2023_05_03_054833_alter_service_request_add_extra	1	240
2023_05_03_062139_add_pieces_to_food_products_table	1	241
2023_05_03_072823_create_cart_food_table	1	242
2023_05_03_192616_alter_column_reservation_products_change_data_type	1	243
2023_05_04_093924_alter_service_requests_add_complete_note	1	244
2023_05_04_095135_alter_order_add_delivery_date	1	245
2023_05_04_112427_alter_serivice_requst_add_ex	1	246
2023_05_04_164908_create_reservation_product_ratings	1	247
2023_05_04_171454_add_charges_column_reservation_product	1	248
2023_05_04_192322_create_reservation_bookings	1	249
2023_05_05_101818_create_food_product_likes_table	1	250
2023_05_05_113346_create_provider_packages_table	1	251
2023_05_06_053738_create_food_coupon_categories_table	1	252
2023_05_06_053743_create_food_coupon_products_table	1	253
2023_05_06_060059_alter_provider_packages_add_description	1	254
2023_05_06_060545_alter_user_add_package_details	1	255
2023_05_06_061500_create_provider_package_subscription_histories_table	1	256
2023_05_08_070303_add_type_in_orders_table	1	257
2023_05_08_074139_drop_foreign_constraint_in_order_products_table	1	258
2023_05_10_091652_add_unit	1	259
2023_05_10_170202_create_units_table	1	260
2023_05_11_035825_add_thickness	1	261
2023_05_18_075553_create_collection_points_table	2	262
2023_05_18_094433_create_bag_carts_table	3	265
2023_05_18_114920_create_collections_table	4	266
2023_05_18_115140_create_collection_items_table	4	267
2023_05_18_051947_create_bag_types_table	5	268
2023_05_19_043301_alter_collection_items_add_verified_by	6	269
\.


--
-- Data for Name: moda_main_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moda_main_categories (id, name, created_at, updated_at) FROM stdin;
1	Head	2023-05-18 01:55:48	\N
2	Upper Body	2023-05-18 01:55:48	\N
3	Lower Body	2023-05-18 01:55:48	\N
4	Footwear	2023-05-18 01:55:48	\N
5	Makeup	2023-05-18 01:55:48	\N
6	Accessories	2023-05-18 01:55:48	\N
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
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, created_at, updated_at) FROM stdin;
1	App\\Models\\User	3	Personal Access Token	6b88136166b818c27bcd958093be8facabb1bb7d36afa20f648c6152f8940548	["*"]	\N	2023-05-18 09:30:44	2023-05-18 09:30:44
2	App\\Models\\User	3	Personal Access Token	593f925c74997871162c6bfc951d4b025d9089c10f4453c1c34b261b6163b536	["*"]	\N	2023-05-18 09:32:30	2023-05-18 09:32:30
3	App\\Models\\User	4	Personal Access Token	4b66da665290cc25067ee8022c870bb81dd42a705ebf1b5135a8a1c34e39693f	["*"]	\N	2023-05-18 12:19:08	2023-05-18 12:19:08
4	App\\Models\\User	4	Personal Access Token	51f6fc65f8c417d347644f2fe479b426cc6291f0df69164b0fafd47422fec283	["*"]	\N	2023-05-18 13:10:41	2023-05-18 13:10:41
5	App\\Models\\User	3	Personal Access Token	495b9e7a440bdd81fff1b1acf4124bcbf88161eca8f3f6d87af849f160d495f7	["*"]	\N	2023-05-18 13:10:50	2023-05-18 13:10:50
6	App\\Models\\User	3	Personal Access Token	e71972ed6f2d9caa513d513a886ebe95802fc9701caf78fa8ab54595a779fc6c	["*"]	\N	2023-05-18 13:24:07	2023-05-18 13:24:07
7	App\\Models\\User	3	Personal Access Token	4e82fe409a7295d9f7510ca1d32332396b4a9d3811b3b01d5f06746bc41fdab7	["*"]	\N	2023-05-19 05:23:44	2023-05-19 05:23:44
8	App\\Models\\User	4	Personal Access Token	6d8d923318b2d2a18aca2d42d57ce4035e1ad4d8f763b2299b565edeaba65b1f	["*"]	\N	2023-05-19 05:33:02	2023-05-19 05:33:02
9	App\\Models\\User	3	Personal Access Token	e012a9a1b36877424dfd0c9ccdd04a1623a009fdc212ce0a14230da0a43cc3ff	["*"]	\N	2023-05-19 05:34:49	2023-05-19 05:34:49
10	App\\Models\\User	3	Personal Access Token	86aacfeb9353cf126cb1f6ff624fcd94323f3a2be72c225cc037af5a04150a8b	["*"]	\N	2023-05-19 06:33:32	2023-05-19 06:33:32
11	App\\Models\\User	3	Personal Access Token	20f50c5b46ade45e97e953e9d2adce41f099fcbb7517b1f1368e3b384f9a4915	["*"]	\N	2023-05-19 09:14:22	2023-05-19 09:14:22
12	App\\Models\\User	3	Personal Access Token	527905ef4bc1afe69009e01ed39d289af19ada46603b2d3deb840f6055f4c0ae	["*"]	\N	2023-05-19 09:57:37	2023-05-19 09:57:37
13	App\\Models\\User	3	Personal Access Token	e8cf4aa5db49b456d3f848ca8c491e33cb63752399d6f6d7e36f754b010c533d	["*"]	\N	2023-05-19 10:02:43	2023-05-19 10:02:43
14	App\\Models\\User	4	Personal Access Token	f2419531cba08baf67b6eb2cc5c7b772511d5e7531a172581df1e1a83b34b473	["*"]	\N	2023-05-19 12:12:16	2023-05-19 12:12:16
15	App\\Models\\User	4	Personal Access Token	8051c44213b4c18002a382e65ca54bdc9883ed2bf4e93d4eb17b47231ada1b73	["*"]	\N	2023-05-19 12:35:30	2023-05-19 12:35:30
16	App\\Models\\User	4	Personal Access Token	e29b93b7746d75edeb67f1f616d94c9adcf6e04174ae705656c7d4c2444edd84	["*"]	\N	2023-05-19 12:37:24	2023-05-19 12:37:24
17	App\\Models\\User	4	Personal Access Token	4f42d018dc1af9b779480417a9aa33af730991721dfe72f1c51a81c188f37440	["*"]	\N	2023-05-19 12:38:42	2023-05-19 12:38:42
18	App\\Models\\User	4	Personal Access Token	26c97ace41fc7e79c73cfb334c7dcde3b8e48cdbeed8f1b8c55b961f36dad021	["*"]	\N	2023-05-19 12:40:10	2023-05-19 12:40:10
19	App\\Models\\User	4	Personal Access Token	20730f52f27437956c2437cc45b2caba945c35d970dc0e7a5e315b429337608a	["*"]	\N	2023-05-19 12:49:10	2023-05-19 12:49:10
20	App\\Models\\User	4	Personal Access Token	2bd0bdbe7db57a3efee9df82a7e73bc19d17256126cb6a2cb01ad9eb0ea335f7	["*"]	\N	2023-05-19 13:21:52	2023-05-19 13:21:52
21	App\\Models\\User	4	Personal Access Token	0f9e12c5e99a21cdc5033661425b3df4acd9f5efe9a81b1d363d0753168e1258	["*"]	\N	2023-05-19 13:22:22	2023-05-19 13:22:22
22	App\\Models\\User	4	Personal Access Token	7a3670d68da4ef2b592d149dec88d98a5c1ebc78e7442bd5475426e11e11ee2b	["*"]	\N	2023-05-19 13:29:55	2023-05-19 13:29:55
23	App\\Models\\User	3	Personal Access Token	dd6ee0f3a5f0a0be040ab306a20c96f88f1f28470fe8417d59e878f501fe8fbe	["*"]	\N	2023-05-20 05:56:39	2023-05-20 05:56:39
24	App\\Models\\User	4	Personal Access Token	d21f0ea7812e0dba074d5974a7060c8dcfd2cf08f813948f32fb8fc0bfcccdf2	["*"]	\N	2023-05-20 06:38:31	2023-05-20 06:38:31
25	App\\Models\\User	3	Personal Access Token	2181471fa3dae4cb0f83bd5596be35b03bb34093d6a2aacfc45357be6f89e064	["*"]	\N	2023-05-20 06:39:36	2023-05-20 06:39:36
26	App\\Models\\User	3	Personal Access Token	36239844a9ed589de94f2ed206ff8165819eedf4014f8e46f6af2e48bd0ecaf5	["*"]	\N	2023-05-20 07:01:26	2023-05-20 07:01:26
27	App\\Models\\User	5	Personal Access Token	6152c6d943a9c8770a6db4338136ac4ea8ad764629e68919e38a7b37c9ee0c7d	["*"]	\N	2023-05-20 07:31:17	2023-05-20 07:31:17
28	App\\Models\\User	4	Personal Access Token	595ec173ed2ad603384fe2d7b0e9d00cc5e122a235fc9fce19fcaff13bf4202e	["*"]	\N	2023-05-20 11:55:31	2023-05-20 11:55:31
29	App\\Models\\User	4	Personal Access Token	8c224326eafe85aefe28cf52ba7742700ce1c4d85e5810f1efaafe599e1cafd9	["*"]	\N	2023-05-20 12:20:47	2023-05-20 12:20:47
30	App\\Models\\User	7	Personal Access Token	dc6eaf717d50634de23d6a50e3a0dcb165df07d691627abfa0a49e9f1fe81382	["*"]	\N	2023-05-21 19:20:37	2023-05-21 19:20:37
31	App\\Models\\User	8	Personal Access Token	b6215d517137f5053f4af0ca39e4a6d5653e8d3792ce4fe074b410736e153534	["*"]	\N	2023-05-21 19:34:18	2023-05-21 19:34:18
32	App\\Models\\User	4	Personal Access Token	459579ad017ce3d3f8f50db473a194123df54c8b7cd94ee7a36802cd9facf5ee	["*"]	\N	2023-05-22 04:45:56	2023-05-22 04:45:56
33	App\\Models\\User	3	Personal Access Token	c7aa5c7bae3b30b8bc7dcbd2658f297a25236600856d569dbd49c31fd0a45f30	["*"]	\N	2023-05-22 05:54:21	2023-05-22 05:54:21
34	App\\Models\\User	4	Personal Access Token	0ae134e33206270b4b80828382ae0a67eef64bdf6363f91cc1c0b4104efbdb75	["*"]	\N	2023-05-22 06:02:59	2023-05-22 06:02:59
35	App\\Models\\User	3	Personal Access Token	bd87d227a5d6761991b9ada05b7ea91916bff07c0b781fbe06fb5f2c345f70b2	["*"]	\N	2023-05-22 06:25:18	2023-05-22 06:25:18
36	App\\Models\\User	3	Personal Access Token	e85c87b4f2ed5de540f1a0bc73fc33c4609472f5decbcc0bc41eab0d67f758d3	["*"]	\N	2023-05-22 06:27:57	2023-05-22 06:27:57
37	App\\Models\\User	4	Personal Access Token	f9d470e895de067dfc43e4db00aa20e0760acb1ebbd5c708c19a6723ad776571	["*"]	\N	2023-05-22 06:39:28	2023-05-22 06:39:28
38	App\\Models\\User	3	Personal Access Token	7ce5ef528aa74514416ba4276077fb1c480403315c2db100488e44c19263dea7	["*"]	\N	2023-05-22 06:40:22	2023-05-22 06:40:22
39	App\\Models\\User	4	Personal Access Token	8560959e028a3d830748cf5bc8730dc0adf0306798a397cbbb08a45d511dc865	["*"]	\N	2023-05-22 06:57:36	2023-05-22 06:57:36
40	App\\Models\\User	3	Personal Access Token	af0e1e8d9a66562a7496c40fd01210993649d5ff47dd06086cf822f6a7addc45	["*"]	\N	2023-05-22 07:02:56	2023-05-22 07:02:56
41	App\\Models\\User	4	Personal Access Token	c4cd91a1440ef9113ba06f94eb826959e1af18b51e9bb692241d5637494536b0	["*"]	\N	2023-05-22 07:09:49	2023-05-22 07:09:49
42	App\\Models\\User	3	Personal Access Token	0aacf201a2f21183c95b3d515dfc298545b10711da2874f30aefe8dcaeb7399a	["*"]	\N	2023-05-22 08:06:26	2023-05-22 08:06:26
43	App\\Models\\User	3	Personal Access Token	5702d0dd3658f8cd7fc20641a04e6f08135f84dddeb4b9ff1fd9d1d0db19f2a0	["*"]	\N	2023-05-22 08:38:44	2023-05-22 08:38:44
44	App\\Models\\User	3	Personal Access Token	a21db9181123f6c9d637d4aeff68034b2b61ef3dee77a4bae5b14a27d76aae63	["*"]	\N	2023-05-22 08:39:51	2023-05-22 08:39:51
45	App\\Models\\User	3	Personal Access Token	82a487c485f03c4f9708f8240579d1c456eb4194fdfe2a634e2c21b15e47f8ca	["*"]	\N	2023-05-22 08:51:48	2023-05-22 08:51:48
46	App\\Models\\User	7	Personal Access Token	4d17409d98abae8e09edec33f6f1cd268c8e7398a98dbcb8107b47716fb87619	["*"]	\N	2023-05-22 10:03:53	2023-05-22 10:03:53
47	App\\Models\\User	4	Personal Access Token	df2e00a783663658fb51c9646a0a6f264126818f534490589b42257eddd72b18	["*"]	\N	2023-05-22 10:48:09	2023-05-22 10:48:09
48	App\\Models\\User	8	Personal Access Token	2f6e5813c935ba0848c6de079b11ef8b3295684e4bf6ce85657657dc719e334a	["*"]	\N	2023-05-22 10:50:31	2023-05-22 10:50:31
49	App\\Models\\User	7	Personal Access Token	6a6cdb113c0b5f3df8e0e79d7d19fe953f65df7dbc625e4a99c94412284516c4	["*"]	\N	2023-05-22 10:57:36	2023-05-22 10:57:36
50	App\\Models\\User	9	Personal Access Token	c620f537861b5090e460d80fdba447fccf725930a492cfbfc401a28c7ec43320	["*"]	\N	2023-05-22 11:03:25	2023-05-22 11:03:25
51	App\\Models\\User	8	Personal Access Token	cb43eecd13ede6ad0f5eb4a0f10e085d845c5dbe16495a765f48aabf0eb02014	["*"]	\N	2023-05-22 11:25:25	2023-05-22 11:25:25
52	App\\Models\\User	8	Personal Access Token	2d891f17b0b4b97a6991e0f24a8c9a8c99b95723962ef0fc86ef095fb81c1c32	["*"]	\N	2023-05-22 11:29:11	2023-05-22 11:29:11
53	App\\Models\\User	7	Personal Access Token	58a42edf9c7a1c5f6b511154e16a590a5e4b1580a8fb4bdc5bdc084cef42f7db	["*"]	\N	2023-05-22 11:33:45	2023-05-22 11:33:45
54	App\\Models\\User	8	Personal Access Token	b12f6b5e7e53175fb8a48df58298f9f24c12fed2c2124c569a57aed0a7b20204	["*"]	\N	2023-05-22 11:36:03	2023-05-22 11:36:03
55	App\\Models\\User	7	Personal Access Token	21ae8bc12ec8bf89add5e59cc4239619228e4f1ea35180d9a4acf59ab89fe0f2	["*"]	\N	2023-05-22 11:36:46	2023-05-22 11:36:46
56	App\\Models\\User	8	Personal Access Token	52c1f1a02ad22dabd6e62aa029ac2c903d01f4cab93db77c5ea8f73fd1924588	["*"]	\N	2023-05-22 11:37:23	2023-05-22 11:37:23
57	App\\Models\\User	9	Personal Access Token	c7226b285a0bcfdb932ceda6c5a8ddd998733fa04144054c9dc93a435d4aec9e	["*"]	\N	2023-05-22 11:48:15	2023-05-22 11:48:15
58	App\\Models\\User	8	Personal Access Token	ede62b7a4b7e4ebdb48377f63057cd43b3dd0347f08010057929407471436ffa	["*"]	\N	2023-05-22 11:54:05	2023-05-22 11:54:05
59	App\\Models\\User	9	Personal Access Token	4772fe0af2e93a69d9ae892a75e019310a54adafef6a7330521c6d0ada383709	["*"]	\N	2023-05-22 11:56:12	2023-05-22 11:56:12
60	App\\Models\\User	4	Personal Access Token	64d07a9f3566fb207d44a59ca15aa92fc772467adca72841d10f4afdd8c98ee2	["*"]	\N	2023-05-22 11:58:15	2023-05-22 11:58:15
61	App\\Models\\User	8	Personal Access Token	1780ea09ef38576d4d11f60a9276ca83e8d4e460db89027fd23a3943f5274318	["*"]	\N	2023-05-22 12:00:27	2023-05-22 12:00:27
62	App\\Models\\User	4	Personal Access Token	847cdf2d0ae1b5f981f77663b9b4a28e663bfc4f7a1362c915981714d3637eb3	["*"]	\N	2023-05-22 12:00:50	2023-05-22 12:00:50
63	App\\Models\\User	3	Personal Access Token	7790a00f2be09eb8d8d73c005f2304b8f2a09254e0c92ad6eaf2edeaaa9a2bfa	["*"]	\N	2023-05-22 12:01:49	2023-05-22 12:01:49
64	App\\Models\\User	3	Personal Access Token	dc10a94fa57bb944ef3f75fb0cc76e6431004a0f0350b97f03efc7b6d8021fdc	["*"]	\N	2023-05-22 12:04:10	2023-05-22 12:04:10
65	App\\Models\\User	8	Personal Access Token	2b0ac76ea27032b916414a5e77a9c3d881e07e7595bee5e07e98d413c49531f0	["*"]	\N	2023-05-22 12:08:25	2023-05-22 12:08:25
66	App\\Models\\User	4	Personal Access Token	745a7e09fe4fed664db9937ae25df1ba80d04c750cb00865704298a3525fc9ca	["*"]	\N	2023-05-22 12:10:09	2023-05-22 12:10:09
67	App\\Models\\User	4	Personal Access Token	3c95abbac634448fafd489c36b49514aa9b8932762694bb3fcb51cac4ae4610e	["*"]	\N	2023-05-22 12:24:36	2023-05-22 12:24:36
68	App\\Models\\User	3	Personal Access Token	0985343ed0dc7edb472efa548860a51f7474183cb83e460410200179403bf876	["*"]	\N	2023-05-22 12:25:24	2023-05-22 12:25:24
69	App\\Models\\User	4	Personal Access Token	ece9a9d5c1c3940c1cb760ac4612f13e4b541a1192d7b021573bcbd856ff829a	["*"]	\N	2023-05-22 12:28:54	2023-05-22 12:28:54
70	App\\Models\\User	8	Personal Access Token	a5ca57a6f5995d1071376c5d2387e6f6ab3362ce32765855b5bca1190a2e14b6	["*"]	\N	2023-05-22 13:18:33	2023-05-22 13:18:33
71	App\\Models\\User	10	Personal Access Token	0b07689f8c42298796bc2cea0e3b597b88722c6737bbe9183c3db81cee09fd79	["*"]	\N	2023-05-22 13:23:12	2023-05-22 13:23:12
72	App\\Models\\User	10	Personal Access Token	d28b811d4c1a55390c03e40a379c6a18e2a7e1be98c8929620a835880f3b03d5	["*"]	\N	2023-05-22 13:34:33	2023-05-22 13:34:33
73	App\\Models\\User	9	Personal Access Token	fde14528af5dd2119ed6841ab0c6a41f445951c8c7da4f4d43e7526db56dcf85	["*"]	\N	2023-05-22 13:36:09	2023-05-22 13:36:09
74	App\\Models\\User	8	Personal Access Token	124cc17705159118fe2e14edb5ee1d21002938ab2072104cfeacd15ac33fd90a	["*"]	\N	2023-05-22 13:36:14	2023-05-22 13:36:14
75	App\\Models\\User	8	Personal Access Token	bd8b2265e4a3168e4f6af50183a0f61baa9893956f0feaff131b0a88f04aef7e	["*"]	\N	2023-05-22 13:37:32	2023-05-22 13:37:32
76	App\\Models\\User	9	Personal Access Token	f508268e68095b4f65cd6d9a2227a21d2c43af57f819323ebd5b8215dab31bdb	["*"]	\N	2023-05-22 13:42:04	2023-05-22 13:42:04
77	App\\Models\\User	8	Personal Access Token	07286f746e487c18b181305f654474da32f43540fa37a5b2fde5d9412d4b995b	["*"]	\N	2023-05-22 13:49:45	2023-05-22 13:49:45
78	App\\Models\\User	8	Personal Access Token	18ac099e42ba82e533ab42390613589acab17ae6b565bab23a3bac7935bfc11a	["*"]	\N	2023-05-22 13:59:19	2023-05-22 13:59:19
79	App\\Models\\User	10	Personal Access Token	b374212b44c95ca557fe9f6c82da8e178e82a495d430f4c578d83ab41241abff	["*"]	\N	2023-05-22 14:03:42	2023-05-22 14:03:42
80	App\\Models\\User	10	Personal Access Token	b29136354966c41db4a9c9c714039d4b9b065da49a7ee84ebff326a2064d2782	["*"]	\N	2023-05-22 18:31:07	2023-05-22 18:31:07
81	App\\Models\\User	10	Personal Access Token	6b3b538e246581f4307b0aa1c2ed2cd4d91ff6cf32a9c830cfb4f4244a379095	["*"]	\N	2023-05-22 18:32:36	2023-05-22 18:32:36
82	App\\Models\\User	11	Personal Access Token	a8e12c5049267ec8e19dce9f1e1dcc9183f5adbfb29c6c38d7da642656ca07cb	["*"]	\N	2023-05-22 18:48:40	2023-05-22 18:48:40
83	App\\Models\\User	9	Personal Access Token	32e89ded28bc9d77f603d8ae2817dd25d45b7d070629439856fc83db3971adac	["*"]	\N	2023-05-23 04:58:57	2023-05-23 04:58:57
84	App\\Models\\User	3	Personal Access Token	0e78aa88ada866387d5a5e09801b54e5e7ab2315a0da609834a681d157786383	["*"]	\N	2023-05-23 04:59:28	2023-05-23 04:59:28
85	App\\Models\\User	8	Personal Access Token	680fc9e75b95a84e4e2f24a7968e02f8d5c40149d875b882d544445b772a9311	["*"]	\N	2023-05-23 05:00:04	2023-05-23 05:00:04
86	App\\Models\\User	7	Personal Access Token	3db2335566f3168be3b8c5a0b5c6cc72bff674f78d9043ee60ecfc73f9925214	["*"]	\N	2023-05-23 05:23:31	2023-05-23 05:23:31
87	App\\Models\\User	11	Personal Access Token	b0ad0cee93bbea719d5d80a1a5d042efac69ce25d32449a74c5422f2111bc213	["*"]	\N	2023-05-23 05:45:13	2023-05-23 05:45:13
88	App\\Models\\User	10	Personal Access Token	a19473d067bea31019557489876bef28ed4293f5bfb9d6feff1537be653f0562	["*"]	\N	2023-05-23 06:05:04	2023-05-23 06:05:04
89	App\\Models\\User	3	Personal Access Token	6cc1ede890fa18547a0ad57d0fde32266df31246aea5411e9b5f7f7b10cec6b8	["*"]	\N	2023-05-23 06:09:21	2023-05-23 06:09:21
90	App\\Models\\User	4	Personal Access Token	9d422733ab1d032ea1a62f6ed7ab3841985229444f389123398889f756abb562	["*"]	\N	2023-05-23 06:28:23	2023-05-23 06:28:23
91	App\\Models\\User	3	Personal Access Token	3ac086517893b34eb9df27931706c091f62c0df584086673a26f037e8b5a1335	["*"]	\N	2023-05-23 06:44:47	2023-05-23 06:44:47
92	App\\Models\\User	3	Personal Access Token	c7e02bb038dfeff4082b296cc5546d3619af086821cdf879ce71a060d312cc05	["*"]	\N	2023-05-23 07:35:12	2023-05-23 07:35:12
93	App\\Models\\User	4	Personal Access Token	fae28be17c0fb7755a2a547cc72030843723b01eedb6b6afd5b3f7024203fc79	["*"]	\N	2023-05-23 07:41:48	2023-05-23 07:41:48
94	App\\Models\\User	4	Personal Access Token	877013887a05774d36bafc357a7d5b6ba4e452b92c6179b09f2cfc0246627e59	["*"]	\N	2023-05-23 08:05:10	2023-05-23 08:05:10
95	App\\Models\\User	3	Personal Access Token	833cc623bc4d39d420f615dae84305ca90e2dfe649646b4d3b2ced489b742f48	["*"]	\N	2023-05-23 08:14:52	2023-05-23 08:14:52
96	App\\Models\\User	4	Personal Access Token	23e564ec528b3d117fcb3506de7c6ef2b5f60db2a3276f03e94081ad47eb0277	["*"]	\N	2023-05-23 08:15:14	2023-05-23 08:15:14
97	App\\Models\\User	3	Personal Access Token	90bb82548d2057375547a0af9ad0acfed99d0c21bab3a676769eb33e8fa27d0e	["*"]	\N	2023-05-23 08:20:41	2023-05-23 08:20:41
98	App\\Models\\User	4	Personal Access Token	f4a32fa96a237b25c2c1c0c4882797f10ce6338672fddf5a96439b61982bbd75	["*"]	\N	2023-05-23 08:21:41	2023-05-23 08:21:41
99	App\\Models\\User	4	Personal Access Token	016194bf81f52d1043eb6a07cda244bc8c1025fd44423b94643d2ce94a978894	["*"]	\N	2023-05-23 08:23:05	2023-05-23 08:23:05
100	App\\Models\\User	4	Personal Access Token	32606c1a51f1714f04bb8445ca2df70c4fd6fc4767a5ff5ee32aac061650d090	["*"]	\N	2023-05-23 08:29:48	2023-05-23 08:29:48
101	App\\Models\\User	3	Personal Access Token	e53b78759dfe260554788881cf0001086d6ab42996130b71840748804be4449f	["*"]	\N	2023-05-23 08:30:41	2023-05-23 08:30:41
102	App\\Models\\User	10	Personal Access Token	2dc8630559ff27efb9b79165e10a03962299ece877cb8c3f2ef19acee3768aeb	["*"]	\N	2023-05-23 10:18:36	2023-05-23 10:18:36
103	App\\Models\\User	8	Personal Access Token	a295d67d9ab7048776a20808561153d18d973fa71b8897a25bf32807941da799	["*"]	\N	2023-05-23 10:34:21	2023-05-23 10:34:21
104	App\\Models\\User	4	Personal Access Token	8a19e3123fe315a5a0251c289528a843f63968f00f4e4c7f341c5c9b35fe3a64	["*"]	\N	2023-05-23 10:52:26	2023-05-23 10:52:26
105	App\\Models\\User	4	Personal Access Token	e210c8c8a4638bd8f33d3dfa328f9f3118f6a97cf1a05c96a8ed9adb4a823f75	["*"]	\N	2023-05-23 10:58:10	2023-05-23 10:58:10
106	App\\Models\\User	3	Personal Access Token	0ef536abead2608a55fe65fa024cc613181960ffbd73e8db84b10956185b0477	["*"]	\N	2023-05-23 10:59:03	2023-05-23 10:59:03
107	App\\Models\\User	3	Personal Access Token	09714b05ab027d43fc7655794a4096093a5d16031abf46649337b3eac5b9dbb7	["*"]	\N	2023-05-23 12:37:12	2023-05-23 12:37:12
108	App\\Models\\User	4	Personal Access Token	441b0e0f492a9c730965104144fe518ffdf698ef649caa491b4efae81bed17f0	["*"]	\N	2023-05-23 12:43:24	2023-05-23 12:43:24
109	App\\Models\\User	3	Personal Access Token	e8dadd8a94b7b404fdf701fac5f33ec32bd5143550aa84ec6f2e203bfe7b9892	["*"]	\N	2023-05-23 12:44:35	2023-05-23 12:44:35
110	App\\Models\\User	4	Personal Access Token	ed5c9c3d5a9aafdb9c6b211294b4a628aa513e06a0b974a94b8d57dd590763fd	["*"]	\N	2023-05-23 12:51:15	2023-05-23 12:51:15
111	App\\Models\\User	3	Personal Access Token	c113db0f0e3ce74db1c3690ab9c74f56d7c31266d2eda584c8a13042bb6bd7c6	["*"]	\N	2023-05-23 12:51:35	2023-05-23 12:51:35
112	App\\Models\\User	11	Personal Access Token	e207e49df5bd16f7fe6644fa054d9b22e152447eacc0dca6a38f60e0b243a643	["*"]	\N	2023-05-23 12:53:18	2023-05-23 12:53:18
113	App\\Models\\User	3	Personal Access Token	0a210d86f8d4a988f482fcf0b2fb1f0b61c7487898e6324b5f8ccf16d2cf5d98	["*"]	\N	2023-05-23 13:04:38	2023-05-23 13:04:38
114	App\\Models\\User	4	Personal Access Token	e8a2e28ef0016a2ce12c8e15d846771af30492014882affe4d3912dc4a53cb99	["*"]	\N	2023-05-23 13:30:08	2023-05-23 13:30:08
115	App\\Models\\User	3	Personal Access Token	943b138974520334b602ac90ace036f5d3f9a6a34833ad884003360c1b72c720	["*"]	\N	2023-05-23 13:43:45	2023-05-23 13:43:45
116	App\\Models\\User	10	Personal Access Token	352c0a3fd63b191cbc019c590cfd188791c213840fe7d9164cac09f2e1c79647	["*"]	\N	2023-05-23 15:49:07	2023-05-23 15:49:07
117	App\\Models\\User	10	Personal Access Token	e7312d91e06332e805461128e563c88b728b2c77634394214ef077d80d74e2fb	["*"]	\N	2023-05-23 15:55:37	2023-05-23 15:55:37
118	App\\Models\\User	12	Personal Access Token	635a14661359bd45135706432c4062bc4f6aee4f86587a3ffeebdc3f47c25a30	["*"]	\N	2023-05-23 15:59:24	2023-05-23 15:59:24
119	App\\Models\\User	11	Personal Access Token	8f23f2ddb352fd10e7e4fe7eaa3b65bf027355344fbbdf01d8a3b7dcab078b0b	["*"]	\N	2023-05-23 16:17:39	2023-05-23 16:17:39
120	App\\Models\\User	12	Personal Access Token	28de23f91282b30ba1ae6fd6489f8c61545de13c7a89dcf75b29ac510c841225	["*"]	\N	2023-05-23 16:19:53	2023-05-23 16:19:53
121	App\\Models\\User	8	Personal Access Token	4d204eb5a2a9bf4574bd0454e3bd7276ee4b7c3272abaf0522218ca06d162fe1	["*"]	\N	2023-05-23 16:24:52	2023-05-23 16:24:52
122	App\\Models\\User	10	Personal Access Token	9fac5138bc3e5549b66c72af4f4152938f0986da212bb083b1830c9cc8796052	["*"]	\N	2023-05-23 16:37:52	2023-05-23 16:37:52
123	App\\Models\\User	10	Personal Access Token	36b404d960359c93547881e29ea9dc9b7d5c3697b53be828ab1f9bbefbda5ec6	["*"]	\N	2023-05-23 16:44:23	2023-05-23 16:44:23
124	App\\Models\\User	3	Personal Access Token	024164a777590bb6d04f7083757eda957132b66399e9c1278e5723544250b5d0	["*"]	\N	2023-05-24 04:09:20	2023-05-24 04:09:20
125	App\\Models\\User	10	Personal Access Token	87ff6ec244fb4eb24cf1d4687f96c7f5b24dad425d01c6342c524b0a9004a0b7	["*"]	\N	2023-05-24 05:00:38	2023-05-24 05:00:38
126	App\\Models\\User	3	Personal Access Token	4e8c299387c751d11989dcf9752b3d291627345759ec69898333e73d7f800c4c	["*"]	\N	2023-05-24 05:06:21	2023-05-24 05:06:21
127	App\\Models\\User	11	Personal Access Token	8ee8d72573136eb24f77f38976eb9b8084f506cba55db33aed7eb8b991c9fc3f	["*"]	\N	2023-05-24 05:19:36	2023-05-24 05:19:36
128	App\\Models\\User	10	Personal Access Token	e77809017db8bf5084d873d44917a60efbdfb8fc5082996a17c0755573c27571	["*"]	\N	2023-05-24 06:04:10	2023-05-24 06:04:10
129	App\\Models\\User	11	Personal Access Token	3e2103155e4908bcf772d1199274b3d8b4e238cdc08e56dc0054a3875c0bf0b9	["*"]	\N	2023-05-24 06:16:19	2023-05-24 06:16:19
130	App\\Models\\User	10	Personal Access Token	dd74242afaab969d4a27887d337c6102a49efedfa0f87a62b39eb8400d18b332	["*"]	\N	2023-05-24 06:23:49	2023-05-24 06:23:49
131	App\\Models\\User	10	Personal Access Token	73211217e9dd6d3b5e7351688551ed862eec56c32ab12ce24ce14c3255e95f0e	["*"]	\N	2023-05-24 06:43:42	2023-05-24 06:43:42
132	App\\Models\\User	10	Personal Access Token	a259bdadca9509c030b884f5c85df6d88e05362397e7bde243835238dd9edd5c	["*"]	\N	2023-05-24 07:03:39	2023-05-24 07:03:39
133	App\\Models\\User	10	Personal Access Token	f2aade020fb14aeee6100e996f0704edfa9a82a2afc3c6b5658fb6c5ce00fe40	["*"]	\N	2023-05-24 08:47:52	2023-05-24 08:47:52
134	App\\Models\\User	8	Personal Access Token	ce0afba3d98a4d0cfefa8efc670a6bfd0f23818fb849989db35075e126ca1413	["*"]	\N	2023-05-24 08:54:38	2023-05-24 08:54:38
135	App\\Models\\User	10	Personal Access Token	41ccf58cb851850251d16ebca23e85bd2ac9f05e10048ac169498058e55766b5	["*"]	\N	2023-05-24 10:08:13	2023-05-24 10:08:13
136	App\\Models\\User	11	Personal Access Token	c90c7e45a653ced67a7913c2c760cad346ac3c10a4a57d3d4c13203ae0131143	["*"]	\N	2023-05-24 10:12:37	2023-05-24 10:12:37
137	App\\Models\\User	4	Personal Access Token	35927dec64c372b517d38fec9fd9f11cef003d3ff4b28a7be1747a1e3cc28420	["*"]	\N	2023-05-24 11:06:18	2023-05-24 11:06:18
138	App\\Models\\User	3	Personal Access Token	8eed1e27ffdc06758730079da75e179025c9aa5ea04d79ec213db6c2a0211fbd	["*"]	\N	2023-05-24 11:07:39	2023-05-24 11:07:39
139	App\\Models\\User	3	Personal Access Token	96b3b19c5fb169702288d4f4bff5c5990e168717a925d7f0fdae83835c306093	["*"]	\N	2023-05-24 11:23:28	2023-05-24 11:23:28
140	App\\Models\\User	3	Personal Access Token	4eba85a06bf008d1346fdf94d1b57967660fd1d239382916d65655b3a664af05	["*"]	\N	2023-05-24 11:44:44	2023-05-24 11:44:44
141	App\\Models\\User	10	Personal Access Token	ebe972606dd9a5e629d81d790f09fdf8096bad8fed07d3d7be623f0bf993ae1e	["*"]	\N	2023-05-24 12:00:11	2023-05-24 12:00:11
142	App\\Models\\User	11	Personal Access Token	1978eb1b5f98252ef85eba9145ced849eaa7b774bfce41a413f9f0048a76287a	["*"]	\N	2023-05-24 12:04:05	2023-05-24 12:04:05
143	App\\Models\\User	10	Personal Access Token	5bef5278c7dff4588d911d9308f4d1bb782d51ce792c8c66b3e22362866542d8	["*"]	\N	2023-05-24 12:05:17	2023-05-24 12:05:17
144	App\\Models\\User	9	Personal Access Token	b19b0bedc4e6d4b464a25d727e477b1ff671b8b74c5340cd4f0cd7eb955213d8	["*"]	\N	2023-05-24 12:09:20	2023-05-24 12:09:20
145	App\\Models\\User	10	Personal Access Token	cabdb93356c9b9d6da3dfd79fde74e13a49dab57d0106841728d6e91055ad4f1	["*"]	\N	2023-05-24 13:04:02	2023-05-24 13:04:02
146	App\\Models\\User	8	Personal Access Token	945eb8270283d44252cdda0af3b9433cf7b27238c941b78314e070045a51e386	["*"]	\N	2023-05-24 13:06:03	2023-05-24 13:06:03
147	App\\Models\\User	10	Personal Access Token	77c5f2c7c21479b7a0f1d5b1c2a45611c42e20d65fc89e8bf2fd5b3529ad9186	["*"]	\N	2023-05-24 13:09:19	2023-05-24 13:09:19
148	App\\Models\\User	10	Personal Access Token	12cbd7cbc999667c045b2961f496eaa2e7fb5ddd77dfb3e17d17b74d9a048cbc	["*"]	\N	2023-05-24 13:13:36	2023-05-24 13:13:36
149	App\\Models\\User	10	Personal Access Token	e107e85a5343601746355bc521e4b7045d2b6e4ac4f7c0213799036b6a95d5db	["*"]	\N	2023-05-24 13:24:34	2023-05-24 13:24:34
150	App\\Models\\User	8	Personal Access Token	8137435867336e5ba20edab6c3c2424c103d6bbbc2bc09e206a34156d19fa9b3	["*"]	\N	2023-05-29 05:03:18	2023-05-29 05:03:18
151	App\\Models\\User	10	Personal Access Token	789b06b36f12b6fd2cd9ccde12eccb0e24b1e70505ff35bfa68f120a6dacd788	["*"]	\N	2023-05-29 05:24:45	2023-05-29 05:24:45
152	App\\Models\\User	10	Personal Access Token	7fce77d557baca744584dba5ea22ebef39e0e47256b554c231374ea0d5a122a3	["*"]	\N	2023-05-29 06:05:41	2023-05-29 06:05:41
153	App\\Models\\User	10	Personal Access Token	b70b286cd3869b0b8d4ebedae0bf4f0407762575db109d4479b8c264e17a095a	["*"]	\N	2023-05-29 06:11:09	2023-05-29 06:11:09
154	App\\Models\\User	12	Personal Access Token	7f1d1d1c2187a8045f87f24f32035473dd5af24f87ab8cf508677b1267b48a54	["*"]	\N	2023-05-29 06:18:18	2023-05-29 06:18:18
155	App\\Models\\User	10	Personal Access Token	450f3d77bf21b7e9e80dbe78697c67317f8b3b5d53f5dc38392453d4b00d210c	["*"]	\N	2023-05-29 06:19:09	2023-05-29 06:19:09
156	App\\Models\\User	12	Personal Access Token	d1b4bd2efc703639156b94b4e5af7e72056feb932dfa11b00f0a41d605427c9f	["*"]	\N	2023-05-29 06:22:03	2023-05-29 06:22:03
157	App\\Models\\User	10	Personal Access Token	abf413050e015cdbcf787b6463c8f65a76ef5c71c046448dce262f8b325d106d	["*"]	\N	2023-05-29 06:23:40	2023-05-29 06:23:40
158	App\\Models\\User	7	Personal Access Token	e0aedb45f43dfd73396b63835ddc260641480bfe6129055f3019805fca0ab578	["*"]	\N	2023-05-29 06:31:22	2023-05-29 06:31:22
159	App\\Models\\User	3	Personal Access Token	a453886886c98c2a83f59213e647f7c77d6716f81befc632a3a8f1b461024439	["*"]	\N	2023-05-29 06:52:49	2023-05-29 06:52:49
160	App\\Models\\User	3	Personal Access Token	eff4df40a3e4b1639c056147be1889e146dab726ed99e090f456312f8abece7b	["*"]	\N	2023-05-29 06:54:52	2023-05-29 06:54:52
161	App\\Models\\User	9	Personal Access Token	231247da753510a54f3223897d89535949e8ccb3eeb666e4250a62b7102c4db2	["*"]	\N	2023-05-29 07:00:57	2023-05-29 07:00:57
162	App\\Models\\User	11	Personal Access Token	87ecc85b092118549c37a73a753673bbcd1c8903747f589d87e73bf99fa85560	["*"]	\N	2023-05-29 07:05:32	2023-05-29 07:05:32
163	App\\Models\\User	10	Personal Access Token	796ade5038ea648808fe07176da51d830532003290d7966b8efa57b440a53cb2	["*"]	\N	2023-05-29 07:09:51	2023-05-29 07:09:51
164	App\\Models\\User	8	Personal Access Token	9761a6cbd7a6ca747480f8945202c659455cdbb782fbc0f6ec10b4a8add2f295	["*"]	\N	2023-05-29 07:12:32	2023-05-29 07:12:32
165	App\\Models\\User	10	Personal Access Token	8d38375481a69cde3b1a1a761a639dd76dd4b76c800a92ded060f09c0ed284b5	["*"]	\N	2023-05-29 07:16:28	2023-05-29 07:16:28
166	App\\Models\\User	8	Personal Access Token	13dfa32ef84156dea9e6ca0fe2775cd65e6f2714303220076a99145504192770	["*"]	\N	2023-05-29 07:18:35	2023-05-29 07:18:35
167	App\\Models\\User	10	Personal Access Token	07da44cba9e2b53844c0b05c316d6b54e9c0e2608545ca7a895b6505a9b4ac75	["*"]	\N	2023-05-29 07:25:01	2023-05-29 07:25:01
168	App\\Models\\User	8	Personal Access Token	fdc7df0fead1df7c74b565a710950c9559af01d8c9bbd061bd603752dae156cd	["*"]	\N	2023-05-29 07:27:02	2023-05-29 07:27:02
169	App\\Models\\User	10	Personal Access Token	3e9a38c7f8774f06728a25ed29406f920dd1ae1877ba08128c282f2c0bebe7cc	["*"]	\N	2023-05-29 07:31:39	2023-05-29 07:31:39
170	App\\Models\\User	11	Personal Access Token	411fb4a3b32641d43d4aa276fe5839cea6bf20fa211a1106368792a5ff4de292	["*"]	\N	2023-05-29 07:31:56	2023-05-29 07:31:56
171	App\\Models\\User	12	Personal Access Token	7de33da0166a23ecfc4292471470131e7a143b79109f74da9d80fdc739e994b7	["*"]	\N	2023-05-29 07:32:41	2023-05-29 07:32:41
172	App\\Models\\User	8	Personal Access Token	231399ac996a44e940d503ce7efeeed500c0e1c416fdc2b4b3e54c5ff7c01fde	["*"]	\N	2023-05-29 07:33:26	2023-05-29 07:33:26
173	App\\Models\\User	11	Personal Access Token	bfc2a86eecd7e5134816cfbdee0a5a81df72f9332d17cfec84fe49a4bfd42494	["*"]	\N	2023-05-29 07:34:12	2023-05-29 07:34:12
174	App\\Models\\User	10	Personal Access Token	ed87006a7f877e1efb80136e0c25958253f72e1d5800abd40123b74dff537477	["*"]	\N	2023-05-29 07:34:43	2023-05-29 07:34:43
175	App\\Models\\User	12	Personal Access Token	eb8cabebf2261e3aec61e4520dd908c72484e209ed900c99b492a4ea9c5ae773	["*"]	\N	2023-05-29 07:37:52	2023-05-29 07:37:52
176	App\\Models\\User	8	Personal Access Token	04c1d7d30664cd9b33526bec83aa3dc859b3d6dc62192f5c65093496a1388a52	["*"]	\N	2023-05-29 07:47:28	2023-05-29 07:47:28
177	App\\Models\\User	10	Personal Access Token	ca9587d0185d36142b8e66062f9346fe93eb190bc6e3943e28cf64a5f433bdc4	["*"]	\N	2023-06-13 05:26:10	2023-06-13 05:26:10
178	App\\Models\\User	8	Personal Access Token	4c9381eaa9ca804f16dc8f9853f74661e3fc755b033cfd5ef7fa6d34fc03ba5b	["*"]	\N	2023-06-13 05:35:53	2023-06-13 05:35:53
179	App\\Models\\User	10	Personal Access Token	745307f1bb221cb799d2a557ff54c3617c7eea154904397749eb744b0c026fdd	["*"]	\N	2023-06-13 07:02:26	2023-06-13 07:02:26
180	App\\Models\\User	8	Personal Access Token	8b68af980d69a01fa838d98736448dfe3c628370d59582696e45af946554eb78	["*"]	\N	2023-06-13 07:07:07	2023-06-13 07:07:07
181	App\\Models\\User	10	Personal Access Token	6c060d9be57fdba672cc790f69fa2ac71fe30851622dd019a8d44840e1433e46	["*"]	\N	2023-06-14 13:08:35	2023-06-14 13:08:35
182	App\\Models\\User	8	Personal Access Token	a5bc2476168f47f8ec9bfdcdd1383497bec05b81cd0a449a925874301edd7a8c	["*"]	\N	2023-06-14 13:12:50	2023-06-14 13:12:50
183	App\\Models\\User	10	Personal Access Token	aeafb355dfa6a8fda46c1a823a140604163aeebd460786bf732460110451db14	["*"]	\N	2023-06-15 05:27:18	2023-06-15 05:27:18
184	App\\Models\\User	3	Personal Access Token	5b3e4aa291e722f10f8bd9f4acc681d7a67f86315abed6401f751763dda6c484	["*"]	\N	2023-06-30 11:01:52	2023-06-30 11:01:52
185	App\\Models\\User	10	Personal Access Token	45c8763160de475cf56f3c7c7a5b4f13a916695981708ebd08b3fdb5e1c4c407	["*"]	\N	2023-06-30 15:10:59	2023-06-30 15:10:59
186	App\\Models\\User	10	Personal Access Token	51fe249cfe3bfb11a7b834696ab0015cd996a1a8bd6070f3fd9abeadfa54b2c1	["*"]	\N	2023-07-01 05:45:04	2023-07-01 05:45:04
187	App\\Models\\User	10	Personal Access Token	df2d9e766c151652207397b1d62e3e1ffc992f3eddfb7cdbc629c0348f5f4174	["*"]	\N	2023-07-01 13:18:04	2023-07-01 13:18:04
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
\.


--
-- Data for Name: product_selected_attribute_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_selected_attribute_list (product_attribute_id, product_id, manage_stock, stock_quantity, allow_back_order, stock_status, sold_individually, weight, length, height, width, shipping_class, sale_price, regular_price, taxable, image, shipping_note, title, rating, rated_users, image_temp, barcode, image_action, pr_code, product_desc, product_full_descr, size_chart, unit, minimum_qty, thickness, materials) FROM stdin;
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
1	0	0	\N	\N	0	0
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
1	Dubai	1	1	1	\N	0	2023-05-18 02:16:14	2023-05-18 02:16:14
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
\.


--
-- Data for Name: temp_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_orders (id, invoice_id, user_id, address_id, total, vat, discount, grand_total, payment_mode, admin_commission, vendor_commission, shipping_charge, temp_id, coupon_code, coupon_id, store_id, request_deligate) FROM stdin;
\.


--
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.units (id, name, active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_address (id, user_id, full_name, dial_code, phone, address, country_id, state_id, city_id, address_type, status, is_default, created_at, updated_at, land_mark, building_name, latitude, longitude, flat_no, postcode) FROM stdin;
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
1	6	1	{"category":{"View":"1"},"collections":{"View":"1"},"collection_agent_report":{"View":"1"},"waste_bag_report":{"View":"1"},"collection_point_report":{"View":"1"}}	1	2023-05-20 10:58:16	2023-05-20 10:58:16
2	13	1	{"adminusers":{"View":"1","Create":"1"},"admin_user_desig":{"View":"1","Create":"1"},"customers":{"View":"1","Create":"1"},"vendor":{"View":"1","Create":"1"},"collection_points":{"View":"1","Create":"1","Edit":"1","Delete":"1"},"category":{"View":"1","Create":"1"},"country":{"Create":"1"},"collections":{"View":"1","Create":"1"},"cms":{"View":"1","Create":"1"},"collection_agent_report":{"View":"1"},"facilitators_report":{"View":"1"},"waste_bag_report":{"View":"1"},"collection_point_report":{"View":"1"}}	1	2023-05-24 13:53:20	2023-05-25 06:37:57
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

COPY public.users (id, name, email, dial_code, phone, phone_verified, password, email_verified_at, role, first_name, last_name, user_image, user_phone_otp, user_device_token, user_device_type, user_access_token, firebase_user_key, remember_token, created_at, updated_at, country_id, state_id, city_id, area, active, deleted, display_name, business_name, email_verified, user_email_otp, dob, vendor, store, previllege, about_me, verified, designation_id, is_private_profile, user_name, gender, website, wallet_amount, password_reset_code, password_reset_time, password_reset_otp, privacy_id, send_notification, mute_message, commission, public_business_info, facebook_url, instagram_url, linkedin_url, is_social, twitter_url, tiktok_url, user_type_id, activity_type_id, commercial_license, commercial_reg_no, associated_license, res_dial_code, res_phone, address, business_type_id, admin_commission_perc, residence_no, nationality, rating, rated_users, banner_image, hide_profile, active_package_id, pacakge_end_date) FROM stdin;
1	Admin	admin@admin.com	971	112233445566778899	0	$2y$10$4CKClSnfh0w959jNrsJyl.8/oowWbizHIg4FrOlXxfgtYYBU6Y6jK	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N
2	fecilitator	fecilitator@gmail.com	971	7034526952	0	$2y$10$4O.WDYIJaRRHc9ZmRxCvP.M1i6W.hewzCVtFyrOzeQ4yW8jqyJB9W	\N	3	\N	test	64658a9b8a7ae_1684376219.jpg	\N	\N	\N	\N	\N	\N	2023-05-18 02:16:59	\N	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	fecilitator	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N
5	Sahla	Sahlanissar@gmail.com	971	869696767678	0	$2y$10$aJp/fnvMT4BuPHZTDrrVDOSzixerbkyLdvAVNmgIqeg/DNUQ3F22q	\N	2	\N	Nissar	646876cdf1b55_1684567757.jpg	\N	1234	ANDROID	6152c6d943a9c8770a6db4338136ac4ea8ad764629e68919e38a7b37c9ee0c7d	-NVs3TbWwdW420QNMhVC	\N	2023-05-20 07:29:17	2023-05-20 07:31:18	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	Sahla	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N
6	staff	staff@gmail.com	\N	123455	0	$2y$10$pr9W3esOKJo4s4tmTZMqyuND8mqCYYxoyj2JRaO/nWhJqRGJCjkne	\N	1	staff	staff	\N	\N	\N	\N	\N	\N	\N	2023-05-20 10:57:55	\N	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	1	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N
7	MIKY	micky@gmail.com	971	476736474443	0	$2y$10$jYxbfgCm47FWVPeCpETmmOsqBdzwVIaB4gAx5mVAqmx7gcpfdc2oS	\N	2	\N	Don	6468d3e48e14c_1684591588.jpg	\N	ej3kcE8xQIWsj-6xlKH9sC:APA91bE5li9pjbeD6H7JI5p3Kll1mFAr4tj2mClMah0_xFp05BZ3KbAJW39wT5s_H2qwbbFBkZ37_WpA3vZHSB5yHVGfyLKqyaRMwc_k2jJ3daTk4yQDChUnOIRX2QNxLRxrt0u3ZmCt	ANDROID	e0aedb45f43dfd73396b63835ddc260641480bfe6129055f3019805fca0ab578	-NVzkQ5Mj2PxzXUy87gZ	\N	2023-05-20 14:06:28	2023-05-29 06:31:22	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	MIKY	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N
9	Sahla	sahla@gmail.com	971	2334324234	0	$2y$10$Ehd/ALW7LMQsroErLlObYei8aYzY8rYfaak1Yalkvoyj/8fVvJ5eG	\N	2	\N	Collection	646b4b8ee93c1_1684753294.jpg	\N		ANDROID		-NW27CY90YEJD6tayxOG	\N	2023-05-22 11:01:34	2023-05-29 07:05:04	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	Sahla	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N
8	Sahla Nissar	sahla1@gmail.com	971	4324352	0	$2y$10$j9VJPi/uCkUQknjMlBOLbOuYxo5yoWmS1lkjYCfGIAAneCT3nR9y6	\N	3	\N	facilititor	646a721b5a9b0_1684697627.jpg	\N		ANDROID		-NVznYPRLL8NYM2h-d5T	\N	2023-05-21 19:33:47	2023-06-14 13:13:32	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	Sahla Nissar	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N
14	Sabik	Sabikmohammed.k@gmail.com	971	565116113	0	$2y$10$3Rx2C7TLE8EzrQYeVYYB5.wZMm10bW6oUywBsdz1kDWsysLtva6g2	\N	2	\N	k	649eef1724542_1688137495.png	\N	\N	\N	\N	\N	\N	2023-06-30 15:04:55	2023-06-30 15:08:49	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	Sabik	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N
4	face	face@test.com	971	1231231	0	$2y$10$FLzW0wS9/SJpANh.jY4QVeFz0M2i/TekGDQvil0txze7Lzjqfd1m6	\N	3	\N	f	646617a800a65_1684412328.png	\N		ANDROID		-NViyyo-fMwrQYWQde_V	\N	2023-05-18 12:18:48	2023-05-24 11:07:26	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	face	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N
12	maash1	maash@gmail.com	971	32432423242	0	$2y$10$V1y5Vfi/brC5srIPEkZucuvrKifcAjtFIOPZPdoanCxsEayaV6cCm	\N	2	\N	pp	646ce277d5dcb_1684857463.jpg	\N	fshrA2N9SCy7GBdq_Smony:APA91bHMzB2KfLWAMb4gaOXvvUzajAzD3FKCReIzZHI9xi8MUDehD2HCMJJeWuZdvJPzA6VuOicdOL7wGTlVMGtu5fVM539oP8C1Cou3pRJSTpeNoInH6KCeHY52db8psAEQeFiCKc1o	ANDROID	eb8cabebf2261e3aec61e4520dd908c72484e209ed900c99b492a4ea9c5ae773	-NW8KY-M3gLurOuUUIqF	\N	2023-05-23 15:57:43	2023-05-29 07:37:52	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	maash1	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N
10	mahima	mahima@gmail.com	971	32424234324	0	$2y$10$IL6wNhCgZWtSfEA4O2ffXOja1zK0DvqFfmrL6fxOLNFiPdl0DiSa.	\N	2	\N	C	646b5c975edc8_1684757655.jpg	\N	c9iEaBd1S-2tSty1xXiNvx:APA91bF7yLwkzsI_AKkTZiZc19Vw4oFEdrx4zsVEtzQis-ibJ0Arxbk8SLwBvDwRhFGsfubkgJFPiIVmjjMq3iXgvpkOTuAB-P1Y55ojNaXAGbf0ZhlG5zg_a1W78h9ashJFehrGs2iH	ANDROID	df2d9e766c151652207397b1d62e3e1ffc992f3eddfb7cdbc629c0348f5f4174	-NW2cCG0FJ1pFhK8PyNm	\N	2023-05-22 12:14:15	2023-07-01 13:18:04	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	mahima	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N
13	sahla	test@gmail.com	\N	123455	0	$2y$10$35jbaEj9vpx98XefF9/t5OsIJ4yB1bldU8oJOU6tbC9zHb.je9kPu	\N	1	test	user	\N	\N	\N	\N	\N	\N	\N	2023-05-24 13:52:24	\N	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	1	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N
11	mahima	mahimaf@gmail.com	971	32432434	0	$2y$10$yt77UN7DbNv96wnjqWK1LeMTR.Hx4PoYlOlAjuw2YP0NocQ0TaS8.	\N	3	\N	F	646b5cfee5d8d_1684757758.jpg	\N	cVRof6G4SvWc2EMaImA1kO:APA91bEXnzanUdHiz0y9INzYRh7i-M87_auyWXypUGUESErrhUt2aHLhSGkA4MiupTk7JfUI_Vxdih6nE8fKB79GgCBNgP_ClEMOH9XYcTGj75MGpWs4n9-vTxHy2_7hXcShAn2zK63L	ANDROID	bfc2a86eecd7e5134816cfbdee0a5a81df72f9332d17cfec84fe49a4bfd42494	-NW3mgis3ltYcAiyhFWe	\N	2023-05-22 12:15:58	2023-05-29 07:34:12	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	mahima	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N
3	collector editedsd	collectionagent@gmail.com	971	6454845	0	$2y$10$o/QgidlmaIBvWsgQkrGWAOB1K8c6yhtYAkcOG6Xqh01AqWDAuJETu	\N	2	\N	agent	6465f03a80f36_1684402234.png	\N	android	ANDROID	5b3e4aa291e722f10f8bd9f4acc681d7a67f86315abed6401f751763dda6c484	-NViz-u-ha0GOQL_k7F2	\N	2023-05-18 09:30:34	2023-06-30 11:01:52	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	Collector	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0	0	\N
\.


--
-- Data for Name: users_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_role (id, role_name, created_at, updated_at) FROM stdin;
1	admin	2023-05-18 01:55:46	2023-05-18 01:55:46
2	users	2023-05-18 01:55:46	2023-05-18 01:55:46
3	vendors	2023-05-18 01:55:46	2023-05-18 01:55:46
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
-- Name: admin_designation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_designation_id_seq', 1, true);


--
-- Name: amount_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.amount_type_id_seq', 2, true);


--
-- Name: app_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_banners_id_seq', 1, false);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articles_id_seq', 3, true);


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
-- Name: bag_carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bag_carts_id_seq', 919, true);


--
-- Name: bag_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bag_types_id_seq', 1, false);


--
-- Name: bank_code_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_code_types_id_seq', 3, true);


--
-- Name: bank_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_details_id_seq', 11, true);


--
-- Name: bank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_id_seq', 1, false);


--
-- Name: block_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.block_users_id_seq', 1, false);


--
-- Name: brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_id_seq', 1, false);


--
-- Name: cart_food_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_food_id_seq', 1, false);


--
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 1, false);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 5, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 1, true);


--
-- Name: collection_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collection_items_id_seq', 883, true);


--
-- Name: collection_points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collection_points_id_seq', 71, true);


--
-- Name: collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collections_id_seq', 179, true);


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

SELECT pg_catalog.setval('public.coupon_category_id_seq', 1, false);


--
-- Name: coupon_coupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_coupon_id_seq', 1, false);


--
-- Name: coupon_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_histories_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.faq_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.help_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.industry_types_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.migrations_id_seq', 269, true);


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

SELECT pg_catalog.setval('public.notifications_id_seq', 1, false);


--
-- Name: nottification_tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nottification_tracks_id_seq', 1, false);


--
-- Name: order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_products_id_seq', 1, false);


--
-- Name: order_status_histroys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_status_histroys_id_seq', 1, false);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 1, false);


--
-- Name: payment_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_report_id_seq', 1, false);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 187, true);


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

SELECT pg_catalog.setval('public.product_category_product_category_id_seq', 1, false);


--
-- Name: product_docs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_docs_id_seq', 1, false);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 1, false);


--
-- Name: product_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_images_id_seq', 1, false);


--
-- Name: product_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_likes_id_seq', 1, false);


--
-- Name: product_selected_attribute_list_product_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_selected_attribute_list_product_attribute_id_seq', 1, false);


--
-- Name: product_selected_attributes_product_selected_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_selected_attributes_product_selected_attributes_id_seq', 1, false);


--
-- Name: product_specifications_prod_spec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_specifications_prod_spec_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.temp_order_products_id_seq', 1, false);


--
-- Name: temp_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_orders_id_seq', 1, false);


--
-- Name: units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.units_id_seq', 1, false);


--
-- Name: user_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_address_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.user_privileges_id_seq', 2, true);


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

SELECT pg_catalog.setval('public.users_id_seq', 14, true);


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
-- Name: bag_carts bag_carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bag_carts
    ADD CONSTRAINT bag_carts_pkey PRIMARY KEY (id);


--
-- Name: bag_types bag_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bag_types
    ADD CONSTRAINT bag_types_pkey PRIMARY KEY (id);


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
-- Name: collection_items collection_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_items
    ADD CONSTRAINT collection_items_pkey PRIMARY KEY (id);


--
-- Name: collection_points collection_points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_points
    ADD CONSTRAINT collection_points_pkey PRIMARY KEY (id);


--
-- Name: collections collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY (id);


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

