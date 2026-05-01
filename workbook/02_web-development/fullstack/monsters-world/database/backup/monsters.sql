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
-- Name: habitats; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.habitats (
    id integer NOT NULL,
    name character varying(50),
    climate character varying(50),
    temperature integer
);


ALTER TABLE public.habitats OWNER TO devuser;

--
-- Name: habitats_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.habitats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.habitats_id_seq OWNER TO devuser;

--
-- Name: habitats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.habitats_id_seq OWNED BY public.habitats.id;


--
-- Name: lives; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.lives (
    id integer NOT NULL,
    monster character varying(50),
    habitat character varying(50)
);


ALTER TABLE public.lives OWNER TO devuser;

--
-- Name: lives_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.lives_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lives_id_seq OWNER TO devuser;

--
-- Name: lives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.lives_id_seq OWNED BY public.lives.id;


--
-- Name: monsters; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.monsters (
    id integer NOT NULL,
    name character varying(50),
    personality character varying(50)
);


ALTER TABLE public.monsters OWNER TO devuser;

--
-- Name: monsters_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.monsters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.monsters_id_seq OWNER TO devuser;

--
-- Name: monsters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.monsters_id_seq OWNED BY public.monsters.id;


--
-- Name: seeder_log; Type: TABLE; Schema: public; Owner: devuser
--

CREATE TABLE public.seeder_log (
    id integer NOT NULL,
    script_name character varying(255) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.seeder_log OWNER TO devuser;

--
-- Name: seeder_log_id_seq; Type: SEQUENCE; Schema: public; Owner: devuser
--

CREATE SEQUENCE public.seeder_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seeder_log_id_seq OWNER TO devuser;

--
-- Name: seeder_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: devuser
--

ALTER SEQUENCE public.seeder_log_id_seq OWNED BY public.seeder_log.id;


--
-- Name: habitats id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.habitats ALTER COLUMN id SET DEFAULT nextval('public.habitats_id_seq'::regclass);


--
-- Name: lives id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.lives ALTER COLUMN id SET DEFAULT nextval('public.lives_id_seq'::regclass);


--
-- Name: monsters id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.monsters ALTER COLUMN id SET DEFAULT nextval('public.monsters_id_seq'::regclass);


--
-- Name: seeder_log id; Type: DEFAULT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.seeder_log ALTER COLUMN id SET DEFAULT nextval('public.seeder_log_id_seq'::regclass);


--
-- Data for Name: habitats; Type: TABLE DATA; Schema: public; Owner: devuser
--

COPY public.habitats (id, name, climate, temperature) FROM stdin;
1	desert	dry	100
2	forrest	haunted	70
3	mountain	icy	30
4	ice-desert	wet	-100
\.


--
-- Data for Name: lives; Type: TABLE DATA; Schema: public; Owner: devuser
--

COPY public.lives (id, monster, habitat) FROM stdin;
1	Fluffy	desert
2	Noodles	forrest
3	Rusty	mountain
\.


--
-- Data for Name: monsters; Type: TABLE DATA; Schema: public; Owner: devuser
--

COPY public.monsters (id, name, personality) FROM stdin;
1	Fluffy	aggressive
2	Noodles	impatient
3	Rusty	passionate
4	Grumpy	friendly
5	Jully	barky
\.


--
-- Data for Name: seeder_log; Type: TABLE DATA; Schema: public; Owner: devuser
--

COPY public.seeder_log (id, script_name, executed_at) FROM stdin;
1	seed.sql	2025-02-23 12:55:19.766811
\.


--
-- Name: habitats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.habitats_id_seq', 4, true);


--
-- Name: lives_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.lives_id_seq', 3, true);


--
-- Name: monsters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.monsters_id_seq', 5, true);


--
-- Name: seeder_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: devuser
--

SELECT pg_catalog.setval('public.seeder_log_id_seq', 1, true);


--
-- Name: seeder_log seeder_log_pkey; Type: CONSTRAINT; Schema: public; Owner: devuser
--

ALTER TABLE ONLY public.seeder_log
    ADD CONSTRAINT seeder_log_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

