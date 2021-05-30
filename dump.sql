--
-- PostgreSQL database dump
--

-- Dumped from database version 11.11 (Debian 11.11-0+deb10u1)
-- Dumped by pg_dump version 11.11 (Debian 11.11-0+deb10u1)

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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Company_company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Company_company" (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    username character varying(100) NOT NULL,
    password character varying(20) NOT NULL,
    address character varying(250) NOT NULL,
    email character varying(255) NOT NULL,
    mobile character varying(15) NOT NULL,
    active_status boolean NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flag boolean NOT NULL,
    area_id integer NOT NULL,
    auth_user_id integer,
    user_type_id integer NOT NULL
);


ALTER TABLE public."Company_company" OWNER TO postgres;

--
-- Name: Company_company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Company_company_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Company_company_id_seq" OWNER TO postgres;

--
-- Name: Company_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Company_company_id_seq" OWNED BY public."Company_company".id;


--
-- Name: Configuration_areamaster; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Configuration_areamaster" (
    id integer NOT NULL,
    area character varying(100) NOT NULL,
    active_status boolean NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public."Configuration_areamaster" OWNER TO postgres;

--
-- Name: Configuration_areamaster_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Configuration_areamaster_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Configuration_areamaster_id_seq" OWNER TO postgres;

--
-- Name: Configuration_areamaster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Configuration_areamaster_id_seq" OWNED BY public."Configuration_areamaster".id;


--
-- Name: Configuration_usertype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Configuration_usertype" (
    id integer NOT NULL,
    user_type character varying(100) NOT NULL,
    active_status boolean NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public."Configuration_usertype" OWNER TO postgres;

--
-- Name: Configuration_usertype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Configuration_usertype_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Configuration_usertype_id_seq" OWNER TO postgres;

--
-- Name: Configuration_usertype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Configuration_usertype_id_seq" OWNED BY public."Configuration_usertype".id;


--
-- Name: Customer_customerprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Customer_customerprofile" (
    id integer NOT NULL,
    emp_code character varying(100) NOT NULL,
    username character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    password character varying(20) NOT NULL,
    mobile character varying(20),
    email character varying(100),
    remarks character varying(1000),
    active_status boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    area_id integer NOT NULL,
    auth_user_id integer,
    user_type_id integer NOT NULL,
    barcode_info character varying(100),
    barcode_pic character varying(100),
    extn character varying(100)
);


ALTER TABLE public."Customer_customerprofile" OWNER TO postgres;

--
-- Name: Customer_customerprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Customer_customerprofile_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Customer_customerprofile_id_seq" OWNER TO postgres;

--
-- Name: Customer_customerprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Customer_customerprofile_id_seq" OWNED BY public."Customer_customerprofile".id;


--
-- Name: Patient_inscusionout; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Patient_inscusionout" (
    id integer NOT NULL,
    patient_id character varying(100) NOT NULL,
    patient_name character varying(100) NOT NULL,
    address character varying(500),
    phone character varying(20),
    sex character varying(100),
    age character varying(100),
    location character varying(100),
    diagnosis character varying(100),
    name character varying(100),
    active_status boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    user_id integer NOT NULL,
    no_of_doses character varying(100)
);


ALTER TABLE public."Patient_inscusionout" OWNER TO postgres;

--
-- Name: Patient_inscusionout_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Patient_inscusionout_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Patient_inscusionout_id_seq" OWNER TO postgres;

--
-- Name: Patient_inscusionout_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Patient_inscusionout_id_seq" OWNED BY public."Patient_inscusionout".id;


--
-- Name: Patient_paidamount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Patient_paidamount" (
    id integer NOT NULL,
    patient_id character varying(100) NOT NULL,
    rate character varying(100) NOT NULL,
    paid text[],
    active_status boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    user_id integer NOT NULL,
    partial_paid text[]
);


ALTER TABLE public."Patient_paidamount" OWNER TO postgres;

--
-- Name: Patient_paidamount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Patient_paidamount_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Patient_paidamount_id_seq" OWNER TO postgres;

--
-- Name: Patient_paidamount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Patient_paidamount_id_seq" OWNED BY public."Patient_paidamount".id;


--
-- Name: Patient_patient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Patient_patient" (
    id integer NOT NULL,
    patient_id character varying(100) NOT NULL,
    patient_name character varying(100) NOT NULL,
    address character varying(500),
    phone character varying(20),
    sex character varying(100),
    age character varying(100),
    date_of_collection timestamp with time zone,
    "time" time without time zone,
    location character varying(100),
    diagnosis character varying(100),
    no_of_doses character varying(100),
    barcode_pic character varying(100),
    barcode_info character varying(100),
    active_status boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    auth_user_id integer,
    patient_type character varying(100) NOT NULL,
    paid text[],
    rate character varying(100)
);


ALTER TABLE public."Patient_patient" OWNER TO postgres;

--
-- Name: Patient_patient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Patient_patient_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Patient_patient_id_seq" OWNER TO postgres;

--
-- Name: Patient_patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Patient_patient_id_seq" OWNED BY public."Patient_patient".id;


--
-- Name: Patient_samplecollection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Patient_samplecollection" (
    id integer NOT NULL,
    patient_id character varying(100) NOT NULL,
    patient_name character varying(100) NOT NULL,
    address character varying(500),
    phone character varying(20),
    active_status boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    user_id integer NOT NULL,
    location character varying(20),
    diagnosis character varying(100),
    age character varying(100),
    sex character varying(100),
    quantity character varying(100)
);


ALTER TABLE public."Patient_samplecollection" OWNER TO postgres;

--
-- Name: Patient_samplecollection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Patient_samplecollection_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Patient_samplecollection_id_seq" OWNER TO postgres;

--
-- Name: Patient_samplecollection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Patient_samplecollection_id_seq" OWNED BY public."Patient_samplecollection".id;


--
-- Name: Patient_splittest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Patient_splittest" (
    id integer NOT NULL,
    patient_id character varying(100) NOT NULL,
    split_quantity character varying(100) NOT NULL,
    active_status boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    user_id integer NOT NULL,
    address character varying(500),
    patient_name character varying(100) NOT NULL,
    phone character varying(20),
    age character varying(100),
    diagnosis character varying(100),
    sex character varying(100)
);


ALTER TABLE public."Patient_splittest" OWNER TO postgres;

--
-- Name: Patient_splittest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Patient_splittest_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Patient_splittest_id_seq" OWNER TO postgres;

--
-- Name: Patient_splittest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Patient_splittest_id_seq" OWNED BY public."Patient_splittest".id;


--
-- Name: Product_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product_category" (
    id integer NOT NULL,
    category_type character varying(50),
    category_name character varying(50) NOT NULL,
    category_image character varying(100),
    active_status boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    priority integer,
    CONSTRAINT "Product_category_priority_check" CHECK ((priority >= 0))
);


ALTER TABLE public."Product_category" OWNER TO postgres;

--
-- Name: Product_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Product_category_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Product_category_id_seq" OWNER TO postgres;

--
-- Name: Product_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Product_category_id_seq" OWNED BY public."Product_category".id;


--
-- Name: Product_contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product_contact" (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    company character varying(100) NOT NULL,
    city character varying(100) NOT NULL,
    state character varying(100) NOT NULL,
    enquiry_type character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(100) NOT NULL,
    comment character varying(100) NOT NULL,
    active_status boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE public."Product_contact" OWNER TO postgres;

--
-- Name: Product_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Product_contact_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Product_contact_id_seq" OWNER TO postgres;

--
-- Name: Product_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Product_contact_id_seq" OWNED BY public."Product_contact".id;


--
-- Name: Product_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product_product" (
    id integer NOT NULL,
    product_name character varying(100) NOT NULL,
    active_status boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    category_id integer NOT NULL,
    product_image character varying(100),
    product_desc text
);


ALTER TABLE public."Product_product" OWNER TO postgres;

--
-- Name: Product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Product_product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Product_product_id_seq" OWNER TO postgres;

--
-- Name: Product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Product_product_id_seq" OWNED BY public."Product_product".id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- Name: dashboard_userdashboardmodule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboard_userdashboardmodule (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    module character varying(255) NOT NULL,
    app_label character varying(255),
    "user" integer NOT NULL,
    "column" integer NOT NULL,
    "order" integer NOT NULL,
    settings text NOT NULL,
    children text NOT NULL,
    collapsed boolean NOT NULL,
    CONSTRAINT dashboard_userdashboardmodule_column_check CHECK (("column" >= 0)),
    CONSTRAINT dashboard_userdashboardmodule_user_check CHECK (("user" >= 0))
);


ALTER TABLE public.dashboard_userdashboardmodule OWNER TO postgres;

--
-- Name: dashboard_userdashboardmodule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboard_userdashboardmodule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_userdashboardmodule_id_seq OWNER TO postgres;

--
-- Name: dashboard_userdashboardmodule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dashboard_userdashboardmodule_id_seq OWNED BY public.dashboard_userdashboardmodule.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: jet_bookmark; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jet_bookmark (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    "user" integer NOT NULL,
    date_add timestamp with time zone NOT NULL,
    CONSTRAINT jet_bookmark_user_check CHECK (("user" >= 0))
);


ALTER TABLE public.jet_bookmark OWNER TO postgres;

--
-- Name: jet_bookmark_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jet_bookmark_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jet_bookmark_id_seq OWNER TO postgres;

--
-- Name: jet_bookmark_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jet_bookmark_id_seq OWNED BY public.jet_bookmark.id;


--
-- Name: jet_pinnedapplication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jet_pinnedapplication (
    id integer NOT NULL,
    app_label character varying(255) NOT NULL,
    "user" integer NOT NULL,
    date_add timestamp with time zone NOT NULL,
    CONSTRAINT jet_pinnedapplication_user_check CHECK (("user" >= 0))
);


ALTER TABLE public.jet_pinnedapplication OWNER TO postgres;

--
-- Name: jet_pinnedapplication_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jet_pinnedapplication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jet_pinnedapplication_id_seq OWNER TO postgres;

--
-- Name: jet_pinnedapplication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jet_pinnedapplication_id_seq OWNED BY public.jet_pinnedapplication.id;


--
-- Name: Company_company id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Company_company" ALTER COLUMN id SET DEFAULT nextval('public."Company_company_id_seq"'::regclass);


--
-- Name: Configuration_areamaster id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Configuration_areamaster" ALTER COLUMN id SET DEFAULT nextval('public."Configuration_areamaster_id_seq"'::regclass);


--
-- Name: Configuration_usertype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Configuration_usertype" ALTER COLUMN id SET DEFAULT nextval('public."Configuration_usertype_id_seq"'::regclass);


--
-- Name: Customer_customerprofile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer_customerprofile" ALTER COLUMN id SET DEFAULT nextval('public."Customer_customerprofile_id_seq"'::regclass);


--
-- Name: Patient_inscusionout id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patient_inscusionout" ALTER COLUMN id SET DEFAULT nextval('public."Patient_inscusionout_id_seq"'::regclass);


--
-- Name: Patient_paidamount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patient_paidamount" ALTER COLUMN id SET DEFAULT nextval('public."Patient_paidamount_id_seq"'::regclass);


--
-- Name: Patient_patient id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patient_patient" ALTER COLUMN id SET DEFAULT nextval('public."Patient_patient_id_seq"'::regclass);


--
-- Name: Patient_samplecollection id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patient_samplecollection" ALTER COLUMN id SET DEFAULT nextval('public."Patient_samplecollection_id_seq"'::regclass);


--
-- Name: Patient_splittest id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patient_splittest" ALTER COLUMN id SET DEFAULT nextval('public."Patient_splittest_id_seq"'::regclass);


--
-- Name: Product_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product_category" ALTER COLUMN id SET DEFAULT nextval('public."Product_category_id_seq"'::regclass);


--
-- Name: Product_contact id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product_contact" ALTER COLUMN id SET DEFAULT nextval('public."Product_contact_id_seq"'::regclass);


--
-- Name: Product_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product_product" ALTER COLUMN id SET DEFAULT nextval('public."Product_product_id_seq"'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: dashboard_userdashboardmodule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_userdashboardmodule ALTER COLUMN id SET DEFAULT nextval('public.dashboard_userdashboardmodule_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: jet_bookmark id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jet_bookmark ALTER COLUMN id SET DEFAULT nextval('public.jet_bookmark_id_seq'::regclass);


--
-- Name: jet_pinnedapplication id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jet_pinnedapplication ALTER COLUMN id SET DEFAULT nextval('public.jet_pinnedapplication_id_seq'::regclass);


--
-- Data for Name: Company_company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Company_company" (id, name, username, password, address, email, mobile, active_status, created_at, updated_at, flag, area_id, auth_user_id, user_type_id) FROM stdin;
\.


--
-- Data for Name: Configuration_areamaster; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Configuration_areamaster" (id, area, active_status, created_at, updated_at) FROM stdin;
1	Sonipath	t	2021-04-07 16:49:51.642843+00	\N
2	Noida	t	2021-04-07 16:50:07.027434+00	\N
3	Delhi	t	2021-04-07 16:50:22.618707+00	\N
\.


--
-- Data for Name: Configuration_usertype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Configuration_usertype" (id, user_type, active_status, created_at, updated_at) FROM stdin;
1	SuperAdmin	t	2021-04-07 16:41:25.044487+00	\N
3	User	t	2021-04-07 16:42:02.398451+00	\N
2	Employee	t	2021-04-07 16:41:46.966575+00	2021-04-12 13:15:23.181376+00
\.


--
-- Data for Name: Customer_customerprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Customer_customerprofile" (id, emp_code, username, name, password, mobile, email, remarks, active_status, created_at, updated_at, area_id, auth_user_id, user_type_id, barcode_info, barcode_pic, extn) FROM stdin;
1	E001	Rajkumar	Raj Kumar	raj@123				t	2021-04-12 05:33:03.55124+00	2021-04-12 05:34:32.864155+00	2	3	3	\N	\N	
2	E002	rahul	Rahul	123456				t	2021-04-12 05:36:34.517473+00	\N	2	4	3	\N	\N	
4	E003	Ravi	Ravi Ranjan	Ravi@123				t	2021-04-12 06:14:46.952966+00	\N	2	5	3	\N	\N	
5	E004	Manoj	Manoj Kumar	Manoj@123				t	2021-04-12 06:15:37.295245+00	\N	2	6	3	\N	\N	
6	E005	Devendra	Devendra Pratap	Devendra@123				t	2021-04-12 06:16:41.085956+00	\N	2	7	3	\N	\N	
7	E006	Udaiveer	Udaiveer Singh	Udai@123				t	2021-04-12 06:17:34.484759+00	\N	3	8	3	\N	\N	
3	003	nitesh	nitesh	111	\N	\N	\N	f	2021-04-12 06:00:42.379777+00	2021-04-12 06:19:06.601835+00	3	2	1	\N	\N	\N
8	E007	Neeraj	Neeraj Kumar	Neeraj@123				t	2021-04-12 06:22:21.199373+00	\N	3	9	3	\N	\N	
9	E008	Tauquir	Tauquir	Tauq@321				t	2021-04-12 06:23:56.515648+00	2021-04-12 08:31:46.846202+00	3	10	1	\N	\N	
10	E009	Taak	Rahul Taak	Taal@321				t	2021-04-12 06:24:52.7488+00	2021-04-12 08:31:57.249251+00	3	11	1	\N	\N	
11	E010	Shahid	Shahid	Shahid@321				t	2021-04-12 06:25:39.666283+00	2021-04-12 08:32:11.217307+00	3	12	1	\N	\N	
\.


