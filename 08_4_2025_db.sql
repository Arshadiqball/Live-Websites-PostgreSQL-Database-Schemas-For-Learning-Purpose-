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
-- Name: booking_item_deliveries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_item_deliveries (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    category_id integer NOT NULL,
    pickup_date date NOT NULL,
    dropoff_date date NOT NULL,
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
    no_of_items character varying(255),
    receiver_name character varying(255),
    receiver_phone character varying(255),
    item_description text,
    extra_details_from text,
    extra_details_to text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    receiver_dial_code character varying(255)
);


ALTER TABLE public.booking_item_deliveries OWNER TO postgres;

--
-- Name: booking_item_deliveries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_item_deliveries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_item_deliveries_id_seq OWNER TO postgres;

--
-- Name: booking_item_deliveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_item_deliveries_id_seq OWNED BY public.booking_item_deliveries.id;


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
    company_id bigint,
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
    updated_at timestamp(0) without time zone,
    storage_time_in character varying(255),
    storage_time character varying(255)
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
-- Name: booking_vehicle_recoveries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_vehicle_recoveries (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    category_id integer NOT NULL,
    pickup_date date NOT NULL,
    collection_date date NOT NULL,
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
    vehicle_model character varying(255),
    vehicle_type character varying(255),
    name_of_recipient character varying(255),
    extra_details_from text,
    extra_details_to text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.booking_vehicle_recoveries OWNER TO postgres;

--
-- Name: booking_vehicle_recoveries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_vehicle_recoveries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_vehicle_recoveries_id_seq OWNER TO postgres;

--
-- Name: booking_vehicle_recoveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_vehicle_recoveries_id_seq OWNED BY public.booking_vehicle_recoveries.id;


--
-- Name: booking_vehicle_relocations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_vehicle_relocations (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    category_id integer NOT NULL,
    pickup_date date NOT NULL,
    collection_date date NOT NULL,
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
    vehicle_model character varying(255),
    vehicle_type character varying(255),
    extra_details text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.booking_vehicle_relocations OWNER TO postgres;

--
-- Name: booking_vehicle_relocations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_vehicle_relocations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_vehicle_relocations_id_seq OWNER TO postgres;

--
-- Name: booking_vehicle_relocations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_vehicle_relocations_id_seq OWNED BY public.booking_vehicle_relocations.id;


--
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    sender_id bigint NOT NULL,
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
    admin_response character varying(255) DEFAULT 'not_completed'::character varying NOT NULL,
    rating character varying(255),
    CONSTRAINT bookings_admin_response_check CHECK (((admin_response)::text = ANY ((ARRAY['not_completed'::character varying, 'pending'::character varying, 'approved'::character varying, 'rejected'::character varying])::text[]))),
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
-- Name: business_enquiries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.business_enquiries (
    id bigint NOT NULL,
    name text,
    email text,
    phone text,
    dial_code text,
    business_name text,
    enquiry text,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.business_enquiries OWNER TO postgres;

--
-- Name: business_enquiries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.business_enquiries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.business_enquiries_id_seq OWNER TO postgres;

--
-- Name: business_enquiries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.business_enquiries_id_seq OWNED BY public.business_enquiries.id;


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
-- Name: contact_us; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_us (
    id bigint NOT NULL,
    email character varying(255),
    dial_code character varying(255),
    phone character varying(255),
    message character varying(255),
    date character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    name character varying(255)
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
-- Name: faq; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faq (
    id bigint NOT NULL,
    active character varying(255),
    title character varying(255),
    title_ar character varying(255),
    description_ar character varying(255),
    description character varying(255),
    created_by integer,
    updated_by integer,
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
-- Name: manufacturers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manufacturers (
    id bigint NOT NULL,
    name character varying(255),
    status character varying(255),
    name_ar character varying(255),
    logo character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.manufacturers OWNER TO postgres;

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
-- Name: user_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_address (
    id bigint NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    full_name character varying(255) NOT NULL,
    dial_code character varying(5) NOT NULL,
    phone character varying(20) NOT NULL,
    email character varying(255) NOT NULL,
    address text NOT NULL,
    address_type character varying(255) DEFAULT 'Home'::character varying NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    is_default integer DEFAULT 0 NOT NULL,
    land_mark character varying(600),
    building_name character varying(600),
    latitude character varying(600),
    longitude character varying(600),
    location character varying(1600),
    message character varying(1600),
    created_at timestamp(1) without time zone,
    updated_at timestamp(1) without time zone
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
-- Name: user_cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_cards (
    id bigint NOT NULL,
    stripe_customer_id character varying(255),
    card_number character varying(255),
    user_id integer,
    is_default integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_cards OWNER TO postgres;

--
-- Name: user_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_cards_id_seq OWNER TO postgres;

--
-- Name: user_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_cards_id_seq OWNED BY public.user_cards.id;


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
-- Name: user_ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_ratings (
    id bigint NOT NULL,
    rating numeric(8,2),
    review character varying(255),
    user_id character varying(255),
    vendor_id integer,
    booking_id integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_ratings OWNER TO postgres;

--
-- Name: user_ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_ratings_id_seq OWNER TO postgres;

--
-- Name: user_ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_ratings_id_seq OWNED BY public.user_ratings.id;


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
    password_reset_code character varying(255),
    password_reset_time character varying(255),
    password_reset_otp character varying(255),
    temp_dial_code character varying(255),
    temp_mobile character varying(255),
    temp_email character varying(255),
    ratings character varying(255),
    total_ratings character varying(255),
    stripe_customer_id character varying(255),
    profile_completed character varying(255) DEFAULT '1'::character varying,
    password_sent character varying(255) DEFAULT '1'::character varying,
    card_saved character varying(255) DEFAULT '1'::character varying,
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
-- Name: vehicle_models; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle_models (
    id bigint NOT NULL,
    type_id integer,
    manufacturer_id integer,
    model character varying(255),
    model_ar character varying(255),
    status character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.vehicle_models OWNER TO postgres;

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
    manufacturer_id integer,
    model character varying(255),
    model_ar character varying(255),
    status character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.vehicle_types OWNER TO postgres;

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
-- Name: booking_item_deliveries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_item_deliveries ALTER COLUMN id SET DEFAULT nextval('public.booking_item_deliveries_id_seq'::regclass);


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
-- Name: booking_vehicle_recoveries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_vehicle_recoveries ALTER COLUMN id SET DEFAULT nextval('public.booking_vehicle_recoveries_id_seq'::regclass);


--
-- Name: booking_vehicle_relocations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_vehicle_relocations ALTER COLUMN id SET DEFAULT nextval('public.booking_vehicle_relocations_id_seq'::regclass);


--
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- Name: business_enquiries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business_enquiries ALTER COLUMN id SET DEFAULT nextval('public.business_enquiries_id_seq'::regclass);


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
-- Name: contact_us id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us ALTER COLUMN id SET DEFAULT nextval('public.contact_us_id_seq'::regclass);


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
-- Name: faq id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faq ALTER COLUMN id SET DEFAULT nextval('public.faq_id_seq'::regclass);


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
-- Name: manufacturers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturers ALTER COLUMN id SET DEFAULT nextval('public.manufacturers_id_seq'::regclass);


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
-- Name: user_address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address ALTER COLUMN id SET DEFAULT nextval('public.user_address_id_seq'::regclass);


--
-- Name: user_cards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_cards ALTER COLUMN id SET DEFAULT nextval('public.user_cards_id_seq'::regclass);


--
-- Name: user_password_resets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_password_resets ALTER COLUMN id SET DEFAULT nextval('public.user_password_resets_id_seq'::regclass);


--
-- Name: user_ratings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_ratings ALTER COLUMN id SET DEFAULT nextval('public.user_ratings_id_seq'::regclass);


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
-- Name: vehicle_models id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_models ALTER COLUMN id SET DEFAULT nextval('public.vehicle_models_id_seq'::regclass);


--
-- Name: vehicle_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_types ALTER COLUMN id SET DEFAULT nextval('public.vehicle_types_id_seq'::regclass);


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
1	10	1	2025-03-27	2025-03-31	\N	\N	Muzaffarabad	Sharjah	Ajk	Dubai	Neelum View	Business Bay	R3RR+M9Q - Dubai Industrial City - Dubai - United Arab Emirates,	9FGG+WQ, Muzaffarabad,	24.842831941728633	25.19722963547897	55.09240787476301	55.27974709868431	Apartment	Duplex	3	3	Detail1	Yes	Yes	No	Bjj	Pent House	2025-03-27 11:35:15	2025-03-27 11:37:04	J13	#H12-b13
2	11	1	2025-03-30	2025-03-31	\N	\N	Jzjznz	Hhs	Zjznz	Bdjs	Znzn	Jxjx	6FJP+F8J, Dugri Musalmanan, Pakistan,	Unnamed Road, Madharian Wala Kalar, Pakistan,	32.231598116175576	32.22616512455877	74.48443338274956	74.48095388710499	House	Villa	3	3	Znnz	No	No	No	Zjzj	Jxj	2025-03-27 11:43:54	2025-03-27 11:46:25	Zjzj	Hxjx
3	12	1	2025-03-30	2025-03-31	\N	\N	Jzjz	Nznz	Jzkz	Zjzj	Jzjz	Znxj	Unnamed Road, Madharian Wala Kalar, Pakistan,	Unnamed Road, Madharian Wala Kalar, Pakistan,	32.22616512455877	32.22616512455877	74.48095388710499	74.48095388710499	Villa	Villa	4	4	Nzmz	No	No	No	Znjz	Jxjx	2025-03-27 11:48:11	2025-03-27 11:48:45	Jzkz	Xjjx
4	13	1	2025-03-28	2025-03-28	\N	\N	Frrhh	\N	Bh	\N	Jj	\N	6FJP+5J, Madharian Wala Kalar, Pakistan,	\N	32.23081336448611	\N	74.48631662875414	\N	Apartment	\N	3	\N	Nn	No	\N	No	Jj	\N	2025-03-27 12:44:22	2025-03-27 12:44:22	Nj	\N
5	13	1	2025-03-28	2025-03-28	\N	\N	Frrhh	\N	Bh	\N	Jj	\N	6FJP+5J, Madharian Wala Kalar, Pakistan,	\N	32.23081336448611	\N	74.48631662875414	\N	Apartment	\N	3	\N	Nn	No	\N	No	Jj	\N	2025-03-27 12:45:24	2025-03-27 12:45:24	Nj	\N
6	13	1	2025-03-28	2025-03-28	\N	\N	Frrhh	\N	Bh	\N	Jj	\N	6FJP+5J, Madharian Wala Kalar, Pakistan,	\N	32.23081336448611	\N	74.48631662875414	\N	Apartment	\N	3	\N	Nn	No	\N	No	Jj	\N	2025-03-27 12:45:40	2025-03-27 12:45:40	Nj	\N
7	14	1	2025-03-30	2025-03-31	\N	\N	Lahkre	Dhns	Bd	Shsj	Xbnx	Dhjs	Unnamed Road, Madharian Wala Kalar, Pakistan,	Unnamed Road, Madharian Wala Kalar, Pakistan,	32.22616512455877	32.22616512455877	74.48095388710499	74.48095388710499	Apartment	Villa	2	4	Xnxn	No	No	No	Nxnx	Hdhd	2025-03-27 13:28:18	2025-03-27 13:28:55	Bx	Hshd
8	20	2	2025-03-29	2025-03-30	United Arab Emirate	United Arab Emirate	Jsjs	Hhh	Sjs	Hh	Jsjs	Hj	Unnamed Road, Madharian Wala Kalar, Pakistan,	6FJP+5J, Madharian Wala Kalar, Pakistan,	32.22616512455877	32.23089674644744	74.48095388710499	74.48626834899187	Apartment	Apartment	2	3	Hsjs	No	No	No	Nzsj	Hh	2025-03-27 19:54:03	2025-03-27 19:54:54	Sjjs	Hj
9	22	1	2025-03-30	2025-04-04	\N	\N	Lahore	Jnsjs	Hsjs	Zjzj	Zhjs	Zjzj	Unnamed Road, Madharian Wala Kalar, Pakistan,	Unnamed Road, Madharian Wala Kalar, Pakistan,	32.22616512455877	32.22616512455877	74.48095388710499	74.48095388710499	Villa	House	4	3	Jj	No	No	No	Zjjsjs	Jxjx	2025-03-27 20:14:14	2025-03-27 20:14:45	Djzj	Xhzj
10	41	2	2025-03-30	2025-03-30	United Arab Emirate	\N	Zjsjs	\N	Sjsj	\N	Sjsj	\N	6FJP+5J, Madharian Wala Kalar, Pakistan,	\N	32.23100820588855	\N	74.48587004095316	\N	Condominium	\N	4	\N	Zjzj	No	\N	No	Zjzj	\N	2025-03-27 21:32:56	2025-03-27 21:32:56	Zjzj	\N
11	53	1	2025-04-25	2025-05-23	\N	\N	City	Ddd	Hss	Ssjs	Jssjsj	Sjsj	Unnamed Road, Madharian Wala Kalar, Pakistan,	Unnamed Road, Madharian Wala Kalar, Pakistan,	32.22616512455877	32.22616512455877	74.48095388710499	74.48095388710499	Villa	Villa	4	3	Hssh	No	No	No	Jsjs	Jsjs	2025-03-27 23:27:22	2025-03-27 23:27:47	Hsjs	Sjsj
12	59	1	2025-03-28	2025-03-31	\N	\N	Abu Dabhi	Dubai	Area1	Dubai Area	Ethiad Towers	Business Bay	T&A Building Abu Dhabi PO - المنهل - غرب 15 1 - أبو ظبي - United Arab Emirates,	57JC+JJC - Business Bay - Dubai - United Arab Emirates,	24.453884009873136	25.181566652053196	54.37734369188547	55.271510034799576	Apartment	Apartment	4	6	Its Detail Of Excluded Pickup	Yes	No	Yes	Its Extra Detail Pickup	Its Extra Detail For Moving To	2025-03-28 00:47:02	2025-03-28 00:48:45	E12	BH123556
13	60	2	2025-03-28	2025-03-31	United Arab Emirate	United Arab Emirate	Sharjah	Dubai	Sharjah Area Pickup	Dubai Area Pickup	Sharjah Height	Burj Khilfa	9C4G+FV8 Asif pirkani House - Al Ramla - Al Ramla - East - Sharjah - United Arab Emirates,	1 Sheikh Mohammed bin Rashid Blvd - Downtown Dubai - Dubai - United Arab Emirates,	25.356169944325455	25.182253576743836	55.42721092700958	55.267631225287914	Apartment	Apartment	4	2	Item Details Pickup	Yes	No	Yes	Extra Details Pickup	Its Moving To Details	2025-03-28 00:50:38	2025-03-28 00:52:13	H123	Kh123
14	93	1	2025-03-29	2025-03-31	\N	\N	Hhs	Vsh	Bsb	S s	S s	Bbd	building 4 SS Lootah - النهدة - النهدة ٢ - دبي - United Arab Emirates,	Al Zorah - Ajman - United Arab Emirates,	25.300842238373438	25.42748868137075	55.39108123630285	55.48828549683094	House	Apartment	3	3	Bsbns	Yes	Yes	Yes	Bsbsnmsks	Hshsjsk	2025-03-28 13:41:39	2025-03-28 13:43:16	Bsb s	S s
15	96	1	2025-03-28	2025-03-30	\N	\N	Dubai	Abudubahi	Jlt	Naja	Al manara	Najas	57JF+4G7 - Business Bay - Dubai - United Arab Emirates,	Abu Dhabi Mall, Al Maiyani St, 3rd Floor, Abu Dhabi Mall - مول أبو ظبي - الطابق - Al Zahiyah - E16 01 - Abu Dhabi - United Arab Emirates,	25.179896656443873	24.495924103200696	55.27395620942116	54.38322577625513	Apartment	House	2	3	You can assign staff is still in the morning 😞😞	Yes	Yes	Yes	Ryyyghhj the morning and I will be there in about an hour or so	Hshsjjs	2025-03-28 14:47:14	2025-03-28 14:49:51	812	425
16	104	1	2025-04-03	2025-04-04	\N	\N	Dubai	Abudubahi	Karama	Nasja street	Al watbha	Nasja building	karama Center - 109 Kuwait St - Al Karama - Dubai - United Arab Emirates,	16 Abdallah Bin Qays St - Al Danah - E18 01 - Abu Dhabi - United Arab Emirates,	25.245365234255207	24.472881588485574	55.30314367264509	54.37102306634188	Apartment	House	1	3	Kindly handle with care	Yes	Yes	Yes	Most of the furniture are made if glass	It's in first floor	2025-04-03 11:08:31	2025-04-03 11:11:25	812	563
17	116	1	2025-04-07	2025-04-08	\N	\N	Dubai	Dubai	Difc	Dif	Dubai 1	Diamond	67 First Al Khail St - Al Quoz - Dubai - United Arab Emirates,	199 22D St - Al Satwa - Dubai - United Arab Emirates,	25.14196029601107	25.215287835745194	55.22779572755098	55.2708163484931	Apartment	Apartment	1	2	Tbc	No	No	No	Not tequired	Not required	2025-04-03 23:03:22	2025-04-03 23:06:24	20	4
\.


--
-- Data for Name: booking_item_deliveries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_item_deliveries (id, booking_id, category_id, pickup_date, dropoff_date, country_from, country_to, city_from, city_to, area_from, area_to, building_from_name, building_to_name, building_from_no, building_to_no, address_from, address_to, latitude_from, latitude_to, longitude_from, longitude_to, no_of_items, receiver_name, receiver_phone, item_description, extra_details_from, extra_details_to, created_at, updated_at, receiver_dial_code) FROM stdin;
1	16	7	2025-03-29	2025-03-29	United Arab Emirate	United Arab Emirate	Dubai	Abu Dhabi	Karama	Nasdja	Al Whatbha	Al Waltbja	345	52738	karama Center - 109 Kuwait St - Al Karama - Dubai - United Arab Emirates,	T&A Building Abu Dhabi PO - المنهل - غرب 15 1 - أبو ظبي - United Arab Emirates,	25.245365234255207	24.453884009873136	55.30314367264509	54.37734369188547	3	Anil	466484664	Handle With Care	Cover Properly	Handle With Care	2025-03-27 15:20:30	2025-03-27 15:22:25	971
2	18	7	2025-03-27	2025-03-31	United Arab Emirate	United Arab Emirate	Dubai	Sharjah	East	H13	Business Bay	Burj Khilfa	10	#14444	57JC+JJC - Business Bay - Dubai - United Arab Emirates,	9C4G+FV8 Asif pirkani House - Al Ramla - Al Ramla - East - Sharjah - United Arab Emirates,	25.181566652053196	25.356169944325455	55.271510034799576	55.42721092700958	3	Anil	3441560319	Vagag	Vbb	Vbhv	2025-03-27 19:08:24	2025-03-27 19:09:48	971
3	38	7	2025-04-02	2025-04-27	United Arab Emirate	Saudi Arabia	Lahore	Hajaja	Jsjs	Shjs	Hj	Sjssjsj	Hsj	Shsj	Unnamed Road, Madharian Wala Kalar, Pakistan,	6FXX+2M6, Budhāli, Pakistan,	32.26224917781916	32.24837634031591	74.47565015405416	74.49979774653912	4	Hamid	365552555	Hxhs	Djjs	All	2025-03-27 21:24:12	2025-03-27 21:25:11	971
4	63	7	2025-03-28	2025-03-31	United Arab Emirate	United Arab Emirate	Dubai	Sharjah City	Area North	Sharjah	Dubai Studio Mall	Sharjah Schhooli	H21788	Bh-12516	Dubai hills mall - shop# 020-K First floor - near Gate 3 entrance - Dubai - United Arab Emirates,	9C4G+FV8 Asif pirkani House - Al Ramla - Al Ramla - East - Sharjah - United Arab Emirates,	25.10193637387134	25.356169944325455	55.23942142724991	55.42721092700958	6	Asad	3441860319	Its Item Description Pick-up	Extrrà Details By Picluph	Extra Details Droppff	2025-03-28 01:00:11	2025-03-28 01:02:14	971
5	91	7	2025-03-28	2025-03-31	United Arab Emirate	Saudi Arabia	Gsh	Hsh	Hs .	S bs	Y d.	Bsbs	537	Bsbs	building 4 SS Lootah - النهدة - النهدة ٢ - دبي - United Arab Emirates,	56545, Saudi Arabia,	25.287140354412536	25.905655785971078	55.37118058651686	44.044405706226826	2	Anil	846646666	Yeuuejejej	Gshusios	Bshsjske	2025-03-28 12:33:19	2025-03-28 12:34:42	971
\.


--
-- Data for Name: booking_office_relocations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_office_relocations (id, booking_id, category_id, move_out_date, move_in_date, country_from, country_to, city_from, city_to, area_from, area_to, building_from_name, building_to_name, building_from_no, building_to_no, address_from, address_to, latitude_from, latitude_to, longitude_from, longitude_to, details_of_items_to_be_excluded, handyman_services_to_dismantle, handyman_services_to_assemble, include_insurance, extra_details_from, extra_details_to, created_at, updated_at) FROM stdin;
1	61	3	2025-03-28	2025-03-31	United Arab Emirate	United Arab Emirate	Dubai	Rasal Ul Khama	Dubai Area Pickup	Rass Dasert Fropoff	Dubai Height	Ras Height	H124	JL#12288	673C+W8V - Dubai - United Arab Emirates,	New Emirate pump oman road - near Dubai building Materials - النخيل - إمارة رأس الخيمة - United Arab Emirates,	25.204849237091366	25.80069260617666	55.27078282088041	55.97619943320751	Hete Is Details Of Item For Moving From	No	Yes	No	Extra Details Pikckup	Its Extra Details Pickup	2025-03-28 00:53:55	2025-03-28 00:55:32
2	106	3	2025-04-03	2025-04-04	United Arab Emirate	United Arab Emirate	Dubai	JLT	Karama	Marina	Al khalej	JM Tower	237	462⁸	79 8B St - Al Bada'a - Dubai - United Arab Emirates,	Jannat tours kiosk, Peir 7 - behind Marina Mall - دبي مارينا - دبي - United Arab Emirates,	25.22893838288691	25.07635175727159	55.27034427970648	55.141959339380264	Handle with care	Yes	Yes	Yes	Tyuuui	The walk is not a good job and I will be	2025-04-03 15:17:48	2025-04-03 15:20:38
3	108	3	2025-04-04	2025-04-05	United Arab Emirate	United Arab Emirate	Dubai	Abudubahi	Karama	Creek	Karama crntre	Creek view resident	102	234	karama Center - 109 Kuwait St - Al Karama - Dubai - United Arab Emirates,	Abu Dhabi Mall, Al Maiyani St, 3rd Floor, Abu Dhabi Mall - مول أبو ظبي - الطابق - Al Zahiyah - E16 01 - Abu Dhabi - United Arab Emirates,	25.245365234255207	24.495924103200696	55.30314367264509	54.38322577625513	Handle with care	Yes	No	Yes	T us to the morning and I have no updates and become an I 😭😭😭😭😭😭	Becareful	2025-04-03 16:20:40	2025-04-03 16:22:15
4	112	3	2025-04-03	2025-04-04	United Arab Emirate	United Arab Emirate	Dubai	Dubai	Karama	Rigga	Lootah	Clock tower	800	290	building 4 SS Lootah - النهدة - النهدة ٢ - دبي - United Arab Emirates,	Deira Clocktower - Business Village, B - ديرة - دبي - United Arab Emirates,	25.287117921351378	25.25866794624604	55.37119299173355	55.3264369815588	Care pls	Yes	No	Yes	Handle with care	Care	2025-04-03 21:21:12	2025-04-03 21:22:49
5	113	3	2025-04-03	2025-04-04	United Arab Emirate	United Arab Emirate	Dubai	Dubai	Karama	International city	Lootah	813	400	45	Ahil House B Flat 105D - النهدة - النهدة ٢ - دبي - United Arab Emirates,	United Arab Emirates, Dubai, International City RussiaV15 S02,	25.2865167743973	25.164892370283578	55.37130296230316	55.408403277397156	Dgggh	Yes	No	Yes	Tyyuui	Care	2025-04-03 21:32:16	2025-04-03 21:33:43
6	114	3	2025-04-04	2025-04-04	United Arab Emirate	United Arab Emirate	Dubai	Dubai	Al nadha	Rigga	Lootah	Rigtiwwe	788	45	79PC+PJR - Al Nahda St - Al Nahda - Al Nahda 2 - Dubai - United Arab Emirates,	785F+68G - Deira - Riggat Al Buteen - Dubai - United Arab Emirates,	25.28704395285013	25.258061503575387	55.37146557122469	55.32333500683308	With care	Yes	Yes	Yes	Glass furniture	The walk is the morning going to be	2025-04-03 22:38:59	2025-04-03 22:40:28
7	118	3	2025-04-04	2025-04-04	United Arab Emirate	United Arab Emirate	Dubai	Abudubahi	Karama	Naif	Al Khaja	Golden star	234	13	97 12D St - Al Karama - Dubai - United Arab Emirates,	T&A Building Abu Dhabi PO - المنهل - غرب 15 1 - أبو ظبي - United Arab Emirates,	25.245371299330778	24.453884009873136	55.305523462593555	54.37734369188547	With care	Yes	Yes	Yes	Careful	With care	2025-04-04 12:09:23	2025-04-04 12:11:04
\.


--
-- Data for Name: booking_pictures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_pictures (id, booking_id, picture, created_at, updated_at) FROM stdin;
1	10	s17lzgmgXVMjv3pGVhXBgIVy1qxVdzUNFcNQNDQL.jpg	2025-03-27 11:35:32	2025-03-27 11:35:32
2	12	qjRP9cq1NeLqmJszZz2JxEb4FWFSVQcp7lk9oeSO.jpg	2025-03-27 11:48:24	2025-03-27 11:48:24
3	13	TVm7V121wcG8BMNy7mjZ1SSh8MC1neUJoEJnSxQo.jpg	2025-03-27 12:44:36	2025-03-27 12:44:36
4	13	yRPHcqJO4Vbp4YIOJf5TB7230vOgab0AKVnqsNwg.jpg	2025-03-27 12:44:41	2025-03-27 12:44:41
5	13	17Hzkh6OKJWQqhfHf2HygDFTIQ6IATlxV5UVad6k.jpg	2025-03-27 12:45:12	2025-03-27 12:45:12
6	13	aZVofskG8opPFm0xDE0LlybH5YGRecqNmAFTfaim.jpg	2025-03-27 12:45:43	2025-03-27 12:45:43
7	13	KS8hNO0YAzxGFCcvjWd8OseGhzk6N3WUyJCCPMKq.jpg	2025-03-27 12:45:53	2025-03-27 12:45:53
8	14	fl6dRxfBIYcZbtihvoqAOyG3nC0yFR95JQCDyy32.jpg	2025-03-27 13:28:24	2025-03-27 13:28:24
9	14	yJqHstFVM96yzCFOipGhNdmzoV6XE9b0kkkWH6tF.jpg	2025-03-27 13:28:32	2025-03-27 13:28:32
10	16	N8lp0Pky4685xYhvfCIQvEk2OYoDjecjbyz9u0Ry.jpg	2025-03-27 15:20:44	2025-03-27 15:20:44
11	18	nFg95LfsAGlIa8JifcRfgsjV7Vr4L7ccHbyfahqu.jpg	2025-03-27 19:08:40	2025-03-27 19:08:40
12	20	FfMn2iHFlAbkpZpaFoMnNWuqJPJkiRuUxLnbDH3k.jpg	2025-03-27 19:54:21	2025-03-27 19:54:21
13	20	qt4C3KU35Y6Stk7z4AUMpAHZEhmiMIdjYUypnnY9.jpg	2025-03-27 19:54:21	2025-03-27 19:54:21
14	24	lj763bh3PcvnZigTfeaYkrzTAAhxzc34hT8ZyGRN.jpg	2025-03-27 20:29:31	2025-03-27 20:29:31
15	30	ZzgTuBppHbn8UBGg6FqjHUv6tx1ei4kFd2hEHPEp.jpg	2025-03-27 20:46:45	2025-03-27 20:46:45
16	31	s2sBy7HSxNtPFtNnZdEGpifjyHdt9JlJ5Lhj8btV.jpg	2025-03-27 20:55:10	2025-03-27 20:55:10
17	38	uh85HwEpSECu6Hqdl8yqW32GKb7isqlwf71ZZffg.jpg	2025-03-27 21:24:24	2025-03-27 21:24:24
18	40	mzRt9mRo83VCThAUUWZ2b97mV3DfO6LJv1nSCezK.jpg	2025-03-27 21:30:25	2025-03-27 21:30:25
19	50	gEoIwkpbOl0n7Y3YUgQENZhSqD65gqV5A81aEJJM.jpg	2025-03-27 23:21:53	2025-03-27 23:21:53
20	58	E5TCm2QEOqjDnTO1sIIyCvacQPjMjzCC3yk44BtS.jpg	2025-03-28 00:14:22	2025-03-28 00:14:22
21	59	pBlGT12YNsqFjiMYTP9anVw54upY2sta3rn4ccml.jpg	2025-03-28 00:47:12	2025-03-28 00:47:12
22	60	Ayc5hYlmJovhIN5ND94NqGzmMgtGBBmq7wzg5Hg6.jpg	2025-03-28 00:50:45	2025-03-28 00:50:45
23	67	lyvxpKEoJ8NYqlwQgoyNxvgWsIfbEW2O01jotEKI.jpg	2025-03-28 07:49:28	2025-03-28 07:49:28
24	78	oLMXJ8nrTUjP37X8zPYMQm85tDUxIQVdt22Cdudy.jpg	2025-03-28 09:27:14	2025-03-28 09:27:14
25	84	YMi1bbL0KBKmsOOs3upvkxR9c6OeSrhTCEuKVO64.jpg	2025-03-28 09:59:46	2025-03-28 09:59:46
26	89	5CoTi7etmAaqlYbAmARlV0Wf4bJYwsQv9lSqbfdH.jpg	2025-03-28 10:22:27	2025-03-28 10:22:27
27	90	dM6BU292i1hbt3A1A6gciNpNOgcBmSSlrDMoyTlw.jpg	2025-03-28 10:25:36	2025-03-28 10:25:36
28	91	gfOFWpGglcOdooTQmlU4xmyFsAkOAwyy5M8DxKZg.jpg	2025-03-28 12:33:33	2025-03-28 12:33:33
29	92	Z1hqJgOAqOcMlytZNGDSoECGhkgTOFHWyq6Js3EW.jpg	2025-03-28 13:23:18	2025-03-28 13:23:18
30	93	QqPZKyyFQDnBlXljr54J2amU3PRYn6QZJwJAhkX7.jpg	2025-03-28 13:41:49	2025-03-28 13:41:49
31	96	JRRyEdUUC7AuCjMYVmo4t8OHpwyhIEQiXKU4WODI.jpg	2025-03-28 14:47:54	2025-03-28 14:47:54
32	104	MouWW9ZrE14TxnlFSXkLciOTHBf8Z3mfmGUPW0tK.jpg	2025-04-03 11:09:07	2025-04-03 11:09:07
33	104	LAzquSeAytNaIm1o7Y03B05ALKdq3oHOJztGnr6W.jpg	2025-04-03 11:09:07	2025-04-03 11:09:07
34	106	gnD9Ggrc4PTIEHWDQWXcU4uht6jeCBVcJTrqoHOw.jpg	2025-04-03 15:18:02	2025-04-03 15:18:02
35	108	Qsyzz16qrT0dlvks3oSNotRKiIZcQYukp3qjAv23.jpg	2025-04-03 16:20:56	2025-04-03 16:20:56
36	112	8Oz9VjJFhzXKGYMaKBMGdzazHeX8Ud1vf9mlzsy7.jpg	2025-04-03 21:21:27	2025-04-03 21:21:27
37	114	d3ZyWbxM3KBgj7lgmzSFtnBQkCIJuOdUmbgSoenE.jpg	2025-04-03 22:39:12	2025-04-03 22:39:12
38	116	9x3htuj1otgNwCrBG03CiKMpTMXpUInob9chz60h.jpg	2025-04-03 23:04:05	2025-04-03 23:04:05
39	118	7peEcc6Q8src3SQ83P9yEf7pmsm46g0Eh0iXXv01.jpg	2025-04-04 12:09:47	2025-04-04 12:09:47
\.


--
-- Data for Name: booking_qoutes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_qoutes (id, booking_id, company_id, price, hours, status, created_at, updated_at, comission_amount, is_admin_approved) FROM stdin;
2	10	4	0	0	pending	2025-03-27 11:43:25	2025-03-27 11:43:25	0	no
3	10	41	0	0	pending	2025-03-27 11:43:25	2025-03-27 11:43:25	0	no
4	10	27	0	0	pending	2025-03-27 11:43:25	2025-03-27 11:43:25	0	no
5	10	26	0	0	pending	2025-03-27 11:43:25	2025-03-27 11:43:25	0	no
6	10	22	100	0	pending	2025-03-27 11:44:42	2025-03-27 11:44:42	0	no
7	10	22	500	0	pending	2025-03-27 11:44:57	2025-03-27 11:44:57	0	no
9	12	4	0	0	pending	2025-03-27 12:04:05	2025-03-27 12:04:05	0	no
12	12	26	0	0	pending	2025-03-27 12:04:05	2025-03-27 12:04:05	0	no
1	10	5	0	0	accepted	2025-03-27 11:43:25	2025-03-27 13:20:02	0	no
17	11	26	0	0	accepted	2025-03-27 12:04:12	2025-03-27 13:48:37	0	no
21	14	27	0	0	pending	2025-03-27 14:03:43	2025-03-27 14:03:43	0	no
22	14	26	0	0	pending	2025-03-27 14:03:43	2025-03-27 14:03:43	0	no
10	12	41	0	0	rejected	2025-03-27 12:04:05	2025-03-27 14:07:24	0	no
18	14	5	0	0	accepted	2025-03-27 14:03:43	2025-03-27 14:24:07	0	no
8	12	5	0	0	accepted	2025-03-27 12:04:05	2025-03-27 14:35:39	0	no
13	11	5	0	0	accepted	2025-03-27 12:04:12	2025-03-27 14:45:46	0	no
16	11	27	0	0	rejected	2025-03-27 12:04:12	2025-03-27 14:46:23	0	no
14	11	4	0	0	rejected	2025-03-27 12:04:12	2025-03-27 14:49:46	0	no
15	11	41	0	0	rejected	2025-03-27 12:04:12	2025-03-27 14:52:51	0	no
11	12	27	0	0	rejected	2025-03-27 12:04:05	2025-03-27 14:53:08	0	no
20	14	41	0	0	rejected	2025-03-27 14:03:43	2025-03-27 14:53:35	0	no
19	14	4	0	0	rejected	2025-03-27 14:03:43	2025-03-27 14:53:43	0	no
23	16	24	400	0	pending	2025-03-27 15:30:19	2025-03-27 15:30:19	0	no
24	16	22	169	0	pending	2025-03-27 15:31:16	2025-03-27 15:31:16	0	no
25	16	22	520	0	pending	2025-03-27 15:41:31	2025-03-27 15:41:31	0	no
53	20	58	700	0	pending	2025-03-27 19:58:50	2025-03-27 19:58:50	0	no
54	20	58	700	0	accepted	2025-03-27 19:58:56	2025-03-27 20:00:56	0	no
55	22	58	900	0	pending	2025-03-27 20:16:32	2025-03-27 20:16:32	0	no
48	16	56	200	0	pending	2025-03-27 16:58:06	2025-03-27 16:58:06	0	no
51	18	58	400	0	pending	2025-03-27 19:34:11	2025-03-27 19:34:11	0	no
50	18	57	200	0	accepted	2025-03-27 19:32:04	2025-03-27 19:42:20	0	no
52	20	57	250	0	pending	2025-03-27 19:58:14	2025-03-27 19:58:14	0	no
56	22	57	1000	0	accepted	2025-03-27 20:16:44	2025-03-27 20:17:00	0	no
49	16	56	250	0	accepted	2025-03-27 16:59:07	2025-03-27 20:24:23	0	no
57	24	57	625	0	accepted	2025-03-27 21:07:32	2025-03-27 21:07:59	0	no
58	36	57	5220	0	accepted	2025-03-27 21:16:13	2025-03-27 21:16:20	0	no
59	37	57	520	0	pending	2025-03-27 22:32:19	2025-03-27 22:32:19	0	no
60	37	56	300	0	accepted	2025-03-27 23:02:38	2025-03-27 23:04:30	0	no
61	16	56	300	0	pending	2025-03-27 23:51:43	2025-03-27 23:51:43	0	no
62	67	58	400	0	pending	2025-03-28 07:53:08	2025-03-28 07:53:08	0	no
63	67	57	500	0	accepted	2025-03-28 08:07:11	2025-03-28 08:12:07	0	no
64	91	56	400	0	accepted	2025-03-28 13:05:05	2025-03-28 13:08:27	0	no
66	96	57	500	0	pending	2025-03-28 15:00:43	2025-03-28 15:00:43	0	no
65	96	58	400	0	accepted	2025-03-28 14:57:22	2025-03-28 15:02:27	0	no
67	88	57	25	0	accepted	2025-03-29 11:27:19	2025-03-29 11:44:17	0	no
68	92	56	200	0	pending	2025-03-29 22:56:29	2025-03-29 22:56:29	0	no
69	104	58	400	0	pending	2025-04-03 11:17:47	2025-04-03 11:17:47	0	no
70	104	80	500	0	accepted	2025-04-03 11:18:19	2025-04-03 11:20:21	0	no
71	106	81	400	0	accepted	2025-04-03 15:22:30	2025-04-03 15:24:10	0	no
72	108	81	500	0	accepted	2025-04-03 16:24:32	2025-04-03 16:24:45	0	no
73	113	82	400	0	accepted	2025-04-03 21:37:15	2025-04-03 21:37:33	0	no
74	118	82	500	0	accepted	2025-04-04 12:56:17	2025-04-04 12:57:01	0	no
\.


--
-- Data for Name: booking_reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_reviews (id, booking_id, company_id, customer_id, rate, comment, created_at, updated_at, status, updated_by) FROM stdin;
\.


--
-- Data for Name: booking_status_trackings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_status_trackings (id, booking_id, status_tracking, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: booking_storage_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_storage_services (id, booking_id, category_id, pickup_date, start_date, end_date, country, city, area, building_name, building_no, address, latitude, longitude, items_to_be_collected, include_insurance, extra_details, created_at, updated_at, storage_time_in, storage_time) FROM stdin;
1	36	4	2025-03-30	2025-03-30	2025-03-30	United Arab Emirate	Lahore	Hsjs	Hsjs	D	Unnamed Road, Madharian Wala Kalar, Pakistan,	32.23052010895313	74.48526855558157	0	No	Sjjs	2025-03-27 21:12:45	2025-03-27 21:12:45	Month	4
2	39	4	2025-03-30	2025-03-30	2025-03-30	Saudi Arabia	Riyadh	Riyadh	Riyadh Building	35	Al QusaisAl Qusais 1 - القصيص منطقة صناعية - القصيص منطقة صناعية ١ - دبي - United Arab Emirates,	25.289396371612302	55.38644101470709	0	Yes	Vbbnnnm	2025-03-27 21:27:43	2025-03-27 21:27:43	Week	2
3	40	4	2025-03-31	2025-03-31	2025-03-31	Saudi Arabia	Riyad	Ghj	Gh	Vhj On	79WJ+5XP - Al Nahda - Al Nahda 2 - Dubai - United Arab Emirates,	25.295293587839573	55.382460951805115	0	No	Tshhsje	2025-03-27 21:30:12	2025-03-27 21:30:12	Month	6
4	43	4	2025-03-30	2025-03-30	2025-03-30	United Arab Emirate	Zbjzjs	Sjsj	Sjjs	Sjsj	6FJP+F8J, Dugri Musalmanan, Pakistan,	32.231181492432576	74.48629181832075	0	No	Jsjs	2025-03-27 21:58:10	2025-03-27 21:58:10	Week	3
5	44	4	2025-03-30	2025-03-30	2025-03-30	United Arab Emirate	Jzjz	Jzjz	Hzjs	Hsus	1 Gujj Satrah Link Road, Gaz, Pakistan,	32.242097311354705	74.47706904262304	0	No	Ksks	2025-03-27 21:59:33	2025-03-27 21:59:33	Month	4
6	45	4	2025-03-30	2025-03-30	2025-03-30	United Arab Emirate	Hshsjs	Zbnz	Zhzjs	Znzj	6FJP+5J, Madharian Wala Kalar, Pakistan,	32.23053343877062	74.48602326214314	0	No	Dnsj	2025-03-27 22:42:40	2025-03-27 22:42:40	Week	4
7	46	4	2025-03-30	2025-03-30	2025-03-30	United Arab Emirate	Xdddd	Ccc	Gg	Gv	6FJP+5J, Madharian Wala Kalar, Pakistan,	32.230678364957924	74.48603667318821	0	No	Ff	2025-03-27 22:54:00	2025-03-27 22:54:00	Month	3
8	62	4	2025-03-28	2025-03-28	2025-03-28	United Arab Emirate	Dubai	Dubai Area	Dubai Mall	D-123	Downtown Dubai - Dubai - United Arab Emirates,	25.19722963547897	55.27974709868431	0	Yes	Extra Details Secure Storage	2025-03-28 00:57:40	2025-03-28 00:57:40	Month	6
9	69	4	2025-03-28	2025-03-28	2025-03-28	United Arab Emirate	Dubai	Marina	Lootah	355	building 4 SS Lootah - النهدة - النهدة ٢ - دبي - United Arab Emirates,	25.3020477214866	55.38893446326256	0	Yes	Bsbdjjd	2025-03-28 08:45:40	2025-03-28 08:45:40	Week	3
10	78	4	2025-03-28	2025-03-28	2025-03-28	United Arab Emirate	Dubai	North	Business bay	H14	57JC+JJC - Business Bay - Dubai - United Arab Emirates,	25.181566652053196	55.271510034799576	0	Yes	Extra details	2025-03-28 09:27:05	2025-03-28 09:27:05	Month	4
11	83	4	2025-03-30	2025-03-30	2025-03-30	United Arab Emirate	Lahore	Hs	Shs	Shs	6FJP+5J, Madharian Wala Kalar, Pakistan,	32.23065425787822	74.48606852442026	0	No	Sjs	2025-03-28 09:56:43	2025-03-28 09:56:43	Month	2
12	84	4	2025-03-28	2025-03-28	2025-03-28	United Arab Emirate	Dubai	Area 1	Business bay	H14	57JC+JJC - Business Bay - Dubai - United Arab Emirates,	25.181566652053196	55.271510034799576	0	Yes	Details here	2025-03-28 09:59:38	2025-03-28 09:59:38	Month	4
13	85	4	2025-03-29	2025-03-29	2025-03-29	United Arab Emirate	Hhh	Gg	Gg	Gg	6FJP+5J, Madharian Wala Kalar, Pakistan,	32.230660780971	74.48600213974714	0	Yes	Hg	2025-03-28 10:05:10	2025-03-28 10:05:10	Month	3
14	86	4	2025-03-29	2025-03-29	2025-03-29	United Arab Emirate	Xxf	Ff	Ff	Ff	6FJP+5J, Madharian Wala Kalar, Pakistan,	32.23065851206921	74.48601521551609	1	Yes	Dd	2025-03-28 10:09:14	2025-03-28 10:09:14	Week	3
15	87	4	2025-03-30	2025-03-30	2025-03-30	Saudi Arabia	Jaja	Ajaj	Ajaj	Ajak	6FJP+5J, Madharian Wala Kalar, Pakistan,	32.230660780971	74.48600213974714	No	No	Ajak	2025-03-28 10:14:05	2025-03-28 10:14:05	Month	4
16	88	4	2025-03-30	2025-03-30	2025-03-30	United Arab Emirate	Cccc	Vg	Gv	Vvv	6FJP+5J, Madharian Wala Kalar, Pakistan,	32.230656810392844	74.48663011193275	Yes	Yes	Bv	2025-03-28 10:17:21	2025-03-28 10:17:21	Month	4
17	88	4	2025-03-30	2025-03-30	2025-03-30	United Arab Emirate	Cccc	Vg	Gv	Vvv	6FJP+5J, Madharian Wala Kalar, Pakistan,	32.230656810392844	74.48663011193275	Yes	Yes	Bv	2025-03-28 10:17:22	2025-03-28 10:17:22	Month	4
18	89	4	2025-03-28	2025-03-28	2025-03-28	United Arab Emirate	Dubai	North	Business bay	Towerextra	57JC+JJC - Business Bay - Dubai - United Arab Emirates,	25.181566652053196	55.271510034799576	Yes	Yes	Extra	2025-03-28 10:22:20	2025-03-28 10:22:20	Month	6
19	90	4	2025-03-28	2025-03-28	2025-03-28	United Arab Emirate	Dubai	A1	Business Bay	#12355-H	57JC+JJC - Business Bay - Dubai - United Arab Emirates,	25.181566652053196	55.271510034799576	No	Yes	Details herw	2025-03-28 10:25:28	2025-03-28 10:25:28	Month	3
\.


--
-- Data for Name: booking_vehicle_recoveries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_vehicle_recoveries (id, booking_id, category_id, pickup_date, collection_date, country_from, country_to, city_from, city_to, area_from, area_to, building_from_name, building_to_name, building_from_no, building_to_no, address_from, address_to, latitude_from, latitude_to, longitude_from, longitude_to, vehicle_model, vehicle_type, name_of_recipient, extra_details_from, extra_details_to, created_at, updated_at) FROM stdin;
1	30	6	2025-03-27	2025-03-27	Saudi Arabia	\N	Muzaffarabad	\N	Ajk	\N	Alf Annar	\N	13	\N	57JC+JJC - Business Bay - Dubai - United Arab Emirates,	\N	25.181566652053196	\N	55.271510034799576	\N	2	1	\N	Gag	\N	2025-03-27 20:46:32	2025-03-27 20:46:32
2	31	6	2025-03-27	2025-03-31	Saudi Arabia	United Arab Emirate	Rayadh	Dubai	Al Arab	Nort	Rayaz Towar	Business Bay	R-12344	14	65GC+4V - The World Islands - Dubai - United Arab Emirates,	57JC+JJC - Business Bay - Dubai - United Arab Emirates,	25.225364911399087	25.181566652053196	55.17397686839104	55.271510034799576	2	1	Asad	Its Item Removal	No	2025-03-27 20:54:54	2025-03-27 20:55:58
3	37	6	2025-03-29	2025-04-02	Saudi Arabia	United Arab Emirate	Nsjs	Hshs	Jsjs	Hshs	Jsjs	Hsh	Jsjs	Hshs	Unnamed Road, Faqīranwāli, Pakistan,	Unnamed Road, Khindowali, Pakistan,	32.23901506040978	32.21470049207732	74.49391800910234	74.50230360031128	2	1	Hamid	Jsjs	No Detail	2025-03-27 21:19:14	2025-03-27 21:19:49
4	92	6	2025-03-29	2025-03-30	United Arab Emirate	United Arab Emirate	Hj	Fggg	Hhj	Cfg	Vvb	Cvvvbbn	3556	355	building 4 SS Lootah - النهدة - النهدة ٢ - دبي - United Arab Emirates,	Unnamed Rd - HHQF+7XX - Old Umm Al Quwain - Emirate of Umm Al Quwain - United Arab Emirates,	25.287145507953017	25.587843597061493	55.37116717547178	55.57487726211548	2	1	Vbbnnmmm	Fghjjjj	Ryyyghhj	2025-03-28 13:23:04	2025-03-28 13:24:05
\.


--
-- Data for Name: booking_vehicle_relocations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_vehicle_relocations (id, booking_id, category_id, pickup_date, collection_date, country_from, country_to, city_from, city_to, area_from, area_to, building_from_name, building_to_name, building_from_no, building_to_no, address_from, address_to, latitude_from, latitude_to, longitude_from, longitude_to, vehicle_model, vehicle_type, extra_details, created_at, updated_at) FROM stdin;
1	24	5	2025-03-30	2025-04-03	United Arab Emirate	United Arab Emirate	Lahore	Islamabad	Model Towen	F6	Arfa	76	87	56	near madena market - مدينة محمد بن زايد - محمد بن زايد شرق 10 - أبو ظبي - United Arab Emirates,	123 7 Street - Ras Al Khor Industrial Area - Ras Al Khor Industrial Area 2 - Dubai - United Arab Emirates,	24.335537566256185	25.181786929562143	54.535546749830246	55.36677774041891	1	1	All	2025-03-27 20:29:14	2025-03-27 20:29:14
2	47	5	2025-03-30	2025-04-23	United Arab Emirate	Saudi Arabia	Dddf	Hh	Vg	Ggg	Hh	Hhh	Hh	Ccf	6FJP+5J, Madharian Wala Kalar, Pakistan,	6FJP+5J, Madharian Wala Kalar, Pakistan,	32.23067666328191	32.23067666328191	74.48618989437819	74.48618989437819	2	1	Gg	2025-03-27 22:56:06	2025-03-27 22:56:06
3	50	5	2025-03-28	2025-03-31	Saudi Arabia	Saudi Arabia	Taif	Makkah	Khaber	Haram Shareef	Al Arab	Makkah Tower	#123	#43431	65GC+4V - The World Islands - Dubai - United Arab Emirates,	14 Street 63 - Al Nasiriyah - Al Sharq - Sharjah - United Arab Emirates,	25.225364911399087	25.363801383099915	55.17397686839104	55.407368279993534	2	1	Hi	2025-03-27 23:21:40	2025-03-27 23:21:40
4	51	5	2025-03-30	2025-04-19	Saudi Arabia	Saudi Arabia	Nzzj	Sjsj	Zjzj	Sjsj	Sjsjs	Sjsj	Sjsj	Sjsj	Unnamed Road, Madharian Wala Kalar, Pakistan,	6FMP+78C, Dugri Hinduan, Pakistan,	32.22616512455877	32.23271978598969	74.48095388710499	74.48384664952755	2	1	Sjsh	2025-03-27 23:23:23	2025-03-27 23:23:23
5	57	5	2025-03-28	2025-03-31	Saudi Arabia	Saudi Arabia	Taif	Jaddah	Tiaf Area	Jaddah Area	Al Taif Height	Jaddah Tower	123-H13	JD-12465	57JC+JJC - Business Bay - Dubai - United Arab Emirates,	9C4G+FV8 Asif pirkani House - Al Ramla - Al Ramla - East - Sharjah - United Arab Emirates,	25.181566652053196	25.356169944325455	55.271510034799576	55.42721092700958	2	1	Its Extra Detail For Drop Off	2025-03-28 00:10:26	2025-03-28 00:10:26
6	58	5	2025-03-28	2025-03-31	United Arab Emirate	United Arab Emirate	Dubai	Sharjah	Nort Area	Air Port	Business Bay	Sharjah Height	BH-13466	SH-12345	57JC+JJC - Business Bay - Dubai - United Arab Emirates,	9C4G+FV8 Asif pirkani House - Al Ramla - Al Ramla - East - Sharjah - United Arab Emirates,	25.181566652053196	25.356169944325455	55.271510034799576	55.42721092700958	2	1	Its Dropoff Details	2025-03-28 00:14:09	2025-03-28 00:14:09
7	67	5	2025-03-28	2025-03-28	United Arab Emirate	Saudi Arabia	Dubai	Riyadh	Al Nadha	Riyadh Area	Al Manara	Twin Tower	34	355AB	building 4 SS Lootah - النهدة - النهدة ٢ - دبي - United Arab Emirates,	Abu Dhabi Mall, Al Maiyani St, 3rd Floor, Abu Dhabi Mall - مول أبو ظبي - الطابق - Al Zahiyah - E16 01 - Abu Dhabi - United Arab Emirates,	25.287146720550762	24.495924103200696	55.37117086350918	54.38322577625513	2	1	Very Careful	2025-03-28 07:49:02	2025-03-28 07:49:02
\.


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (id, category_id, sender_id, qouted_amount, comission_amount, customer_signature, delivery_note, company_id, status, created_at, updated_at, awb_number, booking_number, is_paid, total_amount, admin_response, rating) FROM stdin;
1	1	48	\N	\N	\N	\N	\N	customer_requested	2025-03-27 11:18:45	2025-03-27 11:18:45	\N	#MZ-000001	no	\N	not_completed	\N
2	1	48	\N	\N	\N	\N	\N	customer_requested	2025-03-27 11:22:54	2025-03-27 11:22:54	\N	#MZ-000002	no	\N	not_completed	\N
3	1	48	\N	\N	\N	\N	\N	customer_requested	2025-03-27 11:23:37	2025-03-27 11:23:37	\N	#MZ-000003	no	\N	not_completed	\N
4	1	48	\N	\N	\N	\N	\N	customer_requested	2025-03-27 11:26:00	2025-03-27 11:26:00	\N	#MZ-000004	no	\N	not_completed	\N
5	1	48	\N	\N	\N	\N	\N	customer_requested	2025-03-27 11:28:27	2025-03-27 11:28:27	\N	#MZ-000005	no	\N	not_completed	\N
6	1	48	\N	\N	\N	\N	\N	customer_requested	2025-03-27 11:29:05	2025-03-27 11:29:05	\N	#MZ-000006	no	\N	not_completed	\N
7	1	48	\N	\N	\N	\N	\N	customer_requested	2025-03-27 11:29:46	2025-03-27 11:29:46	\N	#MZ-000007	no	\N	not_completed	\N
8	1	48	\N	\N	\N	\N	\N	customer_requested	2025-03-27 11:30:34	2025-03-27 11:30:34	\N	#MZ-000008	no	\N	not_completed	\N
9	1	48	\N	\N	\N	\N	\N	customer_requested	2025-03-27 11:33:29	2025-03-27 11:33:29	\N	#MZ-000009	no	\N	not_completed	\N
19	1	36	\N	\N	\N	\N	\N	customer_requested	2025-03-27 19:50:55	2025-03-27 19:50:55	\N	#MZ-000019	no	\N	not_completed	\N
18	7	36	200	\N	\N	\N	57	customer_accepted	2025-03-27 19:07:28	2025-03-27 19:51:38	\N	#MZ-000018	no	\N	approved	4.0
32	6	49	\N	\N	\N	\N	\N	customer_requested	2025-03-27 21:01:27	2025-03-27 21:01:27	\N	#MZ-000032	no	\N	not_completed	\N
20	2	36	700	\N	\N	\N	58	customer_accepted	2025-03-27 19:53:25	2025-03-27 20:00:56	\N	#MZ-000020	no	\N	approved	\N
21	1	36	\N	\N	\N	\N	\N	customer_requested	2025-03-27 20:13:06	2025-03-27 20:13:06	\N	#MZ-000021	no	\N	not_completed	\N
13	1	48	\N	\N	\N	\N	\N	customer_requested	2025-03-27 12:43:49	2025-03-27 12:43:49	\N	#MZ-000013	no	\N	not_completed	\N
33	7	49	\N	\N	\N	\N	\N	customer_requested	2025-03-27 21:06:41	2025-03-27 21:06:41	\N	#MZ-000033	no	\N	not_completed	\N
39	4	54	\N	\N	\N	\N	\N	customer_requested	2025-03-27 21:25:48	2025-03-27 21:25:48	\N	#MZ-000039	no	\N	not_completed	\N
12	1	48	0	\N	\N	\N	5	customer_accepted	2025-03-27 11:47:48	2025-03-27 14:35:39	\N	#MZ-000012	no	\N	approved	\N
11	1	48	0	\N	\N	\N	5	customer_accepted	2025-03-27 11:43:05	2025-03-27 14:45:46	\N	#MZ-000011	no	\N	approved	\N
15	5	54	\N	\N	\N	\N	\N	customer_requested	2025-03-27 15:06:39	2025-03-27 15:06:39	\N	#MZ-000015	no	\N	not_completed	\N
34	3	49	\N	\N	\N	\N	\N	customer_requested	2025-03-27 21:07:14	2025-03-27 21:07:14	\N	#MZ-000034	no	\N	not_completed	\N
14	1	48	0	\N	\N	\N	5	customer_accepted	2025-03-27 13:27:50	2025-03-27 16:39:06	\N	#MZ-000014	no	\N	approved	4.0
17	1	54	\N	\N	\N	\N	\N	customer_requested	2025-03-27 16:52:34	2025-03-27 16:52:34	\N	#MZ-000017	no	\N	not_completed	\N
23	5	53	\N	\N	\N	\N	\N	customer_requested	2025-03-27 20:24:53	2025-03-27 20:24:53	\N	#MZ-000023	no	\N	not_completed	\N
35	4	49	\N	\N	\N	\N	\N	customer_requested	2025-03-27 21:07:17	2025-03-27 21:07:17	\N	#MZ-000035	no	\N	not_completed	\N
10	1	36	0	\N	\N	\N	5	customer_accepted	2025-03-27 11:33:35	2025-03-27 19:49:11	\N	#MZ-000010	no	\N	approved	4.0
22	1	53	1000	\N	\N	\N	57	customer_accepted	2025-03-27 20:13:38	2025-03-27 21:07:38	\N	#MZ-000022	no	\N	approved	4
25	5	49	\N	\N	\N	\N	\N	customer_requested	2025-03-27 20:27:37	2025-03-27 20:27:37	\N	#MZ-000025	no	\N	not_completed	\N
26	5	54	\N	\N	\N	\N	\N	customer_requested	2025-03-27 20:30:50	2025-03-27 20:30:50	\N	#MZ-000026	no	\N	not_completed	\N
27	5	53	\N	\N	\N	\N	\N	customer_requested	2025-03-27 20:43:13	2025-03-27 20:43:13	\N	#MZ-000027	no	\N	not_completed	\N
28	4	49	\N	\N	\N	\N	\N	customer_requested	2025-03-27 20:44:08	2025-03-27 20:44:08	\N	#MZ-000028	no	\N	not_completed	\N
29	6	53	\N	\N	\N	\N	\N	customer_requested	2025-03-27 20:44:36	2025-03-27 20:44:36	\N	#MZ-000029	no	\N	not_completed	\N
30	6	49	\N	\N	\N	\N	\N	customer_requested	2025-03-27 20:45:10	2025-03-27 20:45:10	\N	#MZ-000030	no	\N	not_completed	\N
43	4	53	\N	\N	\N	\N	\N	customer_requested	2025-03-27 21:57:41	2025-03-27 22:03:15	\N	#MZ-000043	no	\N	rejected	\N
31	6	49	\N	\N	\N	\N	\N	customer_requested	2025-03-27 20:53:27	2025-03-27 20:56:00	\N	#MZ-000031	no	\N	pending	\N
24	5	53	625	\N	\N	\N	57	customer_accepted	2025-03-27 20:26:09	2025-03-27 21:08:42	\N	#MZ-000024	no	\N	approved	3.0
41	2	53	\N	\N	\N	\N	\N	customer_requested	2025-03-27 21:32:29	2025-03-27 21:32:29	\N	#MZ-000041	no	\N	not_completed	\N
40	4	54	\N	\N	\N	\N	\N	customer_requested	2025-03-27 21:28:54	2025-03-27 21:33:38	\N	#MZ-000040	no	\N	rejected	\N
36	4	53	5220	\N	\N	\N	57	customer_accepted	2025-03-27 21:12:00	2025-03-27 21:17:01	\N	#MZ-000036	no	\N	approved	5.0
48	5	49	\N	\N	\N	\N	\N	customer_requested	2025-03-27 22:57:47	2025-03-27 22:57:47	\N	#MZ-000048	no	\N	not_completed	\N
38	7	53	\N	\N	\N	\N	\N	customer_requested	2025-03-27 21:23:44	2025-03-27 22:30:47	\N	#MZ-000038	no	\N	approved	\N
42	6	49	\N	\N	\N	\N	\N	customer_requested	2025-03-27 21:40:47	2025-03-27 21:40:47	\N	#MZ-000042	no	\N	not_completed	\N
16	7	54	250	12	\N	\N	56	customer_accepted	2025-03-27 15:18:41	2025-04-02 21:30:50	\N	#MZ-000016	yes	262	approved	4.0
44	4	53	\N	\N	\N	\N	\N	customer_requested	2025-03-27 21:59:10	2025-03-27 21:59:36	\N	#MZ-000044	no	\N	pending	\N
45	4	53	\N	\N	\N	\N	\N	customer_requested	2025-03-27 22:42:17	2025-03-27 22:52:45	\N	#MZ-000045	no	\N	pending	\N
49	6	49	\N	\N	\N	\N	\N	customer_requested	2025-03-27 23:18:09	2025-03-27 23:18:09	\N	#MZ-000049	no	\N	not_completed	\N
46	4	53	\N	\N	\N	\N	\N	customer_requested	2025-03-27 22:53:35	2025-03-27 22:54:03	\N	#MZ-000046	no	\N	pending	\N
47	5	53	\N	\N	\N	\N	\N	customer_requested	2025-03-27 22:54:07	2025-03-27 22:54:07	\N	#MZ-000047	no	\N	not_completed	\N
50	5	49	\N	\N	\N	\N	\N	customer_requested	2025-03-27 23:18:54	2025-03-27 23:18:54	\N	#MZ-000050	no	\N	not_completed	\N
52	1	53	\N	\N	\N	\N	\N	customer_requested	2025-03-27 23:26:03	2025-03-27 23:26:03	\N	#MZ-000052	no	\N	not_completed	\N
51	5	53	\N	\N	\N	\N	\N	customer_requested	2025-03-27 23:22:12	2025-03-27 23:23:26	\N	#MZ-000051	no	\N	pending	\N
54	1	53	\N	\N	\N	\N	\N	customer_requested	2025-03-27 23:31:15	2025-03-27 23:31:15	\N	#MZ-000054	no	\N	not_completed	\N
55	6	53	\N	\N	\N	\N	\N	customer_requested	2025-03-27 23:32:30	2025-03-27 23:32:30	\N	#MZ-000055	no	\N	not_completed	\N
56	5	53	\N	\N	\N	\N	\N	customer_requested	2025-03-27 23:32:55	2025-03-27 23:32:55	\N	#MZ-000056	no	\N	not_completed	\N
53	1	53	\N	\N	\N	\N	\N	customer_requested	2025-03-27 23:26:51	2025-03-28 00:06:57	\N	#MZ-000053	no	\N	rejected	\N
57	5	49	\N	\N	\N	\N	\N	customer_requested	2025-03-28 00:07:43	2025-03-28 00:07:43	\N	#MZ-000057	no	\N	not_completed	\N
58	5	49	\N	\N	\N	\N	\N	customer_requested	2025-03-28 00:12:01	2025-03-28 00:14:25	\N	#MZ-000058	no	\N	pending	\N
37	6	53	300	\N	\N	\N	56	customer_accepted	2025-03-27 21:18:40	2025-03-28 09:02:28	\N	#MZ-000037	no	\N	approved	4.0
59	1	49	\N	\N	\N	\N	\N	customer_requested	2025-03-28 00:44:06	2025-03-28 00:48:47	\N	#MZ-000059	no	\N	pending	\N
82	1	53	\N	\N	\N	\N	\N	customer_requested	2025-03-28 09:55:44	2025-03-28 09:55:44	\N	#MZ-000082	no	\N	not_completed	\N
60	2	49	\N	\N	\N	\N	\N	customer_requested	2025-03-28 00:48:51	2025-03-28 00:52:15	\N	#MZ-000060	no	\N	pending	\N
61	3	49	\N	\N	\N	\N	\N	customer_requested	2025-03-28 00:52:20	2025-03-28 00:55:37	\N	#MZ-000061	no	\N	pending	\N
92	6	73	\N	\N	\N	\N	\N	customer_requested	2025-03-28 13:21:51	2025-03-28 13:25:18	\N	#MZ-000092	no	\N	approved	\N
62	4	49	\N	\N	\N	\N	\N	customer_requested	2025-03-28 00:55:46	2025-03-28 00:57:48	\N	#MZ-000062	no	\N	pending	\N
83	4	53	\N	\N	\N	\N	\N	customer_requested	2025-03-28 09:55:58	2025-03-28 09:56:46	\N	#MZ-000083	no	\N	pending	\N
63	7	49	\N	\N	\N	\N	\N	customer_requested	2025-03-28 00:57:57	2025-03-28 01:02:17	\N	#MZ-000063	no	\N	pending	\N
64	5	49	\N	\N	\N	\N	\N	customer_requested	2025-03-28 02:19:31	2025-03-28 02:19:31	\N	#MZ-000064	no	\N	not_completed	\N
65	6	49	\N	\N	\N	\N	\N	customer_requested	2025-03-28 02:19:44	2025-03-28 02:19:44	\N	#MZ-000065	no	\N	not_completed	\N
66	7	49	\N	\N	\N	\N	\N	customer_requested	2025-03-28 02:20:55	2025-03-28 02:20:55	\N	#MZ-000066	no	\N	not_completed	\N
68	5	54	\N	\N	\N	\N	\N	customer_requested	2025-03-28 07:49:57	2025-03-28 07:49:57	\N	#MZ-000068	no	\N	not_completed	\N
84	4	49	\N	\N	\N	\N	\N	customer_requested	2025-03-28 09:58:32	2025-03-28 09:59:48	\N	#MZ-000084	no	\N	pending	\N
67	5	54	500	\N	\N	\N	57	customer_accepted	2025-03-28 07:41:05	2025-03-28 08:15:44	\N	#MZ-000067	no	\N	approved	4.0
101	1	75	\N	\N	\N	\N	\N	customer_requested	2025-03-29 18:14:06	2025-03-29 18:14:06	\N	#MZ-000101	no	\N	not_completed	\N
70	4	53	\N	\N	\N	\N	\N	customer_requested	2025-03-28 08:40:23	2025-03-28 08:40:23	\N	#MZ-000070	no	\N	not_completed	\N
85	4	53	\N	\N	\N	\N	\N	customer_requested	2025-03-28 10:04:36	2025-03-28 10:05:13	\N	#MZ-000085	no	\N	pending	\N
71	4	53	\N	\N	\N	\N	\N	customer_requested	2025-03-28 08:46:38	2025-03-28 08:46:38	\N	#MZ-000071	no	\N	not_completed	\N
72	4	53	\N	\N	\N	\N	\N	customer_requested	2025-03-28 08:48:25	2025-03-28 08:48:25	\N	#MZ-000072	no	\N	not_completed	\N
69	4	60	\N	\N	\N	\N	\N	customer_requested	2025-03-28 08:27:52	2025-03-28 08:49:33	\N	#MZ-000069	no	\N	approved	\N
73	4	53	\N	\N	\N	\N	\N	customer_requested	2025-03-28 08:54:31	2025-03-28 08:54:31	\N	#MZ-000073	no	\N	not_completed	\N
74	4	53	\N	\N	\N	\N	\N	customer_requested	2025-03-28 08:57:48	2025-03-28 08:57:48	\N	#MZ-000074	no	\N	not_completed	\N
75	4	53	\N	\N	\N	\N	\N	customer_requested	2025-03-28 09:02:46	2025-03-28 09:02:46	\N	#MZ-000075	no	\N	not_completed	\N
76	1	53	\N	\N	\N	\N	\N	customer_requested	2025-03-28 09:04:24	2025-03-28 09:04:24	\N	#MZ-000076	no	\N	not_completed	\N
77	4	49	\N	\N	\N	\N	\N	customer_requested	2025-03-28 09:17:21	2025-03-28 09:17:21	\N	#MZ-000077	no	\N	not_completed	\N
78	4	49	\N	\N	\N	\N	\N	customer_requested	2025-03-28 09:24:45	2025-03-28 09:27:17	\N	#MZ-000078	no	\N	pending	\N
79	4	49	\N	\N	\N	\N	\N	customer_requested	2025-03-28 09:28:27	2025-03-28 09:28:27	\N	#MZ-000079	no	\N	not_completed	\N
80	1	49	\N	\N	\N	\N	\N	customer_requested	2025-03-28 09:44:02	2025-03-28 09:44:02	\N	#MZ-000080	no	\N	not_completed	\N
81	4	49	\N	\N	\N	\N	\N	customer_requested	2025-03-28 09:44:35	2025-03-28 09:44:35	\N	#MZ-000081	no	\N	not_completed	\N
93	1	54	\N	\N	\N	\N	\N	customer_requested	2025-03-28 13:41:04	2025-03-28 13:43:18	\N	#MZ-000093	no	\N	pending	\N
86	4	53	\N	\N	\N	\N	\N	customer_requested	2025-03-28 10:08:47	2025-03-28 10:09:17	\N	#MZ-000086	no	\N	pending	\N
87	4	53	\N	\N	\N	\N	\N	customer_requested	2025-03-28 10:13:43	2025-03-28 10:14:07	\N	#MZ-000087	no	\N	pending	\N
94	1	54	\N	\N	\N	\N	\N	customer_requested	2025-03-28 14:07:14	2025-03-28 14:07:14	\N	#MZ-000094	no	\N	not_completed	\N
89	4	49	\N	\N	\N	\N	\N	customer_requested	2025-03-28 10:21:23	2025-03-28 10:22:29	\N	#MZ-000089	no	\N	pending	\N
95	3	54	\N	\N	\N	\N	\N	customer_requested	2025-03-28 14:07:53	2025-03-28 14:07:53	\N	#MZ-000095	no	\N	not_completed	\N
90	4	49	\N	\N	\N	\N	\N	customer_requested	2025-03-28 10:24:26	2025-03-28 10:25:38	\N	#MZ-000090	no	\N	pending	\N
102	1	75	\N	\N	\N	\N	\N	customer_requested	2025-03-29 20:32:36	2025-03-29 20:32:36	\N	#MZ-000102	no	\N	not_completed	\N
96	1	54	400	\N	\N	\N	58	customer_accepted	2025-03-28 14:45:35	2025-03-30 14:52:45	\N	#MZ-000096	no	\N	approved	4.0
91	7	70	400	\N	\N	\N	56	customer_accepted	2025-03-28 12:32:38	2025-03-28 13:08:27	\N	#MZ-000091	no	\N	approved	\N
88	4	53	25	\N	\N	\N	57	customer_accepted	2025-03-28 10:16:57	2025-03-31 11:41:43	\N	#MZ-000088	no	\N	approved	4.0
104	1	54	500	25	\N	\N	80	customer_accepted	2025-04-03 11:04:35	2025-04-03 11:44:44	\N	#MZ-000104	yes	525	approved	4.0
97	4	30	\N	\N	\N	\N	\N	customer_requested	2025-03-29 01:49:13	2025-03-29 01:49:13	\N	#MZ-000097	no	\N	not_completed	\N
98	1	75	\N	\N	\N	\N	\N	customer_requested	2025-03-29 10:23:44	2025-03-29 10:23:44	\N	#MZ-000098	no	\N	not_completed	\N
103	1	49	\N	\N	\N	\N	\N	customer_requested	2025-04-03 03:27:03	2025-04-03 03:27:03	\N	#MZ-000103	no	\N	not_completed	\N
99	1	75	\N	\N	\N	\N	\N	customer_requested	2025-03-29 18:13:15	2025-03-29 18:13:15	\N	#MZ-000099	no	\N	not_completed	\N
100	2	75	\N	\N	\N	\N	\N	customer_requested	2025-03-29 18:13:51	2025-03-29 18:13:51	\N	#MZ-000100	no	\N	not_completed	\N
105	1	54	\N	\N	\N	\N	\N	customer_requested	2025-04-03 15:15:02	2025-04-03 15:15:02	\N	#MZ-000105	no	\N	not_completed	\N
107	4	54	\N	\N	\N	\N	\N	customer_requested	2025-04-03 16:15:17	2025-04-03 16:15:17	\N	#MZ-000107	no	\N	not_completed	\N
111	4	54	\N	\N	\N	\N	\N	customer_requested	2025-04-03 16:45:27	2025-04-03 16:45:27	\N	#MZ-000111	no	\N	not_completed	\N
109	1	53	\N	\N	\N	\N	\N	customer_requested	2025-04-03 16:44:03	2025-04-03 16:44:03	\N	#MZ-000109	no	\N	not_completed	\N
108	3	54	500	25	\N	\N	81	customer_accepted	2025-04-03 16:19:11	2025-04-03 16:45:22	\N	#MZ-000108	yes	525	approved	4.0
110	4	53	\N	\N	\N	\N	\N	customer_requested	2025-04-03 16:44:14	2025-04-03 16:44:14	\N	#MZ-000110	no	\N	not_completed	\N
112	3	54	\N	\N	\N	\N	\N	customer_requested	2025-04-03 21:20:16	2025-04-03 21:29:11	\N	#MZ-000112	no	\N	approved	\N
113	3	54	400	20	\N	\N	82	customer_accepted	2025-04-03 21:31:22	2025-04-03 21:45:16	\N	#MZ-000113	yes	420	approved	\N
114	3	54	\N	\N	\N	\N	\N	customer_requested	2025-04-03 22:37:55	2025-04-03 22:40:31	\N	#MZ-000114	no	\N	pending	\N
115	1	83	\N	\N	\N	\N	\N	customer_requested	2025-04-03 22:59:57	2025-04-03 22:59:57	\N	#MZ-000115	no	\N	not_completed	\N
116	1	83	\N	\N	\N	\N	\N	customer_requested	2025-04-03 23:00:21	2025-04-03 23:06:40	\N	#MZ-000116	no	\N	pending	\N
117	1	84	\N	\N	\N	\N	\N	customer_requested	2025-04-03 23:41:45	2025-04-03 23:41:45	\N	#MZ-000117	no	\N	not_completed	\N
106	3	54	400	20	\N	\N	81	customer_accepted	2025-04-03 15:15:18	2025-04-04 11:59:43	\N	#MZ-000106	yes	420	approved	2.0
118	3	54	500	25	\N	\N	82	customer_accepted	2025-04-04 12:08:08	2025-04-04 13:26:39	\N	#MZ-000118	yes	525	approved	\N
119	4	49	\N	\N	\N	\N	\N	customer_requested	2025-04-05 17:07:38	2025-04-05 17:07:38	\N	#MZ-000119	no	\N	not_completed	\N
120	1	49	\N	\N	\N	\N	\N	customer_requested	2025-04-05 17:08:27	2025-04-05 17:08:27	\N	#MZ-000120	no	\N	not_completed	\N
121	6	49	\N	\N	\N	\N	\N	customer_requested	2025-04-05 17:10:23	2025-04-05 17:10:23	\N	#MZ-000121	no	\N	not_completed	\N
\.


--
-- Data for Name: business_enquiries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.business_enquiries (id, name, email, phone, dial_code, business_name, enquiry, user_id, created_at, updated_at) FROM stdin;
1	James	business@gmail.com	8992889223	+72	Cattle	What about	32	2025-03-15 14:14:58	2025-03-15 14:14:58
2	James	business@gmail.com	8992889223	+72	Cattle	What about	32	2025-03-17 13:58:34	2025-03-17 13:58:34
3	James	business@gmail.com	8992889223	+72	Cattle	What about	4	2025-03-17 13:58:40	2025-03-17 13:58:40
4	anil business	anilnavis@gmail.com	555875899	971	DXB Apps	I Need To Get My And I Will Make Love The Little Caesars You Guys Are Not 🚭 The New To The New York City 🏙️🏙️🏙️	4	2025-03-26 11:58:10	2025-03-26 11:58:10
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, icon, status, created_at, updated_at, deleted_at, description, image) FROM stdin;
4	Storage Services	64731d62a09f1_1685265762.PNG	active	2023-05-28 13:22:42	2025-01-24 12:22:34	\N	<p>On the MOOVZY application and with just a few clicks, provide details of your request and start to receive domestic relocation quotes from local moving companies. You check their reviews and company profiles before going ahead with accepting a quote that suites your needs.</p>	67934dca62cdd_1737706954.jpg
3	Office Relocation	646f91d949d8d_1685033433.PNG	active	2023-05-25 20:50:33	2025-01-24 12:23:14	\N	<p>Office relocations is never easy and requires a reliable team of office movers to seamlessly relocate your office to the new location smoothly. On the MOOVZY application, provide all the necessary details to support your office relocation request. Once submitted, start to receive quotes from office relocation companies to review, compare then accept the quote that suites you.</p>	67934df286ec0_1737706994.jpg
2	International Home Relocation	646f8ea7d7d30_1685032615.PNG	active	2023-05-25 20:36:55	2025-01-24 12:23:40	\N	<p>At MOOVZY, we work closely with international shipping and cargo companies to bring you the best possible quotes. On the MOOVZY application, provide all the necessary details to support your international relocation request. Once submitted, start to receive quotes from international moving companies to review, compare then accept the quote that suites you.</p>	67934e0c95944_1737707020.jpg
1	Domestic Home Relocation	646f919bcdef2_1685033371.PNG	active	2023-05-25 20:36:35	2025-01-24 12:24:19	\N	<p>On the MOOVZY application and with just a few clicks, provide details of your request and start to receive domestic relocation quotes from local moving companies. You check their reviews and company profiles before going ahead with accepting a quote that suites your needs.</p>	67934e33c23b2_1737707059.jpg
5	Vehicle Relocation	67dd8e0a0a59f_1742573066.png	active	2025-03-21 20:04:26	2025-03-21 20:04:26	\N	<p>Vehicle Relocation</p>	67dd8e0a0be31_1742573066.png
7	Item Delivery	67dd8e49934a9_1742573129.png	active	2025-03-21 20:05:29	2025-03-21 20:05:29	\N	<p>Item Delivery&nbsp;</p>	67dd8e4994a3d_1742573129.png
6	Item Removal	67dd8e27eba84_1742573095.png	active	2025-03-21 20:04:55	2025-03-25 13:37:16	\N	<p>Item Removal</p>	67dd8e27ed0af_1742573095.png
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
24	Anil	Vendor	ABC Cargo	67e3b8ac729c5_1742977196.png	67e3b8ac74169_1742977196.pdf	1	active	2025-03-26 12:19:56	2025-03-26 15:23:31	\N	41	67e3b8ac73f8f_1742977196.jpg	At ABC Cargo, we feel human relations are so bonded with emotions like care and love. Sending something to loved ones and receiving a surprise from our beloved is a feeling. We sweeten that experience with our timely delivery, secure shipments and hassle-free customer service. With technology, we ensure your parcels are always secured and everything is tracked and traced.	approved	5	0
23	Anik	navis	sda	67c6afaca1d4d_1741074348.png	67c6afaca39dd_1741074348.png	1	active	2025-03-04 11:45:48	2025-03-13 11:12:02	\N	27	67c6afaca3865_1741074348.png	awdawqweqweqwe	approved	5	0
4	\N	\N	Deluxe Warehouses	64731dceac320_1685265870.jpg	64731dceb395c_1685265870.jpg	1	active	2023-05-28 13:24:30	2023-06-03 16:39:24	\N	7		Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,	approved	5	95
13	\N	\N	Samba	678f8bd570337_1737460693.jpg	678f8bd571b57_1737460693.jpg	1	active	2025-01-21 15:58:13	2025-01-21 15:58:13	\N	17	678f8bd571a38_1737460693.jpg	About Us About Us About Us About Us About Us	pending	7	0
15	Sabeeh	SHah	Shah Company	67bca61ceca00_1740416540.JPG	67bca61cee1b4_1740416540.JPG	1	inactive	2025-02-24 21:02:20	2025-02-24 21:02:20	\N	19	67bca61cee0a9_1740416540.JPG	Hello About	pending	5	0
16	Sabeeh	SHah	Shah Company	67bca77395b94_1740416883.JPG	67bca77397285_1740416883.JPG	1	inactive	2025-02-24 21:08:03	2025-02-24 21:08:03	\N	20	67bca77397179_1740416883.JPG	Hello About	pending	5	0
17	Sabeeh	SHah	Shah Company	67bca80fa2ee2_1740417039.JPG	67bca80fa4620_1740417039.JPG	1	inactive	2025-02-24 21:10:39	2025-02-24 21:10:39	\N	21	67bca80fa450f_1740417039.JPG	Hello About	pending	5	0
18	Sabeeh	SHah	Shah Company	67bca9ff927f6_1740417535.JPG	67bca9ff93ed3_1740417535.JPG	1	inactive	2025-02-24 21:18:55	2025-02-24 21:18:55	\N	22	67bca9ff93dca_1740417535.JPG	Hello About	pending	5	0
19	Sabeeh	SHah	Shah Company	67bcaa56d0219_1740417622.JPG	67bcaa56d18ee_1740417622.JPG	1	inactive	2025-02-24 21:20:22	2025-02-24 21:20:22	\N	23	67bcaa56d17e2_1740417622.JPG	Hello About	pending	5	0
20	Sabeeh	SHah	Shah Company	67bcab652531b_1740417893.JPG	67bcab65269f8_1740417893.JPG	1	inactive	2025-02-24 21:24:53	2025-02-24 21:24:53	\N	24	67bcab65268e6_1740417893.JPG	Hello About	pending	5	0
21	Sabeeh	SHah	Shah Company	67bcabcdad91c_1740417997.JPG	67bcabcdaf0a1_1740417997.JPG	1	inactive	2025-02-24 21:26:37	2025-02-24 21:26:37	\N	25	67bcabcdaef90_1740417997.JPG	Hello About	pending	5	0
22	Sabeeh	SHah	Shah jhan Company	67bcac86c4292_1740418182.JPG	67bcac86c5a45_1740418182.JPG	1	active	2025-02-24 21:29:42	2025-03-27 15:40:54	\N	26	67bcac86c5920_1740418182.JPG	Hello About	approved	5	0
28	DXB	Company	DXB Company	67e53d28a9bd9_1743076648.jpg	67e53d28ab299_1743076648.jpg	1	active	2025-03-27 15:57:28	2025-04-03 14:33:13	\N	56	67e53d28ab17f_1743076648.jpg	DXBcompany@gmail.com	approved	5	0
25	ddsd	test	dsdsd	67e3bf57dd651_1742978903.png	67e3bf57ded6d_1742978903.png	1	inactive	2025-03-26 12:48:23	2025-03-26 12:48:23	\N	42	67e3bf57dec18_1742978903.png	ddddd	pending	5	0
26	ddsd	test	dsdsd	67e3c09bf267b_1742979227.png	67e3c09bf3db3_1742979227.png	1	inactive	2025-03-26 12:53:47	2025-03-26 12:53:47	\N	43	67e3c09bf3c9a_1742979227.png	ddddd	pending	5	0
27	ddsd	test	dsdsd	67e3c0ea638dd_1742979306.png	67e3c0ea6522a_1742979306.png	1	inactive	2025-03-26 12:55:06	2025-03-26 12:55:06	\N	44	67e3c0ea65014_1742979306.png	fdfdfdfd	pending	5	0
29	Anil	Navis	FNC	67e567d0a70b6_1743087568.png	67e567d0a8def_1743087568.jpg	1	active	2025-03-27 18:59:28	2025-03-27 21:07:15	\N	57	67e567d0a8c1e_1743087568.jpg	We are world wide cargo delivery network that provides air, sea, road cargo and end to end freight logistics, all under a single roof. We started our services on 2015 ,now we have branches in five Emirates and also we have expanded it to Saudi Arabia.We have now 16 branches all over Saudi.\r\nIf it is a few pallets headed to the next city or several truckloads bound for distant destinations, businesses from every sector can count on EC Cargo to move their large and heavy cargo. We love getting to know our clients in order to customize service to meet their needs completely.	approved	5	0
30	Anil	navis	Almas	67e56e0d138bc_1743089165.png	67e56e0d150e8_1743089165.jpg	1	inactive	2025-03-27 19:26:05	2025-03-27 19:27:50	\N	58	67e56e0d14ef5_1743089165.jpg	We are world wide cargo delivery network that provides air, sea, road cargo and end to end freight logistics, all under a single roof. We started our services on 2015 ,now we have branches in five Emirates and also we have expanded it to Saudi Arabia.We have now 16 branches all over Saudi.\r\nIf it is a few pallets headed to the next city or several truckloads bound for distant destinations, businesses from every sector can count on EC Cargo to move their large and heavy cargo. We love getting to know our clients in order to customize service to meet their needs completely.	approved	5	0
31	Saman	Shah	Saman SHah	67e5a3ecb5db9_1743102956.jpg	67e5a3ecb7836_1743102956.jpg	1	inactive	2025-03-27 23:15:56	2025-03-27 23:15:56	\N	59	67e5a3ecb772b_1743102956.jpg	Shah has company	pending	5	0
32	Shamas	Kumar	Shamas Kumar	67e63cd01bd19_1743142096.jpg	67e63cd01d69c_1743142096.jpg	1	inactive	2025-03-28 10:08:16	2025-03-28 10:08:16	\N	61	67e63cd01d57e_1743142096.jpg	1985 1985	pending	5	0
33	Shamas	Kumar	Shamas Kumar	67e63d4e33f8d_1743142222.jpg	67e63d4e35659_1743142222.jpg	1	inactive	2025-03-28 10:10:22	2025-03-28 10:10:22	\N	62	67e63d4e3555d_1743142222.jpg	1985 1985	pending	5	0
34	Shamas	Kumar	Shamas Kumar	67e63d9992d3c_1743142297.jpg	67e63d9994407_1743142297.jpg	1	inactive	2025-03-28 10:11:37	2025-03-28 10:11:37	\N	63	67e63d999431b_1743142297.jpg	1985 1985	pending	5	0
35	Shamas	Kumar	Shamas Kumar	67e63e51a6afe_1743142481.jpg	67e63e51a82e6_1743142481.jpg	1	inactive	2025-03-28 10:14:41	2025-03-28 10:14:41	\N	64	67e63e51a81e5_1743142481.jpg	1985 1985	pending	5	0
37	Anil	Navis	Cargo Service	67e6676287d54_1743152994.png	67e66762894af_1743152994.jpg	1	inactive	2025-03-28 13:09:54	2025-03-28 13:33:04	\N	74	67e66762892e8_1743152994.jpg	We are world wide cargo delivery network that provides air, sea, road cargo and end to end freight logistics, all under a single roof. We started our services on 2015 ,now we have branches in five Emirates and also we have expanded it to Saudi Arabia.We have now 16 branches all over Saudi.\r\nIf it is a few pallets headed to the next city or several truckloads bound for distant destinations, businesses from every sector can count on EC Cargo to move their large and heavy cargo. We love getting to know our clients in order to customize service to meet their needs completely.	approved	5	0
36	Shamas	Mubarak	Shamas Mubarak	67e63fd2e7bf5_1743142866.jpg	67e63fd2e9298_1743142866.jpg	1	inactive	2025-03-28 10:21:06	2025-03-28 14:24:32	\N	65	67e63fd2e91a3_1743142866.jpg	Hello	approved	5	0
38	Habeebuddin	Huzaifa	DXB APPS	67e796a518d7b_1743230629.png	67e796a51a6ac_1743230629.png	1	inactive	2025-03-29 10:43:49	2025-03-29 10:43:49	\N	76	67e796a51a577_1743230629.png	fdfdf\r\nfdf	pending	5	0
40	Anil	Navis	Davis Movers	67ee22eaee724_1743659754.jpg	67ee22eaefeee_1743659754.jpg	1	inactive	2025-04-03 09:55:54	2025-04-03 09:55:54	\N	80	67ee22eaefddb_1743659754.jpg	Davis Movers Alpharetta, a registered moving company in Georgia with a presence in Alpharetta, is proud to have been serving North Atlanta and the surrounding areas for over a decade. Our sole purpose at Davis Movers Alphartta is to provide high-quality, fast-moving company services at affordable prices to everyone who moves into or away from the Alpharetta, GA area.\r\nOffering the best customer service is just as important as high-quality service. We’ve been in the moving business for nearly 30 years and our customers know us for our quality. We always ensure your move is done quickly and completely. Our commitment to excellence is at the heart of everything we do.	pending	5	0
39	Mack	John	Mack John	67ed679ad363b_1743611802.jpg	67ed679ad6eb6_1743611802.jpg	1	inactive	2025-04-02 20:36:42	2025-04-03 14:02:43	\N	79	67ed679ad6d85_1743611802.jpg	Hellp	approved	5	0
41	Anil	Navis	Navis Movers	67ee6879b2608_1743677561.jpg	67ee6879b3d19_1743677561.jpg	1	inactive	2025-04-03 14:52:41	2025-04-03 14:55:38	\N	81	67ee6879b3c11_1743677561.jpg	The company Navis Shipping was established in 2012. Our employees constantly strive to improve the process of transportation\r\nand determine the main trends of its development.\r\nThe results of such studies allow us to accurately predict the demand for certain segments of the transport market and, thus, to develop an appropriate set of measures to meet the transport needs of our customers	approved	5	0
42	Anil	Navis	Nacro Cargo	67eec2b98dd08_1743700665.jpg	67eec2b98f4e7_1743700665.jpg	1	inactive	2025-04-03 21:17:45	2025-04-03 21:19:17	\N	82	67eec2b98f3d5_1743700665.jpg	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \r\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	approved	5	0
43	InComplete	User	InComplete User	\N	67f1774d281c0_1743877965.jpg	1	inactive	2025-04-05 22:32:45	2025-04-05 22:32:45	\N	85	\N	\N	pending	5	0
44	InComplete	User	Complete User	67f18634b22aa_1743881780.jpg	67f177b38587a_1743878067.jpg	1	active	2025-04-05 22:34:27	2025-04-05 23:58:57	\N	86	67f18634b390f_1743881780.jpg	Hello world	approved	5	0
45	Anil	Navis	Navis Trasnport	67f35f2b150fb_1744002859.jpg	67f24b25111ec_1743932197.pdf	1	active	2025-04-06 13:36:37	2025-04-07 09:14:19	\N	87	67f35f2b165dd_1744002859.jpg	At Navis Trasnport, we pride ourselves on offering a full range of transportation, freight, customs clearance, and documentation services under one roof. From sea to sky, our dedicated team and state-of-the-art equipment are always ready	approved	5	0
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
22	23	1	\N	\N
23	22	1	\N	\N
24	22	5	\N	\N
25	24	4	\N	\N
26	24	3	\N	\N
27	24	2	\N	\N
28	24	1	\N	\N
29	24	5	\N	\N
30	24	7	\N	\N
31	24	6	\N	\N
32	25	4	\N	\N
33	26	4	\N	\N
34	26	3	\N	\N
35	27	4	\N	\N
36	22	7	\N	\N
37	28	4	\N	\N
38	28	3	\N	\N
39	28	2	\N	\N
40	28	1	\N	\N
41	28	7	\N	\N
42	29	4	\N	\N
43	29	3	\N	\N
44	29	2	\N	\N
45	29	1	\N	\N
46	29	7	\N	\N
47	29	6	\N	\N
48	30	4	\N	\N
49	30	3	\N	\N
50	30	2	\N	\N
51	30	1	\N	\N
52	30	5	\N	\N
53	30	7	\N	\N
54	30	6	\N	\N
55	29	5	\N	\N
56	28	5	\N	\N
57	28	6	\N	\N
58	31	4	\N	\N
59	31	2	\N	\N
60	31	6	\N	\N
61	32	4	\N	\N
62	32	2	\N	\N
63	32	1	\N	\N
64	33	4	\N	\N
65	33	2	\N	\N
66	33	1	\N	\N
67	34	4	\N	\N
68	34	2	\N	\N
69	34	1	\N	\N
70	35	4	\N	\N
71	35	2	\N	\N
72	35	1	\N	\N
73	36	4	\N	\N
74	36	3	\N	\N
75	36	2	\N	\N
76	37	4	\N	\N
77	37	3	\N	\N
78	37	2	\N	\N
79	37	1	\N	\N
80	37	5	\N	\N
81	37	7	\N	\N
82	37	6	\N	\N
83	38	4	\N	\N
84	39	4	\N	\N
85	39	3	\N	\N
86	39	2	\N	\N
87	39	1	\N	\N
88	39	5	\N	\N
89	39	7	\N	\N
90	39	6	\N	\N
91	40	4	\N	\N
92	40	1	\N	\N
93	41	3	\N	\N
94	42	3	\N	\N
95	44	4	\N	\N
96	44	2	\N	\N
97	44	1	\N	\N
98	45	3	\N	\N
99	45	1	\N	\N
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
-- Data for Name: contact_us; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_us (id, email, dial_code, phone, message, date, created_at, updated_at, name) FROM stdin;
1	james@gmail.com	+971	123455	same	\N	\N	\N	james
2	james@gmail.com	+971	123455	same	\N	\N	\N	james
3	james@gmail.com	+971	123455	same	\N	\N	\N	james
4	james@gmail.com	+971	123455	same	\N	\N	\N	james
5	james@gmail.com	+971	123455	same	\N	\N	\N	james
6	james@gmail.com	+971	123455	same	\N	\N	\N	james
7	james@gmail.com	+971	123455	same	\N	\N	\N	james
8	razahamid34@gmail.com	971	344156464	Hshshs	\N	\N	\N	hi
9	razahamid34@gmail.com	971	346464646	Shhsjs	\N	\N	\N	hhhd
10	razahamid34@gmail.com	971	344564646	Hshsh	\N	\N	\N	hamid
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
2	Saudi Arabia	966	KSA	en	1	2025-03-27 20:29:23	2025-03-27 20:29:40	\N
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
-- Data for Name: faq; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faq (id, active, title, title_ar, description_ar, description, created_by, updated_by, created_at, updated_at) FROM stdin;
1	1	What you need	What you need	What you need What you need	What you need What you need	1	1	\N	\N
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
-- Data for Name: manufacturers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.manufacturers (id, name, status, name_ar, logo, created_at, updated_at) FROM stdin;
1	Range Rover	1	sam		2025-03-24 12:06:53	2025-03-27 10:45:53
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
99	2024_05_10_102750_create_user_address_table	20
100	2025_03_14_092020_create_booking_vehicle_relocation	20
101	2025_03_14_133811_create_booking_item_delivery	20
102	2025_03_14_163227_create_booking_vehicle_recovery	20
103	2023_04_19_165705_add_password_reset_code_users_table	21
104	2023_04_19_165705_add_password_reset_time_users_table	22
105	2025_02_28_222021_create_vendor_messages_table	23
106	2025_01_23_081445_ad_admin_response_booking_table	24
107	2025_03_14_163227_create_manufacturers	25
108	2025_03_14_163227_create_vehicle_models	25
109	2025_03_14_163227_change_manufacturers	26
110	2025_03_14_163227_create_vehicle_types	27
111	2025_03_14_163227_create_faq	28
112	2025_03_25_163227_create_contact_us	29
113	2025_03_24_121121_add_name_column_to_contact_us_table	30
114	2025_03_24_121121_add_name_column_to_booking_storage_service	31
115	2025_03_24_121121_add_name_column_to_booking_item_delivery_table	32
116	2025_03_25_121121_add_temp_column_to_users_table	33
117	2025_03_25_163227_create_ratings	34
118	2025_03_25_121121_add_change_column_to_user_ratings_table	35
119	2025_03_25_163227_update_booking_qoutes	36
120	2025_03_25_163227_update_booking_qoutes_change	37
121	2025_03_25_163227_update_booking_qoutes_foriegn	38
122	2025_03_25_163227_update_booking_qoutes_foriegn_changes	39
123	2025_04_02_121121_stripe_customer_id_column_to_users_table	40
124	2025_03_25_163227_create_user_cards	41
125	2025_04_02_121121_profile_completed_column_to_users_table	41
126	2025_04_05_121121_card_saved_column_to_users_table	42
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
18	4	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b915e001_1743092625.png	active
19	5	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b91601e2_1743092625.png	active
20	6	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b916092d_1743092625.png	active
21	3	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b9160ff6_1743092625.png	active
22	15	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b916189f_1743092625.png	active
23	16	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b9161f19_1743092625.png	active
24	17	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b9162736_1743092625.png	active
25	19	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b9162e9b_1743092625.png	active
26	21	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b91639c1_1743092625.png	active
27	22	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b9164171_1743092625.png	active
28	7	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b91648fb_1743092625.png	active
29	12	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b9165121_1743092625.png	active
30	13	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b91658cb_1743092625.png	active
31	14	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b9166079_1743092625.png	active
32	23	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b916692b_1743092625.png	active
33	24	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b9167258_1743092625.png	active
34	25	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b9167912_1743092625.png	active
35	18	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b9167feb_1743092625.png	active
36	26	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b9168989_1743092625.png	active
37	20	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b91691be_1743092625.png	active
38	37	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b9169967_1743092625.png	active
39	31	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b916a0f3_1743092625.png	active
40	27	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b916a93e_1743092625.png	active
41	41	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b916b009_1743092625.png	active
42	43	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b916b7a0_1743092625.png	active
43	42	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b916bf40_1743092625.png	active
44	44	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b916c797_1743092625.png	active
45	45	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b916cf80_1743092625.png	active
46	56	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b916d6ab_1743092625.png	active
47	58	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b916dea6_1743092625.png	active
48	57	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b916e68d_1743092625.png	active
49	2	dfgdgd	\N	\N	\N	2025-03-27 20:23:45	2025-03-27 20:23:45	hi	67e57b916ee27_1743092625.png	active
50	4	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe8c687_1743129854.png	active
51	5	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe8e5a7_1743129854.png	active
52	6	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe8ed32_1743129854.png	active
53	3	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe8f497_1743129854.png	active
54	15	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe8fb9f_1743129854.png	active
55	16	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe90334_1743129854.png	active
56	17	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe90aac_1743129854.png	active
57	19	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe91203_1743129854.png	active
58	21	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe91948_1743129854.png	active
59	22	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe91fd6_1743129854.png	active
60	7	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe92777_1743129854.png	active
61	12	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe92ed6_1743129854.png	active
62	13	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe9362b_1743129854.png	active
63	14	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe93cc7_1743129854.png	active
64	23	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe94440_1743129854.png	active
65	24	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe94b67_1743129854.png	active
66	25	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe95366_1743129854.png	active
67	18	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe95a9e_1743129854.png	active
68	26	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe9655b_1743129854.png	active
69	20	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe96c8b_1743129854.png	active
70	37	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe9741f_1743129854.png	active
71	31	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe97c30_1743129854.png	active
72	27	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe9844e_1743129854.png	active
73	41	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe98bba_1743129854.png	active
74	43	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe993e2_1743129854.png	active
75	42	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe99b58_1743129854.png	active
76	44	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe9a276_1743129854.png	active
77	45	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe9aa14_1743129854.png	active
78	58	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe9b16f_1743129854.png	active
79	57	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe9b859_1743129854.png	active
80	56	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe9bf5b_1743129854.png	active
81	59	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe9c732_1743129854.png	active
82	2	hi	\N	\N	\N	2025-03-28 06:44:14	2025-03-28 06:44:14	hi	67e60cfe9ce4a_1743129854.png	active
83	3	Noti	\N	\N	\N	2025-03-29 10:50:46	2025-03-29 10:50:46	Test	67e7984692929_1743231046.png	active
84	3	Noti	\N	\N	\N	2025-03-29 10:51:05	2025-03-29 10:51:05	Test	67e79859e728d_1743231065.png	active
85	3	Noti	\N	\N	\N	2025-03-29 10:51:42	2025-03-29 10:51:42	Test	67e7987eb27d9_1743231102.png	active
86	3	Noti	\N	\N	\N	2025-03-29 10:53:08	2025-03-29 10:53:08	Test	67e798d430132_1743231188.png	active
87	13	Noti	\N	\N	\N	2025-03-29 10:53:08	2025-03-29 10:53:08	Test	67e798d432579_1743231188.png	active
88	32	Noti	\N	\N	\N	2025-03-29 10:53:08	2025-03-29 10:53:08	Test	67e798d433021_1743231188.png	active
89	3	Noti	\N	\N	\N	2025-03-29 10:53:27	2025-03-29 10:53:27	Test	67e798e71d3aa_1743231207.png	active
90	13	Noti	\N	\N	\N	2025-03-29 10:53:27	2025-03-29 10:53:27	Test	67e798e71f710_1743231207.png	active
91	32	Noti	\N	\N	\N	2025-03-29 10:53:27	2025-03-29 10:53:27	Test	67e798e7202d5_1743231207.png	active
92	3	Noti	\N	\N	\N	2025-03-29 10:59:45	2025-03-29 10:59:45	Test	67e79a61ec6ad_1743231585.png	active
93	13	Noti	\N	\N	\N	2025-03-29 10:59:45	2025-03-29 10:59:45	Test	67e79a61eea73_1743231585.png	active
94	32	Noti	\N	\N	\N	2025-03-29 10:59:45	2025-03-29 10:59:45	Test	67e79a61ef535_1743231585.png	active
95	40	Noti	\N	\N	\N	2025-03-29 10:59:46	2025-03-29 10:59:46	Test	67e79a62978fb_1743231586.png	active
96	34	Noti	\N	\N	\N	2025-03-29 10:59:47	2025-03-29 10:59:47	Test	67e79a63035f8_1743231587.png	active
97	37	Noti	\N	\N	\N	2025-03-29 10:59:47	2025-03-29 10:59:47	Test	67e79a635d012_1743231587.png	active
98	53	hello	\N	\N	\N	2025-03-29 11:08:28	2025-03-29 11:08:28	Public notification	67e79c6ce7901_1743232108.png	active
99	3	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:17	2025-03-29 11:16:17	📦 Move Smart with Moovzy! 🚛	67e79e419987b_1743232577.jpg	active
100	13	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:17	2025-03-29 11:16:17	📦 Move Smart with Moovzy! 🚛	67e79e419bb45_1743232577.jpg	active
101	32	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:17	2025-03-29 11:16:17	📦 Move Smart with Moovzy! 🚛	67e79e419c6fe_1743232577.jpg	active
102	40	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:18	2025-03-29 11:16:18	📦 Move Smart with Moovzy! 🚛	67e79e4236f39_1743232578.jpg	active
103	34	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:18	2025-03-29 11:16:18	📦 Move Smart with Moovzy! 🚛	67e79e4291ccc_1743232578.jpg	active
104	37	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:18	2025-03-29 11:16:18	📦 Move Smart with Moovzy! 🚛	67e79e42e5790_1743232578.jpg	active
105	31	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:19	2025-03-29 11:16:19	📦 Move Smart with Moovzy! 🚛	67e79e43548dd_1743232579.jpg	active
106	66	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:19	2025-03-29 11:16:19	📦 Move Smart with Moovzy! 🚛	67e79e43b3f0f_1743232579.jpg	active
107	29	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:20	2025-03-29 11:16:20	📦 Move Smart with Moovzy! 🚛	67e79e4420c55_1743232580.jpg	active
108	33	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:20	2025-03-29 11:16:20	📦 Move Smart with Moovzy! 🚛	67e79e4477b8d_1743232580.jpg	active
109	67	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:20	2025-03-29 11:16:20	📦 Move Smart with Moovzy! 🚛	67e79e44eac0d_1743232580.jpg	active
110	36	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:21	2025-03-29 11:16:21	📦 Move Smart with Moovzy! 🚛	67e79e4550d9e_1743232581.jpg	active
111	68	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:21	2025-03-29 11:16:21	📦 Move Smart with Moovzy! 🚛	67e79e45defad_1743232581.jpg	active
112	69	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:22	2025-03-29 11:16:22	📦 Move Smart with Moovzy! 🚛	67e79e4647920_1743232582.jpg	active
113	45	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:22	2025-03-29 11:16:22	📦 Move Smart with Moovzy! 🚛	67e79e46aacb5_1743232582.jpg	active
114	50	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:23	2025-03-29 11:16:23	📦 Move Smart with Moovzy! 🚛	67e79e4748296_1743232583.jpg	active
115	46	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:23	2025-03-29 11:16:23	📦 Move Smart with Moovzy! 🚛	67e79e47e03e5_1743232583.jpg	active
116	47	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:24	2025-03-29 11:16:24	📦 Move Smart with Moovzy! 🚛	67e79e487da10_1743232584.jpg	active
117	55	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:25	2025-03-29 11:16:25	📦 Move Smart with Moovzy! 🚛	67e79e4917b0b_1743232585.jpg	active
118	48	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:25	2025-03-29 11:16:25	📦 Move Smart with Moovzy! 🚛	67e79e49ab44d_1743232585.jpg	active
119	2	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:26	2025-03-29 11:16:26	📦 Move Smart with Moovzy! 🚛	67e79e4a252c3_1743232586.jpg	active
120	49	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:26	2025-03-29 11:16:26	📦 Move Smart with Moovzy! 🚛	67e79e4a2618c_1743232586.jpg	active
121	60	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:26	2025-03-29 11:16:26	📦 Move Smart with Moovzy! 🚛	67e79e4aa6365_1743232586.jpg	active
122	53	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:27	2025-03-29 11:16:27	📦 Move Smart with Moovzy! 🚛	67e79e4b5587c_1743232587.jpg	active
123	70	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:27	2025-03-29 11:16:27	📦 Move Smart with Moovzy! 🚛	67e79e4bcfd29_1743232587.jpg	active
124	73	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:28	2025-03-29 11:16:28	📦 Move Smart with Moovzy! 🚛	67e79e4c537a5_1743232588.jpg	active
125	71	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:28	2025-03-29 11:16:28	📦 Move Smart with Moovzy! 🚛	67e79e4cd0793_1743232588.jpg	active
126	54	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:29	2025-03-29 11:16:29	📦 Move Smart with Moovzy! 🚛	67e79e4d4e0ea_1743232589.jpg	active
127	75	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:29	2025-03-29 11:16:29	📦 Move Smart with Moovzy! 🚛	67e79e4dd3776_1743232589.jpg	active
128	72	📦 Move Smart with Moovzy! 🚛 \r\n\r\nRelocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified movers in the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 11:16:30	2025-03-29 11:16:30	📦 Move Smart with Moovzy! 🚛	67e79e4e5da75_1743232590.jpg	active
129	40	Hello	\N	\N	\N	2025-03-29 11:58:23	2025-03-29 11:58:23	Congrats	67e7a81ff0e08_1743235103.png	active
130	34	Hello	\N	\N	\N	2025-03-29 11:58:24	2025-03-29 11:58:24	Congrats	67e7a8209ad21_1743235104.png	active
131	37	Hello	\N	\N	\N	2025-03-29 11:58:24	2025-03-29 11:58:24	Congrats	67e7a820ed06a_1743235104.png	active
132	31	Hello	\N	\N	\N	2025-03-29 11:58:25	2025-03-29 11:58:25	Congrats	67e7a82154eac_1743235105.png	active
133	33	Hello	\N	\N	\N	2025-03-29 11:58:25	2025-03-29 11:58:25	Congrats	67e7a821b26d2_1743235105.png	active
134	48	Hello	\N	\N	\N	2025-03-29 11:58:26	2025-03-29 11:58:26	Congrats	67e7a8222297f_1743235106.png	active
135	53	Hello	\N	\N	\N	2025-03-29 11:58:26	2025-03-29 11:58:26	Congrats	67e7a8227cc63_1743235106.png	active
136	66	done	\N	\N	\N	2025-03-29 12:00:51	2025-03-29 12:00:51	hello	67e7a8b3a7205_1743235251.png	active
137	71	done	\N	\N	\N	2025-03-29 12:00:52	2025-03-29 12:00:52	hello	67e7a8b4449df_1743235252.png	active
138	53	Relocating your home or office? Need storage? 🏠🏢 We make it simple!  \r\n\r\nWith the Moovzy App, send a request and get free quotes from top verified moversin the UAE. 📲 Compare prices, choose the best deal, and move stress-free!  \r\n\r\n✅ Hassle-free relocation  \r\n✅ Trusted moving companies  \r\n✅ Multiple quotes to fit your budget	\N	\N	\N	2025-03-29 12:04:56	2025-03-29 12:04:56	📦 Move Smart with Moovzy! 🚛	67e7a9a815c7e_1743235496.jpg	active
139	54	asdad	\N	\N	\N	2025-03-31 11:56:07	2025-03-31 11:56:07	sd	67ea4a9727de6_1743407767.png	active
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
3	Terms & Conditions	1	terms-and-conditions	<p>&quot;Please read these terms and conditions carefully before using Our Service.&quot;<br />\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&nbsp;<br />\r\n&nbsp;Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	\N	\N	\N	en	2025-01-24 11:37:51	2025-03-26 21:50:56
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
13	App\\Models\\User	30	Personal Access Token	d5d8aad9ec5d2c1a4a93324826d11f52a8776c3eaec6be5e1270b15ec5a6f13c	["*"]	\N	2025-03-12 23:56:35	2025-03-12 23:56:35
14	App\\Models\\User	30	Personal Access Token	dcc1f6fa40cd2de16df99b8f1fcd1c6efe85f7ac52b2b71a1ddcd14e47134926	["*"]	\N	2025-03-12 23:56:35	2025-03-12 23:56:35
15	App\\Models\\User	31	Personal Access Token	8835ad4b9b3e8eedec530642114aa6353be30403485720e58e64d9783026cf20	["*"]	\N	2025-03-13 00:49:41	2025-03-13 00:49:41
16	App\\Models\\User	31	Personal Access Token	db529579fe5376ac861f12e1a39aa45275f8c0c980f3df7fe7e9d66a2dedea2b	["*"]	\N	2025-03-13 00:49:42	2025-03-13 00:49:42
143	App\\Models\\User	75	Personal Access Token	ee66b8ab244d4617f33701ab9d01da5f6a346a4024aea7d966d4741fd774bc33	["*"]	\N	2025-04-03 19:06:20	2025-04-03 19:06:20
146	App\\Models\\User	84	Personal Access Token	fe93201e244c565c4a82e043ac432bdf103c287cb6295e7d03dbb79cea97ddbf	["*"]	\N	2025-04-03 23:13:31	2025-04-03 23:13:31
147	App\\Models\\User	84	Personal Access Token	962ddb10ab614949b8d9ee25d204c2d1cc9e8bc6ec6e2584751625e65b7f6559	["*"]	\N	2025-04-03 23:13:31	2025-04-03 23:13:31
20	App\\Models\\User	32	Personal Access Token	bc17f71d05d2bca91599366d4e2904caddde85a49fdc5980db581718e2449720	["*"]	\N	2025-03-15 10:29:49	2025-03-15 10:29:49
21	App\\Models\\User	33	Personal Access Token	07485ccde122fb29defca282d0111bc08cb5f1d5b5fc164a4794420f99205458	["*"]	\N	2025-03-21 14:27:44	2025-03-21 14:27:44
22	App\\Models\\User	33	Personal Access Token	a8158560cd7be5adbfb9fa170d3d3bd7d8db192a1a139fa5734ae886f9349c87	["*"]	\N	2025-03-21 14:27:44	2025-03-21 14:27:44
23	App\\Models\\User	34	Personal Access Token	7928d830412d90c83851140987c989a53e68b9f13c6fd5a275e16b5bfde43bc5	["*"]	\N	2025-03-22 03:04:17	2025-03-22 03:04:17
24	App\\Models\\User	34	Personal Access Token	0f81d9a36e200c6fbd5ded7506dff11b4029ec4144b2cd62ca99ffe58cd06e77	["*"]	\N	2025-03-22 03:04:18	2025-03-22 03:04:18
27	App\\Models\\User	36	Personal Access Token	653bc7290e0470675df3ec4df7322162e481ff5b9911561fe095dc9a23e9dff5	["*"]	\N	2025-03-24 11:18:51	2025-03-24 11:18:51
28	App\\Models\\User	36	Personal Access Token	baa2d7936640a0e554fd799c409a91192e3436f6fce14a92e235f9e6b9a61519	["*"]	\N	2025-03-24 11:18:51	2025-03-24 11:18:51
29	App\\Models\\User	37	Personal Access Token	460648cdea23dadde462a590b3fa10b93e93995f759d794fcdf237b1f240f83b	["*"]	\N	2025-03-24 11:43:19	2025-03-24 11:43:19
30	App\\Models\\User	37	Personal Access Token	e85f7624f285999a4af8fed4ef0c22c70b3f8910488b66fc11ad8c92f663fcae	["*"]	\N	2025-03-24 11:43:20	2025-03-24 11:43:20
33	App\\Models\\User	39	Personal Access Token	859be1519d7efef79e912cac0afdf6182b821ae39043ecb5de54e80b33ccf829	["*"]	\N	2025-03-26 07:31:00	2025-03-26 07:31:00
34	App\\Models\\User	39	Personal Access Token	07d0b56636cb64483993e6fd653a45b8242868f8bc1b279775ae2924410458a9	["*"]	\N	2025-03-26 07:31:01	2025-03-26 07:31:01
35	App\\Models\\User	40	Personal Access Token	1012b9721ed640e21cc2573a1c0c66ce3f5ffe304cdba3e205ad80010c8d73cb	["*"]	\N	2025-03-26 10:15:01	2025-03-26 10:15:01
36	App\\Models\\User	40	Personal Access Token	e9c3124931ae26579e2614fec1d2f94fe390e13599dffd9f56cb121e0d99f575	["*"]	\N	2025-03-26 10:15:01	2025-03-26 10:15:01
37	App\\Models\\User	45	Personal Access Token	a13b4a18a2d7ddc7d8c17f01684be138d91d9b08b490b00ec5649589466ab580	["*"]	\N	2025-03-26 13:00:45	2025-03-26 13:00:45
38	App\\Models\\User	45	Personal Access Token	57a066b7860f4f72e0f679f84fb6ae2010cd04d5ffe5269d8199825fc30283a4	["*"]	\N	2025-03-26 13:00:46	2025-03-26 13:00:46
39	App\\Models\\User	46	Personal Access Token	8c3195348840dfa0a78f6f23a15c08c3c02790e5a7d1f82b02f0da1d301cae55	["*"]	\N	2025-03-26 13:46:53	2025-03-26 13:46:53
40	App\\Models\\User	46	Personal Access Token	e1a38a4a3d8894f4067f144f04cecae716564589f73368a50cbf42b4e148c610	["*"]	\N	2025-03-26 13:46:53	2025-03-26 13:46:53
41	App\\Models\\User	47	Personal Access Token	7140a8db46107709619dc8cfa3290798c3be1776e66486b2c0a122fc141d47d5	["*"]	\N	2025-03-26 13:50:57	2025-03-26 13:50:57
42	App\\Models\\User	47	Personal Access Token	1fa71ac075f38f87a364fd8d20aa47acb10b71024a45d52f44a4112a7e23e181	["*"]	\N	2025-03-26 13:50:58	2025-03-26 13:50:58
54	App\\Models\\User	38	Personal Access Token	0df5d12e969260061c1488e1ef229863862e3ed8c59a6a804f108910fef9f4e9	["*"]	\N	2025-03-26 19:42:35	2025-03-26 19:42:35
57	App\\Models\\User	50	Personal Access Token	bb84a781e0ed15c1e0aa931e3da0cfee7f6cc69042a70df7ecf6a301941a7114	["*"]	\N	2025-03-27 01:21:15	2025-03-27 01:21:15
58	App\\Models\\User	50	Personal Access Token	701e11b1d0e10fe441ffd5881121f8bcef654a40d9b2fedd081b7e9ab618ecfb	["*"]	\N	2025-03-27 01:21:16	2025-03-27 01:21:16
63	App\\Models\\User	35	Personal Access Token	ace8b8e2a27401bc37a18d53b686737cc39bd00c315236dc7ebc3582e1b8461b	["*"]	\N	2025-03-27 11:32:45	2025-03-27 11:32:45
64	App\\Models\\User	51	Personal Access Token	f5ce4b0d405b134e2b59e59f20e8442f7967982ab66f782cf06034900e005747	["*"]	\N	2025-03-27 11:37:28	2025-03-27 11:37:28
65	App\\Models\\User	51	Personal Access Token	0ab750bd2b133c6d1b40636e4ee84131626a70ce1275b4f34f65e2d61d298171	["*"]	\N	2025-03-27 11:37:28	2025-03-27 11:37:28
144	App\\Models\\User	83	Personal Access Token	ca5cbdd9568fea3481479ed10fbe1e92be1c2b6bf23cfe64645e397b74e28f86	["*"]	\N	2025-04-03 22:59:44	2025-04-03 22:59:44
145	App\\Models\\User	83	Personal Access Token	7db617768950e9aa7d8ea489c226bd1d7e910d2762a73c6577aa96559faa3261	["*"]	\N	2025-04-03 22:59:45	2025-04-03 22:59:45
86	App\\Models\\User	37	Personal Access Token	27f669086e161fc93f762be0a78a4e79eb27a725d6735d6aa72738d16fb2cd66	["*"]	\N	2025-03-27 12:52:20	2025-03-27 12:52:20
87	App\\Models\\User	37	Personal Access Token	19752c963ebb624a6e2742475a6cb79bdf401a351216964d15104268e586e2fb	["*"]	\N	2025-03-27 12:52:24	2025-03-27 12:52:24
88	App\\Models\\User	37	Personal Access Token	d2b73787560e463b8932ef4ff61d60f12c63d4b39998783924c3719261f0780e	["*"]	\N	2025-03-27 12:54:18	2025-03-27 12:54:18
89	App\\Models\\User	37	Personal Access Token	24540be8f93b263752bc7e42b41a8fec672a42e9f85954308a013fb425772e7b	["*"]	\N	2025-03-27 12:54:25	2025-03-27 12:54:25
90	App\\Models\\User	52	Personal Access Token	25ee2d61a63cd02bdd64ded7862881d14ed879d10621513d08ecc9997c40e108	["*"]	\N	2025-03-27 12:56:40	2025-03-27 12:56:40
96	App\\Models\\User	55	Personal Access Token	2dfe495d17d8012d48e6da9fa4d399ec7686a2029e7a28c3ebf01b7ea71d464a	["*"]	\N	2025-03-27 14:02:40	2025-03-27 14:02:40
97	App\\Models\\User	55	Personal Access Token	af9ad056454f98f7e1908dc06d182f10d6a58a74f0f35ac2e5a8fef771e6af15	["*"]	\N	2025-03-27 14:02:40	2025-03-27 14:02:40
102	App\\Models\\User	48	Personal Access Token	9241335df3398bde2de57c54ee70a43dd4b9973455e9dc0a25d8f80d8ec31b89	["*"]	\N	2025-03-27 16:34:36	2025-03-27 16:34:36
104	App\\Models\\User	36	Personal Access Token	afbd4a1c9764ddc738404f1e2931e79b51c20910ab835e61c399591d8f3bff96	["*"]	\N	2025-03-27 19:48:54	2025-03-27 19:48:54
107	App\\Models\\User	49	Personal Access Token	0949a951e4ff13e93c44e317393e812a5ae75ab84bf1d04d1e1ecedf02c82129	["*"]	\N	2025-03-27 20:29:47	2025-03-27 20:29:47
110	App\\Models\\User	60	Personal Access Token	e9ba3b7f4d613441141e6c77baa9d457fa2a02c7344033ff62e312f8be5a3e85	["*"]	\N	2025-03-28 08:27:45	2025-03-28 08:27:45
111	App\\Models\\User	60	Personal Access Token	78dd0a4069937dea0279f045248fac384dc45482384ccf635e00eb0c22043bb6	["*"]	\N	2025-03-28 08:27:45	2025-03-28 08:27:45
112	App\\Models\\User	66	Personal Access Token	4004329c29ebd2e8c0bf524ab5c0c95106c2ee4ae82127a0a3f827a84a0b54c4	["*"]	\N	2025-03-28 10:34:47	2025-03-28 10:34:47
113	App\\Models\\User	66	Personal Access Token	01486851d712a58159fdd91f7a273f9239f07a0ca2465c9ced16054f7dc48507	["*"]	\N	2025-03-28 10:34:48	2025-03-28 10:34:48
114	App\\Models\\User	67	Personal Access Token	14efb683c5f90a0ada11faf5d733fbc1d45356969e43b4d28174a3b944e292f7	["*"]	\N	2025-03-28 10:45:12	2025-03-28 10:45:12
115	App\\Models\\User	67	Personal Access Token	dc98bb385e401a836bc986e9ccb3681ec4f41639ddff49ef922d43cd4c9fe7c0	["*"]	\N	2025-03-28 10:45:12	2025-03-28 10:45:12
116	App\\Models\\User	68	Personal Access Token	46602775ed09e52225eaa6550be7e4b33f253e50240030f503298c0157260f33	["*"]	\N	2025-03-28 10:57:40	2025-03-28 10:57:40
117	App\\Models\\User	68	Personal Access Token	632e022d2aeb85fe2e07215ed5868b8992729a1eed47e34d95d504376e8f92d2	["*"]	\N	2025-03-28 10:57:40	2025-03-28 10:57:40
118	App\\Models\\User	69	Personal Access Token	b7b07d0ea06ddbc6bf38acfc8a29e8ef7ef4cf6af72fda2087a1663c64f093f2	["*"]	\N	2025-03-28 10:58:51	2025-03-28 10:58:51
119	App\\Models\\User	69	Personal Access Token	7d7b5af69b4b1d529e60ea5feee8019e6b3cc6bad3ea66a64d36125b8f813823	["*"]	\N	2025-03-28 10:58:51	2025-03-28 10:58:51
120	App\\Models\\User	70	Personal Access Token	e08c8a2d9b1b4be8ab9f1c26e34714e937ef8aed99c6180695bf01884479de80	["*"]	\N	2025-03-28 11:15:47	2025-03-28 11:15:47
121	App\\Models\\User	70	Personal Access Token	3c9789dea8dbe9f351ed0d199d3f9cf1bd4f1ec913aed67c73cb9865daa4921c	["*"]	\N	2025-03-28 11:15:48	2025-03-28 11:15:48
122	App\\Models\\User	71	Personal Access Token	f3872a5c19f4ab2609ed6d4e0c56b58caab99d00827c4051fd3996b663fdbd29	["*"]	\N	2025-03-28 12:39:25	2025-03-28 12:39:25
123	App\\Models\\User	71	Personal Access Token	0af60d0caa3961a4ed4c62b805e78024636ba7f32d996ee8260170e9fa62f8fc	["*"]	\N	2025-03-28 12:39:25	2025-03-28 12:39:25
124	App\\Models\\User	71	Personal Access Token	34f3d65b1302aec13c5061dca1958bc255adef1259fa1c8983e6face73280b77	["*"]	\N	2025-03-28 12:52:59	2025-03-28 12:52:59
125	App\\Models\\User	71	Personal Access Token	07f247730c17f511dc5ed430c6343b6eee6c05c36af476b46707d7390f22edc3	["*"]	\N	2025-03-28 12:52:59	2025-03-28 12:52:59
126	App\\Models\\User	72	Personal Access Token	26c25bb082d43198cc7d1e63189a5e6e875149b1e33ee6858f890774c12d8a17	["*"]	\N	2025-03-28 12:56:35	2025-03-28 12:56:35
127	App\\Models\\User	72	Personal Access Token	6e100a0aa2b133ec74ac357a315d98d6344997741f55d8c369b848dc599fd31c	["*"]	\N	2025-03-28 12:56:36	2025-03-28 12:56:36
128	App\\Models\\User	72	Personal Access Token	b5ab2d06ff6b918827c1bee40ef49ab7b05a27d8201e164bddbbde72620ccfd2	["*"]	\N	2025-03-28 12:58:03	2025-03-28 12:58:03
129	App\\Models\\User	72	Personal Access Token	103ab24b95ed8a4f560a299cff2a81e7c1ab803293e6007a60ddc5e01f7f1052	["*"]	\N	2025-03-28 12:58:04	2025-03-28 12:58:04
130	App\\Models\\User	73	Personal Access Token	a1cbaa93f15b93e5cfca5a2811677a28718860eeb84d577e57f0ce65292482bc	["*"]	\N	2025-03-28 13:03:11	2025-03-28 13:03:11
131	App\\Models\\User	73	Personal Access Token	91d62051ea60323b4d2c77ac0134c01a481660ab1e19f4b8beb77f28fc2a6bea	["*"]	\N	2025-03-28 13:03:11	2025-03-28 13:03:11
134	App\\Models\\User	75	Personal Access Token	7a1784f126ea5b6aa7b8f084b612feb681f35e712a493d3464ad75e73795778c	["*"]	\N	2025-03-29 10:23:32	2025-03-29 10:23:32
135	App\\Models\\User	75	Personal Access Token	9815d569b1d0cc0b3a255fb7bd4a09303c8ba06b3efc4b925545b0c609127267	["*"]	\N	2025-03-29 10:23:32	2025-03-29 10:23:32
136	App\\Models\\User	53	Personal Access Token	5ddaac6a707bcc4b7b016ea9f4f3861fbbd87b8541f7ff63777fdc3af4bbac0b	["*"]	\N	2025-03-29 11:05:49	2025-03-29 11:05:49
137	App\\Models\\User	75	Personal Access Token	b1482715522aa586bed42ecaa6de58784a76eb911df273bdd8925dfb259bc9d3	["*"]	\N	2025-03-29 18:07:14	2025-03-29 18:07:14
138	App\\Models\\User	77	Personal Access Token	96c6041c46b03b593d9c352a93910bb90029173432aa426d60befa4b4a1d46a8	["*"]	\N	2025-03-29 18:20:27	2025-03-29 18:20:27
139	App\\Models\\User	77	Personal Access Token	357863c8fa0f36740c847d9f4d3d2b0ed4c29bcfeb9b49df1a43ca316eeeceb0	["*"]	\N	2025-03-29 18:20:28	2025-03-29 18:20:28
140	App\\Models\\User	77	Personal Access Token	18c0e29abfbfefb7554145ab6719f068f06dd56f498d81c697c8527317673d05	["*"]	\N	2025-03-30 01:59:47	2025-03-30 01:59:47
142	App\\Models\\User	54	Personal Access Token	688d8ac9970ac9fbb90ca612df6b93d8bf24f65285a9c1294571d4a869e3a509	["*"]	\N	2025-04-03 16:45:02	2025-04-03 16:45:02
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
1	ANIL NAVIS	anil@dxbusinessgroup.com	971	5466494664	0	1	1	$2y$10$do8ct.Tfoh9/ClPEcxkUR.ajH4HIzilwngVMpOFHrpEHPSIhdC9Mm	2025-03-27 11:37:24	2	ANIL	NAVIS	\N	1111	1111	dbAmphmfQ5qdWh0pQkQX0i:APA91bFd07abtSg6Fo2XybQenXMqoutF6VoW8rJlSjrIKNV1yT9Rq0MMXzGfFXlq8mG4Oh_hFzNl14AgjRb-QW716s5uuhgkvTROkx1xIYUyJYJP8izsUYI	android	\N	\N		\N	2025-03-27 11:37:24	2025-03-27 11:37:24
3	Hamid Iqbal	hamidiqbalgoraya@gmail.com	971	3441562554	0	1	1	password	2025-03-27 13:41:30	2	Hamid	Iqbal	\N	1111	1111	ejDkSWx7TFymUVQ4hTwZ_f:APA91bEI7vZVp-TI-BcKu7V6Ci3cANn0U70d--xOUFlyd2DTOIJeiM-01RYAQHap1YTS5KMQPLB97ea3QR-6vvRAZ9cn0XGuzudS9eYcM4IiAcZ2Vt-C4g0	android	\N	\N		\N	2025-03-27 13:41:30	2025-03-27 13:41:30
2	anil navis	anilnavis@gmail.com	971	5464664946	0	1	1	password	2025-03-27 13:55:57	2	anil	navis	\N	1111	1111	dbAmphmfQ5qdWh0pQkQX0i:APA91bFd07abtSg6Fo2XybQenXMqoutF6VoW8rJlSjrIKNV1yT9Rq0MMXzGfFXlq8mG4Oh_hFzNl14AgjRb-QW716s5uuhgkvTROkx1xIYUyJYJP8izsUYI	android	\N	\N		\N	2025-03-27 11:51:32	2025-03-27 13:55:57
4	Anil Navisnormal	anil@anil.com	971	559888888	0	1	1	$2y$10$x5x0YmVwjQMuZoDb62oNJuf5hY5G31C8kw.tuzOovSuNdGYPP6FWO	2025-03-27 13:57:56	2	Anil	Navisnormal	\N	1111	1111	dbAmphmfQ5qdWh0pQkQX0i:APA91bFd07abtSg6Fo2XybQenXMqoutF6VoW8rJlSjrIKNV1yT9Rq0MMXzGfFXlq8mG4Oh_hFzNl14AgjRb-QW716s5uuhgkvTROkx1xIYUyJYJP8izsUYI	android	\N	\N		\N	2025-03-27 13:57:56	2025-03-27 13:57:56
5	anil individual	anilind@anilind.com	971	555555585	0	1	1	$2y$10$dKEmMToWBRC7WeKL92cvN.1m4ye3gq7kKXhGmfiz0kEiRsAertcnq	2025-03-27 14:02:35	2	anil	individual	\N	1111	1111	dbAmphmfQ5qdWh0pQkQX0i:APA91bFd07abtSg6Fo2XybQenXMqoutF6VoW8rJlSjrIKNV1yT9Rq0MMXzGfFXlq8mG4Oh_hFzNl14AgjRb-QW716s5uuhgkvTROkx1xIYUyJYJP8izsUYI	android	\N	\N		\N	2025-03-27 14:02:35	2025-03-27 14:02:35
6	Rakesh kumar	binshambrs@gmail.com	971	564005096	0	1	1	$2y$10$YAXN0OvJiCX9wHExVTjtsO1gAdp/VmpMwue3ujfE3tTzUO.nLCulq	2025-03-28 08:27:35	2	Rakesh	kumar	\N	1111	1111	fjgFGev_S5eBuhTj0nN3NP:APA91bG89vgkt9Tdqxuab02MKeHB8hrIOdjsjR02LNnkLilD3DEixP_AME0Z5wYRp5OJPk8e0auoOoj7CeAOkUadOMgiSMHuBAwBT1uA0c0ePWehEquxedA	android	\N	\N		\N	2025-03-28 08:27:36	2025-03-28 08:27:36
7	rusvin 123 k	sa1@1.com	971	16666	0	1	1	$2y$10$.tfUnQJdsy4GxO/4qXF4H.3WGhsUdQ8bzKLRGaTuQJOWNUIfcb0BO	2025-03-28 10:34:02	2	rusvin 123	k	\N	1111	1111	123123	android	\N	\N	uploads/trade_licenses/Bk9vNG3t3fWNWOcD8xfdbjkO4uEr5pUVsvZQCDmH.jpg	\N	2025-03-28 10:34:02	2025-03-28 10:34:02
8	rusvin 123 k	sa1+1@1.com	971	166667	0	1	1	$2y$10$/fFdEFKrUi0LmwRfGJ40BezkV1Z/PldH/Eu0PbOOy2C/SaWgRwCoe	2025-03-28 10:45:04	2	rusvin 123	k	\N	1111	1111	123123	android	\N	\N	uploads/trade_licenses/5fH86C1BADDfcoRUPsKvFEChL3EGHKtUV65Vdjym.jpg	\N	2025-03-28 10:45:04	2025-03-28 10:45:04
9	rusvin 123 k	sa1+3@1.com	971	166663	0	1	1	$2y$10$oVMtIC1JC.GDtFtkMRFJDeN2lla0v60VT9Y49LxrUzspAcixLdPkS	2025-03-28 10:58:18	2	rusvin 123	k	\N	1111	1111	123123	android	\N	\N	uploads/trade_licenses/b6r9JzMLkNnP6QUDqYfZlxaf1Cyxpo7l2ippgMsw.jpg	\N	2025-03-28 10:57:31	2025-03-28 10:58:18
10	Anil Ab	abinmobiria@gmail.com	971	566868966	0	1	1	$2y$10$Q5xLtgBcc46CDnc.j/mu8ehkeLdIdEtuXYdciuwupQ0xDNE9Dl7ZS	2025-03-28 11:15:43	2	Anil	Ab	\N	1111	1111	dlqwVBR6TTapFxpv0SQ0sz:APA91bGR6A_4IUpLfpfxVDZgu38aBGp360o6W8wCfjY6NjqIA6xwVHJ3_RAZKr9z8zWznpmtfmNS9oqgKLFjVLkpggm9yC6d72D9hhgrexelqm9UcXwdLTk	android	\N	\N		\N	2025-03-28 11:15:43	2025-03-28 11:15:43
11	rusvin 123 k	sa1+5@1.com	971	166665	0	1	1	$2y$10$huB8Vl/Jcegp5.Zdpf1Uu.tVyriT7DYUgr/rSC2KJ5TXnXgDzgCH.	2025-03-28 12:56:24	2	rusvin 123	k	\N	1111	1111	123123	android	\N	\N	uploads/trade_licenses/oaC2CFS0GLIUZoWw3VlFPq0JnyhlES65t9xiI5pj.jpg	\N	2025-03-28 12:39:09	2025-03-28 12:56:24
12	Anil Navis	abc@abc.com	971	5466464949	0	1	1	$2y$10$vxzSWgIfCoy9zW/4.CJ9AOoXiC7I8d8TurGNkSwfhirazkokH6nJW	2025-03-28 13:03:07	2	Anil	Navis	\N	1111	1111	dlqwVBR6TTapFxpv0SQ0sz:APA91bGR6A_4IUpLfpfxVDZgu38aBGp360o6W8wCfjY6NjqIA6xwVHJ3_RAZKr9z8zWznpmtfmNS9oqgKLFjVLkpggm9yC6d72D9hhgrexelqm9UcXwdLTk	android	\N	\N		\N	2025-03-28 13:03:07	2025-03-28 13:03:07
13	Usama Shakeel	ushakeel@gmail.com	971	123123123	0	1	1	$2y$10$XLllD.Y52asl1mUvu5hW0eG5RkGF5.SdK5BOcswPqyu8tb83vx7C.	2025-03-29 10:23:28	2	Usama	Shakeel	\N	1111	1111	ctAOrTGwSPqG6bXYd_HPbV:APA91bGMS3W-qdS9SBEYSqknL6ym3Jrsw7xTNiMj2HymWSb3oXyNaXvi3_rEq8aNWgWl8bmiI5iiyJjMUX-UmAIe7h2X47pYuAYJRmLq_775UDZP6vPLWzY	android	\N	\N		\N	2025-03-29 10:23:28	2025-03-29 10:23:28
14	Usama Shakeel	ushakeel@ymail.com	971	124124124	0	1	1	$2y$10$smZqNapd0XkjN9oFC/Y5SOsFn.//QhoGcn0jGdt44GbghaXglKyvW	2025-03-29 18:20:23	2	Usama	Shakeel	\N	1111	1111	dL4O8rizTs6q5DkB7Ah0Lo:APA91bHst2oZsrXRsnKZzROxVkULeyVEar5hcIDwQcZxpCZHXB8miXrALolIlj8v74wc9rSrr6YBsKrbTNzdobpIyaxQyp_OLslAhlvjsW0L-Gq9S-_mrVI	android	\N	\N		\N	2025-03-29 18:20:23	2025-03-29 18:20:23
15	Lutfie Alhashimi	dhdhdh@hdjdjdj.com	971	504113314	0	1	1	$2y$10$WQjdENySPrje5GnrT2AQKueTDzqmmvyQ8C/8ReQ/yte4Z5zqdWheG	2025-04-03 23:13:26	2	Lutfie	Alhashimi	\N	1111	1111	dg_4LY5OQ1i7vgoOhwM--u:APA91bHXReRtFgFGYBHNqs9CFD4gebh84hYLW9kV1jB2rZaDQzSYn6TPX_JfLGsldKWBUIUhbcEs3k3tUMktWDl-Hf7ZCkeTokPintFcCE-vi-oWsSEHvKE	android	\N	\N		\N	2025-04-03 22:30:00	2025-04-03 23:13:26
\.


--
-- Data for Name: truck_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.truck_types (id, truck_type, dimensions, icon, status, created_at, updated_at, max_weight_in_tons) FROM stdin;
\.


--
-- Data for Name: user_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_address (id, user_id, full_name, dial_code, phone, email, address, address_type, status, is_default, land_mark, building_name, latitude, longitude, location, message, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_cards (id, stripe_customer_id, card_number, user_id, is_default, created_at, updated_at) FROM stdin;
2	tok_1RAb3dRwhoKMBfqcNxV0Onwe	xxxxxxxxxxxx4242	82	1	2025-04-05 22:03:05	2025-04-05 22:03:25
3	tok_1RAb5rRwhoKMBfqce9pVIagu	xxxxxxxxxxxx4242	82	0	2025-04-05 22:05:24	2025-04-05 22:05:24
4	tok_1RAccoRwhoKMBfqceT68fJ4U	xxxxxxxxxxxx4242	86	1	2025-04-05 23:43:31	2025-04-05 23:43:31
5	tok_1RB9NIRwhoKMBfqc3yHSn4hJ	xxxxxxxxxxxx1111	87	1	2025-04-07 10:41:41	2025-04-07 10:41:41
6	tok_1RB9OKRwhoKMBfqc6ItwOKbt	xxxxxxxxxxxx1111	87	0	2025-04-07 10:42:45	2025-04-07 10:42:45
\.


--
-- Data for Name: user_password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_password_resets (id, email, token, is_valid, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_ratings (id, rating, review, user_id, vendor_id, booking_id, created_at, updated_at) FROM stdin;
1	4.00	Great	48	2	14	2025-03-27 16:39:06	2025-03-27 16:39:06
2	4.00	Great	36	2	10	2025-03-27 19:49:11	2025-03-27 19:49:11
3	4.00	Hhh	36	29	18	2025-03-27 19:51:38	2025-03-27 19:51:38
4	1.00	Great	53	29	22	2025-03-27 20:20:30	2025-03-27 20:20:30
5	4.00	Tywuiwiwowo	54	28	16	2025-03-27 20:25:09	2025-03-27 20:25:09
6	5.00	goof pesrson	53	58	22	2025-03-27 21:04:27	2025-03-27 21:04:27
7	4.00	goof pesrson	53	57	22	2025-03-27 21:07:38	2025-03-27 21:07:38
8	3.00	Hi	53	57	24	2025-03-27 21:08:42	2025-03-27 21:08:42
9	5.00	Hi 2	53	57	36	2025-03-27 21:17:01	2025-03-27 21:17:01
10	4.00	Good And Prompt Servives	54	57	67	2025-03-28 08:15:44	2025-03-28 08:15:44
11	4.00	Great	53	56	37	2025-03-28 09:02:28	2025-03-28 09:02:28
12	4.00	It's good job	54	58	96	2025-03-30 14:52:45	2025-03-30 14:52:45
13	4.00	Great	53	57	88	2025-03-31 11:41:43	2025-03-31 11:41:43
14	4.00	Fshusie	54	80	104	2025-04-03 11:44:44	2025-04-03 11:44:44
15	4.00	Good job	54	81	108	2025-04-03 16:45:22	2025-04-03 16:45:22
16	2.00	Good job	54	81	106	2025-04-04 11:59:43	2025-04-04 11:59:43
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

COPY public.users (id, name, email, dial_code, phone, phone_verified, password, email_verified_at, role_id, user_phone_otp, user_device_token, user_device_type, user_access_token, firebase_user_key, status, remember_token, created_at, updated_at, deleted_at, provider_id, avatar, address, profile_image, is_admin_access, latitude, longitude, country, city, zip_code, address_2, user_device_id, is_social, email_verified, user_email_otp, trade_license, deleted, first_name, last_name, active, password_reset_code, password_reset_time, password_reset_otp, temp_dial_code, temp_mobile, temp_email, ratings, total_ratings, stripe_customer_id, profile_completed, password_sent, card_saved) FROM stdin;
4	Mz Movers	softcube.web@gmail.com	297	03023484848	1	$2y$10$yn6Gzu.IXMCsbILTuT9Qn.BGwPEpg4QX/crKaN1kowOW7PI9jwmi2	2023-05-25 21:36:11	4	\N	\N	\N	\N	\N	active	\N	2023-05-25 21:36:11	2023-05-30 10:33:49	\N	\N	\N	57R6+C4P - Sheikh Zayed Rd - Dubai - United Arab Emirates	\N	0	25.204819	55.2603152	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
5	Royal Home Relocators	royalhome@email.com	61	383837377	1	$2y$10$y9XW9EUs77DHm1Vp168pL.tkH8GzlsBoWUwbZ/KvrBq5juPFBDY2K	2023-05-27 15:27:55	4	\N	\N	\N	\N	\N	active	\N	2023-05-27 15:27:55	2023-05-30 12:12:27	\N	\N	\N	34HP+PGV - Jumeirah Beach Residence - Dubai - United Arab Emirates	\N	0	25.079339	55.136229	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
6	Fixit Office Relocators	fixit@email.com	61	2228822882828	1	$2y$10$taSoswFFAv31T5eqsbiOS.kNbqwu6GBkNsZPRTg6nK/Z5cuotqPzG	2023-05-27 15:29:52	4	\N	\N	\N	\N	\N	inactive	\N	2023-05-27 15:29:52	2023-05-30 12:24:13	\N	\N	\N	Block D, 3rd Floor, Office Park Building #56 - الصفوح - مدينة دبي للإنترنت - دبي - United Arab Emirates	\N	0	25.204819	55.1684566	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
3	Allen Max	allen@email.com	43	38373733663	1	$2y$10$64DwJ5UrOz.8q5pfrYnGye0icnYLAvKomzoVtu1x0jC0yBbhmP3F.	2023-05-25 20:56:23	3	\N	\N	\N	\N	\N	active	\N	2023-05-25 20:56:23	2023-09-12 18:15:01	\N	\N	\N	57R6+C4P - Sheikh Zayed Rd - Dubai - United Arab Emirates	\N	0	25.19109980000001	55.2603152	United Arab Emirate	Dubai	00000	5th Floor 342 Apartment	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
15	Samba	samba23@gmail.com	971	3235355	1	$2y$10$B3J0C8/AglScgSzUrskFR.QTLLWypSAeMAbmj.PdQEQ.2LQ24542u	2025-01-21 15:50:50	4	\N	\N	\N	\N	\N	active	\N	2025-01-21 15:50:50	2025-01-21 15:50:50	\N	\N	\N	3MQ4+W9G, Multan - Vehari Rd, Makhdum Rashid, Multan, Punjab, Pakistan	\N	0	30.089513	71.655558	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
10	My New Company 1	abcdef@email.com	297	22828828282	1	$2y$10$ofBv37FzuzOGzhmHHoaHTeT7YIPz4SbvMaiVpadW/hK1.w0V3fhjq	2023-06-03 14:13:01	4	\N	\N	\N	\N	\N	inactive	\N	2023-06-03 14:13:01	2023-06-03 16:35:53	2023-06-03 16:35:53	\N	\N	673C+W8X - Dubai - United Arab Emirates	\N	0	25.20676045589012	55.260867351776106	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
11	Creative	creative@email.com	244	3939399393	1	$2y$10$McGYr8AWfTLMa49Epir/EOqRp7oPJ3EoC2nu1WqkgBQ0JsOTK.bvS	2023-06-03 14:55:11	4	\N	\N	\N	\N	\N	inactive	\N	2023-06-03 14:55:11	2023-06-03 16:36:05	2023-06-03 16:36:05	\N	\N	673C+W8X - Dubai - United Arab Emirates	\N	0	25.208158284957296	55.25477337289427	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
9	Test Category	testcategory@email.com	1268	838383838	1	$2y$10$fpDpGnwqFa/0mhYgVMGJaOEsfcR/DqgVGXeCOFxW6wSlgyYDhptJO	2023-05-29 20:00:47	4	\N	\N	\N	\N	\N	active	\N	2023-05-29 20:00:47	2023-06-03 16:36:31	2023-06-03 16:36:31	\N	\N	673C+W8X - Dubai - United Arab Emirates	\N	0	25.207503866232575	55.26251792907715	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
8	New Company	newcompany@email.com	61	227727272727	1	$2y$10$k7PM.tTlL2KbmTKwZULqEeYjUFuBDwCe8N0dlae38B3PkG4noVCoa	2023-05-29 19:50:57	4	\N	\N	\N	\N	\N	active	\N	2023-05-29 19:50:57	2023-06-03 16:36:41	2023-06-03 16:36:41	\N	\N	673C+W8X - Dubai - United Arab Emirates	\N	0	25.190291905188626	55.303663055925796	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
16	Samba	samba235@gmail.com	971	3235356	1	$2y$10$i8KzJy3zNtkHwAmYCFawzuZR2/kwdGulzunaaT1gQtUNVDhzLFFYm	2025-01-21 15:54:46	4	\N	\N	\N	\N	\N	active	\N	2025-01-21 15:54:46	2025-01-21 15:54:46	\N	\N	\N	3MQ4+W9G, Multan - Vehari Rd, Makhdum Rashid, Multan, Punjab, Pakistan	\N	0	30.089513	71.655558	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
17	Samba	sambal23@gmail.com	971	3233560	1	$2y$10$LAiWmqosi9zOOXXMiiWsB.oyrtVxBX4rfcenWemoPKgV4MuEL5odm	2025-01-21 15:58:13	4	\N	\N	\N	\N	\N	active	\N	2025-01-21 15:58:13	2025-01-21 15:58:13	\N	\N	\N	3MQ4+W9G, Multan - Vehari Rd, Makhdum Rashid, Multan, Punjab, Pakistan	\N	0	30.089513	71.655558	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
19	Shah Company	shah124@sabeeh.com	971	1211213336	1	$2y$10$1J2Xv522NaOG3VOLwMd6e.iDi/e3wS09KkKgRv11oBgCpW6xG0mJ.	2025-02-24 21:02:20	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:02:20	2025-02-24 21:02:20	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
21	Shah Company	shah12+1@sabeeh.com	971	1212133368	1	$2y$10$Se7FsFWKukTfhZGQX2k0z.KqqUvEL3fbPRqy6TdDy4BgzJ21L6XtG	2025-02-24 21:10:39	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:10:39	2025-02-24 21:10:39	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
22	Shah Company	shah1+1@sabeeh.com	971	121213368	1	$2y$10$vClkWoVND1wpGrrx6YWtcO2CbmLhZLh7bZo5ntPG/.QGZ55x5CGn2	2025-02-24 21:18:55	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:18:55	2025-02-24 21:18:55	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
1	Admin	admin@admin.com	971	112233445566778899	0	$2y$10$E78U6ugNHGbxxXKQHRB70OC5hdcWCSIcZaWl5Nw/sPrxkTYgf6OWu	\N	1	\N	\N	\N	\N	\N	active	\N	2023-05-25 20:10:21	2023-05-25 20:10:21	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
7	Deluxe Warehouses	deluxe@email.com	297	82828282828	1	$2y$10$CvjpE9.RuUGDOURAWYxWIe1VzgRRG4Q6o1zI95ks.eD0gg92Rwy/6	2023-05-28 13:24:30	4	\N	\N	\N	\N	\N	active	\N	2023-05-28 13:24:30	2024-12-30 10:13:38	\N	\N	\N	Churchill Executive Tower - الخليج التجاري - دبي - United Arab Emirates	\N	0	25.1831647	55.272887	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
12	Royal Cargo	royal@royal.com	971	5352525235	1	$2y$10$FP7zzBA3j9HB7D21iiXF8uznmXRxR8qAvryHtO1B9zQjUNHjDvFIq	2025-01-21 15:27:00	4	\N	\N	\N	\N	\N	active	\N	2025-01-21 15:27:00	2025-01-21 15:27:00	\N	\N	\N	35 16th St - Al Safa - Al Safa 1 - Dubai - United Arab Emirates	\N	0	25.179664702061043	55.24431456708986	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
13	Michel	micheal@micheal	971	3453535235	1	$2y$10$.XYcBQZLf.VoI1ZTdpNS0evIt5f0uXKCEf2QyP59/6HNA2HIm/XCi	2025-01-21 15:30:08	3	\N	\N	\N	\N	\N	active	\N	2025-01-21 15:30:08	2025-01-21 15:30:08	\N	\N	\N	57H3+C75 - Dubai - United Arab Emirates	\N	0	25.17857724868758	55.25294055128175	United Arab Emirate	Abudhabi	235252525	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
14	Samba	samba@gmail.com	971	3235354	1	$2y$10$jPAS/WDXs2MauJdf3/oSquZm44AQ7.4z9LTLb9fkwMfFGip/e3DVu	2025-01-21 15:50:10	4	\N	\N	\N	\N	\N	active	\N	2025-01-21 15:50:10	2025-01-21 15:50:10	\N	\N	\N	Mag warehouses, Plot 911 - القوز - منطقة القوز الصناعية 2 - دبي - United Arab Emirates	\N	0	25.1407059	55.25953740000001	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
23	Shah Company	shah1+11@sabeeh.com	971	1212131368	1	$2y$10$9Hy3uPsAVZ3X9hSbuL.vxu03l/ud/ACsxKdUVQzP5UC.7lyRJ0K8a	2025-02-24 21:20:22	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:20:22	2025-02-24 21:20:22	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
24	Shah Company	shah1+21@sabeeh.com	971	121231368	1	$2y$10$H0YFoItNMC..TAulr02x4.54fpyFElc0Vzgg..PLDrDTsKmYt8H8i	2025-02-24 21:24:53	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:24:53	2025-02-24 21:24:53	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
25	Shah Company	shah1+221@sabeeh.com	971	121231364	1	$2y$10$GI6luEXo/c53SOdh4AhDAePTr6t6FzM3xNrJ/RSH2G5r1trrkKWHm	2025-02-24 21:26:37	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:26:37	2025-02-24 21:26:37	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
18	Shah Company	shah@sabeeh.com	971	121121333	1	$2y$10$a4BwabvqOA3fImIPrcRaBOTR/zK84v1k2wE/hcsCL82Lz739kqe4u	2025-02-24 20:59:08	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 20:59:08	2025-03-27 02:05:31	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4.00	\N	1	1	1
26	Shah jhan Company	shaqh1+221@sabeeh.com	971	12123136	1	$2y$10$SR3OgOBosmCU7fh2FUDNCu8itF89YItwThi9w7U5UEnuwnKPE4OBC	2025-02-24 21:29:42	4	\N	\N	\N	\N	\N	active	\N	2025-02-24 21:29:42	2025-03-27 15:40:54	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	5.00	\N	1	1	1
20	Shah Company	shah124+1@sabeeh.com	971	12112133368	1	$2y$10$l2pf.YGOJcY5vlEOBzt8n.StTwRv9cn9vCY5KS2wuUnoPPW6yAkz6	2025-02-24 21:08:03	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:08:03	2025-03-27 08:12:11	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4.00	\N	1	1	1
32	ABCD sam	mytest+1@phone.com32	92	31223232321	1	$2y$10$xfyGnY49pUGmvuME4iBOC.kIbP7Z9UgirsuUSL6iOnuXh9ypfDIzO	2025-03-15 09:20:03	2		33434342	1234	bc17f71d05d2bca91599366d4e2904caddde85a49fdc5980db581718e2449720	-OLNEfyQnRgMVVKQZL3q	inactive	\N	2025-03-15 09:20:03	2025-03-15 11:31:05	\N	\N	\N	\N	67d52295c1dea_1742021269.jpg	0	\N	\N	\N	\N	\N	\N	\N	0	1		uploads/trade_licenses/uqvytsepBqUakZfRN24bnXAfvzm5qKXvUFSfwFS4.jpg	\N	ABCD	sam	1		2025-03-15 06:27:31	0	\N	\N	\N	\N	\N	\N	1	1	1
40	Hamid Raza	razahamid105@gmail.com	971	3441562101	1	$2y$10$cfGDoc668zjgjtY5fcyiOOJXhGu82MemXnScR8wYppm.ypOVcxpWq	2025-03-26 10:15:01	2		ejDkSWx7TFymUVQ4hTwZ_f:APA91bEI7vZVp-TI-BcKu7V6Ci3cANn0U70d--xOUFlyd2DTOIJeiM-01RYAQHap1YTS5KMQPLB97ea3QR-6vvRAZ9cn0XGuzudS9eYcM4IiAcZ2Vt-C4g0	android	e9c3124931ae26579e2614fec1d2f94fe390e13599dffd9f56cb121e0d99f575	-OMG4kIr6ES7Ii8FA45Z	inactive	\N	2025-03-26 10:15:01	2025-03-26 10:15:01	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Hamid	Raza	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
34	Hamid Raza	razahamid102@gmail.com	971	3441562102	1	$2y$10$qkIzuSuS2vrgLTVkp9v8Hemu.IIiGKzQO.XRKlbrmlb.zV.FEJNU2	2025-03-22 03:04:17	2		fHredaUYT5qeS39m52MxPt:APA91bFu8_pfAoUu5uhlnN-dmqhYk2ClEV3DlfBY_Fk7Fte2XnxJNI6z9wFkNZH4EexcBAeWfFBsDzGFnzzV4ZnV-1oFzudlPLGBT4bJ_qswjYe83dRHKNk	android	0f81d9a36e200c6fbd5ded7506dff11b4029ec4144b2cd62ca99ffe58cd06e77	-OLuwnsciFA7Ag988T5e	inactive	\N	2025-03-22 03:04:17	2025-03-25 01:16:13	\N	\N	\N	\N	67e1cb9d7e05b_1742850973.	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Hamid	Raza	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
37	Hamid hello	razahamid101@gmail.com	971	3441562105	1	$2y$10$d29PE3KZh37PaVUo3a1ICuFJNJ8QVJaxd2JH40FjcgOdrjQSMNwKe	2025-03-26 14:26:53	3	1111	ejDkSWx7TFymUVQ4hTwZ_f:APA91bEI7vZVp-TI-BcKu7V6Ci3cANn0U70d--xOUFlyd2DTOIJeiM-01RYAQHap1YTS5KMQPLB97ea3QR-6vvRAZ9cn0XGuzudS9eYcM4IiAcZ2Vt-C4g0	android	24540be8f93b263752bc7e42b41a8fec672a42e9f85954308a013fb425772e7b	-OM65mMzitVTL8zU0g4H	inactive	\N	2025-03-24 11:43:19	2025-03-27 12:54:25	\N	\N	\N	\N	67e1631c58899_1742824220.	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Hamid	hello	1		2025-03-26 20:31:49	0	\N	\N	\N	\N	\N	\N	1	1	1
31	Hamid 	razahamid36@gmail.com	971	344464664	1	$2y$10$TP/JqY65.tpWp5Y62B6a3.iOESSeLEQ4xufNvGgI.bdxFBUK48sQq	2025-03-13 00:49:41	3		ejDkSWx7TFymUVQ4hTwZ_f:APA91bEI7vZVp-TI-BcKu7V6Ci3cANn0U70d--xOUFlyd2DTOIJeiM-01RYAQHap1YTS5KMQPLB97ea3QR-6vvRAZ9cn0XGuzudS9eYcM4IiAcZ2Vt-C4g0	android	db529579fe5376ac861f12e1a39aa45275f8c0c980f3df7fe7e9d66a2dedea2b	-OLB6gSYCNPoccXXRrYG	inactive	\N	2025-03-13 00:49:41	2025-03-13 00:49:42	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Hamid	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
27	sda	as@a.com	971	242421414	1	$2y$10$gZWQt6iVxtHUjFl.2jrKOel6aTHmbUUuBs.9NKET0EyzXymYpN1Ei	2025-03-04 11:45:48	4	\N	\N	\N	\N	\N	active	\N	2025-03-04 11:45:48	2025-03-13 11:12:02	\N	\N	\N	6727+WWV - Al Wasl - Dubai - United Arab Emirates	\N	0	25.202489212059902	55.26457952905272	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
41	ABC Cargo	anilvendor@gmail.com	971	45747474747	1	$2y$10$4xe8Sz7jXCRtGrwzu6Mnuunmd/iGx/V6V1pyrRLv.tSdMk4thYB9C	2025-03-26 12:19:56	4	\N	\N	\N	\N	\N	active	\N	2025-03-26 12:19:56	2025-03-27 15:49:43	\N	\N	\N	8 16b St - Za'abeel - Za'abeel 2 - Dubai - United Arab Emirates	\N	0	25.204275386801978	55.285522217041	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
66	rusvin 123 k	sa1@1.com	971	16666	1	$2y$10$.tfUnQJdsy4GxO/4qXF4H.3WGhsUdQ8bzKLRGaTuQJOWNUIfcb0BO	2025-03-28 10:34:47	2		123123	android	01486851d712a58159fdd91f7a273f9239f07a0ca2465c9ced16054f7dc48507	-OMQSSQmE1k7cGNUWeYA	active	\N	2025-03-28 10:34:47	2025-03-28 10:34:48	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1		uploads/trade_licenses/Bk9vNG3t3fWNWOcD8xfdbjkO4uEr5pUVsvZQCDmH.jpg	\N	rusvin 123	k	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
29	rusvin 123 k	1@1.com	971	1	1	$2y$10$vz83z4mjEJgR72IINFkt0ukW1ewTBqZjs8V/8s6OC7kbRu6zPsV/e	2025-03-12 09:12:10	2	1111	123123	android	e5e3cde75d4d037e7e6fc124cfa80981892731948bcc6eaa4f190bbd6980279b	-OL5Wv3QSGVJ6Y2VVCFe	inactive	\N	2025-03-11 22:43:05	2025-03-27 20:20:30	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	rusvin 123	k	1	\N	\N	\N	\N	\N	\N	2.5	5.00	\N	1	1	1
33	Hamid Raza	razahamid101@gmail.com	971	3441562101	1	$2y$10$SePBrBPDw1sT9MUAs0HHLellMRkE48GX5lyoDrHpImLOqJLgvga1a	2025-03-25 00:34:31	2	\N	ejDkSWx7TFymUVQ4hTwZ_f:APA91bEI7vZVp-TI-BcKu7V6Ci3cANn0U70d--xOUFlyd2DTOIJeiM-01RYAQHap1YTS5KMQPLB97ea3QR-6vvRAZ9cn0XGuzudS9eYcM4IiAcZ2Vt-C4g0	android	a8158560cd7be5adbfb9fa170d3d3bd7d8db192a1a139fa5734ae886f9349c87	-OLsEdTJmAT__3khiXik	inactive	\N	2025-03-21 14:27:44	2025-03-25 00:34:31	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Hamid	Raza	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
67	rusvin 123 k	sa1+1@1.com	971	166667	1	$2y$10$/fFdEFKrUi0LmwRfGJ40BezkV1Z/PldH/Eu0PbOOy2C/SaWgRwCoe	2025-03-28 10:45:12	2		123123	android	dc98bb385e401a836bc986e9ccb3681ec4f41639ddff49ef922d43cd4c9fe7c0	-OMQUpwQsz-r5UklnxJS	active	\N	2025-03-28 10:45:12	2025-03-28 10:45:12	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1		uploads/trade_licenses/5fH86C1BADDfcoRUPsKvFEChL3EGHKtUV65Vdjym.jpg	\N	rusvin 123	k	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
30	ABCD sam	razahamid103@gmail.com	971	3122323232	0	$2y$10$L9KyX2pHxFj51ATfQgbrB.7H40ABgqHCFd3XJ0iSGW3odHnNCU/f6	2025-03-27 09:56:44	2	\N	ejDkSWx7TFymUVQ4hTwZ_f:APA91bEI7vZVp-TI-BcKu7V6Ci3cANn0U70d--xOUFlyd2DTOIJeiM-01RYAQHap1YTS5KMQPLB97ea3QR-6vvRAZ9cn0XGuzudS9eYcM4IiAcZ2Vt-C4g0	android	dcc1f6fa40cd2de16df99b8f1fcd1c6efe85f7ac52b2b71a1ddcd14e47134926	-OL7m7P661afocMwT4PQ	inactive	\N	2025-03-12 09:16:37	2025-03-27 09:56:44	\N	\N	\N	\N	67e393a0695dc_1742967712.	0	\N	\N	\N	\N	\N	\N	\N	0	1	1111		\N	ABCD	sam	1		2025-03-25 20:49:34	0	971	3122323232	razahamid101@gmail.com	\N	\N	\N	1	1	1
43	dsdsd	teashowaap@gmail.com	91	55555555e5	1	$2y$10$ua8bKE.vvHZ8x0PdCILW/e7BW3UPpHnkmqFiosYsY3rlMMHsOgkbm	2025-03-26 12:53:47	4	\N	\N	\N	\N	\N	inactive	\N	2025-03-26 12:53:47	2025-03-26 12:53:47	\N	\N	\N	6739+JGH - Al Wasl - Dubai - United Arab Emirates	\N	0	25.204391875548783	55.268913978820784	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
42	dsdsd	teashoaap@gmail.com	91	555555555	1	$2y$10$CqRwNux8VXY3kBdoJuIl6eMVu7fHnsheCRqeotxjO79RZPc3klfEK	2025-03-26 12:48:23	4	\N	\N	\N	\N	\N	inactive	\N	2025-03-26 12:48:23	2025-03-26 12:48:23	\N	\N	\N	6739+JGH - Al Wasl - Dubai - United Arab Emirates	\N	0	25.204391875548783	55.268913978820784	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
44	dsdsd	teashoaap2222@gmail.com	91	555355555	1	$2y$10$7mKKhLlSdtcoz8NyzbmHdeeET2a42jyQs/FUACBBfkxuMSWKbZL62	2025-03-26 12:55:06	4	\N	\N	\N	\N	\N	inactive	\N	2025-03-26 12:55:06	2025-03-26 12:55:06	\N	\N	\N	6739+JGH - Al Wasl - Dubai - United Arab Emirates	\N	0	25.204819	55.270931	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
36	Asad Nazir	asad@gmail.com	971	3441560319	1	$2y$10$ETLSfGCMYwem7rnecNLN5ezMPSOf26LuZA0dh5bBu4QCh25coTdTq	2025-03-27 19:49:01	2	\N	d9mCOohQTOemKPmlKFuhfb:APA91bF1Q1qXnQPKl4TXJfWibCBbMrOqKe7YRpQ-fY0DY0HsjQMcempTnIEc9UimqBSUd2Ei8F6eISqoOSyNjKBxrDTn2KLae4bKCkWUYcVP-yQsbTkTxd0	android	afbd4a1c9764ddc738404f1e2931e79b51c20910ab835e61c399591d8f3bff96	-OM60ArQGfmJQxXsuSO8	inactive	\N	2025-03-24 11:18:51	2025-03-27 19:49:01	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Asad	Nazir	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
68	rusvin 123 k	sa1+2@1.com	971	166663	1	$2y$10$AMQ88v9ez.emtIz8KaDhpOt351lk/Rdfo5V7lK2Q8UaW2xMjV/niS	2025-03-28 10:57:40	2		123123	android	632e022d2aeb85fe2e07215ed5868b8992729a1eed47e34d95d504376e8f92d2	-OMQXgaSO_ZNQ2OczUR-	active	\N	2025-03-28 10:57:40	2025-03-28 10:57:40	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1		uploads/trade_licenses/ItGu5Qv7mLWUCfTFcEHUVM1OQIxAGpJjaQv96YWk.jpg	\N	rusvin 123	k	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
69	rusvin 123 k	sa1+3@1.com	971	166663	1	$2y$10$oVMtIC1JC.GDtFtkMRFJDeN2lla0v60VT9Y49LxrUzspAcixLdPkS	2025-03-28 10:58:51	2		123123	android	7d7b5af69b4b1d529e60ea5feee8019e6b3cc6bad3ea66a64d36125b8f813823	-OMQXxuYKzo2y-HeycQv	active	\N	2025-03-28 10:58:51	2025-03-28 10:58:55	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1		uploads/trade_licenses/b6r9JzMLkNnP6QUDqYfZlxaf1Cyxpo7l2ippgMsw.jpg	\N	rusvin 123	k	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
45	Lulu supermarket 	anilbusiness@gmail.com	971	9794664949	1	$2y$10$FBosM/seB5xL11qWCUau9OCMPCoH21WxH14cUl.zJdjCVaSTcXA2e	2025-03-26 13:00:45	3		dn7Df-I7T7qfUShEf9vrpd:APA91bFggH7obm8lmtGmpUu1iarkodL6GfDW_YZxHYv0jmnCZmBA5EgkQaIYvmC0_1OYNZPbbLiX4pkJyc3WntGsF-topk_zwgd31DpLshzrk5TVHeFemz8	android	57a066b7860f4f72e0f679f84fb6ae2010cd04d5ffe5269d8199825fc30283a4	-OMGfg8nGmD9NbbKs3dV	inactive	\N	2025-03-26 13:00:45	2025-03-26 13:00:46	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Lulu supermarket	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
50	Aniluser navis	aniluser2@gmail.com	971	566854556	1	$2y$10$4d2oYvdViVHYKtSfgPLyvuqT.j/rHeKe5txDGlhcMPSivOTDPFA7.	2025-03-27 01:21:15	2		cuxqOhzFT0i2jIce5AEFTv:APA91bGxmLzNrePuvnz6MSUv9qN2RUBNJ4FuhGh00h8nAEGIWPRD-i6QQk_98oX3_YOa0ilQnLEPb3DFRqDZWwK2FM2AsR46oL7oIzHpFsiyT2XasHLO05I	android	701e11b1d0e10fe441ffd5881121f8bcef654a40d9b2fedd081b7e9ab618ecfb	-OMJKAMXj3rYjQCmaJ_c	active	\N	2025-03-27 01:21:15	2025-03-27 01:21:16	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Aniluser	navis	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
46	anil navis	aniluser1@gmail.com	971	455558555	1	$2y$10$c7LxJjOhw3RG0Gx10EaSaO/CDkxsjesx0KZhH7RxGL/LTRoS398LW	2025-03-26 13:46:53	2		dn7Df-I7T7qfUShEf9vrpd:APA91bFggH7obm8lmtGmpUu1iarkodL6GfDW_YZxHYv0jmnCZmBA5EgkQaIYvmC0_1OYNZPbbLiX4pkJyc3WntGsF-topk_zwgd31DpLshzrk5TVHeFemz8	android	e1a38a4a3d8894f4067f144f04cecae716564589f73368a50cbf42b4e148c610	-OMGqEmtYWy0L-z4SGbF	inactive	\N	2025-03-26 13:46:53	2025-03-26 13:46:53	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	anil	navis	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
57	FNC	navisanil@gmail.com	971	63463636	1	$2y$10$jCcDCQupBI8y2VNhkLvTYuFAhjKliWmJcg4Lxa9kdV.FgaRWvFZq6	2025-03-27 18:59:28	4	\N	\N	\N	\N	\N	active	\N	2025-03-27 18:59:28	2025-03-31 11:41:43	\N	\N	\N	KG Tower - Dubai Marina - Dubai - United Arab Emirates	\N	0	25.069471699216027	55.12695898870747	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	5	\N	1	1	1
47	anol navis	aniluser@gmail.com	971	565656565	1	$2y$10$UIR.XdKYQhWgGTUm5ai4OOAd5QIprqHAMRtmdK/dECs5qZ8MFsk3u	2025-03-26 14:51:39	2	\N	dn7Df-I7T7qfUShEf9vrpd:APA91bFggH7obm8lmtGmpUu1iarkodL6GfDW_YZxHYv0jmnCZmBA5EgkQaIYvmC0_1OYNZPbbLiX4pkJyc3WntGsF-topk_zwgd31DpLshzrk5TVHeFemz8	android	1fa71ac075f38f87a364fd8d20aa47acb10b71024a45d52f44a4112a7e23e181	-OMGrAYxmglYnrsBfVFX	active	\N	2025-03-26 13:50:57	2025-03-26 14:51:39	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	anol	navis	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
55	anil individual	anilind@anilind.com	971	555555585	1	$2y$10$dKEmMToWBRC7WeKL92cvN.1m4ye3gq7kKXhGmfiz0kEiRsAertcnq	2025-03-27 14:02:40	2		dbAmphmfQ5qdWh0pQkQX0i:APA91bFd07abtSg6Fo2XybQenXMqoutF6VoW8rJlSjrIKNV1yT9Rq0MMXzGfFXlq8mG4Oh_hFzNl14AgjRb-QW716s5uuhgkvTROkx1xIYUyJYJP8izsUYI	android	af9ad056454f98f7e1908dc06d182f10d6a58a74f0f35ac2e5a8fef771e6af15	-OMM2Rmk-3poItXw1Vmi	active	\N	2025-03-27 14:02:40	2025-03-27 14:02:40	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	anil	individual	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
56	DXB Company	DXBcompany@gmail.com	971	2342343253	1	$2y$10$KZ5ZYstALgSZUCXuAK5i3uQa3AENrO2bcR/cOxsCb6teENtiHw8CW	2025-03-27 15:57:28	4	\N	\N	\N	\N	\N	active	\N	2025-03-27 15:57:28	2025-04-03 14:33:13	\N	\N	\N	165 Financial Center Rd - Downtown Dubai - Dubai - United Arab Emirates	\N	0	25.1972295	55.27974699999999	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	1	\N	1	1	1
64	Shamas Kumar	shamas+3@gmail.com	971	18571985195	1	$2y$10$myTjWtxYo71NWgFArbzGDuJQsiNQ/DJPYoZZI0C7bFwxv3c4toh/K	2025-03-28 10:14:41	4	\N	\N	\N	\N	\N	inactive	\N	2025-03-28 10:14:41	2025-03-28 10:14:41	\N	\N	\N	Dubai International Airport (DXB) - Dubai - United Arab Emirates	\N	0	25.2566932	55.36431779999999	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
59	Saman SHah	SamanSHah@gmail.com	971	1345678888999	1	$2y$10$3VHUr/izEC0vGCiruswqQuqR1GX3xbwE93n2F7R8qZ3dlMC8RN1Di	2025-03-27 23:15:56	4	\N	\N	\N	\N	\N	inactive	\N	2025-03-27 23:15:56	2025-03-27 23:15:56	\N	\N	\N	M38F+JQ2, Tipu Sultan Rd, I-8 Markaz I 8 Markaz I-8, Islamabad, Pakistan	\N	0	25.2205845	55.2543386	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
61	Shamas Kumar	shamas@gmail.com	971	198519851985	1	$2y$10$nAKBBMvgszTQfvvqfh/7b.l/5q6VJpDOgcthCaQhaBmWvCnepB/uq	2025-03-28 10:08:16	4	\N	\N	\N	\N	\N	inactive	\N	2025-03-28 10:08:16	2025-03-28 10:08:16	\N	\N	\N	Dubai International Airport (DXB) - Dubai - United Arab Emirates	\N	0	25.2566932	55.36431779999999	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
48	Hamid Raza Goraya	razahamid34@gmail.com	971	3441562554	1	$2y$10$QUxAvyW9yteQKIA/de020.YIwck/rsGntBVzGC5fNcUnRcSFam1Jq	2025-03-26 16:14:19	2		ejDkSWx7TFymUVQ4hTwZ_f:APA91bEI7vZVp-TI-BcKu7V6Ci3cANn0U70d--xOUFlyd2DTOIJeiM-01RYAQHap1YTS5KMQPLB97ea3QR-6vvRAZ9cn0XGuzudS9eYcM4IiAcZ2Vt-C4g0	android	9241335df3398bde2de57c54ee70a43dd4b9973455e9dc0a25d8f80d8ec31b89	-OMHMzU5Zp4K4hAqN3Iv	active	\N	2025-03-26 16:14:19	2025-03-27 16:34:36	\N	\N	\N	\N	67e51a0cd8a5e_1743067660.	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Hamid	Raza Goraya	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
2	Abdul Ghani	ghaniabro11@gmail.com	374	03023220821	1	$2y$10$egPFwL419nnMOdBG6h4RfudH/.PVE0YE8hgP0YhoKgQMS/NjiOJsy	2023-05-25 20:44:27	3	\N	\N	\N	\N	\N	inactive	\N	2023-05-25 20:44:27	2025-03-27 19:49:11	\N	\N	\N	Churchill Executive Tower - الخليج التجاري - دبي - United Arab Emirates	\N	0	25.1831647	55.272887	United Arab Emirate	Dubai	75500	5th Floor 342 Apartment	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	8.00	\N	1	1	1
65	Shamas Mubarak	mubarak@gmail.com	971	233243243	1	$2y$10$b29NW16UD5TY16y9oih3mOf0Oiil5BFlayPnpQoajKXPJ/huqPoNm	2025-03-28 10:21:06	4	\N	\N	\N	\N	\N	active	\N	2025-03-28 10:21:06	2025-03-28 14:24:32	\N	\N	\N	Dubai International Airport (DXB) - Dubai - United Arab Emirates	\N	0	25.2566932	55.36431779999999	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
58	Almas	nasarmobiria@gmail.com	971	64334637377	1	$2y$10$yymCHhQ8a4y7Eexqls4WBegKfyRGPSBrHX807vEE8TNxzQ5O5eNNu	2025-03-27 19:26:05	4	\N	\N	\N	\N	\N	active	\N	2025-03-27 19:26:05	2025-03-30 14:52:45	\N	\N	\N	Office #104 Al Fas Building - النهدة - النهدة ٢ - دبي - United Arab Emirates	\N	0	25.28707870082781	55.370953309869364	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4.5	2	\N	1	1	1
49	Asad Nazir	asadnazir289@gmail.com	971	3441560319	1	$2y$10$fZ8h0ML95L2jZSP1ph5IJ.Mz6GA.DMHgJxLTZo6BHQDtvPslLd5R6	2025-03-26 22:38:03	2		eLK7Z7rbTJyisYJK0S2qDI:APA91bE3pwHhF7Ywwdx9cWFtMYAphdtFieXBShVnA2eEfSK3WmlLXsvbH2rtjR55WP5WIqECq60ohP0n09HKh0LSxewkUHA7XSnuiPizAtZPI4lfrbqQhxs	android	0949a951e4ff13e93c44e317393e812a5ae75ab84bf1d04d1e1ecedf02c82129	-OMIjokl2jFeLIVfuykT	active	\N	2025-03-26 22:38:03	2025-03-27 20:29:47	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Asad	Nazir	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
60	Rakesh kumar	binshambrs@gmail.com	971	564005096	1	$2y$10$YAXN0OvJiCX9wHExVTjtsO1gAdp/VmpMwue3ujfE3tTzUO.nLCulq	2025-03-28 08:27:45	2		fjgFGev_S5eBuhTj0nN3NP:APA91bG89vgkt9Tdqxuab02MKeHB8hrIOdjsjR02LNnkLilD3DEixP_AME0Z5wYRp5OJPk8e0auoOoj7CeAOkUadOMgiSMHuBAwBT1uA0c0ePWehEquxedA	android	78dd0a4069937dea0279f045248fac384dc45482384ccf635e00eb0c22043bb6	-OMQ-NUVZThCtePnK_Eh	active	\N	2025-03-28 08:27:45	2025-03-28 08:27:45	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Rakesh	kumar	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
62	Shamas Kumar	shamas+1@gmail.com	971	19851985195	1	$2y$10$k2q.f0zjjYmBoO8cd4Af1ux7.SuhtK5ani.XI.a/6hKCDlKvddY0m	2025-03-28 10:10:22	4	\N	\N	\N	\N	\N	inactive	\N	2025-03-28 10:10:22	2025-03-28 10:10:22	\N	\N	\N	Dubai International Airport (DXB) - Dubai - United Arab Emirates	\N	0	25.2566932	55.36431779999999	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
63	Shamas Kumar	shamas+2@gmail.com	971	198571985195	1	$2y$10$XCQROhv6nA9k2IArmzw86uat5IOnCUoYsM0LkSsm1k1D0dfnIGAuy	2025-03-28 10:11:37	4	\N	\N	\N	\N	\N	inactive	\N	2025-03-28 10:11:37	2025-03-28 10:11:37	\N	\N	\N	Dubai International Airport (DXB) - Dubai - United Arab Emirates	\N	0	25.2566932	55.36431779999999	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
53	Hamid Iqbal	hamidiqbalgoraya@gmail.com	971	3441562554	1	password	2025-03-27 13:41:37	2		ejDkSWx7TFymUVQ4hTwZ_f:APA91bEI7vZVp-TI-BcKu7V6Ci3cANn0U70d--xOUFlyd2DTOIJeiM-01RYAQHap1YTS5KMQPLB97ea3QR-6vvRAZ9cn0XGuzudS9eYcM4IiAcZ2Vt-C4g0	android	5ddaac6a707bcc4b7b016ea9f4f3861fbbd87b8541f7ff63777fdc3af4bbac0b	-OMLycRmcLLK38N3dQfU	active	\N	2025-03-27 13:41:37	2025-03-29 11:05:49	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	1			\N	Hamid	Iqbal	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
70	Anil Ab	abinmobiria@gmail.com	971	566868966	1	$2y$10$Q5xLtgBcc46CDnc.j/mu8ehkeLdIdEtuXYdciuwupQ0xDNE9Dl7ZS	2025-03-28 11:15:47	2		dlqwVBR6TTapFxpv0SQ0sz:APA91bGR6A_4IUpLfpfxVDZgu38aBGp360o6W8wCfjY6NjqIA6xwVHJ3_RAZKr9z8zWznpmtfmNS9oqgKLFjVLkpggm9yC6d72D9hhgrexelqm9UcXwdLTk	android	3c9789dea8dbe9f351ed0d199d3f9cf1bd4f1ec913aed67c73cb9865daa4921c	-OMQaq6hIUVkEZh2q9MK	active	\N	2025-03-28 11:15:47	2025-03-28 11:15:51	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Anil	Ab	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
73	Anil Navis	abc@abc.com	971	5466464949	1	$2y$10$vxzSWgIfCoy9zW/4.CJ9AOoXiC7I8d8TurGNkSwfhirazkokH6nJW	2025-03-28 13:03:11	2		dlqwVBR6TTapFxpv0SQ0sz:APA91bGR6A_4IUpLfpfxVDZgu38aBGp360o6W8wCfjY6NjqIA6xwVHJ3_RAZKr9z8zWznpmtfmNS9oqgKLFjVLkpggm9yC6d72D9hhgrexelqm9UcXwdLTk	android	91d62051ea60323b4d2c77ac0134c01a481660ab1e19f4b8beb77f28fc2a6bea	-OMQzQESk57y4jq4XMHT	active	\N	2025-03-28 13:03:11	2025-03-28 13:03:15	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Anil	Navis	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
74	Cargo Service	cargo@cargo.com	971	6363634634636	1	$2y$10$ZhU1YHVmwZbI3nMe9Gs78.zd5JzAsh06xepWTEVcRWgeAQvNQFoA2	2025-03-28 13:09:54	4	\N	\N	\N	\N	\N	active	\N	2025-03-28 13:09:54	2025-03-28 13:33:04	\N	\N	\N	79PC+PJR - Al Nahda St - Al Nahda - Al Nahda 2 - Dubai - United Arab Emirates	\N	0	25.286837350781997	55.371223635173955	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
54	anil navis	anilnavis@gmail.com	971	5464664946	1	password	2025-03-27 13:56:01	2		cQZQE5uIQ8KSlTC3wgkqBM:APA91bFggusMeVBGWLx2TLC5kfEjI9m0hdryn2tJKqL3WllibFQjoNKD2YtZaa4eg8JLchSxHMD0dVMByHyjCTIzCKoMsY6Nb-gBVIZQNP5jZaaewE0a1rk	android	688d8ac9970ac9fbb90ca612df6b93d8bf24f65285a9c1294571d4a869e3a509	-OMM0vPF0YViN29WC27A	active	\N	2025-03-27 13:56:01	2025-04-03 16:45:02	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	1			\N	anil	navis	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
71	rusvin 123 k	sa1+4@1.com	971	166665	1	$2y$10$.Ky3V/sxq7BxRpK3Hgc.POxR5bPX/qu47hUpaL6xqYNClrYUDDtIW	2025-03-28 12:52:59	2		123123	android	07f247730c17f511dc5ed430c6343b6eee6c05c36af476b46707d7390f22edc3	-OMQtz51tXJ1PrdtJ5yy	active	\N	2025-03-28 12:39:25	2025-03-28 12:53:03	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1		uploads/trade_licenses/EEB8i9ZRSyaFOCFCiIpiUBWfgqVXchwsh5Kp3LSr.jpg	\N	rusvin 123	k	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
85	InComplete User	InCompleteUser@gmail.com	971	1212313364	1	$2y$10$7mE5SFLf2P3KuiWMpZ8EK.mH7u9UHgJdLfXMTmoRmpwIK58OLzB42	2025-04-05 22:32:45	4	\N	\N	\N	\N	\N	inactive	\N	2025-04-05 22:32:45	2025-04-05 22:32:45	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0
80	Davis Movers	davis@davis.com	971	1234512345	1	$2y$10$tc2InGPVjfV.sS2t8SoA.ehIiTv3cT3lpNJjgho7WxkE4Zec9RKMm	2025-04-03 09:55:54	4	\N	\N	\N	\N	\N	inactive	\N	2025-04-03 09:55:54	2025-04-03 11:44:44	\N	\N	\N	56VJ+WX7 - Jumeirah - Dubai - United Arab Emirates	\N	0	25.194320852633854	55.23324966430664	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	1	cus_S3oN7yGDsvqmd4	1	1	1
72	rusvin 123 k	sa1+5@1.com	971	166665	1	$2y$10$huB8Vl/Jcegp5.Zdpf1Uu.tVyriT7DYUgr/rSC2KJ5TXnXgDzgCH.	2025-03-28 12:58:03	2		123123	android	103ab24b95ed8a4f560a299cff2a81e7c1ab803293e6007a60ddc5e01f7f1052	-OMQxub4ndTp_yK5kxWS	active	\N	2025-03-28 12:56:35	2025-03-28 12:58:07	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1		uploads/trade_licenses/oaC2CFS0GLIUZoWw3VlFPq0JnyhlES65t9xiI5pj.jpg	\N	rusvin 123	k	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
77	Usama Shakeel	ushakeel@ymail.com	971	124124124	1	$2y$10$smZqNapd0XkjN9oFC/Y5SOsFn.//QhoGcn0jGdt44GbghaXglKyvW	2025-03-30 01:59:51	2	\N	dL4O8rizTs6q5DkB7Ah0Lo:APA91bHst2oZsrXRsnKZzROxVkULeyVEar5hcIDwQcZxpCZHXB8miXrALolIlj8v74wc9rSrr6YBsKrbTNzdobpIyaxQyp_OLslAhlvjsW0L-Gq9S-_mrVI	android	18c0e29abfbfefb7554145ab6719f068f06dd56f498d81c697c8527317673d05	-OMXGcVizSzPF62jStYR	active	\N	2025-03-29 18:20:27	2025-03-30 01:59:51	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Usama	Shakeel	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
76	DXB APPS	habeebuddindxba@gmail.com	971	555555552	1	$2y$10$7YZNPBddKYsaV2ThaE9Zk.tJgsoL/15MjmqEXyGXCv0K9eSQE264y	2025-03-29 10:43:49	4	\N	\N	\N	\N	\N	inactive	\N	2025-03-29 10:43:49	2025-03-29 10:43:49	\N	\N	\N	57JC+JJC - Business Bay - Dubai - United Arab Emirates	\N	0	25.1815668	55.27151019999999	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
79	Mack John	mack+1@gmail.com	971	122121333	1	$2y$10$iqdWER2K6C37ZyAhyX/V4eqB6BnpO3/Tfi.xNFVU4lag9bL.DkR52	2025-04-02 20:36:42	4	\N	\N	\N	\N	\N	inactive	\N	2025-04-02 20:36:42	2025-04-03 14:02:43	\N	\N	\N	3MQ4+W9G, Multan - Vehari Rd, Makhdum Rashid, Pakistan	\N	0	30.0892835	71.6552355	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	cus_S3bU6PGAOrdwUI	1	1	1
75	Usama Shakeel	ushakeel@gmail.com	971	123123123	1	$2y$10$XLllD.Y52asl1mUvu5hW0eG5RkGF5.SdK5BOcswPqyu8tb83vx7C.	2025-04-03 19:06:24	2	\N	ctAOrTGwSPqG6bXYd_HPbV:APA91bGMS3W-qdS9SBEYSqknL6ym3Jrsw7xTNiMj2HymWSb3oXyNaXvi3_rEq8aNWgWl8bmiI5iiyJjMUX-UmAIe7h2X47pYuAYJRmLq_775UDZP6vPLWzY	android	ee66b8ab244d4617f33701ab9d01da5f6a346a4024aea7d966d4741fd774bc33	-OMVZTLqwo-Npvrzs_V-	active	\N	2025-03-29 10:23:32	2025-04-03 19:06:24	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Usama	Shakeel	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
78	Mack John	mack@gmail.com	971	12121333	1	$2y$10$45krX3E/T..K2zVmG8aPfOyRcP7z1TsPyPZvjmVOTsYaa/N3d3AZG	2025-04-02 19:17:58	4	\N	\N	\N	\N	\N	inactive	\N	2025-04-02 19:17:58	2025-04-02 19:17:58	\N	\N	\N	Dubai International Airport (DXB) - Dubai - United Arab Emirates	\N	0	25.2566932	55.36431779999999	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
81	Navis Movers	navis@navis.com	971	35353253255	1	$2y$10$9wowd89iqoxfXFuehS9DZuRMZXJk5Z8bp5pLa3XwjH.hyLSfOB9ee	2025-04-03 14:52:41	4	\N	\N	\N	\N	\N	active	\N	2025-04-03 14:52:41	2025-04-04 11:59:43	\N	\N	\N	109 Umm Al Sheif Rd - Al Safa - Al Safa 1 - Dubai - United Arab Emirates	\N	0	25.16930921962888	55.22916687817382	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2	cus_S3tAogU4IFeBQE	1	1	1
83	Lutfi Alhashimi	lutfialhashimi@hotmail.com	971	504113314	1	$2y$10$EnQCOHywE6.duOz6Qb81fuuZYObGrS9VHLMh1qftd3qIcz1pCA2GS	2025-04-03 22:59:44	2		dg_4LY5OQ1i7vgoOhwM--u:APA91bHXReRtFgFGYBHNqs9CFD4gebh84hYLW9kV1jB2rZaDQzSYn6TPX_JfLGsldKWBUIUhbcEs3k3tUMktWDl-Hf7ZCkeTokPintFcCE-vi-oWsSEHvKE	android	7db617768950e9aa7d8ea489c226bd1d7e910d2762a73c6577aa96559faa3261	-OMx0VQaHuYn7AsoBI_C	active	\N	2025-04-03 22:59:44	2025-04-03 23:10:11	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Lutfi	Alhashimi	1		2025-04-03 19:09:45	0	\N	\N	\N	\N	\N	\N	1	1	1
86	Complete User	InCompleteUser+1@gmail.com	971	1212353364	1	$2y$10$dZeQujhw8dkfejQURq9mfuc19uwzf00HKQe/6piKwJ4Na7bz11Zuu	2025-04-05 22:34:27	4	\N	\N	\N	\N	\N	active	\N	2025-04-05 22:34:27	2025-04-05 23:58:57	\N	\N	\N	3MQ4+W9G, Multan - Vehari Rd, Makhdum Rashid, Pakistan	\N	0	30.0892835	71.6552355	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	tok_1RAccoRwhoKMBfqceT68fJ4U	1	1	1
84	Lutfie Alhashimi	dhdhdh@hdjdjdj.com	971	504113314	1	$2y$10$WQjdENySPrje5GnrT2AQKueTDzqmmvyQ8C/8ReQ/yte4Z5zqdWheG	2025-04-03 23:13:31	2		dg_4LY5OQ1i7vgoOhwM--u:APA91bHXReRtFgFGYBHNqs9CFD4gebh84hYLW9kV1jB2rZaDQzSYn6TPX_JfLGsldKWBUIUhbcEs3k3tUMktWDl-Hf7ZCkeTokPintFcCE-vi-oWsSEHvKE	android	962ddb10ab614949b8d9ee25d204c2d1cc9e8bc6ec6e2584751625e65b7f6559	-OMx3e3jNmUBQM1fUDrE	active	\N	2025-04-03 23:13:31	2025-04-03 23:13:34	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Lutfie	Alhashimi	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1
82	Nacro Cargo	navis1@navis1.com	971	3453534535	1	$2y$10$lLB3UKrHt8RLeyDT.9rzfu2k0G8KZgkME7e3dpvvzMg.kZ/LY9/Sq	2025-04-03 21:17:44	4	\N	\N	\N	\N	\N	active	\N	2025-04-03 21:17:44	2025-04-05 22:03:25	\N	\N	\N	34 Al Mamsha St - Jumeirah Beach Residence - Dubai - United Arab Emirates	\N	0	25.0779132	55.1317205	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	tok_1RAb3dRwhoKMBfqcNxV0Onwe	1	1	1
87	Navis Trasnport	navtra@navtra.com	971	535235235	1	$2y$10$KNKhyTqUuYZIUQvRIJjbxu0fMh4rczQRgobaJZfTVwDoti3RAJ2VO	2025-04-06 13:36:37	4	\N	\N	\N	\N	\N	active	\N	2025-04-06 13:36:37	2025-04-07 10:41:41	\N	\N	\N	79PC+Q97 - Al Nahda - Al Nahda 2 - Dubai - United Arab Emirates	\N	0	25.286928	55.371017	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	tok_1RB9NIRwhoKMBfqc3yHSn4hJ	1	1	1
\.


--
-- Data for Name: vehicle_models; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle_models (id, type_id, manufacturer_id, model, model_ar, status, created_at, updated_at) FROM stdin;
2	1	1	Range Sports	\N	1	2025-03-27 20:30:36	2025-03-27 20:30:36
1	1	1	Discovery	City	1	2025-03-24 12:31:08	2025-03-28 07:47:56
\.


--
-- Data for Name: vehicle_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle_types (id, manufacturer_id, model, model_ar, status, created_at, updated_at) FROM stdin;
1	\N	Car	Car	1	2025-03-24 12:30:27	2025-03-24 12:30:27
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

SELECT pg_catalog.setval('public.booking_home_relocations_id_seq', 17, true);


--
-- Name: booking_item_deliveries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_item_deliveries_id_seq', 5, true);


--
-- Name: booking_office_relocations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_office_relocations_id_seq', 7, true);


--
-- Name: booking_pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_pictures_id_seq', 39, true);


--
-- Name: booking_qoutes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_qoutes_id_seq', 74, true);


--
-- Name: booking_reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_reviews_id_seq', 1, false);


--
-- Name: booking_status_trackings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_status_trackings_id_seq', 1, false);


--
-- Name: booking_storage_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_storage_services_id_seq', 19, true);


--
-- Name: booking_vehicle_recoveries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_vehicle_recoveries_id_seq', 4, true);


--
-- Name: booking_vehicle_relocations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_vehicle_relocations_id_seq', 7, true);


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_id_seq', 121, true);


--
-- Name: business_enquiries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.business_enquiries_id_seq', 4, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 7, true);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_id_seq', 45, true);


--
-- Name: company_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_categories_id_seq', 99, true);


--
-- Name: contact_page_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_page_settings_id_seq', 10, true);


--
-- Name: contact_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_us_id_seq', 10, true);


--
-- Name: contact_us_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_us_requests_id_seq', 1, true);


--
-- Name: countries_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_country_id_seq', 2, true);


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
-- Name: faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faq_id_seq', 1, true);


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
-- Name: manufacturers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.manufacturers_id_seq', 1, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 126, true);


--
-- Name: new_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.new_notifications_id_seq', 139, true);


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

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 147, true);


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

SELECT pg_catalog.setval('public.temp_users_id_seq', 15, true);


--
-- Name: truck_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.truck_types_id_seq', 1, false);


--
-- Name: user_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_address_id_seq', 1, false);


--
-- Name: user_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_cards_id_seq', 6, true);


--
-- Name: user_password_resets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_password_resets_id_seq', 1, false);


--
-- Name: user_ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_ratings_id_seq', 16, true);


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

SELECT pg_catalog.setval('public.users_id_seq', 87, true);


--
-- Name: vehicle_models_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_models_id_seq', 2, true);


--
-- Name: vehicle_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_types_id_seq', 1, true);


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
-- Name: booking_item_deliveries booking_item_deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_item_deliveries
    ADD CONSTRAINT booking_item_deliveries_pkey PRIMARY KEY (id);


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
-- Name: booking_vehicle_recoveries booking_vehicle_recoveries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_vehicle_recoveries
    ADD CONSTRAINT booking_vehicle_recoveries_pkey PRIMARY KEY (id);


--
-- Name: booking_vehicle_relocations booking_vehicle_relocations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_vehicle_relocations
    ADD CONSTRAINT booking_vehicle_relocations_pkey PRIMARY KEY (id);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: business_enquiries business_enquiries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business_enquiries
    ADD CONSTRAINT business_enquiries_pkey PRIMARY KEY (id);


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
-- Name: contact_us contact_us_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us
    ADD CONSTRAINT contact_us_pkey PRIMARY KEY (id);


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
-- Name: faq faq_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faq
    ADD CONSTRAINT faq_pkey PRIMARY KEY (id);


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
-- Name: manufacturers manufacturers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT manufacturers_pkey PRIMARY KEY (id);


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
-- Name: user_address user_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address
    ADD CONSTRAINT user_address_pkey PRIMARY KEY (id);


--
-- Name: user_cards user_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_cards
    ADD CONSTRAINT user_cards_pkey PRIMARY KEY (id);


--
-- Name: user_password_resets user_password_resets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_password_resets
    ADD CONSTRAINT user_password_resets_pkey PRIMARY KEY (id);


--
-- Name: user_ratings user_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_ratings
    ADD CONSTRAINT user_ratings_pkey PRIMARY KEY (id);


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

