\connect postgres

SET statement_timeout = 0;
SET default_transaction_read_only = off;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: hoge; Type: ROLE; Schema: -; Owner: -
--
CREATE ROLE hoge;
ALTER ROLE hoge WITH NOSUPERUSER INHERIT NOCREATEROLE CREATEDB LOGIN NOREPLICATION PASSWORD 'md58545a216a03e1389c3b4cd9bb2023da1';

--
-- Name: example; Type: DATABASE; Schema: -; Owner: hoge
--
CREATE DATABASE example WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'ja_JP.UTF-8' LC_CTYPE = 'ja_JP.UTF-8';
ALTER DATABASE example OWNER TO hoge;

\connect example

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: users; Type: TABLE; Schema: -; Owner: hoge
--
CREATE TABLE users (
    id serial NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(20) NOT NULL,
    phonetic_first_name character varying(60) NOT NULL,
    phonetic_last_name character varying(60) NOT NULL,
    email character varying(128) NOT NULL,
    password character varying(40) NOT NULL,
    birthday date NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone
);
ALTER TABLE public.users OWNER TO hoge;
REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM hoge;
GRANT ALL ON TABLE users TO hoge;