--
-- Data for Name: Patient_inscusionout; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Patient_inscusionout" (id, patient_id, patient_name, address, phone, sex, age, location, diagnosis, name, active_status, created_at, updated_at, user_id, no_of_doses) FROM stdin;
\.


--
-- Data for Name: Patient_paidamount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Patient_paidamount" (id, patient_id, rate, paid, active_status, created_at, updated_at, user_id, partial_paid) FROM stdin;
\.


--
-- Data for Name: Patient_patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Patient_patient" (id, patient_id, patient_name, address, phone, sex, age, date_of_collection, "time", location, diagnosis, no_of_doses, barcode_pic, barcode_info, active_status, created_at, updated_at, auth_user_id, patient_type, paid, rate) FROM stdin;
1	03210113	IFTEKHAR KHAN	N-20, IV FLOOR JAMIA NAGAR NEW DELHI-110025	9811994827	Male	69	2021-04-07 10:15:00+00	\N	VASANT VIHAR	CA TONGUE	2	\N	\N	f	2021-04-07 17:35:40.137332+00	2021-04-07 17:43:08.936947+00	2	03210113	{}	\N
2	4210135	Mr. DILSHAD	KAIRANA MOHALLA \nDist: SHAMLI	6395741770	Male	55	2021-03-23 00:00:00+00	\N	SHAMLI	Urothelial carcinoma	3	4210135.png	6395741770,4210135,Mr. DILSHAD	t	2021-04-12 09:03:38.440664+00	\N	14	Mannual	\N	\N
3	4210134	Mr. DEORAJ  SINGH	MSQ-168\nAIRFORCE STATION \nHINDON \nGHAZIABAD -04	9602784099	Male	59	2021-03-24 00:00:00+00	\N	Ghaziabad	Carcinoma of Lung	3	4210134.png	9602784099,4210134,Mr. DEORAJ  SINGH	t	2021-04-12 09:08:55.902208+00	\N	20	Mannual	\N	\N
4	4210133	REETA GUPTA	53/7, NAYAGANJ, CANAL ROAD, KANPUR	9807100551	Female	50	2021-03-31 00:00:00+00	16:30:00	KANPUR	CA GALL BLADDER	3	4210133.png	9807100551,4210133,REETA GUPTA	t	2021-04-12 09:10:40.82081+00	\N	21	Mannual	\N	\N
5	4210132	NAZAR HUSSAIN	PURKAZI, MUZFFAR NAGAR-U.P	8307802173	Male	73	2021-04-01 00:00:00+00	14:42:00	VASANT VIHAR	CA R LUNG	3	4210132.png	8307802173,4210132,NAZAR HUSSAIN	t	2021-04-12 09:12:57.358795+00	\N	22	Mannual	\N	\N
6	4210131	Mr. HASEEB KHAN	BIHAR KALAN , IZZATNAGAR \nBAREILLY	7868015752	Male	61	2021-03-25 00:00:00+00	11:00:00	BAREILLY	Carcinoma of Gall bladder with liver and nodal metastasis	3	4210131.png	7868015752,4210131,Mr. HASEEB KHAN	t	2021-04-12 09:15:34.029882+00	\N	23	Mannual	\N	\N
7	4210130	Mrs. MADHUBALA	A 5B/388, SFS FLATS \nGATE NO: 11 ,\nPASCHIM VIHAR \nNEW DELHI	9212770277	Female	69	2021-03-25 00:00:00+00	14:47:00	NEW DELHI	MULTIPLE MYELOMA	3	4210130.png	9212770277,4210130,Mrs. MADHUBALA	t	2021-04-12 09:17:33.234745+00	\N	26	Mannual	\N	\N
8	4210129	VISHWANATHAN		9844179672	Male	85	2021-03-21 00:00:00+00	13:31:00	CHENNAI	CARCINOMA OF ORAL CAVITY	3	4210129.png	9844179672,4210129,VISHWANATHAN	t	2021-04-12 09:19:00.665505+00	\N	27	Mannual	\N	\N
9	4210128	PHOOLA DEVI	MAHOBA (UP)	8175819525	Female	46	2021-03-20 00:00:00+00	13:25:00	MAHOBA	CARCINOMA OF TONGUE	3	4210128.png	8175819525,4210128,PHOOLA DEVI	t	2021-04-12 09:21:26.617829+00	\N	28	Mannual	\N	\N
10	4210127	KIRAN	LUCKNOW	8318667404	Female	55	2021-03-20 00:00:00+00	16:44:00	LUCKNOW	CARCINOMA OF GALL BLADDER	2	4210127.png	8318667404,4210127,KIRAN	t	2021-04-12 09:22:47.62063+00	\N	29	Mannual	\N	\N
11	4210126	Mrs.MEENA	H.N: 2146 , Chahindara ,\nH.C- sen Road ,\nChandini Chowk \nDelhi -	9811566952	Female	60	2021-03-18 00:00:00+00	00:00:00	Delhi	Metastatic CA breast	3	4210126.png	9811566952,4210126,Mrs.MEENA	t	2021-04-12 09:24:27.100926+00	\N	31	Mannual	\N	\N
12	4210121	KIRAN DEVI	H.NO-99a, 8/10, WING NO-7, PREMNAGAR\nDEHRADUN UTTRAKHAND-248007	7895906090	Female	53	2021-03-19 00:00:00+00	13:09:00	DEHRADUN	CA ENDOMETRIUM AT VAGINAL VAULT	2	4210121.png	7895906090,4210121,KIRAN DEVI	t	2021-04-12 09:32:03.64132+00	\N	32	Mannual	\N	\N
13	3210119	Mrs. SWATI SAREEN	2C , Nehru Nagar	8826594442	Female	50	2021-03-24 00:00:00+00	10:35:00	Ghaziabad	EWING'S SARCOMA	2	3210119.png	8826594442,3210119,Mrs. SWATI SAREEN	t	2021-04-12 09:33:45.8527+00	\N	33	Mannual	\N	\N
14	3210117	CHUNNI PEER	H.No: 717 , SEC-9 , \nGURUGRAM (present)\n\nH.No: 51, Subhash Nagar \nExt. Jammu	8825075939	Female	80	2021-03-24 00:00:00+00	10:35:00	Jammu	Carcinoma of breast	3	3210117.png	8825075939,3210117,CHUNNI PEER	t	2021-04-12 09:35:41.71064+00	\N	34	Mannual	\N	\N
15	3210116	MOHD.  DANISH	318 A , Chirag Delhi \nDelhi	9990137749	Male	38	2021-03-26 00:00:00+00	11:30:00	Chirag Delhi	CA oral cavity	3	3210116.png	9990137749,3210116,MOHD.  DANISH	t	2021-04-12 09:37:47.466464+00	\N	35	Mannual	\N	\N
16	3210115	Mr. SANJAY MOTWANI	84/63, H.N: 180 , \nTEJAB MAIN CAMPUS \nG.T ROAD \nKANPUR -- 208003	8299192131	Male	50	2021-03-21 00:00:00+00	15:09:00	KANPUR	Carcinoma of urinary bladder	3	3210115.png	8299192131,3210115,Mr. SANJAY MOTWANI	t	2021-04-12 09:40:33.159096+00	\N	36	Mannual	\N	\N
17	3210114	Mr. VIKAS KHURANA	1226, Nai Basti ,\nNear Bijnor	9634013535	Male	47	2021-03-04 00:00:00+00	15:12:00	Bijnor	Recurrent metastatic RCC	3	3210114.png	9634013535,3210114,Mr. VIKAS KHURANA	t	2021-04-12 09:42:24.523589+00	\N	37	Mannual	\N	\N
18	3210113	IFTEKHAR KHAN	N-20, IV FLOOR\nJAMIA NAGAR\nNEW DELHI-110025	9811994827	Male	69	2021-03-05 00:00:00+00	15:17:00	VASANT VIHAR	CA TONGUE	2	3210113.png	9811994827,3210113,IFTEKHAR KHAN	t	2021-04-12 09:46:56.711832+00	\N	38	Mannual	\N	\N
19	3210112	DEEPIKA DHURVE	H.NO-82, JAIL ROAD\nJAHANGIRABAD\nBHOPAL	7987954664	Female	19	2021-03-04 00:00:00+00	16:17:00	VASANT VIHAR	CA RECTUM WITH PERITONEAL	2	3210112.png	7987954664,3210112,DEEPIKA DHURVE	t	2021-04-12 09:48:17.212331+00	\N	39	Mannual	\N	\N
20	3210111	SURUCHI RAWAT	INDORE	9300441124	Female	33	2021-03-24 00:00:00+00	16:19:00	INDORE	CA RIGHT BREAST WITH BRAIN	2	3210111.png	9300441124,3210111,SURUCHI RAWAT	t	2021-04-12 09:51:01.116335+00	\N	40	Mannual	\N	\N
21	3210110	VIKAS KHURANA	BIJNOR	9634013535	Male	47	2021-03-04 00:00:00+00	14:10:00	VASANT VIHAR	CA RECURRENT METASTATICS RCC	3	3210110.png	9634013535,3210110,VIKAS KHURANA	t	2021-04-12 09:53:23.12592+00	\N	41	Mannual	\N	\N
22	3210109	BASMATI TIU	DUPAI PUNIYA, EAST SINHMUM\nJHARKHAND-833201	9931546898	Female	47	2021-03-04 00:00:00+00	13:24:00	VASANT VIHAR	NON-HEALING ULCER	3	3210109.png	9931546898,3210109,BASMATI TIU	t	2021-04-12 09:55:10.578055+00	\N	42	Mannual	\N	\N
23	3210108	JULFIKAR ALI	GRAM-GARIYA HAYWATPUR\nPOST-CHILSARA\nDIST-FARRUKHABAD	7985362634	Male	45	2021-03-03 00:00:00+00	15:54:00	VASANT VIHAR	CA ORAL CAVITY	3	3210108.png	7985362634,3210108,JULFIKAR ALI	t	2021-04-12 09:56:46.154062+00	\N	43	Mannual	\N	\N
24	3210107	NISHA KHAN	920, GALI  MOCHIAN, CHITLIQABAR\nJAMA MASJID\nDELHI-110006	9599014582	Male	18	2021-03-03 00:00:00+00	12:33:00	VASANT VIHAR	CLASSICAL HODGKIN LYMPHOMA	3	3210107.png	9599014582,3210107,NISHA KHAN	t	2021-04-12 09:58:13.50642+00	\N	44	Mannual	\N	\N
25	3210106	MANOJ KUMAR GOEL	GORAKHPUR (KUSHINAGAR)\nBEHIND ASHIRWAD HOSPITAL	9935264252	Male	44	2021-03-04 00:00:00+00	09:43:00	KUSHINAGAR	GBM WHO GRADE-IV	2	3210106.png	9935264252,3210106,MANOJ KUMAR GOEL	t	2021-04-12 09:59:26.07057+00	\N	45	Mannual	\N	\N
26	3210105	RAFI AHMAD KHAN	1256, STREET-MAHEL\nSARAI-PUNJAB PHATAK\nBALLIMARAN\nDELHI-6	9899689032	Male	65	2021-03-02 00:00:00+00	18:34:00	CHANDNI CHOWK, DELHI	CA LEFT LUNG	3	3210105.png	9899689032,3210105,RAFI AHMAD KHAN	t	2021-04-12 10:02:35.536759+00	\N	46	Mannual	\N	\N
27	3210104	AFSAR ZAMAN KHAN	V & P - MAJHPURMA\nDIST- KANNAUJ (UP)	9140380214	Male	50	2021-03-02 00:00:00+00	17:43:00	VASANT VIHAR	CA LEFT LUNG	2	3210104.png	9140380214,3210104,AFSAR ZAMAN KHAN	t	2021-04-12 10:04:08.592775+00	\N	47	Mannual	\N	\N
28	3210103	KUMARASAWAMY V.	91220 FLIGHT, JAMMU & KASHMIR, C/O 56, APO\nPINCODE-925409	9311988921	Male	63	2021-03-02 00:00:00+00	14:38:00	VASANT VIHAR	CA STOMACH PYLORUS	6	3210103.png	9311988921,3210103,KUMARASAWAMY V.	t	2021-04-12 10:05:54.023383+00	\N	48	Mannual	\N	\N
29	3210102	MD SHAKIL	UJJAIN(M.P)	9826067735	Male	39	2021-03-02 00:00:00+00	13:39:00	VASANT VIHAR	CA NHL	3	3210102.png	9826067735,3210102,MD SHAKIL	t	2021-04-12 10:10:07.55063+00	\N	49	Mannual	\N	\N
30	3210101	RENU SRIVASTAVA	VILLAGE- UNDI, POST SARSAWA, THANA- SHIVPUR, DISTT, VARANASI(U.P.) PIN-221003	7009672388	Female	49	2021-03-03 00:00:00+00	13:35:00	VARANASI	CA R BREAST WITH LUNG METS	3	3210101.png	7009672388,3210101,RENU SRIVASTAVA	t	2021-04-12 10:12:09.355077+00	\N	50	Mannual	\N	\N
31	3210100	USHA GOYAL	B-3/68, ASHOK VIHAR PHASE-II, DELHI-110054	9811280054	Female	58	2021-03-01 00:00:00+00	13:21:00	ASHOK VIHAR DELHI	CA R BREAST	3	3210100.png	9811280054,3210100,USHA GOYAL	t	2021-04-12 10:17:04.189276+00	\N	51	Mannual	\N	\N
32	3210099	HIMANSHU YADAV	HARIDWAR	8006606108	Male	25	2021-02-27 00:00:00+00	13:17:00	VASANT VIHAR	CA RETROPERTONEAL TUMOR WITH POSTERIOR MEDIASTINAL MASS	3	3210099.png	8006606108,3210099,HIMANSHU YADAV	t	2021-04-12 10:18:21.761067+00	\N	52	Mannual	\N	\N
33	3210098	NARESH DUGTAL	20, OFFICER'S ENCLAVE, KARAM CHARI NAGAR, IZZAT NAGAR BAREILLY	9997989709	Male	30	2021-02-27 00:00:00+00	13:12:00	VASANT VIHAR	CA RECTUM	3	3210098.png	9997989709,3210098,NARESH DUGTAL	t	2021-04-12 10:19:30.258068+00	\N	53	Mannual	\N	\N
34	3210097	REKHA SHARMA	A-54, SHAKTI VIHAR, MOHAN GARDEN, UTTAM NAGAR, NEW DELHI-110059	9971056920	Female	35	2021-02-27 00:00:00+00	13:03:00	VASANT VIHAR	CA LOW GRADE SEROUS CARCINOMA BILATERAL OVARY	3	3210097.png	9971056920,3210097,REKHA SHARMA	t	2021-04-12 10:21:21.763809+00	\N	54	Mannual	\N	\N
35	3210096	ABHIRAM AGRAWAL	47, HARI OM NAGAR, MARRIS ROAD, ALIGARH-202001 U.P	9557188400	Male	59	2021-02-27 00:00:00+00	13:08:00	ALIGARH	CA ADENOCARCINOMA OF STOMACH	3	3210096.png	9557188400,3210096,ABHIRAM AGRAWAL	t	2021-04-12 10:23:08.704435+00	\N	55	Mannual	\N	\N
36	3210095	SUNITA RANI	H.NO. 9, AGGARWAL COLONY SARAI KHURJA, FARIDABAD-121003	9718989285	Female	48	2021-02-27 00:00:00+00	12:57:00	VASANT VIHAR	METASTATIC CA OVARY	3	3210095.png	9718989285,3210095,SUNITA RANI	t	2021-04-12 11:00:48.662969+00	\N	56	Mannual	\N	\N
37	3210094	M ASHRAF	SAMBHAL	9837999643	Male	40	2021-02-27 00:00:00+00	12:49:00	VASANT VIHAR	CA LUNG (NSCLC)	3	3210094.png	9837999643,3210094,M ASHRAF	t	2021-04-12 11:07:37.075668+00	\N	57	Mannual	\N	\N
38	3210093	MRS. ANGMO	HIMACHAL PRADESH	9871663733	Female	62	2021-02-28 00:00:00+00	12:30:00	CHANDIGARH	CA LUNG	6	3210093.png	9871663733,3210093,MRS. ANGMO	t	2021-04-12 11:09:09.237533+00	\N	58	Mannual	\N	\N
\.


