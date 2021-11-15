--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8
-- Dumped by pg_dump version 12.8

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
-- Name: hospital; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hospital (
    id integer NOT NULL,
    name character varying(40),
    direction character varying(40),
    capacity integer
);


--
-- Name: hospital_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hospital_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hospital_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hospital_id_seq OWNED BY public.hospital.id;


--
-- Name: keyboars_and_meanings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.keyboars_and_meanings (
    id integer NOT NULL,
    keyword character varying(50),
    meanings character varying(700),
    fountain character varying(700)
);


--
-- Name: keyboars_and_meanings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.keyboars_and_meanings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: keyboars_and_meanings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.keyboars_and_meanings_id_seq OWNED BY public.keyboars_and_meanings.id;


--
-- Name: metrics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.metrics (
    id integer NOT NULL,
    count integer,
    fkidreport integer,
    fkidkeyboars integer,
    fkidhospital integer,
    idsreports json
);


--
-- Name: metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.metrics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.metrics_id_seq OWNED BY public.metrics.id;


--
-- Name: reports_generate; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reports_generate (
    id integer NOT NULL,
    detail character varying(600),
    fkidrepororiginal integer,
    status boolean
);


--
-- Name: reports_generate_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reports_generate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reports_generate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reports_generate_id_seq OWNED BY public.reports_generate.id;


--
-- Name: reports_original; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reports_original (
    id integer NOT NULL,
    fecha character varying(50),
    fkidmedico integer,
    fkidpaciente integer,
    detail character varying(600),
    status boolean
);


--
-- Name: reports_original_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reports_original_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reports_original_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reports_original_id_seq OWNED BY public.reports_original.id;


--
-- Name: ubigeo_peru_departments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ubigeo_peru_departments (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: ubigeo_peru_departments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ubigeo_peru_departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ubigeo_peru_departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ubigeo_peru_departments_id_seq OWNED BY public.ubigeo_peru_departments.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(40),
    email text,
    password character varying(300),
    rol integer,
    status boolean,
    lastname character varying(50),
    especialidad character varying(50),
    dni integer,
    sex boolean,
    age integer,
    fkidmedic integer,
    phone integer,
    fkidhospital integer,
    idsreports json,
    datebirth date,
    idubigeodepart integer
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: hospital id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hospital ALTER COLUMN id SET DEFAULT nextval('public.hospital_id_seq'::regclass);


--
-- Name: keyboars_and_meanings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.keyboars_and_meanings ALTER COLUMN id SET DEFAULT nextval('public.keyboars_and_meanings_id_seq'::regclass);


--
-- Name: metrics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metrics ALTER COLUMN id SET DEFAULT nextval('public.metrics_id_seq'::regclass);


--
-- Name: reports_generate id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reports_generate ALTER COLUMN id SET DEFAULT nextval('public.reports_generate_id_seq'::regclass);


--
-- Name: reports_original id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reports_original ALTER COLUMN id SET DEFAULT nextval('public.reports_original_id_seq'::regclass);


--
-- Name: ubigeo_peru_departments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ubigeo_peru_departments ALTER COLUMN id SET DEFAULT nextval('public.ubigeo_peru_departments_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: hospital; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.hospital (id, name, direction, capacity) FROM stdin;
1	Posta la Venta Baja	Panamericana sur Kilometro 420	500
\.


--
-- Data for Name: keyboars_and_meanings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.keyboars_and_meanings (id, keyword, meanings, fountain) FROM stdin;
1	faringitis	La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe	
\.


--
-- Data for Name: metrics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.metrics (id, count, fkidreport, fkidkeyboars, fkidhospital, idsreports) FROM stdin;
3	2	46	1	1	{"id":[46,47]}
\.


--
-- Data for Name: reports_generate; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reports_generate (id, detail, fkidrepororiginal, status) FROM stdin;
22	reporte de faringitis\n	44	t
23	faringitis\n	45	t
24	faringitis "La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe"	46	t
25	faringitis "La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe"	47	t
26	sdfsdfsdfsdfsdfdasdasdasdasdasfsasddfsdf	48	t
\.


--
-- Data for Name: reports_original; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reports_original (id, fecha, fkidmedico, fkidpaciente, detail, status) FROM stdin;
46	1632989434	3	32	faringitis	f
47	1632991301	3	32	faringitis	f
48	1636611534	3	32	sdfsdfsdfsdfsdfdasdasdasdasdasfsasddfsdf	t
44	1632989191	3	32	reporte de faringitis\n	f
45	1632989346	3	32	faringitis\n	f
\.


--
-- Data for Name: ubigeo_peru_departments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ubigeo_peru_departments (id, name) FROM stdin;
1	Amazonas
2	Áncash
3	Apurímac
4	Arequipa
5	Ayacucho
6	Cajamarca
7	Callao
8	Cusco
9	Huancavelica
10	Huánuco
11	Ica
12	Junín
13	La Libertad
14	Lambayeque
15	Lima
16	Loreto
17	Madre de Dios
18	Moquegua
19	Pasco
20	Piura
21	Puno
22	San Martín
23	Tacna
24	Tumbes
25	Ucayali
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, name, email, password, rol, status, lastname, especialidad, dni, sex, age, fkidmedic, phone, fkidhospital, idsreports, datebirth, idubigeodepart) FROM stdin;
30	emilce	emilce@gmail.com	123456	1	t	Marchan	\N	7654321	t	0	\N	\N	\N	\N	\N	\N
29	Alejandro	alejandro@gmail.com	123456	1	f	Ramirez	\N	7654321	t	0	\N	\N	\N	\N	\N	\N
3	Harold	harold@gmail.com	123456	2	t	Nahuina Nahuina	Medicina general	123123	f	20	\N	\N	1	\N	\N	\N
32	Yenner Jean Pierre	jp@gmail.com	123456	1	t	Marchan Zamora	\N	70870171	t	21	3	\N	\N	\N	\N	\N
31	Omar	omar@gmail.com	123456	1	t	cordero	\N	765533212	t	0	\N	\N	\N	\N	\N	\N
\.


--
-- Name: hospital_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hospital_id_seq', 1, true);


--
-- Name: keyboars_and_meanings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.keyboars_and_meanings_id_seq', 3, true);


--
-- Name: metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.metrics_id_seq', 3, true);


--
-- Name: reports_generate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reports_generate_id_seq', 26, true);


--
-- Name: reports_original_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reports_original_id_seq', 48, true);


--
-- Name: ubigeo_peru_departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ubigeo_peru_departments_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 32, true);


