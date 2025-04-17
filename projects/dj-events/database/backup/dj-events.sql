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
-- Name: abouts; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.abouts (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.abouts OWNER TO admin;

--
-- Name: abouts_cmps; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.abouts_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.abouts_cmps OWNER TO admin;

--
-- Name: abouts_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.abouts_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abouts_cmps_id_seq OWNER TO admin;

--
-- Name: abouts_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.abouts_cmps_id_seq OWNED BY public.abouts_cmps.id;


--
-- Name: abouts_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.abouts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abouts_id_seq OWNER TO admin;

--
-- Name: abouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.abouts_id_seq OWNED BY public.abouts.id;


--
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    action_parameters jsonb,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_permissions OWNER TO admin;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_id_seq OWNER TO admin;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_permissions_role_lnk; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


ALTER TABLE public.admin_permissions_role_lnk OWNER TO admin;

--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.admin_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_role_lnk_id_seq OWNER TO admin;

--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.admin_permissions_role_lnk_id_seq OWNED BY public.admin_permissions_role_lnk.id;


--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_roles OWNER TO admin;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_roles_id_seq OWNER TO admin;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    document_id character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_users OWNER TO admin;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO admin;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: admin_users_roles_lnk; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_users_roles_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_ord double precision,
    user_ord double precision
);


ALTER TABLE public.admin_users_roles_lnk OWNER TO admin;

--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.admin_users_roles_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_roles_lnk_id_seq OWNER TO admin;

--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.admin_users_roles_lnk_id_seq OWNED BY public.admin_users_roles_lnk.id;