--
-- Data for Name: Patient_samplecollection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Patient_samplecollection" (id, patient_id, patient_name, address, phone, active_status, created_at, updated_at, user_id, location, diagnosis, age, sex, quantity) FROM stdin;
\.


--
-- Data for Name: Patient_splittest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Patient_splittest" (id, patient_id, split_quantity, active_status, created_at, updated_at, user_id, address, patient_name, phone, age, diagnosis, sex) FROM stdin;
\.


--
-- Data for Name: Product_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product_category" (id, category_type, category_name, category_image, active_status, created_at, updated_at, priority) FROM stdin;
6	other	HANGER	category_image/pure-masalas-pro.jpg	t	2021-04-11 15:21:29.264895+00	\N	\N
7	other	POWDER	category_image/veg-masalas-pro.jpg	t	2021-04-11 15:21:52.717095+00	2021-04-12 04:29:20.925973+00	\N
8	other	BIG PACK	category_image/masala-1.jpg	t	2021-04-11 15:22:18.007315+00	2021-04-12 04:30:24.332146+00	\N
5	product	EXOTIC RANGE	category_image/exotic-range-pro.1c414111.jpg	t	2021-04-11 15:20:16.564361+00	2021-04-13 06:24:12.170322+00	4
4	product	ASAFOETIDA	category_image/asafoetida-pro.7c10021c.jpg	t	2021-04-11 15:19:41.666817+00	2021-04-13 06:24:32.522106+00	5
2	product	NON-VEG	category_image/non-veg-masalas-pro.26c54c47.jpg	t	2021-04-11 15:18:32.317159+00	2021-04-13 06:24:56.836843+00	1
1	product	VEG	category_image/veg-masalas-pro.4f044265.jpg	t	2021-04-11 15:18:05.221537+00	2021-04-13 06:25:11.386682+00	2
3	product	PURE	category_image/masala-1_7PSOCma.jpg	t	2021-04-11 15:19:10.820932+00	2021-04-13 07:02:36.543269+00	3
\.


