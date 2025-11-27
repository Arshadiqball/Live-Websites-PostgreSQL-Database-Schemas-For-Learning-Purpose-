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
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: aboutus_page_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aboutus_page_settings (
    id bigint NOT NULL,
    meta_key character varying(255) NOT NULL,
    meta_value text NOT NULL,
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
-- Name: account_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_types (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.account_types OWNER TO postgres;

--
-- Name: blacklists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blacklists (
    id bigint NOT NULL,
    user_id integer,
    user_device_id character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.blacklists OWNER TO postgres;

--
-- Name: blacklists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blacklists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blacklists_id_seq OWNER TO postgres;

--
-- Name: blacklists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blacklists_id_seq OWNED BY public.blacklists.id;


--
-- Name: booking_additional_charges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_additional_charges (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    charges_name character varying(255) NOT NULL,
    charges_amount double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.booking_additional_charges OWNER TO postgres;

--
-- Name: booking_additional_charges_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_additional_charges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_additional_charges_id_seq OWNER TO postgres;

--
-- Name: booking_additional_charges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_additional_charges_id_seq OWNED BY public.booking_additional_charges.id;


--
-- Name: booking_home_relocations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_home_relocations (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    category_id integer NOT NULL,
    move_out_date date NOT NULL,
    move_in_date date NOT NULL,
    country_from character varying(255),
    country_to character varying(255),
    city_from character varying(255),
    city_to character varying(255),
    area_from character varying(255),
    area_to character varying(255),
    building_from_name character varying(255),
    building_to_name character varying(255),
    address_from character varying(255),
    address_to character varying(255),
    latitude_from character varying(255),
    latitude_to character varying(255),
    longitude_from character varying(255),
    longitude_to character varying(255),
    property_from_type character varying(255),
    property_to_type character varying(255),
    no_of_bedrooms_from character varying(255),
    no_of_bedrooms_to character varying(255),
    details_of_items_to_be_excluded text,
    handyman_services_to_dismantle character varying(255),
    handyman_services_to_assemble character varying(255),
    include_insurance character varying(255),
    extra_details_from text,
    extra_details_to text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    building_from_no character varying(255),
    building_to_no character varying(255)
);


ALTER TABLE public.booking_home_relocations OWNER TO postgres;

--
-- Name: booking_home_relocations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_home_relocations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_home_relocations_id_seq OWNER TO postgres;

--
-- Name: booking_home_relocations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_home_relocations_id_seq OWNED BY public.booking_home_relocations.id;


--
-- Name: booking_office_relocations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_office_relocations (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    category_id integer NOT NULL,
    move_out_date date NOT NULL,
    move_in_date date NOT NULL,
    country_from character varying(255),
    country_to character varying(255),
    city_from character varying(255),
    city_to character varying(255),
    area_from character varying(255),
    area_to character varying(255),
    building_from_name character varying(255),
    building_to_name character varying(255),
    building_from_no character varying(255),
    building_to_no character varying(255),
    address_from character varying(255),
    address_to character varying(255),
    latitude_from character varying(255),
    latitude_to character varying(255),
    longitude_from character varying(255),
    longitude_to character varying(255),
    details_of_items_to_be_excluded text,
    handyman_services_to_dismantle character varying(255),
    handyman_services_to_assemble character varying(255),
    include_insurance character varying(255),
    extra_details_from text,
    extra_details_to text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.booking_office_relocations OWNER TO postgres;

--
-- Name: booking_office_relocations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_office_relocations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_office_relocations_id_seq OWNER TO postgres;

--
-- Name: booking_office_relocations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_office_relocations_id_seq OWNED BY public.booking_office_relocations.id;


--
-- Name: booking_pictures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_pictures (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    picture character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.booking_pictures OWNER TO postgres;

--
-- Name: booking_pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_pictures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_pictures_id_seq OWNER TO postgres;

--
-- Name: booking_pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_pictures_id_seq OWNED BY public.booking_pictures.id;


--
-- Name: booking_qoutes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_qoutes (
    id bigint NOT NULL,
    booking_id bigint NOT NULL,
    company_id bigint NOT NULL,
    price double precision NOT NULL,
    hours integer NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    comission_amount double precision DEFAULT '0'::double precision NOT NULL,
    is_admin_approved character varying(255) DEFAULT 'no'::character varying NOT NULL,
    CONSTRAINT booking_qoutes_is_admin_approved_check CHECK (((is_admin_approved)::text = ANY (ARRAY[('no'::character varying)::text, ('yes'::character varying)::text]))),
    CONSTRAINT booking_qoutes_status_check CHECK (((status)::text = ANY (ARRAY[('pending'::character varying)::text, ('qouted'::character varying)::text, ('accepted'::character varying)::text, ('rejected'::character varying)::text])))
);


ALTER TABLE public.booking_qoutes OWNER TO postgres;

--
-- Name: booking_qoutes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_qoutes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_qoutes_id_seq OWNER TO postgres;

--
-- Name: booking_qoutes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_qoutes_id_seq OWNED BY public.booking_qoutes.id;


--
-- Name: booking_reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_reviews (
    id bigint NOT NULL,
    booking_id bigint,
    company_id bigint,
    customer_id bigint,
    rate integer NOT NULL,
    comment text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    updated_by integer,
    CONSTRAINT booking_reviews_status_check CHECK (((status)::text = ANY (ARRAY[('pending'::character varying)::text, ('approve'::character varying)::text, ('disapprove'::character varying)::text])))
);


ALTER TABLE public.booking_reviews OWNER TO postgres;

--
-- Name: booking_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_reviews_id_seq OWNER TO postgres;

--
-- Name: booking_reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_reviews_id_seq OWNED BY public.booking_reviews.id;


--
-- Name: booking_status_trackings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_status_trackings (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    status_tracking character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT booking_status_trackings_status_tracking_check CHECK (((status_tracking)::text = ANY (ARRAY[('customer_requested'::character varying)::text, ('company_qouted'::character varying)::text, ('customer_accepted'::character varying)::text, ('cancelled'::character varying)::text, ('item_collected'::character varying)::text, ('on_the_way'::character varying)::text, ('delivered'::character varying)::text])))
);


ALTER TABLE public.booking_status_trackings OWNER TO postgres;

--
-- Name: booking_status_trackings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_status_trackings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_status_trackings_id_seq OWNER TO postgres;

--
-- Name: booking_status_trackings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_status_trackings_id_seq OWNED BY public.booking_status_trackings.id;


--
-- Name: booking_storage_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_storage_services (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    category_id integer NOT NULL,
    pickup_date date NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    country character varying(255),
    city character varying(255),
    area character varying(255),
    building_name character varying(255),
    building_no character varying(255),
    address character varying(255),
    latitude character varying(255),
    longitude character varying(255),
    items_to_be_collected character varying(255),
    include_insurance character varying(255),
    extra_details text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.booking_storage_services OWNER TO postgres;

--
-- Name: booking_storage_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_storage_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_storage_services_id_seq OWNER TO postgres;

--
-- Name: booking_storage_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_storage_services_id_seq OWNED BY public.booking_storage_services.id;


--
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    sender_id bigint NOT NULL,
    admin_response character varying(255) NOT NULL,
    qouted_amount double precision,
    comission_amount double precision,
    customer_signature integer,
    delivery_note text,
    company_id bigint,
    status character varying(255) DEFAULT 'customer_requested'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    awb_number character varying(255),
    booking_number character varying(255),
    is_paid character varying(255) DEFAULT 'no'::character varying NOT NULL,
    total_amount integer,
    CONSTRAINT bookings_admin_response_check CHECK (((admin_response)::text = ANY (ARRAY[('pending'::character varying)::text, ('approved'::character varying)::text, ('rejected'::character varying)::text]))),
    CONSTRAINT bookings_is_paid_check CHECK (((is_paid)::text = ANY (ARRAY[('no'::character varying)::text, ('yes'::character varying)::text]))),
    CONSTRAINT bookings_status_check CHECK (((status)::text = ANY (ARRAY[('customer_requested'::character varying)::text, ('company_qouted'::character varying)::text, ('customer_accepted'::character varying)::text, ('cancelled'::character varying)::text, ('item_collected'::character varying)::text, ('on_the_way'::character varying)::text, ('delivered'::character varying)::text])))
);


ALTER TABLE public.bookings OWNER TO postgres;

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
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bookings_id_seq OWNED BY public.bookings.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    description text,
    image character varying(255),
    CONSTRAINT categories_status_check CHECK (((status)::text = ANY (ARRAY[('active'::character varying)::text, ('inactive'::character varying)::text])))
);


ALTER TABLE public.categories OWNER TO postgres;

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
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    id bigint NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    name character varying(255),
    logo character varying(255),
    company_license character varying(255),
    account_type integer DEFAULT 1 NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    user_id integer,
    banner character varying(255),
    about_us text,
    is_approved character varying(255) DEFAULT 'pending'::character varying NOT NULL,
    admin_share double precision DEFAULT '0'::double precision NOT NULL,
    company_share double precision DEFAULT '0'::double precision NOT NULL,
    CONSTRAINT companies_is_approved_check CHECK (((is_approved)::text = ANY (ARRAY[('pending'::character varying)::text, ('approved'::character varying)::text, ('rejected'::character varying)::text]))),
    CONSTRAINT companies_status_check CHECK (((status)::text = ANY (ARRAY[('active'::character varying)::text, ('inactive'::character varying)::text])))
);


ALTER TABLE public.companies OWNER TO postgres;

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
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: company_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_categories (
    id bigint NOT NULL,
    company_id integer NOT NULL,
    category_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.company_categories OWNER TO postgres;

--
-- Name: company_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_categories_id_seq OWNER TO postgres;

--
-- Name: company_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_categories_id_seq OWNED BY public.company_categories.id;


--
-- Name: contact_page_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_page_settings (
    id bigint NOT NULL,
    meta_key character varying(255) NOT NULL,
    meta_value text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.contact_page_settings OWNER TO postgres;

--
-- Name: contact_page_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_page_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_page_settings_id_seq OWNER TO postgres;

--
-- Name: contact_page_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_page_settings_id_seq OWNED BY public.contact_page_settings.id;


--
-- Name: contact_us_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_us_requests (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    subject character varying(255),
    message text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.contact_us_requests OWNER TO postgres;

--
-- Name: contact_us_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_us_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_us_requests_id_seq OWNER TO postgres;

--
-- Name: contact_us_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_us_requests_id_seq OWNED BY public.contact_us_requests.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    country_id integer NOT NULL,
    country_name character varying(128) NOT NULL,
    dial_code character varying(16) NOT NULL,
    iso_code character varying(16) NOT NULL,
    lang_code character varying(4) NOT NULL,
    country_status integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: countries_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_country_id_seq OWNER TO postgres;

--
-- Name: countries_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_country_id_seq OWNED BY public.countries.country_id;


--
-- Name: country_languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country_languages (
    country_lang_id integer NOT NULL,
    lang_code character varying(4) NOT NULL,
    country_id_fk integer NOT NULL,
    country_localized_name character varying(128) NOT NULL
);


ALTER TABLE public.country_languages OWNER TO postgres;

--
-- Name: country_languages_country_lang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_languages_country_lang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_languages_country_lang_id_seq OWNER TO postgres;

--
-- Name: country_languages_country_lang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_languages_country_lang_id_seq OWNED BY public.country_languages.country_lang_id;


--
-- Name: deligate_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deligate_attributes (
    id bigint NOT NULL,
    deligate_id bigint NOT NULL,
    details text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    name character varying(255)
);


ALTER TABLE public.deligate_attributes OWNER TO postgres;

--
-- Name: deligate_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deligate_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deligate_attributes_id_seq OWNER TO postgres;

--
-- Name: deligate_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deligate_attributes_id_seq OWNED BY public.deligate_attributes.id;


--
-- Name: deligates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deligates (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    slug character varying(255),
    CONSTRAINT deligates_status_check CHECK (((status)::text = ANY (ARRAY[('active'::character varying)::text, ('inactive'::character varying)::text])))
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
-- Name: driver_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.driver_details (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    driving_license character varying(255) NOT NULL,
    mulkia character varying(255) NOT NULL,
    mulkia_number character varying(255) NOT NULL,
    is_company character varying(255) DEFAULT 'no'::character varying NOT NULL,
    company_id bigint NOT NULL,
    truck_type_id bigint NOT NULL,
    total_rides integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    address character varying(255),
    latitude character varying(255),
    longitude character varying(255),
    emirates_id_or_passport character varying(255),
    driving_license_number character varying(255),
    driving_license_expiry date,
    driving_license_issued_by character varying(255),
    vehicle_plate_number character varying(255),
    vehicle_plate_place character varying(255),
    CONSTRAINT driver_details_is_company_check CHECK (((is_company)::text = ANY (ARRAY[('yes'::character varying)::text, ('no'::character varying)::text])))
);


ALTER TABLE public.driver_details OWNER TO postgres;

--
-- Name: driver_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.driver_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.driver_details_id_seq OWNER TO postgres;

--
-- Name: driver_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.driver_details_id_seq OWNED BY public.driver_details.id;


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
-- Name: join_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.join_requests (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    company_name character varying(255) NOT NULL,
    contact_number character varying(255) NOT NULL,
    company_description text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.join_requests OWNER TO postgres;

--
-- Name: join_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.join_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.join_requests_id_seq OWNER TO postgres;

--
-- Name: join_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.join_requests_id_seq OWNED BY public.join_requests.id;


--
-- Name: joinus_page_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.joinus_page_settings (
    id bigint NOT NULL,
    meta_key character varying(255) NOT NULL,
    meta_value text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.joinus_page_settings OWNER TO postgres;

--
-- Name: joinus_page_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.joinus_page_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.joinus_page_settings_id_seq OWNER TO postgres;

--
-- Name: joinus_page_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.joinus_page_settings_id_seq OWNED BY public.joinus_page_settings.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
    language_id integer NOT NULL,
    language_name character varying(255) NOT NULL,
    lang_code character varying(4) DEFAULT 'en'::character varying NOT NULL,
    language_status integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.languages OWNER TO postgres;

--
-- Name: languages_language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.languages_language_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_language_id_seq OWNER TO postgres;

--
-- Name: languages_language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.languages_language_id_seq OWNED BY public.languages.language_id;


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
-- Name: new_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.new_notifications (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    description text NOT NULL,
    generated_by bigint,
    generated_to bigint,
    is_read character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    title character varying(255),
    image character varying(255),
    status character varying(255),
    CONSTRAINT new_notifications_is_read_check CHECK (((is_read)::text = ANY (ARRAY[('yes'::character varying)::text, ('no'::character varying)::text]))),
    CONSTRAINT new_notifications_status_check CHECK (((status)::text = ANY (ARRAY[('active'::character varying)::text, ('inactive'::character varying)::text])))
);


ALTER TABLE public.new_notifications OWNER TO postgres;

--
-- Name: new_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.new_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.new_notifications_id_seq OWNER TO postgres;

--
-- Name: new_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.new_notifications_id_seq OWNED BY public.new_notifications.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    type character varying(255) NOT NULL,
    content character varying(255) NOT NULL,
    generated_by bigint NOT NULL,
    generated_to bigint NOT NULL,
    is_read character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT notifications_is_read_check CHECK (((is_read)::text = ANY (ARRAY[('yes'::character varying)::text, ('no'::character varying)::text])))
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
-- Name: pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pages (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    slug character varying(255),
    description text,
    meta_title text,
    meta_keyword text,
    meta_description text,
    lang_code character varying(255) DEFAULT 'en'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.pages OWNER TO postgres;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO postgres;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


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
-- Name: role_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_permissions (
    permission_id integer NOT NULL,
    user_role_id_fk integer NOT NULL,
    module_key character varying(255) NOT NULL,
    permissions text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.role_permissions OWNER TO postgres;

--
-- Name: role_permissions_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_permissions_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_permissions_permission_id_seq OWNER TO postgres;

--
-- Name: role_permissions_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_permissions_permission_id_seq OWNED BY public.role_permissions.permission_id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    role character varying(255) NOT NULL,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    is_admin_role integer DEFAULT 0 NOT NULL,
    CONSTRAINT roles_status_check CHECK (((status)::text = ANY (ARRAY[('active'::character varying)::text, ('inactive'::character varying)::text])))
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    id bigint NOT NULL,
    service_charge double precision DEFAULT '0'::double precision NOT NULL,
    tax_percentage double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
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
-- Name: shipping_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_methods (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT shipping_methods_status_check CHECK (((status)::text = ANY (ARRAY[('active'::character varying)::text, ('inactive'::character varying)::text])))
);


ALTER TABLE public.shipping_methods OWNER TO postgres;

--
-- Name: shipping_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipping_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_methods_id_seq OWNER TO postgres;

--
-- Name: shipping_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipping_methods_id_seq OWNED BY public.shipping_methods.id;


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
    trade_license text,
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
-- Name: truck_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.truck_types (
    id bigint NOT NULL,
    truck_type character varying(255) NOT NULL,
    dimensions character varying(255) NOT NULL,
    icon character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    max_weight_in_tons character varying(255),
    CONSTRAINT truck_types_status_check CHECK (((status)::text = ANY (ARRAY[('active'::character varying)::text, ('inactive'::character varying)::text])))
);


ALTER TABLE public.truck_types OWNER TO postgres;

--
-- Name: truck_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.truck_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.truck_types_id_seq OWNER TO postgres;

--
-- Name: truck_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.truck_types_id_seq OWNED BY public.truck_types.id;


--
-- Name: user_password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_password_resets (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    is_valid character varying(255) DEFAULT '0'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT user_password_resets_is_valid_check CHECK (((is_valid)::text = ANY (ARRAY[('1'::character varying)::text, ('0'::character varying)::text])))
);


ALTER TABLE public.user_password_resets OWNER TO postgres;

--
-- Name: user_password_resets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_password_resets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_password_resets_id_seq OWNER TO postgres;

--
-- Name: user_password_resets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_password_resets_id_seq OWNED BY public.user_password_resets.id;


--
-- Name: user_wallet_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_wallet_transactions (
    id bigint NOT NULL,
    user_wallet_id bigint NOT NULL,
    amount integer NOT NULL,
    type character varying(255) NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT user_wallet_transactions_type_check CHECK (((type)::text = ANY (ARRAY[('credit'::character varying)::text, ('debit'::character varying)::text])))
);


ALTER TABLE public.user_wallet_transactions OWNER TO postgres;

--
-- Name: user_wallet_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_wallet_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_wallet_transactions_id_seq OWNER TO postgres;

--
-- Name: user_wallet_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_wallet_transactions_id_seq OWNED BY public.user_wallet_transactions.id;


--
-- Name: user_wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_wallets (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    amount integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_wallets OWNER TO postgres;

--
-- Name: user_wallets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_wallets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_wallets_id_seq OWNER TO postgres;

--
-- Name: user_wallets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_wallets_id_seq OWNED BY public.user_wallets.id;


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
    password character varying(255),
    email_verified_at timestamp(0) without time zone,
    role_id bigint NOT NULL,
    user_phone_otp character varying(255),
    user_device_token character varying(255),
    user_device_type character varying(255),
    user_access_token character varying(255),
    firebase_user_key character varying(255),
    status character varying(255) DEFAULT 'inactive'::character varying NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    provider_id character varying(255),
    avatar character varying(255),
    address text,
    profile_image character varying(255),
    is_admin_access integer DEFAULT 0 NOT NULL,
    latitude character varying(255),
    longitude character varying(255),
    country character varying(255),
    city character varying(255),
    zip_code character varying(255),
    address_2 character varying(255),
    user_device_id character varying(255),
    is_social character varying(255) DEFAULT '0'::character varying,
    email_verified character varying(255),
    user_email_otp character varying(255),
    trade_license text,
    deleted character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    active character varying(255),
    CONSTRAINT users_status_check CHECK (((status)::text = ANY (ARRAY[('active'::character varying)::text, ('inactive'::character varying)::text])))
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
-- Name: webbanners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.webbanners (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(255),
    status smallint DEFAULT '1'::smallint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.webbanners OWNER TO postgres;

--
-- Name: webbanners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.webbanners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.webbanners_id_seq OWNER TO postgres;

--
-- Name: webbanners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.webbanners_id_seq OWNED BY public.webbanners.id;


--
-- Name: aboutus_page_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aboutus_page_settings ALTER COLUMN id SET DEFAULT nextval('public.aboutus_page_settings_id_seq'::regclass);


--
-- Name: blacklists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blacklists ALTER COLUMN id SET DEFAULT nextval('public.blacklists_id_seq'::regclass);


--
-- Name: booking_additional_charges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_additional_charges ALTER COLUMN id SET DEFAULT nextval('public.booking_additional_charges_id_seq'::regclass);


--
-- Name: booking_home_relocations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_home_relocations ALTER COLUMN id SET DEFAULT nextval('public.booking_home_relocations_id_seq'::regclass);


--
-- Name: booking_office_relocations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_office_relocations ALTER COLUMN id SET DEFAULT nextval('public.booking_office_relocations_id_seq'::regclass);


--
-- Name: booking_pictures id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_pictures ALTER COLUMN id SET DEFAULT nextval('public.booking_pictures_id_seq'::regclass);


--
-- Name: booking_qoutes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_qoutes ALTER COLUMN id SET DEFAULT nextval('public.booking_qoutes_id_seq'::regclass);


--
-- Name: booking_reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_reviews ALTER COLUMN id SET DEFAULT nextval('public.booking_reviews_id_seq'::regclass);


--
-- Name: booking_status_trackings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_status_trackings ALTER COLUMN id SET DEFAULT nextval('public.booking_status_trackings_id_seq'::regclass);


--
-- Name: booking_storage_services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_storage_services ALTER COLUMN id SET DEFAULT nextval('public.booking_storage_services_id_seq'::regclass);


--
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: company_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_categories ALTER COLUMN id SET DEFAULT nextval('public.company_categories_id_seq'::regclass);


--
-- Name: contact_page_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_page_settings ALTER COLUMN id SET DEFAULT nextval('public.contact_page_settings_id_seq'::regclass);


--
-- Name: contact_us_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us_requests ALTER COLUMN id SET DEFAULT nextval('public.contact_us_requests_id_seq'::regclass);


--
-- Name: countries country_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN country_id SET DEFAULT nextval('public.countries_country_id_seq'::regclass);


--
-- Name: country_languages country_lang_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country_languages ALTER COLUMN country_lang_id SET DEFAULT nextval('public.country_languages_country_lang_id_seq'::regclass);


--
-- Name: deligate_attributes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deligate_attributes ALTER COLUMN id SET DEFAULT nextval('public.deligate_attributes_id_seq'::regclass);


--
-- Name: deligates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deligates ALTER COLUMN id SET DEFAULT nextval('public.deligates_id_seq'::regclass);


--
-- Name: driver_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_details ALTER COLUMN id SET DEFAULT nextval('public.driver_details_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: join_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.join_requests ALTER COLUMN id SET DEFAULT nextval('public.join_requests_id_seq'::regclass);


--
-- Name: joinus_page_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.joinus_page_settings ALTER COLUMN id SET DEFAULT nextval('public.joinus_page_settings_id_seq'::regclass);


--
-- Name: languages language_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages ALTER COLUMN language_id SET DEFAULT nextval('public.languages_language_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: new_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_notifications ALTER COLUMN id SET DEFAULT nextval('public.new_notifications_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: role_permissions permission_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions ALTER COLUMN permission_id SET DEFAULT nextval('public.role_permissions_permission_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: shipping_methods id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_methods ALTER COLUMN id SET DEFAULT nextval('public.shipping_methods_id_seq'::regclass);


--
-- Name: temp_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users ALTER COLUMN id SET DEFAULT nextval('public.temp_users_id_seq'::regclass);


--
-- Name: truck_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.truck_types ALTER COLUMN id SET DEFAULT nextval('public.truck_types_id_seq'::regclass);


--
-- Name: user_password_resets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_password_resets ALTER COLUMN id SET DEFAULT nextval('public.user_password_resets_id_seq'::regclass);


--
-- Name: user_wallet_transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_wallet_transactions ALTER COLUMN id SET DEFAULT nextval('public.user_wallet_transactions_id_seq'::regclass);


--
-- Name: user_wallets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_wallets ALTER COLUMN id SET DEFAULT nextval('public.user_wallets_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: webbanners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webbanners ALTER COLUMN id SET DEFAULT nextval('public.webbanners_id_seq'::regclass);


--
-- Data for Name: aboutus_page_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aboutus_page_settings (id, meta_key, meta_value, created_at, updated_at) FROM stdin;
1	about_us_title	Welcome To MOOVZY	2025-01-24 11:34:39	2025-01-24 11:34:39
3	about_us_phone	8006668999	2025-01-24 11:34:39	2025-01-24 11:34:39
4	about_us_email	info@moovzy.ae	2025-01-24 11:34:39	2025-01-24 11:34:39
5	about_us_description_1	<div class="mt-4 text">\r\n<p>At Moovzy, we understand the hassle that comes with trying to find the best deal when it comes to relocating your home/office, or even trying to find storage for your belongings.</p>\r\n<!-- <p>For that reason, Moovzy has tailored its services to offer its customers convenience and providing you with the best offers and movers based on your needs.</p> -->\r\n\r\n<p>Through the MOOVZY App, you can send a request with your relocation needs and moving companies will respond with quotations. You then can compare quotations and accept the quote according to your budget and preference, It&rsquo;s that simple.</p>\r\n</div>	2025-01-24 11:34:39	2025-01-24 11:34:39
6	about_us_description_2	<div class="clearfix mt-4 row"><!-- Column -->\r\n<div class="col-lg-6 col-md-6 col-sm-12 column">\r\n<ul>\r\n\t<li>One place for all your relocation needs</li>\r\n\t<li>Get free moving quotes from top movers in the UAE</li>\r\n</ul>\r\n</div>\r\n<!-- Column -->\r\n\r\n<div class="col-lg-6 col-md-6 col-sm-12 column">\r\n<ul>\r\n\t<li>A network of verified movers you can trust</li>\r\n\t<li>Compare multiple moving quotes</li>\r\n</ul>\r\n</div>\r\n</div>	2025-01-24 11:34:39	2025-01-24 11:34:39
7	about_us_description_3	<div class="clearfix mb-2 row"><!-- Column -->\r\n<div class="col-lg-6 col-md-6 col-sm-12 col-xl-4 column mb-4">\r\n<div class="text-center whyus-box">\r\n<div class="content-column-icon mb-3"><!-- <img src="assets/images/warehouse.png" alt=""> --></div>\r\n\r\n<h6>Select a Service</h6>\r\n\r\n<p>From the Moovzy applications, choose from a list of services that suites your needs</p>\r\n</div>\r\n</div>\r\n<!-- Column -->\r\n\r\n<div class="col-lg-6 col-md-6 col-sm-12 col-xl-4 column mb-4">\r\n<div class="text-center whyus-box">\r\n<div class="content-column-icon mb-3">&nbsp;</div>\r\n\r\n<h6>Provide Details</h6>\r\n\r\n<p>Provide us with all the details to support your relocation request</p>\r\n</div>\r\n</div>\r\n\r\n<div class="col-lg-6 col-md-6 col-sm-12 col-xl-4 column mb-4">\r\n<div class="text-center whyus-box">\r\n<div class="content-column-icon mb-3">&nbsp;</div>\r\n\r\n<h6>Start Receiving Offers</h6>\r\n\r\n<p>Sit back relax and start to receive free moving quotes</p>\r\n</div>\r\n</div>\r\n</div>	2025-01-24 11:34:39	2025-01-24 11:34:39
8	about_us_image	https://dxbitprojects.com/moovzy1/public/uploads/landing_page_images/1737704079_about-img.jpg	2025-01-24 11:34:39	2025-01-24 11:34:39
9	join_title	Apply to join our growing network of movers	2025-01-24 11:35:13	2025-01-24 11:35:13
10	join_form_title	Request to Join	2025-01-24 11:35:13	2025-01-24 11:35:13
11	join_form_description	<div class="fh-icon-box has-line icon-left style-2">\r\n<h4>Company profile</h4>\r\n\r\n<div class="desc">\r\n<p>Describe your services with your company profile.</p>\r\n</div>\r\n</div>\r\n\r\n<div class="fh-icon-box has-line icon-left style-2">\r\n<h4>Quality leads</h4>\r\n\r\n<div class="desc">\r\n<p>Get the best leads from customers across the UAE</p>\r\n</div>\r\n</div>\r\n\r\n<div class="fh-icon-box has-line icon-left style-2">\r\n<h4>Reviews</h4>\r\n\r\n<div class="desc">\r\n<p>Showcase your outstanding reviews from previous customers.</p>\r\n</div>\r\n</div>\r\n\r\n<div class="fh-icon-box icon-left style-2">\r\n<h4>Photo gallery</h4>\r\n\r\n<div class="desc">\r\n<p>Showcase pictures of your work for customers to see</p>\r\n</div>\r\n</div>	2025-01-24 11:35:13	2025-01-24 11:35:13
2	about_us_image_title	A reliable service that <br>  you can trust	2025-01-24 11:34:39	2025-01-25 07:27:19
\.


--
-- Data for Name: account_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_types (id, type, created_at, updated_at) FROM stdin;
0	Individual	\N	\N
1	Company	\N	\N
\.


--
-- Data for Name: blacklists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blacklists (id, user_id, user_device_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: booking_additional_charges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_additional_charges (id, booking_id, charges_name, charges_amount, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: booking_home_relocations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_home_relocations (id, booking_id, category_id, move_out_date, move_in_date, country_from, country_to, city_from, city_to, area_from, area_to, building_from_name, building_to_name, address_from, address_to, latitude_from, latitude_to, longitude_from, longitude_to, property_from_type, property_to_type, no_of_bedrooms_from, no_of_bedrooms_to, details_of_items_to_be_excluded, handyman_services_to_dismantle, handyman_services_to_assemble, include_insurance, extra_details_from, extra_details_to, created_at, updated_at, building_from_no, building_to_no) FROM stdin;
1	5	1	2023-05-29	2023-05-30	\N	\N	Dubai	Sharjah	Business Bay -Dubai,U.A.E	Business Bay -Dubai,U.A.E	Vision Tower	Avari Tower	Vision Tower,Business Bay -Dubai,U.A.E	Avari Tower,Business Bay -Dubai,U.A.E	25.228189	25.346254	55.348850	55.420933	Apartment	Apartment	3	4	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	Yes	Yes	No	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	2023-05-27 11:00:50	2023-05-27 11:00:50	B-128	T-279
2	8	1	2023-05-29	2023-05-30	\N	\N	Abu Dhabi	Ajman	102 O'Kon Island	Wyndham Garden	Ewan Tower	Al Khaleej Plaza	102 O'Kon Island Ewan Tower Abu Dhabi	Wyndham Garden Al Khaleej Plaza	24.453884	25.324480	54.377342	56.009892	Apartment	Banglow	3	5	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	Ye	No	Yes	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	2023-05-27 23:04:57	2023-05-27 23:04:57	WQ-12	B-121
4	2	2	2023-05-29	2023-05-30	United Arab Emirate	Oman	Sharjah	Muscat	102 O'Kon Island	Wyndham Garden	Ewan Tower	Al Khaleej Plaza	102 O'Kon Island Ewan Tower Sharjah	Wyndham Garden Al Khaleej Plaza	24.453884	23.585890	54.377342	58.405922	Apartment	Banglow	3	5	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	Ye	No	Yes	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	2023-05-27 23:04:57	2023-05-27 23:04:57	WQ-12	B-121
3	4	1	2023-05-29	2023-05-30	\N	\N	Abu Dhabi	Ajman	102 O'Kon Island	Wyndham Garden	Ewan Tower	Al Khaleej Plaza	102 O'Kon Island Ewan Tower Abu Dhabi	Wyndham Garden Al Khaleej Plaza	24.453884	25.324480	54.377342	56.009892	Apartment	Banglow	3	5	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	Ye	No	Yes	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	2023-05-27 23:04:57	2023-05-27 23:04:57	WQ-12	B-121
5	6	2	2023-05-29	2023-05-30	United Arab Emirate	Qatar	Dubai	Doha	102 O'Kon Island	Wyndham Garden	Ewan Tower	Al Khaleej Plaza	102 O'Kon Island Ewan Tower Sharjah	Wyndham Garden Al Khaleej Plaza	25.204849	25.285446	55.270782	51.531040	Apartment	Banglow	3	5	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	Ye	No	Yes	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	2023-05-27 23:04:57	2023-05-27 23:04:57	WQ-12	B-121
6	1	1	2023-05-29	2023-05-30	\N	\N	Abu Dhabi	Ajman	102 O'Kon Island	Wyndham Garden	Ewan Tower	Al Khaleej Plaza	102 O'Kon Island Ewan Tower Abu Dhabi	Wyndham Garden Al Khaleej Plaza	24.453884	25.324480	54.377342	56.009892	Apartment	Banglow	3	5	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	Ye	No	Yes	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	2023-05-27 23:04:57	2023-05-27 23:04:57	WQ-12	B-121
\.


--
-- Data for Name: booking_office_relocations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_office_relocations (id, booking_id, category_id, move_out_date, move_in_date, country_from, country_to, city_from, city_to, area_from, area_to, building_from_name, building_to_name, building_from_no, building_to_no, address_from, address_to, latitude_from, latitude_to, longitude_from, longitude_to, details_of_items_to_be_excluded, handyman_services_to_dismantle, handyman_services_to_assemble, include_insurance, extra_details_from, extra_details_to, created_at, updated_at) FROM stdin;
4	3	3	2023-05-29	2023-05-30	United Arab Emirate	Oman	Sharjah	Muscat	102 O'Kon Island	Wyndham Garden	Ewan Tower	Al Khaleej Plaza	B-123	QT-111	102 O'Kon Island Ewan Tower Sharjah	Wyndham Garden Al Khaleej Plaza 	24.453884	23.585890	54.377342	58.405922	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	Yes	No	Yes	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	2023-05-28 13:03:14	2023-05-28 13:03:14
5	7	3	2023-05-29	2023-05-30	United Arab Emirate	Qatar	Dubai	Doha	102 O'Kon Island	Wyndham Garden	Ewan Tower	Al Khaleej Plaza	B-143	QT-213	102 O'Kon Island Ewan Tower Dubai 	Wyndham Garden Al Khaleej Plaza 	25.204849	25.285446	55.270782	51.531040	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	Yes	No	Yes	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	2023-05-28 13:03:14	2023-05-28 13:03:14
\.


--
-- Data for Name: booking_pictures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_pictures (id, booking_id, picture, created_at, updated_at) FROM stdin;
1	5	room3.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
2	5	room2.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
3	5	room1.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
6	8	room3.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
5	8	room2.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
4	8	room1.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
9	4	room1.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
8	4	room2.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
7	4	room3.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
12	2	room3.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
11	2	room2.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
10	2	room1.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
13	6	room1.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
15	6	room2.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
14	6	room3.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
16	3	office3.PNG	2023-05-27 13:56:23	2023-05-27 13:56:23
17	3	office2.PNG	2023-05-27 13:56:23	2023-05-27 13:56:23
18	3	office1.PNG	2023-05-27 13:56:23	2023-05-27 13:56:23
19	7	office3.PNG	2023-05-27 13:56:23	2023-05-27 13:56:23
20	7	office2.PNG	2023-05-27 13:56:23	2023-05-27 13:56:23
21	7	office1.PNG	2023-05-27 13:56:23	2023-05-27 13:56:23
22	1	room3.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
23	1	room2.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
24	1	room1.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
25	9	room3.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
26	9	room2.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
27	9	room1.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
28	9	office3.PNG	2023-05-27 13:56:23	2023-05-27 13:56:23
29	9	office2.PNG	2023-05-27 13:56:23	2023-05-27 13:56:23
30	9	office1.PNG	2023-05-27 13:56:23	2023-05-27 13:56:23
36	10	room3.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
35	10	room2.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
34	10	room1.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
33	10	office3.PNG	2023-05-27 13:56:23	2023-05-27 13:56:23
32	10	office2.PNG	2023-05-27 13:56:23	2023-05-27 13:56:23
31	10	office1.PNG	2023-05-27 13:56:23	2023-05-27 13:56:23
42	11	room3.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
41	11	room2.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
40	11	room1.jpg	2023-05-27 13:56:23	2023-05-27 13:56:23
39	11	office3.PNG	2023-05-27 13:56:23	2023-05-27 13:56:23
38	11	office2.PNG	2023-05-27 13:56:23	2023-05-27 13:56:23
37	11	office1.PNG	2023-05-27 13:56:23	2023-05-27 13:56:23
\.


--
-- Data for Name: booking_qoutes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_qoutes (id, booking_id, company_id, price, hours, status, created_at, updated_at, comission_amount, is_admin_approved) FROM stdin;
9	5	4	400	30	accepted	2023-05-27 15:45:55	2023-05-27 15:45:55	0	no
10	5	5	700	32	rejected	2023-05-27 15:45:59	2023-05-27 15:45:59	0	no
12	8	4	1600	25	accepted	2023-05-27 15:45:55	2023-05-27 15:45:55	0	no
11	8	5	1500	32	rejected	2023-05-27 15:45:59	2023-05-27 15:45:59	0	no
14	2	5	0	0	pending	2023-05-28 11:15:13	2023-05-28 11:15:13	0	no
13	2	4	0	0	pending	2023-05-28 11:15:08	2023-05-28 11:15:08	0	no
15	3	6	3000	20	accepted	2023-05-28 17:57:40	2023-05-28 17:57:40	0	no
16	11	7	2200	50	accepted	2023-05-29 00:45:15	2023-05-29 00:45:15	0	no
17	10	7	0	0	pending	2023-05-29 01:04:19	2023-05-29 01:04:19	0	no
18	6	5	8000	44	accepted	2023-05-29 01:09:12	2023-05-29 01:09:12	0	no
19	6	4	12000	30	rejected	2023-05-29 01:09:16	2023-05-29 01:09:16	0	no
21	9	7	0	0	pending	2023-06-08 15:42:43	2023-06-08 15:42:43	0	no
22	9	7	0	0	pending	2023-06-08 15:43:42	2023-06-08 15:43:42	0	no
23	7	6	0	0	pending	2023-11-07 18:20:18	2023-11-07 18:20:18	0	no
24	1	5	0	0	pending	2023-11-13 22:07:51	2023-11-13 22:07:51	0	no
25	1	4	0	0	pending	2023-11-13 22:07:51	2023-11-13 22:07:51	0	no
\.


--
-- Data for Name: booking_reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_reviews (id, booking_id, company_id, customer_id, rate, comment, created_at, updated_at, status, updated_by) FROM stdin;
1	5	4	2	4	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,	2023-05-29 01:20:21	2023-05-30 09:24:15	approve	1
2	3	6	2	5	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,	2023-05-29 01:20:21	2024-03-19 11:50:04	pending	1
\.


--
-- Data for Name: booking_status_trackings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_status_trackings (id, booking_id, status_tracking, created_at, updated_at) FROM stdin;
3	5	customer_requested	2023-05-25 21:42:12	2023-05-25 21:42:12
4	5	company_qouted	2023-05-26 21:42:12	2023-05-26 21:42:12
5	5	customer_accepted	2023-05-26 23:42:12	2023-05-26 23:42:12
6	5	item_collected	2023-05-27 10:42:12	2023-05-27 10:42:12
7	5	on_the_way	2023-05-27 11:15:12	2023-05-27 11:15:12
8	5	delivered	2023-05-27 17:15:12	2023-05-27 17:15:12
9	8	customer_requested	2023-05-25 21:42:12	2023-05-25 21:42:12
10	8	company_qouted	2023-05-26 21:42:12	2023-05-26 21:42:12
11	8	customer_accepted	2023-05-26 23:42:12	2023-05-26 23:42:12
12	2	customer_requested	2023-05-25 21:42:12	2023-05-25 21:42:12
13	4	customer_requested	2023-05-25 21:42:12	2023-05-25 21:42:12
14	11	customer_requested	2023-05-25 21:42:12	2023-05-25 21:42:12
15	10	customer_requested	2023-05-25 21:42:12	2023-05-25 21:42:12
16	9	customer_requested	2023-05-25 21:42:12	2023-05-25 21:42:12
17	7	customer_requested	2023-05-25 21:42:12	2023-05-25 21:42:12
18	6	customer_requested	2023-05-25 21:42:12	2023-05-25 21:42:12
19	3	customer_requested	2023-05-25 21:42:12	2023-05-25 21:42:12
24	3	company_qouted	2023-05-26 21:42:12	2023-05-26 21:42:12
23	3	customer_accepted	2023-05-26 23:42:12	2023-05-26 23:42:12
22	3	item_collected	2023-05-27 10:42:12	2023-05-27 10:42:12
21	3	on_the_way	2023-05-27 11:15:12	2023-05-27 11:15:12
20	3	delivered	2023-05-27 17:15:12	2023-05-27 17:15:12
29	11	company_qouted	2023-05-26 21:42:12	2023-05-26 21:42:12
28	11	customer_accepted	2023-05-26 23:42:12	2023-05-26 23:42:12
27	11	item_collected	2023-05-27 10:42:12	2023-05-27 10:42:12
26	11	on_the_way	2023-05-27 11:15:12	2023-05-27 11:15:12
25	11	delivered	2023-05-27 17:15:12	2023-05-27 17:15:12
30	10	company_qouted	2023-05-26 21:42:12	2023-05-26 21:42:12
\.


--
-- Data for Name: booking_storage_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_storage_services (id, booking_id, category_id, pickup_date, start_date, end_date, country, city, area, building_name, building_no, address, latitude, longitude, items_to_be_collected, include_insurance, extra_details, created_at, updated_at) FROM stdin;
2	10	4	2023-05-28	2023-06-05	2023-06-10	United Arab Emirates	Dubai	Business Bay	Vision Tower	VT-123	Business Bay Vision Tower	25.228189	55.348850	Yes	Yes	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.	2023-05-28 15:00:34	2023-05-28 15:00:34
1	9	4	2023-05-28	2023-06-05	2023-06-10	United Arab Emirates	Dubai	Business Bay	Vision Tower	VT-123	Business Bay Vision Tower	25.228189	55.348850	Yes	Yes	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.	2023-05-28 15:00:34	2023-05-28 15:00:34
3	11	4	2023-05-28	2023-06-05	2023-06-10	United Arab Emirates	Dubai	Business Bay	Vision Tower	VT-123	Business Bay Vision Tower	25.228189	55.348850	Yes	Yes	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.	2023-05-28 15:00:34	2023-05-28 15:00:34
\.


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (id, category_id, sender_id, admin_response, qouted_amount, comission_amount, customer_signature, delivery_note, company_id, status, created_at, updated_at, awb_number, booking_number, is_paid, total_amount) FROM stdin;
10	4	2	approved	\N	\N	\N	\N	\N	company_qouted	2023-05-28 14:52:26	2023-05-29 01:04:19	\N	#MZ-000010	no	\N
6	2	3	approved	8000	5	\N	\N	5	item_collected	2023-05-25 21:42:12	2023-05-29 01:13:46	\N	#MZ-000006	yes	\N
4	1	3	rejected	\N	\N	\N	\N	\N	customer_requested	2023-05-25 21:42:12	2023-05-25 21:56:48	\N	#MZ-000004	no	\N
5	1	2	approved	400	5	\N	\N	4	delivered	2023-05-25 21:42:12	2023-05-27 21:46:19	\N	#MZ-000005	yes	420
8	1	3	approved	1600	5	\N	\N	4	customer_accepted	2023-05-25 21:42:12	2023-05-25 21:17:18	\N	#MZ-000008	no	1680
2	2	2	approved	\N	\N	\N	\N	\N	customer_requested	2023-05-25 21:42:12	2023-05-28 11:13:08	\N	#MZ-000002	no	\N
3	3	2	approved	3000	5	\N	\N	6	delivered	2023-05-25 21:42:12	2023-05-28 18:03:44	\N	#MZ-000003	yes	3150
11	4	3	approved	2200	5	\N	\N	7	delivered	2023-05-28 14:52:26	2023-05-29 00:51:08	\N	#MZ-000011	yes	2310
9	4	3	approved	\N	\N	\N	\N	\N	customer_requested	2023-05-28 14:52:26	2023-06-08 15:42:43	\N	#MZ-000009	no	\N
7	3	2	approved	\N	\N	\N	\N	\N	customer_requested	2023-05-25 21:42:12	2023-11-07 18:20:18	\N	#MZ-000007	no	\N
1	1	2	approved	\N	\N	\N	\N	\N	customer_requested	2023-05-25 21:42:12	2023-11-13 22:07:51	\N	#MZ-000001	no	\N
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, icon, status, created_at, updated_at, deleted_at, description, image) FROM stdin;
4	Storage Services	64731d62a09f1_1685265762.PNG	active	2023-05-28 13:22:42	2025-01-24 12:22:34	\N	<p>On the MOOVZY application and with just a few clicks, provide details of your request and start to receive domestic relocation quotes from local moving companies. You check their reviews and company profiles before going ahead with accepting a quote that suites your needs.</p>	67934dca62cdd_1737706954.jpg
3	Office Relocation	646f91d949d8d_1685033433.PNG	active	2023-05-25 20:50:33	2025-01-24 12:23:14	\N	<p>Office relocations is never easy and requires a reliable team of office movers to seamlessly relocate your office to the new location smoothly. On the MOOVZY application, provide all the necessary details to support your office relocation request. Once submitted, start to receive quotes from office relocation companies to review, compare then accept the quote that suites you.</p>	67934df286ec0_1737706994.jpg
2	International Home Relocation	646f8ea7d7d30_1685032615.PNG	active	2023-05-25 20:36:55	2025-01-24 12:23:40	\N	<p>At MOOVZY, we work closely with international shipping and cargo companies to bring you the best possible quotes. On the MOOVZY application, provide all the necessary details to support your international relocation request. Once submitted, start to receive quotes from international moving companies to review, compare then accept the quote that suites you.</p>	67934e0c95944_1737707020.jpg
1	Domestic Home Relocation	646f919bcdef2_1685033371.PNG	active	2023-05-25 20:36:35	2025-01-24 12:24:19	\N	<p>On the MOOVZY application and with just a few clicks, provide details of your request and start to receive domestic relocation quotes from local moving companies. You check their reviews and company profiles before going ahead with accepting a quote that suites your needs.</p>	67934e33c23b2_1737707059.jpg
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (id, first_name, last_name, name, logo, company_license, account_type, status, created_at, updated_at, deleted_at, user_id, banner, about_us, is_approved, admin_share, company_share) FROM stdin;
3	\N	\N	Fixit Office Relocators	6471e9b0b4ac7_1685186992.jpg	6471e9b0b7330_1685186992.jpg	1	active	2023-05-27 15:29:52	2023-05-30 12:24:13	\N	6	\N	\N	rejected	0	0
2	\N	\N	Royal Home Relocators	6471e93c32c52_1685186876.jpg	6471e93c39cb3_1685186876.jpg	1	active	2023-05-27 15:27:56	2023-06-03 14:02:53	\N	5	\N	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,	approved	0	0
1	Carter	\N	Mz Movers	647356e5b14cb_1685280485.jpg	647356e5b7c53_1685280485.jpg	1	active	2023-05-25 21:36:11	2023-05-30 10:33:49	\N	4	\N	\N	approved	0	0
7	\N	\N	My New Company 1	647b122db0f82_1685787181.png	647b122dc164d_1685787181.PNG	1	inactive	2023-06-03 14:13:01	2023-06-03 16:35:53	2023-06-03 16:35:53	10	647b122dc1075_1685787181.jpg	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,	pending	0	0
8	\N	\N	Creative	647b1c0f53911_1685789711.PNG	647b1c0f58168_1685789711.PNG	1	inactive	2023-06-03 14:55:11	2023-06-03 16:36:05	2023-06-03 16:36:05	11	647b1c0f57b70_1685789711.PNG	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,	pending	20	80
6	\N	\N	Test Category	6474cc2fb1efe_1685376047.jpg	6474cc2fbd7f6_1685376047.jpg	1	active	2023-05-29 20:00:47	2023-06-03 16:36:31	2023-06-03 16:36:31	9	6474cc2fbd19e_1685376047.jpg	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,	approved	0	0
5	\N	\N	New Company	6474c9e267108_1685375458.jpg	6474c9e267d3c_1685375458.jpg	1	active	2023-05-29 19:50:58	2023-06-03 16:36:41	2023-06-03 16:36:41	8	6474cbbcceab8_1685375932.jpg	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.	approved	0	0
23	Anik	navis	sda	67c6afaca1d4d_1741074348.png	67c6afaca39dd_1741074348.png	1	inactive	2025-03-04 11:45:48	2025-03-04 11:48:15	\N	27	67c6afaca3865_1741074348.png	awdawqweqweqwe	approved	5	0
4	\N	\N	Deluxe Warehouses	64731dceac320_1685265870.jpg	64731dceb395c_1685265870.jpg	1	active	2023-05-28 13:24:30	2023-06-03 16:39:24	\N	7		Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,	approved	5	95
13	\N	\N	Samba	678f8bd570337_1737460693.jpg	678f8bd571b57_1737460693.jpg	1	active	2025-01-21 15:58:13	2025-01-21 15:58:13	\N	17	678f8bd571a38_1737460693.jpg	About Us About Us About Us About Us About Us	pending	7	0
15	Sabeeh	SHah	Shah Company	67bca61ceca00_1740416540.JPG	67bca61cee1b4_1740416540.JPG	1	inactive	2025-02-24 21:02:20	2025-02-24 21:02:20	\N	19	67bca61cee0a9_1740416540.JPG	Hello About	pending	5	0
16	Sabeeh	SHah	Shah Company	67bca77395b94_1740416883.JPG	67bca77397285_1740416883.JPG	1	inactive	2025-02-24 21:08:03	2025-02-24 21:08:03	\N	20	67bca77397179_1740416883.JPG	Hello About	pending	5	0
17	Sabeeh	SHah	Shah Company	67bca80fa2ee2_1740417039.JPG	67bca80fa4620_1740417039.JPG	1	inactive	2025-02-24 21:10:39	2025-02-24 21:10:39	\N	21	67bca80fa450f_1740417039.JPG	Hello About	pending	5	0
18	Sabeeh	SHah	Shah Company	67bca9ff927f6_1740417535.JPG	67bca9ff93ed3_1740417535.JPG	1	inactive	2025-02-24 21:18:55	2025-02-24 21:18:55	\N	22	67bca9ff93dca_1740417535.JPG	Hello About	pending	5	0
19	Sabeeh	SHah	Shah Company	67bcaa56d0219_1740417622.JPG	67bcaa56d18ee_1740417622.JPG	1	inactive	2025-02-24 21:20:22	2025-02-24 21:20:22	\N	23	67bcaa56d17e2_1740417622.JPG	Hello About	pending	5	0
20	Sabeeh	SHah	Shah Company	67bcab652531b_1740417893.JPG	67bcab65269f8_1740417893.JPG	1	inactive	2025-02-24 21:24:53	2025-02-24 21:24:53	\N	24	67bcab65268e6_1740417893.JPG	Hello About	pending	5	0
21	Sabeeh	SHah	Shah Company	67bcabcdad91c_1740417997.JPG	67bcabcdaf0a1_1740417997.JPG	1	inactive	2025-02-24 21:26:37	2025-02-24 21:26:37	\N	25	67bcabcdaef90_1740417997.JPG	Hello About	pending	5	0
22	Sabeeh	SHah	Shah Company	67bcac86c4292_1740418182.JPG	67bcac86c5a45_1740418182.JPG	1	inactive	2025-02-24 21:29:42	2025-02-24 21:29:42	\N	26	67bcac86c5920_1740418182.JPG	Hello About	pending	5	0
\.


--
-- Data for Name: company_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_categories (id, company_id, category_id, created_at, updated_at) FROM stdin;
1	1	2	\N	\N
2	1	1	\N	\N
3	2	2	\N	\N
4	2	1	\N	\N
6	3	3	\N	\N
7	4	4	\N	\N
8	5	2	\N	\N
9	6	1	\N	\N
10	7	2	\N	\N
11	8	1	\N	\N
12	13	2	\N	\N
13	20	4	\N	\N
14	20	3	\N	\N
15	21	4	\N	\N
16	21	3	\N	\N
17	22	4	\N	\N
18	22	3	\N	\N
19	23	4	\N	\N
20	23	3	\N	\N
21	23	2	\N	\N
\.


--
-- Data for Name: contact_page_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_page_settings (id, meta_key, meta_value, created_at, updated_at) FROM stdin;
1	toll_free_number	+971-123456789	2025-01-24 11:36:12	2025-01-24 11:36:12
2	contact_number	+971-123456789	2025-01-24 11:36:12	2025-01-24 11:36:12
3	whatsapp_number	+971-123456789	2025-01-24 11:36:12	2025-01-24 11:36:12
4	email	info@moovzy.ae	2025-01-24 11:36:12	2025-01-24 11:36:12
5	address	Dubai, UAE	2025-01-24 11:36:12	2025-01-24 11:36:12
6	office_timings	<p>MON &ndash; FRI: 9AM - 5PM</p>	2025-01-24 11:36:12	2025-01-24 11:36:12
7	facebook_link	https://www.google.com/	2025-01-24 11:36:12	2025-01-24 11:36:12
8	instagram_link	https://www.google.com/	2025-01-24 11:36:12	2025-01-24 11:36:12
9	twitter_link	https://www.google.com/	2025-01-24 11:36:12	2025-01-24 11:36:12
10	pinterest_link	https://www.google.com/	2025-01-24 11:36:12	2025-01-24 11:36:12
\.


--
-- Data for Name: contact_us_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_us_requests (id, name, email, phone, subject, message, created_at, updated_at) FROM stdin;
1	asdasd	ss@dd.com	3422342342355	xvxdgdg	xvxzvxzvsdfsfsafsf	2025-01-24 14:12:12	2025-01-24 14:12:12
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (country_id, country_name, dial_code, iso_code, lang_code, country_status, created_at, updated_at, deleted_at) FROM stdin;
1	United Arab Emirate	+971	UAE	en	1	2023-05-25 20:43:23	2023-05-25 20:43:23	\N
\.


--
-- Data for Name: country_languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country_languages (country_lang_id, lang_code, country_id_fk, country_localized_name) FROM stdin;
\.


--
-- Data for Name: deligate_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deligate_attributes (id, deligate_id, details, created_at, updated_at, name) FROM stdin;
\.


--
-- Data for Name: deligates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deligates (id, name, icon, status, created_at, updated_at, slug) FROM stdin;
\.


--
-- Data for Name: driver_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.driver_details (id, user_id, driving_license, mulkia, mulkia_number, is_company, company_id, truck_type_id, total_rides, created_at, updated_at, address, latitude, longitude, emirates_id_or_passport, driving_license_number, driving_license_expiry, driving_license_issued_by, vehicle_plate_number, vehicle_plate_place) FROM stdin;
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: join_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.join_requests (id, name, company_name, contact_number, company_description, created_at, updated_at) FROM stdin;
1	sasd	asdad	1234567890	vsdfsfsfsdf	2025-01-24 14:10:19	2025-01-24 14:10:19
\.


--
-- Data for Name: joinus_page_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.joinus_page_settings (id, meta_key, meta_value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.languages (language_id, language_name, lang_code, language_status, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_roles_table	1
2	2014_10_12_100000_create_users_table	1
3	2014_10_12_200000_create_password_resets_table	1
4	2014_10_12_300000_create_failed_jobs_table	1
5	2019_12_14_000001_create_personal_access_tokens_table	1
6	2023_03_02_093403_create_role_permissions_table	1
7	2023_03_05_171740_create_table_countries	1
8	2023_03_05_172109_create_table_country_languages	1
9	2023_03_13_065242_create_languages_table	1
10	2023_03_27_220811_create_pages_table	1
11	2023_03_28_231534_enable_postgis	1
12	2023_03_29_165153_add_coordinates_to_malls_table	1
13	2023_04_15_112135_add_socail_login_table	1
14	2023_04_15_134435_add_provider_to_users_table	1
15	2023_04_15_134617_add_avator_to_users_table	1
16	2023_04_15_172132_create_driver_details_table	1
17	2023_04_15_172206_create_truck_types_table	1
18	2023_04_15_172234_create_deligates_table	1
19	2023_04_15_172305_create_deligate_attributes_table	1
20	2023_04_15_172329_create_companies_table	1
21	2023_04_15_172402_create_bookings_table	1
22	2023_04_15_172442_create_booking_qoutes_table	1
23	2023_04_15_172522_create_booking_reviews_table	1
24	2023_04_15_172553_create_user_wallets_table	1
25	2023_04_15_172643_create_user_wallet_transactions_table	1
26	2023_04_15_172731_create_notifications_table	1
27	2023_04_15_184036_add_foreign_key_contraint_user_roles	1
28	2023_04_15_184120_add_foreign_key_contraint_driver_details	1
29	2023_04_15_190029_add_foreign_key_contraint_deligate_attributes	1
30	2023_04_15_190126_add_foreign_key_contraint_bookings	1
31	2023_04_15_190145_add_foreign_key_contraint_booking_qoutes	1
32	2023_04_15_190208_add_foreign_key_contraint_booking_reviews	1
33	2023_04_15_190256_add_foreign_key_contraint_user_wallets	1
34	2023_04_17_125531_create_driver_types_table	1
35	2023_04_17_193740_add_column_address_table	1
36	2023_04_18_192604_change_column_data_types	1
37	2023_04_18_193410_change_column_data_booking_qoutes_types	1
38	2023_04_19_090946_modify_driver_id_bookings_nullable	1
39	2023_04_19_140056_create_new_notifications_table	1
40	2023_04_19_165518_add_column_bookings_table	1
41	2023_04_19_165705_add_profile_image_users_table	1
42	2023_04_19_172013_add_commission_column_booking_qoutes	1
43	2023_04_19_184759_add_title_to_new_notificationa_table	1
44	2023_04_20_110505_add_column_deligate_attriibutes	1
45	2023_04_20_151756_add_column_is_admin_approved_in_booking_qoutes	1
46	2023_04_20_154913_add_location_to_driver_details_table	1
47	2023_04_20_155036_add_location_to_driver_details_table	1
48	2023_04_21_140650_add_image_new_notifications	1
49	2023_04_24_200623_add_column_slug_deligates_table	1
50	2023_04_24_232126_alter_column_bookings_truck_type_id_null	1
51	2023_04_25_193443_add_column_total_amount_bookings	1
52	2023_04_26_120859_add_status_to_new_notifications_table	1
53	2023_04_27_110802_add_status_to_booking_reviews_table	1
54	2023_05_02_110342_add_paid_max_weight_in_tons_table	1
55	2023_05_16_092913_create_user_password_resets	1
56	2023_05_17_094346_add_column_roles_is_admin	1
57	2023_05_17_151418_add_column_user_table_is_admin_access	1
58	2023_05_17_160522_add_columns_lat_log_users	1
59	2023_05_17_224810_change_enum_values_in_reviews_table	1
60	2023_05_17_233635_add_column_booking_reviews_updated_by	1
61	2023_05_18_100623_add_colum_company_table_user_id	1
62	2023_05_18_151235_add_address_columns_users	1
63	2023_05_18_151349_add_documents_columns_driving_details	1
64	2023_05_19_121225_add_column_user_device_id_users	1
65	2023_05_19_121319_create_blacklist_tbale	1
66	2023_05_22_200422_create_shipping_methods_table	1
67	2023_05_22_225620_add_shipping_method_id_bookings	1
68	2023_05_22_234935_create_booking_charges_table	1
69	2023_05_24_052643_create_booking_status_trackings	1
70	2023_05_24_115128_create_categories_table	1
71	2023_05_24_171657_create_company_categories_table	1
72	2023_05_26_110153_create_booking_home_relocations	2
73	2023_05_26_111613_create_booking_pictures	2
74	2023_05_27_101720_add_buildin_column_booking_home_relocation	3
75	2023_05_27_125414_change_picture_column_type	4
76	2023_05_27_212701_change_booking_status_tracking_enum_values	5
78	2023_05_28_113158_create_table_office_relocation	6
79	2023_05_28_132938_create_booking_storage_services	7
80	2023_05_29_194056_add_column_companies_banner_about_us	8
81	2023_05_30_094026_add_is_approved_company	9
82	2023_05_30_131147_change_column_description	10
84	2023_06_03_132832_add_column_company_admin_share	11
85	2024_04_18_165613_create_settings_table	12
86	2025_01_23_045654_create_webbanners_table	13
87	2025_01_23_060145_create_aboutus_page_settings_table	13
88	2025_01_23_064220_create_joinus_page_settings_table	13
89	2025_01_23_065418_create_contact_page_settings_table	13
90	2025_01_23_070916_create_join_requests_table	13
91	2025_01_23_073102_create_contact_us_requests_table	13
92	2025_01_23_081445_add_description_to_categories_table	13
93	2025_01_24_121121_add_image_column_to_categories_table	14
94	2023_11_29_084619_create_temp_users	15
95	2024_12_16_143622_add_missing_to_users_table	16
96	2024_12_16_143622_add_deleted_to_users_table	17
97	2024_12_16_143622_add_first_name_to_users_table	18
98	2024_12_16_143622_add_active_to_users_table	19
\.


--
-- Data for Name: new_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.new_notifications (id, user_id, description, generated_by, generated_to, is_read, created_at, updated_at, title, image, status) FROM stdin;
2	5	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,	\N	\N	\N	2023-05-29 00:36:33	2023-05-29 00:36:33	What is Lorem Ipsum?	6473bb51000c6_1685306193.PNG	active
1	2	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,	\N	\N	\N	2023-05-29 00:36:32	2023-05-29 00:37:30	What is Lorem Ipsum?	6473bb50e412c_1685306192.PNG	active
3	5	Description New	\N	\N	\N	2023-05-30 11:49:09	2023-05-30 11:49:09	New Notification	6475aa74ee363_1685432948.jpeg	active
4	6	Description New	\N	\N	\N	2023-05-30 11:49:09	2023-05-30 11:49:09	New Notification	6475aa7509a98_1685432949.jpeg	active
5	7	Description New	\N	\N	\N	2023-05-30 11:49:09	2023-05-30 11:49:09	New Notification	6475aa750a97c_1685432949.jpeg	active
6	4	Description New	\N	\N	\N	2023-05-30 11:49:09	2023-05-30 11:49:09	New Notification	6475aa750b9a4_1685432949.jpeg	active
7	9	Description New	\N	\N	\N	2023-05-30 11:49:09	2023-05-30 11:49:09	New Notification	6475aa750ca92_1685432949.jpeg	active
8	8	Description New	\N	\N	\N	2023-05-30 11:49:09	2023-05-30 11:49:09	New Notification	6475aa751d43c_1685432949.jpeg	active
9	5	Description	\N	\N	\N	2023-05-30 11:57:29	2023-05-30 11:57:29	Updated Notification	6475ac699150b_1685433449.jpg	active
10	6	Description	\N	\N	\N	2023-05-30 11:57:29	2023-05-30 11:57:29	Updated Notification	6475ac6995725_1685433449.jpg	active
11	7	Description	\N	\N	\N	2023-05-30 11:57:29	2023-05-30 11:57:29	Updated Notification	6475ac699675c_1685433449.jpg	active
12	9	Description	\N	\N	\N	2023-05-30 11:57:29	2023-05-30 11:57:29	Updated Notification	6475ac69a42cd_1685433449.jpg	active
13	2	ggghh	\N	\N	\N	2025-01-21 10:21:01	2025-01-21 10:21:01	hhh	678f3ccdb2d74_1737440461.jpg	active
14	4	RYRYERY	\N	\N	\N	2025-01-21 10:22:32	2025-01-21 10:22:32	THR	678f3d2852fb8_1737440552.jpg	active
15	5	RYRYERY	\N	\N	\N	2025-01-21 10:22:32	2025-01-21 10:22:32	THR	678f3d2854dbe_1737440552.jpg	active
16	6	RYRYERY	\N	\N	\N	2025-01-21 10:22:32	2025-01-21 10:22:32	THR	678f3d285555a_1737440552.jpg	active
17	7	RYRYERY	\N	\N	\N	2025-01-21 10:22:32	2025-01-21 10:22:32	THR	678f3d2855cef_1737440552.jpg	active
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, type, content, generated_by, generated_to, is_read, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages (id, title, status, slug, description, meta_title, meta_keyword, meta_description, lang_code, created_at, updated_at) FROM stdin;
1	About Us	1	about-us	<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	\N	\N	\N	en	2023-05-29 00:37:59	2023-05-29 00:37:59
2	Privacy Policy	0	privacy-policy	<div class="container">\r\n<div class="cms-content">\r\n<div class="text-center">\r\n<h1>Privacy &amp; Policy</h1>\r\n\r\n<p>&quot;Please read these privacy and policy carefully before using Our Service.&quot;</p>\r\n</div>\r\n\r\n<pre>\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \r\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</pre>\r\n</div>\r\n</div>	\N	\N	\N	en	2025-01-24 11:37:15	2025-01-24 11:37:15
3	Terms and Conditions	0	terms-and-conditions	<div class="container">\r\n<div class="cms-content">\r\n<div class="text-center">\r\n<h1>Terms &amp; Condition</h1>\r\n\r\n<p>&quot;Please read these terms and conditions carefully before using Our Service.&quot;</p>\r\n</div>\r\n\r\n<pre>\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \r\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</pre>\r\n</div>\r\n</div>	\N	\N	\N	en	2025-01-24 11:37:51	2025-01-24 11:37:51
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, created_at, updated_at) FROM stdin;
1	App\\Models\\User	29	Personal Access Token	2c15d2d645fc854b86a2d2b5a828557ffb11da02d2ce55808c5033c0f1e4e9ac	["*"]	\N	2025-03-11 22:43:05	2025-03-11 22:43:05
2	App\\Models\\User	29	Personal Access Token	3e0f4a3b68c0b2291739e41560f290086bad9a3a306544f183528225e3f2244d	["*"]	\N	2025-03-11 22:46:34	2025-03-11 22:46:34
3	App\\Models\\User	29	Personal Access Token	1ce163e817ad948dfe5f7a2c1860aabe6fb236fa0e6b9599a11039f434e653a6	["*"]	\N	2025-03-11 22:48:47	2025-03-11 22:48:47
4	App\\Models\\User	29	Personal Access Token	2215ce2710d480e32e9ba1edae85ae5da57ce3db98d8972e874dc97b0ecb3200	["*"]	\N	2025-03-11 22:48:48	2025-03-11 22:48:48
5	App\\Models\\User	29	Personal Access Token	4c007aaad7adce28a339a80a3d82ed19c3dffb90154242dfdec55dc150e95e33	["*"]	\N	2025-03-11 22:49:03	2025-03-11 22:49:03
6	App\\Models\\User	29	Personal Access Token	3f8e8515f8d7c35dd74b9cee163de909e3e0c50956dddbf8566944516a7969c2	["*"]	\N	2025-03-11 22:49:03	2025-03-11 22:49:03
7	App\\Models\\User	29	Personal Access Token	05a1a12375215dc7e7cb41c08810454e701f4194660023c08282b2b050443c07	["*"]	\N	2025-03-11 22:50:57	2025-03-11 22:50:57
8	App\\Models\\User	29	Personal Access Token	6e4171a72de867342ea8f9d279399fc3f54f90d747be3e13b55cd55c800f1dea	["*"]	\N	2025-03-11 22:50:57	2025-03-11 22:50:57
9	App\\Models\\User	29	Personal Access Token	9d041a2d618786c99551e34ad527860b09b5aebfd8bee2483e640948fc4e9eff	["*"]	\N	2025-03-12 09:12:10	2025-03-12 09:12:10
10	App\\Models\\User	29	Personal Access Token	e5e3cde75d4d037e7e6fc124cfa80981892731948bcc6eaa4f190bbd6980279b	["*"]	\N	2025-03-12 09:12:11	2025-03-12 09:12:11
11	App\\Models\\User	30	Personal Access Token	3ce046c051aad53b112cacead52322f6115f925cb9a00669694c97df635f0bc0	["*"]	\N	2025-03-12 09:16:37	2025-03-12 09:16:37
12	App\\Models\\User	30	Personal Access Token	b6876f40f6c2379e2dd3825ae51e7da24f17db71df7dd5cd511b02bc94082d47	["*"]	\N	2025-03-12 09:16:37	2025-03-12 09:16:37
\.


--
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_permissions (permission_id, user_role_id_fk, module_key, permissions, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, role, status, created_at, updated_at, deleted_at, is_admin_role) FROM stdin;
2	Truck Driver	active	2023-05-25 20:10:21	2023-05-25 20:10:21	\N	0
3	Customer	active	2023-05-25 20:10:21	2023-05-25 20:10:21	\N	0
4	Company	active	2023-05-25 20:10:21	2023-05-25 20:10:21	\N	0
1	Admin	active	2023-05-25 20:10:21	2023-05-25 20:10:24	\N	1
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, service_charge, tax_percentage, created_at, updated_at) FROM stdin;
1	5	5	\N	\N
\.


--
-- Data for Name: shipping_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_methods (id, name, icon, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: temp_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_users (id, name, email, dial_code, phone, phone_verified, active, email_verified, password, email_verified_at, role, first_name, last_name, user_image, user_phone_otp, user_email_otp, user_device_token, user_device_type, user_access_token, firebase_user_key, trade_license, device_cart_id, created_at, updated_at) FROM stdin;
1	rusvin 123 k	1@1.com	971	1	0	1	1	$2y$10$vz83z4mjEJgR72IINFkt0ukW1ewTBqZjs8V/8s6OC7kbRu6zPsV/e	2025-03-12 09:12:03	2	rusvin 123	k	\N	1111	1111	123123	android	\N	\N		\N	2025-03-11 22:22:11	2025-03-12 09:12:03
2	Hamid Raza	razahamid34@gmail.com	92	3441562554	0	1	1	$2y$10$mnyK8GVchOS9VUE5Y1RrUecI4jWIuG.M5KsrHq0cWb3pHnLqj/5CW	2025-03-12 09:16:12	2	Hamid	Raza	\N	1111	1111	123123	android	\N	\N	uploads/trade_licenses/035Wiu1sk3kdVdyJsQHtEJhAW6YMPSFuS02xRicP.jpg	\N	2025-03-12 09:16:12	2025-03-12 09:16:12
\.


--
-- Data for Name: truck_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.truck_types (id, truck_type, dimensions, icon, status, created_at, updated_at, max_weight_in_tons) FROM stdin;
\.


--
-- Data for Name: user_password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_password_resets (id, email, token, is_valid, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_wallet_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_wallet_transactions (id, user_wallet_id, amount, type, created_by, created_at, updated_at) FROM stdin;
1	2	420	debit	1	2023-05-27 21:46:19	2023-05-27 21:46:19
2	2	3150	debit	1	2023-05-28 18:03:30	2023-05-28 18:03:30
3	2	3150	debit	1	2023-05-28 18:03:45	2023-05-28 18:03:45
4	3	2310	debit	1	2023-05-29 00:51:08	2023-05-29 00:51:08
5	3	8400	debit	1	2023-05-29 01:13:46	2023-05-29 01:13:46
\.


--
-- Data for Name: user_wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_wallets (id, user_id, amount, created_at, updated_at) FROM stdin;
1	2	-6720	2023-05-25 20:44:27	2023-05-25 20:44:27
2	3	-10710	2023-05-25 20:56:23	2023-05-25 20:56:23
3	13	0	2025-01-21 15:30:08	2025-01-21 15:30:08
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, dial_code, phone, phone_verified, password, email_verified_at, role_id, user_phone_otp, user_device_token, user_device_type, user_access_token, firebase_user_key, status, remember_token, created_at, updated_at, deleted_at, provider_id, avatar, address, profile_image, is_admin_access, latitude, longitude, country, city, zip_code, address_2, user_device_id, is_social, email_verified, user_email_otp, trade_license, deleted, first_name, last_name, active) FROM stdin;
4	Mz Movers	softcube.web@gmail.com	297	03023484848	1	$2y$10$yn6Gzu.IXMCsbILTuT9Qn.BGwPEpg4QX/crKaN1kowOW7PI9jwmi2	2023-05-25 21:36:11	4	\N	\N	\N	\N	\N	active	\N	2023-05-25 21:36:11	2023-05-30 10:33:49	\N	\N	\N	57R6+C4P - Sheikh Zayed Rd - Dubai - United Arab Emirates	\N	0	25.204819	55.2603152	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
5	Royal Home Relocators	royalhome@email.com	61	383837377	1	$2y$10$y9XW9EUs77DHm1Vp168pL.tkH8GzlsBoWUwbZ/KvrBq5juPFBDY2K	2023-05-27 15:27:55	4	\N	\N	\N	\N	\N	active	\N	2023-05-27 15:27:55	2023-05-30 12:12:27	\N	\N	\N	34HP+PGV - Jumeirah Beach Residence - Dubai - United Arab Emirates	\N	0	25.079339	55.136229	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
6	Fixit Office Relocators	fixit@email.com	61	2228822882828	1	$2y$10$taSoswFFAv31T5eqsbiOS.kNbqwu6GBkNsZPRTg6nK/Z5cuotqPzG	2023-05-27 15:29:52	4	\N	\N	\N	\N	\N	inactive	\N	2023-05-27 15:29:52	2023-05-30 12:24:13	\N	\N	\N	Block D, 3rd Floor, Office Park Building #56 - الصفوح - مدينة دبي للإنترنت - دبي - United Arab Emirates	\N	0	25.204819	55.1684566	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
3	Allen Max	allen@email.com	43	38373733663	1	$2y$10$64DwJ5UrOz.8q5pfrYnGye0icnYLAvKomzoVtu1x0jC0yBbhmP3F.	2023-05-25 20:56:23	3	\N	\N	\N	\N	\N	active	\N	2023-05-25 20:56:23	2023-09-12 18:15:01	\N	\N	\N	57R6+C4P - Sheikh Zayed Rd - Dubai - United Arab Emirates	\N	0	25.19109980000001	55.2603152	United Arab Emirate	Dubai	00000	5th Floor 342 Apartment	\N	0	\N	\N	\N	\N	\N	\N	\N
15	Samba	samba23@gmail.com	971	3235355	1	$2y$10$B3J0C8/AglScgSzUrskFR.QTLLWypSAeMAbmj.PdQEQ.2LQ24542u	2025-01-21 15:50:50	4	\N	\N	\N	\N	\N	active	\N	2025-01-21 15:50:50	2025-01-21 15:50:50	\N	\N	\N	3MQ4+W9G, Multan - Vehari Rd, Makhdum Rashid, Multan, Punjab, Pakistan	\N	0	30.089513	71.655558	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
10	My New Company 1	abcdef@email.com	297	22828828282	1	$2y$10$ofBv37FzuzOGzhmHHoaHTeT7YIPz4SbvMaiVpadW/hK1.w0V3fhjq	2023-06-03 14:13:01	4	\N	\N	\N	\N	\N	inactive	\N	2023-06-03 14:13:01	2023-06-03 16:35:53	2023-06-03 16:35:53	\N	\N	673C+W8X - Dubai - United Arab Emirates	\N	0	25.20676045589012	55.260867351776106	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
11	Creative	creative@email.com	244	3939399393	1	$2y$10$McGYr8AWfTLMa49Epir/EOqRp7oPJ3EoC2nu1WqkgBQ0JsOTK.bvS	2023-06-03 14:55:11	4	\N	\N	\N	\N	\N	inactive	\N	2023-06-03 14:55:11	2023-06-03 16:36:05	2023-06-03 16:36:05	\N	\N	673C+W8X - Dubai - United Arab Emirates	\N	0	25.208158284957296	55.25477337289427	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
9	Test Category	testcategory@email.com	1268	838383838	1	$2y$10$fpDpGnwqFa/0mhYgVMGJaOEsfcR/DqgVGXeCOFxW6wSlgyYDhptJO	2023-05-29 20:00:47	4	\N	\N	\N	\N	\N	active	\N	2023-05-29 20:00:47	2023-06-03 16:36:31	2023-06-03 16:36:31	\N	\N	673C+W8X - Dubai - United Arab Emirates	\N	0	25.207503866232575	55.26251792907715	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
8	New Company	newcompany@email.com	61	227727272727	1	$2y$10$k7PM.tTlL2KbmTKwZULqEeYjUFuBDwCe8N0dlae38B3PkG4noVCoa	2023-05-29 19:50:57	4	\N	\N	\N	\N	\N	active	\N	2023-05-29 19:50:57	2023-06-03 16:36:41	2023-06-03 16:36:41	\N	\N	673C+W8X - Dubai - United Arab Emirates	\N	0	25.190291905188626	55.303663055925796	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
16	Samba	samba235@gmail.com	971	3235356	1	$2y$10$i8KzJy3zNtkHwAmYCFawzuZR2/kwdGulzunaaT1gQtUNVDhzLFFYm	2025-01-21 15:54:46	4	\N	\N	\N	\N	\N	active	\N	2025-01-21 15:54:46	2025-01-21 15:54:46	\N	\N	\N	3MQ4+W9G, Multan - Vehari Rd, Makhdum Rashid, Multan, Punjab, Pakistan	\N	0	30.089513	71.655558	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
17	Samba	sambal23@gmail.com	971	3233560	1	$2y$10$LAiWmqosi9zOOXXMiiWsB.oyrtVxBX4rfcenWemoPKgV4MuEL5odm	2025-01-21 15:58:13	4	\N	\N	\N	\N	\N	active	\N	2025-01-21 15:58:13	2025-01-21 15:58:13	\N	\N	\N	3MQ4+W9G, Multan - Vehari Rd, Makhdum Rashid, Multan, Punjab, Pakistan	\N	0	30.089513	71.655558	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
2	Abdul Ghani	ghaniabro11@gmail.com	374	03023220821	1	$2y$10$egPFwL419nnMOdBG6h4RfudH/.PVE0YE8hgP0YhoKgQMS/NjiOJsy	2023-05-25 20:44:27	3	\N	\N	\N	\N	\N	inactive	\N	2023-05-25 20:44:27	2023-09-12 18:17:25	\N	\N	\N	Churchill Executive Tower - الخليج التجاري - دبي - United Arab Emirates	\N	0	25.1831647	55.272887	United Arab Emirate	Dubai	75500	5th Floor 342 Apartment	\N	0	\N	\N	\N	\N	\N	\N	\N
18	Shah Company	shah@sabeeh.com	971	121121333	1	$2y$10$a4BwabvqOA3fImIPrcRaBOTR/zK84v1k2wE/hcsCL82Lz739kqe4u	2025-02-24 20:59:08	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 20:59:08	2025-02-24 20:59:08	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
19	Shah Company	shah124@sabeeh.com	971	1211213336	1	$2y$10$1J2Xv522NaOG3VOLwMd6e.iDi/e3wS09KkKgRv11oBgCpW6xG0mJ.	2025-02-24 21:02:20	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:02:20	2025-02-24 21:02:20	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
20	Shah Company	shah124+1@sabeeh.com	971	12112133368	1	$2y$10$l2pf.YGOJcY5vlEOBzt8n.StTwRv9cn9vCY5KS2wuUnoPPW6yAkz6	2025-02-24 21:08:03	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:08:03	2025-02-24 21:08:03	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
21	Shah Company	shah12+1@sabeeh.com	971	1212133368	1	$2y$10$Se7FsFWKukTfhZGQX2k0z.KqqUvEL3fbPRqy6TdDy4BgzJ21L6XtG	2025-02-24 21:10:39	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:10:39	2025-02-24 21:10:39	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
22	Shah Company	shah1+1@sabeeh.com	971	121213368	1	$2y$10$vClkWoVND1wpGrrx6YWtcO2CbmLhZLh7bZo5ntPG/.QGZ55x5CGn2	2025-02-24 21:18:55	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:18:55	2025-02-24 21:18:55	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
1	Admin	admin@admin.com	971	112233445566778899	0	$2y$10$E78U6ugNHGbxxXKQHRB70OC5hdcWCSIcZaWl5Nw/sPrxkTYgf6OWu	\N	1	\N	\N	\N	\N	\N	active	\N	2023-05-25 20:10:21	2023-05-25 20:10:21	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
7	Deluxe Warehouses	deluxe@email.com	297	82828282828	1	$2y$10$CvjpE9.RuUGDOURAWYxWIe1VzgRRG4Q6o1zI95ks.eD0gg92Rwy/6	2023-05-28 13:24:30	4	\N	\N	\N	\N	\N	active	\N	2023-05-28 13:24:30	2024-12-30 10:13:38	\N	\N	\N	Churchill Executive Tower - الخليج التجاري - دبي - United Arab Emirates	\N	0	25.1831647	55.272887	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
12	Royal Cargo	royal@royal.com	971	5352525235	1	$2y$10$FP7zzBA3j9HB7D21iiXF8uznmXRxR8qAvryHtO1B9zQjUNHjDvFIq	2025-01-21 15:27:00	4	\N	\N	\N	\N	\N	active	\N	2025-01-21 15:27:00	2025-01-21 15:27:00	\N	\N	\N	35 16th St - Al Safa - Al Safa 1 - Dubai - United Arab Emirates	\N	0	25.179664702061043	55.24431456708986	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
13	Michel	micheal@micheal	971	3453535235	1	$2y$10$.XYcBQZLf.VoI1ZTdpNS0evIt5f0uXKCEf2QyP59/6HNA2HIm/XCi	2025-01-21 15:30:08	3	\N	\N	\N	\N	\N	active	\N	2025-01-21 15:30:08	2025-01-21 15:30:08	\N	\N	\N	57H3+C75 - Dubai - United Arab Emirates	\N	0	25.17857724868758	55.25294055128175	United Arab Emirate	Abudhabi	235252525	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
14	Samba	samba@gmail.com	971	3235354	1	$2y$10$jPAS/WDXs2MauJdf3/oSquZm44AQ7.4z9LTLb9fkwMfFGip/e3DVu	2025-01-21 15:50:10	4	\N	\N	\N	\N	\N	active	\N	2025-01-21 15:50:10	2025-01-21 15:50:10	\N	\N	\N	Mag warehouses, Plot 911 - القوز - منطقة القوز الصناعية 2 - دبي - United Arab Emirates	\N	0	25.1407059	55.25953740000001	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
23	Shah Company	shah1+11@sabeeh.com	971	1212131368	1	$2y$10$9Hy3uPsAVZ3X9hSbuL.vxu03l/ud/ACsxKdUVQzP5UC.7lyRJ0K8a	2025-02-24 21:20:22	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:20:22	2025-02-24 21:20:22	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
24	Shah Company	shah1+21@sabeeh.com	971	121231368	1	$2y$10$H0YFoItNMC..TAulr02x4.54fpyFElc0Vzgg..PLDrDTsKmYt8H8i	2025-02-24 21:24:53	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:24:53	2025-02-24 21:24:53	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
25	Shah Company	shah1+221@sabeeh.com	971	121231364	1	$2y$10$GI6luEXo/c53SOdh4AhDAePTr6t6FzM3xNrJ/RSH2G5r1trrkKWHm	2025-02-24 21:26:37	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:26:37	2025-02-24 21:26:37	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
26	Shah Company	shaqh1+221@sabeeh.com	971	12123136	1	$2y$10$rd4aU/XjgeTAoZlqYLwAkOuPnXVt6Ny4C5f.Ek9TrB/gkAQGdG2am	2025-02-24 21:29:42	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:29:42	2025-02-24 21:29:42	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
27	sda	as@a.com	971	242421414	1	$2y$10$ljafHU1TSKu2dpyjXL3ij.zz.U3ildtxkrteXjYiJFzC6woNdyVnu	2025-03-04 11:45:48	4	\N	\N	\N	\N	\N	active	\N	2025-03-04 11:45:48	2025-03-04 11:48:15	\N	\N	\N	6727+WWV - Al Wasl - Dubai - United Arab Emirates	\N	0	25.202489212059902	55.26457952905272	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N
29	rusvin 123 k	1@1.com	971	1	1	$2y$10$vz83z4mjEJgR72IINFkt0ukW1ewTBqZjs8V/8s6OC7kbRu6zPsV/e	2025-03-12 09:12:10	2	1111	123123	android	e5e3cde75d4d037e7e6fc124cfa80981892731948bcc6eaa4f190bbd6980279b	-OL5Wv3QSGVJ6Y2VVCFe	inactive	\N	2025-03-11 22:43:05	2025-03-12 09:26:03	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	rusvin 123	k	1
30	Hamid Raza	razahamid34@gmail.com	92	3441562554	1	$2y$10$mnyK8GVchOS9VUE5Y1RrUecI4jWIuG.M5KsrHq0cWb3pHnLqj/5CW	2025-03-12 09:16:37	2	1111	123123	android	b6876f40f6c2379e2dd3825ae51e7da24f17db71df7dd5cd511b02bc94082d47	-OL7m7P661afocMwT4PQ	inactive	\N	2025-03-12 09:16:37	2025-03-12 09:26:38	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1		uploads/trade_licenses/035Wiu1sk3kdVdyJsQHtEJhAW6YMPSFuS02xRicP.jpg	\N	Hamid	Raza	1
\.


--
-- Data for Name: webbanners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.webbanners (id, name, image, status, created_at, updated_at) FROM stdin;
2	Manage your relocation needs on the go	6793447c86471_1737704572.jpg	1	2025-01-24 11:42:52	2025-01-24 11:42:52
1	Manage your relocation needs on the road	6793443469eb1_1737704500.jpg	1	2025-01-24 11:41:40	2025-01-24 11:43:43
\.


--
-- Name: aboutus_page_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aboutus_page_settings_id_seq', 11, true);


--
-- Name: blacklists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blacklists_id_seq', 1, false);


--
-- Name: booking_additional_charges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_additional_charges_id_seq', 1, false);


--
-- Name: booking_home_relocations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_home_relocations_id_seq', 2, true);


--
-- Name: booking_office_relocations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_office_relocations_id_seq', 1, false);


--
-- Name: booking_pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_pictures_id_seq', 1, true);


--
-- Name: booking_qoutes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_qoutes_id_seq', 25, true);


--
-- Name: booking_reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_reviews_id_seq', 1, true);


--
-- Name: booking_status_trackings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_status_trackings_id_seq', 8, true);


--
-- Name: booking_storage_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_storage_services_id_seq', 1, true);


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_id_seq', 3, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 4, true);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_id_seq', 23, true);


--
-- Name: company_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_categories_id_seq', 21, true);


--
-- Name: contact_page_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_page_settings_id_seq', 10, true);


--
-- Name: contact_us_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_us_requests_id_seq', 1, true);


--
-- Name: countries_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_country_id_seq', 1, true);


--
-- Name: country_languages_country_lang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_languages_country_lang_id_seq', 1, false);


--
-- Name: deligate_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deligate_attributes_id_seq', 1, false);


--
-- Name: deligates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deligates_id_seq', 1, false);


--
-- Name: driver_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.driver_details_id_seq', 1, false);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: join_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.join_requests_id_seq', 1, true);


--
-- Name: joinus_page_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.joinus_page_settings_id_seq', 1, false);


--
-- Name: languages_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.languages_language_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 98, true);


--
-- Name: new_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.new_notifications_id_seq', 17, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 1, false);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pages_id_seq', 3, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 12, true);


--
-- Name: role_permissions_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_permissions_permission_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);


--
-- Name: shipping_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_methods_id_seq', 1, false);


--
-- Name: temp_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_users_id_seq', 2, true);


--
-- Name: truck_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.truck_types_id_seq', 1, false);


--
-- Name: user_password_resets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_password_resets_id_seq', 1, false);


--
-- Name: user_wallet_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_wallet_transactions_id_seq', 5, true);


--
-- Name: user_wallets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_wallets_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 30, true);


--
-- Name: webbanners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.webbanners_id_seq', 2, true);


--
-- Name: aboutus_page_settings aboutus_page_settings_meta_key_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aboutus_page_settings
    ADD CONSTRAINT aboutus_page_settings_meta_key_unique UNIQUE (meta_key);


--
-- Name: aboutus_page_settings aboutus_page_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aboutus_page_settings
    ADD CONSTRAINT aboutus_page_settings_pkey PRIMARY KEY (id);


--
-- Name: blacklists blacklists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blacklists
    ADD CONSTRAINT blacklists_pkey PRIMARY KEY (id);


--
-- Name: booking_additional_charges booking_additional_charges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_additional_charges
    ADD CONSTRAINT booking_additional_charges_pkey PRIMARY KEY (id);


--
-- Name: booking_home_relocations booking_home_relocations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_home_relocations
    ADD CONSTRAINT booking_home_relocations_pkey PRIMARY KEY (id);


--
-- Name: booking_office_relocations booking_office_relocations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_office_relocations
    ADD CONSTRAINT booking_office_relocations_pkey PRIMARY KEY (id);


--
-- Name: booking_pictures booking_pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_pictures
    ADD CONSTRAINT booking_pictures_pkey PRIMARY KEY (id);


--
-- Name: booking_qoutes booking_qoutes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_qoutes
    ADD CONSTRAINT booking_qoutes_pkey PRIMARY KEY (id);


--
-- Name: booking_reviews booking_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_reviews
    ADD CONSTRAINT booking_reviews_pkey PRIMARY KEY (id);


--
-- Name: booking_status_trackings booking_status_trackings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_status_trackings
    ADD CONSTRAINT booking_status_trackings_pkey PRIMARY KEY (id);


--
-- Name: booking_storage_services booking_storage_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_storage_services
    ADD CONSTRAINT booking_storage_services_pkey PRIMARY KEY (id);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: company_categories company_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_categories
    ADD CONSTRAINT company_categories_pkey PRIMARY KEY (id);


--
-- Name: contact_page_settings contact_page_settings_meta_key_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_page_settings
    ADD CONSTRAINT contact_page_settings_meta_key_unique UNIQUE (meta_key);


--
-- Name: contact_page_settings contact_page_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_page_settings
    ADD CONSTRAINT contact_page_settings_pkey PRIMARY KEY (id);


--
-- Name: contact_us_requests contact_us_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us_requests
    ADD CONSTRAINT contact_us_requests_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);


--
-- Name: country_languages country_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country_languages
    ADD CONSTRAINT country_languages_pkey PRIMARY KEY (country_lang_id);


--
-- Name: deligate_attributes deligate_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deligate_attributes
    ADD CONSTRAINT deligate_attributes_pkey PRIMARY KEY (id);


--
-- Name: deligates deligates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deligates
    ADD CONSTRAINT deligates_pkey PRIMARY KEY (id);


--
-- Name: driver_details driver_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_details
    ADD CONSTRAINT driver_details_pkey PRIMARY KEY (id);


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
-- Name: join_requests join_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.join_requests
    ADD CONSTRAINT join_requests_pkey PRIMARY KEY (id);


--
-- Name: joinus_page_settings joinus_page_settings_meta_key_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.joinus_page_settings
    ADD CONSTRAINT joinus_page_settings_meta_key_unique UNIQUE (meta_key);


--
-- Name: joinus_page_settings joinus_page_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.joinus_page_settings
    ADD CONSTRAINT joinus_page_settings_pkey PRIMARY KEY (id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (language_id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: new_notifications new_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_notifications
    ADD CONSTRAINT new_notifications_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


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
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (permission_id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: shipping_methods shipping_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_methods
    ADD CONSTRAINT shipping_methods_pkey PRIMARY KEY (id);


--
-- Name: temp_users temp_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users
    ADD CONSTRAINT temp_users_pkey PRIMARY KEY (id);


--
-- Name: truck_types truck_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.truck_types
    ADD CONSTRAINT truck_types_pkey PRIMARY KEY (id);


--
-- Name: user_password_resets user_password_resets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_password_resets
    ADD CONSTRAINT user_password_resets_pkey PRIMARY KEY (id);


--
-- Name: user_wallet_transactions user_wallet_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_wallet_transactions
    ADD CONSTRAINT user_wallet_transactions_pkey PRIMARY KEY (id);


--
-- Name: user_wallets user_wallets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_wallets
    ADD CONSTRAINT user_wallets_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_user_device_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_device_id_unique UNIQUE (user_device_id);


--
-- Name: webbanners webbanners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webbanners
    ADD CONSTRAINT webbanners_pkey PRIMARY KEY (id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: user_password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_password_resets_email_index ON public.user_password_resets USING btree (email);


--
-- Name: booking_qoutes booking_qoutes_booking_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_qoutes
    ADD CONSTRAINT booking_qoutes_booking_id_foreign FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE CASCADE;


--
-- Name: booking_qoutes booking_qoutes_company_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_qoutes
    ADD CONSTRAINT booking_qoutes_company_id_foreign FOREIGN KEY (company_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: booking_reviews booking_reviews_booking_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_reviews
    ADD CONSTRAINT booking_reviews_booking_id_foreign FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE CASCADE;


--
-- Name: booking_reviews booking_reviews_company_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_reviews
    ADD CONSTRAINT booking_reviews_company_id_foreign FOREIGN KEY (company_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: bookings bookings_company_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_company_id_foreign FOREIGN KEY (company_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: bookings bookings_sender_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_sender_id_foreign FOREIGN KEY (sender_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: deligate_attributes deligate_attributes_deligate_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deligate_attributes
    ADD CONSTRAINT deligate_attributes_deligate_id_foreign FOREIGN KEY (deligate_id) REFERENCES public.deligates(id) ON DELETE CASCADE;


--
-- Name: driver_details driver_details_company_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_details
    ADD CONSTRAINT driver_details_company_id_foreign FOREIGN KEY (company_id) REFERENCES public.companies(id) ON DELETE CASCADE;


--
-- Name: driver_details driver_details_truck_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_details
    ADD CONSTRAINT driver_details_truck_type_id_foreign FOREIGN KEY (truck_type_id) REFERENCES public.truck_types(id) ON DELETE CASCADE;


--
-- Name: driver_details driver_details_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_details
    ADD CONSTRAINT driver_details_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_wallets user_wallets_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_wallets
    ADD CONSTRAINT user_wallets_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users users_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

