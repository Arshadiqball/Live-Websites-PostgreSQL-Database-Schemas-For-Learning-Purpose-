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
    vendor_id bigint,
    permissions json,
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
18	122	1	2025-04-16	2025-04-16	\N	\N	Ddd	\N	Hshs	\N	Jsjs	\N	6FJP+5J, Madharian Wala Kalar, Pakistan,	\N	32.23065993013282	\N	74.48598973453045	\N	Apartment	\N	1	\N	Ansk	No	\N	No	Ajaaj2	\N	2025-04-14 18:44:06	2025-04-14 18:44:06	Sjsj	\N
19	123	1	2025-04-30	2025-04-30	\N	\N	Abu dhabi	Dubai	Adnec	Brach	Adnec 1	Beach house	F9FG+8HR - Al Nahyan - E19 02 - Abu Dhabi - United Arab Emirates,	Al Rahah - RBW13 - Abu Dhabi - United Arab Emirates,	24.47333107961812	24.436091114136897	54.37640927731991	54.55612499266863	Apartment	Apartment	2	2	Not required	No	No	No	No further details	Not required	2025-04-16 19:44:13	2025-04-16 19:46:45	1	A
20	125	1	2025-04-16	2025-04-17	\N	\N	Abubdhabi	Dubai	Adnec	Dubai	Dhdhe	Dubai	2012 Sheikh Rashid Bin Saeed St - Al Rawdah - W54 - Abu Dhabi - United Arab Emirates,	E11 - Mina Jebel Ali - Dubai - United Arab Emirates,	24.416406276644413	25.01223755058909	54.473123364150524	55.09960290044546	Apartment	Apartment	1	1	Non	No	No	No	Non	Test	2025-04-16 20:00:53	2025-04-16 20:01:54	2	E
21	144	1	2025-04-18	2025-04-18	\N	\N	Rawalpindi	Rawalpindi	Asd	Asd	888	888	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, 46000, Pakistan,	J3M5+R5X, Mohallah Raja Sultan Block E Satellite Town, Rawalpindi, 46000, Pakistan,	33.634621898655695	33.6346258067058	73.05787838995457	73.05787906050682	Apartment	Apartment	2	2	Asd	No	No	No	Asd	Asd	2025-04-18 22:47:00	2025-04-18 22:47:48	9765	8888
22	147	1	2025-04-20	2025-04-30	\N	\N	Muzaffarabad	Islamabad	Dehria n	Blue area	Majid manzal	Giga mall	5/34 New, Eid Gah Rd, Double Tanki Colony, Shah Jamal, Aligarh, Uttar Pradesh 202001, India,	Sector F DHA Phase II, Islamabad, Pakistan,	27.879432380339193	33.52111133360636	78.05379811674356	73.15851923078299	Apartment	Townhouse	2	5	Vvv	Yes	Yes	Yes	Gvg	Ggg	2025-04-20 11:42:47	2025-04-20 11:44:13	#12344	13
23	180	1	2025-04-22	2025-04-22	\N	\N	Rawalpindi	\N	Area	\N	Asd	\N	Dubai	\N	25.2048493	\N	55.2707828	\N	Apartment	\N	2	\N	Add	No	\N	No	Jjji	\N	2025-04-22 16:12:25	2025-04-22 16:12:25	998	\N
24	181	1	2025-04-22	2025-04-22	\N	\N	Asd	\N	Asd	\N	Asd	\N	Business Bay Square (BBS) Mall	\N	-1.279781	\N	36.8465397	\N	Apartment	\N	2	\N	Asd	No	\N	No	Add	\N	2025-04-22 17:03:45	2025-04-22 17:03:45	Add	\N
25	183	1	2025-04-22	2025-04-22	\N	\N	Rawalpindi	\N	Arwa	\N	Asd	\N	Dubai Mall	\N	25.1972295	\N	55.27974699999999	\N	Apartment	\N	2	\N	Add	No	\N	No	Details	\N	2025-04-22 17:17:22	2025-04-22 17:17:22	Add	\N
26	187	1	2025-05-02	2025-05-02	\N	\N	Rawalpindi	\N	Asd	\N	Asf	\N	882 St. 3, Block F New Katarian Satellite Town, Rawalpindi, 46000, Pakistan,	\N	33.642409173980646	\N	73.05622112005949	\N	House	\N	2	\N	Asd	No	\N	No	Asd	\N	2025-05-02 19:17:31	2025-05-02 19:17:31	Asd	\N
27	188	1	2025-05-02	2025-05-02	\N	\N	RaJa	\N	sds	\N	Asd	\N	882 St. 3, Block F New Katarian Satellite Town, Rawalpindi, 46000, Pakistan,	\N	33.64241363991971	\N	73.05622413754463	\N	Apartment	\N	2	\N	Asd	No	\N	No	Asdf	\N	2025-05-02 22:57:43	2025-05-02 22:57:43	Ahaha	\N
28	189	1	2025-05-22	2025-05-22	\N	\N	Rad	\N	Cvv	\N	Bbb	\N	882 St. 3, Block F New Katarian Satellite Town, Rawalpindi, 46000, Pakistan,	\N	33.64241252343497	\N	73.05622648447752	\N	Apartment	\N	2	\N	Cvvg	No	\N	No	Vvvv	\N	2025-05-03 11:14:18	2025-05-03 11:14:18	Yyy	\N
29	190	1	2025-05-03	2025-05-03	\N	\N	Rawalpindi	\N	Asd	\N	Asd	\N	882 St. 3, Block F New Katarian Satellite Town, Rawalpindi, 46000, Pakistan,	\N	33.642406382768606	\N	73.05622346699238	\N	Apartment	\N	2	\N	Asd	No	\N	No	Asd	\N	2025-05-03 12:31:47	2025-05-03 12:31:47	Asf	\N
30	192	1	2025-05-12	2025-05-12	\N	\N	Ahsjs	\N	Shahs	\N	Ahsjs	\N	Hamburg	\N	53.5488282	\N	9.987170299999999	\N	House	\N	2	\N	shah	No	\N	No	Haha	\N	2025-05-12 13:25:11	2025-05-12 13:25:11	She’s	\N
31	193	1	2025-05-12	2025-05-12	\N	\N	Waste	\N	Fghhj	\N	Fun	\N	Dubai International Airport	\N	25.2566932	\N	55.36431779999999	\N	House	\N	2	\N	Zach	No	\N	No	Schumer	\N	2025-05-12 14:07:02	2025-05-12 14:07:02	Think	\N
32	194	1	2025-05-12	2025-05-12	\N	\N	Asf	\N	Add	\N	Asd	\N	Dubai Mall	\N	25.1972295	\N	55.27974699999999	\N	Apartment	\N	2	\N	Add	No	\N	No	Asfg	\N	2025-05-12 14:20:28	2025-05-12 14:20:28	Dre	\N
33	195	1	2025-05-12	2025-05-12	\N	\N	Asd	\N	Asff	\N	Adf	\N	Dubai International Airport	\N	25.2566932	\N	55.36431779999999	\N	House	\N	2	\N	Add	No	\N	No	Asdf	\N	2025-05-12 14:56:19	2025-05-12 14:56:19	Add	\N
34	196	1	2025-05-12	2025-05-12	\N	\N	Asd	\N	Add	\N	Asd	\N	Dubai	\N	25.2048493	\N	55.2707828	\N	House	\N	3	\N	Add	No	\N	No	Added	\N	2025-05-12 15:03:58	2025-05-12 15:03:58	Add	\N
35	197	1	2025-05-12	2025-05-12	\N	\N	Rawalpindi	\N	Asd	\N	Add	\N	Dubai International Airport	\N	25.2566932	\N	55.36431779999999	\N	House	\N	2	\N	Adds	No	\N	No	Add	\N	2025-05-12 16:00:42	2025-05-12 16:00:42	72	\N
36	198	1	2025-05-12	2025-05-12	\N	\N	Rawalpindi	\N	Asf	\N	Asd	\N	Dubai International Airport	\N	25.2566932	\N	55.36431779999999	\N	House	\N	3	\N	Asdf	No	\N	No	Asdf	\N	2025-05-12 16:54:02	2025-05-12 16:54:02	999	\N
37	199	1	2025-05-12	2025-05-12	\N	\N	Tawau	Asdd	Asd	Addf	Asdd	Addf	Dubai International Airport	Dubai International Airport	25.2566932	25.2566932	55.36431779999999	55.36431779999999	House	House	3	2	Ahsjs	No	No	No	Hahaha	Asdf	2025-05-12 16:59:55	2025-05-12 17:00:49	Asdf	Add
38	201	1	2025-05-12	2025-05-12	\N	\N	Rawalpindi	Rawa said	Asd	Add	Asd	Add	Dubai Mall	Dubai International Airport	25.1972295	25.2566932	55.27974699999999	55.36431779999999	House	House	2	4	Add	No	No	No	Add	Asdf	2025-05-12 20:59:39	2025-05-12 21:00:43	Add	A828
39	204	1	2025-05-13	2025-05-13	\N	\N	Rawalipi	Rw	Asd	Asd	Building	Add	Dubai International Airport	Dubai	25.2566932	25.2048493	55.36431779999999	55.2707828	House	House	2	2	Add	No	No	No	Asdf	Drop off details	2025-05-13 15:14:34	2025-05-13 15:15:35	838	0987
40	205	1	2025-05-13	2025-05-13	\N	\N	Rwp	Rwp	My area	Rwp	Building234	2782	882 St. 3, Block F New Katarian Satellite Town, Rawalpindi, 46000, Pakistan,	882 St. 3, Block F New Katarian Satellite Town, Rawalpindi, 46000, Pakistan,	33.64240554540496	33.64240554540496	73.05622313171625	73.05622313171625	House	House	2	2	Asdd	No	No	No	Asdf	Ajsjs	2025-05-13 15:17:29	2025-05-13 15:18:01	93993	82828
41	208	1	2025-05-13	2025-05-19	\N	\N	Rwp	Fas	Awe	Asdf	Bui	Buyggh	Dubai International Airport	Dubai Marina	25.2566932	25.0806744	55.36431779999999	55.13979209999999	House	Apartment	2	2	Asdf	No	No	No	Asdf	Asfghh	2025-05-13 22:19:44	2025-05-13 22:20:32	246	789999
42	237	1	2025-05-16	2025-05-19	\N	\N	Dubai	Abudhabi	Karama	Musaffa	Al watbha	Al khaja	Dubai	Abu Dhabi Mall	25.2048493	24.4959241	55.2707828	54.3832259	Apartment	House	2	4	The first time the two sides agreed to meet yyyyyuuy	Yes	Yes	Yes	The only way I could do that was if you wanted me too but you don’t want me too so you don’t need me too	The only way I could do that was if you wanted me too but you don’t want me too so you	2025-05-14 15:31:18	2025-05-14 15:35:23	15 yyyyyu	411
43	240	1	2025-05-14	2025-05-18	\N	\N	Rwpr	Asdgh	Asd	Advgv	Ausjs	Advb	Dubai	Dubai International Airport	25.2048493	25.2566932	55.2707828	55.36431779999999	House	House	3	3	Asdf	No	No	No	Agatha	Hajajaja	2025-05-14 16:58:12	2025-05-14 16:58:48	Usually	82828
44	241	1	2025-05-14	2025-05-16	\N	\N	Rawalpindi	Agsh	Asd	Ahajja	Add	Ahhah	Dubai Hills Mall	Dubai Mall	25.1019364	25.1972295	55.2394214	55.27974699999999	House	House	2	3	Add	No	No	No	Banana	Haha	2025-05-14 17:05:51	2025-05-14 17:06:21	Add	828
45	243	1	2025-05-14	2025-05-14	\N	\N	Hsjjs	Huuuu	Shhsh	Yhhh	Hahsh	Hhhh	Dubai Mall	Dubai International Airport	25.1972295	25.2566932	55.27974699999999	55.36431779999999	House	Apartment	3	3	Haha	No	No	No	Banana	Hhhh	2025-05-14 19:26:17	2025-05-14 19:27:05	Shah	Bbbb
46	244	1	2025-05-14	2025-05-18	\N	\N	Addf	Hahaj	See	Auia	Eddd	Haha	Dubai Hills Mall	Dubai International Airport	25.1019364	25.2566932	55.2394214	55.36431779999999	Apartment	Apartment	2	3	Ahsjs	No	No	No	Banana	Haha	2025-05-14 19:55:48	2025-05-14 19:56:23	Sss	Shah
47	245	1	2025-08-14	2025-10-16	\N	\N	Rawalpindi	Aggaha	Asf	Hahaha	Adf	Hahshsj	Dubai Mall	Dubai Hills Mall	25.1972295	25.1019364	55.27974699999999	55.2394214	House	House	2	2	Hahaha	No	No	No	Banana	Hahah	2025-05-14 20:40:50	2025-05-14 20:41:27	She	8382
48	246	1	2025-05-18	2025-05-20	\N	\N	Karama	Abudhabi	Butdibai	Hii	Al Khama	Al watbha	Dubai Hills Mall	Abu Dhabi	25.1019364	24.453884	55.2394214	54.3773438	Apartment	House	2	4	The only way I could do that was if you wanted me too I could come and	Yes	Yes	Yes	The first time the two sides agreed to meet on uuyyyuu	The only way I could do that was if you had the right person and the	2025-05-15 07:56:29	2025-05-15 07:57:52	101	127
49	249	1	2025-05-17	2025-05-18	\N	\N	Ff	Vvd	Dr	Sj	Rrr	Hhh	Dubai Mall	Abu Dhabi Mall	25.1972295	24.4959241	55.27974699999999	54.3832259	House	House	4	3	The first time the two sides agreed to meet on a single day was when they were to hold the talks at an early afternoon news meeting	Yes	No	Yes	Ftygggg I need a break now and then	The only way I could do that was if you	2025-05-17 07:32:39	2025-05-17 07:33:33	344	Guy
50	251	1	2025-05-21	2025-05-21	\N	\N	Rawalpindi	Asd	Asd	Add	Asd	Ahhs	Dubai Hills Mall	Dubai International Airport	25.1019364	25.2566932	55.2394214	55.36431779999999	House	House	2	2	Banana	No	No	No	Hahahah	Arafat	2025-05-17 11:09:35	2025-05-17 11:10:10	8899	Ahsjs
51	253	1	2025-05-17	2025-05-17	\N	\N	Asd	\N	Sf	\N	Asd	\N	J3V4+78M, Block F New Katarian Satellite Town, Rawalpindi, Pakistan,	\N	33.64257692565774	\N	73.05623084306717	\N	House	\N	4	\N	Asd	No	\N	No	Asd	\N	2025-05-17 11:27:48	2025-05-17 11:27:48	Add	\N
52	254	1	2025-05-17	2025-05-17	\N	\N	Asd	Hzhz	Asf	Znsjs	Adf	Znnsjs	J3V4+78M, Block F New Katarian Satellite Town, Rawalpindi, Pakistan,	Muslim Higher secondary School, Saidpur Rd, Asghar Mall Scheme, Rawalpindi, Pakistan,	33.642572180606486	33.629967843439736	73.05623319000006	73.06409809738398	Apartment	House	2	2	Addx	No	No	No	I'm Ns	Absbhs	2025-05-17 11:28:39	2025-05-17 11:29:11	Add	Ahjss
53	256	1	2025-05-17	2025-05-18	\N	\N	Asd	Agsg	Adf	Absb	Add	Gsgs	J3V4+78M, Block F New Katarian Satellite Town, Rawalpindi, Pakistan,	J3F6+492, Pir Choha Mohalla, Rawalpindi, 46000, Pakistan,	33.6425752509338	33.62287182353871	73.05623151361942	73.06100718677044	House	House	2	2	Asd	No	No	No	Asd	Asdf	2025-05-17 12:03:00	2025-05-17 12:03:27	Add	Gshs
54	257	1	2025-05-19	2026-05-19	\N	\N	Rwp	Ahha	Asd	Ausjs	Add	Ahhs	Dubai Mall	Dubai	25.1972295	25.2048493	55.27974699999999	55.2707828	Apartment	House	2	2	Add	No	No	No	Add	Ahsjs	2025-05-17 12:15:13	2025-05-17 12:15:43	A82	Ahsjs
55	258	1	2025-05-17	2025-05-17	\N	\N	Rawalpindi	Asd	Asd	Asd	Asd	Adc	J3V4+78M, Block F New Katarian Satellite Town, Rawalpindi, Pakistan,	Sarafa Bazar Rd, J384+J6H, Kalan Bazar, Raja Bazar, Shan Chan Chiragh, Rawalpindi, 46000, Pakistan,	33.64256966852041	33.61657151533495	73.05623285472393	73.05559817701578	Apartment	House	2	2	Asd	No	No	No	Asf	Asd	2025-05-17 12:18:08	2025-05-17 12:18:33	999	Add
56	259	1	2025-05-17	2025-05-17	\N	\N	Agga	Vagab	Ahshs	Aban	Ahsh	Abba	Dubai Mall	Dubai International Airport	25.1972295	25.2566932	55.27974699999999	55.36431779999999	House	Apartment	2	2	Afaga	No	No	No	Asdf	Ahsjs	2025-05-17 12:51:28	2025-05-17 12:52:00	Anna	Baba
57	260	1	2025-05-17	2025-05-17	\N	\N	Asd	Asd	Asd	Asd	Add	Add	Dubai Hills Mall	Dubai International Airport	25.1019364	25.2566932	55.2394214	55.36431779999999	House	Apartment	2	4	Asdf	No	No	No	Afga	Asdf	2025-05-17 14:52:55	2025-05-17 14:53:26	Add	Add
58	262	1	2025-05-17	2025-05-20	\N	\N	Asd	Raw	Add	Ahsjs	Add	Ahaj	Dubai Mall	Dubai	25.1972295	25.2048493	55.27974699999999	55.2707828	Apartment	Apartment	2	2	Hahaha	No	No	No	Jajaja	Haha	2025-05-17 16:18:31	2025-05-17 16:19:08	Add	Hahah
59	263	1	2025-05-17	2025-05-17	\N	\N	Asd	Vabab	Asd	Ahahha	Add	Ahahha	Dubai Mall	Dubai Marina	25.1972295	25.0806744	55.27974699999999	55.13979209999999	House	Apartment	2	2	Add	No	No	No	Add	Hahaha	2025-05-17 17:06:30	2025-05-17 17:07:02	Add	Haha
60	264	1	2025-05-17	2025-05-18	\N	\N	Ahaha	Nanaj	Ahaha	Ajajja	Ahhahs	Ahajja	Duarte	Dubai International Airport	34.1394513	25.2566932	-117.9772873	55.36431779999999	House	House	2	2	Hahah	No	No	No	Hahah	Hahaha	2025-05-17 17:11:41	2025-05-17 17:12:11	Ahsjs	Hahah
61	265	1	2025-06-17	2025-06-17	\N	\N	Hss	Jajaj	Hash	Haja	Ajaja	Hahaj	Dubai International Airport	Dubai	25.2566932	25.2048493	55.36431779999999	55.2707828	Apartment	Apartment	2	2	Ahsjs	No	No	No	Hahah	Hahaha	2025-05-17 17:19:26	2025-05-17 17:19:55	Shah	Haha
62	274	1	2025-05-18	2025-05-18	\N	\N	Ahsjs	Hahah	Aushs	Hahaha	Ahsjs	Nanana	Dubai Mall	Dubai Hills Mall	25.1972295	25.1019364	55.27974699999999	55.2394214	House	Apartment	2	2	Nanana	No	No	No	Shanks	Hahah	2025-05-18 00:56:36	2025-05-18 00:57:10	Hahah	Hahaha
63	276	1	2025-05-18	2025-05-18	\N	\N	Red	Hahah	Haha	Nanana	Banana	Nanana	Dubai International Airport	Dubai Hills Mall	25.2566932	25.1019364	55.36431779999999	55.2394214	House	House	2	2	Nanana	No	No	No	Nanana	Nana	2025-05-18 01:03:15	2025-05-18 01:03:47	Banana	Banana
64	283	1	2025-05-22	2025-05-25	\N	\N	Asdd	Hahaha	Add	Banana	Hahah	Hahaha	Dubai Mall	Dubai Hills Mall	25.1972295	25.1019364	55.27974699999999	55.2394214	House	House	2	2	Hahaha	No	No	No	Hahah	Hahaha	2025-05-19 10:51:43	2025-05-19 10:52:18	Hahaha	Hahaha
65	284	1	2025-05-19	2025-05-23	\N	\N	Usuia	Hahah	Hahah	I’m Anna	Banana	Hahah	Dubai Mall	Dubai Marina	25.1972295	25.0806744	55.27974699999999	55.13979209999999	Apartment	House	2	2	Hahah	No	No	No	Jajaja	Hahah	2025-05-19 10:54:32	2025-05-19 10:55:06	Ahsjs	Banana
66	285	1	2025-05-19	2025-05-19	\N	\N	Hahah	Hahaha	Auah	Banana	Ahah	Banana	Dubai Mall	Dubai Hills Mall	25.1972295	25.1019364	55.27974699999999	55.2394214	House	Apartment	3	2	Haha	No	No	No	Banana	Nana	2025-05-19 10:58:13	2025-05-19 10:58:43	Haha	88
67	286	1	2025-05-19	2025-05-19	\N	\N	Hahah	Haha	I’m anna	Baba	Ahaha	Baba	Dubai	Dubai Marina	25.2048493	25.0806744	55.2707828	55.13979209999999	Apartment	House	2	2	Nana	No	No	No	Ha	Jan	2025-05-19 10:59:19	2025-05-19 10:59:50	Shah	Nana
68	287	1	2025-05-19	2025-05-19	\N	\N	Asd	Add	Add	Haha	Add	Nana	Dubai Mall	Dubai Hills Mall	25.1972295	25.1019364	55.27974699999999	55.2394214	Apartment	Apartment	2	2	Add	No	No	No	Haha	Add	2025-05-19 14:33:43	2025-05-19 14:34:11	Add	Banana
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
8	250	3	2025-05-18	2025-05-19	United Arab Emirate	United Arab Emirate	Drf	Musafga	See	Al walqa 12	Rrt	Was	23	Ss	Dubai Mall	Abu Dhabi Mall	25.1972295	24.4959241	55.27974699999999	54.3832259	The only way I could do that would probably have	Yes	Yes	Yes	The only way I could do this was if we were going on the road together I	The first time the two sides agreed to meet	2025-05-17 08:34:01	2025-05-17 08:34:57
9	271	3	2026-05-17	2026-05-19	United Arab Emirate	United Arab Emirate	Dubai	Mustafa	Karama	Nadha	Al watch	Al khail	812B	682	Dubai Hills Mall	Abu Dhabi	25.1019364	24.453884	55.2394214	54.3773438	The first time the two sides agreed to meet on a single day was when they	Yes	Yes	Yes	The only way I could do that was if we could go out for lunch with	The only way I could do this	2025-05-17 19:41:31	2025-05-17 19:42:53
10	280	3	2025-05-19	2025-05-20	United Arab Emirate	United Arab Emirate	Al Karama	Abudhsbi	New Karama	Nasjs	Al Khail	208	812	700	Karama Centre	Abu Dhabi Mall	25.2453653	24.4959241	55.30314370000001	54.3832259	The first time the two sides agreed to meet on a single day was when a new government in	Yes	Yes	Yes	The only way I could do that was if you wanted me too but YYYY	The only way I could do that was if you wanted me	2025-05-18 20:42:31	2025-05-18 21:01:49
11	290	3	2025-05-19	2025-05-19	United Arab Emirate	\N	Dubai	\N	Karama	\N	8B	\N	Al walk	\N	Dubai Mall	\N	25.1972295	\N	55.27974699999999	\N	The first time the two sides agreed to meet uyyyy	Yes	\N	Yes	The only way I could do that was if you had the Yoo	\N	2025-05-19 17:03:20	2025-05-19 17:03:20
12	293	3	2025-05-20	2025-05-21	United Arab Emirate	United Arab Emirate	Dubai	Abudhabi	Karama	Musaffa	Al watbha	Lootaj	816	123	Karama Centre	Abu Dhabi Mall	25.2453653	24.4959241	55.30314370000001	54.3832259	The only way I could do that was if you wanted me too but you	Yes	Yes	Yes	The only way I could do that would probably take a week off	The first time the two sides were able together	2025-05-19 21:35:10	2025-05-19 21:36:11
13	294	3	2025-05-20	2025-05-21	United Arab Emirate	United Arab Emirate	Dubai	Abudhabi	Karama	Musaffa	Watbja	Lootah	321	812	Karama Centre	Abu Dhabi Mall	25.2453653	24.4959241	55.30314370000001	54.3832259	The only way I could do that was if you wanted me too	Yes	Yes	Yes	The only way I could do that was if you wanted me too yyyy	The first time the two sides agreed to meet on	2025-05-19 21:54:19	2025-05-19 21:56:12
14	296	3	2025-05-20	2025-05-22	United Arab Emirate	United Arab Emirate	Dubai	Abudhabi	Karama	Mustafa	Al watbha	Mud build	127	Y527Vb	Karama Centre	Musaffah	25.2453653	24.3676269	55.30314370000001	54.49135709999999	The only way I could do that was if	Yes	Yes	Yes	The only way I could do that was if you wanted me too but I’m	The only way I could do that	2025-05-19 22:28:49	2025-05-19 22:30:01
15	297	3	2025-05-21	2025-05-23	United Arab Emirate	United Arab Emirate	Dubai	Abudhabi	Karama	Musaffah	Al Wtbha	Al karama	813	683	Karama Centre	M11	25.2453653	24.3623739	55.30314370000001	54.5073618	The first time the two sides agreed to meet on a	Yes	Yes	Yes	The only way I could do that was if you wanted me	The first time the two sides agreed to meet on a yyy	2025-05-19 23:45:07	2025-05-19 23:46:36
16	299	3	2025-05-21	2025-05-23	United Arab Emirate	United Arab Emirate	Dubai	Abudhabi	Karama	Musafa	Al watbha	Loolak	123	816	Karama Centre	Abu Dhabi Mall	25.2453653	24.4959241	55.30314370000001	54.3832259	The only way I could	Yes	Yes	Yes	The only way I could	The only way I could do that was if you	2025-05-19 23:59:31	2025-05-20 00:00:41
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
40	123	lBKXqiuApWFFbZuBwyB3kNXndw4zcIYvQWk8T45s.jpg	2025-04-16 19:44:27	2025-04-16 19:44:27
41	125	KNx9lO74rfO4OvLE6XkrVgvh44UawI6azNTzNSUp.jpg	2025-04-16 20:01:03	2025-04-16 20:01:03
42	144	s5d5enrF5aDF2YtsoClBUObz8YVyKoYtRknSSnaA.jpg	2025-04-18 22:47:15	2025-04-18 22:47:15
43	147	rHOagYvI0m6B6bwbm6yHuJHXMon3VIf1vlf047Lq.jpg	2025-04-20 11:43:07	2025-04-20 11:43:07
44	196	ghkMM0aCnQQWR4owElHMJYC8pEzHoqkpNqhxNsPS.jpg	2025-05-12 15:04:05	2025-05-12 15:04:05
45	197	ajNBYPBCEODZFaizHdUZfqaeBRC5D1daF5tEqL38.jpg	2025-05-12 16:00:55	2025-05-12 16:00:55
46	198	eJUGNzWsietEDTjlu9VnVlNhaY42xKR6bLmuq8WP.jpg	2025-05-12 16:54:10	2025-05-12 16:54:10
47	199	YQKwdTjSbZtFlrfFiJBUZ3tkwCeFLGchg8mOucTu.jpg	2025-05-12 17:00:06	2025-05-12 17:00:06
48	201	YYcuaFr9oZhOSEBzEz3267l3YnoIdjglNvYnaPzg.jpg	2025-05-12 21:00:09	2025-05-12 21:00:09
49	201	m4XJa9WfsKc7S8kPTLnucB2plRd17IktxxfyWOJr.jpg	2025-05-12 21:00:09	2025-05-12 21:00:09
50	204	ezwL6yYZ8osMKSlWs3fHsApWxnnGALnSbwUVujZ8.jpg	2025-05-13 15:14:42	2025-05-13 15:14:42
51	205	RyAuKDrleQSvKv3oMBSrCLmiWOvZlHr6bhltlNLH.jpg	2025-05-13 15:17:37	2025-05-13 15:17:37
52	208	Jm0JyhlZsF0HwioGJx5RvzV8QVxpsTH6p7a6mhdq.jpg	2025-05-13 22:19:55	2025-05-13 22:19:55
53	237	6qZspBZ6gD5ip3QKcDIfejFJtMCrIKBm3k9aCEpL.jpg	2025-05-14 15:32:19	2025-05-14 15:32:19
54	237	gJM2FKqNwKkppzhHRFkvD0PSD3FL3bX6T8to2e53.jpg	2025-05-14 15:32:19	2025-05-14 15:32:19
55	240	tI4rVj8ZOjE52zlsvDcfob4FVx29LRTDLut8D1Lh.jpg	2025-05-14 16:58:20	2025-05-14 16:58:20
56	241	IhlB9MCAIjQqFOZw6sOH540Ek72D0f4Bvw14gSPp.jpg	2025-05-14 17:05:57	2025-05-14 17:05:57
57	243	gm1kzFF4PCWDOZjCTbVyThKmtXvLpZwZY2YQRG64.jpg	2025-05-14 19:26:32	2025-05-14 19:26:32
58	244	bgnqdqJDjgE27W2LHQd2xoEkD9SLMtJkitiOVxXz.jpg	2025-05-14 19:55:55	2025-05-14 19:55:55
59	245	pTWygYTV6QNGcTn5khKTTgt1fz9H79WRBycRnvYz.jpg	2025-05-14 20:40:58	2025-05-14 20:40:58
60	246	0vP91HQs45V5rFGa3E0O5HGr4cG4Ck5d0NwmZzaF.jpg	2025-05-15 07:56:50	2025-05-15 07:56:50
61	249	cUcy7FF2geL9FOmfrUeFo6rgJSCYSdOhopYqXsW5.jpg	2025-05-17 07:33:03	2025-05-17 07:33:03
62	250	dgEW3Jw3FwuQD3FBGBY5kVhzkm8OgxdqNZpYnEe8.jpg	2025-05-17 08:34:10	2025-05-17 08:34:10
63	251	QGxaTOczIQgmAjzGMxymTR0YgKNY8NrvkfkGanQa.jpg	2025-05-17 11:09:43	2025-05-17 11:09:43
64	254	ae9xNEmRqatLvwObmTlBqW5c1NvXym0NZQRiTQnO.jpg	2025-05-17 11:28:48	2025-05-17 11:28:48
65	257	IBOPIPoSjHUmWSxvOPOBlybdaq3VpOfefOsFZOqB.jpg	2025-05-17 12:15:20	2025-05-17 12:15:20
66	259	9ZXP2iAwUDXwf4OfkKDUMGa5QJ6CeIkx8iahiU6T.jpg	2025-05-17 12:51:37	2025-05-17 12:51:37
67	260	piPGuFGZAmygewrbcKGiCoy00xQH0B740Cx4Fwa1.jpg	2025-05-17 14:53:02	2025-05-17 14:53:02
68	262	FumoTqFhXmRnhuuFlpikg1KWxwrDxAsB4Pg5sYzX.jpg	2025-05-17 16:18:42	2025-05-17 16:18:42
69	263	EDyTQ2LM7oR0Upxn08DXQ3ChenaGo419Z0XMXcPd.jpg	2025-05-17 17:06:38	2025-05-17 17:06:38
70	264	UDWYusYSrkWrcldDRLrPBqZBj4DvNG5dbvihx9gY.jpg	2025-05-17 17:11:47	2025-05-17 17:11:47
71	265	6mr6qTDQ5kJTLUU3DXar8no5YzlX5iOMqpOv2Gbk.jpg	2025-05-17 17:19:32	2025-05-17 17:19:32
72	271	bCa3ocoAisXIr17WYtKQyYsUp5w7J4PASOBTB0Pi.jpg	2025-05-17 19:41:58	2025-05-17 19:41:58
73	274	ALAzI38gXj09Q6pTkml1pC2uyXOgd6yYu9Sk9GoC.jpg	2025-05-18 00:56:45	2025-05-18 00:56:45
74	276	mw83ENO6JvM8Br6HBqQ936VX8LXAlzgi1NOmCUE4.jpg	2025-05-18 01:03:23	2025-05-18 01:03:23
75	280	mM3TOterMcRGYdWpvhJnt7plzRRmwfT6dzn77SsR.jpg	2025-05-18 20:43:07	2025-05-18 20:43:07
76	282	cV6gSux6vB5KwkdfhnJzDwQ1En7zBXktRo3rzi24.jpg	2025-05-19 05:51:06	2025-05-19 05:51:06
77	283	YGgPGzmiLZXTHeFyND0hs0mwhBqsVunM1GRqEl7v.jpg	2025-05-19 10:51:51	2025-05-19 10:51:51
78	284	YDaBsixmCebsabIZwaDULAMOKmmBqVdldIkQ3M5T.jpg	2025-05-19 10:54:41	2025-05-19 10:54:41
79	285	GTX01P30Sk9KUgjuPy9TD2Bx6KfCLe4ATZ4E7rOm.jpg	2025-05-19 10:58:20	2025-05-19 10:58:20
80	286	npzBAkCTp1m4fcHaun4RszxJcj1ErjgxMoC2R9X4.jpg	2025-05-19 10:59:28	2025-05-19 10:59:28
81	287	UkHc1aRb4Hskq0CwJ6lEjPCKaa9z0nxRYKy11hZo.jpg	2025-05-19 14:33:48	2025-05-19 14:33:48
82	291	bZa8OnOYC2USsOIjby6Hk996s5RgLdoY6YKQ8nZD.jpg	2025-05-19 18:16:52	2025-05-19 18:16:52
83	292	YaZbtik7J6mrnNUoirzDLEcf3VAThFqQ7cu33lOA.jpg	2025-05-19 20:42:45	2025-05-19 20:42:45
84	293	XOktvyeJuUnaVvHujaDvy24xi1hy8nNWkhUKD3oL.jpg	2025-05-19 21:35:18	2025-05-19 21:35:18
85	294	7YUKc4HfjEjfK9svdNAtslwlx35tkjNGv3gjMYEp.jpg	2025-05-19 21:54:32	2025-05-19 21:54:32
86	296	uo3WAUPS3Wz4jsrnomm7MriMGeFoe0r0PjJzA94q.jpg	2025-05-19 22:29:00	2025-05-19 22:29:00
87	297	2qYg4HqxQ5ZvLIUX5OZ9sKam37I2YUqXXlkemOoO.jpg	2025-05-19 23:45:18	2025-05-19 23:45:18
88	299	FOP9qi6lS7XqZIRB0C5CqqMJh3SBlf1iNWs5syGz.jpg	2025-05-19 23:59:41	2025-05-19 23:59:41
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
69	104	58	400	0	pending	2025-04-03 11:17:47	2025-04-03 11:17:47	0	no
70	104	80	500	0	accepted	2025-04-03 11:18:19	2025-04-03 11:20:21	0	no
71	106	81	400	0	accepted	2025-04-03 15:22:30	2025-04-03 15:24:10	0	no
72	108	81	500	0	accepted	2025-04-03 16:24:32	2025-04-03 16:24:45	0	no
73	113	82	400	0	accepted	2025-04-03 21:37:15	2025-04-03 21:37:33	0	no
74	118	82	500	0	accepted	2025-04-04 12:56:17	2025-04-04 12:57:01	0	no
68	92	56	200	0	accepted	2025-03-29 22:56:29	2025-05-17 07:34:07	0	no
75	250	82	500	0	accepted	2025-05-17 08:37:25	2025-05-17 08:37:42	0	no
76	271	82	400	0	accepted	2025-05-17 19:57:49	2025-05-17 19:58:39	0	no
77	280	82	700	0	accepted	2025-05-18 21:12:34	2025-05-18 21:13:00	0	no
78	291	82	200	0	accepted	2025-05-19 18:34:20	2025-05-19 18:34:30	0	no
79	293	87	700	0	accepted	2025-05-19 21:37:09	2025-05-19 21:42:55	0	no
80	294	92	400	0	accepted	2025-05-19 22:06:25	2025-05-19 22:06:45	0	no
81	296	119	600	0	accepted	2025-05-19 22:32:22	2025-05-19 22:32:30	0	no
82	297	119	800	0	accepted	2025-05-19 23:49:45	2025-05-19 23:50:16	0	no
83	299	119	790	0	accepted	2025-05-20 00:02:04	2025-05-20 00:02:18	0	no
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
20	282	4	2025-05-20	2025-05-20	2025-05-20	United Arab Emirate	Dubai	Karama	Al Watbha	812	Dubai Hills Mall	25.1019364	55.2394214	Yes	Yes	The first time the two sides agreed to meet on a single yyyyuuu	2025-05-19 05:50:47	2025-05-19 05:50:47	Month	11
21	291	4	2025-05-21	2025-05-21	2025-05-21	United Arab Emirate	Abudhabi	Muzaffarabad	Al watch	327	Abu Dhabi	24.453884	54.3773438	Yes	Yes	The first time the two	2025-05-19 18:16:44	2025-05-19 18:16:44	Month	5
22	292	4	2025-05-20	2025-05-20	2025-05-20	United Arab Emirate	Dubai	Karama	Al watbha	812	Karama Centre	25.2453653	55.30314370000001	Yes	Yes	The only way I could do that was if you wanted it for	2025-05-19 20:42:32	2025-05-19 20:42:32	Month	5
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
11	1	48	0	\N	\N	\N	5	customer_accepted	2025-03-27 11:43:05	2025-04-12 13:12:36	\N	#MZ-000011	no	\N	approved	4.0
15	5	54	\N	\N	\N	\N	\N	customer_requested	2025-03-27 15:06:39	2025-03-27 15:06:39	\N	#MZ-000015	no	\N	not_completed	\N
34	3	49	\N	\N	\N	\N	\N	customer_requested	2025-03-27 21:07:14	2025-03-27 21:07:14	\N	#MZ-000034	no	\N	not_completed	\N
14	1	48	0	\N	\N	\N	5	customer_accepted	2025-03-27 13:27:50	2025-03-27 16:39:06	\N	#MZ-000014	no	\N	approved	4.0
17	1	54	\N	\N	\N	\N	\N	customer_requested	2025-03-27 16:52:34	2025-03-27 16:52:34	\N	#MZ-000017	no	\N	not_completed	\N
23	5	53	\N	\N	\N	\N	\N	customer_requested	2025-03-27 20:24:53	2025-03-27 20:24:53	\N	#MZ-000023	no	\N	not_completed	\N
12	1	48	0	\N	\N	\N	5	customer_accepted	2025-03-27 11:47:48	2025-04-11 09:53:08	\N	#MZ-000012	no	\N	approved	4.0
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
92	6	73	200	\N	\N	\N	56	customer_accepted	2025-03-28 13:21:51	2025-05-17 08:36:51	\N	#MZ-000092	no	\N	approved	3.0
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
116	1	83	\N	\N	\N	\N	\N	customer_requested	2025-04-03 23:00:21	2025-04-16 19:51:50	\N	#MZ-000116	no	\N	rejected	\N
109	1	53	\N	\N	\N	\N	\N	customer_requested	2025-04-03 16:44:03	2025-04-03 16:44:03	\N	#MZ-000109	no	\N	not_completed	\N
108	3	54	500	25	\N	\N	81	customer_accepted	2025-04-03 16:19:11	2025-04-03 16:45:22	\N	#MZ-000108	yes	525	approved	4.0
110	4	53	\N	\N	\N	\N	\N	customer_requested	2025-04-03 16:44:14	2025-04-03 16:44:14	\N	#MZ-000110	no	\N	not_completed	\N
112	3	54	\N	\N	\N	\N	\N	customer_requested	2025-04-03 21:20:16	2025-04-03 21:29:11	\N	#MZ-000112	no	\N	approved	\N
114	3	54	\N	\N	\N	\N	\N	customer_requested	2025-04-03 22:37:55	2025-04-03 22:40:31	\N	#MZ-000114	no	\N	pending	\N
115	1	83	\N	\N	\N	\N	\N	customer_requested	2025-04-03 22:59:57	2025-04-03 22:59:57	\N	#MZ-000115	no	\N	not_completed	\N
113	3	54	400	20	\N	\N	82	customer_accepted	2025-04-03 21:31:22	2025-04-24 14:10:29	\N	#MZ-000113	yes	420	approved	4.0
117	1	84	\N	\N	\N	\N	\N	customer_requested	2025-04-03 23:41:45	2025-04-03 23:41:45	\N	#MZ-000117	no	\N	not_completed	\N
106	3	54	400	20	\N	\N	81	customer_accepted	2025-04-03 15:15:18	2025-04-04 11:59:43	\N	#MZ-000106	yes	420	approved	2.0
142	6	83	\N	\N	\N	\N	\N	customer_requested	2025-04-18 17:04:04	2025-04-18 17:04:04	\N	#MZ-000142	no	\N	not_completed	\N
143	4	83	\N	\N	\N	\N	\N	customer_requested	2025-04-18 17:12:22	2025-04-18 17:12:22	\N	#MZ-000143	no	\N	not_completed	\N
119	4	49	\N	\N	\N	\N	\N	customer_requested	2025-04-05 17:07:38	2025-04-05 17:07:38	\N	#MZ-000119	no	\N	not_completed	\N
120	1	49	\N	\N	\N	\N	\N	customer_requested	2025-04-05 17:08:27	2025-04-05 17:08:27	\N	#MZ-000120	no	\N	not_completed	\N
121	6	49	\N	\N	\N	\N	\N	customer_requested	2025-04-05 17:10:23	2025-04-05 17:10:23	\N	#MZ-000121	no	\N	not_completed	\N
122	1	48	\N	\N	\N	\N	\N	customer_requested	2025-04-14 18:43:40	2025-04-14 18:43:40	\N	#MZ-000122	no	\N	not_completed	\N
156	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-21 17:21:32	2025-04-21 17:21:32	\N	#MZ-000156	no	\N	not_completed	\N
123	1	83	\N	\N	\N	\N	\N	customer_requested	2025-04-16 19:40:46	2025-04-16 19:52:48	\N	#MZ-000123	no	\N	rejected	\N
124	2	83	\N	\N	\N	\N	\N	customer_requested	2025-04-16 19:58:24	2025-04-16 19:58:24	\N	#MZ-000124	no	\N	not_completed	\N
144	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-18 22:46:24	2025-04-18 22:47:51	\N	#MZ-000144	no	\N	pending	\N
125	1	83	\N	\N	\N	\N	\N	customer_requested	2025-04-16 20:00:16	2025-04-16 20:03:46	\N	#MZ-000125	no	\N	approved	\N
126	4	83	\N	\N	\N	\N	\N	customer_requested	2025-04-17 11:25:02	2025-04-17 11:25:02	\N	#MZ-000126	no	\N	not_completed	\N
127	6	83	\N	\N	\N	\N	\N	customer_requested	2025-04-17 11:25:22	2025-04-17 11:25:22	\N	#MZ-000127	no	\N	not_completed	\N
128	6	83	\N	\N	\N	\N	\N	customer_requested	2025-04-17 11:25:45	2025-04-17 11:25:45	\N	#MZ-000128	no	\N	not_completed	\N
129	7	83	\N	\N	\N	\N	\N	customer_requested	2025-04-17 11:26:21	2025-04-17 11:26:21	\N	#MZ-000129	no	\N	not_completed	\N
130	6	83	\N	\N	\N	\N	\N	customer_requested	2025-04-17 11:26:37	2025-04-17 11:26:37	\N	#MZ-000130	no	\N	not_completed	\N
131	7	83	\N	\N	\N	\N	\N	customer_requested	2025-04-17 11:27:26	2025-04-17 11:27:26	\N	#MZ-000131	no	\N	not_completed	\N
132	6	83	\N	\N	\N	\N	\N	customer_requested	2025-04-17 11:28:51	2025-04-17 11:28:51	\N	#MZ-000132	no	\N	not_completed	\N
133	7	83	\N	\N	\N	\N	\N	customer_requested	2025-04-17 11:35:45	2025-04-17 11:35:45	\N	#MZ-000133	no	\N	not_completed	\N
134	3	83	\N	\N	\N	\N	\N	customer_requested	2025-04-17 12:25:09	2025-04-17 12:25:09	\N	#MZ-000134	no	\N	not_completed	\N
135	4	83	\N	\N	\N	\N	\N	customer_requested	2025-04-17 12:26:15	2025-04-17 12:26:15	\N	#MZ-000135	no	\N	not_completed	\N
136	5	83	\N	\N	\N	\N	\N	customer_requested	2025-04-17 12:26:24	2025-04-17 12:26:24	\N	#MZ-000136	no	\N	not_completed	\N
137	5	83	\N	\N	\N	\N	\N	customer_requested	2025-04-17 12:26:44	2025-04-17 12:26:44	\N	#MZ-000137	no	\N	not_completed	\N
138	7	83	\N	\N	\N	\N	\N	customer_requested	2025-04-17 12:27:07	2025-04-17 12:27:07	\N	#MZ-000138	no	\N	not_completed	\N
139	5	83	\N	\N	\N	\N	\N	customer_requested	2025-04-17 12:27:14	2025-04-17 12:27:14	\N	#MZ-000139	no	\N	not_completed	\N
140	1	75	\N	\N	\N	\N	\N	customer_requested	2025-04-18 15:41:35	2025-04-18 15:41:35	\N	#MZ-000140	no	\N	not_completed	\N
141	1	83	\N	\N	\N	\N	\N	customer_requested	2025-04-18 17:03:23	2025-04-18 17:03:23	\N	#MZ-000141	no	\N	not_completed	\N
145	1	83	\N	\N	\N	\N	\N	customer_requested	2025-04-19 12:25:09	2025-04-19 12:25:09	\N	#MZ-000145	no	\N	not_completed	\N
146	2	83	\N	\N	\N	\N	\N	customer_requested	2025-04-19 12:27:20	2025-04-19 12:27:20	\N	#MZ-000146	no	\N	not_completed	\N
147	1	49	\N	\N	\N	\N	\N	customer_requested	2025-04-20 11:40:59	2025-04-20 11:44:16	\N	#MZ-000147	no	\N	pending	\N
148	1	75	\N	\N	\N	\N	\N	customer_requested	2025-04-21 11:50:36	2025-04-21 11:50:36	\N	#MZ-000148	no	\N	not_completed	\N
149	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-21 15:04:10	2025-04-21 15:04:10	\N	#MZ-000149	no	\N	not_completed	\N
150	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-21 15:04:16	2025-04-21 15:04:16	\N	#MZ-000150	no	\N	not_completed	\N
151	2	93	\N	\N	\N	\N	\N	customer_requested	2025-04-21 15:05:29	2025-04-21 15:05:29	\N	#MZ-000151	no	\N	not_completed	\N
152	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-21 15:05:32	2025-04-21 15:05:32	\N	#MZ-000152	no	\N	not_completed	\N
153	1	75	\N	\N	\N	\N	\N	customer_requested	2025-04-21 15:07:29	2025-04-21 15:07:29	\N	#MZ-000153	no	\N	not_completed	\N
154	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-21 16:40:35	2025-04-21 16:40:35	\N	#MZ-000154	no	\N	not_completed	\N
155	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-21 16:41:40	2025-04-21 16:41:40	\N	#MZ-000155	no	\N	not_completed	\N
157	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-21 17:22:06	2025-04-21 17:22:06	\N	#MZ-000157	no	\N	not_completed	\N
158	3	49	\N	\N	\N	\N	\N	customer_requested	2025-04-21 18:29:57	2025-04-21 18:29:57	\N	#MZ-000158	no	\N	not_completed	\N
159	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-21 19:30:34	2025-04-21 19:30:34	\N	#MZ-000159	no	\N	not_completed	\N
160	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-21 19:53:57	2025-04-21 19:53:57	\N	#MZ-000160	no	\N	not_completed	\N
161	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-21 21:10:01	2025-04-21 21:10:01	\N	#MZ-000161	no	\N	not_completed	\N
162	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-21 21:10:19	2025-04-21 21:10:19	\N	#MZ-000162	no	\N	not_completed	\N
163	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-21 21:10:29	2025-04-21 21:10:29	\N	#MZ-000163	no	\N	not_completed	\N
164	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-21 21:17:00	2025-04-21 21:17:00	\N	#MZ-000164	no	\N	not_completed	\N
165	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-21 21:27:55	2025-04-21 21:27:55	\N	#MZ-000165	no	\N	not_completed	\N
166	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-21 21:31:47	2025-04-21 21:31:47	\N	#MZ-000166	no	\N	not_completed	\N
167	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-22 13:22:15	2025-04-22 13:22:15	\N	#MZ-000167	no	\N	not_completed	\N
168	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-22 13:34:16	2025-04-22 13:34:16	\N	#MZ-000168	no	\N	not_completed	\N
169	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-22 13:36:51	2025-04-22 13:36:51	\N	#MZ-000169	no	\N	not_completed	\N
170	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-22 13:43:25	2025-04-22 13:43:25	\N	#MZ-000170	no	\N	not_completed	\N
171	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-22 13:47:07	2025-04-22 13:47:07	\N	#MZ-000171	no	\N	not_completed	\N
172	1	93	\N	\N	\N	\N	\N	customer_requested	2025-04-22 13:47:30	2025-04-22 13:47:30	\N	#MZ-000172	no	\N	not_completed	\N
173	1	75	\N	\N	\N	\N	\N	customer_requested	2025-04-22 13:57:30	2025-04-22 13:57:30	\N	#MZ-000173	no	\N	not_completed	\N
174	1	75	\N	\N	\N	\N	\N	customer_requested	2025-04-22 14:08:31	2025-04-22 14:08:31	\N	#MZ-000174	no	\N	not_completed	\N
175	1	75	\N	\N	\N	\N	\N	customer_requested	2025-04-22 14:28:59	2025-04-22 14:28:59	\N	#MZ-000175	no	\N	not_completed	\N
176	1	75	\N	\N	\N	\N	\N	customer_requested	2025-04-22 14:31:56	2025-04-22 14:31:56	\N	#MZ-000176	no	\N	not_completed	\N
177	1	75	\N	\N	\N	\N	\N	customer_requested	2025-04-22 15:13:57	2025-04-22 15:13:57	\N	#MZ-000177	no	\N	not_completed	\N
178	1	75	\N	\N	\N	\N	\N	customer_requested	2025-04-22 15:48:06	2025-04-22 15:48:06	\N	#MZ-000178	no	\N	not_completed	\N
179	1	75	\N	\N	\N	\N	\N	customer_requested	2025-04-22 15:53:40	2025-04-22 15:53:40	\N	#MZ-000179	no	\N	not_completed	\N
180	1	75	\N	\N	\N	\N	\N	customer_requested	2025-04-22 16:10:57	2025-04-22 16:10:57	\N	#MZ-000180	no	\N	not_completed	\N
181	1	75	\N	\N	\N	\N	\N	customer_requested	2025-04-22 17:02:41	2025-04-22 17:02:41	\N	#MZ-000181	no	\N	not_completed	\N
182	1	75	\N	\N	\N	\N	\N	customer_requested	2025-04-22 17:04:17	2025-04-22 17:04:17	\N	#MZ-000182	no	\N	not_completed	\N
183	1	75	\N	\N	\N	\N	\N	customer_requested	2025-04-22 17:16:20	2025-04-22 17:16:20	\N	#MZ-000183	no	\N	not_completed	\N
184	1	75	\N	\N	\N	\N	\N	customer_requested	2025-04-22 23:01:12	2025-04-22 23:01:12	\N	#MZ-000184	no	\N	not_completed	\N
185	1	83	\N	\N	\N	\N	\N	customer_requested	2025-04-26 13:13:07	2025-04-26 13:13:07	\N	#MZ-000185	no	\N	not_completed	\N
186	1	83	\N	\N	\N	\N	\N	customer_requested	2025-04-27 13:59:09	2025-04-27 13:59:09	\N	#MZ-000186	no	\N	not_completed	\N
187	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-02 19:16:46	2025-05-02 19:16:46	\N	#MZ-000187	no	\N	not_completed	\N
188	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-02 22:57:10	2025-05-02 22:57:10	\N	#MZ-000188	no	\N	not_completed	\N
189	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-03 11:13:48	2025-05-03 11:13:48	\N	#MZ-000189	no	\N	not_completed	\N
190	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-03 12:31:18	2025-05-03 12:31:18	\N	#MZ-000190	no	\N	not_completed	\N
191	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-12 10:03:25	2025-05-12 10:03:25	\N	#MZ-000191	no	\N	not_completed	\N
192	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-12 12:50:47	2025-05-12 12:50:47	\N	#MZ-000192	no	\N	not_completed	\N
193	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-12 14:05:31	2025-05-12 14:05:31	\N	#MZ-000193	no	\N	not_completed	\N
194	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-12 14:19:47	2025-05-12 14:19:47	\N	#MZ-000194	no	\N	not_completed	\N
195	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-12 14:55:34	2025-05-12 14:55:34	\N	#MZ-000195	no	\N	not_completed	\N
196	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-12 15:03:29	2025-05-12 15:03:29	\N	#MZ-000196	no	\N	not_completed	\N
197	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-12 15:16:26	2025-05-12 15:16:26	\N	#MZ-000197	no	\N	not_completed	\N
198	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-12 16:53:24	2025-05-12 16:53:24	\N	#MZ-000198	no	\N	not_completed	\N
199	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-12 16:59:22	2025-05-12 17:00:52	\N	#MZ-000199	no	\N	pending	\N
200	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-12 20:56:34	2025-05-12 20:56:34	\N	#MZ-000200	no	\N	not_completed	\N
215	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 12:50:21	2025-05-14 12:50:21	\N	#MZ-000215	no	\N	not_completed	\N
202	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-12 21:02:23	2025-05-12 21:02:23	\N	#MZ-000202	no	\N	not_completed	\N
203	2	75	\N	\N	\N	\N	\N	customer_requested	2025-05-13 13:24:47	2025-05-13 13:24:47	\N	#MZ-000203	no	\N	not_completed	\N
216	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 12:51:43	2025-05-14 12:51:43	\N	#MZ-000216	no	\N	not_completed	\N
206	4	75	\N	\N	\N	\N	\N	customer_requested	2025-05-13 20:37:45	2025-05-13 20:37:45	\N	#MZ-000206	no	\N	not_completed	\N
207	4	75	\N	\N	\N	\N	\N	customer_requested	2025-05-13 21:39:40	2025-05-13 21:39:40	\N	#MZ-000207	no	\N	not_completed	\N
217	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 13:07:31	2025-05-14 13:07:31	\N	#MZ-000217	no	\N	not_completed	\N
209	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-13 22:21:00	2025-05-13 22:21:00	\N	#MZ-000209	no	\N	not_completed	\N
208	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-13 22:18:58	2025-05-13 22:21:50	\N	#MZ-000208	no	\N	approved	\N
210	4	75	\N	\N	\N	\N	\N	customer_requested	2025-05-13 22:53:27	2025-05-13 22:53:27	\N	#MZ-000210	no	\N	not_completed	\N
205	1	77	\N	\N	\N	\N	\N	customer_requested	2025-05-13 15:16:57	2025-05-13 22:55:31	\N	#MZ-000205	no	\N	approved	\N
201	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-12 20:58:43	2025-05-13 22:55:39	\N	#MZ-000201	no	\N	approved	\N
211	1	73	\N	\N	\N	\N	\N	customer_requested	2025-05-14 07:12:14	2025-05-14 07:12:14	\N	#MZ-000211	no	\N	not_completed	\N
212	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 12:11:25	2025-05-14 12:11:25	\N	#MZ-000212	no	\N	not_completed	\N
213	2	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 12:14:04	2025-05-14 12:14:04	\N	#MZ-000213	no	\N	not_completed	\N
214	1	73	\N	\N	\N	\N	\N	customer_requested	2025-05-14 12:47:53	2025-05-14 12:47:53	\N	#MZ-000214	no	\N	not_completed	\N
218	2	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 13:10:33	2025-05-14 13:10:33	\N	#MZ-000218	no	\N	not_completed	\N
219	2	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 13:12:44	2025-05-14 13:12:44	\N	#MZ-000219	no	\N	not_completed	\N
220	3	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 13:12:46	2025-05-14 13:12:46	\N	#MZ-000220	no	\N	not_completed	\N
221	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 13:19:09	2025-05-14 13:19:09	\N	#MZ-000221	no	\N	not_completed	\N
222	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 13:20:13	2025-05-14 13:20:13	\N	#MZ-000222	no	\N	not_completed	\N
223	2	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 13:27:35	2025-05-14 13:27:35	\N	#MZ-000223	no	\N	not_completed	\N
224	2	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 13:28:06	2025-05-14 13:28:06	\N	#MZ-000224	no	\N	not_completed	\N
225	2	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 13:30:34	2025-05-14 13:30:34	\N	#MZ-000225	no	\N	not_completed	\N
226	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 13:33:05	2025-05-14 13:33:05	\N	#MZ-000226	no	\N	not_completed	\N
227	2	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 13:33:33	2025-05-14 13:33:33	\N	#MZ-000227	no	\N	not_completed	\N
228	4	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 13:33:45	2025-05-14 13:33:45	\N	#MZ-000228	no	\N	not_completed	\N
229	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 13:36:23	2025-05-14 13:36:23	\N	#MZ-000229	no	\N	not_completed	\N
230	3	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 13:36:29	2025-05-14 13:36:29	\N	#MZ-000230	no	\N	not_completed	\N
231	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 13:37:12	2025-05-14 13:37:12	\N	#MZ-000231	no	\N	not_completed	\N
232	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 13:39:22	2025-05-14 13:39:22	\N	#MZ-000232	no	\N	not_completed	\N
233	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 13:39:37	2025-05-14 13:39:37	\N	#MZ-000233	no	\N	not_completed	\N
234	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 13:39:40	2025-05-14 13:39:40	\N	#MZ-000234	no	\N	not_completed	\N
204	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-13 15:13:58	2025-05-18 01:05:44	\N	#MZ-000204	no	\N	rejected	\N
235	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 13:39:44	2025-05-14 13:39:44	\N	#MZ-000235	no	\N	not_completed	\N
236	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 13:49:22	2025-05-14 13:49:22	\N	#MZ-000236	no	\N	not_completed	\N
253	1	105	\N	\N	\N	\N	\N	customer_requested	2025-05-17 11:27:24	2025-05-17 11:27:24	\N	#MZ-000253	no	\N	not_completed	\N
238	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 15:58:56	2025-05-14 15:58:56	\N	#MZ-000238	no	\N	not_completed	\N
237	1	73	\N	\N	\N	\N	\N	customer_requested	2025-05-14 15:29:39	2025-05-14 16:37:34	\N	#MZ-000237	yes	\N	approved	\N
239	4	73	\N	\N	\N	\N	\N	customer_requested	2025-05-14 16:41:08	2025-05-14 16:41:08	\N	#MZ-000239	no	\N	not_completed	\N
264	1	100	\N	\N	\N	\N	\N	customer_requested	2025-05-17 17:11:13	2025-05-17 17:12:25	\N	#MZ-000264	no	\N	approved	\N
254	1	105	\N	\N	\N	\N	\N	customer_requested	2025-05-17 11:28:17	2025-05-17 11:29:33	\N	#MZ-000254	no	\N	approved	\N
255	1	105	\N	\N	\N	\N	\N	customer_requested	2025-05-17 12:01:13	2025-05-17 12:01:13	\N	#MZ-000255	no	\N	not_completed	\N
242	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 17:13:07	2025-05-14 17:13:07	\N	#MZ-000242	no	\N	not_completed	\N
279	7	108	\N	\N	\N	\N	\N	customer_requested	2025-05-18 20:29:48	2025-05-18 20:29:48	\N	#MZ-000279	no	\N	not_completed	\N
256	1	105	\N	\N	\N	\N	\N	customer_requested	2025-05-17 12:02:38	2025-05-17 12:03:42	\N	#MZ-000256	no	\N	approved	\N
245	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 20:40:10	2025-05-14 21:27:23	\N	#MZ-000245	no	\N	approved	\N
244	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 19:55:20	2025-05-14 21:28:02	\N	#MZ-000244	no	\N	approved	\N
240	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 16:57:34	2025-05-14 21:28:40	\N	#MZ-000240	no	\N	approved	\N
265	1	100	\N	\N	\N	\N	\N	customer_requested	2025-05-17 17:18:56	2025-05-17 17:20:08	\N	#MZ-000265	no	\N	approved	\N
247	4	73	\N	\N	\N	\N	\N	customer_requested	2025-05-15 08:15:58	2025-05-15 08:15:58	\N	#MZ-000247	no	\N	not_completed	\N
248	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-16 17:05:39	2025-05-16 17:05:39	\N	#MZ-000248	no	\N	not_completed	\N
257	1	105	\N	\N	\N	\N	\N	customer_requested	2025-05-17 12:14:40	2025-05-17 12:15:53	\N	#MZ-000257	no	\N	approved	\N
249	1	73	\N	\N	\N	\N	\N	customer_requested	2025-05-17 07:31:51	2025-05-17 08:27:54	\N	#MZ-000249	no	\N	approved	\N
266	1	73	\N	\N	\N	\N	\N	customer_requested	2025-05-17 18:40:57	2025-05-17 18:40:57	\N	#MZ-000266	no	\N	not_completed	\N
258	1	106	\N	\N	\N	\N	\N	customer_requested	2025-05-17 12:17:37	2025-05-17 12:19:00	\N	#MZ-000258	no	\N	approved	\N
274	1	100	\N	\N	\N	\N	\N	customer_requested	2025-05-18 00:56:00	2025-05-18 00:57:42	\N	#MZ-000274	no	\N	approved	\N
243	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 19:25:49	2025-05-17 11:08:13	\N	#MZ-000243	no	\N	approved	\N
241	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-14 17:05:20	2025-05-17 11:08:38	\N	#MZ-000241	no	\N	approved	\N
251	1	75	\N	\N	\N	\N	\N	customer_requested	2025-05-17 11:09:00	2025-05-17 11:10:24	\N	#MZ-000251	no	\N	approved	\N
252	1	105	\N	\N	\N	\N	\N	customer_requested	2025-05-17 11:13:32	2025-05-17 11:13:32	\N	#MZ-000252	no	\N	not_completed	\N
267	2	73	\N	\N	\N	\N	\N	customer_requested	2025-05-17 18:41:09	2025-05-17 18:41:09	\N	#MZ-000267	no	\N	not_completed	\N
259	1	105	\N	\N	\N	\N	\N	customer_requested	2025-05-17 12:46:20	2025-05-17 12:54:54	\N	#MZ-000259	no	\N	approved	\N
268	3	73	\N	\N	\N	\N	\N	customer_requested	2025-05-17 18:41:11	2025-05-17 18:41:11	\N	#MZ-000268	no	\N	not_completed	\N
261	1	100	\N	\N	\N	\N	\N	customer_requested	2025-05-17 15:01:09	2025-05-17 15:01:09	\N	#MZ-000261	no	\N	not_completed	\N
260	1	100	\N	\N	\N	\N	\N	customer_requested	2025-05-17 14:52:28	2025-05-17 15:01:25	\N	#MZ-000260	no	\N	approved	\N
269	5	73	\N	\N	\N	\N	\N	customer_requested	2025-05-17 18:41:16	2025-05-17 18:41:16	\N	#MZ-000269	no	\N	not_completed	\N
262	1	100	\N	\N	\N	\N	\N	customer_requested	2025-05-17 16:18:00	2025-05-17 16:20:49	\N	#MZ-000262	no	\N	approved	\N
270	7	73	\N	\N	\N	\N	\N	customer_requested	2025-05-17 18:41:20	2025-05-17 18:41:20	\N	#MZ-000270	no	\N	not_completed	\N
263	1	100	\N	\N	\N	\N	\N	customer_requested	2025-05-17 17:06:00	2025-05-17 17:07:31	\N	#MZ-000263	no	\N	approved	\N
250	3	73	500	\N	\N	\N	82	customer_accepted	2025-05-17 08:33:15	2025-05-17 19:40:16	\N	#MZ-000250	no	\N	approved	5.0
275	2	100	\N	\N	\N	\N	\N	customer_requested	2025-05-18 00:57:59	2025-05-18 00:57:59	\N	#MZ-000275	no	\N	not_completed	\N
282	4	57	\N	\N	\N	\N	\N	customer_requested	2025-05-19 05:49:10	2025-05-19 05:51:12	\N	#MZ-000282	no	\N	pending	\N
271	3	73	400	20	\N	\N	82	customer_accepted	2025-05-17 19:40:21	2025-05-17 20:04:14	\N	#MZ-000271	yes	420	approved	\N
272	1	100	\N	\N	\N	\N	\N	customer_requested	2025-05-18 00:55:29	2025-05-18 00:55:29	\N	#MZ-000272	no	\N	not_completed	\N
273	1	100	\N	\N	\N	\N	\N	customer_requested	2025-05-18 00:55:50	2025-05-18 00:55:50	\N	#MZ-000273	no	\N	not_completed	\N
276	1	100	\N	\N	\N	\N	\N	customer_requested	2025-05-18 01:02:35	2025-05-18 01:03:59	\N	#MZ-000276	no	\N	approved	\N
246	1	73	\N	\N	\N	\N	\N	customer_requested	2025-05-15 07:55:28	2025-05-18 01:05:36	\N	#MZ-000246	no	\N	approved	\N
277	1	100	\N	\N	\N	\N	\N	customer_requested	2025-05-18 01:13:12	2025-05-18 01:13:12	\N	#MZ-000277	no	\N	not_completed	\N
118	3	54	500	25	\N	\N	82	customer_accepted	2025-04-04 12:08:08	2025-05-18 19:14:05	\N	#MZ-000118	yes	525	approved	4.0
278	1	54	\N	\N	\N	\N	\N	customer_requested	2025-05-18 19:14:31	2025-05-18 19:14:31	\N	#MZ-000278	no	\N	not_completed	\N
280	3	108	700	35	\N	\N	82	customer_accepted	2025-05-18 20:32:28	2025-05-18 21:14:46	\N	#MZ-000280	yes	735	approved	\N
281	1	100	\N	\N	\N	\N	\N	customer_requested	2025-05-18 23:10:10	2025-05-18 23:10:10	\N	#MZ-000281	no	\N	not_completed	\N
284	1	100	\N	\N	\N	\N	\N	customer_requested	2025-05-19 10:54:00	2025-05-19 10:55:18	\N	#MZ-000284	no	\N	approved	\N
283	1	100	\N	\N	\N	\N	\N	customer_requested	2025-05-19 10:51:10	2025-05-19 10:52:58	\N	#MZ-000283	no	\N	approved	\N
285	1	100	\N	\N	\N	\N	\N	customer_requested	2025-05-19 10:57:49	2025-05-19 11:03:03	\N	#MZ-000285	no	\N	approved	\N
286	1	100	\N	\N	\N	\N	\N	customer_requested	2025-05-19 10:58:55	2025-05-19 11:02:18	\N	#MZ-000286	no	\N	approved	\N
288	1	100	\N	\N	\N	\N	\N	customer_requested	2025-05-19 14:35:10	2025-05-19 14:35:10	\N	#MZ-000288	no	\N	not_completed	\N
287	1	100	\N	\N	\N	\N	\N	customer_requested	2025-05-19 14:33:15	2025-05-19 14:35:27	\N	#MZ-000287	no	\N	approved	\N
289	1	110	\N	\N	\N	\N	\N	customer_requested	2025-05-19 15:12:20	2025-05-19 15:12:20	\N	#MZ-000289	no	\N	not_completed	\N
290	3	111	\N	\N	\N	\N	\N	customer_requested	2025-05-19 17:02:04	2025-05-19 17:02:04	\N	#MZ-000290	no	\N	not_completed	\N
292	4	111	\N	\N	\N	\N	\N	customer_requested	2025-05-19 20:41:21	2025-05-19 20:43:37	\N	#MZ-000292	no	\N	approved	\N
291	4	111	200	10	\N	\N	82	customer_accepted	2025-05-19 17:51:43	2025-05-19 23:44:07	\N	#MZ-000291	yes	210	approved	4.0
295	3	111	\N	\N	\N	\N	\N	customer_requested	2025-05-19 22:05:18	2025-05-19 22:05:18	\N	#MZ-000295	no	\N	not_completed	\N
294	3	111	400	20	\N	\N	92	customer_accepted	2025-05-19 21:53:25	2025-05-19 22:07:44	\N	#MZ-000294	yes	420	approved	\N
296	3	111	600	30	\N	\N	119	customer_accepted	2025-05-19 22:27:57	2025-05-19 22:33:09	\N	#MZ-000296	yes	630	approved	\N
297	3	111	800	40	\N	\N	119	customer_accepted	2025-05-19 23:44:14	2025-05-19 23:51:03	\N	#MZ-000297	yes	840	approved	\N
298	1	111	\N	\N	\N	\N	\N	customer_requested	2025-05-19 23:58:24	2025-05-19 23:58:24	\N	#MZ-000298	no	\N	not_completed	\N
299	3	111	790	39	\N	\N	119	customer_accepted	2025-05-19 23:58:29	2025-05-20 00:02:58	\N	#MZ-000299	yes	829	approved	\N
293	3	111	700	35	\N	\N	87	customer_accepted	2025-05-19 21:34:04	2025-05-20 18:26:11	\N	#MZ-000293	yes	735	approved	3.0
\.