--
-- Name: hospital hospital_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hospital
    ADD CONSTRAINT hospital_pkey PRIMARY KEY (id);


--
-- Name: keyboars_and_meanings keyboars_and_meanings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.keyboars_and_meanings
    ADD CONSTRAINT keyboars_and_meanings_pkey PRIMARY KEY (id);


--
-- Name: metrics metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT metrics_pkey PRIMARY KEY (id);


--
-- Name: reports_generate reports_generate_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reports_generate
    ADD CONSTRAINT reports_generate_pkey PRIMARY KEY (id);


--
-- Name: reports_original reports_original_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reports_original
    ADD CONSTRAINT reports_original_pkey PRIMARY KEY (id);


--
-- Name: ubigeo_peru_departments ubigeo_peru_departments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ubigeo_peru_departments
    ADD CONSTRAINT ubigeo_peru_departments_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: metrics fkidhospital; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT fkidhospital FOREIGN KEY (fkidhospital) REFERENCES public.hospital(id);


--
-- Name: metrics fkidkeyboars; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT fkidkeyboars FOREIGN KEY (fkidkeyboars) REFERENCES public.keyboars_and_meanings(id);


--
-- Name: reports_original fkidmedico; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reports_original
    ADD CONSTRAINT fkidmedico FOREIGN KEY (fkidmedico) REFERENCES public.users(id);


--
-- Name: reports_original fkidpaciente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reports_original
    ADD CONSTRAINT fkidpaciente FOREIGN KEY (fkidpaciente) REFERENCES public.users(id);


--
-- Name: reports_generate fkidrepororiginal; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reports_generate
    ADD CONSTRAINT fkidrepororiginal FOREIGN KEY (fkidrepororiginal) REFERENCES public.reports_original(id);


--
-- Name: metrics fkidreport; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT fkidreport FOREIGN KEY (fkidreport) REFERENCES public.reports_original(id);


--
-- PostgreSQL database dump complete
--

