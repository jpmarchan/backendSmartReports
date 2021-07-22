--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

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
    idsreports json
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
2	asdasd	La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe	
3	asdasd	La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe	
\.


--
-- Data for Name: metrics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.metrics (id, count, fkidreport, fkidkeyboars, fkidhospital, idsreports) FROM stdin;
2	9	32	1	1	{"id":[32,38,39,40]}
\.


--
-- Data for Name: reports_generate; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reports_generate (id, detail, fkidrepororiginal, status) FROM stdin;
1	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	10	t
2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis "La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe", elocon nasal, nariclear pediatrico, airon.	23	t
3	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis "La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe", elocon nasal, nariclear pediatrico, airon.	25	t
4	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis "La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe", elocon nasal, nariclear pediatrico, airon.	26	t
5	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis "La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe", elocon nasal, nariclear pediatrico, airon.	27	t
6	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis "La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe", elocon nasal, nariclear pediatrico, airon.	28	t
7	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis "La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe", elocon nasal, nariclear pediatrico, airon.	29	t
8	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis "La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe", elocon nasal, nariclear pediatrico, airon.	30	t
9	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis "La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe", elocon nasal, nariclear pediatrico, airon.	31	t
10	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis "La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe", elocon nasal, nariclear pediatrico, airon.	32	t
11	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis "La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe", elocon nasal, nariclear pediatrico, airon.	33	t
12	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis "La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe", elocon nasal, nariclear pediatrico, airon.	34	t
13	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis "La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe", elocon nasal, nariclear pediatrico, airon.	35	t
14	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis "La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe", elocon nasal, nariclear pediatrico, airon.	36	t
15	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis "La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe", elocon nasal, nariclear pediatrico, airon.	37	t
16	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis "La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe", elocon nasal, nariclear pediatrico, airon.	38	t
17	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis "La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe", elocon nasal, nariclear pediatrico, airon.	39	t
18	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis "La faringitis es causada por hinchazón de la parte posterior de la garganta (faringe), entre las amígdalas y la laringe", elocon nasal, nariclear pediatrico, airon.	40	t
\.


--
-- Data for Name: reports_original; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reports_original (id, fecha, fkidmedico, fkidpaciente, detail, status) FROM stdin;
2	1622271845	3	2	 nuevo registro ga	t
3	1622271845	3	2	 nuevo registro ga	t
4	1622271845	3	2	 nuevo registro ga	t
5	1622271845	3	2	 nuevo registro ga	t
6	1622271845	3	2	 nuevo registro ga	t
7	1622271845	3	2	 nuevo registro ga	t
8	1622271845	3	2	 nuevo registro ga	t
9	1622446841	3	2	 nuevo registro ga	t
1	1622271845	3	2	nuevo reporte 	t
10	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
11	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
12	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
13	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
14	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
15	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
16	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
17	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
18	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
19	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
20	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
21	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
22	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
23	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
24	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
25	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
26	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
27	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
28	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
29	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
30	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
31	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
32	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
33	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
34	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
35	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
36	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
37	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
38	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
39	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
40	1626758	3	2	1Hago constar que la paciente Maria ... Fue vista en consulta el dia de hoy por presentar, Hipertrofia adenotonsilar y Rinitis Alergica. Se le indico Rx. Rinofaringe. Estudio Audiologico tratamiento medico y control al mes, tratamiento fedyclar, faringitis, elocon nasal, nariclear pediatrico, airon.	t
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, name, email, password, rol, status, lastname, especialidad, dni, sex, age, fkidmedic, phone, fkidhospital, idsreports) FROM stdin;
31	Omar	omar@gmail.com	123456	1	t	cordero	\N	765533212	t	0	\N	\N	\N	\N
21	Harol	haro1111l@gmail.com	123456	1	t	Nahuina Nahuina	\N	7654321	t	19	\N	\N	\N	\N
22	Harol	haro1111l1@gmail.com	123456	1	t	Nahuina Nahuina	\N	7654321	t	19	\N	\N	\N	\N
23	Harol	haro1111l1@gmail.com	123456	1	t	Nahuina Nahuina	\N	7654321	t	19	\N	\N	\N	\N
24	yenner ra	jp1@gmail.com	123456	1	t	marchan zamora	\N	7654321	t	0	\N	\N	\N	\N
28	Harol	haro1111l1@gmail.com	123456	1	t	Nahuina Nahuina	\N	7654321	t	19	\N	\N	\N	\N
29	Alejandro	alejandro@gmail.com	123456	1	t	Ramirez	\N	7654321	t	0	\N	\N	\N	\N
30	emilce	emilce@gmail.com	123456	1	f	Marchan	\N	7654321	t	0	\N	\N	\N	\N
20	Harol	haro1111l@gmail.com	123456	1	t	Nahuina Nahuina	\N	7654321	t	19	\N	\N	1	\N
2	asdasdasd	jp@gmail.com	123456	1	t	Marchan Zamora	\N	123123	f	20	3	\N	1	\N
3	Harol	harol@gmail.com	123456	2	t	Nahuina Nahuina	Odontologo	123123	f	20	\N	\N	1	\N
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

SELECT pg_catalog.setval('public.metrics_id_seq', 2, true);


--
-- Name: reports_generate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reports_generate_id_seq', 18, true);


--
-- Name: reports_original_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reports_original_id_seq', 40, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 31, true);


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

