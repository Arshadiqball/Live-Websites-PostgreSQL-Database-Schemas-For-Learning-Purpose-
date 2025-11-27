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
    address character varying(255)
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
    updated_at timestamp(0) without time zone
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
    holiday_date character varying(255) NOT NULL,
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
    instant_appointment_date character varying(255) NOT NULL,
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
    member_id character varying(255)
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
    updated_at timestamp(0) without time zone
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
    department_id bigint
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
    updated_at timestamp(0) without time zone
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
    profile_description_ar text
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
    insurence_id integer DEFAULT 0 NOT NULL,
    sub_insurence_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
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
    platform_fee double precision NOT NULL,
    referal_distribution_level_1 double precision DEFAULT '0'::double precision NOT NULL,
    referal_distribution_level_2 double precision DEFAULT '0'::double precision NOT NULL,
    referal_distribution_level_3 double precision DEFAULT '0'::double precision NOT NULL,
    lotery_distribution_level_1 double precision DEFAULT '0'::double precision NOT NULL,
    lotery_distribution_level_2 double precision DEFAULT '0'::double precision NOT NULL,
    lotery_distribution_level_3 double precision DEFAULT '0'::double precision NOT NULL,
    lotery_distribution_level_4 double precision DEFAULT '0'::double precision NOT NULL,
    lotery_distribution_level_5 double precision DEFAULT '0'::double precision NOT NULL,
    lotery_distribution_level_6 double precision DEFAULT '0'::double precision NOT NULL,
    lotery_distribution_level_7 double precision DEFAULT '0'::double precision NOT NULL,
    lotery_distribution_level_8 double precision DEFAULT '0'::double precision NOT NULL,
    lotery_distribution_level_9 double precision DEFAULT '0'::double precision NOT NULL,
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
    deleted integer DEFAULT 0,
    role_id integer DEFAULT 0,
    active integer DEFAULT 1,
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
    sub_insurence_id integer DEFAULT 0 NOT NULL
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
-- Name: contact_us_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_us_settings ALTER COLUMN id SET DEFAULT nextval('public.contact_us_settings_id_seq'::regclass);


--
-- Name: country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


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

