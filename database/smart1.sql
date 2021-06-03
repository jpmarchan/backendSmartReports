--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6
-- Dumped by pg_dump version 12.6

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
    fkidmedic integer
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
\.


--
-- Data for Name: keyboars_and_meanings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.keyboars_and_meanings (id, keyword, meanings, fountain) FROM stdin;
\.


--
-- Data for Name: reports_generate; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reports_generate (id, detail, fkidrepororiginal, status) FROM stdin;
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
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, name, email, password, rol, status, lastname, especialidad, dni, sex, age, fkidmedic) FROM stdin;
31	Omar	omar@gmail.com	123456	1	t	cordero	\N	765533212	t	0	\N
3	gaaaaa	haro11l@gmail.com	123456	2	t	Nahuina Nahuina	Odontologo	123123	f	20	\N
20	Harol	haro1111l@gmail.com	123456	1	t	Nahuina Nahuina	\N	7654321	t	19	\N
2	asdasdasd	jp@gmail.com	123456	1	t	Marchan Zamora	\N	123123	f	20	3
21	Harol	haro1111l@gmail.com	123456	1	t	Nahuina Nahuina	\N	7654321	t	19	\N
22	Harol	haro1111l1@gmail.com	123456	1	t	Nahuina Nahuina	\N	7654321	t	19	\N
23	Harol	haro1111l1@gmail.com	123456	1	t	Nahuina Nahuina	\N	7654321	t	19	\N
24	yenner ra	jp1@gmail.com	123456	1	t	marchan zamora	\N	7654321	t	0	\N
28	Harol	haro1111l1@gmail.com	123456	1	t	Nahuina Nahuina	\N	7654321	t	19	\N
29	Alejandro	alejandro@gmail.com	123456	1	t	Ramirez	\N	7654321	t	0	\N
30	emilce	emilce@gmail.com	123456	1	f	Marchan	\N	7654321	t	0	\N
\.


--
-- Name: hospital_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hospital_id_seq', 1, false);


--
-- Name: keyboars_and_meanings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.keyboars_and_meanings_id_seq', 1, false);


--
-- Name: reports_generate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reports_generate_id_seq', 1, false);


--
-- Name: reports_original_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reports_original_id_seq', 9, true);


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
-- PostgreSQL database dump complete
--