--
-- Data for Name: Product_contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product_contact" (id, name, company, city, state, enquiry_type, email, phone, comment, active_status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: Product_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product_product" (id, product_name, active_status, created_at, updated_at, category_id, product_image, product_desc) FROM stdin;
2	Cardamom	t	2021-04-11 17:07:30.042236+00	\N	1	product_image/cardmom.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently, the blend is less steeped in pungency. For the chicken curry, this gives the right balance between the spice elements and other ingredients in the dish. Consequently, the blend is less steeped in pungency. For the chicken curry, this gives the right balance between the spice elements and other ingredients in the dish. Consequently, the blend is less steeped in pungency.\r\n\r\nFor the chicken curry, this gives the right balance between the spice elements and other ingredients in the dish. Consequently, the blend is less steeped in pungency. For the chicken curry, this gives the right balance between the spice elements and other ingredients in the dish. Consequently, the blend is less steeped in pungency. For the chicken curry, this gives the right balance between the spice elements and other ingredients in the dish.Consequently, the blend is less steeped in pungency.
3	Cloves	t	2021-04-11 17:11:01.372164+00	\N	1	product_image/23.png	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
4	Black Pepper	t	2021-04-11 17:46:38.463701+00	\N	1	product_image/f0d07dcc-36e3-4c13-95ec-f63c6b6b48fb.jpeg	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
6	Jeera Powder	t	2021-04-11 17:50:15.824774+00	\N	7	product_image/79715521-f016-4a08-8d13-858c776f6898.jpeg	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
5	Kali Mirchi	t	2021-04-11 17:48:29.83876+00	2021-04-11 17:50:24.636732+00	7	product_image/23876fd2-cc58-4294-8ff2-0b088513a113.jpeg	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
64	Cardamom	t	2021-04-11 18:57:48.660412+00	\N	5	product_image/844c96f9-7630-4dc0-9320-781cc06746ea.jpeg	
7	Kashmiri Mirch Powder	t	2021-04-11 17:52:02.050046+00	\N	7	product_image/fd2e6aa8-cc1d-4896-b935-100dba459a1c.jpeg	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
8	Raw Salt Powder	t	2021-04-11 17:53:59.083775+00	\N	7	product_image/e13f9733-a442-4e21-bdbc-479cf61aedea.jpeg	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
9	Black Salt Powder	t	2021-04-11 17:54:20.884056+00	\N	7	product_image/7c49e6a4-aaeb-4bab-ad16-91c72959e7e8.jpeg	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
10	Chicken Masala	t	2021-04-11 18:03:52.732467+00	\N	7	product_image/3e7d6af0-4db2-49c4-8829-76beff96bfc3.jpeg	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
11	Fish Masala	t	2021-04-11 18:04:58.491942+00	\N	7	product_image/7c49e6a4-aaeb-4bab-ad16-91c72959e7e8_RILsz6k.jpeg	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
76	Maccroni	t	2021-04-11 19:14:47.475371+00	\N	8	product_image/6_MAebP3O.png	
78	Lal Mirchi	t	2021-04-11 19:16:20.000275+00	\N	3	product_image/15.png	
12	Mutton Masala	t	2021-04-11 18:09:14.427864+00	\N	7	product_image/1.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
13	Sahi Paneer Masala	t	2021-04-11 18:09:54.293522+00	\N	7	product_image/496c77cd-9e46-404f-ac0f-79f2f703620e.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
14	Matar Paneer Masala	t	2021-04-11 18:10:19.703572+00	\N	7	product_image/0973f8ad-f52a-41b1-9bad-b18dddf22c91.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
15	Soya Chaap Masala	t	2021-04-11 18:13:23.781158+00	\N	7	product_image/fd2e6aa8-cc1d-4896-b935-100dba459a1c_5zMAVfX.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
16	Chaat Masala	t	2021-04-11 18:14:09.624034+00	\N	7	product_image/f37439e3-9195-4392-9367-052be17e26d3.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
79	Lal Mirchi	t	2021-04-11 19:16:36.61237+00	\N	6	product_image/15_ML51f3W.png	
80	Gola Gaddi	t	2021-04-11 19:16:52.482765+00	\N	6	product_image/18.png	
81	Dry Fruits	t	2021-04-11 19:17:13.652125+00	\N	6	product_image/16.png	
82	Badam	t	2021-04-11 19:17:37.42369+00	\N	6	product_image/11.png	
17	Deggi Mirch Powder	t	2021-04-11 18:15:15.886132+00	\N	7	product_image/e13f9733-a442-4e21-bdbc-479cf61aedea_H4Veohp.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
18	Garam Masala Powder	t	2021-04-11 18:15:35.692004+00	\N	7	product_image/c7d6ae78-3628-464a-9402-0a0dacc0c506.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
19	Pav Bhaji Masala	t	2021-04-11 18:15:57.779095+00	\N	7	product_image/06477926-134b-4e92-9edf-38554eada716.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
20	Daal Makhani Masala	t	2021-04-11 18:16:20.723551+00	\N	7	product_image/7886af81-a452-4e6f-abd2-96461aa01241.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
21	Dhania Powder	t	2021-04-11 18:22:44.70599+00	\N	7	product_image/f90b98d2-9b19-40ac-b04c-0af455ea0cfc.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
83	Kaju & Badam	t	2021-04-11 19:18:03.362441+00	\N	6	product_image/12.png	
84	Hing	t	2021-04-11 19:18:28.306417+00	2021-04-11 19:19:15.051642+00	4	product_image/19_MlWaOWQ.png	
85	Badi Hing	t	2021-04-11 19:19:40.759573+00	\N	4	product_image/19_0Q6cusm.png	
22	Laal Mirch Powder	t	2021-04-11 18:23:16.917345+00	\N	7	product_image/dd89fa97-5eb4-4bda-93b5-867a0e7b7cf8.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
23	Sabji Masala	t	2021-04-11 18:23:39.302071+00	\N	7	product_image/cad78023-97b4-4ac7-9051-522cd2250a93.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
24	Rajma Masala	t	2021-04-11 18:24:05.28707+00	\N	7	product_image/9721974a-3e4a-40a6-a5ec-e87ec863f744.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
25	Raita  Masala	t	2021-04-11 18:24:33.26471+00	\N	7	product_image/44885b2f-7347-4c36-b905-8ba80dd9607f.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
26	Amchur Powder	t	2021-04-11 18:24:52.503723+00	\N	7	product_image/478ef3b2-92aa-4fba-92ce-3b00cf56ad72.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
86	Kishmish	t	2021-04-11 19:20:02.818468+00	\N	6	product_image/10.png	
87	Cardamom	t	2021-04-11 19:20:26.204026+00	\N	8	product_image/8.png	
88	Star Ful	t	2021-04-11 19:22:50.942123+00	\N	8	product_image/9.png	
89	Elaichi	t	2021-04-11 19:23:33.620538+00	\N	8	product_image/8_GGUY6po.png	
27	Chhole Masala	t	2021-04-11 18:25:10.566403+00	\N	7	product_image/9f4e9fb4-be51-434c-bb7d-aa9d7712b4dd.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
28	Meetha Soda Powder	t	2021-04-11 18:25:30.773563+00	\N	7	product_image/7d7163e8-3d7a-4842-8663-2401eed79d9a.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
29	Haldi Powder	t	2021-04-11 18:25:55.507624+00	\N	7	product_image/2bf0c94e-0cb2-474a-bbea-df891823bbaf.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
30	Dhania Powder	t	2021-04-11 18:33:46.278086+00	\N	1	product_image/f90b98d2-9b19-40ac-b04c-0af455ea0cfc_gLmoDPH.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
31	Sabji Masala	t	2021-04-11 18:34:04.380295+00	\N	1	product_image/cad78023-97b4-4ac7-9051-522cd2250a93_woiW2RS.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
90	Khas Khas	t	2021-04-11 19:27:23.672482+00	\N	8	product_image/Screenshot_from_2021-04-12_00-53-51.png	
91	Laal Mirch Sabut	t	2021-04-11 19:28:20.431715+00	\N	8	product_image/Screenshot_from_2021-04-12_00-53-58.png	
32	Raita  Masala	t	2021-04-11 18:34:25.72305+00	\N	1	product_image/44885b2f-7347-4c36-b905-8ba80dd9607f_FNchW8z.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
33	Amchur Powder	t	2021-04-11 18:34:43.937594+00	\N	1	product_image/478ef3b2-92aa-4fba-92ce-3b00cf56ad72_iPJfJee.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
34	Rajma Masala	t	2021-04-11 18:34:55.461656+00	\N	1	product_image/0c1455d4-3777-40c3-8880-5fa0764cd17f.jpeg	
35	Chaat Masala	t	2021-04-11 18:35:23.442825+00	\N	1	product_image/f37439e3-9195-4392-9367-052be17e26d3_bvqHZ1e.jpeg	
36	Pav Bhaji Masala	t	2021-04-11 18:35:37.398094+00	\N	1	product_image/06477926-134b-4e92-9edf-38554eada716_nfdPUsx.jpeg	
37	Sahi Paneer Masala	t	2021-04-11 18:36:00.187493+00	\N	1	product_image/496c77cd-9e46-404f-ac0f-79f2f703620e_AFvcReF.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
38	Jeera Powder	t	2021-04-11 18:36:20.015935+00	\N	1	product_image/79715521-f016-4a08-8d13-858c776f6898_GVfteTH.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
39	Kali Mirchi	t	2021-04-11 18:36:37.266339+00	\N	1	product_image/23876fd2-cc58-4294-8ff2-0b088513a113_1caYIMl.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
40	Haldi Powder	t	2021-04-11 18:36:57.007888+00	\N	1	product_image/2bf0c94e-0cb2-474a-bbea-df891823bbaf_MiPDJfE.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
41	Soya Chaap Masala	t	2021-04-11 18:37:19.255375+00	\N	2	product_image/fd2e6aa8-cc1d-4896-b935-100dba459a1c_c1XUECt.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
42	Mutton Masala	t	2021-04-11 18:37:33.403229+00	\N	2	product_image/1_hvmqqCf.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
43	Fish Masala	t	2021-04-11 18:37:49.03409+00	\N	2	product_image/7c49e6a4-aaeb-4bab-ad16-91c72959e7e8_veVAuUb.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
44	Chicken Masala	t	2021-04-11 18:38:06.67902+00	\N	2	product_image/3e7d6af0-4db2-49c4-8829-76beff96bfc3_z2PXIOX.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
47	Methi Dana	t	2021-04-11 18:45:56.376917+00	\N	6	product_image/7f581ecd-7256-4e8c-a3aa-034d99a57517_0zgYhEY.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
48	Black Saunf	t	2021-04-11 18:47:02.420101+00	2021-04-13 07:20:13.131346+00	3	product_image/8e9ec6f7-4eda-4038-becf-2e47c7c55c72.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
46	Methi Dana	t	2021-04-11 18:45:33.014472+00	2021-04-13 07:20:45.996639+00	3	product_image/7f581ecd-7256-4e8c-a3aa-034d99a57517.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
50	Yellow Mustred	t	2021-04-11 18:48:04.908096+00	\N	6	product_image/53c785d8-5340-41cc-be02-323303ea4bc4_hocaxGP.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
53	Sabut Dhania	t	2021-04-11 18:49:51.33094+00	\N	6	product_image/97f2f7e2-1046-4a7c-806a-74df6716013e_OrWNSxW.jpeg	
51	Jeera	t	2021-04-11 18:48:47.133394+00	2021-04-13 07:18:55.167848+00	3	product_image/61a18cc2-11ad-4480-94a2-cca56d0d447b.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
49	Yellow Mustred	t	2021-04-11 18:47:49.590753+00	2021-04-13 07:20:28.850559+00	3	product_image/53c785d8-5340-41cc-be02-323303ea4bc4.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
56	Mitha Soda	t	2021-04-11 18:51:39.595699+00	\N	6	product_image/354020c9-ccf4-43d2-84d6-d28f29b53772_WCrgOHZ.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
57	Ajwain	t	2021-04-11 18:52:49.738309+00	\N	6	product_image/acb635a1-2f40-4725-bba6-77db3fdb07f3.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
60	Rai	t	2021-04-11 18:53:48.194434+00	\N	6	product_image/cd3b8acf-b4f6-4ca2-a4bd-9ba7c6bb3e4c_nN7QhHn.jpeg	
61	Aam Chur	t	2021-04-11 18:54:22.446017+00	2021-04-11 18:54:52.920458+00	6	product_image/cfb824e5-ac30-432a-8a75-d9e5141e8b17.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
63	Kali Mirchi	t	2021-04-11 18:57:32.683406+00	\N	5	product_image/5b5487a1-4ef7-40da-a21c-ed2c4f62e2f5.jpeg	
65	Cloves	t	2021-04-11 18:58:04.706654+00	\N	5	product_image/9d1fd95e-a42c-4e87-a8e4-533dbd329c62.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
66	Jeera	t	2021-04-11 18:58:25.739608+00	\N	5	product_image/50210c22-82fc-4033-a437-1b591a6592e0.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
67	Peanuts	t	2021-04-11 19:01:08.244395+00	\N	8	product_image/3.png	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
68	Peanuts	t	2021-04-11 19:01:38.614947+00	\N	3	product_image/3_lJpj47I.png	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
69	Dhania	t	2021-04-11 19:02:07.406482+00	\N	8	product_image/2.png	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
71	Kaju	t	2021-04-11 19:02:59.858048+00	\N	3	product_image/4.png	
72	Kaju	t	2021-04-11 19:03:17.216269+00	\N	8	product_image/4_0uFugKo.png	
74	Kali Mirchi	t	2021-04-11 19:03:56.359291+00	\N	8	product_image/5_ZDJtmEA.png	
92	Magaj	t	2021-04-11 19:29:54.8975+00	\N	8	product_image/Screenshot_from_2021-04-12_00-54-02.png	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
93	Jai Fal	t	2021-04-11 19:30:38.759742+00	\N	8	product_image/Screenshot_from_2021-04-12_00-54-09.png	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
94	Mulethi	t	2021-04-11 19:31:20.551295+00	\N	8	product_image/Screenshot_from_2021-04-12_00-54-14.png	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
95	Kasturi Methi	t	2021-04-11 19:32:17.541913+00	2021-04-11 19:32:30.17124+00	8	product_image/Screenshot_from_2021-04-12_00-54-26.png	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
96	Badi Elaichi	t	2021-04-11 19:33:07.49872+00	\N	8	product_image/Screenshot_from_2021-04-12_00-54-30.png	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
97	Jeera	t	2021-04-11 19:33:44.382711+00	\N	8	product_image/Screenshot_from_2021-04-12_00-54-35.png	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
98	Pasta	t	2021-04-11 19:34:12.626296+00	\N	8	product_image/Screenshot_from_2021-04-12_00-54-40.png	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
100	Alsi	t	2021-04-11 19:35:31.128784+00	\N	8	product_image/Screenshot_from_2021-04-12_00-54-46.png	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
101	Alsi	t	2021-04-11 19:35:45.083643+00	\N	3	product_image/Screenshot_from_2021-04-12_00-54-46_AtX3mKI.png	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
102	Kaala Til	t	2021-04-11 19:36:29.633717+00	\N	8	product_image/Screenshot_from_2021-04-12_00-54-48.png	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
105	Kali Sarso	t	2021-04-11 19:37:54.913173+00	\N	8	product_image/Screenshot_from_2021-04-12_00-54-54.png	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
106	Kaali Sarso	t	2021-04-11 19:38:14.022743+00	\N	3	product_image/Screenshot_from_2021-04-12_00-54-54_FTzfiYg.png	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
103	Kalonji	t	2021-04-11 19:36:49.473006+00	2021-04-13 07:41:41.973116+00	3	product_image/Screenshot_from_2021-04-12_00-54-48_LpQG7q9.png	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
107	Chia Seeds	t	2021-04-11 19:38:52.95849+00	\N	8	product_image/Screenshot_from_2021-04-12_00-54-57.png	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
45	Black Mustred	t	2021-04-11 18:44:25.499998+00	2021-04-13 07:19:56.395149+00	3	product_image/5ca53994-f0c6-4c54-b335-6ec5f448ece1.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
109	Kaali Mirch	t	2021-04-13 07:33:58.327731+00	\N	3	product_image/Screenshot_from_2021-04-13_13-00-21.png	
110	Sabut Dana	t	2021-04-13 07:35:06.963334+00	\N	3	product_image/Screenshot_from_2021-04-13_12-57-52.png	
111	Jeera	t	2021-04-13 07:35:42.521386+00	\N	3	product_image/Screenshot_from_2021-04-13_12-20-40.png	
112	Elaichi	t	2021-04-13 07:35:57.523873+00	\N	3	product_image/Screenshot_from_2021-04-13_12-17-39.png	
113	Saunf	t	2021-04-13 07:37:14.992031+00	\N	3	product_image/Screenshot_from_2021-04-13_13-05-35.png	
99	Kalaunji	t	2021-04-11 19:34:50.074403+00	2021-04-13 07:43:11.695914+00	8	product_image/Screenshot_from_2021-04-12_00-54-44.png	n this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
54	Kalaunji	t	2021-04-11 18:50:40.327851+00	2021-04-13 07:43:43.595483+00	6	product_image/839a5536-acd3-49e8-9e61-99e871c3bfe8.jpeg	In this blend, the flavouring agents marginally predominate the taste elements. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish. Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.\r\n\r\nConsequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.\r\n\r\nFor chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency. For chicken curry, this gives the right balance between the spice-elements and other ingredients in the dish.Consequently the blend is less steeped in pungency.
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add bookmark	1	add_bookmark
2	Can change bookmark	1	change_bookmark
3	Can delete bookmark	1	delete_bookmark
4	Can view bookmark	1	view_bookmark
5	Can add pinned application	2	add_pinnedapplication
6	Can change pinned application	2	change_pinnedapplication
7	Can delete pinned application	2	delete_pinnedapplication
8	Can view pinned application	2	view_pinnedapplication
9	Can add user dashboard module	3	add_userdashboardmodule
10	Can change user dashboard module	3	change_userdashboardmodule
11	Can delete user dashboard module	3	delete_userdashboardmodule
12	Can view user dashboard module	3	view_userdashboardmodule
13	Can add log entry	4	add_logentry
14	Can change log entry	4	change_logentry
15	Can delete log entry	4	delete_logentry
16	Can view log entry	4	view_logentry
17	Can add permission	5	add_permission
18	Can change permission	5	change_permission
19	Can delete permission	5	delete_permission
20	Can view permission	5	view_permission
21	Can add group	6	add_group
22	Can change group	6	change_group
23	Can delete group	6	delete_group
24	Can view group	6	view_group
25	Can add user	7	add_user
26	Can change user	7	change_user
27	Can delete user	7	delete_user
28	Can view user	7	view_user
29	Can add content type	8	add_contenttype
30	Can change content type	8	change_contenttype
31	Can delete content type	8	delete_contenttype
32	Can view content type	8	view_contenttype
33	Can add session	9	add_session
34	Can change session	9	change_session
35	Can delete session	9	delete_session
36	Can view session	9	view_session
37	Can add Token	10	add_token
38	Can change Token	10	change_token
39	Can delete Token	10	delete_token
40	Can view Token	10	view_token
41	Can add Area	11	add_areamaster
42	Can change Area	11	change_areamaster
43	Can delete Area	11	delete_areamaster
44	Can view Area	11	view_areamaster
45	Can add User Type	12	add_usertype
46	Can change User Type	12	change_usertype
47	Can delete User Type	12	delete_usertype
48	Can view User Type	12	view_usertype
49	Can add Customer	13	add_customerprofile
50	Can change Customer	13	change_customerprofile
51	Can delete Customer	13	delete_customerprofile
52	Can view Customer	13	view_customerprofile
53	Can add Patient	14	add_patient
54	Can change Patient	14	change_patient
55	Can delete Patient	14	delete_patient
56	Can view Patient	14	view_patient
57	Can add SplitTest	15	add_splittest
58	Can change SplitTest	15	change_splittest
59	Can delete SplitTest	15	delete_splittest
60	Can view SplitTest	15	view_splittest
61	Can add SampleCollection	16	add_samplecollection
62	Can change SampleCollection	16	change_samplecollection
63	Can delete SampleCollection	16	delete_samplecollection
64	Can view SampleCollection	16	view_samplecollection
65	Can add PaidAmount	17	add_paidamount
66	Can change PaidAmount	17	change_paidamount
67	Can delete PaidAmount	17	delete_paidamount
68	Can view PaidAmount	17	view_paidamount
69	Can add Inscusion Out	18	add_inscusionout
70	Can change Inscusion Out	18	change_inscusionout
71	Can delete Inscusion Out	18	delete_inscusionout
72	Can view Inscusion Out	18	view_inscusionout
73	Can add Super Admin	19	add_company
74	Can change Super Admin	19	change_company
75	Can delete Super Admin	19	delete_company
76	Can view Super Admin	19	view_company
77	Can add Category	20	add_category
78	Can change Category	20	change_category
79	Can delete Category	20	delete_category
80	Can view Category	20	view_category
81	Can add Product	21	add_product
82	Can change Product	21	change_product
83	Can delete Product	21	delete_product
84	Can view Product	21	view_product
85	Can add Contact	22	add_contact
86	Can change Contact	22	change_contact
87	Can delete Contact	22	delete_contact
88	Can view Contact	22	view_contact
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$216000$gBMqjVuRbZxd$IWFOdrX/OE5XmFo7oiqaqxxKXm3rbc7LAp7kcfuGosk=	2021-04-07 16:36:51.564256+00	t	kusum				t	t	2021-04-07 16:36:41.101461+00
31	pbkdf2_sha256$216000$qWhvffzvmSab$b9LaGCQRk9WzAmmTGLVOYR6yp9/ow6Cs99o9wynIPWY=	\N	f	4210126				f	t	2021-04-12 09:24:26.972658+00
32	pbkdf2_sha256$216000$uHEf5PYWXUwE$/pSKVzf3ejpR5vhULALjaK0jYcgOPcycxbJLsokpyys=	\N	f	4210121				f	t	2021-04-12 09:32:03.513595+00
33	pbkdf2_sha256$216000$MVMSRMbHAYZD$rc0XZj97aepZMcamexPozLR/zj2Oo6uHCWDOnOW8ahU=	\N	f	3210119				f	t	2021-04-12 09:33:45.729117+00
34	pbkdf2_sha256$216000$FJHUcjVGlbbH$V94uxlfXlnLNvLaj0+EDg+RQOyA7auB8rte484mJiV8=	\N	f	3210117				f	t	2021-04-12 09:35:41.588618+00
35	pbkdf2_sha256$216000$dY0LLEbrbKML$8TGpK4IKCj2yKZsQ1Wu/gq4XNDEdHDbUMN29NbUY4Pg=	\N	f	3210116				f	t	2021-04-12 09:37:47.33907+00
36	pbkdf2_sha256$216000$UcsI2aqdVtiu$/jwqyJKcIa8sUjwmiCs1Kxww4bDFtWxqcebSv3Gomr4=	\N	f	3210115				f	t	2021-04-12 09:40:32.99288+00
37	pbkdf2_sha256$216000$leZvY0bUU5yX$Cegl1Cl6f/VMKesDFJ8yV9pdFBdSMIew00z+T/2LH1w=	\N	f	3210114				f	t	2021-04-12 09:42:24.392756+00
38	pbkdf2_sha256$216000$nqkiFHm0U8aI$GdeGUs9g3MWgT2hRJ/x3E4jftIkO3rlg7raTuFUgRsk=	\N	f	3210113				f	t	2021-04-12 09:46:56.552491+00
39	pbkdf2_sha256$216000$P1Jn9VMHGu8n$0Ivh4uhXcYy1uiLM5gtEZ+whVhKF3lgbNNgnxBnvRrM=	\N	f	3210112				f	t	2021-04-12 09:48:17.071421+00
40	pbkdf2_sha256$216000$wnkui21g294l$25E4Lgy9JW3d+KU0Wb/OHLR33dMdirnzLxIGy8PuTJM=	\N	f	3210111				f	t	2021-04-12 09:51:00.978755+00
41	pbkdf2_sha256$216000$RYfWJ1gbeBB5$mDW95J6s9Re5NnOeDLPjwdMoTQmK4TcY/Rf+ZFLQtoo=	\N	f	3210110				f	t	2021-04-12 09:53:22.987546+00
42	pbkdf2_sha256$216000$qbHGrrmIsifs$uzZqrTHvXEv7ihhxl5NBCas5gYxQst4KFtKs5hkOo2E=	\N	f	3210109				f	t	2021-04-12 09:55:10.455077+00
43	pbkdf2_sha256$216000$WM8pS59Lc7ET$movPbjZjmLMAy516jxqt3qYg50V0BlwCcoYfa7yhCS0=	\N	f	3210108				f	t	2021-04-12 09:56:46.026983+00
4	pbkdf2_sha256$216000$znGshlOieVo0$t3Cz9h5HOagDxEbUZkW9pWkTClnvyW5n8qvcbNoJDeQ=	2021-04-12 06:02:51.67233+00	f	rahul				f	t	2021-04-12 05:36:34.386957+00
44	pbkdf2_sha256$216000$LuHASFr50MX9$H29hgZ3L1PwhRDNA8j+4vsUTwZsZGx7wMlMMesvx4ew=	\N	f	3210107				f	t	2021-04-12 09:58:13.374294+00
45	pbkdf2_sha256$216000$wcuFVRewZhj4$SSNmuj0bmjPJOmOTyZAl+AAVfUBoyGL+utzmj8fdZI0=	\N	f	3210106				f	t	2021-04-12 09:59:25.940086+00
8	pbkdf2_sha256$216000$hKztQVlmaDsV$B4ArZtcWHEiS8jOCC+rQ0q7T2YBEt8kcvwQliMcBS7s=	2021-04-12 11:34:55.160235+00	f	Udaiveer				f	t	2021-04-12 06:17:34.361366+00
5	pbkdf2_sha256$216000$TiprvqTA5QMz$IrvR9XQJB3JLlJ7wLRx6W3G98vp+YBgq7wBU9rzcIs4=	\N	f	Ravi				f	t	2021-04-12 06:14:46.817856+00
7	pbkdf2_sha256$216000$UPxPtFJUaSr7$DE5BigKC1xNIWVcVVH+vthQ+dbGP0apeACffYP3sxVA=	\N	f	Devendra				f	t	2021-04-12 06:16:40.957282+00
46	pbkdf2_sha256$216000$taECgrIyPA7v$Em+8EUqs6J7CJMZFpWlPJPuzyYqacR+uxsuVg21b8hg=	\N	f	3210105				f	t	2021-04-12 10:02:35.414715+00
9	pbkdf2_sha256$216000$Y4fx2aQm5z07$ptSKoEigCx23LGE3Kbb93drX5He2IUzamEgXRWEHKao=	\N	f	Neeraj				f	t	2021-04-12 06:22:21.061216+00
10	pbkdf2_sha256$216000$JFc22ZM907jK$AKx4KIfo8OYLvRzdD0m+gTBl0LO9LYvhVWo90QEbhNs=	\N	f	Tauquir				f	t	2021-04-12 06:23:56.372504+00
12	pbkdf2_sha256$216000$hICkvUpNz1bA$tPSV/HvYO/m2EXcKkq0/NW6XyDpr4VYWCDANmXBCCUY=	\N	f	Shahid				f	t	2021-04-12 06:25:39.537015+00
11	pbkdf2_sha256$216000$DTEg7aYtVExZ$ml/tkxt1+Ekqzk/sIzuYeSyZPA0hZCYL0dT0blbo+DA=	2021-04-12 06:26:01.154101+00	f	Taak				f	t	2021-04-12 06:24:52.616029+00
13	pbkdf2_sha256$216000$rNSgsI3L9HH4$0zDOd8puXxYmHE5fDPmZ+c4Rx9bLQB68rsbs74M0ukA=	2021-04-12 12:54:07.289864+00	t	umesh				t	t	2021-04-12 07:06:57.941602+00
14	pbkdf2_sha256$216000$qN0xM7aJbsAA$TeCi+XxV/3UGURGP9wdSA2l06HKxrK1sAYuJIKsInIw=	\N	f	4210135				f	t	2021-04-12 09:03:38.318054+00
6	pbkdf2_sha256$216000$yDaZV9iroQ0P$b2xH42ufd+B/DYF7gvco0gxnmevUv6wwymqjHbXqp0Y=	2021-04-12 13:05:47.166083+00	f	Manoj				f	t	2021-04-12 06:15:37.169143+00
20	pbkdf2_sha256$216000$mVaZA7KQwtY9$1KD0mnMKjIOhMsXUVO3pBl6thznD3wXS6441/1yqXdo=	\N	f	4210134				f	t	2021-04-12 09:08:55.760377+00
21	pbkdf2_sha256$216000$TxY08BnlUiNT$UHA74qT0uHlPUmow03l0U1DXeyAtevT+yDD0vhToo6U=	\N	f	4210133				f	t	2021-04-12 09:10:40.697781+00
22	pbkdf2_sha256$216000$i5QEUioYBwwY$eDqLEdfDKMoWfty0B6qPa8WZ+lHeggLhiaCxuAbKEjE=	\N	f	4210132				f	t	2021-04-12 09:12:57.226274+00
23	pbkdf2_sha256$216000$zSenS8SNAk9w$w9x8yC1MuhMYTO95e3yKY6qjcmt/qs5mxMSj9OhkmYc=	\N	f	4210131				f	t	2021-04-12 09:15:33.904124+00
26	pbkdf2_sha256$216000$PfjtqsFJ641j$UyMncG+Wn8CKxqjNTp4ChjBva2p3+DpzQb/rdUv4Lrg=	\N	f	4210130				f	t	2021-04-12 09:17:33.103137+00
27	pbkdf2_sha256$216000$PTdA7K6L0Wir$0wAw711UWdeMCVQP5mwMHuUYqxDSfo0CrFUI2FrpKlc=	\N	f	4210129				f	t	2021-04-12 09:19:00.536488+00
28	pbkdf2_sha256$216000$8IMsNVDs5WBK$RNlLcR9/eBcZy3FjA5j1Y4YxENZLI4f2fCgeSLWdzvw=	\N	f	4210128				f	t	2021-04-12 09:21:26.480206+00
29	pbkdf2_sha256$216000$BHN22aURGv9U$yBMNfOEX/FnmcAS+2rHDSe4nsrT4KyHAz1I/BH/tXaQ=	\N	f	4210127				f	t	2021-04-12 09:22:47.498817+00
47	pbkdf2_sha256$216000$zvGuCsKuZs8G$AuzZ/iV7l0tqppze+PszSwc6waU0ljYgziICU0Qijig=	\N	f	3210104				f	t	2021-04-12 10:04:08.44604+00
48	pbkdf2_sha256$216000$Pdiu3V1rmLG1$Met9aqTdYe4i7MhYwuY9BXZR/PcANrcycF3bzXluyTs=	\N	f	3210103				f	t	2021-04-12 10:05:53.891638+00
49	pbkdf2_sha256$216000$0FHaoiuT5DM0$H5gIt/YoE/y3gImM9YKJfltQSe46YL6ori1ZDk93P3Y=	\N	f	3210102				f	t	2021-04-12 10:10:07.423873+00
50	pbkdf2_sha256$216000$HyAagajzD7WT$o7Eq9yk+Odvv/keS11lnr5Q6UrI3Ty92eDUkUn+13Ok=	\N	f	3210101				f	t	2021-04-12 10:12:09.224752+00
51	pbkdf2_sha256$216000$a7m62yHxBXoB$ddNjTHYmuJCbBR2ajDF7dArVswcYjrIHOCJeKVthtJI=	\N	f	3210100				f	t	2021-04-12 10:17:04.06353+00
52	pbkdf2_sha256$216000$JLEI9B1o6z6A$fU8Pqgj/tuQ0lEgKGgJrnNcit3roObrP1xuZC3Zx6eI=	\N	f	3210099				f	t	2021-04-12 10:18:21.63362+00
53	pbkdf2_sha256$216000$eId6gmJEFUF7$hy3sUUvDEQBInn5uc7GYUMaBYROJR4N3CaMIINF11yY=	\N	f	3210098				f	t	2021-04-12 10:19:30.131608+00
54	pbkdf2_sha256$216000$DBe43fs0q7LI$/J5CIJ/GkdZ023TPzLaxLFksdT+C0LSVp2GKAZYIW/s=	\N	f	3210097				f	t	2021-04-12 10:21:21.619213+00
55	pbkdf2_sha256$216000$JQZkktkLp22c$fCobt0fybrPDyrzOA7NfM5bzjoJ4rwisV6H8OwoIVsE=	\N	f	3210096				f	t	2021-04-12 10:23:08.581578+00
56	pbkdf2_sha256$216000$jSST2ka0VNGh$o1pX+/zHPnexQdFrO8gJj5uHWZ/ipq/GnnsG0zjHuG4=	\N	f	3210095				f	t	2021-04-12 11:00:48.535073+00
57	pbkdf2_sha256$216000$z1vyxPeS0n0z$2NGXEY2XQ7Vc6dC9D9u8N4vTHXyABbNxn4a1GecAzjs=	\N	f	3210094				f	t	2021-04-12 11:07:36.919777+00
58	pbkdf2_sha256$216000$hokAWcIaSl9N$Yy2uYJqPbSeY7BmhZdyV7Y437hG2G0IwklM7ujmti5k=	\N	f	3210093				f	t	2021-04-12 11:09:09.110495+00
3	pbkdf2_sha256$216000$46b4C31vZuJN$xTYWBC+NujX/pz3Uzb7fwjB8WKHNvCDSkQQix8Qc+3o=	2021-04-12 11:21:18.973597+00	f	Rajkumar				f	t	2021-04-12 05:33:03.407661+00
2	pbkdf2_sha256$216000$udetbNNT56zB$6KrnKOPD7gk8Agp7iSd3R/XMcMpsCMm+L0ic4nyCIQQ=	2021-04-12 17:30:06.373435+00	t	nitesh				t	t	2021-04-07 16:48:40.255523+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
ffc83021497913a07d114da78996e58479f38622	2021-04-12 08:01:57.306054+00	13
62e0d89ed08257b37327129ac2d9c6db67885eb2	2021-04-12 11:21:18.976807+00	3
3e458f2d1864556d33f16eccd4a02c8ea159a7ea	2021-04-12 13:05:47.170122+00	6
373d59aad610b522769b4b5b41069c5b90b9e223	2021-04-12 17:30:06.378151+00	2
\.