--
-- Name: articles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.articles (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    description text,
    slug character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.articles OWNER TO admin;

--
-- Name: articles_author_lnk; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.articles_author_lnk (
    id integer NOT NULL,
    article_id integer,
    author_id integer,
    article_ord double precision
);


ALTER TABLE public.articles_author_lnk OWNER TO admin;

--
-- Name: articles_author_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.articles_author_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_author_lnk_id_seq OWNER TO admin;

--
-- Name: articles_author_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.articles_author_lnk_id_seq OWNED BY public.articles_author_lnk.id;


--
-- Name: articles_category_lnk; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.articles_category_lnk (
    id integer NOT NULL,
    article_id integer,
    category_id integer,
    article_ord double precision
);


ALTER TABLE public.articles_category_lnk OWNER TO admin;

--
-- Name: articles_category_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.articles_category_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_category_lnk_id_seq OWNER TO admin;

--
-- Name: articles_category_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.articles_category_lnk_id_seq OWNED BY public.articles_category_lnk.id;


--
-- Name: articles_cmps; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.articles_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.articles_cmps OWNER TO admin;

--
-- Name: articles_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.articles_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_cmps_id_seq OWNER TO admin;

--
-- Name: articles_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.articles_cmps_id_seq OWNED BY public.articles_cmps.id;


--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_id_seq OWNER TO admin;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: authors; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.authors (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    email character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.authors OWNER TO admin;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO admin;

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    slug character varying(255),
    description text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.categories OWNER TO admin;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO admin;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: components_shared_media; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.components_shared_media (
    id integer NOT NULL
);


ALTER TABLE public.components_shared_media OWNER TO admin;

--
-- Name: components_shared_media_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.components_shared_media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_shared_media_id_seq OWNER TO admin;

--
-- Name: components_shared_media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.components_shared_media_id_seq OWNED BY public.components_shared_media.id;


--
-- Name: components_shared_quotes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.components_shared_quotes (
    id integer NOT NULL,
    title character varying(255),
    body text
);


ALTER TABLE public.components_shared_quotes OWNER TO admin;

--
-- Name: components_shared_quotes_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.components_shared_quotes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_shared_quotes_id_seq OWNER TO admin;

--
-- Name: components_shared_quotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.components_shared_quotes_id_seq OWNED BY public.components_shared_quotes.id;


--
-- Name: components_shared_rich_texts; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.components_shared_rich_texts (
    id integer NOT NULL,
    body text
);


ALTER TABLE public.components_shared_rich_texts OWNER TO admin;

--
-- Name: components_shared_rich_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.components_shared_rich_texts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_shared_rich_texts_id_seq OWNER TO admin;

--
-- Name: components_shared_rich_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.components_shared_rich_texts_id_seq OWNED BY public.components_shared_rich_texts.id;


--
-- Name: components_shared_seos; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.components_shared_seos (
    id integer NOT NULL,
    meta_title character varying(255),
    meta_description text
);


ALTER TABLE public.components_shared_seos OWNER TO admin;

--
-- Name: components_shared_seos_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.components_shared_seos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_shared_seos_id_seq OWNER TO admin;

--
-- Name: components_shared_seos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.components_shared_seos_id_seq OWNED BY public.components_shared_seos.id;


--
-- Name: components_shared_sliders; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.components_shared_sliders (
    id integer NOT NULL
);


ALTER TABLE public.components_shared_sliders OWNER TO admin;

--
-- Name: components_shared_sliders_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.components_shared_sliders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_shared_sliders_id_seq OWNER TO admin;

--
-- Name: components_shared_sliders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.components_shared_sliders_id_seq OWNED BY public.components_shared_sliders.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.files (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.files OWNER TO admin;

--
-- Name: files_folder_lnk; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.files_folder_lnk (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_ord double precision
);


ALTER TABLE public.files_folder_lnk OWNER TO admin;

--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.files_folder_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_folder_lnk_id_seq OWNER TO admin;

--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.files_folder_lnk_id_seq OWNED BY public.files_folder_lnk.id;


--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO admin;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related_mph; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.files_related_mph (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.files_related_mph OWNER TO admin;

--
-- Name: files_related_mph_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.files_related_mph_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_related_mph_id_seq OWNER TO admin;

--
-- Name: files_related_mph_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.files_related_mph_id_seq OWNED BY public.files_related_mph.id;


--
-- Name: globals; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.globals (
    id integer NOT NULL,
    document_id character varying(255),
    site_name character varying(255),
    site_description text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.globals OWNER TO admin;

--
-- Name: globals_cmps; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.globals_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.globals_cmps OWNER TO admin;

--
-- Name: globals_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.globals_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.globals_cmps_id_seq OWNER TO admin;

--
-- Name: globals_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.globals_cmps_id_seq OWNED BY public.globals_cmps.id;


--
-- Name: globals_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.globals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.globals_id_seq OWNER TO admin;

--
-- Name: globals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.globals_id_seq OWNED BY public.globals.id;


--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.i18n_locale OWNER TO admin;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.i18n_locale_id_seq OWNER TO admin;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_api_token_permissions OWNER TO admin;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_id_seq OWNER TO admin;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- Name: strapi_api_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.strapi_api_token_permissions_token_lnk (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_ord double precision
);


ALTER TABLE public.strapi_api_token_permissions_token_lnk OWNER TO admin;

--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_token_lnk_id_seq OWNER TO admin;

--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq OWNED BY public.strapi_api_token_permissions_token_lnk.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_api_tokens OWNER TO admin;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_tokens_id_seq OWNER TO admin;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO admin;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_core_store_settings_id_seq OWNER TO admin;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO admin;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_database_schema_id_seq OWNER TO admin;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- Name: strapi_history_versions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.strapi_history_versions (
    id integer NOT NULL,
    content_type character varying(255) NOT NULL,
    related_document_id character varying(255),
    locale character varying(255),
    status character varying(255),
    data jsonb,
    schema jsonb,
    created_at timestamp(6) without time zone,
    created_by_id integer
);


ALTER TABLE public.strapi_history_versions OWNER TO admin;

--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.strapi_history_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_history_versions_id_seq OWNER TO admin;

--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.strapi_history_versions_id_seq OWNED BY public.strapi_history_versions.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO admin;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_migrations_id_seq OWNER TO admin;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- Name: strapi_migrations_internal; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.strapi_migrations_internal (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations_internal OWNER TO admin;

--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.strapi_migrations_internal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_migrations_internal_id_seq OWNER TO admin;

--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.strapi_migrations_internal_id_seq OWNED BY public.strapi_migrations_internal.id;


--
-- Name: strapi_release_actions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.strapi_release_actions (
    id integer NOT NULL,
    document_id character varying(255),
    type character varying(255),
    content_type character varying(255),
    entry_document_id character varying(255),
    locale character varying(255),
    is_entry_valid boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_release_actions OWNER TO admin;

--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.strapi_release_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_release_actions_id_seq OWNER TO admin;

--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.strapi_release_actions_id_seq OWNED BY public.strapi_release_actions.id;


--
-- Name: strapi_release_actions_release_lnk; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.strapi_release_actions_release_lnk (
    id integer NOT NULL,
    release_action_id integer,
    release_id integer,
    release_action_ord double precision
);


ALTER TABLE public.strapi_release_actions_release_lnk OWNER TO admin;

--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.strapi_release_actions_release_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_release_actions_release_lnk_id_seq OWNER TO admin;

--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.strapi_release_actions_release_lnk_id_seq OWNED BY public.strapi_release_actions_release_lnk.id;


--
-- Name: strapi_releases; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.strapi_releases (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    released_at timestamp(6) without time zone,
    scheduled_at timestamp(6) without time zone,
    timezone character varying(255),
    status character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_releases OWNER TO admin;

--
-- Name: strapi_releases_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.strapi_releases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_releases_id_seq OWNER TO admin;

--
-- Name: strapi_releases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.strapi_releases_id_seq OWNED BY public.strapi_releases.id;


--
-- Name: strapi_transfer_token_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_transfer_token_permissions OWNER TO admin;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_transfer_token_permissions_id_seq OWNER TO admin;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;


--
-- Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.strapi_transfer_token_permissions_token_lnk (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_ord double precision
);


ALTER TABLE public.strapi_transfer_token_permissions_token_lnk OWNER TO admin;

--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_transfer_token_permissions_token_lnk_id_seq OWNER TO admin;

--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq OWNED BY public.strapi_transfer_token_permissions_token_lnk.id;


--
-- Name: strapi_transfer_tokens; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_transfer_tokens OWNER TO admin;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_transfer_tokens_id_seq OWNER TO admin;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO admin;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_webhooks_id_seq OWNER TO admin;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: strapi_workflows; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.strapi_workflows (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    content_types jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_workflows OWNER TO admin;

--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.strapi_workflows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_workflows_id_seq OWNER TO admin;

--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.strapi_workflows_id_seq OWNED BY public.strapi_workflows.id;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.strapi_workflows_stage_required_to_publish_lnk (
    id integer NOT NULL,
    workflow_id integer,
    workflow_stage_id integer
);


ALTER TABLE public.strapi_workflows_stage_required_to_publish_lnk OWNER TO admin;

--
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_workflows_stage_required_to_publish_lnk_id_seq OWNER TO admin;

--
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq OWNED BY public.strapi_workflows_stage_required_to_publish_lnk.id;


--
-- Name: strapi_workflows_stages; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.strapi_workflows_stages (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    color character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_workflows_stages OWNER TO admin;

--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.strapi_workflows_stages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_workflows_stages_id_seq OWNER TO admin;

--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.strapi_workflows_stages_id_seq OWNED BY public.strapi_workflows_stages.id;


--
-- Name: strapi_workflows_stages_permissions_lnk; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.strapi_workflows_stages_permissions_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    permission_id integer,
    permission_ord double precision
);


ALTER TABLE public.strapi_workflows_stages_permissions_lnk OWNER TO admin;

--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_workflows_stages_permissions_lnk_id_seq OWNER TO admin;

--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq OWNED BY public.strapi_workflows_stages_permissions_lnk.id;


--
-- Name: strapi_workflows_stages_workflow_lnk; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.strapi_workflows_stages_workflow_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    workflow_id integer,
    workflow_stage_ord double precision
);


ALTER TABLE public.strapi_workflows_stages_workflow_lnk OWNER TO admin;

--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_workflows_stages_workflow_lnk_id_seq OWNER TO admin;

--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq OWNED BY public.strapi_workflows_stages_workflow_lnk.id;


--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_permissions OWNER TO admin;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_id_seq OWNER TO admin;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- Name: up_permissions_role_lnk; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.up_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


ALTER TABLE public.up_permissions_role_lnk OWNER TO admin;

--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.up_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_role_lnk_id_seq OWNER TO admin;

--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.up_permissions_role_lnk_id_seq OWNED BY public.up_permissions_role_lnk.id;


--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_roles OWNER TO admin;

--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_roles_id_seq OWNER TO admin;

--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    document_id character varying(255),
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_users OWNER TO admin;

--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_id_seq OWNER TO admin;

--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- Name: up_users_role_lnk; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.up_users_role_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_ord double precision
);


ALTER TABLE public.up_users_role_lnk OWNER TO admin;

--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.up_users_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_role_lnk_id_seq OWNER TO admin;

--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.up_users_role_lnk_id_seq OWNED BY public.up_users_role_lnk.id;


--
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.upload_folders OWNER TO admin;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_id_seq OWNER TO admin;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- Name: upload_folders_parent_lnk; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.upload_folders_parent_lnk (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_ord double precision
);


ALTER TABLE public.upload_folders_parent_lnk OWNER TO admin;

--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.upload_folders_parent_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_parent_lnk_id_seq OWNER TO admin;

--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.upload_folders_parent_lnk_id_seq OWNED BY public.upload_folders_parent_lnk.id;


--
-- Name: abouts id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.abouts ALTER COLUMN id SET DEFAULT nextval('public.abouts_id_seq'::regclass);


--
-- Name: abouts_cmps id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.abouts_cmps ALTER COLUMN id SET DEFAULT nextval('public.abouts_cmps_id_seq'::regclass);


--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: admin_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_lnk_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: admin_users_roles_lnk id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_users_roles_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_lnk_id_seq'::regclass);


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: articles_author_lnk id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.articles_author_lnk ALTER COLUMN id SET DEFAULT nextval('public.articles_author_lnk_id_seq'::regclass);


--
-- Name: articles_category_lnk id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.articles_category_lnk ALTER COLUMN id SET DEFAULT nextval('public.articles_category_lnk_id_seq'::regclass);


--
-- Name: articles_cmps id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.articles_cmps ALTER COLUMN id SET DEFAULT nextval('public.articles_cmps_id_seq'::regclass);


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: components_shared_media id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.components_shared_media ALTER COLUMN id SET DEFAULT nextval('public.components_shared_media_id_seq'::regclass);


--
-- Name: components_shared_quotes id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.components_shared_quotes ALTER COLUMN id SET DEFAULT nextval('public.components_shared_quotes_id_seq'::regclass);


--
-- Name: components_shared_rich_texts id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.components_shared_rich_texts ALTER COLUMN id SET DEFAULT nextval('public.components_shared_rich_texts_id_seq'::regclass);


--
-- Name: components_shared_seos id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.components_shared_seos ALTER COLUMN id SET DEFAULT nextval('public.components_shared_seos_id_seq'::regclass);


--
-- Name: components_shared_sliders id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.components_shared_sliders ALTER COLUMN id SET DEFAULT nextval('public.components_shared_sliders_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: files_folder_lnk id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.files_folder_lnk ALTER COLUMN id SET DEFAULT nextval('public.files_folder_lnk_id_seq'::regclass);


--
-- Name: files_related_mph id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.files_related_mph ALTER COLUMN id SET DEFAULT nextval('public.files_related_mph_id_seq'::regclass);


--
-- Name: globals id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.globals ALTER COLUMN id SET DEFAULT nextval('public.globals_id_seq'::regclass);


--
-- Name: globals_cmps id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.globals_cmps ALTER COLUMN id SET DEFAULT nextval('public.globals_cmps_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_lnk_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_history_versions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_history_versions ALTER COLUMN id SET DEFAULT nextval('public.strapi_history_versions_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_migrations_internal id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_migrations_internal ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_internal_id_seq'::regclass);


--
-- Name: strapi_release_actions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_release_actions ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_id_seq'::regclass);


--
-- Name: strapi_release_actions_release_lnk id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_release_lnk_id_seq'::regclass);


--
-- Name: strapi_releases id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_releases ALTER COLUMN id SET DEFAULT nextval('public.strapi_releases_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_lnk_id_seq'::regclass);


--
-- Name: strapi_transfer_tokens id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: strapi_workflows id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_id_seq'::regclass);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq'::regclass);


--
-- Name: strapi_workflows_stages id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows_stages ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_id_seq'::regclass);


--
-- Name: strapi_workflows_stages_permissions_lnk id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_permissions_lnk_id_seq'::regclass);


--
-- Name: strapi_workflows_stages_workflow_lnk id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_workflow_lnk_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- Name: up_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_lnk_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- Name: up_users_role_lnk id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_users_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_lnk_id_seq'::regclass);


--
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- Name: upload_folders_parent_lnk id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.upload_folders_parent_lnk ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_lnk_id_seq'::regclass);


--
-- Data for Name: abouts; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: abouts_cmps; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_permissions VALUES (1, 'gu14oms17a963rcllmpg3n67', 'plugin::content-manager.explorer.create', '{}', 'api::about.about', '{"fields": ["title", "blocks"]}', '[]', '2025-04-16 18:46:33.962', '2025-04-16 18:46:33.962', '2025-04-16 18:46:33.962', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (2, 'nzvkgd6lh0623ne9n4ttz6x8', 'plugin::content-manager.explorer.create', '{}', 'api::article.article', '{"fields": ["title", "description", "slug", "cover", "author", "category", "blocks"]}', '[]', '2025-04-16 18:46:33.968', '2025-04-16 18:46:33.968', '2025-04-16 18:46:33.968', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (3, 'h5y3uhn5vmpag40lgr1ie2f9', 'plugin::content-manager.explorer.create', '{}', 'api::author.author', '{"fields": ["name", "avatar", "email", "articles"]}', '[]', '2025-04-16 18:46:33.969', '2025-04-16 18:46:33.969', '2025-04-16 18:46:33.969', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (4, 'rbiner3k0264st9z7buoj05k', 'plugin::content-manager.explorer.create', '{}', 'api::category.category', '{"fields": ["name", "slug", "articles", "description"]}', '[]', '2025-04-16 18:46:33.97', '2025-04-16 18:46:33.97', '2025-04-16 18:46:33.97', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (5, 'mmj3ck6vw1w63zv2wajl8gjd', 'plugin::content-manager.explorer.create', '{}', 'api::global.global', '{"fields": ["siteName", "favicon", "siteDescription", "defaultSeo.metaTitle", "defaultSeo.metaDescription", "defaultSeo.shareImage"]}', '[]', '2025-04-16 18:46:33.972', '2025-04-16 18:46:33.972', '2025-04-16 18:46:33.972', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (6, 'vipe61dic6yiui8pwrd0l42b', 'plugin::content-manager.explorer.read', '{}', 'api::about.about', '{"fields": ["title", "blocks"]}', '[]', '2025-04-16 18:46:33.974', '2025-04-16 18:46:33.974', '2025-04-16 18:46:33.974', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (7, 'uiqhzkj7aydh3zn0m1kxd3lf', 'plugin::content-manager.explorer.read', '{}', 'api::article.article', '{"fields": ["title", "description", "slug", "cover", "author", "category", "blocks"]}', '[]', '2025-04-16 18:46:33.976', '2025-04-16 18:46:33.976', '2025-04-16 18:46:33.976', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (8, 'xtj6mw0f8stj6hoyezrru97l', 'plugin::content-manager.explorer.read', '{}', 'api::author.author', '{"fields": ["name", "avatar", "email", "articles"]}', '[]', '2025-04-16 18:46:33.978', '2025-04-16 18:46:33.978', '2025-04-16 18:46:33.978', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (9, 'ix2kj51zocz4zcg3dhgd5jgz', 'plugin::content-manager.explorer.read', '{}', 'api::category.category', '{"fields": ["name", "slug", "articles", "description"]}', '[]', '2025-04-16 18:46:33.979', '2025-04-16 18:46:33.979', '2025-04-16 18:46:33.979', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (10, 'hrplwivdmgppbazytu321yvw', 'plugin::content-manager.explorer.read', '{}', 'api::global.global', '{"fields": ["siteName", "favicon", "siteDescription", "defaultSeo.metaTitle", "defaultSeo.metaDescription", "defaultSeo.shareImage"]}', '[]', '2025-04-16 18:46:33.981', '2025-04-16 18:46:33.981', '2025-04-16 18:46:33.981', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (11, 'diphubttt74886dyui6s35kq', 'plugin::content-manager.explorer.update', '{}', 'api::about.about', '{"fields": ["title", "blocks"]}', '[]', '2025-04-16 18:46:33.983', '2025-04-16 18:46:33.983', '2025-04-16 18:46:33.983', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (12, 'ue2zaue2zuej56auz9xsyngt', 'plugin::content-manager.explorer.update', '{}', 'api::article.article', '{"fields": ["title", "description", "slug", "cover", "author", "category", "blocks"]}', '[]', '2025-04-16 18:46:33.986', '2025-04-16 18:46:33.986', '2025-04-16 18:46:33.986', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (13, 'sf0i9lyiibaczbef6kaqrngc', 'plugin::content-manager.explorer.update', '{}', 'api::author.author', '{"fields": ["name", "avatar", "email", "articles"]}', '[]', '2025-04-16 18:46:33.987', '2025-04-16 18:46:33.987', '2025-04-16 18:46:33.987', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (14, 'b1sxor3tsbb1rguerme4e4el', 'plugin::content-manager.explorer.update', '{}', 'api::category.category', '{"fields": ["name", "slug", "articles", "description"]}', '[]', '2025-04-16 18:46:33.988', '2025-04-16 18:46:33.988', '2025-04-16 18:46:33.988', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (15, 'vswk2mosnl1ynmbagi7nztn3', 'plugin::content-manager.explorer.update', '{}', 'api::global.global', '{"fields": ["siteName", "favicon", "siteDescription", "defaultSeo.metaTitle", "defaultSeo.metaDescription", "defaultSeo.shareImage"]}', '[]', '2025-04-16 18:46:33.99', '2025-04-16 18:46:33.99', '2025-04-16 18:46:33.99', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (16, 'umzx0bwih8w9jbix2quraj08', 'plugin::content-manager.explorer.delete', '{}', 'api::about.about', '{}', '[]', '2025-04-16 18:46:33.991', '2025-04-16 18:46:33.991', '2025-04-16 18:46:33.991', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (17, 'vx5zv3jpliz5fgrxkro2ewbe', 'plugin::content-manager.explorer.delete', '{}', 'api::article.article', '{}', '[]', '2025-04-16 18:46:33.992', '2025-04-16 18:46:33.992', '2025-04-16 18:46:33.992', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (18, 'vncmwm5xc7jiiybxfbqfphse', 'plugin::content-manager.explorer.delete', '{}', 'api::author.author', '{}', '[]', '2025-04-16 18:46:33.994', '2025-04-16 18:46:33.994', '2025-04-16 18:46:33.994', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (19, 'iaxsjkjarsb1pkzt8q8rtu9c', 'plugin::content-manager.explorer.delete', '{}', 'api::category.category', '{}', '[]', '2025-04-16 18:46:33.995', '2025-04-16 18:46:33.995', '2025-04-16 18:46:33.995', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (20, 'jwvkxsa9sroduxim64uy02fu', 'plugin::content-manager.explorer.delete', '{}', 'api::global.global', '{}', '[]', '2025-04-16 18:46:33.996', '2025-04-16 18:46:33.996', '2025-04-16 18:46:33.996', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (21, 'y5jcmg9om6tjkpj6gl23q6y9', 'plugin::content-manager.explorer.publish', '{}', 'api::about.about', '{}', '[]', '2025-04-16 18:46:33.997', '2025-04-16 18:46:33.997', '2025-04-16 18:46:33.997', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (22, 'p4te004v5mq0bga523rbxip4', 'plugin::content-manager.explorer.publish', '{}', 'api::article.article', '{}', '[]', '2025-04-16 18:46:33.998', '2025-04-16 18:46:33.998', '2025-04-16 18:46:33.999', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (23, 'npbxj3bha0updpc53e91mals', 'plugin::content-manager.explorer.publish', '{}', 'api::author.author', '{}', '[]', '2025-04-16 18:46:34', '2025-04-16 18:46:34', '2025-04-16 18:46:34', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (24, 'vglwum8cb2vko35xgyfyz2es', 'plugin::content-manager.explorer.publish', '{}', 'api::category.category', '{}', '[]', '2025-04-16 18:46:34.004', '2025-04-16 18:46:34.004', '2025-04-16 18:46:34.004', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (25, 'e5wrglyecd7gbgul3l205p9p', 'plugin::content-manager.explorer.publish', '{}', 'api::global.global', '{}', '[]', '2025-04-16 18:46:34.005', '2025-04-16 18:46:34.005', '2025-04-16 18:46:34.005', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (26, 'f3492n6cx07rdoc1gr6vzg7g', 'plugin::upload.read', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.006', '2025-04-16 18:46:34.006', '2025-04-16 18:46:34.006', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (27, 'fgillgbkpv71gnsasasy7n2u', 'plugin::upload.configure-view', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.007', '2025-04-16 18:46:34.007', '2025-04-16 18:46:34.007', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (28, 'n12t2csfgazm2349yb86vz77', 'plugin::upload.assets.create', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.008', '2025-04-16 18:46:34.008', '2025-04-16 18:46:34.008', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (29, 'g5lhljx5bmwfo3qbgfxzqeks', 'plugin::upload.assets.update', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.01', '2025-04-16 18:46:34.01', '2025-04-16 18:46:34.01', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (30, 'uos366pt2awb5jj6n360honb', 'plugin::upload.assets.download', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.011', '2025-04-16 18:46:34.011', '2025-04-16 18:46:34.011', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (31, 'aew8ioydea76va71ply1v2q8', 'plugin::upload.assets.copy-link', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.012', '2025-04-16 18:46:34.012', '2025-04-16 18:46:34.012', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (32, 'nes2f2wqh1ug5d0uvul84sft', 'plugin::content-manager.explorer.create', '{}', 'api::about.about', '{"fields": ["title", "blocks"]}', '["admin::is-creator"]', '2025-04-16 18:46:34.015', '2025-04-16 18:46:34.015', '2025-04-16 18:46:34.015', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (33, 'lucvjovtvmycyv2e4bj787kc', 'plugin::content-manager.explorer.create', '{}', 'api::article.article', '{"fields": ["title", "description", "slug", "cover", "author", "category", "blocks"]}', '["admin::is-creator"]', '2025-04-16 18:46:34.017', '2025-04-16 18:46:34.017', '2025-04-16 18:46:34.017', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (34, 'r5dj0ub3k5s8eyrn0ysmcvio', 'plugin::content-manager.explorer.create', '{}', 'api::author.author', '{"fields": ["name", "avatar", "email", "articles"]}', '["admin::is-creator"]', '2025-04-16 18:46:34.019', '2025-04-16 18:46:34.019', '2025-04-16 18:46:34.019', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (35, 'lqg9cnv6et3tzmjfwh43g2rw', 'plugin::content-manager.explorer.create', '{}', 'api::category.category', '{"fields": ["name", "slug", "articles", "description"]}', '["admin::is-creator"]', '2025-04-16 18:46:34.02', '2025-04-16 18:46:34.02', '2025-04-16 18:46:34.02', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (36, 'innmxlnamgbsj4586yzvo4lp', 'plugin::content-manager.explorer.create', '{}', 'api::global.global', '{"fields": ["siteName", "favicon", "siteDescription", "defaultSeo.metaTitle", "defaultSeo.metaDescription", "defaultSeo.shareImage"]}', '["admin::is-creator"]', '2025-04-16 18:46:34.021', '2025-04-16 18:46:34.021', '2025-04-16 18:46:34.021', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (37, 'dniydrfqj4c56hxl32d8zdih', 'plugin::content-manager.explorer.read', '{}', 'api::about.about', '{"fields": ["title", "blocks"]}', '["admin::is-creator"]', '2025-04-16 18:46:34.023', '2025-04-16 18:46:34.023', '2025-04-16 18:46:34.023', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (38, 'g2m01b8s6cjjgvic49mil77w', 'plugin::content-manager.explorer.read', '{}', 'api::article.article', '{"fields": ["title", "description", "slug", "cover", "author", "category", "blocks"]}', '["admin::is-creator"]', '2025-04-16 18:46:34.024', '2025-04-16 18:46:34.024', '2025-04-16 18:46:34.024', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (39, 'bubldj5njm167vcfnrliulsv', 'plugin::content-manager.explorer.read', '{}', 'api::author.author', '{"fields": ["name", "avatar", "email", "articles"]}', '["admin::is-creator"]', '2025-04-16 18:46:34.025', '2025-04-16 18:46:34.025', '2025-04-16 18:46:34.025', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (40, 'tbs22aqeo6s9c9lewttey8w6', 'plugin::content-manager.explorer.read', '{}', 'api::category.category', '{"fields": ["name", "slug", "articles", "description"]}', '["admin::is-creator"]', '2025-04-16 18:46:34.027', '2025-04-16 18:46:34.027', '2025-04-16 18:46:34.027', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (41, 'gafvjhfusurff3mkl9vsw69g', 'plugin::content-manager.explorer.read', '{}', 'api::global.global', '{"fields": ["siteName", "favicon", "siteDescription", "defaultSeo.metaTitle", "defaultSeo.metaDescription", "defaultSeo.shareImage"]}', '["admin::is-creator"]', '2025-04-16 18:46:34.032', '2025-04-16 18:46:34.032', '2025-04-16 18:46:34.032', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (42, 'yq5g9n47kqyjfre4fh2nko1w', 'plugin::content-manager.explorer.update', '{}', 'api::about.about', '{"fields": ["title", "blocks"]}', '["admin::is-creator"]', '2025-04-16 18:46:34.033', '2025-04-16 18:46:34.033', '2025-04-16 18:46:34.033', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (43, 'blynhx3t4ow3we0n3l4bana9', 'plugin::content-manager.explorer.update', '{}', 'api::article.article', '{"fields": ["title", "description", "slug", "cover", "author", "category", "blocks"]}', '["admin::is-creator"]', '2025-04-16 18:46:34.035', '2025-04-16 18:46:34.035', '2025-04-16 18:46:34.035', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (44, 'hqiimmj18cdtp0gl20bihp1b', 'plugin::content-manager.explorer.update', '{}', 'api::author.author', '{"fields": ["name", "avatar", "email", "articles"]}', '["admin::is-creator"]', '2025-04-16 18:46:34.036', '2025-04-16 18:46:34.036', '2025-04-16 18:46:34.036', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (45, 'qp05jphjvt80qpju5ibtzuw5', 'plugin::content-manager.explorer.update', '{}', 'api::category.category', '{"fields": ["name", "slug", "articles", "description"]}', '["admin::is-creator"]', '2025-04-16 18:46:34.037', '2025-04-16 18:46:34.037', '2025-04-16 18:46:34.038', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (46, 'd61zgl91uscxja3q3u3iyiaj', 'plugin::content-manager.explorer.update', '{}', 'api::global.global', '{"fields": ["siteName", "favicon", "siteDescription", "defaultSeo.metaTitle", "defaultSeo.metaDescription", "defaultSeo.shareImage"]}', '["admin::is-creator"]', '2025-04-16 18:46:34.039', '2025-04-16 18:46:34.039', '2025-04-16 18:46:34.039', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (47, 'sli88gf0ma7myea4bs799mv4', 'plugin::content-manager.explorer.delete', '{}', 'api::about.about', '{}', '["admin::is-creator"]', '2025-04-16 18:46:34.04', '2025-04-16 18:46:34.04', '2025-04-16 18:46:34.04', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (48, 'o5m3scqh22sl9l5ym5t4jy70', 'plugin::content-manager.explorer.delete', '{}', 'api::article.article', '{}', '["admin::is-creator"]', '2025-04-16 18:46:34.041', '2025-04-16 18:46:34.041', '2025-04-16 18:46:34.041', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (49, 'q4a9yg94gsq99e8vxbd5qlms', 'plugin::content-manager.explorer.delete', '{}', 'api::author.author', '{}', '["admin::is-creator"]', '2025-04-16 18:46:34.043', '2025-04-16 18:46:34.043', '2025-04-16 18:46:34.043', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (50, 'gekxikfcnx90wdy9phdp4ab3', 'plugin::content-manager.explorer.delete', '{}', 'api::category.category', '{}', '["admin::is-creator"]', '2025-04-16 18:46:34.045', '2025-04-16 18:46:34.045', '2025-04-16 18:46:34.045', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (51, 'n96frw6sc8bcpribo84qzp61', 'plugin::content-manager.explorer.delete', '{}', 'api::global.global', '{}', '["admin::is-creator"]', '2025-04-16 18:46:34.047', '2025-04-16 18:46:34.047', '2025-04-16 18:46:34.047', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (52, 'u5wxdzt6n3x8bcsw5g0gtx3b', 'plugin::upload.read', '{}', NULL, '{}', '["admin::is-creator"]', '2025-04-16 18:46:34.048', '2025-04-16 18:46:34.048', '2025-04-16 18:46:34.048', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (53, 'euxup1nzb7whd85g5kct9y16', 'plugin::upload.configure-view', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.05', '2025-04-16 18:46:34.05', '2025-04-16 18:46:34.05', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (54, 'b3ricsmdkjowgbw9lkl2mn8e', 'plugin::upload.assets.create', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.051', '2025-04-16 18:46:34.051', '2025-04-16 18:46:34.052', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (55, 'gtdo1gfiei7v17vi68o2gf96', 'plugin::upload.assets.update', '{}', NULL, '{}', '["admin::is-creator"]', '2025-04-16 18:46:34.053', '2025-04-16 18:46:34.053', '2025-04-16 18:46:34.053', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (56, 'v2w6lkjqxt0n0irs9rsmnb3w', 'plugin::upload.assets.download', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.054', '2025-04-16 18:46:34.054', '2025-04-16 18:46:34.054', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (57, 'bczysuj9ubd0z7pri9pnv1fs', 'plugin::upload.assets.copy-link', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.057', '2025-04-16 18:46:34.057', '2025-04-16 18:46:34.057', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (58, 'k6zlbypa7zcg6q1xb9ka6pcb', 'plugin::content-manager.explorer.create', '{}', 'plugin::users-permissions.user', '{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}', '[]', '2025-04-16 18:46:34.074', '2025-04-16 18:46:34.074', '2025-04-16 18:46:34.074', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (59, 'qab0e89uzqpf7mdo3ff9e2r7', 'plugin::content-manager.explorer.create', '{}', 'api::about.about', '{"fields": ["title", "blocks"]}', '[]', '2025-04-16 18:46:34.079', '2025-04-16 18:46:34.079', '2025-04-16 18:46:34.08', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (60, 'pdhxr5uf31oxtaj3sevvk57t', 'plugin::content-manager.explorer.create', '{}', 'api::article.article', '{"fields": ["title", "description", "slug", "cover", "author", "category", "blocks"]}', '[]', '2025-04-16 18:46:34.082', '2025-04-16 18:46:34.082', '2025-04-16 18:46:34.082', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (61, 'psu3urqyycmbclyizd6gggic', 'plugin::content-manager.explorer.create', '{}', 'api::author.author', '{"fields": ["name", "avatar", "email", "articles"]}', '[]', '2025-04-16 18:46:34.084', '2025-04-16 18:46:34.084', '2025-04-16 18:46:34.084', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (62, 'g9x7hnhr96nt5etek9l0r40t', 'plugin::content-manager.explorer.create', '{}', 'api::category.category', '{"fields": ["name", "slug", "articles", "description"]}', '[]', '2025-04-16 18:46:34.086', '2025-04-16 18:46:34.086', '2025-04-16 18:46:34.086', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (63, 'fpv3jr3g7q51ves0edhikxmq', 'plugin::content-manager.explorer.create', '{}', 'api::global.global', '{"fields": ["siteName", "favicon", "siteDescription", "defaultSeo.metaTitle", "defaultSeo.metaDescription", "defaultSeo.shareImage"]}', '[]', '2025-04-16 18:46:34.089', '2025-04-16 18:46:34.089', '2025-04-16 18:46:34.089', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (64, 'htymuikun1mp6vi4mpdt9r92', 'plugin::content-manager.explorer.read', '{}', 'plugin::users-permissions.user', '{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}', '[]', '2025-04-16 18:46:34.092', '2025-04-16 18:46:34.092', '2025-04-16 18:46:34.092', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (65, 'zfrt7zfkhhrlk5y39r9ppkgp', 'plugin::content-manager.explorer.read', '{}', 'api::about.about', '{"fields": ["title", "blocks"]}', '[]', '2025-04-16 18:46:34.094', '2025-04-16 18:46:34.094', '2025-04-16 18:46:34.095', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (66, 'l371okv9mo268s20d29p83z5', 'plugin::content-manager.explorer.read', '{}', 'api::article.article', '{"fields": ["title", "description", "slug", "cover", "author", "category", "blocks"]}', '[]', '2025-04-16 18:46:34.1', '2025-04-16 18:46:34.1', '2025-04-16 18:46:34.1', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (67, 'emosnyfkfw1dnlh0od4wvujb', 'plugin::content-manager.explorer.read', '{}', 'api::author.author', '{"fields": ["name", "avatar", "email", "articles"]}', '[]', '2025-04-16 18:46:34.102', '2025-04-16 18:46:34.102', '2025-04-16 18:46:34.102', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (68, 'ch23n5f3e4jornxftczdt0jj', 'plugin::content-manager.explorer.read', '{}', 'api::category.category', '{"fields": ["name", "slug", "articles", "description"]}', '[]', '2025-04-16 18:46:34.104', '2025-04-16 18:46:34.104', '2025-04-16 18:46:34.104', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (69, 'o1jaaqrr5swxjvkxy9r69x78', 'plugin::content-manager.explorer.read', '{}', 'api::global.global', '{"fields": ["siteName", "favicon", "siteDescription", "defaultSeo.metaTitle", "defaultSeo.metaDescription", "defaultSeo.shareImage"]}', '[]', '2025-04-16 18:46:34.107', '2025-04-16 18:46:34.107', '2025-04-16 18:46:34.107', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (70, 'wan695v0hguymzdgxfqr2yx4', 'plugin::content-manager.explorer.update', '{}', 'plugin::users-permissions.user', '{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}', '[]', '2025-04-16 18:46:34.109', '2025-04-16 18:46:34.109', '2025-04-16 18:46:34.109', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (71, 'chuvqn92vs8xp8b6tixc6u0s', 'plugin::content-manager.explorer.update', '{}', 'api::about.about', '{"fields": ["title", "blocks"]}', '[]', '2025-04-16 18:46:34.11', '2025-04-16 18:46:34.11', '2025-04-16 18:46:34.11', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (72, 'afpx0di4durgjc9joq2jrd3x', 'plugin::content-manager.explorer.update', '{}', 'api::article.article', '{"fields": ["title", "description", "slug", "cover", "author", "category", "blocks"]}', '[]', '2025-04-16 18:46:34.112', '2025-04-16 18:46:34.112', '2025-04-16 18:46:34.112', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (73, 'kjj2nbwnu4smmtr735o28tkb', 'plugin::content-manager.explorer.update', '{}', 'api::author.author', '{"fields": ["name", "avatar", "email", "articles"]}', '[]', '2025-04-16 18:46:34.114', '2025-04-16 18:46:34.114', '2025-04-16 18:46:34.114', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (74, 'bgnfxs3tsbr87jyyq5xzhl5p', 'plugin::content-manager.explorer.update', '{}', 'api::category.category', '{"fields": ["name", "slug", "articles", "description"]}', '[]', '2025-04-16 18:46:34.115', '2025-04-16 18:46:34.115', '2025-04-16 18:46:34.115', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (75, 'vmvfwigbkpyrcautcjvp9h8w', 'plugin::content-manager.explorer.update', '{}', 'api::global.global', '{"fields": ["siteName", "favicon", "siteDescription", "defaultSeo.metaTitle", "defaultSeo.metaDescription", "defaultSeo.shareImage"]}', '[]', '2025-04-16 18:46:34.117', '2025-04-16 18:46:34.117', '2025-04-16 18:46:34.117', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (76, 'za2u5z99brevfc8h3g7hfdko', 'plugin::content-manager.explorer.delete', '{}', 'plugin::users-permissions.user', '{}', '[]', '2025-04-16 18:46:34.118', '2025-04-16 18:46:34.118', '2025-04-16 18:46:34.118', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (77, 'yztgbhaui3t568qd59hutago', 'plugin::content-manager.explorer.delete', '{}', 'api::about.about', '{}', '[]', '2025-04-16 18:46:34.123', '2025-04-16 18:46:34.123', '2025-04-16 18:46:34.123', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (78, 'u8azefv6d9bfoe0hmlt6c93d', 'plugin::content-manager.explorer.delete', '{}', 'api::article.article', '{}', '[]', '2025-04-16 18:46:34.125', '2025-04-16 18:46:34.125', '2025-04-16 18:46:34.125', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (79, 'vnxr20a2waiyt25t4y6pv6pj', 'plugin::content-manager.explorer.delete', '{}', 'api::author.author', '{}', '[]', '2025-04-16 18:46:34.126', '2025-04-16 18:46:34.126', '2025-04-16 18:46:34.126', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (80, 'rd0jslxrro95hk6601km0dyx', 'plugin::content-manager.explorer.delete', '{}', 'api::category.category', '{}', '[]', '2025-04-16 18:46:34.128', '2025-04-16 18:46:34.128', '2025-04-16 18:46:34.128', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (81, 'pn3mdcuj8bf9ur423oolfwa7', 'plugin::content-manager.explorer.delete', '{}', 'api::global.global', '{}', '[]', '2025-04-16 18:46:34.136', '2025-04-16 18:46:34.136', '2025-04-16 18:46:34.136', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (82, 'rhqp2rmddofnpe7nob5zmbax', 'plugin::content-manager.explorer.publish', '{}', 'plugin::users-permissions.user', '{}', '[]', '2025-04-16 18:46:34.138', '2025-04-16 18:46:34.138', '2025-04-16 18:46:34.138', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (83, 'kmfavfru3vx8a0n5es1r20yu', 'plugin::content-manager.explorer.publish', '{}', 'api::about.about', '{}', '[]', '2025-04-16 18:46:34.139', '2025-04-16 18:46:34.139', '2025-04-16 18:46:34.139', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (84, 'xvpi4ed68b77u5hayzarjexv', 'plugin::content-manager.explorer.publish', '{}', 'api::article.article', '{}', '[]', '2025-04-16 18:46:34.145', '2025-04-16 18:46:34.145', '2025-04-16 18:46:34.145', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (85, 'sdy5163tx672hqy449j9n5qw', 'plugin::content-manager.explorer.publish', '{}', 'api::author.author', '{}', '[]', '2025-04-16 18:46:34.147', '2025-04-16 18:46:34.147', '2025-04-16 18:46:34.147', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (86, 'd2mecwgmd81g4fcttucxlvm3', 'plugin::content-manager.explorer.publish', '{}', 'api::category.category', '{}', '[]', '2025-04-16 18:46:34.148', '2025-04-16 18:46:34.148', '2025-04-16 18:46:34.148', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (87, 'e9po6qh9g9576gbtxhdhe5wk', 'plugin::content-manager.explorer.publish', '{}', 'api::global.global', '{}', '[]', '2025-04-16 18:46:34.149', '2025-04-16 18:46:34.149', '2025-04-16 18:46:34.149', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (88, 'bomy9kj428h2h6qvm4u5w3s2', 'plugin::content-manager.single-types.configure-view', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.151', '2025-04-16 18:46:34.151', '2025-04-16 18:46:34.151', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (89, 'lw226ftj5kxuy89758m2hjxq', 'plugin::content-manager.collection-types.configure-view', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.152', '2025-04-16 18:46:34.152', '2025-04-16 18:46:34.152', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (90, 'y8dvndjwez7sssld9ms487yy', 'plugin::content-manager.components.configure-layout', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.153', '2025-04-16 18:46:34.153', '2025-04-16 18:46:34.153', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (91, 'gxqkgdapcblttzybwdtfdej8', 'plugin::content-type-builder.read', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.155', '2025-04-16 18:46:34.155', '2025-04-16 18:46:34.155', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (92, 'bfam01w1jejt048oqyx22mbd', 'plugin::email.settings.read', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.156', '2025-04-16 18:46:34.156', '2025-04-16 18:46:34.156', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (93, 'ufkmmahqmjysijy101ad0ium', 'plugin::upload.read', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.157', '2025-04-16 18:46:34.157', '2025-04-16 18:46:34.157', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (94, 'hi869joxn1j2wirzbfya7b40', 'plugin::upload.assets.create', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.162', '2025-04-16 18:46:34.162', '2025-04-16 18:46:34.162', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (95, 'kc0ns2g5mdx14loecu3nes37', 'plugin::upload.assets.update', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.164', '2025-04-16 18:46:34.164', '2025-04-16 18:46:34.164', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (96, 's0tc1akby0wfzg0nnftea90h', 'plugin::upload.assets.download', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.178', '2025-04-16 18:46:34.178', '2025-04-16 18:46:34.178', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (97, 'bt9nea0rxaor7w2y40sbmqx9', 'plugin::upload.assets.copy-link', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.179', '2025-04-16 18:46:34.179', '2025-04-16 18:46:34.179', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (98, 'bm4v9236n6dwcmdss7e9h0gq', 'plugin::upload.configure-view', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.181', '2025-04-16 18:46:34.181', '2025-04-16 18:46:34.181', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (99, 'jozfvnlba479wibupi18mnt3', 'plugin::upload.settings.read', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.182', '2025-04-16 18:46:34.182', '2025-04-16 18:46:34.182', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (100, 'rn0iwujre3zajnppomgw8v05', 'plugin::i18n.locale.create', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.183', '2025-04-16 18:46:34.183', '2025-04-16 18:46:34.183', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (101, 'z9uqkkpo91z4a2b7gv0qgix8', 'plugin::i18n.locale.read', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.185', '2025-04-16 18:46:34.185', '2025-04-16 18:46:34.185', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (102, 'rx7abwez8u5hqiy5arh3slwt', 'plugin::i18n.locale.update', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.188', '2025-04-16 18:46:34.188', '2025-04-16 18:46:34.188', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (103, 'cz1af5ytvl10emi4f5seacem', 'plugin::i18n.locale.delete', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.189', '2025-04-16 18:46:34.189', '2025-04-16 18:46:34.189', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (104, 'k3wq4c0q26mulcnly8dyaz68', 'plugin::users-permissions.roles.create', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.19', '2025-04-16 18:46:34.19', '2025-04-16 18:46:34.19', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (105, 'bz0ehlkhakigjrmh15hdvecg', 'plugin::users-permissions.roles.read', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.194', '2025-04-16 18:46:34.194', '2025-04-16 18:46:34.194', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (106, 'efvh1vxglli51xgjr7xot0bj', 'plugin::users-permissions.roles.update', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.196', '2025-04-16 18:46:34.196', '2025-04-16 18:46:34.196', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (107, 'ocgq3ly8134irgrol9wwq5gs', 'plugin::users-permissions.roles.delete', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.199', '2025-04-16 18:46:34.199', '2025-04-16 18:46:34.199', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (108, 'uiiyz1z62r3l8xwwp0lrrhnu', 'plugin::users-permissions.providers.read', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.2', '2025-04-16 18:46:34.2', '2025-04-16 18:46:34.2', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (109, 'i7mz94cwhig14n0twl4pbgs3', 'plugin::users-permissions.providers.update', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.202', '2025-04-16 18:46:34.202', '2025-04-16 18:46:34.202', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (110, 'i20k89ic67tt006qsdrhpss0', 'plugin::users-permissions.email-templates.read', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.203', '2025-04-16 18:46:34.203', '2025-04-16 18:46:34.203', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (111, 'i0wa8gwav9818qj477dytw5e', 'plugin::users-permissions.email-templates.update', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.204', '2025-04-16 18:46:34.204', '2025-04-16 18:46:34.204', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (112, 'amlini72ttdxxgxzlot4s6y2', 'plugin::users-permissions.advanced-settings.read', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.206', '2025-04-16 18:46:34.206', '2025-04-16 18:46:34.206', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (113, 'hnc7ajfu697xrieq2c00xmvq', 'plugin::users-permissions.advanced-settings.update', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.207', '2025-04-16 18:46:34.207', '2025-04-16 18:46:34.207', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (114, 'erlv8gt0j7028kn8w7jr2xil', 'admin::marketplace.read', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.208', '2025-04-16 18:46:34.208', '2025-04-16 18:46:34.208', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (115, 'i11142unajqri45oxshykvlu', 'admin::webhooks.create', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.21', '2025-04-16 18:46:34.21', '2025-04-16 18:46:34.21', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (116, 'w0o71r8260yldq908qee90j6', 'admin::webhooks.read', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.211', '2025-04-16 18:46:34.211', '2025-04-16 18:46:34.211', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (117, 'coe0rw9iit5hin5l913rpfbq', 'admin::webhooks.update', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.212', '2025-04-16 18:46:34.212', '2025-04-16 18:46:34.212', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (118, 'rlqppg0zin4ety25u74qotd0', 'admin::webhooks.delete', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.213', '2025-04-16 18:46:34.213', '2025-04-16 18:46:34.213', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (119, 'gfk2o1itlblngyhy67y4wcqx', 'admin::users.create', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.215', '2025-04-16 18:46:34.215', '2025-04-16 18:46:34.215', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (120, 'sdrvw4b3w0jhyrc597lnrodx', 'admin::users.read', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.216', '2025-04-16 18:46:34.216', '2025-04-16 18:46:34.216', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (121, 'br4r34axiyy8ksu0j5u7lywo', 'admin::users.update', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.218', '2025-04-16 18:46:34.218', '2025-04-16 18:46:34.218', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (122, 'vy3817jhrcrkbat9iefx1kka', 'admin::users.delete', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.219', '2025-04-16 18:46:34.219', '2025-04-16 18:46:34.219', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (123, 'fg852bzvf6i0lw0a96akg4e3', 'admin::roles.create', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.22', '2025-04-16 18:46:34.22', '2025-04-16 18:46:34.22', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (124, 'nonry1i7ssgd3n2vpx5hieqi', 'admin::roles.read', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.221', '2025-04-16 18:46:34.221', '2025-04-16 18:46:34.221', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (125, 'vidqbdq9kg8wzd52ojhvjjqc', 'admin::roles.update', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.224', '2025-04-16 18:46:34.224', '2025-04-16 18:46:34.224', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (126, 'jho49pocv6auz1t1hncfiz6w', 'admin::roles.delete', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.225', '2025-04-16 18:46:34.225', '2025-04-16 18:46:34.225', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (127, 'cufn37siiqcyux39h39ukxz6', 'admin::api-tokens.access', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.226', '2025-04-16 18:46:34.226', '2025-04-16 18:46:34.226', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (128, 'dvnny15a439bst8we0tzyxsg', 'admin::api-tokens.create', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.228', '2025-04-16 18:46:34.228', '2025-04-16 18:46:34.228', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (129, 'atnp3h6bfomz7vqt11624qyk', 'admin::api-tokens.read', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.23', '2025-04-16 18:46:34.23', '2025-04-16 18:46:34.23', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (130, 't97g5a1pz78q65umivc9b4rz', 'admin::api-tokens.update', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.231', '2025-04-16 18:46:34.231', '2025-04-16 18:46:34.231', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (131, 'vfc52gmltn5eb44nj7rsqhh6', 'admin::api-tokens.regenerate', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.232', '2025-04-16 18:46:34.232', '2025-04-16 18:46:34.232', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (132, 'ox5fs3olaxrnz1g680ilapit', 'admin::api-tokens.delete', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.234', '2025-04-16 18:46:34.234', '2025-04-16 18:46:34.234', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (133, 'kzcphr5y79i6kr1o893e1a40', 'admin::project-settings.update', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.235', '2025-04-16 18:46:34.235', '2025-04-16 18:46:34.235', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (134, 'ff7jeehpyg637i2cjpvt3rtt', 'admin::project-settings.read', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.236', '2025-04-16 18:46:34.236', '2025-04-16 18:46:34.237', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (135, 's19nuygh38qf8ucrfskjb3mo', 'admin::transfer.tokens.access', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.238', '2025-04-16 18:46:34.238', '2025-04-16 18:46:34.238', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (136, 'q8jnu59uuh3ts9j8gxwoac9p', 'admin::transfer.tokens.create', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.239', '2025-04-16 18:46:34.239', '2025-04-16 18:46:34.239', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (137, 'u8pj56x5b8fdgbfva0lceowp', 'admin::transfer.tokens.read', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.241', '2025-04-16 18:46:34.241', '2025-04-16 18:46:34.241', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (138, 'zj49wf24xli9odfjsbrcqdl9', 'admin::transfer.tokens.update', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.245', '2025-04-16 18:46:34.245', '2025-04-16 18:46:34.245', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (139, 'b213e2mxj5upktwcblqaw45t', 'admin::transfer.tokens.regenerate', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.246', '2025-04-16 18:46:34.246', '2025-04-16 18:46:34.246', NULL, NULL, NULL);
INSERT INTO public.admin_permissions VALUES (140, 'kwcop4v9zzyeevql9tssf4el', 'admin::transfer.tokens.delete', '{}', NULL, '{}', '[]', '2025-04-16 18:46:34.248', '2025-04-16 18:46:34.248', '2025-04-16 18:46:34.248', NULL, NULL, NULL);


--
-- Data for Name: admin_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_permissions_role_lnk VALUES (1, 1, 2, 1);
INSERT INTO public.admin_permissions_role_lnk VALUES (2, 2, 2, 2);
INSERT INTO public.admin_permissions_role_lnk VALUES (3, 3, 2, 3);
INSERT INTO public.admin_permissions_role_lnk VALUES (4, 4, 2, 4);
INSERT INTO public.admin_permissions_role_lnk VALUES (5, 5, 2, 5);
INSERT INTO public.admin_permissions_role_lnk VALUES (6, 6, 2, 6);
INSERT INTO public.admin_permissions_role_lnk VALUES (7, 7, 2, 7);
INSERT INTO public.admin_permissions_role_lnk VALUES (8, 8, 2, 8);
INSERT INTO public.admin_permissions_role_lnk VALUES (9, 9, 2, 9);
INSERT INTO public.admin_permissions_role_lnk VALUES (10, 10, 2, 10);
INSERT INTO public.admin_permissions_role_lnk VALUES (11, 11, 2, 11);
INSERT INTO public.admin_permissions_role_lnk VALUES (12, 12, 2, 12);
INSERT INTO public.admin_permissions_role_lnk VALUES (13, 13, 2, 13);
INSERT INTO public.admin_permissions_role_lnk VALUES (14, 14, 2, 14);
INSERT INTO public.admin_permissions_role_lnk VALUES (15, 15, 2, 15);
INSERT INTO public.admin_permissions_role_lnk VALUES (16, 16, 2, 16);
INSERT INTO public.admin_permissions_role_lnk VALUES (17, 17, 2, 17);
INSERT INTO public.admin_permissions_role_lnk VALUES (18, 18, 2, 18);
INSERT INTO public.admin_permissions_role_lnk VALUES (19, 19, 2, 19);
INSERT INTO public.admin_permissions_role_lnk VALUES (20, 20, 2, 20);
INSERT INTO public.admin_permissions_role_lnk VALUES (21, 21, 2, 21);
INSERT INTO public.admin_permissions_role_lnk VALUES (22, 22, 2, 22);
INSERT INTO public.admin_permissions_role_lnk VALUES (23, 23, 2, 23);
INSERT INTO public.admin_permissions_role_lnk VALUES (24, 24, 2, 24);
INSERT INTO public.admin_permissions_role_lnk VALUES (25, 25, 2, 25);
INSERT INTO public.admin_permissions_role_lnk VALUES (26, 26, 2, 26);
INSERT INTO public.admin_permissions_role_lnk VALUES (27, 27, 2, 27);
INSERT INTO public.admin_permissions_role_lnk VALUES (28, 28, 2, 28);
INSERT INTO public.admin_permissions_role_lnk VALUES (29, 29, 2, 29);
INSERT INTO public.admin_permissions_role_lnk VALUES (30, 30, 2, 30);
INSERT INTO public.admin_permissions_role_lnk VALUES (31, 31, 2, 31);
INSERT INTO public.admin_permissions_role_lnk VALUES (32, 32, 3, 1);
INSERT INTO public.admin_permissions_role_lnk VALUES (33, 33, 3, 2);
INSERT INTO public.admin_permissions_role_lnk VALUES (34, 34, 3, 3);
INSERT INTO public.admin_permissions_role_lnk VALUES (35, 35, 3, 4);
INSERT INTO public.admin_permissions_role_lnk VALUES (36, 36, 3, 5);
INSERT INTO public.admin_permissions_role_lnk VALUES (37, 37, 3, 6);
INSERT INTO public.admin_permissions_role_lnk VALUES (38, 38, 3, 7);
INSERT INTO public.admin_permissions_role_lnk VALUES (39, 39, 3, 8);
INSERT INTO public.admin_permissions_role_lnk VALUES (40, 40, 3, 9);
INSERT INTO public.admin_permissions_role_lnk VALUES (41, 41, 3, 10);
INSERT INTO public.admin_permissions_role_lnk VALUES (42, 42, 3, 11);
INSERT INTO public.admin_permissions_role_lnk VALUES (43, 43, 3, 12);
INSERT INTO public.admin_permissions_role_lnk VALUES (44, 44, 3, 13);
INSERT INTO public.admin_permissions_role_lnk VALUES (45, 45, 3, 14);
INSERT INTO public.admin_permissions_role_lnk VALUES (46, 46, 3, 15);
INSERT INTO public.admin_permissions_role_lnk VALUES (47, 47, 3, 16);
INSERT INTO public.admin_permissions_role_lnk VALUES (48, 48, 3, 17);
INSERT INTO public.admin_permissions_role_lnk VALUES (49, 49, 3, 18);
INSERT INTO public.admin_permissions_role_lnk VALUES (50, 50, 3, 19);
INSERT INTO public.admin_permissions_role_lnk VALUES (51, 51, 3, 20);
INSERT INTO public.admin_permissions_role_lnk VALUES (52, 52, 3, 21);
INSERT INTO public.admin_permissions_role_lnk VALUES (53, 53, 3, 22);
INSERT INTO public.admin_permissions_role_lnk VALUES (54, 54, 3, 23);
INSERT INTO public.admin_permissions_role_lnk VALUES (55, 55, 3, 24);
INSERT INTO public.admin_permissions_role_lnk VALUES (56, 56, 3, 25);
INSERT INTO public.admin_permissions_role_lnk VALUES (57, 57, 3, 26);
INSERT INTO public.admin_permissions_role_lnk VALUES (58, 58, 1, 1);
INSERT INTO public.admin_permissions_role_lnk VALUES (59, 59, 1, 2);
INSERT INTO public.admin_permissions_role_lnk VALUES (60, 60, 1, 3);
INSERT INTO public.admin_permissions_role_lnk VALUES (61, 61, 1, 4);
INSERT INTO public.admin_permissions_role_lnk VALUES (62, 62, 1, 5);
INSERT INTO public.admin_permissions_role_lnk VALUES (63, 63, 1, 6);
INSERT INTO public.admin_permissions_role_lnk VALUES (64, 64, 1, 7);
INSERT INTO public.admin_permissions_role_lnk VALUES (65, 65, 1, 8);
INSERT INTO public.admin_permissions_role_lnk VALUES (66, 66, 1, 9);
INSERT INTO public.admin_permissions_role_lnk VALUES (67, 67, 1, 10);
INSERT INTO public.admin_permissions_role_lnk VALUES (68, 68, 1, 11);
INSERT INTO public.admin_permissions_role_lnk VALUES (69, 69, 1, 12);
INSERT INTO public.admin_permissions_role_lnk VALUES (70, 70, 1, 13);
INSERT INTO public.admin_permissions_role_lnk VALUES (71, 71, 1, 14);
INSERT INTO public.admin_permissions_role_lnk VALUES (72, 72, 1, 15);
INSERT INTO public.admin_permissions_role_lnk VALUES (73, 73, 1, 16);
INSERT INTO public.admin_permissions_role_lnk VALUES (74, 74, 1, 17);
INSERT INTO public.admin_permissions_role_lnk VALUES (75, 75, 1, 18);
INSERT INTO public.admin_permissions_role_lnk VALUES (76, 76, 1, 19);
INSERT INTO public.admin_permissions_role_lnk VALUES (77, 77, 1, 20);
INSERT INTO public.admin_permissions_role_lnk VALUES (78, 78, 1, 21);
INSERT INTO public.admin_permissions_role_lnk VALUES (79, 79, 1, 22);
INSERT INTO public.admin_permissions_role_lnk VALUES (80, 80, 1, 23);
INSERT INTO public.admin_permissions_role_lnk VALUES (81, 81, 1, 24);
INSERT INTO public.admin_permissions_role_lnk VALUES (82, 82, 1, 25);
INSERT INTO public.admin_permissions_role_lnk VALUES (83, 83, 1, 26);
INSERT INTO public.admin_permissions_role_lnk VALUES (84, 84, 1, 27);
INSERT INTO public.admin_permissions_role_lnk VALUES (85, 85, 1, 28);
INSERT INTO public.admin_permissions_role_lnk VALUES (86, 86, 1, 29);
INSERT INTO public.admin_permissions_role_lnk VALUES (87, 87, 1, 30);
INSERT INTO public.admin_permissions_role_lnk VALUES (88, 88, 1, 31);
INSERT INTO public.admin_permissions_role_lnk VALUES (89, 89, 1, 32);
INSERT INTO public.admin_permissions_role_lnk VALUES (90, 90, 1, 33);
INSERT INTO public.admin_permissions_role_lnk VALUES (91, 91, 1, 34);
INSERT INTO public.admin_permissions_role_lnk VALUES (92, 92, 1, 35);
INSERT INTO public.admin_permissions_role_lnk VALUES (93, 93, 1, 36);
INSERT INTO public.admin_permissions_role_lnk VALUES (94, 94, 1, 37);
INSERT INTO public.admin_permissions_role_lnk VALUES (95, 95, 1, 38);
INSERT INTO public.admin_permissions_role_lnk VALUES (96, 96, 1, 39);
INSERT INTO public.admin_permissions_role_lnk VALUES (97, 97, 1, 40);
INSERT INTO public.admin_permissions_role_lnk VALUES (98, 98, 1, 41);
INSERT INTO public.admin_permissions_role_lnk VALUES (99, 99, 1, 42);
INSERT INTO public.admin_permissions_role_lnk VALUES (100, 100, 1, 43);
INSERT INTO public.admin_permissions_role_lnk VALUES (101, 101, 1, 44);
INSERT INTO public.admin_permissions_role_lnk VALUES (102, 102, 1, 45);
INSERT INTO public.admin_permissions_role_lnk VALUES (103, 103, 1, 46);
INSERT INTO public.admin_permissions_role_lnk VALUES (104, 104, 1, 47);
INSERT INTO public.admin_permissions_role_lnk VALUES (105, 105, 1, 48);
INSERT INTO public.admin_permissions_role_lnk VALUES (106, 106, 1, 49);
INSERT INTO public.admin_permissions_role_lnk VALUES (107, 107, 1, 50);
INSERT INTO public.admin_permissions_role_lnk VALUES (108, 108, 1, 51);
INSERT INTO public.admin_permissions_role_lnk VALUES (109, 109, 1, 52);
INSERT INTO public.admin_permissions_role_lnk VALUES (110, 110, 1, 53);
INSERT INTO public.admin_permissions_role_lnk VALUES (111, 111, 1, 54);
INSERT INTO public.admin_permissions_role_lnk VALUES (112, 112, 1, 55);
INSERT INTO public.admin_permissions_role_lnk VALUES (113, 113, 1, 56);
INSERT INTO public.admin_permissions_role_lnk VALUES (114, 114, 1, 57);
INSERT INTO public.admin_permissions_role_lnk VALUES (115, 115, 1, 58);
INSERT INTO public.admin_permissions_role_lnk VALUES (116, 116, 1, 59);
INSERT INTO public.admin_permissions_role_lnk VALUES (117, 117, 1, 60);
INSERT INTO public.admin_permissions_role_lnk VALUES (118, 118, 1, 61);
INSERT INTO public.admin_permissions_role_lnk VALUES (119, 119, 1, 62);
INSERT INTO public.admin_permissions_role_lnk VALUES (120, 120, 1, 63);
INSERT INTO public.admin_permissions_role_lnk VALUES (121, 121, 1, 64);
INSERT INTO public.admin_permissions_role_lnk VALUES (122, 122, 1, 65);
INSERT INTO public.admin_permissions_role_lnk VALUES (123, 123, 1, 66);
INSERT INTO public.admin_permissions_role_lnk VALUES (124, 124, 1, 67);
INSERT INTO public.admin_permissions_role_lnk VALUES (125, 125, 1, 68);
INSERT INTO public.admin_permissions_role_lnk VALUES (126, 126, 1, 69);
INSERT INTO public.admin_permissions_role_lnk VALUES (127, 127, 1, 70);
INSERT INTO public.admin_permissions_role_lnk VALUES (128, 128, 1, 71);
INSERT INTO public.admin_permissions_role_lnk VALUES (129, 129, 1, 72);
INSERT INTO public.admin_permissions_role_lnk VALUES (130, 130, 1, 73);
INSERT INTO public.admin_permissions_role_lnk VALUES (131, 131, 1, 74);
INSERT INTO public.admin_permissions_role_lnk VALUES (132, 132, 1, 75);
INSERT INTO public.admin_permissions_role_lnk VALUES (133, 133, 1, 76);
INSERT INTO public.admin_permissions_role_lnk VALUES (134, 134, 1, 77);
INSERT INTO public.admin_permissions_role_lnk VALUES (135, 135, 1, 78);
INSERT INTO public.admin_permissions_role_lnk VALUES (136, 136, 1, 79);
INSERT INTO public.admin_permissions_role_lnk VALUES (137, 137, 1, 80);
INSERT INTO public.admin_permissions_role_lnk VALUES (138, 138, 1, 81);
INSERT INTO public.admin_permissions_role_lnk VALUES (139, 139, 1, 82);
INSERT INTO public.admin_permissions_role_lnk VALUES (140, 140, 1, 83);


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_roles VALUES (1, 'd0wzw6klu69wbzlmbs259rbn', 'Super Admin', 'strapi-super-admin', 'Super Admins can access and manage all features and settings.', '2025-04-16 18:46:33.953', '2025-04-16 18:46:33.953', '2025-04-16 18:46:33.953', NULL, NULL, NULL);
INSERT INTO public.admin_roles VALUES (2, 'rsnlhwc3dk5d1kxxn8mff7by', 'Editor', 'strapi-editor', 'Editors can manage and publish contents including those of other users.', '2025-04-16 18:46:33.956', '2025-04-16 18:46:33.956', '2025-04-16 18:46:33.956', NULL, NULL, NULL);
INSERT INTO public.admin_roles VALUES (3, 'qes2lbwfnijq3ljondjaxz67', 'Author', 'strapi-author', 'Authors can manage the content they have created.', '2025-04-16 18:46:33.957', '2025-04-16 18:46:33.957', '2025-04-16 18:46:33.957', NULL, NULL, NULL);


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_users VALUES (1, 'mt8kkjrbd4w92m1532yqjwif', 'admin', 'example', NULL, 'admin@example.com', '$2a$10$o5ob79lS3DZEtngfxewQUeXgrSd4KKx8Gf4cIu0P5ARO5.rPjF1ya', NULL, NULL, true, false, NULL, '2025-04-16 18:48:03.597', '2025-04-16 18:48:03.597', '2025-04-16 18:48:03.597', NULL, NULL, NULL);


--
-- Data for Name: admin_users_roles_lnk; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_users_roles_lnk VALUES (1, 1, 1, 1, 1);


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: articles_author_lnk; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: articles_category_lnk; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: articles_cmps; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: components_shared_media; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: components_shared_quotes; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: components_shared_rich_texts; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: components_shared_seos; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: components_shared_sliders; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.files VALUES (1, 'vz3eg59shce1xpsce4bi9y2r', 'image (3).png', NULL, NULL, 719, 346, '{"small": {"ext": ".png", "url": "http://localhost:3000/uploads-storage/media/small_image_3_bb3b9832fc.png", "hash": "small_image_3_bb3b9832fc", "mime": "image/png", "name": "small_image (3).png", "path": null, "size": 22.05, "width": 500, "height": 241, "sizeInBytes": 22050}, "thumbnail": {"ext": ".png", "url": "http://localhost:3000/uploads-storage/media/thumbnail_image_3_bb3b9832fc.png", "hash": "thumbnail_image_3_bb3b9832fc", "mime": "image/png", "name": "thumbnail_image (3).png", "path": null, "size": 8.19, "width": 245, "height": 118, "sizeInBytes": 8188}}', 'image_3_bb3b9832fc', '.png', 'image/png', 6.65, 'http://localhost:3000/uploads-storage/media/image_3_bb3b9832fc.png', NULL, 'aws-s3', NULL, '/', '2025-04-17 08:46:34.769', '2025-04-17 08:46:34.769', '2025-04-17 08:46:34.769', 1, 1, NULL);


--
-- Data for Name: files_folder_lnk; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: files_related_mph; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: globals; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: globals_cmps; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.i18n_locale VALUES (1, 'ivz1246933fw6d5iil6b2r7t', 'English (en)', 'en', '2025-04-16 18:46:33.911', '2025-04-16 18:46:33.911', '2025-04-16 18:46:33.911', NULL, NULL, NULL);


--
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: strapi_api_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.strapi_api_tokens VALUES (1, 'c5g4irj64mxp2lj1ngib5zrb', 'Read Only', 'A default API token with read-only permissions, only used for accessing resources', 'read-only', '1b2f7a499c50a1c1be3cf24ace44961a213c340926cca9f0bf6ea303e8465a6f0a96b1dcfecd916d8ab3944639b1b5176fbb91c4dd784494c09782fd9838dc92', NULL, NULL, NULL, '2025-04-16 18:46:34.276', '2025-04-16 18:46:34.276', '2025-04-16 18:46:34.276', NULL, NULL, NULL);
INSERT INTO public.strapi_api_tokens VALUES (2, 'pi021s1u1w7irh8yopc05dxv', 'Full Access', 'A default API token with full access permissions, used for accessing or modifying resources', 'full-access', 'fdf8d50573c3c54cb8899604372da7ed05f2d124eb1066330fa1cedb6d1f57d6e30d6d7c800e2165ebec2d649f8a91e3803fd22ef9c6a423d7f3f5be89eaaa74', NULL, NULL, NULL, '2025-04-16 18:46:34.283', '2025-04-16 18:46:34.283', '2025-04-16 18:46:34.283', NULL, NULL, NULL);


--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.strapi_core_store_settings VALUES (7, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.permission', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.permission"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (8, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.role', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]},"uid":"plugin::users-permissions.role"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (9, 'plugin_content_manager_configuration_content_types::plugin::content-releases.release-action', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"contentType","defaultSortBy":"contentType","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"contentType":{"edit":{"label":"contentType","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentType","searchable":true,"sortable":true}},"entryDocumentId":{"edit":{"label":"entryDocumentId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"entryDocumentId","searchable":true,"sortable":true}},"release":{"edit":{"label":"release","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"release","searchable":true,"sortable":true}},"isEntryValid":{"edit":{"label":"isEntryValid","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isEntryValid","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","type","contentType","entryDocumentId"],"edit":[[{"name":"type","size":6},{"name":"contentType","size":6}],[{"name":"entryDocumentId","size":6},{"name":"release","size":6}],[{"name":"isEntryValid","size":4}]]},"uid":"plugin::content-releases.release-action"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (11, 'plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"stages":{"edit":{"label":"stages","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"stages","searchable":false,"sortable":false}},"stageRequiredToPublish":{"edit":{"label":"stageRequiredToPublish","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"stageRequiredToPublish","searchable":true,"sortable":true}},"contentTypes":{"edit":{"label":"contentTypes","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentTypes","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","stages","stageRequiredToPublish"],"edit":[[{"name":"name","size":6},{"name":"stages","size":6}],[{"name":"stageRequiredToPublish","size":6}],[{"name":"contentTypes","size":12}]]},"uid":"plugin::review-workflows.workflow"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (15, 'plugin_content_manager_configuration_content_types::api::article.article', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"cover":{"edit":{"label":"cover","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cover","searchable":false,"sortable":false}},"author":{"edit":{"label":"author","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"author","searchable":true,"sortable":true}},"category":{"edit":{"label":"category","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"category","searchable":true,"sortable":true}},"blocks":{"edit":{"label":"blocks","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocks","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","description","slug"],"edit":[[{"name":"title","size":6},{"name":"description","size":6}],[{"name":"slug","size":6},{"name":"cover","size":6}],[{"name":"author","size":6},{"name":"category","size":6}],[{"name":"blocks","size":12}]]},"uid":"api::article.article"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (12, 'plugin_content_manager_configuration_content_types::plugin::upload.file', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}]]},"uid":"plugin::upload.file"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (10, 'plugin_content_manager_configuration_content_types::plugin::upload.folder', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]},"uid":"plugin::upload.folder"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (13, 'plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow-stage', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"color":{"edit":{"label":"color","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"color","searchable":true,"sortable":true}},"workflow":{"edit":{"label":"workflow","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"workflow","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","color","workflow"],"edit":[[{"name":"name","size":6},{"name":"color","size":6}],[{"name":"workflow","size":6},{"name":"permissions","size":6}]]},"uid":"plugin::review-workflows.workflow-stage"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (22, 'plugin_content_manager_configuration_content_types::api::category.category', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"articles":{"edit":{"label":"articles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"articles","searchable":false,"sortable":false}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","slug","articles"],"edit":[[{"name":"name","size":6},{"name":"slug","size":6}],[{"name":"articles","size":6},{"name":"description","size":6}]]},"uid":"api::category.category"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (25, 'plugin_content_manager_configuration_content_types::admin::transfer-token', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","accessKey"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"accessKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]},"uid":"admin::transfer-token"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (36, 'core_admin_auth', '{"providers":{"autoRegister":false,"defaultRole":null,"ssoLockedRoles":null}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (16, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.user', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.user"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (23, 'plugin_content_manager_configuration_content_types::admin::api-token', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"lastUsedAt","size":6},{"name":"permissions","size":6}],[{"name":"expiresAt","size":6},{"name":"lifespan","size":4}]]},"uid":"admin::api-token"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (17, 'plugin_content_manager_configuration_content_types::plugin::content-releases.release', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"releasedAt":{"edit":{"label":"releasedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"releasedAt","searchable":true,"sortable":true}},"scheduledAt":{"edit":{"label":"scheduledAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"scheduledAt","searchable":true,"sortable":true}},"timezone":{"edit":{"label":"timezone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"timezone","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"actions":{"edit":{"label":"actions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"contentType"},"list":{"label":"actions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","releasedAt","scheduledAt"],"edit":[[{"name":"name","size":6},{"name":"releasedAt","size":6}],[{"name":"scheduledAt","size":6},{"name":"timezone","size":6}],[{"name":"status","size":6},{"name":"actions","size":6}]]},"uid":"plugin::content-releases.release"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (26, 'plugin_content_manager_configuration_content_types::admin::transfer-token-permission', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::transfer-token-permission"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (29, 'plugin_upload_settings', '{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (30, 'plugin_upload_view_configuration', '{"pageSize":10,"sort":"createdAt:DESC"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (31, 'plugin_upload_metrics', '{"weeklySchedule":"48 46 18 * * 3","lastWeeklyUpdate":1744829208028}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (19, 'plugin_content_manager_configuration_content_types::api::author.author', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"avatar":{"edit":{"label":"avatar","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"avatar","searchable":false,"sortable":false}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"articles":{"edit":{"label":"articles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"articles","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","avatar","email"],"edit":[[{"name":"name","size":6},{"name":"avatar","size":6}],[{"name":"email","size":6},{"name":"articles","size":6}]]},"uid":"api::author.author"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (24, 'plugin_content_manager_configuration_content_types::admin::user', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"isActive","size":4}],[{"name":"roles","size":6},{"name":"blocked","size":4}],[{"name":"preferedLanguage","size":6}]]},"uid":"admin::user"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (20, 'plugin_content_manager_configuration_content_types::api::global.global', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"siteName","defaultSortBy":"siteName","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"siteName":{"edit":{"label":"siteName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"siteName","searchable":true,"sortable":true}},"favicon":{"edit":{"label":"favicon","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"favicon","searchable":false,"sortable":false}},"siteDescription":{"edit":{"label":"siteDescription","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"siteDescription","searchable":true,"sortable":true}},"defaultSeo":{"edit":{"label":"defaultSeo","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"defaultSeo","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","siteName","favicon","siteDescription"],"edit":[[{"name":"siteName","size":6},{"name":"favicon","size":6}],[{"name":"siteDescription","size":6}],[{"name":"defaultSeo","size":12}]]},"uid":"api::global.global"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (28, 'plugin_content_manager_configuration_content_types::admin::api-token-permission', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::api-token-permission"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (21, 'plugin_content_manager_configuration_content_types::admin::permission', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"actionParameters":{"edit":{"label":"actionParameters","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"actionParameters","searchable":false,"sortable":false}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6}],[{"name":"actionParameters","size":12}],[{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}]]},"uid":"admin::permission"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (32, 'plugin_i18n_default_locale', '"en"', 'string', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (33, 'plugin_users-permissions_grant', '{"email":{"icon":"envelope","enabled":true},"discord":{"icon":"discord","enabled":false,"key":"","secret":"","callbackUrl":"http://localhost:3000/cms/api/auth/discord/callback","scope":["identify","email"]},"facebook":{"icon":"facebook-square","enabled":false,"key":"","secret":"","callbackUrl":"http://localhost:3000/cms/api/auth/facebook/callback","scope":["email"]},"google":{"icon":"google","enabled":false,"key":"","secret":"","callbackUrl":"http://localhost:3000/cms/api/auth/google/callback","scope":["email"]},"github":{"icon":"github","enabled":false,"key":"","secret":"","callbackUrl":"http://localhost:3000/cms/api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"icon":"windows","enabled":false,"key":"","secret":"","callbackUrl":"http://localhost:3000/cms/api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"icon":"twitter","enabled":false,"key":"","secret":"","callbackUrl":"http://localhost:3000/cms/api/auth/twitter/callback"},"instagram":{"icon":"instagram","enabled":false,"key":"","secret":"","callbackUrl":"http://localhost:3000/cms/api/auth/instagram/callback","scope":["user_profile"]},"vk":{"icon":"vk","enabled":false,"key":"","secret":"","callbackUrl":"http://localhost:3000/cms/api/auth/vk/callback","scope":["email"]},"twitch":{"icon":"twitch","enabled":false,"key":"","secret":"","callbackUrl":"http://localhost:3000/cms/api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"icon":"linkedin","enabled":false,"key":"","secret":"","callbackUrl":"http://localhost:3000/cms/api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"icon":"aws","enabled":false,"key":"","secret":"","subdomain":"my.subdomain.com","callback":"http://localhost:3000/cms/api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"icon":"reddit","enabled":false,"key":"","secret":"","callback":"http://localhost:3000/cms/api/auth/reddit/callback","scope":["identity"]},"auth0":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"my-tenant.eu","callback":"http://localhost:3000/cms/api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"icon":"book","enabled":false,"key":"","secret":"","callback":"http://localhost:3000/cms/api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"},"patreon":{"icon":"","enabled":false,"key":"","secret":"","callback":"http://localhost:3000/cms/api/auth/patreon/callback","scope":["identity","identity[email]"]},"keycloak":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"myKeycloakProvider.com/realms/myrealm","callback":"http://localhost:3000/cms/api/auth/keycloak/callback","scope":["openid","email","profile"]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (34, 'plugin_users-permissions_email', '{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\n\n<p>But don’t worry! You can use the following link to reset your password:</p>\n<p><%= URL %>?code=<%= TOKEN %></p>\n\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\n\n<p>You have to confirm your email address. Please click on the link below.</p>\n\n<p><%= URL %>?confirmation=<%= CODE %></p>\n\n<p>Thanks.</p>"}}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (35, 'plugin_users-permissions_advanced', '{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (4, 'plugin_content_manager_configuration_components::shared.rich-text', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"body":{"edit":{"label":"body","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"body","searchable":false,"sortable":false}}},"layouts":{"list":["id"],"edit":[[{"name":"body","size":12}]]},"uid":"shared.rich-text","isComponent":true}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (1, 'strapi_content_types_schema', '{"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"files"}}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"plugin":"upload","globalId":"UploadFile","uid":"plugin::upload.file","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false}},"kind":"collectionType"},"modelName":"file"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"upload_folders"}}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"plugin":"upload","globalId":"UploadFolder","uid":"plugin::upload.folder","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true}},"kind":"collectionType"},"modelName":"folder"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::i18n.locale","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"i18n_locale"}}},"plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale","uid":"plugin::i18n.locale","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"i18n_locale","info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelName":"locale"},"plugin::content-releases.release":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_releases"}}},"plugin":"content-releases","globalId":"ContentReleasesRelease","uid":"plugin::content-releases.release","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"}},"kind":"collectionType"},"modelName":"release"},"plugin::content-releases.release-action":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_release_actions"}}},"plugin":"content-releases","globalId":"ContentReleasesReleaseAction","uid":"plugin::content-releases.release-action","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"}},"kind":"collectionType"},"modelName":"release-action"},"plugin::review-workflows.workflow":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"stageRequiredToPublish":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToOne","required":false},"contentTypes":{"type":"json","required":true,"default":"[]"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflow","uid":"plugin::review-workflows.workflow","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"stageRequiredToPublish":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToOne","required":false},"contentTypes":{"type":"json","required":true,"default":"[]"}},"kind":"collectionType"},"modelName":"workflow"},"plugin::review-workflows.workflow-stage":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0","draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow-stage","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows_stages"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflowStage","uid":"plugin::review-workflows.workflow-stage","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false}},"kind":"collectionType"},"modelName":"workflow-stage"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_permissions"}}},"plugin":"users-permissions","globalId":"UsersPermissionsPermission","uid":"plugin::users-permissions.permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelName":"permission","options":{"draftAndPublish":false}},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_roles"}}},"plugin":"users-permissions","globalId":"UsersPermissionsRole","uid":"plugin::users-permissions.role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelName":"role","options":{"draftAndPublish":false}},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"timestamps":true,"draftAndPublish":false},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_users"}}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"plugin":"users-permissions","globalId":"UsersPermissionsUser","uid":"plugin::users-permissions.user","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false}},"kind":"collectionType"},"modelName":"user"},"api::about.about":{"kind":"singleType","collectionName":"abouts","info":{"singularName":"about","pluralName":"abouts","displayName":"About","description":"Write about yourself and the content you create"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"title":{"type":"string"},"blocks":{"type":"dynamiczone","components":["shared.media","shared.quote","shared.rich-text","shared.slider"]},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::about.about","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"abouts"}}},"apiName":"about","globalId":"About","uid":"api::about.about","modelType":"contentType","__schema__":{"collectionName":"abouts","info":{"singularName":"about","pluralName":"abouts","displayName":"About","description":"Write about yourself and the content you create"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"title":{"type":"string"},"blocks":{"type":"dynamiczone","components":["shared.media","shared.quote","shared.rich-text","shared.slider"]}},"kind":"singleType"},"modelName":"about","actions":{},"lifecycles":{}},"api::article.article":{"kind":"collectionType","collectionName":"articles","info":{"singularName":"article","pluralName":"articles","displayName":"Article","description":"Create your blog content"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string"},"description":{"type":"text","maxLength":80},"slug":{"type":"uid","targetField":"title"},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos"]},"author":{"type":"relation","relation":"manyToOne","target":"api::author.author","inversedBy":"articles"},"category":{"type":"relation","relation":"manyToOne","target":"api::category.category","inversedBy":"articles"},"blocks":{"type":"dynamiczone","components":["shared.media","shared.quote","shared.rich-text","shared.slider"]},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::article.article","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"articles"}}},"apiName":"article","globalId":"Article","uid":"api::article.article","modelType":"contentType","__schema__":{"collectionName":"articles","info":{"singularName":"article","pluralName":"articles","displayName":"Article","description":"Create your blog content"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string"},"description":{"type":"text","maxLength":80},"slug":{"type":"uid","targetField":"title"},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos"]},"author":{"type":"relation","relation":"manyToOne","target":"api::author.author","inversedBy":"articles"},"category":{"type":"relation","relation":"manyToOne","target":"api::category.category","inversedBy":"articles"},"blocks":{"type":"dynamiczone","components":["shared.media","shared.quote","shared.rich-text","shared.slider"]}},"kind":"collectionType"},"modelName":"article","actions":{},"lifecycles":{}},"api::author.author":{"kind":"collectionType","collectionName":"authors","info":{"singularName":"author","pluralName":"authors","displayName":"Author","description":"Create authors for your content"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string"},"avatar":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos"]},"email":{"type":"string"},"articles":{"type":"relation","relation":"oneToMany","target":"api::article.article","mappedBy":"author"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::author.author","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"authors"}}},"apiName":"author","globalId":"Author","uid":"api::author.author","modelType":"contentType","__schema__":{"collectionName":"authors","info":{"singularName":"author","pluralName":"authors","displayName":"Author","description":"Create authors for your content"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string"},"avatar":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos"]},"email":{"type":"string"},"articles":{"type":"relation","relation":"oneToMany","target":"api::article.article","mappedBy":"author"}},"kind":"collectionType"},"modelName":"author","actions":{},"lifecycles":{}},"api::category.category":{"kind":"collectionType","collectionName":"categories","info":{"singularName":"category","pluralName":"categories","displayName":"Category","description":"Organize your content into categories"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string"},"slug":{"type":"uid"},"articles":{"type":"relation","relation":"oneToMany","target":"api::article.article","mappedBy":"category"},"description":{"type":"text"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::category.category","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"categories"}}},"apiName":"category","globalId":"Category","uid":"api::category.category","modelType":"contentType","__schema__":{"collectionName":"categories","info":{"singularName":"category","pluralName":"categories","displayName":"Category","description":"Organize your content into categories"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string"},"slug":{"type":"uid"},"articles":{"type":"relation","relation":"oneToMany","target":"api::article.article","mappedBy":"category"},"description":{"type":"text"}},"kind":"collectionType"},"modelName":"category","actions":{},"lifecycles":{}},"api::global.global":{"kind":"singleType","collectionName":"globals","info":{"singularName":"global","pluralName":"globals","displayName":"Global","description":"Define global settings"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"siteName":{"type":"string","required":true},"favicon":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos"]},"siteDescription":{"type":"text","required":true},"defaultSeo":{"type":"component","repeatable":false,"component":"shared.seo"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::global.global","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"globals"}}},"apiName":"global","globalId":"Global","uid":"api::global.global","modelType":"contentType","__schema__":{"collectionName":"globals","info":{"singularName":"global","pluralName":"globals","displayName":"Global","description":"Define global settings"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"siteName":{"type":"string","required":true},"favicon":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos"]},"siteDescription":{"type":"text","required":true},"defaultSeo":{"type":"component","repeatable":false,"component":"shared.seo"}},"kind":"singleType"},"modelName":"global","actions":{},"lifecycles":{}},"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_permissions"}}},"plugin":"admin","globalId":"AdminPermission","uid":"admin::permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelName":"permission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_users"}}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"registrationToken":{"hidden":true}}},"plugin":"admin","globalId":"AdminUser","uid":"admin::user","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelName":"user","options":{"draftAndPublish":false}},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_roles"}}},"plugin":"admin","globalId":"AdminRole","uid":"admin::role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelName":"role"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_tokens"}}},"plugin":"admin","globalId":"AdminApiToken","uid":"admin::api-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"api-token"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_token_permissions"}}},"plugin":"admin","globalId":"AdminApiTokenPermission","uid":"admin::api-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelName":"api-token-permission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_tokens"}}},"plugin":"admin","globalId":"AdminTransferToken","uid":"admin::transfer-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"transfer-token"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_token_permissions"}}},"plugin":"admin","globalId":"AdminTransferTokenPermission","uid":"admin::transfer-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelName":"transfer-token-permission"}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (2, 'plugin_content_manager_configuration_components::shared.slider', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"files","searchable":false,"sortable":false}}},"layouts":{"list":["id","files"],"edit":[[{"name":"files","size":6}]]},"uid":"shared.slider","isComponent":true}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (5, 'plugin_content_manager_configuration_components::shared.quote', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"body":{"edit":{"label":"body","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"body","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","body"],"edit":[[{"name":"title","size":6},{"name":"body","size":6}]]},"uid":"shared.quote","isComponent":true}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (6, 'plugin_content_manager_configuration_components::shared.media', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"file":{"edit":{"label":"file","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"file","searchable":false,"sortable":false}}},"layouts":{"list":["id","file"],"edit":[[{"name":"file","size":6}]]},"uid":"shared.media","isComponent":true}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (3, 'plugin_content_manager_configuration_components::shared.seo', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"metaTitle","defaultSortBy":"metaTitle","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"metaTitle":{"edit":{"label":"metaTitle","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaTitle","searchable":true,"sortable":true}},"metaDescription":{"edit":{"label":"metaDescription","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaDescription","searchable":true,"sortable":true}},"shareImage":{"edit":{"label":"shareImage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"shareImage","searchable":false,"sortable":false}}},"layouts":{"list":["id","metaTitle","metaDescription","shareImage"],"edit":[[{"name":"metaTitle","size":6},{"name":"metaDescription","size":6}],[{"name":"shareImage","size":6}]]},"uid":"shared.seo","isComponent":true}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (18, 'plugin_content_manager_configuration_content_types::plugin::i18n.locale', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]},"uid":"plugin::i18n.locale"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (27, 'plugin_content_manager_configuration_content_types::admin::role', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]},"uid":"admin::role"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (14, 'plugin_content_manager_configuration_content_types::api::about.about', '{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"blocks":{"edit":{"label":"blocks","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocks","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","createdAt","updatedAt"],"edit":[[{"name":"title","size":6}],[{"name":"blocks","size":12}]]},"uid":"api::about.about"}', 'object', NULL, NULL);


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.strapi_database_schema VALUES (1, '{"tables":[{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_documents_idx","columns":["document_id","locale","published_at"]},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_documents_idx","columns":["document_id","locale","published_at"]},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_documents_idx","columns":["document_id","locale","published_at"]},{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_releases","indexes":[{"name":"strapi_releases_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"released_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"scheduled_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"timezone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_release_actions","indexes":[{"name":"strapi_release_actions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"entry_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_entry_valid","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows","indexes":[{"name":"strapi_workflows_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_types","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_workflows_stages","indexes":[{"name":"strapi_workflows_stages_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_roles","indexes":[{"name":"up_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_users","indexes":[{"name":"up_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"abouts_cmps","indexes":[{"name":"abouts_field_idx","columns":["field"]},{"name":"abouts_component_type_idx","columns":["component_type"]},{"name":"abouts_entity_fk","columns":["entity_id"]},{"name":"abouts_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"abouts_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"abouts","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"abouts","indexes":[{"name":"abouts_documents_idx","columns":["document_id","locale","published_at"]},{"name":"abouts_created_by_id_fk","columns":["created_by_id"]},{"name":"abouts_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"abouts_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"abouts_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"articles_cmps","indexes":[{"name":"articles_field_idx","columns":["field"]},{"name":"articles_component_type_idx","columns":["component_type"]},{"name":"articles_entity_fk","columns":["entity_id"]},{"name":"articles_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"articles_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"articles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"articles","indexes":[{"name":"articles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"articles_created_by_id_fk","columns":["created_by_id"]},{"name":"articles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"articles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"articles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"authors","indexes":[{"name":"authors_documents_idx","columns":["document_id","locale","published_at"]},{"name":"authors_created_by_id_fk","columns":["created_by_id"]},{"name":"authors_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"authors_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"authors_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"categories","indexes":[{"name":"categories_documents_idx","columns":["document_id","locale","published_at"]},{"name":"categories_created_by_id_fk","columns":["created_by_id"]},{"name":"categories_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"categories_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"categories_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"globals_cmps","indexes":[{"name":"globals_field_idx","columns":["field"]},{"name":"globals_component_type_idx","columns":["component_type"]},{"name":"globals_entity_fk","columns":["entity_id"]},{"name":"globals_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"globals_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"globals","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"globals","indexes":[{"name":"globals_documents_idx","columns":["document_id","locale","published_at"]},{"name":"globals_created_by_id_fk","columns":["created_by_id"]},{"name":"globals_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"globals_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"globals_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"site_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"site_description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action_parameters","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_users","indexes":[{"name":"admin_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_shared_sliders","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false}]},{"name":"components_shared_seos","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"meta_title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"meta_description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_shared_rich_texts","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"body","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_shared_quotes","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"body","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_shared_media","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false}]},{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_history_versions","indexes":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"]}],"foreignKeys":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"related_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"data","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"schema","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_mph","indexes":[{"name":"files_related_mph_fk","columns":["file_id"]},{"name":"files_related_mph_oidx","columns":["order"]},{"name":"files_related_mph_idix","columns":["related_id"]}],"foreignKeys":[{"name":"files_related_mph_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_lnk","indexes":[{"name":"files_folder_lnk_fk","columns":["file_id"]},{"name":"files_folder_lnk_ifk","columns":["folder_id"]},{"name":"files_folder_lnk_uq","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_lnk_oifk","columns":["file_ord"]}],"foreignKeys":[{"name":"files_folder_lnk_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_lnk_ifk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_lnk","indexes":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"]},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_lnk_uq","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_lnk_oifk","columns":["folder_ord"]}],"foreignKeys":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_release_actions_release_lnk","indexes":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"]},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"]},{"name":"strapi_release_actions_release_lnk_uq","columns":["release_action_id","release_id"],"type":"unique"},{"name":"strapi_release_actions_release_lnk_oifk","columns":["release_action_ord"]}],"foreignKeys":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"],"referencedColumns":["id"],"referencedTable":"strapi_release_actions","onDelete":"CASCADE"},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"],"referencedColumns":["id"],"referencedTable":"strapi_releases","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"release_action_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_action_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stage_required_to_publish_lnk","indexes":[{"name":"strapi_workflows_stage_required_to_publish_lnk_fk","columns":["workflow_id"]},{"name":"strapi_workflows_stage_required_to_publish_lnk_ifk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stage_required_to_publish_lnk_uq","columns":["workflow_id","workflow_stage_id"],"type":"unique"}],"foreignKeys":[{"name":"strapi_workflows_stage_required_to_publish_lnk_fk","columns":["workflow_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows","onDelete":"CASCADE"},{"name":"strapi_workflows_stage_required_to_publish_lnk_ifk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_workflow_lnk","indexes":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"]},{"name":"strapi_workflows_stages_workflow_lnk_uq","columns":["workflow_stage_id","workflow_id"],"type":"unique"},{"name":"strapi_workflows_stages_workflow_lnk_oifk","columns":["workflow_stage_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_stage_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_permissions_lnk","indexes":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"]},{"name":"strapi_workflows_stages_permissions_lnk_uq","columns":["workflow_stage_id","permission_id"],"type":"unique"},{"name":"strapi_workflows_stages_permissions_lnk_ofk","columns":["permission_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_lnk","indexes":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"up_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_lnk","indexes":[{"name":"up_users_role_lnk_fk","columns":["user_id"]},{"name":"up_users_role_lnk_ifk","columns":["role_id"]},{"name":"up_users_role_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"up_users_role_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"articles_author_lnk","indexes":[{"name":"articles_author_lnk_fk","columns":["article_id"]},{"name":"articles_author_lnk_ifk","columns":["author_id"]},{"name":"articles_author_lnk_uq","columns":["article_id","author_id"],"type":"unique"},{"name":"articles_author_lnk_oifk","columns":["article_ord"]}],"foreignKeys":[{"name":"articles_author_lnk_fk","columns":["article_id"],"referencedColumns":["id"],"referencedTable":"articles","onDelete":"CASCADE"},{"name":"articles_author_lnk_ifk","columns":["author_id"],"referencedColumns":["id"],"referencedTable":"authors","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"article_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"author_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"article_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"articles_category_lnk","indexes":[{"name":"articles_category_lnk_fk","columns":["article_id"]},{"name":"articles_category_lnk_ifk","columns":["category_id"]},{"name":"articles_category_lnk_uq","columns":["article_id","category_id"],"type":"unique"},{"name":"articles_category_lnk_oifk","columns":["article_ord"]}],"foreignKeys":[{"name":"articles_category_lnk_fk","columns":["article_id"],"referencedColumns":["id"],"referencedTable":"articles","onDelete":"CASCADE"},{"name":"articles_category_lnk_ifk","columns":["category_id"],"referencedColumns":["id"],"referencedTable":"categories","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"article_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"category_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"article_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_role_lnk","indexes":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"admin_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_lnk","indexes":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"]},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"]},{"name":"admin_users_roles_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_lnk_ofk","columns":["role_ord"]},{"name":"admin_users_roles_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_lnk","indexes":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_lnk_uq","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_lnk_oifk","columns":["api_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_lnk","indexes":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_uq","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_lnk_oifk","columns":["transfer_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}', '2025-04-16 18:46:33.769', '4e63a6af5764ac28a614a8fd8aa591f6');


--
-- Data for Name: strapi_history_versions; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: strapi_migrations_internal; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.strapi_migrations_internal VALUES (1, '5.0.0-rename-identifiers-longer-than-max-length', '2025-04-16 18:46:33.395');
INSERT INTO public.strapi_migrations_internal VALUES (2, '5.0.0-02-created-document-id', '2025-04-16 18:46:33.413');
INSERT INTO public.strapi_migrations_internal VALUES (3, '5.0.0-03-created-locale', '2025-04-16 18:46:33.428');
INSERT INTO public.strapi_migrations_internal VALUES (4, '5.0.0-04-created-published-at', '2025-04-16 18:46:33.442');
INSERT INTO public.strapi_migrations_internal VALUES (5, '5.0.0-05-drop-slug-fields-index', '2025-04-16 18:46:33.457');
INSERT INTO public.strapi_migrations_internal VALUES (6, 'core::5.0.0-discard-drafts', '2025-04-16 18:46:33.472');


--
-- Data for Name: strapi_release_actions; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: strapi_release_actions_release_lnk; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: strapi_releases; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: strapi_transfer_token_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: strapi_transfer_tokens; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: strapi_workflows; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: strapi_workflows_stage_required_to_publish_lnk; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: strapi_workflows_stages; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: strapi_workflows_stages_permissions_lnk; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: strapi_workflows_stages_workflow_lnk; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.up_permissions VALUES (1, 'chxz9qtrfs5nacsm7v3dv5g1', 'plugin::users-permissions.user.me', '2025-04-16 18:46:33.929', '2025-04-16 18:46:33.929', '2025-04-16 18:46:33.93', NULL, NULL, NULL);
INSERT INTO public.up_permissions VALUES (2, 'smtq3k0v9fljoozg24yyrqs8', 'plugin::users-permissions.auth.changePassword', '2025-04-16 18:46:33.929', '2025-04-16 18:46:33.929', '2025-04-16 18:46:33.93', NULL, NULL, NULL);
INSERT INTO public.up_permissions VALUES (3, 'br91ahq7s9oohbacm2s42ddg', 'plugin::users-permissions.auth.callback', '2025-04-16 18:46:33.934', '2025-04-16 18:46:33.934', '2025-04-16 18:46:33.934', NULL, NULL, NULL);
INSERT INTO public.up_permissions VALUES (4, 'ec8o968q8p56tn7iz449hvjx', 'plugin::users-permissions.auth.connect', '2025-04-16 18:46:33.934', '2025-04-16 18:46:33.934', '2025-04-16 18:46:33.934', NULL, NULL, NULL);
INSERT INTO public.up_permissions VALUES (5, 'as5s8rfmn6rteugv65p3sv28', 'plugin::users-permissions.auth.resetPassword', '2025-04-16 18:46:33.934', '2025-04-16 18:46:33.934', '2025-04-16 18:46:33.934', NULL, NULL, NULL);
INSERT INTO public.up_permissions VALUES (6, 'lvun0fshq8iv7h1251z3c5b8', 'plugin::users-permissions.auth.forgotPassword', '2025-04-16 18:46:33.934', '2025-04-16 18:46:33.934', '2025-04-16 18:46:33.934', NULL, NULL, NULL);
INSERT INTO public.up_permissions VALUES (7, 'q8ohhkmvsi1fsd1xsj8nfmea', 'plugin::users-permissions.auth.register', '2025-04-16 18:46:33.934', '2025-04-16 18:46:33.934', '2025-04-16 18:46:33.935', NULL, NULL, NULL);
INSERT INTO public.up_permissions VALUES (8, 'sh6h5grei54mpqv6tqiquuyy', 'plugin::users-permissions.auth.emailConfirmation', '2025-04-16 18:46:33.934', '2025-04-16 18:46:33.934', '2025-04-16 18:46:33.935', NULL, NULL, NULL);
INSERT INTO public.up_permissions VALUES (9, 'dsd971clrb6rov5nb884s96d', 'plugin::users-permissions.auth.sendEmailConfirmation', '2025-04-16 18:46:33.934', '2025-04-16 18:46:33.934', '2025-04-16 18:46:33.935', NULL, NULL, NULL);


--
-- Data for Name: up_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.up_permissions_role_lnk VALUES (1, 1, 1, 1);
INSERT INTO public.up_permissions_role_lnk VALUES (2, 2, 1, 2);
INSERT INTO public.up_permissions_role_lnk VALUES (3, 3, 2, 1);
INSERT INTO public.up_permissions_role_lnk VALUES (4, 4, 2, 1);
INSERT INTO public.up_permissions_role_lnk VALUES (5, 6, 2, 2);
INSERT INTO public.up_permissions_role_lnk VALUES (6, 5, 2, 2);
INSERT INTO public.up_permissions_role_lnk VALUES (7, 8, 2, 3);
INSERT INTO public.up_permissions_role_lnk VALUES (8, 9, 2, 3);
INSERT INTO public.up_permissions_role_lnk VALUES (9, 7, 2, 3);


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.up_roles VALUES (1, 'f0151c123qnfllold6jywf2k', 'Authenticated', 'Default role given to authenticated user.', 'authenticated', '2025-04-16 18:46:33.926', '2025-04-16 18:46:33.926', '2025-04-16 18:46:33.926', NULL, NULL, NULL);
INSERT INTO public.up_roles VALUES (2, 'whom081cdkk5hs9mtw9249uy', 'Public', 'Default role given to unauthenticated user.', 'public', '2025-04-16 18:46:33.927', '2025-04-16 18:46:33.927', '2025-04-16 18:46:33.927', NULL, NULL, NULL);


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: up_users_role_lnk; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: upload_folders_parent_lnk; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Name: abouts_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.abouts_cmps_id_seq', 1, false);


--
-- Name: abouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.abouts_id_seq', 1, false);


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 140, true);


--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_permissions_role_lnk_id_seq', 140, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_users_roles_lnk_id_seq', 1, true);


--
-- Name: articles_author_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.articles_author_lnk_id_seq', 1, false);


--
-- Name: articles_category_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.articles_category_lnk_id_seq', 1, false);


--
-- Name: articles_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.articles_cmps_id_seq', 1, false);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.articles_id_seq', 1, false);


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.authors_id_seq', 1, false);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- Name: components_shared_media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.components_shared_media_id_seq', 1, false);


--
-- Name: components_shared_quotes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.components_shared_quotes_id_seq', 1, false);


--
-- Name: components_shared_rich_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.components_shared_rich_texts_id_seq', 1, false);


--
-- Name: components_shared_seos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.components_shared_seos_id_seq', 1, false);


--
-- Name: components_shared_sliders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.components_shared_sliders_id_seq', 1, false);


--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.files_folder_lnk_id_seq', 1, false);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.files_id_seq', 1, true);


--
-- Name: files_related_mph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.files_related_mph_id_seq', 1, false);


--
-- Name: globals_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.globals_cmps_id_seq', 1, false);


--
-- Name: globals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.globals_id_seq', 1, false);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_lnk_id_seq', 1, false);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 2, true);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 36, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 1, true);


--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.strapi_history_versions_id_seq', 1, false);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.strapi_migrations_internal_id_seq', 6, true);


--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.strapi_release_actions_id_seq', 1, false);


--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.strapi_release_actions_release_lnk_id_seq', 1, false);


--
-- Name: strapi_releases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.strapi_releases_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_lnk_id_seq', 1, false);


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.strapi_workflows_id_seq', 1, false);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_permissions_lnk_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_workflow_lnk_id_seq', 1, false);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 9, true);


--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.up_permissions_role_lnk_id_seq', 9, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.up_users_id_seq', 1, false);


--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.up_users_role_lnk_id_seq', 1, false);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, false);


--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.upload_folders_parent_lnk_id_seq', 1, false);


--
-- Name: abouts_cmps abouts_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.abouts_cmps
    ADD CONSTRAINT abouts_cmps_pkey PRIMARY KEY (id);


--
-- Name: abouts abouts_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.abouts
    ADD CONSTRAINT abouts_pkey PRIMARY KEY (id);


--
-- Name: abouts_cmps abouts_uq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.abouts_cmps
    ADD CONSTRAINT abouts_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_uq UNIQUE (user_id, role_id);


--
-- Name: articles_author_lnk articles_author_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.articles_author_lnk
    ADD CONSTRAINT articles_author_lnk_pkey PRIMARY KEY (id);


--
-- Name: articles_author_lnk articles_author_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.articles_author_lnk
    ADD CONSTRAINT articles_author_lnk_uq UNIQUE (article_id, author_id);


--
-- Name: articles_category_lnk articles_category_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.articles_category_lnk
    ADD CONSTRAINT articles_category_lnk_pkey PRIMARY KEY (id);


--
-- Name: articles_category_lnk articles_category_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.articles_category_lnk
    ADD CONSTRAINT articles_category_lnk_uq UNIQUE (article_id, category_id);


--
-- Name: articles_cmps articles_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.articles_cmps
    ADD CONSTRAINT articles_cmps_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: articles_cmps articles_uq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.articles_cmps
    ADD CONSTRAINT articles_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: components_shared_media components_shared_media_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.components_shared_media
    ADD CONSTRAINT components_shared_media_pkey PRIMARY KEY (id);


--
-- Name: components_shared_quotes components_shared_quotes_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.components_shared_quotes
    ADD CONSTRAINT components_shared_quotes_pkey PRIMARY KEY (id);


--
-- Name: components_shared_rich_texts components_shared_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.components_shared_rich_texts
    ADD CONSTRAINT components_shared_rich_texts_pkey PRIMARY KEY (id);


--
-- Name: components_shared_seos components_shared_seos_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.components_shared_seos
    ADD CONSTRAINT components_shared_seos_pkey PRIMARY KEY (id);


--
-- Name: components_shared_sliders components_shared_sliders_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.components_shared_sliders
    ADD CONSTRAINT components_shared_sliders_pkey PRIMARY KEY (id);


--
-- Name: files_folder_lnk files_folder_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_pkey PRIMARY KEY (id);


--
-- Name: files_folder_lnk files_folder_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_uq UNIQUE (file_id, folder_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: files_related_mph files_related_mph_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_pkey PRIMARY KEY (id);


--
-- Name: globals_cmps globals_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.globals_cmps
    ADD CONSTRAINT globals_cmps_pkey PRIMARY KEY (id);


--
-- Name: globals globals_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.globals
    ADD CONSTRAINT globals_pkey PRIMARY KEY (id);


--
-- Name: globals_cmps globals_uq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.globals_cmps
    ADD CONSTRAINT globals_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_uq UNIQUE (api_token_permission_id, api_token_id);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_history_versions strapi_history_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations_internal strapi_migrations_internal_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_migrations_internal
    ADD CONSTRAINT strapi_migrations_internal_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions strapi_release_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_uq UNIQUE (release_action_id, release_id);


--
-- Name: strapi_releases strapi_releases_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_uq UNIQUE (transfer_token_permission_id, transfer_token_id);


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows strapi_workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_uq UNIQUE (workflow_id, workflow_stage_id);


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_uq UNIQUE (workflow_stage_id, permission_id);


--
-- Name: strapi_workflows_stages strapi_workflows_stages_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_uq UNIQUE (workflow_stage_id, workflow_id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_lnk up_users_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_lnk up_users_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_uq UNIQUE (user_id, role_id);


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_pkey PRIMARY KEY (id);


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_uq UNIQUE (folder_id, inv_folder_id);


--
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- Name: abouts_component_type_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX abouts_component_type_idx ON public.abouts_cmps USING btree (component_type);


--
-- Name: abouts_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX abouts_created_by_id_fk ON public.abouts USING btree (created_by_id);


--
-- Name: abouts_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX abouts_documents_idx ON public.abouts USING btree (document_id, locale, published_at);


--
-- Name: abouts_entity_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX abouts_entity_fk ON public.abouts_cmps USING btree (entity_id);


--
-- Name: abouts_field_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX abouts_field_idx ON public.abouts_cmps USING btree (field);


--
-- Name: abouts_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX abouts_updated_by_id_fk ON public.abouts USING btree (updated_by_id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX admin_permissions_documents_idx ON public.admin_permissions USING btree (document_id, locale, published_at);


--
-- Name: admin_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX admin_permissions_role_lnk_fk ON public.admin_permissions_role_lnk USING btree (permission_id);


--
-- Name: admin_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX admin_permissions_role_lnk_ifk ON public.admin_permissions_role_lnk USING btree (role_id);


--
-- Name: admin_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX admin_permissions_role_lnk_oifk ON public.admin_permissions_role_lnk USING btree (permission_ord);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX admin_roles_documents_idx ON public.admin_roles USING btree (document_id, locale, published_at);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- Name: admin_users_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX admin_users_documents_idx ON public.admin_users USING btree (document_id, locale, published_at);


--
-- Name: admin_users_roles_lnk_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX admin_users_roles_lnk_fk ON public.admin_users_roles_lnk USING btree (user_id);


--
-- Name: admin_users_roles_lnk_ifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX admin_users_roles_lnk_ifk ON public.admin_users_roles_lnk USING btree (role_id);


--
-- Name: admin_users_roles_lnk_ofk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX admin_users_roles_lnk_ofk ON public.admin_users_roles_lnk USING btree (role_ord);


--
-- Name: admin_users_roles_lnk_oifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX admin_users_roles_lnk_oifk ON public.admin_users_roles_lnk USING btree (user_ord);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- Name: articles_author_lnk_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX articles_author_lnk_fk ON public.articles_author_lnk USING btree (article_id);


--
-- Name: articles_author_lnk_ifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX articles_author_lnk_ifk ON public.articles_author_lnk USING btree (author_id);


--
-- Name: articles_author_lnk_oifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX articles_author_lnk_oifk ON public.articles_author_lnk USING btree (article_ord);


--
-- Name: articles_category_lnk_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX articles_category_lnk_fk ON public.articles_category_lnk USING btree (article_id);


--
-- Name: articles_category_lnk_ifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX articles_category_lnk_ifk ON public.articles_category_lnk USING btree (category_id);


--
-- Name: articles_category_lnk_oifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX articles_category_lnk_oifk ON public.articles_category_lnk USING btree (article_ord);


--
-- Name: articles_component_type_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX articles_component_type_idx ON public.articles_cmps USING btree (component_type);


--
-- Name: articles_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX articles_created_by_id_fk ON public.articles USING btree (created_by_id);


--
-- Name: articles_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX articles_documents_idx ON public.articles USING btree (document_id, locale, published_at);


--
-- Name: articles_entity_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX articles_entity_fk ON public.articles_cmps USING btree (entity_id);


--
-- Name: articles_field_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX articles_field_idx ON public.articles_cmps USING btree (field);


--
-- Name: articles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX articles_updated_by_id_fk ON public.articles USING btree (updated_by_id);


--
-- Name: authors_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX authors_created_by_id_fk ON public.authors USING btree (created_by_id);


--
-- Name: authors_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX authors_documents_idx ON public.authors USING btree (document_id, locale, published_at);


--
-- Name: authors_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX authors_updated_by_id_fk ON public.authors USING btree (updated_by_id);


--
-- Name: categories_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX categories_created_by_id_fk ON public.categories USING btree (created_by_id);


--
-- Name: categories_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX categories_documents_idx ON public.categories USING btree (document_id, locale, published_at);


--
-- Name: categories_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX categories_updated_by_id_fk ON public.categories USING btree (updated_by_id);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- Name: files_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX files_documents_idx ON public.files USING btree (document_id, locale, published_at);


--
-- Name: files_folder_lnk_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX files_folder_lnk_fk ON public.files_folder_lnk USING btree (file_id);


--
-- Name: files_folder_lnk_ifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX files_folder_lnk_ifk ON public.files_folder_lnk USING btree (folder_id);


--
-- Name: files_folder_lnk_oifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX files_folder_lnk_oifk ON public.files_folder_lnk USING btree (file_ord);


--
-- Name: files_related_mph_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX files_related_mph_fk ON public.files_related_mph USING btree (file_id);


--
-- Name: files_related_mph_idix; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX files_related_mph_idix ON public.files_related_mph USING btree (related_id);


--
-- Name: files_related_mph_oidx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX files_related_mph_oidx ON public.files_related_mph USING btree ("order");


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- Name: globals_component_type_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX globals_component_type_idx ON public.globals_cmps USING btree (component_type);


--
-- Name: globals_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX globals_created_by_id_fk ON public.globals USING btree (created_by_id);


--
-- Name: globals_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX globals_documents_idx ON public.globals USING btree (document_id, locale, published_at);


--
-- Name: globals_entity_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX globals_entity_fk ON public.globals_cmps USING btree (entity_id);


--
-- Name: globals_field_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX globals_field_idx ON public.globals_cmps USING btree (field);


--
-- Name: globals_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX globals_updated_by_id_fk ON public.globals USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX i18n_locale_documents_idx ON public.i18n_locale USING btree (document_id, locale, published_at);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- Name: strapi_api_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_api_token_permissions_documents_idx ON public.strapi_api_token_permissions USING btree (document_id, locale, published_at);


--
-- Name: strapi_api_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_api_token_permissions_token_lnk_fk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_id);


--
-- Name: strapi_api_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_api_token_permissions_token_lnk_ifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_id);


--
-- Name: strapi_api_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_api_token_permissions_token_lnk_oifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_ord);


--
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_api_tokens_documents_idx ON public.strapi_api_tokens USING btree (document_id, locale, published_at);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: strapi_history_versions_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_history_versions_created_by_id_fk ON public.strapi_history_versions USING btree (created_by_id);


--
-- Name: strapi_release_actions_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_release_actions_created_by_id_fk ON public.strapi_release_actions USING btree (created_by_id);


--
-- Name: strapi_release_actions_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_release_actions_documents_idx ON public.strapi_release_actions USING btree (document_id, locale, published_at);


--
-- Name: strapi_release_actions_release_lnk_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_release_actions_release_lnk_fk ON public.strapi_release_actions_release_lnk USING btree (release_action_id);


--
-- Name: strapi_release_actions_release_lnk_ifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_release_actions_release_lnk_ifk ON public.strapi_release_actions_release_lnk USING btree (release_id);


--
-- Name: strapi_release_actions_release_lnk_oifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_release_actions_release_lnk_oifk ON public.strapi_release_actions_release_lnk USING btree (release_action_ord);


--
-- Name: strapi_release_actions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_release_actions_updated_by_id_fk ON public.strapi_release_actions USING btree (updated_by_id);


--
-- Name: strapi_releases_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_releases_created_by_id_fk ON public.strapi_releases USING btree (created_by_id);


--
-- Name: strapi_releases_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_releases_documents_idx ON public.strapi_releases USING btree (document_id, locale, published_at);


--
-- Name: strapi_releases_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_releases_updated_by_id_fk ON public.strapi_releases USING btree (updated_by_id);


--
-- Name: strapi_transfer_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);


--
-- Name: strapi_transfer_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_transfer_token_permissions_documents_idx ON public.strapi_transfer_token_permissions USING btree (document_id, locale, published_at);


--
-- Name: strapi_transfer_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_fk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_id);


--
-- Name: strapi_transfer_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_ifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_id);


--
-- Name: strapi_transfer_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_oifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_ord);


--
-- Name: strapi_transfer_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_transfer_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);


--
-- Name: strapi_transfer_tokens_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_transfer_tokens_documents_idx ON public.strapi_transfer_tokens USING btree (document_id, locale, published_at);


--
-- Name: strapi_transfer_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);


--
-- Name: strapi_workflows_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_workflows_created_by_id_fk ON public.strapi_workflows USING btree (created_by_id);


--
-- Name: strapi_workflows_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_workflows_documents_idx ON public.strapi_workflows USING btree (document_id, locale, published_at);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_fk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_id);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_ifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_ifk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_workflows_stages_created_by_id_fk ON public.strapi_workflows_stages USING btree (created_by_id);


--
-- Name: strapi_workflows_stages_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_workflows_stages_documents_idx ON public.strapi_workflows_stages USING btree (document_id, locale, published_at);


--
-- Name: strapi_workflows_stages_permissions_lnk_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_fk ON public.strapi_workflows_stages_permissions_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_permissions_lnk_ifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ifk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_id);


--
-- Name: strapi_workflows_stages_permissions_lnk_ofk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ofk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_ord);


--
-- Name: strapi_workflows_stages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_workflows_stages_updated_by_id_fk ON public.strapi_workflows_stages USING btree (updated_by_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_fk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_ifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_ifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_oifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_oifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_ord);


--
-- Name: strapi_workflows_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX strapi_workflows_updated_by_id_fk ON public.strapi_workflows USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX up_permissions_documents_idx ON public.up_permissions USING btree (document_id, locale, published_at);


--
-- Name: up_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX up_permissions_role_lnk_fk ON public.up_permissions_role_lnk USING btree (permission_id);


--
-- Name: up_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX up_permissions_role_lnk_ifk ON public.up_permissions_role_lnk USING btree (role_id);


--
-- Name: up_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX up_permissions_role_lnk_oifk ON public.up_permissions_role_lnk USING btree (permission_ord);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- Name: up_roles_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX up_roles_documents_idx ON public.up_roles USING btree (document_id, locale, published_at);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- Name: up_users_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX up_users_documents_idx ON public.up_users USING btree (document_id, locale, published_at);


--
-- Name: up_users_role_lnk_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX up_users_role_lnk_fk ON public.up_users_role_lnk USING btree (user_id);


--
-- Name: up_users_role_lnk_ifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX up_users_role_lnk_ifk ON public.up_users_role_lnk USING btree (role_id);


--
-- Name: up_users_role_lnk_oifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX up_users_role_lnk_oifk ON public.up_users_role_lnk USING btree (user_ord);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- Name: upload_folders_documents_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX upload_folders_documents_idx ON public.upload_folders USING btree (document_id, locale, published_at);


--
-- Name: upload_folders_parent_lnk_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX upload_folders_parent_lnk_fk ON public.upload_folders_parent_lnk USING btree (folder_id);


--
-- Name: upload_folders_parent_lnk_ifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX upload_folders_parent_lnk_ifk ON public.upload_folders_parent_lnk USING btree (inv_folder_id);


--
-- Name: upload_folders_parent_lnk_oifk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX upload_folders_parent_lnk_oifk ON public.upload_folders_parent_lnk USING btree (folder_ord);


--
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- Name: abouts abouts_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.abouts
    ADD CONSTRAINT abouts_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: abouts_cmps abouts_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.abouts_cmps
    ADD CONSTRAINT abouts_entity_fk FOREIGN KEY (entity_id) REFERENCES public.abouts(id) ON DELETE CASCADE;


--
-- Name: abouts abouts_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.abouts
    ADD CONSTRAINT abouts_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: articles_author_lnk articles_author_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.articles_author_lnk
    ADD CONSTRAINT articles_author_lnk_fk FOREIGN KEY (article_id) REFERENCES public.articles(id) ON DELETE CASCADE;


--
-- Name: articles_author_lnk articles_author_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.articles_author_lnk
    ADD CONSTRAINT articles_author_lnk_ifk FOREIGN KEY (author_id) REFERENCES public.authors(id) ON DELETE CASCADE;


--
-- Name: articles_category_lnk articles_category_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.articles_category_lnk
    ADD CONSTRAINT articles_category_lnk_fk FOREIGN KEY (article_id) REFERENCES public.articles(id) ON DELETE CASCADE;


--
-- Name: articles_category_lnk articles_category_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.articles_category_lnk
    ADD CONSTRAINT articles_category_lnk_ifk FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: articles articles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: articles_cmps articles_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.articles_cmps
    ADD CONSTRAINT articles_entity_fk FOREIGN KEY (entity_id) REFERENCES public.articles(id) ON DELETE CASCADE;


--
-- Name: articles articles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: authors authors_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: authors authors_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: categories categories_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: categories categories_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_folder_lnk files_folder_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files_folder_lnk files_folder_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_ifk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: files_related_mph files_related_mph_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: globals globals_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.globals
    ADD CONSTRAINT globals_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: globals_cmps globals_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.globals_cmps
    ADD CONSTRAINT globals_entity_fk FOREIGN KEY (entity_id) REFERENCES public.globals(id) ON DELETE CASCADE;


--
-- Name: globals globals_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.globals
    ADD CONSTRAINT globals_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_ifk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_history_versions strapi_history_versions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions strapi_release_actions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_fk FOREIGN KEY (release_action_id) REFERENCES public.strapi_release_actions(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_ifk FOREIGN KEY (release_id) REFERENCES public.strapi_releases(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions strapi_release_actions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_ifk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows strapi_workflows_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_fk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_ifk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages strapi_workflows_stages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_ifk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages strapi_workflows_stages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_ifk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows strapi_workflows_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_lnk up_users_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_lnk up_users_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_ifk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