--
-- Data for Name: business_enquiries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.business_enquiries (id, name, email, phone, dial_code, business_name, enquiry, user_id, created_at, updated_at) FROM stdin;
1	James	business@gmail.com	8992889223	+72	Cattle	What about	32	2025-03-15 14:14:58	2025-03-15 14:14:58
2	James	business@gmail.com	8992889223	+72	Cattle	What about	32	2025-03-17 13:58:34	2025-03-17 13:58:34
3	James	business@gmail.com	8992889223	+72	Cattle	What about	4	2025-03-17 13:58:40	2025-03-17 13:58:40
4	anil business	anilnavis@gmail.com	555875899	971	DXB Apps	I Need To Get My And I Will Make Love The Little Caesars You Guys Are Not 🚭 The New To The New York City 🏙️🏙️🏙️	4	2025-03-26 11:58:10	2025-03-26 11:58:10
5	Anil	n@n.com	5466484664	971	Mobiria solution	The only way I could do that was if you wanted	4	2025-05-18 22:15:32	2025-05-18 22:15:32
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
43	InComplete	User	InComplete User	\N	67f1774d281c0_1743877965.jpg	1	inactive	2025-04-05 22:32:45	2025-04-05 22:32:45	\N	85	\N	\N	pending	5	0
42	Anil	Navis	Nacro Cargo	67eec2b98dd08_1743700665.jpg	67eec2b98f4e7_1743700665.jpg	1	active	2025-04-03 21:17:45	2025-05-17 08:32:32	\N	82	67eec2b98f3d5_1743700665.jpg	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \r\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	approved	5	0
44	InComplete	User	Complete User	67f18634b22aa_1743881780.jpg	67f177b38587a_1743878067.jpg	1	active	2025-04-05 22:34:27	2025-04-05 23:58:57	\N	86	67f18634b390f_1743881780.jpg	Hello world	approved	5	0
49	Anil	navis	Nabo	682b71ae1ce35_1747677614.png	682b6eb8901ee_1747676856.png	1	active	2025-05-19 21:47:36	2025-05-19 22:00:14	\N	118	682b71ae1e637_1747677614.png	sadadasdasdd	approved	5	0
45	Anil	Navis	Navis Trasnport	67f35f2b150fb_1744002859.jpg	67f24b25111ec_1743932197.pdf	1	active	2025-04-06 13:36:37	2025-04-07 09:14:19	\N	87	67f35f2b165dd_1744002859.jpg	At Navis Trasnport, we pride ourselves on offering a full range of transportation, freight, customs clearance, and documentation services under one roof. From sea to sky, our dedicated team and state-of-the-art equipment are always ready	approved	5	0
46	Nawaz	Khan	Nawaz Khan	\N	67f543d3d2372_1744126931.jpg	1	inactive	2025-04-08 19:42:11	2025-04-08 19:44:01	\N	88	\N	\N	approved	5	0
47	Anil	Navis	Emirate Transport	67f5ea6ecf2f2_1744169582.jpg	67f5e88e8b866_1744169102.pdf	1	active	2025-04-09 07:25:02	2025-04-09 07:33:02	\N	91	67f5ea6ed07e3_1744169582.jpg	Emirates Transport is the tradename for Emirates Public Transport and Services Company PJSC, the UAE's government-owned public transport provider, particularly for the government	approved	5	0
50	Anil	Navis	Nabosh	682b77db78db5_1747679195.jpg	682b75e958fa6_1747678697.png	1	active	2025-05-19 22:18:17	2025-05-19 22:26:35	\N	119	682b77db7a3cb_1747679195.jpg	fsdfsfs sdsfssdfsdfs  sdfsdfsf	approved	5	0
48	anil	navis	Anil Cargo	67f64a31a7bc7_1744194097.jpg	67f647a2d595a_1744193442.pdf	1	active	2025-04-09 14:10:42	2025-04-09 14:21:37	\N	92	67f64a31a911d_1744194097.jpg	awwwqe	approved	5	0
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
100	47	3	\N	\N
101	48	3	\N	\N
102	48	2	\N	\N
103	42	4	\N	\N
104	49	4	\N	\N
105	49	3	\N	\N
106	50	3	\N	\N
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
11	anil@anil.ckm	971	5123133131	Hheje	\N	\N	\N	Anil
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
127	2025_04_08_133754_add_vendor_id_column_in_users_table	43
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
159	36	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:23	2025-04-24 14:10:23	Lets Move	680a0e0f68ba0_1745489423.png	active
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
160	29	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:23	2025-04-24 14:10:23	Lets Move	680a0e0f92ea4_1745489423.png	active
161	33	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:23	2025-04-24 14:10:23	Lets Move	680a0e0fe3670_1745489423.png	active
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
140	3	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:19	2025-04-24 14:10:19	Lets Move	680a0e0b9e944_1745489419.png	active
141	13	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:19	2025-04-24 14:10:19	Lets Move	680a0e0ba11e6_1745489419.png	active
142	32	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:19	2025-04-24 14:10:19	Lets Move	680a0e0ba1d04_1745489419.png	active
143	40	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:20	2025-04-24 14:10:20	Lets Move	680a0e0c51df0_1745489420.png	active
144	34	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:20	2025-04-24 14:10:20	Lets Move	680a0e0cad184_1745489420.png	active
145	3	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:21	2025-04-24 14:10:21	Lets Move	680a0e0d2d207_1745489421.png	active
146	13	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:21	2025-04-24 14:10:21	Lets Move	680a0e0d2f35a_1745489421.png	active
147	32	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:21	2025-04-24 14:10:21	Lets Move	680a0e0d2fe7a_1745489421.png	active
148	37	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:21	2025-04-24 14:10:21	Lets Move	680a0e0d42cf3_1745489421.png	active
149	31	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:21	2025-04-24 14:10:21	Lets Move	680a0e0d96c9f_1745489421.png	active
150	40	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:21	2025-04-24 14:10:21	Lets Move	680a0e0dae107_1745489421.png	active
151	66	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:21	2025-04-24 14:10:21	Lets Move	680a0e0df3e8d_1745489421.png	active
152	34	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:22	2025-04-24 14:10:22	Lets Move	680a0e0e0bc5c_1745489422.png	active
153	29	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:22	2025-04-24 14:10:22	Lets Move	680a0e0e514f2_1745489422.png	active
154	37	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:22	2025-04-24 14:10:22	Lets Move	680a0e0e8a98d_1745489422.png	active
155	33	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:22	2025-04-24 14:10:22	Lets Move	680a0e0ea5d23_1745489422.png	active
156	31	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:22	2025-04-24 14:10:22	Lets Move	680a0e0ed988b_1745489422.png	active
157	67	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:23	2025-04-24 14:10:23	Lets Move	680a0e0f0a077_1745489423.png	active
158	66	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:23	2025-04-24 14:10:23	Lets Move	680a0e0f3ec09_1745489423.png	active
162	68	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:23	2025-04-24 14:10:23	Lets Move	680a0e0fecf1f_1745489423.png	active
164	69	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:24	2025-04-24 14:10:24	Lets Move	680a0e104d532_1745489424.png	active
166	45	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:24	2025-04-24 14:10:24	Lets Move	680a0e109caf5_1745489424.png	active
168	50	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:25	2025-04-24 14:10:25	Lets Move	680a0e112450b_1745489425.png	active
173	46	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:25	2025-04-24 14:10:25	Lets Move	680a0e11a70b9_1745489425.png	active
176	47	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:26	2025-04-24 14:10:26	Lets Move	680a0e122d989_1745489426.png	active
179	55	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:26	2025-04-24 14:10:26	Lets Move	680a0e12a975d_1745489426.png	active
182	48	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:27	2025-04-24 14:10:27	Lets Move	680a0e1336117_1745489427.png	active
185	2	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:27	2025-04-24 14:10:27	Lets Move	680a0e1394dc9_1745489427.png	active
186	49	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:27	2025-04-24 14:10:27	Lets Move	680a0e1395d64_1745489427.png	active
195	60	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:28	2025-04-24 14:10:28	Lets Move	680a0e14db474_1745489428.png	active
198	53	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:30	2025-04-24 14:10:30	Lets Move	680a0e16208c6_1745489430.png	active
202	70	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:30	2025-04-24 14:10:30	Lets Move	680a0e1689cf5_1745489430.png	active
205	73	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:31	2025-04-24 14:10:31	Lets Move	680a0e1725c44_1745489431.png	active
208	54	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:31	2025-04-24 14:10:31	Lets Move	680a0e17b6e12_1745489431.png	active
211	71	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:32	2025-04-24 14:10:32	Lets Move	680a0e1828c41_1745489432.png	active
214	72	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:32	2025-04-24 14:10:32	Lets Move	680a0e1885a3f_1745489432.png	active
216	77	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:32	2025-04-24 14:10:32	Lets Move	680a0e18e863a_1745489432.png	active
220	75	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:33	2025-04-24 14:10:33	Lets Move	680a0e196c8d4_1745489433.png	active
223	84	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:34	2025-04-24 14:10:34	Lets Move	680a0e1a081dd_1745489434.png	active
227	83	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:34	2025-04-24 14:10:34	Lets Move	680a0e1a71d1f_1745489434.png	active
230	93	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:34	2025-04-24 14:10:34	Lets Move	680a0e1adc269_1745489434.png	active
163	67	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:24	2025-04-24 14:10:24	Lets Move	680a0e103f9be_1745489424.png	active
165	36	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:24	2025-04-24 14:10:24	Lets Move	680a0e108a345_1745489424.png	active
167	68	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:25	2025-04-24 14:10:25	Lets Move	680a0e1115abb_1745489425.png	active
169	69	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:25	2025-04-24 14:10:25	Lets Move	680a0e1164354_1745489425.png	active
170	3	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:25	2025-04-24 14:10:25	Lets Move	680a0e11877c6_1745489425.png	active
171	13	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:25	2025-04-24 14:10:25	Lets Move	680a0e1189939_1745489425.png	active
172	32	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:25	2025-04-24 14:10:25	Lets Move	680a0e118a4ac_1745489425.png	active
174	45	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:25	2025-04-24 14:10:25	Lets Move	680a0e11b8986_1745489425.png	active
175	40	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:26	2025-04-24 14:10:26	Lets Move	680a0e12297a3_1745489426.png	active
177	50	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:26	2025-04-24 14:10:26	Lets Move	680a0e123b1ac_1745489426.png	active
178	34	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:26	2025-04-24 14:10:26	Lets Move	680a0e12782fc_1745489426.png	active
180	46	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:26	2025-04-24 14:10:26	Lets Move	680a0e12b9c63_1745489426.png	active
181	37	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:27	2025-04-24 14:10:27	Lets Move	680a0e13045d1_1745489427.png	active
183	47	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:27	2025-04-24 14:10:27	Lets Move	680a0e133f739_1745489427.png	active
184	31	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:27	2025-04-24 14:10:27	Lets Move	680a0e1369697_1745489427.png	active
187	55	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:27	2025-04-24 14:10:27	Lets Move	680a0e13b7fc4_1745489427.png	active
188	66	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:27	2025-04-24 14:10:27	Lets Move	680a0e13b9f5d_1745489427.png	active
189	29	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:28	2025-04-24 14:10:28	Lets Move	680a0e141544d_1745489428.png	active
190	48	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:28	2025-04-24 14:10:28	Lets Move	680a0e1440b82_1745489428.png	active
191	33	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:28	2025-04-24 14:10:28	Lets Move	680a0e146f90b_1745489428.png	active
192	2	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:28	2025-04-24 14:10:28	Lets Move	680a0e14a0115_1745489428.png	active
193	49	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:28	2025-04-24 14:10:28	Lets Move	680a0e14a109b_1745489428.png	active
194	67	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:28	2025-04-24 14:10:28	Lets Move	680a0e14c5ebe_1745489428.png	active
196	60	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:29	2025-04-24 14:10:29	Lets Move	680a0e150deae_1745489429.png	active
197	36	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:29	2025-04-24 14:10:29	Lets Move	680a0e15debcc_1745489429.png	active
199	53	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:30	2025-04-24 14:10:30	Lets Move	680a0e1625370_1745489430.png	active
200	68	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:30	2025-04-24 14:10:30	Lets Move	680a0e166e213_1745489430.png	active
201	70	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:30	2025-04-24 14:10:30	Lets Move	680a0e168a4d6_1745489430.png	active
203	69	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:30	2025-04-24 14:10:30	Lets Move	680a0e16bf4c8_1745489430.png	active
204	73	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:31	2025-04-24 14:10:31	Lets Move	680a0e17249d8_1745489431.png	active
206	45	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:31	2025-04-24 14:10:31	Lets Move	680a0e1725d09_1745489431.png	active
207	54	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:31	2025-04-24 14:10:31	Lets Move	680a0e17b25b3_1745489431.png	active
209	50	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:31	2025-04-24 14:10:31	Lets Move	680a0e17cae5a_1745489431.png	active
210	71	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:32	2025-04-24 14:10:32	Lets Move	680a0e182844e_1745489432.png	active
212	46	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:32	2025-04-24 14:10:32	Lets Move	680a0e1859367_1745489432.png	active
213	72	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:32	2025-04-24 14:10:32	Lets Move	680a0e1883830_1745489432.png	active
215	47	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:32	2025-04-24 14:10:32	Lets Move	680a0e18d42bc_1745489432.png	active
217	77	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:32	2025-04-24 14:10:32	Lets Move	680a0e18e9ff7_1745489432.png	active
218	75	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:33	2025-04-24 14:10:33	Lets Move	680a0e1957c3d_1745489433.png	active
219	55	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:33	2025-04-24 14:10:33	Lets Move	680a0e195d51d_1745489433.png	active
221	48	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:33	2025-04-24 14:10:33	Lets Move	680a0e19da47a_1745489433.png	active
222	84	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:33	2025-04-24 14:10:33	Lets Move	680a0e19e57c9_1745489433.png	active
224	2	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:34	2025-04-24 14:10:34	Lets Move	680a0e1a4a653_1745489434.png	active
225	49	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:34	2025-04-24 14:10:34	Lets Move	680a0e1a4b525_1745489434.png	active
226	83	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:34	2025-04-24 14:10:34	Lets Move	680a0e1a58849_1745489434.png	active
228	60	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:34	2025-04-24 14:10:34	Lets Move	680a0e1aa7f6b_1745489434.png	active
229	93	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:34	2025-04-24 14:10:34	Lets Move	680a0e1abce86_1745489434.png	active
231	53	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:35	2025-04-24 14:10:35	Lets Move	680a0e1b4126b_1745489435.png	active
232	70	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:35	2025-04-24 14:10:35	Lets Move	680a0e1b9edc8_1745489435.png	active
233	73	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:36	2025-04-24 14:10:36	Lets Move	680a0e1c3d96d_1745489436.png	active
234	54	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:36	2025-04-24 14:10:36	Lets Move	680a0e1cd181a_1745489436.png	active
235	71	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:37	2025-04-24 14:10:37	Lets Move	680a0e1d485fe_1745489437.png	active
236	72	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:37	2025-04-24 14:10:37	Lets Move	680a0e1db2efb_1745489437.png	active
237	77	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:38	2025-04-24 14:10:38	Lets Move	680a0e1e1f634_1745489438.png	active
238	75	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:38	2025-04-24 14:10:38	Lets Move	680a0e1e81809_1745489438.png	active
239	84	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:39	2025-04-24 14:10:39	Lets Move	680a0e1f20ee6_1745489439.png	active
240	83	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:39	2025-04-24 14:10:39	Lets Move	680a0e1f902b0_1745489439.png	active
241	93	Moovzy is the best mover	\N	\N	\N	2025-04-24 14:10:40	2025-04-24 14:10:40	Lets Move	680a0e20067ce_1745489440.png	active
242	77	Let Move Together	\N	\N	\N	2025-05-17 10:52:37	2025-05-17 10:52:37	Moovzy is the best mover...!	68283235dbdf8_1747464757.jpg	active
243	75	Let Move Together	\N	\N	\N	2025-05-17 10:52:38	2025-05-17 10:52:38	Moovzy is the best mover...!	6828323675fbb_1747464758.jpg	active
244	95	Let Move Together	\N	\N	\N	2025-05-17 10:52:39	2025-05-17 10:52:39	Moovzy is the best mover...!	6828323700cd8_1747464759.jpg	active
245	99	Let Move Together	\N	\N	\N	2025-05-17 10:52:39	2025-05-17 10:52:39	Moovzy is the best mover...!	682832378a628_1747464759.jpg	active
246	96	Let Move Together	\N	\N	\N	2025-05-17 10:52:40	2025-05-17 10:52:40	Moovzy is the best mover...!	6828323814893_1747464760.jpg	active
247	93	Let Move Together	\N	\N	\N	2025-05-17 10:52:40	2025-05-17 10:52:40	Moovzy is the best mover...!	68283238a69e8_1747464760.jpg	active
248	97	Let Move Together	\N	\N	\N	2025-05-17 10:52:41	2025-05-17 10:52:41	Moovzy is the best mover...!	6828323938e9a_1747464761.jpg	active
249	100	Let Move Together	\N	\N	\N	2025-05-17 10:52:41	2025-05-17 10:52:41	Moovzy is the best mover...!	6828323990c52_1747464761.jpg	active
250	77	Welcome to moovzy1	\N	\N	\N	2025-05-17 10:55:16	2025-05-17 10:55:16	Welcom	682832d4d4f75_1747464916.jpg	active
251	93	Welcome to moovzy1	\N	\N	\N	2025-05-17 10:55:17	2025-05-17 10:55:17	Welcom	682832d5800f1_1747464917.jpg	active
252	100	Welcome to moovzy1	\N	\N	\N	2025-05-17 10:55:18	2025-05-17 10:55:18	Welcom	682832d6041b0_1747464918.jpg	active
253	75	Hello Usama	\N	\N	\N	2025-05-17 10:56:08	2025-05-17 10:56:08	Hello	682833087e919_1747464968.png	active
254	75	We will celebrate this	\N	\N	\N	2025-05-17 11:02:28	2025-05-17 11:02:28	Celebrate	682834843807b_1747465348.jpg	active
255	75	We will celebrate this	\N	\N	\N	2025-05-17 11:03:07	2025-05-17 11:03:07	Celebrate	682834ab79e45_1747465387.jpg	active
256	75	We will celebrate this	\N	\N	\N	2025-05-17 11:03:55	2025-05-17 11:03:55	Celebrate	682834db94b5b_1747465435.jpg	active
257	75	We will celebrate this	\N	\N	\N	2025-05-17 11:04:46	2025-05-17 11:04:46	Celebrate	6828350ec044d_1747465486.jpg	active
258	105	Welcome to moovzy	\N	\N	\N	2025-05-17 11:15:06	2025-05-17 11:15:06	Welcom	6828377a658dc_1747466106.jpg	active
259	105	welcome to moovzy1	\N	\N	\N	2025-05-17 11:16:35	2025-05-17 11:16:35	Welcom	682837d3ebe5a_1747466195.jpg	active
260	105	welcome to moovzy1	\N	\N	\N	2025-05-17 11:17:49	2025-05-17 11:17:49	Welcom	6828381d40207_1747466269.jpg	active
261	105	Welcome Moovzy1	\N	\N	\N	2025-05-17 11:43:43	2025-05-17 11:43:43	Moovzy is the best mover...!	68283e2f183c0_1747467823.jpg	active
262	105	welcome to moovzy1	\N	\N	\N	2025-05-17 11:44:31	2025-05-17 11:44:31	Welcom	68283e5f9dbb1_1747467871.jpg	active
263	105	sawa	\N	\N	\N	2025-05-17 11:46:30	2025-05-17 11:46:30	Welcom	68283ed60fbe2_1747467990.jpg	active
264	105	sawa	\N	\N	\N	2025-05-17 11:52:19	2025-05-17 11:52:19	Welcom	68284033e030e_1747468339.jpg	active
265	105	sawa	\N	\N	\N	2025-05-17 11:52:47	2025-05-17 11:52:47	Welcom	6828404f1d9d8_1747468367.jpg	active
266	105	sawa	\N	\N	\N	2025-05-17 11:53:19	2025-05-17 11:53:19	Welcom	6828406fb3610_1747468399.jpg	active
267	105	sa	\N	\N	\N	2025-05-17 12:00:59	2025-05-17 12:00:59	Test	6828423b35313_1747468859.jpg	active
268	105	sa	\N	\N	\N	2025-05-17 12:02:30	2025-05-17 12:02:30	Test	68284296c6a61_1747468950.jpg	active
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
149	App\\Models\\User	83	Personal Access Token	42baac62b3e2a83e396f2ba7ff3a69412e44d3a414997e00ea65d76a3bfad7ea	["*"]	\N	2025-04-16 19:40:32	2025-04-16 19:40:32
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
148	App\\Models\\User	48	Personal Access Token	ef441e15be966e4a005902eec675818a9bd5bf17e43cfdae2cdf16f6c2d1db2a	["*"]	\N	2025-04-11 09:52:54	2025-04-11 09:52:54
86	App\\Models\\User	37	Personal Access Token	27f669086e161fc93f762be0a78a4e79eb27a725d6735d6aa72738d16fb2cd66	["*"]	\N	2025-03-27 12:52:20	2025-03-27 12:52:20
87	App\\Models\\User	37	Personal Access Token	19752c963ebb624a6e2742475a6cb79bdf401a351216964d15104268e586e2fb	["*"]	\N	2025-03-27 12:52:24	2025-03-27 12:52:24
88	App\\Models\\User	37	Personal Access Token	d2b73787560e463b8932ef4ff61d60f12c63d4b39998783924c3719261f0780e	["*"]	\N	2025-03-27 12:54:18	2025-03-27 12:54:18
89	App\\Models\\User	37	Personal Access Token	24540be8f93b263752bc7e42b41a8fec672a42e9f85954308a013fb425772e7b	["*"]	\N	2025-03-27 12:54:25	2025-03-27 12:54:25
90	App\\Models\\User	52	Personal Access Token	25ee2d61a63cd02bdd64ded7862881d14ed879d10621513d08ecc9997c40e108	["*"]	\N	2025-03-27 12:56:40	2025-03-27 12:56:40
96	App\\Models\\User	55	Personal Access Token	2dfe495d17d8012d48e6da9fa4d399ec7686a2029e7a28c3ebf01b7ea71d464a	["*"]	\N	2025-03-27 14:02:40	2025-03-27 14:02:40
97	App\\Models\\User	55	Personal Access Token	af9ad056454f98f7e1908dc06d182f10d6a58a74f0f35ac2e5a8fef771e6af15	["*"]	\N	2025-03-27 14:02:40	2025-03-27 14:02:40
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
150	App\\Models\\User	93	Personal Access Token	405ec21c8901038799032c79d955f8901d9b5c2db0c026dfbd82607fc2f3dd27	["*"]	\N	2025-04-18 22:45:30	2025-04-18 22:45:30
151	App\\Models\\User	93	Personal Access Token	9250809e5328b8d47972f25ae46ed788140e56265aa611e9551ebcb0987d680a	["*"]	\N	2025-04-18 22:45:30	2025-04-18 22:45:30
152	App\\Models\\User	93	Personal Access Token	b27eb05fc841a9a85c2bb94fab9c5df9ad74bfe112861ec76e5a6ab02168679a	["*"]	\N	2025-04-21 13:58:25	2025-04-21 13:58:25
153	App\\Models\\User	75	Personal Access Token	399a61fb52eb252ae4bc40430152f764b355a99617dcc2981fe332963bb1028f	["*"]	\N	2025-04-21 14:54:30	2025-04-21 14:54:30
154	App\\Models\\User	93	Personal Access Token	8af75281c1151cb8904acfac6189b118d3619c17acbaac830526c62bbdc9ac1e	["*"]	\N	2025-04-22 13:47:00	2025-04-22 13:47:00
155	App\\Models\\User	75	Personal Access Token	85afe5e27524ed69121c5ef5b7c22fbd76d0107c992c21f619a84fcd249453f9	["*"]	\N	2025-04-22 13:57:22	2025-04-22 13:57:22
156	App\\Models\\User	75	Personal Access Token	e980066d79f91000dea6709e3f6c723a22ed5be8a7e3d1014c765a15f6818212	["*"]	\N	2025-05-02 19:16:39	2025-05-02 19:16:39
157	App\\Models\\User	75	Personal Access Token	2318d0f8df25f962f25061d5dc54cf0bb6d26a2d873db09119b812229cd6f836	["*"]	\N	2025-05-12 10:02:42	2025-05-12 10:02:42
158	App\\Models\\User	75	Personal Access Token	a10587d7e0911484a1df8a1dacc93eddbc165ca05f8828b5b46166a8de9c9844	["*"]	\N	2025-05-13 13:11:32	2025-05-13 13:11:32
159	App\\Models\\User	75	Personal Access Token	ac91245f22003b4d9eaf16c15579b341e49921313962c5d9132c91b21c5f7d26	["*"]	\N	2025-05-13 15:13:52	2025-05-13 15:13:52
160	App\\Models\\User	77	Personal Access Token	fbba8bc2e695320e903efda6db08da24bfa0da9f4a2ff9e50b85d088863a7459	["*"]	\N	2025-05-13 15:16:48	2025-05-13 15:16:48
161	App\\Models\\User	75	Personal Access Token	75cfe18c60abe0c4acdb6e06e206a52c975240eb6ba65a284201906baec1ef11	["*"]	\N	2025-05-13 22:03:24	2025-05-13 22:03:24
162	App\\Models\\User	73	Personal Access Token	e9878c691a33f42854fb4e7fb06a7271766546ed64bc582c24572bdd0a1854a6	["*"]	\N	2025-05-14 07:12:09	2025-05-14 07:12:09
163	App\\Models\\User	94	Personal Access Token	1eb590977bbc0f09ff7da95721ec07f8e96858798b9ba6b51dec238cc8d6b714	["*"]	\N	2025-05-14 07:31:51	2025-05-14 07:31:51
164	App\\Models\\User	94	Personal Access Token	536ce31ab5949879f3dd752be9a678b72ee04c0fb25b6b3f13e86c89ad69155b	["*"]	\N	2025-05-14 07:31:51	2025-05-14 07:31:51
165	App\\Models\\User	95	Personal Access Token	c43fd1082d99511210c2648a34c1bdf025ab5adc65b435940ed39d6924354c08	["*"]	\N	2025-05-14 12:16:52	2025-05-14 12:16:52
166	App\\Models\\User	95	Personal Access Token	2fb3b629f41dd85ffe7b42d0c8875f2f0e86a3ddfda2248549c2c530a662be67	["*"]	\N	2025-05-14 12:16:53	2025-05-14 12:16:53
167	App\\Models\\User	96	Personal Access Token	074f9635295267eaf8e0f072657056a0de5ba0c5e8ddb612dddbd0f986f31561	["*"]	\N	2025-05-14 12:38:21	2025-05-14 12:38:21
168	App\\Models\\User	96	Personal Access Token	71a12631fd7907677df78255aeacc3d2052c51e5a4081cb6fa2c21766668862c	["*"]	\N	2025-05-14 12:38:22	2025-05-14 12:38:22
169	App\\Models\\User	97	Personal Access Token	b5e84815b7af9229abea633c24063a141a83b1a7ef32de36fba29e928644de29	["*"]	\N	2025-05-14 12:42:38	2025-05-14 12:42:38
170	App\\Models\\User	97	Personal Access Token	b9c9cd88ef9e84c5e8787df36ab1a66d669f646913e1e87059bfff6f060fa5ca	["*"]	\N	2025-05-14 12:42:39	2025-05-14 12:42:39
171	App\\Models\\User	75	Personal Access Token	84f1e2a06d2583eda4250e90f755ce057917527ec149a8c260ed6dc30fe961ad	["*"]	\N	2025-05-14 12:50:15	2025-05-14 12:50:15
172	App\\Models\\User	75	Personal Access Token	446c71d7f5fa6836173d5cdf1f4c959d1c587e025af10645237b10babcfb3123	["*"]	\N	2025-05-14 13:07:22	2025-05-14 13:07:22
173	App\\Models\\User	75	Personal Access Token	fdf94b70134e2f456ba406daf306ed9adf847d64b55dc5a2fd765ad5157fb7ed	["*"]	\N	2025-05-14 13:18:58	2025-05-14 13:18:58
174	App\\Models\\User	75	Personal Access Token	4738433f5741048096cc469772bd17d3199d28abba751e4b77425d3d37876b52	["*"]	\N	2025-05-14 13:27:28	2025-05-14 13:27:28
175	App\\Models\\User	75	Personal Access Token	1d4c9413a2158e403bcb2b0a6a64a360148651bed122c06ae0e325429fd3b440	["*"]	\N	2025-05-14 13:32:57	2025-05-14 13:32:57
176	App\\Models\\User	75	Personal Access Token	891933e5a37d9da2a8aa42799f80907f11873c6563b10b740c3b5f8a5579a6cd	["*"]	\N	2025-05-14 13:39:15	2025-05-14 13:39:15
177	App\\Models\\User	75	Personal Access Token	ba0d80833748c61c4f4769641ca79d150444a5021ac8a95ff8d118fa7af2928d	["*"]	\N	2025-05-14 13:49:14	2025-05-14 13:49:14
178	App\\Models\\User	73	Personal Access Token	6b3d1aa6f12cc61a8b0abc896eba00960feb04da7b42b15e1e312031b90495d6	["*"]	\N	2025-05-14 15:29:29	2025-05-14 15:29:29
179	App\\Models\\User	77	Personal Access Token	de5d9dd1ac9d62ff763d2332c447f8108e34e697671bd01ad73be579cac1573d	["*"]	\N	2025-05-14 15:45:55	2025-05-14 15:45:55
180	App\\Models\\User	75	Personal Access Token	3075f95488b5d710cbe95380cce2bd92809a492a05713f2519fc40d4a7de9ede	["*"]	\N	2025-05-14 17:08:13	2025-05-14 17:08:13
181	App\\Models\\User	75	Personal Access Token	d34eea79226df37916b226784e1442c2f770a4487675209366735dc679492846	["*"]	\N	2025-05-14 17:13:00	2025-05-14 17:13:00
182	App\\Models\\User	77	Personal Access Token	ccf53a84b0db55bd5fc1e61faaa3060a2f2cc9d3453894484b66b6c0ddf649f0	["*"]	\N	2025-05-14 17:19:36	2025-05-14 17:19:36
183	App\\Models\\User	75	Personal Access Token	24de499f12ccef4c6389da8f7cf4c119fa30105f621227352ea8b4d0e6630e6b	["*"]	\N	2025-05-14 17:21:29	2025-05-14 17:21:29
184	App\\Models\\User	75	Personal Access Token	b2328dbb410d48d6f42c4b7c4feffcd9bae6c72ce5c071fe9dd38a9e22c35022	["*"]	\N	2025-05-14 19:25:45	2025-05-14 19:25:45
185	App\\Models\\User	75	Personal Access Token	eea165aadf43babd2034df4af356a8915da8703fb7220825fd3e6bd508edcb7b	["*"]	\N	2025-05-14 19:55:13	2025-05-14 19:55:13
186	App\\Models\\User	75	Personal Access Token	02bfdb6b30af509e99d0e1daea7ca52cae740d5e9c0290a6f35ca2cf6731285e	["*"]	\N	2025-05-14 21:26:32	2025-05-14 21:26:32
187	App\\Models\\User	75	Personal Access Token	0d7bb6d3142d6a75fdbcaef382b3802f3492a3c116540b9e81bd853f1e1f7993	["*"]	\N	2025-05-14 21:26:44	2025-05-14 21:26:44
188	App\\Models\\User	75	Personal Access Token	827e30d8442dbfd04e99840cecde812f13448874fef337ba914c37586d707c83	["*"]	\N	2025-05-14 21:28:32	2025-05-14 21:28:32
189	App\\Models\\User	98	Personal Access Token	3710fcb8b2d0a0c32dcf6b79264fba7f0ab30d4f51af51f6b1024bbd789f1bef	["*"]	\N	2025-05-15 07:52:48	2025-05-15 07:52:48
190	App\\Models\\User	98	Personal Access Token	dc10daf73a38d7314c37dca1bc8e087064cb7e4d72ae098f20b48ba320977438	["*"]	\N	2025-05-15 07:52:49	2025-05-15 07:52:49
191	App\\Models\\User	73	Personal Access Token	2949df7bdc86d18214c8beb99cc977cf7ba1a9d45419c50a5c3a6982eab36092	["*"]	\N	2025-05-15 07:55:23	2025-05-15 07:55:23
192	App\\Models\\User	99	Personal Access Token	3d37fb9c3a20f898a7c6e49347b6c104c232307995c3d9d493757b383ac750cd	["*"]	\N	2025-05-15 14:52:17	2025-05-15 14:52:17
193	App\\Models\\User	99	Personal Access Token	6295a053a960e099eb607239f29712fb1de503a93728165c243ab2b66181dc30	["*"]	\N	2025-05-15 14:52:18	2025-05-15 14:52:18
196	App\\Models\\User	75	Personal Access Token	2b2b631ef0c69d4fdf333e16537b9811d1f64adb20f3370eadde605f22ce103f	["*"]	\N	2025-05-16 16:56:01	2025-05-16 16:56:01
198	App\\Models\\User	75	Personal Access Token	a01679e7debe831f284f1f10fec7ce12203d9fa425dce32381db5e921d2e3151	["*"]	\N	2025-05-17 00:53:13	2025-05-17 00:53:13
199	App\\Models\\User	101	Personal Access Token	da7f9837d10dbe8b4cf003c04d303532881620d30afdbe7dd0df3d183c7d7e61	["*"]	\N	2025-05-17 06:01:48	2025-05-17 06:01:48
200	App\\Models\\User	101	Personal Access Token	f7b060188ee9c5f02c3afbb1025b3ce7e5554ac6cb63d4a162396dd683b12e8c	["*"]	\N	2025-05-17 06:01:48	2025-05-17 06:01:48
201	App\\Models\\User	73	Personal Access Token	e6ceb4b0c7b192a18eaaaa81cf5a13d8a90ce6321a6a47a823a5fd851dfbc776	["*"]	\N	2025-05-17 07:30:34	2025-05-17 07:30:34
202	App\\Models\\User	73	Personal Access Token	95c2aaf43b2cc62a014dcd22af20b273926bca7c5c62a063f99180bd01dcab61	["*"]	\N	2025-05-17 07:31:46	2025-05-17 07:31:46
203	App\\Models\\User	102	Personal Access Token	7c30d84e25fcc6d705df40495f5f456a47da2f83c5135e2d6ccbe036d81a5cf4	["*"]	\N	2025-05-17 09:35:42	2025-05-17 09:35:42
204	App\\Models\\User	102	Personal Access Token	b1683f678a66254c33c8dd7debccdf0d56f7db0d14bb255396a538e20999d0fe	["*"]	\N	2025-05-17 09:35:42	2025-05-17 09:35:42
205	App\\Models\\User	103	Personal Access Token	4a9a92bb87ba1be3b0c0c60f3d019c1a5dff07f09b725c4a785495cc79cc8962	["*"]	\N	2025-05-17 10:29:29	2025-05-17 10:29:29
206	App\\Models\\User	103	Personal Access Token	0316a7791c6f7af4f2a5c0e5e0fa01cd4c440e61579e8b5e7f3f42e067734272	["*"]	\N	2025-05-17 10:29:29	2025-05-17 10:29:29
207	App\\Models\\User	104	Personal Access Token	e796846c790872be0a514b788bd028c8b5a70b23a73580cc46eaf5873fa71bfb	["*"]	\N	2025-05-17 10:38:24	2025-05-17 10:38:24
208	App\\Models\\User	104	Personal Access Token	204d326dac6e4f1fd710c60998e8b3fb1d06e674a1410afa85672d306f29eb32	["*"]	\N	2025-05-17 10:38:24	2025-05-17 10:38:24
209	App\\Models\\User	75	Personal Access Token	2d6c819e39e8349c11d67c88ef4c87d234399e81faa0274a72ac57967666c750	["*"]	\N	2025-05-17 10:52:08	2025-05-17 10:52:08
210	App\\Models\\User	105	Personal Access Token	063f9a1f8d22d7eb0dd63a0af8be1c83e37c28042bf7249a963a6f4308345dda	["*"]	\N	2025-05-17 11:13:13	2025-05-17 11:13:13
211	App\\Models\\User	105	Personal Access Token	79f7003671e0e8837541c2f01f69677b0709a8093b9e674051851effd904949f	["*"]	\N	2025-05-17 11:13:14	2025-05-17 11:13:14
212	App\\Models\\User	105	Personal Access Token	9f31bc3cb356f9883bc228165e3336c773c0ae2a64467877c388b4909a48cc80	["*"]	\N	2025-05-17 11:24:08	2025-05-17 11:24:08
213	App\\Models\\User	105	Personal Access Token	9a3ce7a33d831e2728fcda306d09f6a9de27a53bd647f74845e889c5d65cf17f	["*"]	\N	2025-05-17 11:25:43	2025-05-17 11:25:43
214	App\\Models\\User	105	Personal Access Token	924327e2d8526f845d17b9220d54beb4808cdb09023ecb6fd62e8e9c29274566	["*"]	\N	2025-05-17 11:26:29	2025-05-17 11:26:29
215	App\\Models\\User	105	Personal Access Token	ba280c52d1dea085a9dab25d58c72a414c1a312ba0d4d6bb010aba16acc4f930	["*"]	\N	2025-05-17 11:52:01	2025-05-17 11:52:01
216	App\\Models\\User	105	Personal Access Token	13429f4e4881fb8db32f282042de1127eb64b18d5c35d58f90798719b34953c4	["*"]	\N	2025-05-17 11:59:51	2025-05-17 11:59:51
217	App\\Models\\User	105	Personal Access Token	3392ec1da3cb12a284b60f09b70e41742ebd41a7591c194ad7a496d18f02e8a4	["*"]	\N	2025-05-17 12:14:35	2025-05-17 12:14:35
218	App\\Models\\User	106	Personal Access Token	553ca57dcece242d0f5b3728799112195cf5116cb65613956ee84cafe795c1ab	["*"]	\N	2025-05-17 12:17:28	2025-05-17 12:17:28
219	App\\Models\\User	106	Personal Access Token	0f0ee20fc128fe1000e2ed814880b65612c6113912eecb6eb841531fc65907ca	["*"]	\N	2025-05-17 12:17:28	2025-05-17 12:17:28
220	App\\Models\\User	105	Personal Access Token	5d354fa38cda4d38a52036c65c339038b50ce6eaf3607da214fdb7c938cffe66	["*"]	\N	2025-05-17 12:24:17	2025-05-17 12:24:17
226	App\\Models\\User	73	Personal Access Token	02a276281bac2b831994f32265b713f88bdcbd265f74681f054337eece7b69b5	["*"]	\N	2025-05-17 18:40:25	2025-05-17 18:40:25
227	App\\Models\\User	73	Personal Access Token	f90bf9e87d9cfaf2719c8d2ab9f379c7f07111cf7af3bb7e4b46b6b355f42a44	["*"]	\N	2025-05-17 18:40:47	2025-05-17 18:40:47
228	App\\Models\\User	73	Personal Access Token	eeb7848e0477d63620860f596f974045c9d490d5f3d9fdac6e4f0b86c0ef14b0	["*"]	\N	2025-05-17 19:40:03	2025-05-17 19:40:03
231	App\\Models\\User	107	Personal Access Token	bf9d402969c47150ac2ec6a22921a35fc8333ac22024176888113ad010452eb9	["*"]	\N	2025-05-18 01:14:32	2025-05-18 01:14:32
232	App\\Models\\User	107	Personal Access Token	c212a12e8f8d4c6cd0fcbbcdf14b51f12ec63a1923a900eb5fc7df6f60607f2c	["*"]	\N	2025-05-18 01:14:32	2025-05-18 01:14:32
235	App\\Models\\User	54	Personal Access Token	1b3f300c1ce354ce871ba6b78dec64f491d5b7ff31801ba6ebb6da562f0d011d	["*"]	\N	2025-05-18 19:14:24	2025-05-18 19:14:24
236	App\\Models\\User	108	Personal Access Token	d65d6e2f8b6528cfbb8f47b94030a30a7ff1c8f7a29b8ba0ea4e21d1d342b012	["*"]	\N	2025-05-18 19:17:58	2025-05-18 19:17:58
237	App\\Models\\User	108	Personal Access Token	52d06fdf54f881730a28ed50436ce1a4bb1478402f523d29a9632b7b3f62ca99	["*"]	\N	2025-05-18 19:17:58	2025-05-18 19:17:58
238	App\\Models\\User	108	Personal Access Token	b782487f5bb7d522f80c25061f7a853970b5a52727265337238d66f017c398e5	["*"]	\N	2025-05-18 20:25:12	2025-05-18 20:25:12
239	App\\Models\\User	108	Personal Access Token	7a34d6791d4faf5ed3851beebf9e7be4b3850e6abcf112dfd71addb461c919e7	["*"]	\N	2025-05-18 20:28:58	2025-05-18 20:28:58
241	App\\Models\\User	109	Personal Access Token	8dc95907b3de43b6d84ac61c12e8e58d39646e6ad2e679dc7dd6bf9e6e1326c0	["*"]	\N	2025-05-19 06:00:26	2025-05-19 06:00:26
242	App\\Models\\User	109	Personal Access Token	cd5e57d9cd90bb862ff1c39fc87c0f049bb59faae6f0a01fca3cf7da9711ea0c	["*"]	\N	2025-05-19 06:00:27	2025-05-19 06:00:27
243	App\\Models\\User	110	Personal Access Token	4fb703736f6a86b55a2e4027d7488d3738252c4e6e1d55beee6a13ef6e5d37ac	["*"]	\N	2025-05-19 14:47:39	2025-05-19 14:47:39
244	App\\Models\\User	110	Personal Access Token	9fc0dd2304421d1c7799573d39e9634cd3c54830cb4fb5ef0a2990b4cc5e5cba	["*"]	\N	2025-05-19 14:47:39	2025-05-19 14:47:39
246	App\\Models\\User	57	Personal Access Token	1450d07b51fc57aa38aa9c3b16d324e98fd7bc8981f6d47d44c8959feca1cf41	["*"]	\N	2025-05-19 16:34:13	2025-05-19 16:34:13
249	App\\Models\\User	112	Personal Access Token	ec960c7e85cd71bdcf868ffb22fd8bbac7d7bc24ac76785730d8542e98266d7b	["*"]	\N	2025-05-19 16:47:07	2025-05-19 16:47:07
250	App\\Models\\User	112	Personal Access Token	2928df4e932d476d3da81fd6bc903527fed8d4179bc26b8841431360de0c220f	["*"]	\N	2025-05-19 16:47:07	2025-05-19 16:47:07
251	App\\Models\\User	112	Personal Access Token	0a08737768135f4c935a577b5c3412029d1ba935f3bc26de9a8fd604a7a5a474	["*"]	\N	2025-05-19 16:48:13	2025-05-19 16:48:13
253	App\\Models\\User	113	Personal Access Token	918cb1d8c34997c7f899841d69d8c9f7ca047c262f31f707876c2c3278c80d19	["*"]	\N	2025-05-19 17:53:50	2025-05-19 17:53:50
254	App\\Models\\User	113	Personal Access Token	4ee7e150f0fb4a60120b683cd491a98d8c5517c674cb26c42b1eb33b465e396a	["*"]	\N	2025-05-19 17:53:50	2025-05-19 17:53:50
255	App\\Models\\User	113	Personal Access Token	a75dfe277174090de5720b85d755d2821ed65f46cb2b0f8f19dc15d97ba57752	["*"]	\N	2025-05-19 17:56:37	2025-05-19 17:56:37
256	App\\Models\\User	114	Personal Access Token	e83c3c322e1496066aa7610448f77703df2dc5c0cb69012c83dc9e72902b6010	["*"]	\N	2025-05-19 17:59:39	2025-05-19 17:59:39
257	App\\Models\\User	114	Personal Access Token	bda6cf748917abe48f1f120f9f85503c3e8e495cb34fe049d808ccf5c35c5ad5	["*"]	\N	2025-05-19 17:59:39	2025-05-19 17:59:39
258	App\\Models\\User	100	Personal Access Token	67d661aa50a80f09a33988c3ef5cfe0d8ef7123ba9d53b05a9e7d62d18a5c453	["*"]	\N	2025-05-19 18:03:14	2025-05-19 18:03:14
259	App\\Models\\User	115	Personal Access Token	89f6996ca94b045891602e2ee6b77f77afd8fc7d13b667fc1531566f88a88d2c	["*"]	\N	2025-05-19 19:13:18	2025-05-19 19:13:18
260	App\\Models\\User	115	Personal Access Token	2f8a31682eddee4b181076feaf56174654b87c767d2e4ff20a8aeb18feb9609d	["*"]	\N	2025-05-19 19:13:19	2025-05-19 19:13:19
264	App\\Models\\User	75	Personal Access Token	66258bb9e86c1c4f11f55a67f38c9e413486a93e3ea2cbb41429037cd21a6ff8	["*"]	\N	2025-05-19 21:42:23	2025-05-19 21:42:23
265	App\\Models\\User	117	Personal Access Token	b3946117244a9cc3f25b06e701a68854f171df5826e9a0bfda82597634434fd5	["*"]	\N	2025-05-19 21:44:08	2025-05-19 21:44:08
266	App\\Models\\User	117	Personal Access Token	8c72aa8b666f6aac0b7241ef3053edc600d91c1ccbadbd060dc6252836f9a7af	["*"]	\N	2025-05-19 21:44:09	2025-05-19 21:44:09
268	App\\Models\\User	120	Personal Access Token	9e29683875cc5ddc160881c55062d3855f994ba65aca6f1f8a0ea35ebf521722	["*"]	\N	2025-05-20 00:08:37	2025-05-20 00:08:37
269	App\\Models\\User	120	Personal Access Token	314015786f4d8eadff3c22f5cdb910870faf15fe5bcb86c892fb87b50ad480c9	["*"]	\N	2025-05-20 00:08:37	2025-05-20 00:08:37
270	App\\Models\\User	121	Personal Access Token	ffc147057dbae296cc19d030e4ced1695daa0d8edf1cb46ac52d5eddf65e74a9	["*"]	\N	2025-05-20 00:14:35	2025-05-20 00:14:35
271	App\\Models\\User	121	Personal Access Token	6648ba0fa693b871ba7bec18d016e6eb674410eccf7249ebdb1644bbda593e0b	["*"]	\N	2025-05-20 00:14:35	2025-05-20 00:14:35
272	App\\Models\\User	122	Personal Access Token	cf9c64af2eb7be5b39bf85f2e43957fd87e5f5aede6af12f3c3c95c9dac067ca	["*"]	\N	2025-05-20 09:37:17	2025-05-20 09:37:17
273	App\\Models\\User	122	Personal Access Token	57bda05406feb1a0f07d8fdd881c2aaac0479f14f54e852e517ff702e51c9686	["*"]	\N	2025-05-20 09:37:17	2025-05-20 09:37:17
274	App\\Models\\User	111	Personal Access Token	3e4b28ff3c97aae413a2df56cb760a9fe6c6d8437117317cf09bb03e2168256d	["*"]	\N	2025-05-20 18:26:04	2025-05-20 18:26:04
276	App\\Models\\User	112	Personal Access Token	507e41b238e04e04277bc30d40c54dbb70bb140e4c50538b7647f47fd8d7d8e4	["*"]	\N	2025-05-20 18:41:23	2025-05-20 18:41:23
277	App\\Models\\User	113	Personal Access Token	93bde692b41232374b5cea373b00254cfc0ea3c2d39fdbf54ed9f8a4e04af2f8	["*"]	\N	2025-05-20 19:08:08	2025-05-20 19:08:08
278	App\\Models\\User	121	Personal Access Token	fdf543106d2c07c6d89905d557c7be3d5ac8d8ea8ce360c1d0ee315b88c9fd20	["*"]	\N	2025-05-20 19:23:02	2025-05-20 19:23:02
279	App\\Models\\User	113	Personal Access Token	e07158c3e613565b65ce29820d59f1075ce8f30bf177bec9e4e6004357a4ba13	["*"]	\N	2025-05-20 19:31:53	2025-05-20 19:31:53
280	App\\Models\\User	105	Personal Access Token	1cb1edd2fd56f85212affdacdaffebc76fabc67a60e74bc37abf958df73eb786	["*"]	\N	2025-05-20 19:32:24	2025-05-20 19:32:24
283	App\\Models\\User	105	Personal Access Token	4c2fbd87d9b77116c6c0226388314d253d3dc2d2cc3a0d57475dd8cfc1adb003	["*"]	\N	2025-05-20 20:41:51	2025-05-20 20:41:51
284	App\\Models\\User	116	Personal Access Token	c50022e6b3c8427b51e9369c90f2ec1bb9d992962087d8d5de76aaa3b70b1fd0	["*"]	\N	2025-05-20 20:43:45	2025-05-20 20:43:45
285	App\\Models\\User	123	Personal Access Token	b3e453db6692861ce37b6511c0f39b59815bb20f602d1456d67cc3cb1584611b	["*"]	\N	2025-05-21 00:22:56	2025-05-21 00:22:56
286	App\\Models\\User	123	Personal Access Token	70e9f5eb36592db29811d51daa3cc620c4df4d0a299082d5caf3f6bff39e6605	["*"]	\N	2025-05-21 00:22:57	2025-05-21 00:22:57
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
5	Vendor	active	2025-04-08 20:10:38	2025-04-08 20:10:38	\N	0
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
16	Ajesh Kumar	ajeshcd@gmail.com	971	505041861	0	1	1	$2y$10$izqRjjIgrjldO71UGf/6VO.QW2uPLdEj7Q3PBQ4wJxR8XVxa4g.HK	2025-05-14 07:31:47	2	Ajesh	Kumar	\N	1111	1111	fCYXTdOnmkM-skLMqHIfPO:APA91bFDDd4okNWLjQ7YyROPOnbaxdw8zU_kBag21K1-9jYFRSOgDYfnOA_iqysGGzDz7OPR3kgNgAvoQzltvXJF134U_ySI3U2I2Cnz41cIO_4tAAyCEgs	ios	\N	\N		\N	2025-05-14 07:31:47	2025-05-14 07:31:47
15	Lutfie Alhashimi	dhdhdh@hdjdjdj.com	971	504113314	0	1	1	$2y$10$WQjdENySPrje5GnrT2AQKueTDzqmmvyQ8C/8ReQ/yte4Z5zqdWheG	2025-04-03 23:13:26	2	Lutfie	Alhashimi	\N	1111	1111	dg_4LY5OQ1i7vgoOhwM--u:APA91bHXReRtFgFGYBHNqs9CFD4gebh84hYLW9kV1jB2rZaDQzSYn6TPX_JfLGsldKWBUIUhbcEs3k3tUMktWDl-Hf7ZCkeTokPintFcCE-vi-oWsSEHvKE	android	\N	\N		\N	2025-04-03 22:30:00	2025-04-03 23:13:26
17	Usama Shakeel	usama@ymail.com	971	125125125	0	1	1	$2y$10$AO0Q6sG4yknvQfK6mh3n/eDi.oaKTmqxNL6bDXo2Us4DSiVd./1tu	2025-05-14 12:16:49	2	Usama	Shakeel	\N	1111	1111	dS-6gpfBREtvmlYKIFqN6Q:APA91bEkmjGWI8CPmvki7-mJJqNuS8rX2VqyFOar0k9jRQiNqyS_foddl5bOYEQ1QIYAoYAIomseFxol3vP95edItdZgf2qWaC_mSLJjvn1COJHgavw_NK4	ios	\N	\N		\N	2025-05-14 12:16:49	2025-05-14 12:16:49
18	Usama Usama	ui@ui.com	971	126126126	0	1	1	$2y$10$hSQBt.4EIbYzNOdhTRUMLOGAYNhqKW0JEvhcUxUpunsJ0xR5qPZnC	2025-05-14 12:38:17	2	Usama	Usama	\N	1111	1111	fDLqNUsSQu-KLmpUVzoz_x:APA91bGiZIBiU4Mkz0UQSqyplWHpMsNWJ2lEIt5fpuFHD8ngtlqmHpTY_7ePfE6DU2mpcC2hWUVqOsGAlC3WRjgd9kGxJVJAIQuoY-x5rF6UrI-1VHMcpok	android	\N	\N		\N	2025-05-14 12:38:17	2025-05-14 12:38:17
19	Usama Shakeel	usama123@gmail.com	92	134145155	0	1	1	$2y$10$ar9XUBDYT2zv3lKwBKkEmeIB1iPbu8PwnS9NyYLW1tef1LaEZp2cG	2025-05-14 12:41:29	2	Usama	Shakeel	\N	1111	1111	123123123123	android	\N	\N		\N	2025-05-14 12:41:05	2025-05-14 12:41:29
20	Anil Navis	anil01@anil01.com	971	5666884566	0	1	1	$2y$10$xwAK7O93247DPybZKBgEKOudsg5pqRO8D6ySB2rIZ8GauJHW4Wr0K	2025-05-15 07:52:42	2	Anil	Navis	\N	1111	1111	eAddbvMzEER9vC2JXlmext:APA91bFsjqVXc7e_hxV0RHybA6p_qtrILcrOKRTpAoczIlkdWrLR3Sv9KV33TtywHjxX1jWMkV1mRLphEHhuyckguBJ33fTkSF6klLD7M0maTeJupq0_2uc	ios	\N	\N		\N	2025-05-15 07:52:42	2025-05-15 07:52:42
21	Usama Shakeel	ushakeel99@gmail.com	971	1254124514	0	1	1	$2y$10$5BlmJLh5C3vdD.E9Rv2z0enpDFUv.1WW5I1KZHjBZpbycR54n7.Ya	2025-05-15 14:52:14	2	Usama	Shakeel	\N	1111	1111	f8Xa7HTVKUOMudtc4CbzMv:APA91bFBiA0yKm2PsD89-55bfamKqUFa12v5ZB5wADTaoiuMjin9xFFeap_EAGvHimK0L3NSkSFgeZqjUhlrQJi18wekhcU3R41Wf8iEezoIRDHlEj5icmY	ios	\N	\N		\N	2025-05-15 14:52:14	2025-05-15 14:52:14
1	ANIL NAVIS	anil@dxbusinessgroup.com	971	5545508455	0	1	1	password	2025-05-17 06:01:44	2	ANIL	NAVIS	\N	1111	1111	e95BLf2Dc0U9i8HncgKDwz:APA91bEP_vCpbNxs7Y9_zwKAFufD5-plhDau1BwaqzC_S06mGN9Slq5OP45CVoC8ZwQOtbeN02dH3TX-yDzgVd_oiPGhNwzab5aaJCPBLTnKJkwHNHHmcU8	ios	\N	\N		\N	2025-03-27 11:37:24	2025-05-17 06:01:44
3	Hamid Raza	razahamid94@gmail.com	971	3441562554	0	1	1	$2y$10$F505AJMBlpAF9/IVoOqer.Dbxl0EQSAWihgsqmqO2.3WQOZvu7n1y	2025-05-17 09:35:37	2	Hamid	Raza	\N	1111	1111	emekOWZxQYmp4GOnCibPYg:APA91bFoqSl5UUdxLzAH6MsClDOx2fwUcuIH3UtjTN-fBFJCwDTT7VWuAaJvA9lH1xRZgEmVPUIFKWKu5pzjCsug-n96yD-E4DSydTlUnkpgdtmbEljcoLw	android	\N	\N		\N	2025-03-27 13:41:30	2025-05-17 09:35:37
23	sabeeh k	21@1.com	971	12	0	1	1	$2y$10$2/KTXpPU.O4nWQGuHp6qOeb6KPi5jBlX69mJxBVxiVgXEF1opUCMK	2025-05-17 10:28:06	\N	sabeeh	k	\N	1111	1111	123123	android	\N	\N		\N	2025-05-17 10:28:06	2025-05-17 10:28:06
24	sabeeh k	211@1.com	971	122	0	1	1	$2y$10$KpL9IqY3dWgqtULAgvnWc.W9BUnL1mOhYHHTkltjkkQgSYzJTgP6S	2025-05-17 10:38:10	\N	sabeeh	k	\N	1111	1111	123123	android	\N	\N		\N	2025-05-17 10:38:10	2025-05-17 10:38:10
14	Usama Shakeel	usama@gmail.com	971	124124124	0	1	1	$2y$10$7RQeHpyO6Mj8OGLDQ1a2iOYY.zcRlBaKBcXQZrgATZPsCGzO4ZVgO	2025-05-17 11:13:10	2	Usama	Shakeel	\N	1111	1111	fh-I5UjOtEASkaWoj8-6hD:APA91bGO4fxv1ZJdD1K0yow1gkG5TpPU1lkfAO2QNyfIHShomvWRCtKaMqaAmJQ4oAwOwZX2X5H03_YahCl45UNt7HHZ2ycnT_FriUJd-kiBemBfuQZJL5M	ios	\N	\N		\N	2025-03-29 18:20:23	2025-05-17 11:13:10
25	Usama Shakeel	usama92@gmail.com	971	129129129	0	1	1	$2y$10$tb6lAVkFjKY4LF2LKBSz8us.7kmZZa8ASys7b7slQzcASi6HyEyt2	2025-05-17 12:17:24	2	Usama	Shakeel	\N	1111	1111	fOde4ucjS7u1T4Ak1Oq9UM:APA91bFD61m1ZMtuX05oJi6jf1g93ystxNnSi-RMT0DyE14GD7WvgB3fX2YTxhAwRfdVReB8Jq5mgiuh1sV4J4BdKnbhq7LUuAGg1WDXXpGOU40BA5eszxw	android	\N	\N		\N	2025-05-17 12:17:24	2025-05-17 12:17:24
26	Usama shakes 	usha@gmail.com	971	1245124541	0	1	1	$2y$10$JPnvW1rXSchMkVVt0TioH.cbz60NuN2fLWI5sTWSvrZD1XZsrQFMS	2025-05-18 01:14:28	3	Usama shakes	\N	\N	1111	1111	cJOB0fjiAkIct8-ZODO-kB:APA91bHoP7XO34hb8oNO71eFh-7dZdbs1MgsNBqBEb7IiAgWJ5AzCdopweZE-miI5t1uBcJebdm3wvUiLP2Lfb1qZnM_ATgBIsAho0muMYZXYJPwSra-2LY	ios	\N	\N		\N	2025-05-18 01:14:28	2025-05-18 01:14:28
27	Mahesh kumar	mah@mah.com	971	546486464	0	1	1	$2y$10$nYspq02KqgJub1H9ETsam.23neM3oiLaOsCjrzKbNV6oFQ4icqiLW	2025-05-18 19:17:53	2	Mahesh	kumar	\N	1111	1111	fOo_9b3Sokx0lGcn81vgSU:APA91bGVb96AFgO9AhOr2fQuGng-ZY8F9Q947LUp410uc184NwuHPxHSQhW8xzLZo-exMf6TV-sozMc8oNY6FwK8IZBuSHu5n7dI6_eBbiKsPa7W8LUm_Yc	ios	\N	\N		\N	2025-05-18 19:17:53	2025-05-18 19:17:53
28	Macaroni 	ddrc@ddrc.com	971	213184646	0	1	1	$2y$10$s7w2SmneD3QurK1//S7O6.k3xCO00nHEsrhNvhTXEcr8LGaXlvcy6	2025-05-19 06:00:22	3	Macaroni	\N	\N	1111	1111	fOo_9b3Sokx0lGcn81vgSU:APA91bGVb96AFgO9AhOr2fQuGng-ZY8F9Q947LUp410uc184NwuHPxHSQhW8xzLZo-exMf6TV-sozMc8oNY6FwK8IZBuSHu5n7dI6_eBbiKsPa7W8LUm_Yc	ios	\N	\N		\N	2025-05-19 06:00:22	2025-05-19 06:00:22
29	Usama Business 	b10@gmail.com	971	129129128	0	1	1	$2y$10$8tKN7NrNRtRVhQSeqqDQgubNFujg1ozrFJdM3CkIjzEUOhAyyhcKS	2025-05-19 14:47:35	3	Usama Business	\N	\N	1111	1111	cJOB0fjiAkIct8-ZODO-kB:APA91bHoP7XO34hb8oNO71eFh-7dZdbs1MgsNBqBEb7IiAgWJ5AzCdopweZE-miI5t1uBcJebdm3wvUiLP2Lfb1qZnM_ATgBIsAho0muMYZXYJPwSra-2LY	ios	\N	\N		\N	2025-05-19 14:47:35	2025-05-19 14:47:35
30	Anil Navis	navisanil@gmail.com	971	5131681616	0	1	1	password	2025-05-19 16:35:01	3	Anil	Navis	\N	1111	1111	egdP3nfVZ0N8v_12dJFRNg:APA91bG3dzePYyfWG8sYmqL-2iTaueGATKUnHBqCZIECa0RYQ1XRWIEFeM1xSZ_EZ7fsVNKQhcs-vX4Xp2a8W-58GWjN5JNFk0u2kMYI7wf8v6ihcWwbCPM	ios	\N	\N		\N	2025-05-19 16:35:01	2025-05-19 16:35:01
31	Usama Business 	usamab@gmail.com	971	1245457864	0	1	1	$2y$10$qOJetnSFe8jd.sWEw8/s0eP/71HgATD8lV1IgTNbXqstnPc./HSR6	2025-05-19 16:47:04	3	Usama Business	\N	\N	1111	1111	cJOB0fjiAkIct8-ZODO-kB:APA91bHoP7XO34hb8oNO71eFh-7dZdbs1MgsNBqBEb7IiAgWJ5AzCdopweZE-miI5t1uBcJebdm3wvUiLP2Lfb1qZnM_ATgBIsAho0muMYZXYJPwSra-2LY	ios	\N	\N		\N	2025-05-19 16:47:04	2025-05-19 16:47:04
32	Usama Shakeel	b8@gmail.com	971	92	0	1	1	$2y$10$D1ldtt1GoHOXMlhRogq0beagYYf7Y4swAiJVBNHUCaMdHSHrSMZ.a	2025-05-19 17:46:49	3	Usama	Shakeel	\N	1111	1111	123123	android	\N	\N	uploads/trade_licenses/qcktjVkyoKg5jB4Yb5IhfOw91Cu7QTOk9hCmatcQ.png	\N	2025-05-19 17:46:49	2025-05-19 17:46:49
33	Usama 	b90@gmail.com	971	147147147	0	1	1	$2y$10$gDIuPCinmkSlDXNELzKeZu6Vq9j91e6nUsKGfgUw7oGsf.5XowjwW	2025-05-19 17:53:46	3	Usama	\N	\N	1111	1111	cJOB0fjiAkIct8-ZODO-kB:APA91bHoP7XO34hb8oNO71eFh-7dZdbs1MgsNBqBEb7IiAgWJ5AzCdopweZE-miI5t1uBcJebdm3wvUiLP2Lfb1qZnM_ATgBIsAho0muMYZXYJPwSra-2LY	ios	\N	\N	uploads/trade_licenses/v547nGW8zYo92tPlYV8jOAkSTkKgyzAxOZiORTKA.jpg	\N	2025-05-19 17:53:47	2025-05-19 17:53:47
34	Sabeeh 123 k	155@1.com	971	1	0	1	1	$2y$10$qfEAeqoJz/cm3MesszgageAAC.5dntI0lBkfU4nG4thmiQTYYrjq6	2025-05-19 17:58:47	\N	Sabeeh 123	k	\N	1111	1111	123123	android	\N	\N	uploads/trade_licenses/yFIHzfmuPEBiKIS9lzuigbHMJOZyyfJ3t2D2gRuE.jpg	\N	2025-05-19 17:58:47	2025-05-19 17:58:47
22	Usama Shakeel	ushakeel010@gmail.com	971	222555888	0	1	1	password	2025-05-19 20:40:35	3	Usama	Shakeel	\N	1111	1111	cJOB0fjiAkIct8-ZODO-kB:APA91bHoP7XO34hb8oNO71eFh-7dZdbs1MgsNBqBEb7IiAgWJ5AzCdopweZE-miI5t1uBcJebdm3wvUiLP2Lfb1qZnM_ATgBIsAho0muMYZXYJPwSra-2LY	ios	\N	\N	uploads/trade_licenses/lsNS4jvcSUoOXoZxsIOBhGb3q1rwT7HRlYcb95cq.jpg	\N	2025-05-16 16:55:32	2025-05-19 20:40:35
35	Usama Business 	usamab1@gmail.com	971	148481481	0	1	1	$2y$10$5Id9YrOchnMTz8.VpP1PfOoMFCP0MIlMVQbNCCv9Q5KVkWAKb3L6W	2025-05-19 21:44:05	3	Usama Business	\N	\N	1111	1111	cJOB0fjiAkIct8-ZODO-kB:APA91bHoP7XO34hb8oNO71eFh-7dZdbs1MgsNBqBEb7IiAgWJ5AzCdopweZE-miI5t1uBcJebdm3wvUiLP2Lfb1qZnM_ATgBIsAho0muMYZXYJPwSra-2LY	ios	\N	\N	uploads/trade_licenses/CnUYVTftZKJNi127LAUXhRsiPDL9QX6KH5AIwhT5.jpg	\N	2025-05-19 21:44:05	2025-05-19 21:44:05
36	Navisand group 	ngo@ngo.com	971	4548464046	0	1	1	$2y$10$X/Uf.qRIEewEBaEKikP4AuMF1uk39E72Se8mTDRcNbRWdxW/dPXKK	2025-05-20 00:08:32	3	Navisand group	\N	\N	1111	1111	fie5W0qQ-kQcmPNqLkzZbr:APA91bHcAKERVTBOcxSchTgCR7jIImukl4v0K1XhybtISjjzihP0nu4Lg-hEX1dnzkIxAI11jXL_C4tqaejCFnGRJoRbVnvIvDs4OCJrhXNLSN0RnIjJjwg	ios	\N	\N	uploads/trade_licenses/Dx8h7OoiZIEajmpK01BChLUzOb45SbZZ76Mpj4ky.jpg	\N	2025-05-20 00:08:32	2025-05-20 00:08:32
37	Anil Navis	anvis@anvis.com	971	8464664864	0	1	1	$2y$10$IksUsmcWyJOZ7FZQIUH1G.5pfdZeRfinPJUTfL37kVrtfrzAC5NQa	2025-05-20 00:14:31	2	Anil	Navis	\N	1111	1111	fie5W0qQ-kQcmPNqLkzZbr:APA91bHcAKERVTBOcxSchTgCR7jIImukl4v0K1XhybtISjjzihP0nu4Lg-hEX1dnzkIxAI11jXL_C4tqaejCFnGRJoRbVnvIvDs4OCJrhXNLSN0RnIjJjwg	ios	\N	\N		\N	2025-05-20 00:14:31	2025-05-20 00:14:31
38	Usama Shakeel	io@io.com	971	147014708	0	1	1	$2y$10$iBEoGQok9ODAw79qQb.dfuHeI.mVVf60S033euRZSJNcjfgBNZj7C	2025-05-20 09:37:13	3	Usama	Shakeel	\N	1111	1111	cJOB0fjiAkIct8-ZODO-kB:APA91bHoP7XO34hb8oNO71eFh-7dZdbs1MgsNBqBEb7IiAgWJ5AzCdopweZE-miI5t1uBcJebdm3wvUiLP2Lfb1qZnM_ATgBIsAho0muMYZXYJPwSra-2LY	ios	\N	\N	uploads/trade_licenses/OdmIbOCTt8LN3dQmjQ5ZDzIK0Dn0WniucBAyActm.jpg	\N	2025-05-20 09:37:13	2025-05-20 09:37:13
39	Navis business 	navbus@gmail.com	971	5466484664	0	1	1	$2y$10$VpBo424ODO2nLy59z4Hcl.eCponrTFjITvXwWlkrpD9NTSMV8oWOy	2025-05-21 00:22:52	3	Navis business	\N	\N	1111	1111	f0xl3DlMgE-CkO_BZu2986:APA91bHfAipMrOula_V1ej2HRINaIKag4gPhgAkDSMSCP6xLGJ0K5mU2Gx6V-zyGIhBnLTnCjJd98uBAHZtBg4_HvvcOzZJSTn5rMuChoR2AZVJVhoWOzj8	ios	\N	\N	uploads/trade_licenses/dF1wnfU4vjoMenox8Gmk0blYVz4BasKRhjTVfGJh.jpg	\N	2025-05-21 00:22:53	2025-05-21 00:22:53
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
7	tok_1RBpSKRwhoKMBfqcGrxZRR1W	xxxxxxxxxxxx1111	91	1	2025-04-09 07:37:41	2025-04-09 07:37:41
8	tok_1RBvnSRwhoKMBfqcMYz1JhxL	xxxxxxxxxxxx1111	92	0	2025-04-09 14:23:56	2025-04-09 14:24:29
9	tok_1RBvnqRwhoKMBfqcUcVHLc16	xxxxxxxxxxxx1111	92	1	2025-04-09 14:24:19	2025-04-09 14:24:29
10	tok_1RQYKNRwhoKMBfqcR5nMSFD5	xxxxxxxxxxxx4242	82	0	2025-05-19 22:22:20	2025-05-19 22:22:20
13	cus_SLFlt7C3vNXaTr	xxxxxxxxxxxx4242	119	1	2025-05-19 23:22:15	2025-05-19 23:22:25
14	cus_SLFpXr4Dp8ZwUN	xxxxxxxxxxxx4242	119	0	2025-05-19 23:25:38	2025-05-19 23:25:38
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
17	4.00	Great	48	5	12	2025-04-11 09:53:08	2025-04-11 09:53:08
18	4.00	Reat	48	5	11	2025-04-12 13:12:36	2025-04-12 13:12:36
19	4.00	Vvbbnh	54	82	113	2025-04-24 14:10:29	2025-04-24 14:10:29
20	3.00	The only way I could do that would	73	56	92	2025-05-17 08:36:51	2025-05-17 08:36:51
21	5.00	Gahjais	73	82	250	2025-05-17 19:40:16	2025-05-17 19:40:16
22	4.00	Uiiiuyiihgjoo	54	82	118	2025-05-18 19:14:05	2025-05-18 19:14:05
23	4.00	The The Big Lie	111	82	291	2025-05-19 23:44:07	2025-05-19 23:44:07
24	3.00	Yyyuuu	111	87	293	2025-05-20 18:26:11	2025-05-20 18:26:11
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

