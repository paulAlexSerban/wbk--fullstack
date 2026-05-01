--
-- PostgreSQL database dump
--

-- Dumped from database version 13.20
-- Dumped by pg_dump version 13.20

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

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO devuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO devuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO devuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO devuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO devuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO devuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO devuser;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO devuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO devuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO devuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO devuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO devuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO devuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO devuser;

--
-- Name: profiles_api_profilefeeditem; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.profiles_api_profilefeeditem (
    id bigint NOT NULL,
    status_text character varying(255) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    user_profile_id bigint NOT NULL
);


ALTER TABLE public.profiles_api_profilefeeditem OWNER TO devuser;

--
-- Name: profiles_api_priflefeeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.profiles_api_priflefeeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_api_priflefeeditem_id_seq OWNER TO devuser;

--
-- Name: profiles_api_priflefeeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.profiles_api_priflefeeditem_id_seq OWNED BY public.profiles_api_profilefeeditem.id;


--
-- Name: profiles_api_userprofile; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.profiles_api_userprofile (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL
);


ALTER TABLE public.profiles_api_userprofile OWNER TO devuser;

--
-- Name: profiles_api_userprofile_groups; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.profiles_api_userprofile_groups (
    id bigint NOT NULL,
    userprofile_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.profiles_api_userprofile_groups OWNER TO devuser;

--
-- Name: profiles_api_userprofile_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.profiles_api_userprofile_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_api_userprofile_groups_id_seq OWNER TO devuser;

--
-- Name: profiles_api_userprofile_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.profiles_api_userprofile_groups_id_seq OWNED BY public.profiles_api_userprofile_groups.id;


--
-- Name: profiles_api_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.profiles_api_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_api_userprofile_id_seq OWNER TO devuser;

--
-- Name: profiles_api_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.profiles_api_userprofile_id_seq OWNED BY public.profiles_api_userprofile.id;


--
-- Name: profiles_api_userprofile_user_permissions; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.profiles_api_userprofile_user_permissions (
    id bigint NOT NULL,
    userprofile_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.profiles_api_userprofile_user_permissions OWNER TO devuser;

--
-- Name: profiles_api_userprofile_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.profiles_api_userprofile_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_api_userprofile_user_permissions_id_seq OWNER TO devuser;

--
-- Name: profiles_api_userprofile_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.profiles_api_userprofile_user_permissions_id_seq OWNED BY public.profiles_api_userprofile_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: profiles_api_profilefeeditem id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.profiles_api_profilefeeditem ALTER COLUMN id SET DEFAULT nextval('public.profiles_api_priflefeeditem_id_seq'::regclass);


--
-- Name: profiles_api_userprofile id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.profiles_api_userprofile ALTER COLUMN id SET DEFAULT nextval('public.profiles_api_userprofile_id_seq'::regclass);


--
-- Name: profiles_api_userprofile_groups id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.profiles_api_userprofile_groups ALTER COLUMN id SET DEFAULT nextval('public.profiles_api_userprofile_groups_id_seq'::regclass);


--
-- Name: profiles_api_userprofile_user_permissions id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.profiles_api_userprofile_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.profiles_api_userprofile_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: devuser
--



--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: devuser
--



--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: devuser
--

INSERT INTO public.auth_permission VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO public.auth_permission VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO public.auth_permission VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO public.auth_permission VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO public.auth_permission VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO public.auth_permission VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO public.auth_permission VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO public.auth_permission VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO public.auth_permission VALUES (21, 'Can add Token', 6, 'add_token');
INSERT INTO public.auth_permission VALUES (22, 'Can change Token', 6, 'change_token');
INSERT INTO public.auth_permission VALUES (23, 'Can delete Token', 6, 'delete_token');
INSERT INTO public.auth_permission VALUES (24, 'Can view Token', 6, 'view_token');
INSERT INTO public.auth_permission VALUES (25, 'Can add token', 7, 'add_tokenproxy');
INSERT INTO public.auth_permission VALUES (26, 'Can change token', 7, 'change_tokenproxy');
INSERT INTO public.auth_permission VALUES (27, 'Can delete token', 7, 'delete_tokenproxy');
INSERT INTO public.auth_permission VALUES (28, 'Can view token', 7, 'view_tokenproxy');
INSERT INTO public.auth_permission VALUES (29, 'Can add user profile', 8, 'add_userprofile');
INSERT INTO public.auth_permission VALUES (30, 'Can change user profile', 8, 'change_userprofile');
INSERT INTO public.auth_permission VALUES (31, 'Can delete user profile', 8, 'delete_userprofile');
INSERT INTO public.auth_permission VALUES (32, 'Can view user profile', 8, 'view_userprofile');
INSERT INTO public.auth_permission VALUES (33, 'Can add profile feed item', 9, 'add_profilefeeditem');
INSERT INTO public.auth_permission VALUES (34, 'Can change profile feed item', 9, 'change_profilefeeditem');
INSERT INTO public.auth_permission VALUES (35, 'Can delete profile feed item', 9, 'delete_profilefeeditem');
INSERT INTO public.auth_permission VALUES (36, 'Can view profile feed item', 9, 'view_profilefeeditem');


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: devuser
--

INSERT INTO public.authtoken_token VALUES ('9c82003fdb73cac629abe56ee420bc916d5a15f5', '2025-02-24 20:13:06.917622+00', 2);
INSERT INTO public.authtoken_token VALUES ('70a7c7f3c3864f1bdbd8516f9bcbb84272d40a2a', '2025-02-24 20:13:37.619522+00', 3);
INSERT INTO public.authtoken_token VALUES ('0a373477b4f490bbf3801820ab9f513022b73080', '2025-02-24 20:13:58.324123+00', 4);
INSERT INTO public.authtoken_token VALUES ('af9fc7dc5be94b1be58d58f059ca5de37bdecf7a', '2025-02-24 20:14:19.523001+00', 5);
INSERT INTO public.authtoken_token VALUES ('74f0651f2a975abc1e1d75b9dcbaf5e3098cb170', '2025-02-24 20:14:45.665607+00', 6);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: devuser
--



--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: devuser
--

INSERT INTO public.django_content_type VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type VALUES (5, 'sessions', 'session');
INSERT INTO public.django_content_type VALUES (6, 'authtoken', 'token');
INSERT INTO public.django_content_type VALUES (7, 'authtoken', 'tokenproxy');
INSERT INTO public.django_content_type VALUES (8, 'profiles_api', 'userprofile');
INSERT INTO public.django_content_type VALUES (9, 'profiles_api', 'profilefeeditem');


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: devuser
--

INSERT INTO public.django_migrations VALUES (1, 'contenttypes', '0001_initial', '2025-02-24 20:22:20.435571+00');
INSERT INTO public.django_migrations VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2025-02-24 20:22:20.43831+00');
INSERT INTO public.django_migrations VALUES (3, 'auth', '0001_initial', '2025-02-24 20:22:20.461305+00');
INSERT INTO public.django_migrations VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2025-02-24 20:22:20.463185+00');
INSERT INTO public.django_migrations VALUES (5, 'auth', '0003_alter_user_email_max_length', '2025-02-24 20:22:20.464849+00');
INSERT INTO public.django_migrations VALUES (6, 'auth', '0004_alter_user_username_opts', '2025-02-24 20:22:20.466482+00');
INSERT INTO public.django_migrations VALUES (7, 'auth', '0005_alter_user_last_login_null', '2025-02-24 20:22:20.46803+00');
INSERT INTO public.django_migrations VALUES (8, 'auth', '0006_require_contenttypes_0002', '2025-02-24 20:22:20.468613+00');
INSERT INTO public.django_migrations VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2025-02-24 20:22:20.470372+00');
INSERT INTO public.django_migrations VALUES (10, 'auth', '0008_alter_user_username_max_length', '2025-02-24 20:22:20.47196+00');
INSERT INTO public.django_migrations VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2025-02-24 20:22:20.473483+00');
INSERT INTO public.django_migrations VALUES (12, 'auth', '0010_alter_group_name_max_length', '2025-02-24 20:22:20.475503+00');
INSERT INTO public.django_migrations VALUES (13, 'auth', '0011_update_proxy_permissions', '2025-02-24 20:22:20.477052+00');
INSERT INTO public.django_migrations VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2025-02-24 20:22:20.478664+00');
INSERT INTO public.django_migrations VALUES (15, 'profiles_api', '0001_initial', '2025-02-24 20:22:20.494119+00');
INSERT INTO public.django_migrations VALUES (16, 'admin', '0001_initial', '2025-02-24 20:22:20.502938+00');
INSERT INTO public.django_migrations VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2025-02-24 20:22:20.505222+00');
INSERT INTO public.django_migrations VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2025-02-24 20:22:20.507323+00');
INSERT INTO public.django_migrations VALUES (19, 'authtoken', '0001_initial', '2025-02-24 20:22:20.512837+00');
INSERT INTO public.django_migrations VALUES (20, 'authtoken', '0002_auto_20160226_1747', '2025-02-24 20:22:20.51954+00');
INSERT INTO public.django_migrations VALUES (21, 'authtoken', '0003_tokenproxy', '2025-02-24 20:22:20.520372+00');
INSERT INTO public.django_migrations VALUES (22, 'profiles_api', '0002_priflefeeditem', '2025-02-24 20:22:20.526617+00');
INSERT INTO public.django_migrations VALUES (23, 'profiles_api', '0003_rename_priflefeeditem_profilefeeditem', '2025-02-24 20:22:20.531739+00');
INSERT INTO public.django_migrations VALUES (24, 'sessions', '0001_initial', '2025-02-24 20:22:20.536669+00');


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: devuser
--

INSERT INTO public.django_session VALUES ('xpl9010lmhlu64scx0s5k7rtn87mby1p', '.eJxVjEEOwiAQRe_C2hCgM0BduvcMBIZBqoYmpV0Z765NutDtf-_9lwhxW2vYOi9hyuIstDj9binSg9sO8j222yxpbusyJbkr8qBdXufMz8vh_h3U2Ou3NgZdzmQ9s41al1wcKQvJoBoYSLHxAzImOwIxonGeVWE9lqQBCLx4fwDoejfY:1tmeiv:AFdP3DX5NKktQb9sZ_KhPLzK5cjVBkdQQm8gipqoGOc', '2025-03-10 20:06:41.175965+00');
INSERT INTO public.django_session VALUES ('e19daknumlrqsanlioczxzxg05a33973', '.eJxVjEEOwiAQRe_C2hCgM0BduvcMBIZBqoYmpV0Z765NutDtf-_9lwhxW2vYOi9hyuIstDj9binSg9sO8j222yxpbusyJbkr8qBdXufMz8vh_h3U2Ou3NgZdzmQ9s41al1wcKQvJoBoYSLHxAzImOwIxonGeVWE9lqQBCLx4fwDoejfY:1tmez7:w0hxq9fbmOPlggRJ2L27lSSSeBca37iR13SI1iUTts8', '2025-03-10 20:23:25.013709+00');


--
-- Data for Name: profiles_api_profilefeeditem; Type: TABLE DATA; Schema: public; Owner: devuser
--

INSERT INTO public.profiles_api_profilefeeditem VALUES (1, 'status text one', '2025-02-24 20:13:20.150086+00', 2);
INSERT INTO public.profiles_api_profilefeeditem VALUES (2, 'status text two', '2025-02-24 20:13:27.609974+00', 2);
INSERT INTO public.profiles_api_profilefeeditem VALUES (3, 'status text three', '2025-02-24 20:13:28.015474+00', 2);
INSERT INTO public.profiles_api_profilefeeditem VALUES (4, 'status text forth', '2025-02-24 20:13:28.327695+00', 2);
INSERT INTO public.profiles_api_profilefeeditem VALUES (5, 'status text fifth', '2025-02-24 20:13:29.503971+00', 2);
INSERT INTO public.profiles_api_profilefeeditem VALUES (6, 'status text sixth', '2025-02-24 20:13:47.222136+00', 3);
INSERT INTO public.profiles_api_profilefeeditem VALUES (7, 'status text seventh', '2025-02-24 20:13:48.907498+00', 3);
INSERT INTO public.profiles_api_profilefeeditem VALUES (8, 'status text eighth', '2025-02-24 20:13:49.220224+00', 3);
INSERT INTO public.profiles_api_profilefeeditem VALUES (9, 'status text nineth', '2025-02-24 20:13:49.380144+00', 3);
INSERT INTO public.profiles_api_profilefeeditem VALUES (10, 'status text tenth', '2025-02-24 20:13:49.536535+00', 3);
INSERT INTO public.profiles_api_profilefeeditem VALUES (11, 'status text eleventh', '2025-02-24 20:13:49.819273+00', 3);
INSERT INTO public.profiles_api_profilefeeditem VALUES (12, 'status text twelvth', '2025-02-24 20:13:50.004095+00', 3);
INSERT INTO public.profiles_api_profilefeeditem VALUES (13, 'status text thriteenth', '2025-02-24 20:13:50.164793+00', 3);
INSERT INTO public.profiles_api_profilefeeditem VALUES (14, 'status text fourteenth', '2025-02-24 20:14:06.727709+00', 4);
INSERT INTO public.profiles_api_profilefeeditem VALUES (15, 'status text fifteenth', '2025-02-24 20:14:06.940033+00', 4);
INSERT INTO public.profiles_api_profilefeeditem VALUES (16, 'status text sixteenth', '2025-02-24 20:14:07.245923+00', 4);
INSERT INTO public.profiles_api_profilefeeditem VALUES (17, 'status text seventeenth', '2025-02-24 20:14:07.409852+00', 4);
INSERT INTO public.profiles_api_profilefeeditem VALUES (18, 'status text eighteenth', '2025-02-24 20:14:07.569736+00', 4);
INSERT INTO public.profiles_api_profilefeeditem VALUES (19, 'status text nineteenth', '2025-02-24 20:14:07.708044+00', 4);
INSERT INTO public.profiles_api_profilefeeditem VALUES (20, 'status text twentith', '2025-02-24 20:14:07.834998+00', 4);
INSERT INTO public.profiles_api_profilefeeditem VALUES (21, 'status text twentyfirst', '2025-02-24 20:14:07.963035+00', 4);
INSERT INTO public.profiles_api_profilefeeditem VALUES (22, 'status text twentysecond', '2025-02-24 20:14:08.119285+00', 4);
INSERT INTO public.profiles_api_profilefeeditem VALUES (23, 'status text twentythird', '2025-02-24 20:14:30.317884+00', 5);
INSERT INTO public.profiles_api_profilefeeditem VALUES (24, 'status text twentyfourth', '2025-02-24 20:14:30.554438+00', 5);
INSERT INTO public.profiles_api_profilefeeditem VALUES (25, 'status text twentyfifth', '2025-02-24 20:14:30.875684+00', 5);
INSERT INTO public.profiles_api_profilefeeditem VALUES (26, 'status text twentysixth', '2025-02-24 20:14:31.203691+00', 5);
INSERT INTO public.profiles_api_profilefeeditem VALUES (27, 'status text twentyseventh', '2025-02-24 20:14:31.469685+00', 5);
INSERT INTO public.profiles_api_profilefeeditem VALUES (28, 'status text twentyeigth', '2025-02-24 20:14:31.596286+00', 5);
INSERT INTO public.profiles_api_profilefeeditem VALUES (29, 'status text twentynineth', '2025-02-24 20:14:31.730358+00', 5);
INSERT INTO public.profiles_api_profilefeeditem VALUES (30, 'status text lorem', '2025-02-24 20:14:31.9502+00', 5);
INSERT INTO public.profiles_api_profilefeeditem VALUES (31, 'status text ipsum', '2025-02-24 20:14:32.069107+00', 5);
INSERT INTO public.profiles_api_profilefeeditem VALUES (32, 'status text dolor', '2025-02-24 20:15:05.42581+00', 6);
INSERT INTO public.profiles_api_profilefeeditem VALUES (33, 'status text sit', '2025-02-24 20:15:06.146821+00', 6);
INSERT INTO public.profiles_api_profilefeeditem VALUES (34, 'status text amer', '2025-02-24 20:15:06.293497+00', 6);
INSERT INTO public.profiles_api_profilefeeditem VALUES (35, 'status text lorem', '2025-02-24 20:15:06.557037+00', 6);
INSERT INTO public.profiles_api_profilefeeditem VALUES (36, 'status text ipsum', '2025-02-24 20:15:06.694847+00', 6);
INSERT INTO public.profiles_api_profilefeeditem VALUES (37, 'status text dolor', '2025-02-24 20:15:06.830555+00', 6);


--
-- Data for Name: profiles_api_userprofile; Type: TABLE DATA; Schema: public; Owner: devuser
--

INSERT INTO public.profiles_api_userprofile VALUES (2, 'pbkdf2_sha256$260000$QUoSJYB7j4U7H5iUAo5LZT$4SBquaBKQ7hYdKKH+CTga+Eb7kV55x3T0L2NGNoY+xQ=', NULL, false, 'second@profile.com', 'second', true, false);
INSERT INTO public.profiles_api_userprofile VALUES (3, 'pbkdf2_sha256$260000$gxX3N8bXXKUsEBgL65g2sM$vFSlRP8IfFL3McocP6Gu2U/hk2cPmxeG98BPwU/xRsM=', NULL, false, 'third@profile.com', 'third', true, false);
INSERT INTO public.profiles_api_userprofile VALUES (4, 'pbkdf2_sha256$260000$x4axTnCIGNVzreX3QfiF4r$DC42KF8uCkwUkNFbLQafWxWqzUC1wkcjvv6MuGmeGFs=', NULL, false, 'forth@profile.com', 'forth', true, false);
INSERT INTO public.profiles_api_userprofile VALUES (5, 'pbkdf2_sha256$260000$heGkLHGNVRbVoo7gVmp3SA$2/z8jrcxc8mdAskqYPKR4yw17h/vaUVCkb0VJ2RZgdk=', NULL, false, 'fifth@profile.com', 'fifth', true, false);
INSERT INTO public.profiles_api_userprofile VALUES (6, 'pbkdf2_sha256$260000$BO1K5j0F7VWDQSzWiuU38w$EpLIg7c2BRnUpuw26Iz6LVCLmtLHrusvgN9D3AFlH+w=', NULL, false, 'sixth@profile.com', 'sixth', true, false);
INSERT INTO public.profiles_api_userprofile VALUES (1, 'pbkdf2_sha256$260000$HJL4VlF6Og940jKypitwXW$CY5/l53r05Q8CFj8q+zoZZe/dI2x4GJ3D3yr1nK30pE=', '2025-02-24 20:23:25.012361+00', true, 'admin@example.com', 'admin', true, true);


--
-- Data for Name: profiles_api_userprofile_groups; Type: TABLE DATA; Schema: public; Owner: devuser
--



--
-- Data for Name: profiles_api_userprofile_user_permissions; Type: TABLE DATA; Schema: public; Owner: devuser
--



--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: profiles_api_priflefeeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.profiles_api_priflefeeditem_id_seq', 37, true);


--
-- Name: profiles_api_userprofile_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.profiles_api_userprofile_groups_id_seq', 1, false);


--
-- Name: profiles_api_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.profiles_api_userprofile_id_seq', 6, true);


--
-- Name: profiles_api_userprofile_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.profiles_api_userprofile_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: profiles_api_profilefeeditem profiles_api_priflefeeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.profiles_api_profilefeeditem
    ADD CONSTRAINT profiles_api_priflefeeditem_pkey PRIMARY KEY (id);


--
-- Name: profiles_api_userprofile profiles_api_userprofile_email_key; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.profiles_api_userprofile
    ADD CONSTRAINT profiles_api_userprofile_email_key UNIQUE (email);


--
-- Name: profiles_api_userprofile_groups profiles_api_userprofile_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.profiles_api_userprofile_groups
    ADD CONSTRAINT profiles_api_userprofile_groups_pkey PRIMARY KEY (id);


--
-- Name: profiles_api_userprofile profiles_api_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.profiles_api_userprofile
    ADD CONSTRAINT profiles_api_userprofile_pkey PRIMARY KEY (id);


--
-- Name: profiles_api_userprofile_user_permissions profiles_api_userprofile_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.profiles_api_userprofile_user_permissions
    ADD CONSTRAINT profiles_api_userprofile_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: profiles_api_userprofile_groups profiles_api_userprofile_userprofile_id_group_id_e23efb29_uniq; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.profiles_api_userprofile_groups
    ADD CONSTRAINT profiles_api_userprofile_userprofile_id_group_id_e23efb29_uniq UNIQUE (userprofile_id, group_id);


--
-- Name: profiles_api_userprofile_user_permissions profiles_api_userprofile_userprofile_id_permissio_f7834f81_uniq; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.profiles_api_userprofile_user_permissions
    ADD CONSTRAINT profiles_api_userprofile_userprofile_id_permissio_f7834f81_uniq UNIQUE (userprofile_id, permission_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: profiles_api_priflefeeditem_user_profile_id_51ee784f; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX profiles_api_priflefeeditem_user_profile_id_51ee784f ON public.profiles_api_profilefeeditem USING btree (user_profile_id);


--
-- Name: profiles_api_userprofile_email_f0452d23_like; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX profiles_api_userprofile_email_f0452d23_like ON public.profiles_api_userprofile USING btree (email varchar_pattern_ops);


--
-- Name: profiles_api_userprofile_groups_group_id_e41039cd; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX profiles_api_userprofile_groups_group_id_e41039cd ON public.profiles_api_userprofile_groups USING btree (group_id);


--
-- Name: profiles_api_userprofile_groups_userprofile_id_c88d1a82; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX profiles_api_userprofile_groups_userprofile_id_c88d1a82 ON public.profiles_api_userprofile_groups USING btree (userprofile_id);


--
-- Name: profiles_api_userprofile_u_permission_id_eee8ea14; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX profiles_api_userprofile_u_permission_id_eee8ea14 ON public.profiles_api_userprofile_user_permissions USING btree (permission_id);


--
-- Name: profiles_api_userprofile_u_userprofile_id_3769fe58; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX profiles_api_userprofile_u_userprofile_id_3769fe58 ON public.profiles_api_userprofile_user_permissions USING btree (userprofile_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_profiles_api_userprofile_id; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_profiles_api_userprofile_id FOREIGN KEY (user_id) REFERENCES public.profiles_api_userprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_profiles_; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_profiles_ FOREIGN KEY (user_id) REFERENCES public.profiles_api_userprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_api_profilefeeditem profiles_api_priflef_user_profile_id_51ee784f_fk_profiles_; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.profiles_api_profilefeeditem
    ADD CONSTRAINT profiles_api_priflef_user_profile_id_51ee784f_fk_profiles_ FOREIGN KEY (user_profile_id) REFERENCES public.profiles_api_userprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_api_userprofile_groups profiles_api_userpro_group_id_e41039cd_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.profiles_api_userprofile_groups
    ADD CONSTRAINT profiles_api_userpro_group_id_e41039cd_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_api_userprofile_user_permissions profiles_api_userpro_permission_id_eee8ea14_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.profiles_api_userprofile_user_permissions
    ADD CONSTRAINT profiles_api_userpro_permission_id_eee8ea14_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_api_userprofile_user_permissions profiles_api_userpro_userprofile_id_3769fe58_fk_profiles_; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.profiles_api_userprofile_user_permissions
    ADD CONSTRAINT profiles_api_userpro_userprofile_id_3769fe58_fk_profiles_ FOREIGN KEY (userprofile_id) REFERENCES public.profiles_api_userprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_api_userprofile_groups profiles_api_userpro_userprofile_id_c88d1a82_fk_profiles_; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.profiles_api_userprofile_groups
    ADD CONSTRAINT profiles_api_userpro_userprofile_id_c88d1a82_fk_profiles_ FOREIGN KEY (userprofile_id) REFERENCES public.profiles_api_userprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

