--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-2.pgdg20.04+1)
-- Dumped by pg_dump version 15.10 (Ubuntu 15.10-1.pgdg20.04+1)

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
-- Name: accepted_qoutes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accepted_qoutes (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    driver_id integer NOT NULL,
    hours integer NOT NULL,
    qouted_amount double precision,
    commission_amount double precision,
    border_charges double precision,
    shipping_charges double precision,
    wating_charges double precision,
    custom_charges double precision,
    cost_of_truck double precision,
    received_amount double precision,
    total_amount double precision,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    booking_truck_id integer,
    delivery_note text,
    customer_signature text,
    statuscode integer DEFAULT 0 NOT NULL,
    upload_doc character varying(600),
    deliver_note_doc character varying(255),
    driver_advance_amount double precision DEFAULT '0'::double precision NOT NULL,
    CONSTRAINT accepted_qoutes_status_check CHECK (((status)::text = ANY (ARRAY[('pending'::character varying)::text, ('qouted'::character varying)::text, ('accepted'::character varying)::text, ('journey_started'::character varying)::text, ('item_collected'::character varying)::text, ('on_the_way'::character varying)::text, ('border_crossing'::character varying)::text, ('custom_clearance'::character varying)::text, ('delivered'::character varying)::text])))
);


ALTER TABLE public.accepted_qoutes OWNER TO postgres;

--
-- Name: accepted_qoutes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accepted_qoutes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accepted_qoutes_id_seq OWNER TO postgres;

--
-- Name: accepted_qoutes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accepted_qoutes_id_seq OWNED BY public.accepted_qoutes.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    id bigint NOT NULL,
    user_id integer,
    address text,
    latitude character varying(255),
    longitude character varying(255),
    city_id integer,
    country_id integer,
    zip_code character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_deleted integer DEFAULT 0 NOT NULL,
    dial_code integer,
    phone character varying(255),
    building character varying(255)
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_id_seq OWNER TO postgres;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: admin_designation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_designation (
    id bigint NOT NULL,
    name character varying(600),
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
-- Name: app_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_settings (
    id bigint NOT NULL,
    email character varying(255),
    website character varying(255),
    contact_numbers text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.app_settings OWNER TO postgres;

--
-- Name: app_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_settings_id_seq OWNER TO postgres;

--
-- Name: app_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_settings_id_seq OWNED BY public.app_settings.id;


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
-- Name: booking_carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_carts (
    id bigint NOT NULL,
    is_collection integer,
    collection_address integer,
    deliver_address integer,
    sender_id bigint,
    deligate_id bigint,
    deligate_type character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    device_cart_id character varying(255),
    booking_number character varying(255),
    parent_id character varying(255) DEFAULT '0'::character varying NOT NULL,
    shipmenttype integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.booking_carts OWNER TO postgres;

--
-- Name: booking_carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_carts_id_seq OWNER TO postgres;

--
-- Name: booking_carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_carts_id_seq OWNED BY public.booking_carts.id;


--
-- Name: booking_containers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_containers (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    container_id integer NOT NULL,
    quantity integer NOT NULL,
    gross_weight double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.booking_containers OWNER TO postgres;

--
-- Name: booking_containers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_containers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_containers_id_seq OWNER TO postgres;

--
-- Name: booking_containers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_containers_id_seq OWNED BY public.booking_containers.id;


--
-- Name: booking_deligate_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_deligate_details (
    id bigint NOT NULL,
    item character varying(255),
    booking_id integer,
    no_of_packages integer,
    dimension_of_each_package character varying(255),
    weight_of_each_package character varying(255),
    total_gross_weight integer,
    total_volume_in_cbm character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    num_of_pallets integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.booking_deligate_details OWNER TO postgres;

--
-- Name: booking_deligate_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_deligate_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_deligate_details_id_seq OWNER TO postgres;

--
-- Name: booking_deligate_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_deligate_details_id_seq OWNED BY public.booking_deligate_details.id;


--
-- Name: booking_extra_charges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_extra_charges (
    id bigint NOT NULL,
    booking_id integer DEFAULT 0 NOT NULL,
    accepted_quote_id integer DEFAULT 0 NOT NULL,
    driver_id integer DEFAULT 0 NOT NULL,
    extra_charge_id integer DEFAULT 0 NOT NULL,
    extra_charge_name character varying(255),
    extra_charge_amount double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.booking_extra_charges OWNER TO postgres;

--
-- Name: booking_extra_charges_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_extra_charges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_extra_charges_id_seq OWNER TO postgres;

--
-- Name: booking_extra_charges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_extra_charges_id_seq OWNED BY public.booking_extra_charges.id;


--
-- Name: booking_qoutes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_qoutes (
    id bigint NOT NULL,
    booking_id bigint NOT NULL,
    driver_id bigint NOT NULL,
    price integer NOT NULL,
    hours integer NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    comission_amount double precision DEFAULT '0'::double precision NOT NULL,
    is_admin_approved character varying(255) DEFAULT 'no'::character varying NOT NULL,
    booking_truck_id integer,
    qouted_at timestamp(0) without time zone,
    statuscode integer DEFAULT 0 NOT NULL,
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
    customer_id bigint,
    rate double precision DEFAULT '0'::double precision NOT NULL,
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
    driver_id integer,
    statuscode integer DEFAULT 0 NOT NULL,
    quote_id integer DEFAULT 0 NOT NULL,
    CONSTRAINT booking_status_trackings_status_tracking_check CHECK (((status_tracking)::text = ANY (ARRAY[('request_created'::character varying)::text, ('accepted'::character varying)::text, ('journey_started'::character varying)::text, ('item_collected'::character varying)::text, ('on_the_way'::character varying)::text, ('border_crossing'::character varying)::text, ('custom_clearance'::character varying)::text, ('delivered'::character varying)::text, ('collected_from_shipper'::character varying)::text, ('cargo_cleared_at_origin_border'::character varying)::text, ('cargo_tracking'::character varying)::text, ('cargo_reached_destination_border'::character varying)::text, ('cargo_cleared_destination_customs'::character varying)::text, ('delivery_completed'::character varying)::text, ('items_received_in_warehouse'::character varying)::text, ('items_stored'::character varying)::text])))
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
-- Name: booking_truck_alots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_truck_alots (
    id bigint NOT NULL,
    booking_truck_id integer,
    user_id integer,
    role_id integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.booking_truck_alots OWNER TO postgres;

--
-- Name: booking_truck_alots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_truck_alots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_truck_alots_id_seq OWNER TO postgres;

--
-- Name: booking_truck_alots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_truck_alots_id_seq OWNED BY public.booking_truck_alots.id;


--
-- Name: booking_truck_carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_truck_carts (
    id bigint NOT NULL,
    booking_cart_id integer NOT NULL,
    truck_id integer NOT NULL,
    quantity integer NOT NULL,
    gross_weight character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.booking_truck_carts OWNER TO postgres;

--
-- Name: booking_truck_carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_truck_carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_truck_carts_id_seq OWNER TO postgres;

--
-- Name: booking_truck_carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_truck_carts_id_seq OWNED BY public.booking_truck_carts.id;


--
-- Name: booking_trucks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_trucks (
    id bigint NOT NULL,
    booking_id integer NOT NULL,
    truck_id integer NOT NULL,
    quantity integer NOT NULL,
    gross_weight character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.booking_trucks OWNER TO postgres;

--
-- Name: booking_trucks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_trucks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_trucks_id_seq OWNER TO postgres;

--
-- Name: booking_trucks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_trucks_id_seq OWNED BY public.booking_trucks.id;


--
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    id bigint NOT NULL,
    is_collection integer,
    collection_address text,
    deliver_address text,
    sender_id bigint,
    deligate_id bigint,
    deligate_type character varying(255),
    admin_response character varying(255) NOT NULL,
    comission_amount integer,
    customer_signature character varying(255) DEFAULT '0'::character varying,
    delivery_note text,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    booking_number character varying(255),
    is_paid character varying(255) DEFAULT 'no'::character varying NOT NULL,
    invoice_number character varying(255),
    total_commission_amount double precision,
    total_received_amount double precision DEFAULT '0'::double precision NOT NULL,
    sub_total double precision,
    grand_total double precision,
    shipping_method_id integer,
    total_qoutation_amount double precision DEFAULT '0'::double precision NOT NULL,
    collection_latitude character varying(255),
    collection_longitude character varying(255),
    collection_country character varying(255),
    collection_city character varying(255),
    collection_zipcode character varying(255),
    deliver_latitude character varying(255),
    deliver_longitude character varying(255),
    deliver_country character varying(255),
    deliver_city character varying(255),
    deliver_zipcode character varying(255),
    collection_phone character varying(255),
    deliver_phone character varying(255),
    statuscode integer DEFAULT 0 NOT NULL,
    parent_id character varying(255) DEFAULT '0'::character varying NOT NULL,
    collection_address_id integer DEFAULT 0 NOT NULL,
    deliver_address_id integer DEFAULT 0 NOT NULL,
    rack character varying(255) DEFAULT ''::character varying,
    storage_picture text DEFAULT ''::text,
    date_of_commencement character varying(255) DEFAULT ''::character varying,
    date_of_return character varying(255) DEFAULT ''::character varying,
    instructions text DEFAULT ''::text,
    admin_can_accept_quote integer DEFAULT 0 NOT NULL,
    shipmenttype integer DEFAULT 0 NOT NULL,
    CONSTRAINT bookings_admin_response_check CHECK (((admin_response)::text = ANY (ARRAY[('pending'::character varying)::text, ('ask_for_qoute'::character varying)::text, ('driver_qouted'::character varying)::text, ('approved_by_admin'::character varying)::text]))),
    CONSTRAINT bookings_is_paid_check CHECK (((is_paid)::text = ANY (ARRAY[('no'::character varying)::text, ('yes'::character varying)::text]))),
    CONSTRAINT bookings_status_check CHECK (((status)::text = ANY (ARRAY[('pending'::character varying)::text, ('qoutes_received'::character varying)::text, ('on_process'::character varying)::text, ('cancelled'::character varying)::text, ('completed'::character varying)::text, ('collected_from_shipper'::character varying)::text, ('cargo_cleared_at_origin_border'::character varying)::text, ('cargo_tracking'::character varying)::text, ('cargo_reached_destination_border'::character varying)::text, ('cargo_cleared_destination_customs'::character varying)::text, ('delivery_completed'::character varying)::text, ('items_received_in_warehouse'::character varying)::text, ('items_stored'::character varying)::text])))
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
-- Name: cart_deligate_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_deligate_details (
    id bigint NOT NULL,
    item character varying(255),
    booking_cart_id integer,
    no_of_packages integer,
    dimension_of_each_package character varying(255),
    weight_of_each_package character varying(255),
    total_gross_weight integer,
    total_volume_in_cbm character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    num_of_pallets integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.cart_deligate_details OWNER TO postgres;

--
-- Name: cart_deligate_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_deligate_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_deligate_details_id_seq OWNER TO postgres;

--
-- Name: cart_deligate_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_deligate_details_id_seq OWNED BY public.cart_deligate_details.id;


--
-- Name: cart_warehousing_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_warehousing_details (
    id bigint NOT NULL,
    booking_cart_id integer,
    items_are_stockable character varying(255),
    type_of_storage character varying(255),
    item character varying(255),
    no_of_pallets integer,
    pallet_dimension character varying(255),
    weight_per_pallet integer,
    total_weight integer,
    total_item_cost integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    date_of_commencement character varying(255),
    date_of_return character varying(255),
    CONSTRAINT cart_warehousing_details_items_are_stockable_check CHECK (((items_are_stockable)::text = ANY ((ARRAY['yes'::character varying, 'no'::character varying])::text[])))
);


ALTER TABLE public.cart_warehousing_details OWNER TO postgres;

--
-- Name: cart_warehousing_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_warehousing_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_warehousing_details_id_seq OWNER TO postgres;

--
-- Name: cart_warehousing_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_warehousing_details_id_seq OWNED BY public.cart_warehousing_details.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id bigint NOT NULL,
    city_name character varying(255),
    city_status integer DEFAULT 0 NOT NULL,
    country_id integer,
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
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    logo character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    user_id integer,
    license_expiry character varying(255),
    company_license character varying(255),
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
-- Name: containers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.containers (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    dimensions character varying(255),
    max_weight_in_metric_tons character varying(255),
    icon character varying(255),
    status character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT containers_status_check CHECK (((status)::text = ANY (ARRAY[('active'::character varying)::text, ('inactive'::character varying)::text]))),
    CONSTRAINT containers_type_check CHECK (((type)::text = ANY (ARRAY[('fcl'::character varying)::text, ('lcl'::character varying)::text])))
);


ALTER TABLE public.containers OWNER TO postgres;

--
-- Name: containers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.containers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.containers_id_seq OWNER TO postgres;

--
-- Name: containers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.containers_id_seq OWNED BY public.containers.id;


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
    company_id integer,
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
    emirates_id_or_passport_back character varying(255),
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
-- Name: driver_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.driver_types (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.driver_types OWNER TO postgres;

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
    title character varying(255),
    description text,
    active integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    usertype integer DEFAULT 0 NOT NULL
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
-- Name: help_request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.help_request (
    id bigint NOT NULL,
    subject character varying(255),
    message text,
    user_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.help_request OWNER TO postgres;

--
-- Name: help_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.help_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.help_request_id_seq OWNER TO postgres;

--
-- Name: help_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.help_request_id_seq OWNED BY public.help_request.id;


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
-- Name: notification_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification_users (
    id bigint NOT NULL,
    notification_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.notification_users OWNER TO postgres;

--
-- Name: notification_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notification_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_users_id_seq OWNER TO postgres;

--
-- Name: notification_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notification_users_id_seq OWNED BY public.notification_users.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    user_id integer,
    description text,
    generated_by bigint,
    generated_to bigint,
    is_read character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    title character varying(255),
    image character varying(255),
    status character varying(255),
    CONSTRAINT notifications_is_read_check CHECK (((is_read)::text = ANY (ARRAY[('yes'::character varying)::text, ('no'::character varying)::text]))),
    CONSTRAINT notifications_status_check CHECK (((status)::text = ANY (ARRAY[('active'::character varying)::text, ('inactive'::character varying)::text])))
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
    is_admin_role integer DEFAULT 0 NOT NULL,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
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
    contact_number character varying(255),
    whatsapp_number character varying(255),
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
-- Name: storage_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storage_types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT storage_types_status_check CHECK (((status)::text = ANY (ARRAY[('active'::character varying)::text, ('inactive'::character varying)::text])))
);


ALTER TABLE public.storage_types OWNER TO postgres;

--
-- Name: storage_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.storage_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.storage_types_id_seq OWNER TO postgres;

--
-- Name: storage_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.storage_types_id_seq OWNED BY public.storage_types.id;


--
-- Name: temp_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_users (
    temp_user_id integer NOT NULL,
    truck_type character varying(255),
    account_type character varying(255),
    name character varying(255),
    email character varying(255),
    password character varying(255),
    dial_code character varying(255),
    phone character varying(255),
    driving_license character varying(255),
    company_id integer,
    emirates_id_or_passport character varying(255),
    emirates_id_or_passport_back character varying(255),
    user_device_type character varying(255),
    user_device_token character varying(255),
    user_device_id character varying(255),
    driving_license_number character varying(255),
    driving_license_expiry date,
    driving_license_issued_by character varying(255),
    vehicle_plate_number character varying(255),
    vehicle_plate_place character varying(255),
    mulkiya character varying(255),
    mulkiya_number character varying(255),
    status character varying(255),
    address character varying(255),
    country character varying(255),
    city character varying(255),
    zip_code character varying(255),
    latitude character varying(255),
    longitude character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    address_2 text,
    role_id integer DEFAULT 0 NOT NULL,
    country_id integer DEFAULT 0 NOT NULL,
    city_id integer DEFAULT 0 NOT NULL,
    user_phone_otp integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.temp_users OWNER TO postgres;

--
-- Name: temp_users_temp_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temp_users_temp_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temp_users_temp_user_id_seq OWNER TO postgres;

--
-- Name: temp_users_temp_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temp_users_temp_user_id_seq OWNED BY public.temp_users.temp_user_id;


--
-- Name: truck_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.truck_types (
    id bigint NOT NULL,
    truck_type character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    dimensions character varying(255) NOT NULL,
    icon character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    max_weight_in_tons character varying(255),
    is_container integer DEFAULT 0 NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    CONSTRAINT truck_types_status_check CHECK (((status)::text = ANY (ARRAY[('active'::character varying)::text, ('inactive'::character varying)::text]))),
    CONSTRAINT truck_types_type_check CHECK (((type)::text = ANY (ARRAY[('ftl'::character varying)::text, ('ltl'::character varying)::text])))
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
-- Name: user_additional_phone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_additional_phone (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    dial_code character varying(255) NOT NULL,
    mobile character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_additional_phone OWNER TO postgres;

--
-- Name: user_additional_phone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_additional_phone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_additional_phone_id_seq OWNER TO postgres;

--
-- Name: user_additional_phone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_additional_phone_id_seq OWNED BY public.user_additional_phone.id;


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
-- Name: user_privileges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_privileges (
    id bigint NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    designation_id integer DEFAULT 0 NOT NULL,
    privileges text,
    status integer DEFAULT 0 NOT NULL,
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
    fcm_token text,
    password_reset_otp character varying(255),
    password_reset_time character varying(255),
    login_type character varying(255) DEFAULT 'normal'::character varying NOT NULL,
    country_id integer DEFAULT 0 NOT NULL,
    city_id integer DEFAULT 0 NOT NULL,
    trade_licence_number character varying(255),
    trade_licence_doc character varying(255),
    temp_dialcode character varying(255),
    temp_mobile character varying(255),
    usertype integer DEFAULT 0 NOT NULL,
    designation_id integer DEFAULT 0 NOT NULL,
    additional_phone text,
    default_iso_code character varying(255),
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
-- Name: warehousing_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehousing_details (
    id bigint NOT NULL,
    booking_id integer,
    items_are_stockable character varying(255),
    type_of_storage integer,
    item character varying(255),
    pallet_dimension character varying(255),
    weight_per_pallet integer,
    total_weight integer,
    total_item_cost integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    no_of_pallets integer,
    CONSTRAINT warehousing_details_items_are_stockable_check CHECK (((items_are_stockable)::text = ANY (ARRAY[('yes'::character varying)::text, ('no'::character varying)::text])))
);


ALTER TABLE public.warehousing_details OWNER TO postgres;

--
-- Name: warehousing_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.warehousing_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.warehousing_details_id_seq OWNER TO postgres;

--
-- Name: warehousing_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.warehousing_details_id_seq OWNED BY public.warehousing_details.id;


--
-- Name: accepted_qoutes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accepted_qoutes ALTER COLUMN id SET DEFAULT nextval('public.accepted_qoutes_id_seq'::regclass);


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: admin_designation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_designation ALTER COLUMN id SET DEFAULT nextval('public.admin_designation_id_seq'::regclass);


--
-- Name: app_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_settings ALTER COLUMN id SET DEFAULT nextval('public.app_settings_id_seq'::regclass);


--
-- Name: blacklists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blacklists ALTER COLUMN id SET DEFAULT nextval('public.blacklists_id_seq'::regclass);


--
-- Name: booking_additional_charges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_additional_charges ALTER COLUMN id SET DEFAULT nextval('public.booking_additional_charges_id_seq'::regclass);


--
-- Name: booking_carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_carts ALTER COLUMN id SET DEFAULT nextval('public.booking_carts_id_seq'::regclass);


--
-- Name: booking_containers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_containers ALTER COLUMN id SET DEFAULT nextval('public.booking_containers_id_seq'::regclass);


--
-- Name: booking_deligate_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_deligate_details ALTER COLUMN id SET DEFAULT nextval('public.booking_deligate_details_id_seq'::regclass);


--
-- Name: booking_extra_charges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_extra_charges ALTER COLUMN id SET DEFAULT nextval('public.booking_extra_charges_id_seq'::regclass);


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
-- Name: booking_truck_alots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_truck_alots ALTER COLUMN id SET DEFAULT nextval('public.booking_truck_alots_id_seq'::regclass);


--
-- Name: booking_truck_carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_truck_carts ALTER COLUMN id SET DEFAULT nextval('public.booking_truck_carts_id_seq'::regclass);


--
-- Name: booking_trucks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_trucks ALTER COLUMN id SET DEFAULT nextval('public.booking_trucks_id_seq'::regclass);


--
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- Name: cart_deligate_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_deligate_details ALTER COLUMN id SET DEFAULT nextval('public.cart_deligate_details_id_seq'::regclass);


--
-- Name: cart_warehousing_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_warehousing_details ALTER COLUMN id SET DEFAULT nextval('public.cart_warehousing_details_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: containers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.containers ALTER COLUMN id SET DEFAULT nextval('public.containers_id_seq'::regclass);


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
-- Name: help_request id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help_request ALTER COLUMN id SET DEFAULT nextval('public.help_request_id_seq'::regclass);


--
-- Name: languages language_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages ALTER COLUMN language_id SET DEFAULT nextval('public.languages_language_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: notification_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_users ALTER COLUMN id SET DEFAULT nextval('public.notification_users_id_seq'::regclass);


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
-- Name: storage_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_types ALTER COLUMN id SET DEFAULT nextval('public.storage_types_id_seq'::regclass);


--
-- Name: temp_users temp_user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users ALTER COLUMN temp_user_id SET DEFAULT nextval('public.temp_users_temp_user_id_seq'::regclass);


--
-- Name: truck_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.truck_types ALTER COLUMN id SET DEFAULT nextval('public.truck_types_id_seq'::regclass);


--
-- Name: user_additional_phone id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_additional_phone ALTER COLUMN id SET DEFAULT nextval('public.user_additional_phone_id_seq'::regclass);


--
-- Name: user_password_resets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_password_resets ALTER COLUMN id SET DEFAULT nextval('public.user_password_resets_id_seq'::regclass);


--
-- Name: user_privileges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_privileges ALTER COLUMN id SET DEFAULT nextval('public.user_privileges_id_seq'::regclass);


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
-- Name: warehousing_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehousing_details ALTER COLUMN id SET DEFAULT nextval('public.warehousing_details_id_seq'::regclass);


--
-- Data for Name: accepted_qoutes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accepted_qoutes (id, booking_id, driver_id, hours, qouted_amount, commission_amount, border_charges, shipping_charges, wating_charges, custom_charges, cost_of_truck, received_amount, total_amount, status, created_at, updated_at, booking_truck_id, delivery_note, customer_signature, statuscode, upload_doc, deliver_note_doc, driver_advance_amount) FROM stdin;
2	82	83	10	300	\N	\N	\N	\N	\N	\N	\N	300	accepted	2023-10-16 11:39:06	2023-10-16 15:39:06	\N	\N	\N	0	\N	\N	0
3	83	83	10	300	\N	\N	\N	\N	\N	\N	\N	300	accepted	2023-10-16 12:01:30	2023-10-16 16:01:30	\N	\N	\N	0	\N	\N	0
18	112	97	10	300	0	\N	\N	\N	\N	\N	\N	600	delivered	2023-10-24 07:41:59	2023-10-24 11:48:20	102	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	653776c4381fb_1698133700.png	9	\N	\N	0
17	112	90	10	300	0	\N	\N	\N	\N	\N	\N	600	delivered	2023-10-24 07:36:56	2023-10-24 11:37:37	101	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	653774410b079_1698133057.png	9	\N	\N	0
19	114	97	10	300	0	\N	\N	\N	\N	\N	\N	600	delivered	2023-10-24 08:09:38	2023-10-24 12:10:23	105	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	65377bef0ebf2_1698135023.png	9	\N	\N	0
6	102	83	10	300	5	\N	\N	\N	\N	\N	\N	600	delivered	2023-10-17 11:28:26	2023-10-17 15:52:17	86	\N	\N	9	\N	\N	0
20	115	97	10	500	0	\N	\N	\N	\N	\N	\N	1000	delivered	2023-10-24 08:16:22	2023-10-24 12:16:50	107	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	65377d726d908_1698135410.png	9	\N	\N	0
22	130	86	24	1000	10	\N	\N	\N	\N	\N	\N	2000	delivered	2023-10-26 07:08:23	2023-10-26 11:24:11	127	good work	653a141b6d15b_1698305051.png	9	\N	\N	0
5	94	83	2	300	0	\N	\N	\N	\N	\N	\N	600	delivered	2023-10-17 08:56:15	2023-10-18 08:54:27	77	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	652f65032e1b6_1697604867.png	9	\N	\N	0
23	142	86	24	400	10	\N	\N	\N	\N	\N	\N	800	delivered	2023-10-26 11:20:58	2023-10-26 15:25:42	134	delivered	653a4cb6c80ac_1698319542.png	9	\N	\N	0
24	149	86	24	300	0	\N	\N	\N	\N	\N	\N	600	accepted	2023-10-26 11:53:22	2023-10-26 11:53:22	146	\N	\N	0	\N	\N	0
13	106	98	5	300	15	\N	\N	\N	\N	\N	\N	600	delivered	2023-10-20 12:11:59	2023-10-20 16:22:30	95	nothing	6532710621e08_1697804550.png	9	\N	\N	0
25	149	88	24	300	10	\N	\N	\N	\N	\N	\N	600	accepted	2023-10-26 11:56:18	2023-10-26 11:56:18	146	\N	\N	0	\N	\N	0
12	106	97	5	250	10	\N	\N	\N	\N	\N	\N	500	delivered	2023-10-20 12:11:55	2023-10-20 16:22:45	96	okay	6532711582105_1697804565.png	9	\N	\N	0
4	84	83	10	300	10	\N	\N	\N	\N	\N	\N	600	delivered	2023-10-16 12:16:15	2023-10-18 10:23:45	69	testing comments	652f79f1aa080_1697610225.png	9	\N	\N	0
26	149	107	24	400	10	\N	\N	\N	\N	\N	\N	800	accepted	2023-10-26 11:56:21	2023-10-26 11:56:21	146	\N	\N	0	\N	\N	0
15	106	88	10	400	10	\N	\N	\N	\N	\N	\N	800	delivered	2023-10-20 12:12:05	2023-10-20 16:23:06	97	okk	6532712a5674d_1697804586.png	9	\N	\N	0
11	105	83	12	235	0	\N	\N	\N	\N	\N	\N	470	delivered	2023-10-20 11:45:00	2023-12-04 16:38:03	94	\N	656dc82badeec_1701693483.png	9	\N	656dc82baf44f_1701693483.png	12
7	100	83	7	333	0	\N	\N	\N	\N	\N	\N	666	delivered	2023-10-18 20:23:42	2023-10-19 03:29:35	83	test	65306a5f70934_1697671775.png	9	\N	\N	0
28	153	88	24	250	5	\N	\N	\N	\N	\N	\N	500	delivered	2023-10-26 13:56:29	2023-10-26 17:58:07	149	noted	653a706f10392_1698328687.png	9	\N	\N	0
81	348	1	33	33	0	\N	\N	\N	\N	\N	\N	66	accepted	2023-11-17 12:56:30	2023-11-17 12:56:30	\N	\N	\N	0	\N	\N	0
14	106	83	15	333	15	\N	\N	\N	\N	\N	\N	666	delivered	2023-10-20 12:12:02	2023-12-01 13:38:57	95	\N	6569a9b1769c1_1701423537.png	9	\N	\N	113
16	111	90	10	300	0	\N	\N	\N	\N	\N	\N	600	delivered	2023-10-24 07:26:57	2023-10-24 11:32:59	99	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	6537732b33e3c_1698132779.png	9	\N	\N	0
8	104	88	2	250	10	\N	\N	\N	\N	\N	\N	500	delivered	2023-10-19 08:45:08	2023-10-19 12:53:08	93	nothing	6530ee741dbd3_1697705588.png	9	\N	\N	0
10	91	87	11	115	0	\N	\N	\N	\N	\N	\N	230	accepted	2023-10-19 09:30:33	2023-10-19 09:30:33	85	\N	\N	0	\N	\N	0
9	91	83	10	112	0	\N	\N	\N	\N	\N	\N	224	on_the_way	2023-10-19 09:30:29	2023-10-19 22:01:36	85	\N	\N	6	\N	\N	0
46	243	139	2	5000	10	\N	\N	\N	\N	\N	\N	10000	delivered	2023-11-14 13:18:57	2023-11-14 17:26:34	213	thanks for the	6553758ab2f94_1699968394.png	9	\N	\N	0
27	153	86	24	250	10	\N	\N	\N	\N	\N	\N	500	delivered	2023-10-26 13:56:25	2023-10-26 18:11:39	149	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	653a739b27d36_1698329499.png	9	\N	\N	0
33	170	111	24	400	15	\N	\N	\N	\N	\N	\N	800	delivered	2023-10-27 07:44:31	2023-10-27 11:50:19	160	done	653b6bbb4f0e6_1698393019.png	9	\N	\N	0
44	232	139	6	5000	10	\N	\N	\N	\N	\N	\N	10000	delivered	2023-11-14 05:59:31	2023-11-14 10:01:33	197	hhhh	65530d3d5d579_1699941693.png	9	\N	\N	0
29	158	111	24	250	20	\N	\N	\N	\N	\N	\N	500	delivered	2023-10-27 05:38:39	2023-10-27 09:43:29	151	good	653b4e0135290_1698385409.png	9	\N	\N	0
54	262	111	55	2	0	\N	\N	\N	\N	\N	\N	4	journey_started	2023-11-15 09:53:15	2023-11-15 13:54:49	2	\N	\N	4	\N	\N	0
65	277	139	2	300	0	\N	\N	\N	\N	\N	\N	600	journey_started	2023-11-16 06:51:37	2023-11-16 10:52:51	251	\N	\N	4	\N	\N	0
34	172	107	24	1000	10	\N	\N	\N	\N	\N	\N	2000	delivered	2023-11-07 07:16:32	2023-11-07 11:19:06	162	dt٠فج	6549e4ea6468f_1699341546.png	9	\N	\N	0
30	158	86	24	400	20	\N	\N	\N	\N	\N	\N	800	delivered	2023-10-27 05:38:42	2023-10-27 09:46:25	150	done	653b4eb145716_1698385585.png	9	\N	\N	0
55	264	111	11	1	0	\N	\N	\N	\N	\N	\N	2	journey_started	2023-11-15 10:40:25	2023-11-15 14:54:21	2	\N	\N	4	\N	\N	0
47	245	139	2	1000	10	\N	\N	\N	\N	\N	\N	2000	delivered	2023-11-14 13:33:03	2023-11-14 17:33:29	217	ok	65537729aafe8_1699968809.png	9	\N	\N	0
31	161	86	24	250	15	\N	\N	\N	\N	\N	\N	500	delivered	2023-10-27 06:07:31	2023-10-27 10:08:57	154	shipped	653b53f94428e_1698386937.png	9	\N	\N	0
66	278	159	5	2000	0	\N	\N	\N	\N	\N	\N	4000	item_collected	2023-11-16 06:51:58	2023-11-16 10:55:33	3	\N	\N	5	\N	\N	0
36	219	139	5	5000	4	\N	\N	\N	\N	\N	\N	10000	journey_started	2023-11-13 11:05:33	2023-11-13 15:10:06	188	\N	\N	4	\N	\N	0
37	219	139	5	5000	4	\N	\N	\N	\N	\N	\N	10000	journey_started	2023-11-13 11:05:36	2023-11-13 15:10:06	188	\N	\N	4	\N	\N	0
38	222	37	2	400	15	\N	\N	\N	\N	\N	\N	800	accepted	2023-11-13 11:30:09	2023-11-13 11:30:09	191	\N	\N	0	\N	\N	0
32	170	114	24	250	5	\N	\N	\N	\N	\N	\N	500	delivered	2023-10-27 07:44:28	2023-10-27 11:49:24	159	delivered	653b6b84cc613_1698392964.png	9	\N	\N	0
56	265	111	11	1	0	\N	\N	\N	\N	\N	\N	2	journey_started	2023-11-15 10:57:08	2023-11-15 14:59:03	2	\N	\N	4	\N	\N	0
57	267	111	22	1	0	\N	\N	\N	\N	\N	\N	2	accepted	2023-11-15 12:09:03	2023-11-15 12:09:03	2	\N	\N	0	\N	\N	0
39	222	139	3	5000	10	\N	\N	\N	\N	\N	\N	10000	border_crossing	2023-11-13 11:30:25	2023-11-13 15:34:59	191	\N	\N	7	\N	\N	0
45	204	97	55	5	0	\N	\N	\N	\N	\N	\N	10	delivered	2023-11-14 07:18:08	2023-11-14 11:24:11	185	Test	6553209ba41af_1699946651.png	9	\N	\N	0
40	223	132	5	3	0	\N	\N	\N	\N	\N	\N	6	accepted	2023-11-13 12:14:09	2023-11-13 12:14:09	192	\N	\N	0	\N	\N	0
58	267	139	5	500	0	\N	\N	\N	\N	\N	\N	1000	accepted	2023-11-15 13:08:39	2023-11-15 13:08:39	2	\N	\N	0	\N	\N	0
48	247	139	2	2000	5	\N	\N	\N	\N	\N	\N	4000	delivered	2023-11-14 13:57:32	2023-11-14 17:57:59	220	okk	65537ce775b0b_1699970279.png	9	\N	\N	0
49	251	111	55	2	0	\N	\N	\N	\N	\N	\N	4	journey_started	2023-11-14 15:33:46	2023-11-14 19:34:32	221	\N	\N	4	\N	\N	0
35	181	83	3	222	0	\N	\N	\N	\N	\N	\N	444	delivered	2023-11-10 12:34:29	2023-11-13 16:26:45	169	ddx	65521605c3f42_1699878405.png	9	\N	\N	0
41	81	83	10	300	0	\N	\N	\N	\N	\N	\N	600	accepted	2023-11-13 13:33:21	2023-11-13 13:33:21	66	\N	\N	0	\N	\N	0
42	225	132	22	2	0	\N	\N	\N	\N	\N	\N	4	accepted	2023-11-13 14:38:32	2023-11-13 14:38:32	194	\N	\N	0	\N	\N	0
50	252	139	5	1000	10	\N	\N	\N	\N	\N	\N	2000	journey_started	2023-11-14 16:16:44	2023-11-14 20:17:00	222	\N	\N	4	\N	\N	0
43	226	83	12	1234	0	\N	\N	\N	\N	\N	\N	2468	delivered	2023-11-14 05:44:42	2023-11-14 11:27:53	195	test	6553217947cd6_1699946873.png	9	\N	\N	0
59	269	139	88	2	0	\N	\N	\N	\N	\N	\N	4	accepted	2023-11-15 13:56:49	2023-11-15 13:56:49	2	\N	\N	0	\N	\N	0
51	252	111	22	2	20	\N	\N	\N	\N	\N	\N	4	item_collected	2023-11-14 16:19:26	2023-11-14 20:19:46	222	\N	\N	5	\N	\N	0
52	253	111	22	2	10	\N	\N	\N	\N	\N	\N	4	journey_started	2023-11-14 16:30:21	2023-11-14 20:30:32	223	\N	\N	4	\N	\N	0
76	328	139	88	6	55	\N	\N	\N	\N	\N	\N	12	custom_clearance	2023-11-17 09:14:38	2023-11-18 16:34:25	273	\N	\N	8	\N	\N	0
62	272	139	5	250	0	\N	\N	\N	\N	\N	\N	500	item_collected	2023-11-15 15:09:38	2023-11-15 19:33:31	2	\N	\N	5	\N	\N	0
60	270	139	5	25000	0	\N	\N	\N	\N	\N	\N	50000	journey_started	2023-11-15 14:48:15	2023-11-15 18:48:46	2	\N	\N	4	\N	\N	0
68	82	83	10	300	10	\N	\N	\N	\N	\N	\N	600	accepted	2023-11-16 11:35:04	2023-11-16 11:35:04	67	\N	\N	0	\N	\N	0
61	271	139	5	250	0	\N	\N	\N	\N	\N	\N	500	journey_started	2023-11-15 14:54:57	2023-11-15 18:55:43	2	\N	\N	4	\N	\N	0
63	273	139	2	5000	0	\N	\N	\N	\N	\N	\N	10000	item_collected	2023-11-15 15:35:42	2023-11-15 19:36:22	2	\N	\N	5	\N	\N	0
67	279	139	55	2	0	\N	\N	\N	\N	\N	\N	4	custom_clearance	2023-11-16 07:21:43	2023-11-18 14:57:57	2	\N	\N	8	\N	\N	0
69	309	139	55	2	0	\N	\N	\N	\N	\N	\N	4	delivered	2023-11-16 13:43:17	2023-11-16 17:45:46	2	Test Comment	65561d0a06d4d_1700142346.png	9	\N	\N	0
70	317	139	33	3	0	\N	\N	\N	\N	\N	\N	6	delivered	2023-11-16 15:54:13	2023-11-16 19:57:16	263	test	65563bdc77c15_1700150236.png	9	\N	\N	0
64	259	83	12	2	0	\N	\N	\N	\N	\N	\N	4	delivered	2023-11-15 15:40:07	2023-11-16 23:48:45	1	test	6556721d14bf1_1700164125.png	9	\N	\N	0
72	322	139	11	1	55	\N	\N	\N	\N	\N	\N	2	delivered	2023-11-17 05:22:27	2023-11-17 09:52:47	267	test	6556ffaf42e11_1700200367.png	9	\N	\N	0
74	326	139	44	22	0	\N	\N	\N	\N	\N	\N	44	delivered	2023-11-17 08:50:29	2023-11-17 12:52:25	271	tesr	655729c90c709_1700211145.png	9	\N	\N	0
75	327	139	22	2	0	\N	\N	\N	\N	\N	\N	4	delivered	2023-11-17 09:07:05	2023-11-17 13:08:31	2	test	65572d8f714e3_1700212111.png	9	\N	\N	0
73	260	83	11	111	0	\N	\N	\N	\N	\N	\N	222	delivered	2023-11-17 06:10:12	2023-12-04 16:35:58	268	\N	656dc7ae53f94_1701693358.png	9	\N	\N	212
78	332	1	11	11	0	\N	\N	\N	\N	\N	\N	22	accepted	2023-11-17 10:11:02	2023-11-17 10:11:02	\N	\N	\N	0	\N	\N	0
77	330	139	22	2	0	\N	\N	\N	\N	\N	\N	4	delivered	2023-11-17 09:30:47	2023-11-17 13:31:45	275	test	65573301e9471_1700213505.png	9	\N	\N	0
79	335	1	67	5	0	\N	\N	\N	\N	\N	\N	10	accepted	2023-11-17 10:55:47	2023-11-17 10:55:47	\N	\N	\N	0	\N	\N	0
80	347	1	33	2	0	\N	\N	\N	\N	\N	\N	4	accepted	2023-11-17 12:39:06	2023-11-17 12:39:06	\N	\N	\N	0	\N	\N	0
82	349	1	0	120	0	\N	\N	\N	\N	\N	\N	240	accepted	2023-11-17 12:59:57	2023-11-17 12:59:57	\N	\N	\N	0	\N	\N	0
83	262	111	55	4	0	\N	\N	\N	\N	\N	\N	8	accepted	2023-11-17 13:21:39	2023-11-17 13:21:39	2	\N	\N	0	\N	\N	0
84	350	1	0	100	0	\N	\N	\N	\N	\N	\N	200	accepted	2023-11-17 13:31:20	2023-11-17 13:31:20	\N	\N	\N	0	\N	\N	0
85	355	1	0	100	0	\N	\N	\N	\N	\N	\N	200	accepted	2023-11-17 17:51:21	2023-11-17 17:51:21	\N	\N	\N	0	\N	\N	0
86	356	1	66	5	0	\N	\N	\N	\N	\N	\N	10	accepted	2023-11-17 18:03:22	2023-11-17 18:03:22	\N	\N	\N	0	\N	\N	0
94	375	1	0	0	0	\N	\N	\N	\N	\N	\N	0	accepted	2023-11-18 15:52:42	2023-11-18 15:52:42	\N	\N	\N	0	\N	\N	0
123	412	1	16	10000	5	\N	\N	\N	\N	\N	\N	20000	delivered	2023-11-21 11:12:49	2023-11-21 11:14:41	\N	\N	\N	9	\N	\N	0
98	216	83	11	23	0	\N	\N	\N	\N	\N	\N	46	delivered	2023-11-18 17:27:33	2023-11-18 20:49:11	299	\N	6558eb07229d5_1700326151.png	9	\N	\N	0
124	413	1	0	5000	0	\N	\N	\N	\N	\N	\N	10000	delivered	2023-11-21 11:21:17	2023-11-21 17:30:44	\N	\N	\N	9	\N	\N	0
87	357	139	66	6	0	\N	\N	\N	\N	\N	\N	12	delivered	2023-11-17 18:12:45	2023-11-17 18:14:07	281	test	6557752fd9cc8_1700230447.png	9	\N	\N	0
105	389	177	3	5000	20	\N	\N	\N	\N	\N	\N	10000	delivered	2023-11-19 10:47:40	2023-11-19 10:50:27	304	ok thank you so much for your support	6559b0335811f_1700376627.png	9	\N	\N	0
93	374	168	10	10000	10	\N	\N	\N	\N	\N	\N	20000	delivered	2023-11-18 15:50:58	2023-11-18 16:05:29	2	test	6558a88929f9a_1700309129.png	9	\N	\N	0
106	390	1	2	5000	0	\N	\N	\N	\N	\N	\N	10000	accepted	2023-11-19 11:20:55	2023-11-19 11:20:55	\N	\N	\N	0	\N	\N	0
107	391	1	2	1000	0	\N	\N	\N	\N	\N	\N	2000	accepted	2023-11-19 11:33:48	2023-11-19 11:33:48	\N	\N	\N	0	\N	\N	0
108	392	1	6	5000	0	\N	\N	\N	\N	\N	\N	10000	accepted	2023-11-19 11:37:10	2023-11-19 11:37:10	\N	\N	\N	0	\N	\N	0
88	358	139	33	3	0	\N	\N	\N	\N	\N	\N	6	delivered	2023-11-17 18:18:11	2023-11-17 18:18:46	282	tersr	65577646a730a_1700230726.png	9	\N	\N	0
109	393	1	10	100	10	\N	\N	\N	\N	\N	\N	200	accepted	2023-11-20 01:26:42	2023-11-20 01:26:42	\N	\N	\N	0	\N	\N	0
102	386	175	12	58000	10	\N	\N	\N	\N	\N	\N	116000	delivered	2023-11-19 09:15:09	2023-11-19 09:18:06	301	\N	65599a8e6b852_1700371086.png	9	\N	\N	0
95	377	139	20	1000	0	\N	\N	\N	\N	\N	\N	2000	delivered	2023-11-18 16:10:00	2023-11-18 16:14:57	295	do not want me or anything 😕	6558aac1bd069_1700309697.png	9	\N	\N	0
110	394	1	2	5000	10	\N	\N	\N	\N	\N	\N	10000	accepted	2023-11-20 08:56:53	2023-11-20 08:56:53	\N	\N	\N	0	\N	\N	0
92	372	139	5	25000	10	\N	\N	\N	\N	\N	\N	50000	delivered	2023-11-18 15:26:11	2023-11-18 16:36:22	291	tedt	6558afc63e1cb_1700310982.png	9	\N	\N	0
89	359	139	22	2	0	\N	\N	\N	\N	\N	\N	4	delivered	2023-11-17 18:22:21	2023-11-17 18:22:50	2	test	6557773a8fc2e_1700230970.png	9	\N	\N	0
96	378	1	3	255000	0	\N	\N	\N	\N	\N	\N	510000	accepted	2023-11-18 16:43:27	2023-11-18 16:43:27	\N	\N	\N	0	\N	\N	0
53	199	83	3	980	0	\N	\N	\N	\N	\N	\N	1960	delivered	2023-11-14 19:06:37	2023-11-18 16:55:50	181	test	6558b456c2e52_1700312150.png	9	\N	\N	0
111	399	1	4	1000	10	\N	\N	\N	\N	\N	\N	2000	accepted	2023-11-20 12:01:57	2023-11-20 12:01:57	\N	\N	\N	0	\N	\N	0
112	400	1	0	1000	20	\N	\N	\N	\N	\N	\N	2000	accepted	2023-11-20 12:35:29	2023-11-20 12:35:29	\N	\N	\N	0	\N	\N	0
113	401	1	0	1000	25	\N	\N	\N	\N	\N	\N	2000	accepted	2023-11-20 12:46:42	2023-11-20 12:46:42	\N	\N	\N	0	\N	\N	0
90	360	139	88	8	8	\N	\N	\N	\N	\N	\N	16	delivered	2023-11-17 19:12:04	2023-11-17 19:13:00	284	test	655782fc5be95_1700233980.png	9	\N	\N	0
97	381	168	22	10000	10	\N	\N	\N	\N	\N	\N	20000	border_crossing	2023-11-18 17:17:50	2023-11-18 17:21:11	297	\N	\N	7	\N	\N	0
114	402	1	0	1000	25	\N	\N	\N	\N	\N	\N	2000	accepted	2023-11-20 14:10:58	2023-11-20 14:10:58	\N	\N	\N	0	\N	\N	0
91	367	139	3	2500	10	\N	\N	\N	\N	\N	\N	5000	custom_clearance	2023-11-18 14:15:05	2023-11-18 14:30:49	2	\N	\N	8	\N	\N	0
115	403	1	0	2000	10	\N	\N	\N	\N	\N	\N	4000	accepted	2023-11-20 14:21:58	2023-11-20 14:21:58	\N	\N	\N	0	\N	\N	0
103	387	177	3	5000	10	\N	\N	\N	\N	\N	\N	10000	delivered	2023-11-19 10:08:04	2023-11-19 10:11:59	2	nice service 😃	6559a72fd483c_1700374319.png	9	\N	\N	0
71	319	83	6	23	0	\N	\N	\N	\N	\N	\N	46	delivered	2023-11-16 19:52:59	2023-11-18 14:38:55	1	test	6558943fe4647_1700303935.png	9	\N	\N	0
116	404	1	2	1000	10	\N	\N	\N	\N	\N	\N	2000	accepted	2023-11-20 14:49:41	2023-11-20 14:49:41	\N	\N	\N	0	\N	\N	0
117	405	1	2	1000	10	\N	\N	\N	\N	\N	\N	2000	accepted	2023-11-20 14:54:03	2023-11-20 14:54:03	\N	\N	\N	0	\N	\N	0
99	382	168	22	2000	10	\N	\N	\N	\N	\N	\N	4000	delivered	2023-11-18 17:27:46	2023-11-18 17:31:42	298	test	6558bcbe82dfe_1700314302.png	9	\N	\N	0
125	409	185	5	5000	0	\N	\N	\N	\N	\N	\N	10000	accepted	2023-11-30 08:25:32	2023-11-30 08:25:32	313	\N	\N	0	\N	\N	0
100	383	1	5	10000	0	\N	\N	\N	\N	\N	\N	20000	accepted	2023-11-18 17:38:12	2023-11-18 17:38:12	\N	\N	\N	0	\N	\N	0
101	384	1	3	1000	0	\N	\N	\N	\N	\N	\N	2000	accepted	2023-11-18 17:42:10	2023-11-18 17:42:10	\N	\N	\N	0	\N	\N	0
21	115	90	10	500	0	\N	\N	\N	\N	\N	\N	1000	delivered	2023-10-24 08:32:07	2023-11-30 17:47:21	106	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	65681d840054d_1701322116.png	9	\N	65681d8401d2d_1701322116.png	200
120	408	185	4	5000	10	\N	\N	\N	\N	\N	\N	10000	delivered	2023-11-21 09:59:17	2023-11-21 10:09:14	2	demo comment kkkk	655c498aa1177_1700546954.png	9	\N	\N	0
104	388	177	3	5000	10	\N	\N	\N	\N	\N	\N	10000	delivered	2023-11-19 10:28:25	2023-11-19 10:31:55	2	okay	6559abdb39c47_1700375515.png	9	\N	\N	0
121	410	1	12	5000	10	\N	\N	\N	\N	\N	\N	10000	delivered	2023-11-21 10:55:02	2023-11-21 10:57:26	\N	\N	\N	9	\N	\N	0
118	406	180	5	5000	30	\N	\N	\N	\N	\N	\N	10000	delivered	2023-11-20 15:20:19	2023-11-20 15:21:17	2	\N	655b412dd4062_1700479277.png	9	\N	\N	0
119	407	1	10	1000	25	\N	\N	\N	\N	\N	\N	2000	delivered	2023-11-20 15:26:06	2023-11-20 15:26:51	\N	\N	\N	9	\N	\N	0
122	411	1	3	10000	5	\N	\N	\N	\N	\N	\N	20000	delivered	2023-11-21 11:05:29	2023-11-21 11:06:30	\N	\N	\N	9	\N	\N	0
126	418	168	22	2	0	\N	\N	\N	\N	\N	\N	4	accepted	2023-12-01 14:57:39	2023-12-01 14:58:26	2	\N	\N	0	\N	\N	1
127	430	162	2	30	0	\N	\N	\N	\N	\N	\N	60	item_collected	2023-12-02 11:35:45	2023-12-02 12:18:35	2	\N	\N	5	\N	\N	15
128	432	185	5	5000	0	\N	\N	\N	\N	\N	\N	10000	journey_started	2023-12-02 12:07:47	2023-12-02 12:08:00	2	\N	\N	4	\N	\N	0
137	456	190	5	5000	0	\N	\N	\N	\N	\N	\N	10000	delivered	2024-06-03 14:34:34	2024-06-03 16:42:31	2	ko	665dba3703937_1717418551.png	9	\N	665dba3709ec6_1717418551.jpg	0
131	441	139	5	800	0	\N	\N	\N	\N	\N	\N	1600	item_collected	2023-12-04 14:50:46	2023-12-04 14:51:40	2	\N	\N	5	\N	\N	500
130	441	177	9	500	0	\N	\N	\N	\N	\N	\N	1000	journey_started	2023-12-04 14:50:46	2023-12-04 14:52:26	2	\N	\N	4	\N	\N	100
129	438	188	2	5000	0	\N	\N	\N	\N	\N	\N	10000	delivered	2023-12-04 13:59:17	2023-12-04 15:34:54	1	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	656db95e8411c_1701689694.png	9	\N	656db95e855e5_1701689694.png	500
133	444	1	2	5000	0	\N	\N	\N	\N	\N	\N	10000	accepted	2023-12-05 09:48:52	2023-12-05 09:48:52	\N	\N	\N	0	\N	\N	0
132	443	188	5	10000	0	\N	\N	\N	\N	\N	\N	20000	accepted	2023-12-05 09:48:40	2023-12-05 09:49:10	1	\N	\N	0	\N	\N	500
151	481	207	13	1500	0	\N	\N	\N	\N	\N	\N	3000	custom_clearance	2025-02-13 14:53:26	2025-02-13 14:53:47	9	\N	\N	8	\N	\N	0
146	471	192	7	5500	0	\N	\N	\N	\N	\N	\N	11000	on_the_way	2024-06-07 11:48:03	2024-06-07 11:52:52	8	\N	\N	6	\N	\N	2000
134	449	188	5	5000	0	\N	\N	\N	\N	\N	\N	10000	delivered	2023-12-26 08:34:53	2023-12-26 08:39:28	1	hello hhh y r u coming to the application	658a5900162df_1703565568.png	9	\N	658a590018035_1703565568.jpg	500
138	458	190	6	2500	0	\N	\N	\N	\N	\N	\N	5000	delivered	2024-06-03 16:48:11	2024-06-03 16:50:51	8	Delivered by me	665dbc2b114be_1717419051.png	9	\N	665dbc2b1294c_1717419051.jpg	500
135	452	190	2	25	0	\N	\N	\N	\N	\N	\N	50	delivered	2024-06-03 11:12:28	2024-06-03 11:17:20	2	ok delivered..	665d6e0047530_1717399040.png	9	\N	665d6e004dd90_1717399040.jpg	5
147	474	194	5	5000	0	\N	\N	\N	\N	\N	\N	10000	delivered	2024-07-05 11:26:37	2024-07-05 11:31:32	8	Note Test...	6687a15490ac1_1720164692.png	9	\N	6687a154935db_1720164692.jpg	1000
148	475	194	6	4000	0	\N	\N	\N	\N	\N	\N	8000	accepted	2024-07-05 11:40:25	2024-07-05 11:40:25	362	\N	\N	0	\N	\N	0
140	459	190	2	500	0	\N	\N	\N	\N	\N	\N	1000	delivered	2024-06-03 16:58:50	2024-06-03 17:01:35	348	\N	665dbeaf9b591_1717419695.png	9	\N	\N	0
141	460	1	2	500	0	\N	\N	\N	\N	\N	\N	1000	delivered	2024-06-03 17:03:49	2024-06-03 17:08:29	\N	\N	\N	9	\N	\N	0
136	453	190	3	500	0	\N	\N	\N	\N	\N	\N	1000	delivered	2024-06-03 11:19:33	2024-06-03 14:42:57	343	ok	665d9e310bed6_1717411377.png	9	\N	665d9e311030e_1717411377.jpg	0
142	462	1	2	1000	0	\N	\N	\N	\N	\N	\N	2000	accepted	2024-06-03 17:13:02	2024-06-03 17:13:02	\N	\N	\N	0	\N	\N	0
149	476	196	4	300	0	\N	\N	\N	\N	\N	\N	600	accepted	2024-09-18 13:34:46	2024-09-18 13:34:46	8	\N	\N	0	\N	\N	0
152	483	207	16	1200	0	\N	\N	\N	\N	\N	\N	2400	delivered	2025-02-13 20:25:13	2025-02-13 20:39:11	369	test	67ae202fe36d3_1739464751.png	9	\N	\N	100
153	486	1	12	4000	0	\N	\N	\N	\N	\N	\N	8000	accepted	2025-02-13 21:05:23	2025-02-13 21:05:23	\N	\N	\N	0	\N	\N	0
154	487	1	12	2000	0	\N	\N	\N	\N	\N	\N	4000	accepted	2025-02-13 21:22:53	2025-02-13 21:22:53	\N	\N	\N	0	\N	\N	0
155	490	1	0	500	0	\N	\N	\N	\N	\N	\N	1000	accepted	2025-02-13 21:41:09	2025-02-13 21:41:09	\N	\N	\N	0	\N	\N	0
143	463	190	9	5000	0	\N	\N	\N	\N	\N	\N	10000	delivered	2024-06-03 17:21:22	2024-06-03 17:22:46	8	Delivered by	665dc3a691da9_1717420966.png	9	\N	665dc3a695228_1717420966.jpg	0
144	470	190	5	500	0	\N	\N	\N	\N	\N	\N	1000	accepted	2024-06-05 11:47:56	2024-06-05 11:47:56	8	\N	\N	0	\N	\N	0
145	469	190	9	300	0	\N	\N	\N	\N	\N	\N	600	journey_started	2024-06-05 11:48:13	2024-06-05 11:48:30	8	\N	\N	4	\N	\N	0
139	457	190	2	500	0	\N	\N	\N	\N	\N	\N	1000	item_collected	2024-06-03 16:48:55	2024-06-05 11:48:45	346	\N	\N	5	\N	\N	0
150	480	207	20	2000	0	\N	\N	\N	\N	\N	\N	4000	delivered	2025-02-13 13:56:43	2025-02-13 14:12:43	9	test comments	67adc59b2d5e2_1739441563.png	9	\N	67adc59b2ee0c_1739441563.png	100
\.


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses (id, user_id, address, latitude, longitude, city_id, country_id, zip_code, created_at, updated_at, is_deleted, dial_code, phone, building) FROM stdin;
1	16	Building Materials Mall	25.16533880130602	55.46189738501064	1	1	286532	2023-08-08 11:02:42	2023-08-08 11:02:42	0	\N	\N	\N
2	44	Trade Centre	25.224144623109982	55.284972986352955	1	1	286532	2023-08-16 09:16:54	2023-08-16 09:16:54	0	\N	\N	\N
3	44	Premier Inn Dubai Dragon Mart Hotel	25.179631823378383	55.42361689867244	1	1	286532	2023-08-16 21:11:39	2023-08-16 21:11:39	0	\N	\N	\N
4	57	Premier Inn Dubai Dragon Mart Hotel	25.179631823378383	55.42361689867244	1	1	286532	2023-08-18 09:56:41	2023-08-18 09:56:41	0	1	1	\N
5	16	Trade Centre	25.224144623109982	55.284972986352955	1	1	286532	2023-08-18 10:23:29	2023-08-18 10:23:29	0	971	8277272939393939	\N
6	44	Lahore, Punjab, Pakistan	31.520369600000002	74.35874729999999	1	1	5000	2023-08-29 08:24:21	2023-08-29 08:24:21	0	92	030012345678	\N
7	70	Business Bay - Dubai - United Arab Emirates	25.183164700000003	55.272887	1	1	456	2023-09-04 12:04:54	2023-09-04 12:04:54	0	971	5248866658	\N
8	44	Salone Events, The Attic Hangar 8, Goodwood Aerodrome, Chichester PO18 0PH, UK	50.8588586	-0.754575	1	1	PO18 0PH	2023-09-05 09:20:10	2023-09-05 09:20:10	0	92	030012345678	\N
9	74	Trade Centre	25.224144623109982	55.284972986352955	1	1	286532	2023-10-07 10:18:11	2023-10-07 10:18:11	0	971	8277272939393939	\N
10	74	Trade Centre	25.224144623109982	55.284972986352955	1	1	286532	2023-10-07 10:18:13	2023-10-07 10:18:13	0	971	8277272939393939	\N
13	75	Zayed City - Abu Dhabi - United Arab Emirates	23.656830600000003	53.7033803	1	1	356	2023-10-07 17:49:33	2023-10-07 17:49:33	0	971	55424884664	\N
14	73	673C+W8M - Dubai - United Arab Emirates,	25.204851967284775	55.27078282088041	1	1	009	2023-10-09 14:09:00	2023-10-09 14:10:51	1	971	090078601	\N
15	73	673C+W8M - Dubai - United Arab Emirates,	25.204851967284775	55.27078282088041	1	1	009	2023-10-09 14:20:41	2023-10-09 14:20:54	1	971	090078601	\N
28	74	Umm Al Quain	25.26546546	55.5874386546	1	1	286532	2023-10-10 08:39:38	2023-10-10 08:39:38	0	971	8277272939393939	test building
16	73	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	33.51817079839341	73.10975063592196	1	1	1111	2023-10-09 14:58:40	2023-10-09 14:58:45	1	971	090078601	\N
27	77	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	33.51816520792708	73.1097187846899	1	1	28653	2023-10-09 23:09:08	2023-10-10 08:55:17	0	971	1470852369	\N
12	73	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	33.518045571861066	73.10975566506386	1	1	1112	2023-10-07 11:48:35	2023-10-09 15:01:59	0	971	090078601	\N
18	74	Umm Al Quain	25.26546546	55.5874386546	1	1	286532	2023-10-09 15:30:20	2023-10-09 15:30:20	0	971	8277272939393939	\N
19	73	Trade Centre	25.224144623109982	55.284972986352955	1	1	286532	2023-10-09 15:51:25	2023-10-09 15:57:40	1	971	8277272939393939	\N
17	73	Trade Centre	25.224144623109982	55.284972986352955	1	1	286532	2023-10-09 15:20:50	2023-10-09 15:57:44	1	971	8277272939393939	\N
20	77	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	33.566796971258476	73.1368114426732	1	1	0002	2023-10-09 15:59:31	2023-10-09 16:02:07	1	971	1470852369	\N
21	77	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	33.56679780935672	73.13680775463581	1	1	0002	2023-10-09 16:03:04	2023-10-09 16:18:31	1	971	1470852369	\N
23	78	238 Second Industrial St - Industrial Area_5 - Industrial Area - Sharjah - United Arab Emirates,	25.33090601907928	55.42093623429537	1	1	562	2023-10-09 17:09:37	2023-10-09 17:16:17	1	971	554251884	\N
24	78	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	25.18418871744177	55.25999028235674	1	1	utu	2023-10-09 17:16:38	2023-10-09 17:16:38	0	971	554251884	\N
22	77	H48P+VP6, Main Main PWD Rd, Block C Police Foundation, Rawalpindi, Punjab, Pakistan,	33.56705063528734	73.13677925616503	1	1	0002	2023-10-09 16:18:56	2023-10-09 22:16:45	1	971	1470852369	\N
26	77	Trade Centre	25.224144623109982	55.284972986352955	2	2	286532	2023-10-09 23:08:25	2023-10-09 23:08:25	0	971	8277272939393939	\N
37	109	17 Al Khwaher St - Jumeirah - Jumeirah 3 - Dubai - United Arab Emirates,	25.190578589794992	55.23016478866339	1	1	q2	2023-10-26 09:22:28	2023-10-26 09:22:28	0	971	554228898	Bayat 1
32	85	25W4+V62 - Jumeirah Park - Dubai - United Arab Emirates,	25.047127821877247	55.15551958233118	1	1	4567	2023-10-18 13:20:54	2023-10-18 16:07:42	0	971	552125893	Bayat Building
29	77	H48P+QXM, Block-A Block A Police Foundation, Islamabad, Punjab, Pakistan,	33.56686848894558	73.13735157251358	2	1	008	2023-10-10 09:08:05	2023-10-10 09:08:05	0	971	1470852369	Building 02
25	77	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	33.51638937801327	73.11086174100637	2	1	009	2023-10-09 23:05:27	2023-10-10 09:13:23	0	971	1470852369	Building Al Khaim
30	73	673C+W8M - Dubai - United Arab Emirates,	25.204851967284775	55.27078282088041	1	1	0098	2023-10-11 09:09:16	2023-10-11 09:09:16	0	971	090078601	building 09
11	73	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	25.194987682373487	55.27841404080391	1	1	0003	2023-10-07 11:39:05	2023-10-11 09:09:52	0	971	090078601	Building 09
31	85	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	25.184237262438835	55.259992964565754	1	1	9876	2023-10-18 13:19:31	2023-10-18 16:06:58	0	971	552125893	Al Manara Tower
33	85	57P5+23F Dubai Creek Boardwalk - Business Bay - Dubai - United Arab Emirates,	25.184102853430804	55.257748290896416	1	1	678	2023-10-18 16:08:12	2023-10-18 16:08:42	1	971	552125893	ghu
34	105	790 B Block, Millat Town Faisalabad, Punjab, Pakistan,	31.488138763909944	73.09930074959993	2	1	2300	2023-10-24 11:37:03	2023-10-24 11:37:03	0	971	3204504501	640 B
35	108	12 Marasi Dr - Business Bay - Bay Square - Dubai - United Arab Emirates,	25.185813143901825	55.2819012477994	1	1	01	2023-10-25 16:28:14	2023-10-25 16:28:14	0	971	524158669	Bay square
36	108	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	25.184230284096706	55.25999095290899	1	1	12	2023-10-25 16:28:58	2023-10-25 16:28:58	0	971	524158669	al manara tower
38	109	Office No: 303, 3rd Floor, Education Zone Bldg - Near Al Qusais Metro Station - اﻟﻘﺼﻴﺺ - القصيص ١ - دبي - United Arab Emirates,	25.276981694222343	55.37242949008942	1	1	09	2023-10-26 09:23:32	2023-10-26 09:23:32	0	971	554228898	al manara
39	110	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	25.184229070471947	55.2599922940135	1	1	12	2023-10-27 09:12:15	2023-10-27 09:12:15	0	971	5341889666	Al Manama
40	110	Sharjah International Airport - Sharjah International Airport - Sharjah - United Arab Emirates,	25.321364732892214	55.520540066063404	1	1	12	2023-10-27 09:12:49	2023-10-27 09:12:49	0	971	5341889666	Bayat
41	110	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	25.184230284096706	55.259993970394135	1	1	01	2023-10-27 09:16:59	2023-10-27 09:17:11	1	971	5341889666	Al Manara
42	113	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	25.184231497721463	55.25999363511801	1	1	10	2023-10-27 11:12:22	2023-10-27 11:12:22	0	971	544568266	Al Manara
43	113	Jumeirah Golf Estates	25.01920789158473	55.2010665088892	1	1	01	2023-10-27 11:13:06	2023-10-27 11:13:26	0	971	544568266	Bayat
44	84	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	22.489859563358984	88.37032735347748	2	1	700032	2023-11-07 11:02:16	2023-11-07 11:02:16	0	971	5515256547	Building 123
45	84	New Delhi	28.613939179213727	77.20902130007744	1	1	110021	2023-11-07 11:03:46	2023-11-07 11:03:46	0	971	5515256547	building 123
47	93	Dubai International Airport (DXB) - Dubai - United Arab Emirates	25.2566466	55.3641488	1	1	673638	2023-11-09 15:29:08	2023-11-09 15:29:08	0	971	7034526952	qvdss
48	137	79XM+M84 - Amman St - opposite of Carrefour Market - Al Qusais Industrial Area - Al Qusais Industrial Area 3 - Dubai - United Arab Emirates,	25.299383033068388	55.38365487009287	2	1	45546656	2023-11-12 15:37:47	2023-11-12 15:37:47	0	971	46466494664	al manara
49	137	79PC+W2M - Al Nahda - Al Nahda 2 - Dubai - United Arab Emirates,	25.287773935101477	55.37035413086414	1	1	46646657	2023-11-12 15:38:19	2023-11-12 15:38:19	0	971	46466494664	yuuu
69	141	45JR+CW4 - Umm Suqeim - Umm Suqeim 3 - Dubai - United Arab Emirates,	25.130547431957964	55.19329313188791	1	1	22	2023-11-13 17:02:32	2023-11-13 17:05:05	1	971	892052473	Test
50	133	7 46th St - Al Jaffiliya - Dubai - United Arab Emirates,	25.239864086059733	55.290537625551224	1	1	Test12	2023-11-13 09:41:33	2023-11-13 09:51:45	1	91	8920524739	Test1234
53	140	673C+W8M - Dubai - United Arab Emirates,	25.204851967284775	55.27078282088041	1	1	9876	2023-11-13 10:07:38	2023-11-13 11:33:15	1	971	1236547890	test
54	140	57PR+HR - Business Bay - Dubai - United Arab Emirates,	25.186422980892413	55.29201988130808	1	1	6445	2023-11-13 10:08:28	2023-11-13 11:33:17	1	971	1236547890	test 2
61	133	6727+556 - 13th St - Al Wasl - Dubai - United Arab Emirates,	25.168942204444328	55.24138446897268	1	1	tsrr	2023-11-13 13:20:44	2023-11-13 13:21:48	1	91	8920524739	del
60	133	673C+W8M - Dubai - United Arab Emirates,	25.20485257399441	55.27078282088041	1	1	test	2023-11-13 13:20:05	2023-11-13 13:21:51	1	91	8920524739	test1
51	133	673C+W8M - Dubai - United Arab Emirates,	25.20485257399441	55.27078282088041	1	1	Test1234	2023-11-13 09:51:36	2023-11-13 12:58:59	1	91	8920524739	Test123
52	133	567R+8R4 - Al Quoz - Al Quoz 3 - Dubai - United Arab Emirates,	25.1633635578166	55.24210296571255	1	1	..........	2023-11-13 09:53:06	2023-11-13 12:59:03	1	91	8920524739	Test12
55	133	1/2, Pusta Number 2, Sonia Vihar, Delhi, 110094, India,	28.723556895889136	77.24526666104794	2	1	hhhh	2023-11-13 12:48:41	2023-11-13 12:59:07	1	91	8920524739	Test123
56	133	673C+W8M - Dubai - United Arab Emirates,	25.20485257399441	55.27078282088041	1	1	1100001	2023-11-13 13:01:27	2023-11-13 13:05:20	1	91	8920524739	Test123
57	133	6739+5C7 - Al Wasl - Dubai - United Arab Emirates,	25.202846168692286	55.26875004172325	2	1	tttyyy	2023-11-13 13:02:57	2023-11-13 13:05:22	1	91	8920524739	test12
58	133	673C+W8M - Dubai - United Arab Emirates,	25.20485257399441	55.27078282088041	2	1	tt	2023-11-13 13:07:04	2023-11-13 13:18:05	1	91	8920524739	Test123
59	133	Dubai Investment Park 2, No: 597-381 - مجمع دبي للإستثمار - دبي - United Arab Emirates,	24.991217186448925	55.168881341814995	1	1	ggg	2023-11-13 13:07:44	2023-11-13 13:18:15	1	91	8920524739	trr
62	133	F93G+HW5 - Al Manhal - Abu Dhabi - United Arab Emirates,	24.453887367074184	54.37734369188547	2	1	ffff	2023-11-13 13:36:59	2023-11-13 13:36:59	0	91	8920524739	er
63	133	673C+W8M - Dubai - United Arab Emirates,	25.20485257399441	55.27078282088041	1	1	223	2023-11-13 13:47:40	2023-11-13 13:47:40	0	91	8920524739	tr
65	140	Dubai Fountain Street 2 - Business Bay - Dubai - United Arab Emirates,	25.19250358653989	55.28692200779915	1	1	369	2023-11-13 15:28:11	2023-11-13 15:35:36	1	971	1236547890	tedt two
64	140	673C+W8M - Dubai - United Arab Emirates,	25.204851967284775	55.27078282088041	1	1	321	2023-11-13 15:27:28	2023-11-13 15:50:08	1	971	1236547890	test one
67	140	40 Al Safa St - Dubai - United Arab Emirates,	25.207590320442	55.265136770904064	1	1	325	2023-11-13 15:49:52	2023-11-13 15:50:29	1	971	1236547890	test
66	140	57XH+39R - Financial Center Rd - Downtown Dubai - Dubai - United Arab Emirates,	25.197745066494228	55.27847472578287	1	1	2580	2023-11-13 15:29:28	2023-11-13 15:50:39	1	971	1236547890	test three
75	145	G929+88J, Poddar Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	22.500724271233974	88.36815275251865	1	1	688699	2023-11-14 12:56:17	2023-11-14 12:56:17	0	971	987466666	Building 321
68	141	673C+W8M - Dubai - United Arab Emirates,	25.20485257399441	55.27078282088041	1	1	25	2023-11-13 17:02:00	2023-11-13 17:05:02	1	971	892052473	test1
70	141	673C+W8M - Dubai - United Arab Emirates,	25.20485257399441	55.27078282088041	1	1	25	2023-11-13 17:05:48	2023-11-13 17:05:48	0	971	892052473	r
71	141	Expo Mall Road - Dubai - United Arab Emirates,	24.963634090988485	55.14040030539036	1	1	25	2023-11-13 17:06:13	2023-11-13 17:11:26	0	971	892052473	tesr1
73	142	673C+W8M - Dubai - United Arab Emirates,	25.20485257399441	55.27078282088041	1	1	22	2023-11-13 18:31:20	2023-11-13 18:31:20	0	971	000000000	test
72	142	46VG+6J8 - Al Quoz - Dubai - United Arab Emirates,	25.143800471524028	55.226107612252235	2	1	22	2023-11-13 18:30:47	2023-11-13 18:31:55	0	971	000000000	test
74	145	C/1B, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	22.4893236473253	88.37173450738192	1	1	988569	2023-11-14 12:55:49	2023-11-14 12:55:49	0	971	987466666	Building 123
77	146	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	25.091268543506686	55.24340819567442	1	1	55	2023-11-14 13:09:16	2023-11-14 13:09:16	0	971	8424554646	testtt
78	134	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	22.489857394916786	88.37032668292522	2	1	2555553	2023-11-14 17:52:14	2023-11-14 17:52:14	0	971	996666966	building
79	134	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	22.4898580144717	88.3703253418207	1	1	269855	2023-11-14 17:52:47	2023-11-14 17:52:47	0	971	996666966	building a
80	134	7/A, Indian Association For The Cultivation Of Science, Poddar Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	22.49779180727421	88.36903754621744	2	1	66555	2023-11-14 17:53:57	2023-11-14 17:53:57	0	971	996666966	ggh
76	146	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	28.704062438662817	77.10249032825232	4	2	22	2023-11-14 13:08:21	2023-11-14 20:13:09	0	971	8424554646	test1
81	146	50/2A, Cossipore, Newland, College Square, Kolkata, West Bengal 700012, India,	22.57264942688325	88.36389508098364	3	2	22	2023-11-14 20:13:38	2023-11-14 20:13:38	0	971	8424554646	test
82	134	C/1B, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	22.4893236473253	88.37173450738192	4	2	987566	2023-11-15 15:27:25	2023-11-15 15:27:25	0	971	996666966	Building 123
83	134	Green Zone, Jadavpur University, 188, Raja Subodh Chandra Mallick Rd, Jadavpur, Kolkata, West Bengal 700032, India,	22.49879015917199	88.37079741060735	3	2	668566	2023-11-15 15:37:55	2023-11-15 15:37:55	0	971	996666966	building 123
86	158	673C+W8M - Dubai - United Arab Emirates,	25.20485257399441	55.27078282088041	1	1	22	2023-11-16 10:15:33	2023-11-16 10:15:33	0	971	252525252525	Test
87	158	20 10th St - Al Quoz - Al Quoz Industrial Area 4 - Dubai - United Arab Emirates,	25.12422726775997	55.23475807160139	1	1	11	2023-11-16 10:16:28	2023-11-16 10:16:28	0	971	252525252525	Test
88	93	79V9+PVV Al Mattar Plaza - Al Nahda - Al Nahda 1 - Dubai - United Arab Emirates	25.2943707	55.3696736	1	1	234252525	2023-11-17 12:24:33	2023-11-17 12:24:33	0	268	463634634634	ftjtutru
84	157	673C+W8M - Dubai - United Arab Emirates,	25.20485257399441	55.27078282088041	1	1	22	2023-11-16 10:06:37	2023-11-17 13:23:15	1	971	5858585858	Test1
85	157	23 35B Street - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	25.12637277872611	55.242289043962955	1	1	11	2023-11-16 10:07:24	2023-11-17 13:23:17	1	971	5858585858	Test2
91	164	676C+GQC - 308th Rd - Al Satwa - Dubai - United Arab Emirates,	25.21099262400571	55.272051841020584	1	1	22	2023-11-17 13:26:06	2023-11-17 13:26:47	0	971	2222222222	Test
109	157	66 9B St - Al Barsha - Al Barsha 2 - Dubai - United Arab Emirates,	25.100315688721754	55.225210413336754	1	1	00	2023-12-02 12:58:42	2023-12-02 12:58:42	0	971	5858585858	tree
92	164	57H6+XJC - Dubai - United Arab Emirates,	25.179631166298204	55.260821767151356	1	1	22	2023-11-17 13:26:29	2023-11-17 13:27:39	0	971	2222222222	tesr
89	157	Boulevard Plaza Tower1 - الخليج التجاري - دبي - United Arab Emirates,	25.192103420296565	55.26691038161516	1	1	22	2023-11-17 13:23:58	2023-11-17 14:41:32	0	971	5858585858	test
90	157	Plot 365-161 - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	25.12605556845681	55.245706513524055	1	1	22	2023-11-17 13:24:31	2023-11-17 14:41:58	0	971	5858585858	test
93	169	EP-38, Regent Estate Rd, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	22.48982239005947	88.37020866572857	5	1	8875599	2023-11-18 10:13:07	2023-11-18 10:13:07	0	971	988559969	B
95	174	NMC Hospital 1 - Al Nahda - Al Nahda 2 - Dubai - United Arab Emirates,	25.29043433156714	55.36877363920212	5	1	133434	2023-11-18 15:07:01	2023-11-18 15:07:01	0	971	546469496	801
96	174	8C94+Q42 - Industrial Area_2 - Industrial Area - Sharjah - United Arab Emirates,	25.3194081368926	55.40528453886509	1	1	543466	2023-11-18 15:07:50	2023-11-18 15:07:50	0	971	546469496	4b
94	169	250, Sarat Park, Rajdanga, Kasba, Kolkata, West Bengal 700107, India,	22.513598251041575	88.39078087359667	7	2	700589	2023-11-18 11:18:04	2023-11-18 15:42:18	0	971	988559969	building
97	169	Rajpath Area, Central Secretariat, New Delhi, Delhi, India,	28.613939179213727	77.20902130007744	7	2	9875888	2023-11-18 17:02:21	2023-11-18 17:02:21	0	971	988559969	building 123
98	172	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	33.56680144111565	73.13681613653898	1	1	3690	2023-11-18 17:15:21	2023-11-18 17:15:21	0	971	369085264644	test
99	176	H83X+RW2, Jawaharlal Nehru Rd, Maidan, Kolkata, West Bengal 700071, India,	22.554515751347292	88.34976553916931	6	2	700085	2023-11-19 09:09:55	2023-11-19 09:09:55	0	91	984456666	Building 123
100	178	111, Bijoygarh, Regent Estate, Kolkata, West Bengal 700092, India,	22.48542069103458	88.36866404861212	6	2	700065	2023-11-19 09:50:49	2023-11-19 09:50:49	0	91	9875599669	Building 321
101	178	Netaji Subhash Chandra Bose International Airport (CCU), Jessore Rd, Dum Dum, Kolkata, West Bengal 700052, India,	22.653363897366845	88.44674952328205	6	2	900088	2023-11-19 10:03:20	2023-11-19 10:03:20	0	91	9875599669	Building 134
102	184	G9QH+852, Gobra, Kolkata, West Bengal 700046, India,	22.537531052096753	88.37775975465775	6	2	700008	2023-11-21 09:20:46	2023-11-21 09:20:46	0	971	987789969	Building 123
103	184	9/27, Jadavpur, Kolkata, West Bengal 700032, India,	22.49309360219301	88.36503267288208	6	2	700005	2023-11-21 09:21:38	2023-11-21 09:21:38	0	971	987789969	Building 321
104	172	VQ8R+8XX, Pahar Khedi, Madhya Pradesh 466554, India,	22.865300659347184	77.7916557714343	5	1	3690	2023-12-01 22:01:10	2023-12-01 22:01:10	0	971	369085264644	tes
107	157	556 6th St - Al Quoz - Al Quoz 3 - Dubai - United Arab Emirates,	25.161677229341123	55.239830799400806	5	1	25	2023-12-02 12:57:18	2023-12-02 12:57:18	0	971	5858585858	tesr
108	157	778C+62Q - Dubai Maritime City - Dubai - United Arab Emirates,	25.264055449960715	55.27177892625332	1	1	25	2023-12-02 12:58:06	2023-12-02 12:58:06	0	971	5858585858	tere
105	103	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	33.56680199984779	73.13683189451694	1	1	2563	2023-12-02 11:25:47	2023-12-02 13:51:22	1	971	1234567891	test
106	103	141 Street 62, Block C Media Town, Islamabad, Punjab 45720, Pakistan,	33.5611572240175	73.1147063523531	5	1	3680	2023-12-02 11:26:21	2023-12-02 13:52:31	1	971	1234567891	test
111	103	980 St 51, Bahria Town Phase II Phase 2 Bahria Town, Rawalpindi, Punjab 44000, Pakistan,	33.56092421717477	73.11388526111841	1	1	3214	2023-12-02 14:00:03	2023-12-02 14:02:03	1	971	1234567891	tedt 2
110	103	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	33.56679976491924	73.13681781291962	1	1	3690	2023-12-02 13:59:32	2023-12-02 14:02:20	1	971	1234567891	tes
112	187	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	28.70405920384049	77.10249032825232	7	2	1100854	2023-12-04 13:09:07	2023-12-04 13:09:07	0	971	987459971	1/5 Aay Apartment
113	187	7-I, Katju Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	22.49761772221553	88.36843002587557	6	2	98759	2023-12-04 13:09:51	2023-12-04 13:09:51	0	971	987459971	5/1 Yaa Apartment
114	103	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	33.566808145901	73.13681747764349	1	1	3690	2023-12-05 10:50:03	2023-12-05 10:50:03	0	971	1234567891	test
117	193	21/1A, East Rd, Bidhanpally, Jadavpur, Kolkata, West Bengal 700032, India,	22.495265693890627	88.36663596332073	6	2	700623	2024-06-07 11:24:33	2024-06-07 11:24:33	0	91	932274136	N Biswas
116	189	P-17B, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India,	22.52965559347034	88.36600497364998	6	2	987455	2024-05-29 14:55:35	2024-06-19 20:45:06	1	971	9883239126	321 Building
118	193	Unnamed Road, Rajasthan 305814, India,	26.836980190396655	74.8835326731205	7	2	963236	2024-06-07 11:26:57	2024-06-07 11:26:57	0	91	932274136	Biswas N
115	189	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	22.491632408374688	88.37047185748816	6	2	798266	2024-05-29 14:54:57	2024-06-19 20:45:01	1	971	9883239126	123 Building
119	189	44, Ananda Pally, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	22.49044349262854	88.36950492113829	6	2	685233	2024-06-19 20:45:40	2024-06-19 20:45:40	0	971	9883239126	N Biswas
120	189	36, Naskarpara, Santoshpur, Kolkata, West Bengal 700075, India,	22.494830782652873	88.37620407342911	6	2	289666	2024-06-19 20:46:32	2024-06-19 20:46:32	0	971	9883239126	N Biswas
121	189	16/5, Sukhpally, Haltu, Kolkata, West Bengal 700078, India,	22.500972693020703	88.38490046560764	6	2	258888	2024-06-19 20:47:35	2024-06-19 20:47:35	0	971	9883239126	N Biswas
122	195	673C+W8V - Dubai - United Arab Emirates,	25.204849237091366	55.27078282088041	1	1	58580	2024-09-18 12:44:59	2024-09-18 12:44:59	0	971	9847823799	building
123	195	Downtown Dubai - Dubai - United Arab Emirates,	25.19722963547897	55.27974709868431	1	1	88	2024-09-18 12:46:27	2024-09-18 12:46:27	0	971	9847823799	gff
124	202	57P6+4HW - Business Bay - Dubai - United Arab Emirates,	25.18542114756786	55.26112552732229	1	1	234646	2025-02-12 16:56:22	2025-02-12 16:56:22	0	971	987654321	4B
125	202	36 Samnan St - Samnan - Halwan - Sharjah - United Arab Emirates,	25.339379931937803	55.423766635358334	1	1	5465464	2025-02-12 16:59:57	2025-02-12 16:59:57	0	971	987654321	812
126	202	23 Qurn Shayiʹ St - Al Rawdah - W48 - Abu Dhabi - United Arab Emirates,	24.430129879081125	54.414748437702656	5	1	5466440	2025-02-13 13:39:15	2025-02-13 13:39:15	0	971	987654321	Al manran
127	198	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	33.56681010146329	73.13680876046419	1	1	25	2025-02-13 14:51:22	2025-02-13 14:51:22	0	971	369852147	b1
128	198	1, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan,	33.575210788256626	73.15215468406677	1	1	36	2025-02-13 14:51:53	2025-02-13 14:51:53	0	971	369852147	b2
130	191	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	25.184264265585096	55.26006203144789	1	1	2310	2025-02-13 18:43:23	2025-02-13 18:43:23	0	971	932172369	3272
129	191	10 19 Street - Al Layah - Sharjah - United Arab Emirates,	25.343050645322485	55.372970290482044	1	1	120	2025-02-13 18:42:59	2025-02-13 18:44:04	0	971	932172369	ghjhsks
\.


--
-- Data for Name: admin_designation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_designation (id, name, is_deletd) FROM stdin;
\.


--
-- Data for Name: app_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_settings (id, email, website, contact_numbers, created_at, updated_at) FROM stdin;
1	support@timexshipping.com	www.timexshipping.com	+971234567890	2023-10-10 10:00:00	2023-10-10 10:00:00
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
-- Data for Name: booking_carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_carts (id, is_collection, collection_address, deliver_address, sender_id, deligate_id, deligate_type, created_at, updated_at, device_cart_id, booking_number, parent_id, shipmenttype) FROM stdin;
629	1	105	106	103	1	ftl	2023-12-02 13:33:43	2023-12-02 13:33:43	507c25ffbc01d8ae	\N	0	0
135	1	43	42	113	1	ftl	2023-11-07 11:07:29	2023-11-07 11:07:29	30eb4e7290d67788	\N	0	0
647	1	112	113	187	2	\N	2023-12-26 08:51:25	2023-12-26 08:51:25	90ffc91b77d7350f	\N	0	3
709	1	127	128	198	1	ftl	2025-02-14 03:14:31	2025-02-14 03:14:31	c45bc1b1f4fd5071	\N	0	0
\.


--
-- Data for Name: booking_containers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_containers (id, booking_id, container_id, quantity, gross_weight, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: booking_deligate_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_deligate_details (id, item, booking_id, no_of_packages, dimension_of_each_package, weight_of_each_package, total_gross_weight, total_volume_in_cbm, created_at, updated_at, num_of_pallets) FROM stdin;
1	Fruits	70	10	222	5	50	225	2023-10-09 10:25:10	2023-10-09 10:25:10	0
2	Cosmetics	71	5	333	3	15	888	2023-10-09 10:36:10	2023-10-09 10:36:10	0
3	fruits	73	3	2222	12	45	2580	2023-10-09 17:23:34	2023-10-09 17:23:34	0
4	trst	76	5	222	2580	55	2587	2023-10-09 17:33:44	2023-10-09 17:33:44	0
5	apples	77	10	222	2	20	555	2023-10-10 17:16:50	2023-10-10 17:16:50	0
6	test	89	2	258	5	10	685	2023-10-16 17:16:20	2023-10-16 17:16:20	0
7	yesting	91	2	222	25	25	3258	2023-10-17 09:06:26	2023-10-17 09:06:26	0
8	testing fruits	105	4	3x2x1	3	12	7x6x5	2023-10-20 13:08:18	2023-10-20 13:08:18	0
9	phones Item	107	6	2x7x8	1	7	8x9x7	2023-10-20 16:51:40	2023-10-20 16:51:40	0
10	7447	108	5	25	250	34	25	2023-10-20 16:58:26	2023-10-20 16:58:26	0
11	45	117	2	25	25	23	12	2023-10-24 14:48:38	2023-10-24 14:48:38	0
12	363	121	525	13x56	12	42	23	2023-10-25 10:36:38	2023-10-25 10:41:37	0
13	Groceries	123	10	20	4	3	5	2023-10-25 17:32:34	2023-10-25 17:32:34	0
14	45	130	34	25	1000	23	12	2023-10-26 10:48:29	2023-10-26 10:48:29	0
15	123	142	10	5	6	12	10	2023-10-26 15:14:50	2023-10-26 15:14:50	0
16	Cloths	144	20	2x3x2	10	20	4x8x4	2023-10-26 15:19:53	2023-10-26 15:19:53	0
17	12	151	15	12x23	25	158	6765	2023-10-26 16:38:41	2023-10-26 16:38:41	0
18	24	154	2	12053	25	24	2158	2023-10-26 17:14:28	2023-10-26 17:14:28	0
19	3	155	25	45	21	25	427	2023-10-26 17:15:18	2023-10-26 17:15:18	0
20	123	157	3	3	4	66	50	2023-10-26 18:22:21	2023-10-26 18:22:21	0
21	13467	161	2	120x130	23	25	123	2023-10-27 10:02:51	2023-10-27 10:02:51	0
22	24567	163	25	35356447	12	212	246	2023-10-27 10:12:19	2023-10-27 10:12:19	0
23	Clothes	165	20	2x3x2	20	20	4x8x4	2023-10-27 10:27:02	2023-10-27 10:27:02	0
24	353	171	2	120x120	25	25	124	2023-10-27 11:52:31	2023-10-27 11:52:31	0
25	12	174	1	12	20	40	60	2023-11-09 11:14:14	2023-11-09 11:14:14	0
26	test	179	12	2x3x4	2	24	5x6x7	2023-11-10 10:47:33	2023-11-10 10:47:33	0
27	Cloths	187	20	2x3x2	10	20	4x8x4	2023-11-13 10:14:48	2023-11-13 10:14:48	0
28	Cloths	191	20	2x3x2	10	20	4x8x4	2023-11-13 10:27:35	2023-11-13 10:27:35	0
29	Test1	200	2	44	52	4	22	2023-11-13 13:49:40	2023-11-13 13:49:40	0
30	test	202	25	5262	6446	64646	2626	2023-11-13 13:56:48	2023-11-13 13:56:48	0
31	tedt	205	2	2x2x2	94	34	123	2023-11-13 14:05:33	2023-11-13 14:05:33	0
32	Cloths	206	20	2x3x2	10	20	4x8x4	2023-11-13 14:09:01	2023-11-13 14:09:01	0
33	test	207	21	4256	25	57	2131	2023-11-13 14:10:43	2023-11-13 14:10:43	0
34	tedt	208	3	22	25	67	324	2023-11-13 14:11:50	2023-11-13 14:11:50	0
35	test again	209	21	123	3	60	654	2023-11-13 14:15:46	2023-11-13 14:15:46	0
36	test again one	210	3	123	3	9	963	2023-11-13 14:19:06	2023-11-13 14:19:06	0
37	test again two	211	3	123	3	9	963	2023-11-13 14:19:27	2023-11-13 14:19:27	0
38	test air	212	2	321	2	4	321	2023-11-13 14:23:05	2023-11-13 14:23:05	0
39	test air one	213	2	321	2	4	321	2023-11-13 14:23:27	2023-11-13 14:23:27	0
40	test lcl	218	2	2x2x2	2	4	693	2023-11-13 14:30:09	2023-11-13 14:30:09	0
41	test ltl truck	227	6	2x3x4	2	12	3215	2023-11-13 22:42:57	2023-11-13 22:42:57	0
42	test air	228	12	9x8x7	2	24	7654	2023-11-13 22:54:42	2023-11-13 22:54:42	0
43	test lcl sea	230	13	2x4x5	3	36	6580	2023-11-13 23:24:07	2023-11-13 23:24:07	0
44	tedt	240	4	55	55	55	2	2023-11-14 13:11:42	2023-11-14 13:11:42	0
45	Test	247	4	3x4x6	5000	500	8	2023-11-14 17:54:25	2023-11-14 17:54:25	0
46	test	248	22	3	22	22	55	2023-11-14 17:56:59	2023-11-14 17:56:59	0
47	Thh	249	25	5x6x4	258	266	5446	2023-11-14 18:09:55	2023-11-14 18:09:55	0
48	test	250	22	55x555566	22	22	22	2023-11-14 18:10:26	2023-11-14 18:10:26	0
49	Groceries	256	10	20*1*10	100	10	5	2023-11-15 13:27:32	2023-11-15 13:27:32	0
50	test lcl	257	2	2x3x4	23	23	213.8	2023-11-15 13:27:44	2023-11-15 13:27:44	0
51	test ltl	260	2	2x3x4	2	23	213.64	2023-11-15 13:31:12	2023-11-15 13:31:12	0
52	Clothes	291	20	2x3x2	20	20	4x8x4	2023-11-16 16:44:33	2023-11-16 16:44:33	0
53	Clothes	292	20	2x3x2	20	20	4x8x4	2023-11-16 16:47:39	2023-11-16 16:47:39	0
54	Clothes	293	20	2x3x2	20	20	4x8x4	2023-11-16 16:48:43	2023-11-16 16:48:43	0
55	Clothes	294	20	2x3x2	20	20	4x8x4	2023-11-16 16:50:02	2023-11-16 16:50:02	0
56	Clothes	295	20	2x3x2	20	20	4x8x4	2023-11-16 17:07:40	2023-11-16 17:07:40	0
57	Clothes	296	20	2x3x2	20	20	4x8x4	2023-11-16 17:12:10	2023-11-16 17:12:10	0
58	Clothes	297	20	2x3x2	20	20	4x8x4	2023-11-16 17:13:27	2023-11-16 17:13:27	0
59	Clothes	298	20	2x3x2	20	20	4x8x4	2023-11-16 17:15:20	2023-11-16 17:15:20	0
60	Clothes	299	20	2x3x2	20	20	4x8x4	2023-11-16 17:16:33	2023-11-16 17:16:33	0
61	Clothes	300	20	2x3x2	20	20	4x8x4	2023-11-16 17:17:29	2023-11-16 17:17:29	0
63	Clothes	302	20	2x3x2	20	20	4x8x4	2023-11-16 17:19:00	2023-11-16 17:19:00	0
64	Clothes	303	20	2x3x2	20	20	4x8x4	2023-11-16 17:20:12	2023-11-16 17:20:12	0
62	HS C9865567	301	2	3x5x6	5000	15000	579	2023-11-16 17:18:55	2023-11-16 17:21:24	0
65	Clothes	304	20	2x3x2	20	20	4x8x4	2023-11-16 17:23:40	2023-11-16 17:23:40	0
66	Clothes	306	20	2x3x2	20	20	4x8x4	2023-11-16 17:24:36	2023-11-16 17:24:36	0
67	Clothes	308	20	2x3x2	20	20	4x8x4	2023-11-16 17:29:32	2023-11-16 17:29:32	0
68	Clothes	310	20	2x3x2	20	20	4x8x4	2023-11-16 17:40:12	2023-11-16 17:40:12	0
69	Clothes	311	20	2x3x2	20	20	4x8x4	2023-11-16 17:50:07	2023-11-16 17:50:07	0
70	Clothes	312	20	2x3x2	20	20	4x8x4	2023-11-16 18:04:04	2023-11-16 18:04:04	0
71	Clothes	313	20	2x3x2	20	20	4x8x4	2023-11-16 18:11:18	2023-11-16 18:11:18	0
72	Clothes	314	20	2x3x2	20	20	4x8x4	2023-11-16 18:19:07	2023-11-16 18:19:07	0
73	Clothes	315	20	2x3x2	20	20	4x8x4	2023-11-16 18:43:13	2023-11-16 18:43:13	0
74	7644677	316	5	65	25	64	85	2023-11-16 19:10:52	2023-11-16 19:10:52	0
75	Cloths	320	20	2x3x2	10	20	4x8x4	2023-11-17 07:41:27	2023-11-17 07:41:27	0
76	test	322	22	00	22	55	25	2023-11-17 09:18:55	2023-11-17 09:18:55	0
77	Cloths	323	20	2x3x2	10	20	4x8x4	2023-11-17 10:24:47	2023-11-17 10:24:47	0
78	Cloths	324	20	2x3x2	10	20	4x8x4	2023-11-17 10:32:47	2023-11-17 10:32:47	0
79	Cloths	325	20	2x3x2	10	20	4x8x4	2023-11-17 12:41:17	2023-11-17 12:41:17	0
80	test	326	2	22	22	22	22	2023-11-17 12:47:13	2023-11-17 12:47:13	0
81	tesr	328	22	44	22	22	22	2023-11-17 13:11:22	2023-11-17 13:11:22	0
82	Clothes	332	20	2x3x2	20	20	11	2023-11-17 14:09:30	2023-11-17 14:10:36	0
83	test	333	22	0	22	22	22	2023-11-17 14:42:37	2023-11-17 14:42:37	0
84	Clothes	334	20	2x3x2	20	20	4x8x4	2023-11-17 14:45:20	2023-11-17 14:45:20	0
85	Test	335	22	45	25	22	25	2023-11-17 14:54:19	2023-11-17 14:54:19	0
86	572828	336	23	5x8x8	23	36	399	2023-11-17 14:55:19	2023-11-17 14:55:19	0
87	Groceries	339	10	20*1*10	100	10	5	2023-11-17 15:42:35	2023-11-17 15:42:35	0
88	Groceries	340	10	20*1*10	100	10	5	2023-11-17 15:42:58	2023-11-17 15:42:58	0
89	Groceries	341	10	20*1*10	100	10	5	2023-11-17 15:43:41	2023-11-17 15:43:41	0
90	Groceries	342	10	20*1*10	100	10	5	2023-11-17 15:46:23	2023-11-17 15:46:23	0
91	Groceries	343	10	20*1*10	100	10	5	2023-11-17 15:48:00	2023-11-17 15:48:00	0
92	Clothes	344	20	2x3x2	20	20	4x8x4	2023-11-17 16:03:16	2023-11-17 16:03:16	0
93	Clothes	345	20	2x3x2	20	20	4x8x4	2023-11-17 16:06:50	2023-11-17 16:06:50	0
94	test	347	22	22	22	22	222	2023-11-17 16:37:21	2023-11-17 16:37:21	0
95	Test	348	22	55	22	22	55	2023-11-17 16:55:50	2023-11-17 16:55:50	0
96	Test	349	22	44	55	55	55	2023-11-17 16:58:57	2023-11-17 16:58:57	0
97	Clothes	350	20	2x3x2	20	20	10	2023-11-17 17:18:37	2023-11-17 17:20:32	0
98	45	351	5	4x4x4	23	23	23	2023-11-17 17:27:10	2023-11-17 17:27:10	0
99	Clothes	352	20	2x3x2	20	20	4x8x4	2023-11-17 17:36:57	2023-11-17 17:36:57	0
100	TestKaran	353	22	45	25	23	22	2023-11-17 17:38:13	2023-11-17 17:38:13	0
101	Clothes	354	20	2x3x2	20	20	4x8x4	2023-11-17 17:40:16	2023-11-17 17:40:16	0
102	Clothes	355	20	2x3x2	20	20	12	2023-11-17 17:50:07	2023-11-17 17:50:35	0
103	test	356	2	22	22	22	22	2023-11-17 18:01:45	2023-11-17 18:01:45	0
104	test	357	22	55	55	55	55	2023-11-17 18:11:01	2023-11-17 18:11:01	0
105	tesr1	358	22	33	22	22	22	2023-11-17 18:16:24	2023-11-17 18:16:24	0
106	Clothes	361	20	2x3x2	20	20	4x8x4	2023-11-18 08:33:49	2023-11-18 08:33:49	0
107	Clothes	362	20	2x3x2	20	20	4x8x4	2023-11-18 08:45:25	2023-11-18 08:45:25	0
108	Cloths	363	20	2x3x2	10	20	4x8x4	2023-11-18 08:54:00	2023-11-18 08:54:00	0
109	7546889	372	5	8x6x9	5800	5800	8000	2023-11-18 15:22:18	2023-11-18 15:22:18	0
110	Clothes	375	20	2x3x2	20	20	123	2023-11-18 15:51:19	2023-11-18 15:51:45	0
111	864679	377	5	24x65x46	2500	4500	5000	2023-11-18 16:03:05	2023-11-18 16:03:05	0
112	87557888	378	2	57x64x45	25000	58000	80000	2023-11-18 16:34:06	2023-11-18 16:34:06	0
114	test lcl	385	21	2x3x4	36	12	1.2	2023-11-18 17:54:04	2023-11-18 17:54:04	0
115	Packets	389	500	65x46x76	950	95	8000	2023-11-19 10:44:41	2023-11-19 10:44:41	0
116	Packets	390	500	75x45x65	25	500	8000	2023-11-19 11:19:15	2023-11-19 11:19:15	0
118	ok	404	5000	64x56x65	500	5000	5000	2023-11-20 14:48:38	2023-11-20 14:48:38	0
119	654	407	500	344x55	5000	588	8000	2023-11-20 15:25:09	2023-11-20 15:25:09	0
120	Packets	409	500	75x56x65	50	25000	80000	2023-11-21 10:29:02	2023-11-21 10:29:02	0
121	Packets	410	500	64x46x65	50	25000	8000	2023-11-21 10:50:54	2023-11-21 10:50:54	0
123	Cloths	414	20	2x3x2	10	20	10	2023-11-29 16:30:18	2023-11-29 16:31:11	20
124	test	415	3	2x3x4	3	9	36	2023-11-30 10:16:14	2023-11-30 10:16:14	8
125	Cloths	416	20	2x3x2	10	20	4x8x4	2023-11-30 11:23:27	2023-11-30 11:23:27	10
126	tedt	417	2	9x8x7	3	6	3.8	2023-11-30 11:46:22	2023-11-30 11:46:22	5
127	Clothes	419	20	2x3x2	20	20	4x8x4	2023-12-01 16:14:09	2023-12-01 16:14:09	0
128	Groceries	423	10	20*1*10	100	10	5	2023-12-02 08:32:47	2023-12-02 08:32:47	0
129	test	425	3	2x3x4	3	9	1.9	2023-12-02 10:21:39	2023-12-02 10:21:39	0
131	Packets	439	5000	45x45x54	50	50000	88800	2023-12-04 14:08:14	2023-12-04 14:08:14	500
132	packets	445	5000	64x64x46	5000	5000	5000	2023-12-05 09:45:34	2023-12-05 09:45:34	500
133	9755	453	1	2x5x4	25	28	258	2024-06-03 10:49:06	2024-06-03 10:49:06	1
134	hsj	454	346	2x4x5	979	97676	9797	2024-06-03 13:55:22	2024-06-03 13:55:22	979
135	864367888	457	2	633	5258	5888	2888	2024-06-03 15:14:47	2024-06-03 15:14:47	25
136	HS9764578	459	2	3x6x46	250	500	5000	2024-06-03 16:56:17	2024-06-03 16:56:17	3
137	HS97545788	460	2	6x8x63	500	1000	5000	2024-06-03 17:02:26	2024-06-03 17:02:26	0
139	package	473	25	34x43x46	500	5000	25000	2024-06-07 12:05:51	2024-06-07 12:05:51	5
140	Package of medicine	475	2000	23x43x40	50	100000	50000	2024-07-05 11:33:56	2024-07-05 11:33:56	1000
141	46YY	482	2	120x300x700	2000	200	200	2025-02-13 18:44:34	2025-02-13 18:44:34	120
142	dg34	483	5	3x5x6	2000	200	5000	2025-02-13 20:04:16	2025-02-13 20:04:16	100
143	42729	484	1	3x5x5x7	28	20	200	2025-02-13 20:28:53	2025-02-13 20:28:53	0
144	124	485	25	2x3x6x8	25	25	25	2025-02-13 20:44:27	2025-02-13 20:44:27	0
145	ety	486	7	2x3x6x8	23	235	235	2025-02-13 21:03:21	2025-02-13 21:10:11	0
\.


--
-- Data for Name: booking_extra_charges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_extra_charges (id, booking_id, accepted_quote_id, driver_id, extra_charge_id, extra_charge_name, extra_charge_amount, created_at, updated_at) FROM stdin;
2	106	14	83	1	\N	11	2023-12-01 08:11:31	2023-12-01 08:11:31
3	106	14	83	2	\N	23	2023-12-01 08:26:46	2023-12-01 08:26:46
4	106	14	83	4	other expenses description , other expenses description	33	2023-12-01 08:38:32	2023-12-01 08:38:32
6	260	73	83	4	test other description edit	12	2023-12-01 09:54:33	2023-12-01 10:08:49
5	260	73	83	1	\N	22	2023-12-01 09:53:47	2023-12-01 10:08:59
8	418	126	168	1	\N	25	2023-12-01 10:58:58	2023-12-01 10:58:58
9	418	126	168	4	tax	3	2023-12-01 11:00:01	2023-12-01 11:00:12
7	418	126	168	3	\N	666	2023-12-01 10:58:38	2023-12-01 11:00:22
10	430	127	162	4	test	12	2023-12-02 07:56:18	2023-12-02 07:56:18
11	430	127	162	4	cvhh	2	2023-12-02 07:56:57	2023-12-02 07:56:57
12	430	127	162	4	ghio	1	2023-12-02 07:57:29	2023-12-02 07:57:29
13	438	129	188	1	\N	500	2023-12-04 10:01:59	2023-12-04 10:02:15
14	438	129	188	1	\N	200	2023-12-04 10:02:29	2023-12-04 10:02:29
15	441	131	139	4	Otherrrrrr	100	2023-12-04 10:51:36	2023-12-04 10:51:36
16	441	130	177	3	\N	50	2023-12-04 10:52:24	2023-12-04 10:52:24
17	443	132	188	2	\N	500	2023-12-05 05:49:21	2023-12-05 05:49:21
18	449	134	188	4	Hello	1000	2023-12-26 04:37:18	2023-12-26 04:37:35
19	452	135	190	2	\N	3	2024-06-03 07:13:13	2024-06-03 07:13:23
20	471	146	192	1	\N	100	2024-06-07 07:50:15	2024-06-07 07:50:15
21	471	146	192	4	Custom duty	50	2024-06-07 07:51:55	2024-06-07 07:51:55
22	474	147	194	1	\N	500	2024-07-05 07:30:07	2024-07-05 07:30:07
23	474	147	194	4	Otherrrrr	100	2024-07-05 07:30:26	2024-07-05 07:30:26
24	480	150	207	1	\N	250	2025-02-13 10:06:38	2025-02-13 10:06:38
25	480	150	207	4	tip	100	2025-02-13 10:07:25	2025-02-13 10:07:25
26	483	152	207	1	\N	300	2025-02-13 16:34:11	2025-02-13 16:34:11
\.


--
-- Data for Name: booking_qoutes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_qoutes (id, booking_id, driver_id, price, hours, status, created_at, updated_at, comission_amount, is_admin_approved, booking_truck_id, qouted_at, statuscode) FROM stdin;
2	82	83	300	10	accepted	2023-10-16 15:31:02	2023-11-16 15:35:04	10	yes	67	2023-10-16 11:36:00	2
34	111	90	300	10	accepted	2023-10-24 11:22:24	2023-10-24 11:26:57	0	yes	99	2023-10-24 07:24:12	2
26	104	88	250	2	accepted	2023-10-19 12:39:19	2023-10-19 12:45:08	10	yes	93	2023-10-19 08:40:34	2
10	91	83	112	10	accepted	2023-10-17 15:07:45	2023-10-19 13:30:29	0	yes	85	2023-10-17 12:20:49	1
25	91	87	115	11	accepted	2023-10-19 12:33:36	2023-10-19 13:30:33	0	yes	85	2023-10-19 08:34:08	1
3	83	83	300	10	qouted	2023-10-16 15:58:23	2023-10-16 16:01:30	10	yes	68	2023-10-16 12:01:00	0
45	120	98	2000	20	qouted	2023-10-25 10:31:59	2023-10-25 10:32:42	0	no	114	2023-10-25 06:32:42	1
27	105	83	235	12	accepted	2023-10-20 13:11:15	2023-10-20 15:45:00	0	yes	94	2023-10-20 11:43:27	2
4	84	83	300	10	accepted	2023-10-16 16:04:21	2023-10-16 16:16:15	10	yes	69	2023-10-16 12:05:29	0
5	86	83	300	10	qouted	2023-10-16 16:30:06	2023-10-16 16:31:46	10	yes	71	2023-10-16 12:31:22	0
36	112	90	300	10	accepted	2023-10-24 11:35:59	2023-10-24 11:36:56	0	yes	101	2023-10-24 07:36:27	2
46	131	61	0	0	pending	2023-10-26 10:51:10	2023-10-26 10:51:10	0	no	126	\N	0
8	98	83	112	5	qouted	2023-10-17 12:45:28	2023-10-17 12:49:35	0	yes	81	2023-10-17 08:48:38	1
6	94	83	300	2	accepted	2023-10-17 10:48:22	2023-10-17 12:56:15	0	yes	77	2023-10-17 08:47:40	2
7	99	71	300	10	qouted	2023-10-17 12:43:12	2023-10-17 15:12:21	0	no	82	2023-10-17 11:12:21	1
37	112	97	300	10	accepted	2023-10-24 11:36:03	2023-10-24 11:41:59	0	yes	102	2023-10-24 07:38:50	2
38	114	90	0	0	pending	2023-10-24 12:08:44	2023-10-24 12:08:44	0	no	104	\N	0
11	102	83	300	10	accepted	2023-10-17 15:17:56	2023-10-17 15:28:26	5	yes	86	2023-10-17 11:18:37	2
12	97	83	0	0	pending	2023-10-18 08:48:46	2023-10-18 08:48:46	0	no	80	\N	0
13	95	83	0	0	pending	2023-10-18 08:51:16	2023-10-18 08:51:16	0	no	78	\N	0
14	89	83	0	0	pending	2023-10-18 08:53:12	2023-10-18 08:53:12	0	no	87	\N	0
15	80	83	0	0	pending	2023-10-18 09:06:22	2023-10-18 09:06:22	0	no	65	\N	0
16	76	83	0	0	pending	2023-10-18 12:27:53	2023-10-18 12:27:53	0	no	89	\N	0
17	73	83	0	0	pending	2023-10-18 12:31:54	2023-10-18 12:31:54	0	no	90	\N	0
18	71	83	0	0	pending	2023-10-18 12:33:18	2023-10-18 12:33:18	0	no	91	\N	0
19	70	83	0	0	pending	2023-10-18 12:45:35	2023-10-18 12:45:35	0	no	92	\N	0
20	68	83	111	7	qouted	2023-10-18 12:50:44	2023-10-18 12:52:13	0	yes	58	2023-10-18 08:51:41	1
39	114	97	300	10	accepted	2023-10-24 12:08:48	2023-10-24 12:09:38	0	yes	105	2023-10-24 08:09:12	2
21	104	86	250	2	qouted	2023-10-18 17:27:30	2023-10-18 17:28:41	10	no	93	2023-10-18 13:28:02	1
22	65	83	0	0	pending	2023-10-18 22:12:59	2023-10-18 22:12:59	0	no	55	\N	0
23	67	83	0	0	pending	2023-10-18 22:13:38	2023-10-18 22:13:38	0	no	57	\N	0
24	101	83	0	0	pending	2023-10-18 22:15:20	2023-10-18 22:15:20	0	no	84	\N	0
9	100	83	333	7	accepted	2023-10-17 13:28:37	2023-10-19 00:23:42	0	yes	83	2023-10-18 19:36:16	2
57	146	97	600	24	qouted	2023-10-26 15:31:44	2023-10-26 15:32:22	16	yes	141	2023-10-26 11:32:09	1
58	146	86	0	0	pending	2023-10-26 15:35:40	2023-10-26 15:35:40	0	no	142	\N	0
41	115	97	500	10	accepted	2023-10-24 12:15:39	2023-10-24 12:16:22	0	yes	107	2023-10-24 08:15:57	2
30	106	97	250	5	accepted	2023-10-20 15:48:28	2023-10-20 16:11:55	10	yes	96	2023-10-20 12:02:38	1
29	106	98	300	5	accepted	2023-10-20 15:48:25	2023-10-20 16:11:59	15	yes	95	2023-10-20 12:04:54	1
28	106	83	333	15	accepted	2023-10-20 15:48:21	2023-10-20 16:12:02	15	yes	95	2023-10-20 11:49:12	1
31	106	88	400	10	accepted	2023-10-20 15:48:32	2023-10-20 16:12:05	10	yes	97	2023-10-20 12:08:02	1
32	108	61	0	0	pending	2023-10-20 17:01:38	2023-10-20 17:01:38	0	no	98	\N	0
33	108	88	250	5	qouted	2023-10-20 17:02:02	2023-10-20 17:04:07	0	no	98	2023-10-20 13:04:07	1
47	130	86	1000	24	accepted	2023-10-26 10:53:51	2023-10-26 11:08:23	10	yes	127	2023-10-26 06:57:03	2
48	132	37	0	0	pending	2023-10-26 11:25:07	2023-10-26 11:25:07	0	no	128	\N	0
49	132	65	0	0	pending	2023-10-26 11:25:07	2023-10-26 11:25:07	0	no	128	\N	0
40	115	90	500	10	accepted	2023-10-24 12:15:35	2023-10-24 12:32:07	0	yes	106	2023-10-24 08:17:45	2
42	116	92	0	0	pending	2023-10-24 14:51:06	2023-10-24 14:51:06	0	no	108	\N	0
50	132	59	0	0	pending	2023-10-26 11:25:07	2023-10-26 11:25:07	0	no	128	\N	0
44	118	98	100	3	qouted	2023-10-24 16:40:59	2023-10-24 16:45:24	0	no	110	2023-10-24 12:45:24	1
51	132	66	0	0	pending	2023-10-26 11:25:07	2023-10-26 11:25:07	0	no	128	\N	0
52	135	86	0	0	pending	2023-10-26 11:41:11	2023-10-26 11:41:11	0	no	129	\N	0
53	139	66	0	0	pending	2023-10-26 12:36:47	2023-10-26 12:36:47	0	no	130	\N	0
54	140	64	0	0	pending	2023-10-26 12:43:38	2023-10-26 12:44:22	2	no	131	\N	0
55	138	65	0	0	pending	2023-10-26 14:50:13	2023-10-26 14:50:13	0	no	\N	\N	0
56	142	86	400	24	accepted	2023-10-26 15:16:39	2023-10-26 15:20:58	10	yes	134	2023-10-26 11:17:45	2
59	149	86	300	24	accepted	2023-10-26 15:51:12	2023-10-26 15:53:22	0	yes	146	2023-10-26 11:52:33	2
61	149	107	400	24	accepted	2023-10-26 15:51:19	2023-10-26 15:56:21	10	yes	146	2023-10-26 11:55:40	1
60	149	88	300	24	accepted	2023-10-26 15:51:15	2023-10-26 15:56:18	10	yes	146	2023-10-26 11:54:30	1
63	153	88	250	24	accepted	2023-10-26 17:54:27	2023-10-26 17:56:29	5	yes	149	2023-10-26 13:55:31	1
62	153	86	250	24	accepted	2023-10-26 17:54:23	2023-10-26 17:56:25	10	yes	149	2023-10-26 13:54:44	1
65	158	111	250	24	accepted	2023-10-27 09:32:52	2023-10-27 09:38:39	20	yes	151	2023-10-27 05:35:14	1
64	158	86	400	24	accepted	2023-10-27 09:32:48	2023-10-27 09:38:42	20	yes	150	2023-10-27 05:35:30	1
66	161	86	250	24	accepted	2023-10-27 10:04:16	2023-10-27 10:07:31	15	yes	154	2023-10-27 06:04:43	2
43	116	97	5550	2	qouted	2023-10-24 14:51:09	2023-11-11 14:20:21	3	yes	109	2023-11-11 10:20:21	1
35	111	97	2	2	qouted	2023-10-24 11:22:28	2023-11-13 15:06:29	0	no	100	2023-11-13 11:06:29	1
1	81	83	300	10	accepted	2023-10-11 09:27:58	2023-11-13 17:33:21	0	yes	66	2023-10-16 11:02:38	2
86	223	58	10	1	qouted	2023-11-13 15:57:21	2023-11-13 16:39:53	0	yes	192	2023-11-13 12:39:26	1
87	223	37	0	0	pending	2023-11-13 16:45:46	2023-11-13 16:45:46	0	no	192	\N	0
88	223	61	0	0	pending	2023-11-13 16:46:38	2023-11-13 16:46:38	0	no	192	\N	0
89	223	61	0	0	pending	2023-11-13 16:47:20	2023-11-13 16:47:20	0	no	192	\N	0
90	223	64	0	0	pending	2023-11-13 16:47:36	2023-11-13 16:47:36	0	no	192	\N	0
67	170	114	250	24	accepted	2023-10-27 11:40:11	2023-10-27 11:44:28	5	yes	159	2023-10-27 07:41:28	1
68	170	111	400	24	accepted	2023-10-27 11:40:14	2023-10-27 11:44:31	15	yes	160	2023-10-27 07:42:02	1
69	169	58	0	0	pending	2023-11-01 13:44:53	2023-11-01 13:44:53	0	no	161	\N	0
70	169	59	0	0	pending	2023-11-01 13:44:56	2023-11-01 13:44:56	0	no	161	\N	0
71	169	64	0	0	pending	2023-11-01 13:44:59	2023-11-01 13:45:20	10	no	161	\N	0
72	167	59	0	0	pending	2023-11-07 10:55:41	2023-11-07 10:55:41	0	no	158	\N	0
73	167	61	0	0	pending	2023-11-07 10:55:45	2023-11-07 10:55:45	0	no	158	\N	0
74	167	65	1000	24	qouted	2023-11-07 10:55:47	2023-11-07 10:56:53	10	no	158	2023-11-07 06:56:53	1
76	172	114	0	0	pending	2023-11-07 11:12:15	2023-11-07 11:12:15	0	no	162	\N	0
107	252	111	2	22	accepted	2023-11-14 20:18:33	2023-11-14 20:19:26	20	yes	222	2023-11-14 16:18:46	1
91	225	132	2	22	accepted	2023-11-13 18:33:31	2023-11-13 18:38:32	0	yes	194	2023-11-13 14:37:39	2
75	172	107	1000	24	accepted	2023-11-07 11:12:12	2023-11-07 11:16:32	10	yes	162	2023-11-07 07:15:19	2
77	177	65	0	0	pending	2023-11-09 17:44:45	2023-11-09 17:44:45	0	no	166	\N	0
79	181	83	222	3	accepted	2023-11-10 16:30:33	2023-11-10 16:34:29	0	yes	169	2023-11-10 12:30:57	2
92	223	97	2	55	qouted	2023-11-13 18:55:06	2023-11-13 18:58:04	0	no	192	2023-11-13 14:58:04	1
93	223	97	2	55	qouted	2023-11-13 18:57:42	2023-11-13 18:58:04	0	no	192	2023-11-13 14:58:04	1
94	223	97	2	55	qouted	2023-11-13 19:04:22	2023-11-13 19:04:41	0	no	192	2023-11-13 15:04:41	1
102	243	139	5000	2	accepted	2023-11-14 17:13:26	2023-11-14 17:18:57	10	yes	213	2023-11-14 13:15:18	2
78	178	97	22	2	qouted	2023-11-10 07:57:10	2023-11-13 15:04:20	0	no	167	2023-11-13 11:04:20	1
81	219	139	5000	5	accepted	2023-11-13 14:58:07	2023-11-13 15:05:33	4	yes	188	2023-11-13 10:58:53	1
80	219	139	5000	5	accepted	2023-11-13 14:57:59	2023-11-13 15:05:36	4	yes	188	2023-11-13 10:58:53	1
96	226	83	1234	12	accepted	2023-11-14 09:41:14	2023-11-14 09:44:42	0	yes	195	2023-11-14 05:42:21	2
117	267	139	500	5	accepted	2023-11-15 15:34:27	2023-11-15 17:08:39	0	yes	2	2023-11-15 11:34:27	2
120	269	111	2	55	qouted	2023-11-15 17:51:25	2023-11-15 17:51:25	0	no	2	2023-11-15 13:51:25	1
114	265	111	1	11	accepted	2023-11-15 14:56:22	2023-11-15 14:59:46	10	yes	2	2023-11-15 10:56:22	2
103	245	139	1000	2	accepted	2023-11-14 17:29:41	2023-11-14 17:33:03	10	yes	217	2023-11-14 13:29:54	2
83	222	37	400	2	accepted	2023-11-13 15:27:37	2023-11-13 15:30:09	15	yes	191	2023-11-13 11:28:17	1
82	222	139	5000	3	accepted	2023-11-13 15:25:04	2023-11-13 15:30:25	10	yes	191	2023-11-13 11:26:24	1
84	222	132	0	0	pending	2023-11-13 15:41:54	2023-11-13 15:41:54	0	no	191	\N	0
108	253	111	2	22	accepted	2023-11-14 20:29:20	2023-11-14 20:30:21	10	yes	223	2023-11-14 16:29:52	2
97	232	139	5000	77	qouted	2023-11-14 09:56:21	2023-11-14 10:10:39	66	yes	197	2023-11-14 06:10:39	1
85	223	132	3	5	accepted	2023-11-13 15:51:56	2023-11-13 16:14:09	0	yes	192	2023-11-13 12:00:05	2
95	223	97	5	55	qouted	2023-11-13 19:10:12	2023-11-14 11:15:23	0	no	192	2023-11-14 07:15:23	1
104	247	139	2000	2	accepted	2023-11-14 17:54:58	2023-11-14 17:57:32	5	yes	220	2023-11-14 13:56:01	2
98	204	97	5	55	accepted	2023-11-14 11:14:00	2023-11-14 11:18:08	0	yes	185	2023-11-14 07:17:37	2
99	233	111	2	55	qouted	2023-11-14 11:46:39	2023-11-14 12:39:37	0	yes	\N	2023-11-14 08:39:21	1
115	266	111	1	11	qouted	2023-11-15 15:29:51	2023-11-15 15:30:42	0	yes	2	2023-11-15 11:29:51	1
100	234	37	10	1	qouted	2023-11-14 13:01:13	2023-11-14 13:01:43	0	yes	199	2023-11-14 09:01:32	1
101	240	139	0	0	pending	2023-11-14 16:29:16	2023-11-14 16:29:16	0	no	211	\N	0
109	199	83	980	3	accepted	2023-11-14 23:05:09	2023-11-14 23:06:36	0	yes	181	2023-11-14 19:05:37	2
105	251	111	2	55	accepted	2023-11-14 19:32:48	2023-11-14 19:33:46	0	yes	221	2023-11-14 15:33:15	2
111	261	139	300	10	qouted	2023-11-15 13:50:17	2023-11-15 13:50:17	0	no	2	2023-11-15 09:50:17	1
106	252	139	1000	5	accepted	2023-11-14 20:14:11	2023-11-14 20:16:44	10	yes	222	2023-11-14 16:15:28	2
112	263	111	2	55	qouted	2023-11-15 14:20:24	2023-11-15 14:20:24	0	no	2	2023-11-15 10:20:24	1
113	264	111	1	11	accepted	2023-11-15 14:38:33	2023-11-15 14:40:25	0	yes	2	2023-11-15 10:38:33	2
119	268	111	1	11	qouted	2023-11-15 15:39:37	2023-11-15 15:39:37	0	no	2	2023-11-15 11:39:37	1
118	268	139	500	2	qouted	2023-11-15 15:39:33	2023-11-15 15:40:18	0	yes	2	2023-11-15 11:39:33	1
116	267	111	1	22	accepted	2023-11-15 15:34:10	2023-11-15 16:09:03	0	yes	2	2023-11-15 11:34:10	2
124	272	139	250	5	accepted	2023-11-15 19:09:18	2023-11-15 19:09:38	0	yes	2	2023-11-15 15:09:18	2
121	269	139	2	88	accepted	2023-11-15 17:55:13	2023-11-15 17:56:49	0	yes	2	2023-11-15 13:55:13	2
123	271	139	250	5	accepted	2023-11-15 18:54:08	2023-11-15 18:54:57	0	yes	2	2023-11-15 14:54:08	2
122	270	139	25000	5	accepted	2023-11-15 18:47:40	2023-11-15 18:48:15	0	yes	2	2023-11-15 14:47:40	2
125	273	139	5000	2	accepted	2023-11-15 19:35:05	2023-11-15 19:35:42	0	yes	2	2023-11-15 15:35:05	2
126	259	83	2	12	accepted	2023-11-15 19:37:01	2023-11-15 19:40:07	0	yes	1	2023-11-15 15:37:01	2
127	277	139	300	2	accepted	2023-11-16 10:44:59	2023-11-16 10:51:37	0	yes	251	2023-11-16 06:51:14	2
128	278	159	2000	5	accepted	2023-11-16 10:50:55	2023-11-16 10:51:58	0	yes	3	2023-11-16 06:50:55	2
129	279	139	2	55	accepted	2023-11-16 11:10:10	2023-11-16 11:21:43	0	yes	2	2023-11-16 07:10:10	2
131	278	160	123	20	qouted	2023-11-16 17:23:04	2023-11-16 17:23:04	0	no	3	2023-11-16 13:23:04	1
130	289	99	300	10	qouted	2023-11-16 16:18:02	2023-11-16 16:24:54	0	no	2	2023-11-16 12:24:54	1
110	262	111	4	55	accepted	2023-11-15 13:48:24	2023-11-17 17:21:39	0	yes	2	2023-11-15 10:33:22	2
132	309	139	2	55	accepted	2023-11-16 17:39:33	2023-11-16 17:43:17	0	yes	2	2023-11-16 13:39:33	2
133	289	139	2	55	qouted	2023-11-16 19:50:27	2023-11-16 19:50:27	0	no	2	2023-11-16 15:50:27	1
166	375	1	0	0	accepted	2023-11-18 11:51:00	2023-11-18 15:52:42	0	yes	\N	\N	2
157	357	139	6	66	accepted	2023-11-17 18:11:26	2023-11-17 18:12:45	0	yes	281	2023-11-17 02:11:46	2
134	317	139	3	33	accepted	2023-11-16 19:52:30	2023-11-16 19:54:13	0	yes	263	2023-11-16 03:53:33	2
135	319	83	23	6	accepted	2023-11-16 23:52:01	2023-11-16 23:52:59	0	yes	1	2023-11-16 19:52:01	2
137	321	139	2	55	qouted	2023-11-17 09:21:03	2023-11-17 09:21:03	0	no	2	2023-11-17 05:21:03	1
167	376	168	2	22	qouted	2023-11-18 16:02:10	2023-11-18 16:02:10	0	no	2	2023-11-18 12:02:10	1
158	358	139	3	33	accepted	2023-11-17 18:17:31	2023-11-17 18:18:11	0	yes	282	2023-11-17 02:17:52	2
136	322	139	1	11	accepted	2023-11-17 09:20:45	2023-11-17 09:22:27	55	yes	267	2023-11-17 05:21:51	2
138	260	83	111	11	accepted	2023-11-17 10:06:46	2023-11-17 10:10:12	0	yes	268	2023-11-17 06:08:19	2
139	323	58	0	0	pending	2023-11-17 10:25:41	2023-11-17 10:25:41	0	no	269	\N	0
159	359	139	2	22	accepted	2023-11-17 18:21:30	2023-11-17 18:22:21	0	yes	2	2023-11-17 14:21:30	2
140	323	99	100	15	qouted	2023-11-17 10:26:46	2023-11-17 10:35:43	0	yes	269	2023-11-17 06:34:21	1
141	325	159	0	0	pending	2023-11-17 12:43:59	2023-11-17 12:43:59	0	no	270	\N	0
169	377	168	2	55	qouted	2023-11-18 16:04:12	2023-11-18 16:07:17	0	no	295	2023-11-18 12:07:17	1
142	326	139	22	44	accepted	2023-11-17 12:49:14	2023-11-17 12:50:29	0	yes	271	2023-11-17 08:49:39	2
174	383	1	10000	5	accepted	2023-11-18 13:37:00	2023-11-18 17:38:12	0	yes	\N	\N	2
143	327	139	2	22	accepted	2023-11-17 13:06:09	2023-11-17 13:07:05	0	yes	2	2023-11-17 09:06:09	2
160	360	139	8	88	accepted	2023-11-17 19:11:19	2023-11-17 19:12:04	8	yes	284	2023-11-17 03:11:51	2
144	328	139	6	88	accepted	2023-11-17 13:11:53	2023-11-17 13:14:38	55	yes	273	2023-11-17 09:14:14	2
168	377	139	1000	20	accepted	2023-11-18 16:03:43	2023-11-18 16:10:00	0	yes	295	2023-11-18 12:08:50	2
170	378	1	255000	3	accepted	2023-11-18 12:37:00	2023-11-18 16:43:27	0	yes	\N	\N	2
145	330	139	2	22	accepted	2023-11-17 13:28:56	2023-11-17 13:30:47	0	yes	275	2023-11-17 09:30:20	2
146	332	1	11	11	accepted	2023-11-17 14:10:36	2023-11-17 14:11:02	0	yes	\N	\N	2
147	333	1	33	44	qouted	2023-11-17 14:45:22	2023-11-17 14:45:22	0	yes	\N	\N	0
148	335	1	5	67	accepted	2023-11-17 14:55:18	2023-11-17 14:55:47	0	yes	\N	\N	2
149	336	1	200	3	qouted	2023-11-17 15:24:20	2023-11-17 15:24:20	0	yes	\N	\N	0
150	347	1	2	33	accepted	2023-11-17 16:38:18	2023-11-17 16:39:06	0	yes	\N	\N	2
151	348	1	33	33	accepted	2023-11-17 16:56:19	2023-11-17 16:56:30	0	yes	\N	\N	2
152	349	1	120	0	accepted	2023-11-17 16:59:41	2023-11-17 16:59:57	0	yes	\N	\N	2
153	350	1	100	0	accepted	2023-11-17 17:20:32	2023-11-17 17:31:20	0	yes	\N	\N	2
154	353	1	56	77	qouted	2023-11-17 17:38:52	2023-11-17 17:38:52	0	yes	\N	\N	0
155	355	1	100	0	accepted	2023-11-17 17:50:35	2023-11-17 17:51:21	0	yes	\N	\N	2
156	356	1	5	66	accepted	2023-11-17 18:03:00	2023-11-17 18:03:22	0	yes	\N	\N	2
175	384	1	1000	3	accepted	2023-11-18 13:41:00	2023-11-18 17:42:10	0	yes	\N	\N	2
176	379	175	25000	2	qouted	2023-11-18 21:41:01	2023-11-18 21:41:01	0	no	2	2023-11-18 17:41:01	1
162	367	68	3000	1	qouted	2023-11-18 14:10:49	2023-11-18 14:11:36	20	yes	286	2023-11-18 10:11:10	1
161	367	139	2500	3	accepted	2023-11-18 13:51:13	2023-11-18 14:15:05	10	yes	2	2023-11-18 10:06:16	2
171	381	168	10000	22	accepted	2023-11-18 17:07:50	2023-11-18 17:17:50	10	yes	297	2023-11-18 05:12:33	2
163	372	139	25000	5	accepted	2023-11-18 15:23:57	2023-11-18 15:26:11	10	yes	291	2023-11-18 11:24:41	2
164	371	83	2	3	qouted	2023-11-18 15:36:09	2023-11-18 15:36:32	0	yes	1	2023-11-18 11:36:09	1
179	388	177	5000	3	accepted	2023-11-19 10:27:15	2023-11-19 10:28:25	10	yes	2	2023-11-19 10:27:42	2
165	374	168	10000	10	accepted	2023-11-18 15:47:20	2023-11-18 15:50:58	10	yes	2	2023-11-18 11:48:36	2
177	386	175	58000	12	accepted	2023-11-19 09:12:38	2023-11-19 09:15:09	10	yes	301	2023-11-19 05:12:57	2
184	393	1	100	10	accepted	2023-11-19 21:26:00	2023-11-20 01:26:42	10	yes	\N	\N	2
173	216	83	23	11	accepted	2023-11-18 17:26:53	2023-11-18 17:27:33	0	yes	299	2023-11-18 13:27:10	2
172	382	168	2000	22	accepted	2023-11-18 17:26:35	2023-11-18 17:27:46	10	yes	298	2023-11-18 05:27:07	2
185	394	1	5000	2	accepted	2023-11-20 04:56:00	2023-11-20 08:56:53	10	yes	\N	\N	2
178	387	177	5000	3	accepted	2023-11-19 10:06:45	2023-11-19 10:08:04	10	yes	2	2023-11-19 10:07:26	2
180	389	177	5000	3	accepted	2023-11-19 10:46:25	2023-11-19 10:47:40	20	yes	304	2023-11-19 06:46:57	2
181	390	1	5000	2	accepted	2023-11-19 07:20:00	2023-11-19 11:20:55	0	yes	\N	\N	2
182	391	1	1000	2	accepted	2023-11-19 07:33:00	2023-11-19 11:33:48	0	yes	\N	\N	2
183	392	1	5000	6	accepted	2023-11-19 07:36:00	2023-11-19 11:37:10	0	yes	\N	\N	2
186	399	1	1000	4	accepted	2023-11-20 08:01:00	2023-11-20 12:01:57	10	yes	\N	\N	2
193	400	1	1000	0	accepted	2023-11-20 08:29:00	2023-11-20 12:35:29	20	yes	\N	\N	2
194	401	1	1000	0	accepted	2023-11-20 08:40:00	2023-11-20 12:46:42	25	yes	\N	\N	2
195	402	1	1000	0	accepted	2023-11-20 10:10:00	2023-11-20 14:10:58	25	yes	\N	\N	2
196	403	1	2000	0	accepted	2023-11-20 10:21:00	2023-11-20 14:21:58	10	yes	\N	\N	2
197	404	1	1000	2	accepted	2023-11-20 10:49:00	2023-11-20 14:49:41	10	yes	\N	\N	2
198	405	1	1000	2	accepted	2023-11-20 10:53:00	2023-11-20 14:54:03	10	yes	\N	\N	2
199	406	180	5000	5	accepted	2023-11-20 15:19:36	2023-11-20 15:20:19	30	yes	2	2023-11-20 11:19:36	2
200	407	1	1000	10	accepted	2023-11-20 11:25:00	2023-11-20 15:26:06	25	yes	\N	\N	2
201	408	185	5000	4	accepted	2023-11-21 09:45:22	2023-11-21 09:59:17	10	yes	2	2023-11-21 09:57:50	2
203	410	1	5000	12	accepted	2023-11-21 06:52:00	2023-11-21 10:55:02	10	yes	\N	\N	2
204	411	1	10000	3	accepted	2023-11-21 07:04:00	2023-11-21 11:05:29	5	yes	\N	\N	2
205	412	1	10000	16	accepted	2023-11-21 07:12:00	2023-11-21 11:12:49	5	yes	\N	\N	2
206	413	1	5000	0	accepted	2023-11-21 07:20:00	2023-11-21 11:21:17	0	yes	\N	\N	2
202	409	185	5000	5	accepted	2023-11-21 10:31:37	2023-11-30 08:25:32	0	yes	313	2023-11-30 04:23:10	2
228	456	190	5000	5	accepted	2024-06-03 14:30:56	2024-06-03 14:34:34	0	yes	2	2024-06-03 10:30:56	2
251	483	207	1200	16	accepted	2025-02-13 20:09:13	2025-02-13 20:25:13	0	yes	369	2025-02-13 16:15:34	2
252	485	1	200	12	qouted	2025-02-13 16:45:00	2025-02-13 16:45:00	0	yes	\N	\N	0
207	418	168	2	22	accepted	2023-12-01 14:41:30	2023-12-01 14:57:39	0	yes	2	2023-12-01 14:48:13	2
208	429	1	0	0	qouted	2023-12-02 07:31:00	2023-12-02 07:34:00	0	yes	\N	\N	0
210	425	1	0	0	qouted	2023-12-02 07:34:00	2023-12-02 07:34:00	0	yes	\N	\N	0
209	430	162	30	2	accepted	2023-12-02 11:34:12	2023-12-02 11:35:45	0	yes	2	2023-12-02 07:34:12	2
242	475	194	4000	6	accepted	2024-07-05 11:36:28	2024-07-05 11:40:25	0	yes	362	2024-07-05 07:36:56	1
211	432	185	5000	5	accepted	2023-12-02 12:07:13	2023-12-02 12:07:47	0	yes	2	2023-12-02 08:07:13	2
230	458	190	2500	6	accepted	2024-06-03 16:45:37	2024-06-03 16:48:11	0	yes	8	2024-06-03 12:45:37	1
212	438	188	5000	2	accepted	2023-12-04 13:24:25	2023-12-04 13:59:17	0	yes	1	2023-12-04 09:24:25	2
213	439	188	5000	2	qouted	2023-12-04 14:41:10	2023-12-04 14:41:40	0	no	330	2023-12-04 10:41:40	1
214	439	177	400	5	qouted	2023-12-04 14:43:24	2023-12-04 14:43:43	0	no	331	2023-12-04 10:43:43	1
229	457	190	500	2	accepted	2024-06-03 15:44:43	2024-06-03 16:48:55	0	yes	346	2024-06-03 11:46:09	1
215	441	177	500	9	accepted	2023-12-04 14:48:26	2023-12-04 14:50:46	0	yes	2	2023-12-04 10:48:26	1
216	441	139	800	5	accepted	2023-12-04 14:49:48	2023-12-04 14:50:46	0	yes	2	2023-12-04 10:49:48	1
217	442	188	5000	5	qouted	2023-12-05 09:35:36	2023-12-05 09:37:02	0	yes	1	2023-12-05 05:35:36	1
220	445	188	5000	5	qouted	2023-12-05 09:46:35	2023-12-05 09:47:15	0	yes	336	2023-12-05 05:46:57	1
218	443	188	10000	5	accepted	2023-12-05 09:38:55	2023-12-05 09:48:40	0	yes	1	2023-12-05 05:38:55	2
219	444	1	5000	2	accepted	2023-12-05 05:43:00	2023-12-05 09:48:52	0	yes	\N	\N	2
221	446	1	50000	0	qouted	2023-12-05 06:05:00	2023-12-05 06:05:00	0	yes	\N	\N	0
222	447	188	5000	5	qouted	2023-12-05 10:13:49	2023-12-05 10:13:49	0	no	1	2023-12-05 06:13:49	1
223	449	188	5000	5	accepted	2023-12-26 08:33:36	2023-12-26 08:34:53	0	no	1	2023-12-26 04:33:36	1
225	432	190	250	5	qouted	2024-06-03 10:57:30	2024-06-03 10:57:43	0	no	2	2024-06-03 06:57:43	1
231	459	190	500	2	accepted	2024-06-03 16:57:31	2024-06-03 16:58:50	0	yes	348	2024-06-03 12:58:09	2
232	460	1	500	2	accepted	2024-06-03 13:03:00	2024-06-03 17:03:49	0	yes	\N	\N	2
233	461	1	500	2	qouted	2024-06-03 13:10:00	2024-06-03 13:10:00	0	yes	\N	\N	0
227	451	190	6	5	qouted	2024-06-03 11:04:44	2024-06-03 11:11:30	0	yes	2	2024-06-03 07:04:44	1
224	452	190	25	2	accepted	2024-06-03 10:56:39	2024-06-03 11:12:28	0	yes	2	2024-06-03 06:56:39	2
226	453	190	500	3	accepted	2024-06-03 11:00:44	2024-06-03 11:19:33	0	yes	343	2024-06-03 11:02:08	2
234	462	1	1000	2	accepted	2024-06-03 13:12:00	2024-06-03 17:13:02	0	yes	\N	\N	2
243	476	196	300	4	accepted	2024-09-18 13:33:18	2024-09-18 13:34:46	0	yes	8	2024-09-18 09:33:18	2
235	463	190	5000	9	accepted	2024-06-03 17:20:31	2024-06-03 17:21:22	0	yes	8	2024-06-03 13:20:31	2
244	477	190	200	5	qouted	2024-09-30 14:01:57	2024-09-30 14:01:57	0	no	8	2024-09-30 10:01:57	1
245	478	190	500	2	qouted	2024-09-30 14:06:35	2024-09-30 14:06:35	0	no	8	2024-09-30 10:06:35	1
236	470	190	500	5	accepted	2024-06-05 11:46:24	2024-06-05 11:47:56	0	yes	8	2024-06-05 07:46:24	2
237	469	190	300	9	accepted	2024-06-05 11:46:39	2024-06-05 11:48:13	0	yes	8	2024-06-05 07:46:39	2
246	479	204	500	12	qouted	2025-02-12 17:09:16	2025-02-12 17:09:16	0	no	9	2025-02-12 13:09:16	1
238	471	192	5500	7	accepted	2024-06-07 11:38:11	2024-06-07 11:48:03	0	yes	8	2024-06-07 11:44:12	2
239	472	192	5000	5	qouted	2024-06-07 12:03:27	2024-06-07 12:03:27	0	no	8	2024-06-07 08:03:27	1
240	473	192	0	0	pending	2024-06-07 12:10:50	2024-06-07 12:10:50	0	no	359	\N	0
248	480	204	300	12	qouted	2025-02-13 13:49:05	2025-02-13 13:49:05	0	no	9	2025-02-13 09:49:05	1
241	474	194	5000	5	accepted	2024-07-05 11:09:38	2024-07-05 11:26:37	0	yes	8	2024-07-05 07:09:38	2
253	486	1	4000	12	accepted	2025-02-13 17:04:00	2025-02-13 21:05:23	0	yes	\N	\N	2
247	480	207	2000	20	accepted	2025-02-13 13:43:11	2025-02-13 13:56:43	0	yes	9	2025-02-13 13:51:27	2
249	481	207	1500	13	accepted	2025-02-13 14:52:32	2025-02-13 14:53:26	0	yes	9	2025-02-13 10:52:32	2
250	483	206	0	0	pending	2025-02-13 20:09:09	2025-02-13 20:09:09	0	no	369	\N	0
254	487	1	2000	12	accepted	2025-02-13 17:16:00	2025-02-13 21:22:53	0	yes	\N	\N	2
255	488	1	200	10	qouted	2025-02-13 17:25:00	2025-02-13 17:25:00	0	yes	\N	\N	0
256	489	1	4000	0	qouted	2025-02-13 17:32:00	2025-02-13 17:32:00	0	yes	\N	\N	0
257	490	1	500	0	accepted	2025-02-13 17:40:00	2025-02-13 21:41:09	0	yes	\N	\N	2
\.


--
-- Data for Name: booking_reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_reviews (id, booking_id, customer_id, rate, comment, created_at, updated_at, status, updated_by) FROM stdin;
3	106	85	4	love your service	2023-10-20 12:28:51	2023-10-20 16:55:35	approve	1
2	94	73	2	test 2.5	2023-10-19 08:24:11	2023-10-20 16:55:49	approve	1
1	100	73	3	testing	2023-10-19 07:22:34	2023-10-20 16:55:59	approve	1
4	130	108	5	Nice to work with timex	2023-10-26 07:24:45	2023-10-26 12:40:57	approve	1
6	158	110	4.5	Good service	2023-10-27 05:50:08	2023-10-27 10:22:11	approve	1
5	142	73	4	good	2023-10-26 11:26:26	2023-10-27 10:22:20	approve	1
7	170	113	5	Good service	2023-10-27 07:50:51	2023-10-27 07:50:51	pending	\N
8	247	134	3.5	toke call me at the moment and your	2023-11-14 13:58:30	2023-11-14 17:58:57	approve	1
9	309	157	5	Best Service	2023-11-16 13:46:10	2023-11-16 13:46:10	pending	\N
10	317	157	1.5	test	2023-11-16 15:58:33	2023-11-16 15:58:33	pending	\N
11	259	73	1	tesr	2023-11-16 19:49:35	2023-11-16 19:49:35	pending	\N
12	322	157	2.5	trsr	2023-11-17 05:53:29	2023-11-17 05:53:29	pending	\N
13	333	157	2.5	test	2023-11-17 10:49:19	2023-11-17 14:52:32	approve	1
14	347	157	1.5	tesr	2023-11-17 12:39:36	2023-11-17 12:39:36	pending	\N
15	356	157	1.5	teest1	2023-11-17 18:09:16	2023-11-17 18:09:16	pending	\N
16	319	73	2.5	test 2.5	2023-11-18 15:54:12	2023-11-18 15:54:12	pending	\N
17	377	169	3.5	ok nice service 😃	2023-11-18 16:16:29	2023-11-18 16:16:29	pending	\N
18	378	169	3.5	okay sir thanks	2023-11-18 16:45:28	2023-11-18 16:45:28	pending	\N
19	383	169	3.5	hot water	2023-11-18 17:39:26	2023-11-18 17:39:26	pending	\N
20	386	176	3.5	okay sir thanks a big	2023-11-19 09:23:09	2023-11-19 09:24:13	approve	1
21	387	178	3.5	ok	2023-11-19 10:12:42	2023-11-19 10:12:42	pending	\N
22	388	178	4.5	ok nice service 😃	2023-11-19 10:32:17	2023-11-19 10:32:17	pending	\N
23	389	178	3	okay 👍	2023-11-19 10:51:11	2023-11-19 10:51:11	pending	\N
24	390	178	3.5	ok thank 👌	2023-11-19 11:22:02	2023-11-19 11:22:02	pending	\N
25	391	178	3	ok	2023-11-19 11:34:21	2023-11-19 11:34:21	pending	\N
26	392	178	3.5	ok	2023-11-19 11:37:58	2023-11-19 11:37:58	pending	\N
27	402	178	4	ghhj	2023-11-20 14:39:55	2023-11-20 14:39:55	pending	\N
28	408	184	3.5	nice service 😃	2023-11-21 10:09:44	2023-11-21 10:24:20	approve	1
29	438	187	4.5	ok nice 👍	2023-12-04 14:06:27	2023-12-04 14:06:27	pending	\N
30	480	202	5	dydufjfjgkg	2025-02-13 21:02:07	2025-02-13 21:02:07	pending	\N
\.


--
-- Data for Name: booking_status_trackings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_status_trackings (id, booking_id, status_tracking, created_at, updated_at, driver_id, statuscode, quote_id) FROM stdin;
1	84	request_created	2023-10-16 16:03:48	2023-10-16 16:03:48	83	0	0
3	94	request_created	2023-10-17 10:47:21	2023-10-17 10:47:21	83	0	0
5	102	request_created	2023-10-17 15:17:05	2023-10-17 15:17:05	83	0	0
77	111	request_created	2023-10-24 11:21:33	2023-10-24 11:21:33	90	0	16
78	111	accepted	2023-10-24 07:26:57	2023-10-24 11:21:33	90	2	16
80	111	item_collected	2023-10-24 07:32:28	2023-10-24 07:32:28	90	5	16
82	111	border_crossing	2023-10-24 07:32:38	2023-10-24 07:32:38	90	7	16
84	111	delivered	2023-10-24 07:32:59	2023-10-24 07:32:59	90	9	16
87	112	journey_started	2023-10-24 07:37:12	2023-10-24 07:37:12	90	4	17
89	112	on_the_way	2023-10-24 07:37:22	2023-10-24 07:37:22	90	6	17
91	112	custom_clearance	2023-10-24 07:37:31	2023-10-24 07:37:31	90	8	17
93	112	request_created	2023-10-24 11:35:07	2023-10-24 11:35:07	97	0	18
94	112	accepted	2023-10-24 07:41:59	2023-10-24 11:35:07	97	2	18
96	112	item_collected	2023-10-24 07:42:21	2023-10-24 07:42:21	97	5	18
98	112	border_crossing	2023-10-24 07:42:30	2023-10-24 07:42:30	97	7	18
161	153	delivered	2023-10-26 14:11:39	2023-10-26 14:11:39	86	9	27
100	112	delivered	2023-10-24 07:48:20	2023-10-24 07:48:20	97	9	18
25	100	request_created	2023-10-17 13:27:58	2023-10-17 13:27:58	83	0	0
103	114	journey_started	2023-10-24 08:09:59	2023-10-24 08:09:59	97	4	19
105	114	on_the_way	2023-10-24 08:10:07	2023-10-24 08:10:07	97	6	19
107	114	custom_clearance	2023-10-24 08:10:14	2023-10-24 08:10:14	97	8	19
109	115	request_created	2023-10-24 12:11:37	2023-10-24 12:11:37	97	0	20
110	115	accepted	2023-10-24 08:16:22	2023-10-24 12:11:37	97	2	20
33	104	request_created	2023-10-18 16:28:07	2023-10-18 16:28:07	88	0	0
112	115	delivered	2023-10-24 08:16:50	2023-10-24 08:16:50	97	9	20
115	115	journey_started	2023-10-24 08:32:57	2023-10-24 08:32:57	90	4	21
117	115	on_the_way	2023-10-24 08:33:05	2023-10-24 08:33:05	90	6	21
119	115	custom_clearance	2023-10-24 08:33:12	2023-10-24 08:33:12	90	8	21
121	120	request_created	2023-10-25 10:31:59	2023-10-25 10:31:59	\N	0	0
41	91	request_created	2023-10-17 09:06:26	2023-10-17 09:06:26	83	0	0
43	91	request_created	2023-10-17 09:06:26	2023-10-17 09:06:26	87	0	0
122	128	request_created	2023-10-26 10:28:00	2023-10-26 10:28:00	\N	0	0
124	131	request_created	2023-10-26 10:51:10	2023-10-26 10:51:10	\N	0	0
48	105	request_created	2023-10-20 13:08:18	2023-10-20 13:08:18	83	0	0
127	130	journey_started	2023-10-26 07:10:21	2023-10-26 07:10:21	86	4	22
129	130	on_the_way	2023-10-26 07:23:12	2023-10-26 07:23:12	86	6	22
131	130	custom_clearance	2023-10-26 07:23:45	2023-10-26 07:23:45	86	8	22
133	132	request_created	2023-10-26 11:25:07	2023-10-26 11:25:07	\N	0	0
135	135	request_created	2023-10-26 11:41:11	2023-10-26 11:41:11	\N	0	0
137	140	request_created	2023-10-26 12:43:38	2023-10-26 12:43:38	64	0	0
140	142	journey_started	2023-10-26 11:24:24	2023-10-26 11:24:24	86	4	23
142	142	on_the_way	2023-10-26 11:25:05	2023-10-26 11:25:05	86	6	23
144	142	custom_clearance	2023-10-26 11:25:23	2023-10-26 11:25:23	86	8	23
146	149	request_created	2023-10-26 15:46:35	2023-10-26 15:46:35	86	0	24
147	149	accepted	2023-10-26 11:53:22	2023-10-26 15:46:35	86	2	24
152	153	request_created	2023-10-26 17:12:44	2023-10-26 17:12:44	86	0	27
153	153	accepted	2023-10-26 13:56:25	2023-10-26 17:12:44	86	2	27
154	153	request_created	2023-10-26 17:12:44	2023-10-26 17:12:44	88	0	28
155	153	accepted	2023-10-26 13:56:29	2023-10-26 17:12:44	88	2	28
2	84	accepted	2023-10-16 12:16:15	2023-10-16 16:03:48	83	2	0
4	94	accepted	2023-10-17 08:56:15	2023-10-17 10:47:21	83	2	0
6	102	accepted	2023-10-17 11:28:26	2023-10-17 15:17:05	83	2	0
26	100	accepted	2023-10-18 20:23:42	2023-10-17 13:27:58	83	2	0
34	104	accepted	2023-10-19 08:45:08	2023-10-18 16:28:07	88	2	0
42	91	accepted	2023-10-19 09:30:29	2023-10-17 09:06:26	83	2	0
44	91	accepted	2023-10-19 09:30:33	2023-10-17 09:06:26	87	2	0
49	105	accepted	2023-10-20 11:45:00	2023-10-20 13:08:18	83	2	0
157	153	item_collected	2023-10-26 13:57:13	2023-10-26 13:57:13	86	5	27
159	153	border_crossing	2023-10-26 13:57:20	2023-10-26 13:57:20	86	7	27
163	153	item_collected	2023-10-26 13:57:50	2023-10-26 13:57:50	88	5	28
7	102	journey_started	2023-10-17 11:38:14	2023-10-17 11:38:14	83	4	0
13	94	journey_started	2023-10-17 12:57:51	2023-10-17 12:57:51	83	4	0
19	84	journey_started	2023-10-18 06:13:27	2023-10-18 06:13:27	83	4	0
27	100	journey_started	2023-10-18 23:18:01	2023-10-18 23:18:01	83	4	0
35	104	journey_started	2023-10-19 08:47:58	2023-10-19 08:47:58	88	4	0
45	91	journey_started	2023-10-19 11:39:53	2023-10-19 11:39:53	83	4	0
50	105	journey_started	2023-10-20 11:45:34	2023-10-20 11:45:34	83	4	0
165	153	border_crossing	2023-10-26 13:57:56	2023-10-26 13:57:56	88	7	28
167	153	delivered	2023-10-26 13:58:07	2023-10-26 13:58:07	88	9	28
174	158	on_the_way	2023-10-27 05:42:55	2023-10-27 05:42:55	111	6	29
9	102	on_the_way	2023-10-17 11:39:39	2023-10-17 11:39:39	83	6	0
53	106	request_created	2023-10-20 15:42:41	2023-10-20 15:42:41	98	0	13
54	106	accepted	2023-10-20 12:11:59	2023-10-20 15:42:41	98	2	13
59	106	journey_started	2023-10-20 12:16:22	2023-10-20 12:16:22	98	4	13
51	106	request_created	2023-10-20 15:42:41	2023-10-20 15:42:41	97	0	12
52	106	accepted	2023-10-20 12:11:55	2023-10-20 15:42:41	97	2	12
60	106	journey_started	2023-10-20 12:19:17	2023-10-20 12:19:17	97	4	12
57	106	request_created	2023-10-20 15:42:41	2023-10-20 15:42:41	88	0	15
58	106	accepted	2023-10-20 12:12:05	2023-10-20 15:42:41	88	2	15
61	106	journey_started	2023-10-20 12:21:03	2023-10-20 12:21:03	88	4	15
55	106	request_created	2023-10-20 15:42:41	2023-10-20 15:42:41	83	0	14
56	106	accepted	2023-10-20 12:12:02	2023-10-20 15:42:41	83	2	14
172	158	journey_started	2023-10-27 05:42:32	2023-10-27 05:42:32	111	4	29
175	158	border_crossing	2023-10-27 05:43:03	2023-10-27 05:43:03	111	7	29
176	158	custom_clearance	2023-10-27 05:43:10	2023-10-27 05:43:10	111	8	29
177	158	delivered	2023-10-27 05:43:29	2023-10-27 05:43:29	111	9	29
178	158	journey_started	2023-10-27 05:45:19	2023-10-27 05:45:19	86	4	30
179	158	item_collected	2023-10-27 05:45:37	2023-10-27 05:45:37	86	5	30
180	158	on_the_way	2023-10-27 05:45:58	2023-10-27 05:45:58	86	6	30
181	158	border_crossing	2023-10-27 05:46:03	2023-10-27 05:46:03	86	7	30
182	158	custom_clearance	2023-10-27 05:46:11	2023-10-27 05:46:11	86	8	30
8	102	item_collected	2023-10-17 11:39:34	2023-10-17 11:39:34	83	5	0
14	94	item_collected	2023-10-17 17:16:10	2023-10-17 17:16:10	83	5	0
20	84	item_collected	2023-10-18 06:15:00	2023-10-18 06:15:00	83	5	0
28	100	item_collected	2023-10-18 23:23:03	2023-10-18 23:23:03	83	5	0
36	104	item_collected	2023-10-19 08:50:02	2023-10-19 08:50:02	88	5	0
46	91	item_collected	2023-10-19 16:40:39	2023-10-19 16:40:39	83	5	0
15	94	on_the_way	2023-10-17 17:40:57	2023-10-17 17:40:57	83	6	0
21	84	on_the_way	2023-10-18 06:16:09	2023-10-18 06:16:09	83	6	0
29	100	on_the_way	2023-10-18 23:25:29	2023-10-18 23:25:29	83	6	0
37	104	on_the_way	2023-10-19 08:51:30	2023-10-19 08:51:30	88	6	0
47	91	on_the_way	2023-10-19 18:01:37	2023-10-19 18:01:37	83	6	0
10	102	border_crossing	2023-10-17 11:52:00	2023-10-17 11:52:00	83	7	0
16	94	border_crossing	2023-10-17 17:44:37	2023-10-17 17:44:37	83	7	0
22	84	border_crossing	2023-10-18 06:17:36	2023-10-18 06:17:36	83	7	0
30	100	border_crossing	2023-10-18 23:26:19	2023-10-18 23:26:19	83	7	0
38	104	border_crossing	2023-10-19 08:52:01	2023-10-19 08:52:01	88	7	0
11	102	custom_clearance	2023-10-17 11:52:10	2023-10-17 11:52:10	83	8	0
17	94	custom_clearance	2023-10-17 17:45:44	2023-10-17 17:45:44	83	8	0
23	84	custom_clearance	2023-10-18 06:18:35	2023-10-18 06:18:35	83	8	0
31	100	custom_clearance	2023-10-18 23:28:18	2023-10-18 23:28:18	83	8	0
39	104	custom_clearance	2023-10-19 08:52:17	2023-10-19 08:52:17	88	8	0
12	102	delivered	2023-10-17 11:52:21	2023-10-17 11:52:21	83	9	0
18	94	delivered	2023-10-18 04:54:27	2023-10-18 04:54:27	83	9	0
24	84	delivered	2023-10-18 06:23:45	2023-10-18 06:23:45	83	9	0
32	100	delivered	2023-10-18 23:29:35	2023-10-18 23:29:35	83	9	0
40	104	delivered	2023-10-19 08:53:08	2023-10-19 08:53:08	88	9	0
63	106	item_collected	2023-10-20 12:21:25	2023-10-20 12:21:25	98	5	13
66	106	on_the_way	2023-10-20 12:21:37	2023-10-20 12:21:37	98	6	13
69	106	border_crossing	2023-10-20 12:21:50	2023-10-20 12:21:50	98	7	13
71	106	custom_clearance	2023-10-20 12:21:59	2023-10-20 12:21:59	98	8	13
74	106	delivered	2023-10-20 12:22:30	2023-10-20 12:22:30	98	9	13
62	106	item_collected	2023-10-20 12:21:21	2023-10-20 12:21:21	97	5	12
67	106	on_the_way	2023-10-20 12:21:39	2023-10-20 12:21:39	97	6	12
68	106	border_crossing	2023-10-20 12:21:45	2023-10-20 12:21:45	97	7	12
72	106	custom_clearance	2023-10-20 12:22:01	2023-10-20 12:22:01	97	8	12
75	106	delivered	2023-10-20 12:22:45	2023-10-20 12:22:45	97	9	12
64	106	item_collected	2023-10-20 12:21:27	2023-10-20 12:21:27	88	5	15
65	106	on_the_way	2023-10-20 12:21:34	2023-10-20 12:21:34	88	6	15
70	106	border_crossing	2023-10-20 12:21:54	2023-10-20 12:21:54	88	7	15
73	106	custom_clearance	2023-10-20 12:22:05	2023-10-20 12:22:05	88	8	15
76	106	delivered	2023-10-20 12:23:06	2023-10-20 12:23:06	88	9	15
79	111	journey_started	2023-10-24 07:32:22	2023-10-24 07:32:22	90	4	16
81	111	on_the_way	2023-10-24 07:32:33	2023-10-24 07:32:33	90	6	16
83	111	custom_clearance	2023-10-24 07:32:43	2023-10-24 07:32:43	90	8	16
85	112	request_created	2023-10-24 11:35:07	2023-10-24 11:35:07	90	0	17
86	112	accepted	2023-10-24 07:36:56	2023-10-24 11:35:07	90	2	17
88	112	item_collected	2023-10-24 07:37:17	2023-10-24 07:37:17	90	5	17
90	112	border_crossing	2023-10-24 07:37:27	2023-10-24 07:37:27	90	7	17
92	112	delivered	2023-10-24 07:37:37	2023-10-24 07:37:37	90	9	17
95	112	journey_started	2023-10-24 07:42:17	2023-10-24 07:42:17	97	4	18
97	112	on_the_way	2023-10-24 07:42:25	2023-10-24 07:42:25	97	6	18
99	112	custom_clearance	2023-10-24 07:42:34	2023-10-24 07:42:34	97	8	18
101	114	request_created	2023-10-24 11:51:13	2023-10-24 11:51:13	97	0	19
102	114	accepted	2023-10-24 08:09:38	2023-10-24 11:51:13	97	2	19
104	114	item_collected	2023-10-24 08:10:03	2023-10-24 08:10:03	97	5	19
106	114	border_crossing	2023-10-24 08:10:11	2023-10-24 08:10:11	97	7	19
108	114	delivered	2023-10-24 08:10:23	2023-10-24 08:10:23	97	9	19
111	115	custom_clearance	2023-10-24 08:16:39	2023-10-24 08:16:39	97	8	20
113	115	request_created	2023-10-24 12:11:37	2023-10-24 12:11:37	90	0	21
114	115	accepted	2023-10-24 08:32:07	2023-10-24 12:11:37	90	2	21
116	115	item_collected	2023-10-24 08:33:01	2023-10-24 08:33:01	90	5	21
118	115	border_crossing	2023-10-24 08:33:08	2023-10-24 08:33:08	90	7	21
123	129	request_created	2023-10-26 10:28:43	2023-10-26 10:28:43	\N	0	0
125	130	request_created	2023-10-26 10:48:29	2023-10-26 10:48:29	86	0	22
126	130	accepted	2023-10-26 07:08:23	2023-10-26 10:48:29	86	2	22
128	130	item_collected	2023-10-26 07:22:23	2023-10-26 07:22:23	86	5	22
130	130	border_crossing	2023-10-26 07:23:29	2023-10-26 07:23:29	86	7	22
132	130	delivered	2023-10-26 07:24:11	2023-10-26 07:24:11	86	9	22
134	134	request_created	2023-10-26 11:36:57	2023-10-26 11:36:57	\N	0	0
136	139	request_created	2023-10-26 12:36:47	2023-10-26 12:36:47	\N	0	0
138	142	request_created	2023-10-26 15:14:50	2023-10-26 15:14:50	86	0	23
139	142	accepted	2023-10-26 11:20:58	2023-10-26 15:14:50	86	2	23
141	142	item_collected	2023-10-26 11:24:55	2023-10-26 11:24:55	86	5	23
143	142	border_crossing	2023-10-26 11:25:14	2023-10-26 11:25:14	86	7	23
145	142	delivered	2023-10-26 11:25:42	2023-10-26 11:25:42	86	9	23
148	149	request_created	2023-10-26 15:46:35	2023-10-26 15:46:35	88	0	25
149	149	accepted	2023-10-26 11:56:18	2023-10-26 15:46:35	88	2	25
150	149	request_created	2023-10-26 15:46:35	2023-10-26 15:46:35	107	0	26
151	149	accepted	2023-10-26 11:56:21	2023-10-26 15:46:35	107	2	26
156	153	journey_started	2023-10-26 13:57:03	2023-10-26 13:57:03	86	4	27
158	153	on_the_way	2023-10-26 13:57:17	2023-10-26 13:57:17	86	6	27
160	153	custom_clearance	2023-10-26 13:57:23	2023-10-26 13:57:23	86	8	27
162	153	journey_started	2023-10-26 13:57:47	2023-10-26 13:57:47	88	4	28
164	153	on_the_way	2023-10-26 13:57:52	2023-10-26 13:57:52	88	6	28
166	153	custom_clearance	2023-10-26 13:57:58	2023-10-26 13:57:58	88	8	28
168	158	request_created	2023-10-27 09:13:45	2023-10-27 09:13:45	111	0	29
169	158	accepted	2023-10-27 05:38:39	2023-10-27 09:13:45	111	2	29
170	158	request_created	2023-10-27 09:13:45	2023-10-27 09:13:45	86	0	30
171	158	accepted	2023-10-27 05:38:42	2023-10-27 09:13:45	86	2	30
173	158	item_collected	2023-10-27 05:42:47	2023-10-27 05:42:47	111	5	29
183	158	delivered	2023-10-27 05:46:25	2023-10-27 05:46:25	86	9	30
184	161	request_created	2023-10-27 10:02:51	2023-10-27 10:02:51	86	0	31
185	161	accepted	2023-10-27 06:07:31	2023-10-27 10:02:51	86	2	31
186	161	journey_started	2023-10-27 06:08:00	2023-10-27 06:08:00	86	4	31
187	161	item_collected	2023-10-27 06:08:05	2023-10-27 06:08:05	86	5	31
188	161	on_the_way	2023-10-27 06:08:10	2023-10-27 06:08:10	86	6	31
189	161	border_crossing	2023-10-27 06:08:39	2023-10-27 06:08:39	86	7	31
190	161	custom_clearance	2023-10-27 06:08:42	2023-10-27 06:08:42	86	8	31
191	161	delivered	2023-10-27 06:08:57	2023-10-27 06:08:57	86	9	31
192	170	request_created	2023-10-27 11:16:13	2023-10-27 11:16:13	114	0	32
193	170	accepted	2023-10-27 07:44:28	2023-10-27 11:16:13	114	2	32
194	170	request_created	2023-10-27 11:16:13	2023-10-27 11:16:13	111	0	33
195	170	accepted	2023-10-27 07:44:31	2023-10-27 11:16:13	111	2	33
196	170	journey_started	2023-10-27 07:46:31	2023-10-27 07:46:31	114	4	32
197	170	journey_started	2023-10-27 07:47:29	2023-10-27 07:47:29	111	4	33
198	170	item_collected	2023-10-27 07:47:50	2023-10-27 07:47:50	111	5	33
199	170	item_collected	2023-10-27 07:47:52	2023-10-27 07:47:52	114	5	32
200	170	on_the_way	2023-10-27 07:48:24	2023-10-27 07:48:24	114	6	32
201	170	border_crossing	2023-10-27 07:48:27	2023-10-27 07:48:27	114	7	32
202	170	custom_clearance	2023-10-27 07:49:02	2023-10-27 07:49:02	114	8	32
203	170	delivered	2023-10-27 07:49:24	2023-10-27 07:49:24	114	9	32
204	170	on_the_way	2023-10-27 07:50:03	2023-10-27 07:50:03	111	6	33
205	170	border_crossing	2023-10-27 07:50:06	2023-10-27 07:50:06	111	7	33
206	170	custom_clearance	2023-10-27 07:50:09	2023-10-27 07:50:09	111	8	33
207	170	delivered	2023-10-27 07:50:19	2023-10-27 07:50:19	111	9	33
208	172	request_created	2023-11-07 11:10:19	2023-11-07 11:10:19	107	0	34
209	172	accepted	2023-11-07 07:16:32	2023-11-07 11:10:19	107	2	34
210	172	journey_started	2023-11-07 07:17:07	2023-11-07 07:17:07	107	4	34
211	172	item_collected	2023-11-07 07:17:21	2023-11-07 07:17:21	107	5	34
212	172	on_the_way	2023-11-07 07:17:59	2023-11-07 07:17:59	107	6	34
213	172	border_crossing	2023-11-07 07:18:05	2023-11-07 07:18:05	107	7	34
214	172	custom_clearance	2023-11-07 07:18:15	2023-11-07 07:18:15	107	8	34
215	172	delivered	2023-11-07 07:19:06	2023-11-07 07:19:06	107	9	34
216	177	request_created	2023-11-09 17:44:45	2023-11-09 17:44:45	65	0	0
217	178	request_created	2023-11-10 07:57:10	2023-11-10 07:57:10	97	0	0
218	181	request_created	2023-11-10 16:30:03	2023-11-10 16:30:03	83	0	35
219	181	accepted	2023-11-10 12:34:29	2023-11-10 16:30:03	83	2	35
220	219	request_created	2023-11-13 14:56:24	2023-11-13 14:56:24	139	0	37
221	219	accepted	2023-11-13 11:05:36	2023-11-13 14:56:24	139	2	37
222	222	request_created	2023-11-13 15:24:06	2023-11-13 15:24:06	37	0	38
223	222	accepted	2023-11-13 11:30:09	2023-11-13 15:24:06	37	2	38
224	222	request_created	2023-11-13 15:24:06	2023-11-13 15:24:06	139	0	39
225	222	accepted	2023-11-13 11:30:25	2023-11-13 15:24:06	139	2	39
226	223	request_created	2023-11-13 15:47:56	2023-11-13 15:47:56	132	0	40
227	223	accepted	2023-11-13 12:14:09	2023-11-13 15:47:56	132	2	40
228	181	border_crossing	2023-11-13 12:25:48	2023-11-13 12:25:48	83	7	35
229	181	custom_clearance	2023-11-13 12:26:09	2023-11-13 12:26:09	83	8	35
230	181	delivered	2023-11-13 12:26:45	2023-11-13 12:26:45	83	9	35
231	81	request_created	2023-10-11 09:11:09	2023-10-11 09:11:09	83	0	41
232	81	accepted	2023-11-13 13:33:21	2023-10-11 09:11:09	83	2	41
233	225	request_created	2023-11-13 18:32:21	2023-11-13 18:32:21	132	0	42
234	225	accepted	2023-11-13 14:38:32	2023-11-13 18:32:21	132	2	42
235	226	request_created	2023-11-13 22:23:37	2023-11-13 22:23:37	83	0	43
236	226	accepted	2023-11-14 05:44:42	2023-11-13 22:23:37	83	2	43
237	226	journey_started	2023-11-14 05:44:59	2023-11-14 05:44:59	83	4	43
238	232	request_created	2023-11-14 09:54:39	2023-11-14 09:54:39	139	0	44
239	232	accepted	2023-11-14 05:59:31	2023-11-14 09:54:39	139	2	44
240	232	journey_started	2023-11-14 06:00:09	2023-11-14 06:00:09	139	4	44
241	232	item_collected	2023-11-14 06:00:35	2023-11-14 06:00:35	139	5	44
242	232	on_the_way	2023-11-14 06:00:38	2023-11-14 06:00:38	139	6	44
243	232	border_crossing	2023-11-14 06:00:40	2023-11-14 06:00:40	139	7	44
244	232	custom_clearance	2023-11-14 06:00:43	2023-11-14 06:00:43	139	8	44
245	232	delivered	2023-11-14 06:01:33	2023-11-14 06:01:33	139	9	44
246	204	request_created	2023-11-13 14:04:06	2023-11-13 14:04:06	97	0	45
247	204	accepted	2023-11-14 07:18:08	2023-11-13 14:04:06	97	2	45
248	204	journey_started	2023-11-14 07:18:32	2023-11-14 07:18:32	97	4	45
249	204	item_collected	2023-11-14 07:20:49	2023-11-14 07:20:49	97	5	45
250	204	on_the_way	2023-11-14 07:20:53	2023-11-14 07:20:53	97	6	45
251	204	border_crossing	2023-11-14 07:20:55	2023-11-14 07:20:55	97	7	45
252	204	custom_clearance	2023-11-14 07:20:57	2023-11-14 07:20:57	97	8	45
256	226	border_crossing	2023-11-14 07:27:42	2023-11-14 07:27:42	83	7	43
257	226	custom_clearance	2023-11-14 07:27:44	2023-11-14 07:27:44	83	8	43
258	226	delivered	2023-11-14 07:27:53	2023-11-14 07:27:53	83	9	43
259	243	request_created	2023-11-14 17:12:07	2023-11-14 17:12:07	139	0	46
260	243	accepted	2023-11-14 13:18:57	2023-11-14 17:12:07	139	2	46
261	243	journey_started	2023-11-14 13:21:49	2023-11-14 13:21:49	139	4	46
262	243	item_collected	2023-11-14 13:23:26	2023-11-14 13:23:26	139	5	46
253	204	delivered	2023-11-14 07:24:11	2023-11-14 07:24:11	97	9	45
254	226	item_collected	2023-11-14 07:27:39	2023-11-14 07:27:39	83	5	43
255	226	on_the_way	2023-11-14 07:27:40	2023-11-14 07:27:40	83	6	43
263	243	on_the_way	2023-11-14 13:23:34	2023-11-14 13:23:34	139	6	46
264	243	border_crossing	2023-11-14 13:25:52	2023-11-14 13:25:52	139	7	46
265	243	custom_clearance	2023-11-14 13:25:59	2023-11-14 13:25:59	139	8	46
266	243	delivered	2023-11-14 13:26:34	2023-11-14 13:26:34	139	9	46
267	245	request_created	2023-11-14 17:29:22	2023-11-14 17:29:22	139	0	47
268	245	accepted	2023-11-14 13:33:03	2023-11-14 17:29:22	139	2	47
269	245	journey_started	2023-11-14 13:33:14	2023-11-14 13:33:14	139	4	47
270	245	item_collected	2023-11-14 13:33:17	2023-11-14 13:33:17	139	5	47
271	245	on_the_way	2023-11-14 13:33:19	2023-11-14 13:33:19	139	6	47
272	245	border_crossing	2023-11-14 13:33:21	2023-11-14 13:33:21	139	7	47
273	245	custom_clearance	2023-11-14 13:33:22	2023-11-14 13:33:22	139	8	47
274	245	delivered	2023-11-14 13:33:29	2023-11-14 13:33:29	139	9	47
275	247	request_created	2023-11-14 17:54:25	2023-11-14 17:54:25	139	0	48
276	247	accepted	2023-11-14 13:57:32	2023-11-14 17:54:25	139	2	48
277	247	journey_started	2023-11-14 13:57:46	2023-11-14 13:57:46	139	4	48
278	247	item_collected	2023-11-14 13:57:48	2023-11-14 13:57:48	139	5	48
279	247	on_the_way	2023-11-14 13:57:49	2023-11-14 13:57:49	139	6	48
280	247	border_crossing	2023-11-14 13:57:50	2023-11-14 13:57:50	139	7	48
281	247	custom_clearance	2023-11-14 13:57:51	2023-11-14 13:57:51	139	8	48
282	247	delivered	2023-11-14 13:57:59	2023-11-14 13:57:59	139	9	48
283	251	request_created	2023-11-14 19:31:46	2023-11-14 19:31:46	111	0	49
284	251	accepted	2023-11-14 15:33:46	2023-11-14 19:31:46	111	2	49
285	251	journey_started	2023-11-14 15:34:32	2023-11-14 15:34:32	111	4	49
286	252	request_created	2023-11-14 20:14:00	2023-11-14 20:14:00	139	0	50
287	252	accepted	2023-11-14 16:16:44	2023-11-14 20:14:00	139	2	50
288	252	journey_started	2023-11-14 16:17:00	2023-11-14 16:17:00	139	4	50
289	252	request_created	2023-11-14 20:14:00	2023-11-14 20:14:00	111	0	51
290	252	accepted	2023-11-14 16:19:26	2023-11-14 20:14:00	111	2	51
291	252	journey_started	2023-11-14 16:19:42	2023-11-14 16:19:42	111	4	51
292	252	item_collected	2023-11-14 16:19:46	2023-11-14 16:19:46	111	5	51
293	253	request_created	2023-11-14 20:29:01	2023-11-14 20:29:01	111	0	52
294	253	accepted	2023-11-14 16:30:21	2023-11-14 20:29:01	111	2	52
295	253	journey_started	2023-11-14 16:30:32	2023-11-14 16:30:32	111	4	52
296	105	item_collected	2023-11-14 17:01:16	2023-11-14 17:01:16	83	5	11
297	199	request_created	2023-11-13 13:46:59	2023-11-13 13:46:59	83	0	53
298	199	accepted	2023-11-14 19:06:37	2023-11-13 13:46:59	83	2	53
299	199	journey_started	2023-11-14 19:08:01	2023-11-14 19:08:01	83	4	53
300	199	item_collected	2023-11-14 19:10:28	2023-11-14 19:10:28	83	5	53
303	262	journey_started	2023-11-15 09:54:49	2023-11-15 09:54:49	111	4	54
304	264	request_created	2023-11-15 14:38:18	2023-11-15 14:38:18	111	0	55
305	264	accepted	2023-11-15 10:40:25	2023-11-15 14:38:18	111	2	55
306	264	journey_started	2023-11-15 10:54:21	2023-11-15 10:54:21	111	4	55
307	265	request_created	2023-11-15 14:46:56	2023-11-15 14:46:56	111	0	56
308	265	accepted	2023-11-15 10:57:08	2023-11-15 14:46:56	111	2	56
346	82	accepted	2023-11-16 11:35:04	2023-10-16 14:50:04	83	2	68
347	309	request_created	2023-11-16 17:38:09	2023-11-16 17:38:09	139	0	69
309	265	journey_started	2023-11-15 10:59:03	2023-11-15 10:59:03	111	4	56
310	267	request_created	2023-11-15 15:33:50	2023-11-15 15:33:50	111	0	57
311	267	accepted	2023-11-15 12:09:03	2023-11-15 15:33:50	111	2	57
312	267	request_created	2023-11-15 15:33:50	2023-11-15 15:33:50	139	0	58
313	267	accepted	2023-11-15 13:08:39	2023-11-15 15:33:50	139	2	58
314	269	request_created	2023-11-15 17:42:52	2023-11-15 17:42:52	139	0	59
315	269	accepted	2023-11-15 13:56:49	2023-11-15 17:42:52	139	2	59
316	270	request_created	2023-11-15 18:47:18	2023-11-15 18:47:18	139	0	60
317	270	accepted	2023-11-15 14:48:15	2023-11-15 18:47:18	139	2	60
318	270	journey_started	2023-11-15 14:48:46	2023-11-15 14:48:46	139	4	60
319	271	request_created	2023-11-15 18:53:51	2023-11-15 18:53:51	139	0	61
320	271	accepted	2023-11-15 14:54:57	2023-11-15 18:53:51	139	2	61
348	309	accepted	2023-11-16 13:43:17	2023-11-16 17:38:09	139	2	69
321	271	journey_started	2023-11-15 14:55:43	2023-11-15 14:55:43	139	4	61
322	272	request_created	2023-11-15 19:03:55	2023-11-15 19:03:55	139	0	62
323	272	accepted	2023-11-15 15:09:38	2023-11-15 19:03:55	139	2	62
349	309	journey_started	2023-11-16 13:43:40	2023-11-16 13:43:40	139	4	69
324	272	journey_started	2023-11-15 15:17:29	2023-11-15 15:17:29	139	4	62
325	272	item_collected	2023-11-15 15:33:31	2023-11-15 15:33:31	139	5	62
326	273	request_created	2023-11-15 19:34:48	2023-11-15 19:34:48	139	0	63
327	273	accepted	2023-11-15 15:35:42	2023-11-15 19:34:48	139	2	63
328	273	journey_started	2023-11-15 15:36:14	2023-11-15 15:36:14	139	4	63
329	273	item_collected	2023-11-15 15:36:22	2023-11-15 15:36:22	139	5	63
330	259	request_created	2023-11-15 13:30:36	2023-11-15 13:30:36	83	0	64
331	259	accepted	2023-11-15 15:40:07	2023-11-15 13:30:36	83	2	64
332	259	journey_started	2023-11-15 15:45:37	2023-11-15 15:45:37	83	4	64
333	259	item_collected	2023-11-15 15:48:24	2023-11-15 15:48:24	83	5	64
334	277	request_created	2023-11-16 10:38:19	2023-11-16 10:38:19	139	0	65
335	277	accepted	2023-11-16 06:51:37	2023-11-16 10:38:19	139	2	65
336	278	request_created	2023-11-16 10:50:08	2023-11-16 10:50:08	159	0	66
337	278	accepted	2023-11-16 06:51:58	2023-11-16 10:50:08	159	2	66
338	278	journey_started	2023-11-16 06:52:35	2023-11-16 06:52:35	159	4	66
339	277	journey_started	2023-11-16 06:52:51	2023-11-16 06:52:51	139	4	65
340	278	item_collected	2023-11-16 06:55:33	2023-11-16 06:55:33	159	5	66
341	279	request_created	2023-11-16 11:08:18	2023-11-16 11:08:18	139	0	67
342	279	accepted	2023-11-16 07:21:43	2023-11-16 11:08:18	139	2	67
343	279	journey_started	2023-11-16 07:26:12	2023-11-16 07:26:12	139	4	67
344	279	item_collected	2023-11-16 07:30:42	2023-11-16 07:30:42	139	5	67
345	82	request_created	2023-10-16 14:50:04	2023-10-16 14:50:04	83	0	68
350	309	item_collected	2023-11-16 13:44:15	2023-11-16 13:44:15	139	5	69
351	309	on_the_way	2023-11-16 13:44:50	2023-11-16 13:44:50	139	6	69
352	309	border_crossing	2023-11-16 13:45:04	2023-11-16 13:45:04	139	7	69
353	309	custom_clearance	2023-11-16 13:45:20	2023-11-16 13:45:20	139	8	69
354	309	delivered	2023-11-16 13:45:46	2023-11-16 13:45:46	139	9	69
355	317	request_created	2023-11-16 19:49:27	2023-11-16 19:49:27	139	0	70
356	317	accepted	2023-11-16 15:54:13	2023-11-16 19:49:27	139	2	70
357	317	journey_started	2023-11-16 15:56:47	2023-11-16 15:56:47	139	4	70
358	317	item_collected	2023-11-16 15:56:52	2023-11-16 15:56:52	139	5	70
359	317	on_the_way	2023-11-16 15:56:57	2023-11-16 15:56:57	139	6	70
360	317	border_crossing	2023-11-16 15:57:01	2023-11-16 15:57:01	139	7	70
361	317	custom_clearance	2023-11-16 15:57:03	2023-11-16 15:57:03	139	8	70
362	317	delivered	2023-11-16 15:57:16	2023-11-16 15:57:16	139	9	70
363	259	on_the_way	2023-11-16 19:31:11	2023-11-16 19:31:11	83	6	64
364	259	border_crossing	2023-11-16 19:36:00	2023-11-16 19:36:00	83	7	64
302	262	accepted	2023-11-17 13:21:39	2023-11-15 13:48:06	111	2	83
365	259	custom_clearance	2023-11-16 19:47:07	2023-11-16 19:47:07	83	8	64
366	259	delivered	2023-11-16 19:48:45	2023-11-16 19:48:45	83	9	64
367	319	request_created	2023-11-16 23:50:58	2023-11-16 23:50:58	83	0	71
368	319	accepted	2023-11-16 19:52:59	2023-11-16 23:50:58	83	2	71
369	319	journey_started	2023-11-16 19:53:18	2023-11-16 19:53:18	83	4	71
370	319	item_collected	2023-11-16 19:53:46	2023-11-16 19:53:46	83	5	71
371	322	request_created	2023-11-17 09:18:55	2023-11-17 09:18:55	139	0	72
372	322	accepted	2023-11-17 05:22:27	2023-11-17 09:18:55	139	2	72
373	322	journey_started	2023-11-17 05:23:56	2023-11-17 05:23:56	139	4	72
374	322	item_collected	2023-11-17 05:24:11	2023-11-17 05:24:11	139	5	72
375	322	on_the_way	2023-11-17 05:52:21	2023-11-17 05:52:21	139	6	72
376	322	border_crossing	2023-11-17 05:52:28	2023-11-17 05:52:28	139	7	72
377	322	custom_clearance	2023-11-17 05:52:36	2023-11-17 05:52:36	139	8	72
378	322	delivered	2023-11-17 05:52:47	2023-11-17 05:52:47	139	9	72
379	260	request_created	2023-11-15 13:31:12	2023-11-15 13:31:12	83	0	73
380	260	accepted	2023-11-17 06:10:12	2023-11-15 13:31:12	83	2	73
381	326	request_created	2023-11-17 12:47:13	2023-11-17 12:47:13	139	0	74
382	326	accepted	2023-11-17 08:50:29	2023-11-17 12:47:13	139	2	74
383	326	journey_started	2023-11-17 08:52:05	2023-11-17 08:52:05	139	4	74
384	326	item_collected	2023-11-17 08:52:09	2023-11-17 08:52:09	139	5	74
385	326	on_the_way	2023-11-17 08:52:11	2023-11-17 08:52:11	139	6	74
386	326	border_crossing	2023-11-17 08:52:15	2023-11-17 08:52:15	139	7	74
387	326	custom_clearance	2023-11-17 08:52:17	2023-11-17 08:52:17	139	8	74
388	326	delivered	2023-11-17 08:52:25	2023-11-17 08:52:25	139	9	74
389	327	request_created	2023-11-17 13:04:23	2023-11-17 13:04:23	139	0	75
390	327	accepted	2023-11-17 09:07:05	2023-11-17 13:04:23	139	2	75
391	327	journey_started	2023-11-17 09:08:01	2023-11-17 09:08:01	139	4	75
392	327	item_collected	2023-11-17 09:08:04	2023-11-17 09:08:04	139	5	75
393	327	on_the_way	2023-11-17 09:08:18	2023-11-17 09:08:18	139	6	75
394	327	border_crossing	2023-11-17 09:08:22	2023-11-17 09:08:22	139	7	75
395	327	custom_clearance	2023-11-17 09:08:23	2023-11-17 09:08:23	139	8	75
396	327	delivered	2023-11-17 09:08:31	2023-11-17 09:08:31	139	9	75
397	328	request_created	2023-11-17 13:11:22	2023-11-17 13:11:22	139	0	76
398	328	accepted	2023-11-17 09:14:38	2023-11-17 13:11:22	139	2	76
399	328	journey_started	2023-11-17 09:14:49	2023-11-17 09:14:49	139	4	76
400	328	item_collected	2023-11-17 09:14:52	2023-11-17 09:14:52	139	5	76
401	328	on_the_way	2023-11-17 09:14:53	2023-11-17 09:14:53	139	6	76
402	330	request_created	2023-11-17 13:27:57	2023-11-17 13:27:57	139	0	77
403	330	accepted	2023-11-17 09:30:47	2023-11-17 13:27:57	139	2	77
404	330	journey_started	2023-11-17 09:31:27	2023-11-17 09:31:27	139	4	77
405	330	item_collected	2023-11-17 09:31:30	2023-11-17 09:31:30	139	5	77
406	330	on_the_way	2023-11-17 09:31:32	2023-11-17 09:31:32	139	6	77
407	330	border_crossing	2023-11-17 09:31:36	2023-11-17 09:31:36	139	7	77
408	330	custom_clearance	2023-11-17 09:31:38	2023-11-17 09:31:38	139	8	77
409	330	delivered	2023-11-17 09:31:45	2023-11-17 09:31:45	139	9	77
410	332	request_created	2023-11-17 14:09:30	2023-11-17 14:09:30	1	0	78
411	332	accepted	2023-11-17 10:11:02	2023-11-17 14:09:30	1	2	78
412	335	request_created	2023-11-17 14:54:19	2023-11-17 14:54:19	1	0	79
413	335	accepted	2023-11-17 10:55:47	2023-11-17 14:54:19	1	2	79
414	347	request_created	2023-11-17 16:37:21	2023-11-17 16:37:21	1	0	80
415	347	accepted	2023-11-17 12:39:06	2023-11-17 16:37:21	1	2	80
416	348	request_created	2023-11-17 16:55:50	2023-11-17 16:55:50	1	0	81
417	348	accepted	2023-11-17 12:56:30	2023-11-17 16:55:50	1	2	81
418	349	request_created	2023-11-17 16:58:57	2023-11-17 16:58:57	1	0	82
419	349	accepted	2023-11-17 12:59:57	2023-11-17 16:58:57	1	2	82
301	262	request_created	2023-11-15 13:48:06	2023-11-15 13:48:06	111	0	83
420	350	request_created	2023-11-17 17:18:37	2023-11-17 17:18:37	1	0	84
421	350	accepted	2023-11-17 13:31:20	2023-11-17 17:18:37	1	2	84
422	355	request_created	2023-11-17 17:50:07	2023-11-17 17:50:07	1	0	85
423	355	accepted	2023-11-17 17:51:21	2023-11-17 17:50:07	1	2	85
424	356	request_created	2023-11-17 18:01:45	2023-11-17 18:01:45	1	0	86
425	356	accepted	2023-11-17 18:03:22	2023-11-17 18:01:45	1	2	86
426	357	request_created	2023-11-17 18:11:01	2023-11-17 18:11:01	139	0	87
427	357	accepted	2023-11-17 18:12:45	2023-11-17 18:11:01	139	2	87
428	357	journey_started	2023-11-17 14:13:47	2023-11-17 14:13:47	139	4	87
429	357	item_collected	2023-11-17 14:13:49	2023-11-17 14:13:49	139	5	87
430	357	on_the_way	2023-11-17 14:13:50	2023-11-17 14:13:50	139	6	87
431	357	border_crossing	2023-11-17 14:13:53	2023-11-17 14:13:53	139	7	87
432	357	custom_clearance	2023-11-17 14:13:57	2023-11-17 14:13:57	139	8	87
433	357	delivered	2023-11-17 14:14:07	2023-11-17 14:14:07	139	9	87
434	358	request_created	2023-11-17 18:16:24	2023-11-17 18:16:24	139	0	88
435	358	accepted	2023-11-17 18:18:11	2023-11-17 18:16:24	139	2	88
436	358	journey_started	2023-11-17 18:18:22	2023-11-17 18:18:22	139	4	88
437	358	item_collected	2023-11-17 18:18:27	2023-11-17 18:18:27	139	5	88
438	358	on_the_way	2023-11-17 18:18:31	2023-11-17 18:18:31	139	6	88
439	358	border_crossing	2023-11-17 18:18:34	2023-11-17 18:18:34	139	7	88
440	358	custom_clearance	2023-11-17 18:18:37	2023-11-17 18:18:37	139	8	88
441	358	delivered	2023-11-17 14:18:46	2023-11-17 14:18:46	139	9	88
442	359	request_created	2023-11-17 18:20:59	2023-11-17 18:20:59	139	0	89
443	359	accepted	2023-11-17 18:22:21	2023-11-17 18:20:59	139	2	89
444	359	journey_started	2023-11-17 18:22:33	2023-11-17 18:22:33	139	4	89
445	359	item_collected	2023-11-17 18:22:35	2023-11-17 18:22:35	139	5	89
446	359	on_the_way	2023-11-17 18:22:36	2023-11-17 18:22:36	139	6	89
447	359	border_crossing	2023-11-17 18:22:39	2023-11-17 18:22:39	139	7	89
448	359	custom_clearance	2023-11-17 18:22:43	2023-11-17 18:22:43	139	8	89
449	359	delivered	2023-11-17 18:22:50	2023-11-17 18:22:50	139	9	89
450	360	request_created	2023-11-17 19:10:53	2023-11-17 19:10:53	139	0	90
451	360	accepted	2023-11-17 19:12:04	2023-11-17 19:10:53	139	2	90
452	360	journey_started	2023-11-17 19:12:38	2023-11-17 19:12:38	139	4	90
453	360	item_collected	2023-11-17 19:12:41	2023-11-17 19:12:41	139	5	90
454	360	on_the_way	2023-11-17 19:12:44	2023-11-17 19:12:44	139	6	90
455	360	border_crossing	2023-11-17 19:12:47	2023-11-17 19:12:47	139	7	90
456	360	custom_clearance	2023-11-17 19:12:51	2023-11-17 19:12:51	139	8	90
457	360	delivered	2023-11-17 19:13:00	2023-11-17 19:13:00	139	9	90
458	367	request_created	2023-11-18 13:46:02	2023-11-18 13:46:02	139	0	91
459	367	accepted	2023-11-18 14:15:05	2023-11-18 13:46:02	139	2	91
460	367	journey_started	2023-11-18 14:28:06	2023-11-18 14:28:06	139	4	91
461	367	item_collected	2023-11-18 14:29:35	2023-11-18 14:29:35	139	5	91
462	367	on_the_way	2023-11-18 14:30:18	2023-11-18 14:30:18	139	6	91
463	367	border_crossing	2023-11-18 14:30:30	2023-11-18 14:30:30	139	7	91
464	367	custom_clearance	2023-11-18 14:30:49	2023-11-18 14:30:49	139	8	91
465	319	on_the_way	2023-11-18 14:38:00	2023-11-18 14:38:00	83	6	71
466	319	border_crossing	2023-11-18 14:38:03	2023-11-18 14:38:03	83	7	71
467	319	custom_clearance	2023-11-18 14:38:34	2023-11-18 14:38:34	83	8	71
468	319	delivered	2023-11-18 14:38:55	2023-11-18 14:38:55	83	9	71
469	279	on_the_way	2023-11-18 14:57:41	2023-11-18 14:57:41	139	6	67
470	279	border_crossing	2023-11-18 14:57:52	2023-11-18 14:57:52	139	7	67
471	279	custom_clearance	2023-11-18 14:57:57	2023-11-18 14:57:57	139	8	67
472	199	on_the_way	2023-11-18 15:25:55	2023-11-18 15:25:55	83	6	53
473	199	border_crossing	2023-11-18 15:25:58	2023-11-18 15:25:58	83	7	53
474	199	custom_clearance	2023-11-18 15:26:05	2023-11-18 15:26:05	83	8	53
475	372	request_created	2023-11-18 15:22:18	2023-11-18 15:22:18	139	0	92
476	372	accepted	2023-11-18 15:26:11	2023-11-18 15:22:18	139	2	92
477	372	journey_started	2023-11-18 15:26:31	2023-11-18 15:26:31	139	4	92
478	372	item_collected	2023-11-18 15:26:36	2023-11-18 15:26:36	139	5	92
479	372	on_the_way	2023-11-18 15:26:38	2023-11-18 15:26:38	139	6	92
480	372	border_crossing	2023-11-18 15:26:40	2023-11-18 15:26:40	139	7	92
481	372	custom_clearance	2023-11-18 15:26:41	2023-11-18 15:26:41	139	8	92
482	374	request_created	2023-11-18 15:45:45	2023-11-18 15:45:45	168	0	93
483	374	accepted	2023-11-18 15:50:58	2023-11-18 15:45:45	168	2	93
484	375	request_created	2023-11-18 15:51:19	2023-11-18 15:51:19	1	0	94
485	375	accepted	2023-11-18 15:52:42	2023-11-18 15:51:19	1	2	94
486	374	journey_started	2023-11-18 15:53:20	2023-11-18 15:53:20	168	4	93
487	374	item_collected	2023-11-18 15:54:12	2023-11-18 15:54:12	168	5	93
488	374	on_the_way	2023-11-18 16:04:56	2023-11-18 16:04:56	168	6	93
489	374	border_crossing	2023-11-18 16:05:16	2023-11-18 16:05:16	168	7	93
490	374	custom_clearance	2023-11-18 16:05:18	2023-11-18 16:05:18	168	8	93
491	374	delivered	2023-11-18 16:05:29	2023-11-18 16:05:29	168	9	93
492	377	request_created	2023-11-18 16:03:05	2023-11-18 16:03:05	139	0	95
493	377	accepted	2023-11-18 16:10:00	2023-11-18 16:03:05	139	2	95
494	377	journey_started	2023-11-18 16:11:14	2023-11-18 16:11:14	139	4	95
495	377	item_collected	2023-11-18 16:11:58	2023-11-18 16:11:58	139	5	95
496	377	on_the_way	2023-11-18 16:12:11	2023-11-18 16:12:11	139	6	95
497	377	border_crossing	2023-11-18 16:13:00	2023-11-18 16:13:00	139	7	95
498	377	custom_clearance	2023-11-18 16:14:01	2023-11-18 16:14:01	139	8	95
499	377	delivered	2023-11-18 16:14:57	2023-11-18 16:14:57	139	9	95
500	328	border_crossing	2023-11-18 16:34:20	2023-11-18 16:34:20	139	7	76
501	328	custom_clearance	2023-11-18 16:34:25	2023-11-18 16:34:25	139	8	76
502	372	delivered	2023-11-18 16:36:22	2023-11-18 16:36:22	139	9	92
503	378	request_created	2023-11-18 16:34:06	2023-11-18 16:34:06	1	0	96
504	378	accepted	2023-11-18 16:43:27	2023-11-18 16:34:06	1	2	96
505	199	delivered	2023-11-18 16:55:50	2023-11-18 16:55:50	83	9	53
506	381	request_created	2023-11-18 17:05:19	2023-11-18 17:05:19	168	0	97
507	381	accepted	2023-11-18 17:17:50	2023-11-18 17:05:19	168	2	97
508	381	journey_started	2023-11-18 17:18:47	2023-11-18 17:18:47	168	4	97
509	381	item_collected	2023-11-18 17:21:01	2023-11-18 17:21:01	168	5	97
510	381	on_the_way	2023-11-18 17:21:06	2023-11-18 17:21:06	168	6	97
511	381	border_crossing	2023-11-18 17:21:11	2023-11-18 17:21:11	168	7	97
512	216	request_created	2023-11-13 14:28:43	2023-11-13 14:28:43	83	0	98
513	216	accepted	2023-11-18 17:27:33	2023-11-13 14:28:43	83	2	98
514	382	request_created	2023-11-18 17:22:55	2023-11-18 17:22:55	168	0	99
515	382	accepted	2023-11-18 17:27:46	2023-11-18 17:22:55	168	2	99
516	382	journey_started	2023-11-18 17:27:57	2023-11-18 17:27:57	168	4	99
517	216	journey_started	2023-11-18 17:28:09	2023-11-18 17:28:09	83	4	98
518	382	item_collected	2023-11-18 17:31:17	2023-11-18 17:31:17	168	5	99
519	382	on_the_way	2023-11-18 17:31:21	2023-11-18 17:31:21	168	6	99
520	382	border_crossing	2023-11-18 17:31:26	2023-11-18 17:31:26	168	7	99
521	382	custom_clearance	2023-11-18 17:31:29	2023-11-18 17:31:29	168	8	99
522	382	delivered	2023-11-18 17:31:42	2023-11-18 17:31:42	168	9	99
523	216	item_collected	2023-11-18 17:33:11	2023-11-18 17:33:11	83	5	98
524	383	request_created	2023-11-18 17:35:03	2023-11-18 17:35:03	1	0	100
525	383	accepted	2023-11-18 17:38:12	2023-11-18 17:35:03	1	2	100
526	384	request_created	2023-11-18 17:40:44	2023-11-18 17:40:44	1	0	101
527	384	accepted	2023-11-18 17:42:10	2023-11-18 17:40:44	1	2	101
528	216	on_the_way	2023-11-18 20:14:15	2023-11-18 20:14:15	83	6	98
529	216	border_crossing	2023-11-18 20:48:36	2023-11-18 20:48:36	83	7	98
530	216	custom_clearance	2023-11-18 20:48:40	2023-11-18 20:48:40	83	8	98
531	216	delivered	2023-11-18 20:49:11	2023-11-18 20:49:11	83	9	98
532	386	request_created	2023-11-19 09:11:02	2023-11-19 09:11:02	175	0	102
533	386	accepted	2023-11-19 09:15:09	2023-11-19 09:11:02	175	2	102
534	386	journey_started	2023-11-19 09:15:39	2023-11-19 09:15:39	175	4	102
535	386	item_collected	2023-11-19 09:16:20	2023-11-19 09:16:20	175	5	102
536	386	on_the_way	2023-11-19 09:17:38	2023-11-19 09:17:38	175	6	102
537	386	border_crossing	2023-11-19 09:17:43	2023-11-19 09:17:43	175	7	102
538	386	custom_clearance	2023-11-19 09:17:46	2023-11-19 09:17:46	175	8	102
539	386	delivered	2023-11-19 09:18:06	2023-11-19 09:18:06	175	9	102
540	387	request_created	2023-11-19 10:04:42	2023-11-19 10:04:42	177	0	103
541	387	accepted	2023-11-19 10:08:04	2023-11-19 10:04:42	177	2	103
542	387	journey_started	2023-11-19 10:08:53	2023-11-19 10:08:53	177	4	103
543	387	item_collected	2023-11-19 10:10:25	2023-11-19 10:10:25	177	5	103
544	387	on_the_way	2023-11-19 10:10:59	2023-11-19 10:10:59	177	6	103
545	387	border_crossing	2023-11-19 10:11:06	2023-11-19 10:11:06	177	7	103
546	387	custom_clearance	2023-11-19 10:11:17	2023-11-19 10:11:17	177	8	103
547	387	delivered	2023-11-19 10:11:59	2023-11-19 10:11:59	177	9	103
548	388	request_created	2023-11-19 10:25:37	2023-11-19 10:25:37	177	0	104
549	388	accepted	2023-11-19 10:28:25	2023-11-19 10:25:37	177	2	104
550	388	journey_started	2023-11-19 10:28:34	2023-11-19 10:28:34	177	4	104
551	388	item_collected	2023-11-19 10:29:39	2023-11-19 10:29:39	177	5	104
552	388	on_the_way	2023-11-19 10:30:20	2023-11-19 10:30:20	177	6	104
553	388	border_crossing	2023-11-19 10:30:59	2023-11-19 10:30:59	177	7	104
554	388	custom_clearance	2023-11-19 10:31:28	2023-11-19 10:31:28	177	8	104
555	388	delivered	2023-11-19 10:31:55	2023-11-19 10:31:55	177	9	104
556	389	request_created	2023-11-19 10:44:41	2023-11-19 10:44:41	177	0	105
557	389	accepted	2023-11-19 10:47:40	2023-11-19 10:44:41	177	2	105
558	389	journey_started	2023-11-19 10:48:16	2023-11-19 10:48:16	177	4	105
559	389	item_collected	2023-11-19 10:48:53	2023-11-19 10:48:53	177	5	105
560	389	on_the_way	2023-11-19 10:49:36	2023-11-19 10:49:36	177	6	105
561	389	border_crossing	2023-11-19 10:49:43	2023-11-19 10:49:43	177	7	105
562	389	custom_clearance	2023-11-19 10:49:48	2023-11-19 10:49:48	177	8	105
563	389	delivered	2023-11-19 10:50:27	2023-11-19 10:50:27	177	9	105
564	390	request_created	2023-11-19 11:19:15	2023-11-19 11:19:15	1	0	106
565	390	accepted	2023-11-19 11:20:55	2023-11-19 11:19:15	1	2	106
566	391	request_created	2023-11-19 11:32:24	2023-11-19 11:32:24	1	0	107
567	391	accepted	2023-11-19 11:33:48	2023-11-19 11:32:24	1	2	107
568	392	request_created	2023-11-19 11:36:26	2023-11-19 11:36:26	1	0	108
569	392	accepted	2023-11-19 11:37:10	2023-11-19 11:36:26	1	2	108
570	393	request_created	2023-11-19 21:52:53	2023-11-19 21:52:53	1	0	109
571	393	accepted	2023-11-20 01:26:42	2023-11-19 21:52:53	1	2	109
572	394	request_created	2023-11-20 08:22:21	2023-11-20 08:22:21	1	0	110
573	394	accepted	2023-11-20 08:56:53	2023-11-20 08:22:21	1	2	110
574	399	request_created	2023-11-20 11:58:35	2023-11-20 11:58:35	1	0	111
575	399	accepted	2023-11-20 12:01:57	2023-11-20 11:58:35	1	2	111
576	400	request_created	2023-11-20 12:23:42	2023-11-20 12:23:42	1	0	112
577	400	accepted	2023-11-20 12:35:29	2023-11-20 12:23:42	1	2	112
578	399	items_received_in_warehouse	2023-11-20 12:39:06	2023-11-20 12:39:06	1	16	186
579	401	request_created	2023-11-20 12:39:45	2023-11-20 12:39:45	1	0	113
580	401	accepted	2023-11-20 12:46:42	2023-11-20 12:39:45	1	2	113
581	401	items_received_in_warehouse	2023-11-20 12:47:32	2023-11-20 12:47:32	1	16	194
582	402	request_created	2023-11-20 14:09:22	2023-11-20 14:09:22	1	0	114
583	402	accepted	2023-11-20 14:10:58	2023-11-20 14:09:22	1	2	114
584	402	items_received_in_warehouse	2023-11-20 14:12:01	2023-11-20 14:12:01	1	16	195
585	402	items_stored	2023-11-20 14:14:58	2023-11-20 14:14:58	1	17	195
586	403	request_created	2023-11-20 14:16:59	2023-11-20 14:16:59	1	0	115
587	403	accepted	2023-11-20 14:21:58	2023-11-20 14:16:59	1	2	115
588	403	items_received_in_warehouse	2023-11-20 14:22:17	2023-11-20 14:22:17	1	16	196
589	404	request_created	2023-11-20 14:48:38	2023-11-20 14:48:38	1	0	116
590	404	accepted	2023-11-20 14:49:41	2023-11-20 14:48:38	1	2	116
591	404	collected_from_shipper	2023-11-20 14:50:09	2023-11-20 14:50:09	1	10	197
592	404	cargo_cleared_at_origin_border	2023-11-20 14:50:18	2023-11-20 14:50:18	1	11	197
593	404	cargo_tracking	2023-11-20 14:50:23	2023-11-20 14:50:23	1	12	197
594	404	cargo_reached_destination_border	2023-11-20 14:50:30	2023-11-20 14:50:30	1	13	197
595	404	cargo_cleared_destination_customs	2023-11-20 14:50:51	2023-11-20 14:50:51	1	14	197
596	404	delivery_completed	2023-11-20 14:51:44	2023-11-20 14:51:44	1	15	197
597	405	request_created	2023-11-20 14:53:13	2023-11-20 14:53:13	1	0	117
598	405	accepted	2023-11-20 14:54:03	2023-11-20 14:53:13	1	2	117
599	405	collected_from_shipper	2023-11-20 14:54:12	2023-11-20 14:54:12	1	10	198
600	405	cargo_cleared_at_origin_border	2023-11-20 14:54:19	2023-11-20 14:54:19	1	11	198
601	405	cargo_tracking	2023-11-20 14:54:24	2023-11-20 14:54:24	1	12	198
602	405	cargo_reached_destination_border	2023-11-20 14:54:29	2023-11-20 14:54:29	1	13	198
603	405	cargo_cleared_destination_customs	2023-11-20 14:54:36	2023-11-20 14:54:36	1	14	198
604	405	delivery_completed	2023-11-20 14:54:56	2023-11-20 14:54:56	1	15	198
605	406	request_created	2023-11-20 15:18:45	2023-11-20 15:18:45	180	0	118
606	406	accepted	2023-11-20 15:20:19	2023-11-20 15:18:45	180	2	118
607	406	journey_started	2023-11-20 15:20:43	2023-11-20 15:20:43	180	4	118
608	406	item_collected	2023-11-20 15:20:46	2023-11-20 15:20:46	180	5	118
609	406	on_the_way	2023-11-20 15:20:49	2023-11-20 15:20:49	180	6	118
610	406	border_crossing	2023-11-20 15:20:53	2023-11-20 15:20:53	180	7	118
611	406	custom_clearance	2023-11-20 15:20:55	2023-11-20 15:20:55	180	8	118
612	406	delivered	2023-11-20 15:21:17	2023-11-20 15:21:17	180	9	118
613	407	request_created	2023-11-20 15:25:09	2023-11-20 15:25:09	1	0	119
614	407	accepted	2023-11-20 15:26:06	2023-11-20 15:25:09	1	2	119
615	407	collected_from_shipper	2023-11-20 15:26:14	2023-11-20 15:26:14	1	10	200
616	407	cargo_cleared_at_origin_border	2023-11-20 15:26:18	2023-11-20 15:26:18	1	11	200
617	407	cargo_tracking	2023-11-20 15:26:22	2023-11-20 15:26:22	1	12	200
618	407	cargo_reached_destination_border	2023-11-20 15:26:41	2023-11-20 15:26:41	1	13	200
619	407	cargo_cleared_destination_customs	2023-11-20 15:26:46	2023-11-20 15:26:46	1	14	200
620	407	delivery_completed	2023-11-20 15:26:51	2023-11-20 15:26:51	1	15	200
621	408	request_created	2023-11-21 09:37:50	2023-11-21 09:37:50	185	0	120
622	408	accepted	2023-11-21 09:59:17	2023-11-21 09:37:50	185	2	120
623	408	journey_started	2023-11-21 10:03:31	2023-11-21 10:03:31	185	4	120
624	408	item_collected	2023-11-21 10:04:31	2023-11-21 10:04:31	185	5	120
625	408	on_the_way	2023-11-21 10:06:28	2023-11-21 10:06:28	185	6	120
626	408	border_crossing	2023-11-21 10:06:33	2023-11-21 10:06:33	185	7	120
627	408	custom_clearance	2023-11-21 10:06:36	2023-11-21 10:06:36	185	8	120
628	408	delivered	2023-11-21 10:09:14	2023-11-21 10:09:14	185	9	120
629	410	request_created	2023-11-21 10:50:54	2023-11-21 10:50:54	1	0	121
630	410	accepted	2023-11-21 10:55:02	2023-11-21 10:50:54	1	2	121
631	410	collected_from_shipper	2023-11-21 10:56:22	2023-11-21 10:56:22	1	10	203
632	410	cargo_cleared_at_origin_border	2023-11-21 10:56:37	2023-11-21 10:56:37	1	11	203
633	410	cargo_tracking	2023-11-21 10:57:01	2023-11-21 10:57:01	1	12	203
634	410	cargo_reached_destination_border	2023-11-21 10:57:12	2023-11-21 10:57:12	1	13	203
635	410	cargo_cleared_destination_customs	2023-11-21 10:57:17	2023-11-21 10:57:17	1	14	203
636	410	delivery_completed	2023-11-21 10:57:26	2023-11-21 10:57:26	1	15	203
637	411	request_created	2023-11-21 11:02:09	2023-11-21 11:02:09	1	0	122
638	411	accepted	2023-11-21 11:05:29	2023-11-21 11:02:09	1	2	122
639	411	collected_from_shipper	2023-11-21 11:06:11	2023-11-21 11:06:11	1	10	204
640	411	cargo_cleared_at_origin_border	2023-11-21 11:06:14	2023-11-21 11:06:14	1	11	204
641	411	cargo_tracking	2023-11-21 11:06:18	2023-11-21 11:06:18	1	12	204
642	411	cargo_reached_destination_border	2023-11-21 11:06:22	2023-11-21 11:06:22	1	13	204
643	411	cargo_cleared_destination_customs	2023-11-21 11:06:26	2023-11-21 11:06:26	1	14	204
644	411	delivery_completed	2023-11-21 11:06:30	2023-11-21 11:06:30	1	15	204
645	412	request_created	2023-11-21 11:10:51	2023-11-21 11:10:51	1	0	123
646	412	accepted	2023-11-21 11:12:49	2023-11-21 11:10:51	1	2	123
647	412	collected_from_shipper	2023-11-21 11:14:22	2023-11-21 11:14:22	1	10	205
648	412	cargo_cleared_at_origin_border	2023-11-21 11:14:27	2023-11-21 11:14:27	1	11	205
649	412	cargo_tracking	2023-11-21 11:14:30	2023-11-21 11:14:30	1	12	205
650	412	cargo_reached_destination_border	2023-11-21 11:14:34	2023-11-21 11:14:34	1	13	205
651	412	cargo_cleared_destination_customs	2023-11-21 11:14:37	2023-11-21 11:14:37	1	14	205
652	412	delivery_completed	2023-11-21 11:14:41	2023-11-21 11:14:41	1	15	205
653	413	request_created	2023-11-21 11:19:38	2023-11-21 11:19:38	1	0	124
654	413	accepted	2023-11-21 11:21:17	2023-11-21 11:19:38	1	2	124
655	413	items_received_in_warehouse	2023-11-21 11:21:57	2023-11-21 11:21:57	1	16	206
656	413	items_stored	2023-11-21 11:22:55	2023-11-21 11:22:55	1	17	206
660	413	delivery_completed	2023-11-21 17:30:44	2023-11-21 17:30:44	1	15	206
661	409	request_created	2023-11-21 10:29:01	2023-11-21 10:29:01	185	0	125
662	409	accepted	2023-11-30 08:25:32	2023-11-21 10:29:01	185	2	125
120	115	delivered	2023-11-30 09:28:36	2023-11-30 09:28:36	90	9	21
663	106	journey_started	2023-12-01 12:11:10	2023-12-01 12:11:10	83	4	14
664	106	item_collected	2023-12-01 13:31:34	2023-12-01 13:31:34	83	5	14
665	106	on_the_way	2023-12-01 13:38:13	2023-12-01 13:38:13	83	6	14
666	106	border_crossing	2023-12-01 13:38:25	2023-12-01 13:38:25	83	7	14
667	106	custom_clearance	2023-12-01 13:38:35	2023-12-01 13:38:35	83	8	14
668	106	delivered	2023-12-01 13:38:57	2023-12-01 13:38:57	83	9	14
669	418	request_created	2023-12-01 14:40:18	2023-12-01 14:40:18	168	0	126
670	418	accepted	2023-12-01 14:57:39	2023-12-01 14:40:18	168	2	126
671	260	journey_started	2023-12-01 15:15:04	2023-12-01 15:15:04	83	4	73
672	260	item_collected	2023-12-01 15:15:07	2023-12-01 15:15:07	83	5	73
673	260	on_the_way	2023-12-01 15:15:10	2023-12-01 15:15:10	83	6	73
674	260	border_crossing	2023-12-01 15:15:12	2023-12-01 15:15:12	83	7	73
675	260	custom_clearance	2023-12-01 15:15:13	2023-12-01 15:15:13	83	8	73
676	430	request_created	2023-12-02 11:33:45	2023-12-02 11:33:45	162	0	127
677	430	accepted	2023-12-02 11:35:45	2023-12-02 11:33:45	162	2	127
678	432	request_created	2023-12-02 12:06:52	2023-12-02 12:06:52	185	0	128
679	432	accepted	2023-12-02 12:07:47	2023-12-02 12:06:52	185	2	128
680	432	journey_started	2023-12-02 12:08:00	2023-12-02 12:08:00	185	4	128
681	430	journey_started	2023-12-02 12:18:10	2023-12-02 12:18:10	162	4	127
682	430	item_collected	2023-12-02 12:18:35	2023-12-02 12:18:35	162	5	127
683	438	request_created	2023-12-04 13:23:18	2023-12-04 13:23:18	188	0	129
684	438	accepted	2023-12-04 13:59:17	2023-12-04 13:23:18	188	2	129
685	438	journey_started	2023-12-04 13:59:55	2023-12-04 13:59:55	188	4	129
686	438	item_collected	2023-12-04 14:03:55	2023-12-04 14:03:55	188	5	129
687	438	on_the_way	2023-12-04 14:03:59	2023-12-04 14:03:59	188	6	129
688	438	border_crossing	2023-12-04 14:04:02	2023-12-04 14:04:02	188	7	129
689	438	custom_clearance	2023-12-04 14:04:05	2023-12-04 14:04:05	188	8	129
691	441	request_created	2023-12-04 14:48:02	2023-12-04 14:48:02	177	0	130
692	441	accepted	2023-12-04 14:50:46	2023-12-04 14:48:02	177	2	130
693	441	request_created	2023-12-04 14:48:02	2023-12-04 14:48:02	139	0	131
694	441	accepted	2023-12-04 14:50:46	2023-12-04 14:48:02	139	2	131
695	441	journey_started	2023-12-04 14:51:04	2023-12-04 14:51:04	139	4	131
696	441	item_collected	2023-12-04 14:51:40	2023-12-04 14:51:40	139	5	131
697	441	journey_started	2023-12-04 14:52:26	2023-12-04 14:52:26	177	4	130
690	438	delivered	2023-12-04 15:34:54	2023-12-04 15:34:54	188	9	129
698	260	delivered	2023-12-04 16:35:58	2023-12-04 16:35:58	83	9	73
699	105	on_the_way	2023-12-04 16:37:40	2023-12-04 16:37:40	83	6	11
700	105	border_crossing	2023-12-04 16:37:42	2023-12-04 16:37:42	83	7	11
701	105	custom_clearance	2023-12-04 16:37:43	2023-12-04 16:37:43	83	8	11
702	105	delivered	2023-12-04 16:38:03	2023-12-04 16:38:03	83	9	11
703	443	request_created	2023-12-05 09:38:24	2023-12-05 09:38:24	188	0	132
704	443	accepted	2023-12-05 09:48:40	2023-12-05 09:38:24	188	2	132
705	444	request_created	2023-12-05 09:42:39	2023-12-05 09:42:39	1	0	133
706	444	accepted	2023-12-05 09:48:52	2023-12-05 09:42:39	1	2	133
707	449	request_created	2023-12-26 08:32:54	2023-12-26 08:32:54	188	0	134
708	449	accepted	2023-12-26 08:34:53	2023-12-26 08:32:54	188	2	134
709	449	journey_started	2023-12-26 08:37:39	2023-12-26 08:37:39	188	4	134
710	449	item_collected	2023-12-26 08:38:12	2023-12-26 08:38:12	188	5	134
711	449	on_the_way	2023-12-26 08:38:16	2023-12-26 08:38:16	188	6	134
712	449	border_crossing	2023-12-26 08:38:20	2023-12-26 08:38:20	188	7	134
713	449	custom_clearance	2023-12-26 08:38:23	2023-12-26 08:38:23	188	8	134
714	449	delivered	2023-12-26 08:39:28	2023-12-26 08:39:28	188	9	134
715	452	request_created	2024-06-03 10:46:54	2024-06-03 10:46:54	190	0	135
716	452	accepted	2024-06-03 11:12:28	2024-06-03 10:46:54	190	2	135
717	452	journey_started	2024-06-03 11:15:55	2024-06-03 11:15:55	190	4	135
718	452	item_collected	2024-06-03 11:16:01	2024-06-03 11:16:01	190	5	135
719	452	on_the_way	2024-06-03 11:16:07	2024-06-03 11:16:07	190	6	135
720	452	border_crossing	2024-06-03 11:16:14	2024-06-03 11:16:14	190	7	135
721	452	custom_clearance	2024-06-03 11:16:19	2024-06-03 11:16:19	190	8	135
722	452	delivered	2024-06-03 11:17:20	2024-06-03 11:17:20	190	9	135
723	453	request_created	2024-06-03 10:49:06	2024-06-03 10:49:06	190	0	136
724	453	accepted	2024-06-03 11:19:33	2024-06-03 10:49:06	190	2	136
725	453	journey_started	2024-06-03 11:20:02	2024-06-03 11:20:02	190	4	136
726	453	item_collected	2024-06-03 11:20:56	2024-06-03 11:20:56	190	5	136
727	453	on_the_way	2024-06-03 11:21:01	2024-06-03 11:21:01	190	6	136
728	456	request_created	2024-06-03 14:30:18	2024-06-03 14:30:18	190	0	137
729	456	accepted	2024-06-03 14:34:34	2024-06-03 14:30:18	190	2	137
730	453	border_crossing	2024-06-03 14:42:22	2024-06-03 14:42:22	190	7	136
731	453	custom_clearance	2024-06-03 14:42:33	2024-06-03 14:42:33	190	8	136
732	453	delivered	2024-06-03 14:42:57	2024-06-03 14:42:57	190	9	136
733	456	journey_started	2024-06-03 16:41:43	2024-06-03 16:41:43	190	4	137
734	456	item_collected	2024-06-03 16:41:48	2024-06-03 16:41:48	190	5	137
735	456	on_the_way	2024-06-03 16:41:52	2024-06-03 16:41:52	190	6	137
736	456	border_crossing	2024-06-03 16:41:56	2024-06-03 16:41:56	190	7	137
737	456	custom_clearance	2024-06-03 16:42:03	2024-06-03 16:42:03	190	8	137
738	456	delivered	2024-06-03 16:42:31	2024-06-03 16:42:31	190	9	137
739	458	request_created	2024-06-03 16:43:41	2024-06-03 16:43:41	190	0	138
740	458	accepted	2024-06-03 16:48:11	2024-06-03 16:43:41	190	2	138
741	457	request_created	2024-06-03 15:14:47	2024-06-03 15:14:47	190	0	139
742	457	accepted	2024-06-03 16:48:55	2024-06-03 15:14:47	190	2	139
743	458	journey_started	2024-06-03 16:49:30	2024-06-03 16:49:30	190	4	138
744	458	item_collected	2024-06-03 16:49:45	2024-06-03 16:49:45	190	5	138
745	458	on_the_way	2024-06-03 16:50:06	2024-06-03 16:50:06	190	6	138
746	458	border_crossing	2024-06-03 16:50:13	2024-06-03 16:50:13	190	7	138
747	458	custom_clearance	2024-06-03 16:50:20	2024-06-03 16:50:20	190	8	138
748	458	delivered	2024-06-03 16:50:51	2024-06-03 16:50:51	190	9	138
749	459	request_created	2024-06-03 16:56:17	2024-06-03 16:56:17	190	0	140
750	459	accepted	2024-06-03 16:58:50	2024-06-03 16:56:17	190	2	140
751	459	journey_started	2024-06-03 16:59:21	2024-06-03 16:59:21	190	4	140
752	459	item_collected	2024-06-03 16:59:29	2024-06-03 16:59:29	190	5	140
753	459	on_the_way	2024-06-03 16:59:42	2024-06-03 16:59:42	190	6	140
754	459	border_crossing	2024-06-03 17:00:29	2024-06-03 17:00:29	190	7	140
755	459	custom_clearance	2024-06-03 17:01:19	2024-06-03 17:01:19	190	8	140
756	459	delivered	2024-06-03 17:01:35	2024-06-03 17:01:35	190	9	140
757	460	request_created	2024-06-03 17:02:26	2024-06-03 17:02:26	1	0	141
758	460	accepted	2024-06-03 17:03:49	2024-06-03 17:02:26	1	2	141
759	460	collected_from_shipper	2024-06-03 17:05:18	2024-06-03 17:05:18	1	10	232
760	460	cargo_cleared_at_origin_border	2024-06-03 17:07:42	2024-06-03 17:07:42	1	11	232
761	460	cargo_tracking	2024-06-03 17:08:00	2024-06-03 17:08:00	1	12	232
762	460	cargo_reached_destination_border	2024-06-03 17:08:08	2024-06-03 17:08:08	1	13	232
763	460	cargo_cleared_destination_customs	2024-06-03 17:08:19	2024-06-03 17:08:19	1	14	232
764	460	delivery_completed	2024-06-03 17:08:29	2024-06-03 17:08:29	1	15	232
765	461	collected_from_shipper	2024-06-03 17:10:55	2024-06-03 17:10:55	1	10	233
766	461	cargo_cleared_at_origin_border	2024-06-03 17:11:00	2024-06-03 17:11:00	1	11	233
767	461	cargo_tracking	2024-06-03 17:11:04	2024-06-03 17:11:04	1	12	233
768	461	cargo_reached_destination_border	2024-06-03 17:11:10	2024-06-03 17:11:10	1	13	233
769	461	cargo_cleared_destination_customs	2024-06-03 17:11:16	2024-06-03 17:11:16	1	14	233
770	461	delivery_completed	2024-06-03 17:11:23	2024-06-03 17:11:23	1	15	233
771	462	request_created	2024-06-03 17:12:11	2024-06-03 17:12:11	1	0	142
772	462	accepted	2024-06-03 17:13:02	2024-06-03 17:12:11	1	2	142
773	462	collected_from_shipper	2024-06-03 17:13:24	2024-06-03 17:13:24	1	10	234
774	462	cargo_cleared_at_origin_border	2024-06-03 17:13:33	2024-06-03 17:13:33	1	11	234
775	462	cargo_tracking	2024-06-03 17:13:40	2024-06-03 17:13:40	1	12	234
776	462	cargo_reached_destination_border	2024-06-03 17:13:47	2024-06-03 17:13:47	1	13	234
777	463	request_created	2024-06-03 17:20:07	2024-06-03 17:20:07	190	0	143
778	463	accepted	2024-06-03 17:21:22	2024-06-03 17:20:07	190	2	143
779	463	journey_started	2024-06-03 17:21:36	2024-06-03 17:21:36	190	4	143
780	463	item_collected	2024-06-03 17:21:41	2024-06-03 17:21:41	190	5	143
781	463	on_the_way	2024-06-03 17:21:48	2024-06-03 17:21:48	190	6	143
782	463	border_crossing	2024-06-03 17:21:58	2024-06-03 17:21:58	190	7	143
783	463	custom_clearance	2024-06-03 17:22:17	2024-06-03 17:22:17	190	8	143
784	463	delivered	2024-06-03 17:22:46	2024-06-03 17:22:46	190	9	143
785	457	journey_started	2024-06-05 10:20:08	2024-06-05 10:20:08	190	4	139
786	470	request_created	2024-06-05 11:45:35	2024-06-05 11:45:35	190	0	144
787	470	accepted	2024-06-05 11:47:56	2024-06-05 11:45:35	190	2	144
788	469	request_created	2024-06-05 11:45:06	2024-06-05 11:45:06	190	0	145
789	469	accepted	2024-06-05 11:48:13	2024-06-05 11:45:06	190	2	145
790	469	journey_started	2024-06-05 11:48:30	2024-06-05 11:48:30	190	4	145
791	457	item_collected	2024-06-05 11:48:45	2024-06-05 11:48:45	190	5	139
792	471	request_created	2024-06-07 11:28:20	2024-06-07 11:28:20	192	0	146
793	471	accepted	2024-06-07 11:48:03	2024-06-07 11:28:20	192	2	146
794	471	journey_started	2024-06-07 11:52:27	2024-06-07 11:52:27	192	4	146
795	471	item_collected	2024-06-07 11:52:43	2024-06-07 11:52:43	192	5	146
796	471	on_the_way	2024-06-07 11:52:52	2024-06-07 11:52:52	192	6	146
797	474	request_created	2024-07-05 11:01:33	2024-07-05 11:01:33	194	0	147
798	474	accepted	2024-07-05 11:26:37	2024-07-05 11:01:33	194	2	147
799	474	journey_started	2024-07-05 11:28:17	2024-07-05 11:28:17	194	4	147
800	474	item_collected	2024-07-05 11:28:27	2024-07-05 11:28:27	194	5	147
801	474	on_the_way	2024-07-05 11:29:19	2024-07-05 11:29:19	194	6	147
802	474	border_crossing	2024-07-05 11:30:30	2024-07-05 11:30:30	194	7	147
803	474	custom_clearance	2024-07-05 11:30:34	2024-07-05 11:30:34	194	8	147
804	474	delivered	2024-07-05 11:31:32	2024-07-05 11:31:32	194	9	147
805	475	request_created	2024-07-05 11:33:56	2024-07-05 11:33:56	194	0	148
806	475	accepted	2024-07-05 11:40:25	2024-07-05 11:33:56	194	2	148
807	476	request_created	2024-09-18 12:47:21	2024-09-18 12:47:21	196	0	149
808	476	accepted	2024-09-18 13:34:46	2024-09-18 12:47:21	196	2	149
809	480	request_created	2025-02-13 13:41:50	2025-02-13 13:41:50	207	0	150
810	480	accepted	2025-02-13 13:56:43	2025-02-13 13:41:50	207	2	150
811	480	journey_started	2025-02-13 14:00:52	2025-02-13 14:00:52	207	4	150
812	480	item_collected	2025-02-13 14:02:24	2025-02-13 14:02:24	207	5	150
813	480	on_the_way	2025-02-13 14:04:21	2025-02-13 14:04:21	207	6	150
814	480	border_crossing	2025-02-13 14:05:07	2025-02-13 14:05:07	207	7	150
815	480	custom_clearance	2025-02-13 14:05:22	2025-02-13 14:05:22	207	8	150
816	480	delivered	2025-02-13 14:12:43	2025-02-13 14:12:43	207	9	150
817	481	request_created	2025-02-13 14:52:13	2025-02-13 14:52:13	207	0	151
818	481	accepted	2025-02-13 14:53:26	2025-02-13 14:52:13	207	2	151
819	481	journey_started	2025-02-13 14:53:40	2025-02-13 14:53:40	207	4	151
820	481	item_collected	2025-02-13 14:53:41	2025-02-13 14:53:41	207	5	151
821	481	on_the_way	2025-02-13 14:53:45	2025-02-13 14:53:45	207	6	151
822	481	border_crossing	2025-02-13 14:53:46	2025-02-13 14:53:46	207	7	151
823	481	custom_clearance	2025-02-13 14:53:47	2025-02-13 14:53:47	207	8	151
824	483	request_created	2025-02-13 20:04:16	2025-02-13 20:04:16	207	0	152
825	483	accepted	2025-02-13 20:25:13	2025-02-13 20:04:16	207	2	152
826	483	journey_started	2025-02-13 20:29:09	2025-02-13 20:29:09	207	4	152
827	483	item_collected	2025-02-13 20:29:49	2025-02-13 20:29:49	207	5	152
828	483	on_the_way	2025-02-13 20:30:10	2025-02-13 20:30:10	207	6	152
829	483	border_crossing	2025-02-13 20:33:46	2025-02-13 20:33:46	207	7	152
830	483	custom_clearance	2025-02-13 20:38:35	2025-02-13 20:38:35	207	8	152
831	483	delivered	2025-02-13 20:39:11	2025-02-13 20:39:11	207	9	152
832	485	collected_from_shipper	2025-02-13 20:50:28	2025-02-13 20:50:28	1	10	252
833	485	cargo_cleared_at_origin_border	2025-02-13 20:51:57	2025-02-13 20:51:57	1	11	252
834	485	cargo_tracking	2025-02-13 20:52:49	2025-02-13 20:52:49	1	12	252
835	485	cargo_reached_destination_border	2025-02-13 20:53:19	2025-02-13 20:53:19	1	13	252
836	485	cargo_cleared_destination_customs	2025-02-13 20:53:33	2025-02-13 20:53:33	1	14	252
837	485	delivery_completed	2025-02-13 20:53:51	2025-02-13 20:53:51	1	15	252
838	486	request_created	2025-02-13 21:03:21	2025-02-13 21:03:21	1	0	153
839	486	accepted	2025-02-13 21:05:23	2025-02-13 21:03:21	1	2	153
840	487	request_created	2025-02-13 21:12:46	2025-02-13 21:12:46	1	0	154
841	487	accepted	2025-02-13 21:22:53	2025-02-13 21:12:46	1	2	154
842	490	request_created	2025-02-13 21:36:57	2025-02-13 21:36:57	1	0	155
843	490	accepted	2025-02-13 21:41:09	2025-02-13 21:36:57	1	2	155
\.


--
-- Data for Name: booking_truck_alots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_truck_alots (id, booking_truck_id, user_id, role_id, created_at, updated_at) FROM stdin;
1	66	83	2	2023-10-11 09:27:58	2023-10-11 09:27:58
2	67	69	2	2023-10-16 15:31:02	2023-10-16 15:31:02
3	68	69	2	2023-10-16 15:58:23	2023-10-16 15:58:23
4	69	69	2	2023-10-16 16:04:21	2023-10-16 16:04:21
5	71	83	2	2023-10-16 16:30:06	2023-10-16 16:30:06
6	77	83	2	2023-10-17 10:48:22	2023-10-17 10:48:22
7	82	71	2	2023-10-17 12:43:12	2023-10-17 12:43:12
8	81	83	2	2023-10-17 12:45:28	2023-10-17 12:45:28
9	83	83	2	2023-10-17 13:28:37	2023-10-17 13:28:37
10	85	83	2	2023-10-17 15:07:45	2023-10-17 15:07:45
11	86	83	2	2023-10-17 15:17:56	2023-10-17 15:17:56
12	80	83	2	2023-10-18 08:48:46	2023-10-18 08:48:46
13	78	83	2	2023-10-18 08:51:16	2023-10-18 08:51:16
14	87	83	2	2023-10-18 08:53:12	2023-10-18 08:53:12
15	65	83	2	2023-10-18 09:06:22	2023-10-18 09:06:22
16	89	83	2	2023-10-18 12:27:53	2023-10-18 12:27:53
17	90	83	2	2023-10-18 12:31:54	2023-10-18 12:31:54
18	91	83	2	2023-10-18 12:33:18	2023-10-18 12:33:18
19	92	83	2	2023-10-18 12:45:35	2023-10-18 12:45:35
20	58	83	2	2023-10-18 12:50:44	2023-10-18 12:50:44
21	93	86	2	2023-10-18 17:27:30	2023-10-18 17:27:30
22	55	83	2	2023-10-18 22:12:59	2023-10-18 22:12:59
23	57	83	2	2023-10-18 22:13:38	2023-10-18 22:13:38
24	84	83	2	2023-10-18 22:15:20	2023-10-18 22:15:20
25	85	87	2	2023-10-19 12:33:36	2023-10-19 12:33:36
26	93	88	2	2023-10-19 12:39:19	2023-10-19 12:39:19
27	94	83	2	2023-10-20 13:11:15	2023-10-20 13:11:15
28	95	83	2	2023-10-20 15:48:21	2023-10-20 15:48:21
29	95	98	2	2023-10-20 15:48:25	2023-10-20 15:48:25
30	96	97	2	2023-10-20 15:48:28	2023-10-20 15:48:28
31	97	88	2	2023-10-20 15:48:32	2023-10-20 15:48:32
32	98	61	2	2023-10-20 17:01:38	2023-10-20 17:01:38
33	98	88	2	2023-10-20 17:02:02	2023-10-20 17:02:02
34	99	90	2	2023-10-24 11:22:24	2023-10-24 11:22:24
35	100	97	2	2023-10-24 11:22:28	2023-10-24 11:22:28
36	101	90	2	2023-10-24 11:35:59	2023-10-24 11:35:59
37	102	97	2	2023-10-24 11:36:03	2023-10-24 11:36:03
38	104	90	2	2023-10-24 12:08:44	2023-10-24 12:08:44
39	105	97	2	2023-10-24 12:08:48	2023-10-24 12:08:48
40	106	90	2	2023-10-24 12:15:35	2023-10-24 12:15:35
41	107	97	2	2023-10-24 12:15:39	2023-10-24 12:15:39
42	108	92	2	2023-10-24 14:51:06	2023-10-24 14:51:06
43	109	97	2	2023-10-24 14:51:09	2023-10-24 14:51:09
44	110	98	2	2023-10-24 16:40:59	2023-10-24 16:40:59
45	114	98	2	2023-10-25 10:31:59	2023-10-25 10:31:59
46	126	61	2	2023-10-26 10:51:10	2023-10-26 10:51:10
47	127	86	2	2023-10-26 10:53:51	2023-10-26 10:53:51
48	128	37	2	2023-10-26 11:25:07	2023-10-26 11:25:07
49	128	65	2	2023-10-26 11:25:07	2023-10-26 11:25:07
50	128	59	2	2023-10-26 11:25:07	2023-10-26 11:25:07
51	128	66	2	2023-10-26 11:25:07	2023-10-26 11:25:07
52	129	86	2	2023-10-26 11:41:11	2023-10-26 11:41:11
53	130	66	2	2023-10-26 12:36:47	2023-10-26 12:36:47
54	131	64	2	2023-10-26 12:43:38	2023-10-26 12:43:38
55	132	65	2	2023-10-26 14:50:13	2023-10-26 14:50:13
56	134	86	2	2023-10-26 15:16:39	2023-10-26 15:16:39
57	141	97	2	2023-10-26 15:31:44	2023-10-26 15:31:44
58	142	86	2	2023-10-26 15:35:40	2023-10-26 15:35:40
59	146	86	2	2023-10-26 15:51:12	2023-10-26 15:51:12
60	146	88	2	2023-10-26 15:51:15	2023-10-26 15:51:15
61	146	107	2	2023-10-26 15:51:19	2023-10-26 15:51:19
62	149	86	2	2023-10-26 17:54:23	2023-10-26 17:54:23
63	149	88	2	2023-10-26 17:54:27	2023-10-26 17:54:27
64	150	86	2	2023-10-27 09:32:48	2023-10-27 09:32:48
65	151	111	2	2023-10-27 09:32:52	2023-10-27 09:32:52
66	154	86	2	2023-10-27 10:04:16	2023-10-27 10:04:16
67	159	114	2	2023-10-27 11:40:11	2023-10-27 11:40:11
68	160	111	2	2023-10-27 11:40:14	2023-10-27 11:40:14
69	161	58	2	2023-11-01 13:44:53	2023-11-01 13:44:53
70	161	59	2	2023-11-01 13:44:56	2023-11-01 13:44:56
71	161	64	2	2023-11-01 13:44:59	2023-11-01 13:44:59
72	158	59	2	2023-11-07 10:55:41	2023-11-07 10:55:41
73	158	61	2	2023-11-07 10:55:45	2023-11-07 10:55:45
74	158	65	2	2023-11-07 10:55:47	2023-11-07 10:55:47
75	162	107	2	2023-11-07 11:12:12	2023-11-07 11:12:12
76	162	114	2	2023-11-07 11:12:15	2023-11-07 11:12:15
77	166	65	2	2023-11-09 17:44:45	2023-11-09 17:44:45
78	167	97	2	2023-11-10 07:57:10	2023-11-10 07:57:10
79	169	83	2	2023-11-10 16:30:33	2023-11-10 16:30:33
80	188	139	2	2023-11-13 14:57:59	2023-11-13 14:57:59
81	188	139	2	2023-11-13 14:58:07	2023-11-13 14:58:07
82	191	139	2	2023-11-13 15:25:04	2023-11-13 15:25:04
83	191	37	2	2023-11-13 15:27:37	2023-11-13 15:27:37
84	191	132	2	2023-11-13 15:41:54	2023-11-13 15:41:54
85	192	132	2	2023-11-13 15:51:56	2023-11-13 15:51:56
86	192	58	2	2023-11-13 15:57:21	2023-11-13 15:57:21
87	192	37	2	2023-11-13 16:45:46	2023-11-13 16:45:46
88	192	61	2	2023-11-13 16:46:38	2023-11-13 16:46:38
89	192	61	2	2023-11-13 16:47:20	2023-11-13 16:47:20
90	192	64	2	2023-11-13 16:47:36	2023-11-13 16:47:36
91	194	132	2	2023-11-13 18:33:31	2023-11-13 18:33:31
92	192	97	2	2023-11-13 18:55:06	2023-11-13 18:55:06
93	192	97	2	2023-11-13 18:57:42	2023-11-13 18:57:42
94	192	97	2	2023-11-13 19:04:22	2023-11-13 19:04:22
95	192	97	2	2023-11-13 19:10:12	2023-11-13 19:10:12
96	195	83	2	2023-11-14 09:41:14	2023-11-14 09:41:14
97	197	139	2	2023-11-14 09:56:21	2023-11-14 09:56:21
98	185	97	2	2023-11-14 11:14:00	2023-11-14 11:14:00
99	198	111	2	2023-11-14 11:46:39	2023-11-14 11:46:39
100	199	37	2	2023-11-14 13:01:13	2023-11-14 13:01:13
101	211	139	2	2023-11-14 16:29:16	2023-11-14 16:29:16
102	213	139	2	2023-11-14 17:13:26	2023-11-14 17:13:26
103	217	139	2	2023-11-14 17:29:41	2023-11-14 17:29:41
104	220	139	2	2023-11-14 17:54:58	2023-11-14 17:54:58
105	221	111	2	2023-11-14 19:32:48	2023-11-14 19:32:48
106	222	139	2	2023-11-14 20:14:11	2023-11-14 20:14:11
107	222	111	2	2023-11-14 20:18:33	2023-11-14 20:18:33
108	223	111	2	2023-11-14 20:29:20	2023-11-14 20:29:20
109	181	83	2	2023-11-14 23:05:09	2023-11-14 23:05:09
110	251	139	2	2023-11-16 10:44:59	2023-11-16 10:44:59
111	263	139	2	2023-11-16 19:52:30	2023-11-16 19:52:30
112	267	139	2	2023-11-17 09:20:45	2023-11-17 09:20:45
113	268	83	2	2023-11-17 10:06:46	2023-11-17 10:06:46
114	269	58	2	2023-11-17 10:25:41	2023-11-17 10:25:41
115	269	99	2	2023-11-17 10:26:46	2023-11-17 10:26:46
116	270	159	2	2023-11-17 12:43:59	2023-11-17 12:43:59
117	271	139	2	2023-11-17 12:49:14	2023-11-17 12:49:14
118	273	139	2	2023-11-17 13:11:53	2023-11-17 13:11:53
119	275	139	2	2023-11-17 13:28:56	2023-11-17 13:28:56
120	281	139	2	2023-11-17 18:11:26	2023-11-17 18:11:26
121	282	139	2	2023-11-17 18:17:31	2023-11-17 18:17:31
122	284	139	2	2023-11-17 19:11:19	2023-11-17 19:11:19
123	286	68	2	2023-11-18 14:10:49	2023-11-18 14:10:49
124	291	139	2	2023-11-18 15:23:57	2023-11-18 15:23:57
125	295	139	2	2023-11-18 16:03:43	2023-11-18 16:03:43
126	295	168	2	2023-11-18 16:04:12	2023-11-18 16:04:12
127	297	168	2	2023-11-18 17:07:50	2023-11-18 17:07:50
128	298	168	2	2023-11-18 17:26:35	2023-11-18 17:26:35
129	299	83	2	2023-11-18 17:26:53	2023-11-18 17:26:53
130	301	175	2	2023-11-19 09:12:38	2023-11-19 09:12:38
131	304	177	2	2023-11-19 10:46:25	2023-11-19 10:46:25
132	313	185	2	2023-11-21 10:31:37	2023-11-21 10:31:37
133	330	188	2	2023-12-04 14:41:10	2023-12-04 14:41:10
134	331	177	2	2023-12-04 14:43:24	2023-12-04 14:43:24
135	336	188	2	2023-12-05 09:46:35	2023-12-05 09:46:35
136	343	190	2	2024-06-03 11:00:44	2024-06-03 11:00:44
137	346	190	2	2024-06-03 15:44:43	2024-06-03 15:44:43
138	348	190	2	2024-06-03 16:57:31	2024-06-03 16:57:31
139	359	192	2	2024-06-07 12:10:50	2024-06-07 12:10:50
140	362	194	2	2024-07-05 11:36:28	2024-07-05 11:36:28
141	369	206	2	2025-02-13 20:09:09	2025-02-13 20:09:09
142	369	207	2	2025-02-13 20:09:13	2025-02-13 20:09:13
\.


--
-- Data for Name: booking_truck_carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_truck_carts (id, booking_cart_id, truck_id, quantity, gross_weight, created_at, updated_at) FROM stdin;
319	445	2	2	22	2023-11-17 13:24:47	2023-11-17 13:24:47
215	273	3	2	55	2023-11-13 16:58:00	2023-11-13 16:58:00
330	490	1	10	100 kg	2023-11-18 08:58:38	2023-11-18 08:58:38
388	629	2	2	9	2023-12-02 13:33:50	2023-12-02 13:33:50
354	537	4	2	236	2023-11-18 20:36:42	2023-11-18 20:36:42
251	321	2	2	50	2023-11-14 16:05:52	2023-11-14 16:05:52
252	321	3	3	500	2023-11-14 16:06:00	2023-11-14 16:06:00
418	684	8	2	2500	2024-06-07 12:30:49	2024-06-07 12:30:49
419	684	9	2	500	2024-06-07 12:31:08	2024-06-07 12:31:08
\.


--
-- Data for Name: booking_trucks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_trucks (id, booking_id, truck_id, quantity, gross_weight, created_at, updated_at) FROM stdin;
44	54	2	1	10 KG	2023-08-26 15:24:39	2023-08-26 15:24:39
45	55	2	50	590	2023-08-26 20:33:03	2023-08-26 20:33:03
46	56	3	100	600	2023-08-26 20:38:12	2023-08-26 20:38:12
47	57	2	25	66	2023-09-04 12:08:39	2023-09-04 12:08:39
48	58	3	3	33 kg	2023-10-07 13:44:06	2023-10-07 13:44:06
49	59	3	3	33 kg	2023-10-07 13:44:49	2023-10-07 13:44:49
50	60	2	1	1 kg	2023-10-07 13:47:17	2023-10-07 13:47:17
51	61	2	1	1 kg	2023-10-07 13:47:33	2023-10-07 13:47:33
52	62	2	1	1 kg	2023-10-07 13:47:49	2023-10-07 13:47:49
53	63	2	1	1 kg	2023-10-07 13:48:45	2023-10-07 13:48:45
54	64	3	1	1 kg	2023-10-07 13:51:24	2023-10-07 13:51:24
55	65	1	2	1kg	2023-10-07 14:00:38	2023-10-07 14:00:38
56	66	2	1	1 kg	2023-10-07 16:09:00	2023-10-07 16:09:00
57	67	1	22	23 kg	2023-10-07 16:24:13	2023-10-07 16:24:13
58	68	1	250	34	2023-10-07 17:50:52	2023-10-07 17:50:52
59	69	2	250	100	2023-10-07 17:52:24	2023-10-07 17:52:24
60	72	3	250	12	2023-10-09 17:11:04	2023-10-09 17:11:04
61	74	3	1	20	2023-10-09 17:24:45	2023-10-09 17:24:45
62	75	3	2	34	2023-10-09 17:32:59	2023-10-09 17:32:59
63	78	3	1	20	2023-10-10 17:18:08	2023-10-10 17:18:08
64	79	3	2	30	2023-10-10 17:21:28	2023-10-10 17:21:28
65	80	1	2	39	2023-10-11 00:17:54	2023-10-11 00:17:54
66	81	1	1	20	2023-10-11 09:11:09	2023-10-11 09:11:09
67	82	2	2	29	2023-10-16 14:50:04	2023-10-16 14:50:04
68	83	2	1	10 KG	2023-10-16 15:57:48	2023-10-16 15:57:48
69	84	2	1	10 KG	2023-10-16 16:03:48	2023-10-16 16:03:48
70	85	2	1	10 KG	2023-10-16 16:17:37	2023-10-16 16:17:37
71	86	1	1	10 KG	2023-10-16 16:29:22	2023-10-16 16:29:22
72	87	1	1	10 KG	2023-10-16 17:08:18	2023-10-16 17:08:18
73	88	1	1	10 KG	2023-10-16 17:11:31	2023-10-16 17:11:31
74	90	2	2	10	2023-10-16 17:17:20	2023-10-16 17:17:20
75	92	2	2	20	2023-10-17 09:08:51	2023-10-17 09:08:51
76	93	2	2	25	2023-10-17 09:14:45	2023-10-17 09:14:45
77	94	1	2	29	2023-10-17 10:47:21	2023-10-17 10:47:21
78	95	1	10	100	2023-10-17 11:35:01	2023-10-17 11:35:01
79	96	2	10	100 kg	2023-10-17 11:43:21	2023-10-17 11:43:21
80	97	1	1	10 KG	2023-10-17 11:46:24	2023-10-17 11:46:24
81	98	1	1	10 KG	2023-10-17 11:46:59	2023-10-17 11:46:59
82	99	2	10	100 kg	2023-10-17 12:04:06	2023-10-17 12:04:06
83	100	1	11	110	2023-10-17 13:27:58	2023-10-17 13:27:58
84	101	1	1	10 KG	2023-10-17 15:02:30	2023-10-17 15:02:30
85	91	1	45	2x3x4	2023-10-17 15:07:45	2023-10-17 15:07:45
86	102	1	10	100	2023-10-17 15:17:05	2023-10-17 15:17:05
87	89	1	5	54	2023-10-18 08:53:12	2023-10-18 08:53:12
88	103	1	10	100 kg	2023-10-18 10:03:58	2023-10-18 10:03:58
89	76	1	13	34	2023-10-18 12:27:53	2023-10-18 12:27:53
90	73	1	3	34	2023-10-18 12:31:54	2023-10-18 12:31:54
91	71	1	21	33	2023-10-18 12:33:18	2023-10-18 12:33:18
92	70	1	80	34	2023-10-18 12:45:35	2023-10-18 12:45:35
93	104	2	30	15	2023-10-18 16:28:07	2023-10-18 16:28:07
94	105	1	1	12	2023-10-20 13:11:15	2023-10-20 13:11:15
95	106	1	2	250	2023-10-20 15:42:41	2023-10-20 15:42:41
96	106	3	1	250	2023-10-20 15:42:41	2023-10-20 15:42:41
97	106	2	2	250	2023-10-20 15:42:41	2023-10-20 15:42:41
98	108	2	250	24	2023-10-20 17:01:38	2023-10-20 17:01:38
99	111	2	10	100	2023-10-24 11:21:33	2023-10-24 11:21:33
100	111	3	15	50	2023-10-24 11:21:33	2023-10-24 11:21:33
101	112	2	10	40	2023-10-24 11:35:07	2023-10-24 11:35:07
102	112	3	15	50	2023-10-24 11:35:07	2023-10-24 11:35:07
103	113	3	5	45	2023-10-24 11:38:30	2023-10-24 11:38:30
104	114	2	5	50kg	2023-10-24 11:51:13	2023-10-24 11:51:13
105	114	3	10	100	2023-10-24 11:51:13	2023-10-24 11:51:13
106	115	2	10	100	2023-10-24 12:11:37	2023-10-24 12:11:37
107	115	3	50	50	2023-10-24 12:11:37	2023-10-24 12:11:37
108	116	2	2	100	2023-10-24 14:47:56	2023-10-24 14:47:56
109	116	3	2	45	2023-10-24 14:47:56	2023-10-24 14:47:56
110	118	1	1	10 KG	2023-10-24 15:18:46	2023-10-24 15:18:46
111	119	3	12	90	2023-10-24 17:00:17	2023-10-24 17:00:17
112	119	2	12	120	2023-10-24 17:00:17	2023-10-24 17:00:17
113	119	1	12	90	2023-10-24 17:00:17	2023-10-24 17:00:17
114	120	1	24	24	2023-10-25 10:31:59	2023-10-25 10:31:59
115	122	3	2	44	2023-10-25 16:14:22	2023-10-25 16:14:22
116	122	4	1	99	2023-10-25 16:14:22	2023-10-25 16:14:22
117	122	2	1	21	2023-10-25 16:14:22	2023-10-25 16:14:22
118	122	1	1	22	2023-10-25 16:14:22	2023-10-25 16:14:22
119	124	2	2	250	2023-10-26 09:57:27	2023-10-26 09:57:27
120	125	1	10	100 kg	2023-10-26 09:58:46	2023-10-26 09:58:46
121	126	1	10	100 kg	2023-10-26 10:02:54	2023-10-26 10:02:54
122	127	2	2	250	2023-10-26 10:08:31	2023-10-26 10:08:31
123	128	2	1	10	2023-10-26 10:28:00	2023-10-26 10:28:00
124	128	2	2	20	2023-10-26 10:28:00	2023-10-26 10:28:00
125	129	2	2	250	2023-10-26 10:28:43	2023-10-26 10:28:43
126	131	2	1	10	2023-10-26 10:51:10	2023-10-26 10:51:10
127	130	2	2	240	2023-10-26 10:53:51	2023-10-26 10:53:51
128	132	2	5	10	2023-10-26 11:25:07	2023-10-26 11:25:07
129	135	2	2	24	2023-10-26 11:41:11	2023-10-26 11:41:11
130	139	2	1	10	2023-10-26 12:36:47	2023-10-26 12:36:47
131	140	2	1	12	2023-10-26 12:43:38	2023-10-26 12:43:38
132	138	2	1	10	2023-10-26 14:50:13	2023-10-26 14:50:13
133	141	3	1	250	2023-10-26 15:00:33	2023-10-26 15:00:33
134	142	2	25	26	2023-10-26 15:16:39	2023-10-26 15:16:39
135	143	1	1	10 KG	2023-10-26 15:19:12	2023-10-26 15:19:12
136	143	2	1	10 KG	2023-10-26 15:19:12	2023-10-26 15:19:12
137	143	3	1	10 KG	2023-10-26 15:19:12	2023-10-26 15:19:12
138	145	1	1	66	2023-10-26 15:27:03	2023-10-26 15:27:03
139	145	3	3	12	2023-10-26 15:27:03	2023-10-26 15:27:03
140	145	2	1	21	2023-10-26 15:27:03	2023-10-26 15:27:03
141	146	3	2	22	2023-10-26 15:28:33	2023-10-26 15:28:33
142	146	2	2	22	2023-10-26 15:35:40	2023-10-26 15:35:40
143	147	1	2	67	2023-10-26 15:40:14	2023-10-26 15:40:14
144	148	3	3	56	2023-10-26 15:41:52	2023-10-26 15:41:52
145	148	4	3	66	2023-10-26 15:41:52	2023-10-26 15:41:52
146	149	2	3	33	2023-10-26 15:46:35	2023-10-26 15:46:35
147	150	4	10	100 kg	2023-10-26 16:38:25	2023-10-26 16:38:25
148	152	5	1	25	2023-10-26 16:40:46	2023-10-26 16:40:46
149	153	2	2	25	2023-10-26 17:12:44	2023-10-26 17:12:44
150	158	2	1	250	2023-10-27 09:13:45	2023-10-27 09:13:45
151	158	3	1	250	2023-10-27 09:13:45	2023-10-27 09:13:45
152	159	4	1	25	2023-10-27 09:51:14	2023-10-27 09:51:14
153	160	6	1	250	2023-10-27 09:52:03	2023-10-27 09:52:03
154	161	2	1	25	2023-10-27 10:04:16	2023-10-27 10:04:16
155	162	4	10	100 kg	2023-10-27 10:11:52	2023-10-27 10:11:52
156	164	4	2	66	2023-10-27 10:22:59	2023-10-27 10:22:59
157	166	5	3	99	2023-10-27 10:29:15	2023-10-27 10:29:15
158	167	2	3	77	2023-10-27 10:46:08	2023-10-27 10:46:08
159	170	2	1	25	2023-10-27 11:16:13	2023-10-27 11:16:13
160	170	3	1	4	2023-10-27 11:16:13	2023-10-27 11:16:13
161	169	2	1	23	2023-11-01 13:44:53	2023-11-01 13:44:53
162	172	2	2	1	2023-11-07 11:10:19	2023-11-07 11:10:19
163	173	3	2	12	2023-11-09 11:09:37	2023-11-09 11:09:37
164	175	1	1	10	2023-11-09 12:41:13	2023-11-09 12:41:13
165	176	1	1	10	2023-11-09 12:42:48	2023-11-09 12:42:48
166	177	2	100	1111	2023-11-09 17:44:45	2023-11-09 17:44:45
167	178	3	10	111	2023-11-10 07:57:10	2023-11-10 07:57:10
168	180	2	12	25	2023-11-10 16:27:26	2023-11-10 16:27:26
169	181	1	12	32	2023-11-10 16:30:03	2023-11-10 16:30:03
170	182	1	12	21	2023-11-10 16:48:56	2023-11-10 16:48:56
171	183	2	2	500	2023-11-13 09:54:35	2023-11-13 09:54:35
172	184	1	20	2	2023-11-13 10:04:42	2023-11-13 10:04:42
173	185	1	12	2	2023-11-13 10:08:50	2023-11-13 10:08:50
174	188	1	2	1	2023-11-13 10:16:41	2023-11-13 10:16:41
175	189	1	2	1	2023-11-13 10:20:52	2023-11-13 10:20:52
176	190	3	2222	600@	2023-11-13 10:24:45	2023-11-13 10:24:45
177	193	2	1	10 KG	2023-11-13 10:44:10	2023-11-13 10:44:10
178	195	1	2	2	2023-11-13 11:38:16	2023-11-13 11:38:16
179	196	2	0	00	2023-11-13 11:49:22	2023-11-13 11:49:22
180	197	5	5556	ffggg	2023-11-13 13:35:37	2023-11-13 13:35:37
181	199	1	9	3	2023-11-13 13:46:59	2023-11-13 13:46:59
182	199	3	4	8	2023-11-13 13:46:59	2023-11-13 13:46:59
183	201	5	2	4555	2023-11-13 13:56:05	2023-11-13 13:56:05
184	203	2	2	55	2023-11-13 13:56:54	2023-11-13 13:56:54
185	204	2	6	5	2023-11-13 14:04:06	2023-11-13 14:04:06
186	204	1	7	7	2023-11-13 14:04:06	2023-11-13 14:04:06
187	217	7	2	3	2023-11-13 14:29:25	2023-11-13 14:29:25
188	219	2	2	34	2023-11-13 14:56:24	2023-11-13 14:56:24
189	220	2	2	rtt	2023-11-13 14:58:09	2023-11-13 14:58:09
190	221	3	2	55	2023-11-13 15:18:15	2023-11-13 15:18:15
191	222	2	2	55	2023-11-13 15:24:06	2023-11-13 15:24:06
192	223	2	2	55	2023-11-13 15:47:56	2023-11-13 15:47:56
193	224	2	122222	55888888	2023-11-13 16:51:52	2023-11-13 16:51:52
194	225	2	2	55	2023-11-13 18:32:21	2023-11-13 18:32:21
195	226	1	2	5	2023-11-13 22:23:37	2023-11-13 22:23:37
196	229	7	2	5	2023-11-13 23:10:22	2023-11-13 23:10:22
197	232	2	1	50	2023-11-14 09:56:21	2023-11-14 09:56:21
198	233	3	44	44	2023-11-14 11:46:39	2023-11-14 11:46:39
199	234	2	2	5000	2023-11-14 12:57:29	2023-11-14 12:57:29
200	235	3	2	3	2023-11-14 13:04:57	2023-11-14 13:04:57
201	235	2	3	2	2023-11-14 13:04:57	2023-11-14 13:04:57
202	236	2	2	55	2023-11-14 13:09:56	2023-11-14 13:09:56
203	236	3	3	88	2023-11-14 13:09:56	2023-11-14 13:09:56
204	236	1	1	32	2023-11-14 13:09:56	2023-11-14 13:09:56
205	237	2	2	55	2023-11-14 13:10:22	2023-11-14 13:10:22
206	237	3	3	44	2023-11-14 13:10:22	2023-11-14 13:10:22
207	238	3	3	55	2023-11-14 13:10:55	2023-11-14 13:10:55
208	239	1	1	1	2023-11-14 13:11:14	2023-11-14 13:11:14
209	241	2	2	50	2023-11-14 16:03:38	2023-11-14 16:03:38
210	241	3	3	500	2023-11-14 16:03:38	2023-11-14 16:03:38
211	240	2	1	500	2023-11-14 16:29:16	2023-11-14 16:29:16
212	242	4	2	55	2023-11-14 16:32:02	2023-11-14 16:32:02
213	243	2	2	55	2023-11-14 17:12:07	2023-11-14 17:12:07
214	243	3	3	5555	2023-11-14 17:12:07	2023-11-14 17:12:07
215	244	2	2	55	2023-11-14 17:12:58	2023-11-14 17:12:58
216	244	3	3	5555	2023-11-14 17:12:58	2023-11-14 17:12:58
217	245	2	1	1	2023-11-14 17:29:22	2023-11-14 17:29:22
218	246	4	1	1	2023-11-14 17:39:08	2023-11-14 17:39:08
219	246	5	2	55	2023-11-14 17:39:08	2023-11-14 17:39:08
220	247	2	2	5000	2023-11-14 17:54:58	2023-11-14 17:54:58
221	251	2	2	55	2023-11-14 19:31:46	2023-11-14 19:31:46
222	252	2	1	22	2023-11-14 20:14:00	2023-11-14 20:14:00
223	253	2	2	55	2023-11-14 20:29:01	2023-11-14 20:29:01
224	254	7	2	2	2023-11-15 13:24:59	2023-11-15 13:24:59
225	255	1	10	100 kg	2023-11-15 13:25:17	2023-11-15 13:25:17
226	258	2	1	10 KG	2023-11-15 13:30:13	2023-11-15 13:30:13
227	259	1	2	2	2023-11-15 13:30:36	2023-11-15 13:30:36
228	261	2	2	55	2023-11-15 13:45:06	2023-11-15 13:45:06
229	261	3	1	22	2023-11-15 13:45:06	2023-11-15 13:45:06
230	262	2	1	55	2023-11-15 13:48:06	2023-11-15 13:48:06
231	263	2	1	1	2023-11-15 14:19:50	2023-11-15 14:19:50
232	263	3	2	55	2023-11-15 14:19:50	2023-11-15 14:19:50
233	263	1	3	55555	2023-11-15 14:19:50	2023-11-15 14:19:50
234	264	2	1	11	2023-11-15 14:38:18	2023-11-15 14:38:18
235	265	2	2	55	2023-11-15 14:46:56	2023-11-15 14:46:56
236	265	3	3	54	2023-11-15 14:46:56	2023-11-15 14:46:56
237	265	1	4	66	2023-11-15 14:46:56	2023-11-15 14:46:56
238	266	2	2	3000	2023-11-15 15:29:33	2023-11-15 15:29:33
239	267	2	2	5000	2023-11-15 15:33:50	2023-11-15 15:33:50
240	267	3	1	500	2023-11-15 15:33:50	2023-11-15 15:33:50
241	268	2	2	5000	2023-11-15 15:38:50	2023-11-15 15:38:50
242	268	3	1	50000	2023-11-15 15:38:50	2023-11-15 15:38:50
243	269	2	1	55	2023-11-15 17:42:52	2023-11-15 17:42:52
244	269	3	2	55	2023-11-15 17:42:52	2023-11-15 17:42:52
245	270	2	2	5000	2023-11-15 18:47:18	2023-11-15 18:47:18
246	271	2	1	22	2023-11-15 18:53:51	2023-11-15 18:53:51
247	272	2	2	50	2023-11-15 19:03:55	2023-11-15 19:03:55
248	273	2	2	500	2023-11-15 19:34:48	2023-11-15 19:34:48
249	274	4	2	55	2023-11-16 09:34:50	2023-11-16 09:34:50
250	276	1	2	10 KG	2023-11-16 10:35:32	2023-11-16 10:35:32
251	277	2	2	10 KG	2023-11-16 10:38:19	2023-11-16 10:38:19
252	278	3	2	500	2023-11-16 10:50:08	2023-11-16 10:50:08
253	279	2	1	11	2023-11-16 11:08:18	2023-11-16 11:08:18
254	280	2	11	3	2023-11-16 11:32:34	2023-11-16 11:32:34
255	284	2	1	10 KG	2023-11-16 15:35:28	2023-11-16 15:35:28
256	285	2	1	10 KG	2023-11-16 15:37:02	2023-11-16 15:37:02
257	287	2	1	10 KG	2023-11-16 15:40:07	2023-11-16 15:40:07
258	288	2	1	10 KG	2023-11-16 15:41:29	2023-11-16 15:41:29
259	289	2	1	10 KG	2023-11-16 15:55:35	2023-11-16 15:55:35
260	307	4	2	5	2023-11-16 17:26:08	2023-11-16 17:26:08
261	307	5	2	7	2023-11-16 17:26:08	2023-11-16 17:26:08
262	309	2	1	11	2023-11-16 17:38:09	2023-11-16 17:38:09
263	317	2	3	44	2023-11-16 19:52:30	2023-11-16 19:52:30
264	318	7	2	3	2023-11-16 23:08:56	2023-11-16 23:08:56
265	319	1	333	23	2023-11-16 23:50:58	2023-11-16 23:50:58
266	321	2	1	10 KG	2023-11-17 07:42:48	2023-11-17 07:42:48
267	322	2	1	11	2023-11-17 09:20:45	2023-11-17 09:20:45
268	260	1	3	12	2023-11-17 10:06:46	2023-11-17 10:06:46
269	323	2	10	10	2023-11-17 10:25:41	2023-11-17 10:25:41
270	325	3	1	12	2023-11-17 12:43:59	2023-11-17 12:43:59
271	326	2	2	11	2023-11-17 12:49:14	2023-11-17 12:49:14
272	327	2	2	55	2023-11-17 13:04:23	2023-11-17 13:04:23
273	328	2	4	44	2023-11-17 13:11:53	2023-11-17 13:11:53
274	329	2	2	10 KG	2023-11-17 13:19:39	2023-11-17 13:19:39
275	330	2	2	22	2023-11-17 13:27:57	2023-11-17 13:27:57
276	331	3	2	12	2023-11-17 13:56:24	2023-11-17 13:56:24
277	331	1	2	12	2023-11-17 13:56:24	2023-11-17 13:56:24
278	331	2	12	2	2023-11-17 13:56:24	2023-11-17 13:56:24
279	337	1	10	100 kg	2023-11-17 15:37:39	2023-11-17 15:37:39
280	338	1	10	100 kg	2023-11-17 15:39:49	2023-11-17 15:39:49
281	357	2	6	77	2023-11-17 18:11:26	2023-11-17 18:11:26
282	358	2	2	22	2023-11-17 18:17:31	2023-11-17 18:17:31
283	359	2	1	11	2023-11-17 18:20:59	2023-11-17 18:20:59
284	360	2	6	66	2023-11-17 19:11:19	2023-11-17 19:11:19
285	366	2	2	5000	2023-11-18 11:33:08	2023-11-18 11:33:08
286	367	2	2	1600	2023-11-18 13:46:02	2023-11-18 13:46:02
287	368	3	2	1600	2023-11-18 13:46:49	2023-11-18 13:46:49
288	369	1	2	1	2023-11-18 14:23:44	2023-11-18 14:23:44
289	370	4	21	20	2023-11-18 14:29:39	2023-11-18 14:29:39
290	371	1	2	6	2023-11-18 14:46:57	2023-11-18 14:46:57
291	372	2	1	500	2023-11-18 15:23:57	2023-11-18 15:23:57
292	373	4	22	22	2023-11-18 15:37:36	2023-11-18 15:37:36
293	374	2	2	2500	2023-11-18 15:45:45	2023-11-18 15:45:45
294	376	2	2	2000	2023-11-18 16:01:53	2023-11-18 16:01:53
295	377	2	1	500	2023-11-18 16:03:43	2023-11-18 16:03:43
296	379	2	2	22	2023-11-18 16:34:18	2023-11-18 16:34:18
297	381	2	1	58000	2023-11-18 17:07:50	2023-11-18 17:07:50
298	382	2	1	58000	2023-11-18 17:26:35	2023-11-18 17:26:35
299	216	1	3	9	2023-11-18 17:26:53	2023-11-18 17:26:53
300	383	4	2	25000	2023-11-18 17:35:03	2023-11-18 17:35:03
301	386	2	1	58000	2023-11-19 09:12:38	2023-11-19 09:12:38
302	387	2	1	900	2023-11-19 10:04:42	2023-11-19 10:04:42
303	388	2	1	950	2023-11-19 10:25:37	2023-11-19 10:25:37
304	389	2	1	500	2023-11-19 10:46:25	2023-11-19 10:46:25
305	391	4	2	15000	2023-11-19 11:32:24	2023-11-19 11:32:24
306	395	4	25	5000	2023-11-20 08:53:48	2023-11-20 08:53:48
307	396	7	2	3	2023-11-20 09:09:09	2023-11-20 09:09:09
308	397	5	2	3600	2023-11-20 09:26:16	2023-11-20 09:26:16
309	398	2	1	11	2023-11-20 10:54:01	2023-11-20 10:54:01
310	405	4	2	500	2023-11-20 14:53:13	2023-11-20 14:53:13
311	406	2	2	500	2023-11-20 15:18:45	2023-11-20 15:18:45
312	408	2	1	950	2023-11-21 09:37:50	2023-11-21 09:37:50
313	409	2	1	950	2023-11-21 10:31:37	2023-11-21 10:31:37
314	411	4	2	10000	2023-11-21 11:02:09	2023-11-21 11:02:09
315	411	5	1	1000	2023-11-21 11:02:09	2023-11-21 11:02:09
316	418	2	2	2	2023-12-01 14:40:18	2023-12-01 14:40:18
317	422	1	10	100 kg	2023-12-02 08:32:24	2023-12-02 08:32:24
318	426	1	2	55	2023-12-02 10:48:59	2023-12-02 10:48:59
319	427	7	2	6	2023-12-02 10:53:36	2023-12-02 10:53:36
320	428	1	2	22	2023-12-02 11:13:14	2023-12-02 11:13:14
321	430	2	2	9	2023-12-02 11:33:46	2023-12-02 11:33:46
322	431	1	2	500	2023-12-02 12:05:12	2023-12-02 12:05:12
323	432	2	2	500	2023-12-02 12:06:52	2023-12-02 12:06:52
324	433	1	2	22	2023-12-02 12:59:02	2023-12-02 12:59:02
325	434	1	2	22	2023-12-02 12:59:40	2023-12-02 12:59:40
326	435	1	2	52	2023-12-02 13:00:21	2023-12-02 13:00:21
327	436	1	2	55	2023-12-02 13:02:30	2023-12-02 13:02:30
328	437	1	2	22	2023-12-02 13:34:07	2023-12-02 13:34:07
329	438	1	1	950	2023-12-04 13:23:18	2023-12-04 13:23:18
330	439	1	1	500	2023-12-04 14:41:10	2023-12-04 14:41:10
331	439	2	1	5000	2023-12-04 14:43:24	2023-12-04 14:43:24
332	441	2	2	580	2023-12-04 14:48:02	2023-12-04 14:48:02
333	442	1	2	500	2023-12-05 09:33:59	2023-12-05 09:33:59
334	443	1	2	980	2023-12-05 09:38:24	2023-12-05 09:38:24
335	444	4	500	5	2023-12-05 09:42:39	2023-12-05 09:42:39
336	445	1	1	500	2023-12-05 09:46:35	2023-12-05 09:46:35
337	447	1	55	5	2023-12-05 10:12:25	2023-12-05 10:12:25
338	448	1	5	55	2023-12-05 10:12:54	2023-12-05 10:12:54
339	449	1	1	500	2023-12-26 08:32:54	2023-12-26 08:32:54
340	450	2	2	500	2024-06-03 10:45:15	2024-06-03 10:45:15
341	451	2	2	500	2024-06-03 10:45:53	2024-06-03 10:45:53
342	452	2	1	200	2024-06-03 10:46:54	2024-06-03 10:46:54
343	453	2	1	500	2024-06-03 11:00:44	2024-06-03 11:00:44
344	455	2	1	1000	2024-06-03 14:00:04	2024-06-03 14:00:04
345	456	2	2	500	2024-06-03 14:30:18	2024-06-03 14:30:18
346	457	2	1	2	2024-06-03 15:44:43	2024-06-03 15:44:43
347	458	8	1	2500	2024-06-03 16:43:41	2024-06-03 16:43:41
348	459	8	1	500	2024-06-03 16:57:31	2024-06-03 16:57:31
349	461	4	1	80	2024-06-03 17:09:31	2024-06-03 17:09:31
350	463	8	1	5	2024-06-03 17:20:07	2024-06-03 17:20:07
351	465	9	2	500	2024-06-05 11:42:27	2024-06-05 11:42:27
352	466	10	2	500	2024-06-05 11:43:04	2024-06-05 11:43:04
353	467	11	3	1000	2024-06-05 11:43:38	2024-06-05 11:43:38
354	468	8	2	500	2024-06-05 11:44:33	2024-06-05 11:44:33
355	469	8	3	590	2024-06-05 11:45:06	2024-06-05 11:45:06
356	470	8	3	1000	2024-06-05 11:45:35	2024-06-05 11:45:35
357	471	8	1	2500	2024-06-07 11:28:20	2024-06-07 11:28:20
358	472	8	2	500	2024-06-07 12:02:54	2024-06-07 12:02:54
359	473	8	1	2500	2024-06-07 12:10:50	2024-06-07 12:10:50
360	474	8	1	2700	2024-07-05 11:01:33	2024-07-05 11:01:33
361	474	9	1	500	2024-07-05 11:01:33	2024-07-05 11:01:33
362	475	8	1	3000	2024-07-05 11:36:28	2024-07-05 11:36:28
363	476	8	2	50	2024-09-18 12:47:21	2024-09-18 12:47:21
364	477	8	100	2000	2024-09-30 14:00:20	2024-09-30 14:00:20
365	478	8	10	2000	2024-09-30 14:05:47	2024-09-30 14:05:47
366	479	9	2	2700	2025-02-12 17:05:58	2025-02-12 17:05:58
367	480	9	2	2700	2025-02-13 13:41:50	2025-02-13 13:41:50
368	481	9	1	2500	2025-02-13 14:52:13	2025-02-13 14:52:13
369	483	9	2	200	2025-02-13 20:09:09	2025-02-13 20:09:09
370	487	4	2	2000	2025-02-13 21:12:46	2025-02-13 21:12:46
371	488	4	2	1200	2025-02-13 21:24:22	2025-02-13 21:24:22
\.


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (id, is_collection, collection_address, deliver_address, sender_id, deligate_id, deligate_type, admin_response, comission_amount, customer_signature, delivery_note, status, created_at, updated_at, booking_number, is_paid, invoice_number, total_commission_amount, total_received_amount, sub_total, grand_total, shipping_method_id, total_qoutation_amount, collection_latitude, collection_longitude, collection_country, collection_city, collection_zipcode, deliver_latitude, deliver_longitude, deliver_country, deliver_city, deliver_zipcode, collection_phone, deliver_phone, statuscode, parent_id, collection_address_id, deliver_address_id, rack, storage_picture, date_of_commencement, date_of_return, instructions, admin_can_accept_quote, shipmenttype) FROM stdin;
54	1	Building Materials Mall	Trade Centre	67	1	ftl	pending	\N	0	\N	pending	2023-08-26 15:24:39	2023-08-26 15:24:39	#TX-000054	no	\N	\N	0	\N	\N	\N	0	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
55	1	Trade Centre	Premier Inn Dubai Dragon Mart Hotel	44	1	ftl	pending	\N	0	\N	pending	2023-08-26 20:33:03	2023-08-26 20:33:03	#TX-000055	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.179631823378383	55.42361689867244	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
56	1	Trade Centre	Premier Inn Dubai Dragon Mart Hotel	44	1	ftl	pending	\N	0	\N	pending	2023-08-26 20:38:12	2023-08-26 20:38:12	#TX-000056	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.179631823378383	55.42361689867244	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
57	1	Business Bay - Dubai - United Arab Emirates	Business Bay - Dubai - United Arab Emirates	70	1	ftl	pending	\N	0	\N	pending	2023-09-04 12:08:39	2023-09-04 12:08:39	#TX-000057	no	\N	\N	0	\N	\N	\N	0	25.183164700000003	55.272887	United Arab Emirates	Dubai	\N	25.183164700000003	55.272887	United Arab Emirates	Dubai	\N	+971 5248866658	+971 5248866658	0	0	0	0						0	0
58	1	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	73	1	ftl	pending	\N	0	\N	pending	2023-10-07 13:44:06	2023-10-07 13:44:06	#TX-000058	no	\N	\N	0	\N	\N	\N	0	33.5707966	73.145327	United Arab Emirates	Dubai	\N	33.5165256	73.1108949	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
59	1	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	73	1	ftl	pending	\N	0	\N	pending	2023-10-07 13:44:49	2023-10-07 13:44:49	#TX-000059	no	\N	\N	0	\N	\N	\N	0	33.5707966	73.145327	United Arab Emirates	Dubai	\N	33.5165256	73.1108949	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
60	1	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	73	1	ftl	pending	\N	0	\N	pending	2023-10-07 13:47:17	2023-10-07 13:47:17	#TX-000060	no	\N	\N	0	\N	\N	\N	0	33.5707966	73.145327	United Arab Emirates	Dubai	\N	33.5707966	73.145327	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
61	1	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	73	1	ftl	pending	\N	0	\N	pending	2023-10-07 13:47:33	2023-10-07 13:47:33	#TX-000061	no	\N	\N	0	\N	\N	\N	0	33.5707966	73.145327	United Arab Emirates	Dubai	\N	33.5707966	73.145327	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
62	1	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	73	1	ftl	pending	\N	0	\N	pending	2023-10-07 13:47:49	2023-10-07 13:47:49	#TX-000062	no	\N	\N	0	\N	\N	\N	0	33.5707966	73.145327	United Arab Emirates	Dubai	\N	33.5707966	73.145327	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
63	1	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	73	1	ftl	pending	\N	0	\N	pending	2023-10-07 13:48:45	2023-10-07 13:48:45	#TX-000063	no	\N	\N	0	\N	\N	\N	0	33.5707966	73.145327	United Arab Emirates	Dubai	\N	33.5707966	73.145327	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
64	1	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	73	1	ftl	pending	\N	0	\N	pending	2023-10-07 13:51:24	2023-10-07 13:51:24	#TX-000064	no	\N	\N	0	\N	\N	\N	0	33.5707966	73.145327	United Arab Emirates	Dubai	\N	33.5165256	73.1108949	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
66	1	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	73	1	ftl	pending	\N	0	\N	pending	2023-10-07 16:09:00	2023-10-07 16:09:00	#TX-000066	no	\N	\N	0	\N	\N	\N	0	33.5707966	73.145327	United Arab Emirates	Dubai	\N	33.5165256	73.1108949	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
65	1	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	73	1	ftl	ask_for_qoute	\N	0	\N	pending	2023-10-07 14:00:38	2023-10-18 22:12:59	#TX-000065	no	\N	\N	0	\N	\N	\N	0	33.5707966	73.145327	United Arab Emirates	Dubai	\N	33.5165256	73.1108949	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
69	1	Zayed City - Abu Dhabi - United Arab Emirates	Zayed City - Abu Dhabi - United Arab Emirates	75	1	ftl	pending	\N	0	\N	pending	2023-10-07 17:52:24	2023-10-07 17:52:24	#TX-000069	no	\N	\N	0	\N	\N	\N	0	23.656830600000003	53.7033803	United Arab Emirates	Dubai	\N	23.656830600000003	53.7033803	United Arab Emirates	Dubai	\N	+971 55424884664	+971 55424884664	0	0	0	0						0	0
68	1	Zayed City - Abu Dhabi - United Arab Emirates	Zayed City - Abu Dhabi - United Arab Emirates	75	1	ftl	approved_by_admin	\N	0	\N	qoutes_received	2023-10-07 17:50:52	2023-10-18 12:52:13	#TX-000068	no	\N	\N	0	\N	\N	\N	0	23.656830600000003	53.7033803	United Arab Emirates	Dubai	\N	23.656830600000003	53.7033803	United Arab Emirates	Dubai	\N	+971 55424884664	+971 55424884664	1	0	0	0						0	0
70	1	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	73	1	ltl	ask_for_qoute	\N	0	\N	pending	2023-10-09 10:25:10	2023-10-18 12:45:35	#TX-000070	no	\N	\N	0	\N	\N	\N	0	33.5707966	73.145327	United Arab Emirates	\N	\N	33.5165256	73.1108949	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
90	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	pending	\N	0	\N	pending	2023-10-16 17:17:20	2023-10-16 17:17:20	#TX-000090	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
72	1	238 Second Industrial St - Industrial Area_5 - Industrial Area - Sharjah - United Arab Emirates,	238 Second Industrial St - Industrial Area_5 - Industrial Area - Sharjah - United Arab Emirates,	78	1	ftl	pending	\N	0	\N	pending	2023-10-09 17:11:04	2023-10-09 17:11:04	#TX-000072	no	\N	\N	0	\N	\N	\N	0	25.33090601907928	55.42093623429537	United Arab Emirates	Dubai	\N	25.33090601907928	55.42093623429537	United Arab Emirates	Dubai	\N	+971 554251884	+971 554251884	0	0	0	0						0	0
74	1	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	73	1	ftl	pending	\N	0	\N	pending	2023-10-09 17:24:45	2023-10-09 17:24:45	#TX-000074	no	\N	\N	0	\N	\N	\N	0	33.5707966	73.145327	United Arab Emirates	Dubai	\N	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
75	1	H48P+VP6, Main Main PWD Rd, Block C Police Foundation, Rawalpindi, Punjab, Pakistan,	H48P+VP6, Main Main PWD Rd, Block C Police Foundation, Rawalpindi, Punjab, Pakistan,	77	1	ftl	pending	\N	0	\N	pending	2023-10-09 17:32:59	2023-10-09 17:32:59	#TX-000075	no	\N	\N	0	\N	\N	\N	0	33.56705063528734	73.13677925616503	United Arab Emirates	Dubai	\N	33.56705063528734	73.13677925616503	United Arab Emirates	Dubai	\N	+971 1470852369	+971 1470852369	0	0	0	0						0	0
73	1	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	73	1	ltl	ask_for_qoute	\N	0	\N	pending	2023-10-09 17:23:34	2023-10-18 12:31:54	#TX-000073	no	\N	\N	0	\N	\N	\N	0	33.5707966	73.145327	United Arab Emirates	\N	\N	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
77	1	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	73	1	ltl	pending	\N	0	\N	pending	2023-10-10 17:16:50	2023-10-10 17:16:50	#TX-000077	no	\N	\N	0	\N	\N	\N	0	33.5707966	73.145327	United Arab Emirates	\N	\N	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
78	1	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	73	1	ftl	pending	\N	0	\N	pending	2023-10-10 17:18:08	2023-10-10 17:18:08	#TX-000078	no	\N	\N	0	\N	\N	\N	0	33.5707966	73.145327	United Arab Emirates	Dubai	\N	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
79	1	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	82	1	ftl	pending	\N	0	\N	pending	2023-10-10 17:21:28	2023-10-10 17:21:28	#TX-000079	no	\N	\N	0	\N	\N	\N	0	33.5707966	73.145327	United Arab Emirates	Dubai	\N	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
81	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-10-11 09:11:09	2023-11-13 17:33:21	#TX-000081	no	\N	0	0	300	300	\N	300	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	2	0	0	0						0	0
84	1	Trade Centre	Umm Al Quain	74	1	ftl	approved_by_admin	\N	0	\N	completed	2023-10-16 16:03:48	2023-10-18 10:23:45	#TX-000084	no	\N	30	0	330	330	\N	300	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.26546546	55.5874386546	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	4	0	0	0						0	0
83	1	Trade Centre	Umm Al Quain	74	1	ftl	approved_by_admin	\N	0	\N	qoutes_received	2023-10-16 15:57:48	2023-10-16 16:01:30	#TX-000083	no	\N	10	0	0	0	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.26546546	55.5874386546	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	0	0	0						0	0
85	1	Trade Centre	Umm Al Quain	74	1	ftl	pending	\N	0	\N	pending	2023-10-16 16:17:37	2023-10-16 16:17:37	#TX-000085	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.26546546	55.5874386546	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	0	0	0						0	0
86	1	Trade Centre	Umm Al Quain	74	1	ftl	approved_by_admin	\N	0	\N	qoutes_received	2023-10-16 16:29:22	2023-10-16 16:31:46	#TX-000086	no	\N	10	0	0	0	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.26546546	55.5874386546	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	0	0	0						0	0
76	1	H48P+VP6, Main Main PWD Rd, Block C Police Foundation, Rawalpindi, Punjab, Pakistan,	H48P+VP6, Main Main PWD Rd, Block C Police Foundation, Rawalpindi, Punjab, Pakistan,	77	1	ltl	ask_for_qoute	\N	0	\N	pending	2023-10-09 17:33:44	2023-10-18 12:27:53	#TX-000076	no	\N	\N	0	\N	\N	\N	0	33.56705063528734	73.13677925616503	United Arab Emirates	\N	\N	33.56705063528734	73.13677925616503	United Arab Emirates	Dubai	\N	+971 1470852369	+971 1470852369	0	0	0	0						0	0
87	1	Trade Centre	Umm Al Quain	74	1	ftl	pending	\N	0	\N	pending	2023-10-16 17:08:18	2023-10-16 17:08:18	#TX-000087	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.26546546	55.5874386546	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	0	0	0						0	0
88	1	Trade Centre	Umm Al Quain	74	1	ftl	pending	\N	0	\N	pending	2023-10-16 17:11:31	2023-10-16 17:11:31	#TX-000088	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.26546546	55.5874386546	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	0	0	0						0	0
80	1	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	73	1	ftl	ask_for_qoute	\N	0	\N	pending	2023-10-11 00:17:54	2023-10-18 09:06:22	#TX-000080	yes	\N	\N	0	\N	\N	\N	0	33.5707966	73.145327	United Arab Emirates	Dubai	\N	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
89	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ltl	ask_for_qoute	\N	0	\N	pending	2023-10-16 17:16:20	2023-10-18 08:53:12	#TX-000089	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
92	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	pending	\N	0	\N	pending	2023-10-17 09:08:51	2023-10-17 09:08:51	#TX-000092	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
93	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	pending	\N	0	\N	pending	2023-10-17 09:14:45	2023-10-17 09:14:45	#TX-000093	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
98	1	Trade Centre	Umm Al Quain	74	1	ftl	approved_by_admin	\N	0	\N	qoutes_received	2023-10-17 11:46:59	2023-10-17 12:49:35	#TX-000098	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.26546546	55.5874386546	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	1	0	0	0						0	0
96	1	Umm Al Quain	Trade Centre	74	1	ftl	pending	\N	0	\N	pending	2023-10-17 11:43:21	2023-10-17 11:43:21	#TX-000096	no	\N	\N	0	\N	\N	\N	0	25.26546546	55.5874386546	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	0	0	0						0	0
103	1	Trade Centre	Trade Centre	74	3	ftl	pending	\N	0	\N	pending	2023-10-18 10:03:58	2023-10-18 10:03:58	#TX-000103	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	0	0	0						0	0
71	1	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	73	1	ltl	ask_for_qoute	\N	0	\N	pending	2023-10-09 10:36:10	2023-10-18 12:33:18	#TX-000071	no	\N	\N	0	\N	\N	\N	0	33.5165256	73.1108949	United Arab Emirates	\N	\N	33.5707966	73.145327	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
104	1	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	25W4+V62 - Jumeirah Park - Dubai - United Arab Emirates,	85	1	ftl	approved_by_admin	\N	0	\N	completed	2023-10-18 16:28:07	2023-10-19 12:56:13	#TX-000104	yes	\N	25	200	275	275	\N	250	25.184237262438835	55.259992964565754	United Arab Emirates	Dubai	\N	25.047127821877247	55.15551958233118	United Arab Emirates	Dubai	\N	+971 552125893	+971 552125893	4	0	0	0						0	0
102	1	Trade Centre	Trade Centre	74	1	ftl	approved_by_admin	\N	0	\N	completed	2023-10-17 15:17:05	2023-10-18 03:46:26	#TX-000102	yes	\N	15	0	315	315	\N	300	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	4	0	0	0						0	0
101	1	Trade Centre	Umm Al Quain	74	1	ftl	ask_for_qoute	\N	0	\N	pending	2023-10-17 15:02:30	2023-10-18 22:15:20	#TX-000101	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.26546546	55.5874386546	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	0	0	0						0	0
105	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	2	\N	approved_by_admin	\N	0	\N	completed	2023-10-20 13:08:18	2023-12-04 16:38:03	#TX-000105	no	\N	0	12	235	235	\N	235	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	4	0	0	0						0	0
100	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	approved_by_admin	\N	0	\N	completed	2023-10-17 13:27:58	2023-10-19 03:29:35	#TX-000100	no	\N	0	0	333	333	\N	333	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	4	0	0	0						0	0
97	1	Trade Centre	Umm Al Quain	74	1	ftl	ask_for_qoute	\N	0	\N	pending	2023-10-17 11:46:24	2023-10-18 08:48:46	#TX-000097	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.26546546	55.5874386546	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	0	0	0						0	0
95	1	Trade Centre	Umm Al Quain	74	1	ftl	ask_for_qoute	\N	0	\N	pending	2023-10-17 11:35:01	2023-10-18 08:51:16	#TX-000095	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.26546546	55.5874386546	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	0	0	0						0	0
67	1	378 St 17, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan	73	1	ftl	ask_for_qoute	\N	0	\N	pending	2023-10-07 16:24:13	2023-10-18 22:13:38	#TX-000067	no	\N	\N	0	\N	\N	\N	0	33.5707966	73.145327	United Arab Emirates	Dubai	\N	33.5165256	73.1108949	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
94	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	approved_by_admin	\N	0	\N	completed	2023-10-17 10:47:21	2023-10-18 08:54:27	#TX-000094	yes	\N	0	0	300	300	\N	300	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	4	0	0	0						0	0
99	1	Trade Centre	Umm Al Quain	74	1	ftl	driver_qouted	\N	0	\N	on_process	2023-10-17 12:04:06	2023-10-20 16:42:26	#TX-000099	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.26546546	55.5874386546	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	0	0	0						0	0
91	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ltl	approved_by_admin	\N	0	\N	on_process	2023-10-17 09:06:26	2023-11-16 15:35:07	#TX-000091	no	\N	0	0	227	227	\N	227	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	1	0	0	0						0	0
287	1	Building Materials Mall	Trade Centre	122	1	ftl	pending	\N	0	\N	pending	2023-11-16 15:40:07	2023-11-16 15:40:07	#TX-000287	no	\N	\N	0	\N	\N	\N	0	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
107	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	2	\N	pending	\N	0	\N	pending	2023-10-20 16:51:40	2023-10-20 16:51:40	#TX-000107	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
124	1	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	673C+W8M - Dubai - United Arab Emirates,	73	1	ftl	pending	\N	0	\N	pending	2023-10-26 09:57:27	2023-10-26 09:57:27	\N	no	\N	\N	0	\N	\N	\N	0	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
118	1	Trade Centre	Trade Centre	74	1	ftl	driver_qouted	\N	0	\N	pending	2023-10-24 15:18:46	2023-10-24 16:41:20	#TX-000114-1	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	114	0	0						0	0
108	1	25W4+V62 - Jumeirah Park - Dubai - United Arab Emirates,	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	85	1	ltl	driver_qouted	\N	0	\N	pending	2023-10-20 16:58:26	2023-10-20 17:04:07	#TX-000108	no	\N	\N	0	\N	\N	\N	0	25.047127821877247	55.15551958233118	United Arab Emirates	\N	\N	25.184237262438835	55.259992964565754	United Arab Emirates	Dubai	\N	+971 552125893	+971 552125893	0	0	0	0						0	0
109	1	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	\N	73	4	\N	pending	\N	0	\N	pending	2023-10-20 21:32:36	2023-10-20 21:32:36	#TX-000109	no	\N	\N	0	\N	\N	\N	0	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	\N	\N	\N	\N	\N	+971 090078601	\N	0	0	0	0						0	0
110	0		\N	73	4	\N	pending	\N	0	\N	pending	2023-10-21 09:30:27	2023-10-21 09:30:27	#TX-000110	no	\N	\N	0	\N	\N	\N	0					\N	\N	\N	\N	\N	\N		\N	0	0	0	0						0	0
114	1	Umm Al Quain	Trade Centre	74	1	ftl	approved_by_admin	\N	0	\N	completed	2023-10-24 11:51:13	2023-10-24 12:10:23	#TX-000114	no	\N	0	0	300	300	\N	300	25.26546546	55.5874386546	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	4	0	0	0						0	0
113	1	790 B Block, Millat Town Faisalabad, Punjab, Pakistan,	790 B Block, Millat Town Faisalabad, Punjab, Pakistan,	105	1	ftl	pending	\N	0	\N	pending	2023-10-24 11:38:30	2023-10-24 11:38:30	#TX-000113	no	\N	\N	0	\N	\N	\N	0	31.488138763909944	73.09930074959993	United Arab Emirates	Abu Dhabi	\N	31.488138763909944	73.09930074959993	United Arab Emirates	Abu Dhabi	\N	+971 3204504501	+971 3204504501	0	0	0	0						0	0
115	1	Umm Al Quain	Trade Centre	74	1	ftl	approved_by_admin	\N	0	\N	completed	2023-10-24 12:11:37	2023-10-24 12:48:00	#TX-000115	yes	\N	0	0	1000	1000	\N	1000	25.26546546	55.5874386546	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	4	0	0	0						0	0
312	1	Trade Centre	Building Materials Mall	122	2	\N	pending	\N	0	\N	pending	2023-11-16 18:04:04	2023-11-16 18:04:04	#TX-000312	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
112	1	Trade Centre	Trade Centre	74	1	ftl	approved_by_admin	\N	0	\N	completed	2023-10-24 11:35:07	2023-10-24 11:48:20	#TX-000112	no	\N	0	0	600	600	\N	600	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	4	0	0	0						0	0
117	1	25W4+V62 - Jumeirah Park - Dubai - United Arab Emirates,	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	85	1	ltl	pending	\N	0	\N	pending	2023-10-24 14:48:38	2023-10-24 14:48:38	#TX-000117	no	\N	\N	0	\N	\N	\N	0	25.047127821877247	55.15551958233118	United Arab Emirates	\N	\N	25.184237262438835	55.259992964565754	United Arab Emirates	Dubai	\N	+971 552125893	+971 552125893	0	0	0	0						0	0
111	1	Trade Centre	Umm Al Quain	74	1	ftl	driver_qouted	\N	0	\N	completed	2023-10-24 11:21:33	2023-11-13 15:06:29	#TX-000111	no	\N	0	0	300	300	\N	300	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.26546546	55.5874386546	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	4	0	0	0						0	0
121	1	25W4+V62 - Jumeirah Park - Dubai - United Arab Emirates,	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	85	2		pending	\N	0	\N	completed	2023-10-25 10:36:38	2023-10-25 10:42:15	\N	yes	1231321	\N	0	\N	\N	1	0	25.047127821877247	55.15551958233118	United Arab Emirates	\N	\N	25.184237262438835	55.259992964565754	United Arab Emirates	Dubai	\N	+971 552125893	+971 552125893	0	0	0	0						0	0
119	1	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	pending	\N	0	\N	pending	2023-10-24 17:00:17	2023-10-24 17:00:17	#TX-000100-1	no	\N	\N	0	\N	\N	\N	0	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	100	0	0						0	0
122	1	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	pending	\N	0	\N	pending	2023-10-25 16:14:22	2023-10-25 16:14:22	\N	no	\N	\N	0	\N	\N	\N	0	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
120	1	Al manara tower		85	4		driver_qouted	\N	0	\N	pending	2023-10-25 10:31:59	2023-10-25 10:32:42	#TX-000120	no	6735127531	\N	0	\N	\N	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	0						0	0
125	1	Trade Centre	Trade Centre	74	3	ftl	pending	\N	0	\N	pending	2023-10-26 09:58:46	2023-10-26 09:58:46	\N	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	0	0	0						0	0
123	1	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ltl	pending	\N	0	\N	pending	2023-10-25 17:32:34	2023-10-25 17:32:34	\N	no	\N	\N	0	\N	\N	\N	0	33.518045571861066	73.10975566506386	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
126	1	Trade Centre	Trade Centre	74	3	ftl	pending	\N	0	\N	pending	2023-10-26 10:02:54	2023-10-26 10:02:54	#TX-000126	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	0	0	0						0	0
313	1	Trade Centre	Building Materials Mall	122	2	\N	pending	\N	0	\N	pending	2023-11-16 18:11:17	2023-11-16 18:11:18	#TX-000313	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
127	1	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	673C+W8M - Dubai - United Arab Emirates,	73	1	ftl	pending	\N	0	\N	pending	2023-10-26 10:08:31	2023-10-26 10:08:31	#TX-000127	no	\N	\N	0	\N	\N	\N	0	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
128	1	Al manara tower	Al bayat	85	1	ftl	ask_for_qoute	\N	0	\N	pending	2023-10-26 10:27:59	2023-10-26 10:28:00	#TX-000128	no	654757567	\N	0	\N	\N	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	0						0	0
129	1	Al manara tower	Al bayat	108	1	ftl	ask_for_qoute	\N	0	\N	pending	2023-10-26 10:28:43	2023-10-26 10:28:43	#TX-000129	no	6735127531	\N	0	\N	\N	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	0						0	0
132	1	Al manara tower		85	4		ask_for_qoute	\N	0	\N	pending	2023-10-26 11:25:07	2023-10-26 11:25:07	#TX-000132	no	354365	\N	0	\N	\N	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	0						0	0
131	1	Al manara tower	Al bayat	85	1	ftl	ask_for_qoute	\N	0	\N	pending	2023-10-26 10:51:10	2023-10-26 10:51:10	#TX-000131	no	5436654	\N	0	\N	\N	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	0						0	0
143	1	Trade Centre	Trade Centre	74	1	ftl	pending	\N	0	\N	pending	2023-10-26 15:19:12	2023-10-26 15:19:12	#TX-000114-2	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	114	0	0						0	0
140	1	Mall Of Emirates - Al Barsha Rd - Al Barsha - Al Barsha 1 - Dubai - United Arab Emirates	HH22+8X8 - Al Bootain - Al Butain - Umm Al Quawain - United Arab Emirates	85	1	ftl	ask_for_qoute	\N	0	\N	pending	2023-10-26 12:43:38	2023-10-26 12:44:22	#TX-000140	no	46546754765	2	0	0	0	1	0	25.1158136	55.203267	\N	\N	\N	25.5507975	55.5524476	\N	\N	\N	\N	\N	0	0	0	0						0	0
130	1	12 Marasi Dr - Business Bay - Bay Square - Dubai - United Arab Emirates,	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	108	1	ltl	approved_by_admin	\N	0	\N	completed	2023-10-26 10:48:29	2023-10-26 11:26:46	#TX-000130	yes	\N	100	1100	1100	1100	\N	1000	25.185813143901825	55.2819012477994	United Arab Emirates	\N	\N	25.184230284096706	55.25999095290899	United Arab Emirates	Dubai	\N	+971 524158669	+971 524158669	4	0	0	0						0	0
133	0		\N	108	4	\N	pending	\N	0	\N	pending	2023-10-26 11:32:48	2023-10-26 11:32:48	#TX-000133	no	\N	\N	0	\N	\N	\N	0					\N	\N	\N	\N	\N	\N		\N	0	0	0	0						0	0
134	1	Al manara tower		108	4		approved_by_admin	\N	0	\N	pending	2023-10-26 11:36:57	2023-10-26 11:36:57	#TX-000134	no	6735127531	\N	0	\N	\N	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	0						0	0
135	1	Al manara tower		108	4		ask_for_qoute	\N	0	\N	pending	2023-10-26 11:41:11	2023-10-26 11:41:11	#TX-000135	no	6735127531	\N	0	\N	\N	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	0						0	0
136	1	Trade Centre	\N	74	4	\N	pending	\N	0	\N	pending	2023-10-26 11:52:55	2023-10-26 11:52:55	#TX-000136	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	\N	\N	\N	\N	\N		\N	0	0	0	0						0	0
137	1	Trade Centre	\N	74	4	\N	pending	\N	0	\N	pending	2023-10-26 11:58:14	2023-10-26 11:58:14	#TX-000112-1	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	\N	\N	\N	\N	\N		\N	0	112	0	0						0	0
144	1	Trade Centre	Building Materials Mall	74	1	ltl	pending	\N	0	\N	pending	2023-10-26 15:19:53	2023-10-26 15:19:53	#TX-000144	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
139	1	HH22+8X8 - Al Bootain - Al Butain - Umm Al Quawain - United Arab Emirates	Dubai International Airport (DXB) - Dubai - United Arab Emirates	85	1	ftl	ask_for_qoute	\N	0	\N	pending	2023-10-26 12:36:47	2023-10-26 12:36:47	#TX-000139	no	5436546	\N	0	\N	\N	1	0	25.5507975	55.5524476	\N	\N	\N	25.2566466	55.3641488	\N	\N	\N	\N	\N	0	0	0	0						0	0
145	1	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	pending	\N	0	\N	pending	2023-10-26 15:27:03	2023-10-26 15:27:03	#TX-000142-1	no	\N	\N	0	\N	\N	\N	0	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	142	0	0						0	0
138	1	12 Marasi Dr - Business Bay - Bay Square - Dubai - United Arab Emirates,		108	4		pending	\N	0	\N	cancelled	2023-10-26 12:21:35	2023-10-26 14:51:12	#TX-000138	no		\N	0	\N	\N	1	0	25.185813143901825	55.2819012477994	United Arab Emirates	Dubai	\N	\N	\N	\N	\N	\N	+971 524158669	\N	0	0	0	0						0	0
141	1	17 Al Khwaher St - Jumeirah - Jumeirah 3 - Dubai - United Arab Emirates,	Office No: 303, 3rd Floor, Education Zone Bldg - Near Al Qusais Metro Station - اﻟﻘﺼﻴﺺ - القصيص ١ - دبي - United Arab Emirates,	109	1	ftl	pending	\N	0	\N	pending	2023-10-26 15:00:33	2023-10-26 15:00:33	\N	no	\N	\N	0	\N	\N	\N	0	25.190578589794992	55.23016478866339	United Arab Emirates	Dubai	\N	25.276981694222343	55.37242949008942	United Arab Emirates	Dubai	\N	+971 554228898	+971 554228898	0	0	0	0						0	0
146	1	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	ask_for_qoute	\N	0	\N	qoutes_received	2023-10-26 15:28:33	2023-10-26 15:34:34	#TX-000142-2	no	\N	16	0	0	0	\N	0	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	1	142	0	0						0	0
147	1	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	pending	\N	0	\N	pending	2023-10-26 15:40:14	2023-10-26 15:40:14	#TX-000147	no	\N	\N	0	\N	\N	\N	0	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
148	1	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	pending	\N	0	\N	pending	2023-10-26 15:41:52	2023-10-26 15:41:52	#TX-000148	no	\N	\N	0	\N	\N	\N	0	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
142	1	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ltl	ask_for_qoute	\N	0	\N	completed	2023-10-26 15:14:50	2023-10-26 17:51:57	#TX-000142	yes	\N	40	440	440	440	\N	400	33.518045571861066	73.10975566506386	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	4	0	0	0						0	0
150	1	Trade Centre	Trade Centre	74	3	ftl	pending	\N	0	\N	pending	2023-10-26 16:38:25	2023-10-26 16:38:25	#TX-000150	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	0	0	0						0	0
151	1	25W4+V62 - Jumeirah Park - Dubai - United Arab Emirates,	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	85	2	\N	pending	\N	0	\N	pending	2023-10-26 16:38:40	2023-10-26 16:38:40	#TX-000151	no	\N	\N	0	\N	\N	\N	0	25.047127821877247	55.15551958233118	United Arab Emirates	\N	\N	25.184237262438835	55.259992964565754	United Arab Emirates	Dubai	\N	+971 552125893	+971 552125893	0	0	0	0						0	0
152	1	25W4+V62 - Jumeirah Park - Dubai - United Arab Emirates,	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	85	1	ftl	pending	\N	0	\N	pending	2023-10-26 16:40:46	2023-10-26 16:40:46	#TX-000152	no	\N	\N	0	\N	\N	\N	0	25.047127821877247	55.15551958233118	United Arab Emirates	Dubai	\N	25.184237262438835	55.259992964565754	United Arab Emirates	Dubai	\N	+971 552125893	+971 552125893	0	0	0	0						0	0
154	1	25W4+V62 - Jumeirah Park - Dubai - United Arab Emirates,	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	85	1	ltl	pending	\N	0	\N	pending	2023-10-26 17:14:28	2023-10-26 17:14:28	#TX-000154	no	\N	\N	0	\N	\N	\N	0	25.047127821877247	55.15551958233118	United Arab Emirates	\N	\N	25.184237262438835	55.259992964565754	United Arab Emirates	Dubai	\N	+971 552125893	+971 552125893	0	0	0	0						0	0
155	1	25W4+V62 - Jumeirah Park - Dubai - United Arab Emirates,	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	85	2	\N	pending	\N	0	\N	pending	2023-10-26 17:15:18	2023-10-26 17:15:18	#TX-000155	no	\N	\N	0	\N	\N	\N	0	25.047127821877247	55.15551958233118	United Arab Emirates	\N	\N	25.184237262438835	55.259992964565754	United Arab Emirates	Dubai	\N	+971 552125893	+971 552125893	0	0	0	0						0	0
156	1	25W4+V62 - Jumeirah Park - Dubai - United Arab Emirates,	\N	85	4	\N	pending	\N	0	\N	pending	2023-10-26 17:17:17	2023-10-26 17:17:17	#TX-000156	no	\N	\N	0	\N	\N	\N	0	25.047127821877247	55.15551958233118	United Arab Emirates	Dubai	\N	\N	\N	\N	\N	\N	+971 552125893	\N	0	0	0	0						0	0
149	1	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-10-26 15:46:35	2023-10-26 15:56:24	#TX-000149	no	\N	70	0	1070	1070	\N	1000	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	1	0	0	0						0	0
157	1	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	673C+W8M - Dubai - United Arab Emirates,	73	3	ltl	pending	\N	0	\N	pending	2023-10-26 18:22:21	2023-10-26 18:22:21	#TX-000157	no	\N	\N	0	\N	\N	\N	0	33.518045571861066	73.10975566506386	United Arab Emirates	\N	\N	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
158	1	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	Sharjah International Airport - Sharjah International Airport - Sharjah - United Arab Emirates,	110	1	ftl	approved_by_admin	\N	0	\N	completed	2023-10-27 09:13:45	2023-10-27 09:46:48	#TX-000158	yes	\N	130	780	780	780	\N	650	25.184229070471947	55.2599922940135	United Arab Emirates	Dubai	\N	25.321364732892214	55.520540066063404	United Arab Emirates	Dubai	\N	+971 5341889666	+971 5341889666	4	0	0	0						0	0
153	1	25W4+V62 - Jumeirah Park - Dubai - United Arab Emirates,	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	85	1	ftl	approved_by_admin	\N	0	\N	completed	2023-10-26 17:12:44	2023-10-26 18:11:39	#TX-000153	no	\N	37.5	0	537.5	537.5	\N	500	25.047127821877247	55.15551958233118	United Arab Emirates	Dubai	\N	25.184237262438835	55.259992964565754	United Arab Emirates	Dubai	\N	+971 552125893	+971 552125893	4	0	0	0						0	0
160	1	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	Sharjah International Airport - Sharjah International Airport - Sharjah - United Arab Emirates,	110	3	ftl	pending	\N	0	\N	pending	2023-10-27 09:52:03	2023-10-27 09:52:03	#TX-000160	no	\N	\N	0	\N	\N	\N	0	25.184229070471947	55.2599922940135	United Arab Emirates	Dubai	\N	25.321364732892214	55.520540066063404	United Arab Emirates	Dubai	\N	+971 5341889666	+971 5341889666	0	0	0	0						0	0
161	1	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	Sharjah International Airport - Sharjah International Airport - Sharjah - United Arab Emirates,	110	1	ltl	approved_by_admin	\N	0	\N	completed	2023-10-27 10:02:51	2023-10-27 10:08:57	#TX-000161	no	\N	37.5	0	287.5	287.5	\N	250	25.184229070471947	55.2599922940135	United Arab Emirates	\N	\N	25.321364732892214	55.520540066063404	United Arab Emirates	Dubai	\N	+971 5341889666	+971 5341889666	4	0	0	0						0	0
159	1	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	Sharjah International Airport - Sharjah International Airport - Sharjah - United Arab Emirates,	110	3	ftl	pending	\N	0	\N	completed	2023-10-27 09:51:14	2023-10-27 10:00:54	#TX-000159	no		\N	0	\N	\N	1	0	25.184229070471947	55.2599922940135	United Arab Emirates	Dubai	\N	25.321364732892214	55.520540066063404	United Arab Emirates	Dubai	\N	+971 5341889666	+971 5341889666	0	0	0	0						0	0
163	1	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	Sharjah International Airport - Sharjah International Airport - Sharjah - United Arab Emirates,	110	2		pending	\N	0	\N	completed	2023-10-27 10:12:19	2023-10-27 10:22:48	#TX-000163	no		\N	0	\N	\N	1	0	25.184229070471947	55.2599922940135	United Arab Emirates	\N	\N	25.321364732892214	55.520540066063404	United Arab Emirates	Dubai	\N	+971 5341889666	+971 5341889666	0	0	0	0						0	0
162	1	Trade Centre	Trade Centre	74	3	ftl	approved_by_admin	\N	0	\N	completed	2023-10-27 10:11:52	2023-10-27 10:43:33	#TX-000115-1	no		\N	0	\N	\N	1	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	115	0	0						0	0
164	1	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	3	ftl	pending	\N	0	\N	completed	2023-10-27 10:22:59	2023-10-27 10:28:42	#TX-000164	no		\N	0	\N	\N	1	0	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
166	1	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	3	ftl	pending	\N	0	\N	pending	2023-10-27 10:29:15	2023-10-27 10:29:15	#TX-000164-1	no	\N	\N	0	\N	\N	\N	0	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	164	0	0						0	0
167	1	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	driver_qouted	\N	0	\N	pending	2023-10-27 10:46:08	2023-11-07 10:56:53	#TX-000167	no	\N	10	0	0	0	\N	0	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
165	1	Trade Centre	Trade Centre	74	2	\N	approved_by_admin	\N	0	\N	completed	2023-10-27 10:27:02	2023-10-27 10:44:27	#TX-000115-2	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	115	0	0						0	0
174	1	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	673C+W8M - Dubai - United Arab Emirates,	73	3	ltl	pending	\N	0	\N	pending	2023-11-09 11:14:14	2023-11-09 11:14:14	#TX-000174	no	\N	\N	0	\N	\N	\N	0	33.518045571861066	73.10975566506386	United Arab Emirates	\N	\N	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
168	1	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	73	1	ftl	pending	\N	0	\N	pending	2023-10-27 10:51:56	2023-10-27 10:51:56	#TX-000168	no	\N	\N	0	\N	\N	\N	0	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
171	1	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	Jumeirah Golf Estates	113	2		approved_by_admin	\N	0	\N	completed	2023-10-27 11:52:31	2023-10-27 11:55:40	#TX-000171	no		\N	0	\N	\N	1	0	25.184231497721463	55.25999363511801	United Arab Emirates	\N	\N	25.01920789158473	55.2010665088892	United Arab Emirates	Dubai	\N	+971 544568266	+971 544568266	0	0	0	0						0	0
175	1	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	673C+W8M - Dubai - United Arab Emirates,	73	1	ftl	pending	\N	0	\N	pending	2023-11-09 12:41:13	2023-11-09 12:41:13	#TX-000175	no	\N	\N	0	\N	\N	\N	0	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
169	1	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	73	1	ftl	ask_for_qoute	\N	0	\N	pending	2023-10-27 10:52:15	2023-11-01 13:45:20	#TX-000169	no	\N	10	0	0	0	\N	0	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
172	1	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	New Delhi	84	1	ftl	approved_by_admin	\N	0	\N	completed	2023-11-07 11:10:19	2023-11-07 11:21:00	#TX-000172	yes	\N	100	1100	1100	1100	\N	1000	22.489859563358984	88.37032735347748	United Arab Emirates	Abu Dhabi	\N	28.613939179213727	77.20902130007744	United Arab Emirates	Dubai	\N	+971 5515256547	+971 5515256547	4	0	0	0						0	0
170	1	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	Jumeirah Golf Estates	113	1	ftl	approved_by_admin	\N	0	\N	completed	2023-10-27 11:16:13	2023-10-27 11:50:19	#TX-000170	no	\N	72.5	0	722.5	722.5	\N	650	25.184231497721463	55.25999363511801	United Arab Emirates	Dubai	\N	25.01920789158473	55.2010665088892	United Arab Emirates	Dubai	\N	+971 544568266	+971 544568266	4	0	0	0						0	0
176	1	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	73	1	ftl	pending	\N	0	\N	pending	2023-11-09 12:42:48	2023-11-09 12:42:48	#TX-000176	no	\N	\N	0	\N	\N	\N	0	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
173	1	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	pending	\N	0	\N	pending	2023-11-09 11:09:37	2023-11-09 11:09:37	#TX-000173	no	\N	\N	0	\N	\N	\N	0	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
177	0	25W4+V62 - Jumeirah Park - Dubai - United Arab Emirates,	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	85	1		ask_for_qoute	\N	0	\N	pending	2023-11-09 17:44:45	2023-11-09 17:44:45	#TX-000177	no	12121212	\N	0	\N	\N	1	0	25.047127821877247		\N	\N	\N	25.184237262438835	55.259992964565754	\N	\N	\N	\N	\N	0	0	0	0						0	0
285	1	Building Materials Mall	Trade Centre	122	1	ftl	pending	\N	0	\N	pending	2023-11-16 15:37:02	2023-11-16 15:37:02	#TX-000285	no	\N	\N	0	\N	\N	\N	0	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
179	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	2	\N	pending	\N	0	\N	pending	2023-11-10 10:47:33	2023-11-10 10:47:33	#TX-000179	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
180	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	pending	\N	0	\N	pending	2023-11-10 16:27:26	2023-11-10 16:27:26	#TX-000180	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
178	0	25W4+V62 - Jumeirah Park - Dubai - United Arab Emirates,		85	3		driver_qouted	\N	0	\N	pending	2023-11-10 07:57:10	2023-11-13 15:04:20	#TX-000178	no	12121212	\N	0	\N	\N	1	0	25.047127821877247		\N	\N	\N			\N	\N	\N	\N	\N	0	0	0	0						0	0
288	1	Building Materials Mall	Trade Centre	122	1	ftl	pending	\N	0	\N	pending	2023-11-16 15:41:29	2023-11-16 15:41:29	#TX-000288	no	\N	\N	0	\N	\N	\N	0	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
185	1	673C+W8M - Dubai - United Arab Emirates,	57PR+HR - Business Bay - Dubai - United Arab Emirates,	140	1	ftl	pending	\N	0	\N	pending	2023-11-13 10:08:50	2023-11-13 10:08:50	#TX-000185	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.186422980892413	55.29201988130808	United Arab Emirates	Dubai	\N	+971 1236547890	+971 1236547890	0	0	0	0						0	0
186	1	Building Materials Mall	Trade Centre	122	1	ftl	pending	\N	0	\N	pending	2023-11-13 10:14:07	2023-11-13 10:14:07	#TX-000186	no	\N	\N	0	\N	\N	\N	0	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
182	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	pending	\N	0	\N	pending	2023-11-10 16:48:56	2023-11-10 16:48:56	#TX-000182	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
187	1	Trade Centre	Building Materials Mall	122	1	ltl	pending	\N	0	\N	pending	2023-11-13 10:14:48	2023-11-13 10:14:48	#TX-000187	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
116	1	25W4+V62 - Jumeirah Park - Dubai - United Arab Emirates,	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	85	1	ftl	driver_qouted	\N	0	\N	qoutes_received	2023-10-24 14:47:56	2023-11-11 14:18:29	#TX-000116	no	\N	3	0	0	0	\N	0	25.047127821877247	55.15551958233118	United Arab Emirates	Dubai	\N	25.184237262438835	55.259992964565754	United Arab Emirates	Dubai	\N	+971 552125893	+971 552125893	1	0	0	0						0	0
183	1	673C+W8M - Dubai - United Arab Emirates,	567R+8R4 - Al Quoz - Al Quoz 3 - Dubai - United Arab Emirates,	133	1	ftl	pending	\N	0	\N	pending	2023-11-13 09:54:35	2023-11-13 09:54:35	#TX-000183	no	\N	\N	0	\N	\N	\N	0	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	25.1633635578166	55.24210296571255	United Arab Emirates	Dubai	\N	+91 8920524739	+91 8920524739	0	0	0	0						0	0
184	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	pending	\N	0	\N	pending	2023-11-13 10:04:42	2023-11-13 10:04:42	#TX-000184	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
188	1	673C+W8M - Dubai - United Arab Emirates,	57PR+HR - Business Bay - Dubai - United Arab Emirates,	140	1	ftl	pending	\N	0	\N	pending	2023-11-13 10:16:41	2023-11-13 10:16:41	#TX-000188	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.186422980892413	55.29201988130808	United Arab Emirates	Dubai	\N	+971 1236547890	+971 1236547890	0	0	0	0						0	0
189	1	673C+W8M - Dubai - United Arab Emirates,	57PR+HR - Business Bay - Dubai - United Arab Emirates,	140	1	ftl	pending	\N	0	\N	pending	2023-11-13 10:20:52	2023-11-13 10:20:52	#TX-000189	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.186422980892413	55.29201988130808	United Arab Emirates	Dubai	\N	+971 1236547890	+971 1236547890	0	0	0	0						0	0
190	1	567R+8R4 - Al Quoz - Al Quoz 3 - Dubai - United Arab Emirates,	673C+W8M - Dubai - United Arab Emirates,	133	1	ftl	pending	\N	0	\N	pending	2023-11-13 10:24:45	2023-11-13 10:24:45	#TX-000190	no	\N	\N	0	\N	\N	\N	0	25.1633635578166	55.24210296571255	United Arab Emirates	Dubai	\N	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	+91 8920524739	+91 8920524739	0	0	0	0						0	0
191	1	Trade Centre	Building Materials Mall	140	1	ltl	pending	\N	0	\N	pending	2023-11-13 10:27:35	2023-11-13 10:27:35	#TX-000191	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
192	1	Building Materials Mall	Trade Centre	122	1	ftl	pending	\N	0	\N	pending	2023-11-13 10:43:59	2023-11-13 10:43:59	#TX-000192	no	\N	\N	0	\N	\N	\N	0	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
193	1	Building Materials Mall	Trade Centre	122	1	ftl	pending	\N	0	\N	pending	2023-11-13 10:44:10	2023-11-13 10:44:10	#TX-000193	no	\N	\N	0	\N	\N	\N	0	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
194	1	673C+W8M - Dubai - United Arab Emirates,	567R+8R4 - Al Quoz - Al Quoz 3 - Dubai - United Arab Emirates,	133	1	ftl	pending	\N	0	\N	pending	2023-11-13 11:06:49	2023-11-13 11:06:49	#TX-000194	no	\N	\N	0	\N	\N	\N	0	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	25.1633635578166	55.24210296571255	United Arab Emirates	Dubai	\N	+91 8920524739	+91 8920524739	0	0	0	0						0	0
195	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	pending	\N	0	\N	pending	2023-11-13 11:38:16	2023-11-13 11:38:16	#TX-000195	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
196	1	673C+W8M - Dubai - United Arab Emirates,	567R+8R4 - Al Quoz - Al Quoz 3 - Dubai - United Arab Emirates,	133	1	ftl	pending	\N	0	\N	pending	2023-11-13 11:49:22	2023-11-13 11:49:22	#TX-000196	no	\N	\N	0	\N	\N	\N	0	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	25.1633635578166	55.24210296571255	United Arab Emirates	Dubai	\N	+91 8920524739	+91 8920524739	0	0	0	0						0	0
197	1	673C+W8M - Dubai - United Arab Emirates,	6727+556 - 13th St - Al Wasl - Dubai - United Arab Emirates,	133	3	ftl	pending	\N	0	\N	pending	2023-11-13 13:35:37	2023-11-13 13:35:37	#TX-000197	no	\N	\N	0	\N	\N	\N	0	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	25.168942204444328	55.24138446897268	United Arab Emirates	Dubai	\N	+91 8920524739	+91 8920524739	0	0	0	0						0	0
198	1	F93G+HW5 - Al Manhal - Abu Dhabi - United Arab Emirates,	\N	133	4	\N	pending	\N	0	\N	pending	2023-11-13 13:37:28	2023-11-13 13:37:28	#TX-000198	no	\N	\N	0	\N	\N	\N	0	24.453887367074184	54.37734369188547	United Arab Emirates	Abu Dhabi	\N	\N	\N	\N	\N	\N	+91 8920524739	\N	0	0	0	0						0	0
181	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	approved_by_admin	\N	0	\N	completed	2023-11-10 16:30:03	2023-11-13 16:26:45	#TX-000181	no	\N	0	0	222	222	\N	222	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	4	0	0	0						0	0
200	1	F93G+HW5 - Al Manhal - Abu Dhabi - United Arab Emirates,	673C+W8M - Dubai - United Arab Emirates,	133	1	ltl	pending	\N	0	\N	pending	2023-11-13 13:49:40	2023-11-13 13:49:40	#TX-000200	no	\N	\N	0	\N	\N	\N	0	24.453887367074184	54.37734369188547	United Arab Emirates	\N	\N	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	+91 8920524739	+91 8920524739	0	0	0	0						0	0
201	1	F93G+HW5 - Al Manhal - Abu Dhabi - United Arab Emirates,	673C+W8M - Dubai - United Arab Emirates,	133	3	ftl	pending	\N	0	\N	pending	2023-11-13 13:56:05	2023-11-13 13:56:05	#TX-000201	no	\N	\N	0	\N	\N	\N	0	24.453887367074184	54.37734369188547	United Arab Emirates	Abu Dhabi	\N	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	+91 8920524739	+91 8920524739	0	0	0	0						0	0
199	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-11-13 13:46:59	2023-11-14 23:06:37	#TX-000199	no	\N	0	0	980	980	\N	980	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	2	0	0	0						0	0
203	1	F93G+HW5 - Al Manhal - Abu Dhabi - United Arab Emirates,	673C+W8M - Dubai - United Arab Emirates,	133	1	ftl	pending	\N	0	\N	pending	2023-11-13 13:56:54	2023-11-13 13:56:54	#TX-000203	no	\N	\N	0	\N	\N	\N	0	24.453887367074184	54.37734369188547	United Arab Emirates	Abu Dhabi	\N	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	+91 8920524739	+91 8920524739	0	0	0	0						0	0
202	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	2	\N	ask_for_qoute	\N	0	\N	pending	2023-11-13 13:56:48	2023-11-14 23:04:00	#TX-000202	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
205	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ltl	pending	\N	0	\N	pending	2023-11-13 14:05:33	2023-11-13 14:05:33	#TX-000205	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
206	1	Trade Centre	Building Materials Mall	122	1	ltl	pending	\N	0	\N	pending	2023-11-13 14:09:01	2023-11-13 14:09:01	#TX-000206	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
207	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ltl	pending	\N	0	\N	pending	2023-11-13 14:10:43	2023-11-13 14:10:43	#TX-000207	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
208	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ltl	pending	\N	0	\N	pending	2023-11-13 14:11:50	2023-11-13 14:11:50	#TX-000208	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
209	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ltl	pending	\N	0	\N	pending	2023-11-13 14:15:46	2023-11-13 14:15:46	#TX-000209	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
210	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ltl	pending	\N	0	\N	pending	2023-11-13 14:19:06	2023-11-13 14:19:06	#TX-000210	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
211	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ltl	pending	\N	0	\N	pending	2023-11-13 14:19:27	2023-11-13 14:19:27	#TX-000211	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
212	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	2	\N	pending	\N	0	\N	pending	2023-11-13 14:23:05	2023-11-13 14:23:05	#TX-000212	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
213	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	2	\N	pending	\N	0	\N	pending	2023-11-13 14:23:27	2023-11-13 14:23:27	#TX-000213	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
214	1	673C+W8M - Dubai - United Arab Emirates,	\N	73	4	\N	pending	\N	0	\N	pending	2023-11-13 14:25:23	2023-11-13 14:25:23	#TX-000214	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	\N	\N	\N	\N	\N	+971 090078601	\N	0	0	0	0						0	0
215	1	673C+W8M - Dubai - United Arab Emirates,	\N	73	4	\N	pending	\N	0	\N	pending	2023-11-13 14:28:20	2023-11-13 14:28:20	#TX-000215	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	\N	\N	\N	\N	\N	+971 090078601	\N	0	0	0	0						0	0
216	1	673C+W8M - Dubai - United Arab Emirates,	\N	73	4	\N	approved_by_admin	\N	0	\N	completed	2023-11-13 14:28:43	2023-11-18 20:49:11	#TX-000216	no	\N	0	0	23	23	\N	23	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	\N	\N	\N	\N	\N	+971 090078601	\N	4	0	0	0						0	0
217	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	3	ftl	pending	\N	0	\N	pending	2023-11-13 14:29:25	2023-11-13 14:29:25	#TX-000217	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
204	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-11-13 14:04:06	2023-11-14 11:18:08	#TX-000204	no	\N	0	0	5	5	\N	5	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	2	0	0	0						0	0
218	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	3	ltl	pending	\N	0	\N	pending	2023-11-13 14:30:09	2023-11-13 14:30:09	#TX-000218	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
221	1	F93G+HW5 - Al Manhal - Abu Dhabi - United Arab Emirates,	673C+W8M - Dubai - United Arab Emirates,	133	1	ftl	pending	\N	0	\N	pending	2023-11-13 15:18:15	2023-11-13 15:19:42	#TX-000221	no		\N	0	\N	\N	1	0	24.453887367074184	54.37734369188547	United Arab Emirates	Abu Dhabi	\N	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	+91 8920524739	+91 8920524739	0	0	0	0						0	0
227	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ltl	pending	\N	0	\N	pending	2023-11-13 22:42:57	2023-11-13 22:42:57	#TX-000227	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
220	1	F93G+HW5 - Al Manhal - Abu Dhabi - United Arab Emirates,	673C+W8M - Dubai - United Arab Emirates,	133	1	ftl	pending	\N	0	\N	pending	2023-11-13 14:58:09	2023-11-13 14:58:09	#TX-000220	no	\N	\N	0	\N	\N	\N	0	24.453887367074184	54.37734369188547	United Arab Emirates	Abu Dhabi	\N	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	+91 8920524739	+91 8920524739	0	0	0	0						0	0
225	1	673C+W8M - Dubai - United Arab Emirates,	46VG+6J8 - Al Quoz - Dubai - United Arab Emirates,	142	1	ftl	driver_qouted	\N	0	\N	on_process	2023-11-13 18:32:21	2023-11-13 18:38:32	#TX-000225	no	\N	0	0	2	2	\N	2	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	25.143800471524028	55.226107612252235	United Arab Emirates	Abu Dhabi	\N	+971 000000000	+971 000000000	2	0	0	0						0	0
222	1	F93G+HW5 - Al Manhal - Abu Dhabi - United Arab Emirates,	673C+W8M - Dubai - United Arab Emirates,	133	1	ftl	ask_for_qoute	\N	0	\N	on_process	2023-11-13 15:24:06	2023-11-13 15:50:12	#TX-000222	yes	23ererw	560	0	5960	5960	1	5400	24.453887367074184	54.37734369188547	United Arab Emirates	Abu Dhabi	\N	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	+91 8920524739	+91 8920524739	1	0	0	0						0	0
224	1	673C+W8M - Dubai - United Arab Emirates,	F93G+HW5 - Al Manhal - Abu Dhabi - United Arab Emirates,	133	1	ftl	pending	\N	0	\N	pending	2023-11-13 16:51:52	2023-11-13 16:51:52	#TX-000224	no	\N	\N	0	\N	\N	\N	0	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	24.453887367074184	54.37734369188547	United Arab Emirates	Abu Dhabi	\N	+91 8920524739	+91 8920524739	0	0	0	0						0	0
219	1	F93G+HW5 - Al Manhal - Abu Dhabi - United Arab Emirates,	673C+W8M - Dubai - United Arab Emirates,	133	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-11-13 14:56:24	2023-11-13 15:05:51	#TX-000219	no		400	0	10400	10400	1	10000	24.453887367074184	54.37734369188547	United Arab Emirates	Abu Dhabi	\N	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	+91 8920524739	+91 8920524739	1	0	0	0						0	0
228	1	673C+W8M - Dubai - United Arab Emirates,	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	73	2	\N	pending	\N	0	\N	pending	2023-11-13 22:54:42	2023-11-13 22:54:42	#TX-000228	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
229	1	673C+W8M - Dubai - United Arab Emirates,	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	73	3	ftl	pending	\N	0	\N	pending	2023-11-13 23:10:22	2023-11-13 23:10:22	#TX-000229	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	33.518045571861066	73.10975566506386	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
223	1	F93G+HW5 - Al Manhal - Abu Dhabi - United Arab Emirates,	673C+W8M - Dubai - United Arab Emirates,	133	1	ftl	driver_qouted	\N	0	\N	qoutes_received	2023-11-13 15:47:56	2023-11-14 11:15:23	#TX-000223	no	\N	0	0	3	3	\N	3	24.453887367074184	54.37734369188547	United Arab Emirates	Abu Dhabi	\N	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	+91 8920524739	+91 8920524739	1	0	0	0						0	0
230	1	Rosemary Ave, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	3	ltl	pending	\N	0	\N	pending	2023-11-13 23:24:07	2023-11-13 23:24:07	#TX-000230	no	\N	\N	0	\N	\N	\N	0	33.518045571861066	73.10975566506386	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
231	1	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	\N	73	4	\N	pending	\N	0	\N	pending	2023-11-13 23:35:58	2023-11-13 23:35:58	#TX-000231	no	\N	\N	0	\N	\N	\N	0	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	\N	\N	\N	\N	\N	+971 090078601	\N	0	0	0	0						0	0
233	1	46VG+6J8 - Al Quoz - Dubai - United Arab Emirates,		142	4		approved_by_admin	\N	0	\N	qoutes_received	2023-11-14 10:25:33	2023-11-14 12:39:37	#TX-000233	yes	44	\N	0	\N	\N	1	0	25.143800471524028	55.226107612252235	United Arab Emirates	Abu Dhabi	\N	\N	\N	\N	\N	\N	+971 000000000	\N	1	0	0	0						0	0
232	1	673C+W8M - Dubai - United Arab Emirates,	\N	142	4	\N	driver_qouted	\N	0	\N	completed	2023-11-14 09:54:39	2023-11-14 10:10:39	#TX-000232	yes	\N	66	1000	8300	8300	\N	5000	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	\N	\N	\N	\N	\N	+971 000000000	\N	4	0	0	0						0	0
226	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	approved_by_admin	\N	0	\N	completed	2023-11-13 22:23:37	2023-11-14 11:27:53	#TX-000226	no	\N	0	0	1234	1234	\N	1234	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	4	0	0	0						0	0
234	1	C/1B, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	G929+88J, Poddar Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	145	1	ftl	approved_by_admin	\N	0	\N	qoutes_received	2023-11-14 12:57:29	2023-11-14 13:01:43	#TX-000234	no	\N	\N	0	\N	\N	\N	0	22.4893236473253	88.37173450738192	United Arab Emirates	Dubai	\N	22.500724271233974	88.36815275251865	United Arab Emirates	Dubai	\N	+971 987466666	+971 987466666	1	0	0	0						0	0
235	1	C/1B, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	G929+88J, Poddar Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	145	1	ftl	pending	\N	0	\N	pending	2023-11-14 13:04:56	2023-11-14 13:04:56	#TX-000235	no	\N	\N	0	\N	\N	\N	0	22.4893236473253	88.37173450738192	United Arab Emirates	Dubai	\N	22.500724271233974	88.36815275251865	United Arab Emirates	Dubai	\N	+971 987466666	+971 987466666	0	0	0	0						0	0
236	1	673C+W8M - Dubai - United Arab Emirates,	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	146	1	ftl	pending	\N	0	\N	pending	2023-11-14 13:09:56	2023-11-14 13:09:56	#TX-000236	no	\N	\N	0	\N	\N	\N	0	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	25.091268543506686	55.24340819567442	United Arab Emirates	Dubai	\N	+971 8424554646	+971 8424554646	0	0	0	0						0	0
237	1	673C+W8M - Dubai - United Arab Emirates,	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	146	1	ftl	pending	\N	0	\N	pending	2023-11-14 13:10:22	2023-11-14 13:10:22	#TX-000237	no	\N	\N	0	\N	\N	\N	0	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	25.091268543506686	55.24340819567442	United Arab Emirates	Dubai	\N	+971 8424554646	+971 8424554646	0	0	0	0						0	0
238	1	673C+W8M - Dubai - United Arab Emirates,	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	146	1	ftl	pending	\N	0	\N	pending	2023-11-14 13:10:55	2023-11-14 13:10:55	#TX-000238	no	\N	\N	0	\N	\N	\N	0	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	25.091268543506686	55.24340819567442	United Arab Emirates	Dubai	\N	+971 8424554646	+971 8424554646	0	0	0	0						0	0
239	1	673C+W8M - Dubai - United Arab Emirates,	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	146	1	ftl	pending	\N	0	\N	pending	2023-11-14 13:11:14	2023-11-14 13:11:14	#TX-000239	no	\N	\N	0	\N	\N	\N	0	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	25.091268543506686	55.24340819567442	United Arab Emirates	Dubai	\N	+971 8424554646	+971 8424554646	0	0	0	0						0	0
241	1	G929+88J, Poddar Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	C/1B, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	145	1	ftl	pending	\N	0	\N	pending	2023-11-14 16:03:38	2023-11-14 16:03:38	#TX-000241	no	\N	\N	0	\N	\N	\N	0	22.500724271233974	88.36815275251865	United Arab Emirates	Dubai	\N	22.4893236473253	88.37173450738192	United Arab Emirates	Dubai	\N	+971 987466666	+971 987466666	0	0	0	0						0	0
240	1	673C+W8M - Dubai - United Arab Emirates,	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	146	1	ltl	ask_for_qoute	\N	0	\N	pending	2023-11-14 13:11:42	2023-11-14 16:29:16	#TX-000240	no	\N	\N	0	\N	\N	\N	0	25.20485257399441	55.27078282088041	United Arab Emirates	\N	\N	25.091268543506686	55.24340819567442	United Arab Emirates	Dubai	\N	+971 8424554646	+971 8424554646	0	0	0	0						0	0
242	1	673C+W8M - Dubai - United Arab Emirates,	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	146	3	ftl	pending	\N	0	\N	pending	2023-11-14 16:32:02	2023-11-14 16:32:02	#TX-000242	no	\N	\N	0	\N	\N	\N	0	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	25.091268543506686	55.24340819567442	United Arab Emirates	Dubai	\N	+971 8424554646	+971 8424554646	0	0	0	0						0	0
245	1	673C+W8M - Dubai - United Arab Emirates,	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	146	1	ftl	approved_by_admin	\N	0	\N	completed	2023-11-14 17:29:22	2023-11-14 17:33:29	#TX-000245	no	\N	100	0	1100	1100	\N	1000	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	25.091268543506686	55.24340819567442	United Arab Emirates	Dubai	\N	+971 8424554646	+971 8424554646	4	0	0	0						0	0
244	1	673C+W8M - Dubai - United Arab Emirates,	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	146	1	ftl	pending	\N	0	\N	pending	2023-11-14 17:12:58	2023-11-14 17:12:58	#TX-000244	no	\N	\N	0	\N	\N	\N	0	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	25.091268543506686	55.24340819567442	United Arab Emirates	Dubai	\N	+971 8424554646	+971 8424554646	0	0	0	0						0	0
248	1	673C+W8M - Dubai - United Arab Emirates,	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	146	3	ltl	pending	\N	0	\N	pending	2023-11-14 17:56:59	2023-11-14 17:56:59	#TX-000248	no	\N	\N	0	\N	\N	\N	0	25.20485257399441	55.27078282088041	United Arab Emirates	\N	\N	25.091268543506686	55.24340819567442	United Arab Emirates	Dubai	\N	+971 8424554646	+971 8424554646	0	0	0	0						0	0
247	1	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	7/A, Indian Association For The Cultivation Of Science, Poddar Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	134	1	ltl	approved_by_admin	\N	0	\N	completed	2023-11-14 17:54:25	2023-11-14 17:57:59	#TX-000247	no	\N	100	0	2100	2100	\N	2000	22.489857394916786	88.37032668292522	United Arab Emirates	\N	\N	22.49779180727421	88.36903754621744	United Arab Emirates	Abu Dhabi	\N	+971 996666966	+971 996666966	4	0	0	0						0	0
246	1	673C+W8M - Dubai - United Arab Emirates,	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	146	3	ftl	pending	\N	0	\N	pending	2023-11-14 17:39:08	2023-11-14 17:40:08	#TX-000246	no	\N	\N	0	\N	\N	\N	0	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	25.091268543506686	55.24340819567442	United Arab Emirates	Dubai	\N	+971 8424554646	+971 8424554646	0	0	0	0						0	0
243	1	673C+W8M - Dubai - United Arab Emirates,	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	146	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-11-14 17:12:07	2023-11-14 17:18:57	#TX-000243	no	\N	500	0	5500	5500	\N	5000	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	25.091268543506686	55.24340819567442	United Arab Emirates	Dubai	\N	+971 8424554646	+971 8424554646	2	0	0	0						0	0
249	1	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	7/A, Indian Association For The Cultivation Of Science, Poddar Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	134	2	\N	pending	\N	0	\N	pending	2023-11-14 18:09:55	2023-11-14 18:09:55	#TX-000249	no	\N	\N	0	\N	\N	\N	0	22.489857394916786	88.37032668292522	United Arab Emirates	\N	\N	22.49779180727421	88.36903754621744	United Arab Emirates	Abu Dhabi	\N	+971 996666966	+971 996666966	0	0	0	0						0	0
250	1	673C+W8M - Dubai - United Arab Emirates,	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	146	2	\N	pending	\N	0	\N	pending	2023-11-14 18:10:26	2023-11-14 18:11:35	#TX-000250	yes	\N	\N	0	\N	\N	\N	0	25.20485257399441	55.27078282088041	United Arab Emirates	\N	\N	25.091268543506686	55.24340819567442	United Arab Emirates	Dubai	\N	+971 8424554646	+971 8424554646	0	0	0	0						0	0
251	1	673C+W8M - Dubai - United Arab Emirates,	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	146	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-11-14 19:31:46	2023-11-14 19:33:46	#TX-000251	no	\N	0	0	2	2	\N	2	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	25.091268543506686	55.24340819567442	United Arab Emirates	Dubai	\N	+971 8424554646	+971 8424554646	2	0	0	0						0	0
286	1	Building Materials Mall	Trade Centre	122	1	ftl	pending	\N	0	\N	pending	2023-11-16 15:39:57	2023-11-16 15:39:57	#TX-000286	no	\N	\N	0	\N	\N	\N	0	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
257	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	3	lcl	pending	\N	0	\N	pending	2023-11-15 13:27:44	2023-11-15 13:27:44	#TX-000257	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
258	1	Building Materials Mall	Trade Centre	122	1	ftl	pending	\N	0	\N	pending	2023-11-15 13:30:13	2023-11-15 13:30:13	#TX-000258	no	\N	\N	0	\N	\N	\N	0	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
260	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ltl	approved_by_admin	\N	0	\N	completed	2023-11-15 13:31:12	2023-12-04 16:35:58	#TX-000260	no	\N	0	212	111	111	\N	111	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	4	0	0	0						0	0
253	1	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	50/2A, Cossipore, Newland, College Square, Kolkata, West Bengal 700012, India,	146	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-11-14 20:29:01	2023-11-14 20:30:21	#TX-000253	no	\N	0.2	0	2.2	2.2	\N	2	28.704062438662817	77.10249032825232	India	Delhi	\N	22.57264942688325	88.36389508098364	India	Kolkata	\N	+971 8424554646	+971 8424554646	2	0	0	0						0	0
254	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	3	fcl	pending	\N	0	\N	pending	2023-11-15 13:24:59	2023-11-15 13:24:59	#TX-000254	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
255	1	Trade Centre	Trade Centre	122	3	fcl	pending	\N	0	\N	pending	2023-11-15 13:25:17	2023-11-15 13:25:17	#TX-000255	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	0	0	0						0	0
252	1	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	50/2A, Cossipore, Newland, College Square, Kolkata, West Bengal 700012, India,	146	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-11-14 20:14:00	2023-11-14 20:19:26	#TX-000252	no	\N	100.4	0	1102.4	1102.4	\N	1002	28.704062438662817	77.10249032825232	India	Delhi	\N	22.57264942688325	88.36389508098364	India	Kolkata	\N	+971 8424554646	+971 8424554646	1	0	0	0						0	0
256	1	673C+W8M - Dubai - United Arab Emirates,	673C+W8M - Dubai - United Arab Emirates,	122	3	lcl	pending	\N	0	\N	pending	2023-11-15 13:27:32	2023-11-15 13:27:32	#TX-000256	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
263	1	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	146	1	ftl	driver_qouted	\N	0	\N	pending	2023-11-15 14:19:50	2023-11-15 14:20:24	#TX-000263	no	\N	\N	0	\N	\N	\N	0	25.091268543506686	55.24340819567442	United Arab Emirates	Dubai	\N	28.704062438662817	77.10249032825232	India	Delhi	\N	+971 8424554646	+971 8424554646	0	0	0	0						0	0
261	1	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	146	1	ftl	driver_qouted	\N	0	\N	pending	2023-11-15 13:45:06	2023-11-15 13:50:17	#TX-000261	no	\N	\N	0	\N	\N	\N	0	25.091268543506686	55.24340819567442	United Arab Emirates	Dubai	\N	28.704062438662817	77.10249032825232	India	Delhi	\N	+971 8424554646	+971 8424554646	0	0	0	0						0	0
262	1	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	146	1	ftl	driver_qouted	\N	0	\N	on_process	2023-11-15 13:48:06	2023-11-17 17:21:39	#TX-000262	no	\N	0	0	6	6	\N	6	25.091268543506686	55.24340819567442	United Arab Emirates	Dubai	\N	28.704062438662817	77.10249032825232	India	Delhi	\N	+971 8424554646	+971 8424554646	2	0	0	0						0	0
265	1	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	146	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-11-15 14:46:56	2023-11-15 14:59:46	#TX-000265	no	\N	10	0	1.1	1.1	\N	1	25.091268543506686	55.24340819567442	United Arab Emirates	Dubai	\N	28.704062438662817	77.10249032825232	India	Delhi	\N	+971 8424554646	+971 8424554646	2	0	0	0						0	0
264	1	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	146	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-11-15 14:38:18	2023-11-15 14:40:25	#TX-000264	no	\N	0	0	1	1	\N	1	25.091268543506686	55.24340819567442	United Arab Emirates	Dubai	\N	28.704062438662817	77.10249032825232	India	Delhi	\N	+971 8424554646	+971 8424554646	2	0	0	0						0	0
266	1	C/1B, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	7/A, Indian Association For The Cultivation Of Science, Poddar Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	134	1	ftl	approved_by_admin	\N	0	\N	qoutes_received	2023-11-15 15:29:33	2023-11-15 15:30:42	#TX-000266	no	\N	\N	0	\N	\N	\N	0	22.4893236473253	88.37173450738192	India	Delhi	\N	22.49779180727421	88.36903754621744	United Arab Emirates	Abu Dhabi	\N	+971 996666966	+971 996666966	1	0	0	0						0	0
267	1	C/1B, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	7/A, Indian Association For The Cultivation Of Science, Poddar Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	134	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-11-15 15:33:50	2023-11-15 17:08:39	#TX-000267	no	\N	0	0	501	501	\N	501	22.4893236473253	88.37173450738192	India	Delhi	\N	22.49779180727421	88.36903754621744	United Arab Emirates	Abu Dhabi	\N	+971 996666966	+971 996666966	2	0	0	0						0	0
290	1	Trade Centre	\N	122	4	\N	pending	\N	0	\N	pending	2023-11-16 16:05:44	2023-11-16 16:05:44	#TX-000290	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	\N	\N	\N	\N	\N		\N	0	0	0	0						0	0
276	1	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	145	1	ftl	pending	\N	0	\N	pending	2023-11-16 10:35:32	2023-11-16 10:35:32	#TX-000276	no	\N	\N	0	\N	\N	\N	0	22.489857394916786	88.37032668292522	United Arab Emirates	Abu Dhabi	\N	22.4898580144717	88.3703253418207	United Arab Emirates	Dubai	\N	+971 996666966	+971 996666966	0	0	0	0						0	0
268	1	Green Zone, Jadavpur University, 188, Raja Subodh Chandra Mallick Rd, Jadavpur, Kolkata, West Bengal 700032, India,	C/1B, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	134	1	ftl	approved_by_admin	\N	0	\N	qoutes_received	2023-11-15 15:38:50	2023-11-15 15:40:18	#TX-000268	no	\N	\N	0	\N	\N	\N	0	22.49879015917199	88.37079741060735	India	Kolkata	\N	22.4893236473253	88.37173450738192	India	Delhi	\N	+971 996666966	+971 996666966	1	0	0	0						0	0
280	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	pending	\N	0	\N	pending	2023-11-16 11:32:34	2023-11-16 11:32:34	#TX-000280	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
271	1	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	146	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-11-15 18:53:51	2023-11-15 18:54:57	#TX-000271	no	\N	0	0	250	250	\N	250	25.091268543506686	55.24340819567442	United Arab Emirates	Dubai	\N	28.704062438662817	77.10249032825232	India	Delhi	\N	+971 8424554646	+971 8424554646	2	0	0	0						0	0
269	1	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	146	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-11-15 17:42:52	2023-11-15 17:56:49	#TX-000269	no	\N	0	0	2	2	\N	2	25.091268543506686	55.24340819567442	United Arab Emirates	Dubai	\N	28.704062438662817	77.10249032825232	India	Delhi	\N	+971 8424554646	+971 8424554646	2	0	0	0						0	0
273	1	G929+88J, Poddar Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	C/1B, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	145	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-11-15 19:34:48	2023-11-15 19:35:42	#TX-000273	no	\N	0	0	5000	5000	\N	5000	22.500724271233974	88.36815275251865	United Arab Emirates	Dubai	\N	22.4893236473253	88.37173450738192	United Arab Emirates	Dubai	\N	+971 987466666	+971 987466666	2	0	0	0						0	0
274	1	39 Street 35 - Al Barsha - Al Barsha South - Dubai - United Arab Emirates,	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	146	3	fcl	pending	\N	0	\N	pending	2023-11-16 09:34:50	2023-11-16 09:34:50	#TX-000274	no	\N	\N	0	\N	\N	\N	0	25.091268543506686	55.24340819567442	United Arab Emirates	Dubai	\N	28.704062438662817	77.10249032825232	India	Delhi	\N	+971 8424554646	+971 8424554646	0	0	0	0						0	0
270	1	G929+88J, Poddar Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	C/1B, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	145	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-11-15 18:47:18	2023-11-15 18:48:15	#TX-000270	no	\N	0	0	25000	25000	\N	25000	22.500724271233974	88.36815275251865	United Arab Emirates	Dubai	\N	22.4893236473253	88.37173450738192	United Arab Emirates	Dubai	\N	+971 987466666	+971 987466666	2	0	0	0						0	0
272	1	G929+88J, Poddar Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	C/1B, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	145	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-11-15 19:03:55	2023-11-15 19:09:38	#TX-000272	no	\N	0	0	250	250	\N	250	22.500724271233974	88.36815275251865	United Arab Emirates	Dubai	\N	22.4893236473253	88.37173450738192	United Arab Emirates	Dubai	\N	+971 987466666	+971 987466666	2	0	0	0						0	0
275	0	79XM+M84 - Amman St - opposite of Carrefour Market - Al Qusais Industrial Area - Al Qusais Industrial Area 3 - Dubai - United Arab Emirates,	\N	137	4	\N	pending	\N	0	\N	pending	2023-11-16 09:39:29	2023-11-16 09:39:29	#TX-000275	no	\N	\N	0	\N	\N	\N	0	25.299383033068388	55.38365487009287	United Arab Emirates	Abu Dhabi	\N	\N	\N	\N	\N	\N	+971 46466494664	\N	0	0	0	0						0	0
311	1	Trade Centre	Building Materials Mall	122	2	\N	pending	\N	0	\N	pending	2023-11-16 17:50:07	2023-11-16 17:50:07	#TX-000311	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
279	1	673C+W8M - Dubai - United Arab Emirates,	23 35B Street - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-11-16 11:08:18	2023-11-16 11:21:43	#TX-000279	no	\N	0	0	2	2	\N	2	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	25.12637277872611	55.242289043962955	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	2	0	0	0						0	0
281	1	Trade Centre	\N	122	4	\N	pending	\N	0	\N	pending	2023-11-16 15:18:37	2023-11-16 15:18:37	#TX-000281	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	\N	\N	\N	\N	\N		\N	0	0	0	0						0	0
277	1	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	145	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-11-16 10:38:19	2023-11-16 10:51:37	#TX-000277	no	\N	0	0	300	300	\N	300	22.489857394916786	88.37032668292522	United Arab Emirates	Abu Dhabi	\N	22.4898580144717	88.3703253418207	United Arab Emirates	Dubai	\N	+971 996666966	+971 996666966	2	0	0	0						0	0
282	1	Trade Centre	\N	122	4	\N	pending	\N	0	\N	pending	2023-11-16 15:29:09	2023-11-16 15:29:09	#TX-000282	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	\N	\N	\N	\N	\N		\N	0	0	0	0						0	0
283	1	Trade Centre	\N	122	4	\N	pending	\N	0	\N	pending	2023-11-16 15:34:26	2023-11-16 15:34:26	#TX-000283	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	\N	\N	\N	\N	\N		\N	0	0	0	0						0	0
82	1	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	673C+W8M - Dubai - United Arab Emirates,	73	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-10-16 14:50:04	2023-11-16 15:35:04	#TX-000082	no	\N	30	0	630	630	\N	600	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	2	0	0	0						0	0
284	1	Building Materials Mall	Trade Centre	122	1	ftl	pending	\N	0	\N	pending	2023-11-16 15:35:28	2023-11-16 15:35:28	#TX-000284	no	\N	\N	0	\N	\N	\N	0	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
289	1	Building Materials Mall	Trade Centre	122	1	ftl	driver_qouted	\N	0	\N	pending	2023-11-16 15:55:35	2023-11-16 16:18:02	#TX-000289	no	\N	\N	0	\N	\N	\N	0	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
291	1	Trade Centre	Building Materials Mall	99	2	\N	pending	\N	0	\N	pending	2023-11-16 16:44:33	2023-11-16 16:44:33	#TX-000291	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
292	1	Trade Centre	Building Materials Mall	99	2	\N	pending	\N	0	\N	pending	2023-11-16 16:47:39	2023-11-16 16:47:39	#TX-000292	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
293	1	Trade Centre	Building Materials Mall	99	2	\N	pending	\N	0	\N	pending	2023-11-16 16:48:43	2023-11-16 16:48:43	#TX-000293	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
294	1	Trade Centre	Building Materials Mall	122	2	\N	pending	\N	0	\N	pending	2023-11-16 16:50:02	2023-11-16 16:50:02	#TX-000294	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
295	1	Trade Centre	Building Materials Mall	122	2	\N	pending	\N	0	\N	pending	2023-11-16 17:07:40	2023-11-16 17:07:40	#TX-000295	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
296	1	Trade Centre	Building Materials Mall	122	2	\N	pending	\N	0	\N	pending	2023-11-16 17:12:10	2023-11-16 17:12:10	#TX-000296	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
297	1	Trade Centre	Building Materials Mall	122	2	\N	pending	\N	0	\N	pending	2023-11-16 17:13:27	2023-11-16 17:13:27	#TX-000297	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
298	1	Trade Centre	Building Materials Mall	122	2	\N	pending	\N	0	\N	pending	2023-11-16 17:15:20	2023-11-16 17:15:20	#TX-000298	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
299	1	Trade Centre	Building Materials Mall	122	2	\N	pending	\N	0	\N	pending	2023-11-16 17:16:33	2023-11-16 17:16:33	#TX-000299	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
300	1	Trade Centre	Building Materials Mall	122	2	\N	pending	\N	0	\N	pending	2023-11-16 17:17:29	2023-11-16 17:17:29	#TX-000300	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
302	1	Trade Centre	Building Materials Mall	122	2	\N	pending	\N	0	\N	pending	2023-11-16 17:19:00	2023-11-16 17:19:00	#TX-000302	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
303	1	Trade Centre	Building Materials Mall	122	2	\N	pending	\N	0	\N	pending	2023-11-16 17:20:12	2023-11-16 17:20:12	#TX-000303	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
304	1	Trade Centre	Building Materials Mall	122	2	\N	pending	\N	0	\N	pending	2023-11-16 17:23:40	2023-11-16 17:23:40	#TX-000304	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
307	1	G929+88J, Poddar Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	C/1B, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	145	3	fcl	pending	\N	0	\N	pending	2023-11-16 17:26:08	2023-11-16 17:26:08	#TX-000307	no	\N	\N	0	\N	\N	\N	0	22.500724271233974	88.36815275251865	United Arab Emirates	Dubai	\N	22.4893236473253	88.37173450738192	United Arab Emirates	Dubai	\N	+971 987466666	+971 987466666	0	0	0	0						0	0
301	1	G929+88J, Poddar Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	C/1B, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	145	2		approved_by_admin	\N	0	\N	completed	2023-11-16 17:18:55	2023-11-16 17:22:25	#TX-000301	no		\N	0	\N	\N	1	0	22.500724271233974	88.36815275251865	United Arab Emirates	\N	\N	22.4893236473253	88.37173450738192	United Arab Emirates	Dubai	\N	+971 987466666	+971 987466666	0	0	0	0						0	0
278	1	G929+88J, Poddar Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	C/1B, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	145	1	ftl	driver_qouted	\N	0	\N	on_process	2023-11-16 10:50:08	2023-11-16 17:23:04	#TX-000278	no	\N	0	0	2000	2000	\N	2000	22.500724271233974	88.36815275251865	United Arab Emirates	Dubai	\N	22.4893236473253	88.37173450738192	United Arab Emirates	Dubai	\N	+971 987466666	+971 987466666	2	0	0	0						0	0
306	1	Trade Centre	Building Materials Mall	122	2	\N	pending	\N	0	\N	pending	2023-11-16 17:24:36	2023-11-16 17:24:36	#TX-000306	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
305	0			145	4		pending	\N	0	\N	pending	2023-11-16 17:24:10	2023-11-16 17:24:46	#TX-000305	no		\N	0	\N	\N	1	0					\N	\N	\N	\N	\N	\N		\N	0	0	0	0						0	0
308	1	Trade Centre	Building Materials Mall	122	2	\N	pending	\N	0	\N	pending	2023-11-16 17:29:32	2023-11-16 17:29:32	#TX-000308	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
309	1	673C+W8M - Dubai - United Arab Emirates,	23 35B Street - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	1	ftl	approved_by_admin	\N	0	\N	completed	2023-11-16 17:38:09	2023-11-16 17:45:46	#TX-000309	no	\N	0	0	2	2	\N	2	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	25.12637277872611	55.242289043962955	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	4	0	0	0						0	0
310	1	Trade Centre	Building Materials Mall	122	2	\N	pending	\N	0	\N	pending	2023-11-16 17:40:12	2023-11-16 17:40:12	#TX-000310	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
314	1	Trade Centre	Building Materials Mall	122	2	\N	pending	\N	0	\N	pending	2023-11-16 18:19:07	2023-11-16 18:19:07	#TX-000314	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
315	1	Trade Centre	Building Materials Mall	122	2	\N	pending	\N	0	\N	pending	2023-11-16 18:43:13	2023-11-16 18:43:13	#TX-000315	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
316	1	C/1B, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	G929+88J, Poddar Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	145	3	lcl	pending	\N	0	\N	pending	2023-11-16 19:10:52	2023-11-16 19:10:52	#TX-000316	no	\N	\N	0	\N	\N	\N	0	22.4893236473253	88.37173450738192	United Arab Emirates	\N	\N	22.500724271233974	88.36815275251865	United Arab Emirates	Dubai	\N	+971 987466666	+971 987466666	0	0	0	0						0	0
320	1	Premier Inn Dubai Dragon Mart Hotel	Premier Inn Dubai Dragon Mart Hotel	122	1	ltl	pending	\N	0	\N	pending	2023-11-17 07:41:27	2023-11-17 07:41:27	#TX-000320	no	\N	\N	0	\N	\N	\N	0	25.179631823378383	55.42361689867244	United Arab Emirates	\N	\N	25.179631823378383	55.42361689867244	United Arab Emirates	Dubai	\N		+1 1	0	0	0	0						0	0
324	1	Trade Centre	Building Materials Mall	134	1	ltl	pending	\N	0	\N	pending	2023-11-17 10:32:47	2023-11-17 10:32:47	#TX-000324	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
317	1	673C+W8M - Dubai - United Arab Emirates,	\N	157	4	\N	approved_by_admin	\N	0	\N	completed	2023-11-16 19:49:27	2023-11-16 19:57:16	#TX-000317	no	\N	0	0	3	3	\N	3	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	\N	\N	\N	\N	\N	+971 5858585858	\N	4	0	0	0						0	0
318	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	3	fcl	pending	\N	0	\N	pending	2023-11-16 23:08:56	2023-11-16 23:08:56	#TX-000318	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
259	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	approved_by_admin	\N	0	\N	completed	2023-11-15 13:30:36	2023-11-16 23:48:45	#TX-000259	no	\N	0	0	2	2	\N	2	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	4	0	0	0						0	0
326	1	673C+W8M - Dubai - United Arab Emirates,	23 35B Street - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	1	ltl	approved_by_admin	\N	0	\N	completed	2023-11-17 12:47:13	2023-11-17 12:52:25	#TX-000326	no	\N	0	0	22	22	\N	22	25.20485257399441	55.27078282088041	United Arab Emirates	\N	\N	25.12637277872611	55.242289043962955	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	4	0	0	0						0	0
323	1	Premier Inn Dubai Dragon Mart Hotel	Premier Inn Dubai Dragon Mart Hotel	122	1	ltl	approved_by_admin	\N	0	\N	qoutes_received	2023-11-17 10:24:47	2023-11-17 10:35:43	#TX-000323	no	\N	\N	0	\N	\N	\N	0	25.179631823378383	55.42361689867244	United Arab Emirates	\N	\N	25.179631823378383	55.42361689867244	United Arab Emirates	Dubai	\N		+1 1	1	0	0	0						0	0
322	1	673C+W8M - Dubai - United Arab Emirates,	23 35B Street - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	1	ltl	approved_by_admin	\N	0	\N	completed	2023-11-17 09:18:55	2023-11-17 09:52:47	#TX-000322	no	\N	0.55	0	1.55	1.55	\N	1	25.20485257399441	55.27078282088041	United Arab Emirates	\N	\N	25.12637277872611	55.242289043962955	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	4	0	0	0						0	0
321	1	Building Materials Mall	Trade Centre	122	1	ftl	driver_qouted	\N	0	\N	pending	2023-11-17 07:42:48	2023-11-17 09:21:03	#TX-000321	no	\N	\N	0	\N	\N	\N	0	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
325	1	Trade Centre	Building Materials Mall	122	1	ltl	ask_for_qoute	\N	0	\N	pending	2023-11-17 12:41:17	2023-11-17 12:43:59	#TX-000325	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
319	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	approved_by_admin	\N	0	\N	completed	2023-11-16 23:50:58	2023-11-18 14:38:55	#TX-000319	no	\N	0	0	23	23	\N	23	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	4	0	0	0						0	0
327	1	673C+W8M - Dubai - United Arab Emirates,	23 35B Street - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	1	ftl	approved_by_admin	\N	0	\N	completed	2023-11-17 13:04:23	2023-11-17 13:08:31	#TX-000327	no	\N	0	0	2	2	\N	2	25.20485257399441	55.27078282088041	United Arab Emirates	Dubai	\N	25.12637277872611	55.242289043962955	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	4	0	0	0						0	0
329	1	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	122	1	ftl	pending	\N	0	\N	pending	2023-11-17 13:19:39	2023-11-17 13:19:39	#TX-000329	no	\N	\N	0	\N	\N	\N	0	22.489857394916786	88.37032668292522	United Arab Emirates	Abu Dhabi	\N	22.4898580144717	88.3703253418207	United Arab Emirates	Dubai	\N	+971 996666966	+971 996666966	0	0	0	0						0	0
330	1	676C+GQC - 308th Rd - Al Satwa - Dubai - United Arab Emirates,	57H6+XJC - Dubai - United Arab Emirates,	164	1	ftl	approved_by_admin	\N	0	\N	completed	2023-11-17 13:27:57	2023-11-17 13:31:45	#TX-000330	no	\N	0	0	2	2	\N	2	25.21099262400571	55.272051841020584	United Arab Emirates	Dubai	\N	25.179631166298204	55.260821767151356	United Arab Emirates	Dubai	\N	+971 2222222222	+971 2222222222	4	0	0	0						0	0
328	1	673C+W8M - Dubai - United Arab Emirates,	23 35B Street - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	1	ltl	approved_by_admin	\N	0	\N	on_process	2023-11-17 13:11:22	2023-11-17 15:04:44	#TX-000328	yes	\N	3.3	9.3	9.3	9.3	\N	6	25.20485257399441	55.27078282088041	United Arab Emirates	\N	\N	25.12637277872611	55.242289043962955	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	2	0	0	0						0	0
331	1	79XM+M84 - Amman St - opposite of Carrefour Market - Al Qusais Industrial Area - Al Qusais Industrial Area 3 - Dubai - United Arab Emirates,	79PC+W2M - Al Nahda - Al Nahda 2 - Dubai - United Arab Emirates,	137	1	ftl	pending	\N	0	\N	pending	2023-11-17 13:56:24	2023-11-17 13:56:24	#TX-000331	no	\N	\N	0	\N	\N	\N	0	25.299383033068388	55.38365487009287	United Arab Emirates	Abu Dhabi	\N	25.287773935101477	55.37035413086414	United Arab Emirates	Dubai	\N	+971 46466494664	+971 46466494664	0	0	0	0						0	0
341	1	673C+W8M - Dubai - United Arab Emirates,	673C+W8M - Dubai - United Arab Emirates,	122	3	lcl	pending	\N	0	\N	pending	2023-11-17 15:43:41	2023-11-17 15:43:41	#TX-000341	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
336	1	79XM+M84 - Amman St - opposite of Carrefour Market - Al Qusais Industrial Area - Al Qusais Industrial Area 3 - Dubai - United Arab Emirates,	79PC+W2M - Al Nahda - Al Nahda 2 - Dubai - United Arab Emirates,	137	2		approved_by_admin	\N	0	\N	qoutes_received	2023-11-17 14:55:19	2023-11-17 15:24:20	#TX-000336	no	464363636	\N	0	\N	\N	1	0	25.299383033068388	55.38365487009287	United Arab Emirates	\N	\N	25.287773935101477	55.37035413086414	United Arab Emirates	Dubai	\N	+971 46466494664	+971 46466494664	0	0	0	0						0	0
332	1	G929+88J, Poddar Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	C/1B, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	145	2		approved_by_admin	\N	0	\N	completed	2023-11-17 14:09:30	2023-11-17 14:12:08	#TX-000332	no		0	0	11	11	1	11	22.500724271233974	88.36815275251865	United Arab Emirates	\N	\N	22.4893236473253	88.37173450738192	United Arab Emirates	Dubai	\N	+971 987466666	+971 987466666	2	0	0	0						0	0
333	1	Boulevard Plaza Tower1 - الخليج التجاري - دبي - United Arab Emirates,	Plot 365-161 - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	2		approved_by_admin	\N	0	\N	completed	2023-11-17 14:42:37	2023-11-17 14:48:27	#TX-000333	yes		\N	0	\N	\N	1	0	25.192103420296565	55.26691038161516	United Arab Emirates	\N	\N	25.12605556845681	55.245706513524055	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	0	0	0	0						0	0
338	1	Trade Centre	Trade Centre	122	3	fcl	pending	\N	0	\N	pending	2023-11-17 15:39:49	2023-11-17 15:39:49	#TX-000338	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	0	0	0						0	0
334	1	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	122	2	\N	pending	\N	0	\N	pending	2023-11-17 14:45:20	2023-11-17 14:46:46	#TX-000334	yes	\N	\N	0	\N	\N	\N	0	22.489857394916786	88.37032668292522	United Arab Emirates	\N	\N	22.4898580144717	88.3703253418207	United Arab Emirates	Dubai	\N	+971 996666966	+971 996666966	0	0	0	0						0	0
339	1	673C+W8M - Dubai - United Arab Emirates,	673C+W8M - Dubai - United Arab Emirates,	122	3	lcl	pending	\N	0	\N	pending	2023-11-17 15:42:35	2023-11-17 15:42:35	#TX-000339	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
335	1	Boulevard Plaza Tower1 - الخليج التجاري - دبي - United Arab Emirates,	Plot 365-161 - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	2		approved_by_admin	\N	0	\N	completed	2023-11-17 14:54:19	2023-11-17 15:04:12	#TX-000335	yes		0	5	5	5	1	5	25.192103420296565	55.26691038161516	United Arab Emirates	\N	\N	25.12605556845681	55.245706513524055	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	2	0	0	0						0	0
340	1	673C+W8M - Dubai - United Arab Emirates,	673C+W8M - Dubai - United Arab Emirates,	122	3	lcl	pending	\N	0	\N	pending	2023-11-17 15:42:58	2023-11-17 15:42:58	#TX-000340	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
342	1	673C+W8M - Dubai - United Arab Emirates,	673C+W8M - Dubai - United Arab Emirates,	122	3	lcl	pending	\N	0	\N	pending	2023-11-17 15:46:23	2023-11-17 15:46:23	#TX-000342	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
343	1	673C+W8M - Dubai - United Arab Emirates,	673C+W8M - Dubai - United Arab Emirates,	122	3	lcl	pending	\N	0	\N	pending	2023-11-17 15:48:00	2023-11-17 15:48:00	#TX-000343	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
344	1	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	122	2	\N	pending	\N	0	\N	pending	2023-11-17 16:03:16	2023-11-17 16:03:16	#TX-000344	no	\N	\N	0	\N	\N	\N	0	22.489857394916786	88.37032668292522	United Arab Emirates	\N	\N	22.4898580144717	88.3703253418207	United Arab Emirates	Dubai	\N	+971 996666966	+971 996666966	0	0	0	0						0	0
345	1	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	122	2	\N	pending	\N	0	\N	pending	2023-11-17 16:06:50	2023-11-17 16:06:50	#TX-000345	no	\N	\N	0	\N	\N	\N	0	22.489857394916786	88.37032668292522	United Arab Emirates	\N	\N	22.4898580144717	88.3703253418207	United Arab Emirates	Dubai	\N	+971 996666966	+971 996666966	0	0	0	0						0	0
346	1	Trade Centre	\N	122	4	\N	pending	\N	0	\N	pending	2023-11-17 16:08:23	2023-11-17 16:08:23	#TX-000346	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	\N	\N	\N	\N	\N		\N	0	0	0	0						0	0
347	1	Boulevard Plaza Tower1 - الخليج التجاري - دبي - United Arab Emirates,	Plot 365-161 - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	2		approved_by_admin	\N	0	\N	completed	2023-11-17 16:37:21	2023-11-17 16:39:20	#TX-000347	yes		0	0	2	2	1	2	25.192103420296565	55.26691038161516	United Arab Emirates	\N	\N	25.12605556845681	55.245706513524055	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	2	0	0	0						0	0
337	1	Trade Centre	Trade Centre	99	3	fcl	approved_by_admin	\N	0	\N	completed	2023-11-17 15:37:39	2023-11-18 15:04:48	#TX-000337	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	0	0	0						0	0
356	1	Boulevard Plaza Tower1 - الخليج التجاري - دبي - United Arab Emirates,	Plot 365-161 - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	2		approved_by_admin	\N	0	\N	completed	2023-11-17 18:01:45	2023-11-17 18:03:49	#TX-000356	no		0	0	5	5	1	5	25.192103420296565	55.26691038161516	United Arab Emirates	\N	\N	25.12605556845681	55.245706513524055	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	2	0	0	0						0	0
351	1	79XM+M84 - Amman St - opposite of Carrefour Market - Al Qusais Industrial Area - Al Qusais Industrial Area 3 - Dubai - United Arab Emirates,	79PC+W2M - Al Nahda - Al Nahda 2 - Dubai - United Arab Emirates,	137	2	\N	pending	\N	0	\N	pending	2023-11-17 17:27:10	2023-11-17 17:27:10	#TX-000351	no	\N	\N	0	\N	\N	\N	0	25.299383033068388	55.38365487009287	United Arab Emirates	\N	\N	25.287773935101477	55.37035413086414	United Arab Emirates	Dubai	\N	+971 46466494664	+971 46466494664	0	0	0	0						0	0
355	1	673C+W8M - Dubai - United Arab Emirates,	567R+8R4 - Al Quoz - Al Quoz 3 - Dubai - United Arab Emirates,	122	2		approved_by_admin	\N	0	\N	on_process	2023-11-17 17:50:07	2023-11-17 17:51:21	#TX-000355	no		0	0	100	100	1	100	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.1633635578166	55.24210296571255	United Arab Emirates	Dubai	\N	+971 1236547890	+91 8920524739	2	0	0	0						0	0
348	1	Boulevard Plaza Tower1 - الخليج التجاري - دبي - United Arab Emirates,	Plot 365-161 - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	2		approved_by_admin	\N	0	\N	completed	2023-11-17 16:55:50	2023-11-17 16:56:45	#TX-000348	yes		0	0	33	33	1	33	25.192103420296565	55.26691038161516	United Arab Emirates	\N	\N	25.12605556845681	55.245706513524055	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	2	0	0	0						0	0
350	1	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	122	2		approved_by_admin	\N	0	\N	on_process	2023-11-17 17:18:37	2023-11-17 17:31:20	#TX-000350	no		0	0	100	100	1	100	22.489857394916786	88.37032668292522	United Arab Emirates	\N	\N	22.4898580144717	88.3703253418207	United Arab Emirates	Dubai	\N	+971 996666966	+971 996666966	2	0	0	0						0	0
352	1	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	122	2	\N	pending	\N	0	\N	pending	2023-11-17 17:36:57	2023-11-17 17:36:57	#TX-000352	no	\N	\N	0	\N	\N	\N	0	22.489857394916786	88.37032668292522	United Arab Emirates	\N	\N	22.4898580144717	88.3703253418207	United Arab Emirates	Dubai	\N	+971 996666966	+971 996666966	0	0	0	0						0	0
349	1	Boulevard Plaza Tower1 - الخليج التجاري - دبي - United Arab Emirates,	Plot 365-161 - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	2		approved_by_admin	\N	0	\N	on_process	2023-11-17 16:58:57	2023-11-17 16:59:57	#TX-000349	no		0	0	120	120	1	120	25.192103420296565	55.26691038161516	United Arab Emirates	\N	\N	25.12605556845681	55.245706513524055	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	2	0	0	0						0	0
353	1	Boulevard Plaza Tower1 - الخليج التجاري - دبي - United Arab Emirates,	Plot 365-161 - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	2		approved_by_admin	\N	0	\N	completed	2023-11-17 17:38:13	2023-11-17 17:39:59	#TX-000353	yes		\N	0	\N	\N	1	0	25.192103420296565	55.26691038161516	United Arab Emirates	\N	\N	25.12605556845681	55.245706513524055	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	0	0	0	0						0	0
354	1	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	122	2	\N	pending	\N	0	\N	pending	2023-11-17 17:40:16	2023-11-17 17:40:16	#TX-000354	no	\N	\N	0	\N	\N	\N	0	22.489857394916786	88.37032668292522	United Arab Emirates	\N	\N	22.4898580144717	88.3703253418207	United Arab Emirates	Dubai	\N	+971 996666966	+971 996666966	0	0	0	0						0	0
361	1	673C+W8M - Dubai - United Arab Emirates,	567R+8R4 - Al Quoz - Al Quoz 3 - Dubai - United Arab Emirates,	122	2	\N	pending	\N	0	\N	pending	2023-11-18 08:33:49	2023-11-18 08:33:49	#TX-000361	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.1633635578166	55.24210296571255	United Arab Emirates	Dubai	\N	+971 1236547890	+91 8920524739	0	0	0	0						0	0
358	1	Boulevard Plaza Tower1 - الخليج التجاري - دبي - United Arab Emirates,	Plot 365-161 - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	1	ltl	approved_by_admin	\N	0	\N	completed	2023-11-17 18:16:24	2023-11-17 18:18:46	#TX-000358	no	\N	0	0	3	3	\N	3	25.192103420296565	55.26691038161516	United Arab Emirates	\N	\N	25.12605556845681	55.245706513524055	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	4	0	0	0						0	0
360	1	Boulevard Plaza Tower1 - الخليج التجاري - دبي - United Arab Emirates,	\N	157	4	\N	approved_by_admin	\N	0	\N	completed	2023-11-17 19:10:53	2023-11-17 19:13:00	#TX-000360	no	\N	0.64	0	8.64	8.64	\N	8	25.192103420296565	55.26691038161516	United Arab Emirates	Dubai	\N	\N	\N	\N	\N	\N	+971 5858585858	\N	4	0	0	0						0	0
357	1	Boulevard Plaza Tower1 - الخليج التجاري - دبي - United Arab Emirates,	Plot 365-161 - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	1	ltl	approved_by_admin	\N	0	\N	completed	2023-11-17 18:11:01	2023-11-17 18:14:07	#TX-000357	no	\N	0	0	6	6	\N	6	25.192103420296565	55.26691038161516	United Arab Emirates	\N	\N	25.12605556845681	55.245706513524055	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	4	0	0	0						0	0
359	1	Boulevard Plaza Tower1 - الخليج التجاري - دبي - United Arab Emirates,	Plot 365-161 - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	1	ftl	approved_by_admin	\N	0	\N	completed	2023-11-17 18:20:59	2023-11-17 18:22:50	#TX-000359	no	\N	0	0	2	2	\N	2	25.192103420296565	55.26691038161516	United Arab Emirates	Dubai	\N	25.12605556845681	55.245706513524055	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	4	0	0	0						0	0
362	1	673C+W8M - Dubai - United Arab Emirates,	567R+8R4 - Al Quoz - Al Quoz 3 - Dubai - United Arab Emirates,	122	2	\N	approved_by_admin	\N	0	\N	on_process	2023-11-18 08:45:25	2023-11-18 15:04:15	#TX-000362	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.1633635578166	55.24210296571255	United Arab Emirates	Dubai	\N	+971 1236547890	+91 8920524739	0	0	0	0						0	0
363	1	Trade Centre	Building Materials Mall	122	1	ltl	pending	\N	0	\N	pending	2023-11-18 08:54:00	2023-11-18 08:54:00	#TX-000363	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
365	1	EP-38, Regent Estate Rd, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	250, Sarat Park, Rajdanga, Kasba, Kolkata, West Bengal 700107, India,	169	1	ftl	pending	\N	0	\N	pending	2023-11-18 11:31:28	2023-11-18 11:31:28	#TX-000365	no	\N	\N	0	\N	\N	\N	0	22.48982239005947	88.37020866572857	United Arab Emirates	Abu Dhabi	\N	22.513598251041575	88.39078087359667	India	Kolkata	\N	+971 988559969	+971 988559969	0	0	0	0						0	0
366	1	EP-38, Regent Estate Rd, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	250, Sarat Park, Rajdanga, Kasba, Kolkata, West Bengal 700107, India,	169	1	ftl	pending	\N	0	\N	pending	2023-11-18 11:33:08	2023-11-18 11:33:08	#TX-000366	no	\N	\N	0	\N	\N	\N	0	22.48982239005947	88.37020866572857	United Arab Emirates	Abu Dhabi	\N	22.513598251041575	88.39078087359667	India	Kolkata	\N	+971 988559969	+971 988559969	0	0	0	0						0	0
368	1	EP-38, Regent Estate Rd, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	250, Sarat Park, Rajdanga, Kasba, Kolkata, West Bengal 700107, India,	169	1	ftl	pending	\N	0	\N	pending	2023-11-18 13:46:49	2023-11-18 13:46:49	#TX-000368	no	\N	\N	0	\N	\N	\N	0	22.48982239005947	88.37020866572857	United Arab Emirates	Abu Dhabi	\N	22.513598251041575	88.39078087359667	India	Kolkata	\N	+971 988559969	+971 988559969	0	0	0	0						0	0
374	1	EP-38, Regent Estate Rd, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	250, Sarat Park, Rajdanga, Kasba, Kolkata, West Bengal 700107, India,	169	1	ftl	approved_by_admin	\N	0	\N	completed	2023-11-18 15:45:45	2023-11-18 16:05:29	#TX-000374	no	\N	1000	0	11000	11000	\N	10000	22.48982239005947	88.37020866572857	United Arab Emirates	Abu Dhabi	\N	22.513598251041575	88.39078087359667	India	Delhi	\N	+971 988559969	+971 988559969	4	0	0	0						0	0
378	1	EP-38, Regent Estate Rd, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	250, Sarat Park, Rajdanga, Kasba, Kolkata, West Bengal 700107, India,	169	2		approved_by_admin	\N	0	\N	completed	2023-11-18 16:34:06	2023-11-18 16:46:56	#TX-000378	no	#IN7686868	0	30000	255000	255000	1	255000	22.48982239005947	88.37020866572857	United Arab Emirates	\N	\N	22.513598251041575	88.39078087359667	India	Delhi	\N	+971 988559969	+971 988559969	2	0	0	0						0	0
367	1	EP-38, Regent Estate Rd, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	250, Sarat Park, Rajdanga, Kasba, Kolkata, West Bengal 700107, India,	169	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-11-18 13:46:02	2023-11-18 14:15:05	#TX-000367	no	#IN7686868	250	0	2750	2750	1	2500	22.48982239005947	88.37020866572857	United Arab Emirates	Abu Dhabi	\N	22.513598251041575	88.39078087359667	India	Kolkata	\N	+971 988559969	+971 988559969	2	0	0	0						0	0
369	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	pending	\N	0	\N	pending	2023-11-18 14:23:44	2023-11-18 14:23:44	#TX-000369	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
370	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	3	fcl	pending	\N	0	\N	pending	2023-11-18 14:29:39	2023-11-18 14:29:39	#TX-000370	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
364	1	EP-38, Regent Estate Rd, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	250, Sarat Park, Rajdanga, Kasba, Kolkata, West Bengal 700107, India,	169	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-11-18 11:31:25	2023-11-18 14:48:11	#TX-000364	no	\N	\N	0	\N	\N	\N	0	22.48982239005947	88.37020866572857	United Arab Emirates	Abu Dhabi	\N	22.513598251041575	88.39078087359667	India	Kolkata	\N	+971 988559969	+971 988559969	0	0	0	0						0	0
371	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	approved_by_admin	\N	0	\N	qoutes_received	2023-11-18 14:46:57	2023-11-18 15:36:32	#TX-000371	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	1	0	0	0						0	0
373	1	Boulevard Plaza Tower1 - الخليج التجاري - دبي - United Arab Emirates,	Plot 365-161 - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	3	fcl	pending	\N	0	\N	pending	2023-11-18 15:37:36	2023-11-18 15:37:36	#TX-000373	no	\N	\N	0	\N	\N	\N	0	25.192103420296565	55.26691038161516	United Arab Emirates	Dubai	\N	25.12605556845681	55.245706513524055	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	0	0	0	0						0	0
376	1	EP-38, Regent Estate Rd, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	250, Sarat Park, Rajdanga, Kasba, Kolkata, West Bengal 700107, India,	169	1	ftl	driver_qouted	\N	0	\N	pending	2023-11-18 16:01:53	2023-11-18 16:02:10	#TX-000376	no	\N	\N	0	\N	\N	\N	0	22.48982239005947	88.37020866572857	United Arab Emirates	Abu Dhabi	\N	22.513598251041575	88.39078087359667	India	Delhi	\N	+971 988559969	+971 988559969	0	0	0	0						0	0
375	1	673C+W8M - Dubai - United Arab Emirates,	567R+8R4 - Al Quoz - Al Quoz 3 - Dubai - United Arab Emirates,	73	2		approved_by_admin	\N	0	\N	on_process	2023-11-18 15:51:19	2023-11-18 15:52:42	#TX-000375	no	12121212	0	0	0	0	1	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.1633635578166	55.24210296571255	United Arab Emirates	Dubai	\N	+971 1236547890	+91 8920524739	2	0	0	0						0	0
379	1	Boulevard Plaza Tower1 - الخليج التجاري - دبي - United Arab Emirates,	Plot 365-161 - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	1	ftl	driver_qouted	\N	0	\N	pending	2023-11-18 16:34:18	2023-11-18 21:41:01	#TX-000379	no	\N	\N	0	\N	\N	\N	0	25.192103420296565	55.26691038161516	United Arab Emirates	Dubai	\N	25.12605556845681	55.245706513524055	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	0	0	0	0						0	0
372	1	250, Sarat Park, Rajdanga, Kasba, Kolkata, West Bengal 700107, India,	EP-38, Regent Estate Rd, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	169	1	ltl	approved_by_admin	\N	0	\N	completed	2023-11-18 15:22:18	2023-11-18 16:36:22	#TX-000372	no	#IN7686868	2500	0	27500	27500	1	25000	22.513598251041575	88.39078087359667	India	\N	\N	22.48982239005947	88.37020866572857	United Arab Emirates	Abu Dhabi	\N	+971 988559969	+971 988559969	4	0	0	0						0	0
380	0			169	4		pending	\N	0	\N	pending	2023-11-18 16:50:22	2023-11-18 16:53:15	#TX-000380	no	#IN7686868	\N	0	\N	\N	1	0					\N	\N	\N	\N	\N	\N		\N	0	0	0	0						0	0
384	1	EP-38, Regent Estate Rd, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	250, Sarat Park, Rajdanga, Kasba, Kolkata, West Bengal 700107, India,	169	3	lcl	approved_by_admin	\N	0	\N	completed	2023-11-18 17:40:44	2023-11-18 17:44:49	#TX-000384	no	#IN7686868	0	0	1000	1000	1	1000	22.48982239005947	88.37020866572857	United Arab Emirates	\N	\N	22.513598251041575	88.39078087359667	India	Delhi	\N	+971 988559969	+971 988559969	2	0	0	0						0	0
382	1	EP-38, Regent Estate Rd, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,		169	4		approved_by_admin	\N	0	\N	completed	2023-11-18 17:22:55	2023-11-18 17:36:05	#TX-000382	no	#IN7686868	200	2000	2200	2200	1	2000	22.48982239005947	88.37020866572857	United Arab Emirates	Abu Dhabi	\N	\N	\N	\N	\N	\N	+971 988559969	\N	4	0	0	0						0	0
385	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	3	lcl	pending	\N	0	\N	pending	2023-11-18 17:54:04	2023-11-18 17:54:04	#TX-000385	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
377	1	EP-38, Regent Estate Rd, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	250, Sarat Park, Rajdanga, Kasba, Kolkata, West Bengal 700107, India,	169	1	ltl	approved_by_admin	\N	0	\N	completed	2023-11-18 16:03:05	2023-11-18 19:16:55	#TX-000377	yes	\N	0	0	1000	1000	\N	1000	22.48982239005947	88.37020866572857	United Arab Emirates	\N	\N	22.513598251041575	88.39078087359667	India	Delhi	\N	+971 988559969	+971 988559969	4	0	0	0						0	0
381	1	EP-38, Regent Estate Rd, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,		169	4		approved_by_admin	\N	0	\N	on_process	2023-11-18 17:05:19	2023-11-18 17:17:50	#TX-000381	no	#IN7686868	1000	0	11000	11000	1	10000	22.48982239005947	88.37020866572857	United Arab Emirates	Abu Dhabi	\N	\N	\N	\N	\N	\N	+971 988559969	\N	2	0	0	0						0	0
383	1	EP-38, Regent Estate Rd, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	250, Sarat Park, Rajdanga, Kasba, Kolkata, West Bengal 700107, India,	169	3	fcl	approved_by_admin	\N	0	\N	completed	2023-11-18 17:35:03	2023-11-18 17:38:46	#TX-000383	no	#IN7686868	0	0	10000	10000	1	10000	22.48982239005947	88.37020866572857	United Arab Emirates	Abu Dhabi	\N	22.513598251041575	88.39078087359667	India	Delhi	\N	+971 988559969	+971 988559969	2	0	0	0						0	0
388	1	111, Bijoygarh, Regent Estate, Kolkata, West Bengal 700092, India,	Netaji Subhash Chandra Bose International Airport (CCU), Jessore Rd, Dum Dum, Kolkata, West Bengal 700052, India,	178	1	ftl	approved_by_admin	\N	0	\N	completed	2023-11-19 10:25:37	2023-11-19 10:33:31	#TX-000388	yes	#IN7686868	500	2000	5500	5500	1	5000	22.48542069103458	88.36866404861212	India	Kolkata	\N	22.653363897366845	88.44674952328205	India	Kolkata	\N	+91 9875599669	+91 9875599669	4	0	0	0						0	0
387	1	111, Bijoygarh, Regent Estate, Kolkata, West Bengal 700092, India,	Netaji Subhash Chandra Bose International Airport (CCU), Jessore Rd, Dum Dum, Kolkata, West Bengal 700052, India,	178	1	ftl	approved_by_admin	\N	0	\N	completed	2023-11-19 10:04:42	2023-11-19 10:14:14	#TX-000387	yes	#IN7686868	500	2000	5500	5500	1	5000	22.48542069103458	88.36866404861212	India	Kolkata	\N	22.653363897366845	88.44674952328205	India	Kolkata	\N	+91 9875599669	+91 9875599669	4	0	0	0						0	0
389	1	111, Bijoygarh, Regent Estate, Kolkata, West Bengal 700092, India,	Netaji Subhash Chandra Bose International Airport (CCU), Jessore Rd, Dum Dum, Kolkata, West Bengal 700052, India,	178	1	ltl	approved_by_admin	\N	0	\N	completed	2023-11-19 10:44:41	2023-11-19 10:52:41	#TX-000389	yes	#IN7686868	1000	300	6000	6000	1	5000	22.48542069103458	88.36866404861212	India	\N	\N	22.653363897366845	88.44674952328205	India	Kolkata	\N	+91 9875599669	+91 9875599669	4	0	0	0						0	0
392	1	111, Bijoygarh, Regent Estate, Kolkata, West Bengal 700092, India,	Netaji Subhash Chandra Bose International Airport (CCU), Jessore Rd, Dum Dum, Kolkata, West Bengal 700052, India,	178	3	lcl	approved_by_admin	\N	0	\N	completed	2023-11-19 11:36:26	2023-11-19 11:37:42	#TX-000392	no	#IN7686868	0	600	5000	5000	1	5000	22.48542069103458	88.36866404861212	India	\N	\N	22.653363897366845	88.44674952328205	India	Kolkata	\N	+91 9875599669	+91 9875599669	2	0	0	0						0	0
391	1	111, Bijoygarh, Regent Estate, Kolkata, West Bengal 700092, India,	Netaji Subhash Chandra Bose International Airport (CCU), Jessore Rd, Dum Dum, Kolkata, West Bengal 700052, India,	178	3	fcl	approved_by_admin	\N	0	\N	completed	2023-11-19 11:32:24	2023-11-19 11:34:55	#TX-000391	yes	#IN7686868	0	0	1000	1000	1	1000	22.48542069103458	88.36866404861212	India	Kolkata	\N	22.653363897366845	88.44674952328205	India	Kolkata	\N	+91 9875599669	+91 9875599669	2	0	0	0						0	0
386	1	H83X+RW2, Jawaharlal Nehru Rd, Maidan, Kolkata, West Bengal 700071, India,		176	4		approved_by_admin	\N	0	\N	completed	2023-11-19 09:11:02	2023-11-19 09:18:06	#TX-000386	no	#IN7686868	5800	0	63800	63800	1	58000	22.554515751347292	88.34976553916931	India	Kolkata	\N	\N	\N	\N	\N	\N	+91 984456666	\N	4	0	0	0						0	0
390	1	111, Bijoygarh, Regent Estate, Kolkata, West Bengal 700092, India,	Netaji Subhash Chandra Bose International Airport (CCU), Jessore Rd, Dum Dum, Kolkata, West Bengal 700052, India,	178	2		approved_by_admin	\N	0	\N	completed	2023-11-19 11:19:15	2023-11-19 11:23:14	#TX-000390	yes	#IN7686868	0	3000	5000	5000	1	5000	22.48542069103458	88.36866404861212	India	\N	\N	22.653363897366845	88.44674952328205	India	Kolkata	\N	+91 9875599669	+91 9875599669	2	0	0	0						0	0
394	1	Netaji Subhash Chandra Bose International Airport (CCU), Jessore Rd, Dum Dum, Kolkata, West Bengal 700052, India,		178	4		approved_by_admin	\N	0	\N	on_process	2023-11-20 08:22:21	2023-11-20 10:42:34	#TX-000394	no	#IN7686868	500	0	5500	5500	1	5000	22.653363897366845	88.44674952328205	India	Kolkata	\N	\N	\N	\N	\N	\N	+91 9875599669	\N	2	0	0	0	2233ddf	655affda8492b_1700462554.PNG	2023-11-22	2023-11-23	weqeqweqw	0	0
393	0			178	4		approved_by_admin	\N	0	\N	completed	2023-11-19 21:52:53	2023-11-20 01:31:14	#TX-000393	no		10	0	110	110	1	100					\N	\N	\N	\N	\N	\N		\N	2	0	0	0						0	0
395	1	111, Bijoygarh, Regent Estate, Kolkata, West Bengal 700092, India,	Netaji Subhash Chandra Bose International Airport (CCU), Jessore Rd, Dum Dum, Kolkata, West Bengal 700052, India,	178	3	fcl	pending	\N	0	\N	pending	2023-11-20 08:53:48	2023-11-20 08:53:48	#TX-000395	no	\N	\N	0	\N	\N	\N	0	22.48542069103458	88.36866404861212	India	Kolkata	\N	22.653363897366845	88.44674952328205	India	Kolkata	\N	+91 9875599669	+91 9875599669	0	0	0	0						0	0
396	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	3	fcl	pending	\N	0	\N	pending	2023-11-20 09:09:09	2023-11-20 09:09:09	#TX-000396	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
406	1	111, Bijoygarh, Regent Estate, Kolkata, West Bengal 700092, India,	Netaji Subhash Chandra Bose International Airport (CCU), Jessore Rd, Dum Dum, Kolkata, West Bengal 700052, India,	178	1	ftl	approved_by_admin	\N	0	\N	completed	2023-11-20 15:18:45	2023-11-20 15:21:34	#TX-000406	yes	#IN7686868	1500	0	6500	6500	1	5000	22.48542069103458	88.36866404861212	India	Kolkata	\N	22.653363897366845	88.44674952328205	India	Kolkata	\N	+91 9875599669	+91 9875599669	4	0	0	0						0	0
398	1	Boulevard Plaza Tower1 - الخليج التجاري - دبي - United Arab Emirates,	Plot 365-161 - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	1	ftl	pending	\N	0	\N	pending	2023-11-20 10:54:01	2023-11-20 10:54:01	#TX-000398	no	\N	\N	0	\N	\N	\N	0	25.192103420296565	55.26691038161516	United Arab Emirates	Dubai	\N	25.12605556845681	55.245706513524055	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	0	0	0	0						0	0
402	1	Netaji Subhash Chandra Bose International Airport (CCU), Jessore Rd, Dum Dum, Kolkata, West Bengal 700052, India,		178	4		approved_by_admin	\N	0	\N	completed	2023-11-20 14:09:22	2023-11-20 14:18:30	#TX-000402	yes	#IN7686868	250	200	1250	1250	1	1000	22.653363897366845	88.44674952328205	India	Kolkata	\N	\N	\N	\N	\N	\N	+91 9875599669	\N	2	0	0	0	XD34534	655b318cd1abf_1700475276.jpg	2023-11-20	2023-12-31	Now you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved.	0	0
404	1	111, Bijoygarh, Regent Estate, Kolkata, West Bengal 700092, India,	Netaji Subhash Chandra Bose International Airport (CCU), Jessore Rd, Dum Dum, Kolkata, West Bengal 700052, India,	178	2		approved_by_admin	\N	0	\N	delivery_completed	2023-11-20 14:48:38	2023-11-20 14:52:14	#TX-000404	yes	#IN7686868	100	0	1100	1100	1	1000	22.48542069103458	88.36866404861212	India	\N	\N	22.653363897366845	88.44674952328205	India	Kolkata	\N	+91 9875599669	+91 9875599669	2	0	0	0						0	0
405	1	111, Bijoygarh, Regent Estate, Kolkata, West Bengal 700092, India,	Netaji Subhash Chandra Bose International Airport (CCU), Jessore Rd, Dum Dum, Kolkata, West Bengal 700052, India,	178	3	fcl	approved_by_admin	\N	0	\N	delivery_completed	2023-11-20 14:53:13	2023-11-20 14:55:26	#TX-000405	yes	#IN7686868	100	0	1100	1100	1	1000	22.48542069103458	88.36866404861212	India	Kolkata	\N	22.653363897366845	88.44674952328205	India	Kolkata	\N	+91 9875599669	+91 9875599669	2	0	0	0						0	0
401	1	Netaji Subhash Chandra Bose International Airport (CCU), Jessore Rd, Dum Dum, Kolkata, West Bengal 700052, India,		178	4		approved_by_admin	\N	0	\N	items_received_in_warehouse	2023-11-20 12:39:45	2023-11-20 12:48:24	#TX-000401	no	#IN7686868	250	1000	1250	1250	1	1000	22.653363897366845	88.44674952328205	India	Kolkata	\N	\N	\N	\N	\N	\N	+91 9875599669	\N	2	0	0	0	34534	655b1d5881994_1700470104.jpeg	2023-11-20	2023-11-30	instruction text...	0	0
408	1	G9QH+852, Gobra, Kolkata, West Bengal 700046, India,	9/27, Jadavpur, Kolkata, West Bengal 700032, India,	184	1	ftl	approved_by_admin	\N	0	\N	completed	2023-11-21 09:37:50	2023-11-21 10:22:40	#TX-000408	yes	#IN76868677	500	0	5500	5500	1	5000	22.537531052096753	88.37775975465775	India	Kolkata	\N	22.49309360219301	88.36503267288208	India	Kolkata	\N	+971 987789969	+971 987789969	4	0	0	0						0	0
397	1	111, Bijoygarh, Regent Estate, Kolkata, West Bengal 700092, India,	Netaji Subhash Chandra Bose International Airport (CCU), Jessore Rd, Dum Dum, Kolkata, West Bengal 700052, India,	178	3	fcl	approved_by_admin	\N	0	\N	on_process	2023-11-20 09:26:16	2023-11-20 13:46:49	#TX-000397	no	\N	\N	0	\N	\N	\N	0	22.48542069103458	88.36866404861212	India	Kolkata	\N	22.653363897366845	88.44674952328205	India	Kolkata	\N	+91 9875599669	+91 9875599669	0	0	0	0						0	0
400	1	Netaji Subhash Chandra Bose International Airport (CCU), Jessore Rd, Dum Dum, Kolkata, West Bengal 700052, India,		178	4		approved_by_admin	\N	0	\N	on_process	2023-11-20 12:23:42	2023-11-20 12:35:29	#TX-000400	no	#IN7686868	200	0	1200	1200	1	1000	22.653363897366845	88.44674952328205	India	Kolkata	\N	\N	\N	\N	\N	\N	+91 9875599669	\N	2	0	0	0	\N		\N	\N	\N	0	0
399	1	111, Bijoygarh, Regent Estate, Kolkata, West Bengal 700092, India,		178	4		approved_by_admin	\N	0	\N	items_received_in_warehouse	2023-11-20 11:58:35	2023-11-20 12:39:06	#TX-000399	no	#IN7686868	100	0	1100	1100	1	1000	22.48542069103458	88.36866404861212	India	Kolkata	\N	\N	\N	\N	\N	\N	+91 9875599669	\N	2	0	0	0	\N	655b143bc78ec_1700467771.PNG	\N	\N	\N	0	0
403	0			178	4		approved_by_admin	\N	0	\N	items_received_in_warehouse	2023-11-20 14:16:59	2023-11-20 14:22:17	#TX-000403	no	#IN7686868	200	0	2200	2200	1	2000					\N	\N	\N	\N	\N	\N		\N	2	0	0	0	\N		\N	\N	\N	0	0
407	1	111, Bijoygarh, Regent Estate, Kolkata, West Bengal 700092, India,	Netaji Subhash Chandra Bose International Airport (CCU), Jessore Rd, Dum Dum, Kolkata, West Bengal 700052, India,	178	2		approved_by_admin	\N	0	\N	delivery_completed	2023-11-20 15:25:09	2023-11-20 15:26:51	#TX-000407	yes	#IN7686868	250	0	1250	1250	1	1000	22.48542069103458	88.36866404861212	India	\N	\N	22.653363897366845	88.44674952328205	India	Kolkata	\N	+91 9875599669	+91 9875599669	2	0	0	0						0	0
409	1	G9QH+852, Gobra, Kolkata, West Bengal 700046, India,	9/27, Jadavpur, Kolkata, West Bengal 700032, India,	184	1	ltl	approved_by_admin	\N	0	\N	on_process	2023-11-21 10:29:01	2023-11-30 08:25:33	#TX-000409	no	#IN76868683434	0	0	5000	5000	1	5000	22.537531052096753	88.37775975465775	India	\N	\N	22.49309360219301	88.36503267288208	India	Kolkata	\N	+971 987789969	+971 987789969	2	0	0	0						0	0
410	1	G9QH+852, Gobra, Kolkata, West Bengal 700046, India,	9/27, Jadavpur, Kolkata, West Bengal 700032, India,	184	2		approved_by_admin	\N	0	\N	delivery_completed	2023-11-21 10:50:54	2023-11-21 10:57:55	#TX-000410	yes	#IN7686868435	500	0	5500	5500	1	5000	22.537531052096753	88.37775975465775	India	\N	\N	22.49309360219301	88.36503267288208	India	Kolkata	\N	+971 987789969	+971 987789969	2	0	0	0						0	0
472	1	21/1A, East Rd, Bidhanpally, Jadavpur, Kolkata, West Bengal 700032, India,	Unnamed Road, Rajasthan 305814, India,	193	1	ftl	driver_qouted	\N	0	\N	pending	2024-06-07 12:02:54	2024-06-07 12:03:27	#TX-000472	no	\N	\N	0	\N	\N	\N	0	22.495265693890627	88.36663596332073	India	Kolkata	\N	26.836980190396655	74.8835326731205	India	Delhi	\N	+91 932274136	+91 932274136	0	0	0	0						0	0
411	1	G9QH+852, Gobra, Kolkata, West Bengal 700046, India,	9/27, Jadavpur, Kolkata, West Bengal 700032, India,	184	3	fcl	approved_by_admin	\N	0	\N	delivery_completed	2023-11-21 11:02:09	2023-11-21 11:06:35	#TX-000411	yes	#IN768686843554	500	0	10500	10500	1	10000	22.537531052096753	88.37775975465775	India	Kolkata	\N	22.49309360219301	88.36503267288208	India	Kolkata	\N	+971 987789969	+971 987789969	2	0	0	0						0	0
416	1	Trade Centre	Building Materials Mall	74	1	ltl	pending	\N	0	\N	pending	2023-11-30 11:23:27	2023-11-30 11:23:27	#TX-000416	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
417	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ltl	pending	\N	0	\N	pending	2023-11-30 11:46:22	2023-11-30 11:46:22	#TX-000417	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
106	1	25W4+V62 - Jumeirah Park - Dubai - United Arab Emirates,	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	85	1	ftl	approved_by_admin	\N	0	\N	completed	2023-10-20 15:42:41	2023-12-01 12:11:08	#TX-000106	yes	\N	159.95	1513	1442.95	1442.95	\N	1283	25.047127821877247	55.15551958233118	United Arab Emirates	Dubai	\N	25.184237262438835	55.259992964565754	United Arab Emirates	Dubai	\N	+971 552125893	+971 552125893	4	0	0	0						0	0
418	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-12-01 14:40:18	2023-12-01 14:58:26	#TX-000418	no		0	1	2	2	1	2	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	2	0	0	0						0	0
419	1	Trade Centre	Building Materials Mall	90	2	\N	pending	\N	0	\N	pending	2023-12-01 16:14:09	2023-12-01 16:14:09	#TX-000419	no	\N	\N	0	\N	\N	1	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	1
420	1	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	\N	172	4	\N	pending	\N	0	\N	pending	2023-12-02 00:00:21	2023-12-02 00:00:21	#TX-000420	no	\N	\N	0	\N	\N	\N	0	33.56680144111565	73.13681613653898	United Arab Emirates	Dubai	\N	\N	\N	\N	\N	\N	+971 369085264644	\N	0	0	0	0			2023-12-02	2023-12-05		0	0
413	1	G9QH+852, Gobra, Kolkata, West Bengal 700046, India,		184	4		approved_by_admin	\N	0	\N	delivery_completed	2023-11-21 11:19:38	2023-11-21 17:30:44	#TX-000413	yes	#IN768686823423	0	0	5000	5000	1	5000	22.537531052096753	88.37775975465775	India	Kolkata	\N	\N	\N	\N	\N	\N	+971 987789969	\N	2	0	0	0	XD3453444	655c5ac352b4e_1700551363.jpeg	2023-11-21	2023-12-31	Demo note tr fdsf	0	0
412	1	G9QH+852, Gobra, Kolkata, West Bengal 700046, India,	9/27, Jadavpur, Kolkata, West Bengal 700032, India,	184	3	lcl	approved_by_admin	\N	0	\N	delivery_completed	2023-11-21 11:10:51	2023-11-21 11:14:46	#TX-000412	yes	#IN76868685565	500	0	10500	10500	1	10000	22.537531052096753	88.37775975465775	India	\N	\N	22.49309360219301	88.36503267288208	India	Kolkata	\N	+971 987789969	+971 987789969	2	0	0	0						0	0
414	1	Trade Centre	Building Materials Mall	74	1	ltl	pending	\N	0	\N	pending	2023-11-29 16:30:18	2023-11-29 16:31:11	#TX-000414	no		\N	0	\N	\N	1	0	25.224144623109982	55.284972986352955	United Arab Emirates	\N	\N	25.16533880130602	55.46189738501064	United Arab Emirates	Dubai	\N			0	0	0	0						0	0
415	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	1	ltl	pending	\N	0	\N	pending	2023-11-30 10:16:14	2023-11-30 10:16:14	#TX-000415	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	0
423	1	673C+W8M - Dubai - United Arab Emirates,	673C+W8M - Dubai - United Arab Emirates,	90	3	lcl	pending	\N	0	\N	pending	2023-12-02 08:32:47	2023-12-02 08:32:47	#TX-000423	no	\N	\N	0	\N	\N	2	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	2
421	1	Trade Centre	\N	90	4	\N	pending	\N	0	\N	pending	2023-12-02 08:14:48	2023-12-02 08:14:48	#TX-000421	no	\N	\N	0	\N	\N	\N	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	\N	\N	\N	\N	\N		\N	0	0	0	0			2023-12-10	2023-12-15		0	0
422	1	Trade Centre	Trade Centre	90	3	fcl	pending	\N	0	\N	pending	2023-12-02 08:32:24	2023-12-02 08:32:24	#TX-000422	no	\N	\N	0	\N	\N	1	0	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	25.224144623109982	55.284972986352955	United Arab Emirates	Dubai	\N	+971 8277272939393939	+971 8277272939393939	0	0	0	0						0	1
424	1	673C+W8M - Dubai - United Arab Emirates,	\N	73	4	\N	pending	\N	0	\N	pending	2023-12-02 09:59:24	2023-12-02 09:59:24	#TX-000424	no	\N	\N	0	\N	\N	\N	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	\N	\N	\N	\N	\N	+971 090078601	\N	0	0	0	0			2023-12-02	2023-12-06		0	0
425	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	2		approved_by_admin	\N	0	\N	qoutes_received	2023-12-02 10:21:39	2023-12-02 11:34:47	#TX-000425	no		0	0	\N	\N	3	0	25.204851967284775	55.27078282088041	United Arab Emirates	\N	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	3
426	1	Boulevard Plaza Tower1 - الخليج التجاري - دبي - United Arab Emirates,	Plot 365-161 - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	1	ftl	pending	\N	0	\N	pending	2023-12-02 10:48:59	2023-12-02 10:48:59	#TX-000426	no	\N	\N	0	\N	\N	\N	0	25.192103420296565	55.26691038161516	United Arab Emirates	Dubai	\N	25.12605556845681	55.245706513524055	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	0	0	0	0						0	0
427	1	673C+W8M - Dubai - United Arab Emirates,	Unnamed Road - Downtown Dubai - Dubai - United Arab Emirates,	73	3	fcl	pending	\N	0	\N	pending	2023-12-02 10:53:36	2023-12-02 10:53:36	#TX-000427	no	\N	\N	0	\N	\N	4	0	25.204851967284775	55.27078282088041	United Arab Emirates	Dubai	\N	25.194987682373487	55.27841404080391	United Arab Emirates	Dubai	\N	+971 090078601	+971 090078601	0	0	0	0						0	4
434	1	Boulevard Plaza Tower1 - الخليج التجاري - دبي - United Arab Emirates,	Plot 365-161 - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	1	ftl	pending	\N	0	\N	pending	2023-12-02 12:59:40	2023-12-02 12:59:40	#TX-000434	no	\N	\N	0	\N	\N	\N	0	25.192103420296565	55.26691038161516	United Arab Emirates	Dubai	\N	25.12605556845681	55.245706513524055	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	0	0	0	0						0	0
442	1	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	7-I, Katju Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	187	1	ftl	approved_by_admin	\N	0	\N	qoutes_received	2023-12-05 09:33:59	2023-12-05 09:37:02	#TX-000442	no	#IN768686843554	\N	0	\N	\N	1	0	28.70405920384049	77.10249032825232	India	Delhi	\N	22.49761772221553	88.36843002587557	India	Kolkata	\N	+971 987459971	+971 987459971	1	0	0	0						1	0
428	1	Boulevard Plaza Tower1 - الخليج التجاري - دبي - United Arab Emirates,	Plot 365-161 - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	1	ftl	approved_by_admin	\N	0	\N	completed	2023-12-02 11:13:14	2023-12-02 11:17:39	#TX-000428	no		\N	0	\N	\N	2	0	25.192103420296565	55.26691038161516	United Arab Emirates	Dubai	\N	25.12605556845681	55.245706513524055	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	0	0	0	0						0	0
431	1	G9QH+852, Gobra, Kolkata, West Bengal 700046, India,	9/27, Jadavpur, Kolkata, West Bengal 700032, India,	184	1	ftl	pending	\N	0	\N	pending	2023-12-02 12:05:12	2023-12-02 12:05:12	#TX-000431	no	\N	\N	0	\N	\N	\N	0	22.537531052096753	88.37775975465775	India	Kolkata	\N	22.49309360219301	88.36503267288208	India	Kolkata	\N	+971 987789969	+971 987789969	0	0	0	0						0	0
435	1	556 6th St - Al Quoz - Al Quoz 3 - Dubai - United Arab Emirates,	Plot 365-161 - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	1	ftl	pending	\N	0	\N	pending	2023-12-02 13:00:21	2023-12-02 13:00:21	#TX-000435	no	\N	\N	0	\N	\N	\N	0	25.161677229341123	55.239830799400806	United Arab Emirates	Abu Dhabi	\N	25.12605556845681	55.245706513524055	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	0	0	0	0						0	0
430	1	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	141 Street 62, Block C Media Town, Islamabad, Punjab 45720, Pakistan,	103	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-12-02 11:33:45	2023-12-04 20:46:40	#TX-000430	no	\N	0	15	30	30	\N	30	33.56680199984779	73.13683189451694	United Arab Emirates	Dubai	\N	33.5611572240175	73.1147063523531	United Arab Emirates	Abu Dhabi	\N	+971 1234567891	+971 1234567891	2	0	0	0						1	0
436	1	Plot 365-161 - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	778C+62Q - Dubai Maritime City - Dubai - United Arab Emirates,	157	1	ftl	pending	\N	0	\N	pending	2023-12-02 13:02:30	2023-12-02 13:02:30	#TX-000436	no	\N	\N	0	\N	\N	\N	0	25.12605556845681	55.245706513524055	United Arab Emirates	Dubai	\N	25.264055449960715	55.27177892625332	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	0	0	0	0						0	0
433	1	Boulevard Plaza Tower1 - الخليج التجاري - دبي - United Arab Emirates,	Plot 365-161 - Al Quoz - Al Quoz Industrial Area 2 - Dubai - United Arab Emirates,	157	1	ftl	pending	\N	0	\N	pending	2023-12-02 12:59:02	2023-12-02 12:59:02	#TX-000433	no	\N	\N	0	\N	\N	\N	0	25.192103420296565	55.26691038161516	United Arab Emirates	Dubai	\N	25.12605556845681	55.245706513524055	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	0	0	0	0						0	0
437	1	66 9B St - Al Barsha - Al Barsha 2 - Dubai - United Arab Emirates,	Boulevard Plaza Tower1 - الخليج التجاري - دبي - United Arab Emirates,	157	1	ftl	pending	\N	0	\N	pending	2023-12-02 13:34:07	2023-12-02 13:34:07	#TX-000437	no	\N	\N	0	\N	\N	\N	0	25.100315688721754	55.225210413336754	United Arab Emirates	Dubai	\N	25.192103420296565	55.26691038161516	United Arab Emirates	Dubai	\N	+971 5858585858	+971 5858585858	0	0	0	0						0	0
438	1	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	7-I, Katju Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	187	1	ftl	approved_by_admin	\N	0	\N	completed	2023-12-04 13:23:18	2023-12-04 14:05:47	#TX-000438	no	#IN76868685565	0	500	5000	5000	2	5000	28.70405920384049	77.10249032825232	India	Delhi	\N	22.49761772221553	88.36843002587557	India	Kolkata	\N	+971 987459971	+971 987459971	4	0	0	0						0	0
440	1	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	\N	187	4	\N	pending	\N	0	\N	pending	2023-12-04 14:10:43	2023-12-04 14:10:43	#TX-000440	no	\N	\N	0	\N	\N	\N	0	28.70405920384049	77.10249032825232	India	Delhi	\N	\N	\N	\N	\N	\N	+971 987459971	\N	0	0	0	0			2023-12-05	2023-12-31		0	0
441	1	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	7-I, Katju Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	187	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-12-04 14:48:02	2023-12-04 14:52:15	#TX-000441	no	\N	0	600	1300	1300	\N	1300	28.70405920384049	77.10249032825232	India	Delhi	\N	22.49761772221553	88.36843002587557	India	Kolkata	\N	+971 987459971	+971 987459971	1	0	0	0						0	0
439	1	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	7-I, Katju Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	187	1	ltl	driver_qouted	\N	0	\N	pending	2023-12-04 14:08:14	2023-12-04 14:43:43	#TX-000439	no	\N	\N	0	\N	\N	\N	0	28.70405920384049	77.10249032825232	India	\N	\N	22.49761772221553	88.36843002587557	India	Kolkata	\N	+971 987459971	+971 987459971	0	0	0	0						0	0
429	1	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	141 Street 62, Block C Media Town, Islamabad, Punjab 45720, Pakistan,	103	3	lcl	approved_by_admin	\N	0	\N	qoutes_received	2023-12-02 11:27:19	2023-12-04 20:19:28	#TX-000429	no		0	0	\N	\N	5	0	33.56680199984779	73.13683189451694	United Arab Emirates	\N	\N	33.5611572240175	73.1147063523531	United Arab Emirates	Abu Dhabi	\N	+971 1234567891	+971 1234567891	0	0	0	0						1	5
432	1	G9QH+852, Gobra, Kolkata, West Bengal 700046, India,	9/27, Jadavpur, Kolkata, West Bengal 700032, India,	184	1	ftl	driver_qouted	\N	0	\N	on_process	2023-12-02 12:06:52	2024-06-03 10:57:30	#TX-000432	no	\N	0	0	5000	5000	\N	5000	22.537531052096753	88.37775975465775	India	Kolkata	\N	22.49309360219301	88.36503267288208	India	Kolkata	\N	+971 987789969	+971 987789969	2	0	0	0						0	0
443	1	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	7-I, Katju Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	187	1	ftl	approved_by_admin	\N	0	\N	on_process	2023-12-05 09:38:24	2023-12-05 09:49:10	#TX-000443	no	#IN76868683434	0	500	10000	10000	3	10000	28.70405920384049	77.10249032825232	India	Delhi	\N	22.49761772221553	88.36843002587557	India	Kolkata	\N	+971 987459971	+971 987459971	2	0	0	0						0	0
450	1	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	P-17B, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India,	189	1	ftl	pending	\N	0	\N	pending	2024-06-03 10:45:15	2024-06-03 10:45:15	#TX-000450	no	\N	\N	0	\N	\N	\N	0	22.491632408374688	88.37047185748816	India	Kolkata	\N	22.52965559347034	88.36600497364998	India	Kolkata	\N	+971 9883239126	+971 9883239126	0	0	0	0						0	0
451	1	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	P-17B, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India,	189	1	ftl	approved_by_admin	\N	0	\N	qoutes_received	2024-06-03 10:45:53	2024-06-03 11:11:30	#TX-000451	no	\N	\N	0	\N	\N	\N	0	22.491632408374688	88.37047185748816	India	Kolkata	\N	22.52965559347034	88.36600497364998	India	Kolkata	\N	+971 9883239126	+971 9883239126	1	0	0	0						0	0
446	1	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,		187	4		approved_by_admin	\N	0	\N	qoutes_received	2023-12-05 09:54:51	2023-12-05 10:05:37	#TX-000446	no	#IN76868677	0	0	\N	\N	3	0	28.70405920384049	77.10249032825232	India	Delhi	\N	\N	\N	\N	\N	\N	+971 987459971	\N	0	0	0	0	\N		\N	\N	\N	1	0
445	1	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	7-I, Katju Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	187	1	ltl	approved_by_admin	\N	0	\N	qoutes_received	2023-12-05 09:45:34	2023-12-05 09:47:15	#TX-000445	no	\N	\N	0	\N	\N	\N	0	28.70405920384049	77.10249032825232	India	\N	\N	22.49761772221553	88.36843002587557	India	Kolkata	\N	+971 987459971	+971 987459971	1	0	0	0						1	0
452	1	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	P-17B, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India,	189	1	ftl	approved_by_admin	\N	0	\N	completed	2024-06-03 10:46:54	2024-06-03 11:17:20	#TX-000452	no	\N	0	5	25	25	\N	25	22.491632408374688	88.37047185748816	India	Kolkata	\N	22.52965559347034	88.36600497364998	India	Kolkata	\N	+971 9883239126	+971 9883239126	4	0	0	0						0	0
444	1	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	7-I, Katju Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	187	3	fcl	approved_by_admin	\N	0	\N	on_process	2023-12-05 09:42:39	2023-12-05 09:48:52	#TX-000444	no		0	0	5000	5000	2	5000	28.70405920384049	77.10249032825232	India	Delhi	\N	22.49761772221553	88.36843002587557	India	Kolkata	\N	+971 987459971	+971 987459971	2	0	0	0						1	2
448	1	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	7-I, Katju Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	187	1	ftl	pending	\N	0	\N	pending	2023-12-05 10:12:54	2023-12-05 10:13:07	#TX-000448	no	\N	\N	0	\N	\N	\N	0	28.70405920384049	77.10249032825232	India	Delhi	\N	22.49761772221553	88.36843002587557	India	Kolkata	\N	+971 987459971	+971 987459971	0	0	0	0						1	0
447	1	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	7-I, Katju Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	187	1	ftl	driver_qouted	\N	0	\N	pending	2023-12-05 10:12:25	2023-12-05 10:13:49	#TX-000447	no	\N	\N	0	\N	\N	\N	0	28.70405920384049	77.10249032825232	India	Delhi	\N	22.49761772221553	88.36843002587557	India	Kolkata	\N	+971 987459971	+971 987459971	0	0	0	0						0	0
454	1	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	P-17B, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India,	189	1	ltl	pending	\N	0	\N	pending	2024-06-03 13:55:22	2024-06-03 13:55:22	#TX-000454	no	\N	\N	0	\N	\N	\N	0	22.491632408374688	88.37047185748816	India	\N	\N	22.52965559347034	88.36600497364998	India	Kolkata	\N	+971 9883239126	+971 9883239126	0	0	0	0						0	0
449	1	D-1/10A Budh Vihar Phase-1 delhi - 110086, Lodhi Colony, Sector 3, Rohini, New Delhi, Delhi, 110008, India,	7-I, Katju Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	187	1	ftl	driver_qouted	\N	0	\N	completed	2023-12-26 08:32:54	2023-12-26 08:41:08	#TX-000449	no	#IN7686868435	0	1000	5000	5000	2	5000	28.70405920384049	77.10249032825232	India	Delhi	\N	22.49761772221553	88.36843002587557	India	Kolkata	\N	+971 987459971	+971 987459971	4	0	0	0						1	0
455	1	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	P-17B, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India,	189	1	ftl	pending	\N	0	\N	pending	2024-06-03 14:00:04	2024-06-03 14:00:04	#TX-000455	no	\N	\N	0	\N	\N	\N	0	22.491632408374688	88.37047185748816	India	Kolkata	\N	22.52965559347034	88.36600497364998	India	Kolkata	\N	+971 9883239126	+971 9883239126	0	0	0	0						0	0
453	1	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	P-17B, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India,	189	1	ltl	driver_qouted	\N	0	\N	completed	2024-06-03 10:49:06	2024-06-03 14:42:57	#TX-000453	no	#IN7686868	0	0	500	500	6	500	22.491632408374688	88.37047185748816	India	\N	\N	22.52965559347034	88.36600497364998	India	Kolkata	\N	+971 9883239126	+971 9883239126	4	0	0	0						0	0
456	1	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	P-17B, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India,	189	1	ftl	approved_by_admin	\N	0	\N	completed	2024-06-03 14:30:18	2024-06-03 16:42:31	#TX-000456	no	\N	0	0	5000	5000	\N	5000	22.491632408374688	88.37047185748816	India	Kolkata	\N	22.52965559347034	88.36600497364998	India	Kolkata	\N	+971 9883239126	+971 9883239126	4	0	0	0						1	0
471	1	21/1A, East Rd, Bidhanpally, Jadavpur, Kolkata, West Bengal 700032, India,	Unnamed Road, Rajasthan 305814, India,	193	1	ftl	driver_qouted	\N	0	\N	on_process	2024-06-07 11:28:20	2024-06-07 11:48:48	#TX-000471	no	#IN76868685565	0	2000	5500	5500	4	5500	22.495265693890627	88.36663596332073	India	Kolkata	\N	26.836980190396655	74.8835326731205	India	Delhi	\N	+91 932274136	+91 932274136	2	0	0	0						1	0
461	1	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	P-17B, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India,	189	3	fcl	approved_by_admin	\N	0	\N	delivery_completed	2024-06-03 17:09:31	2024-06-03 17:11:23	#TX-000461	no	#IN768686843554	0	0	\N	\N	3	0	22.491632408374688	88.37047185748816	India	Kolkata	\N	22.52965559347034	88.36600497364998	India	Kolkata	\N	+971 9883239126	+971 9883239126	0	0	0	0						0	3
463	1	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	P-17B, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India,	189	1	ftl	approved_by_admin	\N	0	\N	completed	2024-06-03 17:20:07	2024-06-03 17:22:46	#TX-000463	no	\N	0	0	5000	5000	\N	5000	22.491632408374688	88.37047185748816	India	Kolkata	\N	22.52965559347034	88.36600497364998	India	Kolkata	\N	+971 9883239126	+971 9883239126	4	0	0	0						0	0
462	1	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	P-17B, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India,	189	3	lcl	approved_by_admin	\N	0	\N	cargo_reached_destination_border	2024-06-03 17:12:11	2024-06-03 17:13:47	#TX-000462	no	#IN7686868435	0	0	1000	1000	6	1000	22.491632408374688	88.37047185748816	India	\N	\N	22.52965559347034	88.36600497364998	India	Kolkata	\N	+971 9883239126	+971 9883239126	2	0	0	0						0	6
459	1	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	P-17B, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India,	189	1	ltl	approved_by_admin	\N	0	\N	completed	2024-06-03 16:56:17	2024-06-03 17:01:35	#TX-000459	no	#IN768686843554	0	0	500	500	6	500	22.491632408374688	88.37047185748816	India	\N	\N	22.52965559347034	88.36600497364998	India	Kolkata	\N	+971 9883239126	+971 9883239126	4	0	0	0						0	0
457	1	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	P-17B, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India,	189	1	ltl	approved_by_admin	\N	0	\N	on_process	2024-06-03 15:14:47	2024-06-03 16:48:55	#TX-000457	no	\N	0	0	500	500	\N	500	22.491632408374688	88.37047185748816	India	\N	\N	22.52965559347034	88.36600497364998	India	Kolkata	\N	+971 9883239126	+971 9883239126	1	0	0	0						1	0
458	1	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	P-17B, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India,	189	1	ftl	approved_by_admin	\N	0	\N	completed	2024-06-03 16:43:41	2024-06-03 16:50:51	#TX-000458	no	#IN76868685565	0	500	2500	2500	2	2500	22.491632408374688	88.37047185748816	India	Kolkata	\N	22.52965559347034	88.36600497364998	India	Kolkata	\N	+971 9883239126	+971 9883239126	4	0	0	0						1	0
464	1	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	\N	189	4	\N	pending	\N	0	\N	pending	2024-06-05 10:22:06	2024-06-05 10:22:06	#TX-000464	no	\N	\N	0	\N	\N	\N	0	22.491632408374688	88.37047185748816	India	Kolkata	\N	\N	\N	\N	\N	\N	+971 9883239126	\N	0	0	0	0			2024-06-29	2024-06-30		0	0
465	1	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	P-17B, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India,	189	1	ftl	pending	\N	0	\N	pending	2024-06-05 11:42:26	2024-06-05 11:42:27	#TX-000465	no	\N	\N	0	\N	\N	\N	0	22.491632408374688	88.37047185748816	India	Kolkata	\N	22.52965559347034	88.36600497364998	India	Kolkata	\N	+971 9883239126	+971 9883239126	0	0	0	0						0	0
460	1	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	P-17B, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India,	189	2		approved_by_admin	\N	0	\N	delivery_completed	2024-06-03 17:02:26	2024-06-03 17:08:29	#TX-000460	no	#IN768686843554	0	0	500	500	3	500	22.491632408374688	88.37047185748816	India	\N	\N	22.52965559347034	88.36600497364998	India	Kolkata	\N	+971 9883239126	+971 9883239126	2	0	0	0						0	3
467	1	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	P-17B, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India,	189	1	ftl	pending	\N	0	\N	pending	2024-06-05 11:43:38	2024-06-05 11:43:38	#TX-000467	no	\N	\N	0	\N	\N	\N	0	22.491632408374688	88.37047185748816	India	Kolkata	\N	22.52965559347034	88.36600497364998	India	Kolkata	\N	+971 9883239126	+971 9883239126	0	0	0	0						0	0
466	1	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	P-17B, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India,	189	1	ftl	pending	\N	0	\N	pending	2024-06-05 11:43:04	2024-06-05 11:43:04	#TX-000466	no	\N	\N	0	\N	\N	\N	0	22.491632408374688	88.37047185748816	India	Kolkata	\N	22.52965559347034	88.36600497364998	India	Kolkata	\N	+971 9883239126	+971 9883239126	0	0	0	0						0	0
468	1	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	P-17B, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India,	189	1	ftl	pending	\N	0	\N	pending	2024-06-05 11:44:33	2024-06-05 11:44:33	#TX-000468	no	\N	\N	0	\N	\N	\N	0	22.491632408374688	88.37047185748816	India	Kolkata	\N	22.52965559347034	88.36600497364998	India	Kolkata	\N	+971 9883239126	+971 9883239126	0	0	0	0						0	0
470	1	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	P-17B, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India,	189	1	ftl	approved_by_admin	\N	0	\N	on_process	2024-06-05 11:45:35	2024-06-05 11:47:57	#TX-000470	no	\N	0	0	500	500	\N	500	22.491632408374688	88.37047185748816	India	Kolkata	\N	22.52965559347034	88.36600497364998	India	Kolkata	\N	+971 9883239126	+971 9883239126	2	0	0	0						0	0
469	1	6/22, Santi Pally, NO 2 Chittaranjan Colony, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	P-17B, Ashutosh Chowdary Ave, Ballygunge Park, Ballygunge, Kolkata, West Bengal 700019, India,	189	1	ftl	approved_by_admin	\N	0	\N	on_process	2024-06-05 11:45:06	2024-06-05 11:48:13	#TX-000469	no	\N	0	0	300	300	\N	300	22.491632408374688	88.37047185748816	India	Kolkata	\N	22.52965559347034	88.36600497364998	India	Kolkata	\N	+971 9883239126	+971 9883239126	2	0	0	0						0	0
473	1	21/1A, East Rd, Bidhanpally, Jadavpur, Kolkata, West Bengal 700032, India,	Unnamed Road, Rajasthan 305814, India,	193	1	ltl	ask_for_qoute	\N	0	\N	pending	2024-06-07 12:05:51	2024-06-07 12:10:50	#TX-000473	no	\N	\N	0	\N	\N	\N	0	22.495265693890627	88.36663596332073	India	\N	\N	26.836980190396655	74.8835326731205	India	Delhi	\N	+91 932274136	+91 932274136	0	0	0	0						0	0
479	1	57P6+4HW - Business Bay - Dubai - United Arab Emirates,	36 Samnan St - Samnan - Halwan - Sharjah - United Arab Emirates,	202	1	ftl	driver_qouted	\N	0	\N	pending	2025-02-12 17:05:58	2025-02-12 17:09:16	#TX-000479	no	\N	\N	0	\N	\N	\N	0	25.18542114756786	55.26112552732229	United Arab Emirates	Dubai	\N	25.339379931937803	55.423766635358334	United Arab Emirates	Dubai	\N	+971 987654321	+971 987654321	0	0	0	0						0	0
484	1	57P6+4HW - Business Bay - Dubai - United Arab Emirates,	36 Samnan St - Samnan - Halwan - Sharjah - United Arab Emirates,	202	2	\N	pending	\N	0	\N	qoutes_received	2025-02-13 20:28:53	2025-02-13 20:42:13	#TX-000484	no	\N	\N	0	\N	\N	5	0	25.18542114756786	55.26112552732229	United Arab Emirates	\N	\N	25.339379931937803	55.423766635358334	United Arab Emirates	Dubai	\N	+971 987654321	+971 987654321	0	0	0	0						1	5
474	1	44, Ananda Pally, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	16/5, Sukhpally, Haltu, Kolkata, West Bengal 700078, India,	189	1	ftl	approved_by_admin	\N	0	\N	on_process	2024-07-05 11:01:33	2024-07-05 11:28:11	#TX-000474	no	#IN76868677	0	1000	5000	5000	2	5000	22.49044349262854	88.36950492113829	India	Kolkata	\N	22.500972693020703	88.38490046560764	India	Kolkata	\N	+971 9883239126	+971 9883239126	2	0	0	0						0	0
476	1	673C+W8V - Dubai - United Arab Emirates,	Downtown Dubai - Dubai - United Arab Emirates,	195	1	ftl	approved_by_admin	\N	0	\N	on_process	2024-09-18 12:47:21	2024-09-18 13:34:46	#TX-000476	yes	875875875875	0	0	300	300	2	300	25.204849237091366	55.27078282088041	United Arab Emirates	Dubai	\N	25.19722963547897	55.27974709868431	United Arab Emirates	Dubai	\N	+971 9847823799	+971 9847823799	2	0	0	0						0	0
487	1	57P6+4HW - Business Bay - Dubai - United Arab Emirates,	36 Samnan St - Samnan - Halwan - Sharjah - United Arab Emirates,	202	3	fcl	approved_by_admin	\N	0	\N	on_process	2025-02-13 21:12:46	2025-02-13 21:22:53	#TX-000487	no		0	0	2000	2000	2	2000	25.18542114756786	55.26112552732229	United Arab Emirates	Dubai	\N	25.339379931937803	55.423766635358334	United Arab Emirates	Dubai	\N	+971 987654321	+971 987654321	2	0	0	0						1	2
477	1	21/1A, East Rd, Bidhanpally, Jadavpur, Kolkata, West Bengal 700032, India,	Unnamed Road, Rajasthan 305814, India,	193	1	ftl	driver_qouted	\N	0	\N	pending	2024-09-30 14:00:20	2024-09-30 14:03:24	#TX-000477	no	\N	\N	0	\N	\N	\N	0	22.495265693890627	88.36663596332073	India	Kolkata	\N	26.836980190396655	74.8835326731205	India	Delhi	\N	+91 932274136	+91 932274136	0	0	0	0						1	0
475	1	44, Ananda Pally, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700092, India,	16/5, Sukhpally, Haltu, Kolkata, West Bengal 700078, India,	189	1	ltl	approved_by_admin	\N	0	\N	on_process	2024-07-05 11:33:56	2024-07-05 11:40:25	#TX-000475	no	\N	0	0	4000	4000	\N	4000	22.49044349262854	88.36950492113829	India	\N	\N	22.500972693020703	88.38490046560764	India	Kolkata	\N	+971 9883239126	+971 9883239126	1	0	0	0						1	0
481	1	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	1, PWD Housing Society Sector D PWD Society, Islamabad, Islamabad Capital Territory, Pakistan,	198	1	ftl	approved_by_admin	\N	0	\N	on_process	2025-02-13 14:52:13	2025-02-13 14:53:26	#TX-000481	no	\N	0	0	1500	1500	\N	1500	33.56681010146329	73.13680876046419	United Arab Emirates	Dubai	\N	33.575210788256626	73.15215468406677	United Arab Emirates	Dubai	\N	+971 369852147	+971 369852147	2	0	0	0						0	0
478	1	21/1A, East Rd, Bidhanpally, Jadavpur, Kolkata, West Bengal 700032, India,	Unnamed Road, Rajasthan 305814, India,	193	1	ftl	driver_qouted	\N	0	\N	pending	2024-09-30 14:05:47	2024-09-30 14:06:35	#TX-000478	no	\N	\N	0	\N	\N	\N	0	22.495265693890627	88.36663596332073	India	Kolkata	\N	26.836980190396655	74.8835326731205	India	Delhi	\N	+91 932274136	+91 932274136	0	0	0	0						0	0
482	1	10 19 Street - Al Layah - Sharjah - United Arab Emirates,	10 19 Street - Al Layah - Sharjah - United Arab Emirates,	191	1	ltl	pending	\N	0	\N	pending	2025-02-13 18:44:34	2025-02-13 18:44:34	#TX-000482	no	\N	\N	0	\N	\N	\N	0	25.343050645322485	55.372970290482044	United Arab Emirates	\N	\N	25.343050645322485	55.372970290482044	United Arab Emirates	Dubai	\N	+971 932172369	+971 932172369	0	0	0	0						0	0
480	1	57P6+4HW - Business Bay - Dubai - United Arab Emirates,	23 Qurn Shayiʹ St - Al Rawdah - W48 - Abu Dhabi - United Arab Emirates,	202	1	ftl	approved_by_admin	\N	0	\N	completed	2025-02-13 13:41:50	2025-02-13 14:12:43	#TX-000480	no	\N	0	100	2000	2000	\N	2000	25.18542114756786	55.26112552732229	United Arab Emirates	Dubai	\N	24.430129879081125	54.414748437702656	United Arab Emirates	Abu Dhabi	\N	+971 987654321	+971 987654321	4	0	0	0						0	0
485	1	57P6+4HW - Business Bay - Dubai - United Arab Emirates,	36 Samnan St - Samnan - Halwan - Sharjah - United Arab Emirates,	202	2		approved_by_admin	\N	0	\N	delivery_completed	2025-02-13 20:44:27	2025-02-13 20:57:48	#TX-000485	no	634634636	0	0	\N	\N	3	0	25.18542114756786	55.26112552732229	United Arab Emirates	\N	\N	25.339379931937803	55.423766635358334	United Arab Emirates	Dubai	\N	+971 987654321	+971 987654321	0	0	0	0						1	3
483	1	57P6+4HW - Business Bay - Dubai - United Arab Emirates,	36 Samnan St - Samnan - Halwan - Sharjah - United Arab Emirates,	202	1	ltl	approved_by_admin	\N	0	\N	completed	2025-02-13 20:04:16	2025-02-13 20:39:11	#TX-000483	no	646347347374	0	100	1200	1200	1	1200	25.18542114756786	55.26112552732229	United Arab Emirates	\N	\N	25.339379931937803	55.423766635358334	United Arab Emirates	Dubai	\N	+971 987654321	+971 987654321	4	0	0	0						0	0
486	1	57P6+4HW - Business Bay - Dubai - United Arab Emirates,	36 Samnan St - Samnan - Halwan - Sharjah - United Arab Emirates,	202	2		approved_by_admin	\N	0	\N	on_process	2025-02-13 21:03:21	2025-02-13 21:10:11	#TX-000486	no	875875875875	0	2000	4000	4000	4	4000	25.18542114756786	55.26112552732229	United Arab Emirates	\N	\N	25.339379931937803	55.423766635358334	United Arab Emirates	Dubai	\N	+971 987654321	+971 987654321	2	0	0	0						0	4
488	1	57P6+4HW - Business Bay - Dubai - United Arab Emirates,	36 Samnan St - Samnan - Halwan - Sharjah - United Arab Emirates,	202	3	fcl	approved_by_admin	\N	0	\N	on_process	2025-02-13 21:24:22	2025-02-13 21:26:12	#TX-000488	no		0	0	\N	\N	2	0	25.18542114756786	55.26112552732229	United Arab Emirates	Dubai	\N	25.339379931937803	55.423766635358334	United Arab Emirates	Dubai	\N	+971 987654321	+971 987654321	0	0	0	0						0	2
489	1	57P6+4HW - Business Bay - Dubai - United Arab Emirates,		202	4		approved_by_admin	\N	0	\N	qoutes_received	2025-02-13 21:30:40	2025-02-13 21:32:37	#TX-000489	no	875875875875	0	0	\N	\N	2	0	25.18542114756786	55.26112552732229	United Arab Emirates	Dubai	\N	\N	\N	\N	\N	\N	+971 987654321	\N	0	0	0	0	\N		\N	\N	\N	0	0
490	0			202	4		approved_by_admin	\N	0	\N	on_process	2025-02-13 21:36:57	2025-02-13 21:41:09	#TX-000490	no	875875875875	0	0	500	500	1	500					\N	\N	\N	\N	\N	\N		\N	2	0	0	0	\N		\N	\N	\N	0	0
\.


--
-- Data for Name: cart_deligate_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_deligate_details (id, item, booking_cart_id, no_of_packages, dimension_of_each_package, weight_of_each_package, total_gross_weight, total_volume_in_cbm, created_at, updated_at, num_of_pallets) FROM stdin;
63	Groceries	348	10	20*1*10	100	10	5	2023-11-15 13:21:35	2023-11-15 13:21:35	0
64	test lcl	350	2	2x3x4	23	23	213.8	2023-11-15 13:25:59	2023-11-15 13:25:59	0
129	test ltl	495	12	2x3x4	12	36	2.9	2023-11-18 13:41:25	2023-11-18 13:41:25	0
130	test	496	25	2x3x4	2	6	2.9	2023-11-18 13:41:54	2023-11-18 13:41:54	0
68	test	375	25	44	55	55	55	2023-11-16 09:36:11	2023-11-16 09:36:11	0
71	Clothes	398	20	2x3x2	20	20	4x8x4	2023-11-16 16:49:34	2023-11-16 16:49:34	0
73	Clothes	400	20	2x3x2	20	20	4x8x4	2023-11-16 17:07:33	2023-11-16 17:07:33	0
9	item testing	51	4	3x2x1	3	12	7x6x5	2023-10-20 11:57:07	2023-10-20 13:05:26	0
75	Clothes	402	20	2x3x2	20	20	4x8x4	2023-11-16 17:13:20	2023-11-16 17:13:20	0
14	356	73	2	120x60	25	50	46x5x5	2023-10-25 16:48:01	2023-10-25 16:48:01	0
81	Clothes	408	20	2x3x2	20	20	4x8x4	2023-11-16 17:20:05	2023-11-16 17:20:05	0
144	Packets	573	500	6x55x54	50	25000	8000	2023-11-21 11:08:43	2023-11-21 11:08:43	0
146	Cloths	577	20	2x3x2	10	20	4x8x4	2023-11-29 16:29:58	2023-11-29 16:29:58	10
147	test ltl	578	3	3x3x4	2	6	3.6	2023-11-30 10:06:48	2023-11-30 10:06:48	9
148	test ltl	579	3	2x3x4	3	9	3.6	2023-11-30 10:13:33	2023-11-30 10:13:33	8
149	test	580	3	2x3x4	3	9	36	2023-11-30 10:15:55	2023-11-30 10:15:55	8
92	test	424	2	2x3x4	3	6	3.9	2023-11-16 22:27:16	2023-11-16 22:27:16	0
28	12	142	12	23	200	69	12	2023-11-09 11:51:57	2023-11-09 11:51:57	0
93	test air	425	12	4x5x6	2	24	3.08	2023-11-16 22:33:54	2023-11-16 22:33:54	0
32	Cloths	168	20	2x3x2	10	20	4x8x4	2023-11-13 10:29:56	2023-11-13 10:29:56	0
33	Cloths	169	20	2x3x2	10	20	4x8x4	2023-11-13 10:30:53	2023-11-13 10:30:53	0
34	Cloths	170	20	2x3x2	10	20	4x8x4	2023-11-13 10:31:11	2023-11-13 10:31:11	0
35	Cloths	171	20	2x3x2	10	20	4x8x4	2023-11-13 10:31:39	2023-11-13 10:31:39	0
36	Cloths	173	20	2x3x2	10	20	4x8x4	2023-11-13 10:31:55	2023-11-13 10:31:55	0
37	Cloths	177	20	2x3x2	10	20	4x8x4	2023-11-13 10:43:26	2023-11-13 10:43:26	0
153	Clothes	594	20	2x3x2	20	20	4x8x4	2023-12-01 22:22:24	2023-12-01 22:22:24	0
98	Cloths	439	20	2x3x2	10	20	4x8x4	2023-11-17 12:40:46	2023-11-17 12:40:46	0
154	test	595	3	2x5x7	3	9	3.69	2023-12-01 22:24:46	2023-12-01 22:24:46	0
155	tedt	596	3	2x5x7	2	6	2.9	2023-12-01 22:49:40	2023-12-01 22:49:40	0
156	Clothes	600	20	2x3x2	20	20	4x8x4	2023-12-02 08:21:45	2023-12-02 08:21:45	0
157	Clothes	601	20	2x3x2	20	20	4x8x4	2023-12-02 08:24:19	2023-12-02 08:24:19	0
158	Clothes	602	20	2x3x2	20	20	4x8x4	2023-12-02 08:24:31	2023-12-02 08:24:31	0
159	Clothes	603	20	2x3x2	20	20	4x8x4	2023-12-02 08:25:30	2023-12-02 08:25:30	0
160	Clothes	604	20	2x3x2	20	20	4x8x4	2023-12-02 08:26:17	2023-12-02 08:26:17	0
163	test	612	3	2x3x6	3	6	3.8	2023-12-02 10:54:35	2023-12-02 10:54:35	0
164	test	613	6	2x4x5	2	12	5.5	2023-12-02 11:09:10	2023-12-02 11:09:10	0
53	yay	304	846	2x2x3	545	9464	0.9	2023-11-14 10:25:40	2023-11-14 10:25:40	0
54	test	305	10	2x2x3	12	12	0.08	2023-11-14 10:39:00	2023-11-14 10:39:00	0
55	te	307	12	2x3x4	13	15	0.9	2023-11-14 11:01:40	2023-11-14 11:01:40	0
58	Test	329	22	55	2	22	22	2023-11-14 17:55:06	2023-11-14 17:55:06	0
168	ghh	647	6666	665	55	58	58	2023-12-26 08:51:25	2023-12-26 08:51:25	0
60	Thh	331	25	5x6x4	258	266	5446	2023-11-14 18:09:34	2023-11-14 18:09:34	0
169	9755	650	1	2x5x4	25	28	258	2024-06-03 10:48:57	2024-06-03 10:48:57	1
170	hsj	657	346	2x4x5	979	97676	9797	2024-06-03 13:55:01	2024-06-03 13:55:01	979
\.


--
-- Data for Name: cart_warehousing_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_warehousing_details (id, booking_cart_id, items_are_stockable, type_of_storage, item, no_of_pallets, pallet_dimension, weight_per_pallet, total_weight, total_item_cost, created_at, updated_at, date_of_commencement, date_of_return) FROM stdin;
1	53	yes	2	Test Clothes	20	2x3x2	20	20	4000	2023-10-20 15:51:14	2023-10-20 15:51:14	\N	\N
4	69	yes	2	the	5	100x50	28	28	258096	2023-10-25 13:36:09	2023-10-25 13:36:09	\N	\N
12	250	yes	2	test ware one	2	2x2x2	3	6	600	2023-11-13 14:26:02	2023-11-13 14:26:02	\N	\N
16	301	yes	1	trrs	5	55	55	55	55	2023-11-14 09:52:03	2023-11-14 09:52:03	\N	\N
19	306	yes	2	gg	3	2x2x2	12	13	1234	2023-11-14 10:51:20	2023-11-14 10:51:20	\N	\N
27	426	yes	2	test warehouse	2	8x6x9	2	4	690	2023-11-16 22:52:43	2023-11-16 22:52:43	\N	\N
28	427	yes	2	test ware	2	2x5x7	2	4	369	2023-11-16 22:59:50	2023-11-16 22:59:50	\N	\N
42	575	yes	2	Packets	500	54x65x56	50	5000	8000	2023-11-21 11:17:47	2023-11-21 11:17:47	\N	\N
44	587	yes	2	33	22	23	22	55	55	2023-12-01 15:05:33	2023-12-01 15:05:33	1970-01-01	1970-01-01
45	589	yes	2	Clothes	20	2x3x2	20	20	4000	2023-12-01 16:29:53	2023-12-01 16:29:53	2023-11-29	2023-12-15
50	641	yes	2	jf	588	64x46x74	500	5000	80000	2023-12-05 09:53:21	2023-12-05 09:53:21	2023-12-31	2023-12-05
52	672	yes	2	test	21	754x633x35	50	250	2500	2024-06-03 20:44:51	2024-06-03 20:44:51	2024-06-03	2024-06-22
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, city_name, city_status, country_id, created_at, updated_at) FROM stdin;
1	Dubai	1	1	2023-07-26 16:49:38	2023-07-26 16:49:38
5	Abu Dhabi	1	1	2023-11-17 19:50:38	2023-11-17 19:50:38
6	Kolkata	1	2	2023-11-18 11:17:17	2023-11-18 11:17:17
7	Delhi	1	2	2023-11-18 11:17:33	2023-11-18 11:17:33
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (id, name, logo, status, created_at, updated_at, user_id, license_expiry, company_license) FROM stdin;
2	D X	6538ac1120e9b_1698212881.jpeg	active	2023-10-25 09:48:01	2023-10-25 09:48:01	106	2023-12-25	6538ac11225d8_1698212881.jpeg
1	Garner Gilbert Traders	6553629bb2a5c_1699963547.jpeg	active	2023-08-08 09:51:15	2023-11-14 16:05:47	38	2034-06-14	65535c302205f_1699961904.jpeg
\.


--
-- Data for Name: containers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.containers (id, name, type, dimensions, max_weight_in_metric_tons, icon, status, created_at, updated_at) FROM stdin;
2	20HC	fcl	2*1.1*1.1*1.0	21	65374f4741e95_1698123591.jpg	active	2023-10-24 08:59:51	2023-10-24 08:59:51
1	20 Ft	fcl	2X1X2	16	65374f57b3c7d_1698123607.jpg	active	2023-07-25 23:35:28	2023-10-24 09:00:07
3	40 Ft	fcl	4*1.85*1.80	26	65374f8ece155_1698123662.jpg	active	2023-10-24 09:01:02	2023-10-24 09:01:02
4	40HC	fcl	4*1.85*1.8	30	65374fe368f0e_1698123747.jpg	active	2023-10-24 09:02:27	2023-10-24 09:02:27
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (country_id, country_name, dial_code, iso_code, lang_code, country_status, created_at, updated_at, deleted_at) FROM stdin;
2	India	91	IN	en	1	2023-11-14 19:48:32	2023-11-29 10:26:36	\N
1	United Arab Emirates	971	AE	en	1	2023-07-26 16:48:47	2023-12-02 09:08:44	\N
3	Saudi Arabia	966	SA	en	1	2023-12-02 09:08:45	2023-12-02 09:09:35	\N
4	Pakistan	92	PK	en	1	2023-12-02 09:10:20	2023-12-02 09:10:20	\N
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
4	Warehousing	64d1d91191699_1691474193.PNG	active	2023-07-26 10:14:14	2023-08-08 09:56:33	warehousing
2	Air Freight	64d1d93758252_1691474231.PNG	active	2023-07-26 10:12:14	2023-08-08 09:57:11	air-freight
1	Trucking	64d1d948eac9f_1691474248.PNG	active	2023-07-26 10:11:17	2023-08-08 09:57:28	trucking
3	Sea Frieght	64d1d95df3c62_1691474269.PNG	active	2023-07-26 10:12:53	2023-08-08 09:57:50	sea-frieght
\.


--
-- Data for Name: driver_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.driver_details (id, user_id, driving_license, mulkia, mulkia_number, is_company, company_id, truck_type_id, total_rides, created_at, updated_at, address, latitude, longitude, emirates_id_or_passport, driving_license_number, driving_license_expiry, driving_license_issued_by, vehicle_plate_number, vehicle_plate_place, emirates_id_or_passport_back) FROM stdin;
68	196	66ea9e3a8c29d_1726651962.jpg	66ea9e3a9a226_1726651962.jpg	986585	no	\N	8	0	2024-09-18 13:32:43	2024-09-18 13:32:43	Business Bay	25.204849237091366	55.27078282088041	66ea9e3a9be00_1726651962.jpg	ghfhc	2024-09-30	Dubai	5568	Dubai	66ea9e3a9f6a3_1726651962.jpg
66	192	6662b40599214_1717744645.jpg	6662b4059ec11_1717744645.jpg	933213963366	no	0	8	0	2024-06-07 11:17:25	2024-09-18 14:35:52	23/R, Shaktigarh, Jadavpur, Kolkata, West Bengal 700032, India,	22.491716047190607	88.36909119039774	6662b4059f0ca_1717744645.jpg	97453678998	2024-10-17	Kolkata	93652	Kolkata	6662b4059f24b_1717744645.jpg
70	203	67ac80aa28fc9_1739358378.jpg	67ac80aa2b37d_1739358378.jpg	3131316	no	\N	8	0	2025-02-12 15:06:18	2025-02-12 15:06:18	Business Bay	33.56679557442807	73.13676383346319	67ac80aa2c419_1739358378.jpg	7383838	2025-02-28	Dubai	626562	Dubai	67ac80aa2e387_1739358378.jpg
73	206	67acb6566417c_1739372118.jpg	67acb65665778_1739372118.jpg	2434864	yes	0	9	0	2025-02-12 18:55:18	2025-02-12 18:55:18	Business Bay	25.184243937374443	55.260051637887955	67acb6566591d_1739372118.jpg	363883Tu	2025-02-28	Dubai	254640	Dubai	67acb65665aac_1739372118.jpg
76	210	67ae4d539833e_1739476307.jpg	67ae4d5399fa3_1739476307.jpg	31313	yes	0	8	0	2025-02-13 23:51:47	2025-02-13 23:51:47	Business Bay	33.5164103426905	73.11085268855095	67ae4d539a13d_1739476307.jpg	7272	2025-02-28	Dubai	31316	Dubai	67ae4d539aeaf_1739476307.png
21	87	6530e90ec03aa_1697704206.jpg	6530e90ec4574_1697704206.jpg	8698855478	no	\N	1	0	2023-10-19 12:30:06	2023-10-19 12:30:06	Business Bay	33.56687883	73.13681815	6530e90ec6c30_1697704206.jpg	090078602	2023-10-31	Dubai	86588	Dubai	6530e90ec7770_1697704206.jpg
25	91	65321b79c8213_1697782649.jpg	65321b79cd47b_1697782649.jpg	258075	no	\N	1	0	2023-10-20 10:17:29	2023-10-20 10:17:29	Business Bay	33.56679027	73.13682754	65321b79d0e89_1697782649.jpg	09876543113	2024-10-20	Dubai	86685	Dubai	65321b79d4c66_1697782649.jpg
27	94	6532209797d72_1697783959.jpg	653220979cbed_1697783959.jpg	25807511	no	\N	1	0	2023-10-20 10:39:19	2023-10-20 10:39:19	Business Bay	33.56678971	73.13682888	65322097a07b6_1697783959.jpg	123557800	2024-10-20	Dubai	25005	Dubai	65322097a42e3_1697783959.jpg
28	95	653221c64a399_1697784262.jpg	653221c657332_1697784262.jpg	36908	no	\N	1	0	2023-10-20 10:44:22	2023-10-20 10:44:22	Business Bay	33.56679110	73.13683055	653221c65d14b_1697784262.jpg	09876553321	2027-10-20	Dubai	8339085	Dubai	653221c662dfb_1697784262.jpg
29	96	653222cd654d4_1697784525.jpg	653222cd6a1f8_1697784525.jpg	846644	no	\N	1	0	2023-10-20 10:48:45	2023-10-20 10:48:45	Business Bay	33.56679222	73.13683257	653222cd6e036_1697784525.jpg	09876654322	2023-10-20	Dubai	54646	Dubai	653222cd71aad_1697784525.jpg
24	90	653219be94891_1697782206.png	653219be95bc4_1697782206.png	74747474	no	0	1	0	2023-10-20 10:10:06	2023-12-02 09:15:31	ABC, DEF	25.15285477	55.27328796	653219be95c8d_1697782206.png	54657657	2023-09-10	Dubai	7373733	Dubai	653219be95d4a_1697782206.png
67	194	6662c296236cf_1717748374.jpg	6662c29625244_1717748374.jpg	932369963	no	\N	8	0	2024-06-07 12:19:34	2024-07-05 11:02:58	Business Bay	22.519401433265333	88.3518211171031	6662c296292b5_1717748374.jpg	9852257999	2024-07-31	Kolkata	93366	Kolkata	6662c2962942a_1717748374.jpg
69	197	66fa2a2d764b8_1727670829.jpg	66fa2a2d7f74f_1727670829.jpg	98658	no	\N	8	0	2024-09-30 08:33:49	2024-09-30 08:33:49	Business Bay	28.704059203840494	77.10249032825232	66fa2a2d819a9_1727670829.jpg	gccx	2024-11-22	Delhi	98898	Kolkata	66fa2a2d86b02_1727670829.jpg
71	204	67ac935b6d47b_1739363163.jpg	67ac935b6eca5_1739363163.jpg	54558556	yes	0	9	0	2025-02-12 16:26:03	2025-02-12 16:26:03	Business Bay	25.184248791872815	55.260046273469925	67ac935b6eef0_1739363163.jpg	4664fgffu	2025-02-28	Dubai	23436899	Abu Dhabi	67ac935b6f3d4_1739363163.jpg
74	207	67adbbf49f01c_1739439092.jpg	67adbbf4a2424_1739439092.jpg	365217082	yes	0	9	0	2025-02-13 13:31:32	2025-02-13 13:31:32	Business Bay	33.56681680624794	73.13680071383715	67adbbf4a381e_1739439092.jpg	97643f567	2025-03-31	Dubai	36985	Dubai	67adbbf4a5544_1739439092.jpg
41	128	654e8e0cee47c_1699646988.jpg	654e8e0cefb51_1699646988.jpg	1234	no	\N	1	0	2023-11-11 00:09:49	2023-11-11 00:09:49	Business Bay	33.51639217330388	73.11083860695362	654e8e0cf0c22_1699646988.jpg	098765432166	2023-11-30	Dubai	0987654321	Dubai	654e8e0cf1368_1699646988.jpg
42	129	654e8ed2aa0c2_1699647186.jpg	654e8ed2ab709_1699647186.jpg	1234	no	\N	1	0	2023-11-11 00:13:06	2023-11-11 00:13:06	Business Bay	33.51644025228788	73.11081446707249	654e8ed2abba7_1699647186.jpg	BB123	2023-11-30	Dubai	0987654321	Dubai	654e8ed2ac2d3_1699647186.jpg
43	130	654e8f650cf96_1699647333.jpg	654e8f650e515_1699647333.jpg	1234	no	\N	1	0	2023-11-11 00:15:33	2023-11-11 00:15:33	Business Bay	33.51644109087458	73.11082251369953	654e8f650f487_1699647333.jpg	0987654321T	2023-11-11	Dubai	0987654321	Dubai	654e8f650fbad_1699647333.jpg
65	190	66570c62b88f1_1716980834.jpg	66570c62c47fa_1716980834.jpg	9635542663	no	0	8	0	2024-05-29 15:07:15	2024-09-30 13:55:07	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	22.48984035715548	88.37031293660402	66570c62c5598_1716980834.jpg	9765224567	2025-05-24	Kolkata	965855	Kolkata	66570c62c874d_1716980834.jpg
56	173	655896551424c_1700304469.jpg	6558965515808_1700304469.jpg	233565	yes	38	1	0	2023-11-18 14:47:49	2023-11-18 14:47:49	Business Bay	25.287249791313474	55.370816476643085	65589655159cb_1700304469.jpg	466578	2023-11-18	Abu Dhabi	566866	Abu Dhabi	6558965515c0e_1700304469.jpg
72	205	67ac9408b9306_1739363336.png	67ac9408ba7a3_1739363336.png	31331	no	\N	8	0	2025-02-12 16:28:56	2025-02-12 16:28:56	Business Bay	33.5668212761041	73.13679903745651	67ac9408ba91c_1739363336.png	663737	2025-02-28	Dubai	521	Dubai	67ac9408baa8d_1739363336.png
75	208	67add9abeb0ee_1739446699.jpg	67add9abec704_1739446699.jpg	1231486	yes	0	8	0	2025-02-13 15:38:20	2025-02-13 22:11:03	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	25.184258197462857	55.26005532592535	67add9abec9e4_1739446699.jpg	252838y	2025-02-28	Dubai	45648464	Abu Dhabi	67add9abee3b3_1739446699.jpg
\.


--
-- Data for Name: driver_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.driver_types (id, type, created_at, updated_at) FROM stdin;
0	Individual	\N	\N
1	Company	\N	\N
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: faq; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faq (id, title, description, active, created_at, updated_at, usertype) FROM stdin;
1	title1	description1	1	2023-10-09 10:00:00	2023-10-09 10:00:00	0
3	title3	<p>description3</p>	1	2023-10-09 10:00:00	2023-10-20 15:17:57	2
4	title4	<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	1	2023-10-09 10:00:00	2023-10-25 16:38:46	3
2	What is Timex?	<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	1	2023-10-09 10:00:00	2023-10-25 16:41:14	3
\.


--
-- Data for Name: help_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.help_request (id, subject, message, user_id, created_at, updated_at) FROM stdin;
1	terms-and-conditions	fdsgdf	74	2023-10-10 06:30:44	2023-10-10 10:30:44
2	submit here	messahe  here	74	2023-10-10 06:31:04	2023-10-10 10:31:04
3	submit here	messahe  here	77	2023-10-10 10:21:31	2023-10-10 14:21:31
4	test	Test message	73	2023-10-10 10:43:11	2023-10-10 14:43:11
5	yes	test mesage from driver apo	83	2023-10-10 21:19:37	2023-10-11 01:19:37
6	hello	messages	85	2023-10-18 12:11:37	2023-10-18 16:11:37
7	shipme t	okay	108	2023-10-25 12:42:34	2023-10-25 16:42:34
8	gg	test	97	2023-11-13 14:27:30	2023-11-13 18:27:30
9	test	test1234	97	2023-11-13 14:27:54	2023-11-13 18:27:54
10	hhh	bbbh	139	2023-11-14 13:59:49	2023-11-14 17:59:49
11	tesr	tesr	168	2023-11-18 06:06:51	2023-11-18 10:06:51
12	time	uuyttert to the application link for the update on	169	2023-11-18 06:53:25	2023-11-18 10:53:25
13	NB testing	okay sir thanks	175	2023-11-19 05:25:15	2023-11-19 09:25:15
14	support	okay sir thanks for the update	177	2023-11-19 05:45:23	2023-11-19 09:45:23
15	support m	okay sir thanks for the update	178	2023-11-19 05:49:54	2023-11-19 09:49:54
16	ok	okj	179	2023-11-20 04:41:01	2023-11-20 08:41:01
17	okk	ok jii	178	2023-11-20 08:55:21	2023-11-20 08:55:21
18	Subject	notes by click on the	184	2023-11-21 11:28:00	2023-11-21 11:28:00
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
26	2023_04_15_184036_add_foreign_key_contraint_user_roles	1
27	2023_04_15_184120_add_foreign_key_contraint_driver_details	1
28	2023_04_15_190029_add_foreign_key_contraint_deligate_attributes	1
29	2023_04_15_190126_add_foreign_key_contraint_bookings	1
30	2023_04_15_190145_add_foreign_key_contraint_booking_qoutes	1
31	2023_04_15_190208_add_foreign_key_contraint_booking_reviews	1
32	2023_04_15_190256_add_foreign_key_contraint_user_wallets	1
33	2023_04_17_125531_create_driver_types_table	1
34	2023_04_17_193740_add_column_address_table	1
35	2023_04_18_192604_change_column_data_types	1
36	2023_04_18_193410_change_column_data_booking_qoutes_types	1
37	2023_04_19_140056_create_new_notifications_table	1
38	2023_04_19_165518_add_column_bookings_table	1
39	2023_04_19_165705_add_profile_image_users_table	1
40	2023_04_19_172013_add_commission_column_booking_qoutes	1
41	2023_04_19_184759_add_title_to_new_notificationa_table	1
42	2023_04_20_110505_add_column_deligate_attriibutes	1
43	2023_04_20_151756_add_column_is_admin_approved_in_booking_qoutes	1
44	2023_04_20_155036_add_location_to_driver_details_table	1
45	2023_04_21_140650_add_image_new_notifications	1
46	2023_04_24_200623_add_column_slug_deligates_table	1
47	2023_04_25_193443_add_column_total_amount_bookings	1
48	2023_04_26_120859_add_status_to_new_notifications_table	1
49	2023_04_27_110802_add_status_to_booking_reviews_table	1
50	2023_05_02_110342_add_paid_max_weight_in_tons_table	1
51	2023_05_16_092913_create_user_password_resets	1
52	2023_05_17_151418_add_column_user_table_is_admin_access	1
53	2023_05_17_160522_add_columns_lat_log_users	1
54	2023_05_17_224810_change_enum_values_in_reviews_table	1
55	2023_05_17_233635_add_column_booking_reviews_updated_by	1
56	2023_05_18_100623_add_colum_company_table_user_id	1
57	2023_05_18_151235_add_address_columns_users	1
58	2023_05_18_151349_add_documents_columns_driving_details	1
59	2023_05_19_121225_add_column_user_device_id_users	1
60	2023_05_19_121319_create_blacklist_tbale	1
61	2023_05_22_200422_create_shipping_methods_table	1
62	2023_05_22_225620_add_shipping_method_id_bookings	1
63	2023_05_22_234935_create_booking_charges_table	1
64	2023_05_24_052643_create_booking_status_trackings	1
65	2023_05_30_173001_add_license_expiry_companies	1
66	2023_05_31_080737_add_column_emirates_id_or_passport_back_driving_license	1
67	2023_05_31_084520_create_cities_table	1
68	2023_05_31_151832_add_column_received_amount_bookings	1
69	2023_06_01_203114_change_column_total_amount_type	1
70	2023_06_01_220716_change_customer_signature_column_type	1
71	2023_06_05_111123_remove_user_device_id_constraint	1
72	2023_06_05_125833_create_notification_users	1
73	2023_06_05_131348_change_new_notification_table	1
74	2023_06_06_130527_add_fcm_token_user	1
75	2023_06_07_104933_add_auth_columns_users	1
76	2023_07_20_144201_create_table_temp_users	1
77	2023_07_24_134806_create_booking_trucks	1
78	2023_07_24_135124_create_containers_table	1
79	2023_07_24_140240_create_booking_deligate_details	1
80	2023_07_24_143734_create_warehousing_details	1
81	2023_07_24_145213_create_accepted_qoutes	1
82	2023_07_24_164305_create_booking_containers	1
83	2023_07_24_170357_add_foreign_constraints_accepted_qoutes	1
84	2023_07_24_171012_add_foreign_constraints_warehousing_details	1
85	2023_07_24_171657_add_foreign_constraints_booking_deligate_details	1
86	2023_07_24_171801_add_foreign_constraints_booking_trucks	1
87	2023_07_24_171824_add_foreign_constraints_booking_containers	1
88	2023_07_26_165803_add_license_column	2
90	2023_07_26_204921_change_foreign_constratint_in_driver_details	3
91	2023_07_27_005234_add_shipping_method_id_bookings	4
93	2023_07_27_132246_create_booking_truck_alot	5
96	2023_07_28_170447_add_colum_number_of_pallet	6
97	2023_08_02_072124_add_booking_truck_id_booking_qoutes	7
98	2023_08_03_133823_add_total_qoutation_amount	8
99	2023_08_03_145327_change_booking_status_types	9
100	2023_08_03_160714_change_booking_status_tracking_types	10
101	2023_08_03_174106_add_booking_truck_id_accepted_qoutes	11
102	2023_08_04_093808_create_storage_types	12
103	2023_08_05_121629_create_addresses_table	13
104	2023_08_05_155103_add_colum_is_deleted_addresses	14
107	2023_08_06_231220_create_cart_bookings_table	15
108	2023_08_06_231456_create_booking_truck_carts	15
109	2023_08_07_150853_add_addresses_column_bookings	16
113	2023_08_07_214828_add_device_cart_id	17
114	2023_08_07_215045_change_gross_weight_datatype	17
115	2023_08_07_215252_change_gross_weight_datatype	17
116	2023_08_08_114635_create_booking_cart_deligate_details	18
117	2023_08_08_125111_change_column_datatype_total_volume_in_cbm	18
118	2023_08_09_104844_create_cart_warehousing_details	19
119	2023_08_10_111620_add_qouted_at_booking_qoutes	19
120	2023_08_15_211619_add_driver_id_booking_status_track	19
121	2023_08_15_221213_change_statues_tracking	19
122	2023_08_16_111730_add_booking_number_booking_carts	19
123	2023_08_16_193057_add_phone_columns_addresses	19
124	2023_08_16_195925_add_phone_bookings	19
125	2023_08_16_204553_add_addres_2_column_temp_users	19
126	2023_08_18_100543_change_phone_data_type	20
127	2023_08_19_163040_add_columns_accepted_qoutes	21
128	2023_10_04_111219_change_temp_users_add_more	22
129	2023_10_05_095040_change_users_add_country_city_ids	22
130	2023_10_10_080203_change_address_add_building	23
131	2023_10_10_085446_change_user_add_trade_license	24
132	2023_10_10_094153_create_app_settings	25
133	2023_10_10_101402_create_help_request	26
134	2023_10_10_103635_create_faq	27
135	2023_10_16_140200_change_users_add_temp_users	28
136	2023_10_17_101745_change_bookings_add_statuscode	29
137	2023_10_19_113028_change_booking_reviews_change_rate	30
138	2023_10_20_110511_create_settings	31
139	2023_10_20_140526_change_faq_add_usertype	32
140	2023_10_20_151316_change_faq_add_usertype	33
141	2023_10_20_163101_change_temp_users_change_lat_long	34
142	2023_10_24_082422_change_table_containers	35
143	2023_10_24_093927_change_boking_statustracking_add_statuccode	35
144	2023_10_24_100418_change_bookibgstatustracking_add_quote_id	35
145	2023_10_24_142859_change_bookings_add_parent_booking_id	36
146	2023_10_24_145548_change_booking_cart_add_parent_id	37
147	2023_10_26_155122_change_truck_types_add_is_container	38
148	2023_11_09_172443_collection_address_id	39
149	2023_11_15_103845_admin_designation	40
150	2023_11_15_104736_user_privileges	40
151	2023_11_15_134053_designation_id	41
152	2023_11_18_193652_upload_doc	41
153	2023_11_20_004642_change_tracking_status_type_in_order_trackings	42
154	2023_11_20_095855_change_tracking_status_new_types_in_order_tracking	43
155	2023_11_20_100953_add_column_in_bookings	43
156	2023_11_29_105726_change_user_add_addional_phone	44
157	2023_11_29_111940_create_user_additional_phone	44
158	2023_11_29_160605_change_cart_deliegate__details_add_num_pallers	45
159	2023_11_29_170103_change_trucktype_add_sort	46
160	2023_11_30_090617_change_accepted_quote_add_deliverynote_doc	47
161	2023_11_30_113826_change_booking_add_admin_can-accpt_quote	48
162	2023_11_30_152313_change_booking_carts_add_warehouse_datedetails	49
163	2023_11_30_155125_add_extra_booking_charges	50
164	2023_11_30_164146_change_accepted_quote_add_driver_advance_amount	50
165	2023_12_01_142126_change_booking_add_shipmenttype	51
166	2023_12_02_093427_change_users_add_ddefault_dialcode	52
\.


--
-- Data for Name: notification_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notification_users (id, notification_id, user_id, created_at, updated_at) FROM stdin;
1	1	114	2023-11-13 14:49:28	2023-11-13 14:49:28
2	1	97	2023-11-13 14:49:28	2023-11-13 14:49:28
3	2	114	2023-11-15 08:26:09	2023-11-15 08:26:09
4	2	145	2023-11-15 08:26:09	2023-11-15 08:26:09
5	3	114	2023-11-15 08:38:05	2023-11-15 08:38:05
6	3	145	2023-11-15 08:38:05	2023-11-15 08:38:05
7	3	83	2023-11-15 08:38:05	2023-11-15 08:38:05
8	3	97	2023-11-15 08:38:05	2023-11-15 08:38:05
9	3	137	2023-11-15 08:38:05	2023-11-15 08:38:05
10	3	123	2023-11-15 08:38:05	2023-11-15 08:38:05
11	3	129	2023-11-15 08:38:05	2023-11-15 08:38:05
12	3	38	2023-11-15 08:38:05	2023-11-15 08:38:05
13	3	42	2023-11-15 08:38:05	2023-11-15 08:38:05
14	3	115	2023-11-15 08:38:05	2023-11-15 08:38:05
15	3	124	2023-11-15 08:38:05	2023-11-15 08:38:05
16	3	146	2023-11-15 08:38:05	2023-11-15 08:38:05
17	3	133	2023-11-15 08:38:05	2023-11-15 08:38:05
18	3	138	2023-11-15 08:38:05	2023-11-15 08:38:05
19	3	130	2023-11-15 08:38:05	2023-11-15 08:38:05
20	3	141	2023-11-15 08:38:05	2023-11-15 08:38:05
21	3	41	2023-11-15 08:38:05	2023-11-15 08:38:05
22	3	43	2023-11-15 08:38:05	2023-11-15 08:38:05
23	3	45	2023-11-15 08:38:05	2023-11-15 08:38:05
24	3	48	2023-11-15 08:38:05	2023-11-15 08:38:05
25	3	116	2023-11-15 08:38:05	2023-11-15 08:38:05
26	3	142	2023-11-15 08:38:05	2023-11-15 08:38:05
27	3	125	2023-11-15 08:38:05	2023-11-15 08:38:05
28	3	39	2023-11-15 08:38:05	2023-11-15 08:38:05
29	3	134	2023-11-15 08:38:05	2023-11-15 08:38:05
30	3	47	2023-11-15 08:38:05	2023-11-15 08:38:05
31	3	139	2023-11-15 08:38:05	2023-11-15 08:38:05
32	3	50	2023-11-15 08:38:05	2023-11-15 08:38:05
33	3	40	2023-11-15 08:38:05	2023-11-15 08:38:05
34	3	51	2023-11-15 08:38:05	2023-11-15 08:38:05
35	3	37	2023-11-15 08:38:05	2023-11-15 08:38:05
36	3	49	2023-11-15 08:38:05	2023-11-15 08:38:05
37	3	46	2023-11-15 08:38:05	2023-11-15 08:38:05
38	3	44	2023-11-15 08:38:05	2023-11-15 08:38:05
39	3	52	2023-11-15 08:38:05	2023-11-15 08:38:05
40	3	61	2023-11-15 08:38:05	2023-11-15 08:38:05
41	3	57	2023-11-15 08:38:05	2023-11-15 08:38:05
42	3	53	2023-11-15 08:38:05	2023-11-15 08:38:05
43	3	54	2023-11-15 08:38:05	2023-11-15 08:38:05
44	3	65	2023-11-15 08:38:05	2023-11-15 08:38:05
45	3	63	2023-11-15 08:38:05	2023-11-15 08:38:05
46	3	55	2023-11-15 08:38:05	2023-11-15 08:38:05
47	3	62	2023-11-15 08:38:05	2023-11-15 08:38:05
48	3	60	2023-11-15 08:38:05	2023-11-15 08:38:05
49	3	56	2023-11-15 08:38:05	2023-11-15 08:38:05
50	3	59	2023-11-15 08:38:05	2023-11-15 08:38:05
51	3	66	2023-11-15 08:38:05	2023-11-15 08:38:05
52	3	64	2023-11-15 08:38:05	2023-11-15 08:38:05
53	3	58	2023-11-15 08:38:05	2023-11-15 08:38:05
54	3	67	2023-11-15 08:38:05	2023-11-15 08:38:05
55	3	148	2023-11-15 08:38:05	2023-11-15 08:38:05
56	3	68	2023-11-15 08:38:05	2023-11-15 08:38:05
57	3	69	2023-11-15 08:38:05	2023-11-15 08:38:05
58	3	72	2023-11-15 08:38:05	2023-11-15 08:38:05
59	3	76	2023-11-15 08:38:05	2023-11-15 08:38:05
60	3	70	2023-11-15 08:38:05	2023-11-15 08:38:05
61	3	79	2023-11-15 08:38:05	2023-11-15 08:38:05
62	3	75	2023-11-15 08:38:05	2023-11-15 08:38:05
63	3	78	2023-11-15 08:38:05	2023-11-15 08:38:05
64	3	77	2023-11-15 08:38:05	2023-11-15 08:38:05
65	3	80	2023-11-15 08:38:05	2023-11-15 08:38:05
66	3	81	2023-11-15 08:38:05	2023-11-15 08:38:05
67	3	82	2023-11-15 08:38:05	2023-11-15 08:38:05
68	3	71	2023-11-15 08:38:05	2023-11-15 08:38:05
69	3	84	2023-11-15 08:38:05	2023-11-15 08:38:05
70	3	85	2023-11-15 08:38:05	2023-11-15 08:38:05
71	3	74	2023-11-15 08:38:05	2023-11-15 08:38:05
72	3	117	2023-11-15 08:38:05	2023-11-15 08:38:05
73	3	135	2023-11-15 08:38:05	2023-11-15 08:38:05
74	3	126	2023-11-15 08:38:05	2023-11-15 08:38:05
75	3	143	2023-11-15 08:38:05	2023-11-15 08:38:05
76	3	153	2023-11-15 08:38:05	2023-11-15 08:38:05
77	3	95	2023-11-15 08:38:05	2023-11-15 08:38:05
78	3	89	2023-11-15 08:38:05	2023-11-15 08:38:05
79	3	92	2023-11-15 08:38:05	2023-11-15 08:38:05
80	3	127	2023-11-15 08:38:05	2023-11-15 08:38:05
81	3	91	2023-11-15 08:38:05	2023-11-15 08:38:05
82	3	86	2023-11-15 08:38:05	2023-11-15 08:38:05
83	3	88	2023-11-15 08:38:05	2023-11-15 08:38:05
84	3	87	2023-11-15 08:38:05	2023-11-15 08:38:05
85	3	94	2023-11-15 08:38:05	2023-11-15 08:38:05
86	3	96	2023-11-15 08:38:05	2023-11-15 08:38:05
87	3	118	2023-11-15 08:38:05	2023-11-15 08:38:05
88	3	90	2023-11-15 08:38:05	2023-11-15 08:38:05
89	3	93	2023-11-15 08:38:05	2023-11-15 08:38:05
90	3	16	2023-11-15 08:38:05	2023-11-15 08:38:05
91	3	121	2023-11-15 08:38:05	2023-11-15 08:38:05
92	3	106	2023-11-15 08:38:05	2023-11-15 08:38:05
93	3	101	2023-11-15 08:38:05	2023-11-15 08:38:05
94	3	98	2023-11-15 08:38:05	2023-11-15 08:38:05
95	3	105	2023-11-15 08:38:05	2023-11-15 08:38:05
96	3	100	2023-11-15 08:38:05	2023-11-15 08:38:05
97	3	99	2023-11-15 08:38:05	2023-11-15 08:38:05
98	3	102	2023-11-15 08:38:05	2023-11-15 08:38:05
99	3	103	2023-11-15 08:38:05	2023-11-15 08:38:05
100	3	109	2023-11-15 08:38:05	2023-11-15 08:38:05
101	3	108	2023-11-15 08:38:05	2023-11-15 08:38:05
102	3	104	2023-11-15 08:38:05	2023-11-15 08:38:05
103	3	110	2023-11-15 08:38:05	2023-11-15 08:38:05
104	3	107	2023-11-15 08:38:05	2023-11-15 08:38:05
105	3	119	2023-11-15 08:38:05	2023-11-15 08:38:05
106	3	73	2023-11-15 08:38:05	2023-11-15 08:38:05
107	3	132	2023-11-15 08:38:05	2023-11-15 08:38:05
108	3	140	2023-11-15 08:38:05	2023-11-15 08:38:05
109	3	112	2023-11-15 08:38:05	2023-11-15 08:38:05
110	3	136	2023-11-15 08:38:05	2023-11-15 08:38:05
111	3	120	2023-11-15 08:38:05	2023-11-15 08:38:05
112	3	113	2023-11-15 08:38:05	2023-11-15 08:38:05
113	3	111	2023-11-15 08:38:05	2023-11-15 08:38:05
114	3	144	2023-11-15 08:38:05	2023-11-15 08:38:05
115	3	122	2023-11-15 08:38:05	2023-11-15 08:38:05
116	3	128	2023-11-15 08:38:05	2023-11-15 08:38:05
117	4	73	2023-11-16 13:48:11	2023-11-16 13:48:11
118	5	73	2023-11-16 14:23:02	2023-11-16 14:23:02
119	6	73	2023-11-16 14:23:13	2023-11-16 14:23:13
121	8	73	2023-11-16 14:24:16	2023-11-16 14:24:16
122	9	73	2023-11-16 14:25:34	2023-11-16 14:25:34
123	10	73	2023-11-16 14:26:46	2023-11-16 14:26:46
124	11	73	2023-11-16 14:27:20	2023-11-16 14:27:20
125	12	73	2023-11-16 14:29:03	2023-11-16 14:29:03
126	13	73	2023-11-16 14:31:16	2023-11-16 14:31:16
127	14	114	2023-11-16 14:32:45	2023-11-16 14:32:45
128	14	137	2023-11-16 14:32:45	2023-11-16 14:32:45
129	14	145	2023-11-16 14:32:45	2023-11-16 14:32:45
130	14	97	2023-11-16 14:32:45	2023-11-16 14:32:45
131	14	83	2023-11-16 14:32:45	2023-11-16 14:32:45
132	14	123	2023-11-16 14:32:45	2023-11-16 14:32:45
133	14	129	2023-11-16 14:32:45	2023-11-16 14:32:45
134	14	38	2023-11-16 14:32:45	2023-11-16 14:32:45
135	14	157	2023-11-16 14:32:45	2023-11-16 14:32:45
136	14	42	2023-11-16 14:32:45	2023-11-16 14:32:45
137	14	115	2023-11-16 14:32:45	2023-11-16 14:32:45
138	14	124	2023-11-16 14:32:45	2023-11-16 14:32:45
139	14	133	2023-11-16 14:32:45	2023-11-16 14:32:45
140	14	138	2023-11-16 14:32:45	2023-11-16 14:32:45
141	14	146	2023-11-16 14:32:45	2023-11-16 14:32:45
142	14	130	2023-11-16 14:32:45	2023-11-16 14:32:45
143	14	141	2023-11-16 14:32:45	2023-11-16 14:32:45
144	14	158	2023-11-16 14:32:45	2023-11-16 14:32:45
145	14	41	2023-11-16 14:32:45	2023-11-16 14:32:45
146	14	43	2023-11-16 14:32:45	2023-11-16 14:32:45
147	14	45	2023-11-16 14:32:45	2023-11-16 14:32:45
148	14	48	2023-11-16 14:32:45	2023-11-16 14:32:45
149	14	159	2023-11-16 14:32:45	2023-11-16 14:32:45
150	14	116	2023-11-16 14:32:45	2023-11-16 14:32:45
151	14	142	2023-11-16 14:32:45	2023-11-16 14:32:45
152	14	125	2023-11-16 14:32:45	2023-11-16 14:32:45
153	14	39	2023-11-16 14:32:45	2023-11-16 14:32:45
154	14	134	2023-11-16 14:32:45	2023-11-16 14:32:45
155	14	47	2023-11-16 14:32:45	2023-11-16 14:32:45
156	14	139	2023-11-16 14:32:45	2023-11-16 14:32:45
157	14	50	2023-11-16 14:32:45	2023-11-16 14:32:45
158	14	40	2023-11-16 14:32:45	2023-11-16 14:32:45
159	14	51	2023-11-16 14:32:45	2023-11-16 14:32:45
160	14	37	2023-11-16 14:32:45	2023-11-16 14:32:45
161	14	49	2023-11-16 14:32:45	2023-11-16 14:32:45
162	14	46	2023-11-16 14:32:45	2023-11-16 14:32:45
163	14	44	2023-11-16 14:32:45	2023-11-16 14:32:45
164	14	52	2023-11-16 14:32:45	2023-11-16 14:32:45
165	14	61	2023-11-16 14:32:45	2023-11-16 14:32:45
166	14	57	2023-11-16 14:32:45	2023-11-16 14:32:45
167	14	53	2023-11-16 14:32:45	2023-11-16 14:32:45
168	14	54	2023-11-16 14:32:45	2023-11-16 14:32:45
169	14	65	2023-11-16 14:32:45	2023-11-16 14:32:45
170	14	63	2023-11-16 14:32:45	2023-11-16 14:32:45
171	14	55	2023-11-16 14:32:45	2023-11-16 14:32:45
172	14	62	2023-11-16 14:32:45	2023-11-16 14:32:45
173	14	60	2023-11-16 14:32:45	2023-11-16 14:32:45
174	14	56	2023-11-16 14:32:45	2023-11-16 14:32:45
175	14	59	2023-11-16 14:32:45	2023-11-16 14:32:45
176	14	66	2023-11-16 14:32:45	2023-11-16 14:32:45
177	14	64	2023-11-16 14:32:45	2023-11-16 14:32:45
178	14	58	2023-11-16 14:32:45	2023-11-16 14:32:45
179	14	67	2023-11-16 14:32:45	2023-11-16 14:32:45
180	14	148	2023-11-16 14:32:45	2023-11-16 14:32:45
181	14	68	2023-11-16 14:32:45	2023-11-16 14:32:45
182	14	69	2023-11-16 14:32:45	2023-11-16 14:32:45
183	14	72	2023-11-16 14:32:45	2023-11-16 14:32:45
184	14	76	2023-11-16 14:32:45	2023-11-16 14:32:45
185	14	70	2023-11-16 14:32:45	2023-11-16 14:32:45
186	14	79	2023-11-16 14:32:45	2023-11-16 14:32:45
187	14	75	2023-11-16 14:32:45	2023-11-16 14:32:45
188	14	78	2023-11-16 14:32:45	2023-11-16 14:32:45
189	14	77	2023-11-16 14:32:45	2023-11-16 14:32:45
190	14	80	2023-11-16 14:32:45	2023-11-16 14:32:45
191	14	81	2023-11-16 14:32:45	2023-11-16 14:32:45
192	14	82	2023-11-16 14:32:45	2023-11-16 14:32:45
193	14	71	2023-11-16 14:32:45	2023-11-16 14:32:45
194	14	84	2023-11-16 14:32:45	2023-11-16 14:32:45
195	14	85	2023-11-16 14:32:45	2023-11-16 14:32:45
196	14	74	2023-11-16 14:32:45	2023-11-16 14:32:45
197	14	117	2023-11-16 14:32:45	2023-11-16 14:32:45
198	14	135	2023-11-16 14:32:45	2023-11-16 14:32:45
199	14	126	2023-11-16 14:32:45	2023-11-16 14:32:45
200	14	143	2023-11-16 14:32:45	2023-11-16 14:32:45
201	14	153	2023-11-16 14:32:45	2023-11-16 14:32:45
202	14	95	2023-11-16 14:32:45	2023-11-16 14:32:45
203	14	92	2023-11-16 14:32:45	2023-11-16 14:32:45
204	14	127	2023-11-16 14:32:45	2023-11-16 14:32:45
205	14	91	2023-11-16 14:32:45	2023-11-16 14:32:45
206	14	86	2023-11-16 14:32:45	2023-11-16 14:32:45
207	14	88	2023-11-16 14:32:45	2023-11-16 14:32:45
208	14	87	2023-11-16 14:32:45	2023-11-16 14:32:45
209	14	94	2023-11-16 14:32:45	2023-11-16 14:32:45
210	14	96	2023-11-16 14:32:45	2023-11-16 14:32:45
211	14	89	2023-11-16 14:32:45	2023-11-16 14:32:45
212	14	118	2023-11-16 14:32:45	2023-11-16 14:32:45
213	14	90	2023-11-16 14:32:45	2023-11-16 14:32:45
214	14	154	2023-11-16 14:32:45	2023-11-16 14:32:45
215	14	93	2023-11-16 14:32:45	2023-11-16 14:32:45
216	14	155	2023-11-16 14:32:45	2023-11-16 14:32:45
217	14	16	2023-11-16 14:32:45	2023-11-16 14:32:45
218	14	121	2023-11-16 14:32:45	2023-11-16 14:32:45
219	14	106	2023-11-16 14:32:45	2023-11-16 14:32:45
220	14	101	2023-11-16 14:32:45	2023-11-16 14:32:45
221	14	98	2023-11-16 14:32:45	2023-11-16 14:32:45
222	14	105	2023-11-16 14:32:45	2023-11-16 14:32:45
223	14	100	2023-11-16 14:32:45	2023-11-16 14:32:45
224	14	99	2023-11-16 14:32:45	2023-11-16 14:32:45
225	14	102	2023-11-16 14:32:45	2023-11-16 14:32:45
226	14	103	2023-11-16 14:32:45	2023-11-16 14:32:45
227	14	73	2023-11-16 14:32:45	2023-11-16 14:32:45
228	14	109	2023-11-16 14:32:45	2023-11-16 14:32:45
229	14	108	2023-11-16 14:32:45	2023-11-16 14:32:45
230	14	104	2023-11-16 14:32:45	2023-11-16 14:32:45
231	14	110	2023-11-16 14:32:45	2023-11-16 14:32:45
232	14	107	2023-11-16 14:32:45	2023-11-16 14:32:45
233	14	119	2023-11-16 14:32:45	2023-11-16 14:32:45
234	14	132	2023-11-16 14:32:45	2023-11-16 14:32:45
235	14	140	2023-11-16 14:32:45	2023-11-16 14:32:45
236	14	156	2023-11-16 14:32:45	2023-11-16 14:32:45
237	14	112	2023-11-16 14:32:45	2023-11-16 14:32:45
238	14	136	2023-11-16 14:32:45	2023-11-16 14:32:45
239	14	120	2023-11-16 14:32:45	2023-11-16 14:32:45
240	14	113	2023-11-16 14:32:45	2023-11-16 14:32:45
241	14	111	2023-11-16 14:32:45	2023-11-16 14:32:45
242	14	144	2023-11-16 14:32:45	2023-11-16 14:32:45
243	14	122	2023-11-16 14:32:45	2023-11-16 14:32:45
244	14	128	2023-11-16 14:32:45	2023-11-16 14:32:45
245	15	114	2023-11-16 14:34:02	2023-11-16 14:34:02
246	15	137	2023-11-16 14:34:02	2023-11-16 14:34:02
247	15	145	2023-11-16 14:34:02	2023-11-16 14:34:02
248	15	97	2023-11-16 14:34:02	2023-11-16 14:34:02
249	15	83	2023-11-16 14:34:02	2023-11-16 14:34:02
250	15	123	2023-11-16 14:34:02	2023-11-16 14:34:02
251	15	129	2023-11-16 14:34:02	2023-11-16 14:34:02
252	15	38	2023-11-16 14:34:02	2023-11-16 14:34:02
253	15	157	2023-11-16 14:34:02	2023-11-16 14:34:02
254	15	42	2023-11-16 14:34:02	2023-11-16 14:34:02
255	15	115	2023-11-16 14:34:02	2023-11-16 14:34:02
256	15	124	2023-11-16 14:34:02	2023-11-16 14:34:02
257	15	133	2023-11-16 14:34:02	2023-11-16 14:34:02
258	15	138	2023-11-16 14:34:02	2023-11-16 14:34:02
259	15	146	2023-11-16 14:34:02	2023-11-16 14:34:02
260	15	130	2023-11-16 14:34:02	2023-11-16 14:34:02
261	15	141	2023-11-16 14:34:02	2023-11-16 14:34:02
262	15	158	2023-11-16 14:34:02	2023-11-16 14:34:02
263	15	41	2023-11-16 14:34:02	2023-11-16 14:34:02
264	15	43	2023-11-16 14:34:02	2023-11-16 14:34:02
265	15	45	2023-11-16 14:34:02	2023-11-16 14:34:02
266	15	48	2023-11-16 14:34:02	2023-11-16 14:34:02
267	15	159	2023-11-16 14:34:02	2023-11-16 14:34:02
268	15	116	2023-11-16 14:34:02	2023-11-16 14:34:02
269	15	142	2023-11-16 14:34:02	2023-11-16 14:34:02
270	15	125	2023-11-16 14:34:02	2023-11-16 14:34:02
271	15	39	2023-11-16 14:34:02	2023-11-16 14:34:02
272	15	134	2023-11-16 14:34:02	2023-11-16 14:34:02
273	15	47	2023-11-16 14:34:02	2023-11-16 14:34:02
274	15	139	2023-11-16 14:34:02	2023-11-16 14:34:02
275	15	50	2023-11-16 14:34:02	2023-11-16 14:34:02
276	15	40	2023-11-16 14:34:02	2023-11-16 14:34:02
277	15	51	2023-11-16 14:34:02	2023-11-16 14:34:02
278	15	37	2023-11-16 14:34:02	2023-11-16 14:34:02
279	15	49	2023-11-16 14:34:02	2023-11-16 14:34:02
280	15	46	2023-11-16 14:34:02	2023-11-16 14:34:02
281	15	44	2023-11-16 14:34:02	2023-11-16 14:34:02
282	15	52	2023-11-16 14:34:02	2023-11-16 14:34:02
283	15	61	2023-11-16 14:34:02	2023-11-16 14:34:02
284	15	57	2023-11-16 14:34:02	2023-11-16 14:34:02
285	15	53	2023-11-16 14:34:02	2023-11-16 14:34:02
286	15	54	2023-11-16 14:34:02	2023-11-16 14:34:02
287	15	65	2023-11-16 14:34:02	2023-11-16 14:34:02
288	15	63	2023-11-16 14:34:02	2023-11-16 14:34:02
289	15	55	2023-11-16 14:34:02	2023-11-16 14:34:02
290	15	62	2023-11-16 14:34:02	2023-11-16 14:34:02
291	15	60	2023-11-16 14:34:02	2023-11-16 14:34:02
292	15	56	2023-11-16 14:34:02	2023-11-16 14:34:02
293	15	59	2023-11-16 14:34:02	2023-11-16 14:34:02
294	15	66	2023-11-16 14:34:02	2023-11-16 14:34:02
295	15	64	2023-11-16 14:34:02	2023-11-16 14:34:02
296	15	58	2023-11-16 14:34:02	2023-11-16 14:34:02
297	15	67	2023-11-16 14:34:02	2023-11-16 14:34:02
298	15	148	2023-11-16 14:34:02	2023-11-16 14:34:02
299	15	68	2023-11-16 14:34:02	2023-11-16 14:34:02
300	15	69	2023-11-16 14:34:02	2023-11-16 14:34:02
301	15	72	2023-11-16 14:34:02	2023-11-16 14:34:02
302	15	76	2023-11-16 14:34:02	2023-11-16 14:34:02
303	15	70	2023-11-16 14:34:02	2023-11-16 14:34:02
304	15	79	2023-11-16 14:34:02	2023-11-16 14:34:02
305	15	75	2023-11-16 14:34:02	2023-11-16 14:34:02
306	15	78	2023-11-16 14:34:02	2023-11-16 14:34:02
307	15	77	2023-11-16 14:34:02	2023-11-16 14:34:02
308	15	80	2023-11-16 14:34:02	2023-11-16 14:34:02
309	15	81	2023-11-16 14:34:02	2023-11-16 14:34:02
310	15	82	2023-11-16 14:34:02	2023-11-16 14:34:02
311	15	71	2023-11-16 14:34:02	2023-11-16 14:34:02
312	15	84	2023-11-16 14:34:02	2023-11-16 14:34:02
313	15	85	2023-11-16 14:34:02	2023-11-16 14:34:02
314	15	74	2023-11-16 14:34:02	2023-11-16 14:34:02
315	15	117	2023-11-16 14:34:02	2023-11-16 14:34:02
316	15	135	2023-11-16 14:34:02	2023-11-16 14:34:02
317	15	126	2023-11-16 14:34:02	2023-11-16 14:34:02
318	15	143	2023-11-16 14:34:02	2023-11-16 14:34:02
319	15	153	2023-11-16 14:34:02	2023-11-16 14:34:02
320	15	95	2023-11-16 14:34:02	2023-11-16 14:34:02
321	15	92	2023-11-16 14:34:02	2023-11-16 14:34:02
322	15	127	2023-11-16 14:34:02	2023-11-16 14:34:02
323	15	91	2023-11-16 14:34:02	2023-11-16 14:34:02
324	15	86	2023-11-16 14:34:02	2023-11-16 14:34:02
325	15	88	2023-11-16 14:34:02	2023-11-16 14:34:02
326	15	87	2023-11-16 14:34:02	2023-11-16 14:34:02
327	15	94	2023-11-16 14:34:02	2023-11-16 14:34:02
328	15	96	2023-11-16 14:34:02	2023-11-16 14:34:02
329	15	89	2023-11-16 14:34:02	2023-11-16 14:34:02
330	15	118	2023-11-16 14:34:02	2023-11-16 14:34:02
331	15	90	2023-11-16 14:34:02	2023-11-16 14:34:02
332	15	154	2023-11-16 14:34:02	2023-11-16 14:34:02
333	15	93	2023-11-16 14:34:02	2023-11-16 14:34:02
334	15	155	2023-11-16 14:34:02	2023-11-16 14:34:02
335	15	16	2023-11-16 14:34:02	2023-11-16 14:34:02
336	15	121	2023-11-16 14:34:02	2023-11-16 14:34:02
337	15	106	2023-11-16 14:34:02	2023-11-16 14:34:02
338	15	101	2023-11-16 14:34:02	2023-11-16 14:34:02
339	15	98	2023-11-16 14:34:02	2023-11-16 14:34:02
340	15	105	2023-11-16 14:34:02	2023-11-16 14:34:02
341	15	100	2023-11-16 14:34:02	2023-11-16 14:34:02
342	15	99	2023-11-16 14:34:02	2023-11-16 14:34:02
343	15	102	2023-11-16 14:34:02	2023-11-16 14:34:02
344	15	103	2023-11-16 14:34:02	2023-11-16 14:34:02
345	15	73	2023-11-16 14:34:02	2023-11-16 14:34:02
346	15	109	2023-11-16 14:34:02	2023-11-16 14:34:02
347	15	108	2023-11-16 14:34:02	2023-11-16 14:34:02
348	15	104	2023-11-16 14:34:02	2023-11-16 14:34:02
349	15	110	2023-11-16 14:34:02	2023-11-16 14:34:02
350	15	107	2023-11-16 14:34:02	2023-11-16 14:34:02
351	15	119	2023-11-16 14:34:02	2023-11-16 14:34:02
352	15	132	2023-11-16 14:34:02	2023-11-16 14:34:02
353	15	140	2023-11-16 14:34:02	2023-11-16 14:34:02
354	15	156	2023-11-16 14:34:02	2023-11-16 14:34:02
355	15	112	2023-11-16 14:34:02	2023-11-16 14:34:02
356	15	136	2023-11-16 14:34:02	2023-11-16 14:34:02
357	15	120	2023-11-16 14:34:02	2023-11-16 14:34:02
358	15	113	2023-11-16 14:34:02	2023-11-16 14:34:02
359	15	111	2023-11-16 14:34:02	2023-11-16 14:34:02
360	15	144	2023-11-16 14:34:02	2023-11-16 14:34:02
361	15	122	2023-11-16 14:34:02	2023-11-16 14:34:02
362	15	128	2023-11-16 14:34:02	2023-11-16 14:34:02
363	16	114	2023-11-16 14:34:20	2023-11-16 14:34:20
364	16	137	2023-11-16 14:34:20	2023-11-16 14:34:20
365	16	145	2023-11-16 14:34:20	2023-11-16 14:34:20
366	16	97	2023-11-16 14:34:20	2023-11-16 14:34:20
367	16	83	2023-11-16 14:34:20	2023-11-16 14:34:20
368	16	123	2023-11-16 14:34:20	2023-11-16 14:34:20
369	16	129	2023-11-16 14:34:20	2023-11-16 14:34:20
370	16	38	2023-11-16 14:34:20	2023-11-16 14:34:20
371	16	157	2023-11-16 14:34:20	2023-11-16 14:34:20
372	16	42	2023-11-16 14:34:20	2023-11-16 14:34:20
373	16	115	2023-11-16 14:34:20	2023-11-16 14:34:20
374	16	124	2023-11-16 14:34:20	2023-11-16 14:34:20
375	16	133	2023-11-16 14:34:20	2023-11-16 14:34:20
376	16	138	2023-11-16 14:34:20	2023-11-16 14:34:20
377	16	146	2023-11-16 14:34:20	2023-11-16 14:34:20
378	16	130	2023-11-16 14:34:20	2023-11-16 14:34:20
379	16	141	2023-11-16 14:34:20	2023-11-16 14:34:20
380	16	158	2023-11-16 14:34:20	2023-11-16 14:34:20
381	16	41	2023-11-16 14:34:20	2023-11-16 14:34:20
382	16	43	2023-11-16 14:34:20	2023-11-16 14:34:20
383	16	45	2023-11-16 14:34:20	2023-11-16 14:34:20
384	16	48	2023-11-16 14:34:20	2023-11-16 14:34:20
385	16	159	2023-11-16 14:34:20	2023-11-16 14:34:20
386	16	116	2023-11-16 14:34:20	2023-11-16 14:34:20
387	16	142	2023-11-16 14:34:20	2023-11-16 14:34:20
388	16	125	2023-11-16 14:34:20	2023-11-16 14:34:20
389	16	39	2023-11-16 14:34:20	2023-11-16 14:34:20
390	16	134	2023-11-16 14:34:20	2023-11-16 14:34:20
391	16	47	2023-11-16 14:34:20	2023-11-16 14:34:20
392	16	139	2023-11-16 14:34:20	2023-11-16 14:34:20
393	16	50	2023-11-16 14:34:20	2023-11-16 14:34:20
394	16	40	2023-11-16 14:34:20	2023-11-16 14:34:20
395	16	51	2023-11-16 14:34:20	2023-11-16 14:34:20
396	16	37	2023-11-16 14:34:20	2023-11-16 14:34:20
397	16	49	2023-11-16 14:34:20	2023-11-16 14:34:20
398	16	46	2023-11-16 14:34:20	2023-11-16 14:34:20
399	16	44	2023-11-16 14:34:20	2023-11-16 14:34:20
400	16	52	2023-11-16 14:34:20	2023-11-16 14:34:20
401	16	61	2023-11-16 14:34:20	2023-11-16 14:34:20
402	16	57	2023-11-16 14:34:20	2023-11-16 14:34:20
403	16	53	2023-11-16 14:34:20	2023-11-16 14:34:20
404	16	54	2023-11-16 14:34:20	2023-11-16 14:34:20
405	16	65	2023-11-16 14:34:20	2023-11-16 14:34:20
406	16	63	2023-11-16 14:34:20	2023-11-16 14:34:20
407	16	55	2023-11-16 14:34:20	2023-11-16 14:34:20
408	16	62	2023-11-16 14:34:20	2023-11-16 14:34:20
409	16	60	2023-11-16 14:34:20	2023-11-16 14:34:20
410	16	56	2023-11-16 14:34:20	2023-11-16 14:34:20
411	16	59	2023-11-16 14:34:20	2023-11-16 14:34:20
412	16	66	2023-11-16 14:34:20	2023-11-16 14:34:20
413	16	64	2023-11-16 14:34:20	2023-11-16 14:34:20
414	16	58	2023-11-16 14:34:20	2023-11-16 14:34:20
415	16	67	2023-11-16 14:34:20	2023-11-16 14:34:20
416	16	148	2023-11-16 14:34:20	2023-11-16 14:34:20
417	16	68	2023-11-16 14:34:20	2023-11-16 14:34:20
418	16	69	2023-11-16 14:34:20	2023-11-16 14:34:20
419	16	72	2023-11-16 14:34:20	2023-11-16 14:34:20
420	16	76	2023-11-16 14:34:20	2023-11-16 14:34:20
421	16	70	2023-11-16 14:34:20	2023-11-16 14:34:20
422	16	79	2023-11-16 14:34:20	2023-11-16 14:34:20
423	16	75	2023-11-16 14:34:20	2023-11-16 14:34:20
424	16	78	2023-11-16 14:34:20	2023-11-16 14:34:20
425	16	77	2023-11-16 14:34:20	2023-11-16 14:34:20
426	16	80	2023-11-16 14:34:20	2023-11-16 14:34:20
427	16	81	2023-11-16 14:34:20	2023-11-16 14:34:20
428	16	82	2023-11-16 14:34:20	2023-11-16 14:34:20
429	16	71	2023-11-16 14:34:20	2023-11-16 14:34:20
430	16	84	2023-11-16 14:34:20	2023-11-16 14:34:20
431	16	85	2023-11-16 14:34:20	2023-11-16 14:34:20
432	16	74	2023-11-16 14:34:20	2023-11-16 14:34:20
433	16	117	2023-11-16 14:34:20	2023-11-16 14:34:20
434	16	135	2023-11-16 14:34:20	2023-11-16 14:34:20
435	16	126	2023-11-16 14:34:20	2023-11-16 14:34:20
436	16	143	2023-11-16 14:34:20	2023-11-16 14:34:20
437	16	153	2023-11-16 14:34:20	2023-11-16 14:34:20
438	16	95	2023-11-16 14:34:20	2023-11-16 14:34:20
439	16	92	2023-11-16 14:34:20	2023-11-16 14:34:20
440	16	127	2023-11-16 14:34:20	2023-11-16 14:34:20
441	16	91	2023-11-16 14:34:20	2023-11-16 14:34:20
442	16	86	2023-11-16 14:34:20	2023-11-16 14:34:20
443	16	88	2023-11-16 14:34:20	2023-11-16 14:34:20
444	16	87	2023-11-16 14:34:20	2023-11-16 14:34:20
445	16	94	2023-11-16 14:34:20	2023-11-16 14:34:20
446	16	96	2023-11-16 14:34:20	2023-11-16 14:34:20
447	16	89	2023-11-16 14:34:20	2023-11-16 14:34:20
448	16	118	2023-11-16 14:34:20	2023-11-16 14:34:20
449	16	90	2023-11-16 14:34:20	2023-11-16 14:34:20
450	16	154	2023-11-16 14:34:20	2023-11-16 14:34:20
451	16	93	2023-11-16 14:34:20	2023-11-16 14:34:20
452	16	155	2023-11-16 14:34:20	2023-11-16 14:34:20
453	16	16	2023-11-16 14:34:20	2023-11-16 14:34:20
454	16	121	2023-11-16 14:34:20	2023-11-16 14:34:20
455	16	106	2023-11-16 14:34:20	2023-11-16 14:34:20
456	16	101	2023-11-16 14:34:20	2023-11-16 14:34:20
457	16	98	2023-11-16 14:34:20	2023-11-16 14:34:20
458	16	105	2023-11-16 14:34:20	2023-11-16 14:34:20
459	16	100	2023-11-16 14:34:20	2023-11-16 14:34:20
460	16	99	2023-11-16 14:34:20	2023-11-16 14:34:20
461	16	102	2023-11-16 14:34:20	2023-11-16 14:34:20
462	16	103	2023-11-16 14:34:20	2023-11-16 14:34:20
463	16	73	2023-11-16 14:34:20	2023-11-16 14:34:20
464	16	109	2023-11-16 14:34:20	2023-11-16 14:34:20
465	16	108	2023-11-16 14:34:20	2023-11-16 14:34:20
466	16	104	2023-11-16 14:34:20	2023-11-16 14:34:20
467	16	110	2023-11-16 14:34:20	2023-11-16 14:34:20
468	16	107	2023-11-16 14:34:20	2023-11-16 14:34:20
469	16	119	2023-11-16 14:34:20	2023-11-16 14:34:20
470	16	132	2023-11-16 14:34:20	2023-11-16 14:34:20
471	16	140	2023-11-16 14:34:20	2023-11-16 14:34:20
472	16	156	2023-11-16 14:34:20	2023-11-16 14:34:20
473	16	112	2023-11-16 14:34:20	2023-11-16 14:34:20
474	16	136	2023-11-16 14:34:20	2023-11-16 14:34:20
475	16	120	2023-11-16 14:34:20	2023-11-16 14:34:20
476	16	113	2023-11-16 14:34:20	2023-11-16 14:34:20
477	16	111	2023-11-16 14:34:20	2023-11-16 14:34:20
478	16	144	2023-11-16 14:34:20	2023-11-16 14:34:20
479	16	122	2023-11-16 14:34:20	2023-11-16 14:34:20
480	16	128	2023-11-16 14:34:20	2023-11-16 14:34:20
481	17	114	2023-11-16 14:34:34	2023-11-16 14:34:34
482	17	137	2023-11-16 14:34:34	2023-11-16 14:34:34
483	17	145	2023-11-16 14:34:34	2023-11-16 14:34:34
484	17	97	2023-11-16 14:34:34	2023-11-16 14:34:34
485	17	83	2023-11-16 14:34:34	2023-11-16 14:34:34
486	17	123	2023-11-16 14:34:34	2023-11-16 14:34:34
487	17	129	2023-11-16 14:34:34	2023-11-16 14:34:34
488	17	38	2023-11-16 14:34:34	2023-11-16 14:34:34
489	17	157	2023-11-16 14:34:34	2023-11-16 14:34:34
490	17	42	2023-11-16 14:34:34	2023-11-16 14:34:34
491	17	115	2023-11-16 14:34:34	2023-11-16 14:34:34
492	17	124	2023-11-16 14:34:34	2023-11-16 14:34:34
493	17	133	2023-11-16 14:34:34	2023-11-16 14:34:34
494	17	138	2023-11-16 14:34:34	2023-11-16 14:34:34
495	17	146	2023-11-16 14:34:34	2023-11-16 14:34:34
496	17	130	2023-11-16 14:34:34	2023-11-16 14:34:34
497	17	141	2023-11-16 14:34:34	2023-11-16 14:34:34
498	17	158	2023-11-16 14:34:34	2023-11-16 14:34:34
499	17	41	2023-11-16 14:34:34	2023-11-16 14:34:34
500	17	43	2023-11-16 14:34:34	2023-11-16 14:34:34
501	17	45	2023-11-16 14:34:34	2023-11-16 14:34:34
502	17	48	2023-11-16 14:34:34	2023-11-16 14:34:34
503	17	159	2023-11-16 14:34:34	2023-11-16 14:34:34
504	17	116	2023-11-16 14:34:34	2023-11-16 14:34:34
505	17	142	2023-11-16 14:34:34	2023-11-16 14:34:34
506	17	125	2023-11-16 14:34:34	2023-11-16 14:34:34
507	17	39	2023-11-16 14:34:34	2023-11-16 14:34:34
508	17	134	2023-11-16 14:34:34	2023-11-16 14:34:34
509	17	47	2023-11-16 14:34:34	2023-11-16 14:34:34
510	17	139	2023-11-16 14:34:34	2023-11-16 14:34:34
511	17	50	2023-11-16 14:34:34	2023-11-16 14:34:34
512	17	40	2023-11-16 14:34:34	2023-11-16 14:34:34
513	17	51	2023-11-16 14:34:34	2023-11-16 14:34:34
514	17	37	2023-11-16 14:34:34	2023-11-16 14:34:34
515	17	49	2023-11-16 14:34:34	2023-11-16 14:34:34
516	17	46	2023-11-16 14:34:34	2023-11-16 14:34:34
517	17	44	2023-11-16 14:34:34	2023-11-16 14:34:34
518	17	52	2023-11-16 14:34:34	2023-11-16 14:34:34
519	17	61	2023-11-16 14:34:34	2023-11-16 14:34:34
520	17	57	2023-11-16 14:34:34	2023-11-16 14:34:34
521	17	53	2023-11-16 14:34:34	2023-11-16 14:34:34
522	17	54	2023-11-16 14:34:34	2023-11-16 14:34:34
523	17	65	2023-11-16 14:34:34	2023-11-16 14:34:34
524	17	63	2023-11-16 14:34:34	2023-11-16 14:34:34
525	17	55	2023-11-16 14:34:34	2023-11-16 14:34:34
526	17	62	2023-11-16 14:34:34	2023-11-16 14:34:34
527	17	60	2023-11-16 14:34:34	2023-11-16 14:34:34
528	17	56	2023-11-16 14:34:34	2023-11-16 14:34:34
529	17	59	2023-11-16 14:34:34	2023-11-16 14:34:34
530	17	66	2023-11-16 14:34:34	2023-11-16 14:34:34
531	17	64	2023-11-16 14:34:34	2023-11-16 14:34:34
532	17	58	2023-11-16 14:34:34	2023-11-16 14:34:34
533	17	67	2023-11-16 14:34:34	2023-11-16 14:34:34
534	17	148	2023-11-16 14:34:34	2023-11-16 14:34:34
535	17	68	2023-11-16 14:34:34	2023-11-16 14:34:34
536	17	69	2023-11-16 14:34:34	2023-11-16 14:34:34
537	17	72	2023-11-16 14:34:34	2023-11-16 14:34:34
538	17	76	2023-11-16 14:34:34	2023-11-16 14:34:34
539	17	70	2023-11-16 14:34:34	2023-11-16 14:34:34
540	17	79	2023-11-16 14:34:34	2023-11-16 14:34:34
541	17	75	2023-11-16 14:34:34	2023-11-16 14:34:34
542	17	78	2023-11-16 14:34:34	2023-11-16 14:34:34
543	17	77	2023-11-16 14:34:34	2023-11-16 14:34:34
544	17	80	2023-11-16 14:34:34	2023-11-16 14:34:34
545	17	81	2023-11-16 14:34:34	2023-11-16 14:34:34
546	17	82	2023-11-16 14:34:34	2023-11-16 14:34:34
547	17	71	2023-11-16 14:34:34	2023-11-16 14:34:34
548	17	84	2023-11-16 14:34:34	2023-11-16 14:34:34
549	17	85	2023-11-16 14:34:34	2023-11-16 14:34:34
550	17	74	2023-11-16 14:34:34	2023-11-16 14:34:34
551	17	117	2023-11-16 14:34:34	2023-11-16 14:34:34
552	17	135	2023-11-16 14:34:34	2023-11-16 14:34:34
553	17	126	2023-11-16 14:34:34	2023-11-16 14:34:34
554	17	143	2023-11-16 14:34:34	2023-11-16 14:34:34
555	17	153	2023-11-16 14:34:34	2023-11-16 14:34:34
556	17	95	2023-11-16 14:34:34	2023-11-16 14:34:34
557	17	92	2023-11-16 14:34:34	2023-11-16 14:34:34
558	17	127	2023-11-16 14:34:34	2023-11-16 14:34:34
559	17	91	2023-11-16 14:34:34	2023-11-16 14:34:34
560	17	86	2023-11-16 14:34:34	2023-11-16 14:34:34
561	17	88	2023-11-16 14:34:35	2023-11-16 14:34:35
562	17	87	2023-11-16 14:34:35	2023-11-16 14:34:35
563	17	94	2023-11-16 14:34:35	2023-11-16 14:34:35
564	17	96	2023-11-16 14:34:35	2023-11-16 14:34:35
565	17	89	2023-11-16 14:34:35	2023-11-16 14:34:35
566	17	118	2023-11-16 14:34:35	2023-11-16 14:34:35
567	17	90	2023-11-16 14:34:35	2023-11-16 14:34:35
568	17	154	2023-11-16 14:34:35	2023-11-16 14:34:35
569	17	93	2023-11-16 14:34:35	2023-11-16 14:34:35
570	17	155	2023-11-16 14:34:35	2023-11-16 14:34:35
571	17	16	2023-11-16 14:34:35	2023-11-16 14:34:35
572	17	121	2023-11-16 14:34:35	2023-11-16 14:34:35
573	17	106	2023-11-16 14:34:35	2023-11-16 14:34:35
574	17	101	2023-11-16 14:34:35	2023-11-16 14:34:35
575	17	98	2023-11-16 14:34:35	2023-11-16 14:34:35
576	17	105	2023-11-16 14:34:35	2023-11-16 14:34:35
577	17	100	2023-11-16 14:34:35	2023-11-16 14:34:35
578	17	99	2023-11-16 14:34:35	2023-11-16 14:34:35
579	17	102	2023-11-16 14:34:35	2023-11-16 14:34:35
580	17	103	2023-11-16 14:34:35	2023-11-16 14:34:35
581	17	73	2023-11-16 14:34:35	2023-11-16 14:34:35
582	17	109	2023-11-16 14:34:35	2023-11-16 14:34:35
583	17	108	2023-11-16 14:34:35	2023-11-16 14:34:35
584	17	104	2023-11-16 14:34:35	2023-11-16 14:34:35
585	17	110	2023-11-16 14:34:35	2023-11-16 14:34:35
586	17	107	2023-11-16 14:34:35	2023-11-16 14:34:35
587	17	119	2023-11-16 14:34:35	2023-11-16 14:34:35
588	17	132	2023-11-16 14:34:35	2023-11-16 14:34:35
589	17	140	2023-11-16 14:34:35	2023-11-16 14:34:35
590	17	156	2023-11-16 14:34:35	2023-11-16 14:34:35
591	17	112	2023-11-16 14:34:35	2023-11-16 14:34:35
592	17	136	2023-11-16 14:34:35	2023-11-16 14:34:35
593	17	120	2023-11-16 14:34:35	2023-11-16 14:34:35
594	17	113	2023-11-16 14:34:35	2023-11-16 14:34:35
595	17	111	2023-11-16 14:34:35	2023-11-16 14:34:35
596	17	144	2023-11-16 14:34:35	2023-11-16 14:34:35
597	17	122	2023-11-16 14:34:35	2023-11-16 14:34:35
598	17	128	2023-11-16 14:34:35	2023-11-16 14:34:35
599	18	114	2023-11-16 14:34:56	2023-11-16 14:34:56
600	18	137	2023-11-16 14:34:56	2023-11-16 14:34:56
601	18	145	2023-11-16 14:34:56	2023-11-16 14:34:56
602	18	97	2023-11-16 14:34:56	2023-11-16 14:34:56
603	18	83	2023-11-16 14:34:56	2023-11-16 14:34:56
604	18	123	2023-11-16 14:34:56	2023-11-16 14:34:56
605	18	129	2023-11-16 14:34:56	2023-11-16 14:34:56
606	18	38	2023-11-16 14:34:56	2023-11-16 14:34:56
607	18	157	2023-11-16 14:34:56	2023-11-16 14:34:56
608	18	42	2023-11-16 14:34:56	2023-11-16 14:34:56
609	18	115	2023-11-16 14:34:56	2023-11-16 14:34:56
610	18	124	2023-11-16 14:34:56	2023-11-16 14:34:56
611	18	133	2023-11-16 14:34:56	2023-11-16 14:34:56
612	18	138	2023-11-16 14:34:56	2023-11-16 14:34:56
613	18	146	2023-11-16 14:34:56	2023-11-16 14:34:56
614	18	130	2023-11-16 14:34:56	2023-11-16 14:34:56
615	18	141	2023-11-16 14:34:56	2023-11-16 14:34:56
616	18	158	2023-11-16 14:34:56	2023-11-16 14:34:56
617	18	41	2023-11-16 14:34:56	2023-11-16 14:34:56
618	18	43	2023-11-16 14:34:56	2023-11-16 14:34:56
619	18	45	2023-11-16 14:34:56	2023-11-16 14:34:56
620	18	48	2023-11-16 14:34:56	2023-11-16 14:34:56
621	18	159	2023-11-16 14:34:56	2023-11-16 14:34:56
622	18	116	2023-11-16 14:34:56	2023-11-16 14:34:56
623	18	142	2023-11-16 14:34:56	2023-11-16 14:34:56
624	18	125	2023-11-16 14:34:56	2023-11-16 14:34:56
625	18	39	2023-11-16 14:34:56	2023-11-16 14:34:56
626	18	134	2023-11-16 14:34:56	2023-11-16 14:34:56
627	18	47	2023-11-16 14:34:56	2023-11-16 14:34:56
628	18	139	2023-11-16 14:34:56	2023-11-16 14:34:56
629	18	50	2023-11-16 14:34:56	2023-11-16 14:34:56
630	18	40	2023-11-16 14:34:56	2023-11-16 14:34:56
631	18	51	2023-11-16 14:34:56	2023-11-16 14:34:56
632	18	37	2023-11-16 14:34:56	2023-11-16 14:34:56
633	18	49	2023-11-16 14:34:56	2023-11-16 14:34:56
634	18	46	2023-11-16 14:34:56	2023-11-16 14:34:56
635	18	44	2023-11-16 14:34:56	2023-11-16 14:34:56
636	18	52	2023-11-16 14:34:56	2023-11-16 14:34:56
637	18	61	2023-11-16 14:34:56	2023-11-16 14:34:56
638	18	57	2023-11-16 14:34:56	2023-11-16 14:34:56
639	18	53	2023-11-16 14:34:56	2023-11-16 14:34:56
640	18	54	2023-11-16 14:34:56	2023-11-16 14:34:56
641	18	65	2023-11-16 14:34:56	2023-11-16 14:34:56
642	18	63	2023-11-16 14:34:56	2023-11-16 14:34:56
643	18	55	2023-11-16 14:34:56	2023-11-16 14:34:56
644	18	62	2023-11-16 14:34:56	2023-11-16 14:34:56
645	18	60	2023-11-16 14:34:56	2023-11-16 14:34:56
646	18	56	2023-11-16 14:34:56	2023-11-16 14:34:56
647	18	59	2023-11-16 14:34:56	2023-11-16 14:34:56
648	18	66	2023-11-16 14:34:56	2023-11-16 14:34:56
649	18	64	2023-11-16 14:34:56	2023-11-16 14:34:56
650	18	58	2023-11-16 14:34:56	2023-11-16 14:34:56
651	18	67	2023-11-16 14:34:56	2023-11-16 14:34:56
652	18	148	2023-11-16 14:34:56	2023-11-16 14:34:56
653	18	68	2023-11-16 14:34:56	2023-11-16 14:34:56
654	18	69	2023-11-16 14:34:56	2023-11-16 14:34:56
655	18	72	2023-11-16 14:34:56	2023-11-16 14:34:56
656	18	76	2023-11-16 14:34:56	2023-11-16 14:34:56
657	18	70	2023-11-16 14:34:56	2023-11-16 14:34:56
658	18	79	2023-11-16 14:34:56	2023-11-16 14:34:56
659	18	75	2023-11-16 14:34:56	2023-11-16 14:34:56
660	18	78	2023-11-16 14:34:56	2023-11-16 14:34:56
661	18	77	2023-11-16 14:34:56	2023-11-16 14:34:56
662	18	80	2023-11-16 14:34:56	2023-11-16 14:34:56
663	18	81	2023-11-16 14:34:56	2023-11-16 14:34:56
664	18	82	2023-11-16 14:34:56	2023-11-16 14:34:56
665	18	71	2023-11-16 14:34:56	2023-11-16 14:34:56
666	18	84	2023-11-16 14:34:56	2023-11-16 14:34:56
667	18	85	2023-11-16 14:34:56	2023-11-16 14:34:56
668	18	74	2023-11-16 14:34:56	2023-11-16 14:34:56
669	18	117	2023-11-16 14:34:56	2023-11-16 14:34:56
670	18	135	2023-11-16 14:34:56	2023-11-16 14:34:56
671	18	126	2023-11-16 14:34:56	2023-11-16 14:34:56
672	18	143	2023-11-16 14:34:56	2023-11-16 14:34:56
673	18	153	2023-11-16 14:34:56	2023-11-16 14:34:56
674	18	95	2023-11-16 14:34:56	2023-11-16 14:34:56
675	18	92	2023-11-16 14:34:56	2023-11-16 14:34:56
676	18	127	2023-11-16 14:34:56	2023-11-16 14:34:56
677	18	91	2023-11-16 14:34:56	2023-11-16 14:34:56
678	18	86	2023-11-16 14:34:56	2023-11-16 14:34:56
679	18	88	2023-11-16 14:34:56	2023-11-16 14:34:56
680	18	87	2023-11-16 14:34:56	2023-11-16 14:34:56
681	18	94	2023-11-16 14:34:56	2023-11-16 14:34:56
682	18	96	2023-11-16 14:34:56	2023-11-16 14:34:56
683	18	89	2023-11-16 14:34:56	2023-11-16 14:34:56
684	18	118	2023-11-16 14:34:56	2023-11-16 14:34:56
685	18	90	2023-11-16 14:34:56	2023-11-16 14:34:56
686	18	154	2023-11-16 14:34:56	2023-11-16 14:34:56
687	18	93	2023-11-16 14:34:56	2023-11-16 14:34:56
688	18	155	2023-11-16 14:34:56	2023-11-16 14:34:56
689	18	16	2023-11-16 14:34:56	2023-11-16 14:34:56
690	18	121	2023-11-16 14:34:56	2023-11-16 14:34:56
691	18	106	2023-11-16 14:34:56	2023-11-16 14:34:56
692	18	101	2023-11-16 14:34:56	2023-11-16 14:34:56
693	18	98	2023-11-16 14:34:56	2023-11-16 14:34:56
694	18	105	2023-11-16 14:34:56	2023-11-16 14:34:56
695	18	100	2023-11-16 14:34:56	2023-11-16 14:34:56
696	18	99	2023-11-16 14:34:56	2023-11-16 14:34:56
697	18	102	2023-11-16 14:34:56	2023-11-16 14:34:56
698	18	103	2023-11-16 14:34:56	2023-11-16 14:34:56
699	18	73	2023-11-16 14:34:56	2023-11-16 14:34:56
700	18	109	2023-11-16 14:34:56	2023-11-16 14:34:56
701	18	108	2023-11-16 14:34:56	2023-11-16 14:34:56
702	18	104	2023-11-16 14:34:56	2023-11-16 14:34:56
703	18	110	2023-11-16 14:34:56	2023-11-16 14:34:56
704	18	107	2023-11-16 14:34:56	2023-11-16 14:34:56
705	18	119	2023-11-16 14:34:56	2023-11-16 14:34:56
706	18	132	2023-11-16 14:34:56	2023-11-16 14:34:56
707	18	140	2023-11-16 14:34:56	2023-11-16 14:34:56
708	18	156	2023-11-16 14:34:56	2023-11-16 14:34:56
709	18	112	2023-11-16 14:34:56	2023-11-16 14:34:56
710	18	136	2023-11-16 14:34:56	2023-11-16 14:34:56
711	18	120	2023-11-16 14:34:56	2023-11-16 14:34:56
712	18	113	2023-11-16 14:34:56	2023-11-16 14:34:56
713	18	111	2023-11-16 14:34:56	2023-11-16 14:34:56
714	18	144	2023-11-16 14:34:56	2023-11-16 14:34:56
715	18	122	2023-11-16 14:34:56	2023-11-16 14:34:56
716	18	128	2023-11-16 14:34:56	2023-11-16 14:34:56
717	19	114	2023-11-16 14:35:17	2023-11-16 14:35:17
718	19	137	2023-11-16 14:35:17	2023-11-16 14:35:17
719	19	145	2023-11-16 14:35:17	2023-11-16 14:35:17
720	19	97	2023-11-16 14:35:17	2023-11-16 14:35:17
721	19	83	2023-11-16 14:35:17	2023-11-16 14:35:17
722	19	123	2023-11-16 14:35:17	2023-11-16 14:35:17
723	19	129	2023-11-16 14:35:17	2023-11-16 14:35:17
724	19	38	2023-11-16 14:35:17	2023-11-16 14:35:17
725	19	157	2023-11-16 14:35:17	2023-11-16 14:35:17
726	19	42	2023-11-16 14:35:17	2023-11-16 14:35:17
727	19	115	2023-11-16 14:35:17	2023-11-16 14:35:17
728	19	124	2023-11-16 14:35:17	2023-11-16 14:35:17
729	19	133	2023-11-16 14:35:17	2023-11-16 14:35:17
730	19	138	2023-11-16 14:35:17	2023-11-16 14:35:17
731	19	146	2023-11-16 14:35:17	2023-11-16 14:35:17
732	19	130	2023-11-16 14:35:17	2023-11-16 14:35:17
733	19	141	2023-11-16 14:35:17	2023-11-16 14:35:17
734	19	158	2023-11-16 14:35:17	2023-11-16 14:35:17
735	19	41	2023-11-16 14:35:17	2023-11-16 14:35:17
736	19	43	2023-11-16 14:35:17	2023-11-16 14:35:17
737	19	45	2023-11-16 14:35:17	2023-11-16 14:35:17
738	19	48	2023-11-16 14:35:17	2023-11-16 14:35:17
739	19	159	2023-11-16 14:35:17	2023-11-16 14:35:17
740	19	116	2023-11-16 14:35:17	2023-11-16 14:35:17
741	19	142	2023-11-16 14:35:17	2023-11-16 14:35:17
742	19	125	2023-11-16 14:35:17	2023-11-16 14:35:17
743	19	39	2023-11-16 14:35:17	2023-11-16 14:35:17
744	19	134	2023-11-16 14:35:17	2023-11-16 14:35:17
745	19	47	2023-11-16 14:35:17	2023-11-16 14:35:17
746	19	139	2023-11-16 14:35:17	2023-11-16 14:35:17
747	19	50	2023-11-16 14:35:17	2023-11-16 14:35:17
748	19	40	2023-11-16 14:35:17	2023-11-16 14:35:17
749	19	51	2023-11-16 14:35:17	2023-11-16 14:35:17
750	19	37	2023-11-16 14:35:17	2023-11-16 14:35:17
751	19	49	2023-11-16 14:35:17	2023-11-16 14:35:17
752	19	46	2023-11-16 14:35:17	2023-11-16 14:35:17
753	19	44	2023-11-16 14:35:17	2023-11-16 14:35:17
754	19	52	2023-11-16 14:35:17	2023-11-16 14:35:17
755	19	61	2023-11-16 14:35:17	2023-11-16 14:35:17
756	19	57	2023-11-16 14:35:17	2023-11-16 14:35:17
757	19	53	2023-11-16 14:35:17	2023-11-16 14:35:17
758	19	54	2023-11-16 14:35:17	2023-11-16 14:35:17
759	19	65	2023-11-16 14:35:17	2023-11-16 14:35:17
760	19	63	2023-11-16 14:35:17	2023-11-16 14:35:17
761	19	55	2023-11-16 14:35:17	2023-11-16 14:35:17
762	19	62	2023-11-16 14:35:17	2023-11-16 14:35:17
763	19	60	2023-11-16 14:35:17	2023-11-16 14:35:17
764	19	56	2023-11-16 14:35:17	2023-11-16 14:35:17
765	19	59	2023-11-16 14:35:17	2023-11-16 14:35:17
766	19	66	2023-11-16 14:35:17	2023-11-16 14:35:17
767	19	64	2023-11-16 14:35:17	2023-11-16 14:35:17
768	19	58	2023-11-16 14:35:17	2023-11-16 14:35:17
769	19	67	2023-11-16 14:35:17	2023-11-16 14:35:17
770	19	148	2023-11-16 14:35:17	2023-11-16 14:35:17
771	19	68	2023-11-16 14:35:17	2023-11-16 14:35:17
772	19	69	2023-11-16 14:35:17	2023-11-16 14:35:17
773	19	72	2023-11-16 14:35:17	2023-11-16 14:35:17
774	19	76	2023-11-16 14:35:17	2023-11-16 14:35:17
775	19	70	2023-11-16 14:35:17	2023-11-16 14:35:17
776	19	79	2023-11-16 14:35:17	2023-11-16 14:35:17
777	19	75	2023-11-16 14:35:17	2023-11-16 14:35:17
778	19	78	2023-11-16 14:35:17	2023-11-16 14:35:17
779	19	77	2023-11-16 14:35:17	2023-11-16 14:35:17
780	19	80	2023-11-16 14:35:17	2023-11-16 14:35:17
781	19	81	2023-11-16 14:35:17	2023-11-16 14:35:17
782	19	82	2023-11-16 14:35:17	2023-11-16 14:35:17
783	19	71	2023-11-16 14:35:17	2023-11-16 14:35:17
784	19	84	2023-11-16 14:35:17	2023-11-16 14:35:17
785	19	85	2023-11-16 14:35:17	2023-11-16 14:35:17
786	19	74	2023-11-16 14:35:17	2023-11-16 14:35:17
787	19	117	2023-11-16 14:35:17	2023-11-16 14:35:17
788	19	135	2023-11-16 14:35:17	2023-11-16 14:35:17
789	19	126	2023-11-16 14:35:17	2023-11-16 14:35:17
790	19	143	2023-11-16 14:35:17	2023-11-16 14:35:17
791	19	153	2023-11-16 14:35:17	2023-11-16 14:35:17
792	19	95	2023-11-16 14:35:17	2023-11-16 14:35:17
793	19	92	2023-11-16 14:35:17	2023-11-16 14:35:17
794	19	127	2023-11-16 14:35:17	2023-11-16 14:35:17
795	19	91	2023-11-16 14:35:17	2023-11-16 14:35:17
796	19	86	2023-11-16 14:35:17	2023-11-16 14:35:17
797	19	88	2023-11-16 14:35:17	2023-11-16 14:35:17
798	19	87	2023-11-16 14:35:17	2023-11-16 14:35:17
799	19	94	2023-11-16 14:35:17	2023-11-16 14:35:17
800	19	96	2023-11-16 14:35:17	2023-11-16 14:35:17
801	19	89	2023-11-16 14:35:17	2023-11-16 14:35:17
802	19	118	2023-11-16 14:35:17	2023-11-16 14:35:17
803	19	90	2023-11-16 14:35:17	2023-11-16 14:35:17
804	19	154	2023-11-16 14:35:17	2023-11-16 14:35:17
805	19	93	2023-11-16 14:35:17	2023-11-16 14:35:17
806	19	155	2023-11-16 14:35:17	2023-11-16 14:35:17
807	19	16	2023-11-16 14:35:17	2023-11-16 14:35:17
808	19	121	2023-11-16 14:35:17	2023-11-16 14:35:17
809	19	106	2023-11-16 14:35:17	2023-11-16 14:35:17
810	19	101	2023-11-16 14:35:17	2023-11-16 14:35:17
811	19	98	2023-11-16 14:35:17	2023-11-16 14:35:17
812	19	105	2023-11-16 14:35:17	2023-11-16 14:35:17
813	19	100	2023-11-16 14:35:17	2023-11-16 14:35:17
814	19	99	2023-11-16 14:35:17	2023-11-16 14:35:17
815	19	102	2023-11-16 14:35:17	2023-11-16 14:35:17
816	19	103	2023-11-16 14:35:17	2023-11-16 14:35:17
817	19	73	2023-11-16 14:35:17	2023-11-16 14:35:17
818	19	109	2023-11-16 14:35:17	2023-11-16 14:35:17
819	19	108	2023-11-16 14:35:17	2023-11-16 14:35:17
820	19	104	2023-11-16 14:35:17	2023-11-16 14:35:17
821	19	110	2023-11-16 14:35:17	2023-11-16 14:35:17
822	19	107	2023-11-16 14:35:17	2023-11-16 14:35:17
823	19	119	2023-11-16 14:35:17	2023-11-16 14:35:17
824	19	132	2023-11-16 14:35:17	2023-11-16 14:35:17
825	19	140	2023-11-16 14:35:17	2023-11-16 14:35:17
826	19	156	2023-11-16 14:35:17	2023-11-16 14:35:17
827	19	112	2023-11-16 14:35:17	2023-11-16 14:35:17
828	19	136	2023-11-16 14:35:17	2023-11-16 14:35:17
829	19	120	2023-11-16 14:35:17	2023-11-16 14:35:17
830	19	113	2023-11-16 14:35:17	2023-11-16 14:35:17
831	19	111	2023-11-16 14:35:17	2023-11-16 14:35:17
832	19	144	2023-11-16 14:35:17	2023-11-16 14:35:17
833	19	122	2023-11-16 14:35:17	2023-11-16 14:35:17
834	19	128	2023-11-16 14:35:17	2023-11-16 14:35:17
835	20	73	2023-11-16 14:35:23	2023-11-16 14:35:23
836	21	114	2023-11-16 14:35:45	2023-11-16 14:35:45
837	21	137	2023-11-16 14:35:45	2023-11-16 14:35:45
838	21	145	2023-11-16 14:35:45	2023-11-16 14:35:45
839	21	97	2023-11-16 14:35:45	2023-11-16 14:35:45
840	21	83	2023-11-16 14:35:45	2023-11-16 14:35:45
841	21	123	2023-11-16 14:35:45	2023-11-16 14:35:45
842	21	129	2023-11-16 14:35:45	2023-11-16 14:35:45
843	21	38	2023-11-16 14:35:45	2023-11-16 14:35:45
844	21	157	2023-11-16 14:35:45	2023-11-16 14:35:45
845	21	42	2023-11-16 14:35:45	2023-11-16 14:35:45
846	21	115	2023-11-16 14:35:45	2023-11-16 14:35:45
847	21	124	2023-11-16 14:35:45	2023-11-16 14:35:45
848	21	133	2023-11-16 14:35:45	2023-11-16 14:35:45
849	21	138	2023-11-16 14:35:45	2023-11-16 14:35:45
850	21	146	2023-11-16 14:35:45	2023-11-16 14:35:45
851	21	130	2023-11-16 14:35:45	2023-11-16 14:35:45
852	21	141	2023-11-16 14:35:45	2023-11-16 14:35:45
853	21	158	2023-11-16 14:35:45	2023-11-16 14:35:45
854	21	41	2023-11-16 14:35:45	2023-11-16 14:35:45
855	21	43	2023-11-16 14:35:45	2023-11-16 14:35:45
856	21	45	2023-11-16 14:35:45	2023-11-16 14:35:45
857	21	48	2023-11-16 14:35:45	2023-11-16 14:35:45
858	21	159	2023-11-16 14:35:45	2023-11-16 14:35:45
859	21	116	2023-11-16 14:35:45	2023-11-16 14:35:45
860	21	142	2023-11-16 14:35:45	2023-11-16 14:35:45
861	21	125	2023-11-16 14:35:45	2023-11-16 14:35:45
862	21	39	2023-11-16 14:35:45	2023-11-16 14:35:45
863	21	134	2023-11-16 14:35:45	2023-11-16 14:35:45
864	21	47	2023-11-16 14:35:45	2023-11-16 14:35:45
865	21	139	2023-11-16 14:35:45	2023-11-16 14:35:45
866	21	50	2023-11-16 14:35:45	2023-11-16 14:35:45
867	21	40	2023-11-16 14:35:45	2023-11-16 14:35:45
868	21	51	2023-11-16 14:35:45	2023-11-16 14:35:45
869	21	37	2023-11-16 14:35:45	2023-11-16 14:35:45
870	21	49	2023-11-16 14:35:45	2023-11-16 14:35:45
871	21	46	2023-11-16 14:35:45	2023-11-16 14:35:45
872	21	44	2023-11-16 14:35:45	2023-11-16 14:35:45
873	21	52	2023-11-16 14:35:45	2023-11-16 14:35:45
874	21	61	2023-11-16 14:35:45	2023-11-16 14:35:45
875	21	57	2023-11-16 14:35:45	2023-11-16 14:35:45
876	21	53	2023-11-16 14:35:45	2023-11-16 14:35:45
877	21	54	2023-11-16 14:35:45	2023-11-16 14:35:45
878	21	65	2023-11-16 14:35:45	2023-11-16 14:35:45
879	21	63	2023-11-16 14:35:45	2023-11-16 14:35:45
880	21	55	2023-11-16 14:35:45	2023-11-16 14:35:45
881	21	62	2023-11-16 14:35:45	2023-11-16 14:35:45
882	21	60	2023-11-16 14:35:45	2023-11-16 14:35:45
883	21	56	2023-11-16 14:35:45	2023-11-16 14:35:45
884	21	59	2023-11-16 14:35:45	2023-11-16 14:35:45
885	21	66	2023-11-16 14:35:45	2023-11-16 14:35:45
886	21	64	2023-11-16 14:35:45	2023-11-16 14:35:45
887	21	58	2023-11-16 14:35:45	2023-11-16 14:35:45
888	21	67	2023-11-16 14:35:45	2023-11-16 14:35:45
889	21	148	2023-11-16 14:35:45	2023-11-16 14:35:45
890	21	68	2023-11-16 14:35:45	2023-11-16 14:35:45
891	21	69	2023-11-16 14:35:45	2023-11-16 14:35:45
892	21	72	2023-11-16 14:35:45	2023-11-16 14:35:45
893	21	76	2023-11-16 14:35:45	2023-11-16 14:35:45
894	21	70	2023-11-16 14:35:45	2023-11-16 14:35:45
895	21	79	2023-11-16 14:35:45	2023-11-16 14:35:45
896	21	75	2023-11-16 14:35:45	2023-11-16 14:35:45
897	21	78	2023-11-16 14:35:45	2023-11-16 14:35:45
898	21	77	2023-11-16 14:35:45	2023-11-16 14:35:45
899	21	80	2023-11-16 14:35:45	2023-11-16 14:35:45
900	21	81	2023-11-16 14:35:45	2023-11-16 14:35:45
901	21	82	2023-11-16 14:35:45	2023-11-16 14:35:45
902	21	71	2023-11-16 14:35:45	2023-11-16 14:35:45
903	21	84	2023-11-16 14:35:45	2023-11-16 14:35:45
904	21	85	2023-11-16 14:35:45	2023-11-16 14:35:45
905	21	74	2023-11-16 14:35:45	2023-11-16 14:35:45
906	21	117	2023-11-16 14:35:45	2023-11-16 14:35:45
907	21	135	2023-11-16 14:35:45	2023-11-16 14:35:45
908	21	126	2023-11-16 14:35:45	2023-11-16 14:35:45
909	21	143	2023-11-16 14:35:45	2023-11-16 14:35:45
910	21	153	2023-11-16 14:35:45	2023-11-16 14:35:45
911	21	95	2023-11-16 14:35:45	2023-11-16 14:35:45
912	21	92	2023-11-16 14:35:45	2023-11-16 14:35:45
913	21	127	2023-11-16 14:35:45	2023-11-16 14:35:45
914	21	91	2023-11-16 14:35:45	2023-11-16 14:35:45
915	21	86	2023-11-16 14:35:45	2023-11-16 14:35:45
916	21	88	2023-11-16 14:35:45	2023-11-16 14:35:45
917	21	87	2023-11-16 14:35:45	2023-11-16 14:35:45
918	21	94	2023-11-16 14:35:45	2023-11-16 14:35:45
919	21	96	2023-11-16 14:35:45	2023-11-16 14:35:45
920	21	89	2023-11-16 14:35:45	2023-11-16 14:35:45
921	21	118	2023-11-16 14:35:45	2023-11-16 14:35:45
922	21	90	2023-11-16 14:35:45	2023-11-16 14:35:45
923	21	154	2023-11-16 14:35:45	2023-11-16 14:35:45
924	21	93	2023-11-16 14:35:45	2023-11-16 14:35:45
925	21	155	2023-11-16 14:35:45	2023-11-16 14:35:45
926	21	16	2023-11-16 14:35:45	2023-11-16 14:35:45
927	21	121	2023-11-16 14:35:45	2023-11-16 14:35:45
928	21	106	2023-11-16 14:35:45	2023-11-16 14:35:45
929	21	101	2023-11-16 14:35:45	2023-11-16 14:35:45
930	21	98	2023-11-16 14:35:45	2023-11-16 14:35:45
931	21	105	2023-11-16 14:35:45	2023-11-16 14:35:45
932	21	100	2023-11-16 14:35:45	2023-11-16 14:35:45
933	21	99	2023-11-16 14:35:45	2023-11-16 14:35:45
934	21	102	2023-11-16 14:35:45	2023-11-16 14:35:45
935	21	103	2023-11-16 14:35:45	2023-11-16 14:35:45
936	21	73	2023-11-16 14:35:45	2023-11-16 14:35:45
937	21	109	2023-11-16 14:35:45	2023-11-16 14:35:45
938	21	108	2023-11-16 14:35:45	2023-11-16 14:35:45
939	21	104	2023-11-16 14:35:45	2023-11-16 14:35:45
940	21	110	2023-11-16 14:35:45	2023-11-16 14:35:45
941	21	107	2023-11-16 14:35:45	2023-11-16 14:35:45
942	21	119	2023-11-16 14:35:45	2023-11-16 14:35:45
943	21	132	2023-11-16 14:35:45	2023-11-16 14:35:45
944	21	140	2023-11-16 14:35:45	2023-11-16 14:35:45
945	21	156	2023-11-16 14:35:45	2023-11-16 14:35:45
946	21	112	2023-11-16 14:35:45	2023-11-16 14:35:45
947	21	136	2023-11-16 14:35:45	2023-11-16 14:35:45
948	21	120	2023-11-16 14:35:45	2023-11-16 14:35:45
949	21	113	2023-11-16 14:35:45	2023-11-16 14:35:45
950	21	111	2023-11-16 14:35:45	2023-11-16 14:35:45
951	21	144	2023-11-16 14:35:45	2023-11-16 14:35:45
952	21	122	2023-11-16 14:35:45	2023-11-16 14:35:45
953	21	128	2023-11-16 14:35:45	2023-11-16 14:35:45
954	22	114	2023-11-16 14:37:37	2023-11-16 14:37:37
955	22	137	2023-11-16 14:37:37	2023-11-16 14:37:37
956	22	145	2023-11-16 14:37:37	2023-11-16 14:37:37
957	22	97	2023-11-16 14:37:37	2023-11-16 14:37:37
958	22	83	2023-11-16 14:37:37	2023-11-16 14:37:37
959	22	123	2023-11-16 14:37:37	2023-11-16 14:37:37
960	22	129	2023-11-16 14:37:37	2023-11-16 14:37:37
961	22	38	2023-11-16 14:37:37	2023-11-16 14:37:37
962	22	157	2023-11-16 14:37:37	2023-11-16 14:37:37
963	22	42	2023-11-16 14:37:37	2023-11-16 14:37:37
964	22	115	2023-11-16 14:37:37	2023-11-16 14:37:37
965	22	124	2023-11-16 14:37:37	2023-11-16 14:37:37
966	22	133	2023-11-16 14:37:37	2023-11-16 14:37:37
967	22	138	2023-11-16 14:37:37	2023-11-16 14:37:37
968	22	146	2023-11-16 14:37:37	2023-11-16 14:37:37
969	22	130	2023-11-16 14:37:37	2023-11-16 14:37:37
970	22	141	2023-11-16 14:37:37	2023-11-16 14:37:37
971	22	158	2023-11-16 14:37:37	2023-11-16 14:37:37
972	22	41	2023-11-16 14:37:37	2023-11-16 14:37:37
973	22	43	2023-11-16 14:37:37	2023-11-16 14:37:37
974	22	45	2023-11-16 14:37:37	2023-11-16 14:37:37
975	22	48	2023-11-16 14:37:37	2023-11-16 14:37:37
976	22	159	2023-11-16 14:37:37	2023-11-16 14:37:37
977	22	116	2023-11-16 14:37:37	2023-11-16 14:37:37
978	22	142	2023-11-16 14:37:37	2023-11-16 14:37:37
979	22	125	2023-11-16 14:37:37	2023-11-16 14:37:37
980	22	39	2023-11-16 14:37:37	2023-11-16 14:37:37
981	22	134	2023-11-16 14:37:37	2023-11-16 14:37:37
982	22	47	2023-11-16 14:37:37	2023-11-16 14:37:37
983	22	139	2023-11-16 14:37:37	2023-11-16 14:37:37
984	22	50	2023-11-16 14:37:37	2023-11-16 14:37:37
985	22	40	2023-11-16 14:37:37	2023-11-16 14:37:37
986	22	51	2023-11-16 14:37:37	2023-11-16 14:37:37
987	22	37	2023-11-16 14:37:37	2023-11-16 14:37:37
988	22	49	2023-11-16 14:37:37	2023-11-16 14:37:37
989	22	46	2023-11-16 14:37:37	2023-11-16 14:37:37
990	22	44	2023-11-16 14:37:37	2023-11-16 14:37:37
991	22	52	2023-11-16 14:37:37	2023-11-16 14:37:37
992	22	61	2023-11-16 14:37:37	2023-11-16 14:37:37
993	22	57	2023-11-16 14:37:37	2023-11-16 14:37:37
994	22	53	2023-11-16 14:37:37	2023-11-16 14:37:37
995	22	54	2023-11-16 14:37:37	2023-11-16 14:37:37
996	22	65	2023-11-16 14:37:37	2023-11-16 14:37:37
997	22	63	2023-11-16 14:37:37	2023-11-16 14:37:37
998	22	55	2023-11-16 14:37:37	2023-11-16 14:37:37
999	22	62	2023-11-16 14:37:37	2023-11-16 14:37:37
1000	22	60	2023-11-16 14:37:37	2023-11-16 14:37:37
1001	22	56	2023-11-16 14:37:37	2023-11-16 14:37:37
1002	22	59	2023-11-16 14:37:37	2023-11-16 14:37:37
1003	22	66	2023-11-16 14:37:37	2023-11-16 14:37:37
1004	22	64	2023-11-16 14:37:37	2023-11-16 14:37:37
1005	22	58	2023-11-16 14:37:37	2023-11-16 14:37:37
1006	22	67	2023-11-16 14:37:37	2023-11-16 14:37:37
1007	22	148	2023-11-16 14:37:37	2023-11-16 14:37:37
1008	22	68	2023-11-16 14:37:37	2023-11-16 14:37:37
1009	22	69	2023-11-16 14:37:37	2023-11-16 14:37:37
1010	22	72	2023-11-16 14:37:37	2023-11-16 14:37:37
1011	22	76	2023-11-16 14:37:37	2023-11-16 14:37:37
1012	22	70	2023-11-16 14:37:37	2023-11-16 14:37:37
1013	22	79	2023-11-16 14:37:37	2023-11-16 14:37:37
1014	22	75	2023-11-16 14:37:37	2023-11-16 14:37:37
1015	22	78	2023-11-16 14:37:37	2023-11-16 14:37:37
1016	22	77	2023-11-16 14:37:37	2023-11-16 14:37:37
1017	22	80	2023-11-16 14:37:37	2023-11-16 14:37:37
1018	22	81	2023-11-16 14:37:37	2023-11-16 14:37:37
1019	22	82	2023-11-16 14:37:37	2023-11-16 14:37:37
1020	22	71	2023-11-16 14:37:37	2023-11-16 14:37:37
1021	22	84	2023-11-16 14:37:37	2023-11-16 14:37:37
1022	22	85	2023-11-16 14:37:37	2023-11-16 14:37:37
1023	22	74	2023-11-16 14:37:37	2023-11-16 14:37:37
1024	22	117	2023-11-16 14:37:37	2023-11-16 14:37:37
1025	22	135	2023-11-16 14:37:37	2023-11-16 14:37:37
1026	22	126	2023-11-16 14:37:37	2023-11-16 14:37:37
1027	22	143	2023-11-16 14:37:37	2023-11-16 14:37:37
1028	22	153	2023-11-16 14:37:37	2023-11-16 14:37:37
1029	22	95	2023-11-16 14:37:37	2023-11-16 14:37:37
1030	22	92	2023-11-16 14:37:37	2023-11-16 14:37:37
1031	22	127	2023-11-16 14:37:37	2023-11-16 14:37:37
1032	22	91	2023-11-16 14:37:37	2023-11-16 14:37:37
1033	22	86	2023-11-16 14:37:37	2023-11-16 14:37:37
1034	22	88	2023-11-16 14:37:37	2023-11-16 14:37:37
1035	22	87	2023-11-16 14:37:37	2023-11-16 14:37:37
1036	22	94	2023-11-16 14:37:37	2023-11-16 14:37:37
1037	22	96	2023-11-16 14:37:37	2023-11-16 14:37:37
1038	22	89	2023-11-16 14:37:37	2023-11-16 14:37:37
1039	22	118	2023-11-16 14:37:37	2023-11-16 14:37:37
1040	22	90	2023-11-16 14:37:37	2023-11-16 14:37:37
1041	22	154	2023-11-16 14:37:37	2023-11-16 14:37:37
1042	22	93	2023-11-16 14:37:37	2023-11-16 14:37:37
1043	22	155	2023-11-16 14:37:37	2023-11-16 14:37:37
1044	22	16	2023-11-16 14:37:37	2023-11-16 14:37:37
1045	22	121	2023-11-16 14:37:37	2023-11-16 14:37:37
1046	22	106	2023-11-16 14:37:37	2023-11-16 14:37:37
1047	22	101	2023-11-16 14:37:37	2023-11-16 14:37:37
1048	22	98	2023-11-16 14:37:37	2023-11-16 14:37:37
1049	22	105	2023-11-16 14:37:37	2023-11-16 14:37:37
1050	22	100	2023-11-16 14:37:37	2023-11-16 14:37:37
1051	22	99	2023-11-16 14:37:37	2023-11-16 14:37:37
1052	22	102	2023-11-16 14:37:37	2023-11-16 14:37:37
1053	22	103	2023-11-16 14:37:37	2023-11-16 14:37:37
1054	22	73	2023-11-16 14:37:37	2023-11-16 14:37:37
1055	22	109	2023-11-16 14:37:37	2023-11-16 14:37:37
1056	22	108	2023-11-16 14:37:37	2023-11-16 14:37:37
1057	22	104	2023-11-16 14:37:37	2023-11-16 14:37:37
1058	22	110	2023-11-16 14:37:37	2023-11-16 14:37:37
1059	22	107	2023-11-16 14:37:37	2023-11-16 14:37:37
1060	22	119	2023-11-16 14:37:37	2023-11-16 14:37:37
1061	22	132	2023-11-16 14:37:37	2023-11-16 14:37:37
1062	22	140	2023-11-16 14:37:37	2023-11-16 14:37:37
1063	22	156	2023-11-16 14:37:37	2023-11-16 14:37:37
1064	22	112	2023-11-16 14:37:37	2023-11-16 14:37:37
1065	22	136	2023-11-16 14:37:37	2023-11-16 14:37:37
1066	22	120	2023-11-16 14:37:37	2023-11-16 14:37:37
1067	22	113	2023-11-16 14:37:37	2023-11-16 14:37:37
1068	22	111	2023-11-16 14:37:37	2023-11-16 14:37:37
1069	22	144	2023-11-16 14:37:37	2023-11-16 14:37:37
1070	22	122	2023-11-16 14:37:37	2023-11-16 14:37:37
1071	22	128	2023-11-16 14:37:37	2023-11-16 14:37:37
1072	23	114	2023-11-16 14:38:19	2023-11-16 14:38:19
1073	23	137	2023-11-16 14:38:19	2023-11-16 14:38:19
1074	23	145	2023-11-16 14:38:19	2023-11-16 14:38:19
1075	23	97	2023-11-16 14:38:19	2023-11-16 14:38:19
1076	23	83	2023-11-16 14:38:19	2023-11-16 14:38:19
1077	23	123	2023-11-16 14:38:19	2023-11-16 14:38:19
1078	23	129	2023-11-16 14:38:19	2023-11-16 14:38:19
1079	23	38	2023-11-16 14:38:19	2023-11-16 14:38:19
1080	23	157	2023-11-16 14:38:19	2023-11-16 14:38:19
1081	23	42	2023-11-16 14:38:19	2023-11-16 14:38:19
1082	23	115	2023-11-16 14:38:19	2023-11-16 14:38:19
1083	23	124	2023-11-16 14:38:19	2023-11-16 14:38:19
1084	23	133	2023-11-16 14:38:19	2023-11-16 14:38:19
1085	23	138	2023-11-16 14:38:19	2023-11-16 14:38:19
1086	23	146	2023-11-16 14:38:19	2023-11-16 14:38:19
1087	23	130	2023-11-16 14:38:19	2023-11-16 14:38:19
1088	23	141	2023-11-16 14:38:19	2023-11-16 14:38:19
1089	23	158	2023-11-16 14:38:19	2023-11-16 14:38:19
1090	23	41	2023-11-16 14:38:19	2023-11-16 14:38:19
1091	23	43	2023-11-16 14:38:19	2023-11-16 14:38:19
1092	23	45	2023-11-16 14:38:19	2023-11-16 14:38:19
1093	23	48	2023-11-16 14:38:19	2023-11-16 14:38:19
1094	23	159	2023-11-16 14:38:19	2023-11-16 14:38:19
1095	23	116	2023-11-16 14:38:19	2023-11-16 14:38:19
1096	23	142	2023-11-16 14:38:19	2023-11-16 14:38:19
1097	23	125	2023-11-16 14:38:19	2023-11-16 14:38:19
1098	23	39	2023-11-16 14:38:19	2023-11-16 14:38:19
1099	23	134	2023-11-16 14:38:19	2023-11-16 14:38:19
1100	23	47	2023-11-16 14:38:19	2023-11-16 14:38:19
1101	23	139	2023-11-16 14:38:19	2023-11-16 14:38:19
1102	23	50	2023-11-16 14:38:19	2023-11-16 14:38:19
1103	23	40	2023-11-16 14:38:19	2023-11-16 14:38:19
1104	23	51	2023-11-16 14:38:19	2023-11-16 14:38:19
1105	23	37	2023-11-16 14:38:19	2023-11-16 14:38:19
1106	23	49	2023-11-16 14:38:19	2023-11-16 14:38:19
1107	23	46	2023-11-16 14:38:19	2023-11-16 14:38:19
1108	23	44	2023-11-16 14:38:19	2023-11-16 14:38:19
1109	23	52	2023-11-16 14:38:19	2023-11-16 14:38:19
1110	23	61	2023-11-16 14:38:19	2023-11-16 14:38:19
1111	23	57	2023-11-16 14:38:19	2023-11-16 14:38:19
1112	23	53	2023-11-16 14:38:19	2023-11-16 14:38:19
1113	23	54	2023-11-16 14:38:19	2023-11-16 14:38:19
1114	23	65	2023-11-16 14:38:19	2023-11-16 14:38:19
1115	23	63	2023-11-16 14:38:19	2023-11-16 14:38:19
1116	23	55	2023-11-16 14:38:19	2023-11-16 14:38:19
1117	23	62	2023-11-16 14:38:19	2023-11-16 14:38:19
1118	23	60	2023-11-16 14:38:19	2023-11-16 14:38:19
1119	23	56	2023-11-16 14:38:19	2023-11-16 14:38:19
1120	23	59	2023-11-16 14:38:19	2023-11-16 14:38:19
1121	23	66	2023-11-16 14:38:19	2023-11-16 14:38:19
1122	23	64	2023-11-16 14:38:19	2023-11-16 14:38:19
1123	23	58	2023-11-16 14:38:19	2023-11-16 14:38:19
1124	23	67	2023-11-16 14:38:19	2023-11-16 14:38:19
1125	23	148	2023-11-16 14:38:19	2023-11-16 14:38:19
1126	23	68	2023-11-16 14:38:19	2023-11-16 14:38:19
1127	23	69	2023-11-16 14:38:19	2023-11-16 14:38:19
1128	23	72	2023-11-16 14:38:19	2023-11-16 14:38:19
1129	23	76	2023-11-16 14:38:19	2023-11-16 14:38:19
1130	23	70	2023-11-16 14:38:19	2023-11-16 14:38:19
1131	23	79	2023-11-16 14:38:19	2023-11-16 14:38:19
1132	23	75	2023-11-16 14:38:19	2023-11-16 14:38:19
1133	23	78	2023-11-16 14:38:19	2023-11-16 14:38:19
1134	23	77	2023-11-16 14:38:19	2023-11-16 14:38:19
1135	23	80	2023-11-16 14:38:19	2023-11-16 14:38:19
1136	23	81	2023-11-16 14:38:19	2023-11-16 14:38:19
1137	23	82	2023-11-16 14:38:19	2023-11-16 14:38:19
1138	23	71	2023-11-16 14:38:19	2023-11-16 14:38:19
1139	23	84	2023-11-16 14:38:19	2023-11-16 14:38:19
1140	23	85	2023-11-16 14:38:19	2023-11-16 14:38:19
1141	23	74	2023-11-16 14:38:19	2023-11-16 14:38:19
1142	23	117	2023-11-16 14:38:19	2023-11-16 14:38:19
1143	23	135	2023-11-16 14:38:19	2023-11-16 14:38:19
1144	23	126	2023-11-16 14:38:19	2023-11-16 14:38:19
1145	23	143	2023-11-16 14:38:19	2023-11-16 14:38:19
1146	23	153	2023-11-16 14:38:19	2023-11-16 14:38:19
1147	23	95	2023-11-16 14:38:19	2023-11-16 14:38:19
1148	23	92	2023-11-16 14:38:19	2023-11-16 14:38:19
1149	23	127	2023-11-16 14:38:19	2023-11-16 14:38:19
1150	23	91	2023-11-16 14:38:19	2023-11-16 14:38:19
1151	23	86	2023-11-16 14:38:19	2023-11-16 14:38:19
1152	23	88	2023-11-16 14:38:19	2023-11-16 14:38:19
1153	23	87	2023-11-16 14:38:19	2023-11-16 14:38:19
1154	23	94	2023-11-16 14:38:19	2023-11-16 14:38:19
1155	23	96	2023-11-16 14:38:19	2023-11-16 14:38:19
1156	23	89	2023-11-16 14:38:19	2023-11-16 14:38:19
1157	23	118	2023-11-16 14:38:19	2023-11-16 14:38:19
1158	23	90	2023-11-16 14:38:19	2023-11-16 14:38:19
1159	23	154	2023-11-16 14:38:19	2023-11-16 14:38:19
1160	23	93	2023-11-16 14:38:19	2023-11-16 14:38:19
1161	23	155	2023-11-16 14:38:19	2023-11-16 14:38:19
1162	23	16	2023-11-16 14:38:19	2023-11-16 14:38:19
1163	23	121	2023-11-16 14:38:19	2023-11-16 14:38:19
1164	23	106	2023-11-16 14:38:19	2023-11-16 14:38:19
1165	23	101	2023-11-16 14:38:19	2023-11-16 14:38:19
1166	23	98	2023-11-16 14:38:19	2023-11-16 14:38:19
1167	23	105	2023-11-16 14:38:19	2023-11-16 14:38:19
1168	23	100	2023-11-16 14:38:19	2023-11-16 14:38:19
1169	23	99	2023-11-16 14:38:19	2023-11-16 14:38:19
1170	23	102	2023-11-16 14:38:19	2023-11-16 14:38:19
1171	23	103	2023-11-16 14:38:19	2023-11-16 14:38:19
1172	23	73	2023-11-16 14:38:19	2023-11-16 14:38:19
1173	23	109	2023-11-16 14:38:19	2023-11-16 14:38:19
1174	23	108	2023-11-16 14:38:19	2023-11-16 14:38:19
1175	23	104	2023-11-16 14:38:19	2023-11-16 14:38:19
1176	23	110	2023-11-16 14:38:19	2023-11-16 14:38:19
1177	23	107	2023-11-16 14:38:19	2023-11-16 14:38:19
1178	23	119	2023-11-16 14:38:19	2023-11-16 14:38:19
1179	23	132	2023-11-16 14:38:19	2023-11-16 14:38:19
1180	23	140	2023-11-16 14:38:19	2023-11-16 14:38:19
1181	23	156	2023-11-16 14:38:19	2023-11-16 14:38:19
1182	23	112	2023-11-16 14:38:19	2023-11-16 14:38:19
1183	23	136	2023-11-16 14:38:19	2023-11-16 14:38:19
1184	23	120	2023-11-16 14:38:19	2023-11-16 14:38:19
1185	23	113	2023-11-16 14:38:19	2023-11-16 14:38:19
1186	23	111	2023-11-16 14:38:19	2023-11-16 14:38:19
1187	23	144	2023-11-16 14:38:19	2023-11-16 14:38:19
1188	23	122	2023-11-16 14:38:19	2023-11-16 14:38:19
1189	23	128	2023-11-16 14:38:19	2023-11-16 14:38:19
1190	24	114	2023-11-16 14:39:09	2023-11-16 14:39:09
1191	24	137	2023-11-16 14:39:09	2023-11-16 14:39:09
1192	24	145	2023-11-16 14:39:09	2023-11-16 14:39:09
1193	24	97	2023-11-16 14:39:09	2023-11-16 14:39:09
1194	24	83	2023-11-16 14:39:09	2023-11-16 14:39:09
1195	24	123	2023-11-16 14:39:09	2023-11-16 14:39:09
1196	24	129	2023-11-16 14:39:09	2023-11-16 14:39:09
1197	24	38	2023-11-16 14:39:09	2023-11-16 14:39:09
1198	24	157	2023-11-16 14:39:09	2023-11-16 14:39:09
1199	24	42	2023-11-16 14:39:09	2023-11-16 14:39:09
1200	24	115	2023-11-16 14:39:09	2023-11-16 14:39:09
1201	24	124	2023-11-16 14:39:09	2023-11-16 14:39:09
1202	24	133	2023-11-16 14:39:09	2023-11-16 14:39:09
1203	24	138	2023-11-16 14:39:09	2023-11-16 14:39:09
1204	24	146	2023-11-16 14:39:09	2023-11-16 14:39:09
1205	24	130	2023-11-16 14:39:09	2023-11-16 14:39:09
1206	24	141	2023-11-16 14:39:09	2023-11-16 14:39:09
1207	24	158	2023-11-16 14:39:09	2023-11-16 14:39:09
1208	24	41	2023-11-16 14:39:09	2023-11-16 14:39:09
1209	24	43	2023-11-16 14:39:09	2023-11-16 14:39:09
1210	24	45	2023-11-16 14:39:09	2023-11-16 14:39:09
1211	24	48	2023-11-16 14:39:09	2023-11-16 14:39:09
1212	24	159	2023-11-16 14:39:09	2023-11-16 14:39:09
1213	24	116	2023-11-16 14:39:09	2023-11-16 14:39:09
1214	24	142	2023-11-16 14:39:09	2023-11-16 14:39:09
1215	24	125	2023-11-16 14:39:09	2023-11-16 14:39:09
1216	24	39	2023-11-16 14:39:09	2023-11-16 14:39:09
1217	24	134	2023-11-16 14:39:09	2023-11-16 14:39:09
1218	24	47	2023-11-16 14:39:09	2023-11-16 14:39:09
1219	24	139	2023-11-16 14:39:09	2023-11-16 14:39:09
1220	24	50	2023-11-16 14:39:09	2023-11-16 14:39:09
1221	24	40	2023-11-16 14:39:09	2023-11-16 14:39:09
1222	24	51	2023-11-16 14:39:09	2023-11-16 14:39:09
1223	24	37	2023-11-16 14:39:09	2023-11-16 14:39:09
1224	24	49	2023-11-16 14:39:09	2023-11-16 14:39:09
1225	24	46	2023-11-16 14:39:09	2023-11-16 14:39:09
1226	24	44	2023-11-16 14:39:09	2023-11-16 14:39:09
1227	24	52	2023-11-16 14:39:09	2023-11-16 14:39:09
1228	24	61	2023-11-16 14:39:09	2023-11-16 14:39:09
1229	24	57	2023-11-16 14:39:09	2023-11-16 14:39:09
1230	24	53	2023-11-16 14:39:09	2023-11-16 14:39:09
1231	24	54	2023-11-16 14:39:09	2023-11-16 14:39:09
1232	24	65	2023-11-16 14:39:09	2023-11-16 14:39:09
1233	24	63	2023-11-16 14:39:09	2023-11-16 14:39:09
1234	24	55	2023-11-16 14:39:09	2023-11-16 14:39:09
1235	24	62	2023-11-16 14:39:09	2023-11-16 14:39:09
1236	24	60	2023-11-16 14:39:09	2023-11-16 14:39:09
1237	24	56	2023-11-16 14:39:09	2023-11-16 14:39:09
1238	24	59	2023-11-16 14:39:09	2023-11-16 14:39:09
1239	24	66	2023-11-16 14:39:09	2023-11-16 14:39:09
1240	24	64	2023-11-16 14:39:09	2023-11-16 14:39:09
1241	24	58	2023-11-16 14:39:09	2023-11-16 14:39:09
1242	24	67	2023-11-16 14:39:09	2023-11-16 14:39:09
1243	24	148	2023-11-16 14:39:09	2023-11-16 14:39:09
1244	24	68	2023-11-16 14:39:09	2023-11-16 14:39:09
1245	24	69	2023-11-16 14:39:09	2023-11-16 14:39:09
1246	24	72	2023-11-16 14:39:09	2023-11-16 14:39:09
1247	24	76	2023-11-16 14:39:09	2023-11-16 14:39:09
1248	24	70	2023-11-16 14:39:09	2023-11-16 14:39:09
1249	24	79	2023-11-16 14:39:09	2023-11-16 14:39:09
1250	24	75	2023-11-16 14:39:09	2023-11-16 14:39:09
1251	24	78	2023-11-16 14:39:09	2023-11-16 14:39:09
1252	24	77	2023-11-16 14:39:09	2023-11-16 14:39:09
1253	24	80	2023-11-16 14:39:09	2023-11-16 14:39:09
1254	24	81	2023-11-16 14:39:09	2023-11-16 14:39:09
1255	24	82	2023-11-16 14:39:09	2023-11-16 14:39:09
1256	24	71	2023-11-16 14:39:09	2023-11-16 14:39:09
1257	24	84	2023-11-16 14:39:09	2023-11-16 14:39:09
1258	24	85	2023-11-16 14:39:09	2023-11-16 14:39:09
1259	24	74	2023-11-16 14:39:09	2023-11-16 14:39:09
1260	24	117	2023-11-16 14:39:09	2023-11-16 14:39:09
1261	24	135	2023-11-16 14:39:09	2023-11-16 14:39:09
1262	24	126	2023-11-16 14:39:09	2023-11-16 14:39:09
1263	24	143	2023-11-16 14:39:09	2023-11-16 14:39:09
1264	24	153	2023-11-16 14:39:09	2023-11-16 14:39:09
1265	24	95	2023-11-16 14:39:09	2023-11-16 14:39:09
1266	24	92	2023-11-16 14:39:09	2023-11-16 14:39:09
1267	24	127	2023-11-16 14:39:09	2023-11-16 14:39:09
1268	24	91	2023-11-16 14:39:09	2023-11-16 14:39:09
1269	24	86	2023-11-16 14:39:09	2023-11-16 14:39:09
1270	24	88	2023-11-16 14:39:09	2023-11-16 14:39:09
1271	24	87	2023-11-16 14:39:09	2023-11-16 14:39:09
1272	24	94	2023-11-16 14:39:09	2023-11-16 14:39:09
1273	24	96	2023-11-16 14:39:09	2023-11-16 14:39:09
1274	24	89	2023-11-16 14:39:09	2023-11-16 14:39:09
1275	24	118	2023-11-16 14:39:09	2023-11-16 14:39:09
1276	24	90	2023-11-16 14:39:09	2023-11-16 14:39:09
1277	24	154	2023-11-16 14:39:09	2023-11-16 14:39:09
1278	24	93	2023-11-16 14:39:09	2023-11-16 14:39:09
1279	24	155	2023-11-16 14:39:09	2023-11-16 14:39:09
1280	24	16	2023-11-16 14:39:09	2023-11-16 14:39:09
1281	24	121	2023-11-16 14:39:09	2023-11-16 14:39:09
1282	24	106	2023-11-16 14:39:09	2023-11-16 14:39:09
1283	24	101	2023-11-16 14:39:09	2023-11-16 14:39:09
1284	24	98	2023-11-16 14:39:09	2023-11-16 14:39:09
1285	24	105	2023-11-16 14:39:09	2023-11-16 14:39:09
1286	24	100	2023-11-16 14:39:09	2023-11-16 14:39:09
1287	24	99	2023-11-16 14:39:09	2023-11-16 14:39:09
1288	24	102	2023-11-16 14:39:09	2023-11-16 14:39:09
1289	24	103	2023-11-16 14:39:09	2023-11-16 14:39:09
1290	24	73	2023-11-16 14:39:09	2023-11-16 14:39:09
1291	24	109	2023-11-16 14:39:09	2023-11-16 14:39:09
1292	24	108	2023-11-16 14:39:09	2023-11-16 14:39:09
1293	24	104	2023-11-16 14:39:09	2023-11-16 14:39:09
1294	24	110	2023-11-16 14:39:09	2023-11-16 14:39:09
1295	24	107	2023-11-16 14:39:09	2023-11-16 14:39:09
1296	24	119	2023-11-16 14:39:09	2023-11-16 14:39:09
1297	24	132	2023-11-16 14:39:09	2023-11-16 14:39:09
1298	24	140	2023-11-16 14:39:09	2023-11-16 14:39:09
1299	24	156	2023-11-16 14:39:09	2023-11-16 14:39:09
1300	24	112	2023-11-16 14:39:09	2023-11-16 14:39:09
1301	24	136	2023-11-16 14:39:09	2023-11-16 14:39:09
1302	24	120	2023-11-16 14:39:09	2023-11-16 14:39:09
1303	24	113	2023-11-16 14:39:09	2023-11-16 14:39:09
1304	24	111	2023-11-16 14:39:09	2023-11-16 14:39:09
1305	24	144	2023-11-16 14:39:09	2023-11-16 14:39:09
1306	24	122	2023-11-16 14:39:09	2023-11-16 14:39:09
1307	24	128	2023-11-16 14:39:09	2023-11-16 14:39:09
1308	25	73	2023-11-16 14:39:34	2023-11-16 14:39:34
1309	26	114	2023-11-16 14:40:03	2023-11-16 14:40:03
1310	26	137	2023-11-16 14:40:03	2023-11-16 14:40:03
1311	26	145	2023-11-16 14:40:03	2023-11-16 14:40:03
1312	26	97	2023-11-16 14:40:03	2023-11-16 14:40:03
1313	26	83	2023-11-16 14:40:03	2023-11-16 14:40:03
1314	26	123	2023-11-16 14:40:03	2023-11-16 14:40:03
1315	26	129	2023-11-16 14:40:03	2023-11-16 14:40:03
1316	26	38	2023-11-16 14:40:03	2023-11-16 14:40:03
1317	26	157	2023-11-16 14:40:03	2023-11-16 14:40:03
1318	26	42	2023-11-16 14:40:03	2023-11-16 14:40:03
1319	26	115	2023-11-16 14:40:03	2023-11-16 14:40:03
1320	26	124	2023-11-16 14:40:03	2023-11-16 14:40:03
1321	26	133	2023-11-16 14:40:03	2023-11-16 14:40:03
1322	26	138	2023-11-16 14:40:03	2023-11-16 14:40:03
1323	26	146	2023-11-16 14:40:03	2023-11-16 14:40:03
1324	26	130	2023-11-16 14:40:03	2023-11-16 14:40:03
1325	26	141	2023-11-16 14:40:03	2023-11-16 14:40:03
1326	26	158	2023-11-16 14:40:03	2023-11-16 14:40:03
1327	26	41	2023-11-16 14:40:03	2023-11-16 14:40:03
1328	26	43	2023-11-16 14:40:03	2023-11-16 14:40:03
1329	26	45	2023-11-16 14:40:03	2023-11-16 14:40:03
1330	26	48	2023-11-16 14:40:03	2023-11-16 14:40:03
1331	26	159	2023-11-16 14:40:03	2023-11-16 14:40:03
1332	26	116	2023-11-16 14:40:03	2023-11-16 14:40:03
1333	26	142	2023-11-16 14:40:03	2023-11-16 14:40:03
1334	26	125	2023-11-16 14:40:03	2023-11-16 14:40:03
1335	26	39	2023-11-16 14:40:03	2023-11-16 14:40:03
1336	26	134	2023-11-16 14:40:03	2023-11-16 14:40:03
1337	26	47	2023-11-16 14:40:03	2023-11-16 14:40:03
1338	26	139	2023-11-16 14:40:03	2023-11-16 14:40:03
1339	26	50	2023-11-16 14:40:03	2023-11-16 14:40:03
1340	26	40	2023-11-16 14:40:03	2023-11-16 14:40:03
1341	26	51	2023-11-16 14:40:03	2023-11-16 14:40:03
1342	26	37	2023-11-16 14:40:03	2023-11-16 14:40:03
1343	26	49	2023-11-16 14:40:03	2023-11-16 14:40:03
1344	26	46	2023-11-16 14:40:03	2023-11-16 14:40:03
1345	26	44	2023-11-16 14:40:03	2023-11-16 14:40:03
1346	26	52	2023-11-16 14:40:03	2023-11-16 14:40:03
1347	26	61	2023-11-16 14:40:03	2023-11-16 14:40:03
1348	26	57	2023-11-16 14:40:03	2023-11-16 14:40:03
1349	26	53	2023-11-16 14:40:03	2023-11-16 14:40:03
1350	26	54	2023-11-16 14:40:03	2023-11-16 14:40:03
1351	26	65	2023-11-16 14:40:03	2023-11-16 14:40:03
1352	26	63	2023-11-16 14:40:03	2023-11-16 14:40:03
1353	26	55	2023-11-16 14:40:03	2023-11-16 14:40:03
1354	26	62	2023-11-16 14:40:03	2023-11-16 14:40:03
1355	26	60	2023-11-16 14:40:03	2023-11-16 14:40:03
1356	26	56	2023-11-16 14:40:03	2023-11-16 14:40:03
1357	26	59	2023-11-16 14:40:03	2023-11-16 14:40:03
1358	26	66	2023-11-16 14:40:03	2023-11-16 14:40:03
1359	26	64	2023-11-16 14:40:03	2023-11-16 14:40:03
1360	26	58	2023-11-16 14:40:03	2023-11-16 14:40:03
1361	26	67	2023-11-16 14:40:03	2023-11-16 14:40:03
1362	26	148	2023-11-16 14:40:03	2023-11-16 14:40:03
1363	26	68	2023-11-16 14:40:03	2023-11-16 14:40:03
1364	26	69	2023-11-16 14:40:03	2023-11-16 14:40:03
1365	26	72	2023-11-16 14:40:03	2023-11-16 14:40:03
1366	26	76	2023-11-16 14:40:03	2023-11-16 14:40:03
1367	26	70	2023-11-16 14:40:03	2023-11-16 14:40:03
1368	26	79	2023-11-16 14:40:03	2023-11-16 14:40:03
1369	26	75	2023-11-16 14:40:03	2023-11-16 14:40:03
1370	26	78	2023-11-16 14:40:03	2023-11-16 14:40:03
1371	26	77	2023-11-16 14:40:03	2023-11-16 14:40:03
1372	26	80	2023-11-16 14:40:03	2023-11-16 14:40:03
1373	26	81	2023-11-16 14:40:03	2023-11-16 14:40:03
1374	26	82	2023-11-16 14:40:03	2023-11-16 14:40:03
1375	26	71	2023-11-16 14:40:03	2023-11-16 14:40:03
1376	26	84	2023-11-16 14:40:03	2023-11-16 14:40:03
1377	26	85	2023-11-16 14:40:03	2023-11-16 14:40:03
1378	26	74	2023-11-16 14:40:03	2023-11-16 14:40:03
1379	26	117	2023-11-16 14:40:03	2023-11-16 14:40:03
1380	26	135	2023-11-16 14:40:03	2023-11-16 14:40:03
1381	26	126	2023-11-16 14:40:03	2023-11-16 14:40:03
1382	26	143	2023-11-16 14:40:03	2023-11-16 14:40:03
1383	26	153	2023-11-16 14:40:03	2023-11-16 14:40:03
1384	26	95	2023-11-16 14:40:03	2023-11-16 14:40:03
1385	26	92	2023-11-16 14:40:03	2023-11-16 14:40:03
1386	26	127	2023-11-16 14:40:03	2023-11-16 14:40:03
1387	26	91	2023-11-16 14:40:03	2023-11-16 14:40:03
1388	26	86	2023-11-16 14:40:03	2023-11-16 14:40:03
1389	26	88	2023-11-16 14:40:03	2023-11-16 14:40:03
1390	26	87	2023-11-16 14:40:03	2023-11-16 14:40:03
1391	26	94	2023-11-16 14:40:03	2023-11-16 14:40:03
1392	26	96	2023-11-16 14:40:03	2023-11-16 14:40:03
1393	26	89	2023-11-16 14:40:03	2023-11-16 14:40:03
1394	26	118	2023-11-16 14:40:03	2023-11-16 14:40:03
1395	26	90	2023-11-16 14:40:03	2023-11-16 14:40:03
1396	26	154	2023-11-16 14:40:03	2023-11-16 14:40:03
1397	26	93	2023-11-16 14:40:03	2023-11-16 14:40:03
1398	26	155	2023-11-16 14:40:03	2023-11-16 14:40:03
1399	26	16	2023-11-16 14:40:03	2023-11-16 14:40:03
1400	26	121	2023-11-16 14:40:03	2023-11-16 14:40:03
1401	26	106	2023-11-16 14:40:03	2023-11-16 14:40:03
1402	26	101	2023-11-16 14:40:03	2023-11-16 14:40:03
1403	26	98	2023-11-16 14:40:03	2023-11-16 14:40:03
1404	26	105	2023-11-16 14:40:03	2023-11-16 14:40:03
1405	26	100	2023-11-16 14:40:03	2023-11-16 14:40:03
1406	26	99	2023-11-16 14:40:03	2023-11-16 14:40:03
1407	26	102	2023-11-16 14:40:03	2023-11-16 14:40:03
1408	26	103	2023-11-16 14:40:03	2023-11-16 14:40:03
1409	26	73	2023-11-16 14:40:03	2023-11-16 14:40:03
1410	26	109	2023-11-16 14:40:03	2023-11-16 14:40:03
1411	26	108	2023-11-16 14:40:03	2023-11-16 14:40:03
1412	26	104	2023-11-16 14:40:03	2023-11-16 14:40:03
1413	26	110	2023-11-16 14:40:03	2023-11-16 14:40:03
1414	26	107	2023-11-16 14:40:03	2023-11-16 14:40:03
1415	26	119	2023-11-16 14:40:03	2023-11-16 14:40:03
1416	26	132	2023-11-16 14:40:03	2023-11-16 14:40:03
1417	26	140	2023-11-16 14:40:03	2023-11-16 14:40:03
1418	26	156	2023-11-16 14:40:03	2023-11-16 14:40:03
1419	26	112	2023-11-16 14:40:03	2023-11-16 14:40:03
1420	26	136	2023-11-16 14:40:03	2023-11-16 14:40:03
1421	26	120	2023-11-16 14:40:03	2023-11-16 14:40:03
1422	26	113	2023-11-16 14:40:03	2023-11-16 14:40:03
1423	26	111	2023-11-16 14:40:03	2023-11-16 14:40:03
1424	26	144	2023-11-16 14:40:03	2023-11-16 14:40:03
1425	26	122	2023-11-16 14:40:03	2023-11-16 14:40:03
1426	26	128	2023-11-16 14:40:03	2023-11-16 14:40:03
1427	27	114	2023-11-16 14:40:26	2023-11-16 14:40:26
1428	27	137	2023-11-16 14:40:26	2023-11-16 14:40:26
1429	27	145	2023-11-16 14:40:26	2023-11-16 14:40:26
1430	27	97	2023-11-16 14:40:26	2023-11-16 14:40:26
1431	27	83	2023-11-16 14:40:26	2023-11-16 14:40:26
1432	27	123	2023-11-16 14:40:26	2023-11-16 14:40:26
1433	27	129	2023-11-16 14:40:26	2023-11-16 14:40:26
1434	27	38	2023-11-16 14:40:26	2023-11-16 14:40:26
1435	27	157	2023-11-16 14:40:26	2023-11-16 14:40:26
1436	27	42	2023-11-16 14:40:26	2023-11-16 14:40:26
1437	27	115	2023-11-16 14:40:26	2023-11-16 14:40:26
1438	27	124	2023-11-16 14:40:26	2023-11-16 14:40:26
1439	27	133	2023-11-16 14:40:26	2023-11-16 14:40:26
1440	27	138	2023-11-16 14:40:26	2023-11-16 14:40:26
1441	27	146	2023-11-16 14:40:26	2023-11-16 14:40:26
1442	27	130	2023-11-16 14:40:26	2023-11-16 14:40:26
1443	27	141	2023-11-16 14:40:26	2023-11-16 14:40:26
1444	27	158	2023-11-16 14:40:26	2023-11-16 14:40:26
1445	27	41	2023-11-16 14:40:26	2023-11-16 14:40:26
1446	27	43	2023-11-16 14:40:26	2023-11-16 14:40:26
1447	27	45	2023-11-16 14:40:26	2023-11-16 14:40:26
1448	27	48	2023-11-16 14:40:26	2023-11-16 14:40:26
1449	27	159	2023-11-16 14:40:26	2023-11-16 14:40:26
1450	27	116	2023-11-16 14:40:26	2023-11-16 14:40:26
1451	27	142	2023-11-16 14:40:26	2023-11-16 14:40:26
1452	27	125	2023-11-16 14:40:26	2023-11-16 14:40:26
1453	27	39	2023-11-16 14:40:26	2023-11-16 14:40:26
1454	27	134	2023-11-16 14:40:26	2023-11-16 14:40:26
1455	27	47	2023-11-16 14:40:26	2023-11-16 14:40:26
1456	27	139	2023-11-16 14:40:26	2023-11-16 14:40:26
1457	27	50	2023-11-16 14:40:26	2023-11-16 14:40:26
1458	27	40	2023-11-16 14:40:26	2023-11-16 14:40:26
1459	27	51	2023-11-16 14:40:26	2023-11-16 14:40:26
1460	27	37	2023-11-16 14:40:26	2023-11-16 14:40:26
1461	27	49	2023-11-16 14:40:26	2023-11-16 14:40:26
1462	27	46	2023-11-16 14:40:26	2023-11-16 14:40:26
1463	27	44	2023-11-16 14:40:26	2023-11-16 14:40:26
1464	27	52	2023-11-16 14:40:26	2023-11-16 14:40:26
1465	27	61	2023-11-16 14:40:26	2023-11-16 14:40:26
1466	27	57	2023-11-16 14:40:26	2023-11-16 14:40:26
1467	27	53	2023-11-16 14:40:26	2023-11-16 14:40:26
1468	27	54	2023-11-16 14:40:26	2023-11-16 14:40:26
1469	27	65	2023-11-16 14:40:26	2023-11-16 14:40:26
1470	27	63	2023-11-16 14:40:26	2023-11-16 14:40:26
1471	27	55	2023-11-16 14:40:26	2023-11-16 14:40:26
1472	27	62	2023-11-16 14:40:26	2023-11-16 14:40:26
1473	27	60	2023-11-16 14:40:26	2023-11-16 14:40:26
1474	27	56	2023-11-16 14:40:26	2023-11-16 14:40:26
1475	27	59	2023-11-16 14:40:26	2023-11-16 14:40:26
1476	27	66	2023-11-16 14:40:26	2023-11-16 14:40:26
1477	27	64	2023-11-16 14:40:27	2023-11-16 14:40:27
1478	27	58	2023-11-16 14:40:27	2023-11-16 14:40:27
1479	27	67	2023-11-16 14:40:27	2023-11-16 14:40:27
1480	27	148	2023-11-16 14:40:27	2023-11-16 14:40:27
1481	27	68	2023-11-16 14:40:27	2023-11-16 14:40:27
1482	27	69	2023-11-16 14:40:27	2023-11-16 14:40:27
1483	27	72	2023-11-16 14:40:27	2023-11-16 14:40:27
1484	27	76	2023-11-16 14:40:27	2023-11-16 14:40:27
1485	27	70	2023-11-16 14:40:27	2023-11-16 14:40:27
1486	27	79	2023-11-16 14:40:27	2023-11-16 14:40:27
1487	27	75	2023-11-16 14:40:27	2023-11-16 14:40:27
1488	27	78	2023-11-16 14:40:27	2023-11-16 14:40:27
1489	27	77	2023-11-16 14:40:27	2023-11-16 14:40:27
1490	27	80	2023-11-16 14:40:27	2023-11-16 14:40:27
1491	27	81	2023-11-16 14:40:27	2023-11-16 14:40:27
1492	27	82	2023-11-16 14:40:27	2023-11-16 14:40:27
1493	27	71	2023-11-16 14:40:27	2023-11-16 14:40:27
1494	27	84	2023-11-16 14:40:27	2023-11-16 14:40:27
1495	27	85	2023-11-16 14:40:27	2023-11-16 14:40:27
1496	27	74	2023-11-16 14:40:27	2023-11-16 14:40:27
1497	27	117	2023-11-16 14:40:27	2023-11-16 14:40:27
1498	27	135	2023-11-16 14:40:27	2023-11-16 14:40:27
1499	27	126	2023-11-16 14:40:27	2023-11-16 14:40:27
1500	27	143	2023-11-16 14:40:27	2023-11-16 14:40:27
1501	27	153	2023-11-16 14:40:27	2023-11-16 14:40:27
1502	27	95	2023-11-16 14:40:27	2023-11-16 14:40:27
1503	27	92	2023-11-16 14:40:27	2023-11-16 14:40:27
1504	27	127	2023-11-16 14:40:27	2023-11-16 14:40:27
1505	27	91	2023-11-16 14:40:27	2023-11-16 14:40:27
1506	27	86	2023-11-16 14:40:27	2023-11-16 14:40:27
1507	27	88	2023-11-16 14:40:27	2023-11-16 14:40:27
1508	27	87	2023-11-16 14:40:27	2023-11-16 14:40:27
1509	27	94	2023-11-16 14:40:27	2023-11-16 14:40:27
1510	27	96	2023-11-16 14:40:27	2023-11-16 14:40:27
1511	27	89	2023-11-16 14:40:27	2023-11-16 14:40:27
1512	27	118	2023-11-16 14:40:27	2023-11-16 14:40:27
1513	27	90	2023-11-16 14:40:27	2023-11-16 14:40:27
1514	27	154	2023-11-16 14:40:27	2023-11-16 14:40:27
1515	27	93	2023-11-16 14:40:27	2023-11-16 14:40:27
1516	27	155	2023-11-16 14:40:27	2023-11-16 14:40:27
1517	27	16	2023-11-16 14:40:27	2023-11-16 14:40:27
1518	27	121	2023-11-16 14:40:27	2023-11-16 14:40:27
1519	27	106	2023-11-16 14:40:27	2023-11-16 14:40:27
1520	27	101	2023-11-16 14:40:27	2023-11-16 14:40:27
1521	27	98	2023-11-16 14:40:27	2023-11-16 14:40:27
1522	27	105	2023-11-16 14:40:27	2023-11-16 14:40:27
1523	27	100	2023-11-16 14:40:27	2023-11-16 14:40:27
1524	27	99	2023-11-16 14:40:27	2023-11-16 14:40:27
1525	27	102	2023-11-16 14:40:27	2023-11-16 14:40:27
1526	27	103	2023-11-16 14:40:27	2023-11-16 14:40:27
1527	27	73	2023-11-16 14:40:27	2023-11-16 14:40:27
1528	27	109	2023-11-16 14:40:27	2023-11-16 14:40:27
1529	27	108	2023-11-16 14:40:27	2023-11-16 14:40:27
1530	27	104	2023-11-16 14:40:27	2023-11-16 14:40:27
1531	27	110	2023-11-16 14:40:27	2023-11-16 14:40:27
1532	27	107	2023-11-16 14:40:27	2023-11-16 14:40:27
1533	27	119	2023-11-16 14:40:27	2023-11-16 14:40:27
1534	27	132	2023-11-16 14:40:27	2023-11-16 14:40:27
1535	27	140	2023-11-16 14:40:27	2023-11-16 14:40:27
1536	27	156	2023-11-16 14:40:27	2023-11-16 14:40:27
1537	27	112	2023-11-16 14:40:27	2023-11-16 14:40:27
1538	27	136	2023-11-16 14:40:27	2023-11-16 14:40:27
1539	27	120	2023-11-16 14:40:27	2023-11-16 14:40:27
1540	27	113	2023-11-16 14:40:27	2023-11-16 14:40:27
1541	27	111	2023-11-16 14:40:27	2023-11-16 14:40:27
1542	27	144	2023-11-16 14:40:27	2023-11-16 14:40:27
1543	27	122	2023-11-16 14:40:27	2023-11-16 14:40:27
1544	27	128	2023-11-16 14:40:27	2023-11-16 14:40:27
1545	28	114	2023-11-16 14:41:12	2023-11-16 14:41:12
1546	28	137	2023-11-16 14:41:12	2023-11-16 14:41:12
1547	28	145	2023-11-16 14:41:12	2023-11-16 14:41:12
1548	28	97	2023-11-16 14:41:12	2023-11-16 14:41:12
1549	28	83	2023-11-16 14:41:12	2023-11-16 14:41:12
1550	28	123	2023-11-16 14:41:12	2023-11-16 14:41:12
1551	28	129	2023-11-16 14:41:12	2023-11-16 14:41:12
1552	28	38	2023-11-16 14:41:12	2023-11-16 14:41:12
1553	28	157	2023-11-16 14:41:12	2023-11-16 14:41:12
1554	28	42	2023-11-16 14:41:12	2023-11-16 14:41:12
1555	28	115	2023-11-16 14:41:12	2023-11-16 14:41:12
1556	28	124	2023-11-16 14:41:12	2023-11-16 14:41:12
1557	28	133	2023-11-16 14:41:12	2023-11-16 14:41:12
1558	28	138	2023-11-16 14:41:12	2023-11-16 14:41:12
1559	28	146	2023-11-16 14:41:12	2023-11-16 14:41:12
1560	28	130	2023-11-16 14:41:12	2023-11-16 14:41:12
1561	28	141	2023-11-16 14:41:12	2023-11-16 14:41:12
1562	28	158	2023-11-16 14:41:12	2023-11-16 14:41:12
1563	28	41	2023-11-16 14:41:12	2023-11-16 14:41:12
1564	28	43	2023-11-16 14:41:12	2023-11-16 14:41:12
1565	28	45	2023-11-16 14:41:12	2023-11-16 14:41:12
1566	28	48	2023-11-16 14:41:12	2023-11-16 14:41:12
1567	28	159	2023-11-16 14:41:12	2023-11-16 14:41:12
1568	28	116	2023-11-16 14:41:12	2023-11-16 14:41:12
1569	28	142	2023-11-16 14:41:12	2023-11-16 14:41:12
1570	28	125	2023-11-16 14:41:12	2023-11-16 14:41:12
1571	28	39	2023-11-16 14:41:12	2023-11-16 14:41:12
1572	28	134	2023-11-16 14:41:12	2023-11-16 14:41:12
1573	28	47	2023-11-16 14:41:12	2023-11-16 14:41:12
1574	28	139	2023-11-16 14:41:12	2023-11-16 14:41:12
1575	28	50	2023-11-16 14:41:12	2023-11-16 14:41:12
1576	28	40	2023-11-16 14:41:12	2023-11-16 14:41:12
1577	28	51	2023-11-16 14:41:12	2023-11-16 14:41:12
1578	28	37	2023-11-16 14:41:12	2023-11-16 14:41:12
1579	28	49	2023-11-16 14:41:12	2023-11-16 14:41:12
1580	28	46	2023-11-16 14:41:12	2023-11-16 14:41:12
1581	28	44	2023-11-16 14:41:12	2023-11-16 14:41:12
1582	28	52	2023-11-16 14:41:12	2023-11-16 14:41:12
1583	28	61	2023-11-16 14:41:12	2023-11-16 14:41:12
1584	28	57	2023-11-16 14:41:12	2023-11-16 14:41:12
1585	28	53	2023-11-16 14:41:12	2023-11-16 14:41:12
1586	28	54	2023-11-16 14:41:12	2023-11-16 14:41:12
1587	28	65	2023-11-16 14:41:12	2023-11-16 14:41:12
1588	28	63	2023-11-16 14:41:12	2023-11-16 14:41:12
1589	28	55	2023-11-16 14:41:12	2023-11-16 14:41:12
1590	28	62	2023-11-16 14:41:12	2023-11-16 14:41:12
1591	28	60	2023-11-16 14:41:12	2023-11-16 14:41:12
1592	28	56	2023-11-16 14:41:12	2023-11-16 14:41:12
1593	28	59	2023-11-16 14:41:12	2023-11-16 14:41:12
1594	28	66	2023-11-16 14:41:12	2023-11-16 14:41:12
1595	28	64	2023-11-16 14:41:12	2023-11-16 14:41:12
1596	28	58	2023-11-16 14:41:12	2023-11-16 14:41:12
1597	28	67	2023-11-16 14:41:12	2023-11-16 14:41:12
1598	28	148	2023-11-16 14:41:12	2023-11-16 14:41:12
1599	28	68	2023-11-16 14:41:12	2023-11-16 14:41:12
1600	28	69	2023-11-16 14:41:12	2023-11-16 14:41:12
1601	28	72	2023-11-16 14:41:12	2023-11-16 14:41:12
1602	28	76	2023-11-16 14:41:12	2023-11-16 14:41:12
1603	28	70	2023-11-16 14:41:12	2023-11-16 14:41:12
1604	28	79	2023-11-16 14:41:12	2023-11-16 14:41:12
1605	28	75	2023-11-16 14:41:12	2023-11-16 14:41:12
1606	28	78	2023-11-16 14:41:12	2023-11-16 14:41:12
1607	28	77	2023-11-16 14:41:12	2023-11-16 14:41:12
1608	28	80	2023-11-16 14:41:12	2023-11-16 14:41:12
1609	28	81	2023-11-16 14:41:12	2023-11-16 14:41:12
1610	28	82	2023-11-16 14:41:12	2023-11-16 14:41:12
1611	28	71	2023-11-16 14:41:12	2023-11-16 14:41:12
1612	28	84	2023-11-16 14:41:12	2023-11-16 14:41:12
1613	28	85	2023-11-16 14:41:12	2023-11-16 14:41:12
1614	28	74	2023-11-16 14:41:12	2023-11-16 14:41:12
1615	28	117	2023-11-16 14:41:12	2023-11-16 14:41:12
1616	28	135	2023-11-16 14:41:12	2023-11-16 14:41:12
1617	28	126	2023-11-16 14:41:12	2023-11-16 14:41:12
1618	28	143	2023-11-16 14:41:12	2023-11-16 14:41:12
1619	28	153	2023-11-16 14:41:12	2023-11-16 14:41:12
1620	28	95	2023-11-16 14:41:12	2023-11-16 14:41:12
1621	28	92	2023-11-16 14:41:12	2023-11-16 14:41:12
1622	28	127	2023-11-16 14:41:12	2023-11-16 14:41:12
1623	28	91	2023-11-16 14:41:12	2023-11-16 14:41:12
1624	28	86	2023-11-16 14:41:12	2023-11-16 14:41:12
1625	28	88	2023-11-16 14:41:12	2023-11-16 14:41:12
1626	28	87	2023-11-16 14:41:12	2023-11-16 14:41:12
1627	28	94	2023-11-16 14:41:12	2023-11-16 14:41:12
1628	28	96	2023-11-16 14:41:12	2023-11-16 14:41:12
1629	28	89	2023-11-16 14:41:12	2023-11-16 14:41:12
1630	28	118	2023-11-16 14:41:12	2023-11-16 14:41:12
1631	28	90	2023-11-16 14:41:12	2023-11-16 14:41:12
1632	28	154	2023-11-16 14:41:12	2023-11-16 14:41:12
1633	28	93	2023-11-16 14:41:12	2023-11-16 14:41:12
1634	28	155	2023-11-16 14:41:12	2023-11-16 14:41:12
1635	28	16	2023-11-16 14:41:12	2023-11-16 14:41:12
1636	28	121	2023-11-16 14:41:12	2023-11-16 14:41:12
1637	28	106	2023-11-16 14:41:12	2023-11-16 14:41:12
1638	28	101	2023-11-16 14:41:12	2023-11-16 14:41:12
1639	28	98	2023-11-16 14:41:12	2023-11-16 14:41:12
1640	28	105	2023-11-16 14:41:12	2023-11-16 14:41:12
1641	28	100	2023-11-16 14:41:12	2023-11-16 14:41:12
1642	28	99	2023-11-16 14:41:12	2023-11-16 14:41:12
1643	28	102	2023-11-16 14:41:12	2023-11-16 14:41:12
1644	28	103	2023-11-16 14:41:12	2023-11-16 14:41:12
1645	28	73	2023-11-16 14:41:12	2023-11-16 14:41:12
1646	28	109	2023-11-16 14:41:12	2023-11-16 14:41:12
1647	28	108	2023-11-16 14:41:12	2023-11-16 14:41:12
1648	28	104	2023-11-16 14:41:12	2023-11-16 14:41:12
1649	28	110	2023-11-16 14:41:12	2023-11-16 14:41:12
1650	28	107	2023-11-16 14:41:12	2023-11-16 14:41:12
1651	28	119	2023-11-16 14:41:12	2023-11-16 14:41:12
1652	28	132	2023-11-16 14:41:12	2023-11-16 14:41:12
1653	28	140	2023-11-16 14:41:12	2023-11-16 14:41:12
1654	28	156	2023-11-16 14:41:12	2023-11-16 14:41:12
1655	28	112	2023-11-16 14:41:12	2023-11-16 14:41:12
1656	28	136	2023-11-16 14:41:12	2023-11-16 14:41:12
1657	28	120	2023-11-16 14:41:12	2023-11-16 14:41:12
1658	28	113	2023-11-16 14:41:12	2023-11-16 14:41:12
1659	28	111	2023-11-16 14:41:12	2023-11-16 14:41:12
1660	28	144	2023-11-16 14:41:12	2023-11-16 14:41:12
1661	28	122	2023-11-16 14:41:12	2023-11-16 14:41:12
1662	28	128	2023-11-16 14:41:12	2023-11-16 14:41:12
1663	29	114	2023-11-16 14:42:16	2023-11-16 14:42:16
1664	29	137	2023-11-16 14:42:16	2023-11-16 14:42:16
1665	29	145	2023-11-16 14:42:16	2023-11-16 14:42:16
1666	29	97	2023-11-16 14:42:16	2023-11-16 14:42:16
1667	29	83	2023-11-16 14:42:16	2023-11-16 14:42:16
1668	29	123	2023-11-16 14:42:16	2023-11-16 14:42:16
1669	29	129	2023-11-16 14:42:16	2023-11-16 14:42:16
1670	29	38	2023-11-16 14:42:16	2023-11-16 14:42:16
1671	29	157	2023-11-16 14:42:16	2023-11-16 14:42:16
1672	29	42	2023-11-16 14:42:16	2023-11-16 14:42:16
1673	29	115	2023-11-16 14:42:16	2023-11-16 14:42:16
1674	29	124	2023-11-16 14:42:16	2023-11-16 14:42:16
1675	29	133	2023-11-16 14:42:16	2023-11-16 14:42:16
1676	29	138	2023-11-16 14:42:16	2023-11-16 14:42:16
1677	29	146	2023-11-16 14:42:16	2023-11-16 14:42:16
1678	29	130	2023-11-16 14:42:16	2023-11-16 14:42:16
1679	29	141	2023-11-16 14:42:16	2023-11-16 14:42:16
1680	29	158	2023-11-16 14:42:16	2023-11-16 14:42:16
1681	29	41	2023-11-16 14:42:16	2023-11-16 14:42:16
1682	29	43	2023-11-16 14:42:16	2023-11-16 14:42:16
1683	29	45	2023-11-16 14:42:16	2023-11-16 14:42:16
1684	29	48	2023-11-16 14:42:16	2023-11-16 14:42:16
1685	29	159	2023-11-16 14:42:16	2023-11-16 14:42:16
1686	29	116	2023-11-16 14:42:16	2023-11-16 14:42:16
1687	29	142	2023-11-16 14:42:16	2023-11-16 14:42:16
1688	29	125	2023-11-16 14:42:16	2023-11-16 14:42:16
1689	29	39	2023-11-16 14:42:16	2023-11-16 14:42:16
1690	29	134	2023-11-16 14:42:16	2023-11-16 14:42:16
1691	29	47	2023-11-16 14:42:16	2023-11-16 14:42:16
1692	29	139	2023-11-16 14:42:16	2023-11-16 14:42:16
1693	29	50	2023-11-16 14:42:16	2023-11-16 14:42:16
1694	29	40	2023-11-16 14:42:16	2023-11-16 14:42:16
1695	29	51	2023-11-16 14:42:16	2023-11-16 14:42:16
1696	29	37	2023-11-16 14:42:16	2023-11-16 14:42:16
1697	29	49	2023-11-16 14:42:16	2023-11-16 14:42:16
1698	29	46	2023-11-16 14:42:16	2023-11-16 14:42:16
1699	29	44	2023-11-16 14:42:16	2023-11-16 14:42:16
1700	29	52	2023-11-16 14:42:16	2023-11-16 14:42:16
1701	29	61	2023-11-16 14:42:16	2023-11-16 14:42:16
1702	29	57	2023-11-16 14:42:16	2023-11-16 14:42:16
1703	29	53	2023-11-16 14:42:16	2023-11-16 14:42:16
1704	29	54	2023-11-16 14:42:16	2023-11-16 14:42:16
1705	29	65	2023-11-16 14:42:16	2023-11-16 14:42:16
1706	29	63	2023-11-16 14:42:16	2023-11-16 14:42:16
1707	29	55	2023-11-16 14:42:16	2023-11-16 14:42:16
1708	29	62	2023-11-16 14:42:16	2023-11-16 14:42:16
1709	29	60	2023-11-16 14:42:16	2023-11-16 14:42:16
1710	29	56	2023-11-16 14:42:16	2023-11-16 14:42:16
1711	29	59	2023-11-16 14:42:16	2023-11-16 14:42:16
1712	29	66	2023-11-16 14:42:16	2023-11-16 14:42:16
1713	29	64	2023-11-16 14:42:16	2023-11-16 14:42:16
1714	29	58	2023-11-16 14:42:16	2023-11-16 14:42:16
1715	29	67	2023-11-16 14:42:16	2023-11-16 14:42:16
1716	29	148	2023-11-16 14:42:16	2023-11-16 14:42:16
1717	29	68	2023-11-16 14:42:16	2023-11-16 14:42:16
1718	29	69	2023-11-16 14:42:16	2023-11-16 14:42:16
1719	29	72	2023-11-16 14:42:16	2023-11-16 14:42:16
1720	29	76	2023-11-16 14:42:16	2023-11-16 14:42:16
1721	29	70	2023-11-16 14:42:16	2023-11-16 14:42:16
1722	29	79	2023-11-16 14:42:16	2023-11-16 14:42:16
1723	29	75	2023-11-16 14:42:16	2023-11-16 14:42:16
1724	29	78	2023-11-16 14:42:16	2023-11-16 14:42:16
1725	29	77	2023-11-16 14:42:16	2023-11-16 14:42:16
1726	29	80	2023-11-16 14:42:16	2023-11-16 14:42:16
1727	29	81	2023-11-16 14:42:16	2023-11-16 14:42:16
1728	29	82	2023-11-16 14:42:16	2023-11-16 14:42:16
1729	29	71	2023-11-16 14:42:16	2023-11-16 14:42:16
1730	29	84	2023-11-16 14:42:16	2023-11-16 14:42:16
1731	29	85	2023-11-16 14:42:16	2023-11-16 14:42:16
1732	29	74	2023-11-16 14:42:16	2023-11-16 14:42:16
1733	29	117	2023-11-16 14:42:16	2023-11-16 14:42:16
1734	29	135	2023-11-16 14:42:16	2023-11-16 14:42:16
1735	29	126	2023-11-16 14:42:16	2023-11-16 14:42:16
1736	29	143	2023-11-16 14:42:16	2023-11-16 14:42:16
1737	29	153	2023-11-16 14:42:16	2023-11-16 14:42:16
1738	29	95	2023-11-16 14:42:16	2023-11-16 14:42:16
1739	29	92	2023-11-16 14:42:16	2023-11-16 14:42:16
1740	29	127	2023-11-16 14:42:16	2023-11-16 14:42:16
1741	29	91	2023-11-16 14:42:16	2023-11-16 14:42:16
1742	29	86	2023-11-16 14:42:16	2023-11-16 14:42:16
1743	29	88	2023-11-16 14:42:16	2023-11-16 14:42:16
1744	29	87	2023-11-16 14:42:16	2023-11-16 14:42:16
1745	29	94	2023-11-16 14:42:16	2023-11-16 14:42:16
1746	29	96	2023-11-16 14:42:16	2023-11-16 14:42:16
1747	29	89	2023-11-16 14:42:16	2023-11-16 14:42:16
1748	29	118	2023-11-16 14:42:16	2023-11-16 14:42:16
1749	29	90	2023-11-16 14:42:16	2023-11-16 14:42:16
1750	29	154	2023-11-16 14:42:16	2023-11-16 14:42:16
1751	29	93	2023-11-16 14:42:16	2023-11-16 14:42:16
1752	29	155	2023-11-16 14:42:16	2023-11-16 14:42:16
1753	29	16	2023-11-16 14:42:16	2023-11-16 14:42:16
1754	29	121	2023-11-16 14:42:16	2023-11-16 14:42:16
1755	29	106	2023-11-16 14:42:16	2023-11-16 14:42:16
1756	29	101	2023-11-16 14:42:16	2023-11-16 14:42:16
1757	29	98	2023-11-16 14:42:16	2023-11-16 14:42:16
1758	29	105	2023-11-16 14:42:16	2023-11-16 14:42:16
1759	29	100	2023-11-16 14:42:16	2023-11-16 14:42:16
1760	29	99	2023-11-16 14:42:16	2023-11-16 14:42:16
1761	29	102	2023-11-16 14:42:16	2023-11-16 14:42:16
1762	29	103	2023-11-16 14:42:16	2023-11-16 14:42:16
1763	29	73	2023-11-16 14:42:16	2023-11-16 14:42:16
1764	29	109	2023-11-16 14:42:16	2023-11-16 14:42:16
1765	29	108	2023-11-16 14:42:16	2023-11-16 14:42:16
1766	29	104	2023-11-16 14:42:16	2023-11-16 14:42:16
1767	29	110	2023-11-16 14:42:16	2023-11-16 14:42:16
1768	29	107	2023-11-16 14:42:16	2023-11-16 14:42:16
1769	29	119	2023-11-16 14:42:16	2023-11-16 14:42:16
1770	29	132	2023-11-16 14:42:16	2023-11-16 14:42:16
1771	29	140	2023-11-16 14:42:16	2023-11-16 14:42:16
1772	29	156	2023-11-16 14:42:16	2023-11-16 14:42:16
1773	29	112	2023-11-16 14:42:16	2023-11-16 14:42:16
1774	29	136	2023-11-16 14:42:16	2023-11-16 14:42:16
1775	29	120	2023-11-16 14:42:16	2023-11-16 14:42:16
1776	29	113	2023-11-16 14:42:16	2023-11-16 14:42:16
1777	29	111	2023-11-16 14:42:16	2023-11-16 14:42:16
1778	29	144	2023-11-16 14:42:16	2023-11-16 14:42:16
1779	29	122	2023-11-16 14:42:16	2023-11-16 14:42:16
1780	29	128	2023-11-16 14:42:16	2023-11-16 14:42:16
1781	30	73	2023-11-16 14:42:21	2023-11-16 14:42:21
1782	31	114	2023-11-16 14:42:49	2023-11-16 14:42:49
1783	31	137	2023-11-16 14:42:49	2023-11-16 14:42:49
1784	31	145	2023-11-16 14:42:49	2023-11-16 14:42:49
1785	31	97	2023-11-16 14:42:49	2023-11-16 14:42:49
1786	31	83	2023-11-16 14:42:49	2023-11-16 14:42:49
1787	31	123	2023-11-16 14:42:49	2023-11-16 14:42:49
1788	31	129	2023-11-16 14:42:49	2023-11-16 14:42:49
1789	31	38	2023-11-16 14:42:49	2023-11-16 14:42:49
1790	31	157	2023-11-16 14:42:49	2023-11-16 14:42:49
1791	31	42	2023-11-16 14:42:49	2023-11-16 14:42:49
1792	31	115	2023-11-16 14:42:49	2023-11-16 14:42:49
1793	31	124	2023-11-16 14:42:49	2023-11-16 14:42:49
1794	31	133	2023-11-16 14:42:49	2023-11-16 14:42:49
1795	31	138	2023-11-16 14:42:49	2023-11-16 14:42:49
1796	31	146	2023-11-16 14:42:49	2023-11-16 14:42:49
1797	31	130	2023-11-16 14:42:49	2023-11-16 14:42:49
1798	31	141	2023-11-16 14:42:49	2023-11-16 14:42:49
1799	31	158	2023-11-16 14:42:49	2023-11-16 14:42:49
1800	31	41	2023-11-16 14:42:49	2023-11-16 14:42:49
1801	31	43	2023-11-16 14:42:49	2023-11-16 14:42:49
1802	31	45	2023-11-16 14:42:49	2023-11-16 14:42:49
1803	31	48	2023-11-16 14:42:49	2023-11-16 14:42:49
1804	31	159	2023-11-16 14:42:49	2023-11-16 14:42:49
1805	31	116	2023-11-16 14:42:49	2023-11-16 14:42:49
1806	31	142	2023-11-16 14:42:49	2023-11-16 14:42:49
1807	31	125	2023-11-16 14:42:49	2023-11-16 14:42:49
1808	31	39	2023-11-16 14:42:49	2023-11-16 14:42:49
1809	31	134	2023-11-16 14:42:49	2023-11-16 14:42:49
1810	31	47	2023-11-16 14:42:49	2023-11-16 14:42:49
1811	31	139	2023-11-16 14:42:49	2023-11-16 14:42:49
1812	31	50	2023-11-16 14:42:49	2023-11-16 14:42:49
1813	31	40	2023-11-16 14:42:49	2023-11-16 14:42:49
1814	31	51	2023-11-16 14:42:49	2023-11-16 14:42:49
1815	31	37	2023-11-16 14:42:49	2023-11-16 14:42:49
1816	31	49	2023-11-16 14:42:49	2023-11-16 14:42:49
1817	31	46	2023-11-16 14:42:49	2023-11-16 14:42:49
1818	31	44	2023-11-16 14:42:49	2023-11-16 14:42:49
1819	31	52	2023-11-16 14:42:49	2023-11-16 14:42:49
1820	31	61	2023-11-16 14:42:49	2023-11-16 14:42:49
1821	31	57	2023-11-16 14:42:49	2023-11-16 14:42:49
1822	31	53	2023-11-16 14:42:49	2023-11-16 14:42:49
1823	31	54	2023-11-16 14:42:49	2023-11-16 14:42:49
1824	31	65	2023-11-16 14:42:49	2023-11-16 14:42:49
1825	31	63	2023-11-16 14:42:49	2023-11-16 14:42:49
1826	31	55	2023-11-16 14:42:49	2023-11-16 14:42:49
1827	31	62	2023-11-16 14:42:49	2023-11-16 14:42:49
1828	31	60	2023-11-16 14:42:49	2023-11-16 14:42:49
1829	31	56	2023-11-16 14:42:49	2023-11-16 14:42:49
1830	31	59	2023-11-16 14:42:49	2023-11-16 14:42:49
1831	31	66	2023-11-16 14:42:49	2023-11-16 14:42:49
1832	31	64	2023-11-16 14:42:49	2023-11-16 14:42:49
1833	31	58	2023-11-16 14:42:49	2023-11-16 14:42:49
1834	31	67	2023-11-16 14:42:49	2023-11-16 14:42:49
1835	31	148	2023-11-16 14:42:49	2023-11-16 14:42:49
1836	31	68	2023-11-16 14:42:49	2023-11-16 14:42:49
1837	31	69	2023-11-16 14:42:49	2023-11-16 14:42:49
1838	31	72	2023-11-16 14:42:49	2023-11-16 14:42:49
1839	31	76	2023-11-16 14:42:49	2023-11-16 14:42:49
1840	31	70	2023-11-16 14:42:49	2023-11-16 14:42:49
1841	31	79	2023-11-16 14:42:49	2023-11-16 14:42:49
1842	31	75	2023-11-16 14:42:49	2023-11-16 14:42:49
1843	31	78	2023-11-16 14:42:49	2023-11-16 14:42:49
1844	31	77	2023-11-16 14:42:49	2023-11-16 14:42:49
1845	31	80	2023-11-16 14:42:49	2023-11-16 14:42:49
1846	31	81	2023-11-16 14:42:49	2023-11-16 14:42:49
1847	31	82	2023-11-16 14:42:49	2023-11-16 14:42:49
1848	31	71	2023-11-16 14:42:49	2023-11-16 14:42:49
1849	31	84	2023-11-16 14:42:49	2023-11-16 14:42:49
1850	31	85	2023-11-16 14:42:49	2023-11-16 14:42:49
1851	31	74	2023-11-16 14:42:49	2023-11-16 14:42:49
1852	31	117	2023-11-16 14:42:49	2023-11-16 14:42:49
1853	31	135	2023-11-16 14:42:49	2023-11-16 14:42:49
1854	31	126	2023-11-16 14:42:49	2023-11-16 14:42:49
1855	31	143	2023-11-16 14:42:49	2023-11-16 14:42:49
1856	31	153	2023-11-16 14:42:49	2023-11-16 14:42:49
1857	31	95	2023-11-16 14:42:49	2023-11-16 14:42:49
1858	31	92	2023-11-16 14:42:49	2023-11-16 14:42:49
1859	31	127	2023-11-16 14:42:49	2023-11-16 14:42:49
1860	31	91	2023-11-16 14:42:49	2023-11-16 14:42:49
1861	31	86	2023-11-16 14:42:49	2023-11-16 14:42:49
1862	31	88	2023-11-16 14:42:49	2023-11-16 14:42:49
1863	31	87	2023-11-16 14:42:49	2023-11-16 14:42:49
1864	31	94	2023-11-16 14:42:49	2023-11-16 14:42:49
1865	31	96	2023-11-16 14:42:49	2023-11-16 14:42:49
1866	31	89	2023-11-16 14:42:49	2023-11-16 14:42:49
1867	31	118	2023-11-16 14:42:49	2023-11-16 14:42:49
1868	31	90	2023-11-16 14:42:49	2023-11-16 14:42:49
1869	31	154	2023-11-16 14:42:49	2023-11-16 14:42:49
1870	31	93	2023-11-16 14:42:49	2023-11-16 14:42:49
1871	31	155	2023-11-16 14:42:49	2023-11-16 14:42:49
1872	31	16	2023-11-16 14:42:49	2023-11-16 14:42:49
1873	31	121	2023-11-16 14:42:49	2023-11-16 14:42:49
1874	31	106	2023-11-16 14:42:49	2023-11-16 14:42:49
1875	31	101	2023-11-16 14:42:49	2023-11-16 14:42:49
1876	31	98	2023-11-16 14:42:49	2023-11-16 14:42:49
1877	31	105	2023-11-16 14:42:49	2023-11-16 14:42:49
1878	31	100	2023-11-16 14:42:49	2023-11-16 14:42:49
1879	31	99	2023-11-16 14:42:49	2023-11-16 14:42:49
1880	31	102	2023-11-16 14:42:49	2023-11-16 14:42:49
1881	31	103	2023-11-16 14:42:49	2023-11-16 14:42:49
1882	31	73	2023-11-16 14:42:49	2023-11-16 14:42:49
1883	31	109	2023-11-16 14:42:49	2023-11-16 14:42:49
1884	31	108	2023-11-16 14:42:49	2023-11-16 14:42:49
1885	31	104	2023-11-16 14:42:49	2023-11-16 14:42:49
1886	31	110	2023-11-16 14:42:49	2023-11-16 14:42:49
1887	31	107	2023-11-16 14:42:49	2023-11-16 14:42:49
1888	31	119	2023-11-16 14:42:49	2023-11-16 14:42:49
1889	31	132	2023-11-16 14:42:49	2023-11-16 14:42:49
1890	31	140	2023-11-16 14:42:49	2023-11-16 14:42:49
1891	31	156	2023-11-16 14:42:49	2023-11-16 14:42:49
1892	31	112	2023-11-16 14:42:49	2023-11-16 14:42:49
1893	31	136	2023-11-16 14:42:49	2023-11-16 14:42:49
1894	31	120	2023-11-16 14:42:49	2023-11-16 14:42:49
1895	31	113	2023-11-16 14:42:49	2023-11-16 14:42:49
1896	31	111	2023-11-16 14:42:49	2023-11-16 14:42:49
1897	31	144	2023-11-16 14:42:49	2023-11-16 14:42:49
1898	31	122	2023-11-16 14:42:49	2023-11-16 14:42:49
1899	31	128	2023-11-16 14:42:49	2023-11-16 14:42:49
1900	32	114	2023-11-16 14:43:20	2023-11-16 14:43:20
1901	32	137	2023-11-16 14:43:20	2023-11-16 14:43:20
1902	32	145	2023-11-16 14:43:20	2023-11-16 14:43:20
1903	32	97	2023-11-16 14:43:20	2023-11-16 14:43:20
1904	32	83	2023-11-16 14:43:20	2023-11-16 14:43:20
1905	32	123	2023-11-16 14:43:20	2023-11-16 14:43:20
1906	32	129	2023-11-16 14:43:20	2023-11-16 14:43:20
1907	32	38	2023-11-16 14:43:20	2023-11-16 14:43:20
1908	32	157	2023-11-16 14:43:20	2023-11-16 14:43:20
1909	32	42	2023-11-16 14:43:20	2023-11-16 14:43:20
1910	32	115	2023-11-16 14:43:20	2023-11-16 14:43:20
1911	32	124	2023-11-16 14:43:20	2023-11-16 14:43:20
1912	32	133	2023-11-16 14:43:20	2023-11-16 14:43:20
1913	32	138	2023-11-16 14:43:20	2023-11-16 14:43:20
1914	32	146	2023-11-16 14:43:20	2023-11-16 14:43:20
1915	32	130	2023-11-16 14:43:20	2023-11-16 14:43:20
1916	32	141	2023-11-16 14:43:20	2023-11-16 14:43:20
1917	32	158	2023-11-16 14:43:20	2023-11-16 14:43:20
1918	32	41	2023-11-16 14:43:20	2023-11-16 14:43:20
1919	32	43	2023-11-16 14:43:20	2023-11-16 14:43:20
1920	32	45	2023-11-16 14:43:20	2023-11-16 14:43:20
1921	32	48	2023-11-16 14:43:20	2023-11-16 14:43:20
1922	32	159	2023-11-16 14:43:20	2023-11-16 14:43:20
1923	32	116	2023-11-16 14:43:20	2023-11-16 14:43:20
1924	32	142	2023-11-16 14:43:20	2023-11-16 14:43:20
1925	32	125	2023-11-16 14:43:20	2023-11-16 14:43:20
1926	32	39	2023-11-16 14:43:20	2023-11-16 14:43:20
1927	32	134	2023-11-16 14:43:20	2023-11-16 14:43:20
1928	32	47	2023-11-16 14:43:20	2023-11-16 14:43:20
1929	32	139	2023-11-16 14:43:20	2023-11-16 14:43:20
1930	32	50	2023-11-16 14:43:20	2023-11-16 14:43:20
1931	32	40	2023-11-16 14:43:20	2023-11-16 14:43:20
1932	32	51	2023-11-16 14:43:20	2023-11-16 14:43:20
1933	32	37	2023-11-16 14:43:20	2023-11-16 14:43:20
1934	32	49	2023-11-16 14:43:20	2023-11-16 14:43:20
1935	32	46	2023-11-16 14:43:20	2023-11-16 14:43:20
1936	32	44	2023-11-16 14:43:20	2023-11-16 14:43:20
1937	32	52	2023-11-16 14:43:20	2023-11-16 14:43:20
1938	32	61	2023-11-16 14:43:20	2023-11-16 14:43:20
1939	32	57	2023-11-16 14:43:20	2023-11-16 14:43:20
1940	32	53	2023-11-16 14:43:20	2023-11-16 14:43:20
1941	32	54	2023-11-16 14:43:20	2023-11-16 14:43:20
1942	32	65	2023-11-16 14:43:20	2023-11-16 14:43:20
1943	32	63	2023-11-16 14:43:20	2023-11-16 14:43:20
1944	32	55	2023-11-16 14:43:20	2023-11-16 14:43:20
1945	32	62	2023-11-16 14:43:20	2023-11-16 14:43:20
1946	32	60	2023-11-16 14:43:20	2023-11-16 14:43:20
1947	32	56	2023-11-16 14:43:20	2023-11-16 14:43:20
1948	32	59	2023-11-16 14:43:20	2023-11-16 14:43:20
1949	32	66	2023-11-16 14:43:20	2023-11-16 14:43:20
1950	32	64	2023-11-16 14:43:20	2023-11-16 14:43:20
1951	32	58	2023-11-16 14:43:20	2023-11-16 14:43:20
1952	32	67	2023-11-16 14:43:20	2023-11-16 14:43:20
1953	32	148	2023-11-16 14:43:20	2023-11-16 14:43:20
1954	32	68	2023-11-16 14:43:20	2023-11-16 14:43:20
1955	32	69	2023-11-16 14:43:20	2023-11-16 14:43:20
1956	32	72	2023-11-16 14:43:20	2023-11-16 14:43:20
1957	32	76	2023-11-16 14:43:20	2023-11-16 14:43:20
1958	32	70	2023-11-16 14:43:20	2023-11-16 14:43:20
1959	32	79	2023-11-16 14:43:20	2023-11-16 14:43:20
1960	32	75	2023-11-16 14:43:20	2023-11-16 14:43:20
1961	32	78	2023-11-16 14:43:20	2023-11-16 14:43:20
1962	32	77	2023-11-16 14:43:20	2023-11-16 14:43:20
1963	32	80	2023-11-16 14:43:20	2023-11-16 14:43:20
1964	32	81	2023-11-16 14:43:20	2023-11-16 14:43:20
1965	32	82	2023-11-16 14:43:20	2023-11-16 14:43:20
1966	32	71	2023-11-16 14:43:20	2023-11-16 14:43:20
1967	32	84	2023-11-16 14:43:20	2023-11-16 14:43:20
1968	32	85	2023-11-16 14:43:20	2023-11-16 14:43:20
1969	32	74	2023-11-16 14:43:20	2023-11-16 14:43:20
1970	32	117	2023-11-16 14:43:20	2023-11-16 14:43:20
1971	32	135	2023-11-16 14:43:20	2023-11-16 14:43:20
1972	32	126	2023-11-16 14:43:20	2023-11-16 14:43:20
1973	32	143	2023-11-16 14:43:20	2023-11-16 14:43:20
1974	32	153	2023-11-16 14:43:20	2023-11-16 14:43:20
1975	32	95	2023-11-16 14:43:20	2023-11-16 14:43:20
1976	32	92	2023-11-16 14:43:20	2023-11-16 14:43:20
1977	32	127	2023-11-16 14:43:20	2023-11-16 14:43:20
1978	32	91	2023-11-16 14:43:20	2023-11-16 14:43:20
1979	32	86	2023-11-16 14:43:20	2023-11-16 14:43:20
1980	32	88	2023-11-16 14:43:20	2023-11-16 14:43:20
1981	32	87	2023-11-16 14:43:20	2023-11-16 14:43:20
1982	32	94	2023-11-16 14:43:20	2023-11-16 14:43:20
1983	32	96	2023-11-16 14:43:20	2023-11-16 14:43:20
1984	32	89	2023-11-16 14:43:20	2023-11-16 14:43:20
1985	32	118	2023-11-16 14:43:20	2023-11-16 14:43:20
1986	32	90	2023-11-16 14:43:20	2023-11-16 14:43:20
1987	32	154	2023-11-16 14:43:20	2023-11-16 14:43:20
1988	32	93	2023-11-16 14:43:20	2023-11-16 14:43:20
1989	32	155	2023-11-16 14:43:20	2023-11-16 14:43:20
1990	32	16	2023-11-16 14:43:20	2023-11-16 14:43:20
1991	32	121	2023-11-16 14:43:20	2023-11-16 14:43:20
1992	32	106	2023-11-16 14:43:20	2023-11-16 14:43:20
1993	32	101	2023-11-16 14:43:20	2023-11-16 14:43:20
1994	32	98	2023-11-16 14:43:20	2023-11-16 14:43:20
1995	32	105	2023-11-16 14:43:20	2023-11-16 14:43:20
1996	32	100	2023-11-16 14:43:20	2023-11-16 14:43:20
1997	32	99	2023-11-16 14:43:20	2023-11-16 14:43:20
1998	32	102	2023-11-16 14:43:20	2023-11-16 14:43:20
1999	32	103	2023-11-16 14:43:20	2023-11-16 14:43:20
2000	32	73	2023-11-16 14:43:20	2023-11-16 14:43:20
2001	32	109	2023-11-16 14:43:20	2023-11-16 14:43:20
2002	32	108	2023-11-16 14:43:20	2023-11-16 14:43:20
2003	32	104	2023-11-16 14:43:20	2023-11-16 14:43:20
2004	32	110	2023-11-16 14:43:20	2023-11-16 14:43:20
2005	32	107	2023-11-16 14:43:20	2023-11-16 14:43:20
2006	32	119	2023-11-16 14:43:20	2023-11-16 14:43:20
2007	32	132	2023-11-16 14:43:20	2023-11-16 14:43:20
2008	32	140	2023-11-16 14:43:20	2023-11-16 14:43:20
2009	32	156	2023-11-16 14:43:20	2023-11-16 14:43:20
2010	32	112	2023-11-16 14:43:20	2023-11-16 14:43:20
2011	32	136	2023-11-16 14:43:20	2023-11-16 14:43:20
2012	32	120	2023-11-16 14:43:20	2023-11-16 14:43:20
2013	32	113	2023-11-16 14:43:20	2023-11-16 14:43:20
2014	32	111	2023-11-16 14:43:20	2023-11-16 14:43:20
2015	32	144	2023-11-16 14:43:20	2023-11-16 14:43:20
2016	32	122	2023-11-16 14:43:20	2023-11-16 14:43:20
2017	32	128	2023-11-16 14:43:20	2023-11-16 14:43:20
2018	33	114	2023-11-16 14:43:58	2023-11-16 14:43:58
2019	33	137	2023-11-16 14:43:58	2023-11-16 14:43:58
2020	33	145	2023-11-16 14:43:58	2023-11-16 14:43:58
2021	33	97	2023-11-16 14:43:58	2023-11-16 14:43:58
2022	33	83	2023-11-16 14:43:58	2023-11-16 14:43:58
2023	33	123	2023-11-16 14:43:58	2023-11-16 14:43:58
2024	33	129	2023-11-16 14:43:58	2023-11-16 14:43:58
2025	33	38	2023-11-16 14:43:58	2023-11-16 14:43:58
2026	33	157	2023-11-16 14:43:58	2023-11-16 14:43:58
2027	33	42	2023-11-16 14:43:58	2023-11-16 14:43:58
2028	33	115	2023-11-16 14:43:58	2023-11-16 14:43:58
2029	33	124	2023-11-16 14:43:58	2023-11-16 14:43:58
2030	33	133	2023-11-16 14:43:58	2023-11-16 14:43:58
2031	33	138	2023-11-16 14:43:58	2023-11-16 14:43:58
2032	33	146	2023-11-16 14:43:58	2023-11-16 14:43:58
2033	33	130	2023-11-16 14:43:58	2023-11-16 14:43:58
2034	33	141	2023-11-16 14:43:58	2023-11-16 14:43:58
2035	33	158	2023-11-16 14:43:58	2023-11-16 14:43:58
2036	33	41	2023-11-16 14:43:58	2023-11-16 14:43:58
2037	33	43	2023-11-16 14:43:58	2023-11-16 14:43:58
2038	33	45	2023-11-16 14:43:58	2023-11-16 14:43:58
2039	33	48	2023-11-16 14:43:58	2023-11-16 14:43:58
2040	33	159	2023-11-16 14:43:58	2023-11-16 14:43:58
2041	33	116	2023-11-16 14:43:58	2023-11-16 14:43:58
2042	33	142	2023-11-16 14:43:58	2023-11-16 14:43:58
2043	33	125	2023-11-16 14:43:58	2023-11-16 14:43:58
2044	33	39	2023-11-16 14:43:58	2023-11-16 14:43:58
2045	33	134	2023-11-16 14:43:58	2023-11-16 14:43:58
2046	33	47	2023-11-16 14:43:58	2023-11-16 14:43:58
2047	33	139	2023-11-16 14:43:58	2023-11-16 14:43:58
2048	33	50	2023-11-16 14:43:58	2023-11-16 14:43:58
2049	33	40	2023-11-16 14:43:58	2023-11-16 14:43:58
2050	33	51	2023-11-16 14:43:58	2023-11-16 14:43:58
2051	33	37	2023-11-16 14:43:58	2023-11-16 14:43:58
2052	33	49	2023-11-16 14:43:58	2023-11-16 14:43:58
2053	33	46	2023-11-16 14:43:58	2023-11-16 14:43:58
2054	33	44	2023-11-16 14:43:58	2023-11-16 14:43:58
2055	33	52	2023-11-16 14:43:58	2023-11-16 14:43:58
2056	33	61	2023-11-16 14:43:58	2023-11-16 14:43:58
2057	33	57	2023-11-16 14:43:58	2023-11-16 14:43:58
2058	33	53	2023-11-16 14:43:58	2023-11-16 14:43:58
2059	33	54	2023-11-16 14:43:58	2023-11-16 14:43:58
2060	33	65	2023-11-16 14:43:58	2023-11-16 14:43:58
2061	33	63	2023-11-16 14:43:58	2023-11-16 14:43:58
2062	33	55	2023-11-16 14:43:58	2023-11-16 14:43:58
2063	33	62	2023-11-16 14:43:58	2023-11-16 14:43:58
2064	33	60	2023-11-16 14:43:58	2023-11-16 14:43:58
2065	33	56	2023-11-16 14:43:58	2023-11-16 14:43:58
2066	33	59	2023-11-16 14:43:58	2023-11-16 14:43:58
2067	33	66	2023-11-16 14:43:58	2023-11-16 14:43:58
2068	33	64	2023-11-16 14:43:58	2023-11-16 14:43:58
2069	33	58	2023-11-16 14:43:58	2023-11-16 14:43:58
2070	33	67	2023-11-16 14:43:58	2023-11-16 14:43:58
2071	33	148	2023-11-16 14:43:58	2023-11-16 14:43:58
2072	33	68	2023-11-16 14:43:58	2023-11-16 14:43:58
2073	33	69	2023-11-16 14:43:58	2023-11-16 14:43:58
2074	33	72	2023-11-16 14:43:58	2023-11-16 14:43:58
2075	33	76	2023-11-16 14:43:58	2023-11-16 14:43:58
2076	33	70	2023-11-16 14:43:58	2023-11-16 14:43:58
2077	33	79	2023-11-16 14:43:58	2023-11-16 14:43:58
2078	33	75	2023-11-16 14:43:58	2023-11-16 14:43:58
2079	33	78	2023-11-16 14:43:58	2023-11-16 14:43:58
2080	33	77	2023-11-16 14:43:58	2023-11-16 14:43:58
2081	33	80	2023-11-16 14:43:58	2023-11-16 14:43:58
2082	33	81	2023-11-16 14:43:58	2023-11-16 14:43:58
2083	33	82	2023-11-16 14:43:58	2023-11-16 14:43:58
2084	33	71	2023-11-16 14:43:58	2023-11-16 14:43:58
2085	33	84	2023-11-16 14:43:58	2023-11-16 14:43:58
2086	33	85	2023-11-16 14:43:58	2023-11-16 14:43:58
2087	33	74	2023-11-16 14:43:58	2023-11-16 14:43:58
2088	33	117	2023-11-16 14:43:58	2023-11-16 14:43:58
2089	33	135	2023-11-16 14:43:58	2023-11-16 14:43:58
2090	33	126	2023-11-16 14:43:58	2023-11-16 14:43:58
2091	33	143	2023-11-16 14:43:58	2023-11-16 14:43:58
2092	33	153	2023-11-16 14:43:58	2023-11-16 14:43:58
2093	33	95	2023-11-16 14:43:58	2023-11-16 14:43:58
2094	33	92	2023-11-16 14:43:58	2023-11-16 14:43:58
2095	33	127	2023-11-16 14:43:58	2023-11-16 14:43:58
2096	33	91	2023-11-16 14:43:58	2023-11-16 14:43:58
2097	33	86	2023-11-16 14:43:58	2023-11-16 14:43:58
2098	33	88	2023-11-16 14:43:58	2023-11-16 14:43:58
2099	33	87	2023-11-16 14:43:58	2023-11-16 14:43:58
2100	33	94	2023-11-16 14:43:58	2023-11-16 14:43:58
2101	33	96	2023-11-16 14:43:58	2023-11-16 14:43:58
2102	33	89	2023-11-16 14:43:58	2023-11-16 14:43:58
2103	33	118	2023-11-16 14:43:58	2023-11-16 14:43:58
2104	33	90	2023-11-16 14:43:58	2023-11-16 14:43:58
2105	33	154	2023-11-16 14:43:58	2023-11-16 14:43:58
2106	33	93	2023-11-16 14:43:58	2023-11-16 14:43:58
2107	33	155	2023-11-16 14:43:58	2023-11-16 14:43:58
2108	33	16	2023-11-16 14:43:58	2023-11-16 14:43:58
2109	33	121	2023-11-16 14:43:58	2023-11-16 14:43:58
2110	33	106	2023-11-16 14:43:58	2023-11-16 14:43:58
2111	33	101	2023-11-16 14:43:58	2023-11-16 14:43:58
2112	33	98	2023-11-16 14:43:58	2023-11-16 14:43:58
2113	33	105	2023-11-16 14:43:58	2023-11-16 14:43:58
2114	33	100	2023-11-16 14:43:58	2023-11-16 14:43:58
2115	33	99	2023-11-16 14:43:58	2023-11-16 14:43:58
2116	33	102	2023-11-16 14:43:58	2023-11-16 14:43:58
2117	33	103	2023-11-16 14:43:58	2023-11-16 14:43:58
2118	33	73	2023-11-16 14:43:58	2023-11-16 14:43:58
2119	33	109	2023-11-16 14:43:58	2023-11-16 14:43:58
2120	33	108	2023-11-16 14:43:58	2023-11-16 14:43:58
2121	33	104	2023-11-16 14:43:58	2023-11-16 14:43:58
2122	33	110	2023-11-16 14:43:58	2023-11-16 14:43:58
2123	33	107	2023-11-16 14:43:58	2023-11-16 14:43:58
2124	33	119	2023-11-16 14:43:58	2023-11-16 14:43:58
2125	33	132	2023-11-16 14:43:58	2023-11-16 14:43:58
2126	33	140	2023-11-16 14:43:58	2023-11-16 14:43:58
2127	33	156	2023-11-16 14:43:58	2023-11-16 14:43:58
2128	33	112	2023-11-16 14:43:58	2023-11-16 14:43:58
2129	33	136	2023-11-16 14:43:58	2023-11-16 14:43:58
2130	33	120	2023-11-16 14:43:58	2023-11-16 14:43:58
2131	33	113	2023-11-16 14:43:58	2023-11-16 14:43:58
2132	33	111	2023-11-16 14:43:58	2023-11-16 14:43:58
2133	33	144	2023-11-16 14:43:58	2023-11-16 14:43:58
2134	33	122	2023-11-16 14:43:58	2023-11-16 14:43:58
2135	33	128	2023-11-16 14:43:58	2023-11-16 14:43:58
2136	34	124	2023-11-16 14:46:00	2023-11-16 14:46:00
2137	34	122	2023-11-16 14:46:00	2023-11-16 14:46:00
2138	35	124	2023-11-16 14:46:45	2023-11-16 14:46:45
2139	35	122	2023-11-16 14:46:45	2023-11-16 14:46:45
2140	36	124	2023-11-16 14:46:57	2023-11-16 14:46:57
2141	36	122	2023-11-16 14:46:57	2023-11-16 14:46:57
2142	37	124	2023-11-16 14:47:08	2023-11-16 14:47:08
2143	37	122	2023-11-16 14:47:08	2023-11-16 14:47:08
2144	38	124	2023-11-16 14:47:29	2023-11-16 14:47:29
2145	38	122	2023-11-16 14:47:29	2023-11-16 14:47:29
2146	39	122	2023-11-16 14:48:43	2023-11-16 14:48:43
2147	40	122	2023-11-16 14:49:20	2023-11-16 14:49:20
2148	41	73	2023-11-16 14:52:11	2023-11-16 14:52:11
2149	42	73	2023-11-16 14:52:19	2023-11-16 14:52:19
2150	43	73	2023-11-16 14:53:17	2023-11-16 14:53:17
2151	44	122	2023-11-16 14:55:47	2023-11-16 14:55:47
2152	45	122	2023-11-16 14:56:43	2023-11-16 14:56:43
2153	46	122	2023-11-16 14:57:31	2023-11-16 14:57:31
2154	47	73	2023-11-16 14:58:25	2023-11-16 14:58:25
2155	48	122	2023-11-16 14:59:32	2023-11-16 14:59:32
2158	51	73	2023-11-16 15:02:13	2023-11-16 15:02:13
2159	52	122	2023-11-16 15:05:35	2023-11-16 15:05:35
2160	53	73	2023-11-16 15:06:07	2023-11-16 15:06:07
2161	54	83	2023-11-16 15:09:50	2023-11-16 15:09:50
2162	55	83	2023-11-16 15:16:37	2023-11-16 15:16:37
2163	55	73	2023-11-16 15:16:37	2023-11-16 15:16:37
2164	57	179	2023-11-20 14:44:46	2023-11-20 14:44:46
2165	57	177	2023-11-20 14:44:46	2023-11-20 14:44:46
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, user_id, description, generated_by, generated_to, is_read, created_at, updated_at, title, image, status) FROM stdin;
1	\N	test	\N	\N	\N	2023-11-13 14:49:28	2023-11-13 14:49:28	test	6551ff389377a_1699872568.png	active
3	\N	Description	\N	\N	\N	2023-11-15 08:38:05	2023-11-15 08:38:05	Test	\N	active
2	\N	Admin Push Test Description	\N	\N	\N	2023-11-15 08:26:09	2023-11-16 13:46:47	Test Admin Push	6555e50726dfa_1700128007.png	active
4	\N	Test Admin Push	\N	\N	\N	2023-11-16 13:48:11	2023-11-16 13:48:11	Test Admin	6555e55b41029_1700128091.png	active
5	\N	Test Admin push Description	\N	\N	\N	2023-11-16 14:23:02	2023-11-16 14:23:02	Test Admin	6555ed8668825_1700130182.png	active
6	\N	Test Admin push Description	\N	\N	\N	2023-11-16 14:23:13	2023-11-16 14:23:13	Test Admin	6555ed91ef18c_1700130193.png	active
8	\N	Test Admin push Admin	\N	\N	\N	2023-11-16 14:24:16	2023-11-16 14:24:16	Test Admin	6555edd06bba7_1700130256.png	active
9	\N	Test Admin push Admin	\N	\N	\N	2023-11-16 14:25:34	2023-11-16 14:25:34	Test Admin	6555ee1ed4423_1700130334.png	active
10	\N	Test Admin push Admin	\N	\N	\N	2023-11-16 14:26:46	2023-11-16 14:26:46	Test Admin	6555ee66dbf58_1700130406.png	active
11	\N	Notification Create	\N	\N	\N	2023-11-16 14:27:20	2023-11-16 14:27:20	Test123	6555ee88b8a75_1700130440.jpeg	active
12	\N	Title	\N	\N	\N	2023-11-16 14:29:03	2023-11-16 14:29:03	Title	6555eeefdd06a_1700130543.jpg	active
13	\N	Title	\N	\N	\N	2023-11-16 14:31:16	2023-11-16 14:31:16	Title	6555ef7465329_1700130676.jpg	active
14	\N	Title	\N	\N	\N	2023-11-16 14:32:45	2023-11-16 14:32:45	Title	6555efcd905e5_1700130765.jpg	active
15	\N	Title	\N	\N	\N	2023-11-16 14:34:02	2023-11-16 14:34:02	Title	6555f01aa9b70_1700130842.jpg	active
16	\N	Title	\N	\N	\N	2023-11-16 14:34:20	2023-11-16 14:34:20	Title	6555f02c3543d_1700130860.jpg	active
17	\N	Title	\N	\N	\N	2023-11-16 14:34:34	2023-11-16 14:34:34	Title	6555f03ad46fb_1700130874.jpg	active
18	\N	Title	\N	\N	\N	2023-11-16 14:34:56	2023-11-16 14:34:56	Title	6555f0509f080_1700130896.jpg	active
19	\N	Title	\N	\N	\N	2023-11-16 14:35:17	2023-11-16 14:35:17	Title	6555f06537faf_1700130917.jpg	active
20	\N	Test Admin push Admin	\N	\N	\N	2023-11-16 14:35:23	2023-11-16 14:35:23	Test Admin	6555f06b75c4f_1700130923.png	active
21	\N	Title	\N	\N	\N	2023-11-16 14:35:45	2023-11-16 14:35:45	Title	6555f08127552_1700130945.jpg	active
22	\N	Title	\N	\N	\N	2023-11-16 14:37:37	2023-11-16 14:37:37	Title	6555f0f1191de_1700131057.jpg	active
23	\N	Title	\N	\N	\N	2023-11-16 14:38:19	2023-11-16 14:38:19	Title	6555f11b5c13e_1700131099.jpg	active
24	\N	Title	\N	\N	\N	2023-11-16 14:39:09	2023-11-16 14:39:09	Title	6555f14d75074_1700131149.jpg	active
25	\N	Test Admin push	\N	\N	\N	2023-11-16 14:39:34	2023-11-16 14:39:34	Test Admin	6555f1660707f_1700131174.png	active
26	\N	Title	\N	\N	\N	2023-11-16 14:40:03	2023-11-16 14:40:03	Title	6555f183056bb_1700131203.jpg	active
27	\N	Title	\N	\N	\N	2023-11-16 14:40:26	2023-11-16 14:40:26	Title	6555f19ac581a_1700131226.jpg	active
28	\N	Title	\N	\N	\N	2023-11-16 14:41:12	2023-11-16 14:41:12	Title	6555f1c829155_1700131272.jpg	active
29	\N	Title	\N	\N	\N	2023-11-16 14:42:16	2023-11-16 14:42:16	Title	6555f20871b17_1700131336.jpg	active
30	\N	Test Admin push	\N	\N	\N	2023-11-16 14:42:21	2023-11-16 14:42:21	Test Admin	6555f20d77135_1700131341.png	active
31	\N	Title	\N	\N	\N	2023-11-16 14:42:49	2023-11-16 14:42:49	Title	6555f22902278_1700131369.jpg	active
32	\N	Title	\N	\N	\N	2023-11-16 14:43:20	2023-11-16 14:43:20	Title	6555f2485874d_1700131400.jpg	active
33	\N	Title	\N	\N	\N	2023-11-16 14:43:58	2023-11-16 14:43:58	Title	6555f26ebd16a_1700131438.jpg	active
34	\N	Title	\N	\N	\N	2023-11-16 14:46:00	2023-11-16 14:46:00	Title	\N	active
35	\N	Title	\N	\N	\N	2023-11-16 14:46:45	2023-11-16 14:46:45	Title	\N	active
36	\N	Title	\N	\N	\N	2023-11-16 14:46:57	2023-11-16 14:46:57	Title	\N	active
37	\N	Title	\N	\N	\N	2023-11-16 14:47:08	2023-11-16 14:47:08	Title	\N	active
38	\N	Title	\N	\N	\N	2023-11-16 14:47:29	2023-11-16 14:47:29	Title	\N	active
39	\N	Description	\N	\N	\N	2023-11-16 14:48:43	2023-11-16 14:48:43	Notification Create	\N	active
40	\N	Description	\N	\N	\N	2023-11-16 14:49:20	2023-11-16 14:49:20	Notification Create	\N	active
41	\N	Test Admin push	\N	\N	\N	2023-11-16 14:52:11	2023-11-16 14:52:11	Test Admin	6555f45b4b281_1700131931.png	active
42	\N	Test Admin push	\N	\N	\N	2023-11-16 14:52:19	2023-11-16 14:52:19	Test Admin	6555f463caeea_1700131939.png	active
43	\N	Test Admin push	\N	\N	\N	2023-11-16 14:53:17	2023-11-16 14:53:17	Test Admin	6555f49da7bc6_1700131997.png	active
44	\N	Title	\N	\N	\N	2023-11-16 14:55:47	2023-11-16 14:55:47	Title	\N	active
45	\N	Description	\N	\N	\N	2023-11-16 14:56:43	2023-11-16 14:56:43	Title	\N	active
46	\N	Notification Create	\N	\N	\N	2023-11-16 14:57:31	2023-11-16 14:57:31	Notification Create	\N	active
47	\N	Test Admin push	\N	\N	\N	2023-11-16 14:58:25	2023-11-16 14:58:25	Test Admin	6555f5d1421ea_1700132305.png	active
51	\N	Test Admin push	\N	\N	\N	2023-11-16 15:02:13	2023-11-16 15:02:13	Test Admin	6555f6b5b5118_1700132533.png	active
52	\N	Description	\N	\N	\N	2023-11-16 15:05:35	2023-11-16 15:05:35	Title	6555f77f86b80_1700132735.jpg	active
53	\N	Test Admin Push Description	\N	\N	\N	2023-11-16 15:06:07	2023-11-16 15:06:07	Test Admin Push	6555f79f90f23_1700132767.png	active
48	\N	Notification Create	\N	\N	\N	2023-11-16 14:59:32	2023-11-16 15:06:40	Notification Create	6555f7c0a45a8_1700132800.jpg	active
54	\N	Test Admin Driver Description	\N	\N	\N	2023-11-16 15:09:50	2023-11-16 15:09:50	Test Admin Driver	6555f87e892e2_1700132990.png	active
55	\N	Test Admin Driver Description	\N	\N	\N	2023-11-16 15:16:37	2023-11-16 15:16:37	Test Admin Driver	6555fa1590cd9_1700133397.png	active
56	\N	Now you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved.	\N	\N	\N	2023-11-20 14:43:41	2023-11-20 14:43:41	Admin Push	655b385d90a66_1700477021.jpeg	active
57	\N	Now you can browse privately, and other people who use this device won’t see your activity. However, downloads, bookmarks and reading list items will be saved.	\N	\N	\N	2023-11-20 14:44:46	2023-11-20 14:44:46	Admin Push	655b389e4a0e3_1700477086.jpeg	active
58	\N	Notification Create	\N	\N	\N	2023-11-20 14:46:32	2023-11-20 14:46:32	Notification Create new	\N	active
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages (id, title, status, slug, description, meta_title, meta_keyword, meta_description, lang_code, created_at, updated_at) FROM stdin;
1	About us	1	about-us	<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h2>Why do we use it?</h2>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Where does it come from?</h2>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>	\N	\N	\N	en	2023-10-10 09:15:50	2023-10-10 09:15:50
5	Faq	1	faq	<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>	\N	\N	\N	en	2023-10-10 10:58:51	2023-10-10 10:58:51
2	privacy policy	1	privacy-policy	<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h2>Why do we use it?</h2>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Where does it come from?</h2>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>	\N	\N	\N	en	2023-10-10 09:17:16	2023-10-18 12:29:38
6	Privacy policy	1	driver-privacy-policy	<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	\N	\N	\N	en	2023-10-20 08:55:24	2023-10-20 08:55:24
7	Terms and condition	1	driver-terms-conditions	<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">Timex Shipping LLC appoints _____________________________________(Service Provider) as a non-exclusive service provider to transport the Products in the Territory as requested from time to time by Timex Shipping LLC , the Service provider accepts to provide efficient and effective specialized transportation, in accordance with this Agreement without delay caused by anything within the Service Provider&rsquo;s control, to such place or places as Timex Shipping LLC shall designate. The Service Provider shall supply the equipment / Trucks / Trailers and bear all costs and expenses in connection with the equipment Trucks / Trailers and services being provided.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">Timex Shipping LLC will inform the Service Provider of the timing for picking up the cargo from the collection point / point of origin and the delivery / destination point. The Service Provider shall ensure its transportation vehicles are at the collection point / location at the time and place as instructed by Timex Shipping LLC. Three hours advance notice will be given by Timex Shipping LLC to the Service provider to deploy the truck at the collection point.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">If the consignment is delayed or cancelled for any reason, which includes service provider error, governmental directive, or customs amendment, the service provider is fully responsible for returning the goods to the point of origin &amp; consignor, no compensation will be paid to the service provider for detention or cancellation.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">The Service Provider shall ensure that the Products are transported and delivered in a safe and timely manner.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">Once the Products are collected by the Service Provider, the risk will be transferred to Service Provider including the losses and damages to the consignment (complete loss or partial loss) etc. until unloaded at the consignee premises and until a delivery note is signed without reference to any loss or damage by the recipient.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">The Service Provider should notify Timex Shipping LLC immediately in the event any damage occurs during the transportation, customs inspections, etc.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">The Service Provider shall immediately inform Timex Shipping LLC of any delays, accidents, or other unanticipated events that may prevent scheduled pickup or that occur while cargo is in transit.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">The Service Provider shall scan and share by WhatsApp or by any other means the signed Delivery Note as Proof of Delivery within 1 hour from actual delivery time for local deliveries, and within two hours for cross- border deliveries.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">If the service provider delays placement of the trucks by more than half an hour over and above the agreed time vehicle deployment time at collection point, Timex shipping LLC has the right to cancel the truck placement and the service provider has no right to claim any kind of cancellation fees or compensation from Timex Shipping LLC. In such cases Timex Shipping LLC will not pay any cancellation fee to the service provider.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:12pt"><strong>Free time Requirements: KSA</strong></span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">The service provider agrees to provide free waiting time in Sila Border for up to 24 hours (after documents are submitted to the clearing agent)</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">If the driver has handed over the documents to Batha Clearing Agent on Thursday after 12 noon, this will be considered as Friday, free waiting period would be until Sunday</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">If the Trailer / Truck arrives at Batha border on Friday or Saturday, the service provider agrees to provide free time (free waiting period) until Sunday. Detention fee shall start on Monday. </span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">A letter with sign and stamp from the consignee&rsquo;s clearing agent will be required for payment of any detention charges. </span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">If the Trailer / Truck arrive at offloading site on Thursday afternoon after 12:00 pm, next three days (Friday, Saturday &amp; Sunday) will be considered free and detention starts from Monday afternoon. </span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">Minimum 4 hours&rsquo; free waiting period is required from the service provider to offload the cargo during the working days.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">Any Detention charges must be supported by &quot;stamped letter&quot; given by consignee border agent on their letterhead, mentioning date and time of entry &amp; exit.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:12pt"><strong>Free time Requirements: Kuwait</strong></span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">The service provider agrees to provide free waiting time in Sila Border for up to 24 hours (after documents are submitted to the clearing agent)</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">If the Trailer / Truck arrives at Kuwait Border after 3 PM it be shall considered as next day arrival.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">If the Trailer / Truck arrives on Friday next three days (Friday, Saturday &amp; Sunday) will be considered free waiting period and detention starts on Monday afternoon.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">For any kind of detention charges same will be approved upon the </span><span style="font-size:10pt">&quot;GATE PASS&quot; </span><span style="font-size:10pt">given by Kuwait Border/ Agent.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">If the Trailer / Truck arrive at offloading site / premises on Thursday noon after 12:00 pm, next three days (Friday, Saturday &amp; Sunday) will be considered free waiting period and detention starts from Monday afternoon.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">Minimum 4 hours&rsquo; free waiting period is required from the service provider to offload the cargo during the working days.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">Any detention charges must be supported by &quot;stamped letter&quot; given by consignee border agent on their letterhead, mentioning date and time of entry &amp; exit.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:12pt"><strong>Free time Requirements: Bahrain </strong></span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">The service provider agrees to provide free waiting time in Sila Border for up to 24 hours (after documents are submitted to the clearing agent).</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">If the driver hands over the documents to Bahrain Agent on Thursday after 12:00 pm, this would be considered as Friday, free waiting period would be until Sunday and detention starts from Monday afternoon.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">Minimum 4 hours&rsquo; free waiting period is required from the service provider to offload the cargo during the working days.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">Service Provider should obtain the Bahrain cross way pass from the Bahrain border agent, prior to the entry towards Bahrain border.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">If the Trailer / Truck arrive at offloading site on Thursday noon after 12:00 pm, next three days (Friday, Saturday &amp; Sunday) will be considered free waiting period and detention starts from Monday afternoon.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">Any Detention charges must be supported by &quot;stamped letter&quot; given by consignee border agent on their letterhead, mentioning date and time of entry &amp; exit.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:12pt"><strong>Free time Requirements: Qatar</strong></span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">The service provider agrees to provide free waiting time in Sila Border for up to 24 hours (after documents are submitted to the clearing agent)</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">If the driver hands over the documents to Bahrain Agent on Thursday after 12:00 pm, this would be considered as Friday, free waiting time would be until Sunday.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">Minimum 4 hours&rsquo; free waiting period is required from the service provider to offload the cargo during the working days.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">If the </span><span style="font-size:10pt">Trailer / Truck arrive at offloading site on Thursday noon after 12:00 pm, next three days (Friday, Saturday &amp; Sunday) will be considered free waiting period and detention starts from Monday afternoon.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">Any Detention charges must be supported by &quot;stamped letter&quot; given by consignee border agent on their letterhead, mentioning date and time of entry &amp; exit.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">Further on the above agreed free waiting period the detention charges will be calculated on daily basis at AED 200 &amp; AED 250 per day for trucks and trailers respectively. </span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">Additional loading or offloading and cancellation fees will each be assessed on case by case basis.</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">This Agreement constitutes the entire agreement between the Parties relating to the subject matter of this Agreement and supersedes any previous agreement, communication, representation and understanding, verbal or written, between the Parties with respect to the subject matter of this Agreement</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">No amendment to this Agreement shall be valid unless it is made by way of written document that expressly refers to this Agreement and is executed by duly authorized representatives of each Party. This Agreement shall be governed by and construed in accordance with the laws of the United Arab Emirates</span></span></p>\r\n\r\n<p><span style="font-family:Calibri,serif"><span style="font-size:10pt">Any dispute arising out of this Agreement in any manner whatsoever that cannot be resolved amicably between the Parties, shall be finally settled in the Dubai Courts in accordance with the laws of the United Arab Emirates as applied in the Emirate of Dubai.</span></span></p>\r\n\r\n<p><strong><span style="font-family:Calibri,serif"><span style="color:#000000">On Behalf of Service Provider-</span></span></strong><br />\r\n<span style="font-family:Calibri,serif"><span style="color:#000000">Driver Name :<br />\r\nTransporter Name :<br />\r\nTruck Number :<br />\r\nTrailer Number :<br />\r\nSignature :<br />\r\nMob No :<br />\r\n<br />\r\n<strong>On Behalf of TIMEX-</strong><br />\r\nName :<br />\r\nDesignation:<br />\r\nSignature:<br />\r\nDate:</span></span></p>	\N	\N	\N	en	2023-10-20 08:55:51	2024-06-05 11:20:21
4	Help	1	help	<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>	\N	\N	\N	en	2023-10-10 10:07:19	2023-10-20 08:56:32
9	Cookie Policy	1	cookie-policy	<p>zssssssssssssss</p>	\N	\N	\N	en	2023-11-18 09:50:12	2023-11-18 09:50:12
3	Terms & Conditions	1	terms-and-conditions	<p style="margin-left:48px">All and any business undertaken with Timex Shipping LLC, including any services provided by the Timex Shipping LLC; hereby called &ldquo;the company&rdquo;, is transacted subject to the Terms &amp; Conditions specified below;</p>\r\n\r\n<p><span style="font-size:14pt"><u><strong>Land Freight</strong></u></span></p>\r\n\r\n<ul>\r\n\t<li>Unlessotherwisespecifiedthisquotationisforlandtransportationfreightchargesonly.</li>\r\n\t<li><span style="font-family:Calibri,serif">The company shall be the entitled to enter into contracts for the carriage of goods by any route or by any means. </span></li>\r\n\t<li>Consignor should possess valid export license to export the cargo being shipped.</li>\r\n\t<li><span style="font-family:Calibri,serif">Consignee should possess valid import license to import the cargo.</span></li>\r\n\t<li>The company shall be entitled to retain and be paid all brokerages, commissions, allowances, fines, border charges, customs duty, VAT and other remunerations customarily retained by or paid to forwarding agents and insurance brokers.</li>\r\n\t<li style="margin-right: 49px;">The consignor agrees to indemnify the company against all losses expenses and fines arising from any inaccuracy or omission or errors in the shipping documents.</li>\r\n\t<li>The company shall not accept or deal with any poisonous, dangerous, inflammable, explosive, or perishable products unless particular arrangements have been previously made in writing.</li>\r\n\t<li style="margin-right: 70px;">It is the responsibility of the consignor to provide consignee details and consignee&rsquo;s clearing agent details at the destination border.</li>\r\n\t<li style="margin-right: 55px;">It is the responsibility of the consignor to provide the consignors agent details at Sila border.</li>\r\n\t<li style="margin-right: 40px;">Free waiting period at Sila border is 24 hrs and Batha border is 48 hrs respectively per Trailer / Truck after which daily waiting charge ofAED350.00 will apply, per truck / trailer.</li>\r\n\t<li style="margin-right: 63px;">Free waiting period for offloading the cargo at consignee premises is maximum 3 hours, after which normal waiting charges of AED 50.00 per hour will apply subject to a maximum of AED350.00 per day, per truck/trailer.</li>\r\n\t<li style="margin-right: 79px;">For the collection of goods, free 3 hours waiting period will apply at the origin after which AED 50.00 per hour charges will apply and subject to a maximum of AED 350.00 per day per truck/trailer.</li>\r\n\t<li style="margin-right: 79px;">Quotes provided and thereby shipments are without insurance, unless otherwise specified in the quotation.</li>\r\n\t<li style="margin-right: 52px;">For Free Zone clearance BOE must be provided by the consignor within 3 hours of loading the cargo, otherwise waiting charges of AED 50.00 per hour will be charged for each additional hour, subject to a daily maximum of AED350.00in waiting charges per day / per trailer.</li>\r\n\t<li style="margin-right: 52px;">Cancellation charge of AED 350.00 will apply per truck/trailer, if the shipment is cancelled after the trailer reaches the collection point o<span style="color:#000000">r if </span>the truck is on the way to collection point.</li>\r\n\t<li style="margin-right: 49px;">It is the responsibility of the consignor to provide Timex Shipping LLC the full set chamberized document(s) and any other document(s) required for the shipment for the clearance of the cargo at destination border customs.</li>\r\n\t<li style="margin-right: 49px;">It is the responsibility of consignor to ensure the shipping documents submitted are accurate.</li>\r\n\t<li style="margin-right: 49px;"><span style="font-family:Calibri,serif">Except under special arrangement previously made in writing the company will not accept or deal with bullion coins, precious stones, jewelry, valuable antiques pictures, livestock or plants.</span></li>\r\n\t<li style="margin-right: 76px;">Prior to collection of the cargo from the consignor, the consignee&rsquo;s clearing agent&rsquo;s confirmation / consent in writing is required to proceed with the shipment.</li>\r\n\t<li><span style="font-family:Calibri,serif">The consignor must obtain cargo insurance for each shipment.</span></li>\r\n\t<li><span style="font-family:Calibri,serif">For freight forwarders, freight forwarding companies and shipping companies our responsibility is limited to placement of trucks only. It is the responsibility of the shipper / shipping company/ freight forwarders to ensure correct cargo type and quantity is loaded on to the trailers / vehicle.</span></li>\r\n\t<li><span style="font-family:Calibri,serif">For freight forwarders, freight forwarding companies and shipping companies our responsibility is limited to placement of trucks only. It is the responsibility of the shipper / shipping company/ freight forwarders to ensure that the cargo is fully and partially insured. TIMEX Shipping LLC will not assume responsibility for any damages to the cargo / goods that may arise in any manner including during transit, at the time of loading / offloading of the cargo.</span></li>\r\n\t<li><span style="font-family:Calibri,serif">For freight forwarders, freight forwarding companies and shipping companies our responsibility is limited to placement of trucks only. It is the responsibility of the shipper / shipping company/ freight forwarders to ensure that they load the cargo in the right type of trucks. If cargo is loaded on the wrong truck type any resulting costs like offloading charges, trucks returning to offload, loading cargo on to a new trailer etc. will be on account of the shipper / consigner / freight forwarder / shipping company.</span></li>\r\n\t<li style="margin-right: 82px;">For shipments originating from Free zone, we require BOE for the same form the consignor in order to clear from Sila border.</li>\r\n\t<li style="margin-right: 53px;">For branded products or products with branded artwork, registered trademarks and logos, the products should only be shipped to the authorized brand owner at the destination. i.e. consignee should be the registered brand owner or authorized brand distributer.</li>\r\n\t<li style="margin-right: 43px;">Any specific dress code/ safety code / safety guideline to be followed by the driver at the loading / offloading site should to be communicated to the&nbsp;company 24hrs prior to the date of collection.</li>\r\n\t<li style="margin-right: 43px;">For cargo transported by land freight, all the items must be palletized.</li>\r\n\t<li style="margin-right: 53px;">Fragile items must be labeled and marked fragile.</li>\r\n\t<li>Individual cartoons must be numbered with country of origin printed on each carton.</li>\r\n\t<li>COO must be printed on individual product and on individual pack/packing.</li>\r\n\t<li style="margin-right: 56px;">For shipments to KSA it is mandatory for the consignee to obtain Saber certificate for the consignment.</li>\r\n\t<li style="margin-right: 70px;">All trucks / trailers are to be loaded only after physical inspection of the trailers by our operations executive or any other authorized company employee.</li>\r\n\t<li style="margin-right: 42px;">For shipments to KSA, if the Country of Origin of the goods is the United Arab Emirates, the industrial registration number should be obtained by the consignee and shared with Timex Shipping LLC prior to the collection of the shipment.</li>\r\n\t<li style="margin-right: 56px;">For shipments to KSA, if the final clearance is at Batha, upon the receipt of SILA Bayan from consignor&rsquo;s clearance agent Timex Shipping LLC will obtain naql waybill and provide the same to destination clearing agent.</li>\r\n\t<li style="margin-right: 42px;">It is the responsibility of the consignor to ensure the cargo loaded during rainy season is covered with tarpaulin for all the trailer types</li>\r\n\t<li style="margin-right: 42px;">Any damages arising during transportation is to be settled as per our insurance policy / Insurance provider, a copy of which is available on request or as per NAFL Terms &amp; Conditions, whichever is lower in monetary / claim value.</li>\r\n\t<li style="margin-right: 42px;">Any claims for damages/ missing / shortage in count, should be communicated to Timex Shipping LLC via email after the confirmation of the final delivery (maximum within seven days from the date of delivery of the cargo).</li>\r\n\t<li style="margin-right: 42px;">Timex shipping LLC has the right to provide (use) its own vehicles or outsourced vehicles at agreed rates without prior notification to the consignee or consignor.</li>\r\n\t<li style="margin-right: 42px;">The company shall not be liable to Customer / Consignor / Consignee or owner:</li>\r\n</ul>\r\n\r\n<p style="margin-left:40px; margin-right:42px">a. For loss or damage caused by any failure to carry out or negligence in carrying out the customer&rsquo;s or owner instruction or by any failure to perform or negligence in performing the company&rsquo;s obligations (whether such obligations arise by contract or otherwise).</p>\r\n\r\n<p style="margin-left:40px; margin-right:42px">b. For consequential loss, including loss of profit or loss of market or deviation however caused</p>\r\n\r\n<p style="margin-left:40px; margin-right:42px">c. For loss or damage issues from:</p>\r\n\r\n<p style="margin-left:80px; margin-right:42px">i. Inefficient or improper packing or addressing or</p>\r\n\r\n<p style="margin-left:80px; margin-right:42px">ii. The perishable hazardous fragile or brittle nature or the mechanical derangement of the goods or</p>\r\n\r\n<p style="margin-left:80px; margin-right:42px">iii. Riots civil commotion strikes, lockout, stoppage or restraint of labor from whatsoever cause, whether partial or general or fire or</p>\r\n\r\n<p style="margin-left:80px; margin-right:42px">iv. Failure by the consignees to take delivery within a reasonable time</p>\r\n\r\n<ul>\r\n\t<li>For LTL shipments the cargo will be charged either by weight, volume or by volumetric weight whichever is higher.</li>\r\n\t<li>For LTL shipments the consignor/ shipper agrees and understands the proof of duty payments / VAT payments and proof of detention charges or border charges will not be provided by the company &amp; consignor agrees to settle these payments as per the email advise by The Company.</li>\r\n\t<li>For LTL shipments it is understood by the consignor that the delivery period specified by the company in the communication or in the email or by quote is tentative and not accurate. It is further understood that LTL shipments may delayed indefinitely and for extended periods and The company cannot guarantee any specify delivery date or commit to any delivery deadline for such shipments.</li>\r\n\t<li>The company will place the truck / trailers for collection of the cargo, it is the responsibility of the shipper to inspect the trailers for holes and potential leaks. The shipper assumes fully responsibly for damages arising from rain and the company will not assume any responsibility whatsoever for damages to the consignment arising from rain. The shipper / consigner agrees to assume full responsibility for damages to the cargo arising due to rain in any manner including (but not limited to) holes in the trailers, damages arising from rain during transit / loading, / offloading of the cargo.</li>\r\n\t<li>This quotation is for transportation only, unless otherwise specifically mentioned in the quotation.</li>\r\n\t<li>In case of delayed delivery for whatsoever reasons or damages that may arise to cargo / consignment to any extent and in any manner, the shipper / consignor agrees assume full responsibility for these damages and agrees to pay Timex Shipping LLC full outstanding payments (current and previously owed).</li>\r\n\t<li>Any dispute arise from shipment(s) will be governed by UAE LAW and will be settled in Dubai Courts.</li>\r\n\t<li>The Customer/ Consignee/ Consignor shall indemnify the company against payments, fines, expenses, damages (including physical damage) and liabilities, whether or not arising out of the negligence of the company or their agents or their employees or any other third party.</li>\r\n\t<li>Any Damages that may arise during inspection at the origin or destination borders will not be the responsibility of the company and the consignor / consignee agrees that there will not be any claims on damages arising from such inspections. Such inspection or damages arising from inspection may or may not be known / visible to the company, hence the company may not communicate these damages to the consignor / shipper.</li>\r\n\t<li>Our Terms of shipment business risk and liability will be as per NAFL (National Association of Freight and Logistics) standard trading conditions, a copy of which is available on request.</li>\r\n\t<li>The Customer/ Consignee/ Consignor shall indemnify the company against payments, fines, expenses, damages (including physical damage) and liabilities. Whether or not arising out of the negligence of the company or their agents or any other third party.</li>\r\n\t<li>These Conditions and any act or contract to which they apply shall be governed by UAE. law and any dispute arising out of any act or contract to which these Conditions apply shall be subject to the exclusive jurisdiction of the UAE. courts.</li>\r\n\t<li>Force Majeure. No Party shall be liable or responsible to the other Party, nor be deemed to have defaulted under or breached this Agreement, for any failure or delay in fulfilling or performing any term of this Agreement (except for any obligations to make previously owed payments to the company) when and to the extent such failure or delay is caused by or results from acts beyond the impacted Party&rsquo;s (&ldquo;Impacted Party&rdquo;) reasonable control, including, without limitation, the following&nbsp;force majeure&nbsp;events (&ldquo;Force Majeure&nbsp;Event(s)&rdquo;) that frustrates the purpose of this Agreement: (a) acts of God; (b) flood, fire, earthquake or explosion; (c) war, invasion, hostilities (whether war is declared or not), terrorist threats or acts, riot or other civil unrest; (d) government order or law; (e) actions, embargoes or blockades in effect on or after the date of this Agreement; (f) action by any governmental authority; (g) national or regional emergency; (h) strikes, labor stoppages or slowdowns or other industrial disturbances; (i) epidemic, pandemic or similar influenza or bacterial infection (which is defined by the United States Center for Disease Control as virulent human influenza or infection that may cause global outbreak, or pandemic, or serious illness); (j) emergency state; (k) shortage of adequate medical supplies and equipment; (l) shortage of power or transportation facilities; and (m) other similar events beyond the reasonable control of the Impacted Party.</li>\r\n</ul>\r\n\r\n<p style="margin-left:80px">E&amp;OE</p>\r\n\r\n<p style="margin-left:120px; margin-right:42px">LCL = Less than Container Load</p>\r\n\r\n<p style="margin-left:120px; margin-right:42px">LTL = Less than Truckload</p>\r\n\r\n<p style="margin-left:120px; margin-right:42px">FTL = Full Truckload</p>\r\n\r\n<p style="margin-left:120px; margin-right:42px">FCL = Full Container Load</p>\r\n\r\n<p style="margin-left:120px; margin-right:42px">T&amp;C = Terms and Conditions</p>\r\n\r\n<p style="margin-left:120px; margin-right:42px">NAFL = National Association of Freight and Logistics</p>\r\n\r\n<p style="margin-left:120px; margin-right:42px">E&amp;OE = Errors and Omissions Expected</p>\r\n\r\n<p style="margin-left:120px; margin-right:42px">KSA = Kingdom of Saudi Arabia</p>\r\n\r\n<p style="margin-left:120px; margin-right:42px">UAE = United Arab Emirates</p>\r\n\r\n<p><span style="font-size:14pt"><u><strong>Sea Freight</strong></u></span></p>\r\n\r\n<ul>\r\n\t<li>The company shall be entitled to retain and be paid all brokerages, commissions, allowances, fines, border charges, customs duty, VAT and other remunerations customarily retained by or paid to forwarding agents and insurance brokers.</li>\r\n\t<li>Consignor should possess valid export license to export the cargo being shipped.</li>\r\n\t<li><span style="font-family:Calibri,serif">Consignee should possess valid import license to import the cargo.</span></li>\r\n\t<li style="margin-right: 49px;">The consignor agrees to indemnify the company against all losses expenses and fines arising from any inaccuracy or omission or errors in the shipping documents.</li>\r\n\t<li style="margin-right: 49px;">All the Insurance charges are excluded from the Quote. Unless otherwise specified all quotes are without insurance.</li>\r\n\t<li style="margin-right: 49px;">For LCL shipments the cargo will be charged either by weight, volume or by volumetric weight whichever is higher.</li>\r\n\t<li style="margin-right: 49px;">Delivery Order will be issued against actual Cargo Arrival Notification (CAN) from shipping Lines.</li>\r\n\t<li>The company shall not accept or deal with any poisonous, dangerous, inflammable, explosive, or perishable items, unless particular arrangements have been previously made in writing.</li>\r\n\t<li><span style="font-family:Calibri,serif">The company shall be the entitled to enter into contracts for the carriage of goods by any route or by any means. </span></li>\r\n\t<li style="margin-right: 49px;">It is the responsibility of the consignor to provide Timex Shipping LLC the full set Chamberized document(s) and any other document(s) required for the shipment for the clearance of the cargo at destination border customs.</li>\r\n\t<li><span style="font-family:Calibri,serif">For freight forwarders, freight forwarding companies and shipping companies our responsibility is limited to placement of the vehicles / containers only. It is the responsibility of the shipper / shipping company/ freight forwarders to ensure correct cargo type and quantity is loaded on to the booked container / truck / trailer.</span></li>\r\n\t<li><span style="font-family:Calibri,serif">For freight forwarders, freight forwarding companies and shipping companies our responsibility is limited to placement of vehicles / containers only. It is the responsibility of the shipper / shipping company/ freight forwarders to ensure the cargo is fully and partially insured. TIMEX Shipping LLC will not assume responsibility for any damages to the cargo / goods that may arise in any manner including during transit, at the time of loading / offloading of the cargo.</span></li>\r\n\t<li style="margin-right: 49px;">It is the responsibility of consignor to ensure the shipping documents submitted are accurate.</li>\r\n\t<li style="margin-right: 49px;"><span style="font-family:Calibri,serif">Except under special arrangement previously made in writing the company will not accept or deal with bullion coins, precious stones, jewelry, valuable antiques pictures, livestock or plants.</span></li>\r\n\t<li style="margin-right: 42px;">In case of delayed delivery for whatsoever reasons or damages that may arise to cargo / consignment to any extent and in any manner, the shipper / consignor agrees assume full responsibility for these damages and agrees to pay Timex Shipping LLC full outstanding payments (current and previously owed).</li>\r\n\t<li style="margin-right: 76px;">Prior to collection of the cargo from the consignor, the consignee&rsquo;s clearing agent&rsquo;s confirmation/ consent will be required.</li>\r\n\t<li style="margin-right: 49px;">If Storage / Demurrage and Detention charges are incurred, we will invoice the same to the customer, as per actual.</li>\r\n\t<li style="margin-right: 49px;">At the event of container inspection, if Customs needs any approval, Consignee to obtain the same and assist.</li>\r\n\t<li style="margin-right: 49px;">At the event of Container Damage or Washing is required, there shall be MECRC charges applicable and all charges will be invoiced as per actual cost incurred.</li>\r\n\t<li style="margin-right: 42px;">Offloading at the destination warehouse / site will be the responsibility of Consignee.</li>\r\n\t<li style="margin-right: 42px;">Three hours of free time will be provided for Offloading at consignee&rsquo;s premises after which detention charges of AED 350/Day/Truck will be applicable.</li>\r\n\t<li style="margin-right: 42px;">Any other official charges, will be invoiced to the customer as per actual.</li>\r\n\t<li style="margin-right: 42px;">For Duty Exemption cargos, Consignee should submit the Duty Exemption letter up on clearance.</li>\r\n\t<li style="margin-right: 42px;">Beyond free clearance period demurrage charges will apply at origin/ destination port and shipping line demurrage charges will apply additionally.</li>\r\n\t<li style="margin-right: 49px;">For LCL shipments the consignor/ shipper agrees and understands the proof of payment towards duty, VAT, detention or port charges will not be provided by The Company &amp; consignor agrees to settle these payments as per the email advise by The Company.</li>\r\n\t<li style="margin-right: 42px;">For LCL shipments it is understood by the consignor that the delivery period specified by the company in the communication or in the email or by quote is tentative and not accurate. It is further understood that LCL shipments may delayed indefinitely and for extended periods and The company cannot guarantee any specify delivery date or commit to any delivery deadline for such shipments.</li>\r\n\t<li style="margin-right: 42px;">Any claims for damages/ missing / shortage in count, should be communicated to Timex Shipping LLC via email after the confirmation of the final delivery (maximum within seven days from the date of delivery of the cargo).</li>\r\n\t<li style="margin-right: 79px;">Quotes provided and thereby shipments are without insurance, unless otherwise specified in the quotation.</li>\r\n\t<li>The company shall not be liable to Customer / Consignor / Consignee or owner:</li>\r\n</ul>\r\n\r\n<ol style="list-style-type:lower-alpha; margin-left:40px">\r\n\t<li>\r\n\t<p>For loss or damage caused by any failure to carry out or negligence in carrying out the customer&rsquo;s or owner instruction or by any failure to perform or negligence in performing the company&rsquo;s obligations (whether such obligations arise by contract or otherwise).</p>\r\n\t</li>\r\n\t<li>\r\n\t<p>For consequential loss, including loss of profit or loss of market or deviation however caused</p>\r\n\t</li>\r\n\t<li>\r\n\t<p>For loss or damage issues from:</p>\r\n\t</li>\r\n</ol>\r\n\r\n<p style="margin-left:80px">i. Inefficient or improper packing or addressing or</p>\r\n\r\n<p style="margin-left:80px">ii. The perishable hazardous fragile or brittle nature or the mechanical derangement of the goods or</p>\r\n\r\n<p style="margin-left:80px">iii. Riots civil commotion strikes, lockout, stoppage or restraint of labor from whatsoever cause, whether partial or general or fire or</p>\r\n\r\n<p style="margin-left:80px">iv. Failure by the consignees to take delivery within a reasonable time</p>\r\n\r\n<ul>\r\n\t<li style="margin-right: 42px;">Any dispute arise from shipment(s) will be governed by UAE LAW and will be settled in Dubai Courts.</li>\r\n\t<li style="margin-right: 42px;">Our Terms of shipment business risk and liability will be as per NAFL (National Association of Freight and Logistics) standard trading conditions, a copy of which is available on request.</li>\r\n\t<li style="margin-right: 53px;">For branded products or products with branded artwork, registered trademarks and logos, the products should only be shipped to the authorized brand owner at the destination. i.e. consignee should be the registered brand owner or authorized brand distributer.</li>\r\n\t<li style="margin-right: 53px;">Fragile items must be labeled and marked fragile.</li>\r\n\t<li style="margin-right: 53px;">The company will place the truck / trailers / containers for collection of the cargo, it is the responsibility of the shipper to inspect the trailers / containers for holes and potential leaks. The shipper assumes fully responsibly for damages arising from rain and the company will not assume any responsibility whatsoever for damages to the consignment arising from rain. The shipper / consigner agrees to assume full responsibility for damages to the cargo arising due to rain in any manner including (but not limited to) holes in the trailers / containers, damages arising from rain during transit / loading, / offloading of the cargo.</li>\r\n\t<li>Individual cartoons must be numbered with country of origin printed on each carton.</li>\r\n\t<li>Country of origin must be printed on individual product and on individual pack/packing.</li>\r\n\t<li style="margin-right: 56px;">For shipments to KSA its mandatory for the consignee to obtain Saber certificate for the consignment.</li>\r\n\t<li style="margin-right: 42px;">Any damages that may arise during inspection at the origin or destination borders will not be the responsibility of the company and the consignor / consignee agrees that there will not be any claims on damages arise from such inspections. Such inspection or damages arising from inspection may or may not be known / visible to the company, hence the company may not communicate these damages to the consignor / shipper.</li>\r\n\t<li style="margin-right: 42px;">Any damages arising during transportation is to be settled as per our insurance policy / Insurance provider, a copy of which is available on request or as per NAFL Terms &amp;Conditions whichever is lower in monetary / claim value.</li>\r\n\t<li style="margin-right: 42px;">The Customer/ Consignee/ Consignor shall indemnify the company against payments, fines, expenses, damages (including physical damage) and liabilities, whether or not arising out of the negligence of the company or their agents or any other third party.</li>\r\n\t<li style="margin-right: 42px;">These Conditions and any act or contract to which they apply shall be governed by UAE. law and any dispute arising out of any act or contract to which these Conditions apply shall be subject to the exclusive jurisdiction of the UAE. courts.</li>\r\n\t<li style="margin-right: 42px;">Force Majeure. No Party shall be liable or responsible to the other Party, nor be deemed to have defaulted under or breached this Agreement, for any failure or delay in fulfilling or performing any term of this Agreement (except for any obligations to make previously owed payments to the company) when and to the extent such failure or delay is caused by or results from acts beyond the impacted Party&rsquo;s (&ldquo;Impacted Party&rdquo;) reasonable control, including, without limitation, the following&nbsp;force majeure&nbsp;events (&ldquo;Force Majeure&nbsp;Event(s)&rdquo;) that frustrates the purpose of this Agreement: (a) acts of God; (b) flood, fire, earthquake or explosion; (c) war, invasion, hostilities (whether war is declared or not), terrorist threats or acts, riot or other civil unrest; (d) government order or law; (e) actions, embargoes or blockades in effect on or after the date of this Agreement; (f) action by any governmental authority; (g) national or regional emergency; (h) strikes, labor stoppages or slowdowns or other industrial disturbances; (i) epidemic, pandemic or similar influenza or bacterial infection (which is defined by the United States Center for Disease Control as virulent human influenza or infection that may cause global outbreak, or pandemic, or serious illness); (j) emergency state; (k) shortage of adequate medical supplies and equipment; (l) shortage of power or transportation facilities; and (m) other similar events beyond the reasonable control of the Impacted Party.</li>\r\n</ul>\r\n\r\n<p style="margin-left:54px; margin-right:42px">E&amp;OE</p>\r\n\r\n<p style="margin-left:54px; margin-right:42px">LCL = Less than Container Load</p>\r\n\r\n<p style="margin-left:54px; margin-right:42px">LTL = Less than Truckload</p>\r\n\r\n<p style="margin-left:54px; margin-right:42px">FTL = Full Truckload</p>\r\n\r\n<p style="margin-left:54px; margin-right:42px">FCL = Full Container Load</p>\r\n\r\n<p style="margin-left:54px; margin-right:42px">T&amp;C = Terms and Conditions</p>\r\n\r\n<p style="margin-left:54px; margin-right:42px">NAFL = National Association of Freight and Logistics</p>\r\n\r\n<p style="margin-left:54px; margin-right:42px">E&amp;OE = Errors and Omissions Expected</p>\r\n\r\n<p style="margin-left:54px; margin-right:42px">KSA = Kingdom of Saudi Arabia</p>\r\n\r\n<p style="margin-left:54px; margin-right:42px">UAE = United Arab Emirates</p>\r\n\r\n<p style="margin-left:54px; margin-right:42px">&nbsp;</p>\r\n\r\n<p><span style="font-size:14pt"><u><strong>Air Freight</strong></u></span></p>\r\n\r\n<ul>\r\n\t<li>The company shall be entitled to retain and be paid all brokerages, commissions, allowances, fines, border charges, customs duty, VAT and other remunerations customarily retained by or paid to forwarding agents and insurance brokers.</li>\r\n\t<li>Consignor should possess valid export license to export the cargo being shipped.</li>\r\n\t<li><span style="font-family:Calibri,serif">Consignee should possess valid import license to import the cargo.</span></li>\r\n\t<li style="margin-right: 49px;">The consignor agrees to indemnify the company against all losses expenses and fines arising from any inaccuracy or omission or errors in the shipping documents.</li>\r\n\t<li style="margin-right: 49px;">All the Insurance charges are excluded from the quote, unless otherwise specified all shipment quotations are without insurance.</li>\r\n\t<li style="margin-right: 49px;">The cargo will be charged either by actual weight, volume or by volumetric weight whichever is higher.</li>\r\n\t<li style="margin-right: 49px;">Delivery Order will be issued once shipments arrive at destination airport.</li>\r\n\t<li>The company shall not accept or deal with any poisonous, dangerous, inflammable, explosive, or perishable items unless specific arrangements have been previously made in writing.</li>\r\n\t<li><span style="font-family:Calibri,serif">The company shall be the entitled to enter into contracts for the carriage of goods by any route or by any means.</span></li>\r\n\t<li style="margin-right: 42px;">In case of delayed delivery for whatsoever reasons or damages that may arise to cargo / consignment to any extent and in any manner, the shipper / consignor agrees assume full responsibility for these damages and agrees to pay Timex Shipping LLC full outstanding payments (current and previously owed).</li>\r\n\t<li style="margin-right: 49px;">It is the responsibility of consignor to ensure the shipping documents submitted are accurate.</li>\r\n\t<li style="margin-right: 49px;"><span style="font-family:Calibri,serif">Except under special arrangement previously made in writing the company will not accept or deal with bullion coins, precious stones, jewelry, valuable antiques pictures, livestock or plants.</span></li>\r\n\t<li style="margin-right: 76px;">Prior to collection of the cargo from the consignor, the consignee&rsquo;s clearing agent&rsquo;s confirmation/ consent will be required.</li>\r\n\t<li style="margin-right: 49px;">If any Storage / Demurrage and Detention charges are incurred, we will invoice the same to the customer, as per actual.</li>\r\n\t<li style="margin-right: 42px;">Any damages arising during transportation is to be settled as per our insurance policy / Insurance provider, a copy of which is available on request or as per NAFL Terms &amp;Conditions whichever is lower in monetary / claim value.</li>\r\n\t<li style="margin-right: 79px;">Quotes provided and thereby shipments are without insurance, unless otherwise specified in the quotation.</li>\r\n\t<li style="margin-right: 42px;">Inspection charges (if any) will be invoiced to the customer as per actual.</li>\r\n\t<li style="margin-right: 42px;">Three hours of free time will be provided for Offloading at consignee&rsquo;s premises after which detention charges of AED 350/Day/Truck will be applicable.</li>\r\n\t<li style="margin-right: 42px;">Any other official charges, will be invoiced to the customer as per actual.</li>\r\n\t<li style="margin-right: 42px;">For Duty Exemption cargos, Consignee should submit the Duty Exemption letter up on clearance.</li>\r\n\t<li style="margin-right: 42px;">Beyond free clearance period demurrage charges will apply at origin/ destination port and any other airline charges will apply. These additional charges are to be paid by the customer.</li>\r\n\t<li style="margin-right: 42px;">Any claims for damages/ missing / shortage in count, should be communicated to Timex Shipping LLC via email after the confirmation of the final delivery (maximum within seven days from the <span style="color:#000000">date of delivery of the cargo).</span></li>\r\n\t<li style="margin-right: 49px;"><span style="color:#000000">For Air freight shipments the cargo will be charged either by weight, volume or by volumetric weight, whichever is higher.</span></li>\r\n\t<li style="margin-right: 49px;"><span style="color:#000000">For Air freight shipments the consignor/ shipper agrees and understands the that payment proof of duty , VAT, detention charges or port charges will not be provided by The Company &amp; consignor agrees to settle these payments as per the email advise by The Company.</span></li>\r\n\t<li style="margin-right: 42px;"><span style="color:#000000">For Air freight shipments it is understood by the consignor that the delivery period specified by the company in the communication or in the email or by quote is tentative and not accurate. It is further understood that Air freight shipments may delayed indefinitely and for extended periods and The company cannot guarantee any specify delivery date or commit to any delivery deadline for such shipments.</span></li>\r\n\t<li style="margin-right: 42px;">Any damages that may arise during inspection at the origin or destination borders will not be the responsibility of the company and the consignor / consignee agrees that there will not be any claims on damages arising from such inspections. Such inspection or damages arising from inspection may or may not be known / visible to the company, hence the company may not communicate these damages to the consignor / shipper.</li>\r\n\t<li style="margin-right: 42px;">The Customer/ Consignee/ Consignor shall indemnify the company against payments, fines, expenses, damages (including physical damage) and liabilities, whether or not arising out of the negligence of the company or their agents or any other third party.</li>\r\n\t<li style="margin-right: 42px;">The company shall not be liable to Customer / Consignor / Consignee or owner:</li>\r\n</ul>\r\n\r\n<ol style="list-style-type:lower-alpha; margin-left:40px">\r\n\t<li>\r\n\t<p style="margin-right:42px">For loss or damage caused by any failure to carry out or negligence in carrying out the customer&rsquo;s or owner instruction or by any failure to perform or negligence in performing the company&rsquo;s obligations (whether such obligations arise by contract or otherwise).</p>\r\n\t</li>\r\n\t<li>\r\n\t<p style="margin-right:42px">For consequential loss, including loss of profit or loss of market or deviation however caused.</p>\r\n\t</li>\r\n\t<li style="margin-right: 42px;">For loss or damage issues from:</li>\r\n</ol>\r\n\r\n<p style="margin-left:80px">i. Inefficient or improper packing or addressing</p>\r\n\r\n<p style="margin-left:80px">ii. The perishable hazardous fragile or brittle nature or the mechanical derangement of the goods or</p>\r\n\r\n<p style="margin-left:80px; margin-right:30px">iii. Riots civil commotion strikes, lockout, stoppage or restraint of labor from whatsoever cause, whether partial or general or fire or</p>\r\n\r\n<p style="margin-left:80px; margin-right:30px">iv. Failure by the consignees to take delivery within a reasonable time.</p>\r\n\r\n<ul>\r\n\t<li style="margin-right: 42px;">Any dispute arise from shipment(s) will be governed by UAE LAW and will be settled in Dubai Courts.</li>\r\n\t<li style="margin-right: 42px;">Our Terms of shipment business risk and liability will be as per NAFL (National Association of Freight and Logistics) standard trading conditions, a copy of which is available on request.</li>\r\n\t<li style="margin-right: 53px;">For branded products or products with branded artwork, registered trademarks and logos, the products should only be shipped to the authorized brand owner at the destination. i.e. consignee should be the registered brand owner or authorized brand distributer.</li>\r\n\t<li style="margin-right: 53px;">Fragile items must be labeled and marked fragile.</li>\r\n\t<li>Individual cartoons must be numbered with country of origin printed on each carton.</li>\r\n\t<li>Country of origin must be printed on individual product and on individual pack/packing.</li>\r\n\t<li style="margin-right: 56px;">For shipments to KSA its mandatory for the consignee to obtain Saber certificate for the consignment.</li>\r\n\t<li style="margin-right: 42px;">These Conditions and any act or contract to which they apply shall be governed by UAE. law and any dispute arising out of any act or contract to which these Conditions apply shall be subject to the exclusive jurisdiction of the UAE. courts.</li>\r\n\t<li style="margin-right: 42px;">Force Majeure. No Party shall be liable or responsible to the other Party, nor be deemed to have defaulted under or breached this Agreement, for any failure or delay in fulfilling or performing any term of this Agreement (except for any obligations to make previously owed payments to the company) when and to the extent such failure or delay is caused by or results from acts beyond the impacted Party&rsquo;s (&ldquo;Impacted Party&rdquo;) reasonable control, including, without limitation, the following&nbsp;force majeure&nbsp;events (&ldquo;Force Majeure&nbsp;Event(s)&rdquo;) that frustrates the purpose of this Agreement: (a) acts of God; (b) flood, fire, earthquake or explosion; (c) war, invasion, hostilities (whether war is declared or not), terrorist threats or acts, riot or other civil unrest; (d) government order or law; (e) actions, embargoes or blockades in effect on or after the date of this Agreement; (f) action by any governmental authority; (g) national or regional emergency; (h) strikes, labor stoppages or slowdowns or other industrial disturbances; (i) epidemic, pandemic or similar influenza or bacterial infection (which is defined by the United States Center for Disease Control as virulent human influenza or infection that may cause global outbreak, or pandemic, or serious illness); (j) emergency state; (k) shortage of adequate medical supplies and equipment; (l) shortage of power or transportation facilities; and (m) other similar events beyond the reasonable control of the Impacted Party.</li>\r\n</ul>\r\n\r\n<p style="margin-left:54px; margin-right:42px">E&amp;OE</p>\r\n\r\n<p style="margin-left:54px; margin-right:42px">LCL = Less than Container Load</p>\r\n\r\n<p style="margin-left:54px; margin-right:42px">FCL = Full Container Load</p>\r\n\r\n<p style="margin-left:54px; margin-right:42px">T&amp;C = Terms and Conditions</p>\r\n\r\n<p style="margin-left:54px; margin-right:42px">NAFL = National Association of Freight and Logistics</p>\r\n\r\n<p style="margin-left:54px; margin-right:42px">E&amp;OE = Errors and Omissions Expected</p>	\N	\N	\N	en	2023-10-10 09:17:38	2023-12-26 09:17:21
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
2	App\\Models\\User	29	Personal Access Token	33f6b1a2dabf45960d693aa4c9aa99facd0d3e19694ed6d51f6db15a83535178	["*"]	\N	2023-08-04 22:48:36	2023-08-04 22:48:36
3	App\\Models\\User	30	Personal Access Token	d379039b9c3006c0575fec8c5337e2619cd575bc443a9c886484d23211416cb1	["*"]	\N	2023-08-04 23:01:20	2023-08-04 23:01:20
4	App\\Models\\User	31	Personal Access Token	d9a5b78d3bf57a6a70240650647072fee9964bc7d867530fcc3f69c63410bf9b	["*"]	\N	2023-08-04 23:10:11	2023-08-04 23:10:11
5	App\\Models\\User	32	Personal Access Token	1db2658a2f4e9352fdaee45ce024c4dcf6f07f774b81dd5b75fdcfe46cf870c2	["*"]	\N	2023-08-04 23:24:15	2023-08-04 23:24:15
6	App\\Models\\User	33	Personal Access Token	626b927445d6a4fda48e3a4838625046de395057f117c17d9c5e227c6b23522f	["*"]	\N	2023-08-04 23:40:04	2023-08-04 23:40:04
7	App\\Models\\User	34	Personal Access Token	64021ec022bdb7fe458e973690decfba7131d3db1d928e02316828613fb61343	["*"]	\N	2023-08-05 00:14:48	2023-08-05 00:14:48
10	App\\Models\\User	37	Personal Access Token	be6c58d2ab9f618d5602b3a4e27de02b5368e98ee6c6adf96c749fa550ea8baa	["*"]	\N	2023-08-05 00:32:36	2023-08-05 00:32:36
11	App\\Models\\User	16	16Raya Gentrysoftcube.web1@gmail.com	dbbb49c1a1d14396adb505449c56ccbd8370c700e185c36eb06c76aeb05216c3	["*"]	\N	2023-08-05 10:41:07	2023-08-05 10:41:07
12	App\\Models\\User	37	37Abdul Ghanighaniabro11@gmail.com	7ab52c5b145ecad2dfba4840fb2658e41114a174184b7e5d013229623deda753	["*"]	\N	2023-08-07 11:55:09	2023-08-07 11:55:09
13	App\\Models\\User	16	16Raya Gentrysoftcube.web1@gmail.com	e5f92f868a7d642318076d639a68f4e1486d10fe6c7b427e8737a861eb418716	["*"]	\N	2023-08-07 12:01:36	2023-08-07 12:01:36
14	App\\Models\\User	16	16Raya Gentrysoftcube.web1@gmail.com	f42ce3528df52871167ce06e5c5d0e949399aa48fe9ac5ca3161c4be6b8d7711	["*"]	\N	2023-08-07 12:17:43	2023-08-07 12:17:43
15	App\\Models\\User	16	16Raya Gentrysoftcube.web@gmail.com	78e063f477eb78f975efa58055733af63b5001c7bf741c28e0e9837fc3bc1aea	["*"]	\N	2023-08-08 10:05:19	2023-08-08 10:05:19
16	App\\Models\\User	39	Personal Access Token	24f15ce5d0707d18db0950aedf540dcb25f4cda65aa14ed6700d5ac6dd7fc203	["*"]	\N	2023-08-09 16:08:05	2023-08-09 16:08:05
17	App\\Models\\User	40	Personal Access Token	600e05fe9d31bf3764c5e7b66b271fa9ecd1f2ca85c2509b42c1ce85b92d60b0	["*"]	\N	2023-08-09 16:12:57	2023-08-09 16:12:57
18	App\\Models\\User	41	Personal Access Token	d3282a4fa0ef8fe9226ac252b25f71fcd836c4dddaccdd2ec254c2bafe4cd1d1	["*"]	\N	2023-08-09 16:14:01	2023-08-09 16:14:01
19	App\\Models\\User	42	Personal Access Token	0a2cae9abf107f648cde4628f29d45b9263f29de72398a6354bddf687f21d16f	["*"]	\N	2023-08-09 16:24:11	2023-08-09 16:24:11
20	App\\Models\\User	43	Personal Access Token	921cd89d80bfebba9087c32f0e5729cf3eaa1295423b3889b143d87e65ec402d	["*"]	\N	2023-08-10 21:14:35	2023-08-10 21:14:35
21	App\\Models\\User	43	43android testandroid_test01@gmail.com	521a851c06ffa998c7048b8f454deba33ef76c32fa77acc7aac1d14a305cd1a2	["*"]	\N	2023-08-10 21:16:41	2023-08-10 21:16:41
22	App\\Models\\User	44	Personal Access Token	f378cb4762643aea456b3b417e3fad1c7c64d305a2fc66ac4668ffef7f79722b	["*"]	\N	2023-08-12 09:15:57	2023-08-12 09:15:57
23	App\\Models\\User	44	44Android Test2android_test1@gmail.com	1ae298de80903b3ac7027135d4fe5bd4fc84601ded5f0b770b97707b084f3045	["*"]	\N	2023-08-12 09:17:53	2023-08-12 09:17:53
24	App\\Models\\User	44	44Android Test2android_test1@gmail.com	6c71a32ff1971c572796ca18f60c70807413bcf4ae56fd431461132f4b1c0348	["*"]	\N	2023-08-12 09:20:44	2023-08-12 09:20:44
25	App\\Models\\User	44	44Android Test2android_test1@gmail.com	21349af3ce7ccd0fe1b92be63701720a81dd41facf679a0fc8b017819fcd0eab	["*"]	\N	2023-08-12 09:26:28	2023-08-12 09:26:28
26	App\\Models\\User	44	44Android Test2android_test1@gmail.com	f7f906d881cc47fee4c0b906b7f4594c52c37e48c81b040f5845bef3b5bfab57	["*"]	\N	2023-08-12 09:38:47	2023-08-12 09:38:47
27	App\\Models\\User	45	Personal Access Token	f99878792b00a9b3038ec025fed21c8ae09310d18053da87e1485569fde37014	["*"]	\N	2023-08-12 10:46:45	2023-08-12 10:46:45
28	App\\Models\\User	45	45company testandroid_test2@gmail.com	8e199263a0f9320361b39a046187b061956c71d216b9f8ddb51b98091efb479b	["*"]	\N	2023-08-12 10:47:22	2023-08-12 10:47:22
29	App\\Models\\User	46	Personal Access Token	506c5970a25a78f410902271da80de9f134411cb379a8534984e4cfe8fa6c4d1	["*"]	\N	2023-08-12 14:51:10	2023-08-12 14:51:10
30	App\\Models\\User	44	44Android Test2android_test1@gmail.com	f0226a361de0a50d57fab18bf89bb33ae2bca0b29310ae5a3390523d9600e658	["*"]	\N	2023-08-12 21:31:10	2023-08-12 21:31:10
31	App\\Models\\User	44	44Android Test2android_test1@gmail.com	418cd0512c923b7dcb93f9002ff4b1540d409711770507347b6704c01b26617c	["*"]	\N	2023-08-13 11:59:10	2023-08-13 11:59:10
32	App\\Models\\User	44	44Android Test2android_test1@gmail.com	0c6fd422750d325eef4c215a3df94cbf69d3b7b2f7fad77d1302327d3b71425b	["*"]	\N	2023-08-13 12:00:37	2023-08-13 12:00:37
33	App\\Models\\User	44	44Android Test2android_test1@gmail.com	8f31fec30b3eb439ce672d86fdb218d75c01e6c2e929da415bf48051fdaf7c0a	["*"]	\N	2023-08-14 10:04:44	2023-08-14 10:04:44
34	App\\Models\\User	37	37Abdul Ghanighaniabro11@gmail.com	97ee90369c9f6cd499c0aef89310797a49050d0af8061cb53d1e5a77ee2d3a2a	["*"]	\N	2023-08-15 09:14:18	2023-08-15 09:14:18
35	App\\Models\\User	44	44Android Test2android_test1@gmail.com	22c04809a7ec0aed2f1edc305246564324e848efaa5706c9aaacb1c02407e787	["*"]	\N	2023-08-16 05:54:41	2023-08-16 05:54:41
36	App\\Models\\User	44	44Android Test2android_test1@gmail.com	9a7e6a8261ceeb1b743e21f79baba25e5930ee141f0e933d1c588b84423ff5d2	["*"]	\N	2023-08-16 05:55:47	2023-08-16 05:55:47
37	App\\Models\\User	44	44Android Test2android_test1@gmail.com	bbfca9a74bc63ea2c7692945d165f46735d3b05ac4d6f6830d1f67ff973dc547	["*"]	\N	2023-08-16 08:21:31	2023-08-16 08:21:31
38	App\\Models\\User	44	44Android Test2android_test1@gmail.com	f1bd6e895ad236510cb041b8ecf3997a1e19a6b70a255e4e6b828ada582aa419	["*"]	\N	2023-08-16 08:28:21	2023-08-16 08:28:21
39	App\\Models\\User	16	16Raya Gentrysoftcube.web@gmail.com	5cccf890a36efa3b3aed2755ba8c06d39799b4ff3bf5705801297fdd12db3f97	["*"]	\N	2023-08-16 09:01:09	2023-08-16 09:01:09
40	App\\Models\\User	44	44Android Test2android_test1@gmail.com	007752d97b3c2e29fc24f547584d646442619cb49232aafc9a031717c524961f	["*"]	\N	2023-08-16 09:13:33	2023-08-16 09:13:33
41	App\\Models\\User	44	44Android Test2android_test1@gmail.com	593a3badf92a906af35e853afac314d14f43352d254fc096d9dc082b6dedcdf4	["*"]	\N	2023-08-16 20:29:48	2023-08-16 20:29:48
42	App\\Models\\User	37	37Abdul Ghanighaniabro11@gmail.com	41bb8dc8ed08f76c404247fb7adcaed387f0f1498d667071d6979c2e2b9829f0	["*"]	\N	2023-08-17 00:15:11	2023-08-17 00:15:11
43	App\\Models\\User	44	44Android Test2android_test1@gmail.com	b4dcbe28798eba361e6f55f2041a0113bdd3014bc7b646037d1bba825e1f6160	["*"]	\N	2023-08-17 08:41:52	2023-08-17 08:41:52
44	App\\Models\\User	47	Personal Access Token	93df40f418ab81d45678dcf7a0912fba3bd05d523f3e598f2c845a69bf2e76d1	["*"]	\N	2023-08-17 18:50:05	2023-08-17 18:50:05
45	App\\Models\\User	44	44Android Test2android_test1@gmail.com	b2f0005fa8f5298e706b878fd9bb2ce3cf2aab78fd66d6071f54a4ac4b0e4638	["*"]	\N	2023-08-17 19:54:19	2023-08-17 19:54:19
46	App\\Models\\User	44	44Android Test2android_test1@gmail.com	7676971b88004de6a4fa06b6cb2f3bfc94e2a5a0f76a61b7aaa042ec1b254c95	["*"]	\N	2023-08-17 20:24:15	2023-08-17 20:24:15
47	App\\Models\\User	48	Personal Access Token	901189625be49b7081b3e7b070b8c43b576b3c1bbbc6f75bfcab30c1d2681c9d	["*"]	\N	2023-08-17 22:06:04	2023-08-17 22:06:04
48	App\\Models\\User	44	44Android Test2android_test1@gmail.com	4c0ffa5595b796a981be90a7c82919ecc9b924e62324ae1642f179d22658036d	["*"]	\N	2023-08-17 22:20:17	2023-08-17 22:20:17
49	App\\Models\\User	49	Personal Access Token	da2eabf2707fd86f541d770519159d6113e97937918f43480a70f83e8ba65166	["*"]	\N	2023-08-17 23:33:04	2023-08-17 23:33:04
50	App\\Models\\User	50	Personal Access Token	27ceea1ce3f576923dc45aaa8957ee05a9a25e1fa7dbb3fa487e946fad79812d	["*"]	\N	2023-08-17 23:46:58	2023-08-17 23:46:58
51	App\\Models\\User	51	Personal Access Token	3c2ed1300493d28f01f9fe1ae517f83ba707587a0b053c6931eca8e62b67f045	["*"]	\N	2023-08-18 01:02:22	2023-08-18 01:02:22
52	App\\Models\\User	52	Personal Access Token	ecc00382cff5a309a956941191ea916838d7a72ddbb5edc204dfbd029c4afcc7	["*"]	\N	2023-08-18 01:44:02	2023-08-18 01:44:02
53	App\\Models\\User	53	Personal Access Token	b0292cee0490e4730362755ccd44444b3df6242d41c8d33a2e202d21ad4c95bc	["*"]	\N	2023-08-18 08:28:14	2023-08-18 08:28:14
54	App\\Models\\User	54	Personal Access Token	b107c11513cf6ac24b68b0601f639567b7c91fd1c92d721330963befe246fc47	["*"]	\N	2023-08-18 08:29:29	2023-08-18 08:29:29
55	App\\Models\\User	55	Personal Access Token	b75b82eb26a15414dbe7ae23f9d9b9d97e7773f1d3caffb34c9ccb74c6dad06b	["*"]	\N	2023-08-18 08:30:31	2023-08-18 08:30:31
56	App\\Models\\User	56	Personal Access Token	0f59eab1aeeae1eebb1a7c54364be502bf9ef039b7484b58628817b590783f4d	["*"]	\N	2023-08-18 08:34:23	2023-08-18 08:34:23
57	App\\Models\\User	57	Personal Access Token	c6d2ffd9e15ac437a249ea161b18a761b7bd3d989b045ef3431472d388237497	["*"]	\N	2023-08-18 09:09:12	2023-08-18 09:09:12
58	App\\Models\\User	57	57timerxtimerx01@gmail.com	6b459917bca717a5d5408ab2de62cadf548e0f75db18dee2cf82168e3bb098ff	["*"]	\N	2023-08-18 09:32:55	2023-08-18 09:32:55
59	App\\Models\\User	16	16Raya Gentrysoftcube.web@gmail.com	efea8055cd4f0c79ffccf3ab196c4e338d09ae2bfb406926ddc38c0107e49b02	["*"]	\N	2023-08-18 10:22:19	2023-08-18 10:22:19
60	App\\Models\\User	37	37Abdul Ghanighaniabro11@gmail.com	e352087d1c23e6003aef20b221c032456467179bb8de58105c666dcc51913575	["*"]	\N	2023-08-18 11:32:48	2023-08-18 11:32:48
61	App\\Models\\User	37	37Abdul Ghanighaniabro11@gmail.com	9e2027601f5f797e25da0f09a9303fa3a3ff382964d8b682de060aacfef62b34	["*"]	\N	2023-08-18 11:35:50	2023-08-18 11:35:50
62	App\\Models\\User	37	37Abdul Ghanighaniabro11@gmail.com	5bb1d458ae378bdec8770cc3c9586f031fd24b70f348785dcf52cc45dfff51cb	["*"]	\N	2023-08-18 11:52:50	2023-08-18 11:52:50
63	App\\Models\\User	58	Personal Access Token	cce9a13007d58ee1b3a128de5110ac039f636633af5b475288d84bdf2501aaf5	["*"]	\N	2023-08-18 12:27:50	2023-08-18 12:27:50
64	App\\Models\\User	58	58Muzammalpyxiscoding@gmail.com	06489cd752381d3c6f9b43660d76d5eb5269dcab2ee113ea47025d0af828e401	["*"]	\N	2023-08-18 12:39:19	2023-08-18 12:39:19
65	App\\Models\\User	59	Personal Access Token	55740ad1542470524b82a50052a803366d9e363c07d6817e4c50d3c2787d45e6	["*"]	\N	2023-08-18 13:02:22	2023-08-18 13:02:22
66	App\\Models\\User	59	59Devikadevikasr1995@gmail.com	6acf1222573d16950e6dd3b3ba6b23b62c957f248b7e60465e71241ca1e85410	["*"]	\N	2023-08-18 13:05:27	2023-08-18 13:05:27
67	App\\Models\\User	44	44Android Test2android_test1@gmail.com	1a802a26f3cfdaa8faa4d410009fe12b34df97cd51e7f9fbca9c4644d8253c69	["*"]	\N	2023-08-18 14:12:29	2023-08-18 14:12:29
68	App\\Models\\User	44	44Android Test2android_test1@gmail.com	20e451e4a78b891a5126e5e67c58244291ddac3a4a5508e10632a4e63e88b801	["*"]	\N	2023-08-18 14:37:03	2023-08-18 14:37:03
69	App\\Models\\User	44	44Android Test2android_test1@gmail.com	cca62e65b3892e399f33ec3abd03f0ab97f3544cdc5079931959cd4b5d4e847c	["*"]	\N	2023-08-18 14:37:59	2023-08-18 14:37:59
70	App\\Models\\User	60	Personal Access Token	f9123a5365730291af95f228823bd0b7e4c02b36d5811b1197efc28d4144d611	["*"]	\N	2023-08-18 14:39:42	2023-08-18 14:39:42
71	App\\Models\\User	60	60android dxbandroid_test3@gmail.com	6ddb4ea863c123bc15ed76e25090171024988ff4bb480e2946b3f7ff3a8f31a7	["*"]	\N	2023-08-18 14:44:37	2023-08-18 14:44:37
72	App\\Models\\User	61	Personal Access Token	826b01f125474cca2993d2bd7e21b30f1a4d11b8229c86ebaec0f6105281f992	["*"]	\N	2023-08-18 15:11:29	2023-08-18 15:11:29
73	App\\Models\\User	62	Personal Access Token	cb0e7cef22a85524f13e26a9df0a9db005be59264188c6351c73d4c1c4307d0d	["*"]	\N	2023-08-18 15:53:35	2023-08-18 15:53:35
74	App\\Models\\User	63	Personal Access Token	00e1c173d7cff3c4e6ac301d5ef0a89a964065fb1ef2080480eccc60a04b871b	["*"]	\N	2023-08-18 15:55:13	2023-08-18 15:55:13
75	App\\Models\\User	63	63Android dxbandroid_test6@gmail.com	d77915fdef9943e6536adc40448f711651503de0f4fe927045606c8fc60f3905	["*"]	\N	2023-08-18 15:55:53	2023-08-18 15:55:53
76	App\\Models\\User	64	Personal Access Token	311b50a08db9a87cccff984462ec0878e154fb16f8833c0bcb01a805e85fbd4f	["*"]	\N	2023-08-18 19:38:18	2023-08-18 19:38:18
77	App\\Models\\User	44	44Android Test2android_test1@gmail.com	570275280199a423950d8948f6b6652319bc43cf59d9f5c5f67bfe838e784b33	["*"]	\N	2023-08-19 17:07:35	2023-08-19 17:07:35
78	App\\Models\\User	37	37Abdul Ghanighaniabro11@gmail.com	51bf04643005b388a624fe2bfc089257be2658340ed41a296f5a486bfb2ad257	["*"]	\N	2023-08-19 22:24:37	2023-08-19 22:24:37
79	App\\Models\\User	65	Personal Access Token	bfda8c9181a5f23e5df70c521d50c0db8acb0bb9dff6009479ba0f7051a0c33d	["*"]	\N	2023-08-19 23:19:36	2023-08-19 23:19:36
80	App\\Models\\User	65	65Muzammal Faridfaridmuzammal175@gmail.com	0fe3dbd2c4f56b5bd43a62481dff1717d9119c87b6172bb32384c10037801dba	["*"]	\N	2023-08-19 23:20:07	2023-08-19 23:20:07
81	App\\Models\\User	65	65Muzammal Faridfaridmuzammal175@gmail.com	0c0dbeca764bf0b079baeae6aac41aab73ece116915c1aa4de3153f93d279c80	["*"]	\N	2023-08-19 23:22:48	2023-08-19 23:22:48
82	App\\Models\\User	66	Personal Access Token	5a7f668ddc7cb30082924b33152fde93793cd50a553d1d9aec994115b0a34579	["*"]	\N	2023-08-20 02:28:54	2023-08-20 02:28:54
83	App\\Models\\User	66	66muzammal Faridfarid@gmail.com	4bd609136a393060873a63e125b2ae88c3fc80f410bb0459e9fe6052a89101a7	["*"]	\N	2023-08-20 02:29:31	2023-08-20 02:29:31
84	App\\Models\\User	66	66muzammal Faridfarid@gmail.com	1467efa593e8c8ca98d1f888837f0763945c360df695f80f1a28c110df876c44	["*"]	\N	2023-08-20 02:41:30	2023-08-20 02:41:30
85	App\\Models\\User	66	66muzammal Faridfarid@gmail.com	211d22fc72cb44b3873f096722358c5c42bc89cc6fd45188aab8c0f4baab3a05	["*"]	\N	2023-08-21 14:36:44	2023-08-21 14:36:44
86	App\\Models\\User	66	66muzammal Faridfarid@gmail.com	46d7ec0f966f0f38837bad2873adcaa863d56c515bc98ee5caa67557f4ebedfe	["*"]	\N	2023-08-21 16:21:09	2023-08-21 16:21:09
87	App\\Models\\User	67	Personal Access Token	da160552833e8679be1528a17e34216e04572f8109c660687b4a1ae50b61621d	["*"]	\N	2023-08-21 20:33:41	2023-08-21 20:33:41
88	App\\Models\\User	67	67Android Test5android.testing5@gmail.com	b9afe6dc6bb027e0f1601bf361f694a82e9da302c47d108b5ef27588f0b10c1a	["*"]	\N	2023-08-21 20:34:40	2023-08-21 20:34:40
89	App\\Models\\User	44	44Android Test2android_test1@gmail.com	1bc97bc1cf4e43ecf5e91235741208de08f37dfbc04ca9cdf10900500df5f4ec	["*"]	\N	2023-08-24 18:43:32	2023-08-24 18:43:32
90	App\\Models\\User	68	Personal Access Token	7d168cb1e15794077f9f29bd5a3d48fda2a09a6b144784acf71a0f5fb135658b	["*"]	\N	2023-09-01 00:18:04	2023-09-01 00:18:04
91	App\\Models\\User	69	Personal Access Token	ac81b68ca99f64df4491e585aef873dfa52b636fd13f55e1b5ec6d12982de954	["*"]	\N	2023-09-02 09:04:44	2023-09-02 09:04:44
92	App\\Models\\User	70	Personal Access Token	e2e2325ae834b297bcf13b28f24e9deea4b6a1dfaf920f44ebf2b20424aacc53	["*"]	\N	2023-09-04 11:56:08	2023-09-04 11:56:08
93	App\\Models\\User	70	70DXdx@yopmail.com	4fdc7217a68ba734d28b5a5d57e4d53e9f4c9969c4ae6c68b948fcde4332691c	["*"]	\N	2023-09-04 11:57:12	2023-09-04 11:57:12
94	App\\Models\\User	70	70DXdx@yopmail.com	40cdeb595d7f996cbc0f52389144c8ac964826356b707b3697bb3c35c855d069	["*"]	\N	2023-09-04 12:01:18	2023-09-04 12:01:18
95	App\\Models\\User	44	44Android Test2android_test1@gmail.com	05bc2e590c7eba8d00227ee6c1b571189ffcd6e394848dd89f8ff9d2452ce543	["*"]	\N	2023-09-04 21:32:47	2023-09-04 21:32:47
96	App\\Models\\User	44	44Android Test2android_test1@gmail.com	51282e13361341d5db10e8232d2e7c4094472d1097f5da56dbd61cc88600fa6e	["*"]	\N	2023-09-04 22:03:57	2023-09-04 22:03:57
97	App\\Models\\User	71	Personal Access Token	df154bff95da42e11c158dc9e72807d80994f2a79cf9e6530d52b69cf744f246	["*"]	\N	2023-09-07 11:43:48	2023-09-07 11:43:48
98	App\\Models\\User	71	71android testerandroid_driver12@hotmail.com	a4b8ac9442b59d9f4c799103721aef15f9bd21738e61b222bb93c439fcd9c589	["*"]	\N	2023-09-07 11:44:31	2023-09-07 11:44:31
99	App\\Models\\User	72	Personal Access Token	3f2f5cd0762d9e7f68f3942a468809e92963726ad255eb4425e415eaab78bdbe	["*"]	\N	2023-10-07 08:36:09	2023-10-07 08:36:09
100	App\\Models\\User	72	72Binsha Mbdeepika@gmail.com	b3773d05a734441228f6597180a35cbecde1527da5ec70ca805016b1a4be5b47	["*"]	\N	2023-10-07 08:36:10	2023-10-07 08:36:10
101	App\\Models\\User	73	Personal Access Token	5571038874c05d44cae2be99dffdfd5a744e45e31942308dc4713dc6309cca9f	["*"]	\N	2023-10-07 09:19:53	2023-10-07 09:19:53
102	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	a5306ced3c6cfd9815b45fd2ef8842f96cd148c0dd50934c1bda138c2b2649cf	["*"]	\N	2023-10-07 09:20:36	2023-10-07 09:20:36
103	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	28efa1fc9ae145c9e9ad5a1ee289f9de6e0f60a17621fbe8358b22a1ea7cb84f	["*"]	\N	2023-10-07 09:22:47	2023-10-07 09:22:47
104	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	b9acc0384c7cc689b1e961d3f94a2ebdd0f99b13a68df3bd6740a4806bf7db14	["*"]	\N	2023-10-07 09:27:48	2023-10-07 09:27:48
105	App\\Models\\User	74	Personal Access Token	f593238946d2b70c262680757ab428f4e5bd2e11ee710bf5a6d955aa3dfd03d5	["*"]	\N	2023-10-07 10:17:16	2023-10-07 10:17:16
106	App\\Models\\User	74	74Binsha Mbbinshambrs@gmail.com	4be19201e57226c963be388b833d4303686aa2b1bdb8f0bbe0572516a1dd1c5e	["*"]	\N	2023-10-07 10:17:17	2023-10-07 10:17:17
107	App\\Models\\User	74	74Binsha Mbbinshambrs@gmail.com	3d401df51a5520738d22568a33b3fbf5edf2b3a570de2f88d63cca3e6fc6688d	["*"]	\N	2023-10-07 10:17:26	2023-10-07 10:17:26
108	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	5592d41e5d058c539ecd7d2321c60a7426f572248dd0643777d42031e9d205c0	["*"]	\N	2023-10-07 11:45:47	2023-10-07 11:45:47
109	App\\Models\\User	75	Personal Access Token	deb52a97a355587a92bead8584c42cbd72cc60459a5fc68fe70586993e5ba9d3	["*"]	\N	2023-10-07 14:07:53	2023-10-07 14:07:53
110	App\\Models\\User	75	75Mahima Cherianmahima@dxbusinessgroup.com	edef8a2ba32c27ead15117ac278444ba6459b76864bf28be3137068d9d762a68	["*"]	\N	2023-10-07 14:08:11	2023-10-07 14:08:11
111	App\\Models\\User	75	75Mahima Cherianmahima@dxbusinessgroup.com	f43f157581b2f2856f14e214776f3172ef618b38b7bac12b91885959a35dace9	["*"]	\N	2023-10-07 17:47:40	2023-10-07 17:47:40
112	App\\Models\\User	75	75Mahima Cherianmahima@dxbusinessgroup.com	c7272a4d4dfcbeb52fc4dbe2a457164df62918e7101036036fe25da1050a69da	["*"]	\N	2023-10-07 17:55:48	2023-10-07 17:55:48
113	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	b3f95cf6a57acebfc7bb8c0e4dcef32c3dc3447b19f7c1303dfff210aab9035a	["*"]	\N	2023-10-09 08:50:10	2023-10-09 08:50:10
114	App\\Models\\User	76	Personal Access Token	8a15745f5972bf36080e9f259552aec63679735b0880dec785065fd11a6afafa	["*"]	\N	2023-10-09 08:51:03	2023-10-09 08:51:03
115	App\\Models\\User	76	76tesDevtest@gmail.con	281915da50bfa49e9c54f19a2e4cb0fca7c4fc26379aa226a1444c042f8e13a2	["*"]	\N	2023-10-09 08:51:03	2023-10-09 08:51:03
116	App\\Models\\User	76	76tesDevtest@gmail.con	2eec157cb69fefb23a31408860ca2e93cb657539f0867bb4d6da508f15940d95	["*"]	\N	2023-10-09 08:51:03	2023-10-09 08:51:03
117	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	01e9561bc6a750fb1533f6cbbb1af75005051c745ddcb1262a08276c6cf9cc6f	["*"]	\N	2023-10-09 08:52:41	2023-10-09 08:52:41
118	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	a955602e56aab11ae385e583f97b7b742fdb99a7fa4532a56a40b9145b0baa56	["*"]	\N	2023-10-09 09:51:05	2023-10-09 09:51:05
119	App\\Models\\User	74	74Binsha Mbbinshambrs@gmail.com	6726673eb8ecbd583f57f462d57c36f9cf6a16f6fa2f66cf771ad42f92dbf388	["*"]	\N	2023-10-09 15:29:47	2023-10-09 15:29:47
120	App\\Models\\User	74	74Binsha Mbbinshambrs@gmail.com	0f22cb893c4da6e8d302906385bec799bbe8097bb3f2543ec68876b142bc737b	["*"]	\N	2023-10-09 15:29:57	2023-10-09 15:29:57
121	App\\Models\\User	77	Personal Access Token	7e5f403aec02e548c9f11717ce86450821bf25f4edccd75d354c6fea7e991ea6	["*"]	\N	2023-10-09 15:58:48	2023-10-09 15:58:48
122	App\\Models\\User	77	77testDevtest2@gmail.com	97ba9d782bc150c3224a465eb2dbb6e69d564d20daf5830d7e3d646bce20e690	["*"]	\N	2023-10-09 15:58:49	2023-10-09 15:58:49
123	App\\Models\\User	77	77testDevtest2@gmail.com	f5fb78d8d9292f17d47e1ba68515091098b0ad3e4bb4ca0666b9abdd5a7bdc5f	["*"]	\N	2023-10-09 15:58:49	2023-10-09 15:58:49
124	App\\Models\\User	77	77testDevtest2@gmail.com	ef32c9552d8c07e126988ee0f07d48a8a78de64a3e2cd73ff863a06789bbbf99	["*"]	\N	2023-10-09 15:59:09	2023-10-09 15:59:09
125	App\\Models\\User	78	Personal Access Token	87a5501f29aa2e9720e721ff17e8de7f78c731874327ad75d55d2b29326a5b52	["*"]	\N	2023-10-09 17:06:38	2023-10-09 17:06:38
126	App\\Models\\User	78	78Perlsperls@yopmail.com	6e3af16069d0b5c9b644e1ce7a605fea92185b4455ff60a6712275722857898d	["*"]	\N	2023-10-09 17:06:38	2023-10-09 17:06:38
127	App\\Models\\User	78	78Perlsperls@yopmail.com	04ac04f286fcf076cd2ac714dc4b8ff89496115df26740dd5daa50c48cec4cd3	["*"]	\N	2023-10-09 17:06:38	2023-10-09 17:06:38
128	App\\Models\\User	79	Personal Access Token	51f5b98bcd159ed3786be26788092cda61b82ef58924328b547578320a07d0e4	["*"]	\N	2023-10-09 17:08:05	2023-10-09 17:08:05
129	App\\Models\\User	79	79FRPfep@yopmail.com	d968d7c745ddeb74248b4ef1a614e93feeab038ec58f77443445881b0aa2bbc4	["*"]	\N	2023-10-09 17:08:06	2023-10-09 17:08:06
130	App\\Models\\User	79	79FRPfep@yopmail.com	89af7178f1ae618eac44b5d7d01b33f04132250645a50befba3addd775008267	["*"]	\N	2023-10-09 17:08:06	2023-10-09 17:08:06
131	App\\Models\\User	78	78Perlsperls@yopmail.com	8e9ac8c989e5159a7067bfd67b77822aea38f0deb3a23a85caa44940a48da8ae	["*"]	\N	2023-10-09 17:08:25	2023-10-09 17:08:25
132	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	9072002770cb398e321914c68f3f8e7aab7d766cd3812bef4199f872fba2880a	["*"]	\N	2023-10-09 17:22:34	2023-10-09 17:22:34
133	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	48c85f9b4ecb83a6373e8ff8507c69341855445fda2c9123186c372bb3042228	["*"]	\N	2023-10-09 17:25:41	2023-10-09 17:25:41
134	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	efec43c308daae4ab892ce2f10d4ffe9a29f7769c489301e40b425e9b8edf969	["*"]	\N	2023-10-09 17:28:09	2023-10-09 17:28:09
135	App\\Models\\User	77	77testDevtest2@gmail.com	5c15cbff50497249461e7e6f8bf4936a33dbd5dcc879384e2b31ee8e38086b43	["*"]	\N	2023-10-09 17:31:52	2023-10-09 17:31:52
136	App\\Models\\User	77	77testDevtest2@gmail.com	e0b0fc3878c812c74cc59f3e2ac7c3534aa42d80427f366cdcbc4a9a06b19afb	["*"]	\N	2023-10-09 22:16:33	2023-10-09 22:16:33
137	App\\Models\\User	77	77testDevtest2@gmail.com	d778f86d6fa9496c9985445f3eedb5fc7957e5ac7712842d5739a18fb3bb5214	["*"]	\N	2023-10-09 22:19:09	2023-10-09 22:19:09
138	App\\Models\\User	77	77testDevtest2@gmail.com	9333ba31b595628a6935695abc32a5de30d348a2d5c7e74592a205d43dffd8a3	["*"]	\N	2023-10-09 23:55:19	2023-10-09 23:55:19
139	App\\Models\\User	77	77testDevtest2@gmail.com	8d7ff6e5cb0a8f44eaa001e5aeed5a60ce4112d34e67760989a6ab7f0071c3c0	["*"]	\N	2023-10-10 00:12:24	2023-10-10 00:12:24
140	App\\Models\\User	77	77testDevtest2@gmail.com	769e975526fa68cf9d97cf286d74b1ef4e76bc9e047dca3226e01a82e53ef3f8	["*"]	\N	2023-10-10 00:31:58	2023-10-10 00:31:58
141	App\\Models\\User	80	Personal Access Token	edc48ca51b21e46f9f448bad851e812fcdbb410da5767c5f0c12e09036fab252	["*"]	\N	2023-10-10 01:32:27	2023-10-10 01:32:27
142	App\\Models\\User	80	80test threetest3@gmail.com	574576b6be9180aac2ec20d48674471316685dc8139219212118406944e6a8d5	["*"]	\N	2023-10-10 01:32:28	2023-10-10 01:32:28
143	App\\Models\\User	80	80test threetest3@gmail.com	f18ca03004394591ef1b30a6742121e0d246c8282092bc379d2739037c022f66	["*"]	\N	2023-10-10 01:32:28	2023-10-10 01:32:28
144	App\\Models\\User	81	Personal Access Token	d27a64f0d0f06daef2d658a0f7e557c3ce5f4823728ba72cab3287954e6d895e	["*"]	\N	2023-10-10 01:43:06	2023-10-10 01:43:06
145	App\\Models\\User	81	81test fourtest4@gmail.com	67e487b37b6a9d9c967de3e52df4ef7634d87ae1d2ae5fa3eaf6549f067a42a9	["*"]	\N	2023-10-10 01:43:07	2023-10-10 01:43:07
146	App\\Models\\User	81	81test fourtest4@gmail.com	767b33781beb3f3d7553834d54aa01865472243e3ab28b1a1bfdba91fa8eedc7	["*"]	\N	2023-10-10 01:43:07	2023-10-10 01:43:07
147	App\\Models\\User	82	Personal Access Token	31514a38d8516da619b0708a1d63e0c7c83631171644c505a72719b3680d15be	["*"]	\N	2023-10-10 01:48:31	2023-10-10 01:48:31
148	App\\Models\\User	82	82test fivetest5@gmail.com	7de48cbaa1e8b8e1d8ef38961c9a07b73333167cb6c6660861aab406ff3c8064	["*"]	\N	2023-10-10 01:48:32	2023-10-10 01:48:32
149	App\\Models\\User	82	82test fivetest5@gmail.com	101063ea3bfd8c799afd26acef35828a7d4e487512c09d1935cc87857c0ff246	["*"]	\N	2023-10-10 01:48:32	2023-10-10 01:48:32
150	App\\Models\\User	77	77testDevtest2@gmail.com	ff006dca98a218e047891fe7369e64faf11493956751fbebb37848cbfb7d0c2d	["*"]	\N	2023-10-10 08:20:44	2023-10-10 08:20:44
151	App\\Models\\User	74	74Binsha Mbbinshambrs@gmail.com	2da83289898786c878e43c9a7a77ffa80329dbc9b0639c2e25bc5671d1e77f04	["*"]	\N	2023-10-10 08:38:35	2023-10-10 08:38:35
152	App\\Models\\User	74	74Binsha Mbbinshambrs@gmail.com	2c3f47aff4ddb837d6b68b8315bf1ce00b721b7071ca5f2c437ad0d6d53c64ea	["*"]	\N	2023-10-10 09:10:58	2023-10-10 09:10:58
153	App\\Models\\User	83	Personal Access Token	4205d9f92ab107268a0ffa9357d9b184af979938b1ef6cb47c3c61a6d80fcb4b	["*"]	\N	2023-10-10 09:35:10	2023-10-10 09:35:10
154	App\\Models\\User	83	83testtestdriver@gmail.com	5a580bc37564a44bf948ec508acb9e1bad70df376b4c826c02036b48012c2ed6	["*"]	\N	2023-10-10 09:35:34	2023-10-10 09:35:34
155	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	bc5a8296f1360f09f2ea97955bbb9fc053600bcc7f7880fe91d237e5f8cee06b	["*"]	\N	2023-10-10 10:05:09	2023-10-10 10:05:09
156	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	bdfdea2b4cfcba120da407d33bbe53a5cbd338de07fd58f347140ba51e50d9b3	["*"]	\N	2023-10-10 10:05:46	2023-10-10 10:05:46
157	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	c895714a407974c17edba51e8afeb99a5b19c3af381ff359bb593a0be99f23e3	["*"]	\N	2023-10-10 10:29:24	2023-10-10 10:29:24
158	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	d11e5f48bf09f105b78ed2eed97de0670ddaeb20cedc879415b884d00bf1bc0d	["*"]	\N	2023-10-10 10:57:46	2023-10-10 10:57:46
159	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	9b122855b988a9b75f3106019a4de75a4f45346061ca7b809eb65c960da09b6b	["*"]	\N	2023-10-10 14:42:34	2023-10-10 14:42:34
160	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	32db1bf6f5939bc5bdc9970212ee605a2b7becc5db84859435931397833b308f	["*"]	\N	2023-10-10 16:43:13	2023-10-10 16:43:13
161	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	9df85a618d7b7a11c157ac25d83f19c06720857b917501c83a10a285f84d7f31	["*"]	\N	2023-10-10 16:45:22	2023-10-10 16:45:22
162	App\\Models\\User	82	82test fivetest5@gmail.com	e102cdda6cc46f43462c40abe58a7c444224ba2bde8ca666ad467bdb9c91e6d4	["*"]	\N	2023-10-10 17:20:56	2023-10-10 17:20:56
163	App\\Models\\User	83	83testtestdriver@gmail.com	34165a3c4ad8b0f5e7006c223c78863806146066dd6ccc5152691e9b6d0f233f	["*"]	\N	2023-10-10 21:41:24	2023-10-10 21:41:24
164	App\\Models\\User	83	83testtestdriver@gmail.com	55d3fcca68a6ab72188df831d9154322ec644556e3cbae3541c59af30075633d	["*"]	\N	2023-10-10 21:44:09	2023-10-10 21:44:09
165	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	6f3c8a02b37ea472c5024269776e898dd88147b05f4bb7d7658599ee30c5ccba	["*"]	\N	2023-10-10 21:59:20	2023-10-10 21:59:20
166	App\\Models\\User	83	83testtestdriver@gmail.com	39cd86bfd326057d6bf91027f13c57350b811377c26c8a3c1b359f232040cf4c	["*"]	\N	2023-10-11 01:42:54	2023-10-11 01:42:54
167	App\\Models\\User	83	83testtestdriver@gmail.com	68e2e7848dd200ad970a4a654f12290bb6a047f8b280b362a970f5a57c3ce0f5	["*"]	\N	2023-10-11 08:38:14	2023-10-11 08:38:14
168	App\\Models\\User	83	83testtestdriver@gmail.com	0e454c62ebdbad92988f9ffa1eebbbc902e4c4075590b428b11a0c22ba290163	["*"]	\N	2023-10-11 08:43:01	2023-10-11 08:43:01
169	App\\Models\\User	83	83testtestdriver@gmail.com	aa123e20b50e56770a72add0ea0e8f0365448b9316c6f12d0a903027ee275410	["*"]	\N	2023-10-11 09:01:33	2023-10-11 09:01:33
170	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	1d15b0364f374169616293cdd8b9b647b42a666bb2d14dc76efdb9bd27aebf7b	["*"]	\N	2023-10-11 09:03:50	2023-10-11 09:03:50
171	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	59bb355db656e2226c2dba74ae94329c847130807a11fd03d44a5aa358f45694	["*"]	\N	2023-10-16 14:39:35	2023-10-16 14:39:35
172	App\\Models\\User	83	83testtestdriver@gmail.com	095046f38e5b474d4f3130aa99cd08c1b7eb53a8731c4c686d3fec2b5d4cd546	["*"]	\N	2023-10-16 14:45:03	2023-10-16 14:45:03
173	App\\Models\\User	83	83testtestdriver@gmail.com	957c5c5b0fe850e2937a54ceff3c1e3b747632722696b6632a9cc9700ca13fcf	["*"]	\N	2023-10-16 14:53:18	2023-10-16 14:53:18
174	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	da4d8f6757fe31f17438c02e16c2da08b5f05f5f38cb73760a95747f5df001ef	["*"]	\N	2023-10-16 14:55:09	2023-10-16 14:55:09
175	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	7569845f0e7554ba76720d912017b4a6a90fb678ce5c0a6d4f6d424c86ee58e4	["*"]	\N	2023-10-16 14:57:20	2023-10-16 14:57:20
176	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	cfdcd3eedc18390a248139dbb48d290f09b201dfdcf09a2b6e3b3901890b8a6f	["*"]	\N	2023-10-16 14:57:54	2023-10-16 14:57:54
177	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	8d87a150175c588bb3ef7285137b53c49954238062fa6fb4d8fe67c71e4e379f	["*"]	\N	2023-10-16 15:00:14	2023-10-16 15:00:14
178	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	af4a704a1d00037dafcf5ca41d751ddc549a11ccd56c5aac42aeb0d6ff7ad2c0	["*"]	\N	2023-10-16 15:55:59	2023-10-16 15:55:59
179	App\\Models\\User	83	83testtestdriver@gmail.com	574c60e8fcb5039fc04f08e497800ec94a6349b51f31ff42cb58a79688449b60	["*"]	\N	2023-10-16 15:58:41	2023-10-16 15:58:41
180	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	a903e0a5f037b70147bbd34dfe5fa4d8a5de6300e743bfb76ec6c236c8b16158	["*"]	\N	2023-10-16 16:03:16	2023-10-16 16:03:16
181	App\\Models\\User	83	83testtestdriver@gmail.com	334190d092adadc73f0c1acf48881df62b484651a831c89738cf0c40a45eebe9	["*"]	\N	2023-10-16 16:04:56	2023-10-16 16:04:56
182	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	e2932aa523edaa59b2a81bb9b2657ead14a2b48b8eaae78acc6d7cfb1d4775ce	["*"]	\N	2023-10-16 16:14:25	2023-10-16 16:14:25
183	App\\Models\\User	83	83testtestdriver@gmail.com	9d32aca26b3552f86dc5a8c2e56e6735d4e1e425d75ea5b1661174300d8683b7	["*"]	\N	2023-10-16 16:30:16	2023-10-16 16:30:16
184	App\\Models\\User	83	83testtestdriver@gmail.com	b107f62957446cb37b1bf65009fd651be289472db6f0ad75d94357e217fcf78d	["*"]	\N	2023-10-16 16:33:38	2023-10-16 16:33:38
185	App\\Models\\User	83	83testtestdriver@gmail.com	fc169cf932c00b2100f1c1bddb322b1653e4540077d4803df6c88f5208a4f4a7	["*"]	\N	2023-10-16 16:33:56	2023-10-16 16:33:56
186	App\\Models\\User	83	83testtestdriver@gmail.com	cbb52b93c8b54f134e3571d3838f1b94db6d899d616931a794ced89c299e7f78	["*"]	\N	2023-10-16 16:35:51	2023-10-16 16:35:51
187	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	c7d275b39ab672120e738bc78aa63c944dcda813dadf648a2aff380ba29904bf	["*"]	\N	2023-10-16 16:38:26	2023-10-16 16:38:26
188	App\\Models\\User	83	83testtestdriver@gmail.com	2e70027530693ba06928bd75e7c19e6b58b04b26467962f72323c7c96b220145	["*"]	\N	2023-10-16 16:42:38	2023-10-16 16:42:38
189	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	06d524b849c03103a3b99ffd09d0880644fd464a5f4b649ac92a61bec5105112	["*"]	\N	2023-10-16 17:07:17	2023-10-16 17:07:17
190	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	6e313b34468cc24ef22f53109e184dfaf6db1166d99309d46f968629772749de	["*"]	\N	2023-10-16 17:16:44	2023-10-16 17:16:44
191	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	f1f44dd8e039a22a99bacee166de0813d8ce9c72bcbc0489588d20300c8930ad	["*"]	\N	2023-10-17 08:26:25	2023-10-17 08:26:25
192	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	3ed5bf74b683765fb709ca259d440d42a24b589307adb07fd7db397e50f6e17d	["*"]	\N	2023-10-17 08:57:47	2023-10-17 08:57:47
193	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	1c02ec71b375f774af26e1dcd0fcbd21e81a3b3f2f4167dbf9e67079de2caeac	["*"]	\N	2023-10-17 09:05:16	2023-10-17 09:05:16
194	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	decf6251d1256a0c248037141d4a6543c484842bb9582f2d2715609b8c9d7a1f	["*"]	\N	2023-10-17 09:19:53	2023-10-17 09:19:53
195	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	351244302f98701a7a87ee91000b2d0b3f04a704252c2b9722fc0f706984b41a	["*"]	\N	2023-10-17 09:51:40	2023-10-17 09:51:40
196	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	5e77024b92b07909260a03ff4c69389eca21219a81d4eb77e1a2285b31d62658	["*"]	\N	2023-10-17 09:55:09	2023-10-17 09:55:09
197	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	e40fb880245c0ff087b6f6c73ece0b61cd1d3784fccade5b2842f812c68b15ef	["*"]	\N	2023-10-17 09:55:59	2023-10-17 09:55:59
198	App\\Models\\User	83	83Binshatestdriver@gmail.com	85161e4612969fd261822edf4a1dc7a1e352f718f649439e2b0738deba98fd60	["*"]	\N	2023-10-17 09:57:36	2023-10-17 09:57:36
199	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	b77753ba65924770a999a8b0888ab799527d904f61d249113a8928db74f551b3	["*"]	\N	2023-10-17 10:06:04	2023-10-17 10:06:04
200	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	cd42a001efecdcfc3df720d39dbab1af5ac7c4b8bc8d51cf4131774e0bee0acf	["*"]	\N	2023-10-17 10:07:08	2023-10-17 10:07:08
201	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	057fc2c5a2115da2501ecc66297cbced007c0dd1691f2848741616a6df345849	["*"]	\N	2023-10-17 10:08:34	2023-10-17 10:08:34
202	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	33fdd447d1bc7dd7269831a58e85b539c4303b930aeed1c765bed1a7474c97b5	["*"]	\N	2023-10-17 10:09:21	2023-10-17 10:09:21
203	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	d9f3145c5fc39d66f5f279dbf5703d15aa26b92b91d067c21ff3ac0d647ee447	["*"]	\N	2023-10-17 11:34:05	2023-10-17 11:34:05
204	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	3748fa121cfe463ee2213a357e426e62bb5682de65e69c6a9690609d3e6956f0	["*"]	\N	2023-10-17 11:45:50	2023-10-17 11:45:50
205	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	91bec6e7180aa4f5049620fa422e14d28ba8a69d333d844895aa849c5a87c235	["*"]	\N	2023-10-17 11:58:57	2023-10-17 11:58:57
206	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	65b88217f5a8456b95ae636617f1abf8356430c30b3a4ba52c5765aeef2240db	["*"]	\N	2023-10-17 12:03:17	2023-10-17 12:03:17
207	App\\Models\\User	71	71android testerandroid_driver12@hotmail.com	542c076be1e3eb54fb51f0113214599f48a1d31f086d4797f1ec10bd35612440	["*"]	\N	2023-10-17 12:44:16	2023-10-17 12:44:16
208	App\\Models\\User	83	83Binshatestdriver@gmail.com	77ba8b65f27c95cc97c919024249dbdc7c8bfb885b8780c35a6abfc24844ebb9	["*"]	\N	2023-10-17 12:45:12	2023-10-17 12:45:12
209	App\\Models\\User	83	83Binshatestdriver@gmail.com	9c6469d49e3feb3a30d5919811fa8dd275a16811a48f40bccd9bfd0dbbb76c3d	["*"]	\N	2023-10-17 12:46:03	2023-10-17 12:46:03
210	App\\Models\\User	71	71android testerandroid_driver12@hotmail.com	5abd4dad7c65a735a0eabec031bdbf002d35becd650ec72082976d8f60bef65f	["*"]	\N	2023-10-17 12:47:33	2023-10-17 12:47:33
211	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	01531b60c5ba5295a21d48c49c4bd6b01b561a90b78f7dba8564511019e66a74	["*"]	\N	2023-10-17 13:18:23	2023-10-17 13:18:23
212	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	9a30c7bf00769421adfa39ec94c27066dc09b99d47780b6b7a543fb6f1e0d146	["*"]	\N	2023-10-17 15:01:46	2023-10-17 15:01:46
213	App\\Models\\User	71	71android testerandroid_driver12@hotmail.com	0723163ab9c3964d637d9f7f3a9ccba31cbd3be2cca5df646ff48054fe22ced8	["*"]	\N	2023-10-17 15:11:43	2023-10-17 15:11:43
214	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	c1a38d99d44fbb2da47a3f4d9d2775793b39a9d12c65c3e4275d86bb9dfd033b	["*"]	\N	2023-10-17 15:16:20	2023-10-17 15:16:20
215	App\\Models\\User	83	83Binshatestdriver@gmail.com	a27f578e9642cfe23a3b34e19f31edf73c1da9755d98c2875061d39cdcf6eb86	["*"]	\N	2023-10-17 15:18:10	2023-10-17 15:18:10
216	App\\Models\\User	83	83Binshatestdriver@gmail.com	57ed29687460b074647044532e976a0ff0d18a65a2924738e7ffa25c9b736b0b	["*"]	\N	2023-10-17 15:19:16	2023-10-17 15:19:16
217	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	1d19f32fd529470706b9faa7907172bb4e6a55572b4cbd055a30dc321e0bc7d2	["*"]	\N	2023-10-17 15:27:43	2023-10-17 15:27:43
218	App\\Models\\User	83	83Binshatestdriver@gmail.com	14bb77f30f17557fcda42963fa0793e304a68e3b78dfd31ce87124837308b68c	["*"]	\N	2023-10-17 15:36:17	2023-10-17 15:36:17
219	App\\Models\\User	83	83Binshatestdriver@gmail.com	d65b4e60625761532ee3bd48e63cf3a9268a0773a2fdb9d2ef8af52e8bf5cdb5	["*"]	\N	2023-10-17 15:37:02	2023-10-17 15:37:02
220	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	10cd8ad948bfaa5a078d86ad5ff006e8b45aa35de7908d129762af7fbd530a0e	["*"]	\N	2023-10-17 15:51:23	2023-10-17 15:51:23
221	App\\Models\\User	83	83Binshatestdriver@gmail.com	35ba7e7c951c5b383aff21d03eb2ba40a25d4cc9c050611ede44864204046957	["*"]	\N	2023-10-17 19:50:14	2023-10-17 19:50:14
222	App\\Models\\User	83	83Binshatestdriver@gmail.com	c8736a859aad7e5e35589cbfe646b70d357df36ee0eff62579914822dc9b103d	["*"]	\N	2023-10-18 02:58:48	2023-10-18 02:58:48
223	App\\Models\\User	83	83Binshatestdriver@gmail.com	4896fea3d094551b8f524d3ab8b2d8cdc192fd2fb13208168043dd40df1fd0be	["*"]	\N	2023-10-18 08:42:12	2023-10-18 08:42:12
224	App\\Models\\User	83	83Binshatestdriver@gmail.com	45960429928aa81f801a1c3565eedeac2bee0855fb5381d64c261bc4e2381943	["*"]	\N	2023-10-18 08:53:27	2023-10-18 08:53:27
225	App\\Models\\User	83	83Binshatestdriver@gmail.com	c116de138f04d1f641144f9705e0d798708a78f9515f3dbdab17077bae2197b3	["*"]	\N	2023-10-18 08:56:30	2023-10-18 08:56:30
226	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	503f996899f0b17fce23bf0f7f384e50f1e951723870f241e5037003fb4a8ea1	["*"]	\N	2023-10-18 10:02:39	2023-10-18 10:02:39
227	App\\Models\\User	83	83Binshatestdriver@gmail.com	e4216c31efb061d6da9acc6a76aff783a6ca29a6117037e30a308a1a5ce1c8cf	["*"]	\N	2023-10-18 10:59:09	2023-10-18 10:59:09
228	App\\Models\\User	83	83Binshatestdriver@gmail.com	d5b0abd83b38333d2077133a35ca0e2911ae268d5f05db47283bc84ca5347c8e	["*"]	\N	2023-10-18 12:05:51	2023-10-18 12:05:51
229	App\\Models\\User	84	Personal Access Token	0c4146b36587aacf81ae55b4abbd086fcbb8d80dd6a85f1f74948520c9521186	["*"]	\N	2023-10-18 12:30:58	2023-10-18 12:30:58
230	App\\Models\\User	84	84D X Technologiesdxbapps@yopmail.com	46e449aaaaeb1779841c1f89a6b8b1f70ad919af22d73eba1133f4853ad684f7	["*"]	\N	2023-10-18 12:30:58	2023-10-18 12:30:58
231	App\\Models\\User	84	84D X Technologiesdxbapps@yopmail.com	3d3e7ede225269c774ec120c0ea7abc4242f904c37577c5003837b938e941197	["*"]	\N	2023-10-18 12:30:58	2023-10-18 12:30:58
232	App\\Models\\User	84	84D X Technologiesdxbapps@yopmail.com	492283b278ba6f9654bc1da1de21ab97592cc788b951ca45caacd93c50453a15	["*"]	\N	2023-10-18 12:44:24	2023-10-18 12:44:24
233	App\\Models\\User	84	84D X Technologiesdxbapps@yopmail.com	6bc2d7a763065170202d65e4e21bf702ff314db973f4dd6adf92a7ebc87c17d8	["*"]	\N	2023-10-18 12:45:36	2023-10-18 12:45:36
234	App\\Models\\User	85	Personal Access Token	da995395322799f221d4ebcccfb8a931af42f66e42966703dcbab590c7e84011	["*"]	\N	2023-10-18 13:16:37	2023-10-18 13:16:37
235	App\\Models\\User	85	85Liverpoolliverpool@yopmail.com	cf9654c46c1e02f77c197d2a3d03700c86a479156990cffee0aa7ded3c6a32f2	["*"]	\N	2023-10-18 13:16:37	2023-10-18 13:16:37
236	App\\Models\\User	85	85Liverpoolliverpool@yopmail.com	84420597fa409e91fa7b9699cd336ad759f1644fe8e6f2556ea1d69fc0cb3353	["*"]	\N	2023-10-18 13:16:37	2023-10-18 13:16:37
237	App\\Models\\User	85	85Liverpoolliverpool@yopmail.com	b37ebd3f4a75538e8816d1da412989fa23aa9e0d558541940315d6fc17ce30e1	["*"]	\N	2023-10-18 15:43:49	2023-10-18 15:43:49
238	App\\Models\\User	85	85Liverpoolliverpool@yopmail.com	d50a747e9118c00b8040fffd6ead0512f06b1fabc17aab434591757716ac45a0	["*"]	\N	2023-10-18 16:18:14	2023-10-18 16:18:14
239	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	cfa93c4185501c524ecea49c6e1453dbbc62be3f2a95e86a6b21b27b50500260	["*"]	\N	2023-10-18 16:43:07	2023-10-18 16:43:07
240	App\\Models\\User	83	83Binsha1testdriver@gmail.com	f000b3f558d8fb4e79a394a12c40fdb764c99ca82d763c3465510b8ec08b524b	["*"]	\N	2023-10-18 16:48:38	2023-10-18 16:48:38
241	App\\Models\\User	83	83Binsha1testdriver@gmail.com	088e431bd1a23a1c69f4f163a2a0abe9ce0b2d624b3ef9330a06de835ded2276	["*"]	\N	2023-10-18 16:51:34	2023-10-18 16:51:34
242	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	355f27d56a83e7ce64b11c5d214612016f144609b39ca6c37d1adcfdd20d896a	["*"]	\N	2023-10-18 17:03:51	2023-10-18 17:03:51
243	App\\Models\\User	86	Personal Access Token	919f47e3200bd5e37bd6c2cae3a7a804522ff6dbba274510ad419bdfc43d1f3a	["*"]	\N	2023-10-18 17:25:23	2023-10-18 17:25:23
244	App\\Models\\User	86	86kirankiran@yopmail.com	f6e645b3ec69bbb29ac82c842787ea14d3f0902cd3f18ec25cf875f6d7155703	["*"]	\N	2023-10-18 17:25:51	2023-10-18 17:25:51
245	App\\Models\\User	83	83Binsha1testdriver@gmail.com	b33dd43104366f08db043682d608a3f5e90ac922b6418b23b5e17b815672ec7b	["*"]	\N	2023-10-18 21:33:30	2023-10-18 21:33:30
246	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	e8185ed1ae6a2577d44bf8ff73b1e5471955f08717470e15e1486feb3edd6863	["*"]	\N	2023-10-18 22:23:17	2023-10-18 22:23:17
247	App\\Models\\User	83	83Binsha1testdriver@gmail.com	a7e5f841d51fd5dd6f5155a274c67fdb21cf525be4533c4041843384505aae34	["*"]	\N	2023-10-19 03:17:39	2023-10-19 03:17:39
248	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	c3fcaf6dbba31b2d1c8dc6a8b2d21ff4eaf1254f167f7f522a4caeff0f28cd51	["*"]	\N	2023-10-19 05:59:26	2023-10-19 05:59:26
249	App\\Models\\User	83	83Binsha1testdriver@gmail.com	22a5b2cf2507e22119a269d467b6878d447041107472b8f21b46b8d44f7f5dd5	["*"]	\N	2023-10-19 06:00:02	2023-10-19 06:00:02
250	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	182b11878f2622035c1f416ab49ceafb1ce098ea19ef29334d2bc973993e1275	["*"]	\N	2023-10-19 11:05:50	2023-10-19 11:05:50
251	App\\Models\\User	85	85Liverpoolliverpool@yopmail.com	02df4f634ae88d9aeafab8de34d3de24efa11972eb8709768dbd926dadc7f952	["*"]	\N	2023-10-19 11:48:04	2023-10-19 11:48:04
252	App\\Models\\User	86	86kirankiran@yopmail.com	75c1d18f9270f64a9c61cd5811ca213ec32855d1e08f0f0fe479c3b0270d1fcf	["*"]	\N	2023-10-19 11:49:17	2023-10-19 11:49:17
253	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	7b8117efa881bb4acbc7122646de483c3c0239ba90667b2031216344ca702bc8	["*"]	\N	2023-10-19 11:52:35	2023-10-19 11:52:35
254	App\\Models\\User	86	86kirankiran@yopmail.com	66ac91689ab632da4aab3dc107c33d969bcbefaaa5f8e6362199e1150b79fd8a	["*"]	\N	2023-10-19 11:57:04	2023-10-19 11:57:04
255	App\\Models\\User	86	86kirankiran@yopmail.com	f85fa2372e54ae9cafaf048ca883de123946c628ef0c66237ec62fee34e7e949	["*"]	\N	2023-10-19 11:58:52	2023-10-19 11:58:52
256	App\\Models\\User	86	86kirankiran@yopmail.com	acf6b7fdfebad2ba0cece10e51afc10964b93ad4491dc779614597348874d3a5	["*"]	\N	2023-10-19 12:28:53	2023-10-19 12:28:53
257	App\\Models\\User	87	Personal Access Token	89fcbfd27e4496a6aca662622cbbf60472862ff0d3f70c5ff05c73f4352c28f4	["*"]	\N	2023-10-19 12:30:06	2023-10-19 12:30:06
258	App\\Models\\User	87	87test Driver Twotestdriver2@gmail.com	87c9265102ee91444aa619403da6f8036d957154170fae3db5aeed3e07a95c24	["*"]	\N	2023-10-19 12:30:24	2023-10-19 12:30:24
259	App\\Models\\User	88	Personal Access Token	677e4be76181214679618e412d461293f98c61e26eae8245223e9682e4087f24	["*"]	\N	2023-10-19 12:35:14	2023-10-19 12:35:14
260	App\\Models\\User	88	88Kishorekishore@yopmail.com	36f92afd74dbd8ed577248663694b11440de245991b3c5069d4e7fe82eed5fdf	["*"]	\N	2023-10-19 12:35:36	2023-10-19 12:35:36
261	App\\Models\\User	83	83Binsha1testdriver@gmail.com	a2c22e6479fa5a73433681c010c8e23d44ffbddc9ddc5b6fdf6653b90700534b	["*"]	\N	2023-10-19 13:03:31	2023-10-19 13:03:31
262	App\\Models\\User	83	83Binsha1testdriver@gmail.com	2e09655bf8e503c52e0dfae52fe7f37dd00a7f1fbad5e89da4f1d9f576b794ad	["*"]	\N	2023-10-19 19:47:35	2023-10-19 19:47:35
263	App\\Models\\User	89	Personal Access Token	fd6f99640b57eedfe0017145520d9340e2bfd8b77ed52b2a21347b2e53966546	["*"]	\N	2023-10-19 21:47:35	2023-10-19 21:47:35
264	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	6a2d4a8fcc4a89266ffd2ab2984afa85db7978e5f1a0e8faa0c89502a1b63dd7	["*"]	\N	2023-10-19 21:51:36	2023-10-19 21:51:36
265	App\\Models\\User	83	83Binsha1testdriver@gmail.com	befd93063696c7d270ab0ae2094e07e91360ebc8784b38b81cc67fd8112baf84	["*"]	\N	2023-10-19 22:01:13	2023-10-19 22:01:13
266	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	f20c0bf5eac90283f09efcdae38382122bed673815fc3e20e84e26ee31ff2c39	["*"]	\N	2023-10-19 22:29:19	2023-10-19 22:29:19
267	App\\Models\\User	83	83Binsha1testdriver@gmail.com	c42961593a09c222afc3cd445df71dfb02810f2bc65c5e7549b75eb82bcc10b5	["*"]	\N	2023-10-19 22:55:02	2023-10-19 22:55:02
268	App\\Models\\User	83	83Binsha1testdriver@gmail.com	11d42fac1c2b3cc5fe4f3eccfeb40926d665c02bf8ab16e205ec5d3c4adaf8c7	["*"]	\N	2023-10-19 23:08:58	2023-10-19 23:08:58
269	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	d05dcf26798f3c1fdadf4e1fefce6318b0367c594d20b860555eac6259c14ada	["*"]	\N	2023-10-19 23:14:17	2023-10-19 23:14:17
270	App\\Models\\User	83	83Binsha1testdriver@gmail.com	dc1aa817ba0344240b5d195519484f73f813b6c845b72bd2fc411dcbe36ef11a	["*"]	\N	2023-10-19 23:19:53	2023-10-19 23:19:53
271	App\\Models\\User	83	83Binsha1testdriver@gmail.com	367d917279322c8feffa0bd8c38135798691cdc1ae5bc55bc870d1559235dc73	["*"]	\N	2023-10-20 09:17:57	2023-10-20 09:17:57
272	App\\Models\\User	90	Personal Access Token	f71bb76c5842494f977f2ecbd7f355ba4ecf9807cf8039706aa950df8b9dfadb	["*"]	\N	2023-10-20 10:10:06	2023-10-20 10:10:06
273	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	6bf669de217c584f00bdfccc435cfada5d0ba0d3d23ff5336e87a41118a31126	["*"]	\N	2023-10-20 10:12:06	2023-10-20 10:12:06
274	App\\Models\\User	91	Personal Access Token	f6e86399307814699c783d2eb1464e176056e211e2c98e3dc679cd45f5b7f352	["*"]	\N	2023-10-20 10:17:29	2023-10-20 10:17:29
275	App\\Models\\User	91	91test fourtestdriver4@gmail.com	bf99e101f9f2eef71a9c16fb852b9a5502053bac0d0e628feb4df893508d1d88	["*"]	\N	2023-10-20 10:18:48	2023-10-20 10:18:48
276	App\\Models\\User	92	Personal Access Token	4e4cdcbf96e3c3a20d0b5fb9be12ceb0b18a61e49c83ac55a36e9aa5ceb94a2d	["*"]	\N	2023-10-20 10:30:35	2023-10-20 10:30:35
277	App\\Models\\User	92	92Abdul Ghanidriver@driver.com	efd2ee88bf55455d6107bf7ac9d67053955f431d53202c5aa3fb2247c34bd983	["*"]	\N	2023-10-20 10:30:35	2023-10-20 10:30:35
278	App\\Models\\User	93	Personal Access Token	a53fc870fb80dffed9c1c45030d9f68ac3370568d15619d116fcb6a5dcca50f2	["*"]	\N	2023-10-20 10:33:24	2023-10-20 10:33:24
279	App\\Models\\User	93	93Meenumeenu@gmail.com	f553f72acf05c4389a211712071a729c4c9e850d7b926e87db898dfd61c8d0fd	["*"]	\N	2023-10-20 10:33:24	2023-10-20 10:33:24
280	App\\Models\\User	93	93Meenumeenu@gmail.com	5c8f40b88fe43d596458242a9c4ae1d527478d325abc4e93bae3603ae3e39c40	["*"]	\N	2023-10-20 10:33:24	2023-10-20 10:33:24
281	App\\Models\\User	94	Personal Access Token	4397cddbdb1a23c036a6ade43251a342664bea03548b0bed4ee9edebb7b620b4	["*"]	\N	2023-10-20 10:39:19	2023-10-20 10:39:19
282	App\\Models\\User	94	94yest fivetestdriver5@gmail.com	14927edf6497d3a2cdb4ecb663c4c6d47f4e64821293fcc5c11817fc281b3c36	["*"]	\N	2023-10-20 10:39:19	2023-10-20 10:39:19
283	App\\Models\\User	95	Personal Access Token	799c24d8be72b5693a28fea79b1c12a997235f8d940ab95121f786521ffb26e8	["*"]	\N	2023-10-20 10:44:22	2023-10-20 10:44:22
284	App\\Models\\User	95	95test sixtestdriver6@gmail.com	620d1d67dee3615aa67e51bb2458aec4af2bc733c8e8f1d251e15e6e5d1af5ec	["*"]	\N	2023-10-20 10:44:22	2023-10-20 10:44:22
285	App\\Models\\User	96	Personal Access Token	7879127cfdef8d835bbf196a9982e2e7e465bfa8ca673e07e673a91863687fe5	["*"]	\N	2023-10-20 10:48:45	2023-10-20 10:48:45
286	App\\Models\\User	96	96test seventestdriver7@gmail.com	61eea1d331bddbdd3738b96d5e3659d30b7332c6a62feb538f3dbd9038070195	["*"]	\N	2023-10-20 10:48:45	2023-10-20 10:48:45
287	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	fce9fcd51fc19c1405814042b8b53634f2473ee589d9697820a2872dd988e0db	["*"]	\N	2023-10-20 10:53:32	2023-10-20 10:53:32
288	App\\Models\\User	83	83Binsha1testdriver@gmail.com	980681603077ba002006070e0a597f8d9c380a70623f992b99baa62421e13975	["*"]	\N	2023-10-20 13:10:58	2023-10-20 13:10:58
289	App\\Models\\User	97	Personal Access Token	72c685d422db2aa1c59c6ab8f66bda125b7c8a1bae139d07523652b1cd9be93a	["*"]	\N	2023-10-20 13:51:51	2023-10-20 13:51:51
290	App\\Models\\User	97	97Driver Onedriver1@yopmail.com	9fe01fa87b55307d396ebcf64811e2f68b4203e5b093e88443e195e9fd6e484c	["*"]	\N	2023-10-20 13:51:51	2023-10-20 13:51:51
291	App\\Models\\User	98	Personal Access Token	1d7d38b03acfbf2d4033038a9376895585c9a3e962d21e39cb2bb9fdf482844d	["*"]	\N	2023-10-20 13:55:57	2023-10-20 13:55:57
292	App\\Models\\User	98	98Driver Twodriver2@yopmail.com	424194a8331b95dd119bc29b5acb2a0e1ffd4a7cade532234109ebef6cbd1d86	["*"]	\N	2023-10-20 13:55:57	2023-10-20 13:55:57
293	App\\Models\\User	85	85Liverpoolliverpool@yopmail.com	9ae6b68526b2a47957c0fe6ddf0ee5a4a0709cfb78f7c9b827f4ea77fc3781c4	["*"]	\N	2023-10-20 15:25:09	2023-10-20 15:25:09
294	App\\Models\\User	85	85Liverpoolliverpool@yopmail.com	9fb55fa6893ec9937577a2c9282f21ab709b0c39fdd0f72187e8281b11a49904	["*"]	\N	2023-10-20 15:27:04	2023-10-20 15:27:04
295	App\\Models\\User	85	85Liverpoolliverpool@yopmail.com	29ce4234221c2c9d3d805d4adc091a27378c7dd2bc4dbcc28b80db31693711da	["*"]	\N	2023-10-20 15:29:23	2023-10-20 15:29:23
296	App\\Models\\User	85	85Liverpoolliverpool@yopmail.com	a23d920da9eba176860456bfc5a0f286ed90f2b768ea6735aae8d98fee32984f	["*"]	\N	2023-10-20 15:31:47	2023-10-20 15:31:47
297	App\\Models\\User	88	88Kishorekishore@yopmail.com	22314fc46811cc400f86c1b822db1179839ec1f5cab706caeb619e204e6b9b34	["*"]	\N	2023-10-20 15:37:29	2023-10-20 15:37:29
298	App\\Models\\User	99	Personal Access Token	1c7945a5bea4ea88eab28a91cd4624ee0a43f4724d9dfe545b41ed3d0e73de75	["*"]	\N	2023-10-20 15:58:23	2023-10-20 15:58:23
299	App\\Models\\User	99	99B testbdriver@driver.com	6ac541d76ea61cd35a04d80a39e539636fdadd0b170c8c5c99c1d09bcaa95e0a	["*"]	\N	2023-10-20 15:58:23	2023-10-20 15:58:23
300	App\\Models\\User	100	Personal Access Token	ecd95602470a9dcfa9ced594d3920137171bd4a144abcc263c555e3017c41849	["*"]	\N	2023-10-20 16:07:04	2023-10-20 16:07:04
301	App\\Models\\User	100	100B testjohn@driver.com	2209c5f3a80f593a694229ac3a82a92db9c48f7d74bf4cdf76d18fd6f5398308	["*"]	\N	2023-10-20 16:07:04	2023-10-20 16:07:04
302	App\\Models\\User	101	Personal Access Token	bec78ea5f2c9eb71fa4aa05b2ae57308b7e54c1c7efc173dc43560bdb4742601	["*"]	\N	2023-10-20 16:48:02	2023-10-20 16:48:02
303	App\\Models\\User	101	101B testlivedriver@driver.com	9dc6c757d2021089358ea5af265ea3ec92ea8996c484f9c96d008e076f6a2f7d	["*"]	\N	2023-10-20 16:48:02	2023-10-20 16:48:02
304	App\\Models\\User	102	Personal Access Token	918df4ea2133b3f6223e500650669843ec875dc7fb6e623f83575aa4ebe5fd16	["*"]	\N	2023-10-20 16:50:37	2023-10-20 16:50:37
305	App\\Models\\User	102	102B testkiyara@driver.com	b76a24a5649ef736de9acc9df2b4383efc48a85667836562e0b3ee88ecb5cab9	["*"]	\N	2023-10-20 16:50:37	2023-10-20 16:50:37
306	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	f5de93cb80bde036daf4973c6c6991ce5f5e49e232401f3bbe52379f05bf41e5	["*"]	\N	2023-10-20 19:39:58	2023-10-20 19:39:58
307	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	bf3ec89348fbb37aba0955d4b7774c430e5836ce96e3a24d411df60ca26cda63	["*"]	\N	2023-10-20 19:44:23	2023-10-20 19:44:23
308	App\\Models\\User	83	83Binsha1testdriver@gmail.com	840b82503c584bc14ffeccb77944a8880886779a421aaf6ed2626f2e9aedf8f6	["*"]	\N	2023-10-20 23:12:11	2023-10-20 23:12:11
309	App\\Models\\User	83	83Binsha1testdriver@gmail.com	a2c57d263468e4b1ad21c4e2da25a3142ec7392e0ab096d1dec2cc3a02308bd4	["*"]	\N	2023-10-20 23:30:25	2023-10-20 23:30:25
310	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	013c112cc8f1d3a294f172e5cc5e4e74ed03e1e9d40cb815d2bc01b55def898b	["*"]	\N	2023-10-21 09:12:16	2023-10-21 09:12:16
311	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	42bff89015e0a4562b840ac04910d9e94393dbdb3d92c987a5fdbc8df4e0e146	["*"]	\N	2023-10-21 09:29:33	2023-10-21 09:29:33
312	App\\Models\\User	83	83Binsha1testdriver@gmail.com	0e9a9b206e1e20aeeb4c169f2fdea290e183fda1de323b2b0040caeeafc58d72	["*"]	\N	2023-10-21 09:33:46	2023-10-21 09:33:46
313	App\\Models\\User	103	Personal Access Token	3f587d86d8c2ef9ed9a852469b5c57eeadf1c81b8afaed488f515c65a979374b	["*"]	\N	2023-10-21 10:39:24	2023-10-21 10:39:24
314	App\\Models\\User	103	103hunain dev ninehunain99@gmail.com	7ead06a50bb3933a8aa60bde0aeb045dfd10426f743a9fa4ca8cda54fd876177	["*"]	\N	2023-10-21 10:39:25	2023-10-21 10:39:25
315	App\\Models\\User	103	103hunain dev ninehunain99@gmail.com	e5a69faa9f70d9ce4436d2152dcdfacb7f467a884732c1a7e74dfcde80e064c1	["*"]	\N	2023-10-21 10:39:25	2023-10-21 10:39:25
316	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	82e8f6ebe34fefd92935c32ec5337888c65d0034d0e73d2fe8ecce18c9af5ecd	["*"]	\N	2023-10-24 08:43:37	2023-10-24 08:43:37
317	App\\Models\\User	85	85Liverpoolliverpool@yopmail.com	9442a0bfe8722bc83e8e29857bc63dedeb61b6b047af02bc0014e789e91ac7fe	["*"]	\N	2023-10-24 10:41:35	2023-10-24 10:41:35
318	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	cca41d1d381e41f3b3f7a35a72d82174191c2d66a12cb6ef5bf879ba78274a01	["*"]	\N	2023-10-24 11:19:07	2023-10-24 11:19:07
319	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	9d477178a56f05b81f72ca2072b329dc22c036e06cdefa6caf1c95fedad842ef	["*"]	\N	2023-10-24 11:20:20	2023-10-24 11:20:20
320	App\\Models\\User	90	90Abdul Ghanidriver@gmail.com	55aab48bf87ef3f0e22a48a8ab47a4cd2be34038bd6030d6a23ffb8423390d27	["*"]	\N	2023-10-24 11:23:25	2023-10-24 11:23:25
321	App\\Models\\User	90	90Abdul Ghanidriver@gmail.com	476d477c6ef0ddffec74c13e81ec249b462df60bad98259817c655b4336e2698	["*"]	\N	2023-10-24 11:27:58	2023-10-24 11:27:58
322	App\\Models\\User	104	Personal Access Token	796137e638548b0b144738e7c67614bbcff60586b176624c8855f75e16fcfc94	["*"]	\N	2023-10-24 11:28:58	2023-10-24 11:28:58
323	App\\Models\\User	104	104Danish Nisardaani4900@gmail.com	eb96634f5703e343fde7a51b5eea94e10cb3a8094ef030071d1c1888868a640a	["*"]	\N	2023-10-24 11:28:58	2023-10-24 11:28:58
324	App\\Models\\User	90	90Abdul Ghanidriver@gmail.com	0d1eb3799f55ee42be2054e6bd52d7ee21c4ca5a46032df46bbd5067853c523c	["*"]	\N	2023-10-24 11:31:13	2023-10-24 11:31:13
325	App\\Models\\User	105	Personal Access Token	ca21a298aeda5fcaa8ac3055d6451030e267178dd5a594972cbfc3d946c56ae0	["*"]	\N	2023-10-24 11:34:09	2023-10-24 11:34:09
326	App\\Models\\User	105	105Dublindublin@gmail.com	a47e024dbefd9d9a6f08e23a0ab662974c66679ba229b3c02c5586294aa21f81	["*"]	\N	2023-10-24 11:34:10	2023-10-24 11:34:10
327	App\\Models\\User	105	105Dublindublin@gmail.com	c6f6c6b6280cd1854087be9d67135e4b353f90734901e3a903d12e2be96c534f	["*"]	\N	2023-10-24 11:34:10	2023-10-24 11:34:10
328	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	7a820baf4c6b982faf35547b3e3c75d57470ad15133abc2b94b57c32aaf65140	["*"]	\N	2023-10-24 11:34:22	2023-10-24 11:34:22
329	App\\Models\\User	97	97Driver Onedriver1@yopmail.com	d3c550ed36a5e01c1d6f01a42238c2ce5427c090637f54673fb4602fa511d2e6	["*"]	\N	2023-10-24 11:38:28	2023-10-24 11:38:28
330	App\\Models\\User	105	105Dublindublin@gmail.com	8581e89b1fe730a6b560cde62c4d8d74427150f9e046c8d0f512a75fe33cd9ab	["*"]	\N	2023-10-24 11:44:21	2023-10-24 11:44:21
331	App\\Models\\User	83	83Binsha1testdriver@gmail.com	2b21a7dad400b6943659c7ec29c68a523d0e8821c2e5b38e5eebc42fb103cbf1	["*"]	\N	2023-10-24 11:45:33	2023-10-24 11:45:33
332	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	4b2d36f55b77196e60341fa42ee1f7ebda18e1dda08707cb86f426c2eb996d59	["*"]	\N	2023-10-24 11:48:18	2023-10-24 11:48:18
333	App\\Models\\User	83	83Binsha1testdriver@gmail.com	2bd131c29ea3a132b5a4c1b93f211df8d99e250284cfd283edf13c47dc955a62	["*"]	\N	2023-10-24 12:04:26	2023-10-24 12:04:26
334	App\\Models\\User	90	90Abdul Ghanidriver@gmail.com	d71c24f958442fc43e178cbd4adce80e20e76dff4d643b7c1cd5fe339add0330	["*"]	\N	2023-10-24 12:17:25	2023-10-24 12:17:25
335	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	d38f29caef0969ac4acfec59a98038b59d5844425514509b6dc6036ec35cb03c	["*"]	\N	2023-10-24 12:28:37	2023-10-24 12:28:37
336	App\\Models\\User	90	90Abdul Ghanidriver@gmail.com	823b5767f59fdcef94dbe5c535df1d8d6f2b1a43874e278a4e6b317c148d7d84	["*"]	\N	2023-10-24 12:32:29	2023-10-24 12:32:29
337	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	171f898ac1d47099da4da00dc68f7a4040f9a681cbdb63a047103af04b7b32ef	["*"]	\N	2023-10-24 14:30:38	2023-10-24 14:30:38
338	App\\Models\\User	85	85Liverpoolliverpool@yopmail.com	1c63ac5883415d997fb9fe269da7f0298dde6a327ac5a83c55ac5f1fc3ae6b3a	["*"]	\N	2023-10-24 14:46:37	2023-10-24 14:46:37
339	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	30a688bd740b2ef4bb149b81acfa337e129718eca0b8d34abc3024fa26998472	["*"]	\N	2023-10-24 15:16:12	2023-10-24 15:16:12
340	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	9e3ff33519ef27086811b1de583ba135267c80657d60c2f334caf2890ea79095	["*"]	\N	2023-10-24 15:16:42	2023-10-24 15:16:42
341	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	34b1d3c34c90896f0fb759ea883c6b8439cf46ec03791e020be821c402dea8c6	["*"]	\N	2023-10-24 15:26:40	2023-10-24 15:26:40
342	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	8b3b97d2525c6cb3be870ec4982535ede5b7bfcecb5ecbfe3da61d510c9166aa	["*"]	\N	2023-10-24 15:45:21	2023-10-24 15:45:21
343	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	e851acdace625ee4e05f0b8ab97e48b94d394b88b59c23412535866b5627f75e	["*"]	\N	2023-10-25 09:13:13	2023-10-25 09:13:13
344	App\\Models\\User	85	85Liverpoolliverpool@yopmail.com	a4c5857409800dbb7f17890a9b248d750e99fa705cd422e4153fdae8d40a3a7c	["*"]	\N	2023-10-25 10:14:34	2023-10-25 10:14:34
345	App\\Models\\User	98	98Driver Twodriver2@yopmail.com	5115ef317a7a76c5b34d55fcb55531ba58d555f5e80f3558762d4afc6585133f	["*"]	\N	2023-10-25 10:34:52	2023-10-25 10:34:52
346	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	b84fad9d1be19f6f8065027fab9ac5ee864352bdda972857d61de0965e27c130	["*"]	\N	2023-10-25 14:19:25	2023-10-25 14:19:25
347	App\\Models\\User	108	Personal Access Token	8389f0e67b298d9fccda090f9af5663c6e392ee901ddd7cd167fd0ee0aff7c3d	["*"]	\N	2023-10-25 16:23:27	2023-10-25 16:23:27
348	App\\Models\\User	108	108KSks@yopmail.com	a617a683eca4fd0d09422bafd45b702d6b0d60ba9c976c1347d2a79c4358f91b	["*"]	\N	2023-10-25 16:23:27	2023-10-25 16:23:27
349	App\\Models\\User	108	108KSks@yopmail.com	88845ae7c8dc17be26972a93743aa951b04be2341166684cae6ab700b3808246	["*"]	\N	2023-10-25 16:23:27	2023-10-25 16:23:27
350	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	02e86dff67e2a02c3bff0d7d180dd84308a4a4c61eb763da59c58ec739c40315	["*"]	\N	2023-10-25 16:45:35	2023-10-25 16:45:35
351	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	2c7ab3e4bbdc130784f594b798b117ebdf5dec5b010bbe310b8449996154ca9c	["*"]	\N	2023-10-26 09:14:50	2023-10-26 09:14:50
352	App\\Models\\User	109	Personal Access Token	eb908b6220bb14df35e068e64a989b87df800ac2896bc54651fd4b8228b697e4	["*"]	\N	2023-10-26 09:21:06	2023-10-26 09:21:06
353	App\\Models\\User	109	109RASras@yopmail.com	f2dc40a20ebe4a0d83c98d934be25aae7a8e7d67fd2b085026a46402c3d7e093	["*"]	\N	2023-10-26 09:21:06	2023-10-26 09:21:06
354	App\\Models\\User	109	109RASras@yopmail.com	0dad304dff27c9f4407ed3cb63e8f40f16aabc877c73a175b2a881e2f8174754	["*"]	\N	2023-10-26 09:21:06	2023-10-26 09:21:06
355	App\\Models\\User	109	109RASras@yopmail.com	af32436452b449eb3e81c328ae0a84c04007a3ed75276023ff1a081926a36f9c	["*"]	\N	2023-10-26 09:21:38	2023-10-26 09:21:38
356	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	9505fb9b47f51ffb46335ed8e7b0228ac0b114e85665b0fb3b074513ab977e1c	["*"]	\N	2023-10-26 09:28:29	2023-10-26 09:28:29
357	App\\Models\\User	85	85Liverpoolliverpool@yopmail.com	25e4c55a9afb1bce6b9feef436a0e2b4c67970f83c42fb7a121cb747ae73ddec	["*"]	\N	2023-10-26 09:39:28	2023-10-26 09:39:28
358	App\\Models\\User	109	109RASras@yopmail.com	43b98eab940a9a447cc7cb393c137e1be6ab3d909651d493315386cfd8e21e53	["*"]	\N	2023-10-26 09:40:19	2023-10-26 09:40:19
359	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	5849e038b44fb6a14f74a2c8e7fd352b07056a7998500d3480864b7aaebaffcd	["*"]	\N	2023-10-26 09:45:37	2023-10-26 09:45:37
360	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	2deb98e86ddc76944c3b1f678244d8eae85063d8297ac7721b9706a29cd73582	["*"]	\N	2023-10-26 09:46:56	2023-10-26 09:46:56
361	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	e2416a4414c746b19071c3468bb4795314437121cd3748a648ea87d7865beff1	["*"]	\N	2023-10-26 09:50:41	2023-10-26 09:50:41
362	App\\Models\\User	108	108KSks@yopmail.com	c716b7358d082e8a259c07d53b6e5511196cb87967944a21ae369d8a7b77fdad	["*"]	\N	2023-10-26 09:50:59	2023-10-26 09:50:59
363	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	d06c0d5fc454d06dc55399c2ca2aaded3daccbf962fcfe086542cc69c1a5a94e	["*"]	\N	2023-10-26 09:55:29	2023-10-26 09:55:29
364	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	69bc4ffea417e4b6954d324d6daba7630f0f1f8c77375bb6aa846a6fea5d2166	["*"]	\N	2023-10-26 09:57:55	2023-10-26 09:57:55
365	App\\Models\\User	108	108KSks@yopmail.com	f14a47edaa9421435f635f773cee775b8df40b6b6d60fe37dd5c24755ee1c579	["*"]	\N	2023-10-26 10:24:54	2023-10-26 10:24:54
366	App\\Models\\User	86	86kirankiran@yopmail.com	e6ab3d416653ea705631e703b054bbaf813c2ceba5c66a7fafb5ee70e5094f45	["*"]	\N	2023-10-26 10:53:18	2023-10-26 10:53:18
367	App\\Models\\User	109	109RASras@yopmail.com	2ae85e7a747b39afcf3e7433acd71ce6e8c569f6ad885d53f8d175e1243e7106	["*"]	\N	2023-10-26 13:55:02	2023-10-26 13:55:02
368	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	fc9fe1005e3ec0c510a737a424912695eb1c5d3f30a2384b7333a997b13d701b	["*"]	\N	2023-10-26 14:41:53	2023-10-26 14:41:53
369	App\\Models\\User	109	109RASras@yopmail.com	098ba0fb81dbb577e53be007e12f30f18ff15eacff50f93ad79c40b38f60ad74	["*"]	\N	2023-10-26 14:49:57	2023-10-26 14:49:57
370	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	ff297dea153be5851014a23c9635e2e2015ea181eae65c105f38494b39b3378f	["*"]	\N	2023-10-26 14:57:39	2023-10-26 14:57:39
371	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	56fc3b66527aa1aaf62f4a7d46321fa3f63d0289c0cd13225fdf2d7275e9a29b	["*"]	\N	2023-10-26 15:18:47	2023-10-26 15:18:47
372	App\\Models\\User	97	97Driver Onedriver1@yopmail.com	dfdfa2c508a11b44b9841baa6c6174ec9dd2d2d0e8c405d7f09f48b186185378	["*"]	\N	2023-10-26 15:31:39	2023-10-26 15:31:39
373	App\\Models\\User	88	88Kishorekishore@yopmail.com	25639530361a50bebbb4b28967b69adb937fe07d9efe60a2c28f0f0eca9fbc06	["*"]	\N	2023-10-26 15:54:17	2023-10-26 15:54:17
374	App\\Models\\User	107	107Paulpaul@yopmail.com	3716800e52250aa45f4fc5f8f946db39f0340392a07e28b699313d28e1c387e9	["*"]	\N	2023-10-26 15:55:30	2023-10-26 15:55:30
375	App\\Models\\User	85	85Liverpoolliverpool@yopmail.com	68265c9be359e2260bb7441d107d4590c3284df299a594112c97dd0f58f8ba60	["*"]	\N	2023-10-26 16:36:44	2023-10-26 16:36:44
376	App\\Models\\User	85	85Liverpoolliverpool@yopmail.com	ef5e4a62440bcd7db009b4cf4fc9681cd270558dd2a10df476d9c2949da40b38	["*"]	\N	2023-10-26 16:43:09	2023-10-26 16:43:09
377	App\\Models\\User	85	85Liverpoolliverpool@yopmail.com	d9efdcfcb50e27d3f5592fa3e9e85aa6d30bcea3d66fc3ea04a6d05af5bbdee1	["*"]	\N	2023-10-26 16:44:30	2023-10-26 16:44:30
378	App\\Models\\User	88	88Kishorekishore@yopmail.com	a41e382fc796210e12b852c0994ac03f3632de63516a1f658fc068286343e14e	["*"]	\N	2023-10-26 17:55:13	2023-10-26 17:55:13
379	App\\Models\\User	86	86kirankiran@yopmail.com	855186ec4cf464ed8cd48ed265c6f9d01fd1ac973b4dd8b2c1ae29cdcb0c74df	["*"]	\N	2023-10-26 18:08:11	2023-10-26 18:08:11
380	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	1196199ed39ffd3df33bda3503fe98712f59d08022326f770f6755cce09b86c7	["*"]	\N	2023-10-26 19:04:04	2023-10-26 19:04:04
381	App\\Models\\User	83	83Binsha1testdriver@gmail.com	40032eddecd9cb151abb24a7374e69e685adffab52181fa8dd4cf38b46faad40	["*"]	\N	2023-10-26 19:11:03	2023-10-26 19:11:03
382	App\\Models\\User	110	Personal Access Token	c4940167fb2ecf521d06acf06603128a7ff1608ffaf861e70d22b3d5070240f6	["*"]	\N	2023-10-27 09:08:32	2023-10-27 09:08:32
383	App\\Models\\User	110	110GS Companygs@yopmail.com	fe5d8a099953cb0dfb89181feaa8a81bae0af3a5e4a7efccb9dd532e4be44597	["*"]	\N	2023-10-27 09:08:33	2023-10-27 09:08:33
384	App\\Models\\User	110	110GS Companygs@yopmail.com	d6a677b6a9736cd6f17772af65c1d2f03e262991186bcdaa680b42cd675983e6	["*"]	\N	2023-10-27 09:08:33	2023-10-27 09:08:33
385	App\\Models\\User	110	110GS Companygs@yopmail.com	59dc85bf22b2db52a2e275860d7df46afb5c3f7fb2b3354a7e20f65fa87b3d7f	["*"]	\N	2023-10-27 09:16:39	2023-10-27 09:16:39
386	App\\Models\\User	111	Personal Access Token	44364f7066ca3a91b362e73a1939e1d5882ba0fc61b57c56979dfbb1670620d1	["*"]	\N	2023-10-27 09:24:07	2023-10-27 09:24:07
387	App\\Models\\User	111	111Mathewmathew@yopmail.com	f04903b0530ad4a5d98cfc49b08dc4e3c0772dd2567e603c93a3ff7884a64354	["*"]	\N	2023-10-27 09:24:07	2023-10-27 09:24:07
388	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	e20841221c3ae46ce5d5c2b9de709b93da8ce4bd0fb9e2eebec538b8a02a3571	["*"]	\N	2023-10-27 09:27:18	2023-10-27 09:27:18
389	App\\Models\\User	86	86kirankiran@yopmail.com	8cbfed25d6f01a2c12d17af0303460d5c84aeb2a6916a8eb65928765f848a4ae	["*"]	\N	2023-10-27 09:32:43	2023-10-27 09:32:43
390	App\\Models\\User	112	Personal Access Token	0528cbcf6859b488fb360042323d282317a81cc9cac38d4d886a0056dc9758e2	["*"]	\N	2023-10-27 09:35:00	2023-10-27 09:35:00
391	App\\Models\\User	112	112B ZBZ@driver.com	1b20ca60a1033c7037b1085c762f3e12a7c2bce4ab9469cf266eecc3fca50521	["*"]	\N	2023-10-27 09:35:00	2023-10-27 09:35:00
392	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	b94deadf8f1c32f997057b82e0e114dfe832b8e2a4fb0f88f948cd43caea6e70	["*"]	\N	2023-10-27 09:36:16	2023-10-27 09:36:16
393	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	f7a52b6dbcc00a9122abb85f437e3601dc67b2407f5604546c7d3318865a4d4f	["*"]	\N	2023-10-27 09:50:42	2023-10-27 09:50:42
394	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	0c89ad7549d782b7245225394d4d6265c395b6fda576705cb58b89c80831174f	["*"]	\N	2023-10-27 10:08:45	2023-10-27 10:08:45
395	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	5da51b9bae55f2189a89ba3e98f23229b718feb08d4d7f03318e720cc1a29d34	["*"]	\N	2023-10-27 10:10:37	2023-10-27 10:10:37
396	App\\Models\\User	85	85Liverpoolliverpool@yopmail.com	bd97aa9e444824ea5660eb8330bdbf6e0316327ff9b4f456a6e3400b2377749a	["*"]	\N	2023-10-27 10:15:03	2023-10-27 10:15:03
397	App\\Models\\User	113	Personal Access Token	859e78689788b560cee7c7a48d05873efc0946292f0481ff7adbe9bba41b1602	["*"]	\N	2023-10-27 11:10:15	2023-10-27 11:10:15
398	App\\Models\\User	113	113TSI Companytsi@yopmail.com	f18298487af0d0c3f00ca138153588d42570b03b17d73623912c4ab87da7ddb0	["*"]	\N	2023-10-27 11:10:16	2023-10-27 11:10:16
399	App\\Models\\User	113	113TSI Companytsi@yopmail.com	d33e8a64a0a4b72fc83fdf51b8e9983270d9e0778420063b362049abf3c50bc7	["*"]	\N	2023-10-27 11:10:16	2023-10-27 11:10:16
400	App\\Models\\User	114	Personal Access Token	b5c8ccb882be51625f8cb65505ca1db529ebd25c700e633c13160b18811e201e	["*"]	\N	2023-10-27 11:20:06	2023-10-27 11:20:06
401	App\\Models\\User	114	114Samsam@yopmail.com	3d173ef5589fb182e52255576602a527e1be265b28ebcd67560fb848bbdde00d	["*"]	\N	2023-10-27 11:20:06	2023-10-27 11:20:06
402	App\\Models\\User	111	111Mathewmathew@yopmail.com	0f1d2ded56e961e8fe3617de5e1e10ce9b76d3db4bcca60da84675a87282ce23	["*"]	\N	2023-10-27 11:39:38	2023-10-27 11:39:38
403	App\\Models\\User	115	115ghani 33ghaniabro33@gmail.com	e7da204b68980ef0d9d32df70dbb9a40772d7cdb717c1a1887eb76fd5378b661	["*"]	\N	2023-10-27 14:35:03	2023-10-27 14:35:03
404	App\\Models\\User	116	116ghani 33ghaniabro34@gmail.com	1ec545bc556e0fe11cf1748c0a08be0e7e3573a517e11a9e4ea42e0cbc090f3e	["*"]	\N	2023-10-27 14:35:58	2023-10-27 14:35:58
405	App\\Models\\User	117	117sfsocial@gmail.com	9a81cebe894370bc56a3df434ed7036b0723e8e37e7e9cfb86d7eba3d8fb24d7	["*"]	\N	2023-10-27 14:42:05	2023-10-27 14:42:05
406	App\\Models\\User	117	117sfsocial@gmail.com	0d1471ac1d29047285860b1897de7ce98b9c692935b6b2364dcaee7b37adf44f	["*"]	\N	2023-10-27 14:42:07	2023-10-27 14:42:07
407	App\\Models\\User	118	118ghani 33ghaniabro35@gmail.com	a4aa0c27d9af6002d00a38c7d26d145955047a5f109be6824660c3eae57c303f	["*"]	\N	2023-10-27 14:42:38	2023-10-27 14:42:38
408	App\\Models\\User	118	118ghani 33ghaniabro35@gmail.com	3a54fdc4540a4a4e6f182a12d11c7308a6b03ce307e27b72394dd393fa807976	["*"]	\N	2023-10-27 14:42:43	2023-10-27 14:42:43
409	App\\Models\\User	118	118ghani 33ghaniabro35@gmail.com	b10f8fc4afcc010b9423c0baafd5293ef9f360da0cb54b2d1d4e89d3963eb8f0	["*"]	\N	2023-10-27 14:42:50	2023-10-27 14:42:50
410	App\\Models\\User	119	Personal Access Token	c4a1c5cdaf814e475f5001a4f3eee2ae00120e7718f0a4972b6db483c931b4ab	["*"]	\N	2023-10-27 14:59:51	2023-10-27 14:59:51
411	App\\Models\\User	119	119user Oneuserone@gmail.com	ffbec7246e2a42ad12cda728fe85bcb489c3e890c3223d2dd46c00bc4fe31eb2	["*"]	\N	2023-10-27 14:59:51	2023-10-27 14:59:51
412	App\\Models\\User	119	119user Oneuserone@gmail.com	6490ba5f4cf22221fcaca83250c332555103b43bc11878915e80581bcbd7ed5e	["*"]	\N	2023-10-27 14:59:51	2023-10-27 14:59:51
413	App\\Models\\User	120	120ghani 33ghanibro33@gmail.com	fca3431a5fb72dbf1181b25ad2340ab9894c911d674757dcb10fde004cf082a7	["*"]	\N	2023-10-27 15:01:45	2023-10-27 15:01:45
414	App\\Models\\User	120	120ghani 33ghanibro33@gmail.com	63eea3ac60968cb3d5518195503a95998b81d11096cb040ccf63141e6f60d08c	["*"]	\N	2023-10-27 16:21:19	2023-10-27 16:21:19
415	App\\Models\\User	84	84D X Technologiesdxbapps@yopmail.com	ceffcb7d9f403471158f55613f54d7e8ac014a4613af2bc1a257c99eb717c09f	["*"]	\N	2023-11-07 10:58:55	2023-11-07 10:58:55
416	App\\Models\\User	114	114Samsam@yopmail.com	2b0b2b0b8092c91537372a6570dc540ed9530bb184b4c9a8d6d9e89cb0c7534c	["*"]	\N	2023-11-07 11:04:15	2023-11-07 11:04:15
417	App\\Models\\User	111	111Mathewmathew@yopmail.com	aa5330ec443f3a97aefa7f1863e9bddc367b1c2c8bd7bb90bdbc974523a49581	["*"]	\N	2023-11-07 11:05:43	2023-11-07 11:05:43
418	App\\Models\\User	107	107Paulpaul@yopmail.com	cc13685b0e5b98508afb3c69bbab0308434f63ff328f76571f0a89ebccb2a619	["*"]	\N	2023-11-07 11:12:06	2023-11-07 11:12:06
419	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	a61ee5f30d0eb65d7fa327f94f37478cee100f73aa9a6d4bf3ee0cac46b13389	["*"]	\N	2023-11-09 11:07:23	2023-11-09 11:07:23
420	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	f9ee5f5cba66c566c2d8c132ae70d78c035185f222fc392ebcf2bbf3180ee59a	["*"]	\N	2023-11-09 11:12:56	2023-11-09 11:12:56
421	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	606696a5135e79c26fb143a855616c1e371bd41991d9767de1afeeb9c9baf286	["*"]	\N	2023-11-09 12:39:49	2023-11-09 12:39:49
422	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	892eab41b8e582fee4390825c567303608b74a80962290a861d889fbda796a89	["*"]	\N	2023-11-10 10:46:11	2023-11-10 10:46:11
423	App\\Models\\User	121	121more moretestdxbuae@gmail.com	a9c63a929ec9b8bec71bc104bd711c306e85e7983b8ff19858eb8a270e4b0db7	["*"]	\N	2023-11-10 11:14:11	2023-11-10 11:14:11
424	App\\Models\\User	121	121more moretestdxbuae@gmail.com	11264b48b32b4df47afb3720d15724d123ad1568ed19d80092cb62f05d1097ff	["*"]	\N	2023-11-10 11:17:42	2023-11-10 11:17:42
425	App\\Models\\User	121	121more moretestdxbuae@gmail.com	527afe1253898d30fbe37d00644bfa3ced8df97f0937ce64f9b47750873f29e5	["*"]	\N	2023-11-10 11:22:50	2023-11-10 11:22:50
426	App\\Models\\User	121	121more moretestdxbuae@gmail.com	87f4ce8f41966aac50143686478d172e8623d3feb934481b574c5d952ce1e932	["*"]	\N	2023-11-10 11:27:28	2023-11-10 11:27:28
427	App\\Models\\User	83	83Binsha1testdriver@gmail.com	48467c9ccf70385c53274dbd03bcc3652c956027e3ae3ee907cc0d4fbdb967da	["*"]	\N	2023-11-10 11:50:33	2023-11-10 11:50:33
428	App\\Models\\User	122	122rusvinrusvinmerak@gmail.com	11d3f1c70de67b6a56901393cf534510953e7fc7a46c4d10e8cc9f6a81585f27	["*"]	\N	2023-11-10 13:09:50	2023-11-10 13:09:50
429	App\\Models\\User	83	83Binsha1testdriver@gmail.com	4d2745babca459cc7b68e4c03c33bd9f3bc5d7dc5b198f39f3607b898a5acbe7	["*"]	\N	2023-11-10 13:09:54	2023-11-10 13:09:54
430	App\\Models\\User	123	123rusvinkrusvinmerak1@gmail.com	6f4fcbfc649604a89a07772eed3cc2d7abdd3ccfde3c87e2ec1d03732e08ad98	["*"]	\N	2023-11-10 13:11:44	2023-11-10 13:11:44
431	App\\Models\\User	123	123rusvinkrusvinmerak1@gmail.com	b3aab4735453662295b03c04295ded949902a7f75b51ca9fc894b07fe2e64c06	["*"]	\N	2023-11-10 13:15:13	2023-11-10 13:15:13
432	App\\Models\\User	123	123rusvinkrusvinmerak1@gmail.com	54c160c14d15c62ba2918e7ab3816ca66c427a78b1c3e1cfe75fb5634dbf93c6	["*"]	\N	2023-11-10 13:19:18	2023-11-10 13:19:18
433	App\\Models\\User	83	83Binsha1testdriver@gmail.com	43322b459ef12f91287d642118934b3c9cbe2c003ef5f869053726df53152027	["*"]	\N	2023-11-10 13:31:23	2023-11-10 13:31:23
434	App\\Models\\User	124	124rusvinkrusvinmerak2@gmail.com	a31de4e21ed2c2d5fb6ffb76047fe583edd3f3cba71f746493d37264d4c572b2	["*"]	\N	2023-11-10 13:31:25	2023-11-10 13:31:25
435	App\\Models\\User	123	123rusvinkrusvinmerak1@gmail.com	0c34e81fa39e49bdd54e0f2f4e94af24c3321897d89b7bd39a26f9f335766218	["*"]	\N	2023-11-10 13:31:42	2023-11-10 13:31:42
436	App\\Models\\User	123	123rusvinkrusvinmerak1@gmail.com	dcc4987102a04bb1d7181c8225b3e82dc649a09ad66ceb2b0463c657f2e423cc	["*"]	\N	2023-11-10 13:31:53	2023-11-10 13:31:53
437	App\\Models\\User	122	122rusvinrusvinmerak@gmail.com	cc9542e4bb3fc7ca74bbc4a04f2e1253163c69eb4d4cce0015b314b14b670eec	["*"]	\N	2023-11-10 13:31:59	2023-11-10 13:31:59
438	App\\Models\\User	125	125rusvinkrusvinmerak123@gmail.com	7ac17ad5e858edd428290b1bc446e0b0a8b691065807ccfaa21fc347393c811a	["*"]	\N	2023-11-10 13:32:08	2023-11-10 13:32:08
439	App\\Models\\User	126	126rusvinkrusvik1213@gmail.com	df3dd7d7f9f67f2fa29329366f2b1c366273fb156af3d47bf6796a12bf729974	["*"]	\N	2023-11-10 13:35:12	2023-11-10 13:35:12
440	App\\Models\\User	127	127rusvinkrusvik213@gmail.com	a5822b2f6cfaf07e9f57512d6fd8ed7f5115591d716ceff1adc62633ec207071	["*"]	\N	2023-11-10 13:35:20	2023-11-10 13:35:20
441	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	e945c1c1e700cfd3b32983536baacc4ac5c80e5294bbdb60d1dfbc8938b8a40b	["*"]	\N	2023-11-10 14:26:38	2023-11-10 14:26:38
442	App\\Models\\User	127	127rusvinkrusvik213@gmail.com	de7d0debcb8643922edc8a0293a68a0370b1572685d06e9436bb62ba92eff783	["*"]	\N	2023-11-10 14:36:03	2023-11-10 14:36:03
443	App\\Models\\User	122	122rusvinrusvinmerak@gmail.com	bb167f5ed970af54a46e00a7e25598119d2595624f8443199367dc599d7eab38	["*"]	\N	2023-11-10 14:36:13	2023-11-10 14:36:13
444	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	2b3ff816349ad9650a99a29d5b62fb430ac6c7da1d248a54236ed4ed7e074873	["*"]	\N	2023-11-10 19:47:35	2023-11-10 19:47:35
445	App\\Models\\User	121	121more moretestdxbuae@gmail.com	8990154b3be9d497b7a974b1656f739b9d37bf59e0c576008afd9ee542440dba	["*"]	\N	2023-11-10 20:59:26	2023-11-10 20:59:26
446	App\\Models\\User	121	121more moretestdxbuae@gmail.com	03e052eae800ab8c8831d9493435a9f4aadb9083cd5776f829fd53c69c034356	["*"]	\N	2023-11-10 21:13:28	2023-11-10 21:13:28
447	App\\Models\\User	121	121more moretestdxbuae@gmail.com	4db76f3c0cf956a7a957c7c4f2e4e2ee65db36253415fe3363b49d9c1acc8076	["*"]	\N	2023-11-10 21:18:19	2023-11-10 21:18:19
448	App\\Models\\User	121	121more moretestdxbuae@gmail.com	673ac92a7dbdb42531781b3e617003cd569718a5431f17efce626ff44e539f70	["*"]	\N	2023-11-10 21:19:44	2023-11-10 21:19:44
449	App\\Models\\User	121	121more moretestdxbuae@gmail.com	27f0c24139e5606c81afec582dfe60a83c9e1fb8dabaddaf99bbb8af9894aea1	["*"]	\N	2023-11-10 21:21:45	2023-11-10 21:21:45
450	App\\Models\\User	121	121more moretestdxbuae@gmail.com	a641c538f044744cee5649eda0a0256f5cd6198621e5feabf4e426d04e435bcd	["*"]	\N	2023-11-10 21:25:21	2023-11-10 21:25:21
451	App\\Models\\User	121	121more moretestdxbuae@gmail.com	9bcd81b7f53a3bb96093bfeb3d5c9cd840b8486832dd1077b07b15914209860f	["*"]	\N	2023-11-10 21:26:27	2023-11-10 21:26:27
452	App\\Models\\User	121	121more moretestdxbuae@gmail.com	c27368f978bd11279815b0d556cd9493dd2edc236caba5b7660dfe58d126bc54	["*"]	\N	2023-11-10 21:27:57	2023-11-10 21:27:57
453	App\\Models\\User	121	121more moretestdxbuae@gmail.com	cc2dcdea58020e3879c31e771bc5cbd22e0b935ef28699d48dfb61cffafb5389	["*"]	\N	2023-11-10 21:28:51	2023-11-10 21:28:51
454	App\\Models\\User	121	121more moretestdxbuae@gmail.com	bf699b3c070df93d4a6d545e5483837605cc08ddaebdaf7b5036c04854fc22d8	["*"]	\N	2023-11-10 21:31:22	2023-11-10 21:31:22
455	App\\Models\\User	121	121more moretestdxbuae@gmail.com	4782b0ecb12939a88acd761bbec17ac4dbf6b3b529b8e3086fc6856b8ba309fd	["*"]	\N	2023-11-10 21:32:40	2023-11-10 21:32:40
456	App\\Models\\User	121	121more moretestdxbuae@gmail.com	62e39ad4c67543ea73ce2801b79319d605dffa89b29c031f1da7679028f749fd	["*"]	\N	2023-11-10 21:35:34	2023-11-10 21:35:34
457	App\\Models\\User	121	121more moretestdxbuae@gmail.com	81d610ac7d581cb2c9fd454e143c9808eb3b87b0bf375aee1fd71ee30e0dbc18	["*"]	\N	2023-11-10 21:37:50	2023-11-10 21:37:50
458	App\\Models\\User	121	121more moretestdxbuae@gmail.com	7314c89e3d1796218ccf1e42f7b143ca406f9ae2b2f310a02c52bb2e941b1115	["*"]	\N	2023-11-10 21:39:17	2023-11-10 21:39:17
459	App\\Models\\User	121	121more moretestdxbuae@gmail.com	b80d8d994cd74cc6bdf5771ff5e66de05fd5ba4a261aa0486c9d602f8e7b86e8	["*"]	\N	2023-11-10 21:49:19	2023-11-10 21:49:19
460	App\\Models\\User	121	121more moretestdxbuae@gmail.com	3427419c0464bcaaf953c7152989706d687d36481c37f30b5469ce30ada1eac1	["*"]	\N	2023-11-10 21:51:25	2023-11-10 21:51:25
461	App\\Models\\User	121	121more moretestdxbuae@gmail.com	7a44529351d97be85f9cbd61a74ee6221d26474187d2db2659cfe9dbaaeb56ed	["*"]	\N	2023-11-10 21:55:26	2023-11-10 21:55:26
462	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	b702871299bf5e132cec354916ca1c9e9c1ccf936112745c936ca38eca94cbaa	["*"]	\N	2023-11-10 21:58:20	2023-11-10 21:58:20
463	App\\Models\\User	121	121more moretestdxbuae@gmail.com	3a9cdd7b7826ea0b4d2fbf4027261db4da1757217c4e247ef0ea7b8e642722e3	["*"]	\N	2023-11-10 22:10:35	2023-11-10 22:10:35
464	App\\Models\\User	121	121more moretestdxbuae@gmail.com	b9cb7ae1129aadc9678fe5ef94ecdff43d0675ec312e66e0eb372e24e01942f5	["*"]	\N	2023-11-10 22:14:16	2023-11-10 22:14:16
465	App\\Models\\User	121	121more moretestdxbuae@gmail.com	8d899353cd1c32910c2b566bc9b7d2dc48a2ff27f28330687b347be7737d8b9b	["*"]	\N	2023-11-10 22:25:48	2023-11-10 22:25:48
466	App\\Models\\User	128	Personal Access Token	66346fc4395351ba73ab74be6ce8f9ae65dfbfa3917ae6ed55991a6ba4ecf5c2	["*"]	\N	2023-11-11 00:09:49	2023-11-11 00:09:49
467	App\\Models\\User	128	128testtestdriver8@gmail.com	21568abb54580d35d492d85e5020afe4ed78f7cf29eaa1370923412f4c208e3c	["*"]	\N	2023-11-11 00:09:49	2023-11-11 00:09:49
468	App\\Models\\User	129	Personal Access Token	c16f5c049b0c92f3f57534352cd66ed8ff29339cb162a22152780d64e1c8b723	["*"]	\N	2023-11-11 00:13:06	2023-11-11 00:13:06
469	App\\Models\\User	129	129testtestdriver9@gmail.com	e7afb2f1297f40f2a0922aa023daf0d527afe857bcd232e66596bc551cf8b71e	["*"]	\N	2023-11-11 00:13:06	2023-11-11 00:13:06
470	App\\Models\\User	130	Personal Access Token	d7c0172c04698058bf08bc1f407593c639c2afc3de559f3410f4be532bb53f87	["*"]	\N	2023-11-11 00:15:33	2023-11-11 00:15:33
471	App\\Models\\User	130	130testtestdriver10@gmail.com	77508f5747bf6ec6fbf73a09d185af0461529646339579cc9d7063c4265c04f5	["*"]	\N	2023-11-11 00:15:33	2023-11-11 00:15:33
472	App\\Models\\User	83	83Binsha1testdriver@gmail.com	2079576b4258f835b851151f4656e036c5932bae3737c806d2146e0ccb53dd9f	["*"]	\N	2023-11-11 00:17:53	2023-11-11 00:17:53
473	App\\Models\\User	132	Personal Access Token	8d78729d529489115e21c2375b3ada54e6cdae349f53683148c628e178ab84b1	["*"]	\N	2023-11-11 13:56:08	2023-11-11 13:56:08
474	App\\Models\\User	132	132karankj01@mailinator.com	dcaa2787cfcf4f83668a444d02750eeb1cbd92788ad6462d96093816efbe2438	["*"]	\N	2023-11-11 13:56:08	2023-11-11 13:56:08
475	App\\Models\\User	104	104Danish Nisardaani4900@gmail.com	876fce2cf0f88088c6beedcc7ee5a2ede2c3ee3c68a093379021033f69109b9a	["*"]	\N	2023-11-11 14:11:51	2023-11-11 14:11:51
476	App\\Models\\User	97	97Driver Onedriver1@yopmail.com	808bf782c28143256c3a71259bc042f61f48b5a06f64a1a455d638632882c65f	["*"]	\N	2023-11-11 14:13:52	2023-11-11 14:13:52
477	App\\Models\\User	133	Personal Access Token	0e76f663c0b837a58fd819fbd723f4aecff74f1c44d2c73b454d66b8d5f62605	["*"]	\N	2023-11-11 21:15:29	2023-11-11 21:15:29
478	App\\Models\\User	133	133karankaranjaiswl@gmail.com	f4994eb14dd3614d6834ee66108a20a88548e2288c146c3af096c775fd896dd9	["*"]	\N	2023-11-11 21:15:29	2023-11-11 21:15:29
479	App\\Models\\User	133	133karankaranjaiswl@gmail.com	cb395802c9ae19b37701252e6c128195603edd8ed024b8cfef905bd562ee89ce	["*"]	\N	2023-11-11 21:15:29	2023-11-11 21:15:29
480	App\\Models\\User	134	134DX Appappdx0911@gmail.com	8bb4bfe6c324b21b891175c4d758b6cd55a61565c3f388a8af9c2fe135b1c02e	["*"]	\N	2023-11-11 21:32:12	2023-11-11 21:32:12
481	App\\Models\\User	134	134DX Appappdx0911@gmail.com	42c17c91cf81c61fb79fddbc4f929fb16a8eb91f6ecdc50cae0c61480667a14d	["*"]	\N	2023-11-11 21:34:13	2023-11-11 21:34:13
482	App\\Models\\User	134	134DX Appappdx0911@gmail.com	926944915a359f3f0a45fb68c697ea22cf3d72a4d08356f6256ea2471bf159a9	["*"]	\N	2023-11-11 21:35:13	2023-11-11 21:35:13
483	App\\Models\\User	135	135Nemai Biswas II Software Testernemai@dxbusinessgroup.com	963de4c6c361642452d9cc13a643b6c53e62025d2d14becbda29293ae9144866	["*"]	\N	2023-11-11 21:50:48	2023-11-11 21:50:48
484	App\\Models\\User	135	135Nemai Biswas II Software Testernemai@dxbusinessgroup.com	9d824e6e700bb0cfa251065846338d0764ec510e118e99198bd156ae42ebd8f4	["*"]	\N	2023-11-11 21:56:21	2023-11-11 21:56:21
485	App\\Models\\User	121	121more moretestdxbuae@gmail.com	613fab6e4755832cc210d1ff03294660684c388cab021f2a80e7acf44c9444be	["*"]	\N	2023-11-11 23:03:01	2023-11-11 23:03:01
486	App\\Models\\User	136	Personal Access Token	f1a8d37fd4397ed376f49ba380d51d2033ffc5577190afe6db742a0e9a2ee97a	["*"]	\N	2023-11-12 15:23:08	2023-11-12 15:23:08
487	App\\Models\\User	136	136anilanilnavis@gmail.com	6f850c23ebe67ab52cf7c4bc0565b4fe45182aee14678ceca9c4850c56624bdb	["*"]	\N	2023-11-12 15:23:08	2023-11-12 15:23:08
488	App\\Models\\User	137	Personal Access Token	81bf0c5ca88c28d2a5459d03731a743dd31d8c1cde5fbfe66e4a55247eaff9e8	["*"]	\N	2023-11-12 15:27:04	2023-11-12 15:27:04
489	App\\Models\\User	137	137Dxb cargoanil@dxbusinessgroup.com	c393e4ee766d908e299cac3251c40ce0ec9259feb67f2bf2908b9f5a76666cde	["*"]	\N	2023-11-12 15:27:04	2023-11-12 15:27:04
490	App\\Models\\User	137	137Dxb cargoanil@dxbusinessgroup.com	19d9a1a38f12715e78588aa7c5bc75bfc272ff7c0be457f0d5c5358b47ca1554	["*"]	\N	2023-11-12 15:27:04	2023-11-12 15:27:04
491	App\\Models\\User	126	126rusvinkrusvik1213@gmail.com	74c23fb63765a8cb51056bb1daf0c420aef871912582231917220fc0fe177027	["*"]	\N	2023-11-13 08:49:41	2023-11-13 08:49:41
492	App\\Models\\User	122	122rusvinrusvinmerak@gmail.com	32ef2c55420fe82f77b5bda39cdbb09c86e095a77a1f2e3ec3d4b7998be19f78	["*"]	\N	2023-11-13 08:50:00	2023-11-13 08:50:00
493	App\\Models\\User	97	97Driver Onedriver1@yopmail.com	b78c9ea7f0a0194d74203373efbcd6d61933b007ebeb1df606cbe1eff0ad929d	["*"]	\N	2023-11-13 08:53:20	2023-11-13 08:53:20
494	App\\Models\\User	138	138test testtestingfordxb@gmail.com	3fd1ba272b3b55ad2fbf8cf79e61d1158ee5a1b3be64b341f9b605576d107ff9	["*"]	\N	2023-11-13 09:25:32	2023-11-13 09:25:32
495	App\\Models\\User	134	134DX Appappdx0911@gmail.com	39ebfb0bdc22610d91e772dcb8909f5effb0a560bbd7347ddbe2f0cec8fd748b	["*"]	\N	2023-11-13 09:30:11	2023-11-13 09:30:11
496	App\\Models\\User	122	122rusvinrusvinmerak@gmail.com	63268787de701939707554b42c7d975ebdae8fcaf74378305a308a65bfe442de	["*"]	\N	2023-11-13 09:33:58	2023-11-13 09:33:58
497	App\\Models\\User	121	121more moretestdxbuae@gmail.com	9807b6f579837457e87d0c8bc62ec7c272d408578630509150b0b89f2beea925	["*"]	\N	2023-11-13 09:34:40	2023-11-13 09:34:40
498	App\\Models\\User	121	121more moretestdxbuae@gmail.com	3935f9533f9fb1223d21962eaf02070675291505ef3abe445333b50b11c90070	["*"]	\N	2023-11-13 09:36:10	2023-11-13 09:36:10
499	App\\Models\\User	121	121more moretestdxbuae@gmail.com	a381ad921bb3f471662d7f561f06674907695be9faecc75b1fffc8b4e9afa850	["*"]	\N	2023-11-13 09:38:14	2023-11-13 09:38:14
500	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	77d724c54b4828c70f70a2fe60547477f574b0756cab133baca7aee00ae61888	["*"]	\N	2023-11-13 09:44:21	2023-11-13 09:44:21
501	App\\Models\\User	122	122rusvinrusvinmerak@gmail.com	34a4685176f3bce90b25b5fbf810a7442708463fba38ed8d3018097852080591	["*"]	\N	2023-11-13 09:44:34	2023-11-13 09:44:34
502	App\\Models\\User	139	Personal Access Token	c27d1db10fa14e0659fea48a178120a854ae623b7193e5677279fdfdfcac4e97	["*"]	\N	2023-11-13 09:48:33	2023-11-13 09:48:33
503	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	93c1fa266ba3c25269bbb539c9bc92e33ad555a842b5ab160088215cb6fa115a	["*"]	\N	2023-11-13 09:48:33	2023-11-13 09:48:33
504	App\\Models\\User	122	122rusvinrusvinmerak@gmail.com	e5161399c861b7a859cec3bc9f456509631693499e7b937c8d8dcdeeb0c31bd9	["*"]	\N	2023-11-13 09:49:07	2023-11-13 09:49:07
505	App\\Models\\User	121	121more moretestdxbuae@gmail.com	946523776dc710c1063b480cfdb7572ca099a030fc173fd06fdde1d5e9be4550	["*"]	\N	2023-11-13 09:50:20	2023-11-13 09:50:20
506	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	01b95c77602372b110a967e678fce2ccfa2e67bcf88243d6b4fbeb53d441ab02	["*"]	\N	2023-11-13 10:03:25	2023-11-13 10:03:25
507	App\\Models\\User	140	Personal Access Token	572aaf4b2a0fda69d7dce477a58e2fc1548c13f2f86d541b847b18b95b52f8bf	["*"]	\N	2023-11-13 10:07:04	2023-11-13 10:07:04
508	App\\Models\\User	140	140hunain sevenhunain77@gmail.com	f1eb668861c2d6b7d20a13cc29b800c6f6dfcd100e6d56ff237a37c869f8395b	["*"]	\N	2023-11-13 10:07:04	2023-11-13 10:07:04
509	App\\Models\\User	140	140hunain sevenhunain77@gmail.com	3ae8f398bee442b540076d4a099d5c2fd1353f6ed9bb3cfa45d7dbc2c18a2705	["*"]	\N	2023-11-13 10:07:04	2023-11-13 10:07:04
510	App\\Models\\User	122	122rusvinrusvinmerak@gmail.com	e7bc9a9997915c01b97b896a088392b62674646c9c7557a70852ef3c80ea70f7	["*"]	\N	2023-11-13 10:13:03	2023-11-13 10:13:03
511	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	6080bff8ed02cc0e1b3c2ccf65b77b1f763ffe04a509572273cb8f494b7945a5	["*"]	\N	2023-11-13 10:40:05	2023-11-13 10:40:05
512	App\\Models\\User	122	122rusvinrusvinmerak@gmail.com	19a4b1923d71980e56e84aff820f9c3fda0352cb98559588da34795e5068894d	["*"]	\N	2023-11-13 10:43:12	2023-11-13 10:43:12
513	App\\Models\\User	140	140hunain sevenhunain77@gmail.com	04c4e88f38360514d6de8e12806800da0ef69293b18404b1b026a44a2ff447ad	["*"]	\N	2023-11-13 10:59:57	2023-11-13 10:59:57
514	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	db446f863877ce45f4bb3b2d6d5040887e2f9154aa8379b4b61d2c54e461daf9	["*"]	\N	2023-11-13 11:17:30	2023-11-13 11:17:30
515	App\\Models\\User	140	140hunain sevenhunain77@gmail.com	4c2bfd325919cd0a6581ce6c19fb04993a57141c2b286c28c849a6e1bdad29ec	["*"]	\N	2023-11-13 11:33:06	2023-11-13 11:33:06
516	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	48e1a626c2f3870b23458ff37662b9553215410a3b9c56a6d008e8edfb63d008	["*"]	\N	2023-11-13 11:35:22	2023-11-13 11:35:22
517	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	08cde6a45528a865ba093b8bc0e12d9d6ca11f6c5e5a1d2140e32f9481ff57f0	["*"]	\N	2023-11-13 14:17:50	2023-11-13 14:17:50
518	App\\Models\\User	140	140hunain sevenhunain77@gmail.com	574bbdc37226ffe60d32667c4c62719a7480a511955fb6c6b6f185ec6d066e98	["*"]	\N	2023-11-13 15:26:56	2023-11-13 15:26:56
519	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	67b7a62dae794bc2ba66b1fc31c02f02effb2e221f45666a565c274474490e6d	["*"]	\N	2023-11-13 15:38:56	2023-11-13 15:38:56
520	App\\Models\\User	140	140hunain sevenhunain77@gmail.com	0733fcfe1cc60d3f28356d9ed59bc4f2761800ad260440bf56d343f8e328dd1a	["*"]	\N	2023-11-13 15:48:03	2023-11-13 15:48:03
521	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	39681058021660744e69becf21e9defdd02da16601c6f01a3f1d25eb91bccf6b	["*"]	\N	2023-11-13 15:50:10	2023-11-13 15:50:10
522	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	c61614dc4e9210de4edeb1665a30f35d39e1dc764293039f7ed2956fed32a25e	["*"]	\N	2023-11-13 15:50:50	2023-11-13 15:50:50
523	App\\Models\\User	122	122rusvinrusvinmerak@gmail.com	0553c3f8ede8873864e262675a505cae894402bf33dc950daf9fbc94eb3e1c8f	["*"]	\N	2023-11-13 16:03:48	2023-11-13 16:03:48
524	App\\Models\\User	83	83Binsha1testdriver@gmail.com	5d1671d4c2ecf4d61fed96dc47a6a30edcbd32e6c539f7e2e8c8b63074014cec	["*"]	\N	2023-11-13 16:13:05	2023-11-13 16:13:05
525	App\\Models\\User	141	Personal Access Token	20f855d3c08f93d83c56a691ee63c0d49caba3fe004143cee730413f5bda7314	["*"]	\N	2023-11-13 17:01:20	2023-11-13 17:01:20
526	App\\Models\\User	141	141Karankaranjaiswa@gmail.com	103a626a0cb672f3dba423ff95f99a1c70f879e5b04df5b21097b681a977b913	["*"]	\N	2023-11-13 17:01:20	2023-11-13 17:01:20
527	App\\Models\\User	141	141Karankaranjaiswa@gmail.com	d9f57cf7ae8e58a862b951fdc1ef532b945ba09f2e8846e67ff24871b41937c9	["*"]	\N	2023-11-13 17:01:20	2023-11-13 17:01:20
528	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	6443fd94dcfa514c5801a8721c8a6cfde63c6324f014965b7a375bd9f471835b	["*"]	\N	2023-11-13 17:32:53	2023-11-13 17:32:53
529	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	be49f4dbcc6ab535afe9c9130ccc390dc490c5d055d4c3fc36a7cab879623332	["*"]	\N	2023-11-13 18:04:40	2023-11-13 18:04:40
530	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	8901e98a019037bb018d6ab3c50aad2fbcaf4c6fda825ea33053e96aa84b8296	["*"]	\N	2023-11-13 18:05:03	2023-11-13 18:05:03
531	App\\Models\\User	142	Personal Access Token	32a01be0dcc10d423f8a5fe0010c1a5b8d1c10bb87bca2d4ee5bd87761faa8a0	["*"]	\N	2023-11-13 18:30:14	2023-11-13 18:30:14
532	App\\Models\\User	142	142testkaranjais6@gmail.com	3182b0d429c349466812d29ac5cfa5e25d2c2d105b201568b5eb4dd7a96fefbf	["*"]	\N	2023-11-13 18:30:14	2023-11-13 18:30:14
533	App\\Models\\User	142	142testkaranjais6@gmail.com	33ba74afef99f46963895d28e18ea601ccb542ffdf072aea0eb0e75cfbc939ab	["*"]	\N	2023-11-13 18:30:14	2023-11-13 18:30:14
534	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	92582b62ccc18ac05925b611f69d8e17dbc62ab2d63baaeb68e79d9fdc67aeaa	["*"]	\N	2023-11-13 19:34:46	2023-11-13 19:34:46
535	App\\Models\\User	140	140hunain sevenhunain77@gmail.com	de5c1b552783545c713ebb5374b01c7c44374bdc7c98130c005fda0701909785	["*"]	\N	2023-11-13 20:36:00	2023-11-13 20:36:00
536	App\\Models\\User	143	Personal Access Token	29d2afe1490d77d3109e7bc4e28480671f841202d18d441d5b5984d6924f05b7	["*"]	\N	2023-11-13 21:12:03	2023-11-13 21:12:03
537	App\\Models\\User	143	143test sixhunain66@gmail.com	4f43bbb51ce4bd8247b3b8cc5135aa67728886d2c89882b6a58aac602f020c1e	["*"]	\N	2023-11-13 21:12:04	2023-11-13 21:12:04
538	App\\Models\\User	143	143test sixhunain66@gmail.com	53e451c00240fcf47632a0b4ac0e5937c25ab48fb8d4ecb00865455dd22ffdb6	["*"]	\N	2023-11-13 21:12:04	2023-11-13 21:12:04
539	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	7c16e5fb39dacb3d7fcfd942890124c88e0cca4d76d57f9e46dca5ff6d0aea48	["*"]	\N	2023-11-13 21:37:55	2023-11-13 21:37:55
540	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	76c37e24116975077020c1622373ad991620d4e8a7b7cbbf0e2fb1342cd90344	["*"]	\N	2023-11-13 21:49:34	2023-11-13 21:49:34
541	App\\Models\\User	143	143test sixhunain66@gmail.com	a13cc23ee76a27c47e6668e46ca2b21c4e388dcbaec2d5fbbbe60427ea3be8a8	["*"]	\N	2023-11-13 23:56:41	2023-11-13 23:56:41
542	App\\Models\\User	144	Personal Access Token	c3e88e15d1a5e3543e4f9688f09daeb3fe61ca0c89c64ce5ec538a4a54269fde	["*"]	\N	2023-11-14 00:48:58	2023-11-14 00:48:58
543	App\\Models\\User	144	144testtestdriver20@gmail.com	9a785612314faf344359d10e243837ec3c8bc9146b9c1d618aa1bd5d7195d1a4	["*"]	\N	2023-11-14 00:48:58	2023-11-14 00:48:58
544	App\\Models\\User	130	130testtestdriver10@gmail.com	1c4d57d35fbd5ff72e85f6ec79ddf5ff9e2846dd6b7f1b4383326883d0815a39	["*"]	\N	2023-11-14 00:52:58	2023-11-14 00:52:58
545	App\\Models\\User	129	129testtestdriver9@gmail.com	94fedd7236fe06a1563392c28518a64a2d1ea9b3775328f421b451c6af768568	["*"]	\N	2023-11-14 01:30:27	2023-11-14 01:30:27
546	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	b88478a5c440b35a47b084f29596eeefa2894a89a521a36d20b4a131417a56cb	["*"]	\N	2023-11-14 09:34:12	2023-11-14 09:34:12
547	App\\Models\\User	83	83Binsha1testdriver@gmail.com	fd8f0c836b91e308c0d9c08d3d1e9ab80e99827d35ce260ff037accff8930043	["*"]	\N	2023-11-14 09:42:01	2023-11-14 09:42:01
548	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	7c7b3b15f9562cb978b8fcdc242eff58b3b746b0e73444ddb3a34e0bb9a73f9c	["*"]	\N	2023-11-14 09:51:08	2023-11-14 09:51:08
549	App\\Models\\User	89	89test threetestdriver3@gmail.com	337c190fa170ed48a8ea286811bef6d42e97a910fb9b4a206a36a398ed077529	["*"]	\N	2023-11-14 12:27:32	2023-11-14 12:27:32
550	App\\Models\\User	98	98Driver Twodriver2@yopmail.com	d4b2294db22d302fd966b0cda00c5174928845c019e5b90e9adf844a32e4f3d9	["*"]	\N	2023-11-14 12:29:33	2023-11-14 12:29:33
551	App\\Models\\User	111	111Mathewmathew@yopmail.com	f719b53f5e39f23c85d4389547fac2912083e135abd6cca49f558e2e9362e1b5	["*"]	\N	2023-11-14 12:38:36	2023-11-14 12:38:36
552	App\\Models\\User	142	142testkaranjais6@gmail.com	bd9dc188fadc9520a1e5c542289925216dd93fea744b26d5bd65315194f5d1b8	["*"]	\N	2023-11-14 12:44:32	2023-11-14 12:44:32
553	App\\Models\\User	145	Personal Access Token	2f6f5ca043e966696df1f32d38bd6a20e1d338b17c7b75c2c85eea8533aa1e37	["*"]	\N	2023-11-14 12:55:16	2023-11-14 12:55:16
554	App\\Models\\User	145	145NB Comnbu1@mailinator.com	754f6f1aec5b0b7dabc5b311d9042f185b8facc1571849cfe78c613cbbc6ab31	["*"]	\N	2023-11-14 12:55:16	2023-11-14 12:55:16
555	App\\Models\\User	145	145NB Comnbu1@mailinator.com	6096432b2f76df02337fcd242612f1389c4a8641a8a66c7eb2bf00f7fa8bf8db	["*"]	\N	2023-11-14 12:55:16	2023-11-14 12:55:16
556	App\\Models\\User	146	Personal Access Token	c1e117d490a3486361b7194b2a033f8b00c474b1442e5bc09da91ec46a5032c0	["*"]	\N	2023-11-14 13:07:47	2023-11-14 13:07:47
557	App\\Models\\User	146	146Testtkaranjai@gmail.com	c3a8b237cedcc9484f8a5083795dd97098bcb759260a9dbec8ec752a54738c7f	["*"]	\N	2023-11-14 13:07:47	2023-11-14 13:07:47
558	App\\Models\\User	146	146Testtkaranjai@gmail.com	41d45d1fb2d79832e9e0a5745377e74413a4acff595666a55686424be2da9210	["*"]	\N	2023-11-14 13:07:47	2023-11-14 13:07:47
559	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	7a2e000e8cd23f1afcce41d21d7262aaf4f8237d4b07851ab5f2f17105175c4e	["*"]	\N	2023-11-14 13:39:50	2023-11-14 13:39:50
560	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	5dda22b641609f7c89c2f83bad83eac308f4c8cc040ba81607f0fd46f2c36f70	["*"]	\N	2023-11-14 15:40:29	2023-11-14 15:40:29
561	App\\Models\\User	111	111Mathewmathew@yopmail.com	9fc0524a90237afaa7eca4b03b5a44377f28952dadb612a2582b2924bb11bc43	["*"]	\N	2023-11-14 17:11:07	2023-11-14 17:11:07
562	App\\Models\\User	134	134DX Appappdx0911@gmail.com	f68cc34ab739eae0c82b56ea0722df17ac58b417beb9c707f6c0ae449b0cb38e	["*"]	\N	2023-11-14 17:38:32	2023-11-14 17:38:32
563	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	c10583109be61e878f6707ada9d8b21c5d561786915bc72bdfe5d82533dea331	["*"]	\N	2023-11-14 19:17:00	2023-11-14 19:17:00
564	App\\Models\\User	142	142testkaranjais6@gmail.com	bf1eadaf9b03a068e909b644d96da3072b2a7c8b3fce7c73695b9cd9fe004e80	["*"]	\N	2023-11-14 19:21:33	2023-11-14 19:21:33
565	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	a6cd8f18c4a0c508a3a76f0e111bbcefd6569e7f0fdcf270bbb2960b612b4666	["*"]	\N	2023-11-14 19:23:36	2023-11-14 19:23:36
566	App\\Models\\User	142	142testkaranjais6@gmail.com	e86f3d636cc3c4e0049fee6d207451e4a29bfac128f8a4e392664229a93d92d5	["*"]	\N	2023-11-14 19:58:53	2023-11-14 19:58:53
567	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	709f5bd427558ec1337d4f98926cb91151516e6b95aaf56fbacd845f315e90bc	["*"]	\N	2023-11-14 20:33:20	2023-11-14 20:33:20
568	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	90f97e95aa0f6ac5da6681b3a1f30c53e2a4ac2cabf5d73a0397422f3fd75586	["*"]	\N	2023-11-14 21:03:01	2023-11-14 21:03:01
569	App\\Models\\User	129	129testtestdriver9@gmail.com	3c2f2cccc072e25a839861868f0870bbb23cf0b51f05af9be982677117ffd7de	["*"]	\N	2023-11-14 21:41:52	2023-11-14 21:41:52
570	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	c76287bce0b62f7190c8c6db0277f2a23c61ec825e0c329e21c39d55bb933d07	["*"]	\N	2023-11-14 21:45:46	2023-11-14 21:45:46
571	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	dea6b2c4713d7772d8a7c7039b3d601c4fa980d3d8a70068961e2b6b94fa59b7	["*"]	\N	2023-11-14 22:00:23	2023-11-14 22:00:23
572	App\\Models\\User	83	83Binsha1testdriver@gmail.com	1fccc535778effc61e7b4a4acdc15f88608628ae421ffa176239434e943243b3	["*"]	\N	2023-11-14 22:01:55	2023-11-14 22:01:55
573	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	bd17649832197ba09db3fb68494900e6fd909f1ebe8af4b1c3abe326d0893fe2	["*"]	\N	2023-11-14 23:13:39	2023-11-14 23:13:39
574	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	811d202f0ec28930c974bff34b8470790bd5dce6a0868cba95a149a9701fbd9e	["*"]	\N	2023-11-15 11:25:41	2023-11-15 11:25:41
575	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	fb1bca23f7fd499618c39fb4c0ecdf7f0c6728b5b46ec7f25253ade60db30c0f	["*"]	\N	2023-11-15 13:14:39	2023-11-15 13:14:39
576	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	eb5a0ce605a17e9285a26238554a056e988084a91cdbed54a4205e42b5ea15c7	["*"]	\N	2023-11-15 13:17:33	2023-11-15 13:17:33
577	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	95074d1d0532cbe2b9fdab5976f15cc1f44793eb1c06c8ef2e80ac6567960f7e	["*"]	\N	2023-11-15 13:17:49	2023-11-15 13:17:49
578	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	3747ec9f4410b32cfc5c42f0154dfd5f048ad7cb33a13e0436e4bd7768204e3b	["*"]	\N	2023-11-15 13:19:12	2023-11-15 13:19:12
579	App\\Models\\User	83	83Binsha1testdriver@gmail.com	f7ceb9b2fecc75480c3b9c33c00fb925a61b36f9197dd2a52f39ac19ce49fb64	["*"]	\N	2023-11-15 13:36:40	2023-11-15 13:36:40
580	App\\Models\\User	83	83Binsha1testdriver@gmail.com	887f7b2c3aa87f8db5c890ff0cf0ab0985f179e4435a30c569e025cb714d384f	["*"]	\N	2023-11-15 14:03:09	2023-11-15 14:03:09
581	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	3001f65f84e65f3f08a57234919f7373afdced3f6d5777c260206932ceab81c9	["*"]	\N	2023-11-15 15:31:31	2023-11-15 15:31:31
582	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	b331cae6209d3a1334c61ab572568c03159258ed98faf79d5924e840d83acb99	["*"]	\N	2023-11-15 15:47:53	2023-11-15 15:47:53
583	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	5b9083555b77f68373f193a6e05d4e1bd6532207bc694dff4492b9e5106fe815	["*"]	\N	2023-11-15 16:08:06	2023-11-15 16:08:06
584	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	942ba6c6b5893792b9db7700ab0495350ebfec38b5033845ebf97420a754f402	["*"]	\N	2023-11-15 16:09:56	2023-11-15 16:09:56
585	App\\Models\\User	89	89test threetestdriver3@gmail.com	aeb17af9b3f5b17f9411c13fec7e6d872bd478f75b36b060c6262ebf2bdca93e	["*"]	\N	2023-11-15 17:01:20	2023-11-15 17:01:20
586	App\\Models\\User	134	134DX Appappdx0911@gmail.com	e71056bb0a38969fff17d5466ffdee57f6d71e43c1381b67321997a68577eb72	["*"]	\N	2023-11-15 17:03:51	2023-11-15 17:03:51
587	App\\Models\\User	89	89test threetestdriver3@gmail.com	e6dc0293f8077f5df988d04df74f40d3527cb9832147b00509bfd96e7772b342	["*"]	\N	2023-11-15 17:09:10	2023-11-15 17:09:10
588	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	b4e0ba75eecf0118aad5595aca3ab7af28de743de7976612c0f8ac876f52012c	["*"]	\N	2023-11-15 17:54:52	2023-11-15 17:54:52
589	App\\Models\\User	145	145NB Comnbu1@mailinator.com	ce3bbd842c3b891d162cdb8be56f77926909008a20c680d7397010ee6a58a422	["*"]	\N	2023-11-15 18:45:35	2023-11-15 18:45:35
590	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	05eb5b7a49d49b5e8ac61b9788514970e7415f32198630a5cc981e19602e21bd	["*"]	\N	2023-11-15 18:46:32	2023-11-15 18:46:32
591	App\\Models\\User	145	145NB Comnbu1@mailinator.com	9bc570abccdcaa08a242af9792e969a999e6ba5b5a0610b61f4cc7fdbe5b83cd	["*"]	\N	2023-11-15 18:46:55	2023-11-15 18:46:55
592	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	956b64dd17c80eb5c51a890b607a1efd8f4761327373bcd5cc6e958c4fe8f984	["*"]	\N	2023-11-15 19:08:52	2023-11-15 19:08:52
593	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	38e7f413cef408b46d0d31cdbc08cf0aee1c8d9115356b9d9b3489d2ce449923	["*"]	\N	2023-11-15 19:09:08	2023-11-15 19:09:08
594	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	cca0d3a3b08f5310c4d733899676f0698b6828f69ccd315f1f118cf8f4fe5737	["*"]	\N	2023-11-15 19:10:38	2023-11-15 19:10:38
595	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	1875e0eaba7b9cf2ccf12e5f6df77d7000f61ce9ce9a8a9b8d6a77a0b5d24226	["*"]	\N	2023-11-15 19:31:30	2023-11-15 19:31:30
596	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	a0a85864e86492829a665c7d1138b3bad8a8c81a021353654a49db06661ad8da	["*"]	\N	2023-11-15 19:34:18	2023-11-15 19:34:18
597	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	6e779ad34be4f10a188a04d6f36a1d0a57f4010449f493c1969b2ab4f2c92638	["*"]	\N	2023-11-15 19:34:27	2023-11-15 19:34:27
598	App\\Models\\User	83	83Binsha1testdriver@gmail.com	3de76718c7ad5309f472cbe285e1f41d6c52eff7c15d436c9302fbaf2cbaffee	["*"]	\N	2023-11-15 19:34:46	2023-11-15 19:34:46
599	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	685a2d73fcd7080cca1c76605691773c4daf31ff9436a24f8cfbd8d2163e8e6e	["*"]	\N	2023-11-15 19:39:26	2023-11-15 19:39:26
600	App\\Models\\User	137	137Dxb cargoanil@dxbusinessgroup.com	a78aa4a0a4645b8e746d43407dac2daa7b152e784331a69b8c63be0865e6a688	["*"]	\N	2023-11-16 08:00:45	2023-11-16 08:00:45
601	App\\Models\\User	83	83Binsha1testdriver@gmail.com	4861da259b12218cef8627669575dadb934cfe0c1bc16c917e4ef7b4ef7686b6	["*"]	\N	2023-11-16 09:15:38	2023-11-16 09:15:38
602	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	417f13557280b8f0a7edd158750aa44e09ae4588956a620cc1c4995c343b334a	["*"]	\N	2023-11-16 09:16:43	2023-11-16 09:16:43
603	App\\Models\\User	156	Personal Access Token	bcd4f3fdce323d6b228c394c838ff55514161c4d257efb57d3690915381e4965	["*"]	\N	2023-11-16 10:00:25	2023-11-16 10:00:25
604	App\\Models\\User	156	156Hello Testkaranj@gmail.com	20a78f3eb873ac6fefac01fb2f4c3f4b47b2613df18c38e1bed63ac4587b6ba1	["*"]	\N	2023-11-16 10:00:26	2023-11-16 10:00:26
605	App\\Models\\User	156	156Hello Testkaranj@gmail.com	eb128d3e25109fe7fa177c3f9b8472c664640e1901c60cb7cdc118161140cb9a	["*"]	\N	2023-11-16 10:00:26	2023-11-16 10:00:26
606	App\\Models\\User	157	Personal Access Token	629b57613e885109702fd5e0f8102749d3f9416203ccd2a2dd0c69c55be8a294	["*"]	\N	2023-11-16 10:03:05	2023-11-16 10:03:05
607	App\\Models\\User	157	157Hellokaran@gmail.com	345741214f4a0c8920274d048fb4e12ab116301f683723bd23988c3a89596e06	["*"]	\N	2023-11-16 10:03:06	2023-11-16 10:03:06
608	App\\Models\\User	157	157Hellokaran@gmail.com	e26da8fb6692b61a84d5ab6059c27a96814eda8a7f4a9ad757bcf364d01805d1	["*"]	\N	2023-11-16 10:03:06	2023-11-16 10:03:06
609	App\\Models\\User	158	Personal Access Token	e5735263c2d13ff0dff51b20e8e3ca87d2a21b472c8e121929e03285ef9fc5a6	["*"]	\N	2023-11-16 10:14:59	2023-11-16 10:14:59
610	App\\Models\\User	158	158HelloKaranKaranja@gmail.com	86d28a4152496c1f386f4e413524dd5e0fd8965166e7023b292bc25a2a6dbb31	["*"]	\N	2023-11-16 10:15:00	2023-11-16 10:15:00
611	App\\Models\\User	158	158HelloKaranKaranja@gmail.com	0bf925633310f0cb4a8b824820769ccd110ac6e521398507f8b3783336e1bfe9	["*"]	\N	2023-11-16 10:15:00	2023-11-16 10:15:00
612	App\\Models\\User	159	Personal Access Token	fa8eb9ec0d2937f0e051984a0e62bc3d9b3a5ec1a63f772ab540b586dae586e9	["*"]	\N	2023-11-16 10:28:31	2023-11-16 10:28:31
613	App\\Models\\User	159	159NB Drivernbd2@mailinator.com	144af26caf7eb657bdab7bab44d0c7998201e7c6a0786ee4e01779af22485b19	["*"]	\N	2023-11-16 10:28:31	2023-11-16 10:28:31
614	App\\Models\\User	157	157Hellokaran@gmail.com	b2cabdef23420099411f4427e1e6ef4975e010b03bae361e5d4418c30bc45dba	["*"]	\N	2023-11-16 10:30:19	2023-11-16 10:30:19
615	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	4cb923bc3efec3065b8bb2f334c99e5357692efa8edcc7b4cd8d688e012a0cf0	["*"]	\N	2023-11-16 10:33:59	2023-11-16 10:33:59
616	App\\Models\\User	145	145NB Comnbu1@mailinator.com	0c8552dd49c89f85933280c3a0359eaf65b2e26365a18e63b6d1aee50ce4dfbd	["*"]	\N	2023-11-16 10:34:44	2023-11-16 10:34:44
617	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	16fd1c79e4fce3a823286d5fafde2a1b9bf4848dd62e5224c1561d9254c0aa62	["*"]	\N	2023-11-16 10:46:15	2023-11-16 10:46:15
618	App\\Models\\User	145	145NB Comnbu1@mailinator.com	e67685c7b75ec5df697f545df74bbf49454b4756e6710e00127767b3fb31f04e	["*"]	\N	2023-11-16 10:49:38	2023-11-16 10:49:38
619	App\\Models\\User	83	83Binsha1testdriver@gmail.com	87b668651b454da0df9e13b8736f13ba23de43ba45ff362f5db58b17ed51debd	["*"]	\N	2023-11-16 10:52:43	2023-11-16 10:52:43
620	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	3c10784cfc89ea8edbe2f42ab0767e5981dd056d9ea82c186dc6c33cb1b2f7d2	["*"]	\N	2023-11-16 11:07:50	2023-11-16 11:07:50
621	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	54afaa8e2d11370d77a37d7d3565767f78ba57f05fb631312e3dcbcae551cb84	["*"]	\N	2023-11-16 11:24:45	2023-11-16 11:24:45
622	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	e1ada95d48ce6d6d218e3f00188ebdcc20175f202f3afba0cab7a23221dd6beb	["*"]	\N	2023-11-16 11:25:59	2023-11-16 11:25:59
623	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	4782eb474d2e9b3cd54ea84a21c5cbc561c96cf8c427daeea47b903c7586e45c	["*"]	\N	2023-11-16 11:26:22	2023-11-16 11:26:22
624	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	57a19eb7c1736bca44b76c657f3a4fda31dd7b27a4295ae310c55e735e83f9a5	["*"]	\N	2023-11-16 11:28:44	2023-11-16 11:28:44
625	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	09ba3751e4ae7307014a7a5bd9d011140ad6abc4495186ee9bb4695668626cc5	["*"]	\N	2023-11-16 11:33:01	2023-11-16 11:33:01
626	App\\Models\\User	99	99B testbdriver@driver.com	8bde484b7ba1d9f9431c81402dc00da8f3a37870156789abf950fa6f1d24e284	["*"]	\N	2023-11-16 16:17:03	2023-11-16 16:17:03
627	App\\Models\\User	157	157Hellokaran@gmail.com	3670652f860e7ae4daff689fccbe3f9615228140799ba69fec365a52982e12e8	["*"]	\N	2023-11-16 16:37:14	2023-11-16 16:37:14
628	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	176abd44d187299279b5bb50b79934b29374c6b2d585d9a4846d0fb157aeda4e	["*"]	\N	2023-11-16 16:40:17	2023-11-16 16:40:17
629	App\\Models\\User	122	122rusvinrusvinmerak@gmail.com	4f3e28ebc7f38de091188ee11bf32aff10db8e4aaab47d9260464b1531f21e77	["*"]	\N	2023-11-16 16:49:25	2023-11-16 16:49:25
630	App\\Models\\User	160	Personal Access Token	16baa8fcefa4463b346157f0c916855c24581675bc86391a5776a52b744fa963	["*"]	\N	2023-11-16 17:06:43	2023-11-16 17:06:43
631	App\\Models\\User	160	160na trucknavisanil@gmail.com	0ac0c18b2ecd5d396ca4b9bf1384324097ed11af7b944bc19d0c926eed46fce8	["*"]	\N	2023-11-16 17:06:43	2023-11-16 17:06:43
632	App\\Models\\User	99	99B testbdriver@driver.com	c5867ec071543cd53f854cd98260d5213fd08a8fe6e73c5f05ac2f66aab7cc92	["*"]	\N	2023-11-16 17:33:09	2023-11-16 17:33:09
633	App\\Models\\User	122	122rusvinrusvinmerak@gmail.com	1310bf65894efb8ed27c33b3a764e5742476626b78721d4d9efc352dea90fd55	["*"]	\N	2023-11-16 17:39:29	2023-11-16 17:39:29
634	App\\Models\\User	122	122rusvinrusvinmerak@gmail.com	2e646d6839dcfa0b3a7108fe4f364ca33946d6c79e96362f2cb0326fdec8aca8	["*"]	\N	2023-11-16 18:03:43	2023-11-16 18:03:43
635	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	273b364906fdb1d9f2c1e91d3779810c5185768c5760d3dc234b245b59a910ca	["*"]	\N	2023-11-16 19:49:45	2023-11-16 19:49:45
636	App\\Models\\User	161	Personal Access Token	a1aa4ac0f4bad971b62acef85878c90fab13a654d01782d2865d9daa369cd302	["*"]	\N	2023-11-16 21:55:11	2023-11-16 21:55:11
637	App\\Models\\User	161	161testtest20@gmail.com	6715a7e1ac9986dd7d276f338ac28e1a15cdc7a39dac09d1c2346067eac227f1	["*"]	\N	2023-11-16 21:55:11	2023-11-16 21:55:11
638	App\\Models\\User	83	83Binsha1testdriver@gmail.com	3fb9b3dcde01b17b58eca11cb14fd119f58fee1f2e9902e7ca7bc9bbeab729a0	["*"]	\N	2023-11-16 21:59:53	2023-11-16 21:59:53
639	App\\Models\\User	83	83Binsha1testdriver@gmail.com	95be21c41f101629678c3c964427c353728237788e9bcddaac9d602c2d0be8ee	["*"]	\N	2023-11-16 23:29:36	2023-11-16 23:29:36
640	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	ef22a85daed8c9acc5b5a3645c8838aaf92111fac1a667a45d829d48417812a7	["*"]	\N	2023-11-16 23:31:46	2023-11-16 23:31:46
641	App\\Models\\User	83	83Binsha1testdriver@gmail.com	f4c8f405253ea0efe9cf5a59b5ca81cd9c29e4c377a72e30d777dca4f309baaf	["*"]	\N	2023-11-16 23:46:24	2023-11-16 23:46:24
642	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	63a7d68d1d6cf8df3dce544fb04fdb85273bb2e9cae2ee466fc5acb21a5a741a	["*"]	\N	2023-11-16 23:46:42	2023-11-16 23:46:42
643	App\\Models\\User	99	99B testbdriver@driver.com	b8e379cb260993ba6079492210329a5b3f6133d438bc7f6cef8031cd235f64b3	["*"]	\N	2023-11-17 07:44:25	2023-11-17 07:44:25
644	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	39b76df04ad6b9d9add0ec38c8f9de7da8bce7811ac3a5b67928d0ff4d48c015	["*"]	\N	2023-11-17 09:50:11	2023-11-17 09:50:11
645	App\\Models\\User	83	83Binsha1testdriver@gmail.com	e5eec6bd8c1c1fa8d7b3741ce0fba4276312e4fc0d94f111262605877e46a949	["*"]	\N	2023-11-17 10:04:02	2023-11-17 10:04:02
646	App\\Models\\User	122	122rusvinrusvinmerak@gmail.com	2307b9c1f6f2fbef6c0976d378548dec5f52af827956cac99f5e046a55649372	["*"]	\N	2023-11-17 10:21:53	2023-11-17 10:21:53
647	App\\Models\\User	99	99Binshabdriver@driver.com	39566635d082d62a680058a5d342a8aca83f796c70b1c263f2636f6a71b7cb02	["*"]	\N	2023-11-17 10:27:00	2023-11-17 10:27:00
648	App\\Models\\User	83	83Binsha1testdriver@gmail.com	f2006b3e33a8311211c82d121cde1679188dc85cdd47b2942f9265dc0c5e8b36	["*"]	\N	2023-11-17 10:29:12	2023-11-17 10:29:12
649	App\\Models\\User	99	99Binshabdriver@driver.com	9b1ea8cd4dedbb5ae511279e23d517f9bb90f060cad385eaa2729c7a56c06d62	["*"]	\N	2023-11-17 10:31:21	2023-11-17 10:31:21
650	App\\Models\\User	134	134DX Appappdx0911@gmail.com	04e4c5d0a64fb00c62189d0ff399563a50f09c3b037a8ebd74727b25863dce36	["*"]	\N	2023-11-17 10:32:09	2023-11-17 10:32:09
651	App\\Models\\User	99	99Binshabdriver@driver.com	98bd9bbebe92ea8a92936b0909b6bbcee8f701565576071b21808d0b58192b01	["*"]	\N	2023-11-17 10:34:46	2023-11-17 10:34:46
652	App\\Models\\User	162	Personal Access Token	22833d2aea8a13f04c8ee7e05c98ba97abfee20b00df23d3e2d78ecb8df04f52	["*"]	\N	2023-11-17 10:34:51	2023-11-17 10:34:51
653	App\\Models\\User	162	162testtestdriver21@gmail.com	385882fe8f4a4d9c4d3b1e64c98df276012accccefb0e72fe7abb6f305a74919	["*"]	\N	2023-11-17 10:34:51	2023-11-17 10:34:51
654	App\\Models\\User	134	134DX Appappdx0911@gmail.com	600122393964768d640b4ca6e557ab4cc95626308856c88f291abb3e0cf258d6	["*"]	\N	2023-11-17 10:36:11	2023-11-17 10:36:11
655	App\\Models\\User	122	122rusvinrusvinmerak@gmail.com	ba2ef284e7a70a4898e496ed07ca267fdad493f860ca57f677fe134a68dbd60d	["*"]	\N	2023-11-17 10:37:41	2023-11-17 10:37:41
656	App\\Models\\User	99	99Binshabdriver@driver.com	0c21bbb3be0d96b970138825abe3634d024f311dfd97374897dce693ca2380e8	["*"]	\N	2023-11-17 12:22:26	2023-11-17 12:22:26
657	App\\Models\\User	122	122rusvinrusvinmerak@gmail.com	d21b0c830085a4801e2a4fa3c68beefc0aa0bb01385dd079b52ec7265cc5ac32	["*"]	\N	2023-11-17 12:40:55	2023-11-17 12:40:55
658	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	6efedb0f44ee739b2f625e3cff82983e738df8a6c5d10b23d436e2cadbf42f39	["*"]	\N	2023-11-17 12:44:24	2023-11-17 12:44:24
659	App\\Models\\User	99	99Binshabdriver@driver.com	0946e44ca0b249f7ada202643dad50740c45686283c4f6cad602e438a087a3bd	["*"]	\N	2023-11-17 12:55:57	2023-11-17 12:55:57
660	App\\Models\\User	162	162testtestdriver21@gmail.com	67e71f10b955728e7268bc73541f88e1677735eff57a33ef8cfa8066f836b930	["*"]	\N	2023-11-17 12:56:26	2023-11-17 12:56:26
661	App\\Models\\User	163	Personal Access Token	d1f050eea1a35bfffcf003e2edd8bf9e1c6eb77316d4fd4dfb18441d4f7bbf76	["*"]	\N	2023-11-17 13:10:35	2023-11-17 13:10:35
662	App\\Models\\User	163	163testtestdriver23@gmail.com	703d64a74bda91bcfcee968a413a06d1276b5f551484c205f9e72ed2bb76821f	["*"]	\N	2023-11-17 13:10:35	2023-11-17 13:10:35
663	App\\Models\\User	122	122rusvinrusvinmerak@gmail.com	9c591f1c99700069c2a544dd01127bf326f4196d659ad8e88c149be8e86c002b	["*"]	\N	2023-11-17 13:18:36	2023-11-17 13:18:36
664	App\\Models\\User	164	164karan Jaiswalkaranjaiswal2796@gmail.com	b93818cf797df90e1b3bd07caa3f4a2b62884b881cd29f905a8f0f59e6bf2262	["*"]	\N	2023-11-17 13:25:33	2023-11-17 13:25:33
665	App\\Models\\User	165	Personal Access Token	4333df3dededb82cb0bb107a7d2c953c9e8cd72cb9c3c0391cc91d65c2eb3c9f	["*"]	\N	2023-11-17 13:33:02	2023-11-17 13:33:02
666	App\\Models\\User	165	165Test Postpost@driver.com	40fd552e02e0e11666e97fd8dc7e3ad3acebb26d6861aa13300a9934c1003d7d	["*"]	\N	2023-11-17 13:33:02	2023-11-17 13:33:02
667	App\\Models\\User	137	137Dxb cargoanil@dxbusinessgroup.com	ec22e473f90c01a9268534696e811fbad5579ed656e06073e676c3d88355fc91	["*"]	\N	2023-11-17 13:53:56	2023-11-17 13:53:56
668	App\\Models\\User	145	145NB Comnbu1@mailinator.com	6a812be8146d1920da5acaaad6464a98a003d540c2fb2148c38a130c1fd76cb3	["*"]	\N	2023-11-17 14:08:33	2023-11-17 14:08:33
669	App\\Models\\User	157	157Hellokaran@gmail.com	0b6915f1531f2ce935b66d126b716c1efa16ad69e8f24c99aa7b0a5321adafcb	["*"]	\N	2023-11-17 14:39:28	2023-11-17 14:39:28
670	App\\Models\\User	99	99Binshabdriver@driver.com	92abcf131a25cf0306840ea1c60b3a69089d753b147e9725f9ba8873efb2d00c	["*"]	\N	2023-11-17 15:26:00	2023-11-17 15:26:00
671	App\\Models\\User	122	122Binsharusvinmerak@gmail.com	af34ddc690fd1defffe529801333d00d0307c97739996b1270c4e88ea3ae44c6	["*"]	\N	2023-11-17 15:39:19	2023-11-17 15:39:19
672	App\\Models\\User	145	145NB Comnbu1@mailinator.com	3c3ee7240df5d5e1bfb1f10ac9fb36c70a546e87cd1d74c2b6f39a4ffc4d8d3d	["*"]	\N	2023-11-17 15:40:33	2023-11-17 15:40:33
673	App\\Models\\User	163	163testtestdriver23@gmail.com	f7dac23cf341dbf012786c910a52b9001786dd283f1faa8c93669af259a046ad	["*"]	\N	2023-11-17 19:26:40	2023-11-17 19:26:40
674	App\\Models\\User	83	83Binsha1testdriver@gmail.com	c74b7f450b31112a605e8ff9a26968c842329164d289a8f18c80fcdcad60dfae	["*"]	\N	2023-11-17 21:22:47	2023-11-17 21:22:47
675	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	df7cfcc333abbd7351f82a1e0d39b1f4fa6ff338794715578445e7f9810ee548	["*"]	\N	2023-11-17 21:29:33	2023-11-17 21:29:33
676	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	b5e56ba4eed0a3306abe7faf846441c4c166d248ece3f5a95c171350fb2cee5f	["*"]	\N	2023-11-17 21:35:50	2023-11-17 21:35:50
677	App\\Models\\User	163	163testtestdriver23@gmail.com	dd99936ed088cae18fbb6ac2b5dd7f42439838f86765d444abb4b2edca011f31	["*"]	\N	2023-11-17 21:37:44	2023-11-17 21:37:44
678	App\\Models\\User	163	163test 23testdriver23@gmail.com	70030aa25aecb4ebd1e207fd64fcdb6bdb8abf3f635024dbc9b6c57001a7449d	["*"]	\N	2023-11-17 21:44:11	2023-11-17 21:44:11
679	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	a05f68fc5b3bc7b9bdc94f09ef5f4c4a527941160bc36d2c24fde1c612b98534	["*"]	\N	2023-11-17 21:54:50	2023-11-17 21:54:50
680	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	c8f130f64b28cfd4ff8dc6cf53f0e105346de58b4451d62abc30eaac07f930c5	["*"]	\N	2023-11-17 23:27:38	2023-11-17 23:27:38
681	App\\Models\\User	122	122Binsharusvinmerak@gmail.com	d89a2f451cf3b3d087ab257f169f05b1c59e0b0a328155dc51bd6de073dff5e8	["*"]	\N	2023-11-18 08:00:13	2023-11-18 08:00:13
682	App\\Models\\User	122	122Binsharusvinmerak@gmail.com	f3cfc3e0c296d9e2329a866b421299b5db7a8a70a123f5ef97e486bcdc983750	["*"]	\N	2023-11-18 08:32:36	2023-11-18 08:32:36
683	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	6880221fe23622ac5fdfb971298ce65483c339e38b02ede96b87f2022b63dc4f	["*"]	\N	2023-11-18 08:36:04	2023-11-18 08:36:04
684	App\\Models\\User	163	163test 23testdriver23@gmail.com	1453109166349f512d821a65838185199ade1f79796b11b7be556d6a82bfba23	["*"]	\N	2023-11-18 08:43:54	2023-11-18 08:43:54
685	App\\Models\\User	122	122Binsharusvinmerak@gmail.com	d02aa58333e73a8ecec96c1ee8d4ab565c96677d32633d2ebbccbdbfff86f642	["*"]	\N	2023-11-18 08:44:42	2023-11-18 08:44:42
686	App\\Models\\User	166	Personal Access Token	0c8d5c1f6b7d5d0ae76ee31409940d75bcb7a24ba502964c6769a9a205bef4a6	["*"]	\N	2023-11-18 09:16:04	2023-11-18 09:16:04
687	App\\Models\\User	166	166Dulu DXBnbu2@mailinator.com	b0a12f13fe1516588eb67fd356e96f74963c46feb28ce3ffde3f931693bc8549	["*"]	\N	2023-11-18 09:16:05	2023-11-18 09:16:05
688	App\\Models\\User	166	166Dulu DXBnbu2@mailinator.com	91149a95f8e8fbcc4626e9335c64b1f68fc9d6b3ceb6042e7483ca78c4450db4	["*"]	\N	2023-11-18 09:16:05	2023-11-18 09:16:05
689	App\\Models\\User	134	134DX Appappdx0911@gmail.com	e2e042146b87a3de5b49a40ca5ecab2d670df581ab34d0f04ea9c710d3fe9077	["*"]	\N	2023-11-18 09:18:09	2023-11-18 09:18:09
690	App\\Models\\User	167	167N Biswasnemai.biswas56@gmail.com	d9ef2117d60cf89acef7db81377231a3b70774514c3569b55e2e48b67b8f4378	["*"]	\N	2023-11-18 09:18:43	2023-11-18 09:18:43
691	App\\Models\\User	168	Personal Access Token	373d4b0e40768f46c1a5fa3610badc7e0ce7acb00f73cc311c9df9f67a024819	["*"]	\N	2023-11-18 09:24:34	2023-11-18 09:24:34
692	App\\Models\\User	168	168KaranTestnbd04@mailinator.com	b38b2e2031cb67d508194e4f0492da06eb361e471509c8b8f593b49132ec50cb	["*"]	\N	2023-11-18 09:24:34	2023-11-18 09:24:34
693	App\\Models\\User	73	73Hunain Dehunain88@gmail.com	862c67fd126018882f9db190e3d3b634fbb2d49ae607ac00f0a918e6b61ec3bf	["*"]	\N	2023-11-18 09:29:39	2023-11-18 09:29:39
694	App\\Models\\User	166	166Dulu DXBnbu2@mailinator.com	95e55f3f8f69a56f6f977cea13d98b5bd2a48b6b918b34017178d47b117ef626	["*"]	\N	2023-11-18 09:35:00	2023-11-18 09:35:00
695	App\\Models\\User	168	168KaranTestnbd04@mailinator.com	721ab74f7ac5de74122d44a9055a03ca9818c4884186c4482e8bbcf97459c7ab	["*"]	\N	2023-11-18 09:46:43	2023-11-18 09:46:43
696	App\\Models\\User	168	168KaranTestnbd04@mailinator.com	8a38bc2de1c18ef55a3eaba981ce1a8f0167ba29bf3027f397302cf837a067b5	["*"]	\N	2023-11-18 09:51:37	2023-11-18 09:51:37
697	App\\Models\\User	169	Personal Access Token	aa4333373839c9bf870968ecf8ea19f4e6b30b3474cb51acdf03a5c27ae5b330	["*"]	\N	2023-11-18 10:09:57	2023-11-18 10:09:57
698	App\\Models\\User	169	169Lulu DXBnbu3@mailinator.com	e01ae77e81096dc4d1ca6003fed8254a376982ffc3f3381d1733c3d2e7f85b97	["*"]	\N	2023-11-18 10:09:58	2023-11-18 10:09:58
699	App\\Models\\User	169	169Lulu DXBnbu3@mailinator.com	7f9fcdd6c39e18683bc1cd7814ddfc700ad3a8a65cac3510c9146c18d8c0f77e	["*"]	\N	2023-11-18 10:09:58	2023-11-18 10:09:58
700	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	d6e9903a559cce87e25e5075b112a9c6b17c4b3095078a533a33f6fb5f3a7504	["*"]	\N	2023-11-18 10:24:58	2023-11-18 10:24:58
701	App\\Models\\User	170	Personal Access Token	e000542b1ded9e0ad8e93d4ea6cfb3e8e21b7045677ddaaa182c9d3a163f66e5	["*"]	\N	2023-11-18 10:37:58	2023-11-18 10:37:58
702	App\\Models\\User	170	170testtest24@gmail.com	10fab2c7d4d2d6aa30c9090d2498dc9a371fc2959ec0958f80658148a661e242	["*"]	\N	2023-11-18 10:37:58	2023-11-18 10:37:58
703	App\\Models\\User	137	137Dxb cargoanil@dxbusinessgroup.com	6c15b7e238e1c3a8365a27a839e7a3114aca9eb55b762f3e2fb2900a227261c4	["*"]	\N	2023-11-18 10:39:01	2023-11-18 10:39:01
704	App\\Models\\User	169	169Lulu DXBnbu3@mailinator.com	5fffe5d9e551b6f9fb8a6ad02401efb389c70a41ced3c4d5a094536a54d09ea6	["*"]	\N	2023-11-18 10:51:33	2023-11-18 10:51:33
705	App\\Models\\User	171	Personal Access Token	29fa8d5c6aca1e5eb0cc01d1271d5c916b969d8b9151f7101d189bb1cc247040	["*"]	\N	2023-11-18 12:09:45	2023-11-18 12:09:45
706	App\\Models\\User	171	171testtest11@gmail.com	0ca4a67b066996be693fa70d4e76addceebfe76f914e384ee4ec22bf337be5b8	["*"]	\N	2023-11-18 12:09:45	2023-11-18 12:09:45
707	App\\Models\\User	171	171testtest11@gmail.com	59192aa2eb13cc66b5b02ea4f2c2509f1d1d50f9b05e6bad039bd4aadc6ff779	["*"]	\N	2023-11-18 12:09:45	2023-11-18 12:09:45
708	App\\Models\\User	172	Personal Access Token	300c7cc6d642ab206e1ad974f6566529f8bd86e0f7033baa6d0a80602c8b4caf	["*"]	\N	2023-11-18 12:36:00	2023-11-18 12:36:00
709	App\\Models\\User	172	172testtest12@gmail.com	b0ba441ce1d0276503a7090bc99a1f2a58d21c779156f2c0b88b3e8477f3f361	["*"]	\N	2023-11-18 12:36:01	2023-11-18 12:36:01
710	App\\Models\\User	172	172testtest12@gmail.com	dd565d06912b8662fd1782818e1bc93b71c372d772ad5d214ac14d6c78304351	["*"]	\N	2023-11-18 12:36:01	2023-11-18 12:36:01
711	App\\Models\\User	83	83Binsha1testdriver@gmail.com	8a3ac94de5ce1d9226076258fc28419f1ea0765c849ffd8aed35755cb1d88084	["*"]	\N	2023-11-18 12:49:01	2023-11-18 12:49:01
712	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	552486941bcdf015c35a33480ed75eac28fd12188816df76967f01d575424328	["*"]	\N	2023-11-18 12:54:15	2023-11-18 12:54:15
713	App\\Models\\User	83	83Binsha1testdriver@gmail.com	e44039f49d0f7aa21027182eefc5759b2efbe1a8266b1120af7bdf7501e097e9	["*"]	\N	2023-11-18 13:08:32	2023-11-18 13:08:32
714	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	d44b7617d62c7c4dad95f0f1cffdac49fbdaf3ec7c755f050454cab878a9e7f2	["*"]	\N	2023-11-18 13:50:11	2023-11-18 13:50:11
715	App\\Models\\User	173	Personal Access Token	44432767d188719d60e54c417683bdfc0f9be9cd6f9aaf3c086b82e700ed0d31	["*"]	\N	2023-11-18 14:47:49	2023-11-18 14:47:49
716	App\\Models\\User	173	173Navis Truckanilnavis@gmail.com	8e7482a46b3cdcb11c8810ee238c66ad84f0a1f71489459685a4514063cdd8e0	["*"]	\N	2023-11-18 14:47:49	2023-11-18 14:47:49
717	App\\Models\\User	174	Personal Access Token	86fb378a76a5d1dc70b32724018d30efc8b272b123f961c228d19b6133fea078	["*"]	\N	2023-11-18 15:03:35	2023-11-18 15:03:35
718	App\\Models\\User	174	174Nabroanil@dxbusinessgroup.com	095c0790b532a66968576a2f82826b3e6de9d8d67dd3ba849be5766ebcfb378a	["*"]	\N	2023-11-18 15:03:35	2023-11-18 15:03:35
719	App\\Models\\User	174	174Nabroanil@dxbusinessgroup.com	57b84c6de295e617af09abd186067cca23e82fc3fe7b4c2ff4bcf643cd04e75c	["*"]	\N	2023-11-18 15:03:35	2023-11-18 15:03:35
720	App\\Models\\User	169	169Lulu DXBnbu3@mailinator.com	8e693f1cae30001202605df3a56c3e289708b15a9b8cf7c152f46474855275ac	["*"]	\N	2023-11-18 15:40:34	2023-11-18 15:40:34
721	App\\Models\\User	173	173Navis Truckanilnavis@gmail.com	bffe0506eadd1805cfc695eefd19cf02e6d945c39a90a741fdb3a262910404af	["*"]	\N	2023-11-18 15:41:50	2023-11-18 15:41:50
722	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	ccea197cb24aae08544cabfa76b4cd5f5b6a3e8142005b75558d8693f676c7ce	["*"]	\N	2023-11-18 15:43:03	2023-11-18 15:43:03
723	App\\Models\\User	174	174Nabroanil@dxbusinessgroup.com	14532fabe8dd8cc43e06e4cfa6a978c8cd5dbb8c2fd8e715153fe692c4be9fbe	["*"]	\N	2023-11-18 15:59:13	2023-11-18 15:59:13
724	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	ac880b4c1cfe1d2ba8f115b4407abaeb4b0ce67ddeeaad9ac165f3f9d4372199	["*"]	\N	2023-11-18 16:01:08	2023-11-18 16:01:08
725	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	1f1770ed79c4da56895ee221c06ed01fba3b4c95d9fe47910d8a876514d1364c	["*"]	\N	2023-11-18 16:33:58	2023-11-18 16:33:58
726	App\\Models\\User	83	83Binsha1testdriver@gmail.com	0466cc7f8915f25e5b28dfce162d79cbaa2e5879f7ba64785fa61e75f28dcfc9	["*"]	\N	2023-11-18 16:55:10	2023-11-18 16:55:10
727	App\\Models\\User	172	172testtest12@gmail.com	72eb059fca130d41961bf75c663af98a66645da97fac2c7ddf68b27582269829	["*"]	\N	2023-11-18 17:14:47	2023-11-18 17:14:47
728	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	169f4572c0af416c1c1e8a4c6537f173a43ceecfd27de8ceec57c604119e78f2	["*"]	\N	2023-11-18 17:19:32	2023-11-18 17:19:32
729	App\\Models\\User	99	99Binshabdriver@driver.com	78baa17cb0dbd0496909bcc381d0e7f7fdc96c9c65ccf08f49148baabccb5170	["*"]	\N	2023-11-18 18:43:19	2023-11-18 18:43:19
730	App\\Models\\User	99	99Binshabdriver@driver.com	b8e1daa8bf4913dec515b9254f064e3bb7d91de44bb929657cfc8374c3daba3f	["*"]	\N	2023-11-18 18:43:32	2023-11-18 18:43:32
731	App\\Models\\User	163	163test 23testdriver23@gmail.com	7906fd248c777fd9da45bbb72cfc79162db1a2c641ac577a268373f9c4650ed2	["*"]	\N	2023-11-18 18:48:54	2023-11-18 18:48:54
732	App\\Models\\User	83	83Binsha1testdriver@gmail.com	83725908470b77aa01ef2e2c3f42a9877349275bffb5d6f0ba2a5a6370195307	["*"]	\N	2023-11-18 19:07:12	2023-11-18 19:07:12
733	App\\Models\\User	173	173Navis Truckanilnavis@gmail.com	2b384be013d98790922c83db3bc6622821a6720eedacf4b15c3090016db581bf	["*"]	\N	2023-11-18 19:16:31	2023-11-18 19:16:31
734	App\\Models\\User	175	Personal Access Token	d9f90a11f48813d9bab5af717600b29d6e27cfb128048158bd0ce4092514c2be	["*"]	\N	2023-11-18 21:38:12	2023-11-18 21:38:12
735	App\\Models\\User	175	175Driver DXnbd3@mailinator.com	c9140e71ae7cb2fcc0ab5c0c99dda915a8f47011153bca66ed6d416cf0f902b2	["*"]	\N	2023-11-18 21:38:12	2023-11-18 21:38:12
736	App\\Models\\User	176	Personal Access Token	62610373b690f2682406dcf6c147ea682c9de009ccd284cc5395433e0ad44618	["*"]	\N	2023-11-19 09:08:59	2023-11-19 09:08:59
737	App\\Models\\User	176	176NB Companynbu4@mailinator.com	e49c835758962862f9df1430592f5314f2001c749f88cec4147498fe1c869c35	["*"]	\N	2023-11-19 09:09:00	2023-11-19 09:09:00
738	App\\Models\\User	176	176NB Companynbu4@mailinator.com	ad8926e479de9185f0b98692f9beaaa13ac777b5a1b6e2b2278fc92783a39a4e	["*"]	\N	2023-11-19 09:09:00	2023-11-19 09:09:00
739	App\\Models\\User	177	Personal Access Token	6c801d13fb128660dccf236d5eb129e51d774c55d35d3dabf1c524dbe666bbd8	["*"]	\N	2023-11-19 09:43:33	2023-11-19 09:43:33
740	App\\Models\\User	177	177NB Driver Conbd5@mailinator.com	b9e2b55d10bb758cfad72a0e0fbbd3cafbaec0de4f1dbb20a94c6fb6413449e0	["*"]	\N	2023-11-19 09:43:33	2023-11-19 09:43:33
741	App\\Models\\User	178	Personal Access Token	3a53c48eccfb193a7b3e8d26931e1523ed1fed2e5433a5665651d6770450f03f	["*"]	\N	2023-11-19 09:48:02	2023-11-19 09:48:02
742	App\\Models\\User	178	178NB Company Ltdnbu5@mailinator.com	2d6c3753c737c034c5ddace4cd74f388a9fad70ffeda5d37bbd90d446f52f13f	["*"]	\N	2023-11-19 09:48:03	2023-11-19 09:48:03
743	App\\Models\\User	178	178NB Company Ltdnbu5@mailinator.com	33d6e74fbdb91536a0ef58dd9bcdc4f39bd5c49693bd09cf32285f87a9f70bec	["*"]	\N	2023-11-19 09:48:03	2023-11-19 09:48:03
744	App\\Models\\User	178	178NB Company Ltdnbu5@mailinator.com	dc8c8bc26aa3595f482e479b9cf133af7dd81b6e7ba14e92ee87714213f1ba25	["*"]	\N	2023-11-19 10:09:44	2023-11-19 10:09:44
745	App\\Models\\User	83	83Binsha1testdriver@gmail.com	567c71b357178998d068faf9096e1f42a1e9e936a3b4c7fa5282df9ce1231813	["*"]	\N	2023-11-20 07:37:26	2023-11-20 07:37:26
746	App\\Models\\User	179	Personal Access Token	7753768b9355dd164fe0e1cf4ad3fa5a76f63908964e94479740b647f793f7f4	["*"]	\N	2023-11-20 08:34:23	2023-11-20 08:34:23
747	App\\Models\\User	179	179Nemai Drivernbd6@mailinator.com	9c1fd051ab4abda0b6995983fc0d43e2bb10903d4098f621e46f1bd9d505267d	["*"]	\N	2023-11-20 08:34:23	2023-11-20 08:34:23
748	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	06783458fb69b6fbc79d77c1e0364ea1ea96103ce2f1ba5e65592c4025f2c3e1	["*"]	\N	2023-11-20 09:08:19	2023-11-20 09:08:19
749	App\\Models\\User	178	178NB Company Ltdnbu5@mailinator.com	9a1d8d1fa56c87c750f3a3a29043b173c9b962a4b7cd3631c9ebcb57812315c7	["*"]	\N	2023-11-20 09:25:31	2023-11-20 09:25:31
750	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	3335775b941d097a4785d00dcf6cf5c61c78996aa071e47aa8aee2d7755ee000	["*"]	\N	2023-11-20 10:51:40	2023-11-20 10:51:40
751	App\\Models\\User	178	178NB Company Ltdnbu5@mailinator.com	8087ca08f1e5a0de428aadb0131d73bdc0f19d622b4bc2eda6a2c038c1b1af8c	["*"]	\N	2023-11-20 11:56:56	2023-11-20 11:56:56
752	App\\Models\\User	178	178NB Company Ltdnbu5@mailinator.com	dc54a400c847e61ad240a702a496cff4654b7cc1dde3c24071f329cb53ac54dc	["*"]	\N	2023-11-20 12:56:04	2023-11-20 12:56:04
753	App\\Models\\User	178	178NB Company Ltdnbu5@mailinator.com	ab2784e6b348c8960d55a2d0b941b4be7ecc97c5d1135b46f8508fe77c7d32c4	["*"]	\N	2023-11-20 12:58:23	2023-11-20 12:58:23
754	App\\Models\\User	178	178NB Company Ltdnbu5@mailinator.com	f6dc05e444fbf6026a9c52b2d1cd5b11b5ec05f1cb6d38b4087bf1b24cd42dd3	["*"]	\N	2023-11-20 12:58:36	2023-11-20 12:58:36
755	App\\Models\\User	178	178NB Company Ltdnbu5@mailinator.com	c54c6cbe587de318aca1795e85560bcdb0157bdcfa2adb759a3da86547a0f1ae	["*"]	\N	2023-11-20 14:08:10	2023-11-20 14:08:10
756	App\\Models\\User	178	178NB Company Ltdnbu5@mailinator.com	025f56b8e2ea0b0f543e95956478102eb8f9cc6e80fda8e436b8a3312775d6f2	["*"]	\N	2023-11-20 14:30:08	2023-11-20 14:30:08
757	App\\Models\\User	178	178NB Company Ltdnbu5@mailinator.com	9ee6bd1bb8f2be4200927aa3b8a17841f95d1555cc9b7086dd1b216bcb836c00	["*"]	\N	2023-11-20 14:34:04	2023-11-20 14:34:04
758	App\\Models\\User	178	178NB Company Ltdnbu5@mailinator.com	04fb01feb58923c5957c2d5685fe5163b34163d74c2eb86a31448eaa6c2d2ca1	["*"]	\N	2023-11-20 14:40:35	2023-11-20 14:40:35
759	App\\Models\\User	178	178NB Company Ltdnbu5@mailinator.com	48dc41e0e6334b0cf24dabd78abf4ca81b2033502e4ad54cb269ef2e616cbf68	["*"]	\N	2023-11-20 14:41:05	2023-11-20 14:41:05
760	App\\Models\\User	178	178NB Company Ltdnbu5@mailinator.com	11750725c90e4477bfa21f76ef0853e7387cf2c97248a9bbdee4d8504aff27ef	["*"]	\N	2023-11-20 14:41:33	2023-11-20 14:41:33
761	App\\Models\\User	178	178NB Company Ltdnbu5@mailinator.com	740e7dc7707af79020e6c090e38c4cc4e846c04d817ec7286f6e9097b9c26a77	["*"]	\N	2023-11-20 14:47:07	2023-11-20 14:47:07
762	App\\Models\\User	180	Personal Access Token	c4e1c8debf8515fd2459a922efe134a947affce23e5029463e722112405fafac	["*"]	\N	2023-11-20 15:11:05	2023-11-20 15:11:05
763	App\\Models\\User	180	180NB Drivernbd7@mailinator.com	50167e63fc6e5912c022a3de1fd08f8719c0e6623aa31cd0b81471d29c8ede5c	["*"]	\N	2023-11-20 15:11:05	2023-11-20 15:11:05
764	App\\Models\\User	178	178NB Company Ltdnbu5@mailinator.com	bb4513ef9fd61bde173b16bddf5f6014d643e737517bcd38ea56bb47c8104cfc	["*"]	\N	2023-11-20 15:11:37	2023-11-20 15:11:37
765	App\\Models\\User	83	83Binsha1testdriver@gmail.com	f99f71f13b8e6d3621c1490fe9021559c1b89303fa2dee5225556b22de1e24c9	["*"]	\N	2023-11-20 15:21:15	2023-11-20 15:21:15
766	App\\Models\\User	83	83Binsha1testdriver@gmail.com	314d03d7305aec17dfef40c3802c96a7cd1cc6dd7c03c87a5a331e58147f1f9e	["*"]	\N	2023-11-20 15:34:39	2023-11-20 15:34:39
767	App\\Models\\User	180	180NB Drivernbd7@mailinator.com	7c2d579c98d1b69b86dd68d743edfc4d9a65fe2c391a450a69df62fa60249080	["*"]	\N	2023-11-20 15:57:52	2023-11-20 15:57:52
768	App\\Models\\User	181	Personal Access Token	b085f8cb4c4b7974ae95c86a15ca381211f32cc61238aa100fe265a234c6e51c	["*"]	\N	2023-11-20 16:12:18	2023-11-20 16:12:18
769	App\\Models\\User	181	181NB DriverDnbd8@mailinator.com	5b456a43b7ade044e7825ec3c33bd61bfb68908885100216be3cb505f347372c	["*"]	\N	2023-11-20 16:12:18	2023-11-20 16:12:18
770	App\\Models\\User	182	Personal Access Token	e4759b8bc8f99616c64ecae463c87919c7e559f31efecb846245e1f02324a56b	["*"]	\N	2023-11-20 16:33:29	2023-11-20 16:33:29
771	App\\Models\\User	182	182ruscinrusvintest@gmail.com	79eee4616f744de2ea0942897d96c0ffdcf5768959205be9f75e8bfa58461299	["*"]	\N	2023-11-20 16:33:29	2023-11-20 16:33:29
772	App\\Models\\User	183	Personal Access Token	611f1b72cbc46d8218dc2522ba50827818dc590fa3ffd3a5676b55a13b3b5730	["*"]	\N	2023-11-20 16:37:50	2023-11-20 16:37:50
773	App\\Models\\User	183	183Abcrusvink@gmail.com	84e104bb1d04cb4675f19244729bea8798fba38161650ca3093d99ba5359ee01	["*"]	\N	2023-11-20 16:37:50	2023-11-20 16:37:50
774	App\\Models\\User	183	183Abcrusvink@gmail.com	00504de69041562d8523e355c1097a22d7bdaba316d557e330495f02b1260a5b	["*"]	\N	2023-11-20 16:37:50	2023-11-20 16:37:50
775	App\\Models\\User	184	Personal Access Token	ba86fea21556b5b0587f6021f88eab97aca8d6bdaef2159a03b008fae9d446b3	["*"]	\N	2023-11-21 09:18:54	2023-11-21 09:18:54
776	App\\Models\\User	184	184Demo Codemo@mailinator.com	bbf514d23344bdd0121ed587fe7e6ca5ee09d7de3b1e4957cac061f1687b3663	["*"]	\N	2023-11-21 09:18:55	2023-11-21 09:18:55
777	App\\Models\\User	184	184Demo Codemo@mailinator.com	d6fcfbf835ba7017a116e0089b0b9a69d2b92763577502177a0eda12594996a1	["*"]	\N	2023-11-21 09:18:55	2023-11-21 09:18:55
778	App\\Models\\User	185	Personal Access Token	b724d12cc8b436f870cc7c2bdfe77319b0764bf3ba845180289b25143ed5d4b1	["*"]	\N	2023-11-21 09:29:54	2023-11-21 09:29:54
779	App\\Models\\User	185	185Demo Driverdrivera@mailinator.com	7b53c4f59ff3f1c65f091dea0633333728fcf68f89297a0aee99e800b33db5e0	["*"]	\N	2023-11-21 09:29:54	2023-11-21 09:29:54
780	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	d2606ae0e916cc223de520e8e1721755cf50a70abc7dbd1da2ca6a941de7b3af	["*"]	\N	2023-11-21 12:24:13	2023-11-21 12:24:13
781	App\\Models\\User	90	90Abdul Ghanidriver@gmail.com	c0a99d2c958c837a207b869e832cb205344369df486c1c8a07819f6b797714d6	["*"]	\N	2023-11-29 10:06:39	2023-11-29 10:06:39
782	App\\Models\\User	73	73Hunain Devhunain88@gmail.com	c4fd23b5c9ec67db42177f2eea92522c3996402af8cf6a1e589b56e8b7666d3a	["*"]	\N	2023-11-29 10:16:08	2023-11-29 10:16:08
783	App\\Models\\User	90	90Abdul Ghanidriver@gmail.com	d635d43172f987fb0ae5f1ad56c609512c141b435a33d6e4ceb90dca4f8964b2	["*"]	\N	2023-11-29 10:38:21	2023-11-29 10:38:21
784	App\\Models\\User	83	83Binsha1testdriver@gmail.com	d62b4f94935ed81dbf6bef13df1b6a7ac0ff5c7e54461eacb55121c36a6ea5b4	["*"]	\N	2023-11-29 14:21:08	2023-11-29 14:21:08
785	App\\Models\\User	162	162testtestdriver21@gmail.com	a92a3cda9053251e1315e9b4522d2e2acdd29c5a631909fcb90753e9ef27ddc2	["*"]	\N	2023-11-29 15:46:25	2023-11-29 15:46:25
786	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	7624baaab4755c916195eff50708ea52ae711ef4d4090a81185c9f47771b09ef	["*"]	\N	2023-11-29 16:29:33	2023-11-29 16:29:33
787	App\\Models\\User	83	83Binsha1testdriver@gmail.com	235a25eaa8e6060f7aaa8250c869ee713e2977a9b7ea5e270b0ee62c114e2778	["*"]	\N	2023-11-29 20:17:12	2023-11-29 20:17:12
788	App\\Models\\User	162	162testtestdriver21@gmail.com	2453c682d0bc615f9273585b6e87a1fd2cf2607dbacab3d59b45a178c974cfd9	["*"]	\N	2023-11-29 20:48:02	2023-11-29 20:48:02
789	App\\Models\\User	162	162testtestdriver21@gmail.com	c338a0a6ef343690395117cb179a5c80ea213ea9fbf11609c197b1dbcabc040d	["*"]	\N	2023-11-30 02:57:33	2023-11-30 02:57:33
790	App\\Models\\User	184	184Demo Codemo@mailinator.com	616e37715c4864e10f381f927184145219b7e7f1f0f77562342e0d2606abaa46	["*"]	\N	2023-11-30 08:24:31	2023-11-30 08:24:31
791	App\\Models\\User	90	90Abdul Ghanidriver@gmail.com	5141bbf3b210ffd5f0d43f220d49b0248bc8c06a56b9a21440e7e76902a12d17	["*"]	\N	2023-11-30 09:28:15	2023-11-30 09:28:15
792	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	5234c885c6e4839452719bd0a469fe5aca31adfa4e53bbdd8e9ae8438483807d	["*"]	\N	2023-11-30 09:43:22	2023-11-30 09:43:22
793	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	e4dadcbe58d1313e1a6f666db123cf76f8ade32e745d5a3b5388d4bdaf0b6f84	["*"]	\N	2023-11-30 11:22:37	2023-11-30 11:22:37
794	App\\Models\\User	83	83Binsha1testdriver@gmail.com	1a24ab7fde0110b0b42372850b6292f44d29d370f95e242a7f843503baa05521	["*"]	\N	2023-11-30 12:38:00	2023-11-30 12:38:00
795	App\\Models\\User	90	90Abdul Ghanidriver@gmail.com	56a77c646ebb1e67598b05e8625b776ccb2177ec4a844f119bd03fe0dc119136	["*"]	\N	2023-11-30 17:46:39	2023-11-30 17:46:39
796	App\\Models\\User	83	83Binsha1testdriver@gmail.com	0ca360bf4589e085288ea62be3fad0fa7964b0769a07ec47995f38cc3b133078	["*"]	\N	2023-12-01 09:35:35	2023-12-01 09:35:35
797	App\\Models\\User	83	83Binsha1testdriver@gmail.com	a5d0798726c589cdb0738275e0e17f49081f5e0308f832cd24e4dbf42dcbdf51	["*"]	\N	2023-12-01 14:51:30	2023-12-01 14:51:30
798	App\\Models\\User	83	83Binsha1testdriver@gmail.com	096cd7f8b42dd227c1bdd6af1a7e886638691e4d0f43cca8cb3b277109436f9d	["*"]	\N	2023-12-01 14:53:10	2023-12-01 14:53:10
799	App\\Models\\User	83	83Binsha1testdriver@gmail.com	fa3a13fd2205970ffad5cf5a382b71dead3446c141ac2f8c8f5db8c5b663ee2b	["*"]	\N	2023-12-01 14:53:51	2023-12-01 14:53:51
800	App\\Models\\User	168	168KaranTestnbd04@mailinator.com	124221efdc0772eeceafedaba8533e6de7c6444f920daa3dfcda90ce24d450ec	["*"]	\N	2023-12-01 14:57:17	2023-12-01 14:57:17
801	App\\Models\\User	83	83Binsha1testdriver@gmail.com	fbfb5eba41d5196986d555707a382a57474fd1ad53da0853690e584c5f9ef3a5	["*"]	\N	2023-12-01 15:12:55	2023-12-01 15:12:55
802	App\\Models\\User	172	172testtest12@gmail.com	297a90f279a99bd0cca3de7317e81d4bf19503bd23316a26c7d6a93a23211ca2	["*"]	\N	2023-12-01 21:02:12	2023-12-01 21:02:12
803	App\\Models\\User	162	162testtestdriver21@gmail.com	8e567dd74f650a7b594537e86a02a75be18f522b5b27066a974bc79211150906	["*"]	\N	2023-12-02 09:12:14	2023-12-02 09:12:14
804	App\\Models\\User	90	90Abdul Ghanidriver@gmail.com	9f058e5cffc066b02e257edb34f0c752f83be13d69713c26a440857e612a4670	["*"]	\N	2023-12-02 09:13:25	2023-12-02 09:13:25
805	App\\Models\\User	162	162testtestdriver21@gmail.com	dd7d676a79abb798dc3db0c1e069cd76c648c3d74817187e963f86588dd086fa	["*"]	\N	2023-12-02 09:49:16	2023-12-02 09:49:16
806	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	95a29756f79547430b50c983f63ff8417a0e6c6725a82c3dabf80dfe59394c13	["*"]	\N	2023-12-02 09:57:54	2023-12-02 09:57:54
807	App\\Models\\User	90	90Abdul Ghanidriver@gmail.com	67a7763db9719ea449370d9dcf30ba60afdefa3693b4c6110d7f47e25307ecb3	["*"]	\N	2023-12-02 10:06:26	2023-12-02 10:06:26
808	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	e88baa7e9fe37a76bc592e72d650f6d86f405933959df37cde013a36f89bab28	["*"]	\N	2023-12-02 10:14:01	2023-12-02 10:14:01
809	App\\Models\\User	90	90Abdul Ghanidriver@gmail.com	0d99bf078a7ce3088b8ed819ca74edf085115b2f7b020cfcb6f80fc6d181ff22	["*"]	\N	2023-12-02 10:32:21	2023-12-02 10:32:21
810	App\\Models\\User	186	Personal Access Token	b42d450672024e401fbc5a08f34185672e8332630d8645cebc5456921d3c75ee	["*"]	\N	2023-12-02 10:38:25	2023-12-02 10:38:25
811	App\\Models\\User	186	186testkaranyyyyyy@gmail.com	b8e8a9bb9f510fa494f877b26101df4bb715c74e3595d96d740117626135d71b	["*"]	\N	2023-12-02 10:38:26	2023-12-02 10:38:26
812	App\\Models\\User	186	186testkaranyyyyyy@gmail.com	fa7f6b94894fd04b66ed5c43b62dcda95be216978dbbee1db792a785cf0f1a62	["*"]	\N	2023-12-02 10:38:26	2023-12-02 10:38:26
813	App\\Models\\User	168	168KaranTestnbd04@mailinator.com	11d0d2fb6108b65605999c379e6ccf9097100cb23b2e93a8d0dcacb440a1dc98	["*"]	\N	2023-12-02 10:40:18	2023-12-02 10:40:18
814	App\\Models\\User	157	157Hellokaran@gmail.com	c5ee386d6b72e7efd24296fc5adc291e621c6028d53cfd70620ec7cb21142f07	["*"]	\N	2023-12-02 10:45:48	2023-12-02 10:45:48
815	App\\Models\\User	103	103hunain dev ninehunain99@gmail.com	c1918ac7bb7755feb31d9cb6aace4eab983a55861d5803c551e365bcc63af6b8	["*"]	\N	2023-12-02 11:24:13	2023-12-02 11:24:13
816	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	44761bd4d86ed822d33d1eb74e36d1973c15a0c1f001cd15c5e690e73add972e	["*"]	\N	2023-12-02 12:37:42	2023-12-02 12:37:42
817	App\\Models\\User	74	74Glen Maxbinshambrs@gmail.com	e95b327918bde07d26bd8d5b510dc581c5cd292fa5a53cfd38e193dd94529052	["*"]	\N	2023-12-02 12:49:01	2023-12-02 12:49:01
818	App\\Models\\User	103	103hunain dev ninehunain99@gmail.com	97ce83da9a7c81c67f74057eb3a15f3887da7f44e50c7f24591a6189fd1eda6d	["*"]	\N	2023-12-02 13:35:15	2023-12-02 13:35:15
819	App\\Models\\User	187	Personal Access Token	efafe02d6db09d56e54f0e20949ab23b45b6ba0e710a7d61a7f8e10e1ff58a9e	["*"]	\N	2023-12-04 13:07:56	2023-12-04 13:07:56
820	App\\Models\\User	187	187NB Companynbu100@mailinator.com	e7fdec541b0167cff5db07c183487181efc14fbd96a85d54fa50540223a6dae1	["*"]	\N	2023-12-04 13:07:57	2023-12-04 13:07:57
821	App\\Models\\User	187	187NB Companynbu100@mailinator.com	da0e62dbd140c7ec61ac7906e229ae36ba407e749e4a4e285e916e3b485a7c8c	["*"]	\N	2023-12-04 13:07:57	2023-12-04 13:07:57
822	App\\Models\\User	188	Personal Access Token	cd04356ac8b4e4e08c7b180ad2a8b07fcbbe9c85b987d246efacc0e0585c964d	["*"]	\N	2023-12-04 13:17:31	2023-12-04 13:17:31
823	App\\Models\\User	188	188DriverDDnbd100@mailinator.com	46842805d6ef7041459c36931c1a88f247ba78b34506c40fafd1d96687496845	["*"]	\N	2023-12-04 13:17:31	2023-12-04 13:17:31
824	App\\Models\\User	177	177NB Driver Conbd5@mailinator.com	434857a7d4134dbd825bff2385443c994f7e1c92ec939a99547f1812a173e69b	["*"]	\N	2023-12-04 14:42:28	2023-12-04 14:42:28
825	App\\Models\\User	139	139NbDrivernbd1@mailinator.com	e8a5a1e2972575ea92824ad5f646fe00c7eab7811ac48e87a3040aa6fc6901b1	["*"]	\N	2023-12-04 14:48:56	2023-12-04 14:48:56
826	App\\Models\\User	177	177NB Driver Conbd5@mailinator.com	cbf4a8017deb1da1ed74969c83becf327265755b847996e26d90daaf00a21311	["*"]	\N	2023-12-04 14:51:59	2023-12-04 14:51:59
827	App\\Models\\User	188	188DriverDDnbd100@mailinator.com	89d94ac487223d4a897a18e40c20393292cbe5c5e8d5a341eefc154acd6382ff	["*"]	\N	2023-12-04 15:34:08	2023-12-04 15:34:08
828	App\\Models\\User	83	83Binsha1testdriver@gmail.com	a9cd9c98bb49138e2431037ba2ba8c65fe44d82a93b42140795f64a280dc8956	["*"]	\N	2023-12-04 16:34:51	2023-12-04 16:34:51
829	App\\Models\\User	103	103hunain dev ninehunain99@gmail.com	fe08a2426c84130f9aa2543ac755ca7f028a8e39031b0ad10ad1d43e30b4f603	["*"]	\N	2023-12-04 19:21:32	2023-12-04 19:21:32
830	App\\Models\\User	187	187NB Companynbu100@mailinator.com	96ecd7a187cd1438696936a1e8e579be6c3cae336627fdaa05a9223f6466a584	["*"]	\N	2023-12-05 09:31:11	2023-12-05 09:31:11
831	App\\Models\\User	188	188DriverDDnbd100@mailinator.com	6b46e1709c50ab0ac2c05fd0b3b57fc5c0a10c6510dc87eb53529b7f203afcf0	["*"]	\N	2023-12-05 09:31:57	2023-12-05 09:31:57
832	App\\Models\\User	103	103hunain dev ninehunain99@gmail.com	3930120b2d8b56ffb8f07ec26cc2e0d77c6f1185845e75364ee0bd1e4b37004b	["*"]	\N	2023-12-05 10:49:27	2023-12-05 10:49:27
833	App\\Models\\User	83	83Binsha1testdriver@gmail.com	255a20ec8687addb57614b280d32f9dc4d4409c09dadc791b47e9f206480ffbf	["*"]	\N	2023-12-14 13:57:27	2023-12-14 13:57:27
834	App\\Models\\User	103	103hunain dev ninehunain99@gmail.com	9d1515f021057fde280b5f28a9ce7d34bac99c5970901877eae6af924d06eb7b	["*"]	\N	2023-12-14 13:58:39	2023-12-14 13:58:39
835	App\\Models\\User	103	103hunain dev ninehunain99@gmail.com	288891d7375483d6450138252ef2d0e7b5d77586b10f9d6639693d0011fc5882	["*"]	\N	2023-12-26 13:06:14	2023-12-26 13:06:14
836	App\\Models\\User	83	83Binsha1testdriver@gmail.com	7f44a580fe36a11c864144a0118c2b1137decc5f7ec043f765c168c650a14f95	["*"]	\N	2023-12-26 13:07:29	2023-12-26 13:07:29
837	App\\Models\\User	167	167N Biswasnemai.biswas56@gmail.com	970cee508c2991cba03b4309024744be908b545d3dde6112c6df94dc73c17dc8	["*"]	\N	2024-05-29 14:50:07	2024-05-29 14:50:07
838	App\\Models\\User	189	Personal Access Token	5c0ec0ec0a2ed7ac58bb714c460c69099c12f99e5ca84ee41a45ef9111979df9	["*"]	\N	2024-05-29 14:51:40	2024-05-29 14:51:40
839	App\\Models\\User	189	189NN Companyu0@mailinator.com	9f18aa21cb3cbdf280277ea380ab8facfef6a836c9b855d9e951de0e4aa808fd	["*"]	\N	2024-05-29 14:51:40	2024-05-29 14:51:40
840	App\\Models\\User	189	189NN Companyu0@mailinator.com	9423a499fb448bfdfc4cdcbf6860f27e2ca47dbb8ee5cd3c92daa85b35305329	["*"]	\N	2024-05-29 14:51:40	2024-05-29 14:51:40
841	App\\Models\\User	190	Personal Access Token	f9ee1f493c652b416d51d4be6e4c63ac85501263dfd74821a07356f2d3855e7d	["*"]	\N	2024-05-29 15:07:15	2024-05-29 15:07:15
842	App\\Models\\User	190	190NN Driverd0@mailinator.com	6eb76cd3f47a170581395f3ea9d04febddabd364c4498591f01f8e7f1a93e5f4	["*"]	\N	2024-05-29 15:07:15	2024-05-29 15:07:15
843	App\\Models\\User	188	188DriverDDnbd100@mailinator.com	b2e2d9d48b546f826fbd4012f3a8bf8bbcaa4cc29c84f69d961d8d35951d29ec	["*"]	\N	2024-06-03 10:50:53	2024-06-03 10:50:53
844	App\\Models\\User	191	Personal Access Token	a34900bd60446c245c583f6e7bb52c262337384fc9637f0a7e247c77583d0143	["*"]	\N	2024-06-03 10:53:28	2024-06-03 10:53:28
845	App\\Models\\User	191	191N Companyu1@mailinator.com	896ee8c1866c3151c567288d55dc62bb4e1bead651f00fe06fa39bc9caef1a90	["*"]	\N	2024-06-03 10:53:29	2024-06-03 10:53:29
846	App\\Models\\User	191	191N Companyu1@mailinator.com	3b280a3aed1e31d6840a05b1ab07becd9761a8129034eece732d985a122551f5	["*"]	\N	2024-06-03 10:53:29	2024-06-03 10:53:29
847	App\\Models\\User	190	190NN Driverd0@mailinator.com	52f26ce8f88dc1708b5520685caa509e2cea956bc4dca3c040f3b59d050b9ac8	["*"]	\N	2024-06-03 10:56:01	2024-06-03 10:56:01
848	App\\Models\\User	189	189NN Companyu0@mailinator.com	7f99f57dd1a6205af77315a08fb7b915434af267d5fd5b317071186807379f7f	["*"]	\N	2024-06-03 11:08:50	2024-06-03 11:08:50
849	App\\Models\\User	189	189NN Companyu0@mailinator.com	e430abc74096ccc52eeba406178caed9031f15f75f747d061707dfa127c6f3d2	["*"]	\N	2024-06-03 12:07:21	2024-06-03 12:07:21
850	App\\Models\\User	189	189NN Companyu0@mailinator.com	a485ef4b38e617735bf8782fe26818a70235ef61b2f9bf2e2fa6a127a59e99c4	["*"]	\N	2024-06-03 13:53:23	2024-06-03 13:53:23
851	App\\Models\\User	189	189NN Companyu0@mailinator.com	c734f603c42e2c3f2c6e777386d64a0f421c8fda94da146e5aabac3c2841014e	["*"]	\N	2024-06-03 14:28:31	2024-06-03 14:28:31
852	App\\Models\\User	189	189NN Companyu0@mailinator.com	3882a5fdc07c80ca8971c63fb40d83176a6cf4563d5061615a76a3ed8bfdf909	["*"]	\N	2024-06-03 20:17:28	2024-06-03 20:17:28
853	App\\Models\\User	189	189NN Companyu0@mailinator.com	bba97298d39fc942356a975757b18a8f8b3be5011dc3ded146f5920734f406b5	["*"]	\N	2024-06-05 10:18:23	2024-06-05 10:18:23
854	App\\Models\\User	189	189NN Companyu0@mailinator.com	9ccb3f8708b92e01772eaafb0f43e028b8c014af5b0d21cdf00d768a02358720	["*"]	\N	2024-06-05 10:26:45	2024-06-05 10:26:45
855	App\\Models\\User	190	190NN Driverd0@mailinator.com	de51e38ac96a740d008a4c80b3d92ae3f011a14f3b9683ece5f85d0b5f66b543	["*"]	\N	2024-06-07 11:10:07	2024-06-07 11:10:07
856	App\\Models\\User	192	Personal Access Token	43623545f656e08f3507d30d07f73a56af530791a1a8503f05fbcb9c4adab701	["*"]	\N	2024-06-07 11:17:25	2024-06-07 11:17:25
857	App\\Models\\User	192	192Driver DTwod2@mailinator.com	a3c0510fad14b365bc5a4c97385105ac3dab9c78e5cb082ab1fb15c95f73ffd5	["*"]	\N	2024-06-07 11:17:25	2024-06-07 11:17:25
858	App\\Models\\User	193	Personal Access Token	3f1e51504ee5b3c7de5fcfbb6d77a95756e3b0c9a5c863ccfa09ae419592be2d	["*"]	\N	2024-06-07 11:23:21	2024-06-07 11:23:21
859	App\\Models\\User	193	193NB CompanyBu9@mailinator.com	cc198bc3ff48aefa037f03b6fc1aa96f1ef573481d93583c8dcf82f1c0cb1127	["*"]	\N	2024-06-07 11:23:21	2024-06-07 11:23:21
860	App\\Models\\User	193	193NB CompanyBu9@mailinator.com	22de777df85ffa6eb7bd9774f1a469925b06fe97fa7bdc34be514d599e1b536c	["*"]	\N	2024-06-07 11:23:21	2024-06-07 11:23:21
861	App\\Models\\User	194	Personal Access Token	f4cdf18e4d942c1e2291524189cd36fe3a4de140ee315f39c56ac2d1e642221e	["*"]	\N	2024-06-07 12:19:34	2024-06-07 12:19:34
862	App\\Models\\User	194	194Renjioperation@gmail.com	3ddf55f058f0acaaaf315697aa2c1973974b47372fa5b32f5b405c2583ca7fba	["*"]	\N	2024-06-07 12:19:34	2024-06-07 12:19:34
863	App\\Models\\User	189	189NN Companyu0@mailinator.com	06da94a38a0ab1f5a46bb3b6ec52ab550f3052fb2294ce70b9a12f5cf255b5ee	["*"]	\N	2024-06-19 20:44:38	2024-06-19 20:44:38
864	App\\Models\\User	189	189NN Companyu0@mailinator.com	92f3670b91cd665cb23a0edb47f838816027095537d8beb6270d37af8ef8f7cb	["*"]	\N	2024-06-19 20:48:28	2024-06-19 20:48:28
865	App\\Models\\User	195	195sooraj sabusoorajsabu117@gmail.com	1de66125ef3c97786ae293444302434226c6b6c4d7c4b2f984dec51b173f07a2	["*"]	\N	2024-09-18 11:00:17	2024-09-18 11:00:17
866	App\\Models\\User	138	138test testtestingfordxb@gmail.com	2d27a9a5d928c4352b7c79a6b4b141e2370fba9130dc68b29a871ef735f793df	["*"]	\N	2024-09-18 11:18:33	2024-09-18 11:18:33
867	App\\Models\\User	195	195sooraj sabusoorajsabu117@gmail.com	3475f4dcac230c69e32545267fa2ae5ecc18dcd5de2ad775b5be4738b1bfdfc1	["*"]	\N	2024-09-18 12:43:35	2024-09-18 12:43:35
868	App\\Models\\User	196	Personal Access Token	396c0113e8ff897fad90e4d1a1bae24b1e012bd06945bbe9d2eeb0bc9375548f	["*"]	\N	2024-09-18 13:32:43	2024-09-18 13:32:43
869	App\\Models\\User	196	196soorajsooraj@yopmail.com	56a21f40fe4ba4cef653e0421ac9a9c8afa92f13b46cdef0369df411444656ea	["*"]	\N	2024-09-18 13:32:43	2024-09-18 13:32:43
870	App\\Models\\User	192	192Driver DTwod2@mailinator.com	bc562c1128d697158e69237f6132cb637a42c6cdfc0becab1a48ef23a295a3d4	["*"]	\N	2024-09-18 14:35:32	2024-09-18 14:35:32
871	App\\Models\\User	90	90Abdul Ghanidriver@gmail.com	b7fbb65b9aee0248e1a9d131d29be54a864bb408509cd32dee72ba2ef4390d4b	["*"]	\N	2024-09-18 14:37:50	2024-09-18 14:37:50
872	App\\Models\\User	90	90Abdul Ghani7568768768	0befe657e78b0c7aa7307db29e44257eb05315912a55787c26f0e566c1d4a692	["*"]	\N	2024-09-18 14:38:53	2024-09-18 14:38:53
873	App\\Models\\User	90	90Abdul Ghani7568768768	fd0e10483ceef94899029e413fa2f2a2e3194de350c65e25c39f3a91d52d4024	["*"]	\N	2024-09-18 14:45:17	2024-09-18 14:45:17
874	App\\Models\\User	192	192Driver DTwod2@mailinator.com	1d03d09450e6328b4be86129139419ff4ef13734ace00e6aa22e21f960a8a716	["*"]	\N	2024-09-18 15:17:54	2024-09-18 15:17:54
875	App\\Models\\User	192	192Driver DTwo509806534	1c6987e53d87a5b8a3ab27152126fff629555e9928551c2901276e587e4d37f8	["*"]	\N	2024-09-18 15:31:32	2024-09-18 15:31:32
876	App\\Models\\User	138	138test testtestingfordxb@gmail.com	320984012f76178a3c15010cf6b525882540fe348c1c690b78b5a28509184853	["*"]	\N	2024-09-18 15:41:30	2024-09-18 15:41:30
877	App\\Models\\User	138	138test testtestingfordxb@gmail.com	022493686b6a0172541bb71e3f4cacfddc9ada4e9f116feb6a5cc1f9bc3226e9	["*"]	\N	2024-09-18 15:43:26	2024-09-18 15:43:26
878	App\\Models\\User	197	Personal Access Token	8519523d16502dce7bc1401919fae4dba101cc4b57b9ad3077c2a000bce81279	["*"]	\N	2024-09-30 08:33:49	2024-09-30 08:33:49
879	App\\Models\\User	197	197soorajsooraj1@yopmail.com	7aeb855838c7845cc0733350ad96702041c7a48b5b7c4b8d65cd5eeec331a87a	["*"]	\N	2024-09-30 08:33:49	2024-09-30 08:33:49
880	App\\Models\\User	190	190NN Driverd0@mailinator.com	1b602270fdbf0ed8b9e5862b6df3973b285beeb798d36db6a4dfdb4072f558c9	["*"]	\N	2024-09-30 13:52:46	2024-09-30 13:52:46
881	App\\Models\\User	193	193NB CompanyBu9@mailinator.com	69cf15380dd4bb79892befb8c30d2ca4c80fe467911ae4b8293e1fb1e8975add	["*"]	\N	2024-09-30 13:58:31	2024-09-30 13:58:31
882	App\\Models\\User	198	Personal Access Token	ca1e6efe66ecb33bccf8a1c1dd9507f54f1a906953356de6bc0d5c72e1ef4182	["*"]	\N	2025-02-12 13:25:12	2025-02-12 13:25:12
883	App\\Models\\User	199	199Hunain Ahmad.hunainahmad12345@gmail.com	eb86990f84817c4a58ad39f0401e048c870ab6057bc677f44d7265f5ec895213	["*"]	\N	2025-02-12 13:26:20	2025-02-12 13:26:20
884	App\\Models\\User	193	193NB CompanyBu9@mailinator.com	0b7ff755d78e8a9fac0dad17b84ccb3af7ea6c70d95ce6e876e2afa193f3040c	["*"]	\N	2025-02-12 13:27:50	2025-02-12 13:27:50
885	App\\Models\\User	200	200ssghania5bro11@gmail.com	010915750b288c7e2556f01776bc7b74296a8d5e1f7669975f38b898f764758f	["*"]	\N	2025-02-12 13:29:26	2025-02-12 13:29:26
886	App\\Models\\User	199	199Hunain Ahmad.hunainahmad12345@gmail.com	716752da7e6976b3f7429d673b1723429a07a48daf7362311724b15476869fde	["*"]	\N	2025-02-12 13:29:41	2025-02-12 13:29:41
887	App\\Models\\User	201	Personal Access Token	07ca6075db79971f83c72d0a49dbfeefbe37df70103e37b02c7f2d3300da6073	["*"]	\N	2025-02-12 13:31:21	2025-02-12 13:31:21
888	App\\Models\\User	193	193NB CompanyBu9@mailinator.com	9d8d91c1a17c1c7dfbdf14c21aec794bdb8ca458f20256db946f25eb8c28acdd	["*"]	\N	2025-02-12 13:31:30	2025-02-12 13:31:30
889	App\\Models\\User	193	193NB CompanyBu9@mailinator.com	82553a131e10f42e9279fd49bc90670bdace596af5e81300833f61f6e9d10dab	["*"]	\N	2025-02-12 14:08:40	2025-02-12 14:08:40
890	App\\Models\\User	193	193NB CompanyBu9@mailinator.com	b9f681743947635d7962e9f72fd2504179c4c517587430a459b79fae7421cfcf	["*"]	\N	2025-02-12 14:09:30	2025-02-12 14:09:30
891	App\\Models\\User	193	193NB CompanyBu9@mailinator.com	10e49c7c31e72623f80b4b7abf8e9a36b66588abf5d43f4ae42b77e3a2fb7a4e	["*"]	\N	2025-02-12 14:11:38	2025-02-12 14:11:38
892	App\\Models\\User	193	193NB CompanyBu9@mailinator.com	4aa832fd40a330a47a525931f78a3f4e0edfc73f0e582d63def74270520496cc	["*"]	\N	2025-02-12 14:11:41	2025-02-12 14:11:41
893	App\\Models\\User	200	200ssghania5bro11@gmail.com	5ee9dfd49293150684b761fb057d5ec76f2d3c06a58d9ef7292c24edc8b4ebd6	["*"]	\N	2025-02-12 14:11:47	2025-02-12 14:11:47
894	App\\Models\\User	202	Personal Access Token	be77b398770ed65835bbf2cfbdbbb92a5129ee8fbbaa2f9c24ae4b1aca9bfa5d	["*"]	\N	2025-02-12 14:15:36	2025-02-12 14:15:36
895	App\\Models\\User	202	202Navis Cargonavis1@navis1.com	f3649abe9ecdaba995706125d34451cbc80beeff1fa0358c418a5e67782116df	["*"]	\N	2025-02-12 14:15:36	2025-02-12 14:15:36
896	App\\Models\\User	202	202Navis Cargonavis1@navis1.com	da4356703f5342f7dcbb80cf53965409400879e56f633aed53a9bf7cb50fcc0f	["*"]	\N	2025-02-12 14:15:36	2025-02-12 14:15:36
897	App\\Models\\User	193	193NB CompanyBu9@mailinator.com	7b8659609fadb0ec84ce4e8156fef78e5a551b725877d1dafa935c0b623729a8	["*"]	\N	2025-02-12 14:18:53	2025-02-12 14:18:53
898	App\\Models\\User	199	199Hunain Ahmad.hunainahmad12345@gmail.com	76eb972cd2db703e4b2809d97867cbeeac11e2ae0afe283cf467277c4af62097	["*"]	\N	2025-02-12 14:19:14	2025-02-12 14:19:14
899	App\\Models\\User	203	Personal Access Token	cc93b33353ebc04f5f9237c3413d8f6b958ce5a4233633aeb97c39fa73ad89ad	["*"]	\N	2025-02-12 15:06:18	2025-02-12 15:06:18
900	App\\Models\\User	203	203testtestdriver@gmail.con	f12e66b295a33c24fbb4f110a98e96b951798fab4516b50bfff26008602d6bed	["*"]	\N	2025-02-12 15:06:18	2025-02-12 15:06:18
901	App\\Models\\User	204	Personal Access Token	6b0dc182f9c8f8d21c9f247d07cbb6ad192454d78c0f39d7911cf2fe8d46176a	["*"]	\N	2025-02-12 16:26:03	2025-02-12 16:26:03
902	App\\Models\\User	204	204Aniltruck@truck.com	fb4d16a29a71f090b5a36167fe29e21a90253d8d1438be685fd626920d29d100	["*"]	\N	2025-02-12 16:26:03	2025-02-12 16:26:03
903	App\\Models\\User	205	Personal Access Token	2001363df23834ce06ed2933a8265c99233be6858b813e3e0906a2ccc89bf491	["*"]	\N	2025-02-12 16:28:56	2025-02-12 16:28:56
904	App\\Models\\User	205	205test threetestdriver3@gmail.con	36083f5badf76176849e3a1b2c95ab7905484c34ce5d283d730fe5ca6f2d4a04	["*"]	\N	2025-02-12 16:28:56	2025-02-12 16:28:56
905	App\\Models\\User	204	204Anil2245545664	4216638043e8ca7e4f7a5afe29768d73670d2960b9ce2851a25fad7d20a2a217	["*"]	\N	2025-02-12 18:12:19	2025-02-12 18:12:19
906	App\\Models\\User	206	Personal Access Token	21c51aa6ab5ca185af48818e3e3dc5134d1f6c893a8bdfdb9c5c8fcc0644a71a	["*"]	\N	2025-02-12 18:55:18	2025-02-12 18:55:18
907	App\\Models\\User	206	206navisnav@nav.com	6c3984d5f6b0f27bea16034495d903dc3b4556036dc5a8a90ecb590473f2300c	["*"]	\N	2025-02-12 18:55:18	2025-02-12 18:55:18
908	App\\Models\\User	207	Personal Access Token	a228b016c28303d2f6bac5fd8a6cee51a18293f9a89de433c78c173575a1310d	["*"]	\N	2025-02-13 13:31:32	2025-02-13 13:31:32
909	App\\Models\\User	207	207testdriver1@gmail.com	add5bba5209f3dd4b15429691ad569ec6d2e295fa04edeb1ea0c36e4d683e698	["*"]	\N	2025-02-13 13:31:32	2025-02-13 13:31:32
910	App\\Models\\User	204	204Aniltruck@truck.com	157bd9bdf106e0bb07da39a6b1285b4ba4ee41f11eb88d48fb76256d0394d3b3	["*"]	\N	2025-02-13 13:45:33	2025-02-13 13:45:33
911	App\\Models\\User	207	207testdriver1@gmail.com	a33487b01aaa90e24fd588554b88ec3b53181e2d7bc40fe5426b70877244381d	["*"]	\N	2025-02-13 14:15:55	2025-02-13 14:15:55
912	App\\Models\\User	198	198test companytestcompany@gmail.com	7fca018750f0cec0af70b7528fc3876040ed0359e556dc1a319c067a90644501	["*"]	\N	2025-02-13 14:50:55	2025-02-13 14:50:55
913	App\\Models\\User	208	Personal Access Token	4b716eb1e2e116c29747d07e54c3f2cb215bed290173c2c29fa3d85d484ce781	["*"]	\N	2025-02-13 15:38:20	2025-02-13 15:38:20
914	App\\Models\\User	208	208aniltratruck1@truck1.com	517167467d9197af46942f5a2efc7d40b366d970b0a002c1d08096509ddd9f35	["*"]	\N	2025-02-13 15:38:20	2025-02-13 15:38:20
915	App\\Models\\User	207	207testdriver1@gmail.com	c5536c5560cac4bf2812815edb7d6790785114196c5f4713a7d5a713e64d8d3c	["*"]	\N	2025-02-13 16:36:01	2025-02-13 16:36:01
916	App\\Models\\User	207	207testdriver1@gmail.com	87adb993114dbc8eb18c3a089a2d963863a7074a28fbe2839e8a1fd2cf0c10ae	["*"]	\N	2025-02-13 16:40:27	2025-02-13 16:40:27
917	App\\Models\\User	191	191N Companyu1@mailinator.com	6c516a20682efd0a5781a7abc1cc507c052f91aa525dca7e0e00d5c7777f1039	["*"]	\N	2025-02-13 18:25:55	2025-02-13 18:25:55
918	App\\Models\\User	202	202Navis Cargonavis1@navis1.com	420c90cc32c2cec9309c4cac5b6cb8f90bd781862636b16118d15e01ff0be23d	["*"]	\N	2025-02-13 19:01:07	2025-02-13 19:01:07
919	App\\Models\\User	198	198test companytestcompany@gmail.com	264a5c2357982611449b58c20ffc13eb159826af6a8f771677f544a3949a6e29	["*"]	\N	2025-02-13 20:01:56	2025-02-13 20:01:56
920	App\\Models\\User	207	207testdriver1@gmail.com	fbc29867b53e842d72fbfbe3aa60298e24cfd339f9e8051ee9331719e6425809	["*"]	\N	2025-02-13 20:09:45	2025-02-13 20:09:45
921	App\\Models\\User	208	208aniltratruck1@truck1.com	004fec4b7ce19249fc0575b33dca7b0de25f46d5de958c885f92b303a6b11f7e	["*"]	\N	2025-02-13 20:22:04	2025-02-13 20:22:04
922	App\\Models\\User	207	207testdriver1@gmail.com	17b00e4fc811c328445b94937430d9f6df2e4ea895ac281ba120c5a0380c0b28	["*"]	\N	2025-02-13 20:28:44	2025-02-13 20:28:44
923	App\\Models\\User	207	207testdriver1@gmail.com	fa76c251a1f95b87334a2335586834eafc4f0e22e8efcf6364385343d5e12507	["*"]	\N	2025-02-13 21:27:35	2025-02-13 21:27:35
924	App\\Models\\User	209	Personal Access Token	0da0edf6476dffa0d56c434237f0e8de95db9d085d39fae1d425a4e5e549b515	["*"]	\N	2025-02-13 22:02:38	2025-02-13 22:02:38
925	App\\Models\\User	209	209dffgh@gh.com	caf41ee96e731b618d84fec45466079365d35f71d8be1ec1b9d40c1c7af72b8e	["*"]	\N	2025-02-13 22:02:39	2025-02-13 22:02:39
926	App\\Models\\User	209	209dffgh@gh.com	deeec1178a102d20472cd3e6470d73320b40d70e7f43f8c90f13fe5c3ac9b2cc	["*"]	\N	2025-02-13 22:02:39	2025-02-13 22:02:39
927	App\\Models\\User	207	207testdriver1@gmail.com	4d2f1a3ba81c412618caa4e0e6fc85a4f81f2c96a2e835b0c2d57ef3b48a0d38	["*"]	\N	2025-02-13 22:44:43	2025-02-13 22:44:43
928	App\\Models\\User	207	207testdriver1@gmail.com	d48c8e3f37592fcc349131d2cbf0ea4845249ab266ae164763484840df632197	["*"]	\N	2025-02-13 23:17:47	2025-02-13 23:17:47
929	App\\Models\\User	210	Personal Access Token	13946d7dc9d7d912f2d23bcf8eaa5be3e2b5e3d93149247e26af8a07dc92913d	["*"]	\N	2025-02-13 23:51:47	2025-02-13 23:51:47
930	App\\Models\\User	210	210testdriver2@gmail.com	e11d79d0103012a7e72b1afbbe46fdf97a572aeea34211b1796bb90eee30a533	["*"]	\N	2025-02-13 23:51:47	2025-02-13 23:51:47
931	App\\Models\\User	207	207testdriver1@gmail.com	20d0788d40ec3f6b28ba7fc2ffe6a5dd6c5037f04d938023cc26ce00d66a2ed6	["*"]	\N	2025-02-13 23:52:19	2025-02-13 23:52:19
932	App\\Models\\User	198	198test companytestcompany@gmail.com	02b65df550f6dcb17eb62e61ab57c81704b6b0aeffbc9aeff93f571a28526157	["*"]	\N	2025-02-14 02:24:10	2025-02-14 02:24:10
933	App\\Models\\User	198	198test companytestcompany@gmail.com	a2fb628dd3762e6391550ab6e0a5864189fa1699067e67dd787c46ca72e2a4a7	["*"]	\N	2025-02-14 02:43:10	2025-02-14 02:43:10
934	App\\Models\\User	198	198test companytestcompany@gmail.com	8923a29ff5694dc8a17c9d1ae4a1231855ede85fbde9fb35e1a582ea8fe492d7	["*"]	\N	2025-02-14 03:00:08	2025-02-14 03:00:08
935	App\\Models\\User	198	198test companytestcompany@gmail.com	a0cc5dbe292658b8e82cbdf8ac8603bd21dd5341f6df3a078f6e8d75c6adf0a6	["*"]	\N	2025-02-14 03:14:12	2025-02-14 03:14:12
936	App\\Models\\User	198	198test companytestcompany@gmail.com	b44f3c689d676d437abce6c126188fc5b64d54355fc2848f0fb734955fa0735b	["*"]	\N	2025-02-14 03:15:27	2025-02-14 03:15:27
937	App\\Models\\User	198	198test companytestcompany@gmail.com	8947600ee3ac593bb6f8cad6bf2ff40bf7ad31721f94193615c6992a2583e290	["*"]	\N	2025-02-14 03:15:54	2025-02-14 03:15:54
\.


--
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_permissions (permission_id, user_role_id_fk, module_key, permissions, created_at, updated_at) FROM stdin;
71	5	dashboard	["r"]	\N	\N
72	5	customers	["r","u"]	\N	\N
73	5	bookings	["c","r","u","d"]	\N	\N
74	5	earnings	["c","r","u","d"]	\N	\N
75	5	reviews	["c","r","u","d"]	\N	\N
76	5	notifications	["c","r","u","d"]	\N	\N
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, role, is_admin_role, status, created_at, updated_at, deleted_at) FROM stdin;
1	Admin	1	active	2023-07-25 19:46:45	2023-07-25 19:46:45	\N
2	Truck Driver	0	active	2023-07-25 19:46:45	2023-07-25 19:46:45	\N
3	Customer	0	active	2023-07-25 19:46:45	2023-07-25 19:46:45	\N
4	Company	0	active	2023-07-25 19:46:45	2023-07-25 19:46:45	\N
5	Admin Manager	1	active	2023-10-27 10:25:19	2023-10-27 10:25:19	\N
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, contact_number, whatsapp_number, created_at, updated_at) FROM stdin;
1	+971 504326439	+971 504326439	2023-10-20 11:18:31	2025-02-13 18:38:52
\.


--
-- Data for Name: shipping_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_methods (id, name, icon, status, created_at, updated_at) FROM stdin;
1	Freight & Border Charges	64c0b9e5de12c_1690352101.png	active	2023-07-26 10:15:01	2023-12-01 16:05:59
2	DDP	6569cc3ccca8a_1701432380.png	active	2023-12-01 16:06:20	2023-12-01 16:06:20
3	DDU	6569cc4ad145e_1701432394.png	active	2023-12-01 16:06:34	2023-12-01 16:06:34
4	CIF	6569cc552b635_1701432405.png	active	2023-12-01 16:06:45	2023-12-01 16:06:45
5	C&F	6569cc5f700ec_1701432415.png	active	2023-12-01 16:06:55	2023-12-01 16:06:55
6	FOB	6569cc696518a_1701432425.png	active	2023-12-01 16:07:05	2023-12-01 16:07:05
7	Ex Works	6569cc86ec95e_1701432454.png	active	2023-12-01 16:07:34	2023-12-01 16:07:34
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: storage_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.storage_types (id, name, status, created_at, updated_at) FROM stdin;
2	General warehouse (Non AC)	active	2023-08-04 15:38:12	2023-08-04 15:38:12
1	Cold Storage	active	2023-08-04 15:36:01	2023-10-26 11:31:39
\.


--
-- Data for Name: temp_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_users (temp_user_id, truck_type, account_type, name, email, password, dial_code, phone, driving_license, company_id, emirates_id_or_passport, emirates_id_or_passport_back, user_device_type, user_device_token, user_device_id, driving_license_number, driving_license_expiry, driving_license_issued_by, vehicle_plate_number, vehicle_plate_place, mulkiya, mulkiya_number, status, address, country, city, zip_code, latitude, longitude, created_at, updated_at, address_2, role_id, country_id, city_id, user_phone_otp) FROM stdin;
4	2	0	Abdul Ghani	ghaniabro111@gmail.com	abc123	+971	33838383	\N	5	\N	\N	android	882828282	12122112	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-08-15 10:18:47	2023-08-15 10:18:47	\N	0	0	0	0
150	2	0	Muzammal	faridmuzammal7675@gmail.com	Farid@123	92	3446867890	\N	\N	\N	\N	ANDROID	access_token	0c4144052565a266	\N	\N	\N	\N	\N	\N	\N	\N	Business Bay	United Arab Emirates	Dubai	\N	31.55581512	74.27937347	2023-08-17 23:35:24	2023-08-17 23:35:40	H74H+9P2, Captain Jamal Rd, Sanda Lahore, Punjab 54000, Pakistan,	0	0	0	0
107	2	1	Abdul Ghani	ghaniaaabro31@gmail.com	abc123	971	33838385	\N	38	\N	\N	android	882828282	12122112	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-08-16 22:43:16	2023-08-16 22:43:16	\N	0	0	0	0
183	2	0	android tester	android_driver@hotmail.com	Asdfghj@123	27	321456987	\N	0	\N	\N	ANDROID	asd	20a11c1f86eca55f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-07 11:40:38	2023-09-07 11:40:38	\N	0	0	0	0
114	3	1	rajitha	rajitha@gmail.com	Hello@123	971	551493643	\N	38	\N	\N	ANDROID	access_token	45a0e1ce1382dfba	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-08-17 09:17:32	2023-08-17 09:17:32	\N	0	0	0	0
65	2	0	rajita	Rajitharaji1998@gmail.com	Hello@123	971	551794838	\N	5	\N	\N	android	882828282	12122112	\N	\N	\N	\N	\N	\N	\N	\N	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	\N	\N	\N	25.18420692	55.25999263	2023-08-16 12:59:35	2023-08-16 12:59:42	\N	0	0	0	0
158	2	0	Muzammal	faridmuzammal775@gmail.com	Farid@123	92	3317958428	\N	\N	\N	\N	ANDROID	access_token	0c4144052565a266	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-08-18 01:21:18	2023-08-18 01:21:18	\N	0	0	0	0
159	2	0	Muzammal	faridmuzammal7577@gmail.com	Farid@123	27	3317958433	\N	\N	\N	\N	ANDROID	access_token	0c4144052565a266	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-08-18 01:26:27	2023-08-18 01:26:27	\N	0	0	0	0
161	2	0	Muzammal	faridmuzammal75kk@gmail.com	Farid@123	27	3317958499	\N	\N	\N	\N	ANDROID	access_token	0c4144052565a266	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-08-18 01:28:53	2023-08-18 01:28:53	\N	0	0	0	0
164	2	0	Muzammal	faridmuzammal7@gmail.com	Farid@123	27	33179584233	\N	\N	\N	\N	ANDROID	access_token	0c4144052565a266	\N	\N	\N	\N	\N	\N	\N	\N	Business Bay	United Arab Emirates	Dubai	\N	31.55581083	74.27936375	2023-08-18 01:33:42	2023-08-18 01:34:04	H74H+9P2, Captain Jamal Rd, Sanda Lahore, Punjab 54000, Pakistan,	0	0	0	0
165	2	0	Muzammal	faridmuzammal78@gmail.com	Farid@123	27	3317958422	\N	\N	\N	\N	ANDROID	access_token	0c4144052565a266	\N	\N	\N	\N	\N	\N	\N	\N	Business Bay	United Arab Emirates	Dubai	\N	31.55581426	74.27936912	2023-08-18 01:34:33	2023-08-18 01:34:45	H74H+9P2, Captain Jamal Rd, Sanda Lahore, Punjab 54000, Pakistan,	0	0	0	0
173	2	0	Muzammal Farid	faridmuzammal575@gmail.com	Farid@123	27	3317958777	\N	\N	\N	\N	ANDROID	access_token	0c4144052565a266	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-08-20 00:29:51	2023-08-20 00:29:51	\N	0	0	0	0
174	2	0	muzammal	faridmuzammal65675@gmail.com	Farid@123	27	3317958580	\N	\N	\N	\N	ANDROID	asd	0c4144052565a266	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-08-20 00:35:14	2023-08-20 00:35:14	\N	0	0	0	0
178	3	0	vxc	android_driver01@gmail.com	Farid@123	27	321456789	\N	0	\N	\N	ANDROID	asd	20a11c1f86eca55f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-01 20:25:14	2023-09-01 20:25:14	\N	0	0	0	0
179	2	0	muzammal farid	faridmuzammal7yyy5@gmail.com	Farid@123	27	333669999	\N	0	\N	\N	ANDROID	asd	0c4144052565a266	\N	\N	\N	\N	\N	\N	\N	\N	Business Bay	United Arab Emirates	Dubai	\N	31.55569455	74.28033303	2023-09-01 23:38:11	2023-09-01 23:38:47	H74J+877, Sanda Gulshan-e-Ravi, Lahore, Punjab 54000, Pakistan,	0	0	0	0
228	2	0	B test	niya@driver.com	Hello@1985	971	4546546546	\N	\N	\N	\N	android	882828282	12122112	\N	\N	\N	\N	\N	\N	\N	\N	Safa Park - Sheikh Zayed Rd - Al Safa - Dubai - United Arab Emirates	United Arab Emirates	Dubai	\N	25.18543449	55.24619408	2023-10-20 16:12:27	2023-10-20 16:12:41	ABC, DEF	0	0	0	0
182	2	1	Timex	timex@yopmail.com	Hello@1985	27	55134684894	\N	38	\N	\N	ANDROID	asd	e49f374a2b29c439	\N	\N	\N	\N	\N	\N	\N	\N	Business Bay	United Arab Emirates	Dubai	\N	25.18317928	55.27288701	2023-09-07 10:29:57	2023-09-07 10:30:39	Churchill Executive Tower - الخليج التجاري - دبي - United Arab Emirates,	0	0	0	0
187	\N	\N	K L Traders	kl@yopma.com	$2y$10$FUsb7p/ITH/EZGusi1XFhu6V5fHrsGTO73/sNXfOas1dnwpupjS/K	+971	552157894	\N	\N	\N	\N	ANDROID	deviceToken	3764434	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	1	\N	\N	2023-10-07 17:56:57	2023-10-07 17:57:03	ABC DEF	3	1	1	1111
188	\N	\N	D X Technologies	dxt@yopmail.com	$2y$10$kJHQmHObm1a2dm/p5fg2CeIi3YykYNPXdkPZKQmoAd0TZ2ZWhZm.W	+971	551525612	\N	\N	\N	\N	ANDROID	deviceToken	3764434	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	1	\N	\N	2023-10-07 17:59:33	2023-10-07 17:59:33	ABC DEF	3	1	1	1111
190	\N	\N	TST LLC	tst@yopmail.com	$2y$10$TWuy0feRn4tdCtnt.UjOfOAlBe35WrC/59Ep2qSjo3S9MphIVWdZy	+971	55428487878	\N	\N	\N	\N	ANDROID	deviceToken	3764434	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	1	\N	\N	2023-10-09 09:35:21	2023-10-09 09:35:21	ABC DEF	3	1	1	1111
321	2	1	hhh	nbexam.mail@gmail.com	Hello@123	971	984459666	\N	0	\N	\N	ANDROID	dQkWJ4ACSSyw2J2SGL_74C:APA91bGQZ3zujTppFZL8I5jDQNolE6-mdDzY-nHuDqV8PiysO1wMR0hAfAweZyvJYBc5lwItJTr2SQgRucJ-OJ1W4YwvooVFVQodqG5qe13LuYQjaw8ZLbSZIo7ZMeiA5Lr82zbsILop	90ffc91b77d7350f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-11-20 11:42:34	2023-11-20 11:42:34	\N	0	0	0	0
276	2	1	Hello	karanjj@gmail.com	Karan@123	971	1111111111	\N	106	\N	\N	ANDROID	eXg-rkivRuGlan-0DU2LJ5:APA91bGV8Wk_VP1mREP_h4Uum9eHUuyBgmkAE7YV49l-LreXgD1fEnPSi3LfKa-Y5XazcuvncumXDMDSztqCTNq8h_fI0rzQKJ6lQFnVupWpS_6WZCtjAleva7l56TBs_Viyy5NNnE0Q	ade9415fb1d6ef30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-11-16 10:38:30	2023-11-16 10:38:30	\N	0	0	0	0
281	2	1	Hello	Karanjaj@gmail.com	Karan@123	971	5555855858	\N	38	\N	\N	ANDROID	eXg-rkivRuGlan-0DU2LJ5:APA91bGV8Wk_VP1mREP_h4Uum9eHUuyBgmkAE7YV49l-LreXgD1fEnPSi3LfKa-Y5XazcuvncumXDMDSztqCTNq8h_fI0rzQKJ6lQFnVupWpS_6WZCtjAleva7l56TBs_Viyy5NNnE0Q	ade9415fb1d6ef30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-11-16 11:05:29	2023-11-16 11:05:29	\N	0	0	0	0
235	\N	\N	TimeX User	timex@gmail.com	$2y$10$X84ICcDJ1zvpEfrHXotkYeQoTktYUOdJA0NZgNRhVayYAngT3d3NW	+971	3204504505	\N	\N	\N	\N	ANDROID	deviceToken	3764434	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	1	\N	\N	2023-10-24 17:22:55	2023-10-24 17:22:55	ABC DEF	3	1	1	1111
333	2	0	test	test60@gmai.com	Hunain@12	971	36908741997	\N	0	\N	\N	ANDROID	f2QKcRIMQYyy2Sfq-jHcsy:APA91bG4gJFzWYvU2oyQ62dEFVUHI7wDYo0JtOuO3W8iQeoOapbCuqKjOXcCKLmCEmXnHXPW98Ki1-rmHTxJ6Lcn7dYWz7b5RVEj0F6sD34swcV_2I1dJD6QJXytyCkTfymGR-N_rybR	507c25ffbc01d8ae	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-12-04 13:27:09	2023-12-04 13:27:09	\N	0	0	0	0
234	1	0	James	james@gmail.com	Hello@123	92	3204504502	\N	0	\N	\N	ANDROID	cUB4fo_YSxOCEp9wEhOYSu:APA91bFCxU3QoVmHm1bSXYvn9HSONOk7h4rsIKmoa1EuShkAqgzEesLtXATl3LiJqjcelVIKK78kywAwm6WTOLSEeDBbtk7RnIAsRu1fUzWj_3PGXdaADi1EKJ0CEKgZAMW43FK3fKy_	de53e8cce5a1c32d	\N	\N	\N	\N	\N	\N	\N	\N	Business Bay	United Arab Emirates	Dubai	\N	31.489153439337944	73.09940300881863	2023-10-24 11:41:10	2023-10-24 11:41:20	790 B Block, Millat Town Faisalabad, Punjab, Pakistan,	0	1	1	0
236	\N	\N	TimeX User	timexuser@gmail.com	$2y$10$q4aEffU8tDQfjUnCd4pgluq33PUHZKvoLz4ZmtH8a/dYzfBUHol4K	+971	3204504506	\N	\N	\N	\N	ANDROID	deviceToken	3764434	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	1	\N	\N	2023-10-24 17:29:16	2023-10-24 17:29:16	ABC DEF	3	1	1	1111
237	\N	\N	companyOne	company1@gmail.com	$2y$10$E9zhvePFqcNAWMIywyGGveT5ecVIQEWoW7Lsy22NPRakkaD/Onas.	+971	3204504507	\N	\N	\N	\N	ANDROID	deviceToken	3764434	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	1	\N	\N	2023-10-24 17:47:26	2023-10-24 17:47:26	ABC DEF	3	1	1	1111
246	1	0	Sardar	sardar1@gmail.com	Hello@123	971	7439520433	\N	0	\N	\N	ANDROID	cVNntqzOR2asBnU8VoaxuS:APA91bELVm2j9V8iG6Iz53niORarwI3sFzz_Y2CCRT0jJoH7ZKycwc7f8DyOA4NnKrwLCktCvOw_A7aQ85BPjfNCPrx1DG5JtRnCSEx5rOJCPC8Q6FoUjAKuM7xDIfV9vSgthaKDQs-v	81329b1f99e87327	\N	\N	\N	\N	\N	\N	\N	\N	Business Bay	United Arab Emirates	Dubai	\N	23.51826734377466	86.62494789808989	2023-11-07 11:10:46	2023-11-07 11:11:09	GJ9F+6W9, SH 5, Shanka, West Bengal 723133, India,	0	1	1	0
247	1	0	Sartaj Driving	drivera1@gmail.com	Hello@123	971	123456789	\N	0	\N	\N	ANDROID	cVNntqzOR2asBnU8VoaxuS:APA91bELVm2j9V8iG6Iz53niORarwI3sFzz_Y2CCRT0jJoH7ZKycwc7f8DyOA4NnKrwLCktCvOw_A7aQ85BPjfNCPrx1DG5JtRnCSEx5rOJCPC8Q6FoUjAKuM7xDIfV9vSgthaKDQs-v	81329b1f99e87327	\N	\N	\N	\N	\N	\N	\N	\N	Business Bay	United Arab Emirates	Dubai	\N	23.519963093070658	86.62882804870605	2023-11-08 07:58:03	2023-11-08 07:58:51	SH 5, Shanka, West Bengal 723133, India,	0	1	1	0
288	1	0	ggh	f@f.com	Hello@1985	971	556989999	\N	0	\N	\N	ANDROID	coRfApRoQFCeYmDL52ERqH:APA91bE7eUHG0VQDyW28crWgJbJ_M4gTReV51wIco0Tz4RXgE1BB7HryrWmRyMT7S49X0neWYUJUxygLkGTQtMkp6BtFGW9lbxbw60ScYwIlsH5aabVHYaXDhmIrUZw17zJyI3Bgfc7Y	12d4d9f3ec83ed7c	\N	\N	\N	\N	\N	\N	\N	\N	Business Bay	United Arab Emirates	Dubai	\N	25.18429339256761	55.259927585721016	2023-11-16 17:26:48	2023-11-16 17:27:03	801, 8th Floor, Al Manara Building, Al Abraj Street - الخليج التجاري - دبي - United Arab Emirates,	0	1	1	0
290	2	0	test	test22@gmail.com	Hunain@12	971	18898869663	\N	0	\N	\N	ANDROID	fuIw99Z_SvmhGOtNmDyVpv:APA91bH02KXC78y116MhGQ2n_6jD94yRXCEzeWKwP4Kf-3gTKqN1TTmj3VGNMemUKhsCZDVQCousu_A0vTAPQmaUK66TwXv36sbXgj3r8won5krArM_Yx-Gqv4httEEz4ctcYMqa_1r2	d46af26968bfa109	\N	\N	\N	\N	\N	\N	\N	\N	Business Bay	United Arab Emirates	Dubai	\N	33.51640055917509	73.11084598302841	2023-11-16 19:26:08	2023-11-16 19:38:28	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	0	1	1	0
294	2	0	test	test23@gmail.com	Hunain@12	971	36908521452	\N	0	\N	\N	ANDROID	c6Du1Z9vS7-XJdhMzbq6R5:APA91bGSNTKzJ5fCgmCHioR31DCsGDaLdjZ8Mwu30bnOcKh8XjSY2WB8xK2x6tmAh6L4ToQ6fX1TWUo4Rs7-EBEAtNwajOi4H8LVYw5H5d3XHL6BohOlvGBWRL41wUApwmPFfvqW_IHZ	507c25ffbc01d8ae	\N	\N	\N	\N	\N	\N	\N	\N	Business Bay	United Arab Emirates	Dubai	\N	33.56678607598064	73.13681647181511	2023-11-17 11:40:46	2023-11-17 11:42:29	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	0	1	1	0
328	2	0	tst	test50@gmail.com	Hunain@12	971	258096364	\N	0	\N	\N	ANDROID	ebPZqEyJS0asPhqHFZe3_Y:APA91bEjzvnDJr02N4UJ5ye672KnUe7BMboW2e2NNw0c23G5IgI6ff8QCVXlsunsJT-zcqqhGoOmPNhJ6NRcijI7xXc9J15gStdxQffS6M80Um2bWE9Y0CtRM3IRTZZd-neTbjtHU3Ba	507c25ffbc01d8ae	\N	\N	\N	\N	\N	\N	\N	\N	Business Bay	India	Delhi	\N	33.56679948555318	73.13682317733765	2023-11-29 09:57:58	2023-11-29 09:58:05	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	0	2	7	0
330	1	0	jaraab	Karanjahhhh@gmail.com	Karan@123	971	255222222222	\N	0	\N	\N	ANDROID	eXg-rkivRuGlan-0DU2LJ5:APA91bGV8Wk_VP1mREP_h4Uum9eHUuyBgmkAE7YV49l-LreXgD1fEnPSi3LfKa-Y5XazcuvncumXDMDSztqCTNq8h_fI0rzQKJ6lQFnVupWpS_6WZCtjAleva7l56TBs_Viyy5NNnE0Q	ade9415fb1d6ef30	\N	\N	\N	\N	\N	\N	\N	\N	Business Bay	India	Delhi	\N	28.723564834427364	77.24529214203358	2023-12-02 10:39:16	2023-12-02 10:39:29	1/2, Pusta Number 2, Sonia Vihar, Delhi, 110094, India,	0	2	7	0
338	10	0	gh	teste@gmail.com	Hunain@12	971	3685555646	\N	0	\N	\N	ANDROID	f2QKcRIMQYyy2Sfq-jHcsy:APA91bG4gJFzWYvU2oyQ62dEFVUHI7wDYo0JtOuO3W8iQeoOapbCuqKjOXcCKLmCEmXnHXPW98Ki1-rmHTxJ6Lcn7dYWz7b5RVEj0F6sD34swcV_2I1dJD6QJXytyCkTfymGR-N_rybR	507c25ffbc01d8ae	\N	\N	\N	\N	\N	\N	\N	\N	Business Bay	India	Delhi	\N	33.56682490786207	73.13681948930025	2024-06-06 11:24:08	2024-06-06 11:24:18	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	0	2	7	0
337	2	0	N D One	d1@mailinator.com	Hello@123	971	962753963	\N	0	\N	\N	ANDROID	eAvV3P-uS1G_wVIUX8bIB5:APA91bEnNz70tP6HR0t7fAS_geUnrrXkoy-AKkQpesnT_rRHyJDxoCzScmbr5rMFTvF_a7YHXVuwxfNPtFuXNwpEjV3emI2MZ2ileNWpvtFSFrfaCo2h6ErNwde_MIHMxLiXLNvpTE7A	0fa76acc736e0cd2	\N	\N	\N	\N	\N	\N	\N	\N	Business Bay	India	Kolkata	\N	22.489843454930412	88.37031058967113	2024-06-03 10:55:16	2024-06-03 10:55:32	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	0	2	6	0
345	\N	\N	test company	testcompany@gmail.com	$2y$10$Y5h0iof5w.8eFBvhsxrgKeUru.jjWEeRcb6owinkExBCvxJGln.sC	+971	369852147	\N	\N	\N	\N	ANDROID	deviceToken	3764434	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	1	\N	\N	2025-02-12 13:25:04	2025-02-12 13:25:04		3	1	1	1111
306	\N	\N	test	test13@gmail.com	$2y$10$YnbGPVIf4YrfRjcW3wKq/ey4ZnhtlV0bZ31yhuZjcHh1AkbKS2URq	+971	369663258	\N	\N	\N	\N	ANDROID	deviceToken	3764434	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	1	\N	\N	2023-11-18 12:41:11	2023-11-18 12:41:11		3	1	1	1111
346	\N	\N	Navis company	navis@navis.com	$2y$10$glOomjkn3o19kKvI6rs2AOV9dqBJ0W6fVt4X6wPOuLeyogYYI2xKy	+971	222222226	\N	\N	\N	\N	ANDROID	deviceToken	3764434	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	1	\N	\N	2025-02-12 13:31:12	2025-02-12 13:31:12		3	1	1	1111
310	2	0	hhh	hhhh@fhh.com	Hello@123	971	984455666	\N	0	\N	\N	ANDROID	dNzGk3ZbSHGuAHTsUn3_1Q:APA91bG1rVHSb3VUoW7KBZbm9XA0mc-vrbQF-7f0z7-PEiD0fusC77ab5T4t4bxS8xzlvBq7b-uTDy6hCo4WzJ_n_jVZjkSWvtFrfVKvuKB0P6SvRbHak1LY4uhB52Cb4jta_2_dLb-f	90ffc91b77d7350f	\N	\N	\N	\N	\N	\N	\N	\N	Business Bay	United Arab Emirates	Dubai	\N	22.4898688566823	88.37031997740269	2023-11-18 16:23:24	2023-11-18 16:24:36	Dubai	0	1	1	0
311	2	0	test	test26@gmail.com	Hunain@12	971	3690852525	\N	0	\N	\N	ANDROID	dsDAziMOQ666E5LiaYQr3c:APA91bHK1hOthjoMLsBFRqp4XGYKJyai9c1oPmt2pRaCbuUp5QMlslQZSIPTUH8Q43sMjle23LzfdphbWEL8gevmIInFBS0Nef2wzOyPaDnzEEs0HXwkz-UY-XMAEF_MteYo05cNdsq6	507c25ffbc01d8ae	\N	\N	\N	\N	\N	\N	\N	\N	Business Bay	United Arab Emirates	Abu Dhabi	\N	33.56679669189239	73.13681077212095	2023-11-18 16:44:23	2023-11-18 16:44:51	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	0	1	5	0
316	2	1	test	test25@gmail.com	Hunain@12	971	3690852143	\N	0	\N	\N	ANDROID	ebPZqEyJS0asPhqHFZe3_Y:APA91bEjzvnDJr02N4UJ5ye672KnUe7BMboW2e2NNw0c23G5IgI6ff8QCVXlsunsJT-zcqqhGoOmPNhJ6NRcijI7xXc9J15gStdxQffS6M80Um2bWE9Y0CtRM3IRTZZd-neTbjtHU3Ba	507c25ffbc01d8ae	\N	\N	\N	\N	\N	\N	\N	\N	Business Bay	India	Kolkata	\N	33.566787193445094	73.13680540770292	2023-11-20 08:05:47	2023-11-20 08:06:02	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	0	2	6	0
353	8	1	te	testc2@gmail.com	Hello@1985	971	3652178085	\N	0	\N	\N	ANDROID	flqGvaVdTRC5PX6lYQDI-p:APA91bF-SpsOU880jMBFijeu0Ig0TjYijh1QBVFqzOMqlO9EztekIjpBlHFkNJGMzMrX8wtpaSDQcQhJqR9zuhgV9EzXg274zV3ugCogDX1Aw0LCgbF6G4g	c948872a6eac9a75	\N	\N	\N	\N	\N	\N	\N	\N	Business Bay	United Arab Emirates	Dubai	\N	33.566829377717795	73.1367889791727	2025-02-13 12:59:52	2025-02-13 13:00:05	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	0	1	1	0
355	9	1	Anil transport	aniltra@gmail.com	Hello@1985	971	456460464	\N	0	\N	\N	ANDROID	fSsbLqVUS3OrJRNCYp8CBv:APA91bGSdXwrf-gjBQXv7m95Mi4YZQy4yCBRXcOJOQvqcW_z4jOvhG37FgUs_XsHFx-G7CKFQdAc_tpe0q02IzSktbVyRUL3kJMuARKzCQ49aPUYVaULBO7JiiUElsc-8cB31GnUt7Kl	30eb4e7290d67788	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-02-13 15:15:25	2025-02-13 15:15:25	\N	0	0	0	0
\.


--
-- Data for Name: truck_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.truck_types (id, truck_type, type, dimensions, icon, status, created_at, updated_at, max_weight_in_tons, is_container, sort_order) FROM stdin;
4	20 Ft	ftl	2X1X2	653a59386512d_1698322744.jpg	active	2023-10-26 16:19:04	2023-10-26 16:19:04	16	1	0
5	20HC	ftl	2*1.1*1.1*1.0	653a59521ca7d_1698322770.jpg	active	2023-10-26 16:19:30	2023-10-26 16:19:30	21	1	0
6	40 Ft	ftl	4*1.85*1.80	653a596b07138_1698322795.jpg	active	2023-10-26 16:19:55	2023-10-26 16:19:55	26	1	0
7	40HC	ftl	4*1.85*1.8	653a597f2181a_1698322815.jpg	active	2023-10-26 16:20:15	2023-10-26 16:20:15	30	1	0
8	3 Ton Box Truck	ftl	4 X 1.80 X 1.80 M	665d77235246f_1717401379.png	active	2024-06-03 11:51:35	2024-06-03 11:56:19	2.7 Ton	0	4
9	3 Ton Open Truck	ftl	4 X 1.80 X 1.80 M	665d776c06f12_1717401452.jpg	active	2024-06-03 11:57:32	2024-06-03 11:57:32	2.7 Ton	0	5
10	7 Ton Open Truck	ftl	5 X 2.2 X 2.5 M	665d778d5b0c4_1717401485.png	active	2024-06-03 11:58:05	2024-06-03 11:58:05	5.5 Ton	0	6
11	7 Ton Open Truck	ftl	5 X 2.2 X 2.5 M	665d778d656d2_1717401485.png	active	2024-06-03 11:58:05	2024-06-03 11:58:05	5.5 Ton	0	6
12	7 Ton Box Truck	ftl	5 X 2.2 X 2.5 M	665d77b3564a5_1717401523.png	active	2024-06-03 11:58:43	2024-06-03 11:58:43	5.5 Ton	0	7
13	10 Ton Box	ftl	7.5 X 2.4 X 2.65 M	665d77dc0d19c_1717401564.jpg	active	2024-06-03 11:59:24	2024-06-03 11:59:24	8.5 Ton	0	8
14	10 Ton Open	ftl	7.5 X 2.4 X 2.85 M	665d77fbd9668_1717401595.png	active	2024-06-03 11:59:55	2024-06-03 11:59:55	8.5 Ton	0	9
15	10 Ton Curtain Side	ftl	7.5 X 2.4 X 2.85 M	665d781f9f830_1717401631.png	active	2024-06-03 12:00:31	2024-06-03 12:00:31	8.5 Ton	0	10
16	12 M Flat Bed Trailer	ftl	12 X 2.5 X 2.85 M	665d784b34c93_1717401675.png	active	2024-06-03 12:01:15	2024-06-03 12:01:15	21 Ton	0	11
17	12 M Box Truck	ftl	12 X 2.5 X 2.85 M	665d786a36de3_1717401706.png	active	2024-06-03 12:01:46	2024-06-03 12:01:46	21 Ton	0	12
18	13.6 M Box Truck	ftl	13.6 X 2.5 X 2.85 M	665d789c4dd0c_1717401756.png	active	2024-06-03 12:02:36	2024-06-03 12:02:36	18 Ton	0	13
19	13.6 M CurtainTrailer	ftl	13.6 X 2.5 X 2.85 M	665d78b7daa62_1717401783.png	active	2024-06-03 12:03:03	2024-06-03 12:03:03	18 Ton	0	14
20	15 M Box Truck	ftl	15 X 2.5 X 2.85 M	665d78d42d4ac_1717401812.png	active	2024-06-03 12:03:32	2024-06-03 12:03:32	18 Ton	0	15
21	15 M CurtainTrailer	ftl	15 X 2.5 X 2.85 M	665d78f34d822_1717401843.jpg	active	2024-06-03 12:04:03	2024-06-03 12:04:03	18 Ton	0	16
22	15 M Flat bed Trailer	ftl	15 X 2.5 X 2.85 M	665d791185844_1717401873.jpg	active	2024-06-03 12:04:33	2024-06-03 12:04:33	21 Ton	0	17
1	1 Ton Box	ltl	2*1*2	65238ab4eb8c1_1696828084.jpg	inactive	2023-07-25 19:47:10	2024-06-03 16:41:01	1	0	2
\.


--
-- Data for Name: user_additional_phone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_additional_phone (id, user_id, dial_code, mobile, created_at, updated_at) FROM stdin;
3	162	971	123456787	2023-11-29 15:49:52	2023-11-29 15:51:28
5	162	91	2558025800	2023-11-29 22:34:40	2023-11-30 02:07:50
7	168	971	9968646773	2023-12-01 14:29:15	2023-12-01 14:29:15
9	90	971	777777777777	2023-12-02 10:28:04	2023-12-02 10:28:04
10	90	91	8888888888888	2023-12-02 10:28:04	2023-12-02 10:28:04
11	90	92	66666666666	2023-12-02 10:28:04	2023-12-02 10:28:04
12	188	971	992699971	2023-12-04 13:19:17	2023-12-04 13:20:49
14	190	886	8768788888	2024-05-29 15:11:23	2024-05-29 15:11:23
15	190	971	962442366	2024-05-29 15:11:58	2024-05-29 15:11:58
16	192	971	933253699	2024-06-07 11:19:48	2024-06-07 11:19:48
17	194	971	5889655555	2024-07-05 11:44:41	2024-07-05 11:44:41
18	204	971	555755788787	2025-02-12 16:31:49	2025-02-12 16:31:49
19	208	971	536556646	2025-02-13 20:35:31	2025-02-13 20:35:31
20	208	971	363636346262	2025-02-13 22:11:03	2025-02-13 22:11:03
21	208	971	432626263626	2025-02-13 22:11:03	2025-02-13 22:11:03
\.


--
-- Data for Name: user_password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_password_resets (id, email, token, is_valid, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_privileges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_privileges (id, user_id, designation_id, privileges, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_wallet_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_wallet_transactions (id, user_wallet_id, amount, type, created_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_wallets (id, user_id, amount, created_at, updated_at) FROM stdin;
1	16	0	2023-07-26 23:25:43	2023-07-26 23:25:43
2	148	0	2023-11-14 16:53:53	2023-11-14 16:53:53
3	153	0	2023-11-14 16:57:25	2023-11-14 16:57:25
4	154	0	2023-11-15 19:06:51	2023-11-15 19:06:51
5	155	0	2023-11-15 19:06:51	2023-11-15 19:06:51
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, dial_code, phone, phone_verified, password, email_verified_at, role_id, user_phone_otp, user_device_token, user_device_type, user_access_token, firebase_user_key, status, remember_token, created_at, updated_at, deleted_at, provider_id, avatar, address, profile_image, is_admin_access, latitude, longitude, country, city, zip_code, address_2, user_device_id, fcm_token, password_reset_otp, password_reset_time, login_type, country_id, city_id, trade_licence_number, trade_licence_doc, temp_dialcode, temp_mobile, usertype, designation_id, additional_phone, default_iso_code) FROM stdin;
114	Sam	sam@yopmail.com	971	5468736925	0	$2y$10$wnX5ltngZoQkW8/aEC.3Euh8SfjdQCebXhr0.a9HWLiCU5p8F0oqS	\N	2	1111		ANDROID		-Nhk-Hf1t1XKWfwt3fha	active	\N	2023-10-27 07:20:06	2023-11-07 07:09:12	\N	\N	\N	Business Bay	\N	0	25.184232104533816	55.25999128818512	United Arab Emirates	Dubai	\N	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	30eb4e7290d67788	\N	\N	\N	normal	0	0	\N	\N	91	7439520433	0	0	\N	\N
145	NB Com	nbu1@mailinator.com	+971	987466666	1	$2y$10$JoizASi3WxTWvutsdSkAauY9BqUVeFXpNUP0zkeUynet3EdPEkeje	\N	3		f41rronuTiCXZzcCD0t00P:APA91bF4Om7rn-UaTQw2v9HsNjqOlI9YqM6CMoaqex04IQlNin8BI-pO_MkYwPgXMHkp4ly6qCDvsQp-jtSa149tlN_-gynIAIwsFwKbNjqHMW5umd3eJZkx6k6G_LjaUt7JCWq0rPtC	ANDROID	672|Qt62yDA945VgSJ93ybVVF3tjuK1goNQmRHBulcMe	-NjC1gGrgw7YLRpYZBK5	active	\N	2023-11-14 12:55:16	2023-11-17 15:40:33	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
137	Dxb cargo	anil@dx123.com	+971	464664946641	1	$2y$10$wn5X4umA561i5ltt.fknkO7l6xJORnSlFitWAKhQNWIKHBgASmaN.	\N	3			ANDROID		-Nj2HFOg03UNZeBMfhsp	active	\N	2023-11-12 15:27:04	2023-11-18 11:02:06	\N	\N	\N		6550b8284b8e6_1699788840.jpg	0	25.298662820568534	55.37878766655922	\N	\N	1	79XH+HM2 Orchid Tower - Al Nahda St - Al Nahda - Al Qadisiya - Sharjah - United Arab Emirates,	3764434	\N	0	2023-11-16 03:59:27	normal	1	0	6373g83be8	6550b809a9cf9_1699788809.jpg	\N	\N	0	0	\N	\N
97	Driver One	driver1@yopmail.com	971	25442589633	0	$2y$10$l2uQ/o9nmJKjcDzzfD0DdO1p.e6H6W63.9ky1saKt1UjdFY/bJyGO	2023-11-11 14:13:09	2	1111		ANDROID		-NhBUtNva9atciO_OXgH	active	\N	2023-10-20 09:51:51	2023-11-14 08:26:19	\N	\N	\N	Business Bay	653a4fb009f5d_1698320304.jpg	0	25.18423301	55.25999565	United Arab Emirates	Dubai	6565655	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	12d4d9f3ec83ed7c	\N	\N	\N	normal	0	0	\N	\N	971	000000000	0	0	\N	\N
157	Hello	karan@gmail.com	+971	5858585858	1	$2y$10$9XZMbDeb7m3yD9tl9d3SZOPxjvxn0iZDOkHlhcG.anOJDykz5Hcwm	\N	3		foAPrAMbQz6YdREl340KIR:APA91bE4gjf1gs6ggtAXFcnmaNj-sTobO3U9q7fKqEvS5E19tgZH1YkHw1y4JW9b5ISpQ61nubZk3Dc3Bb1R63jqwx0wtLU-siLqmtN6Y985Aol0S5be3pYK20fS4Gy-RxNxZZt-LyRX	ANDROID	814|cf9djCKyrWRvZmtrsWRjT5vribHQ8UtHbWDuVcjY	-NjLiSaePFb5fa8GiDYp	active	\N	2023-11-16 10:03:05	2023-12-02 10:45:48	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	1111	2023-12-02 06:43:39	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
172	test	test12@gmail.com	971	369085264644	1	$2y$10$lvzSk23b6wlXhwLL0xNOqu1a0Y4IlRNmPCYJY3RGsaZxz4NrFhm5y	\N	3		fjbZmS4RTTy5yg-O8xNzN_:APA91bGZVOuUY5NtaKlQIjULkz7ZLT0YywIvVEDJPef0FZBH5Xsqjf4ytHPTNT6O1DYeEGoge1wx_f7Ld-qlvVg-qCiaVifxBSg-m6IJCGsRI8j4Ms-ya5N6fSjQCw7NrkLk-RN19nuo	ANDROID	802|oOikGbzxOiU1jo3ugwWoDeaJuYODNjQYVyQ3ZoWc	-NjWZd3FP2u4XlKhe0vu	active	\N	2023-11-18 12:36:00	2023-12-01 21:02:12	\N	\N	\N		\N	0	\N	\N	\N	\N	1	Dummy	3764434	\N	\N	\N	normal	1	0		\N			0	0	\N	\N
123	rusvink	rusvinmerak1@gmail.com	91	7034526953	1	$2y$10$s28YuyyALJwkgs8S0h4VauEQVo9l3mlTO0/.3W8TODk3qtODQOxaa	2023-11-10 09:11:44	3		\N	\N	436|B9aPA7gYhfZdHKeaNOODUEZZSkTOVLTSHCi5h9Sl	-NisV5Og96w5-ka3Bj8M	active	\N	2023-11-10 13:11:44	2023-11-10 13:31:53	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	social	0	0	\N	\N			0	0	\N	\N
129	test	testdriver9@gmail.com	971	3690852147	1	$2y$10$wG9whzcn8UJJd4W7.GzVcOrBoWeldl94EyZF4tMbGQJpb6e/usWCm	\N	2			ANDROID		-NiurTYQXuH6K9hsUX_i	active	\N	2023-11-10 20:13:06	2023-11-14 18:00:34	\N	\N	\N	Business Bay	\N	0	33.51644025228788	73.11081446707249	United Arab Emirates	Dubai	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	7db5d4dbe030f9f9	\N	\N	\N	normal	0	0	\N	\N			0	0	\N	\N
83	Binsha1	testdriver@gmail.com	971	123528084	1	$2y$10$Jk92LEpNY.xbr4Z718rO7urYpON017DbxnW8G0OyTJG6nIT5qdIfG	2023-11-18 18:36:37	2			ANDROID		-NgwCVpgsYI3TG3B7Z5R	active	\N	2023-10-10 05:35:10	2023-12-26 10:47:43	\N	\N	\N	8CP3+CP7 - Industrial Area_4 - Industrial Area - Sharjah - United Arab Emirates	653a81db9f07c_1698333147.jpg	0	25.3362176	55.4041344	United Arab Emirates	Dubai	88	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	507c25ffbc01d8ae	\N	\N	\N	normal	1	1	\N	\N			0	0	\N	PK
38	Garner Gilbert Traders	vyxecexug@mailinator.com	250	88888888888	1	$2y$10$3h8GMiXxCzk0X3sLTWG9memxvxaoPHCe6BqEQsU8KVTimZKKF/y0O	2023-08-08 09:51:15	4	\N	\N	\N	\N		active	\N	2023-08-08 09:51:15	2023-11-14 16:15:52	\N	\N	\N	4FGX+9X Al Aweer - Dubai - United Arab Emirates	\N	0	25.180615944098218	55.574035817178945	United Arab Emirates	Dubai	10410	Ea id assumenda qui	\N	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
174	Nabro	anil@dxbusinessgroup.com	971	5464694964	1	$2y$10$GxrXV0xP2cieqpWvOXmKWOByEtFnkYVd9onvAxPY44KnbWBlvuimm	\N	3		cC7genStTZ-z8K9-ASXkrW:APA91bHP0VHbU_xoFKryeNfBKsR3fko3neWc7gLvERV_yMzJy-zAozPK86YCZhHmGK-cJTSWyxr3QifxdXyGRzPBX8hYTYpiL0a0AoULRJvaJRkF28HLXAAw0Dm79_LfkYjskB1l7FLA	ANDROID	723|4HgyrD3noZGz8ihdJu3XRYspUjjGNhCFMaqpNbRY	-NjX5PuKN4ssjU01O_s_	active	\N	2023-11-18 15:03:35	2023-11-20 16:23:22	\N	\N	\N	69C3+Q4M - Dubai Festival City - Dubai - United Arab Emirates	65589a98ba391_1700305560.jpg	0	25.2219515	55.3527943	\N	\N	1	69C3+Q4M - Dubai Festival City - Dubai - United Arab Emirates	3764434	\N	\N	\N	normal	1	0	6383883	65589a98b8768_1700305560.pdf			0	0	\N	\N
1	Admin	admin@admin.com	971	112233445566778899	0	$2y$10$JORDyPxs3rcKxnivmintPeMH4KE4bYUg2YaOTS28NTh72BeGoMGVK	\N	1	\N	\N	\N	\N		inactive	\N	2023-07-25 19:46:45	2023-12-06 02:19:13	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
178	NB Company Ltd	nbu5@mailinator.com	+91	9875599669	1	$2y$10$pFEqEoH210PmfiD33fjMJe7r/gasRkzMvNilwiHrvOBeSZLDRFsty	\N	3			ANDROID		-Nja6mRzwtA8g_yAhja0	active	\N	2023-11-19 09:48:02	2023-11-21 04:59:50	\N	\N	\N	City centre mall, Christian Colony, Lodipur, Patna, Bihar 800001, India	6559a1d320144_1700372947.jpg	0	25.204819	77.6322498	\N	\N	1	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	3764434	\N	\N	\N	normal	1	0	9764237899	655b05507cdc4_1700463952.jpg	\N	\N	0	0	\N	\N
166	Dulu DXB	nbu2@mailinator.com	+91	9832831812	0	$2y$10$k68FWQpsePR95ec8iCUgueKMqtdKvWyrBaVLBypTD4nloUsMdnDbO	\N	3	1111		ANDROID		-NjVqsMVyO3cIcMMmeu2	active	\N	2023-11-18 09:16:04	2024-05-28 15:17:45	\N	\N	\N	52, Ananda Pally, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	65584fd421523_1700286420.png	0	25.204819	88.37034344673157	\N	\N	1	52, Ananda Pally, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	3764434	\N	0	2023-11-18 05:21:17	normal	1	0	7426899998	\N	91	98328318113	0	0	\N	\N
42	Abdul Ghani	seftware.testing154@gmail.com	92	03142919267	0	$2y$10$fBRMht16wKAw.wCRd7q.NO3lqPp63LOogeirXSTJYiGdyXrIixsgK	2023-08-09 12:24:11	3	1111	17737373	android	19|j2jJmTnFyNPLwc0IsTIw2JdYibo3uohQ7LEgxt6o		inactive	\N	2023-08-09 12:24:11	2023-08-09 16:24:11	\N	\N	\N		\N	0			United Arab Emirates	Dubai	00000	ABC, DEF DUBAI	18272727	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
115	ghani 33	ghaniabro33@gmail.com	\N	\N	0	$2y$10$flLkfiZTNsNxBjNzOPr78OSQxnpjMrGPijr/jGWZSh9b0Q6zrNTRC	2023-10-27 10:35:03	3	\N	\N	\N	403|xtu9z8b6ewOgd5aDRmgapBAncuO0o3ZuYPvHQPSu	-NhkguX-__pzGdLXi_fm	inactive	\N	2023-10-27 14:35:03	2023-10-27 14:35:04	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
124	rusvink	rusvinmerak2@gmail.com	\N	\N	0	$2y$10$ZdNIwkB3hOCYTFnmaNwK6eKYL9UovbzprM8.7ks9N95Rn4ivYSZVu	2023-11-10 09:31:25	3	\N	\N	\N	434|kPx9bSUh2IE9DYFXYoYo5hws8p7CJLOCQFX5BEnR	-NisZaoLZv6DT5TqHkqL	inactive	\N	2023-11-10 13:31:25	2023-11-10 13:31:25	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	social	0	0	\N	\N	\N	\N	0	0	\N	\N
176	NB Company	nbu4@mailinator.com	+91	984456666	1	$2y$10$DxIpKjKsFDETbEx1ZQDoH.ewNGLRlDcAbdHTQ0a66ntMK4eBh8DRS	\N	3			ANDROID		-Nj_yqMG3e9XsZF0ZsfK	active	\N	2023-11-19 09:08:59	2023-11-20 16:26:48	\N	\N	\N	Dubai International Airport (DXB) - Dubai - United Arab Emirates	\N	0	25.2566466	55.3641488	\N	\N	1	Dubai International Airport (DXB) - Dubai - United Arab Emirates	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
146	Testt	karanjai@gmail.com	+971	8424554646	1	$2y$10$5.UnpzFGVPcvHx9HP9voiOMvvMjlooGaNB5ed9jzx6qzrw7ph4Nxi	\N	3			ANDROID		-NjC4YZABB5awcuOGwpJ	active	\N	2023-11-14 13:07:47	2023-11-16 05:58:02	\N	\N	\N		65537434ccfdc_1699968052.jpg	0	25.20485257399441	55.27078282088041	\N	\N	1	673C+W8M - Dubai - United Arab Emirates,	3764434	\N	\N	\N	normal	1	0	56262662772	65537434cb406_1699968052.jpg	\N	\N	0	0	\N	\N
130	test	testdriver10@gmail.com	971	321258096	0	$2y$10$RihQpXB2.5DjdnCuFb..3.oW3PmMSw8iQ3ePCmYQqQvv3MgPtOrPm	\N	2	1111	dJ7XGG1xRzWaGi-3LvT-oc:APA91bGwG9wVK96aX7lKYEq2xgtSjCmRUWrWy6wRLdPtn37N3bbs_T445Cne4lC-wVpNWPEq4cTz5KebkSDHhteRJg9hbnUA2HDmzOvMLlWDPDbhs38Xe32usqIaxogAK6E-n7j6RA7G	ANDROID	544|Yx4wjAD4mlSWsYw3hjmAVIDpHhQatU6lI71dtQGv	-Nius1HV1XrTdffd_rog	active	\N	2023-11-10 20:15:33	2023-11-14 00:53:18	\N	\N	\N	Business Bay	\N	0	33.51644109087458	73.11082251369953	United Arab Emirates	Dubai	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	7db5d4dbe030f9f9	\N	\N	\N	normal	0	0	\N	\N	971	321258097	0	0	\N	\N
141	Karan	karanjaiswa@gmail.com	+971	892052473	1	$2y$10$pc4xJHpLCGLwkM24aYAwUucwuBFUHXE18q7FOGfDq/DDCrY3RBDlu	\N	3			ANDROID		-Nj7lPvQCOk3weSP_FN_	active	\N	2023-11-13 17:01:20	2023-11-13 13:35:12	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
168	KaranTest	nbd04@mailinator.com	971	2525252525	1	$2y$10$l4mS4KMCS8jseCeT4BtGSu6XrJEAGQcRZNqPBPtviV37UlB47Hdgm	\N	2	1111	eXg-rkivRuGlan-0DU2LJ5:APA91bGV8Wk_VP1mREP_h4Uum9eHUuyBgmkAE7YV49l-LreXgD1fEnPSi3LfKa-Y5XazcuvncumXDMDSztqCTNq8h_fI0rzQKJ6lQFnVupWpS_6WZCtjAleva7l56TBs_Viyy5NNnE0Q	ANDROID	813|yfT8rkbRFEQcb5HK7wfw5I8v40kHipAPiDvLBLpZ	-NjVsopyfxFro4ZWnmc0	active	\N	2023-11-18 05:24:34	2023-12-02 10:40:19	\N	\N	\N	Business Bay	65585339cd18e_1700287289.jpg	0	25.1821950183854	55.25554787367582	United Arab Emirates	Dubai	\N	Unnamed Road - Dubai - United Arab Emirates,	ade9415fb1d6ef30	\N	1111	2023-11-18 05:37:18	normal	1	1	\N	\N			0	0	\N	\N
158	HelloKaran	Karanja@gmail.com	+971	252525252525	1	$2y$10$IgeUBhImzLwrUwuu/TJJD.ppdOa5jhFyo6dqZPw/80wiZEzj2/SJO	\N	3		deviceToken	ANDROID	611|Bad22O3hK3dJsANi60dbx8lX1EOoGMpl65FUDNTK	-NjLlAxBkE62o2A4LzHI	active	\N	2023-11-16 10:14:59	2023-11-16 10:15:00	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
163	test 23	testdriver23@gmail.com	971	36996336901	1	$2y$10$COSH9g9yLZmZVA1FiGUGdeQ4FIyAcdiHopog67WLyqJ.thhu2VSrO	\N	2			ANDROID		-NjRXy017_iyKX0o1YHV	active	\N	2023-11-17 09:10:35	2023-11-18 15:06:51	\N	\N	\N	Business Bay	655842658f3da_1700282981.jpg	0	33.56681764434599	73.13679836690426	United Arab Emirates	Dubai	\N	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	507c25ffbc01d8ae	\N	\N	\N	normal	1	5	\N	\N			0	0	\N	\N
170	test	test24@gmail.com	971	369085236	0	$2y$10$8L/nbaPYal6cmnwbZERbMuzuI8SO.nO5R8hfyi.CgKzVu9JrGXxEO	\N	2	1111	dsDAziMOQ666E5LiaYQr3c:APA91bHK1hOthjoMLsBFRqp4XGYKJyai9c1oPmt2pRaCbuUp5QMlslQZSIPTUH8Q43sMjle23LzfdphbWEL8gevmIInFBS0Nef2wzOyPaDnzEEs0HXwkz-UY-XMAEF_MteYo05cNdsq6	ANDROID	702|0RoghBlnP98qJs7F4rQzRuZughkzIZc2BdqKD6FT	-NjW8byyPrfq_xO2usQf	inactive	\N	2023-11-18 06:37:58	2023-11-18 10:37:58	\N	\N	\N	Business Bay	\N	0	33.566790266472296	73.13681244850159	United Arab Emirates	Abu Dhabi	\N	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	507c25ffbc01d8ae	\N	\N	\N	normal	1	5	\N	\N	971	369085236	0	0	\N	\N
161	test	test20@gmail.com	971	36908525800	1	$2y$10$14ufZHhp3E4kEJZBb.kseeaPmxS2UUUmZROJGjRnmUmi.dl0Q.Wue	2023-11-18 18:23:44	2			ANDROID		-NjOGRc1aMqMT9xQBXg8	active	\N	2023-11-16 17:55:11	2023-11-18 18:23:44	\N	\N	\N	Business Bay	\N	0	33.516402515878255	73.11084296554327	United Arab Emirates	Dubai	673638	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	d46af26968bfa109	\N	\N	\N	normal	0	0	\N	\N			0	0	\N	\N
133	karan	karanjaiswl@gmail.com	+91	8920524739	1	$2y$10$7cIamDYX73PMETNP/IW3juKFj0pdlTsbT9R19ZAREqhVgI2dCIhT6	\N	3			ANDROID		-NizNPKXeDOO5a5QYQix	active	\N	2023-11-11 21:15:29	2023-11-20 16:13:20	\N	\N	\N	7HQP693Q+W5	6551d6ea38a4d_1699862250.jpg	0	25.202055608111618	54.38604935785406	\N	\N	1	7HQP693Q+W5	3764434	\N	\N	\N	normal	1	0	34737787868686	6551e23f98edb_1699865151.jpg	\N	\N	0	0	\N	\N
167	N Biswas	nemai.biswas56@gmail.com	91	9832831813	1	$2y$10$YLp/ZDVcgmmDIb4FdsnAcO31pZTywZZ7JhrWnDjG3EiWHQF7CPKAG	2023-11-18 05:18:43	3			\N		-NjVrU7yrgR2uBUWcbwi	active	\N	2023-11-18 09:18:43	2024-05-29 10:50:23	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	social	0	0	\N	\N			0	0	\N	\N
41	Abdul Ghani	seftware.testing1555@gmail.com	92	03368353584	0	$2y$10$BWdrP5.fBQ99SALZrmng3OtKG3qimiF6HPHXpxXvNMzPv929y42lO	2023-08-09 12:14:01	3	1111	1773737335	android	18|5h2Dh5uWRwdYD64Chm6xZvE1bXs9zFITw23EJVaP		inactive	\N	2023-08-09 12:14:01	2023-08-09 16:14:01	\N	\N	\N		\N	0			United Arab Emirates	Dubai	00000	ABC, DEF DUBAI	1827272775	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
43	android test	android_test01@gmail.com	92	03001234567	1	$2y$10$tOEXh7NxC.0TPugkbRRRUOHJyIxf7g0AQzVeRRwF1HS1kid.dNP6i	2023-08-10 17:14:35	3		17737373	android	21|vGxLZWnX2oUKO7iAuoQP4V2FONVQxO7TeZhbrt7J		active	\N	2023-08-10 17:14:35	2023-08-10 21:16:41	\N	\N	\N		\N	0			United Arab Emirates	Dubai	00000	ABC, DEF DUBAI	18272727	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
45	company test	android_test2@gmail.com	+971	030098765432	1	$2y$10$cVnBUXbbV8SG68qWFiEuRecX.6.O4Owj51x2jzVtQe6Ce4SBxm7Cy	2023-08-12 06:46:45	3		deviceToken	ANDROID	28|1kC9OHghL1V0ppQhgAXQqGVVCZuscXWbxr2wHRuE		active	\N	2023-08-12 06:46:45	2023-08-12 10:47:22	\N	\N	\N		\N	0			United Arab Emirates	Dubai	1	ABC DEF	3764434	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
48	Abdul Ghani	seftware.testing11115@gmail.com	971	3383838400	0	$2y$10$eCG6yxZlHXcxzIWETo9SKOYuEHg7aEH9yWNycrYDzPcY8iSQW7rPi	\N	2	1111	882828282	android	901189625be49b7081b3e7b070b8c43b576b3c1bbbc6f75bfcab30c1d2681c9d		inactive	\N	2023-08-17 18:06:04	2023-08-17 22:13:04	\N	\N	\N	Business Bay	\N	0	25.15285477	55.27328796	United Arab Emirates	Dubai	\N	ABC, DEF	12122112	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
138	test test	testingfordxb@gmail.com	971	369085214	1	$2y$10$.l5vSTsEtRj9R6bbO2fk7epG.rZ84KWNYxdOwZg6Dredf2g9b4Ui2	2023-11-13 05:25:32	3			\N		-Nj685MttsYdGsR7Fh5T	active	\N	2023-11-13 09:25:32	2024-09-18 11:48:48	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	social	0	0	\N	\N			0	0	\N	\N
159	NB Driver	nbd2@mailinator.com	91	987759996	1	$2y$10$JvwfLAKohqHr42PYl7d.RO388/26nNcEFRJJ/oHM6geV1AC.D.T2G	\N	2		dcDV9RDLRQCtfobPdO6K1-:APA91bF9bKTdOYCxFgoRujStVmPHh_zX2DEcW7Kn42CQdj6FmYPbrsrSlkLc0qiTmLufnXlazBZNzKPBC4yV800tWANfxEJ3U4UOhOwwJVuYFERJ_cIIDKMEvMDOQPIhHH_jWOyIm0be	ANDROID	613|GJsk9QMlVAzYLpoeLl6E34Ex5laVIvtfjwWsXGIF	-NjLoH2sKR10efLzSdhS	active	\N	2023-11-16 06:28:31	2023-11-16 06:29:03	\N	\N	\N	Business Bay	\N	0	22.489841596265464	88.37032835930587	India	Abu Dhabi	\N	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	350910f03cd8ff92	\N	\N	\N	normal	0	0	\N	\N			0	0	\N	\N
116	ghani 33	ghaniabro34@gmail.com	\N	\N	0	$2y$10$0xtZ8Nz4e3aqUmFNPPt8uO6NiSnuNbYMMFe6sT28RQgA1p1d1MhA.	2023-10-27 10:35:58	3	\N	\N	\N	404|2pG47eomWu9n7GsTVLHS4FDto8ghM35Rc8MUgzDd	-Nhkh6z46ceZOw3Qev9-	inactive	\N	2023-10-27 14:35:58	2023-10-27 14:35:59	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
142	test	karanjais6@gmail.com	+971	000000000	1	$2y$10$msIEX6PIzaVHNZErcQgPueyJOk2h2SYOKyXsqLJ97L15wKyh1SFG.	\N	3			ANDROID		-Nj84lDADlBAnHfazMXP	active	\N	2023-11-13 18:30:14	2023-11-14 17:02:50	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
125	rusvink	rusvinmerak123@gmail.com	\N	\N	0	$2y$10$lVSsHqZmNqIZ2JKihJo5wuO7HkB8i8rkhToY5i/mdd3N4VLiQoOMe	2023-11-10 09:32:08	3	\N	\N	\N	438|qK0uZNuJjbueh1p3Wck9PObSsbyFRZZXqkeiuUhq	-NisZlOPaGA5kmlTP6dK	inactive	\N	2023-11-10 13:32:08	2023-11-10 13:32:09	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	social	0	0	\N	\N	\N	\N	0	0	\N	\N
147	karan	driver3@yopmail.com	44	232	1	$2y$10$nib9o0Fdg5yvXBvdpyrOzu4lzHRHinb2Bd2Zlbcp5ZGJLptaaezpO	2023-11-15 16:06:14	5	\N	\N	\N	\N	\N	active	\N	2023-11-14 16:35:44	2023-11-15 16:06:14	\N	\N	\N	1/2, Pusta Number 2, Sonia Vihar, Delhi, 110094, India	\N	1	28.7235744	77.2452661	\N	\N	\N	\N	\N	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
39	Abdul Ghani	seftware.testing15@gmail.com	92	03142919268	0	$2y$10$EouBszskiyGsJFsswTD/0uO1XIowXm42a3DnxE9muiKXwFAssIUDa	2023-08-09 12:08:05	3	1111	17737373	android	16|UAQUrbvaSiea6oh36XHAWrabnGScMzc6B2PtkeYG		inactive	\N	2023-08-09 12:08:05	2023-08-09 16:08:06	\N	\N	\N		\N	0			United Arab Emirates	Dubai	00000	ABC, DEF DUBAI	18272727	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
131	karan jaiswal	karanjaiswal@gmail.com	44	2122121222	1	$2y$10$cqFxxg5d.xibNC4ZBj4hTOBkI67oXPyKc7P1d/mvNZzTtvap/0NfW	2023-11-21 11:32:44	5	\N	\N	\N	\N	\N	active	\N	2023-11-11 13:26:30	2023-11-21 11:32:44	\N	\N	\N	P6FW+F6C, Pusta Number 2, Sonia Vihar, New Delhi, Delhi, 110094, India	\N	1	25.204819	77.2453425	\N	\N	\N	\N	\N	\N	1111	2023-11-13 12:59:45	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
47	Abdul Ghani	seftware.testing1115@gmail.com	971	338383831	0	$2y$10$CCcHOHUBQFpZeHrEODuuO.WOhOw9I2dgfggke3oWHjQL9nGALZnMi	\N	2	1111	882828282	android	93df40f418ab81d45678dcf7a0912fba3bd05d523f3e598f2c845a69bf2e76d1		inactive	\N	2023-08-17 14:50:05	2023-08-17 18:50:05	\N	\N	\N	Business Bay	\N	0	25.15285477	55.27328796	United Arab Emirates	Dubai	\N	ABC, DEF	12122112	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
162	test	testdriver21@gmail.com	971	096325803	1	$2y$10$J7CnAkq8fFtSPWzZzxj86.nmKoWvO45wmq.raZD02wmDQU9rW0sh2	\N	2	1111		ANDROID		-NjQzJgtBwfNM8eppya8	active	\N	2023-11-17 06:34:51	2023-12-02 12:07:20	\N	\N	\N	Business Bay	\N	0	33.56679501569591	73.13681915402412	United Arab Emirates	Dubai	\N	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	507c25ffbc01d8ae	\N	\N	\N	normal	0	0	\N	\N			0	0	\N	PK
139	NbDriver	nbd1@mailinator.com	971	984569999	1	$2y$10$zaaHnhHSbaq3Qu4jHP3NJu3PEeCCHOyROgpWgyZJyYde0ccrwkfVq	\N	2			ANDROID		-Nj6DMJGaMjUORVpaJ6t	active	\N	2023-11-13 05:48:33	2023-12-04 10:51:44	\N	\N	\N	Business Bay	655371720b169_1699967346.png	0	22.48671218863566	88.36844108998775	United Arab Emirates	Dubai	\N	P-40, Pallisree Po, Regent Estate, Kolkata, West Bengal 700092, India,	350910f03cd8ff92	\N	\N	\N	normal	0	0	\N	\N			0	0	\N	IN
50	Abdul Ghani	seftware.testing090@gmail.com	92	3094172405	0	$2y$10$YZvr2bPBieI0ijcF/UHAfuLKh1Oikh2be5WY/iwx8J.KDUWoUwCEu	\N	2	1111	882828282	android	27ceea1ce3f576923dc45aaa8957ee05a9a25e1fa7dbb3fa487e946fad79812d		inactive	\N	2023-08-17 19:46:58	2023-08-17 23:46:58	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	12122112	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
164	karan Jaiswal	karanjaiswal2796@gmail.com	971	2222222222	1	$2y$10$9BuQ.LzatGFz.Y5MvrZHTuKT0/x1ZhAocxeDAxgR34A7rV0rMco4y	2023-11-17 09:25:33	3			\N		-NjRaOFLOEEjL7wM6CKj	active	\N	2023-11-17 13:25:33	2023-11-17 10:39:02	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	social	0	0	\N	\N			0	0	\N	\N
134	DX App	appdx0911@gmail.com	971	996666966	1	$2y$10$5iGDcXDin/4omJInqQ6eM.hNclNXG5GnrR/PexnrJm0t8/p3m4TEa	2023-11-11 17:32:12	3			\N		-NizREBL5Q1EB_3Ore3m	active	\N	2023-11-11 21:32:12	2023-11-18 05:18:32	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	social	0	0	\N	\N			0	0	\N	\N
40	Abdul Ghani	seftware.testing155@gmail.com	92	03142919269	0	$2y$10$FDvHU9M91PhPE7xoG/DRKuEnWqKjZLo0O5rhnOq1XT5Di00zY7/RG	2023-08-09 12:12:57	3	1111	177373733	android	17|Doe3Jh6PfXQI6hDxR1JkwerBEF0hsAe5XbwXfwYM		inactive	\N	2023-08-09 12:12:57	2023-08-09 16:12:58	\N	\N	\N		\N	0			United Arab Emirates	Dubai	00000	ABC, DEF DUBAI	182727277	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
51	Muzammal	faridmuzammal75@gmail.com	92	3317958427	0	$2y$10$STHtEc6.XOyM1DS1OQW4WOKYcXcrXZHjhlwaTD2BOXhG7DIxf3Oa6	\N	2	1111	access_token	ANDROID	3c2ed1300493d28f01f9fe1ae517f83ba707587a0b053c6931eca8e62b67f045		inactive	\N	2023-08-17 21:02:22	2023-09-09 21:29:29	\N	\N	\N	Business Bay	\N	0	31.55581769	74.27936409	United Arab Emirates	Dubai	\N	H74H+9P2, Captain Jamal Rd, Sanda Lahore, Punjab 54000, Pakistan,	0c4144052565a266	\N	0	2023-09-09 17:29:07	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
37	Abdul Ghani	ghaniabro11@gmail.com	92	3142919268	1	$2y$10$JErk2i3TAp1NphNohP.atuXJl.pacgGQotEHgDODG1XUXcE6XrFeK	\N	2		882828282	android	78|pumn6kXlYuzv3Pc9cHGsfRYW9ibxXn3XPdeLp1WB		active	\N	2023-08-04 20:32:36	2023-08-21 09:33:41	\N	\N	\N	\N	\N	0	\N	\N	United Arab Emirates	Dubai	9877	Street 02 Northern Creek	12122112	\N	1111	2023-08-21 05:33:41	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
49	Abdul Ghani	seftware.testing00@gmail.com	92	3094172404	0	$2y$10$JRhem14.C7Um36sxvqW/VeNqmCPUdnUa3FSDLsTW/SfmHr1oBkbsS	\N	2	1111	882828282	android	da2eabf2707fd86f541d770519159d6113e97937918f43480a70f83e8ba65166		inactive	\N	2023-08-17 19:33:04	2023-08-17 23:33:04	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	12122112	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
46	Abdul Ghani	seftware.testing15555@gmail.com	92	033683535845	0	$2y$10$KHz7b54NHRxC6KRDf6XmIeMyBy1jo9xMAsR.sfYzQo/6Ibo29AjuO	2023-08-12 10:51:10	3	1111	17737373355	android	29|vGwTyWBcDf9gICEOeQvrRfqtf0ZbPGTA19YwdXYj		inactive	\N	2023-08-12 10:51:10	2023-08-12 14:51:10	\N	\N	\N		\N	0			United Arab Emirates	Dubai	00000	ABC, DEF DUBAI	18272727755	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
44	Android Test2	android_test1@gmail.com	92	030012345678	1	$2y$10$x8N2obZrqOsTVyg3Lg8rzeEaKTRxsDZ23NJopH5NPrlVkmnGJn4Em	2023-08-12 05:15:57	3	1111		android	96|rb2l6zxYqlCfL8NKOIqZjvol6AeC20ourgQcGuYT		active	\N	2023-08-12 05:15:57	2023-09-04 22:03:57	\N	\N	\N		\N	0			United Arab Emirates	Dubai	00000	ABC, DEF DUBAI	18272727	\N	0	2023-08-19 13:06:47	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
52	Muzammal	faridmuzammal751@gmail.com	27	3317958430	0	$2y$10$xDTIkSreokXkHdQzRB2qVu/vJQqvfV8AkqIqU5/L13XGrtfUH5246	\N	2	1111	access_token	ANDROID	ecc00382cff5a309a956941191ea916838d7a72ddbb5edc204dfbd029c4afcc7		inactive	\N	2023-08-17 21:44:02	2023-08-18 01:44:03	\N	\N	\N	Business Bay	\N	0	31.55581340	74.27936476	United Arab Emirates	Dubai	\N	H74H+9P2, Captain Jamal Rd, Sanda Lahore, Punjab 54000, Pakistan,	0c4144052565a266	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
61	Muzammal	faridmuzammaluu75@gmail.com	92	3317958333	1	$2y$10$arFGOaZdVWmHYMp7dmBJB.CmrRdQ8w3RgJkacsFXcOCyHXQmnNEje	\N	2		access_token	ANDROID	826b01f125474cca2993d2bd7e21b30f1a4d11b8229c86ebaec0f6105281f992		active	\N	2023-08-18 11:11:29	2023-08-18 11:11:40	\N	\N	\N	Business Bay	\N	0	31.55581283	74.27936342	United Arab Emirates	Dubai	\N	H74H+9P2, Captain Jamal Rd, Sanda Lahore, Punjab 54000, Pakistan,	0c4144052565a266	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
57	timerx	timerx01@gmail.com	+971	3441568887	1	$2y$10$lOfUBid68m/BGpGirPVAM.CJNIztbz9oqaFYeLvSmRGhs/uGhYhsq	2023-08-18 05:09:12	3		deviceToken	ANDROID	58|nKcQOxuGXHGwMLSQ9B1H4PXtDIuS51zcr8oGtixI		active	\N	2023-08-18 05:09:12	2023-08-18 09:32:55	\N	\N	\N		\N	0			United Arab Emirates	Dubai	1	ABC DEF	3764434	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
53	Hamid	razahamid34@gmail.com	+971	3441562554	0	$2y$10$0gBL0kONigZYbTOa.xOBg.hsuMvrL5A3uPLiv15Bh7mPKCovVlTui	2023-08-18 04:28:14	3	1111	deviceToken	ANDROID	53|07N7Xu9xg7Jh7W5Y41vLJmiFTs3aaNcQFZXGHiNB		inactive	\N	2023-08-18 04:28:14	2023-08-18 08:28:14	\N	\N	\N		\N	0			United Arab Emirates	Dubai	1	ABC DEF	3764434	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
54	Hamid Iqbal	razahamid37@gmail.com	+971	3664545454	0	$2y$10$3XDHryCVF.K7U96Jz2JDU.0EqfnU/d0CrUC1KLA2Z0CueE/natY9i	2023-08-18 04:29:29	3	1111	deviceToken	ANDROID	54|3oWpqUwaLCcrYDl4ai3VFqW5vDtY3eduA0IqtSXW		inactive	\N	2023-08-18 04:29:29	2023-08-18 08:29:29	\N	\N	\N		\N	0			United Arab Emirates	Dubai	1	ABC DEF	3764434	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
65	Muzammal Farid	faridmuzammal175@gmail.com	92	3317087908	1	$2y$10$9eLenb4YI0JEeZALdWPqguxtBkFYLiR2a5cNkSdtzjICr4nFxc4o.	\N	2		access_token	ANDROID	81|zTpXJ5dxv2DNEOAowq5kBKhANKiL4mlgtNCaYqLU		active	\N	2023-08-19 19:19:36	2023-08-21 14:51:15	\N	\N	\N	Business Bay	\N	0	31.55581540	74.27937347	United Arab Emirates	Dubai	\N	H74H+9P2, Captain Jamal Rd, Sanda Lahore, Punjab 54000, Pakistan,	0c4144052565a266	\N	0	2023-08-21 10:50:49	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
63	Android dxb	android_test6@gmail.com	+971	3009633577	1	$2y$10$4lYJTkAesmjP0dSoCeK1iO9JsKU5f/X6FfofTD1/4NckG0ItC6PYW	2023-08-18 11:55:13	3			ANDROID			active	\N	2023-08-18 11:55:13	2023-08-19 12:26:47	\N	\N	\N		\N	0			United Arab Emirates	Dubai	1	ABC DEF	3764434	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
55	Hamid Iqbal	razahamid39@gmail.com	+971	346464694	0	$2y$10$R0nmwS7xFTVP.frDxF047efJlw0tdJCglQAy5fl8oNNNhOWPrvXNq	2023-08-18 04:30:31	3	1111	deviceToken	ANDROID	55|FTE4l9sYHncORC9M5DrwjJRZHvS4O3xb3vPVgmCQ		inactive	\N	2023-08-18 04:30:31	2023-08-18 08:30:32	\N	\N	\N		\N	0			United Arab Emirates	Dubai	1	ABC DEF	3764434	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
62	Android dxb	android_test4@gmail.com	+971	3008521476	0	$2y$10$RWzXvLNYNM2O1GN1Sqc8uu9gvzMPjP7aE1uN5YdLUl7M045LPztL.	2023-08-18 11:53:35	3	1111	deviceToken	ANDROID	73|nVBgELS4jncmnPQGizmPOjdoLLlcGU0w0IohsdZT		inactive	\N	2023-08-18 11:53:35	2023-08-18 15:53:36	\N	\N	\N		\N	0			United Arab Emirates	Dubai	1	ABC DEF	3764434	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
60	android dxb	android_test3@gmail.com	+971	3007412586	1	$2y$10$o9vFgnXZWNziqzj1TSfEkuQS8hLwUTKDJbqTunyrJuoN.BUMKwHq6	2023-08-18 10:39:42	3			ANDROID			active	\N	2023-08-18 10:39:42	2023-08-18 10:44:44	\N	\N	\N		\N	0			United Arab Emirates	Dubai	1	ABC DEF	3764434	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
56	Hamid Iqbal	razahamid40@gmail.com	+971	346464664	1	$2y$10$SbEzyvQslSgSMAnCrPxak.5VpbckKEdO.C/FzSixIwfl02No6k6KG	2023-08-18 04:34:23	3		deviceToken	ANDROID	56|cy1SnbevjjG2KwGLre4g8qEKjlAh1Ch0Z3vuKHcI		active	\N	2023-08-18 04:34:23	2023-08-18 04:34:38	\N	\N	\N		\N	0			United Arab Emirates	Dubai	1	ABC DEF	3764434	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
59	Devika	devikasr1995@gmail.com	27	502693489	1	$2y$10$0o/yCsMYt6Tf/W.wcsLY6O.LifbOVDaHYLq5mh2KbVCMOaQVII3rK	\N	2		access_token	ANDROID	66|dOoifrQYLxLONttdr0m8QLSR8M0q9eq7SMiXdIFh		active	\N	2023-08-18 09:02:22	2023-08-18 13:10:57	\N	\N	\N	Business Bay	\N	0	25.00001951	55.02600309	United Arab Emirates	Dubai	\N	Mina Jebel Ali - Dubai - United Arab Emirates,	ff0754b079f2853d	\N	1111	2023-08-18 09:10:57	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
66	muzammal Farid	farid@gmail.com	92	6317958427	1	$2y$10$txnAsyW9LkoLL466fA3LAOi9TN67BF.qxBY7vLq/pVfS66zwXd4Se	\N	2			ANDROID	86|D0h5aH1rZnb31IF97ujVdkggkOxnPsVIGNIG4A2S		active	\N	2023-08-19 22:28:54	2023-08-21 16:21:09	\N	\N	\N	Business Bay	\N	0	31.55581283	74.27936912	United Arab Emirates	Dubai	\N	H74H+9P2, Captain Jamal Rd, Sanda Lahore, Punjab 54000, Pakistan,	0c4144052565a266	\N	0	2023-08-21 10:45:18	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
64	Muzammal	faridmuzammal7y5@gmail.com	27	3317958147	1	$2y$10$JR4BsVcvrma.QdzWon/46OvmlmCFJ9cwVBs4HNFVLkW7tumEoVvhu	\N	2		access_token	ANDROID	311b50a08db9a87cccff984462ec0878e154fb16f8833c0bcb01a805e85fbd4f		active	\N	2023-08-18 15:38:18	2023-08-19 19:14:42	\N	\N	\N	Business Bay	\N	0	31.55588283	74.27935436	United Arab Emirates	Dubai	\N	H74H+9P2, Captain Jamal Rd, Sanda Lahore, Punjab 54000, Pakistan,	0c4144052565a266	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
58	Muzammal	pyxiscoding@gmail.com	92	3317958567	1	$2y$10$sW5q6bDp12H/bKosckKmBuLXH77xUVovSppiAyoUC9jLyLnsUUaXe	\N	2		access_token	ANDROID	64|XZQKlY6RLdJpymADBhSlVF3eFZM1D7ZyqB9eFJzx		active	\N	2023-08-18 08:27:50	2023-08-19 23:15:13	\N	\N	\N	Business Bay	\N	0	31.55581883	74.27937079	United Arab Emirates	Dubai	\N	H74H+9P2, Captain Jamal Rd, Sanda Lahore, Punjab 54000, Pakistan,	0c4144052565a266	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
67	Android Test5	android.testing5@gmail.com	92	03001111111	1	$2y$10$1ZBZBbaCbHuJR5BGWYN.8.OBpbgqRwJTahnFofLhXawiW.RF1dfh2	2023-08-21 16:33:41	3		17737373	android	88|lsu5f8jB7Cc51tnkWkAgdDo98InRaiYAhM13yljx		active	\N	2023-08-21 16:33:41	2023-08-21 20:34:40	\N	\N	\N		\N	0			United Arab Emirates	Dubai	00000	ABC, DEF DUBAI	18272727	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
148	test	test@gmail.com	92	3202244556	1	$2y$10$cZrm09n7y3rgFrL/m38hauIC/tJ63TeffHaEtV672hrLFE/7w819e	2023-11-14 16:53:53	3	\N	\N	\N	\N	\N	active	\N	2023-11-14 16:53:53	2023-11-14 16:53:53	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
68	Abdul Rahman khan	abdul@gmail.com	27	333777999	1	$2y$10$tZUQqbE1aD0yWlCcoeHVWuSGANfucud80MuwMXjN3TEp9vK7M9r1K	\N	2		asd	ANDROID	7d168cb1e15794077f9f29bd5a3d48fda2a09a6b144784acf71a0f5fb135658b		active	\N	2023-08-31 20:18:04	2023-08-31 20:18:16	\N	\N	\N	Business Bay	\N	0	31.55581426	74.27938286	United Arab Emirates	Dubai	\N	H74H+9P2, Captain Jamal Rd, Sanda Lahore, Punjab 54000, Pakistan,	0c4144052565a266	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
69	test driver	test_driver1@gmail.com	971	456321789	1	$2y$10$61q8R/tHiNmQNQIzAvk3lOVR2C88kPWGJV6IcUbrhHDPQKqV1H9Ay	\N	2		asd	ANDROID	ac81b68ca99f64df4491e585aef873dfa52b636fd13f55e1b5ec6d12982de954		active	\N	2023-09-02 05:04:44	2023-09-02 05:04:57	\N	\N	\N	Business Bay	\N	0	32.07691734	73.67632806	United Arab Emirates	Dubai	\N	3MGG+QRC, Kolo Tarar Rd, Hafizabad, Punjab, Pakistan,	20a11c1f86eca55f	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
72	Binsha Mb	deepika@gmail.com	92	6565656556	1	$2y$10$psy6PfrjTfPtfrcL.IqQD.xQk04IoAel6M8Yhdy0bwFUFBQaAhx9.	\N	3		17737373	android	99|cDjpTcThSHcQ2dkAyxiwRxf6GXLyvqj2Jvu0Q5Do		active	\N	2023-10-07 08:36:09	2023-10-07 08:36:10	\N	\N	\N		\N	0	\N	\N	\N	\N	54364654	ABC, DEF DUBAI	18272727	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
76	tesDev	test@gmail.con	+971	0900786012	1	$2y$10$46CghADdxWXNgEq/sVP4e.qnUQVqvzRgzkiEeme5RsFQ1rU.HcxYC	\N	3		deviceToken	ANDROID	116|8M9aYRkMIXkDMPBsrggawxoM4s8vh3gfBrY8FII7		active	\N	2023-10-09 08:51:03	2023-10-09 08:51:03	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
70	DX	dx@yopmail.com	+971	5248866658	1	$2y$10$fr.KE80ZSZ/DXdlpHj5vNeuoOAB7snrBIcpkePCzvwQPuwMnokgjS	2023-09-04 07:56:08	3			ANDROID			active	\N	2023-09-04 07:56:08	2023-09-05 05:27:01	\N	\N	\N		\N	0			United Arab Emirates	Dubai	1	ABC DEF	3764434	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
79	FRP	fep@yopmail.com	+971	5428486767	1	$2y$10$/OlGPr2blsPohDI/qqYlHeh1q.KaB/Wandwect6UoWnuwpm3xK1EO	\N	3		deviceToken	ANDROID	130|tnnKi8oIYKAF5WkDbKKVW2HeYvTav6dvwuFE5e8X		active	\N	2023-10-09 17:08:05	2023-10-09 17:08:06	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
75	Mahima Cherian	mahima@dxbusinessgroup.com	+971	55424884664	1	$2y$10$VLK.FMOa3dO1NTAaXLaGLe8/6xQuLQlMfH8ygWMBLbKDvUFFOklJO	2023-10-07 10:07:53	3			ANDROID			active	\N	2023-10-07 10:07:53	2023-10-07 13:56:23	\N	\N	\N		\N	0			United Arab Emirates	Dubai	1	ABC DEF	3764434	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
78	Perls	perls@yopmail.com	+971	554251884	1	$2y$10$0GeAqCeHYNohqIkkw.5hfeD6bsKLMAPzwU1hqBOw/I5onYOjFnXCe	\N	3		deviceToken	ANDROID	131|w9PdwYG8OywE9Q4uem7WmIh0qkuoDp8dd2p1k4Yu		active	\N	2023-10-09 17:06:38	2023-10-09 17:08:25	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
77	testDev two	test2@gmail.com	971	1470852333	0	$2y$10$z2fEBoMYCWGdzdaHvu1n0uk1wlAYJveThto6zG3l6tp.Y3p2vj4TG	\N	3	1111		ANDROID			active	\N	2023-10-09 15:58:48	2023-10-10 10:40:26	\N	\N	\N	Street 02 Northern Creek	652512790e5c6_1696928377.jpg	0	24.828038293264758	55.591169515385324	United Arab Emirates	Dubai	00000	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	3764434	\N	\N	\N	normal	1	0	090900909090	652512790ce5a_1696928377.jpg	\N	\N	0	0	\N	\N
80	test three	test3@gmail.com	+971	0987456321	1	$2y$10$Xe2LGZIOAgw0M9XyB/kLe.Y27qaVO3.KB0Z0yqAzqr4aOU04RXOfe	\N	3		deviceToken	ANDROID	143|6c1ciR2iOIY4lG2BIrdtqv88N8JJe9sBPhVzZ3vN		active	\N	2023-10-10 01:32:27	2023-10-10 01:32:28	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
81	test four	test4@gmail.com	+971	1470852147	1	$2y$10$dfmaPHcoSBzMCPU4O9ykoOPwiFqZBNGrz9oXz9X5f90GPlI2biiyG	\N	3		deviceToken	ANDROID	146|XrbeOmpHlmVqQomZAUcX4g3tv3JnKSro4ziA8kcq		active	\N	2023-10-10 01:43:06	2023-10-10 01:43:07	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
82	test five	test5@gmail.com	+971	3211232123	1	$2y$10$SVw9ldTDa4ICRSlgNlavu.UiZSYjs6bZMx.3KZZ9Xes2x/jiCzMKu	\N	3			ANDROID			active	\N	2023-10-10 01:48:31	2023-10-10 13:21:42	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
71	android tester	android_driver12@hotmail.com	27	321456988	1	$2y$10$u9U4BgTzpOKfXhq27L8szuOGXyXq7AUllU4B5tFBn0Kw5EOWfsOp6	\N	2		882828282	android	213|H3BLXYdvrorVmRo73lHGkJxDHTjpOPKAE4tRKSuh	-NgwneJ5hfWATnoiOHNY	active	\N	2023-09-07 07:43:48	2023-10-17 15:11:43	\N	\N	\N	Business Bay	\N	0	31.49363000	74.41718135	United Arab Emirates	Dubai	\N	Divine Mega 2, Ghazi Rd, Gulshan e Ali Colony, Lahore, Punjab, Pakistan,	20a11c1f86eca55f	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
84	D X Technologies	dxbapps@yopmail.com	+971	5515256547	1	$2y$10$cqjbFJUOSZ2/wgjhBd1tuOpdBW/whWUu3tUXXDh2ewyQathBjsxCO	\N	3		e0n5k_nHRZCGtWaMeFf2K_:APA91bFeoXy7TIvZBYSLOpBzhz0rpiGHFpLQ9snYnwBwrA6aiRPf4IstK14hErewairH-6M7hRGo2UPM-Ojij0ebpaMm27fnnwBIvPscIsfd1Uh43uIHcI9ySA8g-S7gd6gUJ6S4hXza	ANDROID	415|fN3Ytd4dCD2qtFHK7Og2DMvdujcT5f5QXeKghYZ6	-Nh0uBy-49vgjB4dmEG_	active	\N	2023-10-18 12:30:57	2023-11-07 10:58:55	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
85	Liverpool	liverpool@yopmail.com	+971	552125893	1	$2y$10$jy8hNgKif7VKTx7LQfrt3e6Orwv9Mv7yWlh/H6dR8YNX8rJyUsujy	\N	3		cqN7S8YxSF6KRWvD6Jh-Ym:APA91bGhaSUGiSrjN6IOZGXX19E0BHvXC-yBKDbXNvd5S7glolHDUEoZgTNvOfW4sTpmANDGThoeXO6LCd-_mS6ayEKXARAiKrzxTmO5xpgr7BRFnAF-7n3V2AeXLWt6sWUcASSulT3N	ANDROID	396|4cRQgh37AKnLxlLKCsX54yHJfj4Q0Q6hzNZsMNL4	-Nh13diJ-tLmx8gmDjOg	active	\N	2023-10-18 13:16:37	2023-10-27 10:15:03	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	0	2023-10-20 11:30:07	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
74	Glen Max	binshambrs@gmail.com	92	03142919744	1	$2y$10$9KkBfzSSlXNamp8/YRp90usNJopNZh77FJl4QMP.q5Pb5Dh3vH63S	\N	3		17737373	android	817|oOUo20UQxhFXLcC7UJQAndC1uJA0cVXjDHJdCwkv	-NgwERgo-mD4CtGXkkp7	active	\N	2023-10-07 10:17:16	2023-12-02 12:49:02	\N	\N	\N		\N	0	\N	\N	\N	\N	54364654	ABC, DEF DUBAI	18272727	\N	\N	\N	normal	1	0	5435436	6524dd11432a8_1696914705.png	\N	\N	0	0	\N	\N
117	sf	social@gmail.com	\N	\N	0	$2y$10$QFETcm7DunWYAjkZ9QhDbuR7ABO1uS2nLyMbkhaoW21p/YcO2bZb2	2023-10-27 10:42:05	3	\N	\N	\N	406|pMc8sMrjKKHbs0deP8t0NwfqeGllMCTs1K2liuQt	-NhkiWMU0Cg6JEIZf_Hb	inactive	\N	2023-10-27 14:42:05	2023-10-27 14:42:07	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	social	0	0	\N	\N	\N	\N	0	0	\N	\N
135	Nemai Biswas II Software Tester	nemai@dxbusinessgroup.com	\N	\N	0	$2y$10$/VIpvnX0.pgMCtyCh7HgL.MTki5GqVtk2hUsmtkzenijcjj0aFKxu	2023-11-11 17:50:48	3	1111	\N	\N	484|bmyf7VFjAUyqHfqxXTas2pfrHWiD88pwffL5ObZY	-NizVUh2Ac7cl0dASQ6i	inactive	\N	2023-11-11 21:50:48	2023-11-11 21:56:22	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	social	0	0	\N	\N	971	988789996	0	0	\N	\N
126	rusvink	rusvik1213@gmail.com	\N	\N	0	$2y$10$uGVfUoOvGTTdc1q/FHAjM.eGk3QU839JYPe8oRmwR/kWh1L8T7tua	2023-11-10 09:35:12	3	\N	\N	\N	491|3E8IDco0NZaXd1uMF4dVk44zcQ2sUvDkr61ishDO	-Nis_TJdehi408Fu4Kti	inactive	\N	2023-11-10 13:35:12	2023-11-13 08:49:42	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	social	0	0	\N	\N	\N	\N	0	0	\N	\N
143	test six	hunain66@gmail.com	+971	3214569870	1	$2y$10$68XxFpOT5ouSx7x5lqBHzepVjirpLajFnVuQZx4d5YFw6nOFilTqy	\N	3		fYoS2zgaT_eFwe7iykc6eu:APA91bHePPlIytbjBHUV_OtpWo_szc05Zv54gDzo1TePQSQ--ogr2HLetkY-S5xpwhc7bP4n9xmFbz1WZ77UMOgMaSRK5tVnKjWs2IBKNvGtywz_WAzJfGtRFuENqzHudzMHscbv-qyj	ANDROID	541|5ea1ciumACVY2mIwefyp6GwPrA4eIlYP9xYgyJ3k	-Nj8enfpKhwOG4Fvd6Ch	active	\N	2023-11-13 21:12:03	2023-11-13 23:56:41	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
153	Karan123	Karan@gmail.com	92	3202244556	1	$2y$10$VfwJ7xI5U6.Kx17DUkbUY.q4vb0jAp/X0nsTLMe3oEWJOiMSgq8KK	2023-11-14 16:57:25	3	\N	\N	\N	\N	\N	active	\N	2023-11-14 16:57:25	2023-11-14 16:57:25	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
95	test six	testdriver6@gmail.com	\N	\N	1	$2y$10$c92nyblca5VUA5aMKFr4Eeo8qHGxvESpvFot7XUEV7WqUxDB0FOrW	\N	2		eKZlbTbWTHKyZvserRwK1n:APA91bHGYyhUYfq7ItGvs_BLOxuyN3UM3ZMti0dzeG3FxZERUlWLhtZ_QuYK-iLIytciRThRDh9zGbcLHA27AWvHANQ3FfCpiDXUs_ilNx9j_rgbWr8OKaXPqfZwhGfYRoTOfbND_Q3F	ANDROID	284|Mflmuaq6R1fW31CKlP3fOavJKwNfsG2DH0WGBqhe	-NhAoz3CGFtMXJdtem_W	active	\N	2023-10-20 06:44:22	2023-10-20 06:44:27	\N	\N	\N	Business Bay	\N	0	33.56679110	73.13683055	United Arab Emirates	Dubai	\N	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	507c25ffbc01d8ae	\N	\N	\N	normal	0	0	\N	\N			0	0	\N	\N
92	Abdul Ghani	driver@driver.com	\N	\N	1	$2y$10$TH051hfY2r/1E7RjK/hJuuz.tBnVsWnngGDgek57WIKXss7DCkMA.	\N	2		882828282	android	277|BhK31ke2YgOrEG0y1OQ0eMehRrA1b38XsX4qMo4x	-NhAlpCEujfk-4q3gKO8	active	\N	2023-10-20 06:30:35	2023-10-20 06:30:43	\N	\N	\N	Business Bay	\N	0	25.15285477	55.27328796	United Arab Emirates	Dubai	\N	ABC, DEF	12122112	\N	\N	\N	normal	0	0	\N	\N			0	0	\N	\N
127	rusvink	rusvik213@gmail.com	\N	\N	0	$2y$10$EXvM/L8FHD3hU4QSiKQc2eKbqAH7kzBNAQ0mgt5AYhe1rXvKw6CBS	2023-11-10 09:35:20	3	\N	\N	\N	442|XeD04pC77HcP5uvZoLQmD7nyzMpk5d62SNIDUCBp	-Nis_V5NgQGyTcQ2CiVg	inactive	\N	2023-11-10 13:35:20	2023-11-10 14:36:04	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	social	0	0	\N	\N	\N	\N	0	0	\N	\N
91	test four	testdriver4@gmail.com	\N	\N	1	$2y$10$ZseB0oVj8QusuAX/JPJvker.rBjWVwa58OQqFLivgdWuSS.RHmqPO	\N	2		esjXdJpkQHmdpCcOYiZIre:APA91bFhliW1355xxP0KWLICF9mIoN-XMaK8kcbIzc_UE7MkjqUdONHtw6lCUV0NbUo6M--7dD_8p2foULf30TPUPJ_TYH232cEcvMSe5ER8HvrDlmOIE35CvlkNrb-MRdSrs96WmOjP	ANDROID	275|Sozqav8btW2k9AoDxeiwWfYQ8q3LJpyLlUk9Wxdk	-NhAipMhKuqUX-NqHknt	active	\N	2023-10-20 06:17:29	2023-10-20 10:18:48	\N	\N	\N	Business Bay	\N	0	33.56679027	73.13682754	United Arab Emirates	Dubai	\N	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	507c25ffbc01d8ae	\N	\N	\N	normal	0	0	\N	\N			0	0	\N	\N
86	kiran	kiran@yopmail.com	971	55224456756	1	$2y$10$sVGpTk.AlEuaBfuilyw4JOpJYp3hnXrtDhxm0LMxDg0Mnf03CmHVC	2023-10-26 15:23:41	2			ANDROID		-Nh1x_sYPt5CSLvry-K7	active	\N	2023-10-18 13:25:23	2023-10-27 07:17:05	\N	\N	\N	Business Bay	\N	0	25.18423453	55.25999364	United Arab Emirates	Dubai	2	Al Manara Tower, 1605, 16th Floor, Business Bay, Post Box 118587 - الخليج التجاري - دبي - United Arab Emirates,	e19e10ee2b97a91c	\N	\N	\N	normal	0	0	\N	\N			0	0	\N	\N
88	Kishore	kishore@yopmail.com	971	5543979567	1	$2y$10$PBLbkWSUq3bbnpqQys8w2eqt.jj.IzOU2VcRD3CDg.VGjDa.UJzQi	\N	2		flrCMeeASZSY5YdAWEJV2L:APA91bFgqJn77SRInK-wCRBUYTTKeAT2fMLdDflS2CD22Rz5-yvSx6fpxzi1aYmEqN0QM37jNF3Ldjs-TCXY41FFoteLQd61Qsdf3eth3czI3jaMbpkaUrhZMBDY50ZChjUymfP63IKw	ANDROID	378|RdsqKrvJyqtqs9XAqmRp9djdqgr506eE3jLqK7Kx	-Nh63lLiGSdmOHqKIRvd	active	\N	2023-10-19 08:35:14	2023-10-26 17:55:13	\N	\N	\N	Business Bay	6530ea81a45f1_1697704577.jpg	0	25.184244847592886	55.2599785476923	United Arab Emirates	Dubai	\N	3101 Marasi Dr - Business Bay - Dubai - United Arab Emirates,	e19e10ee2b97a91c	\N	\N	\N	normal	0	0	\N	\N			0	0	\N	\N
87	test Driver Two	testdriver2@gmail.com	\N	\N	1	$2y$10$ziY8ngbcv65RluVPF50YcO.92q4XRCMsYi.rVaVZDqmkFiZCZuGW2	\N	2			ANDROID		-Nh62aECp8xuGVH2M71b	active	\N	2023-10-19 08:30:06	2023-10-19 09:03:08	\N	\N	\N	Business Bay	\N	0	33.56687883	73.13681815	United Arab Emirates	Dubai	\N	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	507c25ffbc01d8ae	\N	\N	\N	normal	0	0	\N	\N			0	0	\N	\N
94	yest five	testdriver5@gmail.com	\N	\N	1	$2y$10$Dvo4MrYets/V3av2lzLLCup6CdQggmuXCuDI5dwPft2SWnh0hrfde	\N	2		eKZlbTbWTHKyZvserRwK1n:APA91bHGYyhUYfq7ItGvs_BLOxuyN3UM3ZMti0dzeG3FxZERUlWLhtZ_QuYK-iLIytciRThRDh9zGbcLHA27AWvHANQ3FfCpiDXUs_ilNx9j_rgbWr8OKaXPqfZwhGfYRoTOfbND_Q3F	ANDROID	282|KeBnLJNhyhGbm4Mf8mExAvYKSUaZKhkTDaWpdDfw	-NhAnp99TezVHE2v-6dX	active	\N	2023-10-20 06:39:19	2023-10-20 06:39:30	\N	\N	\N	Business Bay	\N	0	33.56678971	73.13682888	United Arab Emirates	Dubai	\N	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	507c25ffbc01d8ae	\N	\N	\N	normal	0	0	\N	\N			0	0	\N	\N
96	test seven	testdriver7@gmail.com	\N	\N	1	$2y$10$JS6ohICxobvqTbDa337u6ulN4AI/rftCZWRoNwbZKBARUv8bcHmw2	\N	2			ANDROID		-NhApzH2WsRye9wXQX6r	active	\N	2023-10-20 06:48:45	2023-10-20 06:49:15	\N	\N	\N	Business Bay	\N	0	33.56679222	73.13683257	United Arab Emirates	Dubai	\N	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	507c25ffbc01d8ae	\N	\N	\N	normal	0	0	\N	\N			0	0	\N	\N
89	test three	testdriver3@gmail.com	Dial Code	67677777777	1	$2y$10$HTGZUoP8btSPVDtoy.SNHOO1fkighH9UgcF..GsFbkCX6YwU/iS3G	2023-11-15 17:01:14	2		882828282	android	587|tnEmdcZCxXbbodqRhrRgstYG3KNeWsdUzXIuBYdX	-Nh82BMLcLSgX8ak8pVM	active	\N	2023-10-19 17:47:35	2023-11-15 17:09:10	\N	\N	\N	Business Bay	\N	0	25.16402115	55.40154118	United Arab Emirates	Dubai	566	Cluster - Dubai - Spain S11 - International City - Spain Cluster - دبي - United Arab Emirates,	7db5d4dbe030f9f9	\N	\N	\N	normal	0	0	\N	\N			0	0	\N	\N
118	ghani 33	ghaniabro35@gmail.com	\N	\N	0	$2y$10$k9bNGZgS13ORqx1eq7MGtuDzbSogK6jv61momuwhZtc0wTi8T9xcK	2023-10-27 10:42:38	3	\N	\N	\N	409|lbAtLk50j8IEOZzJsDpg7xjOKv53oCDFKP2L6qnE	-NhkidXdT4fMekW6YS2G	inactive	\N	2023-10-27 14:42:38	2023-10-27 14:42:50	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	social	0	0	\N	\N	\N	\N	0	0	\N	\N
154	test user	emailtest@gmail.com	971	223232323	1	$2y$10$1I4GyDrMovbU70c4hpP1ZOZkkdfgRoWR2RAgl8eguF4HASfcEqWyW	2023-11-15 19:06:51	3	\N	\N	\N	\N	\N	active	\N	2023-11-15 19:06:51	2023-11-15 19:06:51	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
93	Meenu	meenu@gmail.com	92	588963258	1	$2y$10$ni8IpYV8SNuY/juztw6.0eTxRzrCtWUPWSEsxU2Q71tP7a28.zQBu	\N	3		17737373	android	280|SPH5Agkd2cYVS97G7YVVvhGu8RQEMyFsqc7V7ZeT	-NhAmTOrQsXvJjeq5r3Z	active	\N	2023-10-20 10:33:24	2023-11-14 14:26:09	\N	\N	\N		\N	0	\N	\N	\N	\N	00000	ABC, DEF DUBAI	18272727	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
169	Lulu DXB	nbu3@mailinator.com	+971	988559969	1	$2y$10$AuOLgetSiLE0iJ6fs1I7LOU1BUu9V8WXiZAuGo0XA/cOKyipkwrGu	\N	3		df5TmxF8Qay-EEDLKWuGSV:APA91bEpj1vlAp2TiTTILSY6WGxOrNi6ABQbsBOEb6tHTtIqMxKhhjViUj36zn8f8SvVjoJajxAE_VHwW453Zomo_waShD1ZX8QDevzVPjxwYj5NX3DwDls3uUSFnbP_1ebBT6Alby88	ANDROID	720|ZqquihzEnkSeOXLpSB5u2sLVuwulgMhyARTfReu0	-NjW2CjbbKPou06Ms2LR	active	\N	2023-11-18 10:09:57	2023-11-18 15:40:34	\N	\N	\N		65585f244f8e3_1700290340.png	0	22.4893236473253	88.37173450738192	\N	\N	1	C/1B, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	3764434	\N	\N	\N	normal	1	0	9764335789	65585f244db10_1700290340.png	\N	\N	0	0	\N	\N
171	test	test11@gmail.com	+971	369085255	0	$2y$10$zC3Q5jbZc1R21H1hU2ziUeivsHleIOKyHX1htwgVqh39JC2ZQU1SK	\N	3	1111		ANDROID		-NjWTcSnJxx3fxUX7_1n	active	\N	2023-11-18 12:09:45	2023-11-18 08:34:51	\N	\N	\N		\N	0	\N	\N	\N	\N	1	Dummy	3764434	\N	\N	\N	normal	1	0	\N	\N	971	369085256	0	0	\N	\N
155	\N	\N	\N	\N	1	$2y$10$zIvPNttR2CqfKBNEkKcR0OqIAXko/WOj2MajNHwcDGkuV/sRGSgUO	2023-11-15 19:06:51	3	\N	\N	\N	\N	\N	active	\N	2023-11-15 19:06:51	2023-11-20 16:13:20	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
186	test	karanyyyyyy@gmail.com	+971	222222222	1	$2y$10$hXeknYthyrm91OwFRyouVe9U3pmwUn6qkPzKH.W21yWqq0O2FyMNe	\N	3			ANDROID		-NkdEzEHoKZPZMyB5BLx	active	\N	2023-12-02 10:38:25	2023-12-02 06:43:30	\N	\N	\N		\N	0	\N	\N	\N	\N	1		3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
90	Abdul Ghani	driver@gmail.com	971	7568768768	1	$2y$10$cCF.3PZ7u1cAkEdAmLasMO0cjCYMgZkJxF/AGHWYkuLv5FirBe5p.	2023-12-02 10:28:04	2	1111	afasfa	android	873|4WTltSRH3QRl1Wf35sFODs9g4cqcoMo9dMGyiH7T	-NhAh897PCGt3cqrF2_1	active	\N	2023-10-20 06:10:06	2024-09-18 14:45:17	\N	\N	\N	ABC, DEF	\N	0	25.15285477	55.27328796	United Arab Emirates	Dubai		ABC, DEF	12122112	\N	\N	\N	normal	0	0	\N	\N			0	0	\N	AE
16	Raya Gentry	softcube.web@gmail.com	971	+1 (101) 377-8953	1	$2y$10$qpAqhtSrm66CaSXThpR51uF6ho8VMhFchKFB44zWvR6QIMoAkbvHC	2023-07-26 23:25:43	3	\N	\N	\N	59|MdZnfVQfdSQKteQfBaFYhz3TPhEI84iwffYr6FvD		active	\N	2023-07-26 23:25:43	2023-10-20 15:29:53	\N	\N	\N	HHGJ+RV Al Ajban - Abu Dhabi - United Arab Emirates	\N	0	24.828038293264758	55.591169515385324	United Arab Emirates	Voluptatem quos sap	70689	Laboris in debitis q	\N	\N	1111	2023-10-20 11:29:53	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
121	more more	testdxbuae@gmail.com	971	36990852321	1	$2y$10$9GykVvXsOC/YeD57hNj6ZuKxFilCgVcme13gb9h8OH0D46IZg.2Ki	2023-11-10 07:14:11	3			\N		-Nis4Bd2G5laqiv7MUIe	active	\N	2023-11-10 11:14:11	2023-11-13 06:02:50	\N	\N	\N	\N	654e755caaffd_1699640668.jpg	0	33.51639245283293	73.11084128916264	\N	\N	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	\N	\N	\N	\N	social	0	0	0986554221	654e754c230aa_1699640652.jpg			0	0	\N	\N
101	B test	livedriver@driver.com	971	5787989	0	$2y$10$WW2bEonhw4xFqdJMPzkwCeKIWJUFBnmkj8ka6lAbi6.a4ezGDTKzS	\N	2	1111	882828282	android	303|pOvbmOiQZuXJVps2LE0X8PVrpb2fGUCbfNznEOuY	-NhC7DErCI5qUAjSkjBa	inactive	\N	2023-10-20 12:48:02	2023-10-20 16:48:03	\N	\N	\N	Safa Park - Sheikh Zayed Rd - Al Safa - Dubai - United Arab Emirates	\N	0	25.185434492556674	55.24619407503102	United Arab Emirates	Dubai	\N	ABC, DEF	12122112	\N	\N	\N	normal	0	0	\N	\N	971	5787989	0	0	\N	\N
98	Driver Two	driver2@yopmail.com	971	576464789	1	$2y$10$2YSJrLuPKZTag1d/f8ejzui9nEI4nQSxIS2HCgYxKam84YUHzmrlC	2023-11-14 12:28:56	2			ANDROID		-NhBVpLmRhGYOGAWk09O	active	\N	2023-10-20 09:55:57	2023-11-14 08:38:00	\N	\N	\N	Business Bay	\N	0	25.19395649	55.23161754	United Arab Emirates	Dubai	16	56VJ+HJQ - Jumeirah - Jumeirah 3 - Dubai - United Arab Emirates,	55a89d5d960c7123	\N	\N	\N	normal	0	0	\N	\N			0	0	\N	\N
105	Dublin	dublin@gmail.com	+971	3204504501	1	$2y$10$Cz5QGVKEHQnslxzMb5KQXO5eh7jr71cA/x2iJCQjqGGla9140FtlC	\N	3			ANDROID		-NhVajMCT6xgLnOj4clE	active	\N	2023-10-24 11:34:09	2023-10-24 07:45:04	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
100	B test	john@driver.com	971	587456963	1	$2y$10$mG0CdjJPGo5qCvvBUsNt7OEgxGUUGaFaQGknOutJFFNiyI7CK/xmW	\N	2		882828282	android	301|DcwuN9yG4S168Fbg2f4cRjIzdcSSiFEt4pcFZBfE	-NhByq2dJdsUcPqejhy7	active	\N	2023-10-20 12:07:04	2023-10-20 12:07:15	\N	\N	\N	Safa Park - Sheikh Zayed Rd - Al Safa - Dubai - United Arab Emirates	\N	0	25.18543449	55.24619408	United Arab Emirates	Dubai	\N	ABC, DEF	12122112	\N	\N	\N	normal	0	0	\N	\N			0	0	\N	\N
102	B test	kiyara@driver.com	971	654756765	1	$2y$10$oySdxva4sVzkxCGV3r.YtuW7tM/SZt6qmFmsrQ4O/WfFw3.vX6MCe	\N	2		882828282	android	305|Ytd6IVrCGj7i0DqZrycF6HlVPZR4E6R1CfC8bx1i	-NhC7o2h0hK_-8vB4JWh	active	\N	2023-10-20 12:50:37	2023-10-20 12:50:49	\N	\N	\N	Safa Park - Sheikh Zayed Rd - Al Safa - Dubai - United Arab Emirates	\N	0	25.185434492556674	55.24619407503102	United Arab Emirates	Dubai	\N	ABC, DEF	12122112	\N	\N	\N	normal	0	0	\N	\N			0	0	\N	\N
103	hunain dev nine	hunain99@gmail.com	+971	1234567891	1	$2y$10$n9b3m/ysLmDLIBzklT5oIuyiXONFYL4nYbcdTdapT2H.6zkD3fMwa	\N	3		ekvPi3HlTIyQu7zf_HQkbT:APA91bGuAZaatFy7MZBYwk6LtiNcp0gZcFggAk9sQF9E1XrJCXj77jy5kpuJVzJPR4uhnrKzk7pfKFgKnzEfrt3nSozI0iICf_4TZgsE88nS5zpXk3_b223Cjxn4tbaJnfbIIXfv4Pwq	ANDROID	835|XO7YGoQP3Am6CJYln0xgVdiW1cfa5jNWUtPspm59	-NhFxR8vU2CSqpDSDkhX	active	\N	2023-10-21 10:39:24	2023-12-26 13:06:14	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
73	Hunain Dev	hunain88@gmail.com	971	090078603	0	$2y$10$le3o4NT/QOjpnDa7GRdSNuTCmjwP/Ev4ApbPLz048r8TaxMA9O6tS	2023-10-07 05:19:53	3	1111	ef_toR36RgGFuXxcINQ45r:APA91bFzUwL_GCoHHdLn1kisTis7pM9SYr-ynfzuZpkfG17Uvl7kBl_tebbuq33yPG7hKiMm1GdsRRGq7plPp9lE5-I6skslOTUIgVpiWgZYKx4emHr5Beqq0Qf42gQnboB7n52zb8CB	ANDROID	782|61KLYF7ucwLNtIfiWf7q5P5Xk7IhWiPSLMz8Ylli	-NgwBwyQFyOESns4h_Fw	active	\N	2023-10-07 05:19:53	2023-11-29 10:16:40	\N	\N	\N		653b4fde62905_1698385886.jpg	0	33.57005739122855	73.13719768077135	United Arab Emirates	Dubai	1	pwd islamabad، Block C Police Foundation, Rawalpindi, Punjab 44000, Pakistan,	3764434	\N	\N	\N	normal	0	0		6531788810613_1697740936.jpg	971	090078602	0	0	\N	\N
109	RAS	ras@yopmail.com	+971	554228898	1	$2y$10$vS98wsDKwgpAoa9zknaPquziJAqhFU/Zrt7mtp7TH8G0EjdOou8R6	\N	3			ANDROID		-NheQSmA7HrY7EAGrL9x	active	\N	2023-10-26 09:21:06	2023-10-26 11:53:23	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
108	KS	ks@yopmail.com	+971	524158669	1	$2y$10$7rprTTD5n2Rhj10I8E0HTuupfc3eCrFnIv5vSkqrsmWf6GXP3JDg6	\N	3		ctjSPb1yQmGkhexKqeIdQQ:APA91bHIPv2_7yhVKCGjtkqhZXslczZO8bWWmAeTtLlvuRrhgp7WjY-_kKSLd9MkD7M3AUolgnJNtfraIaAo2P66gQgo2b6JNRnQ8s_2b4ZvAMigMksIUY0NJE98sWOvU7tKnUkDrVeC	ANDROID	365|V192YOA0CJC19rQQawByj1qfO1UqGBSJVq24FtI3	-NhamXoIOwXVFVnHJKVS	active	\N	2023-10-25 16:23:27	2023-10-26 10:24:54	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
104	Danish Nisar	daani4900@gmail.com	92	3204504500	1	$2y$10$.AlIrCnQTYIBSCXGt03MN.RUqdETj3BZbwKzupfcaq9k2RzLRUuIa	2023-11-11 14:10:41	2			ANDROID		-NhV_YLoylrBZWuC375x	active	\N	2023-10-24 07:28:58	2023-11-11 10:13:23	\N	\N	\N	Business Bay	6537727486474_1698132596.jpg	0	31.489159443301777	73.09940099716187	United Arab Emirates	Dubai	110111	790 B Block, Millat Town Faisalabad, Punjab, Pakistan,	de53e8cce5a1c32d	\N	1111	2023-10-24 11:19:40	normal	0	0	\N	\N			0	0	\N	\N
110	GS Company	gs@yopmail.com	+971	5341889666	1	$2y$10$j2vdMLZV3c2EuBZOYi9TEORLZF9L3a5FoN0bOcbYmfdN/ONh4fmxO	\N	3			ANDROID		-NhjXAV1qLOglPFJsgRm	active	\N	2023-10-27 09:08:32	2023-10-27 06:14:53	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
107	Paul	paul@yopmail.com	971	525325917	1	$2y$10$ZSkeGNjvWp3uN32xw.yLz.yhYmLTBBdrlDzDZtg7ps9YiZRKCT0LS	2023-10-25 10:13:12	2	\N		ANDROID		-NhfpjGqFwT-sSDoYPd_	active	\N	2023-10-25 10:13:12	2023-11-07 07:26:38	\N	\N	\N	3101 Marasi Dr - Business Bay - Dubai - United Arab Emirates	\N	0	25.1842002	55.2599217	United Arab Emirates	Dubai	312	\N	\N	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
119	user One	userone@gmail.com	+971	3204504509	1	$2y$10$RI6HD6dBWQrA7xtcT3/CR.afHDzMKqmUsrx2e3PUgUNG8JlT3oEu.	\N	3			ANDROID		-Nhkm_dB3ThAtzumL_r6	active	\N	2023-10-27 14:59:51	2023-10-27 10:59:56	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
99	Binsha	bdriver@driver.com	971	8888888888888	1	$2y$10$QncQK1VBjWYyqgpE3sVCHuDr3UhRzDNOoq/2iWJOAxsOcHXgroFNy	2023-11-16 16:16:36	2		882828282	android	730|zLIMFM6NU91bq8w4UocsJEa22CvS4x8NHjBA4IV7	-NhBwqxpcdMshlsj88M0	active	\N	2023-10-20 11:58:23	2023-11-18 18:43:32	\N	\N	\N	Business Bay	\N	0	55.35435643	27.5456547	United Arab Emirates	Dubai	673638	test address	12122112	\N	\N	\N	normal	1	2	12121212	6557242155045_1700209697.jpg			0	0	\N	\N
106	D X	dxbmahidxb@gmail.com	971	564005096	1	$2y$10$qquwSg/daCU.9x9mhZSArefnTNrgfG/Om5wCciBwd7bGOEazPrJRy	2023-10-25 09:48:01	4	\N	\N	\N	\N	\N	active	\N	2023-10-25 09:48:01	2025-02-13 18:05:30	\N	\N	\N	56QV+8RX Tolerance Bridge - Al Safa - Dubai - United Arab Emirates	\N	0	25.187505509882502	55.23908615112305	United Arab Emirates	Dubai	\N	Business Bay	\N	\N	\N	\N	normal	0	0	\N	\N	\N	\N	0	0	\N	\N
132	karan	kj01@mailinator.com	971	584845545	1	$2y$10$rmW80m.PxvQ8kknOnPStluVFnCpOdwNBclVjSskub1WvA3Wjo.YSm	\N	2			ANDROID		-Nixnqdtt0metAwd2UI0	active	\N	2023-11-11 09:56:08	2023-11-11 10:11:20	\N	\N	\N	Business Bay	\N	0	28.72357747728334	77.24529884755611	United Arab Emirates	Dubai	\N	Abu Dhabi	f8bfa3f90d8388fc	\N	\N	\N	normal	0	0	\N	\N			0	0	\N	\N
140	hunain seven	hunain77@gmail.com	+971	1236547890	1	$2y$10$lBuTh12fN6gt1.tXk2k6SuqdiZcAsRxhowTvkr6vV9JOZeaPQjg62	\N	3			ANDROID		-Nj6HaduPkhy3PVQjGFg	active	\N	2023-11-13 10:07:04	2023-11-13 17:10:24	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	\N	\N	normal	1	0	087532112	\N	\N	\N	0	0	\N	\N
156	Hello Test	karanj@gmail.com	+971	8888888888	1	$2y$10$GTku62lY//ZpHFJA3a7NUu8bEujt96fTMObie4Hg/f7PbUzpzkJjC	\N	3			ANDROID		-NjLhqXvwRa1-oA6lVWG	active	\N	2023-11-16 10:00:25	2023-11-16 06:00:31	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
112	B Z	BZ@driver.com	971	522099155	0	$2y$10$NmcB7j0XhpGaSS1B3f.efOUfjIyTlmKFDJu1cf5bosGjH8MaXr9DK	\N	2	1111	882828282	android	391|yLudaMTzOuHrfDDeLR9Ejv9SsV8agp9KdGZ4ynhj	-NhjcE8yWj9mnGLAOkd8	active	\N	2023-10-27 05:35:00	2023-10-27 10:00:52	\N	\N	\N	Safa Park - Sheikh Zayed Rd - Al Safa - Dubai - United Arab Emirates	\N	0	25.185434492556674	55.24619407503102	United Arab Emirates	Dubai	\N	ABC, DEF	12122112	\N	\N	\N	normal	0	0	\N	\N	971	522099155	0	0	\N	\N
120	ghani 33	ghanibro33@gmail.com	\N	\N	0	$2y$10$vYmdsQTQeo9glqJDNbUsved528iqoVon6hJKzmpOSg4AzzuksyJi.	2023-10-27 11:01:45	3	\N	\N	\N	414|Nxo6ta16me5DaCQPQGJBignQoTlxj72bIvrRwJTT	-Nhkn0TtmGzC_m2B6ghl	inactive	\N	2023-10-27 15:01:45	2023-10-27 16:21:19	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	social	0	0	\N	\N	\N	\N	0	0	\N	\N
113	TSI Company	tsi@yopmail.com	+971	544568266	1	$2y$10$GYit9FipTCPs.tW2ovS5U.a1YjxtFa.RS/8Dcyp1JrVOgCk0BrguK	\N	3		deviceToken	ANDROID	399|nxSIZWYRjfOn8o1WQmTTRUAdpOoWl9AZmTLZFfzn	-Nhjy1YJkUMnTqHI2KrZ	active	\N	2023-10-27 11:10:15	2023-10-27 11:10:16	\N	\N	\N		\N	0	\N	\N	\N	\N	1	ABC DEF	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
111	Mathew	mathew@yopmail.com	971	521789966	1	$2y$10$ffi4BtsRkYjKO5RbK6QxSOZzSbXnNRhlKSvAHGBSgKdIhoE0q40Li	2023-11-14 12:37:10	2			ANDROID		-Nhj_jhY6ra7MZ7AwJyv	active	\N	2023-10-27 05:24:07	2023-11-15 13:53:04	\N	\N	\N	Business Bay	653b4d69b8696_1698385257.jpg	0	25.184231497721463	55.259992964565754	United Arab Emirates	Dubai	94	3101 Marasi Dr - Business Bay - Dubai - United Arab Emirates,	272cf02bfddea411	\N	\N	\N	normal	0	0	\N	\N			0	0	\N	\N
144	test	testdriver20@gmail.com	971	369082145	0	$2y$10$x99dCe9WfkAeXeSbe5tquONQgDb5q48Hk9yBZ7DyMORlTHQ7VT8tO	\N	2	1111	dJ7XGG1xRzWaGi-3LvT-oc:APA91bGwG9wVK96aX7lKYEq2xgtSjCmRUWrWy6wRLdPtn37N3bbs_T445Cne4lC-wVpNWPEq4cTz5KebkSDHhteRJg9hbnUA2HDmzOvMLlWDPDbhs38Xe32usqIaxogAK6E-n7j6RA7G	ANDROID	543|3x1dMHy12fdFHtpCzkBWO4gjxXg9hFAsO5tC4yaL	-Nj9RS7zZkdlS-GzP-0u	inactive	\N	2023-11-13 20:48:58	2023-11-14 00:48:59	\N	\N	\N	Business Bay	\N	0	33.516402515878255	73.11082284897566	United Arab Emirates	Dubai	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	7db5d4dbe030f9f9	\N	\N	\N	normal	0	0	\N	\N	971	369082145	0	0	\N	\N
128	test	testdriver8@gmail.com	971	9632508741	0	$2y$10$Veh.80XD7MWx87VReWTZX..TgM1dw9a679FTPoONccxj39gzzofey	\N	2	1111	dwlJyqP_TR2Sdhj2i2WJEZ:APA91bHKYTFhYbjrATGObUKUHZmx7JT3doGYOwphPLIFkpCi0O-hVd2FdOS9TvPmOGfcJDOeLRvFP3tDj-E0wd8Fno9I3f-vClXEmqa-R9OZRGgSQ6TJ6wUkiul8IQDOjvgF8K-lUtb4	ANDROID	467|eoWsIMzPsjsKk4VigfehBIcrvDXm9sUuvyHWrPkD	-NiuqiIaRPxKvm2Fw9MD	inactive	\N	2023-11-10 20:09:49	2023-11-11 00:09:49	\N	\N	\N	Business Bay	\N	0	33.51639217330388	73.11083860695362	United Arab Emirates	Dubai	\N	Bahria Heights 5, Expressway, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	7db5d4dbe030f9f9	\N	\N	\N	normal	0	0	\N	\N	971	9632508741	0	0	\N	\N
160	na truck	navisanil@gmail.com	971	646499443	1	$2y$10$nPQpOOrpRBZ5xo8034shEekEaLVmncu1pqWqzG3ORgtzRUE8YKDNq	\N	2			ANDROID		-NjNEQ3nqlPm9110hNGl	active	\N	2023-11-16 13:06:43	2023-11-16 13:25:57	\N	\N	\N	Business Bay	\N	0	25.18429308916157	55.25992725044489	United Arab Emirates	Dubai	\N	801, 8th Floor, Al Manara Building, Al Abraj Street - الخليج التجاري - دبي - United Arab Emirates,	12d4d9f3ec83ed7c	\N	\N	\N	normal	0	0	\N	\N			0	0	\N	\N
165	post T	post@driver.com	971	56576577	1	$2y$10$q2MFp1fgI.Ggwr4LPrb1Dek58It2Lj2FBP3dBDcgweU2CSjLt1T4G	\N	2		882828282	android	666|dCQ3T4blUgqufcd9ShfXSSetbiAfiQnUNaklJjUF	-NjRc5iBZ8UvehDrkYCr	active	\N	2023-11-17 09:33:02	2023-11-17 11:55:32	\N	\N	\N	Safa Park - Sheikh Zayed Rd - Al Safa - Dubai - United Arab Emirates	\N	0	55.354356437	27.54565477	United Arab Emirates	Dubai	\N	test address post T	12122112	\N	\N	\N	normal	1	1	12121212	\N			0	0	\N	\N
122	Binsha	rusvinmerak@gmail.com	91	7034526952	1	$2y$10$WP0PuXNPosIY0e4Vn5xyl.Zj83yas84bP8bGoGlz7xJK.JoVmMYEC	2023-11-10 09:09:50	3		\N	\N	685|85aTMZwXkKObydluulJp2EKXj7EVkpNRahnkU1VW	-NisUef904BmQvPC6zQC	active	\N	2023-11-10 13:09:50	2023-11-18 08:44:42	\N	\N	\N	\N	\N	0	55.35435643	27.5456547	\N	\N	\N	test address	\N	\N	\N	\N	social	1	2	12121212	\N			0	0	\N	\N
177	NB Driver Co	nbd5@mailinator.com	91	987456996	1	$2y$10$25w39QIVFwU/AdOn8XNwf.efg9ZSajyhtfKkcbd9RTzBo8XJyiSCe	\N	2		d8u-aV2fSkyXrED4GYW5qi:APA91bGz4_UxWRrWF-6qGrVUiulbQcs0txXUuXXiUGOEOIeBkHCE1mCywbQyFyKHhD1xR7CuKx4OYQDBWNmWwT5vVTv4XOh23eqLQlDhItb5TtJMo1JN3KQXZ8vo96wvOXT8DDG79G8T	ANDROID	826|HH71Nk1GJT2L9zZSHXFNDDqzo28SfW2xGimNux1a	-Nja5kgL0bMEjxoaV_OU	active	\N	2023-11-19 05:43:33	2023-12-04 14:51:59	\N	\N	\N	Business Bay	6559a0ce5c0be_1700372686.jpg	0	22.54741631400061	88.35980236530304	India	Kolkata	\N	123, Mother Teresa Sarani, Mullick Bazar, Beniapukur, Kolkata, West Bengal 700017, India,	90ffc91b77d7350f	\N	\N	\N	normal	2	6	\N	\N			0	0	\N	IN
179	Nemai Driver	nbd6@mailinator.com	91	9874566366	1	$2y$10$ZPQqDln8frKRRNzQLcQgw.qpEEfM4AsHndFRsKk97qZvvjnUZ2NOW	2023-11-20 10:48:52	2		fyAVJcPISz69ZaFJCpg9fC:APA91bHLdHZYqL88x8LlrQ8jCtIzZqfLv-KKbwQbkONcH9u3EyRg08Z6XIMesAymWvo2aJ6anJFpPgCk8nGUbWNOKbZuVmqmOj8D0X1drNonochanpnV06gQNcP7P3DSozUUODKHMZJZ	ANDROID	747|bQ5UA6r1kCF6ZhAryoI6GDxS5O4vluX7CyTSgWkW	-Njf-WH_s8evOcUM3QKb	active	\N	2023-11-20 04:34:23	2023-11-20 10:48:52	\N	\N	\N	Business Bay	\N	0	22.48986235135604	88.37032232433558	India	Kolkata		38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	90ffc91b77d7350f	\N	\N	\N	normal	2	6	\N	655b0154b766d_1700462932.png			0	0	\N	\N
175	Driver DX	nbd3@mailinator.com	91	9832831817	1	$2y$10$WUsCAMqU0S8kOOtLIUqRleGFWOHg4L6HDJKDCAPw7qDayJrAj0E3a	\N	2			ANDROID		-NjYVjODZqSt_3fbX_zu	active	\N	2023-11-18 17:38:12	2023-11-20 16:13:20	\N	\N	\N	Business Bay	6558f701ee931_1700329217.png	0	22.489843454930416	88.3703501522541	India	Kolkata	\N	52, Ananda Pally, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	90ffc91b77d7350f	\N	\N	\N	normal	2	6	\N	\N			0	0	\N	\N
173	Navis Truck	anilnavis@gmail.com	971	546460494	1	$2y$10$H3K96fbOb8fteikw23KEz.quENr6ZhxCFFJxZZmuV/obeHSpGT0di	\N	2		cS5h2PaIQ8W_0OflpfiAl3:APA91bHFmWM7BTUDcJGyLNBiU0AXrVMjbpJ-tHssz3PTpz1Gm6j_6ejte5QMIE8xgn_S54fPTqVsJof4FIBso5_qvceBeM6nJdK5dV0XI9KGhy_3ejGp0OFkFwYug5Jos3rQBuySlGRU	ANDROID	733|KsALXOkBXFIIdkX9bYInFEpcpgL7agZke0B718kU	-NjX1nscU1Iy9K89bbeP	active	\N	2023-11-18 10:47:49	2023-11-18 19:16:31	\N	\N	\N	Business Bay	\N	0	25.287249791313474	55.370816476643085	United Arab Emirates	Abu Dhabi	\N	79PC+W82 - Al Nahda - Al Nahda 2 - Dubai - United Arab Emirates,	12d4d9f3ec83ed7c	\N	\N	\N	normal	1	5	\N	\N			0	0	\N	\N
180	NB Driver	nbd7@mailinator.com	91	9874563212	1	$2y$10$6wdqeO0xqU759IQFcZKAmulL.cOoZHcGvebjFo4VmegGswwQmtCM.	\N	2			ANDROID		-NjgQJCwC2VYL-6snyme	active	\N	2023-11-20 11:11:05	2023-11-20 12:08:28	\N	\N	\N	Business Bay	\N	0	22.48986637846281	88.3703213185072	India	Kolkata	\N	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	90ffc91b77d7350f	\N	\N	\N	normal	2	6	\N	\N			0	0	\N	\N
181	NB DriverD	nbd8@mailinator.com	91	987456966	1	$2y$10$XY.82xCr0vWkJIRtp0ncbu.ofSNnfshwdrmhTtHqpeYOAlWS8J8Ia	\N	2			ANDROID		-NjgdJxZXwifoi3sss4E	active	\N	2023-11-20 12:12:18	2023-11-21 05:00:07	\N	\N	\N	Business Bay	\N	0	22.489882177111305	88.37031930685045	India	Kolkata	\N	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	90ffc91b77d7350f	\N	\N	\N	normal	2	6	\N	\N			0	0	\N	\N
182	ruscin	rusvintest@gmail.com	971	1356497945	1	$2y$10$X.uulUpz1cZF74CM1xu.feacePdzVsaMkWgnaAEiyHj8y09r1id.m	\N	2			ANDROID		-NjgiAHvu2cgqdKrUg_f	active	\N	2023-11-20 12:33:29	2023-11-20 12:35:10	\N	\N	\N	Business Bay	\N	0	11.21218674786664	75.93540553003551	India	Delhi	\N	6W6P+R2, Aroor, Kerala 673633, India,	b9f686d90de58a17	\N	\N	\N	normal	2	7	\N	\N			0	0	\N	\N
183	Abc	rusvink@gmail.com	+971	1656659548	1	$2y$10$C7JV6nRhU3HuaQF/9f3Iou9bIWGTmeUL2Pn/0ijX/kmReFulP5i5K	\N	3		deviceToken	ANDROID	774|ieBIXWfCwaEfSXs56ap21XN8rrmTGUcG2qURSf9v	-NjgjA1Ws4BV0fkodRfb	active	\N	2023-11-20 16:37:50	2023-11-20 16:45:56	\N	\N	\N		\N	0	11.212357434972121	75.93521911650896	\N	\N	1	6W6P+R2, Aroor, Kerala 673633, India,	3764434	\N	\N	\N	normal	1	0	aj233	655b5504207ce_1700484356.jpg	\N	\N	0	0	\N	\N
189	NN Company	u0@mailinator.com	+971	9883239126	1	$2y$10$Wop/qIEq9LS5dxQxJrJ9kemosVik/cu1chE8J4JHz.7mzZRhdRo/C	\N	3		c_lKgGnVTu-r9WiUiwqqsL:APA91bHH3XnHrrHZXTcT3NqXwsP6KyQOaapo3lz6i8ftcvqCEXtjuTZfp3iuF3c9thd9HvhoJo_g6xAbU-jqqHmoI1cNW_lKu_OGq76btpMhxZpL2WqAkT_9MDqAeW_evU_Pe-kWYiL6	ANDROID	864|CIpBqvtd0RMr6D0a5BqKgKjQgTF2vrnM6aT9nVrA	-Nz2yX5JBsTchaHekwjy	active	\N	2024-05-29 14:51:40	2024-06-19 20:48:28	\N	\N	\N		6657094472b74_1716980036.jpg	0	22.50568240070511	88.38858682662249	\N	\N	1	24, Lal Bahadur Shastri Rd, Ramlal Bazar, Haltu, Kolkata, West Bengal 700078, India,	3764434	\N	\N	\N	normal	1	0		665709446c540_1716980036.jpg	\N	\N	0	0	\N	\N
190	NN Driver	d0@mailinator.com	91	9832831816	1	$2y$10$GZsAUY4cJhEQMGAVH5CftuF1jOIE1LRxu4KO3FJOhBdDhOvaY6YaC	2024-09-30 13:55:07	2		fWzQJyYQSjOuBLrVi87JhE:APA91bGrY3IiNWzqxSTZbg1Mm8bBoAMmLaryoOKImglgAan_4YPS4u4lxVtJz5YlRorcScSUNwKIx0Yjef5__ORBbDgU9aFKSQ-QeCs03XUqV2_yAllpqlVm8ue0y9IR0nP7qakS-Mii	ANDROID	880|SD4sm0ZuvynAi3j9VFDZsoCB6mHpyp8FNeGl8wn7	-Nz315IJUqCi-YofACcu	active	\N	2024-05-29 11:07:15	2024-09-30 13:55:07	\N	\N	\N	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	\N	0	22.48984035715548	88.37031293660402	India	Kolkata		38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	0fa76acc736e0cd2	\N	\N	\N	normal	2	6	\N	\N			0	0	\N	PK
185	Demo Driver	drivera@mailinator.com	971	9877556999	1	$2y$10$WbC8ijd2DJU5KaBHgFok.uouim/Sd7LxoBvLgL.fHiFq8K1n9IiB.	\N	2		eO1tE-Q_R3K6uVMispBx06:APA91bHOEJeREY660L1JFA_76T9sLY9AixepabsYl-6hhLLnVpGTD51GZxAkRl9dkUZtSgt33NL53dIPUAcumII66RWZ5Px8XH0ZIYz_Qr_IM0Wxh1u_i_yRY3dzuNe0R52G-i4Op-o-	ANDROID	779|7gqEJLcXR7Psu2Ng97QFrJDvOr5AXYjuo578waen	-NjkLoKZt-hLwUqs3OVI	active	\N	2023-11-21 05:29:54	2023-11-21 05:30:04	\N	\N	\N	Business Bay	\N	0	22.489866998017686	88.3703263476491	India	Kolkata	\N	38, Ananda Pally, Jadavpur, Kolkata, West Bengal 700092, India,	90ffc91b77d7350f	\N	\N	\N	normal	2	6	\N	\N			0	0	\N	\N
184	Demo Co	demo@mailinator.com	+971	987789969	1	$2y$10$M2tQ/J2vhZQ6.5ixbF0X6.2dci392K2I9uBah/.XYPCrBTk6SS4lW	\N	3		dapn6roKQyCdQEbMtBFA2S:APA91bE-PnPsvCunh2qK0KYI21cMqm8rLo_C25uEsDOAZOVafueCnYsU6_BSeClujZfyox0VUlMF2ElW6KNFcxNPaWJYAF_pBJmWMCJWIizeO0qnK6K5NuenafatJkYW01yIBxYrFuW1	ANDROID	790|FCurLl5XvoH1gJohzmDwBIwLeip2OYkJiBvwWfzZ	-NjkJIC1-l_aM-bv90i-	active	\N	2023-11-21 09:18:54	2023-11-30 08:24:31	\N	\N	\N		\N	0	\N	\N	\N	\N	1		3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
187	NB Company	nbu100@mailinator.com	+971	987459971	1	$2y$10$WDsMEXkXRpB97qFXybKa6eup.KUZpo3DhesbDs09uxjLRQRgxeveu	\N	3			ANDROID		-Nko4NxJ3-hN7ChWVhof	active	\N	2023-12-04 13:07:56	2023-12-26 05:18:50	\N	\N	\N		\N	0	\N	\N	\N	\N	1		3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
188	DriverDD	nbd100@mailinator.com	91	9832831855	1	$2y$10$8dPlsYw6MJwHos29dPkg3.gyEniyImv7qU5ib23Dm7EjLjH4UP9cO	2024-05-29 15:05:33	2	1111		ANDROID		-Nko6_8Wqmvgi_BSB1RD	active	\N	2023-12-04 09:17:31	2024-06-03 06:54:17	\N	\N	\N	52/B, Ananda Pally, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	656d997e8809a_1701681534.jpg	0	22.489946920573544	88.37046481668949	India	Kolkata		52/B, Ananda Pally, Bapuji Nagar, Jadavpur, Kolkata, West Bengal 700032, India,	90ffc91b77d7350f	\N	\N	\N	normal	2	6	\N	\N			0	0	\N	IN
192	Driver DTwo	d2@mailinator.com	971	509806534	1	$2y$10$bV3VL.rQkLc9BGP30y3RMeOaDzPCWSirFZgnx1g4W/GuIrnYcWqpy	2024-06-07 12:17:45	2	1111		ANDROID		-NzlYnYRuQvmSzH2uuIA	active	\N	2024-06-07 07:17:25	2024-09-18 11:31:39	\N	\N	\N	23/R, Shaktigarh, Jadavpur, Kolkata, West Bengal 700032, India,	\N	0	22.491716047190607	88.36909119039774	India	Kolkata		23/R, Shaktigarh, Jadavpur, Kolkata, West Bengal 700032, India,	0fa76acc736e0cd2	\N	\N	\N	normal	2	6	\N	\N			0	0	\N	PK
197	sooraj	sooraj1@yopmail.com	91	9847823797	1	$2y$10$/oaI3vJt2t3YMQRVgi4stOYoAp/dCBJt2lZR3lpINImJho2iasT/a	\N	2		ffRJqrbnQiKVRtgjlFXmtr:APA91bF6ekFiHjETSNnTCyCo0Rk2KkbjQmF822c7sGWR6IsORS2uuv5LG3rOJmtNOXuhVpa-mumYzoG7a7BTqciUiyafiAvkpePG-QQciFeWjbUSOr7T2aL4RVgaj3FSYt05XvxtoZxY	ANDROID	879|ctUHCLOWFOBGalpIOfKC1Ic5Kmn6G8LSB9jCgh8F	-O80CBN06-XEX_Y0r07p	active	\N	2024-09-30 04:33:49	2024-09-30 08:34:15	\N	\N	\N	Business Bay	\N	0	28.704059203840494	77.10249032825232	India	Delhi	\N	Pocket G-27, Sector 3G, Rohini, Delhi, 110085, India,	d4f23c2c15bf6b1b	\N	\N	\N	normal	2	7	\N	\N			0	0	\N	IN
193	NB CompanyB	u9@mailinator.com	+91	932274136	1	$2y$10$5pcnYFYZ.qs.Ew012Vgiquxt2N4qTUv5tvumXfBqR4Gc2DRcBICcm	\N	3			ANDROID		-Nzl_9JJ6YqgSyM6-t27	active	\N	2024-06-07 11:23:21	2025-02-12 10:18:59	\N	\N	\N		\N	0	\N	\N	\N	\N	1		3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
194	Renji	operation@gmail.com	971	509806580	1	$2y$10$LX/PXLm.FI5egzcAkQujYu.6n/qp7j5k7UPK/xGVSzbFy0rqzU9pO	\N	2	1111	eAvV3P-uS1G_wVIUX8bIB5:APA91bEnNz70tP6HR0t7fAS_geUnrrXkoy-AKkQpesnT_rRHyJDxoCzScmbr5rMFTvF_a7YHXVuwxfNPtFuXNwpEjV3emI2MZ2ileNWpvtFSFrfaCo2h6ErNwde_MIHMxLiXLNvpTE7A	ANDROID	862|9oFcFcTj9JX3JD6OhTrbumn6oyek1u5wZBPbMezY	-Nzlm0qjn_l-WxF3tuN7	active	\N	2024-06-07 08:19:34	2024-07-05 11:44:18	\N	\N	\N	Business Bay	\N	0	22.519401433265333	88.3518211171031	India	Kolkata	\N	G992+QP3, Sarat Bose Rd, Manoharpukur, Kalighat, Kolkata, West Bengal 700029, India,	0fa76acc736e0cd2	\N	\N	\N	normal	2	6	\N	\N			0	0	\N	IN
196	sooraj	sooraj@yopmail.com	91	9847823799	1	$2y$10$AacbLOHyTtSlqUd7uDsnde/YSc9e7wuYMAiTQeRJDajwIYRnVANCi	\N	2			ANDROID		-O73TWYCXfVJV0Oq24Jw	active	\N	2024-09-18 09:32:42	2024-09-30 04:31:08	\N	\N	\N	Business Bay	\N	0	25.204849237091366	55.27078282088041	United Arab Emirates	Dubai	\N	673C+W8V - Dubai - United Arab Emirates,	d4f23c2c15bf6b1b	\N	\N	\N	normal	1	1	\N	\N			0	0	\N	IN
195	sooraj sabu	soorajsabu117@gmail.com	971	9847823798	1	$2y$10$MH7IeJrHkwp3nP.dxV.x..HB5IveDu3U7.Ad0jz568E8XpXPi4OPO	2024-09-18 07:00:17	3		\N	\N	867|IDNjflknb4QfcyVlGu01jX6RbxtlCzFJFqV3G20h	-O72vcjnU2908jh0DH0k	active	\N	2024-09-18 11:00:17	2024-09-18 12:43:36	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	social	0	0	\N	\N			0	0	\N	\N
201	Navis company	navis@navis.com	+971	222222226	1	$2y$10$glOomjkn3o19kKvI6rs2AOV9dqBJ0W6fVt4X6wPOuLeyogYYI2xKy	\N	3		deviceToken	ANDROID	887|aTwufmfp1pthCOIGE8ompqMCrx0qymsggIciNmIQ	\N	active	\N	2025-02-12 13:31:21	2025-02-12 13:31:21	\N	\N	\N		\N	0	\N	\N	\N	\N	1		3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
205	test three	testdriver3@gmail.con	971	369852852	0	$2y$10$gamFZvhfNpqsOIjtlkknNOuwLbKVji31yqhzmToTsMlijMmROti8e	\N	2	1111	flqGvaVdTRC5PX6lYQDI-p:APA91bF-SpsOU880jMBFijeu0Ig0TjYijh1QBVFqzOMqlO9EztekIjpBlHFkNJGMzMrX8wtpaSDQcQhJqR9zuhgV9EzXg274zV3ugCogDX1Aw0LCgbF6G4g	ANDROID	904|JyYTUMbm1Uz2UdsDSdzpyi8yCZ8WgWIRTfYrLHsp	-OIu7ZEv8q6nhAmvaGaK	inactive	\N	2025-02-12 12:28:56	2025-02-12 16:28:57	\N	\N	\N	Business Bay	\N	0	33.5668212761041	73.13679903745651	United Arab Emirates	Dubai	\N	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	c948872a6eac9a75	\N	\N	\N	normal	1	1	\N	\N	971	369852852	0	0	\N	\N
203	test	testdriver@gmail.con	971	365214879	1	$2y$10$2LQaZATuO0PTmhGs2jSPK.c/xJ8Z9foT7ywGvnlmFI8FLLm2zHSD.	\N	2			ANDROID		-OItpdf7NgvPG6SdhsPq	active	\N	2025-02-12 11:06:18	2025-02-12 11:07:12	\N	\N	\N	Business Bay	\N	0	33.56679557442807	73.13676383346319	United Arab Emirates	Abu Dhabi	\N	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	c948872a6eac9a75	\N	\N	\N	normal	1	5	\N	\N			0	0	\N	PK
191	N Company	u1@mailinator.com	+971	932172369	1	$2y$10$LbVdVbJrsaBLy2rPL3vBQubQAXzDorBEUx3y8x04S9oyzewcljFla	\N	3			ANDROID		-NzRrxiWBEnx5Yp-1Qgl	active	\N	2024-06-03 10:53:28	2025-02-13 14:56:01	\N	\N	\N	57M8+9HM - Business Bay - Dubai - United Arab Emirates	\N	0	25.182208	55.2665088	\N	\N	1	57M8+9HM - Business Bay - Dubai - United Arab Emirates	3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
202	Navis Cargo	navis1@navis1.com	+971	987654321	1	$2y$10$NUoY9ZWL1l7tyzZBShmOVeV5hh/8Cj8cSakqJKv/SxextsynuFOPq	\N	3			ANDROID		-OIte1z9PDKloRx8RS3O	active	\N	2025-02-12 14:15:36	2025-02-13 18:00:18	\N	\N	\N		67ac7533e1358_1739355443.jpg	0	25.184751534813977	55.26074096560478	\N	\N	1	The Citadel - Business Bay - Dubai - United Arab Emirates,	3764434	\N	\N	\N	normal	1	0	34324dh	67ac7533df591_1739355443.pdf	\N	\N	0	0	\N	\N
204	Anil	truck@truck.com	971	2245545664	1	$2y$10$BrOdfJVZ5OWSYV8h/aKJ9.S.ijIeMAZ8zNUcfg9Jhi4sNF00GjCKa	\N	2	1111		ANDROID		-OIu6twmh-j0GVcgtWYg	active	\N	2025-02-12 12:26:03	2025-02-13 16:12:27	\N	\N	\N	Business Bay	\N	0	25.184248791872815	55.260046273469925	United Arab Emirates	Dubai	\N	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	0012e1f9e605c504	\N	\N	\N	normal	1	1	\N	\N			0	0	\N	AE
199	Hunain Ahmad.	hunainahmad12345@gmail.com	971	36521456988	1	$2y$10$TmJzOvfFT9gy0cl3i/alhebMlmmYipC.fRTX8dX7GocfnxZDRp0tW	2025-02-12 09:26:20	3			\N		-OItesHHS0-n2cj9YEUg	active	\N	2025-02-12 13:26:20	2025-02-12 10:19:39	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	social	0	0	\N	\N			0	0	\N	\N
200	ss	ghania5bro11@gmail.com	\N	\N	0	$2y$10$miJlTo3d.4zjeDxIOMJm.uaOeK.gN5fAgqYHsHiwmegjiLHUTOoky	2025-02-12 09:29:26	3	\N	\N	\N	893|dysd3WGMZZgki2LRjmksRFFZmA0KyP6Bd3G6V6aX	-OItdA8umHBkwtqH7kED	active	\N	2025-02-12 13:29:26	2025-02-13 18:06:11	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	social	0	0	\N	\N	\N	\N	0	0	\N	\N
206	navis	nav@nav.com	971	946494649	1	$2y$10$4lw79JOYtkF2V3oaz8jXHOqhcXA99xw/1MEdQkmt8z2NN.wumX4JG	\N	2			ANDROID		-OIue3D5euBFh3LQqDpD	active	\N	2025-02-12 14:55:18	2025-02-13 08:21:25	\N	\N	\N	Business Bay	\N	0	25.184243937374443	55.260051637887955	United Arab Emirates	Dubai	\N	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	0012e1f9e605c504	\N	\N	\N	normal	1	1	\N	\N			0	0	\N	\N
208	aniltra	truck1@truck1.com	971	4568664666	1	$2y$10$lO.ECdWn3Gbd0TiJcaT5vuQn9/iM4TDUHMGNdvTazYOrhDaIpralW	2025-02-13 22:11:03	2	1111		ANDROID		-OIz5ZaNiavanlFl97sK	active	\N	2025-02-13 11:38:20	2025-02-13 22:11:03	\N	\N	\N	1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	\N	0	25.184258197462857	55.26005532592535	United Arab Emirates	Dubai		1 Sheikh Zayed Rd - Business Bay - Dubai - United Arab Emirates,	e19e10ee2b97a91c	\N	\N	\N	normal	1	1	\N	\N			0	0	\N	AE
198	test company	testcompany@gmail.com	+971	369852147	1	$2y$10$xU40huVMVzs96ZfhtUF0ouCHzUfnVDrCZn843AUZNo9vuXw9hOZU2	\N	3		dyUXatCgT32UkGSuueXR_o:APA91bEYei8ugooU-P4QfFTRdXui9Dc3nG8k_Wqmu2S2PBN3rp00Gg2Gh_ZR1cBBIOLD4eGIKnB7OtG3bztlvvsUHXd82tkP_gNyFIoxkHzOPaX9fMCHGFk	ANDROID	937|nCxEmcbv4s0HAqjXyNqyuqfPFFC6TPKA9LnNevRV	-OIyvi3uHLZoOkixsRIQ	active	\N	2025-02-12 13:25:12	2025-02-14 03:15:54	\N	\N	\N		\N	0	\N	\N	\N	\N	1		3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
207	test	driver1@gmail.com	971	369852146	1	$2y$10$SgYdxBD81jS3BfyVr2XJF.wDzcvLGus5V7OPmsKkumbPbaFS6Hy3q	\N	2			ANDROID		-OIydYM5d0OMjbim1JjO	active	\N	2025-02-13 09:31:32	2025-02-13 23:18:42	\N	\N	\N	Business Bay	\N	0	33.56681680624794	73.13680071383715	United Arab Emirates	Dubai	\N	H48P+PP4, Block A Police Foundation, Islamabad, Punjab, Pakistan,	c948872a6eac9a75	\N	1111	2025-02-13 10:15:42	normal	1	1	\N	\N			0	0	\N	PK
209	dff	gh@gh.com	+971	526645686	1	$2y$10$FCMoheSvh/5Q75q5C0QIPulSHHJy0myhY4FFRDD73Ezrk9endLkBK	\N	3		deviceToken	ANDROID	926|Xm9ylAT9N7z8qKqwscxZwaMpb6s7WCW7aViAGJjU	-OJ-TX7HkIBp1YWzqGB1	active	\N	2025-02-13 22:02:38	2025-02-13 22:02:39	\N	\N	\N		\N	0	\N	\N	\N	\N	1		3764434	\N	\N	\N	normal	1	0	\N	\N	\N	\N	0	0	\N	\N
210	test	driver2@gmail.com	971	3464646458	0	$2y$10$o0s7mEyQ.dgE2gvrVGlDFOMmLi4Z2My7FI/NURQzrPV1ZnUsMRIiC	\N	2	1111	dREzEwvNRWeSZ_eRiMYVPZ:APA91bHJYPaPCRHPPZX-lkHcu4HNy-Ssl5tN6rQfVrPxllLG43vZ9IqrHQNUxJk0Rg6hVRd-tJOo0hjTVMP9fD3F9Aig4Tzdwaust8O9ej4T6-aj32hpXVA	ANDROID	930|PQvZw4dZbp3aP4s3vxNqDAOxXIz13LnkUn0Z4mUB	-OJ-rW1SKFQGC1AdsUyT	inactive	\N	2025-02-13 19:51:47	2025-02-13 23:51:48	\N	\N	\N	Business Bay	\N	0	33.5164103426905	73.11085268855095	United Arab Emirates	Dubai	\N	Bahria Heights 5, Islamabad, Rawalpindi, Islamabad Capital Territory, Pakistan,	c45bc1b1f4fd5071	\N	\N	\N	normal	1	1	\N	\N	971	3464646458	0	0	\N	\N
\.


--
-- Data for Name: warehousing_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.warehousing_details (id, booking_id, items_are_stockable, type_of_storage, item, pallet_dimension, weight_per_pallet, total_weight, total_item_cost, created_at, updated_at, no_of_pallets) FROM stdin;
1	109	yes	2	test Apples	9x8x7	3	9	5400	2023-10-20 21:32:36	2023-10-20 21:32:36	3
2	110	yes	2	item fruits	4x1x3	2	16	4500	2023-10-21 09:30:27	2023-10-21 09:30:27	13
3	120	yes	1	Car accesories	160X160	200	2000	12001	2023-10-25 10:31:59	2023-10-25 10:31:59	10
4	132	\N	1	test	1*2*3	10	100	100	2023-10-26 11:25:07	2023-10-26 11:25:07	10
5	133	yes	1	perfumes	120x130	20	100	24548	2023-10-26 11:32:48	2023-10-26 11:32:48	5
6	134	yes	1	Car accesories	160X160	20	100	234	2023-10-26 11:36:57	2023-10-26 11:36:57	20
7	135	\N	1	Car accesories	160X160	250	25	250	2023-10-26 11:41:11	2023-10-26 11:41:11	20
8	136	yes	2	Clothes	2x3x2	20	20	4000	2023-10-26 11:52:55	2023-10-26 11:52:55	20
9	137	yes	2	Clothes	2x3x2	20	20	4000	2023-10-26 11:58:14	2023-10-26 11:58:14	20
10	138	yes	2	accessories	120x139	10	100	400000	2023-10-26 12:21:35	2023-10-26 14:50:13	48
11	156	yes	2	12	34	2	25	125	2023-10-26 17:17:17	2023-10-26 17:17:17	25
12	198	yes	1	ffggg	45566	666555	55555	2555	2023-11-13 13:37:28	2023-11-13 13:37:28	55666
13	214	yes	2	test ware	2x2x2	3	6	600	2023-11-13 14:25:23	2023-11-13 14:25:23	2
14	215	yes	2	test ware one	2x2x2	3	6	600	2023-11-13 14:28:20	2023-11-13 14:28:20	2
15	216	yes	2	test ware two	2x2x2	3	6	600	2023-11-13 14:28:43	2023-11-13 14:28:43	2
16	231	yes	2	test warehouse	2x3x4	3	36	3258	2023-11-13 23:35:58	2023-11-13 23:35:58	12
17	232	yes	1	test	55	55	55	55	2023-11-14 09:54:39	2023-11-14 09:54:39	5
18	233	yes	2	Test	44	88	6	44	2023-11-14 10:25:33	2023-11-14 11:52:46	5
19	275	yes	1	df	3x4x6x	56	23	2333	2023-11-16 09:39:29	2023-11-16 09:39:29	23
20	281	yes	2	Clothes	2x3x2	20	20	4000	2023-11-16 15:18:37	2023-11-16 15:18:37	20
21	282	yes	2	Clothes	2x3x2	20	20	4000	2023-11-16 15:29:09	2023-11-16 15:29:09	20
22	283	yes	2	Clothes	2x3x2	20	20	4000	2023-11-16 15:34:26	2023-11-16 15:34:26	20
23	290	yes	2	Clothes	2x3x2	20	20	4000	2023-11-16 16:05:44	2023-11-16 16:05:44	20
24	305	yes	2	Gjj	3x46x46	2555	5000	58885	2023-11-16 17:24:10	2023-11-16 17:24:10	2
25	317	yes	1	33	44	22	22	55	2023-11-16 19:49:27	2023-11-16 19:49:27	22
26	346	yes	2	Clothes	2x3x2	20	20	4000	2023-11-17 16:08:23	2023-11-17 16:08:23	20
27	360	yes	2	test	44	22	22	22	2023-11-17 19:10:53	2023-11-17 19:10:53	22
28	380	yes	2	Item nameere	76x64x45	25000	250000	260000	2023-11-18 16:50:22	2023-11-18 16:53:15	5
29	381	yes	2	item namok	64x645x56	58800	58000	58000	2023-11-18 17:05:19	2023-11-18 17:07:03	2
30	382	yes	2	75445th	53x54x35	25000	55454	585	2023-11-18 17:22:55	2023-11-18 17:23:47	2
31	386	yes	2	Packets	43x66x57	5000	5000	5000	2023-11-19 09:11:02	2023-11-19 09:11:02	50
32	393	yes	1	ihhh	65	25	58	25	2023-11-19 21:52:53	2023-11-19 21:52:53	25
33	394	yes	2	tre	65x46x65	50	800	56	2023-11-20 08:22:21	2023-11-20 08:22:21	258
34	399	yes	2	Packets	65x65x66	5000	5000	5000	2023-11-20 11:58:35	2023-11-20 11:58:35	500
35	400	yes	2	Lpackety	65x45x56	5000	5800	5800	2023-11-20 12:23:42	2023-11-20 12:23:42	5000
36	401	yes	2	7555	755	250	580	580	2023-11-20 12:39:45	2023-11-20 12:39:45	8569
37	402	yes	2	Packets	64x64x65	5800	5800	5000	2023-11-20 14:09:22	2023-11-20 14:09:22	500
38	403	yes	2	Tyg	64x56x54	5000	5000	58000	2023-11-20 14:16:59	2023-11-20 14:16:59	500
39	413	yes	2	Packets	54x65x56	50	5000	8000	2023-11-21 11:19:38	2023-11-21 11:19:38	500
40	420	yes	2	tedt	3x5x8	2	4	360	2023-12-02 00:00:21	2023-12-02 00:00:21	2
41	421	yes	2	Clothes	2x3x2	20	20	4000	2023-12-02 08:14:48	2023-12-02 08:14:48	20
42	424	yes	2	test	3x4x5	3	6	2308	2023-12-02 09:59:24	2023-12-02 09:59:24	2
43	440	yes	2	Packets	64x45x45	580	58000	580000	2023-12-04 14:10:43	2023-12-04 14:10:43	500
44	446	yes	2	Jd	64x57x96	5000	5800	5000	2023-12-05 09:54:51	2023-12-05 09:54:51	98569
45	464	yes	2	Package of	64x54x35	50	500	5000	2024-06-05 10:22:06	2024-06-05 10:22:06	50
46	489	yes	2	rice	2x3x6	1200	2000	220	2025-02-13 21:30:40	2025-02-13 21:30:40	120
47	490	yes	2	Rice	2x3x6x8	120	200	120	2025-02-13 21:36:57	2025-02-13 21:36:57	12
\.


--
-- Name: accepted_qoutes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accepted_qoutes_id_seq', 155, true);


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addresses_id_seq', 130, true);


--
-- Name: admin_designation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_designation_id_seq', 1, false);


--
-- Name: app_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_settings_id_seq', 1, false);


--
-- Name: blacklists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blacklists_id_seq', 6, true);


--
-- Name: booking_additional_charges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_additional_charges_id_seq', 1, false);


--
-- Name: booking_carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_carts_id_seq', 709, true);


--
-- Name: booking_containers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_containers_id_seq', 1, false);


--
-- Name: booking_deligate_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_deligate_details_id_seq', 145, true);


--
-- Name: booking_extra_charges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_extra_charges_id_seq', 26, true);


--
-- Name: booking_qoutes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_qoutes_id_seq', 257, true);


--
-- Name: booking_reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_reviews_id_seq', 30, true);


--
-- Name: booking_status_trackings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_status_trackings_id_seq', 843, true);


--
-- Name: booking_truck_alots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_truck_alots_id_seq', 142, true);


--
-- Name: booking_truck_carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_truck_carts_id_seq', 430, true);


--
-- Name: booking_trucks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_trucks_id_seq', 371, true);


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_id_seq', 490, true);


--
-- Name: cart_deligate_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_deligate_details_id_seq', 181, true);


--
-- Name: cart_warehousing_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_warehousing_details_id_seq', 55, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 7, true);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_id_seq', 2, true);


--
-- Name: containers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.containers_id_seq', 4, true);


--
-- Name: countries_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_country_id_seq', 4, true);


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

SELECT pg_catalog.setval('public.deligates_id_seq', 4, true);


--
-- Name: driver_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.driver_details_id_seq', 76, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faq_id_seq', 1, false);


--
-- Name: help_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.help_request_id_seq', 18, true);


--
-- Name: languages_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.languages_language_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 166, true);


--
-- Name: notification_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notification_users_id_seq', 2165, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 58, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pages_id_seq', 9, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 937, true);


--
-- Name: role_permissions_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_permissions_permission_id_seq', 76, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);


--
-- Name: shipping_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_methods_id_seq', 7, true);


--
-- Name: storage_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.storage_types_id_seq', 3, true);


--
-- Name: temp_users_temp_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_users_temp_user_id_seq', 361, true);


--
-- Name: truck_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.truck_types_id_seq', 22, true);


--
-- Name: user_additional_phone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_additional_phone_id_seq', 21, true);


--
-- Name: user_password_resets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_password_resets_id_seq', 1, false);


--
-- Name: user_privileges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_privileges_id_seq', 1, false);


--
-- Name: user_wallet_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_wallet_transactions_id_seq', 1, false);


--
-- Name: user_wallets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_wallets_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 210, true);


--
-- Name: warehousing_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.warehousing_details_id_seq', 47, true);


--
-- Name: accepted_qoutes accepted_qoutes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accepted_qoutes
    ADD CONSTRAINT accepted_qoutes_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: admin_designation admin_designation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_designation
    ADD CONSTRAINT admin_designation_pkey PRIMARY KEY (id);


--
-- Name: app_settings app_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_settings
    ADD CONSTRAINT app_settings_pkey PRIMARY KEY (id);


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
-- Name: booking_carts booking_carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_carts
    ADD CONSTRAINT booking_carts_pkey PRIMARY KEY (id);


--
-- Name: booking_containers booking_containers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_containers
    ADD CONSTRAINT booking_containers_pkey PRIMARY KEY (id);


--
-- Name: booking_deligate_details booking_deligate_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_deligate_details
    ADD CONSTRAINT booking_deligate_details_pkey PRIMARY KEY (id);


--
-- Name: booking_extra_charges booking_extra_charges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_extra_charges
    ADD CONSTRAINT booking_extra_charges_pkey PRIMARY KEY (id);


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
-- Name: booking_truck_alots booking_truck_alots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_truck_alots
    ADD CONSTRAINT booking_truck_alots_pkey PRIMARY KEY (id);


--
-- Name: booking_truck_carts booking_truck_carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_truck_carts
    ADD CONSTRAINT booking_truck_carts_pkey PRIMARY KEY (id);


--
-- Name: booking_trucks booking_trucks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_trucks
    ADD CONSTRAINT booking_trucks_pkey PRIMARY KEY (id);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: cart_deligate_details cart_deligate_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_deligate_details
    ADD CONSTRAINT cart_deligate_details_pkey PRIMARY KEY (id);


--
-- Name: cart_warehousing_details cart_warehousing_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_warehousing_details
    ADD CONSTRAINT cart_warehousing_details_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: containers containers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.containers
    ADD CONSTRAINT containers_pkey PRIMARY KEY (id);


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
-- Name: help_request help_request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help_request
    ADD CONSTRAINT help_request_pkey PRIMARY KEY (id);


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
-- Name: notification_users notification_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_users
    ADD CONSTRAINT notification_users_pkey PRIMARY KEY (id);


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
-- Name: storage_types storage_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_types
    ADD CONSTRAINT storage_types_pkey PRIMARY KEY (id);


--
-- Name: temp_users temp_users_driving_license_number_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users
    ADD CONSTRAINT temp_users_driving_license_number_unique UNIQUE (driving_license_number);


--
-- Name: temp_users temp_users_phone_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users
    ADD CONSTRAINT temp_users_phone_unique UNIQUE (phone);


--
-- Name: temp_users temp_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users
    ADD CONSTRAINT temp_users_pkey PRIMARY KEY (temp_user_id);


--
-- Name: truck_types truck_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.truck_types
    ADD CONSTRAINT truck_types_pkey PRIMARY KEY (id);


--
-- Name: user_additional_phone user_additional_phone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_additional_phone
    ADD CONSTRAINT user_additional_phone_pkey PRIMARY KEY (id);


--
-- Name: user_password_resets user_password_resets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_password_resets
    ADD CONSTRAINT user_password_resets_pkey PRIMARY KEY (id);


--
-- Name: user_privileges user_privileges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_privileges
    ADD CONSTRAINT user_privileges_pkey PRIMARY KEY (id);


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
-- Name: warehousing_details warehousing_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehousing_details
    ADD CONSTRAINT warehousing_details_pkey PRIMARY KEY (id);


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
-- Name: accepted_qoutes accepted_qoutes_booking_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accepted_qoutes
    ADD CONSTRAINT accepted_qoutes_booking_id_foreign FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE CASCADE;


--
-- Name: accepted_qoutes accepted_qoutes_driver_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accepted_qoutes
    ADD CONSTRAINT accepted_qoutes_driver_id_foreign FOREIGN KEY (driver_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: booking_containers booking_containers_booking_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_containers
    ADD CONSTRAINT booking_containers_booking_id_foreign FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE CASCADE;


--
-- Name: booking_deligate_details booking_deligate_details_booking_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_deligate_details
    ADD CONSTRAINT booking_deligate_details_booking_id_foreign FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE CASCADE;


--
-- Name: booking_qoutes booking_qoutes_booking_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_qoutes
    ADD CONSTRAINT booking_qoutes_booking_id_foreign FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE CASCADE;


--
-- Name: booking_qoutes booking_qoutes_driver_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_qoutes
    ADD CONSTRAINT booking_qoutes_driver_id_foreign FOREIGN KEY (driver_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: booking_reviews booking_reviews_booking_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_reviews
    ADD CONSTRAINT booking_reviews_booking_id_foreign FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE CASCADE;


--
-- Name: booking_trucks booking_trucks_booking_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_trucks
    ADD CONSTRAINT booking_trucks_booking_id_foreign FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE CASCADE;


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
-- Name: warehousing_details warehousing_details_booking_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehousing_details
    ADD CONSTRAINT warehousing_details_booking_id_foreign FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