--
-- Data for Name: dashboard_userdashboardmodule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dashboard_userdashboardmodule (id, title, module, app_label, "user", "column", "order", settings, children, collapsed) FROM stdin;
1	Quick links	jet.dashboard.modules.LinkList	\N	1	0	0	{"draggable": false, "deletable": false, "collapsible": false, "layout": "inline"}	[{"title": "Return to site", "url": "/"}, {"title": "Change password", "url": "/password_change/"}, {"title": "Log out", "url": "/logout/"}]	f
2	Applications	jet.dashboard.modules.AppList	\N	1	1	0	{"models": null, "exclude": ["auth.*"]}		f
3	Administration	jet.dashboard.modules.AppList	\N	1	2	0	{"models": ["auth.*"], "exclude": null}		f
4	Recent Actions	jet.dashboard.modules.RecentActions	\N	1	0	1	{"limit": 10, "include_list": null, "exclude_list": null, "user": null}		f
5	Latest Django News	jet.dashboard.modules.Feed	\N	1	1	1	{"feed_url": "http://www.djangoproject.com/rss/weblog/", "limit": 5}		f
6	Support	jet.dashboard.modules.LinkList	\N	1	2	1	{"draggable": true, "deletable": true, "collapsible": true, "layout": "stacked"}	[{"title": "Django documentation", "url": "http://docs.djangoproject.com/", "external": true}, {"title": "Django \\"django-users\\" mailing list", "url": "http://groups.google.com/group/django-users", "external": true}, {"title": "Django irc channel", "url": "irc://irc.freenode.net/django", "external": true}]	f
7	Quick links	jet.dashboard.modules.LinkList	\N	2	0	0	{"draggable": false, "deletable": false, "collapsible": false, "layout": "inline"}	[{"title": "Return to site", "url": "/"}, {"title": "Change password", "url": "/password_change/"}, {"title": "Log out", "url": "/logout/"}]	f
8	Applications	jet.dashboard.modules.AppList	\N	2	1	0	{"models": null, "exclude": ["auth.*"]}		f
9	Administration	jet.dashboard.modules.AppList	\N	2	2	0	{"models": ["auth.*"], "exclude": null}		f
10	Recent Actions	jet.dashboard.modules.RecentActions	\N	2	0	1	{"limit": 10, "include_list": null, "exclude_list": null, "user": null}		f
11	Latest Django News	jet.dashboard.modules.Feed	\N	2	1	1	{"feed_url": "http://www.djangoproject.com/rss/weblog/", "limit": 5}		f
12	Support	jet.dashboard.modules.LinkList	\N	2	2	1	{"draggable": true, "deletable": true, "collapsible": true, "layout": "stacked"}	[{"title": "Django documentation", "url": "http://docs.djangoproject.com/", "external": true}, {"title": "Django \\"django-users\\" mailing list", "url": "http://groups.google.com/group/django-users", "external": true}, {"title": "Django irc channel", "url": "irc://irc.freenode.net/django", "external": true}]	f
13	Application models	jet.dashboard.modules.ModelList	Product	2	0	0	{"models": ["Product.*"], "exclude": null}		f
14	Recent Actions	jet.dashboard.modules.RecentActions	Product	2	1	0	{"limit": 10, "include_list": ["Product.*"], "exclude_list": null, "user": null}		f
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-04-07 16:41:25.046227+00	1	SuperAdmin	1	[{"added": {}}]	12	1
2	2021-04-07 16:41:46.968257+00	2	Employee	1	[{"added": {}}]	12	1
3	2021-04-07 16:42:02.400359+00	3	User	1	[{"added": {}}]	12	1
4	2021-04-07 16:49:51.645684+00	1	Sonipath	1	[{"added": {}}]	11	1
5	2021-04-07 16:50:07.029721+00	2	Noida	1	[{"added": {}}]	11	1
6	2021-04-07 16:50:22.620653+00	3	Delhi	1	[{"added": {}}]	11	1
7	2021-04-07 17:35:40.141242+00	1	IFTEKHAR KHAN	1	[{"added": {}}]	14	1
8	2021-04-07 17:43:08.942401+00	1	IFTEKHAR KHAN	2	[{"changed": {"fields": ["Date Of Collection"]}}]	14	1
9	2021-04-11 15:18:05.224317+00	1	VEG	1	[{"added": {}}]	20	2
10	2021-04-11 15:18:32.320074+00	2	NON-VEG	1	[{"added": {}}]	20	2
11	2021-04-11 15:19:10.822419+00	3	PURE	1	[{"added": {}}]	20	2
12	2021-04-11 15:19:41.668434+00	4	ASAFOETIDA	1	[{"added": {}}]	20	2
13	2021-04-11 15:20:16.566077+00	5	EXOTIC RANGE	1	[{"added": {}}]	20	2
14	2021-04-11 15:21:29.265937+00	6	HANGER	1	[{"added": {}}]	20	2
15	2021-04-11 15:21:52.718257+00	7	POWDER	1	[{"added": {}}]	20	2
16	2021-04-11 15:22:18.00929+00	8	BIG PACK	1	[{"added": {}}]	20	2
17	2021-04-11 17:07:21.061127+00	1	Cardamom	1	[{"added": {}}]	21	2
18	2021-04-11 17:07:30.043328+00	2	Cardamom	1	[{"added": {}}]	21	2
19	2021-04-11 17:09:38.441848+00	1	Cardamom	3		21	2
20	2021-04-11 17:11:01.373622+00	3	Cloves	1	[{"added": {}}]	21	2
21	2021-04-11 17:46:38.46471+00	4	Black Pepper	1	[{"added": {}}]	21	2
22	2021-04-11 17:48:29.840578+00	5	Kali Mirchi	1	[{"added": {}}]	21	2
23	2021-04-11 17:50:15.82656+00	6	Jeera Powder	1	[{"added": {}}]	21	2
24	2021-04-11 17:50:24.647285+00	5	Kali Mirchi	2	[{"changed": {"fields": ["Category"]}}]	21	2
25	2021-04-11 17:52:02.051646+00	7	Kashmiri Mirch Powder	1	[{"added": {}}]	21	2
26	2021-04-11 17:53:59.084827+00	8	Raw Salt Powder	1	[{"added": {}}]	21	2
27	2021-04-11 17:54:20.884998+00	9	Black Salt Powder	1	[{"added": {}}]	21	2
28	2021-04-11 18:03:52.733764+00	10	Chicken Masala	1	[{"added": {}}]	21	2
29	2021-04-11 18:04:58.493103+00	11	Fish Masala	1	[{"added": {}}]	21	2
30	2021-04-11 18:09:14.429338+00	12	Mutton Masala	1	[{"added": {}}]	21	2
31	2021-04-11 18:09:54.29482+00	13	Sahi Paneer Masala	1	[{"added": {}}]	21	2
32	2021-04-11 18:10:19.705613+00	14	Matar Paneer Masala	1	[{"added": {}}]	21	2
33	2021-04-11 18:13:23.782685+00	15	Soya Chaap Masala	1	[{"added": {}}]	21	2
34	2021-04-11 18:14:09.625654+00	16	Chaat Masala	1	[{"added": {}}]	21	2
35	2021-04-11 18:15:15.88712+00	17	Deggi Mirch Powder	1	[{"added": {}}]	21	2
36	2021-04-11 18:15:35.69359+00	18	Garam Masala Powder	1	[{"added": {}}]	21	2
37	2021-04-11 18:15:57.78018+00	19	Pav Bhaji Masala	1	[{"added": {}}]	21	2
38	2021-04-11 18:16:20.724778+00	20	Daal Makhani Masala	1	[{"added": {}}]	21	2
39	2021-04-11 18:22:44.707432+00	21	Dhania Powder	1	[{"added": {}}]	21	2
40	2021-04-11 18:23:16.918449+00	22	Laal Mirch Powder	1	[{"added": {}}]	21	2
41	2021-04-11 18:23:39.303366+00	23	Sabji Masala	1	[{"added": {}}]	21	2
42	2021-04-11 18:24:05.288635+00	24	Rajma Masala	1	[{"added": {}}]	21	2
43	2021-04-11 18:24:33.265744+00	25	Raita  Masala	1	[{"added": {}}]	21	2
44	2021-04-11 18:24:52.505099+00	26	Amchur Powder	1	[{"added": {}}]	21	2
45	2021-04-11 18:25:10.568041+00	27	Chhole Masala	1	[{"added": {}}]	21	2
46	2021-04-11 18:25:30.774819+00	28	Meetha Soda Powder	1	[{"added": {}}]	21	2
47	2021-04-11 18:25:55.509008+00	29	Haldi Powder	1	[{"added": {}}]	21	2
48	2021-04-11 18:33:46.279948+00	30	Dhania Powder	1	[{"added": {}}]	21	2
49	2021-04-11 18:34:04.381524+00	31	Sabji Masala	1	[{"added": {}}]	21	2
50	2021-04-11 18:34:25.72404+00	32	Raita  Masala	1	[{"added": {}}]	21	2
51	2021-04-11 18:34:43.938543+00	33	Amchur Powder	1	[{"added": {}}]	21	2
52	2021-04-11 18:34:55.46264+00	34	Rajma Masala	1	[{"added": {}}]	21	2
53	2021-04-11 18:35:23.443953+00	35	Chaat Masala	1	[{"added": {}}]	21	2
54	2021-04-11 18:35:37.399623+00	36	Pav Bhaji Masala	1	[{"added": {}}]	21	2
55	2021-04-11 18:36:00.188628+00	37	Sahi Paneer Masala	1	[{"added": {}}]	21	2
56	2021-04-11 18:36:20.017849+00	38	Jeera Powder	1	[{"added": {}}]	21	2
57	2021-04-11 18:36:37.267552+00	39	Kali Mirchi	1	[{"added": {}}]	21	2
58	2021-04-11 18:36:57.009254+00	40	Haldi Powder	1	[{"added": {}}]	21	2
59	2021-04-11 18:37:19.256639+00	41	Soya Chaap Masala	1	[{"added": {}}]	21	2
60	2021-04-11 18:37:33.404547+00	42	Mutton Masala	1	[{"added": {}}]	21	2
61	2021-04-11 18:37:49.036059+00	43	Fish Masala	1	[{"added": {}}]	21	2
62	2021-04-11 18:38:06.680709+00	44	Chicken Masala	1	[{"added": {}}]	21	2
63	2021-04-11 18:44:25.501368+00	45	Black Mustred	1	[{"added": {}}]	21	2
64	2021-04-11 18:45:33.016288+00	46	Methi Dana	1	[{"added": {}}]	21	2
65	2021-04-11 18:45:56.377989+00	47	Methi Dana	1	[{"added": {}}]	21	2
66	2021-04-11 18:47:02.421735+00	48	Black Saunf	1	[{"added": {}}]	21	2
67	2021-04-11 18:47:49.592279+00	49	Yellow Mustred	1	[{"added": {}}]	21	2
68	2021-04-11 18:48:04.909344+00	50	Yellow Mustred	1	[{"added": {}}]	21	2
69	2021-04-11 18:48:47.134695+00	51	Jeera	1	[{"added": {}}]	21	2
70	2021-04-11 18:49:30.080846+00	52	Sabut Dhania	1	[{"added": {}}]	21	2
71	2021-04-11 18:49:51.332927+00	53	Sabut Dhania	1	[{"added": {}}]	21	2
72	2021-04-11 18:50:40.329066+00	54	Kalaunji	1	[{"added": {}}]	21	2
73	2021-04-11 18:51:21.655334+00	55	Mitha Soda	1	[{"added": {}}]	21	2
74	2021-04-11 18:51:39.596974+00	56	Mitha Soda	1	[{"added": {}}]	21	2
75	2021-04-11 18:52:49.739477+00	57	Ajwain	1	[{"added": {}}]	21	2
76	2021-04-11 18:53:01.458054+00	58	Ajwain	1	[{"added": {}}]	21	2
77	2021-04-11 18:53:35.008898+00	59	Rai	1	[{"added": {}}]	21	2
78	2021-04-11 18:53:48.195484+00	60	Rai	1	[{"added": {}}]	21	2
79	2021-04-11 18:54:22.447063+00	61	Aam Chur	1	[{"added": {}}]	21	2
80	2021-04-11 18:54:52.928324+00	61	Aam Chur	2	[{"changed": {"fields": ["Image"]}}]	21	2
81	2021-04-11 18:55:07.773196+00	62	Aam Chur	1	[{"added": {}}]	21	2
82	2021-04-11 18:57:32.684577+00	63	Kali Mirchi	1	[{"added": {}}]	21	2
83	2021-04-11 18:57:48.661419+00	64	Cardamom	1	[{"added": {}}]	21	2
84	2021-04-11 18:58:04.707848+00	65	Cloves	1	[{"added": {}}]	21	2
85	2021-04-11 18:58:25.740883+00	66	Jeera	1	[{"added": {}}]	21	2
86	2021-04-11 19:01:08.245532+00	67	Peanuts	1	[{"added": {}}]	21	2
87	2021-04-11 19:01:38.616045+00	68	Peanuts	1	[{"added": {}}]	21	2
88	2021-04-11 19:02:07.407527+00	69	Dhania	1	[{"added": {}}]	21	2
89	2021-04-11 19:02:33.601696+00	70	Jeera	1	[{"added": {}}]	21	2
90	2021-04-11 19:02:59.859128+00	71	Kaju	1	[{"added": {}}]	21	2
91	2021-04-11 19:03:17.217215+00	72	Kaju	1	[{"added": {}}]	21	2
92	2021-04-11 19:03:35.76261+00	73	Kali Mirchi	1	[{"added": {}}]	21	2
93	2021-04-11 19:03:56.360504+00	74	Kali Mirchi	1	[{"added": {}}]	21	2
94	2021-04-11 19:14:02.492136+00	75	Maccroni	1	[{"added": {}}]	21	2
95	2021-04-11 19:14:47.477221+00	76	Maccroni	1	[{"added": {}}]	21	2
96	2021-04-11 19:15:11.136746+00	77	Maccroni	1	[{"added": {}}]	21	2
97	2021-04-11 19:15:22.264704+00	77	Maccroni	2	[{"changed": {"fields": ["Image"]}}]	21	2
98	2021-04-11 19:16:20.001396+00	78	Lal Mirchi	1	[{"added": {}}]	21	2
99	2021-04-11 19:16:36.613368+00	79	Lal Mirchi	1	[{"added": {}}]	21	2
100	2021-04-11 19:16:52.483773+00	80	Gola Gaddi	1	[{"added": {}}]	21	2
101	2021-04-11 19:17:13.653369+00	81	Dry Fruits	1	[{"added": {}}]	21	2
102	2021-04-11 19:17:37.425012+00	82	Badam	1	[{"added": {}}]	21	2
103	2021-04-11 19:18:03.364028+00	83	Kaju & Badam	1	[{"added": {}}]	21	2
104	2021-04-11 19:18:28.308056+00	84	Badi Hing	1	[{"added": {}}]	21	2
105	2021-04-11 19:18:47.733628+00	84	Badi Hing	2	[{"changed": {"fields": ["Image"]}}]	21	2
106	2021-04-11 19:19:15.059791+00	84	Hing	2	[{"changed": {"fields": ["Product Name"]}}]	21	2
107	2021-04-11 19:19:40.760554+00	85	Badi Hing	1	[{"added": {}}]	21	2
108	2021-04-11 19:20:02.819486+00	86	Kishmish	1	[{"added": {}}]	21	2
109	2021-04-11 19:20:26.205093+00	87	Cardamom	1	[{"added": {}}]	21	2
110	2021-04-11 19:22:50.943304+00	88	Star Ful	1	[{"added": {}}]	21	2
111	2021-04-11 19:23:33.621944+00	89	Elaichi	1	[{"added": {}}]	21	2
112	2021-04-11 19:27:23.673675+00	90	Khas Khas	1	[{"added": {}}]	21	2
113	2021-04-11 19:28:20.432847+00	91	Laal Mirch Sabut	1	[{"added": {}}]	21	2
114	2021-04-11 19:29:54.898583+00	92	Magaj	1	[{"added": {}}]	21	2
115	2021-04-11 19:30:38.761301+00	93	Jai Fal	1	[{"added": {}}]	21	2
116	2021-04-11 19:31:20.552505+00	94	Mulethi	1	[{"added": {}}]	21	2
117	2021-04-11 19:32:17.54331+00	95	Kasturi Methi	1	[{"added": {}}]	21	2
118	2021-04-11 19:32:30.180372+00	95	Kasturi Methi	2	[{"changed": {"fields": ["Category", "Product Description"]}}]	21	2
119	2021-04-11 19:33:07.499853+00	96	Badi Elaichi	1	[{"added": {}}]	21	2
120	2021-04-11 19:33:44.383948+00	97	Jeera	1	[{"added": {}}]	21	2
121	2021-04-11 19:34:12.628285+00	98	Pasta	1	[{"added": {}}]	21	2
122	2021-04-11 19:34:50.076168+00	99	Kalonji	1	[{"added": {}}]	21	2
123	2021-04-11 19:35:31.129945+00	100	Alsi	1	[{"added": {}}]	21	2
124	2021-04-11 19:35:45.084748+00	101	Alsi	1	[{"added": {}}]	21	2
125	2021-04-11 19:36:29.634823+00	102	Kaala Til	1	[{"added": {}}]	21	2
126	2021-04-11 19:36:49.474483+00	103	Kaala Til	1	[{"added": {}}]	21	2
127	2021-04-11 19:37:18.958006+00	104	Sewaiya	1	[{"added": {}}]	21	2
128	2021-04-11 19:37:54.914332+00	105	Kali Sarso	1	[{"added": {}}]	21	2
129	2021-04-11 19:38:14.023822+00	106	Kaali Sarso	1	[{"added": {}}]	21	2
130	2021-04-11 19:38:52.959913+00	107	Chia Seeds	1	[{"added": {}}]	21	2
131	2021-04-11 19:39:27.284031+00	108	Sugar	1	[{"added": {}}]	21	2
132	2021-04-12 04:13:09.898219+00	8	BIG PACK	2	[{"changed": {"fields": ["Image"]}}]	20	2
133	2021-04-12 04:16:13.457805+00	108	Sugar	3		21	2
134	2021-04-12 04:29:20.949036+00	7	POWDER	2	[{"changed": {"fields": ["Image"]}}]	20	2
135	2021-04-12 04:30:24.336338+00	8	BIG PACK	2	[{"changed": {"fields": ["Image"]}}]	20	2
136	2021-04-12 06:00:42.380967+00	3	nitesh	1	[{"added": {}}]	13	2
137	2021-04-13 06:24:12.173963+00	5	EXOTIC RANGE	2	[{"changed": {"fields": ["Priority"]}}]	20	2
138	2021-04-13 06:24:32.524359+00	4	ASAFOETIDA	2	[{"changed": {"fields": ["Priority"]}}]	20	2
139	2021-04-13 06:24:45.176422+00	3	PURE	2	[{"changed": {"fields": ["Priority"]}}]	20	2
140	2021-04-13 06:24:56.838784+00	2	NON-VEG	2	[{"changed": {"fields": ["Priority"]}}]	20	2
141	2021-04-13 06:25:11.388693+00	1	VEG	2	[{"changed": {"fields": ["Priority"]}}]	20	2
142	2021-04-13 07:02:36.554231+00	3	PURE	2	[{"changed": {"fields": ["Image"]}}]	20	2
143	2021-04-13 07:04:25.113464+00	75	Maccroni	2	[]	21	2
144	2021-04-13 07:06:09.886636+00	9	Coming soon	1	[{"added": {}}]	20	2
145	2021-04-13 07:06:49.014039+00	9	COMING SOON	2	[{"changed": {"fields": ["Category Name"]}}]	20	2
146	2021-04-13 07:10:21.002915+00	75	Maccroni	2	[{"changed": {"fields": ["Category"]}}]	21	2
147	2021-04-13 07:14:25.793618+00	54	Kalaunji	2	[{"changed": {"fields": ["Category"]}}]	21	2
148	2021-04-13 07:17:04.381209+00	62	Aam Chur	3		21	2
149	2021-04-13 07:17:04.383671+00	59	Rai	3		21	2
150	2021-04-13 07:17:04.384965+00	58	Ajwain	3		21	2
151	2021-04-13 07:17:04.386078+00	55	Mitha Soda	3		21	2
152	2021-04-13 07:17:04.386995+00	52	Sabut Dhania	3		21	2
153	2021-04-13 07:18:55.177384+00	51	Jeera	2	[{"changed": {"fields": ["Category"]}}]	21	2
154	2021-04-13 07:19:56.406834+00	45	Black Mustred	2	[{"changed": {"fields": ["Category"]}}]	21	2
155	2021-04-13 07:20:13.142902+00	48	Black Saunf	2	[{"changed": {"fields": ["Category"]}}]	21	2
156	2021-04-13 07:20:28.857956+00	49	Yellow Mustred	2	[{"changed": {"fields": ["Category"]}}]	21	2
157	2021-04-13 07:20:46.006114+00	46	Methi Dana	2	[{"changed": {"fields": ["Category"]}}]	21	2
158	2021-04-13 07:21:05.422863+00	77	Maccroni	3		21	2
159	2021-04-13 07:33:58.329016+00	109	Kaali Mirch	1	[{"added": {}}]	21	2
160	2021-04-13 07:34:16.463804+00	104	Sewaiya	2	[{"changed": {"fields": ["Category"]}}]	21	2
161	2021-04-13 07:35:06.964429+00	110	Sabut Dana	1	[{"added": {}}]	21	2
162	2021-04-13 07:35:42.522642+00	111	Jeera	1	[{"added": {}}]	21	2
163	2021-04-13 07:35:57.524987+00	112	Elaichi	1	[{"added": {}}]	21	2
164	2021-04-13 07:37:14.99324+00	113	Saunf	1	[{"added": {}}]	21	2
165	2021-04-13 07:38:10.115246+00	114	Poha	1	[{"added": {}}]	21	2
166	2021-04-13 07:39:55.40108+00	70	Jeera	3		21	2
167	2021-04-13 07:41:41.984247+00	103	Kalonji	2	[{"changed": {"fields": ["Product Name"]}}]	21	2
168	2021-04-13 07:42:31.43284+00	73	Kali Mirchi	3		21	2
169	2021-04-13 07:43:11.702637+00	99	Kalaunji	2	[{"changed": {"fields": ["Product Name"]}}]	21	2
170	2021-04-13 07:43:43.602012+00	54	Kalaunji	2	[{"changed": {"fields": ["Category"]}}]	21	2
171	2021-04-13 07:47:44.090008+00	115	Maccroni	1	[{"added": {}}]	21	2
172	2021-04-13 07:48:50.171491+00	75	Pasta	2	[{"changed": {"fields": ["Product Name"]}}]	21	2
173	2021-04-13 08:04:10.137354+00	9	COMING SOON	2	[{"changed": {"fields": ["Image"]}}]	20	2
174	2021-04-14 14:40:48.83966+00	9	COMING SOON	3		20	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	jet	bookmark
2	jet	pinnedapplication
3	dashboard	userdashboardmodule
4	admin	logentry
5	auth	permission
6	auth	group
7	auth	user
8	contenttypes	contenttype
9	sessions	session
10	authtoken	token
11	Configuration	areamaster
12	Configuration	usertype
13	Customer	customerprofile
14	Patient	patient
15	Patient	splittest
16	Patient	samplecollection
17	Patient	paidamount
18	Patient	inscusionout
19	Company	company
20	Product	category
21	Product	product
22	Product	contact
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-04-07 16:18:11.7176+00
2	auth	0001_initial	2021-04-07 16:18:11.758645+00
3	Configuration	0001_initial	2021-04-07 16:18:11.801808+00
4	Company	0001_initial	2021-04-07 16:18:11.824604+00
5	Configuration	0002_auto_20210206_1557	2021-04-07 16:18:11.843037+00
6	Customer	0001_initial	2021-04-07 16:18:11.868484+00
7	Customer	0002_auto_20210204_0909	2021-04-07 16:18:11.903431+00
8	Customer	0003_auto_20210206_1557	2021-04-07 16:18:11.931635+00
9	Customer	0004_auto_20210209_0653	2021-04-07 16:18:11.953966+00
10	Patient	0001_initial	2021-04-07 16:18:11.983618+00
11	Patient	0002_patient_patient_type	2021-04-07 16:18:12.008586+00
12	Patient	0003_auto_20210208_0419	2021-04-07 16:18:12.028749+00
13	Patient	0004_splittest	2021-04-07 16:18:12.060534+00
14	Patient	0005_auto_20210208_1036	2021-04-07 16:18:12.106666+00
15	Patient	0006_auto_20210208_1634	2021-04-07 16:18:12.130861+00
16	Patient	0007_samplecollection	2021-04-07 16:18:12.167298+00
17	Patient	0008_auto_20210209_0630	2021-04-07 16:18:12.222595+00
18	Patient	0009_auto_20210209_1613	2021-04-07 16:18:12.245647+00
19	Patient	0010_auto_20210209_1615	2021-04-07 16:18:12.271075+00
20	Patient	0011_auto_20210211_1222	2021-04-07 16:18:12.295226+00
21	Patient	0012_auto_20210213_0505	2021-04-07 16:18:12.331619+00
22	Patient	0013_auto_20210218_1639	2021-04-07 16:18:12.406674+00
23	Patient	0014_samplecollection_diagnosis	2021-04-07 16:18:12.429555+00
24	Patient	0015_auto_20210219_0350	2021-04-07 16:18:12.459733+00
25	Patient	0016_auto_20210219_0412	2021-04-07 16:18:12.525658+00
26	Patient	0017_inscusionout	2021-04-07 16:18:12.572701+00
27	Patient	0018_inscusionout_no_of_doses	2021-04-07 16:18:12.600148+00
28	Patient	0019_paidamount_partial_paid	2021-04-07 16:18:12.628828+00
29	Patient	0020_auto_20210220_1411	2021-04-07 16:18:12.66865+00
30	Patient	0021_samplecollection_quantity	2021-04-07 16:18:12.692216+00
31	admin	0001_initial	2021-04-07 16:18:12.851071+00
32	admin	0002_logentry_remove_auto_add	2021-04-07 16:18:12.885254+00
33	admin	0003_logentry_add_action_flag_choices	2021-04-07 16:18:12.92331+00
34	contenttypes	0002_remove_content_type_name	2021-04-07 16:18:12.964485+00
35	auth	0002_alter_permission_name_max_length	2021-04-07 16:18:12.986562+00
36	auth	0003_alter_user_email_max_length	2021-04-07 16:18:13.00576+00
37	auth	0004_alter_user_username_opts	2021-04-07 16:18:13.024758+00
38	auth	0005_alter_user_last_login_null	2021-04-07 16:18:13.045738+00
39	auth	0006_require_contenttypes_0002	2021-04-07 16:18:13.048905+00
40	auth	0007_alter_validators_add_error_messages	2021-04-07 16:18:13.064575+00
41	auth	0008_alter_user_username_max_length	2021-04-07 16:18:13.091173+00
42	auth	0009_alter_user_last_name_max_length	2021-04-07 16:18:13.111747+00
43	auth	0010_alter_group_name_max_length	2021-04-07 16:18:13.143531+00
44	auth	0011_update_proxy_permissions	2021-04-07 16:18:13.169808+00
45	auth	0012_alter_user_first_name_max_length	2021-04-07 16:18:13.186775+00
46	authtoken	0001_initial	2021-04-07 16:18:13.220213+00
47	authtoken	0002_auto_20160226_1747	2021-04-07 16:18:13.298691+00
48	dashboard	0001_initial	2021-04-07 16:18:13.30949+00
49	jet	0001_initial	2021-04-07 16:18:13.330744+00
50	jet	0002_delete_userdashboardmodule	2021-04-07 16:18:13.336796+00
51	sessions	0001_initial	2021-04-07 16:18:13.346038+00
52	Product	0001_initial	2021-04-11 13:31:20.89529+00
53	Product	0002_product_product_image	2021-04-11 13:31:20.908273+00
54	Product	0003_contact	2021-04-11 13:31:20.918141+00
55	Product	0004_product_product_desc	2021-04-11 13:31:20.925874+00
56	Product	0005_category_priority	2021-04-13 06:22:08.602392+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
fmqsqh4xec073ug1p00di5t7nphwj9h3	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lUC1V:hQJC1c3AQVgsQCTza7c2EMFltCMJXyvnTVMuvLqxLAw	2021-04-21 17:31:25.822904+00
g3ulbgbai146smpse1fm7hrkl1yfdd4d	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lULGe:no0Lf5Ff17leUh6FsXabOLpI1Fpkn3CJ4Iu0-ZImXE8	2021-04-22 03:23:40.712559+00
lrf7y08ekacwtwlstgwzs4wu7l9nieux	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lULPx:Ohr7Ww4Tkeqia8Nsdx__cGeDU9rbuM16Q8MV-FMTNdk	2021-04-22 03:33:17.590521+00
xc78s1uz54kgy7b7tsgn4qnuw78bbu4r	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lUMNd:-neiI3RbEveplMtH-8qYiLkN2YzhpT47lgBKi-IBz1A	2021-04-22 04:34:57.962847+00
o0sos329j8vrm8eyxsr5o33rass2aa2o	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVW6B:RTQgQUX5-fHxCqpovQQIpHKWsOaqPH8tTN-hx404wMU	2021-04-25 09:09:43.050128+00
d3pnfahqz0mg1o7lgvzomup0ieqhp7hc	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVW8H:zPgrG2BJIRJmDh9E6Likml47k5ZdH3JCE8wbFmkH-f8	2021-04-25 09:11:53.80688+00
r1x096sm05itknrnt227ellvbp4yn6da	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVW8e:OvFGx-629c5unIbwmxnW705nPykSYwh49azuHz22QG4	2021-04-25 09:12:16.545154+00
4f9hwnctzib2bgka38p1wcxrxpv737sp	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVW9S:00QzsKTWWikKqEXjAeS4IfyENTyeVCvh36_irIISps4	2021-04-25 09:13:06.357779+00
qf4du9kdkxa2cjpuitzkbibo1n2o5lkd	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVWBE:-OYtDx8GKHsA4jthPMagew-6XW0QgezFWZV5azC7KMQ	2021-04-25 09:14:56.17139+00
e5qqc8a2ahtj9npuyhrpjuhxi2aedo0v	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVawV:7qR61gN4rLdgS2p6Nqt68tEBnq3ujynkklSPY5MtQpU	2021-04-25 14:20:03.200859+00
axngkwrj5afhqauec3enbgrdmly4ye19	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVcN2:gjf4rMfKO64QQhuTTzWO2tD8aE7NFbzfn0cg_tYhTLs	2021-04-25 15:51:32.568687+00
or3oa5ybabg6l7gtigmhr9oadztnafeh	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVnzD:v-UiP6sHWA233fhCgTxEUPITlo3cU91qSl8suCwHkkE	2021-04-26 04:15:43.884229+00
czdyk3l0z1rh8a72lyscc5oh2e5t8fj2	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVoBn:xdMpyfYRZey3zKev1t0F_P5T72kraZg1FVKJB0sIWGw	2021-04-26 04:28:43.521212+00
x74yytq2xjldjgxh6ux0qv6yv0zg5f6j	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVp4o:xQz0bpeFkKV1M_gZuyRphH6ZfoPFndCgBBzLyhs2k6Y	2021-04-26 05:25:34.926093+00
pw2mr19dl9hy4c6l3scwzs8udt0msb6p	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVp5h:xiWvGg7qk470m5VyJMyoA7XlA2rA_3H2q2OtqguNAek	2021-04-26 05:26:29.550256+00
alad2oz1ttikavlq8zo3zynnuqvbixco	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVp9z:K8bvxj4BrlfwsazYh1IKVLJywcPHCs9gScUZak0RiFQ	2021-04-26 05:30:55.156559+00
ixgjd4t1auhv917emu3vue1ylorm1k2g	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVpA1:dAvH15BQ9M29AHUUxsB5RAYNbrkVtSVfawQUyK9nmIE	2021-04-26 05:30:57.894594+00
l1nl3ynq9xlgq2gbh8sfcdg8nhiqjh5g	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVpD3:PFKcAvhUOxiNEBQJeWYVEgramHpbLZt-zXeMWZgxomw	2021-04-26 05:34:05.704749+00
2ky5l69tvxdplsa5uv81pt0il7076khp	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVpEA:q895Ul3z5LzwYcmw9QM2Jfdqx8D3tUJ-jQsCNX4NKmE	2021-04-26 05:35:14.132596+00
e50tr7n0nnvqu1c2s6hmglqtbxbxsdp9	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVpG4:lIlkB06NFiBHygGkhzWftNCO55aU9LHk4xpNNeGbZvU	2021-04-26 05:37:12.524016+00
ntxg9nw1jsamr33xemt9pe7nezrvishy	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVpGn:Fp4U4pDEXMz7MbTNHGYs7XtZ_GzYVnp33FqVoWI1nVM	2021-04-26 05:37:57.600483+00
rtlrloi026r7evl7vwrgzq6urm8fs06i	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVpJ3:e7AgRphDnN_0K3dBc7P9ZNzyvu1A6Z9VR8ZQ-LZHcYE	2021-04-26 05:40:17.984498+00
509qus1saharoyuj1ydkmo0bcjjptlgx	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVpQC:7pKE0NdaT3cvsEIOO-dKwmfYynS7h2jdAQL-3WCrY70	2021-04-26 05:47:40.690358+00
6aylgepprwyvy5lgsx1jrw2gl46qmjf0	.eJxVjDsOwjAQBe_iGllJvPE6lPScIXrrrHEAxVI-FeLuECkFtG9m3sv02Nbcb4vO_TiYsyFz-t0E8aHTDoY7pluxsUzrPIrdFXvQxV7LoM_L4f4dZCz5WzckxFR7OApd5UPLkV0CkngC6poJVeqcb5kqTsqtBlGJCkJH3Kh5fwDFQzet:1lVpdB:pe3bYr9crqirJoh0hlNEEMiCnf_pTgEKHDg3_R4a1A0	2021-04-26 06:01:05.273299+00
ov9tunuslz7a06ci06ysbx6raisci0wo	.eJxVjDsOwjAQBe_iGllJvPE6lPScIXrrrHEAxVI-FeLuECkFtG9m3sv02Nbcb4vO_TiYsyFz-t0E8aHTDoY7pluxsUzrPIrdFXvQxV7LoM_L4f4dZCz5WzckxFR7OApd5UPLkV0CkngC6poJVeqcb5kqTsqtBlGJCkJH3Kh5fwDFQzet:1lVpeO:SfZkFSFh8-1-9hHcCYuD0CC7t4ZQNpOQthAlmhpZCV4	2021-04-26 06:02:20.700027+00
ecbqe0wurebm7d6sgpf777a9oj505xj0	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVpeb:C6nP6NGBq72aO8LSwaD40_SzhGykA11kARPBdfasmlE	2021-04-26 06:02:33.47074+00
z490cin4dbzyqcu8yzr27k5wso0pr0le	.eJxVjDsOwjAQBe_iGllJvPE6lPScIXrrrHEAxVI-FeLuECkFtG9m3sv02Nbcb4vO_TiYsyFz-t0E8aHTDoY7pluxsUzrPIrdFXvQxV7LoM_L4f4dZCz5WzckxFR7OApd5UPLkV0CkngC6poJVeqcb5kqTsqtBlGJCkJH3Kh5fwDFQzet:1lVpet:FY08kbswFLHiV63B62qLkLg6P2meCBC5GRYXGs5i1pY	2021-04-26 06:02:51.679409+00
jd294boj0sdww8kbghbthzf2og0i0mvz	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVpfN:5bPxKmR09qAoshMwzh5QiKpPED5oKLZTgRJ5dXbw-VI	2021-04-26 06:03:21.911566+00
dfhy6g7g5xi5x183yzl3wyvyvs96bm7s	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVpfZ:OeRl-wd6ODZiPqcJAyaqcH9vrlAFzyaFxEUh6i4qCOo	2021-04-26 06:03:33.050608+00
xaepsdv6noravz9hegx5s1432fwlsnii	.eJxVjEEOwiAQRe_C2hAoDIJL9z0DmYFBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERRpx-N8L04LaDfMd2m2Wa27pMJHdFHrTLcc78vB7u30HFXr-188TehpzcAAadZiqE54zIFogVUCrao8lgAzIZY2xhxQOgV6QDsHh_AA8XOOg:1lVpg8:Nr-b_TOy8V6ZWHYr4dNF7Yz5R9jiPk8dVO5sOAHBCTQ	2021-04-26 06:04:08.208844+00
46mg0towmidxx1r2coop1iyoxdqw00eh	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVpvt:rSfgq7oJKs_poHpXSIf_d3dWD7UAtqr0Gxhw7onn0dY	2021-04-26 06:20:25.469356+00
zmzf45b8qcmh6l236ap35p2fky4hfmqa	.eJxVjMEOwiAQBf-FsyGAsIBH7_0GAuwiVQNJaU_Gf9cmPej1zcx7sRC3tYZt0BJmZBcmJTv9jinmB7Wd4D22W-e5t3WZE98VftDBp470vB7u30GNo35rUbJWQBYcFOnBCWspW6WJnKOMgKhEBIEmauPonBOAtgU8CfDFecPeH_9vN9U:1lVq1J:jveUQwwSkSuqb97JA59BBUpfr0dCFT-t-3Ib6Z_monE	2021-04-26 06:26:01.164134+00
0m8dung4y9dlssw6op5eq4gixxnmzvmo	.eJxVjMsOwiAQRf-FtSEDw7TFpXu_gTA8pGogKe3K-O_apAvd3nPOfQnnt7W4rafFzVGchUJx-h3Zh0eqO4l3X29NhlbXZWa5K_KgXV5bTM_L4f4dFN_Lt8ZREYIlY3EkTd5ChpCChoBxIsqGQRvDKrGhxIPPgTUigM4w2YGteH8A1yw3MQ:1lVrW9:XEqwuoxhTemB6B9DocSMZvYtWUbZoeSEWBUkRS4wdkQ	2021-04-26 08:01:57.30811+00
7jwueaesbybmqzodgq37tar790n5hhso	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVsXQ:RjqKZOcVhNeuyZDJSYxa9JNMnx1UyjhoEAJflOrsxVg	2021-04-26 09:07:20.14576+00
dg00ih2n6d0nyehvdwkgf0x3q8tw3gmj	.eJxVjEEOwiAQRe_C2hAoDIJL9z0DmYFBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERRpx-N8L04LaDfMd2m2Wa27pMJHdFHrTLcc78vB7u30HFXr-188TehpzcAAadZiqE54zIFogVUCrao8lgAzIZY2xhxQOgV6QDsHh_AA8XOOg:1lVud4:HzbTfovX3Oz9nhZX3ll4Hv31nJ86C0w2mjEGT8ZDIFU	2021-04-26 11:21:18.980906+00
fmfvwk6lv00z3v4dtdrb9u0krrlgeksx	.eJxVjMsOwiAQRf-FtSF0YAZw6d5vIMOjUjU0Ke3K-O_apAvd3nPOfYnA21rD1ssSpizOwonT7xY5PUrbQb5zu80yzW1dpih3RR60y-ucy_NyuH8HlXv91smQt-SBoAAgGYzKOKUto47FJq8UDABK65wTjWScJcbMPNg0GlQo3h-liDaA:1lVuqF:ePZgiC3jdpC3Cv4-Q1CBcW9NqZ397FGqLDv122BKKvQ	2021-04-26 11:34:55.170646+00
vek1ny63pt6dcq9optrj0cbpedwyihg4	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVv0p:CH1Q09yNGFoEAkTIpxkcSk15ruWBjcIUeWsWT-GGhf0	2021-04-26 11:45:51.344005+00
q3yu6tffk602uk79qqaathylao9uaibs	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVv4z:VdpQ2octEG1pG7MTHtoiWeF-knbRZT2Tx7ItUWsN9z4	2021-04-26 11:50:09.626945+00
txoq1abna30xpzhgvk4ottbs4p78q7h8	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lVv8K:5uxEycrywPGTGIuKMNvi-24b1lfE8KtQ1mCEdunFiAs	2021-04-26 11:53:36.883647+00
cugqibfbvcltdk12vicm8asyl0wfwmex	.eJxVjMsOwiAQRf-FtSEDw7TFpXu_gTA8pGogKe3K-O_apAvd3nPOfQnnt7W4rafFzVGchUJx-h3Zh0eqO4l3X29NhlbXZWa5K_KgXV5bTM_L4f4dFN_Lt8ZREYIlY3EkTd5ChpCChoBxIsqGQRvDKrGhxIPPgTUigM4w2YGteH8A1yw3MQ:1lVvkj:BMfcKFVTSob9Mp7pTkpeS-0ctaHNbgEcLonWSUy4stI	2021-04-26 12:33:17.1549+00
5gwroezgxfw41vvb80gyipxq45cnx17x	.eJxVjMsOwiAQRf-FtSEDw7TFpXu_gTA8pGogKe3K-O_apAvd3nPOfQnnt7W4rafFzVGchUJx-h3Zh0eqO4l3X29NhlbXZWa5K_KgXV5bTM_L4f4dFN_Lt8ZREYIlY3EkTd5ChpCChoBxIsqGQRvDKrGhxIPPgTUigM4w2YGteH8A1yw3MQ:1lVw4t:KDTxMFklRXPdcmctNxjD30Dqb0RFRd-hULIpr4Ibtnc	2021-04-26 12:54:07.294145+00
havmft4tc07a308tsrl27if5i5ftl8lo	.eJxVjMsOwiAQRf-FtSG8GVy69xvIAINUDU1KuzL-uzbpQrf3nHNfLOK2trgNWuJU2Jk5dvrdEuYH9R2UO_bbzPPc12VKfFf4QQe_zoWel8P9O2g42rfWJJ0MEKpJFiyF4gpiUd4IoUI2wQCg8lZnklWCqADeKiWz1pikpsDeH8h8Nvc:1lVwGB:HgMBb4JSR8vUxxiT1AuZzWASlbV2RnQqWsyMwJvOX8A	2021-04-26 13:05:47.174581+00
y31a85x0gllqg11be3qui1uq34gkizur	.eJxVjL0OwiAYAN-F2RCkUKije5-BfD8gVQNJaSfjuytJB13vLvcSAfYth73FNSwsLkKL0y9DoEcsXfAdyq1KqmVbF5Q9kYdtcq4cn9ej_RtkaLlvlbeaE2s0FidWCkefMA3AwKSjI8OG8cyTJpfwWxAaZz2TNSM5M4j3Bw8KOR8:1lW0Ny:SwOX7Lg-tHlUsZ8HlTAGC_VdACy_WVLkniS3KsdvFXo	2021-04-26 17:30:06.384676+00
\.


