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
    updated_at timestamp(0) without time zone,
    category_id integer DEFAULT 0,
    product_id integer DEFAULT 0,
    type integer DEFAULT 1 NOT NULL,
    division_id integer DEFAULT 0 NOT NULL
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
-- Name: appointment_times; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointment_times (
    id bigint NOT NULL,
    name character varying(900) NOT NULL,
    minutes_required integer NOT NULL,
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.appointment_times OWNER TO postgres;

--
-- Name: appointment_times_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointment_times_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointment_times_id_seq OWNER TO postgres;

--
-- Name: appointment_times_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointment_times_id_seq OWNED BY public.appointment_times.id;


--
-- Name: appointment_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointment_types (
    id bigint NOT NULL,
    name character varying(900) NOT NULL,
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.appointment_types OWNER TO postgres;

--
-- Name: appointment_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointment_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointment_types_id_seq OWNER TO postgres;

--
-- Name: appointment_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointment_types_id_seq OWNED BY public.appointment_types.id;


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
-- Name: aspect_of_room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aspect_of_room (
    id bigint NOT NULL,
    name character varying(600),
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.aspect_of_room OWNER TO postgres;

--
-- Name: aspect_of_room_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aspect_of_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aspect_of_room_id_seq OWNER TO postgres;

--
-- Name: aspect_of_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aspect_of_room_id_seq OWNED BY public.aspect_of_room.id;


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
-- Name: breeds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.breeds (
    id bigint NOT NULL,
    name character varying(600) NOT NULL,
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    species integer DEFAULT 0 NOT NULL,
    room_type_id integer DEFAULT 0 NOT NULL,
    appoint_time_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.breeds OWNER TO postgres;

--
-- Name: breeds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.breeds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.breeds_id_seq OWNER TO postgres;

--
-- Name: breeds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.breeds_id_seq OWNED BY public.breeds.id;


--
-- Name: car_damages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.car_damages (
    id bigint NOT NULL,
    car_id bigint NOT NULL,
    user_id bigint NOT NULL,
    image character varying(255) NOT NULL,
    description text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.car_damages OWNER TO postgres;

--
-- Name: car_damages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.car_damages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.car_damages_id_seq OWNER TO postgres;

--
-- Name: car_damages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.car_damages_id_seq OWNED BY public.car_damages.id;


--
-- Name: cars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cars (
    id bigint NOT NULL,
    plate_number character varying(255) NOT NULL,
    user_id bigint NOT NULL,
    ticket character varying(255),
    sms_id character varying(255),
    country_code character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    car_color character varying(255),
    car_make character varying(255) NOT NULL,
    carwash boolean DEFAULT false NOT NULL,
    fuel character varying(255) NOT NULL,
    extra_charge numeric(10,2),
    tip numeric(10,2),
    discount numeric(10,2),
    guest boolean DEFAULT false NOT NULL,
    room character varying(255),
    level character varying(255),
    check_out timestamp(0) without time zone,
    slot character varying(255),
    hanger character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    plate_code character varying(255),
    key_tag character varying(255),
    vpa_runner character varying(255),
    model character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    is_whatsapp boolean DEFAULT false NOT NULL,
    status character varying(255) DEFAULT 'Pending'::character varying NOT NULL,
    full_ticket character varying(255),
    image character varying(255),
    property_id bigint,
    assigned_to bigint,
    car_reg_state_id bigint,
    payment_link character varying(255)
);


ALTER TABLE public.cars OWNER TO postgres;

--
-- Name: cars_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cars_id_seq OWNER TO postgres;

--
-- Name: cars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cars_id_seq OWNED BY public.cars.id;


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
    updated_at timestamp(0) without time zone
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
    updated_at timestamp(0) without time zone,
    slug character varying(255) DEFAULT ''::character varying,
    division_id integer DEFAULT 0 NOT NULL
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
-- Name: contact_us; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_us (
    id bigint NOT NULL,
    name character varying(400),
    email character varying(200),
    dial_code character varying(255),
    mobile character varying(255),
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
-- Name: current_project_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.current_project_status (
    id bigint NOT NULL,
    name character varying(600),
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.current_project_status OWNER TO postgres;

--
-- Name: current_project_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.current_project_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.current_project_status_id_seq OWNER TO postgres;

--
-- Name: current_project_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.current_project_status_id_seq OWNED BY public.current_project_status.id;


--
-- Name: db_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.db_notifications (
    id bigint NOT NULL,
    type character varying(600),
    notifiable_type character varying(600),
    notifiable_id integer DEFAULT 0 NOT NULL,
    related_to character varying(600),
    data text,
    read_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.db_notifications OWNER TO postgres;

--
-- Name: db_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.db_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_notifications_id_seq OWNER TO postgres;

--
-- Name: db_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.db_notifications_id_seq OWNED BY public.db_notifications.id;


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
-- Name: division; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.division (
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
    slug character varying(255) NOT NULL
);


ALTER TABLE public.division OWNER TO postgres;

--
-- Name: division_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.division_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.division_id_seq OWNER TO postgres;

--
-- Name: division_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.division_id_seq OWNED BY public.division.id;


--
-- Name: doctor_calender_temps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor_calender_temps (
    id bigint NOT NULL,
    doctor_id integer DEFAULT 0 NOT NULL,
    event_date date NOT NULL,
    start_time time(0) without time zone NOT NULL,
    end_time time(0) without time zone NOT NULL,
    device_id character varying(255) NOT NULL,
    event_title character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.doctor_calender_temps OWNER TO postgres;

--
-- Name: doctor_calender_temps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_calender_temps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_calender_temps_id_seq OWNER TO postgres;

--
-- Name: doctor_calender_temps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_calender_temps_id_seq OWNED BY public.doctor_calender_temps.id;


--
-- Name: doctor_calenders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor_calenders (
    id bigint NOT NULL,
    doctor_id integer NOT NULL,
    event_date date NOT NULL,
    start_time time(0) without time zone NOT NULL,
    end_time time(0) without time zone NOT NULL,
    event_title character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.doctor_calenders OWNER TO postgres;

--
-- Name: doctor_calenders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_calenders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_calenders_id_seq OWNER TO postgres;

--
-- Name: doctor_calenders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_calenders_id_seq OWNED BY public.doctor_calenders.id;


--
-- Name: doctors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctors (
    id bigint NOT NULL,
    name character varying(900) NOT NULL,
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
    vendor integer DEFAULT 0 NOT NULL,
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    type integer DEFAULT 0 NOT NULL,
    qualification character varying(1000),
    image text,
    document text
);


ALTER TABLE public.doctors OWNER TO postgres;

--
-- Name: doctors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctors_id_seq OWNER TO postgres;

--
-- Name: doctors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctors_id_seq OWNED BY public.doctors.id;


--
-- Name: doggy_play_time_dates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doggy_play_time_dates (
    id bigint NOT NULL,
    vendor_id integer NOT NULL,
    service_id integer NOT NULL,
    date timestamp(0) without time zone NOT NULL,
    price character varying(255) DEFAULT '0'::character varying NOT NULL,
    total_seats integer DEFAULT 0 NOT NULL,
    seats integer DEFAULT 0 NOT NULL,
    guests_booking integer DEFAULT 0 NOT NULL,
    time_start time(0) without time zone,
    time_end time(0) without time zone,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.doggy_play_time_dates OWNER TO postgres;

--
-- Name: doggy_play_time_dates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doggy_play_time_dates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doggy_play_time_dates_id_seq OWNER TO postgres;

--
-- Name: doggy_play_time_dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doggy_play_time_dates_id_seq OWNED BY public.doggy_play_time_dates.id;


--
-- Name: doggy_play_time_temp_bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doggy_play_time_temp_bookings (
    id bigint NOT NULL,
    user_id text,
    vendor_id text,
    service_id text,
    total text,
    request_data text,
    payment_id text,
    payment_status text,
    receipt_url text,
    payment_response text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.doggy_play_time_temp_bookings OWNER TO postgres;

--
-- Name: doggy_play_time_temp_bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doggy_play_time_temp_bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doggy_play_time_temp_bookings_id_seq OWNER TO postgres;

--
-- Name: doggy_play_time_temp_bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doggy_play_time_temp_bookings_id_seq OWNED BY public.doggy_play_time_temp_bookings.id;


--
-- Name: enquiry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enquiry (
    id bigint NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    type integer DEFAULT 0 NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.enquiry OWNER TO postgres;

--
-- Name: enquiry_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enquiry_details (
    id bigint NOT NULL,
    enquiry_id integer DEFAULT 0 NOT NULL,
    question_id integer DEFAULT 0 NOT NULL,
    answers text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.enquiry_details OWNER TO postgres;

--
-- Name: enquiry_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enquiry_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enquiry_details_id_seq OWNER TO postgres;

--
-- Name: enquiry_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enquiry_details_id_seq OWNED BY public.enquiry_details.id;


--
-- Name: enquiry_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enquiry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enquiry_id_seq OWNER TO postgres;

--
-- Name: enquiry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enquiry_id_seq OWNED BY public.enquiry.id;


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
-- Name: feeding_schedules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feeding_schedules (
    id bigint NOT NULL,
    name character varying(900) NOT NULL,
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.feeding_schedules OWNER TO postgres;

--
-- Name: feeding_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feeding_schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feeding_schedules_id_seq OWNER TO postgres;

--
-- Name: feeding_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.feeding_schedules_id_seq OWNED BY public.feeding_schedules.id;


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
-- Name: foods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.foods (
    id bigint NOT NULL,
    name character varying(900) NOT NULL,
    image text,
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.foods OWNER TO postgres;

--
-- Name: foods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.foods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foods_id_seq OWNER TO postgres;

--
-- Name: foods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.foods_id_seq OWNED BY public.foods.id;


--
-- Name: groomer_calender_temps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groomer_calender_temps (
    id bigint NOT NULL,
    groomer_id integer DEFAULT 0 NOT NULL,
    event_date date NOT NULL,
    start_time time(0) without time zone NOT NULL,
    end_time time(0) without time zone NOT NULL,
    device_id character varying(255) NOT NULL,
    event_title character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.groomer_calender_temps OWNER TO postgres;

--
-- Name: groomer_calender_temps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groomer_calender_temps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groomer_calender_temps_id_seq OWNER TO postgres;

--
-- Name: groomer_calender_temps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groomer_calender_temps_id_seq OWNED BY public.groomer_calender_temps.id;


--
-- Name: groomer_calenders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groomer_calenders (
    id bigint NOT NULL,
    groomer_id integer NOT NULL,
    event_date date NOT NULL,
    start_time time(0) without time zone NOT NULL,
    end_time time(0) without time zone NOT NULL,
    event_title character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.groomer_calenders OWNER TO postgres;

--
-- Name: groomer_calenders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groomer_calenders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groomer_calenders_id_seq OWNER TO postgres;

--
-- Name: groomer_calenders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groomer_calenders_id_seq OWNED BY public.groomer_calenders.id;


--
-- Name: groomers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groomers (
    id bigint NOT NULL,
    name character varying(900) NOT NULL,
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
    vendor integer DEFAULT 0 NOT NULL,
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    image text
);


ALTER TABLE public.groomers OWNER TO postgres;

--
-- Name: groomers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groomers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groomers_id_seq OWNER TO postgres;

--
-- Name: groomers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groomers_id_seq OWNED BY public.groomers.id;


--
-- Name: grooming_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grooming_types (
    id bigint NOT NULL,
    name character varying(900) NOT NULL,
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.grooming_types OWNER TO postgres;

--
-- Name: grooming_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grooming_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grooming_types_id_seq OWNER TO postgres;

--
-- Name: grooming_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grooming_types_id_seq OWNED BY public.grooming_types.id;


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
-- Name: inspection_request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inspection_request (
    id bigint NOT NULL,
    request_id character varying(600),
    user_id integer DEFAULT 0 NOT NULL,
    time_slote_id integer DEFAULT 0 NOT NULL,
    technician_id integer DEFAULT 0 NOT NULL,
    slot_date timestamp(0) without time zone,
    latitude character varying(600),
    longitude character varying(600),
    location character varying(600),
    status integer DEFAULT 0 NOT NULL,
    visitation_fee double precision DEFAULT '0'::double precision NOT NULL,
    tax double precision DEFAULT '0'::double precision NOT NULL,
    grand_total double precision DEFAULT '0'::double precision NOT NULL,
    payment_type integer DEFAULT 0 NOT NULL,
    payment_status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    vehicle_id integer DEFAULT 0 NOT NULL,
    inspection_report character varying(255),
    quotation_price integer,
    quotation_file character varying(255),
    quotation_status integer DEFAULT 0 NOT NULL,
    annual_contract integer DEFAULT 0 NOT NULL,
    quotation_price_tax double precision DEFAULT '0'::double precision NOT NULL,
    quotation_grand_total double precision DEFAULT '0'::double precision NOT NULL,
    quote_payment_type integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.inspection_request OWNER TO postgres;

--
-- Name: inspection_request_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inspection_request_history (
    id bigint NOT NULL,
    inspection_request_id integer DEFAULT 0 NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    date timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.inspection_request_history OWNER TO postgres;

--
-- Name: inspection_request_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inspection_request_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inspection_request_history_id_seq OWNER TO postgres;

--
-- Name: inspection_request_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inspection_request_history_id_seq OWNED BY public.inspection_request_history.id;


--
-- Name: inspection_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inspection_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inspection_request_id_seq OWNER TO postgres;

--
-- Name: inspection_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inspection_request_id_seq OWNED BY public.inspection_request.id;


--
-- Name: insurance_providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insurance_providers (
    id bigint NOT NULL,
    name character varying(900) NOT NULL,
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.insurance_providers OWNER TO postgres;

--
-- Name: insurance_providers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insurance_providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insurance_providers_id_seq OWNER TO postgres;

--
-- Name: insurance_providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insurance_providers_id_seq OWNED BY public.insurance_providers.id;


--
-- Name: manufacturers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manufacturers (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    logo character varying(255) NOT NULL,
    status boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.manufacturers OWNER TO postgres;

--
-- Name: COLUMN manufacturers.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.manufacturers.status IS '0 for inactive,1 for active';


--
-- Name: manufacturers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.manufacturers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.manufacturers_id_seq OWNER TO postgres;

--
-- Name: manufacturers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.manufacturers_id_seq OWNED BY public.manufacturers.id;


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
-- Name: my_pets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.my_pets (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    name character varying(600) NOT NULL,
    breed_id integer NOT NULL,
    sex integer NOT NULL,
    dob date NOT NULL,
    weight double precision NOT NULL,
    food character varying(1200) NOT NULL,
    additional_notes text NOT NULL,
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    species integer NOT NULL,
    image text,
    medicine_instructions text
);


ALTER TABLE public.my_pets OWNER TO postgres;

--
-- Name: my_pets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.my_pets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.my_pets_id_seq OWNER TO postgres;

--
-- Name: my_pets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.my_pets_id_seq OWNED BY public.my_pets.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    description text,
    title character varying(600),
    image character varying(600),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    url character varying(255),
    expiration_date date
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
    grand_total double precision,
    admin_commission_percentage double precision
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
    driver_viewed integer DEFAULT 0 NOT NULL
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
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- Name: payment_init; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_init (
    id bigint NOT NULL,
    total_amount double precision DEFAULT '0'::double precision NOT NULL,
    transaction_id character varying(600),
    invoice_id character varying(600),
    transaction_details text,
    payment_status integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.payment_init OWNER TO postgres;

--
-- Name: payment_init_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_init_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_init_id_seq OWNER TO postgres;

--
-- Name: payment_init_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_init_id_seq OWNED BY public.payment_init.id;


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
-- Name: payment_temp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_temp (
    id bigint NOT NULL,
    amount double precision DEFAULT '0'::double precision NOT NULL,
    payment_ref character varying(600),
    payment_id character varying(600),
    details_id integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    payment_mode integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.payment_temp OWNER TO postgres;

--
-- Name: payment_temp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_temp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_temp_id_seq OWNER TO postgres;

--
-- Name: payment_temp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_temp_id_seq OWNED BY public.payment_temp.id;


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
-- Name: playtime_staffs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playtime_staffs (
    id bigint NOT NULL,
    name character varying(900) NOT NULL,
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
    image text,
    vendor integer DEFAULT 0 NOT NULL,
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.playtime_staffs OWNER TO postgres;

--
-- Name: playtime_staffs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.playtime_staffs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.playtime_staffs_id_seq OWNER TO postgres;

--
-- Name: playtime_staffs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.playtime_staffs_id_seq OWNED BY public.playtime_staffs.id;


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
    activity_id integer,
    is_featured integer DEFAULT 0,
    division integer DEFAULT 0 NOT NULL
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
    material text,
    product_details text,
    needtoknow text
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
-- Name: project_purpose; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project_purpose (
    id bigint NOT NULL,
    name character varying(600),
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.project_purpose OWNER TO postgres;

--
-- Name: project_purpose_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project_purpose_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_purpose_id_seq OWNER TO postgres;

--
-- Name: project_purpose_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project_purpose_id_seq OWNED BY public.project_purpose.id;


--
-- Name: properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.properties (
    id bigint NOT NULL,
    logo character varying(255),
    property_name character varying(255) NOT NULL,
    property_type character varying(255) NOT NULL,
    description text,
    customer_message text,
    country character varying(255) NOT NULL,
    timezone character varying(255) NOT NULL,
    phone character varying(255),
    capacity integer,
    tax_price numeric(10,2) NOT NULL,
    all_week_price numeric(10,2) NOT NULL,
    weekday_price numeric(10,2),
    friday_price numeric(10,2),
    weekend_price numeric(10,2),
    carwash_price numeric(10,2),
    fuel_price numeric(10,2),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted smallint DEFAULT '0'::smallint NOT NULL,
    active smallint DEFAULT '1'::smallint NOT NULL,
    latitude numeric(10,7),
    longitude numeric(10,7),
    dial_code character varying(255),
    tasree_commission_percentage numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    supervisor_id bigint
);


ALTER TABLE public.properties OWNER TO postgres;

--
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.properties_id_seq OWNER TO postgres;

--
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.properties_id_seq OWNED BY public.properties.id;


--
-- Name: property_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.property_types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.property_types OWNER TO postgres;

--
-- Name: property_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.property_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.property_types_id_seq OWNER TO postgres;

--
-- Name: property_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.property_types_id_seq OWNED BY public.property_types.id;


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
-- Name: question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question (
    id bigint NOT NULL,
    question text,
    active integer DEFAULT 0 NOT NULL,
    question_for integer DEFAULT 0 NOT NULL,
    answer_type integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    sort_order integer DEFAULT 0 NOT NULL,
    placeholder character varying(600)
);


ALTER TABLE public.question OWNER TO postgres;

--
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_id_seq OWNER TO postgres;

--
-- Name: question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.question_id_seq OWNED BY public.question.id;


--
-- Name: question_options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question_options (
    id bigint NOT NULL,
    question integer DEFAULT 0 NOT NULL,
    options character varying(600),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.question_options OWNER TO postgres;

--
-- Name: question_options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_options_id_seq OWNER TO postgres;

--
-- Name: question_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.question_options_id_seq OWNED BY public.question_options.id;


--
-- Name: quotation_request_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quotation_request_history (
    id bigint NOT NULL,
    inspection_request_id integer DEFAULT 0 NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    date timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.quotation_request_history OWNER TO postgres;

--
-- Name: quotation_request_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quotation_request_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quotation_request_history_id_seq OWNER TO postgres;

--
-- Name: quotation_request_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quotation_request_history_id_seq OWNED BY public.quotation_request_history.id;


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
    rating double precision DEFAULT '0'::double precision NOT NULL,
    title text,
    comment text,
    order_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
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
-- Name: room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room (
    id bigint NOT NULL,
    name character varying(600),
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.room OWNER TO postgres;

--
-- Name: room_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.room_id_seq OWNER TO postgres;

--
-- Name: room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.room_id_seq OWNED BY public.room.id;


--
-- Name: room_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room_types (
    id bigint NOT NULL,
    name character varying(900) NOT NULL,
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.room_types OWNER TO postgres;

--
-- Name: room_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.room_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.room_types_id_seq OWNER TO postgres;

--
-- Name: room_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.room_types_id_seq OWNED BY public.room_types.id;


--
-- Name: service_foods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_foods (
    id bigint NOT NULL,
    service_id integer NOT NULL,
    food_id integer NOT NULL
);


ALTER TABLE public.service_foods OWNER TO postgres;

--
-- Name: service_foods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_foods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_foods_id_seq OWNER TO postgres;

--
-- Name: service_foods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_foods_id_seq OWNED BY public.service_foods.id;


--
-- Name: service_pets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_pets (
    id bigint NOT NULL,
    service_id integer NOT NULL,
    pet_id integer NOT NULL
);


ALTER TABLE public.service_pets OWNER TO postgres;

--
-- Name: service_pets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_pets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_pets_id_seq OWNER TO postgres;

--
-- Name: service_pets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_pets_id_seq OWNED BY public.service_pets.id;


--
-- Name: service_quotes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_quotes (
    id bigint NOT NULL,
    service_id integer NOT NULL,
    user_id integer NOT NULL,
    pet_id integer NOT NULL,
    doctor_id integer DEFAULT 0,
    groomer_id integer DEFAULT 0,
    appointment_type integer DEFAULT 0,
    "time" character varying(100),
    date character varying(100),
    drop_off_time character varying(100),
    drop_off_date character varying(100),
    pick_up_time character varying(100),
    pick_up_date character varying(100),
    feeding_schedule integer DEFAULT 0,
    food text,
    specific_medication integer DEFAULT 0,
    notes text,
    status character varying(255) DEFAULT '1'::character varying NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    quote_price double precision,
    reject_reason text,
    playtime_staff_id integer DEFAULT 0,
    medicine_instructions text,
    food_id integer DEFAULT 0,
    grooming_service integer DEFAULT 0,
    quote_document character varying(900),
    payment_ref_id character varying(255),
    payment_mode integer DEFAULT 0 NOT NULL,
    time_slot character varying(255) DEFAULT ''::character varying,
    room_id integer DEFAULT 0,
    seats integer DEFAULT 0,
    paid_price character varying(255) DEFAULT '0'::character varying,
    total double precision DEFAULT '0'::double precision,
    vat double precision DEFAULT '0'::double precision,
    discount double precision DEFAULT '0'::double precision,
    grand_total double precision DEFAULT '0'::double precision
);


ALTER TABLE public.service_quotes OWNER TO postgres;

--
-- Name: service_quotes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_quotes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_quotes_id_seq OWNER TO postgres;

--
-- Name: service_quotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_quotes_id_seq OWNED BY public.service_quotes.id;


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
    service_invoice_id text
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
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id bigint NOT NULL,
    name character varying(900) NOT NULL,
    image character varying(900),
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    background_image character varying(900),
    slug character varying(255) DEFAULT ''::character varying,
    sort_order integer DEFAULT 0
);


ALTER TABLE public.services OWNER TO postgres;

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
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


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
    moda_commission double precision DEFAULT '0'::double precision NOT NULL,
    inspection_charge integer
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
-- Name: species; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.species (
    id bigint NOT NULL,
    name character varying(900) NOT NULL,
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.species OWNER TO postgres;

--
-- Name: species_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.species_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_id_seq OWNER TO postgres;

--
-- Name: species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.species_id_seq OWNED BY public.species.id;


--
-- Name: square_footage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.square_footage (
    id bigint NOT NULL,
    name character varying(600),
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.square_footage OWNER TO postgres;

--
-- Name: square_footage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.square_footage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.square_footage_id_seq OWNER TO postgres;

--
-- Name: square_footage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.square_footage_id_seq OWNED BY public.square_footage.id;


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
    grand_total double precision,
    admin_commission_percentage double precision
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
-- Name: temp_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_users (
    id bigint NOT NULL,
    name character varying(255),
    email character varying(255),
    dial_code character varying(255),
    phone character varying(255) NOT NULL,
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
-- Name: time_slote; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.time_slote (
    id bigint NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    time_slote_start character varying(600),
    time_slote_end character varying(600),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    time_slote_master integer DEFAULT 0 NOT NULL,
    day character varying(600)
);


ALTER TABLE public.time_slote OWNER TO postgres;

--
-- Name: time_slote_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.time_slote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.time_slote_id_seq OWNER TO postgres;

--
-- Name: time_slote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.time_slote_id_seq OWNED BY public.time_slote.id;


--
-- Name: time_slote_master; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.time_slote_master (
    id bigint NOT NULL,
    time_slote character varying(600)
);


ALTER TABLE public.time_slote_master OWNER TO postgres;

--
-- Name: time_slote_master_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.time_slote_master_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.time_slote_master_id_seq OWNER TO postgres;

--
-- Name: time_slote_master_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.time_slote_master_id_seq OWNED BY public.time_slote_master.id;


--
-- Name: time_zones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.time_zones (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    "offset" character varying(255) NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.time_zones OWNER TO postgres;

--
-- Name: time_zones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.time_zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.time_zones_id_seq OWNER TO postgres;

--
-- Name: time_zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.time_zones_id_seq OWNED BY public.time_zones.id;


--
-- Name: type_of_property; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_of_property (
    id bigint NOT NULL,
    name character varying(600),
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.type_of_property OWNER TO postgres;

--
-- Name: type_of_property_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_of_property_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_of_property_id_seq OWNER TO postgres;

--
-- Name: type_of_property_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_of_property_id_seq OWNED BY public.type_of_property.id;


--
-- Name: user_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_address (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    street character varying(255) NOT NULL,
    location text NOT NULL,
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
    apartment character varying(255),
    full_name character varying(600),
    dial_code character varying(600),
    phone character varying(600)
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
    temp_dial_code character varying(255) DEFAULT ''::character varying,
    temp_mobile character varying(255) DEFAULT ''::character varying,
    specialization text,
    user_type character varying(255),
    property_id bigint,
    supervisor_id bigint
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
-- Name: vehicle_models; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle_models (
    id bigint NOT NULL,
    model character varying(255) NOT NULL,
    manufacturer_id bigint NOT NULL,
    status boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.vehicle_models OWNER TO postgres;

--
-- Name: COLUMN vehicle_models.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vehicle_models.status IS '0 for inactive,1 for active';


--
-- Name: vehicle_models_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicle_models_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicle_models_id_seq OWNER TO postgres;

--
-- Name: vehicle_models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicle_models_id_seq OWNED BY public.vehicle_models.id;


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
    store_type integer DEFAULT 0 NOT NULL,
    deliverydays integer DEFAULT 0 NOT NULL
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
-- Name: vendor_holiday_dates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_holiday_dates (
    id bigint NOT NULL,
    vendor_id integer NOT NULL,
    date date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.vendor_holiday_dates OWNER TO postgres;

--
-- Name: vendor_holiday_dates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_holiday_dates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_holiday_dates_id_seq OWNER TO postgres;

--
-- Name: vendor_holiday_dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_holiday_dates_id_seq OWNED BY public.vendor_holiday_dates.id;


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
-- Name: appointment_times id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment_times ALTER COLUMN id SET DEFAULT nextval('public.appointment_times_id_seq'::regclass);


--
-- Name: appointment_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment_types ALTER COLUMN id SET DEFAULT nextval('public.appointment_types_id_seq'::regclass);


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: aspect_of_room id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aspect_of_room ALTER COLUMN id SET DEFAULT nextval('public.aspect_of_room_id_seq'::regclass);


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
-- Name: breeds id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.breeds ALTER COLUMN id SET DEFAULT nextval('public.breeds_id_seq'::regclass);


--
-- Name: car_damages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_damages ALTER COLUMN id SET DEFAULT nextval('public.car_damages_id_seq'::regclass);


--
-- Name: cars id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars ALTER COLUMN id SET DEFAULT nextval('public.cars_id_seq'::regclass);


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
-- Name: contact_us id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us ALTER COLUMN id SET DEFAULT nextval('public.contact_us_id_seq'::regclass);


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
-- Name: current_project_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_project_status ALTER COLUMN id SET DEFAULT nextval('public.current_project_status_id_seq'::regclass);


--
-- Name: db_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.db_notifications ALTER COLUMN id SET DEFAULT nextval('public.db_notifications_id_seq'::regclass);


--
-- Name: deligates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deligates ALTER COLUMN id SET DEFAULT nextval('public.deligates_id_seq'::regclass);


--
-- Name: designations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.designations ALTER COLUMN id SET DEFAULT nextval('public.designations_id_seq'::regclass);


--
-- Name: division id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.division ALTER COLUMN id SET DEFAULT nextval('public.division_id_seq'::regclass);


--
-- Name: doctor_calender_temps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_calender_temps ALTER COLUMN id SET DEFAULT nextval('public.doctor_calender_temps_id_seq'::regclass);


--
-- Name: doctor_calenders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_calenders ALTER COLUMN id SET DEFAULT nextval('public.doctor_calenders_id_seq'::regclass);


--
-- Name: doctors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors ALTER COLUMN id SET DEFAULT nextval('public.doctors_id_seq'::regclass);


--
-- Name: doggy_play_time_dates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doggy_play_time_dates ALTER COLUMN id SET DEFAULT nextval('public.doggy_play_time_dates_id_seq'::regclass);


--
-- Name: doggy_play_time_temp_bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doggy_play_time_temp_bookings ALTER COLUMN id SET DEFAULT nextval('public.doggy_play_time_temp_bookings_id_seq'::regclass);


--
-- Name: enquiry id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enquiry ALTER COLUMN id SET DEFAULT nextval('public.enquiry_id_seq'::regclass);


--
-- Name: enquiry_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enquiry_details ALTER COLUMN id SET DEFAULT nextval('public.enquiry_details_id_seq'::regclass);


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
-- Name: feeding_schedules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feeding_schedules ALTER COLUMN id SET DEFAULT nextval('public.feeding_schedules_id_seq'::regclass);


--
-- Name: food_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_categories ALTER COLUMN id SET DEFAULT nextval('public.food_categories_id_seq'::regclass);


--
-- Name: food_category_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_category_products ALTER COLUMN id SET DEFAULT nextval('public.food_category_products_id_seq'::regclass);


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
-- Name: food_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_products ALTER COLUMN id SET DEFAULT nextval('public.food_products_id_seq'::regclass);


--
-- Name: foods id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foods ALTER COLUMN id SET DEFAULT nextval('public.foods_id_seq'::regclass);


--
-- Name: groomer_calender_temps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groomer_calender_temps ALTER COLUMN id SET DEFAULT nextval('public.groomer_calender_temps_id_seq'::regclass);


--
-- Name: groomer_calenders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groomer_calenders ALTER COLUMN id SET DEFAULT nextval('public.groomer_calenders_id_seq'::regclass);


--
-- Name: groomers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groomers ALTER COLUMN id SET DEFAULT nextval('public.groomers_id_seq'::regclass);


--
-- Name: grooming_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grooming_types ALTER COLUMN id SET DEFAULT nextval('public.grooming_types_id_seq'::regclass);


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
-- Name: inspection_request id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inspection_request ALTER COLUMN id SET DEFAULT nextval('public.inspection_request_id_seq'::regclass);


--
-- Name: inspection_request_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inspection_request_history ALTER COLUMN id SET DEFAULT nextval('public.inspection_request_history_id_seq'::regclass);


--
-- Name: insurance_providers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurance_providers ALTER COLUMN id SET DEFAULT nextval('public.insurance_providers_id_seq'::regclass);


--
-- Name: manufacturers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturers ALTER COLUMN id SET DEFAULT nextval('public.manufacturers_id_seq'::regclass);


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
-- Name: my_pets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.my_pets ALTER COLUMN id SET DEFAULT nextval('public.my_pets_id_seq'::regclass);


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
-- Name: payment_init id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_init ALTER COLUMN id SET DEFAULT nextval('public.payment_init_id_seq'::regclass);


--
-- Name: payment_report id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_report ALTER COLUMN id SET DEFAULT nextval('public.payment_report_id_seq'::regclass);


--
-- Name: payment_temp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_temp ALTER COLUMN id SET DEFAULT nextval('public.payment_temp_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: photos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos ALTER COLUMN id SET DEFAULT nextval('public.photos_id_seq'::regclass);


--
-- Name: playtime_staffs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playtime_staffs ALTER COLUMN id SET DEFAULT nextval('public.playtime_staffs_id_seq'::regclass);


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
-- Name: project_purpose id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_purpose ALTER COLUMN id SET DEFAULT nextval('public.project_purpose_id_seq'::regclass);


--
-- Name: properties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties ALTER COLUMN id SET DEFAULT nextval('public.properties_id_seq'::regclass);


--
-- Name: property_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_types ALTER COLUMN id SET DEFAULT nextval('public.property_types_id_seq'::regclass);


--
-- Name: public_business_infos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.public_business_infos ALTER COLUMN id SET DEFAULT nextval('public.public_business_infos_id_seq'::regclass);


--
-- Name: question id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question ALTER COLUMN id SET DEFAULT nextval('public.question_id_seq'::regclass);


--
-- Name: question_options id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_options ALTER COLUMN id SET DEFAULT nextval('public.question_options_id_seq'::regclass);


--
-- Name: quotation_request_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quotation_request_history ALTER COLUMN id SET DEFAULT nextval('public.quotation_request_history_id_seq'::regclass);


--
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- Name: room id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room ALTER COLUMN id SET DEFAULT nextval('public.room_id_seq'::regclass);


--
-- Name: room_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_types ALTER COLUMN id SET DEFAULT nextval('public.room_types_id_seq'::regclass);


--
-- Name: service_foods id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_foods ALTER COLUMN id SET DEFAULT nextval('public.service_foods_id_seq'::regclass);


--
-- Name: service_pets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pets ALTER COLUMN id SET DEFAULT nextval('public.service_pets_id_seq'::regclass);


--
-- Name: service_quotes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_quotes ALTER COLUMN id SET DEFAULT nextval('public.service_quotes_id_seq'::regclass);


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
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: skin_colors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin_colors ALTER COLUMN id SET DEFAULT nextval('public.skin_colors_id_seq'::regclass);


--
-- Name: species id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.species ALTER COLUMN id SET DEFAULT nextval('public.species_id_seq'::regclass);


--
-- Name: square_footage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.square_footage ALTER COLUMN id SET DEFAULT nextval('public.square_footage_id_seq'::regclass);


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
-- Name: temp_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users ALTER COLUMN id SET DEFAULT nextval('public.temp_users_id_seq'::regclass);


--
-- Name: time_slote id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slote ALTER COLUMN id SET DEFAULT nextval('public.time_slote_id_seq'::regclass);


--
-- Name: time_slote_master id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slote_master ALTER COLUMN id SET DEFAULT nextval('public.time_slote_master_id_seq'::regclass);


--
-- Name: time_zones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_zones ALTER COLUMN id SET DEFAULT nextval('public.time_zones_id_seq'::regclass);


--
-- Name: type_of_property id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_of_property ALTER COLUMN id SET DEFAULT nextval('public.type_of_property_id_seq'::regclass);


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
-- Name: vehicle_models id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_models ALTER COLUMN id SET DEFAULT nextval('public.vehicle_models_id_seq'::regclass);


--
-- Name: vendor_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_details ALTER COLUMN id SET DEFAULT nextval('public.vendor_details_id_seq'::regclass);


--
-- Name: vendor_holiday_dates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_holiday_dates ALTER COLUMN id SET DEFAULT nextval('public.vendor_holiday_dates_id_seq'::regclass);


--
-- Name: vendor_service_timings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_service_timings ALTER COLUMN id SET DEFAULT nextval('public.vendor_service_timings_id_seq'::regclass);


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

COPY public.app_banners (id, banner_title, banner_image, active, created_by, updated_by, created_at, updated_at, category_id, product_id, type, division_id) FROM stdin;
\.


--
-- Data for Name: appointment_times; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointment_times (id, name, minutes_required, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: appointment_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointment_types (id, name, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles (id, title_en, title_ar, status, desc_en, desc_ar, meta_title, meta_keyword, meta_description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: aspect_of_room; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aspect_of_room (id, name, status, created_at, updated_at) FROM stdin;
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
-- Data for Name: breeds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.breeds (id, name, active, deleted, created_at, updated_at, species, room_type_id, appoint_time_id) FROM stdin;
\.


--
-- Data for Name: car_damages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.car_damages (id, car_id, user_id, image, description, created_at, updated_at) FROM stdin;
1	2	8	1716471788_image_2024_05_21T09_06_11_784Z.png	\N	2024-05-23 13:43:08	2024-05-23 13:43:08
2	16	8	1716899234_28_05_2024_05_27_11_637.jpg	\N	2024-05-28 12:27:14	2024-05-28 12:27:14
3	16	8	1716899251_28_05_2024_05_27_30_347.jpg	\N	2024-05-28 12:27:31	2024-05-28 12:27:31
4	16	8	1716899391_28_05_2024_05_29_48_851.jpg	\N	2024-05-28 12:29:51	2024-05-28 12:29:51
5	20	8	1716923330_29_05_2024_12_08_49_122.jpg	\N	2024-05-28 19:08:50	2024-05-28 19:08:50
6	31	8	1716929686_29_05_2024_01_54_43_015.jpg	\N	2024-05-28 20:54:46	2024-05-28 20:54:46
7	31	8	1716929699_29_05_2024_01_54_58_380.jpg	\N	2024-05-28 20:54:59	2024-05-28 20:54:59
8	85	9	1716987308_1716987304431.jpg	\N	2024-05-29 12:55:08	2024-05-29 12:55:08
9	85	9	1716987331_1716987329729.jpg	\N	2024-05-29 12:55:31	2024-05-29 12:55:31
10	86	9	1716988471_1716988466111.jpg	\N	2024-05-29 13:14:31	2024-05-29 13:14:31
11	86	9	1716988492_1716988490747.jpg	\N	2024-05-29 13:14:52	2024-05-29 13:14:52
12	86	9	1716988546_1716988543448.jpg	\N	2024-05-29 13:15:46	2024-05-29 13:15:46
13	86	9	1716988556_1716988554632.jpg	\N	2024-05-29 13:15:56	2024-05-29 13:15:56
\.


--
-- Data for Name: cars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cars (id, plate_number, user_id, ticket, sms_id, country_code, phone, email, car_color, car_make, carwash, fuel, extra_charge, tip, discount, guest, room, level, check_out, slot, hanger, created_at, updated_at, plate_code, key_tag, vpa_runner, model, first_name, last_name, is_whatsapp, status, full_ticket, image, property_id, assigned_to, car_reg_state_id, payment_link) FROM stdin;
1	12312	8	1231	\N	92	123213	test@gmail.com	1	1	t	1	\N	\N	\N	t	\N	1	\N	1	1	2024-05-23 05:39:09	2024-05-23 05:39:09	12312	12312	1231	2	1	1	t	Pending	1	\N	\N	\N	\N	\N
2	12323	8	#154	\N	92	123213	test@gmail.com	1	1	t	1	\N	\N	\N	t	\N	1	\N	1	1	2024-05-23 07:25:07	2024-05-23 07:25:07	12312	12312	1231	2	1	1	t	Pending	1	\N	\N	\N	\N	\N
3	456	8	#165	\N	+971			null	null	f	0	\N	\N	\N	f	\N		\N			2024-05-24 07:44:53	2024-05-24 07:44:53							f	Pending	1	\N	\N	\N	\N	\N
5	123128	8	88888	\N	92	123213	test@gmail.com	1	1	t	1	\N	\N	\N	t	\N	1	\N	1	1	2024-05-26 15:04:04	2024-05-26 15:04:04	12312	12312	1231	2	1	1	t	Pending	1	\N	\N	\N	\N	\N
6	123124	8	88888	\N	92	123213	test@gmail.com	1	1	t	1	\N	\N	\N	t	\N	1	\N	1	1	2024-05-26 15:15:39	2024-05-26 15:15:39	12312	12312	1231	2	1	1	t	Pending	1	\N	2	\N	\N	\N
4	544	8	#375	\N	+971			null	null	f	0	\N	\N	\N	f	\N		\N			2024-05-24 07:50:57	2024-05-26 15:46:34							f	Pending	1	\N	\N	8	\N	\N
7	263255	8	#997	\N	92	123213	test@gmail.com	1	1	t	1	\N	\N	\N	t	\N	1	\N	1	1	2024-05-27 05:13:54	2024-05-27 05:13:54	25625	12312	1231	2	1	1	t	Pending	1	\N	2	\N	\N	\N
8	123124	8	88888	\N	92	123213	test@gmail.com	1	1	t	1	\N	\N	\N	t	\N	1	\N	1	1	2024-05-27 05:49:08	2024-05-27 05:49:08	12312	12312	1231	2	1	1	t	Pending	1	\N	2	\N	1	\N
9	123121	8	88888	\N	92	123213	test@gmail.com	1	1	t	1	\N	\N	\N	t	\N	1	\N	1	1	2024-05-27 05:51:20	2024-05-27 05:51:20	12312	12312	1231	2	1	1	t	Pending	1	\N	2	\N	1	\N
10	123125	8	88888	\N	92	123213	test@gmail.com	1	1	t	1	\N	\N	\N	t	\N	1	\N	1	1	2024-05-27 05:52:04	2024-05-27 05:52:04	12312	12312	1231	2	1	1	t	Pending	1	\N	2	\N	1	\N
11	123122	8	88888	\N	92	123213	test@gmail.com	1	1	t	1	\N	\N	\N	t	\N	1	\N	1	1	2024-05-27 06:03:22	2024-05-27 06:03:22	12312	12312	1231	2	1	1	t	Pending	1	\N	2	\N	1	\N
12	123127	8	#174	\N	92	123213	test@gmail.com	1	1	t	1	\N	\N	\N	t	\N	1	\N	1	1	2024-05-27 06:04:17	2024-05-27 06:04:17	12312	12312	1231	2	1	1	t	Pending	1	\N	2	\N	1	\N
13	123127	8	88888	\N	92	123213	test@gmail.com	1	1	t	1	\N	\N	\N	t	\N	1	\N	1	1	2024-05-27 06:07:29	2024-05-27 06:07:29	12312	12312	1231	2	1	1	t	Pending	1	\N	2	\N	\N	\N
14	263256	8	#492	\N	92	123213	test@gmail.com	1	1	t	1	\N	\N	\N	t	\N	1	\N	1	1	2024-05-27 06:09:23	2024-05-27 06:09:23	25625	12312	1231	2	1	1	t	Pending	1	\N	2	\N	\N	\N
15	123129	8	#757	\N	92	123213	test@gmail.com	1	1	t	1	\N	\N	\N	t	\N	1	\N	1	1	2024-05-28 10:58:53	2024-05-28 10:58:53	12312	12312	1231	2	1	1	t	Pending	1	\N	2	\N	\N	\N
16	123140	8	#675	\N	92	123213	test@gmail.com	1	1	t	1	\N	\N	\N	t	\N	1	\N	1	1	2024-05-28 11:01:15	2024-05-28 11:01:15	12312	12312	1231	2	1	1	t	Pending	1	\N	2	\N	\N	https://dxbitprojects.com/tasreenew/public/request-car/16?signature=87d01fafeef74705ba78c67e2e289c987f301e8c1c36341d327cc2e94ef781c3
30		8	#227	\N	971			1		f	0	\N	\N	\N	f	\N		\N			2024-05-28 20:52:27	2024-05-28 20:52:27							f	Pending	0	\N	2	\N	\N	https://dxbitprojects.com/tasreenew/public/request-car/30?signature=407868874a359fdea1d4081f6fd2cf93efdee88938394f9d6093d2339b3a6163
19	125	8	#710	\N	92	3441562554		1	1	t	1	\N	\N	\N	t	\N	1	\N	1	1	2024-05-28 17:23:46	2024-05-28 18:04:54	AD	12312	1231	2	1	1	t	ready_not_paid	1	\N	2	8	\N	https://dxbitprojects.com/tasreenew/public/request-car/19?signature=ce25f12f74b8d4e386829656f366a786b0a3d7ceaacacb85dae6928de3bca210
20	123	8	#840	\N	+🇵🇰 92	3441562554	razahamid34@gmail.com	1	1	t	1	\N	\N	\N	f	\N	25	\N	35	25	2024-05-28 18:49:40	2024-05-28 18:49:40		Tag	Vpa	i8	Hamid	Raza	t	Pending	0	\N	2	\N	\N	https://dxbitprojects.com/tasreenew/public/request-car/20?signature=886d9f8d2e28973119ea81428c46efe38ee28b9805af6c3b88f84a6edc4e00e1
18	263257	8	#860	\N	92	123213	test@gmail.com	1	1	t	1	\N	\N	\N	t	\N	1	\N	1	1	2024-05-28 11:10:18	2024-05-28 12:14:50	25625	12312	1231	2	1	1	t	released	1	\N	2	8	\N	https://dxbitprojects.com/tasreenew/public/request-car/18?signature=86e6d599ffbd8a6893c0bec411285746c5890733d33ff26341b6992b75a0e934
21	123141	8	#552	\N	92	123213	test@gmail.com	1	1	t	1	\N	\N	\N	t	\N	1	\N	1	1	2024-05-28 19:39:41	2024-05-28 19:39:41	12312	12312	1231	2	1	1	t	Pending	1	\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/21?signature=b7b75b350717bdcfdc9df6f6e64598b8b8191642bea71c4c37b8bb582b608c43
17	123141	8	#943	\N	92	123213	test@gmail.com	1	1	t	1	\N	\N	\N	t	\N	1	\N	1	1	2024-05-28 11:02:48	2024-05-28 12:18:33	12312	12312	1231	2	1	1	t	released	1	\N	2	8	\N	https://dxbitprojects.com/tasreenew/public/request-car/17?signature=4616943f2872fcef77d1b80e1cab72a8f988c65c769d2fb9d24001a6e93a76c1
22	254	8	#225	\N	92	123213	test@gmail.com	1	1	t	1	\N	\N	\N	t	\N	1	\N	1	1	2024-05-28 20:13:08	2024-05-28 20:13:08	12312	12312	1231	2	1	1	t	Pending	1	\N	2	\N	\N	https://dxbitprojects.com/tasreenew/public/request-car/22?signature=386c5cee48d6cd26ffbb2869303222ddf04cbae7010fbc64a100b51c512ee5a0
27		8	#701	\N	971			1	1	f	0	\N	\N	\N	f	\N		\N			2024-05-28 20:46:41	2024-05-28 20:46:41							f	Pending	0	\N	2	\N	\N	https://dxbitprojects.com/tasreenew/public/request-car/27?signature=31c9ee74df962d4aabe9bf422318c5ac8ad6cf3ed1bfef3cd79208db7e76a91a
28		8	#593	\N	971			1		f	0	\N	\N	\N	f	\N		\N			2024-05-28 20:48:44	2024-05-28 20:48:44							f	Pending	0	\N	2	\N	\N	https://dxbitprojects.com/tasreenew/public/request-car/28?signature=411bdef57ae8f658154e94ba26f373c16e5b54e81645be8338ded29c9b934289
29		8	#713	\N	971			1		f	0	\N	\N	\N	f	\N		\N			2024-05-28 20:50:11	2024-05-28 20:50:11							f	Pending	0	\N	2	\N	\N	https://dxbitprojects.com/tasreenew/public/request-car/29?signature=92c5103bcd489b822e0df0ee4c4f560cd116e9b65b87a5bd20d0eb8725de9f94
31		8	#392	\N	971			1		f	0	\N	\N	\N	f	\N		\N			2024-05-28 20:54:06	2024-05-28 20:54:06							f	Pending	0	\N	2	\N	\N	https://dxbitprojects.com/tasreenew/public/request-car/31?signature=62a2feaccb06424a30b872f31cc61d14206d2bc09b1b9faa3503df66cc0c39ce
32	123	8	#893	\N	971	3441562554	razahamd34@gmail.com	1	1	t	1	\N	\N	\N	t	\N	25	\N	69	35	2024-05-28 21:39:22	2024-05-28 21:39:22	BX	Tag	VPA	i8	Hamid	Raza	t	Pending	0	\N	2	\N	\N	https://dxbitprojects.com/tasreenew/public/request-car/32?signature=5019f7ab43c17a5ee446de6e69238c00c0085b9a3bff2d578be3c1539bf9c092
33		8	#980	\N						f		\N	\N	\N	f	\N		\N			2024-05-28 21:55:39	2024-05-28 21:55:39							f	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/33?signature=74b5c9779f4b7a4eb90d8192701a38b6bcc8258fa02d1296eabb06adc0054fb7
34		8	#813	\N						f		\N	\N	\N	f	\N		\N			2024-05-29 05:26:21	2024-05-29 05:26:21							f	Pending		\N	2	\N	\N	https://dxbitprojects.com/tasreenew/public/request-car/34?signature=b9803b7063e2dc843faf00642385bf3f6d929d3713940010f144e013354e5d72
35		8	#530	\N						f		\N	\N	\N	f	\N		\N			2024-05-29 05:28:34	2024-05-29 05:28:34							f	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/35?signature=4debdcf71f3252a5f8b7e1987ac531b2fffab5de2b65544b690772e850dfbb16
36		8	#079	\N						f		\N	\N	\N	f	\N		\N			2024-05-29 05:29:36	2024-05-29 05:29:36							f	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/36?signature=35930e67a7b4fc783e28588a936d020b39703cf8b7c10b20ac4792d69c61babe
37		8	#123	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:10:08	2024-05-29 06:10:08							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/37?signature=a7ff940a585bfbf58d24c0a36d6a2fa5e197d89f12ae516301160420658d0baf
38		8	#515	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:11:03	2024-05-29 06:11:03							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/38?signature=f7b89624cbf7b4337c19e8ec8c4c1fea5ae5d79e1f5503a4c519a80fe041fc69
39		8	#244	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:12:33	2024-05-29 06:12:33							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/39?signature=f8f6019bd7a569f83ab99d9a178422989a7a28ba847222a00b177725a170cdaf
40		8	#743	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:13:42	2024-05-29 06:13:42							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/40?signature=c3f39510e1589e5cea6a49f9e9a5edd88172ef3fc4f1c8bc7e8e5b0ba850fc07
41		8	#316	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:16:08	2024-05-29 06:16:08							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/41?signature=4c5b5cea2b81e1d055684aa3c0f3d39497fc47742431ed492b035808e15a812f
42		8	#078	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:17:49	2024-05-29 06:17:49							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/42?signature=e57382492b69d8d3d6dc7152b4ace35282eaa1a5694e7d60f73447c0b4f243b9
43		8	#398	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:20:42	2024-05-29 06:20:42							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/43?signature=81909206a3fe599b29dc25f8165004c661e07868a10671c4fa86e93cefc54dc4
44		8	#995	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:22:06	2024-05-29 06:22:06							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/44?signature=32c55a32396ee17a363e37bf2ec550d8feb344f5dc660e55f5682a44d865e46f
45		8	#033	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:22:47	2024-05-29 06:22:47							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/45?signature=c1f80a92cd0ccd52d87501ec6c7f290fb9e127ddbb5f68cf77b0c2469d9b811c
46		8	#009	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:24:47	2024-05-29 06:24:47							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/46?signature=2006f0a5fae044b64017e3f8ca239869b99fa25f1243fd61381821c245c773ee
47		8	#195	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:32:45	2024-05-29 06:32:45							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/47?signature=07be22d87506aff187b98b82b5050258822cba041ca60fcfb920e7b73d84359b
48		8	#649	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:33:28	2024-05-29 06:33:28							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/48?signature=285a92c5b9ac7fe3f99ffabd0d8595b8baaa0554001122b1f28f6079ace9f6fc
49		8	#466	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:34:10	2024-05-29 06:34:10							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/49?signature=7898661e95bcbd5c9e26ae7c7bdecfa5f28cd4db6a288d5d212f9b6d43a976cb
50		8	#687	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:34:47	2024-05-29 06:34:47							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/50?signature=0d346825f566f5c7734b9770d7d8661463c1e48166b86c0919dfc0be9edb7e95
51		8	#746	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:35:08	2024-05-29 06:35:08							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/51?signature=24aa8bf41c97ab61e78e68d0ad6c8887ca49b7ed0f38fa4e3e1e2ffd30519db8
52		8	#652	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:35:44	2024-05-29 06:35:44							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/52?signature=4abd72fe00e19f5b82fb2fe7dbda30dee4010b0e5f99c6153a7f505cda03851a
53		8	#429	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:36:53	2024-05-29 06:36:53							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/53?signature=6ee432613fa0de28e654f78758d0058a1a3881369d919de249b0f85c3b9b88d0
54		8	#728	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:41:22	2024-05-29 06:41:22							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/54?signature=9241dcf9af4ce0e8bfe404ac19e28307a259a9e8665928bf3dcfc673e39e9e49
55		8	#916	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:44:54	2024-05-29 06:44:54					Abdul	Wahab	t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/55?signature=b437d7e2364dc9e63103e3cee6d5df32c6867a81a0e56584ffaddf0275c3da7c
56		8	#676	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:48:57	2024-05-29 06:48:57							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/56?signature=d242a04c32a59cdc9422631ab39a8c28b398193f82a1b8494863c5bcf604fedc
57		8	#889	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:52:43	2024-05-29 06:52:43							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/57?signature=f975d23a4cc96241c6befd00de7f2f23d2f2d02eba7f3387a9fa0036d88c54c4
58		8	#596	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:56:34	2024-05-29 06:56:34							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/58?signature=4d9e50244f39743db5d71e2be2f15b7a8cd3e9eed0a2651d83d6b87438cf6443
59		8	#982	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 06:57:53	2024-05-29 06:57:53							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/59?signature=ab228b08dfa14412e878d7c1620f2aa06f934997e761b182b2d510ff66aa159c
60		8	#478	\N	91	9847823799				f		\N	\N	\N	f	\N		\N			2024-05-29 06:59:52	2024-05-29 06:59:52							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/60?signature=2ad9c49dd9d20fcfe7350cc3afff97a62c32c61788df99fc626cd0b82c99da13
61		8	#131	\N	91	9847823799				f		\N	\N	\N	f	\N		\N			2024-05-29 07:02:42	2024-05-29 07:02:42							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/61?signature=e11b15633d75c87e6c94ec748a4701fcf8d2b39b3331c2a35225c2c3320da006
62		8	#609	\N	91	9847823799				f		\N	\N	\N	f	\N		\N			2024-05-29 07:11:42	2024-05-29 07:11:42							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/62?signature=7c28eb3fd5d31d128527f6758873ea781268e6117efc86b17e4481451538c8ad
63		8	#925	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 07:11:59	2024-05-29 07:11:59							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/63?signature=fae0fc8dc6d5b99bc702955b00aa42d4ff2b5d50488f8cbf5600e8acd5c69d90
64		8	#585	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 07:12:36	2024-05-29 07:12:36							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/64?signature=62c7fca5a0fbffeceb65ca75967e5c755920e03413ef1dd9d6a8f0a99d1e5efb
65		8	#105	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 07:17:05	2024-05-29 07:17:05							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/65?signature=f882f4aef5d386d253e830c36ef2f647de96514e628a862e162462234cbcd084
66		8	#896	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 07:18:02	2024-05-29 07:18:02							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/66?signature=5acd7ca9307b2efb041ec362c1f49531286a67cec5d66a418959aeaf186e164b
67		8	#465	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 07:18:28	2024-05-29 07:18:28							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/67?signature=f16e683ed71581d6c81482a7f5d40bad53f370f928c219e23e7808f0b95becd4
68		8	#891	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 07:23:05	2024-05-29 07:23:06							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/68?signature=baa5d32561df83433aa1af6073aa788b6b4c9172bf3cf77bf841b92dfd200ddb
69		8	#706	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 07:23:54	2024-05-29 07:23:54							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/69?signature=d7528fd95ba327ad5f831f52321f10f928fa330e866f926f797c83baa22907b6
70		8	#288	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 07:24:58	2024-05-29 07:24:58							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/70?signature=1a30c25186f16ad381ed31417ea783fdf42006660fe944c9fce0486bce54c355
71		8	#553	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 07:28:17	2024-05-29 07:28:17							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/71?signature=fb3a797294efcfa0695a539ec436c6289e7be638efec34d4dff4beca825c1d7c
72		8	#236	\N	91	9847823799				f		\N	\N	\N	f	\N		\N			2024-05-29 07:29:54	2024-05-29 07:29:54							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/72?signature=6ef4366363b40c43b5c33284bc82522165923788676716cafc534d3e0b5fe4c6
73		8	#942	\N	91	9847823799				f		\N	\N	\N	f	\N		\N			2024-05-29 07:31:06	2024-05-29 07:31:06							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/73?signature=8ea9e992255fb516acd86f822e80666d8ae6e7b310853054b31c59e6d1bf3391
74		8	#214	\N	91	9847823799				f		\N	\N	\N	f	\N		\N			2024-05-29 07:32:45	2024-05-29 07:32:45							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/74?signature=e4ec1e95e88586baa6362e22b6730ea1c2135c2703486f4187f16ba9c9346ef9
75		8	#437	\N	91	9847823799				f		\N	\N	\N	f	\N		\N			2024-05-29 07:34:10	2024-05-29 07:34:10							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/75?signature=c9df4225ccdccd159967c8d60ee8411eeb1e082313881487aaa88028d6d6285b
76		8	#186	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 07:39:54	2024-05-29 07:39:54							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/76?signature=9db21c43c368aab159ea9681c5d76779559c53afcd409c58560488e4797faf28
77		8	#070	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 07:51:03	2024-05-29 07:51:03							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/77?signature=667b2b69f734c69c90f34143fd1e980cb74422191d10f688f939875bad224149
78		8	#576	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 08:21:34	2024-05-29 08:21:34							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/78?signature=5aacdafb7db4bafaa73f48cea8271e176dd8fad657bc4a697a49fc073cb422a5
79		8	#050	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 08:23:00	2024-05-29 08:23:00							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/79?signature=7fa478670d09fa3f69c11b0bf8afbf1e22075a41cecc04ee716d078dd05d009e
80		8	#099	\N	92	3110413143				f		\N	\N	\N	f	\N		\N			2024-05-29 08:23:48	2024-05-29 08:23:48							t	Pending		\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/80?signature=6f3aeaa30ea3ee07d7e18a2522d878eee0950f71e79d23fbdf5bad655579255b
81	123	8	#338	\N	92	3441562554	razahamid34@gmail.com	1	1	t	1	\N	\N	\N	f	\N	25	\N	30	12	2024-05-29 09:03:14	2024-05-29 09:03:14	DX	Tag	Vpa	1	Hamid	Raza	f	Pending	0	\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/81?signature=a70f58f4c7e76d9ca50d1c85d0e044952a9e75149b49cac2d49ef4eb264a835c
85	8546	9	#204	\N	91	9832831811		1	1	t	1	\N	\N	\N	t	\N	5	\N	2	25	2024-05-29 12:51:51	2024-05-29 12:51:51	GH			1	Nemai	Biswas	f	Pending	0	\N	3	\N	\N	https://dxbitprojects.com/tasreenew/public/request-car/85?signature=f07b5f21ff9ae6e73e35f09576a2b27be4f74aea50c628e8d531c22e36044386
83	1234	8	#627	\N	92	3441562554	razahamid34@gmail.com	1	1	t	1	\N	\N	\N	f	\N	25	\N	36	25	2024-05-29 09:28:17	2024-05-29 09:28:17	DX	Tag	vpa	1	Hamid	Raza	f	Pending	0	\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/83?signature=d3f8e9ec58dcb1174ea550f3b6985741b6545d8f1ae55212f165d8323d143cbc
84	1234	8	#669	\N	92	3441562554	razahamid34@gmail.com	1	1	t	1	\N	\N	\N	f	\N	36	\N	25	36	2024-05-29 09:31:14	2024-05-29 09:31:14	BX	tag	vpa	1	Hamid	Raza	t	Pending	0	\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/84?signature=d97bb643b93ae2960376db57be9797104b4210c689215d7123f2fa550f599041
82	123	8	619	\N	92	3441562554	razahamid34@gmail.com	1	1	t	1	\N	\N	\N	f	\N	25	\N	35	25	2024-05-29 09:04:52	2024-05-29 11:38:43	BC	Tag	vpas	i8	Hamid	Goraya	f	requested_and_not_paid	0	\N	2	8	1	https://dxbitprojects.com/tasreenew/public/request-car/82?signature=67364451f107bfed6c714bc173378f6de8bc7d3497181a00212c9ec9001fa897
86	6445	9	261	\N	971	984247888		1	1	t	1	\N	\N	\N	t	\N	25	\N	2	32	2024-05-29 13:09:39	2024-05-29 13:23:44		N	N	i8	N	Biswas	f	Pending	1	\N	3	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/86?signature=2d485cee4a3c974a29eaa58a69b120ba95bb627b41290f0fed3259e0b52747bf
87		8	#544	\N	971			1	1	f	0	\N	\N	\N	f	\N		\N			2024-05-29 20:22:49	2024-05-29 20:22:49				1			f	Pending	0	\N	2	\N	\N	https://dxbitprojects.com/tasreenew/public/request-car/87?signature=8ecbc03ba615500c89d35d6260fe311224dc6331248d22dce57b9a072c3a9601
88		8	#082	\N	971			1		f	0	\N	\N	\N	f	\N		\N			2024-05-29 20:34:44	2024-05-29 20:34:44							f	Pending	0	\N	2	\N	\N	https://dxbitprojects.com/tasreenew/public/request-car/88?signature=b3c0f76b6d6fc2255f4df46b1f191a2f7e635ebab57e2477667c148237eb359d
89	4-54996	8	#010	\N	92	3441562554		1	1	t	1	\N	\N	\N	f	\N	25	\N	25	25	2024-05-30 05:08:31	2024-05-30 05:10:19	BC	Tag	VPA	1	Hamid		t	requested_and_not_paid	0	\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/89?signature=c2d0741a61569af2c2b5779380b57ac16155a6c01c01369b4c0a9049d8939827
90	1466	10	#371	\N	92	3441562554			1	t	1	\N	\N	\N	f	\N		\N			2024-05-30 08:31:36	2024-05-30 08:31:36	Dx	25	646		Hamid		t	Pending	0	\N	2	\N	1	https://dxbitprojects.com/tasreenew/public/request-car/90?signature=52a56e1853e22f5adbad960cbedf1c593b60aaae1f3851a31824a10a398b7046
\.


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, product_id, product_attribute_id, quantity, user_id, store_id, device_cart_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cart_food; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_food (id, product_id, quantity, user_id, store_id, device_cart_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name, image, banner_image, parent_id, active, deleted, sort_order, created_uid, updated_uid, created_at, updated_at, slug, division_id) FROM stdin;
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name, active, country_id, state_id, created_uid, updated_uid, deleted, created_at, updated_at) FROM stdin;
1	JLT	1	1	1	1	1	0	2024-05-02 14:36:47	2024-05-03 04:35:04
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

COPY public.contact_us (id, name, email, dial_code, mobile, message, created_at, updated_at) FROM stdin;
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
1	United Arab Emirates	AE	971	1	2024-05-02 14:36:12	2024-05-03 04:34:09	0
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
-- Data for Name: current_project_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.current_project_status (id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: db_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.db_notifications (id, type, notifiable_type, notifiable_id, related_to, data, read_at, created_at, updated_at) FROM stdin;
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
-- Data for Name: division; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.division (id, name, image, banner_image, parent_id, active, deleted, sort_order, created_uid, updated_uid, created_at, updated_at, slug) FROM stdin;
\.


--
-- Data for Name: doctor_calender_temps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_calender_temps (id, doctor_id, event_date, start_time, end_time, device_id, event_title, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: doctor_calenders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_calenders (id, doctor_id, event_date, start_time, end_time, event_title, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctors (id, name, sunday, sun_from, sun_to, monday, mon_from, mon_to, tuesday, tues_from, tues_to, wednesday, wed_from, wed_to, thursday, thurs_from, thurs_to, friday, fri_from, fri_to, saturday, sat_from, sat_to, vendor, active, deleted, created_at, updated_at, type, qualification, image, document) FROM stdin;
\.


--
-- Data for Name: doggy_play_time_dates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doggy_play_time_dates (id, vendor_id, service_id, date, price, total_seats, seats, guests_booking, time_start, time_end, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: doggy_play_time_temp_bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doggy_play_time_temp_bookings (id, user_id, vendor_id, service_id, total, request_data, payment_id, payment_status, receipt_url, payment_response, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: enquiry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enquiry (id, user_id, type, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: enquiry_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enquiry_details (id, enquiry_id, question_id, answers, created_at, updated_at) FROM stdin;
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
-- Data for Name: feeding_schedules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feeding_schedules (id, name, active, deleted, created_at, updated_at) FROM stdin;
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
-- Data for Name: food_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_products (id, vendor_id, shared_product, store_id, is_editable_by_outlets, product_name, regular_price, sale_price, is_veg, promotion, product_images, description, deleted, product_status, created_at, updated_at, pieces) FROM stdin;
\.


--
-- Data for Name: foods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.foods (id, name, image, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: groomer_calender_temps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groomer_calender_temps (id, groomer_id, event_date, start_time, end_time, device_id, event_title, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: groomer_calenders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groomer_calenders (id, groomer_id, event_date, start_time, end_time, event_title, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: groomers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groomers (id, name, sunday, sun_from, sun_to, monday, mon_from, mon_to, tuesday, tues_from, tues_to, wednesday, wed_from, wed_to, thursday, thurs_from, thurs_to, friday, fri_from, fri_to, saturday, sat_from, sat_to, vendor, active, deleted, created_at, updated_at, image) FROM stdin;
\.


--
-- Data for Name: grooming_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grooming_types (id, name, active, deleted, created_at, updated_at) FROM stdin;
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
-- Data for Name: inspection_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inspection_request (id, request_id, user_id, time_slote_id, technician_id, slot_date, latitude, longitude, location, status, visitation_fee, tax, grand_total, payment_type, payment_status, created_at, updated_at, vehicle_id, inspection_report, quotation_price, quotation_file, quotation_status, annual_contract, quotation_price_tax, quotation_grand_total, quote_payment_type) FROM stdin;
\.


--
-- Data for Name: inspection_request_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inspection_request_history (id, inspection_request_id, status, date, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: insurance_providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insurance_providers (id, name, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: manufacturers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.manufacturers (id, name, logo, status, created_at, updated_at) FROM stdin;
1	BMW		t	2024-05-17 13:01:18	2024-05-29 19:14:59
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
236	2023_05_02_123034_alter_deligates_add_shipping_charge	1
237	2023_05_03_054833_alter_service_request_add_extra	1
238	2023_05_03_062139_add_pieces_to_food_products_table	1
239	2023_05_03_072823_create_cart_food_table	1
240	2023_05_09_014726_create_breeds_table	1
241	2023_05_09_014905_create_insurance_providers_table	1
242	2023_05_09_021728_create_my_pets_table	1
243	2023_05_10_003833_create_species_table	1
244	2023_05_10_003921_change_col_type_in_my_pets	1
245	2023_05_10_004104_alter_breeds_add_species	1
246	2023_05_10_021005_create_doctors_table	1
247	2023_05_10_111007_create_groomers_table	1
248	2023_05_10_180728_create_appointment_types_table	1
249	2023_05_11_003123_create_feeding_schedules_table	1
250	2023_05_11_003958_create_services_table	1
251	2023_05_11_011937_create_service_quotes_table	1
252	2023_05_11_114159_create_vendor_service_timings_table	1
253	2023_05_15_002505_alter_doctors_cols	1
254	2023_05_15_010530_alter_groomers_add_col	1
255	2023_05_15_011620_create_grooming_types_table	1
256	2023_05_15_013030_create_playtime_staffs_table	1
257	2023_05_15_023030_create_food_table	1
258	2023_05_16_053527_alter_service_quotes_add_cols	1
259	2023_05_16_061659_alter_service_quotes_add_cols_1	1
260	2023_05_20_025426_alter_cart_del_cols	1
261	2023_05_20_044403_alter_app_banners_add_cols	1
262	2023_05_22_014622_alter_address_table	1
263	2023_05_22_024709_alter_temp_order_products_add_cols	1
264	2023_05_22_024741_alter_order_products_add_cols1	1
265	2023_05_29_012937_alter_my_pets_add_col	1
266	2023_05_31_020328_alter_product_add_col	1
267	2023_06_01_020145_alter_notifications_table	1
268	2023_06_02_084427_create_doctor_calenders_table	1
269	2023_06_02_093337_create_doctor_calender_temps_table	1
270	2023_06_06_012222_alter_services_add_col	1
271	2023_06_08_021929_alter_my_pets_add_col1	1
272	2023_06_09_011908_create_room_types_table	1
273	2023_06_09_011956_create_appointment_times_table	1
274	2023_06_09_022614_alter_breeds_add_col	1
275	2023_06_15_012606_alter_service_quotes_add_col2	1
276	2023_06_17_033950_create_service_pets_table	1
277	2023_06_19_010946_create_contact_us_table	1
278	2023_06_20_005942_alter_service_quotes_add_col3	1
279	2023_06_20_010733_create_service_foods_table	1
280	2023_06_21_011905_create_groomer_calenders_table	1
281	2023_06_21_011930_create_groomer_calender_temps_table	1
282	2023_07_20_045159_create_temp_users_table	1
283	2023_07_20_140223_add_clug_column_in_category	1
284	2023_07_21_043728_add_slug_column_in_services	1
285	2023_07_21_103607_add_column_in_service_quotes	1
286	2023_07_26_101945_add_room_id_column_in_service_quotes	1
287	2023_07_27_052410_create_table_vendor_holiday_dates	1
288	2023_07_28_121401_create_doggy_play_time_table	1
289	2023_08_01_074201_add_seats_price_column_in_service_quotes	1
290	2023_08_01_081258_create_doggy_play_time_temp_bookings	1
291	2023_08_03_084950_add_change_mobile_columns_user_table	1
292	2023_10_03_061536_db_notifications	1
293	2023_10_03_094600_materials	1
294	2023_10_03_122513_project_purpose	1
295	2023_10_03_124600_room	1
296	2023_10_03_125652_square_footage	1
297	2023_10_04_065057_aspect_of_room	1
298	2023_10_04_070833_type_of_property	1
299	2023_10_04_071637_current_project_status	1
300	2023_10_04_110658_question	1
301	2023_10_04_112506_add_type_to_banners_table	1
302	2023_10_05_064516_question_options	1
303	2023_10_05_083859_create_division_table	1
304	2023_10_05_092108_add_slug_to_division_table	1
305	2023_10_05_112337_add_division_to_banners_table	1
306	2023_10_05_120440_sort_order	1
307	2023_10_06_062757_add_division_to_category_table	1
308	2023_10_09_104552_enquiry	1
309	2023_10_09_104639_enquiry_details	1
310	2023_10_11_053738_ratings	1
311	2023_10_12_043742_deliverydays	1
312	2023_10_16_070317_fullname	1
313	2023_10_19_092411_division	1
314	2023_10_20_105059_placeholder	1
315	2023_10_28_081458_create_manufacturers_table	1
316	2023_11_04_063716_create_vehicle_models_table	1
317	2023_11_30_131741_time_slote	1
318	2023_12_02_133447_user_id	1
319	2023_12_04_044107_time_slote_master	1
320	2023_12_04_052921_time_slote_master1	1
321	2023_12_04_063740_day	1
322	2023_12_04_093632_inspection_request	1
323	2023_12_04_103320_vehicle_id	1
324	2023_12_04_113322_specialization	1
325	2023_12_19_120414_add_inspection_report_column_inspection_request_table	1
326	2023_12_19_130739_add_quotation_price	1
327	2023_12_20_122648_add_inspection_charge_setting_table	1
328	2024_01_10_122458_quotation_status	1
329	2024_01_11_040624_inspection_request_history	1
330	2024_01_11_090852_quotation_request_history	1
331	2024_01_11_095952_quotation_price_tax	1
332	2024_01_11_104251_payment_temp	1
333	2024_01_11_105432_payment_init	1
334	2024_01_11_110808_payment_mode	1
335	2024_01_11_123136_quote_payment_status	1
336	2024_05_02_073553_create_time_zones_table	1
337	2024_05_02_075342_create_property_types_table	1
338	2024_05_02_095022_create_properties_table	1
339	2024_05_02_100609_add_deleted_and_active_to_properties_table	1
340	2024_05_03_110126_add_url_and_expiration_date_to_notifications_table	2
341	2024_05_03_163411_add_lat_long_dial_code_to_properties_table	3
342	2024_05_04_112824_add_user_type_and_property_id_to_users_table	3
343	2024_05_13_220709_add_tasree_commission_to_properties_table	4
344	2024_05_14_110646_create_cars_table	5
345	2024_05_16_102117_add_supervisor_id_to_properties_table	6
346	2024_05_16_114656_add_supervisor_id_to_users_table	6
347	2024_05_17_131026_create_cars_table	7
348	2024_05_23_011249_add_missing_columns_to_cars_table	8
349	2024_05_23_020822_create_car_damages_table	8
\.


--
-- Data for Name: moda_main_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moda_main_categories (id, name, created_at, updated_at) FROM stdin;
1	Head	2024-05-02 13:57:00	\N
2	Upper Body	2024-05-02 13:57:00	\N
3	Lower Body	2024-05-02 13:57:00	\N
4	Footwear	2024-05-02 13:57:00	\N
5	Makeup	2024-05-02 13:57:00	\N
6	Accessories	2024-05-02 13:57:00	\N
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
-- Data for Name: my_pets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.my_pets (id, user_id, name, breed_id, sex, dob, weight, food, additional_notes, active, deleted, created_at, updated_at, species, image, medicine_instructions) FROM stdin;
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, description, title, image, created_at, updated_at, url, expiration_date) FROM stdin;
6		Exciting Deals Await!	\N	2024-05-14 06:32:00	\N	https://dxbitprojects.com/	2024-05-15
\.


--
-- Data for Name: nottification_tracks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nottification_tracks (id, type, from_user_id, to_user_id, firebase_node_id, created_at, updated_at, key_id) FROM stdin;
\.


--
-- Data for Name: order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_products (id, order_id, product_id, product_attribute_id, product_type, quantity, price, discount, total, vendor_id, order_status, admin_commission, vendor_commission, shipping_charge, delivered_on, is_returned, ret_status, returned_on, ret_reason, ret_status_changed_on, ret_status_changed_by, grand_total, admin_commission_percentage) FROM stdin;
\.


--
-- Data for Name: order_status_histroys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_status_histroys (id, order_id, order_status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, invoice_id, user_id, address_id, total, vat, discount, grand_total, payment_mode, status, booking_date, total_qty, total_items_qty, oder_type, admin_commission, vendor_commission, shipping_charge, created_at, updated_at, coupon_code, coupon_id, store_id, request_deligate, order_otp, driver_id, driver_rating, driver_review, store_rating, store_review, store_viewed, driver_viewed) FROM stdin;
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: payment_init; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_init (id, total_amount, transaction_id, invoice_id, transaction_details, payment_status, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: payment_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_report (id, transaction_id, payment_status, user_id, ref_id, amount, method_type, vat, wallet_amount_used, created_at, updated_at, payment_response) FROM stdin;
\.


--
-- Data for Name: payment_temp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_temp (id, amount, payment_ref, payment_id, details_id, user_id, created_at, updated_at, payment_mode) FROM stdin;
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, created_at, updated_at) FROM stdin;
1	App\\Models\\User	5	Personal Access Token	9d2fa0f6ad4a5aeb21d95c1d1f5d0867823550346c4ac59f7296da8a49c324c0	["*"]	\N	2024-05-18 08:11:01	2024-05-18 08:11:01
2	App\\Models\\User	8	Personal Access Token	11fc9fba20b9380b7c217cb00dffdbb1992cfdebc8955a5c14b8424b9b022241	["*"]	\N	2024-05-18 08:11:14	2024-05-18 08:11:14
3	App\\Models\\User	8	Personal Access Token	1c0a7e91d45b37cf1f42df022b053ff7b3f14c47ff7a8e7321177c6b3284ce3c	["*"]	\N	2024-05-23 05:38:20	2024-05-23 05:38:20
4	App\\Models\\User	8	Personal Access Token	4dcae31da4a36d5f71aae9ed22ad6d9cfa827c21f0b76a56128f6f516eb9fd7e	["*"]	\N	2024-05-23 13:59:05	2024-05-23 13:59:05
5	App\\Models\\User	8	Personal Access Token	0c895a7788b1a3761b7e564eb8ec396fffb3c14a901864c6968f37925e1cdcdc	["*"]	\N	2024-05-23 19:53:49	2024-05-23 19:53:49
6	App\\Models\\User	8	Personal Access Token	ef80c70ac9fe9e50fbd5c9cf30a23beabb3fac193f91f3da9d266369312a1116	["*"]	\N	2024-05-23 20:33:51	2024-05-23 20:33:51
7	App\\Models\\User	8	Personal Access Token	def818d30a0fa02b964006ec48884b818b4461388ece69d459cb85d42c8fb81f	["*"]	\N	2024-05-27 05:12:17	2024-05-27 05:12:17
8	App\\Models\\User	8	Personal Access Token	aa4100a97bc2fe6629938734fc7d5fb62f0414551685bca273c2d959fe9eab89	["*"]	\N	2024-05-27 07:43:17	2024-05-27 07:43:17
9	App\\Models\\User	8	Personal Access Token	1e8639203359888709e0cf99b079afe98c1fbfad8ca76d7d1122278af382f899	["*"]	\N	2024-05-28 06:07:54	2024-05-28 06:07:54
10	App\\Models\\User	8	Personal Access Token	0c0965f18055d88e9e88b004ad8e98a19b14f7d3d75b2d9cec75cd3ec4ccb437	["*"]	\N	2024-05-28 11:09:59	2024-05-28 11:09:59
11	App\\Models\\User	8	Personal Access Token	0d06fd4a1487df4eb881ea0bc0dad4283eb2c61c3f2b4648b2537bfcefb1c49a	["*"]	\N	2024-05-28 11:55:39	2024-05-28 11:55:39
12	App\\Models\\User	8	Personal Access Token	68ac00ea06d86a3c8a420d0423740056db1c496d863d7bfc14bb593e304bcde3	["*"]	\N	2024-05-28 14:32:13	2024-05-28 14:32:13
13	App\\Models\\User	8	Personal Access Token	3e7de718bece0146d91a2a896aaca418c53d17011ffeb6e8e3638f3048c1132f	["*"]	\N	2024-05-28 15:30:06	2024-05-28 15:30:06
14	App\\Models\\User	8	Personal Access Token	ff1a2780ffbb21ac1a75325e72ceb45ce7e1eb002170a527bf8ab04885fad720	["*"]	\N	2024-05-28 17:22:18	2024-05-28 17:22:18
15	App\\Models\\User	8	Personal Access Token	2a2caa13662988835dc1e27f7ef466ee853c4ca5288ee60116c8f41b8dfa5c98	["*"]	\N	2024-05-29 08:42:28	2024-05-29 08:42:28
16	App\\Models\\User	8	Personal Access Token	25ad2303425ad6df568fa930e9caf1840e9d15aacc0c95d99453841706db640f	["*"]	\N	2024-05-29 08:43:23	2024-05-29 08:43:23
17	App\\Models\\User	8	Personal Access Token	34d67fa34bd92e1f5ef379eca6591a7fa78b15f6f9f9944700d5e359859f578f	["*"]	\N	2024-05-29 08:44:29	2024-05-29 08:44:29
18	App\\Models\\User	9	Personal Access Token	f3ec129e185f063919077f67df038d7aa52fd3798cd840493df8d981ec9c983f	["*"]	\N	2024-05-29 08:46:04	2024-05-29 08:46:04
19	App\\Models\\User	8	Personal Access Token	6b46d4a761eef308468e2d917bab9abfd0c0cd0abe624c272aa9e1635a62d4d3	["*"]	\N	2024-05-29 09:00:44	2024-05-29 09:00:44
20	App\\Models\\User	9	Personal Access Token	806ae42c26b1d20d6d8674e68b0594846a58e71dab6e2937d5ec30c78474f7f9	["*"]	\N	2024-05-29 10:08:29	2024-05-29 10:08:29
21	App\\Models\\User	10	Personal Access Token	f6bd9df84263ac81f2d44b97af6781fac91589b0d02b415db78e174b2a151c3a	["*"]	\N	2024-05-29 10:41:40	2024-05-29 10:41:40
22	App\\Models\\User	9	Personal Access Token	bb82792804d602aa0df49d8b113c2ca6dc7ffd30aab5d84eef3a495d8e819597	["*"]	\N	2024-05-29 12:07:06	2024-05-29 12:07:06
23	App\\Models\\User	10	Personal Access Token	2479142f5d90cf3b833bc091f9d265fee8d8f24acf93f76160b771db398454f8	["*"]	\N	2024-05-29 12:40:09	2024-05-29 12:40:09
24	App\\Models\\User	10	Personal Access Token	3bac7df1ef9b5d449215a143a891bde75af8b630b6926005123b818c79512f75	["*"]	\N	2024-05-29 12:47:55	2024-05-29 12:47:55
25	App\\Models\\User	10	Personal Access Token	3de8af056ea923ddf3d76c94c9dcd89a238951a5c7d9a12ca68313358e111cc0	["*"]	\N	2024-05-29 14:33:19	2024-05-29 14:33:19
26	App\\Models\\User	8	Personal Access Token	74526f3d109e932f3765ffc5e26f13c8de913c3541c00edd962aa40b922d601c	["*"]	\N	2024-05-29 17:04:51	2024-05-29 17:04:51
27	App\\Models\\User	8	Personal Access Token	d76ecd3c6288a577d97c6c12de8744c1f9419e48e8cfd39f1ae2640acc020ea4	["*"]	\N	2024-05-29 17:36:43	2024-05-29 17:36:43
28	App\\Models\\User	10	Personal Access Token	4bb7a6241e29e5832f2b9eb9772797792a730e6e0ef00dffb7f48d5d0f332d07	["*"]	\N	2024-05-29 18:36:50	2024-05-29 18:36:50
29	App\\Models\\User	8	Personal Access Token	1598af5b27c3f347b6cba69016d664d5785482701686cece79faffed1719064c	["*"]	\N	2024-05-29 18:40:13	2024-05-29 18:40:13
30	App\\Models\\User	9	Personal Access Token	9095bf6a61f0bba56b29bdc89064c2a3d8fbe2654b008e4e58416d22236ea188	["*"]	\N	2024-05-29 20:18:19	2024-05-29 20:18:19
31	App\\Models\\User	8	Personal Access Token	1573a0300cf747f4d76a15c87c76534f57209e503818ae95902e00f4eeadcd28	["*"]	\N	2024-05-29 23:34:36	2024-05-29 23:34:36
32	App\\Models\\User	9	Personal Access Token	c34d594f5d48489e2556a60adae863e5160f9b54e7698358fdd31ef17e2ef37d	["*"]	\N	2024-05-30 03:26:35	2024-05-30 03:26:35
33	App\\Models\\User	9	Personal Access Token	deea68df95d2a3886618b7a24deabe8680cdc4f8a60ecd4669097f570a51150a	["*"]	\N	2024-05-30 03:27:11	2024-05-30 03:27:11
34	App\\Models\\User	8	Personal Access Token	55b9297d77df471fa4637eddbb3b421b1e0c7f480962a0ea25755529ca7166ba	["*"]	\N	2024-05-30 03:59:49	2024-05-30 03:59:49
35	App\\Models\\User	8	Personal Access Token	c80bae3a151daadc7c3cd686da83a4cb7119b138ae041b4269f5e1018a2d460b	["*"]	\N	2024-05-30 04:05:44	2024-05-30 04:05:44
36	App\\Models\\User	8	Personal Access Token	13f1a4fab18c7cb3f95b047fdfd7d0a996b05a9a2ac9eed74bff57fa963dc275	["*"]	\N	2024-05-30 04:31:39	2024-05-30 04:31:39
37	App\\Models\\User	9	Personal Access Token	b89b13a31553ae8268bbb12026c8eeb7a9002a65b076aa7925f2392f0b537b40	["*"]	\N	2024-05-30 07:41:20	2024-05-30 07:41:20
38	App\\Models\\User	8	Personal Access Token	c3644b713a04018d72e3c2dd44c044c5c2ad1953978616db476125df473784a4	["*"]	\N	2024-05-30 08:18:13	2024-05-30 08:18:13
39	App\\Models\\User	10	Personal Access Token	20b15c9a018059edaf95e366b0083111c383f47cc3bb8d80e3971a52529b1264	["*"]	\N	2024-05-30 08:30:46	2024-05-30 08:30:46
\.


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.photos (id, vendor_id, image, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: playtime_staffs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playtime_staffs (id, name, sunday, sun_from, sun_to, monday, mon_from, mon_to, tuesday, tues_from, tues_to, wednesday, wed_from, wed_to, thursday, thurs_from, thurs_to, friday, fri_from, fri_to, saturday, sat_from, sat_to, image, vendor, active, deleted, created_at, updated_at) FROM stdin;
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

COPY public.product (id, product_type, product_desc_full, product_desc_short, product_sale_from, product_sale_to, product_featured_image, product_tag, product_created_by, product_updated_by, product_status, product_deleted, product_name, product_variation_type, product_taxable, product_vender_id, product_image, product_unique_iden, product_brand_id, product_name_arabic, product_desc_full_arabic, product_desc_short_arabic, cash_points, offer_enabled, deal_enabled, is_today_offer, today_offer_date, thanku_perc, custom_status, meta_title, meta_keyword, meta_description, product_vendor_status, product_gender, is_kandora, collection_id, hot_offer_enabled, trending_enabled, offers_list, zero_quantity_orders, product_code, product_tags, sort_order, offer_for_short, hot_offer_sort_order, new_trending_sort_order, author_id, deleted, default_category_id, default_attribute_id, created_at, updated_at, store_id, moda_main_category, moda_sub_category, brand, ret_applicable, ret_policy_days, ret_policy, account_id, activity_id, is_featured, division) FROM stdin;
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

COPY public.product_selected_attribute_list (product_attribute_id, product_id, manage_stock, stock_quantity, allow_back_order, stock_status, sold_individually, weight, length, height, width, shipping_class, sale_price, regular_price, taxable, image, shipping_note, title, rating, rated_users, image_temp, barcode, image_action, pr_code, product_desc, product_full_descr, size_chart, material, product_details, needtoknow) FROM stdin;
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
-- Data for Name: project_purpose; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project_purpose (id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.properties (id, logo, property_name, property_type, description, customer_message, country, timezone, phone, capacity, tax_price, all_week_price, weekday_price, friday_price, weekend_price, carwash_price, fuel_price, created_at, updated_at, deleted, active, latitude, longitude, dial_code, tasree_commission_percentage, supervisor_id) FROM stdin;
3	1715870482_WhatsApp Image 2024-05-16 at 6.53.14 PM.jpeg	Burj Al Arab	Shopping Mall	<p>Burj Al Arab</p>	Burj Al Arab	United Arab Emirates	GMT+3	1234567889	12	21.00	22.00	22.00	20.00	22.00	22.00	22.00	\N	\N	0	1	\N	\N	971	2.00	2
1	1715870432_WhatsApp Image 2024-05-16 at 6.53.14 PM.jpeg	Burj Khilafa	Resturant	<p>test</p>	test	United Arab Emirates	GMT+4	231312312322	22	12.00	12.00	12.00	12.00	12.00	12.00	12.00	\N	\N	0	1	\N	\N	971	1.00	2
2	1715870465_WhatsApp Image 2024-05-16 at 6.53.14 PM.jpeg	Al Mnara Tower	Shopping Mall	<p>Al Manara Tower has been considered as one of the Grade A Commercial Building completed in 2011. It was designed exclusively to reflect both the style and functionality as well as to feature a fully serviced business center, conference, auditorium facility, a leisure deck.</p>\r\n<p>It is primarily located within the so-called metropolis of Dubai wherein a number of office buildings, commercial and residential blocks set under the acres of landscaped gardens interspersed with fascinating roads, walkways, and historical creek. It is just next to Churchill Towers in Business Bay.</p>\r\n<p>As corporate owners, you will benefit the car parking with business facilities planned within the complex so as to enhance your corporate efficiency in particular.</p>	\N	United Arab Emirates	GMT+4	3563636336	67	5.00	67.00	67.00	7.00	8.00	78.00	67.00	\N	\N	0	1	\N	\N	971	2.00	2
\.


--
-- Data for Name: property_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.property_types (id, name, active, deleted, created_at, updated_at) FROM stdin;
1	Resturant	t	f	2024-05-02 14:40:15	\N
2	Club	t	f	2024-05-02 14:42:21	2024-05-03 04:36:27
3	Shopping Mall	t	f	2024-05-03 04:36:52	\N
\.


--
-- Data for Name: public_business_infos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.public_business_infos (id, title, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question (id, question, active, question_for, answer_type, created_at, updated_at, sort_order, placeholder) FROM stdin;
\.


--
-- Data for Name: question_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question_options (id, question, options, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: quotation_request_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quotation_request_history (id, inspection_request_id, status, date, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings (id, type, user_id, product_id, product_varient_id, service_id, vendor_id, rating, title, comment, order_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room (id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: room_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room_types (id, name, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: service_foods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_foods (id, service_id, food_id) FROM stdin;
\.


--
-- Data for Name: service_pets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_pets (id, service_id, pet_id) FROM stdin;
\.


--
-- Data for Name: service_quotes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_quotes (id, service_id, user_id, pet_id, doctor_id, groomer_id, appointment_type, "time", date, drop_off_time, drop_off_date, pick_up_time, pick_up_date, feeding_schedule, food, specific_medication, notes, status, deleted, created_at, updated_at, quote_price, reject_reason, playtime_staff_id, medicine_instructions, food_id, grooming_service, quote_document, payment_ref_id, payment_mode, time_slot, room_id, seats, paid_price, total, vat, discount, grand_total) FROM stdin;
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

COPY public.service_requests (id, user_id, store_id, description, status, is_completed, accept_note, amount, service_charges, tax, total_amount, address, latitude, longitude, payment_method, payment_status, created_at, updated_at, service_date, service_time, location_name, service_invoice_id) FROM stdin;
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, name, image, active, deleted, created_at, updated_at, background_image, slug, sort_order) FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, admin_commission, shipping_charge, created_at, updated_at, tax_percentage, moda_commission, inspection_charge) FROM stdin;
1	0	0	\N	\N	0	0	\N
\.


--
-- Data for Name: skin_colors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skin_colors (id, name, color, active, deleted, created_at, updated_at) FROM stdin;
1	Black	#000000	1	0	2024-05-17 13:01:35	2024-05-17 13:01:35
\.


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.species (id, name, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: square_footage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.square_footage (id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.states (id, name, active, country_id, created_uid, updated_uid, deleted, created_at, updated_at) FROM stdin;
1	Dubai	1	1	1	1	0	2024-05-02 14:36:28	2024-05-03 04:34:30
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

COPY public.temp_order_products (id, order_id, product_id, product_attribute_id, product_type, quantity, price, discount, total, vendor_id, admin_commission, vendor_commission, shipping_charge, grand_total, admin_commission_percentage) FROM stdin;
\.


--
-- Data for Name: temp_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_orders (id, invoice_id, user_id, address_id, total, vat, discount, grand_total, payment_mode, admin_commission, vendor_commission, shipping_charge, temp_id, coupon_code, coupon_id, store_id, request_deligate) FROM stdin;
\.


--
-- Data for Name: temp_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_users (id, name, email, dial_code, phone, phone_verified, active, email_verified, password, email_verified_at, role, first_name, last_name, user_image, user_phone_otp, user_email_otp, user_device_token, user_device_type, user_access_token, firebase_user_key, device_cart_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: time_slote; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.time_slote (id, user_id, time_slote_start, time_slote_end, created_at, updated_at, time_slote_master, day) FROM stdin;
\.


--
-- Data for Name: time_slote_master; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.time_slote_master (id, time_slote) FROM stdin;
1	12:00 AM - 01:00 AM
2	01:00 AM - 02:00 AM
3	02:00 AM - 03:00 AM
4	03:00 AM - 04:00 AM
5	04:00 AM - 05:00 AM
6	05:00 AM - 06:00 AM
7	06:00 AM - 07:00 AM
8	07:00 AM - 08:00 AM
9	08:00 AM - 09:00 AM
10	09:00 AM - 10:00 AM
11	10:00 AM - 11:00 AM
12	11:00 AM - 12:00 PM
13	12:00 PM - 01:00 PM
14	01:00 PM - 02:00 PM
15	02:00 PM - 03:00 PM
16	03:00 PM - 04:00 PM
17	04:00 PM - 05:00 PM
18	05:00 PM - 06:00 PM
19	06:00 PM - 07:00 PM
20	07:00 PM - 08:00 PM
21	08:00 PM - 09:00 PM
22	09:00 PM - 10:00 PM
23	10:00 PM - 11:00 PM
24	11:00 PM - 12:00 AM
\.


--
-- Data for Name: time_zones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.time_zones (id, name, "offset", active, deleted, created_at, updated_at) FROM stdin;
1	United Arab Emirates	GMT+4	t	f	2024-05-02 14:37:24	\N
2	Saudi Arabia	GMT+3	t	f	2024-05-05 17:26:12	\N
\.


--
-- Data for Name: type_of_property; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_of_property (id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_address (id, user_id, street, location, country_id, state_id, city_id, address_type, status, is_default, created_at, updated_at, land_mark, building_name, latitude, longitude, apartment, full_name, dial_code, phone) FROM stdin;
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
1	0	2	{"dashboard":{"View":"1","Create":"1"}}	1	2024-05-03 22:27:08	2024-05-03 22:27:08
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

COPY public.users (id, name, email, dial_code, phone, phone_verified, password, email_verified_at, role, first_name, last_name, user_image, user_phone_otp, user_device_token, user_device_type, user_access_token, firebase_user_key, remember_token, created_at, updated_at, country_id, state_id, city_id, area, active, deleted, display_name, business_name, email_verified, user_email_otp, dob, vendor, store, previllege, about_me, verified, designation_id, is_private_profile, user_name, gender, website, wallet_amount, password_reset_code, password_reset_time, password_reset_otp, privacy_id, send_notification, mute_message, commission, public_business_info, facebook_url, instagram_url, linkedin_url, is_social, twitter_url, tiktok_url, user_type_id, activity_type_id, commercial_license, commercial_reg_no, associated_license, res_dial_code, res_phone, address, business_type_id, admin_commission_perc, residence_no, nationality, rating, rated_users, banner_image, hide_profile, temp_dial_code, temp_mobile, specialization, user_type, property_id, supervisor_id) FROM stdin;
1	Admin	admin@admin.com	971	112233445566778899	0	$2y$10$4CKClSnfh0w959jNrsJyl.8/oowWbizHIg4FrOlXxfgtYYBU6Y6jK	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N
6	Abraham Milani	abrahan@lacrowns.com	971	508661133	0	$2y$10$MdMH7ErHW7T/q6ZDdSZSLeaGYYutHa3E033jQfGbJstZXhD452nzq	\N	2	\N	\N	1715751101_76435903-9cb5-41b9-b39b-4e6e7d90dcfd.jpg	\N	\N	\N	\N	\N	\N	2024-05-15 05:31:41	2024-05-16 13:09:37	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	Abraham Milani	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	staff	2	2
10	Hamid Empty	razahamd34@gmail.com	971	3441562557	1	$2y$10$B5rKpm0jI00WLZgT2YJNBeWIJH3hiJsdJvNcUZmfoKL5JZ69xFa/6	\N	2	\N	\N	1716979285_images.jpeg	\N	cq8cecCDR-Ozu7JDD9qzb6:APA91bGNc2WG_2Qn7e29KiiFjh0UUmU0EcJri2f0wfBgkO6rjztv_vgU2ADboWnZFd1Nh0p19qd8eXWLsyXSb9kULcoFEYoLJZxUsw3cMbHRmaGvS7wucDrwv8i7QU4wfahHGgqnap1E	\N	20b15c9a018059edaf95e366b0083111c383f47cc3bb8d80e3971a52529b1264	-Nz2wEWkabmSDcD_t_0J	\N	2024-05-29 10:41:25	2024-05-30 08:30:46	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	Empty	1	\N	0		2024-05-29 21:00:31	0	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	staff	2	\N
3	vekyqopus	huhyqoxaho@mailinator.com	\N	Welch	0	$2y$10$V7uEPOLWVAjkT1UU3hUPveQmgquzXmLlb3Du6Xwl4mNVbHdkRPzAW	\N	1	Kareem	Welch	\N	\N	\N	\N	\N	\N	\N	2024-05-04 12:19:52	\N	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	0	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N
9	Ajesh DxB	ajesh@mailinator.com	971	3441562555	1	$2y$10$YZSiGgvgJ7TihdGxQyYjZuxLUNPJCrigsREJneHX5awQY6qqKLHPe	\N	2	\N	\N	1716972353_images.jpeg	\N	eH_8kyXPRYSCVgfBMCNg8k:APA91bG3DNXklVxSwwge4qGDKmze2AL5FMt7f0sFxZdgSaVNy4JBAySuTLp5vN5krz5DIkjIQHTq1IYa1-cbg3t7Uz-_H9R2ErNglmOUPv7gh_GTNTzRVLhBdOUdLcEIBQitD8jFhMzw	\N	b89b13a31553ae8268bbb12026c8eeb7a9002a65b076aa7925f2392f0b537b40	-Nz2odTiQyFIVXLQABhP	\N	2024-05-29 08:45:53	2024-05-30 07:41:20	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	Ajesh	1	\N	0	d5cf335fcb8ad2e83e04f3b700a744838ca879f67a30b9a247197eb3e8f83e0c	2024-05-29 13:26:33	1111	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	staff	3	\N
5	ahmaddxba	ahmaddxba@gmail.com	971	0987654321	1	$2y$10$NfiBneVkcCGCeX/02JVw9.8mjOrnhrnKtX1bLS8WA1DQTtwAfsxKe	\N	2	\N	\N	1715637292_place_holder.jpg	\N	111	\N	9d2fa0f6ad4a5aeb21d95c1d1f5d0867823550346c4ac59f7296da8a49c324c0	-Ny9kG_P6n4lDrHnNhNI	\N	2024-05-13 21:54:52	2024-05-18 08:11:01	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	ahmaddxba	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	staff	2	\N
8	Hamid	razahamid34@gmail.com	971	3441562554	1	$2y$10$nwidTnmQ83Tz8F8kd5mBaOBJslmluXpnF4BlizqawAgrU.DQnrLJC	\N	2	\N	\N	1716019843_app_icon_png.png	\N	111	\N	c3644b713a04018d72e3c2dd44c044c5c2ad1953978616db476125df473784a4	-Ny9kJjd1FFy1CgAcp2Q	\N	2024-05-18 08:10:43	2024-05-30 08:18:13	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	Hamid	1	\N	0	758eb8c0431cfa44c58a582404f4ce488cdd70d8dd2b0b3803bacbe2333954a5	2024-05-29 08:33:56	1111	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	staff	2	\N
4	Anil	anil@gmail.com	971	4547888999	0	$2y$10$Hm4A0GEX54xiiT5WiIjRYurXQqr9/LBOBFzgq2tXguao2w7eoRWZi	\N	2	\N	\N	1715637223_place_holder.jpg	\N	\N	\N	\N	\N	\N	2024-05-04 12:34:49	2024-05-13 21:53:43	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	Anil	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	staff	2	\N
2	ranadxba	ranadxba@hotmail.com	971	21312312	0	$2y$10$svCI8WksIgBNWuzks.4N3OfP8F/V6Et2qMmqY8lebX4Z0SccDAghi	\N	3	\N	\N	1715637240_place_holder.jpg	\N	\N	\N	\N	\N	\N	2024-05-02 14:38:05	2024-05-16 13:08:36	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	1	\N	0	ranadxba	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	supervisor	1	\N
7	Abraham369	Abraham@lacrowns.com	\N	Milani	0	$2y$10$htYTXvFybqYiNOMpzzCNeOlQpFXQFaPSfJtqrk.nvsb7kvX3O86Pe	\N	1	Abraham	Milani	\N	\N	\N	\N	\N	\N	\N	2024-05-15 05:32:33	\N	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	0	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N
\.


--
-- Data for Name: users_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_role (id, role_name, created_at, updated_at) FROM stdin;
1	admin	2024-05-02 13:56:59	2024-05-02 13:56:59
2	users	2024-05-02 13:56:59	2024-05-02 13:56:59
3	vendors	2024-05-02 13:56:59	2024-05-02 13:56:59
\.


--
-- Data for Name: vehicle_models; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle_models (id, model, manufacturer_id, status, created_at, updated_at) FROM stdin;
1	i8	1	t	2024-05-28 18:19:46	2024-05-28 18:19:46
\.


--
-- Data for Name: vendor_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_details (id, homedelivery, logo, key_control, branches, company_name, company_brand, legal_staus, reg_date, trade_license, trade_license_expiry, vat_reg_number, vat_reg_expiry, address1, address2, street, state, city, area, zip, trade_license_doc, chamber_of_commerce_doc, share_certificate_doc, power_attorny_doc, vat_reg_doc, signed_agreement_doc, identy1_type, identy1_doc, identy2_type, identy2_doc, company_identy1_type, company_identy1_doc, company_identy2_type, company_identy2_doc, created_at, updated_at, industry_type, user_id, store_type, deliverydays) FROM stdin;
\.


--
-- Data for Name: vendor_holiday_dates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_holiday_dates (id, vendor_id, date, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: vendor_service_timings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_service_timings (id, service_id, vendor, sunday, sun_from, sun_to, monday, mon_from, mon_to, tuesday, tues_from, tues_to, wednesday, wed_from, wed_to, thursday, thurs_from, thurs_to, friday, fri_from, fri_to, saturday, sat_from, sat_to, created_at, updated_at) FROM stdin;
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

SELECT pg_catalog.setval('public.admin_designation_id_seq', 1, false);


--
-- Name: amount_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.amount_type_id_seq', 2, true);


--
-- Name: app_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_banners_id_seq', 1, false);


--
-- Name: appointment_times_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointment_times_id_seq', 1, false);


--
-- Name: appointment_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointment_types_id_seq', 1, false);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articles_id_seq', 1, false);


--
-- Name: aspect_of_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aspect_of_room_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.bank_details_id_seq', 1, false);


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
-- Name: breeds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.breeds_id_seq', 1, false);


--
-- Name: car_damages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.car_damages_id_seq', 13, true);


--
-- Name: cars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cars_id_seq', 90, true);


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

SELECT pg_catalog.setval('public.category_id_seq', 1, false);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 1, true);


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
-- Name: current_project_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.current_project_status_id_seq', 1, false);


--
-- Name: db_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.db_notifications_id_seq', 1, false);


--
-- Name: deligates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deligates_id_seq', 1, false);


--
-- Name: designations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.designations_id_seq', 1, false);


--
-- Name: division_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.division_id_seq', 1, false);


--
-- Name: doctor_calender_temps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_calender_temps_id_seq', 1, false);


--
-- Name: doctor_calenders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_calenders_id_seq', 1, false);


--
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctors_id_seq', 1, false);


--
-- Name: doggy_play_time_dates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doggy_play_time_dates_id_seq', 1, false);


--
-- Name: doggy_play_time_temp_bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doggy_play_time_temp_bookings_id_seq', 1, false);


--
-- Name: enquiry_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enquiry_details_id_seq', 1, false);


--
-- Name: enquiry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enquiry_id_seq', 1, false);


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
-- Name: feeding_schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feeding_schedules_id_seq', 1, false);


--
-- Name: food_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_categories_id_seq', 1, false);


--
-- Name: food_category_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_category_products_id_seq', 1, false);


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
-- Name: food_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_products_id_seq', 1, false);


--
-- Name: foods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.foods_id_seq', 1, false);


--
-- Name: groomer_calender_temps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groomer_calender_temps_id_seq', 1, false);


--
-- Name: groomer_calenders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groomer_calenders_id_seq', 1, false);


--
-- Name: groomers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groomers_id_seq', 1, false);


--
-- Name: grooming_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grooming_types_id_seq', 1, false);


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
-- Name: inspection_request_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inspection_request_history_id_seq', 1, false);


--
-- Name: inspection_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inspection_request_id_seq', 1, false);


--
-- Name: insurance_providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insurance_providers_id_seq', 1, false);


--
-- Name: manufacturers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.manufacturers_id_seq', 1, true);


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

SELECT pg_catalog.setval('public.migrations_id_seq', 349, true);


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
-- Name: my_pets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.my_pets_id_seq', 1, false);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 6, true);


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
-- Name: payment_init_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_init_id_seq', 1, false);


--
-- Name: payment_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_report_id_seq', 1, false);


--
-- Name: payment_temp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_temp_id_seq', 1, false);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 39, true);


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.photos_id_seq', 1, false);


--
-- Name: playtime_staffs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.playtime_staffs_id_seq', 1, false);


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
-- Name: project_purpose_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.project_purpose_id_seq', 1, false);


--
-- Name: properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.properties_id_seq', 3, true);


--
-- Name: property_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.property_types_id_seq', 3, true);


--
-- Name: public_business_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.public_business_infos_id_seq', 1, false);


--
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_id_seq', 1, false);


--
-- Name: question_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_options_id_seq', 1, false);


--
-- Name: quotation_request_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quotation_request_history_id_seq', 1, false);


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ratings_id_seq', 1, false);


--
-- Name: room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.room_id_seq', 1, false);


--
-- Name: room_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.room_types_id_seq', 1, false);


--
-- Name: service_foods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_foods_id_seq', 1, false);


--
-- Name: service_pets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_pets_id_seq', 1, false);


--
-- Name: service_quotes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_quotes_id_seq', 1, false);


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
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_seq', 1, false);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);


--
-- Name: skin_colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skin_colors_id_seq', 1, true);


--
-- Name: species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.species_id_seq', 1, false);


--
-- Name: square_footage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.square_footage_id_seq', 1, false);


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
-- Name: temp_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_users_id_seq', 1, false);


--
-- Name: time_slote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.time_slote_id_seq', 1, false);


--
-- Name: time_slote_master_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.time_slote_master_id_seq', 24, true);


--
-- Name: time_zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.time_zones_id_seq', 2, true);


--
-- Name: type_of_property_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_of_property_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.user_privileges_id_seq', 1, true);


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

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: users_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_role_id_seq', 3, true);


--
-- Name: vehicle_models_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_models_id_seq', 1, true);


--
-- Name: vendor_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_details_id_seq', 1, false);


--
-- Name: vendor_holiday_dates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_holiday_dates_id_seq', 1, false);


--
-- Name: vendor_service_timings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_service_timings_id_seq', 1, false);


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
-- Name: appointment_times appointment_times_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment_times
    ADD CONSTRAINT appointment_times_pkey PRIMARY KEY (id);


--
-- Name: appointment_types appointment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment_types
    ADD CONSTRAINT appointment_types_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: aspect_of_room aspect_of_room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aspect_of_room
    ADD CONSTRAINT aspect_of_room_pkey PRIMARY KEY (id);


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
-- Name: breeds breeds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.breeds
    ADD CONSTRAINT breeds_pkey PRIMARY KEY (id);


--
-- Name: car_damages car_damages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_damages
    ADD CONSTRAINT car_damages_pkey PRIMARY KEY (id);


--
-- Name: cars cars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);


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
-- Name: current_project_status current_project_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_project_status
    ADD CONSTRAINT current_project_status_pkey PRIMARY KEY (id);


--
-- Name: db_notifications db_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.db_notifications
    ADD CONSTRAINT db_notifications_pkey PRIMARY KEY (id);


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
-- Name: division division_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.division
    ADD CONSTRAINT division_pkey PRIMARY KEY (id);


--
-- Name: doctor_calender_temps doctor_calender_temps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_calender_temps
    ADD CONSTRAINT doctor_calender_temps_pkey PRIMARY KEY (id);


--
-- Name: doctor_calenders doctor_calenders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_calenders
    ADD CONSTRAINT doctor_calenders_pkey PRIMARY KEY (id);


--
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- Name: doggy_play_time_dates doggy_play_time_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doggy_play_time_dates
    ADD CONSTRAINT doggy_play_time_dates_pkey PRIMARY KEY (id);


--
-- Name: doggy_play_time_temp_bookings doggy_play_time_temp_bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doggy_play_time_temp_bookings
    ADD CONSTRAINT doggy_play_time_temp_bookings_pkey PRIMARY KEY (id);


--
-- Name: enquiry_details enquiry_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enquiry_details
    ADD CONSTRAINT enquiry_details_pkey PRIMARY KEY (id);


--
-- Name: enquiry enquiry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enquiry
    ADD CONSTRAINT enquiry_pkey PRIMARY KEY (id);


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
-- Name: feeding_schedules feeding_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feeding_schedules
    ADD CONSTRAINT feeding_schedules_pkey PRIMARY KEY (id);


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
-- Name: food_products food_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_products
    ADD CONSTRAINT food_products_pkey PRIMARY KEY (id);


--
-- Name: foods foods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foods
    ADD CONSTRAINT foods_pkey PRIMARY KEY (id);


--
-- Name: groomer_calender_temps groomer_calender_temps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groomer_calender_temps
    ADD CONSTRAINT groomer_calender_temps_pkey PRIMARY KEY (id);


--
-- Name: groomer_calenders groomer_calenders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groomer_calenders
    ADD CONSTRAINT groomer_calenders_pkey PRIMARY KEY (id);


--
-- Name: groomers groomers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groomers
    ADD CONSTRAINT groomers_pkey PRIMARY KEY (id);


--
-- Name: grooming_types grooming_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grooming_types
    ADD CONSTRAINT grooming_types_pkey PRIMARY KEY (id);


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
-- Name: inspection_request_history inspection_request_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inspection_request_history
    ADD CONSTRAINT inspection_request_history_pkey PRIMARY KEY (id);


--
-- Name: inspection_request inspection_request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inspection_request
    ADD CONSTRAINT inspection_request_pkey PRIMARY KEY (id);


--
-- Name: insurance_providers insurance_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurance_providers
    ADD CONSTRAINT insurance_providers_pkey PRIMARY KEY (id);


--
-- Name: manufacturers manufacturers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT manufacturers_pkey PRIMARY KEY (id);


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
-- Name: my_pets my_pets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.my_pets
    ADD CONSTRAINT my_pets_pkey PRIMARY KEY (id);


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
-- Name: payment_init payment_init_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_init
    ADD CONSTRAINT payment_init_pkey PRIMARY KEY (id);


--
-- Name: payment_report payment_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_report
    ADD CONSTRAINT payment_report_pkey PRIMARY KEY (id);


--
-- Name: payment_temp payment_temp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_temp
    ADD CONSTRAINT payment_temp_pkey PRIMARY KEY (id);


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
-- Name: playtime_staffs playtime_staffs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playtime_staffs
    ADD CONSTRAINT playtime_staffs_pkey PRIMARY KEY (id);


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
-- Name: project_purpose project_purpose_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_purpose
    ADD CONSTRAINT project_purpose_pkey PRIMARY KEY (id);


--
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: property_types property_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_types
    ADD CONSTRAINT property_types_pkey PRIMARY KEY (id);


--
-- Name: public_business_infos public_business_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.public_business_infos
    ADD CONSTRAINT public_business_infos_pkey PRIMARY KEY (id);


--
-- Name: question_options question_options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_options
    ADD CONSTRAINT question_options_pkey PRIMARY KEY (id);


--
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- Name: quotation_request_history quotation_request_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quotation_request_history
    ADD CONSTRAINT quotation_request_history_pkey PRIMARY KEY (id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- Name: room room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (id);


--
-- Name: room_types room_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_types
    ADD CONSTRAINT room_types_pkey PRIMARY KEY (id);


--
-- Name: service_foods service_foods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_foods
    ADD CONSTRAINT service_foods_pkey PRIMARY KEY (id);


--
-- Name: service_pets service_pets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_pets
    ADD CONSTRAINT service_pets_pkey PRIMARY KEY (id);


--
-- Name: service_quotes service_quotes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_quotes
    ADD CONSTRAINT service_quotes_pkey PRIMARY KEY (id);


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
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


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
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (id);


--
-- Name: square_footage square_footage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.square_footage
    ADD CONSTRAINT square_footage_pkey PRIMARY KEY (id);


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
-- Name: temp_users temp_users_phone_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users
    ADD CONSTRAINT temp_users_phone_unique UNIQUE (phone);


--
-- Name: temp_users temp_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users
    ADD CONSTRAINT temp_users_pkey PRIMARY KEY (id);


--
-- Name: time_slote_master time_slote_master_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slote_master
    ADD CONSTRAINT time_slote_master_pkey PRIMARY KEY (id);


--
-- Name: time_slote time_slote_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slote
    ADD CONSTRAINT time_slote_pkey PRIMARY KEY (id);


--
-- Name: time_zones time_zones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_zones
    ADD CONSTRAINT time_zones_pkey PRIMARY KEY (id);


--
-- Name: type_of_property type_of_property_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_of_property
    ADD CONSTRAINT type_of_property_pkey PRIMARY KEY (id);


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
-- Name: vehicle_models vehicle_models_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_models
    ADD CONSTRAINT vehicle_models_pkey PRIMARY KEY (id);


--
-- Name: vendor_details vendor_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_details
    ADD CONSTRAINT vendor_details_pkey PRIMARY KEY (id);


--
-- Name: vendor_holiday_dates vendor_holiday_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_holiday_dates
    ADD CONSTRAINT vendor_holiday_dates_pkey PRIMARY KEY (id);


--
-- Name: vendor_service_timings vendor_service_timings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_service_timings
    ADD CONSTRAINT vendor_service_timings_pkey PRIMARY KEY (id);


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
-- Name: cars cars_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


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
-- Name: vehicle_models vehicle_models_manufacturer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_models
    ADD CONSTRAINT vehicle_models_manufacturer_id_foreign FOREIGN KEY (manufacturer_id) REFERENCES public.manufacturers(id) ON DELETE CASCADE;


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