COPY public.users (id, name, email, dial_code, phone, phone_verified, password, email_verified_at, role_id, user_phone_otp, user_device_token, user_device_type, user_access_token, firebase_user_key, status, remember_token, created_at, updated_at, deleted_at, provider_id, avatar, address, profile_image, is_admin_access, latitude, longitude, country, city, zip_code, address_2, user_device_id, is_social, email_verified, user_email_otp, trade_license, deleted, first_name, last_name, active, password_reset_code, password_reset_time, password_reset_otp, temp_dial_code, temp_mobile, temp_email, ratings, total_ratings, stripe_customer_id, profile_completed, password_sent, card_saved, vendor_id, permissions) FROM stdin;
4	Mz Movers	softcube.web@gmail.com	297	03023484848	1	$2y$10$yn6Gzu.IXMCsbILTuT9Qn.BGwPEpg4QX/crKaN1kowOW7PI9jwmi2	2023-05-25 21:36:11	4	\N	\N	\N	\N	\N	active	\N	2023-05-25 21:36:11	2023-05-30 10:33:49	\N	\N	\N	57R6+C4P - Sheikh Zayed Rd - Dubai - United Arab Emirates	\N	0	25.204819	55.2603152	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
6	Fixit Office Relocators	fixit@email.com	61	2228822882828	1	$2y$10$taSoswFFAv31T5eqsbiOS.kNbqwu6GBkNsZPRTg6nK/Z5cuotqPzG	2023-05-27 15:29:52	4	\N	\N	\N	\N	\N	inactive	\N	2023-05-27 15:29:52	2023-05-30 12:24:13	\N	\N	\N	Block D, 3rd Floor, Office Park Building #56 - الصفوح - مدينة دبي للإنترنت - دبي - United Arab Emirates	\N	0	25.204819	55.1684566	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
3	Allen Max	allen@email.com	43	38373733663	1	$2y$10$64DwJ5UrOz.8q5pfrYnGye0icnYLAvKomzoVtu1x0jC0yBbhmP3F.	2023-05-25 20:56:23	3	\N	\N	\N	\N	\N	active	\N	2023-05-25 20:56:23	2023-09-12 18:15:01	\N	\N	\N	57R6+C4P - Sheikh Zayed Rd - Dubai - United Arab Emirates	\N	0	25.19109980000001	55.2603152	United Arab Emirate	Dubai	00000	5th Floor 342 Apartment	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
15	Samba	samba23@gmail.com	971	3235355	1	$2y$10$B3J0C8/AglScgSzUrskFR.QTLLWypSAeMAbmj.PdQEQ.2LQ24542u	2025-01-21 15:50:50	4	\N	\N	\N	\N	\N	active	\N	2025-01-21 15:50:50	2025-01-21 15:50:50	\N	\N	\N	3MQ4+W9G, Multan - Vehari Rd, Makhdum Rashid, Multan, Punjab, Pakistan	\N	0	30.089513	71.655558	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
10	My New Company 1	abcdef@email.com	297	22828828282	1	$2y$10$ofBv37FzuzOGzhmHHoaHTeT7YIPz4SbvMaiVpadW/hK1.w0V3fhjq	2023-06-03 14:13:01	4	\N	\N	\N	\N	\N	inactive	\N	2023-06-03 14:13:01	2023-06-03 16:35:53	2023-06-03 16:35:53	\N	\N	673C+W8X - Dubai - United Arab Emirates	\N	0	25.20676045589012	55.260867351776106	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
11	Creative	creative@email.com	244	3939399393	1	$2y$10$McGYr8AWfTLMa49Epir/EOqRp7oPJ3EoC2nu1WqkgBQ0JsOTK.bvS	2023-06-03 14:55:11	4	\N	\N	\N	\N	\N	inactive	\N	2023-06-03 14:55:11	2023-06-03 16:36:05	2023-06-03 16:36:05	\N	\N	673C+W8X - Dubai - United Arab Emirates	\N	0	25.208158284957296	55.25477337289427	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
9	Test Category	testcategory@email.com	1268	838383838	1	$2y$10$fpDpGnwqFa/0mhYgVMGJaOEsfcR/DqgVGXeCOFxW6wSlgyYDhptJO	2023-05-29 20:00:47	4	\N	\N	\N	\N	\N	active	\N	2023-05-29 20:00:47	2023-06-03 16:36:31	2023-06-03 16:36:31	\N	\N	673C+W8X - Dubai - United Arab Emirates	\N	0	25.207503866232575	55.26251792907715	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
8	New Company	newcompany@email.com	61	227727272727	1	$2y$10$k7PM.tTlL2KbmTKwZULqEeYjUFuBDwCe8N0dlae38B3PkG4noVCoa	2023-05-29 19:50:57	4	\N	\N	\N	\N	\N	active	\N	2023-05-29 19:50:57	2023-06-03 16:36:41	2023-06-03 16:36:41	\N	\N	673C+W8X - Dubai - United Arab Emirates	\N	0	25.190291905188626	55.303663055925796	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
16	Samba	samba235@gmail.com	971	3235356	1	$2y$10$i8KzJy3zNtkHwAmYCFawzuZR2/kwdGulzunaaT1gQtUNVDhzLFFYm	2025-01-21 15:54:46	4	\N	\N	\N	\N	\N	active	\N	2025-01-21 15:54:46	2025-01-21 15:54:46	\N	\N	\N	3MQ4+W9G, Multan - Vehari Rd, Makhdum Rashid, Multan, Punjab, Pakistan	\N	0	30.089513	71.655558	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
17	Samba	sambal23@gmail.com	971	3233560	1	$2y$10$LAiWmqosi9zOOXXMiiWsB.oyrtVxBX4rfcenWemoPKgV4MuEL5odm	2025-01-21 15:58:13	4	\N	\N	\N	\N	\N	active	\N	2025-01-21 15:58:13	2025-01-21 15:58:13	\N	\N	\N	3MQ4+W9G, Multan - Vehari Rd, Makhdum Rashid, Multan, Punjab, Pakistan	\N	0	30.089513	71.655558	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
19	Shah Company	shah124@sabeeh.com	971	1211213336	1	$2y$10$1J2Xv522NaOG3VOLwMd6e.iDi/e3wS09KkKgRv11oBgCpW6xG0mJ.	2025-02-24 21:02:20	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:02:20	2025-02-24 21:02:20	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
21	Shah Company	shah12+1@sabeeh.com	971	1212133368	1	$2y$10$Se7FsFWKukTfhZGQX2k0z.KqqUvEL3fbPRqy6TdDy4BgzJ21L6XtG	2025-02-24 21:10:39	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:10:39	2025-02-24 21:10:39	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
22	Shah Company	shah1+1@sabeeh.com	971	121213368	1	$2y$10$vClkWoVND1wpGrrx6YWtcO2CbmLhZLh7bZo5ntPG/.QGZ55x5CGn2	2025-02-24 21:18:55	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:18:55	2025-02-24 21:18:55	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
1	Admin	admin@admin.com	971	112233445566778899	0	$2y$10$E78U6ugNHGbxxXKQHRB70OC5hdcWCSIcZaWl5Nw/sPrxkTYgf6OWu	\N	1	\N	\N	\N	\N	\N	active	\N	2023-05-25 20:10:21	2023-05-25 20:10:21	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
7	Deluxe Warehouses	deluxe@email.com	297	82828282828	1	$2y$10$CvjpE9.RuUGDOURAWYxWIe1VzgRRG4Q6o1zI95ks.eD0gg92Rwy/6	2023-05-28 13:24:30	4	\N	\N	\N	\N	\N	active	\N	2023-05-28 13:24:30	2024-12-30 10:13:38	\N	\N	\N	Churchill Executive Tower - الخليج التجاري - دبي - United Arab Emirates	\N	0	25.1831647	55.272887	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
12	Royal Cargo	royal@royal.com	971	5352525235	1	$2y$10$FP7zzBA3j9HB7D21iiXF8uznmXRxR8qAvryHtO1B9zQjUNHjDvFIq	2025-01-21 15:27:00	4	\N	\N	\N	\N	\N	active	\N	2025-01-21 15:27:00	2025-01-21 15:27:00	\N	\N	\N	35 16th St - Al Safa - Al Safa 1 - Dubai - United Arab Emirates	\N	0	25.179664702061043	55.24431456708986	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
13	Michel	micheal@micheal	971	3453535235	1	$2y$10$.XYcBQZLf.VoI1ZTdpNS0evIt5f0uXKCEf2QyP59/6HNA2HIm/XCi	2025-01-21 15:30:08	3	\N	\N	\N	\N	\N	active	\N	2025-01-21 15:30:08	2025-01-21 15:30:08	\N	\N	\N	57H3+C75 - Dubai - United Arab Emirates	\N	0	25.17857724868758	55.25294055128175	United Arab Emirate	Abudhabi	235252525	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
14	Samba	samba@gmail.com	971	3235354	1	$2y$10$jPAS/WDXs2MauJdf3/oSquZm44AQ7.4z9LTLb9fkwMfFGip/e3DVu	2025-01-21 15:50:10	4	\N	\N	\N	\N	\N	active	\N	2025-01-21 15:50:10	2025-01-21 15:50:10	\N	\N	\N	Mag warehouses, Plot 911 - القوز - منطقة القوز الصناعية 2 - دبي - United Arab Emirates	\N	0	25.1407059	55.25953740000001	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
23	Shah Company	shah1+11@sabeeh.com	971	1212131368	1	$2y$10$9Hy3uPsAVZ3X9hSbuL.vxu03l/ud/ACsxKdUVQzP5UC.7lyRJ0K8a	2025-02-24 21:20:22	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:20:22	2025-02-24 21:20:22	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
24	Shah Company	shah1+21@sabeeh.com	971	121231368	1	$2y$10$H0YFoItNMC..TAulr02x4.54fpyFElc0Vzgg..PLDrDTsKmYt8H8i	2025-02-24 21:24:53	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:24:53	2025-02-24 21:24:53	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
25	Shah Company	shah1+221@sabeeh.com	971	121231364	1	$2y$10$GI6luEXo/c53SOdh4AhDAePTr6t6FzM3xNrJ/RSH2G5r1trrkKWHm	2025-02-24 21:26:37	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:26:37	2025-02-24 21:26:37	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
18	Shah Company	shah@sabeeh.com	971	121121333	1	$2y$10$a4BwabvqOA3fImIPrcRaBOTR/zK84v1k2wE/hcsCL82Lz739kqe4u	2025-02-24 20:59:08	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 20:59:08	2025-03-27 02:05:31	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4.00	\N	1	1	1	\N	\N
26	Shah jhan Company	shaqh1+221@sabeeh.com	971	12123136	1	$2y$10$SR3OgOBosmCU7fh2FUDNCu8itF89YItwThi9w7U5UEnuwnKPE4OBC	2025-02-24 21:29:42	4	\N	\N	\N	\N	\N	active	\N	2025-02-24 21:29:42	2025-03-27 15:40:54	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	5.00	\N	1	1	1	\N	\N
20	Shah Company	shah124+1@sabeeh.com	971	12112133368	1	$2y$10$l2pf.YGOJcY5vlEOBzt8n.StTwRv9cn9vCY5KS2wuUnoPPW6yAkz6	2025-02-24 21:08:03	4	\N	\N	\N	\N	\N	inactive	\N	2025-02-24 21:08:03	2025-03-27 08:12:11	\N	\N	\N	5FPQ+CMP, Manzoorabad, Multan, Pakistan	\N	0	30.1861	71.4892	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	4.00	\N	1	1	1	\N	\N
5	Royal Home Relocators	royalhome@email.com	61	383837377	1	$2y$10$y9XW9EUs77DHm1Vp168pL.tkH8GzlsBoWUwbZ/KvrBq5juPFBDY2K	2023-05-27 15:27:55	4	\N	\N	\N	\N	\N	active	\N	2023-05-27 15:27:55	2025-04-12 13:12:36	\N	\N	\N	34HP+PGV - Jumeirah Beach Residence - Dubai - United Arab Emirates	\N	0	25.079339	55.136229	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	2	\N	1	1	1	\N	\N
40	Hamid Raza	razahamid105@gmail.com	971	3441562101	1	$2y$10$cfGDoc668zjgjtY5fcyiOOJXhGu82MemXnScR8wYppm.ypOVcxpWq	2025-03-26 10:15:01	2		ejDkSWx7TFymUVQ4hTwZ_f:APA91bEI7vZVp-TI-BcKu7V6Ci3cANn0U70d--xOUFlyd2DTOIJeiM-01RYAQHap1YTS5KMQPLB97ea3QR-6vvRAZ9cn0XGuzudS9eYcM4IiAcZ2Vt-C4g0	android	e9c3124931ae26579e2614fec1d2f94fe390e13599dffd9f56cb121e0d99f575	-OMG4kIr6ES7Ii8FA45Z	inactive	\N	2025-03-26 10:15:01	2025-03-26 10:15:01	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Hamid	Raza	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
34	Hamid Raza	razahamid102@gmail.com	971	3441562102	1	$2y$10$qkIzuSuS2vrgLTVkp9v8Hemu.IIiGKzQO.XRKlbrmlb.zV.FEJNU2	2025-03-22 03:04:17	2		fHredaUYT5qeS39m52MxPt:APA91bFu8_pfAoUu5uhlnN-dmqhYk2ClEV3DlfBY_Fk7Fte2XnxJNI6z9wFkNZH4EexcBAeWfFBsDzGFnzzV4ZnV-1oFzudlPLGBT4bJ_qswjYe83dRHKNk	android	0f81d9a36e200c6fbd5ded7506dff11b4029ec4144b2cd62ca99ffe58cd06e77	-OLuwnsciFA7Ag988T5e	inactive	\N	2025-03-22 03:04:17	2025-03-25 01:16:13	\N	\N	\N	\N	67e1cb9d7e05b_1742850973.	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Hamid	Raza	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
37	Hamid hello	razahamid101@gmail.com	971	3441562105	1	$2y$10$d29PE3KZh37PaVUo3a1ICuFJNJ8QVJaxd2JH40FjcgOdrjQSMNwKe	2025-03-26 14:26:53	3	1111	ejDkSWx7TFymUVQ4hTwZ_f:APA91bEI7vZVp-TI-BcKu7V6Ci3cANn0U70d--xOUFlyd2DTOIJeiM-01RYAQHap1YTS5KMQPLB97ea3QR-6vvRAZ9cn0XGuzudS9eYcM4IiAcZ2Vt-C4g0	android	24540be8f93b263752bc7e42b41a8fec672a42e9f85954308a013fb425772e7b	-OM65mMzitVTL8zU0g4H	inactive	\N	2025-03-24 11:43:19	2025-03-27 12:54:25	\N	\N	\N	\N	67e1631c58899_1742824220.	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Hamid	hello	1		2025-03-26 20:31:49	0	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
31	Hamid 	razahamid36@gmail.com	971	344464664	1	$2y$10$TP/JqY65.tpWp5Y62B6a3.iOESSeLEQ4xufNvGgI.bdxFBUK48sQq	2025-03-13 00:49:41	3		ejDkSWx7TFymUVQ4hTwZ_f:APA91bEI7vZVp-TI-BcKu7V6Ci3cANn0U70d--xOUFlyd2DTOIJeiM-01RYAQHap1YTS5KMQPLB97ea3QR-6vvRAZ9cn0XGuzudS9eYcM4IiAcZ2Vt-C4g0	android	db529579fe5376ac861f12e1a39aa45275f8c0c980f3df7fe7e9d66a2dedea2b	-OLB6gSYCNPoccXXRrYG	inactive	\N	2025-03-13 00:49:41	2025-03-13 00:49:42	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Hamid	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
27	sda	as@a.com	971	242421414	1	$2y$10$gZWQt6iVxtHUjFl.2jrKOel6aTHmbUUuBs.9NKET0EyzXymYpN1Ei	2025-03-04 11:45:48	4	\N	\N	\N	\N	\N	active	\N	2025-03-04 11:45:48	2025-03-13 11:12:02	\N	\N	\N	6727+WWV - Al Wasl - Dubai - United Arab Emirates	\N	0	25.202489212059902	55.26457952905272	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
41	ABC Cargo	anilvendor@gmail.com	971	45747474747	1	$2y$10$4xe8Sz7jXCRtGrwzu6Mnuunmd/iGx/V6V1pyrRLv.tSdMk4thYB9C	2025-03-26 12:19:56	4	\N	\N	\N	\N	\N	active	\N	2025-03-26 12:19:56	2025-03-27 15:49:43	\N	\N	\N	8 16b St - Za'abeel - Za'abeel 2 - Dubai - United Arab Emirates	\N	0	25.204275386801978	55.285522217041	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
66	rusvin 123 k	sa1@1.com	971	16666	1	$2y$10$.tfUnQJdsy4GxO/4qXF4H.3WGhsUdQ8bzKLRGaTuQJOWNUIfcb0BO	2025-03-28 10:34:47	2		123123	android	01486851d712a58159fdd91f7a273f9239f07a0ca2465c9ced16054f7dc48507	-OMQSSQmE1k7cGNUWeYA	active	\N	2025-03-28 10:34:47	2025-03-28 10:34:48	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1		uploads/trade_licenses/Bk9vNG3t3fWNWOcD8xfdbjkO4uEr5pUVsvZQCDmH.jpg	\N	rusvin 123	k	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
29	rusvin 123 k	1@1.com	971	1	1	$2y$10$vz83z4mjEJgR72IINFkt0ukW1ewTBqZjs8V/8s6OC7kbRu6zPsV/e	2025-03-12 09:12:10	2	1111	123123	android	e5e3cde75d4d037e7e6fc124cfa80981892731948bcc6eaa4f190bbd6980279b	-OL5Wv3QSGVJ6Y2VVCFe	inactive	\N	2025-03-11 22:43:05	2025-03-27 20:20:30	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	rusvin 123	k	1	\N	\N	\N	\N	\N	\N	2.5	5.00	\N	1	1	1	\N	\N
33	Hamid Raza	razahamid101@gmail.com	971	3441562101	1	$2y$10$SePBrBPDw1sT9MUAs0HHLellMRkE48GX5lyoDrHpImLOqJLgvga1a	2025-03-25 00:34:31	2	\N	ejDkSWx7TFymUVQ4hTwZ_f:APA91bEI7vZVp-TI-BcKu7V6Ci3cANn0U70d--xOUFlyd2DTOIJeiM-01RYAQHap1YTS5KMQPLB97ea3QR-6vvRAZ9cn0XGuzudS9eYcM4IiAcZ2Vt-C4g0	android	a8158560cd7be5adbfb9fa170d3d3bd7d8db192a1a139fa5734ae886f9349c87	-OLsEdTJmAT__3khiXik	inactive	\N	2025-03-21 14:27:44	2025-03-25 00:34:31	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Hamid	Raza	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
67	rusvin 123 k	sa1+1@1.com	971	166667	1	$2y$10$/fFdEFKrUi0LmwRfGJ40BezkV1Z/PldH/Eu0PbOOy2C/SaWgRwCoe	2025-03-28 10:45:12	2		123123	android	dc98bb385e401a836bc986e9ccb3681ec4f41639ddff49ef922d43cd4c9fe7c0	-OMQUpwQsz-r5UklnxJS	active	\N	2025-03-28 10:45:12	2025-03-28 10:45:12	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1		uploads/trade_licenses/5fH86C1BADDfcoRUPsKvFEChL3EGHKtUV65Vdjym.jpg	\N	rusvin 123	k	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
30	ABCD sam	razahamid103@gmail.com	971	3122323232	0	$2y$10$L9KyX2pHxFj51ATfQgbrB.7H40ABgqHCFd3XJ0iSGW3odHnNCU/f6	2025-03-27 09:56:44	2	\N	ejDkSWx7TFymUVQ4hTwZ_f:APA91bEI7vZVp-TI-BcKu7V6Ci3cANn0U70d--xOUFlyd2DTOIJeiM-01RYAQHap1YTS5KMQPLB97ea3QR-6vvRAZ9cn0XGuzudS9eYcM4IiAcZ2Vt-C4g0	android	dcc1f6fa40cd2de16df99b8f1fcd1c6efe85f7ac52b2b71a1ddcd14e47134926	-OL7m7P661afocMwT4PQ	inactive	\N	2025-03-12 09:16:37	2025-03-27 09:56:44	\N	\N	\N	\N	67e393a0695dc_1742967712.	0	\N	\N	\N	\N	\N	\N	\N	0	1	1111		\N	ABCD	sam	1		2025-03-25 20:49:34	0	971	3122323232	razahamid101@gmail.com	\N	\N	\N	1	1	1	\N	\N
43	dsdsd	teashowaap@gmail.com	91	55555555e5	1	$2y$10$ua8bKE.vvHZ8x0PdCILW/e7BW3UPpHnkmqFiosYsY3rlMMHsOgkbm	2025-03-26 12:53:47	4	\N	\N	\N	\N	\N	inactive	\N	2025-03-26 12:53:47	2025-03-26 12:53:47	\N	\N	\N	6739+JGH - Al Wasl - Dubai - United Arab Emirates	\N	0	25.204391875548783	55.268913978820784	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
42	dsdsd	teashoaap@gmail.com	91	555555555	1	$2y$10$CqRwNux8VXY3kBdoJuIl6eMVu7fHnsheCRqeotxjO79RZPc3klfEK	2025-03-26 12:48:23	4	\N	\N	\N	\N	\N	inactive	\N	2025-03-26 12:48:23	2025-03-26 12:48:23	\N	\N	\N	6739+JGH - Al Wasl - Dubai - United Arab Emirates	\N	0	25.204391875548783	55.268913978820784	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
44	dsdsd	teashoaap2222@gmail.com	91	555355555	1	$2y$10$7mKKhLlSdtcoz8NyzbmHdeeET2a42jyQs/FUACBBfkxuMSWKbZL62	2025-03-26 12:55:06	4	\N	\N	\N	\N	\N	inactive	\N	2025-03-26 12:55:06	2025-03-26 12:55:06	\N	\N	\N	6739+JGH - Al Wasl - Dubai - United Arab Emirates	\N	0	25.204819	55.270931	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
36	Asad Nazir	asad@gmail.com	971	3441560319	1	$2y$10$ETLSfGCMYwem7rnecNLN5ezMPSOf26LuZA0dh5bBu4QCh25coTdTq	2025-03-27 19:49:01	2	\N	d9mCOohQTOemKPmlKFuhfb:APA91bF1Q1qXnQPKl4TXJfWibCBbMrOqKe7YRpQ-fY0DY0HsjQMcempTnIEc9UimqBSUd2Ei8F6eISqoOSyNjKBxrDTn2KLae4bKCkWUYcVP-yQsbTkTxd0	android	afbd4a1c9764ddc738404f1e2931e79b51c20910ab835e61c399591d8f3bff96	-OM60ArQGfmJQxXsuSO8	inactive	\N	2025-03-24 11:18:51	2025-03-27 19:49:01	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Asad	Nazir	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
68	rusvin 123 k	sa1+2@1.com	971	166663	1	$2y$10$AMQ88v9ez.emtIz8KaDhpOt351lk/Rdfo5V7lK2Q8UaW2xMjV/niS	2025-03-28 10:57:40	2		123123	android	632e022d2aeb85fe2e07215ed5868b8992729a1eed47e34d95d504376e8f92d2	-OMQXgaSO_ZNQ2OczUR-	active	\N	2025-03-28 10:57:40	2025-03-28 10:57:40	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1		uploads/trade_licenses/ItGu5Qv7mLWUCfTFcEHUVM1OQIxAGpJjaQv96YWk.jpg	\N	rusvin 123	k	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
69	rusvin 123 k	sa1+3@1.com	971	166663	1	$2y$10$oVMtIC1JC.GDtFtkMRFJDeN2lla0v60VT9Y49LxrUzspAcixLdPkS	2025-03-28 10:58:51	2		123123	android	7d7b5af69b4b1d529e60ea5feee8019e6b3cc6bad3ea66a64d36125b8f813823	-OMQXxuYKzo2y-HeycQv	active	\N	2025-03-28 10:58:51	2025-03-28 10:58:55	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1		uploads/trade_licenses/b6r9JzMLkNnP6QUDqYfZlxaf1Cyxpo7l2ippgMsw.jpg	\N	rusvin 123	k	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
91	Emirate Transport	emirate@emirate.com	971	2352352525	1	$2y$10$bzdFHDRnoHhxS8kZ98P.IOE1JEtA7TkZy6SaORAyNfpx3b9GoMbUy	2025-04-09 07:25:02	4	\N	\N	\N	\N	\N	active	\N	2025-04-09 07:25:02	2025-04-09 07:37:41	\N	\N	\N	56MX+54V - Al Hadiqa Rd - Al Safa - Dubai - United Arab Emirates	\N	0	25.18379925227052	55.248585919739675	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	tok_1RBpSKRwhoKMBfqcGrxZRR1W	1	1	1	\N	\N
45	Lulu supermarket 	anilbusiness@gmail.com	971	9794664949	1	$2y$10$FBosM/seB5xL11qWCUau9OCMPCoH21WxH14cUl.zJdjCVaSTcXA2e	2025-03-26 13:00:45	3		dn7Df-I7T7qfUShEf9vrpd:APA91bFggH7obm8lmtGmpUu1iarkodL6GfDW_YZxHYv0jmnCZmBA5EgkQaIYvmC0_1OYNZPbbLiX4pkJyc3WntGsF-topk_zwgd31DpLshzrk5TVHeFemz8	android	57a066b7860f4f72e0f679f84fb6ae2010cd04d5ffe5269d8199825fc30283a4	-OMGfg8nGmD9NbbKs3dV	inactive	\N	2025-03-26 13:00:45	2025-03-26 13:00:46	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Lulu supermarket	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
50	Aniluser navis	aniluser2@gmail.com	971	566854556	1	$2y$10$4d2oYvdViVHYKtSfgPLyvuqT.j/rHeKe5txDGlhcMPSivOTDPFA7.	2025-03-27 01:21:15	2		cuxqOhzFT0i2jIce5AEFTv:APA91bGxmLzNrePuvnz6MSUv9qN2RUBNJ4FuhGh00h8nAEGIWPRD-i6QQk_98oX3_YOa0ilQnLEPb3DFRqDZWwK2FM2AsR46oL7oIzHpFsiyT2XasHLO05I	android	701e11b1d0e10fe441ffd5881121f8bcef654a40d9b2fedd081b7e9ab618ecfb	-OMJKAMXj3rYjQCmaJ_c	active	\N	2025-03-27 01:21:15	2025-03-27 01:21:16	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Aniluser	navis	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
46	anil navis	aniluser1@gmail.com	971	455558555	1	$2y$10$c7LxJjOhw3RG0Gx10EaSaO/CDkxsjesx0KZhH7RxGL/LTRoS398LW	2025-03-26 13:46:53	2		dn7Df-I7T7qfUShEf9vrpd:APA91bFggH7obm8lmtGmpUu1iarkodL6GfDW_YZxHYv0jmnCZmBA5EgkQaIYvmC0_1OYNZPbbLiX4pkJyc3WntGsF-topk_zwgd31DpLshzrk5TVHeFemz8	android	e1a38a4a3d8894f4067f144f04cecae716564589f73368a50cbf42b4e148c610	-OMGqEmtYWy0L-z4SGbF	inactive	\N	2025-03-26 13:46:53	2025-03-26 13:46:53	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	anil	navis	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
47	anol navis	aniluser@gmail.com	971	565656565	1	$2y$10$UIR.XdKYQhWgGTUm5ai4OOAd5QIprqHAMRtmdK/dECs5qZ8MFsk3u	2025-03-26 14:51:39	2	\N	dn7Df-I7T7qfUShEf9vrpd:APA91bFggH7obm8lmtGmpUu1iarkodL6GfDW_YZxHYv0jmnCZmBA5EgkQaIYvmC0_1OYNZPbbLiX4pkJyc3WntGsF-topk_zwgd31DpLshzrk5TVHeFemz8	android	1fa71ac075f38f87a364fd8d20aa47acb10b71024a45d52f44a4112a7e23e181	-OMGrAYxmglYnrsBfVFX	active	\N	2025-03-26 13:50:57	2025-03-26 14:51:39	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	anol	navis	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
55	anil individual	anilind@anilind.com	971	555555585	1	$2y$10$dKEmMToWBRC7WeKL92cvN.1m4ye3gq7kKXhGmfiz0kEiRsAertcnq	2025-03-27 14:02:40	2		dbAmphmfQ5qdWh0pQkQX0i:APA91bFd07abtSg6Fo2XybQenXMqoutF6VoW8rJlSjrIKNV1yT9Rq0MMXzGfFXlq8mG4Oh_hFzNl14AgjRb-QW716s5uuhgkvTROkx1xIYUyJYJP8izsUYI	android	af9ad056454f98f7e1908dc06d182f10d6a58a74f0f35ac2e5a8fef771e6af15	-OMM2Rmk-3poItXw1Vmi	active	\N	2025-03-27 14:02:40	2025-03-27 14:02:40	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	anil	individual	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
64	Shamas Kumar	shamas+3@gmail.com	971	18571985195	1	$2y$10$myTjWtxYo71NWgFArbzGDuJQsiNQ/DJPYoZZI0C7bFwxv3c4toh/K	2025-03-28 10:14:41	4	\N	\N	\N	\N	\N	inactive	\N	2025-03-28 10:14:41	2025-03-28 10:14:41	\N	\N	\N	Dubai International Airport (DXB) - Dubai - United Arab Emirates	\N	0	25.2566932	55.36431779999999	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
59	Saman SHah	SamanSHah@gmail.com	971	1345678888999	1	$2y$10$3VHUr/izEC0vGCiruswqQuqR1GX3xbwE93n2F7R8qZ3dlMC8RN1Di	2025-03-27 23:15:56	4	\N	\N	\N	\N	\N	inactive	\N	2025-03-27 23:15:56	2025-03-27 23:15:56	\N	\N	\N	M38F+JQ2, Tipu Sultan Rd, I-8 Markaz I 8 Markaz I-8, Islamabad, Pakistan	\N	0	25.2205845	55.2543386	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
61	Shamas Kumar	shamas@gmail.com	971	198519851985	1	$2y$10$nAKBBMvgszTQfvvqfh/7b.l/5q6VJpDOgcthCaQhaBmWvCnepB/uq	2025-03-28 10:08:16	4	\N	\N	\N	\N	\N	inactive	\N	2025-03-28 10:08:16	2025-03-28 10:08:16	\N	\N	\N	Dubai International Airport (DXB) - Dubai - United Arab Emirates	\N	0	25.2566932	55.36431779999999	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
48	Hamid Raza Goraya	razahamid34@gmail.com	971	3441562554	1	$2y$10$QUxAvyW9yteQKIA/de020.YIwck/rsGntBVzGC5fNcUnRcSFam1Jq	2025-03-26 16:14:19	2		ejDkSWx7TFymUVQ4hTwZ_f:APA91bEI7vZVp-TI-BcKu7V6Ci3cANn0U70d--xOUFlyd2DTOIJeiM-01RYAQHap1YTS5KMQPLB97ea3QR-6vvRAZ9cn0XGuzudS9eYcM4IiAcZ2Vt-C4g0	android	ef441e15be966e4a005902eec675818a9bd5bf17e43cfdae2cdf16f6c2d1db2a	-OMHMzU5Zp4K4hAqN3Iv	active	\N	2025-03-26 16:14:19	2025-04-11 09:53:29	\N	\N	\N	\N	67f8ae5960fc7_1744350809.	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Hamid	Raza Goraya	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
2	Abdul Ghani	ghaniabro11@gmail.com	374	03023220821	1	$2y$10$egPFwL419nnMOdBG6h4RfudH/.PVE0YE8hgP0YhoKgQMS/NjiOJsy	2023-05-25 20:44:27	3	\N	\N	\N	\N	\N	inactive	\N	2023-05-25 20:44:27	2025-03-27 19:49:11	\N	\N	\N	Churchill Executive Tower - الخليج التجاري - دبي - United Arab Emirates	\N	0	25.1831647	55.272887	United Arab Emirate	Dubai	75500	5th Floor 342 Apartment	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	8.00	\N	1	1	1	\N	\N
65	Shamas Mubarak	mubarak@gmail.com	971	233243243	1	$2y$10$b29NW16UD5TY16y9oih3mOf0Oiil5BFlayPnpQoajKXPJ/huqPoNm	2025-03-28 10:21:06	4	\N	\N	\N	\N	\N	active	\N	2025-03-28 10:21:06	2025-03-28 14:24:32	\N	\N	\N	Dubai International Airport (DXB) - Dubai - United Arab Emirates	\N	0	25.2566932	55.36431779999999	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
58	Almas	nasarmobiria@gmail.com	971	64334637377	1	$2y$10$yymCHhQ8a4y7Eexqls4WBegKfyRGPSBrHX807vEE8TNxzQ5O5eNNu	2025-03-27 19:26:05	4	\N	\N	\N	\N	\N	active	\N	2025-03-27 19:26:05	2025-03-30 14:52:45	\N	\N	\N	Office #104 Al Fas Building - النهدة - النهدة ٢ - دبي - United Arab Emirates	\N	0	25.28707870082781	55.370953309869364	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4.5	2	\N	1	1	1	\N	\N
49	Asad Nazir	asadnazir289@gmail.com	971	3441560319	1	$2y$10$fZ8h0ML95L2jZSP1ph5IJ.Mz6GA.DMHgJxLTZo6BHQDtvPslLd5R6	2025-03-26 22:38:03	2		eLK7Z7rbTJyisYJK0S2qDI:APA91bE3pwHhF7Ywwdx9cWFtMYAphdtFieXBShVnA2eEfSK3WmlLXsvbH2rtjR55WP5WIqECq60ohP0n09HKh0LSxewkUHA7XSnuiPizAtZPI4lfrbqQhxs	android	0949a951e4ff13e93c44e317393e812a5ae75ab84bf1d04d1e1ecedf02c82129	-OMIjokl2jFeLIVfuykT	active	\N	2025-03-26 22:38:03	2025-03-27 20:29:47	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Asad	Nazir	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
60	Rakesh kumar	binshambrs@gmail.com	971	564005096	1	$2y$10$YAXN0OvJiCX9wHExVTjtsO1gAdp/VmpMwue3ujfE3tTzUO.nLCulq	2025-03-28 08:27:45	2		fjgFGev_S5eBuhTj0nN3NP:APA91bG89vgkt9Tdqxuab02MKeHB8hrIOdjsjR02LNnkLilD3DEixP_AME0Z5wYRp5OJPk8e0auoOoj7CeAOkUadOMgiSMHuBAwBT1uA0c0ePWehEquxedA	android	78dd0a4069937dea0279f045248fac384dc45482384ccf635e00eb0c22043bb6	-OMQ-NUVZThCtePnK_Eh	active	\N	2025-03-28 08:27:45	2025-03-28 08:27:45	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Rakesh	kumar	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
62	Shamas Kumar	shamas+1@gmail.com	971	19851985195	1	$2y$10$k2q.f0zjjYmBoO8cd4Af1ux7.SuhtK5ani.XI.a/6hKCDlKvddY0m	2025-03-28 10:10:22	4	\N	\N	\N	\N	\N	inactive	\N	2025-03-28 10:10:22	2025-03-28 10:10:22	\N	\N	\N	Dubai International Airport (DXB) - Dubai - United Arab Emirates	\N	0	25.2566932	55.36431779999999	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
63	Shamas Kumar	shamas+2@gmail.com	971	198571985195	1	$2y$10$XCQROhv6nA9k2IArmzw86uat5IOnCUoYsM0LkSsm1k1D0dfnIGAuy	2025-03-28 10:11:37	4	\N	\N	\N	\N	\N	inactive	\N	2025-03-28 10:11:37	2025-03-28 10:11:37	\N	\N	\N	Dubai International Airport (DXB) - Dubai - United Arab Emirates	\N	0	25.2566932	55.36431779999999	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
53	Hamid Iqbal	hamidiqbalgoraya@gmail.com	971	3441562554	1	password	2025-03-27 13:41:37	2		ejDkSWx7TFymUVQ4hTwZ_f:APA91bEI7vZVp-TI-BcKu7V6Ci3cANn0U70d--xOUFlyd2DTOIJeiM-01RYAQHap1YTS5KMQPLB97ea3QR-6vvRAZ9cn0XGuzudS9eYcM4IiAcZ2Vt-C4g0	android	5ddaac6a707bcc4b7b016ea9f4f3861fbbd87b8541f7ff63777fdc3af4bbac0b	-OMLycRmcLLK38N3dQfU	active	\N	2025-03-27 13:41:37	2025-03-29 11:05:49	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	1			\N	Hamid	Iqbal	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
56	DXB Company	DXBcompany@gmail.com	971	2342343253	1	$2y$10$KZ5ZYstALgSZUCXuAK5i3uQa3AENrO2bcR/cOxsCb6teENtiHw8CW	2025-03-27 15:57:28	4	\N	\N	\N	\N	\N	active	\N	2025-03-27 15:57:28	2025-05-17 08:36:51	\N	\N	\N	165 Financial Center Rd - Downtown Dubai - Dubai - United Arab Emirates	\N	0	25.1972295	55.27974699999999	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3.5	2	\N	1	1	1	\N	\N
70	Anil Ab	abinmobiria@gmail.com	971	566868966	1	$2y$10$Q5xLtgBcc46CDnc.j/mu8ehkeLdIdEtuXYdciuwupQ0xDNE9Dl7ZS	2025-03-28 11:15:47	2		dlqwVBR6TTapFxpv0SQ0sz:APA91bGR6A_4IUpLfpfxVDZgu38aBGp360o6W8wCfjY6NjqIA6xwVHJ3_RAZKr9z8zWznpmtfmNS9oqgKLFjVLkpggm9yC6d72D9hhgrexelqm9UcXwdLTk	android	3c9789dea8dbe9f351ed0d199d3f9cf1bd4f1ec913aed67c73cb9865daa4921c	-OMQaq6hIUVkEZh2q9MK	active	\N	2025-03-28 11:15:47	2025-03-28 11:15:51	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Anil	Ab	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
73	Anil Navis	abc@abc.com	971	5466464949	1	$2y$10$yMYDyfsY/B6xQ9PJkeyGa.kc53CGzBmI7ob/o4g185swC0lJVfDz.	2025-05-17 19:40:07	2	\N	e95BLf2Dc0U9i8HncgKDwz:APA91bEP_vCpbNxs7Y9_zwKAFufD5-plhDau1BwaqzC_S06mGN9Slq5OP45CVoC8ZwQOtbeN02dH3TX-yDzgVd_oiPGhNwzab5aaJCPBLTnKJkwHNHHmcU8	android	eeb7848e0477d63620860f596f974045c9d490d5f3d9fdac6e4f0b86c0ef14b0	-OMQzQESk57y4jq4XMHT	active	\N	2025-03-28 13:03:11	2025-05-17 19:40:07	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Anil	Navis	1		2025-05-17 03:30:53	0	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
74	Cargo Service	cargo@cargo.com	971	6363634634636	1	$2y$10$ZhU1YHVmwZbI3nMe9Gs78.zd5JzAsh06xepWTEVcRWgeAQvNQFoA2	2025-03-28 13:09:54	4	\N	\N	\N	\N	\N	active	\N	2025-03-28 13:09:54	2025-03-28 13:33:04	\N	\N	\N	79PC+PJR - Al Nahda St - Al Nahda - Al Nahda 2 - Dubai - United Arab Emirates	\N	0	25.286837350781997	55.371223635173955	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
87	Navis Trasnport	navtra@navtra.com	971	535235235	1	$2y$10$KNKhyTqUuYZIUQvRIJjbxu0fMh4rczQRgobaJZfTVwDoti3RAJ2VO	2025-04-06 13:36:37	4	\N	\N	\N	\N	\N	active	\N	2025-04-06 13:36:37	2025-05-20 18:26:11	\N	\N	\N	79PC+Q97 - Al Nahda - Al Nahda 2 - Dubai - United Arab Emirates	\N	0	25.286928	55.371017	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	1	tok_1RB9NIRwhoKMBfqc3yHSn4hJ	1	1	1	\N	\N
71	rusvin 123 k	sa1+4@1.com	971	166665	1	$2y$10$.Ky3V/sxq7BxRpK3Hgc.POxR5bPX/qu47hUpaL6xqYNClrYUDDtIW	2025-03-28 12:52:59	2		123123	android	07f247730c17f511dc5ed430c6343b6eee6c05c36af476b46707d7390f22edc3	-OMQtz51tXJ1PrdtJ5yy	active	\N	2025-03-28 12:39:25	2025-03-28 12:53:03	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1		uploads/trade_licenses/EEB8i9ZRSyaFOCFCiIpiUBWfgqVXchwsh5Kp3LSr.jpg	\N	rusvin 123	k	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
85	InComplete User	InCompleteUser@gmail.com	971	1212313364	1	$2y$10$7mE5SFLf2P3KuiWMpZ8EK.mH7u9UHgJdLfXMTmoRmpwIK58OLzB42	2025-04-05 22:32:45	4	\N	\N	\N	\N	\N	inactive	\N	2025-04-05 22:32:45	2025-04-05 22:32:45	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N
80	Davis Movers	davis@davis.com	971	1234512345	1	$2y$10$tc2InGPVjfV.sS2t8SoA.ehIiTv3cT3lpNJjgho7WxkE4Zec9RKMm	2025-04-03 09:55:54	4	\N	\N	\N	\N	\N	inactive	\N	2025-04-03 09:55:54	2025-04-03 11:44:44	\N	\N	\N	56VJ+WX7 - Jumeirah - Dubai - United Arab Emirates	\N	0	25.194320852633854	55.23324966430664	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	1	cus_S3oN7yGDsvqmd4	1	1	1	\N	\N
72	rusvin 123 k	sa1+5@1.com	971	166665	1	$2y$10$huB8Vl/Jcegp5.Zdpf1Uu.tVyriT7DYUgr/rSC2KJ5TXnXgDzgCH.	2025-03-28 12:58:03	2		123123	android	103ab24b95ed8a4f560a299cff2a81e7c1ab803293e6007a60ddc5e01f7f1052	-OMQxub4ndTp_yK5kxWS	active	\N	2025-03-28 12:56:35	2025-03-28 12:58:07	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1		uploads/trade_licenses/oaC2CFS0GLIUZoWw3VlFPq0JnyhlES65t9xiI5pj.jpg	\N	rusvin 123	k	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
77	Usama Shakeel	ushakeel@ymail.com	971	124124124	1	$2y$10$smZqNapd0XkjN9oFC/Y5SOsFn.//QhoGcn0jGdt44GbghaXglKyvW	2025-05-14 17:19:39	2	\N	dL4O8rizTs6q5DkB7Ah0Lo:APA91bHst2oZsrXRsnKZzROxVkULeyVEar5hcIDwQcZxpCZHXB8miXrALolIlj8v74wc9rSrr6YBsKrbTNzdobpIyaxQyp_OLslAhlvjsW0L-Gq9S-_mrVI	android	ccf53a84b0db55bd5fc1e61faaa3060a2f2cc9d3453894484b66b6c0ddf649f0	-OMXGcVizSzPF62jStYR	active	\N	2025-03-29 18:20:27	2025-05-14 17:19:39	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Usama	Shakeel	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
76	DXB APPS	habeebuddindxba@gmail.com	971	555555552	1	$2y$10$7YZNPBddKYsaV2ThaE9Zk.tJgsoL/15MjmqEXyGXCv0K9eSQE264y	2025-03-29 10:43:49	4	\N	\N	\N	\N	\N	inactive	\N	2025-03-29 10:43:49	2025-03-29 10:43:49	\N	\N	\N	57JC+JJC - Business Bay - Dubai - United Arab Emirates	\N	0	25.1815668	55.27151019999999	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
79	Mack John	mack+1@gmail.com	971	122121333	1	$2y$10$iqdWER2K6C37ZyAhyX/V4eqB6BnpO3/Tfi.xNFVU4lag9bL.DkR52	2025-04-02 20:36:42	4	\N	\N	\N	\N	\N	inactive	\N	2025-04-02 20:36:42	2025-04-03 14:02:43	\N	\N	\N	3MQ4+W9G, Multan - Vehari Rd, Makhdum Rashid, Pakistan	\N	0	30.0892835	71.6552355	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	cus_S3bU6PGAOrdwUI	1	1	1	\N	\N
82	Nacro Cargo	navis1@navis1.com	971	3453534535	1	$2y$10$uaDjOhg001pxfya4j.pLsOmkcAWQfkIW5xpK9Tv/9OSz2NV8Y1u.i	2025-04-03 21:17:44	4	\N	\N	\N	\N	\N	active	\N	2025-04-03 21:17:44	2025-05-19 23:44:07	\N	\N	\N	34 Al Mamsha St - Jumeirah Beach Residence - Dubai - United Arab Emirates	\N	0	25.0779132	55.1317205	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4.25	4	tok_1RAb3dRwhoKMBfqcNxV0Onwe	1	1	1	\N	\N
78	Mack John	mack@gmail.com	971	12121333	1	$2y$10$45krX3E/T..K2zVmG8aPfOyRcP7z1TsPyPZvjmVOTsYaa/N3d3AZG	2025-04-02 19:17:58	4	\N	\N	\N	\N	\N	inactive	\N	2025-04-02 19:17:58	2025-04-02 19:17:58	\N	\N	\N	Dubai International Airport (DXB) - Dubai - United Arab Emirates	\N	0	25.2566932	55.36431779999999	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
81	Navis Movers	navis@navis.com	971	35353253255	1	$2y$10$9wowd89iqoxfXFuehS9DZuRMZXJk5Z8bp5pLa3XwjH.hyLSfOB9ee	2025-04-03 14:52:41	4	\N	\N	\N	\N	\N	active	\N	2025-04-03 14:52:41	2025-04-04 11:59:43	\N	\N	\N	109 Umm Al Sheif Rd - Al Safa - Al Safa 1 - Dubai - United Arab Emirates	\N	0	25.16930921962888	55.22916687817382	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	2	cus_S3tAogU4IFeBQE	1	1	1	\N	\N
54	anil navis	anilnavis@gmail.com	971	5464664946	1	password	2025-03-27 13:56:01	2		fOo_9b3Sokx0lGcn81vgSU:APA91bGVb96AFgO9AhOr2fQuGng-ZY8F9Q947LUp410uc184NwuHPxHSQhW8xzLZo-exMf6TV-sozMc8oNY6FwK8IZBuSHu5n7dI6_eBbiKsPa7W8LUm_Yc	ios	1b3f300c1ce354ce871ba6b78dec64f491d5b7ff31801ba6ebb6da562f0d011d	-OMM0vPF0YViN29WC27A	active	\N	2025-03-27 13:56:01	2025-05-18 19:14:24	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	1			\N	anil	navis	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
86	Complete User	InCompleteUser+1@gmail.com	971	1212353364	1	$2y$10$dZeQujhw8dkfejQURq9mfuc19uwzf00HKQe/6piKwJ4Na7bz11Zuu	2025-04-05 22:34:27	4	\N	\N	\N	\N	\N	active	\N	2025-04-05 22:34:27	2025-04-05 23:58:57	\N	\N	\N	3MQ4+W9G, Multan - Vehari Rd, Makhdum Rashid, Pakistan	\N	0	30.0892835	71.6552355	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	tok_1RAccoRwhoKMBfqceT68fJ4U	1	1	1	\N	\N
84	Lutfie Alhashimi	dhdhdh@hdjdjdj.com	971	504113314	1	$2y$10$WQjdENySPrje5GnrT2AQKueTDzqmmvyQ8C/8ReQ/yte4Z5zqdWheG	2025-04-03 23:13:31	2		dg_4LY5OQ1i7vgoOhwM--u:APA91bHXReRtFgFGYBHNqs9CFD4gebh84hYLW9kV1jB2rZaDQzSYn6TPX_JfLGsldKWBUIUhbcEs3k3tUMktWDl-Hf7ZCkeTokPintFcCE-vi-oWsSEHvKE	android	962ddb10ab614949b8d9ee25d204c2d1cc9e8bc6ec6e2584751625e65b7f6559	-OMx3e3jNmUBQM1fUDrE	active	\N	2025-04-03 23:13:31	2025-04-08 15:02:18	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Lutfie	Alhashimi	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
75	Usamaa Shakeel	ushakeel@gmail.com__deleted_account75	971	123123123__deleted_account75	0	$2y$10$XLllD.Y52asl1mUvu5hW0eG5RkGF5.SdK5BOcswPqyu8tb83vx7C.	2025-05-19 21:42:26	2	1111		android		-OMVZTLqwo-Npvrzs_V-	active	\N	2025-03-29 10:23:32	2025-05-19 21:43:23	\N	\N	\N	\N	682b6d8ee7451_1747676558.	0	\N	\N	\N	\N	\N	\N	\N	0	0	1111		1	Usamaa	Shakeel	1	\N	\N	\N	971	1231231234	ushakeel@gmail.com	\N	\N	\N	1	1	1	\N	\N
88	Nawaz Khan	nawazkhan@gmail.com	971	121121433	1	$2y$10$ZPexiFVRi7nC9dTfzgXg0eM0KXMzEVByIQJ6UuFc3xAxL7MB9e45S	2025-04-08 19:42:11	4	\N	\N	\N	\N	\N	active	\N	2025-04-08 19:42:11	2025-04-08 19:44:01	\N	\N	\N	\N	\N	0	30.088853165603158	71.65515126344577	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	1	0	\N	\N
90	Sam Shah	sam@admin.com	971	335454545345	0	$2y$10$Qe4pbX0Pm/lGwziNZ21clONRFFUhDBQDSWi2lEFJYwoTi3iuGWXhS	\N	5	\N	\N	\N	\N	\N	active	\N	2025-04-08 20:10:45	2025-04-08 20:10:45	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	Sam	Shah	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	87	["dashboard","requests"]
94	Ajesh Kumar	ajeshcd@gmail.com	971	505041861	1	$2y$10$izqRjjIgrjldO71UGf/6VO.QW2uPLdEj7Q3PBQ4wJxR8XVxa4g.HK	2025-05-14 07:31:51	2		fCYXTdOnmkM-skLMqHIfPO:APA91bFDDd4okNWLjQ7YyROPOnbaxdw8zU_kBag21K1-9jYFRSOgDYfnOA_iqysGGzDz7OPR3kgNgAvoQzltvXJF134U_ySI3U2I2Cnz41cIO_4tAAyCEgs	ios	1eb590977bbc0f09ff7da95721ec07f8e96858798b9ba6b51dec238cc8d6b714	-OQBqIsTg6eZkiPlP3p_	active	\N	2025-05-14 07:31:51	2025-05-14 07:31:51	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Ajesh	Kumar	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
101	ANIL NAVIS	anil@dxbusinessgroup.com	971	5545508455	1	password	2025-05-17 06:01:48	2		e95BLf2Dc0U9i8HncgKDwz:APA91bEP_vCpbNxs7Y9_zwKAFufD5-plhDau1BwaqzC_S06mGN9Slq5OP45CVoC8ZwQOtbeN02dH3TX-yDzgVd_oiPGhNwzab5aaJCPBLTnKJkwHNHHmcU8	ios	da7f9837d10dbe8b4cf003c04d303532881620d30afdbe7dd0df3d183c7d7e61	-OQQyT2-ylVOndS6lAS2	active	\N	2025-05-17 06:01:48	2025-05-17 06:01:48	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	1			\N	ANIL	NAVIS	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
83	Lutfi Alhashimi	lutfialhashimi@hotmail.com	971	504113314	1	$2y$10$tdH0sTJh2VWg6riqrjdNEe7vd3mld3XvOzMaQj2Kxj2cgQ3EJdqM6	2025-04-16 19:40:38	2	\N	dg_4LY5OQ1i7vgoOhwM--u:APA91bHXReRtFgFGYBHNqs9CFD4gebh84hYLW9kV1jB2rZaDQzSYn6TPX_JfLGsldKWBUIUhbcEs3k3tUMktWDl-Hf7ZCkeTokPintFcCE-vi-oWsSEHvKE	android	42baac62b3e2a83e396f2ba7ff3a69412e44d3a414997e00ea65d76a3bfad7ea	-OMx0VQaHuYn7AsoBI_C	active	\N	2025-04-03 22:59:44	2025-04-16 19:40:38	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Lutfi	Alhashimi	1		2025-04-16 15:39:20	0	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
95	Usama Shakeel	usama@ymail.com	971	125125125	1	$2y$10$AO0Q6sG4yknvQfK6mh3n/eDi.oaKTmqxNL6bDXo2Us4DSiVd./1tu	2025-05-14 12:16:52	2		dS-6gpfBREtvmlYKIFqN6Q:APA91bEkmjGWI8CPmvki7-mJJqNuS8rX2VqyFOar0k9jRQiNqyS_foddl5bOYEQ1QIYAoYAIomseFxol3vP95edItdZgf2qWaC_mSLJjvn1COJHgavw_NK4	ios	c43fd1082d99511210c2648a34c1bdf025ab5adc65b435940ed39d6924354c08	-OQCrY8OWYt3y6MfPt9T	active	\N	2025-05-14 12:16:52	2025-05-14 12:16:53	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Usama	Shakeel	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
99	Usama Shakeel	ushakeel99@gmail.com	971	1254124514	1	$2y$10$5BlmJLh5C3vdD.E9Rv2z0enpDFUv.1WW5I1KZHjBZpbycR54n7.Ya	2025-05-15 14:52:17	2		f8Xa7HTVKUOMudtc4CbzMv:APA91bFBiA0yKm2PsD89-55bfamKqUFa12v5ZB5wADTaoiuMjin9xFFeap_EAGvHimK0L3NSkSFgeZqjUhlrQJi18wekhcU3R41Wf8iEezoIRDHlEj5icmY	ios	3d37fb9c3a20f898a7c6e49347b6c104c232307995c3d9d493757b383ac750cd	-OQIZhWC97K19w-Ve3Aj	active	\N	2025-05-15 14:52:17	2025-05-15 14:52:18	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Usama	Shakeel	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
96	Usama Usama	ui@ui.com	971	126126126	1	$2y$10$hSQBt.4EIbYzNOdhTRUMLOGAYNhqKW0JEvhcUxUpunsJ0xR5qPZnC	2025-05-14 12:38:21	2		fDLqNUsSQu-KLmpUVzoz_x:APA91bGiZIBiU4Mkz0UQSqyplWHpMsNWJ2lEIt5fpuFHD8ngtlqmHpTY_7ePfE6DU2mpcC2hWUVqOsGAlC3WRjgd9kGxJVJAIQuoY-x5rF6UrI-1VHMcpok	android	074f9635295267eaf8e0f072657056a0de5ba0c5e8ddb612dddbd0f986f31561	-OQCwSpioWCBSp7I-tRH	active	\N	2025-05-14 12:38:21	2025-05-14 12:38:22	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Usama	Usama	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
93	Usama Shakeel	ushakeel1@gmail.com	971	124124124	1	$2y$10$3.Q2FKlAoSZsaBbjI/u3WOYYWyY7sLdwm4/qWHup13wVOW2m39nHm	2025-04-22 13:47:03	2	\N	fDLqNUsSQu-KLmpUVzoz_x:APA91bGXX15UHoxlZgd0zLtxpVi2bPQXN09TI4gA4I01FasnoyH_uAy1jT0SypzlT4AM9CF2N6OYeO8HBbRR0gQKt3Jx6rmGurwYlzpLqOks1puM1bbtf34	android	8af75281c1151cb8904acfac6189b118d3619c17acbaac830526c62bbdc9ac1e	-OO9D4vWhbn5-UI57tU5	active	\N	2025-04-18 22:45:30	2025-04-22 13:47:03	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Usama	Shakeel	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
97	Usama Shakeel	usama123@gmail.com	92	134145155	1	$2y$10$ar9XUBDYT2zv3lKwBKkEmeIB1iPbu8PwnS9NyYLW1tef1LaEZp2cG	2025-05-14 12:42:38	2		123123123123	android	b5e84815b7af9229abea633c24063a141a83b1a7ef32de36fba29e928644de29	-OQCxRZoVV1rqUNqEiMO	active	\N	2025-05-14 12:42:38	2025-05-14 12:42:39	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Usama	Shakeel	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
98	Anil Navis	anil01@anil01.com	971	5666884566	1	$2y$10$xwAK7O93247DPybZKBgEKOudsg5pqRO8D6ySB2rIZ8GauJHW4Wr0K	2025-05-15 07:52:48	2		eAddbvMzEER9vC2JXlmext:APA91bFsjqVXc7e_hxV0RHybA6p_qtrILcrOKRTpAoczIlkdWrLR3Sv9KV33TtywHjxX1jWMkV1mRLphEHhuyckguBJ33fTkSF6klLD7M0maTeJupq0_2uc	ios	3710fcb8b2d0a0c32dcf6b79264fba7f0ab30d4f51af51f6b1024bbd789f1bef	-OQH3gg5T2P78cmQ0kjR	active	\N	2025-05-15 07:52:48	2025-05-15 07:52:49	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Anil	Navis	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
102	Hamid Raza	razahamid94@gmail.com	971	3441562554	1	$2y$10$F505AJMBlpAF9/IVoOqer.Dbxl0EQSAWihgsqmqO2.3WQOZvu7n1y	2025-05-17 09:35:42	2		emekOWZxQYmp4GOnCibPYg:APA91bFoqSl5UUdxLzAH6MsClDOx2fwUcuIH3UtjTN-fBFJCwDTT7VWuAaJvA9lH1xRZgEmVPUIFKWKu5pzjCsug-n96yD-E4DSydTlUnkpgdtmbEljcoLw	android	7c30d84e25fcc6d705df40495f5f456a47da2f83c5135e2d6ccbe036d81a5cf4	-OQRjQQUQ0oOY_COYF32	active	\N	2025-05-17 09:35:42	2025-05-17 09:35:42	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Hamid	Raza	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
106	Usama Shakeel	usama92@gmail.com	971	129129129	1	$2y$10$tb6lAVkFjKY4LF2LKBSz8us.7kmZZa8ASys7b7slQzcASi6HyEyt2	2025-05-17 12:17:28	2		fOde4ucjS7u1T4Ak1Oq9UM:APA91bFD61m1ZMtuX05oJi6jf1g93ystxNnSi-RMT0DyE14GD7WvgB3fX2YTxhAwRfdVReB8Jq5mgiuh1sV4J4BdKnbhq7LUuAGg1WDXXpGOU40BA5eszxw	android	0f0ee20fc128fe1000e2ed814880b65612c6113912eecb6eb841531fc65907ca	-OQSJS0M1ABXyPj2rV-3	active	\N	2025-05-17 12:17:28	2025-05-17 12:17:32	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Usama	Shakeel	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
103	sabeeh k	21@1.com	971	12	1	$2y$10$2/KTXpPU.O4nWQGuHp6qOeb6KPi5jBlX69mJxBVxiVgXEF1opUCMK	2025-05-17 10:29:29	2		123123	android	4a9a92bb87ba1be3b0c0c60f3d019c1a5dff07f09b725c4a785495cc79cc8962	-OQRvjDTOS3M35vE5iK7	active	\N	2025-05-17 10:29:29	2025-05-17 10:29:29	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	sabeeh	k	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
92	Anil Cargo	anilcargo@gmail.com	971	3553252352	1	$2y$10$T/gd29DmgdnCMBjZqLrkzuUF3dn8/ba5gFfMazPY0grv4YlF5Ef1S	2025-04-09 14:10:42	4	\N	\N	\N	\N	\N	active	\N	2025-04-09 14:10:42	2025-05-19 22:04:23	\N	\N	\N	22 58a St - Al Wasl - Dubai - United Arab Emirates	\N	0	25.20220507755729	55.26661041685789	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	tok_1RBvnqRwhoKMBfqcUcVHLc16	1	1	1	\N	\N
105	Usama Shakeel	usama@gmail.com	971	124124124	1	$2y$10$7RQeHpyO6Mj8OGLDQ1a2iOYY.zcRlBaKBcXQZrgATZPsCGzO4ZVgO	2025-05-20 20:41:54	2	\N	ewr8x5gzPkP2qSoaRU4pIt:APA91bGAdcaUwHqr8FgUpY0PG7esyVeUykJnxOhRtgdv15HPFAk3FrKz0hr13pxeIp2HtFpPDlY6pLCLjyJeqcvoi9NjUn3V8YHq47IjNpPL-u7uNLEWMBc	ios	4c2fbd87d9b77116c6c0226388314d253d3dc2d2cc3a0d57475dd8cfc1adb003	-OQS4jyIuHePLe7DcsOu	active	\N	2025-05-17 11:13:13	2025-05-20 20:41:54	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Usama	Shakeel	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
107	Usama shakes 	usha@gmail.com	971	1245124541	1	$2y$10$JPnvW1rXSchMkVVt0TioH.cbz60NuN2fLWI5sTWSvrZD1XZsrQFMS	2025-05-18 01:14:32	3		cJOB0fjiAkIct8-ZODO-kB:APA91bHoP7XO34hb8oNO71eFh-7dZdbs1MgsNBqBEb7IiAgWJ5AzCdopweZE-miI5t1uBcJebdm3wvUiLP2Lfb1qZnM_ATgBIsAho0muMYZXYJPwSra-2LY	ios	c212a12e8f8d4c6cd0fcbbcdf14b51f12ec63a1923a900eb5fc7df6f60607f2c	-OQV5IrYIEmo6H4caEZn	active	\N	2025-05-18 01:14:32	2025-05-18 01:14:37	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Usama shakes	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
100	Usama Shakeel	ushakeel010@gmail.com__deleted_account100	971	126129127__deleted_account100	1	password	2025-05-16 16:55:35	2			ios		-OQO9WNH95FzFsDYNx7Z	active	\N	2025-05-16 16:55:35	2025-05-19 19:12:45	\N	\N	\N	\N	6828a23f95ca3_1747493439.	0	\N	\N	\N	\N	\N	\N	\N	1	1			1	Usama	Shakeel	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
104	sabeeh k	211@1.com__deleted_account104	971	122__deleted_account104	1	$2y$10$KpL9IqY3dWgqtULAgvnWc.W9BUnL1mOhYHHTkltjkkQgSYzJTgP6S	2025-05-17 10:38:24	2			android		-OQRxlqVRVetoWUcBJdV	active	\N	2025-05-17 10:38:24	2025-05-19 11:19:33	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			1	sabeeh	k	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
111	Anil Navis	navisanil@gmail.com	971	5131681616	1	password	2025-05-19 16:35:04	3		fqzuI5tw2EE0jT9TwFuZJF:APA91bGwWKHCR86OFDRkh3-efiGx-UvmsmAYfpoBQEhBoeLkMN9c0s9YlD-LcaZK9wmVsa9nP7AMebrJxm5E-gqoMynBw0Fj56Pi9oWIi-BYGIFsBqaz494	ios	3e4b28ff3c97aae413a2df56cb760a9fe6c6d8437117317cf09bb03e2168256d	-OQcXa00KpupmOHZ2of3	active	\N	2025-05-19 16:35:04	2025-05-20 18:26:04	\N	\N	\N	\N	682b26802a2f8_1747658368.	0	\N	\N	\N	\N	\N	\N	\N	1	1			\N	Anil	Navis	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
109	Macaroni 	ddrc@ddrc.com	971	213184646	1	$2y$10$s7w2SmneD3QurK1//S7O6.k3xCO00nHEsrhNvhTXEcr8LGaXlvcy6	2025-05-19 06:00:26	3		fOo_9b3Sokx0lGcn81vgSU:APA91bGVb96AFgO9AhOr2fQuGng-ZY8F9Q947LUp410uc184NwuHPxHSQhW8xzLZo-exMf6TV-sozMc8oNY6FwK8IZBuSHu5n7dI6_eBbiKsPa7W8LUm_Yc	ios	cd5e57d9cd90bb862ff1c39fc87c0f049bb59faae6f0a01fca3cf7da9711ea0c	-OQaGKcK3ZMukwKcnYje	active	\N	2025-05-19 06:00:26	2025-05-19 06:00:30	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Macaroni	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
113	Usama 	b90@gmail.com	971	147147147	1	$2y$10$gDIuPCinmkSlDXNELzKeZu6Vq9j91e6nUsKGfgUw7oGsf.5XowjwW	2025-05-20 19:31:56	3	\N	ewr8x5gzPkP2qSoaRU4pIt:APA91bGAdcaUwHqr8FgUpY0PG7esyVeUykJnxOhRtgdv15HPFAk3FrKz0hr13pxeIp2HtFpPDlY6pLCLjyJeqcvoi9NjUn3V8YHq47IjNpPL-u7uNLEWMBc	ios	e07158c3e613565b65ce29820d59f1075ce8f30bf177bec9e4e6004357a4ba13	-OQcobjZJRUA6g8bQRTD	active	\N	2025-05-19 17:53:50	2025-05-20 19:31:56	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1		uploads/trade_licenses/v547nGW8zYo92tPlYV8jOAkSTkKgyzAxOZiORTKA.jpg	\N	Usama	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
110	Usama Business 	b10@gmail.com__deleted_account110	971	129129128__deleted_account110	1	$2y$10$8tKN7NrNRtRVhQSeqqDQgubNFujg1ozrFJdM3CkIjzEUOhAyyhcKS	2025-05-19 14:47:39	3			ios		-OQc9-UweC2i9956SekD	active	\N	2025-05-19 14:47:39	2025-05-19 15:12:29	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			1	Usama Business	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
32	ABCD sam	mytest+1@phone.com32	92	31223232321	1	$2y$10$xfyGnY49pUGmvuME4iBOC.kIbP7Z9UgirsuUSL6iOnuXh9ypfDIzO	2025-03-15 09:20:03	2		33434342	1234	bc17f71d05d2bca91599366d4e2904caddde85a49fdc5980db581718e2449720	-OLNEfyQnRgMVVKQZL3q	inactive	\N	2025-03-15 09:20:03	2025-05-19 21:17:54	\N	\N	\N	\N	67d52295c1dea_1742021269.jpg	0	\N	\N	\N	\N	\N	\N	\N	0	1		uploads/trade_licenses/6PFFZEsZv2eq5wYjsCGqOGbaxF47lnHlcKoyUo2R.jpg	\N	ABCD	sam	1		2025-03-15 06:27:31	0	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
108	Mahesh kumar	mah@mah1.com	971	546486464	1	$2y$10$KTeudIOBFLe0F60PqlvrVuE4IMvH5GvNPy6XB4GENTwLEH8YNaIRe	2025-05-18 20:29:07	2	1111	fOo_9b3Sokx0lGcn81vgSU:APA91bGVb96AFgO9AhOr2fQuGng-ZY8F9Q947LUp410uc184NwuHPxHSQhW8xzLZo-exMf6TV-sozMc8oNY6FwK8IZBuSHu5n7dI6_eBbiKsPa7W8LUm_Yc	ios	7a34d6791d4faf5ed3851beebf9e7be4b3850e6abcf112dfd71addb461c919e7	-OQYyHMjrxH5XQxlT5ca	active	\N	2025-05-18 19:17:58	2025-05-18 21:28:54	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1	1111		\N	Mahesh	kumar	1	881eead6265b884ed29fb138f86f9398e6d2e2e4e48c56f7c9ee262def75f071	2025-05-18 16:25:43	1111	971	546486464	mah@mah1.com	\N	\N	\N	1	1	1	\N	\N
57	FNC	navisanil@gmail.com__deleted_account57	971	63463636__deleted_account57	1	$2y$10$jCcDCQupBI8y2VNhkLvTYuFAhjKliWmJcg4Lxa9kdV.FgaRWvFZq6	2025-03-27 18:59:28	4	\N		ios		-OQZlpR1Fay-Yam7r8c1	active	\N	2025-03-27 18:59:28	2025-05-19 16:34:21	\N	\N	\N	KG Tower - Dubai Marina - Dubai - United Arab Emirates	\N	0	25.069471699216027	55.12695898870747	\N	\N	\N	\N	\N	0	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	5	\N	1	1	1	\N	\N
114	Sabeeh 123 k	155@1.com	971	1	1	$2y$10$qfEAeqoJz/cm3MesszgageAAC.5dntI0lBkfU4nG4thmiQTYYrjq6	2025-05-19 17:59:39	2		123123	android	bda6cf748917abe48f1f120f9f85503c3e8e495cb34fe049d808ccf5c35c5ad5	-OQcpx-Zh_tLALajVuOk	active	\N	2025-05-19 17:59:39	2025-05-19 17:59:43	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1		uploads/trade_licenses/yFIHzfmuPEBiKIS9lzuigbHMJOZyyfJ3t2D2gRuE.jpg	\N	Sabeeh 123	k	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
115	Usama Shakeel	ushakeel010@gmail.com__deleted_account115	971	258258259__deleted_account115	1	password	2025-05-19 19:13:18	3	1111		ios		-OQd5nxM1bRrvUkAHiM7	active	\N	2025-05-19 19:13:18	2025-05-19 20:38:41	\N	\N	\N	\N	682b592bafede_1747671339.	0	\N	\N	\N	\N	\N	\N	\N	1	1	1111	uploads/trade_licenses/LwMTOWmGCkXxF3q0RtaMT09GJWNeuaUKXrv87ZHE.jpg	1	Usama	Shakeel	1	\N	\N	\N	971	258258259	ushakeel010@gmail.com	\N	\N	\N	1	1	1	\N	\N
121	Anil Navis	anvis@anvis.com	971	8464664864	1	$2y$10$IksUsmcWyJOZ7FZQIUH1G.5pfdZeRfinPJUTfL37kVrtfrzAC5NQa	2025-05-20 00:14:35	2	1111	fie5W0qQ-kQcmPNqLkzZbr:APA91bHcAKERVTBOcxSchTgCR7jIImukl4v0K1XhybtISjjzihP0nu4Lg-hEX1dnzkIxAI11jXL_C4tqaejCFnGRJoRbVnvIvDs4OCJrhXNLSN0RnIjJjwg	ios	fdf543106d2c07c6d89905d557c7be3d5ac8d8ea8ce360c1d0ee315b88c9fd20	-OQeAl9wxLq_3tOmcgzr	active	\N	2025-05-20 00:14:35	2025-05-20 19:23:02	\N	\N	\N	\N	682b918028ad1_1747685760.	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Anil	Navis	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
119	Nabosh	nabo@nabo.com	971	3663463636	1	$2y$10$xb/NfOxPGUjUQB4Oor6.Me0/vICUzKvBOerNvL31qMUvX.OY7yDF2	2025-05-19 22:18:17	4	\N	\N	\N	\N	\N	active	\N	2025-05-19 22:18:17	2025-05-19 23:22:25	\N	\N	\N	GWFP+MM3, Vivekananda Nagar, Kesavadasapuram, Thiruvananthapuram, Kerala 695004, India	\N	0	8.5241391	76.9366376	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	cus_SLFlt7C3vNXaTr	1	1	1	\N	\N
118	Nabo	navisbo@navisbo.com	971	46646346366	1	$2y$10$voRSWxLu/JvjsuMkGKzEeuIslAE7gfWGpNILBukb4oreo6wFpeC3C	2025-05-19 21:47:36	4	\N	\N	\N	\N	\N	active	\N	2025-05-19 21:47:36	2025-05-19 22:00:14	\N	\N	\N	GWFP+MM3, Vivekananda Nagar, Kesavadasapuram, Thiruvananthapuram, Kerala 695004, India	\N	0	8.5241391	76.9366376	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	1	0	\N	\N
120	Navisand group Cv	ngo@ngo.com	971	4548464046	1	$2y$10$X/Uf.qRIEewEBaEKikP4AuMF1uk39E72Se8mTDRcNbRWdxW/dPXKK	2025-05-20 00:08:37	3		fie5W0qQ-kQcmPNqLkzZbr:APA91bHcAKERVTBOcxSchTgCR7jIImukl4v0K1XhybtISjjzihP0nu4Lg-hEX1dnzkIxAI11jXL_C4tqaejCFnGRJoRbVnvIvDs4OCJrhXNLSN0RnIjJjwg	ios	314015786f4d8eadff3c22f5cdb910870faf15fe5bcb86c892fb87b50ad480c9	-OQe9OkHpJcTuZHcLfpR	active	\N	2025-05-20 00:08:37	2025-05-20 00:10:05	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1		uploads/trade_licenses/WQGpUNUFj1navBUtiGaOZ0ePShOzNJF74UVmUl9D.jpg	\N	Navisand group	Cv	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
117	Usama Business Ash	usamab1@gmail.com	971	148481481	1	$2y$10$5Id9YrOchnMTz8.VpP1PfOoMFCP0MIlMVQbNCCv9Q5KVkWAKb3L6W	2025-05-19 21:44:08	3		cJOB0fjiAkIct8-ZODO-kB:APA91bHoP7XO34hb8oNO71eFh-7dZdbs1MgsNBqBEb7IiAgWJ5AzCdopweZE-miI5t1uBcJebdm3wvUiLP2Lfb1qZnM_ATgBIsAho0muMYZXYJPwSra-2LY	ios	8c72aa8b666f6aac0b7241ef3053edc600d91c1ccbadbd060dc6252836f9a7af	-OQddKO8Dfsfp30TiEbE	active	\N	2025-05-19 21:44:08	2025-05-19 22:02:42	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1		uploads/trade_licenses/CnUYVTftZKJNi127LAUXhRsiPDL9QX6KH5AIwhT5.jpg	\N	Usama Business	Ash	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
112	Usama Busine 	usamab@gmail.com	971	1245457864	1	$2y$10$qOJetnSFe8jd.sWEw8/s0eP/71HgATD8lV1IgTNbXqstnPc./HSR6	2025-05-20 18:41:27	3	\N	cJOB0fjiAkIct8-ZODO-kB:APA91bHoP7XO34hb8oNO71eFh-7dZdbs1MgsNBqBEb7IiAgWJ5AzCdopweZE-miI5t1uBcJebdm3wvUiLP2Lfb1qZnM_ATgBIsAho0muMYZXYJPwSra-2LY	ios	507e41b238e04e04277bc30d40c54dbb70bb140e4c50538b7647f47fd8d7d8e4	-OQc_LTJfe2tig_YvITj	active	\N	2025-05-19 16:47:07	2025-05-20 19:25:55	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1			\N	Usama Busine	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
116	Usama Shakeel	ushakeel010@gmail.com	971	222555888	1	password	2025-05-19 20:40:39	3		ewr8x5gzPkP2qSoaRU4pIt:APA91bGAdcaUwHqr8FgUpY0PG7esyVeUykJnxOhRtgdv15HPFAk3FrKz0hr13pxeIp2HtFpPDlY6pLCLjyJeqcvoi9NjUn3V8YHq47IjNpPL-u7uNLEWMBc	ios	c50022e6b3c8427b51e9369c90f2ec1bb9d992962087d8d5de76aaa3b70b1fd0	-OQdPnRdhuvsritzH0HO	active	\N	2025-05-19 20:40:39	2025-05-20 20:43:45	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	1		uploads/trade_licenses/1B4GqrPGC7jMRnBMgEnZF2HVfbhmWO9HGw3jdPsP.jpg	\N	Usama	Shakeel	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
122	Usama Shakeel	io@io.com	971	147014708	1	$2y$10$iBEoGQok9ODAw79qQb.dfuHeI.mVVf60S033euRZSJNcjfgBNZj7C	2025-05-20 09:37:17	3		cJOB0fjiAkIct8-ZODO-kB:APA91bHoP7XO34hb8oNO71eFh-7dZdbs1MgsNBqBEb7IiAgWJ5AzCdopweZE-miI5t1uBcJebdm3wvUiLP2Lfb1qZnM_ATgBIsAho0muMYZXYJPwSra-2LY	ios	57bda05406feb1a0f07d8fdd881c2aaac0479f14f54e852e517ff702e51c9686	-OQgBYoGbeofGASWjaMJ	active	\N	2025-05-20 09:37:17	2025-05-20 09:37:21	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1		uploads/trade_licenses/OdmIbOCTt8LN3dQmjQ5ZDzIK0Dn0WniucBAyActm.jpg	\N	Usama	Shakeel	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
123	Navis business 	navbus@gmail.com	971	5466484664	1	$2y$10$VpBo424ODO2nLy59z4Hcl.eCponrTFjITvXwWlkrpD9NTSMV8oWOy	2025-05-21 00:22:56	3		f0xl3DlMgE-CkO_BZu2986:APA91bHfAipMrOula_V1ej2HRINaIKag4gPhgAkDSMSCP6xLGJ0K5mU2Gx6V-zyGIhBnLTnCjJd98uBAHZtBg4_HvvcOzZJSTn5rMuChoR2AZVJVhoWOzj8	ios	70e9f5eb36592db29811d51daa3cc620c4df4d0a299082d5caf3f6bff39e6605	-OQjMGND4lE0r__u_e4n	active	\N	2025-05-21 00:22:56	2025-05-21 00:25:33	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	0	1		uploads/trade_licenses/Rdyuxhyvrq9ASQqTsn5Dk6xmxhXrJ9KB0U0ofeB3.jpg	\N	Navis business	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	1	\N	\N
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