--
-- Data for Name: jet_bookmark; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jet_bookmark (id, url, title, "user", date_add) FROM stdin;
\.


--
-- Data for Name: jet_pinnedapplication; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jet_pinnedapplication (id, app_label, "user", date_add) FROM stdin;
\.


--
-- Name: Company_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Company_company_id_seq"', 1, false);


--
-- Name: Configuration_areamaster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Configuration_areamaster_id_seq"', 3, true);


--
-- Name: Configuration_usertype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Configuration_usertype_id_seq"', 3, true);


--
-- Name: Customer_customerprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Customer_customerprofile_id_seq"', 11, true);


--
-- Name: Patient_inscusionout_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Patient_inscusionout_id_seq"', 1, false);


--
-- Name: Patient_paidamount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Patient_paidamount_id_seq"', 1, false);


--
-- Name: Patient_patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Patient_patient_id_seq"', 38, true);


--
-- Name: Patient_samplecollection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Patient_samplecollection_id_seq"', 1, false);


--
-- Name: Patient_splittest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Patient_splittest_id_seq"', 1, false);


--
-- Name: Product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Product_category_id_seq"', 9, true);


--
-- Name: Product_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Product_contact_id_seq"', 1, false);


--
-- Name: Product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Product_product_id_seq"', 115, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 88, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 58, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: dashboard_userdashboardmodule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboard_userdashboardmodule_id_seq', 14, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 174, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 22, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 56, true);


