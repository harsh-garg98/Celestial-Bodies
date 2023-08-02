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
-- Name: animals; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.animals (
    animals_id integer NOT NULL,
    terrestrial boolean,
    limbs_num integer,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.animals OWNER TO freecodecamp;

--
-- Name: animals_animal_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.animals_animal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.animals_animal_id_seq OWNER TO freecodecamp;

--
-- Name: animals_animal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.animals_animal_id_seq OWNED BY public.animals.animals_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    constellation text,
    apparent_magnitude numeric(5,1),
    distance_from_earth_kly integer
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
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    orbit_days numeric(10,2),
    has_atmosphere boolean
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    has_life boolean,
    planet_type text,
    num_moons integer
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    age_billion_years numeric(10,5),
    visible_from_earth boolean,
    num_planets integer
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
-- Name: animals animals_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.animals ALTER COLUMN animals_id SET DEFAULT nextval('public.animals_animal_id_seq'::regclass);


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
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.animals VALUES (1, true, 4, 'Human', 19);
INSERT INTO public.animals VALUES (2, false, 8, 'Octopus', 19);
INSERT INTO public.animals VALUES (3, true, 4, 'Cat', 19);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 'Sagittarius', -6.5, 0);
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 2, 'Dorado/Mensa', 0.9, 160);
INSERT INTO public.galaxy VALUES ('Small Magellanic Cloud', 3, 'Tucana', 2.7, 200);
INSERT INTO public.galaxy VALUES ('Andromeda Galaxy', 4, 'Andromeda', 3.4, 2500);
INSERT INTO public.galaxy VALUES ('Triangulum Galaxy', 5, 'Triangulum', 5.7, 2900);
INSERT INTO public.galaxy VALUES ('Centaurus A', 6, 'Centaurus', 6.8, 13700);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 4, 19, 27.00, false);
INSERT INTO public.moon VALUES ('Phobos', 5, 20, 0.33, false);
INSERT INTO public.moon VALUES ('Deimos', 6, 20, 1.25, false);
INSERT INTO public.moon VALUES ('Io', 7, 21, 1.77, false);
INSERT INTO public.moon VALUES ('Europa', 8, 21, 3.55, false);
INSERT INTO public.moon VALUES ('Ganymede', 9, 21, 7.25, true);
INSERT INTO public.moon VALUES ('Callisto', 10, 21, 16.70, false);
INSERT INTO public.moon VALUES ('Amalthea', 11, 21, 0.49, false);
INSERT INTO public.moon VALUES ('Titan', 12, 22, 15.95, true);
INSERT INTO public.moon VALUES ('Rhea', 13, 22, 4.52, true);
INSERT INTO public.moon VALUES ('Enceladus', 14, 22, 1.37, true);
INSERT INTO public.moon VALUES ('Dione', 15, 22, 2.73, true);
INSERT INTO public.moon VALUES ('Tethys', 16, 22, 1.88, true);
INSERT INTO public.moon VALUES ('Titania', 17, 23, 8.70, true);
INSERT INTO public.moon VALUES ('Oberon', 18, 23, 13.46, true);
INSERT INTO public.moon VALUES ('Ariel', 19, 23, 21.29, true);
INSERT INTO public.moon VALUES ('Triton', 20, 24, 5.88, true);
INSERT INTO public.moon VALUES ('Nereid', 21, 24, 360.13, false);
INSERT INTO public.moon VALUES ('Proteus', 22, 24, 11.56, false);
INSERT INTO public.moon VALUES ('Charon', 23, 25, 6.39, true);
INSERT INTO public.moon VALUES ('Nix', 24, 25, 24.86, false);
INSERT INTO public.moon VALUES ('Hydra', 25, 25, 28.98, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 17, 1, false, 'Rocky', 0);
INSERT INTO public.planet VALUES ('Venus', 18, 1, false, 'Rocky', 0);
INSERT INTO public.planet VALUES ('Earth', 19, 1, true, 'Rocky', 1);
INSERT INTO public.planet VALUES ('Mars', 20, 1, false, 'Rocky', 2);
INSERT INTO public.planet VALUES ('Jupiter', 21, 1, false, 'Gas', 80);
INSERT INTO public.planet VALUES ('Saturn', 22, 1, false, 'Gas', 145);
INSERT INTO public.planet VALUES ('Uranus', 23, 1, false, 'Gas', 27);
INSERT INTO public.planet VALUES ('Neptune', 24, 1, false, 'Gas', 14);
INSERT INTO public.planet VALUES ('Pluto', 25, 1, false, 'Dwarf', 5);
INSERT INTO public.planet VALUES ('Trappist-1b', 26, 7, false, 'Rocky', 0);
INSERT INTO public.planet VALUES ('Trappist-1c', 27, 7, false, 'Rocky', 0);
INSERT INTO public.planet VALUES ('Trappist-1d', 28, 7, false, 'Rocky', 0);
INSERT INTO public.planet VALUES ('Trappist-1e', 29, 7, false, 'Rocky', 0);
INSERT INTO public.planet VALUES ('Trappist-1f', 30, 7, false, 'Rocky', 0);
INSERT INTO public.planet VALUES ('Trappist-1g', 31, 7, false, 'Rocky', 0);
INSERT INTO public.planet VALUES ('Trappist-1h', 32, 7, false, 'Rocky', 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 1, 4.60000, true, 9);
INSERT INTO public.star VALUES ('S Doradus', 2, 2, NULL, false, 0);
INSERT INTO public.star VALUES ('HV 2112', 3, 3, 0.00100, false, 0);
INSERT INTO public.star VALUES ('Beta Trianguli', 5, 5, 0.10000, true, 0);
INSERT INTO public.star VALUES ('Eta Carinae', 6, 6, 0.00350, false, 0);
INSERT INTO public.star VALUES ('Alpha Andromedae', 4, 4, 0.05000, false, 0);
INSERT INTO public.star VALUES ('TRAPPIST-1', 7, 1, 7.50000, false, 7);


--
-- Name: animals_animal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.animals_animal_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 32, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: animals animals_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (animals_id);


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
-- Name: animals uc_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT uc_name UNIQUE (name);


--
-- Name: animals animals_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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