SELECT pg_catalog.setval('public.booking_home_relocations_id_seq', 68, true);


--
-- Name: booking_item_deliveries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_item_deliveries_id_seq', 5, true);


--
-- Name: booking_office_relocations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_office_relocations_id_seq', 16, true);


--
-- Name: booking_pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_pictures_id_seq', 88, true);


--
-- Name: booking_qoutes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_qoutes_id_seq', 83, true);


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

SELECT pg_catalog.setval('public.booking_storage_services_id_seq', 22, true);


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

SELECT pg_catalog.setval('public.bookings_id_seq', 299, true);


--
-- Name: business_enquiries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.business_enquiries_id_seq', 5, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 7, true);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_id_seq', 50, true);


--
-- Name: company_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_categories_id_seq', 106, true);


--
-- Name: contact_page_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_page_settings_id_seq', 10, true);


--
-- Name: contact_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_us_id_seq', 11, true);


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

SELECT pg_catalog.setval('public.migrations_id_seq', 127, true);


--
-- Name: new_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.new_notifications_id_seq', 268, true);


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

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 286, true);


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

SELECT pg_catalog.setval('public.temp_users_id_seq', 39, true);


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

SELECT pg_catalog.setval('public.user_cards_id_seq', 14, true);


--
-- Name: user_password_resets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_password_resets_id_seq', 1, false);


--
-- Name: user_ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_ratings_id_seq', 24, true);


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

SELECT pg_catalog.setval('public.users_id_seq', 123, true);


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

