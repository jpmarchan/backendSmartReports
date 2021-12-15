--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9
-- Dumped by pg_dump version 12.9

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
-- Name: dietas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dietas (
    id integer NOT NULL,
    name character varying,
    description character varying,
    desayuno character varying,
    almuerzo character varying,
    cena character varying,
    ingredientesdesayuno character varying,
    ingredientesalmuerzo character varying,
    ingredientescena character varying
);


--
-- Name: dietas_by_patients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dietas_by_patients (
);


--
-- Name: dietasforpatient; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dietasforpatient (
    fkireporte integer,
    status integer,
    fkiddieta integer,
    fechafinal character varying,
    id integer NOT NULL,
    nivel character varying
);


--
-- Name: dietasforpatient_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dietasforpatient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dietasforpatient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dietasforpatient_id_seq OWNED BY public.dietasforpatient.id;


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
    idubigeodepart integer,
    aneminum integer,
    departament character varying
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
-- Name: dietasforpatient id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dietasforpatient ALTER COLUMN id SET DEFAULT nextval('public.dietasforpatient_id_seq'::regclass);


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
-- Data for Name: dietas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dietas (id, name, description, desayuno, almuerzo, cena, ingredientesdesayuno, ingredientesalmuerzo, ingredientescena) FROM stdin;
3	Dieta 3	Para anemia grave	Lava y seca una de las manzanas y pásala por el rallador grueso. Luego, añade unas gotas de limón para evitar que la manzana se oscurezca. A continuación, haz un corte longitudinal a la vaina de vainilla y saca las semillas de su interior con cuidado. Calienta una sartén a fuego lento con dos cucharadas de azúcar. Agrega una cucharada de aceite de girasol, una pizca de canela y las semillas de la vainilla. Cuando el azúcar empiece a caramelizar, agrega la manzana rallada y rehoga todo unos 4 o 5 minutos.\r\n\r\nPela y trocea las tres manzanas restantes y añádelas a la sartén junto con la ralladura de de limón. Rehoga un par de minutos más, apaga el fuego y reserva. Precalienta el horno a 180º en un bol grande, mezcla la harina de maíz, el resto del aceite de girasol, los copos de avena o de maíz hasta conseguir una mezcla homogénea. Coloca la manzana rehogada que has reservado en un recipiente apto para horno y reparte por encima la masa seca. Para terminar, hornea unos 30 o 40 minutos a 180º, hasta que la superficie presente un aspecto dorado.\r\n\r\nSi lo que buscas son ideas de cenas, no te pierdas este eBook con 100 cenas saludables donde encontrarás 100 recetas clasificadas por familiares, rápidas o especiales para perder peso. Es súper completo (tiene más de 225 páginas) y solo cuesta 7,95€.	Lava las batatas, elimina los extremos, y córtalas en rodajas.\r\nColócalas sobre una bandeja con papel para hornear y rocíalas con aceite de oliva.\r\nEn un recipiente, usando un tenedor, bate los huevos para el empanado. En un segundo recipiente más grande, mezcla las hojuelas de maíz trituradas con queso parmesano, sal y pimienta.\r\nCorta las pechugas de pollo en cortes más delgados (no tienes que golpearlas). Pasa cada trozo de pollo por el huevo y luego cúbrelo en la mezcla preparada para empanizar.\r\nColoca las rebanadas de pollo sobre una bandeja con papel para hornear. Si hay espacio, coloca las batatas al lado del pollo, si no caben, colócalas en una segunda bandeja para hornear (puedes hornearlo todo junto o por separado).\r\nHornea las batatas y el pollo por aproximadamente 25 minutos a 180 grados. Las batatas deben estar suaves y las rebanadas de pollo deben estar horneadas y doradas.\r\nSirve la comida idealmente con lechuga, tomate u otro vegetal favorito	Licúa todos los ingredientes para la sopa hasta que este suave.\r\nLa sopa está terminada y la puedes refrigerar por ahora.\r\nEn una olla pequeña, derrite una cucharadita de aceite de coco y añade los camarones descongelados.\r\nAñade especias y sal y mezcla hasta que todo el líquido del camarón se haya evaporado.\r\nAl final, añade el camarón cocido a la sopa preparada y sirve.\r\nTambién puedes añadir una cucharada de yogur natural a la sopa para decorar y darle un sabor más suave.	4 manzanas ecológicas\r\n150 g de harina de maíz eco\r\n100 g de aceite de girasol\r\n125 g de azúcar integral de caña\r\n40 g de copos de avena\r\n40 g de uvas pasas\r\nRalladura de un limón ecológico\r\n1 vaina de vainilla\r\nCanela en polvo\r\nSal marina	800g de pechugas de pollo\r\n1kg de batatas\r\n100 g de hojuelas de maíz (o hojuelas de salvado)\r\n4 cdas de queso parmesano rallado\r\n2 huevos\r\n1 cda de aceite de oliva\r\n1/2 cdta de sal\r\n1/2 cdta de pimienta negra molida	1 taza de caldo de vegetales\r\n1/2 taza de leche (coco, almendra, vegetal,...)\r\n1 aguacate\r\n1 calabacín\r\njugo de 1 lima\r\nuna pizca de pimienta negra molida\r\nun poco de perejil\r\nPara los camarones:\r\n200g de camarones\r\n1 cdta de aceite de coco (recomiendo este)\r\n1 cdta de paprika\r\nuna pizca de chile picante en polvo\r\nuna pizca de sal marina\r\nuna pizca de ajo en polvo
1	Dieta 1 	Para anemia Leve	Lo primero, introduce todos los ingredientes en la batidora. Bate todo hasta obtener una textura homogénea y ya estará listo para consumir.\r\n\r\nSi te gustan este tipo de zumos naturales, también tienes la opción de hacerte un smoothie bowl de frutos rojos.	Sazona el arroz al gusto y cocínalo con el doble de cantidad de agua hasta que esté suave. Con la carne molida, harina, ajo triturado, especias y sal, forma una mezcla homogénea y forma pequeñas bolas con ella. Coloca las albóndigas sobre una bandeja con papel para hornear. Hornea por 15 minutos a 190 grados hasta que estén cocidas en el medio. En una olla grande o sartén profunda , cocina las cebollas finamente picadas en aceite caliente. Añade el puré de tomate, los tomates pelados, sal, especias, vinagre balsámico y ajo triturado. Deja que la salsa hierva y luego añade las albóndigas horneadas y añade queso mozzarella rallado. Cubre la sartén y deja que las albóndigas hiervan en la salsa por otros 5 minutos. Sirve las albóndigas con la salsa de tomate y arroz cocido.	Coloca la leche en una olla y llévala a hervor.\r\nAñade el bulgur enjuagado y las semillas de chía a la leche hirviendo, y cocina la gacha revolviendo ocasionalmente hasta que el bulgur esté completamente suave (aproximadamente 15-20 minutos).\r\nEl tiempo de cocción podrá variar dependiendo del tamaño del grano.\r\nCuando la gacha haya espesado, el bulgur este suave y las semillas de chía hayan obtenido una consistencia gelatinosa, remueve la olla del fuego y añade la miel y los arándanos a la gacha.\r\nRecomiendo servir el bulgur mientras está caliente.	2 naranjas\r\n1 trocito de raíz de cúrcuma (como una uña del dedo pulgar)\r\n3 cucharadas de bayas de goji\r\n1 trocito de jengibre (una uña del dedo pulgar, opcional)\r\nMedia taza de agua (más, si lo deseas más líquido)	500 g de carne de pavo (o ternera) molida\r\n3 cdas de cualquier harina\r\n1 diente de ajo\r\n1 cdta de mostaza\r\nsal, pimienta negra molida (al gusto)\r\npizca de comino molido\r\n50g de mozzarella rallada (con bajo contenido en grasas)\r\n300ml de puré de tomate\r\n1 lata (400g) de tomates pelados y triturados\r\n1 cebolla\r\norégano, sal, pimienta negra molida (al gusto)\r\n1-2 dientes de ajo\r\n250g de arroz\r\n1 cda de aceite\r\n2 cdtas de vinagre balsámico	800ml de leche de almendras/coco (o leche de vaca)\r\n1 taza de bulgur\r\n3 cdas de semillas de chía (recomiendo estas)\r\n3 cdas de miel\r\n150g de arándanos secos\r\nnueces (opcional) (recomiendo estas)
2	Dieta 2	Para anemia media	Lava y seca una de las manzanas y pásala por el rallador grueso. Luego, añade unas gotas de limón para evitar que la manzana se oscurezca. A continuación, haz un corte longitudinal a la vaina de vainilla y saca las semillas de su interior con cuidado. Calienta una sartén a fuego lento con dos cucharadas de azúcar. Agrega una cucharada de aceite de girasol, una pizca de canela y las semillas de la vainilla. Cuando el azúcar empiece a caramelizar, agrega la manzana rallada y rehoga todo unos 4 o 5 minutos.\r\n\r\nPela y trocea las tres manzanas restantes y añádelas a la sartén junto con la ralladura de de limón. Rehoga un par de minutos más, apaga el fuego y reserva. Precalienta el horno a 180º en un bol grande, mezcla la harina de maíz, el resto del aceite de girasol, los copos de avena o de maíz hasta conseguir una mezcla homogénea. Coloca la manzana rehogada que has reservado en un recipiente apto para horno y reparte por encima la masa seca. Para terminar, hornea unos 30 o 40 minutos a 180º, hasta que la superficie presente un aspecto dorado.\r\n\r\nSi lo que buscas son ideas de cenas, no te pierdas este eBook con 100 cenas saludables donde encontrarás 100 recetas clasificadas por familiares, rápidas o especiales para perder peso. Es súper completo (tiene más de 225 páginas) y solo cuesta 7,95€.	Lava las batatas, elimina los extremos, y córtalas en rodajas.\r\nColócalas sobre una bandeja con papel para hornear y rocíalas con aceite de oliva.\r\nEn un recipiente, usando un tenedor, bate los huevos para el empanado. En un segundo recipiente más grande, mezcla las hojuelas de maíz trituradas con queso parmesano, sal y pimienta.\r\nCorta las pechugas de pollo en cortes más delgados (no tienes que golpearlas). Pasa cada trozo de pollo por el huevo y luego cúbrelo en la mezcla preparada para empanizar.\r\nColoca las rebanadas de pollo sobre una bandeja con papel para hornear. Si hay espacio, coloca las batatas al lado del pollo, si no caben, colócalas en una segunda bandeja para hornear (puedes hornearlo todo junto o por separado).\r\nHornea las batatas y el pollo por aproximadamente 25 minutos a 180 grados. Las batatas deben estar suaves y las rebanadas de pollo deben estar horneadas y doradas.\r\nSirve la comida idealmente con lechuga, tomate u otro vegetal favorito	Licúa todos los ingredientes para la sopa hasta que este suave.\r\nLa sopa está terminada y la puedes refrigerar por ahora.\r\nEn una olla pequeña, derrite una cucharadita de aceite de coco y añade los camarones descongelados.\r\nAñade especias y sal y mezcla hasta que todo el líquido del camarón se haya evaporado.\r\nAl final, añade el camarón cocido a la sopa preparada y sirve.\r\nTambién puedes añadir una cucharada de yogur natural a la sopa para decorar y darle un sabor más suave.	4 manzanas ecológicas\r\n150 g de harina de maíz eco\r\n100 g de aceite de girasol\r\n125 g de azúcar integral de caña\r\n40 g de copos de avena\r\n40 g de uvas pasas\r\nRalladura de un limón ecológico\r\n1 vaina de vainilla\r\nCanela en polvo\r\nSal marina	800g de pechugas de pollo\r\n1kg de batatas\r\n100 g de hojuelas de maíz (o hojuelas de salvado)\r\n4 cdas de queso parmesano rallado\r\n2 huevos\r\n1 cda de aceite de oliva\r\n1/2 cdta de sal\r\n1/2 cdta de pimienta negra molida	1 taza de caldo de vegetales\r\n1/2 taza de leche (coco, almendra, vegetal,...)\r\n1 aguacate\r\n1 calabacín\r\njugo de 1 lima\r\nuna pizca de pimienta negra molida\r\nun poco de perejil\r\nPara los camarones:\r\n200g de camarones\r\n1 cdta de aceite de coco (recomiendo este)\r\n1 cdta de paprika\r\nuna pizca de chile picante en polvo\r\nuna pizca de sal marina\r\nuna pizca de ajo en polvo
\.


