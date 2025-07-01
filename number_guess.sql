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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    id integer NOT NULL,
    username character varying(22),
    games_played integer,
    best_score integer
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_id_seq OWNER TO freecodecamp;

--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id;


--
-- Name: score_board; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.score_board (
    id integer NOT NULL,
    player_id integer,
    score integer
);


ALTER TABLE public.score_board OWNER TO freecodecamp;

--
-- Name: score_board_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.score_board_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.score_board_id_seq OWNER TO freecodecamp;

--
-- Name: score_board_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.score_board_id_seq OWNED BY public.score_board.id;


--
-- Name: players id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- Name: score_board id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.score_board ALTER COLUMN id SET DEFAULT nextval('public.score_board_id_seq'::regclass);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'C', 1, 11);
INSERT INTO public.players VALUES (3, 'user_1751367329915', 2, 873);
INSERT INTO public.players VALUES (2, 'user_1751367329916', 5, 811);
INSERT INTO public.players VALUES (5, 'user_1751367534955', 2, 57);
INSERT INTO public.players VALUES (4, 'user_1751367534956', 5, 843);


--
-- Data for Name: score_board; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.score_board VALUES (1, 1, 11);
INSERT INTO public.score_board VALUES (2, 2, 739);
INSERT INTO public.score_board VALUES (3, 2, 811);
INSERT INTO public.score_board VALUES (4, 3, 357);
INSERT INTO public.score_board VALUES (5, 3, 873);
INSERT INTO public.score_board VALUES (6, 2, 201);
INSERT INTO public.score_board VALUES (7, 2, 376);
INSERT INTO public.score_board VALUES (8, 2, 505);
INSERT INTO public.score_board VALUES (9, 4, 685);
INSERT INTO public.score_board VALUES (10, 4, 841);
INSERT INTO public.score_board VALUES (11, 5, 57);
INSERT INTO public.score_board VALUES (12, 5, 137);
INSERT INTO public.score_board VALUES (13, 4, 843);
INSERT INTO public.score_board VALUES (14, 4, 532);
INSERT INTO public.score_board VALUES (15, 4, 740);


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_id_seq', 5, true);


--
-- Name: score_board_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.score_board_id_seq', 15, true);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: players players_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_username_key UNIQUE (username);


--
-- Name: score_board score_board_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.score_board
    ADD CONSTRAINT score_board_pkey PRIMARY KEY (id);


--
-- Name: score_board score_board_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.score_board
    ADD CONSTRAINT score_board_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--