--
-- Name: jet_bookmark_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jet_bookmark_id_seq', 1, false);


--
-- Name: jet_pinnedapplication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jet_pinnedapplication_id_seq', 1, false);


--
-- Name: Company_company Company_company_auth_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Company_company"
    ADD CONSTRAINT "Company_company_auth_user_id_key" UNIQUE (auth_user_id);


--
-- Name: Company_company Company_company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Company_company"
    ADD CONSTRAINT "Company_company_pkey" PRIMARY KEY (id);


--
-- Name: Company_company Company_company_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Company_company"
    ADD CONSTRAINT "Company_company_username_key" UNIQUE (username);


--
-- Name: Configuration_areamaster Configuration_areamaster_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Configuration_areamaster"
    ADD CONSTRAINT "Configuration_areamaster_pkey" PRIMARY KEY (id);


--
-- Name: Configuration_usertype Configuration_usertype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Configuration_usertype"
    ADD CONSTRAINT "Configuration_usertype_pkey" PRIMARY KEY (id);


--
-- Name: Customer_customerprofile Customer_customerprofile_auth_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer_customerprofile"
    ADD CONSTRAINT "Customer_customerprofile_auth_user_id_key" UNIQUE (auth_user_id);


--
-- Name: Customer_customerprofile Customer_customerprofile_emp_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer_customerprofile"
    ADD CONSTRAINT "Customer_customerprofile_emp_code_key" UNIQUE (emp_code);


