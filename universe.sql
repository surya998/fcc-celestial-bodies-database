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
    name character varying(100) NOT NULL,
    type text NOT NULL,
    size numeric NOT NULL,
    has_black_hole boolean NOT NULL,
    num_stars integer NOT NULL,
    age integer NOT NULL
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
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    diameter numeric NOT NULL,
    is_inhabited boolean NOT NULL,
    planet_id integer,
    distance_from_planet integer NOT NULL,
    age bigint
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
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    radius numeric NOT NULL,
    has_moons boolean NOT NULL,
    star_id integer,
    mass integer NOT NULL,
    distance_from_star integer NOT NULL
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
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    has_planets boolean NOT NULL,
    galaxy_id integer,
    luminosity integer NOT NULL,
    age bigint
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
-- Name: universal_guide; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universal_guide (
    moon_id integer NOT NULL,
    name character varying(40),
    universal_guide_id integer NOT NULL
);


ALTER TABLE public.universal_guide OWNER TO freecodecamp;

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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 100000, true, 200, 13700);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 120000, true, 400, 10000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Irregular', 6000, false, 50, 3000);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Elliptical', 15000, true, 120, 11000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Lenticular', 9000, false, 80, 8900);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 8000, false, 60, 6000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Natural', 3474, false, 1, 0, 4500000000);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Natural', 22.4, false, 2, 0, 4500000000);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Natural', 12.4, false, 2, 0, 4500000000);
INSERT INTO public.moon VALUES (4, 'Europa', 'Natural', 3121.6, false, 3, 1, 4500000000);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Natural', 5268.2, false, 3, 1, 4500000000);
INSERT INTO public.moon VALUES (6, 'Io', 'Natural', 3642.6, false, 3, 0, 4500000000);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Natural', 4820.6, false, 3, 2, 4500000000);
INSERT INTO public.moon VALUES (8, 'Titan', 'Natural', 5149.5, false, 3, 1, 4500000000);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Natural', 504.2, false, 3, 0, 4500000000);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Natural', 396.4, false, 3, 0, 4500000000);
INSERT INTO public.moon VALUES (11, 'Triton', 'Natural', 2706.8, false, 3, 0, 4500000000);
INSERT INTO public.moon VALUES (12, 'Oberon', 'Natural', 1523.4, false, 3, 1, 4500000000);
INSERT INTO public.moon VALUES (13, 'Rhea', 'Natural', 1527.6, false, 3, 1, 4500000000);
INSERT INTO public.moon VALUES (14, 'Iapetus', 'Natural', 1469.4, false, 3, 4, 4500000000);
INSERT INTO public.moon VALUES (15, 'Dione', 'Natural', 1122.8, false, 3, 0, 4500000000);
INSERT INTO public.moon VALUES (16, 'Tethys', 'Natural', 1062.2, false, 3, 0, 4500000000);
INSERT INTO public.moon VALUES (17, 'Miranda', 'Natural', 471.6, false, 3, 0, 4500000000);
INSERT INTO public.moon VALUES (18, 'Ariel', 'Natural', 1157.8, false, 3, 0, 4500000000);
INSERT INTO public.moon VALUES (19, 'Umbriel', 'Natural', 1169.4, false, 3, 0, 4500000000);
INSERT INTO public.moon VALUES (20, 'Titania', 'Natural', 1577.8, false, 3, 0, 4500000000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 6371, true, 1, 5972, 150);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 3389, true, 1, 641, 228);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas Giant', 69911, true, 1, 1898000, 778);
INSERT INTO public.planet VALUES (4, 'Kepler-22b', 'Super-Earth', 12756, false, 2, 10500, 600);
INSERT INTO public.planet VALUES (5, 'Proxima b', 'Terrestrial', 6371, false, 7, 1200, 4);
INSERT INTO public.planet VALUES (6, 'Alpha Centauri Bb', 'Terrestrial', 5869, false, 5, 1130, 7);
INSERT INTO public.planet VALUES (7, 'TRAPPIST-1d', 'Terrestrial', 5800, true, 3, 800, 39);
INSERT INTO public.planet VALUES (8, 'Gliese 581g', 'Super-Earth', 13000, true, 4, 12000, 22);
INSERT INTO public.planet VALUES (9, 'HD 209458 b', 'Gas Giant', 143000, false, 2, 400000, 150);
INSERT INTO public.planet VALUES (10, '55 Cancri e', 'Super-Earth', 10460, false, 3, 8600, 41);
INSERT INTO public.planet VALUES (11, 'Tau Ceti e', 'Super-Earth', 12742, true, 4, 8900, 12);
INSERT INTO public.planet VALUES (12, 'Gliese 667 Cc', 'Super-Earth', 12420, false, 5, 8400, 23);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-Type', true, 1, 1, 4600000000);
INSERT INTO public.star VALUES (2, 'Sirius', 'A-Type', true, 1, 25, 300000000);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'M-Type', true, 2, 126000, 10000000);
INSERT INTO public.star VALUES (4, 'Rigel', 'B-Type', true, 2, 120000, 8000000);
INSERT INTO public.star VALUES (5, 'Alpha Centauri', 'G-Type', true, 3, 1, 4500000000);
INSERT INTO public.star VALUES (6, 'Barnards Star', 'M-Type', false, 4, 0, 7000000000);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 'M-Type', true, 5, 0, 4500000000);
INSERT INTO public.star VALUES (8, 'Vega', 'A-Type', true, 6, 40, 455000000);


--
-- Data for Name: universal_guide; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universal_guide VALUES (1, 'MOON', 1);
INSERT INTO public.universal_guide VALUES (2, 'Phobos', 2);
INSERT INTO public.universal_guide VALUES (3, 'Deimes', 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: universal_guide universal_guide_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universal_guide
    ADD CONSTRAINT universal_guide_moon_id_key UNIQUE (moon_id);


--
-- Name: universal_guide universal_guide_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universal_guide
    ADD CONSTRAINT universal_guide_pkey PRIMARY KEY (universal_guide_id);


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

