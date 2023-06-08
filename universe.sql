--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(30) NOT NULL,
    black_hole_type character varying(30),
    galaxy_id integer
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_milion_years integer,
    is_spiral boolean,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius integer,
    planet_id integer,
    period numeric(5,2)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    avg_temp numeric(4,1),
    color text,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    color character varying(30),
    magnitude numeric(5,1)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', 'Supermassive', 1);
INSERT INTO public.black_hole VALUES (2, 'M87*', 'Supermassive', 2);
INSERT INTO public.black_hole VALUES (3, 'Cygnus X-1', 'Stellar', 3);
INSERT INTO public.black_hole VALUES (4, 'Messier 87-1', 'Intermediate', 2);
INSERT INTO public.black_hole VALUES (5, 'NGC 4526-1', 'Intermediate', 4);
INSERT INTO public.black_hole VALUES (6, 'Centaurus A*', 'Supermassive', 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 2200, true, 'Andromeda is a spiral galaxy located approximately 2.5 million light-years away from Earth.');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 13000, true, 'The Milky Way is a barred spiral galaxy that contains our solar system.');
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 400, true, 'The Whirlpool Galaxy is a spiral galaxy famous for its prominent spiral arms.');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 800, true, 'The Sombrero Galaxy is an unbarred spiral galaxy with a distinctive sombrero-like shape.');
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 12000, true, 'Centaurus A is a peculiar galaxy located in the constellation Centaurus.');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 70, true, 'The Pinwheel Galaxy, also known as M101, is a face-on spiral galaxy in the constellation Ursa Major.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (19, 'Luna 1', 1737, 16, 27.00);
INSERT INTO public.moon VALUES (20, 'Phobos 1', 11, 17, 0.32);
INSERT INTO public.moon VALUES (21, 'Deimos 1', 6, 17, 1.26);
INSERT INTO public.moon VALUES (22, 'Io 1', 1821, 18, 1.77);
INSERT INTO public.moon VALUES (23, 'Europa 1', 1560, 18, 3.55);
INSERT INTO public.moon VALUES (24, 'Ganymede 1', 2634, 18, 7.15);
INSERT INTO public.moon VALUES (25, 'Callisto 1', 2410, 18, 16.69);
INSERT INTO public.moon VALUES (26, 'Titan 1', 2576, 19, 15.95);
INSERT INTO public.moon VALUES (27, 'Rhea 1', 763, 19, 4.52);
INSERT INTO public.moon VALUES (28, 'Iapetus 1', 735, 19, 79.33);
INSERT INTO public.moon VALUES (29, 'Miranda 1', 235, 20, 1.41);
INSERT INTO public.moon VALUES (30, 'Triton 1', 1353, 21, 5.88);
INSERT INTO public.moon VALUES (31, 'Charon 1', 606, 22, 6.39);
INSERT INTO public.moon VALUES (32, 'Ariel 1', 578, 23, 2.52);
INSERT INTO public.moon VALUES (33, 'Umbriel 1', 584, 23, 4.14);
INSERT INTO public.moon VALUES (34, 'Titania 1', 788, 23, 8.71);
INSERT INTO public.moon VALUES (35, 'Oberon 1', 761, 23, 13.46);
INSERT INTO public.moon VALUES (36, 'Triton 2', 1353, 24, 5.88);
INSERT INTO public.moon VALUES (37, 'Proteus 1', 210, 24, 1.12);
INSERT INTO public.moon VALUES (38, 'Nereid 1', 170, 25, 360.13);
INSERT INTO public.moon VALUES (39, 'Charon 2', 606, 26, 6.39);
INSERT INTO public.moon VALUES (40, 'Styx 1', 10, 26, 20.16);
INSERT INTO public.moon VALUES (41, 'Nix 1', 33, 26, 24.85);
INSERT INTO public.moon VALUES (42, 'Kerberos 1', 14, 26, 32.17);
INSERT INTO public.moon VALUES (43, 'Hydra 1', 34, 26, 38.20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (16, 'Mercury', 167.5, 'Gray', false, 1);
INSERT INTO public.planet VALUES (17, 'Venus', 464.0, 'Yellow', false, 1);
INSERT INTO public.planet VALUES (18, 'Earth', 14.0, 'Blue', true, 1);
INSERT INTO public.planet VALUES (19, 'Mars', -63.0, 'Red', false, 2);
INSERT INTO public.planet VALUES (20, 'Jupiter', -108.0, 'Orange', false, 2);
INSERT INTO public.planet VALUES (21, 'Saturn', -139.0, 'Yellow', false, 2);
INSERT INTO public.planet VALUES (22, 'Uranus', -197.0, 'Blue', false, 3);
INSERT INTO public.planet VALUES (23, 'Neptune', -201.0, 'Blue', false, 3);
INSERT INTO public.planet VALUES (24, 'Pluto', -229.0, 'Brown', false, 4);
INSERT INTO public.planet VALUES (25, 'Moon', -20.0, 'Gray', false, 1);
INSERT INTO public.planet VALUES (26, 'Titan', -179.0, 'Orange', false, 2);
INSERT INTO public.planet VALUES (27, 'Europa', -161.0, 'White', false, 3);
INSERT INTO public.planet VALUES (28, 'Ganymede', -163.0, 'Gray', false, 3);
INSERT INTO public.planet VALUES (29, 'Triton', -235.0, 'Pink', false, 3);
INSERT INTO public.planet VALUES (30, 'Eris', -238.0, 'Brown', false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1, 'White', 1.4);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 2, 'Red', -5.1);
INSERT INTO public.star VALUES (3, 'Antares', 3, 'Red', -0.9);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 4, 'Yellow', 4.4);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 4, 'Red', 11.1);
INSERT INTO public.star VALUES (6, 'Polaris', 5, 'Yellow', 2.0);
INSERT INTO public.star VALUES (7, 'Vega', 6, 'Blue', 0.0);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 43, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 30, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: black_hole black_hole_black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

