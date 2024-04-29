
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter integer,
    description text,
    is_spherical boolean,
    is_irregular boolean,
    distance_from_earth integer,
    number numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass integer,
    diameter integer,
    has_rings boolean,
    is_made_of_cheese boolean,
    planet_id integer,
    description text,
    number numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: other; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.other (
    other_id integer NOT NULL,
    name character varying(30) NOT NULL,
    first integer,
    second integer,
    description text,
    is_true boolean,
    is_false boolean,
    number numeric
);


ALTER TABLE public.other OWNER TO freecodecamp;

--
-- Name: other_other_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.other_other_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_other_id_seq OWNER TO freecodecamp;

--
-- Name: other_other_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.other_other_id_seq OWNED BY public.other.other_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    description text,
    is_livable boolean,
    is_terrestrial boolean,
    star_id integer,
    mass integer,
    number numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    diameter integer,
    description text,
    is_hot boolean,
    is_in_a_galaxy boolean,
    galaxy_id integer,
    number numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: other other_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other ALTER COLUMN other_id SET DEFAULT nextval('public.other_other_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 9943, 'est culpa voluptate est irure', true, true, 18655, NULL);
INSERT INTO public.galaxy VALUES (2, 'andromeda', 3993, 'cupidatat non et esse enim', false, false, 82063, NULL);
INSERT INTO public.galaxy VALUES (3, 'cygnus a', 6472, 'ullamco irure elit quis Lorem', true, true, 97303, NULL);
INSERT INTO public.galaxy VALUES (4, 'maffei', 6315, 'dolore culpa nulla veniam incididunt', true, false, 84631, NULL);
INSERT INTO public.galaxy VALUES (5, 'virgo a', 9582, 'dolor id officia anim sunt', false, false, 96262, NULL);
INSERT INTO public.galaxy VALUES (6, 'canis major', 4289, 'sint culpa dolor dolore esse', true, false, 30219, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Xinware', 6601, 74160, true, true, 31, 'commodo exercitation enim sit esse', NULL);
INSERT INTO public.moon VALUES (2, 'Virxo', 4868, 44385, true, true, 32, 'ad est Lorem aute enim', NULL);
INSERT INTO public.moon VALUES (3, 'Phuel', 5111, 39706, true, false, 32, 'enim eiusmod deserunt amet anim', NULL);
INSERT INTO public.moon VALUES (4, 'Flotonic', 6923, 80553, false, false, 32, 'non qui et anim reprehenderit', NULL);
INSERT INTO public.moon VALUES (5, 'Xumonk', 8947, 69233, false, false, 33, 'non cillum ut consequat est', NULL);
INSERT INTO public.moon VALUES (6, 'Bicol', 4589, 36621, true, false, 34, 'est laboris magna ad velit', NULL);
INSERT INTO public.moon VALUES (7, 'Pigzart', 6032, 12095, true, true, 34, 'sunt proident id ex enim', NULL);
INSERT INTO public.moon VALUES (8, 'Prosure', 3174, 45006, true, true, 35, 'veniam magna id culpa cillum', NULL);
INSERT INTO public.moon VALUES (9, 'Proxsoft', 9890, 91696, false, true, 35, 'ut qui culpa et laborum', NULL);
INSERT INTO public.moon VALUES (10, 'Emoltra', 2142, 92452, true, false, 35, 'esse culpa adipisicing quis dolore', NULL);
INSERT INTO public.moon VALUES (11, 'Zenco', 1661, 67570, false, false, 35, 'labore aliqua labore laborum cupidatat', NULL);
INSERT INTO public.moon VALUES (12, 'Sonique', 5577, 26189, true, true, 36, 'eu velit tempor pariatur labore', NULL);
INSERT INTO public.moon VALUES (13, 'Rodeomad', 8630, 46664, false, false, 37, 'dolor eu aliqua nostrud aliquip', NULL);
INSERT INTO public.moon VALUES (14, 'Buzzopia', 4588, 93941, false, false, 37, 'labore eu incididunt nisi sint', NULL);
INSERT INTO public.moon VALUES (15, 'Intrawear', 7571, 32920, true, true, 38, 'amet exercitation cillum Lorem nisi', NULL);
INSERT INTO public.moon VALUES (16, 'Musaphics', 8360, 97057, true, false, 38, 'nulla ex duis tempor consequat', NULL);
INSERT INTO public.moon VALUES (17, 'Sportan', 2315, 35927, false, false, 38, 'ex sunt irure voluptate consectetur', NULL);
INSERT INTO public.moon VALUES (18, 'Bostonic', 6368, 69486, true, false, 38, 'dolor in consectetur ullamco laborum', NULL);
INSERT INTO public.moon VALUES (19, 'Aquasseur', 5979, 40278, false, false, 39, 'elit deserunt exercitation amet amet', NULL);
INSERT INTO public.moon VALUES (20, 'Xeronk', 8857, 54102, true, false, 39, 'culpa adipisicing nostrud minim ut', NULL);


--
-- Data for Name: other; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.other VALUES (1, 'asd1', 1, 2, 'desc', true, false, 12345);
INSERT INTO public.other VALUES (2, 'asd2', 1, 2, 'desc', true, false, 12345);
INSERT INTO public.other VALUES (3, 'asd3', 1, 2, 'desc', true, false, 12345);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (30, 'Maximind', 41621, 'sint fugiat commodo nulla officia', false, false, 5, 6138, NULL);
INSERT INTO public.planet VALUES (31, 'Zentime', 76365, 'ullamco id id proident ea', false, true, 9, 3667, NULL);
INSERT INTO public.planet VALUES (32, 'Emergent', 48212, 'minim consequat labore Lorem adipisicing', false, false, 9, 7111, NULL);
INSERT INTO public.planet VALUES (33, 'Hawkster', 23499, 'eiusmod voluptate velit esse dolore', false, false, 3, 8164, NULL);
INSERT INTO public.planet VALUES (34, 'Musaphics', 25351, 'non cillum aute laboris eu', false, true, 3, 9301, NULL);
INSERT INTO public.planet VALUES (35, 'Zilch', 10204, 'tempor eu pariatur eu sit', true, true, 5, 6969, NULL);
INSERT INTO public.planet VALUES (36, 'Twiggery', 11972, 'exercitation officia culpa veniam duis', true, false, 4, 5985, NULL);
INSERT INTO public.planet VALUES (37, 'Lexicondo', 49122, 'consectetur velit ipsum sunt laborum', false, true, 6, 2371, NULL);
INSERT INTO public.planet VALUES (38, 'Digigene', 20622, 'enim ut adipisicing veniam ut', false, true, 8, 5723, NULL);
INSERT INTO public.planet VALUES (39, 'Exospace', 54294, 'amet proident eu labore dolor', false, false, 10, 2297, NULL);
INSERT INTO public.planet VALUES (40, 'Silodyne', 32770, 'non reprehenderit commodo in fugiat', false, true, 9, 1192, NULL);
INSERT INTO public.planet VALUES (41, 'Exosis', 11687, 'dolore eu in proident pariatur', true, false, 10, 4191, NULL);
INSERT INTO public.planet VALUES (42, 'Unia', 19033, 'eu ut irure deserunt aliquip', true, false, 7, 3972, NULL);
INSERT INTO public.planet VALUES (43, 'Centice', 10252, 'ipsum laboris eiusmod adipisicing sit', true, true, 9, 5503, NULL);
INSERT INTO public.planet VALUES (44, 'Xurban', 14599, 'labore Lorem Lorem magna pariatur', true, false, 10, 9120, NULL);
INSERT INTO public.planet VALUES (45, 'Boilicon', 25626, 'occaecat ullamco nulla reprehenderit reprehenderit', true, true, 3, 7734, NULL);
INSERT INTO public.planet VALUES (46, 'Verton', 19837, 'labore aliquip ipsum cupidatat irure', true, true, 11, 5019, NULL);
INSERT INTO public.planet VALUES (47, 'Manglo', 41783, 'cupidatat consectetur nostrud incididunt excepteur', true, true, 9, 3494, NULL);
INSERT INTO public.planet VALUES (48, 'Harmoney', 95966, 'labore veniam adipisicing magna ea', true, true, 6, 4552, NULL);
INSERT INTO public.planet VALUES (49, 'Corecom', 49195, 'in fugiat adipisicing adipisicing id', true, true, 6, 3926, NULL);
INSERT INTO public.planet VALUES (50, 'Deviltoe', 60237, 'enim ullamco duis ipsum voluptate', true, false, 3, 3679, NULL);
INSERT INTO public.planet VALUES (51, 'Zizzle', 81880, 'aliquip sint nulla esse ullamco', false, true, 3, 8245, NULL);
INSERT INTO public.planet VALUES (52, 'Orbalix', 87443, 'nulla excepteur laborum ea minim', false, true, 4, 6608, NULL);
INSERT INTO public.planet VALUES (53, 'Exovent', 11513, 'aliquip consectetur dolor ipsum reprehenderit', false, true, 7, 6619, NULL);
INSERT INTO public.planet VALUES (54, 'Dragbot', 62338, 'nulla enim ex eiusmod mollit', true, true, 11, 7919, NULL);
INSERT INTO public.planet VALUES (55, 'Polarax', 63215, 'veniam officia consequat non aute', false, true, 10, 2370, NULL);
INSERT INTO public.planet VALUES (56, 'Ecosys', 76007, 'esse deserunt culpa sit qui', false, false, 5, 9818, NULL);
INSERT INTO public.planet VALUES (57, 'Motovate', 53131, 'cillum excepteur ea Lorem est', false, false, 7, 5989, NULL);
INSERT INTO public.planet VALUES (58, 'Aquamate', 49391, 'adipisicing id culpa proident culpa', true, false, 5, 3517, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Altair', 73700, 3270, 'pariatur commodo enim aliqua cillum', true, false, 4, NULL);
INSERT INTO public.star VALUES (4, 'Capella', 29354, 1313, 'laborum voluptate dolore laboris exercitation', true, true, 5, NULL);
INSERT INTO public.star VALUES (5, 'Arcturus', 96078, 4531, 'nulla magna fugiat velit reprehenderit', true, true, 3, NULL);
INSERT INTO public.star VALUES (6, 'Praesepe', 14092, 9091, 'dolore consequat aliquip mollit mollit', false, false, 1, NULL);
INSERT INTO public.star VALUES (7, 'Cor Caroli', 10440, 4255, 'sint nisi amet officia et', false, false, 1, NULL);
INSERT INTO public.star VALUES (8, 'Sirius', 18474, 5626, 'cillum incididunt culpa quis dolor', true, true, 2, NULL);
INSERT INTO public.star VALUES (9, 'Procyon', 70005, 8801, 'sit consectetur do consequat aliqua', false, true, 2, NULL);
INSERT INTO public.star VALUES (10, 'Canopus', 74918, 1183, 'excepteur velit cupidatat qui dolor', true, true, 1, NULL);
INSERT INTO public.star VALUES (11, 'Regulus', 42849, 1296, 'laborum labore sint sunt tempor', false, false, 6, NULL);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: other_other_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.other_other_id_seq', 3, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 58, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 11, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: other other_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other
    ADD CONSTRAINT other_name_key UNIQUE (name);


--
-- Name: other other_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other
    ADD CONSTRAINT other_pkey PRIMARY KEY (other_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

