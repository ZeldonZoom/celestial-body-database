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
-- Name: civilization; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.civilization (
    civilization_id integer NOT NULL,
    name character varying(200) NOT NULL,
    level integer NOT NULL,
    planet_id integer
);


ALTER TABLE public.civilization OWNER TO freecodecamp;

--
-- Name: civilization_civilization_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.civilization_civilization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.civilization_civilization_id_seq OWNER TO freecodecamp;

--
-- Name: civilization_civilization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.civilization_civilization_id_seq OWNED BY public.civilization.civilization_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(200) NOT NULL,
    galaxy_type text,
    number_of_solar_systems integer,
    expansion_rate_in_lightspeed integer,
    diameter_in_lightyear numeric,
    is_type4_civilization boolean,
    has_blackhole boolean NOT NULL
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
    name character varying(200),
    description text,
    mass_in_lunar_mass numeric NOT NULL,
    diameter_in_au integer,
    age_in_millions_of_year integer,
    has_life boolean NOT NULL,
    have_locked_axis boolean,
    planet_id integer
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
    name character varying(200) NOT NULL,
    description text,
    mass_in_solar_mass numeric,
    diameter_in_au integer,
    number_of_satellites integer,
    has_life boolean NOT NULL,
    has_satellites boolean,
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
    name character varying(200) NOT NULL,
    star_type text,
    mass_in_solar_mass numeric NOT NULL,
    diameter_lightyear integer,
    is_host_star boolean,
    is_neutron_star boolean,
    number_of_bounded_celestial_bodies integer,
    galaxy_id integer
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
-- Name: civilization civilization_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization ALTER COLUMN civilization_id SET DEFAULT nextval('public.civilization_civilization_id_seq'::regclass);


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
-- Data for Name: civilization; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.civilization VALUES (1, 'Klingon Empire', 4, 1);
INSERT INTO public.civilization VALUES (2, 'Vulcan Civilization', 3, 2);
INSERT INTO public.civilization VALUES (3, 'Zentari Alliance', 2, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral', 1000000000, 2, 220000.5, false, true);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Spiral', 500000000, 1, 105700.5, false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 400000000, 3, 60000.0, false, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Barred Spiral', 600000000, 2, 30000.2, false, true);
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 'Spiral', 450000000, 4, 50000.8, false, false);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 300000000, 5, 14000.0, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth’s only natural satellite, known for its phases.', 1, 0, 4500, false, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'One of Mars’ two small moons, heavily cratered.', 0.000007, 0, 200, false, true, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars’ smaller moon, with a smoother surface than Phobos.', 0.000004, 0, 200, false, true, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'One of Jupiter’s largest moons, with extreme volcanic activity.', 0.00045, 0, 460, false, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Jupiter’s moon with a possible subsurface ocean beneath its icy crust.', 0.00025, 0, 460, false, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the Solar System, orbiting Jupiter.', 0.0006, 0, 460, false, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Jupiter’s moon with a heavily cratered surface.', 0.00043, 0, 460, false, true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Saturn’s largest moon, known for its thick atmosphere.', 0.00041, 0, 4500, false, true, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Saturn’s second-largest moon, with a thin atmosphere.', 0.00014, 0, 4500, false, true, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'Saturn’s moon known for its striking two-tone coloration.', 0.00012, 0, 4500, false, true, 6);
INSERT INTO public.moon VALUES (11, 'Triton', 'Neptune’s largest moon, known for its retrograde orbit.', 0.00021, 0, 700, false, true, 7);
INSERT INTO public.moon VALUES (12, 'Charon', 'Largest moon of Pluto, notable for its size relative to its planet.', 0.0001, 0, 4500, false, true, 8);
INSERT INTO public.moon VALUES (13, 'Enceladus', 'Saturn’s moon with geysers spewing water ice.', 0.00003, 0, 1000, false, true, 6);
INSERT INTO public.moon VALUES (14, 'Mimas', 'Saturn’s moon with a prominent crater known as Herschel.', 0.00002, 0, 1000, false, true, 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 'One of Uranus’ moons, with a diverse and rugged surface.', 0.00003, 0, 4500, false, true, 8);
INSERT INTO public.moon VALUES (16, 'Ariel', 'Uranus’ moon with a relatively smooth surface.', 0.00004, 0, 4500, false, true, 8);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Uranus’ moon with a darker surface than Ariel.', 0.00002, 0, 4500, false, true, 8);
INSERT INTO public.moon VALUES (18, 'Titania', 'Largest of Uranus’ moons, with a varied surface terrain.', 0.00006, 0, 4500, false, true, 8);
INSERT INTO public.moon VALUES (19, 'Oberon', 'Uranus’ moon with a heavily cratered surface.', 0.00007, 0, 4500, false, true, 8);
INSERT INTO public.moon VALUES (20, 'Tethys', 'Saturn’s moon known for its large impact crater, Odysseus.', 0.0001, 0, 4500, false, true, 6);
INSERT INTO public.moon VALUES (21, 'Dione', 'Saturn’s moon with a mix of bright and dark terrain.', 0.00009, 0, 4500, false, true, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Smallest planet in the Solar System and closest to the Sun.', 0.000017, 0, 0, false, false, 4);
INSERT INTO public.planet VALUES (2, 'Venus', 'Second planet from the Sun with a thick, toxic atmosphere.', 0.0000026, 0, 0, false, false, 4);
INSERT INTO public.planet VALUES (3, 'Earth', 'Third planet from the Sun and the only known planet to support life.', 0.000003, 1, 1, true, true, 4);
INSERT INTO public.planet VALUES (4, 'Mars', 'Fourth planet from the Sun, known as the Red Planet.', 0.00000032, 0, 2, false, true, 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet in the Solar System, a gas giant.', 0.000954, 5, 79, false, true, 4);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas giant known for its prominent ring system.', 0.000285, 9, 83, false, true, 4);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant with a tilted axis of rotation.', 0.000044, 19, 27, false, true, 4);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Furthest ice giant from the Sun with strong winds.', 0.000054, 30, 14, false, true, 4);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', 'Exoplanet located in the habitable zone of its star.', 0.00042, 1, 0, false, false, 2);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 'Closest exoplanet to Earth, orbiting Proxima Centauri.', 0.000013, 0, 0, false, false, 1);
INSERT INTO public.planet VALUES (11, 'PSR B1257+12 B', 'Exoplanet orbiting a pulsar, also known as Poltergeist.', 0.000014, 0, 0, false, false, 5);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 'Potentially habitable exoplanet orbiting a red dwarf.', 0.000031, 0, 0, false, false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 'Red Dwarf', 0.123, 0, true, false, 2, 2);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red Supergiant', 11.6, 0, false, false, 0, 1);
INSERT INTO public.star VALUES (3, 'Vega', 'Main Sequence', 2.1, 0, true, false, 1, 1);
INSERT INTO public.star VALUES (4, 'Sirius A', 'Main Sequence', 2.02, 0, true, false, 1, 2);
INSERT INTO public.star VALUES (5, 'PSR B1919+21', 'Pulsar', 1.4, 0, false, true, 0, 3);
INSERT INTO public.star VALUES (6, 'Rigel', 'Blue Supergiant', 21.0, 0, false, false, 0, 4);


--
-- Name: civilization_civilization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.civilization_civilization_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: civilization civilization_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_name_key UNIQUE (name);


--
-- Name: civilization civilization_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_pkey PRIMARY KEY (civilization_id);


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
-- Name: civilization civilization_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