--
-- Data for Name: dietas_by_patients; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dietas_by_patients  FROM stdin;
\.


--
-- Data for Name: dietasforpatient; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dietasforpatient (fkireporte, status, fkiddieta, fechafinal, id, nivel) FROM stdin;
99	\N	3	31/12/2021	6	\N
100	\N	3	31/1/2022	7	\N
101	\N	3	29/12/2021	8	\N
102	\N	1	30/12/2021	9	\N
103	\N	3	31/1/2022	10	\N
107	\N	3	30/11/2021	11	\N
108	\N	1	31/12/2021	12	\N
109	\N	2	30/12/2021	13	\N
110	\N	3	30/11/2021	14	\N
111	\N	3	30/11/2021	15	\N
113	\N	2	27/11/2021	16	\N
\.


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
\.


--
-- Data for Name: reports_generate; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reports_generate (id, detail, fkidrepororiginal, status) FROM stdin;
78	hola	100	t
79		101	t
80	sadasdasda alasdlklasdasdasdasd	102	t
81	hola assssdsdsdd	103	t
82	plplplplpp	104	t
83	plplplplplp	105	t
84	plplplp	106	t
85	lklkl	107	t
86	kajdalksjdlkjasldk 13.5	108	t
87	kjguiytfiuyguh	109	t
88	,jkljk	110	t
89	asdasdasd	111	t
90	uytuytuy	112	t
91	kjhkjhj	113	t
\.


