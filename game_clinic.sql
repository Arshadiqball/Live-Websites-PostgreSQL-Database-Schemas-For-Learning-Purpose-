--
-- PostgreSQL database dump
--

-- Dumped from database version 12.18 (Ubuntu 12.18-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.6 (Ubuntu 15.6-1.pgdg20.04+1)

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
-- Name: amenities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.amenities (
    id bigint NOT NULL,
    name character varying(600),
    description text,
    active integer DEFAULT 0 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.amenities OWNER TO postgres;

--
-- Name: amenities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.amenities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amenities_id_seq OWNER TO postgres;

--
-- Name: amenities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.amenities_id_seq OWNED BY public.amenities.id;


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
    updated_at timestamp(0) without time zone,
    "UID" character varying(255) NOT NULL
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
    user_id integer NOT NULL,
    event_id integer DEFAULT 0 NOT NULL,
    game_id integer DEFAULT 0 NOT NULL,
    num_of_seats integer DEFAULT 0 NOT NULL,
    payment_mode integer DEFAULT 0 NOT NULL,
    item_amount double precision DEFAULT '0'::double precision NOT NULL,
    grand_total double precision DEFAULT '0'::double precision NOT NULL,
    booking_date timestamp(0) without time zone,
    seat_position character varying(255),
    timeslot_id integer DEFAULT 0 NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    payment_ref text,
    booking_type integer DEFAULT 1 NOT NULL,
    table_number character varying(20),
    table_no character varying(255)
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
-- Name: booking_seats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_seats (
    id bigint NOT NULL,
    booking_id bigint NOT NULL,
    game_id bigint NOT NULL,
    table_no character varying(255) NOT NULL,
    seat_position text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    name character varying(255),
    player_no character varying(255)
);


ALTER TABLE public.booking_seats OWNER TO postgres;

--
-- Name: booking_seats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_seats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_seats_id_seq OWNER TO postgres;

--
-- Name: booking_seats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_seats_id_seq OWNED BY public.booking_seats.id;


--
-- Name: booking_time_slots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_time_slots (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    game_id integer NOT NULL,
    slot_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.booking_time_slots OWNER TO postgres;

--
-- Name: booking_time_slots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_time_slots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_time_slots_id_seq OWNER TO postgres;

--
-- Name: booking_time_slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_time_slots_id_seq OWNED BY public.booking_time_slots.id;


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
-- Name: coach_activity_prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coach_activity_prices (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    activity_type_id integer NOT NULL,
    city_id integer NOT NULL,
    price character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.coach_activity_prices OWNER TO postgres;

--
-- Name: coach_activity_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coach_activity_prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coach_activity_prices_id_seq OWNER TO postgres;

--
-- Name: coach_activity_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coach_activity_prices_id_seq OWNED BY public.coach_activity_prices.id;


--
-- Name: coach_booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coach_booking (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    booking_date date NOT NULL,
    timslot character varying(255) NOT NULL,
    booking_datetime timestamp(0) without time zone NOT NULL,
    payment_method integer NOT NULL,
    amount_paid double precision NOT NULL,
    payment_status integer NOT NULL,
    payment_ref text NOT NULL,
    coach_id integer NOT NULL,
    status integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.coach_booking OWNER TO postgres;

--
-- Name: coach_booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coach_booking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coach_booking_id_seq OWNER TO postgres;

--
-- Name: coach_booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coach_booking_id_seq OWNED BY public.coach_booking.id;


--
-- Name: coach_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coach_locations (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    country_id integer NOT NULL,
    city_id character varying(255) NOT NULL,
    state_id character varying(255) NOT NULL,
    latitude character varying(255) NOT NULL,
    longitude character varying(255) NOT NULL,
    location character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.coach_locations OWNER TO postgres;

--
-- Name: coach_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coach_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coach_locations_id_seq OWNER TO postgres;

--
-- Name: coach_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coach_locations_id_seq OWNED BY public.coach_locations.id;


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
    website_url text,
    snap_chat text,
    tiktok text
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
    updated_at timestamp(0) without time zone,
    quote_amount double precision DEFAULT '0'::double precision NOT NULL
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
-- Name: event_amenity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_amenity (
    id bigint NOT NULL,
    event_id integer DEFAULT 0 NOT NULL,
    amenitiy_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.event_amenity OWNER TO postgres;

--
-- Name: event_amenity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_amenity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_amenity_id_seq OWNER TO postgres;

--
-- Name: event_amenity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_amenity_id_seq OWNED BY public.event_amenity.id;


--
-- Name: event_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_images (
    id bigint NOT NULL,
    event_id integer DEFAULT 0 NOT NULL,
    event_image character varying(600),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.event_images OWNER TO postgres;

--
-- Name: event_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_images_id_seq OWNER TO postgres;

--
-- Name: event_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_images_id_seq OWNED BY public.event_images.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id bigint NOT NULL,
    name character varying(600),
    amount double precision DEFAULT '0'::double precision NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    knowmore text,
    rewards text,
    country_id integer DEFAULT 0 NOT NULL,
    state_id integer DEFAULT 0 NOT NULL,
    city_id integer DEFAULT 0 NOT NULL,
    location character varying(600),
    latitude character varying(600),
    longitude character varying(600),
    deleted integer DEFAULT 0 NOT NULL,
    event_datetime timestamp(0) without time zone,
    total_participants integer DEFAULT 0 NOT NULL,
    applied_participants integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    facilitator_id text,
    event_end_datetime timestamp(0) without time zone,
    eventscategory integer
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events_categories (
    id bigint NOT NULL,
    name character varying(255),
    description text,
    deleted character varying(255),
    active character varying(255),
    file character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.events_categories OWNER TO postgres;

--
-- Name: events_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_categories_id_seq OWNER TO postgres;

--
-- Name: events_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_categories_id_seq OWNED BY public.events_categories.id;


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
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


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
-- Name: game_minus_points; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game_minus_points (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    game_id bigint NOT NULL,
    booking_id bigint,
    table_number text,
    points integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.game_minus_points OWNER TO postgres;

--
-- Name: game_minus_points_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.game_minus_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_minus_points_id_seq OWNER TO postgres;

--
-- Name: game_minus_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.game_minus_points_id_seq OWNED BY public.game_minus_points.id;


--
-- Name: game_plus_points; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game_plus_points (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    game_id bigint NOT NULL,
    booking_id bigint,
    table_number text,
    points integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.game_plus_points OWNER TO postgres;

--
-- Name: game_plus_points_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.game_plus_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_plus_points_id_seq OWNER TO postgres;

--
-- Name: game_plus_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.game_plus_points_id_seq OWNED BY public.game_plus_points.id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.games (
    id bigint NOT NULL,
    name character varying(600),
    amount double precision DEFAULT '0'::double precision NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    knowmore text,
    rewards text,
    country_id integer DEFAULT 0 NOT NULL,
    state_id integer DEFAULT 0 NOT NULL,
    city_id integer DEFAULT 0 NOT NULL,
    location character varying(600),
    latitude character varying(600),
    longitude character varying(600),
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    start_date timestamp(0) without time zone,
    enddate timestamp(0) without time zone,
    skill_level_id integer DEFAULT 0 NOT NULL,
    max_number_of_users integer DEFAULT 1 NOT NULL,
    game_type integer DEFAULT 0 NOT NULL,
    number_of_tables integer DEFAULT 0 NOT NULL,
    skilled_professionals text,
    facilitator_id text
);


ALTER TABLE public.games OWNER TO postgres;

--
-- Name: games_amenities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.games_amenities (
    id bigint NOT NULL,
    game_id integer DEFAULT 0 NOT NULL,
    amenitiy_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.games_amenities OWNER TO postgres;

--
-- Name: games_amenities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.games_amenities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_amenities_id_seq OWNER TO postgres;

--
-- Name: games_amenities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.games_amenities_id_seq OWNED BY public.games_amenities.id;


--
-- Name: games_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.games_categories (
    id bigint NOT NULL,
    game_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.games_categories OWNER TO postgres;

--
-- Name: games_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.games_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_categories_id_seq OWNER TO postgres;

--
-- Name: games_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.games_categories_id_seq OWNED BY public.games_categories.id;


--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.games_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_id_seq OWNER TO postgres;

--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- Name: games_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.games_images (
    id bigint NOT NULL,
    game_id integer DEFAULT 0 NOT NULL,
    game_image character varying(600),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.games_images OWNER TO postgres;

--
-- Name: games_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.games_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_images_id_seq OWNER TO postgres;

--
-- Name: games_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.games_images_id_seq OWNED BY public.games_images.id;


--
-- Name: games_rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.games_rules (
    id bigint NOT NULL,
    game_id integer DEFAULT 0 NOT NULL,
    rule_title text,
    rule_description text,
    rule_details text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.games_rules OWNER TO postgres;

--
-- Name: games_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.games_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_rules_id_seq OWNER TO postgres;

--
-- Name: games_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.games_rules_id_seq OWNED BY public.games_rules.id;


--
-- Name: games_time; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.games_time (
    id bigint NOT NULL,
    game_id integer DEFAULT 0 NOT NULL,
    "time" character varying(600),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.games_time OWNER TO postgres;

--
-- Name: games_time_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.games_time_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_time_id_seq OWNER TO postgres;

--
-- Name: games_time_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.games_time_id_seq OWNED BY public.games_time.id;


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
-- Name: instruction_manual; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instruction_manual (
    id bigint NOT NULL,
    name character varying(600),
    file character varying(600),
    description text,
    amount double precision DEFAULT '0'::double precision NOT NULL,
    active integer DEFAULT 0 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    manual_category_id bigint
);


ALTER TABLE public.instruction_manual OWNER TO postgres;

--
-- Name: instruction_manual_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instruction_manual_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instruction_manual_id_seq OWNER TO postgres;

--
-- Name: instruction_manual_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instruction_manual_id_seq OWNED BY public.instruction_manual.id;


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
-- Name: manual_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manual_categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    deleted character varying(255) NOT NULL,
    active character varying(255) NOT NULL,
    file character varying(255),
    game_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.manual_categories OWNER TO postgres;

--
-- Name: manual_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.manual_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.manual_categories_id_seq OWNER TO postgres;

--
-- Name: manual_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.manual_categories_id_seq OWNED BY public.manual_categories.id;


--
-- Name: manual_downloads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manual_downloads (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    manual_id integer NOT NULL,
    amount double precision DEFAULT '0'::double precision NOT NULL,
    grand_total double precision DEFAULT '0'::double precision NOT NULL,
    payment_mode integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    payment_status integer DEFAULT 0 NOT NULL,
    payment_ref character varying(255)
);


ALTER TABLE public.manual_downloads OWNER TO postgres;

--
-- Name: manual_downloads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.manual_downloads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.manual_downloads_id_seq OWNER TO postgres;

--
-- Name: manual_downloads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.manual_downloads_id_seq OWNED BY public.manual_downloads.id;


--
-- Name: membership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.membership (
    id bigint NOT NULL,
    name character varying(600),
    description text,
    amount character varying(600),
    type integer DEFAULT 0 NOT NULL,
    image character varying(600),
    active integer DEFAULT 0 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.membership OWNER TO postgres;

--
-- Name: membership_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.membership_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.membership_id_seq OWNER TO postgres;

--
-- Name: membership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.membership_id_seq OWNED BY public.membership.id;


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
    transaction_id character varying(255),
    invoice_id integer DEFAULT 0 NOT NULL,
    transaction_details text,
    payment_status integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    booking_type integer DEFAULT 0 NOT NULL
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
    amount character varying(600),
    payment_ref character varying(600),
    payment_id character varying(600),
    membership_id integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
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
-- Name: review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    rating double precision DEFAULT '0'::double precision NOT NULL,
    reviews text,
    game_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    event_id integer DEFAULT 0 NOT NULL,
    booking_id integer DEFAULT 0 NOT NULL,
    review_title character varying(255)
);


ALTER TABLE public.review OWNER TO postgres;

--
-- Name: review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_id_seq OWNER TO postgres;

--
-- Name: review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.review_id_seq OWNED BY public.review.id;


--
-- Name: room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room (
    id bigint NOT NULL,
    name character varying(600),
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    event_id bigint,
    facilitator_id text,
    facilitators_count integer DEFAULT 0 NOT NULL
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
-- Name: shangai_bonus_points; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shangai_bonus_points (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(255),
    banner_image character varying(255),
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.shangai_bonus_points OWNER TO postgres;

--
-- Name: shangai_bonus_points_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shangai_bonus_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shangai_bonus_points_id_seq OWNER TO postgres;

--
-- Name: shangai_bonus_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shangai_bonus_points_id_seq OWNED BY public.shangai_bonus_points.id;


--
-- Name: shangai_buys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shangai_buys (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(255),
    banner_image character varying(255),
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.shangai_buys OWNER TO postgres;

--
-- Name: shangai_buys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shangai_buys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shangai_buys_id_seq OWNER TO postgres;

--
-- Name: shangai_buys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shangai_buys_id_seq OWNED BY public.shangai_buys.id;


--
-- Name: shangai_hands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shangai_hands (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(255),
    banner_image character varying(255),
    active boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.shangai_hands OWNER TO postgres;

--
-- Name: shangai_hands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shangai_hands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shangai_hands_id_seq OWNER TO postgres;

--
-- Name: shangai_hands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shangai_hands_id_seq OWNED BY public.shangai_hands.id;


--
-- Name: shangai_round; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shangai_round (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    game_id bigint NOT NULL,
    booking_id bigint NOT NULL,
    buy character varying(255) NOT NULL,
    round character varying(255) NOT NULL,
    hand character varying(255) NOT NULL,
    bonus_points character varying(255) NOT NULL,
    score character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.shangai_round OWNER TO postgres;

--
-- Name: shangai_round_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shangai_round_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shangai_round_id_seq OWNER TO postgres;

--
-- Name: shangai_round_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shangai_round_id_seq OWNED BY public.shangai_round.id;


--
-- Name: skill_level; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skill_level (
    id bigint NOT NULL,
    name character varying(600),
    active integer DEFAULT 0 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.skill_level OWNER TO postgres;

--
-- Name: skill_level_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skill_level_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skill_level_id_seq OWNER TO postgres;

--
-- Name: skill_level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skill_level_id_seq OWNED BY public.skill_level.id;


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
-- Name: table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."table" (
    id bigint NOT NULL,
    name character varying(600),
    active integer DEFAULT 0 NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public."table" OWNER TO postgres;

--
-- Name: table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_id_seq OWNER TO postgres;

--
-- Name: table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.table_id_seq OWNED BY public."table".id;


--
-- Name: temp_booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_booking (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    event_id integer DEFAULT 0 NOT NULL,
    game_id integer DEFAULT 0 NOT NULL,
    payment_ref text NOT NULL,
    num_of_seats integer DEFAULT 0 NOT NULL,
    payment_mode integer DEFAULT 0 NOT NULL,
    item_amount double precision DEFAULT '0'::double precision NOT NULL,
    grand_total double precision DEFAULT '0'::double precision NOT NULL,
    booking_date timestamp(0) without time zone,
    seat_position character varying(255),
    timeslot_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    payment_status integer DEFAULT 0 NOT NULL,
    booking_type integer DEFAULT 1 NOT NULL,
    slot_ids text,
    table_no character varying(255),
    names text,
    player_no character varying(255)
);


ALTER TABLE public.temp_booking OWNER TO postgres;

--
-- Name: temp_booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_booking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_booking_id_seq OWNER TO postgres;

--
-- Name: temp_booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_booking_id_seq OWNED BY public.temp_booking.id;


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
    updated_at timestamp(0) without time zone,
    country_id integer DEFAULT 0 NOT NULL,
    user_name character varying(600),
    dob character varying(600),
    skill_level integer DEFAULT 0 NOT NULL,
    step integer DEFAULT 0 NOT NULL,
    user_type integer DEFAULT 0 NOT NULL,
    attachement character varying(600)
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
    building character varying(600),
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
-- Name: user_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_settings (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    booking_confirmed_push integer DEFAULT 0 NOT NULL,
    booking_reminder_push integer DEFAULT 0 NOT NULL,
    promotional_alert_push integer DEFAULT 0 NOT NULL,
    winner_alert_push integer DEFAULT 0 NOT NULL,
    booking_confirmed_email integer DEFAULT 0 NOT NULL,
    booking_reminder_email integer DEFAULT 0 NOT NULL,
    promotional_alert_email integer DEFAULT 0 NOT NULL,
    winner_alert_email integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_settings OWNER TO postgres;

--
-- Name: user_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_settings_id_seq OWNER TO postgres;

--
-- Name: user_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_settings_id_seq OWNED BY public.user_settings.id;


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
    skill_level character varying(600),
    step integer DEFAULT 0 NOT NULL,
    membership_type integer DEFAULT 0 NOT NULL,
    membership_expiry timestamp(0) without time zone,
    user_type integer DEFAULT 0 NOT NULL,
    attachement character varying(600),
    membership_status character varying(255)
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
-- Name: amenities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amenities ALTER COLUMN id SET DEFAULT nextval('public.amenities_id_seq'::regclass);


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
-- Name: booking_seats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_seats ALTER COLUMN id SET DEFAULT nextval('public.booking_seats_id_seq'::regclass);


--
-- Name: booking_time_slots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_time_slots ALTER COLUMN id SET DEFAULT nextval('public.booking_time_slots_id_seq'::regclass);


--
-- Name: brand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand ALTER COLUMN id SET DEFAULT nextval('public.brand_id_seq'::regclass);


--
-- Name: breeds id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.breeds ALTER COLUMN id SET DEFAULT nextval('public.breeds_id_seq'::regclass);


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
-- Name: coach_activity_prices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coach_activity_prices ALTER COLUMN id SET DEFAULT nextval('public.coach_activity_prices_id_seq'::regclass);


--
-- Name: coach_booking id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coach_booking ALTER COLUMN id SET DEFAULT nextval('public.coach_booking_id_seq'::regclass);


--
-- Name: coach_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coach_locations ALTER COLUMN id SET DEFAULT nextval('public.coach_locations_id_seq'::regclass);


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
-- Name: event_amenity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_amenity ALTER COLUMN id SET DEFAULT nextval('public.event_amenity_id_seq'::regclass);


--
-- Name: event_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_images ALTER COLUMN id SET DEFAULT nextval('public.event_images_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: events_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events_categories ALTER COLUMN id SET DEFAULT nextval('public.events_categories_id_seq'::regclass);


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
-- Name: game_minus_points id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_minus_points ALTER COLUMN id SET DEFAULT nextval('public.game_minus_points_id_seq'::regclass);


--
-- Name: game_plus_points id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_plus_points ALTER COLUMN id SET DEFAULT nextval('public.game_plus_points_id_seq'::regclass);


--
-- Name: games id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- Name: games_amenities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games_amenities ALTER COLUMN id SET DEFAULT nextval('public.games_amenities_id_seq'::regclass);


--
-- Name: games_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games_categories ALTER COLUMN id SET DEFAULT nextval('public.games_categories_id_seq'::regclass);


--
-- Name: games_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games_images ALTER COLUMN id SET DEFAULT nextval('public.games_images_id_seq'::regclass);


--
-- Name: games_rules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games_rules ALTER COLUMN id SET DEFAULT nextval('public.games_rules_id_seq'::regclass);


--
-- Name: games_time id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games_time ALTER COLUMN id SET DEFAULT nextval('public.games_time_id_seq'::regclass);


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
-- Name: instruction_manual id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instruction_manual ALTER COLUMN id SET DEFAULT nextval('public.instruction_manual_id_seq'::regclass);


--
-- Name: insurance_providers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurance_providers ALTER COLUMN id SET DEFAULT nextval('public.insurance_providers_id_seq'::regclass);


--
-- Name: manual_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manual_categories ALTER COLUMN id SET DEFAULT nextval('public.manual_categories_id_seq'::regclass);


--
-- Name: manual_downloads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manual_downloads ALTER COLUMN id SET DEFAULT nextval('public.manual_downloads_id_seq'::regclass);


--
-- Name: membership id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membership ALTER COLUMN id SET DEFAULT nextval('public.membership_id_seq'::regclass);


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
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- Name: review id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review ALTER COLUMN id SET DEFAULT nextval('public.review_id_seq'::regclass);


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
-- Name: shangai_bonus_points id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shangai_bonus_points ALTER COLUMN id SET DEFAULT nextval('public.shangai_bonus_points_id_seq'::regclass);


--
-- Name: shangai_buys id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shangai_buys ALTER COLUMN id SET DEFAULT nextval('public.shangai_buys_id_seq'::regclass);


--
-- Name: shangai_hands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shangai_hands ALTER COLUMN id SET DEFAULT nextval('public.shangai_hands_id_seq'::regclass);


--
-- Name: shangai_round id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shangai_round ALTER COLUMN id SET DEFAULT nextval('public.shangai_round_id_seq'::regclass);


--
-- Name: skill_level id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill_level ALTER COLUMN id SET DEFAULT nextval('public.skill_level_id_seq'::regclass);


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
-- Name: table id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."table" ALTER COLUMN id SET DEFAULT nextval('public.table_id_seq'::regclass);


--
-- Name: temp_booking id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_booking ALTER COLUMN id SET DEFAULT nextval('public.temp_booking_id_seq'::regclass);


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
-- Name: user_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_settings ALTER COLUMN id SET DEFAULT nextval('public.user_settings_id_seq'::regclass);


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
1	Marchal Arts		0	2024-03-25 20:03:17	2024-03-25 20:03:17
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
-- Data for Name: amenities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.amenities (id, name, description, active, deleted, created_at, updated_at) FROM stdin;
1	Wifi	Amenities	1	0	2024-03-25 20:01:48	2024-04-10 12:04:50
6	Free Parking	Now you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved	1	0	2024-04-08 09:43:27	2024-04-10 12:05:38
5	Coffee Maker	Now you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved	1	0	2024-04-08 09:43:13	2024-04-10 12:06:36
4	Restaurant	Now you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved	1	0	2024-04-08 09:43:00	2024-04-10 12:07:20
2	Trasnsportation	Amenities	1	0	2024-03-25 20:01:59	2024-04-10 12:07:38
3	Rooftop	Amenities	1	0	2024-03-25 20:02:09	2024-04-10 12:08:16
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
3		17125546516613829bb2f9d_banner.png	1	1	0	2024-04-08 05:43:52	2024-04-08 05:43:52	3	0	0	0
2		1712554577661382510c5fc_banner.png	1	1	0	2024-04-08 05:44:14	2024-04-08 05:44:14	2	0	0	0
4		1712555444661385b44d487_banner.png	1	1	0	2024-04-08 05:50:44	\N	1	0	0	0
5		1712555465661385c9e80cc_banner.png	1	1	0	2024-04-08 05:51:05	\N	4	0	0	0
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

COPY public.articles (id, title_en, title_ar, status, desc_en, desc_ar, meta_title, meta_keyword, meta_description, created_at, updated_at, "UID") FROM stdin;
2	Terms and Conditions		1	<p>Test terms &amp; conditions..</p>		\N	\N	\N	2024-04-08 04:08:19	2024-04-08 04:08:19	TERMS_CONDITIONS
3	Refund Policy		1	<p>test refund policy</p>		\N	\N	\N	2024-04-09 11:37:35	2024-04-09 11:37:35	REFUND_POLICY
4	Rules		1	<p>Test rules</p>		\N	\N	\N	2024-04-09 11:38:39	2024-04-09 11:38:39	RULES
5	Vitiations		1	<p>Test&nbsp;Vitiations</p>		\N	\N	\N	2024-04-09 11:39:17	2024-04-09 11:39:17	VITIATIONS
1	About us		1	<p>About us&nbsp;</p>		\N	\N	\N	2024-03-25 21:25:41	2024-04-14 15:14:40	ABOUT_US
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

COPY public.booking (id, user_id, event_id, game_id, num_of_seats, payment_mode, item_amount, grand_total, booking_date, seat_position, timeslot_id, status, created_at, updated_at, payment_ref, booking_type, table_number, table_no) FROM stdin;
1	4	0	1	1	1	100	200	2024-02-29 00:00:00	W	128	0	2024-03-26 14:50:02	2024-03-26 14:50:02	pi_3OybJZBjsMxFtgBe1aaBg2Sy_secret_DHlmxY1eca32QaYvdnkFKSPXR	0	\N	\N
2	4	0	1	1	1	100	200	2024-02-29 00:00:00	W	128	0	2024-03-26 15:42:54	2024-03-26 15:42:54	pi_3Oyc8xBjsMxFtgBe0voiQEEY_secret_ZhMOzeyEo6ur1Xe8q4T0K89Xx	0	\N	\N
3	6	0	1	1	1	100	100	2024-03-26 00:00:00	\N	1	0	2024-03-26 16:23:22	2024-03-26 16:23:22	pi_3Oycm8BjsMxFtgBe1TSAKjSY_secret_Z0MqB1CJPnbf9RQn1CSj5SSI5	0	\N	\N
4	4	0	1	1	1	100	200	2024-02-29 00:00:00	W	128	0	2024-03-27 07:54:15	2024-03-27 07:54:15	pi_3OyrInBjsMxFtgBe1OJ8EpFK_secret_VC6Kk3vStRcYom8JmC8vSXBxg	0	\N	\N
5	4	0	1	1	1	100	200	2024-02-29 00:00:00	W	128	0	2024-03-27 08:01:03	2024-03-27 08:01:03	pi_3OyrInBjsMxFtgBe1OJ8EpFK_secret_VC6Kk3vStRcYom8JmC8vSXBxg	0	\N	\N
6	4	0	1	1	1	100	200	2024-02-29 00:00:00	W	128	0	2024-03-27 08:04:41	2024-03-27 08:04:41	pi_3OyrInBjsMxFtgBe1OJ8EpFK_secret_VC6Kk3vStRcYom8JmC8vSXBxg	0	\N	Table 1
10	4	0	2	1	1	100	200	2024-02-29 00:00:00	W	5	0	2024-03-27 08:13:59	2024-03-27 08:13:59	pi_3OyrcGBjsMxFtgBe0KGgFZ1I_secret_dOQjNHeheCzbvm8f1uVVI6e81	0	\N	Table1 2
12	4	0	2	1	1	100	200	2024-02-29 00:00:00	W	5	0	2024-03-27 08:28:03	2024-03-27 08:28:03	pi_3OyrcGBjsMxFtgBe0KGgFZ1I_secret_dOQjNHeheCzbvm8f1uVVI6e81	0	\N	Table1 2
13	4	0	2	1	1	100	200	2024-02-29 00:00:00	W	5	0	2024-03-27 08:28:07	2024-03-27 08:28:07	pi_3OyrcGBjsMxFtgBe0KGgFZ1I_secret_dOQjNHeheCzbvm8f1uVVI6e81	0	\N	Table1 2
14	4	0	2	1	1	100	200	2024-02-29 00:00:00	W	5	0	2024-03-27 08:28:09	2024-03-27 08:28:09	pi_3OyrcGBjsMxFtgBe0KGgFZ1I_secret_dOQjNHeheCzbvm8f1uVVI6e81	0	\N	Table1 2
15	5	0	1	1	1	100	100	2024-03-29 00:00:00	S	2	0	2024-03-28 01:24:51	2024-03-28 01:24:51	pi_3Oz7hRBjsMxFtgBe1F2ZMBm1_secret_lDDiVufcBPvO9HHIEusrnSmmh	0	\N	Table 1
16	5	0	1	1	1	100	100	2024-03-29 00:00:00	E	3	0	2024-03-28 01:31:38	2024-03-28 01:31:38	pi_3Oz7nHBjsMxFtgBe1AZ0vngo_secret_coXUinCL6pIDelV1eN2ZzEKPq	0	\N	Table 1
17	6	0	1	1	1	100	100	2024-03-28 00:00:00	N	4	0	2024-03-28 05:38:33	2024-03-28 05:38:33	pi_3OzBfHBjsMxFtgBe054fbMdE_secret_qcE8yYmtvi08lwiRGPxH9QUjL	0	\N	Table 1
18	6	0	5	1	1	100	100	2024-03-28 00:00:00	N	44	0	2024-03-28 07:12:45	2024-03-28 07:12:45	pi_3OzD80BjsMxFtgBe1hZ9Whev_secret_biL27AShqIMQZZ4cJ54TebI2j	0	\N	Table 1
19	6	0	6	1	1	100	100	2024-03-28 00:00:00	\N	58	0	2024-03-28 07:15:37	2024-03-28 07:15:37	pi_3OzDBABjsMxFtgBe00PBDAys_secret_quMAEeW92ZWXuwCznsQChrTtd	0	\N	\N
20	7	0	6	1	1	100	100	2024-03-28 00:00:00	W	58	0	2024-03-28 07:23:08	2024-03-28 07:23:08	pi_3OzDIUBjsMxFtgBe0WvilFJk_secret_3zIZs2CyxEE8NW1BifCBhb2yJ	0	\N	\N
21	7	0	5	1	1	100	100	2024-03-28 00:00:00	W	45	0	2024-03-28 07:24:10	2024-03-28 07:24:10	pi_3OzDJWBjsMxFtgBe1Vd509w7_secret_SVLAtFdbaysHEtVr9qqmTJyUP	0	\N	Table 1
22	8	0	5	1	1	100	100	2024-03-28 00:00:00	E	48	0	2024-03-28 08:47:31	2024-03-28 08:47:31	pi_3OzEc6BjsMxFtgBe1mLzwNnx_secret_U1T1Dl77KwmPrA1JjO90ZWWOH	0	\N	Table 2
23	8	0	6	1	1	100	100	2024-03-28 00:00:00	S	58	0	2024-03-28 09:03:31	2024-03-28 09:03:31	pi_3OzEraBjsMxFtgBe0fcfJggq_secret_vZnxDTvmfAqzwG9llS7FFpQje	0	\N	Table 2
24	10	0	6	1	1	100	100	2024-03-28 00:00:00	E	57	0	2024-03-28 10:33:36	2024-03-28 10:33:36	pi_3OzGGdBjsMxFtgBe0R3jIxqX_secret_9YyyqQxWaH8IJY1ETOQB6RdpA	0	\N	\N
25	10	0	6	1	1	100	100	2024-03-28 00:00:00	S	57	0	2024-03-28 11:08:00	2024-03-28 11:08:00	pi_3OzGnpBjsMxFtgBe0UKGUGyG_secret_xlqE64yjS6bS9tL3oDEaTRloP	0	\N	\N
26	10	0	2	1	1	100	200	2024-02-29 00:00:00	E,W	5	0	2024-03-29 11:25:11	2024-03-29 11:25:11	pi_3OzdYCBjsMxFtgBe1wnBjsz6_secret_zgUujhQUzAj1OnbUjvzz0WDqh	0	\N	Table1 2
27	5	0	5	1	1	100	200	2024-03-29 00:00:00	E,N	46	0	2024-03-29 16:19:25	2024-03-29 16:19:25	pi_3Ozi8TBjsMxFtgBe0leq0S2d_secret_4MxkXCPWe6gR60NzAo1WJ4boI	0	\N	Table 1
28	5	0	5	1	1	100	100	2024-03-30 00:00:00	W	51	0	2024-03-29 23:37:37	2024-03-29 23:37:37	pi_3OzoyhBjsMxFtgBe0m1zIFYE_secret_WDn6uDGg4c4ZqcOqDoGsDek7M	0	\N	Table 1
29	5	0	6	1	1	100	100	2024-03-31 00:00:00	N	58	0	2024-03-29 23:39:19	2024-03-29 23:39:19	pi_3Ozp0XBjsMxFtgBe1v6DCXRr_secret_dLjMOKpJ9qqu12w19VZtB26yz	0	\N	Table 1
30	5	0	6	1	1	100	100	2024-03-31 00:00:00	E	59	0	2024-03-30 16:57:40	2024-03-30 16:57:40	pi_3P05DPBjsMxFtgBe1OEgUGta_secret_nhJXKuGVAWXJ526czCRBQFR9H	0	\N	Table 2
31	10	0	2	1	1	100	200	2024-02-29 00:00:00	E,W	5	0	2024-03-31 16:48:35	2024-03-31 16:48:35	pi_3P0RYFBjsMxFtgBe0Y3jSSxS_secret_K6HUrw7kbao5t3JrqNwRPymPF	0	\N	Table1 2
32	10	0	7	1	1	4	8	2024-02-29 00:00:00	E,W	5	0	2024-03-31 17:15:11	2024-03-31 17:15:11	pi_3P0RxIBjsMxFtgBe0YVrqXCD_secret_fkuMK2QBn81X3Ns1HWoqRwcTy	0	\N	Table1 2
33	10	0	7	1	1	4	8	2024-02-29 00:00:00	\N	5	0	2024-03-31 17:16:41	2024-03-31 17:16:41	pi_3P0RzWBjsMxFtgBe1CbunRaM_secret_W6OocsX0Fe9dTHDYzLTLtAqQh	0	\N	Table1
34	10	0	7	1	1	4	8	2024-02-29 00:00:00	\N	5	0	2024-03-31 17:20:38	2024-03-31 17:20:38	pi_3P0S3MBjsMxFtgBe143xB47L_secret_gTChTmRRGq7yLxwCAiXDs3baX	0	\N	Table1
39	10	0	7	1	1	4	8	2024-02-29 00:00:00	\N	5	0	2024-03-31 17:36:16	2024-03-31 17:36:16	pi_3P0SGgBjsMxFtgBe0FMKkrGh_secret_awk17GSp8tY4zotKDgMDNfcEF	0	\N	Table1
40	10	0	7	1	1	4	8	2024-02-29 00:00:00	\N	5	0	2024-03-31 17:42:41	2024-03-31 17:42:41	pi_3P0SOjBjsMxFtgBe0sKJnJjg_secret_Y9U47jJVJ399uKNpFOjAesqxc	0	\N	test1
41	10	0	7	1	1	4	8	2024-02-29 00:00:00	\N	5	0	2024-03-31 17:46:26	2024-03-31 17:46:26	pi_3P0SSTBjsMxFtgBe0bx1LEpa_secret_D42jfsfNurJlGjKtBgOSdBFri	0	\N	test1
42	5	0	7	1	1	4	8	2024-04-02 00:00:00	\N	63	0	2024-03-31 21:01:27	2024-03-31 21:01:27	pi_3P0VUwBjsMxFtgBe0p7szvt6_secret_BDuRBucGasfQqeVOPdelIaajO	0	\N	Table 1
43	5	0	7	1	1	4	4	2024-04-10 00:00:00	\N	64	0	2024-03-31 22:52:36	2024-03-31 22:52:36	pi_3P0XEMBjsMxFtgBe0YjyqwEP_secret_DX9i2cmRWLmAyL63bM3Z2wxRa	0	\N	Table 1
44	5	0	7	1	1	4	8	2024-04-04 00:00:00	\N	62	0	2024-03-31 22:53:54	2024-03-31 22:53:54	pi_3P0XFkBjsMxFtgBe1EzRjNnx_secret_0N9pJDqErbFCodVBg7inzrfff	0	\N	Table 1
45	5	0	5	1	1	100	100	2024-04-03 00:00:00	S	48	0	2024-03-31 22:56:11	2024-03-31 22:56:11	pi_3P0XHvBjsMxFtgBe1ARdZBVS_secret_SbRbL6ZZmW3jR38vfy8p9qLxf	0	\N	Table 1
46	5	0	6	1	1	100	100	2024-04-03 00:00:00	W	57	0	2024-04-01 07:25:52	2024-04-01 07:25:52	pi_3P0fF5BjsMxFtgBe0jca26nV_secret_Mmh9389Dt0B2y3JBkKJgRR1n4	0	\N	Table 1
47	5	0	7	1	1	4	4	2024-04-02 00:00:00	\N	65	0	2024-04-01 07:27:42	2024-04-01 07:27:42	pi_3P0fGjBjsMxFtgBe0yt54MFN_secret_Ry36fjxcWpmFlVJ7x515r1kuA	0	\N	Table 3
48	5	0	5	1	1	100	100	2024-04-03 00:00:00	E	47	0	2024-04-01 07:29:01	2024-04-01 07:29:01	pi_3P0fICBjsMxFtgBe1YesobGw_secret_F9gWBUtRNqukvfmHzvwx2Vac6	0	\N	Table 3
49	12	0	6	1	1	100	100	2024-04-01 00:00:00	E	59	0	2024-04-01 10:09:02	2024-04-01 10:09:02	pi_3P0hnFBjsMxFtgBe1y4vRukd_secret_YmvIZlbGpRZ3HuTEXCRuZ73TC	0	\N	Table 1
50	12	0	5	1	1	100	100	2024-04-02 00:00:00	E	84	0	2024-04-01 14:25:18	2024-04-01 14:25:18	pi_3P0lnDBjsMxFtgBe02dbUYhl_secret_JT2PuLmo71VeVe876IWZHLqZ6	0	\N	Table 2
51	12	0	6	1	1	100	100	2024-04-01 00:00:00	N	61	0	2024-04-01 14:26:35	2024-04-01 14:26:35	pi_3P0loWBjsMxFtgBe1KIini85_secret_SyR7HIQ1vGwBIum0B6qm2sSwc	0	\N	Table 2
52	12	0	7	1	1	4	4	2024-04-06 00:00:00	\N	66	0	2024-04-01 14:27:52	2024-04-01 14:27:52	pi_3P0lplBjsMxFtgBe1FzhFa0m_secret_XJTLTIeZ8DpfLCDfdpF6H0y9U	0	\N	Table 1
53	12	0	5	1	1	100	100	2024-04-01 00:00:00	N	87	0	2024-04-01 14:28:47	2024-04-01 14:28:47	pi_3P0lqXBjsMxFtgBe0c1rb3zW_secret_m1filp6elwJjApjzBGJLsF8zr	0	\N	Table 3
54	5	0	5	1	1	100	100	2024-04-02 00:00:00	W	84	0	2024-04-02 18:45:39	2024-04-02 18:45:39	pi_3P1CKeBjsMxFtgBe0027zg3w_secret_WN6zSrvurphzXEoowrFDKljyi	0	\N	Table 3
55	5	0	11	1	1	100	100	2024-04-02 00:00:00	\N	106	0	2024-04-02 23:49:53	2024-04-02 23:49:53	pi_3P1H4uBjsMxFtgBe1iVsVL9H_secret_B6fqxEFzEj91LaE8EB2Ua4T3F	0	\N	Table 1
56	5	0	10	1	1	100	100	2024-04-02 00:00:00	W	101	0	2024-04-03 00:04:35	2024-04-03 00:04:35	pi_3P1HJEBjsMxFtgBe04dLTpxj_secret_TflxpsqpROKZADdplNJ8SxgZw	0	\N	Table 1
57	5	0	10	1	1	100	100	2024-04-02 00:00:00	E	102	0	2024-04-03 00:05:43	2024-04-03 00:05:43	pi_3P1HKQBjsMxFtgBe1RHSARLk_secret_wGCdMyMnriBKLWG20Dd194dFN	0	\N	Table 1
58	5	0	10	1	1	100	100	2024-04-02 00:00:00	N	100	0	2024-04-03 00:06:45	2024-04-03 00:06:45	pi_3P1HLSBjsMxFtgBe0ZMJxZ6l_secret_glSDzyblvbiis73hAXGDKyN4V	0	\N	Table 1
59	5	0	7	1	1	4	8	2024-03-29 00:00:00	\N	67	0	2024-04-03 11:06:18	2024-04-03 11:06:18	pi_3P1RdhBjsMxFtgBe17HYNngF_secret_x7kLgOLjaq6UHrY8ftEnHTeS0	0	\N	Table 1
60	10	0	5	1	1	100	100	2024-04-02 00:00:00	N	89	0	2024-04-03 20:59:55	2024-04-03 20:59:55	pi_3P1atnBjsMxFtgBe0wkymUl8_secret_DtawiUAKiwPHQLPDpc3lQ8Q3q	0	\N	Table 1
61	10	0	9	1	1	100	100	2024-04-02 00:00:00	E	91	0	2024-04-03 21:03:14	2024-04-03 21:03:14	pi_3P1ax9BjsMxFtgBe0yuOfffb_secret_UMtQdT9Vok1H3BANQjN7byRaF	0	\N	Table 1
62	10	3	0	1	1	100	100	\N	\N	0	0	2024-04-03 22:31:49	2024-04-03 22:31:49	pi_3P1cKuBjsMxFtgBe1voN3r33_secret_ghxHTwEL4rIeZQB2qw4mkMeP0	1	\N	\N
63	62	0	9	1	1	100.5	1809	2024-04-09 00:00:00	W,N,S	157	0	2024-04-08 12:04:43	2024-04-08 12:04:43	pi_3P3Gv5BjsMxFtgBe0zNMLDI1_secret_QbmskjTTvYPLJut6yvQDg6Lgp	0	\N	Table 1
64	62	0	9	1	1	100.5	201	2024-04-11 00:00:00	E,N	161	0	2024-04-09 07:17:03	2024-04-09 07:17:03	pi_3P3Yv8BjsMxFtgBe1X0p6g2z_secret_OtFLz9FuLy21C38VIG4imXaJG	0	\N	Table 2
65	68	0	9	1	1	100.5	402	2024-04-11 00:00:00	E,W,N,S	158	0	2024-04-09 10:05:26	2024-04-09 10:05:26	pi_3P3bY1BjsMxFtgBe1lfLY37w_secret_DagAkSHkzNbQFn10MGBYSCqvz	0	\N	Table 3
66	68	0	7	1	1	4	8	2024-03-30 00:00:00	\N	65	0	2024-04-09 10:52:33	2024-04-09 10:52:33	pi_3P3cHdBjsMxFtgBe02WUvdCk_secret_RNxQXWlFlUWXK0j7or6uRcQ9Y	0	\N	Table 3
67	68	0	11	1	1	100	100	2024-04-09 00:00:00	\N	105	0	2024-04-09 10:56:37	2024-04-09 10:56:37	pi_3P3cLaBjsMxFtgBe0xxGNoOW_secret_ZfHbXuQiq5ZXXazfiOvIBwzRq	0	\N	Table 1
68	68	0	11	1	1	100	100	2024-04-10 00:00:00	\N	166	0	2024-04-09 10:57:49	2024-04-09 10:57:49	pi_3P3cMnBjsMxFtgBe0QAmmehB_secret_X3hCgmxzCCSphJ9EUqw9FOD17	0	\N	Table 1
69	12	0	9	1	1	100.5	100.5	2024-04-08 00:00:00	N	160	0	2024-04-09 14:54:09	2024-04-09 14:54:09	pi_3P3g3TBjsMxFtgBe1azOeBSM_secret_eRNIg8gp8IR0w1TZnU7FBeIUU	0	\N	Table 4
70	5	0	10	1	1	100	100	2024-04-11 00:00:00	S	104	0	2024-04-09 21:24:55	2024-04-09 21:24:55	pi_3P3m9eBjsMxFtgBe0w9mNdHu_secret_4UIHwSIZaWNxBy59i0t9TVUCN	0	\N	Table 1
71	5	0	6	1	1	100	200	2024-03-30 00:00:00	W,S	61	0	2024-04-09 22:13:07	2024-04-09 22:13:07	pi_3P3muKBjsMxFtgBe1QYSG69U_secret_bGuJAY0TTthXzcmhgcuTQrgUK	0	\N	Table 2
72	24	0	0	0	0	100	100	\N	\N	0	0	2024-04-09 22:55:23	2024-04-09 22:55:23	pi_3P3nM1BjsMxFtgBe0mVzTm1L_secret_fW8IHh5iaeFIToLDCpjUjvYD4	5	\N	\N
73	24	0	0	0	0	100	100	\N	\N	0	0	2024-04-09 22:55:26	2024-04-09 22:55:26	pi_3P3nM1BjsMxFtgBe0mVzTm1L_secret_fW8IHh5iaeFIToLDCpjUjvYD4	5	\N	\N
74	24	0	0	0	0	100	100	\N	\N	0	0	2024-04-09 22:56:46	2024-04-09 22:56:46	pi_3P3nakBjsMxFtgBe0ZLAggbn_secret_Q3bXMl3kbGAYKFMwvawNs34o8	5	\N	\N
75	24	0	0	0	0	100	100	\N	\N	0	0	2024-04-09 22:58:07	2024-04-09 22:58:07	pi_3P3nc3BjsMxFtgBe0ZWT2GEb_secret_tjHhqVW9A2MYbM9tXjjYrrVEz	5	\N	\N
76	70	4	0	3	1	100	300	\N	\N	0	0	2024-04-10 12:22:35	2024-04-10 12:22:35	pi_3P40A2BjsMxFtgBe1XiBa34c_secret_PprDtOCibx3wHBlhNkpJ1pBXO	1	\N	\N
77	70	0	12	1	1	100	200	2024-04-11 00:00:00	E,N	171	0	2024-04-10 18:26:05	2024-04-10 18:26:05	pi_3P45pZBjsMxFtgBe0iH5ZIzH_secret_0TFOMnlciDqBry7CcoDRScjPH	0	\N	Table 1
78	70	0	16	1	1	100	200	2024-04-13 00:00:00	E,N	198	0	2024-04-10 18:49:17	2024-04-10 18:49:17	pi_3P46C8BjsMxFtgBe10JUHWlw_secret_cHH94iVfJvX4rZMGQAF8PKYdq	0	\N	Table 2
79	70	0	16	1	1	100	200	2024-04-11 00:00:00	E,N	236	0	2024-04-11 03:26:37	2024-04-11 03:26:37	pi_3P4EGxBjsMxFtgBe0RPE5JeU_secret_YAcR8dFxNPvr9xlZg9HZZpOjy	0	\N	Table 1
80	71	0	16	1	1	100	100	2024-04-11 00:00:00	S	237	0	2024-04-12 06:28:16	2024-04-12 06:28:16	pi_3P4daZBjsMxFtgBe1wgXC8Ge_secret_1yTGLWrqIGKnaqPYXVLwOiNoE	0	\N	Table 1
81	5	0	17	1	1	25	25	2024-04-15 00:00:00	S	226	0	2024-04-13 20:10:13	2024-04-13 20:10:13	pi_3P5CtOBjsMxFtgBe1x2YMJq2_secret_qZ2Ns5ydUbmo33iLwskJHYvHN	0	\N	Table 1
82	36	0	6	1	1	100	100	2024-04-17 00:00:00	S	224	0	2024-04-14 18:19:56	2024-04-14 18:19:56	pi_3P5XeFBjsMxFtgBe1SKCPRTn_secret_pQoE6p47BgfguyOMJ3cKqNTzb	0	\N	Table 1
83	62	0	18	1	1	50	50	2024-04-25 00:00:00	\N	244	0	2024-04-15 11:30:43	2024-04-15 11:30:43	pi_3P5njsBjsMxFtgBe01cm6HAJ_secret_FDFIJYrfFgkOMXzsMaGspUqva	0	\N	Table 1
84	62	0	13	1	1	25	25	2024-04-10 00:00:00	S	175	0	2024-04-15 11:34:53	2024-04-15 11:34:53	pi_3P5nnnBjsMxFtgBe0xJGMNlG_secret_XmaCG8xHs57LvVYRiAfasu5lO	0	\N	Table 1
85	75	0	16	1	1	210	210	2024-04-16 00:00:00	W	305	0	2024-04-16 08:29:17	2024-04-16 08:29:17	pi_3P67NqBjsMxFtgBe0N5XapNV_secret_SF6hGZezIImLJAVKg6YPrGafh	0	\N	Table 1
86	53	0	6	1	1	100	100	2024-04-17 00:00:00	W	220	0	2024-04-16 19:03:48	2024-04-16 19:03:48	pi_3P6HHWBjsMxFtgBe0piWCCqG_secret_HFuZqzaocbENxdLUomyJq2s6h	0	\N	Table 1
87	74	0	16	1	1	210	420	2024-04-17 00:00:00	N,S	305	0	2024-04-17 01:39:25	2024-04-17 01:39:25	pi_3P6NScBjsMxFtgBe0XXUsDje_secret_OGmIzafTH7bAD3ShPe1Wp0qdQ	0	\N	Table 1
\.


--
-- Data for Name: booking_seats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_seats (id, booking_id, game_id, table_no, seat_position, created_at, updated_at, name, player_no) FROM stdin;
2	26	2	Table1 2	W	2024-03-29 11:25:11	2024-03-29 11:25:11	asad	\N
8	31	2	Table1 2	E	2024-03-31 16:48:35	2024-03-31 16:48:35	usma	Player 1
9	31	2	Table1 2	W	2024-03-31 16:48:35	2024-03-31 16:48:35	asad	 Player 2
10	32	7	Table1 2	E	2024-03-31 17:15:11	2024-03-31 17:15:11	usma	Player 1
11	32	7	Table1 2	W	2024-03-31 17:15:11	2024-03-31 17:15:11	asad	 Player 2
12	33	7	Table1		2024-03-31 17:16:41	2024-03-31 17:16:41	usma	Player 1
13	34	7	Table1		2024-03-31 17:20:38	2024-03-31 17:20:38	usma	Player 1
14	34	7	Table1		2024-03-31 17:20:38	2024-03-31 17:20:38	usma	Player 1
15	34	7	Table1		2024-03-31 17:20:38	2024-03-31 17:20:38	asad	 Player 2
16	39	7	Table1		2024-03-31 17:36:16	2024-03-31 17:36:16	usama	Player 1
17	39	7	Table1		2024-03-31 17:36:16	2024-03-31 17:36:16	usama	Player 1
18	39	7	Table1		2024-03-31 17:36:16	2024-03-31 17:36:16	 Asad	 Player 2
19	40	7	test1		2024-03-31 17:42:41	2024-03-31 17:42:41	usama	Player 1
20	40	7	test1		2024-03-31 17:42:41	2024-03-31 17:42:41	usama	Player 1
21	40	7	test1		2024-03-31 17:42:41	2024-03-31 17:42:41	 Asad	 Player 2
22	41	7	test1		2024-03-31 17:46:26	2024-03-31 17:46:26	usama	Player 1
23	41	7	test1		2024-03-31 17:46:26	2024-03-31 17:46:26	usama	Player 1
24	41	7	test1		2024-03-31 17:46:26	2024-03-31 17:46:26	 Asad	 Player 2
34	45	5	Table 1		2024-03-31 22:56:11	2024-03-31 22:56:11	asss	
36	46	6	Table 1		2024-04-01 07:25:52	2024-04-01 07:25:52	rana	
37	47	7	Table 3		2024-04-01 07:27:42	2024-04-01 07:27:42	asad	Player 1
38	47	7	Table 3		2024-04-01 07:27:42	2024-04-01 07:27:42	asad	Player 1
40	48	5	Table 3		2024-04-01 07:29:01	2024-04-01 07:29:01	asad	
41	49	6	Table 1	E	2024-04-01 10:09:02	2024-04-01 10:09:02	Usama	
42	49	6	Table 1		2024-04-01 10:09:02	2024-04-01 10:09:02	Usama	
43	50	5	Table 2	E	2024-04-01 14:25:18	2024-04-01 14:25:18	usama	
44	50	5	Table 2		2024-04-01 14:25:18	2024-04-01 14:25:18	usama	
45	51	6	Table 2	N	2024-04-01 14:26:35	2024-04-01 14:26:35	usama	
46	51	6	Table 2		2024-04-01 14:26:35	2024-04-01 14:26:35	usama	
47	52	7	Table 1		2024-04-01 14:27:52	2024-04-01 14:27:52	Usama	Player 6
48	52	7	Table 1		2024-04-01 14:27:52	2024-04-01 14:27:52	Usama	Player 6
49	53	5	Table 3	N	2024-04-01 14:28:47	2024-04-01 14:28:47	usamaa	
50	53	5	Table 3		2024-04-01 14:28:47	2024-04-01 14:28:47	usamaa	
52	54	5	Table 3		2024-04-02 18:45:39	2024-04-02 18:45:39	dxb	
61	59	7	Table 1		2024-04-03 11:06:18	2024-04-03 11:06:18	asad	Player 7
35	46	6	Table 1	W	2024-04-01 07:25:52	2024-04-01 07:25:52	asad	
1	26	2	Table1 2	E	2024-03-29 11:25:11	2024-03-29 11:25:11	usama	Player 1
62	59	7	Table 1		2024-04-03 11:06:18	2024-04-03 11:06:18	asad	Player 7
6	29	6	Table 1	N	2024-03-29 23:39:19	2024-03-29 23:39:19	asad	\N
5	28	5	Table 1	W	2024-03-29 23:37:37	2024-03-29 23:37:37	jjj	\N
75	65	9	Table 3	E	2024-04-09 10:05:26	2024-04-09 10:05:26	NemaiT1E	
3	27	5	Table 1	E	2024-03-29 16:19:25	2024-03-29 16:19:25	iii	\N
63	59	7	Table 1		2024-04-03 11:06:18	2024-04-03 11:06:18	asad	Player 8
31	44	7	Table 1		2024-03-31 22:53:54	2024-03-31 22:53:54	asad	Player 1
33	45	5	Table 1	S	2024-03-31 22:56:11	2024-03-31 22:56:11	bbh	
56	56	10	Table 1		2024-04-03 00:04:35	2024-04-03 00:04:35	asad	
7	30	6	Table 2	E	2024-03-30 16:57:40	2024-03-30 16:57:40	ahmed	\N
58	57	10	Table 1		2024-04-03 00:05:43	2024-04-03 00:05:43	kashi	
60	58	10	Table 1		2024-04-03 00:06:45	2024-04-03 00:06:45	bilal	
64	60	5	Table 1	N	2024-04-03 20:59:55	2024-04-03 20:59:55	ahmad	
65	60	5	Table 1		2024-04-03 20:59:55	2024-04-03 20:59:55	ahmad	
39	48	5	Table 3	E	2024-04-01 07:29:01	2024-04-01 07:29:01	dxb	
51	54	5	Table 3	W	2024-04-02 18:45:39	2024-04-02 18:45:39	dds	
66	61	9	Table 1	E	2024-04-03 21:03:14	2024-04-03 21:03:14	Ahmad	
57	57	10	Table 1	E	2024-04-03 00:05:43	2024-04-03 00:05:43	hhh	
26	42	7	Table 1		2024-03-31 21:01:27	2024-03-31 21:01:27	majid	Player 2
59	58	10	Table 1	N	2024-04-03 00:06:45	2024-04-03 00:06:45	hhh	
67	61	9	Table 1		2024-04-03 21:03:14	2024-04-03 21:03:14	Ahmad	
55	56	10	Table 1	W	2024-04-03 00:04:35	2024-04-03 00:04:35	asad	
27	42	7	Table 1		2024-03-31 21:01:27	2024-03-31 21:01:27	wajid	Player 3
69	63	9	Table 1	N	2024-04-08 12:04:43	2024-04-08 12:04:43	Nemai T1N	
25	42	7	Table 1		2024-03-31 21:01:27	2024-03-31 21:01:27	majid	Player 2
53	55	11	Table 1		2024-04-02 23:49:53	2024-04-02 23:49:53	asad	Player 1
54	55	11	Table 1		2024-04-02 23:49:53	2024-04-02 23:49:53	asad	Player 1
4	27	5	Table 1	E	2024-03-29 16:19:25	2024-03-29 16:19:25	asad	\N
30	44	7	Table 1		2024-03-31 22:53:54	2024-03-31 22:53:54	asad	Player 1
70	63	9	Table 1	S	2024-04-08 12:04:43	2024-04-08 12:04:43	Nemai T1S	
71	63	9	Table 1		2024-04-08 12:04:43	2024-04-08 12:04:43	Nemai T1W	
28	43	7	Table 1		2024-03-31 22:52:36	2024-03-31 22:52:36	abc	Player 4
76	65	9	Table 3	W	2024-04-09 10:05:26	2024-04-09 10:05:26	NemaiT1W	
68	63	9	Table 1	W	2024-04-08 12:04:43	2024-04-08 12:04:43	NemaiT1W	
29	43	7	Table 1		2024-03-31 22:52:36	2024-03-31 22:52:36	abc	Player 4
72	64	9	Table 2	E	2024-04-09 07:17:03	2024-04-09 07:17:03	NemaiT1W 	
32	44	7	Table 1		2024-03-31 22:53:54	2024-03-31 22:53:54	asdf	Player 5
73	64	9	Table 2	N	2024-04-09 07:17:03	2024-04-09 07:17:03	NemaiT1W ok	
74	64	9	Table 2		2024-04-09 07:17:03	2024-04-09 07:17:03	NemaiT1W 	
77	65	9	Table 3	N	2024-04-09 10:05:26	2024-04-09 10:05:26	NemaiT1N	
78	65	9	Table 3	S	2024-04-09 10:05:26	2024-04-09 10:05:26	NemaiT1S	
79	65	9	Table 3		2024-04-09 10:05:26	2024-04-09 10:05:26	NemaiT1E	
80	66	7	Table 3		2024-04-09 10:52:33	2024-04-09 10:52:33	Nemai	Player 2
81	66	7	Table 3		2024-04-09 10:52:33	2024-04-09 10:52:33	Nemai	Player 2
82	66	7	Table 3		2024-04-09 10:52:33	2024-04-09 10:52:33	Nemai2	Player 3
83	67	11	Table 1		2024-04-09 10:56:37	2024-04-09 10:56:37	Nemai1	Player 2
84	67	11	Table 1		2024-04-09 10:56:37	2024-04-09 10:56:37	Nemai1	Player 2
85	68	11	Table 1		2024-04-09 10:57:49	2024-04-09 10:57:49	Nemai3	Player 3
86	68	11	Table 1		2024-04-09 10:57:49	2024-04-09 10:57:49	Nemai3	Player 3
87	69	9	Table 4	N	2024-04-09 14:54:09	2024-04-09 14:54:09	Usama	
88	69	9	Table 4		2024-04-09 14:54:09	2024-04-09 14:54:09	Usama	
90	70	10	Table 1		2024-04-09 21:24:55	2024-04-09 21:24:55	asad	
91	71	6	Table 2	W	2024-04-09 22:13:07	2024-04-09 22:13:07	wajid	
92	71	6	Table 2	S	2024-04-09 22:13:07	2024-04-09 22:13:07	asad	
93	71	6	Table 2		2024-04-09 22:13:07	2024-04-09 22:13:07	wajid	
94	77	12	Table 1	E	2024-04-10 18:26:05	2024-04-10 18:26:05	Anil	
95	77	12	Table 1	N	2024-04-10 18:26:05	2024-04-10 18:26:05	Ajesh	
96	77	12	Table 1		2024-04-10 18:26:05	2024-04-10 18:26:05	Anil	
97	78	16	Table 2	E	2024-04-10 18:49:17	2024-04-10 18:49:17	Anil	
98	78	16	Table 2	N	2024-04-10 18:49:17	2024-04-10 18:49:17	Ajesh	
99	78	16	Table 2		2024-04-10 18:49:17	2024-04-10 18:49:17	Anil	
100	79	16	Table 1	E	2024-04-11 03:26:37	2024-04-11 03:26:37	anil	
101	79	16	Table 1	N	2024-04-11 03:26:37	2024-04-11 03:26:37	sunil	
102	79	16	Table 1		2024-04-11 03:26:37	2024-04-11 03:26:37	anil	
103	80	16	Table 1	S	2024-04-12 06:28:16	2024-04-12 06:28:16	sooraj	
104	80	16	Table 1		2024-04-12 06:28:16	2024-04-12 06:28:16	sooraj	
106	81	17	Table 1		2024-04-13 20:10:13	2024-04-13 20:10:13	asad	
107	82	6	Table 1	S	2024-04-14 18:19:56	2024-04-14 18:19:56	abc	
108	82	6	Table 1		2024-04-14 18:19:56	2024-04-14 18:19:56	abc	
109	83	18	Table 1		2024-04-15 11:30:43	2024-04-15 11:30:43	nema	Player 1
110	83	18	Table 1		2024-04-15 11:30:43	2024-04-15 11:30:43	nema	Player 1
111	84	13	Table 1	S	2024-04-15 11:34:54	2024-04-15 11:34:54	Nemai3	
112	84	13	Table 1		2024-04-15 11:34:54	2024-04-15 11:34:54	Nemai3	
89	70	10	Table 1	S	2024-04-09 21:24:55	2024-04-09 21:24:55	usama	
105	81	17	Table 1	S	2024-04-13 20:10:13	2024-04-13 20:10:13	abc	
113	85	16	Table 1	W	2024-04-16 08:29:17	2024-04-16 08:29:17	ahmaddxba	
114	85	16	Table 1		2024-04-16 08:29:17	2024-04-16 08:29:17	ahmaddxba	
115	86	6	Table 1	W	2024-04-16 19:03:48	2024-04-16 19:03:48	Zain	
116	86	6	Table 1		2024-04-16 19:03:48	2024-04-16 19:03:48	Zain	
117	87	16	Table 1	N	2024-04-17 01:39:25	2024-04-17 01:39:25	asad	
118	87	16	Table 1	S	2024-04-17 01:39:25	2024-04-17 01:39:25	abc	
119	87	16	Table 1		2024-04-17 01:39:25	2024-04-17 01:39:25	asad	
\.


--
-- Data for Name: booking_time_slots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_time_slots (id, booking_id, game_id, slot_id, created_at, updated_at) FROM stdin;
1	1	1	128	2024-03-26 14:50:02	2024-03-26 14:50:02
2	1	1	129	2024-03-26 14:50:02	2024-03-26 14:50:02
3	2	1	128	2024-03-26 15:42:54	2024-03-26 15:42:54
4	2	1	129	2024-03-26 15:42:54	2024-03-26 15:42:54
5	3	1	1	2024-03-26 16:23:22	2024-03-26 16:23:22
6	4	1	128	2024-03-27 07:54:15	2024-03-27 07:54:15
7	4	1	129	2024-03-27 07:54:15	2024-03-27 07:54:15
8	5	1	128	2024-03-27 08:01:03	2024-03-27 08:01:03
9	5	1	129	2024-03-27 08:01:03	2024-03-27 08:01:03
10	6	1	128	2024-03-27 08:04:41	2024-03-27 08:04:41
11	6	1	129	2024-03-27 08:04:41	2024-03-27 08:04:41
12	10	2	5	2024-03-27 08:13:59	2024-03-27 08:13:59
13	10	2	6	2024-03-27 08:13:59	2024-03-27 08:13:59
14	12	2	5	2024-03-27 08:28:03	2024-03-27 08:28:03
15	12	2	6	2024-03-27 08:28:03	2024-03-27 08:28:03
16	13	2	5	2024-03-27 08:28:07	2024-03-27 08:28:07
17	13	2	6	2024-03-27 08:28:07	2024-03-27 08:28:07
18	14	2	5	2024-03-27 08:28:09	2024-03-27 08:28:09
19	14	2	6	2024-03-27 08:28:09	2024-03-27 08:28:09
20	15	1	2	2024-03-28 01:24:51	2024-03-28 01:24:51
21	16	1	3	2024-03-28 01:31:38	2024-03-28 01:31:38
22	17	1	4	2024-03-28 05:38:33	2024-03-28 05:38:33
23	18	5	44	2024-03-28 07:12:45	2024-03-28 07:12:45
24	19	6	58	2024-03-28 07:15:37	2024-03-28 07:15:37
25	20	6	58	2024-03-28 07:23:08	2024-03-28 07:23:08
26	21	5	45	2024-03-28 07:24:10	2024-03-28 07:24:10
27	22	5	48	2024-03-28 08:47:31	2024-03-28 08:47:31
28	23	6	58	2024-03-28 09:03:31	2024-03-28 09:03:31
29	24	6	57	2024-03-28 10:33:36	2024-03-28 10:33:36
30	25	6	57	2024-03-28 11:08:00	2024-03-28 11:08:00
31	26	2	5	2024-03-29 11:25:11	2024-03-29 11:25:11
32	27	5	46	2024-03-29 16:19:25	2024-03-29 16:19:25
33	28	5	51	2024-03-29 23:37:37	2024-03-29 23:37:37
34	29	6	58	2024-03-29 23:39:19	2024-03-29 23:39:19
35	30	6	59	2024-03-30 16:57:40	2024-03-30 16:57:40
36	31	2	5	2024-03-31 16:48:35	2024-03-31 16:48:35
37	32	7	5	2024-03-31 17:15:11	2024-03-31 17:15:11
38	33	7	5	2024-03-31 17:16:41	2024-03-31 17:16:41
39	34	7	5	2024-03-31 17:20:38	2024-03-31 17:20:38
44	39	7	5	2024-03-31 17:36:16	2024-03-31 17:36:16
45	40	7	5	2024-03-31 17:42:41	2024-03-31 17:42:41
46	41	7	5	2024-03-31 17:46:26	2024-03-31 17:46:26
47	42	7	63	2024-03-31 21:01:27	2024-03-31 21:01:27
48	43	7	64	2024-03-31 22:52:36	2024-03-31 22:52:36
49	44	7	62	2024-03-31 22:53:54	2024-03-31 22:53:54
50	45	5	48	2024-03-31 22:56:11	2024-03-31 22:56:11
51	46	6	57	2024-04-01 07:25:52	2024-04-01 07:25:52
52	47	7	65	2024-04-01 07:27:42	2024-04-01 07:27:42
53	48	5	47	2024-04-01 07:29:01	2024-04-01 07:29:01
54	49	6	59	2024-04-01 10:09:02	2024-04-01 10:09:02
55	50	5	84	2024-04-01 14:25:18	2024-04-01 14:25:18
56	51	6	61	2024-04-01 14:26:35	2024-04-01 14:26:35
57	52	7	66	2024-04-01 14:27:52	2024-04-01 14:27:52
58	53	5	87	2024-04-01 14:28:47	2024-04-01 14:28:47
59	54	5	84	2024-04-02 18:45:39	2024-04-02 18:45:39
60	55	11	106	2024-04-02 23:49:53	2024-04-02 23:49:53
61	56	10	101	2024-04-03 00:04:35	2024-04-03 00:04:35
62	57	10	102	2024-04-03 00:05:43	2024-04-03 00:05:43
63	58	10	100	2024-04-03 00:06:45	2024-04-03 00:06:45
64	59	7	67	2024-04-03 11:06:18	2024-04-03 11:06:18
65	60	5	89	2024-04-03 20:59:55	2024-04-03 20:59:55
66	61	9	91	2024-04-03 21:03:14	2024-04-03 21:03:14
67	63	9	157	2024-04-08 12:04:43	2024-04-08 12:04:43
68	64	9	161	2024-04-09 07:17:03	2024-04-09 07:17:03
69	65	9	158	2024-04-09 10:05:26	2024-04-09 10:05:26
70	66	7	65	2024-04-09 10:52:33	2024-04-09 10:52:33
71	67	11	105	2024-04-09 10:56:37	2024-04-09 10:56:37
72	68	11	166	2024-04-09 10:57:49	2024-04-09 10:57:49
73	69	9	160	2024-04-09 14:54:09	2024-04-09 14:54:09
74	70	10	104	2024-04-09 21:24:55	2024-04-09 21:24:55
75	71	6	61	2024-04-09 22:13:07	2024-04-09 22:13:07
76	77	12	171	2024-04-10 18:26:05	2024-04-10 18:26:05
77	78	16	198	2024-04-10 18:49:17	2024-04-10 18:49:17
78	79	16	236	2024-04-11 03:26:37	2024-04-11 03:26:37
79	80	16	237	2024-04-12 06:28:16	2024-04-12 06:28:16
80	81	17	226	2024-04-13 20:10:13	2024-04-13 20:10:13
81	82	6	224	2024-04-14 18:19:56	2024-04-14 18:19:56
82	83	18	244	2024-04-15 11:30:43	2024-04-15 11:30:43
83	84	13	175	2024-04-15 11:34:54	2024-04-15 11:34:54
84	85	16	305	2024-04-16 08:29:17	2024-04-16 08:29:17
85	86	6	220	2024-04-16 19:03:48	2024-04-16 19:03:48
86	87	16	305	2024-04-17 01:39:25	2024-04-17 01:39:25
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
4	Shanghai	/uploads/category/6601d76871164_1711396712.png	\N	0	1	0	4	1	1	2024-03-25 19:58:32	2024-03-25 19:58:32	shanghai	0
5	Shopping	/uploads/category/660a81a40231e_1711964580.png	\N	0	0	1	5	1	1	2024-04-01 09:43:00	2024-04-02 09:24:04	shopping	0
1	Bridge	/uploads/category/661387fbd7ed4_1712556027.png	\N	0	1	0	1	1	1	2024-03-25 19:57:36	2024-04-08 06:00:27	bridge	0
3	Rummy	/uploads/category/661388d41e862_1712556244.png	\N	0	1	0	3	1	1	2024-03-25 19:58:14	2024-04-08 06:04:04	rummy	0
2	Mahjong	/uploads/category/661388c0a0011_1712556224.png	\N	0	1	0	2	1	1	2024-03-25 19:57:56	2024-04-08 06:04:19	mahjong	0
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name, active, country_id, state_id, created_uid, updated_uid, deleted, created_at, updated_at) FROM stdin;
1	Dubai	1	1	1	1	\N	0	2024-03-25 20:03:03	2024-03-25 20:03:03
\.


--
-- Data for Name: coach_activity_prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coach_activity_prices (id, user_id, activity_type_id, city_id, price, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: coach_booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coach_booking (id, user_id, booking_date, timslot, booking_datetime, payment_method, amount_paid, payment_status, payment_ref, coach_id, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: coach_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coach_locations (id, user_id, country_id, city_id, state_id, latitude, longitude, location, created_at, updated_at) FROM stdin;
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

COPY public.contact_us_settings (id, title_en, title_ar, email, mobile, desc_en, desc_ar, location, latitude, longitude, twitter, instagram, facebook, youtube, linkedin, created_at, updated_at, website_url, snap_chat, tiktok) FROM stdin;
1	Placeat aliquip aut	Architecto sunt repe	info@gameclinic.com	987654321	Minim ipsum officii	Enim aspernatur quo	673C+W8X - Al Safa St - Dubai - United Arab Emirates	\N	\N	https://google.com	https://google.com	https://google.com	https://google.com	https://google.com	\N	2024-04-09 11:30:34	https://google.com	https://google.com	https://google.com
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, name, prefix, dial_code, active, created_at, updated_at, deleted) FROM stdin;
1	United Arab Emirates	U.A.E	971	1	2024-03-25 20:02:32	2024-04-13 11:40:32	0
3	India	IND	91	1	2024-04-13 11:25:31	2024-04-13 11:40:43	0
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

COPY public.enquiry (id, user_id, type, status, created_at, updated_at, quote_amount) FROM stdin;
\.


--
-- Data for Name: enquiry_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enquiry_details (id, enquiry_id, question_id, answers, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: event_amenity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_amenity (id, event_id, amenitiy_id, created_at, updated_at) FROM stdin;
10	2	1	2024-04-11 03:38:09	2024-04-11 03:38:09
11	1	2	2024-04-11 03:38:55	2024-04-11 03:38:55
12	4	3	2024-04-11 03:39:38	2024-04-11 03:39:38
13	4	2	2024-04-11 03:39:38	2024-04-11 03:39:38
14	4	1	2024-04-11 03:39:38	2024-04-11 03:39:38
15	3	2	2024-04-11 03:40:13	2024-04-11 03:40:13
16	3	1	2024-04-11 03:40:13	2024-04-11 03:40:13
\.


--
-- Data for Name: event_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_images (id, event_id, event_image, created_at, updated_at) FROM stdin;
1	1	17113975656601dabd38e7e.jpg	2024-03-25 20:12:45	2024-03-25 20:12:45
2	2	1711968289660a9021d20ec.jpg	2024-04-01 10:44:49	2024-04-01 10:44:49
3	3	1712077744660c3bb0d7183.jpg	2024-04-02 17:09:04	2024-04-02 17:09:04
4	3	171255781366138ef540ec6.png	2024-04-08 06:30:13	2024-04-08 06:30:13
5	4	171255812866139030cad1f.png	2024-04-08 06:35:28	2024-04-08 06:35:28
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, name, amount, status, knowmore, rewards, country_id, state_id, city_id, location, latitude, longitude, deleted, event_datetime, total_participants, applied_participants, created_at, updated_at, facilitator_id, event_end_datetime, eventscategory) FROM stdin;
2	Mahjongg Shanghai Event 2023	100	1	test	tesy	1	1	1	60b 14B St - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates	25.19953188383985	55.24049924848892	0	2024-04-01 09:43:00	100	0	2024-04-11 03:38:09	2024-04-11 03:38:09	7	2024-04-02 09:43:00	1
1	Rummy Super Event 2024	100	1	test	testy	1	1	1	Damac Park Tower 2 - Za'abeel - Za'abeel 2 - Dubai - United Arab Emirates	25.209705210563193	55.280410518630525	0	2024-03-25 20:12:00	12	0	2024-04-11 03:38:55	2024-04-11 03:38:55	3	2024-03-29 11:00:00	1
4	Shanghai Event 2024	100	1	Shanghai rum is a Rummy card game, based on gin rummy and a variation of Contract rummy played by 3 to 8 players. It is also known as California rummy.	\N	1	1	1	3 Street 1 - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates	25.207194315028225	55.25200056074478	0	2024-04-08 05:34:00	50	3	2024-04-11 03:39:38	2024-04-11 03:39:38	63,3	2024-05-31 04:34:00	1
3	Mahjong Event 2024	100	1	Mahjong Event is a Rummy card game, based on gin rummy and a variation of Contract rummy played by 3 to 8 players. It is also known as California rummy.	\N	1	1	1	13 5 St - Al Wasl - Dubai - United Arab Emirates	25.2038808909034	55.265905132277986	0	2024-04-02 04:08:00	100	1	2024-04-11 03:40:13	2024-04-11 03:40:13	63,7,3	2024-04-30 09:00:00	1
\.


--
-- Data for Name: events_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events_categories (id, name, description, deleted, active, file, created_at, updated_at) FROM stdin;
1	Event	test	0	1	1711396542_6569a74d5df95_1701422925.png	2024-03-25 19:55:42	2024-04-02 09:27:06
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
1	question 1	Test1	1	1	1	2024-03-25 21:25:59	2024-03-25 21:25:59
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
-- Data for Name: game_minus_points; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.game_minus_points (id, user_id, game_id, booking_id, table_number, points, created_at, updated_at) FROM stdin;
1	1	1	1	Table 1	100	2024-03-26 17:21:14	2024-03-26 17:21:14
2	1	1	1	Table 1	100	2024-03-26 17:21:30	2024-03-26 17:21:30
3	1	1	1	Table 1	100	2024-03-26 17:45:51	2024-03-26 17:45:51
4	1	1	\N		100	2024-03-27 10:07:22	2024-03-27 10:07:22
5	6	1	\N		100	2024-03-27 10:07:47	2024-03-27 10:07:47
6	6	1	\N		300	2024-03-27 10:51:36	2024-03-27 10:51:36
7	1	1	1		100	2024-03-27 12:01:44	2024-03-27 12:01:44
8	6	1	\N		99	2024-03-27 14:24:07	2024-03-27 14:24:07
9	6	1	\N		222	2024-03-27 16:19:00	2024-03-27 16:19:00
10	1	1	1		100	2024-03-27 16:23:23	2024-03-27 16:23:23
11	10	6	\N		20	2024-03-28 10:37:04	2024-03-28 10:37:04
12	12	6	\N		500	2024-04-01 10:09:38	2024-04-01 10:09:38
13	12	6	\N		222	2024-04-01 10:09:47	2024-04-01 10:09:47
14	6	1	\N		100	2024-04-01 10:40:50	2024-04-01 10:40:50
15	68	9	\N		500	2024-04-09 10:26:25	2024-04-09 10:26:25
16	71	16	\N		100	2024-04-12 06:29:40	2024-04-12 06:29:40
17	5	6	\N		5	2024-04-15 07:19:49	2024-04-15 07:19:49
18	75	16	\N		10	2024-04-16 08:30:34	2024-04-16 08:30:34
\.


--
-- Data for Name: game_plus_points; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.game_plus_points (id, user_id, game_id, booking_id, table_number, points, created_at, updated_at) FROM stdin;
1	1	1	1	Table 1	100	2024-03-26 17:18:56	2024-03-26 17:18:56
2	1	1	1	Table 1	100	2024-03-26 17:18:59	2024-03-26 17:18:59
3	1	1	1	Table 1	100	2024-03-26 17:45:44	2024-03-26 17:45:44
4	1	1	1	Table 1	100	2024-03-27 07:38:24	2024-03-27 07:38:24
5	6	1	1	Table 1	100	2024-03-27 10:01:23	2024-03-27 10:01:23
6	6	1	\N		100	2024-03-27 10:06:36	2024-03-27 10:06:36
7	6	1	\N		200	2024-03-27 10:51:02	2024-03-27 10:51:02
8	6	1	\N		500	2024-03-27 10:52:07	2024-03-27 10:52:07
9	1	1	1		100	2024-03-27 16:23:19	2024-03-27 16:23:19
10	6	1	\N		89	2024-03-27 16:29:30	2024-03-27 16:29:30
11	6	1	\N		455	2024-03-27 17:43:44	2024-03-27 17:43:44
12	6	1	\N		88	2024-03-28 05:36:18	2024-03-28 05:36:18
13	6	1	\N		333	2024-03-28 06:07:18	2024-03-28 06:07:18
14	6	6	\N		100	2024-03-28 07:16:06	2024-03-28 07:16:06
15	7	6	\N		200	2024-03-28 07:24:27	2024-03-28 07:24:27
16	10	6	\N		100	2024-03-28 10:36:56	2024-03-28 10:36:56
17	12	6	\N		1000	2024-04-01 10:09:31	2024-04-01 10:09:31
18	12	6	\N		10	2024-04-01 10:12:49	2024-04-01 10:12:49
19	10	6	\N		150	2024-04-03 21:01:28	2024-04-03 21:01:28
20	10	6	\N		1500	2024-04-03 21:07:10	2024-04-03 21:07:10
21	68	9	\N		1000	2024-04-09 10:26:09	2024-04-09 10:26:09
22	12	6	\N		11	2024-04-09 14:52:15	2024-04-09 14:52:15
23	71	16	\N		3000	2024-04-12 06:29:33	2024-04-12 06:29:33
24	5	6	\N		10	2024-04-15 07:19:33	2024-04-15 07:19:33
25	75	16	\N		200	2024-04-16 08:30:13	2024-04-16 08:30:13
26	75	16	\N		12	2024-04-16 08:30:26	2024-04-16 08:30:26
\.


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.games (id, name, amount, status, knowmore, rewards, country_id, state_id, city_id, location, latitude, longitude, deleted, created_at, updated_at, start_date, enddate, skill_level_id, max_number_of_users, game_type, number_of_tables, skilled_professionals, facilitator_id) FROM stdin;
5	Bridge	100	1	Test	test	1	1	1	57WH+VV - Downtown Dubai - Dubai - United Arab Emirates	25.204819	55.270931	1	2024-04-01 10:49:55	2024-04-10 18:21:40	2024-04-01 00:00:00	2024-04-03 00:00:00	2	4	1	3	8	7
1	Bridge	100	1	restt	test	1	1	1	57WH+VV - Downtown Dubai - Dubai - United Arab Emirates	25.1972295	55.27974699999999	1	2024-03-25 20:07:26	2024-03-28 06:56:59	2024-03-25 00:00:00	2024-03-29 00:00:00	1	4	1	12	2	3
9	Bridge Game	100.5	1	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google. Downloads, bookmarks and reading list items will be saved.	Rewards who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google. Downloads, bookmarks and reading list items will be saved.	1	1	1	57WH+VV - Downtown Dubai - Dubai - United Arab Emirates	25.204819	55.270931	1	2024-04-08 09:44:34	2024-04-10 18:21:51	2024-04-08 00:00:00	2024-04-30 00:00:00	2	4	1	12	9	63,3
12	BAM Teams	100	1	Board-A-Match team events are an unusual cross between matchpoint pairs and team events. The concept is similar to a Swiss (see below), but instead of using an IMP scale, a team’s score on each board is either zero, one, or one-half. The strategy more closely resembles matchpoints, since making an overtrick can be the difference between a zero and a one. Sometimes the event is organized like a Swiss, and sometimes like a pairs event.	Board-A-Match team events are an unusual cross between matchpoint pairs and team events. The concept is similar to a Swiss (see below), but instead of using an IMP scale, a team’s score on each board is either zero, one, or one-half. The strategy more closely resembles matchpoints, since making an overtrick can be the difference between a zero and a one. Sometimes the event is organized like a Swiss, and sometimes like a pairs event.	1	1	1	56XV+X8V - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates	25.1999967	55.2433082	1	2024-04-10 18:18:46	2024-04-10 18:21:59	2024-04-11 00:00:00	2024-04-22 00:00:00	4	4	1	5	8	7
2	Mahjongg	100	1	test	test	1	1	1	Dubai International Airport (DXB) - Dubai - United Arab Emirates	25.204819	55.270931	1	2024-03-27 08:18:17	2024-03-28 07:05:09	2024-03-25 00:00:00	2024-03-28 00:00:00	1	4	2	12	2	3
10	Solitaire Mahjong Classic 2	100	1	Mahjong or mah-jongg is a tile-based game that was developed in the 19th century in China and has spread throughout the world since the early 20th century. It is played by four players.	Mahjong or mah-jongg is a tile-based game that was developed in the 19th century in China and has spread throughout the world since the early 20th century. It is played by four players.	1	1	1	69C3+Q4M - Dubai Festival City - Dubai - United Arab Emirates	25.204819	55.270931	0	2024-04-10 19:06:33	2024-04-10 19:06:33	2024-04-02 00:00:00	2024-04-18 00:00:00	1	4	2	12	9	3
3	Rummy	100	1	test	tesy	1	1	1	10 Lea Dr, Loughborough LE11 2GY, UK	52.7486007	-1.2020794	1	2024-03-25 20:10:50	2024-03-28 07:08:22	2024-03-25 00:00:00	2024-03-29 00:00:00	1	10	3	2	2	3
4	Shanghai	100	1	test	test	1	1	1	57WH+VV - Downtown Dubai - Dubai - United Arab Emirates	25.1972295	55.27974699999999	1	2024-03-25 20:11:55	2024-03-28 07:10:34	2024-03-25 00:00:00	2024-03-29 00:00:00	1	10	4	12	2	3
8	Shanghai Rum	100	1	Shanghai rum is a Rummy card game, based on gin rummy and a variation of Contract rummy played by 3 to 8 players. It is also known as California rummy.	Rewadrs Shanghai rum is a Rummy card game, based on gin rummy and a variation of Contract rummy played by 3 to 8 players. It is also known as California rummy.	1	1	1	57XH+87X - Downtown Dubai - Dubai - United Arab Emirates	25.198390133772634	55.27826475141861	0	2024-04-11 03:29:42	2024-04-11 03:29:42	2024-03-28 00:00:00	2024-04-25 00:00:00	2	8	4	3	9	63,7
15	Clasic Bridge	30	1	Cheers! Ring in the new year with New Year's Bridge! Kickoff your resolutions with more fun and better card game skills this year. New Year's Bridge offers the best in online, tablet, and phone gameplay where you can always play Bridge at home, work, or on the go for FREE with no download or sign-in required! Play today immediately on all of your devices using your favorite internet browser. Put on your finest threads and get ready for the year's biggest party with New Year's Bridge!	Cheers! Ring in the new year with New Year's Bridge! Kickoff your resolutions with more fun and better card game skills this year. New Year's Bridge offers the best in online, tablet, and phone gameplay where you can always play Bridge at home, work, or on the go for FREE with no download or sign-in required! Play today immediately on all of your devices using your favorite internet browser. Put on your finest threads and get ready for the year's biggest party with New Year's Bridge!	1	1	1	12 19th St - Al Wasl - Dubai - United Arab Emirates	25.201237742577042	55.255691280349275	0	2024-04-10 18:41:44	2024-04-10 18:41:44	2024-04-10 00:00:00	2024-04-21 00:00:00	3	4	1	10	66,24,9,8,4,2	63,7,3
13	Spring Bridge	25	1	Take a break from Spring cleaning with Spring Bridge! Have some fun, relax, and brush up on your card game skills this season with Spring Bridge. Spring Bridge offers the best in online, tablet, and phone gameplay where you can always play Bridge at home, work, or on the go for FREE with no download or sign-in required! Play today immediately on all of your devices using your favorite internet browser. The fun will bloom with Spring Bridge	Take a break from Spring cleaning with Spring Bridge! Have some fun, relax, and brush up on your card game skills this season with Spring Bridge. Spring Bridge offers the best in online, tablet, and phone gameplay where you can always play Bridge at home, work, or on the go for FREE with no download or sign-in required! Play today immediately on all of your devices using your favorite internet browser. The fun will bloom with Spring Bridge	1	1	1	140 18c St - Al Satwa - Dubai - United Arab Emirates	25.21076380334188	55.266420116408845	0	2024-04-10 18:32:39	2024-04-10 18:32:39	2024-04-10 00:00:00	2024-04-16 00:00:00	1	4	1	10	24,8	63,7,3
14	Easter Bridge	20	1	Every bunny deserves some good old fashioned card game fun this holiday with Easter Bridge. Easter Bridge offers the best in online, tablet, and phone gameplay where you can always play Bridge at home, work, or on the go for FREE with no download or sign-in required! Play today immediately on all of your devices using your favorite internet browser. Hop into the fun with some jelly beans, a comfy seat, and Easter Bridge!	Every bunny deserves some good old fashioned card game fun this holiday with Easter Bridge. Easter Bridge offers the best in online, tablet, and phone gameplay where you can always play Bridge at home, work, or on the go for FREE with no download or sign-in required! Play today immediately on all of your devices using your favorite internet browser. Hop into the fun with some jelly beans, a comfy seat, and Easter Bridge!	1	1	1	107 Sheikh Zayed Rd - Trade Centre - DIFC - Dubai - United Arab Emirates	25.204819	55.270931	0	2024-04-10 18:43:20	2024-04-10 18:43:20	2024-04-10 00:00:00	2024-04-20 00:00:00	2	4	1	15	66,9,4	63,7,3
6	Super Mahjong	100	1	Mahjong or mah-jongg is a tile-based game that was developed in the 19th century in China and has spread throughout the world since the early 20th century. It is played by four players.	Mahjong or mah-jongg is a tile-based game that was developed in the 19th century in China and has spread throughout the world since the early 20th century. It is played by four players.	1	1	1	3 52A St - Al Wasl - Dubai - United Arab Emirates	25.204819	55.270931	0	2024-04-10 19:02:36	2024-04-10 19:02:36	2024-03-28 00:00:00	2024-04-17 00:00:00	1	4	2	2	9	3
17	Duals Mahjong	25	1	Mahjong or mah-jongg is a tile-based game that was developed in the 19th century in China and has spread throughout the world since the early 20th century. It is played by four players.	Mahjong or mah-jongg is a tile-based game that was developed in the 19th century in China and has spread throughout the world since the early 20th century. It is played by four players.	1	1	1	48 24b St - Za'abeel - Za'abeel 2 - Dubai - United Arab Emirates	25.20361932795246	55.29071020124771	0	2024-04-10 19:04:56	2024-04-10 19:04:56	2024-04-10 00:00:00	2024-04-15 00:00:00	1	4	2	10	66,9,8,4,2	63,7,3
18	Rummy Advanced	50	1	Rummy is a group of games related by the feature of matching cards of the same rank or sequence and same suit. The basic goal in any form of rummy is to build melds which can be either sets or runs and either be first to go out or to amass more points than the opposition	Rummy is a group of games related by the feature of matching cards of the same rank or sequence and same suit. The basic goal in any form of rummy is to build melds which can be either sets or runs and either be first to go out or to amass more points than the opposition	1	1	1	34 24 St - Za'abeel - Za'abeel 2 - Dubai - United Arab Emirates	25.20144039033274	55.28686689171533	0	2024-04-11 03:23:24	2024-04-11 03:23:24	2024-04-11 00:00:00	2024-04-25 00:00:00	1	5	3	10	66,9,8,4	63,7,3
11	Rummy Expert	100	1	Rummy is a group of games related by the feature of matching cards of the same rank or sequence and same suit. The basic goal in any form of rummy is to build melds which can be either sets or runs and either be first to go out or to amass more points than the opposition	Rummy is a group of games related by the feature of matching cards of the same rank or sequence and same suit. The basic goal in any form of rummy is to build melds which can be either sets or runs and either be first to go out or to amass more points than the opposition	1	1	1	56 26C St - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates	25.204819	55.270931	0	2024-04-11 03:26:26	2024-04-11 03:26:26	2024-04-02 00:00:00	2024-04-26 00:00:00	2	10	3	5	66,9,8,4,2	63,7
7	Rummy	4	1	Rummy is a group of games related by the feature of matching cards of the same rank or sequence and same suit. The basic goal in any form of rummy is to build melds which can be either sets or runs and either be first to go out or to amass more points than the opposition	Rummy is a group of games related by the feature of matching cards of the same rank or sequence and same suit. The basic goal in any form of rummy is to build melds which can be either sets or runs and either be first to go out or to amass more points than the opposition	1	1	1	665P+PRR - Jumeirah 2 - Dubai - United Arab Emirates	25.204819	55.270931	0	2024-04-11 03:27:00	2024-04-11 03:27:00	2024-03-28 00:00:00	2024-04-06 00:00:00	4	10	3	3	66,9,4	63,7
20	Shanghai Rummy Duals	10	1	Shanghai rum is a Rummy card game, based on gin rummy and a variation of Contract rummy played by 3 to 8 players. It is also known as California rummy.	Shanghai rum is a Rummy card game, based on gin rummy and a variation of Contract rummy played by 3 to 8 players. It is also known as California rummy.	1	1	1	373 Jumeirah St - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates	25.19823480716974	55.236980190261384	0	2024-04-11 03:35:29	2024-04-11 03:35:29	2024-04-11 00:00:00	2024-04-26 00:00:00	1	10	4	10	66,9,8	63,3
19	Shanghai Rummy	25	1	Shanghai rum is a Rummy card game, based on gin rummy and a variation of Contract rummy played by 3 to 8 players. It is also known as California rummy.	Shanghai rum is a Rummy card game, based on gin rummy and a variation of Contract rummy played by 3 to 8 players. It is also known as California rummy.	1	1	1	Dubai Canal Marine Transport Station 1 - Dubai - United Arab Emirates	25.204819	55.270931	0	2024-04-11 03:36:07	2024-04-11 03:36:07	2024-04-11 00:00:00	2024-04-27 00:00:00	2	10	4	10	66,9,8	63,7
16	BAM Teams Dubai	210	1	Board-A-Match team events are an unusual cross between matchpoint pairs and team events. The concept is similar to a Swiss (see below), but instead of using an IMP scale, a team’s score on each board is either zero, one, or one-half.	The strategy more closely resembles matchpoints, since making an overtrick can be the difference between a zero and a one. Sometimes the event is organized like a Swiss, and sometimes like a pairs event.	1	1	1	57XC+HG - Downtown Dubai - Dubai - United Arab Emirates	25.204819	55.270931	0	2024-04-15 11:25:27	2024-04-15 11:25:27	2024-04-11 00:00:00	2024-04-20 00:00:00	4	4	1	5	9	7
\.


--
-- Data for Name: games_amenities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.games_amenities (id, game_id, amenitiy_id, created_at, updated_at) FROM stdin;
1	1	2	2024-03-25 20:07:26	2024-03-25 20:07:26
2	1	1	2024-03-25 20:07:26	2024-03-25 20:07:26
4	3	2	2024-03-25 20:10:50	2024-03-25 20:10:50
5	4	2	2024-03-25 20:11:55	2024-03-25 20:11:55
6	2	1	2024-03-27 08:18:18	2024-03-27 08:18:18
106	18	5	2024-04-11 03:23:25	2024-04-11 03:23:25
107	18	6	2024-04-11 03:23:25	2024-04-11 03:23:25
108	18	4	2024-04-11 03:23:25	2024-04-11 03:23:25
109	18	3	2024-04-11 03:23:25	2024-04-11 03:23:25
110	18	2	2024-04-11 03:23:25	2024-04-11 03:23:25
119	11	5	2024-04-11 03:26:26	2024-04-11 03:26:26
120	11	6	2024-04-11 03:26:26	2024-04-11 03:26:26
121	11	4	2024-04-11 03:26:26	2024-04-11 03:26:26
122	11	3	2024-04-11 03:26:26	2024-04-11 03:26:26
123	11	2	2024-04-11 03:26:26	2024-04-11 03:26:26
29	5	2	2024-04-01 10:49:55	2024-04-01 10:49:55
30	5	1	2024-04-01 10:49:55	2024-04-01 10:49:55
124	7	6	2024-04-11 03:27:00	2024-04-11 03:27:00
125	7	2	2024-04-11 03:27:00	2024-04-11 03:27:00
126	7	1	2024-04-11 03:27:00	2024-04-11 03:27:00
127	8	3	2024-04-11 03:29:42	2024-04-11 03:29:42
128	8	2	2024-04-11 03:29:42	2024-04-11 03:29:42
129	8	1	2024-04-11 03:29:42	2024-04-11 03:29:42
133	20	5	2024-04-11 03:35:29	2024-04-11 03:35:29
134	20	6	2024-04-11 03:35:29	2024-04-11 03:35:29
135	20	4	2024-04-11 03:35:29	2024-04-11 03:35:29
136	19	5	2024-04-11 03:36:07	2024-04-11 03:36:07
137	19	6	2024-04-11 03:36:07	2024-04-11 03:36:07
138	19	4	2024-04-11 03:36:07	2024-04-11 03:36:07
139	16	5	2024-04-15 11:25:27	2024-04-15 11:25:27
140	16	6	2024-04-15 11:25:27	2024-04-15 11:25:27
141	16	4	2024-04-15 11:25:27	2024-04-15 11:25:27
57	9	2	2024-04-08 09:44:34	2024-04-08 09:44:34
58	9	4	2024-04-08 09:44:34	2024-04-08 09:44:34
59	9	5	2024-04-08 09:44:34	2024-04-08 09:44:34
60	9	6	2024-04-08 09:44:34	2024-04-08 09:44:34
61	9	1	2024-04-08 09:44:34	2024-04-08 09:44:34
62	9	3	2024-04-08 09:44:34	2024-04-08 09:44:34
64	12	6	2024-04-10 18:18:46	2024-04-10 18:18:46
65	12	4	2024-04-10 18:18:46	2024-04-10 18:18:46
66	12	3	2024-04-10 18:18:46	2024-04-10 18:18:46
67	13	5	2024-04-10 18:32:39	2024-04-10 18:32:39
68	13	6	2024-04-10 18:32:39	2024-04-10 18:32:39
69	13	4	2024-04-10 18:32:39	2024-04-10 18:32:39
70	13	3	2024-04-10 18:32:39	2024-04-10 18:32:39
71	13	2	2024-04-10 18:32:39	2024-04-10 18:32:39
77	15	3	2024-04-10 18:41:44	2024-04-10 18:41:44
78	15	2	2024-04-10 18:41:44	2024-04-10 18:41:44
79	14	5	2024-04-10 18:43:20	2024-04-10 18:43:20
80	14	6	2024-04-10 18:43:20	2024-04-10 18:43:20
81	14	4	2024-04-10 18:43:20	2024-04-10 18:43:20
82	14	3	2024-04-10 18:43:20	2024-04-10 18:43:20
83	14	2	2024-04-10 18:43:20	2024-04-10 18:43:20
95	6	3	2024-04-10 19:02:36	2024-04-10 19:02:36
96	6	2	2024-04-10 19:02:36	2024-04-10 19:02:36
97	6	1	2024-04-10 19:02:36	2024-04-10 19:02:36
98	17	6	2024-04-10 19:04:56	2024-04-10 19:04:56
99	17	4	2024-04-10 19:04:56	2024-04-10 19:04:56
100	17	3	2024-04-10 19:04:56	2024-04-10 19:04:56
101	17	2	2024-04-10 19:04:56	2024-04-10 19:04:56
102	10	2	2024-04-10 19:06:33	2024-04-10 19:06:33
\.


--
-- Data for Name: games_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.games_categories (id, game_id, category_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: games_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.games_images (id, game_id, game_image, created_at, updated_at) FROM stdin;
1	1	17113972466601d97ea4ee0.jpg	2024-03-25 20:07:26	2024-03-25 20:07:26
2	2	17113973776601da0109a3f.jpg	2024-03-25 20:09:37	2024-03-25 20:09:37
4	4	17113975156601da8b3c41c.png	2024-03-25 20:11:55	2024-03-25 20:11:55
5	5	171160923466051592cdbd3.jpg	2024-03-28 07:00:34	2024-03-28 07:00:34
9	9	1712099426660c9062bb5bd.jpg	2024-04-02 23:10:26	2024-04-02 23:10:26
16	9	17125688796613ba2fc3784.png	2024-04-08 09:34:39	2024-04-08 09:34:39
17	9	17125688796613ba2fc703e.png	2024-04-08 09:34:39	2024-04-08 09:34:39
18	9	17125689306613ba6206fa7.png	2024-04-08 09:35:30	2024-04-08 09:35:30
19	9	17125689306613ba6207a79.png	2024-04-08 09:35:30	2024-04-08 09:35:30
20	12	17127731266616d806f353e.jpg	2024-04-10 18:18:46	2024-04-10 18:18:46
21	13	17127739596616db4748f68.jpeg	2024-04-10 18:32:39	2024-04-10 18:32:39
23	15	17127745046616dd68678d0.jpeg	2024-04-10 18:41:44	2024-04-10 18:41:44
24	14	17127746006616ddc8a7d03.png	2024-04-10 18:43:20	2024-04-10 18:43:20
25	14	17127746006616ddc8a86ef.jpeg	2024-04-10 18:43:20	2024-04-10 18:43:20
26	16	17127747936616de89af0aa.jpg	2024-04-10 18:46:33	2024-04-10 18:46:33
27	10	17127755826616e19e966db.png	2024-04-10 18:59:42	2024-04-10 18:59:42
28	10	17127756216616e1c5d5722.png	2024-04-10 19:00:21	2024-04-10 19:00:21
29	6	17127756946616e20e44bc5.jpg	2024-04-10 19:01:34	2024-04-10 19:01:34
30	6	17127757566616e24cece74.png	2024-04-10 19:02:36	2024-04-10 19:02:36
31	6	17127757566616e24ced912.jpg	2024-04-10 19:02:36	2024-04-10 19:02:36
32	17	17127758966616e2d880d75.png	2024-04-10 19:04:56	2024-04-10 19:04:56
33	17	17127758966616e2d8818e7.png	2024-04-10 19:04:56	2024-04-10 19:04:56
34	17	17127758966616e2d883cf4.jpg	2024-04-10 19:04:56	2024-04-10 19:04:56
35	18	1712805805661757ad08305.jpg	2024-04-11 03:23:25	2024-04-11 03:23:25
36	18	1712805805661757ad0a873.jpg	2024-04-11 03:23:25	2024-04-11 03:23:25
37	11	1712805893661758057a3e6.png	2024-04-11 03:24:53	2024-04-11 03:24:53
38	7	17128059526617584035127.jpg	2024-04-11 03:25:52	2024-04-11 03:25:52
39	11	17128059866617586250161.jpg	2024-04-11 03:26:26	2024-04-11 03:26:26
40	11	17128059866617586250ad1.jpg	2024-04-11 03:26:26	2024-04-11 03:26:26
41	7	171280602066175884550d0.jpg	2024-04-11 03:27:00	2024-04-11 03:27:00
42	8	17128061826617592615130.jpg	2024-04-11 03:29:42	2024-04-11 03:29:42
43	8	171280618266175926197e3.jpg	2024-04-11 03:29:42	2024-04-11 03:29:42
44	20	171280652966175a81ec52e.jpg	2024-04-11 03:35:29	2024-04-11 03:35:29
45	20	171280652966175a81ecefe.jpg	2024-04-11 03:35:29	2024-04-11 03:35:29
46	19	171280656766175aa7443a7.jpg	2024-04-11 03:36:07	2024-04-11 03:36:07
47	19	171280656766175aa744ccd.jpg	2024-04-11 03:36:07	2024-04-11 03:36:07
48	19	171280656766175aa74542a.png	2024-04-11 03:36:07	2024-04-11 03:36:07
\.


--
-- Data for Name: games_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.games_rules (id, game_id, rule_title, rule_description, rule_details, created_at, updated_at) FROM stdin;
1	1	Game 1:test	test	test	2024-03-25 20:07:26	2024-03-25 20:07:26
3	3	Game 1:	test	test	2024-03-25 20:10:50	2024-03-25 20:10:50
4	4	Game 1:	tesy	tesy	2024-03-25 20:11:55	2024-03-25 20:11:55
5	2	Game 1:	test	testy	2024-03-27 08:18:18	2024-03-27 08:18:18
15	5	Game Bridge:	test	test	2024-04-01 10:49:55	2024-04-01 10:49:55
33	9	Rule-1	Rule-1 description	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google. Downloads, bookmarks and reading list items will be saved.	2024-04-08 09:44:34	2024-04-08 09:44:34
34	9	Rule-2	Rule-2 description	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google. Downloads, bookmarks and reading list items will be saved.	2024-04-08 09:44:34	2024-04-08 09:44:34
36	12	Games Rules and Regulations	The strategy more closely resembles matchpoints, since making an overtrick can be the difference between a zero and a one. Sometimes the event is organized like a Swiss, and sometimes like a pairs event.	The strategy more closely resembles matchpoints, since making an overtrick can be the difference between a zero and a one. Sometimes the event is organized like a Swiss, and sometimes like a pairs event.	2024-04-10 18:18:46	2024-04-10 18:18:46
37	13	Rule-1	Description for rule 1	The player across the table is your teammate. Try to play off their bids to get the most number of points!\r\nTry a counting strategy when bidding. A=4,K=3,Q=2,J=1,Empty Suits=3,1 card suits=2, and 2 card suits=1.\r\nIf you have less than 13 points, don't bid! Always pass!\r\nWith a balanced hand and 16-18 points, feel free to bid 1 No Trump.\r\nIf your hand is not eligible for this 1 NT bid, and you have 13 or more points, open a bid with your strongest suit.	2024-04-10 18:32:39	2024-04-10 18:32:39
38	13	Rule-2	Description for rule 1	The player across the table is your teammate. Try to play off their bids to get the most number of points!\r\nTry a counting strategy when bidding. A=4,K=3,Q=2,J=1,Empty Suits=3,1 card suits=2, and 2 card suits=1.\r\nIf you have less than 13 points, don't bid! Always pass!\r\nWith a balanced hand and 16-18 points, feel free to bid 1 No Trump.\r\nIf your hand is not eligible for this 1 NT bid, and you have 13 or more points, open a bid with your strongest suit.	2024-04-10 18:32:39	2024-04-10 18:32:39
40	15	Rule 1	Description for rule 1	The player across the table is your teammate. Try to play off their bids to get the most number of points!\r\nTry a counting strategy when bidding. A=4,K=3,Q=2,J=1,Empty Suits=3,1 card suits=2, and 2 card suits=1.\r\nIf you have less than 13 points, don't bid! Always pass!\r\nWith a balanced hand and 16-18 points, feel free to bid 1 No Trump.\r\nIf your hand is not eligible for this 1 NT bid, and you have 13 or more points, open a bid with your strongest suit.	2024-04-10 18:41:44	2024-04-10 18:41:44
41	14	Rule-1	Description for rule 1	The player across the table is your teammate. Try to play off their bids to get the most number of points!\r\nTry a counting strategy when bidding. A=4,K=3,Q=2,J=1,Empty Suits=3,1 card suits=2, and 2 card suits=1.\r\nIf you have less than 13 points, don't bid! Always pass!\r\nWith a balanced hand and 16-18 points, feel free to bid 1 No Trump.\r\nIf your hand is not eligible for this 1 NT bid, and you have 13 or more points, open a bid with your strongest suit.	2024-04-10 18:43:20	2024-04-10 18:43:20
47	6	RUle 1	Description for rule 1	Mahjong or mah-jongg is a tile-based game that was developed in the 19th century in China and has spread throughout the world since the early 20th century. It is played by four players.	2024-04-10 19:02:36	2024-04-10 19:02:36
48	17	Rule 1	Description for rule 1	Mahjong or mah-jongg is a tile-based game that was developed in the 19th century in China and has spread throughout the world since the early 20th century. It is played by four players.	2024-04-10 19:04:56	2024-04-10 19:04:56
49	10	Rule 1	Description for rule 1	Mahjong or mah-jongg is a tile-based game that was developed in the 19th century in China and has spread throughout the world since the early 20th century. It is played by four players.	2024-04-10 19:06:33	2024-04-10 19:06:33
51	18	Rule 1	Description for Rule 1	To win at rummy card game, the players have to group cards in valid sequences and sets. In rummy, the cards in each suit rank low to high starting with Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen and King. Ace, Jack, Queen and King each has 10 points. The remaining cards have value equal to their face value.	2024-04-11 03:23:25	2024-04-11 03:23:25
54	11	Rule 1	Description for rule 1	To win at rummy card game, the players have to group cards in valid sequences and sets. In rummy, the cards in each suit rank low to high starting with Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen and King. Ace, Jack, Queen and King each has 10 points. The remaining cards have value equal to their face value.	2024-04-11 03:26:26	2024-04-11 03:26:26
55	7	Rule 1	Description for rule 1	To win at rummy card game, the players have to group cards in valid sequences and sets. In rummy, the cards in each suit rank low to high starting with Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen and King. Ace, Jack, Queen and King each has 10 points. The remaining cards have value equal to their face value.	2024-04-11 03:27:00	2024-04-11 03:27:00
56	8	Rule-1	Description for rule-1	Shanghai rum is a Rummy card game, based on gin rummy and a variation of Contract rummy played by 3 to 8 players. It is also known as California rummy.	2024-04-11 03:29:42	2024-04-11 03:29:42
57	8	Rule-2	Description for rule-2	Shanghai rum is a Rummy card game, based on gin rummy and a variation of Contract rummy played by 3 to 8 players. It is also known as California rummy.	2024-04-11 03:29:42	2024-04-11 03:29:42
59	20	Rule 1	Description for rule 1	Shanghai Rummy\r\nThere are ten rounds.\r\nEleven cards are dealt to each player in every deal.\r\nThere is a limit to the number of buys allowed.\r\nThere is a limit to the number of jokers used in a set or sequence.	2024-04-11 03:35:29	2024-04-11 03:35:29
60	19	Rule 1	Description for rule 1	Shanghai Rummy\r\nThere are ten rounds.\r\nEleven cards are dealt to each player in every deal.\r\nThere is a limit to the number of buys allowed.\r\nThere is a limit to the number of jokers used in a set or sequence.	2024-04-11 03:36:07	2024-04-11 03:36:07
61	16	Games Rules and Regulations	The concept is similar to a Swiss (see below), but instead of using an IMP scale, a team’s score on each board is either zero, one, or one-half.	Sometimes the event is organized like a Swiss, and sometimes like a pairs event.	2024-04-15 11:25:27	2024-04-15 11:25:27
\.


--
-- Data for Name: games_time; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.games_time (id, game_id, "time", created_at, updated_at) FROM stdin;
1	1	00:00	2024-03-25 20:07:26	2024-03-25 20:07:26
2	1	00:30	2024-03-25 20:07:26	2024-03-25 20:07:26
3	1	01:30	2024-03-25 20:07:26	2024-03-25 20:07:26
4	1	02:00	2024-03-25 20:07:26	2024-03-25 20:07:26
220	6	00:00	2024-04-10 19:02:36	2024-04-10 19:02:36
221	6	00:30	2024-04-10 19:02:36	2024-04-10 19:02:36
222	6	01:00	2024-04-10 19:02:36	2024-04-10 19:02:36
8	3	00:00	2024-03-25 20:10:50	2024-03-25 20:10:50
9	3	00:30	2024-03-25 20:10:50	2024-03-25 20:10:50
10	3	02:00	2024-03-25 20:10:50	2024-03-25 20:10:50
11	4	01:30	2024-03-25 20:11:55	2024-03-25 20:11:55
12	4	01:30	2024-03-25 20:11:55	2024-03-25 20:11:55
13	4	12:30	2024-03-25 20:11:55	2024-03-25 20:11:55
14	4	12:30	2024-03-25 20:11:55	2024-03-25 20:11:55
15	2	08:00	2024-03-27 08:18:18	2024-03-27 08:18:18
16	2	09:00	2024-03-27 08:18:18	2024-03-27 08:18:18
17	2	12:30	2024-03-27 08:18:18	2024-03-27 08:18:18
18	2	08:30	2024-03-27 08:18:18	2024-03-27 08:18:18
19	2	11:30	2024-03-27 08:18:18	2024-03-27 08:18:18
223	6	02:00	2024-04-10 19:02:36	2024-04-10 19:02:36
224	6	02:30	2024-04-10 19:02:36	2024-04-10 19:02:36
225	17	09:00	2024-04-10 19:04:56	2024-04-10 19:04:56
226	17	09:30	2024-04-10 19:04:56	2024-04-10 19:04:56
227	17	10:00	2024-04-10 19:04:56	2024-04-10 19:04:56
228	17	11:00	2024-04-10 19:04:56	2024-04-10 19:04:56
229	17	12:30	2024-04-10 19:04:56	2024-04-10 19:04:56
230	17	14:30	2024-04-10 19:04:56	2024-04-10 19:04:56
231	10	00:00	2024-04-10 19:06:33	2024-04-10 19:06:33
232	10	00:30	2024-04-10 19:06:33	2024-04-10 19:06:33
233	10	01:00	2024-04-10 19:06:33	2024-04-10 19:06:33
234	10	01:30	2024-04-10 19:06:33	2024-04-10 19:06:33
235	10	02:00	2024-04-10 19:06:33	2024-04-10 19:06:33
240	18	08:00	2024-04-11 03:23:25	2024-04-11 03:23:25
241	18	09:30	2024-04-11 03:23:25	2024-04-11 03:23:25
242	18	10:00	2024-04-11 03:23:25	2024-04-11 03:23:25
243	18	11:00	2024-04-11 03:23:25	2024-04-11 03:23:25
244	18	12:00	2024-04-11 03:23:25	2024-04-11 03:23:25
245	18	13:00	2024-04-11 03:23:25	2024-04-11 03:23:25
156	9	00:00	2024-04-08 09:44:34	2024-04-08 09:44:34
157	9	00:30	2024-04-08 09:44:34	2024-04-08 09:44:34
158	9	01:00	2024-04-08 09:44:34	2024-04-08 09:44:34
159	9	01:30	2024-04-08 09:44:34	2024-04-08 09:44:34
160	9	02:00	2024-04-08 09:44:34	2024-04-08 09:44:34
161	9	02:30	2024-04-08 09:44:34	2024-04-08 09:44:34
162	9	03:00	2024-04-08 09:44:34	2024-04-08 09:44:34
163	9	03:30	2024-04-08 09:44:34	2024-04-08 09:44:34
164	9	04:00	2024-04-08 09:44:34	2024-04-08 09:44:34
171	12	09:00	2024-04-10 18:18:47	2024-04-10 18:18:47
172	12	13:30	2024-04-10 18:18:47	2024-04-10 18:18:47
173	12	18:00	2024-04-10 18:18:47	2024-04-10 18:18:47
174	13	17:00	2024-04-10 18:32:39	2024-04-10 18:32:39
175	13	17:30	2024-04-10 18:32:39	2024-04-10 18:32:39
176	13	18:00	2024-04-10 18:32:39	2024-04-10 18:32:39
177	13	06:30	2024-04-10 18:32:39	2024-04-10 18:32:39
178	13	19:00	2024-04-10 18:32:39	2024-04-10 18:32:39
83	5	00:00	2024-04-01 10:49:55	2024-04-01 10:49:55
84	5	00:30	2024-04-01 10:49:55	2024-04-01 10:49:55
85	5	01:00	2024-04-01 10:49:55	2024-04-01 10:49:55
86	5	01:30	2024-04-01 10:49:55	2024-04-01 10:49:55
87	5	02:00	2024-04-01 10:49:55	2024-04-01 10:49:55
88	5	02:30	2024-04-01 10:49:55	2024-04-01 10:49:55
89	5	03:30	2024-04-01 10:49:55	2024-04-01 10:49:55
90	5	04:00	2024-04-01 10:49:55	2024-04-01 10:49:55
261	11	00:00	2024-04-11 03:26:26	2024-04-11 03:26:26
262	11	00:30	2024-04-11 03:26:26	2024-04-11 03:26:26
263	11	01:00	2024-04-11 03:26:26	2024-04-11 03:26:26
264	11	01:30	2024-04-11 03:26:26	2024-04-11 03:26:26
265	11	02:00	2024-04-11 03:26:26	2024-04-11 03:26:26
266	11	02:30	2024-04-11 03:26:26	2024-04-11 03:26:26
267	7	00:00	2024-04-11 03:27:00	2024-04-11 03:27:00
268	7	00:30	2024-04-11 03:27:00	2024-04-11 03:27:00
269	7	01:00	2024-04-11 03:27:00	2024-04-11 03:27:00
270	7	01:30	2024-04-11 03:27:00	2024-04-11 03:27:00
271	7	02:00	2024-04-11 03:27:00	2024-04-11 03:27:00
272	7	03:30	2024-04-11 03:27:00	2024-04-11 03:27:00
273	7	04:00	2024-04-11 03:27:00	2024-04-11 03:27:00
274	7	04:30	2024-04-11 03:27:00	2024-04-11 03:27:00
275	7	05:00	2024-04-11 03:27:00	2024-04-11 03:27:00
276	8	00:00	2024-04-11 03:29:42	2024-04-11 03:29:42
277	8	00:30	2024-04-11 03:29:42	2024-04-11 03:29:42
185	15	09:00	2024-04-10 18:41:44	2024-04-10 18:41:44
186	15	09:30	2024-04-10 18:41:44	2024-04-10 18:41:44
187	15	10:00	2024-04-10 18:41:44	2024-04-10 18:41:44
188	15	10:30	2024-04-10 18:41:44	2024-04-10 18:41:44
189	15	11:00	2024-04-10 18:41:44	2024-04-10 18:41:44
190	15	12:00	2024-04-10 18:41:44	2024-04-10 18:41:44
191	14	13:30	2024-04-10 18:43:20	2024-04-10 18:43:20
192	14	14:00	2024-04-10 18:43:20	2024-04-10 18:43:20
193	14	14:30	2024-04-10 18:43:20	2024-04-10 18:43:20
194	14	15:00	2024-04-10 18:43:20	2024-04-10 18:43:20
195	14	15:30	2024-04-10 18:43:20	2024-04-10 18:43:20
196	14	16:00	2024-04-10 18:43:20	2024-04-10 18:43:20
278	8	01:00	2024-04-11 03:29:42	2024-04-11 03:29:42
279	8	01:30	2024-04-11 03:29:42	2024-04-11 03:29:42
280	8	02:00	2024-04-11 03:29:42	2024-04-11 03:29:42
281	8	02:30	2024-04-11 03:29:42	2024-04-11 03:29:42
290	20	13:30	2024-04-11 03:35:29	2024-04-11 03:35:29
291	20	14:00	2024-04-11 03:35:29	2024-04-11 03:35:29
292	20	14:30	2024-04-11 03:35:29	2024-04-11 03:35:29
293	20	15:00	2024-04-11 03:35:29	2024-04-11 03:35:29
294	20	15:30	2024-04-11 03:35:29	2024-04-11 03:35:29
295	20	16:00	2024-04-11 03:35:29	2024-04-11 03:35:29
296	20	16:30	2024-04-11 03:35:29	2024-04-11 03:35:29
297	19	12:30	2024-04-11 03:36:07	2024-04-11 03:36:07
298	19	13:00	2024-04-11 03:36:07	2024-04-11 03:36:07
299	19	14:00	2024-04-11 03:36:07	2024-04-11 03:36:07
300	19	15:00	2024-04-11 03:36:07	2024-04-11 03:36:07
301	19	15:30	2024-04-11 03:36:07	2024-04-11 03:36:07
302	19	16:00	2024-04-11 03:36:07	2024-04-11 03:36:07
303	19	17:00	2024-04-11 03:36:07	2024-04-11 03:36:07
304	19	17:30	2024-04-11 03:36:07	2024-04-11 03:36:07
305	16	09:00	2024-04-15 11:25:27	2024-04-15 11:25:27
306	16	14:00	2024-04-15 11:25:27	2024-04-15 11:25:27
307	16	16:00	2024-04-15 11:25:27	2024-04-15 11:25:27
308	16	18:00	2024-04-15 11:25:27	2024-04-15 11:25:27
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
1	question 1	testtt	1	1	1	2024-03-25 21:26:15	2024-03-25 21:26:15
2	Booking issue	hi there is an issue in booking	68	1	1	2024-04-09 11:35:35	2024-04-09 11:36:14
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
-- Data for Name: instruction_manual; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instruction_manual (id, name, file, description, amount, active, deleted, sort, created_at, updated_at, manual_category_id) FROM stdin;
11	Bridge Rule	1712563735_file-sample_150kB.pdf	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google. Downloads, bookmarks and reading list items will be saved.	15	1	0	0	2024-04-08 08:08:55	2024-04-08 08:08:55	1
12	Rule of Bridge	1712563784_file-sample_150kB.pdf	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google. Downloads, bookmarks and reading list items will be saved.	20	1	0	0	2024-04-08 08:09:44	2024-04-08 08:09:44	1
13	Sanghai Rule 1	1712563830_file-sample_150kB.pdf	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google. Downloads, bookmarks and reading list items will be saved.	10	1	0	0	2024-04-08 08:10:30	2024-04-08 08:10:30	4
14	Shanghai Rum Rule	1712563861_file-sample_150kB.pdf	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google. Downloads, bookmarks and reading list items will be saved.	25	1	0	0	2024-04-08 08:11:01	2024-04-08 08:11:01	4
10	Mannual 1	1712561985_file-sample_150kB.pdf	<p>Others who use this device won&rsquo;t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google. Downloads, bookmarks and reading list items will be saved.</p>	100	1	0	0	2024-03-25 21:24:13	2024-04-16 00:02:14	1
\.


--
-- Data for Name: insurance_providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insurance_providers (id, name, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: manual_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.manual_categories (id, name, description, deleted, active, file, game_id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: manual_downloads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.manual_downloads (id, user_id, manual_id, amount, grand_total, payment_mode, created_at, updated_at, payment_status, payment_ref) FROM stdin;
1	5	10	100	100	1	2024-03-26 21:58:31	2024-03-26 21:58:32	0	pi_3Oyi0pBjsMxFtgBe0FRljvUi_secret_4fhjxtoSzbfoCxlB0yTwsJ2HJ
2	10	10	100	100	1	2024-03-28 10:35:51	2024-03-28 10:35:52	0	pi_3OzGJHBjsMxFtgBe1guH1X9s_secret_SEqFIspMpmkkQdV0wjT7ZYLWM
3	14	10	100	100	1	2024-04-02 04:24:39	2024-04-02 04:25:09	1	pi_3P0ytnBjsMxFtgBe1ndVuXTF_secret_4FVu3jm88kfzHd6exxz3BeaPg
4	31	10	100	100	1	2024-04-06 19:28:41	2024-04-06 19:28:42	0	pi_3P2eusBjsMxFtgBe0BQNA47e_secret_dp2ZfoocVyoq8qWylCYSZFWiX
5	31	10	100	100	1	2024-04-06 19:42:32	2024-04-06 19:42:33	0	pi_3P2f8HBjsMxFtgBe1Kjcl2BN_secret_ipnuozAJKdjSvWeFa3r7ObDh0
6	31	10	100	100	2	2024-04-06 19:44:32	2024-04-06 19:44:32	0	pi_3P2fACBjsMxFtgBe1FO2Cj3j_secret_gYwT2pFZHm98ofhwulVE71i0S
7	31	10	100	100	2	2024-04-06 20:18:57	2024-04-06 20:18:58	0	pi_3P2fhVBjsMxFtgBe0j3PWL8X_secret_sLbunxsyu8RyxNXUApqFokgEL
8	31	10	100	100	2	2024-04-06 23:16:18	2024-04-06 23:16:18	0	pi_3P2iT8BjsMxFtgBe0wKcVogc_secret_Lv3HgOcUgcTNqmF8GWDjIXO1S
9	62	14	25	25	1	2024-04-08 08:27:39	2024-04-08 08:28:02	1	pi_3P3DYFBjsMxFtgBe17R962Ad_secret_fyNJCp5DLhMreanbhq1tZBCCB
\.


--
-- Data for Name: membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.membership (id, name, description, amount, type, image, active, deleted, created_at, updated_at) FROM stdin;
1	Annually	Donec maximus egestas hendrerit. \r\nSed quis pharetra leo nam et tincidunt sapien. \r\nSed eros augue, vulputate quis imperdiet ut, malesuada sed eros. \r\nInteger nec odio metus. Ut luctus porta venenatis.	100	1	/uploads/brand/66136ffb1b470_1712549883.png	1	0	2024-03-25 20:00:41	2024-04-08 04:28:39
2	Monthly	Donec maximus egestas hendrerit. \r\nSed quis pharetra leo. Nam et tincidunt sapien. \r\nSed eros augue, vulputate quis imperdiet ut.\r\nInteger nec odio metus. Ut luctus porta venenatis.	10	2	/uploads/brand/66136fba48641_1712549818.png	0	1	2024-04-08 04:16:58	2024-04-14 20:20:59
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
315	2023_10_27_034811_quote_amount	1
316	2023_11_03_041825_skill_level	1
317	2023_11_03_044403_membership	1
318	2023_11_03_090636_amenities	1
319	2023_11_03_134311_games	1
320	2023_11_03_135135_games_categories	1
321	2023_11_03_135151_games_amenities	1
322	2023_11_03_135211_games_rules	1
323	2023_11_03_135256_games_images	1
324	2023_11_04_054809_enddate	1
325	2023_11_04_060950_instruction_manual	1
326	2023_11_04_070203_table	1
327	2023_11_06_015615_games_time	1
328	2023_11_23_055913_user_name	1
329	2023_11_23_060805_skill_level2	1
330	2023_11_23_062055_skill_level3	1
331	2023_11_24_120255_create_payment_init	1
332	2023_11_26_104710_step	1
333	2023_11_26_104741_step1	1
334	2023_11_26_105452_membership_type	1
335	2023_11_27_105100_create_review	1
336	2023_11_28_044013_create_events	1
337	2023_11_28_100719_create_booking	1
338	2023_11_28_103612_change_bookin_add_more	1
339	2023_11_28_111252_change_booking_add_booking_type	1
340	2023_11_28_121116_payment_temp	1
341	2023_12_04_062706_change_game_add_skill_level_id	1
342	2023_12_04_085810_create_table_manuals	1
343	2023_12_04_094452_create_manual_downloads	1
344	2023_12_04_094900_change_manual_downlad_add_payment_status	1
345	2023_12_04_101116_change_manual_downlad_add_payment_ref	1
346	2023_12_04_110339_change_payment_init_book_type	1
347	2023_12_11_101502_create_coach_booking	1
348	2023_12_12_054326_create_user_settings	1
349	2023_12_12_062220_change_articles_add_uid	1
350	2023_12_12_075611_change_review_add_booking_id	1
351	2024_02_22_102627_alter_add_max_users_to_games	1
352	2024_02_22_115313_alter_temp_booking_add_fileds_to_temp_booking	1
353	2024_02_22_120105_create_booking_time_slots_table	1
354	2024_02_29_091253_create_coach_locations_table	1
355	2024_03_01_105551_create_coach_activity_prices_table	1
356	2024_03_02_063650_alter_add_fields_to_contact_us_settings	1
357	2024_03_05_100536_add_user_type	1
358	2024_03_05_105632_add_user_type1	1
359	2024_03_05_112955_attachment	1
360	2024_03_05_113108_attachment1	1
361	2024_03_09_202422_create_instruction_manual_table	1
362	2024_03_20_175453_update_booking_table_columns	1
363	2024_03_20_180709_add_facilitator_id_to_events_table	1
364	2024_03_20_190854_add_game_type_to_games_table	1
365	2024_03_20_200518_add_facilitator_id_to_games_table	1
366	2024_03_20_201155_add_skilled_professionals_to_games_table	1
367	2024_03_20_201630_add_number_of_tables_to_games_table	1
368	2024_03_20_202448_alter_games_table_add_number_of_tables_column	1
369	2024_03_20_224709_add_event_end_datetime_to_events_table	1
370	2024_03_20_230257_add_deleted_column_to_manual_categories_table	1
371	2024_03_20_232130_add_manual_category_id_to_instruction_manual_table_v2	1
372	2024_03_21_215515_numberodtablescolumnforbookinglist	1
373	2024_03_22_121639_alter_phone_and_dial_code_nullable_in_temp_users_table	1
374	2024_03_25_150420_modify_events_categories_table_unique	1
375	2024_03_25_154343_add_eventscategory_column_to_events_table	1
376	2024_03_25_154855_check_games_table_columns	1
377	2024_03_25_160021_add_event_id_to_room_table	1
378	2024_03_25_160314_add_facilitator_id_to_room_table	1
379	2024_03_25_160459_add_facilitators_count_to_room_table	1
380	2024_03_25_193425_add_foreign_key_to_instruction_manual_table	1
381	2024_03_25_201958_remove_foreign_key_instruction_manual	2
382	2024_03_25_202749_add_foreign_key_instruction_manual_new	3
383	2024_03_25_203044_add_foreign_key_instruction_manual_new	4
384	2024_03_25_212305_recreate_manual_category_id_column	5
385	2024_03_26_154031_add_table_no_to_temp_booking_table	6
386	2024_03_26_165119_create_game_plus_points_table	7
387	2024_03_26_165601_create_game_minus_points_table	7
388	2024_03_27_082606_drop_unique_constraint_from_booking_table	8
389	2024_03_29_105048_add_columns_to_temp_booking_table	9
390	2024_03_29_110140_create_booking_seats_table	10
391	2024_03_29_111033_add_new_column_to_booking_seats_table	11
392	2024_03_31_163508_add_player_no_to_temp_bookings_table	12
393	2024_03_31_164423_add_player_no_to_booking_seats_table	13
394	2024_04_03_163103_add_membership_status_to_users_table	14
395	2024_04_15_161028_create_shangai_hands_table	15
396	2024_04_15_184506_remove_deleted_from_shangai_hands_table	15
397	2024_04_15_190005_create_shangai_buys_table	15
398	2024_04_15_191456_create_shangai_bonus_points_table	15
399	2024_04_15_212741_create_shangai_round_table	16
400	2024_04_15_213101_update_shangai_round_columns	17
\.


--
-- Data for Name: moda_main_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moda_main_categories (id, name, created_at, updated_at) FROM stdin;
1	Head	2024-03-25 19:54:33	\N
2	Upper Body	2024-03-25 19:54:33	\N
3	Lower Body	2024-03-25 19:54:33	\N
4	Footwear	2024-03-25 19:54:33	\N
5	Makeup	2024-03-25 19:54:33	\N
6	Accessories	2024-03-25 19:54:33	\N
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

COPY public.notifications (id, description, title, image, created_at, updated_at) FROM stdin;
1	test	test	17114020376601ec35691c1.png	2024-03-25 21:27:00	\N
2	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google. Downloads, bookmarks and reading list items will be saved.	Admin Push Testing NB	17126615166615240c3c080.png	2024-04-09 11:18:00	\N
10	Others who use this device won’t see your activity, so you can browse more privately. This won't change how data is collected by websites that you visit and the services that they use, including Google. Downloads, bookmarks and reading list items will be saved.	Admin push test	1713181166661d11ee5cc4e.png	2024-04-15 11:39:00	\N
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

COPY public.payment_init (id, total_amount, transaction_id, invoice_id, transaction_details, payment_status, user_id, created_at, updated_at, booking_type) FROM stdin;
1	200	pi_3Oyb3SBjsMxFtgBe1rMHEioO	1	pi_3Oyb3SBjsMxFtgBe1rMHEioO_secret_qUQYKCTCmnNw0mkUUKid98H1g	0	4	2024-03-26 14:32:00	2024-03-26 14:32:00	0
2	200	pi_3OybJZBjsMxFtgBe1aaBg2Sy	2	pi_3OybJZBjsMxFtgBe1aaBg2Sy_secret_DHlmxY1eca32QaYvdnkFKSPXR	1	4	2024-03-26 14:49:00	2024-03-26 14:50:02	0
3	200	pi_3Oyc8xBjsMxFtgBe0voiQEEY	3	pi_3Oyc8xBjsMxFtgBe0voiQEEY_secret_ZhMOzeyEo6ur1Xe8q4T0K89Xx	1	4	2024-03-26 15:42:00	2024-03-26 15:42:54	0
4	100	pi_3Oycm8BjsMxFtgBe1TSAKjSY	4	pi_3Oycm8BjsMxFtgBe1TSAKjSY_secret_Z0MqB1CJPnbf9RQn1CSj5SSI5	1	6	2024-03-26 16:23:00	2024-03-26 16:23:22	0
5	100	pi_3Oyi0pBjsMxFtgBe0FRljvUi	1	pi_3Oyi0pBjsMxFtgBe0FRljvUi_secret_4fhjxtoSzbfoCxlB0yTwsJ2HJ	0	5	2024-03-26 21:58:00	2024-03-26 21:58:00	2
23	100	pi_3OzGnpBjsMxFtgBe0UKGUGyG	21	pi_3OzGnpBjsMxFtgBe0UKGUGyG_secret_xlqE64yjS6bS9tL3oDEaTRloP	1	10	2024-03-28 11:07:00	2024-03-28 11:08:00	0
24	100	pi_3OzcyABjsMxFtgBe0OUvRbFd	22	pi_3OzcyABjsMxFtgBe0OUvRbFd_secret_kNvfIZLnvVWI5KSQz4XHPHX1t	0	10	2024-03-29 10:47:00	2024-03-29 10:47:00	0
6	200	pi_3OyrInBjsMxFtgBe1OJ8EpFK	5	pi_3OyrInBjsMxFtgBe1OJ8EpFK_secret_VC6Kk3vStRcYom8JmC8vSXBxg	1	4	2024-03-27 07:53:00	2024-03-27 08:04:41	0
7	200	pi_3OyrTyBjsMxFtgBe0yZESdPH	6	pi_3OyrTyBjsMxFtgBe0yZESdPH_secret_EAiogWq4WTrznDP9KX5hWZsgb	0	4	2024-03-27 08:05:00	2024-03-27 08:05:00	0
8	200	pi_3OyrbWBjsMxFtgBe10X9mc8m	7	pi_3OyrbWBjsMxFtgBe10X9mc8m_secret_Do7oiHDpBapEaHpGNqdsTsgpc	0	4	2024-03-27 08:13:00	2024-03-27 08:13:00	0
25	100	pi_3Ozd4fBjsMxFtgBe1KeOXAl7	23	pi_3Ozd4fBjsMxFtgBe1KeOXAl7_secret_z4hOTr4p6QAlbrevmg46ilicj	0	10	2024-03-29 10:54:00	2024-03-29 10:54:00	0
26	200	pi_3Ozd7LBjsMxFtgBe0m0RKy16	24	pi_3Ozd7LBjsMxFtgBe0m0RKy16_secret_x6z6CXQKMgs9kOUjIP7ATJ3Ti	0	10	2024-03-29 10:57:00	2024-03-29 10:57:00	0
9	200	pi_3OyrcGBjsMxFtgBe0KGgFZ1I	8	pi_3OyrcGBjsMxFtgBe0KGgFZ1I_secret_dOQjNHeheCzbvm8f1uVVI6e81	1	4	2024-03-27 08:13:00	2024-03-27 08:28:09	0
10	100	pi_3Oz7hRBjsMxFtgBe1F2ZMBm1	9	pi_3Oz7hRBjsMxFtgBe1F2ZMBm1_secret_lDDiVufcBPvO9HHIEusrnSmmh	1	5	2024-03-28 01:24:00	2024-03-28 01:24:51	0
11	100	pi_3Oz7nHBjsMxFtgBe1AZ0vngo	10	pi_3Oz7nHBjsMxFtgBe1AZ0vngo_secret_coXUinCL6pIDelV1eN2ZzEKPq	1	5	2024-03-28 01:30:00	2024-03-28 01:31:38	0
12	100	pi_3OzBfHBjsMxFtgBe054fbMdE	11	pi_3OzBfHBjsMxFtgBe054fbMdE_secret_qcE8yYmtvi08lwiRGPxH9QUjL	1	6	2024-03-28 05:38:00	2024-03-28 05:38:33	0
13	100	pi_3OzD80BjsMxFtgBe1hZ9Whev	12	pi_3OzD80BjsMxFtgBe1hZ9Whev_secret_biL27AShqIMQZZ4cJ54TebI2j	1	6	2024-03-28 07:12:00	2024-03-28 07:12:45	0
14	100	pi_3OzDBABjsMxFtgBe00PBDAys	13	pi_3OzDBABjsMxFtgBe00PBDAys_secret_quMAEeW92ZWXuwCznsQChrTtd	1	6	2024-03-28 07:15:00	2024-03-28 07:15:37	0
15	100	pi_3OzDIUBjsMxFtgBe0WvilFJk	14	pi_3OzDIUBjsMxFtgBe0WvilFJk_secret_3zIZs2CyxEE8NW1BifCBhb2yJ	1	7	2024-03-28 07:22:00	2024-03-28 07:23:08	0
16	100	pi_3OzDJWBjsMxFtgBe1Vd509w7	15	pi_3OzDJWBjsMxFtgBe1Vd509w7_secret_SVLAtFdbaysHEtVr9qqmTJyUP	1	7	2024-03-28 07:23:00	2024-03-28 07:24:10	0
17	100	pi_3OzEbABjsMxFtgBe1YaUobfU	16	pi_3OzEbABjsMxFtgBe1YaUobfU_secret_x0EN3n7TtRwHfNrZvJpNT6qaD	0	8	2024-03-28 08:46:00	2024-03-28 08:46:00	0
18	100	pi_3OzEbbBjsMxFtgBe14BUW8Hw	17	pi_3OzEbbBjsMxFtgBe14BUW8Hw_secret_xrsuR5MVuKdlMBhs21FYwwaRw	0	8	2024-03-28 08:46:00	2024-03-28 08:46:00	0
19	100	pi_3OzEc6BjsMxFtgBe1mLzwNnx	18	pi_3OzEc6BjsMxFtgBe1mLzwNnx_secret_U1T1Dl77KwmPrA1JjO90ZWWOH	1	8	2024-03-28 08:47:00	2024-03-28 08:47:31	0
20	100	pi_3OzEraBjsMxFtgBe0fcfJggq	19	pi_3OzEraBjsMxFtgBe0fcfJggq_secret_vZnxDTvmfAqzwG9llS7FFpQje	1	8	2024-03-28 09:03:00	2024-03-28 09:03:31	0
21	100	pi_3OzGGdBjsMxFtgBe0R3jIxqX	20	pi_3OzGGdBjsMxFtgBe0R3jIxqX_secret_9YyyqQxWaH8IJY1ETOQB6RdpA	1	10	2024-03-28 10:33:00	2024-03-28 10:33:36	0
22	100	pi_3OzGJHBjsMxFtgBe1guH1X9s	2	pi_3OzGJHBjsMxFtgBe1guH1X9s_secret_SEqFIspMpmkkQdV0wjT7ZYLWM	0	10	2024-03-28 10:35:00	2024-03-28 10:35:00	2
27	200	pi_3OzdYCBjsMxFtgBe1wnBjsz6	25	pi_3OzdYCBjsMxFtgBe1wnBjsz6_secret_zgUujhQUzAj1OnbUjvzz0WDqh	1	10	2024-03-29 11:24:00	2024-03-29 11:25:11	0
28	100	pi_3Ozi63BjsMxFtgBe1XVIMwDD	26	pi_3Ozi63BjsMxFtgBe1XVIMwDD_secret_cjvV2H5ONyL6cMHogn8raXjKk	0	5	2024-03-29 16:16:00	2024-03-29 16:16:00	0
29	200	pi_3Ozi8TBjsMxFtgBe0leq0S2d	27	pi_3Ozi8TBjsMxFtgBe0leq0S2d_secret_4MxkXCPWe6gR60NzAo1WJ4boI	1	5	2024-03-29 16:18:00	2024-03-29 16:19:25	0
30	200	pi_3OzjPTBjsMxFtgBe0k3kUoKG	28	pi_3OzjPTBjsMxFtgBe0k3kUoKG_secret_JDxDPcFw986w6u4An65GhtVyj	0	5	2024-03-29 17:40:00	2024-03-29 17:40:00	0
31	100	pi_3OzoyhBjsMxFtgBe0m1zIFYE	29	pi_3OzoyhBjsMxFtgBe0m1zIFYE_secret_WDn6uDGg4c4ZqcOqDoGsDek7M	1	5	2024-03-29 23:36:00	2024-03-29 23:37:37	0
32	100	pi_3Ozp0XBjsMxFtgBe1v6DCXRr	30	pi_3Ozp0XBjsMxFtgBe1v6DCXRr_secret_dLjMOKpJ9qqu12w19VZtB26yz	1	5	2024-03-29 23:38:00	2024-03-29 23:39:19	0
33	100	pi_3P05DPBjsMxFtgBe1OEgUGta	31	pi_3P05DPBjsMxFtgBe1OEgUGta_secret_nhJXKuGVAWXJ526czCRBQFR9H	1	5	2024-03-30 16:57:00	2024-03-30 16:57:40	0
34	200	pi_3P0RH0BjsMxFtgBe1Qwq3Mj9	32	pi_3P0RH0BjsMxFtgBe1Qwq3Mj9_secret_ILM7HVAIIAte0Xppv6zuqmZit	0	10	2024-03-31 16:30:00	2024-03-31 16:30:00	0
35	200	pi_3P0RQUBjsMxFtgBe1zValTeR	33	pi_3P0RQUBjsMxFtgBe1zValTeR_secret_k1tADEF0FmazdoWlBcBfAHX5x	0	10	2024-03-31 16:40:00	2024-03-31 16:40:00	0
36	200	pi_3P0RQaBjsMxFtgBe0l3qWqex	34	pi_3P0RQaBjsMxFtgBe0l3qWqex_secret_yznmDGqLP47vwOIJGudXSdTEg	0	10	2024-03-31 16:40:00	2024-03-31 16:40:00	0
37	200	pi_3P0RQeBjsMxFtgBe0yjjwV9K	35	pi_3P0RQeBjsMxFtgBe0yjjwV9K_secret_sBm8Yx60lIpbaqpMAGaqtkMVQ	0	10	2024-03-31 16:40:00	2024-03-31 16:40:00	0
38	200	pi_3P0RYFBjsMxFtgBe0Y3jSSxS	36	pi_3P0RYFBjsMxFtgBe0Y3jSSxS_secret_K6HUrw7kbao5t3JrqNwRPymPF	1	10	2024-03-31 16:48:00	2024-03-31 16:48:35	0
39	8	pi_3P0RxIBjsMxFtgBe0YVrqXCD	37	pi_3P0RxIBjsMxFtgBe0YVrqXCD_secret_fkuMK2QBn81X3Ns1HWoqRwcTy	1	10	2024-03-31 17:14:00	2024-03-31 17:15:11	0
40	8	pi_3P0RzWBjsMxFtgBe1CbunRaM	38	pi_3P0RzWBjsMxFtgBe1CbunRaM_secret_W6OocsX0Fe9dTHDYzLTLtAqQh	1	10	2024-03-31 17:16:00	2024-03-31 17:16:41	0
41	8	pi_3P0S3HBjsMxFtgBe1XtursqZ	39	pi_3P0S3HBjsMxFtgBe1XtursqZ_secret_Khh4jxmANxperNGPx0LXw1KFy	0	10	2024-03-31 17:20:00	2024-03-31 17:20:00	0
42	8	pi_3P0S3MBjsMxFtgBe143xB47L	40	pi_3P0S3MBjsMxFtgBe143xB47L_secret_gTChTmRRGq7yLxwCAiXDs3baX	1	10	2024-03-31 17:20:00	2024-03-31 17:20:38	0
43	8	pi_3P0S6uBjsMxFtgBe1p1Cz5ZY	41	pi_3P0S6uBjsMxFtgBe1p1Cz5ZY_secret_kjIFnLBsfAy4gTrxRIi5iglDK	0	10	2024-03-31 17:24:00	2024-03-31 17:24:00	0
44	8	pi_3P0SEvBjsMxFtgBe0fAwpiKe	42	pi_3P0SEvBjsMxFtgBe0fAwpiKe_secret_zPJxugRJ4ZYkwDUVUbBO455sl	0	10	2024-03-31 17:32:00	2024-03-31 17:32:00	0
45	8	pi_3P0SGgBjsMxFtgBe0FMKkrGh	43	pi_3P0SGgBjsMxFtgBe0FMKkrGh_secret_awk17GSp8tY4zotKDgMDNfcEF	1	10	2024-03-31 17:34:00	2024-03-31 17:36:16	0
46	8	pi_3P0SOjBjsMxFtgBe0sKJnJjg	44	pi_3P0SOjBjsMxFtgBe0sKJnJjg_secret_Y9U47jJVJ399uKNpFOjAesqxc	1	10	2024-03-31 17:42:00	2024-03-31 17:42:41	0
47	8	pi_3P0SPjBjsMxFtgBe0748dnkQ	45	pi_3P0SPjBjsMxFtgBe0748dnkQ_secret_sa7BWj67q5erTSlQRqJAJ1BEG	0	10	2024-03-31 17:43:00	2024-03-31 17:43:00	0
48	8	pi_3P0SSTBjsMxFtgBe0bx1LEpa	46	pi_3P0SSTBjsMxFtgBe0bx1LEpa_secret_D42jfsfNurJlGjKtBgOSdBFri	1	10	2024-03-31 17:46:00	2024-03-31 17:46:26	0
49	8	pi_3P0VUwBjsMxFtgBe0p7szvt6	47	pi_3P0VUwBjsMxFtgBe0p7szvt6_secret_BDuRBucGasfQqeVOPdelIaajO	1	5	2024-03-31 21:01:00	2024-03-31 21:01:27	0
50	4	pi_3P0XEMBjsMxFtgBe0YjyqwEP	48	pi_3P0XEMBjsMxFtgBe0YjyqwEP_secret_DX9i2cmRWLmAyL63bM3Z2wxRa	1	5	2024-03-31 22:52:00	2024-03-31 22:52:36	0
51	8	pi_3P0XFkBjsMxFtgBe1EzRjNnx	49	pi_3P0XFkBjsMxFtgBe1EzRjNnx_secret_0N9pJDqErbFCodVBg7inzrfff	1	5	2024-03-31 22:53:00	2024-03-31 22:53:54	0
52	100	pi_3P0XHvBjsMxFtgBe1ARdZBVS	50	pi_3P0XHvBjsMxFtgBe1ARdZBVS_secret_SbRbL6ZZmW3jR38vfy8p9qLxf	1	5	2024-03-31 22:55:00	2024-03-31 22:56:11	0
53	100	pi_3P0fF5BjsMxFtgBe0jca26nV	51	pi_3P0fF5BjsMxFtgBe0jca26nV_secret_Mmh9389Dt0B2y3JBkKJgRR1n4	1	5	2024-04-01 07:25:00	2024-04-01 07:25:52	0
54	4	pi_3P0fGjBjsMxFtgBe0yt54MFN	52	pi_3P0fGjBjsMxFtgBe0yt54MFN_secret_Ry36fjxcWpmFlVJ7x515r1kuA	1	5	2024-04-01 07:27:00	2024-04-01 07:27:42	0
55	100	pi_3P0fICBjsMxFtgBe1YesobGw	53	pi_3P0fICBjsMxFtgBe1YesobGw_secret_F9gWBUtRNqukvfmHzvwx2Vac6	1	5	2024-04-01 07:28:00	2024-04-01 07:29:01	0
56	100	pi_3P0hnFBjsMxFtgBe1y4vRukd	54	pi_3P0hnFBjsMxFtgBe1y4vRukd_secret_YmvIZlbGpRZ3HuTEXCRuZ73TC	1	12	2024-04-01 10:08:00	2024-04-01 10:09:02	0
57	100	pi_3P0iJoBjsMxFtgBe0KPzHiDd	55	pi_3P0iJoBjsMxFtgBe0KPzHiDd_secret_CVb1gpZ45zKDNSEvtpsgTw55h	0	14	2024-04-01 10:42:00	2024-04-01 10:42:00	1
58	100	pi_3P0lnDBjsMxFtgBe02dbUYhl	56	pi_3P0lnDBjsMxFtgBe02dbUYhl_secret_JT2PuLmo71VeVe876IWZHLqZ6	1	12	2024-04-01 14:25:00	2024-04-01 14:25:18	0
59	100	pi_3P0loWBjsMxFtgBe1KIini85	57	pi_3P0loWBjsMxFtgBe1KIini85_secret_SyR7HIQ1vGwBIum0B6qm2sSwc	1	12	2024-04-01 14:26:00	2024-04-01 14:26:35	0
60	4	pi_3P0lplBjsMxFtgBe1FzhFa0m	58	pi_3P0lplBjsMxFtgBe1FzhFa0m_secret_XJTLTIeZ8DpfLCDfdpF6H0y9U	1	12	2024-04-01 14:27:00	2024-04-01 14:27:52	0
61	100	pi_3P0lqXBjsMxFtgBe0c1rb3zW	59	pi_3P0lqXBjsMxFtgBe0c1rb3zW_secret_m1filp6elwJjApjzBGJLsF8zr	1	12	2024-04-01 14:28:00	2024-04-01 14:28:47	0
62	100	pi_3P0ytnBjsMxFtgBe1ndVuXTF	3	pi_3P0ytnBjsMxFtgBe1ndVuXTF_secret_4FVu3jm88kfzHd6exxz3BeaPg	1	14	2024-04-02 04:24:00	2024-04-02 04:25:09	2
63	200	pi_3P1AhSBjsMxFtgBe0gmYLLNl	60	pi_3P1AhSBjsMxFtgBe0gmYLLNl_secret_IDNLiKhvbmvnxiBjwAzXr4YoR	0	5	2024-04-02 17:00:00	2024-04-02 17:00:00	1
64	100	pi_3P1CKVBjsMxFtgBe0mPRQcyO	61	pi_3P1CKVBjsMxFtgBe0mPRQcyO_secret_ANQZkLDmOQLUsJrdWz9VK2CDK	0	5	2024-04-02 18:45:00	2024-04-02 18:45:00	0
65	100	pi_3P1CKeBjsMxFtgBe0027zg3w	62	pi_3P1CKeBjsMxFtgBe0027zg3w_secret_WN6zSrvurphzXEoowrFDKljyi	1	5	2024-04-02 18:45:00	2024-04-02 18:45:39	0
66	100	pi_3P1H4uBjsMxFtgBe1iVsVL9H	63	pi_3P1H4uBjsMxFtgBe1iVsVL9H_secret_B6fqxEFzEj91LaE8EB2Ua4T3F	1	5	2024-04-02 23:49:00	2024-04-02 23:49:53	0
67	100	pi_3P1HJEBjsMxFtgBe04dLTpxj	64	pi_3P1HJEBjsMxFtgBe04dLTpxj_secret_TflxpsqpROKZADdplNJ8SxgZw	1	5	2024-04-03 00:04:00	2024-04-03 00:04:35	0
68	100	pi_3P1HKQBjsMxFtgBe1RHSARLk	65	pi_3P1HKQBjsMxFtgBe1RHSARLk_secret_wGCdMyMnriBKLWG20Dd194dFN	1	5	2024-04-03 00:05:00	2024-04-03 00:05:43	0
69	100	pi_3P1HLSBjsMxFtgBe0ZMJxZ6l	66	pi_3P1HLSBjsMxFtgBe0ZMJxZ6l_secret_glSDzyblvbiis73hAXGDKyN4V	1	5	2024-04-03 00:06:00	2024-04-03 00:06:45	0
70	8	pi_3P1RdhBjsMxFtgBe17HYNngF	67	pi_3P1RdhBjsMxFtgBe17HYNngF_secret_x7kLgOLjaq6UHrY8ftEnHTeS0	1	5	2024-04-03 11:05:00	2024-04-03 11:06:18	0
71	100	pi_3P1WT4BjsMxFtgBe0bkoTcKi	968634162	pi_3P1WT4BjsMxFtgBe0bkoTcKi_secret_L7O9eHOdsGZUoFpgdlc17nDHv	0	10	2024-04-03 16:15:00	2024-04-03 16:15:00	5
72	100	pi_3P1WluBjsMxFtgBe1X9optyd	613074142	pi_3P1WluBjsMxFtgBe1X9optyd_secret_U3x6DJxxYB1oZoDyshYabo1zC	0	10	2024-04-03 16:34:00	2024-04-03 16:34:00	5
73	100	pi_3P1atnBjsMxFtgBe0wkymUl8	68	pi_3P1atnBjsMxFtgBe0wkymUl8_secret_DtawiUAKiwPHQLPDpc3lQ8Q3q	1	10	2024-04-03 20:59:00	2024-04-03 20:59:55	0
74	100	pi_3P1ax9BjsMxFtgBe0yuOfffb	69	pi_3P1ax9BjsMxFtgBe0yuOfffb_secret_UMtQdT9Vok1H3BANQjN7byRaF	1	10	2024-04-03 21:02:00	2024-04-03 21:03:14	0
75	100	pi_3P1cKuBjsMxFtgBe1voN3r33	70	pi_3P1cKuBjsMxFtgBe1voN3r33_secret_ghxHTwEL4rIeZQB2qw4mkMeP0	1	10	2024-04-03 22:31:00	2024-04-03 22:31:49	1
76	100	pi_3P1vprBjsMxFtgBe09badmTb	191744564	pi_3P1vprBjsMxFtgBe09badmTb_secret_ZW7Ie7p0iKXgAPEykds1SQJej	0	31	2024-04-04 19:20:00	2024-04-04 19:20:00	5
77	100	pi_3P1wbSBjsMxFtgBe15hdPlLI	801131783	pi_3P1wbSBjsMxFtgBe15hdPlLI_secret_D6NuI2eSPmqA5qCm5o2PZinIg	0	31	2024-04-04 20:09:00	2024-04-04 20:09:00	5
78	100	pi_3P1wdqBjsMxFtgBe0i3vngJu	140693905	pi_3P1wdqBjsMxFtgBe0i3vngJu_secret_IyI1JzRUnGDbzVgxPYaqCH3u2	0	31	2024-04-04 20:12:00	2024-04-04 20:12:00	5
79	100	pi_3P1wkvBjsMxFtgBe1H7xJTjU	234457269	pi_3P1wkvBjsMxFtgBe1H7xJTjU_secret_R9s7N8Yf03klkiRAyE6PqYXEh	0	31	2024-04-04 20:19:00	2024-04-04 20:19:00	5
80	100	pi_3P1yBjBjsMxFtgBe03dh42SC	870445588	pi_3P1yBjBjsMxFtgBe03dh42SC_secret_Fh7lyZDWEzsvtLuWRZRkIomtT	0	5	2024-04-04 21:51:00	2024-04-04 21:51:00	5
81	100	pi_3P1yBwBjsMxFtgBe1Zs6YaxG	961183920	pi_3P1yBwBjsMxFtgBe1Zs6YaxG_secret_lmYq8FcmFXdJ47Og7KTfcp419	0	5	2024-04-04 21:51:00	2024-04-04 21:51:00	5
82	100	pi_3P1yCfBjsMxFtgBe0w4uALrA	604870546	pi_3P1yCfBjsMxFtgBe0w4uALrA_secret_TqW71rHADXlNBW21BEwVr9sTH	0	5	2024-04-04 21:52:00	2024-04-04 21:52:00	5
83	100	pi_3P1yGYBjsMxFtgBe0ynUCQAc	331325471	pi_3P1yGYBjsMxFtgBe0ynUCQAc_secret_AXMWn1n6pRIw4gr1cAB15CNZO	0	5	2024-04-04 21:56:00	2024-04-04 21:56:00	5
84	100	pi_3P1yHpBjsMxFtgBe1u7h9Ro2	671997009	pi_3P1yHpBjsMxFtgBe1u7h9Ro2_secret_9FU8Q3CLgtQZCQ0GNPVofIcOR	0	24	2024-04-04 21:57:00	2024-04-04 21:57:00	5
85	100	pi_3P1yHyBjsMxFtgBe1Sv5tsC6	931344211	pi_3P1yHyBjsMxFtgBe1Sv5tsC6_secret_BHTenP6QUijsjh3M97MEIxSPc	0	5	2024-04-04 21:57:00	2024-04-04 21:57:00	5
86	100	pi_3P1yJTBjsMxFtgBe0OldTiXU	472365023	pi_3P1yJTBjsMxFtgBe0OldTiXU_secret_c5YT87aYu1lYzVldhVyrz2Lel	0	24	2024-04-04 21:59:00	2024-04-04 21:59:00	5
87	100	pi_3P1yN5BjsMxFtgBe1DQuchu8	260662085	pi_3P1yN5BjsMxFtgBe1DQuchu8_secret_EA1Tq18UBOAUhAcHeKRkyriSY	0	5	2024-04-04 22:02:00	2024-04-04 22:02:00	5
88	100	pi_3P1yOPBjsMxFtgBe0rNSg7Nf	783523698	pi_3P1yOPBjsMxFtgBe0rNSg7Nf_secret_0iIHrnaSQHZFl4VMKHeTMAoy4	0	5	2024-04-04 22:04:00	2024-04-04 22:04:00	5
89	100	pi_3P1yPWBjsMxFtgBe1MACx9jK	418039959	pi_3P1yPWBjsMxFtgBe1MACx9jK_secret_HazoBFXUoOnf7SpRuCc4NTvdo	0	5	2024-04-04 22:05:00	2024-04-04 22:05:00	5
90	100	pi_3P1yQkBjsMxFtgBe1wb0wMJX	706355881	pi_3P1yQkBjsMxFtgBe1wb0wMJX_secret_yK6Du56lNpipmwA5ykpZseOT2	0	5	2024-04-04 22:06:00	2024-04-04 22:06:00	5
91	100	pi_3P1yT5BjsMxFtgBe0PXzY4tp	722315847	pi_3P1yT5BjsMxFtgBe0PXzY4tp_secret_vRZ4mIHfmflE7irpd2JxRYbTQ	0	5	2024-04-04 22:09:00	2024-04-04 22:09:00	5
92	100	pi_3P1yXABjsMxFtgBe0dvLPfCP	271224299	pi_3P1yXABjsMxFtgBe0dvLPfCP_secret_A0JyuKq4btEkp5PxGAd7sKyxe	0	5	2024-04-04 22:13:00	2024-04-04 22:13:00	5
93	100	pi_3P1yXRBjsMxFtgBe0zHNXkdK	757081461	pi_3P1yXRBjsMxFtgBe0zHNXkdK_secret_qLvuunCSu3xwzNOqXv5c4RFpc	0	5	2024-04-04 22:13:00	2024-04-04 22:13:00	5
94	100	pi_3P1yYGBjsMxFtgBe1VxcP8Ac	538186108	pi_3P1yYGBjsMxFtgBe1VxcP8Ac_secret_nsTF7aPvXcupAwxKwYrE0IP1e	0	5	2024-04-04 22:14:00	2024-04-04 22:14:00	5
95	100	pi_3P1yb3BjsMxFtgBe0b02HoTw	449822500	pi_3P1yb3BjsMxFtgBe0b02HoTw_secret_IM0L8f7zkSs8LsSD0onvUjWMo	0	5	2024-04-04 22:17:00	2024-04-04 22:17:00	5
96	100	pi_3P1yeUBjsMxFtgBe1xqK2X9h	794925065	pi_3P1yeUBjsMxFtgBe1xqK2X9h_secret_BMIwyaskh8uOhKVDnL7q5wMPL	0	5	2024-04-04 22:20:00	2024-04-04 22:20:00	5
97	100	pi_3P1yhVBjsMxFtgBe17Ix1JEx	535641898	pi_3P1yhVBjsMxFtgBe17Ix1JEx_secret_H4R6UTSTxqljvWGMCpGBL0wAm	0	5	2024-04-04 22:24:00	2024-04-04 22:24:00	5
98	100	pi_3P1yiVBjsMxFtgBe1dBIOqRq	405702645	pi_3P1yiVBjsMxFtgBe1dBIOqRq_secret_UCEM1njhJBoOyabTsXI4Lm32W	0	5	2024-04-04 22:25:00	2024-04-04 22:25:00	5
99	100	pi_3P1yidBjsMxFtgBe0qiOL484	391608989	pi_3P1yidBjsMxFtgBe0qiOL484_secret_6bQcQT8u7HHp5jbwBa5wpjfmi	0	5	2024-04-04 22:25:00	2024-04-04 22:25:00	5
100	100	pi_3P1zVwBjsMxFtgBe1u5GDgeD	747819563	pi_3P1zVwBjsMxFtgBe1u5GDgeD_secret_gnnuteXBrBxN5APkA5JrNUc9B	0	5	2024-04-04 23:16:00	2024-04-04 23:16:00	5
101	100	pi_3P1zZ2BjsMxFtgBe0Um0QnH3	597497312	pi_3P1zZ2BjsMxFtgBe0Um0QnH3_secret_W3e75F5UoOTpSTmnVYLHr5l91	0	5	2024-04-04 23:19:00	2024-04-04 23:19:00	5
102	100	pi_3P1zaaBjsMxFtgBe1PZJwuBt	288047703	pi_3P1zaaBjsMxFtgBe1PZJwuBt_secret_8YpzXXIfkPi4nfUnvnA4VBDI5	0	5	2024-04-04 23:21:00	2024-04-04 23:21:00	5
103	100	pi_3P20UMBjsMxFtgBe06BYjvnC	123435406	pi_3P20UMBjsMxFtgBe06BYjvnC_secret_ae2EcAdqiVKyjz9CCnj6FwzEZ	0	35	2024-04-05 00:18:00	2024-04-05 00:18:00	5
104	100	pi_3P2eusBjsMxFtgBe0BQNA47e	4	pi_3P2eusBjsMxFtgBe0BQNA47e_secret_dp2ZfoocVyoq8qWylCYSZFWiX	0	31	2024-04-06 19:28:00	2024-04-06 19:28:00	2
105	100	pi_3P2f8HBjsMxFtgBe1Kjcl2BN	5	pi_3P2f8HBjsMxFtgBe1Kjcl2BN_secret_ipnuozAJKdjSvWeFa3r7ObDh0	0	31	2024-04-06 19:42:00	2024-04-06 19:42:00	2
106	100	pi_3P2fACBjsMxFtgBe1FO2Cj3j	6	pi_3P2fACBjsMxFtgBe1FO2Cj3j_secret_gYwT2pFZHm98ofhwulVE71i0S	0	31	2024-04-06 19:44:00	2024-04-06 19:44:00	2
107	100	pi_3P2fhVBjsMxFtgBe0j3PWL8X	7	pi_3P2fhVBjsMxFtgBe0j3PWL8X_secret_sLbunxsyu8RyxNXUApqFokgEL	0	31	2024-04-06 20:18:00	2024-04-06 20:18:00	2
108	100	pi_3P2iT8BjsMxFtgBe0wKcVogc	8	pi_3P2iT8BjsMxFtgBe0wKcVogc_secret_Lv3HgOcUgcTNqmF8GWDjIXO1S	0	31	2024-04-06 23:16:00	2024-04-06 23:16:00	2
109	100	pi_3P37dCBjsMxFtgBe04R6ja6f	519698454	pi_3P37dCBjsMxFtgBe04R6ja6f_secret_vNR9O5a6WIxh17OFejgyuQ0vF	0	61	2024-04-08 02:08:00	2024-04-08 02:08:00	5
110	10	pi_3P39srBjsMxFtgBe0Bl2oMmx	385849004	pi_3P39srBjsMxFtgBe0Bl2oMmx_secret_yNPuldjsZRDTO0xp67DyDtIwg	0	62	2024-04-08 04:32:00	2024-04-08 04:32:00	5
111	10	pi_3P3A3IBjsMxFtgBe0k1QlJ0B	715987896	pi_3P3A3IBjsMxFtgBe0k1QlJ0B_secret_qURuzZqHK6nFHsr0WBZyHM0Eu	0	63	2024-04-08 04:43:00	2024-04-08 04:43:00	5
112	10	pi_3P3ABiBjsMxFtgBe0WLHPyZG	999733054	pi_3P3ABiBjsMxFtgBe0WLHPyZG_secret_JGX7uiI986eFGclwIlhcEfK9v	0	64	2024-04-08 04:52:00	2024-04-08 04:52:00	5
113	10	pi_3P3DIXBjsMxFtgBe0uJo7cJk	672450193	pi_3P3DIXBjsMxFtgBe0uJo7cJk_secret_7Iu83ClAQgxvADTm09SRCOtMT	0	5	2024-04-08 08:11:00	2024-04-08 08:11:00	5
114	25	pi_3P3DYFBjsMxFtgBe17R962Ad	9	pi_3P3DYFBjsMxFtgBe17R962Ad_secret_fyNJCp5DLhMreanbhq1tZBCCB	1	62	2024-04-08 08:27:00	2024-04-08 08:28:02	2
115	10	pi_3P3FHNBjsMxFtgBe0vOZnquF	687241673	pi_3P3FHNBjsMxFtgBe0vOZnquF_secret_LDKoSFs1IYWAcQA4saLbQNeBQ	0	12	2024-04-08 10:18:00	2024-04-08 10:18:00	5
116	100	pi_3P3FcTBjsMxFtgBe1ElgNop8	812669623	pi_3P3FcTBjsMxFtgBe1ElgNop8_secret_1tvPoTzuGesoR2t14iniVgQ2b	0	59	2024-04-08 10:40:00	2024-04-08 10:40:00	5
117	100	pi_3P3FdDBjsMxFtgBe1EQXQbiX	243900957	pi_3P3FdDBjsMxFtgBe1EQXQbiX_secret_ACKeiSfJQXydixWjCWWLtQKuH	0	59	2024-04-08 10:40:00	2024-04-08 10:40:00	5
118	10	pi_3P3G5kBjsMxFtgBe1YcSZTnG	612016978	pi_3P3G5kBjsMxFtgBe1YcSZTnG_secret_llBvrW8h9qLX41FJLtNLdAZ0d	0	66	2024-04-08 11:10:00	2024-04-08 11:10:00	5
119	1809	pi_3P3Gv5BjsMxFtgBe0zNMLDI1	71	pi_3P3Gv5BjsMxFtgBe0zNMLDI1_secret_QbmskjTTvYPLJut6yvQDg6Lgp	1	62	2024-04-08 12:03:00	2024-04-08 12:04:43	0
120	301.5	pi_3P3HEJBjsMxFtgBe1GratoNf	72	pi_3P3HEJBjsMxFtgBe1GratoNf_secret_9mCUtWGWRgmkynpbbarOpjB4V	0	62	2024-04-08 12:23:00	2024-04-08 12:23:00	0
121	402	pi_3P3HG7BjsMxFtgBe1Snc8CzB	73	pi_3P3HG7BjsMxFtgBe1Snc8CzB_secret_JLHaj4lDAnmbz8gDLrERLGltx	0	62	2024-04-08 12:25:00	2024-04-08 12:25:00	0
122	502.5	pi_3P3HGQBjsMxFtgBe0z9PtAGv	74	pi_3P3HGQBjsMxFtgBe0z9PtAGv_secret_iSnGBtkWkfLy1T7EmlJBwi7fV	0	62	2024-04-08 12:25:00	2024-04-08 12:25:00	0
123	502.5	pi_3P3HGfBjsMxFtgBe182hdN47	75	pi_3P3HGfBjsMxFtgBe182hdN47_secret_ExnHLKSj69aw39NAydW5RJdIu	0	62	2024-04-08 12:25:00	2024-04-08 12:25:00	0
124	502.5	pi_3P3HO4BjsMxFtgBe09c802bL	76	pi_3P3HO4BjsMxFtgBe09c802bL_secret_X5prgyQFYtaKq9lf80EIZovCM	0	62	2024-04-08 12:33:00	2024-04-08 12:33:00	0
125	502.5	pi_3P3HhlBjsMxFtgBe0ptPdhQz	77	pi_3P3HhlBjsMxFtgBe0ptPdhQz_secret_h4sWQaVL91eVRh9dTBVA6i4Iz	0	62	2024-04-08 12:53:00	2024-04-08 12:53:00	0
126	10	pi_3P3NpSBjsMxFtgBe0zXMygqC	974795918	pi_3P3NpSBjsMxFtgBe0zXMygqC_secret_nE9ukC0Lpl9gUPvEl9hFvu2xr	0	7	2024-04-08 19:26:00	2024-04-08 19:26:00	5
127	1206	pi_3P3OMfBjsMxFtgBe0hf42Xir	78	pi_3P3OMfBjsMxFtgBe0hf42Xir_secret_omcqqpFCUTrrutzZQMoa46RUu	0	5	2024-04-08 20:00:00	2024-04-08 20:00:00	0
128	804	pi_3P3OQNBjsMxFtgBe08GM6rtr	79	pi_3P3OQNBjsMxFtgBe08GM6rtr_secret_6jiM5iX5JkzlVw2gVaKiwF2TR	0	5	2024-04-08 20:04:00	2024-04-08 20:04:00	0
129	301.5	pi_3P3OSBBjsMxFtgBe06k42IdW	80	pi_3P3OSBBjsMxFtgBe06k42IdW_secret_IeZM7Vf3dGTCUEgAHitMOxH3r	0	5	2024-04-08 20:06:00	2024-04-08 20:06:00	0
130	10	pi_3P3XhgBjsMxFtgBe055IyXpz	558978804	pi_3P3XhgBjsMxFtgBe055IyXpz_secret_WZAM4tHndGbCJK8W6QhrYdsPB	0	68	2024-04-09 05:58:00	2024-04-09 05:58:00	5
131	100.5	pi_3P3YtpBjsMxFtgBe0egktIvp	81	pi_3P3YtpBjsMxFtgBe0egktIvp_secret_KzCwxPeC5eDwNuv64s4gjpZxh	0	62	2024-04-09 07:15:00	2024-04-09 07:15:00	0
132	100.5	pi_3P3Yu5BjsMxFtgBe01PvcYMH	82	pi_3P3Yu5BjsMxFtgBe01PvcYMH_secret_d13A9vFU9j364hKVfr3XRC8CS	0	62	2024-04-09 07:15:00	2024-04-09 07:15:00	0
133	201	pi_3P3YuNBjsMxFtgBe1cSAvzQs	83	pi_3P3YuNBjsMxFtgBe1cSAvzQs_secret_p9tWTgKEjLhpFCs4oQiCb6yFh	0	62	2024-04-09 07:15:00	2024-04-09 07:15:00	0
134	201	pi_3P3Yv8BjsMxFtgBe1X0p6g2z	84	pi_3P3Yv8BjsMxFtgBe1X0p6g2z_secret_OtFLz9FuLy21C38VIG4imXaJG	1	62	2024-04-09 07:16:00	2024-04-09 07:17:03	0
135	402	pi_3P3bY1BjsMxFtgBe1lfLY37w	85	pi_3P3bY1BjsMxFtgBe1lfLY37w_secret_DagAkSHkzNbQFn10MGBYSCqvz	1	68	2024-04-09 10:05:00	2024-04-09 10:05:26	0
136	8	pi_3P3cHdBjsMxFtgBe02WUvdCk	86	pi_3P3cHdBjsMxFtgBe02WUvdCk_secret_RNxQXWlFlUWXK0j7or6uRcQ9Y	1	68	2024-04-09 10:52:00	2024-04-09 10:52:33	0
137	100	pi_3P3cLaBjsMxFtgBe0xxGNoOW	87	pi_3P3cLaBjsMxFtgBe0xxGNoOW_secret_ZfHbXuQiq5ZXXazfiOvIBwzRq	1	68	2024-04-09 10:56:00	2024-04-09 10:56:37	0
138	100	pi_3P3cMnBjsMxFtgBe0QAmmehB	88	pi_3P3cMnBjsMxFtgBe0QAmmehB_secret_X3hCgmxzCCSphJ9EUqw9FOD17	1	68	2024-04-09 10:57:00	2024-04-09 10:57:49	0
139	10	pi_3P3dEJBjsMxFtgBe01MpM4Ls	783032109	pi_3P3dEJBjsMxFtgBe01MpM4Ls_secret_gNgVrAUBTGeP0zn8DDmREELLY	0	69	2024-04-09 11:52:00	2024-04-09 11:52:00	5
140	100.5	pi_3P3g3TBjsMxFtgBe1azOeBSM	89	pi_3P3g3TBjsMxFtgBe1azOeBSM_secret_eRNIg8gp8IR0w1TZnU7FBeIUU	1	12	2024-04-09 14:53:00	2024-04-09 14:54:09	0
141	10	pi_3P3gLqBjsMxFtgBe11h3Ta53	933907688	pi_3P3gLqBjsMxFtgBe11h3Ta53_secret_E3kZCVQPbvaYJagCMSfJovYGU	0	36	2024-04-09 15:12:00	2024-04-09 15:12:00	5
142	10	pi_3P3gMlBjsMxFtgBe1508Kd6W	381500442	pi_3P3gMlBjsMxFtgBe1508Kd6W_secret_AawFwNHvSUhWwroE4Lmd3f9zw	0	36	2024-04-09 15:13:00	2024-04-09 15:13:00	5
143	100	pi_3P3m9eBjsMxFtgBe0w9mNdHu	90	pi_3P3m9eBjsMxFtgBe0w9mNdHu_secret_4UIHwSIZaWNxBy59i0t9TVUCN	1	5	2024-04-09 21:24:00	2024-04-09 21:24:55	0
144	100.5	pi_3P3mo0BjsMxFtgBe0lEpz108	91	pi_3P3mo0BjsMxFtgBe0lEpz108_secret_Z5eOWK8BjD5CNtm8MnwivsPnY	0	5	2024-04-09 22:06:00	2024-04-09 22:06:00	0
145	200	pi_3P3muKBjsMxFtgBe1QYSG69U	92	pi_3P3muKBjsMxFtgBe1QYSG69U_secret_bGuJAY0TTthXzcmhgcuTQrgUK	1	5	2024-04-09 22:12:00	2024-04-09 22:13:07	0
146	100	pi_3P3n8nBjsMxFtgBe0sMlXykh	612181139	pi_3P3n8nBjsMxFtgBe0sMlXykh_secret_8gMVelOVoWsplIzlPgUgqXbmX	0	24	2024-04-09 22:27:00	2024-04-09 22:27:00	5
147	100	pi_3P3nKYBjsMxFtgBe0ImCcMxi	835547734	pi_3P3nKYBjsMxFtgBe0ImCcMxi_secret_SN78PRAjQ7VYnUq3fLllZIu8H	0	24	2024-04-09 22:39:00	2024-04-09 22:39:00	5
148	100	pi_3P3nM1BjsMxFtgBe0mVzTm1L	406051388	pi_3P3nM1BjsMxFtgBe0mVzTm1L_secret_fW8IHh5iaeFIToLDCpjUjvYD4	0	24	2024-04-09 22:41:00	2024-04-09 22:41:00	5
149	100	pi_3P3nS6BjsMxFtgBe0LcAqIMd	828608533	pi_3P3nS6BjsMxFtgBe0LcAqIMd_secret_exwSZNm6E1sLp76hpOEmP7dFR	0	24	2024-04-09 22:47:00	2024-04-09 22:47:00	5
150	100	pi_3P3nSdBjsMxFtgBe09rmdPOd	875795410	pi_3P3nSdBjsMxFtgBe09rmdPOd_secret_nveMFHQOfbfdpwInDqwbXyX08	0	24	2024-04-09 22:48:00	2024-04-09 22:48:00	5
151	100	pi_3P3nakBjsMxFtgBe0ZLAggbn	809178839	pi_3P3nakBjsMxFtgBe0ZLAggbn_secret_Q3bXMl3kbGAYKFMwvawNs34o8	1	24	2024-04-09 22:56:00	2024-04-09 22:56:46	5
152	100	pi_3P3nbLBjsMxFtgBe1y63gE17	660727296	pi_3P3nbLBjsMxFtgBe1y63gE17_secret_BD3va31dlMw3Nym9hhCsobN33	1	24	2024-04-09 22:57:00	2024-04-09 22:57:26	5
153	100	pi_3P3nc3BjsMxFtgBe0ZWT2GEb	465732035	pi_3P3nc3BjsMxFtgBe0ZWT2GEb_secret_tjHhqVW9A2MYbM9tXjjYrrVEz	1	24	2024-04-09 22:57:00	2024-04-09 22:58:07	5
154	100	pi_3P3nfVBjsMxFtgBe0Gxb9jI2	822559079	pi_3P3nfVBjsMxFtgBe0Gxb9jI2_secret_NstINhkkmN5k5f8f47RjkJ7Dz	1	24	2024-04-09 23:01:00	2024-04-09 23:01:46	5
155	10	pi_3P402lBjsMxFtgBe0H8Ily9T	499800811	pi_3P402lBjsMxFtgBe0H8Ily9T_secret_7lB2UGkYOuh8dqzdOL6Mpn6Yv	1	70	2024-04-10 12:14:00	2024-04-10 12:15:00	5
156	200	pi_3P408bBjsMxFtgBe1ALF1qbc	93	pi_3P408bBjsMxFtgBe1ALF1qbc_secret_tx7YaELTTMSLT2zMhhcfGac1Z	0	70	2024-04-10 12:20:00	2024-04-10 12:20:00	1
157	300	pi_3P40A2BjsMxFtgBe1XiBa34c	94	pi_3P40A2BjsMxFtgBe1XiBa34c_secret_PprDtOCibx3wHBlhNkpJ1pBXO	1	70	2024-04-10 12:21:00	2024-04-10 12:22:35	1
158	200	pi_3P45pZBjsMxFtgBe0iH5ZIzH	95	pi_3P45pZBjsMxFtgBe0iH5ZIzH_secret_0TFOMnlciDqBry7CcoDRScjPH	1	70	2024-04-10 18:25:00	2024-04-10 18:26:05	0
159	200	pi_3P46C8BjsMxFtgBe10JUHWlw	96	pi_3P46C8BjsMxFtgBe10JUHWlw_secret_cHH94iVfJvX4rZMGQAF8PKYdq	1	70	2024-04-10 18:48:00	2024-04-10 18:49:17	0
160	200	pi_3P46ORBjsMxFtgBe11PmG1L5	97	pi_3P46ORBjsMxFtgBe11PmG1L5_secret_c3Rs4UClrSAYLmGztGURvhiFV	0	70	2024-04-10 19:01:00	2024-04-10 19:01:00	0
161	200	pi_3P4EGxBjsMxFtgBe0RPE5JeU	98	pi_3P4EGxBjsMxFtgBe0RPE5JeU_secret_YAcR8dFxNPvr9xlZg9HZZpOjy	1	70	2024-04-11 03:26:00	2024-04-11 03:26:37	0
162	10	pi_3P4dBWBjsMxFtgBe0e3s4aAG	436881783	pi_3P4dBWBjsMxFtgBe0e3s4aAG_secret_um8EpQRBNDwrsgyLjwUChiDet	1	71	2024-04-12 06:02:00	2024-04-12 06:02:26	5
163	100	pi_3P4daZBjsMxFtgBe1wgXC8Ge	99	pi_3P4daZBjsMxFtgBe1wgXC8Ge_secret_1yTGLWrqIGKnaqPYXVLwOiNoE	1	71	2024-04-12 06:27:00	2024-04-12 06:28:16	0
164	25	pi_3P5CtOBjsMxFtgBe1x2YMJq2	100	pi_3P5CtOBjsMxFtgBe1x2YMJq2_secret_qZ2Ns5ydUbmo33iLwskJHYvHN	1	5	2024-04-13 20:09:00	2024-04-13 20:10:13	0
165	100	pi_3P5XeFBjsMxFtgBe1SKCPRTn	101	pi_3P5XeFBjsMxFtgBe1SKCPRTn_secret_pQoE6p47BgfguyOMJ3cKqNTzb	1	36	2024-04-14 18:19:00	2024-04-14 18:19:56	0
166	100	pi_3P5nP3BjsMxFtgBe1GLltfwe	565593024	pi_3P5nP3BjsMxFtgBe1GLltfwe_secret_gzVtieihEE2o7amqJW8LwvnmU	1	73	2024-04-15 11:08:00	2024-04-15 11:09:17	5
167	50	pi_3P5njsBjsMxFtgBe01cm6HAJ	102	pi_3P5njsBjsMxFtgBe01cm6HAJ_secret_FDFIJYrfFgkOMXzsMaGspUqva	1	62	2024-04-15 11:30:00	2024-04-15 11:30:43	0
168	25	pi_3P5nnnBjsMxFtgBe0xJGMNlG	103	pi_3P5nnnBjsMxFtgBe0xJGMNlG_secret_XmaCG8xHs57LvVYRiAfasu5lO	1	62	2024-04-15 11:34:00	2024-04-15 11:34:54	0
169	50	pi_3P5s38BjsMxFtgBe0UbtvC5g	104	pi_3P5s38BjsMxFtgBe0UbtvC5g_secret_604yO6y2jDlhVpt1Y2PWBzVdD	0	5	2024-04-15 16:06:00	2024-04-15 16:06:00	0
170	25	pi_3P5s4aBjsMxFtgBe12xUJkEg	105	pi_3P5s4aBjsMxFtgBe12xUJkEg_secret_XgXX3VD242zmsRNTWRXc955fN	0	5	2024-04-15 16:08:00	2024-04-15 16:08:00	0
171	100	pi_3P5y0iBjsMxFtgBe1gG946jp	453844622	pi_3P5y0iBjsMxFtgBe1gG946jp_secret_ELt9md28Br9uf3TDAJ6HMQ3TF	0	74	2024-04-15 22:28:00	2024-04-15 22:28:00	5
172	100	pi_3P5y0yBjsMxFtgBe0LKtmlkg	844744382	pi_3P5y0yBjsMxFtgBe0LKtmlkg_secret_0ATKaO7gWTMQwCupYJz8m05mx	0	74	2024-04-15 22:28:00	2024-04-15 22:28:00	5
173	100	pi_3P5y20BjsMxFtgBe1ueQzzC1	438744954	pi_3P5y20BjsMxFtgBe1ueQzzC1_secret_UhNcu8L8RHBRFEwRijFBtm1Mb	1	74	2024-04-15 22:29:00	2024-04-15 22:35:18	5
174	100	pi_3P5zyLBjsMxFtgBe10vECplz	391302861	pi_3P5zyLBjsMxFtgBe10vECplz_secret_Cohd9m0UJbR0lvaqUWEyd6EjT	1	75	2024-04-16 00:34:00	2024-04-16 00:34:42	5
175	500	pi_3P62gKBjsMxFtgBe1p4eqULb	106	pi_3P62gKBjsMxFtgBe1p4eqULb_secret_lvIG9w2KH939ohrbOZCy2JobC	0	75	2024-04-16 03:27:00	2024-04-16 03:27:00	1
176	50	pi_3P65RbBjsMxFtgBe0uRdyR4J	107	pi_3P65RbBjsMxFtgBe0uRdyR4J_secret_UwNoLEO48bkD0TzIn5nKfpdrn	0	74	2024-04-16 06:24:00	2024-04-16 06:24:00	0
177	210	pi_3P67NqBjsMxFtgBe0N5XapNV	108	pi_3P67NqBjsMxFtgBe0N5XapNV_secret_SF6hGZezIImLJAVKg6YPrGafh	1	75	2024-04-16 08:28:00	2024-04-16 08:29:17	0
178	100	pi_3P68hMBjsMxFtgBe027BAWPX	950745528	pi_3P68hMBjsMxFtgBe027BAWPX_secret_HVVjauwYItvIpMMiU2X2g9g2p	1	76	2024-04-16 09:53:00	2024-04-16 09:53:56	5
179	420	pi_3P6EipBjsMxFtgBe1FUeYHeA	109	pi_3P6EipBjsMxFtgBe1FUeYHeA_secret_M4h73YdGify0O8vdArheojW1p	0	74	2024-04-16 16:19:00	2024-04-16 16:19:00	0
180	210	pi_3P6Ek8BjsMxFtgBe1jq9vSqv	110	pi_3P6Ek8BjsMxFtgBe1jq9vSqv_secret_QFTJGdcep6EeR2AFeK72ihWcl	0	74	2024-04-16 16:20:00	2024-04-16 16:20:00	0
181	100	pi_3P6HB1BjsMxFtgBe1SLEwaCi	111	pi_3P6HB1BjsMxFtgBe1SLEwaCi_secret_wDWuRry8RDcFqUlI4J94OFgTH	0	53	2024-04-16 18:56:00	2024-04-16 18:56:00	0
182	100	pi_3P6HCuBjsMxFtgBe09TIKy1d	112	pi_3P6HCuBjsMxFtgBe09TIKy1d_secret_kQljtMdy4m8LWNFm5zLLnPVMI	0	53	2024-04-16 18:58:00	2024-04-16 18:58:00	0
183	100	pi_3P6HEIBjsMxFtgBe00DMzHQw	113	pi_3P6HEIBjsMxFtgBe00DMzHQw_secret_YTHj13aQJnyXndPLdnHGjin6Q	0	53	2024-04-16 18:59:00	2024-04-16 18:59:00	0
184	100	pi_3P6HHWBjsMxFtgBe0piWCCqG	114	pi_3P6HHWBjsMxFtgBe0piWCCqG_secret_HFuZqzaocbENxdLUomyJq2s6h	1	53	2024-04-16 19:03:00	2024-04-16 19:03:48	0
185	420	pi_3P6NSJBjsMxFtgBe0zLirpmp	115	pi_3P6NSJBjsMxFtgBe0zLirpmp_secret_hUSiu6A9uGLXlsdx5byoF5dh1	0	74	2024-04-17 01:38:00	2024-04-17 01:38:00	0
186	420	pi_3P6NScBjsMxFtgBe0XXUsDje	116	pi_3P6NScBjsMxFtgBe0XXUsDje_secret_OGmIzafTH7bAD3ShPe1Wp0qdQ	1	74	2024-04-17 01:38:00	2024-04-17 01:39:25	0
\.


--
-- Data for Name: payment_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_report (id, transaction_id, payment_status, user_id, ref_id, amount, method_type, vat, wallet_amount_used, created_at, updated_at, payment_response) FROM stdin;
\.


--
-- Data for Name: payment_temp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_temp (id, amount, payment_ref, payment_id, membership_id, user_id, created_at, updated_at) FROM stdin;
1	100	pi_3P1WT4BjsMxFtgBe0bkoTcKi_secret_L7O9eHOdsGZUoFpgdlc17nDHv	968634162	1	0	2024-04-03 16:15:18	2024-04-03 16:15:18
2	100	pi_3P1WluBjsMxFtgBe1X9optyd_secret_U3x6DJxxYB1oZoDyshYabo1zC	613074142	1	0	2024-04-03 16:34:46	2024-04-03 16:34:46
3	100	pi_3P1vprBjsMxFtgBe09badmTb_secret_ZW7Ie7p0iKXgAPEykds1SQJej	191744564	1	0	2024-04-04 19:20:31	2024-04-04 19:20:31
4	100	pi_3P1wbSBjsMxFtgBe15hdPlLI_secret_D6NuI2eSPmqA5qCm5o2PZinIg	801131783	1	0	2024-04-04 20:09:42	2024-04-04 20:09:42
5	100	pi_3P1wdqBjsMxFtgBe0i3vngJu_secret_IyI1JzRUnGDbzVgxPYaqCH3u2	140693905	1	0	2024-04-04 20:12:11	2024-04-04 20:12:11
6	100	pi_3P1wkvBjsMxFtgBe1H7xJTjU_secret_R9s7N8Yf03klkiRAyE6PqYXEh	234457269	1	0	2024-04-04 20:19:29	2024-04-04 20:19:29
7	100	pi_3P1yBjBjsMxFtgBe03dh42SC_secret_Fh7lyZDWEzsvtLuWRZRkIomtT	870445588	1	0	2024-04-04 21:51:15	2024-04-04 21:51:15
8	100	pi_3P1yBwBjsMxFtgBe1Zs6YaxG_secret_lmYq8FcmFXdJ47Og7KTfcp419	961183920	1	0	2024-04-04 21:51:28	2024-04-04 21:51:28
9	100	pi_3P1yCfBjsMxFtgBe0w4uALrA_secret_TqW71rHADXlNBW21BEwVr9sTH	604870546	1	0	2024-04-04 21:52:14	2024-04-04 21:52:14
10	100	pi_3P1yGYBjsMxFtgBe0ynUCQAc_secret_AXMWn1n6pRIw4gr1cAB15CNZO	331325471	1	0	2024-04-04 21:56:15	2024-04-04 21:56:15
11	100	pi_3P1yHpBjsMxFtgBe1u7h9Ro2_secret_9FU8Q3CLgtQZCQ0GNPVofIcOR	671997009	1	0	2024-04-04 21:57:34	2024-04-04 21:57:34
12	100	pi_3P1yHyBjsMxFtgBe1Sv5tsC6_secret_BHTenP6QUijsjh3M97MEIxSPc	931344211	1	0	2024-04-04 21:57:42	2024-04-04 21:57:42
13	100	pi_3P1yJTBjsMxFtgBe0OldTiXU_secret_c5YT87aYu1lYzVldhVyrz2Lel	472365023	1	0	2024-04-04 21:59:15	2024-04-04 21:59:15
14	100	pi_3P1yN5BjsMxFtgBe1DQuchu8_secret_EA1Tq18UBOAUhAcHeKRkyriSY	260662085	1	0	2024-04-04 22:02:59	2024-04-04 22:02:59
15	100	pi_3P1yOPBjsMxFtgBe0rNSg7Nf_secret_0iIHrnaSQHZFl4VMKHeTMAoy4	783523698	1	0	2024-04-04 22:04:21	2024-04-04 22:04:21
16	100	pi_3P1yPWBjsMxFtgBe1MACx9jK_secret_HazoBFXUoOnf7SpRuCc4NTvdo	418039959	1	0	2024-04-04 22:05:30	2024-04-04 22:05:30
17	100	pi_3P1yQkBjsMxFtgBe1wb0wMJX_secret_yK6Du56lNpipmwA5ykpZseOT2	706355881	1	0	2024-04-04 22:06:46	2024-04-04 22:06:46
18	100	pi_3P1yT5BjsMxFtgBe0PXzY4tp_secret_vRZ4mIHfmflE7irpd2JxRYbTQ	722315847	1	0	2024-04-04 22:09:11	2024-04-04 22:09:11
19	100	pi_3P1yXABjsMxFtgBe0dvLPfCP_secret_A0JyuKq4btEkp5PxGAd7sKyxe	271224299	1	0	2024-04-04 22:13:25	2024-04-04 22:13:25
20	100	pi_3P1yXRBjsMxFtgBe0zHNXkdK_secret_qLvuunCSu3xwzNOqXv5c4RFpc	757081461	1	0	2024-04-04 22:13:41	2024-04-04 22:13:41
21	100	pi_3P1yYGBjsMxFtgBe1VxcP8Ac_secret_nsTF7aPvXcupAwxKwYrE0IP1e	538186108	1	0	2024-04-04 22:14:32	2024-04-04 22:14:32
22	100	pi_3P1yb3BjsMxFtgBe0b02HoTw_secret_IM0L8f7zkSs8LsSD0onvUjWMo	449822500	1	0	2024-04-04 22:17:25	2024-04-04 22:17:25
23	100	pi_3P1yeUBjsMxFtgBe1xqK2X9h_secret_BMIwyaskh8uOhKVDnL7q5wMPL	794925065	1	0	2024-04-04 22:20:58	2024-04-04 22:20:58
24	100	pi_3P1yhVBjsMxFtgBe17Ix1JEx_secret_H4R6UTSTxqljvWGMCpGBL0wAm	535641898	1	0	2024-04-04 22:24:05	2024-04-04 22:24:05
25	100	pi_3P1yiVBjsMxFtgBe1dBIOqRq_secret_UCEM1njhJBoOyabTsXI4Lm32W	405702645	1	0	2024-04-04 22:25:08	2024-04-04 22:25:08
26	100	pi_3P1yidBjsMxFtgBe0qiOL484_secret_6bQcQT8u7HHp5jbwBa5wpjfmi	391608989	1	0	2024-04-04 22:25:15	2024-04-04 22:25:15
27	100	pi_3P1zVwBjsMxFtgBe1u5GDgeD_secret_gnnuteXBrBxN5APkA5JrNUc9B	747819563	1	0	2024-04-04 23:16:12	2024-04-04 23:16:12
28	100	pi_3P1zZ2BjsMxFtgBe0Um0QnH3_secret_W3e75F5UoOTpSTmnVYLHr5l91	597497312	1	0	2024-04-04 23:19:24	2024-04-04 23:19:24
29	100	pi_3P1zaaBjsMxFtgBe1PZJwuBt_secret_8YpzXXIfkPi4nfUnvnA4VBDI5	288047703	1	0	2024-04-04 23:21:00	2024-04-04 23:21:00
30	100	pi_3P20UMBjsMxFtgBe06BYjvnC_secret_ae2EcAdqiVKyjz9CCnj6FwzEZ	123435406	1	0	2024-04-05 00:18:38	2024-04-05 00:18:38
31	100	pi_3P37dCBjsMxFtgBe04R6ja6f_secret_vNR9O5a6WIxh17OFejgyuQ0vF	519698454	1	0	2024-04-08 02:08:22	2024-04-08 02:08:22
32	10	pi_3P39srBjsMxFtgBe0Bl2oMmx_secret_yNPuldjsZRDTO0xp67DyDtIwg	385849004	2	0	2024-04-08 04:32:42	2024-04-08 04:32:42
33	10	pi_3P3A3IBjsMxFtgBe0k1QlJ0B_secret_qURuzZqHK6nFHsr0WBZyHM0Eu	715987896	2	0	2024-04-08 04:43:28	2024-04-08 04:43:28
34	10	pi_3P3ABiBjsMxFtgBe0WLHPyZG_secret_JGX7uiI986eFGclwIlhcEfK9v	999733054	2	0	2024-04-08 04:52:10	2024-04-08 04:52:10
35	10	pi_3P3DIXBjsMxFtgBe0uJo7cJk_secret_7Iu83ClAQgxvADTm09SRCOtMT	672450193	2	0	2024-04-08 08:11:25	2024-04-08 08:11:25
36	10	pi_3P3FHNBjsMxFtgBe0vOZnquF_secret_LDKoSFs1IYWAcQA4saLbQNeBQ	687241673	2	0	2024-04-08 10:18:21	2024-04-08 10:18:21
37	100	pi_3P3FcTBjsMxFtgBe1ElgNop8_secret_1tvPoTzuGesoR2t14iniVgQ2b	812669623	1	0	2024-04-08 10:40:09	2024-04-08 10:40:09
38	100	pi_3P3FdDBjsMxFtgBe1EQXQbiX_secret_ACKeiSfJQXydixWjCWWLtQKuH	243900957	1	0	2024-04-08 10:40:55	2024-04-08 10:40:55
39	10	pi_3P3G5kBjsMxFtgBe1YcSZTnG_secret_llBvrW8h9qLX41FJLtNLdAZ0d	612016978	2	0	2024-04-08 11:10:24	2024-04-08 11:10:24
40	10	pi_3P3NpSBjsMxFtgBe0zXMygqC_secret_nE9ukC0Lpl9gUPvEl9hFvu2xr	974795918	2	0	2024-04-08 19:26:06	2024-04-08 19:26:06
41	10	pi_3P3XhgBjsMxFtgBe055IyXpz_secret_WZAM4tHndGbCJK8W6QhrYdsPB	558978804	2	0	2024-04-09 05:58:44	2024-04-09 05:58:44
42	10	pi_3P3dEJBjsMxFtgBe01MpM4Ls_secret_gNgVrAUBTGeP0zn8DDmREELLY	783032109	2	0	2024-04-09 11:52:47	2024-04-09 11:52:47
43	10	pi_3P3gLqBjsMxFtgBe11h3Ta53_secret_E3kZCVQPbvaYJagCMSfJovYGU	933907688	2	0	2024-04-09 15:12:47	2024-04-09 15:12:47
44	10	pi_3P3gMlBjsMxFtgBe1508Kd6W_secret_AawFwNHvSUhWwroE4Lmd3f9zw	381500442	2	0	2024-04-09 15:13:43	2024-04-09 15:13:43
45	100	pi_3P3n8nBjsMxFtgBe0sMlXykh_secret_8gMVelOVoWsplIzlPgUgqXbmX	612181139	1	0	2024-04-09 22:27:45	2024-04-09 22:27:45
46	100	pi_3P3nKYBjsMxFtgBe0ImCcMxi_secret_SN78PRAjQ7VYnUq3fLllZIu8H	835547734	1	0	2024-04-09 22:39:55	2024-04-09 22:39:55
47	100	pi_3P3nM1BjsMxFtgBe0mVzTm1L_secret_fW8IHh5iaeFIToLDCpjUjvYD4	406051388	1	24	2024-04-09 22:41:25	2024-04-09 22:41:25
48	100	pi_3P3nSdBjsMxFtgBe09rmdPOd_secret_nveMFHQOfbfdpwInDqwbXyX08	875795410	1	24	2024-04-09 22:48:15	2024-04-09 22:48:15
49	100	pi_3P3nakBjsMxFtgBe0ZLAggbn_secret_Q3bXMl3kbGAYKFMwvawNs34o8	809178839	1	24	2024-04-09 22:56:38	2024-04-09 22:56:38
50	100	pi_3P3nbLBjsMxFtgBe1y63gE17_secret_BD3va31dlMw3Nym9hhCsobN33	660727296	1	24	2024-04-09 22:57:15	2024-04-09 22:57:15
51	100	pi_3P3nc3BjsMxFtgBe0ZWT2GEb_secret_tjHhqVW9A2MYbM9tXjjYrrVEz	465732035	1	24	2024-04-09 22:57:59	2024-04-09 22:57:59
52	100	pi_3P3nfVBjsMxFtgBe0Gxb9jI2_secret_NstINhkkmN5k5f8f47RjkJ7Dz	822559079	1	24	2024-04-09 23:01:34	2024-04-09 23:01:34
53	10	pi_3P402lBjsMxFtgBe0H8Ily9T_secret_7lB2UGkYOuh8dqzdOL6Mpn6Yv	499800811	2	70	2024-04-10 12:14:23	2024-04-10 12:14:23
54	10	pi_3P4dBWBjsMxFtgBe0e3s4aAG_secret_um8EpQRBNDwrsgyLjwUChiDet	436881783	2	71	2024-04-12 06:02:02	2024-04-12 06:02:02
55	100	pi_3P5nP3BjsMxFtgBe1GLltfwe_secret_gzVtieihEE2o7amqJW8LwvnmU	565593024	1	73	2024-04-15 11:08:50	2024-04-15 11:08:50
56	100	pi_3P5y0iBjsMxFtgBe1gG946jp_secret_ELt9md28Br9uf3TDAJ6HMQ3TF	453844622	1	74	2024-04-15 22:28:24	2024-04-15 22:28:24
57	100	pi_3P5y0yBjsMxFtgBe0LKtmlkg_secret_0ATKaO7gWTMQwCupYJz8m05mx	844744382	1	74	2024-04-15 22:28:40	2024-04-15 22:28:40
58	100	pi_3P5y20BjsMxFtgBe1ueQzzC1_secret_UhNcu8L8RHBRFEwRijFBtm1Mb	438744954	1	74	2024-04-15 22:29:44	2024-04-15 22:29:44
59	100	pi_3P5zyLBjsMxFtgBe10vECplz_secret_Cohd9m0UJbR0lvaqUWEyd6EjT	391302861	1	75	2024-04-16 00:34:05	2024-04-16 00:34:05
60	100	pi_3P68hMBjsMxFtgBe027BAWPX_secret_HVVjauwYItvIpMMiU2X2g9g2p	950745528	1	76	2024-04-16 09:53:08	2024-04-16 09:53:08
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, created_at, updated_at) FROM stdin;
1	App\\Models\\User	4	Personal Access Token	12e185ba5f61d483d266143f00c8fc3d4ef664670abfd997c545ada538343f5d	["*"]	\N	2024-03-25 20:14:01	2024-03-25 20:14:01
2	App\\Models\\User	4	Personal Access Token	11d7885f38bcbd34ea31dfd67c50138e8a2aaed8e41daf555f1286903636149a	["*"]	\N	2024-03-25 20:14:01	2024-03-25 20:14:01
3	App\\Models\\User	5	Personal Access Token	fa3f2b19e8e0bd42093f9074931d8e244d8fefd84aa2cb1909492df2d9cf116e	["*"]	\N	2024-03-25 20:20:51	2024-03-25 20:20:51
4	App\\Models\\User	5	Personal Access Token	5d3b408d6e020f9f39169972fb4e677dd84036f29cd219ae2723feb509c647ca	["*"]	\N	2024-03-25 20:20:51	2024-03-25 20:20:51
5	App\\Models\\User	5	Personal Access Token	0e3021578a31554915b52b8c203eea7823a120da8744e344f7ed197faec13bc1	["*"]	\N	2024-03-25 21:47:55	2024-03-25 21:47:55
6	App\\Models\\User	6	Personal Access Token	c4fde1c373aed068ad8e134f483f7e09dd161e80efee1d1fd8bb60f87656cdf3	["*"]	\N	2024-03-26 07:47:45	2024-03-26 07:47:45
7	App\\Models\\User	6	Personal Access Token	47b25a1ad61451f22ac4bffc91bfd05be0d19d4594448822fda0367c3d5134b4	["*"]	\N	2024-03-26 07:47:46	2024-03-26 07:47:46
8	App\\Models\\User	4	Personal Access Token	0165180994ec4ff279aafa04f623ffd292116289467fd28cbeaed0a0b60e27b0	["*"]	\N	2024-03-26 17:08:42	2024-03-26 17:08:42
9	App\\Models\\User	4	Personal Access Token	0e095905bf27d2866ff62edfef6c5492b91cd18b419888d774d880c4b66830a2	["*"]	\N	2024-03-26 17:15:59	2024-03-26 17:15:59
10	App\\Models\\User	7	Personal Access Token	11d0a86a8b0681cc29cde80b29c1d52bbe85b5d23cd1e87c2ba65a5aa352f262	["*"]	\N	2024-03-27 15:05:26	2024-03-27 15:05:26
11	App\\Models\\User	7	Personal Access Token	9268bef737b00cd90bbbb31df2ab01364d3648d1596d7aefae354c0f6da06d0a	["*"]	\N	2024-03-27 15:05:27	2024-03-27 15:05:27
12	App\\Models\\User	7	Personal Access Token	2b88b50028c0b9f492b0f515ecc7ef9dca9099bbaeffa3af43e61ee1c72af988	["*"]	\N	2024-03-27 15:06:33	2024-03-27 15:06:33
13	App\\Models\\User	6	Personal Access Token	bf6ced188213ed0953e0c1727cc4c1ce9567ae1ca27481693627107bf443f418	["*"]	\N	2024-03-27 15:06:51	2024-03-27 15:06:51
14	App\\Models\\User	7	Personal Access Token	bc4cfa4c97a62961d45e6ed7999759a888f4113265c48be7c56e9f7e78a54c35	["*"]	\N	2024-03-27 15:07:40	2024-03-27 15:07:40
15	App\\Models\\User	8	Personal Access Token	910037acf84dde7a8f13dbb5ccb0e0cea8baa6924ef6f2ef3d46c7e02052c318	["*"]	\N	2024-03-27 15:09:47	2024-03-27 15:09:47
16	App\\Models\\User	8	Personal Access Token	4d5f0fe310ba26f9d9b94fab8f4bb370c9e0ed55ee1fdd7ca77ff3b3173f9801	["*"]	\N	2024-03-27 15:09:47	2024-03-27 15:09:47
17	App\\Models\\User	8	Personal Access Token	19e6e8cbdc0a3d6e974efeb39fb26967e6640a34cb5960f944a4fee953d5e676	["*"]	\N	2024-03-27 15:09:58	2024-03-27 15:09:58
18	App\\Models\\User	7	Personal Access Token	cd6513d48796c1170a31e20ef0cd0fcc7adf9ed6e01e16f7ae4291fc24f0f310	["*"]	\N	2024-03-27 15:11:24	2024-03-27 15:11:24
19	App\\Models\\User	6	Personal Access Token	a880b075240a521298313a8939117334834c6b656f2bb4abb4a07e343f0924a7	["*"]	\N	2024-03-27 15:55:21	2024-03-27 15:55:21
20	App\\Models\\User	9	Personal Access Token	c685b923bad912128a396191865bc039bd548fa977003e64968c400e9f973168	["*"]	\N	2024-03-27 17:47:03	2024-03-27 17:47:03
21	App\\Models\\User	9	Personal Access Token	21be9305d092089806235eb020c3d6396b0a40321095c175ad70c0231ded3e52	["*"]	\N	2024-03-27 17:47:04	2024-03-27 17:47:04
22	App\\Models\\User	5	Personal Access Token	0ebb0f93fcae838e22f9a3e22817f142f07664ce7781e725564da96fa8eb2573	["*"]	\N	2024-03-27 18:37:54	2024-03-27 18:37:54
23	App\\Models\\User	5	Personal Access Token	75893d4af98f3bd6da724cf95e0f00bb8096072188d3d15fb79537e633da3dca	["*"]	\N	2024-03-27 18:38:47	2024-03-27 18:38:47
24	App\\Models\\User	6	Personal Access Token	47f0dae521c027c92ab4cecea609e334168a67e3b230584cff13ca893c0f0ced	["*"]	\N	2024-03-28 05:57:57	2024-03-28 05:57:57
25	App\\Models\\User	7	Personal Access Token	c3ddcce8d1e07e3266c0d9779e95c5b3ed4edeb17bb8fd78ea2108032c9d6eb7	["*"]	\N	2024-03-28 06:11:18	2024-03-28 06:11:18
26	App\\Models\\User	7	Personal Access Token	01223f08fe0b4a2574e3c9c13a8a5e3979d91bb490a175286bdd42e793fc357c	["*"]	\N	2024-03-28 06:17:34	2024-03-28 06:17:34
27	App\\Models\\User	10	Personal Access Token	2341139e7aaf224a1ce029dee57c96709b0c667a38d8e99014f610c68df95684	["*"]	\N	2024-03-28 06:25:44	2024-03-28 06:25:44
28	App\\Models\\User	10	Personal Access Token	3fcecfdbeaed28ec02355045e9384d664c34945b9249b0a87229a82c0c54c2df	["*"]	\N	2024-03-28 06:25:44	2024-03-28 06:25:44
29	App\\Models\\User	6	Personal Access Token	927e9a5cd1946c5730750a4827c14b1315643672997ab5ce2fed5c3d127f7a05	["*"]	\N	2024-03-28 06:39:26	2024-03-28 06:39:26
30	App\\Models\\User	11	Personal Access Token	b316e02612f8b8229b67e30e0e6b8689faea8e1054ef278e562ac3560f763a8f	["*"]	\N	2024-03-28 06:44:29	2024-03-28 06:44:29
31	App\\Models\\User	11	Personal Access Token	f569e4cb2c186195c3a3bfb61888f656ebc46a8126bacd40711334e235b2117e	["*"]	\N	2024-03-28 06:44:30	2024-03-28 06:44:30
32	App\\Models\\User	6	Personal Access Token	505713d475e467aec376a9513f4fe5c5c045defe02bf5dc12a5e57d7feb26bbf	["*"]	\N	2024-03-28 07:14:33	2024-03-28 07:14:33
33	App\\Models\\User	7	Personal Access Token	bb51f55af387755a675a90ad2e77b808083e8e8a22c74061829f3bd19692c7ee	["*"]	\N	2024-03-28 07:22:35	2024-03-28 07:22:35
34	App\\Models\\User	7	Personal Access Token	daabf9e82e948512ac2fa9bf7786ce1899e054bb1c58203de338e95dc7b5fc9e	["*"]	\N	2024-03-28 08:05:45	2024-03-28 08:05:45
35	App\\Models\\User	10	Personal Access Token	e18bbc2a5dba47837e2aa15aa7a7b50b9e5ba03da92b405291025cecba21746d	["*"]	\N	2024-03-28 08:34:08	2024-03-28 08:34:08
36	App\\Models\\User	8	Personal Access Token	c7ab452ec63bb00baa34ca18dde794ff394978cbc34df0740cc9f14daaba1917	["*"]	\N	2024-03-28 08:45:40	2024-03-28 08:45:40
37	App\\Models\\User	4	Personal Access Token	666d65143927ce2b5bcfb1d15b90808335742f734de2d65c5d2b721b9ed3092e	["*"]	\N	2024-03-28 14:43:04	2024-03-28 14:43:04
38	App\\Models\\User	6	Personal Access Token	b69013adf96840cd5607d0cf7fcd73b508d0d5c75f38e8c1263cf2a9b100a107	["*"]	\N	2024-03-28 14:49:19	2024-03-28 14:49:19
39	App\\Models\\User	7	Personal Access Token	fb843ff86486a2424444ff96ccc248d83e37fd46a6951fe4e5331bb5ed7a4584	["*"]	\N	2024-03-28 14:49:34	2024-03-28 14:49:34
40	App\\Models\\User	10	Personal Access Token	c3eb414d0e678c09a64ef24acf3576bde7634bb8a0a3f599a405118838dc66a4	["*"]	\N	2024-03-28 15:17:40	2024-03-28 15:17:40
41	App\\Models\\User	10	Personal Access Token	648486c8b195ac7e914c80e15722ffec9481b9aef68bac1f84e2e44c72bc6185	["*"]	\N	2024-03-28 15:21:55	2024-03-28 15:21:55
42	App\\Models\\User	10	Personal Access Token	beeb0696e2b4dab39994eb407b6d00b8729ed49c301371bf603c9b3f9995463a	["*"]	\N	2024-03-28 15:45:09	2024-03-28 15:45:09
43	App\\Models\\User	10	Personal Access Token	0e4f90f7ba7ab5f7ea1772941badaa3f9717f2e0e882c4da4cf040ea2f49c599	["*"]	\N	2024-03-28 15:47:24	2024-03-28 15:47:24
44	App\\Models\\User	10	Personal Access Token	286b70833028a02661f73e956da2a3629080757933741f78a12333208ba09f68	["*"]	\N	2024-03-28 16:00:56	2024-03-28 16:00:56
45	App\\Models\\User	10	Personal Access Token	a3e2495c8302503f7742a7ea52ccf04f4289040dce3ed83cdf9c4510eb8948f1	["*"]	\N	2024-03-28 16:02:29	2024-03-28 16:02:29
46	App\\Models\\User	10	Personal Access Token	d908af6667f453b45c64af57fbb507ae235bad3983bff1b4e48f4cdf3afda26c	["*"]	\N	2024-03-28 17:08:30	2024-03-28 17:08:30
47	App\\Models\\User	10	Personal Access Token	993f62014a7cc2b90999f474882377b26cc6cb00114af51d3e9182eb0620ed01	["*"]	\N	2024-03-28 17:10:43	2024-03-28 17:10:43
48	App\\Models\\User	10	Personal Access Token	72935f7890209bf500e3f2be97378a1efbf4ac097f4eb14250a8b45f5173aee3	["*"]	\N	2024-03-28 17:15:34	2024-03-28 17:15:34
49	App\\Models\\User	10	Personal Access Token	25f7b79538b5f697f7f71b854363c9ea6ad7b4777e23bc5576a638c6d5287c98	["*"]	\N	2024-03-28 17:19:15	2024-03-28 17:19:15
50	App\\Models\\User	10	Personal Access Token	1a0e8e8854f1e03c0b5cbea695b88fe1d3827434a9245ab9a7d21c46281ecab6	["*"]	\N	2024-03-28 17:21:34	2024-03-28 17:21:34
51	App\\Models\\User	10	Personal Access Token	7e61e2d3449e63d0340319c5c0a201e28a8a9c19291d3d2c92d98e8c3980b086	["*"]	\N	2024-03-28 17:26:47	2024-03-28 17:26:47
52	App\\Models\\User	10	Personal Access Token	f870722e0961cb88e25554c6d2f78d84c2e0565d2376923b90af53deed76f586	["*"]	\N	2024-03-28 17:27:56	2024-03-28 17:27:56
53	App\\Models\\User	10	Personal Access Token	a25075a5b8fbeda3c1631c76f4b66551cc17c0a2f26bd8d7819209cdc7393a32	["*"]	\N	2024-03-28 17:29:07	2024-03-28 17:29:07
54	App\\Models\\User	10	Personal Access Token	a7dd58fcd57a2591237b18d61d5726c4509f154e3213c766c60db79b6e289155	["*"]	\N	2024-03-28 17:30:41	2024-03-28 17:30:41
55	App\\Models\\User	10	Personal Access Token	2fc24eaa66d4febbef7242e76216e07a0df9b7a16f628d4cabc6b8821928a0d8	["*"]	\N	2024-03-28 17:31:34	2024-03-28 17:31:34
56	App\\Models\\User	10	Personal Access Token	305c0c3f8ecf26cf400c3ea02fe92b3a56218504483bde1b9fb6d77dcd2fbdf6	["*"]	\N	2024-03-28 17:31:41	2024-03-28 17:31:41
57	App\\Models\\User	10	Personal Access Token	83ddc15ea0745d07fe3ee526fe34a8263dd927770c4c8f3279f19d6f6e8cc017	["*"]	\N	2024-03-28 17:38:51	2024-03-28 17:38:51
58	App\\Models\\User	10	Personal Access Token	bc26544ca444e371a99b84a13eee57d3e79d5f262b25dbbc25d45a3a1407d7da	["*"]	\N	2024-03-28 17:39:25	2024-03-28 17:39:25
59	App\\Models\\User	10	Personal Access Token	0bba2bfc17693e986000b6ae6c93b20cab63564b322b7986b1953fef26b1f137	["*"]	\N	2024-03-28 17:39:50	2024-03-28 17:39:50
60	App\\Models\\User	10	Personal Access Token	c37b8cb0e4ecf0fbc462e59ee7c99881c5542f9f0f05a5f9448bd69b3d290507	["*"]	\N	2024-03-28 17:42:14	2024-03-28 17:42:14
61	App\\Models\\User	12	Personal Access Token	80917d2c10c30aa35d68454ff996aa54c68e559ea8bcb429288bbe2e4ceb4378	["*"]	\N	2024-03-29 07:08:14	2024-03-29 07:08:14
62	App\\Models\\User	12	Personal Access Token	cd7ae0c05fefb97139d601d53d08a8f6ea13134ddc3f64bef6c7342b406b0f83	["*"]	\N	2024-03-29 07:08:15	2024-03-29 07:08:15
63	App\\Models\\User	12	Personal Access Token	bd52e1a07267ba06c7d991df20d6a2a66788fce440fb2d0d68a6d291edb9cbf3	["*"]	\N	2024-03-29 07:10:50	2024-03-29 07:10:50
64	App\\Models\\User	10	Personal Access Token	79b59ecd6507f7579e3a5f5115ce53a3ac463debbdb11693cdf501b5c377d0ab	["*"]	\N	2024-03-29 07:46:12	2024-03-29 07:46:12
65	App\\Models\\User	10	Personal Access Token	52d9785d3bab6325bc77419005d775ec384c2b94be4ff77be35824da7a41cebe	["*"]	\N	2024-03-29 10:12:46	2024-03-29 10:12:46
66	App\\Models\\User	10	Personal Access Token	bcc4df17561fd238c0413c093f35bd535e467b5adbddeb3f7af338a4a05588e7	["*"]	\N	2024-03-30 09:25:17	2024-03-30 09:25:17
67	App\\Models\\User	10	Personal Access Token	6624538b49110c9a058fa1d0f9d09837de0f961a85f0229f59f27386985e0172	["*"]	\N	2024-03-30 09:28:32	2024-03-30 09:28:32
68	App\\Models\\User	10	Personal Access Token	0dbaa2b51bd43c43e858e40e3decc6614ad89b5684c756df0bb32280603951b8	["*"]	\N	2024-03-31 16:30:02	2024-03-31 16:30:02
69	App\\Models\\User	10	Personal Access Token	1d4348ce45283cfb9c90bcb3145b11aef38014c0e1fb121441602a8d0f2354e9	["*"]	\N	2024-03-31 16:30:14	2024-03-31 16:30:14
70	App\\Models\\User	13	Personal Access Token	098271bd20c078a0d729abb92a562af2895b4243085aa57878832be7cc22aa7e	["*"]	\N	2024-04-01 06:27:38	2024-04-01 06:27:38
71	App\\Models\\User	13	Personal Access Token	d2d4933e1e0bfd2cb25677404b9bdabdfef885d078dba65a4551e71619f42a12	["*"]	\N	2024-04-01 09:40:12	2024-04-01 09:40:12
72	App\\Models\\User	14	Personal Access Token	7e786f997e118696f22e93ec4164adc17b07e0bd78690a24fbec0f41bae19e83	["*"]	\N	2024-04-01 10:36:52	2024-04-01 10:36:52
73	App\\Models\\User	14	Personal Access Token	7bef0497aad1293dd13df24424b9d53079161f0877dfb57cb02200b8411c6af7	["*"]	\N	2024-04-01 10:36:52	2024-04-01 10:36:52
74	App\\Models\\User	10	Personal Access Token	34460f5925269acd08bcf20ae7b4e04216ac5e4ca9f76460a218b5ea2c405cf3	["*"]	\N	2024-04-01 10:57:37	2024-04-01 10:57:37
75	App\\Models\\User	14	Personal Access Token	93c0ec84d875572700b4c85f6dbf4ab09f09652f039f941f188da9de27d09b23	["*"]	\N	2024-04-02 04:17:44	2024-04-02 04:17:44
76	App\\Models\\User	15	Personal Access Token	ae32e2259d35a0e1faeafae94250de987bdaa67ec66dbbad4c13e4ee4f329c4a	["*"]	\N	2024-04-02 11:41:04	2024-04-02 11:41:04
77	App\\Models\\User	16	Personal Access Token	85356a323710b89d0f93521ddd3470e4338c481ba5890824179498724968c8db	["*"]	\N	2024-04-02 22:39:34	2024-04-02 22:39:34
78	App\\Models\\User	16	Personal Access Token	e4b8ecf31524552a324f8b75b2335acada4c5d207b2ee4c614db14d159a54203	["*"]	\N	2024-04-02 22:39:47	2024-04-02 22:39:47
79	App\\Models\\User	16	Personal Access Token	9be731a8d0792138758bffa5ea04f31a79025a90994a471b0fe8c31adfa991b7	["*"]	\N	2024-04-02 22:50:36	2024-04-02 22:50:36
80	App\\Models\\User	17	Personal Access Token	1c4101f14376be1a40c032f32d0f3f7d7ebd3f9cdd90508bbf9d70dbf526df45	["*"]	\N	2024-04-02 22:52:37	2024-04-02 22:52:37
81	App\\Models\\User	18	Personal Access Token	32ba55e37be5a1321b4a3c3b6b1d83b15f34ceb2df5f3efdfb60e70daafa1a8e	["*"]	\N	2024-04-02 22:53:00	2024-04-02 22:53:00
82	App\\Models\\User	19	Personal Access Token	20783f57b61866aa3080b06443f035f387a92d035eb49791ca2a4024e347366e	["*"]	\N	2024-04-02 22:53:28	2024-04-02 22:53:28
83	App\\Models\\User	20	Personal Access Token	8eb600994a00cdd225364736425856d209cec4c8a94e4e292646084ed0a30f82	["*"]	\N	2024-04-02 22:53:57	2024-04-02 22:53:57
84	App\\Models\\User	21	Personal Access Token	819d6f791b5e9b79ddf54f6b7a037f65c8c30c3f827272a2e57c25aa6d26aa7c	["*"]	\N	2024-04-02 22:58:34	2024-04-02 22:58:34
85	App\\Models\\User	16	Personal Access Token	287114c5235be7f60c21ebc63c5082a6cce6c6af1e7c2d22d85243cc118827de	["*"]	\N	2024-04-02 23:03:47	2024-04-02 23:03:47
86	App\\Models\\User	22	Personal Access Token	422c6e3a229073f3ab6a4fb0834bb9d3c3985d061b999ecb4c64420edab45cc3	["*"]	\N	2024-04-03 00:24:10	2024-04-03 00:24:10
87	App\\Models\\User	22	Personal Access Token	f6bafbc1eaab3d3bb2fdea9b677b1497fe08d99de3e02abd1d26d9150f43d303	["*"]	\N	2024-04-03 00:25:38	2024-04-03 00:25:38
88	App\\Models\\User	5	Personal Access Token	a720f5149a2661645882987bf6cd053749724499834d90199c9190b59cd5abe3	["*"]	\N	2024-04-03 07:16:24	2024-04-03 07:16:24
89	App\\Models\\User	5	Personal Access Token	2e7839ae11393a83f33c2d26f7dab57db84ebe3527f183179eb4883a67e05b2c	["*"]	\N	2024-04-03 09:59:47	2024-04-03 09:59:47
90	App\\Models\\User	23	Personal Access Token	537a0e981d090dde24a8517cfcf5623bf16f5f3c6b39f0410eb6370b779e65ba	["*"]	\N	2024-04-03 11:57:47	2024-04-03 11:57:47
91	App\\Models\\User	5	Personal Access Token	c2764ae5668e9af35691cb805c1c54451617c3b33cc6f6c5b10cf5888c43b7d4	["*"]	\N	2024-04-03 16:01:05	2024-04-03 16:01:05
92	App\\Models\\User	5	Personal Access Token	5498fc6b6fc1158ea1fc4ee54d5c174d7350ed1e8248f03b7c7da757cb2266f4	["*"]	\N	2024-04-03 16:03:31	2024-04-03 16:03:31
93	App\\Models\\User	10	Personal Access Token	48049053a41b806db37ec2840e0f6d5e9dc9b5955cc45c2658d7d99c76e04463	["*"]	\N	2024-04-03 16:03:46	2024-04-03 16:03:46
94	App\\Models\\User	10	Personal Access Token	47879ee92c367246ce2a760d482affc47a710e9ba2f4c0b5ff0d06c5b3116c13	["*"]	\N	2024-04-03 16:08:07	2024-04-03 16:08:07
95	App\\Models\\User	10	Personal Access Token	44e4bc67336dedb5cb100f3c45153ff5c05d54c6a3cf4748c731503236798b64	["*"]	\N	2024-04-03 16:19:09	2024-04-03 16:19:09
96	App\\Models\\User	10	Personal Access Token	059abc1d0e6ee20a392bf7062523027ade9ffcfef9aa7a81ddd7f49f6cafe146	["*"]	\N	2024-04-03 16:34:34	2024-04-03 16:34:34
97	App\\Models\\User	10	Personal Access Token	8c36a6223f8368cebf0b5cbc1d9a32009faa8df317cfc9dd1890e7e9cb9909ec	["*"]	\N	2024-04-03 16:35:06	2024-04-03 16:35:06
98	App\\Models\\User	24	Personal Access Token	83a3e847d0911c02fbe8d438f2b5acedd169b5a2ac8cf80026e4b712abb343ef	["*"]	\N	2024-04-03 16:43:41	2024-04-03 16:43:41
99	App\\Models\\User	24	Personal Access Token	4141b38bbf73750b116d1c532c66083c08a5ff2041da8d668c8cb5b580316729	["*"]	\N	2024-04-03 16:43:42	2024-04-03 16:43:42
100	App\\Models\\User	24	Personal Access Token	89a7230ed19319d7b9d943eeff0989536cb7f316161d74af3cdc97790db497d4	["*"]	\N	2024-04-03 16:44:41	2024-04-03 16:44:41
101	App\\Models\\User	25	Personal Access Token	fd49c1d546578ad8dd59916dfd06def378a21e1e87c5ba031d6e602c8c8d41fc	["*"]	\N	2024-04-03 16:45:18	2024-04-03 16:45:18
102	App\\Models\\User	26	Personal Access Token	fa8ee1bf559fa67d551532e30bb8118d0c779ba419bda1b47c4a58cbf637f1c8	["*"]	\N	2024-04-03 16:45:27	2024-04-03 16:45:27
103	App\\Models\\User	26	Personal Access Token	13588821f2e7b7ba58d25bb8d580b53a81e7abe1ca5011e9cb3df4a14466fa78	["*"]	\N	2024-04-03 16:46:16	2024-04-03 16:46:16
104	App\\Models\\User	27	Personal Access Token	4739c41dfe9c68b5c1fb800a69a2c73e29e3201e268234eb165d071402b760b2	["*"]	\N	2024-04-03 18:08:22	2024-04-03 18:08:22
105	App\\Models\\User	28	Personal Access Token	1cc95b5e40c9c486d930e12cf32f84edf2896220e5df7b3788ab0d150cf344fb	["*"]	\N	2024-04-03 19:02:22	2024-04-03 19:02:22
106	App\\Models\\User	28	Personal Access Token	c20359b229b9d5ac6ec23b1aea46b7d960b0b3d826ed77a66b43bf8fc4ded53b	["*"]	\N	2024-04-03 19:02:22	2024-04-03 19:02:22
107	App\\Models\\User	29	Personal Access Token	993a1d8982c41b7729a4c10035873c4df5e5d0968497180d38272abb8a6d3678	["*"]	\N	2024-04-03 20:40:53	2024-04-03 20:40:53
108	App\\Models\\User	29	Personal Access Token	59a89a9ed021ba41866a433ada7112bc48528be2727a327b7176d333ff89f5bc	["*"]	\N	2024-04-03 20:40:53	2024-04-03 20:40:53
109	App\\Models\\User	30	Personal Access Token	c729b96579ac934b6d3d63c7c91f5222b8a3cdd2c63a99dc97d8ae1cd5c2ac7a	["*"]	\N	2024-04-03 20:46:14	2024-04-03 20:46:14
110	App\\Models\\User	30	Personal Access Token	b6d7dcf582f6d184bde6b54b7444be5d43a1bc70c40eeeac61405319009ea3f7	["*"]	\N	2024-04-03 20:46:15	2024-04-03 20:46:15
111	App\\Models\\User	31	Personal Access Token	8899d06cf9c6bf3c7c2d762765d5320e353c2902cb3329f024f87927ef3c247a	["*"]	\N	2024-04-03 20:53:42	2024-04-03 20:53:42
112	App\\Models\\User	31	Personal Access Token	956e20eddeef5828a7efcaf8da5d3de5e0ab2f1259f9e443ad2db7a49b74edbe	["*"]	\N	2024-04-03 20:53:43	2024-04-03 20:53:43
113	App\\Models\\User	10	Personal Access Token	f152beead886fc63b2dac305b3ec312dd949780ebdcbdccab87a170731842ebd	["*"]	\N	2024-04-03 20:58:34	2024-04-03 20:58:34
114	App\\Models\\User	32	Personal Access Token	f1fa26cdbf9c3ba7e7674b2ecdf7449b1b3928d402d819cbd28d88a08f9d6e16	["*"]	\N	2024-04-03 21:00:24	2024-04-03 21:00:24
115	App\\Models\\User	33	Personal Access Token	bdd8af5bcb9e81166acff9f5923f905e8be493d7dc5831c6a88539db29624e84	["*"]	\N	2024-04-03 21:04:24	2024-04-03 21:04:24
116	App\\Models\\User	34	Personal Access Token	2754cd5a9eb7a8622586ad581285f21660822f88b2ace34bcccaf117fb670bc4	["*"]	\N	2024-04-03 21:04:31	2024-04-03 21:04:31
117	App\\Models\\User	35	Personal Access Token	f221e55b80775f8263f55c9b5c8c3e0e57b4737c13df7c07fc352f90bc62f472	["*"]	\N	2024-04-04 00:29:49	2024-04-04 00:29:49
118	App\\Models\\User	36	Personal Access Token	3cfcf0f690c839248d23790360048c6c7402293df7f55b43a42b0ff74a81946f	["*"]	\N	2024-04-04 08:11:38	2024-04-04 08:11:38
119	App\\Models\\User	37	Personal Access Token	2f2511342a828da6ca6b63cb0d69e9075234b5130cb5996906e188bbf523cd5d	["*"]	\N	2024-04-04 08:15:10	2024-04-04 08:15:10
120	App\\Models\\User	38	Personal Access Token	9bf36303fb0d6620d32d3d1aa701f2608aed22f1f488337aa02da2225e37b096	["*"]	\N	2024-04-04 09:14:41	2024-04-04 09:14:41
121	App\\Models\\User	39	Personal Access Token	6e3c768111b4b834feeec06285d30dc46dccbad418c9c26a9129e75434d6a280	["*"]	\N	2024-04-04 09:20:06	2024-04-04 09:20:06
122	App\\Models\\User	40	Personal Access Token	55960aa52be18b72a2365d69a41af3b8dc9d2dcf8ab3b75c472be7beaed91d6c	["*"]	\N	2024-04-04 09:23:49	2024-04-04 09:23:49
123	App\\Models\\User	41	Personal Access Token	4a2e706dd1c33b0042e54d965e1e2b9cc6040a2997dfcd4618a4ecff9aa6d783	["*"]	\N	2024-04-04 09:34:43	2024-04-04 09:34:43
124	App\\Models\\User	27	Personal Access Token	ba3758f0bcf8b0599a3defd95b37c79bdc00c4f3bee2ec95d70952c7228e76c6	["*"]	\N	2024-04-04 09:58:31	2024-04-04 09:58:31
125	App\\Models\\User	42	Personal Access Token	98241f2bb3a19433287f2b5a076ace75beebb18e8eb37a7423c38223dfeb902c	["*"]	\N	2024-04-04 10:09:38	2024-04-04 10:09:38
126	App\\Models\\User	43	Personal Access Token	a9d271e167d0a24a2c80bd5b0d5619f056dfdc0df0f8a7e03e40a76e75cba823	["*"]	\N	2024-04-04 10:12:22	2024-04-04 10:12:22
127	App\\Models\\User	44	Personal Access Token	6940aebc9024d6b409a79030cb5d299a654345ef52412c7fa86114ab06f9b9d8	["*"]	\N	2024-04-04 10:13:34	2024-04-04 10:13:34
128	App\\Models\\User	45	Personal Access Token	26e2fd63170b12be8eaa206d701b84c0a8c077f8d9b4ba876d1426b2290b309d	["*"]	\N	2024-04-04 10:15:10	2024-04-04 10:15:10
129	App\\Models\\User	45	Personal Access Token	787a0eae058abda1360393711f451d7c0bce26477b01c177540028326301513d	["*"]	\N	2024-04-04 10:16:13	2024-04-04 10:16:13
130	App\\Models\\User	46	Personal Access Token	624b384dee2c3da6b1565e02a24cb5cac33758fff2465bd48e46be2a713deefb	["*"]	\N	2024-04-04 10:17:37	2024-04-04 10:17:37
131	App\\Models\\User	47	Personal Access Token	77dd34fae8d25990195607089328699fbba18e3bbba9849aa9b7a5fa79a85d08	["*"]	\N	2024-04-04 10:20:01	2024-04-04 10:20:01
132	App\\Models\\User	48	Personal Access Token	e0f72cb96c5f4c4230fa6d117af451bac2bfaa2e86aabba758027f53f9c5d8bf	["*"]	\N	2024-04-04 10:20:27	2024-04-04 10:20:27
133	App\\Models\\User	48	Personal Access Token	6da88299eb079dc9a782bdcc1de186f0e0a04b06ed4a7f2d5f76659500063b7b	["*"]	\N	2024-04-04 10:21:13	2024-04-04 10:21:13
134	App\\Models\\User	49	Personal Access Token	3fc5b69c6a71d755a4abfda46622e3cdaac61d8ea89cd4c24468cebc8642ada5	["*"]	\N	2024-04-04 10:21:34	2024-04-04 10:21:34
135	App\\Models\\User	50	Personal Access Token	d8e9e75ff9301ec2751f0bb455cf5a7f02ad248cdc44b304a1a61454ea04ca8d	["*"]	\N	2024-04-04 10:24:36	2024-04-04 10:24:36
136	App\\Models\\User	51	Personal Access Token	2b6e381a4d88f44c1e905f42e7efe7889c678443da4e2258f7d720f5074cea30	["*"]	\N	2024-04-04 12:21:25	2024-04-04 12:21:25
137	App\\Models\\User	52	Personal Access Token	d6df6c7d1dddbb4d5d2fcaec81605d64c3a36795ac62c3a93c1c1d1c1c6a4973	["*"]	\N	2024-04-04 18:07:31	2024-04-04 18:07:31
138	App\\Models\\User	52	Personal Access Token	a6f697a063d3fc889c0590c06ee71050e3e4207da58a75ee9388afda0913c0b9	["*"]	\N	2024-04-04 18:07:31	2024-04-04 18:07:31
139	App\\Models\\User	53	Personal Access Token	972fc9e11006faa4be9c2da71a7814b0fd2fd384fd8c090fb59cd8292f953034	["*"]	\N	2024-04-04 18:09:48	2024-04-04 18:09:48
140	App\\Models\\User	53	Personal Access Token	d3bf142d5ac8cf10e64699c8e352561d770e0e3a1e41133a029e0c506bc090ad	["*"]	\N	2024-04-04 18:09:48	2024-04-04 18:09:48
141	App\\Models\\User	54	Personal Access Token	05545d13391b99277fb3d90ba6a19d719ab1892101bb772419f6dcb467824791	["*"]	\N	2024-04-04 20:25:44	2024-04-04 20:25:44
142	App\\Models\\User	53	Personal Access Token	4f2633c89269adac6e897da644f220c35153a6a4a65950747e641cceec7378a6	["*"]	\N	2024-04-04 20:32:52	2024-04-04 20:32:52
143	App\\Models\\User	5	Personal Access Token	e2e7f974b5c965abf89c6cd36bac8abcab5e5c3e117e2d75c9b48b8f7b8f8c4a	["*"]	\N	2024-04-04 21:51:01	2024-04-04 21:51:01
144	App\\Models\\User	24	Personal Access Token	fa15da13aef37755f307b92039fd454e7554b56b794a92df48a497f0c56b9a8e	["*"]	\N	2024-04-04 21:57:28	2024-04-04 21:57:28
145	App\\Models\\User	5	Personal Access Token	9035fe2f9fd41b9d5474e119e324ac1a6a39f3153ca10cb48560e691153096a0	["*"]	\N	2024-04-04 23:19:14	2024-04-04 23:19:14
146	App\\Models\\User	5	Personal Access Token	2f4b43e35b5bbe3b71b9dba982b8b1b2712e48f0d4d391bd35a3fe2d130e389b	["*"]	\N	2024-04-04 23:27:59	2024-04-04 23:27:59
147	App\\Models\\User	55	Personal Access Token	15966e0587e621101cb988f050d07abc1aa8fdf8724a145d1b09f51cfbaf1161	["*"]	\N	2024-04-04 23:38:34	2024-04-04 23:38:34
148	App\\Models\\User	56	Personal Access Token	8bf196bb753a0b9da08a5ceb04c2765dc667c6db84c163a3bdfb9b53827ee489	["*"]	\N	2024-04-04 23:53:21	2024-04-04 23:53:21
149	App\\Models\\User	26	Personal Access Token	360ea7b25e8a42f635f8b308a4c01692cbb4ebe4f99aec20bfe00036d912a386	["*"]	\N	2024-04-05 00:01:43	2024-04-05 00:01:43
150	App\\Models\\User	57	Personal Access Token	ac80b74806bac03bb27195c87a128fd93ac5d09dd886a29c06892ed5535abaf2	["*"]	\N	2024-04-05 00:01:59	2024-04-05 00:01:59
151	App\\Models\\User	57	Personal Access Token	c396166fc7c31ec787748690e10acdadc8a5257b8dd51645e378ed272273c7e6	["*"]	\N	2024-04-05 00:02:16	2024-04-05 00:02:16
152	App\\Models\\User	57	Personal Access Token	3b6030288e0ee0bd1ccf8d2ed73be2f64f19e35a5d591e25ac7a9b8f4d753e70	["*"]	\N	2024-04-05 00:02:27	2024-04-05 00:02:27
153	App\\Models\\User	35	Personal Access Token	f11ab9547074e9e8d23ebf751d9c19ce0270be79932522b626cfba9219b3af65	["*"]	\N	2024-04-05 00:17:56	2024-04-05 00:17:56
154	App\\Models\\User	35	Personal Access Token	d24d808cef77c20923040a02b9914622c5c978ac040672a753837824f25a9945	["*"]	\N	2024-04-05 00:18:30	2024-04-05 00:18:30
155	App\\Models\\User	36	Personal Access Token	f1ab8699601ca726fe3414e2a4d221407897314fc1ffde1c20d2765bb05f712f	["*"]	\N	2024-04-05 00:19:38	2024-04-05 00:19:38
156	App\\Models\\User	53	Personal Access Token	bcf8ef863ee2b917163e315ebbc8ca30411a60aa2e8809f8db7c11943a9f59d4	["*"]	\N	2024-04-05 00:33:01	2024-04-05 00:33:01
157	App\\Models\\User	53	Personal Access Token	ef89f3a4a96325bce0bb0e778b7191877e6b658d3c4d2fec4941127903762d95	["*"]	\N	2024-04-05 00:39:20	2024-04-05 00:39:20
158	App\\Models\\User	58	Personal Access Token	a0d3ea8ed20926b8c2d7ba3d75d574c682018900ef30d834b719ccdb6d6059ca	["*"]	\N	2024-04-05 01:37:03	2024-04-05 01:37:03
159	App\\Models\\User	59	Personal Access Token	79752a7857aa7737871efa1fff5e61a279157292c8587b91c64fe380d7f416ed	["*"]	\N	2024-04-05 14:36:57	2024-04-05 14:36:57
160	App\\Models\\User	59	Personal Access Token	d2c590f554778222b2060baf75829e732338a004344a55ae856e50c0a21f0baa	["*"]	\N	2024-04-05 14:47:30	2024-04-05 14:47:30
161	App\\Models\\User	59	Personal Access Token	a075ea61b84dcad6ba6f209e3c79a5cd992a5eaabeac3731ff1c66d353dbeed7	["*"]	\N	2024-04-05 14:54:30	2024-04-05 14:54:30
162	App\\Models\\User	59	Personal Access Token	69e0dca4690404d31cdd10070629ac50983fb0eed208a77f91867d922587b570	["*"]	\N	2024-04-05 14:58:44	2024-04-05 14:58:44
163	App\\Models\\User	59	Personal Access Token	261a6bf2c48229b5cffcfbf2355ce77487805abf8a522d8bcd04a56ffc061fd1	["*"]	\N	2024-04-05 15:05:54	2024-04-05 15:05:54
164	App\\Models\\User	59	Personal Access Token	0039a45f4bfe83fbf064fb769f1da23d6751e8530c764d91543cbe9aed57bd4c	["*"]	\N	2024-04-05 15:07:48	2024-04-05 15:07:48
165	App\\Models\\User	59	Personal Access Token	a5b8989ad4725a079ec2c74385820801eacb54703b35d243fe16640ecaaeda0f	["*"]	\N	2024-04-05 15:08:05	2024-04-05 15:08:05
166	App\\Models\\User	59	Personal Access Token	5f4c0647213ae8f91aa4614801bfe5b6e3b53a070176ae3567e17f297bcaa015	["*"]	\N	2024-04-05 15:08:33	2024-04-05 15:08:33
167	App\\Models\\User	59	Personal Access Token	b6ee9d87ba431e5d513c9c90f937ca338c7a6a1b1893aef76541fb189d39e287	["*"]	\N	2024-04-05 15:10:09	2024-04-05 15:10:09
168	App\\Models\\User	59	Personal Access Token	c00306601190e10e72e3be3c843d2ab9e4e0ea8bc8aaceed925541ccc25d4fdc	["*"]	\N	2024-04-05 15:12:28	2024-04-05 15:12:28
169	App\\Models\\User	59	Personal Access Token	959e88d72e2961f6c0afe4c4c8e862a339d7fc10bd56089be27d19ff5deb5101	["*"]	\N	2024-04-05 15:12:53	2024-04-05 15:12:53
170	App\\Models\\User	59	Personal Access Token	03b13479dcdb16d04d4e0c30868c035d6c21ede2338aaa88010ba3fc169cf282	["*"]	\N	2024-04-05 15:17:40	2024-04-05 15:17:40
171	App\\Models\\User	59	Personal Access Token	f096cccb2ee8defc9a53773f3ac0bf70d5f50f0b217c4ca9a8068d882b3e9faa	["*"]	\N	2024-04-05 15:17:57	2024-04-05 15:17:57
172	App\\Models\\User	5	Personal Access Token	571e2adec4191fe472e5399af3533e6de454c807ddd8a141d8fb122057a2c9cf	["*"]	\N	2024-04-06 11:56:10	2024-04-06 11:56:10
173	App\\Models\\User	60	Personal Access Token	4efb61fb4021b45ceecaa506f0e59b1239cfd706323dcdfa822e9610861f1328	["*"]	\N	2024-04-08 02:02:13	2024-04-08 02:02:13
174	App\\Models\\User	60	Personal Access Token	79d1d574ae629f80fe321533eb4c89419b79166a6d3fcd034ad2283846620c65	["*"]	\N	2024-04-08 02:03:15	2024-04-08 02:03:15
175	App\\Models\\User	61	Personal Access Token	b1cdf13a962bd78d41840d4b139e1f1733435845e51f8cdd7340938cd7608371	["*"]	\N	2024-04-08 02:08:03	2024-04-08 02:08:03
176	App\\Models\\User	61	Personal Access Token	626dab9cf90366275f68e6549667c82766a0bd71639efd8e48a7feaccedaf301	["*"]	\N	2024-04-08 02:08:03	2024-04-08 02:08:03
177	App\\Models\\User	62	Personal Access Token	0c7aa6442333d1044c7ec2866480df8c0fa2193bce7cd9f1154f603c691e6613	["*"]	\N	2024-04-08 04:11:33	2024-04-08 04:11:33
178	App\\Models\\User	62	Personal Access Token	411f7c8336e0a63f1c39864b1d4dbf46ad2ebfe8843d4218ec6e29f0ac8d3255	["*"]	\N	2024-04-08 04:11:33	2024-04-08 04:11:33
179	App\\Models\\User	63	Personal Access Token	eabcbe5fa0040379b1017ba793003d8c5e5eed330010d5306fcfcbdc2a1c28c4	["*"]	\N	2024-04-08 04:43:18	2024-04-08 04:43:18
180	App\\Models\\User	63	Personal Access Token	9e8a4d294060d441db7ee6352610b1b326646b60bac940d8bb5b4a08dde2e783	["*"]	\N	2024-04-08 04:43:18	2024-04-08 04:43:18
181	App\\Models\\User	64	Personal Access Token	1a5986e8737f286054afb0ead5be359fee97965a1674f37e613755bddf32aea9	["*"]	\N	2024-04-08 04:50:07	2024-04-08 04:50:07
182	App\\Models\\User	64	Personal Access Token	ebc549be3e219852c1b79e3773e5f98eda81ac3da5647e212fcb36c22399af96	["*"]	\N	2024-04-08 04:52:04	2024-04-08 04:52:04
183	App\\Models\\User	62	Personal Access Token	04d461ee5189bb0218d414f3ce19bf305171026689f99d8b6439307ddf7d7749	["*"]	\N	2024-04-08 05:22:30	2024-04-08 05:22:30
184	App\\Models\\User	62	Personal Access Token	804bf3a6bd910cb4d762d647014ccc991168d85515cfbdf1a444e078139da8e8	["*"]	\N	2024-04-08 05:30:31	2024-04-08 05:30:31
185	App\\Models\\User	5	Personal Access Token	033a55895cb46019ac5e835cea8e63df81120664885e75fc93f1c04a12b6cfdf	["*"]	\N	2024-04-08 08:05:34	2024-04-08 08:05:34
186	App\\Models\\User	65	Personal Access Token	bfa8571302cf1eeeebc357505a08879c77ab2701e6a8a77227c9a39fa6356f68	["*"]	\N	2024-04-08 08:50:51	2024-04-08 08:50:51
187	App\\Models\\User	5	Personal Access Token	cb854f1d340525a4ac6db7243dab1d92d2453b35a9dd5f5a92158343402a5055	["*"]	\N	2024-04-08 09:55:38	2024-04-08 09:55:38
188	App\\Models\\User	59	Personal Access Token	7798e4e8fe42e98178b8fb7e869cd64b2115f54407df132bac9aba0c25731619	["*"]	\N	2024-04-08 10:03:26	2024-04-08 10:03:26
189	App\\Models\\User	59	Personal Access Token	972b4e6fce972cccdd2b93b5f19f2495cfd56f20774f1b93c183b3584c2bffcf	["*"]	\N	2024-04-08 10:06:50	2024-04-08 10:06:50
190	App\\Models\\User	59	Personal Access Token	29794fc9f86c71414696392daaaca4ec5446419e33ba6751b817ec4e5449c261	["*"]	\N	2024-04-08 10:10:41	2024-04-08 10:10:41
191	App\\Models\\User	59	Personal Access Token	2023a280516113115bb01829192f795a77668a39921314dff5d6e415628e5716	["*"]	\N	2024-04-08 10:13:03	2024-04-08 10:13:03
192	App\\Models\\User	59	Personal Access Token	41fd59b7653e686c0e17702781b437fd23c8bcbd26ffe04869b1749d3b33107a	["*"]	\N	2024-04-08 10:15:48	2024-04-08 10:15:48
193	App\\Models\\User	59	Personal Access Token	0a55ba8aba5dd1e0089b25edc8a81016ebfeedf1c973070d6a518a81511ede54	["*"]	\N	2024-04-08 10:20:49	2024-04-08 10:20:49
194	App\\Models\\User	59	Personal Access Token	5148365d64fa5f7d8a8cce28f7150b53f526d6672019cf66a32dc92ab85919d8	["*"]	\N	2024-04-08 10:27:11	2024-04-08 10:27:11
195	App\\Models\\User	59	Personal Access Token	1dbaa01aa8fdc71e93e763163e47b6dcdea3b343f2368354c1cccf9b48c02845	["*"]	\N	2024-04-08 10:28:59	2024-04-08 10:28:59
196	App\\Models\\User	66	Personal Access Token	661ce4f7bfae8e4624ff347f96556b45c7c94120c5b8e64264c9e8aa9889ba0a	["*"]	\N	2024-04-08 10:32:56	2024-04-08 10:32:56
197	App\\Models\\User	66	Personal Access Token	0b48d8d6096d0e20c2e5ef56cfb4e2ac1e288b2cf8c9ffcea8430b54b5889896	["*"]	\N	2024-04-08 10:35:16	2024-04-08 10:35:16
198	App\\Models\\User	59	Personal Access Token	da81bac1d36e276f0c1d29470920537c1415e8fb2020fd3e3f9032e43723f26b	["*"]	\N	2024-04-08 10:37:36	2024-04-08 10:37:36
199	App\\Models\\User	59	Personal Access Token	3bfa2b8e6b19316587d4c12bdcd78dcfa1cea34dd246246e2f1251e4f77bafee	["*"]	\N	2024-04-08 10:39:29	2024-04-08 10:39:29
200	App\\Models\\User	59	Personal Access Token	5f987557eabfc2da639e11f347935a6b6f29bba1163f3d4dce7d1d008ba30931	["*"]	\N	2024-04-08 10:39:54	2024-04-08 10:39:54
201	App\\Models\\User	59	Personal Access Token	1f1cfba2ad0dcf2cf33ee0c8e8847f411be21f976c8357b4d6e01581828c37f2	["*"]	\N	2024-04-08 10:43:59	2024-04-08 10:43:59
202	App\\Models\\User	59	Personal Access Token	31ddbce7d939a2a007c923fd6116e6047275f4e28b995859c723360c2835b7d7	["*"]	\N	2024-04-08 10:44:24	2024-04-08 10:44:24
203	App\\Models\\User	59	Personal Access Token	103fbb11922594be71731146a946ca1364e020c373585e0cae686f000ec23ab3	["*"]	\N	2024-04-08 10:45:44	2024-04-08 10:45:44
204	App\\Models\\User	59	Personal Access Token	225a30abfa7b41ecb5f20e5442a51c7c683e7fad69e9d0aeac2d41c8031d52be	["*"]	\N	2024-04-08 10:50:17	2024-04-08 10:50:17
205	App\\Models\\User	59	Personal Access Token	b637ca4ea063a80103809e26640d0ca924371378370648bf522778a94874f723	["*"]	\N	2024-04-08 10:50:50	2024-04-08 10:50:50
206	App\\Models\\User	66	Personal Access Token	374d8d8576775afe1f0b063c5d958c92a91172027763e507cb30fb832554f246	["*"]	\N	2024-04-08 10:51:12	2024-04-08 10:51:12
207	App\\Models\\User	59	Personal Access Token	3e76ee75624f92b1a93646e2f9403f21243a03583ba7cdd2b95114ff1c7e216e	["*"]	\N	2024-04-08 10:56:50	2024-04-08 10:56:50
208	App\\Models\\User	59	Personal Access Token	25158e443ae0c5b25bb692f8ba3363314459169c41f8f1d28763e75840edbe4b	["*"]	\N	2024-04-08 11:09:20	2024-04-08 11:09:20
209	App\\Models\\User	66	Personal Access Token	32721f61bd8bb7c89ed62fb20d7aa6e2f6ade4f6ab57f3b24cbd3e4ea7a989e5	["*"]	\N	2024-04-08 11:09:49	2024-04-08 11:09:49
210	App\\Models\\User	66	Personal Access Token	25434786432b8764225bca3b85ffb90a9b09bb6b3fc5f33551970c7ff6544ce3	["*"]	\N	2024-04-08 11:10:21	2024-04-08 11:10:21
211	App\\Models\\User	53	Personal Access Token	53c446806bb40f18e749f6bff68f9d53b28c26640919b1f2f4eb9db942b350ab	["*"]	\N	2024-04-08 11:13:03	2024-04-08 11:13:03
212	App\\Models\\User	53	Personal Access Token	4f32c3b274d2af3cfd25d80f07c68ad0d8714b1d3cac00a6faae20b3432e1458	["*"]	\N	2024-04-08 11:25:01	2024-04-08 11:25:01
213	App\\Models\\User	67	Personal Access Token	8a67e03737f96601a7ab14b1ca15f184451ee89b87f54360e7d1feb66a7c1965	["*"]	\N	2024-04-08 13:12:18	2024-04-08 13:12:18
214	App\\Models\\User	53	Personal Access Token	33f0091134adc31c688d6299efd6f38c214dddb628c9a892f6b0b18cca5e6182	["*"]	\N	2024-04-08 19:15:55	2024-04-08 19:15:55
215	App\\Models\\User	7	Personal Access Token	185cdc1b896835b981e7e2d556140fc7d297df5dccf68b92b3a5ac82bb30d6e5	["*"]	\N	2024-04-08 19:26:02	2024-04-08 19:26:02
216	App\\Models\\User	7	Personal Access Token	9ea6bf23e2c8c009c0338472699a74ba4c53bcf54d8bedbc088ba72986bec25f	["*"]	\N	2024-04-08 19:27:50	2024-04-08 19:27:50
217	App\\Models\\User	7	Personal Access Token	004a0291ba6bce37fa98065f445a9be3e5c0a9676b6b242027da7fc0ce8f649b	["*"]	\N	2024-04-08 19:29:48	2024-04-08 19:29:48
218	App\\Models\\User	68	Personal Access Token	3a0b21ba75e719356d3be49bf3e893648d77c90c873f1f462260a3840c355e54	["*"]	\N	2024-04-09 05:57:42	2024-04-09 05:57:42
219	App\\Models\\User	68	Personal Access Token	832f2aa2387363abd2fce5b91ea2828a7f3c6f28e210590bd940e967253aae1b	["*"]	\N	2024-04-09 05:57:43	2024-04-09 05:57:43
220	App\\Models\\User	62	Personal Access Token	30e8ec7c1a363ff6635c327db3a0ce830b79605ef6f210edbd07a6faa2de169f	["*"]	\N	2024-04-09 07:04:04	2024-04-09 07:04:04
221	App\\Models\\User	12	Personal Access Token	0b55b04b44644c24c6383c2d61001a71ddabf211222237bb5baa290149d445f3	["*"]	\N	2024-04-09 07:46:19	2024-04-09 07:46:19
222	App\\Models\\User	68	Personal Access Token	a1420c22aed40a4eadd6b3f8996d87fa0a15c87efa43b3e386ef40a997c1d5a1	["*"]	\N	2024-04-09 10:01:59	2024-04-09 10:01:59
223	App\\Models\\User	69	Personal Access Token	0958e67bb4be04db3691fb933b439c8ffbc89d61644e5a5e11636aea438fd8bc	["*"]	\N	2024-04-09 11:51:30	2024-04-09 11:51:30
224	App\\Models\\User	69	Personal Access Token	26ceab11aa2f5ff50e104ed771b5d893b461b8a8755d2fdf49759860add124c3	["*"]	\N	2024-04-09 11:52:42	2024-04-09 11:52:42
225	App\\Models\\User	5	Personal Access Token	5a1385b90c9013e0ad9ef1a45a1cccd90cf24bae4962af25ffea6995a38c3ccf	["*"]	\N	2024-04-09 15:00:06	2024-04-09 15:00:06
226	App\\Models\\User	5	Personal Access Token	58431750077be0b4af12ec844ab0f1ae303b6a26b3e5b48288a20f2cadf1f6a0	["*"]	\N	2024-04-09 15:09:10	2024-04-09 15:09:10
227	App\\Models\\User	36	Personal Access Token	ab8dfcda3f26b1fba5154257cfa33561a4fbd02d4f85cdf150087365a19761ef	["*"]	\N	2024-04-09 15:11:24	2024-04-09 15:11:24
228	App\\Models\\User	36	Personal Access Token	afc64d91dd431ff0bcbc9fe6673a4f31dcee596d14ef64da6a716d95279049e3	["*"]	\N	2024-04-09 15:12:35	2024-04-09 15:12:35
229	App\\Models\\User	5	Personal Access Token	e35267e74331846cd3be0140f65c4a521c1c004281737c6d38bbbf63361c4751	["*"]	\N	2024-04-09 15:18:01	2024-04-09 15:18:01
230	App\\Models\\User	24	Personal Access Token	5af8791c936ee87cd0b3d483ceabc0fa65286bd3ce61453783086cd017e14c6a	["*"]	\N	2024-04-09 22:25:04	2024-04-09 22:25:04
231	App\\Models\\User	24	Personal Access Token	33157f2d46fa53d66ddbf45a9f5f046ca6367fb9b9c85b92f588f9c9f443cea3	["*"]	\N	2024-04-09 22:27:29	2024-04-09 22:27:29
232	App\\Models\\User	61	Personal Access Token	5f9e1282b06d831c0da39f8104c9bc600c1259d7cc078f270a9bcec8bc420232	["*"]	\N	2024-04-10 11:54:10	2024-04-10 11:54:10
233	App\\Models\\User	70	Personal Access Token	9470bc34053bf9827fca4bd54d310f60b14753862c40011c9df6004bc5e3690f	["*"]	\N	2024-04-10 12:13:36	2024-04-10 12:13:36
234	App\\Models\\User	70	Personal Access Token	0124d7b18850fbbf7f0a72355a3bc16aa9b8a8509f637ec5ba73dcafaa0a8b26	["*"]	\N	2024-04-10 12:13:37	2024-04-10 12:13:37
235	App\\Models\\User	71	Personal Access Token	f2068a2eb57e402e975b3542fe8597142a7ed0a9169c474216b75f1421a983f1	["*"]	\N	2024-04-12 06:01:32	2024-04-12 06:01:32
236	App\\Models\\User	71	Personal Access Token	4d48b29467d9551db10b26a6493bc6de9bdac4d1a721525a358d5e0c32d52536	["*"]	\N	2024-04-12 06:01:57	2024-04-12 06:01:57
237	App\\Models\\User	26	Personal Access Token	3ecd8026c66a8b08cad33280d76daab0c389cb11dc4c36e3a5304d15c76dc9df	["*"]	\N	2024-04-14 14:20:32	2024-04-14 14:20:32
238	App\\Models\\User	57	Personal Access Token	a79d9cac788f98158cec67f54c349fd7a7b6d0624d9231a568cac8b61362eb43	["*"]	\N	2024-04-14 14:23:30	2024-04-14 14:23:30
239	App\\Models\\User	26	Personal Access Token	adcbe90f271ed2353e30c9713ef6a138fc4589c43011f523fb0c17b83f528839	["*"]	\N	2024-04-14 14:25:19	2024-04-14 14:25:19
240	App\\Models\\User	57	Personal Access Token	25bb3a6fd8d5ff238d0e08d2841d958693fe53a092f0fa6fdf9bbcbac003b25c	["*"]	\N	2024-04-14 14:25:45	2024-04-14 14:25:45
241	App\\Models\\User	72	Personal Access Token	6f3eaa61103a5d5d188c2b865de4a0713680d177a9bf52a0afd4ecff4dac2312	["*"]	\N	2024-04-14 14:28:04	2024-04-14 14:28:04
242	App\\Models\\User	72	Personal Access Token	b5bbe68227626543db735db97b9c4043782fe6e905f0f43337a4bea8af98186e	["*"]	\N	2024-04-14 14:29:20	2024-04-14 14:29:20
243	App\\Models\\User	72	Personal Access Token	5efb7488b616cfa4311456f22c49a2f973e0832465b0ebb0bd23839364527204	["*"]	\N	2024-04-14 14:29:37	2024-04-14 14:29:37
244	App\\Models\\User	36	Personal Access Token	18ca91166d2aa441f83feab7f35c8e4659c34160c857a100e9cd558a22d9cc9a	["*"]	\N	2024-04-14 14:30:19	2024-04-14 14:30:19
245	App\\Models\\User	5	Personal Access Token	c73bfc3e29ff46b26fa3fd8e8efc0fff1163710fe96d96d8ce0be566164063cb	["*"]	\N	2024-04-14 19:49:35	2024-04-14 19:49:35
246	App\\Models\\User	10	Personal Access Token	b66f091fb98c931798b96a2e77e42a9eee3acf6e07f821b93ae12ded3be8afc6	["*"]	\N	2024-04-14 22:32:35	2024-04-14 22:32:35
247	App\\Models\\User	10	Personal Access Token	58c5e33e8b8eadc3e25e5d25485b3b6c596418cb8de79f392f648e8a9554e3b2	["*"]	\N	2024-04-14 22:33:28	2024-04-14 22:33:28
248	App\\Models\\User	10	Personal Access Token	4570c7a620a3ee553991c23f8b9f4961b38bdb125077078095c033a7a8b8f3a0	["*"]	\N	2024-04-14 22:33:38	2024-04-14 22:33:38
249	App\\Models\\User	73	Personal Access Token	16e55ed12885f00585a09203befd4837cad1d08a2f7a43ff629898830ebbdf11	["*"]	\N	2024-04-15 11:08:39	2024-04-15 11:08:39
250	App\\Models\\User	73	Personal Access Token	5414a4697e8aaf962ef994851b3860fc4151d809aad8df2ad6af5146736912e4	["*"]	\N	2024-04-15 11:08:40	2024-04-15 11:08:40
251	App\\Models\\User	62	Personal Access Token	7a5d2779a533b06f07980978718bdc4c8212520aa4fcb31b31ffd17e819d997f	["*"]	\N	2024-04-15 11:11:37	2024-04-15 11:11:37
252	App\\Models\\User	64	Personal Access Token	e7400c398ded66467c96827f8f944d1776118779eb97178d4a6152f4fec0211f	["*"]	\N	2024-04-15 11:44:38	2024-04-15 11:44:38
253	App\\Models\\User	53	Personal Access Token	b13e6f76b4098eae6ccdb58ade2e67b3e35207786f6c24563040b6708d8f3ce2	["*"]	\N	2024-04-15 16:24:43	2024-04-15 16:24:43
254	App\\Models\\User	10	Personal Access Token	7d549c134ef7cb4143e3ed27817bcfcb7484e89c348689574200d205fe17b8c5	["*"]	\N	2024-04-15 21:23:47	2024-04-15 21:23:47
255	App\\Models\\User	74	Personal Access Token	f30c32f5b0579363b1c744fc98ce65bba6c6f059a7ab34ae7a5d9c8322753b73	["*"]	\N	2024-04-15 22:28:18	2024-04-15 22:28:18
256	App\\Models\\User	74	Personal Access Token	fadb7a39a357f4e78d042658587ed5ea7cee75a08c18715ff059057d8a681a18	["*"]	\N	2024-04-15 22:28:19	2024-04-15 22:28:19
257	App\\Models\\User	10	Personal Access Token	62afebf63da99359f9dad0d4e42036f8abfef6bb495a31b20ae3eed7a22967b2	["*"]	\N	2024-04-15 23:54:59	2024-04-15 23:54:59
258	App\\Models\\User	10	Personal Access Token	79edeb010386ecc8b610e834108a717e73ee7b951241aaa71c76d629987f24d9	["*"]	\N	2024-04-16 00:03:10	2024-04-16 00:03:10
259	App\\Models\\User	10	Personal Access Token	c2db09b89c4b7e66ece78c85f78d43b743f402d3c67976646c81552df6e915d2	["*"]	\N	2024-04-16 00:03:29	2024-04-16 00:03:29
260	App\\Models\\User	10	Personal Access Token	e1cb93ad34b56308063b8799b52571c562425e8f2abfbd7b847b270406a02321	["*"]	\N	2024-04-16 00:25:21	2024-04-16 00:25:21
261	App\\Models\\User	10	Personal Access Token	1f986209d5f49562245b21d61da769c1683a294dc144c39fa76655da507fb36b	["*"]	\N	2024-04-16 00:27:35	2024-04-16 00:27:35
262	App\\Models\\User	10	Personal Access Token	d08e7927c08f3ebc893c0f4259512ac48124f4a4fa62f62c79b94dfff03ea297	["*"]	\N	2024-04-16 00:30:01	2024-04-16 00:30:01
263	App\\Models\\User	10	Personal Access Token	0ced231cd8d5f3f769d70d8dcf5b3e7719295933535c949dc17c973f7ddcc252	["*"]	\N	2024-04-16 00:30:48	2024-04-16 00:30:48
264	App\\Models\\User	75	Personal Access Token	3c2ea32609f1a40211c9226b1f0c791a07b83d47baf990b6fddadb27543652e3	["*"]	\N	2024-04-16 00:33:59	2024-04-16 00:33:59
265	App\\Models\\User	75	Personal Access Token	a381f611fc1cf0baac612ce23461bdede73867c3092f2f877806ad92a081ac08	["*"]	\N	2024-04-16 00:33:59	2024-04-16 00:33:59
266	App\\Models\\User	7	Personal Access Token	6f2b0144de807ee7fc93c85415fe3342be3f2a2f8f3b0d22ad2e12e37c42bc77	["*"]	\N	2024-04-16 00:55:42	2024-04-16 00:55:42
267	App\\Models\\User	76	Personal Access Token	58f744fdde07d36befce223e7637f2fc3cdc53d12c184bb4027b6525825d6bce	["*"]	\N	2024-04-16 09:52:32	2024-04-16 09:52:32
268	App\\Models\\User	76	Personal Access Token	083b1c08023fd7286df61b1989c77c39a49f6f0c37837aa24017b770654ed57f	["*"]	\N	2024-04-16 09:53:02	2024-04-16 09:53:02
269	App\\Models\\User	10	Personal Access Token	764c87ab8b347f0440de3d343ed670cb56bf27c60e1f8ac6592a358ba1646c09	["*"]	\N	2024-04-16 14:20:49	2024-04-16 14:20:49
270	App\\Models\\User	77	Personal Access Token	365280a24d01812bcc3a4ea8851377d56f73c27c8e76273cba52c19b3ef17198	["*"]	\N	2024-04-17 03:57:00	2024-04-17 03:57:00
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
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings (id, type, user_id, product_id, product_varient_id, service_id, vendor_id, rating, title, comment, order_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.review (id, user_id, rating, reviews, game_id, created_at, updated_at, event_id, booking_id, review_title) FROM stdin;
\.


--
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room (id, name, status, created_at, updated_at, event_id, facilitator_id, facilitators_count) FROM stdin;
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

COPY public.settings (id, admin_commission, shipping_charge, created_at, updated_at, tax_percentage, moda_commission) FROM stdin;
1	10	10	\N	\N	5	0
\.


--
-- Data for Name: shangai_bonus_points; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shangai_bonus_points (id, name, image, banner_image, active, deleted, created_at, updated_at, deleted_at) FROM stdin;
1	IV	\N	\N	t	f	2024-04-15 20:45:35	2024-04-15 20:45:35	\N
2	II	\N	\N	t	f	2024-04-15 20:45:46	2024-04-15 20:45:46	\N
\.


--
-- Data for Name: shangai_buys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shangai_buys (id, name, image, banner_image, active, deleted, created_at, updated_at, deleted_at) FROM stdin;
1	Buy 1	\N	\N	t	f	2024-04-15 20:46:00	2024-04-15 20:46:00	\N
2	Buy 2	\N	\N	t	f	2024-04-15 20:46:12	2024-04-15 20:46:12	\N
\.


--
-- Data for Name: shangai_hands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shangai_hands (id, name, image, banner_image, active, created_at, updated_at, deleted_at, deleted) FROM stdin;
2	Hand	\N	\N	t	2024-04-15 20:46:39	2024-04-15 20:46:48	\N	f
1	Hand 1	\N	\N	t	2024-04-15 20:46:26	2024-04-15 21:11:19	\N	f
\.


--
-- Data for Name: shangai_round; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shangai_round (id, user_id, game_id, booking_id, buy, round, hand, bonus_points, score, created_at, updated_at) FROM stdin;
1	10	1	1	Table 1	100	1	10	1	2024-04-15 21:32:11	2024-04-15 21:32:11
2	10	1	1	12	100	1	10	1	2024-04-15 21:32:22	2024-04-15 21:32:22
3	10	1	1	12	100	1	10	1	2024-04-15 21:43:30	2024-04-15 21:43:30
4	10	1	1	12	100	1	10	1	2024-04-15 21:43:44	2024-04-15 21:43:44
\.


--
-- Data for Name: skill_level; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skill_level (id, name, active, deleted, created_at, updated_at) FROM stdin;
1	Advanced	1	0	2024-03-25 20:01:00	2024-03-25 20:01:00
2	Expert	1	0	2024-03-25 20:01:08	2024-03-25 20:01:08
3	Intermediate	1	0	2024-03-25 20:01:15	2024-03-25 20:01:15
4	Beginner	1	0	2024-03-25 20:01:23	2024-03-25 20:01:23
\.


--
-- Data for Name: skin_colors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skin_colors (id, name, color, active, deleted, created_at, updated_at) FROM stdin;
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
1	Dubai	1	1	1	\N	0	2024-03-25 20:02:45	2024-03-25 20:02:45
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
-- Data for Name: table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."table" (id, name, active, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: temp_booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_booking (id, user_id, event_id, game_id, payment_ref, num_of_seats, payment_mode, item_amount, grand_total, booking_date, seat_position, timeslot_id, created_at, updated_at, payment_status, booking_type, slot_ids, table_no, names, player_no) FROM stdin;
1	4	0	1	pi_3Oyb3SBjsMxFtgBe1rMHEioO_secret_qUQYKCTCmnNw0mkUUKid98H1g	1	1	100	200	2024-02-29 00:00:00	W	128	2024-03-26 14:32:46	2024-03-26 14:32:46	0	1	128,129	\N	\N	\N
2	4	0	1	pi_3OybJZBjsMxFtgBe1aaBg2Sy_secret_DHlmxY1eca32QaYvdnkFKSPXR	1	1	100	200	2024-02-29 00:00:00	W	128	2024-03-26 14:49:25	2024-03-26 14:49:25	0	1	128,129	\N	\N	\N
3	4	0	1	pi_3Oyc8xBjsMxFtgBe0voiQEEY_secret_ZhMOzeyEo6ur1Xe8q4T0K89Xx	1	1	100	200	2024-02-29 00:00:00	W	128	2024-03-26 15:42:31	2024-03-26 15:42:32	0	1	128,129	Table 1	\N	\N
4	6	0	1	pi_3Oycm8BjsMxFtgBe1TSAKjSY_secret_Z0MqB1CJPnbf9RQn1CSj5SSI5	1	1	100	100	2024-03-26 00:00:00	\N	1	2024-03-26 16:23:00	2024-03-26 16:23:00	0	1	1	\N	\N	\N
5	4	0	1	pi_3OyrInBjsMxFtgBe1OJ8EpFK_secret_VC6Kk3vStRcYom8JmC8vSXBxg	1	1	100	200	2024-02-29 00:00:00	W	128	2024-03-27 07:53:41	2024-03-27 07:53:41	0	1	128,129	Table 1	\N	\N
6	4	0	1	pi_3OyrTyBjsMxFtgBe0yZESdPH_secret_EAiogWq4WTrznDP9KX5hWZsgb	1	1	100	200	2024-02-29 00:00:00	W	128	2024-03-27 08:05:14	2024-03-27 08:05:14	0	1	128,129	Table 1	\N	\N
7	4	0	2	pi_3OyrbWBjsMxFtgBe10X9mc8m_secret_Do7oiHDpBapEaHpGNqdsTsgpc	1	1	100	200	2024-02-29 00:00:00	W	5	2024-03-27 08:13:02	2024-03-27 08:13:02	0	1	5,6	Table 1	\N	\N
8	4	0	2	pi_3OyrcGBjsMxFtgBe0KGgFZ1I_secret_dOQjNHeheCzbvm8f1uVVI6e81	1	1	100	200	2024-02-29 00:00:00	W	5	2024-03-27 08:13:48	2024-03-27 08:13:48	0	1	5,6	Table1 2	\N	\N
9	5	0	1	pi_3Oz7hRBjsMxFtgBe1F2ZMBm1_secret_lDDiVufcBPvO9HHIEusrnSmmh	1	1	100	100	2024-03-29 00:00:00	S	2	2024-03-28 01:24:13	2024-03-28 01:24:13	0	1	2	Table 1	\N	\N
10	5	0	1	pi_3Oz7nHBjsMxFtgBe1AZ0vngo_secret_coXUinCL6pIDelV1eN2ZzEKPq	1	1	100	100	2024-03-29 00:00:00	E	3	2024-03-28 01:30:15	2024-03-28 01:30:15	0	1	3	Table 1	\N	\N
11	6	0	1	pi_3OzBfHBjsMxFtgBe054fbMdE_secret_qcE8yYmtvi08lwiRGPxH9QUjL	1	1	100	100	2024-03-28 00:00:00	N	4	2024-03-28 05:38:14	2024-03-28 05:38:15	0	1	4	Table 1	\N	\N
12	6	0	5	pi_3OzD80BjsMxFtgBe1hZ9Whev_secret_biL27AShqIMQZZ4cJ54TebI2j	1	1	100	100	2024-03-28 00:00:00	N	44	2024-03-28 07:12:00	2024-03-28 07:12:00	0	1	44	Table 1	\N	\N
13	6	0	6	pi_3OzDBABjsMxFtgBe00PBDAys_secret_quMAEeW92ZWXuwCznsQChrTtd	1	1	100	100	2024-03-28 00:00:00	\N	58	2024-03-28 07:15:16	2024-03-28 07:15:16	0	1	58	\N	\N	\N
14	7	0	6	pi_3OzDIUBjsMxFtgBe0WvilFJk_secret_3zIZs2CyxEE8NW1BifCBhb2yJ	1	1	100	100	2024-03-28 00:00:00	W	58	2024-03-28 07:22:50	2024-03-28 07:22:51	0	1	58	\N	\N	\N
15	7	0	5	pi_3OzDJWBjsMxFtgBe1Vd509w7_secret_SVLAtFdbaysHEtVr9qqmTJyUP	1	1	100	100	2024-03-28 00:00:00	W	45	2024-03-28 07:23:54	2024-03-28 07:23:54	0	1	45	Table 1	\N	\N
16	8	0	5	pi_3OzEbABjsMxFtgBe1YaUobfU_secret_x0EN3n7TtRwHfNrZvJpNT6qaD	1	1	100	100	2024-03-28 00:00:00	E	48	2024-03-28 08:46:12	2024-03-28 08:46:12	0	1	48	Table 2	\N	\N
17	8	0	5	pi_3OzEbbBjsMxFtgBe14BUW8Hw_secret_xrsuR5MVuKdlMBhs21FYwwaRw	1	1	100	100	2024-03-28 00:00:00	E	48	2024-03-28 08:46:39	2024-03-28 08:46:39	0	1	48	Table 2	\N	\N
18	8	0	5	pi_3OzEc6BjsMxFtgBe1mLzwNnx_secret_U1T1Dl77KwmPrA1JjO90ZWWOH	1	1	100	100	2024-03-28 00:00:00	E	48	2024-03-28 08:47:10	2024-03-28 08:47:10	0	1	48	Table 2	\N	\N
19	8	0	6	pi_3OzEraBjsMxFtgBe0fcfJggq_secret_vZnxDTvmfAqzwG9llS7FFpQje	1	1	100	100	2024-03-28 00:00:00	S	58	2024-03-28 09:03:10	2024-03-28 09:03:10	0	1	58	Table 2	\N	\N
20	10	0	6	pi_3OzGGdBjsMxFtgBe0R3jIxqX_secret_9YyyqQxWaH8IJY1ETOQB6RdpA	1	1	100	100	2024-03-28 00:00:00	E	57	2024-03-28 10:33:06	2024-03-28 10:33:07	0	1	57	\N	\N	\N
21	10	0	6	pi_3OzGnpBjsMxFtgBe0UKGUGyG_secret_xlqE64yjS6bS9tL3oDEaTRloP	1	1	100	100	2024-03-28 00:00:00	S	57	2024-03-28 11:07:25	2024-03-28 11:07:25	0	1	57	\N	\N	\N
22	10	0	2	pi_3OzcyABjsMxFtgBe0OUvRbFd_secret_kNvfIZLnvVWI5KSQz4XHPHX1t	1	1	100	100	2024-02-29 00:00:00	E,W	5	2024-03-29 10:47:34	2024-03-29 10:47:34	0	1	5	Table1 2	\N	\N
23	10	0	2	pi_3Ozd4fBjsMxFtgBe1KeOXAl7_secret_z4hOTr4p6QAlbrevmg46ilicj	1	1	100	100	2024-02-29 00:00:00	E,W	5	2024-03-29 10:54:16	2024-03-29 10:54:17	0	1	5	Table1 2	usma,asad	\N
24	10	0	2	pi_3Ozd7LBjsMxFtgBe0m0RKy16_secret_x6z6CXQKMgs9kOUjIP7ATJ3Ti	1	1	100	200	2024-02-29 00:00:00	E,W	5	2024-03-29 10:57:03	2024-03-29 10:57:04	0	1	5	Table1 2	usma,asad	\N
25	10	0	2	pi_3OzdYCBjsMxFtgBe1wnBjsz6_secret_zgUujhQUzAj1OnbUjvzz0WDqh	1	1	100	200	2024-02-29 00:00:00	E,W	5	2024-03-29 11:24:48	2024-03-29 11:24:48	0	1	5	Table1 2	usma,asad	\N
26	5	0	5	pi_3Ozi63BjsMxFtgBe1XVIMwDD_secret_cjvV2H5ONyL6cMHogn8raXjKk	1	1	100	100	2024-03-29 00:00:00	N	46	2024-03-29 16:16:03	2024-03-29 16:16:03	0	1	46	Table 1	asad	\N
27	5	0	5	pi_3Ozi8TBjsMxFtgBe0leq0S2d_secret_4MxkXCPWe6gR60NzAo1WJ4boI	1	1	100	200	2024-03-29 00:00:00	E,N	46	2024-03-29 16:18:33	2024-03-29 16:18:33	0	1	46	Table 1	asad,rana	\N
28	5	0	6	pi_3OzjPTBjsMxFtgBe0k3kUoKG_secret_JDxDPcFw986w6u4An65GhtVyj	1	1	100	200	2024-03-29 00:00:00	N,S	61	2024-03-29 17:40:10	2024-03-29 17:40:11	0	1	61	Table 1	asad,sss	\N
29	5	0	5	pi_3OzoyhBjsMxFtgBe0m1zIFYE_secret_WDn6uDGg4c4ZqcOqDoGsDek7M	1	1	100	100	2024-03-30 00:00:00	W	51	2024-03-29 23:36:55	2024-03-29 23:36:55	0	1	51	Table 1	asif	\N
30	5	0	6	pi_3Ozp0XBjsMxFtgBe1v6DCXRr_secret_dLjMOKpJ9qqu12w19VZtB26yz	1	1	100	100	2024-03-31 00:00:00	N	58	2024-03-29 23:38:49	2024-03-29 23:38:49	0	1	58	Table 1	abid	\N
31	5	0	6	pi_3P05DPBjsMxFtgBe1OEgUGta_secret_nhJXKuGVAWXJ526czCRBQFR9H	1	1	100	100	2024-03-31 00:00:00	E	59	2024-03-30 16:57:11	2024-03-30 16:57:11	0	1	59	Table 2	shakkor	\N
32	10	0	2	pi_3P0RH0BjsMxFtgBe1Qwq3Mj9_secret_ILM7HVAIIAte0Xppv6zuqmZit	1	1	100	200	2024-02-29 00:00:00	E,W	5	2024-03-31 16:30:22	2024-03-31 16:30:22	0	1	5	Table1 2	usma,asad	\N
33	10	0	2	pi_3P0RQUBjsMxFtgBe1zValTeR_secret_k1tADEF0FmazdoWlBcBfAHX5x	1	1	100	200	2024-02-29 00:00:00	E,W	5	2024-03-31 16:40:10	2024-03-31 16:40:11	0	1	5	Table1 2	usma,asad	Player 1, Player 2
34	10	0	2	pi_3P0RQaBjsMxFtgBe0l3qWqex_secret_yznmDGqLP47vwOIJGudXSdTEg	1	1	100	200	2024-02-29 00:00:00	E,W	5	2024-03-31 16:40:16	2024-03-31 16:40:16	0	1	5	Table1 2	usma,asad	\N
35	10	0	2	pi_3P0RQeBjsMxFtgBe0yjjwV9K_secret_sBm8Yx60lIpbaqpMAGaqtkMVQ	1	1	100	200	2024-02-29 00:00:00	E,W	5	2024-03-31 16:40:20	2024-03-31 16:40:21	0	1	5	Table1 2	usma,asad	Player 1, Player 2
36	10	0	2	pi_3P0RYFBjsMxFtgBe0Y3jSSxS_secret_K6HUrw7kbao5t3JrqNwRPymPF	1	1	100	200	2024-02-29 00:00:00	E,W	5	2024-03-31 16:48:11	2024-03-31 16:48:11	0	1	5	Table1 2	usma,asad	Player 1, Player 2
37	10	0	7	pi_3P0RxIBjsMxFtgBe0YVrqXCD_secret_fkuMK2QBn81X3Ns1HWoqRwcTy	1	1	4	8	2024-02-29 00:00:00	E,W	5	2024-03-31 17:14:03	2024-03-31 17:14:04	0	1	5	Table1 2	usma,asad	Player 1, Player 2
38	10	0	7	pi_3P0RzWBjsMxFtgBe1CbunRaM_secret_W6OocsX0Fe9dTHDYzLTLtAqQh	1	1	4	8	2024-02-29 00:00:00	\N	5	2024-03-31 17:16:22	2024-03-31 17:16:22	0	1	5	Table1	usma,asad	Player 1, Player 2
114	53	0	6	pi_3P6HHWBjsMxFtgBe0piWCCqG_secret_HFuZqzaocbENxdLUomyJq2s6h	1	1	100	100	2024-04-17 00:00:00	W	220	2024-04-16 19:03:02	2024-04-16 19:03:03	0	1	220	Table 1	Zain	\N
39	10	0	7	pi_3P0S3HBjsMxFtgBe1XtursqZ_secret_Khh4jxmANxperNGPx0LXw1KFy	1	1	4	8	2024-02-29 00:00:00	\N	5	2024-03-31 17:20:15	2024-03-31 17:20:15	0	1	5	Table1	usma,asad	Player 1, Player 2
40	10	0	7	pi_3P0S3MBjsMxFtgBe143xB47L_secret_gTChTmRRGq7yLxwCAiXDs3baX	1	1	4	8	2024-02-29 00:00:00	\N	5	2024-03-31 17:20:20	2024-03-31 17:20:20	0	1	5	Table1	usma,asad	Player 1, Player 2
41	10	0	7	pi_3P0S6uBjsMxFtgBe1p1Cz5ZY_secret_kjIFnLBsfAy4gTrxRIi5iglDK	1	1	4	8	2024-02-29 00:00:00	\N	5	2024-03-31 17:24:00	2024-03-31 17:24:01	0	1	5	Table1	usma,asad	Player 1, Player 2
42	10	0	7	pi_3P0SEvBjsMxFtgBe0fAwpiKe_secret_zPJxugRJ4ZYkwDUVUbBO455sl	1	1	4	8	2024-02-29 00:00:00	\N	5	2024-03-31 17:32:16	2024-03-31 17:32:17	0	1	5	Table1	usama, Asad	Player 1, Player 2
43	10	0	7	pi_3P0SGgBjsMxFtgBe0FMKkrGh_secret_awk17GSp8tY4zotKDgMDNfcEF	1	1	4	8	2024-02-29 00:00:00	\N	5	2024-03-31 17:34:06	2024-03-31 17:34:06	0	1	5	Table1	usama, Asad	Player 1, Player 2
44	10	0	7	pi_3P0SOjBjsMxFtgBe0sKJnJjg_secret_Y9U47jJVJ399uKNpFOjAesqxc	1	1	4	8	2024-02-29 00:00:00	\N	5	2024-03-31 17:42:24	2024-03-31 17:42:25	0	1	5	test1	usama, Asad	Player 1, Player 2
45	10	0	7	pi_3P0SPjBjsMxFtgBe0748dnkQ_secret_sa7BWj67q5erTSlQRqJAJ1BEG	1	1	4	8	2024-02-29 00:00:00	\N	5	2024-03-31 17:43:27	2024-03-31 17:43:27	0	1	5	test1	usama, Asad	Player 1, Player 2
46	10	0	7	pi_3P0SSTBjsMxFtgBe0bx1LEpa_secret_D42jfsfNurJlGjKtBgOSdBFri	1	1	4	8	2024-02-29 00:00:00	\N	5	2024-03-31 17:46:17	2024-03-31 17:46:17	0	1	5	test1	usama, Asad	Player 1, Player 2
47	5	0	7	pi_3P0VUwBjsMxFtgBe0p7szvt6_secret_BDuRBucGasfQqeVOPdelIaajO	1	1	4	8	2024-04-02 00:00:00	\N	63	2024-03-31 21:01:02	2024-03-31 21:01:02	0	1	63	Table 1	asad,waleed	Player 2,Player 3
48	5	0	7	pi_3P0XEMBjsMxFtgBe0YjyqwEP_secret_DX9i2cmRWLmAyL63bM3Z2wxRa	1	1	4	4	2024-04-10 00:00:00	\N	64	2024-03-31 22:52:01	2024-03-31 22:52:02	0	1	64	Table 1	asad	Player 4
49	5	0	7	pi_3P0XFkBjsMxFtgBe1EzRjNnx_secret_0N9pJDqErbFCodVBg7inzrfff	1	1	4	8	2024-04-04 00:00:00	\N	62	2024-03-31 22:53:27	2024-03-31 22:53:28	0	1	62	Table 1	majid,nafees	Player 1,Player 5
50	5	0	5	pi_3P0XHvBjsMxFtgBe1ARdZBVS_secret_SbRbL6ZZmW3jR38vfy8p9qLxf	1	1	100	100	2024-04-03 00:00:00	S	48	2024-03-31 22:55:43	2024-03-31 22:55:43	0	1	48	Table 1	asss	\N
51	5	0	6	pi_3P0fF5BjsMxFtgBe0jca26nV_secret_Mmh9389Dt0B2y3JBkKJgRR1n4	1	1	100	100	2024-04-03 00:00:00	W	57	2024-04-01 07:25:19	2024-04-01 07:25:19	0	1	57	Table 1	rana	\N
52	5	0	7	pi_3P0fGjBjsMxFtgBe0yt54MFN_secret_Ry36fjxcWpmFlVJ7x515r1kuA	1	1	4	4	2024-04-02 00:00:00	\N	65	2024-04-01 07:27:01	2024-04-01 07:27:01	0	1	65	Table 3	asad	Player 1
53	5	0	5	pi_3P0fICBjsMxFtgBe1YesobGw_secret_F9gWBUtRNqukvfmHzvwx2Vac6	1	1	100	100	2024-04-03 00:00:00	E	47	2024-04-01 07:28:32	2024-04-01 07:28:32	0	1	47	Table 3	asad	\N
54	12	0	6	pi_3P0hnFBjsMxFtgBe1y4vRukd_secret_YmvIZlbGpRZ3HuTEXCRuZ73TC	1	1	100	100	2024-04-01 00:00:00	E	59	2024-04-01 10:08:44	2024-04-01 10:08:45	0	1	59	Table 1	Usama	\N
55	14	1	0	payment_ref	1	1	100	100	\N	\N	0	2024-04-01 10:42:24	2024-04-01 10:42:24	0	1	\N	\N	\N	\N
56	12	0	5	pi_3P0lnDBjsMxFtgBe02dbUYhl_secret_JT2PuLmo71VeVe876IWZHLqZ6	1	1	100	100	2024-04-02 00:00:00	E	84	2024-04-01 14:24:59	2024-04-01 14:25:00	0	1	84	Table 2	usama	\N
57	12	0	6	pi_3P0loWBjsMxFtgBe1KIini85_secret_SyR7HIQ1vGwBIum0B6qm2sSwc	1	1	100	100	2024-04-01 00:00:00	N	61	2024-04-01 14:26:20	2024-04-01 14:26:20	0	1	61	Table 2	usama	\N
58	12	0	7	pi_3P0lplBjsMxFtgBe1FzhFa0m_secret_XJTLTIeZ8DpfLCDfdpF6H0y9U	1	1	4	4	2024-04-06 00:00:00	\N	66	2024-04-01 14:27:37	2024-04-01 14:27:37	0	1	66	Table 1	Usama	Player 6
59	12	0	5	pi_3P0lqXBjsMxFtgBe0c1rb3zW_secret_m1filp6elwJjApjzBGJLsF8zr	1	1	100	100	2024-04-01 00:00:00	N	87	2024-04-01 14:28:25	2024-04-01 14:28:25	0	1	87	Table 3	usamaa	\N
60	5	2	0	payment_ref	2	1	100	200	\N	\N	0	2024-04-02 17:00:42	2024-04-02 17:00:42	0	1	\N	\N	\N	\N
61	5	0	5	pi_3P1CKVBjsMxFtgBe0mPRQcyO_secret_ANQZkLDmOQLUsJrdWz9VK2CDK	1	1	100	100	2024-04-02 00:00:00	W	84	2024-04-02 18:45:07	2024-04-02 18:45:07	0	1	84	Table 3	dxb	\N
62	5	0	5	pi_3P1CKeBjsMxFtgBe0027zg3w_secret_WN6zSrvurphzXEoowrFDKljyi	1	1	100	100	2024-04-02 00:00:00	W	84	2024-04-02 18:45:16	2024-04-02 18:45:17	0	1	84	Table 3	dxb	\N
63	5	0	11	pi_3P1H4uBjsMxFtgBe1iVsVL9H_secret_B6fqxEFzEj91LaE8EB2Ua4T3F	1	1	100	100	2024-04-02 00:00:00	\N	106	2024-04-02 23:49:20	2024-04-02 23:49:20	0	1	106	Table 1	asad	Player 1
64	5	0	10	pi_3P1HJEBjsMxFtgBe04dLTpxj_secret_TflxpsqpROKZADdplNJ8SxgZw	1	1	100	100	2024-04-02 00:00:00	W	101	2024-04-03 00:04:07	2024-04-03 00:04:08	0	1	101	Table 1	asad	\N
65	5	0	10	pi_3P1HKQBjsMxFtgBe1RHSARLk_secret_wGCdMyMnriBKLWG20Dd194dFN	1	1	100	100	2024-04-02 00:00:00	E	102	2024-04-03 00:05:22	2024-04-03 00:05:22	0	1	102	Table 1	kashi	\N
66	5	0	10	pi_3P1HLSBjsMxFtgBe0ZMJxZ6l_secret_glSDzyblvbiis73hAXGDKyN4V	1	1	100	100	2024-04-02 00:00:00	N	100	2024-04-03 00:06:26	2024-04-03 00:06:26	0	1	100	Table 1	bilal	\N
67	5	0	7	pi_3P1RdhBjsMxFtgBe17HYNngF_secret_x7kLgOLjaq6UHrY8ftEnHTeS0	1	1	4	8	2024-03-29 00:00:00	\N	67	2024-04-03 11:05:56	2024-04-03 11:05:57	0	1	67	Table 1	asad,majid	Player 7,Player 8
68	10	0	5	pi_3P1atnBjsMxFtgBe0wkymUl8_secret_DtawiUAKiwPHQLPDpc3lQ8Q3q	1	1	100	100	2024-04-02 00:00:00	N	89	2024-04-03 20:59:11	2024-04-03 20:59:11	0	1	89	Table 1	ahmad	\N
69	10	0	9	pi_3P1ax9BjsMxFtgBe0yuOfffb_secret_UMtQdT9Vok1H3BANQjN7byRaF	1	1	100	100	2024-04-02 00:00:00	E	91	2024-04-03 21:02:39	2024-04-03 21:02:39	0	1	91	Table 1	Ahmad	\N
71	62	0	9	pi_3P3Gv5BjsMxFtgBe0zNMLDI1_secret_QbmskjTTvYPLJut6yvQDg6Lgp	1	1	100.5	1809	2024-04-09 00:00:00	W,N,S	157	2024-04-08 12:03:27	2024-04-08 12:03:27	0	1	157	Table 1	Nemai T1W,Nemai T1N,Nemai T1S	\N
72	62	0	9	pi_3P3HEJBjsMxFtgBe1GratoNf_secret_9mCUtWGWRgmkynpbbarOpjB4V	1	1	100.5	301.5	2024-04-11 00:00:00	E	163	2024-04-08 12:23:19	2024-04-08 12:23:19	0	1	163	Table 2	NemaiT2E	\N
73	62	0	9	pi_3P3HG7BjsMxFtgBe1Snc8CzB_secret_JLHaj4lDAnmbz8gDLrERLGltx	1	1	100.5	402	2024-04-11 00:00:00	E	159	2024-04-08 12:25:11	2024-04-08 12:25:11	0	1	159	Table 2	NemaiT2E	\N
74	62	0	9	pi_3P3HGQBjsMxFtgBe0z9PtAGv_secret_iSnGBtkWkfLy1T7EmlJBwi7fV	1	1	100.5	502.5	2024-04-11 00:00:00	E	158	2024-04-08 12:25:30	2024-04-08 12:25:30	0	1	158	Table 2	NemaiT2E	\N
75	62	0	9	pi_3P3HGfBjsMxFtgBe182hdN47_secret_ExnHLKSj69aw39NAydW5RJdIu	1	1	100.5	502.5	2024-04-11 00:00:00	E	158	2024-04-08 12:25:45	2024-04-08 12:25:45	0	1	158	Table 2	NemaiT2E	\N
76	62	0	9	pi_3P3HO4BjsMxFtgBe09c802bL_secret_X5prgyQFYtaKq9lf80EIZovCM	1	1	100.5	502.5	2024-04-11 00:00:00	E	158	2024-04-08 12:33:24	2024-04-08 12:33:24	0	1	158	Table 2	NemaiT2E	\N
77	62	0	9	pi_3P3HhlBjsMxFtgBe0ptPdhQz_secret_h4sWQaVL91eVRh9dTBVA6i4Iz	1	1	100.5	502.5	2024-04-11 00:00:00	E	158	2024-04-08 12:53:45	2024-04-08 12:53:46	0	1	158	Table 2	Nemait	\N
78	5	0	9	pi_3P3OMfBjsMxFtgBe0hf42Xir_secret_omcqqpFCUTrrutzZQMoa46RUu	1	1	100.5	1206	2024-04-25 00:00:00	E,N	162	2024-04-08 20:00:25	2024-04-08 20:00:25	0	1	162	Table 2	asad,asad2	\N
79	5	0	9	pi_3P3OQNBjsMxFtgBe08GM6rtr_secret_6jiM5iX5JkzlVw2gVaKiwF2TR	1	1	100.5	804	2024-04-08 00:00:00	E,N	161	2024-04-08 20:04:15	2024-04-08 20:04:15	0	1	161	Table 3	asad,asadz	\N
80	5	0	9	pi_3P3OSBBjsMxFtgBe06k42IdW_secret_IeZM7Vf3dGTCUEgAHitMOxH3r	1	1	100.5	301.5	2024-04-08 00:00:00	E,N,S	164	2024-04-08 20:06:07	2024-04-08 20:06:07	0	1	164	Table 2	def,abc,ghi	\N
81	62	0	9	pi_3P3YtpBjsMxFtgBe0egktIvp_secret_KzCwxPeC5eDwNuv64s4gjpZxh	1	1	100.5	100.5	2024-04-11 00:00:00	E	158	2024-04-09 07:15:21	2024-04-09 07:15:21	0	1	158	Table 2	NemaiT1W	\N
82	62	0	9	pi_3P3Yu5BjsMxFtgBe01PvcYMH_secret_d13A9vFU9j364hKVfr3XRC8CS	1	1	100.5	100.5	2024-04-11 00:00:00	E	161	2024-04-09 07:15:36	2024-04-09 07:15:37	0	1	161	Table 2	NemaiT1W	\N
83	62	0	9	pi_3P3YuNBjsMxFtgBe1cSAvzQs_secret_p9tWTgKEjLhpFCs4oQiCb6yFh	1	1	100.5	201	2024-04-11 00:00:00	E,N	161	2024-04-09 07:15:55	2024-04-09 07:15:55	0	1	161	Table 2	NemaiT1W ,NemaiT1W ok	\N
84	62	0	9	pi_3P3Yv8BjsMxFtgBe1X0p6g2z_secret_OtFLz9FuLy21C38VIG4imXaJG	1	1	100.5	201	2024-04-11 00:00:00	E,N	161	2024-04-09 07:16:42	2024-04-09 07:16:43	0	1	161	Table 2	NemaiT1W ,NemaiT1W ok	\N
85	68	0	9	pi_3P3bY1BjsMxFtgBe1lfLY37w_secret_DagAkSHkzNbQFn10MGBYSCqvz	1	1	100.5	402	2024-04-11 00:00:00	E,W,N,S	158	2024-04-09 10:05:01	2024-04-09 10:05:01	0	1	158	Table 3	NemaiT1E,NemaiT1W,NemaiT1N,NemaiT1S	\N
86	68	0	7	pi_3P3cHdBjsMxFtgBe02WUvdCk_secret_RNxQXWlFlUWXK0j7or6uRcQ9Y	1	1	4	8	2024-03-30 00:00:00	\N	65	2024-04-09 10:52:08	2024-04-09 10:52:09	0	1	65	Table 3	Nemai,Nemai2	Player 2,Player 3
87	68	0	11	pi_3P3cLaBjsMxFtgBe0xxGNoOW_secret_ZfHbXuQiq5ZXXazfiOvIBwzRq	1	1	100	100	2024-04-09 00:00:00	\N	105	2024-04-09 10:56:14	2024-04-09 10:56:14	0	1	105	Table 1	Nemai1	Player 2
88	68	0	11	pi_3P3cMnBjsMxFtgBe0QAmmehB_secret_X3hCgmxzCCSphJ9EUqw9FOD17	1	1	100	100	2024-04-10 00:00:00	\N	166	2024-04-09 10:57:29	2024-04-09 10:57:29	0	1	166	Table 1	Nemai3	Player 3
89	12	0	9	pi_3P3g3TBjsMxFtgBe1azOeBSM_secret_eRNIg8gp8IR0w1TZnU7FBeIUU	1	1	100.5	100.5	2024-04-08 00:00:00	N	160	2024-04-09 14:53:47	2024-04-09 14:53:47	0	1	160	Table 4	Usama	\N
90	5	0	10	pi_3P3m9eBjsMxFtgBe0w9mNdHu_secret_4UIHwSIZaWNxBy59i0t9TVUCN	1	1	100	100	2024-04-11 00:00:00	S	104	2024-04-09 21:24:33	2024-04-09 21:24:34	0	1	104	Table 1	asad	\N
91	5	0	9	pi_3P3mo0BjsMxFtgBe0lEpz108_secret_Z5eOWK8BjD5CNtm8MnwivsPnY	1	1	100.5	100.5	2024-04-10 00:00:00	W	158	2024-04-09 22:06:16	2024-04-09 22:06:16	0	1	158	Table 2	majid	\N
92	5	0	6	pi_3P3muKBjsMxFtgBe1QYSG69U_secret_bGuJAY0TTthXzcmhgcuTQrgUK	1	1	100	200	2024-03-30 00:00:00	W,S	61	2024-04-09 22:12:48	2024-04-09 22:12:48	0	1	61	Table 2	wajid,asad	\N
93	70	4	0	payment_ref	2	1	100	200	\N	\N	0	2024-04-10 12:20:24	2024-04-10 12:20:24	0	1	\N	\N	\N	\N
95	70	0	12	pi_3P45pZBjsMxFtgBe0iH5ZIzH_secret_0TFOMnlciDqBry7CcoDRScjPH	1	1	100	200	2024-04-11 00:00:00	E,N	171	2024-04-10 18:25:09	2024-04-10 18:25:09	0	1	171	Table 1	Anil,Ajesh	\N
96	70	0	16	pi_3P46C8BjsMxFtgBe10JUHWlw_secret_cHH94iVfJvX4rZMGQAF8PKYdq	1	1	100	200	2024-04-13 00:00:00	E,N	198	2024-04-10 18:48:28	2024-04-10 18:48:29	0	1	198	Table 2	Anil,Ajesh	\N
97	70	0	16	pi_3P46ORBjsMxFtgBe11PmG1L5_secret_c3Rs4UClrSAYLmGztGURvhiFV	1	1	100	200	2024-04-11 00:00:00	W,S	201	2024-04-10 19:01:11	2024-04-10 19:01:12	0	1	201	Table 1	anil,sunil	\N
98	70	0	16	pi_3P4EGxBjsMxFtgBe0RPE5JeU_secret_YAcR8dFxNPvr9xlZg9HZZpOjy	1	1	100	200	2024-04-11 00:00:00	E,N	236	2024-04-11 03:25:59	2024-04-11 03:26:00	0	1	236	Table 1	anil,sunil	\N
99	71	0	16	pi_3P4daZBjsMxFtgBe1wgXC8Ge_secret_1yTGLWrqIGKnaqPYXVLwOiNoE	1	1	100	100	2024-04-11 00:00:00	S	237	2024-04-12 06:27:55	2024-04-12 06:27:56	0	1	237	Table 1	sooraj	\N
100	5	0	17	pi_3P5CtOBjsMxFtgBe1x2YMJq2_secret_qZ2Ns5ydUbmo33iLwskJHYvHN	1	1	25	25	2024-04-15 00:00:00	S	226	2024-04-13 20:09:42	2024-04-13 20:09:43	0	1	226	Table 1	asad	\N
101	36	0	6	pi_3P5XeFBjsMxFtgBe1SKCPRTn_secret_pQoE6p47BgfguyOMJ3cKqNTzb	1	1	100	100	2024-04-17 00:00:00	S	224	2024-04-14 18:19:27	2024-04-14 18:19:28	0	1	224	Table 1	abc	\N
102	62	0	18	pi_3P5njsBjsMxFtgBe01cm6HAJ_secret_FDFIJYrfFgkOMXzsMaGspUqva	1	1	50	50	2024-04-25 00:00:00	\N	244	2024-04-15 11:30:20	2024-04-15 11:30:20	0	1	244	Table 1	nema	Player 1
103	62	0	13	pi_3P5nnnBjsMxFtgBe0xJGMNlG_secret_XmaCG8xHs57LvVYRiAfasu5lO	1	1	25	25	2024-04-10 00:00:00	S	175	2024-04-15 11:34:22	2024-04-15 11:34:23	0	1	175	Table 1	Nemai3	\N
104	5	0	17	pi_3P5s38BjsMxFtgBe0UbtvC5g_secret_604yO6y2jDlhVpt1Y2PWBzVdD	1	1	25	50	2024-04-11 00:00:00	E,W	227	2024-04-15 16:06:29	2024-04-15 16:06:30	0	1	227	Table 1	efg,abc	\N
105	5	0	17	pi_3P5s4aBjsMxFtgBe12xUJkEg_secret_XgXX3VD242zmsRNTWRXc955fN	1	1	25	25	2024-04-10 00:00:00	W	227	2024-04-15 16:08:00	2024-04-15 16:08:01	0	1	227	Table 1	asad	\N
106	75	4	0	payment_ref	5	1	100	500	\N	\N	0	2024-04-16 03:27:40	2024-04-16 03:27:40	0	1	\N	\N	\N	\N
107	74	0	18	pi_3P65RbBjsMxFtgBe0uRdyR4J_secret_UwNoLEO48bkD0TzIn5nKfpdrn	1	1	50	50	2024-04-11 00:00:00	\N	242	2024-04-16 06:24:38	2024-04-16 06:24:39	0	1	242	Table 2	asad	Player 2
108	75	0	16	pi_3P67NqBjsMxFtgBe0N5XapNV_secret_SF6hGZezIImLJAVKg6YPrGafh	1	1	210	210	2024-04-16 00:00:00	W	305	2024-04-16 08:28:54	2024-04-16 08:28:54	0	1	305	Table 1	ahmaddxba	\N
109	74	0	16	pi_3P6EipBjsMxFtgBe1FUeYHeA_secret_M4h73YdGify0O8vdArheojW1p	1	1	210	420	2024-04-16 00:00:00	E,N	306	2024-04-16 16:19:02	2024-04-16 16:19:03	0	1	306	Table 1	asad,waleed	\N
110	74	0	16	pi_3P6Ek8BjsMxFtgBe1jq9vSqv_secret_QFTJGdcep6EeR2AFeK72ihWcl	1	1	210	210	2024-04-16 00:00:00	W	306	2024-04-16 16:20:24	2024-04-16 16:20:25	0	1	306	Table 1	asad	\N
111	53	0	6	pi_3P6HB1BjsMxFtgBe1SLEwaCi_secret_wDWuRry8RDcFqUlI4J94OFgTH	1	1	100	100	2024-04-17 00:00:00	W,Zain	220	2024-04-16 18:56:19	2024-04-16 18:56:20	0	1	220	Table 3	\N	\N
112	53	0	6	pi_3P6HCuBjsMxFtgBe09TIKy1d_secret_kQljtMdy4m8LWNFm5zLLnPVMI	1	1	100	100	2024-04-17 00:00:00	W,Zain	223	2024-04-16 18:58:16	2024-04-16 18:58:17	0	1	223	Table 1	\N	\N
113	53	0	6	pi_3P6HEIBjsMxFtgBe00DMzHQw_secret_YTHj13aQJnyXndPLdnHGjin6Q	1	1	100	100	2024-04-17 00:00:00	W	223	2024-04-16 18:59:41	2024-04-16 18:59:42	0	1	223	Table 2	Zain	\N
115	74	0	16	pi_3P6NSJBjsMxFtgBe0zLirpmp_secret_hUSiu6A9uGLXlsdx5byoF5dh1	1	1	210	420	2024-04-17 00:00:00	N,S	305	2024-04-17 01:38:35	2024-04-17 01:38:35	0	1	305	Table 1	asad,abc	\N
116	74	0	16	pi_3P6NScBjsMxFtgBe0XXUsDje_secret_OGmIzafTH7bAD3ShPe1Wp0qdQ	1	1	210	420	2024-04-17 00:00:00	N,S	305	2024-04-17 01:38:54	2024-04-17 01:38:55	0	1	305	Table 1	asad,abc	\N
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

COPY public.temp_users (id, name, email, dial_code, phone, phone_verified, active, email_verified, password, email_verified_at, role, first_name, last_name, user_image, user_phone_otp, user_email_otp, user_device_token, user_device_type, user_access_token, firebase_user_key, device_cart_id, created_at, updated_at, country_id, user_name, dob, skill_level, step, user_type, attachement) FROM stdin;
1	ranaDxba	test8@hotmail.com	971	703452621054	0	1	1	$2y$10$cvOV7RBHRJD9m2amzXyhbebHXt4tTMtb2PSE00XTLeDxTbhQm8O6u	2024-03-25 20:13:31	2	\N	\N		1111	1111	45534	android	\N	\N	\N	2024-03-25 20:13:31	2024-03-25 20:13:49	1	ranadxbaqff	1994-04-16	1	2	2	
2	Asad Nazir	asad@gmail.com	971	3441560319	0	1	1	$2y$10$byvWACdi3CFmh8o11eQ6nOxAzo3N0mbsfhmUYSoetLgCBCMKW.f4C	2024-03-25 20:20:09	1	\N	\N		1111	1111	eyBjLRTGQmW2cvrlctluGz:APA91bGZEWxXWhkIREEzDz_VyAcaYqrQooaD1qFn_jAisDXegnmsqtYPLBFIH_JHqom9t8wYru4j5-_8lerXHT7VhVArfZ4YKfnMKaUAby1B96Ziq6YHJoaDy1vuhccXTr5SINpdKgIf	ANDROID	\N	\N	\N	2024-03-25 20:20:09	2024-03-25 20:20:40	1	asad@gmail.com	1995-03-26	4	2	1	
3	Usama Shakee	ushakeel@gmail.com	971	3312334567	0	1	1	$2y$10$QeWoQ1tcz1CHDUCeOQ35Wu67bRur2WPXoIC2Nqaio9PWPw8QTszwu	2024-03-26 07:47:22	1	\N	\N		1111	1111	fR5epZHvTxmIjD1_xYQSHt:APA91bEH1OQGZdBfpu-cEo-E0UmCUqztpj03OxsAYOZ-gc6XCMOmi9Et8-3H0SEzGqSuNYTcCV_rW0ruV0ks-smz4FkeLN4ScOO-WD4Ea9YAfxxn189W_sYmJ_tsW-zP7B2qfRYpDXJ2	ANDROID	\N	\N	\N	2024-03-26 07:47:22	2024-03-26 07:47:41	1	usama	2024-03-26	1	2	1	
4	Usama	ushakeel@ymail.com	971	3312333456	0	1	1	$2y$10$qP.ks7vFEBQ0LeZStg3jYeXhnwcoYm34KfcQEOXnTOdw5yaHxq8KW	2024-03-27 15:05:03	3	\N	\N		1111	1111	fR5epZHvTxmIjD1_xYQSHt:APA91bEH1OQGZdBfpu-cEo-E0UmCUqztpj03OxsAYOZ-gc6XCMOmi9Et8-3H0SEzGqSuNYTcCV_rW0ruV0ks-smz4FkeLN4ScOO-WD4Ea9YAfxxn189W_sYmJ_tsW-zP7B2qfRYpDXJ2	ANDROID	\N	\N	\N	2024-03-27 15:05:04	2024-03-27 15:05:23	1	Usama99	2024-03-27	2	2	3	
5	Usama Shakeel	ushakeel123@gmail.com	971	3312334565	0	1	1	$2y$10$UH6NrdDuKWh8M7DF1GDKZOgOjIllCEnf36384BPtGuhFXxb5zh7I2	2024-03-27 15:09:19	2	\N	\N		1111	1111	fR5epZHvTxmIjD1_xYQSHt:APA91bEH1OQGZdBfpu-cEo-E0UmCUqztpj03OxsAYOZ-gc6XCMOmi9Et8-3H0SEzGqSuNYTcCV_rW0ruV0ks-smz4FkeLN4ScOO-WD4Ea9YAfxxn189W_sYmJ_tsW-zP7B2qfRYpDXJ2	ANDROID	\N	\N	\N	2024-03-27 15:09:19	2024-03-27 15:09:43	1	Usama Shakeel	2024-03-27	3	2	2	
6	Asad Nazir	asadz1415@gmail.com	971	3445160335	0	1	1	$2y$10$5Ctp/9.dowfzPejxzo8RxuiyZ6Tk3PvrM4.iJPuXh4abHUKloPQoS	2024-03-27 17:46:14	2	\N	\N		1111	1111	eyBjLRTGQmW2cvrlctluGz:APA91bGZEWxXWhkIREEzDz_VyAcaYqrQooaD1qFn_jAisDXegnmsqtYPLBFIH_JHqom9t8wYru4j5-_8lerXHT7VhVArfZ4YKfnMKaUAby1B96Ziq6YHJoaDy1vuhccXTr5SINpdKgIf	ANDROID	\N	\N	\N	2024-03-27 17:46:15	2024-03-27 17:46:57	1	Asad	1994-07-27	1	2	2	
7	Ahmad rana	ahmad@gmail.com	971	123659854	0	1	1	$2y$10$nNUJ0ppzUMJ9yPxekLba2OMmNi33.I.ogp1g15Znc89BchYDgo.xq	2024-03-28 06:24:48	1	\N	\N		1111	1111	cTac8E3wQSe_IUxIosdat_:APA91bELodyu5uxio0knMCZAQ6-qHNhMYINIph8LBysUqg3ScArLhVHRR38UJ5IM_Fm-DrPTHwxfnG1A4N6cBY2fErw9gcQ7nPOmVEVSYNOW4yECki7d-Ws8hZoDZf68xBPc5BiCd2Db	ANDROID	\N	\N	\N	2024-03-28 06:24:48	2024-03-28 06:25:36	1	Ahmad	2022-06-14	2	2	1	
8	Hamid	razahamd34@gmail.com	971	3441562554	0	1	1	$2y$10$hicF9v3gu9/Uf6ChmYSupuS3JMSM13Yr2WQ0XIczB26KW52SZSK.K	2024-03-28 06:43:22	1	\N	\N		1111	1111	cbox4NTyTlWlNSDejJE2Gx:APA91bEmO7nHWH0FJ5k1E702q5p1E3gMy7dpz0j3oi3pg17oZjrjHIXrGhxBr1wq2VEP5mnXlNOVh7SbpYZZjCkbBoYZzYUuDLQZpCfGhRSdUtI2iwsgbvmPzHpRcMqrHV3zaHy_xkRz	ANDROID	\N	\N	\N	2024-03-28 06:43:22	2024-03-28 06:44:13	1	razahamd34@gmail.com	1996-03-28	1	2	1	
9	Usama Shakeel	usama01@gmail.com	971	3323345678	0	1	1	$2y$10$xlO9ALGttkczILJctpX8pOyi73zAO1C9ExpEUEiTX6fSP6ayhoCTy	2024-03-29 07:07:34	1	\N	\N		1111	1111	cGV6u1sbT-WqtziXNkrg5p:APA91bGbQz78hze0sIlBXMYbFZWFNTS0K582q9Gah6yoakkzW-ksWJVAeGhddXGQ4VUreb48OM7n27nZbZ1bVJAHbG_8DvyY1Uqf3hatYCGlrq_WxfkjovJNiK87eDnCFwU0i2MKWA6E	ANDROID	\N	\N	\N	2024-03-29 07:07:34	2024-03-29 07:08:09	1	Usama	1972-03-29	2	2	1	
10	ghh	aa@aa.com	971	5466494094	0	1	1	$2y$10$YcLlrj2nQjgJn0D38J7E3uFB2TF74f4J0FJKTwBIfQDv4bcUDlAB.	2024-04-01 10:35:53	1	\N	\N		1111	1111	cfU_to13RyO7A7Q0oZlcBq:APA91bGF6Srgu2okaOWn4ZTAm6hpbqnwCjMaXjrfgBh3C78l8CuZuQ5aS_qdV5KBr4lQuKORTWCUQ-l5_A0eUaCZBqP_Bj_wp6zRqPic_BOvi8l7OZiwzOp6sg76A8iZ1dM2Ki9nbGRT	ANDROID	\N	\N	\N	2024-04-01 10:35:53	2024-04-01 10:36:47	1	anil	2024-03-08	3	2	1	
11	ranaDxba	test9@hotmail.com	971	7034526210098	0	1	1	$2y$10$/1v7Mp1frHIoB1CTWkwfpu12bSgABwO4tvrUAqZXRNpslpiSPyD16	2024-04-03 16:42:56	2	\N	\N		1111	1111	45534	android	\N	\N	\N	2024-04-03 16:42:56	2024-04-03 16:43:21	1	ranadxbaqff	1994-04-16	1	2	2	
12	zain	skl1@gmail.com	+971	151810115511	0	1	1	$2y$10$ywmQR0YkgxQi1itmO062dOIWwgWWf.ao5jWpoCnTVQmiCWdAvAcTe	2024-04-03 18:54:12	2	\N	\N		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	\N	2024-04-03 18:47:43	2024-04-03 18:54:55	1	test	2024-04-03	4	2	2	
13	wk	abc@gmail.com	971	949494499494	0	1	1	$2y$10$qdHY4lK6zLFl0WU5DinDuOMY6uplU2/DKoMrYgVUD823RksXnA4DK	2024-04-03 19:00:49	2	\N	\N		1111	1111	cv_pmBEPQd-e4ZKljoaYc5:APA91bEZo6YjIbolY3uhbC4CwoYEKv6jG7b85UaB7lDTPIBU2r5xqAK5p3zxw_W_fHRxpdN5-fjZnRwuk1l4nvYW5BjAaNugpv7qke3W3rTOCG7sFtqWksD2LeALnfhLF4qSDp5XX_si	ANDROID	\N	\N	\N	2024-04-03 19:00:49	2024-04-03 19:01:25	1	aabc	2024-04-04	4	2	2	
14	abc	user10@gmail.com	+971	845454544	0	1	1	$2y$10$ZfnoBnBOaa9OpAIagRpuLeRfQGPPF9oeD4.ZvrqaqKvhhw0UsJntS	2024-04-03 20:24:40	1	\N	\N		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	\N	2024-04-03 20:24:40	2024-04-03 20:24:55	1	abc	2024-04-04	4	2	1	
15	ba	user11@gmail.com	+971	45464644433	0	1	1	$2y$10$sjPRMwGR1ql4a87oBHTJse0Z9DpT62RnBbcCXficNU0wzaP6ErTkW	2024-04-03 20:34:16	1	\N	\N		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	\N	2024-04-03 20:34:16	2024-04-03 20:34:34	1	user	2024-04-04	4	2	1	
16	abc	user12@gmail.com	+971	461644644843	0	1	1	$2y$10$hnWDB0WJxWO/P5aAKTMzYODnDOBzZVTJTqCXhsoFCum1vSm6uf0QS	2024-04-03 20:38:12	1	\N	\N		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	\N	2024-04-03 20:38:12	2024-04-03 20:38:28	1	test	2024-04-04	4	2	1	
17	nssh	user13@gmail.com	+971	461610131311	0	1	1	$2y$10$iZmxMJMi0GlYKufmGctmculGkfy8oyZvpyjNUArPP.xg/EXHpeGaK	2024-04-03 20:40:29	1	\N	\N		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	\N	2024-04-03 20:40:29	2024-04-03 20:40:44	1	anv	2024-04-04	4	2	1	
18	hahaah	user14@gmail.com	+971	040484848484	0	1	1	$2y$10$duhL0FtMvkcXlk/EL6xcfOn.witknhMe2dLUQrLeJtvH/713r3Mfi	2024-04-03 20:45:06	1	\N	\N		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	\N	2024-04-03 20:45:06	2024-04-03 20:46:09	1	abc	2024-04-04	4	2	1	
19	bas	user15@gmail.com	+971	0184844848	0	1	1	$2y$10$XOXBdjW8cJ0sc5bFhvcnm.DjoKA/eBscsHpB4MpYR7G71x/pW0d4.	2024-04-03 20:53:22	1	\N	\N		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	\N	2024-04-03 20:53:22	2024-04-03 20:53:33	1	user	2024-04-04	4	2	1	
20	Nas	nas@gmail.com	971	9499499466	0	1	1	$2y$10$wTcQ36X7o0PE5V2ydRrpuu74ufcQIzteW9yfntttggMdUaNECKU5m	2024-04-04 18:07:09	1	\N	\N		1111	1111	f_PYG4p2T7OITxaOdyRq0q:APA91bHg0kyMwTUa5Z8MDVg7LknsPlrsOyvV88pmZNzZCOHbwNNA3Ta9deBBsKqAEJsqUa6JHHN5K1jfaM1Tu9Wg1xw7RVLSs48o-QRa688q23q6zEK2MAuoGH9QSo6l2m5dLIUuKLJY	ANDROID	\N	\N	\N	2024-04-04 18:07:09	2024-04-04 18:07:26	1	ali	2024-04-04	1	2	1	
21	nasrullah	nasrullah@gmail.com	+971	32324243132	0	1	1	$2y$10$2P/nrSFuzYx4edX66mWO0.HOTQ1XhE/YzC9ZkmrEfKizRWZnRdTQi	2024-04-04 18:09:21	1	\N	\N		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	\N	2024-04-04 18:09:21	2024-04-04 18:09:45	1	nasrullah	2024-04-04	1	2	1	
22	bbb	anilnavis@gmail.com	+971	5434384622	0	1	1	$2y$10$JOiHYkF2jnX07MJnMLgWzuumkHrRWzHeujs3YjyQohcCZ2v7gw06y	2024-04-08 02:07:18	1	\N	\N		1111	1111	abdhjef ekef kjwf wedfw	iOS	\N	\N	\N	2024-04-08 02:07:18	2024-04-08 02:07:59	1	anill	2024-04-08	2	2	1	
23	N Biswas	nbu1@mailinator.com	971	932572366	0	1	1	$2y$10$Fe40KVSB8zHRxr.YpOMo6Oa8agDcffqHNUfjaE0HKT3ErgugtJFK.	2024-04-08 04:06:27	1	\N	\N		1111	1111	d29c-zCtT0Cqvc1oMnpvYu:APA91bH_EZpgTtvxaP7Qf0XJL7w2LM8PNgibOd3pXD8ccIES-w7SA0HffqzGJ8KAmb7x0werELMHBEYqlax_JKb-BP9Xs_ETVD1EG26PidCdxEBdXMDmpKUodArjXHnE8IJRFfQBtc7Q	ANDROID	\N	\N	\N	2024-04-08 04:05:02	2024-04-08 04:08:41	1	NemaiU1	1995-04-15	2	2	1	
24	N Biswas F	nbf1@mailinator.com	971	932474269	0	1	1	$2y$10$6ZG8JRUkf6mR9sdYbzM1MOlLpSDnnXyltedxmt1pdX7y3smjvmBD.	2024-04-08 04:42:25	3	\N	\N		1111	1111	d29c-zCtT0Cqvc1oMnpvYu:APA91bH_EZpgTtvxaP7Qf0XJL7w2LM8PNgibOd3pXD8ccIES-w7SA0HffqzGJ8KAmb7x0werELMHBEYqlax_JKb-BP9Xs_ETVD1EG26PidCdxEBdXMDmpKUodArjXHnE8IJRFfQBtc7Q	ANDROID	\N	\N	\N	2024-04-08 04:42:25	2024-04-08 04:43:08	1	NemaiSP1	1995-04-23	1	2	3	
25	N Biswas	nbu2@mailinator.com	971	933174266	0	1	1	$2y$10$w0ZjqkGXYSUcN70f.hgKVedyVy0ZWNZAU0PZ6ffbbNhhwjZH8v.am	2024-04-09 05:57:09	1	\N	\N		1111	1111	fHU2MP-NQ9m2Gl5vWvZGzS:APA91bFrEf1XdFzhdVWkD8Cen0cIC61e2OTtT9J8CPoP9OcmrnyeSK2NvGp_RSeu7HFTyI1xu3tnXs1kzQEBmVnXJnQBKOXygKh3zLIBf7ylq9_die44DCrRoSvMqzVsehDMcE4-LOSp	ANDROID	\N	\N	\N	2024-04-09 05:57:09	2024-04-09 05:57:35	1	NemaiU2	1997-04-26	2	2	1	
26	anilnavis	anil@anil.com	971	466464049	0	1	1	$2y$10$ShgoZ.A7JRhIz3zDFSK5..9FiAQNExrYNhvS37zJYBNbq/MJoeTMu	2024-04-10 12:12:28	1	\N	\N		1111	1111	fe25BnN5SCKlBx6CyHV8wN:APA91bGOqqj1pRDN5KQzM2yLh1CKCfhUCMhtzPAcHjQrNmWyuzmVirhGDarXZeLvXV4yxHkZMfOuNiwiQkrRA2l3PloakZoA2-jfKmF_CAuZEQIP-07KkbV0suauGiNJJMofLesSyXBs	ANDROID	\N	\N	\N	2024-04-10 12:12:29	2024-04-10 12:13:30	1	anilnavis	1971-04-10	4	2	1	
27	N Biswas	nbf3@mailinator.com	91	6325752696	0	1	1	$2y$10$sYta2E.9m6W5onIBJeda/.rLmjw/AB9J60QO46QcliMGrdaDFBQ1y	2024-04-15 11:08:01	3	\N	\N		1111	1111	fHU2MP-NQ9m2Gl5vWvZGzS:APA91bFP6uMFfnaybyLB8h94WTnIpGxnT9J5x63VhSirUIROj7CZEhBPqTl4u-AMWaye4Eft2rFoF2MYpCa3Ag1h1dJMzd8yrW7tD_oZV6hSGifw_xJY8-2zhk9x27l_05_kRGK06mW4	ANDROID	\N	\N	\N	2024-04-14 14:21:32	2024-04-15 11:08:33	3	NemaiF3	1999-04-15	3	2	3	
28	Asad	abcd@gmail.com	91	3445588552	0	1	1	$2y$10$MIdjE35K8zNH/gSyHwsK6OhpIG8bqtW99ks5TgYiUOxCXI.rdpAAe	2024-04-15 22:27:36	2	\N	\N		1111	1111	cHnGcj9AQeKHoUjk7sG0Ni:APA91bGg4FsZ_8IO871OWHomKKffXXLpl-9xa48oLAQT8sfgzVd5bKa2F1gZ5cL4FLx7zAwhiCtK5EPJUsA2knHfZ4pcW9ATs2hDNSjjaGJwknTydDubKkIs_mpwkKlScKKP_DKpp_Rx	ANDROID	\N	\N	\N	2024-04-15 22:27:36	2024-04-15 22:28:12	3	Asad	1998-04-10	1	2	2	
29	Ahmad	testdxba@gmaip.com	91	96325874852	0	1	1	$2y$10$4IFHYQKXBLi8eSL3Ub4DYeDGil8CIeqkkypXLzYp3B24a1kWnfqB2	2024-04-16 00:33:21	1	\N	\N		1111	1111	fMkOeJSHTiSwUlmkZWqPh9:APA91bEnLVlIoBBtXHTyTShJ3rBqGYN601NFLebhW2yriwNhDnU7m-y6IDVjPLPqHOA7bshRIm49JUjAQYobT1Xoi8bO1An-xxdN7o8lW1blk43kQgK9by4ySF5_r3TK-eutMlGKcN_k	ANDROID	\N	\N	\N	2024-04-16 00:33:22	2024-04-16 00:33:53	3	ahmad dxba	2023-08-07	2	2	1	
\.


--
-- Data for Name: type_of_property; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_of_property (id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_address (id, user_id, street, location, country_id, state_id, city_id, address_type, status, is_default, created_at, updated_at, land_mark, building, latitude, longitude, apartment, full_name, dial_code, phone) FROM stdin;
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
-- Data for Name: user_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_settings (id, user_id, booking_confirmed_push, booking_reminder_push, promotional_alert_push, winner_alert_push, booking_confirmed_email, booking_reminder_email, promotional_alert_email, winner_alert_email, created_at, updated_at) FROM stdin;
1	10	0	0	0	0	0	0	0	0	2024-03-28 17:37:19	2024-03-28 17:37:19
\.


--
-- Data for Name: user_vehicle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_vehicle (id, vehicle_type, user_id, vehicle_front, vehicle_back, vehicle_registration, driving_license, deleted, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, dial_code, phone, phone_verified, password, email_verified_at, role, first_name, last_name, user_image, user_phone_otp, user_device_token, user_device_type, user_access_token, firebase_user_key, remember_token, created_at, updated_at, country_id, state_id, city_id, area, active, deleted, display_name, business_name, email_verified, user_email_otp, dob, vendor, store, previllege, about_me, verified, designation_id, is_private_profile, user_name, gender, website, wallet_amount, password_reset_code, password_reset_time, password_reset_otp, privacy_id, send_notification, mute_message, commission, public_business_info, facebook_url, instagram_url, linkedin_url, is_social, twitter_url, tiktok_url, user_type_id, activity_type_id, commercial_license, commercial_reg_no, associated_license, res_dial_code, res_phone, address, business_type_id, admin_commission_perc, residence_no, nationality, rating, rated_users, banner_image, hide_profile, temp_dial_code, temp_mobile, skill_level, step, membership_type, membership_expiry, user_type, attachement, membership_status) FROM stdin;
1	Admin	admin@admin.com	971	112233445566778899	0	$2y$10$4CKClSnfh0w959jNrsJyl.8/oowWbizHIg4FrOlXxfgtYYBU6Y6jK	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	\N	\N	0	\N	\N	0	0	0	\N	0	\N	0	\N	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	0	0	\N	0	\N	\N
2	ranadxba	ranadxba@gmail.com	971	1234679	1	$2y$10$X1D2WmxR.HXUBl.ZOc9VAOBd9UEsBahLRcSSS7o3sQ9ouW1XDMlwm	\N	2	\N	\N	1711397079_6544832a9d52d_1698988842.png	\N	\N	\N	\N	\N	\N	2024-03-25 20:04:39	\N	1	0	0	0	1	0	\N	\N	0	\N	1995-03-14	0	0	0	\N	0	\N	0	ranadxba	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			1	0	0	\N	2	\N	\N
3	ranadxba	ranadxba@hotmail.com	971	1234567890	1	$2y$10$0DIXw3dTLgwRU/118k89yuj4ghOD0KpbqlNSGCMBhXOYfEgXsH5uy	\N	3	\N	\N	1711397151_6544832a9d52d_1698988842.png	\N	\N	\N	\N	\N	\N	2024-03-25 20:05:51	\N	1	0	0	0	1	0	\N	\N	0	\N	1998-03-10	0	0	0	\N	0	\N	0	ranadxba	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	0	0	\N	3	\N	\N
11	Hamid	razahamd34@gmail.com	971	3441562554	1	$2y$10$hicF9v3gu9/Uf6ChmYSupuS3JMSM13Yr2WQ0XIczB26KW52SZSK.K	2024-03-28 06:44:29	1	\N	\N	\N		\N	\N	f569e4cb2c186195c3a3bfb61888f656ebc46a8126bacd40711334e235b2117e	-Nu2nNl3lBd6SPrnX9Wy	\N	2024-03-28 06:44:29	2024-03-28 06:44:30	1	0	0	0	1	0	\N	\N	1		1996-03-28	0	0	0	\N	0	\N	0	razahamd34@gmail.com	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			1	2	0	\N	1		\N
5	Asad Nazir	asad@gmail.com	971	3441560319	1	$2y$10$k0UZm2UDx0.IuMnYCYvjKuMcr0Cz4sPZLsiMcHeAg0pjvQwD8Qk0S	2024-03-25 20:20:51	1	\N	\N	1713131534661c500edec98.jpg			\N	c73bfc3e29ff46b26fa3fd8e8efc0fff1163710fe96d96d8ce0be566164063cb	-NtrGStioJCZQC2Xw6s_	\N	2024-03-25 20:20:51	2024-04-15 22:26:30	1	0	0	0	1	0	\N	\N	1		1995-03-26	0	0	0	\N	0	\N	0	Asaddxba	1	\N	0	e357d3a02b5c94305b92b1ca87fba56db59aa8095b207894b87c86b3f5483d01	2024-04-09 14:28:14	1111	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			2	2	1	2025-04-04 23:21:25	1		active
6	Usama Shakee	ushakeel@gmail.com	971	3312334567	1	$2y$10$QeWoQ1tcz1CHDUCeOQ35Wu67bRur2WPXoIC2Nqaio9PWPw8QTszwu	2024-03-26 07:47:45	1	Usama909	\N	\N		1111	\N	b69013adf96840cd5607d0cf7fcd73b508d0d5c75f38e8c1263cf2a9b100a107	-Nttig75-0IZfv8iMFq_	\N	2024-03-26 07:47:45	2024-03-28 14:49:19	1	0	0	0	1	0	\N	\N	1		2024-03-26	0	0	0	\N	0	\N	0	usama	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			1	2	0	\N	1		\N
13	krishna	aamir1111@gmail.com	971	703452222	0	$2y$10$jEscRpC2bpIUtudjwhE/muI5xW4y/ucPolr8PsKD8qbS8.MhhNaaG	2024-04-01 06:27:38	2	\N	\N	\N	1111	1111	postman	d2d4933e1e0bfd2cb25677404b9bdabdfef885d078dba65a4551e71619f42a12	-NuNKsvonZbOiXk9Ruws	\N	2024-04-01 06:27:38	2024-04-01 09:40:12	1	0	0	0	1	0	\N	\N	1	1111	1994-04-16	0	0	0	\N	0	\N	0	social 1	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			1	2	0	\N	0	\N	\N
14	ghh	aa@aa.com	971	5466494094	1	$2y$10$YcLlrj2nQjgJn0D38J7E3uFB2TF74f4J0FJKTwBIfQDv4bcUDlAB.	2024-04-01 10:36:52	1	\N	\N	\N		cARLKQE8SC6rTKRjs2_f8b:APA91bH3qr3hwGQH2Qvm8KqJ3f8WCGZmFb0NHkYD0M0IwaJZzvoD2V5D9gz1vZuh_JvNVCjz1H8q-WAK4V0CWSK-YP_gZ_9WdmNJmJlOHTggiwUowakPwpTapc5alR9knhisEtFNfef2	\N	93c0ec84d875572700b4c85f6dbf4ab09f09652f039f941f188da9de27d09b23	-NuODvlhX6K1VH5dSEe3	\N	2024-04-01 10:36:52	2024-04-02 04:17:44	1	0	0	0	1	0	\N	\N	1		2024-03-08	0	0	0	\N	0	\N	0	anil	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			3	2	0	\N	1		\N
8	Usama Shakeel	ushakeel123@gmail.com	971	3312334565	1	$2y$10$UH6NrdDuKWh8M7DF1GDKZOgOjIllCEnf36384BPtGuhFXxb5zh7I2	2024-03-27 15:09:47	2	\N	\N	\N			\N	c7ab452ec63bb00baa34ca18dde794ff394978cbc34df0740cc9f14daaba1917	-Nu-SRkGZLXE4gAx57Z_	\N	2024-03-27 15:09:47	2024-03-29 07:03:57	1	0	0	0	1	0	\N	\N	1		2024-03-27	0	0	0	\N	0	\N	0	Usama Shakeel	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			3	2	0	\N	2		\N
4	ranaDxba	test8@hotmail.com	971	703452621054	1	$2y$10$cvOV7RBHRJD9m2amzXyhbebHXt4tTMtb2PSE00XTLeDxTbhQm8O6u	2024-03-25 20:14:01	2	\N	\N	\N		1111	\N	666d65143927ce2b5bcfb1d15b90808335742f734de2d65c5d2b721b9ed3092e	-NtrEtuAHVpIFqrplnAk	\N	2024-03-25 20:14:01	2024-03-28 14:43:04	1	0	0	0	1	0	\N	\N	1		1994-04-16	0	0	0	\N	0	\N	0	ranadxbaqff	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			1	2	0	\N	2		\N
9	Asad Nazir	asadz1415@gmail.com	971	3445160335	1	$2y$10$5Ctp/9.dowfzPejxzo8RxuiyZ6Tk3PvrM4.iJPuXh4abHUKloPQoS	2024-03-27 17:47:03	2	\N	\N	\N		\N	\N	21be9305d092089806235eb020c3d6396b0a40321095c175ad70c0231ded3e52	-Nu00Rc91gsQ23ZsWE9n	\N	2024-03-27 17:47:03	2024-03-27 17:47:04	1	0	0	0	1	0	\N	\N	1		1994-07-27	0	0	0	\N	0	\N	0	Asad	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			1	2	0	\N	2		\N
7	Usama	ushakeel@ymail.com	971	3312333456	1	$2y$10$qP.ks7vFEBQ0LeZStg3jYeXhnwcoYm34KfcQEOXnTOdw5yaHxq8KW	2024-03-27 15:05:26	3	\N	\N	\N		cp9JLJ4uTeO2SJqbCd3fN5:APA91bFBtv5pZ6ekrzjmK2V3vppSZVEfrsUWghcGkwpijchnIKG6_dRgy7fWWhCi4xVwRC8Yl3-2dDzsN-srFe1_1lX1v_68avLy8347RA7xILGX-b_VIVa90JJbDPlj3II0Ji_YJ-6Y	\N	6f2b0144de807ee7fc93c85415fe3342be3f2a2f8f3b0d22ad2e12e37c42bc77	-Nu-RSFYre_cqhTvAM3D	\N	2024-03-27 15:05:26	2024-04-16 00:55:42	1	0	0	0	1	0	\N	\N	1		2024-03-27	0	0	0	\N	0	\N	0	Usama99	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			2	2	2	2024-05-08 19:26:22	3		active
15	krishna	aamir11111@gmail.com	971	703452223	0	$2y$10$6zPjI89wzuVHp23XhXHVg.4RQ1yyBJvEGzKADxPAqdPUDTaw52./u	2024-04-02 11:41:04	2	\N	\N	\N	1111	1111	postman	ae32e2259d35a0e1faeafae94250de987bdaa67ec66dbbad4c13e4ee4f329c4a	-NuTbCybYKUOGBY6sX9M	\N	2024-04-02 11:41:04	2024-04-02 11:41:54	1	0	0	0	1	0	\N	\N	1	1111	1994-04-16	0	0	0	\N	0	\N	0	social 11	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			1	2	0	\N	0	\N	\N
12	Usama Shakeel	usama01@gmail.com	971	3323345678	1	$2y$10$xlO9ALGttkczILJctpX8pOyi73zAO1C9ExpEUEiTX6fSP6ayhoCTy	2024-03-29 07:08:14	1	\N	\N	\N		ad	\N	0b55b04b44644c24c6383c2d61001a71ddabf211222237bb5baa290149d445f3	-Nu81PQJ-acORhxwd3Bk	\N	2024-03-29 07:08:14	2024-04-09 07:46:19	1	0	0	0	1	0	\N	\N	1		1972-03-29	0	0	0	\N	0	\N	0	Usama	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			2	2	2	2024-05-08 10:18:41	1		active
16	krishna	aamir111111@gmail.com	971	7034522567	1	$2y$10$S99FKCQF5jsInOAPdWROWur8/2nyzQ/U1auST3RZQg4uduUogT2yW	2024-04-02 22:39:34	1	\N	\N	\N	1111	1111	postman	287114c5235be7f60c21ebc63c5082a6cce6c6af1e7c2d22d85243cc118827de	-NuVxvserIe-WynFr_h0	\N	2024-04-02 22:39:34	2024-04-02 23:03:47	1	0	0	0	1	0	\N	\N	1	1111	1994-04-16	0	0	0	\N	0	\N	0	social 11	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			1	2	0	\N	0	\N	\N
23	\N	aamir12111@gmail.com	\N	0	0	$2y$10$GOTjCrrRj1to5hj3JQ1tQuOhyiajgGupD/YkZzOjTCuW3cIeiUAD2	2024-04-03 11:57:47	0	\N	\N	\N	\N	1111	postman	537a0e981d090dde24a8517cfcf5623bf16f5f3c6b39f0410eb6370b779e65ba	-NuYocaJQ27kxTphNlUM	\N	2024-04-03 11:57:47	2024-04-03 11:57:47	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	social 11	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
28	wk	abc@gmail.com	971	949494499494	1	$2y$10$qdHY4lK6zLFl0WU5DinDuOMY6uplU2/DKoMrYgVUD823RksXnA4DK	2024-04-03 19:02:22	2	\N	\N	\N			\N	c20359b229b9d5ac6ec23b1aea46b7d960b0b3d826ed77a66b43bf8fc4ded53b	-Nu_Ko-ES26xY6UFJlSP	\N	2024-04-03 19:02:22	2024-04-03 21:46:52	1	0	0	0	1	0	\N	\N	1		2024-04-04	0	0	0	\N	0	\N	0	aabc	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			4	2	0	\N	2		inactive
36	asad	asadnazir289@gmail.com	971	3552885552	1	$2y$10$xg/HpUsv6W06pgEiMFB7FO5GBtS0KJTlzOnoFgCLaKqlbgFs6K6D.	2024-04-04 08:11:38	1	\N	\N	\N	1111		ANDROID	18ca91166d2aa441f83feab7f35c8e4659c34160c857a100e9cd558a22d9cc9a	-Nuc9SXbJt3UPcol9d1B	\N	2024-04-04 08:11:38	2024-04-14 14:30:19	1	0	0	0	1	0	\N	\N	1	1111	2024-04-09	0	0	0	\N	0	\N	0	Asad Nazir	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			1	2	2	2024-05-09 15:14:18	1	\N	active
30	hahaah	user14@gmail.com	+971	040484848484	1	$2y$10$duhL0FtMvkcXlk/EL6xcfOn.witknhMe2dLUQrLeJtvH/713r3Mfi	2024-04-03 20:46:14	1	\N	\N	\N		\N	\N	b6d7dcf582f6d184bde6b54b7444be5d43a1bc70c40eeeac61405319009ea3f7	-Nu_h_bSQ5C2dkxqJHJZ	\N	2024-04-03 20:46:14	2024-04-03 20:46:15	1	0	0	0	1	0	\N	\N	1		2024-04-04	0	0	0	\N	0	\N	0	abc	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			4	2	0	\N	1		inactive
25	\N	aamir1111111@gmail.com	\N	0	0	$2y$10$4orUUve.G5251mYmIp9p6eEVrrmCckvYegLz0Kd4OWPZ/8cJJKHhG	2024-04-03 16:45:18	0	\N	\N	\N	\N	1111	postman	fd49c1d546578ad8dd59916dfd06def378a21e1e87c5ba031d6e602c8c8d41fc	-NuZqRQ2VhETaOBTepp6	\N	2024-04-03 16:45:18	2024-04-03 16:45:19	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	social 11	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
22	krishna	aamir1111111@gmail.com	971	7034522599	1	$2y$10$IwQfPZexo54XNBIJ/j9PkeylBtPm21cyyLmxn5sL.vPwkPIUqgqwa	2024-04-03 00:24:10	1	\N	\N	\N	1111	1111	postman	f6bafbc1eaab3d3bb2fdea9b677b1497fe08d99de3e02abd1d26d9150f43d303	-NuWKsGwwRUL01TIRA5z	\N	2024-04-03 00:24:10	2024-04-03 00:25:38	1	0	0	0	1	0	\N	\N	1	1111	1994-04-16	0	0	0	\N	0	\N	0	social 11	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			1	2	0	\N	1	\N	\N
32	\N	aamir122111@gmail.com	\N	0	0	$2y$10$RFnwsVNljStH4py/k5Voe.Yaqy3eESGhRIu0kXnZjPTvVkHuR2IKi	2024-04-03 21:00:24	0	\N	\N	\N	\N	1111	postman	f1fa26cdbf9c3ba7e7674b2ecdf7449b1b3928d402d819cbd28d88a08f9d6e16	-Nu_kp3CAuB1juAIznBJ	\N	2024-04-03 21:00:24	2024-04-03 21:00:24	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	social 11	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
10	Ahmad	ahmad@gmail.com	971	123659854	1	$2y$10$ajlox2cguPiTeCPuijh4IOlUAhF/wY0UgA9WUN/DGH2JCh5TiNdu2	2024-03-28 06:25:44	1	\N	\N	\N		fMkOeJSHTiSwUlmkZWqPh9:APA91bEnLVlIoBBtXHTyTShJ3rBqGYN601NFLebhW2yriwNhDnU7m-y6IDVjPLPqHOA7bshRIm49JUjAQYobT1Xoi8bO1An-xxdN7o8lW1blk43kQgK9by4ySF5_r3TK-eutMlGKcN_k	\N	764c87ab8b347f0440de3d343ed670cb56bf27c60e1f8ac6592a358ba1646c09	-Nu2j52vr9p6zWDGSO8A	\N	2024-03-28 06:25:44	2024-04-16 14:20:49	1	0	0	0	1	0	\N	\N	1		1995-06-10	0	0	0	\N	0	\N	0	test 12345	1	\N	0	f8d35b5072feaab5dab481ac574c7e61fa75523c1cb27c929c312332301a2ff4	2024-04-03 16:03:55	1111	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	2	1	2025-04-03 16:34:56	1		active
29	nssh	user13@gmail.com	+971	461610131311	1	$2y$10$iZmxMJMi0GlYKufmGctmculGkfy8oyZvpyjNUArPP.xg/EXHpeGaK	2024-04-03 20:40:53	1	\N	\N	\N		\N	\N	59a89a9ed021ba41866a433ada7112bc48528be2727a327b7176d333ff89f5bc	-Nu_gMBDhGlHl-YmavpD	\N	2024-04-03 20:40:53	2024-04-03 20:40:53	1	0	0	0	1	0	\N	\N	1		2024-04-04	0	0	0	\N	0	\N	0	anv	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			4	2	0	\N	1		inactive
31	bas	user15@gmail.com	+971	0184844848	1	$2y$10$XOXBdjW8cJ0sc5bFhvcnm.DjoKA/eBscsHpB4MpYR7G71x/pW0d4.	2024-04-03 20:53:42	1	\N	\N	\N		\N	\N	956e20eddeef5828a7efcaf8da5d3de5e0ab2f1259f9e443ad2db7a49b74edbe	-Nu_jHz9saujvQd37ayt	\N	2024-04-03 20:53:42	2024-04-04 20:19:52	1	0	0	0	1	0	\N	\N	1		2024-04-04	0	0	0	\N	0	\N	0	user	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			4	2	1	2025-04-04 20:19:52	1		active
33	\N	aamir11111111@gmail.com	\N	0	0	$2y$10$Llio8ppHhatwrcuRT3TX0.jp2ysIYEXixK9VXmHaB9nDaqfY7B/2K	2024-04-03 21:04:24	0	\N	\N	\N	\N	1111	postman	bdd8af5bcb9e81166acff9f5923f905e8be493d7dc5831c6a88539db29624e84	-Nu_lj_x-qTr3s-Ro919	\N	2024-04-03 21:04:24	2024-04-03 21:04:24	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	social 11	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
34	\N	aamir11111111@gmail.com	\N	0	0	$2y$10$4aiF0fHmf/snebw5lIA.1.IP8WSQb6qvkqdDOvrcObDq8GFnnsBJS	2024-04-03 21:04:31	0	\N	\N	\N	\N	1111	postman	2754cd5a9eb7a8622586ad581285f21660822f88b2ace34bcccaf117fb670bc4	-Nu_llOk1mWTpxhJDQl6	\N	2024-04-03 21:04:31	2024-04-03 21:04:31	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	social 11	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
26	krishna	aamir11111111@gmail.com	971	703452250699	1	$2y$10$9p2egAyen8UWvBM/650XqORFFzFIDNZtaImhhRPKcZ3FfrWL61eiy	2024-04-03 16:45:27	1	\N	\N	\N	1111	1111	postman	adcbe90f271ed2353e30c9713ef6a138fc4589c43011f523fb0c17b83f528839	-NuZqT_td1Okn9DwA4UF	\N	2024-04-03 16:45:27	2024-04-14 14:28:27	1	0	0	0	1	0	\N	\N	1	1111	1994-04-16	0	0	0	\N	0	\N	0	social 11	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			1	2	0	\N	1	\N	inactive
24	Ahmad1	test9@hotmail.com	971	7034526210098	1	$2y$10$/1v7Mp1frHIoB1CTWkwfpu12bSgABwO4tvrUAqZXRNpslpiSPyD16	2024-04-03 16:43:41	2	\N	\N	\N		1111	\N	33157f2d46fa53d66ddbf45a9f5f046ca6367fb9b9c85b92f588f9c9f443cea3	-NuZq3f0DT0GaGT49QyV	\N	2024-04-03 16:43:41	2024-04-09 23:03:27	1	0	0	0	1	0	\N	\N	1		1995-06-10	0	0	0	\N	0	\N	0	ranadxba	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			1	2	1	2025-04-09 23:01:46	2		active
27	krishna	aamir122111@gmail.com	971	7034522549	1	$2y$10$BkmLKX1NYJr0AYsHHawQnecmiGG8BN7FgTKQhz57OrL7YsCmApiOq	2024-04-03 18:08:22	1	\N	\N	\N	1111	1111	postman	ba3758f0bcf8b0599a3defd95b37c79bdc00c4f3bee2ec95d70952c7228e76c6	-Nu_8S2RI8d-etJGtH69	\N	2024-04-03 18:08:22	2024-04-04 09:58:31	1	0	0	0	1	0	\N	\N	1	1111	1994-04-16	0	0	0	\N	0	\N	0	social 11	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			1	2	0	\N	1	\N	inactive
37	\N	eshaalahmad33a@gmail.com	\N	0	0	$2y$10$N2bkmd.Hd5.8GQJ0JO7fJ.h30rrudyKkJjI42zVidDL.dGNKi7rbS	2024-04-04 08:15:10	0	\N	\N	\N	\N	eGCeM308TSuuT5kYepaFmq:APA91bF0uapSZhj6uszme5QTYi0V4hV6O5o2vK3Od1w-Na9DasDVkHmA_ryuQoeLCkoB_r0y-cadeg0-lsHFYjFwzPnV54fuLx8yEDMDIfgM4Ryd95H-N3oG2-c_coaPrlGR75Sz3LJi	ANDROID	2f2511342a828da6ca6b63cb0d69e9075234b5130cb5996906e188bbf523cd5d	-NucAGTq4EktKmBXbS9B	\N	2024-04-04 08:15:10	2024-04-04 08:15:11	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	Eshaal Ahmad	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
41	\N	asadnazir289@gmail.com	\N	0	0	$2y$10$x5bPbhfA67YoBSu036jbB.V6wAhrKA/gSetiTY3W9PMR7HL2F9/FO	2024-04-04 09:34:43	0	\N	\N	\N	\N	eGCeM308TSuuT5kYepaFmq:APA91bF0uapSZhj6uszme5QTYi0V4hV6O5o2vK3Od1w-Na9DasDVkHmA_ryuQoeLCkoB_r0y-cadeg0-lsHFYjFwzPnV54fuLx8yEDMDIfgM4Ryd95H-N3oG2-c_coaPrlGR75Sz3LJi	ANDROID	4a2e706dd1c33b0042e54d965e1e2b9cc6040a2997dfcd4618a4ecff9aa6d783	-NucSTkKEsqaGBbk9JHY	\N	2024-04-04 09:34:43	2024-04-04 09:34:44	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	Asad Nazir	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
38	\N	asadnazir289@gmail.com	\N	0	0	$2y$10$M2CEQ6aCfR7WpnPxhrFsyeOGLr4QULyOior/uJYQgbPxioNFk6/a.	2024-04-04 09:14:41	0	\N	\N	\N	\N	eGCeM308TSuuT5kYepaFmq:APA91bF0uapSZhj6uszme5QTYi0V4hV6O5o2vK3Od1w-Na9DasDVkHmA_ryuQoeLCkoB_r0y-cadeg0-lsHFYjFwzPnV54fuLx8yEDMDIfgM4Ryd95H-N3oG2-c_coaPrlGR75Sz3LJi	ANDROID	9bf36303fb0d6620d32d3d1aa701f2608aed22f1f488337aa02da2225e37b096	-NucNtBVb86Vqu3I-jfQ	\N	2024-04-04 09:14:41	2024-04-04 09:14:41	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	Asad Nazir	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
39	\N	asadnazir289@gmail.com	\N	0	0	$2y$10$oCqWaNcW3haO7QDE3rZjSOJ53Fn6a/g6BOaLk53frjbbPoWTYtSke	2024-04-04 09:20:06	0	\N	\N	\N	\N	eGCeM308TSuuT5kYepaFmq:APA91bF0uapSZhj6uszme5QTYi0V4hV6O5o2vK3Od1w-Na9DasDVkHmA_ryuQoeLCkoB_r0y-cadeg0-lsHFYjFwzPnV54fuLx8yEDMDIfgM4Ryd95H-N3oG2-c_coaPrlGR75Sz3LJi	ANDROID	6e3c768111b4b834feeec06285d30dc46dccbad418c9c26a9129e75434d6a280	-NucP7fpGRh6ni6nZY6d	\N	2024-04-04 09:20:06	2024-04-04 09:20:07	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	Asad Nazir	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
45	Asad Nazir	asadnazir289@gmail.com	971	455856696666	1	$2y$10$pG5/.mSQykAk6tc4tpRtE.R1d3plniKEY5K/XTh06lQSpr1f0r2h6	2024-04-04 10:15:10	1	\N	\N	\N	1111		ANDROID	787a0eae058abda1360393711f451d7c0bce26477b01c177540028326301513d	-Nucaj51zKNjRohZ3LEr	\N	2024-04-04 10:15:10	2024-04-04 10:17:28	1	0	0	0	1	0	\N	\N	1	1111	2006-04-14	0	0	0	\N	0	\N	0	Asad Nazir	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			3	2	0	\N	1	\N	inactive
40	Asad Nazir	asadnazir289@gmail.com	971	225225552222	0	$2y$10$GQhJgkpD5AMck6T5ysFgVeNVMl/Xwum6VrpVoIKzfjRVt5BWPUcLy	2024-04-04 09:23:49	1	\N	\N	\N	1111	eGCeM308TSuuT5kYepaFmq:APA91bF0uapSZhj6uszme5QTYi0V4hV6O5o2vK3Od1w-Na9DasDVkHmA_ryuQoeLCkoB_r0y-cadeg0-lsHFYjFwzPnV54fuLx8yEDMDIfgM4Ryd95H-N3oG2-c_coaPrlGR75Sz3LJi	ANDROID	55960aa52be18b72a2365d69a41af3b8dc9d2dcf8ab3b75c472be7beaed91d6c	-NucPz0G6k7h7feauBld	\N	2024-04-04 09:23:49	2024-04-04 09:24:04	1	0	0	0	1	0	\N	\N	1	1111	2024-04-02	0	0	0	\N	0	\N	0	Asad Nazir	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			1	2	0	\N	1	\N	inactive
42	Asad Nazir	asadnazir289@gmail.com	971	558852885	0	$2y$10$/65fVoAr3qrxDMBsuHGyeeEMth1h0VdTabTyStCvb9gJUzolO8LR.	2024-04-04 10:09:38	2	\N	\N	\N	1111	eGCeM308TSuuT5kYepaFmq:APA91bF0uapSZhj6uszme5QTYi0V4hV6O5o2vK3Od1w-Na9DasDVkHmA_ryuQoeLCkoB_r0y-cadeg0-lsHFYjFwzPnV54fuLx8yEDMDIfgM4Ryd95H-N3oG2-c_coaPrlGR75Sz3LJi	ANDROID	98241f2bb3a19433287f2b5a076ace75beebb18e8eb37a7423c38223dfeb902c	-Nuc_TCllzvJojUrx2H6	\N	2024-04-04 10:09:38	2024-04-04 10:10:17	1	0	0	0	1	0	\N	\N	1	1111	2019-04-19	0	0	0	\N	0	\N	0	Asad Nazir	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			1	2	0	\N	2	\N	inactive
44	Asad Nazir	asadnazir289@gmail.com	971	6558850888	0	$2y$10$jbEK8w0WcAIl9lw9DbZY6OPZyEhQRdt0.eh9Cr5eq2085gXOtC/Em	2024-04-04 10:13:34	1	\N	\N	\N	1111	eGCeM308TSuuT5kYepaFmq:APA91bF0uapSZhj6uszme5QTYi0V4hV6O5o2vK3Od1w-Na9DasDVkHmA_ryuQoeLCkoB_r0y-cadeg0-lsHFYjFwzPnV54fuLx8yEDMDIfgM4Ryd95H-N3oG2-c_coaPrlGR75Sz3LJi	ANDROID	6940aebc9024d6b409a79030cb5d299a654345ef52412c7fa86114ab06f9b9d8	-NucaMfuaLCijpBVBAY6	\N	2024-04-04 10:13:34	2024-04-04 10:13:52	1	0	0	0	1	0	\N	\N	1	1111	1993-04-23	0	0	0	\N	0	\N	0	Asad Nazir	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			1	2	0	\N	1	\N	inactive
43	\N	asadnazir289@gmail.com	\N	0	0	$2y$10$.uSiroiMYMlcLNGXbPR54.jLP0XvX6SkC0Rii/bGnsMO9d4i4rKjO	2024-04-04 10:12:22	0	\N	\N	\N	\N	eGCeM308TSuuT5kYepaFmq:APA91bF0uapSZhj6uszme5QTYi0V4hV6O5o2vK3Od1w-Na9DasDVkHmA_ryuQoeLCkoB_r0y-cadeg0-lsHFYjFwzPnV54fuLx8yEDMDIfgM4Ryd95H-N3oG2-c_coaPrlGR75Sz3LJi	ANDROID	a9d271e167d0a24a2c80bd5b0d5619f056dfdc0df0f8a7e03e40a76e75cba823	-Nuca57EJhrhTwT6L5xb	\N	2024-04-04 10:12:22	2024-04-04 10:12:22	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	Asad Nazir	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
46	\N	asadnazir289@gmail.com	\N	0	0	$2y$10$cswdEgvAl/pm0Zpz3.IR.upkk.ivjPYz2JMidUQt5HwT3v.ssfZ42	2024-04-04 10:17:37	0	\N	\N	\N	\N	eGCeM308TSuuT5kYepaFmq:APA91bF0uapSZhj6uszme5QTYi0V4hV6O5o2vK3Od1w-Na9DasDVkHmA_ryuQoeLCkoB_r0y-cadeg0-lsHFYjFwzPnV54fuLx8yEDMDIfgM4Ryd95H-N3oG2-c_coaPrlGR75Sz3LJi	ANDROID	624b384dee2c3da6b1565e02a24cb5cac33758fff2465bd48e46be2a713deefb	-NucbI3fmNlik_z6RADy	\N	2024-04-04 10:17:37	2024-04-04 10:17:37	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	Asad Nazir	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
47	\N	asadnazir289@gmail.com	\N	0	0	$2y$10$PMHTV9GxyacvwrZ/JCOm1.s17P/kYLqe41cNsGextOTkjaRVYTmwa	2024-04-04 10:20:01	0	\N	\N	\N	\N	eGCeM308TSuuT5kYepaFmq:APA91bF0uapSZhj6uszme5QTYi0V4hV6O5o2vK3Od1w-Na9DasDVkHmA_ryuQoeLCkoB_r0y-cadeg0-lsHFYjFwzPnV54fuLx8yEDMDIfgM4Ryd95H-N3oG2-c_coaPrlGR75Sz3LJi	ANDROID	77dd34fae8d25990195607089328699fbba18e3bbba9849aa9b7a5fa79a85d08	-NucbqJjXhmCgtYe4M_Z	\N	2024-04-04 10:20:01	2024-04-04 10:20:02	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	Asad Nazir	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
48	assd	asadnazir289@gmail.com	971	3445522335	1	$2y$10$JyMQsUvCTNnkb5aFXtZ2XuDtDLqgxCMSMjggU1qg4XTFq6Ihw/CDK	2024-04-04 10:20:27	1	\N	\N	\N	1111		ANDROID	6da88299eb079dc9a782bdcc1de186f0e0a04b06ed4a7f2d5f76659500063b7b	-NucbwXWusw5adXhmjQp	\N	2024-04-04 10:20:27	2024-04-04 10:21:26	1	0	0	0	1	0	\N	\N	1	1111	2020-04-04	0	0	0	\N	0	\N	0	Asad Nazir	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			2	2	0	\N	1	\N	inactive
49	\N	asadnazir289@gmail.com	\N	0	0	$2y$10$Fll5BTnU89cvmLzrrk8V4OYMsL8J9UqkrZnNUDgqsZCn6HW2z7PBy	2024-04-04 10:21:34	0	\N	\N	\N	\N	eGCeM308TSuuT5kYepaFmq:APA91bF0uapSZhj6uszme5QTYi0V4hV6O5o2vK3Od1w-Na9DasDVkHmA_ryuQoeLCkoB_r0y-cadeg0-lsHFYjFwzPnV54fuLx8yEDMDIfgM4Ryd95H-N3oG2-c_coaPrlGR75Sz3LJi	ANDROID	3fc5b69c6a71d755a4abfda46622e3cdaac61d8ea89cd4c24468cebc8642ada5	-NuccC2vtZQb10d0gVR0	\N	2024-04-04 10:21:34	2024-04-04 10:21:35	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	Asad Nazir	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
50	\N	aamir122111@gmail.com	\N	0	0	$2y$10$5FUGL7HHrXdbVVwRPuwL/ejgRUB69/9wPGZMpnIcuCEtNNc2.Q0TS	2024-04-04 10:24:36	0	\N	\N	\N	\N	1111	postman	d8e9e75ff9301ec2751f0bb455cf5a7f02ad248cdc44b304a1a61454ea04ca8d	-NucctQq8_M3eg7ZJLda	\N	2024-04-04 10:24:36	2024-04-04 10:24:37	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	social 11	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
58	\N	hybridtservicesapp@gmail.com	\N	0	0	$2y$10$GOAC3BMzWClDDhjv36tgm.xAVB9VQ14f4XKjHrPw6I8EylenvQ0l6	2024-04-05 01:37:03	0	\N	\N	\N	\N	fN9PjvVSQPOCFV9CoOYkYF:APA91bGqqkgZgInUh7MVOxE3xPeFq6XUGd40YnDXJtcgbYzXffY4ezyNxo7t8VaIreicPcmC0QQ1CoOhOEbh1nlSygarXDZyV9VghFp2tORNZXtXaUcqzNP3PYZkuEja5PznPBzLxV0i	ANDROID	a0d3ea8ed20926b8c2d7ba3d75d574c682018900ef30d834b719ccdb6d6059ca	-NuftjROsDhQQpG4QQRD	\N	2024-04-05 01:37:03	2024-04-05 01:37:04	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	Hybrid ITServies	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
51	\N	aamir122111@gmail.com	\N	0	0	$2y$10$NDeRr9y3hKMBcJdtjG4NRu2/c6gf4xEszqsw2U4nkP01xG2.h6qR2	2024-04-04 12:21:25	0	\N	\N	\N	\N	1111	postman	2b6e381a4d88f44c1e905f42e7efe7889c678443da4e2258f7d720f5074cea30	-Nud2cSIOYdA5yRlrR4C	\N	2024-04-04 12:21:25	2024-04-04 12:21:25	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	social 11	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
55	\N	asadnazir289@gmail.com	\N	0	0	$2y$10$wC2OWDWPdwS/IS5bVHcbFua8NnCD6R0jLUGaZTDdsidIqcud2KO9G	2024-04-04 23:38:34	0	\N	\N	\N	\N	c-aFsq9UQNSgA07F8Em78d:APA91bEyVwokqyjNftwwjbUO3nFnU72w5RR4fMH51OHD7IF_wtU7HZ38kHYKrr5eZ2aCYTE-x2YPPwL-Zsn4EUm2tGFdpolOGVPfETGNVZ_oQpuTh0WiWzEiXlmXiBo-y4wuOgO4JOy0	ANDROID	15966e0587e621101cb988f050d07abc1aa8fdf8724a145d1b09f51cfbaf1161	-NufTbckywr0V-Ag0El0	\N	2024-04-04 23:38:34	2024-04-04 23:38:34	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	Asad Nazir	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
56	\N	aamir11111111@gmail.com	\N	0	0	$2y$10$PIMWsMqgUG/TM1ayn7qf9.ik7eMInu5fMANRimp5xWWKCdppUSwhW	2024-04-04 23:53:21	0	\N	\N	\N	\N	1111	postman	8bf196bb753a0b9da08a5ceb04c2765dc667c6db84c163a3bdfb9b53827ee489	-NufX-O70rBIu0-GV6Yd	\N	2024-04-04 23:53:21	2024-04-04 23:53:22	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	social 11	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
35	Asad Nazir	asadnazir289@gmail.com	971	03445588226	1	$2y$10$.BwyDyk/JkYzm7ZQaRJ8refSmUk23TOkVZ2jtXER93ZQVsTw28Fnq	2024-04-04 00:29:49	1	\N	\N	\N	1111	eGCeM308TSuuT5kYepaFmq:APA91bF0uapSZhj6uszme5QTYi0V4hV6O5o2vK3Od1w-Na9DasDVkHmA_ryuQoeLCkoB_r0y-cadeg0-lsHFYjFwzPnV54fuLx8yEDMDIfgM4Ryd95H-N3oG2-c_coaPrlGR75Sz3LJi	ANDROID	d24d808cef77c20923040a02b9914622c5c978ac040672a753837824f25a9945	-NuaVko-M5GPD2mqHSQH	\N	2024-04-04 00:29:49	2024-04-05 00:18:30	1	0	0	0	1	0	\N	\N	1	1111	1942-04-16	0	0	0	\N	0	\N	0	Asad Nazir	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			1	2	0	\N	1	\N	inactive
54	\N	aamir122111@gmail.com	\N	0	0	$2y$10$uez0jC80AUC.RN1u6tia1egd8jlmFugNx/C6bTOLf0DBmiU76jJES	2024-04-04 20:25:44	0	\N	\N	\N	\N	1111	postman	05545d13391b99277fb3d90ba6a19d719ab1892101bb772419f6dcb467824791	-NuemU43ehP3ZxwUcTpp	\N	2024-04-04 20:25:44	2024-04-04 20:25:45	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	social 11	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
52	Nas	nas@gmail.com	971	9499499466	1	$2y$10$wTcQ36X7o0PE5V2ydRrpuu74ufcQIzteW9yfntttggMdUaNECKU5m	2024-04-04 18:07:31	1	\N	\N	\N			\N	a6f697a063d3fc889c0590c06ee71050e3e4207da58a75ee9388afda0913c0b9	-NueHqNMrctPcYou-e_T	\N	2024-04-04 18:07:31	2024-04-05 01:32:44	1	0	0	0	1	0	\N	\N	1		2024-04-04	0	0	0	\N	0	\N	0	ali	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			1	2	0	\N	1		inactive
53	kh	nasrullah@gmail.com	+971	32324243132	1	$2y$10$Pqu7LWUCykEnsqMwU7483uq2Jf/CNWjnlRMDX6WCY3JRcLqwMK2mu	2024-04-04 18:09:48	1	\N	\N	1712280002660f51c2a6858.jpg		abdhjef ekef kjwf wedfw	\N	b13e6f76b4098eae6ccdb58ade2e67b3e35207786f6c24563040b6708d8f3ce2	-NueIMoC8uFhStEECwC7	\N	2024-04-04 18:09:48	2024-04-15 16:24:43	1	0	0	0	1	0	\N	\N	1		2024-04-04	0	0	0	\N	0	\N	0	nasrullah khan	1	\N	0	fa362cd149d31fec5c98d6cd9dc89cbd89e83d06f76199f2ae4e1274b734b4ef	2024-04-08 19:08:42	1111	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			1	2	0	\N	1		inactive
57	\N	aamir111111111@gmail.com	\N	0	0	$2y$10$YzwgzwJCp.1S/Lz1KeFpDudLgMzMlcwGkOaIMdsGBKm98O6CSgQQ2	2024-04-05 00:01:59	0	\N	\N	\N	\N	1111	postman	25bb3a6fd8d5ff238d0e08d2841d958693fe53a092f0fa6fdf9bbcbac003b25c	-NufYyi8N9TX_GjlMucc	\N	2024-04-05 00:01:59	2024-04-14 14:25:45	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	social 11	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
63	N Biswas F	nbf1@mailinator.com	971	932474269	1	$2y$10$6ZG8JRUkf6mR9sdYbzM1MOlLpSDnnXyltedxmt1pdX7y3smjvmBD.	2024-04-08 04:43:18	3	\N	\N	1712569273_WhatsApp Image 2024-04-08 at 15.10.51.jpeg			\N	9e8a4d294060d441db7ee6352610b1b326646b60bac940d8bb5b4a08dde2e783	-Nuw07nzDb4l_lb6YnwC	\N	2024-04-08 04:43:18	2024-04-08 09:41:13	1	0	0	0	1	0	\N	\N	1		1995-04-23	0	0	0	\N	0	\N	0	NemaiF1	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	2	2	2024-05-08 04:43:51	3		active
60	\N	anil@dxbusinessgroup.com	\N	0	0	$2y$10$wQQN2O4UYyxQZ5InaxW2IeHEW8opPKG0Gvn68y4/ZMGbDpMCUIoYS	2024-04-08 02:02:13	0	\N	\N	\N	\N	abdhjef ekef kjwf wedfw	iOS	79d1d574ae629f80fe321533eb4c89419b79166a6d3fcd034ad2283846620c65	-NuvRGOb0qfwGq2dwAJV	\N	2024-04-08 02:02:13	2024-04-08 02:03:15	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	ANIL NAVIS	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
62	N Biswasf	nbu1@mailinator.com	971	932572366	1	$2y$10$5fex596T.wz25VY7XB/WOO4MKy2fhmYl9L.ubub8dp5xndfxlHdm2	2024-04-08 04:11:33	1	\N	\N	\N			\N	7a5d2779a533b06f07980978718bdc4c8212520aa4fcb31b31ffd17e819d997f	-Nuvtrh9UDJ6AezYhdll	\N	2024-04-08 04:11:33	2024-04-15 11:44:08	3	0	0	0	1	0	\N	\N	1		1995-04-15	0	0	0	\N	0	\N	0	NemaiU1	1	\N	0		2024-04-08 05:19:09	0	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			2	2	2	2024-05-08 04:33:11	1		active
59	nasrullah	nasrulahpitafi1@gmail.com	+971	3131321332	1	$2y$10$IF5yS.Fjmduo.zrECax6ouH7VijvRa9l8/RuRthrZsPIOgWf6cdpm	2024-04-05 14:36:57	1	\N	\N	\N	1111		iOS	25158e443ae0c5b25bb692f8ba3363314459169c41f8f1d28763e75840edbe4b	-NuigEaBgviDlUfhNbIU	\N	2024-04-05 14:36:57	2024-04-08 11:09:20	1	0	0	0	1	0	\N	\N	1	1111	2024-04-08	0	0	0	\N	0	\N	0	Nasrullah Khan	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			2	2	1	2025-04-08 10:41:21	1	\N	active
61	bbb	anilnavis@gmail.com	+971	5434384622	1	$2y$10$YkXj5RxlOmx2Fj1GzymVN.i/BBbXXia225tIvKs2AfGPEqtYTjZRu	2024-04-08 02:08:03	1	\N	\N	\N			\N	5f9e1282b06d831c0da39f8104c9bc600c1259d7cc078f270a9bcec8bc420232	-NuvSagZIknNKW-zXjr4	\N	2024-04-08 02:08:03	2024-04-10 12:10:30	1	0	0	0	1	0	\N	\N	1		2024-04-08	0	0	0	\N	0	\N	0	anill	1	\N	0		2024-04-10 11:53:02	0	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			2	2	1	2025-04-08 02:08:42	1		active
71	sooraj	soorajsabu117@gmail.com	971	268874998	1	$2y$10$Eae8gdEN86dylrgptAPHGua.DTrLRU366JtoDqRSz0BmUObrNrHqO	2024-04-12 06:01:32	1	\N	\N	\N	1111	eT3heg8dTCCY1jFf50xLg9:APA91bH3XctK13Ar8Bbo8liVgrmh0U93VoXDWUk4iUmHCPlEaEKMo5PhOw_9-48s3GqbKcVJFeausbIlB148RsEcBqfzTpVzz4Kmy8doZxwhxzaWy3FNMcMIJc0w9ZUQTyMXvcXyCHi-	ANDROID	4d48b29467d9551db10b26a6493bc6de9bdac4d1a721525a358d5e0c32d52536	-NvFtOtKhloK4h7UKGEj	\N	2024-04-12 06:01:32	2024-04-12 06:02:26	1	0	0	0	1	0	\N	\N	1	1111	2024-04-01	0	0	0	\N	0	\N	0	sooraj sabu	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			4	2	2	2024-05-12 06:02:26	1	\N	active
75	Ahmad	testdxba@gmaip.com	91	96325874852	1	$2y$10$4IFHYQKXBLi8eSL3Ub4DYeDGil8CIeqkkypXLzYp3B24a1kWnfqB2	2024-04-16 00:33:59	1	\N	\N	\N			\N	a381f611fc1cf0baac612ce23461bdede73867c3092f2f877806ad92a081ac08	-NvZJmibTpuUi2zRwlnE	\N	2024-04-16 00:33:59	2024-04-16 10:30:08	3	0	0	0	1	0	\N	\N	1		2023-08-07	0	0	0	\N	0	\N	0	ahmad dxba	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			2	2	1	2025-04-16 00:34:42	1		active
76	Hamid	razahamid34@gmail.com	91	3441562554	1	$2y$10$CJEBKfGwGhjmWTH2cywa.eoOVjtH5IeOsoi5DDBsWbCOpFXBa3AKS	2024-04-16 09:52:32	1	\N	\N	\N	1111	fdDqkzdzQIK5elvW30qk1L:APA91bEX42FTWZA32AUFsMcYHpKikX4rrqv3jFhuANzntdriGGpFhlGXIesm18BZpcqJHDVj3Vhy3WUiS8BO8Zt7EP_G8QZjH5erHpBkRtRbNEvW_C25N1WD9gUu3Zv2LFgxABoI-EhB	ANDROID	083b1c08023fd7286df61b1989c77c39a49f6f0c37837aa24017b770654ed57f	-NvaJcnEsrwuSvhCkKsJ	\N	2024-04-16 09:52:32	2024-04-16 09:53:56	3	0	0	0	1	0	\N	\N	1	1111	2024-04-08	0	0	0	\N	0	\N	0	Hamid Raza Goraya	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			2	2	1	2025-04-16 09:53:56	1	\N	active
70	anilnavis	anil@anil.com	971	466464049	1	$2y$10$ShgoZ.A7JRhIz3zDFSK5..9FiAQNExrYNhvS37zJYBNbq/MJoeTMu	2024-04-10 12:13:36	1	\N	\N	1713014525_download.png		\N	\N	0124d7b18850fbbf7f0a72355a3bc16aa9b8a8509f637ec5ba73dcafaa0a8b26	-Nv6vNfA8-Znu3AT2_gV	\N	2024-04-10 12:13:36	2024-04-13 13:22:05	1	0	0	0	1	0	\N	\N	1		1971-04-10	0	0	0	\N	0	\N	0	anilnavis	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	2	2	2024-05-10 12:15:00	1		active
65	\N	nasreenbibi798@gmail.com	\N	0	0	$2y$10$fuGPwQClkROtEtjaGQzcJOdOB2/X1YqoMOmiMWjF5ieFWaJhy7Q/.	2024-04-08 08:50:51	0	\N	\N	\N	\N	dHfdikRmSeqa2qlWJln7e9:APA91bGcnppNp1kIwEKMeZIQlA8JrdzYdEvW03-z9rryuAPeycL8Tq8njcoNp-JtdCOFjiBtXqfP2q0s54TJSrhYHQVAK7PRZ5zErjEY6fIktpNXuU2AfH4gsjAZXIyn-mzmAyExq1Yr	ANDROID	bfa8571302cf1eeeebc357505a08879c77ab2701e6a8a77227c9a39fa6356f68	-Nuwtn1yt_48beHOqp6H	\N	2024-04-08 08:50:51	2024-04-08 08:50:51	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	Nasreen Bibi	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
68	N Biswas	nbu2@mailinator.com	971	933174266	1	$2y$10$w0ZjqkGXYSUcN70f.hgKVedyVy0ZWNZAU0PZ6ffbbNhhwjZH8v.am	2024-04-09 05:57:42	1	\N	\N	\N			\N	a1420c22aed40a4eadd6b3f8996d87fa0a15c87efa43b3e386ef40a997c1d5a1	-Nv0QkSnyBZ3LzC2vfyr	\N	2024-04-09 05:57:42	2024-04-09 11:51:20	1	0	0	0	1	0	\N	\N	1		1997-04-26	0	0	0	\N	0	\N	0	NemaiU2	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			2	2	2	2024-05-09 05:59:07	1		active
66	nasrullah	nasrulahpitafi@gmail.com	+971	454581011	1	$2y$10$a9LHsknp6u8Y1kfEqo5HcOCDO59exDFlaypciPB9RwO8.CCiqsyF.	2024-04-08 10:32:56	2	\N	\N	\N	1111		iOS	25434786432b8764225bca3b85ffb90a9b09bb6b3fc5f33551970c7ff6544ce3	-NuxG9WrfAlflj22-EH7	\N	2024-04-08 10:32:56	2024-04-08 11:12:46	1	0	0	0	1	0	\N	\N	1	1111	2024-04-08	0	0	0	\N	0	\N	0	Nasrullah khan	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			2	2	2	2024-05-08 11:10:40	2	\N	active
67	\N	hp7289gzgs@privaterelay.appleid.com	\N	0	0	$2y$10$VUsB1hDNkYc4ZAXbbQ077urw3ZSzBctNYnMm2b9r.SG1ORJiaUUhG	2024-04-08 13:12:18	0	\N	\N	\N	\N	abdhjef ekef kjwf wedfw	iOS	8a67e03737f96601a7ab14b1ca15f184451ee89b87f54360e7d1feb66a7c1965	-NuxpctZB4ZpW8qKVG3I	\N	2024-04-08 13:12:18	2024-04-08 13:12:18	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	Nasrullah Khan	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
72	krishna	aamir1111111111@gmail.com	971	703452250690	1	$2y$10$YTImOWCSbI/aimPebLsHC.cWI3zUBHPABPAHrUPNej1hJftonoWJK	2024-04-14 14:28:04	1	\N	\N	\N	1111	1111	postman	5efb7488b616cfa4311456f22c49a2f973e0832465b0ebb0bd23839364527204	-NvS-WHqMpx7FWfW76tI	\N	2024-04-14 14:28:04	2024-04-14 14:29:37	1	0	0	0	1	0	\N	\N	1	1111	1994-04-16	0	0	0	\N	0	\N	0	social 11	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			1	2	0	\N	1	\N	inactive
69	NemaiU	nemai.biswas56@gmail.com	971	963248666	1	$2y$10$biiMHHkYc2nl91a8AknQhu4P9FjFLtTq48NJX441OoylAExvprEK2	2024-04-09 11:51:30	1	\N	\N	\N	1111		ANDROID	26ceab11aa2f5ff50e104ed771b5d893b461b8a8755d2fdf49759860add124c3	-Nv1gj7eA41qU8Nc6zHy	\N	2024-04-09 11:51:30	2024-04-15 11:05:46	1	0	0	0	1	0	\N	\N	1	1111	1999-04-25	0	0	0	\N	0	\N	0	N Biswas	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			3	2	2	2024-05-09 11:53:08	1	\N	active
73	N Biswas	nbf3@mailinator.com	91	6325752696	1	$2y$10$sYta2E.9m6W5onIBJeda/.rLmjw/AB9J60QO46QcliMGrdaDFBQ1y	2024-04-15 11:08:39	3	\N	\N	\N			\N	5414a4697e8aaf962ef994851b3860fc4151d809aad8df2ad6af5146736912e4	-NvWRSyK1uAY750WLOlt	\N	2024-04-15 11:08:39	2024-04-15 11:10:04	3	0	0	0	1	0	\N	\N	1		1999-04-15	0	0	0	\N	0	\N	0	NemaiF3	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			3	2	1	2025-04-15 11:09:17	3		active
74	Asad	abcd@gmail.com	91	3445588552	1	$2y$10$MIdjE35K8zNH/gSyHwsK6OhpIG8bqtW99ks5TgYiUOxCXI.rdpAAe	2024-04-15 22:28:18	2	\N	\N	\N		\N	\N	fadb7a39a357f4e78d042658587ed5ea7cee75a08c18715ff059057d8a681a18	-NvYs0nL9WsVUJQ_Tezn	\N	2024-04-15 22:28:18	2024-04-15 22:35:18	3	0	0	0	1	0	\N	\N	1		1998-04-10	0	0	0	\N	0	\N	0	Asad	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			1	2	1	2025-04-15 22:35:18	2		active
64	N Biswas U	nemai@dxbusinessgroup.com	971	9324472699	1	$2y$10$9ji3A2dkNNKpUPOPYU3q5ujZzjRxwAFZjxpnsbEVaVudWJ/zGC9Dy	2024-04-08 04:50:07	1	\N	\N	\N	1111		ANDROID	e7400c398ded66467c96827f8f944d1776118779eb97178d4a6152f4fec0211f	-Nuw1gcRsM_Y33DGX-eE	\N	2024-04-08 04:50:07	2024-04-15 11:44:38	1	0	0	0	1	0	\N	\N	1	1111	1997-04-18	0	0	0	\N	0	\N	0	Nemai Biswas II Software Tester	1	\N	0	4c052799abd53a3e5caa66a583d177c1601018dd095a1c8d9223b52d86a0cc53	2024-04-08 04:56:28	1111	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			3	2	2	2024-05-08 04:52:31	1	\N	active
77	\N	vaibhavdxba@gmail.com	\N	0	0	$2y$10$nNKAwC86D.1nbBchTbI1VupIYT7RxzXsN6Sti76wnEj8l4XJQSos6	2024-04-17 03:57:00	0	\N	\N	\N	\N	ciJLg53MT8e99MZJ-Z0J0p:APA91bFn_BqwornOs1UEBZBtNh9-ReRMaA-ejVGyXa4uREdm3nrOK8YnmlRnCUBnYG_e_oJGzyJZD51_mYSeno_VRUa7oiv425X_EHXuc45jNtDZP5244r7Pf63CAJwnQA7oLTzeZHxl	ANDROID	365280a24d01812bcc3a4ea8851377d56f73c27c8e76273cba52c19b3ef17198	-NveBqQbwpPOMdKTr-jW	\N	2024-04-17 03:57:00	2024-04-17 03:57:01	0	0	0	0	1	0	\N	\N	1	\N	\N	0	0	0	\N	0	\N	0	Vaibhav DXB	1	\N	0	\N	\N	\N	999999	1	0	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	0	0	\N	0			\N	1	0	\N	0	\N	\N
\.


--
-- Data for Name: users_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_role (id, role_name, created_at, updated_at) FROM stdin;
1	admin	2024-03-25 19:54:33	2024-03-25 19:54:33
2	users	2024-03-25 19:54:33	2024-03-25 19:54:33
3	vendors	2024-03-25 19:54:33	2024-03-25 19:54:33
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

SELECT pg_catalog.setval('public.account_type_id_seq', 1, true);


--
-- Name: activity_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_type_id_seq', 1, false);


--
-- Name: admin_designation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_designation_id_seq', 1, false);


--
-- Name: amenities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.amenities_id_seq', 6, true);


--
-- Name: amount_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.amount_type_id_seq', 2, true);


--
-- Name: app_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_banners_id_seq', 5, true);


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

SELECT pg_catalog.setval('public.articles_id_seq', 5, true);


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

SELECT pg_catalog.setval('public.booking_id_seq', 87, true);


--
-- Name: booking_seats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_seats_id_seq', 119, true);


--
-- Name: booking_time_slots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_time_slots_id_seq', 86, true);


--
-- Name: brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_id_seq', 1, false);


--
-- Name: breeds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.breeds_id_seq', 1, false);


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
-- Name: coach_activity_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coach_activity_prices_id_seq', 1, false);


--
-- Name: coach_booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coach_booking_id_seq', 1, false);


--
-- Name: coach_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coach_locations_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.country_id_seq', 3, true);


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
-- Name: event_amenity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_amenity_id_seq', 16, true);


--
-- Name: event_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_images_id_seq', 5, true);


--
-- Name: events_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_categories_id_seq', 1, true);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 4, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faq_id_seq', 1, true);


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
-- Name: game_minus_points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.game_minus_points_id_seq', 18, true);


--
-- Name: game_plus_points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.game_plus_points_id_seq', 26, true);


--
-- Name: games_amenities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.games_amenities_id_seq', 141, true);


--
-- Name: games_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.games_categories_id_seq', 1, false);


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.games_id_seq', 20, true);


--
-- Name: games_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.games_images_id_seq', 48, true);


--
-- Name: games_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.games_rules_id_seq', 61, true);


--
-- Name: games_time_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.games_time_id_seq', 308, true);


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

SELECT pg_catalog.setval('public.help_id_seq', 2, true);


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
-- Name: instruction_manual_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instruction_manual_id_seq', 14, true);


--
-- Name: insurance_providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insurance_providers_id_seq', 1, false);


--
-- Name: manual_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.manual_categories_id_seq', 1, false);


--
-- Name: manual_downloads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.manual_downloads_id_seq', 9, true);


--
-- Name: membership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.membership_id_seq', 2, true);


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

SELECT pg_catalog.setval('public.migrations_id_seq', 400, true);


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

SELECT pg_catalog.setval('public.notifications_id_seq', 10, true);


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

SELECT pg_catalog.setval('public.payment_init_id_seq', 186, true);


--
-- Name: payment_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_report_id_seq', 1, false);


--
-- Name: payment_temp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_temp_id_seq', 60, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 270, true);


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
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ratings_id_seq', 1, false);


--
-- Name: review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.review_id_seq', 1, false);


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
-- Name: shangai_bonus_points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shangai_bonus_points_id_seq', 2, true);


--
-- Name: shangai_buys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shangai_buys_id_seq', 2, true);


--
-- Name: shangai_hands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shangai_hands_id_seq', 2, true);


--
-- Name: shangai_round_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shangai_round_id_seq', 4, true);


--
-- Name: skill_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skill_level_id_seq', 4, true);


--
-- Name: skin_colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skin_colors_id_seq', 1, false);


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
-- Name: table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.table_id_seq', 1, false);


--
-- Name: temp_booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_booking_id_seq', 116, true);


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

SELECT pg_catalog.setval('public.temp_users_id_seq', 29, true);


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
-- Name: user_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_settings_id_seq', 1, true);


--
-- Name: user_vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_vehicle_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 77, true);


--
-- Name: users_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_role_id_seq', 3, true);


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
-- Name: amenities amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amenities
    ADD CONSTRAINT amenities_pkey PRIMARY KEY (id);


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
-- Name: booking_seats booking_seats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_seats
    ADD CONSTRAINT booking_seats_pkey PRIMARY KEY (id);


--
-- Name: booking_time_slots booking_time_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_time_slots
    ADD CONSTRAINT booking_time_slots_pkey PRIMARY KEY (id);


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
-- Name: coach_activity_prices coach_activity_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coach_activity_prices
    ADD CONSTRAINT coach_activity_prices_pkey PRIMARY KEY (id);


--
-- Name: coach_booking coach_booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coach_booking
    ADD CONSTRAINT coach_booking_pkey PRIMARY KEY (id);


--
-- Name: coach_locations coach_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coach_locations
    ADD CONSTRAINT coach_locations_pkey PRIMARY KEY (id);


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
-- Name: event_amenity event_amenity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_amenity
    ADD CONSTRAINT event_amenity_pkey PRIMARY KEY (id);


--
-- Name: event_images event_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_images
    ADD CONSTRAINT event_images_pkey PRIMARY KEY (id);


--
-- Name: events_categories events_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events_categories
    ADD CONSTRAINT events_categories_pkey PRIMARY KEY (id);


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
-- Name: game_minus_points game_minus_points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_minus_points
    ADD CONSTRAINT game_minus_points_pkey PRIMARY KEY (id);


--
-- Name: game_plus_points game_plus_points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_plus_points
    ADD CONSTRAINT game_plus_points_pkey PRIMARY KEY (id);


--
-- Name: games_amenities games_amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games_amenities
    ADD CONSTRAINT games_amenities_pkey PRIMARY KEY (id);


--
-- Name: games_categories games_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games_categories
    ADD CONSTRAINT games_categories_pkey PRIMARY KEY (id);


--
-- Name: games_images games_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games_images
    ADD CONSTRAINT games_images_pkey PRIMARY KEY (id);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: games_rules games_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games_rules
    ADD CONSTRAINT games_rules_pkey PRIMARY KEY (id);


--
-- Name: games_time games_time_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games_time
    ADD CONSTRAINT games_time_pkey PRIMARY KEY (id);


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
-- Name: instruction_manual instruction_manual_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instruction_manual
    ADD CONSTRAINT instruction_manual_pkey PRIMARY KEY (id);


--
-- Name: insurance_providers insurance_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurance_providers
    ADD CONSTRAINT insurance_providers_pkey PRIMARY KEY (id);


--
-- Name: manual_categories manual_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manual_categories
    ADD CONSTRAINT manual_categories_pkey PRIMARY KEY (id);


--
-- Name: manual_downloads manual_downloads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manual_downloads
    ADD CONSTRAINT manual_downloads_pkey PRIMARY KEY (id);


--
-- Name: membership membership_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membership
    ADD CONSTRAINT membership_pkey PRIMARY KEY (id);


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
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- Name: review review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pkey PRIMARY KEY (id);


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
-- Name: shangai_bonus_points shangai_bonus_points_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shangai_bonus_points
    ADD CONSTRAINT shangai_bonus_points_name_unique UNIQUE (name);


--
-- Name: shangai_bonus_points shangai_bonus_points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shangai_bonus_points
    ADD CONSTRAINT shangai_bonus_points_pkey PRIMARY KEY (id);


--
-- Name: shangai_buys shangai_buys_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shangai_buys
    ADD CONSTRAINT shangai_buys_name_unique UNIQUE (name);


--
-- Name: shangai_buys shangai_buys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shangai_buys
    ADD CONSTRAINT shangai_buys_pkey PRIMARY KEY (id);


--
-- Name: shangai_hands shangai_hands_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shangai_hands
    ADD CONSTRAINT shangai_hands_name_unique UNIQUE (name);


--
-- Name: shangai_hands shangai_hands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shangai_hands
    ADD CONSTRAINT shangai_hands_pkey PRIMARY KEY (id);


--
-- Name: shangai_round shangai_round_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shangai_round
    ADD CONSTRAINT shangai_round_pkey PRIMARY KEY (id);


--
-- Name: skill_level skill_level_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill_level
    ADD CONSTRAINT skill_level_pkey PRIMARY KEY (id);


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
-- Name: table table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."table"
    ADD CONSTRAINT table_pkey PRIMARY KEY (id);


--
-- Name: temp_booking temp_booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_booking
    ADD CONSTRAINT temp_booking_pkey PRIMARY KEY (id);


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
-- Name: user_settings user_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_pkey PRIMARY KEY (id);


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
-- Name: game_minus_points game_minus_points_game_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_minus_points
    ADD CONSTRAINT game_minus_points_game_id_foreign FOREIGN KEY (game_id) REFERENCES public.games(id) ON DELETE CASCADE;


--
-- Name: game_minus_points game_minus_points_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_minus_points
    ADD CONSTRAINT game_minus_points_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: game_plus_points game_plus_points_game_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_plus_points
    ADD CONSTRAINT game_plus_points_game_id_foreign FOREIGN KEY (game_id) REFERENCES public.games(id) ON DELETE CASCADE;


--
-- Name: game_plus_points game_plus_points_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_plus_points
    ADD CONSTRAINT game_plus_points_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


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
-- Name: manual_categories manual_categories_game_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manual_categories
    ADD CONSTRAINT manual_categories_game_id_foreign FOREIGN KEY (game_id) REFERENCES public.games(id);


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

