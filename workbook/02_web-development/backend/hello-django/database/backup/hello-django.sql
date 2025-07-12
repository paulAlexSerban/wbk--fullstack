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
-- Name: hello_api_userprofile; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.hello_api_userprofile (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL
);


ALTER TABLE public.hello_api_userprofile OWNER TO devuser;

--
-- Name: hello_api_userprofile_groups; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.hello_api_userprofile_groups (
    id bigint NOT NULL,
    userprofile_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.hello_api_userprofile_groups OWNER TO devuser;

--
-- Name: hello_api_userprofile_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.hello_api_userprofile_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hello_api_userprofile_groups_id_seq OWNER TO devuser;

--
-- Name: hello_api_userprofile_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.hello_api_userprofile_groups_id_seq OWNED BY public.hello_api_userprofile_groups.id;


--
-- Name: hello_api_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.hello_api_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hello_api_userprofile_id_seq OWNER TO devuser;

--
-- Name: hello_api_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.hello_api_userprofile_id_seq OWNED BY public.hello_api_userprofile.id;


--
-- Name: hello_api_userprofile_user_permissions; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.hello_api_userprofile_user_permissions (
    id bigint NOT NULL,
    userprofile_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.hello_api_userprofile_user_permissions OWNER TO devuser;

--
-- Name: hello_api_userprofile_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.hello_api_userprofile_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hello_api_userprofile_user_permissions_id_seq OWNER TO devuser;

--
-- Name: hello_api_userprofile_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.hello_api_userprofile_user_permissions_id_seq OWNED BY public.hello_api_userprofile_user_permissions.id;


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
-- Name: hello_api_userprofile id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.hello_api_userprofile ALTER COLUMN id SET DEFAULT nextval('public.hello_api_userprofile_id_seq'::regclass);


--
-- Name: hello_api_userprofile_groups id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.hello_api_userprofile_groups ALTER COLUMN id SET DEFAULT nextval('public.hello_api_userprofile_groups_id_seq'::regclass);


--
-- Name: hello_api_userprofile_user_permissions id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.hello_api_userprofile_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.hello_api_userprofile_user_permissions_id_seq'::regclass);


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


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: devuser
--



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
INSERT INTO public.django_content_type VALUES (8, 'hello_api', 'userprofile');


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: devuser
--

INSERT INTO public.django_migrations VALUES (1, 'contenttypes', '0001_initial', '2025-02-22 20:00:10.54272+00');
INSERT INTO public.django_migrations VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2025-02-22 20:01:31.610665+00');
INSERT INTO public.django_migrations VALUES (3, 'auth', '0001_initial', '2025-02-22 20:01:31.628615+00');
INSERT INTO public.django_migrations VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2025-02-22 20:01:31.630566+00');
INSERT INTO public.django_migrations VALUES (5, 'auth', '0003_alter_user_email_max_length', '2025-02-22 20:01:31.632572+00');
INSERT INTO public.django_migrations VALUES (6, 'auth', '0004_alter_user_username_opts', '2025-02-22 20:01:31.634367+00');
INSERT INTO public.django_migrations VALUES (7, 'auth', '0005_alter_user_last_login_null', '2025-02-22 20:01:31.63662+00');
INSERT INTO public.django_migrations VALUES (8, 'auth', '0006_require_contenttypes_0002', '2025-02-22 20:01:31.637391+00');
INSERT INTO public.django_migrations VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2025-02-22 20:01:31.645249+00');
INSERT INTO public.django_migrations VALUES (10, 'auth', '0008_alter_user_username_max_length', '2025-02-22 20:01:31.647031+00');
INSERT INTO public.django_migrations VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2025-02-22 20:01:31.648742+00');
INSERT INTO public.django_migrations VALUES (12, 'auth', '0010_alter_group_name_max_length', '2025-02-22 20:01:31.651078+00');
INSERT INTO public.django_migrations VALUES (13, 'auth', '0011_update_proxy_permissions', '2025-02-22 20:01:31.652836+00');
INSERT INTO public.django_migrations VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2025-02-22 20:01:31.654499+00');
INSERT INTO public.django_migrations VALUES (15, 'hello_api', '0001_initial', '2025-02-22 20:01:31.67173+00');
INSERT INTO public.django_migrations VALUES (16, 'admin', '0001_initial', '2025-02-22 20:01:31.679753+00');
INSERT INTO public.django_migrations VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2025-02-22 20:01:31.681989+00');
INSERT INTO public.django_migrations VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2025-02-22 20:01:31.684249+00');
INSERT INTO public.django_migrations VALUES (19, 'authtoken', '0001_initial', '2025-02-22 20:01:31.690838+00');
INSERT INTO public.django_migrations VALUES (20, 'authtoken', '0002_auto_20160226_1747', '2025-02-22 20:01:31.697212+00');
INSERT INTO public.django_migrations VALUES (21, 'authtoken', '0003_tokenproxy', '2025-02-22 20:01:31.698106+00');
INSERT INTO public.django_migrations VALUES (22, 'sessions', '0001_initial', '2025-02-22 20:01:31.703783+00');
INSERT INTO public.django_migrations VALUES (23, 'hello_api', '0002_userprofile_is_root', '2025-02-22 20:05:02.337805+00');
INSERT INTO public.django_migrations VALUES (24, 'hello_api', '0003_remove_userprofile_is_root', '2025-02-22 20:06:49.87968+00');


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: devuser
--

INSERT INTO public.django_session VALUES ('rx61mtbko0jnib129u1vh0hfi9fkpgc0', '.eJxVjDsOwjAQBe_iGln4Ey-mpOcM1np3jQPIkeKkQtwdIqWA9s3Me6mE61LT2mVOI6uzMurwu2Wkh7QN8B3bbdI0tWUes94UvdOurxPL87K7fwcVe_3WCARWiiUv1gxgXAASBwjeHnOJPqAzkXJkFEPFsyCHYAo7ltOQPan3B-63OMA:1tmown:WAzE9AieLmTZl6r6M_6eaqRmmp2oj4122iuT0_Aoc5c', '2025-03-11 07:01:41.407659+00');


--
-- Data for Name: hello_api_userprofile; Type: TABLE DATA; Schema: public; Owner: devuser
--

INSERT INTO public.hello_api_userprofile VALUES (1, 'pbkdf2_sha256$260000$1fH9Uc1FvctdFwBwD5lZmY$pSid3nW8ASeJvbYWuNsiLBcicE58zi8Kfw4dmDzJaJ4=', '2025-02-25 07:01:41.406697+00', true, 'admin@example.com', 'admin', true, true);


--
-- Data for Name: hello_api_userprofile_groups; Type: TABLE DATA; Schema: public; Owner: devuser
--



--
-- Data for Name: hello_api_userprofile_user_permissions; Type: TABLE DATA; Schema: public; Owner: devuser
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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: hello_api_userprofile_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.hello_api_userprofile_groups_id_seq', 1, false);


--
-- Name: hello_api_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.hello_api_userprofile_id_seq', 1, true);


--
-- Name: hello_api_userprofile_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.hello_api_userprofile_user_permissions_id_seq', 1, false);


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
-- Name: hello_api_userprofile hello_api_userprofile_email_key; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.hello_api_userprofile
    ADD CONSTRAINT hello_api_userprofile_email_key UNIQUE (email);


--
-- Name: hello_api_userprofile_groups hello_api_userprofile_gr_userprofile_id_group_id_cc5e2c95_uniq; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.hello_api_userprofile_groups
    ADD CONSTRAINT hello_api_userprofile_gr_userprofile_id_group_id_cc5e2c95_uniq UNIQUE (userprofile_id, group_id);


--
-- Name: hello_api_userprofile_groups hello_api_userprofile_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.hello_api_userprofile_groups
    ADD CONSTRAINT hello_api_userprofile_groups_pkey PRIMARY KEY (id);


--
-- Name: hello_api_userprofile hello_api_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.hello_api_userprofile
    ADD CONSTRAINT hello_api_userprofile_pkey PRIMARY KEY (id);


--
-- Name: hello_api_userprofile_user_permissions hello_api_userprofile_us_userprofile_id_permissio_9c4bc9f5_uniq; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.hello_api_userprofile_user_permissions
    ADD CONSTRAINT hello_api_userprofile_us_userprofile_id_permissio_9c4bc9f5_uniq UNIQUE (userprofile_id, permission_id);


--
-- Name: hello_api_userprofile_user_permissions hello_api_userprofile_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.hello_api_userprofile_user_permissions
    ADD CONSTRAINT hello_api_userprofile_user_permissions_pkey PRIMARY KEY (id);


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
-- Name: hello_api_userprofile_email_28d73eb4_like; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX hello_api_userprofile_email_28d73eb4_like ON public.hello_api_userprofile USING btree (email varchar_pattern_ops);


--
-- Name: hello_api_userprofile_groups_group_id_b1f42e3a; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX hello_api_userprofile_groups_group_id_b1f42e3a ON public.hello_api_userprofile_groups USING btree (group_id);


--
-- Name: hello_api_userprofile_groups_userprofile_id_888d7be8; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX hello_api_userprofile_groups_userprofile_id_888d7be8 ON public.hello_api_userprofile_groups USING btree (userprofile_id);


--
-- Name: hello_api_userprofile_user_permissions_permission_id_56b4931f; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX hello_api_userprofile_user_permissions_permission_id_56b4931f ON public.hello_api_userprofile_user_permissions USING btree (permission_id);


--
-- Name: hello_api_userprofile_user_permissions_userprofile_id_08a907b3; Type: INDEX; Schema: public; Owner: devuser
--

CREATE INDEX hello_api_userprofile_user_permissions_userprofile_id_08a907b3 ON public.hello_api_userprofile_user_permissions USING btree (userprofile_id);


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
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_hello_api_userprofile_id; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_hello_api_userprofile_id FOREIGN KEY (user_id) REFERENCES public.hello_api_userprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_hello_api_userprofile_id; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_hello_api_userprofile_id FOREIGN KEY (user_id) REFERENCES public.hello_api_userprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hello_api_userprofile_user_permissions hello_api_userprofil_permission_id_56b4931f_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.hello_api_userprofile_user_permissions
    ADD CONSTRAINT hello_api_userprofil_permission_id_56b4931f_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hello_api_userprofile_user_permissions hello_api_userprofil_userprofile_id_08a907b3_fk_hello_api; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.hello_api_userprofile_user_permissions
    ADD CONSTRAINT hello_api_userprofil_userprofile_id_08a907b3_fk_hello_api FOREIGN KEY (userprofile_id) REFERENCES public.hello_api_userprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hello_api_userprofile_groups hello_api_userprofil_userprofile_id_888d7be8_fk_hello_api; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.hello_api_userprofile_groups
    ADD CONSTRAINT hello_api_userprofil_userprofile_id_888d7be8_fk_hello_api FOREIGN KEY (userprofile_id) REFERENCES public.hello_api_userprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hello_api_userprofile_groups hello_api_userprofile_groups_group_id_b1f42e3a_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.hello_api_userprofile_groups
    ADD CONSTRAINT hello_api_userprofile_groups_group_id_b1f42e3a_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