--
-- Data for Name: reports_original; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reports_original (id, fecha, fkidmedico, fkidpaciente, detail, status) FROM stdin;
100	1637234029	3	32	hola	f
101	1637293697	3	32		t
102	1637296959	3	32	sadasdasda alasdlklasdasdasdasd	f
103	1637297901	3	33	hola assssdsdsdd	f
104	1637299471	3	32	plplplplpp	t
107	1637299992	3	32	lklkl	f
108	1637347348	3	32	kajdalksjdlkjasldk 13.5	f
106	1637299738	3	32	plplplp	f
109	1637347607	3	32	kjguiytfiuyguh	f
105	1637299593	3	32	plplplplplp	f
110	1637348357	3	32	,jkljk	t
111	1637348556	3	32	asdasdasd	f
112	1637348966	3	32	uytuytuy	t
113	1637349247	3	32	kjhkjhj	t
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

COPY public.users (id, name, email, password, rol, status, lastname, especialidad, dni, sex, age, fkidmedic, phone, fkidhospital, idsreports, datebirth, idubigeodepart, aneminum, departament) FROM stdin;
30	emilce	emilce@gmail.com	123456	1	t	Marchan	\N	7654321	t	0	\N	\N	\N	\N	\N	\N	\N	\N
29	Alejandro	alejandro@gmail.com	123456	1	f	Ramirez	\N	7654321	t	0	\N	\N	\N	\N	\N	\N	\N	\N
3	Harold	harold@gmail.com	123456	2	t	Nahuina Nahuina	Medicina general	123123	f	20	\N	\N	1	\N	\N	\N	\N	\N
31	Omar	omar@gmail.com	123456	1	t	cordero	\N	765533212	t	0	\N	\N	\N	\N	\N	\N	\N	\N
32	Yenner Jean Pierre	jp@gmail.com	123456	1	t	Marchan Zamora	\N	70870171	t	21	3	\N	\N	\N	\N	\N	13	Lima
33	harol	harol@gmail.com	1234567	1	t	Nahuina Nahuina	\N	48277473	t	23	3	\N	\N	\N	\N	\N	13	Lima
\.


--
-- Name: dietasforpatient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dietasforpatient_id_seq', 16, true);


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

SELECT pg_catalog.setval('public.reports_generate_id_seq', 91, true);


--
-- Name: reports_original_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reports_original_id_seq', 113, true);


--
-- Name: ubigeo_peru_departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ubigeo_peru_departments_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 33, true);


--
-- Name: dietas dietas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dietas
    ADD CONSTRAINT dietas_pkey PRIMARY KEY (id);


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

