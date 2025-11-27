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
-- Name: agent_user_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agent_user_details (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    gender character varying(255),
    country_id integer DEFAULT 0 NOT NULL,
    emirate_id integer DEFAULT 0 NOT NULL,
    area_id integer DEFAULT 0 NOT NULL,
    address character varying(255),
    callcenter_id integer
);


ALTER TABLE public.agent_user_details OWNER TO postgres;

--
-- Name: agent_user_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agent_user_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agent_user_details_id_seq OWNER TO postgres;

--
-- Name: agent_user_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agent_user_details_id_seq OWNED BY public.agent_user_details.id;


--
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointments (
    id bigint NOT NULL,
    appointment_id character varying(255) NOT NULL,
    booking_date date NOT NULL,
    time_slot character varying(255) NOT NULL,
    booking_status smallint DEFAULT '1'::smallint NOT NULL,
    hospital_id bigint NOT NULL,
    patient_id bigint NOT NULL,
    doctor_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.appointments OWNER TO postgres;

--
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_id_seq OWNER TO postgres;

--
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;


--
-- Name: areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.areas (
    id bigint NOT NULL,
    name_en character varying(255) NOT NULL,
    name_ar character varying(255) NOT NULL,
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    country_id integer DEFAULT 0 NOT NULL,
    emirate_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.areas OWNER TO postgres;

--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.areas_id_seq OWNER TO postgres;

--
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.areas_id_seq OWNED BY public.areas.id;


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
    type integer DEFAULT 0 NOT NULL
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
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- Name: callcenter_user_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.callcenter_user_details (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    country_id integer DEFAULT 0 NOT NULL,
    emirate_id integer DEFAULT 0 NOT NULL,
    area_id integer DEFAULT 0 NOT NULL,
    address character varying(255),
    location character varying(255),
    website character varying(255),
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.callcenter_user_details OWNER TO postgres;

--
-- Name: callcenter_user_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.callcenter_user_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.callcenter_user_details_id_seq OWNER TO postgres;

--
-- Name: callcenter_user_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.callcenter_user_details_id_seq OWNED BY public.callcenter_user_details.id;


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
    reply text,
    created_at timestamp(1) without time zone,
    updated_at timestamp(1) without time zone
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
    deleted_at timestamp without time zone,
    name_ar character varying(255)
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
-- Name: country_of_origins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country_of_origins (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    name_ar character varying(255),
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.country_of_origins OWNER TO postgres;

--
-- Name: country_of_origins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_of_origins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_of_origins_id_seq OWNER TO postgres;

--
-- Name: country_of_origins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_of_origins_id_seq OWNED BY public.country_of_origins.id;


--
-- Name: department_doctors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department_doctors (
    doctor_id bigint NOT NULL,
    department_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.department_doctors OWNER TO postgres;

--
-- Name: department_hospital; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department_hospital (
    id bigint NOT NULL,
    hospital_id bigint NOT NULL,
    department_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    manager_name character varying(255),
    dial_code character varying(255),
    phone character varying(255),
    email character varying(255),
    department_name character varying(255),
    department_manager character varying(255),
    doctor_id bigint,
    manager_id bigint,
    active boolean DEFAULT true NOT NULL,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.department_hospital OWNER TO postgres;

--
-- Name: department_hospital_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_hospital_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.department_hospital_id_seq OWNER TO postgres;

--
-- Name: department_hospital_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.department_hospital_id_seq OWNED BY public.department_hospital.id;


--
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    id bigint NOT NULL,
    status character varying(255),
    deleted boolean,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    title character varying(255) NOT NULL,
    title_ar character varying(255) NOT NULL,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_id_seq OWNER TO postgres;

--
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- Name: doctor_availabilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor_availabilities (
    id bigint NOT NULL,
    doctor_id integer NOT NULL,
    sunday_availability integer DEFAULT 0 NOT NULL,
    sunday_time_slot json,
    monday_availability integer DEFAULT 0 NOT NULL,
    monday_time_slot json,
    tuesday_availability integer DEFAULT 0 NOT NULL,
    tuesday_time_slot json,
    wednesday_availability integer DEFAULT 0 NOT NULL,
    wednesday_time_slot json,
    thursday_availability integer DEFAULT 0 NOT NULL,
    thursday_time_slot json,
    friday_availability integer DEFAULT 0 NOT NULL,
    friday_time_slot json,
    saturday_availability integer DEFAULT 0 NOT NULL,
    saturday_time_slot json,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.doctor_availabilities OWNER TO postgres;

--
-- Name: doctor_availabilities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_availabilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_availabilities_id_seq OWNER TO postgres;

--
-- Name: doctor_availabilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_availabilities_id_seq OWNED BY public.doctor_availabilities.id;


--
-- Name: doctor_holidays; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor_holidays (
    id bigint NOT NULL,
    doctor_id integer NOT NULL,
    holiday_name character varying(255) NOT NULL,
    holiday_date date NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.doctor_holidays OWNER TO postgres;

--
-- Name: doctor_holidays_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_holidays_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_holidays_id_seq OWNER TO postgres;

--
-- Name: doctor_holidays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_holidays_id_seq OWNED BY public.doctor_holidays.id;


--
-- Name: doctor_instant_appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor_instant_appointments (
    id bigint NOT NULL,
    doctor_id integer NOT NULL,
    instant_appointment_date date NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.doctor_instant_appointments OWNER TO postgres;

--
-- Name: doctor_instant_appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_instant_appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_instant_appointments_id_seq OWNER TO postgres;

--
-- Name: doctor_instant_appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_instant_appointments_id_seq OWNED BY public.doctor_instant_appointments.id;


--
-- Name: doctor_intrests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor_intrests (
    id bigint NOT NULL,
    doctor_id integer NOT NULL,
    special_intrest_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.doctor_intrests OWNER TO postgres;

--
-- Name: doctor_intrests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_intrests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_intrests_id_seq OWNER TO postgres;

--
-- Name: doctor_intrests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_intrests_id_seq OWNED BY public.doctor_intrests.id;


--
-- Name: doctor_language_spokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor_language_spokens (
    id bigint NOT NULL,
    doctor_id integer NOT NULL,
    language_spoken_id integer NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.doctor_language_spokens OWNER TO postgres;

--
-- Name: doctor_language_spokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_language_spokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_language_spokens_id_seq OWNER TO postgres;

--
-- Name: doctor_language_spokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_language_spokens_id_seq OWNED BY public.doctor_language_spokens.id;


--
-- Name: doctor_patient_appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor_patient_appointments (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    doctor_id integer NOT NULL,
    booking_id character varying(255),
    booking_time_slot character varying(255),
    booking_status character varying(255),
    booking_date character varying(255),
    reason_cancel character varying(255),
    reason_reschedule character varying(255),
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    previous_booking_time_slot character varying(255),
    previous_booking_date character varying(255),
    member_id character varying(255),
    hospital_id bigint,
    department_id bigint,
    followup_details text,
    followup_date timestamp(0) without time zone,
    agent_id character varying(255)
);


ALTER TABLE public.doctor_patient_appointments OWNER TO postgres;

--
-- Name: doctor_patient_appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_patient_appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_patient_appointments_id_seq OWNER TO postgres;

--
-- Name: doctor_patient_appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_patient_appointments_id_seq OWNED BY public.doctor_patient_appointments.id;


--
-- Name: doctor_qualifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor_qualifications (
    id bigint NOT NULL,
    doctor_id integer NOT NULL,
    qualification_id integer NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.doctor_qualifications OWNER TO postgres;

--
-- Name: doctor_qualifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_qualifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_qualifications_id_seq OWNER TO postgres;

--
-- Name: doctor_qualifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_qualifications_id_seq OWNED BY public.doctor_qualifications.id;


--
-- Name: doctor_reschedule_appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor_reschedule_appointments (
    id bigint NOT NULL,
    patient_appointment_id integer NOT NULL,
    doctor_id integer NOT NULL,
    reschedule_patient_booking_date character varying(255),
    reschedule_patient_time_slot character varying(255),
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    reason text
);


ALTER TABLE public.doctor_reschedule_appointments OWNER TO postgres;

--
-- Name: doctor_reschedule_appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_reschedule_appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_reschedule_appointments_id_seq OWNER TO postgres;

--
-- Name: doctor_reschedule_appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_reschedule_appointments_id_seq OWNED BY public.doctor_reschedule_appointments.id;


--
-- Name: doctor_specialities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor_specialities (
    id bigint NOT NULL,
    doctor_id integer NOT NULL,
    speciality_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.doctor_specialities OWNER TO postgres;

--
-- Name: doctor_specialities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_specialities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_specialities_id_seq OWNER TO postgres;

--
-- Name: doctor_specialities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_specialities_id_seq OWNED BY public.doctor_specialities.id;


--
-- Name: doctor_temporary_unavailables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor_temporary_unavailables (
    id bigint NOT NULL,
    doctor_id integer NOT NULL,
    unavailable_timeslot character varying(255) NOT NULL,
    unavailable_date character varying(255) NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.doctor_temporary_unavailables OWNER TO postgres;

--
-- Name: doctor_temporary_unavailables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_temporary_unavailables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_temporary_unavailables_id_seq OWNER TO postgres;

--
-- Name: doctor_temporary_unavailables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_temporary_unavailables_id_seq OWNED BY public.doctor_temporary_unavailables.id;


--
-- Name: doctors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctors (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    hospital_id integer DEFAULT 0 NOT NULL,
    year_of_experiance character varying(255),
    license_no character varying(255),
    license_type_id json DEFAULT '0'::json,
    country_id integer DEFAULT 0 NOT NULL,
    appointment_dial_code character varying(255),
    appointment_phone character varying(255),
    country_of_orgin integer DEFAULT 0,
    gender integer DEFAULT 1 NOT NULL,
    insurence_id integer DEFAULT 0,
    sub_insurence_id integer DEFAULT 0,
    profile_desciription text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    department_id bigint,
    license_no_doh character varying(255),
    license_no_moh character varying(255),
    agent_id integer,
    callcenter_id integer
);


ALTER TABLE public.doctors OWNER TO postgres;

--
-- Name: COLUMN doctors.gender; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.doctors.gender IS '1-male,2-female';


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
-- Name: emirates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emirates (
    id bigint NOT NULL,
    name_en character varying(255) NOT NULL,
    name_ar character varying(255) NOT NULL,
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    country_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.emirates OWNER TO postgres;

--
-- Name: emirates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emirates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emirates_id_seq OWNER TO postgres;

--
-- Name: emirates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emirates_id_seq OWNED BY public.emirates.id;


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
-- Name: hospital_doctor_feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hospital_doctor_feedback (
    id bigint NOT NULL,
    doctor_id integer NOT NULL,
    hospital_id integer NOT NULL,
    user_id integer NOT NULL,
    rating integer NOT NULL,
    feeback_message character varying(255),
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    appointment_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.hospital_doctor_feedback OWNER TO postgres;

--
-- Name: hospital_doctor_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hospital_doctor_feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hospital_doctor_feedback_id_seq OWNER TO postgres;

--
-- Name: hospital_doctor_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hospital_doctor_feedback_id_seq OWNED BY public.hospital_doctor_feedback.id;


--
-- Name: hospital_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hospital_images (
    id bigint NOT NULL,
    hospital_id integer NOT NULL,
    image_name text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.hospital_images OWNER TO postgres;

--
-- Name: hospital_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hospital_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hospital_images_id_seq OWNER TO postgres;

--
-- Name: hospital_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hospital_images_id_seq OWNED BY public.hospital_images.id;


--
-- Name: hospital_insurance_policies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hospital_insurance_policies (
    id bigint NOT NULL,
    hospital_id bigint NOT NULL,
    insurance_id bigint NOT NULL,
    sub_insurance_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.hospital_insurance_policies OWNER TO postgres;

--
-- Name: hospital_insurance_policies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hospital_insurance_policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hospital_insurance_policies_id_seq OWNER TO postgres;

--
-- Name: hospital_insurance_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hospital_insurance_policies_id_seq OWNED BY public.hospital_insurance_policies.id;


--
-- Name: hospital_insurances; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hospital_insurances (
    id bigint NOT NULL,
    hospital_id bigint NOT NULL,
    insurance_id bigint NOT NULL,
    sub_insurance_id character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.hospital_insurances OWNER TO postgres;

--
-- Name: hospital_insurances_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hospital_insurances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hospital_insurances_id_seq OWNER TO postgres;

--
-- Name: hospital_insurances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hospital_insurances_id_seq OWNED BY public.hospital_insurances.id;


--
-- Name: hospital_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hospital_locations (
    id bigint NOT NULL,
    hospital_id integer NOT NULL,
    location text NOT NULL,
    latitude character varying(255),
    longitude character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.hospital_locations OWNER TO postgres;

--
-- Name: hospital_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hospital_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hospital_locations_id_seq OWNER TO postgres;

--
-- Name: hospital_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hospital_locations_id_seq OWNED BY public.hospital_locations.id;


--
-- Name: hospital_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hospital_services (
    id bigint NOT NULL,
    hospital_id integer NOT NULL,
    service_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.hospital_services OWNER TO postgres;

--
-- Name: hospital_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hospital_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hospital_services_id_seq OWNER TO postgres;

--
-- Name: hospital_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hospital_services_id_seq OWNED BY public.hospital_services.id;


--
-- Name: hospital_specialities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hospital_specialities (
    id bigint NOT NULL,
    hospital_id integer NOT NULL,
    speciality_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.hospital_specialities OWNER TO postgres;

--
-- Name: hospital_specialities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hospital_specialities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hospital_specialities_id_seq OWNER TO postgres;

--
-- Name: hospital_specialities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hospital_specialities_id_seq OWNED BY public.hospital_specialities.id;


--
-- Name: hospitals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hospitals (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    country_id integer DEFAULT 0 NOT NULL,
    emirate_id integer DEFAULT 0 NOT NULL,
    area_id integer DEFAULT 0 NOT NULL,
    address text,
    website character varying(255),
    profile_description text,
    trade_licenece text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    name_en character varying(255) NOT NULL,
    name_ar character varying(255),
    appointment_dial_code character varying(255),
    appointment_phone character varying(255),
    profile_description_ar text,
    latitude character varying(600),
    longitude character varying(600),
    txt_location character varying(600),
    agent_id integer,
    callcenter_id integer,
    type integer DEFAULT 10 NOT NULL
);


ALTER TABLE public.hospitals OWNER TO postgres;

--
-- Name: hospitals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hospitals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hospitals_id_seq OWNER TO postgres;

--
-- Name: hospitals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hospitals_id_seq OWNED BY public.hospitals.id;


--
-- Name: insurence_policies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insurence_policies (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    title_ar character varying(255),
    status integer DEFAULT 1 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    last_updated_by integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.insurence_policies OWNER TO postgres;

--
-- Name: insurence_policies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insurence_policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insurence_policies_id_seq OWNER TO postgres;

--
-- Name: insurence_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insurence_policies_id_seq OWNED BY public.insurence_policies.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    title_ar character varying(255),
    status integer DEFAULT 1 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    last_updated_by integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.languages OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- Name: licence_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.licence_types (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    title_ar character varying(255),
    status integer DEFAULT 1 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    last_updated_by integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.licence_types OWNER TO postgres;

--
-- Name: licence_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.licence_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.licence_types_id_seq OWNER TO postgres;

--
-- Name: licence_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.licence_types_id_seq OWNED BY public.licence_types.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    txt_location character varying(600),
    latitude character varying(600),
    longitude character varying(600),
    user_id character varying(600),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: medical_conditions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medical_conditions (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    title_ar character varying(255),
    status integer DEFAULT 1 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    last_updated_by integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.medical_conditions OWNER TO postgres;

--
-- Name: medical_conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medical_conditions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medical_conditions_id_seq OWNER TO postgres;

--
-- Name: medical_conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medical_conditions_id_seq OWNED BY public.medical_conditions.id;


--
-- Name: members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.members (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    full_name character varying(255) NOT NULL,
    gender integer DEFAULT 0 NOT NULL,
    age integer DEFAULT 0 NOT NULL,
    insurence_id integer,
    sub_insurence_id integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    full_name_ar character varying(255),
    user_image text
);


ALTER TABLE public.members OWNER TO postgres;

--
-- Name: COLUMN members.gender; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.members.gender IS '1-Male,2-FEmale,3-Others';


--
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.members_id_seq OWNER TO postgres;

--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;


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
-- Name: mydrworld_service_feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mydrworld_service_feedback (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    rating integer NOT NULL,
    feeback_message character varying(255),
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.mydrworld_service_feedback OWNER TO postgres;

--
-- Name: mydrworld_service_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mydrworld_service_feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mydrworld_service_feedback_id_seq OWNER TO postgres;

--
-- Name: mydrworld_service_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mydrworld_service_feedback_id_seq OWNED BY public.mydrworld_service_feedback.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    ticket_number character varying(255) NOT NULL,
    user_id integer NOT NULL,
    product_id integer NOT NULL,
    drow_date date NOT NULL,
    price double precision NOT NULL,
    is_winner integer DEFAULT 0 NOT NULL,
    product_type character varying(255) DEFAULT 'daily'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


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
    expires_at timestamp(0) without time zone,
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
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    product_code character varying(255) NOT NULL,
    product_name character varying(255) NOT NULL,
    product_type character varying(255) DEFAULT 'daily'::character varying NOT NULL,
    price double precision DEFAULT '0'::double precision NOT NULL,
    description text,
    file_name text,
    drow_date integer,
    drow_time time(0) without time zone,
    product_status integer DEFAULT 1 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    updated_by integer DEFAULT 0 NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: COLUMN products.product_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.product_type IS 'daily,monthly';


--
-- Name: COLUMN products.product_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.product_status IS '1-active,0-inactive';


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
-- Name: qualifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qualifications (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    title_ar character varying(255),
    status integer DEFAULT 1 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    last_updated_by integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.qualifications OWNER TO postgres;

--
-- Name: qualifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.qualifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qualifications_id_seq OWNER TO postgres;

--
-- Name: qualifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.qualifications_id_seq OWNED BY public.qualifications.id;


--
-- Name: role_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_permissions (
    id bigint NOT NULL,
    user_role_id_fk integer NOT NULL,
    module_key character varying(255) NOT NULL,
    permissions text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.role_permissions OWNER TO postgres;

--
-- Name: role_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_permissions_id_seq OWNER TO postgres;

--
-- Name: role_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_permissions_id_seq OWNED BY public.role_permissions.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    role character varying(255) NOT NULL,
    status smallint DEFAULT '0'::smallint,
    is_admin_role smallint DEFAULT '0'::smallint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: COLUMN roles.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.roles.status IS '0=inactive, 1=active';


--
-- Name: COLUMN roles.is_admin_role; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.roles.is_admin_role IS '0=not admin role, 1=admin role';


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
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
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    title_ar character varying(255),
    status integer DEFAULT 1 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    last_updated_by integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
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
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    doctor_search_radius double precision DEFAULT '50'::double precision NOT NULL,
    instant_appoitment_number character varying(255) DEFAULT '971 50 50 00 000'::character varying
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
-- Name: special_intrests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.special_intrests (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    title_ar character varying(255),
    status integer DEFAULT 1 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    last_updated_by integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.special_intrests OWNER TO postgres;

--
-- Name: special_intrests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.special_intrests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.special_intrests_id_seq OWNER TO postgres;

--
-- Name: special_intrests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.special_intrests_id_seq OWNED BY public.special_intrests.id;


--
-- Name: specialties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.specialties (
    id bigint NOT NULL,
    name_en character varying(255) NOT NULL,
    name_ar character varying(255) NOT NULL,
    active character varying(255) DEFAULT '1'::character varying NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.specialties OWNER TO postgres;

--
-- Name: specialties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.specialties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.specialties_id_seq OWNER TO postgres;

--
-- Name: specialties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.specialties_id_seq OWNED BY public.specialties.id;


--
-- Name: sub_insurence_policies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sub_insurence_policies (
    id bigint NOT NULL,
    insurence_id integer NOT NULL,
    title character varying(255) NOT NULL,
    title_ar character varying(255),
    status integer DEFAULT 1 NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    last_updated_by integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.sub_insurence_policies OWNER TO postgres;

--
-- Name: sub_insurence_policies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sub_insurence_policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sub_insurence_policies_id_seq OWNER TO postgres;

--
-- Name: sub_insurence_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sub_insurence_policies_id_seq OWNED BY public.sub_insurence_policies.id;


--
-- Name: temp_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_users (
    id bigint NOT NULL,
    user_image text,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    gender integer,
    dob date,
    email character varying(255),
    dial_code character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    whatsap_dial_code character varying(255),
    whatsap_phone character varying(255),
    insurence_id integer DEFAULT 0 NOT NULL,
    sub_insurence_id integer DEFAULT 0 NOT NULL,
    phone_otp character varying(255),
    email_otp character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.temp_users OWNER TO postgres;

--
-- Name: COLUMN temp_users.gender; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.temp_users.gender IS '1-Male,2-Female,3-Others';


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
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255),
    email character varying(255),
    dial_code character varying(255),
    phone character varying(255),
    phone_verified integer DEFAULT 0 NOT NULL,
    password character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    role character varying(255),
    verified integer DEFAULT 0 NOT NULL,
    user_type_id integer,
    first_name character varying(255),
    last_name character varying(255),
    user_image character varying(255),
    user_phone_otp character varying(255),
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted integer DEFAULT 0 NOT NULL,
    role_id integer DEFAULT 0 NOT NULL,
    active integer DEFAULT 0 NOT NULL,
    user_code character varying(255),
    created_by integer DEFAULT 0 NOT NULL,
    last_updated_by integer DEFAULT 0 NOT NULL,
    access_token text,
    user_device_token character varying(255),
    firebase_user_key character varying(255),
    device_type character varying(255),
    gender integer,
    dob date,
    whatsap_dial_code character varying(255),
    whatsap_phone character varying(255),
    insurence_id integer DEFAULT 0 NOT NULL,
    sub_insurence_id integer DEFAULT 0 NOT NULL,
    user_email_otp character varying(100),
    is_social integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: COLUMN users.gender; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.gender IS '1-Male,2-Female,3-Others';


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
-- Name: agent_user_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_user_details ALTER COLUMN id SET DEFAULT nextval('public.agent_user_details_id_seq'::regclass);


--
-- Name: appointments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);


--
-- Name: areas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas ALTER COLUMN id SET DEFAULT nextval('public.areas_id_seq'::regclass);


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: callcenter_user_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.callcenter_user_details ALTER COLUMN id SET DEFAULT nextval('public.callcenter_user_details_id_seq'::regclass);


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
-- Name: country_of_origins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country_of_origins ALTER COLUMN id SET DEFAULT nextval('public.country_of_origins_id_seq'::regclass);


--
-- Name: department_hospital id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_hospital ALTER COLUMN id SET DEFAULT nextval('public.department_hospital_id_seq'::regclass);


--
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- Name: doctor_availabilities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_availabilities ALTER COLUMN id SET DEFAULT nextval('public.doctor_availabilities_id_seq'::regclass);


--
-- Name: doctor_holidays id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_holidays ALTER COLUMN id SET DEFAULT nextval('public.doctor_holidays_id_seq'::regclass);


--
-- Name: doctor_instant_appointments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_instant_appointments ALTER COLUMN id SET DEFAULT nextval('public.doctor_instant_appointments_id_seq'::regclass);


--
-- Name: doctor_intrests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_intrests ALTER COLUMN id SET DEFAULT nextval('public.doctor_intrests_id_seq'::regclass);


--
-- Name: doctor_language_spokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_language_spokens ALTER COLUMN id SET DEFAULT nextval('public.doctor_language_spokens_id_seq'::regclass);


--
-- Name: doctor_patient_appointments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_patient_appointments ALTER COLUMN id SET DEFAULT nextval('public.doctor_patient_appointments_id_seq'::regclass);


--
-- Name: doctor_qualifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_qualifications ALTER COLUMN id SET DEFAULT nextval('public.doctor_qualifications_id_seq'::regclass);


--
-- Name: doctor_reschedule_appointments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_reschedule_appointments ALTER COLUMN id SET DEFAULT nextval('public.doctor_reschedule_appointments_id_seq'::regclass);


--
-- Name: doctor_specialities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_specialities ALTER COLUMN id SET DEFAULT nextval('public.doctor_specialities_id_seq'::regclass);


--
-- Name: doctor_temporary_unavailables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_temporary_unavailables ALTER COLUMN id SET DEFAULT nextval('public.doctor_temporary_unavailables_id_seq'::regclass);


--
-- Name: doctors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors ALTER COLUMN id SET DEFAULT nextval('public.doctors_id_seq'::regclass);


--
-- Name: emirates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emirates ALTER COLUMN id SET DEFAULT nextval('public.emirates_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: faq id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faq ALTER COLUMN id SET DEFAULT nextval('public.faq_id_seq'::regclass);


--
-- Name: help id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help ALTER COLUMN id SET DEFAULT nextval('public.help_id_seq'::regclass);


--
-- Name: hospital_doctor_feedback id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital_doctor_feedback ALTER COLUMN id SET DEFAULT nextval('public.hospital_doctor_feedback_id_seq'::regclass);


--
-- Name: hospital_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital_images ALTER COLUMN id SET DEFAULT nextval('public.hospital_images_id_seq'::regclass);


--
-- Name: hospital_insurance_policies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital_insurance_policies ALTER COLUMN id SET DEFAULT nextval('public.hospital_insurance_policies_id_seq'::regclass);


--
-- Name: hospital_insurances id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital_insurances ALTER COLUMN id SET DEFAULT nextval('public.hospital_insurances_id_seq'::regclass);


--
-- Name: hospital_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital_locations ALTER COLUMN id SET DEFAULT nextval('public.hospital_locations_id_seq'::regclass);


--
-- Name: hospital_services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital_services ALTER COLUMN id SET DEFAULT nextval('public.hospital_services_id_seq'::regclass);


--
-- Name: hospital_specialities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital_specialities ALTER COLUMN id SET DEFAULT nextval('public.hospital_specialities_id_seq'::regclass);


--
-- Name: hospitals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospitals ALTER COLUMN id SET DEFAULT nextval('public.hospitals_id_seq'::regclass);


--
-- Name: insurence_policies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurence_policies ALTER COLUMN id SET DEFAULT nextval('public.insurence_policies_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- Name: licence_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licence_types ALTER COLUMN id SET DEFAULT nextval('public.licence_types_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: medical_conditions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_conditions ALTER COLUMN id SET DEFAULT nextval('public.medical_conditions_id_seq'::regclass);


--
-- Name: members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: mydrworld_service_feedback id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mydrworld_service_feedback ALTER COLUMN id SET DEFAULT nextval('public.mydrworld_service_feedback_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: profile_bios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_bios ALTER COLUMN id SET DEFAULT nextval('public.profile_bios_id_seq'::regclass);


--
-- Name: qualifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qualifications ALTER COLUMN id SET DEFAULT nextval('public.qualifications_id_seq'::regclass);


--
-- Name: role_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions ALTER COLUMN id SET DEFAULT nextval('public.role_permissions_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: special_intrests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.special_intrests ALTER COLUMN id SET DEFAULT nextval('public.special_intrests_id_seq'::regclass);


--
-- Name: specialties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialties ALTER COLUMN id SET DEFAULT nextval('public.specialties_id_seq'::regclass);


--
-- Name: sub_insurence_policies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_insurence_policies ALTER COLUMN id SET DEFAULT nextval('public.sub_insurence_policies_id_seq'::regclass);


--
-- Name: temp_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users ALTER COLUMN id SET DEFAULT nextval('public.temp_users_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: agent_user_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agent_user_details (id, user_id, gender, country_id, emirate_id, area_id, address, callcenter_id) FROM stdin;
1	13	male	229	2	1	testing	\N
2	29	male	229	2	1	address	\N
3	32	male	229	2	2	Almanara	\N
4	63	male	229	2	1	al	\N
5	76	female	229	2	1	Al	\N
6	77	female	229	2	1	Al	\N
\.


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointments (id, appointment_id, booking_date, time_slot, booking_status, hospital_id, patient_id, doctor_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.areas (id, name_en, name_ar, active, deleted_at, created_at, updated_at, country_id, emirate_id) FROM stdin;
1	JLT	أبراج بحيرات جميرا	1	\N	2024-05-24 06:49:42	2024-05-24 06:49:42	229	2
2	Marina	مارينا	1	\N	2024-05-24 06:50:12	2024-05-24 06:50:12	229	2
3	Arabian Ranches	المرابع العربية	1	\N	2024-05-24 06:50:39	2024-05-24 06:50:39	229	2
4	Musaffa	mall	1	\N	2024-06-28 04:47:51	2024-07-02 04:59:31	229	3
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles (id, title_en, title_ar, status, desc_en, desc_ar, meta_title, meta_keyword, meta_description, created_at, updated_at, type) FROM stdin;
8	Terms of use	Terms of use	1	<p>Terms of use</p>	<p>Terms of use</p>	\N	\N	\N	2024-06-29 09:48:18	2024-06-29 09:48:18	3
11	Terms of use	Terms of use	1	<p>Terms of use</p>	<p>Terms of use</p>	\N	\N	\N	2024-06-29 09:54:17	2024-06-29 09:54:17	4
13	About Us	About Us	1	<p>About Us</p>	<p>About Us</p>	\N	\N	\N	2024-06-29 09:55:32	2024-06-29 09:55:32	5
14	Terms of use	Terms of use	1	<p>Terms of use</p>	<p>Terms of use</p>	\N	\N	\N	2024-06-29 09:55:42	2024-06-29 09:55:42	5
6	Terms and Conditions	Terms and Conditions	1	<p>Terms and Conditions</p>	<p>Terms and Conditions</p>	\N	\N	\N	2024-06-29 09:47:44	2024-06-29 10:55:19	1
1	About Us	About Us	1	<p><strong>About Us</strong><br>Are you looking for a simple solution to get the best medical care for you and your family?</p><p>MyDrWorld is a leading digital platform that showcases many of the &nbsp;best healthcare practitioners and healthcare providers in the UAE. Healthcare is something that cannot be compromised. So, &nbsp;our main aim is to connect &nbsp;people with healthcare providers and expert healthcare professionals to deliver high-quality medical care for all.<br>With our &nbsp;extensive database of doctors/clinics/hospitals, and information about their expertise, we ensure that people have access to the &nbsp;right healthcare at the right time</p><p><strong>Our Vision</strong><br>At MyDrWorld, we strive to revolutionize the delivery of healthcare services across the region. We believe that everyone should have easy access to the best possible healthcare. Our vision is to connect healthcare professionals and society in a seamless and empowering way, driving significant improvements in health outcomes for the entire community.</p><p><strong>Our Mission</strong><br>Our mission is to create a cutting-edge platform that connects the community with healthcare professionals and providers, fostering collaboration, communication, and innovation in the healthcare industry. We're committed to providing the best possible access to healthcare services for our community, while supporting our doctors and healthcare providers to deliver the highest standard of care. We're passionate about providing a platform that enables healthcare professionals to showcase their expertise and excellence, and we're dedicated to empowering them in delivering exceptional healthcare services.</p><p><strong>What we offer</strong><br>MyDrWorld App provides a comprehensive directory with detailed and verified information about doctors, hospitals, and clinics. Through this highly advanced digital platform, people can make online appointments with their preferred doctors/hospitals/clinics based on their insurance, and their location.</p><p>Core Features</p><p>1.&nbsp;&nbsp;&nbsp;&nbsp;Online Appointment Booking 24/7: Users can book doctor appointments online at any time, 24/7, for added convenience.<br>2.&nbsp;&nbsp;&nbsp;&nbsp;Easy Rescheduling and Cancellation: Patients can reschedule or cancel appointments with just a few clicks<br>3.&nbsp;&nbsp;&nbsp;&nbsp;Advanced Filters for Doctor Selection Robust filtering options, including location, specialisation, gender preference, language, insurance .<br>4.&nbsp;&nbsp;&nbsp;&nbsp;Appointment reminders and follow-ups: Automated appointment reminders via email or SMS to minimize no-shows.<br>5.&nbsp;&nbsp;&nbsp;&nbsp;Instant Appointments : Users can secure Instant appointments for immediate consultations within 2 hours<br>6.&nbsp;&nbsp;&nbsp;&nbsp;Comprehensive Doctor Profiles :Doctors can showcase their expertise, qualifications, certifications, and specialization areas.<br>&nbsp;</p>	<p>About Us</p>	\N	\N	\N	2024-06-29 09:45:27	2024-06-29 11:00:19	2
3	Privacy & Internet Cookies Policy	\N	1	<p><strong>Contact Information</strong><br>MyDrWorld.com may collect and record certain information such as your name, mobile/WhatsApp number, and email ID to protect your account from unauthorized access. We do not collect any information from users entering as guests (collectively referred to as "Personally Identifiable Information" or "PII"). MYDRWORLD.COM also uses web analytics software to track and analyse site traffic for advertising and promotional purposes. These statistics may be published or shared with third parties without including PII.</p><p>Your IP address is automatically assigned by your Internet Service Provider (ISP) and logged in our server files whenever you visit the site, along with the time and pages visited. Collecting IP addresses is standard practice on the internet and is done automatically by many websites.</p><p><strong>Uses of Information</strong><br>The information you provide is used to confirm your booking and to communicate with you in case of any issues. Registration with MyDrWorld.com requires supplying a phone number or other contact information. MyDrWorld.com uses both personally identifiable information and non-personally identifiable information (such as anonymous user usage data, cookies, IP addresses, browser type, clickstream data, etc.) to improve the quality and design of our application, and to develop new features, promotions, functionality, and services. This is done by storing, tracking, analyzing, and processing user preferences and trends, as well as user activity and communications.</p><p><strong>Reports</strong><br>MyDrWorld.com is a service provider platform and does not offer medical or health services. Nothing posted on the platform should be taken as medical, dental, nursing, or other healthcare professional services. For medical records, lab reports, or any other medical documents, please contact your relevant hospital or clinic directly.</p><p><strong>Healthcare Providers</strong><br>Healthcare providers and other third parties who have registered with MyDrWorld.com and entered into a subscription agreement regarding our appointment booking facility are subject to a service agreement with additional provisions on how we use personal data. We recommend reviewing the healthcare provider's privacy policy to understand how they process your personal data.</p><p><strong>Third Party Sites</strong><br>The platform may include links to third-party websites, plug-ins, and applications, including those of healthcare providers. These third-party sites are not owned or controlled by MyDrWorld.com, and we are not responsible for their content.</p><p><strong>Cookies</strong><br>When you visit MyDrWorld.com, our server sends a "cookie" to your computer. Cookies save time by retaining your contact information and can only be read by the server that sent them. They do not deliver viruses. You can accept or decline cookies by modifying your browser settings. Accepting cookies allows you to use all features of MyDrWorld.com without re-entering your information.<br><br><strong>Protection</strong><br>Our website has secure pages for collecting user information, and critical data is stored in encrypted form. We use various technical and management practices to protect the confidentiality, security, and integrity of data stored on our system. Our servers use Secure Sockets Layer (SSL) and encryption technology compatible with Netscape Navigator, Microsoft Internet Explorer, Firefox, Safari, and Chrome.</p><p><strong>Security</strong><br>We employ reasonable organizational, technical, and administrative measures to protect PII under our control. However, no data transmission over the internet or data storage system can be guaranteed to be 100% secure. Please do not send sensitive information via email. If you believe your interaction with us is no longer secure (e.g., if you suspect your account security has been compromised), immediately notify us in accordance with the "Contacting Us" section below. Note that notifying us via physical mail will delay our response.</p><p><strong>Policy Amendment</strong><br>MyDrWorld.com may amend the Privacy Policy and will publish updates on the website periodically.</p><p><strong>Contacting Us</strong><br>All comments and inquiries should be addressed to MyDrWorld.com.</p>	<p>Privacy Policy</p>	\N	\N	\N	2024-06-29 09:46:38	2024-06-30 05:30:16	2
2	Terms and Conditions	Terms and Conditions	1	<p>This Subscription Agreement (hereinafter “<strong>Agreement</strong>”) is a legal contract between you, (hereinafter referred to as “<strong>Subscriber</strong>”) and MyDrWorld LLC with its principal place of business located at Dubai , UAE (hereinafter referred to as “<strong>MyDrWorld</strong>”), for access to the MyDrWorld Software. BE SURE TO CAREFULLY READ AND UNDERSTAND ALL OF THE RIGHTS AND RESTRICTIONS DESCRIBED IN THIS AGREEMENT BEFORE USING THE MYDRWORLD SOFTWARE. BY USING THE MYDRWORLD SOFTWARE, YOU INDICATE YOUR PERSONAL ACCEPTANCE AND YOUR CONCURRENCE TO BE BOUND BY THE TERMS OF THIS AGREEMENT. IF YOU DO NOT AGREE TO THE TERMS OF THIS AGREEMENT, PLEASE DO NOT USE THE MYDRWORLD SOFTWARE.</p><p>Subscriber hereby acknowledges that MyDrWorld has designed and developed certain proprietary software defined below as MyDrWorld Software to be used by individuals/establishments looking for patient relationship management, software solutions; and associated hardware(s); and that MyDrWorld intends to make available such MyDrWorld Software, to the Subscriber(s) to enable the Subscriber(s) to upgrade its Outpatient department (OPD) in order to attract and delight patients, facilitate and manage (i) SMS and web based appointment booking system; (ii) doctor schedule and queue management; (iii) actionable patient contact base; and (iv) patient communication system for follow-up visit and alerts in order to improve patient satisfaction (v) improve conversion from out-patient to in-patient (“<strong>Purpose</strong>”). The Subscriber, being a third party / end customer, desires to use the MyDrWorld Software for the Purpose, and not for redistribution.</p><p><strong>1.&nbsp;Definitions</strong></p><p><strong>1.1 “MyDrWorld Software”</strong>&nbsp;shall mean, collectively or individually, the software created/ designed by &nbsp; &nbsp; MyDrWorld identified in&nbsp;Exhibit A&nbsp;of this Agreement that is provided to the Subscriber(s) on a &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; subscription basis for the Purpose, including the Updates (defined below).</p><p><strong>1.2&nbsp;</strong>“<strong>Updates</strong>” shall mean enhancements, bug fixes, updates and new versions made to the MyDrWorld &nbsp; Software by MyDrWorld and provided to the Subscriber by MyDrWorld.</p><p><strong>1.3“Upgrades</strong>” shall mean replacement of the MyDrWorld Software with a newer or better version in &nbsp; &nbsp; &nbsp; order to bring the system up to date or improve the characteristics of the MyDrWorld Software.</p><ol><li><strong>Intellectual property rights.</strong></li></ol><p><strong>&nbsp;2.1 Ownership</strong>. MyDrWorld retains all right, title and interest in and to and ownership of all MyDrWorld Software, to all Updates and all modifications and the intellectual property rights thereto. MyDrWorld does not transfer either the title or the intellectual property rights of the MyDrWorld Software and its subscription services to the Subscriber(s).</p><p><strong>2.2 Preservation of MyDrWorld’s Notices</strong>. The Subscriber agrees not to (and not to allow others to) remove, alter, cover over, or deface MyDrWorld’s proprietary notices which appear in or in connection with the MyDrWorld Software as provided by MyDrWorld to the Subscriber under this Agreement. Additionally, MyDrWorld may include Subscriber’s name and/or logo within its list of customers for general promotional purposes.</p><p><strong>2.3 Subscription to the Subscriber</strong>. Subject to all limitations and restrictions contained herein, MyDrWorld grants to the Subscriber a subscription, software as a service (‘SaaS’), non-exclusive, and non-transferable right to access and operate the object code form of the MyDrWorld Software, as hosted by MyDrWorld (“Use”). Subscriber shall have a limited right and license to Use the MyDrWorld Software solely for its internal purposes, to perform the functions described under&nbsp;Exhibit A&nbsp;for the Purpose. Subscriber shall not allow any website that is not fully owned by the Subscriber to frame, syndicate, distribute, replicate, or copy any portion of the Subscriber’s website that provides direct or indirect access to the MyDrWorld Software. Unless otherwise expressly permitted in this Agreement under&nbsp;Exhibit A, Subscriber shall not permit any subsidiaries, affiliated companies, or third parties to access the MyDrWorld Software. The Subscriber shall be provided with log-in credentials to the MyDrWorld Software by the MyDrWorld representative.</p><p><strong>2.4 Implementation and Training.&nbsp;</strong>MyDrWorld shall initiate the implementation of the MyDrWorld Software for the Subscriber which might include creating the segregated hosting environment and effecting necessary interfaces for the MyDrWorld Software upon mutual agreement between the parties. The start date of the subscription period shall be referred to as the “Commencement Date” which is fifteen (15) from the date of clearance of the payments. Further, the Subscriber shall conduct the necessary training for the Subscriber’s Authorized Users (as defined below) and the administrator of the MyDrWorld Software with respect to the use and operation of all modules or components of MyDrWorld Software (“<strong>Implementation and Training</strong>”). The Subscriber shall ensure the availability of the Authorized Users for the referred training.</p><p><strong>2.5 Free Trial</strong>. MyDrWorld may offer at its discretion, a free trial of the MyDrWorld Software for a specified time period. During such trial period, the Subscriber shall be bound by the terms of this Agreement and any applicable law, regulation and generally accepted practices or guidelines in the relevant jurisdictions. Any data which the Subscriber enters into the MyDrWorld Software, and any customizations made to the MyDrWorld Software by or for the Subscriber, during the Subscriber’s free trial will be permanently lost at the expiry of the specified time period unless the Subscriber Upgrades his/her/its subscription to one of the paid subscription plans. MyDrWorld does not provide any warranty during the trial period.</p><p><strong>2.6 Customization to the MyDrWorld Software</strong>. MyDrWorld has the sole right to modify any feature or customize them at its discretion and there shall be no obligation to honor customization requests of the Subscriber.&nbsp;</p><p><strong>2.7 Functionality Changes</strong>. MyDrWorld reserves the right to add new functionality and modify existing functionality to the MyDrWorld Software as and when it deems fit, and make any such changes available in newer versions of the MyDrWorld Software or native mobile application or all of these at its discretion. The Subscriber will be duly notified upon release of such newer versions and MyDrWorld reserves the right to automatically Upgrade all its users, including the Subscriber, to the latest version of the MyDrWorld Software as and when MyDrWorld deems fit. MyDrWorld reserves the right to extend and withdraw the “Book” functionality to the Subscriber at MyDrWorld’s sole discretion. The terms and conditions pertaining to the Book functionality is more fully described in Schedule No. 3 located at https://www.MyDrWorld.com/company/terms.</p><p><strong>2.8 Subscriber Information</strong>. Any communication sent by or through MyDrWorld or the MyDrWorld Software to the clients or customers of the Subscriber is based solely on information uploaded by the Subscriber on the MyDrWorld Software. The accuracy and completeness of such information (including but not limited to contact details of the client or customer) is the sole responsibility of the Subscriber. MyDrWorld will not be responsible for the incompleteness or inaccuracy of such information, including if as a result of such inaccuracy, a communication is sent to an unintended recipient.</p><p><strong>2.9 Additional Restrictions.</strong>&nbsp;In no event shall the Subscriber disassemble, decompile, or reverse engineer the MyDrWorld Software or permit others to do so.&nbsp; Disassembling, decompiling, and reverse engineering include, without limitation: (i) converting the MyDrWorld Software from a machine-readable form into a human-readable form; (ii) disassembling or decompiling the MyDrWorld Software by using any means or methods to translate machine-dependent or machine-independent object code into the original human-readable source code or any approximation thereof; (iii) examining the machine-readable object code that controls MyDrWorld Software’s operation and creating the original source code or any approximation thereof by, for example, studying MyDrWorld Software’s behavior in response to a variety of inputs; or (iv) performing any other activity related to the MyDrWorld Software that could be construed to be reverse engineering, disassembling, or decompiling.&nbsp; The Subscriber agrees to immediately report to MyDrWorld any unauthorized use or infringement of the MyDrWorld Software that comes to its attention</p><p><strong>2.10 Authorized Users.</strong>&nbsp;Unless otherwise specifically provided in the Agreement, “Authorized Users” will only consist of: (i) employees or consultants of the Subscriber, and (ii) subject to Section 5 (“Confidentiality”), third party contractors of the Subscriber who do not compete with MyDrWorld (“Permitted Contractors”). Permitted Contractors may Use the MyDrWorld Software only at the Subscriber’s place of business and/or the mobile application or in the presence of Subscriber personnel. Subscriber is fully liable for the acts and omissions of Permitted Contractors under this Agreement.</p><p><strong>2.11 Feedback&nbsp;</strong>Subscriber acknowledges that the MyDrWorld Software shall include the ability for users of the Subscriber’s service (“End-Users”) to provide Feedback on such service using the MyDrWorld Software. Subscriber acknowledges that MyDrWorld shall be entitled to, in its sole discretion, to publish or not publish such Feedback or to retain or not retain such Feedback and to moderate such Feedback, as required. “Feedback” for the purposes of this Agreement shall mean feedback, ratings and review provided by End-Users to the Subscriber’s service made available by MyDrWorld on the MyDrWorld Software. Any communication sent by the Subscriber to its clients or customers (whether or not End-Users) based on information collected by the Subscriber of its clients or customers will be sole responsibility of the Subscriber. The Subscriber must ensure accuracy of such communication sent, and must ensure that it is sent to the intended recipient.</p><ol><li><strong>Technical Support.</strong></li></ol><p><strong>&nbsp;3.1 Subscriber Support</strong>. MyDrWorld provides, at its discretion basic support for the MyDrWorld Software subscribed by the Subscriber at no additional charge, and/or upgraded support if purchased separately and will use commercially reasonable efforts to make the subscription services available from 10 AM to 6.30 PM, Monday through Saturday excluding national holidays, except for (i) planned downtime (for which MyDrWorld shall give at least eight (8) hours’ notice to the Subscribe(s) and which MyDrWorld shall schedule to the extent practicable during the weekend hours from 6:00 p.m. regional’s&nbsp; Standard Time ( Friday to 6:00 a.m. regional’s Standard Time Monday, or (ii) any unavailability caused by circumstances beyond MyDrWorld’s reasonable control, including without limitation, acts of God, acts of government, flood, fire, earthquakes, civil unrest, acts of terror, strikes or other labour problems, or internet service provider failures or delays.</p><p><strong>4.Confidentiality</strong></p><p><strong>&nbsp;4.1 Confidential Information</strong>. The parties to this Agreement undertake to retain in confidence all information disclosed to the other party in relation to this Agreement that the disclosing party has designated as being confidential in writing or if disclosed orally, or if, designated as confidential at the time of such disclosure and reduced to writing conspicuously marked as confidential and sent to such other party within thirty (30) days thereof (“<strong>Confidential Information</strong>“). The terms and conditions of this Agreement including its Exhibits shall be considered Confidential Information.</p><p><strong>4.2 Exclusions</strong>. “Confidential Information” will not include information that: (a) is or becomes generally known or available by publication, commercial use or otherwise through no fault of the receiving party; (b) the receiving party can demonstrate to have had rightfully in its possession and without restriction, prior to disclosure hereunder; (c) is independently developed by the receiving party without use of the disclosing part’s Confidential&nbsp; Information, as can be shown by tile written records of the receiving party; (d) is lawfully obtained from a third party who has the right to make such disclosure; or (e) is released for publication by the disclosing party in writing.&nbsp; A receiving party also may disclose disclosing party’s Confidential Information to the extent required by a court or other governmental authority, provided that the receiving party promptly notifies the disclosing party of the disclosure requirement and cooperates with the disclosing party (at the latter’s expense and at its request) to resist or limit the disclosure.</p><p><strong>4.3 Protection of Confidential Information</strong>. Each party agrees to protect the other party’s Confidential Information to the same extent that it protects its own confidential information of a similar nature and shall take all reasonable precautions to prevent any unauthorized disclosure of Confidential Information to third parties. A party may disclose other party’s Confidential Information to its directors, officers, employees and third party contractor(s) (“Representatives”) on a need to know basis and to the extent necessary for the purpose of this Agreement. If a party provides Confidential Information of the other party to its Representatives, then it will ensure that such Representatives have entered into a written confidentiality agreement with the part providing such information to the Representatives protecting such Confidential Information from unauthorized disclosure or improper use. Obligations of confidentiality under this Agreement shall survive the termination or expiration of the Agreement for a period of three (3) years; save for Confidential Information constituting trade secrets, in which event the obligations shall subsist indefinitely.</p><p><strong>5.Representations and Warranties.</strong></p><p><strong>&nbsp;5.1 By the Subscriber.&nbsp;</strong>The Subscriber represents and warrants that the (a) Subscriber is 18 years of age or older and has the right, authority and capacity under the applicable law to use the MyDrWorld Software and enter into this Agreement; (b) Subscriber will not transfer (including by way of sublicense, lease, assignment or other transfer, including by operation of law) their login and Account details or right to use the MyDrWorld Software to any third party; (c) information given to MyDrWorld or uploaded on the MyDrWorld Software by the Subscriber will always be true, accurate, correct, complete and up to date, to the best of the Subscriber’s knowledge that the Subscriber has the necessary rights from the end-user to upload such information on the MyDrWorld Software, including but not limited to end-user health records (“User Content”), and that such right from the end-user shall include an explicit right for MyDrWorld to reflect and map the User Content with an account of such user as may be created by such user through the MyDrWorld website and for MyDrWorld to further store and use the User Content for the purposes of MyDrWorld’s business and for providing such other services in the region and outside region, as may be applicable; (d) Subscriber will not use the MyDrWorld Software for any unauthorized and unlawful purpose; (e) Subscriber will not engage in any activity that interferes with or disrupts the MyDrWorld Software or the servers and networks which are connected to the MyDrWorld Software; (f) Subscriber will not reproduce, duplicate, copy, transfer, license, rent, sell, trade or resell the MyDrWorld Software for any purpose whatsoever; (g) comply with all laws, regulations, and ordinances applicable to the Subscriber and its business and relating to the use of the MyDrWorld Software under this Agreement; and (h) Subscriber will be subscribing to the MyDrWorld Software only for the Purpose.</p><p><strong>5.2 By MyDrWorld.&nbsp;</strong>The MyDrWorld Software provided by MyDrWorld is provided “as is”, “as available” and MyDrWorld makes no express or implied representations or warranties about its subscription services and/ or the MyDrWorld Software or of merchantability or fitness for a particular purpose or use or non-infringement. MyDrWorld does not authorize anyone to make a warranty on MyDrWorld’s behalf and you may not rely on any statement of warranty as a warranty by MyDrWorld.</p><p><strong>&nbsp;6.Representations and Warranties.</strong></p><p><strong>&nbsp;6.1 MyDrWorld Indemnity.</strong>&nbsp;MyDrWorld shall indemnify, hold harmless and, defend the Subscriber from and against any and all final court awarded damages that are attributable to claim by a third party indicating that the MyDrWorld Software infringes such third party intellectual property rights; provided that: (a) the Subscriber gives MyDrWorld prompt notice in writing of any such suit and permits MyDrWorld, through counsel of its choice, to answer the charge of infringement and defend such claim or suit; (b) the Subscriber provides information, assistance and authority to enable MyDrWorld to defend such suit; and (c) MyDrWorld shall not be responsible for any settlement made by the Subscriber without MyDrWorld’s prior written permission provided, however that such permission shall not be unreasonably withheld.</p><p><strong>6.2&nbsp;Exclusions.&nbsp;</strong>MyDrWorld shall have no liability set forth in Section 7.1 above: (a) for any claim or suit, where such claim or suit would have been avoided but for the effect on the MyDrWorld Software caused by other software or hardware by the Subscriber; (b) for infringement of any intellectual property or proprietary rights arising in whole or in part from changes made to any MyDrWorld Software by any party other than MyDrWorld; and (c) where the allegedly infringing activity continues after the Subscriber has being notified thereof or has been informed of modifications that would have avoided the alleged infringement by MyDrWorld.</p><p><strong>&nbsp;6.3 Subscriber Indemnity.</strong>&nbsp;The Subscriber will defend, indemnify, and hold harmless MyDrWorld, its corporate affiliates, or any of its or their respective directors, officers, owners, employees, agents, successors, and permitted assigns from and against any and all third-party claims, suits, proceedings, costs, and expenses (including, without limitation, attorneys’ fees) arising from or related to the Subscriber’s (a) breach of the confidentiality obligations, breach of intellectual property provisions and breach of representation and warranties provisions herein; (b) violation of any applicable law.</p><p><strong>7.Limitation of Liability.</strong></p><p><strong>Lol.</strong>&nbsp;In no event shall mydrworld be liable to the subscriber for any lost or corrupted data, downtime, lost profits, business interruption, replacement service or other special, incidental, consequential, punitive or indirect damages, however caused and regardless of theory of liability, including without limitation negligence and (b) in no event shall the total aggregate liability of mydrworld, for all claims arising out of or under this agreement, exceed the amount that the subscriber has paid or will pay to mydrworld for the mydrworld software under this agreement in the twelve (12) months preceding the most recent claim.</p><p><strong>8.Term and Termination.</strong></p><p><strong>8.1&nbsp;Term.&nbsp;</strong>This Agreement will remain in full force and effect for a period of one (1) year unless terminated by the parties in accordance with the provisions mentioned hereunder. This Agreement shall automatically renew for one (1) year period unless a party expresses his/her/its intention to terminate the agreement by providing sixty (60) days’ notice to the other party.</p><p><strong>8.2 Termination for Convenience.</strong>&nbsp;The Subscriber can request for termination of his/her/its subscription of the MyDrWorld Software at any time by providing sixty (60) days’ prior written notice to the address of MyDrWorld mentioned in clause 10.3. During this sixty (60) day period, MyDrWorld will investigate and ascertain the fulfilment of any ongoing subscription services or pending dues related to subscription fees or any other fees by the Subscriber. MyDrWorld reserves the right to terminate the association with the Subscriber at any time by providing thirty (30) days’ prior written notice to the Subscriber to the addresses mentioned in Clause 10.3.</p><p><strong>8.3 Termination for Cause.</strong>&nbsp;Each party reserves the right to terminate this Agreement if the other party breaches a material obligation under this Agreement and such breach remains uncured for a period of thirty (30) days from the date of notification of the non-breaching party.</p><p><strong>&nbsp;8.4 Effect of termination</strong>. On termination of this Agreement due to the reasons mentioned herein, MyDrWorld reserves the right to immediately terminate the subscription of the MyDrWorld Software to the Subscriber. Nothing contained in this Agreement shall restrict MyDrWorld’s use of the data or right to publish information made available by the Subscriber in the public domain through the subscription services or any other platform managed by MyDrWorld after the termination or expiry of this Agreement. After a 30 (thirty) day period from the date of termination of the Agreement, MyDrWorld shall then provide/share any Subscriber data and shall thereafter, unless legally prohibited, delete all Subscriber’s data in its systems or otherwise in its possession or under its control. In cases where the Subscriber terminates the subscription voluntarily, it will be the sole responsibility of the Subscriber to make a copy of their data before terminating the subscription. End-Users data will not be available after termination of subscription in such cases.</p><p>9.&nbsp;<strong>Term and Termination.</strong></p><p><strong>9.1 Assignment.</strong>The Subscriber may not assign this Agreement or any rights herein without the prior, written consent of MyDrWorld.</p><p><strong>9.2 Waiver.</strong>Failure or delay on the part of a party to exercise any right, power, privilege or remedy hereunder shall not constitute a waiver thereof. A waiver of default shall not operate as a waiver of any other default or of the same type of default on future occasions.</p><p><strong>9.3&nbsp;Notices.</strong>&nbsp;All notices and other communications pertaining to this Agreement shall be in writing and shall be deemed to have been given by a party hereto as set forth below and shall either be (a) personally delivered; (b) sent via postage prepaid certified mail, return receipt requested; (c) sent by nationally-recognized private express courier or (d) sent via fax provided that a confirmation copy is sent via one of the other methods described herein. Notices shall be deemed to have been given on the date of receipt if personally delivered or via fax, or two (2) days after deposit via certified mail or express courier. A party may change its address for purposes hereof by written notice to the other in accordance with the provision of this section. The addresses for the parties are as follows:</p><p><strong>MyDrWorld:</strong>&nbsp;Dubai ,UAE</p><p><strong>Subscriber:</strong>&nbsp;As mentioned in the invoice</p><p><strong>9.4&nbsp;Severability.&nbsp;</strong>If any portion of this Agreement is held invalid, the parties agree that such invalidity sshall not affect the validity of the remaining portions of this Agreement, and the parties further agree to substitute for the invalid provision a valid provision that most closely approximates the economic effect and intent of the invalid provision.</p><p><strong>9.5&nbsp;Independent Parties.&nbsp;</strong>The parties acknowledge that neither party is an agent or employee of the other party, and that neither party has any authority to bind the other party to any agreement or obligation.</p><p><strong>9.6&nbsp;Governing Law.&nbsp;</strong>Any dispute, claim or controversy arising out of or relating to this Agreement, will be governed by the laws of&nbsp; UAE and the courts in UAE shall have exclusive jurisdiction over any disputes arising out of or in relation to this Agreement.</p><p><strong>9.7&nbsp;Headings.&nbsp;</strong>Paragraph headings have been included in this Agreement merely for convenience of reference. They shall not be considered part of, or be used in interpreting, this Agreement.</p><p><strong>9.8&nbsp;Counterparts.&nbsp;</strong>This Agreement may be executed in two or more counterparts, each of which shall be deemed an original and all of which taken together shall constitute one and the same Agreement.</p><p><strong>9.9&nbsp;Survival</strong>. The provisions of Sections 2, 4, 5, 6, 7, 8, 9 and 10 shall survive expiration or termination of this Agreement for any reason.</p><p><strong>9.10&nbsp;Entire Agreement.&nbsp;</strong>This Agreement and the Exhibits attached hereto constitute the entire agreement between the parties with respect to the subject matter hereof and supersede all proposals, oral or written, all previous negotiations and all previous communications between the parties with respect thereto.</p><p><strong>9.11&nbsp;Additional terms</strong>. MyDrWorld reserves the right to modify this Agreement at any time without giving the Subscriber any prior notice. Subscriber’s use of the MyDrWorld Software following any such modification constitutes Subscriber’s agreement to follow and be bound by this Agreement as modified. Any additional terms and conditions, disclaimers, privacy policies and other policies applicable to general and specific areas of the MyDrWorld Software or to subscription services are also considered as part of this Agreement. By agreeing to these terms, Subscriber also agrees to the terms of use, which are available at MyDrWorld.com/company/terms.</p>	<p>Terms of use</p>	\N	\N	\N	2024-06-29 09:45:56	2024-07-02 04:43:05	2
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: callcenter_user_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.callcenter_user_details (id, user_id, country_id, emirate_id, area_id, address, location, website, deleted_at, created_at, updated_at) FROM stdin;
1	33	229	2	1	812	25.207143889766723,55.26693987298582	hh@hh.com	\N	2024-06-21 06:48:43	2024-06-28 06:25:49
2	62	229	2	1	DFCC	25.20269671060694,55.25470899987791	helocAL.c	\N	2024-06-28 07:23:07	2024-06-28 07:23:07
3	75	229	2	1	Al	25.19445676727194,55.27350425720215	hum.c	\N	2024-06-29 07:14:16	2024-06-29 12:32:51
4	80	229	2	1	duhbai	25.203120200696162,55.263435118999915	hello.com	\N	2024-06-29 12:36:32	2024-06-29 12:36:32
5	81	229	2	1	dubai	25.20696026502463,55.241403579711914	geel.com	\N	2024-06-29 12:39:41	2024-06-29 12:39:41
6	94	229	2	1	Al Ohood Street - Sheikh Mohammed bin Rashid Blvd - Downtown Dubai - Dubai	25.200980491516884,55.27041435241699	tel.c	\N	2024-07-02 05:05:34	2024-07-02 05:05:34
\.


--
-- Data for Name: contact_us; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_us (id, name, email, dial_code, mobile, message, reply, created_at, updated_at) FROM stdin;
1	test name	test2@gmail.com	+92		test message	\N	2024-07-01 10:41:37	2024-07-01 10:41:37
2	test	test@gmail.com	+971		31231313123	\N	2024-07-02 20:41:02	2024-07-02 20:41:02
3	moin test	test91@gmail.com	+971		1234567890	\N	2024-07-02 20:47:11	2024-07-02 20:47:11
4	Anil Navis	fh@fgg.com	+971		523243164	\N	2024-07-03 02:47:08	2024-07-03 02:47:08
5	Devika	devika@dxbapps.com	+971		support centre	\N	2024-07-03 05:43:45	2024-07-03 05:43:45
\.


--
-- Data for Name: contact_us_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_us_settings (id, title_en, title_ar, email, mobile, desc_en, desc_ar, location, latitude, longitude, twitter, instagram, facebook, youtube, linkedin, created_at, updated_at) FROM stdin;
1	MyDrWorld	\N	info@mydrworld.com	+97154866869	\N	\N	673C+W8M - Dubai - United Arab Emirates	\N	\N	\N	\N	\N	\N	\N	\N	2024-07-01 10:08:27
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, name, prefix, dial_code, active, created_at, updated_at, deleted_at, name_ar) FROM stdin;
1	Afghanistan	AF	93	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
2	Aland Islands	AX	358	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
3	Albania	AL	355	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
4	Algeria	DZ	213	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
5	AmericanSamoa	AS	1684	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
6	Andorra	AD	376	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
7	Angola	AO	244	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
8	Anguilla	AI	1264	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
9	Antarctica	AQ	672	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
10	Antigua and Barbuda	AG	1268	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
11	Argentina	AR	54	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
12	Armenia	AM	374	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
13	Aruba	AW	297	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
14	Australia	AU	61	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
15	Austria	AT	43	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
16	Azerbaijan	AZ	994	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
17	Bahamas	BS	1242	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
18	Bahrain	BH	973	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
19	Bangladesh	BD	880	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
20	Barbados	BB	1246	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
21	Belarus	BY	375	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
22	Belgium	BE	32	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
23	Belize	BZ	501	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
24	Benin	BJ	229	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
25	Bermuda	BM	1441	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
26	Bhutan	BT	975	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
27	Bolivia, Plurinational State of	BO	591	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
28	Bosnia and Herzegovina	BA	387	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
29	Botswana	BW	267	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
30	Brazil	BR	55	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
31	British Indian Ocean Territory	IO	246	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
32	Brunei Darussalam	BN	673	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
33	Bulgaria	BG	359	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
34	Burkina Faso	BF	226	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
35	Burundi	BI	257	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
36	Cambodia	KH	855	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
37	Cameroon	CM	237	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
38	Canada	CA	1	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
39	Cape Verde	CV	238	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
40	Cayman Islands	KY	 345	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
41	Central African Republic	CF	236	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
42	Chad	TD	235	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
43	Chile	CL	56	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
44	China	CN	86	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
45	Christmas Island	CX	61	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
46	Cocos (Keeling) Islands	CC	61	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
47	Colombia	CO	57	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
48	Comoros	KM	269	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
49	Congo	CG	242	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
50	Congo, The Democratic Republic of the Congo	CD	243	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
51	Cook Islands	CK	682	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
52	Costa Rica	CR	506	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
53	Cote d'Ivoire	CI	225	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
54	Croatia	HR	385	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
55	Cuba	CU	53	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
56	Cyprus	CY	357	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
57	Czech Republic	CZ	420	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
58	Denmark	DK	45	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
59	Djibouti	DJ	253	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
60	Dominica	DM	1767	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
61	Dominican Republic	DO	1849	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
62	Ecuador	EC	593	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
63	Egypt	EG	20	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
64	El Salvador	SV	503	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
65	Equatorial Guinea	GQ	240	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
66	Eritrea	ER	291	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
67	Estonia	EE	372	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
68	Ethiopia	ET	251	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
69	Falkland Islands (Malvinas)	FK	500	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
70	Faroe Islands	FO	298	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
71	Fiji	FJ	679	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
72	Finland	FI	358	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
73	France	FR	33	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
74	French Guiana	GF	594	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
75	French Polynesia	PF	689	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
76	Gabon	GA	241	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
77	Gambia	GM	220	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
78	Georgia	GE	995	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
79	Germany	DE	49	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
80	Ghana	GH	233	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
81	Gibraltar	GI	350	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
82	Greece	GR	30	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
83	Greenland	GL	299	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
84	Grenada	GD	1473	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
85	Guadeloupe	GP	590	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
86	Guam	GU	1671	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
87	Guatemala	GT	502	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
88	Guernsey	GG	44	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
89	Guinea	GN	224	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
90	Guinea-Bissau	GW	245	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
91	Guyana	GY	595	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
92	Haiti	HT	509	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
93	Holy See (Vatican City State)	VA	379	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
94	Honduras	HN	504	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
95	Hong Kong	HK	852	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
96	Hungary	HU	36	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
97	Iceland	IS	354	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
98	India	IN	91	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
99	Indonesia	ID	62	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
100	Iran, Islamic Republic of Persian Gulf	IR	98	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
101	Iraq	IQ	964	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
102	Ireland	IE	353	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
103	Isle of Man	IM	44	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
104	Israel	IL	972	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
105	Italy	IT	39	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
106	Jamaica	JM	1876	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
107	Japan	JP	81	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
108	Jersey	JE	44	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
109	Jordan	JO	962	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
110	Kazakhstan	KZ	77	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
111	Kenya	KE	254	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
112	Kiribati	KI	686	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
113	Korea, Democratic People's Republic of Korea	KP	850	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
114	Korea, Republic of South Korea	KR	82	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
115	Kuwait	KW	965	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
116	Kyrgyzstan	KG	996	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
117	Laos	LA	856	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
118	Latvia	LV	371	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
119	Lebanon	LB	961	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
120	Lesotho	LS	266	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
121	Liberia	LR	231	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
122	Libyan Arab Jamahiriya	LY	218	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
123	Liechtenstein	LI	423	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
124	Lithuania	LT	370	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
125	Luxembourg	LU	352	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
126	Macao	MO	853	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
127	Macedonia	MK	389	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
128	Madagascar	MG	261	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
129	Malawi	MW	265	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
130	Malaysia	MY	60	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
131	Maldives	MV	960	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
132	Mali	ML	223	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
133	Malta	MT	356	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
134	Marshall Islands	MH	692	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
135	Martinique	MQ	596	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
136	Mauritania	MR	222	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
137	Mauritius	MU	230	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
138	Mayotte	YT	262	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
139	Mexico	MX	52	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
140	Micronesia, Federated States of Micronesia	FM	691	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
141	Moldova	MD	373	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
142	Monaco	MC	377	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
143	Mongolia	MN	976	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
144	Montenegro	ME	382	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
145	Montserrat	MS	1664	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
146	Morocco	MA	212	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
147	Mozambique	MZ	258	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
148	Myanmar	MM	95	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
149	Namibia	NA	264	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
150	Nauru	NR	674	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
151	Nepal	NP	977	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
152	Netherlands	NL	31	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
153	Netherlands Antilles	AN	599	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
154	New Caledonia	NC	687	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
155	New Zealand	NZ	64	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
156	Nicaragua	NI	505	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
157	Niger	NE	227	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
158	Nigeria	NG	234	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
159	Niue	NU	683	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
160	Norfolk Island	NF	672	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
161	Northern Mariana Islands	MP	1670	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
162	Norway	NO	47	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
163	Oman	OM	968	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
164	Pakistan	PK	92	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
165	Palau	PW	680	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
166	Palestinian Territory, Occupied	PS	970	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
167	Panama	PA	507	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
168	Papua New Guinea	PG	675	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
169	Paraguay	PY	595	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
170	Peru	PE	51	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
171	Philippines	PH	63	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
172	Pitcairn	PN	872	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
173	Poland	PL	48	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
174	Portugal	PT	351	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
175	Puerto Rico	PR	1939	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
176	Qatar	QA	974	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
177	Romania	RO	40	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
178	Russia	RU	7	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
179	Rwanda	RW	250	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
180	Reunion	RE	262	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
181	Saint Barthelemy	BL	590	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
182	Saint Helena, Ascension and Tristan Da Cunha	SH	290	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
183	Saint Kitts and Nevis	KN	1869	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
184	Saint Lucia	LC	1758	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
185	Saint Martin	MF	590	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
186	Saint Pierre and Miquelon	PM	508	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
187	Saint Vincent and the Grenadines	VC	1784	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
188	Samoa	WS	685	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
189	San Marino	SM	378	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
190	Sao Tome and Principe	ST	239	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
191	Saudi Arabia	SA	966	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
192	Senegal	SN	221	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
193	Serbia	RS	381	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
194	Seychelles	SC	248	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
195	Sierra Leone	SL	232	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
196	Singapore	SG	65	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
197	Slovakia	SK	421	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
198	Slovenia	SI	386	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
199	Solomon Islands	SB	677	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
200	Somalia	SO	252	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
201	South Africa	ZA	27	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
202	South Sudan	SS	211	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
203	South Georgia and the South Sandwich Islands	GS	500	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
204	Spain	ES	34	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
205	Sri Lanka	LK	94	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
206	Sudan	SD	249	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
207	Suriname	SR	597	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
208	Svalbard and Jan Mayen	SJ	47	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
209	Swaziland	SZ	268	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
210	Sweden	SE	46	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
211	Switzerland	CH	41	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
212	Syrian Arab Republic	SY	963	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
213	Taiwan	TW	886	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
214	Tajikistan	TJ	992	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
215	Tanzania, United Republic of Tanzania	TZ	255	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
216	Thailand	TH	66	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
217	Timor-Leste	TL	670	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
218	Togo	TG	228	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
219	Tokelau	TK	690	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
220	Tonga	TO	676	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
221	Trinidad and Tobago	TT	1868	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
222	Tunisia	TN	216	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
223	Turkey	TR	90	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
224	Turkmenistan	TM	993	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
225	Turks and Caicos Islands	TC	1649	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
226	Tuvalu	TV	688	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
227	Uganda	UG	256	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
228	Ukraine	UA	380	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
229	United Arab Emirates	AE	971	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
230	United Kingdom	GB	44	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
231	United States	US	1	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
232	Uruguay	UY	598	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
233	Uzbekistan	UZ	998	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
234	Vanuatu	VU	678	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
235	Venezuela, Bolivarian Republic of Venezuela	VE	58	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
236	Vietnam	VN	84	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
237	Virgin Islands, British	VG	1284	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
238	Virgin Islands, U.S.	VI	1340	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
239	Wallis and Futuna	WF	681	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
240	Yemen	YE	967	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
241	Zambia	ZM	260	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
242	Zimbabwe	ZW	263	1	2024-03-26 05:06:03	2024-03-26 05:06:03	\N	\N
\.


--
-- Data for Name: country_of_origins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country_of_origins (id, name, name_ar, status, created_at, updated_at, deleted_at) FROM stdin;
357	Egypt	\N	1	\N	\N	\N
358	El Salvador	\N	1	\N	\N	\N
359	Equatorial Guinea	\N	1	\N	\N	\N
360	Eritrea	\N	1	\N	\N	\N
361	Estonia	\N	1	\N	\N	\N
362	Eswatini	\N	1	\N	\N	\N
363	Ethiopia	\N	1	\N	\N	\N
364	Faeroe Islands	\N	1	\N	\N	\N
365	Finland	\N	1	\N	\N	\N
366	France	\N	1	\N	\N	\N
367	French Guiana	\N	1	\N	\N	\N
368	Gabon	\N	1	\N	\N	\N
369	Gambia	\N	1	\N	\N	\N
370	Georgia	\N	1	\N	\N	\N
371	Germany	\N	1	\N	\N	\N
372	Ghana	\N	1	\N	\N	\N
373	Gibraltar	\N	1	\N	\N	\N
374	Greece	\N	1	\N	\N	\N
375	Grenada	\N	1	\N	\N	\N
376	Guatemala	\N	1	\N	\N	\N
377	Guinea	\N	1	\N	\N	\N
378	Guinea-Bissau	\N	1	\N	\N	\N
379	Guyana	\N	1	\N	\N	\N
380	Haiti	\N	1	\N	\N	\N
381	Holy See	\N	1	\N	\N	\N
382	Honduras	\N	1	\N	\N	\N
383	Hong Kong	\N	1	\N	\N	\N
384	Hungary	\N	1	\N	\N	\N
385	Iceland	\N	1	\N	\N	\N
386	India	\N	1	\N	\N	\N
387	Indonesia	\N	1	\N	\N	\N
388	Iran	\N	1	\N	\N	\N
389	Iraq	\N	1	\N	\N	\N
390	Ireland	\N	1	\N	\N	\N
391	Isle of Man	\N	1	\N	\N	\N
392	Israel	\N	1	\N	\N	\N
393	Italy	\N	1	\N	\N	\N
394	Jamaica	\N	1	\N	\N	\N
395	Japan	\N	1	\N	\N	\N
396	Jordan	\N	1	\N	\N	\N
397	Kazakhstan	\N	1	\N	\N	\N
398	Kenya	\N	1	\N	\N	\N
399	Kuwait	\N	1	\N	\N	\N
400	Kyrgyzstan	\N	1	\N	\N	\N
401	Laos	\N	1	\N	\N	\N
402	Latvia	\N	1	\N	\N	\N
403	Lebanon	\N	1	\N	\N	\N
404	Lesotho	\N	1	\N	\N	\N
405	Liberia	\N	1	\N	\N	\N
406	Libya	\N	1	\N	\N	\N
407	Liechtenstein	\N	1	\N	\N	\N
408	Lithuania	\N	1	\N	\N	\N
409	Luxembourg	\N	1	\N	\N	\N
410	Macao	\N	1	\N	\N	\N
411	Madagascar	\N	1	\N	\N	\N
412	Malawi	\N	1	\N	\N	\N
413	Malaysia	\N	1	\N	\N	\N
414	Maldives	\N	1	\N	\N	\N
415	Mali	\N	1	\N	\N	\N
416	Malta	\N	1	\N	\N	\N
417	Mauritania	\N	1	\N	\N	\N
418	Mauritius	\N	1	\N	\N	\N
419	Mayotte	\N	1	\N	\N	\N
420	Mexico	\N	1	\N	\N	\N
421	Moldova	\N	1	\N	\N	\N
422	Monaco	\N	1	\N	\N	\N
423	Mongolia	\N	1	\N	\N	\N
424	Montenegro	\N	1	\N	\N	\N
425	Morocco	\N	1	\N	\N	\N
426	Mozambique	\N	1	\N	\N	\N
427	Myanmar	\N	1	\N	\N	\N
428	Namibia	\N	1	\N	\N	\N
429	Nepal	\N	1	\N	\N	\N
430	Netherlands	\N	1	\N	\N	\N
431	Nicaragua	\N	1	\N	\N	\N
432	Niger	\N	1	\N	\N	\N
433	Nigeria	\N	1	\N	\N	\N
434	North Korea	\N	1	\N	\N	\N
435	North Macedonia	\N	1	\N	\N	\N
436	Norway	\N	1	\N	\N	\N
437	Oman	\N	1	\N	\N	\N
438	Pakistan	\N	1	\N	\N	\N
439	Panama	\N	1	\N	\N	\N
440	Paraguay	\N	1	\N	\N	\N
441	Peru	\N	1	\N	\N	\N
442	Philippines	\N	1	\N	\N	\N
443	Poland	\N	1	\N	\N	\N
444	Portugal	\N	1	\N	\N	\N
445	Qatar	\N	1	\N	\N	\N
446	Reunion	\N	1	\N	\N	\N
447	Romania	\N	1	\N	\N	\N
448	Russia	\N	1	\N	\N	\N
449	Rwanda	\N	1	\N	\N	\N
450	Saint Lucia	\N	1	\N	\N	\N
451	San Marino	\N	1	\N	\N	\N
452	Saudi Arabia	\N	1	\N	\N	\N
453	Senegal	\N	1	\N	\N	\N
454	Serbia	\N	1	\N	\N	\N
455	Seychelles	\N	1	\N	\N	\N
456	Sierra Leone	\N	1	\N	\N	\N
457	Singapore	\N	1	\N	\N	\N
458	Slovakia	\N	1	\N	\N	\N
459	Slovenia	\N	1	\N	\N	\N
460	Somalia	\N	1	\N	\N	\N
461	South Africa	\N	1	\N	\N	\N
462	South Korea	\N	1	\N	\N	\N
463	South Sudan	\N	1	\N	\N	\N
464	Spain	\N	1	\N	\N	\N
465	Sri Lanka	\N	1	\N	\N	\N
466	State of Palestine	\N	1	\N	\N	\N
467	Sudan	\N	1	\N	\N	\N
468	Suriname	\N	1	\N	\N	\N
469	Sweden	\N	1	\N	\N	\N
470	Switzerland	\N	1	\N	\N	\N
471	Syria	\N	1	\N	\N	\N
472	Taiwan	\N	1	\N	\N	\N
473	Tajikistan	\N	1	\N	\N	\N
474	Tanzania	\N	1	\N	\N	\N
475	Thailand	\N	1	\N	\N	\N
476	The Bahamas	\N	1	\N	\N	\N
477	Timor-Leste	\N	1	\N	\N	\N
478	Togo	\N	1	\N	\N	\N
479	Trinidad and Tobago	\N	1	\N	\N	\N
480	Tunisia	\N	1	\N	\N	\N
481	Turkey	\N	1	\N	\N	\N
482	Turkmenistan	\N	1	\N	\N	\N
483	Uganda	\N	1	\N	\N	\N
484	Ukraine	\N	1	\N	\N	\N
485	United Arab Emirates	\N	1	\N	\N	\N
486	United Kingdom	\N	1	\N	\N	\N
487	United States	\N	1	\N	\N	\N
488	Uruguay	\N	1	\N	\N	\N
489	Uzbekistan	\N	1	\N	\N	\N
490	Venezuela	\N	1	\N	\N	\N
491	Vietnam	\N	1	\N	\N	\N
492	Western Sahara	\N	1	\N	\N	\N
493	Yemen	\N	1	\N	\N	\N
494	Zambia	\N	1	\N	\N	\N
495	Zimbabwe	\N	1	\N	\N	\N
\.


--
-- Data for Name: department_doctors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department_doctors (doctor_id, department_id, created_at, updated_at) FROM stdin;
3	2	\N	\N
3	4	\N	\N
4	4	\N	\N
4	9	\N	\N
5	9	\N	\N
6	2	\N	\N
6	3	\N	\N
8	1	\N	\N
8	2	\N	\N
9	6	\N	\N
12	3	\N	\N
13	2	\N	\N
14	1	\N	\N
14	2	\N	\N
14	3	\N	\N
14	4	\N	\N
14	6	\N	\N
15	1	\N	\N
16	1	\N	\N
16	2	\N	\N
16	3	\N	\N
16	4	\N	\N
17	1	\N	\N
17	2	\N	\N
17	3	\N	\N
17	4	\N	\N
17	6	\N	\N
18	1	\N	\N
18	2	\N	\N
18	3	\N	\N
18	4	\N	\N
18	6	\N	\N
19	2	\N	\N
19	3	\N	\N
20	1	\N	\N
20	2	\N	\N
20	3	\N	\N
20	4	\N	\N
20	6	\N	\N
21	1	\N	\N
21	3	\N	\N
21	4	\N	\N
22	3	\N	\N
22	4	\N	\N
23	2	\N	\N
23	3	\N	\N
\.


--
-- Data for Name: department_hospital; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department_hospital (id, hospital_id, department_id, created_at, updated_at, manager_name, dial_code, phone, email, department_name, department_manager, doctor_id, manager_id, active, deleted_at) FROM stdin;
3	4	3	2024-06-20 05:55:16	2024-06-20 06:01:32	Ahmed	971	4634636367	uyru@yt.com	\N	\N	\N	\N	t	\N
4	4	4	2024-06-20 06:18:43	2024-06-20 06:18:43	Asad	971	02 155 3111	asad@ent.com	\N	\N	\N	\N	t	\N
5	4	9	2024-06-20 06:32:25	2024-06-20 06:32:25	\N	+971	785875	htdtyty@jgj.com	Neurology	ggg	\N	\N	t	\N
6	4	2	2024-06-24 06:29:41	2024-06-24 06:29:41	fryrf	971	6545848458	dxadmin@gmail.com	\N	\N	\N	\N	t	\N
8	1	4	2024-06-24 17:13:45	2024-06-24 17:13:45	Abdullah	971	546474777	manger@astermed.com	\N	\N	\N	\N	t	\N
9	7	1	2024-06-27 12:35:33	2024-06-27 12:35:33	Advika	971	909 0 90909	dvika@ddd	\N	\N	\N	\N	t	\N
10	7	2	2024-06-27 12:36:59	2024-06-27 12:36:59	Advika	971	909 0 90909	dvika@ddd	\N	\N	\N	\N	t	\N
11	7	3	2024-06-27 12:37:16	2024-06-27 12:37:16	Advika	971	909 0 90909	dvika@ddd	\N	\N	\N	\N	t	\N
12	7	4	2024-06-27 12:37:42	2024-06-27 12:37:42	Advika	971	909 0 90908	dvika@ddd	\N	\N	\N	\N	t	\N
14	7	6	2024-06-27 12:38:27	2024-06-27 12:38:27	Advika	971	909 0 90890	dvika@ddd	\N	\N	\N	\N	t	\N
15	9	3	2024-06-28 14:06:55	2024-06-28 14:06:55	Advika	971	50665	dvika@ddd	\N	\N	\N	\N	t	\N
16	9	2	2024-06-28 14:15:43	2024-06-28 14:15:43	Advika	971	6767677	dvika@ddd	\N	\N	\N	\N	t	\N
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (id, status, deleted, created_at, updated_at, title, title_ar, deleted_at) FROM stdin;
1	1	\N	2024-06-13 10:58:40	2024-06-17 17:28:19	Anesthesiology	طب الأطفال	\N
2	1	\N	2024-06-17 17:28:36	2024-06-17 17:28:36	Cardiology	Cardiology	\N
3	1	\N	2024-06-17 17:28:48	2024-06-17 17:28:48	ENT	ENT	\N
4	1	\N	2024-06-17 17:29:13	2024-06-17 17:29:13	Gastroenterology	Gastroenterology	\N
5	1	\N	2024-06-17 17:29:26	2024-06-17 17:29:26	General surgery	General surgery	\N
6	1	\N	2024-06-17 17:29:38	2024-06-17 17:29:38	Gynaecology	Gynaecology	\N
7	1	\N	2024-06-17 17:29:51	2024-06-17 17:29:51	Haematology	Haematology	\N
8	1	\N	2024-06-17 17:30:03	2024-06-17 17:30:03	Pediatrics	Pediatrics	\N
9	1	\N	2024-06-17 17:30:17	2024-06-17 17:30:17	Neurology	Neurology	\N
10	1	\N	2024-06-17 17:30:28	2024-06-17 17:30:28	Oncology	Oncology	\N
11	1	\N	2024-06-17 17:30:39	2024-06-17 17:30:39	Opthalmology	Opthalmology	\N
12	1	\N	2024-06-17 17:30:51	2024-06-17 17:30:51	Orthopaedic	Orthopaedic	\N
13	1	\N	2024-06-17 17:31:04	2024-06-17 17:31:04	Urology	Urology	\N
14	1	\N	2024-06-17 17:31:17	2024-06-17 17:31:17	Psychiatry	Psychiatry	\N
\.


--
-- Data for Name: doctor_availabilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_availabilities (id, doctor_id, sunday_availability, sunday_time_slot, monday_availability, monday_time_slot, tuesday_availability, tuesday_time_slot, wednesday_availability, wednesday_time_slot, thursday_availability, thursday_time_slot, friday_availability, friday_time_slot, saturday_availability, saturday_time_slot, deleted_at, created_at, updated_at) FROM stdin;
1	1	1	["08:00","13:00"]	1	["13:30","18:00"]	1	["13:00","14:30","15:00","19:30"]	1	["13:00","13:30"]	1	["14:00","14:30","19:00","19:30"]	1	["14:00","14:30","19:00","19:30","20:00"]	1	["14:00","14:30","15:00","19:30","20:00"]	\N	2024-06-15 07:50:28	2024-06-15 07:50:28
12	15	0	\N	1	["08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30"]	1	["08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30"]	1	["08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30"]	1	["08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30"]	1	["08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30"]	1	["08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30"]	\N	2024-07-02 09:12:52	2024-07-02 09:12:52
6	4	1	["08:00","08:30","09:00","13:00","13:30","14:00","18:00","18:30","19:00"]	0	null	0	null	0	null	0	null	0	null	1	["08:00","08:30","09:00","09:30","10:00","13:00","13:30","14:00","14:30","15:00","18:00","18:30","19:00","19:30","20:00"]	\N	2024-07-02 10:16:39	2024-07-02 10:16:39
3	3	1	["08:00","08:30","09:00","09:30","10:00","10:30","19:30"]	1	["08:00","08:30","09:00","09:30","10:00","14:00","14:30","15:00","15:30","16:00","20:00"]	1	["08:00"]	1	["08:00","09:30","10:00","10:30","13:00"]	1	["08:00","13:00"]	0	null	0	null	\N	2024-06-24 20:35:05	2024-06-24 20:35:05
13	17	0	["13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30","18:00","18:30","19:00","19:30","20:00"]	1	["08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","14:30","15:00","18:00","18:30","19:00","19:30","20:00"]	1	["08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","18:00","18:30","19:00"]	1	["10:00","10:30","11:00","11:30","12:00","12:30","15:00","15:30","16:00","16:30","17:00","17:30","20:00"]	1	["08:00","08:30","09:00","09:30","13:00","13:30","14:00","14:30","18:00","18:30","19:00","19:30"]	1	["10:00","10:30","11:00","11:30","12:00","12:30","15:00","15:30","16:00","16:30","17:00","17:30","20:00"]	1	["08:00","08:30","09:00","09:30","13:00","13:30","14:00","14:30","18:00","18:30","19:00","19:30"]	\N	2024-07-03 08:13:58	2024-07-03 08:13:58
10	11	1	["08:00","08:30","09:00","09:30","10:00"]	1	["08:00","08:30","09:00","09:30","10:00"]	1	["08:00","08:30","09:00","09:30","10:00","10:30"]	1	["08:00","08:30","09:00","09:30","10:00","10:30"]	1	["13:00","13:30","14:00","14:30"]	0	null	1	["08:30"]	\N	2024-07-03 08:56:00	2024-07-03 08:56:00
14	18	1	["08:00","08:30","09:00","09:30","13:00","13:30","14:00","14:30","18:00","18:30","19:00","19:30"]	1	["08:00","08:30","09:00","09:30","10:00","10:30","11:00","13:00","13:30","14:00","14:30","15:00","15:30","18:00","18:30","19:00"]	1	["08:00","08:30","09:00","09:30","10:00","10:30","13:00","13:30","14:00","14:30","15:00","15:30"]	1	["08:00","08:30","09:00","09:30","10:00","10:30","13:00","13:30","14:00","14:30","15:00","15:30"]	1	["08:00","08:30","09:00","09:30","10:00","10:30","13:00","13:30","14:00","14:30","15:00","15:30","18:00","18:30","19:00","19:30","20:00"]	1	["08:00","13:00","18:00"]	1	["08:00","13:00","18:00"]	\N	2024-07-03 09:53:03	2024-07-03 09:53:03
2	2	1	["14:30","15:00","15:30","19:30","20:00"]	1	["14:30","15:00","15:30","19:30","20:00"]	1	["10:30","11:00","14:30","15:00","15:30","16:00","19:30","20:00"]	0	["09:30","10:00","14:30","15:00","19:30","20:00"]	1	["09:30","10:00","14:30","15:00","19:30","20:00"]	1	["09:00","14:00","14:30","15:00","19:00","19:30","20:00"]	1	["08:30","09:00","14:00"]	\N	2024-06-26 10:33:22	2024-06-26 10:33:22
16	22	1	["08:00"]	0	null	0	null	0	null	0	null	0	null	0	null	\N	2024-07-03 10:35:24	2024-07-03 10:35:24
4	6	0	["08:00","08:30","13:00"]	0	["08:00"]	1	["09:30","10:00","13:00","13:30","14:00","15:00","18:00","19:00","19:30","20:00"]	0	null	0	["18:00"]	0	null	0	null	\N	2024-06-26 11:46:15	2024-06-26 11:46:15
8	8	0	null	1	["08:00","13:30","14:00"]	0	["13:00","18:30","19:00"]	1	["08:00","08:30","09:00","09:30"]	1	["08:00","13:00","18:00"]	1	["08:30","13:30","18:30"]	0	null	\N	2024-06-27 13:57:02	2024-06-27 13:57:02
15	23	1	["08:00","08:30","09:00"]	1	["08:00","08:30"]	0	null	0	null	0	null	0	null	0	null	\N	2024-07-03 10:35:40	2024-07-03 10:35:40
9	10	1	["08:00","13:00","18:00"]	0	["14:00"]	1	["08:30","13:30","18:30"]	1	["18:00","18:30","19:00","19:30"]	1	["08:00","13:00","18:00"]	1	["18:00","18:30","19:00","19:30"]	1	["08:00","08:30","09:00","09:30"]	\N	2024-06-27 14:22:05	2024-06-27 14:22:05
7	9	1	["08:00","13:30","14:00","14:30"]	1	["08:00","11:00","13:00","14:00","17:00","17:30"]	1	["11:30","12:00","12:30","16:00","16:30","17:00","17:30"]	1	["08:30","09:30","13:30","14:30","18:30","19:30"]	1	["10:00","10:30","11:00","15:00","15:30","20:00"]	1	["08:00","08:30","09:00","13:00","13:30","14:00","18:00","18:30","19:00"]	1	["09:00","09:30","14:00","14:30","19:00","19:30"]	\N	2024-06-29 11:09:08	2024-06-29 11:09:08
5	5	0	null	1	["08:00","08:30","09:00","09:30","14:30","15:00","15:30","16:00","16:30"]	1	["14:30","15:00"]	0	null	0	null	0	null	0	null	\N	2024-07-01 10:27:23	2024-07-01 10:27:23
11	14	1	["11:30","12:00","16:30"]	1	["10:30","11:00","15:30"]	1	["10:00","15:00","20:00"]	1	["09:30","14:30","19:30"]	1	["09:00","14:00","19:00"]	1	["08:30","13:30","18:30"]	1	["08:00","13:00","18:00"]	\N	2024-07-01 11:14:31	2024-07-01 11:14:31
17	21	1	null	1	["13:00","13:30","14:00","14:30","15:00","15:30","18:00","18:30","19:00","19:30","20:00"]	1	["08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30"]	1	["08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30"]	1	["08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","13:00","13:30","14:00","14:30","15:00","18:00","18:30","19:00"]	1	["08:00","08:30","09:00","13:00","13:30","14:00","18:00","18:30","19:00"]	0	null	\N	2024-07-03 10:44:14	2024-07-03 10:44:14
\.


--
-- Data for Name: doctor_holidays; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_holidays (id, doctor_id, holiday_name, holiday_date, deleted_at, created_at, updated_at) FROM stdin;
11	9	sick	2024-06-29	2024-07-01 10:06:09	2024-06-29 09:13:03	2024-07-01 10:06:09
12	9	Sick	2024-01-09	2024-07-01 10:06:09	2024-06-29 09:56:17	2024-07-01 10:06:09
13	9	sick	2024-06-29	2024-07-01 10:07:27	2024-07-01 10:06:09	2024-07-01 10:07:27
14	9	Sick	2024-01-09	2024-07-01 10:07:27	2024-07-01 10:06:09	2024-07-01 10:07:27
15	9	Sick	2024-07-07	2024-07-01 10:07:27	2024-07-01 10:06:09	2024-07-01 10:07:27
16	9	sick	2024-06-29	2024-07-01 10:16:48	2024-07-01 10:07:27	2024-07-01 10:16:48
17	9	Sick	2024-01-09	2024-07-01 10:16:48	2024-07-01 10:07:27	2024-07-01 10:16:48
18	9	Sick	2024-07-07	2024-07-01 10:16:48	2024-07-01 10:07:27	2024-07-01 10:16:48
19	9	Sick	2024-07-08	2024-07-01 10:16:48	2024-07-01 10:07:27	2024-07-01 10:16:48
25	14	Sick	2024-07-07	\N	2024-07-01 12:41:24	2024-07-01 12:41:24
20	9	sick	2024-06-29	2024-07-01 12:42:31	2024-07-01 10:16:48	2024-07-01 12:42:31
21	9	Sick	2024-01-09	2024-07-01 12:42:31	2024-07-01 10:16:48	2024-07-01 12:42:31
22	9	Sick	2024-07-07	2024-07-01 12:42:31	2024-07-01 10:16:48	2024-07-01 12:42:31
23	9	Sick	2024-07-08	2024-07-01 12:42:31	2024-07-01 10:16:48	2024-07-01 12:42:31
24	9	sick	2024-07-09	2024-07-01 12:42:31	2024-07-01 10:16:48	2024-07-01 12:42:31
26	9	sick	2024-06-29	\N	2024-07-01 12:42:31	2024-07-01 12:42:31
27	9	Sick	2024-01-09	\N	2024-07-01 12:42:31	2024-07-01 12:42:31
28	9	Sick	2024-07-08	\N	2024-07-01 12:42:31	2024-07-01 12:42:31
29	9	sick	2024-07-09	\N	2024-07-01 12:42:31	2024-07-01 12:42:31
30	15	Weekly off	2024-07-05	\N	2024-07-02 09:27:36	2024-07-02 09:27:36
\.


--
-- Data for Name: doctor_instant_appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_instant_appointments (id, doctor_id, instant_appointment_date, deleted_at, created_at, updated_at) FROM stdin;
1	6	2024-06-26	\N	2024-06-25 09:58:23	2024-06-25 09:58:23
2	6	2024-06-29	\N	2024-06-25 09:58:45	2024-06-25 09:58:45
3	4	2024-07-03	\N	2024-06-26 11:14:18	2024-06-26 11:14:18
4	9	2024-06-29	2024-06-29 10:33:23	2024-06-29 10:33:06	2024-06-29 10:33:23
5	9	2024-06-29	2024-07-01 09:09:17	2024-06-29 10:33:23	2024-07-01 09:09:17
6	9	2024-07-04	2024-07-01 09:09:17	2024-06-29 10:33:23	2024-07-01 09:09:17
7	9	2024-06-29	2024-07-01 09:09:44	2024-07-01 09:09:17	2024-07-01 09:09:44
8	9	2024-07-04	2024-07-01 09:09:44	2024-07-01 09:09:17	2024-07-01 09:09:44
9	9	2024-07-02	2024-07-01 09:09:44	2024-07-01 09:09:17	2024-07-01 09:09:44
10	9	2024-06-29	\N	2024-07-01 09:09:44	2024-07-01 09:09:44
11	9	2024-07-04	\N	2024-07-01 09:09:44	2024-07-01 09:09:44
12	9	2024-07-02	\N	2024-07-01 09:09:44	2024-07-01 09:09:44
13	9	2024-07-01	\N	2024-07-01 09:09:44	2024-07-01 09:09:44
14	15	2024-07-02	\N	2024-07-02 09:41:48	2024-07-02 09:41:48
15	14	2024-07-04	\N	2024-07-02 09:42:06	2024-07-02 09:42:06
\.


--
-- Data for Name: doctor_intrests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_intrests (id, doctor_id, special_intrest_id, created_at, updated_at, deleted_at) FROM stdin;
1	1	2	2024-06-06 06:48:24	2024-06-11 04:33:20	2024-06-11 04:33:20
3	1	2	2024-06-11 04:33:20	2024-06-11 04:42:20	2024-06-11 04:42:20
4	1	2	2024-06-11 04:42:20	2024-06-11 04:42:20	\N
2	2	2	2024-06-06 11:45:14	2024-06-11 04:43:06	2024-06-11 04:43:06
5	2	2	2024-06-11 04:43:06	2024-06-11 05:43:29	2024-06-11 05:43:29
6	2	2	2024-06-11 05:43:29	2024-06-11 05:43:29	\N
13	6	2	2024-06-26 04:38:47	2024-06-26 04:38:47	\N
94	19	4	2024-07-03 09:48:00	2024-07-03 09:48:00	\N
95	19	5	2024-07-03 09:48:00	2024-07-03 09:48:00	\N
100	18	2	2024-07-03 10:05:07	2024-07-03 10:05:07	\N
101	18	3	2024-07-03 10:05:07	2024-07-03 10:05:07	\N
102	18	4	2024-07-03 10:05:07	2024-07-03 10:05:07	\N
103	18	5	2024-07-03 10:05:07	2024-07-03 10:05:07	\N
104	17	2	2024-07-03 10:05:45	2024-07-03 10:05:45	\N
105	17	3	2024-07-03 10:05:45	2024-07-03 10:05:45	\N
106	17	4	2024-07-03 10:05:45	2024-07-03 10:05:45	\N
107	17	5	2024-07-03 10:05:45	2024-07-03 10:05:45	\N
112	3	2	2024-07-03 10:07:18	2024-07-03 10:07:18	\N
113	4	2	2024-07-03 10:07:45	2024-07-03 10:07:45	\N
114	5	2	2024-07-03 10:08:18	2024-07-03 10:08:18	\N
115	7	2	2024-07-03 10:09:09	2024-07-03 10:09:09	\N
116	8	2	2024-07-03 10:09:53	2024-07-03 10:09:53	\N
117	8	3	2024-07-03 10:09:53	2024-07-03 10:09:53	\N
118	9	2	2024-07-03 10:10:29	2024-07-03 10:10:29	\N
119	15	2	2024-07-03 10:11:03	2024-07-03 10:11:03	\N
120	15	3	2024-07-03 10:11:03	2024-07-03 10:11:03	\N
121	15	4	2024-07-03 10:11:03	2024-07-03 10:11:03	\N
122	15	5	2024-07-03 10:11:03	2024-07-03 10:11:03	\N
123	14	2	2024-07-03 10:11:33	2024-07-03 10:11:33	\N
124	14	3	2024-07-03 10:11:33	2024-07-03 10:11:33	\N
125	14	4	2024-07-03 10:11:33	2024-07-03 10:11:33	\N
126	14	5	2024-07-03 10:11:33	2024-07-03 10:11:33	\N
127	13	2	2024-07-03 10:12:00	2024-07-03 10:12:00	\N
128	12	2	2024-07-03 10:12:35	2024-07-03 10:12:35	\N
130	10	2	2024-07-03 10:13:35	2024-07-03 10:13:35	\N
131	10	3	2024-07-03 10:13:35	2024-07-03 10:13:35	\N
132	10	4	2024-07-03 10:13:35	2024-07-03 10:13:35	\N
137	16	2	2024-07-03 10:14:41	2024-07-03 10:14:41	\N
138	16	3	2024-07-03 10:14:41	2024-07-03 10:14:41	\N
139	16	4	2024-07-03 10:14:41	2024-07-03 10:14:41	\N
140	16	5	2024-07-03 10:14:41	2024-07-03 10:14:41	\N
143	20	2	2024-07-03 10:24:32	2024-07-03 10:24:32	\N
144	20	3	2024-07-03 10:24:32	2024-07-03 10:24:32	\N
146	11	2	2024-07-03 10:25:07	2024-07-03 10:25:07	\N
151	22	3	2024-07-03 10:31:27	2024-07-03 10:31:27	\N
152	22	4	2024-07-03 10:31:27	2024-07-03 10:31:27	\N
153	23	5	2024-07-03 10:33:56	2024-07-03 10:33:56	\N
158	21	2	2024-07-03 10:40:15	2024-07-03 10:40:15	\N
159	21	3	2024-07-03 10:40:15	2024-07-03 10:40:15	\N
160	21	4	2024-07-03 10:40:15	2024-07-03 10:40:15	\N
161	21	5	2024-07-03 10:40:15	2024-07-03 10:40:15	\N
\.


--
-- Data for Name: doctor_language_spokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_language_spokens (id, doctor_id, language_spoken_id, deleted_at, created_at, updated_at) FROM stdin;
1	1	3	2024-06-11 04:33:20	2024-06-06 06:48:23	2024-06-11 04:33:20
2	1	1	2024-06-11 04:33:20	2024-06-06 06:48:23	2024-06-11 04:33:20
4	1	3	2024-06-11 04:42:20	2024-06-11 04:33:20	2024-06-11 04:42:20
5	1	1	2024-06-11 04:42:20	2024-06-11 04:33:20	2024-06-11 04:42:20
6	1	3	\N	2024-06-11 04:42:20	2024-06-11 04:42:20
7	1	1	\N	2024-06-11 04:42:20	2024-06-11 04:42:20
3	2	1	2024-06-11 04:43:06	2024-06-06 11:45:14	2024-06-11 04:43:06
8	2	1	2024-06-11 05:43:29	2024-06-11 04:43:06	2024-06-11 05:43:29
9	2	1	\N	2024-06-11 05:43:29	2024-06-11 05:43:29
163	22	1	\N	2024-07-03 10:31:27	2024-07-03 10:31:27
164	23	1	\N	2024-07-03 10:33:56	2024-07-03 10:33:56
168	21	3	\N	2024-07-03 10:40:15	2024-07-03 10:40:15
169	21	1	\N	2024-07-03 10:40:15	2024-07-03 10:40:15
170	21	2	\N	2024-07-03 10:40:15	2024-07-03 10:40:15
19	6	1	\N	2024-06-26 04:38:47	2024-06-26 04:38:47
20	6	2	\N	2024-06-26 04:38:47	2024-06-26 04:38:47
112	19	1	\N	2024-07-03 09:48:00	2024-07-03 09:48:00
116	18	3	\N	2024-07-03 10:05:07	2024-07-03 10:05:07
117	18	1	\N	2024-07-03 10:05:07	2024-07-03 10:05:07
118	18	2	\N	2024-07-03 10:05:07	2024-07-03 10:05:07
119	17	1	\N	2024-07-03 10:05:45	2024-07-03 10:05:45
121	3	3	\N	2024-07-03 10:07:17	2024-07-03 10:07:17
122	3	1	\N	2024-07-03 10:07:18	2024-07-03 10:07:18
123	4	1	\N	2024-07-03 10:07:45	2024-07-03 10:07:45
124	4	2	\N	2024-07-03 10:07:45	2024-07-03 10:07:45
125	5	1	\N	2024-07-03 10:08:18	2024-07-03 10:08:18
126	7	3	\N	2024-07-03 10:09:08	2024-07-03 10:09:08
127	7	1	\N	2024-07-03 10:09:08	2024-07-03 10:09:08
128	7	2	\N	2024-07-03 10:09:08	2024-07-03 10:09:08
129	8	3	\N	2024-07-03 10:09:53	2024-07-03 10:09:53
130	8	1	\N	2024-07-03 10:09:53	2024-07-03 10:09:53
131	9	3	\N	2024-07-03 10:10:29	2024-07-03 10:10:29
132	9	1	\N	2024-07-03 10:10:29	2024-07-03 10:10:29
133	9	2	\N	2024-07-03 10:10:29	2024-07-03 10:10:29
134	15	3	\N	2024-07-03 10:11:03	2024-07-03 10:11:03
135	15	1	\N	2024-07-03 10:11:03	2024-07-03 10:11:03
136	15	2	\N	2024-07-03 10:11:03	2024-07-03 10:11:03
137	14	3	\N	2024-07-03 10:11:33	2024-07-03 10:11:33
138	14	1	\N	2024-07-03 10:11:33	2024-07-03 10:11:33
139	14	2	\N	2024-07-03 10:11:33	2024-07-03 10:11:33
140	13	3	\N	2024-07-03 10:12:00	2024-07-03 10:12:00
141	13	1	\N	2024-07-03 10:12:00	2024-07-03 10:12:00
142	13	2	\N	2024-07-03 10:12:00	2024-07-03 10:12:00
143	12	1	\N	2024-07-03 10:12:35	2024-07-03 10:12:35
144	12	2	\N	2024-07-03 10:12:35	2024-07-03 10:12:35
147	10	2	\N	2024-07-03 10:13:35	2024-07-03 10:13:35
149	16	1	\N	2024-07-03 10:14:41	2024-07-03 10:14:41
153	20	3	\N	2024-07-03 10:24:32	2024-07-03 10:24:32
154	20	1	\N	2024-07-03 10:24:32	2024-07-03 10:24:32
155	20	2	\N	2024-07-03 10:24:32	2024-07-03 10:24:32
158	11	1	\N	2024-07-03 10:25:07	2024-07-03 10:25:07
159	11	2	\N	2024-07-03 10:25:07	2024-07-03 10:25:07
\.


--
-- Data for Name: doctor_patient_appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_patient_appointments (id, user_id, doctor_id, booking_id, booking_time_slot, booking_status, booking_date, reason_cancel, reason_reschedule, deleted_at, created_at, updated_at, previous_booking_time_slot, previous_booking_date, member_id, hospital_id, department_id, followup_details, followup_date, agent_id) FROM stdin;
35	46	3	#MYDW1719460262	08:00	Pending	2024-06-27	\N	\N	\N	2024-06-27 03:51:02	2024-06-27 06:24:12	\N	\N	0	4	\N	gvgvvvv	2024-06-27 16:00:00	\N
31	19	4	#MYDW7820	08:00	Confirmed	2024-06-30	\N	\N	\N	2024-06-26 11:15:24	2024-06-27 06:33:12	\N	\N	0	4	4	uotyiutitkjgkg	2024-08-15 23:45:00	\N
3	23	7	#MYDW2684	13:00	Rescheduled	27-06-2024	\N	\N	\N	2024-06-15 07:43:12	2024-06-15 16:59:54	13:00	27-06-2024	0	\N	\N	\N	\N	\N
4	22	3	#MYDW5738	09:00	pending	22-06-2024	\N	\N	\N	2024-06-20 06:47:56	2024-06-20 06:47:56	\N	\N	\N	\N	\N	\N	\N	\N
5	23	3	#MYDW5879	17:30	pending	22-06-2024	\N	\N	\N	2024-06-20 06:48:15	2024-06-20 06:48:15	\N	\N	\N	\N	\N	\N	\N	\N
6	14	3	#MYDW7817	13:30	Confirmed	22-06-2024	\N	\N	\N	2024-06-20 06:49:08	2024-06-20 07:16:46	\N	\N	\N	\N	\N	\N	\N	\N
7	23	7	#MYDW3296	13:00	Pending	27-06-2024	\N	\N	\N	2024-06-21 11:21:23	2024-06-21 11:21:23	\N	\N	0	\N	\N	\N	\N	\N
8	23	89	#MYDW6258	13:00	Pending	27-06-2024	\N	\N	\N	2024-06-21 11:21:32	2024-06-21 11:21:32	\N	\N	0	\N	\N	\N	\N	\N
9	23	3	#MYDW3875	13:00	Pending	27-06-2024	\N	\N	\N	2024-06-21 11:21:41	2024-06-21 11:21:41	\N	\N	0	\N	\N	\N	\N	\N
10	23	3	#MYDW2775	13:00	Pending	27-06-2024	\N	\N	\N	2024-06-21 13:03:27	2024-06-21 13:03:27	\N	\N	0	\N	\N	\N	\N	\N
11	23	3	#MYDW6956	13:00	Pending	27-06-2024	\N	\N	\N	2024-06-21 13:03:53	2024-06-21 13:03:53	\N	\N	0	\N	\N	\N	\N	\N
12	34	3	#MYDW4007	15:00	pending	24-06-2024	\N	\N	\N	2024-06-24 06:33:24	2024-06-24 06:33:24	\N	\N	\N	\N	\N	\N	\N	\N
13	25	3	#MYDW7594	12:00	pending	24-06-2024	\N	\N	\N	2024-06-24 06:34:12	2024-06-24 06:34:12	\N	\N	\N	\N	\N	\N	\N	\N
44	49	56	#MYDW1719516641	09:00	Pending	2024-07-31	\N	\N	\N	2024-06-27 19:30:41	2024-06-28 11:54:18	\N	\N	\N	7	1	\N	\N	\N
14	19	3	#MYDW7699	08:00	Completed	2024-06-25	\N	\N	\N	2024-06-24 07:07:44	2024-06-24 07:08:09	\N	\N	0	4	2	\N	\N	\N
15	21	31	#MYDW3095	16:30	Pending	2024-06-25	\N	\N	\N	2024-06-24 17:23:39	2024-06-24 17:23:39	\N	\N	0	4	2	\N	\N	\N
18	28	3	#MYDW4559	08:30	pending	26-06-2024	\N	\N	\N	2024-06-24 23:20:37	2024-06-24 23:20:37	\N	\N	\N	\N	\N	\N	\N	\N
2	14	2	#MYDW1765	09:30	Rescheduled	13-06-2024	\N	\N	2024-07-02 09:37:30	2024-06-11 04:45:06	2024-07-02 09:37:30	09:00	12-06-2024	\N	\N	\N	\N	\N	\N
46	49	11	#MYDW7863	16:30	Rescheduled	26-07-2024	No time	\N	\N	2024-06-28 06:45:29	2024-06-28 06:45:29	16:30	26-07-2024	\N	\N	\N	\N	\N	\N
36	47	2	#MYDW1719460828	20:00	Pending	2024-06-28	\N	\N	2024-07-02 09:37:30	2024-06-27 04:00:28	2024-07-02 09:37:30	\N	\N	0	1	\N	\N	\N	\N
23	20	31	#MYDW5978	19:30	Pending	2024-06-29	\N	\N	\N	2024-06-25 10:58:39	2024-06-25 10:58:39	\N	\N	\N	4	2	\N	\N	\N
40	51	37	#MYDW3696	19:30	Pending	2024-06-29	\N	\N	\N	2024-06-27 11:49:15	2024-06-27 11:58:39	\N	\N	\N	4	3	\N	\N	\N
41	53	55	#MYDW3884	12:00	Pending	2024-06-28	\N	\N	\N	2024-06-27 13:15:52	2024-06-27 13:15:52	\N	\N	\N	6	\N	\N	\N	\N
24	25	3	#MYDW7795	08:30	Completed	2024-06-30	\N	gjgkjh	\N	2024-06-25 11:00:06	2024-06-25 11:06:13	08:00	2024-06-30	0	4	2	\N	\N	\N
1	14	1	#MYDW3670	09:00	pending	12-06-2024	\N	\N	2024-07-02 09:37:47	2024-06-11 04:32:26	2024-07-02 09:37:47	\N	\N	\N	\N	\N	\N	\N	\N
32	27	1	#MYDW1719427327	14:00	Pending	2024-06-27	\N	\N	2024-07-02 09:37:47	2024-06-26 18:42:07	2024-07-02 09:37:47	\N	\N	0	1	\N	\N	\N	\N
28	19	3	#MYDW1719348630	10:30	Pending	2024-06-26	\N	\N	\N	2024-06-25 20:50:30	2024-06-25 20:50:30	\N	\N	5	4	\N	\N	\N	\N
29	19	3	#MYDW1719349065	10:00	Pending	2024-06-26	\N	\N	\N	2024-06-25 20:57:45	2024-06-25 20:57:45	\N	\N	4	4	\N	\N	\N	\N
42	25	59	#MYDW6764	15:30	Pending	2024-06-28	\N	\N	\N	2024-06-27 14:24:07	2024-06-27 14:24:07	\N	\N	0	8	\N	\N	\N	\N
30	44	3	#MYDW1719397657	13:00	Completed	2024-06-27	\N	\N	\N	2024-06-26 10:27:37	2024-06-26 11:02:32	\N	\N	18	4	\N	\N	\N	\N
47	50	11	#MYDW4494	16:30	Completed	06-07-2024	\N	\N	\N	2024-06-28 06:29:00	2024-06-28 06:46:38	\N	\N	\N	\N	\N	\N	\N	\N
48	50	11	#MYDW1299	16:30	pending	28-06-2024	\N	\N	\N	2024-06-28 06:29:24	2024-06-28 06:29:24	\N	\N	\N	\N	\N	\N	\N	\N
49	50	11	#MYDW6713	16:30	pending	28-06-2024	\N	\N	\N	2024-06-28 06:29:45	2024-06-28 06:29:45	\N	\N	\N	\N	\N	\N	\N	\N
50	23	61	#MYDW6967	17:00	Pending	2024-07-05	\N	\N	\N	2024-06-28 07:37:33	2024-06-28 07:37:33	\N	\N	6	8	\N	\N	\N	\N
54	26	9	#MYDW6913	16:00	Completed	2024-07-23	\N	\N	\N	2024-06-28 12:13:58	2024-06-28 12:33:53	\N	\N	0	7	3	\N	\N	\N
52	48	57	#MYDW6109	16:30	Pending	2024-07-03	\N	\N	\N	2024-06-28 10:39:02	2024-06-28 10:39:02	\N	\N	47	7	3	\N	\N	\N
43	14	57	#MYDW3893	16:30	Pending	2024-06-28	\N	\N	\N	2024-06-27 14:27:29	2024-06-28 11:03:02	\N	\N	1	7	4	\N	\N	\N
55	26	9	#MYDW1880	12:00	Confirmed	2024-07-23	\N	\N	\N	2024-06-28 12:14:33	2024-06-28 12:33:42	\N	\N	0	7	3	\N	\N	\N
53	26	9	#MYDW6244	11:30	Cancelled	2024-07-23	\N	\N	\N	2024-06-28 12:13:00	2024-06-28 12:44:57	16:30	2024-07-23	0	7	3	\N	\N	\N
58	65	9	#MYDW4193	19:30	Pending	2024-06-29	\N	\N	\N	2024-06-28 13:29:39	2024-06-28 13:29:39	\N	\N	0	7	4	\N	\N	\N
59	65	9	#MYDW3988	13:30	Pending	2024-06-30	\N	\N	\N	2024-06-28 13:30:08	2024-06-28 13:30:08	\N	\N	0	7	6	\N	\N	\N
33	27	1	#MYDW1719427366	14:30	Pending	2024-06-27	\N	\N	2024-07-02 09:37:47	2024-06-26 18:42:46	2024-07-02 09:37:47	\N	\N	0	1	\N	\N	\N	\N
34	27	1	#MYDW1719431679	20:00	Pending	2024-06-28	\N	\N	2024-07-02 09:37:47	2024-06-26 19:54:39	2024-07-02 09:37:47	\N	\N	0	1	\N	\N	\N	\N
56	60	10	#MYDW1719578607	08:00	Cancelled	2024-06-29	\N	\N	\N	2024-06-28 12:43:27	2024-06-28 21:26:01	\N	\N	0	8	\N	\N	\N	\N
51	64	10	#MYDW1719567143	08:30	Confirmed	2024-06-29	\N	\N	\N	2024-06-28 09:32:23	2024-06-29 05:51:33	\N	\N	0	8	\N	\N	\N	\N
39	49	6	#MYDW1719486061	13:00	Pending	2024-07-16	\N	\N	2024-07-02 09:37:15	2024-06-27 11:01:01	2024-07-02 09:37:15	\N	\N	0	4	\N	\N	\N	\N
57	65	9	#MYDW5235	08:00	Rescheduled	2024-09-01	\N	\N	\N	2024-06-28 13:24:38	2024-06-29 10:34:00	08:00	2024-06-28	0	7	4	\N	\N	\N
63	27	9	#MYDW1719603539	14:30	Rescheduled	2024-06-30	\N	test	\N	2024-06-28 19:38:59	2024-06-29 17:54:31	14:00	2024-06-30	44	7	\N	\N	\N	\N
37	27	1	#MYDW1719464736	14:00	Pending	2024-06-28	\N	\N	2024-07-02 09:37:47	2024-06-27 05:05:36	2024-07-02 09:37:47	\N	\N	0	1	\N	\N	\N	\N
45	27	1	#MYDW1719526776	15:00	Pending	2024-06-29	\N	\N	2024-07-02 09:37:47	2024-06-27 22:19:36	2024-07-02 09:37:47	\N	\N	44	1	\N	\N	\N	\N
38	27	1	#MYDW1719464928	14:30	Cancelled	2024-06-28	\N	\N	2024-07-02 09:37:47	2024-06-27 05:08:48	2024-07-02 09:37:47	\N	\N	0	1	\N	\N	\N	\N
64	27	8	#MYDW1719603595	13:30	Pending	2024-07-01	\N	\N	\N	2024-06-28 19:39:55	2024-06-28 19:39:55	\N	\N	43	7	\N	\N	\N	\N
68	65	11	#MYDW2269	09:30	Cancelled	2024-07-01	\N	\N	\N	2024-06-29 06:40:51	2024-06-29 06:41:34	\N	\N	0	8	\N	\N	\N	\N
67	65	10	#MYDW4231	13:00	Confirmed	2024-07-04	\N	\N	\N	2024-06-29 06:32:19	2024-06-29 06:41:43	\N	\N	0	8	\N	\N	\N	\N
66	65	10	#MYDW3961	18:00	Completed	2024-07-04	\N	\N	\N	2024-06-29 06:31:18	2024-06-29 06:41:56	\N	\N	0	8	\N	\N	\N	\N
65	23	10	#MYDW5866	08:00	Rescheduled	2024-07-04	\N	\N	\N	2024-06-29 06:30:47	2024-06-29 06:42:14	19:30	2024-07-05	0	8	\N	\N	\N	\N
69	65	11	#MYDW3851	08:30	Pending	2024-08-13	\N	\N	\N	2024-06-29 06:43:02	2024-06-29 06:43:02	\N	\N	0	8	\N	\N	\N	\N
70	23	10	#MYDW4726	18:00	Pending	2024-07-26	\N	\N	\N	2024-06-29 06:43:55	2024-06-29 06:43:55	\N	\N	0	8	\N	\N	\N	\N
71	25	11	#MYDW3080	08:30	Pending	2024-07-10	\N	\N	\N	2024-06-29 06:44:26	2024-06-29 06:44:26	\N	\N	0	8	\N	\N	\N	\N
74	72	11	#MYDW1719646969	08:00	Pending	2024-07-03	\N	\N	\N	2024-06-29 07:42:49	2024-06-29 07:42:49	\N	\N	0	8	\N	\N	\N	\N
75	48	2	#MYDW1719647649	15:00	Pending	2024-06-30	\N	\N	2024-07-02 09:37:30	2024-06-29 07:54:09	2024-07-02 09:37:30	\N	\N	0	1	\N	\N	\N	\N
76	78	9	#MYDW2270	13:30	Pending	2024-09-01	\N	\N	\N	2024-06-29 10:35:19	2024-06-29 10:35:19	\N	\N	0	7	\N	\N	\N	\N
102	96	9	#MYDW1719905969	17:00	Confirmed	2024-07-02	\N	dr is on leave	\N	2024-07-02 07:39:29	2024-07-02 09:00:46	17:30	2024-07-02	66	7	\N	\N	\N	\N
77	78	9	#MYDW5258	14:00	Pending	2024-09-01	\N	\N	\N	2024-06-29 11:07:33	2024-06-29 11:07:33	\N	\N	0	7	\N	\N	\N	\N
78	65	9	#MYDW1821	14:30	Pending	2024-07-06	\N	\N	\N	2024-06-29 11:08:17	2024-06-29 11:08:17	\N	\N	0	7	\N	\N	\N	\N
80	23	9	#MYDW2107	08:00	Pending	2024-07-05	\N	\N	\N	2024-06-29 11:19:43	2024-06-29 11:19:43	\N	\N	0	7	\N	\N	\N	\N
81	25	9	#MYDW3314	09:00	Pending	2024-07-27	\N	\N	\N	2024-06-29 11:20:52	2024-06-29 11:20:52	\N	\N	0	7	\N	\N	\N	\N
82	23	9	#MYDW2727	09:30	Pending	2024-07-27	\N	\N	\N	2024-06-29 11:21:14	2024-06-29 11:21:14	\N	\N	0	7	\N	\N	\N	\N
95	84	9	#MYDW1719824390	11:00	Cancelled	2024-07-04	Asfg	\N	\N	2024-07-01 08:59:50	2024-07-02 21:51:34	\N	\N	62	7	\N	\N	\N	\N
85	48	3	#MYDW1719730429	08:30	Completed	2024-07-01	\N	not able to travel	\N	2024-06-30 06:53:49	2024-06-30 07:04:30	08:00	2024-07-01	0	4	\N	\N	\N	\N
86	48	3	#MYDW1719731200	09:00	Pending	2024-07-01	\N	\N	\N	2024-06-30 07:06:40	2024-06-30 07:06:40	\N	\N	56	4	\N	\N	\N	\N
89	84	11	#MYDW1719820968	08:00	Pending	2024-07-07	\N	\N	\N	2024-07-01 08:02:48	2024-07-01 08:02:48	\N	\N	63	8	\N	\N	\N	\N
90	84	11	#MYDW1719821010	08:00	Pending	2024-07-14	\N	\N	\N	2024-07-01 08:03:30	2024-07-01 08:03:30	\N	\N	0	8	\N	\N	\N	\N
91	84	11	#MYDW1719821086	08:30	Pending	2024-07-14	\N	\N	\N	2024-07-01 08:04:46	2024-07-01 08:04:46	\N	\N	63	8	\N	\N	\N	\N
108	27	2	#MYDW1719908696	14:30	Pending	2024-07-02	\N	\N	2024-07-02 09:37:30	2024-07-02 08:24:56	2024-07-02 09:37:30	\N	\N	67	1	\N	\N	\N	\N
88	84	8	#MYDW1719818456	08:00	Rescheduled	2024-07-03	\N	not well	\N	2024-07-01 07:20:56	2024-07-01 08:19:12	08:30	2024-07-03	60	7	\N	\N	\N	\N
87	84	9	#MYDW1719818406	08:30	Rescheduled	2024-07-03	\N	nit well	\N	2024-07-01 07:20:06	2024-07-01 08:22:23	12:00	2024-07-02	0	7	\N	\N	\N	\N
101	48	3	#MYDW1719887753	08:00	Cancelled	2024-07-02	Tyyyyyyu	\N	\N	2024-07-02 02:35:53	2024-07-02 02:39:06	\N	\N	0	4	\N	\N	\N	\N
99	84	9	#MYDW1719828735	14:30	Rescheduled	03-07-2024	\N	Test	\N	2024-07-01 10:12:15	2024-07-02 19:50:30	12:30	2024-07-09	0	7	\N	\N	\N	\N
92	84	9	#MYDW1719822312	13:30	Rescheduled	2024-07-02	\N	not good	\N	2024-07-01 08:25:12	2024-07-01 08:26:51	13:30	2024-07-03	0	7	\N	\N	\N	\N
93	84	9	#MYDW1719822439	13:30	Rescheduled	2024-07-03	\N	Jot ok	\N	2024-07-01 08:27:19	2024-07-01 08:28:32	09:30	2024-07-03	0	7	\N	\N	\N	\N
94	84	9	#MYDW1719824336	09:30	Pending	2024-07-03	\N	\N	\N	2024-07-01 08:58:56	2024-07-01 08:58:56	\N	\N	0	7	\N	\N	\N	\N
96	84	9	#MYDW1719824429	10:30	Pending	2024-07-11	\N	\N	\N	2024-07-01 09:00:29	2024-07-01 09:00:29	\N	\N	61	7	\N	\N	\N	\N
97	84	9	#MYDW1719824450	12:30	Pending	2024-07-02	\N	\N	\N	2024-07-01 09:00:50	2024-07-01 09:00:50	\N	\N	60	7	\N	\N	\N	\N
98	84	9	#MYDW1719828378	14:00	Pending	2024-07-06	\N	\N	\N	2024-07-01 10:06:18	2024-07-01 10:06:18	\N	\N	0	7	\N	\N	\N	\N
104	96	5	#MYDW1719906285	15:00	Pending	2024-07-02	\N	\N	\N	2024-07-02 07:44:45	2024-07-02 07:44:45	\N	\N	65	4	\N	\N	\N	\N
107	27	9	#MYDW1719908570	16:00	Pending	2024-07-02	\N	\N	\N	2024-07-02 08:22:50	2024-07-02 08:22:50	\N	\N	0	7	\N	\N	\N	\N
109	96	15	#MYDW1719912225	08:00	Pending	2024-07-06	\N	\N	\N	2024-07-02 09:23:45	2024-07-02 09:23:45	\N	\N	0	7	\N	\N	\N	\N
110	96	15	#MYDW1719912496	08:30	Pending	2024-07-06	\N	\N	\N	2024-07-02 09:28:16	2024-07-02 09:28:16	\N	\N	68	7	\N	\N	\N	\N
105	96	14	#MYDW1719906893	15:00	Cancelled	2024-07-02	\N	\N	\N	2024-07-02 07:54:53	2024-07-02 08:58:10	\N	\N	65	7	\N	\N	\N	\N
60	60	6	#MYDW1719587945	09:30	Completed	2024-07-02	\N	\N	2024-07-02 09:37:15	2024-06-28 15:19:05	2024-07-02 09:37:15	\N	\N	0	4	\N	Test Follow Up details	2024-07-05 12:00:00	\N
112	96	15	#MYDW1719912613	08:30	Confirmed	2024-07-09	\N	\N	\N	2024-07-02 09:30:13	2024-07-02 09:30:51	\N	\N	65	7	\N	\N	\N	\N
111	96	15	#MYDW1719912583	08:30	Completed	2024-07-08	\N	\N	\N	2024-07-02 09:29:43	2024-07-02 09:30:58	\N	\N	66	7	\N	\N	\N	\N
106	96	9	#MYDW1719906958	17:30	Rescheduled	2024-07-02	\N	\N	\N	2024-07-02 07:55:58	2024-07-02 09:00:23	16:30	2024-07-02	66	7	\N	\N	\N	\N
16	23	6	#MYDW1440	08:30	pending	25-06-2024	\N	\N	2024-07-02 09:37:15	2024-06-24 17:24:40	2024-07-02 09:37:15	\N	\N	\N	\N	\N	\N	\N	\N
17	28	6	#MYDW2094	09:00	pending	27-06-2024	\N	\N	2024-07-02 09:37:15	2024-06-24 17:25:14	2024-07-02 09:37:15	\N	\N	\N	\N	\N	\N	\N	\N
19	28	6	#MYDW6478	08:00	pending	26-06-2024	\N	\N	2024-07-02 09:37:15	2024-06-24 23:31:29	2024-07-02 09:37:15	\N	\N	\N	\N	\N	\N	\N	\N
20	28	6	#MYDW1585	09:00	pending	26-06-2024	\N	\N	2024-07-02 09:37:15	2024-06-25 05:32:46	2024-07-02 09:37:15	\N	\N	\N	\N	\N	\N	\N	\N
22	27	6	#MYDW5047	13:00	Rescheduled	27-06-2024	\N	\N	2024-07-02 09:37:15	2024-06-25 07:23:13	2024-07-02 09:37:15	13:30	\N	\N	\N	\N	\N	\N	\N
21	23	6	#MYDW6827	17:00	Confirmed	29-06-2024	\N	\N	2024-07-02 09:37:15	2024-06-25 07:23:26	2024-07-02 09:37:15	17:00	\N	\N	\N	\N	\N	\N	\N
73	60	6	#MYDW1719646819	19:30	Rescheduled	02-07-2024	\N	testing reason for schedule	2024-07-02 09:37:15	2024-06-29 07:40:19	2024-07-02 09:37:15	15:00	2024-07-02	46	4	\N	\N	\N	\N
113	27	2	#MYDW1719912933	15:00	Pending	2024-07-02	\N	\N	2024-07-02 09:37:30	2024-07-02 09:35:33	2024-07-02 09:37:30	\N	\N	67	1	\N	\N	\N	\N
84	27	1	#MYDW1719691593	13:00	Pending	2024-07-31	\N	\N	2024-07-02 09:37:47	2024-06-29 20:06:33	2024-07-02 09:37:47	\N	\N	0	1	\N	\N	\N	\N
100	84	1	#MYDW1719843892	14:30	Confirmed	2024-07-02	\N	\N	2024-07-02 09:37:47	2024-07-01 14:24:52	2024-07-02 09:37:47	\N	\N	0	1	\N	\N	\N	\N
103	96	1	#MYDW1719906261	13:00	Pending	2024-07-02	\N	\N	2024-07-02 09:37:47	2024-07-02 07:44:21	2024-07-02 09:37:47	\N	\N	0	1	\N	\N	\N	\N
26	39	6	#MYDW1719313892	19:00	Cancelled	2024-06-25	nothing	\N	2024-07-02 09:37:15	2024-06-25 11:11:32	2024-07-02 09:37:15	\N	\N	0	4	\N	\N	\N	\N
25	39	6	#MYDW1719313867	20:00	Rescheduled	2024-06-25	\N	test	2024-07-02 09:37:15	2024-06-25 11:11:07	2024-07-02 09:37:15	18:00	2024-06-25	17	4	\N	\N	\N	\N
27	27	6	#MYDW7637	09:30	pending	26-06-2024	\N	\N	2024-07-02 09:37:15	2024-06-25 12:09:00	2024-07-02 09:37:15	\N	\N	\N	\N	\N	\N	\N	\N
61	60	6	#MYDW1719592819	10:00	Cancelled	2024-07-02	Cancelled due to testing.	\N	2024-07-02 09:37:15	2024-06-28 16:40:19	2024-07-02 09:37:15	\N	\N	0	4	\N	\N	\N	\N
62	60	6	#MYDW1719594060	13:00	Completed	2024-07-02	\N	\N	2024-07-02 09:37:15	2024-06-28 17:01:00	2024-07-02 09:37:15	\N	\N	0	4	\N	\N	\N	\N
79	60	6	#MYDW1719659797	19:00	Pending	2024-07-02	\N	\N	2024-07-02 09:37:15	2024-06-29 11:16:37	2024-07-02 09:37:15	\N	\N	46	4	\N	\N	\N	\N
83	60	6	#MYDW1719660429	10:00	Pending	2024-07-09	\N	\N	2024-07-02 09:37:15	2024-06-29 11:27:09	2024-07-02 09:37:15	\N	\N	42	4	\N	\N	\N	\N
72	60	6	#MYDW1719645994	20:00	Cancelled	2024-07-02	Test	test	2024-07-02 09:37:15	2024-06-29 07:26:34	2024-07-02 09:37:15	14:00	2024-07-02	0	4	\N	\N	\N	\N
114	99	14	#MYDW1719926078	11:30	Pending	2024-07-14	\N	\N	\N	2024-07-02 13:14:38	2024-07-02 13:14:38	\N	\N	70	7	\N	\N	\N	\N
115	99	14	#MYDW1719926130	14:00	Pending	2024-07-04	\N	\N	\N	2024-07-02 13:15:30	2024-07-02 13:15:30	\N	\N	0	7	\N	\N	\N	\N
116	60	3	#MYDW1719958789	08:00	Completed	2024-07-03	\N	\N	\N	2024-07-02 22:19:49	2024-07-02 22:46:41	\N	\N	46	4	\N	Test Follow UP	2024-07-04 12:00:00	\N
117	48	9	#MYDW1719974106	10:00	Rescheduled	04-07-2024	\N	The only way I could do that was if you wanted me too I could come and pick it out and then I can go pick up my	\N	2024-07-03 02:35:06	2024-07-03 02:36:55	18:30	2024-07-03	0	7	\N	\N	\N	\N
118	103	9	#MYDW1719991327	15:30	Rescheduled	2024-07-04	\N		\N	2024-07-03 07:22:07	2024-07-03 11:02:18	14:30	2024-07-03	0	7	\N	\N	\N	\N
\.


--
-- Data for Name: doctor_qualifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_qualifications (id, doctor_id, qualification_id, deleted_at, created_at, updated_at) FROM stdin;
1	1	4	2024-06-11 04:33:20	2024-06-06 06:48:23	2024-06-11 04:33:20
2	1	3	2024-06-11 04:33:20	2024-06-06 06:48:24	2024-06-11 04:33:20
4	1	4	2024-06-11 04:42:20	2024-06-11 04:33:20	2024-06-11 04:42:20
5	1	3	2024-06-11 04:42:20	2024-06-11 04:33:20	2024-06-11 04:42:20
6	1	4	\N	2024-06-11 04:42:20	2024-06-11 04:42:20
7	1	3	\N	2024-06-11 04:42:20	2024-06-11 04:42:20
3	2	3	2024-06-11 04:43:06	2024-06-06 11:45:14	2024-06-11 04:43:06
8	2	3	2024-06-11 05:43:29	2024-06-11 04:43:06	2024-06-11 05:43:29
9	2	3	\N	2024-06-11 05:43:29	2024-06-11 05:43:29
168	20	4	\N	2024-07-03 10:24:32	2024-07-03 10:24:32
169	20	3	\N	2024-07-03 10:24:32	2024-07-03 10:24:32
170	20	1	\N	2024-07-03 10:24:32	2024-07-03 10:24:32
171	20	5	\N	2024-07-03 10:24:32	2024-07-03 10:24:32
173	11	1	\N	2024-07-03 10:25:07	2024-07-03 10:25:07
19	6	3	\N	2024-06-26 04:38:47	2024-06-26 04:38:47
20	6	1	\N	2024-06-26 04:38:47	2024-06-26 04:38:47
178	22	3	\N	2024-07-03 10:31:27	2024-07-03 10:31:27
179	22	1	\N	2024-07-03 10:31:27	2024-07-03 10:31:27
180	22	5	\N	2024-07-03 10:31:27	2024-07-03 10:31:27
181	23	3	\N	2024-07-03 10:33:56	2024-07-03 10:33:56
186	21	4	\N	2024-07-03 10:40:15	2024-07-03 10:40:15
187	21	3	\N	2024-07-03 10:40:15	2024-07-03 10:40:15
188	21	1	\N	2024-07-03 10:40:15	2024-07-03 10:40:15
189	21	5	\N	2024-07-03 10:40:15	2024-07-03 10:40:15
113	19	3	\N	2024-07-03 09:48:00	2024-07-03 09:48:00
114	19	1	\N	2024-07-03 09:48:00	2024-07-03 09:48:00
115	19	5	\N	2024-07-03 09:48:00	2024-07-03 09:48:00
120	18	4	\N	2024-07-03 10:05:07	2024-07-03 10:05:07
121	18	3	\N	2024-07-03 10:05:07	2024-07-03 10:05:07
122	18	1	\N	2024-07-03 10:05:07	2024-07-03 10:05:07
123	18	5	\N	2024-07-03 10:05:07	2024-07-03 10:05:07
124	17	4	\N	2024-07-03 10:05:45	2024-07-03 10:05:45
125	17	3	\N	2024-07-03 10:05:45	2024-07-03 10:05:45
126	17	1	\N	2024-07-03 10:05:45	2024-07-03 10:05:45
127	17	5	\N	2024-07-03 10:05:45	2024-07-03 10:05:45
132	3	3	\N	2024-07-03 10:07:18	2024-07-03 10:07:18
133	3	1	\N	2024-07-03 10:07:18	2024-07-03 10:07:18
134	4	3	\N	2024-07-03 10:07:45	2024-07-03 10:07:45
135	4	1	\N	2024-07-03 10:07:45	2024-07-03 10:07:45
136	5	3	\N	2024-07-03 10:08:18	2024-07-03 10:08:18
137	7	3	\N	2024-07-03 10:09:08	2024-07-03 10:09:08
138	7	1	\N	2024-07-03 10:09:08	2024-07-03 10:09:08
139	7	5	\N	2024-07-03 10:09:08	2024-07-03 10:09:08
140	8	3	\N	2024-07-03 10:09:53	2024-07-03 10:09:53
141	8	1	\N	2024-07-03 10:09:53	2024-07-03 10:09:53
142	9	1	\N	2024-07-03 10:10:29	2024-07-03 10:10:29
143	9	5	\N	2024-07-03 10:10:29	2024-07-03 10:10:29
144	15	4	\N	2024-07-03 10:11:03	2024-07-03 10:11:03
145	15	3	\N	2024-07-03 10:11:03	2024-07-03 10:11:03
146	15	1	\N	2024-07-03 10:11:03	2024-07-03 10:11:03
147	15	5	\N	2024-07-03 10:11:03	2024-07-03 10:11:03
148	14	4	\N	2024-07-03 10:11:33	2024-07-03 10:11:33
149	14	3	\N	2024-07-03 10:11:33	2024-07-03 10:11:33
150	14	1	\N	2024-07-03 10:11:33	2024-07-03 10:11:33
151	14	5	\N	2024-07-03 10:11:33	2024-07-03 10:11:33
152	13	3	\N	2024-07-03 10:12:00	2024-07-03 10:12:00
153	12	1	\N	2024-07-03 10:12:35	2024-07-03 10:12:35
155	10	1	\N	2024-07-03 10:13:35	2024-07-03 10:13:35
160	16	4	\N	2024-07-03 10:14:41	2024-07-03 10:14:41
161	16	3	\N	2024-07-03 10:14:41	2024-07-03 10:14:41
162	16	1	\N	2024-07-03 10:14:41	2024-07-03 10:14:41
163	16	5	\N	2024-07-03 10:14:41	2024-07-03 10:14:41
\.


--
-- Data for Name: doctor_reschedule_appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_reschedule_appointments (id, patient_appointment_id, doctor_id, reschedule_patient_booking_date, reschedule_patient_time_slot, deleted_at, created_at, updated_at, reason) FROM stdin;
1	3	7	27-06-2024	13:00	\N	2024-06-15 16:59:54	2024-06-15 16:59:54	\N
2	22	6	27-06-2024	13:00	\N	2024-06-25 07:23:13	2024-06-25 07:23:13	\N
3	21	6	29-06-2024	17:00	\N	2024-06-25 07:23:27	2024-06-25 07:23:27	\N
4	25	6	2024-06-25	18:00	\N	2024-06-25 11:14:00	2024-06-25 11:14:00	test
5	46	11	26-07-2024	16:30	\N	2024-06-28 06:42:54	2024-06-28 06:42:54	\N
6	46	11	26-07-2024	16:30	\N	2024-06-28 06:45:29	2024-06-28 06:45:29	\N
7	73	6	2024-07-02	15:00	\N	2024-06-29 10:20:37	2024-06-29 10:20:37	testing reason for schedule
8	72	6	2024-07-02	14:00	\N	2024-06-29 10:47:14	2024-06-29 10:47:14	test
9	63	9	2024-06-30	14:00	\N	2024-06-29 17:54:31	2024-06-29 17:54:31	test
10	85	3	2024-07-01	08:00	\N	2024-06-30 07:02:01	2024-06-30 07:02:01	not able to travel
11	88	8	2024-07-03	08:30	\N	2024-07-01 08:19:12	2024-07-01 08:19:12	not well
12	87	9	2024-07-02	12:00	\N	2024-07-01 08:22:23	2024-07-01 08:22:23	nit well
13	92	9	2024-07-03	09:30	\N	2024-07-01 08:26:33	2024-07-01 08:26:33	not goods
14	92	9	2024-07-03	13:30	\N	2024-07-01 08:26:51	2024-07-01 08:26:51	not good
15	93	9	2024-07-03	09:30	\N	2024-07-01 08:28:32	2024-07-01 08:28:32	Jot ok
16	99	9	2024-07-09	12:30	\N	2024-07-02 19:50:30	2024-07-02 19:50:30	Test
17	117	9	2024-07-03	18:30	\N	2024-07-03 02:36:55	2024-07-03 02:36:55	The only way I could do that was if you wanted me too I could come and pick it out and then I can go pick up my
18	118	9	2024-07-03	14:30	\N	2024-07-03 11:02:18	2024-07-03 11:02:18	
\.


--
-- Data for Name: doctor_specialities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_specialities (id, doctor_id, speciality_id, created_at, updated_at, deleted_at) FROM stdin;
1	1	1	2024-06-06 06:48:24	2024-06-11 04:33:20	2024-06-11 04:33:20
3	1	1	2024-06-11 04:33:20	2024-06-11 04:42:20	2024-06-11 04:42:20
4	1	1	2024-06-11 04:42:20	2024-06-11 04:42:20	\N
2	2	2	2024-06-06 11:45:14	2024-06-11 04:43:06	2024-06-11 04:43:06
5	2	2	2024-06-11 04:43:06	2024-06-11 05:43:29	2024-06-11 05:43:29
6	2	2	2024-06-11 05:43:29	2024-06-11 05:43:29	\N
82	7	1	2024-07-03 10:09:09	2024-07-03 10:09:09	\N
83	8	1	2024-07-03 10:09:53	2024-07-03 10:09:53	\N
84	8	2	2024-07-03 10:09:53	2024-07-03 10:09:53	\N
85	9	2	2024-07-03 10:10:29	2024-07-03 10:10:29	\N
86	15	1	2024-07-03 10:11:03	2024-07-03 10:11:03	\N
87	15	2	2024-07-03 10:11:03	2024-07-03 10:11:03	\N
88	14	1	2024-07-03 10:11:33	2024-07-03 10:11:33	\N
89	14	2	2024-07-03 10:11:33	2024-07-03 10:11:33	\N
90	13	1	2024-07-03 10:12:00	2024-07-03 10:12:00	\N
14	6	1	2024-06-26 04:38:47	2024-06-26 04:38:47	\N
15	6	2	2024-06-26 04:38:47	2024-06-26 04:38:47	\N
91	12	1	2024-07-03 10:12:35	2024-07-03 10:12:35	\N
93	10	1	2024-07-03 10:13:35	2024-07-03 10:13:35	\N
96	16	1	2024-07-03 10:14:41	2024-07-03 10:14:41	\N
97	16	2	2024-07-03 10:14:41	2024-07-03 10:14:41	\N
100	20	1	2024-07-03 10:24:32	2024-07-03 10:24:32	\N
101	20	2	2024-07-03 10:24:32	2024-07-03 10:24:32	\N
103	11	2	2024-07-03 10:25:07	2024-07-03 10:25:07	\N
106	22	2	2024-07-03 10:31:27	2024-07-03 10:31:27	\N
107	23	1	2024-07-03 10:33:56	2024-07-03 10:33:56	\N
108	23	2	2024-07-03 10:33:56	2024-07-03 10:33:56	\N
111	21	1	2024-07-03 10:40:15	2024-07-03 10:40:15	\N
112	21	2	2024-07-03 10:40:15	2024-07-03 10:40:15	\N
70	19	2	2024-07-03 09:48:00	2024-07-03 09:48:00	\N
73	18	1	2024-07-03 10:05:07	2024-07-03 10:05:07	\N
74	18	2	2024-07-03 10:05:07	2024-07-03 10:05:07	\N
75	17	1	2024-07-03 10:05:45	2024-07-03 10:05:45	\N
76	17	2	2024-07-03 10:05:45	2024-07-03 10:05:45	\N
79	3	1	2024-07-03 10:07:18	2024-07-03 10:07:18	\N
80	4	1	2024-07-03 10:07:45	2024-07-03 10:07:45	\N
81	5	2	2024-07-03 10:08:18	2024-07-03 10:08:18	\N
\.


--
-- Data for Name: doctor_temporary_unavailables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_temporary_unavailables (id, doctor_id, unavailable_timeslot, unavailable_date, deleted_at, created_at, updated_at) FROM stdin;
1	3	["08:00"]	21-06-2024	\N	2024-06-20 07:15:00	2024-06-20 07:15:00
2	6	["08:30","12:30"]	25-06-2024	2024-06-26 11:26:54	2024-06-25 07:19:56	2024-06-26 11:26:54
3	6	["08:30","16:00","19:30","20:00"]	06-07-2024	2024-06-26 11:26:54	2024-06-25 08:32:16	2024-06-26 11:26:54
4	6	["08:00"]	26-06-2024	2024-06-26 11:26:54	2024-06-25 10:34:27	2024-06-26 11:26:54
5	6	["08:00"]	27-06-2024	2024-06-26 11:26:54	2024-06-25 10:35:38	2024-06-26 11:26:54
7	6	["08:00"]	27-06-2024	\N	2024-06-26 11:26:54	2024-06-26 11:26:54
6	4	["08:00","08:30"]	30-06-2024	2024-06-26 11:36:54	2024-06-26 11:10:49	2024-06-26 11:36:54
8	4	["09:00"]	27-06-2024	2024-06-26 11:36:54	2024-06-26 11:35:46	2024-06-26 11:36:54
9	4	["08:00"]	28-06-2024	2024-06-26 11:39:35	2024-06-26 11:36:54	2024-06-26 11:39:35
10	4	["09:00","14:00"]	05-07-2024	2024-06-26 11:43:16	2024-06-26 11:39:35	2024-06-26 11:43:16
11	4	["08:00"]	30-06-2024	2024-06-26 11:44:27	2024-06-26 11:43:16	2024-06-26 11:44:27
12	4	["08:00","14:00","16:00"]	30-06-2024	\N	2024-06-26 11:44:27	2024-06-26 11:44:27
13	11	["17:30"]	28-06-2024	\N	2024-06-28 06:49:36	2024-06-28 06:49:36
15	11	["20:00"]	03-07-2024	\N	2024-06-28 06:49:54	2024-06-28 06:49:54
16	9	["08:30"]	05-07-2024	2024-06-29 10:31:36	2024-06-29 10:21:37	2024-06-29 10:31:36
17	9	["08:30"]	01-09-2024	2024-06-29 10:31:36	2024-06-29 10:21:47	2024-06-29 10:31:36
18	9	["19:00"]	29-06-2024	2024-06-29 10:32:15	2024-06-29 10:31:36	2024-06-29 10:32:15
19	9	["14:00"]	01-09-2024	2024-07-01 09:59:43	2024-06-29 10:32:15	2024-07-01 09:59:43
20	9	["13:00","15:30","19:30"]	05-07-2024	2024-07-01 09:59:43	2024-06-29 11:08:46	2024-07-01 09:59:43
21	9	null	05-07-2024	2024-07-01 09:59:43	2024-06-29 11:18:52	2024-07-01 09:59:43
22	9	["08:00"]	05-07-2024	2024-07-01 09:59:43	2024-06-29 11:19:09	2024-07-01 09:59:43
23	9	["13:30"]	06-07-2024	2024-07-01 10:01:01	2024-07-01 09:59:43	2024-07-01 10:01:01
24	9	["09:00","13:30","14:00"]	06-07-2024	2024-07-01 10:02:08	2024-07-01 10:01:01	2024-07-01 10:02:08
25	9	["09:00","13:30","14:00"]	06-07-2024	2024-07-01 10:07:57	2024-07-01 10:02:08	2024-07-01 10:07:57
26	9	["08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30","18:00","18:30","19:00","19:30","20:00"]	09-07-2024	2024-07-01 10:17:50	2024-07-01 10:07:57	2024-07-01 10:17:50
27	9	["08:30"]	08-07-2024	2024-07-01 10:18:34	2024-07-01 10:17:50	2024-07-01 10:18:34
28	9	["08:30"]	10-07-2024	\N	2024-07-01 10:18:34	2024-07-01 10:18:34
29	15	["08:30"]	03-07-2024	\N	2024-07-02 09:26:07	2024-07-02 09:26:07
\.


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctors (id, user_id, hospital_id, year_of_experiance, license_no, license_type_id, country_id, appointment_dial_code, appointment_phone, country_of_orgin, gender, insurence_id, sub_insurence_id, profile_desciription, created_at, updated_at, deleted_at, department_id, license_no_doh, license_no_moh, agent_id, callcenter_id) FROM stdin;
8	56	7	2	DHA1	0	223	971	5745454545773722	0	2	0	0	<p><strong>a person skilled or specializing in healing arts</strong>. especially : one (as a physician, dentist, or veterinarian) who holds an advanced degree and is licensed to practice. 2. a. : a person who has earned one of the highest academic degrees (as a PhD) conferred by a university</p>	2024-06-27 13:21:51	2024-07-03 08:03:43	\N	\N	DOH1	MOH1	\N	\N
9	57	7	9	DHA4556	0	229	971	5555555535	0	1	0	0	<p><strong>a person skilled or specializing in healing arts</strong>. especially : one (as a physician, dentist, or veterinarian) who holds an advanced degree and is licensed to practice. 2. a. : a person who has earned one of the highest academic degrees (as a PhD) conferred by a university</p>	2024-06-27 13:24:11	2024-07-02 12:35:55	\N	\N	DOH67	MOH45	\N	\N
1	16	1	10	MDMD3628	["1"]	98	971	3453535345	0	1	0	0	<p>Envisioned for those who seek fine medical care in even finer surroundings, <a href="https://www.asterdmhealthcare.com/about-us/our-services/medcarehospital">Medcare Hospitals</a> and Clinics are the most <a href="https://www.asterdmhealthcare.com/">premium healthcare</a> facilities in the UAE.</p>	2024-06-06 06:48:23	2024-07-02 09:37:47	2024-07-02 09:37:47	\N	\N	\N	\N	\N
7	55	6	4	DHA464646	0	229	971	565656	0	2	0	0	<p><strong>a person skilled or specializing in healing arts</strong>. especially : one (as a physician, dentist, or veterinarian) who holds an advanced degree and is licensed to practice. 2. a. : a person who has earned one of the highest academic degrees (as a PhD) conferred by a university</p>	2024-06-27 13:14:21	2024-06-27 13:14:21	\N	\N	DOHA464646	MOHA464646	\N	\N
5	36	4	5	234DSSFDS	0	229	\N		0	2	0	0	<p>My testing profile</p>	2024-06-24 06:14:24	2024-07-03 10:08:18	\N	\N	\N	\N	\N	\N
4	35	4	12	yru8758585	0	98	971	23525253253	0	1	0	0	<p>Dr. Unni Mooppan, MD is a urology specialist in Brooklyn, NY. Dr. Mooppan has extensive experience in Male Reproductive Disorders &amp; Procedures and Urinary Conditions. He is affiliated with Brookdale Hospital Medical Center.</p>	2024-06-22 06:36:52	2024-07-03 10:07:45	\N	\N	DD47294	DFGDG793053	\N	\N
3	31	4	12	ef4353453	0	229	971	5335235235	0	1	0	0	<p>Aster DM Healthcare was founded in 1987 in Dubai, the United Arab Emirates, by Azad Moopen, a doctor turned entrepreneur. The company is a private sector healthcare provider in the Middle East. The India registered healthcare conglomerate covers an array of healthcare verticals, including hospitals, clinics, pharmacies and healthcare consultancy service.</p><p>In May 2011, Aster DM Healthcare opened its first medical centre in Sharjah, United Arab Emirates. The new centre was officially inaugurated by the veteran Indian play back singer K. J. Yesudas and various guests from the Government of Sharjah and Ministry of Health.</p><p>In February 2013, Aster DM Healthcare announced the interest of investing in the Philippines' healthcare sector. Initially, the company would start with the establishment of pharmacies and possibly hospitals in the later time. Moopen told reporters in a press conference for the launch of the DM Healthcare Foundation Philippines Inc., which is providing free paediatric cardiac surgery to at least 50 Filipino children in two years.In December, they launched its fifth Access Clinic in Jebel Ali Free Zone, or Jafza South, aimed at catering to the day-to-day healthcare needs of the employees in the neighbourhood.</p>	2024-06-20 05:22:07	2024-06-30 08:55:34	\N	\N	rty88568	dfgd457457	\N	\N
6	37	4	4	345egse	0	229	971		0	1	0	0	<p>cvxvx</p>	2024-06-24 06:45:45	2024-07-02 09:37:15	2024-07-02 09:37:15	\N	456547	dgdeyer	\N	\N
11	61	8	10	DHA123	0	232	971	505555555555555555555555555555	0	2	0	0	<figure class="table"><table><tbody><tr><td><i><strong>Doctor</strong></i></td></tr></tbody></table></figure><p>Doctors&nbsp;have many duties&nbsp;toward their patients.&nbsp;Their responsibilities cover&nbsp;their&nbsp;own&nbsp;actions, as well as&nbsp;orders they give to their assistants, such as nurses, medical students and residents.&nbsp;Here&nbsp;are the doctor’s obligations toward patients.</p>	2024-06-28 06:09:11	2024-07-03 10:25:07	\N	\N	DOH123	MOH123	\N	\N
2	17	1	12	2312312	["1"]	229	971	2312311444	0	2	0	0	<p>test</p>	2024-06-06 11:45:14	2024-07-02 09:37:30	2024-07-02 09:37:30	\N	\N	\N	\N	\N
15	97	7	1	DHA400	0	98	971	555544654	0	1	0	0	<p>A doctor is <strong>someone who is experienced and certified to practice medicine to help maintain or restore physical and mental health</strong>. A doctor is tasked with interacting with patients, diagnosing medical problems and successfully treating illness or injury.A doctor is <strong>someone who is experienced and certified to practice medicine to help maintain or restore physical and mental health</strong>. A doctor is tasked with interacting with patients, diagnosing medical problems and successfully treating illness or injury.A doctor is <strong>someone who is experienced and certified to practice medicine to help maintain or restore physical and mental health</strong>. A doctor is tasked with interacting with patients, diagnosing medical problems and successfully treating illness or injury.A doctor is <strong>someone who is experienced and certified to practice medicine to help maintain or restore physical and mental health</strong>. A doctor is tasked with interacting with patients, diagnosing medical problems and successfully treating illness or injury.A doctor is <strong>someone who is experienced and certified to practice medicine to help maintain or restore physical and mental health</strong>. A doctor is tasked with interacting with patients, diagnosing medical problems and successfully treating illness or injury.A doctor is <strong>someone who is experienced and certified to practice medicine to help maintain or restore physical and mental health</strong>. A doctor is tasked with interacting with patients, diagnosing medical problems and successfully treating illness or injury.A doctor is <strong>someone who is experienced and certified to practice medicine to help maintain or restore physical and mental health</strong>. A doctor is tasked with interacting with patients, diagnosing medical problems and successfully treating illness or injury.A doctor is <strong>someone who is experienced and certified to practice medicine to help maintain or restore physical and mental health</strong>. A doctor is tasked with interacting with patients, diagnosing medical problems and successfully treating illness or injury</p>	2024-07-02 09:07:54	2024-07-03 10:11:03	\N	\N	DOH400	MOH400	\N	\N
13	68	9	9	DHA676	0	228	971	50505095	0	1	0	0	\N	2024-06-28 14:20:00	2024-07-03 10:12:00	\N	\N	DOH765	MOH6777	\N	\N
12	67	9	7	DHA234	0	229	971	5050056767	0	2	0	0	<p>hospital, an institution that is built, staffed, and equipped for the diagnosis of disease; for the treatment, both medical and surgical, of the sick and the injured; and for their housing during this process. The modern hospital also often serves as a centre for investigation and for teaching.</p>	2024-06-28 14:18:16	2024-07-03 10:12:35	\N	\N	DOH456	MOH234	\N	\N
10	59	8	8	DHA123	0	229	971	556655665	0	1	0	0	<p><strong>a person skilled or specializing in healing arts</strong>. especially : one (as a physician, dentist, or veterinarian) who holds an advanced degree and is licensed to practice. 2. a. : a person who has earned one of the highest academic degrees (as a PhD) conferred by a university</p>	2024-06-27 14:18:27	2024-07-03 10:13:35	\N	\N	DOH456554	MOH1243	\N	\N
19	109	0	20	DSER23323	0	148	971	135548787978	0	1	0	0	<p>هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص. بينما تعمل جميع مولّدات نصوص لوريم إيبسوم على الإنترنت على إعادة تكرار مقاطع من نص لوريم إيبسوم نفسه عدة مرات بما تتطلبه الحاجة، يقوم مولّدنا هذا باستخدام كلمات من قاموس يحوي على أكثر من 200 كلمة لا تينية، مضاف إليها مجموعة من الجمل النموذجية، لتكوين نص لوريم إيبسوم ذو شكل منطقي قريب إلى النص الحقيقي. وبالتالي يكون النص الناتح خالي من التكرار، أو أي كلمات أو عبارات غير لائقة أو ما شابه. وهذا ما يجعله أول مولّد نص لوريم إيبسوم حقيقي على الإنترنت.1215</p>	2024-07-03 09:48:00	2024-07-03 09:48:00	\N	\N	SDFR43543	DSF32432	\N	\N
17	105	7	5	DHA500	0	231	971	6677866778	0	1	0	0	<h3>Responsibilities for Doctor</h3><ul><li>Perform routine check ups on patients</li><li>Keep detailed notes of the patient</li><li>Perform diagnostic tests to diagnose patients</li><li>Recommend patients to see a specialist</li><li>Provide quality healthcare to patients</li><li>Take part in further education opportunities</li><li>Treat patients in the office for minor injuries</li><li>Create a care plan for a patient</li></ul><h3>Qualifications for Doctor</h3><ul><li>Doctorate degree from an accredited medical school</li><li>Board certification and state license</li><li>Exceptional time management and attention to detail</li><li>Strong leadership skills</li><li>Great communication skills to talk with patients about treatment options</li><li>Ability to remain calm in stressful situations</li><li>Ability to evaluate data and information</li><li>Willingness to work long hours</li><li>Focused on customer service to create a great experience</li></ul>	2024-07-03 08:00:10	2024-07-03 10:05:45	\N	\N	DOH500	MOH500	\N	\N
18	108	7	5	DHA500	0	227	971		0	1	0	0	<p>A doctor is responsible for all sides of care of a patient. They diagnose, educate, and treat patients to ensure that they have the best possible care. A few of the main duties of a doctor are performing diagnostic tests, recommending specialists for patients, document patient's medical history, and educating patients. They also have to administer vaccines and other treatments. Some of the jobs titles that a doctor could grow into are head of research or hospital president.<br><br>A doctor should have at least 4 years of experience in residency as well as a doctorate degree from an accredited medical school. One of the most important skills that a doctor will have is their ability to diagnose their patients. Another skill is empathy as the doctor will need to relate to their patients. They also need to be able to multitask by working with several different patients.A doctor is responsible for all sides of care of a patient. They diagnose, educate, and treat patients to ensure that they have the best possible care. A few of the main duties of a doctor are performing diagnostic tests, recommending specialists for patients, document patient's medical history, and educating patients. They also have to administer vaccines and other treatments. Some of the jobs titles that a doctor could grow into are head of research or hospital president.<br><br>A doctor should have at least 4 years of experience in residency as well as a doctorate degree from an accredited medical school. One of the most important skills that a doctor will have is their ability to diagnose their patients. Another skill is empathy as the doctor will need to relate to their patients. They also need to be able to multitask by working with several different patients.A doctor is responsible for all sides of care of a patient. They diagnose, educate, and treat patients to ensure that they have the best possible care. A few of the main duties of a doctor are performing diagnostic tests, recommending specialists for patients, document patient's medical history, and educating patients. They also have to administer vaccines and other treatments. Some of the jobs titles that a doctor could grow into are head of research or hospital president.<br><br>A doctor should have at least 4 years of experience in residency as well as a doctorate degree from an accredited medical school. One of the most important skills that a doctor will have is their ability to diagnose their patients. Another skill is empathy as the doctor will need to relate to their patients. They also need to be able to multitask by working with several different patients.A doctor is responsible for all sides of care of a patient. They diagnose, educate, and treat patients to ensure that they have the best possible care. A few of the main duties of a doctor are performing diagnostic tests, recommending specialists for patients, document patient's medical history, and educating patients. They also have to administer vaccines and other treatments. Some of the jobs titles that a doctor could grow into are head of research or hospital president.<br><br>A doctor should have at least 4 years of experience in residency as well as a doctorate degree from an accredited medical school. One of the most important skills that a doctor will have is their ability to diagnose their patients. Another skill is empathy as the doctor will need to relate to their patients. They also need to be able to multitask by working with several different patients.A doctor is responsible for all sides of care of a patient. They diagnose, educate, and treat patients to ensure that they have the best possible care. A few of the main duties of a doctor are performing diagnostic tests, recommending specialists for patients, document patient's medical history, and educating patients. They also have to administer vaccines and other treatments. Some of the jobs titles that a doctor could grow into are head of research or hospital president.<br><br>A doctor should have at least 4 years of experience in residency as well as a doctorate degree from an accredited medical school. One of the most important skills that a doctor will have is their ability to diagnose their patients. Another skill is empathy as the doctor will need to relate to their patients. They also need to be able to multitask by working with several different patients.A doctor is responsible for all sides of care of a patient. They diagnose, educate, and treat patients to ensure that they have the best possible care. A few of the main duties of a doctor are performing diagnostic tests, recommending specialists for patients, document patient's medical history, and educating patients. They also have to administer vaccines and other treatments. Some of the jobs titles that a doctor could grow into are head of research or hospital president.<br><br>A doctor should have at least 4 years of experience in residency as well as a doctorate degree from an accredited medical school. One of the most important skills that a doctor will have is their ability to diagnose their patients. Another skill is empathy as the doctor will need to relate to their patients. They also need to be able to multitask by working with several different patients.</p>	2024-07-03 09:39:55	2024-07-03 10:05:07	\N	\N	DOH700	MOH600	\N	\N
16	104	7	5	DHA499	0	230	971	556655665	0	1	0	0	<h3>Responsibilities for Doctor</h3><ul><li>Perform routine check ups on patients</li><li>Keep detailed notes of the patient</li><li>Perform diagnostic tests to diagnose patients</li><li>Recommend patients to see a specialist</li><li>Provide quality healthcare to patients</li><li>Take part in further education opportunities</li><li>Treat patients in the office for minor injuries</li><li>Create a care plan for a patient</li></ul><h3>Qualifications for Doctor</h3><ul><li>Doctorate degree from an accredited medical school</li><li>Board certification and state license</li><li>Exceptional time management and attention to detail</li><li>Strong leadership skills</li><li>Great communication skills to talk with patients about treatment options</li><li>Ability to remain calm in stressful situations</li><li>Ability to evaluate data and information</li><li>Willingness to work long hours</li><li>Focused on customer service to create a great experience</li></ul>	2024-07-03 07:57:47	2024-07-03 10:14:41	\N	\N	DOH499	MOH499	\N	\N
14	86	7	5	DHA123	0	98	971	556655665	0	1	0	0	<p>Doctors are people who practice medicine. Doctors are trained to keep people healthy and to heal the sick.</p><p>There are many parts to a doctor’s job. Doctors first need to identify what is making a person sick. Then they decide on a treatment. They also predict when the patient will feel better. In addition, doctors try to prevent illnesses. When treating patients, doctors work with many other people, including nurses, therapists, and physician assistants.</p><p>Becoming a doctor involves years of education and training. Medical students first attend college, where they take classes in biology, chemistry, and physics in addition to general studies. Then they spend three to four years in medical school. Students usually earn a Doctor of Medicine degree in medical school.</p><p>After medical school, most graduates enter a residency, which is a training program usually in a hospital. During a residency, experienced doctors train the new doctors for three to seven years. During this time, new doctors can specialize in a particular type of medicine. They may choose to focus on a particular area of medicine, such as internal medicine. Or they may choose to focus on a particular part of the body, such as bones or the heart. Finally, new doctors must pass a test to get a license to practice medicine.Doctors are people who practice medicine. Doctors are trained to keep people healthy and to heal the sick.</p><p>There are many parts to a doctor’s job. Doctors first need to identify what is making a person sick. Then they decide on a treatment. They also predict when the patient will feel better. In addition, doctors try to prevent illnesses. When treating patients, doctors work with many other people, including nurses, therapists, and physician assistants.</p><p>Becoming a doctor involves years of education and training. Medical students first attend college, where they take classes in biology, chemistry, and physics in addition to general studies. Then they spend three to four years in medical school. Students usually earn a Doctor of Medicine degree in medical school.</p><p>After medical school, most graduates enter a residency, which is a training program usually in a hospital. During a residency, experienced doctors train the new doctors for three to seven years. During this time, new doctors can specialize in a particular type of medicine. They may choose to focus on a particular area of medicine, such as internal medicine . Or they may choose to focus on a particular part of the body, such as bones or the heart. Finally, new doctors must pass a test to get a license to practice medicine.</p>	2024-07-01 11:11:17	2024-07-03 10:11:33	\N	\N	DOH123	MOH123	\N	\N
22	112	7	19	SDASD21312312	0	32	971	34234234342	0	1	0	0	<p>test description</p>	2024-07-03 10:31:27	2024-07-03 10:31:27	\N	\N	FW4534R3WR2	DSF3R23R4	\N	\N
20	110	7	5	DHA4444	0	229	971	68787635698	0	1	0	0	\N	2024-07-03 10:22:09	2024-07-03 10:24:32	\N	\N	DOH4444	MOH4444	\N	\N
23	113	7	19	DWR324	0	31	971	2363323265	0	2	0	0	<p>TESTING PROFILE</p>	2024-07-03 10:33:56	2024-07-03 10:33:56	\N	\N	FRT43	WER343	\N	\N
21	111	7	3	DHA4009	0	228	971	504455445	0	2	0	0	<p>A doctor is responsible for all sides of care of a patient. They diagnose, educate, and treat patients to ensure that they have the best possible care. A few of the main duties of a doctor are performing diagnostic tests, recommending specialists for patients, document patient's medical history, and educating patients. They also have to administer vaccines and other treatments. Some of the jobs titles that a doctor could grow into are head of research or hospital president.<br><br>A doctor should have at least 4 years of experience in residency as well as a doctorate degree from an accredited medical school. One of the most important skills that a doctor will have is their ability to diagnose their patients. Another skill is empathy as the doctor will need to relate to their patients. They also need to be able to multitask by working with several different patients.A doctor is responsible for all sides of care of a patient. They diagnose, educate, and treat patients to ensure that they have the best possible care. A few of the main duties of a doctor are performing diagnostic tests, recommending specialists for patients, document patient's medical history, and educating patients. They also have to administer vaccines and other treatments. Some of the jobs titles that a doctor could grow into are head of research or hospital president.<br><br>A doctor should have at least 4 years of experience in residency as well as a doctorate degree from an accredited medical school. One of the most important skills that a doctor will have is their ability to diagnose their patients. Another skill is empathy as the doctor will need to relate to their patients. They also need to be able to multitask by working with several different patients.A doctor is responsible for all sides of care of a patient. They diagnose, educate, and treat patients to ensure that they have the best possible care. A few of the main duties of a doctor are performing diagnostic tests, recommending specialists for patients, document patient's medical history, and educating patients. They also have to administer vaccines and other treatments. Some of the jobs titles that a doctor could grow into are head of research or hospital president.<br><br>A doctor should have at least 4 years of experience in residency as well as a doctorate degree from an accredited medical school. One of the most important skills that a doctor will have is their ability to diagnose their patients. Another skill is empathy as the doctor will need to relate to their patients. They also need to be able to multitask by working with several different patients.A doctor is responsible for all sides of care of a patient. They diagnose, educate, and treat patients to ensure that they have the best possible care. A few of the main duties of a doctor are performing diagnostic tests, recommending specialists for patients, document patient's medical history, and educating patients. They also have to administer vaccines and other treatments. Some of the jobs titles that a doctor could grow into are head of research or hospital president.<br><br>A doctor should have at least 4 years of experience in residency as well as a doctorate degree from an accredited medical school. One of the most important skills that a doctor will have is their ability to diagnose their patients. Another skill is empathy as the doctor will need to relate to their patients. They also need to be able to multitask by working with several different patients.</p>	2024-07-03 10:31:04	2024-07-03 10:40:15	\N	\N	DOH4009	MOH4009	\N	\N
\.


--
-- Data for Name: emirates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emirates (id, name_en, name_ar, active, deleted_at, created_at, updated_at, country_id) FROM stdin;
2	Dubai	دبي	1	\N	2024-05-24 06:49:07	2024-05-24 06:49:07	229
3	Abudhabi	abudhabi	1	\N	2024-06-28 04:47:25	2024-06-28 04:47:25	229
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
3	How do I register/create an account?	You can register/create an account simply using your mobile or WhatsApp number. However, adding your full name, email, insurance details, date of birth is optional, but we encourage to do so.	1	1	1	2024-04-09 07:30:57	2024-07-02 03:30:48
1	Can I add my family members and friends on my account?	You can add your family members and friends within your account without a separate registration.	1	1	1	2024-03-25 07:08:32	2024-07-02 03:31:50
\.


--
-- Data for Name: help; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.help (id, title, description, created_by, updated_by, active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: hospital_doctor_feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hospital_doctor_feedback (id, doctor_id, hospital_id, user_id, rating, feeback_message, deleted_at, created_at, updated_at, appointment_id) FROM stdin;
1	6	4	60	3	Testing Feedback	\N	2024-06-28 19:32:28	2024-06-28 19:32:28	61
2	6	4	60	3	Testing Feedback reviews.	\N	2024-06-28 20:33:47	2024-06-28 20:33:47	62
3	3	4	48	4	Sdvvh hnj  hjvnn	\N	2024-06-30 07:05:35	2024-06-30 07:05:35	85
4	15	7	96	5	very well mannered appointment	\N	2024-07-02 10:03:35	2024-07-02 10:03:35	111
5	3	4	60	1	Test	\N	2024-07-02 23:15:50	2024-07-02 23:15:50	116
\.


--
-- Data for Name: hospital_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hospital_images (id, hospital_id, image_name, created_at, updated_at, deleted_at) FROM stdin;
1	3	1718273307666ac51bf286b.jpg	2024-06-13 10:08:28	2024-06-13 10:08:28	\N
2	3	1718273308666ac51c11501.jpg	2024-06-13 10:08:28	2024-06-13 10:08:28	\N
7	4	1719312522667aa08a67137.jfif	2024-06-25 10:48:42	2024-06-25 10:48:42	\N
8	4	1719401351667bfb87df912.jpg	2024-06-26 11:29:12	2024-06-26 11:29:12	\N
10	6	1719487940667d4dc4acbfa.jpg	2024-06-27 11:32:21	2024-06-27 11:32:21	\N
11	6	1719487941667d4dc516c46.jpg	2024-06-27 11:32:21	2024-06-27 11:32:21	\N
12	6	1719487941667d4dc5384f6.jpg	2024-06-27 11:32:21	2024-06-27 11:32:21	\N
13	7	1719491232667d5aa0a8357.jpeg	2024-06-27 12:27:12	2024-06-27 12:27:12	\N
14	8	1719497364667d72945f228.jpeg	2024-06-27 14:09:24	2024-06-27 14:09:24	\N
15	9	1719582990667ec10ed340f.jpeg	2024-06-28 13:56:30	2024-06-28 13:56:30	\N
16	9	1719582990667ec10ef0b3e.jpeg	2024-06-28 13:56:31	2024-06-28 13:56:31	\N
17	9	1719582991667ec10f1010c.jpeg	2024-06-28 13:56:31	2024-06-28 13:56:31	\N
18	11	1719812646668242266923c.jpeg	2024-07-01 05:44:06	2024-07-01 05:44:06	\N
19	7	17198411146682b15ab853c.jpeg	2024-07-01 13:38:35	2024-07-01 13:38:35	\N
\.


--
-- Data for Name: hospital_insurance_policies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hospital_insurance_policies (id, hospital_id, insurance_id, sub_insurance_id, created_at, updated_at) FROM stdin;
1	4	4	5	2024-06-20 05:04:28	2024-06-20 05:04:28
2	4	4	6	2024-06-20 05:04:28	2024-06-20 05:04:28
3	4	4	7	2024-06-20 05:04:28	2024-06-20 05:04:28
4	4	1	3	2024-06-20 05:06:50	2024-06-20 05:06:50
5	4	1	1	2024-06-20 05:06:50	2024-06-20 05:06:50
6	4	1	4	2024-06-20 05:06:50	2024-06-20 05:06:50
7	8	4	6	2024-06-27 14:31:32	2024-06-27 14:31:32
8	7	4	6	2024-06-28 11:28:36	2024-06-28 11:28:36
\.


--
-- Data for Name: hospital_insurances; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hospital_insurances (id, hospital_id, insurance_id, sub_insurance_id, created_at, updated_at, deleted_at) FROM stdin;
4	4	4	7,6	2024-06-26 11:29:36	2024-06-26 11:29:36	\N
\.


--
-- Data for Name: hospital_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hospital_locations (id, hospital_id, location, latitude, longitude, created_at, updated_at, deleted_at) FROM stdin;
9	1	Dubai International Airport (DXB) - Dubai - United Arab Emirates	25.2566932	55.36431779999999	2024-06-26 09:21:04	2024-06-26 09:21:04	\N
10	3	68GQ+24H - Al Jaddaf - Jaddaf Waterfront - Dubai - United Arab Emirates	25.2250683	55.3378531	2024-06-26 09:21:27	2024-06-26 09:21:27	\N
11	4	22 Kuwait St - Al Karama - Dubai - United Arab Emirates	25.1972295	55.27974699999999	2024-06-26 11:29:11	2024-06-26 11:29:11	\N
17	6	Street - 4C Sheikh Khalifa Bin Zayed St - Al Karama - Dubai - United Arab Emirates	25.204819	55.270931	2024-06-27 14:12:00	2024-06-27 14:12:00	\N
18	8	10 26 St - Za'abeel - Za'abeel 2 - Dubai - United Arab Emirates	25.204819	55.270931	2024-06-28 05:17:10	2024-06-28 05:17:10	\N
33	7	Index Tower - DIFC, 11th Floor, East Entrance, Office 1101 - المركز التجاري - DIFC - دبي - United Arab Emirates	25.204819	55.270931	2024-07-02 05:06:23	2024-07-02 05:06:23	\N
35	9	685V+GG - Ras Al Khor - Dubai Creek Harbour - Dubai - United Arab Emirates	25.204819	55.270931	2024-07-02 05:08:15	2024-07-02 05:08:15	\N
36	10	198 Airport Rd - Dubai - United Arab Emirates	25.23852528484163	55.37643792689357	2024-07-02 05:09:02	2024-07-02 05:09:02	\N
37	11	27 11C St - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates	\N	\N	2024-07-02 05:09:51	2024-07-02 05:09:51	\N
40	12	80 شارع - ٣١٢ - Za'abeel - Za'abeel 2 - Dubai - United Arab Emirates	25.20810004240003	55.27966427255247	2024-07-03 10:18:48	2024-07-03 10:18:48	\N
\.


--
-- Data for Name: hospital_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hospital_services (id, hospital_id, service_id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: hospital_specialities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hospital_specialities (id, hospital_id, speciality_id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: hospitals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hospitals (id, user_id, country_id, emirate_id, area_id, address, website, profile_description, trade_licenece, created_at, updated_at, deleted_at, name_en, name_ar, appointment_dial_code, appointment_phone, profile_description_ar, latitude, longitude, txt_location, agent_id, callcenter_id, type) FROM stdin;
2	18	229	2	1	testtt	google.com	<p>test</p>	\N	2024-06-07 03:54:30	2024-06-07 03:54:30	\N	Cmh	cmh	971	1234567890	<p>tes</p>	\N	\N	\N	\N	\N	10
4	30	229	2	2	Almanra tower	https://www.asterdmhealthcare.com/	<p>"We’ll Treat you Well"<br>We live by this promise that sums up what we do and why we exist. This is our guiding philosophy in our interactions with patients, doctors, employees and society at large.</p><p>Our Values<br>We, at Aster DM Healthcare, abide by a core set of values that guide our organisational behaviour and decision making, and that create the u</p>	17187960626672bf1eb5e56.pdf	2024-06-19 11:21:02	2024-06-26 11:29:11	\N	Aster	\N	971		\N	25.1972295	55.27974699999999	57WH+VV - Downtown Dubai - Dubai - United Arab Emirates	\N	\N	10
5	40	229	2	2	9 15th St - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates	\N	<p>Hospital/Clinic Profile</p>	1719323116667ac9ec19b06.jpeg	2024-06-25 13:45:16	2024-06-25 13:45:16	\N	Hospital	\N	\N	223232323	\N	25.203281344725088	55.246675245602965	\N	\N	\N	10
1	15	229	2	2	Corporate HQ 33rd Floor, Aspect Towers, Business Bay, Dubai, UAE	https://www.asterdmhealthcare.com/	<p>Brand Promise<br>"We’ll Treat you Well"<br>We live by this promise that sums up what we do and why we exist. This is our guiding philosophy in our interactions with patients, doctors, employees and society at large.</p><p>Our Values<br>We, at Aster DM Healthcare, abide by a core set of values that guide our organisational behaviour and decision making, and that create the unique ethos that is imbibed in every Asterian.</p>	17176556106661583a5a28e.jpg	2024-06-06 06:33:30	2024-06-26 09:21:04	\N	Aster Medcity	\N	971	067738993	<p>وعد العلامة التجارية<br>"سنعاملك بشكل جيد"<br>نحن نعيش بهذا الوعد الذي يلخص ما نقوم به ولماذا نحن موجودون. هذه هي فلسفتنا التوجيهية في تفاعلاتنا مع المرضى والأطباء والموظفين والمجتمع ككل.</p><p>قيمنا<br>نحن، في Aster DM Healthcare، نلتزم بمجموعة أساسية من القيم التي توجه سلوكنا التنظيمي وصنع القرار لدينا، والتي تخلق الروح الفريدة المتشربة في كل Asterian.</p>	25.2566932	55.36431779999999	Dubai International Airport (DXB) - Dubai - United Arab Emirates	\N	\N	10
3	24	229	2	1	Al Jaddaf, Dubai, UAE	dxbitprojects.com	<p>Strategically located in the heart of Abu Dhabi city, yet nestled in a quiet setting that provides both convenience and privacy, Aster Hospital is your go-to dentistry boutique offering a range of comprehensive services in a friendly and relaxed atmosphere.</p>	1718273307666ac51b92b87.jpg	2024-06-13 10:08:27	2024-06-26 09:21:27	\N	Al Jalila Children's Hospital	Al Jalila Children's Hospital	971	12313123123	<p>Strategically located in the heart of Abu Dhabi city, yet nestled in a quiet setting that provides both convenience and privacy, Aster Hospital is your go-to dentistry boutique offering a range of comprehensive services in a friendly and relaxed atmosphere.</p>	25.2250683	55.3378531	68GQ+24H - Al Jaddaf - Jaddaf Waterfront - Dubai - United Arab Emirates	\N	\N	10
8	58	229	2	2	Al Nahda	jpjup.c	<p>A Clinic is a health care center where you <strong>receive routine preventative care when you are healthy or visit your Doctor/Primary Care Provider when you are sick</strong>. A clinic is smaller than a hospital where patients are less sick and do not stay overnight.</p>	1719497364667d7294094dd.jpeg	2024-06-27 14:09:24	2024-06-28 05:17:09	\N	Jupiter Clinic	Jupiter Clinic	971	098989898	<p>A Clinic is a health care center where you <strong>receive routine preventative care when you are healthy or visit your Doctor/Primary Care Provider when you are sick</strong>. A clinic is smaller than a hospital where patients are less sick and do not stay overnight.</p>	25.204819	55.270931	10 26 St - Za'abeel - Za'abeel 2 - Dubai - United Arab Emirates	\N	\N	20
7	54	229	2	2	Al Ohood Street - Sheikh Mohammed bin Rashid Blvd - Downtown Dubai - Dubai-United Arab Emirates	aniXaniXaniX.com	<p>ccording to the American Hospital Association (AHA), hospitals are <strong>licensed institutions with at least six beds whose primary function is to provide diagnostic and therapeutic patient services for medical conditions</strong>; they have an organized physician staff; and they provide continuous nursing services under the ...</p>	1719491232667d5aa044331.jpeg	2024-06-27 12:27:12	2024-07-02 05:06:23	\N	AniX Hospital	\N	971	889900887	\N	25.204819	55.270931	Index Tower - DIFC, 11th Floor, East Entrance, Office 1101 - المركز التجاري - DIFC - دبي - United Arab Emirates	\N	\N	10
6	52	229	2	2	Al Jaber Building - 1st Floor - 4C St - near City Corner Supermarket	joseph.com	<p>We, at Dr. Joseph Polyclinic, commit ourselves to providing high-quality health service &amp; safe environment at an affordable price to all. At Dr. Joseph's Polyclinic, the health service is provided by a dedicated team of qualified experienced doctors, from the best medical colleges in India and abroad. The doctors are assisted by well-trained service-oriented compassionate and supporting staff. We strive to excel in anticipating &amp; meeting our community's needs, wants &amp; expectations in an environment conducive to teamwork incorporating the best professional staff, facility &amp; equipment for diagnosis &amp; best possible management in all our departments.</p>	1719487384667d4b98d921e.jpg	2024-06-27 11:23:05	2024-06-27 14:12:00	\N	Joseph Clinic	\N	971	696969869896	\N	25.204819	55.270931	Street - 4C Sheikh Khalifa Bin Zayed St - Al Karama - Dubai - United Arab Emirates	\N	\N	20
10	79	229	2	2	Al Ohood Street - Sheikh Mohammed bin Rashid Blvd - Etisalat by the End Dubai - Dubai - United Arab Emirates	kns,com	\N	1719663049667ff9c92db13.jpg	2024-06-29 12:10:49	2024-07-02 05:09:02	\N	K N S Hospital	\N	971	123355666	\N	25.23852528484163	55.37643792689357	198 Airport Rd - Dubai - United Arab Emirates	\N	\N	10
11	82	229	2	2	Al Ohood Street - Sheikh Mohammed bin Rashid Blvd - Downtown Sharjah - Sharjah - United Arab Emirates	h.c	\N	17198126466682422619962.jpeg	2024-07-01 05:44:06	2024-07-02 05:09:51	\N	Amstor Hospital	Amstor Hospital	971	55056789786	\N	\N	\N	27 11C St - Jumeirah - Jumeirah 2 - Dubai - United Arab Emirates	\N	\N	10
12	87	229	2	1	Al Ohood Street - Sheikh Mohammed bin Rashid Blvd - World Trade Center Dubai - Dubai - United Arab Emirates	lourde.com	\N	17198342696682969de7e79.jpeg	2024-07-01 11:44:30	2024-07-02 05:10:48	\N	Lourde Matha Hospital	\N	971	999999999999	\N	25.20810004240003	55.27966427255247	80 شارع - ٣١٢ - Za'abeel - Za'abeel 2 - Dubai - United Arab Emirates	\N	\N	10
9	66	229	3	4	Al Ohood Street - Sheikh Mohammed bin Rashid Blvd - Al Nahda Dubai - Dubai - United Arab Emirates	l.c	<p><strong>hospital, an institution that is built, staffed, and equipped for the diagnosis of disease; for the treatment, both medical and surgical, of the sick and the injured; and for their housing during this process. The modern hospital also often serves as a centre for investigation and for teaching.</strong></p>	1719582928667ec0d013b40.jpeg	2024-06-28 13:55:28	2024-07-02 05:08:15	\N	Lourde Hospital	\N	971	858585855	<p>hospital, an institution that is built, staffed, and equipped for the diagnosis of disease; for the treatment, both medical and surgical, of the sick and the injured; and for their housing during this process. The modern hospital also often serves as a centre for investigation and for teaching.</p>	25.204819	55.270931	685V+GG - Ras Al Khor - Dubai Creek Harbour - Dubai - United Arab Emirates	\N	\N	10
\.


--
-- Data for Name: insurence_policies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insurence_policies (id, title, title_ar, status, created_by, last_updated_by, created_at, updated_at, deleted_at) FROM stdin;
2	National Helth	\N	1	1	1	2024-04-11 06:13:40	2024-04-11 06:13:52	2024-04-11 06:13:52
3	National	nationa	1	1	1	2024-04-11 08:56:15	2024-04-11 08:57:56	2024-04-11 08:57:56
1	Aafiya	Aafiya	1	1	1	2024-04-11 06:13:14	2024-06-17 17:16:27	\N
4	Abudhabi National Insurance Company	Abudhabi National Insurance Company	1	1	1	2024-06-17 17:16:47	2024-06-17 17:16:47	\N
5	New Dubai Insurance	\N	1	1	1	2024-06-28 09:33:25	2024-06-28 09:33:25	\N
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.languages (id, title, title_ar, status, created_by, last_updated_by, created_at, updated_at, deleted_at) FROM stdin;
3	Malayalam	المالايالامية	1	1	1	2024-04-11 05:26:21	2024-04-11 05:26:21	\N
1	English	إنجليزي	1	1	1	2024-04-11 05:25:23	2024-04-11 05:26:43	\N
2	Hindi	الهندية	1	1	1	2024-04-11 05:25:48	2024-04-11 05:26:58	\N
\.


--
-- Data for Name: licence_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.licence_types (id, title, title_ar, status, created_by, last_updated_by, created_at, updated_at, deleted_at) FROM stdin;
2	MBBS	IMA Registrations	0	1	1	2024-04-11 04:47:07	2024-04-11 04:47:20	2024-04-11 04:47:20
3	cas	asda	1	1	1	2024-04-11 06:32:31	2024-04-11 06:32:38	2024-04-11 06:32:38
1	DHA	DHA	1	1	1	2024-04-11 04:46:10	2024-06-17 17:21:24	\N
4	MOH	MOH	1	1	1	2024-06-17 17:21:40	2024-06-17 17:21:40	\N
5	DOH	DOH	1	1	1	2024-06-17 17:21:55	2024-06-17 17:21:55	\N
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (id, txt_location, latitude, longitude, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: medical_conditions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medical_conditions (id, title, title_ar, status, created_by, last_updated_by, created_at, updated_at, deleted_at) FROM stdin;
1	Allergians	الحساسية	1	1	1	2024-04-11 05:39:57	2024-04-11 05:40:43	\N
2	Allergianss	\N	1	1	1	2024-04-11 05:40:09	2024-04-11 05:40:52	2024-04-11 05:40:52
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.members (id, user_id, full_name, gender, age, insurence_id, sub_insurence_id, created_at, updated_at, deleted_at, full_name_ar, user_image) FROM stdin;
1	14	sooraj	1	30	1	3	2024-06-06 04:51:22	2024-06-06 04:51:22	\N	\N	\N
3	14	amruth	1	30	0	0	2024-06-06 04:51:22	2024-06-06 04:51:51	2024-06-06 04:51:51	\N	\N
2	14	dady	2	25	1	1	2024-06-06 04:51:22	2024-06-06 04:52:19	\N	\N	\N
4	19	test	1	40	1	3	2024-06-13 17:47:50	2024-06-13 17:47:50	\N	\N	\N
5	19	test2	2	50	1	1	2024-06-13 17:47:50	2024-06-13 17:47:50	\N	\N	\N
6	23	sooraj	1	30	1	3	2024-06-14 06:02:56	2024-06-14 06:02:56	\N	\N	\N
7	23	sooraj	1	30	1	3	2024-06-14 06:02:56	2024-06-14 06:02:56	\N	\N	\N
9	23	sooraj	1	30	1	3	2024-06-14 06:03:36	2024-06-14 06:03:36	\N	\N	\N
10	23	sooraj	1	30	1	3	2024-06-14 06:03:36	2024-06-14 06:03:36	\N	\N	\N
8	23	sooraj	1	30	0	0	2024-06-14 06:02:56	2024-06-14 06:05:55	2024-06-14 06:05:55	\N	\N
11	23	Hamid	1	29	1	1	2024-06-14 06:03:36	2024-06-14 06:08:12	\N	\N	\N
12	23	sooraj	1	30	1	3	2024-06-15 05:07:08	2024-06-15 05:07:08	\N	\N	\N
13	23	sooraj	1	30	1	3	2024-06-15 05:07:08	2024-06-15 05:07:08	\N	\N	\N
15	39	sooraj	1	30	1	3	2024-06-25 11:09:01	2024-06-25 11:09:01	\N	\N	\N
16	39	sooraj	1	30	1	3	2024-06-25 11:09:01	2024-06-25 11:09:01	\N	\N	\N
17	39	sooraj	1	30	0	0	2024-06-25 11:09:01	2024-06-25 11:09:01	\N	\N	\N
18	44	anil son	1	25	1	3	2024-06-26 10:24:23	2024-06-26 10:24:23	\N	\N	\N
19	39	dev	1	30	1	3	2024-06-26 10:26:10	2024-06-26 10:26:10	\N	\N	\N
20	39	sooraj	1	30	1	3	2024-06-26 10:26:10	2024-06-26 10:26:10	\N	\N	\N
21	44	shhsjd	1	12	1	3	2024-06-26 10:52:28	2024-06-26 10:52:28	\N	\N	\N
24	47	sooraj	1	30	0	0	2024-06-27 04:07:17	2024-06-27 04:24:19	2024-06-27 04:24:19	\N	\N
22	47	sooraj	1	30	1	3	2024-06-27 04:07:17	2024-06-27 04:25:06	2024-06-27 04:25:06	\N	\N
23	47	sooraj	1	30	1	3	2024-06-27 04:07:17	2024-06-27 04:25:11	2024-06-27 04:25:11	\N	\N
25	47	sooraj	1	30	1	3	2024-06-27 04:29:04	2024-06-27 04:29:04	\N	\N	\N
26	47	sooraj	1	30	1	3	2024-06-27 04:29:04	2024-06-27 04:29:04	\N	\N	\N
27	47	sooraj	1	30	0	0	2024-06-27 04:29:04	2024-06-27 04:29:04	\N	\N	\N
53	69	test	1	50	1	1	2024-06-28 20:34:14	2024-06-28 20:34:14	\N	\N	\N
28	51	Aliya	2	22	\N	\N	2024-06-27 11:13:45	2024-06-27 11:31:41	2024-06-27 11:31:41	Ali	\N
29	50	test	1	30	1	3	2024-06-27 15:47:16	2024-06-27 15:48:52	2024-06-27 15:48:52	\N	\N
30	50	test	1	30	0	0	2024-06-27 15:49:11	2024-06-27 16:32:31	2024-06-27 16:32:31	\N	\N
31	50	Test 1	1	21	4	7	2024-06-27 16:33:21	2024-06-27 16:38:53	2024-06-27 16:38:53	\N	\N
32	50	Test 2	2	22	0	0	2024-06-27 16:33:21	2024-06-27 16:38:58	2024-06-27 16:38:58	\N	\N
33	50	Test 1	1	21	4	7	2024-06-27 16:33:21	2024-06-27 16:39:03	2024-06-27 16:39:03	\N	\N
34	50	Test 2	2	22	0	0	2024-06-27 16:33:21	2024-06-27 16:39:09	2024-06-27 16:39:09	\N	\N
35	50	Test 1	1	21	4	6	2024-06-27 16:45:17	2024-06-27 16:46:55	2024-06-27 16:46:55	\N	\N
36	50	Test 2	2	22	0	0	2024-06-27 16:45:17	2024-06-27 16:46:59	2024-06-27 16:46:59	\N	\N
37	50	Test 1	1	21	4	6	2024-06-27 16:45:17	2024-06-27 16:47:03	2024-06-27 16:47:03	\N	\N
38	50	Test 2	2	22	0	0	2024-06-27 16:45:17	2024-06-27 16:47:07	2024-06-27 16:47:07	\N	\N
40	50	Test 2	2	22	0	0	2024-06-27 16:48:37	2024-06-27 17:45:09	2024-06-27 17:45:09	\N	\N
54	70	Test	2	26	1	4	2024-06-28 20:39:33	2024-06-28 20:39:33	\N	\N	\N
49	42	test new	1	30	1	3	2024-06-28 09:50:14	2024-06-28 22:05:22	\N	\N	1719612322667f33a269f0d.jpg
41	50	Test Two E	2	26	0	0	2024-06-27 17:52:52	2024-06-27 20:43:23	2024-06-27 20:43:23	\N	\N
39	50	Test 1	1	21	4	6	2024-06-27 16:48:37	2024-06-27 20:43:38	2024-06-27 20:43:38	\N	\N
42	60	Test	3	15	0	0	2024-06-27 20:50:04	2024-06-27 20:50:04	\N	\N	\N
45	42	dady	2	25	1	0	2024-06-28 04:32:52	2024-06-28 08:31:14	2024-06-28 08:31:14	\N	1719549335667e3d97ab898.jpeg
47	48	ani	1	22	4	5	2024-06-28 09:27:59	2024-06-28 09:27:59	\N	\N	\N
48	42	zain	1	25	4	7	2024-06-28 09:49:14	2024-06-28 09:49:14	\N	\N	\N
50	42	sooraj	1	30	1	0	2024-06-28 10:07:08	2024-06-28 10:07:08	\N	\N	\N
51	42	dev	1	30	1	0	2024-06-28 10:07:41	2024-06-28 10:07:41	\N	\N	\N
52	48	rtg	1	28	1	3	2024-06-28 10:42:34	2024-06-28 10:42:34	\N	\N	\N
46	60	Aliya	2	12	0	0	2024-06-28 05:50:55	2024-06-29 07:38:46	\N	Aliya	1719646726667fba0610076.jpg
57	72	shhs	2	22	4	7	2024-06-29 07:42:16	2024-06-29 07:46:10	\N	\N	1719647170667fbbc28561b.jpg
44	27	HAMID 002	2	25	1	4	2024-06-27 22:19:19	2024-06-29 18:08:56	2024-06-29 18:08:56	\N	\N
43	27	Hamid 001	1	25	1	4	2024-06-27 22:19:19	2024-06-29 18:09:01	2024-06-29 18:09:01	\N	\N
58	48	DAVID	1	50	1	4	2024-06-30 07:08:22	2024-06-30 07:08:22	\N	\N	\N
56	48	gggh	2	222	0	0	2024-06-29 01:48:36	2024-06-30 07:08:41	\N	\N	\N
55	48	gg	1	30	0	0	2024-06-29 01:48:36	2024-06-30 07:09:24	\N	\N	\N
59	78	Raza 1	1	12	\N	\N	2024-07-01 05:25:38	2024-07-01 05:25:38	\N	Raza 1	\N
60	84	Maria Anna	2	45	0	0	2024-07-01 07:12:14	2024-07-01 07:12:14	\N	\N	\N
61	84	Joseph Anna	1	50	0	0	2024-07-01 08:01:21	2024-07-01 08:01:21	\N	\N	\N
62	84	Jordan Anna	1	50	0	0	2024-07-01 08:02:32	2024-07-01 08:02:32	\N	\N	\N
63	84	Hany Anna	2	25	0	0	2024-07-01 08:02:32	2024-07-01 08:02:32	\N	\N	\N
64	89	Varun	1	55	0	0	2024-07-01 12:07:25	2024-07-01 12:07:25	\N	\N	\N
14	23	sooraj	1	30	1	4	2024-06-15 05:07:08	2024-07-01 15:10:43	\N	\N	17198466436682c6f3c1cb2.jpg
65	96	Celeena	2	22	0	0	2024-07-02 07:38:50	2024-07-02 07:38:50	\N	\N	\N
66	96	Chacko	1	55	0	0	2024-07-02 07:38:50	2024-07-02 07:38:50	\N	\N	\N
67	27	Patient Two	1	25	1	3	2024-07-02 08:24:43	2024-07-02 08:24:43	\N	\N	\N
68	96	Catherin	2	45	0	0	2024-07-02 08:35:16	2024-07-02 08:35:16	\N	\N	\N
69	96	Catherin	2	55	0	0	2024-07-02 13:09:41	2024-07-02 13:09:41	\N	\N	\N
70	99	cathrina	2	55	0	0	2024-07-02 13:10:35	2024-07-02 13:10:35	\N	\N	\N
74	103	Patient 2	1	25	0	0	2024-07-02 19:35:47	2024-07-02 19:36:02	2024-07-02 19:36:02	\N	\N
73	103	New Age	2	35	0	0	2024-07-02 17:55:44	2024-07-02 19:36:05	2024-07-02 19:36:05	\N	\N
72	103	Age 2	2	30	1	6	2024-07-02 17:54:57	2024-07-02 19:36:08	2024-07-02 19:36:08	\N	\N
71	103	AGE test	1	25	4	5	2024-07-02 17:54:57	2024-07-02 19:36:10	2024-07-02 19:36:10	\N	\N
75	103	Patient 001	1	25	1	3	2024-07-02 19:36:59	2024-07-02 19:36:59	\N	\N	\N
76	96	Joseph	1	55	0	0	2024-07-03 07:29:51	2024-07-03 07:29:51	\N	\N	\N
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2024_03_21_122103_add_indexes_to_tables	1
5	2024_03_25_044414_create_user_role_table	2
6	2024_03_25_044939_create_table_role-permissions	2
12	2022_08_11_065227_create_articles	3
13	2022_08_11_071259_create_faq	3
14	2022_08_14_152538_create_contact_us_settings	3
15	2022_08_14_154810_create_settings	4
16	2022_10_04_021553_create_profile_bios_table	4
17	2022_09_19_132546_create_help_table	5
22	2024_03_25_072719_create_products_table	6
23	2024_03_25_123647_alter_add_user_code_to_users	7
24	2022_07_22_072324_create_country_models_table	8
26	2024_03_26_064619_create_orders_table	9
28	2024_04_09_094109_create_qualifications_table	10
29	2024_04_11_042918_create_licence_types_table	11
30	2024_04_11_045117_create_special_intrests_table	12
31	2024_04_11_051647_create_languages_table	13
32	2024_04_11_053038_create_medical_conditions_table	14
33	2024_04_11_055604_create_insurence_policies_table	15
34	2024_04_11_082912_create_sub_insurence_policies_table	16
35	2024_04_09_091042_create_specialties_table	17
36	2024_04_12_062038_add_name_ar_to_country_table	17
37	2024_04_12_062540_create_emirates_table	17
38	2024_04_12_081710_create_areas_table	17
39	2024_04_12_083227_create_services_table	17
40	2024_04_12_090415_create_hospitals_table	17
41	2024_04_12_090625_alter_add_fields_to_users	17
42	2024_04_12_091144_create_hospital_specialities_table	17
43	2024_04_12_091347_create_hospital_locations_table	17
44	2024_04_12_091527_create_hospital_images_table	17
45	2024_04_12_091558_create_hospital_services_table	17
47	2024_04_12_104239_create_doctor_specialities_table	17
48	2024_04_12_104410_create_doctor_intrests_table	17
49	2024_04_13_054259_add_columns_to_hospitals_table	18
50	2024_04_13_093226_add_columns_to_hospital_specialities_table	18
51	2024_04_15_182519_add_fields_to_doctors_table	18
52	2024_05_08_063756_alter_add_country_id_to_emirates	18
53	2024_05_08_063846_alter_add_country_id_and_emirate_id_to_areas	18
54	2024_05_14_053557_alter_add_phone_fileds_to_hospitals	18
55	2024_05_23_031925_add_agent_user_details_table	18
56	2024_06_03_043651_create_doctors_availability_table	19
57	2024_06_03_053737_create_doctors_qualifications_table	19
58	2024_06_03_053754_create_doctors_language_spoken_table	19
59	2024_06_04_045341_create_temp_users_table	19
60	2024_06_04_070312_create_personal_access_tokens_table	19
61	2024_06_05_041357_create_doctor_holidays_table	19
62	2024_06_05_041507_create_doctors_temporary_unavailables_table	19
63	2024_06_05_063538_alter_add_fields_to_users	19
64	2024_06_05_081134_create_doctor_instant_appointment_table	19
65	2024_06_05_104759_create_members_table	19
66	2024_04_12_102945_create_doctors_table	20
67	2024_06_06_081747_create_doctor_patients_appointments_table	21
68	2024_06_06_150700_create_appointments_table	21
69	2024_06_08_112900_create_departments_table	21
70	2024_06_10_005326_add_department_id_to_doctors_table	21
71	2024_06_10_104835_add_fileds_to_patient_appointments_table	22
72	2024_06_13_070141_update_departments_table	23
73	2024_06_13_075021_create_department_hospital_table	23
74	2024_06_13_115510_create_doctor_reschedule_appointments_table	24
75	2024_06_13_121352_create_department_doctor_table	24
76	2024_06_14_112130_add_filed_to_patient_appointments_table	24
77	2024_06_15_113500_create_hospital_doctor_feedback	25
78	2024_06_15_113557_create_mydrworld_service_feedback	25
79	2024_06_15_141350_add_hospital_id_and_department_id_to_doctor_patient_appointments_table	26
80	2024_06_19_053322_add_full_name_ar_to_members_table	26
81	2024_06_19_063734_add_license_numbers_to_doctors_table	26
82	2024_06_19_104605_add_manager_details_to_department_hospital_table	27
83	2024_06_19_144317_create_hospital_insurance_policies_table	27
84	2024_06_11_000937_create_hospital_insurances_table	28
85	2024_06_14_111022_add_columns_to_department_hospital_table	29
86	2024_06_14_111340_add_soft_delete_to_department_hospital_table	29
87	2024_06_20_113930_create_callcenter_user_details	30
88	2024_06_25_100001_locations	31
89	2024_06_25_100331_latitude	31
90	2024_06_25_081957_alter_add_followup_details_to_doctor_patient_appointments	32
91	2024_06_25_094135_alter_add_reson_to_doctor_reschedule_appointments	32
92	2024_06_25_095722_alter_add_appointment_id_to_hospital_doctor_feedback	32
93	2024_06_26_050352_typeart	33
94	2024_06_26_055257_txt_location	33
95	2024_06_26_080043_add_followup_date_to_doctor_patient_appointments_table	34
96	2024_06_26_054444_alter_add_fields_to_settings	35
97	2024_06_26_101608_change_instant_appointment_date_to_date_in_doctor_instant_appointments_table	36
98	2024_06_26_115909_change_holiday_date_to_date_in_doctor_holidays_table	37
99	2024_06_26_110446_add_filed_to_doctors_table	38
100	2024_06_26_120317_add_filed_to_hospitals_table	38
101	2024_06_26_131658_add_filed_to_doctor_patient_appointments	38
102	2024_06_26_132009_add_type_to_hospitals_table	38
103	2024_06_27_043436_alter_add_instant_appoitment_number_to_settings	39
104	2024_06_27_121116_role_id	40
105	2024_06_27_121315_active_field	40
106	2024_06_28_040838_alter_add_user_image_to_members	41
107	2024_06_29_114345_user_email_otp	42
108	2024_06_29_120550_is_social_user	42
109	2024_06_29_132620_add_filed_to_agents_users_details_table	43
110	2024_07_01_085559_contact_us	43
111	2024_07_02_063257_create_country_of_origins_table	44
\.


--
-- Data for Name: mydrworld_service_feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mydrworld_service_feedback (id, user_id, rating, feeback_message, deleted_at, created_at, updated_at) FROM stdin;
1	60	4	test service feedback	\N	2024-07-01 08:14:42	2024-07-01 08:14:42
2	96	5	Very user friendly application	\N	2024-07-02 08:35:57	2024-07-02 08:35:57
3	22	3	rtyuuii	\N	2024-07-02 08:51:54	2024-07-02 08:51:54
4	69	1	sdfsdf	\N	2024-07-02 21:30:41	2024-07-02 21:30:41
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, ticket_number, user_id, product_id, drow_date, price, is_winner, product_type, created_at, updated_at) FROM stdin;
1	BLT-15656556	8	1	2024-03-26	100	0	daily	2024-03-26 12:24:06	2024-03-26 12:24:06
2	BLT-1565653	8	1	2024-03-26	100	0	monthly	2024-03-26 12:38:43	2024-03-26 12:38:43
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
1	App\\Models\\User	14	14sooraj sabu	78381a400e6467b9350cf8397c7e66c3002ef82ace1342c34981004d65437b3b	["*"]	\N	\N	2024-06-06 04:50:17	2024-06-06 04:50:17
2	App\\Models\\User	14	14sooraj sabu	df262694e184551446a001992fde608fe6969a70ecca0f114aae0163dfeb0595	["*"]	\N	\N	2024-06-06 04:51:05	2024-06-06 04:51:05
3	App\\Models\\User	19	19aja nanatest30@gmail.com	2ba9bdd5da3fae4b8c492ecfc5dec8ab30fb6e2a3f0b872ea5ac639f8d352e99	["*"]	\N	\N	2024-06-11 20:18:56	2024-06-11 20:18:56
4	App\\Models\\User	20	20abv baab	2348d822c78d5dc776d8836dbd7d688d9e331d9b07639269cf7696b8ac049b98	["*"]	\N	\N	2024-06-11 21:08:17	2024-06-11 21:08:17
5	App\\Models\\User	21	21na abvh	cadd6845d388fefe7a0ab8ea9600266d27aa4aea93049dd204b21b944c0e3b9d	["*"]	\N	\N	2024-06-11 21:13:57	2024-06-11 21:13:57
6	App\\Models\\User	19	19aja nanatest30@gmail.com	1a4ada9634b61aa5b49fd7e6949828b214ca005229d80e6d493654910f786fbf	["*"]	\N	\N	2024-06-11 21:17:47	2024-06-11 21:17:47
7	App\\Models\\User	19	19aja nanatest30@gmail.com	092c84ae245c6dd759939434ac0325cd93fdcd7e067e85e1431262f906c74a1d	["*"]	\N	\N	2024-06-11 22:00:44	2024-06-11 22:00:44
8	App\\Models\\User	22	22anil navis	33c5df90eb478a8239ea75eab06cfaec7a9d093fa368aa3470a19d6e23009dbc	["*"]	\N	\N	2024-06-12 02:37:22	2024-06-12 02:37:22
9	App\\Models\\User	23	23Hamid Razarazahamid34@gmail.com	6771137143629252e0bba40f1731f04d78e2863c0509ee3b0e03f85db0f4ef6b	["*"]	\N	\N	2024-06-13 06:07:22	2024-06-13 06:07:22
10	App\\Models\\User	23	23Hamid Razarazahamid34@gmail.com	8dbbafb24138280886375014eefe77c41bb85c1515a7070acd24737b46584e20	["*"]	\N	\N	2024-06-13 06:08:43	2024-06-13 06:08:43
11	App\\Models\\User	25	25Hamid Razarazahamd34@gmail.com	719db4040667a56d5ee8642dc96cd51780373c768a5f5500fd27a816c3a4acb1	["*"]	\N	\N	2024-06-14 03:45:22	2024-06-14 03:45:22
12	App\\Models\\User	23	23Hamid Razarazahamid34@gmail.com	dc2215cbeb9be0e06e0cd1640b36c3dd24d7e805ec68b7893efa44dc75a5c775	["*"]	\N	\N	2024-06-14 05:51:12	2024-06-14 05:51:12
13	App\\Models\\User	23	23Hamid Razarazahamid34@gmail.com	0d15e38c18360603ecc41f7b61d3a91d295336cf7d2f639995e3618bff6dd095	["*"]	\N	\N	2024-06-15 05:06:41	2024-06-15 05:06:41
14	App\\Models\\User	27	27Hamid Razarazahamid46@gmail.com	90751278254ba95aed32c36b9aaa7c6ac65ada4474200d14f810e44a7352fed6	["*"]	\N	\N	2024-06-15 22:42:51	2024-06-15 22:42:51
15	App\\Models\\User	28	28Hamid Razarazahamid349@gmail.com	0c7b20463bb514877704b17da6ec9f8b9fc4ac7d3664cb03ec1a6e5627f7c9ea	["*"]	\N	\N	2024-06-17 08:16:49	2024-06-17 08:16:49
16	App\\Models\\User	23	23Hamid Razarazahamid34@gmail.com	2a6c9d7d9d98889cd2a0a81c000536c0f39766983a9b7da2e2377a3dab3bc4a3	["*"]	\N	\N	2024-06-20 15:33:01	2024-06-20 15:33:01
17	App\\Models\\User	23	23Hamid Razarazahamid34@gmail.com	20a947c36bf23edd4b15c5165c53ab652500132729e3eb416b8553803039850a	["*"]	\N	\N	2024-06-21 11:20:49	2024-06-21 11:20:49
18	App\\Models\\User	34	34anil navis	a19767c5609cd4ecf6d87b74f50bdcbfcda157c46b60273041f115b340737f55	["*"]	\N	\N	2024-06-22 02:56:42	2024-06-22 02:56:42
19	App\\Models\\User	39	39sooraj sabusooraj@yopmail.com	82e89198fe83038e2d0d0d7bc60b3d77c141e3527adaa6029915fd456ec7d9be	["*"]	\N	\N	2024-06-25 11:08:27	2024-06-25 11:08:27
20	App\\Models\\User	23	23Hamid Razarazahamid34@gmail.com	ba900fe7890a307b249a84e20511dc7c7a6a86e6f05e8ac830bae733e7e9102a	["*"]	\N	\N	2024-06-25 15:31:01	2024-06-25 15:31:01
21	App\\Models\\User	41	41Hamid Razarazahamid334@gmail.com	c4db8c5cfb64fa42009e1f5a160eb3555d1f31118d109437f6c5a63d1bba6f2c	["*"]	\N	\N	2024-06-25 15:57:49	2024-06-25 15:57:49
22	App\\Models\\User	42	42test anctest71@gmail.com	ae522626bd3a9b9b1cdceee6330b3392e0b2b136593f159000671dfbf5403d36	["*"]	\N	\N	2024-06-26 07:27:18	2024-06-26 07:27:18
23	App\\Models\\User	43	43Hamid Razap1@gmail.com	b1b0418e08b55fea9e59d5977effb5152be9625a8dc378b4424011a60b4e84c7	["*"]	\N	\N	2024-06-26 08:17:36	2024-06-26 08:17:36
24	App\\Models\\User	44	44anil navis	c0560cc24cbbf3d377613b69492356b5289fa75d8a361c11c592c3da43487dad	["*"]	\N	\N	2024-06-26 10:07:29	2024-06-26 10:07:29
25	App\\Models\\User	23	23Hamid Razarazahamid34@gmail.com	60d4fe3e27a10e4a4fa2b79996659a49722d2f07a356996386fa3b969e33d96e	["*"]	\N	\N	2024-06-26 11:50:45	2024-06-26 11:50:45
26	App\\Models\\User	45	45Hamid Razarazahamid001@gmail.com	fbfcc6d44014dd4586dd7475be82bbf65d00d6f6f9a3083de26ccea45666d94b	["*"]	\N	\N	2024-06-26 18:07:23	2024-06-26 18:07:23
27	App\\Models\\User	27	27Hamid Razarazahamid46@gmail.com	8511ac1964432024f639d3c9a69c2ac404748c45a6416cfbd031847a59b5d0c2	["*"]	\N	\N	2024-06-26 18:09:13	2024-06-26 18:09:13
28	App\\Models\\User	27	27Hamid Razarazahamid46@gmail.com	3d830ca510a56c263df67121b2b3b010b31cfeeb0249e899d311700dd2d5b071	["*"]	\N	\N	2024-06-26 18:10:37	2024-06-26 18:10:37
29	App\\Models\\User	42	42test anctest71@gmail.com	61ba35ea73bd39d0f605a2fa973ae632aad2af107e5113a5e8b9e0373f6b4e39	["*"]	\N	\N	2024-06-26 21:22:20	2024-06-26 21:22:20
30	App\\Models\\User	46	46anil navis	96818df085126a8d796ad872d38bb3eca2dc2b23ebfc04444796c2b34e043b1a	["*"]	\N	\N	2024-06-27 03:50:36	2024-06-27 03:50:36
31	App\\Models\\User	47	47Sooraj Sabussss@yopmail.com	307676396f7747e63595837c209c29a93493b7c3402689d726c22b95f5c59f14	["*"]	\N	\N	2024-06-27 03:54:13	2024-06-27 03:54:13
32	App\\Models\\User	48	48Anil Navisfh@fgg.com	c4ca666274e19502e5840badd770bc6e2789df1a88114c9f966a1138d710b1ad	["*"]	\N	\N	2024-06-27 03:55:53	2024-06-27 03:55:53
33	App\\Models\\User	48	48Anil Navisfh@fgg.com	66d73d1ab415dc7195c8088fee477ffb69e08ba50a48fcd920c8d090381efd6f	["*"]	\N	\N	2024-06-27 05:31:25	2024-06-27 05:31:25
34	App\\Models\\User	49	49Asad Nazir	d660ef264f33fd44f332ac9fcf75ec589504ca4870afca94e230f6636d1f7eb3	["*"]	\N	\N	2024-06-27 08:52:18	2024-06-27 08:52:18
35	App\\Models\\User	50	50Hunain Devhunain88@gmail.com	aacae596fde9b3a144e2e9a947c1a4edc3109ed848650fade46ce75ac05c0b5d	["*"]	\N	\N	2024-06-27 08:55:45	2024-06-27 08:55:45
36	App\\Models\\User	49	49Asad Nazir	8d97d019076a4d048db9d0cdbc68bae4d54ab4b4bb0611b193411b5c1a0db391	["*"]	\N	\N	2024-06-27 09:20:23	2024-06-27 09:20:23
37	App\\Models\\User	42	42test anctest71@gmail.com	40a60dad47a95cc507137f31b8215a1a746994e61550f954e3af87d38c837cbb	["*"]	\N	\N	2024-06-27 15:18:06	2024-06-27 15:18:06
38	App\\Models\\User	42	42test anctest71@gmail.com	a0f4e7b4df62e890d86884e3a87c74b291c5ebed4a6350637bea9a25b3026bb9	["*"]	\N	\N	2024-06-27 17:54:15	2024-06-27 17:54:15
39	App\\Models\\User	60	60Test Onetest@gmail.com	014df908011c2babca4f0e7efe6801bfd352a313a065d566e0ba0152ae6b186c	["*"]	\N	\N	2024-06-27 20:45:09	2024-06-27 20:45:09
40	App\\Models\\User	27	27Hamid Razarazahamid46@gmail.com	33f60cb1d6cca66e7d527a910d4c565a1fdec06dbe906c5da7fd864ec93651dd	["*"]	\N	\N	2024-06-27 21:47:10	2024-06-27 21:47:10
41	App\\Models\\User	48	48Anil Navisfh@fgg.com	a6f952300ca6e9981bc58f259e2e640d1ab7c77cb65803f845ffc13bb2f660e4	["*"]	\N	\N	2024-06-28 05:20:36	2024-06-28 05:20:36
42	App\\Models\\User	64	64Anil Bb	c64cf240e382acdbd9918e0a56681fa0c32543c672a76b80f0e907e1bc9e045f	["*"]	\N	\N	2024-06-28 09:31:56	2024-06-28 09:31:56
43	App\\Models\\User	48	48Anil Navisfh@fgg.com	220113e33525158cd3a9921263405241f307ad2fbb2e936cc041e38403cbcd4c	["*"]	\N	\N	2024-06-28 10:08:32	2024-06-28 10:08:32
44	App\\Models\\User	48	48Anil Navisfh@fgg.com	3e1bfddeee95ef721c807f8021981a7cea76ac32ee87102ff0d7ab6fcc601a10	["*"]	\N	\N	2024-06-28 10:38:38	2024-06-28 10:38:38
45	App\\Models\\User	42	42test anctest71@gmail.com	b246f0b756eaf618d73333823c803139ed83215dd535ce3531798a5f27c8af8a	["*"]	\N	\N	2024-06-28 19:01:54	2024-06-28 19:01:54
46	App\\Models\\User	69	69moin testtest91@gmail.com	33dbb0f42c5a66ee6a39bb22ebd385fcd095a185a2dd1127d16d8d35944b096f	["*"]	\N	\N	2024-06-28 20:06:54	2024-06-28 20:06:54
47	App\\Models\\User	70	70Test Twotest2@gmail.com	ca41763fd3dc44e6d3aeed3004c152b335c2992bbb8d07a1b715f8a35e382be7	["*"]	\N	\N	2024-06-28 20:38:53	2024-06-28 20:38:53
48	App\\Models\\User	69	69moin testtest91@gmail.com	3718dd0903e46fe81287f3f241464084851e7a78c1ce154a591fb9f53c813196	["*"]	\N	\N	2024-06-28 20:38:59	2024-06-28 20:38:59
49	App\\Models\\User	60	60Test Onetest@gmail.com	fd0b7d5f8011f48b99b26344f21b7431dce4e78a2f42decf526ae080cc72d245	["*"]	\N	\N	2024-06-28 20:41:55	2024-06-28 20:41:55
50	App\\Models\\User	69	69moin testtest91@gmail.com	6547f3e44a9ab1429172ed755856ab4e7f546eae4176aa1713e3e1511daa00ab	["*"]	\N	\N	2024-06-28 20:45:49	2024-06-28 20:45:49
51	App\\Models\\User	42	42test anctest71@gmail.com	1024140dc6e68e8f4593f4a9a3058207a6aca4f0caf1ced25c05e8c899388d37	["*"]	\N	\N	2024-06-28 20:50:16	2024-06-28 20:50:16
52	App\\Models\\User	71	71Test Threetest3@gmail.com	9610da00a38e1e8f8076461979e24d0aaddd99b5a9a875cc449ffcfa9911de0b	["*"]	\N	\N	2024-06-28 20:50:49	2024-06-28 20:50:49
53	App\\Models\\User	60	60Test Onetest@gmail.com	74d38eacc2c132b909a6aaacd2dbc17c929e3d477f6d685ae137e7e46d921a53	["*"]	\N	\N	2024-06-28 20:58:36	2024-06-28 20:58:36
54	App\\Models\\User	48	48Anil Navisfh@fgg.com	10ba7f6d0238f6a6bcc1e11b6720e578253b0c091fb927529847ed0acd03a21d	["*"]	\N	\N	2024-06-29 01:39:36	2024-06-29 01:39:36
55	App\\Models\\User	72	72Davis john	ae7a1a337a38cb01fe21fdcb37977717138763592933ef10a690595ab523df58	["*"]	\N	\N	2024-06-29 01:51:21	2024-06-29 01:51:21
56	App\\Models\\User	73	73sooraj sabusooraj.a2solution2@gmail.com	fb16e47347da75fcc6d7552c6aec58cd92ebb4c9d5d321986c997e2f246fc78e	["*"]	\N	\N	2024-06-29 04:57:39	2024-06-29 04:57:39
57	App\\Models\\User	74	74abc tehstest101@gmail.com	d66982c188b55a48d9c9cbdb1129a3f934c224e3818054b0257859d0d601e786	["*"]	\N	\N	2024-06-29 06:11:01	2024-06-29 06:11:01
58	App\\Models\\User	48	48Anil Navisfh@fgg.com	2d847aeb533ecb6b40b3c86875fd61aa72bb6739be1ec23bf75689c93dc33e2e	["*"]	\N	\N	2024-06-29 07:53:52	2024-06-29 07:53:52
59	App\\Models\\User	48	48Anil Navisfh@fgg.com	f662082fe6d437ebcc9ebbe8d936078a3eff8af7b95d4366d10d817d979f3d87	["*"]	\N	\N	2024-06-30 06:53:09	2024-06-30 06:53:09
60	App\\Models\\User	83	83Albi Mariamdev	329cf0df2e589c286ea3b20afd19b3f0ad08f0e7ef3193548737ab75def1da1b	["*"]	\N	\N	2024-07-01 06:51:52	2024-07-01 06:51:52
61	App\\Models\\User	84	84Anna Mariadeva	bb64aa7bf6a911580c8262b5cbbd17cb89553456f0b88a93a52cb57841cbdebd	["*"]	\N	\N	2024-07-01 07:00:08	2024-07-01 07:00:08
62	App\\Models\\User	84	84Anna Mariadeva	825233db30ec6e990107d2c34525fa761739a36fd9b036e1d64ef6daa280e995	["*"]	\N	\N	2024-07-01 07:08:33	2024-07-01 07:08:33
63	App\\Models\\User	60	60Test Onetest@gmail.com	7f89e0d5da1d1542603925d2701d1920f5517af7c675a72e01205edf33152c31	["*"]	\N	\N	2024-07-01 08:33:52	2024-07-01 08:33:52
64	App\\Models\\User	85	85rusvin krusvinmerak@gmail.com	86a42b2859671ec4d132dd1a9841d47bd272e3eecdce269825a65a7ce11c16bd	["*"]	\N	\N	2024-07-01 09:22:33	2024-07-01 09:22:33
65	App\\Models\\User	84	84Anna Mariadeva	1a0a6ab92b10148a2b564bc0408a555ffb48fc340e65cd588ae183f22856e64f	["*"]	\N	\N	2024-07-01 10:24:04	2024-07-01 10:24:04
66	App\\Models\\User	84	84Anna Mariadeva	c769f4649ad84187c5608366fcbda4b3cde57db0c831d7fa9cfe9d7fa272ab40	["*"]	\N	\N	2024-07-01 11:16:43	2024-07-01 11:16:43
67	App\\Models\\User	88	88Aron Alwinaron@aron.com	d779a469a4fefb6817024e2044862b76d6a8c528f54118c531b757757fffcb1f	["*"]	\N	\N	2024-07-01 11:57:24	2024-07-01 11:57:24
68	App\\Models\\User	89	89Adhya Surya	c9ac0351916b390c1c96ea88c04ab8fff161bad03faf51e83e96aacd6c847ca7	["*"]	\N	\N	2024-07-01 12:06:26	2024-07-01 12:06:26
69	App\\Models\\User	84	84Anna Mariadeva	3847384d3fa99ab7620f8d21f7dbefbb7154bb89b19a023c9d003d97ed94e173	["*"]	\N	\N	2024-07-01 12:08:13	2024-07-01 12:08:13
70	App\\Models\\User	84	84Anna Mariadeva	dbce08d4a4fff08a3accf3f10d8108a5c690cf995c67a1e77d1b9dede61e6cb4	["*"]	\N	\N	2024-07-01 12:17:05	2024-07-01 12:17:05
71	App\\Models\\User	84	84Anna Mariadeva	a8de312db610a0656f3d61c99a29a14306e798020d372bea53d0096940b69f45	["*"]	\N	\N	2024-07-01 12:20:31	2024-07-01 12:20:31
72	App\\Models\\User	23	23Hamid Razarazahamid34@gmail.com	56bbb4eb20d1404e1b5f2ffe625a6aed768cedbf4977edb4430c4d8461b38609	["*"]	\N	\N	2024-07-01 12:29:52	2024-07-01 12:29:52
73	App\\Models\\User	84	84Anna Mariadeva	263c29e85960403125355498d28038a55be38f7ddea7a9f200fc3ceff13897a9	["*"]	\N	\N	2024-07-01 12:32:31	2024-07-01 12:32:31
74	App\\Models\\User	84	84Anna Mariadeva	5c43558b9e6e95bd1ffcfff5179195aa8485514fa862a20d8acc03fec3c2097e	["*"]	\N	\N	2024-07-01 14:17:42	2024-07-01 14:17:42
75	App\\Models\\User	84	84Anna Mariadeva	a36df1c82bda009a3d35fa0d4923865f935c5fe570a28f317e841eabde08163a	["*"]	\N	\N	2024-07-01 14:18:20	2024-07-01 14:18:20
76	App\\Models\\User	84	84Anna Mariadeva	e9b10def7e5f8ddad5ee6e23aee2625a64d7083006d3c7d7ba975f0458b70cfe	["*"]	\N	\N	2024-07-01 14:18:40	2024-07-01 14:18:40
77	App\\Models\\User	84	84Anna Mariadeva	64e1709c06130948631f7548b43729b541529ae1d78a46c1a7af5435e8debcbc	["*"]	\N	\N	2024-07-01 14:19:36	2024-07-01 14:19:36
78	App\\Models\\User	84	84Anna Mariadeva	13ec0f2a7f019f82ccf5b35e649124a699f281362eb5be32942b49dfa409d737	["*"]	\N	\N	2024-07-01 14:24:13	2024-07-01 14:24:13
79	App\\Models\\User	23	23Hamid Razarazahamid34@gmail.com	91ca987449a8102baf3d3ce24fad0d32b334d98fe8a46c535ff78f15be4c1ef6	["*"]	\N	\N	2024-07-01 15:00:18	2024-07-01 15:00:18
80	App\\Models\\User	23	23Hamid Razarazahamid34@gmail.com	a42d45bfa81135162a272c421ac13bb7289a58eb1771d8e030873ed94a4d659b	["*"]	\N	\N	2024-07-01 18:31:13	2024-07-01 18:31:13
81	App\\Models\\User	60	60Test Onetest@gmail.com	dc395c7c41e73fdf240a68aafe932a7e5b29ce35035255b4d5de37f9bd6ef390	["*"]	\N	\N	2024-07-01 19:44:08	2024-07-01 19:44:08
82	App\\Models\\User	27	27Hamid Razarazahamid46@gmail.com	284105cdf0e2fc14514c2d67a6ad2e2d2f4970b64f848120685bd6e312d2cb92	["*"]	\N	\N	2024-07-01 20:04:23	2024-07-01 20:04:23
83	App\\Models\\User	27	27Hamid Razarazahamid46@gmail.com	2cbf464efedd559a12d5848444becddb76b89395dfe0528e35db78ab0035ec36	["*"]	\N	\N	2024-07-01 20:33:33	2024-07-01 20:33:33
84	App\\Models\\User	90	90HAMID Razae@gmail.com	3f157a393e99adc943b0e70427ca18996a50beecc8e94629b79e1683629eb708	["*"]	\N	\N	2024-07-01 20:41:17	2024-07-01 20:41:17
85	App\\Models\\User	91	91test testtest27@gmail.com	a32d8f0bcd6406b885781250b1748d75a30321f3b6eaad8a585456ba588e1ee7	["*"]	\N	\N	2024-07-01 20:42:43	2024-07-01 20:42:43
86	App\\Models\\User	92	92rusvin krusvinmerak3@gmail.com	017c64949057af587e66be378196f0da1f01fa1ba53946b7ed7c91de4502ffd0	["*"]	\N	\N	2024-07-01 20:46:07	2024-07-01 20:46:07
87	App\\Models\\User	93	93rusvin krusvinmerak2@gmail.com	0d8f4a0eab7efcf2b347809dbee4e9d1e5add5c735888c102ecb0f5586ebcca1	["*"]	\N	\N	2024-07-01 20:46:28	2024-07-01 20:46:28
88	App\\Models\\User	90	90HAMID Razae@gmail.com	423bf2d9cf6a4c003f1dc1dbf65ee7b0fb50ac497712a6cd8fd75ab16900250c	["*"]	\N	\N	2024-07-01 20:54:12	2024-07-01 20:54:12
89	App\\Models\\User	90	90HAMID Razae@gmail.com	79578f3f4dad58980cb65e3223e748eaf24cb48c131ee5c9c7b2cce99a622667	["*"]	\N	\N	2024-07-01 20:54:45	2024-07-01 20:54:45
90	App\\Models\\User	48	48Anil Navisfh@fgg.com	aa51b02fd64c533badc6aa286a070a6223ed1b56df380379c52fecaffb9fb4d2	["*"]	\N	\N	2024-07-02 02:35:38	2024-07-02 02:35:38
91	App\\Models\\User	22	22anil navis	9afa4656177e3560af566516410d8e26fa85aacd180a5d6eba6ae33ad2a71ffe	["*"]	\N	\N	2024-07-02 04:35:43	2024-07-02 04:35:43
92	App\\Models\\User	95	95sooraj sabusooraj.a2s4olution2@gmail.com	d055e4b8db67805d0ec890622c74879221009d862371f0dbf1b068458ec9531e	["*"]	\N	\N	2024-07-02 05:43:28	2024-07-02 05:43:28
93	App\\Models\\User	23	23Hamid Razarazahamid34@gmail.com	c5fd99f71d561adc164de6abcc2c2e14a533a764f87b2b9ffb6b528193bbd6e9	["*"]	\N	\N	2024-07-02 06:20:27	2024-07-02 06:20:27
94	App\\Models\\User	96	96Angel Mariaangel@angel.com	fb1851c6adf8f37259b79035d200311844f0a7e132754bf7de8da84954da4473	["*"]	\N	\N	2024-07-02 07:06:36	2024-07-02 07:06:36
95	App\\Models\\User	96	96Angel Mariaangel@angel.com	d82b7d9c2ec8471715abfd06e31a8db80206240d337b099c5d4c03b77fd34da9	["*"]	\N	\N	2024-07-02 07:19:13	2024-07-02 07:19:13
96	App\\Models\\User	96	96Angel Mariaangel@angel.com	ba8d46ea0caaa5d55afe7d8fadae00dc7a03a335af1146990965ad9f3814bf49	["*"]	\N	\N	2024-07-02 07:20:43	2024-07-02 07:20:43
97	App\\Models\\User	60	60Test Onetest@gmail.com	bf0d835a8a3c34355587c3b3e565223f150ea5b918d204f9c42d9b72d6b95486	["*"]	\N	\N	2024-07-02 07:44:30	2024-07-02 07:44:30
98	App\\Models\\User	27	27Hamid Razarazahamid46@gmail.com	93f3e350e25831672586cdb592b96fc5391af72d5c20efd82697d8b34b66157e	["*"]	\N	\N	2024-07-02 08:21:38	2024-07-02 08:21:38
99	App\\Models\\User	96	96Angel Mariaangel@angel.com	f2d13b20307a41f6c308e3b3054263e06e8f23780b03f629142504e4ffdaf86e	["*"]	\N	\N	2024-07-02 09:48:59	2024-07-02 09:48:59
100	App\\Models\\User	85	85rusvin krusvinmerak@gmail.com	ae50f382c9a441c316a40589c1f67d612581a4620ae7390b45dfdc289e516161	["*"]	\N	\N	2024-07-02 09:50:55	2024-07-02 09:50:55
101	App\\Models\\User	27	27Hamid Razarazahamid46@gmail.com	8b05b946fa3abac20a9d5da82795c71464c9ca1d23a4c904de11ff03a09e4a96	["*"]	\N	\N	2024-07-02 10:30:24	2024-07-02 10:30:24
102	App\\Models\\User	27	27Hamid Razarazahamid46@gmail.com	ba866d0ea7d440aa778f0105dec10f2fde8b76e7245781f63ba83ec4a6b4f8f4	["*"]	\N	\N	2024-07-02 10:56:58	2024-07-02 10:56:58
103	App\\Models\\User	69	69moin testtest91@gmail.com	e18f6c12e4c30f53ae485d73a7e6dc0c81dcf497352aeb122c1dcdc46d42f8ff	["*"]	\N	\N	2024-07-02 11:45:15	2024-07-02 11:45:15
104	App\\Models\\User	69	69moin testtest91@gmail.com	3677ffa5dfaf9b5f9fd4568d50b27f7a4db1e19cac82d269ac768687ef6a5323	["*"]	\N	\N	2024-07-02 11:49:52	2024-07-02 11:49:52
105	App\\Models\\User	84	84Anna Mariadeva	9d61ce32f158c9d7550633d933d389d618111798e4e4495c2380b43b88bd56d8	["*"]	\N	\N	2024-07-02 12:22:01	2024-07-02 12:22:01
106	App\\Models\\User	84	84Anna Mariadeva	9dc9e93244094cc6c4e28f5e732f206861df9cecf6a4c8cc3826aaaa57d8a157	["*"]	\N	\N	2024-07-02 12:22:13	2024-07-02 12:22:13
107	App\\Models\\User	96	96Angel Mariaangel@angel.com	07fbd76df596a18b9865069ae1cd4c9c766f3009f1d02585e4f6b454b164f181	["*"]	\N	\N	2024-07-02 12:25:30	2024-07-02 12:25:30
108	App\\Models\\User	98	98rusvin khamid33@gmail.com	28410c64af4351a784537d4e768e4cc38626c50eb75c2f2de6eb48acc050f313	["*"]	\N	\N	2024-07-02 12:30:00	2024-07-02 12:30:00
109	App\\Models\\User	69	69moin testtest91@gmail.com	cb4d91186f6b536199e8bc0096e0d102ed426fa62348341a0033579512dad4a7	["*"]	\N	\N	2024-07-02 12:31:49	2024-07-02 12:31:49
110	App\\Models\\User	84	84Anna Mariadeva	3ea623d8746861a8ae5ce549fce5f107fe5b7f090635cabec0d8d8d12a97db9c	["*"]	\N	\N	2024-07-02 12:41:10	2024-07-02 12:41:10
111	App\\Models\\User	99	99Helen Alexanderhelen@helen.com	f62c7795837b5b349c1a2c261a71516aaae15a5dc3dba166f87a84add584f64d	["*"]	\N	\N	2024-07-02 12:47:37	2024-07-02 12:47:37
112	App\\Models\\User	96	96Angel Mariaangel@angel.com	7b4e169cd6e8ccf4fc2a3d53517fa5f0807756d3b15e929fa22004c2d80c0a9c	["*"]	\N	\N	2024-07-02 12:49:19	2024-07-02 12:49:19
113	App\\Models\\User	100	100rusvin krusvinmerak100@gmail.com	bb64343f0703f1a21c989af23925c93b4397bfeab3cc5cd0bb4223056daa0c16	["*"]	\N	\N	2024-07-02 13:18:34	2024-07-02 13:18:34
114	App\\Models\\User	101	101rusvin krusvinmerak101@gmail.com	81dabe96af1f1d0e0ff1a2a23e8e7cc710f38ebdf185d13b3907fcb9ac838250	["*"]	\N	\N	2024-07-02 13:21:06	2024-07-02 13:21:06
115	App\\Models\\User	102	102rusvin krusvinmerak102@gmail.com	bae86e78135eea94b0f07054c56e406ed5ec399aba17b0b47308968cdee6f849	["*"]	\N	\N	2024-07-02 13:24:17	2024-07-02 13:24:17
116	App\\Models\\User	99	99Helen Alexanderhelen@helen.com	76ecdadd7250ae0fc8b046d13815829af92fa4976186bd49a8c367aaec7d90de	["*"]	\N	\N	2024-07-02 13:37:37	2024-07-02 13:37:37
117	App\\Models\\User	23	23Hamid Razarazahamid34@gmail.com	bb3ab72d13dabaecba23ff6553e9aa3036ec237229df08ce35f4dc0caa9fcbd2	["*"]	\N	\N	2024-07-02 14:18:26	2024-07-02 14:18:26
118	App\\Models\\User	103	103Hamid Razafiverhamidraza@gmail.com	5c10cf2916333793c9100e32cf86c6a0f6cdedb1eaefb61b8981fb66c6411a2f	["*"]	\N	\N	2024-07-02 15:00:14	2024-07-02 15:00:14
119	App\\Models\\User	60	60Test Onetest@gmail.com	53732b16a12c2767e497d79fd585b82940e88a79b1faf7dafea43001de176f17	["*"]	\N	\N	2024-07-02 19:13:04	2024-07-02 19:13:04
120	App\\Models\\User	27	27Hamid Razarazahamid46@gmail.com	fea46975e9cabc036119bb3a2f0b8a7a3b56d3c7c94a9806b7d583f0aa9a5720	["*"]	\N	\N	2024-07-02 19:15:10	2024-07-02 19:15:10
121	App\\Models\\User	27	27Hamid Razarazahamid46@gmail.com	67b3788a0d0d37500af1129ce64dbbc41a95c58b63a645b2f677e74f16b2c2d1	["*"]	\N	\N	2024-07-02 19:16:42	2024-07-02 19:16:42
122	App\\Models\\User	84	84Anna Mariadeva	0d8f0707adb14720e6c6bc19e88f5ce02872b150e6dfb278501df88999e5d351	["*"]	\N	\N	2024-07-02 19:21:26	2024-07-02 19:21:26
123	App\\Models\\User	69	69moin testtest91@gmail.com	4f2f771b76ec6a9d2bc08bd79b15c2bf7197c0f350a7e5eb539dbb2a479a8e08	["*"]	\N	\N	2024-07-02 19:23:47	2024-07-02 19:23:47
124	App\\Models\\User	50	50Hunain Devhunain88@gmail.com	a6998eb13dcd116e3d8566dd14c0965a93348f4d06c4a9f0993869d358e17805	["*"]	\N	\N	2024-07-02 21:07:53	2024-07-02 21:07:53
125	App\\Models\\User	60	60Test Onetest@gmail.com	abe1c2041c5c9e8ee495aa9b6d22367d2ce7bb32a0ec6481cf052670c30fdedc	["*"]	\N	\N	2024-07-02 22:10:42	2024-07-02 22:10:42
126	App\\Models\\User	27	27Hamid Razarazahamid46@gmail.com	070415443586fea16d8befcfcfa5723ecc1e4e231df6f7a31f3b6d131c6bbda7	["*"]	\N	\N	2024-07-02 22:15:22	2024-07-02 22:15:22
127	App\\Models\\User	60	60Test Onetest@gmail.com	8677f451ac3fc010b12d5ea613f08c88012fd48bac0900ca48d5067e2ff73ce3	["*"]	\N	\N	2024-07-02 22:17:03	2024-07-02 22:17:03
128	App\\Models\\User	48	48Anil Navisfh@fgg.com	d9c726d4e3b94e38205542ee6e61eb4a5576e6c210f42f0ddfa8ae22be077d6e	["*"]	\N	\N	2024-07-03 02:34:31	2024-07-03 02:34:31
129	App\\Models\\User	96	96Angel Mariaangel@angel.com	eace435c94ed7173614acf32ef4b2d2c8b8b5bb69d611f890d62be46d344b423	["*"]	\N	\N	2024-07-03 05:25:04	2024-07-03 05:25:04
130	App\\Models\\User	96	96Angel Mariaangel@angel.com	4ff247bcaeeefd35c2a34232915ff0a3c755417daf3b577e7c57c977ffb608dd	["*"]	\N	\N	2024-07-03 07:28:35	2024-07-03 07:28:35
131	App\\Models\\User	96	96Angel Mariaangel@angel.com	64a107ee0493ed5e4ec09dce8fb04bd0523e7c40698b75cc1e73740d338852ac	["*"]	\N	\N	2024-07-03 07:40:01	2024-07-03 07:40:01
132	App\\Models\\User	96	96Angel Mariaangel@angel.com	35a03cbc683e2f191691f88905f8c9370dce57427ae20cf2ecede9720b0023b2	["*"]	\N	\N	2024-07-03 07:43:15	2024-07-03 07:43:15
133	App\\Models\\User	96	96Angel Mariaangel@angel.com	0169cab825e98a06ca4db21067870da374543f3043c06ac12057e5c46e861f6f	["*"]	\N	\N	2024-07-03 07:43:47	2024-07-03 07:43:47
134	App\\Models\\User	106	106test new	9871da8ca216147477ad410808c211b4780371e47e8f28ad2e68c50865832af2	["*"]	\N	\N	2024-07-03 08:39:21	2024-07-03 08:39:21
135	App\\Models\\User	107	107nas khannas@gmail.com	1460261d015d26bbe424bd8eeccc073765ff109fc291f126153958e5fb3114dc	["*"]	\N	\N	2024-07-03 08:45:40	2024-07-03 08:45:40
136	App\\Models\\User	96	96Angel Mariaangel@angel.com	e0ea7847d9249b2314fd52844ef06a1202a2b52c5219fa4fc9ab999bafa09f97	["*"]	\N	\N	2024-07-03 08:50:31	2024-07-03 08:50:31
137	App\\Models\\User	84	84Anna Mariadeva	e8d48b07c4c2c3b7fef6032d201f561385d099662dfe5cc8e96c2eb18fa7a485	["*"]	\N	\N	2024-07-03 08:51:24	2024-07-03 08:51:24
138	App\\Models\\User	48	48Anil Navisfh@fgg.com	37dc2fac11b66be5999ab23fc9e4b5aff6c170908bc06df07b87555024447d2b	["*"]	\N	\N	2024-07-03 09:01:37	2024-07-03 09:01:37
139	App\\Models\\User	85	85rusvin krusvinmerak@gmail.com	25bbf8b61cf6d63b653ad3ed4d85b12a3dea996610cf431c150653bfcbe1c7d9	["*"]	\N	\N	2024-07-03 09:23:39	2024-07-03 09:23:39
140	App\\Models\\User	84	84Anna Mariadeva	c880d725d938662c5f020a1357b820b541e56ab7718e5913a7eef32cc9d87aa2	["*"]	\N	\N	2024-07-03 10:46:00	2024-07-03 10:46:00
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, product_code, product_name, product_type, price, description, file_name, drow_date, drow_time, product_status, created_by, updated_by, deleted_at, created_at, updated_at) FROM stdin;
1	BL-66016927eebd3	Daily Luto	daily	100	desc	171136848766016927ef32e.jpg	1	23:37:00	1	1	1	\N	2024-03-25 12:08:07	2024-03-25 12:08:07
2	BL-66016951d091d	MOnthly Lut	monthly	500	desc	171136852966016951d122d.png	8	06:00:00	1	1	1	\N	2024-03-25 12:08:49	2024-03-25 12:08:49
\.


--
-- Data for Name: profile_bios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile_bios (id, value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: qualifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qualifications (id, title, title_ar, status, created_by, last_updated_by, created_at, updated_at, deleted_at) FROM stdin;
2	MBBS2	MBBS2	1	1	1	2024-04-09 10:27:05	2024-04-09 10:28:42	2024-04-09 10:28:42
4	MBBS	Phd	1	1	1	2024-04-11 10:37:37	2024-06-06 06:43:31	\N
3	MD	Pediatrics	1	1	1	2024-04-11 06:30:15	2024-06-06 06:43:48	\N
1	BDS	Ortho	1	1	1	2024-04-09 10:23:56	2024-06-06 06:44:04	\N
5	MDS	MDS	1	1	1	2024-06-06 06:44:22	2024-06-06 06:44:22	\N
\.


--
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_permissions (id, user_role_id_fk, module_key, permissions, created_at, updated_at) FROM stdin;
13	3	settings	["c","r","u","d"]	\N	\N
48	4	dashboard	["r"]	\N	\N
49	4	customers	["r","u","d"]	\N	\N
56	5	dashboard	["r"]	\N	\N
57	5	customers	["r"]	\N	\N
58	5	cms	["r"]	\N	\N
59	5	contact_detail_settings	["d"]	\N	\N
60	5	settings	["c","r","u","d"]	\N	\N
61	2	dashboard	["r"]	\N	\N
62	2	qualifications	["c","r","u","d"]	\N	\N
63	2	licencetype	["c","r","u","d"]	\N	\N
64	2	special_intrests	["r"]	\N	\N
65	2	cms	["c","r","u","d"]	\N	\N
66	2	faq	["c","r","u","d"]	\N	\N
67	2	contact_detail_settings	["c","r","u","d"]	\N	\N
68	2	settings	["c","r","u","d"]	\N	\N
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, role, status, is_admin_role, created_at, updated_at, deleted_at) FROM stdin;
1	Super Admin	1	1	2024-03-25 04:53:06	2024-03-25 04:53:06	\N
2	Sub Admins	1	1	2024-03-25 05:31:32	2024-03-25 05:31:49	\N
3	test	1	1	2024-03-25 05:31:59	2024-03-25 05:33:00	2024-03-25 05:33:00
4	tester	1	1	2024-04-09 06:46:52	2024-04-09 07:00:54	2024-04-09 07:00:54
5	asdadas	0	1	2024-04-09 07:01:20	2024-04-09 07:01:46	\N
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, title, title_ar, status, created_by, last_updated_by, created_at, updated_at, deleted_at) FROM stdin;
1	Ambulance Service	\N	1	1	1	2024-04-12 12:21:06	2024-04-12 12:21:06	\N
2	Clinical Laboratory Servicess	Clinical Laboratory Services	0	1	1	2024-06-28 09:45:53	2024-06-28 10:33:31	\N
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, created_at, updated_at, doctor_search_radius, instant_appoitment_number) FROM stdin;
1	\N	\N	50	971 50 50 00 000
\.


--
-- Data for Name: special_intrests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.special_intrests (id, title, title_ar, status, created_by, last_updated_by, created_at, updated_at, deleted_at) FROM stdin;
1	Ortho	ort	0	1	1	2024-04-11 05:14:56	2024-04-11 05:15:51	2024-04-11 05:15:51
2	Allergy	ChildAllergy	1	1	1	2024-04-11 05:15:43	2024-07-01 08:50:16	\N
3	Anemia	Anemia	1	1	1	2024-07-01 08:50:40	2024-07-01 08:50:40	\N
4	Headache	\N	1	1	1	2024-07-01 08:50:58	2024-07-01 08:50:58	\N
5	High blood pressure	High blood pressure	1	1	1	2024-07-01 08:51:36	2024-07-01 08:51:36	\N
\.


--
-- Data for Name: specialties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.specialties (id, name_en, name_ar, active, deleted_at, created_at, updated_at) FROM stdin;
1	Oncology	Oncology	1	\N	2024-06-06 06:44:52	2024-06-06 06:44:52
2	Dental	Dental	1	\N	2024-06-06 06:45:07	2024-06-06 06:45:07
\.


--
-- Data for Name: sub_insurence_policies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sub_insurence_policies (id, insurence_id, title, title_ar, status, created_by, last_updated_by, created_at, updated_at, deleted_at) FROM stdin;
2	3	Cardiac Care	Cariac Care	1	1	1	2024-04-11 08:56:45	2024-04-11 08:56:45	\N
3	1	AAFIYA APN	AAFIYA APN	1	1	1	2024-04-11 08:57:00	2024-06-17 17:17:33	\N
1	1	AAFIYA PREMIER	AAFIYA PREMIER	1	1	1	2024-04-11 08:55:00	2024-06-17 17:17:56	\N
4	1	AAFIYA GOLD DIAMOND ELITE NETWORK	AAFIYA GOLD DIAMOND ELITE NETWORK	1	1	1	2024-06-17 17:18:20	2024-06-17 17:18:20	\N
5	4	HIGH-GN	HIGH-GN	1	1	1	2024-06-17 17:19:10	2024-06-17 17:19:10	\N
6	4	HIGH-RNA	HIGH-RNA	1	1	1	2024-06-17 17:19:36	2024-06-17 17:19:36	\N
7	4	HIGH-SILVER-INS017	HIGH-SILVER-INS017	1	1	1	2024-06-17 17:19:58	2024-06-17 17:19:58	\N
\.


--
-- Data for Name: temp_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_users (id, user_image, first_name, last_name, gender, dob, email, dial_code, phone, whatsap_dial_code, whatsap_phone, insurence_id, sub_insurence_id, phone_otp, email_otp, created_at, updated_at) FROM stdin;
2	17180897916667f83fecf19.jpg	sooraj	sabu	1	2020-12-15		971	9847823756	971	9847823793	1	3	1111	1111	2024-06-11 07:09:51	2024-06-11 07:09:51
3	17180908066667fc36d9a11.jpg	abc	abs	1	2024-06-11	z.falak777@gmail.com	971	84848448848	971	84848448848	1	3	1111	1111	2024-06-11 07:26:46	2024-06-11 07:26:46
71	\N	test	new	1	2024-07-03		971	36178361783	971	36178361783	1	3	1111	1111	2024-07-03 08:38:40	2024-07-03 08:38:40
5	17181355526668ab00a5449.jpg	well	test	1	2024-06-12	test28@gmail.com	971	946464664646	971	946464664646	1	3	1111	1111	2024-06-11 19:52:32	2024-06-11 19:52:32
6	17181360426668aceab37c3.jpg	abc	test	1	2024-06-12	test29@gmail.com	971	105454313484	971	105454313484	1	3	1111	1111	2024-06-11 20:00:42	2024-06-11 20:00:42
14	1718346452666be2d4ce22c.jpg	Hamid	Raza	1	1996-01-12	razahamd324@gmail.com	971	9847823796	971	9847823799	1	3	1111	1111	2024-06-14 06:27:32	2024-06-14 06:27:32
27	1719378718667ba31ed6371.jpg	sunil	kumar	1	2024-06-26		971	52324316354	971	523243163	1	3	1111	1111	2024-06-26 05:11:58	2024-06-26 05:11:58
31	1719389844667bce94b43d7.jpg	Hamid	Raza	1	1970-01-01	p1@gmail.com	92	3111111111	92	3111111111	1	3	1111	1111	2024-06-26 08:17:24	2024-06-26 08:17:24
33	1719394463667be09f9904d.jpeg	sooraj	sabu	1	2020-12-15		971	98473823700	971	98437823790	0	0	1111	1111	2024-06-26 09:34:23	2024-06-26 09:34:23
36	\N	sooraj	sabu	1	\N	sooraj.a2solution2@gmail.com	971	98478243799	971	9847823799	1	3	1111	1111	2024-06-27 03:49:13	2024-06-27 03:49:13
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, dial_code, phone, phone_verified, password, email_verified_at, role, verified, user_type_id, first_name, last_name, user_image, user_phone_otp, remember_token, created_at, updated_at, deleted, role_id, active, user_code, created_by, last_updated_by, access_token, user_device_token, firebase_user_key, device_type, gender, dob, whatsap_dial_code, whatsap_phone, insurence_id, sub_insurence_id, user_email_otp, is_social) FROM stdin;
3	developer	developer@a2.com	\N	\N	0	$2y$12$.rs4b5JhZNF372Xi5OJkDe2VgmGjh2lwaOzHxQIg0KS2tmiS/fqce	\N	\N	0	\N	\N	\N	\N	\N	\N	2024-03-25 05:37:18	2024-03-25 05:37:18	0	0	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
4	subadmin	subadmin@gmail.com	\N	123455	0	$2y$12$5QhURKYgL9vqsNaSe4hRqOcdduFQ.95WqmjN/Y8b7HS75XSlWq53W	\N	1	1	\N	add	asda	\N	\N	\N	2024-03-25 05:45:09	2024-03-25 05:49:16	1	1	0	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
8	Sooraj Sabu	sooraj.a2solution@gmail.com	93	9847823799	0	$2y$12$w//jrBIM8SAliILyGTylgOAdIzL5h6GBnbAiamBIopgEkwfYDKvpa	\N	3	0	\N	Sooraj	Sabu	\N	\N	\N	2024-03-26 05:37:41	2024-03-26 05:37:41	0	0	1	BLC-66025f253f697	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
12	Sooraj Sabu	sooraj.a2solutions@gmail.com	358	9847823799	0	$2y$12$rHuzbjvzLMfN4p1KNUD83..sD23kBtIm3aeUq4FXwigu3tGKegBNu	\N	3	0	\N	Sooraj	Sabu	\N	\N	\N	2024-03-26 05:46:03	2024-03-26 05:46:03	0	0	1	BLC-6602611b19026	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
6	dev dev	developer@gmail.com	\N	\N	0	$2y$12$UR5BkkQQrGtgykjXde3bVe.3YZaMVR7UYwZFo2uvwyj.NQCPS4Rh6	\N	1	1	\N	dev	dev	\N	\N	\N	2024-03-25 05:53:05	2024-04-09 07:04:17	1	2	0	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
7	admin sub	adminsub@gmail.com	\N	\N	0	$2y$12$d3fiOttEff7UgNMU0Z9cFOsb7sFTBLRDzJBfdX2DRsAWXCdzjNNUu	\N	1	1	\N	admin	sub	\N	\N	\N	2024-04-11 06:41:52	2024-04-11 10:32:03	0	2	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
13	Abdul Wahab	abdulwahab22@gmail.com	92	6541235	0	$2y$12$FxAiWMhPI2oNUH47TCPsruUb9yNF5z.iIMv33BsVNG/IxDQEHbVHW	\N	2	0	3	\N	\N	1716533483665038eb1a300.png	\N	\N	2024-05-24 06:51:23	2024-05-24 06:51:23	0	0	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
20	abv baab		971	101101881818	1	$2y$12$hu0JxuX9rw7aQjzRj3AvauMPcUdF0bSqaTdytuC6emsoMUOriTIJS	\N	7	0	\N	abv	baab	17181400896668bcb97d036.jpg	\N	\N	2024-06-11 21:08:17	2024-06-11 22:00:44	0	0	1	\N	0	0	4|OesecWCoHqQatiQmRoy4fSyd7tbIZ3j01SLvppH96d4ff786		\N	iOS	1	2024-06-12	971	101101881818	1	3	\N	0
21	na abvh		971	48484848444	1	$2y$12$cWrxDV.zaWOCc86gkJ2m6OJRKcxOdj4pPbhLSJNr4Z4StRShwvnHa	\N	7	0	\N	na	abvh	17181404316668be0f30aa5.jpg	\N	\N	2024-06-11 21:13:56	2024-06-11 22:00:44	0	0	1	\N	0	0	5|wIB54eGWAlYrACdxFxhcfiEAZXK1yNVBXVApgPFo5b71a774		\N	iOS	1	2024-06-12	971	48484848444	1	3	\N	0
33	Mydoc Call center	callcenter@admin.com	971	3456789	0	$2y$12$ci27F8XF3ttLN.Op/jXhQuBaLTWum82LtgA0lZn24bWDnmk6Nc5eu	\N	4	0	4	\N	\N	17189525226675224a0893c.png	\N	\N	2024-06-21 06:48:43	2024-06-28 06:25:49	0	0	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
18	Cmh	testing@gmail.com	93	12345678	0	$2y$12$DKwZhuCBYIKzztTJWCORJetfvcfZFtSjLA9H3pqyRUVuuqyzAkKh.	\N	5	0	\N	\N	\N	\N	\N	\N	2024-06-07 03:54:30	2024-06-07 03:54:30	0	0	1	\N	1	1	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
23	Hamid Raza	razahamid34@gmail.com	971	9847823799	1	$2y$12$Goa7opPm1SEu/q8nZJwphOv2MVbkrvnsb1YtPwc6/dqy9L4RTAAWO	\N	7	0	\N	Hamid	Raza	1718258791666a8c67cb5fa.jpg	1111	\N	2024-06-13 06:07:22	2024-07-03 09:23:39	0	0	1	\N	0	0	117|flQm46uqR8mMarYygVwSJrBMoE2JhACteSKfeagaadfd1a1e		-O0m5VnIFkXHzZnVvLS0	ios	1	1996-01-12	971	9847823799	1	3	1111	0
31	Anil navis	anil@anil.com	971	235235252	0	$2y$12$wdibAzfjM8yYaQJBtgQf8ewnaHtKR5PPfNri9Ty2rqbOIVbziJZN6	\N	6	0	\N	Anil	navis	17199145446683d030baa4f.jpeg	\N	\N	2024-06-20 05:22:07	2024-07-03 10:07:17	0	0	1	\N	1	1	\N	\N	\N	\N	1	\N	\N	\N	0	0	\N	0
25	Hamid Raza	razahamd34@gmail.com	971	9847823797	1	$2y$12$CQsoslarb/0eRy0sMzbRYu.hCk/ntynXptp2jMQ4goIzaMF9gp9r2	\N	7	0	\N	Hamid	Raza	1718336631666bbc779ea04.jpg	\N	\N	2024-06-14 03:45:22	2024-06-14 03:45:22	0	0	1	\N	0	0	11|ouwxqO7E9b0sNK2KZsH4yK0LqQf6yegUgqGdSeLaafc599bd	fcm_token	\N	android	1	1996-01-12	971	9847823799	1	3	\N	0
14	sooraj sabu		971	9847823790	1	$2y$12$dtMeWQMGrxbK2QLejCWMb.eosTjUP9bCg0Oz8oizg6aFrfLKgpBXW	\N	7	0	\N	sooraj	sabu	171764940466613ffc85016.jpg	1111	\N	2024-06-06 04:50:17	2024-06-11 21:17:47	0	0	1	\N	0	0	2|BnfBNUNbFmomP2NqsdzuLSufTeNyuF6tG2Hb0by63010879d		\N	ios	1	2020-12-15	971	9847823793	1	3	\N	0
19	aja nana	test30@gmail.com	971	943431818118	1	$2y$12$5cSJer9Nb335Rm7dbXPn6uFRQS2fVgqG0ys.41ivMVh0NBVXYsn2y	\N	7	0	\N	aja	nana	17181370006668b0a8d6280.jpg	1111	\N	2024-06-11 20:18:56	2024-06-26 21:22:20	0	0	1	\N	0	0	7|9nziakixsogullvNaXoRxY4A8o5ylBJMI3URvMLd1c79182a		\N	iOS	1	2024-06-12	971	943431818118	1	3	\N	0
32	Anil Agent	agent@admin.com	971	3535352523	0	$2y$12$TX5taius1de1AdCDvrrN9eSX6.wo4mKIi/chVA0ZziEcYL8Y4B5Je	\N	3	0	3	\N	\N	171888151966740cefd6864.png	\N	\N	2024-06-20 11:05:20	2024-06-29 06:26:24	0	0	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
29	test	agent@yopmail.com	971	855424545	0	$2y$12$1cZm3SIPzpXak/p1uxYDHeJlcQcEQ9MqQYdAZBuJAEfcHTVCOpm6y	\N	2	0	3	\N	\N	1718771962667260fa32284.png	\N	\N	2024-06-19 04:39:25	2024-06-19 04:39:25	0	0	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
26	\N	jason@gmail.com	971	436363666	0	$2y$12$9MhitJzirz3oIcxSc7jUVuEIcBdlX2iGUwxInLop4uX1SJg04qF/S	\N	7	0	\N	Jason	Jacob	1718439437666d4e0d59211.jpg	\N	\N	2024-06-15 08:17:19	2024-06-15 08:17:19	0	0	1	\N	0	0	\N	\N	\N	\N	1	1971-06-09	971	34634636	1	3	\N	0
28	Hamid Raza	razahamid349@gmail.com	92	3441562555	1	$2y$12$mXjViBFHgS4eKG0v4m8MsO1l.26YHrbDYHZ9UVXstYrZ5d5E3ME.W	\N	7	0	\N	Hamid	Raza	1718612200666ff0e81001b.jpg	\N	\N	2024-06-17 08:16:49	2024-06-26 18:09:13	0	0	1	\N	0	0	15|wNDxSbWDC6cgNSJUvcONKLCU1yJ5Au4JZff6wx6n7a200f47		\N	ANDROID	1	2023-12-19	92	3441562555	4	6	\N	0
22	anil navis		971	523243163	1	$2y$12$Kb08ALyacRGdiQdz/Lg5GOXEyiXfoWacyqBBRAfU37PuMcLe6pAjC	\N	7	0	\N	anil	navis	1718159831666909d75f438.jpg	1111	\N	2024-06-12 02:37:22	2024-07-02 07:19:13	0	0	1	\N	0	0	91|o7EBIK77DZFgr6m9WT63yWVV1VfPd0RLJiICss5l106a7252		\N	ANDROID	1	1997-06-12	971	523243163	1	3	\N	0
15	Aster Medcity	aster@aster.com	971	352352523	0	$2y$12$mTH3vjHR7bhE06Qa6ytJou2JvAk2.m7Zfup5ISqzC81ZK5wFPHeL2	\N	5	0	\N	\N	\N	\N	\N	\N	2024-06-06 06:33:30	2024-06-26 09:21:04	0	0	1	\N	1	1	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
1	Admin	admin@admin.com	971	112233445566778899	0	$2y$12$e/UcM7IBEObEfuZVMB4HV.Gm3LdhvTbwkYzRXjz5/j6LoQ475rBgq	\N	1	1	1	\N	\N	\N	\N	\N	\N	2024-03-22 12:32:29	0	1	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
24	Al Jalila Children's Hospital	ranadxba@hotmail.com	971	12312312312	0	$2y$12$r9IC5/TdLiqF2rc6quwFBeuw5mO9LiQVJ4Bm374qNJfY.L5Ju2h.i	\N	5	0	\N	\N	\N	\N	\N	\N	2024-06-13 10:08:27	2024-06-26 09:21:27	0	0	1	\N	1	1	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
17	Ahmad	ahmaddxba@gmail.com	971	131231444	0	$2y$12$9Hco6u6GcstjpXP3iyCv2.FmYUr3OmCgSGcDFMIdA25MH7SICnRBq	\N	6	0	\N	Ahmad	dxba	\N	\N	\N	2024-06-06 11:45:14	2024-07-02 09:37:30	1	0	1	\N	1	1	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
35	Unni Moopan	anil@kgk.com	971	5795595778	0	$2y$12$pGK9BSA2SkzNlFohBrK.OuNtLb2Cb8lCIi.BiUx9QXUuFnFfPjyeO	\N	6	0	\N	Unni	Moopan	1719038211667671035397f.jfif	\N	\N	2024-06-22 06:36:52	2024-07-03 10:07:45	0	0	1	\N	1	1	\N	\N	\N	\N	1	\N	\N	\N	0	0	\N	0
16	Ammar	ammar@amar.com	971	6363463466	0	$2y$12$8QE74b/lHuQg.wxEa.GhR.I1c3TMPWlvzesd2MirUxpUt.YJ8CUWS	\N	6	0	\N	Ammar	Zain	\N	\N	\N	2024-06-06 06:48:23	2024-07-02 09:37:47	1	0	1	\N	1	1	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
55	Ananya Athul Muraleedharan	ananyananyaannn2@gmail	971	5655665565	0	$2y$12$pTyYsOdNPMu98AjyqnEGnO7.NLELRb/nmpWXx9xtrK7ACCX260yWy	\N	6	0	\N	Ananya	Athul Muraleedharan	1719494060667d65ac4b152.jpeg	\N	\N	2024-06-27 13:14:21	2024-07-03 10:09:08	0	0	1	\N	1	1	\N	\N	\N	\N	2	\N	\N	\N	0	0	\N	0
38	dev dev	dev@dev.com	\N	\N	0	$2y$12$e/UcM7IBEObEfuZVMB4HV.Gm3LdhvTbwkYzRXjz5/j6LoQ475rBgq	\N	1	1	\N	dev	dev	\N	\N	\N	2024-06-25 03:58:50	2024-06-25 03:58:49	0	2	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
37	fghdfhdfhdhdhhfhdhdh	rg2@dg.com	971	6777788	0	$2y$12$tCCNnUwaa9I5tIFOGEDgBOrZQwGeo5H0xUwXUtJYVAySLQURGNdbq	\N	6	0	\N	fghdfhdfhdhdh	hfhdhdh	17192115456679161940989.png	\N	\N	2024-06-24 06:45:45	2024-07-02 09:37:15	1	0	1	\N	1	1	\N	\N	\N	\N	1	\N	\N	\N	0	0	\N	0
30	Aster	info@aster.com	971	23423423424	0	$2y$12$NBPO5UxVcSE4P/OM.g5okO4wSmboM7xH4paQk9sKXgHfBp4phsorO	\N	5	0	\N	\N	\N	1719401855667bfd7f78fa1.jpg	\N	\N	2024-06-19 11:21:02	2024-06-26 11:37:35	0	0	1	\N	1	30	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
39	sooraj sabu	sooraj@yopmail.com	971	9847823700	1	$2y$12$TG2Zhc9VuYCOyZAbJzn2SOlPz3.nP.fkC8roHNhK03BR4ESO6wBla	\N	7	0	\N	sooraj	sabu	1719313692667aa51c2d3bc.jpeg	\N	\N	2024-06-25 11:08:27	2024-06-25 11:08:27	0	0	1	MYD-P-39	0	0	19|otLRh87DzhUhQ08mggDch0TGDxrjrHx1TJJfZlgDd3ca57ee	fcm_token	\N	android	1	2020-12-15	971	9847823790	1	4	\N	0
45	Hamid Raza	razahamid001@gmail.com	92	3441562558	1	$2y$12$TUL7dvd/N3vBBeJz6dHG1.JQqvY51aUxUu5c/AoMHkf27kacQ0W2y	\N	7	0	\N	Hamid	Raza	1719425232667c58d0c74e7.jpg	\N	\N	2024-06-26 18:07:23	2024-06-26 18:09:13	0	0	1	MYD-P-45	0	0	26|xXxryupxlJtH7dZ7CEDQQGYGD4vnc2SEK5VfhCkocb0ee9bd		\N	ANDROID	1	1996-06-26	92	3441562558	1	3	\N	0
41	Hamid Raza	razahamid334@gmail.com	92	3441562556	1	$2y$12$emgsEMAGTM3FOfd0TfgWQeG8lyq4n7Oyd4kiqAOIIvpZxN/aU61NK	\N	7	0	\N	Hamid	Raza	1719331062667ae8f636bdd.jpg	\N	\N	2024-06-25 15:57:49	2024-06-26 18:09:13	0	0	1	MYD-P-41	0	0	21|fFGbAP5dUu6J14OCTuMYW1bEPEhwCH7o3BOoD0b136a05ca5		\N	ANDROID	1	1970-01-01	92	3441562556	4	5	\N	0
43	Hamid Raza	p1@gmail.com	92	3111111111	1	$2y$12$472p5ahSwuznV1z1z7bu3eMW4/6.EJurvTR0jewav8znG.7PAiQHa	\N	7	0	\N	Hamid	Raza	1719389845667bce951ea7c.jpg	\N	\N	2024-06-26 08:17:36	2024-06-26 18:09:13	0	0	1	MYD-P-43	0	0	23|xCeOpr0H3tjoktUVbbB5bYwWho8AalfrQDttdy6L914aa8d4		\N	ANDROID	1	1970-01-01	92	3111111111	1	3	\N	0
36	Mohsin ans	dssdf@dsff.com	971	254565656	0	$2y$12$wXWsM2MBh37NYcyJ3TM1G.mPStPypOjkI1TxkIlholBSm6fHqUlWS	\N	6	0	\N	Mohsin	ans	171920966266790ebecf5ed.png	\N	\N	2024-06-24 06:14:24	2024-07-03 10:08:18	0	0	1	\N	1	1	\N	\N	\N	\N	2	\N	\N	\N	0	0	\N	0
51	\N	hiiiiii@gmail.com	971	mmmmkmmm	0	$2y$12$DqjalM6LHrMTxWo/3a1Rj.I0WHOMoFH7MjTp9PRD1fHfUo2GLvo2G	\N	7	0	\N	Aftab	Ali	1719482207667d375fa42cb.jpeg	\N	\N	2024-06-27 09:56:48	2024-06-27 12:01:04	1	0	1	\N	0	0	\N	\N	\N	\N	1	2024-02-20	971	dhuhduidiuiydiu	1	3	\N	0
53	\N	patient@gmail.com	971	1121212121	0	$2y$12$5Ko555lxsQhw2Cl1XUyZI./BefcQWDz.9Ap7AYHKfk69R57aBEMj6	\N	7	0	\N	Rusvin	K	\N	\N	\N	2024-06-27 12:06:21	2024-06-27 12:06:21	0	0	1	\N	0	0	\N	\N	\N	\N	1	2024-06-24	971	12121212121	1	3	\N	0
46	anil navis		971	225522552	1	$2y$12$otC26iggZJjj4bnpSdE8jOOehXwzooa.U4l147ZFyFjeBLSve1.yS	\N	7	0	\N	anil	navis	\N	\N	\N	2024-06-27 03:50:36	2024-06-27 05:31:25	0	0	1	MYD-P-46	0	0	30|E1l8jvq6jrUC7usOR4xARhkNDFS7BQUclv0bfbFBe01a77be		\N	iOS	1	\N	971	22552255	1	4	\N	0
59	Albin Alwin Alex Carletos	albin@g	971	556665667	0	$2y$12$WV8zJGEcYq1QnBXRqJlHj.SQC/M2V.0wTXPWjQbu6M0Mm9Mbjc2NS	\N	6	0	\N	Albin	Alwin Alex Carletos	1719497905667d74b1dc9a7.png	\N	\N	2024-06-27 14:18:27	2024-07-03 10:13:35	0	0	1	\N	1	1	\N	\N	\N	\N	1	\N	\N	\N	0	0	\N	0
34	anil navis		971	546484649	1	$2y$12$k2./b7yblSmI/WCYwPz.YeOkvgnyyH4eDqq4IcUbXc/4/NeHPgLYS	\N	7	0	\N	anil	navis	171902499666763d64d0636.jpg	\N	\N	2024-06-22 02:56:42	2024-06-26 21:22:20	0	0	1	\N	0	0	18|aNNhyOq6fmUm5l7kLRxksBFuEeyiuicqsi1h2q5m15abe053		\N	iOS	1	2024-06-22	971	546484649	1	4	\N	0
44	anil navis		971	4864684646	1	$2y$12$Vn5rbWTVswtUA5.KTde0nOkuSO41UGacSUyauMGd0mDFGqLPF.boC	\N	7	0	\N	anil	navis	\N	\N	\N	2024-06-26 10:07:29	2024-06-26 21:22:20	0	0	1	MYD-P-44	0	0	24|JFXBMTdvUPmwYgsZuLnqN9jJ0RaDWVnA2P1kf7E5e32bfb9a		\N	iOS	1	2024-06-26	971	4864684646	1	4	\N	0
47	Sooraj Sabu	ssss@yopmail.com	971	505086060	1	$2y$12$SN5Fmyc2iD3vbBPadxqt8OXMgviaw96scxHhU/UKMzJoyGzzaOfti	\N	7	0	\N	Sooraj	Sabu	\N	\N	\N	2024-06-27 03:54:13	2024-06-27 09:20:23	0	0	1	MYD-P-47	0	0	31|VfC0te4kQ5TumPUhAiXeR0UKiDwfBgpYCpykYRNnd33002bb		\N	ANDROID	3	1970-01-01	971	505086060	0	0	\N	0
40	Hospital	rusvinhospital@gmail.com	\N	56896	0	$2y$12$BIv72gGsK4HLrRU0hL9OT.A27LwdjAzC7460nFC6GKgvBRRtkD7fK	\N	5	0	\N	\N	\N	\N	\N	\N	2024-06-25 13:45:16	2024-07-03 03:11:29	0	0	1	\N	0	0	\N	\N	-O0qZqAx7QB5_gHvl5NE	\N	\N	\N	\N	\N	0	0	\N	0
58	Jupiter Clinic	jupjupjup@h	971	98989898	0	$2y$12$LaXDZOUJHqWxcmaKXqzraeo.zEaKkq1GFYUQU4OY2qUWApBwwDIZy	\N	8	0	\N	\N	\N	\N	\N	\N	2024-06-27 14:09:24	2024-06-28 05:17:10	0	0	1	\N	1	1	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
54	AniX Hospital	anix@gmail.com	971	889900887	0	$2y$12$qjKOcV7R1s1YoN4yOnoPk.mw2RJW5wIlUJAw.E2n3lKTwgPqM/EPS	\N	5	0	\N	\N	\N	17198411466682b17a6294c.png	\N	\N	2024-06-27 12:27:12	2024-07-02 05:06:23	0	0	1	\N	1	1	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
52	Joseph Clinic	info@joseph.com	971	456464677	0	$2y$12$BenyFyHQN/fhiIg0NA/jyeBf9A6GVvI9nKBPTQnVaFpAnCahJCuPO	\N	8	0	\N	\N	\N	1719487849667d4d69c2f2e.jpg	\N	\N	2024-06-27 11:23:04	2024-06-27 14:12:00	0	0	1	\N	1	1	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
50	Hunain Dev	hunain88@gmail.com	92	3095565455	1	$2y$12$WNCla.FcTAHowHi6of6KAe8fScKzKujOESUu2LglhC6o0VnjNnp1q	\N	7	0	\N	Hunain	Dev	1719478538667d290aa341a.jpg	1111	\N	2024-06-27 08:55:45	2024-07-03 05:25:04	0	0	1	MYD-P-50	0	0	124|uiteMRtpUTdLAs0EZsmXUe8s6jjDWHKWqK2e9MYvafdcbeb5		-O0pGcXpC8NWXdlYmWlR	ANDROID	1	1970-01-01	92	3095565455	4	5	\N	0
49	Asad Nazir		92	3441560319	1	$2y$12$.sd4fL7w3U6F5N4RwbQ2IOu1qhpfjIHRj0.cqFWzUyva.iq7kXZO6	\N	7	0	\N	Asad	Nazir	\N	1111	\N	2024-06-27 08:52:18	2024-06-27 21:47:10	0	0	1	MYD-P-49	0	0	36|IWey50HwnVUsbQMFIdm3BysZTwQAR8zTPKBY7tI1366eac1f		\N	ANDROID	1	1970-01-01	92	3441560319	1	3	\N	0
42	test anc	test71@gmail.com	971	123456789	1	$2y$12$C7x431LAfVerZ09YR7cF3O2rVtPcZf1m88natx4.DaZRI1UZ0fGDK	\N	7	0	\N	test	anc	1719386824667bc2c82ff2a.jpg	1111	\N	2024-06-26 07:27:18	2024-06-29 01:39:36	0	0	1	MYD-P-42	0	0	51|74gWAf10sXxPT6TSAlrRHxWqRwQ7mpuTwikLnjFy20b68c81		\N	iOS	1	2024-06-26	971	123456789	1	3	\N	0
57	Rohan Johan	jojojojjojo@m	971	5555555534	0	$2y$12$jT4gKuGiS4ocIIFkhA82HuQit/x2uMfHGA8AoJiH73dLuiQsez/Z2	\N	6	0	\N	Rohan	Johan	1719494728667d6848bd9c6.jpeg	\N	\N	2024-06-27 13:24:11	2024-07-03 10:10:29	0	0	1	\N	1	1	\N	\N	\N	\N	1	\N	\N	\N	0	0	\N	0
56	Anna Benny Alexander Carlitos	bennnnnnn@gm	971	555566786	0	$2y$12$SJ5G0PzzFnCwWnXYuSf5o.f0YNebvCjwc4OnWSv4id6I6j6enxBcm	\N	6	0	\N	Anna	Benny Alexander Carlitos	1719494510667d676e82ba1.jpeg	\N	\N	2024-06-27 13:21:51	2024-07-03 10:09:53	0	0	1	\N	1	1	\N	\N	\N	\N	2	\N	\N	\N	0	0	\N	0
62	Hello Call Center	helocal@g	971	3555555555555	0	$2y$12$GBrQxTSvCqiASwUz1GKf4eAKlGr0oWAyYJUzIsRdVX2dbCVQ7FQk2	\N	4	0	4	\N	\N	1719559386667e64da0d8c6.jpeg	\N	\N	2024-06-28 07:23:07	2024-06-28 07:23:07	0	0	0	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
63	Alex	al@g	971	bjknjfnvkfdhfkhkhfvjfdkhvdf	0	$2y$12$4QFipxf7KK65jk6U6gZAbuLZ0u5IdeBKekFCVWu43wmOEPv14Ddu.	\N	2	0	3	\N	\N	1719561130667e6baa267ad.jpeg	\N	\N	2024-06-28 07:52:11	2024-06-28 07:52:11	0	0	0	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
65	\N	dhyansns@gmail.com	971	1233333333	0	$2y$12$yH4kZK82y..iB7kPmJb0SOl2AJKZyb9auKSM2cAzrbMjwqJA3BT16	\N	7	0	\N	Dhyan	S	1719571373667e93ad67ab0.png	\N	\N	2024-06-28 10:42:54	2024-06-28 10:42:54	0	0	0	\N	0	0	\N	\N	\N	\N	1	2002-06-05	971	122333333	1	1	\N	0
71	Test Three	test3@gmail.com	92	3176640406	1	$2y$12$Fgfc7LCsHAPTE8IidmYU1OS79ImLrGvczQiePT6NLkf181BDKlHhG	\N	7	0	\N	Test	Three	\N	\N	\N	2024-06-28 20:50:49	2024-06-28 20:58:36	0	0	1	MYD-P-71	0	0	52|HGY6kvFNh5PrImk3iFcNwBGdoratp2seHTSNBWrb2f1a7159		\N	ANDROID	1	1970-01-01	92	3176640406	5	0	\N	0
83	Albi Mariam	dev	971	505566556	1	$2y$12$DgYnyyelcHAb4QCFzdq7KOiuu9Kd/50RcNB3ifgr9VSmKwxfE43u.	\N	7	0	\N	Albi	Mariam	1719816705668252014d9a9.jpg	\N	\N	2024-07-01 06:51:52	2024-07-01 07:08:33	0	0	1	MYD-P-83	0	0	60|quagAJCUzanqsdSkXGBW6PaOXzKRySu3VgbQzZafad49c818		\N	ANDROID	2	1994-12-03	971	505566556	0	0	\N	0
67	Diana Helex	dvika@ddd	971	500505656	0	$2y$12$y.y/QpiNWYGPx7wSOvg3wul4DixDmuAa08JGx1d8TzlUP6BHbuslu	\N	6	0	\N	Diana	Helex	1719584295667ec62737499.jpeg	\N	\N	2024-06-28 14:18:16	2024-07-03 10:12:35	0	0	1	\N	1	1	\N	\N	\N	\N	2	\N	\N	\N	0	0	\N	0
78	\N	raza@gmail.com	971	5656565656	0	$2y$12$scLoMIuxWRBFJ57gyz/dIu8C2QJFjT7eHaFoTcR8RGYhjKfei7rQW	\N	7	0	\N	Anwar	Raza	1719654637667fd8ede25e8.png	\N	\N	2024-06-29 09:50:38	2024-06-29 09:50:38	0	0	0	\N	0	0	\N	\N	\N	\N	1	2012-06-07	971	5656565656	1	1	\N	0
79	K N S Hospital	kn@gmail.co	971	322343254254	0	$2y$12$7IMlWX1wpxnHNwhz7ksBxerCmEDn4QYDeCGCSp/aMhcUwvsYEDER6	\N	5	0	\N	\N	\N	\N	\N	\N	2024-06-29 12:10:49	2024-07-02 05:09:02	0	0	1	\N	0	1	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
73	sooraj sabu	sooraj.a2solution2@gmail.com	971	80854556	1	$2y$12$zAKPwkdIhgw9Rigj7l0jBOpRJgfdCP.WJbk3VG0JpYudoTgjxfuT.	\N	7	0	\N	sooraj	sabu	\N	\N	\N	2024-06-29 04:57:39	2024-06-29 04:57:39	0	0	1	MYD-P-73	0	0	56|1uBVrYhobrDNiSVrTk8LXF60Og9idU3HPSPIsEHc04844b2e	fcm_token	\N	android	1	2020-12-15	971	9847823799	1	3	\N	0
64	Anil Bb		971	523243166	1	$2y$12$py.m8vJ7kh4S0KfQXSgNoOtmNnYWDiU1.DWJ/To8/nbV2CVozoHje	\N	7	0	\N	Anil	Bb	\N	\N	\N	2024-06-28 09:31:56	2024-06-28 20:41:55	0	0	1	MYD-P-64	0	0	42|F52hHjZ2vnTZTilpINYZv7O71c1PNLP39zdP5WAG2463c781		\N	ANDROID	1	1970-01-01	971	523243166	1	4	\N	0
70	Test Two	test2@gmail.com	92	3176640405	1	$2y$12$CEVahVmJAx3m5JP/y3N93.3rXVPz8wY9payNDPMUxK1Gf6KHRuxLa	\N	7	0	\N	Test	Two	\N	\N	\N	2024-06-28 20:38:53	2024-06-28 20:41:55	0	0	1	MYD-P-70	0	0	47|HorWcxTI8ulLj0WcwgcO1kxS7z3lD8iEnwMFGOYK768adf76		\N	ANDROID	2	1970-01-01	92	3176640405	1	3	\N	0
87	Lourde Matha Hospital	lourde@lourde.com	971	888888888888	0	$2y$12$fz6WLp0nR9HbxXkmZTqpAuGYY2rRnhRu7z5kHIKL9iTKvJuNBFqX2	\N	5	0	\N	\N	\N	\N	\N	\N	2024-07-01 11:44:29	2024-07-03 10:18:48	0	0	1	\N	0	1	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
86	Vikram Sarjah	vikram@vikram.com	971	554433445	0	$2y$12$mzMQm9ZaeKoZxssw1NzNRObgOnde2PVUpiEkmyxxbjn/8jevTI21G	\N	6	0	\N	Vikram	Sarjah	171983227666828ed4d12b9.jpeg	\N	\N	2024-07-01 11:11:17	2024-07-03 10:11:33	0	0	1	\N	1	1	\N	\N	\N	\N	1	\N	\N	\N	0	0	\N	0
85	rusvin k	rusvinmerak@gmail.com	971	7034526952	1	$2y$12$Y5yKtqOL7dn.0Rv.5bUpxunizkGzzOmt0HKlvKjejLvwOdcWRI1Xq	\N	7	0	\N	rusvin	k	1719825837668275ade59fd.jpg	1111	\N	2024-07-01 09:22:33	2024-07-03 09:23:57	0	0	1	MYD-P-85	0	0	139|984FQQKNvFyYsmuUxvDG1s6upiOQRMLLednEbKiae316cc83		-O0mqfqmRsjq3ZjWxRog	ios	1	2020-12-15	971	9847823799	1	3	1111	0
76	Aby Humanity	abi@gm	971	500000000000	0	$2y$12$ERkLeCHv0doNCKc7w7krB.aPkEkJQL45k8ilftoLYhlx2o1LDk2EO	\N	3	0	3	\N	\N	1719645448667fb508d7c57.jpeg	\N	\N	2024-06-29 07:17:31	2024-06-29 07:27:50	0	0	0	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
66	Lourde Hospital	l@c	971	878685959595	0	$2y$12$4fY0co0f57KpFZXHTEv0AOp.USGT0JMJZYmY3xybbN7Flk9A.nRl6	\N	5	0	\N	\N	\N	\N	\N	\N	2024-06-28 13:55:28	2024-07-02 05:08:15	0	0	1	\N	1	1	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
75	Humanity	hum@hmm	971	50011555556	0	$2y$12$2P15dN0B9MUb5WZA9UUzruD0HHfAWsvUj3q0C5R3xYwi4D5z3Z6Sm	\N	4	0	4	\N	\N	1719645255667fb44735351.jpg	\N	\N	2024-06-29 07:14:16	2024-06-29 12:32:51	0	0	0	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
80	Huaei	h@gmail.com	971	505555555	0	$2y$12$z3kAZis8tz8WdlZTK616FuGNSGx/TfneGStAMHfg92ZOXsJonwbUi	\N	4	0	4	\N	\N	\N	\N	\N	2024-06-29 12:36:32	2024-06-29 12:36:32	0	0	0	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
81	Geelio	geel@gmail.com	971	5055555550	0	$2y$12$7D6fWDTtIYrx.Sf9M25sI.ve1FEhY6ymk3Ia4fpEGWGFzQL7ggjFK	\N	4	0	4	\N	\N	\N	\N	\N	2024-06-29 12:39:41	2024-06-29 12:39:41	0	0	0	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
82	Amstor Hospital	h@g	971		0	$2y$12$7kuNPR8aboYRr6oTMbCLbeffUoU6MydBiJRyHOHNuPzoNoj3sWzuq	\N	5	0	\N	\N	\N	\N	\N	\N	2024-07-01 05:44:06	2024-07-02 05:09:51	0	0	1	\N	1	1	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
60	Test One	test@gmail.com	92	3176640404	1	$2y$12$r04.zJYB2tBsICq8MpfVVeNbB3JxVL4vmj.RxlUECZscBl8nGTJOC	\N	7	0	\N	Test	One	\N	1111	\N	2024-06-27 20:45:09	2024-07-02 22:17:03	0	0	1	MYD-P-60	0	0	127|TQ9Rg65Zvnktrb9HrdfV80vNVc8qYzFZkAyyHEoY5ada588c	abdhjef ekef kjwf wedfw	-O0mOk2WED6BBqjGaGIo	iOS	1	1970-01-01	92	3176640404	1	1	\N	0
69	moin test	test91@gmail.com	971	1234567890	1	$2y$12$cyk3ycUe.TRxrq46maVSkuebm.YVAvwU60K3Sqtf9bBZRS.4JWhpq	\N	7	0	\N	moin	test	\N	1111	\N	2024-06-28 20:06:54	2024-07-02 22:10:42	0	0	1	MYD-P-69	0	0	123|JudtCRVq5WoKFTpEy2PKrV5eNRtQHsNYDbM2h5ku3b0ba30e		-O0nFqWATfWQGVklY4Cy	iOS	1	2024-06-29	971	1234567890	5	0	\N	0
72	Davis john		971	564005096	1	$2y$12$G1wtwRqGxbVdweyTZdL/sOJ01hnLa9yfB8a9FNi1VzcvY/7li888C	\N	7	0	\N	Davis	john	1719625863667f68871e915.jpg	\N	\N	2024-06-29 01:51:21	2024-07-01 19:44:08	0	0	1	MYD-P-72	0	0	55|CjHHkMskz52QJCmSujsmN9OsbgOXIM78kV4MfQh5ea88f39c		\N	iOS	0	\N	971	564005096	5	0	\N	0
77	Albi	albi@gmc	971	505050505	0	$2y$12$Wc0Z.sj9A864sk91dqh02eWCukVm91ybsMbUDNr8pRbag6FlDrRyS	\N	3	0	3	\N	\N	1719648260667fc0044bfbd.jpg	\N	\N	2024-06-29 08:04:21	2024-07-02 06:05:07	0	0	0	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
68	Alex K	dvgika@ddd	971	50555555555	0	$2y$12$YFUJAPQUyTcjH69Ew8Qcme1vPlyWjCP6lHQQ2oOY7FNs08Kn6o40W	\N	6	0	\N	Alex	K	1719584398667ec68e7e19a.png	\N	\N	2024-06-28 14:20:00	2024-07-03 10:12:00	0	0	1	\N	1	1	\N	\N	\N	\N	1	\N	\N	\N	0	0	\N	0
61	Dr.Fousiya Bheegam	foufou@gmail.com	971	50555555555	0	$2y$12$AM/6GYMvFLun4sTdTEhIBeokQG5zyTPtayBH/jcwupXNQE2ObbcUa	\N	6	0	\N	Dr.Fousiya	Bheegam	1719554947667e5383539fd.jpeg	\N	\N	2024-06-28 06:09:11	2024-07-03 10:25:07	0	0	1	\N	1	1	\N	\N	\N	\N	2	\N	\N	\N	0	0	\N	0
88	Aron Alwin	aron@aron.com	971	552233445	1	$2y$12$LneN6wztGfxHeQ8JbdvVA.c9gpzFHGK1mdsOuq11txV3umxH46rpi	\N	7	0	\N	Aron	Alwin	1719835027668299934ae0f.jpg	\N	\N	2024-07-01 11:57:24	2024-07-01 12:08:13	0	0	1	MYD-P-88	0	0	67|4kkf2Vor2VasGqWyns9A41aLsTYEf5WnT79mquF661409e00		\N	ANDROID	1	2007-12-11	971	552233445	0	0	\N	0
89	Adhya Surya		971	557788787	1	$2y$12$Jpeo7woKchUIENvr2SykceIB/2aKxtV6F0axGAm2REdlBV7fzcOEq	\N	7	0	\N	Adhya	Surya	171983557966829bbb9c9a4.jpg	\N	\N	2024-07-01 12:06:26	2024-07-01 12:08:13	0	0	1	MYD-P-89	0	0	68|UrNLiGuXW1qfCKh0y4AvdpH0nXP27rjxe3tXt3cu926fef9f		\N	ANDROID	2	2008-12-01	971	557788777	0	0	\N	0
74	abc tehs	test101@gmail.com	971	1234567891	1	$2y$12$.HutycC0fZ.OGrVljXy3wuFd01B05IG4NqkZBMgSasnJSZX9D/gFy	\N	7	0	\N	abc	tehs	\N	\N	\N	2024-06-29 06:11:01	2024-07-01 19:44:08	0	0	1	MYD-P-74	0	0	57|RgJTeetj8y4hWPRqORRoikJohBJNLKXxCfY5mXCY5db0f8d6		\N	iOS	1	2024-06-29	971	1234567891	1	0	\N	0
91	test test	test27@gmail.com	971	494949494949	1	$2y$12$PC.lr.G5xELxqS4mfw4SIekLI41vpUgwdC9llK0nx.TDb02SdK3Dm	\N	7	0	\N	test	test	17181351156668a94b80ce0.jpg	\N	\N	2024-07-01 20:42:43	2024-07-01 20:42:43	0	0	1	MYD-P-91	0	0	85|wnaeNLJIFelY08MbXdvEhVMyKU2nA5AY6NAZq9BK8311048b	fcm_token	\N	android	1	2024-06-12	971	494949494949	1	3	\N	0
92	rusvin k	rusvinmerak3@gmail.com	971	7034526954	1	$2y$12$25nLWz4IRpxTNb2ZWDjl6OpvnLsmjh48qIn3iAOjmuYgw9yAkx.wm	\N	7	0	\N	rusvin	k	\N	\N	\N	2024-07-01 20:46:06	2024-07-01 20:46:07	0	0	1	MYD-P-92	0	0	86|UrKHQBnLx4ndxiqxfeLQbhodbZ6yEPS8KsWieCho8d3d54db	fcm_token	\N	android	1	2020-12-15	971	9847823799	1	3	\N	0
93	rusvin k	rusvinmerak2@gmail.com	971	7034526953	1	$2y$12$kabM.qEnFRt8QYq8vPk7w.LJTaMa2uCosgoucT1RDyP8FLFtA1nHq	\N	7	0	\N	rusvin	k	\N	\N	\N	2024-07-01 20:46:28	2024-07-01 20:46:28	0	0	1	MYD-P-93	0	0	87|2DS0Qs3G6uU7SoXipqu5zGldTBFIdpngsYv8JJz511ac725c	fcm_token	\N	android	1	2020-12-15	971	9847823799	1	3	\N	0
27	Hamid Raza	razahamid46@gmail.com	92	3441562554	1	$2y$12$EpgqNma9.8n5vtxVZx/GO.J.FDXkwzYpQgD6.MJWH3bwqeZDk4PL.	\N	7	0	\N	Hamid	Raza	1718491357666e18dd9cdf7.jpg	1111	\N	2024-06-15 22:42:51	2024-07-02 22:17:03	0	0	1	\N	0	0	126|VlusYzWs2o3cIAGhKDZCdqasjXUuUkibgFGwIvH91935e478		-O0mXEtY65THsYf5xdsj	iOS	1	1970-01-01	92	3441562554	1	1	\N	0
101	rusvin k	rusvinmerak101@gmail.com	971	7034526956	1	$2y$12$PMufGaukfCaCCX5Xr49/iuPOHmAlq2klHKoAWoopufRDLsN55GCSu	\N	7	0	\N	rusvin	k	\N	\N	\N	2024-07-02 13:21:06	2024-07-02 13:23:34	0	0	1	MYD-P-101	0	0	114|NuI8C5oPbaZzh5L3Rm1VYbqXPhzTfbh5S4RkYKhg286c6bea	21sdrerer	-O0namjJHnID_dxYxCbp	android	1	2020-12-15	971	9847823715	3	1	\N	1
90	HAMID Raza	e@gmail.com	92	3441562551	1	$2y$12$bBwfm9.uGp6m5n5b1cdv8uKsfGjMG7.1zCGNvMH/3yR3FFkleOIAy	\N	7	0	\N	HAMID	Raza	1719866471668314679e63f.jpg	\N	\N	2024-07-01 20:41:17	2024-07-02 04:35:43	0	0	1	MYD-P-90	0	0	89|wclkx0mTjFho6KLAm4g5RuVgvFxs2fhlXnTR9Atvcda80d54		\N	ANDROID	1	1970-01-01	92	3441562551	5	0	1111	0
95	sooraj sabu	sooraj.a2s4olution2@gmail.com	971	808545564	1	$2y$12$K6XbJCMVzZOdOvbtzsOADuu/Qipd/kxPNxnQ4qM.lK4XhYMZo8NJW	\N	7	0	\N	sooraj	sabu	\N	\N	\N	2024-07-02 05:43:28	2024-07-02 05:43:28	0	0	1	MYD-P-95	0	0	92|vstJ41voKtARDGM55Ej64N76QFpypx3KRyjaqYjj401f1054	fcm_token	\N	android	1	2020-12-15	971	98478237994	1	3	\N	0
103	Hamid Raza	fiverhamidraza@gmail.com	92	3441562552	1	$2y$12$bdHRn6vfSlv434yP2T4xA.eeHKs2inqC5cOuBcwrFI.kDCe.XnUWa	\N	7	0	\N	Hamid	Raza	171993055466840eba9fa4d.jpg	\N	\N	2024-07-02 15:00:14	2024-07-03 10:19:05	0	0	1	MYD-P-103	0	0	118|fznb04TjQ32cvpyU17t82cD6a30aypdSHLCNhLmibc0b664c	token	-O0nxTgePT2-76mi4Vx8	ANDROID	1	2024-07-01	92	3441562552	0	1	\N	1
94	Telecom	telecom@telecom.com	971	555555356	0	$2y$12$Tb0dLjrQ4OhURXYGDlgSWeGn5k/WEzAv8jM9/N6znaDhKWu4CP5wS	\N	4	0	4	\N	\N	1719900579668399a3945c9.png	\N	\N	2024-07-02 05:05:34	2024-07-02 06:09:39	0	0	0	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	0
98	rusvin k	hamid33@gmail.com	971	70345269734	1	$2y$12$NsHRuMl4/x.N1HcE/FAj1eBmmquomh4EmIP4staZO3hJybS6wOZy2	\N	7	0	\N	rusvin	k	\N	\N	\N	2024-07-02 12:30:00	2024-07-02 12:30:23	0	0	1	MYD-P-98	0	0	108|iiZ2Wet02x9St2rV1WWNB2gBljWVF28swnCq83fC620c706d	{{fcm_token}}	-O0nQ5EQ2z76X4s5AXuN	android	1	2020-12-15	971	9847823714	3	1	\N	1
100	rusvin k	rusvinmerak100@gmail.com	971	7034526955	1	$2y$12$CgppRhah2MleqUm1xvyWEOK7JXRGi.bDfb3inid8Bl4WchP0Rppy.	\N	7	0	\N	rusvin	k	\N	\N	\N	2024-07-02 13:18:34	2024-07-02 13:18:36	0	0	1	MYD-P-100	0	0	113|KhkSqI2DuZ0AFAhYepbF7snjhcZP5sRX0bZ1fipMe2e0c43a	fcm_token	-O0naCtJDsZa8KB2rfM7	android	1	2020-12-15	971	9847823715	3	1	\N	1
96	Angel Maria	angel@angel.com	971	554466779	1	$2y$12$rpF3YWmFxa74bFJ/bI2X9e7fXBrBVHaJyKKPOfj6./oATkC4iV0Lu	\N	7	0	\N	Angel	Maria	17199039906683a6f6b59a3.jpg	\N	\N	2024-07-02 07:06:36	2024-07-03 08:50:31	0	0	1	MYD-P-96	0	0	136|7dRsftPvTGinACN7bDL6aohkjDTc0qFLk0a2h4FUe7f67363	asd	-O0mG3mkWakmbcJtVS0N	ANDROID	2	1994-12-01	971	554466779	0	0	1111	0
107	nas khan	nas@gmail.com	971	12345678	1	$2y$12$QYagI4rveIRn94DiaHnWBueUdmez7royrJ/JHYJn.VXJJERA72Cn6	\N	7	0	\N	nas	khan	\N	\N	\N	2024-07-03 08:45:40	2024-07-03 10:19:10	0	0	1	MYD-P-107	0	0	135|T8OWvjnICejPqtizMwbxNtmEcyNuCE8PW5hjBVA46b948088		-O0rlKc_vQUPKlfvAZVX	iOS	1	2013-07-01	971	12345678	1	4	\N	0
97	Sathya Alex Kavumpadickal	sathya@sathya.com	971	554455445	0	$2y$12$GqNXQexXj06vUyVNjvnc8eHNfAjBD/7EXkn3V8XCdraXFrza0Cy7.	\N	6	0	\N	Sathya Alex	Kavumpadickal	17199112726683c3684d629.jpeg	\N	\N	2024-07-02 09:07:53	2024-07-03 10:11:03	0	0	1	\N	1	1	\N	\N	\N	\N	1	\N	\N	\N	0	0	\N	0
99	Helen Alexander	helen@helen.com	971	558855885	1	$2y$12$nKwosM.QpzFECL79VcVQlO7hVfOMfwB4N0mH4HEAIZfCRRPyakvyG	\N	7	0	\N	Helen	Alexander	17199244506683f6e206449.jpg	\N	\N	2024-07-02 12:47:37	2024-07-02 19:15:10	0	0	1	MYD-P-99	0	0	116|jJsbVTdUkHVxo1vjU1w64210vWhQrcCayZUeuaz02b12aadf		-O0nU7c3W6ss1BRWbdCW	ANDROID	2	2024-07-02	971	558855885	0	0	1111	0
106	test new		971	3357705054	1	$2y$12$qtnhtzjT5bUPRpbEKsKtUO.kKmGQF5xQWAaQ4VYCUbkYhiko.wEjO	\N	7	0	\N	test	new	\N	\N	\N	2024-07-03 08:39:21	2024-07-03 08:39:38	0	0	1	MYD-P-106	0	0	134|fhxUBoYMjiWbHf8PMcqoyrO2HPVtDJBziqrYlax8612e6bfe		-O0rjtYzZDi4Ld7LmHTm	iOS	1	2024-07-03	971	36178361783	1	3	\N	0
105	Andriya Alexander	andriya@andriya.com	971	556677889	0	$2y$12$g85unfo84OyPuoP.XGPOauZQ07rjmBj2G/mJ1QgsBD2dHD.INzZZq	\N	6	0	\N	Andriya	Alexander	17199936106685050a436ea.jpeg	\N	\N	2024-07-03 08:00:10	2024-07-03 10:05:45	0	0	1	\N	1	1	\N	\N	\N	\N	1	\N	\N	\N	0	0	\N	0
104	Alexander Helix	alex@alex.com	971	556655656	0	$2y$12$cnncSlaBJ0QQXzzG/2tXseXU0UEcSPQZBNX6MxEjeFUC3v9K8nH8u	\N	6	0	\N	Alexander	Helix	17199934666685047a72f75.jpeg	\N	\N	2024-07-03 07:57:47	2024-07-03 10:14:41	0	0	1	\N	1	1	\N	\N	\N	\N	1	\N	\N	\N	0	0	\N	0
102	rusvin k	rusvinmerak102@gmail.com	971	7034526957	1	$2y$12$L2OTejo557NcsWBE7AwomuxAQJOhrWVzT/CL2rOl2nldgbL71DRem	\N	7	0	\N	rusvin	k	17199266406683ff70cd402.jpg	\N	\N	2024-07-02 13:24:17	2024-07-03 10:06:58	0	0	1	MYD-P-102	0	0	115|mRCwTE2YbzUMeLy3cuTuoklYUKIjTjVhbDMCh8jjbf2022d3		-O0nbWLBIFFlGrI8-jUP	android	1	2020-12-15	971	9847823715	3	1	\N	1
48	Anil Navis	fh@fgg.com	971	523243164	1	$2y$12$TwIxV3fWqjiOBegdJkmyCOAspKzO2CjZK.H2sUKys1yiVJLuJ9PB.	\N	7	0	\N	Anil	Navis	\N	1111	\N	2024-06-27 03:55:53	2024-07-03 09:01:37	0	0	1	MYD-P-48	0	0	138|V67npCLg57TSEktjiHJ8C7uxp8Pic8TXaHNwGdRq098236d4	fbAMi-JwwUxQiZ41CukDLD:APA91bEWlalsxFIun5pO19CEhpCEbYz9Fv99vPdSoPEOXQ4uQLiE_F8gYuhzW4VA9c2lzhqRt-GW76fOa_9du12YW7UZRUfwhuqDkIpcavzWcThhsgxfhsnTJCwQ1L8ouXEwjRiyAJE_	-O0qROFomonhCB6vvhmO	iOS	1	2009-09-18	971	523243164	1	0	\N	0
109	Britanni Booth	qajulo@mailinator.com	971	36323132155	0	$2y$12$.W.lCmPZF6oXgj90C/92hOEp3S/FZURcKFFVIoELmAuUrKifzbES2	\N	6	0	\N	Britanni	Booth	172000007966851e4f52837.jpeg	\N	\N	2024-07-03 09:48:00	2024-07-03 09:48:00	0	0	1	\N	1	1	\N	\N	\N	\N	1	\N	\N	\N	0	0	\N	0
108	Carlitos Abraham Angela Maria	carlitos@carlitos.com	971	505599887	0	$2y$12$Wadwqpa3cNLw6Y/6WjkQbONTPW/Snu9rww.wm1GIJ/mAfOsAX6L5G	\N	6	0	\N	Carlitos	Abraham Angela Maria	171999959366851c69974e3.jpeg	\N	\N	2024-07-03 09:39:55	2024-07-03 10:05:07	0	0	1	\N	1	1	\N	\N	\N	\N	1	\N	\N	\N	0	0	\N	0
110	Arif Ali Khan	arif@arif.com	971	65462121212	0	$2y$12$FRqOMOqGhOWcS.bJGKyH0OXdi/jB7sJkPvKuAVvfEcbB9HB1k0i0O	\N	6	0	\N	Arif	Ali Khan	17200021276685264fece02.jpeg	\N	\N	2024-07-03 10:22:09	2024-07-03 10:24:32	0	0	1	\N	1	1	\N	\N	\N	\N	1	\N	\N	\N	0	0	\N	0
112	Mary Callahan	nete@mailinator.com	971	31821545482	0	$2y$12$nlYsZKXqq0Z0wJ4KBlFju.fBoPmnIUN9J9vLL7q/93kY8CEz9ikX6	\N	6	0	\N	Mary	Callahan	\N	\N	\N	2024-07-03 10:31:27	2024-07-03 10:31:27	0	0	1	\N	1	1	\N	\N	\N	\N	1	\N	\N	\N	0	0	\N	0
113	Kyle Goff	hehozu@mailinator.com	971	2355121255	0	$2y$12$GATIRFnceGSgOXVB5EKjz.vAiXFhl5lvOHiPqTbp.qB9LuZm5YyrG	\N	6	0	\N	Kyle	Goff	172000283466852912f0db5.jfif	\N	\N	2024-07-03 10:33:56	2024-07-03 10:33:56	0	0	1	\N	1	1	\N	\N	\N	\N	2	\N	\N	\N	0	0	\N	0
111	Abdullah Hussain	hussain@hussain.com	971	507788778	0	$2y$12$fz6ZZ3eapwy3BhalHtWA6uIcsO9BWqSiFXnvwZU2/OdhdoZQpEp9m	\N	6	0	\N	Abdullah	Hussain	1720002663668528678297d.jpeg	\N	\N	2024-07-03 10:31:04	2024-07-03 10:40:15	0	0	1	\N	1	1	\N	\N	\N	\N	2	\N	\N	\N	0	0	\N	0
84	Anna Maria	deva	971	505555585	1	$2y$12$P262h7gd/PZpL8cfioGl9ezMZ4GKzMTfphhDV2W0XsslCNXyfzGhC	\N	7	0	\N	Anna	Maria	1719817203668253f3171d3.jpg	1111	\N	2024-07-01 07:00:08	2024-07-03 10:46:00	0	0	1	MYD-P-84	0	0	140|R8TQaJ9aWbSNB3Z2XQeoUriNVTu5GmXkp86sfhA54d0985d0	dKUhIuPpLE08nRO6MbaNTl:APA91bHVJk1QdogeTHH3gg3RLVC_gXEfPQdKjmSIHWAVcwlSf4SFExCSPUsi0sRBMlewbA9DuqMrPagg5in0eVts6QxMITJhEFwHvTgmHQv4LBH7sW0X2sQRhXu3n2FLtnEMC-0fiXBB	-O0nOGF9dVeNTcRoT1cz	iOS	2	2008-12-01	971	505555585	0	0	\N	0
\.


--
-- Name: agent_user_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agent_user_details_id_seq', 6, true);


--
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_id_seq', 1, false);


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.areas_id_seq', 4, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articles_id_seq', 14, true);


--
-- Name: callcenter_user_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.callcenter_user_details_id_seq', 6, true);


--
-- Name: contact_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_us_id_seq', 5, true);


--
-- Name: contact_us_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_us_settings_id_seq', 1, true);


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_seq', 242, true);


--
-- Name: country_of_origins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_of_origins_id_seq', 495, true);


--
-- Name: department_hospital_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_hospital_id_seq', 16, true);


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_id_seq', 14, true);


--
-- Name: doctor_availabilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_availabilities_id_seq', 17, true);


--
-- Name: doctor_holidays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_holidays_id_seq', 30, true);


--
-- Name: doctor_instant_appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_instant_appointments_id_seq', 15, true);


--
-- Name: doctor_intrests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_intrests_id_seq', 161, true);


--
-- Name: doctor_language_spokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_language_spokens_id_seq', 170, true);


--
-- Name: doctor_patient_appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_patient_appointments_id_seq', 118, true);


--
-- Name: doctor_qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_qualifications_id_seq', 189, true);


--
-- Name: doctor_reschedule_appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_reschedule_appointments_id_seq', 18, true);


--
-- Name: doctor_specialities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_specialities_id_seq', 112, true);


--
-- Name: doctor_temporary_unavailables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_temporary_unavailables_id_seq', 29, true);


--
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctors_id_seq', 23, true);


--
-- Name: emirates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.emirates_id_seq', 3, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faq_id_seq', 4, true);


--
-- Name: help_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.help_id_seq', 1, false);


--
-- Name: hospital_doctor_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hospital_doctor_feedback_id_seq', 5, true);


--
-- Name: hospital_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hospital_images_id_seq', 19, true);


--
-- Name: hospital_insurance_policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hospital_insurance_policies_id_seq', 11, true);


--
-- Name: hospital_insurances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hospital_insurances_id_seq', 4, true);


--
-- Name: hospital_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hospital_locations_id_seq', 40, true);


--
-- Name: hospital_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hospital_services_id_seq', 1, false);


--
-- Name: hospital_specialities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hospital_specialities_id_seq', 1, false);


--
-- Name: hospitals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hospitals_id_seq', 12, true);


--
-- Name: insurence_policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insurence_policies_id_seq', 5, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.languages_id_seq', 3, true);


--
-- Name: licence_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.licence_types_id_seq', 5, true);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_id_seq', 1, false);


--
-- Name: medical_conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medical_conditions_id_seq', 2, true);


--
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.members_id_seq', 76, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 111, true);


--
-- Name: mydrworld_service_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mydrworld_service_feedback_id_seq', 4, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 2, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 140, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 2, true);


--
-- Name: profile_bios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profile_bios_id_seq', 1, false);


--
-- Name: qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.qualifications_id_seq', 5, true);


--
-- Name: role_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_permissions_id_seq', 68, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_seq', 2, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);


--
-- Name: special_intrests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.special_intrests_id_seq', 5, true);


--
-- Name: specialties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.specialties_id_seq', 2, true);


--
-- Name: sub_insurence_policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sub_insurence_policies_id_seq', 7, true);


--
-- Name: temp_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temp_users_id_seq', 73, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 113, true);


--
-- Name: agent_user_details agent_user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_user_details
    ADD CONSTRAINT agent_user_details_pkey PRIMARY KEY (id);


--
-- Name: appointments appointments_appointment_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_appointment_id_unique UNIQUE (appointment_id);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: callcenter_user_details callcenter_user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.callcenter_user_details
    ADD CONSTRAINT callcenter_user_details_pkey PRIMARY KEY (id);


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
-- Name: country_of_origins country_of_origins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country_of_origins
    ADD CONSTRAINT country_of_origins_pkey PRIMARY KEY (id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: department_doctors department_doctors_doctor_id_department_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_doctors
    ADD CONSTRAINT department_doctors_doctor_id_department_id_unique UNIQUE (doctor_id, department_id);


--
-- Name: department_hospital department_hospital_hospital_id_department_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_hospital
    ADD CONSTRAINT department_hospital_hospital_id_department_id_unique UNIQUE (hospital_id, department_id);


--
-- Name: department_hospital department_hospital_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_hospital
    ADD CONSTRAINT department_hospital_pkey PRIMARY KEY (id);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: doctor_availabilities doctor_availabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_availabilities
    ADD CONSTRAINT doctor_availabilities_pkey PRIMARY KEY (id);


--
-- Name: doctor_holidays doctor_holidays_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_holidays
    ADD CONSTRAINT doctor_holidays_pkey PRIMARY KEY (id);


--
-- Name: doctor_instant_appointments doctor_instant_appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_instant_appointments
    ADD CONSTRAINT doctor_instant_appointments_pkey PRIMARY KEY (id);


--
-- Name: doctor_intrests doctor_intrests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_intrests
    ADD CONSTRAINT doctor_intrests_pkey PRIMARY KEY (id);


--
-- Name: doctor_language_spokens doctor_language_spokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_language_spokens
    ADD CONSTRAINT doctor_language_spokens_pkey PRIMARY KEY (id);


--
-- Name: doctor_patient_appointments doctor_patient_appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_patient_appointments
    ADD CONSTRAINT doctor_patient_appointments_pkey PRIMARY KEY (id);


--
-- Name: doctor_qualifications doctor_qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_qualifications
    ADD CONSTRAINT doctor_qualifications_pkey PRIMARY KEY (id);


--
-- Name: doctor_reschedule_appointments doctor_reschedule_appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_reschedule_appointments
    ADD CONSTRAINT doctor_reschedule_appointments_pkey PRIMARY KEY (id);


--
-- Name: doctor_specialities doctor_specialities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_specialities
    ADD CONSTRAINT doctor_specialities_pkey PRIMARY KEY (id);


--
-- Name: doctor_temporary_unavailables doctor_temporary_unavailables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_temporary_unavailables
    ADD CONSTRAINT doctor_temporary_unavailables_pkey PRIMARY KEY (id);


--
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- Name: emirates emirates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emirates
    ADD CONSTRAINT emirates_pkey PRIMARY KEY (id);


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
-- Name: help help_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.help
    ADD CONSTRAINT help_pkey PRIMARY KEY (id);


--
-- Name: hospital_doctor_feedback hospital_doctor_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital_doctor_feedback
    ADD CONSTRAINT hospital_doctor_feedback_pkey PRIMARY KEY (id);


--
-- Name: hospital_images hospital_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital_images
    ADD CONSTRAINT hospital_images_pkey PRIMARY KEY (id);


--
-- Name: hospital_insurance_policies hospital_insurance_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital_insurance_policies
    ADD CONSTRAINT hospital_insurance_policies_pkey PRIMARY KEY (id);


--
-- Name: hospital_insurances hospital_insurances_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital_insurances
    ADD CONSTRAINT hospital_insurances_pkey PRIMARY KEY (id);


--
-- Name: hospital_locations hospital_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital_locations
    ADD CONSTRAINT hospital_locations_pkey PRIMARY KEY (id);


--
-- Name: hospital_services hospital_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital_services
    ADD CONSTRAINT hospital_services_pkey PRIMARY KEY (id);


--
-- Name: hospital_specialities hospital_specialities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital_specialities
    ADD CONSTRAINT hospital_specialities_pkey PRIMARY KEY (id);


--
-- Name: hospitals hospitals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospitals
    ADD CONSTRAINT hospitals_pkey PRIMARY KEY (id);


--
-- Name: insurence_policies insurence_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurence_policies
    ADD CONSTRAINT insurence_policies_pkey PRIMARY KEY (id);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: licence_types licence_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licence_types
    ADD CONSTRAINT licence_types_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: medical_conditions medical_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_conditions
    ADD CONSTRAINT medical_conditions_pkey PRIMARY KEY (id);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: mydrworld_service_feedback mydrworld_service_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mydrworld_service_feedback
    ADD CONSTRAINT mydrworld_service_feedback_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


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
-- Name: qualifications qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qualifications
    ADD CONSTRAINT qualifications_pkey PRIMARY KEY (id);


--
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


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
-- Name: special_intrests special_intrests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.special_intrests
    ADD CONSTRAINT special_intrests_pkey PRIMARY KEY (id);


--
-- Name: specialties specialties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialties
    ADD CONSTRAINT specialties_pkey PRIMARY KEY (id);


--
-- Name: sub_insurence_policies sub_insurence_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_insurence_policies
    ADD CONSTRAINT sub_insurence_policies_pkey PRIMARY KEY (id);


--
-- Name: temp_users temp_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temp_users
    ADD CONSTRAINT temp_users_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: agent_user_details_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX agent_user_details_user_id_index ON public.agent_user_details USING btree (user_id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: users_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_id_index ON public.users USING btree (id);


--
-- Name: agent_user_details agent_user_details_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent_user_details
    ADD CONSTRAINT agent_user_details_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: callcenter_user_details callcenter_user_details_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.callcenter_user_details
    ADD CONSTRAINT callcenter_user_details_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: department_doctors department_doctors_department_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_doctors
    ADD CONSTRAINT department_doctors_department_id_foreign FOREIGN KEY (department_id) REFERENCES public.departments(id) ON DELETE CASCADE;


--
-- Name: department_doctors department_doctors_doctor_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_doctors
    ADD CONSTRAINT department_doctors_doctor_id_foreign FOREIGN KEY (doctor_id) REFERENCES public.doctors(id) ON DELETE CASCADE;


--
-- Name: department_hospital department_hospital_department_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_hospital
    ADD CONSTRAINT department_hospital_department_id_foreign FOREIGN KEY (department_id) REFERENCES public.departments(id) ON DELETE CASCADE;


--
-- Name: department_hospital department_hospital_hospital_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_hospital
    ADD CONSTRAINT department_hospital_hospital_id_foreign FOREIGN KEY (hospital_id) REFERENCES public.hospitals(id) ON DELETE CASCADE;


--
-- Name: doctor_patient_appointments doctor_patient_appointments_department_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_patient_appointments
    ADD CONSTRAINT doctor_patient_appointments_department_id_foreign FOREIGN KEY (department_id) REFERENCES public.departments(id) ON DELETE SET NULL;


--
-- Name: doctor_patient_appointments doctor_patient_appointments_hospital_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_patient_appointments
    ADD CONSTRAINT doctor_patient_appointments_hospital_id_foreign FOREIGN KEY (hospital_id) REFERENCES public.hospitals(id) ON DELETE SET NULL;


--
-- Name: hospital_insurance_policies hospital_insurance_policies_hospital_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital_insurance_policies
    ADD CONSTRAINT hospital_insurance_policies_hospital_id_foreign FOREIGN KEY (hospital_id) REFERENCES public.hospitals(id) ON DELETE CASCADE;


--
-- Name: hospital_insurance_policies hospital_insurance_policies_insurance_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital_insurance_policies
    ADD CONSTRAINT hospital_insurance_policies_insurance_id_foreign FOREIGN KEY (insurance_id) REFERENCES public.insurence_policies(id) ON DELETE CASCADE;


--
-- Name: hospital_insurance_policies hospital_insurance_policies_sub_insurance_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital_insurance_policies
    ADD CONSTRAINT hospital_insurance_policies_sub_insurance_id_foreign FOREIGN KEY (sub_insurance_id) REFERENCES public.sub_insurence_policies(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

