--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    number_of_stars double precision,
    distance_from_earth_in_ly double precision,
    mass_in_solar_masses double precision,
    size_in_ly integer,
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
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    mean_radius_in_km double precision,
    surface_area_in_km2 double precision,
    volume_in_km3 double precision,
    mass_in_kg double precision,
    apogee_in_km double precision,
    perigee_in_km double precision,
    semi_major_axis_in_km double precision,
    eccentricity numeric(10,9)
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
-- Name: other; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.other (
    other_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text
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
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    number_of_satellites integer,
    has_life boolean DEFAULT false,
    has_rings boolean DEFAULT false,
    mean_radius_in_km double precision,
    surface_area_in_km2 double precision,
    volume_in_km3 double precision,
    mass_in_kg double precision,
    aphelion_in_au double precision,
    perihelion_in_au double precision,
    semi_major_axis_in_au double precision,
    eccentricity numeric(10,9)
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
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    distance_from_earth_in_ly double precision,
    mass_in_solar_masses numeric(10,5),
    radius_in_solar_radii numeric(10,5),
    description text
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: other other_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other ALTER COLUMN other_id SET DEFAULT nextval('public.other_other_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000000000, 25811, 1150000000000, 87400, 'You are here.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000000000, 2500000, 1500000000000, 152000, 'The girl next door.');
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 20000000000, 163000, 138000000000, 32200, 'The little homie.');
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 40000000000, 2880000, 50000000000, 61120, 'Third in line.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 800000000000, 31100000, 800000000000, 94900, '¡Olé!');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 1000000000000, 21600000, 103000000000, 252000, 'It spins and spins and spins...');
INSERT INTO public.galaxy VALUES (7, 'WHL0137-zD1', NULL, 28000000000, NULL, NULL, 'Distant and nameless, designated only for its child Earendel.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 1737.4, 37930000, 21958000000, 7.346e+22, 405400, 362600, 384399, 0.054900000);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 11.08, 1640, 5695, 1.0638e+16, 9517.58, 9234.42, 9376, 0.015100000);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 6.27, 522, 1033, 1.51e+15, 23470.9, 23455.5, 23463.2, 0.000330000);
INSERT INTO public.moon VALUES (4, 5, 'Ganymede', 2634.1, 87200000, 76600000000, 1.4819e+23, 1071600, 1069200, 1070400, 0.001300000);
INSERT INTO public.moon VALUES (5, 5, 'Callisto', 2410.3, 73050000, 58660000000, 1.075938e+23, 1897000, 1869000, 1882700, 0.007400000);
INSERT INTO public.moon VALUES (6, 5, 'Io', 1821.6, 41698064, 25319060000, 8.931938e+22, 423000, 420000, 421700, 0.004031302);
INSERT INTO public.moon VALUES (7, 5, 'Europa', 1560.8, 30610000, 15930000000, 4.79984e+22, 676938, 664862, 670900, 0.009000000);
INSERT INTO public.moon VALUES (8, 6, 'Titan', 2574.73, 83300000, 71600000000, 1.34518e+23, 1257060, 1186680, 1221870, 0.028800000);
INSERT INTO public.moon VALUES (9, 6, 'Rhea', 763.5, 7325342, NULL, 2.3064854e+21, 527567, 526512, 527040, 0.001000000);
INSERT INTO public.moon VALUES (10, 6, 'Iapetus', 734.4, 6777600, NULL, 1.8056591e+21, 3462252, 3659387, 3560820, 0.027681200);
INSERT INTO public.moon VALUES (11, 6, 'Dione', 561.4, 3964776.51, NULL, 1.0954867999999999e+21, 378226, 376565, 377396, 0.002200000);
INSERT INTO public.moon VALUES (12, 6, 'Tethys', 531.1, NULL, NULL, 6.174959e+20, 294649, 294590, 294619, 0.000100000);
INSERT INTO public.moon VALUES (13, 6, 'Enceladus', 252.1, NULL, NULL, 1.080318e+20, 239180, 236895, 238037, 0.004700000);
INSERT INTO public.moon VALUES (14, 6, 'Mimas', 198.2, 490000, 32600000, 3.75094e+19, 189176, 181902, 185539, 0.019600000);
INSERT INTO public.moon VALUES (15, 6, 'Hyperion', 135, NULL, NULL, 5.551e+18, NULL, NULL, 1481500, 0.105000000);
INSERT INTO public.moon VALUES (16, 7, 'Miranda', 235.8, 698700, 54830000, 6.293e+19, 129558, 129221, 129390, 0.001300000);
INSERT INTO public.moon VALUES (17, 7, 'Ariel', 578.9, 4211300, 812600000, 1.2331000000000001e+21, 191129, 190670, 190900, 0.001200000);
INSERT INTO public.moon VALUES (18, 7, 'Umbriel', 584.7, 4296000, 837300000, 1.2884999999999999e+21, 267037, 264962, 266000, 0.003900000);
INSERT INTO public.moon VALUES (19, 7, 'Titania', 788.4, 7820000, 2054000000, 3.4550000000000003e+21, NULL, NULL, 435910, 0.001100000);
INSERT INTO public.moon VALUES (20, 7, 'Oberon', 761.4, 7285000, 1849000000, 3.1104e+21, NULL, NULL, 583520, 0.001400000);


--
-- Data for Name: other; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.other VALUES (1, 'filler 1', NULL);
INSERT INTO public.other VALUES (2, 'filler 2', NULL);
INSERT INTO public.other VALUES (3, 'filler 3', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 0, false, false, 2439.7, 74800000, 60830000000, 3.3011e+23, 0.466697, 0.307499, 0.387098, 0.205630000);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 0, false, false, 6051.8, 460230000, 928430000000, 4.86731e+24, 0.728213, 0.71844, 0.723332, 0.006772000);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 1, false, false, 6371, 510072000, 1083000000000, 5.97217e+24, 1.017, 0.9833, 1, 0.016708600);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 2, false, false, 3389.5, 144370000, 163118000000, 6.4171e+23, 1.66621, 1.3814, 1.52368055, 0.093400000);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 115, false, false, 69886, 61457000000, 1.4309e+15, 1.898125e+27, 5.457, 4.9506, 5.2038, 0.048900000);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 293, false, false, 58232, 42700000000, 827130000000000, 5.68317e+26, 10.1238, 9.0412, 9.5826, 0.056500000);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 29, false, false, 25362, 8115600000, 68330000000000, 8.68099e+25, 20.0965, 18.2861, 19.19126, 0.047170000);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 16, false, false, 24622, 7618300000, 62540000000000, 1.024092e+26, 30.33, 29.81, 30.07, 0.008678000);
INSERT INTO public.planet VALUES (9, 1, 'Pluto', 5, false, false, 1183.3, 17744430, 7057000000, 1.3025e+22, 49.305, 29.658, 39.482, 0.248800000);
INSERT INTO public.planet VALUES (10, 1, 'Ceres', 0, false, false, 469.7, 2772368, 434000000, 9.38392e+20, NULL, NULL, 2.77, 0.116000000);
INSERT INTO public.planet VALUES (11, 7, 'Proxima Centauri b', NULL, false, false, 5969.94, NULL, NULL, 6.300671e+24, NULL, NULL, 0.04848, NULL);
INSERT INTO public.planet VALUES (12, 7, 'Proxima Centauri d', NULL, false, false, 5160.51, NULL, NULL, 1.552772e+24, NULL, NULL, 0.02881, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 1.58127325e-05, 1.00000, 1.00000, 'The fire that warms the body and soul. The flame that nurtures existence. The eternal engine of life.');
INSERT INTO public.star VALUES (2, 1, 'VY Canis Majoris', 3820, 17.00000, 1420.00000, 'A child''s fascination.');
INSERT INTO public.star VALUES (3, 1, 'Polaris Aa', 446.5, 5.13000, 46.27000, 'A guide for the lost.');
INSERT INTO public.star VALUES (4, 1, 'Sirius A', 8.61, 2.06300, 1.71440, 'Brilliance beyond compare.');
INSERT INTO public.star VALUES (5, 1, 'Betelgeuse', 408, 14.00000, 640.00000, 'Its name thrice repeated would find existence deleted.');
INSERT INTO public.star VALUES (6, 7, 'Earendel', 28000000000, 20.00000, 103.00000, 'The furthest we have ever seen.');
INSERT INTO public.star VALUES (7, 1, 'Proxima Centauri', 4.2465, 0.12210, 0.15420, 'The Sun''s little brother.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: other_other_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.other_other_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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

