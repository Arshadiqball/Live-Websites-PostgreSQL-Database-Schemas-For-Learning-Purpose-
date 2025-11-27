--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-2.pgdg20.04+1)
-- Dumped by pg_dump version 15.13 (Ubuntu 15.13-1.pgdg20.04+1)

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
-- Name: booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    service_id bigint NOT NULL,
    price numeric(10,2) NOT NULL,
    booking_date date NOT NULL,
    time_slot character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    ninja_id bigint,
    model_id bigint,
    service_category_id bigint,
    location character varying(255),
    latitude double precision,
    longitude double precision,
    location1 character varying(255),
    latitude1 numeric(10,8),
    longitude1 numeric(11,8),
    vehicle_id bigint,
    booking_id character varying(600),
    service_price double precision DEFAULT '0'::double precision NOT NULL,
    tax double precision DEFAULT '0'::double precision NOT NULL,
    grand_total double precision DEFAULT '0'::double precision NOT NULL,
    brand bigint DEFAULT '0'::bigint NOT NULL,
    sidebar character varying(255) DEFAULT ''::character varying NOT NULL,
    front_glass character varying(255) DEFAULT ''::character varying NOT NULL,
    already_tinted character varying(255) DEFAULT ''::character varying NOT NULL,
    tinting_level integer DEFAULT 0 NOT NULL,
    image character varying(600),
    payment_type integer DEFAULT 0 NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    hours character varying(600),
    starting_image character varying(600),
    completed_image character varying(600),
    start_time timestamp(0) without time zone,
    completed_time timestamp(0) without time zone,
    description character varying(600),
    recovery_type integer DEFAULT 0 NOT NULL,
    tax_per double precision DEFAULT '0'::double precision NOT NULL
);


ALTER TABLE public.booking OWNER TO postgres;

--
-- Name: booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_id_seq OWNER TO postgres;

--
-- Name: booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_id_seq OWNED BY public.booking.id;


--
-- Name: booking_rejected; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_rejected (
    id bigint NOT NULL,
    booking_id integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.booking_rejected OWNER TO postgres;

--
-- Name: booking_rejected_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_rejected_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_rejected_id_seq OWNER TO postgres;

--
-- Name: booking_rejected_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_rejected_id_seq OWNED BY public.booking_rejected.id;


--
-- Name: booking_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_service (
    id bigint NOT NULL,
    service_id integer DEFAULT 0 NOT NULL,
    booking_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    price double precision DEFAULT '0'::double precision NOT NULL
);


ALTER TABLE public.booking_service OWNER TO postgres;

--
-- Name: booking_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_service_id_seq OWNER TO postgres;

--
-- Name: booking_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_service_id_seq OWNED BY public.booking_service.id;


--
-- Name: booking_temp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_temp (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    service_id bigint NOT NULL,
    price numeric(10,2) NOT NULL,
    booking_date date NOT NULL,
    time_slot character varying(255) NOT NULL,
    ninja_id bigint,
    model_id bigint,
    service_category_id bigint,
    location character varying(255),
    latitude double precision,
    longitude double precision,
    location1 character varying(255),
    latitude1 numeric(10,8),
    longitude1 numeric(11,8),
    vehicle_id bigint,
    booking_id character varying(600),
    service_price double precision DEFAULT '0'::double precision NOT NULL,
    tax double precision DEFAULT '0'::double precision NOT NULL,
    grand_total double precision DEFAULT '0'::double precision NOT NULL,
    brand bigint DEFAULT '0'::bigint NOT NULL,
    sidebar character varying(255) DEFAULT ''::character varying NOT NULL,
    front_glass character varying(255) DEFAULT ''::character varying NOT NULL,
    already_tinted character varying(255) DEFAULT ''::character varying NOT NULL,
    tinting_level integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    image character varying(600),
    payment_type integer DEFAULT 0 NOT NULL,
    hours character varying(600),
    description character varying(600),
    recovery_type integer DEFAULT 0 NOT NULL,
    vehicle_list character varying(600),
    service_list character varying(600),
    tax_per double precision DEFAULT '0'::double precision NOT NULL
);


ALTER TABLE public.booking_temp OWNER TO postgres;

--
-- Name: booking_temp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_temp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_temp_id_seq OWNER TO postgres;

--
-- Name: booking_temp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_temp_id_seq OWNED BY public.booking_temp.id;


--
-- Name: booking_vehicle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_vehicle (
    id bigint NOT NULL,
    vehicle_id integer DEFAULT 0 NOT NULL,
    booking_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.booking_vehicle OWNER TO postgres;

--
-- Name: booking_vehicle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_vehicle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_vehicle_id_seq OWNER TO postgres;

--
-- Name: booking_vehicle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_vehicle_id_seq OWNED BY public.booking_vehicle.id;


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
-- Name: card_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.card_details (
    id bigint NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    card_number character varying(600),
    name character varying(600),
    expiry character varying(600),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    "default" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.card_details OWNER TO postgres;

--
-- Name: card_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.card_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.card_details_id_seq OWNER TO postgres;

--
-- Name: card_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.card_details_id_seq OWNED BY public.card_details.id;


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
    service_id bigint,
    item_type bigint,
    price text,
    car_id bigint,
    time_slot text,
    booking_date text,
    service_booking_type text,
    address_id bigint
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
    division_id integer DEFAULT 0 NOT NULL,
    service_charge numeric(10,2),
    description text,
    category_unique_id text
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
    updated_at timestamp(0) without time zone,
    available_time character varying(600)
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
-- Name: maid_pricing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maid_pricing (
    id bigint NOT NULL,
    hour character varying(600),
    price double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.maid_pricing OWNER TO postgres;

--
-- Name: maid_pricing_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maid_pricing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maid_pricing_id_seq OWNER TO postgres;

--
-- Name: maid_pricing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maid_pricing_id_seq OWNED BY public.maid_pricing.id;


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
-- Name: membership_payment_reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.membership_payment_reports (
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


ALTER TABLE public.membership_payment_reports OWNER TO postgres;

--
-- Name: membership_payment_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.membership_payment_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.membership_payment_reports_id_seq OWNER TO postgres;

--
-- Name: membership_payment_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.membership_payment_reports_id_seq OWNED BY public.membership_payment_reports.id;


--
-- Name: memberships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.memberships (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    sort_order integer,
    price numeric(8,2),
    image character varying(255),
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    body_wash_times integer DEFAULT 0 NOT NULL,
    super_cleanline_shine_times integer DEFAULT 0 NOT NULL,
    interior_cleaning_times integer DEFAULT 0 NOT NULL,
    vip_member text,
    preferred_ninja_id text,
    recuring_schedule text,
    additional_benefits text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    package_validity text,
    duration character varying(255) DEFAULT '1'::character varying NOT NULL
);


ALTER TABLE public.memberships OWNER TO postgres;

--
-- Name: memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.memberships_id_seq OWNER TO postgres;

--
-- Name: memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.memberships_id_seq OWNED BY public.memberships.id;


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
-- Name: mute_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mute_order (
    id bigint NOT NULL,
    booking_id integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.mute_order OWNER TO postgres;

--
-- Name: mute_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mute_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mute_order_id_seq OWNER TO postgres;

--
-- Name: mute_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mute_order_id_seq OWNED BY public.mute_order.id;


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
-- Name: ninja_category_selected; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ninja_category_selected (
    id bigint NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.ninja_category_selected OWNER TO postgres;

--
-- Name: ninja_category_selected_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ninja_category_selected_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ninja_category_selected_id_seq OWNER TO postgres;

--
-- Name: ninja_category_selected_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ninja_category_selected_id_seq OWNED BY public.ninja_category_selected.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    description text,
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
    grand_total double precision,
    admin_commission_percentage double precision,
    service_id bigint,
    item_type bigint,
    address_id bigint,
    car_id bigint,
    booking_date text,
    time_slot text,
    service_booking_type bigint,
    user_id bigint
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
    store_rating double precision DEFAULT '0'::double precision NOT NULL
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
-- Name: price_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_list (
    id bigint NOT NULL,
    pricing_id integer DEFAULT 0 NOT NULL,
    vehicle_type integer DEFAULT 0 NOT NULL,
    amount double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.price_list OWNER TO postgres;

--
-- Name: price_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.price_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.price_list_id_seq OWNER TO postgres;

--
-- Name: price_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.price_list_id_seq OWNED BY public.price_list.id;


--
-- Name: pricing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pricing (
    id bigint NOT NULL,
    category_id integer DEFAULT 0 NOT NULL,
    service integer DEFAULT 0 NOT NULL,
    make integer DEFAULT 0 NOT NULL,
    model integer DEFAULT 0 NOT NULL,
    price double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.pricing OWNER TO postgres;

--
-- Name: pricing_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pricing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pricing_id_seq OWNER TO postgres;

--
-- Name: pricing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pricing_id_seq OWNED BY public.pricing.id;


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
    division integer DEFAULT 0 NOT NULL,
    regular_price text,
    stock_quantity text
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
-- Name: product_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_categories (
    id bigint NOT NULL,
    name text,
    image text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.product_categories OWNER TO postgres;

--
-- Name: product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_categories_id_seq OWNER TO postgres;

--
-- Name: product_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_categories_id_seq OWNED BY public.product_categories.id;


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
    product_attribute_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
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
-- Name: recovery_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recovery_types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(255),
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    background_image character varying(255),
    slug character varying(255) NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    price numeric(8,2),
    description text
);


ALTER TABLE public.recovery_types OWNER TO postgres;

--
-- Name: recovery_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recovery_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recovery_types_id_seq OWNER TO postgres;

--
-- Name: recovery_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recovery_types_id_seq OWNED BY public.recovery_types.id;


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
    sort_order integer DEFAULT 0,
    category_id bigint,
    price numeric(8,2),
    description text
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
    inspection_charge integer,
    tinting_charge double precision DEFAULT '0'::double precision NOT NULL
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
-- Name: subscripton_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscripton_services (
    id bigint NOT NULL,
    subscripton_id bigint,
    service_id bigint,
    quantity bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.subscripton_services OWNER TO postgres;

--
-- Name: subscripton_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscripton_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscripton_services_id_seq OWNER TO postgres;

--
-- Name: subscripton_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscripton_services_id_seq OWNED BY public.subscripton_services.id;


--
-- Name: temp_membership_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_membership_services (
    id bigint NOT NULL,
    temp_membership_id bigint NOT NULL,
    service_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    service_unique_id character varying(255),
    image character varying(255),
    price character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.temp_membership_services OWNER TO postgres;

--
-- Name: temp_membership_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_membership_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_membership_services_id_seq OWNER TO postgres;

--
-- Name: temp_membership_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_membership_services_id_seq OWNED BY public.temp_membership_services.id;


--
-- Name: temp_memberships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_memberships (
    id bigint NOT NULL,
    package_id bigint NOT NULL,
    user_id bigint NOT NULL,
    duration character varying(255) NOT NULL,
    payment_method character varying(255) NOT NULL,
    total_price character varying(255) NOT NULL,
    currency character varying(255) NOT NULL,
    discount character varying(255),
    promo_code character varying(255),
    grand_total character varying(255) NOT NULL,
    status character varying(255) DEFAULT 'pending'::character varying NOT NULL,
    transaction_id character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.temp_memberships OWNER TO postgres;

--
-- Name: temp_memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_memberships_id_seq OWNER TO postgres;

--
-- Name: temp_memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_memberships_id_seq OWNED BY public.temp_memberships.id;


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
-- Name: tinting_brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tinting_brands (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    sort_order integer,
    price numeric(8,2),
    image character varying(255),
    background_image character varying(255),
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    front_glass double precision DEFAULT '0'::double precision NOT NULL,
    removal_charge double precision DEFAULT '0'::double precision NOT NULL
);


ALTER TABLE public.tinting_brands OWNER TO postgres;

--
-- Name: tinting_brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tinting_brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tinting_brands_id_seq OWNER TO postgres;

--
-- Name: tinting_brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tinting_brands_id_seq OWNED BY public.tinting_brands.id;


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
    phone character varying(600),
    address_line_1 text,
    building text
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
-- Name: user_membership_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_membership_services (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    user_membership_id bigint NOT NULL,
    service_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    price numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    service_unique_id character varying(255),
    image character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_membership_services OWNER TO postgres;

--
-- Name: user_membership_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_membership_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_membership_services_id_seq OWNER TO postgres;

--
-- Name: user_membership_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_membership_services_id_seq OWNED BY public.user_membership_services.id;


--
-- Name: user_memberships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_memberships (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    duration integer NOT NULL,
    image character varying(255),
    description text,
    plan_id bigint NOT NULL,
    user_id bigint NOT NULL,
    payment_method character varying(255) NOT NULL,
    total_price numeric(10,2) NOT NULL,
    currency character varying(10) NOT NULL,
    discount numeric(10,2),
    promo_code character varying(255),
    price numeric(10,2) NOT NULL,
    payment_id character varying(255),
    expiry_date date NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_memberships OWNER TO postgres;

--
-- Name: user_memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_memberships_id_seq OWNER TO postgres;

--
-- Name: user_memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_memberships_id_seq OWNED BY public.user_memberships.id;


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
    location character varying(600),
    latitude character varying(600),
    longitude character varying(600),
    unique_user_id text,
    proof_id text,
    years_of_experience text
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
    updated_at timestamp(0) without time zone,
    type_id integer DEFAULT 0 NOT NULL
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
-- Name: vehicle_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle_types (
    id bigint NOT NULL,
    model character varying(255) NOT NULL,
    manufacturer_id bigint,
    status boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.vehicle_types OWNER TO postgres;

--
-- Name: COLUMN vehicle_types.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vehicle_types.status IS '0 for inactive,1 for active';


--
-- Name: vehicle_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicle_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicle_types_id_seq OWNER TO postgres;

--
-- Name: vehicle_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicle_types_id_seq OWNED BY public.vehicle_types.id;


--
-- Name: vehicles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicles (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    manufacturer_id bigint NOT NULL,
    model_id bigint NOT NULL,
    country_id bigint NOT NULL,
    city_id bigint NOT NULL,
    year integer NOT NULL,
    chassis_number character varying(255),
    plate_number character varying(255),
    plate_code character varying(255),
    image character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    name character varying(255),
    state_id bigint,
    type_id bigint,
    color_id bigint
);


ALTER TABLE public.vehicles OWNER TO postgres;

--
-- Name: vehicles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicles_id_seq OWNER TO postgres;

--
-- Name: vehicles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicles_id_seq OWNED BY public.vehicles.id;


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
-- Name: booking id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking ALTER COLUMN id SET DEFAULT nextval('public.booking_id_seq'::regclass);


--
-- Name: booking_rejected id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_rejected ALTER COLUMN id SET DEFAULT nextval('public.booking_rejected_id_seq'::regclass);


--
-- Name: booking_service id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_service ALTER COLUMN id SET DEFAULT nextval('public.booking_service_id_seq'::regclass);


--
-- Name: booking_temp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_temp ALTER COLUMN id SET DEFAULT nextval('public.booking_temp_id_seq'::regclass);


--
-- Name: booking_vehicle id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_vehicle ALTER COLUMN id SET DEFAULT nextval('public.booking_vehicle_id_seq'::regclass);


--
-- Name: brand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand ALTER COLUMN id SET DEFAULT nextval('public.brand_id_seq'::regclass);


--
-- Name: breeds id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.breeds ALTER COLUMN id SET DEFAULT nextval('public.breeds_id_seq'::regclass);


--
-- Name: card_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_details ALTER COLUMN id SET DEFAULT nextval('public.card_details_id_seq'::regclass);


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
-- Name: maid_pricing id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maid_pricing ALTER COLUMN id SET DEFAULT nextval('public.maid_pricing_id_seq'::regclass);


--
-- Name: manufacturers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturers ALTER COLUMN id SET DEFAULT nextval('public.manufacturers_id_seq'::regclass);


--
-- Name: membership_payment_reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membership_payment_reports ALTER COLUMN id SET DEFAULT nextval('public.membership_payment_reports_id_seq'::regclass);


--
-- Name: memberships id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memberships ALTER COLUMN id SET DEFAULT nextval('public.memberships_id_seq'::regclass);


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
-- Name: mute_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mute_order ALTER COLUMN id SET DEFAULT nextval('public.mute_order_id_seq'::regclass);


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
-- Name: ninja_category_selected id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ninja_category_selected ALTER COLUMN id SET DEFAULT nextval('public.ninja_category_selected_id_seq'::regclass);


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
-- Name: price_list id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_list ALTER COLUMN id SET DEFAULT nextval('public.price_list_id_seq'::regclass);


--
-- Name: pricing id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pricing ALTER COLUMN id SET DEFAULT nextval('public.pricing_id_seq'::regclass);


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
-- Name: product_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories ALTER COLUMN id SET DEFAULT nextval('public.product_categories_id_seq'::regclass);


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
-- Name: recovery_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recovery_types ALTER COLUMN id SET DEFAULT nextval('public.recovery_types_id_seq'::regclass);


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
-- Name: subscripton_services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscripton_services ALTER COLUMN id SET DEFAULT nextval('public.subscripton_services_id_seq'::regclass);


--
-- Name: temp_membership_services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_membership_services ALTER COLUMN id SET DEFAULT nextval('public.temp_membership_services_id_seq'::regclass);


--
-- Name: temp_memberships id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_memberships ALTER COLUMN id SET DEFAULT nextval('public.temp_memberships_id_seq'::regclass);


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
-- Name: tinting_brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tinting_brands ALTER COLUMN id SET DEFAULT nextval('public.tinting_brands_id_seq'::regclass);


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
-- Name: user_membership_services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_membership_services ALTER COLUMN id SET DEFAULT nextval('public.user_membership_services_id_seq'::regclass);


--
-- Name: user_memberships id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_memberships ALTER COLUMN id SET DEFAULT nextval('public.user_memberships_id_seq'::regclass);


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
-- Name: vehicle_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_types ALTER COLUMN id SET DEFAULT nextval('public.vehicle_types_id_seq'::regclass);


--
-- Name: vehicles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles ALTER COLUMN id SET DEFAULT nextval('public.vehicles_id_seq'::regclass);


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
2		6844462f1990e_1749304879.jpg	1	1	0	2025-06-07 14:01:19	2025-06-07 14:01:19	2	0	0	0
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
1	About Us		1	<p>About Us</p>		\N	\N	\N	2024-07-26 08:27:38	2024-07-26 08:27:38
2	Terms And Conditions		1	<p>Terms And Conditions</p>		\N	\N	\N	2024-07-26 08:29:34	2024-07-26 08:29:34
3	Privacy Policy		1	<p>Privacy Policy</p>		\N	\N	\N	2024-07-26 08:29:47	2024-07-26 08:29:47
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
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking (id, user_id, service_id, price, booking_date, time_slot, created_at, updated_at, ninja_id, model_id, service_category_id, location, latitude, longitude, location1, latitude1, longitude1, vehicle_id, booking_id, service_price, tax, grand_total, brand, sidebar, front_glass, already_tinted, tinting_level, image, payment_type, status, hours, starting_image, completed_image, start_time, completed_time, description, recovery_type, tax_per) FROM stdin;
131	133	0	200.00	2024-08-01	10:00:00	2024-07-30 11:15:48	2024-07-30 11:15:48	4	\N	1	\N	33.553610459726414	73.15694543756085	\N	\N	\N	60	CL-202407131	10	10	210	0				0		1	0	\N	\N	\N	\N	\N		0	5
133	85	0	0.00	2024-07-30	04:16:31	2024-07-30 11:16:36	2024-07-30 11:16:36	\N	\N	3	C85G+9F, Rahim Yar Khan, Punjab, Pakistan	28.40835340508304	70.32620107393855	MMG9+8R Khanpur, Pakistan	28.67581039	70.66951141	50	CL-202407133	200	10	210	0				0		1	0	\N	\N	\N	\N	\N		2	5
134	85	0	230.00	2024-08-01	10:00:00	2024-07-30 11:17:31	2024-07-30 11:17:31	\N	\N	4	C85G+9F, Rahim Yar Khan, Punjab, Pakistan	28.408231886762316	70.32616636514203	\N	\N	\N	50	CL-202407134	230	0	230	1	1		1	3		1	0	\N	\N	\N	\N	\N		0	5
136	10	0	210.00	2024-08-01	12:00:00	2024-07-30 11:27:17	2024-07-30 11:27:17	\N	\N	6	9FGG+WQ, Muzaffarabad,	34.37601540445617	34.37601540445617	\N	\N	\N	0	CL-202407136	10	5	215	0				0		5	0	2	\N	\N	\N	\N		0	5
139	129	0	200.00	2024-08-01	11:00:00	2024-07-30 11:48:40	2024-07-30 11:48:40	\N	\N	6	6FJP%2B5J%2C%20Madharian%20Wala%20Kalar%2C%20Sialkot%2C%20Punjab%2C%20Pakistan	32.23073622192314	74.48593609035015	\N	\N	\N	10	CL-202407139	10	10	200	0				0		1	0	\N	\N	\N	\N	\N		0	5
140	129	0	200.00	2024-08-01	11:00:00	2024-07-30 11:49:17	2024-07-30 11:49:17	\N	\N	1	6FJP%2B5J%2C%20Madharian%20Wala%20Kalar%2C%20Sialkot%2C%20Punjab%2C%20Pakistan	32.23073622192314	74.48593609035015	\N	\N	\N	10	CL-202407140	10	10	200	0				0		1	0	\N	\N	\N	\N	\N		0	5
141	10	0	200.00	2024-08-01	11:00:00	2024-07-30 11:52:27	2024-07-30 11:52:27	\N	\N	1	6FJP%2B5J%2C%20Madharian%20Wala%20Kalar%2C%20Sialkot%2C%20Punjab%2C%20Pakistan	32.23073622192314	74.48593609035015	\N	\N	\N	61	CL-202407141	10	10	200	0				0		1	0	\N	\N	\N	\N	\N		0	5
142	129	0	250.00	2024-08-01	10:00:00	2024-07-30 13:56:45	2024-07-30 13:56:45	\N	\N	6	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	32.23076515039192	74.48610004037619	\N	\N	\N	0	CL-202407142	10	12.5	262.5	0				0		1	0	\N	\N	\N	\N	\N		0	5
143	129	0	250.00	2024-08-01	10:00:00	2024-07-30 14:26:12	2024-07-30 14:26:12	\N	\N	6	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	32.230772240701505	74.4861114397645	\N	\N	\N	0	CL-202407143	10	12.5	262.5	0				0		1	0	\N	\N	\N	\N	\N		0	5
144	126	0	200.00	2024-08-01	10:00:00	2024-07-30 14:57:21	2024-07-30 14:57:21	\N	\N	1	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.184165529969633	55.26026481157155	\N	\N	\N	49	CL-202407144	10	10	210	0				0		1	0	\N	\N	\N	\N	\N		0	5
145	126	0	200.00	2024-08-01	10:00:00	2024-07-30 14:57:26	2024-07-30 14:57:26	\N	\N	1	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.184165529969633	55.26026481157155	\N	\N	\N	49	CL-202407145	10	10	210	0				0		1	0	\N	\N	\N	\N	\N		0	5
146	126	0	100.00	2024-08-01	10:00:00	2024-07-30 14:59:39	2024-07-30 14:59:39	\N	\N	2	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.184165529969633	55.26026481157155	\N	\N	\N	49	CL-202407146	10	5	105	0				0		1	0	\N	\N	\N	\N	\N		0	5
147	126	0	100.00	2024-08-01	10:00:00	2024-07-30 14:59:43	2024-07-30 14:59:43	\N	\N	2	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.184165529969633	55.26026481157155	\N	\N	\N	49	CL-202407147	10	5	105	0				0		1	0	\N	\N	\N	\N	\N		0	5
148	126	0	0.00	2024-07-30	07:06:41	2024-07-30 15:08:07	2024-07-30 15:08:07	\N	\N	3	14 14B St - Al Karama - Sheikh Hamdan Colony - Dubai - United Arab Emirates	25.24892052962768	55.30605521053075	1502a Khalid Bin Al Waleed Rd - Al Hamriya - Dubai - United Arab Emirates	25.25831621	55.29822450	49	CL-202407148	150	7.5	157.5	0				0		1	0	\N	\N	\N	\N	\N		1	5
149	138	0	100.00	2024-08-01	10:00:00	2024-07-30 15:27:34	2024-07-30 15:27:34	\N	\N	6	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	32.23076429955474	74.48610071092844	\N	\N	\N	0	CL-202407149	10	5	105	0				0		1	0	\N	\N	\N	\N	\N		0	5
150	138	0	80.00	2024-08-01	10:00:00	2024-07-30 15:30:14	2024-07-30 15:30:14	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.23076656845388	74.4861077517271	\N	\N	\N	10	CL-202407150	10	4	80	0				0		1	0	\N	\N	\N	\N	\N		0	5
151	139	0	100.00	2024-08-01	10:00:00	2024-07-30 15:54:03	2024-07-30 15:54:03	\N	\N	6	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	32.23063922640174	74.4860115274787	\N	\N	\N	0	CL-202407151	10	5	105	0				0		1	0	1	\N	\N	\N	\N		0	5
152	133	0	600.00	2024-08-01	10:00:00	2024-07-30 15:59:01	2024-07-30 15:59:01	\N	\N	1	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	33.51612208605902	73.11081813482042	\N	\N	\N	60	CL-202407152	10	30	630	0				0		1	0	\N	\N	\N	\N	\N		0	5
153	140	0	380.00	2024-08-01	11:00:00	2024-07-30 16:47:42	2024-07-30 16:47:43	\N	\N	1	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	33.516424319139155	73.11083190143108	\N	\N	\N	10	CL-202407153	10	19	380	0				0		1	0	\N	\N	\N	\N	\N		0	5
154	140	0	250.00	2024-08-01	11:00:00	2024-07-30 17:00:08	2024-07-30 17:00:08	\N	\N	6	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	33.51641649232819	73.11080105602741	\N	\N	\N	0	CL-202407154	10	12.5	262.5	0				0		1	0	3	\N	\N	\N	\N		0	5
155	139	0	180.00	2024-08-01	10:00:00	2024-07-30 17:00:33	2024-07-30 17:00:33	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.230760612593514	74.48610104620457	\N	\N	\N	10	CL-202407155	10	9	180	0				0		1	0	\N	\N	\N	\N	\N		0	5
156	139	0	180.00	2024-08-01	10:00:00	2024-07-30 17:10:53	2024-07-30 17:10:53	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.230720906847694	74.48606215417385	\N	\N	\N	65	CL-202407156	10	9	180	0				0		1	0	\N	\N	\N	\N	\N		0	5
157	139	0	180.00	2024-08-01	11:00:00	2024-07-30 17:18:16	2024-07-30 17:18:17	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.23076571761673	74.48610540479422	\N	\N	\N	65	CL-202407157	10	9	180	0				0		1	0	\N	\N	\N	\N	\N		0	5
158	139	0	180.00	2024-08-01	11:00:00	2024-07-30 17:21:07	2024-07-30 17:21:07	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.23070956234569	74.48605980724096	\N	\N	\N	65	CL-202407158	10	9	189	0				0		1	0	\N	\N	\N	\N	\N		0	5
159	139	0	110.00	2024-08-01	10:00:00	2024-07-30 17:30:28	2024-07-30 17:30:28	\N	\N	2	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	32.230770255414875	74.48610909283161	\N	\N	\N	65	CL-202407159	10	5.5	115.5	0				0		1	0	\N	\N	\N	\N	\N		0	5
160	142	0	380.00	2024-08-01	11:00:00	2024-07-30 17:50:43	2024-07-30 17:50:43	\N	\N	1	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	33.5164290711312	73.11076786369085	\N	\N	\N	71	CL-202407160	10	19	399	0				0		1	0	\N	\N	\N	\N	\N		0	5
161	140	0	200.00	2024-08-01	11:00:00	2024-07-30 17:57:42	2024-07-30 17:57:42	\N	\N	6	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	33.516418449031	73.11082150787115	\N	\N	\N	0	CL-202407161	10	10	210	0				0		1	0	2	\N	\N	\N	\N		0	5
162	141	0	650.00	2024-08-01	12:00:00	2024-07-30 18:10:40	2024-07-30 18:10:40	\N	\N	1	Downtown Dubai - Dubai - United Arab Emirates	25.19722963547897	55.27974709868431	\N	\N	\N	73	CL-202407162	10	32.5	682.5	0				0		1	0	\N	\N	\N	\N	\N		0	5
163	141	0	400.00	2024-08-01	11:00:00	2024-07-30 18:26:13	2024-07-30 18:26:13	\N	\N	1	673C+W8V - Dubai - United Arab Emirates	25.204849237091366	55.27078282088041	\N	\N	\N	72	CL-202407163	10	20	420	0				0		1	0	\N	\N	\N	\N	\N		0	5
164	126	0	200.00	2024-08-01	10:00:00	2024-07-30 18:54:09	2024-07-30 18:54:09	\N	\N	1	building 4 SS Lootah - النهدة - النهدة ٢ - دبي - United Arab Emirates	25.28706153553074	55.37119332700968	\N	\N	\N	49	CL-202407164	10	10	210	0				0		1	0	\N	\N	\N	\N	\N		0	5
165	126	0	200.00	2024-08-04	09:00:00	2024-07-30 18:55:16	2024-07-30 18:55:16	\N	\N	6	building 4 SS Lootah - النهدة - النهدة ٢ - دبي - United Arab Emirates,	25.2870721457678	55.371232219040394	\N	\N	\N	0	CL-202407165	10	10	210	0				0		1	0	2	\N	\N	\N	\N		0	5
166	126	0	200.00	2024-08-04	09:00:00	2024-07-30 19:10:12	2024-07-30 19:10:12	\N	\N	6	building 4 SS Lootah - النهدة - النهدة ٢ - دبي - United Arab Emirates,	25.287019397722915	55.371166840195656	\N	\N	\N	0	CL-202407166	10	10	210	0				0		1	0	2	\N	\N	\N	\N		0	5
167	132	0	250.00	2024-08-01	10:00:00	2024-07-30 19:33:09	2024-07-30 19:33:09	\N	\N	1	200 Geary St, San Francisco, CA 94102, USA	37.785834	-122.406417	\N	\N	\N	58	CL-202407167	10	12.5	262.5	0				0		1	0	\N	\N	\N	\N	\N		0	5
168	133	0	100.00	2024-07-31	11:00:00	2024-07-30 19:42:14	2024-07-30 19:42:14	\N	\N	1	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	33.51611260576405	73.11079928760319	\N	\N	\N	60	CL-202407168	10	5	105	0				0		1	0	\N	\N	\N	\N	\N		0	5
169	126	0	200.00	2024-07-31	10:00:00	2024-07-31 03:32:26	2024-07-31 03:32:26	\N	\N	1	57M6+Q4W - Business Bay - Dubai - United Arab Emirates	25.184351039699976	55.26024475693702	\N	\N	\N	45	CL-202407169	10	10	210	0				0		1	0	\N	\N	\N	\N	\N		0	5
170	126	0	0.00	2024-07-31	07:36:29	2024-07-31 03:36:48	2024-07-31 03:36:48	\N	\N	3	8 Al Umniyat St - Al Hisn - W4 - Abu Dhabi - United Arab Emirates	24.4757634	54.351848	Al Karama - Dubai - United Arab Emirates	25.24892040	55.30605510	49	CL-202407170	200	10	210	0				0		1	0	\N	\N	\N	\N	\N		2	5
171	126	0	110.00	2024-07-31	10:00:00	2024-07-31 03:39:00	2024-07-31 03:39:00	\N	\N	4	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.184166009963413	55.260266223690394	\N	\N	\N	45	CL-202407171	110	0	110	1	0		1	1		1	0	\N	\N	\N	\N	\N		0	5
179	146	0	200.00	2024-08-04	09:00:00	2024-08-01 09:39:45	2024-08-01 09:39:45	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.23039333378276	74.4862649962306	\N	\N	\N	78	CL-202408179	10	10	210	0				0		2	0	\N	\N	\N	\N	\N		0	5
180	142	0	150.00	2024-08-01	14:48:34	2024-08-01 09:48:36	2024-08-01 09:48:36	\N	\N	3	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	33.56681429195377	73.13682250678539	418 Shop no 1, Al-Ghani Arcade, Main Main PWD Rd, PWD Housing Society Sector C PWD Society, Islamabad, Punjab, Pakistan,	33.56940733	73.14157236	70	CL-202408180	10	7.5	157.5	0				0		1	0	\N	\N	\N	\N	\N		1	5
173	141	0	150.00	2024-08-01	12:00:00	2024-07-31 11:08:06	2024-08-01 07:23:58	4	\N	1	Downtown Dubai - Dubai - United Arab Emirates	25.19722963547897	55.27974709868431	\N	\N	\N	73	CL-202407173	10	7.5	157.5	0				0		1	8	\N	172249700166ab37e92339f.jpg	172249703866ab380e6563a.jpg	2024-08-01 07:23:21	2024-08-01 07:23:58		0	5
175	146	0	400.00	2024-08-04	09:00:00	2024-08-01 07:02:55	2024-08-01 07:09:21	137	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.230767135678654	74.48610708117485	\N	\N	\N	78	CL-202408175	10	20	420	0				0		1	4	\N	172249616166ab34a1ddea2.jpg	\N	2024-08-01 07:09:21	\N		0	5
174	145	0	200.00	2024-08-01	11:00:00	2024-07-31 11:32:47	2024-08-01 07:16:05	4	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.23075408950789	74.48609668761492	\N	\N	\N	76	CL-202407174	10	10	210	0				0		1	8	\N	172249654866ab3624e417f.jpg	172249656566ab3635e5ef5.jpg	2024-08-01 07:15:48	2024-08-01 07:16:05		0	5
176	10	0	150.00	2024-08-08	10:00:00	2024-08-01 08:25:40	2024-08-01 13:02:19	\N	\N	3	9FHF+9R3, Muzaffarabad,	34.3781488894593	73.47573135048151	9FFC+CV4, Upper Adda Chowk, Muzaffarabad,	34.37347978	73.47252008	61	CL-202408176	10	7.5	157.5	0				0		1	0	\N	\N	\N	\N	\N		1	5
172	141	0	250.00	2024-08-01	11:00:00	2024-07-31 06:13:07	2024-08-01 07:18:04	4	\N	1	Downtown Dubai - Dubai - United Arab Emirates	25.19722963547897	55.27974709868431	\N	\N	\N	73	CL-202407172	10	12.5	262.5	0				0		1	8	\N	172249665866ab3692f2442.jpg	172249668466ab36ac532f2.jpg	2024-08-01 07:17:38	2024-08-01 07:18:04		0	5
178	146	0	200.00	2024-08-04	09:00:00	2024-08-01 08:50:22	2024-08-01 08:50:22	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.2309095089858	74.48590658605099	\N	\N	\N	78	CL-202408178	10	10	210	0				0		1	0	\N	\N	\N	\N	\N		0	5
181	146	0	200.00	2024-08-05	12:00:00	2024-08-01 09:50:21	2024-08-01 09:50:21	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.23077195708913	74.4861027225852	\N	\N	\N	78	CL-202408181	10	10	210	0				0		2	0	\N	\N	\N	\N	\N		0	5
182	146	0	150.00	2024-08-01	15:04:50	2024-08-01 10:06:11	2024-08-01 10:06:11	\N	\N	3	Unnamed Road, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	32.23274786300843	74.48199693113565	Technology University Road, Wirwāla, Sialkot, Punjab, Pakistan,	32.21551488	74.47806850	78	CL-202408182	10	7.5	157.5	0				0		2	0	\N	\N	\N	\N	\N		1	5
183	126	0	0.00	2024-08-01	02:18:54	2024-08-01 10:19:00	2024-08-01 10:19:00	\N	\N	3	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.18416608889479	55.260266303115785	Abu Dhabi - Al Nahyan - Zone 1 - Abu Dhabi - United Arab Emirates	24.47102850	54.37683380	49	CL-202408183	200	10	210	0				0		1	0	\N	\N	\N	\N	\N		2	5
184	85	0	0.00	2024-08-01	15:18:35	2024-08-01 10:19:53	2024-08-01 10:19:53	\N	\N	3	C8C8+WPQ, Officers Colony Rahim Yar Khan, Punjab 64200, Pakistan	28.422308876337276	70.31696954940307	MM67+J9 Khanpur, Pakistan	28.66150058	70.66347945	77	CL-202408184	200	10	210	0				0		2	0	\N	\N	\N	\N	\N		2	5
177	10	0	130.00	2024-08-05	12:00:00	2024-08-01 08:27:02	2024-08-01 10:49:37	\N	\N	4	Unnamed Road, Muzaffarabad,	34.374301659178265	73.47658831626177	\N	\N	\N	61	CL-202408177	130	5	136.5	1	0		1	30		1	10	\N	\N	\N	\N	\N		0	5
185	126	0	0.00	2024-08-01	02:30:02	2024-08-01 10:30:10	2024-08-01 10:34:12	134	\N	3	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.18416608889479	55.260266303115785	Al Karama - Dubai - United Arab Emirates	25.24892040	55.30605510	49	CL-202408185	150	7.5	157.5	0				0		1	8	\N	172250840866ab647838582.jpg	172250845266ab64a454ef7.jpg	2024-08-01 10:33:28	2024-08-01 10:34:12		1	5
186	142	0	70.00	2024-08-04	09:00:00	2024-08-01 11:21:16	2024-08-01 11:21:16	\N	\N	1	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan	33.566821555470106	73.13682116568089	\N	\N	\N	70	CL-202408186	10	3.5	73.5	0				0		1	0	\N	\N	\N	\N	\N		0	5
200	126	0	200.00	2024-07-30	12:00:00	2024-08-01 15:46:14	2024-08-01 15:46:47	\N	\N	1	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.18416608889479	55.260266303115785	\N	\N	\N	49	CL-202408200	10	10	210	0				0		2	0	\N	\N	\N	\N	\N		0	5
188	142	0	200.00	2024-08-04	09:00:00	2024-08-01 11:24:31	2024-08-01 11:24:31	\N	\N	6	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	33.56682183483611	73.13682183623314	\N	\N	\N	0	CL-202408188	10	10	210	0				0		1	0	2	\N	\N	\N	\N		0	5
189	142	0	200.00	2024-08-01	16:25:16	2024-08-01 11:25:16	2024-08-01 11:25:16	\N	\N	3	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	33.5668212761041	73.1368201598525	419, PWD Housing Society Sector C PWD Society, Islamabad, Islamabad Capital Territory, Pakistan,	33.56957383	73.14124882	70	CL-202408189	10	10	210	0				0		1	0	\N	\N	\N	\N	\N		2	5
190	126	0	200.00	2024-08-04	09:00:00	2024-08-01 11:26:35	2024-08-01 11:26:35	\N	\N	1	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.18416608889479	55.260266303115785	\N	\N	\N	49	CL-202408190	10	10	210	0				0		1	0	\N	\N	\N	\N	\N		0	5
187	10	0	340.00	2024-08-04	09:00:00	2024-08-01 11:22:22	2024-08-01 11:35:33	\N	\N	1	9FFF+96V, Tariqabad Bypass, Muzaffarabad	34.37365245796172	73.47329188138247	\N	\N	\N	61	CL-202408187	10	17	357	0				0		1	10	\N	\N	\N	\N	\N		0	5
196	85	0	200.00	2024-08-01	19:50:07	2024-08-01 14:50:12	2024-08-01 14:50:45	\N	\N	3	C85G+9F, Rahim Yar Khan, Punjab, Pakistan	28.408345892237925	70.32619866910734	GC5Q+HC4, Dari Azeem Khan, Rahim Yar Khan, Punjab, Pakistan	28.50946544	70.43897018	77	CL-202408196	200	0	200	0				0		1	10	\N	\N	\N	\N	\N		2	5
192	147	0	100.00	2024-07-22	12:00:00	2024-08-01 12:11:37	2024-08-01 12:11:37	\N	\N	1	\N	\N	\N	\N	\N	\N	74	CL-202408192	10	5.5	115.5	0				0		2	0	\N	\N	\N	\N	\N		0	5
191	126	0	70.00	2024-08-04	09:00:00	2024-08-01 12:08:36	2024-08-01 12:13:11	\N	\N	1	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.184182027818714	55.260334227205554	\N	\N	\N	49	CL-202408191	10	3.5	73.5	0				0		2	10	\N	\N	\N	\N	\N		0	5
193	141	0	70.00	2024-08-05	12:00:00	2024-08-01 12:44:41	2024-08-01 12:44:41	\N	\N	1	Vukovarska ul. 8, 20000, Dubrovnik, Croatia	42.650660626142475	18.0944237485528	\N	\N	\N	79	CL-202408193	10	3.5	73.5	0				0		1	0	\N	\N	\N	\N	\N		0	5
194	142	0	70.00	2024-08-05	12:00:00	2024-08-01 13:32:50	2024-08-01 13:32:50	\N	\N	1	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan	33.566820717372096	73.13682552427053	\N	\N	\N	70	CL-202408194	10	3.5	73.5	0				0		1	0	\N	\N	\N	\N	\N		0	5
199	126	0	200.00	2024-07-30	12:00:00	2024-08-01 15:38:21	2024-08-01 15:58:28	\N	\N	1	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.18416608889479	55.260266303115785	\N	\N	\N	49	CL-202408199	10	10	210	0				0		1	0	\N	\N	\N	\N	\N		0	5
197	85	0	200.00	2024-08-01	19:51:26	2024-08-01 14:51:30	2024-08-01 14:53:08	\N	\N	3	C85G+9F, Rahim Yar Khan, Punjab, Pakistan	28.408180613592595	70.32619417679551	C9V2+87 Rahim Yar Khan, Pakistan	28.44329339	70.35065074	77	CL-202408197	200	10	210	0				0		1	10	\N	\N	\N	\N	\N		2	5
195	85	0	210.00	2024-08-01	19:45:53	2024-08-01 14:45:58	2024-08-01 15:00:21	\N	\N	3	C85G+9F, Rahim Yar Khan, Punjab, Pakistan	28.408345892237925	70.32619866910734	HF6G+85 Kot Samaba, Pakistan	28.56084289	70.47538955	77	CL-202408195	200	10	210	0				0		1	10	\N	\N	\N	\N	\N		2	5
198	85	0	200.00	2024-08-01	20:07:23	2024-08-01 15:07:40	2024-08-01 15:07:40	\N	\N	3	C85G+9F, Rahim Yar Khan, Punjab, Pakistan	28.408345892237925	70.32619866910734	C88J+28C, Rahim Yar Khan, Punjab, Pakistan	28.41533014	70.33068974	77	CL-202408198	200	10	210	0				0		1	0	\N	\N	\N	\N	\N		2	5
205	150	0	70.00	2024-07-30	12:00:00	2024-08-01 21:31:20	2024-08-01 21:31:39	\N	\N	1	200 Geary St, San Francisco, CA 94102, USA	37.785834	-122.406417	\N	\N	\N	95	CL-202408205	10	3.5	73.5	0				0		1	0	\N	\N	\N	\N	\N		0	5
201	142	0	70.00	2024-08-04	09:00:00	2024-08-01 16:33:18	2024-08-01 16:33:18	\N	\N	1	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	33.5164394137012	73.11084095388651	\N	\N	\N	70	CL-202408201	10	3.5	73.5	0				0		1	0	\N	\N	\N	\N	\N		0	5
202	148	0	70.00	2024-08-04	09:00:00	2024-08-01 16:39:54	2024-08-01 16:39:54	\N	\N	1	200 Geary St, San Francisco, CA 94102, USA	37.785834	-122.406417	\N	\N	\N	82	CL-202408202	10	3.5	73.5	0				0		1	0	\N	\N	\N	\N	\N		0	5
203	142	0	60.00	2024-08-08	14:00:00	2024-08-01 20:05:22	2024-08-01 20:05:22	\N	\N	4	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	33.51642655537074	73.1108433008194	\N	\N	\N	87	CL-202408203	60	5	63	3	0		1	50		1	0	\N	\N	\N	\N	\N		0	5
204	10	0	230.00	2024-08-08	11:00:00	2024-08-01 20:06:40	2024-08-01 21:31:45	\N	\N	4	9FGG+WQ, Muzaffarabad,	34.37903713372788	73.47674489021301	\N	\N	\N	31	CL-202408204	230	5	241.5	1	1		1	70		1	0	\N	\N	\N	\N	\N		0	5
207	151	0	270.00	2024-08-04	09:00:00	2024-08-01 22:45:48	2024-08-01 22:45:48	\N	\N	1	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	33.51604696242406	73.11083164297473	\N	\N	\N	96	CL-202408207	10	13.5	283.5	0				0		1	0	\N	\N	\N	\N	\N		0	5
206	151	0	70.00	2024-08-04	09:00:00	2024-08-01 22:26:50	2024-08-01 22:26:50	\N	\N	1	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	33.51605777177182	73.11082564868869	\N	\N	\N	96	CL-202408206	10	3.5	73.5	0				0		1	0	\N	\N	\N	\N	\N		0	5
208	126	0	200.00	2024-08-04	09:00:00	2024-08-02 02:06:32	2024-08-02 02:06:32	\N	\N	1	building 4 SS Lootah - النهدة - النهدة ٢ - دبي - United Arab Emirates	25.28716633688968	55.371259449616076	\N	\N	\N	49	CL-202408208	10	10	210	0				0		1	0	\N	\N	\N	\N	\N		0	5
209	152	0	105.00	2024-08-06	14:00:00	2024-08-02 13:06:33	2024-08-02 13:06:33	\N	\N	6	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.184166158998533	55.26026623584265	\N	\N	\N	0	CL-202408209	100	5	105	0				0		2	0	\N	\N	\N	\N	\N		0	5
210	151	0	70.00	2024-08-08	11:00:00	2024-08-02 20:26:02	2024-08-02 20:39:36	\N	\N	1	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	33.51606542841737	73.11079298620066	\N	\N	\N	96	CL-202408210	10	3.5	73.5	0				0		1	10	\N	\N	\N	\N	\N		0	5
211	150	0	70.00	2024-08-03	09:00:00	2024-08-02 21:16:52	2024-08-02 21:16:52	\N	\N	1	200 Geary St, San Francisco, CA 94102, USA	37.785834	-122.406417	\N	\N	\N	95	CL-202408211	10	3.5	73.5	0				0		2	0	\N	\N	\N	\N	\N		0	5
\.


--
-- Data for Name: booking_rejected; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_rejected (id, booking_id, user_id, created_at, updated_at) FROM stdin;
1	141	137	2024-07-30 15:31:54	2024-07-30 15:31:54
2	150	137	2024-07-30 15:36:17	2024-07-30 15:36:17
3	139	137	2024-07-30 15:36:59	2024-07-30 15:36:59
4	139	4	2024-07-30 15:38:06	2024-07-30 15:38:06
5	140	4	2024-07-30 15:38:44	2024-07-30 15:38:44
6	141	4	2024-07-30 15:39:03	2024-07-30 15:39:03
7	150	4	2024-07-30 15:39:34	2024-07-30 15:39:34
8	153	4	2024-07-30 16:52:45	2024-07-30 16:52:45
9	155	4	2024-07-30 17:02:08	2024-07-30 17:02:08
10	155	134	2024-08-01 11:17:37	2024-08-01 11:17:37
11	153	134	2024-08-01 11:17:54	2024-08-01 11:17:54
12	150	134	2024-08-01 11:18:32	2024-08-01 11:18:32
13	141	134	2024-08-01 11:19:00	2024-08-01 11:19:00
14	140	134	2024-08-01 11:19:37	2024-08-01 11:19:37
\.


--
-- Data for Name: booking_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_service (id, service_id, booking_id, created_at, updated_at, price) FROM stdin;
66	1	131	2024-07-30 11:15:48	2024-07-30 11:15:48	200
67	10	131	2024-07-30 11:15:48	2024-07-30 11:15:48	300
68	56	139	2024-07-30 11:48:40	2024-07-30 11:48:40	0
69	56	140	2024-07-30 11:49:17	2024-07-30 11:49:17	0
70	56	141	2024-07-30 11:52:27	2024-07-30 11:52:27	0
71	1	144	2024-07-30 14:57:21	2024-07-30 14:57:21	200
72	1	145	2024-07-30 14:57:26	2024-07-30 14:57:26	200
73	2	146	2024-07-30 14:59:39	2024-07-30 14:59:39	100
74	2	147	2024-07-30 14:59:44	2024-07-30 14:59:44	100
75	64	150	2024-07-30 15:30:14	2024-07-30 15:30:14	0
76	1	152	2024-07-30 15:59:01	2024-07-30 15:59:01	300
77	10	152	2024-07-30 15:59:01	2024-07-30 15:59:01	300
78	67	153	2024-07-30 16:47:43	2024-07-30 16:47:43	0
79	66	153	2024-07-30 16:47:43	2024-07-30 16:47:43	0
80	65	155	2024-07-30 17:00:33	2024-07-30 17:00:33	0
81	10	156	2024-07-30 17:10:53	2024-07-30 17:10:53	80
82	1	156	2024-07-30 17:10:53	2024-07-30 17:10:53	100
83	10	157	2024-07-30 17:18:17	2024-07-30 17:18:17	80
84	1	157	2024-07-30 17:18:17	2024-07-30 17:18:17	100
85	10	158	2024-07-30 17:21:07	2024-07-30 17:21:07	80
86	1	158	2024-07-30 17:21:07	2024-07-30 17:21:07	100
87	7	159	2024-07-30 17:30:28	2024-07-30 17:30:28	100
88	2	159	2024-07-30 17:30:28	2024-07-30 17:30:28	10
89	10	160	2024-07-30 17:50:43	2024-07-30 17:50:43	180
90	1	160	2024-07-30 17:50:43	2024-07-30 17:50:43	200
91	1	162	2024-07-30 18:10:40	2024-07-30 18:10:40	300
92	10	162	2024-07-30 18:10:40	2024-07-30 18:10:40	350
93	1	163	2024-07-30 18:26:13	2024-07-30 18:26:13	200
94	10	163	2024-07-30 18:26:13	2024-07-30 18:26:13	200
95	1	164	2024-07-30 18:54:09	2024-07-30 18:54:09	200
96	1	167	2024-07-30 19:33:09	2024-07-30 19:33:09	100
97	10	167	2024-07-30 19:33:09	2024-07-30 19:33:09	150
98	1	168	2024-07-30 19:42:14	2024-07-30 19:42:14	100
99	1	169	2024-07-31 03:32:26	2024-07-31 03:32:26	200
100	1	172	2024-07-31 06:13:07	2024-07-31 06:13:07	100
101	10	172	2024-07-31 06:13:07	2024-07-31 06:13:07	150
102	1	173	2024-07-31 11:08:06	2024-07-31 11:08:06	100
103	1	174	2024-07-31 11:32:47	2024-07-31 11:32:47	200
104	1	175	2024-08-01 07:02:55	2024-08-01 07:02:55	200
105	10	175	2024-08-01 07:02:55	2024-08-01 07:02:55	200
106	1	178	2024-08-01 08:50:22	2024-08-01 08:50:22	200
107	1	179	2024-08-01 09:39:45	2024-08-01 09:39:45	200
108	1	181	2024-08-01 09:50:21	2024-08-01 09:50:21	200
109	1	186	2024-08-01 11:21:16	2024-08-01 11:21:16	100
110	1	187	2024-08-01 11:22:22	2024-08-01 11:22:22	200
111	10	187	2024-08-01 11:22:22	2024-08-01 11:22:22	140
112	1	190	2024-08-01 11:26:35	2024-08-01 11:26:35	200
113	10	191	2024-08-01 12:08:36	2024-08-01 12:08:36	200
114	10	192	2024-08-01 12:11:37	2024-08-01 12:11:37	70
115	10	193	2024-08-01 12:44:41	2024-08-01 12:44:41	70
116	10	194	2024-08-01 13:32:50	2024-08-01 13:32:50	70
117	1	199	2024-08-01 15:38:21	2024-08-01 15:38:21	200
118	1	200	2024-08-01 15:46:14	2024-08-01 15:46:14	200
119	10	201	2024-08-01 16:33:18	2024-08-01 16:33:18	70
120	10	202	2024-08-01 16:39:54	2024-08-01 16:39:54	70
121	10	205	2024-08-01 21:31:20	2024-08-01 21:31:20	70
122	10	206	2024-08-01 22:26:50	2024-08-01 22:26:50	70
123	1	207	2024-08-01 22:45:48	2024-08-01 22:45:48	200
124	10	207	2024-08-01 22:45:48	2024-08-01 22:45:48	70
125	1	208	2024-08-02 02:06:32	2024-08-02 02:06:32	200
126	1	210	2024-08-02 20:26:02	2024-08-02 20:26:02	70
127	1	211	2024-08-02 21:16:52	2024-08-02 21:16:52	70
\.


--
-- Data for Name: booking_temp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_temp (id, user_id, service_id, price, booking_date, time_slot, ninja_id, model_id, service_category_id, location, latitude, longitude, location1, latitude1, longitude1, vehicle_id, booking_id, service_price, tax, grand_total, brand, sidebar, front_glass, already_tinted, tinting_level, created_at, updated_at, image, payment_type, hours, description, recovery_type, vehicle_list, service_list, tax_per) FROM stdin;
203	129	56	200.00	2024-08-01	11:00:00	0	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.23073622192314	74.48593609035015	\N	\N	\N	10	CL-202407203	10	10	200	0				0	2024-07-30 11:11:17	2024-07-30 11:11:17	\N	5	\N		0	10	56	5
204	129	56	200.00	2024-08-01	11:00:00	0	\N	1	6FJP%2B5J%2C%20Madharian%20Wala%20Kalar%2C%20Sialkot%2C%20Punjab%2C%20Pakistan	32.23073622192314	74.48593609035015	\N	\N	\N	10	CL-202407204	10	10	200	0				0	2024-07-30 11:11:24	2024-07-30 11:11:24	\N	5	\N		0	10	56	5
205	129	56	200.00	2024-08-01	11:00:00	0	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.23073622192314	74.48593609035015	\N	\N	\N	10	CL-202407205	10	10	200	0				0	2024-07-30 11:11:52	2024-07-30 11:11:52	\N	5	\N		0	10	56	5
206	129	56	200.00	2024-08-01	11:00:00	0	\N	1	6FJP%2B5J%2C%20Madharian%20Wala%20Kalar%2C%20Sialkot%2C%20Punjab%2C%20Pakistan	32.23073622192314	74.48593609035015	\N	\N	\N	10	CL-202407206	10	10	200	0				0	2024-07-30 11:13:04	2024-07-30 11:13:04	\N	1	\N		0	10	56	5
207	129	56	200.00	2024-08-01	11:00:00	0	\N	1	6FJP%2B5J%2C%20Madharian%20Wala%20Kalar%2C%20Sialkot%2C%20Punjab%2C%20Pakistan	32.23073622192314	74.48593609035015	\N	\N	\N	10	CL-202407207	10	10	200	0				0	2024-07-30 11:14:36	2024-07-30 11:14:36	\N	1	\N		0	10	56	5
208	133	1	200.00	2024-08-01	10:00:00	4	\N	1	\N	33.553610459726414	73.15694543756085	\N	\N	\N	60	CL-202407208	10	10	210	0				0	2024-07-30 11:15:45	2024-07-30 11:15:45	\N	1	\N		0	60,59	1,10	5
209	129	63	200.00	2024-08-01	12:00:00	0	\N	2	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	32.23076259788033	74.48610238730907	\N	\N	\N	7	CL-202407209	10	10	200	0				0	2024-07-30 11:16:20	2024-07-30 11:16:20	\N	5	\N		0	7,2	63	5
210	85	0	0.00	2024-07-30	04:16:31	\N	\N	3	C85G+9F, Rahim Yar Khan, Punjab, Pakistan	28.40835340508304	70.32620107393855	MMG9+8R Khanpur, Pakistan	28.67581039	70.66951141	50	CL-202407210	200	10	210	0				0	2024-07-30 11:16:34	2024-07-30 11:16:34	\N	1	\N		2	50	\N	5
211	85	0	230.00	2024-08-01	10:00:00	\N	\N	4	C85G+9F, Rahim Yar Khan, Punjab, Pakistan	28.408231886762316	70.32616636514203	\N	\N	\N	50	CL-202407211	230	0	230	1	1		1	3	2024-07-30 11:17:29	2024-07-30 11:17:29	\N	1	\N		0	50	\N	5
212	129	63	200.00	2024-08-01	11:00:00	0	\N	5	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	32.23076429955474	74.48610406368971	\N	\N	\N	5	CL-202407212	10	10	200	0				0	2024-07-30 11:17:37	2024-07-30 11:17:37	\N	5	\N		0	5	63	5
213	10	0	210.00	2024-08-01	12:00:00	\N	\N	6	9FGG+WQ, Muzaffarabad,	34.37601540445617	34.37601540445617	\N	\N	\N	0	CL-202407213	10	5	215	0				0	2024-07-30 11:27:14	2024-07-30 11:27:14	\N	5	2		0	\N	\N	5
214	129	56	200.00	2024-08-01	11:00:00	0	\N	6	6FJP%2B5J%2C%20Madharian%20Wala%20Kalar%2C%20Sialkot%2C%20Punjab%2C%20Pakistan	32.23073622192314	74.48593609035015	\N	\N	\N	10	CL-202407214	10	10	200	0				0	2024-07-30 11:47:19	2024-07-30 11:47:19	\N	1	\N		0	10	56	5
215	129	56	200.00	2024-08-01	11:00:00	\N	\N	6	6FJP%2B5J%2C%20Madharian%20Wala%20Kalar%2C%20Sialkot%2C%20Punjab%2C%20Pakistan	32.23073622192314	74.48593609035015	\N	\N	\N	10	CL-202407215	10	10	200	0				0	2024-07-30 11:48:22	2024-07-30 11:48:22	\N	1	\N		0	10	56	5
216	129	56	200.00	2024-08-01	11:00:00	\N	\N	1	6FJP%2B5J%2C%20Madharian%20Wala%20Kalar%2C%20Sialkot%2C%20Punjab%2C%20Pakistan	32.23073622192314	74.48593609035015	\N	\N	\N	10	CL-202407216	10	10	200	0				0	2024-07-30 11:48:58	2024-07-30 11:48:58	\N	1	\N		0	10	56	5
217	10	56	200.00	2024-08-01	11:00:00	\N	\N	1	6FJP%2B5J%2C%20Madharian%20Wala%20Kalar%2C%20Sialkot%2C%20Punjab%2C%20Pakistan	32.23073622192314	74.48593609035015	\N	\N	\N	61	CL-202407217	10	10	200	0				0	2024-07-30 11:52:03	2024-07-30 11:52:03	\N	1	\N		0	61	56	5
218	129	0	250.00	2024-08-01	10:00:00	\N	\N	6	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	32.23076515039192	74.48610004037619	\N	\N	\N	0	CL-202407218	10	12.5	262.5	0				0	2024-07-30 13:56:42	2024-07-30 13:56:42	\N	1	\N		0	\N	\N	5
219	129	0	250.00	2024-08-01	10:00:00	\N	\N	6	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	32.230772240701505	74.4861114397645	\N	\N	\N	0	CL-202407219	10	12.5	262.5	0				0	2024-07-30 14:26:10	2024-07-30 14:26:10	\N	1	\N		0	\N	\N	5
220	126	1	200.00	2024-08-01	10:00:00	\N	\N	1	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.184165529969633	55.26026481157155	\N	\N	\N	49	CL-202407220	10	10	210	0				0	2024-07-30 14:57:18	2024-07-30 14:57:18	\N	1	\N		0	49	1	5
221	126	1	200.00	2024-08-01	10:00:00	\N	\N	1	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.184165529969633	55.26026481157155	\N	\N	\N	49	CL-202407221	10	10	210	0				0	2024-07-30 14:57:23	2024-07-30 14:57:23	\N	1	\N		0	49	1	5
222	126	2	100.00	2024-08-01	10:00:00	\N	\N	2	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.184165529969633	55.26026481157155	\N	\N	\N	49	CL-202407222	10	5	105	0				0	2024-07-30 14:59:36	2024-07-30 14:59:36	\N	1	\N		0	49	2	5
223	126	2	100.00	2024-08-01	10:00:00	\N	\N	2	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.184165529969633	55.26026481157155	\N	\N	\N	49	CL-202407223	10	5	105	0				0	2024-07-30 14:59:40	2024-07-30 14:59:40	\N	1	\N		0	49	2	5
224	126	0	0.00	2024-07-30	07:06:41	\N	\N	3	14 14B St - Al Karama - Sheikh Hamdan Colony - Dubai - United Arab Emirates	25.24892052962768	55.30605521053075	1502a Khalid Bin Al Waleed Rd - Al Hamriya - Dubai - United Arab Emirates	25.25831621	55.29822450	49	CL-202407224	150	7.5	157.5	0				0	2024-07-30 15:08:03	2024-07-30 15:08:03	\N	1	\N		1	49	\N	5
225	138	0	100.00	2024-08-01	10:00:00	\N	\N	6	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	32.23076429955474	74.48610071092844	\N	\N	\N	0	CL-202407225	10	5	105	0				0	2024-07-30 15:27:31	2024-07-30 15:27:31	\N	1	\N		0	\N	\N	5
226	138	64	80.00	2024-08-01	10:00:00	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.23076656845388	74.4861077517271	\N	\N	\N	10	CL-202407226	10	4	80	0				0	2024-07-30 15:30:13	2024-07-30 15:30:13	\N	1	\N		0	10	64	5
227	132	0	0.00	2024-08-01	11:00:00	\N	\N	6	200 Geary St, San Francisco, CA 94102, USA	37.785834	-122.406417	\N	\N	\N	0	CL-202407227	100	0	0	0				0	2024-07-30 15:51:52	2024-07-30 15:51:52	\N	1	\N		0	\N	\N	5
228	139	0	100.00	2024-08-01	10:00:00	\N	\N	6	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	32.23063922640174	74.4860115274787	\N	\N	\N	0	CL-202407228	10	5	105	0				0	2024-07-30 15:52:29	2024-07-30 15:52:29	\N	1	1		0	\N	\N	5
229	132	0	0.00	2024-08-01	11:00:00	\N	\N	6	200 Geary St, San Francisco, CA 94102, USA	37.785834	-122.406417	\N	\N	\N	0	CL-202407229	100	0	0	0				0	2024-07-30 15:52:58	2024-07-30 15:52:58	\N	1	\N		0	\N	\N	5
230	139	0	100.00	2024-08-01	10:00:00	\N	\N	6	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	32.23063922640174	74.4860115274787	\N	\N	\N	0	CL-202407230	10	5	105	0				0	2024-07-30 15:53:51	2024-07-30 15:53:51	\N	1	1		0	\N	\N	5
231	133	1	600.00	2024-08-01	10:00:00	\N	\N	1	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	33.51612208605902	73.11081813482042	\N	\N	\N	60	CL-202407231	10	30	630	0				0	2024-07-30 15:58:59	2024-07-30 15:58:59	\N	1	\N		0	60,59	1,10	5
232	140	67	380.00	2024-08-01	11:00:00	\N	\N	1	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	33.516424319139155	73.11083190143108	\N	\N	\N	10	CL-202407232	10	19	380	0				0	2024-07-30 16:47:40	2024-07-30 16:47:40	\N	1	\N		0	10,1	67,66	5
233	140	0	250.00	2024-08-01	11:00:00	\N	\N	6	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	33.51641649232819	73.11080105602741	\N	\N	\N	0	CL-202407233	10	12.5	262.5	0				0	2024-07-30 17:00:07	2024-07-30 17:00:07	\N	1	3		0	\N	\N	5
234	139	65	180.00	2024-08-01	10:00:00	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.230760612593514	74.48610104620457	\N	\N	\N	10	CL-202407234	10	9	180	0				0	2024-07-30 17:00:32	2024-07-30 17:00:32	\N	1	\N		0	10,1	65	5
235	139	10	180.00	2024-08-01	10:00:00	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.230720906847694	74.48606215417385	\N	\N	\N	65	CL-202407235	10	9	180	0				0	2024-07-30 17:10:51	2024-07-30 17:10:51	\N	1	\N		0	65	10,1	5
236	139	10	180.00	2024-08-01	11:00:00	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.23076571761673	74.48610540479422	\N	\N	\N	65	CL-202407236	10	9	180	0				0	2024-07-30 17:18:14	2024-07-30 17:18:14	\N	1	\N		0	65	10,1	5
237	139	10	180.00	2024-08-01	11:00:00	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.23070956234569	74.48605980724096	\N	\N	\N	65	CL-202407237	10	9	189	0				0	2024-07-30 17:21:06	2024-07-30 17:21:06	\N	1	\N		0	65	10,1	5
238	139	7	110.00	2024-08-01	10:00:00	\N	\N	2	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	32.230770255414875	74.48610909283161	\N	\N	\N	65	CL-202407238	10	5.5	115.5	0				0	2024-07-30 17:30:26	2024-07-30 17:30:26	\N	1	\N		0	65	7,2	5
239	142	10	380.00	2024-08-01	11:00:00	\N	\N	1	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	33.5164290711312	73.11076786369085	\N	\N	\N	71	CL-202407239	10	19	399	0				0	2024-07-30 17:50:42	2024-07-30 17:50:42	\N	1	\N		0	71,70	10,1	5
240	140	0	200.00	2024-08-01	11:00:00	\N	\N	6	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	33.516418449031	73.11082150787115	\N	\N	\N	0	CL-202407240	10	10	210	0				0	2024-07-30 17:57:40	2024-07-30 17:57:40	\N	1	2		0	\N	\N	5
241	141	1	650.00	2024-08-01	12:00:00	\N	\N	1	Downtown Dubai - Dubai - United Arab Emirates	25.19722963547897	55.27974709868431	\N	\N	\N	73	CL-202407241	10	32.5	682.5	0				0	2024-07-30 18:10:39	2024-07-30 18:10:39	\N	1	\N		0	73,72	1,10	5
242	141	1	400.00	2024-08-01	11:00:00	\N	\N	1	673C+W8V - Dubai - United Arab Emirates	25.204849237091366	55.27078282088041	\N	\N	\N	72	CL-202407242	10	20	420	0				0	2024-07-30 18:26:11	2024-07-30 18:26:11	\N	1	\N		0	72	1,10	5
243	126	1	200.00	2024-08-01	10:00:00	\N	\N	1	building 4 SS Lootah - النهدة - النهدة ٢ - دبي - United Arab Emirates	25.28706153553074	55.37119332700968	\N	\N	\N	49	CL-202407243	10	10	210	0				0	2024-07-30 18:54:07	2024-07-30 18:54:07	\N	1	\N		0	49	1	5
244	126	0	200.00	2024-08-04	09:00:00	\N	\N	6	building 4 SS Lootah - النهدة - النهدة ٢ - دبي - United Arab Emirates,	25.2870721457678	55.371232219040394	\N	\N	\N	0	CL-202407244	10	10	210	0				0	2024-07-30 18:55:16	2024-07-30 18:55:16	\N	1	2		0	\N	\N	5
245	126	0	200.00	2024-08-04	09:00:00	\N	\N	6	building 4 SS Lootah - النهدة - النهدة ٢ - دبي - United Arab Emirates,	25.287019397722915	55.371166840195656	\N	\N	\N	0	CL-202407245	10	10	210	0				0	2024-07-30 19:10:11	2024-07-30 19:10:11	\N	1	2		0	\N	\N	5
246	132	1	250.00	2024-08-01	10:00:00	\N	\N	1	200 Geary St, San Francisco, CA 94102, USA	37.785834	-122.406417	\N	\N	\N	58	CL-202407246	10	12.5	262.5	0				0	2024-07-30 19:33:07	2024-07-30 19:33:07	\N	1	\N		0	58	1,10	5
247	133	1	100.00	2024-07-31	11:00:00	\N	\N	1	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	33.51611260576405	73.11079928760319	\N	\N	\N	60	CL-202407247	10	5	105	0				0	2024-07-30 19:42:12	2024-07-30 19:42:12	\N	1	\N		0	60	1	5
248	126	1	200.00	2024-07-31	10:00:00	\N	\N	1	57M6+Q4W - Business Bay - Dubai - United Arab Emirates	25.184351039699976	55.26024475693702	\N	\N	\N	45	CL-202407248	10	10	210	0				0	2024-07-31 03:32:24	2024-07-31 03:32:24	\N	1	\N		0	45	1	5
249	126	0	0.00	2024-07-31	07:36:29	\N	\N	3	8 Al Umniyat St - Al Hisn - W4 - Abu Dhabi - United Arab Emirates	24.4757634	54.351848	Al Karama - Dubai - United Arab Emirates	25.24892040	55.30605510	49	CL-202407249	200	10	210	0				0	2024-07-31 03:36:47	2024-07-31 03:36:47	\N	1	\N		2	49	\N	5
250	126	0	110.00	2024-07-31	10:00:00	\N	\N	4	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.184166009963413	55.260266223690394	\N	\N	\N	45	CL-202407250	110	0	110	1	0		1	1	2024-07-31 03:38:59	2024-07-31 03:38:59	\N	1	\N		0	45	\N	5
251	141	1	250.00	2024-08-01	11:00:00	\N	\N	1	Downtown Dubai - Dubai - United Arab Emirates	25.19722963547897	55.27974709868431	\N	\N	\N	73	CL-202407251	10	12.5	262.5	0				0	2024-07-31 06:13:06	2024-07-31 06:13:06	\N	1	\N		0	73	1,10	5
252	141	1	150.00	2024-08-01	12:00:00	\N	\N	1	Downtown Dubai - Dubai - United Arab Emirates	25.19722963547897	55.27974709868431	\N	\N	\N	73	CL-202407252	10	7.5	157.5	0				0	2024-07-31 11:08:04	2024-07-31 11:08:04	\N	1	\N		0	73	1	5
253	145	1	200.00	2024-08-01	11:00:00	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.23075408950789	74.48609668761492	\N	\N	\N	76	CL-202407253	10	10	210	0				0	2024-07-31 11:32:46	2024-07-31 11:32:46	\N	1	\N		0	76	1	5
254	146	1	400.00	2024-08-04	09:00:00	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.230767135678654	74.48610708117485	\N	\N	\N	78	CL-202408254	10	20	420	0				0	2024-08-01 07:02:54	2024-08-01 07:02:54	\N	1	\N		0	78	1,10	5
255	10	0	150.00	2024-08-01	13:25:39	\N	\N	3	9FHF+9R3, Muzaffarabad,	34.3781488894593	73.47573135048151	9FFC+CV4, Upper Adda Chowk, Muzaffarabad,	34.37347978	73.47252008	61	CL-202408255	10	7.5	157.5	0				0	2024-08-01 08:25:39	2024-08-01 08:25:39	\N	1	\N		1	61	\N	5
256	10	0	130.00	2024-08-05	12:00:00	\N	\N	4	Unnamed Road, Muzaffarabad,	34.374301659178265	73.47658831626177	\N	\N	\N	61	CL-202408256	130	5	136.5	1	0		1	30	2024-08-01 08:27:00	2024-08-01 08:27:00	\N	1	\N		0	61	\N	5
257	146	1	200.00	2024-08-04	09:00:00	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.2309095089858	74.48590658605099	\N	\N	\N	78	CL-202408257	10	10	210	0				0	2024-08-01 08:50:21	2024-08-01 08:50:21	\N	1	\N		0	78	1	5
258	146	1	200.00	2024-08-05	12:00:00	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.23105670346524	74.48640815913677	\N	\N	\N	78	CL-202408258	10	10	210	0				0	2024-08-01 08:51:02	2024-08-01 08:51:02	\N	2	\N		0	78	1	5
259	146	1	400.00	2024-08-05	12:00:00	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.230772524313856	74.48611110448837	\N	\N	\N	78	CL-202408259	10	20	420	0				0	2024-08-01 09:05:17	2024-08-01 09:05:17	\N	2	\N		0	78	1	5
260	127	7	100.00	2024-07-22	12:00:00	\N	\N	2	Dubai,78589	28.0555	75.154558	\N	\N	\N	7	CL-202408260	10	5.5	115.5	0				0	2024-08-01 09:22:29	2024-08-01 09:22:29	\N	2	\N		0	7	7	5
261	85	0	262.50	2024-08-04	09:00:00	\N	\N	6	C8C8+WPQ, Officers Colony Rahim Yar Khan, Punjab 64200, Pakistan	28.422308892348333	70.3169296681881	\N	\N	\N	0	CL-202408261	250	12.5	262.5	0				0	2024-08-01 09:24:06	2024-08-01 09:24:06	\N	2	\N		0	\N	\N	5
262	127	7	100.00	2024-07-22	12:00:00	\N	\N	2	Dubai,78589	28.0555	75.154558	\N	\N	\N	7	CL-202408262	10	5.5	115.5	0				0	2024-08-01 09:25:05	2024-08-01 09:25:06	\N	2	\N		0	7	7	5
263	127	7	100.00	2024-07-22	12:00:00	\N	\N	2	Dubai,78589	28.0555	75.154558	\N	\N	\N	7	CL-202408263	10	5.5	115.5	0				0	2024-08-01 09:25:44	2024-08-01 09:25:44	\N	2	\N		0	7	7	5
264	85	0	262.50	2024-08-04	09:00:00	\N	\N	6	C8C8+WPQ, Officers Colony Rahim Yar Khan, Punjab 64200, Pakistan	28.422308892348333	70.3169296681881	\N	\N	\N	0	CL-202408264	250	12.5	262.5	0				0	2024-08-01 09:27:20	2024-08-01 09:27:20	\N	2	\N		0	\N	\N	5
265	146	1	200.00	2024-08-05	12:00:00	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.230772524313856	74.48610574007034	\N	\N	\N	78	CL-202408265	10	10	210	0				0	2024-08-01 09:35:14	2024-08-01 09:35:14	\N	2	\N		0	78	1	5
266	146	1	200.00	2024-08-05	12:00:00	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.230772524313856	74.48610574007034	\N	\N	\N	78	CL-202408266	10	10	210	0				0	2024-08-01 09:35:44	2024-08-01 09:35:44	\N	2	\N		0	78	1	5
267	146	1	200.00	2024-08-04	09:00:00	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.23039333378276	74.4862649962306	\N	\N	\N	78	CL-202408267	10	10	210	0				0	2024-08-01 09:38:40	2024-08-01 09:38:40	\N	2	\N		0	78	1	5
268	142	0	150.00	2024-08-01	14:48:34	\N	\N	3	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	33.56681429195377	73.13682250678539	418 Shop no 1, Al-Ghani Arcade, Main Main PWD Rd, PWD Housing Society Sector C PWD Society, Islamabad, Punjab, Pakistan,	33.56940733	73.14157236	70	CL-202408268	10	7.5	157.5	0				0	2024-08-01 09:48:34	2024-08-01 09:48:35	\N	1	\N		1	70	\N	5
269	146	1	200.00	2024-08-05	12:00:00	\N	\N	1	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan	32.23077195708913	74.4861027225852	\N	\N	\N	78	CL-202408269	10	10	210	0				0	2024-08-01 09:49:26	2024-08-01 09:49:26	\N	2	\N		0	78	1	5
270	146	0	150.00	2024-08-01	15:04:50	\N	\N	3	Unnamed Road, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	32.23274786300843	74.48199693113565	Technology University Road, Wirwāla, Sialkot, Punjab, Pakistan,	32.21551488	74.47806850	78	CL-202408270	10	7.5	157.5	0				0	2024-08-01 10:04:53	2024-08-01 10:04:53	\N	2	\N		1	78	\N	5
271	146	0	230.00	2024-08-04	09:00:00	\N	\N	4	6FJP+5J, Madharian Wala Kalar, Sialkot, Punjab, Pakistan,	32.2307367891481	74.48619928210974	\N	\N	\N	78	CL-202408271	230	5	241.5	1	1		1	70	2024-08-01 10:08:22	2024-08-01 10:08:22	\N	2	\N		0	78	\N	5
272	85	0	0.00	2024-08-01	15:18:35	\N	\N	3	C8C8+WPQ, Officers Colony Rahim Yar Khan, Punjab 64200, Pakistan	28.422308876337276	70.31696954940307	MM67+J9 Khanpur, Pakistan	28.66150058	70.66347945	77	CL-202408272	200	10	210	0				0	2024-08-01 10:18:39	2024-08-01 10:18:39	\N	2	\N		2	77	\N	5
273	126	0	0.00	2024-08-01	02:18:54	\N	\N	3	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.18416608889479	55.260266303115785	Abu Dhabi - Al Nahyan - Zone 1 - Abu Dhabi - United Arab Emirates	24.47102850	54.37683380	49	CL-202408273	200	10	210	0				0	2024-08-01 10:18:59	2024-08-01 10:18:59	\N	1	\N		2	49	\N	5
274	126	0	0.00	2024-08-01	02:30:02	\N	\N	3	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.18416608889479	55.260266303115785	Al Karama - Dubai - United Arab Emirates	25.24892040	55.30605510	49	CL-202408274	150	7.5	157.5	0				0	2024-08-01 10:30:10	2024-08-01 10:30:10	\N	1	\N		1	49	\N	5
275	85	0	262.50	2024-08-04	09:00:00	\N	\N	6	C8C8+WPQ, Officers Colony Rahim Yar Khan, Punjab 64200, Pakistan	28.42231174948137	70.3169699652839	\N	\N	\N	0	CL-202408275	250	12.5	262.5	0				0	2024-08-01 10:33:23	2024-08-01 10:33:23	\N	1	\N		0	\N	\N	5
276	142	1	70.00	2024-08-04	09:00:00	\N	\N	1	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan	33.566821555470106	73.13682116568089	\N	\N	\N	70	CL-202408276	10	3.5	73.5	0				0	2024-08-01 11:21:15	2024-08-01 11:21:15	\N	1	\N		0	70	1	5
277	10	1	340.00	2024-08-04	09:00:00	\N	\N	1	9FFF+96V, Tariqabad Bypass, Muzaffarabad	34.37365245796172	73.47329188138247	\N	\N	\N	61	CL-202408277	10	17	357	0				0	2024-08-01 11:22:21	2024-08-01 11:22:21	\N	1	\N		0	61,24	1,10	5
278	142	0	200.00	2024-08-04	09:00:00	\N	\N	6	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	33.56682183483611	73.13682183623314	\N	\N	\N	0	CL-202408278	10	10	210	0				0	2024-08-01 11:24:29	2024-08-01 11:24:29	\N	1	2		0	\N	\N	5
279	142	0	200.00	2024-08-01	16:25:16	\N	\N	3	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	33.5668212761041	73.1368201598525	419, PWD Housing Society Sector C PWD Society, Islamabad, Islamabad Capital Territory, Pakistan,	33.56957383	73.14124882	70	CL-202408279	10	10	210	0				0	2024-08-01 11:25:15	2024-08-01 11:25:15	\N	1	\N		2	70	\N	5
280	126	1	200.00	2024-08-04	09:00:00	\N	\N	1	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.18416608889479	55.260266303115785	\N	\N	\N	49	CL-202408280	10	10	210	0				0	2024-08-01 11:26:34	2024-08-01 11:26:34	\N	1	\N		0	49	1	5
281	126	10	70.00	2024-08-04	09:00:00	\N	\N	1	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.184182027818714	55.260334227205554	\N	\N	\N	49	CL-202408281	10	3.5	73.5	0				0	2024-08-01 12:08:08	2024-08-01 12:08:08	\N	2	\N		0	49	10	5
282	147	10	100.00	2024-07-22	12:00:00	\N	\N	1	\N	\N	\N	\N	\N	\N	74	CL-202408282	10	5.5	115.5	0				0	2024-08-01 12:11:24	2024-08-01 12:11:24	\N	2	\N		0	74	10	5
283	141	10	70.00	2024-08-05	12:00:00	\N	\N	1	Vukovarska ul. 8, 20000, Dubrovnik, Croatia	42.650660626142475	18.0944237485528	\N	\N	\N	79	CL-202408283	10	3.5	73.5	0				0	2024-08-01 12:44:40	2024-08-01 12:44:40	\N	1	\N		0	79	10	5
284	142	10	70.00	2024-08-05	12:00:00	\N	\N	1	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan	33.566820717372096	73.13682552427053	\N	\N	\N	70	CL-202408284	10	3.5	73.5	0				0	2024-08-01 13:32:49	2024-08-01 13:32:49	\N	1	\N		0	70	10	5
285	85	0	210.00	2024-08-01	19:45:53	\N	\N	3	C85G+9F, Rahim Yar Khan, Punjab, Pakistan	28.408345892237925	70.32619866910734	HF6G+85 Kot Samaba, Pakistan	28.56084289	70.47538955	77	CL-202408285	200	10	210	0				0	2024-08-01 14:45:57	2024-08-01 14:45:57	\N	1	\N		2	77	\N	5
286	85	0	200.00	2024-08-01	19:50:07	\N	\N	3	C85G+9F, Rahim Yar Khan, Punjab, Pakistan	28.408345892237925	70.32619866910734	GC5Q+HC4, Dari Azeem Khan, Rahim Yar Khan, Punjab, Pakistan	28.50946544	70.43897018	77	CL-202408286	200	0	200	0				0	2024-08-01 14:50:11	2024-08-01 14:50:11	\N	1	\N		2	77	\N	5
287	85	0	200.00	2024-08-01	19:51:26	\N	\N	3	C85G+9F, Rahim Yar Khan, Punjab, Pakistan	28.408180613592595	70.32619417679551	C9V2+87 Rahim Yar Khan, Pakistan	28.44329339	70.35065074	77	CL-202408287	200	10	210	0				0	2024-08-01 14:51:30	2024-08-01 14:51:30	\N	1	\N		2	77	\N	5
288	85	0	200.00	2024-08-01	20:07:23	\N	\N	3	C85G+9F, Rahim Yar Khan, Punjab, Pakistan	28.408345892237925	70.32619866910734	C88J+28C, Rahim Yar Khan, Punjab, Pakistan	28.41533014	70.33068974	77	CL-202408288	200	10	210	0				0	2024-08-01 15:07:38	2024-08-01 15:07:38	\N	1	\N		2	77	\N	5
289	126	1	200.00	2024-08-04	09:00:00	\N	\N	1	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.18416608889479	55.260266303115785	\N	\N	\N	49	CL-202408289	10	10	210	0				0	2024-08-01 15:38:20	2024-08-01 15:38:20	\N	1	\N		0	49	1	5
290	126	1	200.00	2024-08-06	14:00:00	\N	\N	1	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.18416608889479	55.260266303115785	\N	\N	\N	49	CL-202408290	10	10	210	0				0	2024-08-01 15:44:49	2024-08-01 15:44:49	\N	2	\N		0	49	1	5
291	142	10	70.00	2024-08-04	09:00:00	\N	\N	1	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	33.5164394137012	73.11084095388651	\N	\N	\N	70	CL-202408291	10	3.5	73.5	0				0	2024-08-01 16:31:36	2024-08-01 16:31:36	\N	2	\N		0	70	10	5
292	142	10	70.00	2024-08-04	09:00:00	\N	\N	1	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	33.5164394137012	73.11084095388651	\N	\N	\N	70	CL-202408292	10	3.5	73.5	0				0	2024-08-01 16:33:17	2024-08-01 16:33:17	\N	1	\N		0	70	10	5
293	148	10	70.00	2024-08-04	09:00:00	\N	\N	1	200 Geary St, San Francisco, CA 94102, USA	37.785834	-122.406417	\N	\N	\N	82	CL-202408293	10	3.5	73.5	0				0	2024-08-01 16:39:53	2024-08-01 16:39:53	\N	1	\N		0	82	10	5
294	148	1	270.00	2024-08-04	09:00:00	\N	\N	1	200 Geary St, San Francisco, CA 94102, USA	37.785834	-122.406417	\N	\N	\N	82	CL-202408294	10	13.5	283.5	0				0	2024-08-01 16:41:25	2024-08-01 16:41:25	\N	2	\N		0	82	1,10	5
295	142	0	60.00	2024-08-08	14:00:00	\N	\N	4	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	33.51642655537074	73.1108433008194	\N	\N	\N	87	CL-202408295	60	5	63	3	0		1	50	2024-08-01 20:05:22	2024-08-01 20:05:22	\N	1	\N		0	87,70	\N	5
296	10	0	230.00	2024-08-08	14:00:00	\N	\N	4	9FGG+WQ, Muzaffarabad,	34.37903713372788	73.47674489021301	\N	\N	\N	31	CL-202408296	230	5	241.5	1	1		1	70	2024-08-01 20:06:39	2024-08-01 20:06:39	\N	1	\N		0	31	\N	5
297	150	10	70.00	2024-08-05	12:00:00	\N	\N	1	200 Geary St, San Francisco, CA 94102, USA	37.785834	-122.406417	\N	\N	\N	95	CL-202408297	10	3.5	73.5	0				0	2024-08-01 21:31:19	2024-08-01 21:31:19	\N	1	\N		0	95	10	5
298	151	10	70.00	2024-08-04	09:00:00	\N	\N	1	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	33.51605777177182	73.11082564868869	\N	\N	\N	96	CL-202408298	10	3.5	73.5	0				0	2024-08-01 22:26:48	2024-08-01 22:26:48	\N	1	\N		0	96	10	5
299	151	1	270.00	2024-08-04	09:00:00	\N	\N	1	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	33.51604696242406	73.11083164297473	\N	\N	\N	96	CL-202408299	10	13.5	283.5	0				0	2024-08-01 22:45:47	2024-08-01 22:45:47	\N	1	\N		0	96	1,10	5
300	126	1	200.00	2024-08-04	09:00:00	\N	\N	1	building 4 SS Lootah - النهدة - النهدة ٢ - دبي - United Arab Emirates	25.28716633688968	55.371259449616076	\N	\N	\N	49	CL-202408300	10	10	210	0				0	2024-08-02 02:06:32	2024-08-02 02:06:32	\N	1	\N		0	49	1	5
301	152	0	105.00	2024-08-06	14:00:00	\N	\N	6	57M6+P43 - Business Bay - Dubai - United Arab Emirates	25.184166158998533	55.26026623584265	\N	\N	\N	0	CL-202408301	100	5	105	0				0	2024-08-02 13:05:21	2024-08-02 13:05:21	\N	2	\N		0	\N	\N	5
302	151	1	70.00	2024-08-03	09:00:00	\N	\N	1	5 Japan Rd, Sector F DHA Phase 1, Rawalpindi, Islamabad Capital Territory 46000, Pakistan	33.51606542841737	73.11079298620066	\N	\N	\N	96	CL-202408302	10	3.5	73.5	0				0	2024-08-02 20:26:02	2024-08-02 20:26:02	\N	1	\N		0	96	1	5
303	150	1	70.00	2024-08-03	09:00:00	\N	\N	1	200 Geary St, San Francisco, CA 94102, USA	37.785834	-122.406417	\N	\N	\N	95	CL-202408303	10	3.5	73.5	0				0	2024-08-02 21:16:42	2024-08-02 21:16:43	\N	2	\N		0	95	1	5
\.


--
-- Data for Name: booking_vehicle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_vehicle (id, vehicle_id, booking_id, created_at, updated_at) FROM stdin;
98	60	131	2024-07-30 11:15:48	2024-07-30 11:15:48
99	59	131	2024-07-30 11:15:48	2024-07-30 11:15:48
100	50	133	2024-07-30 11:16:36	2024-07-30 11:16:36
101	50	134	2024-07-30 11:17:31	2024-07-30 11:17:31
102	10	139	2024-07-30 11:48:40	2024-07-30 11:48:40
103	10	140	2024-07-30 11:49:17	2024-07-30 11:49:17
104	61	141	2024-07-30 11:52:27	2024-07-30 11:52:27
105	49	144	2024-07-30 14:57:21	2024-07-30 14:57:21
106	49	145	2024-07-30 14:57:26	2024-07-30 14:57:26
107	49	146	2024-07-30 14:59:39	2024-07-30 14:59:39
108	49	147	2024-07-30 14:59:43	2024-07-30 14:59:43
109	49	148	2024-07-30 15:08:07	2024-07-30 15:08:07
110	10	150	2024-07-30 15:30:14	2024-07-30 15:30:14
111	60	152	2024-07-30 15:59:01	2024-07-30 15:59:01
112	59	152	2024-07-30 15:59:01	2024-07-30 15:59:01
113	10	153	2024-07-30 16:47:43	2024-07-30 16:47:43
114	1	153	2024-07-30 16:47:43	2024-07-30 16:47:43
115	10	155	2024-07-30 17:00:33	2024-07-30 17:00:33
116	1	155	2024-07-30 17:00:33	2024-07-30 17:00:33
117	65	156	2024-07-30 17:10:53	2024-07-30 17:10:53
118	65	157	2024-07-30 17:18:17	2024-07-30 17:18:17
119	65	158	2024-07-30 17:21:07	2024-07-30 17:21:07
120	65	159	2024-07-30 17:30:28	2024-07-30 17:30:28
121	71	160	2024-07-30 17:50:43	2024-07-30 17:50:43
122	70	160	2024-07-30 17:50:43	2024-07-30 17:50:43
123	73	162	2024-07-30 18:10:40	2024-07-30 18:10:40
124	72	162	2024-07-30 18:10:40	2024-07-30 18:10:40
125	72	163	2024-07-30 18:26:13	2024-07-30 18:26:13
126	49	164	2024-07-30 18:54:09	2024-07-30 18:54:09
127	58	167	2024-07-30 19:33:09	2024-07-30 19:33:09
128	60	168	2024-07-30 19:42:14	2024-07-30 19:42:14
129	45	169	2024-07-31 03:32:26	2024-07-31 03:32:26
130	49	170	2024-07-31 03:36:48	2024-07-31 03:36:48
131	45	171	2024-07-31 03:39:00	2024-07-31 03:39:00
132	73	172	2024-07-31 06:13:07	2024-07-31 06:13:07
133	73	173	2024-07-31 11:08:06	2024-07-31 11:08:06
134	76	174	2024-07-31 11:32:47	2024-07-31 11:32:47
135	78	175	2024-08-01 07:02:55	2024-08-01 07:02:55
136	61	176	2024-08-01 08:25:40	2024-08-01 08:25:40
137	61	177	2024-08-01 08:27:02	2024-08-01 08:27:02
138	78	178	2024-08-01 08:50:22	2024-08-01 08:50:22
139	78	179	2024-08-01 09:39:45	2024-08-01 09:39:45
140	70	180	2024-08-01 09:48:36	2024-08-01 09:48:36
141	78	181	2024-08-01 09:50:21	2024-08-01 09:50:21
142	78	182	2024-08-01 10:06:11	2024-08-01 10:06:11
143	49	183	2024-08-01 10:19:00	2024-08-01 10:19:00
144	77	184	2024-08-01 10:19:53	2024-08-01 10:19:53
145	49	185	2024-08-01 10:30:10	2024-08-01 10:30:10
146	70	186	2024-08-01 11:21:16	2024-08-01 11:21:16
147	61	187	2024-08-01 11:22:22	2024-08-01 11:22:22
148	24	187	2024-08-01 11:22:22	2024-08-01 11:22:22
149	70	189	2024-08-01 11:25:16	2024-08-01 11:25:16
150	49	190	2024-08-01 11:26:35	2024-08-01 11:26:35
151	49	191	2024-08-01 12:08:36	2024-08-01 12:08:36
152	74	192	2024-08-01 12:11:37	2024-08-01 12:11:37
153	79	193	2024-08-01 12:44:41	2024-08-01 12:44:41
154	70	194	2024-08-01 13:32:50	2024-08-01 13:32:50
155	77	195	2024-08-01 14:45:58	2024-08-01 14:45:58
156	77	196	2024-08-01 14:50:12	2024-08-01 14:50:12
157	77	197	2024-08-01 14:51:30	2024-08-01 14:51:30
158	77	198	2024-08-01 15:07:40	2024-08-01 15:07:40
159	49	199	2024-08-01 15:38:21	2024-08-01 15:38:21
160	49	200	2024-08-01 15:46:14	2024-08-01 15:46:14
161	70	201	2024-08-01 16:33:18	2024-08-01 16:33:18
162	82	202	2024-08-01 16:39:54	2024-08-01 16:39:54
163	87	203	2024-08-01 20:05:22	2024-08-01 20:05:22
164	70	203	2024-08-01 20:05:22	2024-08-01 20:05:22
165	31	204	2024-08-01 20:06:40	2024-08-01 20:06:40
166	95	205	2024-08-01 21:31:20	2024-08-01 21:31:20
167	96	206	2024-08-01 22:26:50	2024-08-01 22:26:50
168	96	207	2024-08-01 22:45:48	2024-08-01 22:45:48
169	49	208	2024-08-02 02:06:32	2024-08-02 02:06:32
170	96	210	2024-08-02 20:26:02	2024-08-02 20:26:02
171	95	211	2024-08-02 21:16:52	2024-08-02 21:16:52
\.


--
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brand (id, name, industry_type, image, active, created_at, updated_at, deleted) FROM stdin;
1	Shampo Brand	0	6846752863483_1749447976.png	1	2025-06-09 05:41:39	2025-06-09 05:46:16	0
\.


--
-- Data for Name: breeds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.breeds (id, name, active, deleted, created_at, updated_at, species, room_type_id, appoint_time_id) FROM stdin;
\.


--
-- Data for Name: card_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.card_details (id, user_id, card_number, name, expiry, created_at, updated_at, "default") FROM stdin;
1	10	1223332322333	ASAD	12/25	2024-07-25 23:10:11	2024-07-25 23:10:11	0
2	127	1223332322333	RUSVIN	12/25	2024-07-29 07:15:42	2024-07-29 07:15:53	1
\.


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, product_id, product_attribute_id, quantity, user_id, store_id, device_cart_id, created_at, updated_at, service_id, item_type, price, car_id, time_slot, booking_date, service_booking_type, address_id) FROM stdin;
14	0	0	1	169	0	\N	2025-06-05 22:30:58	2025-06-05 22:30:58	1	1	38	107	\N	2025-06-06	1	16
18	0	0	1	169	0	\N	2025-06-06 06:55:28	2025-06-06 06:55:28	1	1	40.00	108	16:00:00	2025-06-10	2	16
27	0	0	1	126	0	\N	2025-06-06 17:34:51	2025-06-06 17:34:51	1	1	40.00	49	17:00:00	2025-06-06	2	18
30	0	0	1	126	0	\N	2025-06-07 10:31:49	2025-06-07 10:31:49	2	1	38	49	\N	2025-06-07	1	18
31	0	0	1	126	0	\N	2025-06-07 10:35:16	2025-06-07 10:35:16	2	1	40.00	45	17:00:00	2025-06-07	2	18
32	0	0	1	126	0	\N	2025-06-07 10:35:42	2025-06-07 10:35:42	2	1	40.00	49	17:00:00	2025-06-07	2	18
39	0	0	1	157	0	\N	2025-06-10 08:46:21	2025-06-10 08:46:21	1	1	40.00	105	12:00:00	2025-06-22	2	3
40	0	0	1	157	0	\N	2025-06-10 08:54:50	2025-06-10 08:54:50	7	1	9.5	105	12:00:00	2025-06-22	1	3
\.


--
-- Data for Name: cart_food; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_food (id, product_id, quantity, user_id, store_id, device_cart_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name, image, banner_image, parent_id, active, deleted, sort_order, created_uid, updated_uid, created_at, updated_at, slug, division_id, service_charge, description, category_unique_id) FROM stdin;
10	Hello	\N	\N	1	0	1	0	1	1	2025-05-29 10:44:12	2025-05-29 10:44:30	hello	0	10.00	<p>Hello</p>	A1951150
8	Hello	683839a8997de_1748515240.png	\N	0	0	1	12	1	1	2025-05-29 10:40:40	2025-05-29 10:53:41	hello	0	10.00	<p>hello</p>	A6282829
11	New Service	68383ab0f3c45_1748515504.png	\N	0	0	1	0	1	1	2025-05-29 10:45:05	2025-06-04 16:56:45	new-service	0	10.00	<p>Hello Services</p>	A8646825
1	Express Car Wash	68440b094d739_1749289737.png	\N	0	1	0	0	1	1	2024-05-07 09:56:17	2025-06-07 09:48:57	express-car-wash	0	40.00	<p>Hello</p>	\N
2	Car Wash	68440b587f084_1749289816.png	\N	0	1	0	0	1	1	2024-05-07 09:56:36	2025-06-07 09:50:16	car-wash	0	40.00	<p>hi</p>	\N
3	Interior Wash	68440b7586c49_1749289845.png	\N	0	1	0	0	1	1	2024-05-07 09:56:55	2025-06-07 09:50:45	interior-wash	0	50.00	<p>hi</p>	\N
6	Maid	/uploads/category/66839c29ea7f0_1719901225.png	\N	0	0	1	5	1	1	2024-07-02 06:19:47	2025-05-07 09:11:06	maid	0	70.00	\N	\N
4	Tinting	/uploads/category/66415ce413108_1715559652.png	\N	0	0	1	3	1	1	2024-05-07 09:57:21	2025-05-07 09:15:45	tinting	0	70.00	\N	\N
5	Repairing	/uploads/category/6639fb17d7525_1715075863.png	\N	0	0	1	4	1	1	2024-05-07 09:57:43	2025-05-07 09:15:57	repairing	0	40.00	\N	\N
7	Delivered with Care	6838396e95a2c_1748515182.jpg	\N	0	0	1	10	1	1	2025-05-29 10:39:42	2025-05-29 10:39:55	delivered-with-care	0	10.00	0	A2473902
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name, active, country_id, state_id, created_uid, updated_uid, deleted, created_at, updated_at) FROM stdin;
1	Dubai	1	1	1	1	\N	0	2024-05-07 10:22:38	2024-05-07 10:22:38
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

COPY public.contact_us_settings (id, title_en, title_ar, email, mobile, desc_en, desc_ar, location, latitude, longitude, twitter, instagram, facebook, youtube, linkedin, created_at, updated_at, available_time) FROM stdin;
1	Autosplash	\N	info@autosplash.com	971 1234567	\N	\N	673C+W8X - Al Safa St - Dubai - United Arab Emirates	\N	\N	https://x.com/dubai	https://www.instagram.com/autosplash	https://www.facebook.com/autosplash/	\N	\N	\N	2025-05-07 05:24:31	09:00 AM - 08:10 PM
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, name, prefix, dial_code, active, created_at, updated_at, deleted) FROM stdin;
1	United Arab Emirities	AE	971	1	2024-05-07 10:22:07	\N	0
\.


--
-- Data for Name: coupon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon (coupon_id, coupon_title, coupon_description, coupon_end_date, coupon_amount, coupon_minimum_spend, coupon_maximum_spend, coupon_usage_percoupon, coupon_usage_perx, coupon_usage_peruser, coupon_created_date, coupon_vender_id, coupon_code, coupon_status, individual_use, amount_type, created_at, updated_at, applied_to, start_date, minimum_amount) FROM stdin;
1	20% OFF	20% OFF	2025-06-13 00:00:00	20	\N	\N	\N	\N	\N	\N	0	20%	1	0	1	2025-06-06 06:33:49	\N	1	2025-06-06 00:00:00	20
\.


--
-- Data for Name: coupon_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coupon_category (id, coupon_id, category_id) FROM stdin;
1	1	1
2	1	2
3	1	3
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
1	Help Questian 1	Help answer	1	1	1	2024-07-26 08:28:13	2024-07-26 08:28:13
2	Help Question 2	Help Answer 2	1	1	1	2024-07-26 17:02:09	2024-07-26 17:02:09
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
-- Data for Name: maid_pricing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maid_pricing (id, hour, price, created_at, updated_at) FROM stdin;
1	1	100	2024-07-02 06:55:22	2024-07-02 06:55:22
2	2	200	2024-07-02 06:55:27	2024-07-02 06:55:34
3	3	250	2024-07-02 06:55:46	2024-07-02 06:55:46
\.


--
-- Data for Name: manufacturers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.manufacturers (id, name, logo, status, created_at, updated_at) FROM stdin;
1	Abarth	68440d6658591_1749290342.png	t	2024-05-07 10:46:16	2025-06-07 09:59:02
2	Acura	68440e44eeaf7_1749290564.jpg	t	2024-05-13 00:38:32	2025-06-07 10:02:45
3	Volkswagen	68440e6329056_1749290595.jpg	t	2024-05-13 00:38:56	2025-06-07 10:03:15
7	Aston Martin	68440e77a4737_1749290615.png	t	2024-05-13 00:42:26	2025-06-07 10:03:35
8	Audi	68440ecb3e3f7_1749290699.png	t	2024-05-13 00:42:58	2025-06-07 10:04:59
10	Cadillac	68440f123daf4_1749290770.jpg	t	2024-05-13 00:43:57	2025-06-07 10:06:10
5	Aprilia	68440f5e3a581_1749290846.jpg	t	2024-05-13 00:41:05	2025-06-07 10:07:26
6	Ferrari	68440f887ba06_1749290888.png	t	2024-05-13 00:41:46	2025-06-07 10:08:08
9	Aurus	6844131cbdd7f_1749291804.jpg	t	2024-05-13 00:43:28	2025-06-07 10:23:24
4	Alfa Romeo	6844134dc0b2d_1749291853.png	t	2024-05-13 00:40:32	2025-06-07 10:24:13
\.


--
-- Data for Name: membership_payment_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.membership_payment_reports (id, transaction_id, payment_status, user_id, ref_id, amount, method_type, vat, wallet_amount_used, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: memberships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.memberships (id, name, description, sort_order, price, image, active, deleted, body_wash_times, super_cleanline_shine_times, interior_cleaning_times, vip_member, preferred_ninja_id, recuring_schedule, additional_benefits, created_at, updated_at, package_validity, duration) FROM stdin;
1	Package1	<p>Cleanline Dry Wash Technology</p>	1	100.00	683e949b8aa4f_1748931739.jpeg	t	f	0	0	0	0	\N	\N	\N	2024-05-10 12:29:32	2025-06-03 06:22:19	\N	1
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
336	2024_05_07_083454_create_recovery_types_table	2
337	2024_05_07_090134_add_price_and_description_to_recovery_types_table	2
338	2024_05_07_093628_add_category_id_and_price_to_services_table	3
339	2024_05_08_112018_create_vehicle_types_table	4
340	2024_05_08_151804_create_bookings_table	5
341	2024_05_09_094906_add_ninja_id_to_bookings_table	6
342	2024_05_10_082201_create_tinting_brands_table	6
343	2024_05_10_094333_create_memberships_table	6
344	2024_05_10_102746_drop_foreign_key_from_booking_table	7
345	2024_05_10_114639_add_columns_to_booking_table	7
346	2024_05_10_134554_create_vehicles_table	8
347	2024_05_12_182104_add_name_to_vehicles_table	8
348	2024_05_12_185044_add_state_id_to_vehicles_table	8
349	2024_05_12_190122_add_plate_code_and_type_id_to_vehicles_table	8
350	2024_05_12_195256_add_service_charge_to_categories_table	8
351	2024_05_12_200312_make_manufacturer_id_nullable_in_vehicle_types_table	8
352	2024_05_12_202018_add_location_columns_to_booking_table	8
353	2024_05_12_232839_add_booking_id_to_bookings_table	9
354	2024_05_13_010421_add_color_id_to_vehicles_table	10
355	2024_05_14_064637_pricing	11
356	2024_05_14_101231_service_price	11
357	2024_05_20_012211_add_new_fields_to_bookings_table	12
358	2024_05_20_082840_front_glass	13
359	2024_05_20_092426_tinting_charge	14
360	2024_07_02_063458_maid_pricing	15
361	2024_07_20_102832_ninja_category_selected	16
362	2024_07_22_024228_card_details	17
363	2024_07_22_042800_booking_id	18
364	2024_07_22_045620_booking_temp	19
365	2024_07_22_052057_payment_type	19
366	2024_07_22_052527_payment_type1	19
367	2024_07_23_094025_status1	20
368	2024_07_24_100443_mute_order	21
369	2024_07_25_101912_hours	22
370	2024_07_25_101936_hours1	22
371	2024_07_25_104153_latitude	23
372	2024_07_25_105005_start_time	24
373	2024_07_25_123951_description	25
374	2024_07_25_124158_description1	25
375	2024_07_26_052801_removal_charge	26
376	2024_07_26_124125_recovery_type	27
377	2024_07_26_124132_recovery_type1	27
378	2024_07_26_155503_type_id	28
379	2024_07_26_161459_price_list	29
380	2024_07_26_164248_available_time	30
381	2024_07_29_043650_vehicle_list	31
382	2024_07_29_044822_booking_vehicle1	31
383	2024_07_29_044837_booking_service1	31
384	2024_07_29_064221_defaultabc	32
385	2024_07_29_114105_price	33
386	2024_07_30_070008_tax_per	34
387	2024_07_30_070019_tax_per1	34
388	2024_07_30_083952_booking_rejected	35
389	2024_08_03_043535_description122	36
390	2025_05_27_083952_unique_user_id	37
391	2025_05_27_083952_proof_id	38
392	2025_05_27_083952_years_experience	39
393	2025_05_27_083952_category_description	40
394	2025_06_03_083952_subscripton_services	41
395	2025_05_27_083952_package_validity	42
396	2025_05_27_083952_address_line	43
397	2025_05_27_083952_user_building	44
398	2025_06_03_083952_cart_service	45
399	2025_06_03_083952_cart_time_slot	46
400	2025_06_03_083952_cart_address_id	47
401	2025_06_03_083952_order_product_service	48
402	2025_06_03_083952_order_user	49
403	2025_06_03_083952_order_products	50
404	2025_06_09_083952_product_categories	51
405	2025_06_04_064750_add_fields_in_memberships_table	52
406	2025_06_09_070950_create_temp_memberships_table	52
407	2025_06_09_071130_create_temp_membership_services_table	52
408	2025_06_09_094008_create_membership_payment_reports_table	52
409	2025_06_09_101052_create_user_memberships_table	52
410	2025_06_09_123301_create_user_membership_services_table	52
411	2025_06_03_083952_prodct_columns	53
412	2025_06_09_184226_add_timestamps_to_product_images_table	54
413	2025_06_09_184606_drop_foreign_keys_from_product_images_table	55
\.


--
-- Data for Name: moda_main_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moda_main_categories (id, name, created_at, updated_at) FROM stdin;
1	Head	2024-05-03 09:20:24	\N
2	Upper Body	2024-05-03 09:20:24	\N
3	Lower Body	2024-05-03 09:20:24	\N
4	Footwear	2024-05-03 09:20:24	\N
5	Makeup	2024-05-03 09:20:24	\N
6	Accessories	2024-05-03 09:20:24	\N
\.


--
-- Data for Name: moda_sub_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moda_sub_categories (id, main_category, name, gender, image, active, sort_order, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mute_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mute_order (id, booking_id, user_id, created_at, updated_at) FROM stdin;
1	12	4	2024-07-24 12:19:23	2024-07-24 12:19:23
2	2	4	2024-07-24 12:31:28	2024-07-24 12:31:28
5	8	4	2024-07-24 12:43:46	2024-07-24 12:43:46
6	6	4	2024-07-24 12:43:46	2024-07-24 12:43:46
7	9	4	2024-07-24 12:43:46	2024-07-24 12:43:46
8	7	4	2024-07-24 12:43:46	2024-07-24 12:43:46
9	5	4	2024-07-24 12:43:46	2024-07-24 12:43:46
10	10	4	2024-07-24 12:43:46	2024-07-24 12:43:46
11	11	4	2024-07-24 12:43:46	2024-07-24 12:43:46
12	13	4	2024-07-24 12:43:46	2024-07-24 12:43:46
13	1	4	2024-07-24 12:43:46	2024-07-24 12:43:46
14	4	4	2024-07-24 12:43:46	2024-07-24 12:43:46
15	3	4	2024-07-24 12:43:46	2024-07-24 12:43:46
16	14	4	2024-07-25 07:52:01	2024-07-25 07:52:01
17	15	4	2024-07-25 09:02:43	2024-07-25 09:02:43
18	16	4	2024-07-25 09:24:12	2024-07-25 09:24:12
19	17	4	2024-07-25 09:24:12	2024-07-25 09:24:12
20	18	4	2024-07-25 09:58:16	2024-07-25 09:58:16
21	19	4	2024-07-25 10:50:10	2024-07-25 10:50:10
22	20	4	2024-07-25 10:50:49	2024-07-25 10:50:49
23	21	4	2024-07-25 10:58:56	2024-07-25 10:58:56
24	22	4	2024-07-25 10:59:20	2024-07-25 10:59:20
25	23	4	2024-07-25 11:20:41	2024-07-25 11:20:41
26	24	4	2024-07-25 11:20:46	2024-07-25 11:20:46
27	25	4	2024-07-25 11:21:11	2024-07-25 11:21:11
28	26	4	2024-07-25 11:21:37	2024-07-25 11:21:37
29	27	4	2024-07-25 11:21:41	2024-07-25 11:21:41
30	28	4	2024-07-25 11:22:19	2024-07-25 11:22:19
31	30	4	2024-07-25 13:28:19	2024-07-25 13:28:19
32	29	4	2024-07-25 13:28:19	2024-07-25 13:28:19
33	31	4	2024-07-25 13:28:19	2024-07-25 13:28:19
34	32	4	2024-07-25 13:28:19	2024-07-25 13:28:19
35	33	4	2024-07-25 13:28:19	2024-07-25 13:28:19
36	34	4	2024-07-25 13:28:19	2024-07-25 13:28:19
37	35	4	2024-07-25 15:29:37	2024-07-25 15:29:37
38	36	4	2024-07-25 17:10:06	2024-07-25 17:10:06
39	37	4	2024-07-25 17:30:11	2024-07-25 17:30:11
40	38	4	2024-07-25 17:36:43	2024-07-25 17:36:43
41	39	4	2024-07-25 17:47:03	2024-07-25 17:47:03
42	40	4	2024-07-25 19:11:26	2024-07-25 19:11:26
43	41	4	2024-07-25 19:38:44	2024-07-25 19:38:44
44	42	4	2024-07-26 09:09:40	2024-07-26 09:09:40
45	43	4	2024-07-26 09:09:40	2024-07-26 09:09:40
46	44	4	2024-07-26 09:09:40	2024-07-26 09:09:40
47	45	4	2024-07-26 09:09:40	2024-07-26 09:09:40
48	46	4	2024-07-26 09:29:36	2024-07-26 09:29:36
49	47	4	2024-07-26 09:43:30	2024-07-26 09:43:30
50	48	4	2024-07-26 10:03:11	2024-07-26 10:03:11
51	49	4	2024-07-26 10:07:51	2024-07-26 10:07:51
52	50	4	2024-07-26 10:10:17	2024-07-26 10:10:17
53	51	4	2024-07-26 10:15:51	2024-07-26 10:15:51
54	52	4	2024-07-26 15:03:50	2024-07-26 15:03:50
55	53	4	2024-07-26 19:43:51	2024-07-26 19:43:51
56	54	4	2024-07-29 06:09:11	2024-07-29 06:09:11
57	55	4	2024-07-29 06:09:11	2024-07-29 06:09:11
58	56	4	2024-07-29 06:09:11	2024-07-29 06:09:11
59	57	4	2024-07-29 06:28:06	2024-07-29 06:28:06
60	58	4	2024-07-29 09:19:53	2024-07-29 09:19:53
61	59	4	2024-07-29 09:21:50	2024-07-29 09:21:50
62	60	4	2024-07-29 09:27:07	2024-07-29 09:27:07
63	61	4	2024-07-29 09:28:42	2024-07-29 09:28:42
64	62	4	2024-07-29 09:36:06	2024-07-29 09:36:06
65	63	4	2024-07-29 09:40:08	2024-07-29 09:40:08
66	64	4	2024-07-29 09:41:35	2024-07-29 09:41:35
67	65	4	2024-07-29 09:55:17	2024-07-29 09:55:17
68	66	4	2024-07-29 10:42:38	2024-07-29 10:42:38
69	67	4	2024-07-29 10:42:38	2024-07-29 10:42:38
70	68	4	2024-07-29 12:15:01	2024-07-29 12:15:01
71	69	4	2024-07-29 12:15:01	2024-07-29 12:15:01
72	70	4	2024-07-29 12:15:01	2024-07-29 12:15:01
73	71	4	2024-07-29 12:15:01	2024-07-29 12:15:01
74	72	4	2024-07-29 12:15:01	2024-07-29 12:15:01
75	73	4	2024-07-29 12:16:47	2024-07-29 12:16:47
76	74	4	2024-07-29 15:14:28	2024-07-29 15:14:28
77	75	4	2024-07-29 15:14:28	2024-07-29 15:14:28
78	76	4	2024-07-29 15:59:40	2024-07-29 15:59:40
79	77	4	2024-07-29 16:01:44	2024-07-29 16:01:44
80	78	4	2024-07-29 16:04:25	2024-07-29 16:04:25
81	79	4	2024-07-29 16:06:16	2024-07-29 16:06:16
82	80	4	2024-07-29 17:14:07	2024-07-29 17:14:07
83	81	4	2024-07-29 17:26:50	2024-07-29 17:26:50
84	82	4	2024-07-29 17:35:49	2024-07-29 17:35:49
85	83	4	2024-07-29 17:47:27	2024-07-29 17:47:27
86	85	4	2024-07-29 19:23:14	2024-07-29 19:23:14
87	84	4	2024-07-29 19:23:20	2024-07-29 19:23:20
88	88	4	2024-07-29 21:16:56	2024-07-29 21:16:56
89	86	4	2024-07-29 21:16:56	2024-07-29 21:16:56
90	87	4	2024-07-29 21:16:56	2024-07-29 21:16:56
91	90	4	2024-07-29 21:21:31	2024-07-29 21:21:31
92	89	4	2024-07-29 21:21:31	2024-07-29 21:21:31
93	91	4	2024-07-29 21:27:11	2024-07-29 21:27:11
94	92	4	2024-07-29 21:27:46	2024-07-29 21:27:46
95	93	4	2024-07-29 21:28:58	2024-07-29 21:28:58
96	94	4	2024-07-29 21:31:58	2024-07-29 21:31:58
97	95	4	2024-07-29 21:33:35	2024-07-29 21:33:35
98	96	4	2024-07-29 21:33:35	2024-07-29 21:33:35
99	97	4	2024-07-29 21:38:20	2024-07-29 21:38:20
100	98	4	2024-07-29 21:41:40	2024-07-29 21:41:40
101	99	4	2024-07-29 21:49:42	2024-07-29 21:49:42
102	100	4	2024-07-29 21:58:17	2024-07-29 21:58:17
103	101	4	2024-07-29 22:21:00	2024-07-29 22:21:00
104	102	4	2024-07-29 22:23:44	2024-07-29 22:23:44
105	103	4	2024-07-29 22:50:44	2024-07-29 22:50:44
106	100	134	2024-07-30 04:55:01	2024-07-30 04:55:01
107	89	134	2024-07-30 05:04:13	2024-07-30 05:04:13
108	94	134	2024-07-30 05:05:11	2024-07-30 05:05:11
109	98	134	2024-07-30 05:06:38	2024-07-30 05:06:38
110	103	135	2024-07-30 05:40:52	2024-07-30 05:40:52
111	105	135	2024-07-30 06:07:21	2024-07-30 06:07:21
112	104	135	2024-07-30 06:25:09	2024-07-30 06:25:09
113	100	135	2024-07-30 06:28:49	2024-07-30 06:28:49
114	99	135	2024-07-30 06:32:26	2024-07-30 06:32:26
115	75	135	2024-07-30 06:33:29	2024-07-30 06:33:29
116	94	135	2024-07-30 06:44:27	2024-07-30 06:44:27
117	8	135	2024-07-30 06:48:07	2024-07-30 06:48:07
118	6	135	2024-07-30 06:48:07	2024-07-30 06:48:07
119	9	135	2024-07-30 06:48:07	2024-07-30 06:48:07
120	7	135	2024-07-30 06:48:07	2024-07-30 06:48:07
121	5	135	2024-07-30 06:48:07	2024-07-30 06:48:07
122	11	135	2024-07-30 06:48:07	2024-07-30 06:48:07
123	12	135	2024-07-30 06:48:07	2024-07-30 06:48:07
124	1	135	2024-07-30 06:48:07	2024-07-30 06:48:07
125	2	135	2024-07-30 06:48:07	2024-07-30 06:48:07
126	4	135	2024-07-30 06:48:07	2024-07-30 06:48:07
127	14	135	2024-07-30 06:48:07	2024-07-30 06:48:07
128	3	135	2024-07-30 06:48:07	2024-07-30 06:48:07
129	10	135	2024-07-30 06:48:07	2024-07-30 06:48:07
130	16	135	2024-07-30 06:48:07	2024-07-30 06:48:07
131	17	135	2024-07-30 06:48:07	2024-07-30 06:48:07
132	18	135	2024-07-30 06:48:07	2024-07-30 06:48:07
133	26	135	2024-07-30 06:48:07	2024-07-30 06:48:07
134	13	135	2024-07-30 06:48:07	2024-07-30 06:48:07
135	19	135	2024-07-30 06:48:07	2024-07-30 06:48:07
136	20	135	2024-07-30 06:48:07	2024-07-30 06:48:07
137	15	135	2024-07-30 06:48:07	2024-07-30 06:48:07
138	22	135	2024-07-30 06:48:07	2024-07-30 06:48:07
139	23	135	2024-07-30 06:48:07	2024-07-30 06:48:07
140	24	135	2024-07-30 06:48:07	2024-07-30 06:48:07
141	25	135	2024-07-30 06:48:07	2024-07-30 06:48:07
142	27	135	2024-07-30 06:48:07	2024-07-30 06:48:07
143	30	135	2024-07-30 06:48:08	2024-07-30 06:48:08
144	28	135	2024-07-30 06:48:08	2024-07-30 06:48:08
145	29	135	2024-07-30 06:48:08	2024-07-30 06:48:08
146	31	135	2024-07-30 06:48:08	2024-07-30 06:48:08
147	32	135	2024-07-30 06:48:08	2024-07-30 06:48:08
148	33	135	2024-07-30 06:48:08	2024-07-30 06:48:08
149	21	135	2024-07-30 06:48:08	2024-07-30 06:48:08
150	34	135	2024-07-30 06:48:08	2024-07-30 06:48:08
151	35	135	2024-07-30 06:48:08	2024-07-30 06:48:08
152	47	135	2024-07-30 06:48:08	2024-07-30 06:48:08
153	48	135	2024-07-30 06:48:08	2024-07-30 06:48:08
154	37	135	2024-07-30 06:48:08	2024-07-30 06:48:08
155	38	135	2024-07-30 06:48:08	2024-07-30 06:48:08
156	36	135	2024-07-30 06:48:08	2024-07-30 06:48:08
157	39	135	2024-07-30 06:48:08	2024-07-30 06:48:08
158	40	135	2024-07-30 06:48:08	2024-07-30 06:48:08
159	49	135	2024-07-30 06:48:08	2024-07-30 06:48:08
160	41	135	2024-07-30 06:48:08	2024-07-30 06:48:08
161	42	135	2024-07-30 06:48:08	2024-07-30 06:48:08
162	43	135	2024-07-30 06:48:08	2024-07-30 06:48:08
163	44	135	2024-07-30 06:48:08	2024-07-30 06:48:08
164	45	135	2024-07-30 06:48:08	2024-07-30 06:48:08
165	46	135	2024-07-30 06:48:08	2024-07-30 06:48:08
166	50	135	2024-07-30 06:48:08	2024-07-30 06:48:08
167	54	135	2024-07-30 06:48:08	2024-07-30 06:48:08
168	52	135	2024-07-30 06:48:08	2024-07-30 06:48:08
169	51	135	2024-07-30 06:48:08	2024-07-30 06:48:08
170	55	135	2024-07-30 06:48:08	2024-07-30 06:48:08
171	53	135	2024-07-30 06:48:08	2024-07-30 06:48:08
172	56	135	2024-07-30 06:48:08	2024-07-30 06:48:08
173	57	135	2024-07-30 06:48:08	2024-07-30 06:48:08
174	58	135	2024-07-30 06:48:08	2024-07-30 06:48:08
175	62	135	2024-07-30 06:48:08	2024-07-30 06:48:08
176	59	135	2024-07-30 06:48:08	2024-07-30 06:48:08
177	60	135	2024-07-30 06:48:08	2024-07-30 06:48:08
178	61	135	2024-07-30 06:48:08	2024-07-30 06:48:08
179	63	135	2024-07-30 06:48:08	2024-07-30 06:48:08
180	64	135	2024-07-30 06:48:09	2024-07-30 06:48:09
181	65	135	2024-07-30 06:48:09	2024-07-30 06:48:09
182	66	135	2024-07-30 06:48:09	2024-07-30 06:48:09
183	67	135	2024-07-30 06:48:09	2024-07-30 06:48:09
184	68	135	2024-07-30 06:48:09	2024-07-30 06:48:09
185	69	135	2024-07-30 06:48:09	2024-07-30 06:48:09
186	70	135	2024-07-30 06:48:09	2024-07-30 06:48:09
187	71	135	2024-07-30 06:48:09	2024-07-30 06:48:09
188	72	135	2024-07-30 06:48:09	2024-07-30 06:48:09
189	73	135	2024-07-30 06:48:09	2024-07-30 06:48:09
190	74	135	2024-07-30 06:48:09	2024-07-30 06:48:09
191	75	135	2024-07-30 06:48:09	2024-07-30 06:48:09
192	76	135	2024-07-30 06:48:09	2024-07-30 06:48:09
193	77	135	2024-07-30 06:48:09	2024-07-30 06:48:09
194	78	135	2024-07-30 06:48:09	2024-07-30 06:48:09
195	79	135	2024-07-30 06:48:09	2024-07-30 06:48:09
196	80	135	2024-07-30 06:48:09	2024-07-30 06:48:09
197	81	135	2024-07-30 06:48:09	2024-07-30 06:48:09
198	82	135	2024-07-30 06:48:09	2024-07-30 06:48:09
199	83	135	2024-07-30 06:48:09	2024-07-30 06:48:09
200	84	135	2024-07-30 06:48:09	2024-07-30 06:48:09
201	90	135	2024-07-30 06:48:09	2024-07-30 06:48:09
202	85	135	2024-07-30 06:48:09	2024-07-30 06:48:09
203	86	135	2024-07-30 06:48:09	2024-07-30 06:48:09
204	88	135	2024-07-30 06:48:09	2024-07-30 06:48:09
205	87	135	2024-07-30 06:48:09	2024-07-30 06:48:09
206	89	135	2024-07-30 06:48:10	2024-07-30 06:48:10
207	91	135	2024-07-30 06:48:10	2024-07-30 06:48:10
208	92	135	2024-07-30 06:48:10	2024-07-30 06:48:10
209	93	135	2024-07-30 06:48:10	2024-07-30 06:48:10
210	94	135	2024-07-30 06:48:10	2024-07-30 06:48:10
211	95	135	2024-07-30 06:48:10	2024-07-30 06:48:10
212	96	135	2024-07-30 06:48:10	2024-07-30 06:48:10
213	97	135	2024-07-30 06:48:10	2024-07-30 06:48:10
214	98	135	2024-07-30 06:48:10	2024-07-30 06:48:10
215	99	135	2024-07-30 06:48:10	2024-07-30 06:48:10
216	100	135	2024-07-30 06:48:10	2024-07-30 06:48:10
217	101	135	2024-07-30 06:48:10	2024-07-30 06:48:10
218	102	135	2024-07-30 06:48:10	2024-07-30 06:48:10
219	103	135	2024-07-30 06:48:10	2024-07-30 06:48:10
220	104	135	2024-07-30 06:48:10	2024-07-30 06:48:10
221	105	135	2024-07-30 06:48:10	2024-07-30 06:48:10
222	105	136	2024-07-30 06:54:31	2024-07-30 06:54:31
223	8	136	2024-07-30 06:54:59	2024-07-30 06:54:59
224	6	136	2024-07-30 06:54:59	2024-07-30 06:54:59
225	9	136	2024-07-30 06:54:59	2024-07-30 06:54:59
226	7	136	2024-07-30 06:54:59	2024-07-30 06:54:59
227	5	136	2024-07-30 06:54:59	2024-07-30 06:54:59
228	11	136	2024-07-30 06:54:59	2024-07-30 06:54:59
229	12	136	2024-07-30 06:54:59	2024-07-30 06:54:59
230	1	136	2024-07-30 06:54:59	2024-07-30 06:54:59
231	2	136	2024-07-30 06:54:59	2024-07-30 06:54:59
232	4	136	2024-07-30 06:54:59	2024-07-30 06:54:59
233	14	136	2024-07-30 06:54:59	2024-07-30 06:54:59
234	3	136	2024-07-30 06:54:59	2024-07-30 06:54:59
235	10	136	2024-07-30 06:54:59	2024-07-30 06:54:59
236	16	136	2024-07-30 06:54:59	2024-07-30 06:54:59
237	17	136	2024-07-30 06:54:59	2024-07-30 06:54:59
238	18	136	2024-07-30 06:54:59	2024-07-30 06:54:59
239	26	136	2024-07-30 06:54:59	2024-07-30 06:54:59
240	13	136	2024-07-30 06:54:59	2024-07-30 06:54:59
241	19	136	2024-07-30 06:54:59	2024-07-30 06:54:59
242	20	136	2024-07-30 06:54:59	2024-07-30 06:54:59
243	15	136	2024-07-30 06:54:59	2024-07-30 06:54:59
244	22	136	2024-07-30 06:54:59	2024-07-30 06:54:59
245	23	136	2024-07-30 06:54:59	2024-07-30 06:54:59
246	24	136	2024-07-30 06:54:59	2024-07-30 06:54:59
247	25	136	2024-07-30 06:54:59	2024-07-30 06:54:59
248	27	136	2024-07-30 06:54:59	2024-07-30 06:54:59
249	30	136	2024-07-30 06:54:59	2024-07-30 06:54:59
250	28	136	2024-07-30 06:54:59	2024-07-30 06:54:59
251	29	136	2024-07-30 06:54:59	2024-07-30 06:54:59
252	31	136	2024-07-30 06:54:59	2024-07-30 06:54:59
253	32	136	2024-07-30 06:54:59	2024-07-30 06:54:59
254	33	136	2024-07-30 06:54:59	2024-07-30 06:54:59
255	21	136	2024-07-30 06:54:59	2024-07-30 06:54:59
256	34	136	2024-07-30 06:54:59	2024-07-30 06:54:59
257	35	136	2024-07-30 06:54:59	2024-07-30 06:54:59
258	47	136	2024-07-30 06:54:59	2024-07-30 06:54:59
259	48	136	2024-07-30 06:54:59	2024-07-30 06:54:59
260	37	136	2024-07-30 06:54:59	2024-07-30 06:54:59
261	38	136	2024-07-30 06:54:59	2024-07-30 06:54:59
262	36	136	2024-07-30 06:54:59	2024-07-30 06:54:59
263	39	136	2024-07-30 06:54:59	2024-07-30 06:54:59
264	40	136	2024-07-30 06:54:59	2024-07-30 06:54:59
265	49	136	2024-07-30 06:54:59	2024-07-30 06:54:59
266	41	136	2024-07-30 06:54:59	2024-07-30 06:54:59
267	42	136	2024-07-30 06:54:59	2024-07-30 06:54:59
268	43	136	2024-07-30 06:54:59	2024-07-30 06:54:59
269	44	136	2024-07-30 06:54:59	2024-07-30 06:54:59
270	45	136	2024-07-30 06:54:59	2024-07-30 06:54:59
271	46	136	2024-07-30 06:54:59	2024-07-30 06:54:59
272	50	136	2024-07-30 06:54:59	2024-07-30 06:54:59
273	54	136	2024-07-30 06:54:59	2024-07-30 06:54:59
274	52	136	2024-07-30 06:54:59	2024-07-30 06:54:59
275	51	136	2024-07-30 06:54:59	2024-07-30 06:54:59
276	55	136	2024-07-30 06:54:59	2024-07-30 06:54:59
277	53	136	2024-07-30 06:54:59	2024-07-30 06:54:59
278	56	136	2024-07-30 06:54:59	2024-07-30 06:54:59
279	57	136	2024-07-30 06:54:59	2024-07-30 06:54:59
280	58	136	2024-07-30 06:54:59	2024-07-30 06:54:59
281	62	136	2024-07-30 06:54:59	2024-07-30 06:54:59
282	59	136	2024-07-30 06:54:59	2024-07-30 06:54:59
283	60	136	2024-07-30 06:54:59	2024-07-30 06:54:59
284	61	136	2024-07-30 06:54:59	2024-07-30 06:54:59
285	63	136	2024-07-30 06:54:59	2024-07-30 06:54:59
286	64	136	2024-07-30 06:54:59	2024-07-30 06:54:59
287	65	136	2024-07-30 06:54:59	2024-07-30 06:54:59
288	66	136	2024-07-30 06:54:59	2024-07-30 06:54:59
289	67	136	2024-07-30 06:54:59	2024-07-30 06:54:59
290	68	136	2024-07-30 06:54:59	2024-07-30 06:54:59
291	69	136	2024-07-30 06:54:59	2024-07-30 06:54:59
292	70	136	2024-07-30 06:54:59	2024-07-30 06:54:59
293	71	136	2024-07-30 06:54:59	2024-07-30 06:54:59
294	72	136	2024-07-30 06:54:59	2024-07-30 06:54:59
295	73	136	2024-07-30 06:54:59	2024-07-30 06:54:59
296	74	136	2024-07-30 06:54:59	2024-07-30 06:54:59
297	75	136	2024-07-30 06:54:59	2024-07-30 06:54:59
298	76	136	2024-07-30 06:54:59	2024-07-30 06:54:59
299	77	136	2024-07-30 06:54:59	2024-07-30 06:54:59
300	78	136	2024-07-30 06:54:59	2024-07-30 06:54:59
301	79	136	2024-07-30 06:54:59	2024-07-30 06:54:59
302	80	136	2024-07-30 06:54:59	2024-07-30 06:54:59
303	81	136	2024-07-30 06:54:59	2024-07-30 06:54:59
304	82	136	2024-07-30 06:54:59	2024-07-30 06:54:59
305	83	136	2024-07-30 06:54:59	2024-07-30 06:54:59
306	84	136	2024-07-30 06:54:59	2024-07-30 06:54:59
307	90	136	2024-07-30 06:54:59	2024-07-30 06:54:59
308	85	136	2024-07-30 06:54:59	2024-07-30 06:54:59
309	86	136	2024-07-30 06:54:59	2024-07-30 06:54:59
310	88	136	2024-07-30 06:54:59	2024-07-30 06:54:59
311	87	136	2024-07-30 06:54:59	2024-07-30 06:54:59
312	89	136	2024-07-30 06:54:59	2024-07-30 06:54:59
313	91	136	2024-07-30 06:54:59	2024-07-30 06:54:59
314	92	136	2024-07-30 06:54:59	2024-07-30 06:54:59
315	93	136	2024-07-30 06:54:59	2024-07-30 06:54:59
316	94	136	2024-07-30 06:54:59	2024-07-30 06:54:59
317	95	136	2024-07-30 06:54:59	2024-07-30 06:54:59
318	96	136	2024-07-30 06:54:59	2024-07-30 06:54:59
319	97	136	2024-07-30 06:54:59	2024-07-30 06:54:59
320	98	136	2024-07-30 06:54:59	2024-07-30 06:54:59
321	99	136	2024-07-30 06:54:59	2024-07-30 06:54:59
322	100	136	2024-07-30 06:54:59	2024-07-30 06:54:59
323	101	136	2024-07-30 06:55:00	2024-07-30 06:55:00
324	102	136	2024-07-30 06:55:00	2024-07-30 06:55:00
325	103	136	2024-07-30 06:55:00	2024-07-30 06:55:00
326	104	136	2024-07-30 06:55:00	2024-07-30 06:55:00
327	105	136	2024-07-30 06:55:00	2024-07-30 06:55:00
328	8	4	2024-07-30 06:56:50	2024-07-30 06:56:50
329	6	4	2024-07-30 06:56:50	2024-07-30 06:56:50
330	9	4	2024-07-30 06:56:50	2024-07-30 06:56:50
331	7	4	2024-07-30 06:56:50	2024-07-30 06:56:50
332	5	4	2024-07-30 06:56:50	2024-07-30 06:56:50
333	11	4	2024-07-30 06:56:50	2024-07-30 06:56:50
334	12	4	2024-07-30 06:56:50	2024-07-30 06:56:50
335	1	4	2024-07-30 06:56:50	2024-07-30 06:56:50
336	2	4	2024-07-30 06:56:50	2024-07-30 06:56:50
337	4	4	2024-07-30 06:56:50	2024-07-30 06:56:50
338	14	4	2024-07-30 06:56:50	2024-07-30 06:56:50
339	3	4	2024-07-30 06:56:50	2024-07-30 06:56:50
340	10	4	2024-07-30 06:56:50	2024-07-30 06:56:50
341	16	4	2024-07-30 06:56:50	2024-07-30 06:56:50
342	17	4	2024-07-30 06:56:50	2024-07-30 06:56:50
343	18	4	2024-07-30 06:56:50	2024-07-30 06:56:50
344	26	4	2024-07-30 06:56:50	2024-07-30 06:56:50
345	13	4	2024-07-30 06:56:50	2024-07-30 06:56:50
346	19	4	2024-07-30 06:56:50	2024-07-30 06:56:50
347	20	4	2024-07-30 06:56:50	2024-07-30 06:56:50
348	15	4	2024-07-30 06:56:50	2024-07-30 06:56:50
349	22	4	2024-07-30 06:56:50	2024-07-30 06:56:50
350	23	4	2024-07-30 06:56:50	2024-07-30 06:56:50
351	24	4	2024-07-30 06:56:50	2024-07-30 06:56:50
352	25	4	2024-07-30 06:56:50	2024-07-30 06:56:50
353	27	4	2024-07-30 06:56:50	2024-07-30 06:56:50
354	30	4	2024-07-30 06:56:50	2024-07-30 06:56:50
355	28	4	2024-07-30 06:56:50	2024-07-30 06:56:50
356	29	4	2024-07-30 06:56:50	2024-07-30 06:56:50
357	31	4	2024-07-30 06:56:50	2024-07-30 06:56:50
358	32	4	2024-07-30 06:56:50	2024-07-30 06:56:50
359	33	4	2024-07-30 06:56:50	2024-07-30 06:56:50
360	21	4	2024-07-30 06:56:50	2024-07-30 06:56:50
361	34	4	2024-07-30 06:56:50	2024-07-30 06:56:50
362	35	4	2024-07-30 06:56:50	2024-07-30 06:56:50
363	47	4	2024-07-30 06:56:50	2024-07-30 06:56:50
364	48	4	2024-07-30 06:56:50	2024-07-30 06:56:50
365	37	4	2024-07-30 06:56:50	2024-07-30 06:56:50
366	38	4	2024-07-30 06:56:50	2024-07-30 06:56:50
367	36	4	2024-07-30 06:56:50	2024-07-30 06:56:50
368	39	4	2024-07-30 06:56:50	2024-07-30 06:56:50
369	40	4	2024-07-30 06:56:50	2024-07-30 06:56:50
370	49	4	2024-07-30 06:56:50	2024-07-30 06:56:50
371	41	4	2024-07-30 06:56:50	2024-07-30 06:56:50
372	42	4	2024-07-30 06:56:50	2024-07-30 06:56:50
373	43	4	2024-07-30 06:56:50	2024-07-30 06:56:50
374	44	4	2024-07-30 06:56:50	2024-07-30 06:56:50
375	45	4	2024-07-30 06:56:50	2024-07-30 06:56:50
376	46	4	2024-07-30 06:56:50	2024-07-30 06:56:50
377	50	4	2024-07-30 06:56:50	2024-07-30 06:56:50
378	54	4	2024-07-30 06:56:50	2024-07-30 06:56:50
379	52	4	2024-07-30 06:56:50	2024-07-30 06:56:50
380	51	4	2024-07-30 06:56:50	2024-07-30 06:56:50
381	55	4	2024-07-30 06:56:50	2024-07-30 06:56:50
382	53	4	2024-07-30 06:56:50	2024-07-30 06:56:50
383	56	4	2024-07-30 06:56:50	2024-07-30 06:56:50
384	57	4	2024-07-30 06:56:50	2024-07-30 06:56:50
385	58	4	2024-07-30 06:56:50	2024-07-30 06:56:50
386	62	4	2024-07-30 06:56:50	2024-07-30 06:56:50
387	59	4	2024-07-30 06:56:50	2024-07-30 06:56:50
388	60	4	2024-07-30 06:56:50	2024-07-30 06:56:50
389	61	4	2024-07-30 06:56:50	2024-07-30 06:56:50
390	63	4	2024-07-30 06:56:50	2024-07-30 06:56:50
391	64	4	2024-07-30 06:56:50	2024-07-30 06:56:50
392	65	4	2024-07-30 06:56:50	2024-07-30 06:56:50
393	66	4	2024-07-30 06:56:50	2024-07-30 06:56:50
394	67	4	2024-07-30 06:56:50	2024-07-30 06:56:50
395	68	4	2024-07-30 06:56:50	2024-07-30 06:56:50
396	69	4	2024-07-30 06:56:50	2024-07-30 06:56:50
397	70	4	2024-07-30 06:56:50	2024-07-30 06:56:50
398	71	4	2024-07-30 06:56:50	2024-07-30 06:56:50
399	72	4	2024-07-30 06:56:50	2024-07-30 06:56:50
400	73	4	2024-07-30 06:56:50	2024-07-30 06:56:50
401	74	4	2024-07-30 06:56:50	2024-07-30 06:56:50
402	75	4	2024-07-30 06:56:50	2024-07-30 06:56:50
403	76	4	2024-07-30 06:56:50	2024-07-30 06:56:50
404	77	4	2024-07-30 06:56:50	2024-07-30 06:56:50
405	78	4	2024-07-30 06:56:50	2024-07-30 06:56:50
406	79	4	2024-07-30 06:56:50	2024-07-30 06:56:50
407	80	4	2024-07-30 06:56:50	2024-07-30 06:56:50
408	81	4	2024-07-30 06:56:50	2024-07-30 06:56:50
409	82	4	2024-07-30 06:56:50	2024-07-30 06:56:50
410	83	4	2024-07-30 06:56:50	2024-07-30 06:56:50
411	84	4	2024-07-30 06:56:50	2024-07-30 06:56:50
412	90	4	2024-07-30 06:56:50	2024-07-30 06:56:50
413	85	4	2024-07-30 06:56:50	2024-07-30 06:56:50
414	86	4	2024-07-30 06:56:50	2024-07-30 06:56:50
415	88	4	2024-07-30 06:56:50	2024-07-30 06:56:50
416	87	4	2024-07-30 06:56:50	2024-07-30 06:56:50
417	89	4	2024-07-30 06:56:50	2024-07-30 06:56:50
418	91	4	2024-07-30 06:56:50	2024-07-30 06:56:50
419	92	4	2024-07-30 06:56:50	2024-07-30 06:56:50
420	93	4	2024-07-30 06:56:50	2024-07-30 06:56:50
421	94	4	2024-07-30 06:56:50	2024-07-30 06:56:50
422	95	4	2024-07-30 06:56:50	2024-07-30 06:56:50
423	96	4	2024-07-30 06:56:50	2024-07-30 06:56:50
424	97	4	2024-07-30 06:56:50	2024-07-30 06:56:50
425	98	4	2024-07-30 06:56:50	2024-07-30 06:56:50
426	99	4	2024-07-30 06:56:50	2024-07-30 06:56:50
427	100	4	2024-07-30 06:56:50	2024-07-30 06:56:50
428	101	4	2024-07-30 06:56:50	2024-07-30 06:56:50
429	102	4	2024-07-30 06:56:50	2024-07-30 06:56:50
430	103	4	2024-07-30 06:56:50	2024-07-30 06:56:50
431	104	4	2024-07-30 06:56:50	2024-07-30 06:56:50
432	105	4	2024-07-30 06:56:50	2024-07-30 06:56:50
433	106	4	2024-07-30 07:26:28	2024-07-30 07:26:28
434	107	4	2024-07-30 07:29:58	2024-07-30 07:29:58
435	109	4	2024-07-30 07:35:43	2024-07-30 07:35:43
436	108	4	2024-07-30 07:36:21	2024-07-30 07:36:21
437	8	4	2024-07-30 07:36:50	2024-07-30 07:36:50
438	6	4	2024-07-30 07:36:51	2024-07-30 07:36:51
439	9	4	2024-07-30 07:36:51	2024-07-30 07:36:51
440	7	4	2024-07-30 07:36:51	2024-07-30 07:36:51
441	5	4	2024-07-30 07:36:51	2024-07-30 07:36:51
442	11	4	2024-07-30 07:36:51	2024-07-30 07:36:51
443	12	4	2024-07-30 07:36:51	2024-07-30 07:36:51
444	1	4	2024-07-30 07:36:51	2024-07-30 07:36:51
445	2	4	2024-07-30 07:36:51	2024-07-30 07:36:51
446	4	4	2024-07-30 07:36:51	2024-07-30 07:36:51
447	14	4	2024-07-30 07:36:51	2024-07-30 07:36:51
448	3	4	2024-07-30 07:36:51	2024-07-30 07:36:51
449	10	4	2024-07-30 07:36:51	2024-07-30 07:36:51
450	16	4	2024-07-30 07:36:51	2024-07-30 07:36:51
451	17	4	2024-07-30 07:36:51	2024-07-30 07:36:51
452	18	4	2024-07-30 07:36:51	2024-07-30 07:36:51
453	26	4	2024-07-30 07:36:51	2024-07-30 07:36:51
454	13	4	2024-07-30 07:36:51	2024-07-30 07:36:51
455	19	4	2024-07-30 07:36:51	2024-07-30 07:36:51
456	20	4	2024-07-30 07:36:51	2024-07-30 07:36:51
457	15	4	2024-07-30 07:36:51	2024-07-30 07:36:51
458	22	4	2024-07-30 07:36:51	2024-07-30 07:36:51
459	23	4	2024-07-30 07:36:51	2024-07-30 07:36:51
460	24	4	2024-07-30 07:36:51	2024-07-30 07:36:51
461	25	4	2024-07-30 07:36:51	2024-07-30 07:36:51
462	27	4	2024-07-30 07:36:51	2024-07-30 07:36:51
463	30	4	2024-07-30 07:36:51	2024-07-30 07:36:51
464	28	4	2024-07-30 07:36:51	2024-07-30 07:36:51
465	29	4	2024-07-30 07:36:51	2024-07-30 07:36:51
466	31	4	2024-07-30 07:36:51	2024-07-30 07:36:51
467	32	4	2024-07-30 07:36:51	2024-07-30 07:36:51
468	33	4	2024-07-30 07:36:51	2024-07-30 07:36:51
469	21	4	2024-07-30 07:36:51	2024-07-30 07:36:51
470	34	4	2024-07-30 07:36:51	2024-07-30 07:36:51
471	35	4	2024-07-30 07:36:51	2024-07-30 07:36:51
472	47	4	2024-07-30 07:36:51	2024-07-30 07:36:51
473	48	4	2024-07-30 07:36:51	2024-07-30 07:36:51
474	37	4	2024-07-30 07:36:51	2024-07-30 07:36:51
475	38	4	2024-07-30 07:36:51	2024-07-30 07:36:51
476	36	4	2024-07-30 07:36:51	2024-07-30 07:36:51
477	39	4	2024-07-30 07:36:51	2024-07-30 07:36:51
478	40	4	2024-07-30 07:36:51	2024-07-30 07:36:51
479	49	4	2024-07-30 07:36:51	2024-07-30 07:36:51
480	41	4	2024-07-30 07:36:51	2024-07-30 07:36:51
481	42	4	2024-07-30 07:36:51	2024-07-30 07:36:51
482	43	4	2024-07-30 07:36:51	2024-07-30 07:36:51
483	44	4	2024-07-30 07:36:51	2024-07-30 07:36:51
484	45	4	2024-07-30 07:36:51	2024-07-30 07:36:51
485	46	4	2024-07-30 07:36:51	2024-07-30 07:36:51
486	50	4	2024-07-30 07:36:51	2024-07-30 07:36:51
487	54	4	2024-07-30 07:36:51	2024-07-30 07:36:51
488	52	4	2024-07-30 07:36:51	2024-07-30 07:36:51
489	51	4	2024-07-30 07:36:51	2024-07-30 07:36:51
490	55	4	2024-07-30 07:36:51	2024-07-30 07:36:51
491	53	4	2024-07-30 07:36:51	2024-07-30 07:36:51
492	56	4	2024-07-30 07:36:51	2024-07-30 07:36:51
493	57	4	2024-07-30 07:36:51	2024-07-30 07:36:51
494	58	4	2024-07-30 07:36:51	2024-07-30 07:36:51
495	62	4	2024-07-30 07:36:51	2024-07-30 07:36:51
496	59	4	2024-07-30 07:36:51	2024-07-30 07:36:51
497	60	4	2024-07-30 07:36:51	2024-07-30 07:36:51
498	61	4	2024-07-30 07:36:51	2024-07-30 07:36:51
499	63	4	2024-07-30 07:36:51	2024-07-30 07:36:51
500	64	4	2024-07-30 07:36:51	2024-07-30 07:36:51
501	65	4	2024-07-30 07:36:51	2024-07-30 07:36:51
502	66	4	2024-07-30 07:36:51	2024-07-30 07:36:51
503	67	4	2024-07-30 07:36:51	2024-07-30 07:36:51
504	68	4	2024-07-30 07:36:51	2024-07-30 07:36:51
505	69	4	2024-07-30 07:36:51	2024-07-30 07:36:51
506	70	4	2024-07-30 07:36:52	2024-07-30 07:36:52
507	71	4	2024-07-30 07:36:52	2024-07-30 07:36:52
508	72	4	2024-07-30 07:36:52	2024-07-30 07:36:52
509	73	4	2024-07-30 07:36:52	2024-07-30 07:36:52
510	74	4	2024-07-30 07:36:52	2024-07-30 07:36:52
511	75	4	2024-07-30 07:36:52	2024-07-30 07:36:52
512	76	4	2024-07-30 07:36:52	2024-07-30 07:36:52
513	77	4	2024-07-30 07:36:52	2024-07-30 07:36:52
514	78	4	2024-07-30 07:36:52	2024-07-30 07:36:52
515	79	4	2024-07-30 07:36:52	2024-07-30 07:36:52
516	80	4	2024-07-30 07:36:52	2024-07-30 07:36:52
517	81	4	2024-07-30 07:36:52	2024-07-30 07:36:52
518	82	4	2024-07-30 07:36:52	2024-07-30 07:36:52
519	83	4	2024-07-30 07:36:52	2024-07-30 07:36:52
520	84	4	2024-07-30 07:36:52	2024-07-30 07:36:52
521	90	4	2024-07-30 07:36:52	2024-07-30 07:36:52
522	85	4	2024-07-30 07:36:52	2024-07-30 07:36:52
523	86	4	2024-07-30 07:36:52	2024-07-30 07:36:52
524	88	4	2024-07-30 07:36:52	2024-07-30 07:36:52
525	87	4	2024-07-30 07:36:52	2024-07-30 07:36:52
526	89	4	2024-07-30 07:36:52	2024-07-30 07:36:52
527	91	4	2024-07-30 07:36:52	2024-07-30 07:36:52
528	92	4	2024-07-30 07:36:52	2024-07-30 07:36:52
529	93	4	2024-07-30 07:36:52	2024-07-30 07:36:52
530	94	4	2024-07-30 07:36:52	2024-07-30 07:36:52
531	95	4	2024-07-30 07:36:52	2024-07-30 07:36:52
532	96	4	2024-07-30 07:36:52	2024-07-30 07:36:52
533	97	4	2024-07-30 07:36:52	2024-07-30 07:36:52
534	98	4	2024-07-30 07:36:52	2024-07-30 07:36:52
535	99	4	2024-07-30 07:36:52	2024-07-30 07:36:52
536	100	4	2024-07-30 07:36:52	2024-07-30 07:36:52
537	101	4	2024-07-30 07:36:52	2024-07-30 07:36:52
538	108	4	2024-07-30 07:36:52	2024-07-30 07:36:52
539	102	4	2024-07-30 07:36:52	2024-07-30 07:36:52
540	103	4	2024-07-30 07:36:52	2024-07-30 07:36:52
541	104	4	2024-07-30 07:36:52	2024-07-30 07:36:52
542	105	4	2024-07-30 07:36:52	2024-07-30 07:36:52
543	106	4	2024-07-30 07:36:52	2024-07-30 07:36:52
544	107	4	2024-07-30 07:36:52	2024-07-30 07:36:52
545	109	4	2024-07-30 07:36:52	2024-07-30 07:36:52
546	110	4	2024-07-30 07:36:52	2024-07-30 07:36:52
547	111	4	2024-07-30 07:56:10	2024-07-30 07:56:10
548	104	134	2024-07-30 07:58:54	2024-07-30 07:58:54
549	112	4	2024-07-30 09:58:49	2024-07-30 09:58:49
550	113	4	2024-07-30 09:59:57	2024-07-30 09:59:57
551	114	4	2024-07-30 10:25:33	2024-07-30 10:25:33
552	8	4	2024-07-30 10:27:23	2024-07-30 10:27:23
553	6	4	2024-07-30 10:27:23	2024-07-30 10:27:23
554	9	4	2024-07-30 10:27:23	2024-07-30 10:27:23
555	7	4	2024-07-30 10:27:23	2024-07-30 10:27:23
556	5	4	2024-07-30 10:27:23	2024-07-30 10:27:23
557	11	4	2024-07-30 10:27:23	2024-07-30 10:27:23
558	12	4	2024-07-30 10:27:23	2024-07-30 10:27:23
559	1	4	2024-07-30 10:27:23	2024-07-30 10:27:23
560	2	4	2024-07-30 10:27:23	2024-07-30 10:27:23
561	4	4	2024-07-30 10:27:23	2024-07-30 10:27:23
562	14	4	2024-07-30 10:27:23	2024-07-30 10:27:23
563	3	4	2024-07-30 10:27:23	2024-07-30 10:27:23
564	10	4	2024-07-30 10:27:23	2024-07-30 10:27:23
565	16	4	2024-07-30 10:27:23	2024-07-30 10:27:23
566	17	4	2024-07-30 10:27:24	2024-07-30 10:27:24
567	18	4	2024-07-30 10:27:24	2024-07-30 10:27:24
568	26	4	2024-07-30 10:27:24	2024-07-30 10:27:24
569	13	4	2024-07-30 10:27:24	2024-07-30 10:27:24
570	19	4	2024-07-30 10:27:24	2024-07-30 10:27:24
571	20	4	2024-07-30 10:27:24	2024-07-30 10:27:24
572	15	4	2024-07-30 10:27:24	2024-07-30 10:27:24
573	22	4	2024-07-30 10:27:24	2024-07-30 10:27:24
574	23	4	2024-07-30 10:27:24	2024-07-30 10:27:24
575	24	4	2024-07-30 10:27:24	2024-07-30 10:27:24
576	25	4	2024-07-30 10:27:24	2024-07-30 10:27:24
577	27	4	2024-07-30 10:27:24	2024-07-30 10:27:24
578	30	4	2024-07-30 10:27:24	2024-07-30 10:27:24
579	28	4	2024-07-30 10:27:24	2024-07-30 10:27:24
580	29	4	2024-07-30 10:27:24	2024-07-30 10:27:24
581	31	4	2024-07-30 10:27:24	2024-07-30 10:27:24
582	32	4	2024-07-30 10:27:24	2024-07-30 10:27:24
583	33	4	2024-07-30 10:27:24	2024-07-30 10:27:24
584	21	4	2024-07-30 10:27:24	2024-07-30 10:27:24
585	34	4	2024-07-30 10:27:24	2024-07-30 10:27:24
586	35	4	2024-07-30 10:27:24	2024-07-30 10:27:24
587	47	4	2024-07-30 10:27:24	2024-07-30 10:27:24
588	48	4	2024-07-30 10:27:24	2024-07-30 10:27:24
589	37	4	2024-07-30 10:27:24	2024-07-30 10:27:24
590	38	4	2024-07-30 10:27:24	2024-07-30 10:27:24
591	36	4	2024-07-30 10:27:24	2024-07-30 10:27:24
592	39	4	2024-07-30 10:27:24	2024-07-30 10:27:24
593	40	4	2024-07-30 10:27:24	2024-07-30 10:27:24
594	49	4	2024-07-30 10:27:24	2024-07-30 10:27:24
595	41	4	2024-07-30 10:27:24	2024-07-30 10:27:24
596	42	4	2024-07-30 10:27:24	2024-07-30 10:27:24
597	43	4	2024-07-30 10:27:24	2024-07-30 10:27:24
598	44	4	2024-07-30 10:27:24	2024-07-30 10:27:24
599	45	4	2024-07-30 10:27:24	2024-07-30 10:27:24
600	46	4	2024-07-30 10:27:24	2024-07-30 10:27:24
601	50	4	2024-07-30 10:27:24	2024-07-30 10:27:24
602	54	4	2024-07-30 10:27:24	2024-07-30 10:27:24
603	52	4	2024-07-30 10:27:24	2024-07-30 10:27:24
604	51	4	2024-07-30 10:27:24	2024-07-30 10:27:24
605	55	4	2024-07-30 10:27:24	2024-07-30 10:27:24
606	53	4	2024-07-30 10:27:24	2024-07-30 10:27:24
607	56	4	2024-07-30 10:27:24	2024-07-30 10:27:24
608	57	4	2024-07-30 10:27:24	2024-07-30 10:27:24
609	58	4	2024-07-30 10:27:24	2024-07-30 10:27:24
610	62	4	2024-07-30 10:27:24	2024-07-30 10:27:24
611	59	4	2024-07-30 10:27:24	2024-07-30 10:27:24
612	60	4	2024-07-30 10:27:24	2024-07-30 10:27:24
613	61	4	2024-07-30 10:27:24	2024-07-30 10:27:24
614	63	4	2024-07-30 10:27:24	2024-07-30 10:27:24
615	64	4	2024-07-30 10:27:24	2024-07-30 10:27:24
616	65	4	2024-07-30 10:27:24	2024-07-30 10:27:24
617	66	4	2024-07-30 10:27:24	2024-07-30 10:27:24
618	67	4	2024-07-30 10:27:24	2024-07-30 10:27:24
619	68	4	2024-07-30 10:27:24	2024-07-30 10:27:24
620	69	4	2024-07-30 10:27:24	2024-07-30 10:27:24
621	70	4	2024-07-30 10:27:24	2024-07-30 10:27:24
622	71	4	2024-07-30 10:27:24	2024-07-30 10:27:24
623	72	4	2024-07-30 10:27:24	2024-07-30 10:27:24
624	73	4	2024-07-30 10:27:24	2024-07-30 10:27:24
625	75	4	2024-07-30 10:27:24	2024-07-30 10:27:24
626	76	4	2024-07-30 10:27:24	2024-07-30 10:27:24
627	77	4	2024-07-30 10:27:24	2024-07-30 10:27:24
628	78	4	2024-07-30 10:27:24	2024-07-30 10:27:24
629	79	4	2024-07-30 10:27:25	2024-07-30 10:27:25
630	80	4	2024-07-30 10:27:25	2024-07-30 10:27:25
631	81	4	2024-07-30 10:27:25	2024-07-30 10:27:25
632	82	4	2024-07-30 10:27:25	2024-07-30 10:27:25
633	83	4	2024-07-30 10:27:25	2024-07-30 10:27:25
634	84	4	2024-07-30 10:27:25	2024-07-30 10:27:25
635	90	4	2024-07-30 10:27:25	2024-07-30 10:27:25
636	85	4	2024-07-30 10:27:25	2024-07-30 10:27:25
637	86	4	2024-07-30 10:27:25	2024-07-30 10:27:25
638	88	4	2024-07-30 10:27:25	2024-07-30 10:27:25
639	87	4	2024-07-30 10:27:25	2024-07-30 10:27:25
640	89	4	2024-07-30 10:27:25	2024-07-30 10:27:25
641	91	4	2024-07-30 10:27:25	2024-07-30 10:27:25
642	92	4	2024-07-30 10:27:25	2024-07-30 10:27:25
643	93	4	2024-07-30 10:27:25	2024-07-30 10:27:25
644	94	4	2024-07-30 10:27:25	2024-07-30 10:27:25
645	74	4	2024-07-30 10:27:25	2024-07-30 10:27:25
646	95	4	2024-07-30 10:27:25	2024-07-30 10:27:25
647	96	4	2024-07-30 10:27:25	2024-07-30 10:27:25
648	97	4	2024-07-30 10:27:25	2024-07-30 10:27:25
649	98	4	2024-07-30 10:27:25	2024-07-30 10:27:25
650	99	4	2024-07-30 10:27:25	2024-07-30 10:27:25
651	100	4	2024-07-30 10:27:25	2024-07-30 10:27:25
652	101	4	2024-07-30 10:27:25	2024-07-30 10:27:25
653	108	4	2024-07-30 10:27:25	2024-07-30 10:27:25
654	102	4	2024-07-30 10:27:25	2024-07-30 10:27:25
655	103	4	2024-07-30 10:27:25	2024-07-30 10:27:25
656	105	4	2024-07-30 10:27:25	2024-07-30 10:27:25
657	106	4	2024-07-30 10:27:25	2024-07-30 10:27:25
658	107	4	2024-07-30 10:27:25	2024-07-30 10:27:25
659	109	4	2024-07-30 10:27:25	2024-07-30 10:27:25
660	110	4	2024-07-30 10:27:25	2024-07-30 10:27:25
661	111	4	2024-07-30 10:27:25	2024-07-30 10:27:25
662	104	4	2024-07-30 10:27:25	2024-07-30 10:27:25
663	112	4	2024-07-30 10:27:25	2024-07-30 10:27:25
664	113	4	2024-07-30 10:27:25	2024-07-30 10:27:25
665	114	4	2024-07-30 10:27:25	2024-07-30 10:27:25
666	115	4	2024-07-30 10:27:25	2024-07-30 10:27:25
667	116	4	2024-07-30 10:29:58	2024-07-30 10:29:58
668	117	4	2024-07-30 10:35:01	2024-07-30 10:35:01
669	118	4	2024-07-30 10:37:18	2024-07-30 10:37:18
670	136	4	2024-07-30 11:48:11	2024-07-30 11:48:11
671	131	4	2024-07-30 11:48:34	2024-07-30 11:48:34
672	133	4	2024-07-30 11:48:34	2024-07-30 11:48:34
673	134	4	2024-07-30 11:48:34	2024-07-30 11:48:34
674	136	4	2024-07-30 11:48:34	2024-07-30 11:48:34
675	142	4	2024-07-30 14:08:28	2024-07-30 14:08:28
676	145	4	2024-07-30 14:57:40	2024-07-30 14:57:40
677	147	4	2024-07-30 14:59:52	2024-07-30 14:59:52
678	131	4	2024-07-30 15:39:52	2024-07-30 15:39:52
679	133	4	2024-07-30 15:39:52	2024-07-30 15:39:52
680	134	4	2024-07-30 15:39:52	2024-07-30 15:39:52
681	136	4	2024-07-30 15:39:52	2024-07-30 15:39:52
682	139	4	2024-07-30 15:39:52	2024-07-30 15:39:52
683	140	4	2024-07-30 15:39:52	2024-07-30 15:39:52
684	141	4	2024-07-30 15:39:52	2024-07-30 15:39:52
685	142	4	2024-07-30 15:39:52	2024-07-30 15:39:52
686	143	4	2024-07-30 15:39:52	2024-07-30 15:39:52
687	144	4	2024-07-30 15:39:52	2024-07-30 15:39:52
688	145	4	2024-07-30 15:39:52	2024-07-30 15:39:52
689	146	4	2024-07-30 15:39:52	2024-07-30 15:39:52
690	147	4	2024-07-30 15:39:52	2024-07-30 15:39:52
691	148	4	2024-07-30 15:39:52	2024-07-30 15:39:52
692	149	4	2024-07-30 15:39:52	2024-07-30 15:39:52
693	150	4	2024-07-30 15:39:52	2024-07-30 15:39:52
694	131	4	2024-07-30 15:54:17	2024-07-30 15:54:17
695	133	4	2024-07-30 15:54:17	2024-07-30 15:54:17
696	134	4	2024-07-30 15:54:17	2024-07-30 15:54:17
697	136	4	2024-07-30 15:54:17	2024-07-30 15:54:17
698	139	4	2024-07-30 15:54:17	2024-07-30 15:54:17
699	140	4	2024-07-30 15:54:17	2024-07-30 15:54:17
700	141	4	2024-07-30 15:54:17	2024-07-30 15:54:17
701	142	4	2024-07-30 15:54:17	2024-07-30 15:54:17
702	143	4	2024-07-30 15:54:17	2024-07-30 15:54:17
703	144	4	2024-07-30 15:54:17	2024-07-30 15:54:17
704	145	4	2024-07-30 15:54:17	2024-07-30 15:54:17
705	146	4	2024-07-30 15:54:17	2024-07-30 15:54:17
706	147	4	2024-07-30 15:54:17	2024-07-30 15:54:17
707	148	4	2024-07-30 15:54:17	2024-07-30 15:54:17
708	149	4	2024-07-30 15:54:17	2024-07-30 15:54:17
709	150	4	2024-07-30 15:54:17	2024-07-30 15:54:17
710	151	4	2024-07-30 15:54:17	2024-07-30 15:54:17
711	152	4	2024-07-30 16:00:10	2024-07-30 16:00:10
712	154	4	2024-07-30 17:00:31	2024-07-30 17:00:31
713	156	4	2024-07-30 17:11:10	2024-07-30 17:11:10
714	157	4	2024-07-30 17:18:36	2024-07-30 17:18:36
715	158	4	2024-07-30 17:21:28	2024-07-30 17:21:28
716	159	4	2024-07-30 17:30:50	2024-07-30 17:30:50
717	131	4	2024-07-30 17:51:23	2024-07-30 17:51:23
718	133	4	2024-07-30 17:51:23	2024-07-30 17:51:23
719	134	4	2024-07-30 17:51:23	2024-07-30 17:51:23
720	136	4	2024-07-30 17:51:23	2024-07-30 17:51:23
721	139	4	2024-07-30 17:51:23	2024-07-30 17:51:23
722	140	4	2024-07-30 17:51:23	2024-07-30 17:51:23
723	141	4	2024-07-30 17:51:23	2024-07-30 17:51:23
724	142	4	2024-07-30 17:51:23	2024-07-30 17:51:23
725	143	4	2024-07-30 17:51:23	2024-07-30 17:51:23
726	144	4	2024-07-30 17:51:23	2024-07-30 17:51:23
727	145	4	2024-07-30 17:51:23	2024-07-30 17:51:23
728	146	4	2024-07-30 17:51:23	2024-07-30 17:51:23
729	147	4	2024-07-30 17:51:23	2024-07-30 17:51:23
730	148	4	2024-07-30 17:51:23	2024-07-30 17:51:23
731	149	4	2024-07-30 17:51:23	2024-07-30 17:51:23
732	150	4	2024-07-30 17:51:23	2024-07-30 17:51:23
733	151	4	2024-07-30 17:51:23	2024-07-30 17:51:23
734	152	4	2024-07-30 17:51:23	2024-07-30 17:51:23
735	153	4	2024-07-30 17:51:23	2024-07-30 17:51:23
736	154	4	2024-07-30 17:51:23	2024-07-30 17:51:23
737	155	4	2024-07-30 17:51:23	2024-07-30 17:51:23
738	156	4	2024-07-30 17:51:23	2024-07-30 17:51:23
739	157	4	2024-07-30 17:51:23	2024-07-30 17:51:23
740	158	4	2024-07-30 17:51:23	2024-07-30 17:51:23
741	159	4	2024-07-30 17:51:23	2024-07-30 17:51:23
742	160	4	2024-07-30 17:51:23	2024-07-30 17:51:23
743	161	4	2024-07-30 17:58:23	2024-07-30 17:58:23
744	162	4	2024-07-30 18:11:04	2024-07-30 18:11:04
745	131	4	2024-08-01 07:15:16	2024-08-01 07:15:16
746	133	4	2024-08-01 07:15:16	2024-08-01 07:15:16
747	134	4	2024-08-01 07:15:16	2024-08-01 07:15:16
748	136	4	2024-08-01 07:15:16	2024-08-01 07:15:16
749	139	4	2024-08-01 07:15:16	2024-08-01 07:15:16
750	140	4	2024-08-01 07:15:16	2024-08-01 07:15:16
751	141	4	2024-08-01 07:15:16	2024-08-01 07:15:16
752	142	4	2024-08-01 07:15:16	2024-08-01 07:15:16
753	143	4	2024-08-01 07:15:16	2024-08-01 07:15:16
754	144	4	2024-08-01 07:15:16	2024-08-01 07:15:16
755	145	4	2024-08-01 07:15:16	2024-08-01 07:15:16
756	146	4	2024-08-01 07:15:16	2024-08-01 07:15:16
757	147	4	2024-08-01 07:15:16	2024-08-01 07:15:16
758	148	4	2024-08-01 07:15:16	2024-08-01 07:15:16
759	149	4	2024-08-01 07:15:16	2024-08-01 07:15:16
760	150	4	2024-08-01 07:15:16	2024-08-01 07:15:16
761	151	4	2024-08-01 07:15:16	2024-08-01 07:15:16
762	152	4	2024-08-01 07:15:16	2024-08-01 07:15:16
763	153	4	2024-08-01 07:15:16	2024-08-01 07:15:16
764	154	4	2024-08-01 07:15:16	2024-08-01 07:15:16
765	155	4	2024-08-01 07:15:16	2024-08-01 07:15:16
766	156	4	2024-08-01 07:15:16	2024-08-01 07:15:16
767	157	4	2024-08-01 07:15:16	2024-08-01 07:15:16
768	158	4	2024-08-01 07:15:16	2024-08-01 07:15:16
769	159	4	2024-08-01 07:15:16	2024-08-01 07:15:16
770	160	4	2024-08-01 07:15:16	2024-08-01 07:15:16
771	161	4	2024-08-01 07:15:16	2024-08-01 07:15:16
772	162	4	2024-08-01 07:15:16	2024-08-01 07:15:16
773	163	4	2024-08-01 07:15:16	2024-08-01 07:15:16
774	164	4	2024-08-01 07:15:16	2024-08-01 07:15:16
775	165	4	2024-08-01 07:15:16	2024-08-01 07:15:16
776	166	4	2024-08-01 07:15:16	2024-08-01 07:15:16
777	167	4	2024-08-01 07:15:16	2024-08-01 07:15:16
778	168	4	2024-08-01 07:15:16	2024-08-01 07:15:16
779	169	4	2024-08-01 07:15:16	2024-08-01 07:15:16
780	170	4	2024-08-01 07:15:16	2024-08-01 07:15:16
781	171	4	2024-08-01 07:15:16	2024-08-01 07:15:16
782	172	4	2024-08-01 07:15:16	2024-08-01 07:15:16
783	173	4	2024-08-01 07:15:16	2024-08-01 07:15:16
784	174	4	2024-08-01 07:15:16	2024-08-01 07:15:16
785	175	4	2024-08-01 07:15:16	2024-08-01 07:15:16
786	131	4	2024-08-01 09:37:40	2024-08-01 09:37:40
787	133	4	2024-08-01 09:37:40	2024-08-01 09:37:40
788	134	4	2024-08-01 09:37:40	2024-08-01 09:37:40
789	136	4	2024-08-01 09:37:40	2024-08-01 09:37:40
790	139	4	2024-08-01 09:37:40	2024-08-01 09:37:40
791	140	4	2024-08-01 09:37:40	2024-08-01 09:37:40
792	141	4	2024-08-01 09:37:40	2024-08-01 09:37:40
793	142	4	2024-08-01 09:37:40	2024-08-01 09:37:40
794	143	4	2024-08-01 09:37:40	2024-08-01 09:37:40
795	144	4	2024-08-01 09:37:40	2024-08-01 09:37:40
796	145	4	2024-08-01 09:37:40	2024-08-01 09:37:40
797	146	4	2024-08-01 09:37:40	2024-08-01 09:37:40
798	147	4	2024-08-01 09:37:40	2024-08-01 09:37:40
799	148	4	2024-08-01 09:37:40	2024-08-01 09:37:40
800	149	4	2024-08-01 09:37:40	2024-08-01 09:37:40
801	150	4	2024-08-01 09:37:40	2024-08-01 09:37:40
802	151	4	2024-08-01 09:37:40	2024-08-01 09:37:40
803	152	4	2024-08-01 09:37:40	2024-08-01 09:37:40
804	153	4	2024-08-01 09:37:40	2024-08-01 09:37:40
805	154	4	2024-08-01 09:37:40	2024-08-01 09:37:40
806	155	4	2024-08-01 09:37:40	2024-08-01 09:37:40
807	156	4	2024-08-01 09:37:40	2024-08-01 09:37:40
808	157	4	2024-08-01 09:37:40	2024-08-01 09:37:40
809	158	4	2024-08-01 09:37:40	2024-08-01 09:37:40
810	159	4	2024-08-01 09:37:40	2024-08-01 09:37:40
811	160	4	2024-08-01 09:37:40	2024-08-01 09:37:40
812	161	4	2024-08-01 09:37:40	2024-08-01 09:37:40
813	162	4	2024-08-01 09:37:40	2024-08-01 09:37:40
814	163	4	2024-08-01 09:37:40	2024-08-01 09:37:40
815	164	4	2024-08-01 09:37:40	2024-08-01 09:37:40
816	165	4	2024-08-01 09:37:40	2024-08-01 09:37:40
817	166	4	2024-08-01 09:37:40	2024-08-01 09:37:40
818	167	4	2024-08-01 09:37:40	2024-08-01 09:37:40
819	168	4	2024-08-01 09:37:40	2024-08-01 09:37:40
820	169	4	2024-08-01 09:37:40	2024-08-01 09:37:40
821	170	4	2024-08-01 09:37:40	2024-08-01 09:37:40
822	171	4	2024-08-01 09:37:40	2024-08-01 09:37:40
823	173	4	2024-08-01 09:37:40	2024-08-01 09:37:40
824	175	4	2024-08-01 09:37:40	2024-08-01 09:37:40
825	176	4	2024-08-01 09:37:40	2024-08-01 09:37:40
826	174	4	2024-08-01 09:37:40	2024-08-01 09:37:40
827	177	4	2024-08-01 09:37:40	2024-08-01 09:37:40
828	172	4	2024-08-01 09:37:40	2024-08-01 09:37:40
829	178	4	2024-08-01 09:37:40	2024-08-01 09:37:40
830	131	4	2024-08-01 09:40:42	2024-08-01 09:40:42
831	133	4	2024-08-01 09:40:42	2024-08-01 09:40:42
832	134	4	2024-08-01 09:40:42	2024-08-01 09:40:42
833	136	4	2024-08-01 09:40:42	2024-08-01 09:40:42
834	139	4	2024-08-01 09:40:42	2024-08-01 09:40:42
835	140	4	2024-08-01 09:40:42	2024-08-01 09:40:42
836	141	4	2024-08-01 09:40:42	2024-08-01 09:40:42
837	142	4	2024-08-01 09:40:42	2024-08-01 09:40:42
838	143	4	2024-08-01 09:40:42	2024-08-01 09:40:42
839	144	4	2024-08-01 09:40:42	2024-08-01 09:40:42
840	145	4	2024-08-01 09:40:42	2024-08-01 09:40:42
841	146	4	2024-08-01 09:40:42	2024-08-01 09:40:42
842	147	4	2024-08-01 09:40:42	2024-08-01 09:40:42
843	148	4	2024-08-01 09:40:42	2024-08-01 09:40:42
844	149	4	2024-08-01 09:40:42	2024-08-01 09:40:42
845	150	4	2024-08-01 09:40:42	2024-08-01 09:40:42
846	151	4	2024-08-01 09:40:42	2024-08-01 09:40:42
847	152	4	2024-08-01 09:40:42	2024-08-01 09:40:42
848	153	4	2024-08-01 09:40:42	2024-08-01 09:40:42
849	154	4	2024-08-01 09:40:42	2024-08-01 09:40:42
850	155	4	2024-08-01 09:40:42	2024-08-01 09:40:42
851	156	4	2024-08-01 09:40:42	2024-08-01 09:40:42
852	157	4	2024-08-01 09:40:42	2024-08-01 09:40:42
853	158	4	2024-08-01 09:40:42	2024-08-01 09:40:42
854	159	4	2024-08-01 09:40:42	2024-08-01 09:40:42
855	160	4	2024-08-01 09:40:42	2024-08-01 09:40:42
856	161	4	2024-08-01 09:40:42	2024-08-01 09:40:42
857	162	4	2024-08-01 09:40:42	2024-08-01 09:40:42
858	163	4	2024-08-01 09:40:42	2024-08-01 09:40:42
859	164	4	2024-08-01 09:40:42	2024-08-01 09:40:42
860	165	4	2024-08-01 09:40:42	2024-08-01 09:40:42
861	166	4	2024-08-01 09:40:42	2024-08-01 09:40:42
862	167	4	2024-08-01 09:40:42	2024-08-01 09:40:42
863	168	4	2024-08-01 09:40:42	2024-08-01 09:40:42
864	169	4	2024-08-01 09:40:42	2024-08-01 09:40:42
865	170	4	2024-08-01 09:40:42	2024-08-01 09:40:42
866	171	4	2024-08-01 09:40:42	2024-08-01 09:40:42
867	179	4	2024-08-01 09:40:42	2024-08-01 09:40:42
868	173	4	2024-08-01 09:40:42	2024-08-01 09:40:42
869	175	4	2024-08-01 09:40:42	2024-08-01 09:40:42
870	176	4	2024-08-01 09:40:42	2024-08-01 09:40:42
871	174	4	2024-08-01 09:40:42	2024-08-01 09:40:42
872	177	4	2024-08-01 09:40:42	2024-08-01 09:40:42
873	172	4	2024-08-01 09:40:42	2024-08-01 09:40:42
874	178	4	2024-08-01 09:40:42	2024-08-01 09:40:42
875	180	4	2024-08-01 09:49:00	2024-08-01 09:49:00
876	181	4	2024-08-01 09:50:37	2024-08-01 09:50:37
877	182	4	2024-08-01 10:06:33	2024-08-01 10:06:33
878	183	4	2024-08-01 10:19:35	2024-08-01 10:19:35
879	131	4	2024-08-01 10:20:08	2024-08-01 10:20:08
880	133	4	2024-08-01 10:20:08	2024-08-01 10:20:08
881	134	4	2024-08-01 10:20:08	2024-08-01 10:20:08
882	136	4	2024-08-01 10:20:08	2024-08-01 10:20:08
883	139	4	2024-08-01 10:20:08	2024-08-01 10:20:08
884	140	4	2024-08-01 10:20:08	2024-08-01 10:20:08
885	141	4	2024-08-01 10:20:08	2024-08-01 10:20:08
886	142	4	2024-08-01 10:20:08	2024-08-01 10:20:08
887	143	4	2024-08-01 10:20:08	2024-08-01 10:20:08
888	144	4	2024-08-01 10:20:08	2024-08-01 10:20:08
889	145	4	2024-08-01 10:20:08	2024-08-01 10:20:08
890	146	4	2024-08-01 10:20:08	2024-08-01 10:20:08
891	147	4	2024-08-01 10:20:08	2024-08-01 10:20:08
892	148	4	2024-08-01 10:20:08	2024-08-01 10:20:08
893	149	4	2024-08-01 10:20:08	2024-08-01 10:20:08
894	150	4	2024-08-01 10:20:08	2024-08-01 10:20:08
895	151	4	2024-08-01 10:20:08	2024-08-01 10:20:08
896	152	4	2024-08-01 10:20:08	2024-08-01 10:20:08
897	153	4	2024-08-01 10:20:08	2024-08-01 10:20:08
898	154	4	2024-08-01 10:20:08	2024-08-01 10:20:08
899	155	4	2024-08-01 10:20:08	2024-08-01 10:20:08
900	156	4	2024-08-01 10:20:08	2024-08-01 10:20:08
901	157	4	2024-08-01 10:20:08	2024-08-01 10:20:08
902	158	4	2024-08-01 10:20:09	2024-08-01 10:20:09
903	159	4	2024-08-01 10:20:09	2024-08-01 10:20:09
904	160	4	2024-08-01 10:20:09	2024-08-01 10:20:09
905	161	4	2024-08-01 10:20:09	2024-08-01 10:20:09
906	162	4	2024-08-01 10:20:09	2024-08-01 10:20:09
907	163	4	2024-08-01 10:20:09	2024-08-01 10:20:09
908	164	4	2024-08-01 10:20:09	2024-08-01 10:20:09
909	165	4	2024-08-01 10:20:09	2024-08-01 10:20:09
910	166	4	2024-08-01 10:20:09	2024-08-01 10:20:09
911	167	4	2024-08-01 10:20:09	2024-08-01 10:20:09
912	168	4	2024-08-01 10:20:09	2024-08-01 10:20:09
913	169	4	2024-08-01 10:20:09	2024-08-01 10:20:09
914	170	4	2024-08-01 10:20:09	2024-08-01 10:20:09
915	171	4	2024-08-01 10:20:09	2024-08-01 10:20:09
916	179	4	2024-08-01 10:20:09	2024-08-01 10:20:09
917	180	4	2024-08-01 10:20:09	2024-08-01 10:20:09
918	173	4	2024-08-01 10:20:09	2024-08-01 10:20:09
919	175	4	2024-08-01 10:20:09	2024-08-01 10:20:09
920	176	4	2024-08-01 10:20:09	2024-08-01 10:20:09
921	174	4	2024-08-01 10:20:09	2024-08-01 10:20:09
922	177	4	2024-08-01 10:20:09	2024-08-01 10:20:09
923	172	4	2024-08-01 10:20:09	2024-08-01 10:20:09
924	178	4	2024-08-01 10:20:09	2024-08-01 10:20:09
925	181	4	2024-08-01 10:20:09	2024-08-01 10:20:09
926	182	4	2024-08-01 10:20:09	2024-08-01 10:20:09
927	183	4	2024-08-01 10:20:09	2024-08-01 10:20:09
928	184	4	2024-08-01 10:20:09	2024-08-01 10:20:09
929	131	134	2024-08-01 10:28:52	2024-08-01 10:28:52
930	133	134	2024-08-01 10:28:52	2024-08-01 10:28:52
931	134	134	2024-08-01 10:28:52	2024-08-01 10:28:52
932	136	134	2024-08-01 10:28:52	2024-08-01 10:28:52
933	139	134	2024-08-01 10:28:52	2024-08-01 10:28:52
934	140	134	2024-08-01 10:28:52	2024-08-01 10:28:52
935	141	134	2024-08-01 10:28:52	2024-08-01 10:28:52
936	142	134	2024-08-01 10:28:52	2024-08-01 10:28:52
937	143	134	2024-08-01 10:28:52	2024-08-01 10:28:52
938	144	134	2024-08-01 10:28:52	2024-08-01 10:28:52
939	145	134	2024-08-01 10:28:52	2024-08-01 10:28:52
940	146	134	2024-08-01 10:28:52	2024-08-01 10:28:52
941	147	134	2024-08-01 10:28:52	2024-08-01 10:28:52
942	148	134	2024-08-01 10:28:52	2024-08-01 10:28:52
943	149	134	2024-08-01 10:28:52	2024-08-01 10:28:52
944	150	134	2024-08-01 10:28:52	2024-08-01 10:28:52
945	151	134	2024-08-01 10:28:52	2024-08-01 10:28:52
946	152	134	2024-08-01 10:28:52	2024-08-01 10:28:52
947	153	134	2024-08-01 10:28:52	2024-08-01 10:28:52
948	154	134	2024-08-01 10:28:52	2024-08-01 10:28:52
949	155	134	2024-08-01 10:28:52	2024-08-01 10:28:52
950	156	134	2024-08-01 10:28:52	2024-08-01 10:28:52
951	157	134	2024-08-01 10:28:52	2024-08-01 10:28:52
952	158	134	2024-08-01 10:28:52	2024-08-01 10:28:52
953	159	134	2024-08-01 10:28:52	2024-08-01 10:28:52
954	160	134	2024-08-01 10:28:52	2024-08-01 10:28:52
955	161	134	2024-08-01 10:28:52	2024-08-01 10:28:52
956	162	134	2024-08-01 10:28:52	2024-08-01 10:28:52
957	163	134	2024-08-01 10:28:52	2024-08-01 10:28:52
958	164	134	2024-08-01 10:28:52	2024-08-01 10:28:52
959	165	134	2024-08-01 10:28:52	2024-08-01 10:28:52
960	166	134	2024-08-01 10:28:52	2024-08-01 10:28:52
961	167	134	2024-08-01 10:28:52	2024-08-01 10:28:52
962	168	134	2024-08-01 10:28:52	2024-08-01 10:28:52
963	169	134	2024-08-01 10:28:52	2024-08-01 10:28:52
964	170	134	2024-08-01 10:28:52	2024-08-01 10:28:52
965	171	134	2024-08-01 10:28:52	2024-08-01 10:28:52
966	179	134	2024-08-01 10:28:52	2024-08-01 10:28:52
967	180	134	2024-08-01 10:28:52	2024-08-01 10:28:52
968	173	134	2024-08-01 10:28:52	2024-08-01 10:28:52
969	175	134	2024-08-01 10:28:52	2024-08-01 10:28:52
970	176	134	2024-08-01 10:28:52	2024-08-01 10:28:52
971	174	134	2024-08-01 10:28:52	2024-08-01 10:28:52
972	177	134	2024-08-01 10:28:52	2024-08-01 10:28:52
973	172	134	2024-08-01 10:28:52	2024-08-01 10:28:52
974	178	134	2024-08-01 10:28:52	2024-08-01 10:28:52
975	181	134	2024-08-01 10:28:52	2024-08-01 10:28:52
976	182	134	2024-08-01 10:28:52	2024-08-01 10:28:52
977	183	134	2024-08-01 10:28:52	2024-08-01 10:28:52
978	184	134	2024-08-01 10:28:52	2024-08-01 10:28:52
979	185	4	2024-08-01 10:30:42	2024-08-01 10:30:42
980	185	134	2024-08-01 10:31:33	2024-08-01 10:31:33
981	131	134	2024-08-01 11:22:08	2024-08-01 11:22:08
982	133	134	2024-08-01 11:22:08	2024-08-01 11:22:08
983	134	134	2024-08-01 11:22:08	2024-08-01 11:22:08
984	136	134	2024-08-01 11:22:08	2024-08-01 11:22:08
985	139	134	2024-08-01 11:22:08	2024-08-01 11:22:08
986	140	134	2024-08-01 11:22:08	2024-08-01 11:22:08
987	141	134	2024-08-01 11:22:08	2024-08-01 11:22:08
988	142	134	2024-08-01 11:22:08	2024-08-01 11:22:08
989	143	134	2024-08-01 11:22:08	2024-08-01 11:22:08
990	144	134	2024-08-01 11:22:08	2024-08-01 11:22:08
991	145	134	2024-08-01 11:22:08	2024-08-01 11:22:08
992	146	134	2024-08-01 11:22:08	2024-08-01 11:22:08
993	147	134	2024-08-01 11:22:08	2024-08-01 11:22:08
994	148	134	2024-08-01 11:22:08	2024-08-01 11:22:08
995	149	134	2024-08-01 11:22:08	2024-08-01 11:22:08
996	150	134	2024-08-01 11:22:08	2024-08-01 11:22:08
997	151	134	2024-08-01 11:22:08	2024-08-01 11:22:08
998	152	134	2024-08-01 11:22:08	2024-08-01 11:22:08
999	153	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1000	154	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1001	155	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1002	156	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1003	157	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1004	158	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1005	159	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1006	160	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1007	161	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1008	162	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1009	163	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1010	164	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1011	165	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1012	166	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1013	167	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1014	168	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1015	169	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1016	170	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1017	171	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1018	179	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1019	180	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1020	173	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1021	175	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1022	176	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1023	174	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1024	172	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1025	178	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1026	181	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1027	182	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1028	183	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1029	184	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1030	177	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1031	185	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1032	186	134	2024-08-01 11:22:08	2024-08-01 11:22:08
1033	187	134	2024-08-01 11:22:52	2024-08-01 11:22:52
1034	189	134	2024-08-01 11:26:53	2024-08-01 11:26:53
1035	131	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1036	133	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1037	134	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1038	136	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1039	139	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1040	140	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1041	141	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1042	142	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1043	143	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1044	144	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1045	145	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1046	146	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1047	147	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1048	148	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1049	149	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1050	150	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1051	151	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1052	152	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1053	153	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1054	154	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1055	155	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1056	156	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1057	157	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1058	158	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1059	159	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1060	160	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1061	161	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1062	162	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1063	163	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1064	164	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1065	165	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1066	166	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1067	167	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1068	168	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1069	169	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1070	170	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1071	171	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1072	179	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1073	180	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1074	173	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1075	175	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1076	176	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1077	174	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1078	172	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1079	178	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1080	181	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1081	182	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1082	183	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1083	184	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1084	177	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1085	185	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1086	186	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1087	188	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1088	189	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1089	190	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1090	187	4	2024-08-01 11:41:13	2024-08-01 11:41:13
1091	131	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1092	133	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1093	134	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1094	136	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1095	139	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1096	140	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1097	141	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1098	142	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1099	143	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1100	144	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1101	145	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1102	146	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1103	147	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1104	148	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1105	149	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1106	150	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1107	151	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1108	152	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1109	153	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1110	154	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1111	155	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1112	156	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1113	157	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1114	158	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1115	159	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1116	160	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1117	161	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1118	162	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1119	163	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1120	164	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1121	165	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1122	166	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1123	167	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1124	168	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1125	169	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1126	170	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1127	171	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1128	179	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1129	180	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1130	173	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1131	175	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1132	174	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1133	176	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1134	172	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1135	178	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1136	181	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1137	182	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1138	183	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1139	184	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1140	177	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1141	185	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1142	186	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1143	188	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1144	189	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1145	190	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1146	187	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1147	192	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1148	191	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1149	193	134	2024-08-01 13:30:34	2024-08-01 13:30:34
1150	131	134	2024-08-01 13:33:24	2024-08-01 13:33:24
1151	133	134	2024-08-01 13:33:24	2024-08-01 13:33:24
1152	134	134	2024-08-01 13:33:24	2024-08-01 13:33:24
1153	136	134	2024-08-01 13:33:24	2024-08-01 13:33:24
1154	139	134	2024-08-01 13:33:24	2024-08-01 13:33:24
1155	140	134	2024-08-01 13:33:24	2024-08-01 13:33:24
1156	141	134	2024-08-01 13:33:24	2024-08-01 13:33:24
1157	142	134	2024-08-01 13:33:24	2024-08-01 13:33:24
1158	143	134	2024-08-01 13:33:24	2024-08-01 13:33:24
1159	144	134	2024-08-01 13:33:24	2024-08-01 13:33:24
1160	145	134	2024-08-01 13:33:24	2024-08-01 13:33:24
1161	146	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1162	147	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1163	148	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1164	149	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1165	150	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1166	151	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1167	152	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1168	153	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1169	154	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1170	155	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1171	156	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1172	157	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1173	158	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1174	159	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1175	160	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1176	161	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1177	162	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1178	163	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1179	164	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1180	165	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1181	166	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1182	167	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1183	168	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1184	169	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1185	170	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1186	171	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1187	179	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1188	180	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1189	173	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1190	175	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1191	174	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1192	176	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1193	172	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1194	178	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1195	181	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1196	182	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1197	183	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1198	184	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1199	177	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1200	185	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1201	186	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1202	188	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1203	189	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1204	190	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1205	187	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1206	192	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1207	191	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1208	193	134	2024-08-01 13:33:25	2024-08-01 13:33:25
1209	194	134	2024-08-01 13:33:25	2024-08-01 13:33:25
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
-- Data for Name: ninja_category_selected; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ninja_category_selected (id, user_id, category_id, created_at, updated_at) FROM stdin;
9	7	2	2024-07-25 05:06:08	2024-07-25 05:06:08
10	7	3	2024-07-25 05:06:08	2024-07-25 05:06:08
11	7	6	2024-07-25 05:06:08	2024-07-25 05:06:08
18	121	1	2024-07-25 11:52:45	2024-07-25 11:52:45
19	121	2	2024-07-25 11:52:45	2024-07-25 11:52:45
20	121	3	2024-07-25 11:52:45	2024-07-25 11:52:45
21	121	4	2024-07-25 11:52:45	2024-07-25 11:52:45
22	121	5	2024-07-25 11:52:45	2024-07-25 11:52:45
23	121	6	2024-07-25 11:52:45	2024-07-25 11:52:45
30	4	1	2024-07-26 17:22:37	2024-07-26 17:22:37
31	4	2	2024-07-26 17:22:37	2024-07-26 17:22:37
32	4	3	2024-07-26 17:22:37	2024-07-26 17:22:37
33	4	4	2024-07-26 17:22:37	2024-07-26 17:22:37
34	4	5	2024-07-26 17:22:37	2024-07-26 17:22:37
35	4	6	2024-07-26 17:22:37	2024-07-26 17:22:37
39	135	1	2024-07-30 05:28:14	2024-07-30 05:28:14
40	135	2	2024-07-30 05:28:14	2024-07-30 05:28:14
41	135	3	2024-07-30 05:28:14	2024-07-30 05:28:14
42	135	4	2024-07-30 05:28:14	2024-07-30 05:28:14
43	135	5	2024-07-30 05:28:14	2024-07-30 05:28:14
44	135	6	2024-07-30 05:28:14	2024-07-30 05:28:14
45	136	1	2024-07-30 06:52:58	2024-07-30 06:52:58
46	136	2	2024-07-30 06:52:58	2024-07-30 06:52:58
47	136	3	2024-07-30 06:52:58	2024-07-30 06:52:58
48	136	4	2024-07-30 06:52:58	2024-07-30 06:52:58
49	136	5	2024-07-30 06:52:58	2024-07-30 06:52:58
50	136	6	2024-07-30 06:52:58	2024-07-30 06:52:58
51	137	1	2024-07-30 15:18:18	2024-07-30 15:18:18
52	137	2	2024-07-30 15:18:18	2024-07-30 15:18:18
53	137	3	2024-07-30 15:18:18	2024-07-30 15:18:18
54	137	4	2024-07-30 15:18:18	2024-07-30 15:18:18
55	137	5	2024-07-30 15:18:18	2024-07-30 15:18:18
56	137	6	2024-07-30 15:18:18	2024-07-30 15:18:18
62	134	1	2024-08-01 10:26:02	2024-08-01 10:26:02
63	134	2	2024-08-01 10:26:02	2024-08-01 10:26:02
64	134	3	2024-08-01 10:26:02	2024-08-01 10:26:02
65	134	4	2024-08-01 10:26:02	2024-08-01 10:26:02
74	144	1	2025-05-29 08:29:37	2025-05-29 08:29:37
75	144	2	2025-05-29 08:29:37	2025-05-29 08:29:37
76	155	1	2025-05-29 08:40:36	2025-05-29 08:40:36
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, description, title, image, created_at, updated_at) FROM stdin;
1	s	s		2025-05-26 17:57:00	\N
\.


--
-- Data for Name: nottification_tracks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nottification_tracks (id, type, from_user_id, to_user_id, firebase_node_id, created_at, updated_at, key_id) FROM stdin;
\.


--
-- Data for Name: order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_products (id, order_id, product_id, product_attribute_id, product_type, quantity, price, discount, total, vendor_id, order_status, admin_commission, vendor_commission, shipping_charge, delivered_on, is_returned, ret_status, returned_on, ret_reason, ret_status_changed_on, ret_status_changed_by, grand_total, admin_commission_percentage, service_id, item_type, address_id, car_id, booking_date, time_slot, service_booking_type, user_id) FROM stdin;
3	2	0	0	0	1	40	\N	\N	0	0	\N	\N	\N	\N	0	0	\N	\N	\N	0	42	\N	1	1	2	105	2025-06-22	12:00:00	2	161
4	2	0	0	0	1	40	\N	\N	0	0	\N	\N	\N	\N	0	0	\N	\N	\N	0	42	\N	2	1	2	105	2025-06-22	12:00:00	2	161
5	5	0	0	0	1	40	\N	\N	0	0	\N	\N	\N	\N	0	0	\N	\N	\N	0	42	\N	2	1	3	105	2025-06-22	12:00:00	2	161
6	5	0	0	0	1	40	\N	\N	0	0	\N	\N	\N	\N	0	0	\N	\N	\N	0	42	\N	2	1	3	105	2025-06-22	12:00:00	2	161
7	7	0	0	0	1	40	\N	\N	0	0	\N	\N	\N	\N	0	0	\N	\N	\N	0	42	\N	2	1	3	105	2025-06-22	12:00:00	2	161
8	7	0	0	0	1	40	\N	\N	0	0	\N	\N	\N	\N	0	0	\N	\N	\N	0	42	\N	2	1	3	105	2025-06-22	12:00:00	2	161
9	7	0	0	0	1	38	\N	\N	0	0	\N	\N	\N	\N	0	0	\N	\N	\N	0	39.9	\N	1	1	3	105	2025-06-22	12:00:00	1	161
10	15	0	0	0	1	40	\N	\N	0	0	\N	\N	\N	\N	0	0	\N	\N	\N	0	42	\N	1	1	17	110	2025-06-10	16:00:00	2	173
11	15	0	0	0	1	40	\N	\N	0	0	\N	\N	\N	\N	0	0	\N	\N	\N	0	42	\N	1	1	17	109	2025-06-06	17:00:00	2	173
12	16	0	0	0	1	38	\N	\N	0	0	\N	\N	\N	\N	0	0	\N	\N	\N	0	39.9	\N	1	1	17	110	2025-06-07	\N	1	173
13	18	0	0	0	1	40	\N	\N	0	0	\N	\N	\N	\N	0	0	\N	\N	\N	0	42	\N	1	1	17	110	2025-06-08	09:00:00	2	173
14	18	0	0	0	1	38	\N	\N	0	0	\N	\N	\N	\N	0	0	\N	\N	\N	0	39.9	\N	1	1	17	110	2025-06-07	\N	1	173
15	19	0	0	0	1	40	\N	\N	0	0	\N	\N	\N	\N	0	0	\N	\N	\N	0	42	\N	2	1	22	111	2025-06-07	17:00:00	2	174
16	19	0	0	0	1	40	\N	\N	0	0	\N	\N	\N	\N	0	0	\N	\N	\N	0	42	\N	1	1	22	111	2025-06-08	09:00:00	2	174
\.


--
-- Data for Name: order_status_histroys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_status_histroys (id, order_id, order_status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, invoice_id, user_id, address_id, total, vat, discount, grand_total, payment_mode, status, booking_date, total_qty, total_items_qty, oder_type, admin_commission, vendor_commission, shipping_charge, created_at, updated_at, coupon_code, coupon_id, store_id, request_deligate, order_otp, driver_id, driver_rating, store_rating) FROM stdin;
1	pi_3RWdWsBjsMxFtgBe1yCSdvys_secret_F9NDKDriNNJ3UFCRQMK6hXcWy	161	0	78	3.9	0	81.9	0	0	\N	0	0	0	0	0	0	2025-06-05 13:08:22	2025-06-05 13:08:22	\N	0	0	0	\N	0	0	0
2	pi_3RWdbwBjsMxFtgBe0jphN40F_secret_3CTZj5kqCAvFDcS4pEhuoFp9Q	161	0	78	3.9	0	81.9	1	0	\N	0	0	0	0	0	0	2025-06-05 13:13:36	2025-06-05 19:00:39	\N	0	0	0	\N	0	0	0
3	pi_3RWtHEBjsMxFtgBe0JFUSdog_secret_YoaxROSgo56DqC5i4pErTQy38	161	0	40	2	0	42	0	0	\N	0	0	0	0	0	0	2025-06-06 05:57:16	2025-06-06 05:57:16	\N	0	0	0	\N	0	0	0
4	pi_3RWtIVBjsMxFtgBe1y2ltnuI_secret_s8bozR7dDN1zLjq4DrsBYvohb	161	0	40	2	0	42	0	0	\N	0	0	0	0	0	0	2025-06-06 05:58:36	2025-06-06 05:58:36	\N	0	0	0	\N	0	0	0
5	pi_3RWx74BjsMxFtgBe10Gl2F8f_secret_SavuOpzT1QUUHUW1Ud60PxLwr	161	0	80	4	16	68	1	0	\N	0	0	0	0	0	0	2025-06-06 10:03:02	2025-06-06 10:04:22	20%	0	0	0	\N	0	0	0
6	pi_3RWxTWBjsMxFtgBe1AxVcSBa_secret_WGiBk5DrRiyV1dzgq08kyubfh	161	3	118	5.9	0	123.9	0	0	\N	0	0	0	0	0	0	2025-06-06 10:26:14	2025-06-06 10:26:14	\N	0	0	0	\N	0	0	0
7	pi_3RWxTcBjsMxFtgBe108yjQxL_secret_ygWzUEZ2LBKsEpdMiwIHEUMO3	161	3	118	5.9	23.6	100.3	1	0	\N	0	0	0	0	0	0	2025-06-06 10:26:21	2025-06-06 10:26:36	20%	0	0	0	\N	0	0	0
8	pi_3RX9JKBjsMxFtgBe1W9gLIZI_secret_4uKPAhTnq2rQNO9DYgQg5E0TW	173	17	80	4	16	68	0	0	\N	0	0	0	0	0	0	2025-06-06 23:04:31	2025-06-06 23:04:31	20%	0	0	0	\N	0	0	0
9	pi_3RX9Y1BjsMxFtgBe0byEznKH_secret_3PCdY7Oa9o1SoJchM5pvbcmFa	173	17	80	4	0	84	0	0	\N	0	0	0	0	0	0	2025-06-06 23:19:41	2025-06-06 23:19:41	\N	0	0	0	\N	0	0	0
10	pi_3RX9ZjBjsMxFtgBe15BN60Ci_secret_Qbmypy8QPxyBniDPKUaZ7VNXG	173	17	80	4	0	84	0	0	\N	0	0	0	0	0	0	2025-06-06 23:21:27	2025-06-06 23:21:27	\N	0	0	0	\N	0	0	0
11	pi_3RX9cABjsMxFtgBe0iIqLjT2_secret_wzjYNAVJ3LkiBtod14liwOAMY	173	17	80	4	0	84	0	0	\N	0	0	0	0	0	0	2025-06-06 23:23:58	2025-06-06 23:23:58	\N	0	0	0	\N	0	0	0
12	pi_3RX9cXBjsMxFtgBe0ItDkcOw_secret_Q6I4Yvf49Er0d3UXvLjXjjvMa	173	17	80	4	0	84	0	0	\N	0	0	0	0	0	0	2025-06-06 23:24:21	2025-06-06 23:24:21	\N	0	0	0	\N	0	0	0
13	pi_3RX9fuBjsMxFtgBe1JGXRXAD_secret_WkTfKCeUSnLTYMnNwszaDpLmR	173	17	80	4	0	84	0	0	\N	0	0	0	0	0	0	2025-06-06 23:27:50	2025-06-06 23:27:50	\N	0	0	0	\N	0	0	0
14	pi_3RX9gCBjsMxFtgBe1Sw6ICjp_secret_gr0BLJBKqADrxvkVWGbm2Rbla	173	17	80	4	0	84	0	0	\N	0	0	0	0	0	0	2025-06-06 23:28:09	2025-06-06 23:28:09	\N	0	0	0	\N	0	0	0
15	pi_3RX9hhBjsMxFtgBe15obRwNh_secret_XNViUc9tQE6uICU8Q5I6YqQ2T	173	17	80	4	0	84	1	0	\N	0	0	0	0	0	0	2025-06-06 23:29:41	2025-06-06 23:30:00	\N	0	0	0	\N	0	0	0
16	pi_3RX9kFBjsMxFtgBe0YMTd87p_secret_yh1GdzBgZeUFZV6WP8PS4NiPq	173	17	38	1.9	0	39.9	1	0	\N	0	0	0	0	0	0	2025-06-06 23:32:19	2025-06-06 23:32:39	\N	0	0	0	\N	0	0	0
17	pi_3RXKHaBjsMxFtgBe1BA3k1Sw_secret_73yDlcFirhCzWmpZ7WmNKZTa3	173	20	40	2	0	42	0	0	\N	0	0	0	0	0	0	2025-06-07 10:47:26	2025-06-07 10:47:26	\N	0	0	0	\N	0	0	0
18	pi_3RXKIlBjsMxFtgBe0wrNYdiw_secret_mE1OSDcRtqc9Yonnd745c1s51	173	17	78	3.9	15.6	66.3	1	0	\N	0	0	0	0	0	0	2025-06-07 10:48:39	2025-06-07 10:48:56	20%	0	0	0	\N	0	0	0
19	pi_3RXKbvBjsMxFtgBe0UoDxZEU_secret_kdFHPwc6Dn0JkdGEwfnRcFW6g	174	22	80	4	0	84	1	0	\N	0	0	0	0	0	0	2025-06-07 11:08:27	2025-06-07 11:08:42	\N	0	0	0	\N	0	0	0
20	pi_3RYNpUBjsMxFtgBe0IwgaPxF_secret_P3QWCczlOlzH8gJTubAcoqlCL	157	3	40	2	0	42	0	0	\N	0	0	0	0	0	0	2025-06-10 08:46:49	2025-06-10 08:46:49	\N	0	0	0	\N	0	0	0
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
1	1	P	8	1	115.50	1	5.50	0.00	2024-07-22 05:29:43	\N	\N
2	2	P	8	2	115.50	1	5.50	0.00	2024-07-22 05:38:06	\N	\N
3	3	P	8	3	115.50	1	5.50	0.00	2024-07-22 11:42:44	\N	\N
4	4	P	8		115.50	1	5.50	0.00	2024-07-22 12:09:06	\N	\N
5	5	P	8	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-22 12:10:05	\N	\N
6	6	P	8	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-22 12:11:40	\N	\N
9	9	P	116	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	490.00	1	5.50	0.00	2024-07-24 22:26:03	\N	\N
10	10	P	116	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	490.00	1	5.50	0.00	2024-07-24 22:58:58	\N	\N
11	11	P	116	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	490.00	1	5.50	0.00	2024-07-24 23:00:07	\N	\N
12	12	P	116	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	490.00	1	5.50	0.00	2024-07-24 23:49:24	\N	\N
13	13	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 07:14:58	\N	\N
14	14	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 07:15:56	\N	\N
15	15	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 07:18:34	\N	\N
16	16	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	505.50	1	5.50	0.00	2024-07-25 09:01:38	\N	\N
17	17	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 09:23:46	\N	\N
18	18	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 09:24:01	\N	\N
19	19	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 09:57:33	\N	\N
20	20	P	10	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 10:42:21	\N	\N
21	21	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 10:49:44	\N	\N
22	22	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 10:50:19	\N	\N
23	23	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 10:57:37	\N	\N
24	24	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 10:58:52	\N	\N
25	25	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 11:20:05	\N	\N
26	26	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 11:20:25	\N	\N
27	27	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 11:20:49	\N	\N
28	28	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 11:21:07	\N	\N
29	29	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 11:21:27	\N	\N
30	30	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 11:21:43	\N	\N
31	31	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	15.50	1	5.50	0.00	2024-07-25 12:37:24	\N	\N
32	32	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.50	1	5.50	0.00	2024-07-25 12:37:59	\N	\N
33	33	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	19.20	1	5.50	0.00	2024-07-25 12:41:04	\N	\N
34	34	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 12:41:12	\N	\N
35	35	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	30.20	1	5.50	0.00	2024-07-25 12:41:58	\N	\N
36	36	P	118	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 12:42:22	\N	\N
37	37	P	85	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	250.00	1	5.50	0.00	2024-07-25 13:26:58	\N	\N
38	38	P	85	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	250.00	1	5.50	0.00	2024-07-25 13:29:15	\N	\N
39	39	P	85	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	200.00	1	5.50	0.00	2024-07-25 15:12:33	\N	\N
40	40	P	125	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	490.00	1	5.50	0.00	2024-07-25 15:30:37	\N	\N
41	41	P	85	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	250.00	1	5.50	0.00	2024-07-25 15:39:22	\N	\N
42	42	P	85	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	250.00	1	5.50	0.00	2024-07-25 15:44:46	\N	\N
43	43	P	85	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 15:45:57	\N	\N
44	44	P	125	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	490.00	1	5.50	0.00	2024-07-25 16:29:26	\N	\N
45	45	P	125	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	490.00	1	5.50	0.00	2024-07-25 17:07:36	\N	\N
46	46	P	125	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	490.00	1	5.50	0.00	2024-07-25 17:13:53	\N	\N
47	47	P	125	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 17:17:08	\N	\N
48	48	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 17:17:32	\N	\N
49	49	P	125	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 17:18:12	\N	\N
50	50	P	125	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 17:18:33	\N	\N
51	51	P	125	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	490.00	1	5.50	0.00	2024-07-25 17:20:27	\N	\N
52	52	P	125	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	490.00	1	5.50	0.00	2024-07-25 17:22:25	\N	\N
53	53	P	125	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	490.00	1	5.50	0.00	2024-07-25 17:27:41	\N	\N
54	54	P	125	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	490.00	1	5.50	0.00	2024-07-25 17:29:39	\N	\N
55	56	P	125	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	490.00	1	5.50	0.00	2024-07-25 17:36:34	\N	\N
56	57	P	125	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	490.00	1	5.50	0.00	2024-07-25 17:46:40	\N	\N
57	58	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 19:10:02	\N	\N
58	59	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 19:10:45	\N	\N
59	60	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 19:38:06	\N	\N
60	61	P	116	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	490.00	1	5.50	0.00	2024-07-25 20:41:26	\N	\N
61	62	P	116	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	855.00	1	5.50	0.00	2024-07-25 20:43:25	\N	\N
62	63	P	116	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	1099.00	1	5.50	0.00	2024-07-25 20:43:55	\N	\N
63	64	P	10	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-25 23:27:13	\N	\N
65	66	P	10	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	222.00	1	5.00	0.00	2024-07-26 00:38:41	\N	\N
66	67	P	85	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-26 09:28:53	\N	\N
67	68	P	121	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-26 09:42:41	\N	\N
68	69	P	121	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-26 09:42:51	\N	\N
69	70	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-26 10:01:38	\N	\N
70	71	P	121	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-26 10:06:30	\N	\N
71	72	P	121	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-26 10:06:35	\N	\N
72	73	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-26 10:07:07	\N	\N
73	74	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-26 10:09:40	\N	\N
74	75	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-26 10:15:12	\N	\N
75	76	P	121	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-26 12:39:06	\N	\N
76	77	P	85	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-26 15:03:16	\N	\N
77	79	P	127	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-26 15:09:52	\N	\N
78	81	P	127	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-26 15:16:15	\N	\N
79	82	P	127	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-26 15:16:20	\N	\N
80	83	P	127	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-26 15:16:25	\N	\N
81	84	P	85	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-26 15:26:19	\N	\N
82	85	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-26 19:43:03	\N	\N
83	86	P	125	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	150.00	1	5.50	0.00	2024-07-26 20:36:02	\N	\N
84	87	P	125	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	150.00	1	5.50	0.00	2024-07-26 20:46:43	\N	\N
85	92	P	10	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	222.00	1	5.00	0.00	2024-07-27 23:13:37	\N	\N
86	95	P	10	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-27 23:22:55	\N	\N
87	96	P	10	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	222.00	1	5.00	0.00	2024-07-27 23:24:33	\N	\N
88	97	P	127	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 06:27:41	\N	\N
89	98	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 09:19:03	\N	\N
90	99	P	127	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 09:21:29	\N	\N
91	100	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 09:26:20	\N	\N
92	101	P	127	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 09:28:12	\N	\N
93	103	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 09:35:37	\N	\N
94	105	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 09:39:43	\N	\N
95	106	P	130	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	2855.00	1	5.50	0.00	2024-07-29 09:41:20	\N	\N
96	109	P	130	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 09:54:39	\N	\N
97	110	P	129	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	222.00	1	5.00	0.00	2024-07-29 10:39:04	\N	\N
98	111	P	129	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	222.00	1	5.00	0.00	2024-07-29 10:39:05	\N	\N
99	113	P	4	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 11:08:13	\N	\N
100	114	P	4	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 11:54:28	\N	\N
101	115	P	4	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 11:59:21	\N	\N
102	116	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 12:13:52	\N	\N
103	117	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 12:15:58	\N	\N
104	118	P	126	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	150.00	1	5.50	0.00	2024-07-29 12:58:23	\N	\N
105	119	P	130	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 13:16:36	\N	\N
106	120	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 15:58:50	\N	\N
107	121	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 16:01:18	\N	\N
108	122	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 16:03:42	\N	\N
109	123	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 16:06:00	\N	\N
110	125	P	132	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.00	1	5.00	0.00	2024-07-29 17:13:41	\N	\N
111	126	P	132	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.00	1	5.00	0.00	2024-07-29 17:26:25	\N	\N
112	127	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 17:32:44	\N	\N
113	128	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 17:46:54	\N	\N
114	129	P	10	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 18:23:05	\N	\N
115	130	P	129	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	222.00	1	5.00	0.00	2024-07-29 19:08:08	\N	\N
116	131	P	132	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 19:15:16	\N	\N
117	132	P	132	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.00	1	5.00	0.00	2024-07-29 19:32:45	\N	\N
118	135	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 20:10:00	\N	\N
119	137	P	10	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 20:57:37	\N	\N
120	138	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.00	1	5.00	0.00	2024-07-29 21:15:24	\N	\N
121	139	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.00	1	5.00	0.00	2024-07-29 21:21:01	\N	\N
122	140	P	10	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.00	1	5.00	0.00	2024-07-29 21:21:17	\N	\N
123	141	P	10	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	265.00	1	5.00	0.00	2024-07-29 21:26:27	\N	\N
124	142	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.00	1	5.00	0.00	2024-07-29 21:27:24	\N	\N
125	143	P	119	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-29 21:31:40	\N	\N
126	144	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.00	1	5.00	0.00	2024-07-29 21:33:21	\N	\N
127	145	P	85	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	150.00	1	5.50	0.00	2024-07-29 21:33:28	\N	\N
128	146	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.00	1	5.00	0.00	2024-07-29 21:37:58	\N	\N
129	147	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.00	1	5.00	0.00	2024-07-29 21:41:27	\N	\N
130	148	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.00	1	5.00	0.00	2024-07-29 21:49:32	\N	\N
131	149	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.00	1	5.00	0.00	2024-07-29 21:58:01	\N	\N
132	151	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.00	1	5.00	0.00	2024-07-29 22:20:34	\N	\N
133	152	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.00	1	5.00	0.00	2024-07-29 22:23:13	\N	\N
134	155	P	10	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.00	1	5.00	0.00	2024-07-29 22:50:05	\N	\N
136	163	P	85	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	0.00	1	5.50	0.00	2024-07-30 05:59:07	\N	\N
137	165	P	85	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	200.00	1	5.50	0.00	2024-07-30 06:03:45	\N	\N
138	170	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.00	1	5.00	0.00	2024-07-30 07:26:00	\N	\N
139	171	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.00	1	5.00	0.00	2024-07-30 07:29:35	\N	\N
140	172	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.00	1	5.00	0.00	2024-07-30 07:35:01	\N	\N
141	173	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.00	1	5.00	0.00	2024-07-30 07:35:17	\N	\N
142	174	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.00	1	5.00	0.00	2024-07-30 07:35:44	\N	\N
143	175	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.00	1	5.00	0.00	2024-07-30 07:55:38	\N	\N
144	178	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	315.00	1	5.00	0.00	2024-07-30 09:58:24	\N	\N
145	179	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	525.00	1	5.00	0.00	2024-07-30 09:59:29	\N	\N
146	187	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	525.00	1	25.00	0.00	2024-07-30 10:24:16	\N	\N
147	188	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-30 10:26:21	\N	\N
148	191	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	150.00	1	5.50	0.00	2024-07-30 10:34:13	\N	\N
149	192	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	110.00	1	5.50	0.00	2024-07-30 10:36:47	\N	\N
150	194	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-30 10:41:07	\N	\N
151	195	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	525.00	1	25.00	0.00	2024-07-30 10:43:29	\N	\N
152	196	P	85	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	210.00	1	10.00	0.00	2024-07-30 10:44:33	\N	\N
153	197	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	525.00	1	5.00	0.00	2024-07-30 10:48:44	\N	\N
154	198	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	525.00	1	25.00	0.00	2024-07-30 10:52:07	\N	\N
155	199	P	129	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	200.00	1	10.00	0.00	2024-07-30 10:52:27	\N	\N
156	200	P	129	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	100.00	1	5.00	0.00	2024-07-30 11:03:18	\N	\N
158	202	P	129	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	200.00	1	10.00	0.00	2024-07-30 11:06:23	\N	\N
159	203	P	129	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	200.00	1	10.00	0.00	2024-07-30 11:11:18	\N	\N
160	204	P	129	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	200.00	1	10.00	0.00	2024-07-30 11:11:25	\N	\N
161	205	P	129	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	200.00	1	10.00	0.00	2024-07-30 11:11:53	\N	\N
162	206	P	129	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	200.00	1	10.00	0.00	2024-07-30 11:13:05	\N	\N
163	207	P	129	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	200.00	1	10.00	0.00	2024-07-30 11:14:38	\N	\N
164	208	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	210.00	1	10.00	0.00	2024-07-30 11:15:46	\N	\N
165	209	P	129	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	200.00	1	10.00	0.00	2024-07-30 11:16:21	\N	\N
166	210	P	85	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	210.00	1	10.00	0.00	2024-07-30 11:16:35	\N	\N
167	211	P	85	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	230.00	1	0.00	0.00	2024-07-30 11:17:30	\N	\N
168	212	P	129	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	200.00	1	10.00	0.00	2024-07-30 11:17:38	\N	\N
169	213	P	10	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	215.00	1	5.00	0.00	2024-07-30 11:27:16	\N	\N
170	214	P	129	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	200.00	1	10.00	0.00	2024-07-30 11:47:21	\N	\N
171	215	P	129	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	200.00	1	10.00	0.00	2024-07-30 11:48:23	\N	\N
172	216	P	129	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	200.00	1	10.00	0.00	2024-07-30 11:48:59	\N	\N
173	217	P	10	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	200.00	1	10.00	0.00	2024-07-30 11:52:05	\N	\N
174	218	P	129	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	262.50	1	12.50	0.00	2024-07-30 13:56:44	\N	\N
175	219	P	129	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	262.50	1	12.50	0.00	2024-07-30 14:26:11	\N	\N
176	220	P	126	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	210.00	1	10.00	0.00	2024-07-30 14:57:20	\N	\N
177	221	P	126	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	210.00	1	10.00	0.00	2024-07-30 14:57:24	\N	\N
178	222	P	126	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	105.00	1	5.00	0.00	2024-07-30 14:59:37	\N	\N
179	223	P	126	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	105.00	1	5.00	0.00	2024-07-30 14:59:41	\N	\N
180	224	P	126	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	157.50	1	7.50	0.00	2024-07-30 15:08:06	\N	\N
181	225	P	138	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	105.00	1	5.00	0.00	2024-07-30 15:27:33	\N	\N
182	226	P	138	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	80.00	1	4.00	0.00	2024-07-30 15:30:14	\N	\N
184	230	P	139	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	105.00	1	5.00	0.00	2024-07-30 15:53:52	\N	\N
186	228	P	139	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	105.00	1	5.00	0.00	2024-07-30 15:54:29	\N	\N
187	231	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	630.00	1	30.00	0.00	2024-07-30 15:58:59	\N	\N
188	232	P	140	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	380.00	1	19.00	0.00	2024-07-30 16:47:41	\N	\N
189	233	P	140	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	262.50	1	12.50	0.00	2024-07-30 17:00:07	\N	\N
190	234	P	139	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	180.00	1	9.00	0.00	2024-07-30 17:00:33	\N	\N
191	235	P	139	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	180.00	1	9.00	0.00	2024-07-30 17:10:52	\N	\N
192	236	P	139	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	180.00	1	9.00	0.00	2024-07-30 17:18:15	\N	\N
193	237	P	139	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	189.00	1	9.00	0.00	2024-07-30 17:21:07	\N	\N
194	238	P	139	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	115.50	1	5.50	0.00	2024-07-30 17:30:27	\N	\N
195	239	P	142	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	399.00	1	19.00	0.00	2024-07-30 17:50:43	\N	\N
196	240	P	140	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	210.00	1	10.00	0.00	2024-07-30 17:57:41	\N	\N
197	241	P	141	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	682.50	1	32.50	0.00	2024-07-30 18:10:40	\N	\N
198	242	P	141	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	420.00	1	20.00	0.00	2024-07-30 18:26:12	\N	\N
199	243	P	126	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	210.00	1	10.00	0.00	2024-07-30 18:54:08	\N	\N
200	244	P	126	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	210.00	1	10.00	0.00	2024-07-30 18:55:16	\N	\N
201	245	P	126	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	210.00	1	10.00	0.00	2024-07-30 19:10:12	\N	\N
202	246	P	132	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	262.50	1	12.50	0.00	2024-07-30 19:33:08	\N	\N
203	247	P	133	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	105.00	1	5.00	0.00	2024-07-30 19:42:12	\N	\N
204	248	P	126	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	210.00	1	10.00	0.00	2024-07-31 03:32:25	\N	\N
205	249	P	126	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	210.00	1	10.00	0.00	2024-07-31 03:36:47	\N	\N
206	250	P	126	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	110.00	1	0.00	0.00	2024-07-31 03:38:59	\N	\N
207	258	P	146	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	210.00	1	10.00	0.00	2024-08-01 08:51:04	\N	\N
208	259	P	146	456dc6eb-b3f4-4507-8d1a-894ebd4dae21	420.00	1	20.00	0.00	2024-08-01 09:05:18	\N	\N
209	260	P	127	18fae6dc-8c8a-4741-9262-2cc8d50cbec9	115.50	1	5.50	0.00	2024-08-01 09:22:30	\N	\N
210	261	P	85	45918806-d0e7-40b4-ade7-739618964645	262.50	1	12.50	0.00	2024-08-01 09:24:08	\N	\N
211	262	P	127	cd3c2fcc-32a7-4f47-8a5b-846db356936a	115.50	1	5.50	0.00	2024-08-01 09:25:07	\N	\N
212	263	P	127	00730b9d-b2ff-4eca-baa5-4b7d8c03ea80	115.50	1	5.50	0.00	2024-08-01 09:25:46	\N	\N
213	264	P	85	9fcebc62-9373-4acc-aa68-954592397288	262.50	1	12.50	0.00	2024-08-01 09:27:21	\N	\N
214	265	P	146	6269a10f-3026-4966-821d-6791ea380f17	210.00	1	10.00	0.00	2024-08-01 09:35:16	\N	\N
215	266	P	146	769b9c13-50f9-4d83-a934-d37c136d7e5b	210.00	1	10.00	0.00	2024-08-01 09:35:45	\N	\N
216	267	P	146	5244bc54-1edc-498d-8cd4-78c5fb22bd90	210.00	1	10.00	0.00	2024-08-01 09:38:41	\N	\N
217	269	P	146	f1b838e7-736e-49ea-ab66-59ab537467c2	210.00	1	10.00	0.00	2024-08-01 09:49:33	\N	\N
218	270	P	146	8768b019-24ee-4cee-92be-4ea2346e6478	157.50	1	7.50	0.00	2024-08-01 10:04:55	\N	\N
219	271	P	146	abce09ef-443e-4add-9556-b6c9c05b0359	241.50	1	5.00	0.00	2024-08-01 10:08:24	\N	\N
220	272	P	85	d3805dab-7f74-4a9c-b1c6-d2f230f93eea	210.00	1	10.00	0.00	2024-08-01 10:18:42	\N	\N
221	281	P	126	95f21b58-1cbb-4468-8e92-8516525dc0ef	73.50	1	3.50	0.00	2024-08-01 12:08:11	\N	\N
222	282	P	147	ef2085b4-4d82-49af-898f-a17d08e23292	115.50	1	5.50	0.00	2024-08-01 12:11:26	\N	\N
223	290	P	126	dbaae569-78f2-42cc-80e2-1bbf782d5c97	210.00	1	10.00	0.00	2024-08-01 15:44:50	\N	\N
224	291	P	142	a44c033a-f04c-421c-8072-dad404446685	73.50	1	3.50	0.00	2024-08-01 16:31:38	\N	\N
225	294	P	148	8de305fd-a540-4aac-b090-17a4d7c8ba2b	283.50	1	13.50	0.00	2024-08-01 16:41:27	\N	\N
226	301	P	152	8c7cffc4-3e8c-4561-98c6-b5e308a02052	105.00	1	5.00	0.00	2024-08-02 13:05:23	\N	\N
227	303	P	150	3beced33-bdc0-458e-9ee9-1411cc90ae37	73.50	1	3.50	0.00	2024-08-02 21:16:45	\N	\N
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
1	App\\Models\\User	8	Personal Access Token	430b69481bd1c6d5bb17ca68f3591abc0e0e386484beae7665cb7e00942473a7	["*"]	\N	2024-07-19 04:05:51	2024-07-19 04:05:51
2	App\\Models\\User	9	Personal Access Token	e51a13dbb23c6b746bbaa5ed83e7961b3fefbccc3b603b8cc82d327a4790f0ef	["*"]	\N	2024-07-19 06:23:59	2024-07-19 06:23:59
3	App\\Models\\User	9	Personal Access Token	3d1e38295a1664009a8cd9325c839178f29892aeaca42508988928f6fd5fea0d	["*"]	\N	2024-07-19 06:24:27	2024-07-19 06:24:27
4	App\\Models\\User	9	Personal Access Token	275d21ae2fe7bb2698b4b015cfccdb32ba3a4dc692a8bf0c59e19583dd3ea968	["*"]	\N	2024-07-19 06:24:39	2024-07-19 06:24:39
5	App\\Models\\User	9	Personal Access Token	773d5376a44e7c5f535769a9f5c88276304b28c376572be0b32bfc3dd4564b6d	["*"]	\N	2024-07-19 06:25:13	2024-07-19 06:25:13
6	App\\Models\\User	9	Personal Access Token	e2d3935195584e326b676ad819227ba1688ed35bf91c2944c966380ca8dec4a5	["*"]	\N	2024-07-19 06:25:18	2024-07-19 06:25:18
7	App\\Models\\User	9	Personal Access Token	496bfe878078f2793533d3faf3104692e758d5de00cd0c08a9465d8918fb8dcb	["*"]	\N	2024-07-19 06:27:18	2024-07-19 06:27:18
8	App\\Models\\User	10	Personal Access Token	e68b5207ec7e35b9aaa01bae8db780621243cdc2579e39ebb36e682a5becaf83	["*"]	\N	2024-07-19 07:34:51	2024-07-19 07:34:51
9	App\\Models\\User	10	Personal Access Token	27793e8624ba58e1a3fc18c761bcd9973be7ba8744d934bf498fa0752f7adf76	["*"]	\N	2024-07-19 11:08:48	2024-07-19 11:08:48
10	App\\Models\\User	9	Personal Access Token	07fe6c2ea8b654e0ee67e4ffcacf46fe84d37ad18f204412f91dae56e30c9f21	["*"]	\N	2024-07-19 11:15:24	2024-07-19 11:15:24
11	App\\Models\\User	9	Personal Access Token	9fdee3f91cf8701787def8c19a047a9392cf2e193123d85ccc62986c85fa3e89	["*"]	\N	2024-07-19 11:15:53	2024-07-19 11:15:53
12	App\\Models\\User	10	Personal Access Token	396ca5fe5d67040ff8ba28932c2cf756d57721ec771f4efb40cc9fbe1f5befc6	["*"]	\N	2024-07-19 11:56:04	2024-07-19 11:56:04
13	App\\Models\\User	10	Personal Access Token	1f1e56f9efdee0409dd3bd9e2a455318d2679182f50692546d9e134dab55dacd	["*"]	\N	2024-07-19 20:01:20	2024-07-19 20:01:20
14	App\\Models\\User	10	Personal Access Token	1bc48b75fe02ab4f77bbc92e64aa9e72a769900ba52f7662ba7b6dc31e55130c	["*"]	\N	2024-07-19 20:01:36	2024-07-19 20:01:36
15	App\\Models\\User	10	Personal Access Token	113f72f82aaff60788b2c8a4643f3a92a1ca0c279808fa7824ec0d70a7b815ee	["*"]	\N	2024-07-19 20:19:51	2024-07-19 20:19:51
16	App\\Models\\User	10	Personal Access Token	7922aab59f1f846c6214217c648e57c778d2c7b99cfcdc900bd1b9f435fe4d66	["*"]	\N	2024-07-19 20:21:01	2024-07-19 20:21:01
17	App\\Models\\User	10	Personal Access Token	aa366b7e58f119c8d56756d962fa6266ea46cd01895f02e5ce0c985614f5e27c	["*"]	\N	2024-07-20 07:48:57	2024-07-20 07:48:57
18	App\\Models\\User	10	Personal Access Token	d9806f29deb3236d51f17bfc9c8dd46af697bc6d4982d6af145ab65bf3869b17	["*"]	\N	2024-07-20 07:49:06	2024-07-20 07:49:06
19	App\\Models\\User	15	Personal Access Token	3091ad6dff8a267e72a33301f1f1fe6056fe2c5e86b5fed900efb506a3a4274e	["*"]	\N	2024-07-20 08:04:58	2024-07-20 08:04:58
20	App\\Models\\User	10	Personal Access Token	c36f998e6b81e12448b9db73bb8f21a5e35d718f8edbc7e7c982c817e22305b9	["*"]	\N	2024-07-21 20:24:09	2024-07-21 20:24:09
21	App\\Models\\User	10	Personal Access Token	beae1badce6a9377b07fba0bea013923819aaccc67009ce74354c4fb0c43fe72	["*"]	\N	2024-07-21 20:24:17	2024-07-21 20:24:17
22	App\\Models\\User	16	Personal Access Token	e8959478bf61d4c2de00298efdd83ef567b5aeaedd123255a58ead87fe6a1538	["*"]	\N	2024-07-22 16:43:50	2024-07-22 16:43:50
23	App\\Models\\User	17	Personal Access Token	6a7b6cbd772de72da764c194e5482421b5a16ceb77f1c704669476875d0ee38f	["*"]	\N	2024-07-22 17:07:51	2024-07-22 17:07:51
24	App\\Models\\User	18	Personal Access Token	fe3e8afde1be969b4f58b4a7768fdf3e34274d11f0e2d108861287b266e6cce8	["*"]	\N	2024-07-22 17:13:34	2024-07-22 17:13:34
25	App\\Models\\User	19	Personal Access Token	45aac6982ab109dff3a7b7b2196f85d9e372bf4dfbdd4adc276ae832998f35d4	["*"]	\N	2024-07-22 17:15:45	2024-07-22 17:15:45
26	App\\Models\\User	20	Personal Access Token	77358f7cba1eccb23ab7fcecbc117befd9c91f859bf712561880076135f2a2c4	["*"]	\N	2024-07-22 17:17:10	2024-07-22 17:17:10
27	App\\Models\\User	21	Personal Access Token	089bce99b961e8b4f9c2a4241f0e20447e5081278e068d4d7b5176ea36977f29	["*"]	\N	2024-07-22 17:19:24	2024-07-22 17:19:24
28	App\\Models\\User	22	Personal Access Token	b0f705138c71ddf23ee476e84fb99292cfecea675b8af169f028f6046c2adef5	["*"]	\N	2024-07-22 17:20:32	2024-07-22 17:20:32
29	App\\Models\\User	23	Personal Access Token	397b83b320dc309e0d08426b951c20d5b1f1fd1be86f22ca72561f8484828b98	["*"]	\N	2024-07-22 17:23:25	2024-07-22 17:23:25
30	App\\Models\\User	24	Personal Access Token	324138a1b4fccb5e3b0cfb42e643dd6daa2f3bf8191814862a4e87c0584adb03	["*"]	\N	2024-07-22 17:25:29	2024-07-22 17:25:29
31	App\\Models\\User	25	Personal Access Token	a47f7c7598396cb06b4d4221e79c17c132b671f494002fedfdb781e699663eb9	["*"]	\N	2024-07-22 17:28:09	2024-07-22 17:28:09
32	App\\Models\\User	26	Personal Access Token	5d43cada573f476ad17aec18a0dd35cf788f5c45334d1936c583a647e470b08f	["*"]	\N	2024-07-22 17:49:06	2024-07-22 17:49:06
33	App\\Models\\User	27	Personal Access Token	0e7935b8783f693f60a30e9441c889f701635874281ec2b8f6cce9d4379a13d1	["*"]	\N	2024-07-22 18:13:36	2024-07-22 18:13:36
34	App\\Models\\User	29	Personal Access Token	c25ee443467ac83fd772984bd12451d28ebafbd186d45a1039e02c9f873d78a8	["*"]	\N	2024-07-22 18:45:10	2024-07-22 18:45:10
35	App\\Models\\User	30	Personal Access Token	0d3e6e866a371ea3e680c18da586cdf744d0a87216ccabcdf4b45d70097b388a	["*"]	\N	2024-07-22 18:59:34	2024-07-22 18:59:34
36	App\\Models\\User	31	Personal Access Token	c80f84b15aa60501849d0fca3fdd860f8ea53ad3d0637f49df9645748563da3c	["*"]	\N	2024-07-22 19:01:12	2024-07-22 19:01:12
37	App\\Models\\User	32	Personal Access Token	02b32f190b888f69d456e0d355f9a0f08e9c1f02ff0c58816cc2abea6156a402	["*"]	\N	2024-07-22 19:04:15	2024-07-22 19:04:15
38	App\\Models\\User	33	Personal Access Token	f0e406ebb13f479205d541099bb2537c463ef662d6f2758d0f3296e1a2addcc9	["*"]	\N	2024-07-22 19:14:29	2024-07-22 19:14:29
39	App\\Models\\User	34	Personal Access Token	6561ce9f4b4bec73906a658670fb56540fc7b518f160cec9cef71e0af5c163a6	["*"]	\N	2024-07-22 19:24:31	2024-07-22 19:24:31
40	App\\Models\\User	35	Personal Access Token	38e9e8a4abaa9e2d1a0d45a619dd34b4767bd0dc2dc8e156a88295014cea072e	["*"]	\N	2024-07-22 19:25:45	2024-07-22 19:25:45
41	App\\Models\\User	36	Personal Access Token	a879b1e6ad10107ba28d239a60519786919159526af5f0d73f13b3b2d0e06232	["*"]	\N	2024-07-22 19:29:48	2024-07-22 19:29:48
42	App\\Models\\User	37	Personal Access Token	2cc27698f93397915997eefc6dd3ca02ff5bf7d65ea017022c59d1ec96bd6132	["*"]	\N	2024-07-22 19:37:13	2024-07-22 19:37:13
43	App\\Models\\User	38	Personal Access Token	b8ed7e1a391daa3e9f6e674ef5accca29f13fdd791e15c91346e6f059d994795	["*"]	\N	2024-07-22 19:42:19	2024-07-22 19:42:19
44	App\\Models\\User	39	Personal Access Token	1b5d1d2bf7ddeacb17fa9bd7dfbd5ff45f4b6c491e414cd4f6bae477703bed4e	["*"]	\N	2024-07-22 19:56:45	2024-07-22 19:56:45
45	App\\Models\\User	40	Personal Access Token	6e4c220b5211b3869538f53e27ffeb44200c69b8180a22fb7f95a242ec0a35df	["*"]	\N	2024-07-22 20:05:15	2024-07-22 20:05:15
46	App\\Models\\User	41	Personal Access Token	32d2ceb18230ff049a58c1d0de46dc17c3f08cc7f79b48ad463990ba2d49209b	["*"]	\N	2024-07-22 20:12:02	2024-07-22 20:12:02
47	App\\Models\\User	42	Personal Access Token	71d4ac7ed816fb2fdfd5b69b708ca028ea56113405e9acfa80fe0bf12d89c310	["*"]	\N	2024-07-22 20:14:44	2024-07-22 20:14:44
48	App\\Models\\User	43	Personal Access Token	8b0f61e1a2420869cd003cab4f0008063662151b0499dc19913e9181e321f105	["*"]	\N	2024-07-22 20:23:24	2024-07-22 20:23:24
49	App\\Models\\User	44	Personal Access Token	5aa86d6ea9ef9481c53e4579cbe3e09b4256f35d6d1da69a77618f02ec6997e8	["*"]	\N	2024-07-22 20:50:05	2024-07-22 20:50:05
50	App\\Models\\User	45	Personal Access Token	2076fdb755afc3eb06bcbcdfe5b3b436cf909d64e960208735827ee240258a33	["*"]	\N	2024-07-22 20:51:20	2024-07-22 20:51:20
51	App\\Models\\User	45	Personal Access Token	1b87ddbbc7691c8483c267366ffd4542c2095af94e91c6197b4cd6ad955a186c	["*"]	\N	2024-07-22 20:51:24	2024-07-22 20:51:24
52	App\\Models\\User	46	Personal Access Token	e11dd710a967ac380008ad3e4f31e5534f31d939346b0f0bc8aeaa7ad6d17351	["*"]	\N	2024-07-22 20:51:32	2024-07-22 20:51:32
53	App\\Models\\User	47	Personal Access Token	10d1f26419a500ff1d68eb6db441c0ca4d546826aee39c61428332d45ab8b3ad	["*"]	\N	2024-07-22 20:56:13	2024-07-22 20:56:13
54	App\\Models\\User	48	Personal Access Token	1c445bf239470e4fc6a04fb20bc57352e859a3a25ff40f8ed99767ff410ca2c0	["*"]	\N	2024-07-22 20:57:42	2024-07-22 20:57:42
55	App\\Models\\User	49	Personal Access Token	a4742953a2ab9606713f2215f85fd1e41bff1d308973802414c49d02e500af3b	["*"]	\N	2024-07-22 21:02:32	2024-07-22 21:02:32
56	App\\Models\\User	27	Personal Access Token	307e8d22466a8b6e355c6b8117f09ece8a086db3b44dc86591fa40fc446f7d26	["*"]	\N	2024-07-22 21:05:02	2024-07-22 21:05:02
57	App\\Models\\User	50	Personal Access Token	37e4d0bcdeaa19c666687933bee7bcc8486f7deae8180e42cdbfe10439eba8bd	["*"]	\N	2024-07-22 21:05:14	2024-07-22 21:05:14
58	App\\Models\\User	51	Personal Access Token	976188b3d098894fd0ec9ed5c55c911d296c4db848913a15172bcd76808f47d1	["*"]	\N	2024-07-22 21:07:52	2024-07-22 21:07:52
59	App\\Models\\User	52	Personal Access Token	6a5f0e1f43c86a6f858dc0b0c88a475d44f07044a07c9b2f85aeb4830c10d59a	["*"]	\N	2024-07-22 21:09:19	2024-07-22 21:09:19
60	App\\Models\\User	53	Personal Access Token	2018eff67e0a38704f27207ae3c8c2c022c850f695aa3b6db2badc2d048be5ba	["*"]	\N	2024-07-22 21:14:37	2024-07-22 21:14:37
61	App\\Models\\User	54	Personal Access Token	18c9f71754625b8dab2a6761c16d967fdb922a6400c5f55492a6b9379d31e426	["*"]	\N	2024-07-22 21:15:43	2024-07-22 21:15:43
62	App\\Models\\User	55	Personal Access Token	27fe24e460a019ff4eac6d30bb8a862f0c94b158301962f9eab8d8d702be34e4	["*"]	\N	2024-07-22 21:16:32	2024-07-22 21:16:32
63	App\\Models\\User	56	Personal Access Token	b0bfe04645dd591cdd1173cac7669eff221576d757f5a62187fb69b540f5694c	["*"]	\N	2024-07-22 21:18:01	2024-07-22 21:18:01
64	App\\Models\\User	57	Personal Access Token	da3846e4d597ac44a5b4ccfd5bbff965780a4be240638fe0595d09537df07e0d	["*"]	\N	2024-07-22 21:29:57	2024-07-22 21:29:57
65	App\\Models\\User	58	Personal Access Token	f37f0755ee6a2aa830fc295afde46b1fe828ce6242848afa553d2aec8891b300	["*"]	\N	2024-07-22 21:34:01	2024-07-22 21:34:01
66	App\\Models\\User	59	Personal Access Token	e51f8a0d267bcba5d6305e730a5159d60fb895721cdcea8067257fb5e08a5a46	["*"]	\N	2024-07-22 21:36:12	2024-07-22 21:36:12
67	App\\Models\\User	60	Personal Access Token	7430cecd280b94e3d26ffcdcb44ec927f4f8f444541ce0c5d47e5c9d5d9461c7	["*"]	\N	2024-07-22 21:38:39	2024-07-22 21:38:39
68	App\\Models\\User	61	Personal Access Token	ac743dbc48f98468ffae9d8374c067efe979f9f21e7e3b129462654a8f207961	["*"]	\N	2024-07-22 21:43:28	2024-07-22 21:43:28
69	App\\Models\\User	62	Personal Access Token	a84f629daa04f123b1ee09da99c5ff9cdfaa5cf23e74c1b4e0009f50f3cd9f08	["*"]	\N	2024-07-22 21:45:12	2024-07-22 21:45:12
70	App\\Models\\User	63	Personal Access Token	e01390da5f66f3071653066f6a088a661da84b5488f549f82f0b607676d39c47	["*"]	\N	2024-07-22 21:46:50	2024-07-22 21:46:50
71	App\\Models\\User	64	Personal Access Token	b8a732696f3bf3eecfb07539175684ce0a05da5479775c6a23bcd2257e4bf154	["*"]	\N	2024-07-22 21:49:02	2024-07-22 21:49:02
72	App\\Models\\User	65	Personal Access Token	c49ea9b881d60450a164f62f5284b75921998d22903404e9ff3f02f3b650eb84	["*"]	\N	2024-07-22 22:21:53	2024-07-22 22:21:53
73	App\\Models\\User	66	Personal Access Token	896d3577f88289cbdd5aeb60d4b02f663c65cd779497cb646aab11ce54426d48	["*"]	\N	2024-07-23 13:01:14	2024-07-23 13:01:14
74	App\\Models\\User	67	Personal Access Token	75789800b21033d2bef7686293085e79e5d13c625b9b4a79a38abcae36d2db8f	["*"]	\N	2024-07-23 19:27:47	2024-07-23 19:27:47
75	App\\Models\\User	68	Personal Access Token	b3ce4a15045d0065d7d24ba2716abe224b7c8cba034737abd6a5556f6331ea4a	["*"]	\N	2024-07-23 19:59:37	2024-07-23 19:59:37
76	App\\Models\\User	69	Personal Access Token	352537a718b77cbe9a7a4f9ce58582220d978f51faa00175c55ba456733e10f5	["*"]	\N	2024-07-23 20:01:13	2024-07-23 20:01:13
77	App\\Models\\User	70	Personal Access Token	0b5a3929bdb92602cac28f0a7b77ca51fcafd4ae274a41ac0ebf5c077be36008	["*"]	\N	2024-07-23 20:05:34	2024-07-23 20:05:34
78	App\\Models\\User	71	Personal Access Token	4634d9aa5c5f58890e298f1af82ffa82fbf185e8032e597f92623327fdc09f75	["*"]	\N	2024-07-23 20:09:16	2024-07-23 20:09:16
79	App\\Models\\User	72	Personal Access Token	fed3077d55262de4f0fa766c295d41fdc4579c7febd02419d1d549bab2e0b664	["*"]	\N	2024-07-23 20:10:35	2024-07-23 20:10:35
80	App\\Models\\User	73	Personal Access Token	01d1a93c23a9480d660d60655864d536f04d150737d5fe4ebb73947d23e76d11	["*"]	\N	2024-07-23 20:12:36	2024-07-23 20:12:36
81	App\\Models\\User	74	Personal Access Token	40b56f803836c4725f7125f1b8c13ce789f1cae654e1c155a3bc0ac90da63986	["*"]	\N	2024-07-23 20:14:21	2024-07-23 20:14:21
82	App\\Models\\User	10	Personal Access Token	774605659c46142920b45f0dde6b2a10191788b9a5d0bb1b2da82da8a036115e	["*"]	\N	2024-07-23 22:48:26	2024-07-23 22:48:26
83	App\\Models\\User	10	Personal Access Token	1f4d3df4eaedbc0d04b1b5ef66d63d5a4b3486d540f6ef24ed836eb3d0da6a10	["*"]	\N	2024-07-23 22:48:41	2024-07-23 22:48:41
84	App\\Models\\User	75	Personal Access Token	f7eb8808e59dc3806887c9fb815467ed8e7aa0bbbac23c46788b2cfb0ac3a8e1	["*"]	\N	2024-07-24 05:53:54	2024-07-24 05:53:54
85	App\\Models\\User	76	Personal Access Token	c5f2f97e971400ce86e400cccb0d4c2e75224bb087790cf08a465ff25ea037af	["*"]	\N	2024-07-24 06:55:50	2024-07-24 06:55:50
86	App\\Models\\User	4	Personal Access Token	ab0d6ad3d7cc14d3e59987b8c6298733b57fa99ac3894acc344b6885cdb7c87c	["*"]	\N	2024-07-24 06:58:54	2024-07-24 06:58:54
87	App\\Models\\User	77	Personal Access Token	80758042fcff8c7c86de3bc949c3178c026d938a189840b9dbde2d7344d2f9dd	["*"]	\N	2024-07-24 07:02:23	2024-07-24 07:02:23
88	App\\Models\\User	78	Personal Access Token	2dc3c8f29bcf93a3cf24c068c548d6226dfaa1699b2fbd8333d4e3a9a69856b5	["*"]	\N	2024-07-24 07:28:19	2024-07-24 07:28:19
89	App\\Models\\User	4	Personal Access Token	34adf5ede9176a6902e4b624080d65ba588474f4637b2f782869a8d4244b4db9	["*"]	\N	2024-07-24 07:48:59	2024-07-24 07:48:59
90	App\\Models\\User	9	Personal Access Token	98917843ed9e1196280f6af4dde740b7987fb72bd1ecd662f8b9f11d9f91acf5	["*"]	\N	2024-07-24 08:03:05	2024-07-24 08:03:05
91	App\\Models\\User	9	Personal Access Token	c123d253df58c033a6bd30905a28098c1e49b039565171f29f16e1114a14bb7c	["*"]	\N	2024-07-24 08:03:45	2024-07-24 08:03:45
92	App\\Models\\User	4	Personal Access Token	036351f9175ee740e6f3a7ec203a520f4af25331ab580dcfdc8b5d6d9fde51c8	["*"]	\N	2024-07-24 08:09:32	2024-07-24 08:09:32
93	App\\Models\\User	79	Personal Access Token	7c429d01931c39a55b504610b6abc0ef2af95ed1b4691563c9e552462b2e6dc4	["*"]	\N	2024-07-24 08:22:31	2024-07-24 08:22:31
94	App\\Models\\User	80	Personal Access Token	a18fcd7677da4249157607a34107283f890b303a66620ecfff288246fea06928	["*"]	\N	2024-07-24 08:26:07	2024-07-24 08:26:07
95	App\\Models\\User	81	Personal Access Token	c6ba4efb8b1922e94ee48144973e721a62595f8c842b6e04de43cd1ff35e8d62	["*"]	\N	2024-07-24 08:45:13	2024-07-24 08:45:13
96	App\\Models\\User	82	Personal Access Token	71061241928f16b5a9430641b8313d3c97b2eaacc20c9c3b8a4b98242bd20466	["*"]	\N	2024-07-24 09:05:47	2024-07-24 09:05:47
97	App\\Models\\User	4	Personal Access Token	0294e574c2cd10bf1809880baf2c877ab03897715140ed0ef985ad4da22d6a37	["*"]	\N	2024-07-24 09:07:36	2024-07-24 09:07:36
98	App\\Models\\User	75	Personal Access Token	5131ffb0a4bf299c30f349a270dfa4aa846e072843886ac7777a3cfbdbcc2fec	["*"]	\N	2024-07-24 09:35:17	2024-07-24 09:35:17
99	App\\Models\\User	75	Personal Access Token	c5456b3009f4f4d7406ea9ca44e564759027bf986efe17ae026f8f3be2a069b9	["*"]	\N	2024-07-24 09:36:34	2024-07-24 09:36:34
100	App\\Models\\User	75	Personal Access Token	707b3bda329343e2c52ee39e62b88ac11408204a0ff8997bccb5378c5aa574af	["*"]	\N	2024-07-24 09:36:38	2024-07-24 09:36:38
101	App\\Models\\User	75	Personal Access Token	506d9d54af27c30915607471c159981cd549f484ff91604418f12bc9f2a4063e	["*"]	\N	2024-07-24 09:36:56	2024-07-24 09:36:56
102	App\\Models\\User	83	Personal Access Token	e7886befa3f846f566bbffdeb8fbf32a4b7707682ca940b65de75dc6e6f15037	["*"]	\N	2024-07-24 09:38:34	2024-07-24 09:38:34
103	App\\Models\\User	75	Personal Access Token	dd11a22b16111d0568c8a8c110ce056a6bab51ad8e735e2b5382bb1bc9e9d5e1	["*"]	\N	2024-07-24 09:39:51	2024-07-24 09:39:51
104	App\\Models\\User	75	Personal Access Token	70556cf851fc8973abf0e2434c396bb743312ee46afec371720112f637025535	["*"]	\N	2024-07-24 09:39:57	2024-07-24 09:39:57
105	App\\Models\\User	75	Personal Access Token	164996b1a823e9b97fe14a22015cf804be3b1907cdeb5da8b9b89d898cd56bb4	["*"]	\N	2024-07-24 09:40:15	2024-07-24 09:40:15
106	App\\Models\\User	75	Personal Access Token	c3cc5a57f9902197ca3b2966efac3c8560a08a411663c28622c36e4131dc0615	["*"]	\N	2024-07-24 09:40:35	2024-07-24 09:40:35
107	App\\Models\\User	75	Personal Access Token	d768ff0749d3d94218d89a9e0467c76fb6e2e80a88006c70243644a15158d9b1	["*"]	\N	2024-07-24 09:41:06	2024-07-24 09:41:06
108	App\\Models\\User	75	Personal Access Token	c29c2d7fac8dd4f7ab741ae5ea211030667a249c9f2ab78cbc1fd76c9f2a4ffa	["*"]	\N	2024-07-24 09:42:37	2024-07-24 09:42:37
109	App\\Models\\User	84	Personal Access Token	3660e9485bb04720d80a74e0b36fff8b92a642d265af929d4bb3f275f5d9662f	["*"]	\N	2024-07-24 09:44:17	2024-07-24 09:44:17
110	App\\Models\\User	75	Personal Access Token	89bd04a7879223e66582a0e1fd50007af54164a483c12b823f45bbc3bd338f06	["*"]	\N	2024-07-24 09:45:11	2024-07-24 09:45:11
111	App\\Models\\User	75	Personal Access Token	5255e3a7eef44f4caf04bb758f65d067905af9f54252888873586f13637c8fd1	["*"]	\N	2024-07-24 09:50:08	2024-07-24 09:50:08
112	App\\Models\\User	85	Personal Access Token	0cbb45c923f3ad08a83a28d8cdb1ac9f7f40f4845c47f205e0450faa1863d441	["*"]	\N	2024-07-24 09:56:23	2024-07-24 09:56:23
113	App\\Models\\User	85	Personal Access Token	12950f929151f18071a28b94bfd9110228af4b1469e39b0047211845a8cbf5b7	["*"]	\N	2024-07-24 09:58:53	2024-07-24 09:58:53
114	App\\Models\\User	85	Personal Access Token	c04d6e57ffd08fc5ba92b7e8ab76634065bee2483b03f8c31d7f49006b4a7493	["*"]	\N	2024-07-24 10:00:10	2024-07-24 10:00:10
115	App\\Models\\User	85	Personal Access Token	702d092da305fa00033668a7c3ea0724ee777cf1f30fbc8ce7fb9a394f6fe0f7	["*"]	\N	2024-07-24 10:03:06	2024-07-24 10:03:06
116	App\\Models\\User	85	Personal Access Token	3e892a73731818a984dc800dac6d74750a6e35591ab1cf818e95f53061d03562	["*"]	\N	2024-07-24 10:03:13	2024-07-24 10:03:13
117	App\\Models\\User	85	Personal Access Token	de0b84e7ee1921d27cefce26fd2f0492e7237467560a85765e5621ff7f82af57	["*"]	\N	2024-07-24 10:53:47	2024-07-24 10:53:47
118	App\\Models\\User	85	Personal Access Token	5e849fe563f6f7c024f6efecd39a2eef116887f72060a2d3e391cee8313e2a3c	["*"]	\N	2024-07-24 10:53:54	2024-07-24 10:53:54
119	App\\Models\\User	86	Personal Access Token	6aa6c35d909c38bf16cac6f65ba4c95cb9ebf1c2f2e42af0ed504d75afd46c95	["*"]	\N	2024-07-24 11:11:29	2024-07-24 11:11:29
120	App\\Models\\User	87	Personal Access Token	78ce64f65403fa88a16dd249b2e0b9b22655a0de4c41ccd69b8acc8653d8a94c	["*"]	\N	2024-07-24 11:13:43	2024-07-24 11:13:43
121	App\\Models\\User	88	Personal Access Token	f33e2df00fadbeca4f83226969cccf1b5d490fd87e08d6a6208fe9cbbf1ee4ea	["*"]	\N	2024-07-24 11:15:25	2024-07-24 11:15:25
122	App\\Models\\User	89	Personal Access Token	54d67a9bbfd6d7483537a9b4b3b0267256ac530f861a720b87e97df873d138e2	["*"]	\N	2024-07-24 11:21:18	2024-07-24 11:21:18
123	App\\Models\\User	90	Personal Access Token	21076d580806e510840c5b84778aa9be9404aabc4f96cc9bbdba8bac3c9ce187	["*"]	\N	2024-07-24 11:22:49	2024-07-24 11:22:49
124	App\\Models\\User	91	Personal Access Token	469425350eb8c5a199398453bf3d86329a0a8218d1453f55d4a53da5a7948eb1	["*"]	\N	2024-07-24 11:24:55	2024-07-24 11:24:55
125	App\\Models\\User	92	Personal Access Token	ab24d30f7678f57df9877ea83f813b25599756ffc5659e5da98f71d5ff9afd06	["*"]	\N	2024-07-24 11:26:03	2024-07-24 11:26:03
126	App\\Models\\User	93	Personal Access Token	c5c10d44ff6ce25123266eb2cd8c8e8234c35e952c886f6cc4e8dea394b0eddb	["*"]	\N	2024-07-24 11:27:26	2024-07-24 11:27:26
127	App\\Models\\User	94	Personal Access Token	4025c5d3a7267f438abf50e1c82fc4de20efb6feb89553ef04eed6e10b5331af	["*"]	\N	2024-07-24 11:29:47	2024-07-24 11:29:47
128	App\\Models\\User	85	Personal Access Token	e9621f529193b2c2d284e5b83a4fe015f84742d0f4a2a0d5a23cade7150890bc	["*"]	\N	2024-07-24 11:30:01	2024-07-24 11:30:01
129	App\\Models\\User	85	Personal Access Token	8fd11aed26244dd07fbf30850d8cd68b0259c1495d9eb6de3991409d27de6f80	["*"]	\N	2024-07-24 11:30:07	2024-07-24 11:30:07
130	App\\Models\\User	95	Personal Access Token	2d75391ddd2b6f4c485e0c5e8936f89f8e83f26a9b3966048fe105a3f09d46f7	["*"]	\N	2024-07-24 11:31:11	2024-07-24 11:31:11
131	App\\Models\\User	85	Personal Access Token	0768d0e15ebc816717ea73186c8907ab78fa142b3e41dfdd4cd71bdc3e894d29	["*"]	\N	2024-07-24 11:34:46	2024-07-24 11:34:46
132	App\\Models\\User	85	Personal Access Token	9575ffb063116cadb99e4f5e3abe6a0dc2c15cf8ab3af6bd072f3115ce85d0c7	["*"]	\N	2024-07-24 11:35:14	2024-07-24 11:35:14
133	App\\Models\\User	10	Personal Access Token	26b8723be0ed0f723802fd02c7578bf2d6e88e4f596aa58cbeed263103f51226	["*"]	\N	2024-07-24 11:35:28	2024-07-24 11:35:28
134	App\\Models\\User	10	Personal Access Token	d02f6efd15d964b9b15f39d3f6b65b7c34a20dcdc8cff780369af60304a4af3b	["*"]	\N	2024-07-24 11:35:34	2024-07-24 11:35:34
135	App\\Models\\User	10	Personal Access Token	ee0e6c0e633c1aefda8d5694fee728ebf9e6c3307a1014127e5c65c6d611d953	["*"]	\N	2024-07-24 11:35:55	2024-07-24 11:35:55
136	App\\Models\\User	10	Personal Access Token	96c529b7a5a6127d65fc0445d4a4c3bd83ba0eb606dd649ee66ce5766c58fc37	["*"]	\N	2024-07-24 11:36:00	2024-07-24 11:36:00
137	App\\Models\\User	96	Personal Access Token	679591be1d51128cbba313febe7422d707b3d2b5bb5a190a35ac7dbfd824c62c	["*"]	\N	2024-07-24 11:36:17	2024-07-24 11:36:17
138	App\\Models\\User	85	Personal Access Token	118689b27577793c39eebb143b5fd0855634c8dce686f16c956a79841547a8ae	["*"]	\N	2024-07-24 11:36:53	2024-07-24 11:36:53
139	App\\Models\\User	85	Personal Access Token	b67ee94c6fa7bf07be3f5087bfaf32a34fb1d96053e88fb32f194e1c247b2753	["*"]	\N	2024-07-24 11:37:00	2024-07-24 11:37:00
140	App\\Models\\User	97	Personal Access Token	a6e84f1eec8239268ea4968310b9da1b43106c723e573f683ff5033a493b1a48	["*"]	\N	2024-07-24 11:40:05	2024-07-24 11:40:05
141	App\\Models\\User	85	Personal Access Token	4985e6b5eda44e36cfad38069be75c9b5b95eb73f21b6160bfc7ca090cff5f74	["*"]	\N	2024-07-24 11:40:29	2024-07-24 11:40:29
142	App\\Models\\User	85	Personal Access Token	60bdb4ea58500d558ad8e5e7833cb0c82406716b796567415899a80057d2208c	["*"]	\N	2024-07-24 11:40:34	2024-07-24 11:40:34
143	App\\Models\\User	10	Personal Access Token	4a65be7f457cb6c3a9ec86f92f8d70df363d68014e0defb640bea22d48d9c55a	["*"]	\N	2024-07-24 11:43:58	2024-07-24 11:43:58
144	App\\Models\\User	10	Personal Access Token	b02846d6ef3e765a8ef8b01d1bdfe8e41765ca69b9652898ac169f82f2857078	["*"]	\N	2024-07-24 11:44:05	2024-07-24 11:44:05
145	App\\Models\\User	85	Personal Access Token	d8c45152a880f6bf4fe30062fc2210bb915479deeab53a6d1ef275b05f53ae73	["*"]	\N	2024-07-24 11:45:48	2024-07-24 11:45:48
146	App\\Models\\User	85	Personal Access Token	56f34eb120cf2b00425cd461c8f4ed906d24cb4698bb4be7ebd66f5aa3b46eef	["*"]	\N	2024-07-24 11:45:54	2024-07-24 11:45:54
147	App\\Models\\User	98	Personal Access Token	302db1a0fb361faf70abbc486a58d7947fa66afc7b0c17a9c2d41047095bea13	["*"]	\N	2024-07-24 11:49:34	2024-07-24 11:49:34
148	App\\Models\\User	99	Personal Access Token	ced080ed729057accfce019565965efb37c41d124c622f4df15386388cae6e80	["*"]	\N	2024-07-24 11:51:18	2024-07-24 11:51:18
149	App\\Models\\User	100	Personal Access Token	56569f701c7225d8f5c027cdbd2aa41a26d1086dc0defb2af1cd496476595eff	["*"]	\N	2024-07-24 11:52:34	2024-07-24 11:52:34
150	App\\Models\\User	101	Personal Access Token	84b55299275393616a14fb02dcb1ce00396841cf6e497775c5630107471cff2a	["*"]	\N	2024-07-24 12:14:30	2024-07-24 12:14:30
151	App\\Models\\User	4	Personal Access Token	cdf83f4a6434200d65d47bb6019623966df74d214542988d240b0324b027d378	["*"]	\N	2024-07-24 12:43:29	2024-07-24 12:43:29
152	App\\Models\\User	102	Personal Access Token	b74f504f6a63d2ee98a86882ac07574fce7d8d08859747e64da1747a8f41c538	["*"]	\N	2024-07-24 12:44:09	2024-07-24 12:44:09
153	App\\Models\\User	103	Personal Access Token	f6cc18109e04fb9ae42ae862aa9b3d2b59e4b316169510f565b755b37fdab92f	["*"]	\N	2024-07-24 12:49:38	2024-07-24 12:49:38
154	App\\Models\\User	104	Personal Access Token	8982a1d317607579b825c6a9060ef9ba7de7c4df4663904c9c2e24f8889d7553	["*"]	\N	2024-07-24 13:13:07	2024-07-24 13:13:07
155	App\\Models\\User	105	Personal Access Token	01c56db932ff1036bd346e85ae6d0ba16e6cb7a1204f0232aae161743a0ab862	["*"]	\N	2024-07-24 13:15:11	2024-07-24 13:15:11
156	App\\Models\\User	106	Personal Access Token	b745b3d1b180582021a590f6018b240832050953bb66e7e672bba1684c5195d5	["*"]	\N	2024-07-24 13:17:15	2024-07-24 13:17:15
157	App\\Models\\User	107	Personal Access Token	1c5cf2c0b26c4f7779f2e65a7cebfe74d0f4a535ae1dddd779e3e8c61e53cbdd	["*"]	\N	2024-07-24 13:21:56	2024-07-24 13:21:56
158	App\\Models\\User	108	Personal Access Token	1dd60c52b16ef2e211cdea33852fa5bfff1a6de731d5acefc0d3d153e4acb9be	["*"]	\N	2024-07-24 13:24:18	2024-07-24 13:24:18
159	App\\Models\\User	109	Personal Access Token	062258a4586138e602bc5cdd4f1ac6390d9d7a5b08e11f2f8885e5a61b5c0d26	["*"]	\N	2024-07-24 13:36:21	2024-07-24 13:36:21
160	App\\Models\\User	110	Personal Access Token	5c5cda296c1a482cb610388a5698fb4331deb6d61717ca384187d295f3fee677	["*"]	\N	2024-07-24 13:42:38	2024-07-24 13:42:38
161	App\\Models\\User	85	Personal Access Token	65a949e2a3a92460063429e8ddf9972971c8371afd7c8308203727d5011f0e9a	["*"]	\N	2024-07-24 13:45:22	2024-07-24 13:45:22
162	App\\Models\\User	85	Personal Access Token	aefea7082d771bab9abb0a3c5b7ea73b1f6cc91bff641da132b766c489349511	["*"]	\N	2024-07-24 13:45:28	2024-07-24 13:45:28
163	App\\Models\\User	85	Personal Access Token	5a24a755c714097abf5cdae28dc59493006c6c5d724a105641aa8cf1f6df78cd	["*"]	\N	2024-07-24 14:10:29	2024-07-24 14:10:29
164	App\\Models\\User	85	Personal Access Token	bc844cbccd07228e11a0ed7491fa94642773c252cf973dc9b1db0b1199ad97a8	["*"]	\N	2024-07-24 14:10:35	2024-07-24 14:10:35
165	App\\Models\\User	85	Personal Access Token	c37e258b6076bce8be0b64bf5f40fe62d8ec3ed936bae51743ff5c7dccee49f3	["*"]	\N	2024-07-24 14:12:54	2024-07-24 14:12:54
166	App\\Models\\User	85	Personal Access Token	e14636a773116be69b109d02b7bbbcb7f46bc6f605eedea6c021dc4c2cba8e4c	["*"]	\N	2024-07-24 14:13:00	2024-07-24 14:13:00
167	App\\Models\\User	111	Personal Access Token	ed07e459f2d3a1538469b8f4e3c578cb01d05573a66d6b946c87396ab59f90c5	["*"]	\N	2024-07-24 15:42:18	2024-07-24 15:42:18
168	App\\Models\\User	112	Personal Access Token	053d0d25a639e060c5eb80ff6d10807b389fb96aae41d7c1e97c1eda3ed9e04d	["*"]	\N	2024-07-24 15:44:14	2024-07-24 15:44:14
169	App\\Models\\User	113	Personal Access Token	3cf391174fea6bacae5db9e453f6dc2955b868725abb05f2efd2915e7198d598	["*"]	\N	2024-07-24 15:47:23	2024-07-24 15:47:23
170	App\\Models\\User	114	Personal Access Token	086b68674e2742cc0ade22295c39995db9b61d02f49076ab465898f27ae28d70	["*"]	\N	2024-07-24 15:49:21	2024-07-24 15:49:21
171	App\\Models\\User	115	Personal Access Token	d2b216ad73f7c4a02e2f32b569648d0455df4cd9c0fb35defb79cea29eac92be	["*"]	\N	2024-07-24 17:28:51	2024-07-24 17:28:51
172	App\\Models\\User	116	Personal Access Token	4b6c0ea74945d6071b7adcb8e16d2ced0d2c426aeac76cd430280d1243703428	["*"]	\N	2024-07-24 17:37:13	2024-07-24 17:37:13
173	App\\Models\\User	4	Personal Access Token	dede8bf91589bd44388f72dcafa91e73941278d631497e96613a9649399e0c57	["*"]	\N	2024-07-24 23:48:36	2024-07-24 23:48:36
174	App\\Models\\User	76	Personal Access Token	6d5ad59400a56388359840a6b5208ac006b7126731a863a956d9e003fdbc398a	["*"]	\N	2024-07-25 05:00:52	2024-07-25 05:00:52
175	App\\Models\\User	76	Personal Access Token	60317c83d389df85247f33fb57cf4106ed7b42e55d2a6425c3da980a63f57bf2	["*"]	\N	2024-07-25 05:01:02	2024-07-25 05:01:02
176	App\\Models\\User	76	Personal Access Token	ec76b5324ab78ecb16a17289aac20ae8cbaa22809d739c21c29e5fa1da1258fc	["*"]	\N	2024-07-25 05:01:38	2024-07-25 05:01:38
177	App\\Models\\User	117	Personal Access Token	7084a36dc507192ddaacf3bac2f0f0ed140cec73e3f8b0055061d296155a4b8b	["*"]	\N	2024-07-25 05:19:33	2024-07-25 05:19:33
178	App\\Models\\User	85	Personal Access Token	10ad2e13c9b182bec94d4eaa9173cf4f7642b29bc3ab8c78c80bccd384fba26e	["*"]	\N	2024-07-25 06:58:46	2024-07-25 06:58:46
179	App\\Models\\User	85	Personal Access Token	8019490ec89d9772522e75b23fbd96fa0509102968be600738c95bb173aa1922	["*"]	\N	2024-07-25 06:59:16	2024-07-25 06:59:16
180	App\\Models\\User	118	Personal Access Token	484545694a6f56dfd8a4f0d9b64fcfab43472fd86c839ae590f189283ffd4480	["*"]	\N	2024-07-25 07:10:00	2024-07-25 07:10:00
181	App\\Models\\User	85	Personal Access Token	0c200ac4dd651b3daf36b5dc4afc8c2ee2bd1c78c36d6fbcf410fb8e00cd2e75	["*"]	\N	2024-07-25 07:23:41	2024-07-25 07:23:41
182	App\\Models\\User	85	Personal Access Token	e12de468853aa735848c78c74f127b26d0bbf053f19c9c6409680acf74935ed1	["*"]	\N	2024-07-25 07:23:53	2024-07-25 07:23:53
183	App\\Models\\User	4	Personal Access Token	053c453264d5a6b70e83afa9db4ce5ea2d5bb4d84342a9175e6cf9d236660f05	["*"]	\N	2024-07-25 07:49:40	2024-07-25 07:49:40
184	App\\Models\\User	119	Personal Access Token	0a0527129cb9b67f20fcf71b40191d0993d9302cd271b196d336fa3bc1c8ca55	["*"]	\N	2024-07-25 08:00:54	2024-07-25 08:00:54
185	App\\Models\\User	4	Personal Access Token	cf03dae10a410a46d4c3b5771a4c5c2b3dc7ce4d4b60d8d0595582ca0c6febab	["*"]	\N	2024-07-25 08:12:37	2024-07-25 08:12:37
186	App\\Models\\User	4	Personal Access Token	f001cedd0b066d278adb757547bf46919aa0236b7f3544ce47e5ea32fa0092d4	["*"]	\N	2024-07-25 08:15:40	2024-07-25 08:15:40
187	App\\Models\\User	85	Personal Access Token	6c4afae6db33a9970ed6834640e029f4b9326507af67d6adc17a5d330163b3a5	["*"]	\N	2024-07-25 08:17:07	2024-07-25 08:17:07
188	App\\Models\\User	85	Personal Access Token	daeb941080206b4ee92cda0a936c0abfbc60c868f3020c3defa693370d75e47b	["*"]	\N	2024-07-25 08:17:13	2024-07-25 08:17:13
189	App\\Models\\User	118	Personal Access Token	2e2e57534e598333f1eeff13b27fddab7c98de036962309d9adf23f2e562a341	["*"]	\N	2024-07-25 09:23:24	2024-07-25 09:23:24
190	App\\Models\\User	118	Personal Access Token	9607952d996cb678951f3ee03d56de7225408415ef26f03df220e7d83bcc23bd	["*"]	\N	2024-07-25 09:23:32	2024-07-25 09:23:32
191	App\\Models\\User	118	Personal Access Token	c70e9ade66288eb7b41f851ce5d3a5e27143fcd3662aff63e39875be41b21fd1	["*"]	\N	2024-07-25 09:29:25	2024-07-25 09:29:25
192	App\\Models\\User	118	Personal Access Token	98c2cd8be8d6ee529731d16cd5a822aef2bd59f8be2db2eb753287a4f534de6d	["*"]	\N	2024-07-25 09:29:36	2024-07-25 09:29:36
193	App\\Models\\User	85	Personal Access Token	6a206ef0b181a6b81003579b087e09319c44308851c1dce8c6d6b216f5d47d40	["*"]	\N	2024-07-25 09:34:05	2024-07-25 09:34:05
194	App\\Models\\User	85	Personal Access Token	7b067d9e6e5066ed8d727002acb1c0842ca43db99fbcae514513084eec3bc24e	["*"]	\N	2024-07-25 09:34:21	2024-07-25 09:34:21
195	App\\Models\\User	118	Personal Access Token	5dfe7160f939f963e70cf09366975b31ebeb019e60465f91c10ef409e6908e8a	["*"]	\N	2024-07-25 09:36:02	2024-07-25 09:36:02
196	App\\Models\\User	118	Personal Access Token	717c65234f5aaea73fca9599551fe82991b493f61b0bf57c6ab6de7482563b80	["*"]	\N	2024-07-25 09:36:08	2024-07-25 09:36:08
197	App\\Models\\User	118	Personal Access Token	29ea9b82c753f34ce9402ca5d59d59058971ba7ded0dafbedec4ca9914f7fe40	["*"]	\N	2024-07-25 09:46:07	2024-07-25 09:46:07
198	App\\Models\\User	120	Personal Access Token	7bcca7ef0bb564682b99cc1a44546934e18a0dfa97272452a1570648f902391c	["*"]	\N	2024-07-25 10:08:06	2024-07-25 10:08:06
199	App\\Models\\User	118	Personal Access Token	678b3f0bf05f1ff0e8c3cbcb9e77a080a30002550016ca259391ea2cc4b35724	["*"]	\N	2024-07-25 10:52:12	2024-07-25 10:52:12
200	App\\Models\\User	118	Personal Access Token	1e291c386927d9f9c4bc5545858d4c4a8deacc2bdab3cbc6301b1117e32f0fd6	["*"]	\N	2024-07-25 10:52:25	2024-07-25 10:52:25
201	App\\Models\\User	118	Personal Access Token	10822a6b0bcb1fdaa66f06bcc072ac1a1e1fb49d2230746b04afd5deb2ea2d2d	["*"]	\N	2024-07-25 10:58:19	2024-07-25 10:58:19
202	App\\Models\\User	118	Personal Access Token	e10def89d99e690f64f96d1026ad80d0b3882720fe649f3cafa3116f018e46a5	["*"]	\N	2024-07-25 10:58:32	2024-07-25 10:58:32
203	App\\Models\\User	118	Personal Access Token	e4339244916ab4a9e2c4a0253c56fbb963e87cbd76fd7dfa64245cbadbae07f5	["*"]	\N	2024-07-25 11:07:33	2024-07-25 11:07:33
204	App\\Models\\User	118	Personal Access Token	674e3bca575d5054c57340cff0a2b0c30a7b499f804a9d09b1f9dacc0eba7d78	["*"]	\N	2024-07-25 11:07:42	2024-07-25 11:07:42
205	App\\Models\\User	85	Personal Access Token	bb46ade34691c10ae0874aab59ec029bbf2e2d3cee1de833ce0f0f66b739a2cb	["*"]	\N	2024-07-25 11:11:47	2024-07-25 11:11:47
206	App\\Models\\User	85	Personal Access Token	dbc483f0bdccd739cc130c8cb18ae017b0d07a916b8db8619dd6405ecf25a0e9	["*"]	\N	2024-07-25 11:11:53	2024-07-25 11:11:53
207	App\\Models\\User	118	Personal Access Token	840143ead840dd3f54e6345d3c4499c62cedb7948a41881b04a373ea6916a028	["*"]	\N	2024-07-25 11:19:49	2024-07-25 11:19:49
208	App\\Models\\User	118	Personal Access Token	76acdc684e943c9e3c4642bf96c352381d8565afb5d2d444b2bb9906c7ba0104	["*"]	\N	2024-07-25 11:19:53	2024-07-25 11:19:53
209	App\\Models\\User	118	Personal Access Token	86cff71d836ad8b8382449c3b52c0f878bb6619d57ee65c7515d04ff02854779	["*"]	\N	2024-07-25 11:32:26	2024-07-25 11:32:26
210	App\\Models\\User	118	Personal Access Token	3292da22ecac020c6a98a7319261b77e1790e70f0da8191e9c7c4451fa7c2046	["*"]	\N	2024-07-25 11:32:33	2024-07-25 11:32:33
211	App\\Models\\User	118	Personal Access Token	dc129a55d3207320612df44552160fd6e4ef469645f0eae54e55c1f2a7881e87	["*"]	\N	2024-07-25 11:40:59	2024-07-25 11:40:59
212	App\\Models\\User	118	Personal Access Token	e81cc9dc8843992e0ca5bc306b40905b5ee14fd367896d5a0e655c77c2960cc2	["*"]	\N	2024-07-25 11:41:03	2024-07-25 11:41:03
213	App\\Models\\User	85	Personal Access Token	fc1bc8cb53e13c32e66b4220433d693b2db8c9bd594ab5320d2fea0b407a8a64	["*"]	\N	2024-07-25 11:51:27	2024-07-25 11:51:27
214	App\\Models\\User	85	Personal Access Token	582f26f2a650aecf2505df5e6c321f75466773d87e5cb3dd88c1e703e09bc32b	["*"]	\N	2024-07-25 11:51:39	2024-07-25 11:51:39
215	App\\Models\\User	121	Personal Access Token	d56af52d95f227dff556971338dd5de5d6ee4b2232a858ff4a9ee1e8554cb9ad	["*"]	\N	2024-07-25 11:53:01	2024-07-25 11:53:01
216	App\\Models\\User	66	Personal Access Token	230b776b2eb1f886247a05bd466f0ed4c2ee56d79f899fe514610fa214c4ae15	["*"]	\N	2024-07-25 12:07:54	2024-07-25 12:07:54
217	App\\Models\\User	66	Personal Access Token	b8531535f0c874e3a1503e7ae0d43bd5c700b5785fe9d3e9f7156efd0577d68e	["*"]	\N	2024-07-25 12:07:59	2024-07-25 12:07:59
218	App\\Models\\User	66	Personal Access Token	ed20d39df10ab96acc9e8622bff2ac7e8023c02438a29b43b88ec1711cb7e1d7	["*"]	\N	2024-07-25 12:12:30	2024-07-25 12:12:30
219	App\\Models\\User	122	Personal Access Token	01cbc09995dddeb9608ad284c96889ebe5d6b7079d5a756eef70142a505ea702	["*"]	\N	2024-07-25 12:12:51	2024-07-25 12:12:51
220	App\\Models\\User	118	Personal Access Token	21bccd157c74440bc2eb9d492887443f90955cb25e33b88519518360474a1462	["*"]	\N	2024-07-25 12:37:10	2024-07-25 12:37:10
221	App\\Models\\User	118	Personal Access Token	70aa07b43e50eaf1eb3a355245352146f9eaea80d6d37d86f29d999d440439cc	["*"]	\N	2024-07-25 12:37:17	2024-07-25 12:37:17
222	App\\Models\\User	118	Personal Access Token	1cf76c83cb9e11571642abc30500fa040d0075d306b57dda61bd4c466db1db2a	["*"]	\N	2024-07-25 12:38:38	2024-07-25 12:38:38
223	App\\Models\\User	118	Personal Access Token	5ef38c42fc4924a864710f30064db81dcdf5a74002943f48e98407148cc8168d	["*"]	\N	2024-07-25 12:38:44	2024-07-25 12:38:44
224	App\\Models\\User	118	Personal Access Token	99361d0c78eada6868d69762baa5c158570b92c26df06d2b1937200bb6c69765	["*"]	\N	2024-07-25 12:40:54	2024-07-25 12:40:54
225	App\\Models\\User	118	Personal Access Token	f31bdb2f7be505e9ffd60c8f8f3051533bedc21f1d93b7e8aca0ed2355e00aef	["*"]	\N	2024-07-25 12:40:57	2024-07-25 12:40:57
226	App\\Models\\User	118	Personal Access Token	e4b733b875f6bb8d52015b1b95359b020f912fe55041d5f4b96e094ce5444a81	["*"]	\N	2024-07-25 12:43:10	2024-07-25 12:43:10
227	App\\Models\\User	118	Personal Access Token	14fc7b6e0c5ee3d85146724fc520685a472a61c5a98d1a049a90ab17d4a27778	["*"]	\N	2024-07-25 12:43:16	2024-07-25 12:43:16
228	App\\Models\\User	123	Personal Access Token	4d48c1cc2fa8f46a95cd8028382b53d702fc92438c20903a65ce4653eaca1328	["*"]	\N	2024-07-25 13:13:04	2024-07-25 13:13:04
229	App\\Models\\User	85	Personal Access Token	f43563020ddbd0fcdfdd8ab87cfa5b5ececccf94af46a7d1b27e42f64fd770d4	["*"]	\N	2024-07-25 13:19:29	2024-07-25 13:19:29
230	App\\Models\\User	85	Personal Access Token	a08808acc8b32a6af411e3529dfd5f437a7fd3ca636bc059a419e273cf85cb7a	["*"]	\N	2024-07-25 13:19:35	2024-07-25 13:19:35
231	App\\Models\\User	4	Personal Access Token	3abcab229f01b6ac02f5fd000329487ac46d9996bdb03a3b7ada1462c78230e8	["*"]	\N	2024-07-25 13:28:11	2024-07-25 13:28:11
232	App\\Models\\User	121	Personal Access Token	1643bfe909bd3b9c470101043a742addbba9abbcdbae7324eabe612ecc7ae359	["*"]	\N	2024-07-25 13:36:32	2024-07-25 13:36:32
233	App\\Models\\User	124	Personal Access Token	3a9f3c7c3b02c5cb3a752f71118644f1b634fc3e5105434e547dffaf92fe317a	["*"]	\N	2024-07-25 13:36:42	2024-07-25 13:36:42
234	App\\Models\\User	118	Personal Access Token	7941f10993ef36d45fc70a97972e6bedfa6f7a663af0a0197006508883501e01	["*"]	\N	2024-07-25 13:55:20	2024-07-25 13:55:20
235	App\\Models\\User	118	Personal Access Token	e10347fae74745d4b86baa63d24930ae95d7873edb3a68c0474ba06caca0ea3c	["*"]	\N	2024-07-25 13:55:25	2024-07-25 13:55:25
236	App\\Models\\User	118	Personal Access Token	81f923da1c896cc00d7af8c1bd3f4a2bfb9a8f7b30c9b3ab05a5dc19439c99f8	["*"]	\N	2024-07-25 13:57:55	2024-07-25 13:57:55
237	App\\Models\\User	118	Personal Access Token	bbf2e7bd810f699c533357544f96169f1adead12e764614ed5c547d5460c6c84	["*"]	\N	2024-07-25 13:58:00	2024-07-25 13:58:00
238	App\\Models\\User	118	Personal Access Token	5051254f16a17fe3f041ded507bace51434a7a1bd29d5223afc8b48dcd6e6bb2	["*"]	\N	2024-07-25 14:51:22	2024-07-25 14:51:22
239	App\\Models\\User	118	Personal Access Token	0b3bebbfd519835905d99c700607b16677e039cf6e68d4b2710a6ebf09666652	["*"]	\N	2024-07-25 14:51:27	2024-07-25 14:51:27
240	App\\Models\\User	125	Personal Access Token	238f9be98338883688eb0a70b6e60ef4582a770edb5c65381f01ccad165d0b1b	["*"]	\N	2024-07-25 15:29:22	2024-07-25 15:29:22
241	App\\Models\\User	4	Personal Access Token	cb7fb21a20ed72bb9fe556909919c4b9c5ebd19b3a24fafa0e5e280c1078763a	["*"]	\N	2024-07-25 20:07:57	2024-07-25 20:07:57
242	App\\Models\\User	126	Personal Access Token	932c3fb53dde5eb5d9371f806f085db7c2574e50201c0de1997fed867158b750	["*"]	\N	2024-07-26 02:16:41	2024-07-26 02:16:41
243	App\\Models\\User	4	Personal Access Token	92a341b7a29b614e8c715a6017aab63bc9cb2c5b72a605643768939a755a8484	["*"]	\N	2024-07-26 09:09:32	2024-07-26 09:09:32
244	App\\Models\\User	85	Personal Access Token	8ca2e0c05b6392eaffd7604ab246be491a6edec931ce991f50e1bab39f84564a	["*"]	\N	2024-07-26 09:28:37	2024-07-26 09:28:37
245	App\\Models\\User	85	Personal Access Token	b94823cc9e64ec9fc6e81366dc83250f101b1554f6cbf38e5acb80819d2dc297	["*"]	\N	2024-07-26 09:28:44	2024-07-26 09:28:44
246	App\\Models\\User	121	Personal Access Token	2761a494f7e12ae76e63200115d86667b98e1ea5fb8a167c0fb7a4cc1bfece5a	["*"]	\N	2024-07-26 09:29:41	2024-07-26 09:29:41
247	App\\Models\\User	85	Personal Access Token	9702f8f43cabd5078f93c7d1b258c42e2257478914835ee286df5f01055f0caf	["*"]	\N	2024-07-26 13:41:15	2024-07-26 13:41:15
248	App\\Models\\User	85	Personal Access Token	ff9cc0e02eae81770e73cb1042567b7f2540491efef0e82c7dd7ccbd7ada81ad	["*"]	\N	2024-07-26 13:41:19	2024-07-26 13:41:19
249	App\\Models\\User	85	Personal Access Token	b59a27ffe16791b2b605a6ac6ec6fe1ef6f14ef9b34c3b405a72b9640519d553	["*"]	\N	2024-07-26 15:02:42	2024-07-26 15:02:42
250	App\\Models\\User	85	Personal Access Token	ba59e4a87bdf04ab6f07f67cf035ee0117c32ef11e2ea235582839e0ed4d118f	["*"]	\N	2024-07-26 15:02:58	2024-07-26 15:02:58
251	App\\Models\\User	121	Personal Access Token	709860a3177c0cf2b4bf0c69276552123d99468818cb32dd3a5706ed068b7930	["*"]	\N	2024-07-26 15:04:18	2024-07-26 15:04:18
252	App\\Models\\User	85	Personal Access Token	9a193c5ec1d77eaf5bee67eccbae9929f303cb6230a9edaa548706aacc5e9e32	["*"]	\N	2024-07-26 15:07:00	2024-07-26 15:07:00
253	App\\Models\\User	85	Personal Access Token	51a07654a0ac0d624ba18cd91f8bd9031f4d8a4c9c878755967b0abe515a7767	["*"]	\N	2024-07-26 15:08:00	2024-07-26 15:08:00
254	App\\Models\\User	85	Personal Access Token	d16e1f27267e2c143709fc5e21fb1e1443e576adf35d89ec8a80de1cb724cb6a	["*"]	\N	2024-07-26 15:08:06	2024-07-26 15:08:06
255	App\\Models\\User	127	Personal Access Token	e48699e1c5a3f24dc1974b2c16c825c831b2c0d7a3f07a94d981635560dded8a	["*"]	\N	2024-07-26 15:08:56	2024-07-26 15:08:56
256	App\\Models\\User	85	Personal Access Token	108f3d5e4c4156b9fa27451121ab4fb6765389ad96e8954debe91e541f3ad641	["*"]	\N	2024-07-26 15:25:31	2024-07-26 15:25:31
257	App\\Models\\User	85	Personal Access Token	42f3e34b55ccac25b68eb896dd5bef67c1bd4a89dbf006404a98f80d7b1fb017	["*"]	\N	2024-07-26 15:25:46	2024-07-26 15:25:46
258	App\\Models\\User	121	Personal Access Token	71f8eae4e0353bb8879fee5a3ec14f3ed64f5e3dc7e6c955d7eb5db5334ef777	["*"]	\N	2024-07-26 16:34:45	2024-07-26 16:34:45
259	App\\Models\\User	121	Personal Access Token	f770b61769068a80b6ae3f164d462d08e6ac028a7e6dc0f9c4ed292c2c4d96e0	["*"]	\N	2024-07-26 17:24:31	2024-07-26 17:24:31
260	App\\Models\\User	127	Personal Access Token	7c3f094a503012a075a5ebe962af82ad950ac5132c57d8d64f59d8396f0ffb2c	["*"]	\N	2024-07-26 17:34:00	2024-07-26 17:34:00
261	App\\Models\\User	127	Personal Access Token	b5a75168878c3aaa47abe9e7b4f28d8c6a9539daf02c607bfbcc2bc3e8c44458	["*"]	\N	2024-07-26 17:34:08	2024-07-26 17:34:08
262	App\\Models\\User	127	Personal Access Token	841e11c1bdb3aac428b287390637cfd2b3841c19d9b482562b8bd157957cf84b	["*"]	\N	2024-07-26 17:34:56	2024-07-26 17:34:56
263	App\\Models\\User	4	Personal Access Token	c8b43faad9288d5869122f56396587e3f54785c21157a27198de1cff6069a02e	["*"]	\N	2024-07-26 19:33:17	2024-07-26 19:33:17
264	App\\Models\\User	128	Personal Access Token	742cb68d0e3eb38bfa59be0416eaef9dcbcb21b681d34e3ad828b136a5d0f603	["*"]	\N	2024-07-26 22:25:49	2024-07-26 22:25:49
265	App\\Models\\User	126	Personal Access Token	b04d94e4354f7c5b7f10e56af388d85259ed9d6d3ca8cf88bfd6bb4558e0d35b	["*"]	\N	2024-07-27 03:39:15	2024-07-27 03:39:15
266	App\\Models\\User	126	Personal Access Token	1df87cdf66e508686fc832eb9f19562ac9920fa67dc47fd73c067e3d58670bde	["*"]	\N	2024-07-27 03:39:23	2024-07-27 03:39:23
267	App\\Models\\User	4	Personal Access Token	0c9d7b489aa759315bbdfc0aabdeafe5cb5e5902c1cfcce80762e0a67babb34d	["*"]	\N	2024-07-29 06:08:51	2024-07-29 06:08:51
268	App\\Models\\User	4	Personal Access Token	423648dd5f9f5d3cb95187a5cc466b3ee6d7c83462ad97324779c88b2bc0bf88	["*"]	\N	2024-07-29 06:44:46	2024-07-29 06:44:46
269	App\\Models\\User	129	Personal Access Token	2bd470e6ed77d58e271b06055067b7f9b3aa4a18fd4b487f44861e0fa9718175	["*"]	\N	2024-07-29 08:15:26	2024-07-29 08:15:26
270	App\\Models\\User	127	Personal Access Token	d2fa8e4ebc6a8f4434d217e85aa48203d65388918024213e3563273e5609caf5	["*"]	\N	2024-07-29 09:20:28	2024-07-29 09:20:28
271	App\\Models\\User	127	Personal Access Token	cf83b7f649f7a233e9e131c605418f2f5b25e62ffa72c481a042652e94d6d474	["*"]	\N	2024-07-29 09:28:01	2024-07-29 09:28:01
272	App\\Models\\User	130	Personal Access Token	486f3a8ce2801bb50bab7262fbbfb26b50c3dccb5818d158d9c5d7cf3315241c	["*"]	\N	2024-07-29 09:39:17	2024-07-29 09:39:17
273	App\\Models\\User	131	Personal Access Token	1f9c51dc9a4336d9bfe17cf0c017d0ac51ef654d9de218e4b99c9e01b1f8ea10	["*"]	\N	2024-07-29 10:06:33	2024-07-29 10:06:33
274	App\\Models\\User	129	Personal Access Token	20fb5e273b73c5c882c889b3b406eb2155c183207389b0fe080f5b2c534208ef	["*"]	\N	2024-07-29 10:07:38	2024-07-29 10:07:38
275	App\\Models\\User	129	Personal Access Token	f0151e2bbb12b8d3048addb4e74ee9d71e26fa57aee5eb560852391a6f28c2e4	["*"]	\N	2024-07-29 10:07:43	2024-07-29 10:07:43
276	App\\Models\\User	4	Personal Access Token	22efdfa3b5e4095865f3b6deffcd4a0a00c3f6c19d49d30c9dfbdb72b7e147fa	["*"]	\N	2024-07-29 12:14:26	2024-07-29 12:14:26
277	App\\Models\\User	4	Personal Access Token	f6c8176993789117b3d7f614f35c3204448558f368a39c39d1475a5c27472515	["*"]	\N	2024-07-29 15:13:51	2024-07-29 15:13:51
278	App\\Models\\User	132	Personal Access Token	875ef5aa42e365eabc5a46203caa10567bdda2cf03cffcf4ad1c29d7a3c76a57	["*"]	\N	2024-07-29 16:02:10	2024-07-29 16:02:10
279	App\\Models\\User	133	Personal Access Token	1a813492af4eca811bf5eb05c250f0979050ea850b68a9f9588bc6d227edf9af	["*"]	\N	2024-07-29 20:04:54	2024-07-29 20:04:54
280	App\\Models\\User	4	Personal Access Token	0a18467271e954f50f77f7ebbc0f3bb12c4548e9f86dbc8ca8c2a68464aa972e	["*"]	\N	2024-07-29 20:32:22	2024-07-29 20:32:22
281	App\\Models\\User	4	Personal Access Token	5464fd1151f824da549771917726ca61873ba3c8e53d4e4db259909e5a6f56ba	["*"]	\N	2024-07-29 20:38:35	2024-07-29 20:38:35
282	App\\Models\\User	4	Personal Access Token	8a47505511ec0c913b298154b25c9b42ed2f1883522d9152c88e64aff1add791	["*"]	\N	2024-07-29 21:16:40	2024-07-29 21:16:40
283	App\\Models\\User	126	Personal Access Token	7245ddecd1d79059dee8dbfb1ff1c64ee544b0c53a64922223653553d0f6e453	["*"]	\N	2024-07-30 00:13:28	2024-07-30 00:13:28
284	App\\Models\\User	126	Personal Access Token	99ef7812431a0649def9a4c5ca107c18215a89260087ad44fa6f445f50dab9d9	["*"]	\N	2024-07-30 00:13:34	2024-07-30 00:13:34
285	App\\Models\\User	134	Personal Access Token	bd413fcfb431dc3d065efafa9713df99e02722adb05e7cf2e808bb040d4463af	["*"]	\N	2024-07-30 04:54:01	2024-07-30 04:54:01
286	App\\Models\\User	4	Personal Access Token	069b5ae1155e17496e19a5f10aa35bd63db716d500239166f67a8cdbdefe87c6	["*"]	\N	2024-07-30 05:28:47	2024-07-30 05:28:47
287	App\\Models\\User	135	Personal Access Token	b237eae3872812975bb2cb8e8da45f83b4bdce30f7f9301d0ea702df0c5f318f	["*"]	\N	2024-07-30 05:36:38	2024-07-30 05:36:38
288	App\\Models\\User	135	Personal Access Token	3f0d82b40aa5466b2708af825f319a94f4d4338c686b1b6cbfeea04ecd8452ae	["*"]	\N	2024-07-30 06:22:21	2024-07-30 06:22:21
289	App\\Models\\User	121	Personal Access Token	dcce1040f011946afbb3331545d05a5db3a14e898b3839a077d3b3fb046c0380	["*"]	\N	2024-07-30 06:24:17	2024-07-30 06:24:17
290	App\\Models\\User	126	Personal Access Token	f541c088ca236ec23aaacd0240d0d7f2ec99f17cbcb7d24e78b9bfb5b8c12be0	["*"]	\N	2024-07-30 06:31:57	2024-07-30 06:31:57
291	App\\Models\\User	126	Personal Access Token	a6837e773658ed0100c4d55dd269125a5471a35af67b88cd3226b8186cbe67e3	["*"]	\N	2024-07-30 06:32:11	2024-07-30 06:32:11
292	App\\Models\\User	136	Personal Access Token	37a956412e1790ed84e6bd92eff95501deae966bd44e51160cad8b72e182f1a1	["*"]	\N	2024-07-30 06:54:06	2024-07-30 06:54:06
293	App\\Models\\User	4	Personal Access Token	c8674a22911dae5793e6ab51fb5744198c4aa5c4b1f925b90c9318a71e36e92f	["*"]	\N	2024-07-30 06:56:29	2024-07-30 06:56:29
294	App\\Models\\User	4	Personal Access Token	510ebb335b939b6ddf2f7d3d8a2a35d02036833ce094b62c34f43761306d641b	["*"]	\N	2024-07-30 07:09:54	2024-07-30 07:09:54
295	App\\Models\\User	126	Personal Access Token	b9696af801f458f4d9db9bd88530ea326fd9710c2c5b36242ea65de5d4b37c20	["*"]	\N	2024-07-30 11:03:11	2024-07-30 11:03:11
296	App\\Models\\User	126	Personal Access Token	9e71866c9e7df7d2369d82c241a5426a1fbfb5e3b6e2a5c818f3af4cd041631a	["*"]	\N	2024-07-30 11:03:18	2024-07-30 11:03:18
297	App\\Models\\User	126	Personal Access Token	2b25c89cbdf599347359f1da92d7638596b7255d03ff87df0573ff9ec0b08884	["*"]	\N	2024-07-30 11:21:11	2024-07-30 11:21:11
298	App\\Models\\User	126	Personal Access Token	3d9a7db42fd1cb13ba930f5b142cd390ac27c9172a3040710ac07b03bf15ecd5	["*"]	\N	2024-07-30 11:21:24	2024-07-30 11:21:24
299	App\\Models\\User	126	Personal Access Token	cc8e05b7bb2670d58bffa448d1e1b5b2e8c4f5a6b1f220f1c92e0133b4aedc59	["*"]	\N	2024-07-30 11:35:47	2024-07-30 11:35:47
300	App\\Models\\User	126	Personal Access Token	47c0940ae3db01760f21bb53a2f92c66742eea33fdd707e1f7b29e51bd152afe	["*"]	\N	2024-07-30 11:35:53	2024-07-30 11:35:53
301	App\\Models\\User	126	Personal Access Token	508c22563c4abe6ac840720b666d34ed844a04ed6a1775d2af604e64c093b0bd	["*"]	\N	2024-07-30 12:05:35	2024-07-30 12:05:35
302	App\\Models\\User	126	Personal Access Token	9a6864b18019cd0317030ddc27b7836b757207157f281ee3608da8562f710291	["*"]	\N	2024-07-30 12:05:44	2024-07-30 12:05:44
303	App\\Models\\User	127	Personal Access Token	d7ad592bea110e6b9936dceb0c7117492eda2c1ef5e463168f29ddd45ccbee25	["*"]	\N	2024-07-30 12:06:38	2024-07-30 12:06:38
304	App\\Models\\User	127	Personal Access Token	18e77dca0023b06b71745c2540c83a00b1c39b9ff3abdd51587912cba3395be8	["*"]	\N	2024-07-30 12:06:56	2024-07-30 12:06:56
305	App\\Models\\User	127	Personal Access Token	66f28d43f2a65e6a8ee20c437946abd59166ab1c86d6b64480fbd97d465041d4	["*"]	\N	2024-07-30 12:07:07	2024-07-30 12:07:07
306	App\\Models\\User	126	Personal Access Token	7e8482b8e648cb6b3bcf92cf903fe30df812657bf13708b562fec7da1a285279	["*"]	\N	2024-07-30 12:16:02	2024-07-30 12:16:02
307	App\\Models\\User	126	Personal Access Token	adcde652f02ac119c0ab9a293e1daf6786284475aaca7b95ba968e84cab85b40	["*"]	\N	2024-07-30 12:16:07	2024-07-30 12:16:07
308	App\\Models\\User	121	Personal Access Token	e0db5492207300855a01698bc5d7e06a86270aa91c3870c996452309a43b7ae8	["*"]	\N	2024-07-30 12:16:28	2024-07-30 12:16:28
309	App\\Models\\User	4	Personal Access Token	47c8b144fbb39335a44821ce7fbb9f728cc497a997de94aeb5882674b1e9997e	["*"]	\N	2024-07-30 14:57:25	2024-07-30 14:57:25
310	App\\Models\\User	126	Personal Access Token	4df0ac05b09d5ae88abdd8a4c45ab6c058d4fde9a543c82b0a91bc20f8dfcaec	["*"]	\N	2024-07-30 15:04:45	2024-07-30 15:04:45
311	App\\Models\\User	126	Personal Access Token	8bee08f538d7a0700df42b79627b8ac10e817b355616d479aa4a43bbe4a3f4ab	["*"]	\N	2024-07-30 15:04:51	2024-07-30 15:04:51
312	App\\Models\\User	135	Personal Access Token	1627a7e795c91df33b11d83342a72838d749341a1b2d7bdf57098341a2e13e31	["*"]	\N	2024-07-30 15:10:24	2024-07-30 15:10:24
313	App\\Models\\User	137	Personal Access Token	7618b1c9b99da55a4b73f1ac5d369fb8ea7b7d74e61debbe7ffa116e6712dca5	["*"]	\N	2024-07-30 15:19:12	2024-07-30 15:19:12
314	App\\Models\\User	138	Personal Access Token	fcb63d57ff1721865dab9ddf31df5472d151f65734353cdc66b9470569ebd0a3	["*"]	\N	2024-07-30 15:27:02	2024-07-30 15:27:02
315	App\\Models\\User	4	Personal Access Token	1f8e95b5a8e640ad286d93b7cec7cd23dd65660c07256ef328260b6a8321d263	["*"]	\N	2024-07-30 15:37:31	2024-07-30 15:37:31
316	App\\Models\\User	138	Personal Access Token	1b6ae6e97249a48472ca3acb403e373d58b7d8def4be753e19b23f720da371fe	["*"]	\N	2024-07-30 15:44:10	2024-07-30 15:44:10
317	App\\Models\\User	138	Personal Access Token	b7001895ceecea69c46dd6fd9ee4a7abc59c9b77f1d50011b62ace90bf6cba25	["*"]	\N	2024-07-30 15:44:17	2024-07-30 15:44:17
318	App\\Models\\User	139	Personal Access Token	7fea83e117b2a9fd23060b93674ecf3cb7aafa87e9c167b3ada8534c30de22a8	["*"]	\N	2024-07-30 15:48:24	2024-07-30 15:48:24
319	App\\Models\\User	140	Personal Access Token	ce907a6b70a6d5a34518a8f8b17ab4c5ea8f57fc7c1d8e1490a30309c13effa6	["*"]	\N	2024-07-30 16:43:26	2024-07-30 16:43:26
320	App\\Models\\User	141	Personal Access Token	d44ba8f6dedffd7f869ac82ac960ada09536ae0970a115f6109d083c02b7ce61	["*"]	\N	2024-07-30 17:08:19	2024-07-30 17:08:19
321	App\\Models\\User	142	Personal Access Token	b1aea0cc0859d3f968293c9e6fe9f83b6c83cff8ccd2ad937a21c5ea5b0b235d	["*"]	\N	2024-07-30 17:47:12	2024-07-30 17:47:12
322	App\\Models\\User	141	Personal Access Token	7f6e6df4e9f476aaeee187c76946398d0034959227c4b61f753099a519cee565	["*"]	\N	2024-07-30 17:49:04	2024-07-30 17:49:04
323	App\\Models\\User	141	Personal Access Token	18e54fd45666b968030ca702f8588c4943dbaa3d81e2e6bb80aee2fd6df7acec	["*"]	\N	2024-07-30 17:49:11	2024-07-30 17:49:11
324	App\\Models\\User	127	Personal Access Token	89232acbaa3351b5382401c934af6df960b69953f49d80c177bb533d74935324	["*"]	\N	2024-07-30 18:12:54	2024-07-30 18:12:54
325	App\\Models\\User	127	Personal Access Token	17251609c91696c9f0a9154bf074a1eb3cf9b13c3534067de1c9185e47cb94da	["*"]	\N	2024-07-30 18:13:00	2024-07-30 18:13:00
326	App\\Models\\User	127	Personal Access Token	c824c4aabf08f69a29dcbc3ada424150f4415545d25c9556d94ce803ae2d4d5e	["*"]	\N	2024-07-30 18:13:46	2024-07-30 18:13:46
327	App\\Models\\User	127	Personal Access Token	b2302f5ea3bcb1e8b1d958fe6963f70ca3c24a896f222bf3f648e4c72a52a83d	["*"]	\N	2024-07-30 18:13:52	2024-07-30 18:13:52
328	App\\Models\\User	127	Personal Access Token	41c54bb3fd7397e5bcef62ff4f9b7ea9dbd3eb318cbd719c3d239e9d460b177b	["*"]	\N	2024-07-30 18:15:25	2024-07-30 18:15:25
329	App\\Models\\User	141	Personal Access Token	6e123aa1398be434c62ab09f1f0aae61c7891d3664f4e16632331030e9d953f8	["*"]	\N	2024-07-30 18:17:03	2024-07-30 18:17:03
330	App\\Models\\User	141	Personal Access Token	6b71b2fcffcaaf5112d9482038881c105edf69667ee9e05c916977191bb6cc4c	["*"]	\N	2024-07-30 18:17:09	2024-07-30 18:17:09
331	App\\Models\\User	127	Personal Access Token	1405ea12972221083151ce6384db7da4555d4eeec7f32d4bbb413106c18a9c3e	["*"]	\N	2024-07-30 18:17:29	2024-07-30 18:17:29
332	App\\Models\\User	127	Personal Access Token	bd7ff13291caf1691e16692e5423773a1d263f8f4ccdc42cf12114395f5039c0	["*"]	\N	2024-07-30 18:17:40	2024-07-30 18:17:40
333	App\\Models\\User	141	Personal Access Token	91b93cc15a61d545f009a0ff40ed598980c88d6f4156957ad1fd998300560bee	["*"]	\N	2024-07-30 18:19:06	2024-07-30 18:19:06
334	App\\Models\\User	141	Personal Access Token	f5f6f54f4104057dfd583bdc0f57ded8fd9f21f829dd6f5778be73c4bd600713	["*"]	\N	2024-07-30 18:19:12	2024-07-30 18:19:12
335	App\\Models\\User	141	Personal Access Token	72dbb9b34ee09e94c5a2b0c91e754c4a64f58af9ce1533a4607a9d577f9d869b	["*"]	\N	2024-07-30 18:22:15	2024-07-30 18:22:15
336	App\\Models\\User	141	Personal Access Token	272545004e972cc1f264581981209cb824c2cbbef124c0822273586685bc6583	["*"]	\N	2024-07-30 18:22:21	2024-07-30 18:22:21
337	App\\Models\\User	141	Personal Access Token	8623582a929aefb5bfefa7f5be54aa70fc514fb1b05cd6de9e472da9e146878e	["*"]	\N	2024-07-30 18:26:49	2024-07-30 18:26:49
338	App\\Models\\User	126	Personal Access Token	233972d8fbfd3497e58d8583c00bca13634fc63e75c24ea9f4e6506673690e72	["*"]	\N	2024-07-30 18:45:09	2024-07-30 18:45:09
339	App\\Models\\User	126	Personal Access Token	fa77eacfc9959662b7b7ca81f4cb552a3c09823e8c3fbd8d26a1b18a3bb729f3	["*"]	\N	2024-07-30 18:45:14	2024-07-30 18:45:14
340	App\\Models\\User	126	Personal Access Token	81e95431d272e18ef3ee23e8337f2e5fc354d5026960feda2d99365205a29221	["*"]	\N	2024-07-31 03:29:27	2024-07-31 03:29:27
341	App\\Models\\User	126	Personal Access Token	1ea4333b143bdb6cb27aa1784d21a9750d6fa1d2a6eb4557a1e1baff1c43c82d	["*"]	\N	2024-07-31 03:29:33	2024-07-31 03:29:33
342	App\\Models\\User	126	Personal Access Token	93319fdf3ef28e12e2326e4071489d9ea0f2b09bea1fec0d59212f6a8cd4a74b	["*"]	\N	2024-07-31 04:43:18	2024-07-31 04:43:18
343	App\\Models\\User	126	Personal Access Token	5b4daeb960399cdadbf2cd6937bc61a4eb836e9a580f07af670fd38aa2068297	["*"]	\N	2024-07-31 04:43:24	2024-07-31 04:43:24
344	App\\Models\\User	141	Personal Access Token	7c1b696a88ca7851885e38c51811960b6f6917a8f382d605ae0665f79a5e40ad	["*"]	\N	2024-07-31 06:12:01	2024-07-31 06:12:01
345	App\\Models\\User	141	Personal Access Token	aad4597840723bc19f3b8a9296af7c50cb517cc838c0b77894ce17d4daccd36a	["*"]	\N	2024-07-31 06:12:07	2024-07-31 06:12:07
346	App\\Models\\User	144	Personal Access Token	3982ffcfd83077007f7186bdc84671eb60135ad8bbc218c9480b981c610e3ab0	["*"]	\N	2024-07-31 06:38:42	2024-07-31 06:38:42
347	App\\Models\\User	145	Personal Access Token	ca4d96ea01d79ae2cf364d44d78c7e50b691715b89e1222311f486428d13e6be	["*"]	\N	2024-07-31 09:12:34	2024-07-31 09:12:34
348	App\\Models\\User	145	Personal Access Token	0ce82cc9029d590129039bbeb11ab2cea7143342bcae7eaf41927c3481a909c7	["*"]	\N	2024-07-31 11:31:07	2024-07-31 11:31:07
349	App\\Models\\User	145	Personal Access Token	e0e369997d410841a07101f4755c34ce8f93c85c545a094e7607838639efc3b9	["*"]	\N	2024-07-31 11:31:15	2024-07-31 11:31:15
350	App\\Models\\User	146	Personal Access Token	e84212bc2da3358ef8713a7186b4e5342978aa3dc27a1c9f23e8ce799a1a00ca	["*"]	\N	2024-08-01 07:01:25	2024-08-01 07:01:25
351	App\\Models\\User	137	Personal Access Token	f3c68ecbd020720cf42add6ef5def01e1637eabdf92d6a01eef5350ed5c29e76	["*"]	\N	2024-08-01 07:07:41	2024-08-01 07:07:41
352	App\\Models\\User	4	Personal Access Token	c81bf3529a5bf83e184f47609f98c98f11de6495a6a827f6c963f980bd4338b3	["*"]	\N	2024-08-01 07:15:10	2024-08-01 07:15:10
353	App\\Models\\User	10	Personal Access Token	436846bf1ea4dfdf3b1ec1238852b6fb1883bc693b138f82a74dac3fc8a3c50a	["*"]	\N	2024-08-01 08:24:28	2024-08-01 08:24:28
354	App\\Models\\User	10	Personal Access Token	1bc21599d2a1561c0c8068ec7765507470dd4e5e2b65cfe1328490e5fa1fc078	["*"]	\N	2024-08-01 08:24:53	2024-08-01 08:24:53
355	App\\Models\\User	10	Personal Access Token	33edb02dba222a312872a78fe82fbfac9dd474b94684c4e34f448bec4053b93a	["*"]	\N	2024-08-01 08:24:58	2024-08-01 08:24:58
356	App\\Models\\User	126	Personal Access Token	f4d687653bc0f8c905382d1d6383536cbb1b9ab88d0321ef11d3158ef7615a73	["*"]	\N	2024-08-01 09:22:02	2024-08-01 09:22:02
357	App\\Models\\User	127	Personal Access Token	76cbbfec6607dcec7f19c4c1056320becc5f631ece73235af4228c56b2d1c8b7	["*"]	\N	2024-08-01 09:22:14	2024-08-01 09:22:14
358	App\\Models\\User	127	Personal Access Token	45e056572d4aa0987f2c28bcda4d469213f54301b1106a405532a388c80cf0a4	["*"]	\N	2024-08-01 09:22:22	2024-08-01 09:22:22
359	App\\Models\\User	85	Personal Access Token	63e1035d0ef61027836e535827b88deaa993feefcaffc0ab89f9ad56893aeca7	["*"]	\N	2024-08-01 09:22:59	2024-08-01 09:22:59
360	App\\Models\\User	85	Personal Access Token	f6b9c62e20e1efc8d240c9be1c4beabfe9998b313f71b3eae922b05e60687585	["*"]	\N	2024-08-01 09:23:06	2024-08-01 09:23:06
361	App\\Models\\User	142	Personal Access Token	2ca2d84a5cbf8a84e52b9829c19ea6fb532e801eb45d4620fb1199da8c99ea4a	["*"]	\N	2024-08-01 09:47:50	2024-08-01 09:47:50
362	App\\Models\\User	142	Personal Access Token	72b30a2ff4c4c59827464eef9ed4c80bdb0387737f02f9f79d1a05c14838d409	["*"]	\N	2024-08-01 09:47:57	2024-08-01 09:47:57
363	App\\Models\\User	126	Personal Access Token	e48450cc6e612a6833f2eafe35a5f22de5e4c8b6a3e73f8be44676b3ddc93ef2	["*"]	\N	2024-08-01 09:57:26	2024-08-01 09:57:26
364	App\\Models\\User	126	Personal Access Token	ecd3df869b105e878e4fabe00d361f9abd592ca78bd08f28691a4a821a0c3153	["*"]	\N	2024-08-01 09:57:33	2024-08-01 09:57:33
365	App\\Models\\User	126	Personal Access Token	4282c000b4761aa4673a306e1a68b35094f556921e877285e085e77cfec17ec7	["*"]	\N	2024-08-01 09:59:18	2024-08-01 09:59:18
366	App\\Models\\User	121	Personal Access Token	d61b43b4eaa616112e271fa0ff2f05a12a82cb1706452c01a808adc97b272ffc	["*"]	\N	2024-08-01 09:59:19	2024-08-01 09:59:19
367	App\\Models\\User	126	Personal Access Token	29bfd0befe32e274715515abff006cb79c40abcbc84ce2d0902b4c1e4cfc49e6	["*"]	\N	2024-08-01 09:59:24	2024-08-01 09:59:24
368	App\\Models\\User	141	Personal Access Token	2c8c8d0b2f7ea99126117c30c4baf8170c059a4c4e212594a12e176bff5aaddb	["*"]	\N	2024-08-01 10:01:47	2024-08-01 10:01:47
369	App\\Models\\User	141	Personal Access Token	9099bd7dcfb54a2baaf02af31c983ecce6fb01472d7d80a887df4f65a22e59af	["*"]	\N	2024-08-01 10:01:52	2024-08-01 10:01:52
370	App\\Models\\User	126	Personal Access Token	b85110ef5223ae8d1c27b37231c8ba2799672a9069efc438644619e4215bdadd	["*"]	\N	2024-08-01 10:08:30	2024-08-01 10:08:30
371	App\\Models\\User	126	Personal Access Token	54a2df04ace76444ea39bce7a5f39ee7da0029e50eabdf367047195bc16d1788	["*"]	\N	2024-08-01 10:08:35	2024-08-01 10:08:35
372	App\\Models\\User	126	Personal Access Token	5894b2acdc8972d2892382b74d8a644094ec4a6dff947280147de9fdc7a143b8	["*"]	\N	2024-08-01 10:11:05	2024-08-01 10:11:05
373	App\\Models\\User	126	Personal Access Token	86c9bc8a4ffcc115370c879fc74fc01511f12e603c61de4c953e010cbda64cd2	["*"]	\N	2024-08-01 10:11:10	2024-08-01 10:11:10
374	App\\Models\\User	126	Personal Access Token	6accf644bcd089cd5f254e6e4302f8af778fc61fa01688851609d15d2cd7dac4	["*"]	\N	2024-08-01 10:16:44	2024-08-01 10:16:44
375	App\\Models\\User	126	Personal Access Token	185860d40350299eb1e8e2c408fb7cc56e6fba56801e49b06da7cad5dc48fa6c	["*"]	\N	2024-08-01 10:18:22	2024-08-01 10:18:22
376	App\\Models\\User	134	Personal Access Token	ce7b82167d5e9486395714ead1e1dc623a15d7fd9800b78c593fc807157b09fd	["*"]	\N	2024-08-01 10:28:37	2024-08-01 10:28:37
377	App\\Models\\User	141	Personal Access Token	89d9430de3eee173f53f47932691ba7ecb92defc385da67d15cbcb3e36cfbe31	["*"]	\N	2024-08-01 10:46:07	2024-08-01 10:46:07
378	App\\Models\\User	126	Personal Access Token	2a2304f6e145fb4ba77c1cfe320d90b199b7e0652eb960f3cc31ff8ffe0346f5	["*"]	\N	2024-08-01 10:47:03	2024-08-01 10:47:03
379	App\\Models\\User	126	Personal Access Token	3f869c60c07c2d650d050c4b92744c106a7c5c1fcc7d0979e0b4183a8888bfbb	["*"]	\N	2024-08-01 10:47:09	2024-08-01 10:47:09
380	App\\Models\\User	134	Personal Access Token	4183f4935a92dead3a83433898f6159d4f4ee37631e04df90c529fea07da9a66	["*"]	\N	2024-08-01 11:13:01	2024-08-01 11:13:01
381	App\\Models\\User	137	Personal Access Token	fa4d30a25e7c7c55da0ee2a7b5b97fd9d9a7fbdffce9791b87df517f4514d4b9	["*"]	\N	2024-08-01 11:16:32	2024-08-01 11:16:32
382	App\\Models\\User	10	Personal Access Token	58fb07a295aa3ac5e7a61ed18d2a8d8966202408cd0730661037ea3ba03e23a9	["*"]	\N	2024-08-01 11:20:16	2024-08-01 11:20:16
383	App\\Models\\User	10	Personal Access Token	193eb4afdc6fcbd9761029fdf66bba1b3d780eb7baafe9ac0dee9ae958a736ac	["*"]	\N	2024-08-01 11:20:22	2024-08-01 11:20:22
384	App\\Models\\User	126	Personal Access Token	c4b8301024a5a352196998d78cb689eeeb0fd26651bc1add971d5e5f817f461e	["*"]	\N	2024-08-01 11:25:47	2024-08-01 11:25:47
385	App\\Models\\User	126	Personal Access Token	6743daf468c506e3971fed217d8c352890899758e0a8fc75ad2cf7365f13b5ba	["*"]	\N	2024-08-01 11:25:53	2024-08-01 11:25:53
386	App\\Models\\User	4	Personal Access Token	6795bbb307b6fdf5e2144213db51a1ad3474e7cc448b1a7e304f3ad966d64511	["*"]	\N	2024-08-01 11:40:49	2024-08-01 11:40:49
387	App\\Models\\User	141	Personal Access Token	d5e6b3390de2dcb032dc0b22022cc801f109ba9a8d1e27de9c19006e853c96de	["*"]	\N	2024-08-01 11:44:16	2024-08-01 11:44:16
388	App\\Models\\User	141	Personal Access Token	c5d33c3402db2f8cb2c62238bcccb37df41e20c3e62d1410c122de3585bb9ad7	["*"]	\N	2024-08-01 11:44:22	2024-08-01 11:44:22
389	App\\Models\\User	127	Personal Access Token	294920cd82baa7a426759406825bdebdc11c989ca43785a6477b5073ec2967c4	["*"]	\N	2024-08-01 11:49:44	2024-08-01 11:49:44
390	App\\Models\\User	127	Personal Access Token	84bde4805566a877d203321f0d0eb3a0bf812e526a18623abfe2740a8dbb9814	["*"]	\N	2024-08-01 11:50:00	2024-08-01 11:50:00
391	App\\Models\\User	141	Personal Access Token	2361b7861b81d328ec6a6896caca5498e9a112cfc1481236fc7c76a2b8061a00	["*"]	\N	2024-08-01 11:50:23	2024-08-01 11:50:23
392	App\\Models\\User	141	Personal Access Token	0d7465da1793ad673d9f82ef956f1a0492adb9f5eb0d7d31f0ea6f9af56b8092	["*"]	\N	2024-08-01 11:50:27	2024-08-01 11:50:27
393	App\\Models\\User	126	Personal Access Token	87e20e570fba98d443dcceb43dc63630e421bbc867ad17b8771c16d222f8d651	["*"]	\N	2024-08-01 12:01:55	2024-08-01 12:01:55
394	App\\Models\\User	126	Personal Access Token	e1c90fa7a3452e6f3acb4371748c681bb273e6ccf349d2da35ebdfd6f51092ec	["*"]	\N	2024-08-01 12:02:01	2024-08-01 12:02:01
395	App\\Models\\User	141	Personal Access Token	c8f37208754e7b3e8cd69fe6fc09f251235393344f2f8a787f4b3f7ebddce8ea	["*"]	\N	2024-08-01 12:08:16	2024-08-01 12:08:16
396	App\\Models\\User	141	Personal Access Token	9dbfe1a499046c484bfa77fae21984759454dd6bf30853e1ec68ef4af312eef4	["*"]	\N	2024-08-01 12:08:25	2024-08-01 12:08:25
397	App\\Models\\User	147	Personal Access Token	526289e65b7dab9fb836f071ebb141c41bec6456cd328f0250f7ee4c0321cdbb	["*"]	\N	2024-08-01 12:10:55	2024-08-01 12:10:55
398	App\\Models\\User	147	Personal Access Token	6a72b51dfba2db6a00019c2b58b926b1c26b9e7670bd937721864de334b790af	["*"]	\N	2024-08-01 12:11:08	2024-08-01 12:11:08
399	App\\Models\\User	147	Personal Access Token	0e22315e5db12e9f6a357b89d517a373d314befaccc5af3cfce06490e16b74c0	["*"]	\N	2024-08-01 12:13:44	2024-08-01 12:13:44
400	App\\Models\\User	147	Personal Access Token	193ff27af6c96066c47d45fbaca1d056cbc1c369141ccce44aaf522469264917	["*"]	\N	2024-08-01 12:13:52	2024-08-01 12:13:52
401	App\\Models\\User	147	Personal Access Token	5dca834038323936308cd523b14981e29c3d54249324ca9e3ddd653520cacec9	["*"]	\N	2024-08-01 12:14:24	2024-08-01 12:14:24
402	App\\Models\\User	141	Personal Access Token	63e83bfe482b7d9c1f84ae60192ae01a4c266c3e8b25fdd6382bab4d91e660b0	["*"]	\N	2024-08-01 12:16:17	2024-08-01 12:16:17
403	App\\Models\\User	141	Personal Access Token	89972b68072b093cbd3c459530fa3d043047cd152a7b14f39ed85f52ffe9af0d	["*"]	\N	2024-08-01 12:16:21	2024-08-01 12:16:21
404	App\\Models\\User	141	Personal Access Token	54ef58538b319211a06d4a0ad0c7d9ae6fffff5be33e682ffd9e3f9e2c59f237	["*"]	\N	2024-08-01 12:18:46	2024-08-01 12:18:46
405	App\\Models\\User	141	Personal Access Token	f4128d29f95a772fd2f4dab5a98e6065ab758167bed15c55aea05ec0001ccf97	["*"]	\N	2024-08-01 12:19:02	2024-08-01 12:19:02
406	App\\Models\\User	131	Personal Access Token	e27315af6dc587a0627cdbeed7514fc041807e3f366868a3712ea70986e0af97	["*"]	\N	2024-08-01 12:19:30	2024-08-01 12:19:30
407	App\\Models\\User	131	Personal Access Token	1e05ab8121095401b90bf2b60b6cd25fff27f3dbd1f65ee731424cde3b389f89	["*"]	\N	2024-08-01 12:19:36	2024-08-01 12:19:36
408	App\\Models\\User	147	Personal Access Token	36a4eec7da6993b93ed5da576ce2655d084ce48137cbfd15cdb73846717885ce	["*"]	\N	2024-08-01 12:24:07	2024-08-01 12:24:07
409	App\\Models\\User	147	Personal Access Token	fd17bd7f87ae8a22c39e541bceb526f3799ac70f73e41e2b4480f709b3b6e185	["*"]	\N	2024-08-01 12:24:12	2024-08-01 12:24:12
410	App\\Models\\User	141	Personal Access Token	24fc4a1731b02847f96fb92ae7ee48e77476aa278fcac34dc7492a013c6dac01	["*"]	\N	2024-08-01 12:27:28	2024-08-01 12:27:28
411	App\\Models\\User	141	Personal Access Token	34bd405c31127168223eb297aeb718842a30696d7345ee11fbb1ee86284a95c6	["*"]	\N	2024-08-01 12:27:33	2024-08-01 12:27:33
412	App\\Models\\User	134	Personal Access Token	5b2a84c2f93c774c39916fea07c096d88b7a360a2d8ddb0dab9d67b20d7e6156	["*"]	\N	2024-08-01 13:30:22	2024-08-01 13:30:22
413	App\\Models\\User	126	Personal Access Token	7513544b380a233544e7daa67b516bb590996e5437d6d8503ab57fe51afbf44a	["*"]	\N	2024-08-01 15:36:53	2024-08-01 15:36:53
414	App\\Models\\User	126	Personal Access Token	3cfc31a3252bfad4509d33f340c678abe60a6e65bac175298f6a903642efea41	["*"]	\N	2024-08-01 15:36:58	2024-08-01 15:36:58
415	App\\Models\\User	148	Personal Access Token	29265d27c66b0c485ad3427b1c7ac0067c1765113feddcd323903a63de471908	["*"]	\N	2024-08-01 16:07:56	2024-08-01 16:07:56
416	App\\Models\\User	149	Personal Access Token	5ede6aac65425ac4eaf909247e6ce77f5c8f17dca4cde369a6975c0d2a8f2eef	["*"]	\N	2024-08-01 20:35:43	2024-08-01 20:35:43
417	App\\Models\\User	150	Personal Access Token	22c0a81a617fcb22acd5b216b496cc0c38d6c816b02883b8e59f6b23998ae80e	["*"]	\N	2024-08-01 20:36:37	2024-08-01 20:36:37
418	App\\Models\\User	151	Personal Access Token	53a1f7350c6b203dc8007ca7ad1a9e5a3b09d3d53ddce1b264c32b8b6d166763	["*"]	\N	2024-08-01 22:26:08	2024-08-01 22:26:08
419	App\\Models\\User	152	Personal Access Token	eb99d7a4adc3c776f6bc8964a50afb7150250c31a1f9bd20fa808ebf6398e6e8	["*"]	\N	2024-08-02 02:04:17	2024-08-02 02:04:17
420	App\\Models\\User	126	Personal Access Token	d5227f5ec418e3fbed50af046bb428a20eb5f9c7ab88a85b16d4137afffb3166	["*"]	\N	2024-08-02 02:05:39	2024-08-02 02:05:39
421	App\\Models\\User	126	Personal Access Token	0620604278744f39ba76ce2f433a7e625fae4a2f975a7ed991fd05ec503a81d9	["*"]	\N	2024-08-02 02:05:43	2024-08-02 02:05:43
422	App\\Models\\User	141	Personal Access Token	5ef8909fcb210a2efa664cd26d29a21dafa03b73b1b8f0264fc8ab288ea6f53d	["*"]	\N	2024-08-02 05:56:17	2024-08-02 05:56:17
423	App\\Models\\User	141	Personal Access Token	39dcdb5bf9b50fe4a90394fae61a66de739ba99ed7dcb2760127ffada08a1afd	["*"]	\N	2024-08-02 05:56:22	2024-08-02 05:56:22
424	App\\Models\\User	126	Personal Access Token	2dbaf506eda57b5750d8e72a8e7377131646852b29a5008ca6ef9b9966e1cef5	["*"]	\N	2024-08-02 09:06:24	2024-08-02 09:06:24
425	App\\Models\\User	126	Personal Access Token	51f72c70dd832cbcaff61fcf097c4e35537737611ffb40d440faec61be752383	["*"]	\N	2024-08-02 09:06:32	2024-08-02 09:06:32
426	App\\Models\\User	141	Personal Access Token	bce0ead35dbe164b6ebd726fa77da3e11ac2d701e0d616fc41afe3038c2d067c	["*"]	\N	2024-08-02 09:45:06	2024-08-02 09:45:06
427	App\\Models\\User	141	Personal Access Token	f0cbb1982e05696600d107a2d02bf1028d1db43f043cfd0d79f1c9421604cc2c	["*"]	\N	2024-08-02 09:45:13	2024-08-02 09:45:13
428	App\\Models\\User	141	Personal Access Token	b73689e7771968f9934dbf43a78a8a36e5370a1a19ffbd7e38e94bcf34af8b09	["*"]	\N	2024-08-02 10:53:58	2024-08-02 10:53:58
429	App\\Models\\User	141	Personal Access Token	3f29ab6a3a1ee73db69fc5d655674724b0ebd4a9053f216a4d5df5f298663e33	["*"]	\N	2024-08-02 10:54:05	2024-08-02 10:54:05
430	App\\Models\\User	143	Personal Access Token	520d3e2da78bae4ce4c95b0e761c5022c60a2c5d804a20d6a44981dd964af614	["*"]	\N	2024-08-02 11:01:33	2024-08-02 11:01:33
431	App\\Models\\User	143	Personal Access Token	9bc3b052e1f6641706e4be771ca9725e89aad854b24d04e0c49f9b1d6e29741d	["*"]	\N	2024-08-02 11:01:38	2024-08-02 11:01:38
432	App\\Models\\User	126	Personal Access Token	c9ec709d761bbbd44aa61158754ae3852c4bd466ef0e88e25096dd3eaf93dfe3	["*"]	\N	2024-08-02 11:05:09	2024-08-02 11:05:09
433	App\\Models\\User	126	Personal Access Token	75dafff7d4d824ddff787dca802ca37432cec080c0ef141987cd8a09d5d37b5a	["*"]	\N	2024-08-02 11:05:14	2024-08-02 11:05:14
434	App\\Models\\User	152	Personal Access Token	ae4a62c888a0091774a0bf64d8e5812d56142cd91fe68b47bb26ce455425d660	["*"]	\N	2024-08-02 12:47:24	2024-08-02 12:47:24
435	App\\Models\\User	152	Personal Access Token	a64d5fc2ab9403c318a1e47f40610f603d4139b290585ad3291883fd8a1dcc7f	["*"]	\N	2024-08-02 12:47:30	2024-08-02 12:47:30
436	App\\Models\\User	126	Personal Access Token	33f70530ad208fd071637cf08a0d6ae269eb7e39424cd83cddbf5b3fcc08b40c	["*"]	\N	2024-08-02 12:52:46	2024-08-02 12:52:46
437	App\\Models\\User	126	Personal Access Token	724d8a28ff65f39aed427b5e400eb13c588b859b0bf7ebbd3f9244457977dee8	["*"]	\N	2024-08-02 12:52:52	2024-08-02 12:52:52
438	App\\Models\\User	126	Personal Access Token	326916076e4b6703c1d2dfe0185424da1dc00b0535df7699a67668046fd2dda2	["*"]	\N	2024-08-03 03:04:20	2024-08-03 03:04:20
439	App\\Models\\User	126	Personal Access Token	065d4bd94870ef23fde40cee68355d108754ae74b395bf7c2240caabf8cb42c6	["*"]	\N	2024-08-03 03:04:31	2024-08-03 03:04:31
440	App\\Models\\User	141	Personal Access Token	0051d0a6e2195e516092f3c29b6a2dad23d354e3579c9d984526407085ca94ec	["*"]	\N	2024-08-03 03:49:30	2024-08-03 03:49:30
441	App\\Models\\User	141	Personal Access Token	a9fac32b089efb1bb4746d951f800bb3dd56e38eb09b4428512514785071d983	["*"]	\N	2024-08-03 03:49:37	2024-08-03 03:49:37
442	App\\Models\\User	126	Personal Access Token	f0adeda20497c5b30f45792f6a04573635b5ab5c5fdfcd367c607da3d9bb02d9	["*"]	\N	2024-08-03 04:51:55	2024-08-03 04:51:55
443	App\\Models\\User	126	Personal Access Token	4423189f8eb8430ab68e761d8482252f3fa0af1a786cafb1344593e58e126167	["*"]	\N	2024-08-03 04:52:00	2024-08-03 04:52:00
444	App\\Models\\User	129	Personal Access Token	5f237c48c87d587a777bc9950e0c9d40a11c976d699c447324f411560e16f4d7	["*"]	\N	2024-08-03 06:01:52	2024-08-03 06:01:52
445	App\\Models\\User	131	Personal Access Token	aa97666dc2b6c1a1dc1ac62e18b720e082e8747828d08ebe4ebb6cd14791e6b0	["*"]	\N	2024-08-03 06:04:01	2024-08-03 06:04:01
446	App\\Models\\User	131	Personal Access Token	cf9a85260906e3b50760b8954c903db7d71f16dd625b91c53d388b0c21c0cc21	["*"]	\N	2024-08-03 06:04:08	2024-08-03 06:04:08
447	App\\Models\\User	127	Personal Access Token	f5b9ea1fd45ac3842e7bf68ec6c430eb53e9dc253348347607bd864d2ac4e33d	["*"]	\N	2024-08-03 09:38:13	2024-08-03 09:38:13
448	App\\Models\\User	127	Personal Access Token	61f604a7970fbb958f53ee6ede6aa52ebf6316fd72df88cdb362514f99f11cb1	["*"]	\N	2024-08-03 09:38:24	2024-08-03 09:38:24
449	App\\Models\\User	9	Personal Access Token	dc1a6208091beac13c22db51fc24cd875edb9b275a76cf28278b8069333729ab	["*"]	\N	2025-06-02 09:51:44	2025-06-02 09:51:44
450	App\\Models\\User	157	Personal Access Token	5325b8b20cf2f3426f1288103d1b0f09b32026c2121c89c4ae3dde5ac78b2b12	["*"]	\N	2025-06-02 09:58:31	2025-06-02 09:58:31
451	App\\Models\\User	157	Personal Access Token	0a2ad94aafa36c60e6be19a036227b2f293b026041350934a1502dcdd656df18	["*"]	\N	2025-06-02 09:58:32	2025-06-02 09:58:32
452	App\\Models\\User	158	Personal Access Token	bd0efb79e9a17391b126ec43c3612635a93676849fbfdd86e49f94c99327227c	["*"]	\N	2025-06-02 10:05:02	2025-06-02 10:05:02
453	App\\Models\\User	158	Personal Access Token	ec12e6073d642382bcf1a46198e4396018cfe76c447cae93036e373b8b82693c	["*"]	\N	2025-06-02 10:05:03	2025-06-02 10:05:03
454	App\\Models\\User	157	Personal Access Token	4b967366de2a1de133c315879936a11e0202e43a302de6714e312486e8b64c30	["*"]	\N	2025-06-02 10:07:04	2025-06-02 10:07:04
455	App\\Models\\User	157	Personal Access Token	c4140a5550b2b54e74ddabafed53ceec6e5298d158c14e4bea1354185211befe	["*"]	\N	2025-06-02 10:08:05	2025-06-02 10:08:05
456	App\\Models\\User	160	Personal Access Token	9e8078f99d9db8a1b3043d5826fff12e557ad4df1bfe086340bb17d24ea4fd8f	["*"]	\N	2025-06-02 12:05:42	2025-06-02 12:05:42
457	App\\Models\\User	160	Personal Access Token	125009f9ac84d9f21d35a618acbd7b0edbf19f616ab9a8a732ea4ee940553061	["*"]	\N	2025-06-02 12:05:56	2025-06-02 12:05:56
458	App\\Models\\User	161	Personal Access Token	079abe65b2705ebe3c72d471e0a9815b28425b0bfd48137b893a27680dbd7ef4	["*"]	\N	2025-06-02 12:16:53	2025-06-02 12:16:53
459	App\\Models\\User	161	Personal Access Token	070dfac7da03e9486c43fbd0d3aa57a971ea352b069a970bc9c533558d238f8e	["*"]	\N	2025-06-02 12:17:53	2025-06-02 12:17:53
460	App\\Models\\User	161	Personal Access Token	d4f6ab702175ea7575a780d061d076d2cac17e035b9b3e4a08b23f2690f97a2b	["*"]	\N	2025-06-02 12:18:07	2025-06-02 12:18:07
461	App\\Models\\User	161	Personal Access Token	0c2533c5e11212baec512406faba19e5236fb200243401150dc58c1c16b6958e	["*"]	\N	2025-06-02 12:18:49	2025-06-02 12:18:49
462	App\\Models\\User	161	Personal Access Token	89e0692a3add22522ff4b855ef73dc20fea1c3d6e880857e95a2c602998bb483	["*"]	\N	2025-06-02 12:18:49	2025-06-02 12:18:49
463	App\\Models\\User	161	Personal Access Token	af0660504de8bac81be7ef4a559c6f8e872e017c91d2f38e296727111d3f9e0e	["*"]	\N	2025-06-02 12:19:14	2025-06-02 12:19:14
464	App\\Models\\User	161	Personal Access Token	601bfad75622eae11a21e4434b4b64bf44df239bfb3b4f2c9c5a4c1d60b95bc8	["*"]	\N	2025-06-02 12:19:31	2025-06-02 12:19:31
465	App\\Models\\User	157	Personal Access Token	b55c99788edf5082c231702ea71531e8c28b2b1859e378d3706c8fb434c29476	["*"]	\N	2025-06-03 04:25:55	2025-06-03 04:25:55
466	App\\Models\\User	157	Personal Access Token	50785386183bc07a300d69f99b9d992afdc3420b58b8f801b458e2bb19e11789	["*"]	\N	2025-06-03 04:26:16	2025-06-03 04:26:16
467	App\\Models\\User	161	Personal Access Token	7aa44f87b39e157ffe83c704334ea6b505b7e89dde73c563e596a6193f5dd0f6	["*"]	\N	2025-06-03 13:11:46	2025-06-03 13:11:46
468	App\\Models\\User	163	Personal Access Token	49be6e0a203f3c97e61d5e739e264a21e287cea71482131e55bd20e47430018d	["*"]	\N	2025-06-03 15:34:02	2025-06-03 15:34:02
469	App\\Models\\User	163	Personal Access Token	8f6b51c31bf951b49d6c4aa018a3494d1733fc321a5add261f25f80e9481d449	["*"]	\N	2025-06-03 15:35:10	2025-06-03 15:35:10
470	App\\Models\\User	163	Personal Access Token	35b97cf86f6a061ab2beed4ac57e190898d2b0a0afd50cf5480fdfa7e9c3c60c	["*"]	\N	2025-06-03 15:35:11	2025-06-03 15:35:11
471	App\\Models\\User	163	Personal Access Token	891d01c7b727f45e01b62c35092d619ed774214c5b82d87f1b365d1264d4aeae	["*"]	\N	2025-06-03 15:35:32	2025-06-03 15:35:32
472	App\\Models\\User	163	Personal Access Token	74ca03d9197487bbc719e44c2f2e2342746d0f8943f7d7aa58ce687f2bce3575	["*"]	\N	2025-06-03 15:35:58	2025-06-03 15:35:58
473	App\\Models\\User	164	Personal Access Token	08ae4cdc4fb9c92456696d8262abaf3629e96645a8681b970c0878ff3c650d67	["*"]	\N	2025-06-04 07:10:38	2025-06-04 07:10:38
474	App\\Models\\User	163	Personal Access Token	f559dad721f2ca3fbdba7c3db0cbded4ba059a07131c934f7a37db53c2769552	["*"]	\N	2025-06-04 07:11:03	2025-06-04 07:11:03
475	App\\Models\\User	164	Personal Access Token	e1af9d60492e4800cbe2e833c79d56eda2fd03305d419d3b575eb64d8597bc0d	["*"]	\N	2025-06-04 07:11:07	2025-06-04 07:11:07
476	App\\Models\\User	163	Personal Access Token	67994651a7e24770ff8aa3df96c1c888cf941b4c9741556901fe9a6b11c6e518	["*"]	\N	2025-06-04 07:11:26	2025-06-04 07:11:26
477	App\\Models\\User	163	Personal Access Token	9054d4e5c11193e2dee513712d94a84e2426b689e17b7a629a65a3b9153dc148	["*"]	\N	2025-06-04 07:14:13	2025-06-04 07:14:13
478	App\\Models\\User	163	Personal Access Token	fffe899e6060983aa6a62714e3ab54efe2c718f468742e0f725f794b4a663965	["*"]	\N	2025-06-04 07:15:12	2025-06-04 07:15:12
479	App\\Models\\User	164	Personal Access Token	9ca898f3def45296f5575954d6e6a5f7d2859d8ff883b8dd7408e5619e5fb2d0	["*"]	\N	2025-06-04 07:42:27	2025-06-04 07:42:27
480	App\\Models\\User	164	Personal Access Token	501ff188265a16120f742f8f7ff29e8d91f5e4148551c4714494133cb21185a9	["*"]	\N	2025-06-04 07:42:35	2025-06-04 07:42:35
481	App\\Models\\User	165	Personal Access Token	7d90093fccb04a20751983131cc5e8199c696e3b797a88062ab4d8090b033182	["*"]	\N	2025-06-04 07:42:50	2025-06-04 07:42:50
482	App\\Models\\User	165	Personal Access Token	2d85e5810e86b21b02ac6a37d6d3e5442412d318c7e82c6e8f7759101e375609	["*"]	\N	2025-06-04 08:14:12	2025-06-04 08:14:12
483	App\\Models\\User	161	Personal Access Token	13ebb5c61cd343ac0cedb8d7f631262bed2098497e3888bb592988fe0dd884ad	["*"]	\N	2025-06-04 08:29:32	2025-06-04 08:29:32
484	App\\Models\\User	161	Personal Access Token	64a368bd24acf4c33a807ae421cb0d2429a1cc9f6ec6114aaadb80a2b9bf8eba	["*"]	\N	2025-06-04 08:29:45	2025-06-04 08:29:45
485	App\\Models\\User	165	Personal Access Token	d8bfab12d7eb4f9c510e9299333121be454c33e4c8631351ad8785ce290251ca	["*"]	\N	2025-06-04 08:34:31	2025-06-04 08:34:31
486	App\\Models\\User	165	Personal Access Token	23d464de9be3568893434a6c5b10d1480a5f0980b73d77e51ac29df6b2b9e892	["*"]	\N	2025-06-04 08:34:34	2025-06-04 08:34:34
487	App\\Models\\User	165	Personal Access Token	62654fbf6079ff77a797af30da23b01755297df0952562ecd3853bbf3ced1bd8	["*"]	\N	2025-06-04 08:35:02	2025-06-04 08:35:02
488	App\\Models\\User	166	Personal Access Token	272040717d399b6955ada98fb73e5854bb4e078616a42466a14a0d7e268564ed	["*"]	\N	2025-06-04 08:36:08	2025-06-04 08:36:08
489	App\\Models\\User	167	Personal Access Token	0f73fcae19709d1c27aa12a09ee693330a6422568e32a0f0142223fef38873ce	["*"]	\N	2025-06-04 15:03:40	2025-06-04 15:03:40
490	App\\Models\\User	167	Personal Access Token	bebe88107a7d6eb43b890709389ee720ca7368b9ec00789682859c1bbf8aece3	["*"]	\N	2025-06-04 15:07:59	2025-06-04 15:07:59
491	App\\Models\\User	167	Personal Access Token	e380e657fde53f407e426fc818e79b3b8507a9889d4ef7ef30e987b81afc3e1b	["*"]	\N	2025-06-04 15:08:03	2025-06-04 15:08:03
492	App\\Models\\User	167	Personal Access Token	21310b18f31ec54d8f3d1d95cc75058ce50ee4f5478395667b615f9b27469a8f	["*"]	\N	2025-06-04 15:09:52	2025-06-04 15:09:52
493	App\\Models\\User	167	Personal Access Token	0bf014a96125f590571303f55c9fc9aea259f807c9064912466c4ed6213823e8	["*"]	\N	2025-06-04 15:09:55	2025-06-04 15:09:55
494	App\\Models\\User	167	Personal Access Token	25058f8ecac346d77ffd4015f8bf6473664fb45a21c1c75368537f019e78f34b	["*"]	\N	2025-06-04 15:25:48	2025-06-04 15:25:48
495	App\\Models\\User	167	Personal Access Token	44fa2b1d97049fb6d0ce108b49c377fe04ba6bb9b9974080023139712c59420f	["*"]	\N	2025-06-04 15:25:52	2025-06-04 15:25:52
496	App\\Models\\User	167	Personal Access Token	78f785daf42287d6080bd3e2f47ac1c6cc147da5f4d24192f00446688cfa4fd9	["*"]	\N	2025-06-04 15:41:40	2025-06-04 15:41:40
497	App\\Models\\User	167	Personal Access Token	f63570443a3a8ea27132b51bcdf25e03bc708178ce77e528fbd4ac3031556146	["*"]	\N	2025-06-04 15:41:43	2025-06-04 15:41:43
498	App\\Models\\User	167	Personal Access Token	000d91875fe7a983422fdda0655b2490f4de95827ed9568e508b868b100e8612	["*"]	\N	2025-06-04 15:43:02	2025-06-04 15:43:02
499	App\\Models\\User	167	Personal Access Token	d6fd13abe80601a5f113fd314da35bbb48f1208b383f660d8f732fcfc7fad6a5	["*"]	\N	2025-06-04 15:43:05	2025-06-04 15:43:05
500	App\\Models\\User	167	Personal Access Token	b59b679e0c0cd15d06faa954acdcf3b735f31d2273c6716483987fa2375d7906	["*"]	\N	2025-06-04 15:46:09	2025-06-04 15:46:09
501	App\\Models\\User	167	Personal Access Token	e9abdacce7fe57289041766ac46e42cb7c5dfc8479192daf490dfd0f012e2ac9	["*"]	\N	2025-06-04 15:46:12	2025-06-04 15:46:12
502	App\\Models\\User	167	Personal Access Token	505a983985e7f328cfd956e3a74450129acde72c3a9d7ee0aefbf52261613d60	["*"]	\N	2025-06-04 15:47:24	2025-06-04 15:47:24
503	App\\Models\\User	167	Personal Access Token	9a5a499bb0a37cb29c1ea0e7a58217f3942194ce32b79179b8fa5f8725e1a3f3	["*"]	\N	2025-06-04 15:47:27	2025-06-04 15:47:27
504	App\\Models\\User	167	Personal Access Token	5d38bf6036b1106ce054b3fd87b56a9d52602d7674ed66aa3ac14dc7adbab143	["*"]	\N	2025-06-04 15:49:46	2025-06-04 15:49:46
505	App\\Models\\User	167	Personal Access Token	c3319356116b1a39ee88fb9cd9f1b9139d5087e06e715d92db031790e4999f13	["*"]	\N	2025-06-04 15:49:49	2025-06-04 15:49:49
506	App\\Models\\User	167	Personal Access Token	cd9a9c8f2c328f9c57ead1a82ce262c27e953d27dd6384da6cc9e33e9d1bdfde	["*"]	\N	2025-06-04 15:54:03	2025-06-04 15:54:03
507	App\\Models\\User	167	Personal Access Token	e6b867dd4b514bd76aa4804021a6c98c7053fdb63c169b738d5b08df4c1c6498	["*"]	\N	2025-06-04 15:54:06	2025-06-04 15:54:06
508	App\\Models\\User	167	Personal Access Token	67a7a7492322ca9f164167f53d864a69218bed8ed56e1405b74388949c25ee89	["*"]	\N	2025-06-04 16:09:25	2025-06-04 16:09:25
509	App\\Models\\User	167	Personal Access Token	d723d816672085525a2215e1f865e8be876865e3947dd50f5f9983a17cc5cd13	["*"]	\N	2025-06-04 16:09:28	2025-06-04 16:09:28
510	App\\Models\\User	167	Personal Access Token	f63b0a437bd6f193818658c1550fc16a47dfee9dfa371465bcdb7cb34c247436	["*"]	\N	2025-06-04 16:12:23	2025-06-04 16:12:23
511	App\\Models\\User	167	Personal Access Token	01cfd75a66cd93c68045301be0c2b42abc9ccaddd6271ed7658d42a3b2c54e45	["*"]	\N	2025-06-04 16:12:27	2025-06-04 16:12:27
512	App\\Models\\User	167	Personal Access Token	2d629563c18368913ca903a767ab5f4077b3f9d3d137a556360412e393a6c932	["*"]	\N	2025-06-04 16:13:49	2025-06-04 16:13:49
513	App\\Models\\User	167	Personal Access Token	fdfa54bb3b7fdbf1d78f315218cb4c84c2a17a7e1fd201b5830dc0a1bc9d9c34	["*"]	\N	2025-06-04 16:13:54	2025-06-04 16:13:54
514	App\\Models\\User	167	Personal Access Token	ff4003d5bcedbef61bbb61f7572907b7d5bf21dc786bcc843fa99feb234e17eb	["*"]	\N	2025-06-04 16:15:19	2025-06-04 16:15:19
515	App\\Models\\User	167	Personal Access Token	b41c666c2d257655f49e93dcbbc3af6b3173fc83bcd1f52af186f7ed610ea78f	["*"]	\N	2025-06-04 16:15:25	2025-06-04 16:15:25
516	App\\Models\\User	167	Personal Access Token	80e96a52661cc290fb047ddd5338104d50d15d3d61dcd2f4eb543290ba56c4d9	["*"]	\N	2025-06-04 16:18:53	2025-06-04 16:18:53
517	App\\Models\\User	167	Personal Access Token	b7f36fd66a7345f124e3ac1497a4065cea7e65c8e2d6ab59caa5f7c25ec364f1	["*"]	\N	2025-06-04 16:18:56	2025-06-04 16:18:56
518	App\\Models\\User	167	Personal Access Token	215eb2c1a6d17c5c1bff6ce9cc9c71b717b1587794b1c955e6410fd6b81a1eca	["*"]	\N	2025-06-04 16:35:05	2025-06-04 16:35:05
519	App\\Models\\User	167	Personal Access Token	950281a477c8aee3fb0cda034ebe65bbe77ee435d89f96838e47b2cae845fc80	["*"]	\N	2025-06-04 16:35:09	2025-06-04 16:35:09
520	App\\Models\\User	167	Personal Access Token	3d27c6886068913fac4000549ef02b60ab5e9546fcdb101215f1c9622467d431	["*"]	\N	2025-06-04 16:36:22	2025-06-04 16:36:22
521	App\\Models\\User	167	Personal Access Token	041eb5a5984e8a55a5966771cd8c03113735d22c71302b8a4e0570792656f51d	["*"]	\N	2025-06-04 16:36:26	2025-06-04 16:36:26
522	App\\Models\\User	167	Personal Access Token	a770afa5e8a86c516835e81bb0530b82c91d87e7ae9d004b35abd6276eb57abf	["*"]	\N	2025-06-04 16:37:15	2025-06-04 16:37:15
523	App\\Models\\User	167	Personal Access Token	028413d7370fcd5f96133a054dac2faaafcfc99a3f4e0c22edbf17f843d0c692	["*"]	\N	2025-06-04 16:37:19	2025-06-04 16:37:19
524	App\\Models\\User	168	Personal Access Token	808f157010d8b75f24d4d6da7cab1a276b48fa94efb6b3da76ccf2b63b1934e4	["*"]	\N	2025-06-04 16:38:35	2025-06-04 16:38:35
525	App\\Models\\User	167	Personal Access Token	1fd7b596d060fb2c971be6d434d4469e1772516323c8ce8ca153a762c47f4763	["*"]	\N	2025-06-04 16:40:02	2025-06-04 16:40:02
526	App\\Models\\User	167	Personal Access Token	94514a65d8d4cca6d2316b0724f2fa1d9df9eec9b088e6a7b830b744361d60b2	["*"]	\N	2025-06-04 16:40:05	2025-06-04 16:40:05
527	App\\Models\\User	167	Personal Access Token	4bb66801114230dfed2606292e262b23bf9117a627b87334156bf2597b1d4907	["*"]	\N	2025-06-04 16:56:53	2025-06-04 16:56:53
528	App\\Models\\User	167	Personal Access Token	0b589aab51627bca4b2af94ebda30dd445dd30e1d7e6da4ceb4578fc71cb8c10	["*"]	\N	2025-06-04 16:56:56	2025-06-04 16:56:56
529	App\\Models\\User	167	Personal Access Token	32dc73c32e1e947321564e4ca0434dac09d1639b37d218b2ce6867fcf6a8544f	["*"]	\N	2025-06-04 17:01:27	2025-06-04 17:01:27
530	App\\Models\\User	167	Personal Access Token	dad1725e278977af4f152a382fc37d5dd90bd80b7e02f0c8fd7ee744eb1c0514	["*"]	\N	2025-06-04 17:01:31	2025-06-04 17:01:31
531	App\\Models\\User	167	Personal Access Token	363e3f407395aaa560afe0c0da6753655620b25034c0c81e4211ef70fcae661a	["*"]	\N	2025-06-04 17:12:29	2025-06-04 17:12:29
532	App\\Models\\User	167	Personal Access Token	ba521944632c7f3e7a6e040bab4da4d659e6cd12bafb303a2aed2707333407b0	["*"]	\N	2025-06-04 17:12:32	2025-06-04 17:12:32
533	App\\Models\\User	167	Personal Access Token	962c6e5deb51200e8012ac3d8e1144d9eb25c2cf0e9f05c9208672acf94f3f24	["*"]	\N	2025-06-04 17:15:43	2025-06-04 17:15:43
534	App\\Models\\User	167	Personal Access Token	9be906dd09a00deb007bc8bf61e7f9ed4ac807064a29e7607bff6b65092f9c85	["*"]	\N	2025-06-04 17:15:48	2025-06-04 17:15:48
535	App\\Models\\User	167	Personal Access Token	e707d293938e4c82e394ab1c06d95483861d0f053151b9a5929483ea088eded1	["*"]	\N	2025-06-04 17:18:14	2025-06-04 17:18:14
536	App\\Models\\User	167	Personal Access Token	a537207747527069b3c4fd2312fd3ac6e48aa0db0995da2245f0122210f9de66	["*"]	\N	2025-06-04 17:18:17	2025-06-04 17:18:17
537	App\\Models\\User	167	Personal Access Token	3ad9d4eb5d6c7d1b301bfb346a1c225c7475dbed8005d21371508907fc2493a6	["*"]	\N	2025-06-04 17:23:06	2025-06-04 17:23:06
538	App\\Models\\User	167	Personal Access Token	d2a592283931f5faf117860a2f19fdaa605e4294ad26c4df6c9665c094657b38	["*"]	\N	2025-06-04 17:23:10	2025-06-04 17:23:10
539	App\\Models\\User	165	Personal Access Token	0ff61cb6952d21ef74c5c2fb787ebcffe8a646518565b780fc3adc142d7fb01f	["*"]	\N	2025-06-04 17:27:03	2025-06-04 17:27:03
540	App\\Models\\User	165	Personal Access Token	87167afa0877fa230249e8c74e667de86ad5c61d90deb488d6cce8b0920a20fc	["*"]	\N	2025-06-04 17:27:08	2025-06-04 17:27:08
541	App\\Models\\User	165	Personal Access Token	4910547d258552e9f8b1005cf628eba6351fc1c074fd8b9d03373c5a3c5c8b2d	["*"]	\N	2025-06-04 17:27:38	2025-06-04 17:27:38
542	App\\Models\\User	165	Personal Access Token	1fa54c0f58a1cdc7cc259ca99faf670b8c4dd8b0d29b53897c0831ee55b31e3b	["*"]	\N	2025-06-04 17:27:39	2025-06-04 17:27:39
543	App\\Models\\User	165	Personal Access Token	879f4f691327d81e01007095b256f50cc98f9453221c16045f8ba0a9a9d5c5f8	["*"]	\N	2025-06-04 17:28:14	2025-06-04 17:28:14
544	App\\Models\\User	165	Personal Access Token	b327ffb36a4cdd95d21051faeb3930cc976e67821c7753c87c1aab50ef8647b2	["*"]	\N	2025-06-04 17:28:19	2025-06-04 17:28:19
545	App\\Models\\User	165	Personal Access Token	8d17a4ee850aefd6ff45174478543e27cf94049db6080f21ef9bfeff7274c14c	["*"]	\N	2025-06-04 17:28:51	2025-06-04 17:28:51
546	App\\Models\\User	165	Personal Access Token	e8e49018d19adca13ac50f88855549e5163d066fb9cdfcb6316b36e944b45857	["*"]	\N	2025-06-04 17:28:51	2025-06-04 17:28:51
547	App\\Models\\User	167	Personal Access Token	42644405d5994fe921319d2179fc9fe31eaeaecf6f2f035df2a5c7d74948582a	["*"]	\N	2025-06-04 17:32:56	2025-06-04 17:32:56
548	App\\Models\\User	167	Personal Access Token	443a7bb1c01bda84c4d7ef26b3d5358fef5465bce08727dc6c888d59c7967b25	["*"]	\N	2025-06-04 17:33:00	2025-06-04 17:33:00
549	App\\Models\\User	167	Personal Access Token	f362accb4012ebeac8191bfd2d987cfb6d4796c91dfa2207750de34c6e570ba7	["*"]	\N	2025-06-04 17:41:37	2025-06-04 17:41:37
550	App\\Models\\User	167	Personal Access Token	8736a04e7587dbf4ad1f7bba92eceeac2e0e4027511739a4ab643a3594257e25	["*"]	\N	2025-06-04 17:41:41	2025-06-04 17:41:41
551	App\\Models\\User	167	Personal Access Token	ec46ef3898cca018fa470f879be61169976a7dc3754f332f1ba83be6a8b0b6e9	["*"]	\N	2025-06-04 17:49:50	2025-06-04 17:49:50
552	App\\Models\\User	167	Personal Access Token	7cdb1581cb26ab48e2da29d1492a5f1c75a658b087150b050bbab9de01fe9052	["*"]	\N	2025-06-04 17:49:58	2025-06-04 17:49:58
553	App\\Models\\User	169	Personal Access Token	6040f17133bbb19f3e62cd74719248101ee4d86dea8315513bd1c2ebedc12e35	["*"]	\N	2025-06-04 17:51:27	2025-06-04 17:51:27
554	App\\Models\\User	169	Personal Access Token	c20c1d53def2ee6af0dce552b120f58719ed3b26142cf7c4c49c228f0edc6921	["*"]	\N	2025-06-04 17:52:00	2025-06-04 17:52:00
555	App\\Models\\User	169	Personal Access Token	843efd8185d45441d67af74413bd5137e4f0ae76f323676e69b666b41530d94c	["*"]	\N	2025-06-04 17:52:00	2025-06-04 17:52:00
556	App\\Models\\User	164	Personal Access Token	19fdbfa306ee6195c319bbe7910f47bb8b0b0d604db7c14335245278735fa9d0	["*"]	\N	2025-06-04 19:17:35	2025-06-04 19:17:35
557	App\\Models\\User	164	Personal Access Token	7563a7b2041d98d597ca82020352f9ec3fa94a271a3d05ddee12d9eb8abbccaf	["*"]	\N	2025-06-04 19:17:39	2025-06-04 19:17:39
558	App\\Models\\User	170	Personal Access Token	e1a7bb7c6f8080cdc4971adcf0db645dde1701641d910598b97e6acf48c1aa9c	["*"]	\N	2025-06-04 19:28:55	2025-06-04 19:28:55
559	App\\Models\\User	170	Personal Access Token	1b26ac53387fb999a9eb0de7d4471193f412128837c86d5e8aec6b9ff743fb8b	["*"]	\N	2025-06-04 19:29:16	2025-06-04 19:29:16
560	App\\Models\\User	170	Personal Access Token	788a82936586947c4cff4610a54ecf7d5bafa5861e12e7d6a6b67cf1572cbf54	["*"]	\N	2025-06-04 19:29:17	2025-06-04 19:29:17
561	App\\Models\\User	171	Personal Access Token	60507108f89de8655206b1475e852b0d03ac91cf3a742c431afda0aba5d1f18b	["*"]	\N	2025-06-04 19:46:45	2025-06-04 19:46:45
562	App\\Models\\User	171	Personal Access Token	9acf459d523ac03e10ba18fd7a1cf629ff7dc712d59327bdb43c98fa14e2e995	["*"]	\N	2025-06-04 19:47:03	2025-06-04 19:47:03
563	App\\Models\\User	171	Personal Access Token	8358dd608e2d10dd7ae56e7db536baee887cd1be385534f82df8dd05a653915b	["*"]	\N	2025-06-04 19:47:03	2025-06-04 19:47:03
564	App\\Models\\User	172	Personal Access Token	bd600007fd7a582872a56f9d7c89293dc5ed1ded2a1c1d0976acb924c747e381	["*"]	\N	2025-06-05 00:22:35	2025-06-05 00:22:35
565	App\\Models\\User	172	Personal Access Token	b23ae7384ab179e24e38b1abeef1ca2f44782ae75a7f8242389c44e54e5409be	["*"]	\N	2025-06-05 00:23:14	2025-06-05 00:23:14
566	App\\Models\\User	172	Personal Access Token	f665662ce727d4ae98e856a717e9d48fb6b87d07fa1bc8f08acedb33f29120d9	["*"]	\N	2025-06-05 00:23:15	2025-06-05 00:23:15
567	App\\Models\\User	167	Personal Access Token	19b2189c6286acbcbce666482be8696a8da8932c69c8d25dccaa12c485f6f1d5	["*"]	\N	2025-06-05 02:30:49	2025-06-05 02:30:49
568	App\\Models\\User	167	Personal Access Token	9242bf9bc59bb0b8b62eab886560a587e25a8e5b27cb61e21081d15df7774589	["*"]	\N	2025-06-05 02:30:53	2025-06-05 02:30:53
569	App\\Models\\User	164	Personal Access Token	6a5f2cc65bae3396fd1d1c8f81a3d7bd40eb1541c41f7adb0fad7844012fb32c	["*"]	\N	2025-06-05 04:28:51	2025-06-05 04:28:51
570	App\\Models\\User	164	Personal Access Token	64a75d24eff2a02ba001d73832f9effb2f75704450b93220b1e7037db9417b14	["*"]	\N	2025-06-05 04:28:56	2025-06-05 04:28:56
571	App\\Models\\User	165	Personal Access Token	09416e8da3a5a33caf6232aea90024369e66009e8ee4302857775590d4d4ca1e	["*"]	\N	2025-06-05 07:33:37	2025-06-05 07:33:37
572	App\\Models\\User	165	Personal Access Token	6d49f090d1014ff48a3124c2843e8aab10b05476defc4bb3cc68f878cdee06f7	["*"]	\N	2025-06-05 07:33:42	2025-06-05 07:33:42
573	App\\Models\\User	171	Personal Access Token	6f1079f9c7d5d0472fbd1b399733fd42d050c73bede0f0ad5cbb8048391276d6	["*"]	\N	2025-06-05 09:03:56	2025-06-05 09:03:56
574	App\\Models\\User	171	Personal Access Token	39f1621227c08457d8d6e771d620c00e3faffe68fd5e123ac829ff15952618a7	["*"]	\N	2025-06-05 09:03:59	2025-06-05 09:03:59
575	App\\Models\\User	167	Personal Access Token	85f94dcf1edc63b555ba87da745bcc8db9396c6ae7666efb5d0fed5df88973ec	["*"]	\N	2025-06-05 09:38:09	2025-06-05 09:38:09
576	App\\Models\\User	167	Personal Access Token	92e90e3787086441f8c04a971c7b5d9cdfa5e5354fe1d26cc37297bbd5bdfa72	["*"]	\N	2025-06-05 09:38:12	2025-06-05 09:38:12
577	App\\Models\\User	157	Personal Access Token	50206e37628bfa535319b592a4921a2e60adabc18330f12ed34260cbac36793c	["*"]	\N	2025-06-05 14:00:00	2025-06-05 14:00:00
578	App\\Models\\User	157	Personal Access Token	71a7433f0983b321c2fb5ca7d8e5f92b5e881eb9d2d05439a411d99949c1b53c	["*"]	\N	2025-06-05 19:03:42	2025-06-05 19:03:42
579	App\\Models\\User	157	Personal Access Token	aa90a1bfe11ca00cd8743d1306998b3f04f79b4041bc314edbf8fb1b066abb69	["*"]	\N	2025-06-05 19:03:52	2025-06-05 19:03:52
580	App\\Models\\User	169	Personal Access Token	e16e780c61f454613f56025e9c8523b761729125519ed119a75268925fe39d3b	["*"]	\N	2025-06-05 19:42:13	2025-06-05 19:42:13
581	App\\Models\\User	169	Personal Access Token	4d7319ece18ce706df1e20526fcd7f577b80a41a0c3d4226eacfa731dbcc6fab	["*"]	\N	2025-06-05 19:42:16	2025-06-05 19:42:16
582	App\\Models\\User	173	Personal Access Token	2c26fa83aa65c641f6b5dfd33d84fa6180b5cfaac2a1055795900ccd98d84227	["*"]	\N	2025-06-06 09:41:47	2025-06-06 09:41:47
583	App\\Models\\User	173	Personal Access Token	42b38051572b509332df17e2da4af462066b23c0db83e31ba5dc837c9527b5b9	["*"]	\N	2025-06-06 09:42:13	2025-06-06 09:42:13
584	App\\Models\\User	173	Personal Access Token	0bf102e2f3b37c462822999897501c00526122aef4d174dc87e20abdfd5456ff	["*"]	\N	2025-06-06 09:42:14	2025-06-06 09:42:14
585	App\\Models\\User	126	Personal Access Token	e399e1404e0ca9d648ac0938a1a9258594ff4f201beb639cdf4cf3a8387032ac	["*"]	\N	2025-06-06 17:32:36	2025-06-06 17:32:36
586	App\\Models\\User	126	Personal Access Token	ddc5e7f1539552ac4e8bf6ba0e9c9e7b36cdde519e8e6bb485de68f658d85a92	["*"]	\N	2025-06-06 17:32:40	2025-06-06 17:32:40
587	App\\Models\\User	126	Personal Access Token	7f19d074d8520342413c65ba489719eda5a216508670642fb2e0e5dcf9d9fcfd	["*"]	\N	2025-06-07 09:49:15	2025-06-07 09:49:15
588	App\\Models\\User	126	Personal Access Token	1338dafdfb479b7b4c0f8b110197137aacff6143f259b946c62dea48a030b4c1	["*"]	\N	2025-06-07 09:49:19	2025-06-07 09:49:19
589	App\\Models\\User	172	Personal Access Token	69bd7d291075f5eb86b6c52d5c29f38a7c142fc84b668e9d19881829de67a7f4	["*"]	\N	2025-06-07 10:52:45	2025-06-07 10:52:45
590	App\\Models\\User	172	Personal Access Token	8226d7390b90f8999403caa6cc7b735ee212163c1ab1d1b61596fce172f3f51e	["*"]	\N	2025-06-07 10:52:49	2025-06-07 10:52:49
591	App\\Models\\User	164	Personal Access Token	f3e77673bac7d8f24df8524d895820a9103a34e79a781734d0f1033549a2a4da	["*"]	\N	2025-06-07 10:53:17	2025-06-07 10:53:17
592	App\\Models\\User	164	Personal Access Token	c82d14981c461479417804b3701e285e3ab887aacd00bb498828e34d958a9cc3	["*"]	\N	2025-06-07 10:53:21	2025-06-07 10:53:21
593	App\\Models\\User	174	Personal Access Token	9a5995bda0da611ae5bb04fb796ae65ad4bc23a474ab334968abbe26bb24cc40	["*"]	\N	2025-06-07 10:54:22	2025-06-07 10:54:22
594	App\\Models\\User	174	Personal Access Token	a96801e4593cc477fc4a353edcb0fc1c2cca62546a962e85aeda7d7ad6304c6c	["*"]	\N	2025-06-07 10:55:45	2025-06-07 10:55:45
595	App\\Models\\User	174	Personal Access Token	acc6327a58587065bff806e28f38b8f757009713e8a0550262968af9ebf8bbaf	["*"]	\N	2025-06-07 10:55:46	2025-06-07 10:55:46
596	App\\Models\\User	175	Personal Access Token	f5863701569e080acd161dc4a432e420546879eada40df529845d8f4380be5f2	["*"]	\N	2025-06-07 14:59:45	2025-06-07 14:59:45
597	App\\Models\\User	175	Personal Access Token	2e7f0bc8c7b07422320bbb1435363867c711c9ebe43aff464645ea9b6aa85d01	["*"]	\N	2025-06-07 14:59:49	2025-06-07 14:59:49
598	App\\Models\\User	157	Personal Access Token	7b0675dfc99d062a0b85b24723c405b782fc904fb1851f4242dcd72da6a62799	["*"]	\N	2025-06-10 08:45:07	2025-06-10 08:45:07
599	App\\Models\\User	157	Personal Access Token	db0bbc618755986b71c55196c0fcc86a5f0f9ec3c5e2425a00a41951dcf0a963	["*"]	\N	2025-06-10 08:45:35	2025-06-10 08:45:35
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
-- Data for Name: price_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_list (id, pricing_id, vehicle_type, amount, created_at, updated_at) FROM stdin;
1	3	1	100	2024-07-26 16:31:01	2024-07-26 16:31:01
2	3	2	100	2024-07-26 16:31:01	2024-07-26 16:31:01
3	3	3	100	2024-07-26 16:31:01	2024-07-26 16:31:01
4	3	5	100	2024-07-26 16:31:01	2024-07-26 16:31:01
5	4	1	200	2024-07-26 16:48:09	2024-07-26 16:48:09
6	4	2	150	2024-07-26 16:48:09	2024-07-26 16:48:09
7	4	3	100	2024-07-26 16:48:09	2024-07-26 16:48:09
8	4	5	50	2024-07-26 16:48:09	2024-07-26 16:48:09
9	2	1	100	2024-07-26 16:54:32	2024-07-26 16:54:32
10	2	2	200	2024-07-26 16:54:32	2024-07-26 16:54:32
11	2	3	100	2024-07-26 16:54:32	2024-07-26 16:54:32
12	2	5	100	2024-07-26 16:54:32	2024-07-26 16:54:32
13	1	1	100	2024-07-26 16:54:54	2024-07-26 16:54:54
14	1	2	100	2024-07-26 16:54:54	2024-07-26 16:54:54
15	1	3	100	2024-07-26 16:54:54	2024-07-26 16:54:54
16	1	5	100	2024-07-26 16:54:54	2024-07-26 16:54:54
21	6	1	100	2024-07-30 04:06:03	2024-07-30 04:06:03
22	6	2	60	2024-07-30 04:06:03	2024-07-30 04:06:03
23	6	3	80	2024-07-30 04:06:03	2024-07-30 04:06:03
24	6	5	10	2024-07-30 04:06:03	2024-07-30 04:06:03
25	7	1	100	2024-07-30 04:08:28	2024-07-30 04:08:28
26	7	2	70	2024-07-30 04:08:28	2024-07-30 04:08:28
27	7	3	60	2024-07-30 04:08:28	2024-07-30 04:08:28
28	7	5	20	2024-07-30 04:08:28	2024-07-30 04:08:28
65	8	1	200	2024-08-02 05:31:05	2024-08-02 05:31:05
66	8	2	100	2024-08-02 05:31:05	2024-08-02 05:31:05
67	8	3	100	2024-08-02 05:31:05	2024-08-02 05:31:05
68	8	5	70	2024-08-02 05:31:05	2024-08-02 05:31:05
73	5	1	200	2024-08-03 03:08:11	2024-08-03 03:08:11
74	5	2	150	2024-08-03 03:08:11	2024-08-03 03:08:11
75	5	3	100	2024-08-03 03:08:11	2024-08-03 03:08:11
76	5	5	80	2024-08-03 03:08:11	2024-08-03 03:08:11
\.


--
-- Data for Name: pricing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pricing (id, category_id, service, make, model, price, created_at, updated_at) FROM stdin;
2	2	7	8	2	0	2024-05-20 10:03:11	2024-07-26 16:54:32
6	2	2	0	0	0	2024-07-30 04:06:03	2024-07-30 04:06:03
8	1	1	0	0	0	2024-07-30 05:00:13	2024-08-02 05:31:05
5	1	10	0	0	0	2024-07-30 04:05:22	2024-08-03 03:08:11
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, product_type, product_desc_full, product_desc_short, product_sale_from, product_sale_to, product_featured_image, product_tag, product_created_by, product_updated_by, product_status, product_deleted, product_name, product_variation_type, product_taxable, product_vender_id, product_image, product_unique_iden, product_brand_id, product_name_arabic, product_desc_full_arabic, product_desc_short_arabic, cash_points, offer_enabled, deal_enabled, is_today_offer, today_offer_date, thanku_perc, custom_status, meta_title, meta_keyword, meta_description, product_vendor_status, product_gender, is_kandora, collection_id, hot_offer_enabled, trending_enabled, offers_list, zero_quantity_orders, product_code, product_tags, sort_order, offer_for_short, hot_offer_sort_order, new_trending_sort_order, author_id, deleted, default_category_id, default_attribute_id, created_at, updated_at, store_id, moda_main_category, moda_sub_category, brand, ret_applicable, ret_policy_days, ret_policy, account_id, activity_id, is_featured, division, regular_price, stock_quantity) FROM stdin;
6	1	Short Description	Short Description	\N	\N	\N	\N	0	0	1	0	sab Maribe Test	0	1	0	\N	\N	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	0	2025-06-09 18:39:58	2025-06-09 18:39:58	0	0	0	0	0	0	\N	\N	\N	0	0	100	20
7	1	Short Description	Short Description	\N	\N	\N	\N	0	0	1	0	sab Maribe Test	0	1	0	\N	\N	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	0	2025-06-09 18:40:18	2025-06-09 18:40:18	0	0	0	0	0	0	\N	\N	\N	0	0	100	20
8	1	Short Description	Short Description	\N	\N	\N	\N	0	0	1	0	sab Maribe Test	0	1	0	\N	\N	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	0	2025-06-09 18:45:02	2025-06-09 18:45:02	0	0	0	0	0	0	\N	\N	\N	0	0	100	20
9	1	Short Description	Short Description	\N	\N	\N	\N	0	0	1	0	sab Maribe Test	0	1	0	\N	\N	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	0	0	2025-06-09 18:48:11	2025-06-09 18:48:11	0	0	0	0	0	0	\N	\N	\N	0	0	100	20
10	1	Short Description	Short Description	\N	\N	\N	\N	0	0	1	0	sab Maribe Test	0	1	0	\N	\N	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	0	0	2025-06-09 18:48:21	2025-06-09 18:48:21	0	0	0	0	0	0	\N	\N	\N	0	0	100	20
3	1	Short Description	Short Description	\N	\N	\N	\N	0	0	1	0	sab Maribe Test	0	1	0	\N	\N	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	0	0	2025-06-09 18:37:33	2025-06-09 18:37:33	0	0	0	0	0	0	\N	\N	\N	0	0	100	20
4	1	Short Description	Short Description	\N	\N	\N	\N	0	0	1	0	sab Maribe Test	0	1	0	\N	\N	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	0	0	2025-06-09 18:38:08	2025-06-09 18:38:08	0	0	0	0	0	0	\N	\N	\N	0	0	100	20
5	1	Short Description	Short Description	\N	\N	\N	\N	0	0	1	0	sab Maribe Test	0	1	0	\N	\N	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	1	0	0	2025-06-09 18:38:48	2025-06-09 18:38:48	0	0	0	0	0	0	\N	\N	\N	0	0	100	20
11	1	Short Description	Short Description is long	\N	\N	\N	\N	0	0	1	0	sab Maribe Test	0	1	0	\N	\N	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	1	0	2025-06-09 18:49:52	2025-06-10 05:35:26	0	0	0	0	0	0	\N	\N	\N	0	0	100	20
12	1	"Lorem Ipsum" is a placeholder text commonly used in graphic design, publishing, and web development to represent content or layout without distracting designers from the visual elements of a page. It's essentially a dummy text that allows designers to mock up layouts and demonstrate fonts or typography without relying on actual, meaningful content.	"Lorem Ipsum" is a placeholder text commonly used in graphic design, publishing, and web development to represent content or layout without distracting designers from the visual elements of a page. It's essentially a dummy text that allows designers to mock up layouts and demonstrate fonts or typography without relying on actual, meaningful content.	\N	\N	\N	\N	0	0	1	0	Car Shampoo	0	1	0	\N	\N	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	1	0	2025-06-10 08:29:42	2025-06-10 08:29:42	0	0	0	0	0	0	\N	\N	\N	0	0	500	40
13	1	"Lorem Ipsum" is a placeholder text commonly used in graphic design, publishing, and web development to represent content or layout without distracting designers from the visual elements of a page. It's essentially a dummy text that allows designers to mock up layouts and demonstrate fonts or typography without relying on actual, meaningful content.	"Lorem Ipsum" is a placeholder text commonly used in graphic design, publishing, and web development to represent content or layout without distracting designers from the visual elements of a page. It's essentially a dummy text that allows designers to mock up layouts and demonstrate fonts or typography without relying on actual, meaningful content.	\N	\N	\N	\N	0	0	1	0	Sonax	0	1	0	\N	\N	1	\N	\N	\N	0	0	0	0	\N	\N	\N	\N	\N	\N	0	\N	0	0	0	0	0	0	\N	\N	0	0	0	0	0	0	1	0	2025-06-10 08:30:57	2025-06-10 08:30:57	0	0	0	0	0	0	\N	\N	\N	0	0	600	400
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
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_categories (id, name, image, created_at, updated_at) FROM stdin;
1	Shampo	684686eb84c33_1749452523.png	2025-06-09 07:02:03	2025-06-09 07:02:03
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

COPY public.product_images (id, product_id, image_name, product_attribute_id, created_at, updated_at) FROM stdin;
2	9	68472c6bdbf55_1749494891.jpeg	0	2025-06-09 18:48:12	2025-06-09 18:48:12
3	9	68472c6c1c915_1749494892.jpg	0	2025-06-09 18:48:12	2025-06-09 18:48:12
4	10	68472c75df608_1749494901.jpeg	0	2025-06-09 18:48:22	2025-06-09 18:48:22
5	10	68472c760c0db_1749494902.jpg	0	2025-06-09 18:48:22	2025-06-09 18:48:22
6	11	68472cd0da75d_1749494992.jpeg	0	2025-06-09 18:49:53	2025-06-09 18:49:53
8	12	6847ecf627ef7_1749544182.jpeg	0	2025-06-10 08:29:42	2025-06-10 08:29:42
9	13	6847ed41cc04c_1749544257.jpeg	0	2025-06-10 08:30:57	2025-06-10 08:30:57
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
-- Data for Name: recovery_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recovery_types (id, name, image, active, deleted, created_at, updated_at, background_image, slug, sort_order, price, description) FROM stdin;
2	Normal recovery van	\N	t	f	2024-05-13 00:28:17	2024-05-13 00:28:17	\N	normal-recovery-van	2	200.00	Normal recovery van
1	Flatbed recovery van	172200975666a3c89ccb663.png	t	f	2024-05-13 00:27:26	2024-07-26 16:02:36	\N	flatbed-recovery-van	2	150.00	Recommended for sports cars and luxury cars
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

COPY public.services (id, name, image, active, deleted, created_at, updated_at, background_image, slug, sort_order, category_id, price, description) FROM stdin;
3	Recovery	17150769776639ff716df33.jpg	1	0	2024-05-07 09:26:12	2024-05-07 10:16:17	17150769776639ff716e0b1_background_.jpg	recovery	3	3	100.00	\N
4	Tinting	17150769966639ff84787bd.jpg	1	0	2024-05-07 09:27:07	2024-05-07 10:16:49	\N	tinting	4	4	0.00	\N
5	Repairing	17150770286639ffa4e806a.jpg	1	0	2024-05-07 09:27:48	2024-05-07 10:17:23	\N	repairing	5	5	1099.00	\N
2	Exterior Polish & Shine	171556128866416348e1586.png	1	0	2024-05-07 09:25:30	2024-05-13 00:48:08	171556128866416348e1681_background_.png	exterior-polish-shine	2	2	490.00	\N
6	Deep Interior Cleaning	1715561351664163870ec16.png	1	0	2024-05-13 00:49:11	2024-05-13 00:49:11	1715561351664163871371f_background_.png	deep-interior-cleaning	6	2	570.00	\N
7	Cleanline Ceramic Coating	1715561399664163b756792.png	1	0	2024-05-13 00:49:59	2024-05-13 00:49:59	1715561399664163b756880_background_.png	cleanline-ceramic-coating	7	2	2855.00	\N
8	In & Out  Full Package	1715561452664163ec5815f.png	1	0	2024-05-13 00:50:52	2024-05-13 00:50:52	1715561452664163ec58247_background_.png	in-out-full-package	8	2	855.00	\N
9	Maid	\N	1	0	2024-07-02 07:34:50	2024-07-02 07:34:50	\N	maid	10	6	100.00	\N
11	Tyre Repairing	172231496666a870d68d037.jpg	1	0	2024-07-30 04:07:42	2024-07-30 04:49:26	\N	tyre-repairing	3	5	12.00	\N
1	Body Wash	1715561187664162e35369a.png	1	0	2024-05-07 09:24:19	2024-08-03 08:31:56	1715561187664162e353785_background_.png	body-wash	1	1	490.00	<p>Car wash cost in Dubai mainly depends on the car type, service providers and thoroughness you are looking for.</p>
10	Body Wash Two	172200824066a3c2b0e5bdc.png	1	0	2024-07-26 15:37:20	2024-08-03 08:32:29	172200824066a3c2b0e5ce7_background_.png	body-wash-two	1	1	150.00	<p><span style="color: #474747; font-family: 'Google Sans', Arial, sans-serif; font-size: 16px;">Car wash cost in Dubai mainly depends on the car type, service providers and thoroughness you are looking for.&nbsp;</span></p>
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, admin_commission, shipping_charge, created_at, updated_at, tax_percentage, moda_commission, inspection_charge, tinting_charge) FROM stdin;
1	0	0	\N	\N	5	0	10	10
\.


--
-- Data for Name: skin_colors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skin_colors (id, name, color, active, deleted, created_at, updated_at) FROM stdin;
1	Copper	#da8358	1	0	2024-05-07 10:46:13	2025-06-07 10:15:47
2	Graphite	#283232	1	0	2024-05-10 12:27:56	2025-06-07 10:18:13
3	Lavared	#ae1e20	1	0	2024-05-13 00:24:38	2025-06-07 10:19:30
4	Orange	#e65a19	1	0	2024-05-23 09:44:42	2025-06-07 10:20:36
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
1	Dubai	1	1	1	\N	0	2024-05-07 10:22:20	2024-05-07 10:22:20
2	Abudhabi	1	1	1	\N	0	2024-07-24 13:36:06	2024-07-24 13:36:06
3	Sharjah	1	1	1	\N	0	2024-07-24 13:36:20	2024-07-24 13:36:20
4	Umm al-Quwain	1	1	1	\N	0	2024-07-25 05:40:22	2024-07-25 05:40:22
5	Fujairah	1	1	1	\N	0	2024-07-25 05:41:28	2024-07-25 05:41:28
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
-- Data for Name: subscripton_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscripton_services (id, subscripton_id, service_id, quantity, created_at, updated_at) FROM stdin;
1	12	1	12	2025-06-03 04:45:04	2025-06-03 04:45:04
2	14	2	14	2025-06-03 04:45:04	2025-06-03 04:45:04
3	20	3	20	2025-06-03 04:45:04	2025-06-03 04:45:04
7	1	\N	\N	2025-06-03 06:22:19	2025-06-03 06:22:19
8	1	1	1	2025-06-03 06:22:19	2025-06-03 06:22:19
9	1	11	1	2025-06-03 06:22:19	2025-06-03 06:22:19
\.


--
-- Data for Name: temp_membership_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_membership_services (id, temp_membership_id, service_id, name, description, service_unique_id, image, price, slug, quantity, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: temp_memberships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_memberships (id, package_id, user_id, duration, payment_method, total_price, currency, discount, promo_code, grand_total, status, transaction_id, created_at, updated_at) FROM stdin;
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
2	\N	\N	971	70345216955	0	1	1	$2y$10$ncM7LDO0nkPhwyMw4jhinuyBW9h.0isBOl1jAdvMJfFOLjDOEI6yK	2025-06-02 09:54:14	2	\N	\N	\N	1111	1111	324344234	ss	\N	\N	\N	2025-06-02 09:54:14	2025-06-02 09:54:14
3	\N	\N	971	79345216955	0	1	1	$2y$10$nJQoXBF2Gh.HYSLMdf6rOO9syhtNo1/vINB1X.UP/vi1RvlNN3Fgu	2025-06-02 10:03:34	2	\N	\N	\N	1111	1111	324344234	ss	\N	\N	\N	2025-06-02 10:03:34	2025-06-02 10:03:34
\.


--
-- Data for Name: time_slote; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.time_slote (id, user_id, time_slote_start, time_slote_end, created_at, updated_at, time_slote_master, day) FROM stdin;
9	7	\N	\N	2024-07-25 05:09:22	2024-07-25 05:09:22	10	Sunday
10	7	\N	\N	2024-07-25 05:09:22	2024-07-25 05:09:22	11	Thursday
11	7	\N	\N	2024-07-25 05:09:22	2024-07-25 05:09:22	12	Thursday
12	7	\N	\N	2024-07-25 05:09:22	2024-07-25 05:09:22	13	Thursday
13	5	\N	\N	2024-07-25 07:51:00	2024-07-25 07:51:00	10	Sunday
14	5	\N	\N	2024-07-25 07:51:00	2024-07-25 07:51:00	13	Monday
15	5	\N	\N	2024-07-25 07:51:00	2024-07-25 07:51:00	15	Tuesday
16	5	\N	\N	2024-07-25 07:51:00	2024-07-25 07:51:00	19	Thursday
17	5	\N	\N	2024-07-25 07:51:00	2024-07-25 07:51:00	14	Thursday
18	5	\N	\N	2024-07-25 07:51:00	2024-07-25 07:51:00	15	Thursday
19	5	\N	\N	2024-07-25 07:51:00	2024-07-25 07:51:00	17	Thursday
20	5	\N	\N	2024-07-25 07:51:00	2024-07-25 07:51:00	18	Thursday
21	4	\N	\N	2024-07-25 07:51:41	2024-07-25 07:51:41	13	Thursday
22	4	\N	\N	2024-07-25 07:51:41	2024-07-25 07:51:41	14	Thursday
23	4	\N	\N	2024-07-25 07:51:41	2024-07-25 07:51:41	15	Thursday
24	4	\N	\N	2024-07-25 07:51:41	2024-07-25 07:51:41	16	Thursday
25	1	\N	\N	2025-06-05 11:37:01	2025-06-05 11:37:01	10	Sunday
26	1	\N	\N	2025-06-05 11:37:01	2025-06-05 11:37:01	19	Monday
27	1	\N	\N	2025-06-05 11:37:01	2025-06-05 11:37:01	17	Tuesday
28	1	\N	\N	2025-06-05 11:37:01	2025-06-05 11:37:01	15	Wednesday
29	1	\N	\N	2025-06-05 11:37:01	2025-06-05 11:37:01	18	Friday
30	2	\N	\N	2025-06-06 06:45:05	2025-06-06 06:45:05	10	Monday
31	2	\N	\N	2025-06-06 06:45:05	2025-06-06 06:45:05	19	Tuesday
32	2	\N	\N	2025-06-06 06:45:05	2025-06-06 06:45:05	18	Saturday
33	2	\N	\N	2025-06-06 06:45:05	2025-06-06 06:45:05	16	Wednesday
34	2	\N	\N	2025-06-06 06:45:05	2025-06-06 06:45:05	14	Friday
35	2	\N	\N	2025-06-06 06:45:05	2025-06-06 06:45:05	13	Thursday
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
-- Data for Name: tinting_brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tinting_brands (id, name, sort_order, price, image, background_image, active, deleted, created_at, updated_at, front_glass, removal_charge) FROM stdin;
2	Turbo Tint	1	110.00	1716143804664a46bcdf918.png	\N	t	f	2024-05-13 00:26:25	2024-05-19 18:36:44	0	0
3	Ceramic	0	20.00	1716194065664b0b11b37dd.jpg	1716194065664b0b11b39ae_background_.jpg	t	f	2024-05-20 08:33:04	2024-05-20 08:34:39	30	0
1	3M	0	100.00	1715344279663e1397e87cb.png	1715344279663e1397e88b1_background_.png	t	f	2024-05-10 12:31:19	2024-07-26 05:31:07	120	10
\.


--
-- Data for Name: type_of_property; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_of_property (id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_address (id, user_id, street, location, country_id, state_id, city_id, address_type, status, is_default, created_at, updated_at, land_mark, building_name, latitude, longitude, apartment, full_name, dial_code, phone, address_line_1, building) FROM stdin;
2	161	S1	address n	0	0	1	0	1	0	2025-06-03 13:45:35	2025-06-03 13:45:35	\N	\N	11	11	\N		 	 	Calicut Airport	\N
3	161	S1	address n	0	0	1	0	1	0	2025-06-03 13:48:20	2025-06-03 13:48:20	\N	\N	11	11	\N		 	 	Calicut Airport	\N
1	161	S1	saint city	0	0	1	office	1	0	2025-06-03 13:37:11	2025-06-03 13:55:04	\N	\N	11	11	\N	 	 	 	Calicut Airport	\N
16	169	test	207 Street 21, G-10/2 G 10/2 G-10, Islamabad, Pakistan	0	0	1	Home	1	1	2025-06-05 20:59:13	2025-06-05 20:59:13	\N	\N	33.67741557477722	73.00603162497282	\N		 	 	abc	\N
4	163	S1	address n	0	0	1	0	0	0	2025-06-04 07:16:38	2025-06-04 07:19:25	\N	\N	11	11	\N		 	 	Calicut Airport	\N
5	163	S1	saint city	0	0	1	office	1	0	2025-06-04 07:17:49	2025-06-04 07:20:08	\N	\N	11	11	\N	 	 	 	Calicut Airport	\N
20	173	tr	Imam Abu Hanifa Block 1, International Islamic University، H-10, Islamabad, Pakistan	0	0	1	Home	1	1	2025-06-06 23:55:28	2025-06-06 23:55:28	\N	\N	33.656717970331854	73.02400577813387	\N		 	 	test	\N
18	126	bebe	86, Vazhayila - Kallayam Rd, Rajeev Nagar, Nanma Nagar, Kudappanakkunnu, Thiruvananthapuram, Kerala 695015, India	0	0	1	Home	0	0	2025-06-06 17:34:03	2025-06-07 10:34:50	\N	\N	8.55046517049877	76.97016756981611	\N		 	 	vhhh	\N
22	174	Al Khaleeh Street	Si Beaumont Terrace, Paruthippara Ambalamukku Rd, Ambala Nagar Colony, Ambalamukku, Thiruvananthapuram, Kerala 695005, India	0	0	1	Home	1	1	2025-06-07 10:58:47	2025-06-07 10:58:47	\N	\N	8.532765770337564	76.95461432446375	\N		 	 	4Gh	\N
10	171	streert	Bahria Heights 5, Expressway, Islamabad, 46000, Pakistan	0	0	5	Home	0	0	2025-06-04 21:43:11	2025-06-04 23:19:41	\N	\N	33.51617678202875	73.11077636680301	\N		 	 	my addresss	\N
9	171	street 3456	10, Sector B DHA Phase 1, Islamabad, Pakistan	0	0	1	Office	0	0	2025-06-04 21:42:02	2025-06-04 23:19:41	\N	\N	33.54035315911292	73.09769243001938	\N	 	 	 	address	\N
11	171	stree12	Bahria Heights 5, Expressway, Islamabad, 46000, Pakistan	0	0	1	Others	0	0	2025-06-04 22:24:20	2025-06-04 23:19:41	\N	\N	33.5161768248064	73.11077634211698	\N		 	 	adress	\N
7	171	Street 1	G4C7+JCV, Phase 7 Islamabad, Pakistan	0	0	1	Home	0	0	2025-06-04 21:13:00	2025-06-04 23:19:41	\N	\N	33.52229338941163	73.11414409428835	\N		 	 	Rawalpindi Bahria	\N
6	171	S1	address n	0	0	1	0	0	0	2025-06-04 20:41:21	2025-06-04 23:19:41	\N	\N	11	11	\N		 	 	Calicut Airport	\N
17	173	abc	JX4X+542, Street 13, Friends Colony, Rawalpindi, 46000, Pakistan	0	0	1	Home	1	0	2025-06-06 09:43:58	2025-06-06 23:55:28	\N	\N	33.60512788437034	72.99775874121852	\N		 	 	test	\N
19	126	heudis	HX6J+4G8, Tharatta Rd, Enikkara, Thiruvananthapuram, Kerala 695043, India	0	0	5	Office	0	0	2025-06-06 17:39:42	2025-06-07 10:34:50	\N	\N	8.559946377291231	76.98079649358988	\N		 	 	hshs	\N
21	126	al karama street	JJX6+3X5, Kongandoor, Kerala 686564, India	0	0	1	Home	1	1	2025-06-07 10:34:50	2025-06-07 10:34:50	\N	\N	9.647515201788988	76.61190960556269	\N		 	 	TB	\N
8	171	my sreet	Bahria Heights 5, Expressway, Islamabad, 46000, Pakistan	0	0	1	Home	0	0	2025-06-04 21:29:36	2025-06-04 23:19:41	\N	\N	33.51617506256755	73.11077602839856	\N		 	 	address line	\N
12	171	street 129	Bahria Heights 5, Expressway, Islamabad, 46000, Pakistan	0	0	1	Office	0	0	2025-06-04 22:25:41	2025-06-04 23:19:41	\N	\N	33.516176823012174	73.11077634660647	\N		 	 	address	\N
13	171	street 23	G4G8+RV2, Maraqba Hall Rd, Islamabad, Pakistan	0	0	1	Office	0	0	2025-06-04 22:27:34	2025-06-04 23:19:41	\N	\N	33.52763661674084	73.11755150556564	\N		 	 	addree	\N
15	171	test 2	G4F8+C2F, St. 47, Islamabad, Pakistan	0	0	1	Office	1	0	2025-06-04 22:30:18	2025-06-04 23:19:41	\N	\N	33.52298154025793	73.1156525015831	\N		 	 	add	\N
14	171	test1	Bahria Heights 5, Expressway, Islamabad, 46000, Pakistan	0	0	1	Home	1	1	2025-06-04 22:29:58	2025-06-04 23:19:41	\N	\N	33.516176819503116	73.11077635538676	\N		 	 	test	\N
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
-- Data for Name: user_membership_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_membership_services (id, user_id, user_membership_id, service_id, name, description, price, quantity, service_unique_id, image, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_memberships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_memberships (id, name, duration, image, description, plan_id, user_id, payment_method, total_price, currency, discount, promo_code, price, payment_id, expiry_date, status, created_at, updated_at) FROM stdin;
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

COPY public.users (id, name, email, dial_code, phone, phone_verified, password, email_verified_at, role, first_name, last_name, user_image, user_phone_otp, user_device_token, user_device_type, user_access_token, firebase_user_key, remember_token, created_at, updated_at, country_id, state_id, city_id, area, active, deleted, display_name, business_name, email_verified, user_email_otp, dob, vendor, store, previllege, about_me, verified, designation_id, is_private_profile, user_name, gender, website, wallet_amount, password_reset_code, password_reset_time, password_reset_otp, privacy_id, send_notification, mute_message, commission, public_business_info, facebook_url, instagram_url, linkedin_url, is_social, twitter_url, tiktok_url, user_type_id, activity_type_id, commercial_license, commercial_reg_no, associated_license, res_dial_code, res_phone, address, business_type_id, admin_commission_perc, residence_no, nationality, rating, rated_users, banner_image, hide_profile, temp_dial_code, temp_mobile, specialization, location, latitude, longitude, unique_user_id, proof_id, years_of_experience) FROM stdin;
2	ranadxba	ranadxba@gmail.com	971	12345678900	0	$2y$10$ux9EkC6q4u36XU6jLzsr9eVF6sBWlVzwPMt.X4DNKPsBz8.1WvKuu	\N	4	\N	\N	1715077398663a01169ec1f.jpg	\N	\N	\N	\N	\N	\N	2024-05-07 10:23:18	\N	0	0	0	0	0	1	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	ranadxba	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			test	\N	\N	\N	\N	\N	\N
11	\N	\N	971	344156346	1		\N	2	\N	\N	\N	1111	\N	\N	\N	\N	\N	2024-07-19 11:54:36	2024-07-19 11:54:36	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
5	ahmad	ahmad@hotmail.com	971	123456789	0	$2y$10$jHTbzwEyEkL2caughY6OhOi2D3MX9UQgh7zjm5.EtT8I/SBpKEpBO	\N	4	\N	\N	1715345418663e180a6a14b.jpg	\N	\N	\N	\N	\N	\N	2024-05-10 12:50:18	2024-05-22 12:35:05	0	0	0	0	0	1	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	ahmad	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			test	\N	\N	\N	\N	\N	\N
3	Anil	ranadxba@hotmail.com	971	097653456342	0	$2y$10$yy1nHPYI2VIsXf4e2Em4ee.S2ZD8qtQndE/IXZxLxeCvur7DOS1Ui	\N	2	\N	\N	1715336308663df4743f518.jpg	\N	\N	\N	\N	\N	\N	2024-05-07 10:52:16	2024-05-10 10:18:28	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	Anil	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
15	\N	\N	+971	342424243	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	3091ad6dff8a267e72a33301f1f1fe6056fe2c5e86b5fed900efb506a3a4274e	-O2EA29FxgApgwmPhkF7	\N	2024-07-20 08:04:48	2024-07-20 08:04:58	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
6	Rusvin	rusvinmerak@gmail.com	971	22121212	0	$2y$10$/AncLpC7oP3.CjVbcopXHu3FXUeNeFTInMUJDopU8zu3xl8StAXsK	\N	2	\N	\N	1716183445664ae195be99a.jpg	\N	\N	\N	\N	\N	\N	2024-05-20 05:37:25	\N	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	Rusvin	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
7	rusvin	rusvink@gmail.com	971	1212122	0	$2y$10$vt72Z8G1FIHKHKIqK20fieeueleCbhO5SnaBeq9EiWeR4aeHNyule	\N	4	\N	\N	1716381400664de6d89affc.jpg	\N	\N	\N	\N	\N	\N	2024-05-22 12:36:40	2024-07-25 05:06:08	0	0	0	0	0	1	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	rusvin	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
17	\N	\N	+971	576567576567	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	6a7b6cbd772de72da764c194e5482421b5a16ceb77f1c704669476875d0ee38f	-O2QPU5_zLfwpK-yPiOR	\N	2024-07-22 17:07:43	2024-07-22 17:07:51	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
21	\N	\N	+971	213231313131	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	089bce99b961e8b4f9c2a4241f0e20447e5081278e068d4d7b5176ea36977f29	-O2QS7MEENc-J_kQxexb	\N	2024-07-22 17:19:17	2024-07-22 17:19:25	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
8	\N	\N	971	7034526959	1		\N	2	\N	\N	\N	1111	11111111	\N	430b69481bd1c6d5bb17ca68f3591abc0e0e386484beae7665cb7e00942473a7	-O289imwci0hFkEDC6y5	\N	2024-07-19 04:05:39	2024-07-19 04:05:52	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
9	Aamir .	\N	971	7034526955	1		\N	2	Aamir	.	/uploads/company/669a06ff6e74a_1721370367.png	1111	\N	\N	c123d253df58c033a6bd30905a28098c1e49b039565171f29f16e1114a14bb7c	-O28eLLl5TmtY9Lzk2hU	\N	2024-07-19 06:23:39	2025-06-02 09:51:44	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
12	\N	\N	+971	23442424423	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	\N	\N	\N	2024-07-20 07:42:18	2024-07-20 07:42:18	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
13	\N	\N	+971	2342424224	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	\N	\N	\N	2024-07-20 07:43:25	2024-07-20 07:43:25	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
18	\N	\N	+971	263784623876	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	fe3e8afde1be969b4f58b4a7768fdf3e34274d11f0e2d108861287b266e6cce8	-O2QQmwKJO0z5kCKIhhk	\N	2024-07-22 17:13:20	2024-07-22 17:13:35	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
16	\N	\N	+971	3336876776	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	e8959478bf61d4c2de00298efdd83ef567b5aeaedd123255a58ead87fe6a1538	-O2QJzTC1eC3dMAR7wPx	\N	2024-07-22 16:43:43	2024-07-22 16:43:51	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
1	Admin	admin@admin.com	971	112233445566778899	0	$2y$12$VIFvxNV7OqCeQW38AnGtHOOAIjuhBhaqGStR3I/fgB4S2QLEBVRXS	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
14	\N	\N	+971	313131231312	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	\N	\N	\N	2024-07-20 07:56:38	2024-07-20 07:56:38	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
20	\N	\N	+971	231313134	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	77358f7cba1eccb23ab7fcecbc117befd9c91f859bf712561880076135f2a2c4	-O2QRbeZM85SGDEW6mc_	\N	2024-07-22 17:17:05	2024-07-22 17:17:11	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
19	\N	\N	+971	637126316	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	45aac6982ab109dff3a7b7b2196f85d9e372bf4dfbdd4adc276ae832998f35d4	-O2QRHi1ooP7fbtrGrWv	\N	2024-07-22 17:15:39	2024-07-22 17:15:45	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
22	\N	\N	+971	321131333132	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	b0f705138c71ddf23ee476e84fb99292cfecea675b8af169f028f6046c2adef5	-O2QSNvqvoFvbC6127GC	\N	2024-07-22 17:20:26	2024-07-22 17:20:33	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
23	\N	\N	+971	23123123133	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	397b83b320dc309e0d08426b951c20d5b1f1fd1be86f22ca72561f8484828b98	-O2QT28x28sBjZ8gMbG4	\N	2024-07-22 17:23:16	2024-07-22 17:23:26	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
24	\N	\N	+971	3213131354	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	324138a1b4fccb5e3b0cfb42e643dd6daa2f3bf8191814862a4e87c0584adb03	-O2QTWL8ZmyWtHUrUSCQ	\N	2024-07-22 17:25:21	2024-07-22 17:25:29	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
10	Alex dev	\N	971	3441560319	1		\N	2	Alex	dev	/uploads/company/66a7b7db1b998_1722267611.jpg	1111	cR3F8UUPTxa-oAYwZdmxIB:APA91bFSuAyzrk8XxyzdUYEKUOr5U56wM1gXZWbHqElhWm9nPOKsnl0PWy67L26ecRBGEy4eZa_V4sKTQ_fej4gPf3DbxVi91QHwPT2JrR7h5SZ1CoIK9CoLKAll2mb40J6q9V1Sr58y	\N	193eb4afdc6fcbd9761029fdf66bba1b3d780eb7baafe9ac0dee9ae958a736ac	-O2B_U4uboAQy3MedvA_	\N	2024-07-19 07:11:48	2024-08-01 11:20:22	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
25	\N	\N	+971	3123131313	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	a47f7c7598396cb06b4d4221e79c17c132b671f494002fedfdb781e699663eb9	-O2QU7TIzsLODtTX-kfK	\N	2024-07-22 17:28:01	2024-07-22 17:28:09	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
34	\N	\N	+971	6868768778	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	6561ce9f4b4bec73906a658670fb56540fc7b518f160cec9cef71e0af5c163a6	-O2Qtl8ObZrhPNzT7bD6	\N	2024-07-22 19:24:19	2024-07-22 19:24:32	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
26	\N	\N	+971	312312313	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	5d43cada573f476ad17aec18a0dd35cf788f5c45334d1936c583a647e470b08f	-O2QYvOjbV2j1L_-VkvT	\N	2024-07-22 17:48:11	2024-07-22 17:49:07	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
27	\N	\N	+971	5765675765	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	0e7935b8783f693f60a30e9441c889f701635874281ec2b8f6cce9d4379a13d1	-O2QdX9VdYVgIllOGk_6	\N	2024-07-22 18:13:29	2024-07-22 18:13:36	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
28	\N	\N	+971	6876876798	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	\N	\N	\N	2024-07-22 18:44:56	2024-07-22 18:44:56	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
29	\N	\N	+971	6876876799	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	c25ee443467ac83fd772984bd12451d28ebafbd186d45a1039e02c9f873d78a8	-O2Qkk_PLkteQAKMO1AH	\N	2024-07-22 18:45:04	2024-07-22 18:45:10	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
35	\N	\N	+971	686786879	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	38e9e8a4abaa9e2d1a0d45a619dd34b4767bd0dc2dc8e156a88295014cea072e	-O2Qu24tFGYvUAGZSJ5H	\N	2024-07-22 19:25:39	2024-07-22 19:25:45	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
30	\N	\N	+971	321313131	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	0d3e6e866a371ea3e680c18da586cdf744d0a87216ccabcdf4b45d70097b388a	-O2Qo2jwOdrCZ2K4M3oP	\N	2024-07-22 18:59:29	2024-07-22 18:59:35	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
31	\N	\N	+971	668686867	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	c80f84b15aa60501849d0fca3fdd860f8ea53ad3d0637f49df9645748563da3c	-O2QoQQkYXZ9szSYWzHS	\N	2024-07-22 19:01:08	2024-07-22 19:01:12	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
39	\N	\N	+971	6876472837	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	1b5d1d2bf7ddeacb17fa9bd7dfbd5ff45f4b6c491e414cd4f6bae477703bed4e	-O2R08EhSAeFoqqrDzBF	\N	2024-07-22 19:56:39	2024-07-22 19:56:46	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
32	\N	\N	+971	687687687	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	02b32f190b888f69d456e0d355f9a0f08e9c1f02ff0c58816cc2abea6156a402	-O2Qp79cX2D5rFy6m3pT	\N	2024-07-22 19:04:09	2024-07-22 19:04:15	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
36	\N	\N	+971	8767867868	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	a879b1e6ad10107ba28d239a60519786919159526af5f0d73f13b3b2d0e06232	-O2QuySH-i19-v6Dn-58	\N	2024-07-22 19:29:38	2024-07-22 19:29:48	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
33	\N	\N	+971	323133131	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	f0e406ebb13f479205d541099bb2537c463ef662d6f2758d0f3296e1a2addcc9	-O2QrT-knhlISrQ7x3UW	\N	2024-07-22 19:14:19	2024-07-22 19:14:29	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
42	\N	\N	+971	767867868	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	71d4ac7ed816fb2fdfd5b69b708ca028ea56113405e9acfa80fe0bf12d89c310	-O2R4FdCyIOxpJJ7Ithb	\N	2024-07-22 20:14:38	2024-07-22 20:14:44	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
37	\N	\N	+971	6876767889	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	2cc27698f93397915997eefc6dd3ca02ff5bf7d65ea017022c59d1ec96bd6132	-O2Qwf9oD_v9LR5T2tzR	\N	2024-07-22 19:37:05	2024-07-22 19:37:14	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
40	\N	\N	+971	6767866687	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	6e4c220b5211b3869538f53e27ffeb44200c69b8180a22fb7f95a242ec0a35df	-O2R24pn1kTk8ThU2C7d	\N	2024-07-22 20:05:09	2024-07-22 20:05:16	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
38	\N	\N	+971	6876786868	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	b8ed7e1a391daa3e9f6e674ef5accca29f13fdd791e15c91346e6f059d994795	-O2QxpjHeLtuJ-ejJLOY	\N	2024-07-22 19:42:13	2024-07-22 19:42:19	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
41	\N	\N	+971	7687676876	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	32d2ceb18230ff049a58c1d0de46dc17c3f08cc7f79b48ad463990ba2d49209b	-O2R3d3EA7fZI4DTWHvH	\N	2024-07-22 20:11:56	2024-07-22 20:12:02	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
43	\N	\N	+971	5757675678	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	8b0f61e1a2420869cd003cab4f0008063662151b0499dc19913e9181e321f105	-O2R6EajCo4vShsU-gRt	\N	2024-07-22 20:23:18	2024-07-22 20:23:24	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
44	\N	\N	+971	6678676876	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	5aa86d6ea9ef9481c53e4579cbe3e09b4256f35d6d1da69a77618f02ec6997e8	-O2RCLVhvlaWEngex0qX	\N	2024-07-22 20:49:58	2024-07-22 20:50:06	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
45	\N	\N	+971	6876786786	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	\N	\N	\N	2024-07-22 20:51:18	2024-07-22 20:51:18	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
46	\N	\N	+971	687678678	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	e11dd710a967ac380008ad3e4f31e5534f31d939346b0f0bc8aeaa7ad6d17351	-O2RCfgF0_uJUYZWgPOv	\N	2024-07-22 20:51:27	2024-07-22 20:51:32	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
47	\N	\N	+971	765755657	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	10d1f26419a500ff1d68eb6db441c0ca4d546826aee39c61428332d45ab8b3ad	-O2RDkET1Fqte7f2-0IC	\N	2024-07-22 20:56:07	2024-07-22 20:56:13	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
48	\N	\N	+971	57657657576	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	1c445bf239470e4fc6a04fb20bc57352e859a3a25ff40f8ed99767ff410ca2c0	-O2RE59-iE-jJQdValX5	\N	2024-07-22 20:57:37	2024-07-22 20:57:43	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
49	\N	\N	+971	576576575	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	a4742953a2ab9606713f2215f85fd1e41bff1d308973802414c49d02e500af3b	-O2RFBozIMdI2-lg9hRu	\N	2024-07-22 21:02:21	2024-07-22 21:02:32	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
50	\N	\N	+971	576567576	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	37e4d0bcdeaa19c666687933bee7bcc8486f7deae8180e42cdbfe10439eba8bd	-O2RFoQSIVqun8jli0I-	\N	2024-07-22 21:05:09	2024-07-22 21:05:15	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
57	\N	\N	+971	848166884816	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	da3846e4d597ac44a5b4ccfd5bbff965780a4be240638fe0595d09537df07e0d	-O2RLTLYONmvyqZMX5nn	\N	2024-07-22 21:29:50	2024-07-22 21:29:57	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
51	\N	\N	+971	5675765756	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	976188b3d098894fd0ec9ed5c55c911d296c4db848913a15172bcd76808f47d1	-O2RGPuJCJWaK-6NGzp4	\N	2024-07-22 21:07:44	2024-07-22 21:07:52	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
52	\N	\N	+971	5757557678	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	6a5f0e1f43c86a6f858dc0b0c88a475d44f07044a07c9b2f85aeb4830c10d59a	-O2RGkFw49f-SC6ZCmhy	\N	2024-07-22 21:09:14	2024-07-22 21:09:20	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
53	\N	\N	+971	676876679	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	2018eff67e0a38704f27207ae3c8c2c022c850f695aa3b6db2badc2d048be5ba	-O2RHxyk5ZRl5t_4BVhF	\N	2024-07-22 21:14:33	2024-07-22 21:14:38	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
58	\N	\N	+971	8481818484	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	f37f0755ee6a2aa830fc295afde46b1fe828ce6242848afa553d2aec8891b300	-O2RMOvkiQW2FLty9q90	\N	2024-07-22 21:33:56	2024-07-22 21:34:01	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
54	\N	\N	+971	575765756	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	18c9f71754625b8dab2a6761c16d967fdb922a6400c5f55492a6b9379d31e426	-O2RID0zWVkuYw98Bs2J	\N	2024-07-22 21:15:39	2024-07-22 21:15:44	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
55	\N	\N	+971	686876867	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	27fe24e460a019ff4eac6d30bb8a862f0c94b158301962f9eab8d8d702be34e4	-O2RIOqBFWmnP3P2sO_o	\N	2024-07-22 21:16:28	2024-07-22 21:16:32	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
62	\N	\N	+971	5448448151	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	a84f629daa04f123b1ee09da99c5ff9cdfaa5cf23e74c1b4e0009f50f3cd9f08	-O2ROxqkQeFE8wvQbC9b	\N	2024-07-22 21:45:08	2024-07-22 21:45:12	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
56	\N	\N	+971	7687688789	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	b0bfe04645dd591cdd1173cac7669eff221576d757f5a62187fb69b540f5694c	-O2RIjcxJwAD3U4tRXEO	\N	2024-07-22 21:17:56	2024-07-22 21:18:01	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
59	\N	\N	+971	5451551818	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	e51f8a0d267bcba5d6305e730a5159d60fb895721cdcea8067257fb5e08a5a46	-O2RMtxtCk8hRMt3ifIO	\N	2024-07-22 21:36:08	2024-07-22 21:36:12	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
60	\N	\N	+971	5225888688	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	7430cecd280b94e3d26ffcdcb44ec927f4f8f444541ce0c5d47e5c9d5d9461c7	-O2RNSu8eNdmsotNt3Ni	\N	2024-07-22 21:38:35	2024-07-22 21:38:39	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
61	\N	\N	+971	5555888412	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	ac743dbc48f98468ffae9d8374c067efe979f9f21e7e3b129462654a8f207961	-O2ROZN1QxsbQmvJ-mtE	\N	2024-07-22 21:43:23	2024-07-22 21:43:28	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
63	\N	\N	+971	5522885225	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	e01390da5f66f3071653066f6a088a661da84b5488f549f82f0b607676d39c47	-O2RPKrgbibedMpVL0rT	\N	2024-07-22 21:46:47	2024-07-22 21:46:51	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
65	\N	\N	+971	4881010413	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	c49ea9b881d60450a164f62f5284b75921998d22903404e9ff3f02f3b650eb84	-O2RXMKZDFraXWXiZSfc	\N	2024-07-22 22:21:50	2024-07-22 22:21:54	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
64	\N	\N	+971	5555588155	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	b8a732696f3bf3eecfb07539175684ce0a05da5479775c6a23bcd2257e4bf154	-O2RPpzDiwWvv5hWAxsK	\N	2024-07-22 21:48:57	2024-07-22 21:49:02	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
66	\N	\N	+971	564005096	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	896d3577f88289cbdd5aeb60d4b02f663c65cd779497cb646aab11ce54426d48	-O2UfcJKIu6TUB4CEVQR	\N	2024-07-23 13:01:08	2024-07-23 13:01:15	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
67	\N	\N	+971	5765765765	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	75789800b21033d2bef7686293085e79e5d13c625b9b4a79a38abcae36d2db8f	-O2W35keRi3V-jJA3XTw	\N	2024-07-23 19:27:41	2024-07-23 19:27:48	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
68	\N	\N	+971	67667786687	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	b3ce4a15045d0065d7d24ba2716abe224b7c8cba034737abd6a5556f6331ea4a	-O2WAO4WBVkyotgdVN8r	\N	2024-07-23 19:59:31	2024-07-23 19:59:38	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
69	\N	\N	+971	775757657656	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	352537a718b77cbe9a7a4f9ce58582220d978f51faa00175c55ba456733e10f5	-O2WAkWIWGDq0DY1tSxQ	\N	2024-07-23 20:01:05	2024-07-23 20:01:14	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
70	\N	\N	+971	5675675765	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	0b5a3929bdb92602cac28f0a7b77ca51fcafd4ae274a41ac0ebf5c077be36008	-O2WBk59l0Btb4FYHzS1	\N	2024-07-23 20:05:29	2024-07-23 20:05:34	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
71	\N	\N	+971	767687686	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	4634d9aa5c5f58890e298f1af82ffa82fbf185e8032e597f92623327fdc09f75	-O2WCaPz-3kS6tpBbYxt	\N	2024-07-23 20:09:07	2024-07-23 20:09:17	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
72	\N	\N	+971	8768767866	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	fed3077d55262de4f0fa766c295d41fdc4579c7febd02419d1d549bab2e0b664	-O2WCthqqfVcXF2imHjR	\N	2024-07-23 20:10:31	2024-07-23 20:10:36	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
73	\N	\N	+971	686868968	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	01d1a93c23a9480d660d60655864d536f04d150737d5fe4ebb73947d23e76d11	-O2WDMAgHNbqEo--cI7W	\N	2024-07-23 20:12:30	2024-07-23 20:12:37	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
89	\N	\N	+971	282828282828	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	54d67a9bbfd6d7483537a9b4b3b0267256ac530f861a720b87e97df873d138e2	-O2ZTLCHvbDgnR3NQ98_	\N	2024-07-24 11:21:12	2024-07-24 11:21:19	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
74	\N	\N	+971	6575765698	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	40b56f803836c4725f7125f1b8c13ce789f1cae654e1c155a3bc0ac90da63986	-O2WDkl9E9vH0M8hT0mA	\N	2024-07-23 20:14:15	2024-07-23 20:14:21	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
79	\N	\N	+971	112345678765	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	7c429d01931c39a55b504610b6abc0ef2af95ed1b4691563c9e552462b2e6dc4	-O2YpQI_ZE3U6roW138J	\N	2024-07-24 08:22:22	2024-07-24 08:22:32	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
75	\N	\N	+92	3027655876	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	f7eb8808e59dc3806887c9fb815467ed8e7aa0bbbac23c46788b2cfb0ac3a8e1	-O2YIPIeH_XPz-0iO7xQ	\N	2024-07-24 05:53:43	2024-07-24 05:53:55	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
76	\N	\N	+971	123456787654	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	c5f2f97e971400ce86e400cccb0d4c2e75224bb087790cf08a465ff25ea037af	-O2YW_bQYb0TGwuOFIrg	\N	2024-07-24 06:55:35	2024-07-24 06:55:51	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
83	\N	\N	+971	550228282828	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	e7886befa3f846f566bbffdeb8fbf32a4b7707682ca940b65de75dc6e6f15037	-O2Z5pEMKPH1EtQhEbJF	\N	2024-07-24 09:38:27	2024-07-24 09:38:34	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
77	\N	\N	+971	555888188	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	80758042fcff8c7c86de3bc949c3178c026d938a189840b9dbde2d7344d2f9dd	-O2YY4MSPNaU32SVS_dm	\N	2024-07-24 07:02:18	2024-07-24 07:02:23	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
80	\N	\N	+971	12345678765	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	a18fcd7677da4249157607a34107283f890b303a66620ecfff288246fea06928	-O2YqExubPaSepHdjZyW	\N	2024-07-24 08:26:01	2024-07-24 08:26:07	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
78	\N	\N	+971	5588809636	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	2dc3c8f29bcf93a3cf24c068c548d6226dfaa1699b2fbd8333d4e3a9a69856b5	-O2Yd0Kc6fWgwO-8fzgR	\N	2024-07-24 07:28:14	2024-07-24 07:28:19	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
81	\N	\N	+971	222558558558	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	c6ba4efb8b1922e94ee48144973e721a62595f8c842b6e04de43cd1ff35e8d62	-O2YubmBi7-K3eWWhSvn	\N	2024-07-24 08:45:06	2024-07-24 08:45:13	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
84	\N	\N	+971	225558852585	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	3660e9485bb04720d80a74e0b36fff8b92a642d265af929d4bb3f275f5d9662f	-O2Z788V2PaYsCrx2WDD	\N	2024-07-24 09:44:10	2024-07-24 09:44:18	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
82	\N	\N	+971	222525528525	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	71061241928f16b5a9430641b8313d3c97b2eaacc20c9c3b8a4b98242bd20466	-O2YzK8VHkMtn-vN1hGs	\N	2024-07-24 09:05:39	2024-07-24 09:05:48	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
86	\N	\N	+971	112555588555	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	6aa6c35d909c38bf16cac6f65ba4c95cb9ebf1c2f2e42af0ed504d75afd46c95	-O2ZR5KGZwj6ESUOglab	\N	2024-07-24 11:11:23	2024-07-24 11:11:29	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
88	\N	\N	+971	050502828282	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	f33e2df00fadbeca4f83226969cccf1b5d490fd87e08d6a6208fe9cbbf1ee4ea	-O2ZRzzQ2TPoZ-jfNZsd	\N	2024-07-24 11:15:19	2024-07-24 11:15:25	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
85	\N	\N	92	3027655876	1		\N	2	\N	\N	\N	1111	dk_9enQZwk_auTwftw-SvL:APA91bGn63wvK9YOaFp3xJKrrwZEQTGVSWOPMilrCVhKJ3dvn_aMOenydmAyi_2WdvhZ18IN9MRSfDpOOHEDmVpEQfEWwfn02aa1M0rNlqU26sNNhSbNWv-hXH97q1HruV488qAtDXXw	\N	f6b9c62e20e1efc8d240c9be1c4beabfe9998b313f71b3eae922b05e60687585	-O2ZBTUmNgAzq4wY8vnD	\N	2024-07-24 09:49:29	2024-08-01 09:23:06	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
87	\N	\N	+971	282838383028	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	78ce64f65403fa88a16dd249b2e0b9b22655a0de4c41ccd69b8acc8653d8a94c	-O2ZRb2sedjDctv7UQCL	\N	2024-07-24 11:13:37	2024-07-24 11:13:43	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
90	\N	\N	+971	28282828282	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	21076d580806e510840c5b84778aa9be9404aabc4f96cc9bbdba8bac3c9ce187	-O2ZTgKJ6MAkHu5Cu7ge	\N	2024-07-24 11:22:43	2024-07-24 11:22:49	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
91	\N	\N	+971	282828383828	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	469425350eb8c5a199398453bf3d86329a0a8218d1453f55d4a53da5a7948eb1	-O2ZUAFVec0opgazqPjg	\N	2024-07-24 11:24:50	2024-07-24 11:24:56	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
92	\N	\N	+971	282828282882	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	ab24d30f7678f57df9877ea83f813b25599756ffc5659e5da98f71d5ff9afd06	-O2ZUQm-rw_FWz3PdzBo	\N	2024-07-24 11:25:58	2024-07-24 11:26:04	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
93	\N	\N	+971	282817282828	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	c5c10d44ff6ce25123266eb2cd8c8e8234c35e952c886f6cc4e8dea394b0eddb	-O2ZUk34iRYlLc2uv6c9	\N	2024-07-24 11:27:21	2024-07-24 11:27:27	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
101	\N	\N	+971	285805050550	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	84b55299275393616a14fb02dcb1ce00396841cf6e497775c5630107471cff2a	-O2ZeWdGl9yOU4T4Gka5	\N	2024-07-24 12:14:25	2024-07-24 12:14:31	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
94	\N	\N	+971	686056038283	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	4025c5d3a7267f438abf50e1c82fc4de20efb6feb89553ef04eed6e10b5331af	-O2ZVHLxp83LQjhvblit	\N	2024-07-24 11:29:42	2024-07-24 11:29:47	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
95	\N	\N	+971	828271783838	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	2d75391ddd2b6f4c485e0c5e8936f89f8e83f26a9b3966048fe105a3f09d46f7	-O2ZVazRf6mAcb6I6FdE	\N	2024-07-24 11:31:07	2024-07-24 11:31:12	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
96	\N	\N	+971	693828278393	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	679591be1d51128cbba313febe7422d707b3d2b5bb5a190a35ac7dbfd824c62c	-O2ZWlfEFFyR6C4QI5td	\N	2024-07-24 11:36:12	2024-07-24 11:36:17	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
97	\N	\N	+971	338382828382	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	a6e84f1eec8239268ea4968310b9da1b43106c723e573f683ff5033a493b1a48	-O2ZXdLfyaQT5HuX1hdl	\N	2024-07-24 11:39:59	2024-07-24 11:40:06	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
102	\N	\N	+971	356865346565	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	b74f504f6a63d2ee98a86882ac07574fce7d8d08859747e64da1747a8f41c538	-O2ZlIkug3ilbZtJASc2	\N	2024-07-24 12:43:38	2024-07-24 12:44:09	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
98	\N	\N	+971	282882282828	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	302db1a0fb361faf70abbc486a58d7947fa66afc7b0c17a9c2d41047095bea13	-O2ZZoEVNcLNN7JVAwyM	\N	2024-07-24 11:49:27	2024-07-24 11:49:34	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
99	\N	\N	+971	393858233850	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	ced080ed729057accfce019565965efb37c41d124c622f4df15386388cae6e80	-O2Z_CfOPR5q1ZYRrqw3	\N	2024-07-24 11:51:14	2024-07-24 11:51:19	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
106	\N	\N	+971	9868586868	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	b745b3d1b180582021a590f6018b240832050953bb66e7e672bba1684c5195d5	-O2ZsskUYkVeCy47ZHEv	\N	2024-07-24 13:17:09	2024-07-24 13:17:16	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
100	\N	\N	+971	855822945885	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	56569f701c7225d8f5c027cdbd2aa41a26d1086dc0defb2af1cd496476595eff	-O2Z_VEV7VTxKzbhRpJI	\N	2024-07-24 11:52:28	2024-07-24 11:52:35	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
103	\N	\N	+971	686772686883	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	f6cc18109e04fb9ae42ae862aa9b3d2b59e4b316169510f565b755b37fdab92f	-O2ZmZ1jHJdPacdaccyF	\N	2024-07-24 12:49:32	2024-07-24 12:49:38	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
104	\N	\N	+971	866858286868	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	8982a1d317607579b825c6a9060ef9ba7de7c4df4663904c9c2e24f8889d7553	-O2Zrw4_wKY5PIJFR5Mf	\N	2024-07-24 13:12:56	2024-07-24 13:13:07	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
107	\N	\N	+971	686864656868	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	1c5cf2c0b26c4f7779f2e65a7cebfe74d0f4a535ae1dddd779e3e8c61e53cbdd	-O2ZtxKD6YTfCIsHITxc	\N	2024-07-24 13:21:51	2024-07-24 13:21:57	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
105	\N	\N	+971	5858585858	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	01c56db932ff1036bd346e85ae6d0ba16e6cb7a1204f0232aae161743a0ab862	-O2ZsPHVS-IYb7LI9VMo	\N	2024-07-24 13:15:06	2024-07-24 13:15:11	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
109	\N	\N	+971	5856335855	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	062258a4586138e602bc5cdd4f1ac6390d9d7a5b08e11f2f8885e5a61b5c0d26	-O2ZxFQY6rQd70Ahb1D_	\N	2024-07-24 13:36:15	2024-07-24 13:36:21	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
108	\N	\N	+971	545484578454	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	1dd60c52b16ef2e211cdea33852fa5bfff1a6de731d5acefc0d3d153e4acb9be	-O2ZuUy4lPRt_PhGTnea	\N	2024-07-24 13:24:11	2024-07-24 13:24:19	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
110	\N	\N	+971	585758605058	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	5c5cda296c1a482cb610388a5698fb4331deb6d61717ca384187d295f3fee677	-O2ZygQDLDM5BOMcb92x	\N	2024-07-24 13:42:32	2024-07-24 13:42:38	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
112	\N	\N	971	5451154854	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	053d0d25a639e060c5eb80ff6d10807b389fb96aae41d7c1e97c1eda3ed9e04d	-O2_PWnxxf4hKBFi5GrE	\N	2024-07-24 15:44:10	2024-07-24 15:44:15	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
111	\N	\N	971	515148484	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	ed07e459f2d3a1538469b8f4e3c578cb01d05573a66d6b946c87396ab59f90c5	-O2_P4ZIiHIXh3vGFnFD	\N	2024-07-24 15:42:14	2024-07-24 15:42:19	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
113	\N	\N	971	5411548484	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	3cf391174fea6bacae5db9e453f6dc2955b868725abb05f2efd2915e7198d598	-O2_QEzcpAogsPfrFut5	\N	2024-07-24 15:47:19	2024-07-24 15:47:24	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
114	\N	\N	971	568568006	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	086b68674e2742cc0ade22295c39995db9b61d02f49076ab465898f27ae28d70	-O2_QgkA8AaGp9F-EtEa	\N	2024-07-24 15:49:17	2024-07-24 15:49:22	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
115	\N	\N	+971	6876876889	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	d2b216ad73f7c4a02e2f32b569648d0455df4cd9c0fb35defb79cea29eac92be	-O2_mTDD708U2-Y1EZcW	\N	2024-07-24 17:28:45	2024-07-24 17:28:51	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
116	\N	\N	971	8888666852	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	4b6c0ea74945d6071b7adcb8e16d2ced0d2c426aeac76cd430280d1243703428	-O2_oNm-7PMMrngr9eDV	\N	2024-07-24 17:37:07	2024-07-24 17:37:13	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
125	Nasrullah Khan	\N	971	987987977	1		\N	2	Nasrullah	Khan	\N	1111	abdhjef ekef kjwf wedfw	\N	238f9be98338883688eb0a70b6e60ef4582a770edb5c65381f01ccad165d0b1b	-O2eVhkp5ePC10ySH4Cp	\N	2024-07-25 15:29:18	2024-07-26 21:27:25	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
117	\N	\N	971	123456787654	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	7084a36dc507192ddaacf3bac2f0f0ed140cec73e3f8b0055061d296155a4b8b	-O2cK7qQ1qJ-Vgpp97Z9	\N	2024-07-25 05:19:24	2024-07-25 05:19:33	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
122	\N	\N	+971	56400505555	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	01cbc09995dddeb9608ad284c96889ebe5d6b7079d5a756eef70142a505ea702	-O2dnj6JHSVYos7fPQXq	\N	2024-07-25 12:12:42	2024-07-25 12:12:52	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
123	\N	\N	+971	8455484655	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	4d48c1cc2fa8f46a95cd8028382b53d702fc92438c20903a65ce4653eaca1328	-O2e0WGahDE0V6iyQ6D3	\N	2024-07-25 13:12:59	2024-07-25 13:13:05	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
119	\N	\N	92	3095565455	1		\N	2	\N	\N	\N	1111	11111111	\N	0a0527129cb9b67f20fcf71b40191d0993d9302cd271b196d336fa3bc1c8ca55	-O2cu3RS5GiyW-dSxmpx	\N	2024-07-25 08:00:34	2024-07-25 08:00:55	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
120	\N	\N	+971	5552860966	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	7bcca7ef0bb564682b99cc1a44546934e18a0dfa97272452a1570648f902391c	-O2dMAhn-W-KRIH5E1hx	\N	2024-07-25 10:08:00	2024-07-25 10:08:07	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
130	\N	\N	971	4121441421	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	486f3a8ce2801bb50bab7262fbbfb26b50c3dccb5818d158d9c5d7cf3315241c	-O2xqwlMNXE-1opKnF-L	\N	2024-07-29 09:39:10	2024-07-29 09:39:18	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
118	\N	\N	92	3315489762	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	0b3bebbfd519835905d99c700607b16677e039cf6e68d4b2710a6ebf09666652	-O2ciPilCi21SsMq_A_-	\N	2024-07-25 07:09:50	2024-07-25 14:51:27	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
124	\N	\N	+971	554846486	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	3a9f3c7c3b02c5cb3a752f71118644f1b634fc3e5105434e547dffaf92fe317a	-O2e5vSeBkU2-fPAH6IL	\N	2024-07-25 13:36:39	2024-07-25 13:36:43	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
128	\N	\N	971	51518188181	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	742cb68d0e3eb38bfa59be0416eaef9dcbcb21b681d34e3ad828b136a5d0f603	-O2l8blGN44fj8HytxXO	\N	2024-07-26 22:25:45	2024-07-26 22:25:49	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
129	\N	\N	971	3441562554	1		\N	2	\N	\N	\N	1111	\N	\N	f0151e2bbb12b8d3048addb4e74ee9d71e26fa57aee5eb560852391a6f28c2e4	-O2xYkL62CKFVEhjOlmw	\N	2024-07-29 08:15:21	2024-08-03 06:01:52	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
127	Rusvin K	\N	91	7034526952	1		\N	2	Rusvin	K	\N	1111	11111111	\N	61f604a7970fbb958f53ee6ede6aa52ebf6316fd72df88cdb362514f99f11cb1	-O2j_cH7lcyuWGCroq7d	\N	2024-07-26 15:08:35	2024-08-03 09:38:33	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
131	Hamid Raza	\N	92	3441562554	1		\N	2	Hamid	Raza	\N	1111	fBsGF9znTiyhceUFRHspFK:APA91bEoPZsLZ07Puv2fO3gWLS31IYXeIsNn2jvOrNCbAxuXY8Sl3tHtyLNgeKb9EHHvdqHdKlM8LpYPwxIgidbVrfA_C0iPqijp5pPkdlKBaNfjgVrClxsJ5GFhXSQ3PXh6cEY8o9CK	\N	cf9a85260906e3b50760b8954c903db7d71f16dd625b91c53d388b0c21c0cc21	-O2xxAzILmCXh86Noll6	\N	2024-07-29 10:06:08	2024-08-03 06:16:40	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
133	\N	\N	971	555565352	1		\N	2	\N	\N	\N	1111	dWRa-UNrlEKkiMhCGt5F_n:APA91bEKbExc-7R2roGyDm9X_5AwKLBAnUTgLGxVkO7hcrTsgGbJkPyYsPvgU0dvwO4lXscMruv4-peP3J445TI0VdObodc6DAa4-F0ZREyZtcaK0Mosj59jidOIx5b9XbGPkYyyhXzf	\N	1a813492af4eca811bf5eb05c250f0979050ea850b68a9f9588bc6d227edf9af	-O3-57qXBG4-XyHwAz7M	\N	2024-07-29 20:04:46	2024-07-29 20:04:54	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
132	\N	\N	971	1241411515	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	875ef5aa42e365eabc5a46203caa10567bdda2cf03cffcf4ad1c29d7a3c76a57	-O2zD_IaiVJB5mLpFOhB	\N	2024-07-29 16:02:05	2024-07-29 16:02:11	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
164	\N	\N	971	123123123	1	1234	\N	2	\N	\N	\N	1111		\N	c82d14981c461479417804b3701e285e3ab887aacd00bb498828e34d958a9cc3	-ORtlsiWAixOgAK24ZDX	\N	2025-06-04 07:09:05	2025-06-07 10:54:05	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
126	anil navis	\N	971	564005096	1		\N	2	anil	navis	\N	1111		\N	1338dafdfb479b7b4c0f8b110197137aacff6143f259b946c62dea48a030b4c1	-O2gorujNWnJtUePHaGI	\N	2024-07-26 02:16:35	2025-06-07 10:52:30	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
165	sabeeh hashmi	sabeeh1@gmail.com	971	123123124	1	1234	\N	2	sabeeh	hashmi	\N	1111	11111111	\N	6d49f090d1014ff48a3124c2843e8aab10b05476defc4bb3cc68f878cdee06f7	-ORtt8Ijm6msK2mxrBC0	\N	2025-06-04 07:42:44	2025-06-05 07:33:42	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
121	rusvin	rusvinaroor@gmail.com	971	8866115093	0	$2y$10$6crwJpHpvDO1/y8ldVYjyOXJH/7En55GJfJor.D7k5pNv/X38k92y	\N	4	\N	\N	172190836566a23c8dc0609.png	\N	23wwewew	\N	d61b43b4eaa616112e271fa0ff2f05a12a82cb1706452c01a808adc97b272ffc	-O2djBai0kXDrnvs9qI7	\N	2024-07-25 11:52:45	2024-08-01 09:59:19	0	0	0	0	0	1	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	rusvin	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
142	\N	\N	971	3095565454	1		\N	2	\N	\N	\N	1111	dolB8jSOQQuyYvU0Wt7yCX:APA91bFh0OlrX02n4WOrTDeLDoAIU7eQAr20tQE_vHjW8f7P8Kx2xWFIbrpvpO0n0rxQj1E1PHTv1VAoW7-7lw-XZx-OaPjUtQKsNEwfuoBc3QmxGJ9WyJKwvjrn3CF-zt8xWHi2_ZzT	\N	72b30a2ff4c4c59827464eef9ed4c80bdb0387737f02f9f79d1a05c14838d409	-O33kCZilgYoDUUiH9XP	\N	2024-07-30 17:47:01	2024-08-01 09:47:57	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
135	Hunain	hunainN@gmail.com	971	5445598077	0	$2y$10$ksoBdaQd9RzePgRG0mSzu.8qmFA.OEJeT.ux5yEL8UQuqxRrR9g9e	\N	4	\N	\N	172231729466a879eea38d8.jpeg	\N		\N	1627a7e795c91df33b11d83342a72838d749341a1b2d7bdf57098341a2e13e31	-O317zsSdKwYNnuQtFGM	\N	2024-07-30 05:28:14	2024-07-30 15:18:31	0	0	0	0	0	1	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	Hunain	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	33.5164513	73.1108567	\N	\N	\N
139	\N	\N	971	34441562556	1		\N	2	\N	\N	\N	1111	access_token	\N	7fea83e117b2a9fd23060b93674ecf3cb7aafa87e9c167b3ada8534c30de22a8	-O33K0FpdcS9BKMfzGgU	\N	2024-07-30 15:48:18	2024-07-30 15:48:24	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
138	\N	\N	971	3441562555	1		\N	2	\N	\N	\N	1111	access_token	\N	b7001895ceecea69c46dd6fd9ee4a7abc59c9b77f1d50011b62ace90bf6cba25	-O33F7iePgF_CSOq9vDn	\N	2024-07-30 15:26:56	2024-07-30 15:44:17	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
141	\N	\N	971	7034526952	1		\N	2	\N	\N	\N	1111	c5AOHmWvR2q0_fAMHgyZHj:APA91bEcCcbnExUtJQSpEIwVS3OSjoa7qgafIn2NC5YtIKHE57M5vBD1Qu2jU0Kbyeso-CrEhvqSTuZaKu1JAxlu9ZjgvXMZkPWulAP96GeOX471Agnodk901so4BBoCND4A6Rs-uCfy	\N	a9fac32b089efb1bb4746d951f800bb3dd56e38eb09b4428512514785071d983	-O33bIu2HwMTqr_GBxXW	\N	2024-07-30 17:08:11	2024-08-03 03:49:37	0	0	0	0	1	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
140	\N	\N	971	3176640404	1		\N	2	\N	\N	\N	1111	access_token	\N	ce907a6b70a6d5a34518a8f8b17ab4c5ea8f57fc7c1d8e1490a30309c13effa6	-O33WbaOPdOxKadL-hJ1	\N	2024-07-30 16:42:55	2024-07-30 16:43:27	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
137	Hunain2	hunainN2@gmail.com	971	12344321234	0	$2y$10$hjbMz0na8AYTNyinsgOp6eKRjcTTXbY4yREVzX7SewK2YgxHWg0U2	\N	4	\N	\N	172235269866a9043a2ef7d.jpeg	\N	23wwewew	\N	fa4d30a25e7c7c55da0ee2a7b5b97fd9d9a7fbdffce9791b87df517f4514d4b9	-O33DKXjGXG9_VFcwgsb	\N	2024-07-30 15:18:18	2024-08-01 11:16:32	0	0	0	0	0	1	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	Hunain2	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	33.5164394	73.1107849	\N	\N	\N
4	ranadxba 1	randxba@gcom.com	971	097889678934	0	$2y$10$/cv2mZj8CSCQjosmh5Fni.HCRM89l27jmf4A5YhrBphLBG4ZO6rva	\N	4	\N	\N	172201453066a3db42066b2.png	\N		\N	6795bbb307b6fdf5e2144213db51a1ad3474e7cc448b1a7e304f3ad966d64511	-O2YXHZnJEwzjEXouGaa	\N	2024-05-07 10:53:17	2024-08-01 11:59:53	0	0	0	0	0	1	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	ranadxba 1	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			test	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	33.5668209	73.136821	\N	\N	\N
136	Test Two	test2N@gmail.com	971	987654321	0	$2y$10$YQhUK9nqgHSsMW73EUO5h.p9xjLOO4a9DQQUz1l2ZSuNoENLE4dn.	\N	4	\N	\N	172232237866a88dcab97aa.png	\N		\N	37a956412e1790ed84e6bd92eff95501deae966bd44e51160cad8b72e182f1a1	-O31PizSLZZQiUUsnKjF	\N	2024-07-30 06:52:58	2024-07-30 06:56:15	0	0	0	0	0	1	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	Test Two	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	33.5668223	73.1368278	\N	\N	\N
144	Hamid	razahamid001@gmial.com	971	3441562559	0	$2y$10$o/xe8erlpWj3UEwP0mMXH.6FTyJoLffe520670/GA7UenzEm2g9Ka	\N	4	\N	\N	6835a54355834_1748346179.jpg	\N	cdouIkaPRQqSLrZPz5wexb:APA91bGOdFVEwHr5iooxsZnv3GC-rtch9lhsAphbLOhHXgURAzb0losLWSPDA62FgCOR0wJ99h7zXAFI17BlYSSuPgW2pgqgi47GEjJhy5H_6A06yW6ai14-LOITqyrVgPow3jGiDeH5	\N	3982ffcfd83077007f7186bdc84671eb60135ad8bbc218c9480b981c610e3ab0	-O36Vn2-oZyoYmCLocwq	\N	2024-07-31 06:37:04	2025-05-29 08:29:36	1	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	Hamid	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	68381af0e25b8_1748507376.jpg	3
146	\N	\N	971	3441562562	1		\N	2	\N	\N	\N	1111		\N	e84212bc2da3358ef8713a7186b4e5342978aa3dc27a1c9f23e8ce799a1a00ca	-O3Bj_T8-suBeYZl5vQ5	\N	2024-08-01 07:01:21	2024-08-01 12:07:50	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
157	sabeeh hashmi	sabeeh@gmail.com	971	70345216955	1	1234	2025-06-02 09:58:31	2	sabeeh	hashmi	\N	1111	11111111	ss	db0bbc618755986b71c55196c0fcc86a5f0f9ec3c5e2425a00a41951dcf0a963	-ORk40LxarsPSSexIVUW	\N	2025-06-02 09:58:31	2025-06-10 08:45:35	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
134	Anil	anil@anil.com	971	457474747	0	$2y$10$DYg3wrOqJ6r7hlUY3RxEfeN8ydcAMpbFhVSuPz3873bTaiG/rtway	\N	4	\N	\N	172231519066a871b624f09.jpg	\N		\N	5b2a84c2f93c774c39916fea07c096d88b7a360a2d8ddb0dab9d67b20d7e6156	-O30zEe2PCQ_YE-G0_i7	\N	2024-07-30 04:53:10	2024-08-01 13:34:11	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	Anil	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	33.5668209	73.1368196	\N	\N	\N
153	\N	\N	971	594005096	1		\N	2	\N	\N	\N	1111	\N	\N	\N	\N	\N	2024-08-02 11:04:39	2024-08-02 11:04:42	0	0	0	0	0	0	\N	\N	0	1111	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
154	Sabee Shah	hashmisabeeh@gmail.com	971	3243435	1	$2y$10$9O6Ym93/HopAUauqhAM3z.woGx6nDcYEdZxeFnq7VagiPC7eYBCTm	\N	2	Sabee	Shah	68357b640b5b1_1748335460.jpg	\N	\N	\N	\N	\N	\N	2025-05-27 08:44:20	2025-05-27 08:51:17	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	A6219279	\N	\N
150	\N	\N	971	42345125125	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	22c0a81a617fcb22acd5b216b496cc0c38d6c816b02883b8e59f6b23998ae80e	-O3Ee9jAGlTKmWYmPQim	\N	2024-08-01 20:36:32	2024-08-01 20:36:38	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
148	\N	\N	971	756576576	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	29265d27c66b0c485ad3427b1c7ac0067c1765113feddcd323903a63de471908	-O3DgfAm9H2AHQfTiOUY	\N	2024-08-01 16:07:51	2024-08-01 16:07:58	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
152	\N	\N	971	504005096	1		\N	2	\N	\N	\N	1111	fCowCwxvYUD6kC12Fraoqg:APA91bEMCdY4kzuYaJqIwHFzne8O21N0virZtr8DZJKpuFWA7aWTr1LzyvFZ5INcg3jBo7f-dF-SWOGkAHMMGmaKJmQwp5C0Sfy1sNePsoSbOhlxWZsjk0cLd-id8VK84lM7LlVQNYxj	\N	a64d5fc2ab9403c318a1e47f40610f603d4139b290585ad3291883fd8a1dcc7f	-O3Fp9nLtkE6PbHRXRFY	\N	2024-08-02 02:04:11	2024-08-02 12:47:30	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
160	\N	\N	971	703452169886	1	1234	\N	2	\N	\N	\N	1111	11111111	\N	125009f9ac84d9f21d35a618acbd7b0edbf19f616ab9a8a732ea4ee940553061	-ORkXAmCsV29aRvDljTk	\N	2025-06-02 12:05:28	2025-06-02 12:05:57	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
147	\N	\N	971	7034526953	1		\N	2	\N	\N	\N	1111		\N	fd17bd7f87ae8a22c39e541bceb526f3799ac70f73e41e2b4480f709b3b6e185	-O3CqQCO-XvMV0FTv1q-	\N	2024-08-01 12:10:44	2024-08-01 12:27:21	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
149	\N	\N	971	123141241	1		\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	5ede6aac65425ac4eaf909247e6ce77f5c8f17dca4cde369a6975c0d2a8f2eef	-O3EdxdWPAoZ6tOOXpaH	\N	2024-08-01 20:35:39	2024-08-01 20:35:44	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
151	\N	\N	971	5255225555	1		\N	2	\N	\N	\N	1111	cTYZU3zNV0Mzv_yWtjY4eY:APA91bFAdmxbv2Y1N9ojwTQNrWA3q5Kocjni-wHQV9WnuE8UXSqPlpsUw0uqpa_f0FofXQvyaL5uVfpBXlP7TNg6ArGHoa-cFunqshaWNOMpmMXH9ng28sSrm7N9SivNQeEB94o_HnqM	\N	53a1f7350c6b203dc8007ca7ad1a9e5a3b09d3d53ddce1b264c32b8b6d166763	-O3F2E8iDLBkHInfYLMR	\N	2024-08-01 22:26:04	2024-08-01 22:26:09	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
143	\N	\N	971	564005896	1		\N	2	\N	\N	\N	1111		\N	9bc3b052e1f6641706e4be771ca9725e89aad854b24d04e0c49f9b1d6e29741d	-O3Hk8oPMLYfGAMtigtS	\N	2024-07-31 04:42:57	2024-08-02 11:02:00	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
145	\N	\N	971	3441562556	1		\N	2	\N	\N	\N	1111	access_token	\N	e0e369997d410841a07101f4755c34ce8f93c85c545a094e7607838639efc3b9	-O373-h3kfmeA30sFrNU	\N	2024-07-31 09:12:26	2024-07-31 11:31:15	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
162	\N	\N	971	703452169544	0	1234	\N	2	\N	\N	\N	1111	\N	\N	\N	\N	\N	2025-06-03 04:33:47	2025-06-03 04:33:47	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
159	\N	\N	971	70345216988	0	1234	\N	2	\N	\N	\N	1111	\N	\N	\N	\N	\N	2025-06-02 12:03:28	2025-06-02 12:03:28	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
158	\N	\N	971	79345216955	1	1234	2025-06-02 10:05:02	2	\N	\N	\N		324344234	ss	ec12e6073d642382bcf1a46198e4396018cfe76c447cae93036e373b8b82693c	-ORk5Vmr-dKkBtiGSJQx	\N	2025-06-02 10:05:02	2025-06-02 10:05:03	0	0	0	0	1	0	\N	\N	1		\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
155	Sam Billings	sam@billings.com	971	121121333	0	$2y$10$javdnmsL9N7S9TIaq./E9ulbbTQvXtqxc7sTURa59e4Xp8KUQOoda	\N	4	\N	\N	68381d84a1ed9_1748508036.jpg	\N	\N	\N	\N	\N	\N	2025-05-29 08:40:36	\N	1	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	Sam Billings	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	A7780527	68381d84cf3a3_1748508036.png	4
163	nasrullah khan	nasrullah@gmail.com	971	7705054	1	1234	\N	2	nasrullah	khan	\N	1111	11111111	\N	fffe899e6060983aa6a62714e3ab54efe2c718f468742e0f725f794b4a663965	-ORqQOvlXZD_fiAtomKZ	\N	2025-06-03 15:33:38	2025-06-04 07:15:12	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
161	sabeeh Shah	hashmisabeeh123@gmail.com	971	70345219886	1	1234	\N	2	sabeeh	Shah	68408366a57df_1749058406.jpg	1111	11111111	\N	64a368bd24acf4c33a807ae421cb0d2429a1cc9f6ec6114aaadb80a2b9bf8eba	-ORkZgCtwSniaywAVd9O	\N	2025-06-02 12:06:33	2025-06-04 17:33:26	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
166	\N	\N	971	123123125	0	1234	\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	272040717d399b6955ada98fb73e5854bb4e078616a42466a14a0d7e268564ed	-ORu4L-bKc6tqJ2f8XGS	\N	2025-06-04 08:36:00	2025-06-04 08:36:08	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
170	ha ha	test22@gmail.com	971	123123127	1	1234	\N	2	ha	ha	68409e8c8560e_1749065356.jpg	1111		\N	788a82936586947c4cff4610a54ecf7d5bafa5861e12e7d6a6b67cf1572cbf54	-ORwPkLWl_QdcSVbgXYb	\N	2025-06-04 19:28:51	2025-06-04 19:38:33	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
172	anil navis	1@1.com	971	523243163	1	1234	\N	2	anil	navis	\N	1111		\N	8226d7390b90f8999403caa6cc7b735ee212163c1ab1d1b61596fce172f3f51e	-ORxSy0ofRCvfvd-MVIt	\N	2025-06-05 00:22:29	2025-06-07 10:52:58	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
175	\N	\N	971	280280280	1	1234	\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	2e7f0bc8c7b07422320bbb1435363867c711c9ebe43aff464645ea9b6aa85d01	-OS9tveN9d8BTdmUAvgt	\N	2025-06-07 14:52:02	2025-06-07 14:59:50	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
169	test abc	test21@gmail.com	971	123123126	1	1234	\N	2	test	abc	684087c034106_1749059520.jpg	1111		\N	4d7319ece18ce706df1e20526fcd7f577b80a41a0c3d4226eacfa731dbcc6fab	-ORw3R_3NJpeYd008HQM	\N	2025-06-04 17:51:21	2025-06-06 09:41:30	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
168	\N	\N	971	335770504	0	1234	\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	808f157010d8b75f24d4d6da7cab1a276b48fa94efb6b3da76ccf2b63b1934e4	-ORvnlCdE26lyCEGzNDI	\N	2025-06-04 16:38:32	2025-06-04 16:38:36	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
174	anil navis	anil@anilanil.com	971	600600600	1	1234	\N	2	anil	navis	68441ab1bd624_1749293745.jpg	1111		\N	acc6327a58587065bff806e28f38b8f757009713e8a0550262968af9ebf8bbaf	-OS90kKNId0FhUe2ngSn	\N	2025-06-07 10:54:18	2025-06-07 14:48:52	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
171	test user new	test@gmail.com	971	3313851811	1	1234	\N	2	test	user new	6840d1dc31217_1749078492.jpg	1111		\N	39f1621227c08457d8d6e771d620c00e3faffe68fd5e123ac829ff15952618a7	-ORwTpcRCrCJNACpvzkW	\N	2025-06-04 19:46:42	2025-06-05 09:38:01	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
173	zain falak	test31@gmail.com	971	123123128	1	1234	\N	2	zain	falak	6842b7f582b00_1749202933.jpg	1111	abdhjef ekef kjwf wedfw	\N	0bf102e2f3b37c462822999897501c00526122aef4d174dc87e20abdfd5456ff	-OS3bYKaVzsY3KHa2-uo	\N	2025-06-06 09:41:44	2025-06-06 09:42:14	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
167	\N	\N	971	3357705054	1	1234	\N	2	\N	\N	\N	1111	abdhjef ekef kjwf wedfw	\N	92e90e3787086441f8c04a971c7b5d9cdfa5e5354fe1d26cc37297bbd5bdfa72	-ORvT1vbOGTD0jmfetAG	\N	2025-06-04 15:03:37	2025-06-05 09:38:12	0	0	0	0	1	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: users_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_role (id, role_name, created_at, updated_at) FROM stdin;
1	admin	2024-05-03 09:20:23	2024-05-03 09:20:23
2	users	2024-05-03 09:20:23	2024-05-03 09:20:23
3	vendors	2024-05-03 09:20:23	2024-05-03 09:20:23
\.


--
-- Data for Name: vehicle_models; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle_models (id, model, manufacturer_id, status, created_at, updated_at, type_id) FROM stdin;
6	Alfa Romeo Stelvio	4	t	2024-05-20 06:32:37	2024-05-20 06:32:37	0
7	Aprilia RSV4	5	t	2024-05-20 06:33:18	2024-05-20 06:33:18	0
1	A3	8	t	2024-05-10 12:27:13	2024-05-20 07:01:53	0
2	Q8	8	t	2024-05-14 11:07:32	2024-05-20 07:02:47	0
4	RDX	8	t	2024-05-20 06:28:40	2024-07-30 05:03:29	1
5	Brutale	3	t	2024-05-20 06:31:53	2024-07-30 09:15:50	2
8	ILX	2	t	2024-07-30 11:14:00	2024-07-30 11:14:00	5
3	Abarth 595	1	t	2024-05-20 06:27:42	2024-08-03 03:10:42	1
\.


--
-- Data for Name: vehicle_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle_types (id, model, manufacturer_id, status, created_at, updated_at) FROM stdin;
1	SUV	1	t	2024-05-10 12:27:26	2024-05-13 00:22:31
2	Saloon	1	t	2024-05-10 12:27:39	2024-07-25 14:03:46
3	Sedan	\N	t	2024-05-13 00:22:45	2024-07-25 14:04:48
5	Hatchback	\N	t	2024-05-13 00:23:19	2024-07-25 14:05:17
\.


--
-- Data for Name: vehicles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicles (id, user_id, manufacturer_id, model_id, country_id, city_id, year, chassis_number, plate_number, plate_code, image, created_at, updated_at, name, state_id, type_id, color_id) FROM stdin;
46	85	8	2	1	1	2024	\N	215884	\N	172200135766a3a7cdbffe9.jpg	2024-07-26 13:42:37	2024-07-26 13:42:37	\N	1	8	0
3	6	8	1	1	1	2002	\N	352352	g	1716204167664b3287a6e66.png	2024-05-20 07:14:08	2024-05-20 11:22:47	\N	1	1	1
2	6	8	2	1	1	2000	\N	22323232	DU	1716183540664ae1f4ed997.jpeg	2024-05-20 05:39:00	2024-05-20 11:23:26	CAR	1	2	1
4	8	1	1	1	1	2020	\N	123	\N		2024-07-22 05:37:21	2024-07-22 05:37:21	\N	1	1	1
5	10	1	1	1	1	2020	\N	123	\N		2024-07-22 08:38:21	2024-07-22 08:38:21	\N	1	1	\N
6	10	1	1	1	1	2020	\N	123	\N		2024-07-22 11:17:50	2024-07-22 11:17:50	\N	1	\N	\N
7	8	1	1	1	1	2020	\N	123	\N		2024-07-22 11:23:52	2024-07-22 11:23:52	\N	1	\N	1
8	26	1	1	1	1	2020	\N	123	\N	1721670862669e9cce83d6f.png	2024-07-22 17:54:22	2024-07-22 17:54:22	\N	1	1	1
9	26	2	2	1	1	2024	\N	1133	\N	1721670902669e9cf6ef1f7.png	2024-07-22 17:55:02	2024-07-22 17:55:02	\N	1	1	1
10	41	2	2	1	1	2024	\N	1133	\N		2024-07-22 20:14:00	2024-07-22 20:14:00	\N	1	1	1
11	41	2	2	1	1	2024	\N	1144	\N		2024-07-22 20:14:13	2024-07-22 20:14:13	\N	1	1	1
12	8	1	1	1	1	2020	\N	123	\N		2024-07-23 09:41:44	2024-07-23 09:41:44	\N	1	\N	1
13	9	1	1	1	1	2020	\N	123	\N		2024-07-24 08:04:55	2024-07-24 08:04:55	\N	1	1	1
14	10	1	1	1	1	2020	\N	123	\N		2024-07-24 11:38:32	2024-07-24 11:38:32	\N	1	1	1
15	10	1	3	1	1	2002	\N	123	\N	172182126966a0e8557d853.jpg	2024-07-24 11:41:09	2024-07-24 11:41:09	\N	1	0	\N
16	10	8	2	1	1	2005	\N	jjj	\N		2024-07-24 11:48:28	2024-07-24 11:48:28	\N	1	0	\N
17	101	1	3	1	1	2000	\N	5783	\N	172182332566a0f05d231d5.jpg	2024-07-24 12:15:25	2024-07-24 12:15:25	\N	1	1	1
18	9	1	1	1	1	2020	\N	123	\N		2024-07-24 12:19:24	2024-07-24 12:19:24	\N	1	1	\N
19	9	1	1	1	1	2020	\N	123	\N		2024-07-24 12:27:41	2024-07-24 12:27:41	\N	1	0	\N
20	102	1	3	1	1	2003	\N	6543	\N	172182522166a0f7c5187ee.jpg	2024-07-24 12:47:01	2024-07-24 12:47:01	\N	1	0	0
21	10	2	4	1	1	2005	\N	ggg	\N		2024-07-24 13:09:48	2024-07-24 13:09:48	\N	1	0	\N
22	107	1	3	1	1	2001	\N	457SY	\N	172182739266a100408ab44.jpg	2024-07-24 13:23:12	2024-07-24 13:23:12	\N	1	0	0
23	10	1	3	1	1	2003	\N	vv	\N		2024-07-24 13:45:39	2024-07-24 13:45:39	\N	1	0	\N
24	10	1	3	1	1	2002	\N	123	\N	172182885066a105f268749.jpg	2024-07-24 13:47:30	2024-07-24 13:47:30	\N	1	0	\N
25	10	1	3	1	1	2004	\N	ff	\N		2024-07-24 14:22:36	2024-07-24 14:22:36	\N	1	0	\N
26	114	1	1	1	1	2020	\N	123	\N		2024-07-24 15:53:58	2024-07-24 15:53:58	\N	1	1	1
27	114	10	23	1	1	2024	\N	123	\N	172183921666a12e704a235.png	2024-07-24 16:40:16	2024-07-24 16:40:16	\N	1	1	1
28	74	1	1	1	1	2020	\N	123	\N	172184016266a132220c2c7.png	2024-07-24 16:56:02	2024-07-24 16:56:02	\N	1	1	1
29	74	1	1	1	1	2020	\N	123	\N	172184128266a13682bfffd.png	2024-07-24 17:14:42	2024-07-24 17:14:42	\N	1	1	1
30	116	1	1	1	1	2020	\N	123	\N	172184267366a13bf16a972.png	2024-07-24 17:37:53	2024-07-24 17:37:53	\N	1	1	1
31	10	1	3	1	1	2001	\N	afafaffa	\N	172186273566a18a4fabf7c.jpg	2024-07-24 23:12:15	2024-07-24 23:12:15	\N	1	0	\N
32	80	1	3	1	2	2002	\N	2341	\N		2024-07-25 05:11:19	2024-07-25 05:11:19	\N	1	0	0
33	117	1	3	1	3	2001	\N	1234	\N		2024-07-25 05:21:10	2024-07-25 05:21:10	\N	1	0	0
34	9	1	1	1	1	2020	\N	123	\N		2024-07-25 05:22:53	2024-07-25 05:22:53	\N	1	0	\N
35	117	1	3	1	3	2001	\N	1234	\N	172188531566a1e28329249.jpg	2024-07-25 05:28:35	2024-07-25 05:28:35	\N	1	0	0
36	117	3	5	1	1	2003	\N	2356	\N		2024-07-25 05:33:56	2024-07-25 05:33:56	\N	1	0	0
37	110	8	1	1	4	2003	\N	5480	\N		2024-07-25 07:07:31	2024-07-25 07:07:31	\N	1	0	0
38	119	1	1	1	1	2020	\N	987	\N	172189457466a206aea9099.png	2024-07-25 08:02:54	2024-07-25 08:02:54	\N	1	1	1
39	118	1	3	1	5	2001	\N	1234	\N		2024-07-25 13:46:46	2024-07-25 13:46:46	\N	1	0	0
40	74	1	3	1	2	2000	\N	1313	\N	172192105766a26e21ecd07.jpg	2024-07-25 15:24:17	2024-07-25 15:24:17	\N	1	0	0
41	125	1	3	1	2	2022	\N	1234	\N	172192151666a26fec254af.jpg	2024-07-25 15:31:56	2024-07-25 15:31:56	\N	1	0	0
42	125	1	3	1	2	2001	\N	123	\N	172192489266a27d1c259d4.jpg	2024-07-25 16:28:12	2024-07-25 16:28:12	\N	1	1	0
43	125	1	3	1	1	2006	\N	1231233	\N	172192570266a280465842b.jpg	2024-07-25 16:41:42	2024-07-25 16:41:42	\N	1	1	0
44	125	2	4	1	3	2001	\N	124	\N	172192580466a280ac828f6.jpg	2024-07-25 16:43:24	2024-07-25 16:43:24	\N	1	2	0
47	85	2	4	1	2	2007	\N	1258	\N		2024-07-26 14:15:53	2024-07-26 14:15:53	\N	1	2	0
48	128	1	3	1	2	2001	\N	5461	\N	172203308766a423bf3f0a6.jpg	2024-07-26 22:31:27	2024-07-26 22:31:27	\N	1	1	0
50	85	3	5	1	2	2003	\N	5455	\N		2024-07-29 05:32:49	2024-07-29 05:32:49	\N	1	3	0
51	129	1	3	1	4	2022	\N	96	\N		2024-07-29 08:25:57	2024-07-29 08:25:57	\N	1	0	\N
52	130	1	3	1	2	2003	\N	1235	\N		2024-07-29 09:40:18	2024-07-29 09:40:18	\N	1	1	0
53	130	2	4	1	2	2001	\N	1244	\N		2024-07-29 09:42:35	2024-07-29 09:42:35	\N	1	2	0
54	130	3	5	1	2	2002	\N	1241	\N		2024-07-29 09:47:07	2024-07-29 09:47:07	\N	1	3	0
45	126	1	3	1	1	2000	\N	225533	D34	172265502866ada1348edd9.jpg	2024-07-26 02:18:51	2024-08-03 03:17:08	\N	1	1	0
1	3	1	3	1	1	2000	12345	34234	ABC	171554706266412bb63a356.png	2024-05-12 20:51:02	2025-05-27 09:45:22	Scorpio	1	1	2
55	130	3	5	1	2	2002	\N	1244	\N		2024-07-29 09:47:29	2024-07-29 09:47:29	\N	1	3	0
56	129	2	4	1	1	2000	\N	124	\N	172224774866a76a44273e1.jpg	2024-07-29 10:09:08	2024-07-29 10:09:08	\N	1	0	\N
57	132	1	3	1	2	2000	\N	4124	\N	172226906566a7bd8993f68.jpg	2024-07-29 16:04:25	2024-07-29 16:04:25	\N	1	1	0
58	132	3	5	1	2	2001	\N	4124	\N	172226909766a7bda96eae5.jpg	2024-07-29 16:04:57	2024-07-29 16:04:57	\N	1	3	0
59	133	2	4	1	2	2001	\N	8486	\N		2024-07-29 20:05:27	2024-07-29 20:05:27	\N	1	2	0
60	133	3	5	1	2	2001	\N	6461	\N		2024-07-29 20:05:47	2024-07-29 20:05:47	\N	1	3	0
61	10	1	3	1	5	2004	\N	ghjjjo	\N	172229337266a81c7c15b60.jpg	2024-07-29 22:49:32	2024-07-29 22:49:32	\N	1	0	\N
62	129	1	1	1	1	2020	\N	123	\N		2024-07-30 05:10:08	2024-07-30 05:10:08	\N	1	3	1
63	129	1	3	1	1	2020	\N	123	14885		2024-07-30 05:17:58	2024-07-30 10:50:14	\N	1	3	1
64	138	2	8	1	1	2005	\N	123	\N	172235336466a906d4994ed.jpg	2024-07-30 15:29:24	2024-07-30 15:29:24	\N	1	0	\N
65	139	2	8	1	1	2006	\N	1234	\N	172235457866a90b925e733.jpg	2024-07-30 15:49:38	2024-07-30 15:49:38	\N	1	0	\N
66	140	3	5	1	1	2004	\N	hzjz	\N	172235791666a9189c96d80.jpg	2024-07-30 16:45:16	2024-07-30 16:45:16	\N	1	0	\N
67	140	2	8	1	5	2003	\N	cghhhg	\N		2024-07-30 16:45:44	2024-07-30 16:45:44	\N	1	0	\N
68	140	2	8	1	2	2002	\N	66667	\N		2024-07-30 17:18:43	2024-07-30 17:18:43	\N	1	0	\N
69	140	1	3	1	2	2003	\N	12277	\N		2024-07-30 17:25:33	2024-07-30 17:25:33	\N	1	0	\N
70	142	2	8	1	1	2004	\N	66366	\N	172236170466a927680e98c.jpg	2024-07-30 17:48:24	2024-07-30 17:48:24	\N	1	0	\N
71	142	3	5	1	2	2007	\N	9876	\N		2024-07-30 17:49:08	2024-07-30 17:49:08	\N	1	0	\N
72	141	1	3	1	1	2006	\N	183838	\N	172236187066a9280e0e116.jpg	2024-07-30 17:51:10	2024-07-30 17:51:10	\N	1	0	\N
73	141	3	5	1	1	2008	\N	12838	\N	172236199566a9288bba879.jpg	2024-07-30 17:53:15	2024-07-30 17:53:15	\N	1	0	\N
74	139	1	3	1	2	2007	\N	1234	\N		2024-07-31 06:43:35	2024-07-31 06:43:35	\N	1	0	\N
76	145	1	3	1	4	2000	\N	Number	\N		2024-07-31 09:13:43	2024-07-31 09:13:43	\N	1	0	\N
77	85	1	1	1	1	2020	\N	123	ad123		2024-07-31 18:56:01	2024-07-31 18:56:01	\N	1	1	1
78	146	1	3	1	5	2009	\N	plate	\N		2024-08-01 07:01:57	2024-08-01 07:01:57	\N	1	0	\N
79	141	2	8	1	1	2014	\N	133	\N		2024-08-01 11:46:08	2024-08-01 11:46:08	\N	1	0	\N
80	131	2	8	1	3	2014	\N	113	\N		2024-08-01 12:23:37	2024-08-01 12:23:37	\N	1	0	\N
82	148	1	3	1	2	2002	\N	131323	123		2024-08-01 16:15:52	2024-08-01 16:15:52	\N	1	1	0
83	142	1	3	1	2	2004	\N	654321	abc	172253194966abc06d20279.jpg	2024-08-01 17:05:49	2024-08-01 17:05:49	\N	1	0	\N
84	148	1	3	1	2	2000	\N	686768	768		2024-08-01 17:08:52	2024-08-01 17:08:52	\N	1	1	0
88	148	3	5	1	4	2002	\N	123144	123	172254034366abe1377937f.jpg	2024-08-01 19:25:43	2024-08-01 19:25:43	\N	4	3	0
89	148	3	5	1	4	2002	\N	123144	123	172254340166abed29a3bb0.jpg	2024-08-01 20:16:41	2024-08-01 20:16:41	\N	4	3	0
90	148	3	5	1	4	2002	\N	123144	123	172254356766abedcf13efe.jpg	2024-08-01 20:19:27	2024-08-01 20:19:27	\N	4	3	0
91	148	3	5	1	4	2005	\N	112222	111	172254388366abef0bd69d9.jpg	2024-08-01 20:24:43	2024-08-01 20:24:43	\N	4	3	0
92	148	3	5	1	4	2004	\N	112222	111	172254397466abef665c6a1.jpg	2024-08-01 20:26:14	2024-08-01 20:26:14	\N	4	3	0
93	148	3	5	1	4	2005	\N	112222	111	172254452666abf18eacd13.jpg	2024-08-01 20:28:26	2024-08-01 20:35:26	\N	4	3	0
96	151	2	8	1	2	2000	\N	555555	hhu		2024-08-01 22:26:33	2024-08-01 22:26:33	\N	2	2	0
97	131	3	5	1	1	2007	\N	766	pla	172257968666ac7ae6146c8.jpg	2024-08-02 06:21:26	2024-08-02 06:21:26	\N	2	0	\N
87	142	4	6	1	1	2008	\N	321124	abc	172258984766aca29790e7e.jpg	2024-08-01 19:22:25	2024-08-02 09:11:23	\N	5	0	\N
95	150	1	3	1	4	2005	\N	222222	111	172254778766abfe4b52f95.jpg	2024-08-01 21:29:01	2024-08-01 21:29:47	\N	4	1	0
108	169	2	7	1	1	2000	\N	LQA	12345		2025-06-06 04:29:41	2025-06-06 04:29:41	\N	1	1	3
103	171	5	1	1	1	2000	\N	vv	55555		2025-06-04 19:52:06	2025-06-04 19:52:06	\N	1	1	2
104	172	1	7	1	2	2001	\N	a4	54646		2025-06-05 00:24:29	2025-06-05 00:24:29	\N	2	1	1
98	142	1	3	1	1	2012	\N	987654	abc	172259196666acaade910b1.jpg	2024-08-02 09:46:06	2024-08-02 09:48:23	\N	5	0	\N
49	126	2	8	1	4	2001	\N	2255	D5		2024-07-27 03:42:56	2024-08-03 03:16:16	\N	4	2	0
99	163	8	1	1	2	2000	\N	hh	88888		2025-06-03 20:17:29	2025-06-03 20:17:29	\N	2	1	2
100	163	8	1	1	3	2000	\N	ab	88588		2025-06-03 21:51:16	2025-06-03 21:51:16	\N	3	1	2
105	161	1	1	1	1	2020	\N	123	\N		2025-06-05 06:27:39	2025-06-05 06:27:39	\N	1	1	1
106	164	3	6	1	2	2021	\N	LQA	12345		2025-06-05 19:38:12	2025-06-05 19:38:12	\N	2	1	3
107	169	8	2	1	1	2002	\N	LQA	12345		2025-06-05 19:43:00	2025-06-05 19:43:00	\N	1	1	3
109	173	8	2	1	1	2000	\N	12345	LQA		2025-06-06 09:42:50	2025-06-06 09:42:50	\N	1	1	3
110	173	6	4	1	1	2001	\N	123	Abc		2025-06-06 11:10:33	2025-06-06 11:10:33	\N	1	1	2
111	174	1	6	1	2	2000	\N	25545	D3		2025-06-07 10:56:42	2025-06-07 10:56:42	\N	2	1	4
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

SELECT pg_catalog.setval('public.app_banners_id_seq', 2, true);


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

SELECT pg_catalog.setval('public.articles_id_seq', 3, true);


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
-- Name: booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_id_seq', 211, true);


--
-- Name: booking_rejected_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_rejected_id_seq', 14, true);


--
-- Name: booking_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_service_id_seq', 127, true);


--
-- Name: booking_temp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_temp_id_seq', 303, true);


--
-- Name: booking_vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_vehicle_id_seq', 171, true);


--
-- Name: brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_id_seq', 1, true);


--
-- Name: breeds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.breeds_id_seq', 1, false);


--
-- Name: card_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.card_details_id_seq', 2, true);


--
-- Name: cart_food_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_food_id_seq', 1, false);


--
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 40, true);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 11, true);


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

SELECT pg_catalog.setval('public.coupon_category_id_seq', 3, true);


--
-- Name: coupon_coupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupon_coupon_id_seq', 1, true);


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

SELECT pg_catalog.setval('public.faq_id_seq', 2, true);


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
-- Name: maid_pricing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maid_pricing_id_seq', 3, true);


--
-- Name: manufacturers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.manufacturers_id_seq', 10, true);


--
-- Name: membership_payment_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.membership_payment_reports_id_seq', 1, false);


--
-- Name: memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.memberships_id_seq', 1, true);


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

SELECT pg_catalog.setval('public.migrations_id_seq', 413, true);


--
-- Name: moda_main_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moda_main_categories_id_seq', 6, true);


--
-- Name: moda_sub_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moda_sub_categories_id_seq', 1, false);


--
-- Name: mute_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mute_order_id_seq', 1209, true);


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
-- Name: ninja_category_selected_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ninja_category_selected_id_seq', 76, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 1, true);


--
-- Name: nottification_tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nottification_tracks_id_seq', 1, false);


--
-- Name: order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_products_id_seq', 16, true);


--
-- Name: order_status_histroys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_status_histroys_id_seq', 1, false);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 20, true);


--
-- Name: payment_init_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_init_id_seq', 1, false);


--
-- Name: payment_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_report_id_seq', 227, true);


--
-- Name: payment_temp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_temp_id_seq', 1, false);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 599, true);


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
-- Name: price_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_list_id_seq', 76, true);


--
-- Name: pricing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pricing_id_seq', 8, true);


--
-- Name: product_attribute_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_attribute_attribute_id_seq', 1, false);


--
-- Name: product_attribute_values_attribute_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_attribute_values_attribute_values_id_seq', 1, false);


--
-- Name: product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_categories_id_seq', 1, true);


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

SELECT pg_catalog.setval('public.product_id_seq', 13, true);


--
-- Name: product_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_images_id_seq', 9, true);


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
-- Name: recovery_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recovery_types_id_seq', 2, true);


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

SELECT pg_catalog.setval('public.services_id_seq', 11, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);


--
-- Name: skin_colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skin_colors_id_seq', 4, true);


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

SELECT pg_catalog.setval('public.states_id_seq', 5, true);


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
-- Name: subscripton_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscripton_services_id_seq', 9, true);


--
-- Name: temp_membership_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_membership_services_id_seq', 1, false);


--
-- Name: temp_memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_memberships_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.temp_users_id_seq', 3, true);


--
-- Name: time_slote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.time_slote_id_seq', 35, true);


--
-- Name: time_slote_master_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.time_slote_master_id_seq', 24, true);


--
-- Name: tinting_brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tinting_brands_id_seq', 3, true);


--
-- Name: type_of_property_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_of_property_id_seq', 1, false);


--
-- Name: user_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_address_id_seq', 22, true);


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
-- Name: user_membership_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_membership_services_id_seq', 1, false);


--
-- Name: user_memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_memberships_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.users_id_seq', 175, true);


--
-- Name: users_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_role_id_seq', 3, true);


--
-- Name: vehicle_models_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_models_id_seq', 8, true);


--
-- Name: vehicle_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_types_id_seq', 5, true);


--
-- Name: vehicles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicles_id_seq', 111, true);


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
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (id);


--
-- Name: booking_rejected booking_rejected_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_rejected
    ADD CONSTRAINT booking_rejected_pkey PRIMARY KEY (id);


--
-- Name: booking_service booking_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_service
    ADD CONSTRAINT booking_service_pkey PRIMARY KEY (id);


--
-- Name: booking_temp booking_temp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_temp
    ADD CONSTRAINT booking_temp_pkey PRIMARY KEY (id);


--
-- Name: booking_vehicle booking_vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_vehicle
    ADD CONSTRAINT booking_vehicle_pkey PRIMARY KEY (id);


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
-- Name: card_details card_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_details
    ADD CONSTRAINT card_details_pkey PRIMARY KEY (id);


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
-- Name: maid_pricing maid_pricing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maid_pricing
    ADD CONSTRAINT maid_pricing_pkey PRIMARY KEY (id);


--
-- Name: manufacturers manufacturers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT manufacturers_pkey PRIMARY KEY (id);


--
-- Name: membership_payment_reports membership_payment_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membership_payment_reports
    ADD CONSTRAINT membership_payment_reports_pkey PRIMARY KEY (id);


--
-- Name: memberships memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_pkey PRIMARY KEY (id);


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
-- Name: mute_order mute_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mute_order
    ADD CONSTRAINT mute_order_pkey PRIMARY KEY (id);


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
-- Name: ninja_category_selected ninja_category_selected_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ninja_category_selected
    ADD CONSTRAINT ninja_category_selected_pkey PRIMARY KEY (id);


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
-- Name: price_list price_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_list
    ADD CONSTRAINT price_list_pkey PRIMARY KEY (id);


--
-- Name: pricing pricing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pricing
    ADD CONSTRAINT pricing_pkey PRIMARY KEY (id);


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
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);


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
-- Name: recovery_types recovery_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recovery_types
    ADD CONSTRAINT recovery_types_pkey PRIMARY KEY (id);


--
-- Name: recovery_types recovery_types_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recovery_types
    ADD CONSTRAINT recovery_types_slug_unique UNIQUE (slug);


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
-- Name: subscripton_services subscripton_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscripton_services
    ADD CONSTRAINT subscripton_services_pkey PRIMARY KEY (id);


--
-- Name: temp_membership_services temp_membership_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_membership_services
    ADD CONSTRAINT temp_membership_services_pkey PRIMARY KEY (id);


--
-- Name: temp_memberships temp_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_memberships
    ADD CONSTRAINT temp_memberships_pkey PRIMARY KEY (id);


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
-- Name: tinting_brands tinting_brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tinting_brands
    ADD CONSTRAINT tinting_brands_pkey PRIMARY KEY (id);


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
-- Name: user_membership_services user_membership_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_membership_services
    ADD CONSTRAINT user_membership_services_pkey PRIMARY KEY (id);


--
-- Name: user_memberships user_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_memberships
    ADD CONSTRAINT user_memberships_pkey PRIMARY KEY (id);


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
-- Name: vehicle_types vehicle_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_types
    ADD CONSTRAINT vehicle_types_pkey PRIMARY KEY (id);


--
-- Name: vehicles vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT vehicles_pkey PRIMARY KEY (id);


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
-- Name: user_membership_services_service_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_membership_services_service_id_index ON public.user_membership_services USING btree (service_id);


--
-- Name: user_membership_services_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_membership_services_user_id_index ON public.user_membership_services USING btree (user_id);


--
-- Name: user_membership_services_user_membership_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_membership_services_user_membership_id_index ON public.user_membership_services USING btree (user_membership_id);


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
-- Name: booking booking_ninja_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_ninja_id_foreign FOREIGN KEY (ninja_id) REFERENCES public.users(id);


--
-- Name: booking booking_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


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
-- Name: vehicle_types vehicle_types_manufacturer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_types
    ADD CONSTRAINT vehicle_types_manufacturer_id_foreign FOREIGN KEY (manufacturer_id) REFERENCES public.manufacturers(id) ON DELETE CASCADE;


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