COPY public.agent_user_details (id, user_id, gender, country_id, emirate_id, area_id, address) FROM stdin;
1	13	male	229	2	1	testing
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
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles (id, title_en, title_ar, status, desc_en, desc_ar, meta_title, meta_keyword, meta_description, created_at, updated_at) FROM stdin;
1	About Us	About Us	1	desc	desc	\N	\N	\N	2024-04-09 07:29:56	2024-04-09 07:29:56
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
-- Data for Name: contact_us_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_us_settings (id, title_en, title_ar, email, mobile, desc_en, desc_ar, location, latitude, longitude, twitter, instagram, facebook, youtube, linkedin, created_at, updated_at) FROM stdin;
1	MyDrWorld	\N	info@mydrworld.com	000000	\N	\N	673C+W8M - Dubai - United Arab Emirates	\N	\N	\N	\N	\N	\N	\N	\N	2024-04-11 10:31:52
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
-- Data for Name: department_doctors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department_doctors (doctor_id, department_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: department_hospital; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department_hospital (id, hospital_id, department_id, created_at, updated_at) FROM stdin;
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
2	2	1	["14:30","15:00","15:30","19:30","20:00"]	1	["14:30","15:00","15:30","19:30","20:00"]	1	["10:30","11:00","14:30","15:00","15:30","16:00","19:30","20:00"]	1	["09:30","10:00","14:30","15:00","19:30","20:00"]	1	["09:30","10:00","14:30","15:00","19:30","20:00"]	1	["09:00","14:00","14:30","15:00","19:00","19:30","20:00"]	1	["08:30","09:00","14:00"]	\N	2024-06-15 07:49:39	2024-06-15 07:49:39
1	1	1	["08:00","13:00"]	1	["13:30","18:00"]	1	["13:00","14:30","15:00","19:30"]	1	["13:00","13:30"]	1	["14:00","14:30","19:00","19:30"]	1	["14:00","14:30","19:00","19:30","20:00"]	1	["14:00","14:30","15:00","19:30","20:00"]	\N	2024-06-15 07:50:28	2024-06-15 07:50:28
\.


--
-- Data for Name: doctor_holidays; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_holidays (id, doctor_id, holiday_name, holiday_date, deleted_at, created_at, updated_at) FROM stdin;
1	1	eid	20-06-2024	\N	2024-06-06 06:50:15	2024-06-06 06:50:15
\.


--
-- Data for Name: doctor_instant_appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_instant_appointments (id, doctor_id, instant_appointment_date, deleted_at, created_at, updated_at) FROM stdin;
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
\.


--
-- Data for Name: doctor_patient_appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_patient_appointments (id, user_id, doctor_id, booking_id, booking_time_slot, booking_status, booking_date, reason_cancel, reason_reschedule, deleted_at, created_at, updated_at, previous_booking_time_slot, previous_booking_date, member_id) FROM stdin;
1	14	1	#MYDW3670	09:00	pending	12-06-2024	\N	\N	\N	2024-06-11 04:32:26	2024-06-11 04:32:26	\N	\N	\N
2	14	2	#MYDW1765	09:30	Rescheduled	13-06-2024	\N	\N	\N	2024-06-11 04:45:06	2024-06-11 04:45:06	09:00	12-06-2024	\N
3	23	7	#MYDW2684	13:00	Rescheduled	27-06-2024	\N	\N	\N	2024-06-15 07:43:12	2024-06-15 16:59:54	13:00	27-06-2024	0
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
\.


--
-- Data for Name: doctor_reschedule_appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_reschedule_appointments (id, patient_appointment_id, doctor_id, reschedule_patient_booking_date, reschedule_patient_time_slot, deleted_at, created_at, updated_at) FROM stdin;
1	3	7	27-06-2024	13:00	\N	2024-06-15 16:59:54	2024-06-15 16:59:54
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
\.


--
-- Data for Name: doctor_temporary_unavailables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_temporary_unavailables (id, doctor_id, unavailable_timeslot, unavailable_date, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctors (id, user_id, hospital_id, year_of_experiance, license_no, license_type_id, country_id, appointment_dial_code, appointment_phone, country_of_orgin, gender, insurence_id, sub_insurence_id, profile_desciription, created_at, updated_at, deleted_at, department_id) FROM stdin;
1	16	1	10	MDMD3628	["1"]	98	971	3453535345	0	1	0	0	<p>Envisioned for those who seek fine medical care in even finer surroundings, <a href="https://www.asterdmhealthcare.com/about-us/our-services/medcarehospital">Medcare Hospitals</a> and Clinics are the most <a href="https://www.asterdmhealthcare.com/">premium healthcare</a> facilities in the UAE.</p>	2024-06-06 06:48:23	2024-06-11 04:33:20	\N	\N
2	17	1	12	2312312	["1"]	229	971	2312311444	0	2	0	0	<p>test</p>	2024-06-06 11:45:14	2024-06-11 05:43:29	\N	\N
\.


--
-- Data for Name: emirates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emirates (id, name_en, name_ar, active, deleted_at, created_at, updated_at, country_id) FROM stdin;
2	Dubai	دبي	1	\N	2024-05-24 06:49:07	2024-05-24 06:49:07	229
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
1	Question 1	answer	1	1	1	2024-03-25 07:08:32	2024-03-25 07:08:32
3	sda	asd	1	1	1	2024-04-09 07:30:57	2024-04-09 07:30:57
\.


--
-- Data for Name: help; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.help (id, title, description, created_by, updated_by, active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: hospital_doctor_feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hospital_doctor_feedback (id, doctor_id, hospital_id, user_id, rating, feeback_message, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: hospital_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hospital_images (id, hospital_id, image_name, created_at, updated_at, deleted_at) FROM stdin;
1	3	1718273307666ac51bf286b.jpg	2024-06-13 10:08:28	2024-06-13 10:08:28	\N
2	3	1718273308666ac51c11501.jpg	2024-06-13 10:08:28	2024-06-13 10:08:28	\N
\.


--
-- Data for Name: hospital_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hospital_locations (id, hospital_id, location, latitude, longitude, created_at, updated_at, deleted_at) FROM stdin;
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

COPY public.hospitals (id, user_id, country_id, emirate_id, area_id, address, website, profile_description, trade_licenece, created_at, updated_at, deleted_at, name_en, name_ar, appointment_dial_code, appointment_phone, profile_description_ar) FROM stdin;
1	15	229	2	2	Corporate HQ 33rd Floor, Aspect Towers, Business Bay, Dubai, UAE	https://www.asterdmhealthcare.com/	<p>Brand Promise<br>"We’ll Treat you Well"<br>We live by this promise that sums up what we do and why we exist. This is our guiding philosophy in our interactions with patients, doctors, employees and society at large.</p><p>Our Values<br>We, at Aster DM Healthcare, abide by a core set of values that guide our organisational behaviour and decision making, and that create the unique ethos that is imbibed in every Asterian.</p>	17176556106661583a5a28e.jpg	2024-06-06 06:33:30	2024-06-06 06:33:30	\N	Aster Medcity	\N	971	67738993	<p>وعد العلامة التجارية<br>"سنعاملك بشكل جيد"<br>نحن نعيش بهذا الوعد الذي يلخص ما نقوم به ولماذا نحن موجودون. هذه هي فلسفتنا التوجيهية في تفاعلاتنا مع المرضى والأطباء والموظفين والمجتمع ككل.</p><p>قيمنا<br>نحن، في Aster DM Healthcare، نلتزم بمجموعة أساسية من القيم التي توجه سلوكنا التنظيمي وصنع القرار لدينا، والتي تخلق الروح الفريدة المتشربة في كل Asterian.</p>
2	18	229	2	1	testtt	google.com	<p>test</p>	\N	2024-06-07 03:54:30	2024-06-07 03:54:30	\N	Cmh	cmh	971	1234567890	<p>tes</p>
3	24	229	2	1	Al Jaddaf, Dubai, UAE	dxbitprojects.com	<p>Strategically located in the heart of Abu Dhabi city, yet nestled in a quiet setting that provides both convenience and privacy, Aster Hospital is your go-to dentistry boutique offering a range of comprehensive services in a friendly and relaxed atmosphere.</p>	1718273307666ac51b92b87.jpg	2024-06-13 10:08:27	2024-06-13 10:08:27	\N	Al Jalila Children's Hospital	Al Jalila Children's Hospital	971	12313123123	<p>Strategically located in the heart of Abu Dhabi city, yet nestled in a quiet setting that provides both convenience and privacy, Aster Hospital is your go-to dentistry boutique offering a range of comprehensive services in a friendly and relaxed atmosphere.</p>
\.


--
-- Data for Name: insurence_policies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insurence_policies (id, title, title_ar, status, created_by, last_updated_by, created_at, updated_at, deleted_at) FROM stdin;
2	National Helth	\N	1	1	1	2024-04-11 06:13:40	2024-04-11 06:13:52	2024-04-11 06:13:52
3	National	nationa	1	1	1	2024-04-11 08:56:15	2024-04-11 08:57:56	2024-04-11 08:57:56
1	Aafiya	Aafiya	1	1	1	2024-04-11 06:13:14	2024-06-17 17:16:27	\N
4	Abudhabi National Insurance Company	Abudhabi National Insurance Company	1	1	1	2024-06-17 17:16:47	2024-06-17 17:16:47	\N
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
-- Data for Name: medical_conditions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medical_conditions (id, title, title_ar, status, created_by, last_updated_by, created_at, updated_at, deleted_at) FROM stdin;
1	Allergians	الحساسية	1	1	1	2024-04-11 05:39:57	2024-04-11 05:40:43	\N
2	Allergianss	\N	1	1	1	2024-04-11 05:40:09	2024-04-11 05:40:52	2024-04-11 05:40:52
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.members (id, user_id, full_name, gender, age, insurence_id, sub_insurence_id, created_at, updated_at, deleted_at) FROM stdin;
1	14	sooraj	1	30	1	3	2024-06-06 04:51:22	2024-06-06 04:51:22	\N
3	14	amruth	1	30	0	0	2024-06-06 04:51:22	2024-06-06 04:51:51	2024-06-06 04:51:51
2	14	dady	2	25	1	1	2024-06-06 04:51:22	2024-06-06 04:52:19	\N
4	19	test	1	40	1	3	2024-06-13 17:47:50	2024-06-13 17:47:50	\N
5	19	test2	2	50	1	1	2024-06-13 17:47:50	2024-06-13 17:47:50	\N
6	23	sooraj	1	30	1	3	2024-06-14 06:02:56	2024-06-14 06:02:56	\N
7	23	sooraj	1	30	1	3	2024-06-14 06:02:56	2024-06-14 06:02:56	\N
9	23	sooraj	1	30	1	3	2024-06-14 06:03:36	2024-06-14 06:03:36	\N
10	23	sooraj	1	30	1	3	2024-06-14 06:03:36	2024-06-14 06:03:36	\N
8	23	sooraj	1	30	0	0	2024-06-14 06:02:56	2024-06-14 06:05:55	2024-06-14 06:05:55
11	23	Hamid	1	29	1	1	2024-06-14 06:03:36	2024-06-14 06:08:12	\N
12	23	sooraj	1	30	1	3	2024-06-15 05:07:08	2024-06-15 05:07:08	\N
13	23	sooraj	1	30	1	3	2024-06-15 05:07:08	2024-06-15 05:07:08	\N
14	23	sooraj	1	30	0	0	2024-06-15 05:07:08	2024-06-15 05:07:08	\N
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
\.


--
-- Data for Name: mydrworld_service_feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mydrworld_service_feedback (id, user_id, rating, feeback_message, deleted_at, created_at, updated_at) FROM stdin;
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
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, platform_fee, referal_distribution_level_1, referal_distribution_level_2, referal_distribution_level_3, lotery_distribution_level_1, lotery_distribution_level_2, lotery_distribution_level_3, lotery_distribution_level_4, lotery_distribution_level_5, lotery_distribution_level_6, lotery_distribution_level_7, lotery_distribution_level_8, lotery_distribution_level_9, created_at, updated_at) FROM stdin;
1	50	10	5	5	10	5	5	4	4	3	3	2	2	\N	\N
\.


--
-- Data for Name: special_intrests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.special_intrests (id, title, title_ar, status, created_by, last_updated_by, created_at, updated_at, deleted_at) FROM stdin;
1	Ortho	ort	0	1	1	2024-04-11 05:14:56	2024-04-11 05:15:51	2024-04-11 05:15:51
2	Children	Child	1	1	1	2024-04-11 05:15:43	2024-04-12 12:55:11	\N
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
4	17181351156668a94b80ce0.jpg	test	test	1	2024-06-12	test27@gmail.com	971	494949494949	971	494949494949	1	3	1111	1111	2024-06-11 19:45:15	2024-06-11 19:45:15
5	17181355526668ab00a5449.jpg	well	test	1	2024-06-12	test28@gmail.com	971	946464664646	971	946464664646	1	3	1111	1111	2024-06-11 19:52:32	2024-06-11 19:52:32
6	17181360426668aceab37c3.jpg	abc	test	1	2024-06-12	test29@gmail.com	971	105454313484	971	105454313484	1	3	1111	1111	2024-06-11 20:00:42	2024-06-11 20:00:42
14	1718346452666be2d4ce22c.jpg	Hamid	Raza	1	1996-01-12	razahamd324@gmail.com	971	9847823796	971	9847823799	1	3	1111	1111	2024-06-14 06:27:32	2024-06-14 06:27:32
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, dial_code, phone, phone_verified, password, email_verified_at, role, verified, user_type_id, first_name, last_name, user_image, user_phone_otp, remember_token, created_at, updated_at, deleted, role_id, active, user_code, created_by, last_updated_by, access_token, user_device_token, firebase_user_key, device_type, gender, dob, whatsap_dial_code, whatsap_phone, insurence_id, sub_insurence_id) FROM stdin;
3	developer	developer@a2.com	\N	\N	0	$2y$12$.rs4b5JhZNF372Xi5OJkDe2VgmGjh2lwaOzHxQIg0KS2tmiS/fqce	\N	\N	0	\N	\N	\N	\N	\N	\N	2024-03-25 05:37:18	2024-03-25 05:37:18	0	0	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0
4	subadmin	subadmin@gmail.com	\N	123455	0	$2y$12$5QhURKYgL9vqsNaSe4hRqOcdduFQ.95WqmjN/Y8b7HS75XSlWq53W	\N	1	1	\N	add	asda	\N	\N	\N	2024-03-25 05:45:09	2024-03-25 05:49:16	1	1	0	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0
8	Sooraj Sabu	sooraj.a2solution@gmail.com	93	9847823799	0	$2y$12$w//jrBIM8SAliILyGTylgOAdIzL5h6GBnbAiamBIopgEkwfYDKvpa	\N	3	0	\N	Sooraj	Sabu	\N	\N	\N	2024-03-26 05:37:41	2024-03-26 05:37:41	0	0	1	BLC-66025f253f697	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0
12	Sooraj Sabu	sooraj.a2solutions@gmail.com	358	9847823799	0	$2y$12$rHuzbjvzLMfN4p1KNUD83..sD23kBtIm3aeUq4FXwigu3tGKegBNu	\N	3	0	\N	Sooraj	Sabu	\N	\N	\N	2024-03-26 05:46:03	2024-03-26 05:46:03	0	0	1	BLC-6602611b19026	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0
6	dev dev	developer@gmail.com	\N	\N	0	$2y$12$UR5BkkQQrGtgykjXde3bVe.3YZaMVR7UYwZFo2uvwyj.NQCPS4Rh6	\N	1	1	\N	dev	dev	\N	\N	\N	2024-03-25 05:53:05	2024-04-09 07:04:17	1	2	0	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0
1	Admin	admin@admin.com	971	112233445566778899	0	$2y$12$nplGVHg7DQPp9uHBc3Rb7OT2Lh09Z.ORy4NihaFbir1fq/dRR2/Oi	\N	1	1	1	\N	\N	\N	\N	\N	\N	2024-03-22 12:32:29	0	1	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0
7	admin sub	adminsub@gmail.com	\N	\N	0	$2y$12$d3fiOttEff7UgNMU0Z9cFOsb7sFTBLRDzJBfdX2DRsAWXCdzjNNUu	\N	1	1	\N	admin	sub	\N	\N	\N	2024-04-11 06:41:52	2024-04-11 10:32:03	0	2	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0
13	Abdul Wahab	abdulwahab22@gmail.com	92	6541235	0	$2y$12$FxAiWMhPI2oNUH47TCPsruUb9yNF5z.iIMv33BsVNG/IxDQEHbVHW	\N	2	0	3	\N	\N	1716533483665038eb1a300.png	\N	\N	2024-05-24 06:51:23	2024-05-24 06:51:23	0	0	1	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	0	0
20	abv baab		971	101101881818	1	$2y$12$hu0JxuX9rw7aQjzRj3AvauMPcUdF0bSqaTdytuC6emsoMUOriTIJS	\N	7	0	\N	abv	baab	17181400896668bcb97d036.jpg	\N	\N	2024-06-11 21:08:17	2024-06-11 22:00:44	0	0	1	\N	0	0	4|OesecWCoHqQatiQmRoy4fSyd7tbIZ3j01SLvppH96d4ff786		\N	iOS	1	2024-06-12	971	101101881818	1	3
21	na abvh		971	48484848444	1	$2y$12$cWrxDV.zaWOCc86gkJ2m6OJRKcxOdj4pPbhLSJNr4Z4StRShwvnHa	\N	7	0	\N	na	abvh	17181404316668be0f30aa5.jpg	\N	\N	2024-06-11 21:13:56	2024-06-11 22:00:44	0	0	1	\N	0	0	5|wIB54eGWAlYrACdxFxhcfiEAZXK1yNVBXVApgPFo5b71a774		\N	iOS	1	2024-06-12	971	48484848444	1	3
19	aja nana	test30@gmail.com	971	943431818118	1	$2y$12$5cSJer9Nb335Rm7dbXPn6uFRQS2fVgqG0ys.41ivMVh0NBVXYsn2y	\N	7	0	\N	aja	nana	17181370006668b0a8d6280.jpg	1111	\N	2024-06-11 20:18:56	2024-06-11 22:00:44	0	0	1	\N	0	0	7|9nziakixsogullvNaXoRxY4A8o5ylBJMI3URvMLd1c79182a	abdhjef ekef kjwf wedfw	\N	iOS	1	2024-06-12	971	943431818118	1	3
15	Aster Medcity	aster@aster.com	971	352352523	0	$2y$12$mTH3vjHR7bhE06Qa6ytJou2JvAk2.m7Zfup5ISqzC81ZK5wFPHeL2	\N	5	0	\N	\N	\N	\N	\N	\N	2024-06-06 06:33:30	2024-06-06 06:33:30	0	0	1	\N	1	1	\N	\N	\N	\N	\N	\N	\N	\N	0	0
18	Cmh	testing@gmail.com	93	12345678	0	$2y$12$DKwZhuCBYIKzztTJWCORJetfvcfZFtSjLA9H3pqyRUVuuqyzAkKh.	\N	5	0	\N	\N	\N	\N	\N	\N	2024-06-07 03:54:30	2024-06-07 03:54:30	0	0	1	\N	1	1	\N	\N	\N	\N	\N	\N	\N	\N	0	0
16	Ammar	ammar@amar.com	971	6363463466	0	$2y$12$8QE74b/lHuQg.wxEa.GhR.I1c3TMPWlvzesd2MirUxpUt.YJ8CUWS	\N	6	0	\N	Ammar	Zain	\N	\N	\N	2024-06-06 06:48:23	2024-06-11 04:42:20	0	0	1	\N	1	1	\N	\N	\N	\N	\N	\N	\N	\N	0	0
22	anil navis		971	523243163	1	$2y$12$Kb08ALyacRGdiQdz/Lg5GOXEyiXfoWacyqBBRAfU37PuMcLe6pAjC	\N	7	0	\N	anil	navis	1718159831666909d75f438.jpg	\N	\N	2024-06-12 02:37:22	2024-06-12 02:37:22	0	0	1	\N	0	0	8|tAnxIAeMvGQOPgzUewiik8vikV8VTfXfLlEmSdU6d9a33a28	abdhjef ekef kjwf wedfw	\N	iOS	1	1997-06-12	971	523243163	1	3
17	Ahmad	ahmaddxba@gmail.com	971	131231444	0	$2y$12$9Hco6u6GcstjpXP3iyCv2.FmYUr3OmCgSGcDFMIdA25MH7SICnRBq	\N	6	0	\N	Ahmad	dxba	\N	\N	\N	2024-06-06 11:45:14	2024-06-11 05:43:29	0	0	1	\N	1	1	\N	\N	\N	\N	\N	\N	\N	\N	0	0
25	Hamid Raza	razahamd34@gmail.com	971	9847823797	1	$2y$12$CQsoslarb/0eRy0sMzbRYu.hCk/ntynXptp2jMQ4goIzaMF9gp9r2	\N	7	0	\N	Hamid	Raza	1718336631666bbc779ea04.jpg	\N	\N	2024-06-14 03:45:22	2024-06-14 03:45:22	0	0	1	\N	0	0	11|ouwxqO7E9b0sNK2KZsH4yK0LqQf6yegUgqGdSeLaafc599bd	fcm_token	\N	android	1	1996-01-12	971	9847823799	1	3
28	Hamid Raza	razahamid349@gmail.com	92	3441562555	1	$2y$12$mXjViBFHgS4eKG0v4m8MsO1l.26YHrbDYHZ9UVXstYrZ5d5E3ME.W	\N	7	0	\N	Hamid	Raza	1718612200666ff0e81001b.jpg	\N	\N	2024-06-17 08:16:49	2024-06-17 08:16:49	0	0	1	\N	0	0	15|wNDxSbWDC6cgNSJUvcONKLCU1yJ5Au4JZff6wx6n7a200f47	asd	\N	ANDROID	1	1970-01-01	92	3441562555	1	1
14	sooraj sabu		971	9847823790	1	$2y$12$dtMeWQMGrxbK2QLejCWMb.eosTjUP9bCg0Oz8oizg6aFrfLKgpBXW	\N	7	0	\N	sooraj	sabu	171764940466613ffc85016.jpg	1111	\N	2024-06-06 04:50:17	2024-06-11 21:17:47	0	0	1	\N	0	0	2|BnfBNUNbFmomP2NqsdzuLSufTeNyuF6tG2Hb0by63010879d		\N	ios	1	2020-12-15	971	9847823793	1	3
23	Hamid Raza	razahamid34@gmail.com	971	9847823799	1	$2y$12$Goa7opPm1SEu/q8nZJwphOv2MVbkrvnsb1YtPwc6/dqy9L4RTAAWO	\N	7	0	\N	Hamid	Raza	1718258791666a8c67cb5fa.jpg	1111	\N	2024-06-13 06:07:22	2024-06-15 05:06:41	0	0	1	\N	0	0	13|0c1KjLT2xQsrW4E8xTdF0FqN6PZajkwJIxlYcOVv8aa1a989	fcm	\N	ios	1	1996-01-12	971	9847823799	1	3
24	Al Jalila Children's Hospital	ranadxba@hotmail.com	971	12312312312	0	$2y$12$r9IC5/TdLiqF2rc6quwFBeuw5mO9LiQVJ4Bm374qNJfY.L5Ju2h.i	\N	5	0	\N	\N	\N	\N	\N	\N	2024-06-13 10:08:27	2024-06-13 10:08:27	0	0	1	\N	1	1	\N	\N	\N	\N	\N	\N	\N	\N	0	0
26	\N	jason@gmail.com	971	436363666	0	$2y$12$9MhitJzirz3oIcxSc7jUVuEIcBdlX2iGUwxInLop4uX1SJg04qF/S	\N	7	0	\N	Jason	Jacob	1718439437666d4e0d59211.jpg	\N	\N	2024-06-15 08:17:19	2024-06-15 08:17:19	0	0	1	\N	0	0	\N	\N	\N	\N	1	1971-06-09	971	34634636	1	3
27	Hamid Raza	razahamid46@gmail.com	92	3441562554	1	$2y$12$EpgqNma9.8n5vtxVZx/GO.J.FDXkwzYpQgD6.MJWH3bwqeZDk4PL.	\N	7	0	\N	Hamid	Raza	1718491357666e18dd9cdf7.jpg	\N	\N	2024-06-15 22:42:51	2024-06-15 22:42:51	0	0	1	\N	0	0	14|Wj0RslujRjCKdwRZl6eRmZMZvGtajM5b3mJTONup6a288c89	asd	\N	ANDROID	1	1970-01-01	92	3441562554	1	1
\.


--
-- Name: agent_user_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agent_user_details_id_seq', 1, true);


--
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_id_seq', 1, false);


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.areas_id_seq', 3, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articles_id_seq', 1, true);


--
-- Name: contact_us_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_us_settings_id_seq', 1, true);


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_seq', 242, true);


--
-- Name: department_hospital_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_hospital_id_seq', 1, false);


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_id_seq', 14, true);


--
-- Name: doctor_availabilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_availabilities_id_seq', 2, true);


--
-- Name: doctor_holidays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_holidays_id_seq', 1, true);


--
-- Name: doctor_instant_appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_instant_appointments_id_seq', 1, false);


--
-- Name: doctor_intrests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_intrests_id_seq', 6, true);


--
-- Name: doctor_language_spokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_language_spokens_id_seq', 9, true);


--
-- Name: doctor_patient_appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_patient_appointments_id_seq', 3, true);


--
-- Name: doctor_qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_qualifications_id_seq', 9, true);


--
-- Name: doctor_reschedule_appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_reschedule_appointments_id_seq', 1, true);


--
-- Name: doctor_specialities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_specialities_id_seq', 6, true);


--
-- Name: doctor_temporary_unavailables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_temporary_unavailables_id_seq', 1, false);


--
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctors_id_seq', 2, true);


--
-- Name: emirates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.emirates_id_seq', 2, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faq_id_seq', 3, true);


--
-- Name: help_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.help_id_seq', 1, false);


--
-- Name: hospital_doctor_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hospital_doctor_feedback_id_seq', 1, false);


--
-- Name: hospital_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hospital_images_id_seq', 2, true);


--
-- Name: hospital_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hospital_locations_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.hospitals_id_seq', 3, true);


--
-- Name: insurence_policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insurence_policies_id_seq', 4, true);


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
-- Name: medical_conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medical_conditions_id_seq', 2, true);


--
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.members_id_seq', 14, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 78, true);


--
-- Name: mydrworld_service_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mydrworld_service_feedback_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 2, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 15, true);


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

SELECT pg_catalog.setval('public.services_id_seq', 1, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);


--
-- Name: special_intrests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.special_intrests_id_seq', 2, true);


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

SELECT pg_catalog.setval('public.temp_users_id_seq', 21, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 28, true);


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
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