--
-- Name: Customer_customerprofile Customer_customerprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer_customerprofile"
    ADD CONSTRAINT "Customer_customerprofile_pkey" PRIMARY KEY (id);


--
-- Name: Customer_customerprofile Customer_customerprofile_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer_customerprofile"
    ADD CONSTRAINT "Customer_customerprofile_username_key" UNIQUE (username);


--
-- Name: Patient_inscusionout Patient_inscusionout_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patient_inscusionout"
    ADD CONSTRAINT "Patient_inscusionout_pkey" PRIMARY KEY (id);


--
-- Name: Patient_paidamount Patient_paidamount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patient_paidamount"
    ADD CONSTRAINT "Patient_paidamount_pkey" PRIMARY KEY (id);


--
-- Name: Patient_patient Patient_patient_auth_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patient_patient"
    ADD CONSTRAINT "Patient_patient_auth_user_id_key" UNIQUE (auth_user_id);


--
-- Name: Patient_patient Patient_patient_patient_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patient_patient"
    ADD CONSTRAINT "Patient_patient_patient_id_key" UNIQUE (patient_id);


--
-- Name: Patient_patient Patient_patient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patient_patient"
    ADD CONSTRAINT "Patient_patient_pkey" PRIMARY KEY (id);


--
-- Name: Patient_samplecollection Patient_samplecollection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patient_samplecollection"
    ADD CONSTRAINT "Patient_samplecollection_pkey" PRIMARY KEY (id);


--
-- Name: Patient_splittest Patient_splittest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patient_splittest"
    ADD CONSTRAINT "Patient_splittest_pkey" PRIMARY KEY (id);


--
-- Name: Patient_splittest Patient_splittest_split_quantity_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patient_splittest"
    ADD CONSTRAINT "Patient_splittest_split_quantity_key" UNIQUE (split_quantity);


--
-- Name: Product_category Product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product_category"
    ADD CONSTRAINT "Product_category_pkey" PRIMARY KEY (id);


--
-- Name: Product_contact Product_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product_contact"
    ADD CONSTRAINT "Product_contact_pkey" PRIMARY KEY (id);


--
-- Name: Product_product Product_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product_product"
    ADD CONSTRAINT "Product_product_pkey" PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: dashboard_userdashboardmodule dashboard_userdashboardmodule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_userdashboardmodule
    ADD CONSTRAINT dashboard_userdashboardmodule_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: jet_bookmark jet_bookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jet_bookmark
    ADD CONSTRAINT jet_bookmark_pkey PRIMARY KEY (id);


--
-- Name: jet_pinnedapplication jet_pinnedapplication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jet_pinnedapplication
    ADD CONSTRAINT jet_pinnedapplication_pkey PRIMARY KEY (id);


--
-- Name: Company_company_area_id_cf5cdf15; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Company_company_area_id_cf5cdf15" ON public."Company_company" USING btree (area_id);


--
-- Name: Company_company_user_type_id_3ee0a145; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Company_company_user_type_id_3ee0a145" ON public."Company_company" USING btree (user_type_id);


--
-- Name: Company_company_username_1e27e0b6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Company_company_username_1e27e0b6_like" ON public."Company_company" USING btree (username varchar_pattern_ops);


--
-- Name: Customer_customerprofile_area_id_71635225; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Customer_customerprofile_area_id_71635225" ON public."Customer_customerprofile" USING btree (area_id);


--
-- Name: Customer_customerprofile_emp_code_521e33bf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Customer_customerprofile_emp_code_521e33bf_like" ON public."Customer_customerprofile" USING btree (emp_code varchar_pattern_ops);


--
-- Name: Customer_customerprofile_user_type_id_3a743ef6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Customer_customerprofile_user_type_id_3a743ef6" ON public."Customer_customerprofile" USING btree (user_type_id);


--
-- Name: Customer_customerprofile_username_59b7c540_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Customer_customerprofile_username_59b7c540_like" ON public."Customer_customerprofile" USING btree (username varchar_pattern_ops);


--
-- Name: Patient_inscusionout_user_id_b259602a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Patient_inscusionout_user_id_b259602a" ON public."Patient_inscusionout" USING btree (user_id);


--
-- Name: Patient_paidamount_user_id_e2ec9944; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Patient_paidamount_user_id_e2ec9944" ON public."Patient_paidamount" USING btree (user_id);


--
-- Name: Patient_patient_patient_id_4e7227b1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Patient_patient_patient_id_4e7227b1_like" ON public."Patient_patient" USING btree (patient_id varchar_pattern_ops);


--
-- Name: Patient_samplecollection_user_id_57bd939c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Patient_samplecollection_user_id_57bd939c" ON public."Patient_samplecollection" USING btree (user_id);


--
-- Name: Patient_splittest_split_quantity_2ab6365f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Patient_splittest_split_quantity_2ab6365f_like" ON public."Patient_splittest" USING btree (split_quantity varchar_pattern_ops);


--
-- Name: Patient_splittest_user_id_674d5a69; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Patient_splittest_user_id_674d5a69" ON public."Patient_splittest" USING btree (user_id);


--
-- Name: Product_product_category_id_ded7ea18; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Product_product_category_id_ded7ea18" ON public."Product_product" USING btree (category_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: Company_company Company_company_area_id_cf5cdf15_fk_Configuration_areamaster_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Company_company"
    ADD CONSTRAINT "Company_company_area_id_cf5cdf15_fk_Configuration_areamaster_id" FOREIGN KEY (area_id) REFERENCES public."Configuration_areamaster"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Company_company Company_company_auth_user_id_ebfc8db0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Company_company"
    ADD CONSTRAINT "Company_company_auth_user_id_ebfc8db0_fk_auth_user_id" FOREIGN KEY (auth_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Company_company Company_company_user_type_id_3ee0a145_fk_Configura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Company_company"
    ADD CONSTRAINT "Company_company_user_type_id_3ee0a145_fk_Configura" FOREIGN KEY (user_type_id) REFERENCES public."Configuration_usertype"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Customer_customerprofile Customer_customerpro_area_id_71635225_fk_Configura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer_customerprofile"
    ADD CONSTRAINT "Customer_customerpro_area_id_71635225_fk_Configura" FOREIGN KEY (area_id) REFERENCES public."Configuration_areamaster"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Customer_customerprofile Customer_customerpro_user_type_id_3a743ef6_fk_Configura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer_customerprofile"
    ADD CONSTRAINT "Customer_customerpro_user_type_id_3a743ef6_fk_Configura" FOREIGN KEY (user_type_id) REFERENCES public."Configuration_usertype"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Customer_customerprofile Customer_customerprofile_auth_user_id_67e01a70_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer_customerprofile"
    ADD CONSTRAINT "Customer_customerprofile_auth_user_id_67e01a70_fk_auth_user_id" FOREIGN KEY (auth_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Patient_inscusionout Patient_inscusionout_user_id_b259602a_fk_Customer_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patient_inscusionout"
    ADD CONSTRAINT "Patient_inscusionout_user_id_b259602a_fk_Customer_" FOREIGN KEY (user_id) REFERENCES public."Customer_customerprofile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Patient_paidamount Patient_paidamount_user_id_e2ec9944_fk_Customer_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patient_paidamount"
    ADD CONSTRAINT "Patient_paidamount_user_id_e2ec9944_fk_Customer_" FOREIGN KEY (user_id) REFERENCES public."Customer_customerprofile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Patient_patient Patient_patient_auth_user_id_7579d6da_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patient_patient"
    ADD CONSTRAINT "Patient_patient_auth_user_id_7579d6da_fk_auth_user_id" FOREIGN KEY (auth_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Patient_samplecollection Patient_samplecollec_user_id_57bd939c_fk_Customer_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patient_samplecollection"
    ADD CONSTRAINT "Patient_samplecollec_user_id_57bd939c_fk_Customer_" FOREIGN KEY (user_id) REFERENCES public."Customer_customerprofile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Patient_splittest Patient_splittest_user_id_674d5a69_fk_Customer_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Patient_splittest"
    ADD CONSTRAINT "Patient_splittest_user_id_674d5a69_fk_Customer_" FOREIGN KEY (user_id) REFERENCES public."Customer_customerprofile"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Product_product Product_product_category_id_ded7ea18_fk_Product_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product_product"
    ADD CONSTRAINT "Product_product_category_id_ded7ea18_fk_Product_category_id" FOREIGN KEY (category_id) REFERENCES public."Product_category"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

