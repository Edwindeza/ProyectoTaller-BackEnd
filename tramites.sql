--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE authtoken_token OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_admin_log (
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


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- Name: webapp_cargo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE webapp_cargo (
    id integer NOT NULL,
    nombre character varying(35) NOT NULL,
    descripcion character varying(150) NOT NULL
);


ALTER TABLE webapp_cargo OWNER TO postgres;

--
-- Name: webapp_cargo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE webapp_cargo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webapp_cargo_id_seq OWNER TO postgres;

--
-- Name: webapp_cargo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE webapp_cargo_id_seq OWNED BY webapp_cargo.id;


--
-- Name: webapp_jefedeoficina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE webapp_jefedeoficina (
    id integer NOT NULL,
    jefe_oficina_codigo character varying(10) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE webapp_jefedeoficina OWNER TO postgres;

--
-- Name: webapp_jefedeoficina_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE webapp_jefedeoficina_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webapp_jefedeoficina_id_seq OWNER TO postgres;

--
-- Name: webapp_jefedeoficina_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE webapp_jefedeoficina_id_seq OWNED BY webapp_jefedeoficina.id;


--
-- Name: webapp_jefedetramite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE webapp_jefedetramite (
    id integer NOT NULL,
    jefe_tramite_codigo character varying(10) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE webapp_jefedetramite OWNER TO postgres;

--
-- Name: webapp_jefedetramite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE webapp_jefedetramite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webapp_jefedetramite_id_seq OWNER TO postgres;

--
-- Name: webapp_jefedetramite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE webapp_jefedetramite_id_seq OWNED BY webapp_jefedetramite.id;


--
-- Name: webapp_oficina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE webapp_oficina (
    id integer NOT NULL,
    nombre character varying(35) NOT NULL,
    descripcion character varying(150) NOT NULL,
    dependencia character varying(35) NOT NULL,
    jefe_oficina_id integer NOT NULL
);


ALTER TABLE webapp_oficina OWNER TO postgres;

--
-- Name: webapp_oficina_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE webapp_oficina_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webapp_oficina_id_seq OWNER TO postgres;

--
-- Name: webapp_oficina_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE webapp_oficina_id_seq OWNED BY webapp_oficina.id;


--
-- Name: webapp_requisito; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE webapp_requisito (
    id integer NOT NULL,
    nombre character varying(30) NOT NULL,
    concepto_de_pago character varying(7),
    estado character varying(8) NOT NULL,
    monto character varying(10)
);


ALTER TABLE webapp_requisito OWNER TO postgres;

--
-- Name: webapp_requisito_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE webapp_requisito_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webapp_requisito_id_seq OWNER TO postgres;

--
-- Name: webapp_requisito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE webapp_requisito_id_seq OWNED BY webapp_requisito.id;


--
-- Name: webapp_solicitante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE webapp_solicitante (
    id integer NOT NULL,
    solicitante_codigo character varying(10) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE webapp_solicitante OWNER TO postgres;

--
-- Name: webapp_solicitante_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE webapp_solicitante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webapp_solicitante_id_seq OWNER TO postgres;

--
-- Name: webapp_solicitante_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE webapp_solicitante_id_seq OWNED BY webapp_solicitante.id;


--
-- Name: webapp_tipotramite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE webapp_tipotramite (
    id integer NOT NULL,
    nombre character varying(30) NOT NULL
);


ALTER TABLE webapp_tipotramite OWNER TO postgres;

--
-- Name: webapp_tipotramite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE webapp_tipotramite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webapp_tipotramite_id_seq OWNER TO postgres;

--
-- Name: webapp_tipotramite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE webapp_tipotramite_id_seq OWNED BY webapp_tipotramite.id;


--
-- Name: webapp_tramite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE webapp_tramite (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    descripcion character varying(150),
    jefe_tramite_id integer NOT NULL,
    tipo_id integer NOT NULL,
    visita integer NOT NULL,
    CONSTRAINT webapp_tramite_visita_check CHECK ((visita >= 0))
);


ALTER TABLE webapp_tramite OWNER TO postgres;

--
-- Name: webapp_tramite_hoja_de_ruta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE webapp_tramite_hoja_de_ruta (
    id integer NOT NULL,
    tramite_id integer NOT NULL,
    oficina_id integer NOT NULL
);


ALTER TABLE webapp_tramite_hoja_de_ruta OWNER TO postgres;

--
-- Name: webapp_tramite_hoja_de_ruta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE webapp_tramite_hoja_de_ruta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webapp_tramite_hoja_de_ruta_id_seq OWNER TO postgres;

--
-- Name: webapp_tramite_hoja_de_ruta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE webapp_tramite_hoja_de_ruta_id_seq OWNED BY webapp_tramite_hoja_de_ruta.id;


--
-- Name: webapp_tramite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE webapp_tramite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webapp_tramite_id_seq OWNER TO postgres;

--
-- Name: webapp_tramite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE webapp_tramite_id_seq OWNED BY webapp_tramite.id;


--
-- Name: webapp_tramite_requisitos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE webapp_tramite_requisitos (
    id integer NOT NULL,
    tramite_id integer NOT NULL,
    requisito_id integer NOT NULL
);


ALTER TABLE webapp_tramite_requisitos OWNER TO postgres;

--
-- Name: webapp_tramite_requisitos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE webapp_tramite_requisitos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webapp_tramite_requisitos_id_seq OWNER TO postgres;

--
-- Name: webapp_tramite_requisitos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE webapp_tramite_requisitos_id_seq OWNED BY webapp_tramite_requisitos.id;


--
-- Name: webapp_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE webapp_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(254) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    dni character varying(8) NOT NULL,
    codigo character varying(8) NOT NULL,
    direccion character varying(50) NOT NULL,
    telefono character varying(9) NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_admin boolean NOT NULL
);


ALTER TABLE webapp_user OWNER TO postgres;

--
-- Name: webapp_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE webapp_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE webapp_user_groups OWNER TO postgres;

--
-- Name: webapp_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE webapp_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webapp_user_groups_id_seq OWNER TO postgres;

--
-- Name: webapp_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE webapp_user_groups_id_seq OWNED BY webapp_user_groups.id;


--
-- Name: webapp_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE webapp_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webapp_user_id_seq OWNER TO postgres;

--
-- Name: webapp_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE webapp_user_id_seq OWNED BY webapp_user.id;


--
-- Name: webapp_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE webapp_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE webapp_user_user_permissions OWNER TO postgres;

--
-- Name: webapp_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE webapp_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webapp_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: webapp_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE webapp_user_user_permissions_id_seq OWNED BY webapp_user_user_permissions.id;


--
-- Name: webapp_usuariotramite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE webapp_usuariotramite (
    id integer NOT NULL,
    tramite_id integer NOT NULL,
    usuario_id integer NOT NULL,
    estado character varying(25),
    oficina_id integer,
    boucher character varying(100),
    codigo character varying(12)
);


ALTER TABLE webapp_usuariotramite OWNER TO postgres;

--
-- Name: webapp_usuariotramite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE webapp_usuariotramite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webapp_usuariotramite_id_seq OWNER TO postgres;

--
-- Name: webapp_usuariotramite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE webapp_usuariotramite_id_seq OWNED BY webapp_usuariotramite.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_cargo ALTER COLUMN id SET DEFAULT nextval('webapp_cargo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_jefedeoficina ALTER COLUMN id SET DEFAULT nextval('webapp_jefedeoficina_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_jefedetramite ALTER COLUMN id SET DEFAULT nextval('webapp_jefedetramite_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_oficina ALTER COLUMN id SET DEFAULT nextval('webapp_oficina_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_requisito ALTER COLUMN id SET DEFAULT nextval('webapp_requisito_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_solicitante ALTER COLUMN id SET DEFAULT nextval('webapp_solicitante_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_tipotramite ALTER COLUMN id SET DEFAULT nextval('webapp_tipotramite_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_tramite ALTER COLUMN id SET DEFAULT nextval('webapp_tramite_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_tramite_hoja_de_ruta ALTER COLUMN id SET DEFAULT nextval('webapp_tramite_hoja_de_ruta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_tramite_requisitos ALTER COLUMN id SET DEFAULT nextval('webapp_tramite_requisitos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_user ALTER COLUMN id SET DEFAULT nextval('webapp_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_user_groups ALTER COLUMN id SET DEFAULT nextval('webapp_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('webapp_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_usuariotramite ALTER COLUMN id SET DEFAULT nextval('webapp_usuariotramite_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add Usuario	6	add_user
17	Can change Usuario	6	change_user
18	Can delete Usuario	6	delete_user
19	Can add cargo	7	add_cargo
20	Can change cargo	7	change_cargo
21	Can delete cargo	7	delete_cargo
22	Can add solicitante	8	add_solicitante
23	Can change solicitante	8	change_solicitante
24	Can delete solicitante	8	delete_solicitante
25	Can add jefe de tramite	9	add_jefedetramite
26	Can change jefe de tramite	9	change_jefedetramite
27	Can delete jefe de tramite	9	delete_jefedetramite
28	Can add jefe de oficina	10	add_jefedeoficina
29	Can change jefe de oficina	10	change_jefedeoficina
30	Can delete jefe de oficina	10	delete_jefedeoficina
34	Can add requisito	12	add_requisito
35	Can change requisito	12	change_requisito
36	Can delete requisito	12	delete_requisito
37	Can add tipo tramite	13	add_tipotramite
38	Can change tipo tramite	13	change_tipotramite
39	Can delete tipo tramite	13	delete_tipotramite
43	Can add oficina	15	add_oficina
44	Can change oficina	15	change_oficina
45	Can delete oficina	15	delete_oficina
46	Can add tramite	16	add_tramite
47	Can change tramite	16	change_tramite
48	Can delete tramite	16	delete_tramite
49	Can add usuario tramite	17	add_usuariotramite
50	Can change usuario tramite	17	change_usuariotramite
51	Can delete usuario tramite	17	delete_usuariotramite
52	Can add Token	18	add_token
53	Can change Token	18	change_token
54	Can delete Token	18	delete_token
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 57, true);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY authtoken_token (key, created, user_id) FROM stdin;
5464fe523f2886a70945b4767a5dcd02efd68e1e	2017-02-26 05:45:44.067075-05	32
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
223	2017-02-26 06:07:44.665134-05	33	jefetramite1@gmail.com	1	Añadido.	6	31
226	2017-02-26 06:11:50.666988-05	28	autoseguro(opcional)-210459	1	Añadido.	12	31
229	2017-02-26 06:13:16.749728-05	8	  joficina1	1	Añadido.	10	31
224	2017-02-26 06:08:06.332235-05	8	  jtramite1	1	Añadido.	9	31
227	2017-02-26 06:12:15.543035-05	29	Mantenimient de laboratorio-210-340	1	Añadido.	12	31
230	2017-02-26 06:14:24.429702-05	9	Ruta1	1	Añadido.	15	31
225	2017-02-26 06:11:08.812563-05	27	Recibo Carnet-201-302	1	Añadido.	12	31
228	2017-02-26 06:13:08.495772-05	34	jefeoficina1@gmail.com	1	Añadido.	6	31
231	2017-02-26 06:14:28.752348-05	18	Matrícula de Ingresante	1	Añadido.	16	31
215	2017-02-26 05:41:50.344125-05	fce8c25c9de127279a1a6df1dc9861a362d5bbed	fce8c25c9de127279a1a6df1dc9861a362d5bbed	3		18	31
216	2017-02-26 05:45:03.247732-05	30	admin1@gmail.com	3		6	31
217	2017-02-26 05:45:03.398005-05	25	cosar@gmail.com	3		6	31
218	2017-02-26 05:45:03.408524-05	29	edwin@gmail.com	3		6	31
219	2017-02-26 05:45:03.419562-05	1	erikd.guiba@gmail.com	3		6	31
220	2017-02-26 05:45:03.430629-05	28	miguel@gmail.com	3		6	31
221	2017-02-26 05:45:03.441795-05	26	supo@gmail.com	3		6	31
222	2017-02-26 05:45:03.453231-05	27	zea@gmail.com	3		6	31
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 231, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	webapp	user
7	webapp	cargo
8	webapp	solicitante
9	webapp	jefedetramite
10	webapp	jefedeoficina
12	webapp	requisito
13	webapp	tipotramite
15	webapp	oficina
16	webapp	tramite
17	webapp	usuariotramite
18	authtoken	token
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 19, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-06-26 00:52:22.343615-05
2	contenttypes	0002_remove_content_type_name	2016-06-26 00:52:22.365783-05
3	auth	0001_initial	2016-06-26 00:52:22.887714-05
4	auth	0002_alter_permission_name_max_length	2016-06-26 00:52:22.909679-05
5	auth	0003_alter_user_email_max_length	2016-06-26 00:52:22.928093-05
6	auth	0004_alter_user_username_opts	2016-06-26 00:52:22.951261-05
7	auth	0005_alter_user_last_login_null	2016-06-26 00:52:22.972336-05
8	auth	0006_require_contenttypes_0002	2016-06-26 00:52:22.988066-05
9	auth	0007_alter_validators_add_error_messages	2016-06-26 00:52:23.005553-05
10	webapp	0001_initial	2016-06-26 00:52:24.979929-05
11	admin	0001_initial	2016-06-26 00:52:26.266087-05
12	admin	0002_logentry_remove_auto_add	2016-06-26 00:52:26.310386-05
13	sessions	0001_initial	2016-06-26 00:52:26.522066-05
14	webapp	0002_auto_20160626_0237	2016-06-26 02:37:04.453986-05
15	authtoken	0001_initial	2016-06-26 04:05:52.645988-05
16	authtoken	0002_auto_20160226_1747	2016-06-26 04:05:53.132608-05
17	webapp	0003_auto_20160626_0405	2016-06-26 04:05:53.422558-05
18	webapp	0004_auto_20160629_1154	2016-06-29 11:55:13.388333-05
19	webapp	0005_auto_20160629_1219	2016-06-29 12:19:56.558064-05
20	webapp	0006_auto_20160706_2053	2016-07-06 20:53:49.60376-05
21	webapp	0007_user_is_admin	2016-07-07 08:49:25.926148-05
22	webapp	0008_auto_20160707_1359	2016-07-07 13:59:57.515544-05
23	webapp	0009_auto_20160707_1405	2016-07-07 14:05:43.084718-05
24	webapp	0010_fut	2016-11-24 14:17:23.127527-05
25	webapp	0011_auto_20161124_1649	2016-11-24 16:50:03.437285-05
26	webapp	0012_auto_20161202_2123	2016-12-02 21:23:53.527615-05
27	webapp	0013_auto_20161202_2129	2016-12-02 21:29:51.731929-05
28	webapp	0014_delete_movimiento	2017-02-26 10:04:20.258639-05
29	webapp	0015_auto_20170226_1004	2017-02-26 10:04:21.38946-05
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 29, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
cb3tyqpoq2933kyxaxhk3qsrqkul210s	NmU1YmUwZTliZDQ3YTA5MWY5MDVmNjRhYzA2ZmJjZTAyNjUyNzFkNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjBmMWFiY2U4NzQ5NmMwOGRiNmVkYzM5OTdiMjA5ODBlZDU5NWVlZTciLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2016-07-10 00:53:48.733616-05
rfpim44ynnpf6993a84bg13hp2xmagkv	YzZlZjdlNGVlMjYxNTg4NWUzMzU4N2E2MmUxMDk5YzQ2Y2UzNmRkODp7Il9hdXRoX3VzZXJfaGFzaCI6ImZlMGZmMjlkZmQzZjk2N2M0YzU4Nzk5MDM0NDZhNGZiYTM3YjY4NTkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2016-07-10 00:54:13.097767-05
x0t3gi9l2jait3ho5lio6x6ms2w45y12	OWE1NzhiNmIwZjljOGIwMzg4ODYzZjRiOWVkNGExYWQyNDg2MzgyMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImJkMmJhMDI5YTJiOTM4Njg2MmU3MzA1NDczYjUxOGI5OTYyMTE4MjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2016-07-10 01:02:48.159237-05
ys9ciygvc26k4bj2x554a8oggnlqm299	YzZlZjdlNGVlMjYxNTg4NWUzMzU4N2E2MmUxMDk5YzQ2Y2UzNmRkODp7Il9hdXRoX3VzZXJfaGFzaCI6ImZlMGZmMjlkZmQzZjk2N2M0YzU4Nzk5MDM0NDZhNGZiYTM3YjY4NTkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2016-07-13 11:46:30.491028-05
ca3a67qprmpgqym1k6fqcack26n0nuxr	YTQwYjUyMzAwNmZmMjBiNmVhODYwY2JmZDllYzhmMDIwYTg2YzJmNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2VkNTNhOGNiMDU3MGY3NDY2Zjk0NDFhMmY1YThiZGNlMTE4ZDYzZSIsIl9hdXRoX3VzZXJfaWQiOiIyNCJ9	2016-07-21 08:57:26.215066-05
yrpqtzk4ch5ivau7dmjwz2sipil5i65r	ZDNjZDNmYWMwNDY4ZTI0ODZiNGZmOGI3Mjk2ZDM5NDBiYmU1OWIzNjp7Il9hdXRoX3VzZXJfaWQiOiIyOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWYxYWNiNTg5YzA0YTQyMzI0YjI0ZmQ5ODY5NDM0MzZkMzhmYWRmNSJ9	2016-07-21 13:50:12.741291-05
yg4izmyezvawu8a6q78ca3n4vv17norz	MmMwYmQ3ZWU3YTNjZTg0ZTc5NjNjOWQ0ZjZmYmYxMzQ5NTI2NWFkNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjI3IiwiX2F1dGhfdXNlcl9oYXNoIjoiYmYyOWVjN2ZjYmNlMWQ0ZTljM2ZjMzFkZDk0MDk5ODUyYTgzYTBhMyJ9	2016-07-21 13:59:02.134714-05
0oitjg4et734lpqwi73g40yt3np9yqke	NDk2NmMyMjM3Njc2YjdhY2NjZmFkNTVjZjdmNDU0NjJiMzM2ODgwODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZmUwZmYyOWRmZDNmOTY3YzRjNTg3OTkwMzQ0NmE0ZmJhMzdiNjg1OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2016-07-21 16:29:29.119739-05
5dx1slqzor00pg5bkdnhnec2cgp17g4c	ODA1NTliYzQzYWE1NmRmMDA1YmUyODYxZTE5YzdiZDYxYjI5YzI4Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJmZTBmZjI5ZGZkM2Y5NjdjNGM1ODc5OTAzNDQ2YTRmYmEzN2I2ODU5In0=	2016-12-23 18:01:51.683534-05
v8yvh0s46owqd7szuei1t9u6b31301hh	MzNkZjRhNTMxMzQxZDI5NTFkMWRjMGE5MTRlZmZjM2YwNjY5ODBjODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjMxIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2Y2MDM3YjVmMTk1Y2NkNzc0NzhkNzJmMWMwZjRkNWZmMjNkZmNjMyJ9	2017-03-12 05:41:32.270657-05
\.


--
-- Data for Name: webapp_cargo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY webapp_cargo (id, nombre, descripcion) FROM stdin;
\.


--
-- Name: webapp_cargo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('webapp_cargo_id_seq', 2, true);


--
-- Data for Name: webapp_jefedeoficina; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY webapp_jefedeoficina (id, jefe_oficina_codigo, user_id) FROM stdin;
8	joficina1	34
\.


--
-- Name: webapp_jefedeoficina_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('webapp_jefedeoficina_id_seq', 8, true);


--
-- Data for Name: webapp_jefedetramite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY webapp_jefedetramite (id, jefe_tramite_codigo, user_id) FROM stdin;
8	jtramite1	33
\.


--
-- Name: webapp_jefedetramite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('webapp_jefedetramite_id_seq', 8, true);


--
-- Data for Name: webapp_oficina; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY webapp_oficina (id, nombre, descripcion, dependencia, jefe_oficina_id) FROM stdin;
9	Ruta1	sdaasdsad	asdadasda	8
\.


--
-- Name: webapp_oficina_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('webapp_oficina_id_seq', 9, true);


--
-- Data for Name: webapp_requisito; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY webapp_requisito (id, nombre, concepto_de_pago, estado, monto) FROM stdin;
3	Formato Único de Trámite	210-106	FISICO	\N
4	Formato Unico de Tramite	210-019	FISICO	\N
5	Solicitud simple	210-019	FISICO	\N
6	Resolución Rectoral copia	210-019	FISICO	\N
7	Recibo de Pago	210-019	FISICO	\N
9	Recibo de Pago	210-005	FISICO	67.00
10	Formato Unico de Tramite		FISICO	
12	CONSTANCIA DE ESTUDIOS	210 153	FISICO	15
13	Recibo de Pago	210-154	FISICO	15.00
14	Formato Unico de Tramite	201-156	FISICO	15
15	Historial Academico		FISICO	
16	Formato Único de Trámite	210-151	FISICO	$26.00
17	Formato Único de Trámite	210-154	FISICO	15.00
18	Formato Unico de Trámite (FUT)		VIRTUAL	
19	Formato Único de Trámite	210-337	FISICO	$15.00
8	Concepto Constancia Egresado	210 155	FISICO	S/15.00
20	Formato Único de Trámite	210-152	FISICO	$15.00
11	Recibo de pago	210-176	FISICO	S/15.00
21	Formato Unico de Tramite	210-101	FISICO	$ 10.00
22	Formato Unico de Tramite	210-107	FISICO	$ 26
23	Formato Único de Trámite	210-252	FISICO	$19.00
24	Formato Inscripción Proyecto	210-210	FISICO	$5.00
25	04 fotos tamaños carnet		FISICO	
26	Formato Unico de Tramite	210-176	FISICO	$ 15.00
27	Recibo Carnet	201-302	VIRTUAL	12.50
28	autoseguro(opcional)	210459	FISICO	20
29	Mantenimient de laboratorio	210-340	VIRTUAL	25
\.


--
-- Name: webapp_requisito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('webapp_requisito_id_seq', 29, true);


--
-- Data for Name: webapp_solicitante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY webapp_solicitante (id, solicitante_codigo, user_id) FROM stdin;
\.


--
-- Name: webapp_solicitante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('webapp_solicitante_id_seq', 57, true);


--
-- Data for Name: webapp_tipotramite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY webapp_tipotramite (id, nombre) FROM stdin;
5	Administrativo
6	Académico
7	PostGrado
\.


--
-- Name: webapp_tipotramite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('webapp_tipotramite_id_seq', 7, true);


--
-- Data for Name: webapp_tramite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY webapp_tramite (id, nombre, descripcion, jefe_tramite_id, tipo_id, visita) FROM stdin;
18	Matrícula de Ingresante	Primera matrícula del estudiante	8	6	0
\.


--
-- Data for Name: webapp_tramite_hoja_de_ruta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY webapp_tramite_hoja_de_ruta (id, tramite_id, oficina_id) FROM stdin;
42	18	9
\.


--
-- Name: webapp_tramite_hoja_de_ruta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('webapp_tramite_hoja_de_ruta_id_seq', 42, true);


--
-- Name: webapp_tramite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('webapp_tramite_id_seq', 18, true);


--
-- Data for Name: webapp_tramite_requisitos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY webapp_tramite_requisitos (id, tramite_id, requisito_id) FROM stdin;
28	18	27
29	18	28
30	18	29
\.


--
-- Name: webapp_tramite_requisitos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('webapp_tramite_requisitos_id_seq', 30, true);


--
-- Data for Name: webapp_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY webapp_user (id, password, last_login, is_superuser, email, first_name, last_name, dni, codigo, direccion, telefono, is_active, is_staff, is_admin) FROM stdin;
31	pbkdf2_sha256$24000$VNT192aGccsH$hhUNMfwXRLtj7sq+iFWjiq39PThiwRirxm1p5Wfw0fQ=	2017-02-26 05:41:32.14804-05	t	baudelaire@gmail.com							t	t	f
32	pbkdf2_sha256$24000$Kg34nAK7btTA$EnU44by8VjrI4iTFd26hNsteKVJq5TtJPQy2ZEeX1RE=	\N	f	erikd.guiba@gmail.com	Erik	Guido		09200054	Jr Puerto Maldonado 209 int 201	986245245	t	f	f
33	pbkdf2_sha256$24000$UseB95SPSSUV$i23vdOYIG2TLsCYwA+6PHNBP7W6wuJuy4jbvnJXxmTE=	\N	f	jefetramite1@gmail.com							t	f	f
34	pbkdf2_sha256$24000$1ixH0kojG76x$cirH9S8dn1vyNZ80IFGrXDsNpXS9sWWpJIhQWd1JmBY=	\N	f	jefeoficina1@gmail.com							t	f	f
\.


--
-- Data for Name: webapp_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY webapp_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: webapp_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('webapp_user_groups_id_seq', 1, false);


--
-- Name: webapp_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('webapp_user_id_seq', 34, true);


--
-- Data for Name: webapp_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY webapp_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: webapp_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('webapp_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: webapp_usuariotramite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY webapp_usuariotramite (id, tramite_id, usuario_id, estado, oficina_id, boucher, codigo) FROM stdin;
\.


--
-- Name: webapp_usuariotramite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('webapp_usuariotramite_id_seq', 49, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: webapp_cargo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_cargo
    ADD CONSTRAINT webapp_cargo_pkey PRIMARY KEY (id);


--
-- Name: webapp_jefedeoficina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_jefedeoficina
    ADD CONSTRAINT webapp_jefedeoficina_pkey PRIMARY KEY (id);


--
-- Name: webapp_jefedetramite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_jefedetramite
    ADD CONSTRAINT webapp_jefedetramite_pkey PRIMARY KEY (id);


--
-- Name: webapp_oficina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_oficina
    ADD CONSTRAINT webapp_oficina_pkey PRIMARY KEY (id);


--
-- Name: webapp_requisito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_requisito
    ADD CONSTRAINT webapp_requisito_pkey PRIMARY KEY (id);


--
-- Name: webapp_solicitante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_solicitante
    ADD CONSTRAINT webapp_solicitante_pkey PRIMARY KEY (id);


--
-- Name: webapp_tipotramite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_tipotramite
    ADD CONSTRAINT webapp_tipotramite_pkey PRIMARY KEY (id);


--
-- Name: webapp_tramite_hoja_de_ruta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_tramite_hoja_de_ruta
    ADD CONSTRAINT webapp_tramite_hoja_de_ruta_pkey PRIMARY KEY (id);


--
-- Name: webapp_tramite_hoja_de_ruta_tramite_id_78c8ed4a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_tramite_hoja_de_ruta
    ADD CONSTRAINT webapp_tramite_hoja_de_ruta_tramite_id_78c8ed4a_uniq UNIQUE (tramite_id, oficina_id);


--
-- Name: webapp_tramite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_tramite
    ADD CONSTRAINT webapp_tramite_pkey PRIMARY KEY (id);


--
-- Name: webapp_tramite_requisitos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_tramite_requisitos
    ADD CONSTRAINT webapp_tramite_requisitos_pkey PRIMARY KEY (id);


--
-- Name: webapp_tramite_requisitos_tramite_id_7f0c8060_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_tramite_requisitos
    ADD CONSTRAINT webapp_tramite_requisitos_tramite_id_7f0c8060_uniq UNIQUE (tramite_id, requisito_id);


--
-- Name: webapp_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_user
    ADD CONSTRAINT webapp_user_email_key UNIQUE (email);


--
-- Name: webapp_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_user_groups
    ADD CONSTRAINT webapp_user_groups_pkey PRIMARY KEY (id);


--
-- Name: webapp_user_groups_user_id_bfe43b37_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_user_groups
    ADD CONSTRAINT webapp_user_groups_user_id_bfe43b37_uniq UNIQUE (user_id, group_id);


--
-- Name: webapp_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_user
    ADD CONSTRAINT webapp_user_pkey PRIMARY KEY (id);


--
-- Name: webapp_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_user_user_permissions
    ADD CONSTRAINT webapp_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: webapp_user_user_permissions_user_id_ae444c59_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_user_user_permissions
    ADD CONSTRAINT webapp_user_user_permissions_user_id_ae444c59_uniq UNIQUE (user_id, permission_id);


--
-- Name: webapp_usuariotramite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_usuariotramite
    ADD CONSTRAINT webapp_usuariotramite_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: webapp_jefedeoficina_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapp_jefedeoficina_e8701ad4 ON webapp_jefedeoficina USING btree (user_id);


--
-- Name: webapp_jefedetramite_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapp_jefedetramite_e8701ad4 ON webapp_jefedetramite USING btree (user_id);


--
-- Name: webapp_oficina_e8a7c0dd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapp_oficina_e8a7c0dd ON webapp_oficina USING btree (jefe_oficina_id);


--
-- Name: webapp_solicitante_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapp_solicitante_e8701ad4 ON webapp_solicitante USING btree (user_id);


--
-- Name: webapp_tramite_c9e928c4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapp_tramite_c9e928c4 ON webapp_tramite USING btree (jefe_tramite_id);


--
-- Name: webapp_tramite_d3c0c18a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapp_tramite_d3c0c18a ON webapp_tramite USING btree (tipo_id);


--
-- Name: webapp_tramite_hoja_de_ruta_55f08fa8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapp_tramite_hoja_de_ruta_55f08fa8 ON webapp_tramite_hoja_de_ruta USING btree (tramite_id);


--
-- Name: webapp_tramite_hoja_de_ruta_c4af0210; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapp_tramite_hoja_de_ruta_c4af0210 ON webapp_tramite_hoja_de_ruta USING btree (oficina_id);


--
-- Name: webapp_tramite_requisitos_55f08fa8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapp_tramite_requisitos_55f08fa8 ON webapp_tramite_requisitos USING btree (tramite_id);


--
-- Name: webapp_tramite_requisitos_de1e9167; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapp_tramite_requisitos_de1e9167 ON webapp_tramite_requisitos USING btree (requisito_id);


--
-- Name: webapp_user_email_09ab0c0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapp_user_email_09ab0c0f_like ON webapp_user USING btree (email varchar_pattern_ops);


--
-- Name: webapp_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapp_user_groups_0e939a4f ON webapp_user_groups USING btree (group_id);


--
-- Name: webapp_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapp_user_groups_e8701ad4 ON webapp_user_groups USING btree (user_id);


--
-- Name: webapp_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapp_user_user_permissions_8373b171 ON webapp_user_user_permissions USING btree (permission_id);


--
-- Name: webapp_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapp_user_user_permissions_e8701ad4 ON webapp_user_user_permissions USING btree (user_id);


--
-- Name: webapp_usuariotramite_55f08fa8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapp_usuariotramite_55f08fa8 ON webapp_usuariotramite USING btree (tramite_id);


--
-- Name: webapp_usuariotramite_abfe0f96; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapp_usuariotramite_abfe0f96 ON webapp_usuariotramite USING btree (usuario_id);


--
-- Name: webapp_usuariotramite_c4af0210; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webapp_usuariotramite_c4af0210 ON webapp_usuariotramite USING btree (oficina_id);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token_user_id_35299eff_fk_webapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_webapp_user_id FOREIGN KEY (user_id) REFERENCES webapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_webapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_webapp_user_id FOREIGN KEY (user_id) REFERENCES webapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webapp_jefedeoficina_user_id_5f0173fd_fk_webapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_jefedeoficina
    ADD CONSTRAINT webapp_jefedeoficina_user_id_5f0173fd_fk_webapp_user_id FOREIGN KEY (user_id) REFERENCES webapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webapp_jefedetramite_user_id_b6a46f52_fk_webapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_jefedetramite
    ADD CONSTRAINT webapp_jefedetramite_user_id_b6a46f52_fk_webapp_user_id FOREIGN KEY (user_id) REFERENCES webapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webapp_ofic_jefe_oficina_id_f9f3930a_fk_webapp_jefedeoficina_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_oficina
    ADD CONSTRAINT webapp_ofic_jefe_oficina_id_f9f3930a_fk_webapp_jefedeoficina_id FOREIGN KEY (jefe_oficina_id) REFERENCES webapp_jefedeoficina(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webapp_solicitante_user_id_8e4e6ea3_fk_webapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_solicitante
    ADD CONSTRAINT webapp_solicitante_user_id_8e4e6ea3_fk_webapp_user_id FOREIGN KEY (user_id) REFERENCES webapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webapp_tram_jefe_tramite_id_b408f3dc_fk_webapp_jefedetramite_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_tramite
    ADD CONSTRAINT webapp_tram_jefe_tramite_id_b408f3dc_fk_webapp_jefedetramite_id FOREIGN KEY (jefe_tramite_id) REFERENCES webapp_jefedetramite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webapp_tramite_hoja_de_oficina_id_7ea736bc_fk_webapp_oficina_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_tramite_hoja_de_ruta
    ADD CONSTRAINT webapp_tramite_hoja_de_oficina_id_7ea736bc_fk_webapp_oficina_id FOREIGN KEY (oficina_id) REFERENCES webapp_oficina(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webapp_tramite_hoja_de_tramite_id_ea57c758_fk_webapp_tramite_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_tramite_hoja_de_ruta
    ADD CONSTRAINT webapp_tramite_hoja_de_tramite_id_ea57c758_fk_webapp_tramite_id FOREIGN KEY (tramite_id) REFERENCES webapp_tramite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webapp_tramite_req_requisito_id_d07d8912_fk_webapp_requisito_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_tramite_requisitos
    ADD CONSTRAINT webapp_tramite_req_requisito_id_d07d8912_fk_webapp_requisito_id FOREIGN KEY (requisito_id) REFERENCES webapp_requisito(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webapp_tramite_requisi_tramite_id_f2dad6e7_fk_webapp_tramite_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_tramite_requisitos
    ADD CONSTRAINT webapp_tramite_requisi_tramite_id_f2dad6e7_fk_webapp_tramite_id FOREIGN KEY (tramite_id) REFERENCES webapp_tramite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webapp_tramite_tipo_id_70ac8b03_fk_webapp_tipotramite_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_tramite
    ADD CONSTRAINT webapp_tramite_tipo_id_70ac8b03_fk_webapp_tipotramite_id FOREIGN KEY (tipo_id) REFERENCES webapp_tipotramite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webapp_user_groups_group_id_80b22ad1_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_user_groups
    ADD CONSTRAINT webapp_user_groups_group_id_80b22ad1_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webapp_user_groups_user_id_ee1e77b2_fk_webapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_user_groups
    ADD CONSTRAINT webapp_user_groups_user_id_ee1e77b2_fk_webapp_user_id FOREIGN KEY (user_id) REFERENCES webapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webapp_user_user_p_permission_id_c689398b_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_user_user_permissions
    ADD CONSTRAINT webapp_user_user_p_permission_id_c689398b_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webapp_user_user_permissions_user_id_f651c0ea_fk_webapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_user_user_permissions
    ADD CONSTRAINT webapp_user_user_permissions_user_id_f651c0ea_fk_webapp_user_id FOREIGN KEY (user_id) REFERENCES webapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webapp_usuariotram_usuario_id_e566aa50_fk_webapp_solicitante_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_usuariotramite
    ADD CONSTRAINT webapp_usuariotram_usuario_id_e566aa50_fk_webapp_solicitante_id FOREIGN KEY (usuario_id) REFERENCES webapp_solicitante(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webapp_usuariotramite_oficina_id_3414af91_fk_webapp_oficina_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_usuariotramite
    ADD CONSTRAINT webapp_usuariotramite_oficina_id_3414af91_fk_webapp_oficina_id FOREIGN KEY (oficina_id) REFERENCES webapp_oficina(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: webapp_usuariotramite_tramite_id_cedd3caf_fk_webapp_tramite_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webapp_usuariotramite
    ADD CONSTRAINT webapp_usuariotramite_tramite_id_cedd3caf_fk_webapp_tramite_id FOREIGN KEY (tramite_id) REFERENCES webapp_tramite(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

